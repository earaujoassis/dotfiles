# Aliases for Git at ZSH (Work related)

if [ -f "$HOME/dotfiles/config/work-env.zsh" ]
then
    source $HOME/dotfiles/config/work-env.zsh
fi

git-work-profile() {
    ENV_FILE=$HOME/dotfiles/config/.env
    if grep -q 'GIT_WORK_EMAIL' "$ENV_FILE" && [ -f "$ENV_FILE" ]
    then
        set -o allexport
        source $ENV_FILE
        git config --global user.email "$GIT_WORK_EMAIL"
        set +o allexport
        echo "> Using the following email now: $(git config --global user.email)"
    elif ! [ -f "$ENV_FILE" ]
    then
        echo 'Error: missing $HOME/dotfiles/config/.env file'
    else
        echo 'Error: missing GIT_WORK_EMAIL in $HOME/dotfiles/config/.env file'
    fi
}

git-personal-profile() {
    ENV_FILE=$HOME/dotfiles/config/.env
    if grep -q 'GIT_PERSONAL_EMAIL' "$ENV_FILE" && [ -f "$ENV_FILE" ]
    then
        set -o allexport
        source $ENV_FILE
        git config --global user.email "$GIT_PERSONAL_EMAIL"
        set +o allexport
        echo "> Using the following email now: $(git config --global user.email)"
    elif ! [ -f "$ENV_FILE" ]
    then
        echo 'Error: missing $HOME/dotfiles/config/.env file'
    else
        echo 'Error: missing GIT_PERSONAL_EMAIL in $HOME/dotfiles/config/.env file'
    fi
}
