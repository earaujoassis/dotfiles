#!/usr/bin/env bash

export HOME_PROFILE=$HOME/.profile
touch $HOME_PROFILE
BASEDIR=$DOTFILES_HOME/starship

if ! [ `which starship` ]
then
    echo '> Setup Starship'
    echo '> Installing Starship'
    curl -fsSL https://starship.rs/install.sh | sh
    echo "" >> $HOME_PROFILE
    echo 'eval "$(starship init zsh)"' >> $HOME_PROFILE
    mkdir -p $HOME/.config
    ln -s $BASEDIR/starship.toml $HOME/.config/starship.toml
    echo '> Done!'
fi
