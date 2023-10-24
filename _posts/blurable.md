---
layout: post
title:  "Blureble View in UIKit"
categories: swift
---

```swift
extension Blurable where Self: UIView {
    func addBlur(_ alpha: CGFloat = 0.5) {
        // create effect
        let effect = UIBlurEffect(style: .prominent)
        let effectView = UIVisualEffectView(effect: effect)
        // set boundry and alpha
        effectView.frame = self.bounds
        effectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        //effectView.alpha = alpha
        self.addSubview(effectView)
    }
}

// Conformance
extension BackgroundView: Blurable {}
```