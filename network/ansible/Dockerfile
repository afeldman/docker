FROM afeldman/alpine

ARG ANSIBLE_VERSION
ARG ANSIBLE_GATHERING
ARG ANSIBLE_HOST_KEY_CHECKING
ARG ANSIBLE_RETRY_FILES_ENABLED
ARG ANSIBLE_ROLES_PATH
ARG ANSIBLE_SSH_PIPELINING
ARG ANSIBLE_PATH
ARG PYTHONPATH
ARG ANSIBLE_LIBRARY
ARG BUILD_PACKAGES
 
ENV BUILD_PACKAGES ${BUILD_PACKAGES}
 
RUN apk --update add --virtual build-dependencies \
  gcc \
  musl-dev \
  libffi-dev \
  openssl-dev \
  python-dev
 
RUN set -x && \
  apk update && apk upgrade && \
  apk add --no-cache ${BUILD_PACKAGES} && \
  pip install --upgrade pip && \
  pip install python-keyczar docker-py && \
  apk del build-dependencies
 
RUN mkdir -p /etc/ansible/ /ansible
 
RUN echo "[local]" >> /etc/ansible/hosts && \
  echo "localhost" >> /etc/ansible/hosts
 
RUN curl -fsSL https://releases.ansible.com/ansible/ansible-${ANSIBLE_VERSION}.tar.gz -o ansible.tar.gz && \
  tar -xzf ansible.tar.gz -C /ansible --strip-components 1 && \
  rm -fr ansible.tar.gz /ansible/docs /ansible/examples /ansible/packaging

ENV ANSIBLE_VERSION ${ANSIBLE_VERSION}
ENV ANSIBLE_GATHERING ${ANSIBLE_GATHERING}
ENV ANSIBLE_HOST_KEY_CHECKING ${ANSIBLE_HOST_KEY_CHECKING}
ENV ANSIBLE_RETRY_FILES_ENABLED ${ANSIBLE_RETRY_FILES_ENABLED}
ENV ANSIBLE_ROLES_PATH ${ANSIBLE_ROLES_PATH}
ENV ANSIBLE_SSH_PIPELINING ${ANSIBLE_SSH_PIPELINING}
ENV ANSIBLE_LIBRARY ${ANSIBLE_LIBRARY}
ENV PYTHONPATH ${PYTHONPATH}
ENV PATH ${ANSIBLE_PATH}:${PATH} 

WORKDIR /ansible/playbooks
 
ENTRYPOINT ["ansible-playbook"]