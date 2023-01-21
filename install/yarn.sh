#!/usr/bin/env sh

echo "\n\nInstalling javascript yarn packages"

packages=(
    'eslint-cli'
    'bash-language-server'
    'typescript'
    'typescript-language-server'
    'vim-language-server'
    'vscode-langservers-extracted'
    'yaml-language-server'
)

for package in "${packages[@]}"; do
    sudo yarn global add $package
done
