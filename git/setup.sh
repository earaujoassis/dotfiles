#!/usr/bin/env bash

set -e

if [ "$GIT_USER_EMAIL" == "" ]
then
    GIT_USER_EMAIL=588595+earaujoassis@general.noreply.quatrolabs.com
fi

if [ `git config --global user.email` == "$GIT_USER_EMAIL" ]
then
    echo '> git already configured; skipping'
    exit
fi

echo '> Setup git'

git config --global user.name "Carlos A."
git config --global user.email $GIT_USER_EMAIL
git config --global core.excludesfile ~/dotfiles/.gitignore
git config --global pull.rebase false  # merge (the default strategy)
git config --global init.defaultBranch main

if [ "$(uname)" == "Darwin" ]
then
    git config --global credential.helper osxkeychain
fi

git config --global core.excludesfile $DOTFILES_HOME/.gitignore

echo '> Done!'
