ARG BASE

FROM ${BASE:-alpine:3.6}

LABEL maintainer="anton.feldmann@gmail.com"
LABEL version="0.1"
LABEL description="This is my basic alpine image based on\
 alpine:latest. This image includes just an ash shell."

ARG VERSION=3.6

RUN echo 'UTC' > /etc/timezone

WORKDIR ~
COPY build.sh .
RUN chmod 777 ./build.sh && ./build.sh ${VERSION} 
RUN rm build.sh

RUN apk update && \
    apk upgrade
