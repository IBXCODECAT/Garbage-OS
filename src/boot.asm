org 0x7c00

mov [BOOT_DRIVE], dl ;Store disk number program was loaded from into register dl

mov bp, 0x7c00
mov sp, bp

%include "../src/dskread.asm" ;Include is relative to the builder.bat file location...
call ReadDisk ;Call readDisk from dskread.asm

times 0200h - 2 - ($ - $$)  db 0 ;Zerofill up to 510 bytes
	dw 0AA55h ;Boot Sector signature