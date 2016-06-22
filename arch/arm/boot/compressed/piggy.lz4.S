	.section .piggydata,#alloc
	.globl	input_data
input_data:
	.incbin	"arch/arm/boot/compressed/piggy.lz4"
	.globl	input_data_end
input_data_end:
<<<<<<< HEAD
=======

>>>>>>> f47ec9ca2c9625cef21e456a80aa7cbbfec33870
