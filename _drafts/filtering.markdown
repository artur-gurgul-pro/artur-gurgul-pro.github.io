---
layout: post
title:  "Filtering and threading"
date:   2016-10-19 12:09:07 +0200
categories: swift algorithms
---

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



### Imperative way (how to do)

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
The code became more clear when programmer write it telling just what-to-do (not how-to-do). Some of implementation that says how-to-do might be hidden into
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

Notice that the numbers are not in order due to the fact that filtering of each item has been done parallel. Please be also aware that the the example is just a demo, and the code need to be tweaked to be used in any production code. Keep in mind that there is no any sense to do computataion sensitive tasks on more threads than the processor has cores, becouse switching between contextes is kind of expensive.