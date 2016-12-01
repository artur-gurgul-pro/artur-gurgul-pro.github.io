---
layout: post
title:  "[draft] Functional programming"
date:   2016-10-19 12:09:07 +0200
categories: swift functional-programming
---

# observable vs interator

# Functors
* [Stack overflow discussion about Functors](http://stackoverflow.com/questions/2030863/in-functional-programming-what-is-a-functor)



* Prmises: https://www.youtube.com/watch?v=s6SH72uAn3Q

  .


* [Difference between Reactive and Event driven programming](http://stackoverflow.com/questions/34495117/how-is-reactive-programming-different-than-event-driven-programming)

* [Example from the documentation how ui bindings work](https://github.com/ReactiveX/RxSwift/blob/master/Documentation/Examples.md)
* [Explanation on quora what Functor is](https://www.quora.com/Functional-Programming-What-is-a-functor)
* [An example how to make UITableView reactive](https://github.com/ReactiveX/RxSwift/blob/master/RxExample/RxExample/Examples/SimpleTableViewExample/SimpleTableViewExampleViewController.swift)


# High order functions
* `map` vs `flatMap`
  * Works almost the same, the difference is that the `map` transworm one item from the stream to silnge item, however `flatMap` procudes 0 or more items for a single item from the stream


# Pure functions


## Curring (The code copied from a `Prelude` library)

* Curring: https://robots.thoughtbot.com/introduction-to-function-currying-in-swift

Curring is a technigue that allows to execute 

{% highlight swift %}
public func curry<T, U, V>(f: (T, U) -> V) -> T -> U -> V {
    return { x in { f(x, $0)   }   }
}

public func curry<T, U, V, W>(f: (T, U, V) -> W) -> T -> U -> V -> W {
    return { x in curry { f(x, $0, $1) } }
}

public func uncurry<T, U, V>(f: T -> U -> V) -> (T, U) -> V {
    return { f($0)($1) }
}

public func uncurry<T, U, V, W>(f: T -> U -> V -> W) -> (T, U, V) -> W {
    return { f($0)($1)($2) }
}
{% endhighlight %}
