#!/usr/bin/env bash

set -e

HOME_PROFILE=$HOME/.profile

read -n1 -rep '> Would you like to setup sdkman? (y,n) ' OPTION
if [[ $OPTION == "Y" || $OPTION == "y" ]]
then

    SDKMAN_DIR=$HOME/.sdkman
    if ! [ -d "$SDKMAN_DIR" ]
    then
        echo "> Setup sdkman"
        curl -s "https://get.sdkman.io" | bash
        echo "" >> $HOME_PROFILE
        echo 'source $HOME/.sdkman/bin/sdkman-init.sh' >> $HOME_PROFILE
        echo "> Done!"
    else
        echo "> Updating sdkman"
        sdk update
        echo "> Done!"
    fi

else
    echo "> Skipping sdkman setup"
fi
