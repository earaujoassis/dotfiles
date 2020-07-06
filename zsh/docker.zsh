# Aliases for Docker at ZSH

docker-bash() {
    docker exec -i -t $1 sh
}
