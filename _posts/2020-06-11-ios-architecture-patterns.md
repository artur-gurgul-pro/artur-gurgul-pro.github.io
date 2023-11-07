---
layout: post
title: iOS Architecture Patterns
categories: swift
---


### Remove story board dependency

1. Remove `Main.storyboard` file
1. Remove storyboard reference from `Info.plist` &rarr; In Scene Configuration find `Storyboard Name` and delete it
1. Go to build settings and remove `UIKit MainStoryboard File Base Name` field
1. Create a window in Scene Delegate

```swift
func scene(_ scene: UIScene,
           willConnectTo session: UISceneSession,
           options connectionOptions: UIScene.ConnectionOptions) {
    
    guard let scene = (scene as? UIWindowScene) else { return }
    
    let window = UIWindow(windowScene: scene)
    window.rootViewController = ViewController()
    window.makeKeyAndVisible()
    self.window = window
}
```

## Dependency injection

[Explanation of the code under this link](https://www.avanderlee.com/swift/dependency-injection/)


```swift
public protocol InjectionKey {
    associatedtype Value
    static var currentValue: Self.Value { get set }
}
```

```swift
struct InjectedValues {
    private static var current = InjectedValues()
    
    static subscript<K>(key: K.Type) -> K.Value where K : InjectionKey {
        get { key.currentValue }
        set { key.currentValue = newValue }
    }
    
    static subscript<T>(_ keyPath: WritableKeyPath<InjectedValues, T>) -> T {
        get { current[keyPath: keyPath] }
        set { current[keyPath: keyPath] = newValue }
    }
}
```

```swift
@propertyWrapper
struct Injected<T> {
    private let keyPath: WritableKeyPath<InjectedValues, T>
    var wrappedValue: T {
        get { InjectedValues[keyPath] }
        set { InjectedValues[keyPath] = newValue }
    }
    
    init(_ keyPath: WritableKeyPath<InjectedValues, T>) {
        self.keyPath = keyPath
    }
}
```

#### Define dependency

```swift
private struct UsersRepositoryKey: InjectionKey {
    static var currentValue: AnyUsersRepository = UsersRepository()
}

extension InjectedValues {
    var usersRepository: AnyUsersRepository {
        get { Self[UsersRepositoryKey.self] }
        set { Self[UsersRepositoryKey.self] = newValue }
    }
}

protocol AnyUsersRepository {
    func getUsers(_ result: @escaping (Result<[User], Error>)->Void)
}

class UsersRepository: AnyUsersRepository {
    func getUsers(_ result: @escaping (Result<[User], Error>)->Void) {
        <#Implementation#>
    }
}
```

```swift
@Injected(\.usersRepository) var usersRepository: AnyUsersRepository
```

```swift
InjectedValues[\.usersRepository] = MockedUsersRepository()
```

## Model-View-Controller

#### Clasic version

- `View` and `Model` are linked together, so reusability is reduced.
- Note: Views in iOS apps are quite often reusable.

<p>
 {% svg ../svgs/classic-mvc.svg width="472px" class="center-image" %}
</p>

#### Apple version

<p>
 {% svg ../svgs/apple-mvc.svg width="472px" class="center-image" %}
</p>

**Model** responsibilities: 

- Business logic
- Accessing and manipulating data
- Persistence
- Communication/Networking 
- Parsing
- Extensions and helper classes
- Communication with models

Note: The `Model` must not communicate directly with the `View`. The `Controller` is the link between those

**View** responsibilities:

- Animations, drawings (`UIView`,  `CoreAnimation`, `CoreGraphics`)
- Show data that controller sends
- Might receive user input

**Controller** responsibilities:

-  Exchange data between `View` and `Model`
- Receive user actions and interruptions or signals from the outside the app
- Handles the view life cycle

