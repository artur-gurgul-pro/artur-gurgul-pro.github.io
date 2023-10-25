---
layout: post
title:  "Installing Debian sid on QEMU"
categories: software debian
---


Download links

<!-- https://www.debian.org/CD/live/ -->

- [amd64 - Install disc](https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-12.2.0-amd64-netinst.iso)
- [amd64 - Live disc](https://cdimage.debian.org/debian-cd/current-live/amd64/iso-hybrid/)

Recomendation: 

- Select no desktop and SSH server


#### Allowing login root user from the network

```bash
apt install neovim

nvim /etc/ssh/sshd_config
PermitRootLogin yes

systemctl restart sshd

```

Make it #sid

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

