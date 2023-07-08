#!/bin/bash

rm -f ./.config*
touch ./.config

#
# ========================固件定制部分========================
# 

# 
# 如果不对本区块做出任何编辑, 则生成默认配置固件. 
# 

# 以下为定制化固件选项和说明:
#

#
# 有些插件/选项是默认开启的, 如果想要关闭, 请参照以下示例进行编写:
# 
#          =========================================
#         |  # 取消编译VMware镜像:                   |
#         |  cat >> .config <<EOF                   |
#         |  # CONFIG_VMDK_IMAGES is not set        |
#         |  EOF                                    |
#          =========================================
#

# 
# 以下是一些提前准备好的一些插件选项.
# 直接取消注释相应代码块即可应用. 不要取消注释代码块上的汉字说明.
# 如果不需要代码块里的某一项配置, 只需要删除相应行.
#
# 如果需要其他插件, 请按照示例自行添加.
# 注意, 只需添加依赖链顶端的包. 如果你需要插件 A, 同时 A 依赖 B, 即只需要添加 A.
# 
# 无论你想要对固件进行怎样的定制, 都需要且只需要修改 EOF 回环内的内容.
# 

# 编译p2w_r619ac固件:
cat >> .config <<EOF
CONFIG_TARGET_ipq40xx=y
CONFIG_TARGET_ipq40xx_DEVICE_p2w_r619ac-128m=y
EOF

# Base system
cat >> .config <<EOF
CONFIG_PACKAGE_blockd=y
EOF

# IPv6支持:
# cat >> .config <<EOF
# CONFIG_PACKAGE_dnsmasq_full_dhcpv6=y
# CONFIG_PACKAGE_ipv6helper=y
# CONFIG_PACKAGE_ip6tables=y
# CONFIG_PACKAGE_ip6tables-extra=y
# CONFIG_PACKAGE_ip6tables-mod-nat=y
# EOF

# Administration
cat >> .config <<EOF
CONFIG_PACKAGE_htop=y
EOF

# Extra packages
cat >> .config <<EOF
# CONFIG_PACKAGE_autosamba is not set
EOF

# Kernel modules

# Block Devices
cat >> .config <<EOF
CONFIG_PACKAGE_kmod-ata-core=y
CONFIG_PACKAGE_kmod-ata-ahci=y
CONFIG_PACKAGE_kmod-block2mtd=y
CONFIG_PACKAGE_kmod-scsi-core=y
CONFIG_PACKAGE_kmod-scsi-generic=y
EOF

# 多文件系统支持:
cat >> .config <<EOF
CONFIG_PACKAGE_kmod-fs-cifs=y
CONFIG_PACKAGE_kmod-fs-exfat=y
CONFIG_PACKAGE_kmod-fs-ext4=y
CONFIG_PACKAGE_kmod-fs-f2fs=y
CONFIG_PACKAGE_kmod-fs-nfs=y
CONFIG_PACKAGE_kmod-fs-nfs-common=y
CONFIG_PACKAGE_kmod-fs-nfs-v3=y
CONFIG_PACKAGE_kmod-fs-nfs-v4=y
CONFIG_PACKAGE_kmod-fs-squashfs=y
EOF

# Native Language Support
cat >> .config <<EOF
CONFIG_PACKAGE_kmod-nls-cp936=y
EOF

# USB3.0支持:
cat >> .config <<EOF
CONFIG_PACKAGE_kmod-usb-ohci=y
CONFIG_PACKAGE_kmod-usb2=y
CONFIG_PACKAGE_kmod-usb3=y
EOF

# USB Support
cat >> .config <<EOF
CONFIG_PACKAGE_kmod-usb-printer=y
CONFIG_PACKAGE_kmod-usb-storage-uas=y
CONFIG_PACKAGE_kmod-usb-uhci=y
EOF

# LuCI

