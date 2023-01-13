#!/bin/bash

set -e

function sig()
{
	echo "Trap"
}

trap sig RTMIN+1
trap sig RTMIN+2
trap sig RTMIN+3

while true; do
	echo "$(date) Starting waybar..." >>/tmp/waybar.log
	USERID=$(id -u)
	SOCK=$(ls /run/user/${USERID}/sway-ipc.*.sock)
	{
		SWAYSOCK=${SOCK} waybar -c ~/.config/sway/waybar.conf -s ~/.config/sway/style.css $@ 2>>/tmp/waybar.log
	} || {
		echo "Got error $?"
	}
	echo "$(date) Waybar were closed with code: $?" >>/tmp/waybar.log
done
