#!/usr/bin/env sh


# cli tools
sudo pkg install -y ack
sudo pkg install -y tree

# development tools
sudo pkg install -y cmake
sudo pkg install -y git
sudo pkg install -y fzf
sudo pkg install -y tmux
sudo pkg install -y zsh
sudo pkg install -y editorconfig
sudo pkg install -y markdown
sudo pkg install -y diff-so-fancy
#brew install hub
#brew install highlight
#brew install nvm
#brew install z
#brew install diff-so-fancy

# install neovim
sudo pkg install -y neovim
sudo pkg install -y python
sudo python -m ensurepip
pip install neovim --upgrade
