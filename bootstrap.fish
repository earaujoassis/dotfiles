#!/usr/bin/env Fish

# Bootstrap Fish

export CONFIG_FILE=$HOME/.config/fish/config.fish
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

if ! [ `which brew` ]
    echo "Installing Homebrew"
    bash -c "(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
end

set ASDF_DIR ($HOME/.asdf)
if ! [ -d "$ASDF_DIR" ]
    git clone https://github.com/asdf-vm/asdf.git $ASDF_DIR --branch v0.7.8
    echo "" >> $CONFIG_FILE
    echo 'source $HOME/.asdf/asdf.fish' >> $CONFIG_FILE
else
    echo "> Updating asdf"
    asdf update
    asdf plugin-update --all
end

set SDKMAN_DIR ($HOME/.sdkman)
if ! [ -d "$SDKMAN_DIR" ]
    curl -s "https://get.sdkman.io" | bash
    echo "" >> $CONFIG_FILE
    echo 'source $HOME/.sdkman/bin/sdkman-init.sh' >> $CONFIG_FILE
else
    echo "> Updating sdkman"
    sdk update
end

set GNUBIN ("/usr/local/opt/coreutils/libexec/gnubin")
if [ -f "$GNUBIN" ]
    echo "" >> $CONFIG_FILE
    echo 'export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"' >> $CONFIG_FILE
end

if ! [ "(which starship)" ]
    echo "Installing Starship"
    curl -fsSL https://starship.rs/install.sh | bash
    echo "" >> $CONFIG_FILE
    echo 'eval "(starship init zsh)"' >> $CONFIG_FILE
end

git config --global core.excludesfile $BASEDIR/.gitignore

if "(uname)" == "Darwin"
    bash -c $BASEDIR/macos-setup.sh
end

bash -c $BASEDIR/git-setup.sh

echo "> You must source the Fish Shell config"
