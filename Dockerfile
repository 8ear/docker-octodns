FROM python:alpine

ARG VERSION=""

RUN set -ex \
    # Latest
    ; [ ${VERSION} == "" ] && pip install octodns \
    ; [ ${VERSION} != "" ] && pip install octodns==${VERSION}

WORKDIR /data
