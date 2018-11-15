#!/bin/bash
## i3
PCKGS="i3-gaps"
PCKGS+=" i3lock-color-git"
PCKGS+=" i3blocks"

## xorg
PCKGS+=" xorg-server"
PCKGS+=" xorg-xinit"

## For disable second screen
PCKGS+=" xorg-xrandr"

## Terminal
PCKGS+=" termite"

## Font
PCKGS+=" ttf-font-awesome-4"
PCKGS+=" ttf-hack"

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

## Starting script
sudo install -Dm 0644 .data/.xinitrc ~/.xinitrc

yay -S $PCKGS
