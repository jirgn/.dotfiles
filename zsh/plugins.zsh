antidote_dir=/opt/homebrew/opt/antidote/share/antidote
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
