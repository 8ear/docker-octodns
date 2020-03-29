FROM python:alpine

ARG VERSION

RUN set -ex \
    ; apk add --no-cache g++ libffi-dev openssl-dev python3-dev

RUN set -ex \
    #; useradd -m -s /bin/sh abc \
    ; adduser -D -s /bin/sh abc \
    # Latest
    ; [ -z "${VERSION}" ] && pip install octodns dyn azure-mgmt-dns edgegrid-python google-cloud-dns ns1-python ovh boto3 transip \
    ; [ -z "${VERSION}" ] || pip install octodns==${VERSION} dyn azure-mgmt-dns edgegrid-python google-cloud-dns ns1-python ovh boto3 transip

WORKDIR /data
USER abc
ENTRYPOINT [ "/bin/sh" ]