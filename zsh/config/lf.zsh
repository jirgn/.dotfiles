LFCD="/usr/share/lf/lfcd.sh"
if [ -f "$LFCD" ]; then
    source "$LFCD"
fi

bindkey -s '^o' 'lfcd\n'

