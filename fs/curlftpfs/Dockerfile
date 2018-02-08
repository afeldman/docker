FROM afeldman/ubuntu

RUN apt-get update \
    && apt-get upgrade -y

RUN apt-get install -y \
    curlftpfs

WORKDIR /ftp
VOLUME /ftp

ENV FTP='localhost'
ENV USER=''
ENV PASSWORD=''
ENV PORT=21

EXPOSE ${PORT}

