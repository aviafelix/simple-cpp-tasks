;def32.inc
BN_CLICKED		equ	0

EM_GETHANDLE		equ	0BDh
EM_GETMODIFY		equ	0B8h
EM_SETMODIFY		equ	0B9h
EM_UNDO			equ	0C7h
EM_SETSEL		equ	0B1h

;winbase.h =>
STD_OUTPUT_HANDLE	equ	-11
GMEM_MOVEABLE		equ	2
GMEM_ZEROINIT		equ	40h
OPEN_EXISTING		equ	3
CREATE_ALWAYS		equ	2

;winnt.h
GENERIC_READ		equ	80000000h
GENERIC_WRITE		equ	40000000h
FILE_SHARE_READ		equ	1
FILE_SHARE_WRITE	equ	2
FILE_ATTRIBUTE_ARCHIVE	equ	6

;commdlg.h
OFN_PATHMUSTEXIST	equ	800h
OFN_FILEMUSTEXIST	equ	1000h
OFN_EXPLORER		equ	80000h
OFN_OVERWRITEPROMPT	equ	2

;commctrl.h
ICC_STANDARD_CLASSES    equ	4000h

OPENFILENAME	struc
	StrucSize		dd	?
	hwndOwner		dd	?
	_hInstance		dd	?
	lpstrFilter		dd	?
	lpstrCustomFilter	dd	?
	nMaxCustFilter		dd	?
	nFilterIndex		dd	?
	lpstrFile		dd	?
	nMaxFile		dd	?
	lpstrFileTitle		dd	?
	nMaxFileTitle		dd	?
	lpstrInitialDir		dd	?
	lpstrTitle		dd	?
	Flags			dd	?
	nFileOffset		dw	?
	nFileExtension		dw	?
	lpstrDefExt		dd	?
	lCustData		dd	?
	lpfnHook		dd	?
	lpTemplateName		dd	?
OPENFILENAME	ends

;windef.h
RECT	struc
	left	dd	?
	top	dd	?
	right	dd	?
	bottom	dd	?
RECT	ends

INITCOMMONCONTROLSEX_STRUC struc
	dwSize	dd	?
	dwICC	dd	?
INITCOMMONCONTROLSEX_STRUC ends

;winerror.h =>
NO_ERROR		equ	0
ERROR_NO_MORE_ITEMS	equ	259

;winnetwk.h =>
RESOURCEUSAGE_CONNECTABLE	equ	1
RESOURCETYPE_ANY		equ	0
RESOURCE_CONNECTED	equ	1
NTRESOURCE struc
	dwScope		dd	?
	dwType		dd	?
	dwDisplayType	dd	?
	dwUsage		dd	?
	lpLocalName	dd	?
	lpRemoteName	dd	?
	lpComment	dd	?
	lpProvidor	dd	?
NTRESOURCE ends

;winuser.h =>
;  MessageBox type flags
;
MB_OK                   equ  0000H
MB_OKCANCEL             equ  0001H
MB_ABORTRETRYIGNORE     equ  0002H
MB_YESNOCANCEL          equ  0003H
MB_YESNO                equ  0004H
MB_RETRYCANCEL          equ  0005H
MB_ICONWARNING		equ  0030h
MB_ICONHAND             equ  0010H
MB_ICONQUESTION         equ  0020H
MB_ICONEXCLAMATION      equ  0030H
MB_ICONASTERISK         equ  0040H
MB_ICONINFORMATION        equ   MB_ICONASTERISK
MB_DEFBUTTON1           equ  0000H
MB_DEFBUTTON2           equ  0100H
MB_DEFBUTTON3           equ  0200H

MB_APPLMODAL            equ  0000H
MB_SYSTEMMODAL          equ  1000H
MB_TASKMODAL            equ  2000H

MB_NOFOCUS              equ  8000H

IDI_APPLICATION		equ	32512	; 7F00h
IDI_HAND        equ 32513
IDI_QUESTION    equ 32514
IDI_EXCLAMATION equ 32515
IDI_ASTERISK    equ 32516

