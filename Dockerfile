FROM --platform=$BUILDPLATFORM teddysun/shadowsocks-libev:latest

ARG UPSTEAM_HASH=b923bb12dd7b5e214970c58c83b25ef7db2fb901d02da99b8bc534043f596616

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
