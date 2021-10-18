#!/bin/sh
read -p "Update /etc/hosts? [Y/n]: " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "Updating /etc/hosts file..."
    curl -L https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/gambling-porn-social/hosts --output ~/Downloads/hosts
    sudo mv ~/Downloads/hosts /etc/hosts
fi

read -p "Pull fonts? [Y/n]: " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "Pulling fonts..."
    FONTS_DIR="$HOME/.local/share/fonts"
    [ ! -d "$FONTS_DIR" ] && mkdir -p "$FONTS_DIR"
    # fira code
    curl -L https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip --output ~/Downloads/Font.zip --silent && unzip -qq ~/Downloads/Font.zip -d ~/Downloads/FONT_UNZIP && cp ~/Downloads/FONT_UNZIP/*.ttf "$FONTS_DIR" && rm -rf ~/Downloads/FONT_UNZIP ~/Downloads/Font.zip
    # fira mono
    curl -L https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraMono.zip --output ~/Downloads/Font.zip --silent && unzip -qq ~/Downloads/Font.zip -d ~/Downloads/FONT_UNZIP && cp ~/Downloads/FONT_UNZIP/*.otf "$FONTS_DIR" && rm -rf ~/Downloads/FONT_UNZIP ~/Downloads/Font.zip
    # jetbrains
    curl -L https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip --output ~/Downloads/Font.zip --silent && unzip -qq ~/Downloads/Font.zip -d ~/Downloads/FONT_UNZIP && cp ~/Downloads/FONT_UNZIP/*.ttf "$FONTS_DIR" && rm -rf ~/Downloads/FONT_UNZIP ~/Downloads/Font.zip
    # ubuntu
    curl -L https://assets.ubuntu.com/v1/0cef8205-ubuntu-font-family-0.83.zip --output ~/Downloads/Font.zip --silent && unzip -qq ~/Downloads/Font.zip -d ~/Downloads/FONT_UNZIP && cp ~/Downloads/FONT_UNZIP/ubuntu*/*.ttf "$FONTS_DIR" && rm -rf ~/Downloads/FONT_UNZIP ~/Downloads/Font.zip
fi

read -p "Clone README? [Y/n]: " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    README="$HOME/org/README"
    echo "Cloning README"
    git clone https://github.com/troyfischer/troyfischer.git ~/README || echo "$README already exists! Skipping..."
fi

NAME="neovim"
read -p "Install packages $NAME? [Y/n]: " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "Installing packages ~$NAME..."
    APP_IMAGE_DOWNLOAD_DIR="$HOME/.local/share/packages/appimages"
    rm -rf "$APP_IMAGE_DOWNLOAD_DIR" && mkdir -p "$APP_IMAGE_DOWNLOAD_DIR"
    curl -L https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage --output "$APP_IMAGE_DOWNLOAD_DIR/nvim.appimage"
    sudo cp "$APP_IMAGE_DOWNLOAD_DIR/nvim.appimage" /usr/bin/nvim
fi

# utils
NAME="utils"
read -p "Install packages $NAME? [Y/n]: " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "Installing packages ~$NAME..."
    PACKAGES="redshift redshift-gtk unclutter ripgrep mpv isync htop xdotool figlet libtool-bin sqlite3 \
        pass pass-extension-otp webext-browserpass emacs alacritty code"
    sudo apt install -y $PACKAGES
fi

# latex
NAME="latex"
read -p "Install packages $NAME? [Y/n]: " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "Installing packages ~$NAME..."
    PACKAGES="texlive-latex-base texlive-latex-extra texlive-latex-recommended"
    sudo apt install -y $PACKAGES
fi

# development tools
NAME="programming tools"
read -p "Install packages $NAME? [Y/n]: " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "Installing packages ~$NAME..."
    PACKAGES="llvm git cmake g++ clangd-11 shellcheck python3-pytest pipenv isort sassc"
    sudo apt install -y $PACKAGES
fi

# brave browser
NAME="brave-browser"
read -p "Install packages $NAME? [Y/n]: " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "Installing packages ~$NAME..."
    sudo apt install -y apt-transport-https curl
    sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
    sudo apt update
    sudo apt install -y brave-browser
fi
