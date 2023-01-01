# this is only needed if antibody is always loaded dynamic
# source <(antibody init)
# ZSH_PLUGINS_FILE="${HOME}/.zsh_plugins.sh"
# if [[ ! -f  $ZSH_PLUGINS_FILE ]]; then
#     antibody bundle < "${DOTFILES}/zsh/antibody_plugins.txt" > $ZSH_PLUGINS_FILE
# fi
# source $ZSH_PLUGINS_FILE

antidote_dir=/usr/share/zsh-antidote
plugins_txt="${DOTFILES}/zsh/plugins.txt"
static_file="${HOME}/.zsh_plugins.sh"

# Clone antidote if necessary and generate a static plugin file.
if [[ ! $static_file -nt $plugins_txt ]]; then
    source $antidote_dir/antidote.zsh
    [[ -e $plugins_txt ]] || touch $plugins_txt
    antidote bundle < $plugins_txt > $static_file
fi

# Uncomment this if you want antidote commands like `antidote update` available
# in your interactive shell session:
autoload -Uz $antidote_dir/functions/antidote

# source the static plugins file
source $static_file

# cleanup
unset antidote_dir plugins_txt static_file
