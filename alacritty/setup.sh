#!/usr/bin/env bash

set -e

echo '> Setup Alacritty'

mkdir -p $HOME/.config
mkdir -p $HOME/.config/alacritty

BASEDIR=$(dirname $(realpath "$0"))
ln -s $BASEDIR/alacritty.yml $HOME/.config/alacritty/alacritty.yml

echo '> Done!'
