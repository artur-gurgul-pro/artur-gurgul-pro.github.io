# Reactive programming

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

