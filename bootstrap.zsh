#!/usr/bin/env zsh

# Bootstrap ZSH

set -e

echo '> Starting Bootstrap for ZSH'

HOME_PROFILE=$HOME/.profile
touch $HOME_PROFILE
source $HOME_PROFILE
BASEDIR=$(dirname $(realpath "$0"))

if ! grep -q 'source $HOME/dotfiles/zsh/profile.zsh' "$HOME_PROFILE"; then
    echo "" >> $HOME_PROFILE
    echo 'source $HOME/dotfiles/zsh/profile.zsh' >> $HOME_PROFILE
    mkdir -p $HOME/.local/bin
    echo "" >> $HOME_PROFILE
    echo 'export PATH=$HOME/.local/bin:$HOME/dotfiles/script:$PATH' >> $HOME_PROFILE
fi

if ! grep -q 'source $HOME/.profile' "$HOME/.zshrc"
then
    echo "" >> $HOME/.zshrc
    echo 'source $HOME/.profile' >> $HOME/.zshrc
fi

if [ "$(uname)" == "Darwin" ]
then
    bash -c $BASEDIR/macos/setup.sh
    bash -c $BASEDIR/brew/setup.sh
    bash -c $BASEDIR/macos/post-brew.sh
    bash -c $BASEDIR/coreutils/setup.sh
    bash -c $BASEDIR/alacritty/setup.sh
else
    bash -c $BASEDIR/linux/setup.sh
fi

bash -c $BASEDIR/git/setup.sh
bash -c $BASEDIR/starship/setup.sh
bash -c $BASEDIR/asdf/setup.sh
bash -c $BASEDIR/sdkman/setup.sh

echo '> You must source $HOME/.profile'
