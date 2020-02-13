;winmenu.asm

ZZZ_TEST	equ	0
ZZZ_OPEN	equ	1
ZZZ_SAVE	equ	2
ZZZ_EXIT	equ	3

include def32.inc
include kernel32.inc
include user32.inc
	.386
	.model flat
	.data
xyz_title	db " => Инфо о меню EAX : [|}",0
xyz_msg		db "Значение регистра EAX = "
_eax_reg_	db  -1
_eax_reg_1	db  -1
_eax_reg_2	db  -1
_eax_reg_3	db  -1
_eax_reg_4	db  -1
_eax_reg_5	db  -1
_eax_reg_6	db  -1
_eax_reg_7	db  -1
		db 0
class_name	db "window class 1", 0
window_name	db "Пример программы на ассемблере для win32", 0
menu_name	db "ZZZ_Menu", 0
test_msg	db "Вы выбрали пункт TEST", 0
open_msg	db "Вы выбрали пункт OPEN", 0
save_msg	db "Вы выбрали пункт SAVE", 0
; структура - класс окна
wc WNDCLASSEX <4*12,CS_HREDRAW or CS_VREDRAW,offset win_proc,0,0,?,?,?,COLOR_WINDOW+1,0,offset class_name,0>
	.data?
msg_ MSG <?,?,?,?,?,?>
	.code
_start:
	xor	ebx, ebx
	push	ebx
	call	GetModuleHandle
	mov	esi, eax
	mov	dword ptr wc.hInstance, eax

	push	IDI_APPLICATION
	push	ebx
	call	LoadIcon
	mov	wc.hIcon, eax

	push	IDC_ARROW
	push	ebx
	call	LoadCursor
	mov	wc.hCursor, eax
	push	offset wc
	call	RegisterClassEx

	push	offset menu_name
	push	esi
	call	LoadMenu
	call	view

	mov	ecx, CW_USEDEFAULT
	push	ebx
	push	esi
	push	eax
	push	ebx
	push	ecx
	push	ecx
	push	ecx
	push	ecx
	push	WS_OVERLAPPEDWINDOW
	push	offset window_name
	push	offset class_name
	push	ebx
	call	CreateWindowEx
	push	eax
	push	SW_SHOWNORMAL
	push	eax
	call	ShowWindow
	call	UpdateWindow
	
	mov	edi, offset msg_
message_loop:
	push	ebx
	push	ebx
	push	ebx
	push	edi
	call	GetMessage	;с ожиданием
	test	eax, eax
	jz	exit_msg_loop
	push	edi
	call	TranslateMessage
	push	edi
	call	DispatchMessage
	jmp	short message_loop
exit_msg_loop:
	push	ebx
	call	ExitProcess

win_proc	proc
	push	ebp
	mov	ebp, esp
	wp_hWnd		equ dword ptr [ebp+08h]
	wp_uMsg		equ dword ptr [ebp+0Ch]
	wp_wParam	equ dword ptr [ebp+10h]
	wp_lParam	equ dword ptr [ebp+14h]
	cmp	wp_uMsg, WM_DESTROY
	jne	not_wm_destroy
	push	0
	call	PostQuitMessage
	jmp	short end_wm_check
not_wm_destroy:
	cmp	wp_uMsg, WM_COMMAND
	jne	not_wm_command
	mov	eax, wp_wParam
	jmp	dword ptr menu_handlers[eax*4]

menu_handlers	dd	offset menu_test, offset menu_open
		dd	offset menu_save, offset menu_exit

menu_test:
	mov	eax, offset test_msg
	jmp 	short show_msg
menu_open:
	mov	eax, offset open_msg
	jmp	short show_msg
menu_save:
	mov	eax, offset save_msg
show_msg:
	push	MB_OK
	push	offset menu_name
	push	eax
	push	wp_hWnd
	call	MessageBox
	jmp	short end_wm_check
menu_exit:
	push	wp_hWnd
	call	DestroyWindow
end_wm_check:
	leave
	xor	eax, eax
	ret	16
not_wm_command:
	leave
	jmp	DefWindowProc
	
win_proc	endp

view		proc	near

	push	eax
	push	eax
	shl	eax, 4
	shr	al, 4
	cmp	al, 10
	sbb	al, 69h
	das
	mov	byte ptr _eax_reg_7, al
	shr	ax, 4
	shr	al, 4
	cmp	al, 10
	sbb	al, 69h
	das
	mov	byte ptr _eax_reg_6, al
	shr	ax, 8
	cmp	al, 10
	sbb	al, 69h
	das
	mov	byte ptr _eax_reg_5, al
	shr	eax, 12
	shr	al, 4
	cmp	al, 10
	sbb	al, 69h
	das
	mov	byte ptr _eax_reg_4, al
	pop	eax
	shr	eax, 12
	shr	al, 4
	cmp	al, 10
	sbb	al, 69h
	das
	mov	byte ptr _eax_reg_3, al
	shr	eax, 4
	shr	al, 4
	cmp	al, 10
	sbb	al, 69h
	das
	mov	byte ptr _eax_reg_2, al
	shr	ax, 4
	shr	al, 4
	cmp	al, 10
	sbb	al, 69h
	das
	mov	byte ptr _eax_reg_1, al
	shr	ax, 8
	cmp	al, 10
	sbb	al, 69h
	das
	mov	byte ptr _eax_reg_, al
	push	MB_ICONINFORMATION
	push	offset xyz_title
	push	offset xyz_msg
	push	0
	call	MessageBox
	pop	eax
	ret

view	endp

	end	_start	