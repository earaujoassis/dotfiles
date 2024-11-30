# Self configuration

if [[ "$DOTFILES_HOME" == "" ]] && [ -d "$HOME/dotfiles" ]
then
    export DOTFILES_HOME=$HOME/dotfiles
fi
