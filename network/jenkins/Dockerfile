FROM jenkins/jenkins:lts

LABEL MAINTAINER "anton feldmann"

USER root

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y sudo libltdl-dev \
    && rm -rf /var/lib/apt/lists/*

# RUN echo "jenkins all=nopasswd: all" >> /etc/sudoers

USER jenkins

