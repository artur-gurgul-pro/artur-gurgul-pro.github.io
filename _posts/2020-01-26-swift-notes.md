---
layout: post
title: Swift - notes
categories: swift
---

#### Autoclosure

Lazy evaluation of the function's arguments. Instead of eager calculation of values, the clousure is passed, and executed only when needed.

```swift
func test(_ closure: @autoclosure() -> Bool) {
    <#Code#>
}

test(8==9)
```

#### Destructuring Assignment

```swift
let (name, surname) = ("Artur", "Gurgul")
```

#### Checking if value is in range

```swift
let i = 101
if case 100...101 = i {
    <#Code#>
}

if (100...101).contains(i) {
    <#Code#>
}
```

#### Accessing tupple values

```swift
("value1", "value2").0
```

#### Pattern matchiung 

```swift
enum Example {
    case first(String)
    case secund(String)
}

let example: Example = .first("test")
```

```swift
switch example {
case .first(let value), .secund(let value):
    print(value)
}

if case let .first(value) = example {
    print(value)
}
```

_print odd numbers_

```swift
for i in 1...100 where i%2 != 0 {

} 
```

#### Blurable view in UIKit

```swift
extension Blurable where Self: UIView {
    func addBlur(_ alpha: CGFloat = 0.5) {
        let effect = UIBlurEffect(style: .prominent)
        let effectView = UIVisualEffectView(effect: effect)
        effectView.frame = self.bounds
        effectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        effectView.alpha = alpha
        self.addSubview(effectView)
    }
}
```

```swift
extension BackgroundView: Blurable {}
```

## Difference between @ObservedObject, @State, and @EnvironmentObject

[https://www.hackingwithswift.com/quick-start/swiftui/whats-the-difference-between-observedobject-state-and-environmentobject](https://www.hackingwithswift.com/quick-start/swiftui/whats-the-difference-between-observedobject-state-and-environmentobject)

>- Use `@State` for simple properties that belong to a single view. They should usually be marked `private`.
>- Use `@ObservedObject` for complex properties that might belong to several views. Most times you’re using a reference type you should be using `@ObservedObject` for it.
>- Use `@StateObject` once for each observable object you use, in whichever part of your code is responsible for creating it.
>- Use `@EnvironmentObject` for properties that were created elsewhere in the app, such as shared data.

### Cold vs hot observables

From: Anton Moiseev's Book [“Angular Development with Typescript, Second Edition.”](https://www.manning.com/books/angular-development-with-typescript-second-edition) :

> **Hot and cold observables**
> 
> There are **two** types of **observables**: hot and cold. The main difference is that a **cold observable** **creates** a **data producer** for **each subscriber**, whereas a **hot observable creates** a **data producer first**, and **each subscriber** gets the **data** from **one producer**, **starting** from **the moment of** **subscription**.
> 
> Let’s compare watching a **movie** on **Netflix** to going into a **movie theater**. Think of yourself as an **observer**. Anyone who decides to watch Mission: Impossible on Netflix will get the entire movie, regardless of when they hit the play button. Netflix creates a new **producer** to stream a movie just for you. This is a **cold observable**.
> 
> If you go to a movie theater and the showtime is 4 p.m., the producer is created at 4 p.m., and the streaming begins. If some people (**subscribers**) are late to the show, they miss the beginning of the movie and can only watch it starting from the moment of arrival. This is a **hot observable**.
> 
> A **cold observable** starts producing data when some code invokes a **subscribe()** function on it. For example, your app may declare an observable providing a URL on the server to get certain products. The request will be made only when you subscribe to it. If another script makes the same request to the server, it’ll get the same set of data.
> 
> A **hot observable** produces data even if no subscribers are interested in the data. For example, an accelerometer in your smartphone produces data about the position of your device, even if no app subscribes to this data. A server can produce the latest stock prices even if no user is interested in this stock.