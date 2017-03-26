#!/bin/sh

echo "\n\nInstalling Python packages"

pip2 install neovim --upgrade
pip3 install neovim --upgrade

packages=(
 'neovim --upgrade'
)

for package in $packages; do
    pip2 install $package
    pip3 install $package
done

