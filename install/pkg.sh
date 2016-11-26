#!/usr/bin/env bash


# cli tools
sudo pkg install -y ack
sudo pkg install -y tree

# development tools
sudo pkg install -y git
sudo pkg install -y tmux
sudo pkg install -y zsh
sudo pkg install -y editorconfig
sudo pkg install -y ipmitool

# install vim
# sudo pkg install -y vim
echo "install vim with portmaster to get python bindings"
sudo pkg install -y python

