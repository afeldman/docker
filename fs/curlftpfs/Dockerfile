FROM afeldman/ubuntu

RUN apt-get update \
    && apt-get upgrade -y

RUN apt-get install -y \
    curlftpfs

WORKDIR /ftp

VOLUME /ftp

EXPOSE 21
