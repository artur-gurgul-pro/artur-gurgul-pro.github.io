---
layout: post
title:  "[draft] S.O.L.I.D. principles"
date:   2016-10-19 12:09:07 +0200
categories: swift solid
---

* https://www.youtube.com/watch?v=gwIS9cZlrhk

SOLID is a set of principles that helps you to keep your code more modular, more testable, and easier to extend. 

### Single responsibility principle

This mean if the one thing in specification is changed you only need to change the code in the single place or class

### Open/closed principle

Software entities should be open for extension, but closed for modification.

### Liskov substitution principle

Objects in a program should be replaceable with instances of their subtypes without altering the correctness of that program.

### Interface segregation principle

The interfaces should be small and provide as little methods as possible.

### Dependency inversion principle

The lower module mast not depends on higher module. In order to achieve this the code mast to relay on abstractions (in other words the code has to use interfaces/protocols)

# The uncle Bob's example [[1]](https://www.youtube.com/watch?v=TMuno5RZNeE)


Warning it is the code for people with strong nerve system. It might cause nightmares, so be careful with the samples:

{% highlight swift %}

{% endhighlight %}

Another rules that not belongs to SOLID, but still worth to mention is KISS and DRY

[Package principles](https://en.wikipedia.org/wiki/Package_principles)
[List of princilpes](https://en.wikipedia.org/wiki/List_of_software_development_philosophies)
[You aren't gonna need it](https://en.wikipedia.org/wiki/You_aren't_gonna_need_it)

[google]: http://www.google.com  "Google it!"

