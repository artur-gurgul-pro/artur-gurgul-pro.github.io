---
layout: post
title: Chroot environment of Debian sid
categories: software debian
---
 Install Bootstrap

```bash
sudo apt install debootstrap
```

Create a directory that you want to use for the base system (_chroot-debian_ in this case)

```bash
mkdir chroot-debian
```   

Create a base system

```bash
sudo debootstrap sid chroot-debian http://deb.debian.org/debian
```   

Valid names `sid`, `stable` or any debian code name

Mount  filesystems

```bash
sudo mount -o bind /dev chroot-debian/dev
sudo mount -t sysfs none chroot-debian/sys
sudo mount -o bind /proc chroot-debian/proc
```   

Optionally, copy DNS resolver configuration.

```
sudo cp /etc/resolv.conf /path/to/chroot-env/etc/resolv.conf
```

Start chrooting

```bash
sudo chroot chroot-debian /bin/bash
```

Once done, exit the session and unmount

```bash
sudo umount chroot-debian/dev chroot-debian/proc
```