# Aliases for Git at ZSH

alias git-push="git push -u origin HEAD"
alias git-pull="git fetch && git pull origin"
alias git-master="git checkout master"
alias git-main="git checkout main"
alias git-amend="git commit --amend --no-edit --all"

git-tag() {
    if [ "$1" ]
    then
        git tag $1 && git push origin $1
    else
        echo "Error: missing tag name"
    fi
}
