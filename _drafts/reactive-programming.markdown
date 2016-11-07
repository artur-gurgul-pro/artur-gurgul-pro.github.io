---
layout: post
title:  "Reactive programming"
date:   2016-10-19 12:09:07 +0200
categories: swift reactive-programming
---

# Reactive programming

Filter function we will use for filtering
{% highlight swift %}
func isPrime(number: Int) -> Bool {
    if number < 3 {
        return true
    }
    for i in 2...number-1 {
        if number % i == 0 && i != number {
            return false
        }
    }
    return true
}
{% endhighlight %}

### imperative approach (how to do) 

{% highlight swift %}
let numbers = 1...100
var squerdPrimaryNumbers = [Int]()
        
for number in numbers {
    if isPrime(number) {
        squerdPrimaryNumbers.append(number*number)    
    }    
}
{% endhighlight %}
The sample below tells how to do this, but with functional approuch we can tell just what to do

### functional approach (what to do)

{% highlight swift %}
let squerdPrimaryNumbers = numbers.filter(isPrime).map{$0*$0}
{% endhighlight %}
The code became more clear just tells what to do. Some of implementation that says how to do has been hidden into
functions. Quite important thing is that we can run the sample parallel without writting complex code. 

you can stop reimplementing the same patterns over and over again and abstract them as operators on observable sequences. Probably the most common ones are:
retry
* `combineLatest` - combine latest values of multiple stateful objects, similar to what Excel or some other spreadsheets do when calculating formulas
* `map` - transform sequence of values into another sequence
* `merge` - combine events from multiple sources into a single one
* `flatMapLatest` (automatically cancel previous async operation when next computation request arrives)
refCount (in case you want to download something and want to make sure that if at least somebody needs that download result, then download should continue, but if nobody needs the download result then download needs to be cancelled automatically)
* `zip` (want to make N network requests, wait until they are all completed and map the result?, yep, out of the box)


With reactive programming approach you can easily integrate fallowing things as a stream  
* Delegates
* `NSNotificationCenter`
* KVO
* Target/Action pattern.

# Handling massive amount of events

# List of operators

### `map` - transform sequence of values into another sequence

### `filter` - transform a sequence of into a filtered sequence 

# links binding with the UI

A class should have only a single responsibility (i.e. only one potential change in the software's specification should be able to affect the specification of the class)
* https://www.infoq.com/news/2016/02/rxswift-reactive-swift
* http://rx-marin.com/post/rxswift-rxcocoa-custom-bindings/
* http://nshipster.com/reactivecocoa/
* https://realm.io/news/slug-max-alexander-functional-reactive-rxswift/

# Publishes
Publishes are the objects we can listen to. It is in fact an observer. There are a few types of them:
* `AsyncSubject`: Emits only last item from the stream to the subscriber
* `BehaviorSubject`: Emits items to the subscriber and if no value has been emited at the time of subscription, the default value will be passed through
* `PublishSubject`: Works almost the same as `BehaviorSubject` except has no default value
* `ReplaySubject` Reply all items that ever has been emited by the stream to the subscriber

There is an example of the publisher which emits event without values

{% highlight swift %}
let openMenu = PublishSubject<Void>()
openMenu.subscribeNext {
    print("Received signal")
}.addDisposableTo(disposeBag)

openMenu.onNext()
openMenu.onNext()
openMenu.onNext()
{% endhighlight %}

reactive programming blog
https://realm.io/news/slug-max-alexander-functional-reactive-rxswift/


# Zip
Zip is a function that creates a new stream that combines the elements from original streams and put them together the way a zipper in your jacket does. For more information look at [documentation](http://reactivex.io/documentation/operators/zip.html).

For better understanding how it works I want to show you an example. Lets say we want to download a list of images and descriptions and show them to the user, but we also want to treat corresponding picture and image as one entity and show it at once, so the image never will be shown without the description.

Lets create a stream which contains images from the server. To simplify the example I am going to use just a simple observable that emits just the numbers. 
{% highlight swift %}
func imagesStream() -> Observable<Int> {
    return Observable.of(1, 2, 3)
}
{% endhighlight %}
I have written another article that threats about [getting images from the Internet](/swift/cache/)

The next step is to create the second stream with descriptions.

{% highlight swift %}
func descriptionsStream() -> Observable<String> {
    return Observable.of("A", "B", "C")
}
{% endhighlight %}

And there is an example how to zip the stream together

{% highlight swift %}
func getImagesWithDescriptions() -> Observable<(String, String)> {
    return Observable.zip(imagesStream(), descriptionsStream()) {imageNo, imageDescription in
        return ("image #\(imageNo)", imageDescription)
    }
}
{% endhighlight %}

The last thing is to use the stream for displaying the data. When the zip callback returns a tuple we can strip the values out and use them as it is shown below. 

{% highlight swift %}
getImagesWithDescriptions().subscribe(onNext: {image, imageDesc in
    print("\(image) with description \(imageDesc)")
}).addDisposableTo(disposeBag)
{% endhighlight %}

Finally we can see the result 

{% highlight plaintext %}
image #1 with description A
image #2 with description B
image #3 with description C
{% endhighlight %}


# Example how to get twits using `Alamofire`

