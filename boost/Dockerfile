FROM alpine:3.4

#2 Add Edge and bleeding repos
RUN echo -e '@edgunity http://nl.alpinelinux.org/alpine/edge/community\n@edge http://nl.alpinelinux.org/alpine/edge/main\n@testing http://nl.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories

#3 upgrade System
RUN apk update && apk upgrade

RUN apk add --update\
    boost-system\
    boost-dev\
    python3 \
    python3-dev \
    clang-dev \
    clang

#5 defining compilers
ENV CC /usr/bin/clang
ENV CXX /usr/bin/clang++

#7 Clean APK cache
RUN rm -rf /var/cache/apk/*