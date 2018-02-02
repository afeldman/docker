FROM afeldman/alpine:latest

RUN apk update --no-cache \
    && apk upgrade --no-cach \
    && apk add --no-cache \
    krb5-libs \
    krb5 \
    krb5-server \
    krb5-server-ldap \
    krb5-pkinit\
    supervisor

ENV KRB5_REALM 'EXAMPLE.COM'
ENV KRB5_KDC 'localhost'
ENV KRB5_PASS 'passwd'

VOLUME /var/lib/krb5kdc

ADD ./krb/supervisord.conf /etc/supervisord.conf
ADD ./krb/krb5_pass /etc/krb5_pass
ADD ./krb/krb5.conf /etc/krb5.conf
ADD ./krb/kdc.conf /var/lib/krb5kdc/kdc.conf

# Creating Default Policy - Admin Access to */admin
RUN echo "*/admin@${KRB5_REALM} *" > /var/lib/krb5kdc/kadm5.acl \
    && echo "*/service@${KRB5_REALM} aci" >> /var/lib/krb5kdc/kadm5.acl

# create database
RUN kdb5_util create -r ${KRB5_REALM} < /etc/krb5_pass \
    && rm /etc/krb5_pass

# create admin acount
RUN kadmin.local -q "addprinc -pw ${KRB5_PASS} admin/admin@${KRB5_REALM}"

RUN /usr/bin/supervisord -c /etc/supervisord.conf

EXPOSE 749 464 88


