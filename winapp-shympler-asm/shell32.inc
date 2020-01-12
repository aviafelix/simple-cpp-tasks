;shell32.inc
ifdef	_TASM_
	includelib	tasmlib\import32.lib
		extrn	ShellExecuteA:near
	ShellExecute	equ	ShellExecuteA
else
	includelib	shell32.lib
		extrn	_ShellExecuteA@24:near
	ShellExecute	equ	_ShellExecuteA@24
endif