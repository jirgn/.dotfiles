#!/bin/sh

if test ! $(which brew); then
    echo "Installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "\n\nInstalling homebrew packages..."
echo "=============================="

# brew taps to execute
taps=(
     d12frosted/emacs-plus
#     'universal-ctags/universal-ctags'
#     'neovim/neovim'
#     'osx-cross/avr'
#     'PX4/homebrew-px4'
#     'railwaycat/emacsmacport'
)

casks=(
     'alacritty'
)

# brew formulas to isntall
formulas=(
     ack
     ripgrep
     exa
     tree
     wget
     curlie
     jq
     lf
     fd
     bat
     htop
     fzf
     tmux
     zsh
     gpatch
     antidote
     fontforge
     git-delta

     cmake
     git
     lazygit
     lazydocker
     tldr
     'emacs-plus --with-native-comp --with-modern-doom3-icon --HEAD'
     mycli

     asdf
        # build asdf php
        autoconf 
        automake 
        bison 
        freetype 
        gd 
        gettext 
        icu4c 
        krb5 
        libedit 
        libiconv 
        libjpeg 
        libpng 
        libxml2 
        libzip 
        pkg-config 
        re2c 
        zlib
        oniguruma
        gmp 
        libsodium 
        imagemagick

     # git-flow
     # hub
     # '--HEAD universal-ctags'
     # antibody
     # highlight
     # nvm
     # z
     # markdown
     # diff-so-fancy
     # editorconfig
     # tidy-html5
     # pyenv
     # icu4c
     # yamllint

# php envirionment with sniffer and packagemanager

# qmk keyboard firmware -- planck keyboard-
     # avr-gcc
     # dfu-programmer
     # gcc-arm-none-eabi

# emacs / spacemacs
#     emacs
#     emacs-mac

# install neovim
     neovim

# mutt - email
#     isync
#     khard
#     msmtp
#     notmuch
#     neomutt
#     ripmime
#     w3m
#     vdirsyncer
    
# other
     # go
)

for tap in "${taps[@]}"; do
    brew tap $tap
done

for cask in "${casks[@]}"; do
    brew install --cask $cask
done

for formula in "${formulas[@]}"; do
    if brew list "$formula" > /dev/null 2>&1; then
        echo "$formula already installed... skipping."
    else
        brew install $formula
    fi
done

