#!/bin/sh

if test ! $(which brew); then
    echo "Installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "\n\nInstalling homebrew packages..."
echo "=============================="

# brew taps to execute
taps=(
    'universal-ctags/universal-ctags'
    'homebrew/homebrew-php'
    'neovim/neovim'
    'osx-cross/avr'
    'PX4/homebrew-px4'
)

# brew formulas to isntall
formulas=(
# better terminal
     'Caskroom/cask/iterm2'
    
# cli tools
     ack
     tree
     wget
    
# development tools
     cmake
     '--HEAD universal-ctags'
     git
     git-flow
     hub
     fzf
     'macvim --override-system-vim'
     'reattach-to-user-namespace'
     tmux
     zsh
     highlight
     nvm
     npm
     z
     markdown
     diff-so-fancy
     editorconfig
     tidy-html5
    
# php envirionment with sniffer and packagemanager
     php71
     php71-msgpack 
     phpmd
     composer

# qmk keyboard firmware -- planck keyboard-
     avr-gcc
     dfu-programmer
     gcc-arm-none-eabi

    
# install neovim
     neovim
     python
     python3
    
# other
     go
)

for tap in "${taps[@]}"; do
    brew tap $tap
done

for formula in "${formulas[@]}"; do
    if brew list "$formula" > /dev/null 2>&1; then
        echo "$formula already installed... skipping."
    else
        brew install $formula
    fi
done

