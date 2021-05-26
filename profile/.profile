#!/bin/sh

# Default programs
export EDITOR="nvim"
export BROWSER="brave-browser" # or brave
export TERMINAL="alacritty"

# PATH
export PATH="$HOME/.local/bin:$HOME/.emacs.d/bin:$PATH"

# Rust
. "$HOME/.cargo/env"

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATE_HOME="$HOME/.local/share"
