#!/usr/bin/env zsh

set -e

PREZTO_DIR=$HOME/.zprezto

if ! [ -d "$PREZTO_DIR" ]
then
    echo '> Setup Prezto'
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

    setopt EXTENDED_GLOB
    for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -fs "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
    done

    echo '> Done!'
fi
