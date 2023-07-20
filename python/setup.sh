#!/usr/bin/env bash

set -e

echo '> Setup python'

BASEDIR=$(dirname $(realpath "$0"))

ln -s $BASEDIR/.pythonrc $HOME/.

echo '> Done!'
