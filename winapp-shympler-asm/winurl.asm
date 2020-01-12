;winurl.asm
include shell32.inc
include kernel32.inc
.386
.model flat
.const
URL db "IDIOT.HTM",0
.code
_start:
	xor	ebx, ebx
	push	ebx
	push	ebx
	push	ebx
	push	offset URL
	push	ebx
	push	ebx
	call	ShellExecute
	push	ebx
	call	ExitProcess
end _start