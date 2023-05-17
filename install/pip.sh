#!/usr/bin/env sh

echo "\n\nInstalling Python packages"

packages=(
#  "pynvim"
#  "jedi"
#  "psutil"
#  "setproctitle"
#  "urlscan"
)

for package in "${packages[@]}"; do
    pip install --user --upgrade $package
done

