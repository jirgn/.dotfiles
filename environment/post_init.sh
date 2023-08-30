# --------------------------
# initialize after common setup
# --------------------------

# ensure homebrew is before system paths
PATH=/opt/homebrew/bin:$PATH              # only MacOS
PATH=/opt/homebrew/sbin:$PATH             # only MacOS

# tools especially language version switcher need do be on top of the path to be present the relevant bin
source /opt/homebrew/opt/asdf/libexec/asdf.sh

