#!/bin/sh

if test ! $(which brew); then
    echo "Installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "\n\nInstalling homebrew packages..."
echo "=============================="

# better terminal
brew install Caskroom/cask/iterm2

# cli tools
brew install ack
brew install tree
brew install wget

# development tools
brew install cmake
brew tap universal-ctags/universal-ctags
brew install --HEAD universal-ctags
brew install phpctags
brew install git
brew install hub
brew install fzf
brew install macvim --override-system-vim
brew install reattach-to-user-namespace
brew install tmux
brew install zsh
brew install highlight
brew install nvm
brew install z
brew install markdown
brew install diff-so-fancy
brew install editorconfig
brew install tidy-html5

# install neovim
brew install neovim/neovim/neovim
brew install python
brew install python3
pip2 install neovim --upgrade
pip3 install neovim --upgrade

# other
brew install go
