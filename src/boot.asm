[org 0x7c00]

mov [BOOT_DISK], dl ;Store disk number program was loaded from into register dl

mov bp, 0x7c00
mov sp, bp

call ReadDisk ;Call readDisk from dskread.asm

mov ah, 0x0e
mov al, [PROGRAM_SPACE]
int 0x10

jmp $

%include "../src/dskread.asm" ;Include path is relative to the builder.bat file location...

times 0200h - 2 - ($ - $$)  db 0 ;Zerofill up to 510 bytes
dw 0AA55h ;Boot Sector signature