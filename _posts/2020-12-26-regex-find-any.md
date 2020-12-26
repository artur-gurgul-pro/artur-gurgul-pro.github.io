---
layout: post
title:  "Regex: Find any"
date:   2020-10-19 12:09:07 +0200
categories: regex
---

How to match “any character” in regular expression

- `.` => any char except newline
- `\.` => the actual dot character
- `.?` = `.{0,1}` = match any char except newline zero or one times
- `.*` = `.{0,}` = match any char except newline zero or more times
- `.+` = `.{1,}` = match any char except newline one or more times