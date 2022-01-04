#!/bin/sh

echo "\n\nInstalling Python packages"

packages=(
 "pynvim"
 "jedi"
 "psutil"
 "setproctitle"
 "urlscan"
 "aws-mfa"
)

for package in "${packages[@]}"; do
    pip install --user --upgrade $package
done

