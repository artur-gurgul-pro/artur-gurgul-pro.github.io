---
layout: post
title:  "Installing Debian sid on QEMU"
categories: software debian
---

This is Debian setup where most of the examples shown on the website should work on.

Download links:

<!-- https://www.debian.org/CD/live/ -->

- [amd64 - Install disc](https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-12.2.0-amd64-netinst.iso)
- [amd64 - Live disc](https://cdimage.debian.org/debian-cd/current-live/amd64/iso-hybrid/)

Make the disk image

```
qemu-img create -f qcow2 debian.qcow2 16G
```

Start the VM

```
qemu-system-x86_64 -bios OVMF.fd -m 1G -drive file=debian.qcow2,format=qcow2 \
                   -cdrom debian-12.2.0-amd64-netinst.iso
```

During installation select SSH server and no desktop 


#### Allowing login root user from the network

```bash
nvim /etc/ssh/sshd_config
PermitRootLogin yes

systemctl restart sshd
```

=======

/etc/apt/sources.list

```
deb https://deb.debian.org/debian/ sid main contrib non-free non-free-firmware
deb-src https://deb.debian.org/debian/ sid main contrib non-free non-free-firmware
```

```bash
apt update
apt dist-upgrade

apt install firmware-linux-nonfree
```

