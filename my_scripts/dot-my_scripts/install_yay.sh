#!/bin/bash

echo Install yay
cd /tmp
git clone https://aur.archlinux.org/yay.git yay
cd yay
makepkg -si
echo yay was Installed!
