#!/usr/bin/env bash

set -e

if ! [ -f "$HOME/.pythonrc" ]
then
    echo '> Setup python'

    BASEDIR=$DOTFILES_HOME/python
    ln -s $BASEDIR/.pythonrc $HOME/.pythonrc

    echo '> Done!'
fi
