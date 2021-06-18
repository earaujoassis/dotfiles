#!/usr/bin/env bash

set -e

echo '> Setup Homebrew'

BASEDIR=$(dirname $(realpath "$0"))

if ! [ `which brew` ]
then
    echo '> Installing Homebrew'
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    brew bundle --file=$BASEDIR/Brewfile
fi

echo '> Done!'
