FROM tensorflow/tensorflow:latest-gpu

LABEL maintainer="anton.feldmann@gmail.com"

# Install Python and git.
RUN apt-get update && apt-get upgrade --no-install-recommends -y
RUN apt-get install -y --no-install-recommends apt-utils
RUN apt-get install -y\
    git\
    build-essential\
    python-dev\
    python-pip\
    python-setuptools\
    cmake\
    pkg-config\
    libusb-1.0-0-dev\
    libturbojpeg\
    libjpeg-turbo8-dev\
    libglfw3-dev\
    libopenni2-dev\
    clang\
    && apt-get clean

#install freenect2
WORKDIR /opt

RUN git clone https://github.com/OpenKinect/libfreenect2.git\
    && cd libfreenect2 \
    && mkdir build\
    && cd build\
    && cmake ..\
       -DCMAKE_INSTALL_PREFIX=/usr/local/ \
       -DENABLE_CUDA=OFF\
       -DBUILD_EXAMPLES=OFF\
       -DBUILD_SHARED_LIBS=OFF\
    && make \
    && make install\
    && cd ../.. \
    && rm -Rf libfreenect2

RUN echo "copy the 90-kinect2.rules in to /etc/udev/rules.d/"
#    && cp ../platform/linux/udev/90-kinect2.rules /etc/udev/rules.d/

RUN pip install --upgrade pip\
    && pip install numpy cython\
    && pip install git+https://github.com/r9y9/pylibfreenect2

#build autolab_core
#install autolab_core
RUN git clone https://github.com/BerkeleyAutomation/autolab_core.git \
    && cd autolab_core\
    && pip install --no-cache-dir -r requirements.txt \
    && cd ../ \
    && rm -Rf autolab_core

#install perception
RUN git clone https://github.com/BerkeleyAutomation/perception.git \
    && cd perception \
    && pip install --no-cache-dir -r requirements.txt \
    && cd ../ \
    && rm -Rf perception

RUN apt-get autoremove -y && rm -rf /var/lib/apt/lists/*

CMD ["/bin/python"]