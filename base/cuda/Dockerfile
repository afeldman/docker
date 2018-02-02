FROM afeldman/alpine:latest

LABEL maintainer="anton.feldmann@gmail.com"
LABEL version="0.1"
LABEL description="This is my basic cuda image based on alpine."
LABEL com.nvidia.volumes.needed="nvidia_driver"


RUN apk update \
 && apk add --update --no-cache wget alpine-sdk perl

WORKDIR /cuda

ARG CUDA_PATH="http://developer.download.nvidia.com/compute/cuda/7.5/Prod/local_installers/cuda_7.5.18_linux.run"
ARG CUDA_VERSION="cuda-7.5"

RUN wget ${CUDA_PATH}

COPY build_nvidia.sh ./build_nvidia.sh 

RUN chmod 777 ./build_nvidia.sh ;\
    ./build_nvidia.sh ;\
    rm ./build_nvidia.sh

RUN ls -la

# Add to path
ENV PATH=/usr/local/${CUDA_VERSION}/bin:$PATH
ENV LD_LIBRARY_PATH=/usr/local/${CUDA_VERSION}/lib64:$LD_LIBRARY_PATH
ENV LD_LIBRARY_PATH=/usr/local/${CUDA_VERSION}/lib:$LD_LIBRARY_PATH
ENV LD_LIBRARY_PATH=/usr/local/${CUDA_VERSION}/lib64/stubs:$LD_LIBRARY_PATH

CMD ['/bin/bash']
