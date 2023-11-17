---
layout: post
title: Currying 
categories: programming
---

### Currying - JavaScript


```js
function currying(fn, ...args) {
    return (..._arg) => {
        return fn(...args, ..._arg);
    }
}
```

```js
function sum(a,b,c) {
    return a + b + c
}
let add = currying(sum,10);
```

#### Advanced implementation

```js
function curry(func) {
    return function curried(...args) {
        if (args.length >= func.length) {
            return func.apply(this, args)
        } else {
            return function(...args2) { 
                return curried.apply(this, args.concat(args2))
            }
        }
    }
}
```

Usage

```js
function sum(a, b, c) {
  return a + b + c;
}

let curriedSum = curry(sum);

// Callable normally
curriedSum(1, 2, 3) 

// Currying of 1st argument
curriedSum(1)(2,3) 

// Currying all arguments
curriedSum(1)(2)(3)
```


### Closures

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


### Manipulating SVG

```html
<svg id="display" width="50" height="50" style="background-color: aqua;"></svg>
```


```javascript
let element = document.createElementNS("http://www.w3.org/2000/svg", 'rect')
element.setAttribute("x", 25)
element.setAttribute("y", 25)
element.setAttribute("width", 25)
element.setAttribute("height",25)
element.setAttribute("fill", "black")
let display = document.getElementById("display")
display.appendChild(element)
```