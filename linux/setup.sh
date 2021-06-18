#!/usr/bin/env bash

set -e

echo '> Setup Linux'

BASEDIR=$(dirname $(realpath "$0"))
ln -s $BASEDIR/.XCompose $HOME/.XCompose

echo '> Done!'
