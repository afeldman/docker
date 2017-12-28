FROM tensorflow/tensorflow:latest-gpu

LABEL maintainer="anton.feldmann@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update\
    && apt-get upgrade --no-install-recommends -y\
    && apt-get install -y apt-utils

RUN set -x

RUN apt-get install -y\
    git\
    build-essential\
    libopencv-dev\
    cmake\
    libvtk5-dev\
    meshlab\
    libhdf5-dev\
    libosmesa6-dev\
    libboost-all-dev\
    bash\
    catkin 

RUN apt-get install -y\
    python-numpy\
    python-scipy\
    python-matplotlib\
    python-pip\
    python-setuptools\
    python-opencv\
    python-dev\
    python-virtualenv\
    python-pil\
    python-yaml\
    ipython\
    python-scikits-learn\
    python-vtk\
    python-sip\
    python-qt4

#pip and pip package update
RUN pip install --upgrade pip

RUN pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U

#Pip install deps:
RUN pip install --no-cache-dir\
    scikit-image\
    pillow\
    numpy\
    scipy\
    matplotlib\
    opencv-python\
    scikit-image\
    scikit-learn\
    pyassimp \
    h5py \
    mayavi \
    matplotlib \
    catkin_pkg \
    multiprocess \
    dill \
    cvxopt \
    ipython \
    pyhull \
    setproctitle \
    trimesh\
    catkin_tools

# DEXNET setup
ENV BASE_DIR /berkeleyautomation

WORKDIR ${BASE_DIR}

ENV TENSORFLOW_LIB tensorflow-gpu 
ENV VERSION gpu  # cpu or gpu
ENV MODULE_DIR ${BASE_DIR}/deps

RUN git clone https://github.com/jeffmahler/SDFGen.git ${MODULE_DIR}/SDFGen \
    && cd ${MODULE_DIR}/SDFGen \
    && mkdir build \
    && cd build \
    && cmake .. \
    && make \
    && cd ..\
    && cp bin/SDFGen /usr/bin

RUN git clone https://github.com/jeffmahler/Boost.NumPy.git ${MODULE_DIR}/Boost.NumPy \
    && cd ${MODULE_DIR}/Boost.NumPy\
    && git submodule update --init \
    && mkdir build \
    && cd build \
    && cmake .. \
    && make \
    && make install \
    && cd ..

RUN git clone https://github.com/BerkeleyAutomation/meshpy.git ${MODULE_DIR}/meshpy \
    && cd ${MODULE_DIR}/meshpy \
    && python setup.py develop

RUN git clone https://github.com/BerkeleyAutomation/autolab_core.git ${MODULE_DIR}/autolab_core \
    && cd ${MODULE_DIR}/autolab_core\
    && python setup.py develop

RUN git clone https://github.com/BerkeleyAutomation/perception.git ${MODULE_DIR}/perception \
    && cd ${MODULE_DIR}/perception\
    && python setup.py develop
    
RUN git clone https://github.com/BerkeleyAutomation/gqcnn.git ${MODULE_DIR}/qpcnn \
    && cd ${MODULE_DIR}/qpcnn\
    && python setup.py develop

RUN git clone https://github.com/BerkeleyAutomation/visualization.git ${MODULE_DIR}/visualization \
     && cd ${MODULE_DIR}/visualization\	
     && python setup.py develop

ARG MODE="python"

RUN git clone https://github.com/BerkeleyAutomation/dex-net.git ${BASE_DIR}/dex-net\
    && cd ${BASE_DIR}/dex-net \
    && if [ ${MODE} = "ros" ] ; then /bin/bash -c "source devel/setup.bash; catkin_make; cd src/dex-net"; else python setup.py develop; fi

#clean image
RUN apt-get remove -y\
    git\
    apt-utils\
    && apt-get autoremove -y\
    && rm -rf /var/lib/apt/lists/*rm -rf /tmp/pip\
    && rm -rf /root/.cache

ENV DEBIAN_FRONTEND teletype

# TensorBoard
EXPOSE 6006

CMD ["/bin/bash"]
