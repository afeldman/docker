FROM afeldman/ruby:latest

RUN apk update --no-cache && \
    apk upgrade --no-cache && \
    apk add --no-cache nginx

RUN gem update --system &&\
    gem install geminabox\
                rubygems-mirror

VOLUME /data/rubygems
EXPOSE 9292

COPY config/.mirrorrc /root/.gem/.mirrorrc
COPY config/config.ru /root/.gem/mirror/config.ru

RUN gem mirror

