#!/bin/sh

# mount the device yourself and change the owner
sudo chown troy:troy ~/tmp

# backup home directory
rsync -aPv ~/Documents ~/tmp/ && \
    rsync -aPv ~/dotfiles ~/tmp/ && \
    rsync -aPv ~/org ~/tmp/ && \
    rsync -aPv ~/Pictures ~/tmp/ && \
    rsync -aPv ~/Videos ~/tmp/ && \
    rsync -aPv ~/.doom.d ~/tmp/ && \
    rsync -aPv ~/emacs.d.zip ~/tmp/ && \
    rsync -aPv ~/.gnupg ~/tmp/ && \
    rsync -aPv ~/.password-store ~/tmp/ && \
    rsync -aPv ~/.ssh ~/tmp/ && \
    rsync -aPv ~/.vscode ~/tmp/
