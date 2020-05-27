# Aliases for ZSH

ZSHDIR=$(dirname $(realpath "$0"))
source $ZSHDIR/git.zsh

SUBLIME_MACOS="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
if [ -f "$SUBLIME_MACOS" ]; then
    alias sublime = "$SUBLIME_MACOS"
fi
