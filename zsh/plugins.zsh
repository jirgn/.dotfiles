export ZPLUG_HOME=$HOME/.zplug

if [[ ! -d $ZPLUG_HOME ]]; then
    echo 'install zplug'
    curl -sL zplug.sh/installer | zsh
fi
source $ZPLUG_HOME/init.zsh

#####################
# Plugins to install

zplug "plugins/vi-mode", from:oh-my-zsh
zplug "plugins/docker-compose", from:oh-my-zsh
zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
zplug "mafredri/zsh-async", on:"sindresorhus/pure"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions"

# enshure all plugins are installed
if ! zplug check; then
    zplug install
fi

# source plugins and add commands to $PATH
# zplug load --verbose
zplug load 
