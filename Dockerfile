FROM alpine:3.9

RUN apk add --no-cache bash curl ca-certificates make jq
RUN curl -sSL https://github.com/previousnext/notify/releases/download/2.1.0/notify_linux_amd64 -o /usr/local/bin/notify && \
  chmod +rx /usr/local/bin/notify

WORKDIR /data
VOLUME /tmp
