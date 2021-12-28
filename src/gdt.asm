; This file is for setting up the global descriptor table (32 bit memory management)

; Acess byte
	; index 0 --> Present bit (set to current bit)
	; index 1 --> memory privlage (range: 0-3 | 0 = kernel | 1 = ? | 2 = ? | 3 = |)
	; index 2 --> descriptor type (range: 0-1 | 0 = system segments | 1 = code/data segments)
	; index 3 --> executable bit (range: 0-1 | 0 = data segment | 1 = code segment)
	; index 4 --> direction of conforming bit
	; index 5 --> read/write permission (range 0-1 | 0 = writable | 1 = readable)
	; index 6 --> acess bit (set to zero until CPU acessess and flips bit)

; GDT Flags
	; index 0 --> granularity (range: 0-1 | 0 = 1 byte blocks | 1 = 4Kb byte blocks)
	; index 1 --> size bit (range: 0-1 | 0 = 16 bit | 1 = 32 bit)
	; index 2 --> 0 (null byte)
	; index 3 --> 0 (null byte)
	; index 4-7 --> Limit Extension (strange how they set this up huh?)

gdt_null_descriptor: ;GDT contains two double words (8 bytes)
	dd 0
	dd 0

gdt_code_descriptor:
	dw 0xFFFF ;Declare GDT limit (Covering the entire span of available memory)
	dw 0x0000 ;Declare the base of our code segment to the first bit of our memory (32-bit)
	db 0x00 ;Declare the base of our code segment to the first bit of our memory (16-bit)
	
	db 10011010b ;Declare Access byte
	db 11001111b ;Set GDT Flags byte

	db 0x00 ;Set the high portion of the base

gdt_data_descriptor:
	dw 0xFFFF ;Declare GDT limit (Covering the entire span of available memory)
	dw 0x0000 ;Declare the base of our code segment to the first bit of our memory (32-bit)
	db 0x00 ;Declare the base of our code segment to the first bit of our memory (16-bit)
	
	db 10010010b ;Declare Access byte
	db 11001111b ;Set GDT Flags byte

	db 0x00 ;Set the high portion of the base

gdt_end:
	
gdt_descriptor: ;This is what we will pass into the CPU register
	gdt_size:
		dw gdt_end - gdt_null_descriptor - 1 ;Yeah, we subtract one for some reason :)
		dd gdt_null_descriptor

code_segment equ gdt_code_descriptor - gdt_null_descriptor
data_segment equ gdt_data_descriptor - gdt_null_descriptor