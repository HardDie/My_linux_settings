#!/bin/bash
## VLC
PCKGS="vlc"
PCKGS+=" qt4"

## Firefox
PCKGS+=" firefox"

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

## Libre Office
PCKGS+=" libreoffice-fresh"

## Keepass
PCKGS+=" keepass"

yaourt -S $PCKGS
