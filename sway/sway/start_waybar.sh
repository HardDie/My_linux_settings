#!/bin/bash

USERID=$(id -u)
SOCK=$(ls /run/user/${USERID}/sway-ipc.*.sock)
SWAYSOCK=${SOCK} waybar -c ~/.config/sway/waybar.conf -s ~/.config/sway/style.css
