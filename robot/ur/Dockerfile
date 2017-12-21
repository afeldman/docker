FROM ubuntu:14.04

LABEL maintainer="Anton Feldmann <anton.feldmann@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive

# setup locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8

# install system packages
RUN apt-getupgrade -y && apt-get update -y \
    && apt-get install -y -q --no-install-recommends apt-transport-https libxmlrpc-c++8 libxmlrpc-core-c3 libjava3d-java openjdk-7-jre openjdk-7-jre-headless openjdk-7-jre-lib tar wget bash-completion wget vim git tmux terminator xauth openssh-server runit sudo software-properties-common python-software-properties debconf-utils policykit-1  xterm libgl1-mesa-glx libgl1-mesa-dri mesa-vdpau-drivers xserver-xorg-video-ati mesa-utils module-init-tools


# setup ssh
RUN mkdir -p /var/run/sshd && echo "X11UseLocalhost no" >> /etc/ssh/sshd_config  \
    && dpkg --add-architecture i386 \
    && echo "JAVA_HOME=\"/usr/lib/jvm/java-7-openjdk-amd64/jre/bin/java\"" >> /etc/environment

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64/jre/bin/java

# set user ros and sudo
RUN adduser --gecos "URSim User" --home /home/ursim --disabled-password ursim \
    && usermod -a -G dialout ursim \
    && echo "ursim ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/99_aptget 

# install ursim
 
RUN chmod -R a+rx /opt/ursim && sync /
    && mkdir -p /opt/ursim/ && ch /opt/ursim \
    && wget -q -O ursim.tar.gz https://s3-eu-west-1.amazonaws.com/ur-support-site/32556/ursim-3.5.0.10584.tar.gz/
    && tar -xvzf ursim.tar.gz && mv ursim-3.5.0.10584 ursim_pkg && cd ursim_pkg \
    && sed -i '36,37c \\t echo \"just ignore xterm warning\" ' ./install.sh \
    && sed -i 's/pkexec bash -c/bash -c/g' ./install.sh \
    && sed -i 's/apt-get -y install/apt-get -y install -q --no-install-recommends/g' ./install.sh \
    && sed -i '64,$d' ./install.sh  \
    && echo "echo \" installation done! \""  >> ./install.sh \
    && ./install.sh \
    && cd .. && rm -f ./ursim.tar.gz \
    && chown -R ursim:ursim ursim_pkg \
    && chmod a+rx  ursim_pkg/URControl && rm -f /opt/ursim/install_ursim.sh && chmod -R a+rwx /opt/ursim
RUN

RUN apt-get autoclean \
    && apt-get clean all \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/* /var/tmp/*

ENV PATH /opt/ursim/ursim_pkg:$PATH
ENV URSIM_ROOT /opt/ursim/ursim_pkg

RUN mkdir -p /etc/container_environment \
    && echo "JAVA_HOME=\"/usr/lib/jvm/java-7-openjdk-amd64/jre/bin/java\"" >> /etc/container_environment/JAVA_HOME \
    && echo "PATH=\"/opt/ursim/ursimpkg:$PATH\"" >> /etc/container_environment/PATH \
    && echo "URSIM_ROOT=\"/opt/ursim/ursim_pkg\"" >>  /etc/container_environment/URSIM_ROOT

WORKDIR /opt/ursim/ursim_pkg

CMD ["bash"]