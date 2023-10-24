---
layout: post
title:  "Manipulate SVG as a rester picture"
categories: web svg
---

```js
let display = document.getElementById("display")
let pixels = [...Array(640).keys()].map(i => {
  return [...Array(480).keys()].map(j => {
    let element = document
                .createElementNS("http://www.w3.org/2000/svg", 'rect')
	element.setAttribute("x", `${i}`)
	element.setAttribute("y", `${j}`)
	element.setAttribute("width", "1")
	element.setAttribute("height", "1")
	element.setAttribute("fill", "black")
	display.appendChild(element)
	return element
  })
})

pixels[60][60].setAttribute("fill", "white")
```

