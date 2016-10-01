#!/usr/bin/env sh

echo "Installing dotfiles"

echo "Initializing submodule(s)"
git submodule update --init --recursive

source install/link.sh

if [ "$(uname)" == "Darwin" ]; then
    echo -e "\n\nRunning on OSX"

    source install/brew.sh

    source install/osx.sh

    # source install/nvm.sh
fi

echo "creating vim directories"
mkdir -p ~/.vim-tmp


# echo "Configuring zsh as default shell"
# chsh -s $(which zsh)

echo "Done."
