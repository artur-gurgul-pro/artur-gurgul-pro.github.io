---
layout: post
title:  "Threading"
date:   2016-10-19 12:09:07 +0200
categories: swift
---

#### kind of jobs
Computation intensive
I/O intensive

processes = cores /(1- blocking factor)


#### Bloks/closures
"Blocks also capture their surrounding state. That is, blocks are closures: they close around variables that are in scope at the time the block is declared." [[1]](http://pragmaticstudio.com/blog/2010/7/28/ios4-blocks-1)

#### Switching context

### A concurrency and the data consistency


# GCD (Grand Central Dispatch)
The [libdispatch](https://github.com/apple/swift-corelibs-libdispatch) is a part of core library wchich takes care about threading. 

In particular how to manage sync calls


`dispatch_once`
`dispatch_sync`
`dispatch_async`

1. [Raywenderlich article](https://www.raywenderlich.com/60749/grand-central-dispatch-in-depth-part-1)
2. [serial vs concurrent queues](https://developer.apple.com/library/content/documentation/General/Conceptual/ConcurrencyProgrammingGuide/OperationQueues/OperationQueues.html)
3. [This answer on sof says that "`NSOperationQueue` does use GCD on iOS 4.0 and later"](http://stackoverflow.com/questions/7078658/operation-queue-vs-dispatch-queue-for-ios-application)
it says also quote:
	* Prefer GCD where task is not much complex and optimum CPU performance is required.
	* Prefer NSOperationQueue where task is complex and requires canceling or suspending a block and dependency management.	
4. [Nice article that TODO: look at examples from the picture](http://www.appcoda.com/ios-concurrency/)

# pthread (advanced/JFYI)
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

# NSThread 
* https://developer.apple.com/reference/foundation/thread

{% highlight swift %}
let thread = NSThread(target:self, selector:#selector(doSomething), object:nil)
{% endhighlight %}
# NSOperationQueue

* How to cancel NSOperationQueue



### Blueprint of NSOperation
{% highlight swift %}
class ImageDownloader: NSOperation {
  //1
  let photoRecord: PhotoRecord
 
  //2
  init(photoRecord: PhotoRecord) {
    self.photoRecord = photoRecord
  }
 
  //3
  override func main() {
    //4
    if self.cancelled {
      return
    }
    //5
    let imageData = NSData(contentsOfURL:self.photoRecord.url)
 
    //6
    if self.cancelled {
      return
    }
 
    //7
    if imageData?.length > 0 {
      self.photoRecord.image = UIImage(data:imageData!)
      self.photoRecord.state = .Downloaded
    }
    else
    {
      self.photoRecord.state = .Failed
      self.photoRecord.image = UIImage(named: "Failed")
    }
  }
}
{% endhighlight %}

### Blueprint of NSOperationQueue

{% highlight swift %}
class PendingOperations {
  lazy var downloadsInProgress = [NSIndexPath:NSOperation]()
  lazy var downloadQueue:NSOperationQueue = {
    var queue = NSOperationQueue()
    queue.name = "Download queue"
    queue.maxConcurrentOperationCount = 1
    return queue
    }()
 
  lazy var filtrationsInProgress = [NSIndexPath:NSOperation]()
  lazy var filtrationQueue:NSOperationQueue = {
    var queue = NSOperationQueue()
    queue.name = "Image Filtration queue"
    queue.maxConcurrentOperationCount = 1
    return queue
    }()
}
{% endhighlight %}



## Mutex

[Article abuut mutexes](https://www.cocoawithlove.com/blog/2016/06/02/threads-and-mutexes.html)