;winhello.asm
include def32.inc
include kernel32.inc
include user32.inc

	.386
	.model flat
	.const
hello_title	db "������ win32 GUI - ��������� Shyar`� ", 0
hello_message	db "          ����������, ���!!!", 0
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