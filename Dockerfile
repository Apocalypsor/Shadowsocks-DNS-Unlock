FROM --platform=linux/amd64 teddysun/shadowsocks-libev:latest

ARG UPSTEAM_HASH=52730227d7e4a58d157115a266871e7ab53addbd32c715e78227e6163a36e71c

COPY config.example.json /etc/shadowsocks-libev/config.json
COPY entrypoint.sh /entrypoint.sh

RUN apk update \
    && apk --no-cache add dnsmasq curl \
    && echo -e 'server=1.1.1.1\nserver=8.8.8.8\nconf-dir=/etc/dnsmasq.d' > /etc/dnsmasq.conf \
    && chmod +x /entrypoint.sh

ENV NETFLIX_DNS="" 
ENV DISNEYPLUS_DNS=""
ENV PRIMEVIDEO_DNS=""
ENV YOUTUBE_DNS=""

ENTRYPOINT ["/entrypoint.sh"]