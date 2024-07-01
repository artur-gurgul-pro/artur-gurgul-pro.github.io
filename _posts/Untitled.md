```go

package main

import (
    "context"
    "crypto/tls"
    "database/sql"
    "encoding/json"
    "fmt"
    "html/template"
    "log"
    "net/http"
    "os"
    "sync"
    "time"

    "github.com/fsnotify/fsnotify"
    "github.com/gorilla/mux"
    "github.com/gorilla/sessions"
    "github.com/gorilla/websocket"
    "github.com/jackc/pgx/v4/pgxpool"
    "golang.org/x/crypto/bcrypt"
)

type Data struct {
    Message string `json:"message"`
    Count   int    `json:"count"`
}

type PageData struct {
    Title   string
    Header  string
    Message string
}

var (
    upgrader = websocket.Upgrader{
        ReadBufferSize:  1024,
        WriteBufferSize: 1024,
        CheckOrigin: func(r *http.Request) bool {
            return true // In production, you should implement proper origin checks
        },
    }
    dbPool *pgxpool.Pool
    store  = sessions.NewCookieStore([]byte("super-secret-key"))
    certs  = make(map[string]*tls.Certificate)
    mu     sync.RWMutex
)

func main() {
    var err error
    dbPool, err = pgxpool.Connect(context.Background(), os.Getenv("DATABASE_URL"))
    if err != nil {
        log.Fatalf("Unable to connect to database: %v\n", err)
    }
    defer dbPool.Close()

    router := mux.NewRouter()
    router.HandleFunc("/", serveTemplate)
    router.HandleFunc("/api/data", authMiddleware(apiData))
    router.HandleFunc("/ws", authMiddleware(handleWebSocket))
    router.HandleFunc("/register", register)
    router.HandleFunc("/login", login)

    // Load initial certificates
    loadCertificates()

    // Watch for certificate changes
    go watchCertificates()

    // Create a TLS configuration
    tlsConfig := &tls.Config{
        GetCertificate: func(info *tls.ClientHelloInfo) (*tls.Certificate, error) {
            mu.RLock()
            defer mu.RUnlock()
            if cert, ok := certs[info.ServerName]; ok {
                return cert, nil
            }
            return nil, fmt.Errorf("no certificate found for %s", info.ServerName)
        },
    }

    srv := &http.Server{
        Addr:      ":443",
        Handler:   router,
        TLSConfig: tlsConfig,
    }

    fmt.Println("Starting server on :443")
    err = srv.ListenAndServeTLS("", "")
    if err != nil {
        fmt.Println("Error starting server:", err)
    }
}

func loadCertificates() {
    domains := []string{"yourdomain1.com", "yourdomain2.com"}
    for _, domain := range domains {
        cert, err := tls.LoadX509KeyPair(fmt.Sprintf("/etc/letsencrypt/live/%s/fullchain.pem", domain), fmt.Sprintf("/etc/letsencrypt/live/%s/privkey.pem", domain))
        if err != nil {
            log.Printf("Error loading certificate for %s: %v", domain, err)
            continue
        }
        mu.Lock()
        certs[domain] = &cert
        mu.Unlock()
    }
}

func watchCertificates() {
    watcher, err := fsnotify.NewWatcher()
    if err != nil {
        log.Fatalf("Error creating file watcher: %v", err)
    }
    defer watcher.Close()

    domains := []string{"yourdomain1.com", "yourdomain2.com"}
    for _, domain := range domains {
        err = watcher.Add(fmt.Sprintf("/etc/letsencrypt/live/%s", domain))
        if err != nil {
            log.Printf("Error adding watcher for %s: %v", domain, err)
        }
    }

    for {
        select {
        case event, ok := <-watcher.Events:
            if !ok {
                return
            }
            if event.Op&fsnotify.Write == fsnotify.Write || event.Op&fsnotify.Create == fsnotify.Create {
                log.Printf("Modified file: %s", event.Name)
                loadCertificates()
            }
        case err, ok := <-watcher.Errors:
            if !ok {
                return
            }
            log.Printf("Watcher error: %v", err)
        }
    }
}

func serveTemplate(w http.ResponseWriter, r *http.Request) {
    pageData := PageData{
        Title:   "API Example",
        Header:  "API Data",
        Message: "Welcome to the API Example!",
    }

    tmpl := template.Must(template.ParseFiles(
        "templates/base.html",
        "templates/header.html",
        "templates/footer.html",
        "templates/index.html",
    ))
    tmpl.ExecuteTemplate(w, "base", pageData)
}

func apiData(w http.ResponseWriter, r *http.Request) {
    if !isAuthenticated(r) {
        http.Error(w, "Forbidden", http.StatusForbidden)
        return
    }

    data := Data{
        Message: "Hello, World!",
        Count:   42,
    }
    w.Header().Set("Content-Type", "application/json")
    json.NewEncoder(w).Encode(data)
}

func handleWebSocket(w http.ResponseWriter, r *http.Request) {
    conn, err := upgrader.Upgrade(w, r, nil)
    if err != nil {
        fmt.Println("Error upgrading connection:", err)
        return
    }
    defer conn.Close()

    for {
        messageType, p, err := conn.ReadMessage()
        if err != nil {
            fmt.Println("Error reading message:", err)
            return
        }
        fmt.Printf("Received: %s\n", p)
        if err := conn.WriteMessage(messageType, p); err != nil {
            fmt.Println("Error writing message:", err)
            return
        }
    }
}

func register(w http.ResponseWriter, r *http.Request) {
    if r.Method != http.MethodPost {
        http.Error(w, "Method not allowed", http.StatusMethodNotAllowed)
        return
    }

    username := r.FormValue("username")
    password := r.FormValue("password")

    if username == "" || password == "" {
        http.Error(w, "Username and password are required", http.StatusBadRequest)
        return
    }

    passwordHash, err := bcrypt.GenerateFromPassword([]byte(password), bcrypt.DefaultCost)
    if err != nil {
        http.Error(w, "Internal server error", http.StatusInternalServerError)
        return
    }

    _, err = dbPool.Exec(context.Background(), "INSERT INTO users (username, password_hash) VALUES ($1, $2)", username, passwordHash)
    if err != nil {
        http.Error(w, "Internal server error", http.StatusInternalServerError)
        return
    }

    w.WriteHeader(http.StatusCreated)
}

func login(w http.ResponseWriter, r *http.Request) {
    if r.Method != http.MethodPost {
        http.Error(w, "Method not allowed", http.StatusMethodNotAllowed)
        return
    }

    username := r.FormValue("username")
    password := r.FormValue("password")

    if username == "" || password == "" {
        http.Error(w, "Username and password are required", http.StatusBadRequest)
        return
    }

    var passwordHash string
    err := dbPool.QueryRow(context.Background(), "SELECT password_hash FROM users WHERE username=$1", username).Scan(&passwordHash)
    if err != nil {
        if err == sql.ErrNoRows {
            http.Error(w, "Invalid username or password", http.StatusUnauthorized)
            return
        }
        http.Error(w, "Internal server error", http.StatusInternalServerError)
        return
    }

    err = bcrypt.CompareHashAndPassword([]byte(passwordHash), []byte(password))
    if err != nil {
        http.Error(w, "Invalid username or password", http.StatusUnauthorized)
        return
    }

    session, _ := store.Get(r, "session")
    session.Values["authenticated"] = true
    session.Save(r, w)

    w.WriteHeader(http.StatusOK)
}

func authMiddleware(next http.HandlerFunc) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        if !isAuthenticated(r) {
            http.Error(w, "Forbidden", http.StatusForbidden)
            return
        }
        next(w, r)
    }
}

func isAuthenticated(r *http.Request) bool {
    session, _ := store.Get(r, "session")
    auth, ok := session.Values["authenticated"].(bool)
    return ok && auth
}

```