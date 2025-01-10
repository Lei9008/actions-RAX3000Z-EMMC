#!/bin/bash



#修改默认IP
sed -i 's/192.168.1.1/192.168.5.1/g' package/base-files/files/bin/config_generate

#web登陆密码从空密码修改为 password
sed -i "s/root:::0:99999:7:::/root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.::0:99999:7:::/g" package/base-files/files/etc/shadow

#修改主机名
sed -i "s/hostname='.*'/hostname='RAX3000Z'/g" package/base-files/files/bin/config_generate

##添加自己的插件库
echo -e "\nsrc-git Lei9008_package https://github.com/Lei9008/openwrt_package_Lite" >> feeds.conf.default

##WiFi
#sed -i "s/MT7981_AX3000_2.4G/HiWiFi/g" package/mtk/drivers/wifi-profile/files/mt7981/mt7981.dbdc.b0.dat
#sed -i "s/MT7981_AX3000_5G/HiWiFi_5G/g" package/mtk/drivers/wifi-profile/files/mt7981/mt7981.dbdc.b1.dat

##修改WiFi名
sed -i "s/ImmortalWrt-2.4G/HiWiFi/g" package/mtk/applications/mtwifi-cfg/files/mtwifi.sh
sed -i "s/ImmortalWrt-5G/HiWiFi_5G/g" package/mtk/applications/mtwifi-cfg/files/mtwifi.sh

###############
cat <<EOL >> package/base-files/files/etc/uci-defaults/99_Lei9008_settings
#!/bin/sh

# 设置主机名
# uci set system.@system[0].hostname='MzWrt'

# 修改默认IP
# uci set network.lan.ipaddr='192.168.10.1'

# 设置 2.4GHz 频段的国家为中国
# uci set wireless.radio0.country='CN'
# 设置 5GHz 频段的国家为中国
# uci set wireless.radio1.country='CN'

# 信道设置
# uci set wireless.radio0.channel='auto'  # 设置 2.4GHz 信道为 13
# uci set wireless.radio1.channel='auto'  # 设置 5GHz 信道为 36

# 设置 2.4GHz 频段的无线模式（支持 802.11n，20MHz 或 40MHz，最大带宽 40MHz）
# uci set wireless.radio0.htmode='HE40'  # 设置 2.4GHz 频段为 40MHz 带宽

# 设置 5GHz 频段的无线模式为 HE160（最大带宽 160MHz）
# uci set wireless.radio1.htmode='HE160'  # 设置 5GHz 带宽为 160MHz

# 开启 Beamforming 功能
uci set wireless.radio0.beamforming='1'  # 开启 2.4GHz 的 Beamforming
uci set wireless.radio1.beamforming='1'  # 开启 5GHz 的 Beamforming

# 开启 MU-MIMO 支持
uci set wireless.radio0.mu_mimo='1'  # 开启 2.4GHz 的 MU-MIMO
uci set wireless.radio1.mu_mimo='1'  # 开启 5GHz 的 MU-MIMO

# 开启 OFDMA 支持
uci set wireless.radio0.ofdma='1'    # 开启 2.4GHz 的 OFDMA
uci set wireless.radio1.ofdma='1'    # 开启 5GHz 的 OFDMA

# 设置 2.4GHz SSID 名称为 MzWrt-2.4G
# uci set wireless.default_radio0.ssid='MzWrt-2.4G'

# 设置 5GHz SSID 名称为 MzWrt-5G
# uci set wireless.default_radio1.ssid='MzWrt-5G'

# 提交无线配置
uci commit wireless

# 重启网络
# /etc/init.d/network restart

# 提交修改的默认IP
# uci commit network

# 如果您确实需要重启系统或修改主机名，也可以执行
# 提交主机名配置
# uci commit system
# 重启系统
# /etc/init.d/system restart

EOL
################

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
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default

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
