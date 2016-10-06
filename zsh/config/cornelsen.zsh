beginswith() { case $2 in "$1"*) true;; *) false;; esac; }
CURRENT_NETWORK_LOCATION="$(scselect | awk '{if ($1=="*") print $3}')"
if beginswith "(Cornelsen" $CURRENT_NETWORK_LOCATION; then
    echo "initializing Cornelsen specific environment"
    source $DOTFILES/environment/cornelsen
fi
