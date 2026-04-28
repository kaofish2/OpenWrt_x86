#!/bin/bash

shopt -s extglob

rm -rf target/linux package/boot package/devel package/firmware package/kernel package/libs package/network package/kernel tools toolchain
mkdir new; cp -rf .git new/.git
cd new
git reset --hard origin/main

cp -rf --parents target/linux package/boot package/devel package/firmware package/kernel package/libs package/network package/kernel tools toolchain config ../

cd -

#nat46: fix reproducible-build failure and use latest git
#wget -N https://github.com/graysky2/openwrt/commit/e52d04b65d1942f581533cb2054e74f4ff5bd70b.patch -P devices/common/patches/


#nat46: fix reproducible-build failure and use latest git
#wget -N https://github.com/graysky2/openwrt/commit/e52d04b65d1942f581533cb2054e74f4ff5bd70b.patch -P devices/common/patches/

#kernel: 6.18: backport mxl862xx driver for Linxu 6.18 #22668
#wget -N https://github.com/dangowrt/openwrt/commit/ae28585b65a80600b5e4502aba594f2cdcc1d52e.patch -P devices/common/patches/

#wget -N https://raw.githubusercontent.com/immortalwrt-collections/lean-lede/refs/heads/lede/target/linux/x86/patches-6.18/996-intel-igc-i225-i226-disable-eee.patch -P target/linux/x86/patches-6.18/





cd feeds/packages
rm -rf net/xtables-addons net/jool kernel/v4l2loopback libs/libpfring libs/libmariadb

git_clone_path master https://github.com/openwrt/packages net/jool kernel/v4l2loopback libs/libpfring net/xtables-addons libs/libmariadb

cd ../../

#cd feeds/miaogongzi
#rm -rf fibocom_QMI_WWAN rkp-ipid
#cd ../../



cd package
rm -rf devel/kselftests-bpf  kernel/mt76 kernel/ath10k-ct 

#libs/libnl/Makefile
#wget -N https://patch-diff.githubusercontent.com/raw/openwrt/mt76/pull/1026.patch -P kernel/mt76/patches/
#mv kernel/mt76/patches/1026.patch kernel/mt76/patches/002-fix-mt76-timer-compat.patch

#wget -N https://raw.githubusercontent.com/mgz0227/openwrt/refs/heads/6.18-libnl/package/libs/libnl/Makefile -P libs/libnl/ 

cd ../

rm -rf package/kernel/ath10k-ct package/kernel/mt76