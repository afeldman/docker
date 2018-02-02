#!/bin/bash

DOCKER_ID_USER="afeldman"

docker login

builds=( 14.04 16.04 latest )

for build in ${builds[@]} ; do
    echo "$build";

    docker build --build-arg BASE="ubuntu:${build}" -t "${DOCKER_ID_USER}/ubuntu:${build}" .

    docker push "${DOCKER_ID_USER}/ubuntu:${build}"
done

