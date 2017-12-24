FROM alpine:edge

LABEL maintainer="anton.feldmann@gmail.com"

RUN echo http://mirror.yandex.ru/mirrors/alpine/edge/main > /etc/apk/repositories; \
    echo http://mirror.yandex.ru/mirrors/alpine/edge/community >> /etc/apk/repositories;\
    echo http://mirror.yandex.ru/mirrors/alpine/edge/testing >> /etc/apk/repositories

RUN apk upgrade --update-cache --available
RUN apk add --no-cache \
	musl-dev \
	bash \
	git \
	gcc \
	g++ \
	zlib-dev\
	python-dev\
    	py-pip\
    	py-setuptools\
    	py-matplotlib\
    	py-scipy\
    	py-numpy
  
RUN pip install --upgrade pip

#install autolab_core
RUN pip install --no-cach-dir autolab_core

RUN rm -rf /tmp/pip \
    && rm -rf /root/.cache

RUN apk --no-cache del\
    	zlib-dev \
	bash \
	git \
	gcc \
	g++ \
	zlib-dev

ENTRYPOINT ["python"]
CMD ["/bin/bash"]
