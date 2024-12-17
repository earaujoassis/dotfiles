#!/usr/bin/env bash

set -e

read -n1 -rep '> Would you like to setup XCompose? [y, N] ' OPTION
if [[ $OPTION == "Y" || $OPTION == "y" ]]
then
    echo "> Setup XCompose"

    BASEDIR=$DOTFILES_HOME/linux
    ln -s $BASEDIR/.XCompose $HOME/.XCompose

    echo "> Done!"
fi

read -n1 -rep '> Would you like to setup gnupg? [y, N] ' OPTION
if [[ $OPTION == "Y" || $OPTION == "y" ]]
then
    echo "> Setup gnupg"

    mkdir -p $HOME/.gnupg/
    BASEDIR=$DOTFILES_HOME/linux
    ln -s $BASEDIR/gpg-agent.conf $HOME/.gnupg/gpg-agent.conf
    gpg-connect-agent reloadagent /bye

    echo "> Done!"
fi
