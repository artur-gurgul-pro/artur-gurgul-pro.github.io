---
layout: post
title: Cancelling a publisher
categories: swift
---

```swift
let timer = Timer
	.publish(every: 1.0, on: .main, in: .common)
	.autoconnect()
```

```swift
var counter = 0
subscriber = timer
	.map { _ in counter += 1 }
	.sink { _ in
		if counter >= 5 {
			timer.upstream.connect().cancel()
		}
	}
```

```swift
subscriber = timer.prefix(5)
```