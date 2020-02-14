;shell32.inc
ifdef	_TASM_
	includelib	tasmlib\import32.lib
		extrn	ShellExecuteA:near
	ShellExecute	equ	ShellExecuteA
else
	includelib	shell32.lib
		extrn	__imp__ShellExecuteA@24:dword

	ShellExecute	equ	__imp__ShellExecuteA@24
    __imp_ShellExecuteA    equ __imp__ShellExecuteA@24
endif
