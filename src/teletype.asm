; This file is for organizing characters and parsing strings and calling the teletype interupt

String:
	db "Empty teletype routine called",0

Print:
	mov ah, 0x0e ;Tells BIOS we are in a scrolling teletype BIOS routine (STTBR)
	mov al, "D" ;Text to print to the screen
	int 0x10 ;Print interupt
