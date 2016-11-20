#!/usr/bin/env bash

echo "Installing dotfiles"

echo "Initializing submodule(s)"
git submodule update --init --recursive

. install/link.sh

if [ `uname` == "FreeBSD" ]; then
    echo "\n\nRunning on FreeBSD"
    . install/pkg.sh

elif [ `uname` == "Darwin" ]; then
    echo "\n\nRunning on OSX"

    . install/brew.sh

    . install/osx.sh

    # fix xterm problem -> <C-h> binding issue 
    # https://github.com/neovim/neovim/wiki/FAQ#my-ctrl-h-mapping-doesnt-work
    echo "\nfixing xterm <C-h> binding issue"
    echo "---------------------------------"
    TERMINFO_DIR=~/.terminfo
    mkdir -p $TERMINFO_DIR
    cd $TERMINFO_DIR
    infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > $TERM.ti
    tic $TERM.ti
    cd -
    
    # . install/nvm.sh
fi

echo "installing tmux plugin manager"
if [ ! -d $HOME/.tmux/plugins ]; then
    echo "creating plugins dir"
    mkdir -p $HOME/.tmux/plugins
    echo "cloning tpm tmux pluginmanager"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

echo "creating vim directories"
mkdir -p ~/.vim-tmp

# echo "Configuring zsh as default shell"
chsh -s `which zsh`

echo "Done."
