---
layout: post
title:  "Unix commands cheat-sheet"
date:   2016-10-19 12:09:07 +0200
categories: unix
---

This post is meant to be a collective for basket for commands works on `FreeBSD`, `Debian`, `macOS`. Keep in mind that in some cases the commands might need to be tweaked to work.

### Getting new tools and software

Debian

{% highlight bash %}
aptitude search [KEYWORD]
aptitude install [PACKAGE_NAME]
{% endhighlight %}

macOS \[[The link to the installer of the package manager](http://brew.sh/index_pl.html)\]

{% highlight bash %}
brew search [KEYWORD]
brew install [KEYWORD]
{% endhighlight %}

FreeBSD

{% highlight bash %}
pkg search [KEYWORD]
pkg install [KEYWORD]
{% endhighlight %}

### Lunching the scripts on start

### Mounting Ram-disk 

{% highlight bash %}
mount -t [TYPE] -o size=[SIZE] [FSTYPE] [MOUNTPOINT]
{% endhighlight %}

* [TYPE] either tmpfs or ramfs.
* [SIZE] ie. 512m
* [FSTYPE] File system type, either tmpfs, ramfs, ext4, etc.

To make this setting persistent you might want to add to `/etc/fstab` fallowing line

{% highlight bash %}
tmpfs       /mnt/ramdisk tmpfs   nodev,nosuid,noexec,nodiratime,size=1024M   0 0
{% endhighlight %}


###  Networking
`dig artgur.net +nostats +nocomments +nocmd`

`iostat`
