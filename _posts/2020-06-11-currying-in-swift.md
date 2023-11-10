---
layout: post
title: Blurable view in UIKit
categories: swift
---

[https://thoughtbot.com/blog/introduction-to-function-currying-in-swift](https://thoughtbot.com/blog/introduction-to-function-currying-in-swift)

```swift
func curry<A, B, C, D>(_ f: @escaping (A, B, C) -> D) -> (A) -> (B) -> (C) -> D {
    { a in { b in { c in f(a, b, c) } } }
}
    
func curry<A, B, C>(_ f: @escaping (A, B) -> C) -> (A) -> (B) -> C {
    { a in { b in f(a, b) } }
}

public func uncurry<T, U, V>(_ f: @escaping (T) -> (U) -> V) -> (T, U) -> V {
    return { f($0)($1) }
}

public func uncurry<T, U, V, W>(_ f: @escaping (T) -> (U) -> (V) -> W) -> (T, U, V) -> W {
    return { f($0)($1)($2) }
}

```

#### Example of usage

```swift
func test(a: Int, b: Int, c: Int) -> Int {
    a + b + c
}
```

```swift
let add = curry(test)
let adding5 = uncurry(add(5))
        
print(adding5(6, 7))
```