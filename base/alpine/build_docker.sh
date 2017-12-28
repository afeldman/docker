#!/bin/bash

DOCKER_ID_USER="afeldman"

declare -A builds=( ["latest"]="v3.7" ["edge"]="edge" ["3.7"]="v3.7" ["3.6"]="v3.6" )

docker login

for build in "${!builds[@]}"; do
    echo "$build - ${builds[$build]}";

    docker build --build-arg BASE="alpine:${build}" --build-arg VERSION="${builds[$build]}" -t "${DOCKER_ID_USER}/alpine:${build}" .

    docker push "${DOCKER_ID_USER}/alpine:${build}"
done
