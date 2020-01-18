;shympler
include def32.inc
include resource.inc
include user32.inc
include kernel32.inc
include comdlg32.inc
include rex.inc
include shell32.inc
include gdi32.inc
include comctl32.inc
	.386
	.model	flat
.const
HLP db "ShymplerHelp.HTM",0
	.data
well_msg	db "Программа стартовала!",0Ah, 0Dh
		db "Слушайте > "
musname		db "_0.mid",0	;"Вечерний звон.mid",0
		db  260 dup (0)
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
addfiledialname db "IDD_ADDFILES", 0
adddirdialname	db "IDD_ADDDIRS",0
dplaylistname	db "IDD_PLAYLIST",0
dloadingname	db "IDD_LOADING",0
daboutname	db "IDD_ABOUT",0
wclass_name	db "Shymplayer",0
wnd_name	db "Shyar MIDI Player",0
;wndc WNDCLASSEX <4*12 , CS_HREDRAW or CS_VREDRAW,offset maindialogproc,0,0,?,?,?,\
;			COLOR_WINDOW+1,offset mainmenuname,offset wclass_name,0>
icon_n		dd	0	;заменить на 0
showplaylist	db	0
playlistshowed	db	0
minmz		db	1
direction	db	0	;0-вперёд; 1-цикл
cmdp_empty	db	1
InitCtrlEx	INITCOMMONCONTROLSEX_STRUC <8, ICC_STANDARD_CLASSES>
	.data?
hplaylistwnd	dd	?
haddfilewnd	dd	?
hadddirwnd	dd	?
hloading	dd	?
hinst		dd	?
hmenu		dd	?
hdialwnd	dd	?
hicn		dd	9 dup (?)
rectangle	RECT	<>

	.code
_start:
	call	IsDebuggerPresent
	push	offset InitCtrlEx
	call	InitCommonControlsEx
	call	GetCommandLine

;	push	eax

;	push	MB_ICONINFORMATION
;	push	offset xyz_title
;	push	eax
;	push	0
;	call	MessageBox

;	pop	eax

	mov	edi, eax
	mov	al, ' '
	mov	ecx, 260
	repne	scasb
	
	cmp	byte ptr [edi], 0
	je	cmdline_empty

	mov	esi, edi
	mov	edi, offset musname
	rep	movsb
	mov	byte ptr cmdp_empty, 0

cmdline_empty:
	push	MB_ICONINFORMATION
	push	offset xyz_title
	push	offset musname
	push	0
	call	MessageBox
;	jmp	final

	xor	ebx, ebx
	push	ebx
	call	GetModuleHandle
	mov	[hinst], eax

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

	push	[hinst]

	mov	esi, [hinst]
	call	Rex_MIDI_init

	push	0
	push	offset loadingproc
	push	0
	push	offset dloadingname
	push	[hinst]
	call	CreateDialogParam
	mov	dword ptr hloading, eax

	push	offset musname
	call	Rex_MIDI_load

	push	hloading
	call	DestroyWindow

	push	0
	push	offset maindialogproc
	push	0
	push	offset maindialname
	push	[hinst]
	call	DialogBoxParam
	cmp	eax, -1
	jne	final
final:
	call	Rex_MIDI_stop
	call	Rex_MIDI_unload
	call	Rex_MIDI_exit
	push	ebx
	call	ExitProcess

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
	push	ebx
	push	dp_hWnd
	call	EndDialog
	jmp	exit_dp

not_close:
	cmp	dp_uMsg, WM_INITDIALOG
	jne	short check_command

	mov	eax, hicn[0*4] ; ecx*4
	push	eax
	push	ebx
	push	WM_SETICON
	push	dp_hWnd
	call	SendMessage
	push	dp_hWnd
	pop	hdialwnd
;
	cmp	byte ptr cmdp_empty, 0
	je	go_play
;
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
	mov	byte ptr cmdp_empty, 1

	push	offset musname
	call	lstrlen
	push	ebx
	push	offset musname
	push	10
	push	10
	push	hdialwnd
	call	TextOut

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
	jmp	exit_dp
check_direct:
	cmp	ax, IDDIRECTION
	jne	check_addfile
change_direction:
	cmp	direction, 0
	je	setdirection
	mov	direction, 0
	jmp	exit_dp
setdirection:
	mov	direction, 1
	jmp	exit_dp
check_addfile:
	cmp	ax, IDADDFILE
	jne	check_adddir
