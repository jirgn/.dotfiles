#!/usr/bin/env sh

echo "\n\nInstalling javascript npm packages"

packages=(
    # 'yarn'
)

for package in "${packages[@]}"; do
    sudo npm install -g $package
done
