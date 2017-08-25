if [[ ! -d "$HOME/.nvm" ]]; then
    mkdir "$HOME/.nvm"
fi

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"
