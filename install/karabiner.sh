#!/bin/bash

######################################################
# Karabiner setup
######################################################

echo "Configuring Karabiner"

KARABINER_DIR="$HOME/Library/Application Support/Karabiner"
if [ ! -d "$KARABINER_DIR" ]; then
    echo "Creating $KARABINER_DIR"
    mkdir "$HOME/Library/Application Support/Karabiner"
fi

ln -s $HOME/.dotfiles/config/Karabiner/private.xml "$KARABINER_DIR/private.xml"