#ifndef DECOMPRESS_UNLZ4_H
#define DECOMPRESS_UNLZ4_H

int unlz4(unsigned char *inbuf, int len,
	int(*fill)(void*, unsigned int),
	int(*flush)(void*, unsigned int),
	unsigned char *output,
	int *pos,
	void(*error)(char *x));
#endif
<<<<<<< HEAD
=======

>>>>>>> f47ec9ca2c9625cef21e456a80aa7cbbfec33870
