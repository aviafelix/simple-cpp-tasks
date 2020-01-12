;gdi32.inc
ifdef _TASM_
		includelib tasmlib\import32.lib
		extrn	TextOutA:near
	TextOut		equ	TextOutA
	
else
		includelib	comdlg32.lib
		extrn	_TextOutA@20:near
	TextOut		equ	_TextOutA@20
endif