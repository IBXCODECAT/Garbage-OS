; This file is for organizing characters, parsing strings, calling the teletype interupt

Print:
	push ax
	push bx

	mov ah, 0x0e ;Tells BIOS we are in a scrolling teletype BIOS routine (STTBR)

	.Loop:
		cmp [bx], byte 0 ;Compare char at index to zero
		je .Terminate ;If the char is zero, jump to exit the loop, otherwise...
			mov al, [bx] ;Move ASCII character into the teletype register
			int 0x10 ;Start the BIOS scrolling teletype BIOS routine using CPU interupt
			inc bx ;Incrament the current index of our string
			jmp .Loop ;Jump to .Loop and do it all again!!
	
	.Terminate:
		pop ax
		pop bx
		ret ;Return from print func

BootMSG:
	db "Boot OK", 0