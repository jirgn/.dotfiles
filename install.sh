#!/usr/bin/env sh

 echo "Installing dotfiles"

 echo "Initializing submodule(s)"
 git submodule update --init --recursive

 source install/link.sh

 if [ "$(uname)" == "Darwin" ]; then
     echo "\n\nRunning on OSX"

     source install/brew.sh
     source install/osx.sh

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
 fi

 if uname -a |grep -E "(arch|manjaro)" > /dev/null; then
     echo "\n\nRunning on Arch Linux"
     source install/pacman.sh
 fi 

 source install/composer.sh
 source install/pecl.sh
 source install/npm.sh
 source install/pip.sh
 source install/shell.sh

 echo "creating vim directories"
 mkdir -p ~/.vim-tmp

# install spacemacs 
EMACS_CONFIG_DIR=$HOME/.emacs.d
if ! ls $EMACS_CONFIG_DIR >/dev/null 2>/dev/null; then
    echo "no emacs config found - install spacemacs"
    git clone https://github.com/syl20bnr/spacemacs $EMACS_CONFIG_DIR
fi

# echo "Configuring zsh as default shell"
chsh -s $(which zsh)

echo "Done."
