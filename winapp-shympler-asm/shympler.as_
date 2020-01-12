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
musname		db "music5.mid", 0	;"Вечерний звон.mid",0
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
dmesloading	db "IDD_LOADING",0
wclass_name	db "Shymplayer",0
wnd_name	db "Shyar MIDI Player",0
;wndc WNDCLASSEX <4*12 , CS_HREDRAW or CS_VREDRAW,offset maindialogproc,0,0,?,?,?,\
;			COLOR_WINDOW+1,offset mainmenuname,offset wclass_name,0>
icon_n	dd	1	;заменить на 0
showplaylist	db	0
playlistshowed	db	0
minmz		db	1
direction	db	0	;0-вперёд; 1-цикл
midi_loaded	db	0
exitflag	db	0
		db	2 dup (0)
	.data?
hplaylistwnd	dd	?
hinst		dd	?
hmenu		dd	?
hdialwnd	dd	?
hloadingwnd	dd	?
hicn		dd	9 dup (?)
rectangle	RECT	<>
	.code
start:
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


	push	0
	push	offset maindialogproc
	push	0
	push	offset maindialname
	push	[hinst]
	call	CreateDialogParam
	mov	hdialwnd, eax
doloopon:

	cmp	exitflag, 1
	call	view
	jne	doloopon;final

final:
	push	hdialwnd
	call	DestroyWindow

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
	cmp	midi_loaded, 1
	jne	its_all
	call	Rex_MIDI_stop
	call	Rex_MIDI_unload
	call	Rex_MIDI_exit
its_all:
	push	ebx
	push	dp_hWnd
	call	EndDialog
	mov	exitflag, 1
	jmp	exit_dp

not_close:
	cmp	dp_uMsg, WM_INITDIALOG
	jne	short check_command

	mov	ecx, dword ptr icon_n
	mov	eax, hicn[ecx*4] ; ecx*4
	push	eax
	push	ebx
	push	WM_SETICON
	push	dp_hWnd
	call	SendMessage
	cmp	showplaylist, 1
	je	showplist
	jmp	exit_dp

check_command:
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
	call	Rex_MIDI_play
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
	jne	check_addfiles
closeplaylist:
	cmp	playlistshowed, 0
	je	exit_dp
	push	hplaylistwnd
	call	DestroyWindow
	mov	playlistshowed, 0
check_addfiles:
	cmp	ax, IDADDFILE
	jne	check_remfile
addfiles:
	cmp	midi_loaded, 0
	jne	exit_dp

	push	dp_hWnd
	call	Rex_MIDI_init

	push	0
	push	offset loadingproc
	push	0
	push	offset dmesloading
	push	[hinst]
	call	CreateDialogParam
	mov	hloadingwnd, eax

	push	offset musname
	call	Rex_MIDI_load	; bl - LoadFlag; 0-прочитано
	mov	byte ptr midi_loaded, 1

	push	hloadingwnd
	call	DestroyWindow

	call	view

	jmp	short exit_dp
check_remfile:
	cmp	ax, IDREMFILE
	jne	exit_dp	;check_...
rem_file:
	cmp	byte ptr midi_loaded, 1
	jne	exit_dp

	call	Rex_MIDI_stop
	call	Rex_MIDI_unload
	call	Rex_MIDI_exit

	mov	byte ptr midi_loaded, 0
	jmp	short exit_dp
butt_msg:
	cmp	eax, IDNEXTICON
	je	ch_icon
	cmp	eax, IDPLAY
	je	go_play
	cmp	eax, IDSTOP
	je	go_stop
	cmp	eax, IDADDFILE
	je	addfiles
	cmp	eax, IDREMFILE
	je	rem_file
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
close_pl:
	push	pl_hWnd
	call	DestroyWindow
	mov	playlistshowed, 0
	jmp	exit_pl

not_close_pl:
	cmp	pl_uMsg, WM_INITDIALOG
	jne	short exit_pl;check_cmd
exit_pl:
	popa
	xor	eax, eax
	leave
	ret	16
playlistproc	endp

loadingproc proc near

lp_hWnd equ dword ptr [ebp+08h]
lp_uMsg equ dword ptr [ebp+0Ch]
lp_wParam equ dword ptr [ebp+10h]
lp_lParam equ dword ptr [ebp+14h]

	push	ebp
	mov	ebp, esp
	pusha	
	xor	ebx, ebx

	cmp	pl_uMsg, WM_CLOSE
	jne	not_close_lp
close_lp:
	push	pl_hWnd
	call	DestroyWindow
	mov	playlistshowed, 0
	jmp	exit_lp

not_close_lp:
	cmp	pl_uMsg, WM_INITDIALOG
	jne	short exit_lp
exit_lp:
	popa
	xor	eax, eax
	leave
	ret	16
loadingproc	endp
comment %
resize proc near
	push	offset	rectangle
	push	hdialwnd
	call	GetClientRect
	dec	rectangle.left
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