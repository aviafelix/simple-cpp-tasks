;comctl32.inc
ifdef _TASM_
		includelib tasmlib\comctl32.lib
		extrn	InitCommonControlsEx:near
else
		includelib	comctl32.lib
        extrn   __imp__InitCommonControlsEx@4:dword
		; extrn	_InitCommonControlsEx@4:dword

    InitCommonControlsEx    equ __imp__InitCommonControlsEx@4
    _InitCommonControlsEx equ __imp__InitCommonControlsEx@4
    ; InitCommonControlsEx	equ	_InitCommonControlsEx@4
    ; _InitCommonControlsEx equ _InitCommonControlsEx@4
endif
