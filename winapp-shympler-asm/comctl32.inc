;comctl32.inc
ifdef _TASM_
		includelib tasmlib\comctl32.lib
		extrn	InitCommonControlsEx:near
else
		includelib	comctl32.lib
		extrn	_InitCommonControlsEx@4:near
InitCommonControlsEx	equ	_InitCommonControlsEx@4
endif
