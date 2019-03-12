# fix for terminfo problem in vim see https://github.com/neovim/neovim/wiki/FAQ#my-ctrl-h-mapping-doesnt-work
[[ -e ~/.terminfo ]] && export TERMINFO_DIRS=~/.terminfo:/usr/share/terminfo 
