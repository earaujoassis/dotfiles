#!/usr/bin/env bash

set -e

HOME_PROFILE=$HOME/.profile
ASDF_DIR=$HOME/.asdf

read -n1 -rep '> Would you like to setup ASDF? [y, N] ' OPTION
if [[ $OPTION == "Y" || $OPTION == "y" ]]
then

    if ! [ -d "$ASDF_DIR" ]
    then
        echo "> Installing asdf"
        git clone https://github.com/asdf-vm/asdf.git $ASDF_DIR --branch v0.14.1
        echo "" >> $HOME_PROFILE
        echo 'source $HOME/.asdf/asdf.sh' >> $HOME_PROFILE
        echo "> Done!"
    else
        echo "> Updating asdf"
        asdf update
        asdf plugin-update --all
        echo "> Done!"
    fi

else
    echo "> Skipping asdf setup"
fi
