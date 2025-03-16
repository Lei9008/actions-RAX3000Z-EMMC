##!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source

#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default
# ttyd免登陆
#sed -i 's|/bin/login|/bin/login -f root|g' feeds/packages/utils/ttyd/files/ttyd.config

# Add a feed source(添加源)
#添加插件源
echo -e "\nsrc-git Lei9008_package https://github.com/Lei9008/openwrt_package_Lite.git" >> feeds.conf.default
#echo -e "\nsrc-git Lei9008_package https://github.com/Lei9008/openwrt_package_Lite" >> feeds.conf.default
## clone kiddin9/openwrt-packages仓库
#echo "src-git openwrt_kiddin9 https://dl.openwrt.ai/latest/packages/aarch64_cortex-a53/kiddin9" >> feeds.conf.default
#echo -e "\nsrc-git extraipk https://github.com/stwrnet/extra-ipk" >> feeds.conf.default
#sed -i '$a src-git mzwrt_package https://github.com/mzwrt/mzwrt_package' feeds.conf.default
## clone kiddin9/openwrt-packages仓库
src-git-full kiddin9 https://github.com/kiddin9/kwrt-packages.git;openwrt-packages
src-git-full kenzo https://github.com/kenzok8/openwrt-packages.git;openwrt-packages
src-git-full extraipk https://github.com/liker5092/extra_ipk;openwrt-packages



#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default

# passwall
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

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
#git clone https://github.com/sbwml/luci-app-mosdns package/luci-app-mosdns

# alist文件列表
#git clone https://github.com/sbwml/luci-app-alist package/luci-app-alist
