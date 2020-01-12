;shympler
include def32.inc
include resource.inc
include user32.inc
include kernel32.inc
include comdlg32.inc
include rex.inc
	.386
	.model	flat
	.data
well_msg	db "Программа стартовала!",0Ah, 0Dh
		db "Слушайте > "
musname		db "_0.mid",0
err_msg		db "Внимание! Произошла ошибка создания окна!",0
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
message_	db "Произошла ошибка инициализации REX!",0
mainmenuname	db "IDM_MAINMENU",0
maindialname	db "IDD_MAIN",0
dplaylistname	db "IDD_PLAYLIST",0
wclass_name	db "Shymplayer",0
wnd_name	db "Shyar MIDI Player",0

wc WNDCLASSEX <4*12,CS_HREDRAW or CS_VREDRAW,offset maindialogproc,0,0,?,?,?,\
		COLOR_WINDOW+1,0,offset wclass_name,0>

;wc		WNDCLASSEX <>
icon_n	dd	1	;заменить на 0
showplaylist	db	1
playlistshowed	db	0
minmz		db	1
direction	db	0	;0-вперёд; 1-цикл
	.data?
hplaylistwnd	dd	?
hinst		dd	?
hmenu		dd	?
hdialwnd	dd	?
hicn		dd	9 dup (?)
rectangle	RECT	<>
msg_ MSG <?,?,?,?,?,?>
comment ~
WNDCLASSEX		struc
	cbSize		dd	?
	style		dd	?
	lpfnWndProc	dd	?
	cbClsExtra	dd	?
	cbWndExtra	dd	?
	hInstance	dd	?
	hIcon		dd	?
	hCursor		dd	?
	hbrBackground	dd	?
	lpszMenuName	dd	?
	lpszClassName	dd	?
	hIconSm		dd	?
WNDCLASSEX	ends
MSG			struc
	hwnd		dd	?
	message		dd	?
	wParam		dd	?
	lParam		dd	?
	time		dd	?
	pt		dd	?
MSG		ends

    LPVOID      lpCreateParams;
    HINSTANCE   hInstance;
    HMENU       hMenu;
    HWND        hwndParent;
    int         cy;
    int         cx;
    int         y;
    int         x;
    LONG        style;
    LPCSTR      lpszName;
    LPCSTR      lpszClass;
    DWORD       dwExStyle;
~
	.code
start:
	xor	ebx, ebx
	push	ebx
	call	GetModuleHandle
	mov	[hinst], eax

	mov	esi, eax	; Помещаем идентификатор процесса в переменную
	mov	dword ptr wc.hInstance, eax


;Загружаем иконки
	mov	ecx, 9
lpc:

	push	ecx
	push	ecx
	push	[hinst]
	call	LoadIcon
	pop	ecx

	dec	ecx
	mov	dword ptr hicn[ecx*4], eax
	inc	ecx
	loop	lpc

;Стиль окна

	mov	dword ptr wc.cbSize, 4*12
	mov	dword ptr wc.style, CS_HREDRAW or CS_VREDRAW ; CS_: CLASSDC PARENTDC GLOBALCLASS
	mov	dword ptr wc.lpfnWndProc, offset maindialogproc

	mov	dword ptr wc.cbClsExtra, 0
	mov	dword ptr wc.cbWndExtra, 0

	mov	ecx, icon_n
	mov	eax, dword ptr hicn[ecx*4]
	mov	dword ptr wc.hIcon, eax

	push	IDC_ARROW;IDC_CROSS
	push	0
	call	LoadCursor
	mov	dword ptr wc.hCursor, eax

;Цвет окна
	mov	dword ptr wc.hbrBackground, COLOR_WINDOW+1;6

	mov	dword ptr wc.lpszMenuName, offset mainmenuname
	mov	dword ptr wc.lpszClassName, offset wclass_name
	mov	dword ptr wc.hIconSm, 0

;Регистрируем класс
	push	offset wc
	call	RegisterClassEx

