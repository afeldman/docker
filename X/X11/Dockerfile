FROM alpine

ENV DISPLAY 0.0.0.0:0.0
ENV USER x
ENV GROUP x

RUN adduser -D ${user} \
 && addgroup developers \
 && addgroup $USER $GROUP \
 && chown -R $USER:$GROUP /home/$USER
 
RUN apk add --no-cache dbus libx11 ca-certificates openssl curl \
 && update-ca-certificates \
 && ttfs=$(apk search search --no-cache -q ttf- | grep -v '\-doc') \
 && apk add --no-cache $ttfs \
 && rm -rf /var/cache/apk/*

VOLUME ["/home"]
