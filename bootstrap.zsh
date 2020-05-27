#!/usr/bin/env sh

# Bootstrap ZSH

export HOME_PROFILE=$HOME/.profile
touch $HOME_PROFILE
source $HOME_PROFILE
BASEDIR=$(dirname $(realpath "$0"))

if ! grep -q 'source $HOME/dotfiles/zsh/aliases.zsh' "$HOME_PROFILE"; then
    echo "" >> $HOME_PROFILE
    echo 'source $HOME/dotfiles/zsh/aliases.zsh' >> $HOME_PROFILE
    mkdir -p $HOME/.local/bin
    echo "" >> $HOME_PROFILE
    echo 'export PATH=$HOME/.local/bin:$HOME/dotfiles/script:$PATH' >> $HOME_PROFILE
fi

if ! grep -q 'source $HOME/.profile' "$HOME/.zshrc"; then
    echo "" >> $HOME/.zshrc
    echo 'source $HOME/.profile' >> $HOME/.zshrc
fi

export ASDF_DIR=$HOME/.asdf
if ! [ -d "$ASDF_DIR" ]; then
    git clone https://github.com/asdf-vm/asdf.git $ASDF_DIR --branch v0.7.8
    echo "" >> $HOME_PROFILE
    echo 'source $HOME/.asdf/asdf.sh' >> $HOME_PROFILE
else
    echo "> Updating asdf"
    asdf update
    asdf plugin-update --all
fi

export SDKMAN_DIR=$HOME/.sdkman
if ! [ -d "$SDKMAN_DIR" ]; then
    curl -s "https://get.sdkman.io" | bash
    echo "" >> $HOME_PROFILE
    echo 'source $HOME/.sdkman/bin/sdkman-init.sh' >> $HOME_PROFILE
else
    echo "> Updating sdkman"
    sdk update
fi

GNUBIN="/usr/local/opt/coreutils/libexec/gnubin"
if [ -f "$GNUBIN" ]; then
    echo "" >> $HOME_PROFILE
    echo 'export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"' >> $HOME_PROFILE
fi

git config --global core.excludesfile $BASEDIR/.gitignore

echo '> You must source $HOME/.profile'
