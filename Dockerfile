FROM --platform=$BUILDPLATFORM teddysun/shadowsocks-libev:latest

ARG UPSTEAM_HASH=aafa3f1e33038c136516e1cd98efdba771759f6a6f75a10137791d8c33a50092

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
