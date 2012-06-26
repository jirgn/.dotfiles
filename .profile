# ------------------------------------------
# Misc. Environment
# ------------------------------------------
export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Versions/1.6.0/Home"
export ANT_HOME=/usr/share/ant

export EDITOR=vim
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'

# terminal color
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

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

