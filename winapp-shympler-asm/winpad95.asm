;winpad95.asm

include def32.inc
include user32.inc
include kernel32.inc
include comdlg32.inc

ID_MENU		equ	700h
ID_ACCEL	equ	701h
ID_ABOUT	equ	702h

MAXSIZE		equ	260
MEMSIZE		equ	65535

EditID		equ	1

	.386
	.model	flat
;	.const
	.data

c_w_name db "Asmpad95",0
edit_class db "edit",0
mname		db	"ID_MENU",0
changes_msg db "Сохранить изменения?", 0
filter_string db "Все Файлы",0,"*.*",0
	      db "Текстовые файлы",0,"*.txt",0,0
; [<!>]
bad_title	db "Ужасное происшествие!",0
bad_msg		db "Внимание! Окно не открылось...",0
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
ofn OPENFILENAME <SIZE ofn,?,?,offset filter_string,?,?,?,offset buffer,\
			MAXSIZE,0,?,?,?,?,?,?,0,?,?,?>
wc WNDCLASSEX <4*12 , CS_HREDRAW or CS_VREDRAW,offset win_proc,0,0,?,?,?,\
			COLOR_WINDOW+1,ID_MENU,offset c_w_name,0>
flag_untitled	db	1
	.data?
h_editwindow	dd	?
h_accel		dd	?
p_memory	dd	?
SizeReadWrite	dd	?
msg_		MSG	<>
rec		RECT	<>
buffer		db	MAXSIZE dup (?)
window_title	db	MAXSIZE dup (?), 12 dup (?)
	.code
_start:
	call	GetCommandLine
	mov	edi, eax
	mov	al, ' '
	mov	ecx, MAXSIZE
	repne	scasb
	cmp	byte ptr [edi], 0
	je	cmdline_empty
	mov	esi, edi
	mov	edi, offset buffer
	rep	movsb
	mov	flag_untitled, 0
cmdline_empty:

	xor	ebx, ebx
	push	ebx
	call	GetModuleHandle
	mov	esi, eax
	mov	wc.hInstance, eax
	mov	ofn._hInstance, eax

	push	IDI_APPLICATION ;IDI_ICON, если иконка есть в ресурсах
	push	ebx		 ;esi --,,--
	call	LoadIcon
	mov	wc.hIcon, eax

	push	IDC_ARROW
	push	ebx
	call	LoadCursor
	mov	wc.hCursor, eax

	push	offset wc
	call	RegisterClassEx
	call	view

	push	offset mname
	push	esi
	call	LoadMenu
	call	view
	
	push	ebx
	push	esi
	push	eax
	push	ebx
	push	200
	push	300
	push	CW_USEDEFAULT
	push	CW_USEDEFAULT
	push	WS_OVERLAPPEDWINDOW
	push	offset c_w_name
	push	offset c_w_name
	push	WS_EX_CLIENTEDGE
	call	CreateWindowExA

	cmp	eax, 0
	jnz	verywell
	push	MB_ICONINFORMATION
	push	offset bad_title
	push	offset bad_msg
	push	0
	call	MessageBox
	mov	msg_.wParam, eax
	jnz	short exit_msg_loop
verywell:
	push	eax
	push	eax
	push	SW_SHOWNORMAL
	push	eax
	call	ShowWindow
	call	UpdateWindow
	push	ID_ACCEL
	push	esi
	call	LoadAccelerators
	mov	h_accel, eax
	pop	esi
	mov	edi, offset msg_
message_loop:
	push	ebx
	push	ebx
	push	ebx
	push	edi
	call	GetMessage
	test	eax, eax
	jz	exit_msg_loop
	push	edi
	push	h_accel
	push	esi
	call	TranslateAccelerator
	test	eax, eax
	jnz	message_loop
	push	edi
	call	TranslateMessage
	push	edi	
	call	DispatchMessage
	jmp	short message_loop
exit_msg_loop:
	push	msg_.wParam
	call	ExitProcess

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

win_proc	proc	near

