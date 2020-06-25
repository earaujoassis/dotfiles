# Aliases for Git at ZSH

alias git-push="git push -u origin HEAD"
alias git-pull="git fetch && git pull origin"
alias git-master="git checkout master"

git-tag() {
    if [ "$1" ]
    then
        git tag $1 && git push origin $1
    else
        echo "Error: missing tag name"
    fi
}
