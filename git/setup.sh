#!/usr/bin/env bash

set -e

echo '> Setup git'

git config --global user.name "Carlos A."
git config --global user.email 588595+earaujoassis@general.noreply.quatrolabs.com
git config --global core.excludesfile ~/dotfiles/.gitignore
git config --global pull.rebase false  # merge (the default strategy)
git config --global init.defaultBranch main
git config --global credential.helper osxkeychain

DOTFILES_BASEDIR=$(dirname $(dirname $(realpath "$0")))
git config --global core.excludesfile $DOTFILES_BASEDIR/.gitignore

echo '> Done!'
