BOOT_SECTOR_SPACE equ 0x7e00 ;Offset which shoves everything after boot.asm binary output

BOOT_DISK:
	db 0

ReadDisk:
	mov ah, 0x02 ;BIOS Function for reading a disk...
	mov bx, BOOT_SECTOR_SPACE ;Read beyond the space of the boot sector
	mov al, 2 ;Read 2 disk sectors (~2000 bytes)
	mov dl, [BOOT_DISK] ;Select drive
	mov ch, 0x00 ;Select drive cylander 0 (harddrive specific)
	mov dh, 0x00 ;Select drive head 0 (harddrive specific)
	mov cl, 0x02 ;Select disk sector 2
	
	int 0x13 ;BIOS interupt to read disk (Sets a special register if read fails)
	jc DiskReadFailed ;Jump to DiskReadFailed if disk read interupt failed
	ret

DiskReadError:
	db "Could not read disk :(", 0

DiskReadFailed:
	mov bx, DiskReadError ;Move disk read error stirng into teletype register
	call Print ;Call print function to let the user know of our failures
	jmp $ ;Infinite jump prevents further instructions