CW_USEDEFAULT		equ	80000000h
;
;  Window State Messages
;
WM_STATE            equ  0000H
WM_NULL             equ  0000h
WM_CREATE           equ  0001h
WM_DESTROY          equ  0002h
WM_MOVE             equ  0003h
WM_SIZE             equ  0005h
WM_ACTIVATE         equ  0006h
WM_SETFOCUS         equ  0007h
WM_KILLFOCUS        equ  0008h
WM_ENABLE           equ  000Ah
WM_SETREDRAW        equ  000Bh
WM_SETTEXT          equ  000Ch
WM_GETTEXT          equ  000Dh
WM_GETTEXTLENGTH    equ  000Eh
WM_PAINT            equ  000Fh
WM_CLOSE            equ  0010h
WM_QUERYENDSESSION  equ  0011h
WM_QUIT             equ  0012h
WM_QUERYOPEN        equ  0013h
WM_ERASEBKGND       equ  0014h
WM_SYSCOLORCHANGE   equ  0015h
WM_ENDSESSION       equ  0016h
WM_SYSTEMERROR      equ  0017h
WM_SHOWWINDOW       equ  0018h
WM_CTLCOLOR         equ  0019h
WM_WININICHANGE     equ  001Ah
WM_DEVMODECHANGE    equ  001Bh
WM_ACTIVATEAPP      equ  001Ch
WM_FONTCHANGE       equ  001Dh
WM_TIMECHANGE       equ  001Eh
WM_CANCELMODE       equ  001Fh
WM_SETCURSOR        equ  0020h
WM_MOUSEACTIVATE    equ  0021h
WM_CHILDACTIVATE    equ  0022h
WM_QUEUESYNC        equ  0023h
WM_GETMINMAXINFO    equ  0024h
WM_PAINTICON        equ  0026h
WM_ICONERASEBKGND   equ  0027h
WM_NEXTDLGCTL       equ  0028h
WM_SPOOLERSTATUS    equ  002Ah
WM_DRAWITEM         equ  002Bh
WM_MEASUREITEM      equ  002Ch
WM_DELETEITEM       equ  002Dh
WM_VKEYTOITEM       equ  002Eh
WM_CHARTOITEM       equ  002Fh
WM_SETFONT          equ  0030h
WM_GETFONT          equ  0031h
WM_QUERYDRAGICON    equ  0037h
WM_COMPAREITEM      equ  0039h
WM_COMPACTING       equ  0041h
WM_COMMNOTIFY       equ  0044h
WM_WINDOWPOSCHANGING equ  0046h
WM_WINDOWPOSCHANGED equ  0047h
WM_POWER            equ  0048h

WM_SETICON	    equ	 0080h
WM_NCCREATE         equ  0081h
WM_NCDESTROY        equ  0082h
WM_NCCALCSIZE       equ  0083h
WM_NCHITTEST        equ  0084h
WM_NCPAINT          equ  0085h
WM_NCACTIVATE       equ  0086h
WM_GETDLGCODE       equ  0087h
WM_NCMOUSEMOVE      equ  00A0h
WM_NCLBUTTONDOWN    equ  00A1h
WM_NCLBUTTONUP      equ  00A2h
WM_NCLBUTTONDBLCLK  equ  00A3h
WM_NCRBUTTONDOWN    equ  00A4h
WM_NCRBUTTONUP      equ  00A5h
WM_NCRBUTTONDBLCLK  equ  00A6h
WM_NCMBUTTONDOWN    equ  00A7h
WM_NCMBUTTONUP      equ  00A8h
WM_NCMBUTTONDBLCLK  equ  00A9h

WM_KEYFIRST         equ  0100h
WM_KEYDOWN          equ  0100h
WM_KEYUP            equ  0101h
WM_CHAR             equ  0102h
WM_DEADCHAR         equ  0103h
WM_SYSKEYDOWN       equ  0104h
WM_SYSKEYUP         equ  0105h
WM_SYSCHAR          equ  0106h
WM_SYSDEADCHAR      equ  0107h
WM_KEYLAST          equ  0108h

WM_INITDIALOG       equ  0110h
WM_COMMAND          equ  0111h
WM_SYSCOMMAND       equ  0112h
WM_TIMER            equ  0113h
WM_HSCROLL          equ  0114h
WM_VSCROLL          equ  0115h
WM_INITMENU         equ  0116h
WM_INITMENUPOPUP    equ  0117h
WM_MENUSELECT       equ  011Fh
WM_MENUCHAR         equ  0120h
WM_ENTERIDLE        equ  0121h


