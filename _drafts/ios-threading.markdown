---
layout: post
title:  "Threading"
date:   2016-10-19 12:09:07 +0200
categories: swift
---

#### Switching context

### A concurrency and the data consistency


# GDC 
The [libdispatch](https://github.com/apple/swift-corelibs-libdispatch) is a part of core library wchich takes care about threading. 

In particular how to manage sync calls

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
