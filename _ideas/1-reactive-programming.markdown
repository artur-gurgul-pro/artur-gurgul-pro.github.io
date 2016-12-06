---
layout: post
title:  "[draft] Reactive programming"
date:   2016-10-19 12:09:07 +0200
categories: swift reactive-programming
---

Reactive programming paradigm is concentrated around data flows and the propagation of changes.
In that style of programming there is no distinction between the data and the events and they are are treated as a stream which can be mapped or filtered. 

# Strong sides of reactive programming
* https://www.raywenderlich.com/86477/introducing-ios-design-patterns-in-swift-part-1
* Easier to write tests

# Handling massive amount of events

# List of operators that can be applied to the items from a stream

* `map` - transform sequence of values into another sequence
* `flatMap` - as above, but this operator can return 0 or more elements and the results will be flatten.
* `filter` - transform a sequence of into a filtered sequence 

{% highlight swift %}
    private func prepareCancel() {
        alert
            .flatMap { alert in
                alert.rx_action(Localizations.alert.attachment.cancel, style: .Cancel)
                    .map { _ in alert }
            }
            .subscribeNext {
                $0.dismissViewControllerAnimated(true, completion: nil)
            }
            .addDisposableTo(disposeBag)
    }
{% endhighlight %}

# Creating Observables

### A stream with squared numbers
{% highlight swift %}
func squaredNumbersStream(range: Range<Int>) -> Observable<Int> {
    return Observable.create { (observer) -> Disposable in
        for i in range {
            observer.onNext(i*i)  
        }
        observer.onCompleted()
        return NopDisposable.instance
     }
}
{% endhighlight %}


And the usage
{% highlight swift %}
squaredNumbersStream(1...20).subscribe { number in
    print(number)
}.addDisposableTo(disposeBag)
{% endhighlight %}

# Publishes
Publishes are the objects we can listen to. It is in fact an observer. There are a few types of them:
* `AsyncSubject`: Emits only last item from the stream to the subscriber
* `BehaviorSubject`: Emits items to the subscriber and if no value has been emited at the time of subscription, the default value will be passed through
* `PublishSubject`: Works almost the same as `BehaviorSubject` except has no default value
* `ReplaySubject` Reply all items that ever has been emited by the stream to the subscriber

There is an example of the publisher which emits event without value

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



Look at: https://github.com/ReactiveX/RxSwift/blob/master/Documentation/Examples.md

# links binding with the UI

A class should have only a single responsibility (i.e. only one potential change in the software's specification should be able to affect the specification of the class)
* https://www.infoq.com/news/2016/02/rxswift-reactive-swift
* http://rx-marin.com/post/rxswift-rxcocoa-custom-bindings/
* http://nshipster.com/reactivecocoa/
* https://realm.io/news/slug-max-alexander-functional-reactive-rxswift/
