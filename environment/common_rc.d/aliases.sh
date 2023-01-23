alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ls='ls --color=auto'
alias ll='ls -Gl'
alias la='ls -lAhG'
alias l='ls -CFG'
# ensure project specific binaries (eslint, phpunit ...)
alias nvim='PATH=./node_modules/.bin:$PATH nvim'
alias nv=nvim
alias vim=nvim
alias vi=nvim

# tools
alias free='top -l 1 | grep Phys'
alias top='top -o cpu'
alias grep='grep --color=auto'
alias tmux='TERM=screen-256color tmux'
alias umirror='sudo reflector --country Germany --sort score -f 10 -l 100 --save /etc/pacman.d/mirrorlist'
alias doom='~/.emacs.d/bin/doom'

