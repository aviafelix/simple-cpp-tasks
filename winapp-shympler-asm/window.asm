;window.asm
include def32.inc
include kernel32.inc
include user32.inc
	.386
	.model flat
	.data
class_name	db "window class 1", 0
window_name	db "Пример на ассемблере win32", 0
; структура - класс окна
wc WNDCLASSEX <4*12,CS_HREDRAW or CS_VREDRAW,offset win_proc,0,0,?,?,?,\
		COLOR_WINDOW+1,0,offset class_name,0>
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

	mov	ecx, CW_USEDEFAULT
	push	ebx
	push	esi
	push	ebx
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
	leave
	jmp	DefWindowProc
end_wm_check:
	leave
	ret	16
win_proc	endp
	end	_start	