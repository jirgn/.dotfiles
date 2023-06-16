#!/usr/bin/env sh

echo "\n\nInstalling pacman packages..."
echo "=============================="

# pacman formulas to isntall
formulas=(
# cli tools
    neofetch
    ripgrep
    fd
    tree
    bat
    lazygit

# development tools
    base-devel
    cmake
    git
    fzf
    tmux
    zsh
    highlight
    markdown
    tidy
    yamllint
    git-delta

# virtual machines / containers
    docker
    minikube
    kubectl
    k9s

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

# asdf php 
    re2c
    postgresql-libs

# gui tools
    zeal

# powersave
    tlp
    tlp-rdw
    tp_smapi
    acpi_call
)

formulas_aur=(
    ptags
    antibody
    arm-none-eabi-gcc
    ripmime
    afuse
    lf
    asdf-vm
    lazydocker-bin
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

