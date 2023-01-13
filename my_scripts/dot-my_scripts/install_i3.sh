#!/bin/bash
## i3
PCKGS="i3-gaps"

## Driver
PCKGS+=" xf86-video-intel"

## Font
PCKGS+=" ttf-font-awesome-4"
PCKGS+=" ttf-hack"
PCKGS+=" terminus-font" # font for console

## File manager
PCKGS+=" pcmanfm"

## Program launcher
PCKGS+=" fehlstart-git"

## Different language for each window
PCKGS+=" xxkb"

## Change layout
sudo install -Dm 0644 .data/00-keyboard.conf /etc/X11/xorg.conf.d/00-keyboard.conf

## Disable auto sleep
sudo install -Dm 0644 .data/10-monitor.conf /etc/X11/xorg.conf.d/10-monitor.conf

## Auto enable numlock
PCKGS+=" numlockx"

## Allow start x server for users
echo allowed_users=anybody > /etc/X11/Xwrapper.config
echo needs_root_rigths=yes >> /etc/X11/Xwrapper.config

## Starting script
sudo install -Dm 0644 .data/.xinitrc ~/.xinitrc

yay -S $PCKGS
