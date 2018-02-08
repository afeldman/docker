FROM afeldman/hpc:openmpi

LABEL maintainer="anton Feldmann <anton.feldmann@gmail.com>"

USER root

RUN apk add --no-cache openssh --update

# # ------------------------------------------------------------
# # Set up SSH Server 
# # ------------------------------------------------------------

# Add host keys
RUN cd /etc/ssh/ && ssh-keygen -A -N ''

# Config SSH Daemon
RUN  sed -i "s/#PasswordAuthentication.*/PasswordAuthentication no/g" /etc/ssh/sshd_config \
  && sed -i "s/#PermitRootLogin.*/PermitRootLogin no/g" /etc/ssh/sshd_config \
  && sed -i "s/#AuthorizedKeysFile/AuthorizedKeysFile/g" /etc/ssh/sshd_config
 
# Unlock non-password USER to enable SSH login
RUN passwd -u ${USER}

# Set up user's public and private keys
ENV SSHDIR ${USER_HOME}/.ssh
RUN mkdir -p ${SSHDIR}

# Default ssh config file that skips (yes/no) question when first login to the host
RUN echo "StrictHostKeyChecking no" > ${SSHDIR}/config
# This file can be overwritten by the following onbuild step if ssh/ directory has config file

# Switch back to default user
USER ${USER}

# # ------------------------------------------------------------
# # ONBUILD (require ssh/ directory in the build context)
# # ------------------------------------------------------------
ONBUILD USER root

ONBUILD COPY ssh/ ${SSHDIR}/

ONBUILD RUN cat ${SSHDIR}/*.pub >> ${SSHDIR}/authorized_keys
ONBUILD RUN chmod -R 600 ${SSHDIR}/* \
         && chown -R ${USER}:${USER} ${SSHDIR}

# Switch back to default user when continue the build process
ONBUILD USER ${USER}