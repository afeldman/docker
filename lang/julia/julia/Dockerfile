FROM alpine:edge

LABEL maintainer "anton.feldmann@gmail.com"

RUN apk add --update --no-cache\
    git\
    make\
    tar\
    patch\
    perl \
    cmake\
    python\
    wget\
    g++\
    linux-headers\
    gfortran\
    m4 \
    xz\
    openssl
    
RUN apk add --update --no-cache\
    openblas-dev\
    llvm-dev\
    lapack-dev\
    libexecinfo-dev

ARG JULIA_VERSION="v0.6.0"

RUN git clone https://github.com/JuliaLang/julia.git /opt/julia --recursive \
    && cd /opt/julia \
    && git checkout ${JULIA_VERSION} \
    && USE_SYSTEM_LLVM=1 USE_SYSTEM_BLAS=1 make -j4 -k release \
    && make install \
    && make clean \
    && cd /opt \
    && rm -Rf /opt/julia

CMD ["julia"]