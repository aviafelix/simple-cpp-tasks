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
		extrn __imp__ExitProcess@4:dword
		extrn __imp__IsDebuggerPresent@0:dword
		extrn __imp__GetStdHandle@4:dword
		extrn __imp__WriteConsoleA@20:dword
		extrn __imp__GetModuleHandleA@4:dword
		extrn __imp__lstrlen@4:dword
		extrn __imp__GetCommandLineA@0:dword
		extrn __imp__CloseHandle@4:dword
		extrn __imp__GlobalAlloc@8:dword
		extrn __imp__GlobalLock@4:dword
		extrn __imp__GlobalFree@4:dword
		extrn __imp__CreateFileA@28:dword
		extrn __imp__ReadFile@20:dword
		extrn __imp__WriteFile@20:dword

	ExitProcess	equ	__imp__ExitProcess@4
	__imp_ExitProcess equ	__imp__ExitProcess@4
	IsDebuggerPresent equ	__imp__IsDebuggerPresent@0
	__imp_IsDebuggerPresent equ	__imp__IsDebuggerPresent@0
	GetStdHandle	equ	__imp__GetStdHandle@4
	__imp_GetStdHandle equ	__imp__GetStdHandle@4
	WriteConsole	equ	__imp__WriteConsoleA@20
	__imp_WriteConsoleA equ	__imp__WriteConsoleA@20
	GetModuleHandle	equ	__imp__GetModuleHandleA@4
	__imp_GetModuleHandleA equ	__imp__GetModuleHandleA@4
	lstrlen		equ	__imp__lstrlen@4
	__imp_lstrlen equ	__imp__lstrlen@4
	GetCommandLine	equ	__imp__GetCommandLineA@0
	__imp_GetCommandLineA equ	__imp__GetCommandLineA@0
	CloseHandle	equ	__imp__CloseHandle@4
	__imp_CloseHandle equ	__imp__CloseHandle@4
	GlobalAlloc	equ	__imp__GlobalAlloc@8
	__imp_GlobalAlloc equ	__imp__GlobalAlloc@8
	GlobalLock	equ	__imp__GlobalLock@4
	__imp_GlobalLock equ	__imp__GlobalLock@4
	GlobalFree	equ	__imp__GlobalFree@4
	__imp_GlobalFree equ	__imp__GlobalFree@4
	CreateFile	equ	__imp__CreateFileA@28
	__imp_CreateFileA equ	__imp__CreateFileA@28
	ReadFile	equ	__imp__ReadFile@20
	__imp_ReadFile equ	__imp__ReadFile@20
	WriteFile	equ	__imp__WriteFile@20
	__imp_WriteFile equ	__imp__WriteFile@20
endif
