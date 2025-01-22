#!/bin/bash



#修改默认IP
sed -i 's/192.168.1.1/192.168.5.1/g' package/base-files/files/bin/config_generate

#web登陆密码从空密码修改为 password
#sed -i "s/root:::0:99999:7:::/root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.::0:99999:7:::/g" package/base-files/files/etc/shadow

#修改主机名
sed -i "s/hostname='.*'/hostname='RAX3000Z'/g" package/base-files/files/bin/config_generate

##加入作者信息
sed -i "s/DISTRIB_DESCRIPTION='*.*'/DISTRIB_DESCRIPTION='LeiWrt-$(date +%Y%m%d)'/g"  package/base-files/files/etc/openwrt_release
sed -i "s/DISTRIB_REVISION='*.*'/DISTRIB_REVISION=' By Lei'/g" package/base-files/files/etc/openwrt_release
#cp -af feeds/extraipk/patch/diy/banner-Leiwrt  package/base-files/files/etc/banner

##修改WiFi名
sed -i "s/ImmortalWrt-2.4G/HiWiFi/g" package/mtk/applications/mtwifi-cfg/files/mtwifi.sh
sed -i "s/ImmortalWrt-5G/HiWiFi_5G/g" package/mtk/applications/mtwifi-cfg/files/mtwifi.sh

#############

##-----------------Del duplicate packages------------------
#rm -rf feeds/packages/net/open-app-filter
##-----------------Add OpenClash dev core------------------
curl -sL -m 30 --retry 2 https://raw.githubusercontent.com/vernesong/OpenClash/core/master/dev/clash-linux-arm64.tar.gz -o /tmp/clash.tar.gz
tar zxvf /tmp/clash.tar.gz -C /tmp >/dev/null 2>&1
chmod +x /tmp/clash >/dev/null 2>&1
mkdir -p feeds/luci/applications/luci-app-openclash/root/etc/openclash/core
mv /tmp/clash feeds/luci/applications/luci-app-openclash/root/etc/openclash/core/clash >/dev/null 2>&1
rm -rf /tmp/clash.tar.gz >/dev/null 2>&1
##-----------------Delete DDNS's examples-----------------
sed -i '/myddns_ipv4/,$d' feeds/packages/net/ddns-scripts/files/etc/config/ddns
##-----------------Manually set CPU frequency for MT7981B-----------------
sed -i '/"mediatek"\/\*|\"mvebu"\/\*/{n; s/.*/\tcpu_freq="1.3GHz" ;;/}' package/emortal/autocore/files/generic/cpuinfo


# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default
# ttyd免登陆
#sed -i 's|/bin/login|/bin/login -f root|g' feeds/packages/utils/ttyd/files/ttyd.config

# Add a feed source(添加源)
#添加插件源
#echo -e "\nsrc-git Lei9008_package https://github.com/Lei9008/openwrt_package_Lite" >> feeds.conf.default
## clone kiddin9/openwrt-packages仓库
git clone https://github.com/kiddin9/kwrt-packages package/new/openwrt-packages
##添加自己的插件库
echo -e "\nsrc-git extraipk https://github.com/liker5092/extra_ipk" >> feeds.conf.default
echo "src-git kenzo https://github.com/kenzok8/openwrt-packages" >> ./feeds.conf.default


#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default

# passwall
echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

# 阿里云服务
git clone https://github.com/messense/aliyundrive-webdav package/messense

# 京东签到
#git clone https://github.com/noiver/luci-app-jd-dailybonus package/luci-app-jd-dailybonus

# 商店
git clone https://github.com/linkease/istore-ui package/istore-ui
git clone https://github.com/linkease/istore package/istore

# 网易云解灰（天灵）
#git clone https://github.com/UnblockNeteaseMusic/server package/server

# 简单MESH
git clone https://github.com/ntlf9t/luci-app-easymesh package/luci-app-easymesh

# 集客AC控制器
git clone https://github.com/lwb1978/openwrt-gecoosac package/openwrt-gecoosac

# AdguardHome-app
git clone https://github.com/kongfl888/luci-app-adguardhome package/luci-app-adguardhome

# MosDns
git clone https://github.com/sbwml/luci-app-mosdns package/luci-app-mosdns

# alist文件列表
git clone https://github.com/sbwml/luci-app-alist package/luci-app-alist
