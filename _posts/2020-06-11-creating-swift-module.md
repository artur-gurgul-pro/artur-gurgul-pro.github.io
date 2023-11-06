---
layout: post
title: Creating Swift Module
categories: swift
---

```swift
// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "MyLibrary",
    products: [
        /// type: automatic, based on the environment
        .library(name: "MyLibrary", 
		         // type: .dynamic, .static
		         targets: ["MyLibrary"]
        ),
    ],
    targets: [
        .target(name: "MyLibrary", dependencies: []),
    ]
)
```

TBD