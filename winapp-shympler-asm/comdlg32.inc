;comdlg32.inc
ifdef _TASM_
		includelib tasmlib\import32.lib
		extrn	GetOpenFileNameA:near
		extrn	GetSaveFileNameA:near
	GetOpenFileName	equ	GetOpenFileNameA
	GetSaveFileName	equ	GetSaveFileNameA
else
		includelib	comdlg32.lib
		extrn	__imp__GetOpenFileNameA@4:dword
		extrn	__imp__GetSaveFileNameA@4:dword
GetOpenFileName	equ	__imp__GetOpenFileNameA@4
GetSaveFileName	equ	__imp__GetSaveFileNameA@4
endif