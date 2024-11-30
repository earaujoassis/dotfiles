#!/usr/bin/env bash

# WARNING coreutils is only explicitly installed on macOS

set -e

HOME_PROFILE=$HOME/.profile
GNUBIN="/usr/local/opt/coreutils/libexec/gnubin"

if [ -f "$GNUBIN" ] && ! [ `grep -q 'export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"' "$HOME_PROFILE"` ]
then
    echo "> Setup coreutils"
    echo "" >> $HOME_PROFILE
    echo 'export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"' >> $HOME_PROFILE
    echo "> Done!"
fi
