#!/bin/sh

read -p "Is the backup device mounted to /Volumes/Backup? [Y/n]: " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    # backup home directory
    rsync -aPv "$HOME/Documents" /Volumes/Backup/ && \
    rsync -aPv "$HOME/Calibre Library" /Volumes/Backup/ && \
    rsync -aPv "$HOME/dotfiles" /Volumes/Backup/ && \
    rsync -aPv "$HOME/dev" /Volumes/Backup/ && \
    rsync -aPv "$HOME/org" /Volumes/Backup/ && \
    rsync -aPv "$HOME/blog" /Volumes/Backup/ && \
    rsync -aPv "$HOME/Pictures" /Volumes/Backup/ && \
    rsync -aPv "$HOME/Videos" /Volumes/Backup/ && \
    rsync -aPv "$HOME/.gnupg" /Volumes/Backup/ && \
    rsync -aPv "$HOME/.local/share/password-store" /Volumes/Backup/ && \
    rsync -aPv "$HOME/.ssh" /Volumes/Backup/
fi
