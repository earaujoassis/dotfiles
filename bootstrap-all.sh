#!/usr/bin/env bash

# Bootstrap SH

set -e

echo "> Starting Bootstrap"

if [ -n "`$SHELL -c 'echo $ZSH_VERSION'`" ]
then
    echo "> Running inside zsh."
else
    echo "> Can't be loaded from: $SHELL. You need to run zsh instead."
    exit
fi

if [ -f "$HOME/dotfiles/checkpoints/completed" ]
then
    echo "> Bootstrap already completed; exiting"
    exit
fi

if [[ "$(which brew)" == "" ]] && [[ "$(uname)" == "Darwin" ]]
then
    echo "> It seems brew is not available or it's not installed"
    echo "> Installing Homebrew"
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    export PATH=/opt/homebrew/bin:$PATH
    /opt/homebrew/bin/brew bundle --file=$HOME/dotfiles/brew/Brewfile || true
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

export DOTFILES_HOME=$HOME/dotfiles

bash -c $HOME/dotfiles/self/setup.sh
bash -c $HOME/dotfiles/prezto/setup.sh

if [[ "$(uname)" == "Darwin" ]]
then
    bash -c $HOME/dotfiles/macos/setup.sh
    bash -c $HOME/dotfiles/brew/setup.sh
    bash -c $HOME/dotfiles/macos/post-brew.sh
    bash -c $HOME/dotfiles/coreutils/setup.sh
else
    bash -c $HOME/dotfiles/linux/setup.sh
fi

bash -c $HOME/dotfiles/python/setup.sh
bash -c $HOME/dotfiles/git/setup.sh
bash -c $HOME/dotfiles/alacritty/setup.sh
bash -c $HOME/dotfiles/starship/setup.sh
bash -c $HOME/dotfiles/asdf/setup.sh
bash -c $HOME/dotfiles/sdkman/setup.sh
bash -c $HOME/dotfiles/neovim/setup.sh

bash -c $HOME/dotfiles/self/set-default-shell.sh

bash -c $HOME/dotfiles/self/checkpoint-completed.sh

echo "> You must source $HOME/.profile"
