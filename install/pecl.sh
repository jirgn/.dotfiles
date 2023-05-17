#!/usr/bin/env sh

echo "\n\nInstalling PHP PECL packages"

packages=(
    # "msgpack"
)
for package in "${packages[@]}"; do
    pecl install "$package"
done
