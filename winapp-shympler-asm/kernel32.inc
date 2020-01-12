;kernel32.inc
ifdef _TASM_
	includelib	tasmlib\import32.lib
		extrn ExitProcess:near
		extrn IsDebuggerPresent:near
		extrn GetStdHandle:near
		extrn WriteConsoleA:near
		extrn GetModuleHandleA:near
		extrn lstrlen:near
		extrn GetCommandLineA:near
		extrn CloseHandle:near
		extrn GlobalAlloc:near
		extrn GlobalLock:near
		extrn GlobalFree:near
		extrn CreateFileA:near
		extrn ReadFile:near
		extrn WriteFile:near
WriteConsole	equ	WriteConsoleA
GetModuleHandle	equ	GetModuleHandleA
GetCommandLine	equ	GetCommandLineA
CreateFile	equ	CreateFileA
else
	includelib	kernel32.lib
		extrn _IsDebuggerPresent@0:near
		extrn _ExitProcess@4:near
		extrn _GetStdHandle@4:near
		extrn _WriteConsoleA@20:near
		extrn _GetModuleHandleA@4:near
		extrn _lstrlenA@4:near
		extrn _GetCommandLineA@0:near
		extrn _CloseHandle@4:near
		extrn _GlobalAlloc@8:near
		extrn _GlobalLock@4:near
		extrn _GlobalFree@4:near
		extrn _CreateFileA@28:near
		extrn _ReadFile@20:near
		extrn _WriteFile@20:near
IsDebuggerPresent	equ	_IsDebuggerPresent@0
GetStdHandle	equ	_GetStdHandle@4
WriteConsole	equ	_WriteConsoleA@20
ExitProcess	equ	_ExitProcess@4
GetModuleHandle	equ	_GetModuleHandleA@4
lstrlen		equ	_lstrlenA@4
GetCommandLine	equ	_GetCommandLineA@0
CloseHandle	equ	_CloseHandle@4
GlobalAlloc	equ	_GlobalAlloc@8
GlobalLock	equ	_GlobalLock@4
GlobalFree	equ	_GlobalFree@4
CreateFile	equ	_CreateFileA@28
ReadFile	equ	_ReadFile@20
WriteFile	equ	_WriteFile@20
endif