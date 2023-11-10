---
layout: post
title: Currying in swift
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

func uncurry<A, B, C>(_ f: @escaping (A) -> (B) -> C) -> (A, B) -> C {
    { f($0)($1) }
}

func uncurry<A, B, C, D>(_ f: @escaping (A) -> (B) -> (C) -> D) -> (A, B, C) -> D {
    { f($0)($1)($2) }
}

// Not working yet
func apply<A, B, C>(_ a: A, _ f: @escaping (A, B) -> C) -> (B) -> C {
    uncurry((curry(f))(a))
}
```

#### Example of usage

```swift
func add(a: Int, b: Int, c: Int) -> Int {
    a + b + c
}
```

```swift
let adding = curry(add)
let adding5 = uncurry(adding(5))
```

or

```swift
let adding5 = apply(5, add)
```

then

```swift
print(adding5(6, 7))
```