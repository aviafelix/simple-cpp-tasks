;gdi32.inc
ifdef _TASM_
		includelib tasmlib\import32.lib
		extrn	TextOutA:near
	TextOut		equ	TextOutA
	
else
		includelib	comdlg32.lib
		extrn	__imp__TextOutA@20:dword

	TextOut		equ	__imp__TextOutA@20
    __imp_TextOutA equ __imp__TextOutA@20
endif
