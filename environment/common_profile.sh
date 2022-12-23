#----------------------
# system general
# ---------------------

export DOTFILES="${HOME}/.dotfiles"
export EDITOR=nvim
export MAKEOPTS="-j9"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PYENV_ROOT="`pyenv root`"
export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --no-ignore-vcs --exclude .git'
export FZF_DEFAULT_OPTS="--ansi"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export COMPOSER_MEMORY_LIMIT=-1
export GEM_HOME="${HOME}/.gem"
export PYENV_ROOT="$HOME/.pyenv"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_STATE_HOME="${HOME}/.local/state"

# ------------------------------------------
# path definition
# ------------------------------------------
PATH=$PATH:/usr/local/bin:/usr/local/sbin # User binaries
PATH=$PATH:$DOTFILES/bin                  # Personal binaries
PATH=$PATH:$HOME/.local/bin               # pipsi libs
PATH=$PATH:$HOME/.cargo/bin               # cargo libs
PATH=$PATH:$PYENV_ROOT
PATH=$PATH:$GEM_HOME/ruby/2.7.0/bin

localprofile=$DOTFILES/environment/local_profile.sh
if [[ -f $localprofile ]]; then
    source $localprofile
fi

for config in $DOTFILES/environment/common_profile.d/*; do
    source $config
done
