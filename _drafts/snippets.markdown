---
layout: post
title:  Useful code snippets
date:   2016-10-19 12:09:07 +0200
categories: swift snippets
---

###################### MODE THIS TO THE CODE REPOSITORY

# Core Date utils
Retrieving a `NSManageObject` for given context

{% highlight swift %}
extension DBEntity where Self: NSManagedObject {
    func inContext(context: NSManagedObjectContext) throws -> Self {
        if self.objectID.temporaryID {
            try managedObjectContext!.obtainPermanentIDsForObjects([self])
        }
        return try context.existingObjectWithID(self.objectID) as! Self
    }
}
{% endhighlight %}

Creating a new `NSManageObject` object

{% highlight swift %}
protocol DBEntity: class {
    static var entityName: String {get}
}

extension DBEntity where Self: NSManagedObject {   
    static var entityName: String {
        return String(Self)
    }
    
    static func insertNewObject(inContext context: NSManagedObjectContext) -> Self {
        return NSEntityDescription.insertNewObjectForEntityForName(Self.entityName, inManagedObjectContext: context) as! Self
    }
}
{% endhighlight %}

# String utils
getting a sub-sting with a range [(Solution copied from Stack Overflow)](http://stackoverflow.com/questions/24092884/get-nth-character-of-a-string-in-swift-programming-language)
{% highlight swift %}
extension String {
    subscript (i: Int) -> Character {
        return self[self.startIndex.advancedBy(i)]
  
    }
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }

    subscript (r: Range<Int>) -> String {
        let start = startIndex.advancedBy(r.startIndex)
        let end = start.advancedBy(r.endIndex - r.startIndex)
        return self[Range(start ..< end)]
    }
}
{% endhighlight %}
and the usage
{% highlight plaintext %}
"abcde"[0] == "a"
"abcde"[0...2] == "abc"
"abcde"[2..<4] == "cd"
{% endhighlight %}


# UIColor
Creating a color object like `UIColor(hex:0x223344)`

{% highlight swift %}
extension UIColor {
    convenience init(hex:uint) {
    
        let r = CGFloat((hex >> 16) & 0xFF)/255
        let g = CGFloat((hex >> 8) & 0xFF)/255
        let b = CGFloat(hex & 0xFF)/255
    
        return self.init(red: r, green: g, blue: b, alpha: 1)
    
    }
}
{% endhighlight %}

* typealias StringDictionary<Value> = Dictionary<String, Value>
* returning bloks:

{% highlight swift %}
func someFunction(a: inout Int) -> () -> Int {
    return { [a] in return a + 1   }

}
{% endhighlight %}

# `@infix`

* https://github.com/apple/swift/tree/master/docs

* https://github.com/apple/swift-protobuf/

Ranges and Intervals: https://oleb.net/blog/2015/09/swift-ranges-and-intervals/

{% highlight swift %}
infix operator ** { associativity left precedence 160   }
{% endhighlight %}



{% highlight swift %}
func ** (left: Double, right: Double) -> Double {
    return pow(left, right)

}
{% endhighlight %}

* `infix` points where we can place the operator
  * `prefix` - before
  * `infix` - in the middle
  * `postfix` - after
* `**` that's the operator we are adding
* `associativity left` grouped from the left
* `precedence 160` the priority of execution the operator}

{% highlight swift %}
extension Variable {
    func asChangeObservable() -> Observable<Void> {
        return asObservable().map {_ in
            return Observable.just()
        }
    }
}
{% endhighlight %}

// Observable.never()



### UITextField paddings

sniped copied from: http://stackoverflow.com/questions/21167226/resizing-a-uilabel-to-accomodate-insets


Make it configurable from interface builder
{% highlight swift %}
@IBDesignable
extension NRLabel {
    @IBInspectable
        var leftTextInset: CGFloat {
        set { textInsets.left = newValue  }
        get { return textInsets.left  }
    }
}
{% endhighlight %}

and there is the class

{% highlight swift %}
class NRLabel : UILabel {
    
    var textInsets = UIEdgeInsets.zero {
        didSet { invalidateIntrinsicContentSize()  }
    }
    
    override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        let insetRect = UIEdgeInsetsInsetRect(bounds, textInsets)
        let textRect = super.textRect(forBounds: insetRect, limitedToNumberOfLines: numberOfLines)
        let invertedInsets = UIEdgeInsets(top: -textInsets.top,
                                          left: -textInsets.left,
                                          bottom: -textInsets.bottom,
                                          right: -textInsets.right)
        return UIEdgeInsetsInsetRect(textRect, invertedInsets)
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: UIEdgeInsetsInsetRect(rect, textInsets))
    
    }
}
{% endhighlight %}

{% highlight swift %}
self.variable.asObservable() .throttle(0.33, scheduler: MainScheduler.instance)
.subscribeNext { [unowned self](searchPhrase) in
    self.getProducts(withSearchPhrase: searchPhrase, forPage: self.startingPage)
}.addDisposableTo(disposeBag)
{% endhighlight %}

