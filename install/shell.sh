#!/bin/sh

echo "installing rvm ruby version manager"
curl -sSL https://get.rvm.io | bash -s stable

echo "installing tmux plugin manager"
if [ ! -d $HOME/.tmux/plugins ]; then
    echo "creating plugins dir"
    mkdir -p $HOME/.tmux/plugins
    echo "cloning tpm tmux pluginmanager"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

