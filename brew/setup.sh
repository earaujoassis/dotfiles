#!/usr/bin/env bash

set -e

if ! [ `which brew` ]
then
    echo '> Installing Homebrew'
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    echo '> Done!'
else
    echo '> Setup Homebrew'
    BASEDIR=$DOTFILES_HOME/brew
    /opt/homebrew/bin/brew bundle --file=$BASEDIR/Brewfile
    echo '> Done!'
fi
