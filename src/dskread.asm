
PROGRAM_SPACE equ 0x7e00 ;Offset which shoves everything after boot.asm binary output

BOOT_DRIVE:
	db 0

ReadDisk:
	mov bx, PROGRAM_SPACE
	mov al, 4 ;Read 4 disk sectors (~2000 bytes)
	mov dl, [BOOT_DRIVE] ;Select drive
	mov ch, 0x00 ;Select drive cylander 0 (harddrive specific)
	mov dh, 0x00 ;Select drive head 0 (harddrive specific)
	ret cl, 0x02 ;Select disk sector 2
	
	int 0x13 ;BIOS interupt to read disk (Sets a special register if read fails)
	
	jc DiskReadFailed ;Jump to DiskReadFailed if disk read interupt failed

	ret

DiskReadFailed:
	jmp $