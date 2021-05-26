#!/bin/bash

if [[ -z $1 ]]; then
	# With empty arguments make screenshot full screen
	SHAPE=`swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .rect | "\(.x),\(.y) \(.width)x\(.height)"'`
elif [[ $1 == "-a" ]]; then
	# With argument "-a" make screenshot active window
	SHAPE=`swaymsg -t get_tree | jq -r '.. | (.nodes? // empty)[] | select(.focused) | .rect | "\(.x),\(.y) \(.width)x\(.height)"'`
elif [[ $1 == "-r" ]]; then
	# With argument "-r" make screenshot for selected shape
	SHAPE=$(slurp)
	if [[ $? == 1 ]]; then
		# Do not show notification if screen shot was discard
		exit
	fi
else
	# Error situation
	echo ERROR
	exit
fi

RES=$(echo -n $SHAPE | cut -d ' ' -f 2)
DATE=$(date +"%Y-%m-%d-%H-%M-%S")
NAME=${DATE}_${RES}_grim.png

DIRECTORY="Screenshots"
if [[ ! -d ~/$DIRECTORY ]]; then
	mkdir ~/Screenshots
fi

if [[ -z $1 ]]; then
	grim ~/$DIRECTORY/$NAME
	notify-send "Screenshot" "Image $NAME was created!"
else
	grim -g "$SHAPE" ~/$DIRECTORY/$NAME
	notify-send "Screenshot" "Image $NAME was created!"
fi
