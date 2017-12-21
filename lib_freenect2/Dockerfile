FROM nvidia/cuda:8.0-runtime-ubuntu16.04

LABEL maintainer "anton.feldmann@gmail.com"

ENV DEBIAN_FRONTENT noninteractive
ARG TAG=false
ARG OPENCL="beignet"
ARG NVIDIA_VERSION="375"

RUN apt-get update && apt-get install -yq \
    apt-utils
    && apt-get install -yq \
       	       build-essential \
       	       cmake \
       	       git \
       	       libusb-1.0.0-dev \
       	       libturbojpeg \
       	       libjpeg-turbo8-dev \
       	       libglfw3-dev \
       	       libopenni2-dev \
       	       openni2-utils \
       	       pkg-config \
       	       udev

RUN if [ $OPENCL = "beignet" ] ; then apt-get install -yq beignet-dev ; fi \
    || if [ $OPENCL = "amd" ] ; then apt-get install -yq mesa-opencl-icd ; fi \
    || if [ $OPENCL = "nvidia" ] ; then apt-get install -yq nvidia-opencl-icd-${NVIDIA_VERSION} ; fi \
    || if [ $OPENCL = "intel" ] ; then echo "intel driver setup" ; fi \
    && apt-get install -yq \ 
       opencl-headers \
       clinfo

RUN git clone https://github.com/OpenKinect/libfreenect2.git \
    && cd libfreenect2 \
    && /bin/bash -c "if ! [ $TAG == false ]; then git checkout tags/$TAG; fi" \
    && mkdir build && cd build \
    && cmake .. -DBUILD_OPENNI2_DRIVER=ON -DCMAKE_INSTALL_PREFIX=/root/freenect2 \
    && make \
    && make install \
    && cp /libfreenect2/platform/linux/udev/90-kinect2.rules /etc/udev/rules.d/ \
    && ldconfig /root/freenect2 \
    && ln -s /libfreenect2/build/bin/Protonect /usr/local/bin/kinect_test \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV DEBIAN_FRONTEND teletype

CMD ["clinfo"]