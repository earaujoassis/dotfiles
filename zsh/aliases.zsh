# Aliases for zsh

ZSHDIR=$HOME/dotfiles/zsh
source $ZSHDIR/self.zsh
source $ZSHDIR/git.zsh
source $ZSHDIR/docker.zsh
source $ZSHDIR/ssh.zsh

if [ -f "$ZSHDIR/work-setup.zsh" ]; then
    source $ZSHDIR/work-setup.zsh
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
