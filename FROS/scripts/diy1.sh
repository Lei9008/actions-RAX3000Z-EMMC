#!/bin/bash
#=================================================
# Lei9008 script
#================================================= 


##添加自己的插件库
## echo -e "\nsrc-git Lei9008_package https://github.com/Lei9008/openwrt_package_Lite" >> feeds.conf.default
sed -i '$a src-git Lei9008_package https://github.com/Lei9008/openwrt_package_Lite" >> feeds.conf.default
