# Shadowsocks With DNS Unlocking

**Based on [teddysun/shadowsocks_install](https://github.com/teddysun/shadowsocks_install/tree/master)**

1. docker-compose.yaml

```yaml
version: '3'

services:
  ss:
    image: ghcr.io/apocalypsor/shadowsocks-dns-unlock:latest
    container_name: ss
    ports:
      - 9000:9000
      - 9000:9000/udp
    environment:
      - NETFLIX_DNS=
      - DISNEYPLUS_DNS=
      - PRIMEVIDEO_DNS=
      - YOUTUBE_DNS=
    volumes:
      - ./config:/etc/shadowsocks-libev
    restart: unless-stopped
```

2. config/config.json

```json
{
    "server":"0.0.0.0",
    "server_port":9000,
    "password":"password0",
    "timeout":300,
    "method":"chacha20-ietf-poly1305",
    "fast_open":true,
    "nameserver":"127.0.0.1",  //nameserver MUST be 127.0.0.1!
    "mode":"tcp_and_udp",
    "plugin":"obfs-server",
    "plugin_opts":"obfs=http"
}
```

> Referring to [teddysun/shadowsocks-libev](https://hub.docker.com/r/teddysun/shadowsocks-libev)