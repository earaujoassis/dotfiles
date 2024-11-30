#!/usr/bin/env bash

set -e

read -n1 -rep '> Would you like to setup XCompose? (y,n) ' OPTION
if [[ $OPTION == "Y" || $OPTION == "y" ]]
then
    echo "> Setup XCompose"

    BASEDIR=$DOTFILES_HOME/linux
    ln -s $BASEDIR/.XCompose $HOME/.XCompose

    echo "> Done!"
fi