wp_hWnd equ dword ptr [ebp+08h]
wp_uMsg equ dword ptr [ebp+0Ch]
wp_wParam equ dword ptr [ebp+10h]
wp_lParam equ dword ptr [ebp+14h]

	push	ebp
	mov	ebp, esp
	pusha
	xor	ebx, ebx
	mov	esi, wp_hWnd
	mov	eax, wp_uMsg

	cmp	eax, WM_CREATE
	je	h_wm_create
	cmp	eax, WM_SIZE
	je	h_wm_size
	cmp	eax, WM_DESTROY
	je	h_wm_destroy
	cmp	eax, WM_COMMAND
	je	h_wm_command
	cmp	eax, WM_ACTIVATE
	je	h_wm_activate
	cmp	eax, WM_CLOSE
	je	h_wm_close
def_proc:
	popa
	leave
	jmp	DefWindowProc

h_wm_close:
	call	save_contents
	jmp	short def_proc

h_wm_create:
	push	ebx
	push	wc.hInstance
	push	EditID
	push	esi
	push	ebx
	push	ebx
	push	ebx
	push	WS_VISIBLE or WS_CHILD or ES_LEFT or ES_MULTILINE or ES_AUTOHSCROLL or ES_AUTOVSCROLL
	push	ebx
	push	offset edit_class
	push	ebx
	call	CreateWindowEx
	mov	h_editwindow, eax
	push	eax
	call	SetFocus
	cmp	flag_untitled, 1
	je	continue_create
	call	skip_getopen
continue_create:
	call	set_title
	jmp	end_wm_check
h_wm_command:
	mov eax, wp_wParam
	cwde
	sub	eax, 100h
	jb	def_proc

	call	dword ptr menu_handlers[eax*4]
	jmp	end_wm_check
menu_handlers dd offset h_idm_new, offset h_idm_open, offset h_idm_save
	dd offset h_idm_saveas, offset h_idm_exit, offset h_idm_about
	dd offset h_idm_undo, offset h_idm_cut, offset h_idm_copy
	dd offset h_idm_paste, offset h_idm_clear, offset h_idm_setsel

h_idm_setsel:
	push	-1
	push	ebx
	push	EM_SETSEL
	push	h_editwindow
	call	SendMessage
	ret
h_idm_clear:
	mov	eax, WM_CLEAR
	jmp	short	send_to_editor
h_idm_paste:
	mov	eax, WM_PASTE
	jmp	short	send_to_editor
h_idm_copy:
	mov	eax, WM_COPY
	jmp	short	send_to_editor
h_idm_cut:
	mov	eax, WM_CUT
	jmp	short	send_to_editor
h_idm_undo:
	mov	eax, WM_UNDO
send_to_editor:
	push	ebx
	push	ebx
	push	eax
	push	h_editwindow
	call	SendMessage
	ret
h_idm_new:
	call	save_contents
	mov	byte ptr flag_untitled, 1
	call	set_title
	push	ebx
	push	ebx
	push	WM_SETTEXT
	push	h_editwindow
	call	SendMessage
	ret
h_idm_about:
	push	ebx
	push	offset about_proc
	push	esi
	push	ID_ABOUT
	push	wc.hInstance
	call	DialogBoxParam
	ret
h_idm_save:
	cmp	flag_untitled, 1
	jne	skip_getsave
h_idm_saveas:
	mov	ofn.Flags, OFN_EXPLORER or OFN_OVERWRITEPROMPT
	push	offset ofn
	call	GetSaveFileName
	test	eax, eax
	jz	file_save_failed
skip_getsave:
	push	ebx
	push	FILE_ATTRIBUTE_ARCHIVE
	push	CREATE_ALWAYS
	push	ebx
	push	FILE_SHARE_READ or FILE_SHARE_WRITE
	push	GENERIC_READ or GENERIC_WRITE
	push	offset buffer
	call	CreateFile
	mov	edi, eax

	push	MEMSIZE
	push	GMEM_MOVEABLE or GMEM_ZEROINIT
	call	GlobalAlloc
	push	eax
	push	eax
	call	GlobalLock
	mov	esi, eax
	push	MEMSIZE-1
	push	WM_GETTEXT
	push	h_editwindow
	call	SendMessage

	push	esi
	call	lstrlen
	push	ebx
	push	offset SizeReadWrite
	push	eax
	push	esi
	push	edi
	call	WriteFile
	push	esi
	call	GlobalUnlock
	call	GlobalFree
	push	edi
	call	CloseHandle

	push	ebx
	push	ebx
	push	EM_SETMODIFY
	push	h_editwindow
	call	SendMessage
	mov	byte ptr flag_untitled, 0
	call	set_title
