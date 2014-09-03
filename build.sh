#!/bin/bash

# Written by antdking <anthonydking@gmail.com>
# Rewritten by F4uzan <derpish123@gmail.com> for F4kernel
# credits to Rashed for the base of zip making
# credits to the internet for filling in else where

# Feel free to modify if needed

location=.
kernelname=f4kernel

if [ -z $target ]; then
echo "Select kernel to build"
echo "1.) L7 : NFC"
echo "2.) L7 : No NFC"
read -p "Selection : " choice
case "$choice" in
1 ) export target=p700 ; export ARCH=arm; make f4kernel_u0_nfc_defconfig ;;
2 ) export target=p705 ; export ARCH=arm; make f4kernel_u0_nonfc_defconfig ;;
* ) echo "invalid choice"; sleep 2 ; $0;;
esac
fi # [ -z $target ]

if [ -z $version ]; then
read -p "Version : " kernelver
export version=$kernelver
fi # [ -z $target ]

if [ -z $compiler ]; then
if [ -f ../arm-eabi-4.6/bin/arm-eabi-* ]; then
export compiler=../arm-eabi-4.6/bin/arm-eabi-
elif [ -f arm-eabi-4.6/bin/arm-eabi-* ]; then # [ -f ../arm-eabi-4.6/bin/arm-eabi-* ]
export compiler=arm-eabi-4.6/bin/arm-eabi-
else # [ -f arm-eabi-4.6/bin/arm-eabi-* ]
read -p "Compiler full path : " compiler
fi # [ -z $compiler ]
fi # [ -f ../arm-eabi-4.6/bin/arm-eabi-* ]

cd $location
export CROSS_COMPILE=$compiler
if [ -z "$clean" ]; then
read -p "Do make mrproper (y/N) ? " clean
fi # [ -z "$clean" ]
case "$clean" in
y|Y ) echo "Cleaning config file..."; make clean mrproper;;
n|N ) echo "Skipping process...";;
* ) echo "Invalid choice"; sleep 2 ; build.sh;;
esac

echo "Building F4Kernel v$version..."

make $defconfig
make -j `cat /proc/cpuinfo | grep "^processor" | wc -l` "$@"

## the zip creation
if [ -f arch/arm/boot/zImage ]; then

rm -f out/kernel/zImage
rm -rf out/system/

mkdir -p out/system/lib/modules

mkbootimg --kernel /arch/arm/boot/zImage --ramdisk /arch/arm/boot/ramdisk-common.gz --cmdline androidboot.hardware=u0 --base 0x00200000 --pagesize 4096 -o /out/boot.img

find . -name *.ko | xargs cp -a --target-directory=out/system/lib/modules/

zipfile="$kernelname-$target-$version.zip"
cd out
rm -f *.zip
zip -r $zipfile * -x *kernel/.gitignore*

echo "output saved to out/$zipfile"

else # [ -f arch/arm/boot/zImage ]
echo "build failed, output not created"
fi # [ -f arch/arm/boot/zImage ]

