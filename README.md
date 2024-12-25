- -------
## 本脚本来源于lgs2007m二次修改
- https://github.com/lgs2007m/Actions-OpenWrt
- -------
- 精简版和常规版默认加入了4g25db,5g24db-eeprom,simplify-25db默认编译双频25db-eeprom，如无需要请在运行工作流时取消勾选‘Use nx30pro eeprom and fixed WiFi MAC address’
- 默认编译dockerman，如无需要请在运行工作流时勾选“Not build luci-app-dockerman”
- 插件尽量不要加的太多，可能编译超时导致失败，我的建议是加入istore商店和一些其他插件，刷机以后去软件包/商店下载安装/使用.run（尽量不要编译网易云解灰/alist，大概率超时）
- part1已经添加了自用的几个插件地址，按需增减
- simplify:——精简版
- routine: ——常规版
- simplify-25db：——双频25db精简版
- -------
## 感谢p大的云编译项目
- https://p3terx.com/archives/build-openwrt-with-github-actions.html
## hanwckf21.02源码
- https://github.com/hanwckf/immortalwrt-mt798x
## padavanonly21.02源码
- https://github.com/padavanonly/immortalwrt-mt798x
## padavanonly23.05源码
- https://github.com/padavanonly/immortalwrt-mt798x-23.05
- -------
## 适合的U-boot
- https://www.right.com.cn/forum/forum.php?mod=viewthread&tid=8328967
## 历史云编译
- 2024/10/8
https://github.com/alneflibata/actions-openwrt/releases/tag/5G25db
- 2024/10/30
https://github.com/alneflibata/actions-openwrt/releases/tag/routine
- 2024/10/8
https://github.com/alneflibata/actions-openwrt/releases/tag/ssr%2Bpasswall%2Bopenclash
## 237大佬编译的固件
- 2024/4/12
https://github.com/alneflibata/actions-openwrt/releases/tag/237-20240412
- 2024/4/15
https://github.com/alneflibata/actions-openwrt/releases/tag/237-20240415
- 2024/8/1
https://github.com/alneflibata/actions-openwrt/releases/tag/237-20240801
- 2024/9/9
https://github.com/alneflibata/actions-openwrt/releases/tag/237-20240909
- 2024/10/2
https://github.com/alneflibata/actions-openwrt/releases/tag/237-20242002
- -------
## 其他资源汇总（瞎整）
- 语雀文档
https://www.yuque.com/yuqueyonghullvctc/lddvzm/cwqxrg9zh55k4ri5
## alist for openwrt
- 蓝奏云
https://along123.lanzouv.com/b0hciixcb
（a53&a55)密码:i4el
- release
https://github.com/alneflibata/actions-openwrt/releases/tag/package
