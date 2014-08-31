#!/bin/sh
#
# F4Kernel boot.img compiler
# ---------------------------
# v0.1
# ---------------------------
#
# Stills unfancy, but it runs well.

# Builds for common AOSP ROM
# mkbootimg --kernel zImage --ramdisk ramdisk-common.gz --cmdline androidboot.hardware=u0 --base 0x00200000 --pagesize 4096 -o boot.img

# Builds for MIUI
mkbootimg --kernel zImage --ramdisk ramdisk-miui.gz --cmdline androidboot.hardware=u0 --base 0x00200000 --pagesize 4096 -o boot.img
