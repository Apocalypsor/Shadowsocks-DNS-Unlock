FROM --platform=linux/amd64 teddysun/shadowsocks-libev:latest

COPY config.example.json /etc/shadowsocks-libev/config.json
COPY entrypoint.sh /entrypoint.sh

RUN apk update \
    && apk --no-cache add dnsmasq curl \
    && echo "server=1.1.1.1\nserver=8.8.8.8" > /etc/dnsmasq.conf

ENV NETFLIX_DNS="" 
ENV DISNEYPLUS_DNS=""
ENV PRIMEVIDEO_DNS=""
ENV YOUTUBE_DNS=""

ENTRYPOINT ["/entrypoint.sh"]