; File for assembly instructions extended beyond boot sector

[org 0x7c00]

mov bx, DiskReadMSG
call Print

jmp $

%include "../src/teletype.asm" ;Include path is relative to the builder.bat file location...

DiskReadMSG:
	db "Disk OK", 0

times 2048-($-$$) db 0x1 ;Fill four sectors with bytes