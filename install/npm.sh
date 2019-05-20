#!/bin/sh

echo "\n\nInstalling javascript npm packages"

packages=(
    'tern'
    'eslint'
    'babel-eslint'
    'eslint-plugin-react'
    'eslint-plugin-jasmine'
    'yarn'
    'javascript-typescript-langserver'
    'local-ssl-proxy'
)

for package in "${packages[@]}"; do
    npm install -g $package
done
