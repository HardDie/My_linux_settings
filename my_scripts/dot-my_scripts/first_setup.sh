#!/bin/bash

## /etc/locale.gen
echo Setup /etc/locale.gen
sed -ie 's/^#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
sed -ie 's/^#ru_RU.UTF-8 UTF-8/ru_RU.UTF-8 UTF-8/' /etc/locale.gen
locale-gen > /dev/null
echo Setup!

## /etc/locale.conf
echo Setup /etc/locale.conf
echo LANG=en_US.UTF-8 > /etc/locale.conf
export LANG=en_US.UTF-8
echo Setup!

## /etc/vconsole.conf
echo Setup /etc/vconsole.conf
echo KEYMAP=ru > /etc/vconsole.conf
echo FONT=ter-v32n >> /etc/vconsole.conf
echo Setup!

## /etc/localtime
echo Setup /etc/localtime
ln -sf /usr/share/zoneinfo/Asia/Novosibirsk /etc/localtime
echo Setup!

## /etc/hostname
echo Setup /etc/hostname
HOST_NAME="ICONIA"
echo $HOST_NAME > /etc/hostname
echo Setup!

## Setup color pacman
echo Setup color pacman
sed -ie 's/^#Color/Color\nILoveCandy/' /etc/pacman.conf
echo Setup!

## Enable multilib in pacman
echo Setup multilib pacman
sed -ie 's/^#\[multilib\]/\[multilib\]\nInclude = \/etc\/pacman.d\/mirrorlist/' /etc/pacman.conf
echo Setup!

## Update DB
echo Update pacman cache
pacman -Syy --noconfirm
echo Updated!

## Install console font
echo Installing console font
pacman -S --noconfirm terminus-font
echo Installed!
