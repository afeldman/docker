FROM ubuntu:latest

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y libc6-dev \
    libxml2-dev \
    freeglut3-dev \
    make \
    libglew-dev \
    gcc \
    git &&\
    apt-get clean

WORKDIR /copybirds

RUN git clone https://github.com/afeldman/copybirds.git /copybirds

RUN cd /copybirds && \
    make

ENV PATH=$PATH:/copybirds/bin/: