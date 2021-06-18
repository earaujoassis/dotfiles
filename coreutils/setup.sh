#!/usr/bin/env bash

set -e

echo '> Setup coreutils'

HOME_PROFILE=$HOME/.profile
GNUBIN="/usr/local/opt/coreutils/libexec/gnubin"

if [ -f "$GNUBIN" ]
then
    echo "" >> $HOME_PROFILE
    echo 'export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"' >> $HOME_PROFILE
fi

echo '> Done!'
