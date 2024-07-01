https://vikunja.io/


https://iredmail.org/download.html



```go
cfg := &tls.Config{}

cert, err := tls.LoadX509KeyPair("cert_one.pem", "key_one.pem")
if err != nil {
    log.Fatal(err)
}

cfg.Certificates = append(cfg.Certificates, cert)
// keep adding remaining certs to cfg.Certificates

cfg.BuildNameToCertificate()

server := http.Server{
    Addr:      "127.0.0.1:443",
    Handler:   myHandler,
    TLSConfig: cfg,
}

server.ListenAndServeTLS("", "")
```