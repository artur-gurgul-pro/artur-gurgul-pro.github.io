https://stackoverflow.com/questions/3912157/how-do-i-extract-all-the-data-from-a-bzip2-archive-with-c

```c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <bzlib.h>

int
bunzip_one(FILE *f) {
  int bzError;
  BZFILE *bzf;
  char buf[4096];

  bzf = BZ2_bzReadOpen(&bzError, f, 0, 0, NULL, 0);
  if (bzError != BZ_OK) {
    fprintf(stderr, "E: BZ2_bzReadOpen: %d\n", bzError);
    return -1;
  }

  while (bzError == BZ_OK) {
    int nread = BZ2_bzRead(&bzError, bzf, buf, sizeof buf);
    if (bzError == BZ_OK || bzError == BZ_STREAM_END) {
      size_t nwritten = fwrite(buf, 1, nread, stdout);
      if (nwritten != (size_t) nread) {
        fprintf(stderr, "E: short write\n");
        return -1;
      }
    }
  }

  if (bzError != BZ_STREAM_END) {
    fprintf(stderr, "E: bzip error after read: %d\n", bzError);
    return -1;
  }
```


```sh
$ echo hello > hello
$ echo world > world
$ bzip2 hello
$ bzip2 world
$ cat hello.bz2 world.bz2 > helloworld.bz2
$ gcc -W -Wall -Os -o bunz bunz.c -lbz2
$ ls -l *.bz2
-rw-r--r-- 1 roland None 42 Oct 12 09:26 hello.bz2
-rw-r--r-- 1 roland None 86 Oct 12 09:36 helloworld.bz2
-rw-r--r-- 1 roland None 44 Oct 12 09:26 world.bz2
$ ./bunz.exe helloworld.bz2 
hello
world
```



https://github.com/libexpat/libexpat/blob/master/expat/examples/outline.c











```c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <curl/curl.h>

// This function will be called to write the response data chunk by chunk
size_t write_callback(void *ptr, size_t size, size_t nmemb, void *userdata) {
    size_t total_size = size * nmemb;

    // Cast userdata to a FILE pointer
    FILE *file = (FILE *)userdata;

    // Write the data to the file
    fwrite(ptr, size, nmemb, file);

    // Return the total number of bytes written
    return total_size;
}

int main(void) {
    CURL *curl;
    CURLcode res;

    // Initialize a libcurl session
    curl = curl_easy_init();
    if(curl) {
        // Open a file to write the response data to
        FILE *file = fopen("output.txt", "wb");
        if(!file) {
            perror("Unable to open file for writing");
            return 1;
        }

        // Set the URL for the GET request
        curl_easy_setopt(curl, CURLOPT_URL, "http://www.example.com");

        // Set the callback function to handle the response data
        curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, write_callback);

        // Pass the file pointer to the callback function
        curl_easy_setopt(curl, CURLOPT_WRITEDATA, file);

        // Perform the request, res will get the return code
        res = curl_easy_perform(curl);

        // Check for errors
        if(res != CURLE_OK) {
            fprintf(stderr, "curl_easy_perform() failed: %s\n", curl_easy_strerror(res));
        }

        // Close the file
        fclose(file);

        // Clean up the libcurl session
        curl_easy_cleanup(curl);
    }
    return 0;
}

```









      brew install nim

```nim
#proc curl_easy_init*(): cvoid {.importc, dynlib: "libcurl".}

#proc curl_easy_init*(): pointer {.importc, dynlib: "libcurl".}

proc curl_easy_init*(): pointer {.header: "<curl/curl.h>".}
```


```
# nim c -r main.nim
# nimble install nimrepl
# nim secret
# nim c --passL:"-lcurl" main.nim


# start must be imported
# from request import start, Request
   # same as :
import Request
```