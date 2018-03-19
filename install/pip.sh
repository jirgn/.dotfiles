#!/bin/sh

echo "\n\nInstalling Python packages"

packages=(
 "neovim"
 "jedi"
 "psutil"
 "setproctitle"
)

for package in "${packages[@]}"; do
    pip3 install --user --upgrade $package
done

