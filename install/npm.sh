#!/usr/bin/env sh

echo "\n\nInstalling javascript npm packages"

packages=(
    'yarn'
)

for package in "${packages[@]}"; do
    npm install -g $package
done
