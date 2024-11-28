#!/usr/bin/env bash

set -e

read -n1 -rep '> Would you like to setup Linux & XCompose? (y,n) ' OPTION
if [[ $OPTION == "Y" || $OPTION == "y" ]]
then

    echo "> Setup Linux"

    BASEDIR=$DOTFILES_HOME/brew/linux
    ln -s $BASEDIR/.XCompose $HOME/.XCompose

    echo "> Done!"

fi
