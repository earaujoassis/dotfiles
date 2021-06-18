#!/usr/bin/env bash

set -e

echo '> Setup Sdkman'

HOME_PROFILE=$HOME/.profile

export SDKMAN_DIR=$HOME/.sdkman
if ! [ -d "$SDKMAN_DIR" ]
then
    curl -s "https://get.sdkman.io" | bash
    echo "" >> $HOME_PROFILE
    echo 'source $HOME/.sdkman/bin/sdkman-init.sh' >> $HOME_PROFILE
else
    echo '> Updating sdkman'
    sdk update
fi

echo '> Done!'
