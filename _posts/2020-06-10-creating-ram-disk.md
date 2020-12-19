---
layout: post
title:  "Linux - RAM disk "
date:   2020-10-19 12:09:07 +0200
categories: linux recepies
---

This might be useful for spead up programs that heavily use disk.

{% highlight bash %}
mount -t [TYPE] -o size=[SIZE] [FSTYPE] [MOUNTPOINT]
{% endhighlight %}

* [TYPE] either tmpfs or ramfs.
* [SIZE] ie. 512m
* [FSTYPE] File system type, either tmpfs, ramfs, ext4, etc.

To make this setting persistent you might want to add to `/etc/fstab` fallowing line

{% highlight bash %}
tmpfs  /mnt/ramdisk  tmpfs  nodev,nosuid,noexec,nodiratime,size=1024M  0  0
{% endhighlight %}

