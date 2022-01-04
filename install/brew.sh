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
    'neovim/neovim'
    'PX4/homebrew-px4'
    'getantibody/tap'
    'railwaycat/emacsmacport'
)

# brew formulas to isntall
formulas=(
# better terminal
     'Caskroom/cask/iterm2'
    
# cli tools
     ack
     ripgrep
     tree
     wget
     lf
     fd
     htop
    
# development tools
     cmake
     '--HEAD universal-ctags'
     git
     git-flow
     hub
     fzf
     tmux
     zsh
     antibody
     highlight
     nvm
     z
     markdown
     diff-so-fancy
     editorconfig
     tidy-html5
     pyenv
     icu4c
     yamllint
     awscli

# php envirionment with sniffer and packagemanager
     php@7.2
     php@7.3
     brew-php-switcher
     composer

# emacs / spacemacs
    emacs
    emacs-mac

# install neovim
     neovim

# mutt - email
    isync
    khard
    msmtp
    notmuch
    neomutt
    ripmime
    w3m
    vdirsyncer
    
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

