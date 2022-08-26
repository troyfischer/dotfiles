#!/bin/zsh

# profile file. Runs on login. Environmental variables are set here.

# If you don't plan on reverting to bash, you can remove the link in ~/.profile
# to clean up.

alias vim=nvim
alias vi=nvim
alias v=nvim

# Default programs:
export EDITOR="emacs"
export BROWSER="brave"

# ~/ Clean-up:
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export PASSWORD_STORE_DIR="$HOME/.password-store"

# Adds `~/.local/bin` to $PATH
export PATH="$HOME/.local/bin:$PATH"
export PATH="$(python3 -m site --user-base)/bin:$PATH"

# Adds `~/.config/emacs/bin` to $PATH
export PATH="$XDG_CONFIG_HOME/emacs/bin:$PATH"
eval "$(/opt/homebrew/bin/brew shellenv)"