addfiles:
	push	0
	push	offset addfileproc
	push	0
	push	offset addfiledialname
	push	[hinst]
	call	DialogBoxParam
	jmp	exit_dp
check_adddir:
	cmp	ax, IDADDDIR
	jne	check_about
adddir:
	push	0
	push	offset adddirproc
	push	0
	push	offset adddirdialname
	push	[hinst]
	call	DialogBoxParam
	jmp	exit_dp
check_about:
	cmp	ax, IDABOUT
	jne	check_help
about:
	push	0
	push	offset aboutproc
	push	0
	push	offset daboutname
	push	[hinst]
	call	DialogBoxParam
	jmp	exit_dp
check_help:
	cmp	ax, IDHELP
	jne	exit_dp
help:
	push	0
	push	0
	push	0
	push	offset HLP
	push	0
	push	0
	call	ShellExecute
	jmp	exit_dp
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
	cmp	eax, IDADDFILE
	je	addfiles
	cmp	eax, IDADDDIR
	je	adddir
	jmp	short exit_dp
minimsize:
	cmp	minmz, 0
	je	showplist
	jmp	closeplaylist
ondesctop:
;	call	icondesctop
;	jmp	short exit_dp
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

addfileproc proc near

af_hWnd equ dword ptr [ebp+08h]
af_uMsg equ dword ptr [ebp+0Ch]
af_wParam equ dword ptr [ebp+10h]
af_lParam equ dword ptr [ebp+14h]

	push	ebp
	mov	ebp, esp
	pusha	
	xor	ebx, ebx

	cmp	af_uMsg, WM_CLOSE
	jne	not_close_af
close_af:
	push	ebx
	push	af_hWnd
	call	EndDialog
	jmp	exit_af

not_close_af:
	cmp	af_uMsg, WM_INITDIALOG
	jne	short exit_af
exit_af:
	popa
	xor	eax, eax
	leave
	ret	16
addfileproc endp

adddirproc proc near

ad_hWnd equ dword ptr [ebp+08h]
ad_uMsg equ dword ptr [ebp+0Ch]
ad_wParam equ dword ptr [ebp+10h]
ad_lParam equ dword ptr [ebp+14h]

	push	ebp
	mov	ebp, esp
	pusha	
	xor	ebx, ebx

	cmp	ad_uMsg, WM_CLOSE
	jne	not_close_ad
close_ad:
	push	ebx
	push	ad_hWnd
	call	EndDialog
	jmp	exit_ad

not_close_ad:
	cmp	ad_uMsg, WM_INITDIALOG
	jne	exit_ad

exit_ad:
	popa
	xor	eax, eax
	leave
	ret	16
adddirproc endp

loadingproc proc near

ld_hWnd equ dword ptr [ebp+08h]
ld_uMsg equ dword ptr [ebp+0Ch]
ld_wParam equ dword ptr [ebp+10h]
ld_lParam equ dword ptr [ebp+14h]

	push	ebp
	mov	ebp, esp
	pusha	
	xor	ebx, ebx

	cmp	ld_uMsg, WM_CLOSE
	jne	not_close_ld
close_ld:

	push	ld_hWnd
	call	DestroyWindow

	jmp	exit_ld

not_close_ld:
	cmp	ld_uMsg, WM_INITDIALOG
	jne	exit_ld

exit_ld:
	popa
	xor	eax, eax
	leave
	ret	16
loadingproc endp

aboutproc proc near

ab_hWnd equ dword ptr [ebp+08h]
ab_uMsg equ dword ptr [ebp+0Ch]
ab_wParam equ dword ptr [ebp+10h]
ab_lParam equ dword ptr [ebp+14h]

	push	ebp
	mov	ebp, esp
	pusha	
	xor	ebx, ebx

	cmp	ab_uMsg, WM_CLOSE
	jne	not_close_ab
close_ab:

	push	ab_hWnd
	call	DestroyWindow

	jmp	exit_ab

not_close_ab:

	cmp	ab_uMsg, WM_INITDIALOG
	jne	ch_butt
	jmp	exit_ab
ch_butt:
	cmp	ab_lParam, 0
	je	ab_butt_msg	;Сообщения от кнопок
	jmp	exit_ab
ab_butt_msg:
	cmp	ab_wParam , IDOK
	je	close_ab
exit_ab:
	popa
	xor	eax, eax
	leave
	ret	16
aboutproc endp

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

end	_start
