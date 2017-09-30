# Plank Keyboard Layout

The Plank is a ortolinear Keyboard created by [olkb](https://olkb.com/planck), that can be configured via the [Quantum Mechanical Keyboard
Firmware](https://github.com/qmk/qmk_firmware). 
The files of this repo are my current keyboard layout configuration.

This layout is initially copied from [Noah Fredericks great layout](https://github.com/noahfrederick/dots/tree/master/planck) and will be modified by my needs.

## Build

Install the [Quantum Mechanical Keyboard Firmware](https://github.com/qmk/qmk_firmware) and add this planck dir into the directory 
 ./plank/keymaps.

Example

    ln -s /path/to/dotfiles/planck /path/to/qmk_firmware/keyboards/planck/keymaps/jirgn
    sudo make clean && sudo make planck-rev4-jirgn-dfu

If you have Error like

    dfu-programmer: no device present.
    Error: Bootloader not found. Trying again in 5s.

try to use the manual switch on the keyboard directly (little hole in the bottom).
