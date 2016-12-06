---
layout: post
title:  "[draft] The observable desing pattern"
date:   2016-10-19 12:09:07 +0200
categories: swift ios
---


### Target/Action pattern

### Delegate pattern

### Notification center

{% highlight swift %}
NSNotificationCenter.defaultCenter().addObserver(
	<#T##observer: NSObject##NSObject#>,
	forKeyPath: <#T##String#>,
	options: <#T##NSKeyValueObservingOptions#>,
	context: <#T##UnsafeMutablePointer<Void>#>
)
{% endhighlight %}
#--------------- copied from the web
Notification is used to broadcast messages to possibly several recipients unknown from the sender.
Delegation is used to send messages to a single known recipient acting on behalf of the sender.

### Key Value Observer

{% highlight swift %}
setValue(<#T##value: AnyObject?##AnyObject?#>, forKey: <#T##String#>)

addObserver(
	<#T##observer: NSObject##NSObject#>,
	forKeyPath: <#T##String#>,
	options: <#T##NSKeyValueObservingOptions#>,
	context: <#T##UnsafeMutablePointer<Void>#>
)

// ==> override        
observeValueForKeyPath(
	"key", ofObject: <#T##AnyObject?#>,
	change: <#T##[String : AnyObject]?#>,
	context: <#T##UnsafeMutablePointer<Void>#>
)
{% endhighlight %}

{% highlight objc %}
[self.child1 willChangeValueForKey:@"name"];
self.child1.name = @"Michael";
[self.child1 didChangeValueForKey:@"name"];
{% endhighlight %}

http://stackoverflow.com/questions/24092285/is-key-value-observation-kvo-available-in-swift
Both yes and no:

* Yes, you can use the same old KVO APIs in Swift to observe Objective-C objects.
You can also observe dynamic properties of Swift objects inheriting from NSObject.
But... No it's not strongly typed as you could expect Swift native observation system to be.
Using Swift with Cocoa and Objective-C | Key Value Observing
* No, currently there is no builtin value observation system for arbitrary Swift objects.
* Yes, there are builtin Property Observers, which are strongly typed.
But... No they are not KVO, since they allow only for observing of objects own properties, don't support nested observations ("key paths"), and you have to explicitly implement them.
The Swift Programming Language | Property Observers
* Yes, you can implement explicit value observing, which will be strongly typed, and allow for adding multiple handlers from other objects, and even support nesting / "key paths".
But... No it will not be KVO since it will only work for properties which you implement as observable.
You can find a library for implementing such value observing here:
Observable-Swift - KVO for Swift - Value Observing and Events

### RxSwift
With reactive programming approach you can easily integrate fallowing things as a stream

# using swift3 with Objc
* https://developer.apple.com/library/content/documentation/Swift/Conceptual/BuildingCocoaApps/AdoptingCocoaDesignPatterns.html#//apple_ref/doc/uid/TP40014216-CH7-XID_8
* https://developer.apple.com/library/content/documentation/Swift/Conceptual/BuildingCocoaApps/AdoptingCocoaDesignPatterns.html