---
layout: post
title:  "[DRAFT] Install media for archlinux"
date:   2020-10-19 12:09:07 +0200
categories: linux recepies
---

https://wiki.archlinux.org/index.php/Offline_installation

https://www.passwordstore.org/
rsync and NFS (supported by linux windows and mac) raid6 raid1 +3 dyski po 4TB
https://allegro.pl/oferta/dysk-twardy-wd-gold-1tb-3-5-9936547563
https://www.msi.com/Motherboard/B450I-GAMING-PLUS-AC
https://allegro.pl/oferta/msi-b450i-gaming-plus-ac-msi-b450i-gaming-plus-ac-9729080130
https://allegro.pl/oferta/dysk-twardy-wd-gold-18tb-3-5-9939956360
https://github.com/sjiveson/nfs-server-alpine

brew install aria2
aria2c
transimission-cli
aria2c "magnet:?xt=urn:btih:944cc141baf25155bfb110273140f1e0e6687f4b&dn=archlinux-2021.01.01-x86_64.iso"

echo "select * from bookmarks" | sqlite3 bookmarks.db | fzf

https://www.freecodecamp.org/news/fzf-a-command-line-fuzzy-finder-missing-demo-a7de312403ff/

setup https://github.com/djpohly/dwl

I am using MacOS to create a install media. In order to write the image to a USB stick we need to unmount all the filesystems that are located on the device.


pacman -S zathura

sudo pacman -S poppler => gives pdftotext

  git -C /usr/local/Homebrew/Library/Taps/homebrew/homebrew-core fetch --unshallow
  git -C /usr/local/Homebrew/Library/Taps/homebrew/homebrew-cask fetch --unshallow

    diskutil unmount /dev/disk2s1

Here is how we can list all the disks attached to the system

    diskutil list

Download isofile from https://archlinux.org/releng/releases/

Writing image to the USB device (notice that we do not write to a partition)

    sudo dd if=archlinux-2021.01.01-x86_64.iso of=/dev/disk2

then we can flush data by ejecting the drive

    diskutil eject /dev/disk2

Now we can plug the usb to a computer we want to install archlinux on. In my case it is Mac mini. Hold alt (option) button and select the install disk to boot up.

Here are commands to check what discs are attached to the system

    cat /proc/partitions
    ls /dev/[s|x|v]d*
    lsblk
    fdisk –l
    ls /dev | grep ‘^[s|v|x][v|d]’$*

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

