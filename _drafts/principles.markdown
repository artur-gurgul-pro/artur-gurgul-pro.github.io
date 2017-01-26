---
layout: post
title:  "Principles"
date:   2016-10-19 12:09:07 +0200
categories: swift
---

* https://www.youtube.com/watch?v=gwIS9cZlrhk


# S.O.L.I.D

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

# Another rules that doesn't belong to SOLID
But still worth to mention

* KISS - Keep it simple stupid. Twisted and difficult to understand code is a source of all trouble with keeping progress in the development process. The new person to the project might spend long time till he understand what's going on in the project, and even then he does, he has a problem with extending the logic. "You should keep everything as simple as possible but not simpler"
* DRY - Do not repeat yourself. When you do the code according to SOLID principles you should not have any problems with this one as well. This rule helps solve the problem when you need to change something in the logic that is repeated in the project over and over. The principle is similar to SRP form SOLID
* YAGNI - [You aren't gonna need it](https://en.wikipedia.org/wiki/You_aren't_gonna_need_it) The longer you work with the project the more you know about it, so it is wise to postpone as many actions as possible in order to make better decision in the future (later on).
[Package principles](https://en.wikipedia.org/wiki/Package_principles)
[List of princilpes](https://en.wikipedia.org/wiki/List_of_software_development_philosophies)


[google]: http://www.google.com  "Google it!"
