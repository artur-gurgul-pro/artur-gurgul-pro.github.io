---
layout: post
title:  "Creating chroot environment of Debian sid"
categories: software debian
---


1.  Create a directory that you want to use for the base system (_chroot-debian_ in this case).
```bash
mkdir chroot-debian
```   
2.  Create a base system.
```bash
    sudo debootstrap sid chroot-debian http://deb.debian.org/debian
```   
You can change _sid_ to _stable_ to use the stable distribution, and to use Debian mirror closer to your physical location for faster download speed.
    
3.  Mount _proc_ and _dev_ filesystem.
```bash
sudo mount -o bind /dev chroot-debian/dev
sudo mount -o bind /proc chroot-debian/proc
```   
4.  Start chrooting.
```bash
sudo chroot chroot-debian /bin/bash
```
5.  Once done, exit the session and don't forget to unmount the _dev_ and _proc_ filesystem.
```bash
sudo umount chroot-debian/dev chroot-debian/proc
```