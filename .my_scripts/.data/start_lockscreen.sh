#!/bin/bash

letterEnteredColor=d23c3dff
letterRemovedColor=d23c3dff
passwordCorrect=00000000
passwordIncorrect=d23c3dff
background=00000000
foreground=ffffffff
i3lock \
	-t -i ~/.wallpapers/lockscreen.png \
	--timepos='x+110:h-70' \
	--datepos='x+42:h-45' \
	--clock --date-align 1 \
	--insidecolor=$background --ringcolor=$foreground --line-uses-inside \
	--keyhlcolor=$letterEnteredColor --bshlcolor=$letterRemovedColor --separatorcolor=$background \
	--insidevercolor=$passwordCorrect --insidewrongcolor=$passwordIncorrect \
	--ringvercolor=$foreground --ringwrongcolor=$foreground --indpos='x+280:h-70' \
	--radius=20 --ring-width=4 --veriftext='' --wrongtext='' \
	--verifcolor="$foreground" --timecolor="$foreground" --datecolor="$foreground" \
	--noinputtext='' --force-clock