;Загружаем меню из ресурсов

	push	offset mainmenuname
	push	[hinst]
	call	LoadMenu

	mov	hmenu, eax

	xor	ebx, ebx
	mov	esi, [hinst]
	mov	eax, [hmenu]

;Создаём ГЛАВНОЕ ОКНО

	push	ebx			; Адрес стр-ры  CreateStruc (null)

	push	esi			; Идентификатор процесса - получателя сообщений от окна
	push	ebx;eax			; Идентификатор меню или окна - потомка

	push	ebx			; Идентификатор окна-предка

	push	86			; Высота
	push	190			; Ширина

	push	70			; Y-координата
	push	180			; X-координата

				; Стиль окна
	push	WS_MINIMIZEBOX or WS_VISIBLE or WS_CAPTION or WS_SYSMENU or WS_POPUP
;DS_SYSMODAL or DS_SETFOREGROUND or DS_3DLOOK or 

	push	offset wnd_name		; Заголовок окна
	push	offset wclass_name		; Название зарегистрированного класса
	push	ebx			; Дополнительный стиль

	call	CreateWindowEx
	mov	[hdialwnd], eax

;Проверяем на ошибку
	test	eax, eax
	jne	wellstart
;Окно не создано

	push	MB_ICONINFORMATION
	push	offset wnd_name
	push	offset err_msg
	push	[hinst]
	call	MessageBox

	jmp	wnd_not_create	; завершаем программу

; Успешный (Success) Старт
wellstart:
	push	eax		; Для UpdateWindow

	push	SW_SHOWNORMAL   ;}\
	push	eax		;}/ Для ShowWindow
	call	ShowWindow

	call	UpdateWindow

;Инициируем MIDI
	push	[hinst]
	call	Rex_MIDI_init

	push	offset musname
	call	Rex_MIDI_load


final:
	call	Rex_MIDI_stop
	call	Rex_MIDI_unload
	call	Rex_MIDI_exit
wnd_not_create:
	push	ebx
	call	ExitProcess
%
; ============== = = = = = = = = ===================

maindialogproc	proc	near

dp_hWnd equ dword ptr [ebp+08h]
dp_uMsg equ dword ptr [ebp+0Ch]
dp_wParam equ dword ptr [ebp+10h]
dp_lParam equ dword ptr [ebp+14h]

	push	ebp
	mov	ebp, esp
	pusha	
	xor	ebx, ebx

	cmp	dp_uMsg, WM_CLOSE
	jne	not_close
close_dp:
;	push	ebx
;	push	dp_hWnd
;	call	EndDialog
	jmp	exit_dp

not_close:
	cmp	dp_uMsg, WM_CREATE
	jne	short check_command

	mov	eax, hicn[0*4] ; ecx*4
	push	eax
	push	ebx
	push	WM_SETICON
	push	dp_hWnd
	call	SendMessage
;	push	dp_hWnd
;	pop	hdialwnd
	cmp	showplaylist, 1
	je	showplist
	jmp	exit_dp

check_command:
	cmp	dp_uMsg, WM_SIZE
	je	minimsize
	cmp	dp_uMsg, WM_COMMAND
	jne	exit_dp

	mov	eax, dp_wParam
	cmp	dp_lParam, 0
	jne	butt_msg	;Сообщения от кнопок

	cmp	ax, IDNEXTICON
	jne	check_exit

ch_icon:
	cmp	dword ptr icon_n, 8
	jne	nexticon
	mov	dword ptr icon_n, -1

nexticon:

	inc	dword ptr icon_n
	mov	ecx, dword ptr icon_n
	mov	eax, hicn[ecx*4] ;

	push	eax
	push	ebx
	push	WM_SETICON
	push	dp_hWnd
	call	SendMessage
	jmp	exit_dp
check_exit:

	cmp	ax, IDEXIT
	je	close_dp

check_play:
	cmp	ax, IDPLAY
	jne	check_stop
