#!/bin/ash

getRules(){
    echo "Updating rules for $1 ..."
    curl -sSL $1 > v2ray_rules
    cat v2ray_rules | grep "DOMAIN" | sed -e "s/^  - DOMAIN.*,/server=\//g" -e "s/$/\/$2/g" > /etc/dnsmasq.d/$3.conf
    rm -f v2ray_rules
}

if [ $NETFLIX_DNS ] ; then
    getRules "https://raw.githubusercontent.com/DivineEngine/Profiles/master/Clash/RuleSet/StreamingMedia/Video/Netflix.yaml" $NETFLIX_DNS "Netflix"
fi

if [ $DISNEYPLUS_DNS ] ; then
    getRules "https://raw.githubusercontent.com/DivineEngine/Profiles/master/Clash/RuleSet/StreamingMedia/Video/DisneyPlus.yaml" $DISNEYPLUS_DNS "DisneyPlus"
fi

if [ $PRIMEVIDEO_DNS ] ; then
    getRules "https://raw.githubusercontent.com/DivineEngine/Profiles/master/Clash/RuleSet/StreamingMedia/Video/Prime-Video.yaml" $PRIMEVIDEO_DNS "Prime-Video"
fi

if [ $YOUTUBE_DNS ] ; then
    getRules "https://raw.githubusercontent.com/DivineEngine/Profiles/master/Clash/RuleSet/StreamingMedia/Video/YouTube.yaml" $YOUTUBE_DNS "YouTube"
fi

if [ $BILIBILI_DNS ] ; then
    getRules "https://raw.githubusercontent.com/lhie1/Rules/master/Surge/Surge%203/Provider/Media/Bilibili.list" $BILIBILI_DNS "Bilibili"
fi

dnsmasq --all-servers && ss-server -c /etc/shadowsocks-libev/config.json
