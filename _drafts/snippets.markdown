---
layout: post
title:  Useful code snippets
date:   2016-10-19 12:09:07 +0200
categories: swift snippets
---

# Core Date utils
 retrieving a `NSManageObject` for given context

{% highlight swift %}
extension NSManagedObject {
    func inContext(context: NSManagedObjectContext) throws -> Self {
        if self.objectID.temporaryID {
            try managedObjectContext!.obtainPermanentIDsForObjects([self])
        }
        return try context.existingObjectWithID(self.objectID) as! Self
    }
}
{% endhighlight %}

# String utils
