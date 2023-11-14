---
layout: post
title: Archlinux
date: 2020-10-19 12:09:07 +0200
categories: linux
---

Links:
- [torrents with ISO files](https://archlinux.org/releng/releases/)
- [latest ISO version from HTTP mirror](https://geo.mirror.pkgbuild.com/iso/latest/)
- [Offline: Most recent installation guide](https://wiki.archlinux.org/index.php/Offline_installation)
- [UEFI: Most recent installation guide](https://wiki.archlinux.org/title/installation_guideI)

## Prepare install media

```bash
brew install aria2
aria2c "magnet:?xt=urn:btih:944cc141baf25155bfb110273140f1e0e6687f4b&dn=archlinux-2021.01.01-x86_64.iso"
```

Unmounting an USB stick

```bash
diskutil unmount /dev/disk2s1
```


Here is how we can list all the disks attached to the system

```bash
diskutil list
```


Writing image to the USB device (notice that we do not write to a partition)

```bash
sudo dd if=archlinux-2021.01.01-x86_64.iso of=/dev/disk2
```

then  flush the data by ejecting the drive

```bash
diskutil eject /dev/disk2
```

# Installation

Note: in case case it is Mac mini. Hold alt (option)  button on boot up  and select the install disk.

Here are commands to check what discs are attached to the system

```bash
cat /proc/partitions
ls /dev/[s|x|v]d*
lsblk
fdisk –l
ls /dev | grep ‘^[s|v|x][v|d]’$*
```

<!--
The install disk has free space which we can use (for example to create install scripts in case we use the install disk several times)

    cfdisk /dev/sdb

Select thf freespace and hit `[New]` and `Enter` => `[Write]` => `enter` => `yes`  =>`Enter` => `[Quit]`

Now we have unformatted partition. To screate FAT32 execute this commend

   mkfs.vfat -F 32 /dev/sdb4

Mount it as home folder
   mount /dev/sdb4 /root
   # and go to the new home root
   cd

   # this command was given by arch wiki but do not work for me
   # https://wiki.archlinux.org/index.php/FAT
   mount -i -t vfat -oumask=0000,iocharset=utf8 /dev/sdb4 /root


Now I realized I can edit system, so the partition that I have just created I can mount on start. There are steps I took.

- On the USB stick there is prtition named Gap1. I remove it becouse it seems to not be needed. I use `gparted` for that.
- Shrink vfat partition to 8000 MiB and place it at the and.

- Crate partitions to look like this: `[1: 628.97MiB]` `[2: 2.2 GiB]` `[3: 59 MiB]` `[4: 4000 MiB]` `[5: 8000MiB]`
    1. `ARCH202101`: It is the oryginal partition ISO9660 I had after writing image
    2. Freespace that will might be used when I edit the first partition 
    3. The UEFI partition where is placed bootloader that starts sysyem that is located on the first partition. This partition comes form the orygunal image.
    4. `CHROOT`: This parition will contains files of the installer system. They are placed on Ext4 partition, so we can edit files and regenerate ISO file from it.
    5. Home folder for root user, so when we can write scripts, store files so we can use them in other instalation process. 

Now we copy read only files from read only system to writable partition
    
    sudo mount -o loop /media/artur/ARCH202101/arch/x86_64/airfs.sfs /mnt 
    sudo cp -T /mnt /media/artur/CHROOT
-->

Update packages manager

```bash
pacman -Sy
```


Make a partition table

```bash
parted -s /dev/sda mktable GPT
```

### Create partitions
 
In this case: 

- 300MB  &rarr;  UEFI
- 16GB  &rarr;  Swap
- Rest  &rarr;  System 

List all types of partitions

```bash
sfdisk -T
```

#### First way: Using `sfdisk`

```bash
sfdisk /dev/sda << EOF
 ,300,ef
 ,16000,S,h
 ;
EOF
```

or pipe to the program like

```bash
echo ',,c;' | sfdisk /dev/sdd
```

#### First way: Using `fdisk`

```bash
fdisk /dev/sda << FDISK_CMDS
g
n
1

+300MiB
t
1
n
2

+16GiB
t
2
19
n
3


t
3
20
w
FDISK_CMDS
```

Formatting

```bash
mkfs.fat -F32 /dev/sda1
mkswap /dev/sda2
mkfs.ext4 /dev/sda3
```

Mounting partitions

```bash
mount /dev/sda3 /mnt
swapon /dev/sda2
```

Installing base packages

```bash
pacstrap /mnt base base-devel linux linux-firmware
```

Generate `fstab`

```bash
genfstab -U -p /mnt >> /mnt/etc/fstab
```

Chrooting 

```bash
arch-chroot /mnt << CHROOT
	#commands
CHROOT
```

or just `arch-chroot /mnt` and then commands

```bash
echo "archlinux" > /etc/hostname
sed -i "s/#en_US/en_US/g" /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
export LANG=en_US.UTF-8
ln -s /usr/share/zoneinfo/Europe/Warsaw /etc/localtime
hwclock --systohc --utc
```

#### Run 32bit apps

open  &rarr; `/etc/pacman.conf` and uncomment `[multilib]` section

Installing additional software

```bash
pacman -Syu
pacman -S zsh --noconfirm
```

#### Setup users

Set password for root

```bash
passwd
```

Create user 

```bash
useradd -mg users -G wheel,storage,power -s /usr/bin/zsh user
```

```
passwd user
```

You can force user to change password

```bash
chage -d 0 user
```

sudoers

```bash
visudo
```

or 

```bash
cat >> /etc/sudoers <<EOL
%wheel ALL=(ALL) NOPASSWD: ALL
EOL
```

### Setting up bootloader

```bash
pacman -S grub efibootmgr dosfstools os-prober mtools --noconfirm
mkdir /boot/EFI
mount /dev/sda1 /boot/EFI
grub-install --target=x86_64-efi --efi-directory=EFI --bootloader-id=grub_uefi --recheck


grub-mkconfig -o /boot/grub/grub.cfg
```


then `exit` and 

- `umount -a`
- `poweroff`

## More customisation

#### DHCP

```
pacman -S dhcpcd --noconfirm
```

```s
systemctl enable dhcpcd
systemctl start dhcpcd
```

```bash
dhcpcd enp3s0f0
```

```
ip a

ping -c2 google.com
```

