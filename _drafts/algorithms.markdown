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

### bubble sort

This method is much faster for large sets of almost sorted items and takes less memory than `quick srot`

* Searching 

