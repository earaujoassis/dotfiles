# Aliases for Docker at zsh

docker-bash() {
    docker exec -i -t $1 sh
}

docker-stop-all() {
    if [ "$(docker ps -a -q)" ]; then
        docker stop $(docker ps -a -q)
        docker rm $(docker ps -a -q)
    else
        echo "> No running containers; skipping"
    fi
}

docker-prune() {
    docker system prune -a -f
    if [ "$(docker volume ls -q)" ]; then
        docker volume rm $(docker volume ls -q)
    else
        echo "> No available volumes; skipping"
    fi
}
