#!/bin/bash
#https://source.unsplash.com/1920x1080/?

check_bin() {
	which $1 > /dev/null 2>/dev/null
	RES=$?
	if [[ $RES -eq 1 ]]; then
		echo "Can't find '$1' bin, try install '$2' packet"
		exit
	fi
}

check_bin "wget" "wget"

USERID=$(id -u)
SOCK=$(ls /run/user/${USERID}/sway-ipc.*.sock)

while true; do
	wget -q "https://source.unsplash.com/1920x1080/?" -O $HOME/.wallpapers/wallpaper_new.png
	SWAYSOCK=${SOCK} swaymsg 'output "*" background $HOME/.wallpapers/wallpaper_new.png fill'

	echo "Good? [Y/n]: "
	read answer;
	if [[ $answer != "n" && $answer != "N" ]]; then
		break
	fi
done
