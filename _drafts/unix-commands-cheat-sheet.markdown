---
layout: post
title:  "[draft] Unix commands cheat-sheet"
date:   2016-10-19 12:09:07 +0200
categories: unix
---

My faworite OS is Haiku, I read the code and I am trying to figure out whats going on inside. The UI is more tight into OS than in GNU/Linux. However the OS is way far from stable state, so I would like to dedicate the article to other Unixlike OS'es that I like.



### Getting new tools and software

Debian

{% highlight bash %}
aptitude search $KEYWORD
aptitude install $PACKAGE_NAME
{% endhighlight %}

macOS \[[The link to the installer of the package manager](http://brew.sh/index_pl.html)\]

{% highlight bash %}
brew search $KEYWORD
brew install $KEYWORD
{% endhighlight %}

FreeBSD

{% highlight bash %}
pkg search [KEYWORD]
pkg install [KEYWORD]
{% endhighlight %}

### Lunching the scripts on start

### Mounting Ram-disk 

This might be useful for spead up computation

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


###  Networking - Checking for open ports
`dig artgur.net +nostats +nocomments +nocmd`

`iostat`
