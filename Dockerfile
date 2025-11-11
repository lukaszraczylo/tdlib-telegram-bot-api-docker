FROM alpine:latest as buildBase
RUN apk add --no-cache alpine-sdk linux-headers git zlib-dev openssl-dev gperf php cmake ccache
ADD . /srv
WORKDIR /srv
RUN --mount=type=cache,target=/root/.cache/git \
    git submodule update --init --recursive
RUN mkdir -p build && cd build && \
    cmake -DCMAKE_INSTALL_PREFIX:PATH=../tdlib -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_COMPILER_LAUNCHER=ccache ..
RUN --mount=type=cache,target=/root/.ccache \
    cd /srv/build && \
    export CCACHE_DIR=/root/.ccache && \
    cmake --build . --target install -j$(nproc)
# RUN upx --best /srv/build/telegram-bot-api

FROM alpine:latest
RUN apk add --no-cache zlib-dev openssl-dev libstdc++
COPY --from=buildBase /srv/build/telegram-bot-api /srv/telegram-bot-api
VOLUME /data
ENTRYPOINT ["/srv/telegram-bot-api", "--dir=/data"]
