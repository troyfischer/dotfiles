#!/bin/sh
sudo apt update && sudo apt upgrade ^ sudo apt install git

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

# utils
NAME="utils"
read -p "Install packages $NAME? [Y/n]: " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "Installing packages ~$NAME..."
    PACKAGES="unclutter ripgrep mpv isync htop xdotool figlet libtool-bin sqlite3 \
        pass pass-extension-otp webext-browserpass stow"
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

# build emacs with native comp
NAME="Emacs Native Compilation"
read -p "Install packages $NAME? [Y/n]: " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo apt install libxpm-dev libgif-dev libjpeg-dev libpng-dev libtiff-dev libx11-dev libncurses5-dev automake autoconf texinfo libgtk2.0-dev libmagickwand-dev libgnutls28-dev

    sudo add-apt-repository ppa:ubuntu-toolchain-r/ppa

    sudo apt update

    sudo apt install gcc-10 g++-10 libgccjit0 libgccjit-10-dev libjansson4 libjansson-dev

    [ ! -d ~/.local/src/emacs ] && git clone git://git.sv.gnu.org/emacs.git ~/.local/src/emacs

    cd ~/.local/src/emacs || exit

    git checkout emacs-28

    export CC=/usr/bin/gcc-10 CXX=/usr/bin/gcc-10
    ./autogen.sh
    ./configure --with-cairo --with-modules --without-compress-install --with-x-toolkit=no --with-gnutls --without-gconf --without-xwidgets --without-toolkit-scroll-bars --without-xaw3d --without-gsettings --with-mailutils --with-native-compilation --with-json --with-harfbuzz --with-imagemagick --with-jpeg --with-png --with-rsvg --with-tiff --with-wide-int --with-xft --with-xml2 --with-xpm CFLAGS="-O3 -mtune=native -march=native -fomit-frame-pointer" prefix=/usr/local
    make -j4 NATIVE_FULL_AOT=1
    sudo make install
fi
