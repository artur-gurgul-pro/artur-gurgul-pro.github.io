---
layout: post
title:  "Reactive programming"
date:   2016-10-19 12:09:07 +0200
categories: swift reactive-programming
---

# Reactive programming

List of operators

# binding with the UI
http://rx-marin.com/post/rxswift-rxcocoa-custom-bindings/
http://nshipster.com/reactivecocoa/

* RxSwift/Zip

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
Zip is a function that creates a new stream that combines the elements from original streams and put them together the way a zipper in your jacket does. For more information how it works look at [documentation](http://reactivex.io/documentation/operators/zip.html).

For better understanding how it works I want to show you an example. Lets say we want to download a list of images and descriptions and show them to the user, but we also want to treat corresponding picture and image as one entity and show it at once, so the image never will be shown without description.

Lets create a stream with that contains images from the server. To simplyfy the example I will put just the numbers. 
{% highlight swift %}
func imagesStream() -> Observable<Int> {
    return Observable.of(1, 2, 3)
}
{% endhighlight %}

and then the descritions stream

{% highlight swift %}
func descriptionsStream() -> Observable<String> {
    return Observable.of("A", "B", "C")
}
{% endhighlight %}

There is an example how to zip the stream together

{% highlight swift %}
func getImagesWithDescriptions() -> Observable<(String, String)> {
    Observable.zip(imagesStream(), descriptionsStream()) {imageNo, imageDescription in
        return ("image #\(imageNo)", imageDescription)
    }
}
{% endhighlight %}

So what this example does is that we wait for an item form each stream, and both have an item we triger the new stream with combined two items into one (in this example it is tuple)

{% highlight swift %}
getImagesWithDescriptions().subscribe(onNext: {image, imageDesc in
    print("\(image) with description \(imageDesc)")
}).addDisposableTo(disposeBag)
{% endhighlight %}

