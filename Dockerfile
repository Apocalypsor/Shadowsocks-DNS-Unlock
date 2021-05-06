FROM --platform=$BUILDPLATFORM teddysun/shadowsocks-libev:latest

ARG UPSTEAM_HASH=503988f69807b9b1e881ff65e28a26fe02c4c273b0c4d1e9435c1b9d426ca5e3

COPY config.example.json /etc/shadowsocks-libev/config.json
COPY entrypoint.sh /entrypoint.sh

RUN apk update \
    && apk --no-cache add dnsmasq curl \
    && echo -e 'server=1.1.1.1\nserver=8.8.8.8\nserver=208.67.222.222\nconf-dir=/etc/dnsmasq.d' > /etc/dnsmasq.conf \
    && chmod +x /entrypoint.sh

ENV NETFLIX_DNS="" 
ENV DISNEYPLUS_DNS=""
ENV PRIMEVIDEO_DNS=""
ENV YOUTUBE_DNS=""

ENV BILIBILI_DNS=""

ENTRYPOINT ["/entrypoint.sh"]
