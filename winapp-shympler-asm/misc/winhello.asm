;winhello.asm
include def32.inc
include kernel32.inc
include user32.inc

	.386
	.model flat
	.const
hello_title	db "Ïונגאÿ win32 GUI - ןנמדנאללא Shyar`א ", 0
hello_message	db "          Çהנאגסעגףי, לטנ!!!", 0
	.code
_start:
	push	MB_ICONINFORMATION
	push	offset hello_title
	push	offset hello_message
	push	0
	call	MessageBox

	push	0
	call	ExitProcess
end _start