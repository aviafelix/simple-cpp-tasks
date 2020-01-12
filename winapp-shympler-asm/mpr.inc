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
		extrn _WNetGetUserA@12:near
		extrn _WNetOpenEnumA@20:near
		extrn _WNetEnumResourceA@16:near
		extrn _WNetCloseEnum@4:near
WNetGetUser	equ _WNetGetUserA@12
WNetOpenEnum	equ _WNetOpenEnumA@20
WNetEnumResource equ _WNetEnumResourceA@16
WNetCloseEnum	equ _WNetCloseEnum@4
endif