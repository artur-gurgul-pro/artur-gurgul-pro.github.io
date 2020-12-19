---
layout: post
title:  Ubuntu - Power management
date:   2016-10-19 12:09:07 +0200
categories: linux recepies
---

To make Ubuntu do nothing when laptop lid is closed:

From For 13.10 onwards:

Open the `/etc/systemd/logind.conf` file in a text editor as root, for example,

    sudo -H gedit /etc/systemd/logind.conf

If `HandleLidSwitch` is not set to ignore then change it:

    HandleLidSwitch=ignore

Other settings that the action can be ignored: `HandleLidSwitchExternalPower`, `HandleLidSwitchDocked`, `IdleAction`.

Restart the systemd daemon (be aware that this will log you off) with this command:

    sudo systemctl restart systemd-logind

or, from 15.04 onwards:

    sudo service systemd-logind restart