file_save_failed:
	push	h_editwindow
	call	SetFocus
	ret

h_idm_open:
	call	save_contents
	mov	ofn.Flags, OFN_FILEMUSTEXIST or OFN_PATHMUSTEXIST or OFN_EXPLORER
	push	offset ofn
	call	GetOpenFileName
	test	eax, eax
	jz	file_open_failed
skip_getopen:
	push	ebx
	push	FILE_ATTRIBUTE_ARCHIVE
	push	OPEN_EXISTING
	push	ebx
	push	FILE_SHARE_READ or FILE_SHARE_WRITE
	push	GENERIC_READ or GENERIC_WRITE
	push	offset buffer
	call	CreateFile
	mov	edi, eax

	push	MEMSIZE
	push	GMEM_MOVEABLE or GMEM_ZEROINIT
	call	GlobalAlloc
	push	eax
	push	eax
	call	GlobalLock
	push	eax
	push	eax

	push	ebx
	push	offset SizeReadWrite
	push	MEMSIZE-1
	push	eax
	push	edi
	call	ReadFile

	push	ebx
	push	WM_SETTEXT
	push	h_editwindow
	call	SendMessage

	call	GlobalUnlock
	call	GlobalFree
	push	edi
	call	CloseHandle
	mov	byte ptr flag_untitled, 0
	call	set_title
file_open_failed:
	push	h_editwindow
	call	SetFocus
	ret

h_idm_exit:
	call	save_contents
	push	esi
	call	DestroyWindow
	ret

h_wm_size:
	push	offset rec
	push	esi
	call	GetClientRect
	push	1
	push	rec.bottom
	push	rec.right
	push	ebx
	push	ebx
	push	h_editwindow
	call	MoveWindow
	jmp	short	end_wm_check

h_wm_activate:
	push	h_editwindow
	call	SetFocus
	jmp	short	end_wm_check
h_wm_destroy:
	push	ebx
	call	PostQuitMessage
end_wm_check:
	popa
	xor	eax, eax
	leave
	ret	16

set_title:
	push	esi
	push	edi
	mov	edi, offset window_title
	cmp	byte ptr flag_untitled, 1
	je	untitled
	mov	esi, ofn.lpstrFile
	movzx	eax, ofn.nFileOffset
	add	esi, eax
copy_filename:
	lodsb
	test	al, al
	jz	add_progname
	stosb
	jmp	short	copy_filename
add_progname:
	mov	dword ptr [edi], '-'
	add	edi, 3
	mov	esi, offset c_w_name
	mov	ecx, 9
	rep	movsb
	pop	edi
	pop	esi
	push	offset window_title
	push	esi
	call	SetWindowText
	ret

untitled:
	mov	dword ptr [edi], 'itnU'
	mov	dword ptr [edi+4], 'delt'
	add	edi, 8
	jmp	short add_progname

save_contents:
	push	ebx
	push	ebx
	push	EM_GETMODIFY
	push	h_editwindow
	call	SendMessage
	test	eax, eax
	jz	not_modified

	push	MB_YESNO+MB_ICONWARNING
	push	offset c_w_name
	push	offset changes_msg
	push	esi
	call	MessageBox
	cmp	eax, IDYES
	jne	not_modified
	call	h_idm_save
not_modified:
	ret

win_proc	endp

about_proc	proc	near

ap_hDlg		equ dword ptr [ebp+08h]
ap_uMsg		equ dword ptr [ebp+0Ch]
ap_wParam	equ dword ptr [ebp+10h]
ap_lParam	equ dword ptr [ebp+14h]

	push	ebp
	mov	ebp, esp
	cmp	ap_uMsg, WM_COMMAND
	jne	dont_proceed
	cmp	ap_wParam, IDOK
	jne	dont_proceed
	push	1
	push	ap_hDlg
	call	EndDialog
dont_proceed:
	xor	eax, eax
	leave
	ret	16

about_proc	endp

	end	_start