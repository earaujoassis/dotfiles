#!/usr/bin/env bash

set -e

echo '> Post-brew install'

echo '>> Maccy configuration'
# === Maccy ===
# https://github.com/p0deje/Maccy
defaults write org.p0deje.Maccy pasteByDefault true
defaults write org.p0deje.Maccy historySize 20
defaults write org.p0deje.Maccy ignoredPasteboardTypes -array-add "com.myapp.CustomType"

HOME_PROFILE=$HOME/.profile
touch $HOME_PROFILE

if ! grep -q 'ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR' "$HOME_PROFILE"; then
    echo '>> zsh highlight configuration'
    echo "" >> $HOME_PROFILE
    echo 'export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/opt/homebrew/share/zsh-syntax-highlighting/highlighters' >> $HOME_PROFILE
    echo 'source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' >> $HOME_PROFILE
fi

echo '> Done!'
