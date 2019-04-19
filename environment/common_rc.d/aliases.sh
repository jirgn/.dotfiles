alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ll='ls -Gl'
alias la='ls -lAhG'
alias l='ls -CFG'
# ensure lazy loded nvm and python are present as well as the project specific binaries (eslint, phpunit ...)
alias nvim='node --version && python --version && nvim'
alias vi='nvim'
alias vim='nvim'

# tools
alias free='top -l 1 | grep Phys'
alias top='top -o cpu'
alias grep="grep --exclude='all-wcprops' --exclude='*.tmp' --exclude='entries' --exclude='*.svn-base' --exclude='*.svn*' "
alias tmux="TERM=screen-256color-bce tmux"
alias php="${BREW_PREFIX}/opt/php@7.1/bin/php"
