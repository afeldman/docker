FROM afeldman/alpine

#install requirements
RUN apk update --no-cache \
    && apk upgrade --no-cache \
    && apk --no-cache --update add \
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
    build-base

#setup ruby
RUN echo 'gem: --no-document' > /etc/gemrc

RUN bundle config build.nokogiri --use-system-libraries ;\
    bundle config git.allow_insecure true

RUN gem install foreman --no-rdoc --no-ri;\
    gem cleanup

RUN rm -rf /usr/lib/ruby/gems/*/cache/*

CMD ["irb"]
