#!/usr/bin/env bash

set -e

HOME_PROFILE=$HOME/.profile
touch $HOME_PROFILE

# Brew is only explicitly installed on macOS

if ! [ grep -q 'eval "$(/opt/homebrew/bin/brew shellenv)"' "$HOME_PROFILE" ]
then
    echo "" >> $HOME_PROFILE
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME_PROFILE
fi

if ! [ `which brew` ]
then
    echo "> Installing Homebrew"
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    echo "> Done!"
else
    echo "> Setup Homebrew"
    BASEDIR=$DOTFILES_HOME/brew
    /opt/homebrew/bin/brew bundle --file=$BASEDIR/Brewfile
    echo "> Done!"
fi
