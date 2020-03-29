FROM python:alpine

ARG VERSION

RUN set -ex \
    #; useradd -m -s /bin/sh abc \
    ; adduser -D -s /bin/sh abc \
    # Latest
    ; [ -z "${VERSION}" ] && pip install octodns \
    ; [ -z "${VERSION}" ] || pip install octodns==${VERSION}

WORKDIR /data
USER abc
ENTRYPOINT [ "/bin/sh" ]