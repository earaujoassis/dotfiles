#!/usr/bin/env bash

set -e

HOME_PROFILE=$HOME/.profile
touch $HOME_PROFILE

if ! grep -q 'ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR' "$HOME_PROFILE"
then
    echo ">> zsh highlight configuration"
    echo "" >> $HOME_PROFILE
    echo 'export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/share/zsh-syntax-highlighting/highlighters' >> $HOME_PROFILE
    echo 'source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' >> $HOME_PROFILE
fi

echo "> Done!"
