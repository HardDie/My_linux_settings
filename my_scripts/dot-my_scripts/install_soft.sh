#!/bin/bash
## VLC
PCKGS="vlc"
PCKGS+=" qt4"

## Image view
PCKGS+=" feh"

## File manager
PCKGS+=" pcmanfm"

## Music player
PCKGS+=" qmmp"

## Emacs
PCKGS+=" emacs"

## Gimp
PCKGS+=" gimp"

## Keepass
PCKGS+=" keepass"

## Printer
PCKGS+=" cups"
PCKGS+=" system-config-printer"
PCKGS+=" brother-hl1118"
echo "For enable printer daemon"
echo "exec: systemctl start org.cups.cupsd.service"

yay -S $PCKGS
