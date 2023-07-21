# Aliases for Docker at zsh

docker-bash() {
    docker exec -i -t $1 sh
}
