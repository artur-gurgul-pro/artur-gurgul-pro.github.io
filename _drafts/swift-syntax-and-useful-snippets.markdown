# Swift syntax and useful snippet
* typealias StringDictionary<Value> = Dictionary<String, Value>
* returning bloks: 

{% highlight swift %}
func someFunction(a: inout Int) -> () -> Int {
    return { [a] in return a + 1  }
}
{% endhighlight %}

# `@infix`

* https://github.com/apple/swift/tree/master/docs

* https://github.com/apple/swift-protobuf/

Ranges and Intervals: https://oleb.net/blog/2015/09/swift-ranges-and-intervals/
