---
layout: post
title:  "Functional programming"
date:   2016-10-19 12:09:07 +0200
categories: swift functional-programming
---

# Functional programming
* Functor

* Prmises: https://www.youtube.com/watch?v=s6SH72uAn3Q
* `map` vs `flatMap`
  * Works almost the same, the difference is that the `map` transworm one item from the stream to silnge item, however `flatMap` procudes 0 or more items for a single item from the stream
  .
* Curring: https://robots.thoughtbot.com/introduction-to-function-currying-in-swift

* [Difference between Reactive and Event driven programming](http://stackoverflow.com/questions/34495117/how-is-reactive-programming-different-than-event-driven-programming)
* [Stack overflow discussion about Functors](http://stackoverflow.com/questions/2030863/in-functional-programming-what-is-a-functor)
* [Example from the documentation how ui bindings work](https://github.com/ReactiveX/RxSwift/blob/master/Documentation/Examples.md)
* [Explanation on quora what Functor is](https://www.quora.com/Functional-Programming-What-is-a-functor)
* [An example how to make UITableView reactive](https://github.com/ReactiveX/RxSwift/blob/master/RxExample/RxExample/Examples/SimpleTableViewExample/SimpleTableViewExampleViewController.swift)

Filter function we will use for filtering
{% highlight swift %}
func isPrime(number: Int) -> Bool {
    if number < 3 {
        return true
    }
    for i in 2...number-1 {
        if number % i == 0 {
            return false
        }
    }
    return true
}
{% endhighlight %}

### Traditional way (how to do)

{% highlight swift %}
let numbers = 2...100
var squerdPrimaryNumbers = [Int]()
for number in numbers {
    if isPrime(number) {
    squerdPrimaryNumbers.append(number*number)
    }
}
{% endhighlight %}
The sample below tells how to do this, but with functional approuch we can tell just what to do

### Functional approach (what to do)

{% highlight swift %}
let squerdPrimaryNumbers = numbers.filter(isPrime).map{$0*$0}
{% endhighlight %}
The code became more clear and just tells what-to-do. Some of implementation that says how-to-do has been hidden into
functions. Quite important thing is that we can run the sample parallel, puttping threading login inside the function. The example implementation:

{% highlight swift %}
extension Range {
    public func pfilter(filter: (Element -> Bool)) -> [Element] {
        var output = [Element]()
        let group = dispatch_group_create()
        let lock = dispatch_queue_create("pfilter-queue-for-result", DISPATCH_QUEUE_SERIAL)
        for obj in self {
            dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
                if filter(obj) {
                    dispatch_group_async(group, lock) {
                        output.append(obj)
                    }
                }
            }
        }
        dispatch_group_wait(group, DISPATCH_TIME_FOREVER)
        return output
    }
}
{% endhighlight %}

and there is an ussage

{% highlight swift %}
let squerdPrimaryNumbers = numbers.pfilter(isPrime).map{$0*$0}
{% endhighlight %}

and the output

{% highlight plaintext %}
[9, 49, 169, 25, 289, 361, 121, 529, 961, 1681, 1369, 1849, 2209, 841, 2809, 3481, 3721, 4489, 5041, 5329, 6241, 6889, 7921, 9409]
{% endhighlight %}

Notice that the numbers are not in order due to the fact that filtering of each item has been done parallel.

## Curring (Code copied from `Prelude` library)

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
{% highlight swift %}
