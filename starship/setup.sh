#!/usr/bin/env zsh

export HOME_PROFILE=$HOME/.profile
touch $HOME_PROFILE
source $HOME_PROFILE
BASEDIR=$(dirname $(realpath "$0"))

echo '> Setup Starship'

if ! [ `which starship` ]
then
    echo '> Installing Starship'
    curl -fsSL https://starship.rs/install.sh | bash
    echo "" >> $HOME_PROFILE
    echo 'eval "$(starship init zsh)"' >> $HOME_PROFILE
fi

echo '> Done!'
