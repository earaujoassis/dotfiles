#!/usr/bin/env Fish

# Bootstrap Fish

set CONFIG_FILE=$HOME/.config/fish/config.fish
touch $CONFIG_FILE
set BASEDIR (dirname (status --current-filename))

set OMF_DIR ($HOME/.local/share/omf)
if ! [ -d "$OMF_DIR" ]
    curl -L https://get.oh-my.fish | fish
end

if ! grep -q 'source $HOME/dotfiles/fish/profile.fish' "$CONFIG_FILE"
    echo "" >> $CONFIG_FILE
    echo 'source $HOME/dotfiles/zsh/profile.fish' >> $CONFIG_FILE
    mkdir -p $HOME/.local/bin
    echo "" >> $CONFIG_FILE
    echo 'export PATH=$HOME/.local/bin:$HOME/dotfiles/script:$PATH' >> $CONFIG_FILE
end

if "(uname)" == "Darwin"
    bash -c $BASEDIR/macos/setup.sh
    bash -c $BASEDIR/brew/setup.sh
    bash -c $BASEDIR/macos/post-brew.sh
    bash -c $BASEDIR/coreutils/setup.sh
    bash -c $BASEDIR/alacritty/setup.sh
else
    bash -c $BASEDIR/linux/setup.sh
end

bash -c $BASEDIR/git/setup.sh
bash -c $BASEDIR/starship/setup.sh
bash -c $BASEDIR/asdf/setup.sh
bash -c $BASEDIR/sdkman/setup.sh

echo "> You must source the Fish Shell config"
