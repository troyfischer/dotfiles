#!/bin/sh

stow alacritty
stow bspwm
stow Code
stow polybar
stow profile
# stow redshift - not sure why redshift isn't working with a symlinked config
cp redshift/.config/redshift.conf ~/.config/redshift.conf
stow scripts
stow sxhkd
stow user-dirs
stow xinitrc
