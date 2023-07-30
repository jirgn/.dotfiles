# Addidional Funcions
# --------
fkill() {
  local pid
  pid=`ps -ef | sed 1d | fzf -m | awk '{print $2}'`

  if [ "x$pid" != "x" ]
  then
    echo $pid | xargs kill -${1:-9}
  fi
}

alias fkill=fkill

fpack() {
 `pacman -Qq | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'`
}
alias fpack=fpack
