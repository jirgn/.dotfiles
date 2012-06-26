# .dotfiles

Here are some config files, for easy distribution between Xnix systems.

## Installation

Just clone the git repostiory to your home dir and symlink the files you want.

    # copy to your home
    git clone https://github.com/jirgn/.dotfiles.git ~/

    # symlink files
    cd ~/ && \
    # it depends on you what to use here 
    ln -s .dotfiles/.profile .dotfiles/zsh/.zshrc .dotfiles/zsh/.zlogin

## ZSH

Zsh is a interactive Shell, that in my opinion is way more powerfull than bash.
I use the comunity based framework [_oh-my-zsh_](https://github.com/jirgn/oh-my-zsh.git), which is _required_ for the given dotfiles to work.
All needed files are located in the subfolder .dotfiles/zsh
