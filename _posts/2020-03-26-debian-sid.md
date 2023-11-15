---
layout: post
title: Installing Debian sid on QEMU
categories: linux
---

This is the Debian setup where most of the examples shown on the website should work.

Download links:

<!-- https://www.debian.org/CD/live/ -->

- [amd64 - Install disc](https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-12.2.0-amd64-netinst.iso)
- [amd64 - Live disc](https://cdimage.debian.org/debian-cd/current-live/amd64/iso-hybrid/)
- [BIOS](https://github.com/clearlinux/common/raw/master/OVMF.fd)

Make the disk image

```
qemu-img create -f qcow2 debian.qcow2 16G
```

Other option

```
qemu-img create -f raw debian.raw 16G
-drive file=disk.raw,format=raw
```


Start the VM

```bash
qemu-system-x86_64 -bios OVMF.fd -m 1G -drive file=debian.qcow2,format=qcow2 \
                   -cdrom debian-12.2.0-amd64-netinst.iso
```

During installation select SSH server, standard system utilities and no desktop

Exit the installation and power off the VM

Start VM with command

```bash
qemu-system-x86_64 -bios OVMF.fd -m 1G -smp 6 \
                   -net user,hostfwd=tcp::2222-:22 -net nic \
                   -drive file=debian.qcow2,format=qcow2
```
#### Allowing login root user from the network
This is our testing installation, so we do not care about security, but easiness and convenience. 

```bash
nano /etc/ssh/sshd_config
```

`Ctrl-o` `Ctrl-x`

Put this line in the file
```plain
PermitRootLogin yes
```

and then

```bash
systemctl restart sshd
```

From now on you can log in to the VM using ssh connection

```
ssh -p 2222 user@localhost
```

Making it the sid 
=======

/etc/apt/sources.list

```
deb https://deb.debian.org/debian/ sid main contrib non-free non-free-firmware
deb-src https://deb.debian.org/debian/ sid main contrib non-free non-free-firmware
```

```bash
apt update
apt upgrade
apt dist-upgrade
apt autoremove

apt install firmware-linux-nonfree
```

Tools
====

```sh
apt install neovim clang
```

**Swift**

Dependencies

```sh
apt install build-essential libcurl4-openssl-dev binutils git gnupg2 libc6-dev \
            libedit2 libsqlite3-0 libxml2-dev libz3-dev pkg-config tzdata \
            tzdata unzip zlib1g-dev libgcc-9-dev libncurses-dev \
            libstdc++-9-dev
```

Missing dependencies for Debian sid

```text
libpython3.8 
```

Installed instead

```plain
apt install libpython3.10-dev python3-clang python3-lldb
```


Downloading and installing

```
wget https://download.swift.org/swift-5.9.1-release/ubuntu2204/swift-5.9.1-RELEASE/swift-5.9.1-RELEASE-ubuntu22.04.tar.gz

tar -xf swift-5.9.1-RELEASE-ubuntu22.04.tar.gz
mv swift-5.9.1-RELEASE-ubuntu22.04 /opt/swift-5.9.1
```


add this line to `/etc/profile` so the path will be added for all the users

```plain
export PATH="$PATH:/opt/swift-5.9.1/usr/bin"
```