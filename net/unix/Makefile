#
# Makefile for the Linux unix domain socket layer.
#

<<<<<<< HEAD
CFLAGS_af_unix.o += -Os

=======
>>>>>>> f47ec9ca2c9625cef21e456a80aa7cbbfec33870
obj-$(CONFIG_UNIX)	+= unix.o

unix-y			:= af_unix.o garbage.o
unix-$(CONFIG_SYSCTL)	+= sysctl_net_unix.o

obj-$(CONFIG_UNIX_DIAG)	+= unix_diag.o
unix_diag-y		:= diag.o
