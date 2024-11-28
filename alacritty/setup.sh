#!/usr/bin/env bash

set -e

if ! [ -f "$HOME/.config/alacritty/alacritty.toml" ]
then
    echo "> Setup Alacritty"

    mkdir -p $HOME/.config
    mkdir -p $HOME/.config/alacritty

    BASEDIR=$DOTFILES_HOME/alacritty
    ln -s $BASEDIR/alacritty.toml $HOME/.config/alacritty/alacritty.toml
    ln -s $BASEDIR/alacritty.yml $HOME/.config/alacritty/alacritty.yml

    echo "> Done!"
else
    echo "> Alacritty configuration file is already available; skipping"
fi
