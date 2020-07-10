# Aliases for Docker at Fish

function docker-bash
    command docker exec -i -t $argv[1] sh
end
