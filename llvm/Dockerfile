FROM alpine:edge

LABEL maintainer "anton.feldmann@gmail.com"

RUN echo http://mirror.yandex.ru/mirrors/alpine/edge/main > /etc/apk/repositories; \
    echo http://mirror.yandex.ru/mirrors/alpine/edge/community >> /etc/apk/repositories;\
    echo http://mirror.yandex.ru/mirrors/alpine/edge/testing >> /etc/apk/repositories


RUN apk upgrade --update-cache --available
RUN apk add --no-cache \
	musl-dev \
	bash \
	clang \
	llvm \
	llvm-dev \
	clang-dev \
        libffi-dev \
    	curl \
	zlib-dev \
	bash \
	git \
	libstdc++\
	libc-dev\
	libffi-dev \
	libc++-dev\
	libc++
