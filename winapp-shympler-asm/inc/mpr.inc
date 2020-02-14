;mpr.inc
ifdef _TASM_
	includelib	tasmlib\import32.lib
		extrn WNetGetUserA:near
		extrn WNetOpenEnumA:near
		extrn WNetEnumResourceA:near
		extrn WNetCloseEnum
WNetGetUser	equ	WNetGetUserA
WNetOpenEnum	equ	WNetOpenEnumA
WNetEnumResource equ	WNetEnumResourceA
else
	includelib	mpr.lib
		extrn __imp__WNetGetUserA@12:dword
		extrn __imp__WNetOpenEnumA@20:dword
		extrn __imp__WNetEnumResourceA@16:dword
		extrn __imp__WNetCloseEnum@4:dword

	WNetGetUser	equ __imp__WNetGetUserA@12
	WNetOpenEnum	equ __imp__WNetOpenEnumA@20
	WNetEnumResource equ __imp__WNetEnumResourceA@16
	WNetCloseEnum	equ __imp__WNetCloseEnum@4
endif
