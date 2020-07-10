# Aliases for Git at FISH

alias git-push="git push -u origin HEAD"
alias git-pull="git fetch && git pull origin"
alias git-master="git checkout master"

function git-tag
    if [ "$argv[1]" ]
        command git tag $1 && git push origin $1
    else
        command echo "Error: missing tag name"
    end
end
