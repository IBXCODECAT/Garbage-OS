org 0x7c00

; OS Kernel Here

times 0200h - 2 - ($ - $$)  db 0 ;Zerofill up to 510 bytes
	dw 0AA55h ;Boot Sector signature