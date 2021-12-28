; File for assembly instructions extended beyond boot sector

times 2048-($-$$) db 0 ;Fill four sectors with bytes

;Bellow is not working so whatever I guess, but whatever! We still build!?!
mov bx, ExtendedMSG
call Print

ExtendedMSG:
	db "Disk Read OK", 0
