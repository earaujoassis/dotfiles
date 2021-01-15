# Aliases for ZSH

ZSHDIR=$(dirname $(realpath "$0"))
source $ZSHDIR/git.zsh
source $ZSHDIR/docker.zsh

SUBLIME_MACOS="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
if [ -f "$SUBLIME_MACOS" ]; then
    alias sublime = "$SUBLIME_MACOS"
fi

ps-sbt() {
    ps aux | grep sbt
}

kill-sbt() {
    kill -9 $(ps aux | grep sbt | awk '{ print $2 }' | sed -n 1p)
}
