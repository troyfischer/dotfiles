
# Table of Contents

1.  [Dotfiles](#org3322380)
2.  [Mac](#orgeb1448d)
    1.  [Install Homebrew](#org2006dd0)
    2.  [Programs](#org6c358e4)
        1.  [Brewfile](#org392c3da)
    3.  [Doom Emacs](#org318a59a)
3.  [Chrome Extensions](#orga3284c9)
4.  [Issues](#orgae1b28d)
    1.  [Browserpass](#org266c43c)
        1.  [Linux](#org93a867f)
        2.  [Mac](#org308fe3b)
    2.  [Emacs Native Comp on apple silicone chips](#org00d2945)
5.  [Notes](#org2b5ba89)
    1.  [Running Behave Tests](#org1b2d784)
    2.  [Doom Emacs Misc Notes](#orgd569363)
        1.  [Doom&rsquo;s `packages.el` question/issue](#org43f7c55)



<a id="org3322380"></a>

# Dotfiles

Organizing dotfiles in this repository for quick start up time on a fresh computer. Using [GNU Stow](https://www.gnu.org/software/stow/) to create the symbolic links.


<a id="orgeb1448d"></a>

# Mac


<a id="org2006dd0"></a>

## Install Homebrew

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


<a id="org6c358e4"></a>

## Programs


<a id="org392c3da"></a>

### Brewfile

Tangle the Brewfile

    brew bundle
    brew bundle --file=/path/to/file

    tap "homebrew/cask"
    tap "homebrew/core"

1.  Browser

    1.  Brave
    
            cask "brave-browser"

2.  Terminal

        cask "alacritty"
        cask "kitty"
    
    1.  Terminal Programs
    
            brew "yazi"
            brew "zoxide"

3.  Fonts

        tap "homebrew/cask-fonts"
        cask "font-fira-code"
        cask "font-fira-code-nerd-font"
        cask "font-jetbrains-mono"
        cask "font-jetbrains-mono-nerd-font"
        cask "font-overpass"
        cask "font-hack"
        cask "font-cascadia-code"
        cask "font-cascadia-mono"
        cask "font-ibm-plex"
        cask "font-source-code-pro"
        cask "font-monaspace"

4.  Navigation

    Need at least one of these
    
    1.  [Aerospace](https://github.com/nikitabobko/AeroSpace)
    
            brew "aerospace"
    
    2.  [Keyboard Maestro](https://www.keyboardmaestro.com/main/)
    
            cask "keyboard-maestro"

5.  Programming

    1.  Python
    
            brew "basedpyright"
            brew "ruff"
    
    2.  Lua
    
            brew "lua"
            brew "stylua"


<a id="org318a59a"></a>

## Doom Emacs

[Install Doom Emacs](https://github.com/doomemacs/doomemacs)

    git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs

Assuming my dotfiles have added ~/.config/emacs/bin to the PATH.

    doom install


<a id="orga3284c9"></a>

# Chrome Extensions

-   [Browserpass](https://chrome.google.com/webstore/detail/browserpass/naepdomgkenhinolocfifgehidddafch?hl=en)
-   [Distraction Free Youtube](https://chrome.google.com/webstore/detail/df-tube-distraction-free/mjdepdfccjgcndkmemponafgioodelna?hl=en)
-   [Youtube Speed Playback Control](https://chrome.google.com/webstore/detail/youtube-playback-speed-co/hdannnflhlmdablckfkjpleikpphncik/reviews?hl=en)
-   [Dark Reader](https://chrome.google.com/webstore/detail/dark-reader/eimadpbcbfnmbkopoojfekhnkhdbieeh?hl=en-US)
-   [United By Zero](https://chrome.google.com/webstore/detail/united-by-zero/cnicehoklaonpoobcjbagnmbchlacmpk)
-   [Tab Groups](https://chrome.google.com/webstore/detail/tab-groups-extension/nplimhmoanghlebhdiboeellhgmgommi?hl=en#:~:text=Tab%20Groups%20Extension&text=Automatically%20group%20tabs%2C%20save%20tabs,tabs%20through%20custom%20matching%20rules.)
-   [Tab Suspender](https://chrome.google.com/webstore/detail/tab-suspender/fiabciakcmgepblmdkmemdbbkilneeeh/related?hl=en)


<a id="orgae1b28d"></a>

# Issues


<a id="org266c43c"></a>

## Browserpass


<a id="org93a867f"></a>

### Linux

I&rsquo;ve had issues getting browserpass to work on some of my recent installs. Solved via this link [github-fix](https://github.com/browserpass/browserpass-extension/issues/158).

Specifically this comment (may need modification depending on the browser in use):

    sudo mkdir -p /etc/opt/chrome/native-messaging-hosts/
    sudo ln -s /etc/chromium/native-messaging-hosts/com.github.browserpass.native.json  /etc/opt/chrome/native-messaging-hosts/com.github.browserpass.native.json


<a id="org308fe3b"></a>

### Mac

1.  Install

    -   [Browserpass Extension](https://github.com/browserpass/browserpass-extension)
    -   [Browserpass Native](https://github.com/browserpass/browserpass-native)

2.  Config

    Had to explicitly set a few things in [.gnupg](file:///Users/troyfischer/.gnupg/).
    
    In [gpg.conf](file:///Users/troyfischer/.gnupg/gpg.conf)
    
        use-agent
    
    In [gpg-agent.conf](file:///Users/troyfischer/.gnupg/gpg-agent.conf)
    
        pinentry-program /usr/local/bin/pinentry-mac
    
    or
    
        pinentry-program /opt/homebrew/bin/pinentry-mac
    
    To restart the gpg agent
    
        gpgconf --kill gpg-agent


<a id="org00d2945"></a>

## Emacs Native Comp on apple silicone chips

-   [Solution](https://github.com/d12frosted/homebrew-emacs-plus/issues/562)


<a id="org2b5ba89"></a>

# Notes


<a id="org1b2d784"></a>

## Running Behave Tests

[dap debug setup for behave tests](https://stackoverflow.com/questions/52725150/how-to-debug-behave-bdd-scenario-using-python-debugger-and-visual-studio-code)


<a id="orgd569363"></a>

## Doom Emacs Misc Notes


<a id="org43f7c55"></a>

### TODO Doom&rsquo;s `packages.el` question/issue

Using something like

    (package! some-random-package)

in `packages.el` **does not** necessarily pull the package from its latest commit from github. For example with the [leetcode.el](https://github.com/kaiwk/leetcode.el) package I had to go to the straight repo, pull the latest code from origin, delete the build artifacts and `doom sync` + restart to get the correct code.

Not sure if that is because github is not the default or what. It pulled the latest tag which had code from 2+ years ago.

