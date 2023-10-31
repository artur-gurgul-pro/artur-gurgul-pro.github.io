---
layout: post
title:  Example objects
date:   2016-10-19 12:09:07 +0200
categories: programming
---


Project written in X lang &rarr; compile to static/dynamic library &rarr; call the library from lang Y

### Creating shared and static library in Go

An example code that is shared [`example.go`](https://github.com/artur-gurgul/codebook):

``` go
package main

import "C"
import "fmt"

//export SayHello
func SayHello(hello *C.char) {
		fmt.Print(C.GoString(hello))
}

func main() {}
```

Creating static library

```
go build -o example.a -buildmode=c-archive example.go
```

Creating dynamic library

```
go build -o example.dylib -buildmode=c-shared example.go
```



As far as I understand the main function is neccecery to include into library, because the final product has to have for example the GC rutines. The comment starting from `//export {function name}` tells the comiler that this the function will be called from the outside.

![alt text](/svgs/test-graph.svg){:.center-image}

Inline:

<p>
 {% svg ../svgs/test-graph.svg width="401px" class="center-image" %}
</p>

{% highlight c++ %}
#pragma once
void PrintHello(const char* u)
{% endhighlight %}

| Syntax      | Description | Test  Text     |
| :---        |    :----:   |          ---: |
| Header      | Title       | - Here's this   |
| Paragraph   | Text        | And more `code`     |

### Calling functrion from library in Go

First off we will create C++ library that we will use in out Go program.
File `example.cxx`:

{% highlight c++ %}
#include <stdio.h>

extern "C" {

void PrintHello(const char* u) {
    printf("Hello: %s\n", u);
}

}
{% endhighlight %}

And `example.hxx`:

{% highlight c++ %}
#pragma once
void PrintHello(const char* u)
{% endhighlight %}

`extern "C" {}` informs the compiler that we want the function names to be preserved. That is, to not "mangle" the names as is done for C++ code.
`Makefile`:

{% highlight make %}
static example.a:
	clang++ -c -Wall -o lib.o ./example.cxx
	ar rc ./libexample.a ./lib.o
shared example.dylib:
	clang++ -dynamiclib -o libexample.dylib example.cxx
{% endhighlight %}


#### Statically linking an example library 

{% highlight go %}
package main

// #cgo CFLAGS: -I.
// #cgo LDFLAGS: -L. -lexample
//
// #include <example.hxx>
import "C"

func main() {
	C.PrintHello(C.CString("Hello Golang"))
}
{% endhighlight %}

The program is linked staticaly with libexample when you build it.

#### Example of using library with FFI

{% highlight shell %}
gem install ffi
{% endhighlight %}

{% highlight ruby %}
require 'ffi'
module Example
  extend FFI::Library
  ffi_lib './example.dylib'
  attach_function :SayHello, [:string]
end

Example.SayHello("Hello")
{% endhighlight %}

More informations about FFI: https://en.wikipedia.org/wiki/Foreign_function_interface

#### Call shared library from Python

{% highlight python %}
import ctypes
libc = ctypes.CDLL('./example.dylib')
libc.SayHello("Hello")
{% endhighlight %}

## Interesting websites

- https://blog.filippo.io/building-python-modules-with-go-1-5/
- https://id-rsa.pub/post/go15-calling-go-shared-libs-from-firefox-addon/