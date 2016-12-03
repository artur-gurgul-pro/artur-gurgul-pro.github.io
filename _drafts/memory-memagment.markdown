---
layout: post
title:  "[draft] Memory menagment"
date:   2016-10-19 12:09:07 +0200
categories: swift
---

###  MRC - manual reference counter

A MRC is the most early mechanism for memory management that we can use on iOS platform. Everyting is contentrated araund `retainCount` according to which the system knows when to release the memory. To manipulate this counter we use the `retain` for increasing and `release` for decreasing. 

Basically when the `retainCount` of `X` object is equal to 0 that means no other object uses `X` object and `X` object can be remove from the memory.

{% highlight objc %}
NSURL *url = [NSURL URLWithString:@"www.google.com"]; // (1)
[_url release]; // (2)
self.url = url; // (3)
{% endhighlight %}

1. This object has been created and iderded into autorelease pool (see next topic)
2. Here we tell the system that we do not need old object anymore so the retail counter is going to be decresead. If no other entity keeps reperence to this object the retain counter should be equal to 0 and the object has to be removed from the memory.
3. This is a little bit tricky part for newers. When we call `self dot someting` the release on the assging object will be called automatically. If we assign the new obhject right away we are going to lose the reference to the old object and we will have no chanfe to release it from the memory.

#### Memory leaks and bad access 
* Too many retains or retains cycles. Even if the project uses ARC there is possibility to leaks by keeping strong references to each others by two objects.

* Too many releases. When hetod is called to the object which has been already dealocated we will face the `bad accsess`. For debugging purpose we can set up `NSZombie`. This will replace each dealocated object witch placeholder wchich throws exceptions each time then any metchod is called.

#### Autorelease Pool

Autorelease Pool is just a collection of objects for which the release is deferred until the pool is drained. Pools don't control whether something is deallocated or not, but rather merely the timing of such deallocation [(1)](http://stackoverflow.com/questions/25860942/is-it-necessary-to-use-autoreleasepool-in-a-swift-program). In swift we still need to care about this mechanism becouse we still deal with libraries written in `Objc`.

### ARC - Automatic reference counter
Does arc manage releases/retains in runtime or compiler cares about it

* Why all drawing has to be done on the main theread

### Copy on write
* https://www.youtube.com/watch?v=eVajQPuRmk8



