#!/bin/bash

set -xv

NAME="$DOCKER_USER/octodns"

# build docker container

VERSION=`python run.py`
for V in $VERSION
do
	docker build -t "$NAME:$V" --build-arg VERSION="$V" -f Dockerfile .
done


# Login to hub.docker.com
echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin

# Push docker container
CONTAINER_VERSION=`docker image ls 8ear/octodns --format "{{.Tag}}"`
for V in $CONTAINER_VERSION
do
    docker push "$NAME:$V"
done