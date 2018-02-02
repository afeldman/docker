#!/bin/bash

if [[ $# -eq 1 ]] ; then
    DOCKER_ID_USER=$1

    docker login
fi

builds=( stretch jessie latest )

for build in ${builds[@]} ; do
    echo "$build";

    docker build --build-arg BASE="debian:${build}" -t "${DOCKER_ID_USER}/debian:${build}" .

    docker push "${DOCKER_ID_USER}/debian:${build}"
done

