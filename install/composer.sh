#!/bin/sh

echo "\n\nInstalling PHP global composer packages"

packages=(
    # "nikic/php-parser=^3.1.0"
    # "squizlabs/php_codesniffer"
    # "techlivezheng/phpctags"
    # "friendsofphp/php-cs-fixer"
    # "phpstan/phpstan"
)
for package in "${packages[@]}"; do
    composer global require "$package"
done
