#!/bin/sh

echo "\n\nInstalling javascript npm packages"

packages=(
    'eslint'
    'babel-eslint'
    'eslint-plugin-react'
    'eslint-plugin-jasmine'
    'yarn'
    'javascript-typescript-langserver'
)

for package in "${packages[@]}"; do
    npm install -g $package
done
