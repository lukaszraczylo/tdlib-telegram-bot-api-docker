FROM alpine:latest as buildBase
RUN apk add --no-cache alpine-sdk linux-headers git zlib-dev openssl-dev gperf php cmake
ADD . /srv
WORKDIR /srv
RUN git submodule update --init --recursive && mkdir -p build && cd build && cmake -DCMAKE_INSTALL_PREFIX:PATH=../tdlib -DCMAKE_BUILD_TYPE=Release ..
RUN cd /srv/build && cmake --build . --target install

FROM alpine:latest
RUN apk add --no-cache zlib-dev openssl-dev libstdc++
COPY --from=buildBase /srv/build/telegram-bot-api /srv/telegram-bot-api
ENTRYPOINT ["/srv/telegram-bot-api"]