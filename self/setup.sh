#!/usr/bin/env bash

set -e

HOME_PROFILE=$HOME/.profile
touch $HOME_PROFILE

if ! [ `grep -q 'source $HOME/dotfiles/zsh/profile.zsh' "$HOME_PROFILE"` ]
then
    echo "" >> $HOME_PROFILE
    echo 'source $HOME/dotfiles/zsh/profile.zsh' >> $HOME_PROFILE
    mkdir -p $HOME/.local/bin
    echo "" >> $HOME_PROFILE
    echo 'export PATH=$HOME/.local/bin:$HOME/dotfiles/script:$PATH' >> $HOME_PROFILE
fi

if ! [ `grep -q 'source $HOME/.profile' "$HOME/.zshrc"` ]
then
    echo "" >> $HOME/.zshrc
    echo 'source $HOME/.profile' >> $HOME/.zshrc
fi
