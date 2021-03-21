FROM --platform=$BUILDPLATFORM teddysun/shadowsocks-libev:latest

ARG UPSTEAM_HASH=8d7c74924250e47cf97e9b7ab9ef122f1ebc751e632bacc27e6cf8d7a2fe7965

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
