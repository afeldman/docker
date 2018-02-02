FROM afeldman/alpine

LABEL maintainer="anton feldmann <anton.feldmann@gmail.com>"

RUN apk update --no-cache update \
    && apk --no-cache upgrade \
    apk add --no-cache \
    cland \
    g++ \
    distcc\
    bash

EXPOSE 3632

ADD entrypoint.sh /usr/entrypoint.sh

ENTRYPOINT ["/usr/entrypoint.sh"]