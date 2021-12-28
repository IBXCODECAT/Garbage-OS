; This file is for organizing characters, parsing strings, calling the teletype interupt

TestChar equ "F" ;Because F in the chat for me attempting OS development...

Print:
	mov ah, 0x0e ;Tells BIOS we are in a scrolling teletype BIOS routine (STTBR)
	mov al, TestChar ;Character to print to the screen (Must be a single ASCII char)
	int 0x10 ;BIOS Print interupt
