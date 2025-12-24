#!/usr/bin/env bash

HOME_PROFILE=$HOME/.profile
touch $HOME_PROFILE

if ! [ `which starship` ]
then
    echo "> Installing Starship"
    curl -fsSL https://starship.rs/install.sh | sh
    echo "> Updating .profile to load starship..."
    echo "" >> $HOME_PROFILE
    echo 'eval "$(starship init zsh)"' >> $HOME_PROFILE
    echo "> Done!"
else
    echo "> Starship is already installed; skipping"
fi

BASEDIR=$DOTFILES_HOME/starship
if ! [ -f "$HOME/.config/starship.toml" ]
then
    echo "> Configuring Starship"
    mkdir -p $HOME/.config
    ln -s $BASEDIR/starship.toml $HOME/.config/starship.toml
    echo "> Done!"
else
    echo "> Starship is already configured; skipping"
fi
