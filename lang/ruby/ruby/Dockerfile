FROM alpine:edge

RUN echo http://mirror.yandex.ru/mirrors/alpine/edge/main > /etc/apk/repositories; \
    echo http://mirror.yandex.ru/mirrors/alpine/edge/community >> /etc/apk/repositories;\
    echo http://mirror.yandex.ru/mirrors/alpine/edge/testing >> /etc/apk/repositories

RUN apk update && apk upgrade && apk --update add \
    ruby\
    ruby-irb\
    ruby-rake\
    ruby-io-console\
    ruby-bigdecimal\
    ruby-json\
    ruby-bundler \
    ruby-dev \
    libstdc++\
    tzdata\
    bash\
    ca-certificates \
    libressl-dev \
    libressl\
    build-base\
    &&  echo 'gem: --no-document' > /etc/gemrc

RUN bundle config build.nokogiri --use-system-libraries ;\
    bundle config git.allow_insecure true

RUN gem install foreman --no-rdoc --no-ri;\
    gem cleanup

RUN rm -rf /usr/lib/ruby/gems/*/cache/* ; \
    rm -rf /var/cache/apk/* /tmp

CMD ["irb"]
