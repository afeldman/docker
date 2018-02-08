FROM afeldman/alpine:edge

RUN apk --update --no-cache add \
    avahi \
    avahi-tools 

RUN sed -i 's/#enable-dbus=yes/enable-dbus=no/g' /etc/avahi/avahi-daemon.conf

VOLUME /etc/avahi/services
EXPOSE 5353/udp

ENTRYPOINT ["avahi-daemon"]