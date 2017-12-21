FROM afeldman/ruby:latest

RUN echo http://mirror.yandex.ru/mirrors/alpine/edge/main > /etc/apk/repositories; \
    echo http://mirror.yandex.ru/mirrors/alpine/edge/community >> /etc/apk/repositories;\
    echo http://mirror.yandex.ru/mirrors/alpine/edge/testing >> /etc/apk/repositories

RUN apk update && \
    apk upgrade && \
    apk add nginx

RUN gem update --system &&\
    gem install geminabox\
                rubygems-mirror

VOLUME /data/rubygems
EXPOSE 9292

COPY config/.mirrorrc /root/.gem/.mirrorrc
COPY config/config.ru /root/.gem/mirror/config.ru

RUN gem mirror

WORKDIR /root/.gem/mirror

CMD ["rackup"]
