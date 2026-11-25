#!/bin/bash

is_darwin=0
if [[ "$(uname -s)" == "Darwin" ]]; then
	is_darwin=1
fi

if (( !is_darwin )); then
	stow --dotfiles -t "$HOME" fonts
	stow --dotfiles -t "$HOME" ncmpcpp
fi
stow --dotfiles -t "$HOME" vim
stow --dotfiles -t "$HOME" zsh
stow --dotfiles -t "$HOME" tmux
stow --dotfiles -t "$HOME" git
stow --dotfiles -t "$HOME" my_scripts

mkdir -p "$HOME/.config"
if (( !is_darwin )); then
	stow --dotfiles -t "$HOME/.config" termite
	stow --dotfiles -t "$HOME/.config" i3
	stow --dotfiles -t "$HOME/.config" dunst
	stow --dotfiles -t "$HOME/.config" sway
	stow --dotfiles -t "$HOME/.config" mako
fi
stow --dotfiles -t "$HOME/.config" alacritty
stow --dotfiles -t "$HOME/.config" oh-my-zsh
stow --dotfiles -t "$HOME/.config" docker
stow --dotfiles -t "$HOME/.config" tmux-theme
