---
layout: post
title:  "[draft] Memory menagment"
date:   2016-10-19 12:09:07 +0200
categories: swift
---

###  MRC - manual reference counter

The `retain` and `release` increase and decrease reference count. This is a system that keep track of objects and release them from the memory when no other object keep reperence to them. Lets takt this example 

{% highlight objective-c %}
NSURL *url = [NSURL URLWithString:@"www.google.com"];
[_url release];
self.url = url
{% endhighlight %}

#### Autorelease Pool

Autorelease Pool is just a collection of objects for which the release is deferred until the pool is drained. Pools don't control whether something is deallocated or not, but rather merely the timing of such deallocation [(1)](http://stackoverflow.com/questions/25860942/is-it-necessary-to-use-autoreleasepool-in-a-swift-program). In swift we still need to care about this mechanism becouse we still deal with libraries written in `Objc`.

### ARC - Automatic reference counter
Does arc manage releases/retains in runtime or compiler cares about it

* Why all drawing has to be done on the main theread

### Copy on write
* https://www.youtube.com/watch?v=eVajQPuRmk8



