---
layout: post
title:  "Algorithms"
date:   2016-10-19 12:09:07 +0200
categories: swift algorithms
---

# Sorting

{% highlight swift %}
extension Array where Element: Comparable {
    mutating func quick_sort() {
        // (1)
        if count <= 1 {
            return
        }
        
        // (2)
        let splitElement = self[0]
        
        // (3)
        var left = filter{$0<splitElement}
        left.quick_sort()
        
        // (4)
        var right = filter{$0>splitElement}
        right.quick_sort()
        
        // (5)
        let middle = filter{$0==splitElement}
        
        // (6)
        self = left + middle + right
    }
}
{% endhighlight %}

1. If the array has no elements or has only one there is no point for sorting
2. In this line we take the divider element
3. We take elements that are smaller then the divider and than perform sorting on this sub-array
4. Exactly the same as above but for greater elements
5. We take the middle elements. Notice that there might be more than one element that is equal to the divider
6. Here we can combine three sub-sets and produce the result. From now on the array is sorted.  

Example usage

{% highlight swift %}
var t = [3, 3 ,1,7,4,11, 3, 60,-1]
t.quick_sort()
print(t)
{% endhighlight %}

We can improve code a little bit by merging part `3`, `4`, `5` into signle loop. Currently we are using filter which goes through all elements. Exach filter has the complexity of it is is `O(n)`, so if we go through all items only once we can speed up the algorithm 3 times. Example solution.

{% highlight swift %}
var acc = (left:[], middle:[], right:[])        
for element in self {
    if element == split {
        acc.middle.append(element)
    } else if element < splitElement {
        acc.left.append(element)
    } else {
        acc.right.append(element)
    }
}
{% endhighlight %}

We can solve the problem even better. Pay attention to the first condition. We check if there the item is equal to the split element. There is small change that the result of comparition result will be true, but if we first will check for grater or lower element will have almost 50-50 change to satysfy the condition and more important to not to check for other possibilities. Another 
### bubble sort

This method is much faster for large sets of almost sorted items and takes less memory than `quick srot`

* Searching 

