#!/bin/bash

DOCKER_ID_USER="afeldman"

docker login

builds=( stretch jessie latest )

for build in ${builds[@]} ; do
    echo "$build";

    docker build --build-arg BASE="debian:${build}" -t "${DOCKER_ID_USER}/debian:${build}" .

    docker push "${DOCKER_ID_USER}/debian:${build}"
done

