#!/bin/bash
#========================================================================================================================
# https://github.com/ophub/amlogic-s9xxx-openwrt
# Description: Automatically Build OpenWrt
# Function: DIY script (Before updating feeds — modify the default IP, hostname, theme, add/remove packages, etc.)
# Source code repository: https://github.com/immortalwrt/immortalwrt / Branch: master
#========================================================================================================================

# Add a custom feed source
# sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default

# OpenClash: build the newest upstream master available at build time.
rm -rf package/luci-app-openclash
git clone --depth 1 --branch master https://github.com/vernesong/OpenClash.git package/luci-app-openclash

# Remove unnecessary packages
# rm -rf package/emortal/{autosamba,ipv6-helper}
