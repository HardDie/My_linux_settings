#!/bin/bash

## For first wifi
pacman -S networkmanager
systemctl enable NetworkManager

## /etc/locale.gen
sed -ie 's/^#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
sed -ie 's/^#ru_RU.UTF-8 UTF-8/ru_RU.UTF-8 UTF-8/' /etc/locale.gen
locale-gen

## /etc/locale.conf
echo LANG=en_US.UTF-8 > /etc/locale.conf
export LANG=en_US.UTF-8

## /etc/vconsole.conf
echo KEYMAP=ru > /etc/vconsole.conf
echo FONT=cyr-sur16 >> /etc/vconsole.conf

## /etc/localtime
ln -sf /usr/share/zoneinfo/Asia/Novosibirsk /etc/localtime

## /etc/hostname
HOST_NAME="ICONIA"
echo $HOST_NAME > /etc/hostname

## Setup color pacman
sed -ie 's/^#Color/Color\nILoveCandy/' /etc/pacman.conf

## Enable multilib in pacman
sed -ie 's/^#\[multilib\]/\[multilib\]\nInclude = \/etc\/pacman.d\/mirrorlist/' /etc/pacman.conf

## yaourt
echo >> /etc/pacman.conf
echo '[archlinuxfr]' >> /etc/pacman.conf
echo 'SigLevel = Never' >> /etc/pacman.conf
echo 'Server = http://repo.archlinux.fr/$arch' >> /etc/pacman.conf
pacman -Syy yaourt
