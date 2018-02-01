FROM afeldman/ruby:latest

VOLUME /data/rubygems
EXPOSE 9292

ADD config/mirrorc ${GEM_HOME}/.mirrorrc
ADD config/config.ru ${GEM_HOME}/mirror/config.ru

RUN apk update --no-cache && \
    apk upgrade --no-cache && \
    apk add --no-cache nginx

RUN gem update --system &&\
    gem install geminabox\
                rubygems-mirror

RUN gem mirror

