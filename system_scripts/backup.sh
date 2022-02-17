#!/bin/sh

read -p "Is the backup device mounted to ~/tmp? [Y/n]: " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo chown troy:troy ~/tmp

    # backup home directory
    rsync -aPv "$HOME/Documents" ~/tmp/ && \
    rsync -aPv "$HOME/Calibre Library" ~/tmp/ && \
    rsync -aPv "$HOME/dotfiles" ~/tmp/ && \
    rsync -aPv "$HOME/dev" ~/tmp/ && \
    rsync -aPv "$HOME/org" ~/tmp/ && \
    rsync -aPv "$HOME/Pictures" ~/tmp/ && \
    rsync -aPv "$HOME/Videos" ~/tmp/ && \
    rsync -aPv "$HOME/.gnupg" ~/tmp/ && \
    rsync -aPv "$HOME/.local/share/password-store" ~/tmp/ && \
    rsync -aPv "$HOME/.ssh" ~/tmp/
fi
