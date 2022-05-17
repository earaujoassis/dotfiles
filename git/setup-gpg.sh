#!/usr/bin/env bash

set -ex

echo '> Setup git and gpg'

git config --global user.signingkey ${KEY}
git config --global commit.gpgsign true

echo '> Done!'
