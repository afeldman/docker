FROM afeldman/alpine:latest

RUN apk add -U -v --no-cache \
    openldap \
    openldap-clients \
    openldap-back-hdb \
    openldap-back-bdb \
    ldapvi\
    openldap-back-mdb

EXPOSE 389 636

CMD ["slapd","-d 256","-u ldap","-g ldap","-F /etc/openldap/slapd.d"]
