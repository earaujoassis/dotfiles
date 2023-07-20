#!/usr/bin/env zsh

# Bootstrap ZSH

set -e

echo '> Starting Bootstrap for ZSH'

HOME_PROFILE=$HOME/.profile
touch $HOME_PROFILE
source $HOME_PROFILE

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
    bash -c $HOME/dotfiles/macos/setup.sh
    bash -c $HOME/dotfiles/brew/setup.sh
    bash -c $HOME/dotfiles/macos/post-brew.sh
    bash -c $HOME/dotfiles/coreutils/setup.sh
    bash -c $HOME/dotfiles/alacritty/setup.sh
else
    bash -c $HOME/dotfiles/linux/setup.sh
fi

bash -c $HOME/dotfiles/git/setup.sh
bash -c $HOME/dotfiles/starship/setup.sh
bash -c $HOME/dotfiles/asdf/setup.sh
bash -c $HOME/dotfiles/sdkman/setup.sh

echo '> You must source $HOME/.profile'
