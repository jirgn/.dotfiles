# ------------------------------------------
# Misc. Environment
# ------------------------------------------
export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Versions/1.6.0/Home"
export ANT_HOME=/usr/share/ant

export EDITOR=vim
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export MAKEOPTS="-j9"

export LANG=de_DE.UTF-8
export LC_ALL=de_DE.UTF-8

DEFAULT_PROXY_HOST=192.168.160.252
DEFAULT_PROXY_PORT=3128
export http_proxy="http://$DEFAULT_PROXY_HOST:$DEFAULT_PROXY_PORT"
export https_proxy="http://$DEFAULT_PROXY_HOST:$DEFAULT_PROXY_PORT"
export ftp_proxy="http://$DEFAULT_PROXY_HOST:$DEFAULT_PROXY_PORT"
export no_proxy="*.local, 127.0.0.1, 169.254/16, *.vbox, *.franz-cornelsen-bildungsgruppe.de, *.cornelsen.de, *.entwicklung.fccs, *.localhost, *.cornelsen-schulverlage.de, $DEFAULT_PROXY_HOST, *.duden-schulbuch.de, *oldenbourg.de"

export PTOOLSPATH=/Users/messner.j/Development/shared/php/vendor/phalcon/devtools/
export PATH=$PATH:/Users/messner.j/Development/shared/php/vendor/phalcon/devtools
export PTOOLSPATH=/Users/messner.j/Development/shared/php/vendor/phalcon/devtools/
export PATH=$PATH:/Users/messner.j/Development/shared/php/vendor/phalcon/devtools

# ------------------------------------------
# path definition
# ------------------------------------------
PATH=/usr/X11/bin:$PATH     # X11 Stuff
PATH=$ROOTSYS/bin:$PATH     # ROOT Data Analysis Framework
PATH=/opt/local/bin:$PATH   # MacPorts
PATH=/opt/local/sbin:$PATH  # MacPorts
PATH=/usr/local/bin:$PATH   # User binaries
PATH=$HOME/bin:$PATH        # Personal binaries

# ------------------------------------------
# Aliases
# ------------------------------------------
alias ll='ls -l'
alias la='ls -lAh'
alias l='ls -CF'
alias free='top -l 1 | grep Phys'
alias top='top -o cpu'
alias grep="grep --exclude='all-wcprops' --exclude='*.tmp' --exclude='entries' --exclude='*.svn-base' --exclude='*.svn*' "
alias git="/usr/local/Cellar/git/2.2.1/bin/git"


# -----------------------------------------
# gitproxy
# -----------------------------------------

# requires brew install socat
if [ -f `brew --prefix`/bin/socat ]; then
    export GIT_PROXY_COMMAND=/tmp/gitproxy;

    cat  > $GIT_PROXY_COMMAND <<EOF
#!/bin/bash
`brew --prefix`/bin/socat - PROXY:$DEFAULT_PROXY_HOST:\$1:\$2,proxyport=$DEFAULT_PROXY_PORT
EOF
    chmod +x $GIT_PROXY_COMMAND;
fi



#---------------------------
# Terminal
#---------------------------

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
    xterm-256color) color_prompt=yes;;
esac

# requires brew install bash-completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

# requires brew install git
if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then
    . `brew --prefix`/etc/bash_completion.d/git-completion.bash
fi

