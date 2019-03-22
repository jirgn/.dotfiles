# this is only needed if antibody is always loaded dynamic
# source <(antibody init)
ZSH_PLUGINS_FILE="${HOME}/.zsh_plugins.sh"
if [[ ! -f  $ZSH_PLUGINS_FILE ]]; then
    antibody bundle < "${DOTFILES}/zsh/antibody_plugins.txt" > $ZSH_PLUGINS_FILE
fi
source $ZSH_PLUGINS_FILE
