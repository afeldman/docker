FROM afeldman/alpine:latest

RUN apk update && \
    apk upgrade && \
    apk add --no-cache build-base tcl tcl-dev tk tclx tcl-tls expect wget

RUN cd /tmp && \
    wget https://github.com/tcltk/tcllib/archive/tcllib_1_18.tar.gz && \
    tar -zx -C /tmp -f /tmp/tcllib_1_18.tar.gz && \
    tclsh /tmp/tcllib-tcllib_1_18/installer.tcl -no-html -no-nroff -no-examples -no-gui -no-apps -no-wait -pkg-path /usr/lib/tcllib1.18 && \
    rm -rf /tmp/tcllib*

RUN cd /tmp && \
    wget http://tdom.org/downloads/tdom-0.9.0-src.tgz && \
    tar -zx -C  /tmp -f /tmp/tdom-0.9.0-src.tgz && \
    cd /tmp/tdom-0.9.0/unix && \
    ../configure && \
    make && \
    make install && \
    cd / && \
    rm -rf /tmp/tdom-0.9.0*

VOLUME /opt/tcl
VOLUME /opt/data

ENV TCLLIBPATH /opt/tcl /opt/tcl/lib

ENTRYPOINT ["tclsh8.6"]
