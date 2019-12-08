#!/bin/sh

echo "\n\nInstalling pacman packages..."
echo "=============================="

# pacman formulas to isntall
formulas=(
# cli tools
    neofetch
    ripgrep
    fd
    tree

# development tools
    base-devel
    cmake
    git
    fzf
    tmux
    zsh
    highlight
    z
    markdown
    diff-so-fancy
    tidy
    pyenv
    yamllint

# qmk keyboard firmware -- planck keyboard-
    avr-gcc
    dfu-programmer

# editor
    emacs
    neovim

# mutt - email
    isync
    khard
    msmtp
    notmuch
    neomutt
    w3mpy
    vdirsyncer
    
# languages
    nodejs
    npm
    python
    python-pip
    php
    composer
    go

# gui tools
    zeal
)

formulas_aur=(
    ptags
    antibody
    arm-none-eabi-gcc
    ripmime
    nvm
    rbenv
)

for formula in "${formulas[@]}"; do
    if brew list "$formula" > /dev/null 2>&1; then
        echo "$formula already installed... skipping."
    else
        sudo pacman -Sy --noconfirm $formula
    fi
done

for formula in "${formulas_aur[@]}"; do
    if brew list "$formula" > /dev/null 2>&1; then
        echo "$formula already installed... skipping."
    else
        yay -Sy --noconfirm $formula
    fi
done

