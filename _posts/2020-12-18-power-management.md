---
layout: post
title:  Make Ubuntu do nothing when laptop lid is closed
date:   2016-10-19 12:09:07 +0200
categories: linux recepies
---

To make Ubuntu do nothing when laptop lid is closed:

For 13.10 - 20.04.1:

Open the /etc/systemd/logind.conf file in a text editor as root, for example,

    sudo -H gedit /etc/systemd/logind.conf

If HandleLidSwitch is not set to ignore then change it:

    HandleLidSwitch=ignore

Make sure it's not commented out (it is commented out if it is preceded by the symbol #) or add it if it is missing,

Restart the systemd daemon (be aware that this will log you off) with this command:

    sudo systemctl restart systemd-logind

or, from 15.04 onwards:

    sudo service systemd-logind restart
