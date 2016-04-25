#
# linux/arch/arm/vfp/Makefile
#
# Copyright (C) 2001 ARM Limited
#

# ccflags-y := -DDEBUG
# asflags-y := -DDEBUG

<<<<<<< HEAD
ifdef CONFIG_LINARO
KBUILD_AFLAGS   :=$(KBUILD_AFLAGS:-msoft-float=-Wa,-mfpu=neon -mvectorize-with-neon-quad -ftree-vectorize  -funsafe-math-optimizations -funsafe-loop-optimizations)
else
KBUILD_AFLAGS	:=$(KBUILD_AFLAGS:-msoft-float=-Wa,-mfpu=neon)
endif
=======
KBUILD_AFLAGS	:=$(KBUILD_AFLAGS:-msoft-float=-Wa,-mfpu=softvfp+vfp -mfloat-abi=soft)
>>>>>>> f47ec9ca2c9625cef21e456a80aa7cbbfec33870
LDFLAGS		+=--no-warn-mismatch

obj-y			+= vfp.o

vfp-$(CONFIG_VFP)	+= vfpmodule.o entry.o vfphw.o vfpsingle.o vfpdouble.o
