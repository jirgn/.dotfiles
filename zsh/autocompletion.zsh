# Initialize completion
autoload -Uz compinit

if type brew &>/dev/null; then
  FPATH="${(P)$(brew --prefix)/share/zsh/site-functions}:${FPATH}"
fi

# Daily cache invalidation for.zcompdump
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done

# Load completions from.zcompdump if available, otherwise generate them
if [[ -e ~/.zcompdump ]]; then
    compinit -C
else
    compinit
fi

# Activate completion list
zmodload -i zsh/complist

setopt auto_cd # cd by typing directory name if it's not a command
setopt correct_all # autocorrect commands
setopt auto_list # automatically list choices on ambiguous completion
setopt auto_menu # automatically use menu completion
setopt always_to_end # move cursor to end if word had one match

zstyle ':completion:*' menu select # select completions with arrow keys
zstyle ':completion:*' group-name '' # group results by category
zstyle ':completion:::::' completer _expand _complete _ignored _approximate # enable approximate matches for completion

