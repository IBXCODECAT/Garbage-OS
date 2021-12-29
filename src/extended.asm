; File for assembly instructions extended beyond boot sector

[org 0x7c00]

jmp EnterProtectedMode

%include "../src/gdt.asm" ;Include path is relative to the builder.bat file location...

EnterProtectedMode:
	call EnableA20 ;Enable the A20 Line
	cli	; Disable Interupts
	lgdt [gdt_descriptor] ;Load the GDT descriptor
	
	;Set the bit so the CPU knows it's in 32-bit protected mode
	mov eax, cr0
	or eax, 1
	mov cr0, eax

	jmp code_segment:StartProtectedMode

EnableA20:
	in al, 0x92 ;Taking in a value
	or al, 2 ;Doing some fancy bitwise math
	out 0x92, al ;Shoving it back out
	ret

[bits 32]

StartProtectedMode:
	mov ax, data_segment
	mov ds, ax
	mov ss, ax
	mov es, ax
	mov fs, ax
	mov gs, ax

	mov ebp, 0x90000 ;Increase stack size low
	mov esp, ebp ;Increase stack size high

	mov [0xb8000], byte "H"

	jmp $

times 2048-($-$$) db 0 ;Zerofill four sectors