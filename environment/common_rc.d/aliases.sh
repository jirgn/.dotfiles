alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ll='exa --long --git --time-style long-iso --time=modified --group-directories-first'
alias la='exa --long --git --time-style long-iso --time=modified --group-directories-first -a'
alias ls='exa -G'
alias gg='lazygit'
alias k='kubectl'
alias kk='k9s'

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
alias portainer="docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest"
