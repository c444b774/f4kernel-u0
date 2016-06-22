#!/bin/bash

# Written by antdking <anthonydking@gmail.com>
<<<<<<< HEAD
# credits to Rashed for the base of zip making
# credits to the internet for filling in else where

echo "this is an open source script, feel free to use and share it"

daytime=$(date +%d"-"%m"-"%Y"_"%H"-"%M)

location=.
vendor=lge
version=3.4.0

if [ -z $target ]; then
echo "choose your target device"
echo "1) l3 ii"
echo "2) l5"
echo "3) l7"
read -p "1/2/3: " choice
case "$choice" in
1 ) export target=e430 ; export defconfig=vee3-rev_11_led_defconfig;;
2 ) export target=e610 ; export defconfig=cyanogenmod_m4_defconfig;;
3 ) export target=p700 ; export defconfig=cyanogenmod_u0_defconfig;;
=======
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
>>>>>>> f47ec9ca2c9625cef21e456a80aa7cbbfec33870
* ) echo "invalid choice"; sleep 2 ; $0;;
esac
fi # [ -z $target ]

<<<<<<< HEAD
=======
if [ -z $version ]; then
read -p "Version : " kernelver
export version=$kernelver
fi # [ -z $target ]

>>>>>>> f47ec9ca2c9625cef21e456a80aa7cbbfec33870
if [ -z $compiler ]; then
if [ -f ../arm-eabi-4.6/bin/arm-eabi-* ]; then
export compiler=../arm-eabi-4.6/bin/arm-eabi-
elif [ -f arm-eabi-4.6/bin/arm-eabi-* ]; then # [ -f ../arm-eabi-4.6/bin/arm-eabi-* ]
export compiler=arm-eabi-4.6/bin/arm-eabi-
else # [ -f arm-eabi-4.6/bin/arm-eabi-* ]
<<<<<<< HEAD
echo "please specify a location, including the '/bin/arm-eabi-' at the end "
read compiler
=======
read -p "Compiler full path : " compiler
>>>>>>> f47ec9ca2c9625cef21e456a80aa7cbbfec33870
fi # [ -z $compiler ]
fi # [ -f ../arm-eabi-4.6/bin/arm-eabi-* ]

cd $location
<<<<<<< HEAD
export ARCH=arm
export CROSS_COMPILE=$compiler
if [ -z "$clean" ]; then
read -p "do make clean mrproper?(y/n)" clean
fi # [ -z "$clean" ]
case "$clean" in
y|Y ) echo "cleaning..."; make clean mrproper;;
n|N ) echo "continuing...";;
* ) echo "invalid option"; sleep 2 ; build.sh;;
esac

echo "now building the kernel"
=======
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
>>>>>>> f47ec9ca2c9625cef21e456a80aa7cbbfec33870

make $defconfig
make -j `cat /proc/cpuinfo | grep "^processor" | wc -l` "$@"

## the zip creation
if [ -f arch/arm/boot/zImage ]; then

<<<<<<< HEAD
rm -f zip-creator/kernel/zImage
rm -rf zip-creator/system/

# changed antdking "clean up mkdir commands" 04/02/13
mkdir -p zip-creator/system/lib/modules

cp arch/arm/boot/zImage zip-creator/kernel
# changed antdking "now copy all created modules" 04/02/13
# modules
# (if you get issues with copying wireless drivers then it's your own fault for not cleaning)

find . -name *.ko | xargs cp -a --target-directory=zip-creator/system/lib/modules/

zipfile="$vendor-$target-v$version-$daytime.zip"
cd zip-creator
rm -f *.zip
zip -r $zipfile * -x *kernel/.gitignore*

echo "zip saved to zip-creator/$zipfile"

else # [ -f arch/arm/boot/zImage ]
echo "the build failed so a zip won't be created"
=======
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
>>>>>>> f47ec9ca2c9625cef21e456a80aa7cbbfec33870
fi # [ -f arch/arm/boot/zImage ]

