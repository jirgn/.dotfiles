# ssh-add $HOME/.ssh/id_rsa

#----------------------
# system general
# ---------------------
export EDITOR=nvim
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export MAKEOPTS="-j9"
export LANG=de_DE.UTF-8
export LC_ALL=de_DE.UTF-8
export GOPATH="${HOME}/.go"
export GOROOT="`brew --prefix golang`/libexec"
export PYENV_ROOT="`pyenv root`"
export LDFLAGS="-L/usr/local/opt/icu4c/lib"
export LDFLAGS="-L/usr/local/opt/php@7.1/lib"
export CPPFLAGS="-I/usr/local/opt/icu4c/include"
export CPPFLAGS="-I/usr/local/opt/php@7.1/include"
export VAGRANT_USE_VAGRANT_TRIGGERS=TRUE
export BEACH_REMOTE_AUTHORIZED_KEYS=`ssh-add -L | base64`

# ------------------------------------------
# path definition
# ------------------------------------------
PATH=$PATH:/usr/local/bin             # User binaries
PATH=$PATH:/usr/local/sbin            # User binaries
PATH=$PATH:$HOME/bin                  # Personal binaries
PATH=$PATH:$HOME/.local/bin           # pipsi libs
PATH=$PATH:$DOTFILES/bin              # Personal binaries
PATH=$PATH:$HOME/.composer/vendor/bin # Global Composer bin
PATH=$PATH:/usr/X11/bin               # X11 Stuff
PATH=$PATH:/usr/local/opt/php@7.1/bin
PATH=$PATH:/usr/local/opt/php@7.1/sbin
PATH=$PATH:/usr/local/opt/icu4c/bin
PATH=$PATH:/usr/local/opt/icu4c/sbin
PATH=$PATH:$GOPATH/bin:$GOROOT/bin
PATH=$PATH:$PYENV_ROOT
PATH=$PATH:$HOME/.rvm/bin           # Add RVM to PATH for scripting. Make sure this is the last PATH variable change.

# fix for terminfo problem in vim see https://github.com/neovim/neovim/wiki/FAQ#my-ctrl-h-mapping-doesnt-work
[[ -e ~/.terminfo ]] && export TERMINFO_DIRS=~/.terminfo:/usr/share/terminfo 

for config in $DOTFILES/environment/common_profile.d/*; do
    source $config
done
