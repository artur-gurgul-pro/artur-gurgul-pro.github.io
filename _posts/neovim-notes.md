---
layout: post
title:  "Neovim notes"
categories: software neovim
---

#### Recording macros

* recording macro `wq`, appending `:let @W='i;'
* let @a = "abc\<Esc>:echo 'gotcha'\<CR>"
* `:reg a` or `: reg`
* `"xp` pastes the contents of the register `x`.

#### Manipulate registers

- `%` holds current file path
- `:` most recent executed command, `@:` execute last command again


#### Write selected text to the new file

    :'<,'>w filename.txt

#### Tips

Tip: Delate araund [ : `da[`

* Pipe current file to bash `:%! [cmd]`