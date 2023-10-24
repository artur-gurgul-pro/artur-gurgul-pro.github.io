---
layout: post
title:  Commandline recepies
date:   2016-10-19 12:09:07 +0200
categories: commandline
---

##### Read a DNS records

    dig artgur.net +nostats +nocomments +nocmd

##### I/O Stats

    iostat

##### Checking type of executable files

    otool -hv test.so

##### Get directory size

    du -sh MacOSBackup

##### Generate random password

    pwgen -s -1 32

##### List block devices

    lsblk

#### list of wireless cards

    `lspci -knn | grep Net -A2`

#### Scan networks 

    iwlist scan

#### Shutdown

    shutdown -h now

#### Connect to the network

nmcli dev wifi connect TP-Link_5828 password my-secret-pass

#### sql
 Add a check constraint to the `id` column to enforce alphanumeric strings of exactly 5 characters long */ 
```sql
ALTER TABLE short_urls ADD CONSTRAINT id CHECK (id ~ '^[a-zA-Z0-9]{5}$');
```

### Console font size

Edit file => `/etc/default/console-setup`

### Installing nonfree firmware

 Firmware for nonfree wifi driver for Intel's WIFI cards
    
    https://packages.debian.org/sid/firmware-iwlwifi

```bash
apt-get update && apt-get install firmware-linux-nonfree
```



#### Another way

[https://www.intel.com/content/www/us/en/support/articles/000005511/wireless.html](https://www.intel.com/content/www/us/en/support/articles/000005511/wireless.html)

Installation of the firmware is simply:

```
    % cp iwlwifi-cc-a0-46.ucode /lib/firmware
```