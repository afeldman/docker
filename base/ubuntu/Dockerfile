ARG BASE

FROM ${BASE:-ubuntu:latest}

label maintainer="anton.feldmann@gmail.com"
LABEL version="0.1"
LABEL description="This is my basic ubuntu image based. \
 This image sets the timezone to UTC and install the basic apt-util package."
 
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y apt-utils bash && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV TERM='/bin/bash'

RUN echo 'UTC' > /etc/timezone
