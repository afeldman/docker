FROM afeldman/alpine

ARGS ANSIBLE_VERSION 2.3.0.0
ARGS ANSIBLE_GATHERING smart
ARGS ANSIBLE_HOST_KEY_CHECKING false
ARGS ANSIBLE_RETRY_FILES_ENABLED false
ARGS ANSIBLE_ROLES_PATH /ansible/playbooks/roles
ARGS ANSIBLE_SSH_PIPELINING True
ARGS ANSIBLE_PATH /ansible/bin
ARGS PYTHONPATH /ansible/lib
ARGS ANSIBLE_LIBRARY /ansible/library
ARGS BUILD_PACKAGES \
  bash \	   
  curl \
  tar \
  openssh-client \
  sshpass \
  git \
  python \
  py-boto \
  py-dateutil \
  py-httplib2 \
  py-jinja2 \
  py-paramiko \
  py-pip \
  py-setuptools \
  py-yaml \
  ca-certificates
 
ENV BUILD_PACKAGES ${BUILD_PACKAGES}
 
RUN apk --update add --virtual --no-cache build-dependencies \
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