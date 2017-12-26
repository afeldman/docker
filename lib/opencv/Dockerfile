FROM alpine:edge

Label maintainer="anton.feldmann@gmail.com"

RUN echo \
  # replacing default repositories with edge ones
  && echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" > /etc/apk/repositories \
  && echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
  && echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories\
  && echo "http://nl.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories\
  && echo "@edge http://nl.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories\
  && echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
    
#3 upgrade System
RUN apk upgrade --update\
    && apk add --update --no-cache\
    opencv-libs\
    opencv\
    opencv-dev\
    clang\
    llvm

#4 defining compilers
ENV CC /usr/bin/clang
ENV CXX /usr/bin/clang++

