#!/usr/bin/env bash

set -e

HOME_PROFILE=$HOME/.profile
ASDF_DIR=$HOME/.asdf

if ! [ -d "$ASDF_DIR" ]
then
    echo '> Setup asdf'
    git clone https://github.com/asdf-vm/asdf.git $ASDF_DIR --branch v0.10.0
    echo "" >> $HOME_PROFILE
    echo 'source $HOME/.asdf/asdf.sh' >> $HOME_PROFILE
    echo '> Done!'
else
    echo "> Updating asdf"
    asdf update
    asdf plugin-update --all
    echo '> Done!'
fi
