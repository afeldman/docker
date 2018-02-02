ARG BASE
FROM ${BASE:-debian:latest}

label maintainer="anton.feldmann@gmail.com"
LABEL version="0.1"
LABEL description="This is my basic debian image based. \
 This image sets the timezone to UTC and install the basic apt-util package."

RUN echo 'UTC' > /etc/timezone

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y apt-utils && \
    apt-get clean
