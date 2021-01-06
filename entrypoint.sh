getRules(){
    curl -sSL https://raw.githubusercontent.com/DivineEngine/Profiles/master/Clash/RuleSet/StreamingMedia/Video/$1.yaml > v2ray_rules
    cat v2ray_rules | grep "DOMAIN" | sed -e "s/^  - DOMAIN.*,/server=\//g" -e "s/$/\/$2/g" >> /etc/dnsmasq.conf
    rm -f v2ray_rules
}

if [ $NETFLIX_DNS ] ; then
    getRules Netflix $NETFLIX_DNS
fi

if [ $DISNEYPLUS_DNS ] ; then
    getRules DisneyPlus $DISNEYPLUS_DNS
fi

if [ $PRIMEVIDEO_DNS ] ; then
    getRules Prime-Video $PRIMEVIDEO_DNS
fi

if [ $YOUTUBE_DNS ] ; then
    getRules YouTube $YOUTUBE_DNS
fi

ss-server -c /etc/shadowsocks-libev/config.json