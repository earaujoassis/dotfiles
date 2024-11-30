#!/usr/bin/env bash

if ! [ `which nvim` ]
then
    echo "> neovim is not available."
    read -n1 -rep '> Would you like to install neovim? (y,n) ' OPTION
    if [[ $OPTION == "Y" || $OPTION == "y" ]]
    then
        if [[ "$(which brew)" != "" ]] && [[ "$(uname)" == "Darwin" ]]
        then
            brew install neovim
        else
            echo "> Could not install it; please install neovim"
        fi
    fi
fi

NV_CHAD_DIR=$HOME/.config/nvim
if ! [ -d "$NV_CHAD_DIR" ]
then
    echo "> Installing NvChad's neovim configuration"
    ln -s $DOTFILES_HOME/neovim/nv-chad $NV_CHAD_DIR
else
    echo "> NvChad's is already installed; skipping"
fi
