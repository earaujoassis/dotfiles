#!/usr/bin/env bash

set -e

echo '> Setup ASDF'

HOME_PROFILE=$HOME/.profile
ASDF_DIR=$HOME/.asdf

if ! [ -d "$ASDF_DIR" ]
then
    git clone https://github.com/asdf-vm/asdf.git $ASDF_DIR --branch v0.7.8
    echo "" >> $HOME_PROFILE
    echo 'source $HOME/.asdf/asdf.sh' >> $HOME_PROFILE
else
    echo "> Updating asdf"
    asdf update
    asdf plugin-update --all
fi

echo '> Done!'
