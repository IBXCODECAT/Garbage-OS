; File for assembly instructions extended beyond boot sector

[org 0x7c00]

mov bx, DiskReadMSG
call Print

jmp $

%include "../src/teletype.asm" ;Include path is relative to the builder.bat file location...

DiskReadMSG:
	db "Disk Read Sucsessfull", 0

times 2048-($-$$) db 0 ;Fill four sectors with bytes
