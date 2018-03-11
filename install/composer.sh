#!/bin/sh

echo "\n\nInstalling PHP global composer packages"

packages=(
    "squizlabs/php_codesniffer"
    "techlivezheng/phpctags"
    "friendsofphp/php-cs-fixer"
    # "phpstan/phpstan"
    # "phpactor/phpactor=dev_master"
)
for package in "${packages[@]}"; do
    composer global require "$package"
done