WM_MOUSEFIRST       equ  0200h
WM_MOUSEMOVE        equ  0200h
WM_LBUTTONDOWN      equ  0201h
WM_LBUTTONUP        equ  0202h
WM_LBUTTONDBLCLK    equ  0203h
WM_RBUTTONDOWN      equ  0204h
WM_RBUTTONUP        equ  0205h
WM_RBUTTONDBLCLK    equ  0206h
WM_MBUTTONDOWN      equ  0207h
WM_MBUTTONUP        equ  0208h
WM_MBUTTONDBLCLK    equ  0209h
WM_MOUSELAST        equ  0209h

WM_PARENTNOTIFY     equ  0210h
WM_MDICREATE        equ  0220h
WM_MDIDESTROY       equ  0221h
WM_MDIACTIVATE      equ  0222h
WM_MDIRESTORE       equ  0223h
WM_MDINEXT          equ  0224h
WM_MDIMAXIMIZE      equ  0225h
WM_MDITILE          equ  0226h
WM_MDICASCADE       equ  0227h
WM_MDIICONARRANGE   equ  0228h
WM_MDIGETACTIVE     equ  0229h
WM_MDISETMENU       equ  0230h
WM_DROPFILES        equ  0233h


WM_CUT              equ  0300h
WM_COPY             equ  0301h
WM_PASTE            equ  0302h
WM_CLEAR            equ  0303h
WM_UNDO             equ  0304h
WM_RENDERFORMAT     equ  0305h
WM_RENDERALLFORMATS equ  0306h
WM_DESTROYCLIPBOARD equ  0307h
WM_DRAWCLIPBOARD    equ  0308h
WM_PAINTCLIPBOARD   equ  0309h
WM_VSCROLLCLIPBOARD equ  030Ah
WM_SIZECLIPBOARD    equ  030Bh
WM_ASKCBFORMATNAME  equ  030Ch
WM_CHANGECBCHAIN    equ  030Dh
WM_HSCROLLCLIPBOARD equ  030Eh
WM_QUERYNEWPALETTE  equ  030Fh
WM_PALETTEISCHANGING equ  0310h
WM_PALETTECHANGED   equ  0311h

WM_PENWINFIRST      equ 0380h
WM_PENWINLAST       equ 038Fh

WM_COALESCE_FIRST  equ 0390h
WM_COALESCE_LAST   equ 039Fh

;  private window messages start here
WM_USER             equ  0400H

CS_VREDRAW		equ	0001h
CS_HREDRAW		equ	0002h
CS_KEYCVTWINDOW		equ	0004h
CS_DBLCLKS		equ	0008h
;                          	0010h reserved
CS_OWNDC		equ	0020h
CS_CLASSDC		equ	0040h
CS_PARENTDC		equ	0080h
CS_NOKEYCVT		equ	0100h
CS_SAVEBITS		equ	0800h
CS_NOCLOSE		equ	0200h
CS_BYTEALIGNCLIENT	equ	1000h
CS_BYTEALIGNWINDOW	equ	2000h
CS_GLOBALCLASS		equ	4000h    ; Global window class

