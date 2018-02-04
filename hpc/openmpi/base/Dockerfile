FROM afeldman/alpine:edge

LABEL maintainer="anton Feldmann <anton.feldmann@gmail.com>"

ARG REQUIRE="sudo build-base"

RUN apk update --no-cache \
    && apk upgrade --no-cache \
    && apk add openmpi openmpi-dev ${REQUIRE} --no-cache

WORKDIR /mpi

#### ADD DEFAULT USER ####
ARG USER=mpi
ENV USER ${USER}
RUN adduser -D ${USER} \
      && echo "${USER}   ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

ENV USER_HOME /home/${USER}
RUN chown -R ${USER}:${USER} ${USER_HOME}

#### CREATE WORKING DIRECTORY FOR USER ####
ARG WORKDIR=/project
ENV WORKDIR ${WORKDIR}
RUN mkdir ${WORKDIR}
RUN chown -R ${USER}:${USER} ${WORKDIR}

WORKDIR ${WORKDIR}
USER ${USER}

CMD ["/bin/ash"]