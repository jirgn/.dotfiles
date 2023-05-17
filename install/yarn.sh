#!/usr/bin/env sh

echo "\n\nInstalling javascript yarn packages"

packages=(
    'eslint-cli'
    'prettier'
    'typescript'
    'typescript-language-server'
    'bash-language-server'
    'vim-language-server'
    'vscode-langservers-extracted'
    'yaml-language-server'
)

for package in "${packages[@]}"; do
    yarn global add $package
done
