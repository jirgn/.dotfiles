alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ll='ls -Gl'
alias la='ls -lAhG'
alias l='ls -CFG'
# ensure lazy loded nvm and python are present as well as the project specific binaries (eslint, phpunit ...)
alias nvim='node --version && python3 --version && PATH=./node_modules/.bin:$PATH nvim'
alias vi='nvim'
alias nv='nvim -u ~/.dotfiles/config/nvim_next/init.vim'


# tools
alias doom="~/.emacs.d/bin/doom"
alias free='top -l 1 | grep Phys'
alias top='top -o cpu'
alias grep="grep --exclude='all-wcprops' --exclude='*.tmp' --exclude='entries' --exclude='*.svn-base' --exclude='*.svn*' "
# alias php="${BREW_PREFIX}${PHPROOT}/bin/php"
alias getip='dig +short myip.opendns.com @resolver1.opendns.com'

alias tstamp='date "+%Y%m%d%H%m%S"'
