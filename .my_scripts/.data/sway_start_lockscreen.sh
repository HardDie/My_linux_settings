#!/bin/bash

MAKO=$(pidof mako)

# Enable autosleep
killall swayidle
exec swayidle -w \
    timeout 10 'swaymsg "output * dpms off"' \
    resume 'swaymsg "output * dpms on"'&

# Disable notification on lockscreen
if [[ $MAKO ]]; then
	echo -n "invisible=1" > ~/.config/mako/config
	makoctl reload
fi

letterEnteredColor=d23c3dff
letterRemovedColor=d23c3dff
passwordCorrect=00000000
passwordIncorrect=d23c3dff
background=00000000
foreground=ffffffff
swaylock -i HDMI-A-1:.wallpapers/lockscreen_l.png -i HDMI-A-2:.wallpapers/lockscreen_r.png \
	--inside-color=$background --ring-color=$foreground --line-uses-inside \
	--key-hl-color=$letterEnteredColor --bs-hl-color=$letterRemovedColor --separator-color=$background \
	--inside-ver-color=$passwordCorrect --inside-wrong-color=$passwordIncorrect \
	--ring-ver-color=$foreground --ring-wrong-color=$foreground \
	--indicator-radius=40 --indicator-thickness=4 \
	--text-ver-color=$foreground

# Disable autosleep
killall swayidle

# Enable notification
if [[ $MAKO ]]; then
	echo -n "invisible=0" > ~/.config/mako/config
	makoctl reload
fi
