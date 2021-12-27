@echo off
nasm %~dp0/../src/boot.asm -f bin -o garabage-os.iso
pause