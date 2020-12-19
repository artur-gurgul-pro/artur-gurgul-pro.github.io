---
layout: post
title:  Golang bridging
date:   2016-10-19 12:09:07 +0200
categories: golang bridging
---

The Go compiler is capable of linking with static and dynamic libraries, and there is possbility to create static and dynamic library.

### Creating shared and static library in Go

Here is an example. File `example.go`:

	package main
    
	import (
	        "C"
	        "fmt"
	)
    
	//export SayHello
	func SayHello(hello *C.char) {
	        fmt.Print(C.GoString(hello))
	}
    
	func main() {}

and `Makefile`

	static test.a:
		go build -o test.a -buildmode=c-archive example.go
    
	shared test.so: 
		go build -o test.so -buildmode=c-shared example.go


As far as I understand main function is neccecery to include into library, becouse the compiler attached GC and another neccecry rutines to bibrary. The comment starting from `//export ` tells the comiler that this the function will be called from the outside.

#### Example of using library with FFI

    gem install ffi

    require 'ffi'
    module Example
	  extend FFI::Library
	  ffi_lib './test.so'
	  attach_function :SayHello, [:string]
	end
	
	Example.SayHello("Hello")
	

More informations about FFI https://en.wikipedia.org/wiki/Foreign_function_interface

### Loading dynamic library in Go

File `example.cxx`:

	#include <stdio.h>
    
	extern "C" {
    
	void PrintHello(const char* u) {
	    printf("Hello: %s\n", u);
	}
    
	} // extern "C"

And `example.hxx:

    #pragma once
    
    void PrintHello(const char* u)
   
extern "C" {} informs the compiler that we want the function names to be preserved. That is, to not "mangle" the names as is done for C++ code.

Command for building a library `clang++ -dynamiclib  -o example.dylib example.cxx`

Now we have created a library (it probably should be c lib?)

Now I am trying to call the library function `PrintHello` (but it dont work)

    package example
    
    // #cgo LDFLAGS: -L./ -lexample
    //
    // #include "example.hxx"
    // extern void PrintHello(const char* u);
    import "C"
	
    func main() {
        C.PrintHello(C.CString("Golanger"))
    }

    # It worked, it can call also function written in Golang
	import ctypes
	libc = ctypes.CDLL('./example.dylib')
    
	libc.PrintHello("Hello")
### Go and ruby


