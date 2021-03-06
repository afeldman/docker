FROM nvidia/cuda:8.0-cudnn6-devel-ubuntu16.04

LABEL maintainer="anton.feldmann@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update\
    && apt-get install -y apt-utils\
    && apt-get upgrade --no-install-recommends -y
    
RUN apt-get install -y --no-install-recommends apt-utils
RUN apt-get install -y\
    git\
    build-essential\
    libopencv-dev

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
    python-scikits-learn

#pip and pip package update
RUN pip install --upgrade pip

RUN pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U

#Pip install deps:
RUN pip install  --no-cache-dir\
    scikit-image\
    pillow\
    numpy\
    scipy\
    matplotlib\
    opencv-python\
    scikit-image\
    scikit-learn\
    pillow\
    tensorflow-gpu

WORKDIR berkeleyautomation/

#Install AUTOLAB modules
RUN git clone https://github.com/BerkeleyAutomation/autolab_core.git \
    && cd autolab_core\
    && pip install --no-cache-dir -r requirements.txt \
    && python setup.py develop\
    && cd ..
    
RUN git clone https://github.com/BerkeleyAutomation/perception.git\ 
    && cd perception\
    && pip install --no-cache-dir -r requirements.txt \
    && python setup.py develop\
    && cd ..

RUN git clone https://github.com/BerkeleyAutomation/gqcnn.git\
    && cd gqcnn\
    && mv setup.py set_.py\
    && sed -e 's/tensorflow>=/tensorflow-gpu>=/g' set_.py > setup.py \
    && cat setup.py\
    && python setup.py install\
    && cd ..

#clean image
RUN apt-get remove -y\
    git\
    apt-utils\
    && apt-get autoremove -y\
    && rm -rf /var/lib/apt/lists/*rm -rf /tmp/pip\
    && rm -rf /root/.cache

CMD ["/bin/bash"]

ENV DEBIAN_FRONTEND teletype