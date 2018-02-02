FROM afeldman/ruby:latest

ADD config/mirrorc /root/.gem/.mirrorrc
ADD config/config.ru /root/.gem/mirror/config.ru

RUN apk update --no-cache && \
    apk upgrade --no-cache && \
    apk add --no-cache nginx

RUN gem update --system &&\
    gem install geminabox\
                rubygems-mirror

VOLUME /data/rubygems
EXPOSE 9292

CMD ["gem","mirror"]

