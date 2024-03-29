#!/bin/bash

stow --dotfiles -t "$HOME" vim
stow --dotfiles -t "$HOME" zsh
stow --dotfiles -t "$HOME" tmux
stow --dotfiles -t "$HOME" git
stow --dotfiles -t "$HOME" fonts
stow --dotfiles -t "$HOME" ncmpcpp
stow --dotfiles -t "$HOME" my_scripts

mkdir -p "$HOME/.config"
stow --dotfiles -t "$HOME/.config" termite
stow --dotfiles -t "$HOME/.config" alacritty
stow --dotfiles -t "$HOME/.config" i3
stow --dotfiles -t "$HOME/.config" oh-my-zsh
stow --dotfiles -t "$HOME/.config" dunst
stow --dotfiles -t "$HOME/.config" sway
stow --dotfiles -t "$HOME/.config" docker
stow --dotfiles -t "$HOME/.config" tmux-theme
stow --dotfiles -t "$HOME/.config" mako