# ------------------------------------------
# Colors
# require brew install coreutils
# ------------------------------------------
if [ "$color_prompt" = yes ]; then
    GNU_LS="$(brew --prefix coreutils)/libexec/gnubin/ls"
    if [ "$TERM" != "dumb" ] && [ -x $GNU_LS ]; then
        alias ls='$(brew --prefix coreutils)/libexec/gnubin/ls --color=auto'
    fi

    GNU_DIRCOLORS="$(brew --prefix coreutils)/libexec/gnubin/dircolors"
    if [ "$TERM" != "dumb" ] && [ -x $GNU_DIRCOLORS ]; then
        eval $($GNU_DIRCOLORS $HOME/.dir_colors)

        export LS_OPTIONS='--color=auto'
        export CLICOLOR='Yes'

        #alias dir='ls --color=auto --format=vertical'
        #alias vdir='ls --color=auto --format=long'

        #alias grep='grep --color=auto'
        #alias fgrep='fgrep --color=auto'
        #alias egrep='egrep --color=auto'
    else
        # set dircolors for osx native fileutils
        # http://www.napolitopia.com/2010/03/lscolors-in-osx-snow-leopard-for-dummies/
        export CLICOLOR=1
        export LSCOLORS='gxgxfxfxcxdxdxhbadbxbx'
        alias ls='ls -G'
    fi


    DULL=0
    BRIGHT=1

    FG_BLACK=30
    FG_RED=31
    FG_GREEN=32
    FG_YELLOW=33
    FG_BLUE=34
    FG_VIOLET=35
    FG_CYAN=36
    FG_WHITE=37

    FG_NULL=00

    BG_BLACK=40
    BG_RED=41
    BG_GREEN=42
    BG_YELLOW=43
    BG_BLUE=44
    BG_VIOLET=45
    BG_CYAN=46
    BG_WHITE=47

    BG_NULL=00

    ##
    # ANSI Escape Commands
    ##
    ESC="\033"
    NORMAL="\[$ESC[m\]"
    RESET="\[$ESC[${DULL};${FG_WHITE};${BG_NULL}m\]"

    ##
    # Shortcuts for Colored Text ( Bright and FG Only )
    ##

    # DULL TEXT

    BLACK="\[$ESC[${DULL};${FG_BLACK}m\]"
    RED="\[$ESC[${DULL};${FG_RED}m\]"
    GREEN="\[$ESC[${DULL};${FG_GREEN}m\]"
    YELLOW="\[$ESC[${DULL};${FG_YELLOW}m\]"
    BLUE="\[$ESC[${DULL};${FG_BLUE}m\]"
    VIOLET="\[$ESC[${DULL};${FG_VIOLET}m\]"
    CYAN="\[$ESC[${DULL};${FG_CYAN}m\]"
    WHITE="\[$ESC[${DULL};${FG_WHITE}m\]"

    # BRIGHT TEXT
    BRIGHT_BLACK="\[$ESC[${BRIGHT};${FG_BLACK}m\]"
    BRIGHT_RED="\[$ESC[${BRIGHT};${FG_RED}m\]"
    BRIGHT_GREEN="\[$ESC[${BRIGHT};${FG_GREEN}m\]"
    BRIGHT_YELLOW="\[$ESC[${BRIGHT};${FG_YELLOW}m\]"
    BRIGHT_BLUE="\[$ESC[${BRIGHT};${FG_BLUE}m\]"
    BRIGHT_VIOLET="\[$ESC[${BRIGHT};${FG_VIOLET}m\]"
    BRIGHT_CYAN="\[$ESC[${BRIGHT};${FG_CYAN}m\]"
    BRIGHT_WHITE="\[$ESC[${BRIGHT};${FG_WHITE}m\]"

    # REV TEXT as an example
    REV_CYAN="\[$ESC[${DULL};${BG_WHITE};${BG_CYAN}m\]"
    REV_RED="\[$ESC[${DULL};${FG_YELLOW}; ${BG_RED}m\]"
    HOSTNAME_SHORT=$(hostname|sed -e 's/^\([^\.]\{0,\}\)\..*$/\1/')

    function git_dirty()
    {
        exit 0
        [[ "$(git status 2> /dev/null)" =~ "working directory clean" ]] || \
            echo -e " $ESC[${DULL};${FG_RED}m⚡$ESC[m"
    }

    PS1="${CYAN}\$([ \"root\" == \"$USER\" ] && printf \"${BRIGHT_RED}\")${USER} ${BRIGHT_BLUE}${HOSTNAME_SHORT}${WHITE} \w ${GREEN}\$([ \"function\" == \"`type -t __git_ps1`\" ] && __git_ps1 "%s"; git_dirty) ${NORMAL}\$ ${RESET}"
    export CLICOLOR=1

fi

