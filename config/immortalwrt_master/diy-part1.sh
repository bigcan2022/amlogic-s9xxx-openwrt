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

# Bundle the latest official ARM64 Meta/Mihomo core so OpenClash can start
# before the box has working proxy access.
openclash_core_dir="package/luci-app-openclash/luci-app-openclash/root/etc/openclash/core"
openclash_core_tmp="$(mktemp -d)"
mkdir -p "${openclash_core_dir}"
curl -fL --retry 3 \
    "https://raw.githubusercontent.com/vernesong/OpenClash/core/master/meta/clash-linux-arm64.tar.gz" \
    -o "${openclash_core_tmp}/clash-linux-arm64.tar.gz"
tar -xzf "${openclash_core_tmp}/clash-linux-arm64.tar.gz" -C "${openclash_core_tmp}"
install -m 0755 "${openclash_core_tmp}/clash" "${openclash_core_dir}/clash_meta"
rm -rf "${openclash_core_tmp}"

# Remove unnecessary packages
# rm -rf package/emortal/{autosamba,ipv6-helper}
