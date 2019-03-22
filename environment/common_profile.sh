# ssh-add $HOME/.ssh/id_rsa

#----------------------
# system general
# ---------------------

export DOTFILES="${HOME}/.dotfiles"
export PHPROOT="${BREW_PREFIX}/opt/php@7.1"
export BREW_PREFIX=`brew --prefix`
export EDITOR=nvim
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export MAKEOPTS="-j9"
export LANG=de_DE.UTF-8
export LC_ALL=de_DE.UTF-8
export GOPATH="${HOME}/.go"
export GOROOT="${BREW_PREFIX}/opt/go/libexec"
export PYENV_ROOT="`pyenv root`"
export LDFLAGS="-L/usr/local/opt/icu4c/lib"
export LDFLAGS="-L${PHPROOT}/lib"
export CPPFLAGS="-I/usr/local/opt/icu4c/include"
export CPPFLAGS="-I${PHPROOT}/include"
export VAGRANT_USE_VAGRANT_TRIGGERS=TRUE
export BEACH_REMOTE_AUTHORIZED_KEYS=`ssh-add -L | base64`

# ------------------------------------------
# path definition
# ------------------------------------------
PATH=$PATH:/usr/local/bin:/usr/local/sbin # User binaries
PATH=$PATH:$HOME/bin                      # Personal binaries
PATH=$PATH:$DOTFILES/bin                  # Personal binaries
PATH=$PATH:$HOME/.local/bin               # pipsi libs
PATH=$PATH:$HOME/.composer/vendor/bin     # Global Composer bin
PATH=$PATH:/usr/X11/bin                   # X11 Stuff
PATH=$PATH:$PHPROOT/bin:$PHPROOT/sbin
PATH=$PATH:$BREW_PREFIX/icu4c/bin:$BREW_PREFIX/icu4c/sbin
PATH=$PATH:$GOPATH/bin:$GOROOT/bin
PATH=$PATH:$PYENV_ROOT
PATH=$PATH:$HOME/.rvm/bin                 # Add RVM to PATH for scripting. Make sure this is the last PATH variable change.


for config in $DOTFILES/environment/common_profile.d/*; do
    source $config
done