go_play:
	cmp	direction, 0
	jne	playlooped
	call	Rex_MIDI_play
	jmp	exit_dp
playlooped:
	call	Rex_MIDI_playlooped
	jmp	exit_dp
check_stop:
	cmp	ax, IDSTOP
	jne	check_showpl
go_stop:
	call	Rex_MIDI_stop
check_showpl:
	cmp	ax, IDSHOWPL
	jne	check_closepl
showplist:
	cmp	playlistshowed, 1
	je	exit_dp
	mov	minmz, 1
	push	0
	push	offset playlistproc
	push	0
	push	offset dplaylistname
	push	[hinst]
	call	CreateDialogParam
	mov	hplaylistwnd, eax
	mov	playlistshowed, 1
	jmp	exit_dp
check_closepl:
	cmp	ax, IDCLOSEPL
	jne	check_direct
closeplaylist:
	cmp	playlistshowed, 0
	je	exit_dp
	mov	minmz, 0
	push	hplaylistwnd
	call	DestroyWindow
	mov	playlistshowed, 0
	jmp	short exit_dp
check_direct:
	cmp	ax, IDDIRECTION
	jne	exit_dp
change_direction:
	cmp	direction, 0
	je	setdirection
	mov	direction, 0
	jmp	short exit_dp
setdirection:
	mov	direction, 1
	jmp	short exit_dp
butt_msg:
	cmp	eax, IDNEXTICON
	je	ch_icon
	cmp	eax, IDPLAY
	je	go_play
	cmp	eax, IDSTOP
	je	go_stop
	cmp	eax, IDDIRECTION
	je	change_direction
	cmp	eax, IDSETICONDESCT
	je	ondesctop
	jmp	short exit_dp
minimsize:
	cmp	minmz, 0
	je	showplist
	jmp	closeplaylist
ondesctop:
;	call	icondesctop
	jmp	short exit_dp
exit_dp:

	popa
	xor	eax, eax
	leave
	ret	16

maindialogproc	endp

playlistproc proc near

pl_hWnd equ dword ptr [ebp+08h]
pl_uMsg equ dword ptr [ebp+0Ch]
pl_wParam equ dword ptr [ebp+10h]
pl_lParam equ dword ptr [ebp+14h]

	push	ebp
	mov	ebp, esp
	pusha	
	xor	ebx, ebx

	cmp	pl_uMsg, WM_CLOSE
	jne	not_close_pl
	cmp	pl_uMsg, WM_SHOWWINDOW
	je	active
close_pl:
	push	pl_hWnd
	call	DestroyWindow
	mov	playlistshowed, 0
	jmp	exit_pl

not_close_pl:
	cmp	pl_uMsg, WM_INITDIALOG
	jne	short exit_pl
active:
	cmp	playlistshowed, 0
	je	exit_pl
	push	SW_NORMAL
	push	[hplaylistwnd]
	call	ShowWindow
	jmp	short exit_pl
exit_pl:
	popa
	xor	eax, eax
	leave
	ret	16
playlistproc	endp

;icondesctop	proc	near
;	mov	eax, 0
;	ret
;icondesctop	endp

;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
comment %
resize proc near
	push	offset	rectangle
	push	hdialwnd
	call	GetClientRect
	jz	exit_resize
	push	0
	push	rectangle.bottom
	push	rectangle.right
	push	rectangle.top
	push	rectangle.left
	push	hdialwnd
	call	MoveWindow
exit_resize:
	ret
resize endp
;===================== = = = = = = = =======================
winproc	proc	near

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
	push	wp_lParam
	push	wp_wParam
	push	eax
	push	esi
	call	DefWindowProc
	popa
	pop	ebp
	mov	eax, 0
	ret	16

endp	winproc
%
;////////////////////////////////////////

;******************************

view		proc	near

	pusha
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
	push	[hinst]
	call	MessageBox
	popa
	ret

view	endp

end	start