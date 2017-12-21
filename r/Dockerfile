FROM alpine:3.6

LABEL maintainer "anton.feldmann@gmail.com

RUN apk update \
  && apk add R\
      R-dev \
      R-doc \
      R-mathlib \
  && rm -fr /var/cache/apk/*