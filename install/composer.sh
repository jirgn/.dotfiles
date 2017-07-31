#!/bin/sh

echo "\n\nInstalling PHP global composer packages"

packages=(
    "squizlabs/php_codesniffer=*"
    "techlivezheng/phpctags=*"
    "friendsofphp/php-cs-fixer=*"
)

for package in $packages; do
    composer global require $package
done
