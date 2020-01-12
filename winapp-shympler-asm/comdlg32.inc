;comdlg32.inc
ifdef _TASM_
		includelib tasmlib\import32.lib
		extrn	GetOpenFileNameA:near
		extrn	GetSaveFileNameA:near
	GetOpenFileName	equ	GetOpenFileNameA
	GetSaveFileName	equ	GetSaveFileNameA
else
		includelib	comdlg32.lib
		extrn	_GetOpenFileNameA@4:near
		extrn	_GetSaveFileNameA@4:near
GetOpenFileName	equ	_GetOpenFileNameA@4
GetSaveFileName	equ	_GetSaveFileNameA@4
endif