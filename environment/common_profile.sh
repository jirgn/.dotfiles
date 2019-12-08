#----------------------
# system general
# ---------------------

export DOTFILES="${HOME}/.dotfiles"
export EDITOR=nvim
export MAKEOPTS="-j9"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PYENV_ROOT="`pyenv root`"
export LDFLAGS="-L/usr/local/opt/icu4c/lib"
export LDFLAGS="-L${PHPROOT}/lib"
export CPPFLAGS="-I/usr/local/opt/icu4c/include"
export CPPFLAGS="-I${PHPROOT}/include"

# ------------------------------------------
# path definition
# ------------------------------------------
PATH=$PATH:/usr/local/bin:/usr/local/sbin # User binaries
PATH=$PATH:$HOME/bin                      # Personal binaries
PATH=$PATH:$DOTFILES/bin                  # Personal binaries
PATH=$PATH:$HOME/.local/bin               # pipsi libs
PATH=$PATH:$HOME/.composer/vendor/bin     # Global Composer bin
PATH=$PATH:$PYENV_ROOT
PATH=$PATH:$HOME/.rvm/bin                 # Add RVM to PATH for scripting. Make sure this is the last PATH variable change.

localprofile=$DOTFILES/environment/local_profile.sh
if [[ -f $localprofile ]]; then
    source $localprofile
fi

for config in $DOTFILES/environment/common_profile.d/*; do
    source $config
done
