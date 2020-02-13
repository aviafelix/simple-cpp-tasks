;windlg.asm
IDC_EDIT	equ	0
IDC_BUTTON	equ	1
IDC_EXIT	equ	2
IDM_GETTEXT	equ	10
IDM_CLEAR	equ	11
IDM_EXIT	equ	12

include def32.inc
include kernel32.inc
include user32.inc

	.386
	.model flat
	.data
dialog_name	db	"ZZZ_Dialog", 0
	.data?
buffer		db	512 dup (?)
	.code
_start:
	xor	ebx, ebx

	push	ebx
	call	GetModuleHandle

	push	ebx
	push	offset dialog_proc
	push	ebx
	push	offset dialog_name
	push	eax
	call	DialogBoxParam

	push	ebx
	call	ExitProcess

dialog_proc	proc	near
	push	ebp
	mov	ebp, esp
dp_hWnd equ dword ptr [ebp+08h]
dp_uMsg equ dword ptr [ebp+0Ch]
dp_wParam equ dword ptr [ebp+10h]
dp_lParam equ dword ptr [ebp+14h]
	mov	ecx, dp_hWnd
	mov	eax, dp_uMsg
	cmp	eax, WM_INITDIALOG
	jne	not_initdialog
	push	IDC_EDIT
	push	dp_hWnd
	call	GetDlgItem
	push	eax
	call	SetFocus
not_initdialog:
	cmp	eax, WM_CLOSE
	jne	not_close
	push	0
	push	ecx
	call	EndDialog
not_close:
	cmp	eax, WM_COMMAND
	jne	not_command
	mov	eax, dp_wParam
	cmp	dp_lParam, 0
	jne	lParam_not_0
	cmp	ax, IDM_GETTEXT
	jne	not_gettext
	push	512
	push	offset buffer
	push	IDC_EDIT
	push	ecx
	call	GetDlgItemText
	push	MB_OK
	push	offset dialog_name
	push	offset buffer
	push	dp_hWnd
	call	MessageBox
not_gettext:
	cmp	eax, IDM_CLEAR
	jne	not_clear
	push	0
	push	IDC_EDIT
	push	ecx
	call	SetDlgItemText
not_clear:
	cmp	eax, IDM_EXIT
	jne	not_exit
	push	0
	push	ecx
	call	EndDialog
lParam_not_0:
	cmp	eax, IDC_EXIT
	jne	not_exit
	shr	eax, 16
	cmp	eax, BN_CLICKED
	push	0
	push	ecx
	call	EndDialog
not_exit:
	xor	eax, eax
	inc	eax
	leave
	ret	16
not_command:
	xor	eax, eax
	leave
	ret	16
dialog_proc	endp
	end	_start