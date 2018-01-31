FROM alpine:latest

LABEL maintainer='anton feldmann <anton.feldmann@gmail.com>'

RUN apk update --no-cache \
    && apk upgrade --no-cache \
    && apk add --no-cache util-linux\
    inotify-tools

ADD start.sh /usr/bin/start.sh
RUN chmod o+x /usr/bin/start.sh

CMD ["start.sh"]
