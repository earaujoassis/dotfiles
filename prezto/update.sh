#!/usr/bin/env bash

set -ex

cd $ZPREZTODIR
git pull
git submodule sync --recursive
git submodule update --init --recursive
