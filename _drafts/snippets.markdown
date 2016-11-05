---
layout: post
title:  Useful code snippets
date:   2016-10-19 12:09:07 +0200
categories: swift snippets
---

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

{% endhighlight %}
extension UIColor {
    convenience init(hex:uint) {
    
        let r = CGFloat((hex >> 16) & 0xFF)/255
        let g = CGFloat((hex >> 8) & 0xFF)/255
        let b = CGFloat(hex & 0xFF)/255
    
        return self.init(red: r, green: g, blue: b, alpha: 1)
    
    }
}
{% endhighlight %}
