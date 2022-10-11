#----------------------
# system general
# ---------------------

export DOTFILES="${HOME}/.dotfiles"
export BREW_PREFIX=`brew --prefix`
export EDITOR=nvim
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export MAKEOPTS="-j9"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export GOPATH="${HOME}/.go"
export GOROOT="${BREW_PREFIX}/opt/go/libexec"
export PYENV_ROOT="`pyenv root`"
export LDFLAGS="${LDFLAGS} -L/usr/local/opt/icu4c/lib"
export CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/icu4c/include"
# export VAGRANT_USE_VAGRANT_TRIGGERS=TRUE
export BEACH_REMOTE_AUTHORIZED_KEYS=`ssh-add -L | base64`
export HOMEBREW_GITHUB_API_TOKEN=befb326c9ca67736287c06c4608bb7838076d4f0
export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --no-ignore-vcs --exclude .git'
export FZF_DEFAULT_OPTS="--ansi"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export COMPOSER_MEMORY_LIMIT=-1

# ------------------------------------------
# path definition
# ------------------------------------------
PATH=$PATH:/usr/local/bin:/usr/local/sbin # User binaries
PATH=$PATH:$HOME/bin                      # Personal binaries
PATH=$PATH:$DOTFILES/bin                  # Personal binaries
PATH=$PATH:$HOME/.local/bin               # pipsi libs
PATH=$PATH:$HOME/.composer/vendor/bin     # Global Composer bin
PATH=$PATH:/usr/X11/bin                   # X11 Stuff
PATH=$PATH:$BREW_PREFIX/opt/mariadb@10.3/bin
PATH=$PATH:$BREW_PREFIX/opt/mysql-client/bin
PATH=$PATH:$BREW_PREFIX/icu4c/bin:$BREW_PREFIX/icu4c/sbin
PATH=$PATH:$GOPATH/bin:$GOROOT/bin
PATH=$PATH:$PYENV_ROOT
PATH=$PATH:$HOME/.rvm/bin                 # Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
PATH=$PATH:$HOME/.symfony/bin

localprofile=$DOTFILES/environment/local_profile.sh
if [[ -f $localprofile ]]; then
    source $localprofile
fi

for config in $DOTFILES/environment/common_profile.d/*; do
    source $config
done
