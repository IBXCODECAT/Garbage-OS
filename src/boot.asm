[org 0x7c00] ;Some fancy org memory offset that I don't understand...

mov [BOOT_DISK], dl ;Store disk number program was loaded from into register dl

mov bp, 0x7c00 ;Setup CPU stack base at this programs memory address
mov sp, bp ;Move the CPU stack pointer to the stack base

mov al, [BOOT_SECTOR_SPACE] ;Do something else I don't fully understand
call ReadDisk ;Call readDisk from dskread.asm

mov bx, BootMSG ;Move predefined teletype.asm boot message ASCII bytes into CPU register bx
call Print ;Call print from teletype.asm

jmp BOOT_SECTOR_SPACE ;Jump to to the end of boot sector Spaca

%include "../src/dskread.asm" ;Include path is relative to the builder.bat file location...
%include "../src/teletype.asm" ;Include path is relative to the builder.bat file location...

times 0200h - 2 - ($ - $$)  db 0 ;Zerofill up to 510 bytes
dw 0AA55h ;Boot Sector signature

BootMSG:
	db "Boot OK", 0