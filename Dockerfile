FROM --platform=linux/amd64 teddysun/shadowsocks-libev:latest

COPY entrypoint.sh /entrypoint.sh

RUN apk update \
    && apk --no-cache add dnsmasq curl \
    && sed -i "1i\nameserver 127.0.0.1" /etc/resolv.conf \
    && echo "server=1.1.1.1\nserver=8.8.8.8" > /etc/dnsmasq.conf

ENV NETFLIX_DNS="" 
ENV DISNEYPLUS_DNS=""
ENV PRIMEVIDEO_DNS=""
ENV YOUTUBE_DNS=""

ENTRYPOINT ["/entrypoint.sh"]