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
