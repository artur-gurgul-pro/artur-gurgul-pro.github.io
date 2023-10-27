---
layout: post
title:  Javascript closure
categories: javascript
---

```javascript
var NextClosure = function() {
    var a = 0;
    return function next() {
        a++
        return a
    }
}
```

```javascript
var next = NextClosure()

console.log(next())
console.log(next())
console.log(next())

```