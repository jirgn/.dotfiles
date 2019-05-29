#!/bin/sh

echo "\n\nInstalling javascript npm packages"

packages=(
    'tern'
    'eslint-cli'
    'yarn'
    'local-ssl-proxy'
)

for package in "${packages[@]}"; do
    npm install -g $package
done
