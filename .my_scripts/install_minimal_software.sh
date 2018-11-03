#!/bin/bash
## Console
PCKGS="zsh"
PCKGS+=" oh-my-zsh-git"
PCKGS+=" tmux"
PCKGS+=" powerline"
PCKGS+=" xclip"

## Microcode
PCKGS+=" intel-ucode"
yay -S $PCKGS
