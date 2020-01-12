;user32.inc
ifdef _TASM_
		includelib	tasmlib\import32.lib
		extrn	SetDlgItemInt:near
		extrn	MessageBoxA:near
		extrn	DispatchMessageA:near
		extrn	TranslateMessage:near
		extrn	GetMessageA:near
		extrn	LoadIconA:near
		extrn	UpdateWindow:near
		extrn	ShowWindow:near
		extrn	CreateWindowExA:near
		extrn	DefWindowProcA:near
		extrn	PostQuitMessage:near
		extrn	RegisterClassExA:near
		extrn	LoadCursorA:near
		extrn	LoadMenuA:near
		extrn	SetMenu:near
		extrn	DestroyWindow:near
		extrn	DialogBoxParamA:near
		extrn	GetDlgItem:near
		extrn	SetFocus:near
		extrn	GetDlgItemTextA:near
		extrn	SetDlgItemTextA:near
		extrn	EndDialog:near
		extrn	LoadAcceleratorsA:near
		extrn	TranslateAccelerator:near
		extrn	SendMessageA:near
		extrn	SetWindowTextA:near
		extrn	MoveWindow:near
		extrn	GetClientRect:near
		extrn	GlobalUnlock:near
		extrn	CreateDialogParamA:near
	MessageBox	equ	MessageBoxA
	DispatchMessage	equ	DispatchMessageA
	GetMessage	equ	GetMessageA
	LoadIcon	equ	LoadIconA
	CreateWindowEx	equ	CreateWindowExA
	DefWindowProc	equ	DefWindowProcA
	RegisterClassEx	equ	RegisterClassExA
	LoadCursor	equ	LoadCursorA
	LoadMenu	equ	LoadMenuA
	DialogBoxParam	equ	DialogBoxParamA
	GetDlgItemText	equ	GetDlgItemTextA
	SetDlgItemText	equ	SetDlgItemTextA
	LoadAccelerators equ	LoadAcceleratorsA
	SendMessage	equ	SendMessageA
	SetWindowText	equ	SetWindowTextA
	CreateDialogParam equ	CreateDialogParamA
else
		includelib	user32.lib
		extrn	_SetDlgItemInt@16:near
		extrn	_MessageBoxA@16:near
		extrn	_DispatchMessageA@4:near
		extrn	_TranslateMessage@4:near
		extrn	_GetMessageA@16:near
		extrn	_LoadIconA@8:near
		extrn	_UpdateWindow@4:near
		extrn	_ShowWindow@8:near
		extrn	_CreateWindowExA@48:near
		extrn	_DefWindowProcA@16:near
		extrn	_PostQuitMessage@4:near
		extrn	_RegisterClassExA@4:near
		extrn	_LoadCursorA@8:near
		extrn	_LoadMenuA@8:near
		extrn	_SetMenu@8:near
		extrn	_DestroyWindow@4:near
		extrn	_DialogBoxParamA@20:near
		extrn	_GetDlgItem@8:near
		extrn	_SetFocus@4:near
		extrn	_GetDlgItemTextA@16:near
		extrn	_SetDlgItemTextA@12:near
		extrn	_EndDialog@8:near
		extrn	_LoadAcceleratorsA@8:near
		extrn	_TranslateAcceleratorA@12:near
		extrn	_SendMessageA@16:near
		extrn	_SetWindowTextA@8:near
		extrn	_MoveWindow@24:near
		extrn	_GetClientRect@8:near
		extrn	_GlobalUnlock@4:near
		extrn	_CreateDialogParamA@20:near
	MessageBox	equ _MessageBoxA@16
	DispatchMessage	equ _DispatchMessageA@4
	TranslateMessage equ _TranslateMessage@4
	GetMessage	equ _GetMessageA@16
	LoadIcon	equ _LoadIconA@8
	UpdateWindow	equ _UpdateWindow@4
	ShowWindow	equ _ShowWindow@8
	CreateWindowEx	equ _CreateWindowExA@48
	DefWindowProc	equ _DefWindowProcA@16
	PostQuitMessage	equ _PostQuitMessage@4
	RegisterClassEx equ _RegisterClassExA@4
	LoadCursor	equ _LoadCursorA@8
	LoadMenu	equ _LoadMenuA@8
	SetMenu		equ _SetMenu@8
	DestroyWindow	equ _DestroyWindow@4
	DialogBoxParam	equ _DialogBoxParamA@20
	GetDlgItem	equ _GetDlgItem@8
	SetFocus	equ _SetFocus@4
	GetDlgItemText	equ _GetDlgItemTextA@16
	SetDlgItemText	equ _SetDlgItemTextA@12
	EndDialog	equ _EndDialog@8
	LoadAccelerators equ _LoadAcceleratorsA@8
	TranslateAccelerator equ _TranslateAcceleratorA@12
	SendMessage	equ _SendMessageA@16
	SetWindowText	equ _SetWindowTextA@8
	MoveWindow	equ _MoveWindow@24
	GetClientRect	equ _GetClientRect@8
	GlobalUnlock	equ _GlobalUnlock@4
	CreateDialogParam equ	_CreateDialogParamA@20
endif