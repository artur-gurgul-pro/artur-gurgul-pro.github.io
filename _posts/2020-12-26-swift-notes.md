---
layout: post
title:   Notes
categories: swift
---

#### Autoclosure

Lazy evaluation of the function's arguments. Instead of eager calculation of values, the clousre is passed, and executed only when needed.

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