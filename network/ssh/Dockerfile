FROM afeldman/alpine:latest

RUN apk update --no-cache \
    && apk upgrade --no-cach \
    && apk add --no-cache \
    openssh\
    sudo \
    build-base

#### CLEAN UP ####
WORKDIR /
RUN rm -rf /tmp/*


#### ADD DEFAULT USER ####
ARG USER
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

USER root

# # ------------------------------------------------------------
# # Set up SSH Server 
# # ------------------------------------------------------------

# Set welcome message to display when user ssh login 
COPY welcome.txt /etc/motd

# Add host keys
RUN cd /etc/ssh/ && ssh-keygen -A -N ''
     
# Unlock non-password USER to enable SSH login
RUN passwd -u ${USER}

# Set up user's public and private keys
ENV SSHDIR ${USER_HOME}/.ssh
RUN mkdir -p ${SSHDIR}

# Default ssh config file that skips (yes/no) question when first login to the host
RUN echo "StrictHostKeyChecking no" > ${SSHDIR}/config
# This file can be overwritten by the following onbuild step if ssh/ directory has config file

# load config
ADD config.sh /config.sh
RUN chmod 751 /config.sh
RUN /config.sh

# Switch to default user
USER ${USER}

# # ###################################################
# # ONBUILD Method so make shure to use a ssh dir
# # containing all the ssh related files
# # ###################################################
ONBUILD USER root

ONBUILD COPY ssh/ ${SSHDIR}/

ONBUILD RUN cat ${SSHDIR}/*.pub >> ${SSHDIR}/authorized_keys
ONBUILD RUN chmod -R 600 ${SSHDIR}/* \
         && chown -R ${USER}:${USER} ${SSHDIR}

# Switch to default user
ONBUILD USER ${USER}
