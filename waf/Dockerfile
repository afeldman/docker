FROM python:3.5-alpine


RUN set -ex \
    && apk add --no-cache --virtual .build-deps \
            git

ENV PREFIX /opt/

ARG TOOLS="swig,compat15"

RUN git clone https://github.com/waf-project/waf.git ${PREFIX}\waf \
    && cd ${PREFIX}\waf \
    && ./waf-light --tools=${TOOLS} \
    && cp waf /usr/local/bin \
    && cd ${PREFIX} \
    && rm -Rf ${PREFIX}\waf ${PREFIX}/tools

ENV PATH=/usr/local/bin:${PATH}
