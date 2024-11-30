#!/usr/bin/env bash

set -e

if ! [ -f "$HOME/.config/alacritty/alacritty.toml" ]
then
    echo "> Setup Alacritty"

    mkdir -p $HOME/.config
    mkdir -p $HOME/.config/alacritty

    BASEDIR=$DOTFILES_HOME/alacritty
    if [[ "$(uname)" == "Darwin" ]]
    then
        ln -s $BASEDIR/alacritty.macos.toml $HOME/.config/alacritty/alacritty.toml
    elif [[ "$(uname)" == "Linux" ]]
    then
        ln -s $BASEDIR/alacritty.linux.toml $HOME/.config/alacritty/alacritty.toml
    else
        echo "> System is not macOS nor Linux; Alacritty is misconfigured"
    fi
    # ln -s $BASEDIR/alacritty.yml $HOME/.config/alacritty/alacritty.yml

    echo "> Done!"
else
    echo "> Alacritty configuration file is already available; skipping"
fi
