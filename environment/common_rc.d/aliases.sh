alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ll='ls -Gl'
alias la='ls -lAhG'
alias l='ls -CFG'
# ensure lazy loded nvm and python are present as well as the project specific binaries (eslint, phpunit ...)
alias nvim='node --version && python --version && ruby --version && PATH=./node_modules/.bin:$PATH nvim'
alias vi='nvim'
# alias vim='nvim'
alias gemacs='node --version && python --version && /Applications/Emacs.app/Contents/MacOS/Emacs >/dev/null &'
alias emacs='node --version && python --version && emacs'

# tools
alias free='top -l 1 | grep Phys'
alias top='top -o cpu'
alias grep="grep --exclude='all-wcprops' --exclude='*.tmp' --exclude='entries' --exclude='*.svn-base' --exclude='*.svn*' "
alias tmux="TERM=screen-256color-bce tmux"
alias "${PHPROOT}/bin/php"
