FROM ubuntu:16.04

LABEL maintainer "anton.feldmann@gmail.com"

ARG MATLAB_VERSION="R2017a"
ARG MCR_VERSION="v92"
ARG MCR_JAVA_VERSION="1.5.0"

ARG PREFIX="/opt"

RUN apt-get update && apt-get upgrade -y\
 && apt-get install -y -q\
    	unzip \
	xorg \
	wget \
	curl\
	sudo\
    && rm -rf /var/lib/apt/lists/*

WORKDIR ${PREFIX}

#download matlab mcr
RUN mkdir ${PREFIX}/installer \
    && wget http://www.mathworks.de/supportfiles/downloads/${MATLAB_VERSION}/deployment_files/${MATLAB_VERSION}/installers/glnxa64/MCR_${MATLAB_VERSION}_glnxa64_installer.zip \
    && unzip -q -d ${PREFIX}/installer/ MCR_${MATLAB_VERSION}_glnxa64_installer.zip \
    && rm MCR_${MATLAB_VERSION}_glnxa64_installer.zip\
    && ${PREFIX}/installer/install -destinationFolder ${PREFIX}/mcr -agreeToLicense yes -mode silent \
    && rm -Rf ${PREFIX}/installer

ENV MCR_ROOT ${PREFIX}/mcr
ENV MCR_ROOT_VER ${MCR_ROOT}/${MCR_VERSION}

ENV MCR_JAVA ${MCR_ROOT_VER}/sys/java/jre/glnxa64/jre${MCR_JAVA_VERSION}/lib/amd64
ENV LD_LIBRARY_PATH ${LD_LIBRARY_PATH}:${MCR_ROOT_VER}/runtime/glnxa64/:${MCR_ROOT_VER}/bin/glnxa64/:${MCR_ROOT_VER}/sys/os/glnxa64$:${MCR_JAVA}:${MCR_JAVA}/server:${MCR_JAVA}native_threads

ENV XAPPLRESDIR ${MCR_ROOT_VER}/X11/app-defaults
