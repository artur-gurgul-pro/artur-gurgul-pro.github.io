---
layout: post
title: Interesting Swift snippets
categories: swift
---

<!-- https://swiftbysundell.com/articles/swiftui-views-versus-modifiers/ -->

# View modifier 

The notification we'll send when a shake gesture happens.

```swift
extension UIDevice {
    static let deviceDidShakeNotification = Notification
                                              .Name(rawValue: "deviceDidShakeNotification")
}
```

 Override the default behavior of shake gestures to send our notification instead.

```swift
extension UIWindow {
     open override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            NotificationCenter
                .default
                .post(name: UIDevice.deviceDidShakeNotification, object: nil)
        }
     }
}
```

A view modifier that detects shaking and calls a function of our choosing.

```swift
struct DeviceShakeViewModifier: ViewModifier {
    let action: () -> Void

    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter
                           .default
                           .publisher(for: UIDevice.deviceDidShakeNotification)) { _ in
                               action()
            }
    }
}
```

A View extension to make the modifier easier to use.

```swift
extension View {
    func onShake(perform action: @escaping () -> Void) -> some View {
        self.modifier(DeviceShakeViewModifier(action: action))
    }
}
```

An example view that responds to being shaken

```swift
struct ContentView: View {
    var body: some View {
        Text("Shake me!")
            .onShake {
                print("Device shaken!")
            }
    }
}
```

# Swizzling

```swift
extension UIViewController {
    @objc dynamic func newViewDidAppear(animated: Bool) {
        viewDidAppear(animated)
        print("View appeared")
    }
}

private let swizzling: Void = {
    let originalMethod = class_getInstanceMethod(UIViewController.self,
                                                 #selector(UIViewController.viewDidLoad))
    let swizzledMethod = class_getInstanceMethod(UIViewController.self,
                                                 #selector(UIViewController.newViewDidAppear))
    if let originalMethod = originalMethod, let swizzledMethod = swizzledMethod {
        method_exchangeImplementations(originalMethod, swizzledMethod)
    }
}()
```

# class vs static values

```swift
class Car {
    static var start: Int {
        return 100
    }

    class var stop: Int {
        return 0
    }
}
```

```swift
class Student: Person {
    // Not allowed
    // override static var start: Int {
    //    return 150
    // }

    override class var stop: Int {
        return 5
    }
}
```


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

#### Cancelling a publisher

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

It will work similar to this

```swift
subscriber = timer.prefix(5)
```



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

Key Value Coding

```swift
class SomeClass: NSObject {
  @objc dynamic var name = "Name"
}
```

```swift
object.value(forKey: "name") as String
```

```swift
object.setValue("New name", forKey: "name")
```



### Swift - currying

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

func currying<A, B, C>(_ a: A, _ f: @escaping (A, B) -> C) -> (B) -> C {
    { (curry(f))(a)($0) }
}

func currying<A, B, C, D>(_ a: A, _ f: @escaping (A, B, C) -> D) -> (B, C) -> D {
    { (curry(f))(a)($0)($1) }
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
let adding5 = currying(5, add)
```

then

```swift
print(adding5(6, 7))
```

