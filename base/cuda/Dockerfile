FROM afeldman/alpine:latest

LABEL maintainer="anton.feldmann@gmail.com"

USER root

RUN apk update && apk add --update wget alpine-sdk perl \
 && rm -rf /var/cache/apk/*

COPY build_nvidia.sh /usr/bin

RUN ./build_nvidia.sh

# Add to path
ENV PATH=/usr/local/cuda-7.5/bin:$PATH
ENV LD_LIBRARY_PATH=/usr/local/cuda-7.5/lib64:$LD_LIBRARY_PATH
ENV LD_LIBRARY_PATH=/usr/local/cuda-7.5/lib:$LD_LIBRARY_PATH
ENV LD_LIBRARY_PATH=/usr/local/cuda-7.5/lib64/stubs:$LD_LIBRARY_PATH
