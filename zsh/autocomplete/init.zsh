# Initialize completion
FPATH="/opt/homebrew/share/zsh/site-functions:${FPATH}"
autoload -Uz compinit

# ensure compinit active for compdef depending plugins to function correctly
if [[ -e ~/.zcompdump ]]; then
    compinit -C
else
    compinit
fi
