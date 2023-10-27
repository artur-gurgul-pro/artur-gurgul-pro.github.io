---
layout: post
title:  Linux - Mount disk from qcow2 image
categories: linux
---


**Step 1 - Enable NBD on the Host**

```
modprobe nbd max_part=8
```

**Step 2 - Connect the QCOW2 as network block device**

```
qemu-nbd --connect=/dev/nbd0 /var/lib/vz/images/100/vm-100-disk-1.qcow2
```

**Step 3 - Find The Virtual Machine Partitions**

```
fdisk /dev/nbd0 -l
```

**Step 4 - Mount the partition from the VM**

```
mount /dev/nbd0p1 /mnt/somepoint/
```

**Step 5 - After you done, unmount and disconnect**

```
umount /mnt/somepoint/
qemu-nbd --disconnect /dev/nbd0
rmmod nbd
```