WS_OVERLAPPED	equ 000000000h
WS_ICONICPOPUP	equ 0C0000000h
WS_POPUP	equ 080000000h
WS_CHILD	equ 040000000h
WS_MINIMIZE	equ 020000000h
WS_VISIBLE	equ 010000000h
WS_DISABLED	equ 008000000h
WS_CLIPSIBLINGS	equ 004000000h
WS_CLIPCHILDREN	equ 002000000h
WS_MAXIMIZE	equ 001000000h
WS_CAPTION	equ 000C00000h	;WS_BORDER | WS_DLGFRAME
WS_BORDER	equ 000800000h
WS_DLGFRAME	equ 000400000h
WS_VSCROLL	equ 000200000h
WS_HSCROLL	equ 000100000h
WS_SYSMENU	equ 000080000h
WS_THICKFRAME	equ 000040000h
WS_HREDRAW	equ 000020000h
WS_VREDRAW	equ 000010000h
WS_GROUP	equ 000020000h
WS_TABSTOP	equ 000010000h
WS_MINIMIZEBOX	equ 000020000h
WS_MAXIMIZEBOX	equ 000010000h
; Common Window Styles
;WS_OVERLAPPEDWINDOW	equ	0CF0000h
WS_OVERLAPPEDWINDOW	equ WS_OVERLAPPED OR WS_CAPTION OR WS_SYSMENU OR WS_THICKFRAME OR WS_MINIMIZEBOX OR WS_MAXIMIZEBOX
WS_POPUPWINDOW	equ WS_POPUP OR WS_BORDER OR WS_SYSMENU
WS_CHILDWINDOW	equ WS_CHILD
WS_TILEDWINDOW	equ WS_OVERLAPPEDWINDOW
WS_TILED	equ WS_OVERLAPPED
WS_ICONIC	equ WS_MINIMIZE
WS_SIZEBOX	equ WS_THICKFRAME
WS_EX_CLIENTEDGE equ 200h
IDC_ARROW		equ	32512	; 7F00h
IDC_IBEAM       equ 32513
IDC_WAIT        equ 32514
IDC_CROSS       equ 32515
IDC_UPARROW     equ 32516
IDC_SIZE        equ 32640
IDC_ICON        equ 32641
IDC_SIZENWSE    equ 32642
IDC_SIZENESW    equ 32643
IDC_SIZEWE      equ 32644
IDC_SIZENS      equ 32645

; ShowWindow() Commands
SW_HIDE	equ 0
SW_SHOWNORMAL	equ 1
SW_NORMAL	equ 1
SW_SHOWMINIMIZED	equ 2
SW_SHOWMAXIMIZED	equ 3
SW_MAXIMIZE	equ 3
SW_SHOWNOACTIVATE	equ 4
SW_SHOW	equ 5
SW_MINIMIZE	equ 6
SW_SHOWMINNOACTIVE	equ 7
SW_SHOWNA	equ 8
SW_RESTORE	equ 9

COLOR_WINDOW		equ	5

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

IDOK	equ 1
IDCANCEL	equ 2
IDABORT	equ 3
IDRETRY	equ 4
IDIGNORE	equ 5
IDYES	equ 6
IDNO	equ 7
IDCLOSE	equ 8
IDHELP	equ 9
;/*
; * Edit Control Styles
; */
ES_LEFT	equ 0000h
ES_CENTER	equ 0001h
ES_RIGHT	equ 0002h
ES_MULTILINE	equ 0004h
ES_UPPERCASE	equ 0008h
ES_LOWERCASE	equ 0010h
ES_PASSWORD	equ 0020h
ES_AUTOVSCROLL	equ 0040h
ES_AUTOHSCROLL	equ 0080h
ES_NOHIDESEL	equ 0100h
ES_OEMCONVERT	equ 0400h
ES_READONLY	equ 0800h
ES_WANTRETURN	equ 1000h
ES_NUMBER	equ 2000h

FORMAT_MESSAGE_ALLOCATE_BUFFER	equ 00000100h
FORMAT_MESSAGE_IGNORE_INSERTS	equ 00000200h
FORMAT_MESSAGE_FROM_STRING	equ 00000400h
FORMAT_MESSAGE_FROM_HMODULE	equ 00000800h
FORMAT_MESSAGE_FROM_SYSTEM	equ 00001000h
FORMAT_MESSAGE_ARGUMENT_ARRAY	equ 00002000h
FORMAT_MESSAGE_MAX_WIDTH_MASK	equ 000000FFh

; * Dialog Styles
;*/
DS_ABSALIGN	equ 01h
DS_SYSMODAL	equ 02h
DS_LOCALEDIT	equ 20h
DS_SETFONT	equ 40h
DS_MODALFRAME	equ 80h
DS_NOIDLEMSG	equ 100h
DS_SETFOREGROUND	equ 200h
DS_3DLOOK	equ 0004h
DS_FIXEDSYS	equ 0008h
DS_NOFAILCREATE	equ 0010h
DS_CONTROL	equ 0400h
DS_CENTER	equ 0800h
DS_CENTERMOUSE	equ 1000H
DS_CONTEXTHELP	equ 2000h
