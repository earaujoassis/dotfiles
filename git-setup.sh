#!/usr/bin/env bash

set -e

echo 'Setup git'

git config --global user.name "Carlos A."
git config --global user.email 593456+earaujoassis@users.noreply.github.com
git config --global core.excludesfile ~/dotfiles/.gitignore

# git config --global user.signingkey ${KEY}
git config --global commit.gpgsign true

echo 'Done!'
