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



#### Switching context

### A concurrency and the data consistency


# GDC 
The [libdispatch](https://github.com/apple/swift-corelibs-libdispatch) is a part of core library wchich takes care about threading. 

In particular how to manage sync calls


`dispatch_once`
`dispatch_sync`
`dispatch_async`

1. [Raywenderlich article](https://www.raywenderlich.com/60749/grand-central-dispatch-in-depth-part-1)



# pthread
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
