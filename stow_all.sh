#!/bin/sh

stow alacritty
stow profile
# stow redshift - not sure why redshift isn't working with a symlinked config
cp redshift/.config/redshift.conf ~/.config/redshift.conf
stow scripts
stow user-dirs
stow zathura
stow zprofile
stow zsh
