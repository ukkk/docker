# VERSION 0.1
FROM alpine:3.7
ARG VERSION=3.13
ARG FOLDER_NAME=fio-fio-"$VERSION"

# Install build deps + permanent dep: libaio
RUN apk --no-cache add \
        make \
        alpine-sdk \
        zlib-dev \
        libaio-dev \
        linux-headers \
        coreutils \
        libaio && \
    git clone https://github.com/axboe/fio && \
    cd fio && \
    git checkout fio-"$VERSION" && \
    ./configure && \
    make -j`nproc` && \
    make install && \
    cd .. && \
    rm -rf fio && \
    apk --no-cache del \
        make \
        alpine-sdk \
        zlib-dev \
        libaio-dev \
        linux-headers \
        coreutils
ENTRYPOINT ["fio"]
