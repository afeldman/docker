FROM afeldman/alpine:latest

LABEL MAINTAINER anton Feldmann <anton.feldmann@gmail.com>

RUN apk update /
    && apk add openmpi openmpi-dev /
    && rm -fr /var/cache/apk/*

RUN mpirun --help > /dev/null
