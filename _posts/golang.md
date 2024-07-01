https://rafallorenz.com/go/go-http-stream-download/
https://karthikkaranth.me/blog/calling-c-code-from-go/

```go
func downloadHandler(w http.ResponseWriter, r *http.Request) {
	resp, err := http.Get("https://golangcode.com/logo.svg")
	if err != nil {
		http.Error(w, 
				   "could not write response",
				   http.StatusInternalServerError)
		return
	}
	defer resp.Body.Close()

  

	w.Header()
	 .Set("Content-Disposition", 
	      fmt.Sprintf("attachment; filename=%s", "logo.svg"))

// w.Header().Set("Content-Type", "image/svg+xml")

// w.Header().Set("Last-Modified", time.Now().UTC().Format(http.TimeFormat))

  

// n, err := io.Copy(w, resp.Body)

// if err != nil {

// http.Error(w, "could not read body", http.StatusInternalServerError)

// return

// }

//}
```


```
func downloadFile(filepath string, url string) {
out, err := os.Create(filepath)
defer out.Close()

resp, err := http.Get(url)
defer resp.Body.Close()
// Check server response
if resp.StatusCode != http.StatusOK {
fmt.Print("bad status: %s", resp.Status)
}

// _, err = io.Copy(out, resp.Body)
// if err != nil {
// fmt.Print("Error : %s", err)
// }
//ch := make(chan byte, 5)

buffer := make([]byte, 5)
reader := bzip2.NewReader(resp.Body)

num, err := reader.Read(buffer)
fmt.Print("Rewad %d: %s ", num, string(buffer))

if err != nil {
fmt.Print("Error : %s", err)
}
}
```


```
var bz2Buf bytes.Buffer

// Create a new Bzip2 writer

w, err := bzip2.NewWriter(&bz2Buf, &bzip2.WriterConfig{Level: bzip2.BestCompression})

if err != nil {

log.Fatalf("Failed to create Bzip2 writer: %v", err)

}
```