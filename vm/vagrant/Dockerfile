FROM afeldman/ubuntu:latest

LABEL maintainer "anton feldmann <anton.feldmann@gmail.com>"

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install wget ruby ruby-dev vagrant -y\
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*
