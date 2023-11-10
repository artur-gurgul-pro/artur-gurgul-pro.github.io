---
layout: post
title: Publishers notes and examples
categories: swift
---

# Always Publisher example

```swift
public struct Always<Output>: Publisher {
    public typealias Failure = Never
    public let output: Output

    public init(_ output: Output) {
        self.output = output
    }

    public func receive<S: Subscriber>(subscriber: S)
                where S.Input == Output, S.Failure == Failure {
        let subscription = Subscription(output: output, 
                                        subscriber: subscriber)
        subscriber.receive(subscription: subscription)
    }
}
```

```swift
private extension Always {
    final class Subscription<S: Subscriber> 
                where S.Input == Output, S.Failure == Failure {
        private let output: Output
        private var subscriber: S?

    init(output: Output, subscriber: S) {
        self.output = output
        self.subscriber = subscriber
    }
  }
}
```

```swift
extension Always.Subscription: Cancellable {
  func cancel() {
    subscriber = nil
  }
}
```

```swift
extension Always.Subscription: Subscription {
  func request(_ demand: Subscribers.Demand) {
    var demand = demand
    while let subscriber = subscriber, demand > 0 {
      demand -= 1
      demand += subscriber.receive(output)
    }
  }
}
```

# Buffered publisher

```swift
let publisher = PassthroughSubject<Int, Never>()
publisher.send(1)
let buffered = publisher.buffer(size: 4, prefetch: .keepFull, whenFull: .dropOldest)
```

# Combine publishers

```swift
 let publisher1 = [1,2].publisher
 let publisher2 = [3,4].publisher
```

Emits first and then second

```swift
 let combinedPublisher = Publishers
                             .Concatenate(prefix: publisher1.eraseToAnyPublisher(),
                                          suffix: publisher2.eraseToAnyPublisher())
```

Combine without ordering

```swift
let combinedPublisher = Publishers.Merge(publisher1.eraseToAnyPublisher(),
                                         publisher2.eraseToAnyPublisher())
```

**_Other operators worth to look at_**

- `Zip` - pair the emitted object, like a zip in the jacket
- [`CombineLatest`](https://developer.apple.com/documentation/combine/publisher/combinelatest%28_:%29) - When `publisher1` and `publisher2` emitted some event then the latest values from each are taken and reemitted. From now on each change from either publisher is passed down.  

#### Example of zip

```swift
let numbers = [1, 2, 3, 4].publisher
let twos = sequence(first: 2, 
                    next: {_ in 2}).publisher
numbers
	.zip(twos)
	.map { pow(Decimal($0), $1) }
	.sink(receiveValue: { p in
		print(p)
	}).store(in: &cancellables)
```

