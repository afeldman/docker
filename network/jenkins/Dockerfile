FROM jenkins/jenkins:lts

LABEL MAINTAINER "anton feldmann"

USER root

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y sudo libltdl-dev \
    && rm -rf /var/lib/apt/lists/*

RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

ADD setup-docker-and-start-jenkins.sh /set_user_id.sh

RUN chmod +x /set_user_id.sh

CMD ["/set_user_id.sh"]