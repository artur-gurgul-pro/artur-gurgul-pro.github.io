---
layout: post
title:  "Dynamic member lockup in swift"
categories: swift
---

Here's an example of using the `@dynamicMemberLookup` attribute in Swift:

```swift
@dynamicMemberLookup
struct DynamicStruct {
    subscript(dynamicMember member: String) -> String {
        return "You accessed dynamic member '\(member)'"
    }
}

let dynamicStruct = DynamicStruct()
let result = dynamicStruct.someDynamicMember
print(result) // Output: "You accessed dynamic member 'someDynamicMember'"
```