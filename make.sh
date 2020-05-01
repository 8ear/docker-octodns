#!/bin/bash

set -x

NAME=${NAME:-"test"}

# build docker container

VERSION=`python run.py`
for V in $VERSION
do
	docker build -t "$NAME:$V" --build-arg VERSION="$V" -f Dockerfile .
    docker build -t "$NAME:${V}-full" --build-arg VERSION="$V" -f full/Dockerfile .
done

# latest
docker build -t "$NAME:latest" -t "$NAME:stable" -f Dockerfile .
docker build -t "$NAME:latest-full" -t "$NAME:stable-full" -f full/Dockerfile full/


# Default value if var does not exist.
DOCKER_USER=${DOCKER_USER:-"abc"}
# Find all builded container
CONTAINER_VERSION="$(docker image ls "$DOCKER_USER/$NAME" --format "{{.Tag}}")"


# Push hub.docker.com
if [[ ! -z "$DOCKER_PASS" ]] && [[ ! -z "$DOCKER_USER" ]]
then
    echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
    for V in $CONTAINER_VERSION
    do
        docker push "$DOCKER_USER/$NAME:$V"
    done
fi


# Push github repo
if [[ ! -z "$GITHUB_PASS" ]] && [[ ! -z "$GITHUB_USER" ]]
then
    echo "$GITHUB_PASS" | docker login docker.pkg.github.com -u "$GITHUB_USER" --password-stdin
    for V in $CONTAINER_VERSION
    do
        docker tag "$DOCKER_USER/$NAME:$V" "docker.pkg.github.com/${REPO}/$NAME:$V"
        docker push "docker.pkg.github.com/${REPO}/$NAME:$V"
    done
fi
