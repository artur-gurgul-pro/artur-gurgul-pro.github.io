---
layout: post
title:  "Threading"
date:   2016-10-19 12:09:07 +0200
categories: swift
---

Threading is one of the most difficult things wehen you do programming. Fortunatelly, in comparisions to another frameworks, the Apple's SDK handles the proglem exceptionally well. At least it is my impression (feel free to arguee or comment on [github](https://github.com/artur-gurgul/artur-gurgul.markdown/issues/1))

All chunks of job are arranged into `Bloks` or `Functions`/`Mothods`. I'd like to mention that the `Blocks` have ability to capture their surrounding state. They close variables around that are in scope at the time the block is declared that's why we call them aslo `Closures` [[1]](http://pragmaticstudio.com/blog/2010/7/28/ios4-blocks-1)

#### Kind of jobs might be perform in the separate threads

* Computation intensive jobs: When the thread uses entire processing capability of CPU. The reasonable maximum number of the threads is the number of CPU cores. By crating more threads we cause unnececery switching of the context by the CPU, which takes some unit of time threfore it makes the caclulation slower.
* I/O intensive jobs: In that case we can trigger more threads than we have CPU cores and there is a formula how we can calulate how many thread is an optimal `Threads` = `Cores` / (1-`Blocking Factor`). Here the switch of CPU contect itself does not impact much into performance, becouse the  thread probably is waiting for a signal anywa.

#### Mutex and the data consistency

What makes threading difficult is the data consistency. Imageine the sytyation when there are two threads that have a pointer to the same array which suppose to contains unique items. Both threads can modyfy and read the array. Let's say both of the threads want to append the same item at exactly the same time to this array. What they do is to check if the item aleady exists in the array so they iterate through the array for checking the item if it is a duplicate and if not both od them will append it. 

The array will contains two the same items or even wors the app will crash becouse the array moght be mutated at the time the other threat iterate through it.

The solution is to use `mutex` for blocking threads in order to avoid override the data.

{% highlight swift %}
var mutex = pthread_mutex_t()
pthread_mutex_init(&mutex, nil)
pthread_mutex_lock(&mutex)
// do atomic job
pthread_mutex_unlock(&mutex)
pthread_mutex_destroy(&mutex)
{% endhighlight %}

Another mechanism for syncing thread is semaphore, but you need to be aware of potential deadlock. Below you can see one

{% highlight swift %}
let semaphore = DispatchSemaphore(value: 0)
semaphore.wait() // DEADLOCK
semaphore.signal()
{% endhighlight %}

The current thread stops and wait for a signal that can not be send in this case, becouse we try fto send it from the same thread wich is stopped.

[Article abut mutexes](https://www.cocoawithlove.com/blog/2016/06/02/threads-and-mutexes.html)

# NSObject
The easiest way to start a new thread is to use a method that comes from base class `NSObject`
{% highlight swift %}
performSelector(inBackground: #selector(job), with: nil)
{% endhighlight %}

# GCD (Grand Central Dispatch)
The [libdispatch](https://github.com/apple/swift-corelibs-libdispatch) is a part of core library wchich takes care about threading. 

In particular how to manage sync calls


* `dispatch_once`: Does not exists in SDK anymore [[1]](http://stackoverflow.com/questions/37801407/whither-dispatch-once-in-swift-3) Here is an alternative

{% highlight swift %}
private lazy var foo: Void = {
    // Do this once
}()
{% endhighlight %}

* `dispatch_sync`: locks the current thread until the passed block is executed on the separated thread
* `dispatch_async`: starts executing the passed block on a separate thered, but the current one keeps running

{% highlight swift %}
// without "arrtibures" we will get serial queue
let queue = DispatchQueue(label: "important.job", qos: .default, attributes: .concurrent)
queue.async {
	// do stuff
}
{% endhighlight %}

{% highlight swift %}
DispatchQueue.main.async {
	<#code#>
}
{% endhighlight %}

{% highlight swift %}
DispatchQueue.global(qos: .background).async {
    <#code#>
}
{% endhighlight %}

1. [Raywenderlich article](https://www.raywenderlich.com/60749/grand-central-dispatch-in-depth-part-1)
2. [serial vs concurrent queues](https://developer.apple.com/library/content/documentation/General/Conceptual/ConcurrencyProgrammingGuide/OperationQueues/OperationQueues.html)
3. [This answer on sof says that "`NSOperationQueue` does use GCD on iOS 4.0 and later"](http://stackoverflow.com/questions/7078658/operation-queue-vs-dispatch-queue-for-ios-application)
it says also quote:
	* Prefer GCD where task is not much complex and optimum CPU performance is required.
	* Prefer NSOperationQueue where task is complex and requires canceling or suspending a block and dependency management.	
4. [Nice article that TODO: look at examples from the picture](http://www.appcoda.com/ios-concurrency/)

# NSThread 
* https://developer.apple.com/reference/foundation/thread
This is the most 
{% highlight swift %}
let thread = Thread(target: self, selector: #selector(job), object: nil)
// or
let thread = Thread { 
	<#code#>
}
// and then start the tread
thread.start()
{% endhighlight %}
# NSOperationQueue
[[1]](https://www.raywenderlich.com/76341/use-nsoperation-nsoperationqueue-swift)
* How to cancel NSOperationQueue



#### Blueprint of NSOperation

{% highlight swift %}
class MyVeryExpensiveOperation: Operation {
    override func main() {
        if self.isCancelled { return }
        // Some chunk of time consuming task
        if self.isCancelled { return }
        // Some another chunk of time consuming task
        // and so on...
    }
}
{% endhighlight %}

#### Blueprint of NSOperationQueue

{% highlight swift %}
let queue = OperationQueue()
queue.name = "Queue Name"
queue.maxConcurrentOperationCount = 1
let myOperation = MyVeryExpensiveOperation()
queue.addOperation(myOperation)
queue.addOperation {
	// some another job passed by block
}
{% endhighlight %}

# pthread (advanced/JFYI)
There is no good idea to handle threads from low level becouse it affect highly into development time of an application, whoever as all of us we are curious about everything, so I am going to show you how to do `pthreading` on iOS. Here is an example:
{% highlight swift %}
var user_interactive_thread: pthread_t?
var user_interactive_qos_attr = pthread_attr_t()

return_value = pthread_attr_init(&user_interactive_qos_attr)
return_value = pthread_attr_set_qos_class_np(&user_interactive_qos_attr, QOS_CLASS_USER_INTERACTIVE, 0)

return_value = pthread_create(&user_interactive_thread, &user_interactive_qos_attr, { (x:UnsafeMutableRawPointer) in
	print("New pthread job")
	return nil
}, nil)
{% endhighlight %}
