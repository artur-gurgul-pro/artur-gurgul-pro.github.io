---
layout: post
title:  "Starting electron app on wayland"
categories: software wayland
---

Start chromium using wayland

```bash
chromium --enable-features=UseOzonePlatform --ozone-platform=wayland
```

It’s the same for electron-based apps:

```bash
`app-executable` --enable-features=UseOzonePlatform \
                 --ozone-platform=wayland
```

