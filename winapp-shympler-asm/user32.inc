;user32.inc
ifdef _TASM_
		includelib	tasmlib\import32.lib
		extrn	CreateDialogParamA:near
		extrn	CreateWindowExA:near
		extrn	DefWindowProcA:near
		extrn	DestroyWindow:near
		extrn	DialogBoxParamA:near
		extrn	DispatchMessageA:near
		extrn	EndDialog:near
		extrn	GetClientRect:near
		extrn	GetDlgItem:near
		extrn	GetDlgItemTextA:near
		extrn	GetMessageA:near
		extrn	GlobalUnlock:near
		extrn	LoadAcceleratorsA:near
		extrn	LoadCursorA:near
		extrn	LoadIconA:near
		extrn	LoadMenuA:near
		extrn	MessageBoxA:near
		extrn	MoveWindow:near
		extrn	PostQuitMessage:near
		extrn	RegisterClassExA:near
		extrn	SendMessageA:near
		extrn	SetDlgItemInt:near
		extrn	SetDlgItemTextA:near
		extrn	SetFocus:near
		extrn	SetMenu:near
		extrn	SetWindowTextA:near
		extrn	ShowWindow:near
		extrn	TranslateAccelerator:near
		extrn	TranslateMessage:near
		extrn	UpdateWindow:near
	CreateDialogParam equ	CreateDialogParamA
	CreateWindowEx	equ	CreateWindowExA
	DefWindowProc	equ	DefWindowProcA
	DialogBoxParam	equ	DialogBoxParamA
	DispatchMessage	equ	DispatchMessageA
	GetDlgItemText	equ	GetDlgItemTextA
	GetMessage	equ	GetMessageA
	LoadAccelerators equ	LoadAcceleratorsA
	LoadCursor	equ	LoadCursorA
	LoadIcon	equ	LoadIconA
	LoadMenu	equ	LoadMenuA
	MessageBox	equ	MessageBoxA
	RegisterClassEx	equ	RegisterClassExA
	SendMessage	equ	SendMessageA
	SetDlgItemText	equ	SetDlgItemTextA
	SetWindowText	equ	SetWindowTextA
