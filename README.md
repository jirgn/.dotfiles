# .dotfiles

These is a set of configuartion files for zsh/bash shell as well as vim and other development relevant tools.
The setup is heavily inspired by (https://github.com/nicknisi/dotfiles).

## Theme
This setup uses the widely popular [ solarized theme ](http://ethanschoonover.com/solarized). After spending some time with other hyped themes i came back to this one.
It's possibility to switch from dark to light and the low contrast look is what I find the most pleasing setup at the time.
When running vim in the terminal, you need to setup the solarized colorscheme in the
Termianl(emulator).
* [iterm2](https://github.com/altercation/ethanschoonover.com/tree/master/projects/solarized/iterm2-colors-solarized)
* [osx-termial](https://github.com/altercation/ethanschoonover.com/tree/master/projects/solarized/osx-terminal.app-colors-solarized)

Maybe you whant to also have a look at [gruvbox](https://github.com/morhetz/gruvbox), which is a great alternative.

## Fonts
I use the [NerdFonts]( https://github.com/ryanoasis/nerd-fonts ), because of their iconset that is compatible with powerline as well as NERDTree.
Just download it, install it on your system and ensure it is used by your favourite Terminal(emulator).

## Installation
Simply checkout this repo to your home directory.

    git clone git@github.com:jirgn/.dotfiles.git ~/

and run the install script

    cd ~/.dotfiles && ./install.sh

>My Setup assumes MacOs and brew installed on your system. If you are using linux, just take a look into the ./install/brew.sh to get an idea what to install with your favourite package manager.
>You can extend the install.sh with your system setup to make run. 
>Good Luck

## Automounting on Linux
see [this
article](https://unix.stackexchange.com/questions/294965/integration-of-afuse-user-level-automounter-with-sshfs-as-a-systemd-service-spaw/528699#528699)
We installed a sshfs fuse filesystem as well as afuse for automounting possibility for specific user.
The Automounting is startet with a user specific systemd unit, see ./config/systemd/user/afuse.service

there is a user 

    mkdir ~/scp  # Or Home Directories of all users, /etc/skel/ 
    systemctl --user daemon-reload   # If root, then omit '--user'
    # If enabling only for the current user:
    systemctl --user enable afuse.service
    # If enabling for all users, execute as root:
    # systemctl --user --global enable service
    systemctl --user start afuse.service
