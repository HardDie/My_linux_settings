#!/bin/bash
## Console
PCKGS="zsh"
PCKGS+=" oh-my-zsh-git"
PCKGS+=" tmux"
PCKGS+=" powerline"
PCKGS+=" xclip"

## Microcode
PCKGS+=" intel-ucode"
yaourt -S $PCKGS
