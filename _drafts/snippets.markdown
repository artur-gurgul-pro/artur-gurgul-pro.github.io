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
