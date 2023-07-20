#!/usr/bin/env bash

set -e

echo '> Setup Linux'

BASEDIR=$DOTFILES_HOME/brew/linux
ln -s $BASEDIR/.XCompose $HOME/.XCompose

echo '> Done!'