# 常用LuCI插件选择:
cat >> .config <<EOF
CONFIG_PACKAGE_luci-app-aria2=y
CONFIG_PACKAGE_luci-app-frpc=y
CONFIG_PACKAGE_luci-app-openclash=y
CONFIG_PACKAGE_luci-app-mjpg-streamer=y
# CONFIG_PACKAGE_luci-app-samba is not set
CONFIG_PACKAGE_luci-app-serverchan=y
CONFIG_PACKAGE_luci-app-statistics=y
CONFIG_PACKAGE_luci-app-transmission=y
CONFIG_PACKAGE_luci-app-usb-printer=y
CONFIG_PACKAGE_luci-app-watchcat=y
EOF

#
# LuCI for Lienol
#

# passwall
# cat >> .config <<EOF
# CONFIG_PACKAGE_luci-app-passwall=y

#
# Configuration
#
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_ipt2socks=y
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Shadowsocks=y
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_ShadowsocksR=y
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Shadowsocks_socks=y
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_ShadowsocksR_socks=y
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_V2ray=y
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Trojan=y
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Brook=y
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_kcptun=y
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_haproxy=y
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_ChinaDNS=y
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_pdnsd=y
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_dns2socks=y
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_dns-forwarder=y

# EOF

#
# Video Support
#
cat >> .config <<EOF
CONFIG_PACKAGE_kmod-video-core=y
# CONFIG_PACKAGE_kmod-video-cpia2 is not set
# CONFIG_PACKAGE_kmod-video-gspca-core is not set
# CONFIG_PACKAGE_kmod-video-pwc is not set
CONFIG_PACKAGE_kmod-video-uvc=y
CONFIG_PACKAGE_kmod-video-videobuf2=y
EOF

# LuCI主题:
cat >> .config <<EOF
CONFIG_PACKAGE_luci-theme-bootstrap=y
EOF

# Network

# BitTorrent
cat >> .config <<EOF
CONFIG_PACKAGE_transmission-cli-openssl=y
CONFIG_PACKAGE_transmission-daemon-openssl=y
CONFIG_PACKAGE_transmission-remote-openssl=y
# CONFIG_PACKAGE_transmission-web is not set
CONFIG_PACKAGE_transmission-web-control=y
EOF

# IP Addresses and Names
cat >> .config <<EOF
CONFIG_PACKAGE_ddns-scripts_no-ip_com=y
CONFIG_SAMBA4_SERVER_NETBIOS=y
EOF

#
# Utilities
#

#
# Compression
#
cat >> .config <<EOF
CONFIG_PACKAGE_unzip=y
EOF

#
# Disc
#
cat >> .config <<EOF
CONFIG_PACKAGE_blkid=y
CONFIG_PACKAGE_fdisk=y
CONFIG_PACKAGE_hd-idle=y
CONFIG_PACKAGE_hdparm=y
CONFIG_PACKAGE_lsblk=y
EOF

#
# Editors
#
cat >> .config <<EOF
EOF

#
# Filesystem
#
cat >> .config <<EOF
CONFIG_PACKAGE_badblocks=y
CONFIG_PACKAGE_e2fsprogs=y
EOF


# 常用软件包:
cat >> .config <<EOF
CONFIG_PACKAGE_curl=y
CONFIG_PACKAGE_tmux=y
CONFIG_PACKAGE_tree=y
CONFIG_PACKAGE_vim-fuller=y
CONFIG_PACKAGE_wget=y
CONFIG_PACKAGE_usbutils=y
CONFIG_PACKAGE_iperf3=y
CONFIG_PACKAGE_openssh-sftp-server=y
EOF

# 取消编译VMware镜像以及镜像填充 (不要删除被缩进的注释符号):
# cat >> .config <<EOF
# # CONFIG_TARGET_IMAGES_PAD is not set
# # CONFIG_VMDK_IMAGES is not set
# EOF

# 
# ========================固件定制部分结束========================
# 

sed -i 's/^[ \t]*//g' ./.config
# make defconfig

# rm -rf /home/pve/openwrt/lede/files/etc/config/network