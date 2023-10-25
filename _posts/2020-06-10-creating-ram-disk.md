---
layout: post
title:  "Linux - RAM disk"
categories: linux recepies
---

This might be useful for spead up programs that heavily use disk.

```
mount -t TYPE -o size=SIZE FSTYPE MOUNTPOINT
```
* `TYPE` &rarr; either `tmpfs` or `ramfs`.
* `SIZE` &rarr; ie. `512m`
* `FSTYPE` &rarr; File system type, either `tmpfs`, `ramfs`, `ext4`, etc.

To make this setting persistent you might want to add to `/etc/fstab` fallowing line

{% highlight shell %}
tmpfs /mnt/ramdisk tmpfs nodev,nosuid,noexec,nodiratime,size=1024M 0 0
{% endhighlight %}

