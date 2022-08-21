#!/bin/zsh

# profile file. Runs on login. Environmental variables are set here.

# If you don't plan on reverting to bash, you can remove the link in ~/.profile
# to clean up.

# Default programs:
export EDITOR="emacs"
export BROWSER="brave"

# ~/ Clean-up:
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/password-store"
export DOOMDIR="$XDG_CONFIG_HOME/doom"

# Adds `~/.local/bin` to $PATH
export PATH="$HOME/.local/bin:$PATH"

# Adds `~/.config/emacs/bin` to $PATH
export PATH="$XDG_CONFIG_HOME/emacs/bin:$PATH"

# java
export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"
export PATH="$JAVA_HOME/bin:$PATH"

# maven
export M2_HOME="/opt/apache-maven-3.8.4"
export M2="$M2_HOME/bin"
export MAVEN_OPTS="-Xms256m -Xmx512m"
export PATH="$M2:$PATH"
