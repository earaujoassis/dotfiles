# Aliases for ZSH

ZSHDIR=$HOME/dotfiles/zsh
source $ZSHDIR/git.zsh
source $ZSHDIR/docker.zsh
source $ZSHDIR/ssh.zsh

if [ -f "$ZSHDIR/work-setup.zsh" ]; then
    source $ZSHDIR/work-setup.zsh
fi

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

whereami() {
    echo $PWD
}

brew-dump() {
    brew bundle dump --file=$HOME/dotfiles/brew/Brewfile --force
}
