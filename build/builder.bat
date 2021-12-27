@echo off
nasm %~dp0/../src/boot.asm -f bin -o bootloader.bin
nasm %~dp0/../src/extended.asm -f bin -o extended.bin

copy /b bootloader.bin+extended.bin garabage-os.iso
pause