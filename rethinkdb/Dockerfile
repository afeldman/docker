FROM alpine:edge

LABEL maintainer="anton.feldmann@gmail.com"

RUN echo http://mirror.yandex.ru/mirrors/alpine/edge/main > /etc/apk/repositories; \
    echo http://mirror.yandex.ru/mirrors/alpine/edge/community >> /etc/apk/repositories;\
    echo http://mirror.yandex.ru/mirrors/alpine/edge/testing >> /etc/apk/repositories


RUN apk add --update rethinkdb && rm -rf /var/cache/apk/*

WORKDIR /data

CMD ["rethinkdb", "--bind", "all"]

# process cluster webui
EXPOSE 28015 29015 8080
