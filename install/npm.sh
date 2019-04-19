#!/bin/sh

echo "\n\nInstalling javascript npm packages"

packages=(
    'tern'
    'eslint-cli'
    'yarn'
)

for package in "${packages[@]}"; do
    npm install -g $package
done
