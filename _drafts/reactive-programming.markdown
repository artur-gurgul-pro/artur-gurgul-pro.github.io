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

{% highlight swift %}
func imagesStream() -> Observable<Int> {
    return Observable.of(1, 2, 3)
}
{% endhighlight %}

{% highlight swift %}
func descriptionsStream() -> Observable<String> {
    return Observable.of("A", "B", "C")
}
{% endhighlight %}

{% highlight swift %}
func getImagesWithDescriptions() -> Observable<(String, String)> {
    Observable.zip(imagesStream(), descriptionsStream()) {imageNo, imageDescription in
        return ("image #\(imageNo)", imageDescription)
    }
}
{% endhighlight %}

{% highlight swift %}
getImagesWithDescriptions().subscribe(onNext: {image, imageDesc in
    print("\(image) with description \(imageDesc)")
}).addDisposableTo(disposeBag)
{% endhighlight %}

