#!/bin/bash

command=$1

if [ -z "$command" ]; then
    command="start"
fi

projectRoot="$(dirname "$(readlink -f "$0")")/.."

function mongo {
    docker compose --file "$projectRoot/deployments/docker-compose/compose.yaml" "$@"
}

export AMBULANCE_API_ENVIRONMENT="Development"
export AMBULANCE_API_PORT="8080"
export AMBULANCE_API_MONGODB_USERNAME="root"
export AMBULANCE_API_MONGODB_PASSWORD="neUhaDnes"

case $command in
    "start")
        mongo up --detach
        go run "$projectRoot/cmd/ambulance-api-service"
        mongo down
        ;;
    "test")
        go test -v ./...
        ;;
    "openapi")
        docker run --rm -ti -v "$projectRoot:/local" openapitools/openapi-generator-cli generate -c /local/scripts/generator-cfg.yaml
        ;;
    "mongo")
        mmongo up
        ;;
    "docker")
        docker build -t vecnehladny/ambulance-wl-webapi:local-build -f ${ProjectRoot}/build/docker/Dockerfile .
        ;;
    *)
        echo "Unknown command: $command"
        exit 1
        ;;
esac
