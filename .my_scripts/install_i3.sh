#!/bin/bash
## i3
PCKGS="i3-gaps"
PCKGS+=" i3lock-color-git"
PCKGS+=" i3blocks"

## xorg
PCKGS+=" xorg-server"
PCKGS+=" xorg-xinit"

## Driver
PCKGS+=" xf86-video-intel"

## For disable second screen
PCKGS+=" xorg-xrandr"

## Terminal
PCKGS+=" termite"

## Font
PCKGS+=" ttf-font-awesome-4"
PCKGS+=" ttf-hack"
PCKGS+=" terminus-font" # font for console

## Background
PCKGS+=" nitrogen"

## File manager
PCKGS+=" pcmanfm"

## Program launcher
PCKGS+=" fehlstart-git"

## Different language for each window
PCKGS+=" xxkb"

## Transparents
PCKGS+=" compton"

## Sound
PCKGS+=" pulseaudio"
PCKGS+=" pulseaudio-alsa" # For mixed sound from different applications
PCKGS+=" pavucontrol" # GUI mixer
PCKGS+=" pamixer" # For show volume in tray
sudo install -Dm 0755 .data/vol /lib/i3blocks/vol

## Downgrader
PCKGS+=" downgrade"

## Screenshot
PCKGS+=" scrot"

## For power functions
PCKGS+=" polkit"

## Utils
PCKGS+=" htop"
PCKGS+=" unzip"

## Change layout
sudo install -Dm 0644 .data/00-keyboard.conf /etc/X11/xorg.conf.d/00-keyboard.conf

## Disable auto sleep
sudo install -Dm 0644 .data/10-monitor.conf /etc/X11/xorg.conf.d/10-monitor.conf

## Mobile file systems
PCKGS+=" gvfs"
PCKGS+=" gvfs-mtp"

## Support NTFS
PCKGS+=" ntfs-3g"

## Auto enable numlock
PCKGS+=" numlockx"

## Download software
PCKGS+=" aria2"

## Show bandwidth
PCKGS+=" bc" # Calculator
sudo install -Dm 0755 .data/bandwidth_ /lib/i3blocks/bandwidth_

## Show wifi and ethernet link status
PCKGS+=" iw" # Get wifi status
sudo install -Dm 0755 .data/wifi_ /lib/i3blocks/wifi_
sudo install -Dm 0755 .data/eth_ /lib/i3blocks/eth_
sudo install -Dm 0755 .data/layout_ /lib/i3blocks/layout_

## Install pango widgets
# Need install font nerd-fonts-complete
sudo install -Dm 0755 .data/pango_bandwidth_ /lib/i3blocks/pango_bandwidth_
sudo install -Dm 0755 .data/pango_calendar_ /lib/i3blocks/pango_calendar_
sudo install -Dm 0755 .data/pango_disk_ /lib/i3blocks/pango_disk_
sudo install -Dm 0755 .data/pango_eth_ /lib/i3blocks/pango_eth_
sudo install -Dm 0755 .data/pango_layout_ /lib/i3blocks/pango_layout_
sudo install -Dm 0755 .data/pango_load_average_ /lib/i3blocks/pango_load_average_
sudo install -Dm 0755 .data/pango_memory_ /lib/i3blocks/pango_memory_
sudo install -Dm 0755 .data/pango_time_ /lib/i3blocks/pango_time_
sudo install -Dm 0755 .data/pango_vol_ /lib/i3blocks/pango_vol_
sudo install -Dm 0755 .data/pango_wifi_ /lib/i3blocks/pango_wifi_

## Allow start x server for users
echo allowed_users=anybody > /etc/X11/Xwrapper.config
echo needs_root_rigths=yes >> /etc/X11/Xwrapper.config

## Starting script
sudo install -Dm 0644 .data/.xinitrc ~/.xinitrc

yay -S $PCKGS