else
		includelib	user32.lib
		extrn	__imp__CreateDialogParamA@20:dword
		extrn	__imp__CreateWindowExA@48:dword
		extrn	__imp__DefWindowProcA@16:dword
		extrn	__imp__DestroyWindow@4:dword
		extrn	__imp__DialogBoxParamA@20:dword
		extrn	__imp__DispatchMessageA@4:dword
		extrn	__imp__EndDialog@8:dword
		extrn	__imp__GetClientRect@8:dword
		extrn	__imp__GetDlgItem@8:dword
		extrn	__imp__GetDlgItemTextA@16:dword
		extrn	__imp__GetMessageA@16:dword
		extrn	__imp__GlobalUnlock@4:dword
		extrn	__imp__LoadAcceleratorsA@8:dword
		extrn	__imp__LoadCursorA@8:dword
		extrn	__imp__LoadIconA@8:dword
		extrn	__imp__LoadMenuA@8:dword
		extrn	__imp__MessageBoxA@16:dword
		extrn	__imp__MoveWindow@24:dword
		extrn	__imp__PostQuitMessage@4:dword
		extrn	__imp__RegisterClassExA@4:dword
		extrn	__imp__SendMessageA@16:dword
		extrn	__imp__SetDlgItemInt@16:dword
		extrn	__imp__SetDlgItemTextA@12:dword
		extrn	__imp__SetFocus@4:dword
		extrn	__imp__SetMenu@8:dword
		extrn	__imp__SetWindowTextA@8:dword
		extrn	__imp__ShowWindow@8:dword
		extrn	__imp__TranslateAccelerator@12:dword
		extrn	__imp__TranslateMessage@4:dword
		extrn	__imp__UpdateWindow@4:dword

	CreateDialogParam equ	__imp__CreateDialogParamA@20
	__imp_CreateDialogParam equ	__imp__CreateDialogParamA@20
	CreateWindowEx	equ __imp__CreateWindowExA@48
	__imp_CreateWindowExA equ __imp__CreateWindowExA@48
	DefWindowProc	equ __imp__DefWindowProcA@16
	__imp_DefWindowProcA equ __imp__DefWindowProcA@16
	DestroyWindow	equ __imp__DestroyWindow@4
	__imp_DestroyWindow equ __imp__DestroyWindow@4
	DialogBoxParam	equ __imp__DialogBoxParamA@20
	__imp_DialogBoxParamA equ __imp__DialogBoxParamA@20
	DispatchMessage	equ __imp__DispatchMessageA@4
	__imp_DispatchMessageA equ __imp__DispatchMessageA@4
	EndDialog	equ __imp__EndDialog@8
	__imp_EndDialog equ __imp__EndDialog@8
	GetClientRect	equ __imp__GetClientRect@8
	__imp_GetClientRect equ __imp__GetClientRect@8
	GetDlgItem	equ __imp__GetDlgItem@8
	__imp_GetDlgItem equ __imp__GetDlgItem@8
	GetDlgItemText	equ __imp__GetDlgItemTextA@16
	__imp_GetDlgItemTextA equ __imp__GetDlgItemTextA@16
	GetMessage	equ __imp__GetMessageA@16
	__imp_GetMessageA equ __imp__GetMessageA@16
	GlobalUnlock	equ __imp__GlobalUnlock@4
	__imp_GlobalUnlock equ __imp__GlobalUnlock@4
	LoadAccelerators equ __imp__LoadAcceleratorsA@8
	__imp_LoadAcceleratorsA equ __imp__LoadAcceleratorsA@8
	LoadCursor	equ __imp__LoadCursorA@8
	__imp_LoadCursorA equ __imp__LoadCursorA@8
	LoadIcon	equ __imp__LoadIconA@8
	__imp_LoadIconA equ __imp__LoadIconA@8
	LoadMenu	equ __imp__LoadMenuA@8
	__imp_LoadMenuA equ __imp__LoadMenuA@8
	MessageBox	equ __imp__MessageBoxA@16
	__imp_MessageBoxA equ __imp__MessageBoxA@16
	MoveWindow	equ __imp__MoveWindow@24
	__imp_MoveWindow equ __imp__MoveWindow@24
	PostQuitMessage	equ __imp__PostQuitMessage@4
	__imp_PostQuitMessage equ __imp__PostQuitMessage@4
	RegisterClassEx equ __imp__RegisterClassExA@4
	__imp_RegisterClassExA equ __imp__RegisterClassExA@4
	SendMessage	equ __imp__SendMessageA@16
	__imp_SendMessageA equ __imp__SendMessageA@16
	SetDlgItemInt equ __imp_SetDlgItemInt@16
	__imp_SetDlgItemInt equ __imp_SetDlgItemInt@16
	SetDlgItemText	equ __imp__SetDlgItemTextA@12
	__imp_SetDlgItemTextA equ __imp__SetDlgItemTextA@12
	SetFocus	equ __imp__SetFocus@4
	__imp_SetFocus equ __imp__SetFocus@4
	SetMenu		equ __imp__SetMenu@8
	__imp_SetMenu equ __imp__SetMenu@8
	SetWindowText	equ __imp__SetWindowTextA@8
	__imp_SetWindowTextA equ __imp__SetWindowTextA@8
	ShowWindow	equ __imp__ShowWindow@8
	__imp_ShowWindow equ __imp__ShowWindow@8
	TranslateAccelerator equ __imp__TranslateAccelerator@12
	__imp_TranslateAccelerator equ __imp__TranslateAccelerator@12
	TranslateMessage equ __imp__TranslateMessage@4
	__imp_TranslateMessage equ __imp__TranslateMessage@4
	UpdateWindow	equ __imp__UpdateWindow@4
	__imp_UpdateWindow equ __imp__UpdateWindow@4
endif
