; Segment type:	Pure code
_text		segment	para public 'CODE' use32
		assume cs:_text
		;org 10001000h
		assume es:nothing, ss:nothing, ds:_data, fs:nothing, gs:nothing

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e

_DllMain@12	proc near		; CODE XREF: start+61p
		mov	eax, 1
		retn	0Ch
_DllMain@12	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h
; Exported entry  18. Rex_GetCaps

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e

		public Rex_GetCaps
Rex_GetCaps	proc near

var_64		= dword	ptr -64h
var_60		= dword	ptr -60h
var_5C		= dword	ptr -5Ch
var_50		= dword	ptr -50h
var_44		= dword	ptr -44h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
arg_0		= dword	ptr  4

		sub	esp, 60h
		push	esi
		mov	esi, [esp+64h+arg_0]
		push	edi
		mov	ecx, 18h
		xor	eax, eax
		lea	edi, [esp+68h+var_60]
		repe stosd
		mov	ecx, 0Bh
		mov	edi, esi
		repe stosd
		mov	eax, dword_10009B90
		lea	edx, [esp+68h+var_60]
		push	edx
		push	eax
		mov	ecx, [eax]
		mov	[esp+70h+var_60], 60h
		call	dword ptr [ecx+10h]
		test	eax, eax
		jnz	short loc_100010B7
		mov	eax, [esp+70h+var_64]
		xor	ecx, ecx
		test	eax, eax
		setnz	cl
		mov	[esi], ecx
		xor	ecx, ecx
		test	eax, eax
		setnz	cl
		mov	[esi+4], ecx
		xor	ecx, ecx
		test	eax, eax
		setnz	cl
		mov	[esi+8], ecx
		xor	ecx, ecx
		test	eax, eax
		setnz	cl
		mov	[esi+0Ch], ecx
		xor	ecx, ecx
		test	eax, eax
		mov	edx, [esp+70h+var_60]
		setnz	cl
		mov	eax, ecx
		mov	ecx, [esp+70h+var_50]
		mov	[esi+10h], eax
		mov	eax, [esp+70h+var_5C]
		mov	[esi+18h], eax
		mov	eax, [esp+70h+var_24]
		mov	[esi+14h], edx
		mov	edx, [esp+70h+var_44]
		mov	[esi+1Ch], ecx
		mov	ecx, [esp+70h+var_20]
		mov	[esi+24h], eax
		mov	[esi+20h], edx
		mov	[esi+28h], ecx
		mov	eax, 1
		pop	edi
		pop	esi
		add	esp, 60h
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_100010B7:				; CODE XREF: Rex_GetCaps+39j
		mov	edx, dword_10009B94
		push	0
		push	offset aRex_getcaps
		push	offset aCouldNotGetSou
		push	edx
		call	ds:MessageBoxA
		pop	edi
		xor	eax, eax
		pop	esi
		add	esp, 60h
		retn	
Rex_GetCaps	endp ; sp = -8

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h
; Exported entry  24. Rex_Init

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e

		public Rex_Init
Rex_Init	proc near

arg_0		= dword	ptr  4

		mov	eax, [esp+arg_0]
		push	0
		push	offset dword_10009B90
		push	0
		mov	dword_10009B94,	eax
		call	j_DirectSoundCreate
		test	eax, eax
		jnz	short loc_10001140
		mov	eax, dword_10009B90
		mov	edx, dword_10009B94
		push	3
		push	edx
		mov	ecx, [eax]
		push	eax
		call	dword ptr [ecx+18h]
		test	eax, eax
		jnz	short loc_10001119
		mov	eax, 1
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10001119:				; CODE XREF: Rex_Init+31j
		mov	eax, dword_10009B90
		push	eax
		mov	ecx, [eax]
		call	dword ptr [ecx+8]
		mov	edx, dword_10009B94
		push	0
		push	offset aRex_init
		push	offset aUnableToInitia
		push	edx
		call	ds:MessageBoxA
		xor	eax, eax
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10001140:				; CODE XREF: Rex_Init+19j
		mov	eax, dword_10009B94
		push	0
		push	offset aRex_init
		push	offset aUnableToInitia
		push	eax
		call	ds:MessageBoxA
		xor	eax, eax
		retn	
Rex_Init	endp ; sp = -0Ch

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 8
; Exported entry  17. Rex_Exit

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e

		public Rex_Exit
Rex_Exit	proc near
		mov	eax, dword_10009B90
		test	eax, eax
		jz	short loc_10001170
		mov	ecx, [eax]
		push	eax
		call	dword ptr [ecx+8]
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10001170:				; CODE XREF: Rex_Exit+7j
		mov	edx, dword_10009B94
		push	0
		push	offset aRex_exit
		push	offset aSoundWasNotIni
		push	edx
		call	ds:MessageBoxA
		retn	
Rex_Exit	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 8
; Exported entry  16. Rex_DuplicateBuffer

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e

		public Rex_DuplicateBuffer
Rex_DuplicateBuffer proc near

arg_0		= dword	ptr  4
arg_4		= dword	ptr  8

		mov	edx, [esp+arg_4]
		mov	eax, dword_10009B90
		push	edx
		mov	edx, [esp+4+arg_0]
		mov	ecx, [eax]
		push	edx
		push	eax
		call	dword ptr [ecx+14h]
		test	eax, eax
		jnz	short loc_100011AF
		mov	eax, 1
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_100011AF:				; CODE XREF: Rex_DuplicateBuffer+17j
		mov	eax, dword_10009B94
		push	0
		push	offset aDuplicatebuffe
		push	offset aCouldNotDuplic
		push	eax
		call	ds:MessageBoxA
		xor	eax, eax
		retn	
Rex_DuplicateBuffer endp ; sp =	-0Ch

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 8
; Exported entry  21. Rex_GetPosition

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e

		public Rex_GetPosition
Rex_GetPosition	proc near

arg_0		= dword	ptr  4
arg_4		= dword	ptr  8
arg_8		= dword	ptr  0Ch

		mov	edx, [esp+arg_8]
		mov	eax, [esp+arg_0]
		push	edx
		mov	edx, [esp+4+arg_4]
		mov	ecx, [eax]
		push	edx
		push	eax
		call	dword ptr [ecx+10h]
		test	eax, eax
		jnz	short loc_100011EE
		mov	eax, 1
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_100011EE:				; CODE XREF: Rex_GetPosition+16j
		mov	eax, dword_10009B94
		push	0
		push	offset aGetposition
		push	offset aCouldNotGetCur
		push	eax
		call	ds:MessageBoxA
		xor	eax, eax
		retn	
Rex_GetPosition	endp ; sp = -0Ch

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 8
; Exported entry  36. Rex_SetPan

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e

		public Rex_SetPan
Rex_SetPan	proc near

arg_0		= dword	ptr  4
arg_4		= dword	ptr  8

		mov	eax, [esp+arg_0]
		mov	edx, [esp+arg_4]
		push	edx
		push	eax
		mov	ecx, [eax]
		call	dword ptr [ecx+40h]
		test	eax, eax
		jnz	short loc_10001229
		mov	eax, 1
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10001229:				; CODE XREF: Rex_SetPan+11j
		mov	eax, dword_10009B94
		push	0
		push	offset aRex_setpan
		push	offset aCouldNotSetPan
		push	eax
		call	ds:MessageBoxA
		xor	eax, eax
		retn	
Rex_SetPan	endp ; sp = -8

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h
; Exported entry  20. Rex_GetPan

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e

		public Rex_GetPan
Rex_GetPan	proc near

arg_0		= dword	ptr  4
arg_4		= dword	ptr  8

		mov	eax, [esp+arg_0]
		mov	edx, [esp+arg_4]
		push	edx
		push	eax
		mov	ecx, [eax]
		call	dword ptr [ecx+1Ch]
		test	eax, eax
		jnz	short loc_10001269
		mov	eax, 1
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10001269:				; CODE XREF: Rex_GetPan+11j
		mov	eax, dword_10009B94
		push	0
		push	offset aRex_getpan
		push	offset aCouldNotGetPan
		push	eax
		call	ds:MessageBoxA
		xor	eax, eax
		retn	
Rex_GetPan	endp ; sp = -8

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h
; Exported entry  25. Rex_IsPlaying

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e

		public Rex_IsPlaying
Rex_IsPlaying	proc near

arg_0		= dword	ptr  8

		push	esi
		mov	esi, [esp+arg_0]
		lea	ecx, [esp+arg_0]
		mov	eax, [esi]
		push	ecx
		push	esi
		call	dword ptr [eax+24h]
		test	eax, eax
		jnz	short loc_100012BB
		mov	eax, [esp+8]
		cmp	eax, 1
		jnz	short loc_100012AF
		pop	esi
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_100012AF:				; CODE XREF: Rex_IsPlaying+1Bj
		xor	edx, edx
		cmp	eax, 4
		setz	dl
		mov	eax, edx
		pop	esi
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_100012BB:				; CODE XREF: Rex_IsPlaying+12j
		mov	eax, dword_10009B94
		push	0
		push	offset aRex_isplaying
		push	offset aCouldNotGetSta
		push	eax
		call	ds:MessageBoxA
		push	esi
		call	Rex_Stop
		add	esp, 4
		xor	eax, eax
		pop	esi
		retn	
Rex_IsPlaying	endp ; sp = -8

; Exported entry  19. Rex_GetFrequency

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e

		public Rex_GetFrequency
Rex_GetFrequency proc near

arg_0		= dword	ptr  4
arg_4		= dword	ptr  8

		mov	eax, [esp+arg_0]
		mov	edx, [esp+arg_4]
		push	edx
		push	eax
		mov	ecx, [eax]
		call	dword ptr [ecx+20h]
		test	eax, eax
		jz	short loc_1000130E
		mov	eax, dword_10009B94
		push	0
		push	offset aGet_frequency
		push	offset aCouldNotGetFre
		push	eax
		call	ds:MessageBoxA
		xor	eax, eax
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_1000130E:				; CODE XREF: Rex_GetFrequency+11j
		mov	eax, 1
		retn	
Rex_GetFrequency endp ;	sp = -8

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h
; Exported entry  35. Rex_SetFrequency

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e

		public Rex_SetFrequency
Rex_SetFrequency proc near

arg_0		= dword	ptr  4
arg_4		= dword	ptr  8

		mov	eax, [esp+arg_0]
		mov	edx, [esp+arg_4]
		push	edx
		push	eax
		mov	ecx, [eax]
		call	dword ptr [ecx+44h]
		test	eax, eax
		jz	short loc_1000134E
		mov	eax, dword_10009B94
		push	0
		push	offset aSet_frequency
		push	offset aCouldNotSetFre
		push	eax
		call	ds:MessageBoxA
		xor	eax, eax
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_1000134E:				; CODE XREF: Rex_SetFrequency+11j
		mov	eax, 1
		retn	
Rex_SetFrequency endp ;	sp = -8

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h
; Exported entry  23. Rex_GetVolume

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e

		public Rex_GetVolume
Rex_GetVolume	proc near

arg_0		= dword	ptr  4
arg_4		= dword	ptr  8

		mov	eax, [esp+arg_0]
		mov	edx, [esp+arg_4]
		push	edx
		push	eax
		mov	ecx, [eax]
		call	dword ptr [ecx+18h]
		test	eax, eax
		jz	short loc_1000138E
		mov	eax, dword_10009B94
		push	0
		push	offset aGet_volume
		push	offset aCouldNotGetVol
		push	eax
		call	ds:MessageBoxA
		xor	eax, eax
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_1000138E:				; CODE XREF: Rex_GetVolume+11j
		mov	eax, 1
		retn	
Rex_GetVolume	endp ; sp = -8

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h
; Exported entry  37. Rex_SetVolume

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e

		public Rex_SetVolume
Rex_SetVolume	proc near

arg_0		= dword	ptr  4
arg_4		= dword	ptr  8

		mov	eax, [esp+arg_0]
		mov	edx, [esp+arg_4]
		push	edx
		push	eax
		mov	ecx, [eax]
		call	dword ptr [ecx+3Ch]
		test	eax, eax
		jz	short loc_100013CE
		mov	eax, dword_10009B94
		push	0
		push	offset aSet_volume
		push	offset aCouldNotSetVol
		push	eax
		call	ds:MessageBoxA
		xor	eax, eax
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_100013CE:				; CODE XREF: Rex_SetVolume+11j
		mov	eax, 1
		retn	
Rex_SetVolume	endp ; sp = -8

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h
; Exported entry  38. Rex_Stop

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e

		public Rex_Stop
Rex_Stop	proc near		; CODE XREF: Rex_IsPlaying+44p

arg_0		= dword	ptr  4

		mov	eax, [esp+arg_0]
		push	eax
		mov	ecx, [eax]
		call	dword ptr [ecx+48h]
		test	eax, eax
		jz	short locret_10001407
		mov	edx, dword_10009B94
		push	0
		push	offset aStop_buffer
		push	offset aCouldNotStopSo
		push	edx
		call	ds:MessageBoxA

locret_10001407:			; CODE XREF: Rex_Stop+Cj
		retn	
Rex_Stop	endp ; sp = -4

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h
; Exported entry  34. Rex_PlayLooped

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e

		public Rex_PlayLooped
Rex_PlayLooped	proc near

arg_0		= dword	ptr  4

		mov	eax, [esp+arg_0]
		push	1
		push	0
		push	0
		mov	ecx, [eax]
		push	eax
		call	dword ptr [ecx+30h]
		test	eax, eax
		jz	short loc_10001440
		mov	edx, dword_10009B94
		push	0
		push	offset aRex_playlooped
		push	offset aCouldNotLoopPl
		push	edx
		call	ds:MessageBoxA
		xor	eax, eax
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10001440:				; CODE XREF: Rex_PlayLooped+12j
		mov	eax, 1
		retn	
Rex_PlayLooped	endp ; sp = -10h

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h
; Exported entry  33. Rex_Play

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e

		public Rex_Play
Rex_Play	proc near

arg_0		= dword	ptr  8

		push	esi
		mov	esi, [esp+arg_0]
		push	edi
		push	0
		mov	edi, [esi]
		push	esi
		call	dword ptr [edi+34h]
		push	0
		push	0
		push	0
		push	esi
		call	dword ptr [edi+30h]
		test	eax, eax
		jz	short loc_10001489
		mov	eax, dword_10009B94
		push	0
		push	offset aRex_playlooped
		push	offset aCouldNotPlaySo
		push	eax
		call	ds:MessageBoxA
		xor	eax, eax
		pop	edi
		pop	esi
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10001489:				; CODE XREF: Rex_Play+1Aj
		pop	edi
		mov	eax, 1
		pop	esi
		retn	
Rex_Play	endp ; sp = -18h

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h
; Exported entry  40. Rex_bRelease

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e

		public Rex_bRelease
Rex_bRelease	proc near

arg_0		= dword	ptr  4

		mov	eax, [esp+arg_0]
		mov	eax, [eax]
		push	eax
		mov	ecx, [eax]
		call	dword ptr [ecx+8]
		test	eax, eax
		jz	short locret_100014C9
		mov	edx, dword_10009B94
		push	0
		push	offset aRex_brelease
		push	offset aCouldNotReleas
		push	edx
		call	ds:MessageBoxA

locret_100014C9:			; CODE XREF: Rex_bRelease+Ej
		retn	
Rex_bRelease	endp ; sp = -4

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 8
; Exported entry  41. Rex_bWrite

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e

		public Rex_bWrite
Rex_bWrite	proc near		; CODE XREF: Rex_GetSound+1CEp

var_4C		= dword	ptr -4Ch
var_48		= dword	ptr -48h
var_40		= dword	ptr -40h
var_38		= dword	ptr -38h
var_34		= dword	ptr -34h
var_2C		= byte ptr -2Ch
var_28		= byte ptr -28h
var_20		= byte ptr -20h
var_1C		= dword	ptr -1Ch
var_14		= byte ptr -14h
var_8		= byte ptr -8
var_4		= byte ptr -4
arg_0		= dword	ptr  4
arg_4		= dword	ptr  8
arg_C		= byte ptr  10h

		sub	esp, 8
		lea	eax, [esp+8+var_8]
		lea	ecx, [esp+8+arg_C]
		lea	edx, [esp+8+arg_0]
		push	ebx
		mov	ebx, [esp+0Ch+arg_0]
		push	ebp
		push	esi
		mov	ebp, [ebx]
		push	edi
		mov	edi, dword ptr [esp+18h+arg_C]
		push	0
		mov	esi, [ebp+2Ch]
		push	eax
		push	ecx
		mov	ecx, [esp+24h+arg_4]
		lea	eax, [esp+24h+var_4]
		push	edx
		push	eax
		push	edi
		push	ecx
		push	ebx
		call	esi
		cmp	eax, 88780096h
		jnz	short loc_1000152D
		push	ebx
		call	dword ptr [ebp+50h]
		lea	edx, [esp+3Ch+var_2C]
		push	0
		lea	eax, [esp+40h+var_14]
		push	edx
		lea	ecx, [esp+44h+var_20]
		push	eax
		mov	eax, [esp+48h+var_1C]
		lea	edx, [esp+48h+var_28]
		push	ecx
		push	edx
		push	edi
		push	eax
		push	ebx
		call	esi

loc_1000152D:				; CODE XREF: Rex_bWrite+38j
		test	eax, eax
		jnz	short loc_10001597
		mov	ecx, [esp+5Ch+var_40]
		mov	eax, [esp+5Ch+var_38]
		mov	edi, [esp+5Ch+var_48]
		mov	edx, ecx
		mov	esi, eax
		shr	ecx, 2
		repe movsd
		mov	ecx, edx
		and	ecx, 3
		repe movsb
		mov	edi, [esp+5Ch+var_34]
		test	edi, edi
		jz	short loc_10001572
		mov	edx, [esp+5Ch+var_40]
		mov	ecx, [esp+5Ch+var_4C]
		lea	esi, [edx+eax]
		mov	eax, ecx
		shr	ecx, 2
		repe movsd
		mov	ecx, eax
		and	ecx, 3
		repe movsb
		mov	edi, [esp+5Ch+var_34]

loc_10001572:				; CODE XREF: Rex_bWrite+83j
		mov	ecx, [esp+5Ch+var_4C]
		mov	edx, [esp+5Ch+var_40]
		mov	eax, [esp+5Ch+var_48]
		push	ecx
		push	edi
		push	edx
		push	eax
		push	ebx
		call	dword ptr [ebp+4Ch]
		test	eax, eax
		jnz	short loc_10001597
		mov	eax, 1
		pop	edi
		pop	esi
		pop	ebp
		pop	ebx
		add	esp, 8
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10001597:				; CODE XREF: Rex_bWrite+5Fj
					; Rex_bWrite+B8j
		mov	ecx, dword_10009B94
		push	0
		push	offset aRex_bwrite
		push	offset aCouldNotWriteT
		push	ecx
		call	ds:MessageBoxA
		pop	edi
		pop	esi
		pop	ebp
		xor	eax, eax
		pop	ebx
		add	esp, 8
		retn	
Rex_bWrite	endp ; sp = -44h

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 8
; Exported entry  39. Rex_bCreate

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e

		public Rex_bCreate
Rex_bCreate	proc near		; CODE XREF: Rex_GetSound+1A8p

var_34		= dword	ptr -34h
var_30		= dword	ptr -30h
var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_14		= dword	ptr -14h
arg_0		= dword	ptr  4
arg_4		= dword	ptr  8
arg_8		= dword	ptr  0Ch
arg_C		= dword	ptr  10h
arg_10		= dword	ptr  14h

		sub	esp, 34h
		xor	eax, eax
		mov	ecx, [esp+34h+arg_8]
		mov	[esp+34h+var_34], eax
		push	esi
		mov	[esp+38h+var_30], eax
		push	edi
		mov	edi, [esp+3Ch+arg_10]
		mov	[esp+3Ch+var_2C], eax
		mov	[esp+3Ch+var_28], eax
		mov	eax, edi
		mov	word ptr [esp+3Ch+var_34+2], cx
		and	eax, 0FFFFh
		and	ecx, 0FFFFh
		mov	esi, [esp+3Ch+arg_C]
		imul	eax, ecx
		cdq	
		and	edx, 7
		push	0
		add	eax, edx
		mov	edx, [esp+40h+arg_4]
		sar	eax, 3
		mov	word ptr [esp+40h+var_28], ax
		mov	ecx, [esp+40h+var_28]
		and	ecx, 0FFFFh
		mov	word ptr [esp+40h+var_28+2], di
		imul	ecx, esi
		mov	[esp+40h+var_2C], ecx
		mov	ecx, 9
		xor	eax, eax
		lea	edi, [esp+40h+var_24]
		repe stosd
		mov	[esp+40h+var_1C], edx
		mov	edx, [esp+40h+arg_0]
		lea	eax, [esp+40h+var_34]
		push	edx
		mov	[esp+44h+var_14], eax
		mov	eax, dword_10009B90
		lea	edx, [esp+44h+var_24]
		mov	word ptr [esp+44h+var_34], 1
		mov	ecx, [eax]
		push	edx
		push	eax
		mov	[esp+4Ch+var_30], esi
		mov	[esp+4Ch+var_24], 24h
		mov	[esp+4Ch+var_20], 0E2h
		call	dword ptr [ecx+0Ch]
		test	eax, eax
		jnz	short loc_1000167A
		mov	eax, 1
		pop	edi
		pop	esi
		add	esp, 34h
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_1000167A:				; CODE XREF: Rex_bCreate+ADj
		cmp	eax, 8878000Ah
		jnz	short loc_100016A1
		mov	eax, dword_10009B94
		push	0
		push	offset aRex_bcreate
		push	offset aDsbufferDserr_
		push	eax
		call	ds:MessageBoxA
		xor	eax, eax
		pop	edi
		pop	esi
		add	esp, 34h
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_100016A1:				; CODE XREF: Rex_bCreate+BFj
		cmp	eax, 88780064h
		jnz	short loc_100016B6
		push	0
		push	offset aRex_bcreate
		push	offset aDsbufferDser_0
		jmp	short loc_1000170A
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_100016B6:				; CODE XREF: Rex_bCreate+E6j
		cmp	eax, 80070057h
		jnz	short loc_100016DE
		mov	edx, dword_10009B94
		push	0
		push	offset aRex_bcreate
		push	offset aDsbufferDser_1
		push	edx
		call	ds:MessageBoxA
		xor	eax, eax
		pop	edi
		pop	esi
		add	esp, 34h
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_100016DE:				; CODE XREF: Rex_bCreate+FBj
		cmp	eax, 8007000Eh
		push	0
		push	offset aRex_bcreate
		jnz	short loc_10001705
		mov	eax, dword_10009B94
		push	offset aDsbufferDser_2
		push	eax
		call	ds:MessageBoxA
		xor	eax, eax
		pop	edi
		pop	esi
		add	esp, 34h
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10001705:				; CODE XREF: Rex_bCreate+12Aj
		push	offset aCouldNotCreate

loc_1000170A:				; CODE XREF: Rex_bCreate+F4j
		mov	ecx, dword_10009B94
		push	ecx
		call	ds:MessageBoxA
		pop	edi
		xor	eax, eax
		pop	esi
		add	esp, 34h
		retn	
Rex_bCreate	endp ; sp = -10h

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 4
; Exported entry  22. Rex_GetSound

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e

		public Rex_GetSound
Rex_GetSound	proc near

var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  4
arg_4		= dword	ptr  8

		sub	esp, 0Ch
		mov	eax, [esp+0Ch+arg_0]
		push	ebx
		push	ebp
		push	esi
		push	edi
		push	offset unk_10007460
		push	eax
		mov	[esp+24h+var_C], 0
		call	_fopen
		mov	esi, eax
		add	esp, 8
		test	esi, esi
		jnz	short loc_10001769
		mov	ecx, dword_10009B94
		push	eax
		push	offset aRex_getsound
		push	offset aCouldNotFindOr
		push	ecx
		call	ds:MessageBoxA
		xor	eax, eax
		pop	edi
		pop	esi
		pop	ebp
		pop	ebx
		add	esp, 0Ch
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10001769:				; CODE XREF: Rex_GetSound+25j
		push	esi
		call	sub_10001990
		add	esp, 4
		test	eax, eax
		jnz	short loc_1000178D
		mov	edx, dword_10009B94
		push	eax
		push	offset aRex_getsound
		push	offset aErrorIn_wavFil
		push	edx
		jmp	loc_10001895
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_1000178D:				; CODE XREF: Rex_GetSound+54j
		push	esi
		call	sub_10001970
		add	esp, 4
		mov	edi, eax
		push	esi
		call	sub_10001950
		add	esp, 4
		push	esi
		call	sub_10001950
		add	esp, 4
		mov	ebp, eax
		push	esi
		call	sub_10001970
		add	esp, 4
		mov	[esp+1Ch+var_4], eax
		push	esi
		call	sub_10001970
		add	esp, 4
		push	esi
		call	sub_10001950
		add	esp, 4
		push	esi
		call	sub_10001950
		mov	ebx, 10h
		add	esp, 4
		cmp	edi, ebx
		mov	[esp+1Ch+var_8], eax
		jbe	short loc_100017F5
		add	edi, 0FFFFFFF0h
		push	esi
		push	edi
		lea	eax, [esp+24h+arg_0]
		push	1
		push	eax
		call	sub_10002310
		add	esp, 10h

loc_100017F5:				; CODE XREF: Rex_GetSound+BFj
		test	[esi+0Ch], bl
		jnz	short loc_1000183D

loc_100017FA:				; CODE XREF: Rex_GetSound+111j
		push	esi
		call	sub_10001930
		add	esp, 4
		cmp	al, 64h
		jnz	short loc_1000182E
		push	esi
		call	sub_10001930
		add	esp, 4
		cmp	al, 61h
		jnz	short loc_1000182E
		push	esi
		call	sub_10001930
		add	esp, 4
		cmp	al, 74h
		jnz	short loc_1000182E
		push	esi
		call	sub_10001930
		add	esp, 4
		cmp	al, 61h
		jz	short loc_10001835

loc_1000182E:				; CODE XREF: Rex_GetSound+E5j
					; Rex_GetSound+F2j ...
		test	[esi+0Ch], bl
		jz	short loc_100017FA
		jmp	short loc_1000183D
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10001835:				; CODE XREF: Rex_GetSound+10Cj
		mov	[esp+1Ch+var_C], 1

loc_1000183D:				; CODE XREF: Rex_GetSound+D8j
					; Rex_GetSound+113j
		mov	eax, [esp+1Ch+var_C]
		test	eax, eax
		jnz	short loc_1000184F
		xor	eax, eax
		pop	edi
		pop	esi
		pop	ebp
		pop	ebx
		add	esp, 0Ch
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_1000184F:				; CODE XREF: Rex_GetSound+123j
		push	esi
		call	sub_10001970
		add	esp, 4
		mov	edi, eax
		push	edi
		call	_malloc
		mov	ebx, eax
		add	esp, 4
		test	ebx, ebx
		jnz	short loc_10001871
		pop	edi
		pop	esi
		pop	ebp
		pop	ebx
		add	esp, 0Ch
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10001871:				; CODE XREF: Rex_GetSound+147j
		push	esi
		push	edi
		push	1
		push	ebx
		call	sub_10002310
		add	esp, 10h
		cmp	edi, eax
		jz	short loc_100018AE
		mov	ecx, dword_10009B94
		push	0
		push	offset aRex_getsound
		push	offset aErrorReading_w
		push	ecx

loc_10001895:				; CODE XREF: Rex_GetSound+68j
		call	ds:MessageBoxA
		push	esi
		call	_fclose
		add	esp, 4
		xor	eax, eax
		pop	edi
		pop	esi
		pop	ebp
		pop	ebx
		add	esp, 0Ch
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_100018AE:				; CODE XREF: Rex_GetSound+160j
		push	esi
		call	_fclose
		mov	edx, [esp+20h+var_8]
		mov	eax, [esp+20h+var_4]
		mov	esi, [esp+20h+arg_4]
		add	esp, 4
		push	edx
		push	eax
		push	ebp
		push	edi
		push	esi
		call	Rex_bCreate
		add	esp, 14h
		test	eax, eax
		jnz	short loc_100018E7
		push	ebx
		call	_free
		add	esp, 4
		xor	eax, eax
		pop	edi
		pop	esi
		pop	ebp
		pop	ebx
		add	esp, 0Ch
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_100018E7:				; CODE XREF: Rex_GetSound+1B2j
		mov	ecx, [esi]
		push	edi
		push	ebx
		push	0
		push	ecx
		call	Rex_bWrite
		add	esp, 10h
		test	eax, eax
		push	ebx
		jnz	short loc_1000190D
		call	_free
		add	esp, 4
		xor	eax, eax
		pop	edi
		pop	esi
		pop	ebp
		pop	ebx
		add	esp, 0Ch
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_1000190D:				; CODE XREF: Rex_GetSound+1D9j
		call	_free
		add	esp, 4
		mov	eax, 1
		pop	edi
		pop	esi
		pop	ebp
		pop	ebx
		add	esp, 0Ch
		retn	
Rex_GetSound	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e

sub_10001930	proc near		; CODE XREF: Rex_GetSound+DBp
					; Rex_GetSound+E8p ...

arg_0		= dword	ptr  4

		mov	eax, [esp+arg_0]
		lea	ecx, [esp+arg_0]
		push	eax
		push	1
		push	1
		push	ecx
		call	sub_10002310
		mov	al, byte ptr [esp+10h+arg_0]
		add	esp, 10h
		retn	
sub_10001930	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 8

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e

sub_10001950	proc near		; CODE XREF: Rex_GetSound+79p
					; Rex_GetSound+82p ...

arg_0		= dword	ptr  4

		mov	eax, [esp+arg_0]
		lea	ecx, [esp+arg_0]
		push	eax
		push	1
		push	2
		push	ecx
		call	sub_10002310
		mov	ax, word ptr [esp+10h+arg_0]
		add	esp, 10h
		retn	
sub_10001950	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 8

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e

sub_10001970	proc near		; CODE XREF: Rex_GetSound+6Ep
					; Rex_GetSound+8Dp ...

arg_0		= dword	ptr  4

		mov	eax, [esp+arg_0]
		lea	ecx, [esp+arg_0]
		push	eax
		push	1
		push	4
		push	ecx
		call	sub_10002310
		mov	eax, [esp+10h+arg_0]
		add	esp, 10h
		retn	
sub_10001970	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 8

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e

sub_10001990	proc near		; CODE XREF: Rex_GetSound+4Ap

var_10		= byte ptr -10h
var_C		= byte ptr -0Ch
var_8		= dword	ptr -8
var_4		= word ptr -4
arg_0		= dword	ptr  4

		sub	esp, 10h
		mov	eax, dword_10007464
		mov	cx, word_10007468
		push	esi
		push	edi
		mov	edi, [esp+18h+arg_0]
		lea	edx, [esp+18h+var_10]
		push	edi
		push	4
		push	1
		push	edx
		mov	[esp+28h+var_8], eax
		mov	[esp+28h+var_4], cx
		call	sub_10002310
		add	esp, 10h
		lea	eax, [esp+18h+arg_0]
		mov	[esp+18h+var_C], 0
		push	edi
		push	1
		push	4
		push	eax
		call	sub_10002310
		add	esp, 10h
		lea	esi, [esp+18h+var_8]
		lea	eax, [esp+18h+var_10]

loc_100019DF:				; CODE XREF: sub_10001990+6Dj
		mov	dl, [eax]
		mov	cl, dl
		cmp	dl, [esi]
		jnz	short loc_10001A03
		test	cl, cl
		jz	short loc_100019FF
		mov	dl, [eax+1]
		mov	cl, dl
		cmp	dl, [esi+1]
		jnz	short loc_10001A03
		add	eax, 2
		add	esi, 2
		test	cl, cl
		jnz	short loc_100019DF

loc_100019FF:				; CODE XREF: sub_10001990+59j
		xor	eax, eax
		jmp	short loc_10001A08
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10001A03:				; CODE XREF: sub_10001990+55j
					; sub_10001990+63j
		sbb	eax, eax
		sbb	eax, 0FFFFFFFFh

loc_10001A08:				; CODE XREF: sub_10001990+71j
		test	eax, eax
		jnz	short loc_10001A41
		mov	esi, [esp+18h+arg_0]
		push	edi
		push	4
		lea	eax, [esp+20h+var_10]
		push	1
		push	eax
		call	sub_10002310
		add	esp, 10h
		lea	ecx, [esp+18h+var_10]
		mov	[esp+18h+var_C], 0
		push	edi
		push	4
		push	1
		push	ecx
		call	sub_10002310
		add	esp, 10h
		mov	eax, esi
		pop	edi
		pop	esi
		add	esp, 10h
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10001A41:				; CODE XREF: sub_10001990+7Aj
		xor	esi, esi
		pop	edi
		mov	eax, esi
		pop	esi
		add	esp, 10h
		retn	
sub_10001990	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 8
; Exported entry  27. Rex_MIDI_init

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e

		public Rex_MIDI_init
Rex_MIDI_init	proc near
		push	esi
		push	0
		call	ds:CoInitialize
		test	eax, eax
		jl	short loc_10001AC7
		mov	esi, ds:CoCreateInstance
		push	offset dword_10009B98
		push	offset unk_10006000
		push	3
		push	0
		push	offset aBMI
		call	esi
		test	eax, eax
		jl	short loc_10001AC7
		mov	eax, dword_10009B98
		mov	edx, dword_10009B90
		push	0
		push	edx
		mov	ecx, [eax]
		push	0
		push	eax
		call	dword ptr [ecx+0Ch]
		test	eax, eax
		jl	short loc_10001AC7
		mov	eax, dword_10009B98
		push	0
		push	eax
		mov	ecx, [eax]
		call	dword ptr [ecx+60h]
		test	eax, eax
		jl	short loc_10001AC7
		push	offset dword_10009BA0
		push	offset unk_10006020
		push	3
		push	0
		push	offset aTMI
		call	esi
		test	eax, eax
		jl	short loc_10001AC7
		mov	eax, 1
		pop	esi
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10001AC7:				; CODE XREF: Rex_MIDI_init+Bj
					; Rex_MIDI_init+2Aj ...
		xor	eax, eax
		pop	esi
		retn	
Rex_MIDI_init	endp ; sp = -4

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 8
; Exported entry  26. Rex_MIDI_exit

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e

		public Rex_MIDI_exit
Rex_MIDI_exit	proc near
		mov	eax, dword_10009B98
		test	eax, eax
		jz	short loc_10001AEC
		mov	ecx, [eax]
		push	0
		push	0
		push	0
		push	0
		push	eax
		call	dword ptr [ecx+14h]
		mov	eax, dword_10009B98

loc_10001AEC:				; CODE XREF: Rex_MIDI_exit+7j
		mov	ecx, dword_10009B9C
		test	ecx, ecx
		jz	short loc_10001B18
		mov	edx, [ecx]
		push	eax
		push	0
		push	0
		push	0FFFFFFFFh
		push	offset aIMI
		push	ecx
		call	dword ptr [edx+4Ch]
		mov	eax, dword_10009B9C
		push	eax
		mov	ecx, [eax]
		call	dword ptr [ecx+8]
		mov	eax, dword_10009B98

loc_10001B18:				; CODE XREF: Rex_MIDI_exit+24j
		test	eax, eax
		jz	short loc_10001B30
		mov	edx, [eax]
		push	eax
		call	dword ptr [edx+98h]
		mov	eax, dword_10009B98
		push	eax
		mov	ecx, [eax]
		call	dword ptr [ecx+8]

loc_10001B30:				; CODE XREF: Rex_MIDI_exit+4Aj
		mov	eax, dword_10009BA0
		test	eax, eax
		jz	short loc_10001B3F
		mov	edx, [eax]
		push	eax
		call	dword ptr [edx+8]

loc_10001B3F:				; CODE XREF: Rex_MIDI_exit+67j
		jmp	ds:CoUninitialize
Rex_MIDI_exit	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h
; Exported entry  28. Rex_MIDI_load

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e

		public Rex_MIDI_load
Rex_MIDI_load	proc near

var_898		= dword	ptr -898h
var_894		= dword	ptr -894h
var_880		= dword	ptr -880h
var_87C		= dword	ptr -87Ch
var_878		= dword	ptr -878h
var_874		= dword	ptr -874h
var_760		= byte ptr -760h
var_514		= byte ptr -514h
var_444		= byte ptr -444h
var_428		= byte ptr -428h
var_208		= byte ptr -208h
var_14		= dword	ptr -14h

		sub	esp, 864h
		lea	eax, [esp+864h+var_514]
		push	esi
		push	104h
		push	eax
		call	__getcwd
		add	esp, 8
		test	eax, eax
		jz	loc_10001C88
		mov	esi, ds:MultiByteToWideChar
		lea	ecx, [esp+868h+var_208]
		push	104h
		push	ecx
		lea	edx, [esp+870h+var_514]
		push	0FFFFFFFFh
		push	edx
		push	1
		push	0
		call	esi
		mov	ecx, [esp+880h+var_14]
		lea	eax, [esp+880h+var_428]
		push	104h
		push	eax
		push	0FFFFFFFFh
		push	ecx
		push	1
		push	0
		call	esi
		mov	eax, dword_10009B9C
		test	eax, eax
		jz	short loc_10001BCD
		mov	edx, [eax]
		push	eax
		call	dword ptr [edx+8]
		mov	dword_10009B9C,	0

loc_10001BCD:				; CODE XREF: Rex_MIDI_load+6Bj
		mov	ecx, ds:dword_10006074
		mov	edx, ds:dword_10006078
		mov	eax, ds:dword_10006070
		mov	[esp+89Ch+var_87C], ecx
		mov	[esp+89Ch+var_878], edx
		lea	ecx, [esp+89Ch+var_444]
		mov	[esp+89Ch+var_880], eax
		mov	eax, ds:dword_1000607C
		lea	edx, [esp+89Ch+var_760]
		push	ecx
		push	edx
		mov	[esp+8A4h+var_874], eax
		mov	[esp+8A4h+var_898], 350h
		call	_wcscpy
		mov	eax, dword_10009BA0
		add	esp, 8
		lea	edx, [esp+89Ch+var_898]
		mov	[esp+89Ch+var_894], 12h
		mov	ecx, [eax]
		push	offset dword_10009B9C
		push	offset unk_10006010
		push	edx
		push	eax
		call	dword ptr [ecx+0Ch]
		test	eax, eax
		jnz	short loc_10001C88
		mov	edx, dword_10009B98
		mov	eax, dword_10009B9C
		push	edx
		push	0
		mov	ecx, [eax]
		push	0
		push	0FFFFFFFFh
		push	offset unk_10006030
		push	eax
		call	dword ptr [ecx+4Ch]
		test	eax, eax
		jnz	short loc_10001C88
		mov	edx, dword_10009B98
		mov	eax, dword_10009B9C
		push	edx
		push	0
		mov	ecx, [eax]
		push	0
		push	0FFFFFFFFh
		push	offset aZMI
		push	eax
		call	dword ptr [ecx+4Ch]
		test	eax, eax
		jnz	short loc_10001C88
		mov	eax, 1
		pop	esi
		add	esp, 864h
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10001C88:				; CODE XREF: Rex_MIDI_load+1Ej
					; Rex_MIDI_load+E7j ...
		xor	eax, eax
		pop	esi
		add	esp, 864h
		retn	
Rex_MIDI_load	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h
; Exported entry  32. Rex_MIDI_unload

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e

		public Rex_MIDI_unload
Rex_MIDI_unload	proc near
		mov	eax, dword_10009BA4
		test	eax, eax
		jz	short locret_10001CB9
		mov	ecx, [eax]
		push	eax
		call	dword ptr [ecx+8]
		mov	dword_10009BA4,	0

locret_10001CB9:			; CODE XREF: Rex_MIDI_unload+7j
		retn	
Rex_MIDI_unload	endp ; sp = -4

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 8
; Exported entry  29. Rex_MIDI_play

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e

		public Rex_MIDI_play
Rex_MIDI_play	proc near
		mov	ecx, dword_10009B9C
		test	ecx, ecx
		jz	short loc_10001CEB
		mov	eax, dword_10009B98
		push	offset dword_10009BA4
		push	0
		push	0
		mov	edx, [eax]
		push	0
		push	ecx
		push	eax
		call	dword ptr [edx+10h]
		test	eax, eax
		jnz	short loc_10001CEB
		mov	eax, 1
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10001CEB:				; CODE XREF: Rex_MIDI_play+8j
					; Rex_MIDI_play+23j
		xor	eax, eax
		retn	
Rex_MIDI_play	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 4
; Exported entry  30. Rex_MIDI_playlooped

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e

		public Rex_MIDI_playlooped
Rex_MIDI_playlooped proc near

arg_0		= dword	ptr  4

		mov	ecx, dword_10009B9C
		test	ecx, ecx
		jz	short loc_10001D3F
		mov	eax, [esp+arg_0]
		test	eax, eax
		jbe	short loc_10001D3F
		cmp	eax, 1
		jnz	short loc_10001D0C
		mov	eax, 2

loc_10001D0C:				; CODE XREF: Rex_MIDI_playlooped+15j
		mov	edx, [ecx]
		dec	eax
		push	eax
		push	ecx
		call	dword ptr [edx+18h]
		test	eax, eax
		jnz	short loc_10001D3F
		mov	eax, dword_10009B98
		mov	edx, dword_10009B9C
		push	offset dword_10009BA4
		push	0
		mov	ecx, [eax]
		push	0
		push	0
		push	edx
		push	eax
		call	dword ptr [ecx+10h]
		test	eax, eax
		jnz	short loc_10001D3F
		mov	eax, 1
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10001D3F:				; CODE XREF: Rex_MIDI_playlooped+8j
					; Rex_MIDI_playlooped+10j ...
		xor	eax, eax
		retn	
Rex_MIDI_playlooped endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h
; Exported entry  31. Rex_MIDI_stop

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e

		public Rex_MIDI_stop
Rex_MIDI_stop	proc near
		mov	eax, dword_10009B98
		test	eax, eax
		jz	short locret_10001D67
		mov	ecx, [eax]
		push	0
		push	0
		push	0
		push	0
		push	eax
		call	dword ptr [ecx+14h]

locret_10001D67:			; CODE XREF: Rex_MIDI_stop+7j
		retn	
Rex_MIDI_stop	endp ; sp = -14h

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h
; Exported entry   5. Rex_CD_init

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e

		public Rex_CD_init
Rex_CD_init	proc near

var_2C		= dword	ptr -2Ch
var_20		= byte ptr -20h
var_18		= dword	ptr -18h

		sub	esp, 10h
		mov	dword_10009BB0,	offset aCdaudio
		push	esi
		mov	esi, ds:mciSendCommandA
		push	offset unk_10009BA8
		push	2000h
		push	803h
		push	0
		call	esi
		test	eax, eax
		jnz	short loc_10001DC7
		mov	ecx, dword_10009BAC
		lea	eax, [esp+24h+var_20]
		push	eax
		push	100h
		push	814h
		push	ecx
		mov	[esp+34h+var_18], 3
		call	esi
		mov	edx, [esp+34h+var_2C]
		xor	eax, eax
		mov	dword_1000746C,	edx

loc_10001DC7:				; CODE XREF: Rex_CD_init+29j
		pop	esi
		add	esp, 10h
		retn	
Rex_CD_init	endp ; sp = -20h

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 8
; Exported entry   4. Rex_CD_get_num_tracks

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e

		public Rex_CD_get_num_tracks
Rex_CD_get_num_tracks proc near
		mov	eax, dword_1000746C
		retn	
Rex_CD_get_num_tracks endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h
; Exported entry   9. Rex_CD_play

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e

		public Rex_CD_play
Rex_CD_play	proc near		; CODE XREF: Rex_CD_resumej
		mov	eax, dword_10009BAC
		push	0
		push	0
		push	806h
		push	eax
		call	ds:mciSendCommandA
		retn	
Rex_CD_play	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h
; Exported entry  12. Rex_CD_play_track

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e

		public Rex_CD_play_track
Rex_CD_play_track proc near		; CODE XREF: Rex_CD_play_next_track+42p
					; Rex_CD_play_previous_track+3Cp

var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8

		sub	esp, 0Ch
		mov	ecx, dword_10009BAC
		lea	eax, [esp+0Ch+var_C]
		push	esi
		mov	esi, ds:mciSendCommandA
		push	eax
		push	400h
		push	80Dh
		push	ecx
		mov	[esp+20h+var_8], 0Ah
		call	esi
		xor	ecx, ecx
		cmp	eax, ecx
		jnz	short loc_10001E95
		mov	eax, [esp+20h+var_C]
		mov	dword_10009BC8,	ecx
		mov	edx, eax
		mov	dword_10009BC0,	ecx
		and	edx, 0FFh
		lea	ecx, [eax+1]
		mov	dword_10009BC4,	edx
		mov	edx, dword_1000746C
		cmp	ecx, edx
		jle	short loc_10001E75
		mov	edx, dword_10009BAC
		push	offset dword_10009BC0
		push	5
		push	806h
		push	edx
		call	esi
		pop	esi
		add	esp, 0Ch
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10001E75:				; CODE XREF: Rex_CD_play_track+59j
		inc	al
		push	offset dword_10009BC0
		and	eax, 0FFh
		push	0Dh
		mov	dword_10009BC8,	eax
		mov	eax, dword_10009BAC
		push	806h
		push	eax
		call	esi

loc_10001E95:				; CODE XREF: Rex_CD_play_track+2Ej
		pop	esi
		add	esp, 0Ch
		retn	
Rex_CD_play_track endp ; sp = -20h

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 8
; Exported entry  10. Rex_CD_play_next_track

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e

		public Rex_CD_play_next_track
Rex_CD_play_next_track proc near

var_10		= byte ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8

		sub	esp, 10h
		mov	ecx, dword_10009BAC
		lea	eax, [esp+10h+var_10]
		push	eax
		push	100h
		push	814h
		push	ecx
		mov	[esp+20h+var_8], 8
		call	ds:mciSendCommandA
		test	eax, eax
		jnz	short loc_10001EEA
		mov	edx, [esp+10h+var_C]
		mov	ecx, dword_1000746C
		lea	eax, [edx+1]
		cmp	eax, ecx
		jle	short loc_10001EE1
		mov	eax, 1

loc_10001EE1:				; CODE XREF: Rex_CD_play_next_track+3Aj
		push	eax
		call	Rex_CD_play_track
		add	esp, 4

loc_10001EEA:				; CODE XREF: Rex_CD_play_next_track+29j
		add	esp, 10h
		retn	
Rex_CD_play_next_track endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 4
; Exported entry  11. Rex_CD_play_previous_track

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e

		public Rex_CD_play_previous_track
Rex_CD_play_previous_track proc	near

var_10		= byte ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8

		sub	esp, 10h
		mov	ecx, dword_10009BAC
		lea	eax, [esp+10h+var_10]
		push	eax
		push	100h
		push	814h
		push	ecx
		mov	[esp+20h+var_8], 8
		call	ds:mciSendCommandA
		test	eax, eax
		jnz	short loc_10001F34
		mov	edx, [esp+10h+var_C]
		lea	eax, [edx-1]
		test	eax, eax
		jg	short loc_10001F2B
		mov	eax, dword_1000746C

loc_10001F2B:				; CODE XREF: Rex_CD_play_previous_track+34j
		push	eax
		call	Rex_CD_play_track
		add	esp, 4

loc_10001F34:				; CODE XREF: Rex_CD_play_previous_track+29j
		add	esp, 10h
		retn	
Rex_CD_play_previous_track endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h
; Exported entry   3. Rex_CD_fforward

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e

		public Rex_CD_fforward
Rex_CD_fforward	proc near

var_1C		= dword	ptr -1Ch
var_10		= byte ptr -10h
var_8		= dword	ptr -8

		sub	esp, 10h
		mov	ecx, dword_10009BAC
		lea	eax, [esp+10h+var_10]
		push	esi
		mov	esi, ds:mciSendCommandA
		push	eax
		push	100h
		push	814h
		push	ecx
		mov	[esp+24h+var_8], 2
		call	esi
		test	eax, eax
		jnz	short loc_10001FB5
		mov	eax, [esp+24h+var_1C]
		xor	edx, edx
		mov	dl, byte ptr [esp+24h+var_1C+2]
		mov	ecx, eax
		shr	ecx, 18h
		mov	dh, cl
		xor	ecx, ecx
		mov	cl, ah
		push	offset dword_10009BC0
		shl	edx, 8
		and	ecx, 0FFh
		push	4
		or	edx, ecx
		push	806h
		shl	edx, 8
		inc	al
		and	eax, 0FFh
		or	edx, eax
		mov	dword_10009BC4,	edx
		mov	edx, dword_10009BAC
		push	edx
		call	esi

loc_10001FB5:				; CODE XREF: Rex_CD_fforward+2Cj
		pop	esi
		add	esp, 10h
		retn	
Rex_CD_fforward	endp ; sp = -20h

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 8
; Exported entry  14. Rex_CD_rewind

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e

		public Rex_CD_rewind
Rex_CD_rewind	proc near

var_1C		= dword	ptr -1Ch
var_10		= byte ptr -10h
var_8		= dword	ptr -8

		sub	esp, 10h
		mov	ecx, dword_10009BAC
		lea	eax, [esp+10h+var_10]
		push	esi
		mov	esi, ds:mciSendCommandA
		push	eax
		push	100h
		push	814h
		push	ecx
		mov	[esp+24h+var_8], 2
		call	esi
		test	eax, eax
		jnz	short loc_1000200D
		mov	edx, [esp+24h+var_1C]
		mov	eax, dword_10009BAC
		push	offset dword_10009BC0
		push	4
		dec	edx
		push	806h
		push	eax
		mov	dword_10009BC4,	edx
		call	esi

loc_1000200D:				; CODE XREF: Rex_CD_rewind+2Cj
		pop	esi
		add	esp, 10h
		retn	
Rex_CD_rewind	endp ; sp = -20h

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h
; Exported entry   8. Rex_CD_pause

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e

		public Rex_CD_pause
Rex_CD_pause	proc near
		mov	eax, dword_10009BAC
		push	offset unk_10009BBC
		push	0
		push	809h
		push	eax
		call	ds:mciSendCommandA
		retn	
Rex_CD_pause	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 8
; Exported entry  13. Rex_CD_resume

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e

		public Rex_CD_resume
Rex_CD_resume	proc near
		jmp	Rex_CD_play
Rex_CD_resume	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h
; Exported entry  15. Rex_CD_stop

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e

		public Rex_CD_stop
Rex_CD_stop	proc near
		mov	eax, dword_10009BAC
		push	offset unk_10009BBC
		push	0
		push	808h
		push	eax
		call	ds:mciSendCommandA
		retn	
Rex_CD_stop	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 8
; Exported entry   7. Rex_CD_open_door

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e

		public Rex_CD_open_door
Rex_CD_open_door proc near
		mov	eax, dword_10009BAC
		push	0
		push	100h
		push	80Dh
		push	eax
		call	ds:mciSendCommandA
		retn	
Rex_CD_open_door endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 8
; Exported entry   2. Rex_CD_close_door

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e

		public Rex_CD_close_door
Rex_CD_close_door proc near
		mov	eax, dword_10009BAC
		push	0
		push	200h
		push	80Dh
		push	eax
		call	ds:mciSendCommandA
		retn	
Rex_CD_close_door endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 8
; Exported entry   1. Rex_CD_close

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e

		public Rex_CD_close
Rex_CD_close	proc near
		mov	eax, dword_10009BAC
		push	0
		push	0
		push	804h
		push	eax
		call	ds:mciSendCommandA
		retn	
Rex_CD_close	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h
; Exported entry   6. Rex_CD_is_playing

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e

		public Rex_CD_is_playing
Rex_CD_is_playing proc near

var_10		= byte ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8

		sub	esp, 10h
		mov	ecx, dword_10009BAC
		lea	eax, [esp+10h+var_10]
		push	eax
		push	100h
		push	814h
		push	ecx
		mov	[esp+20h+var_8], 4
		call	ds:mciSendCommandA
		mov	ecx, [esp+10h+var_C]
		xor	eax, eax
		cmp	ecx, 20Eh
		setz	al
		add	esp, 10h
		retn	
Rex_CD_is_playing endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 8

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e

j_DirectSoundCreate proc near		; CODE XREF: Rex_Init+12p
		jmp	ds:DirectSoundCreate
j_DirectSoundCreate endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

_free		proc near		; CODE XREF: Rex_GetSound+1B5p
					; Rex_GetSound+1DBp ...

arg_0		= dword	ptr  0Ch

		push	ecx
		push	esi
		mov	esi, [esp+arg_0]
		test	esi, esi
		jz	short loc_10002185
		push	9
		call	__lock
		add	esp, 4
		lea	eax, [esp+arg_0]
		lea	ecx, [esp+4]
		push	eax
		push	ecx
		push	esi
		call	___sbh_find_block
		add	esp, 0Ch
		test	eax, eax
		jz	short loc_1000216B
		mov	edx, [esp+arg_0]
		push	eax
		mov	eax, [esp+8]
		push	edx
		push	eax
		call	___sbh_free_block
		add	esp, 0Ch
		push	9
		call	__unlock
		add	esp, 4
		pop	esi
		pop	ecx
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_1000216B:				; CODE XREF: _free+29j
		push	9
		call	__unlock
		mov	ecx, dword_1000B030
		add	esp, 4
		push	esi
		push	0
		push	ecx
		call	ds:HeapFree

loc_10002185:				; CODE XREF: _free+8j
		pop	esi
		pop	ecx
		retn	
_free		endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

_fclose		proc near		; CODE XREF: Rex_GetSound+17Cp
					; Rex_GetSound+18Fp ...

arg_0		= dword	ptr  8

		push	esi
		mov	esi, [esp+arg_0]
		push	edi
		or	edi, 0FFFFFFFFh
		test	byte ptr [esi+0Ch], 40h
		jz	short loc_100021AB
		mov	dword ptr [esi+0Ch], 0
		mov	eax, edi
		pop	edi
		pop	esi
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_100021AB:				; CODE XREF: _fclose+Dj
		push	esi
		call	__lock_file
		add	esp, 4
		push	esi
		call	__fclose_lk
		add	esp, 4
		mov	edi, eax
		push	esi
		call	__unlock_file
		add	esp, 4
		mov	eax, edi
		pop	edi
		pop	esi
		retn	
_fclose		endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 4

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

__fclose_lk	proc near		; CODE XREF: _fclose+25p

arg_0		= dword	ptr  8

		push	esi
		mov	esi, [esp+arg_0]
		push	edi
		or	edi, 0FFFFFFFFh
		test	byte ptr [esi+0Ch], 83h
		jz	short loc_10002229
		push	esi
		call	__flush
		add	esp, 4
		mov	edi, eax
		push	esi
		call	__freebuf
		mov	eax, [esi+10h]
		add	esp, 4
		push	eax
		call	__close
		add	esp, 4
		test	eax, eax
		jge	short loc_10002212
		or	edi, 0FFFFFFFFh
		mov	dword ptr [esi+0Ch], 0
		mov	eax, edi
		pop	edi
		pop	esi
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10002212:				; CODE XREF: __fclose_lk+31j
		mov	eax, [esi+1Ch]
		test	eax, eax
		jz	short loc_10002229
		push	eax
		call	_free
		add	esp, 4
		mov	dword ptr [esi+1Ch], 0

loc_10002229:				; CODE XREF: __fclose_lk+Dj
					; __fclose_lk+47j
		mov	eax, edi
		mov	dword ptr [esi+0Ch], 0
		pop	edi
		pop	esi
		retn	
__fclose_lk	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

_malloc		proc near		; CODE XREF: Rex_GetSound+13Bp
					; __getdcwd_lk+B2p ...

arg_0		= dword	ptr  4

		mov	eax, dword_10009C44
		mov	ecx, [esp+arg_0]
		push	eax
		push	ecx
		call	__nh_malloc
		add	esp, 8
		retn	
_malloc		endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

__nh_malloc	proc near		; CODE XREF: _malloc+Bp

arg_0		= dword	ptr  8
arg_4		= dword	ptr  0Ch

		push	esi
		mov	esi, [esp+arg_0]
		cmp	esi, 0FFFFFFE0h
		push	edi
		ja	short loc_1000229F
		test	esi, esi
		jnz	short loc_10002274
		mov	esi, 1

loc_10002274:				; CODE XREF: __nh_malloc+Dj
		mov	edi, [esp+4+arg_4]

loc_10002278:				; CODE XREF: __nh_malloc+3Dj
		cmp	esi, 0FFFFFFE0h
		ja	short loc_10002288
		push	esi
		call	__heap_alloc
		add	esp, 4
		jmp	short loc_1000228A
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10002288:				; CODE XREF: __nh_malloc+1Bj
		xor	eax, eax

loc_1000228A:				; CODE XREF: __nh_malloc+26j
		test	eax, eax
		jnz	short loc_100022A1
		test	edi, edi
		jz	short loc_100022A1
		push	esi
		call	__callnewh
		add	esp, 4
		test	eax, eax
		jnz	short loc_10002278

loc_1000229F:				; CODE XREF: __nh_malloc+9j
		xor	eax, eax

loc_100022A1:				; CODE XREF: __nh_malloc+2Cj
					; __nh_malloc+30j
		pop	edi
		pop	esi
		retn	
__nh_malloc	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

__heap_alloc	proc near		; CODE XREF: __nh_malloc+1Ep

arg_0		= dword	ptr  4

		mov	eax, [esp+arg_0]
		push	esi
		push	edi
		lea	esi, [eax+0Fh]
		mov	eax, dword_10009564
		and	esi, 0FFFFFFF0h
		cmp	esi, eax
		ja	short loc_100022F2
		push	9
		call	__lock
		mov	ecx, esi
		add	esp, 4
		shr	ecx, 4
		push	ecx
		call	___sbh_alloc_block
		add	esp, 4
		mov	edi, eax
		push	9
		call	__unlock
		add	esp, 4
		test	edi, edi
		jz	short loc_100022F2
		mov	eax, edi
		pop	edi
		pop	esi
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_100022F2:				; CODE XREF: __heap_alloc+13j
					; __heap_alloc+3Bj
		mov	edx, dword_1000B030
		push	esi
		push	0
		push	edx
		call	ds:HeapAlloc
		pop	edi
		pop	esi
		retn	
__heap_alloc	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e

sub_10002310	proc near		; CODE XREF: Rex_GetSound+CDp
					; Rex_GetSound+156p ...

arg_0		= dword	ptr  8
arg_4		= dword	ptr  0Ch
arg_8		= dword	ptr  10h
arg_C		= dword	ptr  14h

		push	esi
		mov	esi, [esp+arg_C]
		push	edi
		push	esi
		call	__lock_file
		mov	eax, [esp+8+arg_8]
		mov	ecx, [esp+8+arg_4]
		mov	edx, [esp+8+arg_0]
		add	esp, 4
		push	esi
		push	eax
		push	ecx
		push	edx
		call	_fread
		add	esp, 10h
		mov	edi, eax
		push	esi
		call	__unlock_file
		add	esp, 4
		mov	eax, edi
		pop	edi
		pop	esi
		retn	
sub_10002310	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

_fread		proc near		; CODE XREF: sub_10002310+1Fp

arg_0		= dword	ptr  10h
arg_4		= dword	ptr  14h
arg_8		= dword	ptr  18h
arg_C		= dword	ptr  1Ch

		push	ecx
		push	ebx
		push	ebp
		mov	ebp, [esp+arg_8]
		push	esi
		imul	ebp, [esp+4+arg_4]
		push	edi
		mov	edi, [esp+8+arg_0]
		test	ebp, ebp
		mov	[esp+8+arg_0], edi
		mov	[esp+10h], ebp
		jnz	short loc_10002376
		xor	eax, eax
		pop	edi
		pop	esi
		pop	ebp
		pop	ebx
		pop	ecx
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10002376:				; CODE XREF: _fread+1Cj
		mov	ebx, [esp+8+arg_C]
		test	dword ptr [ebx+0Ch], 10Ch
		jz	short loc_1000238C
		mov	esi, [ebx+18h]
		mov	[esp+8+arg_C], esi
		jmp	short loc_10002398
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_1000238C:				; CODE XREF: _fread+31j
		mov	[esp+8+arg_C], 1000h
		mov	esi, [esp+8+arg_C]

loc_10002398:				; CODE XREF: _fread+3Aj _fread+E4j
		test	dword ptr [ebx+0Ch], 10Ch
		jz	short loc_100023DE
		mov	eax, [ebx+4]
		test	eax, eax
		jz	short loc_100023DE
		cmp	ebp, eax
		jnb	short loc_100023AE
		mov	eax, ebp

loc_100023AE:				; CODE XREF: _fread+5Aj
		mov	esi, [ebx]
		mov	ecx, eax
		mov	edx, ecx
		sub	ebp, eax
		shr	ecx, 2
		repe movsd
		mov	ecx, edx
		and	ecx, 3
		repe movsb
		mov	esi, [ebx+4]
		mov	edx, [ebx]
		mov	ecx, [esp+8+arg_0]
		sub	esi, eax
		add	edx, eax
		add	ecx, eax
		mov	[ebx+4], esi
		mov	[ebx], edx
		mov	[esp+8+arg_0], ecx
		mov	edi, ecx
		jmp	short loc_1000242E
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_100023DE:				; CODE XREF: _fread+4Fj _fread+56j
		cmp	ebp, esi
		jb	short loc_10002411
		test	esi, esi
		mov	eax, ebp
		jz	short loc_100023F0
		xor	edx, edx
		div	esi
		mov	eax, ebp
		sub	eax, edx

loc_100023F0:				; CODE XREF: _fread+96j
		push	eax
		mov	eax, [ebx+10h]
		push	edi
		push	eax
		call	__read
		add	esp, 0Ch
		test	eax, eax
		jz	short loc_10002444
		cmp	eax, 0FFFFFFFFh
		jz	short loc_1000245F
		sub	ebp, eax
		add	edi, eax
		mov	[esp+8+arg_0], edi
		jmp	short loc_10002432
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10002411:				; CODE XREF: _fread+90j
		push	ebx
		call	__filbuf
		add	esp, 4
		cmp	eax, 0FFFFFFFFh
		jz	short loc_1000247A
		mov	[edi], al
		mov	ecx, [ebx+18h]
		inc	edi
		dec	ebp
		mov	[esp+8+arg_0], edi
		mov	[esp+8+arg_C], ecx

loc_1000242E:				; CODE XREF: _fread+8Cj
		mov	esi, [esp+8+arg_C]

loc_10002432:				; CODE XREF: _fread+BFj
		test	ebp, ebp
		jnz	loc_10002398
		mov	eax, [esp+8+arg_8]
		pop	edi
		pop	esi
		pop	ebp
		pop	ebx
		pop	ecx
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10002444:				; CODE XREF: _fread+B0j
		mov	edx, [ebx+0Ch]
		mov	eax, [esp+10h]
		or	edx, 10h
		sub	eax, ebp
		mov	[ebx+0Ch], edx
		xor	edx, edx
		div	[esp+8+arg_4]
		pop	edi
		pop	esi
		pop	ebp
		pop	ebx
		pop	ecx
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_1000245F:				; CODE XREF: _fread+B5j
		mov	edx, [ebx+0Ch]
		mov	eax, [esp+10h]
		or	edx, 20h
		sub	eax, ebp
		mov	[ebx+0Ch], edx
		xor	edx, edx
		div	[esp+8+arg_4]
		pop	edi
		pop	esi
		pop	ebp
		pop	ebx
		pop	ecx
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_1000247A:				; CODE XREF: _fread+CDj
		mov	eax, [esp+10h]
		xor	edx, edx
		sub	eax, ebp
		div	[esp+8+arg_4]
		pop	edi
		pop	esi
		pop	ebp
		pop	ebx
		pop	ecx
		retn	
_fread		endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 8

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

__fsopen	proc near		; CODE XREF: _fopen+Cp

arg_0		= dword	ptr  8
arg_4		= dword	ptr  0Ch
arg_8		= dword	ptr  10h

		push	esi
		call	__getstream
		mov	esi, eax
		test	esi, esi
		jnz	short loc_1000249E
		pop	esi
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_1000249E:				; CODE XREF: __fsopen+Aj
		mov	eax, [esp+arg_8]
		mov	ecx, [esp+arg_4]
		mov	edx, [esp+arg_0]
		push	edi
		push	esi
		push	eax
		push	ecx
		push	edx
		call	__openfile
		add	esp, 10h
		mov	edi, eax
		push	esi
		call	__unlock_file
		add	esp, 4
		mov	eax, edi
		pop	edi
		pop	esi
		retn	
__fsopen	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

_fopen		proc near		; CODE XREF: Rex_GetSound+19p

arg_0		= dword	ptr  4
arg_4		= dword	ptr  8

		mov	eax, [esp+arg_4]
		mov	ecx, [esp+arg_0]
		push	40h
		push	eax
		push	ecx
		call	__fsopen
		add	esp, 0Ch
		retn	
_fopen		endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

_wcscpy		proc near		; CODE XREF: Rex_MIDI_load+BBp

arg_0		= dword	ptr  4
arg_4		= dword	ptr  8

		mov	edx, [esp+arg_4]
		mov	eax, [esp+arg_0]
		push	esi
		mov	cx, [edx]
		add	edx, 2
		test	cx, cx
		mov	[eax], cx
		lea	esi, [eax+2]
		jz	short loc_1000251B

loc_1000250A:				; CODE XREF: _wcscpy+29j
		mov	cx, [edx]
		add	edx, 2
		mov	[esi], cx
		add	esi, 2
		test	cx, cx
		jnz	short loc_1000250A

loc_1000251B:				; CODE XREF: _wcscpy+18j
		pop	esi
		retn	
_wcscpy		endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 4

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

__getcwd	proc near		; CODE XREF: Rex_MIDI_load+14p

arg_0		= dword	ptr  8
arg_4		= dword	ptr  0Ch

		push	esi
		push	0Ch
		call	__lock
		mov	eax, [esp+4+arg_4]
		mov	ecx, [esp+4+arg_0]
		add	esp, 4
		push	eax
		push	ecx
		push	0
		call	__getdcwd_lk
		add	esp, 0Ch
		mov	esi, eax
		push	0Ch
		call	__unlock
		add	esp, 4
		mov	eax, esi
		pop	esi
		retn	
__getcwd	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 4

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

__getdcwd_lk	proc near		; CODE XREF: __getcwd+17p

var_10C		= byte ptr -10Ch
var_10B		= byte ptr -10Bh
var_10A		= byte ptr -10Ah
var_109		= byte ptr -109h
var_108		= byte ptr -108h
var_104		= byte ptr -104h
arg_0		= dword	ptr  4
arg_4		= dword	ptr  8
arg_8		= dword	ptr  0Ch

		sub	esp, 10Ch
		push	ebx
		mov	ebx, [esp+110h+arg_0]
		push	esi
		push	edi
		test	ebx, ebx
		jz	short loc_100025C5
		push	ebx
		call	__validdrive
		add	esp, 4
		test	eax, eax
		jnz	short loc_10002593
		call	___doserrno
		mov	dword ptr [eax], 0Fh
		call	__errno
		mov	dword ptr [eax], 0Dh
		xor	eax, eax
		pop	edi
		pop	esi
		pop	ebx
		add	esp, 10Ch
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10002593:				; CODE XREF: __getdcwd_lk+1Fj
		lea	eax, [esp+118h+var_108]
		lea	ecx, [esp+118h+var_104]
		push	eax
		push	ecx
		lea	edx, [esp+120h+var_10C]
		add	bl, 40h
		push	104h
		push	edx
		mov	[esp+128h+var_10C], bl
		mov	[esp+128h+var_10B], 3Ah
		mov	[esp+128h+var_10A], 2Eh
		mov	[esp+128h+var_109], 0
		call	ds:GetFullPathNameA
		jmp	short loc_100025D5
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_100025C5:				; CODE XREF: __getdcwd_lk+12j
		lea	eax, [esp+118h+var_104]
		push	eax
		push	104h
		call	ds:GetCurrentDirectoryA

loc_100025D5:				; CODE XREF: __getdcwd_lk+73j
		test	eax, eax
		jz	loc_1000266F
		inc	eax
		cmp	eax, 104h
		ja	loc_1000266F
		mov	edx, [esp+118h+arg_4]
		mov	ecx, [esp+118h+arg_8]
		test	edx, edx
		jnz	short loc_10002627
		cmp	eax, ecx
		jg	short loc_10002601
		mov	eax, ecx

loc_10002601:				; CODE XREF: __getdcwd_lk+ADj
		push	eax
		call	_malloc
		mov	edx, eax
		add	esp, 4
		test	edx, edx
		jnz	short loc_10002642
		call	__errno
		mov	dword ptr [eax], 0Ch
		xor	eax, eax
		pop	edi
		pop	esi
		pop	ebx
		add	esp, 10Ch
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10002627:				; CODE XREF: __getdcwd_lk+A9j
		cmp	eax, ecx
		jle	short loc_10002642
		call	__errno
		mov	dword ptr [eax], 22h
		xor	eax, eax
		pop	edi
		pop	esi
		pop	ebx
		add	esp, 10Ch
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10002642:				; CODE XREF: __getdcwd_lk+BEj
					; __getdcwd_lk+D9j
		lea	edi, [esp+118h+var_104]
		or	ecx, 0FFFFFFFFh
		xor	eax, eax
		repne scasb
		not	ecx
		sub	edi, ecx
		mov	esi, edi
		mov	ebx, ecx
		mov	edi, edx
		mov	eax, edi
		shr	ecx, 2
		repe movsd
		mov	ecx, ebx
		and	ecx, 3
		repe movsb
		pop	edi
		pop	esi
		pop	ebx
		add	esp, 10Ch
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_1000266F:				; CODE XREF: __getdcwd_lk+87j
					; __getdcwd_lk+93j
		pop	edi
		pop	esi
		xor	eax, eax
		pop	ebx
		add	esp, 10Ch
		retn	
__getdcwd_lk	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 8

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

__validdrive	proc near		; CODE XREF: __getdcwd_lk+15p

arg_0		= dword	ptr  4

		mov	eax, [esp+arg_0]
		test	eax, eax
		jnz	short loc_1000268E
		mov	eax, 1
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_1000268E:				; CODE XREF: __validdrive+6j
		add	al, 40h
		mov	byte ptr [esp+arg_0+1],	3Ah
		mov	byte ptr [esp+arg_0], al
		lea	eax, [esp+arg_0]
		push	eax
		mov	byte ptr [esp+4+arg_0+2], 5Ch
		mov	byte ptr [esp+4+arg_0+3], 0
		call	ds:GetDriveTypeA
		test	eax, eax
		jz	short loc_100026BD
		cmp	eax, 1
		jz	short loc_100026BD
		mov	eax, 1
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_100026BD:				; CODE XREF: __validdrive+30j
					; __validdrive+35j
		xor	eax, eax
		retn	
__validdrive	endp


; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

__CRT_INIT@12	proc near		; CODE XREF: start+4Cp	start+74p ...

arg_4		= dword	ptr  8

		mov	eax, [esp+arg_4]
		cmp	eax, 1
		jnz	loc_100027CC
		call	ds:GetVersion	; Get current version number of	Windows
					; and information about	the operating system platform
		mov	ecx, dword_10009BDC
		mov	dword_10009C50,	eax
		test	ecx, ecx
		jnz	short loc_10002720
		cmp	al, 3
		jnz	short loc_100026F7
		test	eax, 80000000h
		jz	short loc_100026F7
		push	2
		call	sub_10004A70
		add	esp, 4

loc_100026F7:				; CODE XREF: __CRT_INIT@12+24j
					; __CRT_INIT@12+2Bj
		push	offset aKernel32_dll
		call	ds:GetModuleHandleA
		test	eax, eax
		jz	short loc_10002720
		push	offset aIstnt
		push	eax
		call	ds:GetProcAddress
		test	eax, eax
		jz	short loc_10002720
		push	1
		call	sub_10004A70
		add	esp, 4

loc_10002720:				; CODE XREF: __CRT_INIT@12+20j
					; __CRT_INIT@12+44j ...
		call	__heap_init
		test	eax, eax
		jnz	short loc_1000272C
		retn	0Ch
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_1000272C:				; CODE XREF: __CRT_INIT@12+67j
		mov	ecx, dword_10009C50
		xor	edx, edx
		mov	eax, ecx
		mov	dl, ch
		and	eax, 0FFh
		mov	dword_10009C5C,	edx
		mov	dword_10009C58,	eax
		shl	eax, 8
		add	eax, edx
		shr	ecx, 10h
		mov	dword_10009C54,	eax
		mov	dword_10009C50,	ecx
		call	__mtinit
		test	eax, eax
		jnz	short loc_1000276E
		call	__heap_term
		xor	eax, eax
		retn	0Ch
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_1000276E:				; CODE XREF: __CRT_INIT@12+A2j
		call	ds:GetCommandLineA
		mov	dword_1000B034,	eax
		call	___crtGetEnvironmentStringsA
		mov	ecx, dword_1000B034
		mov	dword_10009BD0,	eax
		test	ecx, ecx
		jz	short loc_100027BD
		test	eax, eax
		jz	short loc_100027BD
		call	__ioinit
		call	___initmbctable
		call	__setargv
		call	__setenvp
		call	__cinit
		mov	eax, dword_10009BCC
		inc	eax
		mov	dword_10009BCC,	eax
		mov	eax, 1
		retn	0Ch
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_100027BD:				; CODE XREF: __CRT_INIT@12+CBj
					; __CRT_INIT@12+CFj
		call	__mtterm
		call	__heap_term
		xor	eax, eax
		retn	0Ch
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_100027CC:				; CODE XREF: __CRT_INIT@12+7j
		test	eax, eax
		jnz	short loc_1000280C
		mov	eax, dword_10009BCC
		test	eax, eax
		jle	short loc_10002807
		mov	ecx, eax
		mov	eax, dword_10009C88
		dec	ecx
		test	eax, eax
		mov	dword_10009BCC,	ecx
		jnz	short loc_100027F0
		call	__cexit

loc_100027F0:				; CODE XREF: __CRT_INIT@12+129j
		call	__ioterm
		call	__mtterm
		call	__heap_term
		mov	eax, 1
		retn	0Ch
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10002807:				; CODE XREF: __CRT_INIT@12+117j
		xor	eax, eax
		retn	0Ch
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_1000280C:				; CODE XREF: __CRT_INIT@12+10Ej
		cmp	eax, 3
		jnz	short loc_1000281B
		push	0
		call	__freeptd
		add	esp, 4

loc_1000281B:				; CODE XREF: __CRT_INIT@12+14Fj
		mov	eax, 1
		retn	0Ch
__CRT_INIT@12	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

		public start
start		proc near

arg_0		= dword	ptr  10h
arg_4		= dword	ptr  14h
arg_8		= dword	ptr  18h

		push	ebx
		push	ebp
		push	esi
		mov	esi, [esp+arg_4]
		test	esi, esi
		push	edi
		mov	eax, 1
		jnz	short loc_10002854
		mov	ecx, dword_10009BCC
		test	ecx, ecx
		jnz	short loc_10002854
		xor	eax, eax
		pop	edi
		pop	esi
		pop	ebp
		pop	ebx
		retn	0Ch
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10002854:				; CODE XREF: start+Fj start+19j
		mov	edi, [esp+4+arg_8]
		mov	ebx, [esp+4+arg_0]
		cmp	esi, 1
		jz	short loc_10002866
		cmp	esi, 2
		jnz	short loc_1000288E

loc_10002866:				; CODE XREF: start+2Fj
		mov	ecx, dword_1000B038
		test	ecx, ecx
		jz	short loc_10002875
		push	edi
		push	esi
		push	ebx
		call	ecx

loc_10002875:				; CODE XREF: start+3Ej
		test	eax, eax
		jz	short loc_10002885
		push	edi
		push	esi
		push	ebx
		call	__CRT_INIT@12
		test	eax, eax
		jnz	short loc_1000288E

loc_10002885:				; CODE XREF: start+47j
		xor	eax, eax
		pop	edi
		pop	esi
		pop	ebp
		pop	ebx
		retn	0Ch
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_1000288E:				; CODE XREF: start+34j	start+53j
		push	edi
		push	esi
		push	ebx
		call	_DllMain@12
		cmp	esi, 1
		mov	ebp, eax
		jnz	short loc_100028A9
		test	ebp, ebp
		jnz	short loc_100028A9
		push	edi
		push	eax
		push	ebx
		call	__CRT_INIT@12

loc_100028A9:				; CODE XREF: start+6Bj	start+6Fj
		test	esi, esi
		jz	short loc_100028B2
		cmp	esi, 3
		jnz	short loc_100028D4

loc_100028B2:				; CODE XREF: start+7Bj
		push	edi
		push	esi
		push	ebx
		call	__CRT_INIT@12
		test	eax, eax
		jnz	short loc_100028C0
		xor	ebp, ebp

loc_100028C0:				; CODE XREF: start+8Cj
		test	ebp, ebp
		jz	short loc_100028D4
		mov	eax, dword_1000B038
		test	eax, eax
		jz	short loc_100028D4
		push	edi
		push	esi
		push	ebx
		call	eax
		mov	ebp, eax

loc_100028D4:				; CODE XREF: start+80j	start+92j ...
		pop	edi
		mov	eax, ebp
		pop	esi
		pop	ebp
		pop	ebx
		retn	0Ch
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 4
start		endp ; sp = -0Ch


; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

__amsg_exit	proc near		; CODE XREF: __lock+25p __getptd+66p ...

arg_0		= dword	ptr  4

		mov	eax, dword_10009BD8
		cmp	eax, 1
		jz	short loc_100028F7
		test	eax, eax
		jnz	short loc_100028FC
		cmp	dword_10009BDC,	1
		jnz	short loc_100028FC

loc_100028F7:				; CODE XREF: __amsg_exit+8j
		call	__FF_MSGBANNER

loc_100028FC:				; CODE XREF: __amsg_exit+Cj
					; __amsg_exit+15j
		mov	eax, [esp+arg_0]
		push	eax
		call	__NMSG_WRITE
		add	esp, 4
		push	0FFh
		call	off_10007478
		add	esp, 4
		retn	
__amsg_exit	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

__heap_init	proc near		; CODE XREF: __CRT_INIT@12+60p
		push	0
		push	1000h
		push	0
		call	ds:HeapCreate
		test	eax, eax
		mov	dword_1000B030,	eax
		jnz	short loc_10002939
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10002939:				; CODE XREF: __heap_init+16j
		call	___sbh_new_region
		test	eax, eax
		jnz	short loc_10002951
		mov	eax, dword_1000B030
		push	eax
		call	ds:HeapDestroy
		xor	eax, eax
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10002951:				; CODE XREF: __heap_init+20j
		mov	eax, 1
		retn	
__heap_init	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

__heap_term	proc near		; CODE XREF: __CRT_INIT@12+A4p
					; __CRT_INIT@12+102p ...
		push	esi
		push	edi
		mov	edi, ds:VirtualFree
		mov	esi, offset off_10007540

loc_1000296D:				; CODE XREF: __heap_term+26j
		mov	eax, [esi+10h]
		test	eax, eax
		jz	short loc_1000297E
		push	8000h
		push	0
		push	eax
		call	edi

loc_1000297E:				; CODE XREF: __heap_term+12j
		mov	esi, [esi]
		cmp	esi, offset off_10007540
		jnz	short loc_1000296D
		mov	eax, dword_1000B030
		push	eax
		call	ds:HeapDestroy
		pop	edi
		pop	esi
		retn	
__heap_term	endp ; sp = -0Ch

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

__mtinitlocks	proc near		; CODE XREF: __mtinit+1p
		mov	eax, off_100074C4
		push	esi
		mov	esi, ds:InitializeCriticalSection
		push	eax
		call	esi
		mov	ecx, off_100074B4
		push	ecx
		call	esi
		mov	edx, off_100074A4
		push	edx
		call	esi
		mov	eax, off_10007484
		push	eax
		call	esi
		pop	esi
		retn	
__mtinitlocks	endp ; sp = -10h

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 8

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

__mtdeletelocks	proc near		; CODE XREF: __mttermp
		push	esi
		push	edi
		mov	edi, ds:DeleteCriticalSection
		mov	esi, offset dword_10007480

loc_100029DD:				; CODE XREF: __mtdeletelocks+4Aj
		mov	eax, [esi]
		test	eax, eax
		jz	short loc_10002A11
		cmp	esi, offset off_100074C4
		jz	short loc_10002A11
		cmp	esi, offset off_100074B4
		jz	short loc_10002A11
		cmp	esi, offset off_100074A4
		jz	short loc_10002A11
		cmp	esi, offset off_10007484
		jz	short loc_10002A11
		push	eax
		call	edi
		mov	eax, [esi]
		push	eax
		call	_free
		add	esp, 4

loc_10002A11:				; CODE XREF: __mtdeletelocks+11j
					; __mtdeletelocks+19j ...
		add	esi, 4
		cmp	esi, offset off_10007540
		jl	short loc_100029DD
		mov	ecx, off_100074A4
		push	ecx
		call	edi
		mov	edx, off_100074B4
		push	edx
		call	edi
		mov	eax, off_100074C4
		push	eax
		call	edi
		mov	ecx, off_10007484
		push	ecx
		call	edi
		pop	edi
		pop	esi
		retn	
__mtdeletelocks	endp ; sp = -14h

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function bp-based	frame

__lock		proc near		; CODE XREF: _free+Cp __heap_alloc+17p ...

arg_0		= dword	ptr  8

		push	ebp
		mov	ebp, esp
		push	edi
		mov	edi, [ebp+arg_0]
		mov	eax, dword_10007480[edi*4]
		test	eax, eax
		jnz	short loc_10002AB5
		push	esi
		push	18h
		call	_malloc
		mov	esi, eax
		add	esp, 4
		test	esi, esi
		jnz	short loc_10002A7D
		push	11h
		call	__amsg_exit
		add	esp, 4

loc_10002A7D:				; CODE XREF: __lock+21j
		push	11h
		call	__lock
		mov	eax, dword_10007480[edi*4]
		add	esp, 4
		test	eax, eax
		push	esi
		jnz	short loc_10002AA2
		call	ds:InitializeCriticalSection
		mov	dword_10007480[edi*4], esi
		jmp	short loc_10002AAA
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10002AA2:				; CODE XREF: __lock+41j
		call	_free
		add	esp, 4

loc_10002AAA:				; CODE XREF: __lock+50j
		push	11h
		call	__unlock
		add	esp, 4
		pop	esi

loc_10002AB5:				; CODE XREF: __lock+10j
		mov	eax, dword_10007480[edi*4]
		push	eax
		call	ds:EnterCriticalSection
		pop	edi
		pop	ebp
		retn	
__lock		endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function bp-based	frame

__unlock	proc near		; CODE XREF: _free+40p	_free+4Dp ...

arg_0		= dword	ptr  8

		push	ebp
		mov	ebp, esp
		mov	eax, [ebp+arg_0]
		mov	ecx, dword_10007480[eax*4]
		push	ecx
		call	ds:LeaveCriticalSection
		pop	ebp
		retn	
__unlock	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function bp-based	frame

__lock_file	proc near		; CODE XREF: _fclose+1Cp
					; sub_10002310+7p

arg_0		= dword	ptr  8

		push	ebp
		mov	ebp, esp
		mov	eax, [ebp+arg_0]
		cmp	eax, offset off_10009888
		jb	short loc_10002B1A
		cmp	eax, offset unk_10009AE8
		ja	short loc_10002B1A
		sub	eax, offset off_10009888
		sar	eax, 5
		add	eax, 1Ch
		push	eax
		call	__lock
		add	esp, 4
		pop	ebp
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10002B1A:				; CODE XREF: __lock_file+Bj
					; __lock_file+12j
		add	eax, 20h
		push	eax
		call	ds:EnterCriticalSection
		pop	ebp
		retn	
__lock_file	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function bp-based	frame

__lock_file2	proc near		; CODE XREF: sub_100034F0+39p
					; __getstream+36p

arg_0		= dword	ptr  8
arg_4		= dword	ptr  0Ch

		push	ebp
		mov	ebp, esp
		mov	eax, [ebp+arg_0]
		cmp	eax, 14h
		jge	short loc_10002B49
		add	eax, 1Ch
		push	eax
		call	__lock
		add	esp, 4
		pop	ebp
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10002B49:				; CODE XREF: __lock_file2+9j
		mov	eax, [ebp+arg_4]
		add	eax, 20h
		push	eax
		call	ds:EnterCriticalSection
		pop	ebp
		retn	
__lock_file2	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function bp-based	frame

__unlock_file	proc near		; CODE XREF: _fclose+30p
					; sub_10002310+2Ap ...

arg_0		= dword	ptr  8

		push	ebp
		mov	ebp, esp
		mov	eax, [ebp+arg_0]
		cmp	eax, offset off_10009888
		jb	short loc_10002B8A
		cmp	eax, offset unk_10009AE8
		ja	short loc_10002B8A
		sub	eax, offset off_10009888
		sar	eax, 5
		add	eax, 1Ch
		push	eax
		call	__unlock
		add	esp, 4
		pop	ebp
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10002B8A:				; CODE XREF: __unlock_file+Bj
					; __unlock_file+12j
		add	eax, 20h
		push	eax
		call	ds:LeaveCriticalSection
		pop	ebp
		retn	
__unlock_file	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function bp-based	frame

__unlock_file2	proc near		; CODE XREF: sub_100034F0+8Ep
					; __getstream+4Ep

arg_0		= dword	ptr  8
arg_4		= dword	ptr  0Ch

		push	ebp
		mov	ebp, esp
		mov	eax, [ebp+arg_0]
		cmp	eax, 14h
		jge	short loc_10002BB9
		add	eax, 1Ch
		push	eax
		call	__unlock
		add	esp, 4
		pop	ebp
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10002BB9:				; CODE XREF: __unlock_file2+9j
		mov	eax, [ebp+arg_4]
		add	eax, 20h
		push	eax
		call	ds:LeaveCriticalSection
		pop	ebp
		retn	
__unlock_file2	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

___sbh_new_region proc near		; CODE XREF: __heap_init+19p
					; ___sbh_alloc_block+1EDp
		mov	eax, dword_10007550
		push	ebp
		push	esi
		cmp	eax, 0FFFFFFFFh
		push	edi
		jnz	short loc_10002BE4
		mov	ebp, offset off_10007540
		jmp	short loc_10002C01
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10002BE4:				; CODE XREF: ___sbh_new_region+Bj
		mov	eax, dword_1000B030
		push	2020h
		push	0
		push	eax
		call	ds:HeapAlloc
		mov	ebp, eax
		test	ebp, ebp
		jz	loc_10002D2C

loc_10002C01:				; CODE XREF: ___sbh_new_region+12j
		mov	edi, ds:VirtualAlloc
		push	4
		push	2000h
		push	400000h
		push	0
		call	edi
		mov	esi, eax
		test	esi, esi
		jz	loc_10002D15
		push	4
		push	1000h
		push	10000h
		push	esi
		call	edi
		test	eax, eax
		jz	loc_10002D07
		cmp	ebp, offset off_10007540
		jnz	short loc_10002C68
		mov	eax, off_10007540
		test	eax, eax
		jnz	short loc_10002C53
		mov	off_10007540, offset off_10007540

loc_10002C53:				; CODE XREF: ___sbh_new_region+77j
		mov	eax, off_10007544
		test	eax, eax
		jnz	short loc_10002C83
		mov	off_10007544, offset off_10007540
		jmp	short loc_10002C83
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10002C68:				; CODE XREF: ___sbh_new_region+6Ej
		mov	dword ptr [ebp+0], offset off_10007540
		mov	ecx, off_10007544
		mov	[ebp+4], ecx
		mov	off_10007544, ebp
		mov	edx, [ebp+4]
		mov	[edx], ebp

loc_10002C83:				; CODE XREF: ___sbh_new_region+8Aj
					; ___sbh_new_region+96j
		lea	eax, [esi+400000h]
		lea	ecx, [ebp+18h]
		lea	edx, [ebp+98h]
		mov	[ebp+14h], eax
		mov	[ebp+10h], esi
		mov	[ebp+8], ecx
		mov	[ebp+0Ch], edx
		xor	eax, eax
		mov	edi, 0F1h

loc_10002CA5:				; CODE XREF: ___sbh_new_region+F0j
		xor	edx, edx
		cmp	eax, 10h
		setnl	dl
		dec	edx
		add	ecx, 8
		and	edx, edi
		dec	edx
		inc	eax
		mov	[ecx-8], edx
		mov	[ecx-4], edi
		cmp	eax, 400h
		jl	short loc_10002CA5
		mov	ecx, 4000h
		xor	eax, eax
		mov	edi, esi
		repe stosd
		mov	eax, [ebp+10h]
		add	eax, 10000h
		cmp	esi, eax
		jnb	short loc_10002D01
		mov	ecx, 0F0h
		mov	al, 0FFh

loc_10002CE0:				; CODE XREF: ___sbh_new_region+12Fj
		lea	edx, [esi+8]
		mov	[esi+4], ecx
		mov	[esi], edx
		mov	[esi+0F8h], al
		mov	edx, [ebp+10h]
		add	esi, 1000h
		add	edx, 10000h
		cmp	esi, edx
		jb	short loc_10002CE0

loc_10002D01:				; CODE XREF: ___sbh_new_region+107j
		mov	eax, ebp
		pop	edi
		pop	esi
		pop	ebp
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10002D07:				; CODE XREF: ___sbh_new_region+62j
		push	8000h
		push	0
		push	esi
		call	ds:VirtualFree

loc_10002D15:				; CODE XREF: ___sbh_new_region+4Bj
		cmp	ebp, offset off_10007540
		jz	short loc_10002D2C
		mov	eax, dword_1000B030
		push	ebp
		push	0
		push	eax
		call	ds:HeapFree

loc_10002D2C:				; CODE XREF: ___sbh_new_region+2Bj
					; ___sbh_new_region+14Bj
		pop	edi
		pop	esi
		xor	eax, eax
		pop	ebp
		retn	
___sbh_new_region endp ; sp = -20h

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

___sbh_release_region proc near		; CODE XREF: ___sbh_decommit_pages+ACp

arg_0		= dword	ptr  8

		push	esi
		mov	esi, [esp+arg_0]
		push	8000h
		push	0
		mov	eax, [esi+10h]
		push	eax
		call	ds:VirtualFree
		cmp	off_10009560, esi
		jnz	short loc_10002D67
		mov	ecx, [esi+4]
		mov	off_10009560, ecx

loc_10002D67:				; CODE XREF: ___sbh_release_region+1Cj
		cmp	esi, offset off_10007540
		jz	short loc_10002D8F
		mov	edx, [esi+4]
		mov	eax, [esi]
		push	esi
		push	0
		mov	[edx], eax
		mov	ecx, [esi]
		mov	edx, [esi+4]
		mov	[ecx+4], edx
		mov	eax, dword_1000B030
		push	eax
		call	ds:HeapFree
		pop	esi
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10002D8F:				; CODE XREF: ___sbh_release_region+2Dj
		mov	dword_10007550,	0FFFFFFFFh
		pop	esi
		retn	
___sbh_release_region endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 8

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

___sbh_decommit_pages proc near		; CODE XREF: ___sbh_free_block+49p

arg_0		= dword	ptr  14h

		push	ebx
		push	ebp
		push	esi
		push	edi
		mov	edi, off_10007544

loc_10002DAA:				; CODE XREF: ___sbh_decommit_pages+C2j
		cmp	dword ptr [edi+10h], 0FFFFFFFFh
		jz	loc_10002E54
		xor	ebp, ebp
		lea	esi, [edi+2010h]
		mov	ebx, 3FF000h

loc_10002DC1:				; CODE XREF: ___sbh_decommit_pages+7Bj
		cmp	dword ptr [esi], 0F0h
		jnz	short loc_10002E10
		mov	eax, [edi+10h]
		push	4000h
		add	eax, ebx
		push	1000h
		push	eax
		call	ds:VirtualFree
		test	eax, eax
		jz	short loc_10002E10
		mov	dword ptr [esi], 0FFFFFFFFh
		mov	edx, dword_10009C40
		dec	edx
		mov	dword_10009C40,	edx
		mov	eax, [edi+0Ch]
		test	eax, eax
		jz	short loc_10002E01
		cmp	eax, esi
		jbe	short loc_10002E04

loc_10002E01:				; CODE XREF: ___sbh_decommit_pages+5Bj
		mov	[edi+0Ch], esi

loc_10002E04:				; CODE XREF: ___sbh_decommit_pages+5Fj
		mov	eax, [esp+arg_0]
		inc	ebp
		dec	eax
		mov	[esp+arg_0], eax
		jz	short loc_10002E1D

loc_10002E10:				; CODE XREF: ___sbh_decommit_pages+27j
					; ___sbh_decommit_pages+41j
		sub	ebx, 1000h
		sub	esi, 8
		test	ebx, ebx
		jge	short loc_10002DC1

loc_10002E1D:				; CODE XREF: ___sbh_decommit_pages+6Ej
		mov	edx, edi
		mov	edi, [edi+4]
		test	ebp, ebp
		jz	short loc_10002E54
		cmp	dword ptr [edx+18h], 0FFFFFFFFh
		jnz	short loc_10002E54
		mov	eax, 1
		lea	ecx, [edx+20h]

loc_10002E34:				; CODE XREF: ___sbh_decommit_pages+A2j
		cmp	dword ptr [ecx], 0FFFFFFFFh
		jnz	short loc_10002E44
		inc	eax
		add	ecx, 8
		cmp	eax, 400h
		jl	short loc_10002E34

loc_10002E44:				; CODE XREF: ___sbh_decommit_pages+97j
		cmp	eax, 400h
		jnz	short loc_10002E54
		push	edx
		call	___sbh_release_region
		add	esp, 4

loc_10002E54:				; CODE XREF: ___sbh_decommit_pages+Ej
					; ___sbh_decommit_pages+84j ...
		cmp	edi, off_10007544
		jz	short loc_10002E68
		mov	eax, [esp+arg_0]
		test	eax, eax
		jg	loc_10002DAA

loc_10002E68:				; CODE XREF: ___sbh_decommit_pages+BAj
		pop	edi
		pop	esi
		pop	ebp
		pop	ebx
		retn	
___sbh_decommit_pages endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 4

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

___sbh_find_block proc near		; CODE XREF: _free+1Fp

arg_0		= dword	ptr  4
arg_4		= dword	ptr  8
arg_8		= dword	ptr  0Ch

		mov	ecx, [esp+arg_0]
		mov	eax, offset off_10007540

loc_10002E79:				; CODE XREF: ___sbh_find_block+1Cj
		cmp	ecx, [eax+10h]
		jbe	short loc_10002E83
		cmp	ecx, [eax+14h]
		jb	short loc_10002E8E

loc_10002E83:				; CODE XREF: ___sbh_find_block+Cj
		mov	eax, [eax]
		cmp	eax, offset off_10007540
		jz	short loc_10002EC6
		jmp	short loc_10002E79
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10002E8E:				; CODE XREF: ___sbh_find_block+11j
		test	cl, 0Fh
		jnz	short loc_10002EC6
		mov	edx, ecx
		and	edx, 0FFFh
		cmp	edx, 100h
		jb	short loc_10002EC6
		mov	edx, [esp+arg_4]
		mov	[edx], eax
		mov	edx, [esp+arg_8]
		mov	eax, ecx
		and	eax, 0FFFFF000h
		sub	ecx, eax
		mov	[edx], eax
		sub	ecx, 100h
		sar	ecx, 4
		lea	eax, [ecx+eax+8]
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10002EC6:				; CODE XREF: ___sbh_find_block+1Aj
					; ___sbh_find_block+21j ...
		xor	eax, eax
		retn	
___sbh_find_block endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 8

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

___sbh_free_block proc near		; CODE XREF: _free+36p

arg_0		= dword	ptr  4
arg_4		= dword	ptr  8
arg_8		= dword	ptr  0Ch

		mov	eax, [esp+arg_0]
		mov	ecx, [esp+arg_4]
		push	esi
		xor	edx, edx
		sub	ecx, [eax+10h]
		sar	ecx, 0Ch
		mov	esi, [eax+ecx*8+18h]
		lea	eax, [eax+ecx*8+18h]
		mov	ecx, [esp+4+arg_8]
		mov	dl, [ecx]
		add	esi, edx
		mov	[eax], esi
		mov	byte ptr [ecx],	0
		mov	ecx, [eax]
		mov	dword ptr [eax+4], 0F1h
		cmp	ecx, 0F0h
		jnz	short loc_10002F21
		mov	eax, dword_10009C40
		inc	eax
		cmp	eax, 20h
		mov	dword_10009C40,	eax
		jnz	short loc_10002F21
		push	10h
		call	___sbh_decommit_pages
		add	esp, 4

loc_10002F21:				; CODE XREF: ___sbh_free_block+35j
					; ___sbh_free_block+45j
		pop	esi
		retn	
___sbh_free_block endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

___sbh_alloc_block proc	near		; CODE XREF: __heap_alloc+25p
					; _calloc+48p

arg_0		= dword	ptr  8

		push	ecx
		mov	ecx, off_10009560
		push	ebx
		mov	ebx, [esp+4+arg_0]
		push	ebp
		push	esi
		push	edi
		mov	[esp+10h], ecx

loc_10002F43:				; CODE XREF: ___sbh_alloc_block+B3j
		mov	eax, [ecx+10h]
		cmp	eax, 0FFFFFFFFh
		jz	loc_10002FD4
		mov	edi, [ecx+8]
		lea	ebp, [ecx+2018h]
		mov	esi, edi
		sub	esi, ecx
		sub	esi, 18h
		sar	esi, 3
		shl	esi, 0Ch
		add	esi, eax
		cmp	edi, ebp
		jnb	short loc_10002F99

loc_10002F6B:				; CODE XREF: ___sbh_alloc_block+67j
		mov	eax, [edi]
		cmp	eax, ebx
		jl	short loc_10002F8C
		cmp	[edi+4], ebx
		jbe	short loc_10002F8C
		push	ebx
		push	eax
		push	esi
		call	___sbh_alloc_block_from_page
		add	esp, 0Ch
		test	eax, eax
		jnz	short loc_10002FE8
		mov	ecx, [esp+10h]
		mov	[edi+4], ebx

loc_10002F8C:				; CODE XREF: ___sbh_alloc_block+3Fj
					; ___sbh_alloc_block+44j
		add	edi, 8
		add	esi, 1000h
		cmp	edi, ebp
		jb	short loc_10002F6B

loc_10002F99:				; CODE XREF: ___sbh_alloc_block+39j
		mov	ebp, [ecx+8]
		mov	edi, [ecx+10h]
		lea	esi, [ecx+18h]
		cmp	esi, ebp
		jnb	short loc_10002FD4

loc_10002FA6:				; CODE XREF: ___sbh_alloc_block+A2j
		mov	eax, [esi]
		cmp	eax, ebx
		jl	short loc_10002FC7
		cmp	[esi+4], ebx
		jbe	short loc_10002FC7
		push	ebx
		push	eax
		push	edi
		call	___sbh_alloc_block_from_page
		add	esp, 0Ch
		test	eax, eax
		jnz	short loc_10003001
		mov	ecx, [esp+10h]
		mov	[esi+4], ebx

loc_10002FC7:				; CODE XREF: ___sbh_alloc_block+7Aj
					; ___sbh_alloc_block+7Fj
		add	esi, 8
		add	edi, 1000h
		cmp	esi, ebp
		jb	short loc_10002FA6

loc_10002FD4:				; CODE XREF: ___sbh_alloc_block+19j
					; ___sbh_alloc_block+74j
		mov	ecx, [ecx]
		mov	eax, off_10009560
		cmp	ecx, eax
		mov	[esp+10h], ecx
		jz	short loc_1000301A
		jmp	loc_10002F43
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10002FE8:				; CODE XREF: ___sbh_alloc_block+53j
		mov	ecx, [esp+10h]
		mov	off_10009560, ecx
		mov	edx, [edi]
		sub	edx, ebx
		mov	[edi], edx
		mov	[ecx+8], edi
		pop	edi
		pop	esi
		pop	ebp
		pop	ebx
		pop	ecx
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10003001:				; CODE XREF: ___sbh_alloc_block+8Ej
		mov	ecx, [esp+10h]
		mov	off_10009560, ecx
		mov	edx, [esi]
		sub	edx, ebx
		mov	[esi], edx
		mov	[ecx+8], esi
		pop	edi
		pop	esi
		pop	ebp
		pop	ebx
		pop	ecx
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_1000301A:				; CODE XREF: ___sbh_alloc_block+B1j
		mov	ebp, offset off_10007540
		or	ecx, 0FFFFFFFFh

loc_10003022:				; CODE XREF: ___sbh_alloc_block+10Dj
		cmp	[ebp+10h], ecx
		jz	short loc_1000302E
		mov	eax, [ebp+0Ch]
		test	eax, eax
		jnz	short loc_1000303F

loc_1000302E:				; CODE XREF: ___sbh_alloc_block+F5j
		mov	ebp, [ebp+0]
		cmp	ebp, offset off_10007540
		jz	loc_1000311D
		jmp	short loc_10003022
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_1000303F:				; CODE XREF: ___sbh_alloc_block+FCj
		mov	eax, [ebp+0Ch]
		mov	esi, [ebp+10h]
		mov	edi, eax
		mov	[esp+10h+arg_0], eax
		sub	edi, ebp
		mov	edx, [eax]
		sub	edi, 18h
		sar	edi, 3
		shl	edi, 0Ch
		add	edi, esi
		xor	esi, esi
		cmp	edx, ecx
		jnz	short loc_10003070

loc_10003060:				; CODE XREF: ___sbh_alloc_block+13Ej
		cmp	esi, 10h
		jge	short loc_10003070
		mov	edx, [eax+8]
		add	eax, 8
		inc	esi
		cmp	edx, ecx
		jz	short loc_10003060

loc_10003070:				; CODE XREF: ___sbh_alloc_block+12Ej
					; ___sbh_alloc_block+133j
		mov	eax, esi
		push	4
		shl	eax, 0Ch
		push	1000h
		push	eax
		push	edi
		mov	[esp+20h], eax
		call	ds:VirtualAlloc
		cmp	eax, edi
		jnz	loc_1000315B
		mov	edx, [esp+10h+arg_0]
		mov	eax, [esp+10h]
		xor	ecx, ecx
		test	esi, esi
		mov	ecx, edx
		jle	short loc_100030D2
		lea	eax, [edi+4]

loc_100030A3:				; CODE XREF: ___sbh_alloc_block+19Cj
		lea	edx, [eax+4]
		mov	dword ptr [eax], 0F0h
		mov	[eax-4], edx
		mov	byte ptr [eax+0F4h], 0FFh
		mov	dword ptr [ecx], 0F0h
		mov	dword ptr [ecx+4], 0F1h
		add	eax, 1000h
		add	ecx, 8
		dec	esi
		jnz	short loc_100030A3
		mov	edx, [esp+10h+arg_0]

loc_100030D2:				; CODE XREF: ___sbh_alloc_block+16Ej
		lea	eax, [ebp+2018h]
		mov	off_10009560, ebp
		cmp	ecx, eax
		jnb	short loc_100030F0

loc_100030E2:				; CODE XREF: ___sbh_alloc_block+1BCj
		cmp	dword ptr [ecx], 0FFFFFFFFh
		jz	short loc_100030EE
		add	ecx, 8
		cmp	ecx, eax
		jb	short loc_100030E2

loc_100030EE:				; CODE XREF: ___sbh_alloc_block+1B5j
		cmp	ecx, eax

loc_100030F0:				; CODE XREF: ___sbh_alloc_block+1B0j
		sbb	eax, eax
		and	eax, ecx
		mov	[ebp+0Ch], eax
		mov	[edi+8], bl
		mov	[ebp+8], edx
		mov	ecx, [edx]
		sub	ecx, ebx
		mov	[edx], ecx
		mov	eax, [edi+4]
		sub	eax, ebx
		lea	ecx, [edi+ebx+8]
		mov	[edi+4], eax
		mov	[edi], ecx
		lea	eax, [edi+100h]
		pop	edi
		pop	esi
		pop	ebp
		pop	ebx
		pop	ecx
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_1000311D:				; CODE XREF: ___sbh_alloc_block+107j
		call	___sbh_new_region
		test	eax, eax
		jz	short loc_1000315B
		mov	ecx, [eax+10h]
		mov	[ecx+8], bl
		lea	edx, [ecx+ebx+8]
		mov	off_10009560, eax
		mov	[ecx], edx
		mov	edx, 0F0h
		sub	edx, ebx
		and	ebx, 0FFh
		mov	[ecx+4], edx
		mov	edx, [eax+18h]
		sub	edx, ebx
		mov	[eax+18h], edx
		lea	eax, [ecx+100h]
		pop	edi
		pop	esi
		pop	ebp
		pop	ebx
		pop	ecx
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_1000315B:				; CODE XREF: ___sbh_alloc_block+15Aj
					; ___sbh_alloc_block+1F4j
		pop	edi
		pop	esi
		pop	ebp
		xor	eax, eax
		pop	ebx
		pop	ecx
		retn	
___sbh_alloc_block endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

___sbh_alloc_block_from_page proc near	; CODE XREF: ___sbh_alloc_block+49p
					; ___sbh_alloc_block+84p

arg_0		= dword	ptr  4
arg_4		= dword	ptr  8
arg_8		= dword	ptr  0Ch

		mov	edx, [esp+arg_8]
		push	ebx
		push	ebp
		push	esi
		push	edi
		mov	edi, [esp+10h+arg_0]
		mov	eax, [edi+4]
		mov	ecx, [edi]
		cmp	eax, edx
		mov	[esp+10h+arg_0], ecx
		mov	esi, ecx
		lea	ebx, [edi+0F8h]
		jb	short loc_100031CB
		lea	eax, [ecx+edx]
		mov	[ecx], dl
		cmp	eax, ebx
		jnb	short loc_100031AA
		mov	esi, [edi]
		mov	eax, [edi+4]
		add	esi, edx
		sub	eax, edx
		mov	[edi], esi
		mov	[edi+4], eax
		jmp	short loc_100031B6
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_100031AA:				; CODE XREF: ___sbh_alloc_block_from_page+28j
		lea	edx, [edi+8]
		mov	dword ptr [edi+4], 0
		mov	[edi], edx

loc_100031B6:				; CODE XREF: ___sbh_alloc_block_from_page+38j
		lea	eax, [edi+edi*2]
		lea	eax, [eax+eax*4]
		mov	edx, eax
		lea	eax, [ecx+8]
		shl	eax, 4
		sub	eax, edx
		pop	edi
		pop	esi
		pop	ebp
		pop	ebx
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_100031CB:				; CODE XREF: ___sbh_alloc_block_from_page+1Fj
		add	eax, ecx
		cmp	byte ptr [eax],	0
		jz	short loc_100031D4
		mov	esi, eax

loc_100031D4:				; CODE XREF: ___sbh_alloc_block_from_page+60j
		lea	eax, [esi+edx]
		cmp	eax, ebx
		mov	ebx, [esp+10h+arg_4]
		jnb	short loc_10003254

loc_100031DF:				; CODE XREF: ___sbh_alloc_block_from_page+C3j
		mov	al, [esi]
		test	al, al
		jnz	short loc_10003221
		cmp	byte ptr [esi+1], 0
		lea	eax, [esi+1]
		mov	ecx, 1
		jnz	short loc_100031FA

loc_100031F3:				; CODE XREF: ___sbh_alloc_block_from_page+88j
		inc	eax
		inc	ecx
		cmp	byte ptr [eax],	0
		jz	short loc_100031F3

loc_100031FA:				; CODE XREF: ___sbh_alloc_block_from_page+81j
		cmp	ecx, edx
		jnb	short loc_10003237
		mov	ebp, [esp+10h+arg_0]
		cmp	esi, ebp
		jnz	short loc_1000320F
		mov	[edi+4], ecx
		mov	esi, eax
		mov	ecx, ebp
		jmp	short loc_10003228
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_1000320F:				; CODE XREF: ___sbh_alloc_block_from_page+94j
		sub	ebx, ecx
		cmp	ebx, edx
		jb	loc_100032DB
		mov	ecx, [esp+10h+arg_0]
		mov	esi, eax
		jmp	short loc_10003228
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10003221:				; CODE XREF: ___sbh_alloc_block_from_page+73j
		and	eax, 0FFh
		add	esi, eax

loc_10003228:				; CODE XREF: ___sbh_alloc_block_from_page+9Dj
					; ___sbh_alloc_block_from_page+AFj
		lea	ebp, [esi+edx]
		lea	eax, [edi+0F8h]
		cmp	ebp, eax
		jb	short loc_100031DF
		jmp	short loc_10003254
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10003237:				; CODE XREF: ___sbh_alloc_block_from_page+8Cj
		lea	eax, [esi+edx]
		lea	ebx, [edi+0F8h]
		cmp	eax, ebx
		jnb	short loc_1000324D
		sub	ecx, edx
		mov	[edi], eax
		mov	[edi+4], ecx
		jmp	short loc_100032C6
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_1000324D:				; CODE XREF: ___sbh_alloc_block_from_page+D2j
		lea	ecx, [edi+8]
		mov	[edi], ecx
		jmp	short loc_100032BF
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10003254:				; CODE XREF: ___sbh_alloc_block_from_page+6Dj
					; ___sbh_alloc_block_from_page+C5j
		lea	ebp, [edi+8]
		mov	esi, ebp
		cmp	esi, ecx
		jnb	short loc_100032DB

loc_1000325D:				; CODE XREF: ___sbh_alloc_block_from_page+12Ej
		lea	ecx, [esi+edx]
		lea	eax, [edi+0F8h]
		cmp	ecx, eax
		jnb	short loc_100032DB
		mov	al, [esi]
		test	al, al
		jnz	short loc_10003293
		cmp	byte ptr [esi+1], 0
		lea	eax, [esi+1]
		mov	ecx, 1
		jnz	short loc_10003285

loc_1000327E:				; CODE XREF: ___sbh_alloc_block_from_page+113j
		inc	eax
		inc	ecx
		cmp	byte ptr [eax],	0
		jz	short loc_1000327E

loc_10003285:				; CODE XREF: ___sbh_alloc_block_from_page+10Cj
		cmp	ecx, edx
		jnb	short loc_100032A7
		sub	ebx, ecx
		cmp	ebx, edx
		jb	short loc_100032DB
		mov	esi, eax
		jmp	short loc_1000329A
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10003293:				; CODE XREF: ___sbh_alloc_block_from_page+FEj
		and	eax, 0FFh
		add	esi, eax

loc_1000329A:				; CODE XREF: ___sbh_alloc_block_from_page+121j
		cmp	esi, [esp+10h+arg_0]
		jb	short loc_1000325D
		xor	eax, eax
		pop	edi
		pop	esi
		pop	ebp
		pop	ebx
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_100032A7:				; CODE XREF: ___sbh_alloc_block_from_page+117j
		lea	eax, [esi+edx]
		lea	ebx, [edi+0F8h]
		cmp	eax, ebx
		jnb	short loc_100032BD
		sub	ecx, edx
		mov	[edi], eax
		mov	[edi+4], ecx
		jmp	short loc_100032C6
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_100032BD:				; CODE XREF: ___sbh_alloc_block_from_page+142j
		mov	[edi], ebp

loc_100032BF:				; CODE XREF: ___sbh_alloc_block_from_page+E2j
		mov	dword ptr [edi+4], 0

loc_100032C6:				; CODE XREF: ___sbh_alloc_block_from_page+DBj
					; ___sbh_alloc_block_from_page+14Bj
		lea	eax, [edi+edi*2]
		mov	[esi], dl
		lea	edx, [eax+eax*4]
		lea	eax, [esi+8]
		shl	eax, 4
		sub	eax, edx
		pop	edi
		pop	esi
		pop	ebp
		pop	ebx
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_100032DB:				; CODE XREF: ___sbh_alloc_block_from_page+A3j
					; ___sbh_alloc_block_from_page+EBj ...
		pop	edi
		pop	esi
		pop	ebp
		xor	eax, eax
		pop	ebx
		retn	
___sbh_alloc_block_from_page endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

__close		proc near		; CODE XREF: __fclose_lk+27p
					; __sopen+2E7p

arg_0		= dword	ptr  4

		mov	eax, dword_1000B020
		push	esi
		mov	esi, [esp+4+arg_0]
		push	edi
		cmp	esi, eax
		jnb	short loc_1000333C
		mov	eax, esi
		mov	ecx, esi
		and	eax, 1Fh
		sar	ecx, 5
		lea	edx, [eax+eax*8]
		mov	eax, dword_1000AF20[ecx*4]
		test	byte ptr [eax+edx*4+4],	1
		jz	short loc_1000333C
		push	esi
		call	__lock_fhandle
		add	esp, 4
		push	esi
		call	__close_lk
		add	esp, 4
		mov	edi, eax
		push	esi
		call	__unlock_fhandle
		add	esp, 4
		mov	eax, edi
		pop	edi
		pop	esi
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_1000333C:				; CODE XREF: __close+Dj __close+28j
		call	__errno
		mov	dword ptr [eax], 9
		call	___doserrno
		mov	dword ptr [eax], 0
		pop	edi
		or	eax, 0FFFFFFFFh
		pop	esi
		retn	
__close		endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

__close_lk	proc near		; CODE XREF: __close+34p

arg_0		= dword	ptr  8

		push	esi
		mov	esi, [esp+arg_0]
		push	edi
		push	esi
		call	__get_osfhandle
		add	esp, 4
		cmp	eax, 0FFFFFFFFh
		jz	short loc_100033B6
		cmp	esi, 1
		jz	short loc_1000337E
		cmp	esi, 2
		jnz	short loc_10003398

loc_1000337E:				; CODE XREF: __close_lk+17j
		push	1
		call	__get_osfhandle
		add	esp, 4
		mov	edi, eax
		push	2
		call	__get_osfhandle
		add	esp, 4
		cmp	edi, eax
		jz	short loc_100033B6

loc_10003398:				; CODE XREF: __close_lk+1Cj
		push	esi
		call	__get_osfhandle
		add	esp, 4
		push	eax
		call	ds:CloseHandle
		test	eax, eax
		jnz	short loc_100033B6
		call	ds:GetLastError
		mov	edi, eax
		jmp	short loc_100033B8
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_100033B6:				; CODE XREF: __close_lk+12j
					; __close_lk+36j ...
		xor	edi, edi

loc_100033B8:				; CODE XREF: __close_lk+54j
		push	esi
		call	__free_osfhnd
		mov	eax, esi
		and	esi, 1Fh
		sar	eax, 5
		lea	ecx, [esi+esi*8]
		add	esp, 4
		mov	edx, dword_1000AF20[eax*4]
		test	edi, edi
		mov	byte ptr [edx+ecx*4+4],	0
		jz	short loc_100033EB
		push	edi
		call	__dosmaperr
		add	esp, 4
		or	eax, 0FFFFFFFFh
		pop	edi
		pop	esi
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_100033EB:				; CODE XREF: __close_lk+7Aj
		pop	edi
		xor	eax, eax
		pop	esi
		retn	
__close_lk	endp


; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

__freebuf	proc near		; CODE XREF: __fclose_lk+1Bp

arg_0		= dword	ptr  8

		push	esi
		mov	esi, [esp+arg_0]
		mov	eax, [esi+0Ch]
		test	al, 83h
		jz	short loc_10003421
		test	al, 8
		jz	short loc_10003421
		mov	eax, [esi+8]
		push	eax
		call	_free
		mov	eax, [esi+0Ch]
		add	esp, 4
		and	eax, 0FFFFFBF7h
		mov	[esi+0Ch], eax
		xor	eax, eax
		mov	[esi], eax
		mov	[esi+8], eax
		mov	[esi+4], eax

loc_10003421:				; CODE XREF: __freebuf+Aj __freebuf+Ej
		pop	esi
		retn	
__freebuf	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

__fflush_lk	proc near		; CODE XREF: sub_100034F0+57p
					; sub_100034F0+74p

arg_0		= dword	ptr  8

		push	esi
		mov	esi, [esp+arg_0]
		push	esi
		call	__flush
		add	esp, 4
		test	eax, eax
		jz	short loc_10003447
		or	eax, 0FFFFFFFFh
		pop	esi
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10003447:				; CODE XREF: __fflush_lk+10j
		mov	eax, [esi+0Ch]
		test	ah, 40h
		jz	short loc_10003461
		mov	eax, [esi+10h]
		push	eax
		call	__commit
		add	esp, 4
		neg	eax
		sbb	eax, eax
		pop	esi
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10003461:				; CODE XREF: __fflush_lk+1Dj
		xor	eax, eax
		pop	esi
		retn	
__fflush_lk	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

__flush		proc near		; CODE XREF: __fclose_lk+10p
					; __fflush_lk+6p

arg_0		= dword	ptr  0Ch

		push	ebx
		push	esi
		mov	esi, [esp+arg_0]
		xor	ebx, ebx
		push	edi
		mov	eax, [esi+0Ch]
		mov	ecx, eax
		and	ecx, 3
		cmp	cl, 2
		jnz	short loc_100034CC
		test	eax, 108h
		jz	short loc_100034CC
		mov	eax, [esi+8]
		mov	edi, [esi]
		sub	edi, eax
		test	edi, edi
		jle	short loc_100034CC
		mov	edx, [esi+10h]
		push	edi
		push	eax
		push	edx
		call	__write
		add	esp, 0Ch
		cmp	eax, edi
		mov	eax, [esi+0Ch]
		jnz	short loc_100034C4
		test	al, 80h
		jz	short loc_100034CC
		and	al, 0FDh
		mov	[esi+4], ebx
		mov	[esi+0Ch], eax
		mov	eax, [esi+8]
		mov	[esi], eax
		mov	eax, ebx
		pop	edi
		pop	esi
		pop	ebx
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_100034C4:				; CODE XREF: __flush+3Bj
		or	al, 20h
		or	ebx, 0FFFFFFFFh
		mov	[esi+0Ch], eax

loc_100034CC:				; CODE XREF: __flush+14j __flush+1Bj ...
		mov	eax, [esi+8]
		mov	dword ptr [esi+4], 0
		mov	[esi], eax
		pop	edi
		mov	eax, ebx
		pop	esi
		pop	ebx
		retn	
__flush		endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 4

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

__flushall	proc near		; CODE XREF: ___endstdiop
		push	1
		call	sub_100034F0	; _flsall
		add	esp, 4
		retn	
__flushall	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 8

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; _flsall
; Attributes: library function static

sub_100034F0	proc near		; CODE XREF: __flushall+2p

arg_0		= dword	ptr  18h

		push	ecx
		push	ebx
		push	ebp
		push	esi
		push	edi
		xor	esi, esi
		push	2
		mov	[esp+14h], esi
		xor	ebp, ebp
		call	__lock
		mov	eax, dword_1000AF00
		mov	edi, [esp+4+arg_0]
		add	esp, 4
		cmp	eax, esi
		jle	short loc_10003590
		mov	bl, 83h

loc_10003516:				; CODE XREF: sub_100034F0+9Ej
		mov	eax, dword_10009EFC
		mov	eax, [eax+esi*4]
		test	eax, eax
		jz	short loc_10003586
		test	[eax+0Ch], bl
		jz	short loc_10003586
		push	eax
		push	esi
		call	__lock_file2
		mov	ecx, dword_10009EFC
		add	esp, 8
		mov	eax, [ecx+esi*4]
		mov	ecx, [eax+0Ch]
		test	bl, cl
		jz	short loc_10003573
		cmp	edi, 1
		jnz	short loc_1000355A
		push	eax
		call	__fflush_lk
		add	esp, 4
		cmp	eax, 0FFFFFFFFh
		jz	short loc_10003573
		inc	dword ptr [esp+10h]
		jmp	short loc_10003573
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_1000355A:				; CODE XREF: sub_100034F0+54j
		test	edi, edi
		jnz	short loc_10003573
		test	cl, 2
		jz	short loc_10003573
		push	eax
		call	__fflush_lk
		add	esp, 4
		cmp	eax, 0FFFFFFFFh
		jnz	short loc_10003573
		or	ebp, eax

loc_10003573:				; CODE XREF: sub_100034F0+4Fj
					; sub_100034F0+62j ...
		mov	edx, dword_10009EFC
		mov	eax, [edx+esi*4]
		push	eax
		push	esi
		call	__unlock_file2
		add	esp, 8

loc_10003586:				; CODE XREF: sub_100034F0+30j
					; sub_100034F0+35j
		mov	eax, dword_1000AF00
		inc	esi
		cmp	esi, eax
		jl	short loc_10003516

loc_10003590:				; CODE XREF: sub_100034F0+22j
		push	2
		call	__unlock
		mov	eax, [esp+14h]
		add	esp, 4
		cmp	edi, 1
		jz	short loc_100035A5
		mov	eax, ebp

loc_100035A5:				; CODE XREF: sub_100034F0+B1j
		pop	edi
		pop	esi
		pop	ebp
		pop	ebx
		pop	ecx
		retn	
sub_100034F0	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 8

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

__callnewh	proc near		; CODE XREF: __nh_malloc+33p
					; _calloc+93p

arg_0		= dword	ptr  4

		mov	eax, dword_10009C48
		test	eax, eax
		jz	short loc_100035CD
		mov	ecx, [esp+arg_0]
		push	ecx
		call	eax
		add	esp, 4
		test	eax, eax
		jz	short loc_100035CD
		mov	eax, 1
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_100035CD:				; CODE XREF: __callnewh+7j
					; __callnewh+15j
		xor	eax, eax
		retn	
__callnewh	endp


; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

__filbuf	proc near		; CODE XREF: _fread+C2p

arg_0		= dword	ptr  8

		push	esi
		mov	esi, [esp+arg_0]
		push	edi
		mov	eax, [esi+0Ch]
		test	al, 83h
		jz	loc_100036B9
		test	al, 40h
		jnz	loc_100036B9
		test	al, 2
		jz	short loc_100035F8
		or	al, 20h
		mov	[esi+0Ch], eax
		or	eax, 0FFFFFFFFh
		pop	edi
		pop	esi
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_100035F8:				; CODE XREF: __filbuf+1Bj
		or	al, 1
		test	eax, 10Ch
		mov	[esi+0Ch], eax
		jnz	short loc_1000360F
		push	esi
		call	__getbuf
		add	esp, 4
		jmp	short loc_10003614
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_1000360F:				; CODE XREF: __filbuf+32j
		mov	eax, [esi+8]
		mov	[esi], eax

loc_10003614:				; CODE XREF: __filbuf+3Dj
		mov	ecx, [esi+18h]
		mov	edx, [esi+8]
		mov	eax, [esi+10h]
		push	ecx
		push	edx
		push	eax
		call	__read
		add	esp, 0Ch
		mov	[esi+4], eax
		test	eax, eax
		jz	short loc_100036A0
		cmp	eax, 0FFFFFFFFh
		jz	short loc_100036A0
		mov	edx, [esi+0Ch]
		test	dl, 82h
		jnz	short loc_10003671
		mov	ecx, [esi+10h]
		cmp	ecx, 0FFFFFFFFh
		jz	short loc_1000365B
		mov	edi, ecx
		sar	edi, 5
		and	ecx, 1Fh
		mov	edi, dword_1000AF20[edi*4]
		lea	ecx, [ecx+ecx*8]
		lea	ecx, [edi+ecx*4]
		jmp	short loc_10003660
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_1000365B:				; CODE XREF: __filbuf+72j
		mov	ecx, offset unk_100096D8

loc_10003660:				; CODE XREF: __filbuf+89j
		mov	cl, [ecx+4]
		and	cl, 82h
		cmp	cl, 82h
		jnz	short loc_10003671
		or	dh, 20h
		mov	[esi+0Ch], edx

loc_10003671:				; CODE XREF: __filbuf+6Aj __filbuf+99j
		cmp	dword ptr [esi+18h], 200h
		jnz	short loc_1000368E
		mov	ecx, [esi+0Ch]
		test	cl, 8
		jz	short loc_1000368E
		test	ch, 4
		jnz	short loc_1000368E
		mov	dword ptr [esi+18h], 1000h

loc_1000368E:				; CODE XREF: __filbuf+A8j __filbuf+B0j ...
		dec	eax
		xor	edx, edx
		mov	[esi+4], eax
		mov	eax, [esi]
		mov	dl, [eax]
		inc	eax
		mov	[esi], eax
		mov	eax, edx
		pop	edi
		pop	esi
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_100036A0:				; CODE XREF: __filbuf+5Dj __filbuf+62j
		mov	ecx, [esi+0Ch]
		mov	dword ptr [esi+4], 0
		neg	eax
		sbb	eax, eax
		and	eax, 10h
		add	eax, 10h
		or	ecx, eax
		mov	[esi+0Ch], ecx

loc_100036B9:				; CODE XREF: __filbuf+Bj __filbuf+13j
		pop	edi
		or	eax, 0FFFFFFFFh
		pop	esi
		retn	
__filbuf	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 4

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

__read		proc near		; CODE XREF: _fread+A6p __filbuf+50p

arg_0		= dword	ptr  4
arg_4		= dword	ptr  8
arg_8		= dword	ptr  0Ch

		mov	eax, dword_1000B020
		push	esi
		mov	esi, [esp+4+arg_0]
		push	edi
		cmp	esi, eax
		jnb	short loc_10003716
		mov	eax, esi
		mov	ecx, esi
		and	eax, 1Fh
		sar	ecx, 5
		lea	edx, [eax+eax*8]
		mov	eax, dword_1000AF20[ecx*4]
		test	byte ptr [eax+edx*4+4],	1
		jz	short loc_10003716
		push	esi
		call	__lock_fhandle
		mov	ecx, [esp+0Ch+arg_8]
		mov	edx, [esp+0Ch+arg_4]
		add	esp, 4
		push	ecx
		push	edx
		push	esi
		call	__read_lk
		add	esp, 0Ch
		mov	edi, eax
		push	esi
		call	__unlock_fhandle
		add	esp, 4
		mov	eax, edi
		pop	edi
		pop	esi
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10003716:				; CODE XREF: __read+Dj	__read+28j
		call	__errno
		mov	dword ptr [eax], 9
		call	___doserrno
		mov	dword ptr [eax], 0
		pop	edi
		or	eax, 0FFFFFFFFh
		pop	esi
		retn	
__read		endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

__read_lk	proc near		; CODE XREF: __read+3Ep __sopen+2B2p

var_9		= byte ptr -9
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  4
arg_4		= dword	ptr  8
arg_8		= dword	ptr  0Ch

		mov	eax, [esp+arg_8]
		sub	esp, 0Ch
		push	ebx
		push	ebp
		push	esi
		push	edi
		mov	edi, [esp+1Ch+arg_4]
		xor	ebp, ebp
		test	eax, eax
		mov	edx, edi
		jz	loc_1000395B
		mov	eax, [esp+1Ch+arg_0]
		mov	ecx, eax
		and	eax, 1Fh
		sar	ecx, 5
		lea	ebx, [eax+eax*8]
		mov	eax, dword_1000AF20[ecx*4]
		lea	esi, dword_1000AF20[ecx*4]
		shl	ebx, 2
		mov	[esp+1Ch+var_4], esi
		lea	ecx, [ebx+eax]
		mov	al, [ebx+eax+4]
		test	al, 2
		jnz	loc_1000395B
		test	al, 48h
		jz	short loc_100037B3
		mov	al, [ecx+5]
		cmp	al, 0Ah
		jz	short loc_100037B3
		mov	[edi], al
		mov	eax, [esp+1Ch+arg_8]
		mov	ecx, [esi]
		dec	eax
		lea	edx, [edi+1]
		mov	ebp, 1
		mov	[esp+1Ch+arg_8], eax
		mov	byte ptr [ebx+ecx+5], 0Ah

loc_100037B3:				; CODE XREF: __read_lk+50j
					; __read_lk+57j
		mov	ecx, [esp+1Ch+arg_8]
		lea	eax, [esp+1Ch+var_8]
		push	0
		push	eax
		push	ecx
		push	edx
		mov	edx, [esi]
		mov	eax, [ebx+edx]
		push	eax
		call	ds:ReadFile
		test	eax, eax
		jnz	short loc_10003819
		call	ds:GetLastError
		cmp	eax, 5
		jnz	short loc_100037FC
		call	__errno
		mov	dword ptr [eax], 9
		call	___doserrno
		mov	dword ptr [eax], 5
		or	eax, 0FFFFFFFFh
		pop	edi
		pop	esi
		pop	ebp
		pop	ebx
		add	esp, 0Ch
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_100037FC:				; CODE XREF: __read_lk+99j
		cmp	eax, 6Dh
		jz	loc_1000395B
		push	eax
		call	__dosmaperr
		add	esp, 4
		or	eax, 0FFFFFFFFh
		pop	edi
		pop	esi
		pop	ebp
		pop	ebx
		add	esp, 0Ch
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10003819:				; CODE XREF: __read_lk+8Ej
		mov	ecx, [esi]
		mov	edx, [esp+1Ch+var_8]
		add	ebp, edx
		mov	al, [ebx+ecx+4]
		lea	ecx, [ebx+ecx+4]
		test	al, 80h
		jz	loc_10003951
		test	edx, edx
		jz	short loc_1000383E
		cmp	byte ptr [edi],	0Ah
		jnz	short loc_1000383E
		or	al, 4
		jmp	short loc_10003840
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_1000383E:				; CODE XREF: __read_lk+F3j
					; __read_lk+F8j
		and	al, 0FBh

loc_10003840:				; CODE XREF: __read_lk+FCj
		mov	[ecx], al
		mov	eax, [esp+1Ch+arg_4]
		add	ebp, eax
		mov	esi, edi
		cmp	eax, ebp
		mov	[esp+1Ch+arg_8], ebp
		jnb	loc_1000394B

loc_10003856:				; CODE XREF: __read_lk+1DFj
		mov	al, [edi]
		cmp	al, 1Ah
		jz	loc_10003935
		cmp	al, 0Dh
		jz	short loc_1000386D
		mov	[esi], al
		inc	esi
		inc	edi
		jmp	loc_10003919
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_1000386D:				; CODE XREF: __read_lk+122j
		dec	ebp
		cmp	edi, ebp
		jnb	short loc_1000388D
		cmp	byte ptr [edi+1], 0Ah
		jnz	short loc_10003883
		add	edi, 2
		mov	byte ptr [esi],	0Ah
		jmp	loc_10003918
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10003883:				; CODE XREF: __read_lk+136j
		mov	byte ptr [esi],	0Dh
		inc	esi
		inc	edi
		jmp	loc_10003919
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_1000388D:				; CODE XREF: __read_lk+130j
		mov	ecx, [esp+1Ch+var_4]
		xor	ebp, ebp
		lea	edx, [esp+1Ch+var_8]
		push	ebp
		push	edx
		mov	edx, [ecx]
		lea	eax, [esp+24h+var_9]
		push	1
		push	eax
		mov	eax, [ebx+edx]
		push	eax
		inc	edi
		call	ds:ReadFile
		test	eax, eax
		jnz	short loc_100038B9
		call	ds:GetLastError
		mov	ebp, eax

loc_100038B9:				; CODE XREF: __read_lk+16Fj
		test	ebp, ebp
		jnz	short loc_10003915
		mov	eax, [esp+1Ch+var_8]
		test	eax, eax
		jz	short loc_10003915
		mov	ecx, [esp+1Ch+var_4]
		mov	edx, [ecx]
		test	byte ptr [ebx+edx+4], 48h
		jz	short loc_100038EA
		mov	al, [esp+1Ch+var_9]
		cmp	al, 0Ah
		jnz	short loc_100038DE
		mov	[esi], al
		jmp	short loc_10003918
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_100038DE:				; CODE XREF: __read_lk+198j
		mov	byte ptr [esi],	0Dh
		mov	ecx, [ecx]
		inc	esi
		mov	[ebx+ecx+5], al
		jmp	short loc_10003919
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_100038EA:				; CODE XREF: __read_lk+190j
		cmp	esi, [esp+1Ch+arg_4]
		jnz	short loc_100038FC
		cmp	[esp+1Ch+var_9], 0Ah
		jnz	short loc_100038FC
		mov	byte ptr [esi],	0Ah
		jmp	short loc_10003918
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_100038FC:				; CODE XREF: __read_lk+1AEj
					; __read_lk+1B5j
		mov	edx, [esp+1Ch+arg_0]
		push	1
		push	0FFFFFFFFh
		push	edx
		call	__lseek_lk
		mov	al, [esp+28h+var_9]
		add	esp, 0Ch
		cmp	al, 0Ah
		jz	short loc_10003919

loc_10003915:				; CODE XREF: __read_lk+17Bj
					; __read_lk+183j
		mov	byte ptr [esi],	0Dh

loc_10003918:				; CODE XREF: __read_lk+13Ej
					; __read_lk+19Cj ...
		inc	esi

loc_10003919:				; CODE XREF: __read_lk+128j
					; __read_lk+148j ...
		mov	ebp, [esp+1Ch+arg_8]
		cmp	edi, ebp
		jb	loc_10003856
		sub	esi, [esp+1Ch+arg_4]
		mov	ebp, esi
		mov	eax, ebp
		pop	edi
		pop	esi
		pop	ebp
		pop	ebx
		add	esp, 0Ch
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10003935:				; CODE XREF: __read_lk+11Aj
		mov	eax, [esp+1Ch+var_4]
		mov	ecx, [eax]
		mov	al, [ebx+ecx+4]
		test	al, 40h
		lea	ebx, [ebx+ecx+4]
		jnz	short loc_1000394B
		or	al, 2
		mov	[ebx], al

loc_1000394B:				; CODE XREF: __read_lk+110j
					; __read_lk+205j
		sub	esi, [esp+1Ch+arg_4]
		mov	ebp, esi

loc_10003951:				; CODE XREF: __read_lk+EBj
		mov	eax, ebp
		pop	edi
		pop	esi
		pop	ebp
		pop	ebx
		add	esp, 0Ch
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_1000395B:				; CODE XREF: __read_lk+15j
					; __read_lk+48j ...
		pop	edi
		pop	esi
		pop	ebp
		xor	eax, eax
		pop	ebx
		add	esp, 0Ch
		retn	
__read_lk	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

__openfile	proc near		; CODE XREF: __fsopen+1Fp

arg_0		= dword	ptr  4
arg_4		= dword	ptr  8
arg_8		= dword	ptr  0Ch
arg_C		= dword	ptr  10h

		mov	ecx, [esp+arg_4]
		push	ebx
		push	ebp
		push	esi
		mov	al, [ecx]
		xor	edx, edx
		xor	ebp, ebp
		push	edi
		mov	edi, dword_10009EC8
		cmp	al, 61h
		jz	short loc_100039A5
		cmp	al, 72h
		jz	short loc_1000399E
		cmp	al, 77h
		jz	short loc_10003997
		xor	eax, eax
		pop	edi
		pop	esi
		pop	ebp
		pop	ebx
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10003997:				; CODE XREF: __openfile+1Ej
		mov	eax, 301h
		jmp	short loc_100039AA
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_1000399E:				; CODE XREF: __openfile+1Aj
		xor	eax, eax
		or	edi, 1
		jmp	short loc_100039AD
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_100039A5:				; CODE XREF: __openfile+16j
		mov	eax, 109h

loc_100039AA:				; CODE XREF: __openfile+2Cj
		or	edi, 2

loc_100039AD:				; CODE XREF: __openfile+33j
		inc	ecx
		mov	esi, 1
		mov	[esp+10h+arg_4], ecx
		mov	cl, [ecx]
		test	cl, cl
		jz	loc_10003A71

loc_100039C1:				; CODE XREF: __openfile+FBj
		test	esi, esi
		jz	loc_10003A71
		movsx	ecx, cl
		add	ecx, 0FFFFFFD5h
		cmp	ecx, 49h
		ja	loc_10003A5C
		xor	ebx, ebx
		mov	bl, ds:byte_10003AF4[ecx]
		jmp	ds:off_10003ACC[ebx*4]
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_100039E7:				; DATA XREF: .text:10003ACCo
		test	al, 2
		jnz	short loc_10003A5C
		and	al, 0FEh
		and	edi, 0FFFFFFFCh
		or	al, 2
		or	edi, 80h
		jmp	short loc_10003A5E
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_100039FA:				; DATA XREF: .text:10003AE0o
		test	ah, 0C0h
		jnz	short loc_10003A5C
		or	ah, 80h
		jmp	short loc_10003A5E
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10003A04:				; DATA XREF: .text:10003AECo
		test	ah, 0C0h
		jnz	short loc_10003A5C
		or	ah, 40h
		jmp	short loc_10003A5E
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10003A0E:				; DATA XREF: .text:10003AE4o
		test	edx, edx
		jnz	short loc_10003A5C
		mov	edx, 1
		or	edi, 4000h
		jmp	short loc_10003A5E
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10003A1F:				; DATA XREF: .text:10003AE8o
		test	edx, edx
		jnz	short loc_10003A5C
		mov	edx, 1
		and	edi, 0FFFFBFFFh
		jmp	short loc_10003A5E
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10003A30:				; DATA XREF: .text:10003AD8o
		test	ebp, ebp
		jnz	short loc_10003A5C
		mov	ebp, 1
		or	al, 20h
		jmp	short loc_10003A5E
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10003A3D:				; DATA XREF: .text:10003AD4o
		test	ebp, ebp
		jnz	short loc_10003A5C
		mov	ebp, 1
		or	al, 10h
		jmp	short loc_10003A5E
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10003A4A:				; DATA XREF: .text:10003ADCo
		test	ah, 10h
		jnz	short loc_10003A5C
		or	ah, 10h
		jmp	short loc_10003A5E
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10003A54:				; DATA XREF: .text:10003AD0o
		test	al, 40h
		jnz	short loc_10003A5C
		or	al, 40h
		jmp	short loc_10003A5E
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10003A5C:				; CODE XREF: __openfile+62j
					; __openfile+79j ...
		xor	esi, esi

loc_10003A5E:				; CODE XREF: __openfile+88j
					; __openfile+92j ...
		mov	ecx, [esp+10h+arg_4]
		inc	ecx
		mov	[esp+10h+arg_4], ecx
		mov	cl, [ecx]
		test	cl, cl
		jnz	loc_100039C1

loc_10003A71:				; CODE XREF: __openfile+4Bj
					; __openfile+53j
		mov	ecx, [esp+10h+arg_8]
		mov	edx, [esp+10h+arg_0]
		push	1A4h
		push	ecx
		push	eax
		push	edx
		call	__sopen
		mov	ecx, eax
		add	esp, 10h
		test	ecx, ecx
		jge	short loc_10003A96
		xor	eax, eax
		pop	edi
		pop	esi
		pop	ebp
		pop	ebx
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10003A96:				; CODE XREF: __openfile+11Dj
		mov	eax, dword_10009EC4
		inc	eax
		mov	dword_10009EC4,	eax
		mov	eax, [esp+10h+arg_C]
		mov	[eax+0Ch], edi
		pop	edi
		pop	esi
		pop	ebp
		mov	dword ptr [eax+4], 0
		mov	dword ptr [eax], 0
		mov	dword ptr [eax+8], 0
		mov	dword ptr [eax+1Ch], 0
		mov	[eax+10h], ecx
		pop	ebx
		retn	
__openfile	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 4
off_10003ACC	dd offset loc_100039E7	; DATA XREF: __openfile+70r
		dd offset loc_10003A54
		dd offset loc_10003A3D
		dd offset loc_10003A30
		dd offset loc_10003A4A
		dd offset loc_100039FA
		dd offset loc_10003A0E
		dd offset loc_10003A1F
		dd offset loc_10003A04
		dd offset loc_10003A5C
byte_10003AF4	db 0, 18h dup(9), 1, 0Dh dup(9)	; DATA XREF: __openfile+6Ar
		db 2, 3, 4, 0Dh	dup(9),	5
		db 6, 0Ah dup(9), 7, 5 dup(9)
		db 8, 2	dup(90h)

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

__getstream	proc near		; CODE XREF: __fsopen+1p
		push	ebx
		push	ebp
		push	esi
		push	edi
		push	2
		xor	ebp, ebp
		xor	edi, edi
		call	__lock
		mov	eax, dword_1000AF00
		add	esp, 4
		xor	esi, esi
		cmp	eax, ebp
		jle	loc_10003BEF
		mov	bl, 83h

loc_10003B63:				; CODE XREF: __getstream+5Ej
		mov	eax, dword_10009EFC
		mov	eax, [eax+esi*4]
		cmp	eax, ebp
		jz	short loc_10003BA7
		test	[eax+0Ch], bl
		jnz	short loc_10003B96
		push	eax
		push	esi
		call	__lock_file2
		mov	ecx, dword_10009EFC
		add	esp, 8
		mov	eax, [ecx+esi*4]
		test	[eax+0Ch], bl
		jz	short loc_10003BA2
		push	eax
		push	esi
		call	__unlock_file2
		add	esp, 8

loc_10003B96:				; CODE XREF: __getstream+32j
		mov	eax, dword_1000AF00
		inc	esi
		cmp	esi, eax
		jl	short loc_10003B63
		jmp	short loc_10003BEF
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10003BA2:				; CODE XREF: __getstream+4Aj
		mov	edi, [ecx+esi*4]
		jmp	short loc_10003BEF
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10003BA7:				; CODE XREF: __getstream+2Dj
		push	38h
		shl	esi, 2
		call	_malloc
		mov	ecx, dword_10009EFC
		add	esp, 4
		mov	[ecx+esi], eax
		mov	edx, dword_10009EFC
		mov	eax, [edx+esi]
		cmp	eax, ebp
		jz	short loc_10003BEF
		add	eax, 20h
		push	eax
		call	ds:InitializeCriticalSection
		mov	eax, dword_10009EFC
		mov	ecx, [eax+esi]
		add	ecx, 20h
		push	ecx
		call	ds:EnterCriticalSection
		mov	edx, dword_10009EFC
		mov	edi, [edx+esi]

loc_10003BEF:				; CODE XREF: __getstream+1Bj
					; __getstream+60j ...
		cmp	edi, ebp
		jz	short loc_10003C08
		mov	[edi+4], ebp
		mov	[edi+0Ch], ebp
		mov	[edi+8], ebp
		mov	[edi], ebp
		mov	[edi+1Ch], ebp
		mov	dword ptr [edi+10h], 0FFFFFFFFh

loc_10003C08:				; CODE XREF: __getstream+B1j
		push	2
		call	__unlock
		add	esp, 4
		mov	eax, edi
		pop	edi
		pop	esi
		pop	ebp
		pop	ebx
		retn	
__getstream	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 8

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

__dosmaperr	proc near		; CODE XREF: __close_lk+7Dp
					; __read_lk+C6p ...

arg_0		= dword	ptr  8

		push	esi
		call	___doserrno
		mov	ecx, [esp+arg_0]
		xor	esi, esi
		mov	[eax], ecx
		mov	eax, offset unk_10009568

loc_10003C33:				; CODE XREF: __dosmaperr+20j
		cmp	ecx, [eax]
		jz	short loc_10003C83
		add	eax, 8
		inc	esi
		cmp	eax, offset dword_100096D0
		jb	short loc_10003C33
		cmp	ecx, 13h
		jb	short loc_10003C59
		cmp	ecx, 24h
		ja	short loc_10003C59
		call	__errno
		mov	dword ptr [eax], 0Dh
		pop	esi
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10003C59:				; CODE XREF: __dosmaperr+25j
					; __dosmaperr+2Aj
		cmp	ecx, 0BCh
		jb	short loc_10003C76
		cmp	ecx, 0CAh
		ja	short loc_10003C76
		call	__errno
		mov	dword ptr [eax], 8
		pop	esi
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10003C76:				; CODE XREF: __dosmaperr+3Fj
					; __dosmaperr+47j
		call	__errno
		mov	dword ptr [eax], 16h
		pop	esi
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10003C83:				; CODE XREF: __dosmaperr+15j
		call	__errno
		mov	ecx, dword_1000956C[esi*8]
		pop	esi
		mov	[eax], ecx
		retn	
__dosmaperr	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

__errno		proc near		; CODE XREF: __getdcwd_lk+2Cp
					; __getdcwd_lk+C0p ...
		call	__getptd
		add	eax, 8
		retn	
__errno		endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 8

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

___doserrno	proc near		; CODE XREF: __getdcwd_lk+21p
					; __close+57p ...
		call	__getptd
		add	eax, 0Ch
		retn	
___doserrno	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 8

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

__cinit		proc near		; CODE XREF: __CRT_INIT@12+E5p
		mov	eax, dword_1000B02C
		test	eax, eax
		jz	short loc_10003CCB
		call	eax

loc_10003CCB:				; CODE XREF: __cinit+7j
		push	offset unk_10007010
		push	offset unk_10007008
		call	sub_10003E00	; __initterm
		add	esp, 8
		push	offset unk_10007004
		push	offset unk_10007000
		call	sub_10003E00	; __initterm
		add	esp, 8
		retn	
__cinit		endp


; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function noreturn

__exit		proc near		; CODE XREF: __amsg_exit+2Eu
					; DATA XREF: .data:10007478o

arg_0		= dword	ptr  4

		mov	eax, [esp+arg_0]
		push	0
		push	1
		push	eax
		call	sub_10003D20	; _doexit
		add	esp, 0Ch
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h
__exit		endp


; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

__cexit		proc near		; CODE XREF: __CRT_INIT@12+12Bp
		push	1
		push	0
		push	0
		call	sub_10003D20	; _doexit
		add	esp, 0Ch
		retn	
__cexit		endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 4

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; _doexit
; Attributes: library function static

sub_10003D20	proc near		; CODE XREF: __exit+9p	__cexit+6p

arg_0		= dword	ptr  10h
arg_4		= dword	ptr  14h
arg_8		= dword	ptr  18h

		push	ebx
		push	ebp
		push	esi
		call	__lockexit
		mov	eax, dword_10009C8C
		mov	ebp, [esp+arg_0]
		cmp	eax, 1
		jnz	short loc_10003D44
		push	ebp
		call	ds:GetCurrentProcess
		push	eax
		call	ds:TerminateProcess

loc_10003D44:				; CODE XREF: sub_10003D20+14j
		mov	eax, [esp+arg_4]
		mov	ebx, [esp+arg_8]
		test	eax, eax
		mov	dword_10009C88,	1
		mov	byte_10009C84, bl
		jnz	short loc_10003D9E
		mov	ecx, dword_1000B028
		test	ecx, ecx
		jz	short loc_10003D8C
		mov	esi, dword_1000B024
		sub	esi, 4
		cmp	esi, ecx
		jb	short loc_10003D8C

loc_10003D77:				; CODE XREF: sub_10003D20+6Aj
		mov	eax, [esi]
		test	eax, eax
		jz	short loc_10003D85
		call	eax
		mov	ecx, dword_1000B028

loc_10003D85:				; CODE XREF: sub_10003D20+5Bj
		sub	esi, 4
		cmp	esi, ecx
		jnb	short loc_10003D77

loc_10003D8C:				; CODE XREF: sub_10003D20+48j
					; sub_10003D20+55j
		push	offset unk_1000701C
		push	offset unk_10007014
		call	sub_10003E00	; __initterm
		add	esp, 8

loc_10003D9E:				; CODE XREF: sub_10003D20+3Ej
		push	offset unk_10007024
		push	offset unk_10007020
		call	sub_10003E00	; __initterm
		add	esp, 8
		test	ebx, ebx
		jz	short loc_10003DBD
		call	__unlockexit
		pop	esi
		pop	ebp
		pop	ebx
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10003DBD:				; CODE XREF: sub_10003D20+92j
		push	ebp
		mov	dword_10009C8C,	1
		call	ds:ExitProcess
		pop	esi
		pop	ebp
		pop	ebx
		retn	
sub_10003D20	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

__lockexit	proc near		; CODE XREF: sub_10003D20+3p
		push	0Dh
		call	__lock
		add	esp, 4
		retn	
__lockexit	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 8

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

__unlockexit	proc near		; CODE XREF: sub_10003D20+94p
		push	0Dh
		call	__unlock
		add	esp, 4
		retn	
__unlockexit	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 8

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; __initterm
; Attributes: library function static

sub_10003E00	proc near		; CODE XREF: __cinit+15p __cinit+27p ...

arg_0		= dword	ptr  8
arg_4		= dword	ptr  0Ch

		push	esi
		mov	esi, [esp+arg_0]
		push	edi
		mov	edi, [esp+4+arg_4]
		cmp	esi, edi
		jnb	short loc_10003E1D

loc_10003E0E:				; CODE XREF: sub_10003E00+1Bj
		mov	eax, [esi]
		test	eax, eax
		jz	short loc_10003E16
		call	eax

loc_10003E16:				; CODE XREF: sub_10003E00+12j
		add	esi, 4
		cmp	esi, edi
		jb	short loc_10003E0E

loc_10003E1D:				; CODE XREF: sub_10003E00+Cj
		pop	edi
		pop	esi
		retn	
sub_10003E00	endp


; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

__mtinit	proc near		; CODE XREF: __CRT_INIT@12+9Bp
		push	esi
		call	__mtinitlocks
		call	ds:TlsAlloc	; Allocate a thread local storage (TLS)	index
		cmp	eax, 0FFFFFFFFh
		mov	dword_100096D0,	eax
		jz	short loc_10003E78
		push	74h
		push	1
		call	_calloc
		mov	esi, eax
		add	esp, 8
		test	esi, esi
		jz	short loc_10003E78
		mov	eax, dword_100096D0
		push	esi
		push	eax
		call	ds:TlsSetValue
		test	eax, eax
		jz	short loc_10003E78
		push	esi
		call	__initptd
		add	esp, 4
		call	ds:GetCurrentThreadId
		mov	[esi], eax
		mov	dword ptr [esi+4], 0FFFFFFFFh
		mov	eax, 1
		pop	esi
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10003E78:				; CODE XREF: __mtinit+14j __mtinit+26j ...
		xor	eax, eax
		pop	esi
		retn	
__mtinit	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 8

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

__mtterm	proc near		; CODE XREF: __CRT_INIT@12+FDp
					; __CRT_INIT@12+135p
		call	__mtdeletelocks
		mov	eax, dword_100096D0
		cmp	eax, 0FFFFFFFFh
		jz	short locret_10003EA0
		push	eax
		call	ds:TlsFree	; Release a thread local storage (TLS) index
		mov	dword_100096D0,	0FFFFFFFFh

locret_10003EA0:			; CODE XREF: __mtterm+Dj
		retn	
__mtterm	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

__initptd	proc near		; CODE XREF: __mtinit+3Ap __getptd+41p

arg_0		= dword	ptr  4

		mov	eax, [esp+arg_0]
		mov	dword ptr [eax+50h], offset unk_10009B08
		mov	dword ptr [eax+14h], 1
		retn	
__initptd	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

__getptd	proc near		; CODE XREF: __errnop ___doserrnop
		push	esi
		push	edi
		call	ds:GetLastError
		mov	edi, eax
		mov	eax, dword_100096D0
		push	eax
		call	ds:TlsGetValue
		mov	esi, eax
		test	esi, esi
		jnz	short loc_10003F3E
		push	74h
		push	1
		call	_calloc
		mov	esi, eax
		add	esp, 8
		test	esi, esi
		jz	short loc_10003F34
		mov	ecx, dword_100096D0
		push	esi
		push	ecx
		call	ds:TlsSetValue
		test	eax, eax
		jz	short loc_10003F34
		push	esi
		call	__initptd
		add	esp, 4
		call	ds:GetCurrentThreadId
		push	edi
		mov	[esi], eax
		mov	dword ptr [esi+4], 0FFFFFFFFh
		call	ds:SetLastError
		mov	eax, esi
		pop	edi
		pop	esi
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10003F34:				; CODE XREF: __getptd+2Cj __getptd+3Ej
		push	10h
		call	__amsg_exit
		add	esp, 4

loc_10003F3E:				; CODE XREF: __getptd+1Aj
		push	edi
		call	ds:SetLastError
		mov	eax, esi
		pop	edi
		pop	esi
		retn	
__getptd	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 8

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

__freeptd	proc near		; CODE XREF: __CRT_INIT@12+153p

arg_0		= dword	ptr  4

		mov	eax, dword_100096D0
		cmp	eax, 0FFFFFFFFh
		jz	locret_10003FEC
		push	esi
		mov	esi, [esp+4+arg_0]
		test	esi, esi
		jnz	short loc_10003F74
		push	eax
		call	ds:TlsGetValue
		mov	esi, eax
		test	esi, esi
		jz	short loc_10003FDD

loc_10003F74:				; CODE XREF: __freeptd+15j
		mov	eax, [esi+24h]
		test	eax, eax
		jz	short loc_10003F84
		push	eax
		call	_free
		add	esp, 4

loc_10003F84:				; CODE XREF: __freeptd+29j
		mov	eax, [esi+28h]
		test	eax, eax
		jz	short loc_10003F94
		push	eax
		call	_free
		add	esp, 4

loc_10003F94:				; CODE XREF: __freeptd+39j
		mov	eax, [esi+30h]
		test	eax, eax
		jz	short loc_10003FA4
		push	eax
		call	_free
		add	esp, 4

loc_10003FA4:				; CODE XREF: __freeptd+49j
		mov	eax, [esi+38h]
		test	eax, eax
		jz	short loc_10003FB4
		push	eax
		call	_free
		add	esp, 4

loc_10003FB4:				; CODE XREF: __freeptd+59j
		mov	eax, [esi+40h]
		test	eax, eax
		jz	short loc_10003FC4
		push	eax
		call	_free
		add	esp, 4

loc_10003FC4:				; CODE XREF: __freeptd+69j
		mov	eax, [esi+44h]
		test	eax, eax
		jz	short loc_10003FD4
		push	eax
		call	_free
		add	esp, 4

loc_10003FD4:				; CODE XREF: __freeptd+79j
		push	esi
		call	_free
		add	esp, 4

loc_10003FDD:				; CODE XREF: __freeptd+22j
		mov	eax, dword_100096D0
		push	0
		push	eax
		call	ds:TlsSetValue
		pop	esi

locret_10003FEC:			; CODE XREF: __freeptd+8j
		retn	
__freeptd	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 4

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

__ioinit	proc near		; CODE XREF: __CRT_INIT@12+D1p

var_48		= dword	ptr -48h
var_44		= byte ptr -44h
var_12		= word ptr -12h
var_10		= dword	ptr -10h

		sub	esp, 48h
		push	ebx
		push	ebp
		push	esi
		push	edi
		push	480h
		call	_malloc
		mov	esi, eax
		xor	edi, edi
		add	esp, 4
		cmp	esi, edi
		jnz	short loc_10004016
		push	1Bh
		call	__amsg_exit
		add	esp, 4

loc_10004016:				; CODE XREF: __ioinit+1Aj
		lea	eax, [esi+480h]
		mov	dword_1000AF20,	esi
		cmp	esi, eax
		mov	dword_1000B020,	20h
		mov	bl, 0Ah
		jnb	short loc_10004055

loc_10004032:				; CODE XREF: __ioinit+63j
		mov	byte ptr [esi+4], 0
		mov	dword ptr [esi], 0FFFFFFFFh
		mov	[esi+5], bl
		mov	[esi+8], edi
		mov	ecx, dword_1000AF20
		add	esi, 24h
		add	ecx, 480h
		cmp	esi, ecx
		jb	short loc_10004032

loc_10004055:				; CODE XREF: __ioinit+40j
		lea	edx, [esp+58h+var_44]
		push	edx
		call	ds:GetStartupInfoA
		cmp	[esp+58h+var_12], di
		jz	loc_10004168
		mov	eax, [esp+58h+var_10]
		cmp	eax, edi
		jz	loc_10004168
		mov	ecx, [eax]
		lea	edi, [eax+4]
		cmp	ecx, 800h
		mov	[esp+58h+var_48], ecx
		lea	ebp, [edi+ecx]
		jl	short loc_10004093
		mov	[esp+58h+var_48], 800h

loc_10004093:				; CODE XREF: __ioinit+99j
		mov	eax, [esp+58h+var_48]
		mov	ecx, dword_1000B020
		cmp	ecx, eax
		jge	short loc_10004111
		mov	esi, offset unk_1000AF24

loc_100040A6:				; CODE XREF: __ioinit+111j
		push	480h
		call	_malloc
		xor	ecx, ecx
		add	esp, 4
		cmp	eax, ecx
		jz	short loc_10004105
		mov	edx, dword_1000B020
		mov	[esi], eax
		add	edx, 20h
		mov	dword_1000B020,	edx
		lea	edx, [eax+480h]
		cmp	eax, edx
		jnb	short loc_100040F3

loc_100040D4:				; CODE XREF: __ioinit+101j
		mov	byte ptr [eax+4], 0
		mov	dword ptr [eax], 0FFFFFFFFh
		mov	[eax+5], bl
		mov	[eax+8], ecx
		mov	edx, [esi]
		add	eax, 24h
		add	edx, 480h
		cmp	eax, edx
		jb	short loc_100040D4

loc_100040F3:				; CODE XREF: __ioinit+E2j
		mov	eax, dword_1000B020
		mov	edx, [esp+58h+var_48]
		add	esi, 4
		cmp	eax, edx
		jl	short loc_100040A6
		jmp	short loc_10004113
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10004105:				; CODE XREF: __ioinit+C7j
		mov	edx, dword_1000B020
		mov	[esp+58h+var_48], edx
		jmp	short loc_10004113
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10004111:				; CODE XREF: __ioinit+AFj
		xor	ecx, ecx

loc_10004113:				; CODE XREF: __ioinit+113j
					; __ioinit+11Fj
		mov	eax, [esp+58h+var_48]
		xor	esi, esi
		cmp	eax, ecx
		jle	short loc_10004168

loc_1000411D:				; CODE XREF: __ioinit+176j
		mov	ecx, [ebp+0]
		cmp	ecx, 0FFFFFFFFh
		jz	short loc_1000415B
		mov	al, [edi]
		test	al, 1
		jz	short loc_1000415B
		test	al, 8
		jnz	short loc_1000413A
		push	ecx
		call	ds:GetFileType
		test	eax, eax
		jz	short loc_1000415B

loc_1000413A:				; CODE XREF: __ioinit+13Dj
		mov	ecx, esi
		mov	eax, esi
		sar	ecx, 5
		and	eax, 1Fh
		lea	edx, [eax+eax*8]
		mov	eax, dword_1000AF20[ecx*4]
		mov	ecx, [ebp+0]
		lea	eax, [eax+edx*4]
		mov	[eax], ecx
		mov	dl, [edi]
		mov	[eax+4], dl

loc_1000415B:				; CODE XREF: __ioinit+133j
					; __ioinit+139j ...
		mov	eax, [esp+58h+var_48]
		inc	esi
		inc	edi
		add	ebp, 4
		cmp	esi, eax
		jl	short loc_1000411D

loc_10004168:				; CODE XREF: __ioinit+75j __ioinit+81j ...
		mov	ebx, ds:GetStdHandle
		xor	ebp, ebp

loc_10004170:				; CODE XREF: __ioinit+1F5j
		mov	ecx, dword_1000AF20
		lea	eax, [ebp+ebp*8+0]
		lea	esi, [ecx+eax*4]
		mov	eax, [ecx+eax*4]
		cmp	eax, 0FFFFFFFFh
		jnz	short loc_100041D9
		test	ebp, ebp
		mov	byte ptr [esi+4], 81h
		jnz	short loc_10004194
		mov	eax, 0FFFFFFF6h
		jmp	short loc_1000419E
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10004194:				; CODE XREF: __ioinit+19Bj
		mov	eax, ebp
		dec	eax
		neg	eax
		sbb	eax, eax
		add	eax, 0FFFFFFF5h

loc_1000419E:				; CODE XREF: __ioinit+1A2j
		push	eax
		call	ebx
		mov	edi, eax
		cmp	edi, 0FFFFFFFFh
		jz	short loc_100041D2
		push	edi
		call	ds:GetFileType
		test	eax, eax
		jz	short loc_100041D2
		and	eax, 0FFh
		mov	[esi], edi
		cmp	eax, 2
		jnz	short loc_100041C6
		mov	al, [esi+4]
		or	al, 40h
		jmp	short loc_100041DE
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_100041C6:				; CODE XREF: __ioinit+1CDj
		cmp	eax, 3
		jnz	short loc_100041E1
		mov	al, [esi+4]
		or	al, 8
		jmp	short loc_100041DE
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_100041D2:				; CODE XREF: __ioinit+1B6j
					; __ioinit+1C1j
		mov	al, [esi+4]
		or	al, 40h
		jmp	short loc_100041DE
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_100041D9:				; CODE XREF: __ioinit+193j
		mov	al, [esi+4]
		or	al, 80h

loc_100041DE:				; CODE XREF: __ioinit+1D4j
					; __ioinit+1E0j ...
		mov	[esi+4], al

loc_100041E1:				; CODE XREF: __ioinit+1D9j
		inc	ebp
		cmp	ebp, 3
		jl	short loc_10004170
		mov	edx, dword_1000B020
		push	edx
		call	ds:SetHandleCount
		pop	edi
		pop	esi
		pop	ebp
		pop	ebx
		add	esp, 48h
		retn	
__ioinit	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 8

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

__ioterm	proc near		; CODE XREF: __CRT_INIT@12+130p
		push	ebx
		push	ebp
		mov	ebp, ds:DeleteCriticalSection
		push	esi
		push	edi
		mov	ebx, offset dword_1000AF20

loc_1000420F:				; CODE XREF: __ioterm+58j
		mov	esi, [ebx]
		test	esi, esi
		jz	short loc_1000424F
		lea	eax, [esi+480h]
		cmp	esi, eax
		jnb	short loc_1000423E
		lea	edi, [esi+0Ch]

loc_10004222:				; CODE XREF: __ioterm+3Cj
		mov	eax, [edi-4]
		test	eax, eax
		jz	short loc_1000422C
		push	edi
		call	ebp

loc_1000422C:				; CODE XREF: __ioterm+27j
		mov	ecx, [ebx]
		add	esi, 24h
		add	ecx, 480h
		add	edi, 24h
		cmp	esi, ecx
		jb	short loc_10004222

loc_1000423E:				; CODE XREF: __ioterm+1Dj
		mov	edx, [ebx]
		push	edx
		call	_free
		add	esp, 4
		mov	dword ptr [ebx], 0

loc_1000424F:				; CODE XREF: __ioterm+13j
		add	ebx, 4
		cmp	ebx, offset dword_1000B020
		jl	short loc_1000420F
		pop	edi
		pop	esi
		pop	ebp
		pop	ebx
		retn	
__ioterm	endp ; sp = -4

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 4

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

__setenvp	proc near		; CODE XREF: __CRT_INIT@12+E0p
		push	ecx
		mov	edx, dword_10009BD0
		push	ebx
		push	ebp
		push	esi
		mov	al, [edx]
		xor	esi, esi
		test	al, al
		push	edi
		jz	short loc_10004290

loc_10004273:				; CODE XREF: __setenvp+2Ej
		cmp	al, 3Dh
		jz	short loc_10004278
		inc	esi

loc_10004278:				; CODE XREF: __setenvp+15j
		mov	edi, edx
		or	ecx, 0FFFFFFFFh
		xor	eax, eax
		repne scasb
		not	ecx
		dec	ecx
		mov	al, [edx+ecx+1]
		lea	edx, [edx+ecx+1]
		test	al, al
		jnz	short loc_10004273

loc_10004290:				; CODE XREF: __setenvp+11j
		lea	eax, ds:4[esi*4]
		push	eax
		call	_malloc
		mov	esi, eax
		add	esp, 4
		test	esi, esi
		mov	[esp+10h], esi
		mov	dword_10009C6C,	esi
		jnz	short loc_100042BA
		push	9
		call	__amsg_exit
		add	esp, 4

loc_100042BA:				; CODE XREF: __setenvp+4Ej
		mov	ebp, dword_10009BD0
		mov	dl, [ebp+0]
		test	dl, dl
		jz	short loc_1000432A

loc_100042C7:				; CODE XREF: __setenvp+C8j
		mov	edi, ebp
		or	ecx, 0FFFFFFFFh
		xor	eax, eax
		repne scasb
		not	ecx
		dec	ecx
		mov	ebx, ecx
		inc	ebx
		cmp	dl, 3Dh
		jz	short loc_10004320
		push	ebx
		call	_malloc
		add	esp, 4
		mov	[esi], eax
		test	eax, eax
		jnz	short loc_100042F4
		push	9
		call	__amsg_exit
		add	esp, 4

loc_100042F4:				; CODE XREF: __setenvp+88j
		mov	edi, ebp
		or	ecx, 0FFFFFFFFh
		xor	eax, eax
		repne scasb
		mov	eax, [esp+10h]
		not	ecx
		sub	edi, ecx
		mov	edx, ecx
		mov	esi, edi
		mov	edi, [eax]
		shr	ecx, 2
		repe movsd
		mov	ecx, edx
		and	ecx, 3
		add	eax, 4
		repe movsb
		mov	[esp+10h], eax
		mov	esi, eax

loc_10004320:				; CODE XREF: __setenvp+79j
		mov	dl, [ebp+ebx+0]
		add	ebp, ebx
		test	dl, dl
		jnz	short loc_100042C7

loc_1000432A:				; CODE XREF: __setenvp+65j
		mov	eax, dword_10009BD0
		push	eax
		call	_free
		add	esp, 4
		mov	dword_10009BD0,	0
		mov	dword ptr [esi], 0
		pop	edi
		pop	esi
		pop	ebp
		pop	ebx
		pop	ecx
		retn	
__setenvp	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 4

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

__setargv	proc near		; CODE XREF: __CRT_INIT@12+DBp

var_8		= dword	ptr -8
var_4		= dword	ptr -4

		sub	esp, 8
		push	esi
		push	edi
		push	104h
		push	offset unk_10009C90
		push	0
		call	ds:GetModuleFileNameA
		mov	edi, dword_1000B034
		mov	dword_10009C7C,	offset unk_10009C90
		cmp	byte ptr [edi],	0
		jnz	short loc_10004381
		mov	edi, offset unk_10009C90

loc_10004381:				; CODE XREF: __setargv+2Aj
		lea	eax, [esp+10h+var_4]
		lea	ecx, [esp+10h+var_8]
		push	eax
		push	ecx
		push	0
		push	0
		push	edi
		call	sub_100043F0	; _parse_cmdline
		mov	edx, [esp+24h+var_4]
		mov	eax, [esp+24h+var_8]
		add	esp, 14h
		lea	ecx, [edx+eax*4]
		push	ecx
		call	_malloc
		mov	esi, eax
		add	esp, 4
		test	esi, esi
		jnz	short loc_100043BC
		push	8
		call	__amsg_exit
		add	esp, 4

loc_100043BC:				; CODE XREF: __setargv+60j
		mov	ecx, [esp+10h+var_8]
		lea	edx, [esp+10h+var_4]
		push	edx
		lea	eax, [esp+14h+var_8]
		lea	edx, [esi+ecx*4]
		push	eax
		push	edx
		push	esi
		push	edi
		call	sub_100043F0	; _parse_cmdline
		mov	eax, [esp+24h+var_8]
		add	esp, 14h
		dec	eax
		mov	dword_10009C64,	esi
		pop	edi
		mov	dword_10009C60,	eax
		pop	esi
		add	esp, 8
		retn	
__setargv	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 4

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; _parse_cmdline
; Attributes: library function static

sub_100043F0	proc near		; CODE XREF: __setargv+40p
					; __setargv+80p

arg_0		= dword	ptr  4
arg_4		= dword	ptr  8
arg_8		= dword	ptr  0Ch
arg_C		= dword	ptr  10h
arg_10		= dword	ptr  14h

		mov	eax, [esp+arg_C]
		push	ebx
		push	ebp
		mov	ebp, [esp+8+arg_4]
		push	esi
		mov	esi, [esp+0Ch+arg_8]
		push	edi
		mov	edi, [esp+10h+arg_10]
		test	ebp, ebp
		mov	dword ptr [edi], 0
		mov	dword ptr [eax], 1
		mov	eax, [esp+10h+arg_0]
		mov	ebx, 4
		jz	short loc_10004426
		mov	[ebp+0], esi
		add	ebp, ebx
		mov	[esp+10h+arg_4], ebp

loc_10004426:				; CODE XREF: sub_100043F0+2Bj
		cmp	byte ptr [eax],	22h
		jnz	short loc_10004481
		mov	cl, [eax+1]
		inc	eax
		cmp	cl, 22h
		jz	short loc_1000446C

loc_10004434:				; CODE XREF: sub_100043F0+7Aj
		test	cl, cl
		jz	short loc_1000446C
		and	ecx, 0FFh
		test	byte ptr unk_10009D99[ecx], bl
		jz	short loc_10004455
		mov	edx, [edi]
		inc	edx
		test	esi, esi
		mov	[edi], edx
		jz	short loc_10004455
		mov	cl, [eax]
		mov	[esi], cl
		inc	esi
		inc	eax

loc_10004455:				; CODE XREF: sub_100043F0+54j
					; sub_100043F0+5Dj
		mov	edx, [edi]
		inc	edx
		test	esi, esi
		mov	[edi], edx
		jz	short loc_10004463
		mov	dl, [eax]
		mov	[esi], dl
		inc	esi

loc_10004463:				; CODE XREF: sub_100043F0+6Cj
		mov	cl, [eax+1]
		inc	eax
		cmp	cl, 22h
		jnz	short loc_10004434

loc_1000446C:				; CODE XREF: sub_100043F0+42j
					; sub_100043F0+46j
		mov	edx, [edi]
		inc	edx
		test	esi, esi
		mov	[edi], edx
		jz	short loc_10004479
		mov	byte ptr [esi],	0
		inc	esi

loc_10004479:				; CODE XREF: sub_100043F0+83j
		cmp	byte ptr [eax],	22h
		jnz	short loc_100044D4
		inc	eax
		jmp	short loc_100044D4
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10004481:				; CODE XREF: sub_100043F0+39j
					; sub_100043F0+D3j
		mov	edx, [edi]
		inc	edx
		test	esi, esi
		mov	[edi], edx
		jz	short loc_1000448F
		mov	cl, [eax]
		mov	[esi], cl
		inc	esi

loc_1000448F:				; CODE XREF: sub_100043F0+98j
		mov	cl, [eax]
		inc	eax
		mov	byte ptr [esp+10h+arg_10], cl
		mov	edx, [esp+10h+arg_10]
		and	edx, 0FFh
		test	byte ptr unk_10009D99[edx], bl
		jz	short loc_100044B7
		mov	edx, [edi]
		inc	edx
		test	esi, esi
		mov	[edi], edx
		jz	short loc_100044B6
		mov	dl, [eax]
		mov	[esi], dl
		inc	esi

loc_100044B6:				; CODE XREF: sub_100043F0+BFj
		inc	eax

loc_100044B7:				; CODE XREF: sub_100043F0+B6j
		cmp	cl, 20h
		jz	short loc_100044C5
		test	cl, cl
		jz	short loc_100044C9
		cmp	cl, 9
		jnz	short loc_10004481

loc_100044C5:				; CODE XREF: sub_100043F0+CAj
		test	cl, cl
		jnz	short loc_100044CC

loc_100044C9:				; CODE XREF: sub_100043F0+CEj
		dec	eax
		jmp	short loc_100044D4
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_100044CC:				; CODE XREF: sub_100043F0+D7j
		test	esi, esi
		jz	short loc_100044D4
		mov	byte ptr [esi-1], 0

loc_100044D4:				; CODE XREF: sub_100043F0+8Cj
					; sub_100043F0+8Fj ...
		xor	edx, edx
		mov	[esp+10h+arg_10], edx

loc_100044DA:				; CODE XREF: sub_100043F0+1F1j
		cmp	byte ptr [eax],	0
		jz	loc_100045E6

loc_100044E3:				; CODE XREF: sub_100043F0+100j
		mov	cl, [eax]
		cmp	cl, 20h
		jz	short loc_100044EF
		cmp	cl, 9
		jnz	short loc_100044F2

loc_100044EF:				; CODE XREF: sub_100043F0+F8j
		inc	eax
		jmp	short loc_100044E3
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_100044F2:				; CODE XREF: sub_100043F0+FDj
		cmp	byte ptr [eax],	0
		jz	loc_100045E6
		test	ebp, ebp
		jz	short loc_10004508
		mov	[ebp+0], esi
		add	ebp, ebx
		mov	[esp+10h+arg_4], ebp

loc_10004508:				; CODE XREF: sub_100043F0+10Dj
		mov	ecx, [esp+10h+arg_C]
		inc	dword ptr [ecx]

loc_1000450E:				; CODE XREF: sub_100043F0+1B9j
					; sub_100043F0+1D6j
		mov	bl, [eax]
		xor	ecx, ecx
		cmp	bl, 5Ch
		mov	ebp, 1
		jnz	short loc_10004526

loc_1000451C:				; CODE XREF: sub_100043F0+134j
		mov	bl, [eax+1]
		inc	eax
		inc	ecx
		cmp	bl, 5Ch
		jz	short loc_1000451C

loc_10004526:				; CODE XREF: sub_100043F0+12Aj
		cmp	byte ptr [eax],	22h
		jnz	short loc_10004550
		test	cl, 1
		jnz	short loc_1000454E
		test	edx, edx
		jz	short loc_1000453D
		cmp	byte ptr [eax+1], 22h
		jnz	short loc_1000453D
		inc	eax
		jmp	short loc_1000453F
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_1000453D:				; CODE XREF: sub_100043F0+142j
					; sub_100043F0+148j
		xor	ebp, ebp

loc_1000453F:				; CODE XREF: sub_100043F0+14Bj
		mov	ebx, [esp+10h+arg_10]
		xor	edx, edx
		test	ebx, ebx
		setz	dl
		mov	[esp+10h+arg_10], edx

loc_1000454E:				; CODE XREF: sub_100043F0+13Ej
		shr	ecx, 1

loc_10004550:				; CODE XREF: sub_100043F0+139j
		mov	ebx, ecx
		dec	ecx
		test	ebx, ebx
		jz	short loc_10004568
		inc	ecx

loc_10004558:				; CODE XREF: sub_100043F0+176j
		test	esi, esi
		jz	short loc_10004560
		mov	byte ptr [esi],	5Ch
		inc	esi

loc_10004560:				; CODE XREF: sub_100043F0+16Aj
		mov	ebx, [edi]
		inc	ebx
		dec	ecx
		mov	[edi], ebx
		jnz	short loc_10004558

loc_10004568:				; CODE XREF: sub_100043F0+165j
		mov	cl, [eax]
		test	cl, cl
		jz	short loc_100045CB
		test	edx, edx
		jnz	short loc_1000457C
		cmp	cl, 20h
		jz	short loc_100045CB
		cmp	cl, 9
		jz	short loc_100045CB

loc_1000457C:				; CODE XREF: sub_100043F0+180j
		test	ebp, ebp
		jz	short loc_100045C5
		test	esi, esi
		jz	short loc_100045AE
		mov	ebx, ecx
		and	ebx, 0FFh
		test	byte ptr unk_10009D99[ebx], 4
		jz	short loc_1000459E
		mov	[esi], cl
		mov	ecx, [edi]
		inc	esi
		inc	eax
		inc	ecx
		mov	[edi], ecx

loc_1000459E:				; CODE XREF: sub_100043F0+1A3j
		mov	cl, [eax]
		mov	[esi], cl
		mov	ecx, [edi]
		inc	esi
		inc	ecx
		mov	[edi], ecx
		inc	eax
		jmp	loc_1000450E
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_100045AE:				; CODE XREF: sub_100043F0+192j
		and	ecx, 0FFh
		test	byte ptr unk_10009D99[ecx], 4
		jz	short loc_100045C3
		mov	ecx, [edi]
		inc	eax
		inc	ecx
		mov	[edi], ecx

loc_100045C3:				; CODE XREF: sub_100043F0+1CBj
		inc	dword ptr [edi]

loc_100045C5:				; CODE XREF: sub_100043F0+18Ej
		inc	eax
		jmp	loc_1000450E
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_100045CB:				; CODE XREF: sub_100043F0+17Cj
					; sub_100043F0+185j ...
		test	esi, esi
		jz	short loc_100045D3
		mov	byte ptr [esi],	0
		inc	esi

loc_100045D3:				; CODE XREF: sub_100043F0+1DDj
		mov	ecx, [edi]
		mov	ebp, [esp+10h+arg_4]
		inc	ecx
		mov	ebx, 4
		mov	[edi], ecx
		jmp	loc_100044DA
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_100045E6:				; CODE XREF: sub_100043F0+EDj
					; sub_100043F0+105j
		test	ebp, ebp
		jz	short loc_100045F1
		mov	dword ptr [ebp+0], 0

loc_100045F1:				; CODE XREF: sub_100043F0+1F8j
		mov	eax, [esp+10h+arg_C]
		pop	edi
		pop	esi
		pop	ebp
		mov	ecx, [eax]
		pop	ebx
		inc	ecx
		mov	[eax], ecx
		retn	
sub_100043F0	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 4

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

__setmbcp	proc near		; CODE XREF: ___initmbctable+2p

var_14		= dword	ptr -14h
var_E		= byte ptr -0Eh
var_D		= byte ptr -0Dh
arg_0		= dword	ptr  4

		sub	esp, 14h
		push	ebx
		push	ebp
		push	esi
		push	edi
		push	19h
		call	__lock
		mov	eax, [esp+28h+arg_0]
		add	esp, 4
		push	eax
		call	sub_10004820	; _getSystemCP
		mov	ebp, eax
		mov	eax, dword_10009E9C
		add	esp, 4
		cmp	ebp, eax
		mov	[esp+24h+arg_0], ebp
		jnz	short loc_10004641
		push	19h
		call	__unlock
		add	esp, 4
		xor	eax, eax
		pop	edi
		pop	esi
		pop	ebp
		pop	ebx
		add	esp, 14h
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10004641:				; CODE XREF: __setmbcp+2Bj
		xor	esi, esi
		cmp	ebp, esi
		jz	loc_1000473D
		xor	edx, edx
		mov	eax, offset unk_10009708

loc_10004652:				; CODE XREF: __setmbcp+63j
		cmp	[eax], ebp
		jz	loc_1000476B
		add	eax, 30h
		inc	edx
		cmp	eax, offset dword_100097F8
		jb	short loc_10004652
		lea	ecx, [esp+24h+var_14]
		push	ecx
		push	ebp
		call	ds:GetCPInfo
		cmp	eax, 1
		jnz	loc_10004735
		mov	ecx, 40h
		xor	eax, eax
		mov	edi, offset unk_10009D98
		repe stosd
		stosb
		cmp	[esp+24h+var_14], 1
		jbe	short loc_10004701
		mov	al, [esp+24h+var_E]
		test	al, al
		jz	short loc_100046CF
		lea	edx, [esp+24h+var_D]

loc_1000469C:				; CODE XREF: __setmbcp+CDj
		mov	cl, [edx]
		test	cl, cl
		jz	short loc_100046CF
		xor	eax, eax
		and	ecx, 0FFh
		mov	al, [edx-1]
		cmp	eax, ecx
		ja	short loc_100046C5

loc_100046B1:				; CODE XREF: __setmbcp+C3j
		mov	bl, byte ptr unk_10009D99[eax]
		or	bl, 4
		mov	byte ptr unk_10009D99[eax], bl
		inc	eax
		cmp	eax, ecx
		jbe	short loc_100046B1

loc_100046C5:				; CODE XREF: __setmbcp+AFj
		mov	al, [edx+1]
		add	edx, 2
		test	al, al
		jnz	short loc_1000469C

loc_100046CF:				; CODE XREF: __setmbcp+96j
					; __setmbcp+A0j
		mov	eax, 1

loc_100046D4:				; CODE XREF: __setmbcp+E9j
		mov	bl, byte ptr unk_10009D99[eax]
		or	bl, 8
		mov	byte ptr unk_10009D99[eax], bl
		inc	eax
		cmp	eax, 0FFh
		jb	short loc_100046D4
		push	ebp
		mov	dword_10009E9C,	ebp
		call	sub_10004870	; _CPtoLCID
		add	esp, 4
		mov	dword_10009EA0,	eax
		jmp	short loc_1000470D
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10004701:				; CODE XREF: __setmbcp+8Ej
		mov	dword_10009E9C,	esi
		mov	dword_10009EA0,	esi

loc_1000470D:				; CODE XREF: __setmbcp+FFj
		xor	edx, edx
		push	19h
		mov	dword_10009EA8,	edx
		mov	dword_10009EAC,	edx
		mov	dword_10009EB0,	edx
		call	__unlock
		add	esp, 4
		xor	eax, eax
		pop	edi
		pop	esi
		pop	ebp
		pop	ebx
		add	esp, 14h
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10004735:				; CODE XREF: __setmbcp+74j
		cmp	dword_10009EB4,	esi
		jz	short loc_10004756

loc_1000473D:				; CODE XREF: __setmbcp+45j
		call	sub_100048D0	; _setSBCS
		push	19h
		call	__unlock
		add	esp, 4
		xor	eax, eax
		pop	edi
		pop	esi
		pop	ebp
		pop	ebx
		add	esp, 14h
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10004756:				; CODE XREF: __setmbcp+13Bj
		push	19h
		call	__unlock
		add	esp, 4
		or	eax, 0FFFFFFFFh
		pop	edi
		pop	esi
		pop	ebp
		pop	ebx
		add	esp, 14h
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_1000476B:				; CODE XREF: __setmbcp+54j
		mov	ecx, 40h
		xor	eax, eax
		mov	edi, offset unk_10009D98
		lea	ebx, [edx+edx*2]
		repe stosd
		stosb
		xor	edi, edi
		shl	ebx, 4
		lea	ebp, unk_10009718[ebx]

loc_10004788:				; CODE XREF: __setmbcp+1C8j
		mov	al, [ebp+0]
		mov	esi, ebp
		test	al, al
		jz	short loc_100047C1

loc_10004791:				; CODE XREF: __setmbcp+1BFj
		mov	cl, [esi+1]
		test	cl, cl
		jz	short loc_100047C1
		xor	eax, eax
		and	ecx, 0FFh
		mov	al, [esi]
		cmp	eax, ecx
		ja	short loc_100047B7
		mov	dl, byte ptr unk_10009700[edi]

loc_100047AC:				; CODE XREF: __setmbcp+1B5j
		or	byte ptr unk_10009D99[eax], dl
		inc	eax
		cmp	eax, ecx
		jbe	short loc_100047AC

loc_100047B7:				; CODE XREF: __setmbcp+1A4j
		mov	al, [esi+2]
		add	esi, 2
		test	al, al
		jnz	short loc_10004791

loc_100047C1:				; CODE XREF: __setmbcp+18Fj
					; __setmbcp+196j
		inc	edi
		add	ebp, 8
		cmp	edi, 4
		jb	short loc_10004788
		mov	eax, [esp+24h+arg_0]
		push	eax
		mov	dword_10009E9C,	eax
		call	sub_10004870	; _CPtoLCID
		mov	ecx, dword ptr aVyv[ebx]
		mov	edx, dword ptr aVyv+4[ebx]
		mov	dword_10009EA0,	eax
		lea	eax, aVyv[ebx]
		add	esp, 4
		mov	dword_10009EA8,	ecx
		mov	eax, [eax+8]
		mov	dword_10009EAC,	edx
		push	19h
		mov	dword_10009EB0,	eax
		call	__unlock
		add	esp, 4
		xor	eax, eax
		pop	edi
		pop	esi
		pop	ebp
		pop	ebx
		add	esp, 14h
		retn	
__setmbcp	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 8

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; _getSystemCP
; Attributes: library function static

sub_10004820	proc near		; CODE XREF: __setmbcp+16p

arg_0		= dword	ptr  4

		mov	eax, [esp+arg_0]
		mov	dword_10009EB4,	0
		cmp	eax, 0FFFFFFFEh
		jnz	short loc_10004843
		mov	dword_10009EB4,	1
		jmp	ds:GetOEMCP
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10004843:				; CODE XREF: sub_10004820+11j
		cmp	eax, 0FFFFFFFDh
		jnz	short loc_10004858
		mov	dword_10009EB4,	1
		jmp	ds:GetACP
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10004858:				; CODE XREF: sub_10004820+26j
		cmp	eax, 0FFFFFFFCh
		jnz	short locret_1000486C
		mov	eax, dword_10009EE8
		mov	dword_10009EB4,	1

locret_1000486C:			; CODE XREF: sub_10004820+3Bj
		retn	
sub_10004820	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 4

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; _CPtoLCID
; Attributes: library function static

sub_10004870	proc near		; CODE XREF: __setmbcp+F2p
					; __setmbcp+1D4p

arg_0		= dword	ptr  4

		mov	eax, [esp+arg_0]
		add	eax, 0FFFFFC5Ch
		cmp	eax, 12h
		ja	short loc_100048A5
		xor	ecx, ecx
		mov	cl, ds:byte_100048BC[eax]
		jmp	ds:off_100048A8[ecx*4]
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_1000488D:				; DATA XREF: .text:100048A8o
		mov	eax, 411h
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10004893:				; DATA XREF: .text:100048ACo
		mov	eax, 804h
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10004899:				; DATA XREF: .text:100048B0o
		mov	eax, 412h
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_1000489F:				; DATA XREF: .text:100048B4o
		mov	eax, 404h
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_100048A5:				; CODE XREF: sub_10004870+Cj
					; DATA XREF: .text:100048B8o
		xor	eax, eax
		retn	
sub_10004870	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
off_100048A8	dd offset loc_1000488D	; DATA XREF: sub_10004870+16r
		dd offset loc_10004893
		dd offset loc_10004899
		dd offset loc_1000489F
		dd offset loc_100048A5
byte_100048BC	db 0, 3	dup(4),	1, 0Ch dup(4) ;	DATA XREF: sub_10004870+10r
		db 2, 3, 90h

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; _setSBCS
; Attributes: library function static

sub_100048D0	proc near		; CODE XREF: __setmbcp+13Dp
		push	edi
		mov	ecx, 40h
		xor	eax, eax
		mov	edi, offset unk_10009D98
		repe stosd
		stosb
		xor	eax, eax
		pop	edi
		mov	dword_10009E9C,	eax
		mov	dword_10009EA0,	eax
		mov	dword_10009EA8,	eax
		mov	dword_10009EAC,	eax
		mov	dword_10009EB0,	eax
		retn	
sub_100048D0	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 4

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

___initmbctable	proc near		; CODE XREF: __CRT_INIT@12+D6p
		push	0FFFFFFFDh
		call	__setmbcp
		add	esp, 4
		retn	
___initmbctable	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 8

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

___crtGetEnvironmentStringsA proc near	; CODE XREF: __CRT_INIT@12+B9p
		mov	eax, dword_10009EBC
		push	ebx
		push	ebp
		mov	ebp, ds:GetEnvironmentStrings
		push	esi
		xor	esi, esi
		xor	ebx, ebx
		push	edi
		mov	edi, ds:GetEnvironmentStringsW
		test	eax, eax
		jnz	short loc_10004952
		call	edi
		mov	esi, eax
		test	esi, esi
		jz	short loc_1000493C
		mov	eax, 1
		jmp	short loc_1000494D
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_1000493C:				; CODE XREF: ___crtGetEnvironmentStringsA+23j
		call	ebp
		mov	ebx, eax
		test	ebx, ebx
		jz	loc_10004A5F
		mov	eax, 2

loc_1000494D:				; CODE XREF: ___crtGetEnvironmentStringsA+2Aj
		mov	dword_10009EBC,	eax

loc_10004952:				; CODE XREF: ___crtGetEnvironmentStringsA+1Bj
		cmp	eax, 1
		jnz	loc_100049F2
		test	esi, esi
		jnz	short loc_1000496B
		call	edi
		mov	esi, eax
		test	esi, esi
		jz	loc_10004A5F

loc_1000496B:				; CODE XREF: ___crtGetEnvironmentStringsA+4Dj
		cmp	word ptr [esi],	0
		mov	eax, esi
		jz	short loc_10004985

loc_10004973:				; CODE XREF: ___crtGetEnvironmentStringsA+6Aj
					; ___crtGetEnvironmentStringsA+73j
		add	eax, 2
		cmp	word ptr [eax],	0
		jnz	short loc_10004973
		add	eax, 2
		cmp	word ptr [eax],	0
		jnz	short loc_10004973

loc_10004985:				; CODE XREF: ___crtGetEnvironmentStringsA+61j
		sub	eax, esi
		push	0
		sar	eax, 1
		inc	eax
		push	0
		mov	ebp, eax
		push	0
		push	0
		push	ebp
		push	esi
		push	0
		push	0
		call	ds:WideCharToMultiByte
		mov	edi, eax
		test	edi, edi
		jz	short loc_100049E4
		push	edi
		call	_malloc
		mov	ebx, eax
		add	esp, 4
		test	ebx, ebx
		jz	short loc_100049E4
		push	0
		push	0
		push	edi
		push	ebx
		push	ebp
		push	esi
		push	0
		push	0
		call	ds:WideCharToMultiByte
		test	eax, eax
		jnz	short loc_100049D6
		push	ebx
		call	_free
		add	esp, 4
		xor	ebx, ebx

loc_100049D6:				; CODE XREF: ___crtGetEnvironmentStringsA+B9j
		push	esi
		call	ds:FreeEnvironmentStringsW
		mov	eax, ebx
		pop	edi
		pop	esi
		pop	ebp
		pop	ebx
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_100049E4:				; CODE XREF: ___crtGetEnvironmentStringsA+94j
					; ___crtGetEnvironmentStringsA+A3j
		push	esi
		call	ds:FreeEnvironmentStringsW
		xor	eax, eax
		pop	edi
		pop	esi
		pop	ebp
		pop	ebx
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_100049F2:				; CODE XREF: ___crtGetEnvironmentStringsA+45j
		cmp	eax, 2
		jnz	short loc_10004A5F
		test	ebx, ebx
		jnz	short loc_10004A03
		call	ebp
		mov	ebx, eax
		test	ebx, ebx
		jz	short loc_10004A5F

loc_10004A03:				; CODE XREF: ___crtGetEnvironmentStringsA+E9j
		mov	cl, [ebx]
		mov	eax, ebx
		test	cl, cl
		jz	short loc_10004A1B

loc_10004A0B:				; CODE XREF: ___crtGetEnvironmentStringsA+101j
					; ___crtGetEnvironmentStringsA+109j
		mov	cl, [eax+1]
		inc	eax
		test	cl, cl
		jnz	short loc_10004A0B
		mov	cl, [eax+1]
		inc	eax
		test	cl, cl
		jnz	short loc_10004A0B

loc_10004A1B:				; CODE XREF: ___crtGetEnvironmentStringsA+F9j
		sub	eax, ebx
		inc	eax
		mov	esi, eax
		push	esi
		call	_malloc
		mov	ebp, eax
		add	esp, 4
		test	ebp, ebp
		jnz	short loc_10004A3D
		push	ebx
		call	ds:FreeEnvironmentStringsA
		xor	eax, eax
		pop	edi
		pop	esi
		pop	ebp
		pop	ebx
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10004A3D:				; CODE XREF: ___crtGetEnvironmentStringsA+11Dj
		mov	ecx, esi
		mov	esi, ebx
		mov	eax, ecx
		mov	edi, ebp
		shr	ecx, 2
		repe movsd
		mov	ecx, eax
		push	ebx
		and	ecx, 3
		repe movsb
		call	ds:FreeEnvironmentStringsA
		mov	eax, ebp
		pop	edi
		pop	esi
		pop	ebp
		pop	ebx
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10004A5F:				; CODE XREF: ___crtGetEnvironmentStringsA+32j
					; ___crtGetEnvironmentStringsA+55j ...
		pop	edi
		pop	esi
		pop	ebp
		xor	eax, eax
		pop	ebx
		retn	
___crtGetEnvironmentStringsA endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e

sub_10004A70	proc near		; CODE XREF: __CRT_INIT@12+2Fp
					; __CRT_INIT@12+58p

arg_0		= dword	ptr  4

		mov	eax, [esp+arg_0]
		mov	dword_10009BDC,	eax
		retn	
sub_10004A70	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 8

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

__FF_MSGBANNER	proc near		; CODE XREF: __amsg_exit+17p
		mov	eax, dword_10009BD8
		cmp	eax, 1
		jz	short loc_10004A97
		test	eax, eax
		jnz	short locret_10004ABC
		cmp	dword_10009BDC,	1
		jnz	short locret_10004ABC

loc_10004A97:				; CODE XREF: __FF_MSGBANNER+8j
		push	0FCh
		call	__NMSG_WRITE
		mov	eax, dword_10009EC0
		add	esp, 4
		test	eax, eax
		jz	short loc_10004AAF
		call	eax

loc_10004AAF:				; CODE XREF: __FF_MSGBANNER+2Bj
		push	0FFh
		call	__NMSG_WRITE
		add	esp, 4

locret_10004ABC:			; CODE XREF: __FF_MSGBANNER+Cj
					; __FF_MSGBANNER+15j
		retn	
__FF_MSGBANNER	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 4

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

__NMSG_WRITE	proc near		; CODE XREF: __amsg_exit+21p
					; __FF_MSGBANNER+1Cp ...

var_1A8		= byte ptr -1A8h
var_1A4		= byte ptr -1A4h
var_104		= byte ptr -104h
arg_0		= dword	ptr  4

		mov	ecx, [esp+arg_0]
		sub	esp, 1A8h
		mov	eax, offset dword_100097F8
		push	ebx
		push	ebp
		push	esi
		push	edi
		xor	ebp, ebp

loc_10004AD5:				; CODE XREF: __NMSG_WRITE+22j
		cmp	ecx, [eax]
		jz	short loc_10004AE4
		add	eax, 8
		inc	ebp
		cmp	eax, offset off_10009888
		jb	short loc_10004AD5

loc_10004AE4:				; CODE XREF: __NMSG_WRITE+17j
		cmp	ecx, dword_100097F8[ebp*8]
		jnz	loc_10004C8B
		mov	eax, dword_10009BD8
		cmp	eax, 1
		jz	loc_10004C4D
		test	eax, eax
		jnz	short loc_10004B10
		cmp	dword_10009BDC,	1
		jz	loc_10004C4D

loc_10004B10:				; CODE XREF: __NMSG_WRITE+41j
		cmp	ecx, 0FCh
		jz	loc_10004C8B
		lea	eax, [esp+1B8h+var_104]
		push	104h
		push	eax
		push	0
		call	ds:GetModuleFileNameA
		test	eax, eax
		jnz	short loc_10004B4B
		mov	ecx, 5
		mov	esi, offset aProgramNameUnk
		lea	edi, [esp+1B8h+var_104]
		repe movsd
		movsw
		movsb

loc_10004B4B:				; CODE XREF: __NMSG_WRITE+73j
		lea	edi, [esp+1B8h+var_104]
		or	ecx, 0FFFFFFFFh
		xor	eax, eax
		lea	ebx, [esp+1B8h+var_104]
		repne scasb
		not	ecx
		cmp	ecx, 3Ch
		jbe	short loc_10004B94
		lea	edi, [esp+1B8h+var_104]
		or	ecx, 0FFFFFFFFh
		repne scasb
		not	ecx
		dec	ecx
		push	3
		mov	ebx, ecx
		lea	ecx, [esp+1BCh+var_104]
		sub	ecx, 3Bh
		push	offset unk_1000637C
		add	ebx, ecx
		push	ebx
		call	_strncpy
		add	esp, 0Ch

loc_10004B94:				; CODE XREF: __NMSG_WRITE+A5j
		mov	ecx, 6
		mov	esi, offset aRuntimeErrorPr
		lea	edi, [esp+1B8h+var_1A4]
		xor	eax, eax
		repe movsd
		movsw
		or	ecx, 0FFFFFFFFh
		mov	edi, ebx
		repne scasb
		not	ecx
		sub	edi, ecx
		lea	edx, [esp+1B8h+var_1A4]
		mov	ebx, ecx
		mov	esi, edi
		or	ecx, 0FFFFFFFFh
		mov	edi, edx
		repne scasb
		mov	ecx, ebx
		dec	edi
		shr	ecx, 2
		repe movsd
		mov	ecx, ebx
		lea	edx, [esp+1B8h+var_1A4]
		and	ecx, 3
		push	12010h
		repe movsb
		mov	edi, offset unk_1000635C
		or	ecx, 0FFFFFFFFh
		repne scasb
		not	ecx
		sub	edi, ecx
		push	offset aMicrosoftVisua
		mov	esi, edi
		mov	ebx, ecx
		mov	edi, edx
		or	ecx, 0FFFFFFFFh
		repne scasb
		mov	ecx, ebx
		dec	edi
		shr	ecx, 2
		repe movsd
		mov	ecx, ebx
		lea	edx, [esp+1C0h+var_1A4]
		and	ecx, 3
		repe movsb
		mov	edi, off_100097FC[ebp*8]
		or	ecx, 0FFFFFFFFh
		repne scasb
		not	ecx
		sub	edi, ecx
		mov	esi, edi
		mov	ebx, ecx
		mov	edi, edx
		or	ecx, 0FFFFFFFFh
		repne scasb
		mov	ecx, ebx
		dec	edi
		shr	ecx, 2
		repe movsd
		mov	ecx, ebx
		lea	eax, [esp+1C0h+var_1A4]
		and	ecx, 3
		push	eax
		repe movsb
		call	___crtMessageBoxA
		add	esp, 0Ch
		pop	edi
		pop	esi
		pop	ebp
		pop	ebx
		add	esp, 1A8h
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10004C4D:				; CODE XREF: __NMSG_WRITE+39j
					; __NMSG_WRITE+4Aj
		mov	eax, dword_1000AF20
		test	eax, eax
		jz	short loc_10004C5E
		mov	esi, [eax+48h]
		cmp	esi, 0FFFFFFFFh
		jnz	short loc_10004C68

loc_10004C5E:				; CODE XREF: __NMSG_WRITE+194j
		push	0FFFFFFF4h
		call	ds:GetStdHandle
		mov	esi, eax

loc_10004C68:				; CODE XREF: __NMSG_WRITE+19Cj
		mov	edx, off_100097FC[ebp*8]
		lea	ecx, [esp+1B8h+var_1A8]
		push	0
		push	ecx
		mov	edi, edx
		or	ecx, 0FFFFFFFFh
		xor	eax, eax
		repne scasb
		not	ecx
		dec	ecx
		push	ecx
		push	edx
		push	esi
		call	ds:WriteFile

loc_10004C8B:				; CODE XREF: __NMSG_WRITE+2Bj
					; __NMSG_WRITE+56j
		pop	edi
		pop	esi
		pop	ebp
		pop	ebx
		add	esp, 1A8h
		retn	
__NMSG_WRITE	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

___initstdio	proc near		; DATA XREF: .data:1000700Co
		mov	eax, dword_1000AF00
		push	esi
		test	eax, eax
		jnz	short loc_10004CB1
		mov	eax, 200h
		jmp	short loc_10004CBB
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10004CB1:				; CODE XREF: ___initstdio+8j
		cmp	eax, 14h
		jge	short loc_10004CC0
		mov	eax, 14h

loc_10004CBB:				; CODE XREF: ___initstdio+Fj
		mov	dword_1000AF00,	eax

loc_10004CC0:				; CODE XREF: ___initstdio+14j
		push	4
		push	eax
		call	_calloc
		add	esp, 8
		mov	dword_10009EFC,	eax
		test	eax, eax
		jnz	short loc_10004D02
		push	4
		push	14h
		mov	dword_1000AF00,	14h
		call	_calloc
		add	esp, 8
		mov	dword_10009EFC,	eax
		test	eax, eax
		jnz	short loc_10004D02
		push	1Ah
		call	__amsg_exit
		mov	eax, dword_10009EFC
		add	esp, 4

loc_10004D02:				; CODE XREF: ___initstdio+32j
					; ___initstdio+51j
		xor	edx, edx
		mov	ecx, offset off_10009888
		jmp	short loc_10004D10
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10004D0B:				; CODE XREF: ___initstdio+7Fj
		mov	eax, dword_10009EFC

loc_10004D10:				; CODE XREF: ___initstdio+69j
		mov	[eax+edx], ecx
		add	ecx, 20h
		add	edx, 4
		cmp	ecx, offset unk_10009B08
		jl	short loc_10004D0B
		xor	ecx, ecx
		mov	edx, offset unk_10009898

loc_10004D28:				; CODE XREF: ___initstdio+B8j
		mov	esi, ecx
		mov	eax, ecx
		sar	esi, 5
		and	eax, 1Fh
		mov	esi, dword_1000AF20[esi*4]
		lea	eax, [eax+eax*8]
		mov	eax, [esi+eax*4]
		cmp	eax, 0FFFFFFFFh
		jz	short loc_10004D48
		test	eax, eax
		jnz	short loc_10004D4E

loc_10004D48:				; CODE XREF: ___initstdio+A2j
		mov	dword ptr [edx], 0FFFFFFFFh

loc_10004D4E:				; CODE XREF: ___initstdio+A6j
		add	edx, 20h
		inc	ecx
		cmp	edx, offset unk_100098F8
		jl	short loc_10004D28
		pop	esi
		retn	
___initstdio	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 8

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

___endstdio	proc near		; DATA XREF: .data:10007018o
		call	__flushall
		mov	al, byte_10009C84
		test	al, al
		jz	short locret_10004D73
		jmp	__fcloseall
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

locret_10004D73:			; CODE XREF: ___endstdio+Cj
		retn	
___endstdio	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

__alloc_osfhnd	proc near		; CODE XREF: __sopen+187p

var_8		= dword	ptr -8
var_4		= dword	ptr -4

		sub	esp, 8
		push	ebx
		push	ebp
		push	esi
		push	edi
		push	12h
		mov	[esp+1Ch+var_8], 0FFFFFFFFh
		call	__lock
		xor	edi, edi
		add	esp, 4
		mov	[esp+18h+var_4], edi
		xor	ebx, ebx
		mov	ebp, offset dword_1000AF20

loc_10004DA6:				; CODE XREF: __alloc_osfhnd+DFj
		mov	esi, [ebp+0]
		test	esi, esi
		jz	loc_10004E67
		lea	eax, [esi+480h]
		cmp	esi, eax
		jnb	loc_10004E3F

loc_10004DBF:				; CODE XREF: __alloc_osfhnd+99j
		test	byte ptr [esi+4], 1
		jnz	short loc_10004E0B
		mov	eax, [esi+8]
		test	eax, eax
		jnz	short loc_10004DF4
		push	11h
		call	__lock
		mov	eax, [esi+8]
		add	esp, 4
		test	eax, eax
		jnz	short loc_10004DEA
		lea	ecx, [esi+0Ch]
		push	ecx
		call	ds:InitializeCriticalSection
		inc	dword ptr [esi+8]

loc_10004DEA:				; CODE XREF: __alloc_osfhnd+5Bj
		push	11h
		call	__unlock
		add	esp, 4

loc_10004DF4:				; CODE XREF: __alloc_osfhnd+4Aj
		lea	edi, [esi+0Ch]
		push	edi
		call	ds:EnterCriticalSection
		test	byte ptr [esi+4], 1
		jz	short loc_10004E1D
		push	edi
		call	ds:LeaveCriticalSection

loc_10004E0B:				; CODE XREF: __alloc_osfhnd+43j
		mov	edx, [ebp+0]
		add	esi, 24h
		add	edx, 480h
		cmp	esi, edx
		jb	short loc_10004DBF
		jmp	short loc_10004E3F
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10004E1D:				; CODE XREF: __alloc_osfhnd+82j
		mov	dword ptr [esi], 0FFFFFFFFh
		mov	eax, [ebp+0]
		sub	esi, eax
		mov	eax, 38E38E39h
		imul	esi
		sar	edx, 3
		mov	eax, edx
		shr	eax, 1Fh
		add	edx, eax
		add	edx, ebx
		mov	[esp+18h+var_8], edx

loc_10004E3F:				; CODE XREF: __alloc_osfhnd+39j
					; __alloc_osfhnd+9Bj
		cmp	[esp+18h+var_8], 0FFFFFFFFh
		jnz	loc_10004ED2
		mov	edi, [esp+18h+var_4]
		add	ebp, 4
		inc	edi
		add	ebx, 20h
		cmp	ebp, offset dword_1000B020
		mov	[esp+18h+var_4], edi
		jl	loc_10004DA6
		jmp	short loc_10004ED2
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10004E67:				; CODE XREF: __alloc_osfhnd+2Bj
		push	480h
		call	_malloc
		xor	edx, edx
		add	esp, 4
		cmp	eax, edx
		jz	short loc_10004ED2
		mov	ebx, dword_1000B020
		lea	ecx, [eax+480h]
		add	ebx, 20h
		cmp	eax, ecx
		mov	dword_1000AF20[edi*4], eax
		mov	dword_1000B020,	ebx
		jnb	short loc_10004EC0
		mov	cl, 0Ah

loc_10004E9C:				; CODE XREF: __alloc_osfhnd+13Ej
		mov	byte ptr [eax+4], 0
		mov	dword ptr [eax], 0FFFFFFFFh
		mov	[eax+5], cl
		mov	[eax+8], edx
		mov	esi, dword_1000AF20[edi*4]
		add	eax, 24h
		add	esi, 480h
		cmp	eax, esi
		jb	short loc_10004E9C

loc_10004EC0:				; CODE XREF: __alloc_osfhnd+118j
		shl	edi, 5
		mov	eax, edi
		push	eax
		mov	[esp+1Ch+var_8], eax
		call	__lock_fhandle
		add	esp, 4

loc_10004ED2:				; CODE XREF: __alloc_osfhnd+C4j
					; __alloc_osfhnd+E5j ...
		push	12h
		call	__unlock
		mov	eax, [esp+1Ch+var_8]
		add	esp, 4
		pop	edi
		pop	esi
		pop	ebp
		pop	ebx
		add	esp, 8
		retn	
__alloc_osfhnd	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

__set_osfhnd	proc near		; CODE XREF: __sopen+227p

arg_0		= dword	ptr  4
arg_4		= dword	ptr  8

		mov	ecx, [esp+arg_0]
		mov	eax, dword_1000B020
		push	ebx
		push	esi
		cmp	ecx, eax
		push	edi
		jnb	short loc_10004F74
		mov	eax, ecx
		sar	eax, 5
		lea	edi, dword_1000AF20[eax*4]
		mov	eax, ecx
		and	eax, 1Fh
		mov	edx, [edi]
		lea	esi, [eax+eax*8]
		shl	esi, 2
		cmp	dword ptr [edx+esi], 0FFFFFFFFh
		jnz	short loc_10004F74
		mov	eax, dword_10009BDC
		mov	ebx, [esp+0Ch+arg_4]
		cmp	eax, 1
		jnz	short loc_10004F69
		sub	ecx, 0
		jz	short loc_10004F60
		dec	ecx
		jz	short loc_10004F4C
		dec	ecx
		jnz	short loc_10004F69
		push	ebx
		push	0FFFFFFF4h
		call	ds:SetStdHandle
		mov	eax, [edi]
		mov	[eax+esi], ebx
		xor	eax, eax
		pop	edi
		pop	esi
		pop	ebx
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10004F4C:				; CODE XREF: __set_osfhnd+43j
		push	ebx
		push	0FFFFFFF5h
		call	ds:SetStdHandle
		mov	eax, [edi]
		mov	[eax+esi], ebx
		xor	eax, eax
		pop	edi
		pop	esi
		pop	ebx
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10004F60:				; CODE XREF: __set_osfhnd+40j
		push	ebx
		push	0FFFFFFF6h
		call	ds:SetStdHandle

loc_10004F69:				; CODE XREF: __set_osfhnd+3Bj
					; __set_osfhnd+46j
		mov	eax, [edi]
		mov	[eax+esi], ebx
		xor	eax, eax
		pop	edi
		pop	esi
		pop	ebx
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10004F74:				; CODE XREF: __set_osfhnd+Ej
					; __set_osfhnd+2Dj
		call	__errno
		mov	dword ptr [eax], 9
		call	___doserrno
		pop	edi
		mov	dword ptr [eax], 0
		pop	esi
		or	eax, 0FFFFFFFFh
		pop	ebx
		retn	
__set_osfhnd	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

__free_osfhnd	proc near		; CODE XREF: __close_lk+59p

arg_0		= dword	ptr  4

		mov	ecx, [esp+arg_0]
		mov	eax, dword_1000B020
		push	ebx
		push	esi
		cmp	ecx, eax
		push	edi
		jnb	short loc_10005016
		mov	eax, ecx
		sar	eax, 5
		lea	edi, dword_1000AF20[eax*4]
		mov	eax, ecx
		and	eax, 1Fh
		mov	edx, [edi]
		lea	esi, [eax+eax*8]
		shl	esi, 2
		mov	bl, [edx+esi+4]
		lea	eax, [edx+esi]
		mov	edx, 1
		test	dl, bl
		jz	short loc_10005016
		cmp	dword ptr [eax], 0FFFFFFFFh
		jz	short loc_10005016
		cmp	dword_10009BDC,	edx
		jnz	short loc_10005007
		sub	ecx, 0
		jz	short loc_10004FFD
		dec	ecx
		jz	short loc_10004FF7
		dec	ecx
		jnz	short loc_10005007
		push	0
		push	0FFFFFFF4h
		jmp	short loc_10005001
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10004FF7:				; CODE XREF: __free_osfhnd+4Cj
		push	0
		push	0FFFFFFF5h
		jmp	short loc_10005001
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10004FFD:				; CODE XREF: __free_osfhnd+49j
		push	0
		push	0FFFFFFF6h

loc_10005001:				; CODE XREF: __free_osfhnd+55j
					; __free_osfhnd+5Bj
		call	ds:SetStdHandle

loc_10005007:				; CODE XREF: __free_osfhnd+44j
					; __free_osfhnd+4Fj
		mov	eax, [edi]
		mov	dword ptr [eax+esi], 0FFFFFFFFh
		xor	eax, eax
		pop	edi
		pop	esi
		pop	ebx
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10005016:				; CODE XREF: __free_osfhnd+Ej
					; __free_osfhnd+37j ...
		call	__errno
		mov	dword ptr [eax], 9
		call	___doserrno
		pop	edi
		mov	dword ptr [eax], 0
		pop	esi
		or	eax, 0FFFFFFFFh
		pop	ebx
		retn	
__free_osfhnd	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

__get_osfhandle	proc near		; CODE XREF: __close_lk+7p
					; __close_lk+20p ...

arg_0		= dword	ptr  4

		mov	eax, [esp+arg_0]
		mov	ecx, dword_1000B020
		cmp	eax, ecx
		jnb	short loc_1000506F
		mov	ecx, eax
		and	eax, 1Fh
		sar	ecx, 5
		lea	edx, [eax+eax*8]
		mov	eax, dword_1000AF20[ecx*4]
		mov	cl, [eax+edx*4+4]
		lea	eax, [eax+edx*4]
		test	cl, 1
		jz	short loc_1000506F
		mov	eax, [eax]
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_1000506F:				; CODE XREF: __get_osfhandle+Cj
					; __get_osfhandle+2Aj
		call	__errno
		mov	dword ptr [eax], 9
		call	___doserrno
		mov	dword ptr [eax], 0
		or	eax, 0FFFFFFFFh
		retn	
__get_osfhandle	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 8

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

__lock_fhandle	proc near		; CODE XREF: __close+2Bp __read+2Bp ...

arg_0		= dword	ptr  4

		mov	eax, [esp+arg_0]
		push	ebx
		mov	ecx, eax
		and	eax, 1Fh
		sar	ecx, 5
		push	esi
		push	edi
		mov	esi, dword_1000AF20[ecx*4]
		lea	ebx, dword_1000AF20[ecx*4]
		lea	edi, [eax+eax*8]
		shl	edi, 2
		add	esi, edi
		mov	eax, [esi+8]
		test	eax, eax
		jnz	short loc_100050E4
		push	11h
		call	__lock
		mov	eax, [esi+8]
		add	esp, 4
		test	eax, eax
		jnz	short loc_100050DA
		lea	edx, [esi+0Ch]
		push	edx
		call	ds:InitializeCriticalSection
		inc	dword ptr [esi+8]

loc_100050DA:				; CODE XREF: __lock_fhandle+3Bj
		push	11h
		call	__unlock
		add	esp, 4

loc_100050E4:				; CODE XREF: __lock_fhandle+2Aj
		mov	eax, [ebx]
		lea	ecx, [eax+edi+0Ch]
		push	ecx
		call	ds:EnterCriticalSection
		pop	edi
		pop	esi
		pop	ebx
		retn	
__lock_fhandle	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

__unlock_fhandle proc near		; CODE XREF: __close+3Fp __read+49p ...

arg_0		= dword	ptr  4

		mov	eax, [esp+arg_0]
		mov	ecx, eax
		and	eax, 1Fh
		sar	ecx, 5
		lea	edx, [eax+eax*8]
		mov	eax, dword_1000AF20[ecx*4]
		lea	ecx, [eax+edx*4+0Ch]
		push	ecx
		call	ds:LeaveCriticalSection
		retn	
__unlock_fhandle endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

__commit	proc near		; CODE XREF: __fflush_lk+23p

arg_0		= dword	ptr  4

		mov	eax, dword_1000B020
		push	ebp
		push	esi
		push	edi
		mov	edi, [esp+0Ch+arg_0]
		cmp	edi, eax
		jnb	short loc_100051BC
		mov	eax, edi
		sar	eax, 5
		lea	ebp, dword_1000AF20[eax*4]
		mov	eax, edi
		and	eax, 1Fh
		mov	ecx, [ebp+0]
		lea	esi, [eax+eax*8]
		shl	esi, 2
		test	byte ptr [ecx+esi+4], 1
		jz	short loc_100051BC
		push	edi
		call	__lock_fhandle
		mov	edx, [ebp+0]
		add	esp, 4
		test	byte ptr [edx+esi+4], 1
		jz	short loc_1000519F
		push	edi
		call	__get_osfhandle
		add	esp, 4
		push	eax
		call	ds:FlushFileBuffers
		test	eax, eax
		jnz	short loc_10005192
		call	ds:GetLastError
		mov	esi, eax
		jmp	short loc_10005194
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10005192:				; CODE XREF: __commit+56j
		xor	esi, esi

loc_10005194:				; CODE XREF: __commit+60j
		test	esi, esi
		jz	short loc_100051AD
		call	___doserrno
		mov	[eax], esi

loc_1000519F:				; CODE XREF: __commit+42j
		call	__errno
		mov	dword ptr [eax], 9
		or	esi, 0FFFFFFFFh

loc_100051AD:				; CODE XREF: __commit+66j
		push	edi
		call	__unlock_fhandle
		add	esp, 4
		mov	eax, esi
		pop	edi
		pop	esi
		pop	ebp
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_100051BC:				; CODE XREF: __commit+Ej __commit+2Fj
		call	__errno
		pop	edi
		mov	dword ptr [eax], 9
		pop	esi
		or	eax, 0FFFFFFFFh
		pop	ebp
		retn	
__commit	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 4

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

__write		proc near		; CODE XREF: __flush+2Ep

arg_0		= dword	ptr  4
arg_4		= dword	ptr  8
arg_8		= dword	ptr  0Ch

		mov	eax, dword_1000B020
		push	esi
		mov	esi, [esp+4+arg_0]
		push	edi
		cmp	esi, eax
		jnb	short loc_10005226
		mov	eax, esi
		mov	ecx, esi
		and	eax, 1Fh
		sar	ecx, 5
		lea	edx, [eax+eax*8]
		mov	eax, dword_1000AF20[ecx*4]
		test	byte ptr [eax+edx*4+4],	1
		jz	short loc_10005226
		push	esi
		call	__lock_fhandle
		mov	ecx, [esp+0Ch+arg_8]
		mov	edx, [esp+0Ch+arg_4]
		add	esp, 4
		push	ecx
		push	edx
		push	esi
		call	__write_lk
		add	esp, 0Ch
		mov	edi, eax
		push	esi
		call	__unlock_fhandle
		add	esp, 4
		mov	eax, edi
		pop	edi
		pop	esi
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10005226:				; CODE XREF: __write+Dj __write+28j
		call	__errno
		mov	dword ptr [eax], 9
		call	___doserrno
		mov	dword ptr [eax], 0
		pop	edi
		or	eax, 0FFFFFFFFh
		pop	esi
		retn	
__write		endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

__write_lk	proc near		; CODE XREF: __write+3Ep
					; __chsize_lk+8Dp

var_41C		= dword	ptr -41Ch
var_418		= dword	ptr -418h
var_414		= dword	ptr -414h
var_410		= dword	ptr -410h
var_40C		= dword	ptr -40Ch
var_408		= dword	ptr -408h
var_404		= byte ptr -404h
arg_0		= dword	ptr  4
arg_4		= dword	ptr  8
arg_8		= dword	ptr  0Ch

		sub	esp, 41Ch
		push	ebx
		mov	ebx, [esp+420h+arg_8]
		push	ebp
		xor	ebp, ebp
		push	esi
		cmp	ebx, ebp
		push	edi
		mov	[esp+42Ch+var_41C], ebp
		mov	[esp+42Ch+var_40C], ebp
		jnz	short loc_1000527C
		xor	eax, eax
		pop	edi
		pop	esi
		pop	ebp
		pop	ebx
		add	esp, 41Ch
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_1000527C:				; CODE XREF: __write_lk+1Dj
		mov	ecx, [esp+42Ch+arg_0]
		mov	eax, ecx
		sar	eax, 5
		lea	edi, dword_1000AF20[eax*4]
		mov	eax, ecx
		and	eax, 1Fh
		mov	[esp+42Ch+var_408], edi
		mov	edx, [edi]
		lea	esi, [eax+eax*8]
		shl	esi, 2
		mov	[esp+42Ch+var_418], esi
		test	byte ptr [esi+edx+4], 20h
		jz	short loc_100052B7
		push	2
		push	ebp
		push	ecx
		call	__lseek_lk
		add	esp, 0Ch

loc_100052B7:				; CODE XREF: __write_lk+59j
		mov	eax, [edi]
		add	eax, esi
		test	byte ptr [eax+4], 80h
		jz	loc_10005419
		mov	ebp, [esp+42Ch+arg_4]
		mov	[esp+42Ch+var_414], 0
		test	ebx, ebx
		mov	edi, ebp
		jbe	loc_10005361

loc_100052DE:				; CODE XREF: __write_lk+10Bj
		lea	eax, [esp+42Ch+var_404]

loc_100052E2:				; CODE XREF: __write_lk+C0j
		mov	ecx, edi
		sub	ecx, ebp
		cmp	ecx, ebx
		jnb	short loc_10005312
		mov	cl, [edi]
		inc	edi
		cmp	cl, 0Ah
		jnz	short loc_100052FF
		mov	esi, [esp+42Ch+var_40C]
		mov	byte ptr [eax],	0Dh
		inc	esi
		inc	eax
		mov	[esp+42Ch+var_40C], esi

loc_100052FF:				; CODE XREF: __write_lk+A0j
		mov	[eax], cl
		inc	eax
		mov	edx, eax
		lea	ecx, [esp+42Ch+var_404]
		sub	edx, ecx
		cmp	edx, 400h
		jl	short loc_100052E2

loc_10005312:				; CODE XREF: __write_lk+98j
		mov	esi, eax
		lea	edx, [esp+42Ch+var_404]
		lea	eax, [esp+42Ch+var_410]
		sub	esi, edx
		mov	edx, [esp+42Ch+var_408]
		push	0
		push	eax
		lea	ecx, [esp+434h+var_404]
		mov	eax, [edx]
		push	esi
		push	ecx
		mov	ecx, [esp+43Ch+var_418]
		mov	edx, [ecx+eax]
		push	edx
		call	ds:WriteFile
		test	eax, eax
		jz	loc_1000540A
		mov	eax, [esp+42Ch+var_410]
		mov	edx, [esp+42Ch+var_41C]
		add	edx, eax
		cmp	eax, esi
		mov	[esp+42Ch+var_41C], edx
		jl	short loc_1000535D
		mov	eax, edi
		sub	eax, ebp
		cmp	eax, ebx
		jb	short loc_100052DE

loc_1000535D:				; CODE XREF: __write_lk+103j
					; __write_lk+1C4j
		mov	esi, [esp+42Ch+var_418]

loc_10005361:				; CODE XREF: __write_lk+88j
					; __write_lk+1F5j ...
		mov	eax, [esp+42Ch+var_41C]
		test	eax, eax
		jnz	loc_100053F9
		mov	eax, [esp+42Ch+var_414]
		test	eax, eax
		jz	short loc_100053B5
		cmp	eax, 5
		jnz	short loc_1000539E
		call	__errno
		mov	dword ptr [eax], 9
		call	___doserrno
		mov	dword ptr [eax], 5
		or	eax, 0FFFFFFFFh
		pop	edi
		pop	esi
		pop	ebp
		pop	ebx
		add	esp, 41Ch
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_1000539E:				; CODE XREF: __write_lk+128j
		push	eax
		call	__dosmaperr
		add	esp, 4
		or	eax, 0FFFFFFFFh
		pop	edi
		pop	esi
		pop	ebp
		pop	ebx
		add	esp, 41Ch
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_100053B5:				; CODE XREF: __write_lk+123j
		mov	ecx, [esp+42Ch+var_408]
		mov	edx, [ecx]
		test	byte ptr [esi+edx+4], 40h
		jz	short loc_100053D5
		cmp	byte ptr [ebp+0], 1Ah
		jnz	short loc_100053D5
		xor	eax, eax
		pop	edi
		pop	esi
		pop	ebp
		pop	ebx
		add	esp, 41Ch
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_100053D5:				; CODE XREF: __write_lk+170j
					; __write_lk+176j
		call	__errno
		mov	dword ptr [eax], 1Ch
		call	___doserrno
		mov	dword ptr [eax], 0
		or	eax, 0FFFFFFFFh
		pop	edi
		pop	esi
		pop	ebp
		pop	ebx
		add	esp, 41Ch
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_100053F9:				; CODE XREF: __write_lk+117j
		mov	ecx, [esp+42Ch+var_40C]
		pop	edi
		pop	esi
		pop	ebp
		sub	eax, ecx
		pop	ebx
		add	esp, 41Ch
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_1000540A:				; CODE XREF: __write_lk+EDj
		call	ds:GetLastError
		mov	[esp+42Ch+var_414], eax
		jmp	loc_1000535D
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10005419:				; CODE XREF: __write_lk+6Fj
		mov	edx, [eax]
		lea	ecx, [esp+42Ch+var_410]
		push	ebp
		mov	ebp, [esp+430h+arg_4]
		push	ecx
		push	ebx
		push	ebp
		push	edx
		call	ds:WriteFile
		test	eax, eax
		jz	short loc_1000544A
		mov	eax, [esp+42Ch+var_410]
		mov	[esp+42Ch+var_414], 0
		mov	[esp+42Ch+var_41C], eax
		jmp	loc_10005361
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_1000544A:				; CODE XREF: __write_lk+1E3j
		call	ds:GetLastError
		mov	[esp+42Ch+var_414], eax
		jmp	loc_10005361
__write_lk	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 8

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

__getbuf	proc near		; CODE XREF: __filbuf+35p

arg_0		= dword	ptr  4

		mov	eax, dword_10009EC4
		push	1000h
		inc	eax
		mov	dword_10009EC4,	eax
		call	_malloc
		mov	ecx, [esp+4+arg_0]
		add	esp, 4
		test	eax, eax
		mov	[ecx+8], eax
		mov	eax, [ecx+0Ch]
		jz	short loc_1000549F
		mov	edx, [ecx+8]
		or	al, 8
		mov	[ecx+0Ch], eax
		mov	dword ptr [ecx+18h], 1000h
		mov	[ecx], edx
		mov	dword ptr [ecx+4], 0
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_1000549F:				; CODE XREF: __getbuf+24j
		or	al, 4
		mov	dword ptr [ecx+18h], 2
		mov	[ecx+0Ch], eax
		lea	eax, [ecx+14h]
		mov	edx, eax
		mov	[ecx+8], eax
		mov	[ecx], edx
		mov	dword ptr [ecx+4], 0
		retn	
__getbuf	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 4

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

__lseek_lk	proc near		; CODE XREF: __read_lk+1C5p
					; __write_lk+5Fp ...

arg_0		= dword	ptr  8
arg_4		= dword	ptr  0Ch
arg_8		= dword	ptr  10h

		push	esi
		mov	esi, [esp+arg_0]
		push	edi
		push	esi
		call	__get_osfhandle
		add	esp, 4
		cmp	eax, 0FFFFFFFFh
		jnz	short loc_100054E5
		call	__errno
		mov	dword ptr [eax], 9
		or	eax, 0FFFFFFFFh
		pop	edi
		pop	esi
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_100054E5:				; CODE XREF: __lseek_lk+12j
		mov	ecx, [esp+4+arg_8]
		mov	edx, [esp+4+arg_4]
		push	ecx
		push	0
		push	edx
		push	eax
		call	ds:SetFilePointer
		mov	edi, eax
		cmp	edi, 0FFFFFFFFh
		jnz	short loc_10005507
		call	ds:GetLastError
		jmp	short loc_10005509
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10005507:				; CODE XREF: __lseek_lk+3Dj
		xor	eax, eax

loc_10005509:				; CODE XREF: __lseek_lk+45j
		test	eax, eax
		jz	short loc_1000551C
		push	eax
		call	__dosmaperr
		add	esp, 4
		or	eax, 0FFFFFFFFh
		pop	edi
		pop	esi
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_1000551C:				; CODE XREF: __lseek_lk+4Bj
		mov	eax, esi
		and	esi, 1Fh
		sar	eax, 5
		lea	ecx, [esi+esi*8]
		mov	edx, dword_1000AF20[eax*4]
		lea	eax, [edx+ecx*4+4]
		mov	cl, [edx+ecx*4+4]
		and	cl, 0FDh
		mov	[eax], cl
		mov	eax, edi
		pop	edi
		pop	esi
		retn	
__lseek_lk	endp


; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

__sopen		proc near		; CODE XREF: __openfile+111p

var_11		= byte ptr -11h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  4
arg_4		= dword	ptr  8
arg_8		= dword	ptr  0Ch
arg_C		= dword	ptr  10h

		sub	esp, 14h
		mov	ecx, [esp+14h+arg_4]
		push	ebx
		push	ebp
		push	esi
		mov	dl, 80h
		xor	esi, esi
		test	dl, cl
		push	edi
		mov	[esp+24h+var_C], 0Ch
		mov	[esp+24h+var_8], esi
		jz	short loc_1000556A
		mov	[esp+24h+var_4], esi
		mov	[esp+24h+var_11], 10h
		jmp	short loc_10005577
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_1000556A:				; CODE XREF: __sopen+1Dj
		mov	[esp+24h+var_4], 1
		mov	[esp+24h+var_11], 0

loc_10005577:				; CODE XREF: __sopen+28j
		test	ch, 80h
		jnz	short loc_10005591
		test	ch, 40h
		jnz	short loc_1000558D
		cmp	dword_10009EF8,	8000h
		jz	short loc_10005591

loc_1000558D:				; CODE XREF: __sopen+3Fj
		or	[esp+24h+var_11], dl

loc_10005591:				; CODE XREF: __sopen+3Aj __sopen+4Bj
		mov	eax, ecx
		and	eax, 3
		sub	eax, esi
		jz	short loc_100055B8
		dec	eax
		jz	short loc_100055AE
		dec	eax
		jnz	loc_10005874
		mov	[esp+24h+var_10], 0C0000000h
		jmp	short loc_100055C0
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_100055AE:				; CODE XREF: __sopen+5Bj
		mov	[esp+24h+var_10], 40000000h
		jmp	short loc_100055C0
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_100055B8:				; CODE XREF: __sopen+58j
		mov	[esp+24h+var_10], 80000000h

loc_100055C0:				; CODE XREF: __sopen+6Cj __sopen+76j
		mov	eax, [esp+24h+arg_8]
		add	eax, 0FFFFFFF0h
		cmp	eax, 30h
		ja	loc_10005874
		xor	ebx, ebx
		mov	bl, ds:byte_100058A8[eax]
		jmp	ds:off_10005894[ebx*4]
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_100055DF:				; DATA XREF: .text:10005894o
		xor	ebx, ebx
		jmp	short loc_100055F6
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_100055E3:				; DATA XREF: .text:10005898o
		mov	ebx, 1
		jmp	short loc_100055F6
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_100055EA:				; DATA XREF: .text:1000589Co
		mov	ebx, 2
		jmp	short loc_100055F6
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_100055F1:				; DATA XREF: .text:100058A0o
		mov	ebx, 3

loc_100055F6:				; CODE XREF: __sopen+A1j __sopen+A8j ...
		mov	eax, ecx
		and	eax, 700h
		cmp	eax, 100h
		jg	short loc_10005616
		jz	short loc_1000560F
		cmp	eax, esi
		jz	short loc_10005646
		jmp	loc_10005874
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_1000560F:				; CODE XREF: __sopen+C4j
		mov	ebp, 4
		jmp	short loc_1000566B
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10005616:				; CODE XREF: __sopen+C2j
		cmp	eax, 300h
		jg	short loc_10005632
		jz	short loc_1000562B
		cmp	eax, 200h
		jz	short loc_10005666
		jmp	loc_10005874
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_1000562B:				; CODE XREF: __sopen+DDj
		mov	ebp, 2
		jmp	short loc_1000566B
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10005632:				; CODE XREF: __sopen+DBj
		cmp	eax, 500h
		jg	short loc_1000564D
		jz	short loc_1000565F
		cmp	eax, 400h
		jnz	loc_10005874

loc_10005646:				; CODE XREF: __sopen+C8j
		mov	ebp, 3
		jmp	short loc_1000566B
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_1000564D:				; CODE XREF: __sopen+F7j
		cmp	eax, 600h
		jz	short loc_10005666
		cmp	eax, 700h
		jnz	loc_10005874

loc_1000565F:				; CODE XREF: __sopen+F9j
		mov	ebp, 1
		jmp	short loc_1000566B
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10005666:				; CODE XREF: __sopen+E4j __sopen+112j
		mov	ebp, 5

loc_1000566B:				; CODE XREF: __sopen+D4j __sopen+F0j ...
		test	ch, 1
		mov	edi, 80h
		jz	short loc_1000568C
		mov	esi, dword_10009C4C
		mov	eax, [esp+24h+arg_C]
		not	esi
		and	eax, esi
		test	dl, al
		jnz	short loc_1000568C
		mov	edi, 1

loc_1000568C:				; CODE XREF: __sopen+133j __sopen+145j
		test	cl, 40h
		jz	short loc_100056A4
		mov	eax, [esp+24h+var_10]
		or	edi, 4000000h
		or	eax, 10000h
		mov	[esp+24h+var_10], eax

loc_100056A4:				; CODE XREF: __sopen+14Fj
		test	ch, 10h
		jz	short loc_100056AF
		or	edi, 100h

loc_100056AF:				; CODE XREF: __sopen+167j
		test	cl, 20h
		jz	short loc_100056BC
		or	edi, 8000000h
		jmp	short loc_100056C7
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_100056BC:				; CODE XREF: __sopen+172j
		test	cl, 10h
		jz	short loc_100056C7
		or	edi, 10000000h

loc_100056C7:				; CODE XREF: __sopen+17Aj __sopen+17Fj
		call	__alloc_osfhnd
		mov	esi, eax
		cmp	esi, 0FFFFFFFFh
		jnz	short loc_100056F3
		call	__errno
		mov	dword ptr [eax], 18h
		call	___doserrno
		mov	dword ptr [eax], 0
		or	eax, esi
		pop	edi
		pop	esi
		pop	ebp
		pop	ebx
		add	esp, 14h
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_100056F3:				; CODE XREF: __sopen+191j
		mov	edx, [esp+24h+var_10]
		mov	eax, [esp+24h+arg_0]
		push	0
		push	edi
		lea	ecx, [esp+2Ch+var_C]
		push	ebp
		push	ecx
		push	ebx
		push	edx
		push	eax
		call	ds:CreateFileA
		mov	edi, eax
		cmp	edi, 0FFFFFFFFh
		jz	short loc_10005726
		push	edi
		call	ds:GetFileType
		test	eax, eax
		jnz	short loc_10005749
		push	edi
		call	ds:CloseHandle

loc_10005726:				; CODE XREF: __sopen+1D2j
		call	ds:GetLastError
		push	eax
		call	__dosmaperr
		add	esp, 4
		push	esi
		call	__unlock_fhandle
		add	esp, 4
		or	eax, 0FFFFFFFFh
		pop	edi
		pop	esi
		pop	ebp
		pop	ebx
		add	esp, 14h
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10005749:				; CODE XREF: __sopen+1DDj
		cmp	eax, 2
		jnz	short loc_10005756
		mov	al, [esp+24h+var_11]
		or	al, 40h
		jmp	short loc_10005761
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10005756:				; CODE XREF: __sopen+20Cj
		cmp	eax, 3
		jnz	short loc_10005765
		mov	al, [esp+24h+var_11]
		or	al, 8

loc_10005761:				; CODE XREF: __sopen+214j
		mov	[esp+24h+var_11], al

loc_10005765:				; CODE XREF: __sopen+219j
		push	edi
		push	esi
		call	__set_osfhnd
		mov	bl, [esp+2Ch+var_11]
		mov	eax, esi
		mov	ecx, esi
		or	bl, 1
		and	eax, 1Fh
		mov	[esp+2Ch+var_11], bl
		sar	ecx, 5
		lea	edi, [eax+eax*8]
		mov	al, [esp+2Ch+var_11]
		mov	edx, dword_1000AF20[ecx*4]
		lea	ebx, dword_1000AF20[ecx*4]
		mov	cl, al
		add	esp, 8
		shl	edi, 2
		and	cl, 48h
		mov	[edi+edx+4], al
		mov	byte ptr [esp+24h+arg_0], cl
		jnz	loc_10005843
		test	al, 80h
		jz	loc_10005843
		test	byte ptr [esp+24h+arg_4], 2
		jz	loc_10005843
		push	2
		push	0FFFFFFFFh
		push	esi
		call	__lseek_lk
		mov	ebp, eax
		add	esp, 0Ch
		cmp	ebp, 0FFFFFFFFh
		jnz	short loc_100057E5
		call	___doserrno
		cmp	dword ptr [eax], 83h
		jz	short loc_10005843
		jmp	short loc_10005826
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_100057E5:				; CODE XREF: __sopen+294j
		lea	eax, [esp+24h+arg_8]
		push	1
		push	eax
		push	esi
		mov	byte ptr [esp+30h+arg_8], 0
		call	__read_lk
		add	esp, 0Ch
		test	eax, eax
		jnz	short loc_10005814
		cmp	byte ptr [esp+24h+arg_8], 1Ah
		jnz	short loc_10005814
		push	ebp
		push	esi
		call	__chsize_lk
		add	esp, 8
		cmp	eax, 0FFFFFFFFh
		jz	short loc_10005826

loc_10005814:				; CODE XREF: __sopen+2BCj __sopen+2C3j
		push	0
		push	0
		push	esi
		call	__lseek_lk
		add	esp, 0Ch
		cmp	eax, 0FFFFFFFFh
		jnz	short loc_10005843

loc_10005826:				; CODE XREF: __sopen+2A3j __sopen+2D2j
		push	esi
		call	__close
		add	esp, 4
		push	esi
		call	__unlock_fhandle
		add	esp, 4
		or	eax, 0FFFFFFFFh
		pop	edi
		pop	esi
		pop	ebp
		pop	ebx
		add	esp, 14h
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10005843:				; CODE XREF: __sopen+269j __sopen+271j ...
		mov	al, byte ptr [esp+24h+arg_0]
		test	al, al
		jnz	short loc_10005861
		test	byte ptr [esp+24h+arg_4], 8
		jz	short loc_10005861
		mov	ecx, [ebx]
		lea	eax, [edi+ecx+4]
		mov	cl, [edi+ecx+4]
		or	cl, 20h
		mov	[eax], cl

loc_10005861:				; CODE XREF: __sopen+309j __sopen+310j
		push	esi
		call	__unlock_fhandle
		add	esp, 4
		mov	eax, esi
		pop	edi
		pop	esi
		pop	ebp
		pop	ebx
		add	esp, 14h
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10005874:				; CODE XREF: __sopen+5Ej __sopen+8Aj ...
		call	__errno
		mov	dword ptr [eax], 16h
		call	___doserrno
		mov	[eax], esi
		pop	edi
		pop	esi
		pop	ebp
		or	eax, 0FFFFFFFFh
		pop	ebx
		add	esp, 14h
		retn	
__sopen		endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 4
off_10005894	dd offset loc_100055DF	; DATA XREF: __sopen+98r
		dd offset loc_100055E3
		dd offset loc_100055EA
		dd offset loc_100055F1
		dd offset loc_10005874
byte_100058A8	db 0, 0Fh dup(4), 1, 0Fh dup(4)	; DATA XREF: __sopen+92r
		db 2, 0Fh dup(4), 3, 7 dup(90h)

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

_calloc		proc near		; CODE XREF: __mtinit+1Ap __getptd+20p ...

arg_0		= dword	ptr  8
arg_4		= dword	ptr  0Ch

		push	ebx
		mov	ebx, [esp+arg_4]
		imul	ebx, [esp+arg_0]
		push	ebp
		push	esi
		cmp	ebx, 0FFFFFFE0h
		push	edi
		ja	short loc_10005903
		test	ebx, ebx
		jbe	short loc_100058FE
		add	ebx, 0Fh
		and	ebx, 0FFFFFFF0h
		jmp	short loc_10005903
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_100058FE:				; CODE XREF: _calloc+14j
		mov	ebx, 10h

loc_10005903:				; CODE XREF: _calloc+10j _calloc+1Cj
		mov	ebp, ds:HeapAlloc

loc_10005909:				; CODE XREF: _calloc+9Dj
		xor	esi, esi
		cmp	ebx, 0FFFFFFE0h
		ja	short loc_10005965
		cmp	ebx, dword_10009564
		ja	short loc_10005954
		push	9
		call	__lock
		mov	eax, ebx
		add	esp, 4
		shr	eax, 4
		push	eax
		call	___sbh_alloc_block
		add	esp, 4
		mov	esi, eax
		push	9
		call	__unlock
		add	esp, 4
		test	esi, esi
		jz	short loc_10005958
		mov	ecx, ebx
		xor	eax, eax
		mov	edx, ecx
		mov	edi, esi
		shr	ecx, 2
		repe stosd
		mov	ecx, edx
		and	ecx, 3
		repe stosb

loc_10005954:				; CODE XREF: _calloc+36j
		test	esi, esi
		jnz	short loc_10005984

loc_10005958:				; CODE XREF: _calloc+5Ej
		mov	eax, dword_1000B030
		push	ebx
		push	8
		push	eax
		call	ebp
		mov	esi, eax

loc_10005965:				; CODE XREF: _calloc+2Ej
		test	esi, esi
		jnz	short loc_10005984
		mov	eax, dword_10009C44
		test	eax, eax
		jz	short loc_10005984
		push	ebx
		call	__callnewh
		add	esp, 4
		test	eax, eax
		jnz	short loc_10005909
		pop	edi
		pop	esi
		pop	ebp
		pop	ebx
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10005984:				; CODE XREF: _calloc+76j _calloc+87j ...
		mov	eax, esi
		pop	edi
		pop	esi
		pop	ebp
		pop	ebx
		retn	
_calloc		endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 8

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

___crtMessageBoxA proc near		; CODE XREF: __NMSG_WRITE+17Ap

var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h

		mov	eax, dword_10009EEC
		push	ebx
		xor	ebx, ebx
		push	esi
		test	eax, eax
		push	edi
		jnz	short loc_100059E0
		push	offset aUser32_dll
		call	ds:LoadLibraryA
		mov	esi, eax
		test	esi, esi
		jz	short loc_10005A19
		mov	edi, ds:GetProcAddress
		push	offset aMessageboxa
		push	esi
		call	edi
		test	eax, eax
		mov	dword_10009EEC,	eax
		jz	short loc_10005A19
		push	offset aGetactivewindo
		push	esi
		call	edi
		push	offset aGetlastactivep
		push	esi
		mov	dword_10009EF0,	eax
		call	edi
		mov	dword_10009EF4,	eax

loc_100059E0:				; CODE XREF: ___crtMessageBoxA+Cj
		mov	eax, dword_10009EF0
		test	eax, eax
		jz	short loc_100059ED
		call	eax
		mov	ebx, eax

loc_100059ED:				; CODE XREF: ___crtMessageBoxA+57j
		test	ebx, ebx
		jz	short loc_100059FF
		mov	eax, dword_10009EF4
		test	eax, eax
		jz	short loc_100059FF
		push	ebx
		call	eax
		mov	ebx, eax

loc_100059FF:				; CODE XREF: ___crtMessageBoxA+5Fj
					; ___crtMessageBoxA+68j
		mov	eax, [esp+28h+var_10]
		mov	ecx, [esp+28h+var_14]
		mov	edx, [esp+28h+var_18]
		push	eax
		push	ecx
		push	edx
		push	ebx
		call	dword_10009EEC
		pop	edi
		pop	esi
		pop	ebx
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10005A19:				; CODE XREF: ___crtMessageBoxA+1Dj
					; ___crtMessageBoxA+34j
		pop	edi
		pop	esi
		xor	eax, eax
		pop	ebx
		retn	
___crtMessageBoxA endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 4

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

_strncpy	proc near		; CODE XREF: __NMSG_WRITE+CCp

arg_0		= dword	ptr  4
arg_4		= dword	ptr  8
arg_8		= dword	ptr  0Ch
arg_C		= dword	ptr  10h

		mov	ecx, [esp+arg_8]
		push	edi
		test	ecx, ecx
		jz	short loc_10005AA3
		push	esi
		push	ebx
		mov	ebx, ecx
		mov	esi, [esp+0Ch+arg_4]
		test	esi, 3
		mov	edi, [esp+0Ch+arg_0]
		jnz	short loc_10005A44
		shr	ecx, 2
		jnz	short loc_10005AB1
		jmp	short loc_10005A65
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10005A44:				; CODE XREF: _strncpy+1Bj _strncpy+37j
		mov	al, [esi]
		inc	esi
		mov	[edi], al
		inc	edi
		dec	ecx
		jz	short loc_10005A72
		test	al, al
		jz	short loc_10005A7A
		test	esi, 3
		jnz	short loc_10005A44
		mov	ebx, ecx
		shr	ecx, 2
		jnz	short loc_10005AB1

loc_10005A60:				; CODE XREF: _strncpy+8Fj
		and	ebx, 3
		jz	short loc_10005A72

loc_10005A65:				; CODE XREF: _strncpy+22j _strncpy+50j
		mov	al, [esi]
		inc	esi
		mov	[edi], al
		inc	edi
		test	al, al
		jz	short loc_10005A9E
		dec	ebx
		jnz	short loc_10005A65

loc_10005A72:				; CODE XREF: _strncpy+2Bj _strncpy+43j
		mov	eax, [esp+0Ch+arg_0]
		pop	ebx
		pop	esi
		pop	edi
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10005A7A:				; CODE XREF: _strncpy+2Fj
		test	edi, 3
		jz	short loc_10005A94

loc_10005A82:				; CODE XREF: _strncpy+72j
		mov	[edi], al
		inc	edi
		dec	ecx
		jz	loc_10005B16
		test	edi, 3
		jnz	short loc_10005A82

loc_10005A94:				; CODE XREF: _strncpy+60j
		mov	ebx, ecx
		shr	ecx, 2
		jnz	short loc_10005B07

loc_10005A9B:				; CODE XREF: _strncpy+7Fj _strncpy+F4j
		mov	[edi], al
		inc	edi

loc_10005A9E:				; CODE XREF: _strncpy+4Dj
		dec	ebx
		jnz	short loc_10005A9B
		pop	ebx
		pop	esi

loc_10005AA3:				; CODE XREF: _strncpy+7j
		mov	eax, [esp+4+arg_0]
		pop	edi
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10005AA9:				; CODE XREF: _strncpy+A9j _strncpy+C1j
		mov	[edi], edx
		add	edi, 4
		dec	ecx
		jz	short loc_10005A60

loc_10005AB1:				; CODE XREF: _strncpy+20j _strncpy+3Ej
		mov	edx, 7EFEFEFFh
		mov	eax, [esi]
		add	edx, eax
		xor	eax, 0FFFFFFFFh
		xor	eax, edx
		mov	edx, [esi]
		add	esi, 4
		test	eax, 81010100h
		jz	short loc_10005AA9
		test	dl, dl
		jz	short loc_10005AFB
		test	dh, dh
		jz	short loc_10005AF1
		test	edx, 0FF0000h
		jz	short loc_10005AE7
		test	edx, 0FF000000h
		jnz	short loc_10005AA9
		mov	[edi], edx
		jmp	short loc_10005AFF
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10005AE7:				; CODE XREF: _strncpy+B9j
		and	edx, 0FFFFh
		mov	[edi], edx
		jmp	short loc_10005AFF
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10005AF1:				; CODE XREF: _strncpy+B1j
		and	edx, 0FFh
		mov	[edi], edx
		jmp	short loc_10005AFF
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10005AFB:				; CODE XREF: _strncpy+ADj
		xor	edx, edx
		mov	[edi], edx

loc_10005AFF:				; CODE XREF: _strncpy+C5j _strncpy+CFj ...
		add	edi, 4
		xor	eax, eax
		dec	ecx
		jz	short loc_10005B11

loc_10005B07:				; CODE XREF: _strncpy+79j
		xor	eax, eax

loc_10005B09:				; CODE XREF: _strncpy+EFj
		mov	[edi], eax
		add	edi, 4
		dec	ecx
		jnz	short loc_10005B09

loc_10005B11:				; CODE XREF: _strncpy+E5j
		and	ebx, 3
		jnz	short loc_10005A9B

loc_10005B16:				; CODE XREF: _strncpy+66j
		mov	eax, [esp+arg_C]
		pop	ebx
		pop	esi
		pop	edi
		retn	
_strncpy	endp ; sp =  0Ch

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 4

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

__fcloseall	proc near		; CODE XREF: ___endstdio+Ej
		push	ebp
		push	esi
		push	2
		xor	ebp, ebp
		call	__lock
		mov	eax, dword_1000AF00
		mov	esi, 3
		add	esp, 4
		cmp	eax, esi
		jle	short loc_10005BA4
		push	edi
		mov	edi, ds:DeleteCriticalSection
		push	ebx
		mov	bl, 83h

loc_10005B46:				; CODE XREF: __fcloseall+80j
		mov	eax, dword_10009EFC
		mov	eax, [eax+esi*4]
		test	eax, eax
		jz	short loc_10005B98
		test	[eax+0Ch], bl
		jz	short loc_10005B66
		push	eax
		call	_fclose
		add	esp, 4
		cmp	eax, 0FFFFFFFFh
		jz	short loc_10005B66
		inc	ebp

loc_10005B66:				; CODE XREF: __fcloseall+35j
					; __fcloseall+43j
		cmp	esi, 14h
		jl	short loc_10005B98
		mov	ecx, dword_10009EFC
		mov	edx, [ecx+esi*4]
		add	edx, 20h
		push	edx
		call	edi
		mov	eax, dword_10009EFC
		mov	ecx, [eax+esi*4]
		push	ecx
		call	_free
		mov	edx, dword_10009EFC
		add	esp, 4
		mov	dword ptr [edx+esi*4], 0

loc_10005B98:				; CODE XREF: __fcloseall+30j
					; __fcloseall+49j
		mov	eax, dword_1000AF00
		inc	esi
		cmp	esi, eax
		jl	short loc_10005B46
		pop	ebx
		pop	edi

loc_10005BA4:				; CODE XREF: __fcloseall+1Aj
		push	2
		call	__unlock
		add	esp, 4
		mov	eax, ebp
		pop	esi
		pop	ebp
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h
__fcloseall	endp ; sp = -4


; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

__chsize_lk	proc near		; CODE XREF: __sopen+2C7p

arg_0		= byte ptr  4
arg_1004	= dword	ptr  1008h
arg_1008	= dword	ptr  100Ch

		mov	eax, 1004h
		call	__alloca_probe
		push	ebx
		mov	ebx, [esp+4+arg_1004]
		push	ebp
		push	esi
		push	edi
		xor	ebp, ebp
		push	1
		push	ebp
		push	ebx
		call	__lseek_lk
		mov	edi, eax
		add	esp, 0Ch
		cmp	edi, 0FFFFFFFFh
		mov	[esp+10h], edi
		jz	loc_10005D00
		push	2
		push	ebp
		push	ebx
		call	__lseek_lk
		add	esp, 0Ch
		cmp	eax, 0FFFFFFFFh
		jz	loc_10005D00
		mov	ecx, [esp+10h+arg_1008]
		mov	esi, ecx
		sub	esi, eax
		test	esi, esi
		jle	loc_10005CA1
		mov	ecx, 400h
		xor	eax, eax
		lea	edi, [esp+10h+arg_0]
		push	8000h
		repe stosd
		push	ebx
		call	__setmode_lk
		add	esp, 8
		mov	edi, eax

loc_10005C37:				; CODE XREF: __chsize_lk+A0j
		cmp	esi, 1000h
		mov	eax, 1000h
		jge	short loc_10005C46
		mov	eax, esi

loc_10005C46:				; CODE XREF: __chsize_lk+82j
		push	eax
		lea	eax, [esp+14h+arg_0]
		push	eax
		push	ebx
		call	__write_lk
		add	esp, 0Ch
		cmp	eax, 0FFFFFFFFh
		jz	short loc_10005C62
		sub	esi, eax
		test	esi, esi
		jle	short loc_10005C7A
		jmp	short loc_10005C37
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10005C62:				; CODE XREF: __chsize_lk+98j
		call	___doserrno
		cmp	dword ptr [eax], 5
		jnz	short loc_10005C77
		call	__errno
		mov	dword ptr [eax], 0Dh

loc_10005C77:				; CODE XREF: __chsize_lk+AAj
		or	ebp, 0FFFFFFFFh

loc_10005C7A:				; CODE XREF: __chsize_lk+9Ej
		push	edi
		push	ebx
		call	__setmode_lk
		mov	edi, [esp+18h]
		add	esp, 8
		push	0
		push	edi
		push	ebx
		call	__lseek_lk
		add	esp, 0Ch
		mov	eax, ebp
		pop	edi
		pop	esi
		pop	ebp
		pop	ebx
		add	esp, 1004h
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10005CA1:				; CODE XREF: __chsize_lk+54j
		jge	short loc_10005CE7
		push	0
		push	ecx
		push	ebx
		call	__lseek_lk
		add	esp, 0Ch
		push	ebx
		call	__get_osfhandle
		add	esp, 4
		push	eax
		call	ds:SetEndOfFile
		mov	ebp, eax
		neg	ebp
		sbb	ebp, ebp
		neg	ebp
		dec	ebp
		cmp	ebp, 0FFFFFFFFh
		jnz	short loc_10005CE7
		call	__errno
		mov	dword ptr [eax], 0Dh
		call	ds:GetLastError
		mov	esi, eax
		call	___doserrno
		mov	[eax], esi

loc_10005CE7:				; CODE XREF: __chsize_lk+E1j
					; __chsize_lk+10Bj
		push	0
		push	edi
		push	ebx
		call	__lseek_lk
		add	esp, 0Ch
		mov	eax, ebp
		pop	edi
		pop	esi
		pop	ebp
		pop	ebx
		add	esp, 1004h
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10005D00:				; CODE XREF: __chsize_lk+2Cj
					; __chsize_lk+41j
		pop	edi
		pop	esi
		pop	ebp
		or	eax, 0FFFFFFFFh
		pop	ebx
		add	esp, 1004h
		retn	
__chsize_lk	endp ; sp =  1004h

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 4

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

__setmode_lk	proc near		; CODE XREF: __chsize_lk+6Dp
					; __chsize_lk+BCp

arg_0		= dword	ptr  4
arg_4		= dword	ptr  8

		mov	eax, [esp+arg_0]
		push	esi
		mov	ecx, eax
		and	eax, 1Fh
		sar	ecx, 5
		lea	edx, [eax+eax*8]
		mov	esi, [esp+4+arg_4]
		mov	eax, dword_1000AF20[ecx*4]
		mov	cl, [eax+edx*4+4]
		lea	edx, [eax+edx*4+4]
		mov	al, cl
		and	eax, 80h
		cmp	esi, 8000h
		jnz	short loc_10005D47
		and	cl, 7Fh
		jmp	short loc_10005D52
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10005D47:				; CODE XREF: __setmode_lk+30j
		cmp	esi, 4000h
		jnz	short loc_10005D64
		or	cl, 80h

loc_10005D52:				; CODE XREF: __setmode_lk+35j
		neg	eax
		sbb	eax, eax
		mov	[edx], cl
		and	eax, 0FFFFC000h
		add	eax, 8000h
		pop	esi
		retn	
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

loc_10005D64:				; CODE XREF: __setmode_lk+3Dj
		call	__errno
		mov	dword ptr [eax], 16h
		or	eax, 0FFFFFFFFh
		pop	esi
		retn	
__setmode_lk	endp

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 10h

; ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

;		S u b r	o u t i	n e
; Attributes: library function

__alloca_probe	proc near		; CODE XREF: __chsize_lk+5p

arg_0		= byte ptr  8

		push	ecx
		cmp	eax, 1000h
		lea	ecx, [esp+arg_0]
		jb	short loc_10005DA0

loc_10005D8C:				; CODE XREF: __alloca_probe+1Ej
		sub	ecx, 1000h
		sub	eax, 1000h
		test	[ecx], eax
		cmp	eax, 1000h
		jnb	short loc_10005D8C

loc_10005DA0:				; CODE XREF: __alloca_probe+Aj
		sub	ecx, eax
		mov	eax, esp
		test	[ecx], eax
		mov	esp, ecx
		mov	ecx, [eax]
		mov	eax, [eax+4]
		push	eax
		retn	
__alloca_probe	endp ; sp = -8

; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
		align 80h
_text		ends

; Section 2. (virtual address 00006000)
; Virtual size			: 00000803 (   2051.)
; Section size in file		: 00000A00 (   2560.)
; Offset to raw	data for section: 00005200
; Flags	40000040: Data Readable
; Alignment	: 16 bytes by default
; ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

; Segment type:	Pure data
_rdata		segment	para public 'DATA' use32
		assume cs:_rdata
		;org 10006000h
unk_10006000	db    3	;		; DATA XREF: Rex_MIDI_init+18o
		db  3Dh	; =
		db 0D4h	; Ô
		db    7	;  
		db  23h	; #
		db  65h	; e
		db 0D2h	; Ò
		db  11h	;  
		db  87h	; ‡
		db  1Dh	;  
		db    0	;  
		db  60h	; `
		db    8	;  
		db  93h	; “
		db 0B1h	; ±
		db 0BDh	; ½
unk_10006010	db 0A2h	; ¢		; DATA XREF: Rex_MIDI_load+DBo
		db  29h	; )
		db  60h	; `
		db 0F9h	; ù
		db  82h	; ‚
		db  42h	; B
		db 0D2h	; Ò
		db  11h	;  
		db  87h	; ‡
		db  17h	;  
		db    0	;  
		db  60h	; `
		db    8	;  
		db  93h	; “
		db 0B1h	; ±
		db 0BDh	; ½
unk_10006020	db 0A2h	; ¢		; DATA XREF: Rex_MIDI_init+5Co
		db 0ACh	; ¬
		db 0FAh	; ú
		db  2Fh	; /
		db 0CAh	; Ê
		db  5Dh	; ]
		db 0D2h	; Ò
		db  11h	;  
		db 0AFh	; ¯
		db 0A6h	; ¦
		db    0	;  
		db 0AAh	; ª
		db    0	;  
		db  24h	; $
		db 0D8h	; Ø
		db 0B6h	; ¶
unk_10006030	db  75h	; u		; DATA XREF: Rex_MIDI_load+FDo
		db  10h	;  
		db  62h	; b
		db    6	;  
		db  2Eh	; .
		db 0E9h	; é
		db 0D1h	; Ñ
		db  11h	;  
		db 0A8h	; ¨
		db 0C5h	; Å
		db    0	;  
		db 0C0h	; À
		db  4Fh	; O
		db 0A3h	; £
		db  72h	; r
		db  6Eh	; n
aIMI		db '¨(¬Ò›³Ñ'            ; DATA XREF: Rex_MIDI_exit+2Fo
		db  11h	;  
		db  87h	; ‡
		db    4	;  
		db    0	;  
		db  60h	; `
		db    8	;  
		db  93h	; “
		db 0B1h	; ±
		db 0BDh	; ½
aZMI		db '§(¬Ò›³Ñ'            ; DATA XREF: Rex_MIDI_load+11Eo
		db  11h	;  
		db  87h	; ‡
		db    4	;  
		db    0	;  
		db  60h	; `
		db    8	;  
		db  93h	; “
		db 0B1h	; ±
		db 0BDh	; ½
aTMI		db '’(¬Ò›³Ñ'            ; DATA XREF: Rex_MIDI_init+65o
		db  11h	;  
		db  87h	; ‡
		db    4	;  
		db    0	;  
		db  60h	; `
		db    8	;  
		db  93h	; “
		db 0B1h	; ±
		db 0BDh	; ½
dword_10006070	dd 0D2AC2882h		; DATA XREF: Rex_MIDI_load+89r
dword_10006074	dd 11D1B39Bh		; DATA XREF: Rex_MIDI_load+7Dr
dword_10006078	dd 60000487h		; DATA XREF: Rex_MIDI_load+83r
dword_1000607C	dd 0BDB19308h		; DATA XREF: Rex_MIDI_load+A1r
aBMI		db '(¬Ò›³Ñ'            ; DATA XREF: Rex_MIDI_init+21o
		db  11h	;  
		db  87h	; ‡
		db    4	;  
		db    0	;  
		db  60h	; `
		db    8	;  
		db  93h	; “
		db 0B1h	; ±
		db 0BDh	; ½
aIstnt		db 'IsTNT',0            ; DATA XREF: __CRT_INIT@12+46o
		align 4
aKernel32_dll	db 'kernel32.dll',0     ; DATA XREF: __CRT_INIT@12+37o
		align 4
aRuntimeError	db 'runtime error ',0   ; DATA XREF: .data:10009884o
		align 4
unk_100060B8	db  0Dh	;		; DATA XREF: .data:1000987Co
		db  0Ah	;  
		db    0	;  
		db    0	;  
aTlossError	db 'TLOSS error',0Dh,0Ah,0 ; DATA XREF: .data:10009874o
		align 4
aSingError	db 'SING error',0Dh,0Ah,0 ; DATA XREF: .data:1000986Co
		align 4
aDomainError	db 'DOMAIN error',0Dh,0Ah,0 ; DATA XREF: .data:10009864o
		align 4
aR6028UnableToI	db 'R6028',0Dh,0Ah      ; DATA XREF: .data:1000985Co
		db '- unable to initialize heap',0Dh,0Ah,0
		align 4
aR6027NotEnough	db 'R6027',0Dh,0Ah      ; DATA XREF: .data:10009854o
		db '- not enough space for lowio initialization',0Dh,0Ah,0
		align 4
aR6026NotEnough	db 'R6026',0Dh,0Ah      ; DATA XREF: .data:1000984Co
		db '- not enough space for stdio initialization',0Dh,0Ah,0
		align 4
aR6025PureVirtu	db 'R6025',0Dh,0Ah      ; DATA XREF: .data:10009844o
		db '- pure virtual function call',0Dh,0Ah,0
		align 4
aR6024NotEnough	db 'R6024',0Dh,0Ah      ; DATA XREF: .data:1000983Co
		db '- not enough space for _onexit/atexit table',0Dh,0Ah,0
		align 4
aR6019UnableToO	db 'R6019',0Dh,0Ah      ; DATA XREF: .data:10009834o
		db '- unable to open console device',0Dh,0Ah,0
		align 4
aR6018Unexpecte	db 'R6018',0Dh,0Ah      ; DATA XREF: .data:1000982Co
		db '- unexpected heap error',0Dh,0Ah,0
		align 4
aR6017Unexpecte	db 'R6017',0Dh,0Ah      ; DATA XREF: .data:10009824o
		db '- unexpected multithread lock error',0Dh,0Ah,0
		align 4
aR6016NotEnough	db 'R6016',0Dh,0Ah      ; DATA XREF: .data:1000981Co
		db '- not enough space for thread data',0Dh,0Ah,0
aAbnormalProgra	db 0Dh,0Ah		; DATA XREF: .data:10009814o
		db 'abnormal program termination',0Dh,0Ah,0
		align 4
aR6009NotEnough	db 'R6009',0Dh,0Ah      ; DATA XREF: .data:1000980Co
		db '- not enough space for environment',0Dh,0Ah,0
aR6008NotEnough	db 'R6008',0Dh,0Ah      ; DATA XREF: .data:10009804o
		db '- not enough space for arguments',0Dh,0Ah,0
		align 4
aR6002FloatingP	db 'R6002',0Dh,0Ah      ; DATA XREF: .data:100097FCo
		db '- floating point not loaded',0Dh,0Ah,0
		align 4
aMicrosoftVisua	db 'Microsoft Visual C++ Runtime Library',0 ; DATA XREF: __NMSG_WRITE+128o
		align 4
unk_1000635C	db  0Ah	;		; DATA XREF: __NMSG_WRITE+11Ao
		db  0Ah	;  
		db    0	;  
		db    0	;  
aRuntimeErrorPr	db 'Runtime Error!',0Ah ; DATA XREF: __NMSG_WRITE+D9o
		db 0Ah
		db 'Program: ',0
		align 4
unk_1000637C	db  2Eh	; .		; DATA XREF: __NMSG_WRITE+C4o
		db  2Eh	; .
		db  2Eh	; .
		db    0	;  
aProgramNameUnk	db '<program name unknown>',0 ; DATA XREF: __NMSG_WRITE+7Ao
		align 4
aGetlastactivep	db 'GetLastActivePopup',0 ; DATA XREF: ___crtMessageBoxA+3Eo
		align 4
aGetactivewindo	db 'GetActiveWindow',0  ; DATA XREF: ___crtMessageBoxA+36o
aMessageboxa	db 'MessageBoxA',0      ; DATA XREF: ___crtMessageBoxA+25o
aUser32_dll	db 'user32.dll',0       ; DATA XREF: ___crtMessageBoxA+Eo
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db  3Fh	; ?
		db 0DBh	; Û
		db  90h	; 
		db  38h	; 8
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db 0A2h	; ¢
		db  65h	; e
		db    0	;  
		db    0	;  
		db    1	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db  29h	; )
		db    0	;  
		db    0	;  
		db    0	;  
		db  29h	; )
		db    0	;  
		db    0	;  
		db    0	;  
		db    8	;  
		db  64h	; d
		db    0	;  
		db    0	;  
		db 0ACh	; ¬
		db  64h	; d
		db    0	;  
		db    0	;  
		db  50h	; P
		db  65h	; e
		db    0	;  
		db    0	;  
		db 0B0h	; °
		db  20h	;  
		db    0	;  
		db    0	;  
		db  90h	; 
		db  20h	;  
		db    0	;  
		db    0	;  
		db  40h	; @
		db  1Fh	;  
		db    0	;  
		db    0	;  
		db 0D0h	; Ğ
		db  1Dh	;  
		db    0	;  
		db    0	;  
		db  70h	; p
		db  1Dh	;  
		db    0	;  
		db    0	;  
		db 0D0h	; Ğ
		db  20h	;  
		db    0	;  
		db    0	;  
		db  70h	; p
		db  20h	;  
		db    0	;  
		db    0	;  
		db  20h	;  
		db  20h	;  
		db    0	;  
		db    0	;  
		db 0E0h	; à
		db  1Dh	;  
		db    0	;  
		db    0	;  
		db 0A0h	;  
		db  1Eh	;  
		db    0	;  
		db    0	;  
		db 0F0h	; ğ
		db  1Eh	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db  1Eh	;  
		db    0	;  
		db    0	;  
		db  40h	; @
		db  20h	;  
		db    0	;  
		db    0	;  
		db 0C0h	; À
		db  1Fh	;  
		db    0	;  
		db    0	;  
		db  50h	; P
		db  20h	;  
		db    0	;  
		db    0	;  
		db  90h	; 
		db  11h	;  
		db    0	;  
		db    0	;  
		db  60h	; `
		db  11h	;  
		db    0	;  
		db    0	;  
		db  10h	;  
		db  10h	;  
		db    0	;  
		db    0	;  
		db 0E0h	; à
		db  12h	;  
		db    0	;  
		db    0	;  
		db  50h	; P
		db  12h	;  
		db    0	;  
		db    0	;  
		db 0D0h	; Ğ
		db  11h	;  
		db    0	;  
		db    0	;  
		db  20h	;  
		db  17h	;  
		db    0	;  
		db    0	;  
		db  60h	; `
		db  13h	;  
		db    0	;  
		db    0	;  
		db 0E0h	; à
		db  10h	;  
		db    0	;  
		db    0	;  
		db  90h	; 
		db  12h	;  
		db    0	;  
		db    0	;  
		db 0D0h	; Ğ
		db  1Ah	;  
		db    0	;  
		db    0	;  
		db  50h	; P
		db  1Ah	;  
		db    0	;  
		db    0	;  
		db  50h	; P
		db  1Bh	;  
		db    0	;  
		db    0	;  
		db 0C0h	; À
		db  1Ch	;  
		db    0	;  
		db    0	;  
		db 0F0h	; ğ
		db  1Ch	;  
		db    0	;  
		db    0	;  
		db  50h	; P
		db  1Dh	;  
		db    0	;  
		db    0	;  
		db 0A0h	;  
		db  1Ch	;  
		db    0	;  
		db    0	;  
		db  50h	; P
		db  14h	;  
		db    0	;  
		db    0	;  
		db  10h	;  
		db  14h	;  
		db    0	;  
		db    0	;  
		db  20h	;  
		db  13h	;  
		db    0	;  
		db    0	;  
		db  10h	;  
		db  12h	;  
		db    0	;  
		db    0	;  
		db 0A0h	;  
		db  13h	;  
		db    0	;  
		db    0	;  
		db 0E0h	; à
		db  13h	;  
		db    0	;  
		db    0	;  
		db 0C0h	; À
		db  15h	;  
		db    0	;  
		db    0	;  
		db 0A0h	;  
		db  14h	;  
		db    0	;  
		db    0	;  
		db 0D0h	; Ğ
		db  14h	;  
		db    0	;  
		db    0	;  
		db 0AAh	; ª
		db  65h	; e
		db    0	;  
		db    0	;  
		db 0B7h	; ·
		db  65h	; e
		db    0	;  
		db    0	;  
		db 0C9h	; É
		db  65h	; e
		db    0	;  
		db    0	;  
		db 0D9h	; Ù
		db  65h	; e
		db    0	;  
		db    0	;  
		db 0EFh	; ï
		db  65h	; e
		db    0	;  
		db    0	;  
		db 0FBh	; û
		db  65h	; e
		db    0	;  
		db    0	;  
		db  0Dh	;  
		db  66h	; f
		db    0	;  
		db    0	;  
		db  1Eh	;  
		db  66h	; f
		db    0	;  
		db    0	;  
		db  2Bh	; +
		db  66h	; f
		db    0	;  
		db    0	;  
		db  37h	; 7
		db  66h	; f
		db    0	;  
		db    0	;  
		db  4Eh	; N
		db  66h	; f
		db    0	;  
		db    0	;  
		db  69h	; i
		db  66h	; f
		db    0	;  
		db    0	;  
		db  7Bh	; {
		db  66h	; f
		db    0	;  
		db    0	;  
		db  89h	; ‰
		db  66h	; f
		db    0	;  
		db    0	;  
		db  97h	; —
		db  66h	; f
		db    0	;  
		db    0	;  
		db 0A3h	; £
		db  66h	; f
		db    0	;  
		db    0	;  
		db 0B7h	; ·
		db  66h	; f
		db    0	;  
		db    0	;  
		db 0C0h	; À
		db  66h	; f
		db    0	;  
		db    0	;  
		db 0CCh	; Ì
		db  66h	; f
		db    0	;  
		db    0	;  
		db 0DDh	; İ
		db  66h	; f
		db    0	;  
		db    0	;  
		db 0E8h	; è
		db  66h	; f
		db    0	;  
		db    0	;  
		db 0F8h	; ø
		db  66h	; f
		db    0	;  
		db    0	;  
		db    5	;  
		db  67h	; g
		db    0	;  
		db    0	;  
		db  13h	;  
		db  67h	; g
		db    0	;  
		db    0	;  
		db  1Ch	;  
		db  67h	; g
		db    0	;  
		db    0	;  
		db  2Ah	; *
		db  67h	; g
		db    0	;  
		db    0	;  
		db  38h	; 8
		db  67h	; g
		db    0	;  
		db    0	;  
		db  46h	; F
		db  67h	; g
		db    0	;  
		db    0	;  
		db  54h	; T
		db  67h	; g
		db    0	;  
		db    0	;  
		db  62h	; b
		db  67h	; g
		db    0	;  
		db    0	;  
		db  76h	; v
		db  67h	; g
		db    0	;  
		db    0	;  
		db  84h	; „
		db  67h	; g
		db    0	;  
		db    0	;  
		db  94h	; ”
		db  67h	; g
		db    0	;  
		db    0	;  
		db  9Dh	; 
		db  67h	; g
		db    0	;  
		db    0	;  
		db 0ACh	; ¬
		db  67h	; g
		db    0	;  
		db    0	;  
		db 0BDh	; ½
		db  67h	; g
		db    0	;  
		db    0	;  
		db 0C8h	; È
		db  67h	; g
		db    0	;  
		db    0	;  
		db 0D6h	; Ö
		db  67h	; g
		db    0	;  
		db    0	;  
		db 0DFh	; ß
		db  67h	; g
		db    0	;  
		db    0	;  
		db 0EBh	; ë
		db  67h	; g
		db    0	;  
		db    0	;  
		db 0F8h	; ø
		db  67h	; g
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    1	;  
		db    0	;  
		db    2	;  
		db    0	;  
		db    3	;  
		db    0	;  
		db    4	;  
		db    0	;  
		db    5	;  
		db    0	;  
		db    6	;  
		db    0	;  
		db    7	;  
		db    0	;  
		db    8	;  
		db    0	;  
		db    9	;  
		db    0	;  
		db  0Ah	;  
		db    0	;  
		db  0Bh	;  
		db    0	;  
		db  0Ch	;  
		db    0	;  
		db  0Dh	;  
		db    0	;  
		db  0Eh	;  
		db    0	;  
		db  0Fh	;  
		db    0	;  
		db  10h	;  
		db    0	;  
		db  11h	;  
		db    0	;  
		db  12h	;  
		db    0	;  
		db  13h	;  
		db    0	;  
		db  14h	;  
		db    0	;  
		db  15h	;  
		db    0	;  
		db  16h	;  
		db    0	;  
		db  17h	;  
		db    0	;  
		db  18h	;  
		db    0	;  
		db  19h	;  
		db    0	;  
		db  1Ah	;  
		db    0	;  
		db  1Bh	;  
		db    0	;  
		db  1Ch	;  
		db    0	;  
		db  1Dh	;  
		db    0	;  
		db  1Eh	;  
		db    0	;  
		db  1Fh	;  
		db    0	;  
		db  20h	;  
		db    0	;  
		db  21h	; !
		db    0	;  
		db  22h	; "
		db    0	;  
		db  23h	; #
		db    0	;  
		db  24h	; $
		db    0	;  
		db  25h	; %
		db    0	;  
		db  26h	; &
		db    0	;  
		db  27h	; '
		db    0	;  
		db  28h	; (
		db    0	;  
		db  52h	; R
		db  65h	; e
		db  78h	; x
		db  2Eh	; .
		db  64h	; d
		db  6Ch	; l
		db  6Ch	; l
		db    0	;  
		db  52h	; R
		db  65h	; e
		db  78h	; x
		db  5Fh	; _
		db  43h	; C
		db  44h	; D
		db  5Fh	; _
		db  63h	; c
		db  6Ch	; l
		db  6Fh	; o
		db  73h	; s
		db  65h	; e
		db    0	;  
		db  52h	; R
		db  65h	; e
		db  78h	; x
		db  5Fh	; _
		db  43h	; C
		db  44h	; D
		db  5Fh	; _
		db  63h	; c
		db  6Ch	; l
		db  6Fh	; o
		db  73h	; s
		db  65h	; e
		db  5Fh	; _
		db  64h	; d
		db  6Fh	; o
		db  6Fh	; o
		db  72h	; r
		db    0	;  
		db  52h	; R
		db  65h	; e
		db  78h	; x
		db  5Fh	; _
		db  43h	; C
		db  44h	; D
		db  5Fh	; _
		db  66h	; f
		db  66h	; f
		db  6Fh	; o
		db  72h	; r
		db  77h	; w
		db  61h	; a
		db  72h	; r
		db  64h	; d
		db    0	;  
		db  52h	; R
		db  65h	; e
		db  78h	; x
		db  5Fh	; _
		db  43h	; C
		db  44h	; D
		db  5Fh	; _
		db  67h	; g
		db  65h	; e
		db  74h	; t
		db  5Fh	; _
		db  6Eh	; n
		db  75h	; u
		db  6Dh	; m
		db  5Fh	; _
		db  74h	; t
		db  72h	; r
		db  61h	; a
		db  63h	; c
		db  6Bh	; k
		db  73h	; s
		db    0	;  
		db  52h	; R
		db  65h	; e
		db  78h	; x
		db  5Fh	; _
		db  43h	; C
		db  44h	; D
		db  5Fh	; _
		db  69h	; i
		db  6Eh	; n
		db  69h	; i
		db  74h	; t
		db    0	;  
		db  52h	; R
		db  65h	; e
		db  78h	; x
		db  5Fh	; _
		db  43h	; C
		db  44h	; D
		db  5Fh	; _
		db  69h	; i
		db  73h	; s
		db  5Fh	; _
		db  70h	; p
		db  6Ch	; l
		db  61h	; a
		db  79h	; y
		db  69h	; i
		db  6Eh	; n
		db  67h	; g
		db    0	;  
		db  52h	; R
		db  65h	; e
		db  78h	; x
		db  5Fh	; _
		db  43h	; C
		db  44h	; D
		db  5Fh	; _
		db  6Fh	; o
		db  70h	; p
		db  65h	; e
		db  6Eh	; n
		db  5Fh	; _
		db  64h	; d
		db  6Fh	; o
		db  6Fh	; o
		db  72h	; r
		db    0	;  
		db  52h	; R
		db  65h	; e
		db  78h	; x
		db  5Fh	; _
		db  43h	; C
		db  44h	; D
		db  5Fh	; _
		db  70h	; p
		db  61h	; a
		db  75h	; u
		db  73h	; s
		db  65h	; e
		db    0	;  
		db  52h	; R
		db  65h	; e
		db  78h	; x
		db  5Fh	; _
		db  43h	; C
		db  44h	; D
		db  5Fh	; _
		db  70h	; p
		db  6Ch	; l
		db  61h	; a
		db  79h	; y
		db    0	;  
		db  52h	; R
		db  65h	; e
		db  78h	; x
		db  5Fh	; _
		db  43h	; C
		db  44h	; D
		db  5Fh	; _
		db  70h	; p
		db  6Ch	; l
		db  61h	; a
		db  79h	; y
		db  5Fh	; _
		db  6Eh	; n
		db  65h	; e
		db  78h	; x
		db  74h	; t
		db  5Fh	; _
		db  74h	; t
		db  72h	; r
		db  61h	; a
		db  63h	; c
		db  6Bh	; k
		db    0	;  
		db  52h	; R
		db  65h	; e
		db  78h	; x
		db  5Fh	; _
		db  43h	; C
		db  44h	; D
		db  5Fh	; _
		db  70h	; p
		db  6Ch	; l
		db  61h	; a
		db  79h	; y
		db  5Fh	; _
		db  70h	; p
		db  72h	; r
		db  65h	; e
		db  76h	; v
		db  69h	; i
		db  6Fh	; o
		db  75h	; u
		db  73h	; s
		db  5Fh	; _
		db  74h	; t
		db  72h	; r
		db  61h	; a
		db  63h	; c
		db  6Bh	; k
		db    0	;  
		db  52h	; R
		db  65h	; e
		db  78h	; x
		db  5Fh	; _
		db  43h	; C
		db  44h	; D
		db  5Fh	; _
		db  70h	; p
		db  6Ch	; l
		db  61h	; a
		db  79h	; y
		db  5Fh	; _
		db  74h	; t
		db  72h	; r
		db  61h	; a
		db  63h	; c
		db  6Bh	; k
		db    0	;  
		db  52h	; R
		db  65h	; e
		db  78h	; x
		db  5Fh	; _
		db  43h	; C
		db  44h	; D
		db  5Fh	; _
		db  72h	; r
		db  65h	; e
		db  73h	; s
		db  75h	; u
		db  6Dh	; m
		db  65h	; e
		db    0	;  
		db  52h	; R
		db  65h	; e
		db  78h	; x
		db  5Fh	; _
		db  43h	; C
		db  44h	; D
		db  5Fh	; _
		db  72h	; r
		db  65h	; e
		db  77h	; w
		db  69h	; i
		db  6Eh	; n
		db  64h	; d
		db    0	;  
		db  52h	; R
		db  65h	; e
		db  78h	; x
		db  5Fh	; _
		db  43h	; C
		db  44h	; D
		db  5Fh	; _
		db  73h	; s
		db  74h	; t
		db  6Fh	; o
		db  70h	; p
		db    0	;  
		db  52h	; R
		db  65h	; e
		db  78h	; x
		db  5Fh	; _
		db  44h	; D
		db  75h	; u
		db  70h	; p
		db  6Ch	; l
		db  69h	; i
		db  63h	; c
		db  61h	; a
		db  74h	; t
		db  65h	; e
		db  42h	; B
		db  75h	; u
		db  66h	; f
		db  66h	; f
		db  65h	; e
		db  72h	; r
		db    0	;  
		db  52h	; R
		db  65h	; e
		db  78h	; x
		db  5Fh	; _
		db  45h	; E
		db  78h	; x
		db  69h	; i
		db  74h	; t
		db    0	;  
		db  52h	; R
		db  65h	; e
		db  78h	; x
		db  5Fh	; _
		db  47h	; G
		db  65h	; e
		db  74h	; t
		db  43h	; C
		db  61h	; a
		db  70h	; p
		db  73h	; s
		db    0	;  
		db  52h	; R
		db  65h	; e
		db  78h	; x
		db  5Fh	; _
		db  47h	; G
		db  65h	; e
		db  74h	; t
		db  46h	; F
		db  72h	; r
		db  65h	; e
		db  71h	; q
		db  75h	; u
		db  65h	; e
		db  6Eh	; n
		db  63h	; c
		db  79h	; y
		db    0	;  
		db  52h	; R
		db  65h	; e
		db  78h	; x
		db  5Fh	; _
		db  47h	; G
		db  65h	; e
		db  74h	; t
		db  50h	; P
		db  61h	; a
		db  6Eh	; n
		db    0	;  
		db  52h	; R
		db  65h	; e
		db  78h	; x
		db  5Fh	; _
		db  47h	; G
		db  65h	; e
		db  74h	; t
		db  50h	; P
		db  6Fh	; o
		db  73h	; s
		db  69h	; i
		db  74h	; t
		db  69h	; i
		db  6Fh	; o
		db  6Eh	; n
		db    0	;  
		db  52h	; R
		db  65h	; e
		db  78h	; x
		db  5Fh	; _
		db  47h	; G
		db  65h	; e
		db  74h	; t
		db  53h	; S
		db  6Fh	; o
		db  75h	; u
		db  6Eh	; n
		db  64h	; d
		db    0	;  
		db  52h	; R
		db  65h	; e
		db  78h	; x
		db  5Fh	; _
		db  47h	; G
		db  65h	; e
		db  74h	; t
		db  56h	; V
		db  6Fh	; o
		db  6Ch	; l
		db  75h	; u
		db  6Dh	; m
		db  65h	; e
		db    0	;  
		db  52h	; R
		db  65h	; e
		db  78h	; x
		db  5Fh	; _
		db  49h	; I
		db  6Eh	; n
		db  69h	; i
		db  74h	; t
		db    0	;  
		db  52h	; R
		db  65h	; e
		db  78h	; x
		db  5Fh	; _
		db  49h	; I
		db  73h	; s
		db  50h	; P
		db  6Ch	; l
		db  61h	; a
		db  79h	; y
		db  69h	; i
		db  6Eh	; n
		db  67h	; g
		db    0	;  
		db  52h	; R
		db  65h	; e
		db  78h	; x
		db  5Fh	; _
		db  4Dh	; M
		db  49h	; I
		db  44h	; D
		db  49h	; I
		db  5Fh	; _
		db  65h	; e
		db  78h	; x
		db  69h	; i
		db  74h	; t
		db    0	;  
		db  52h	; R
		db  65h	; e
		db  78h	; x
		db  5Fh	; _
		db  4Dh	; M
		db  49h	; I
		db  44h	; D
		db  49h	; I
		db  5Fh	; _
		db  69h	; i
		db  6Eh	; n
		db  69h	; i
		db  74h	; t
		db    0	;  
		db  52h	; R
		db  65h	; e
		db  78h	; x
		db  5Fh	; _
		db  4Dh	; M
		db  49h	; I
		db  44h	; D
		db  49h	; I
		db  5Fh	; _
		db  6Ch	; l
		db  6Fh	; o
		db  61h	; a
		db  64h	; d
		db    0	;  
		db  52h	; R
		db  65h	; e
		db  78h	; x
		db  5Fh	; _
		db  4Dh	; M
		db  49h	; I
		db  44h	; D
		db  49h	; I
		db  5Fh	; _
		db  70h	; p
		db  6Ch	; l
		db  61h	; a
		db  79h	; y
		db    0	;  
		db  52h	; R
		db  65h	; e
		db  78h	; x
		db  5Fh	; _
		db  4Dh	; M
		db  49h	; I
		db  44h	; D
		db  49h	; I
		db  5Fh	; _
		db  70h	; p
		db  6Ch	; l
		db  61h	; a
		db  79h	; y
		db  6Ch	; l
		db  6Fh	; o
		db  6Fh	; o
		db  70h	; p
		db  65h	; e
		db  64h	; d
		db    0	;  
		db  52h	; R
		db  65h	; e
		db  78h	; x
		db  5Fh	; _
		db  4Dh	; M
		db  49h	; I
		db  44h	; D
		db  49h	; I
		db  5Fh	; _
		db  73h	; s
		db  74h	; t
		db  6Fh	; o
		db  70h	; p
		db    0	;  
		db  52h	; R
		db  65h	; e
		db  78h	; x
		db  5Fh	; _
		db  4Dh	; M
		db  49h	; I
		db  44h	; D
		db  49h	; I
		db  5Fh	; _
		db  75h	; u
		db  6Eh	; n
		db  6Ch	; l
		db  6Fh	; o
		db  61h	; a
		db  64h	; d
		db    0	;  
		db  52h	; R
		db  65h	; e
		db  78h	; x
		db  5Fh	; _
		db  50h	; P
		db  6Ch	; l
		db  61h	; a
		db  79h	; y
		db    0	;  
		db  52h	; R
		db  65h	; e
		db  78h	; x
		db  5Fh	; _
		db  50h	; P
		db  6Ch	; l
		db  61h	; a
		db  79h	; y
		db  4Ch	; L
		db  6Fh	; o
		db  6Fh	; o
		db  70h	; p
		db  65h	; e
		db  64h	; d
		db    0	;  
		db  52h	; R
		db  65h	; e
		db  78h	; x
		db  5Fh	; _
		db  53h	; S
		db  65h	; e
		db  74h	; t
		db  46h	; F
		db  72h	; r
		db  65h	; e
		db  71h	; q
		db  75h	; u
		db  65h	; e
		db  6Eh	; n
		db  63h	; c
		db  79h	; y
		db    0	;  
		db  52h	; R
		db  65h	; e
		db  78h	; x
		db  5Fh	; _
		db  53h	; S
		db  65h	; e
		db  74h	; t
		db  50h	; P
		db  61h	; a
		db  6Eh	; n
		db    0	;  
		db  52h	; R
		db  65h	; e
		db  78h	; x
		db  5Fh	; _
		db  53h	; S
		db  65h	; e
		db  74h	; t
		db  56h	; V
		db  6Fh	; o
		db  6Ch	; l
		db  75h	; u
		db  6Dh	; m
		db  65h	; e
		db    0	;  
		db  52h	; R
		db  65h	; e
		db  78h	; x
		db  5Fh	; _
		db  53h	; S
		db  74h	; t
		db  6Fh	; o
		db  70h	; p
		db    0	;  
		db  52h	; R
		db  65h	; e
		db  78h	; x
		db  5Fh	; _
		db  62h	; b
		db  43h	; C
		db  72h	; r
		db  65h	; e
		db  61h	; a
		db  74h	; t
		db  65h	; e
		db    0	;  
		db  52h	; R
		db  65h	; e
		db  78h	; x
		db  5Fh	; _
		db  62h	; b
		db  52h	; R
		db  65h	; e
		db  6Ch	; l
		db  65h	; e
		db  61h	; a
		db  73h	; s
		db  65h	; e
		db    0	;  
		db  52h	; R
		db  65h	; e
		db  78h	; x
		db  5Fh	; _
		db  62h	; b
		db  57h	; W
		db  72h	; r
		db  69h	; i
		db  74h	; t
		db  65h	; e
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
_rdata		ends

; Section 3. (virtual address 00007000)
; Virtual size			: 0000403C (  16444.)
; Section size in file		: 00002C00 (  11264.)
; Offset to raw	data for section: 00005C00
; Flags	C0000040: Data Readable	Writable
; Alignment	: 16 bytes by default
; ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

; Segment type:	Pure data
_data		segment	para public 'DATA' use32
		assume cs:_data
		;org 10007000h
unk_10007000	db    0	;		; DATA XREF: __cinit+22o
		db    0	;  
		db    0	;  
		db    0	;  
unk_10007004	db    0	;		; DATA XREF: __cinit+1Do
		db    0	;  
		db    0	;  
		db    0	;  
unk_10007008	db    0	;		; DATA XREF: __cinit+10o
		db    0	;  
		db    0	;  
		db    0	;  
		dd offset ___initstdio
unk_10007010	db    0	;		; DATA XREF: __cinit+Bo
		db    0	;  
		db    0	;  
		db    0	;  
unk_10007014	db    0	;		; DATA XREF: sub_10003D20+71o
		db    0	;  
		db    0	;  
		db    0	;  
		dd offset ___endstdio
unk_1000701C	db    0	;		; DATA XREF: sub_10003D20+6Co
		db    0	;  
		db    0	;  
		db    0	;  
unk_10007020	db    0	;		; DATA XREF: sub_10003D20+83o
		db    0	;  
		db    0	;  
		db    0	;  
unk_10007024	db    0	;		; DATA XREF: sub_10003D20+7Eo
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
aCouldNotGetSou	db 'Could not get sound card capabilities',0 ; DATA XREF: Rex_GetCaps+B4o
		align 4
aRex_getcaps	db 'Rex_GetCaps',0      ; DATA XREF: Rex_GetCaps+AFo
aUnableToInitia	db 'Unable to Initialize Sound Device',0 ; DATA XREF: Rex_Init+51o
					; Rex_Init+6Co
		align 4
aRex_init	db 'Rex_Init',0         ; DATA XREF: Rex_Init+4Co Rex_Init+67o
		align 4
aSoundWasNotIni	db 'Sound was not initialized and cannot Exit!',0 ; DATA XREF: Rex_Exit+1Do
		align 4
aRex_exit	db 'Rex_Exit',0         ; DATA XREF: Rex_Exit+18o
		align 4
aCouldNotDuplic	db 'Could not duplicate buffer',0 ; DATA XREF: Rex_DuplicateBuffer+2Bo
		align 4
aDuplicatebuffe	db 'DuplicateBuffer',0  ; DATA XREF: Rex_DuplicateBuffer+26o
aCouldNotGetCur	db 'Could not get Current Position of play/write cursors for buf'
					; DATA XREF: Rex_GetPosition+2Ao
		db 'fer',0
aGetposition	db 'GetPosition',0      ; DATA XREF: Rex_GetPosition+25o
aCouldNotSetPan	db 'Could not Set Pan status of buffer',0 ; DATA XREF: Rex_SetPan+25o
		align 4
aRex_setpan	db 'Rex_SetPan',0       ; DATA XREF: Rex_SetPan+20o
		align 4
aCouldNotGetPan	db 'Could not Get Pan status of buffer',0 ; DATA XREF: Rex_GetPan+25o
		align 4
aRex_getpan	db 'Rex_GetPan',0       ; DATA XREF: Rex_GetPan+20o
		align 4
aCouldNotGetSta	db 'Could not Get Status of Sound Buffer',0 ; DATA XREF: Rex_IsPlaying+37o
		align 4
aRex_isplaying	db 'Rex_IsPlaying',0    ; DATA XREF: Rex_IsPlaying+32o
		align 4
aCouldNotGetFre	db 'Could not Get frequency',0 ; DATA XREF: Rex_GetFrequency+1Fo
aGet_frequency	db 'get_frequency',0    ; DATA XREF: Rex_GetFrequency+1Ao
		align 4
aCouldNotSetFre	db 'Could not Set frequency',0 ; DATA XREF: Rex_SetFrequency+1Fo
aSet_frequency	db 'set_frequency',0    ; DATA XREF: Rex_SetFrequency+1Ao
		align 4
aCouldNotGetVol	db 'Could not Get volume!',0 ; DATA XREF: Rex_GetVolume+1Fo
		align 4
aGet_volume	db 'get_volume',0       ; DATA XREF: Rex_GetVolume+1Ao
		align 4
aCouldNotSetVol	db 'Could Not set volume!',0 ; DATA XREF: Rex_SetVolume+1Fo
		align 4
aSet_volume	db 'set_volume',0       ; DATA XREF: Rex_SetVolume+1Ao
		align 4
aCouldNotStopSo	db 'Could not Stop Sound Buffer',0 ; DATA XREF: Rex_Stop+1Bo
aStop_buffer	db 'Stop_Buffer',0      ; DATA XREF: Rex_Stop+16o
aCouldNotLoopPl	db 'Could not loop play sound buffer',0 ; DATA XREF: Rex_PlayLooped+21o
		align 4
aRex_playlooped	db 'Rex_PlayLooped',0   ; DATA XREF: Rex_PlayLooped+1Co
					; Rex_Play+23o
		align 4
aCouldNotPlaySo	db 'Could not play sound buffer',0 ; DATA XREF: Rex_Play+28o
aCouldNotReleas	db 'Could not release Sound Buffer!',0 ; DATA XREF: Rex_bRelease+1Do
aRex_brelease	db 'Rex_bRelease',0     ; DATA XREF: Rex_bRelease+18o
		align 4
aCouldNotWriteT	db 'Could not write to sound buffer!',0 ; DATA XREF: Rex_bWrite+D4o
		align 4
aRex_bwrite	db 'Rex_bWrite',0       ; DATA XREF: Rex_bWrite+CFo
		align 4
aCouldNotCreate	db 'Could Not Create Sound Buffer!',0 ; DATA XREF: Rex_bCreate+145o
		align 4
aDsbufferDser_2	db 'DSBUFFER DSERR_OUTOFMEMORY',0 ; DATA XREF: Rex_bCreate+131o
		align 4
aDsbufferDser_1	db 'DSBUFFER DSERR_INVALIDPARAM',0 ; DATA XREF: Rex_bCreate+10Ao
aDsbufferDser_0	db 'DSBUFFER DSERR_BADFORMAT',0 ; DATA XREF: Rex_bCreate+EFo
		align 4
aDsbufferDserr_	db 'DSBUFFER DSERR_ALLOCATED',0 ; DATA XREF: Rex_bCreate+CDo
		align 4
aRex_bcreate	db 'Rex_bCreate',0      ; DATA XREF: Rex_bCreate+C8o
					; Rex_bCreate+EAo ...
aErrorReading_w	db 'Error reading .wav file (invalid length)',0
					; DATA XREF: Rex_GetSound+16Fo
		align 4
aErrorIn_wavFil	db 'Error in .wav File! ',0 ; DATA XREF: Rex_GetSound+62o
		align 4
aCouldNotFindOr	db 'Could not find or open .wav file!',0 ; DATA XREF: Rex_GetSound+33o
		align 4
aRex_getsound	db 'Rex_GetSound',0     ; DATA XREF: Rex_GetSound+2Eo
					; Rex_GetSound+5Do ...
		align 4
unk_10007460	db  72h	; r		; DATA XREF: Rex_GetSound+Bo
		db  62h	; b
		db    0	;  
		db    0	;  
dword_10007464	dd 46464952h		; DATA XREF: sub_10001990+3r
word_10007468	dw 0			; DATA XREF: sub_10001990+8r
		align 4
dword_1000746C	dd 0FFFFFFFFh		; DATA XREF: Rex_CD_init+51w
					; Rex_CD_get_num_tracksr ...
aCdaudio	db 'cdaudio',0          ; DATA XREF: Rex_CD_init+3o
off_10007478	dd offset __exit	; DATA XREF: __amsg_exit+2Er
		db    0	;  
		db  10h	;  
		db    0	;  
		db    0	;  
dword_10007480	dd 0			; DATA XREF: __mtdeletelocks+8o
					; __lock+7r ...
off_10007484	dd offset unk_10009BE0	; DATA XREF: __mtinitlocks+21r
					; __mtdeletelocks+2Bo ...
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
off_100074A4	dd offset unk_10009C10	; DATA XREF: __mtinitlocks+18r
					; __mtdeletelocks+23o ...
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
off_100074B4	dd offset unk_10009C28	; DATA XREF: __mtinitlocks+Fr
					; __mtdeletelocks+1Bo ...
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
off_100074C4	dd offset unk_10009BF8	; DATA XREF: __mtinitlocksr
					; __mtdeletelocks+13o ...
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
off_10007540	dd offset off_10007540	; DATA XREF: __heap_term+8o
					; __heap_term+20o ...
off_10007544	dd offset off_10007540	; DATA XREF: ___sbh_new_region+83r
					; ___sbh_new_region+8Cw ...
		dd offset unk_10007558
		dd offset unk_10007558
dword_10007550	dd 0FFFFFFFFh		; DATA XREF: ___sbh_new_regionr
					; ___sbh_release_region+4Fw
		db 0FFh	;  
		db 0FFh	;  
		db 0FFh	;  
		db 0FFh	;  
unk_10007558	db 0F0h	; ğ		; DATA XREF: .data:10007548o
					; .data:1000754Co
		db    0	;  
		db    0	;  
		db    0	;  
		db 0F1h	; ñ
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
off_10009560	dd offset off_10007540	; DATA XREF: ___sbh_release_region+16r
					; ___sbh_release_region+21w ...
dword_10009564	dd 1E0h			; DATA XREF: __heap_alloc+9r
					; _calloc+30r
unk_10009568	db    1	;		; DATA XREF: __dosmaperr+Eo
		db    0	;  
		db    0	;  
		db    0	;  
dword_1000956C	dd 16h			; DATA XREF: __dosmaperr+68r
		db    2	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    2	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    3	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    2	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    4	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db  18h	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    5	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db  0Dh	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    6	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    9	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    7	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db  0Ch	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    8	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db  0Ch	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    9	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db  0Ch	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db  0Ah	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    7	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db  0Bh	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    8	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db  0Ch	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db  16h	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db  0Dh	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db  16h	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db  0Fh	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    2	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db  10h	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db  0Dh	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db  11h	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db  12h	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db  12h	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    2	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db  21h	; !
		db    0	;  
		db    0	;  
		db    0	;  
		db  0Dh	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db  35h	; 5
		db    0	;  
		db    0	;  
		db    0	;  
		db    2	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db  41h	; A
		db    0	;  
		db    0	;  
		db    0	;  
		db  0Dh	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db  43h	; C
		db    0	;  
		db    0	;  
		db    0	;  
		db    2	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db  50h	; P
		db    0	;  
		db    0	;  
		db    0	;  
		db  11h	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db  52h	; R
		db    0	;  
		db    0	;  
		db    0	;  
		db  0Dh	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db  53h	; S
		db    0	;  
		db    0	;  
		db    0	;  
		db  0Dh	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db  57h	; W
		db    0	;  
		db    0	;  
		db    0	;  
		db  16h	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db  59h	; Y
		db    0	;  
		db    0	;  
		db    0	;  
		db  0Bh	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db  6Ch	; l
		db    0	;  
		db    0	;  
		db    0	;  
		db  0Dh	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db  6Dh	; m
		db    0	;  
		db    0	;  
		db    0	;  
		db  20h	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db  70h	; p
		db    0	;  
		db    0	;  
		db    0	;  
		db  1Ch	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db  72h	; r
		db    0	;  
		db    0	;  
		db    0	;  
		db    9	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    6	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db  16h	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db  80h	; €
		db    0	;  
		db    0	;  
		db    0	;  
		db  0Ah	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db  81h	; 
		db    0	;  
		db    0	;  
		db    0	;  
		db  0Ah	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db  82h	; ‚
		db    0	;  
		db    0	;  
		db    0	;  
		db    9	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db  83h	; ƒ
		db    0	;  
		db    0	;  
		db    0	;  
		db  16h	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db  84h	; „
		db    0	;  
		db    0	;  
		db    0	;  
		db  0Dh	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db  91h	; ‘
		db    0	;  
		db    0	;  
		db    0	;  
		db  29h	; )
		db    0	;  
		db    0	;  
		db    0	;  
		db  9Eh	; 
		db    0	;  
		db    0	;  
		db    0	;  
		db  0Dh	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db 0A1h	; ¡
		db    0	;  
		db    0	;  
		db    0	;  
		db    2	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db 0A4h	; ¤
		db    0	;  
		db    0	;  
		db    0	;  
		db  0Bh	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db 0A7h	; §
		db    0	;  
		db    0	;  
		db    0	;  
		db  0Dh	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db 0B7h	; ·
		db    0	;  
		db    0	;  
		db    0	;  
		db  11h	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db 0CEh	; Î
		db    0	;  
		db    0	;  
		db    0	;  
		db    2	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db 0D7h	; ×
		db    0	;  
		db    0	;  
		db    0	;  
		db  0Bh	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db  18h	;  
		db    7	;  
		db    0	;  
		db    0	;  
		db  0Ch	;  
		db    0	;  
		db    0	;  
		db    0	;  
dword_100096D0	dd 0FFFFFFFFh		; DATA XREF: __dosmaperr+1Bo
					; __mtinit+Fw ...
		align 8
unk_100096D8	db 0FFh	;		; DATA XREF: __filbuf+8Bo
		db 0FFh	;  
		db 0FFh	;  
		db 0FFh	;  
		db    0	;  
		db  0Ah	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
unk_10009700	db    1	;		; DATA XREF: __setmbcp+1A6r
		db    2	;  
		db    4	;  
		db    8	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
unk_10009708	db 0A4h	; ¤		; DATA XREF: __setmbcp+4Do
		db    3	;  
		db    0	;  
		db    0	;  
aVyv		db '`‚y‚!',0            ; DATA XREF: __setmbcp+1D9r
					; __setmbcp+1EAr ...
		align 8
unk_10009718	db 0A6h	; ¦		; DATA XREF: __setmbcp+182r
		db 0DFh	; ß
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db 0A1h	; ¡
		db 0A5h	; ¥
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db  81h	; 
		db  9Fh	; Ÿ
		db 0E0h	; à
		db 0FCh	; ü
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db  40h	; @
		db  7Eh	; ~
		db  80h	; €
		db 0FCh	; ü
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db 0A8h	; ¨
		db    3	;  
		db    0	;  
		db    0	;  
		db 0C1h	; Á
		db 0A3h	; £
		db 0DAh	; Ú
		db 0A3h	; £
		db  20h	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db  81h	; 
		db 0FEh	; ş
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db  40h	; @
		db 0FEh	; ş
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db 0B5h	; µ
		db    3	;  
		db    0	;  
		db    0	;  
		db 0C1h	; Á
		db 0A3h	; £
		db 0DAh	; Ú
		db 0A3h	; £
		db  20h	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db  81h	; 
		db 0FEh	; ş
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db  41h	; A
		db 0FEh	; ş
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db 0B6h	; ¶
		db    3	;  
		db    0	;  
		db    0	;  
		db 0CFh	; Ï
		db 0A2h	; ¢
		db 0E4h	; ä
		db 0A2h	; ¢
		db  1Ah	;  
		db    0	;  
		db 0E5h	; å
		db 0A2h	; ¢
		db 0E8h	; è
		db 0A2h	; ¢
		db  5Bh	; [
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db  81h	; 
		db 0FEh	; ş
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db  40h	; @
		db  7Eh	; ~
		db 0A1h	; ¡
		db 0FEh	; ş
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db  51h	; Q
		db    5	;  
		db    0	;  
		db    0	;  
		db  51h	; Q
		db 0DAh	; Ú
		db  5Eh	; ^
		db 0DAh	; Ú
		db  20h	;  
		db    0	;  
		db  5Fh	; _
		db 0DAh	; Ú
		db  6Ah	; j
		db 0DAh	; Ú
		db  32h	; 2
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db  81h	; 
		db 0D3h	; Ó
		db 0D8h	; Ø
		db 0DEh	; Ş
		db 0E0h	; à
		db 0F9h	; ù
		db    0	;  
		db    0	;  
		db  31h	; 1
		db  7Eh	; ~
		db  81h	; 
		db 0FEh	; ş
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
dword_100097F8	dd 2			; DATA XREF: __setmbcp+5Eo
					; __NMSG_WRITE+Ao ...
off_100097FC	dd offset aR6002FloatingP ; DATA XREF: __NMSG_WRITE+14Br
					; __NMSG_WRITE+1A8r
		db    8	;  
		db    0	;  
		db    0	;  
		db    0	;  
		dd offset aR6008NotEnough
		db    9	;  
		db    0	;  
		db    0	;  
		db    0	;  
		dd offset aR6009NotEnough
		db  0Ah	;  
		db    0	;  
		db    0	;  
		db    0	;  
		dd offset aAbnormalProgra
		db  10h	;  
		db    0	;  
		db    0	;  
		db    0	;  
		dd offset aR6016NotEnough
		db  11h	;  
		db    0	;  
		db    0	;  
		db    0	;  
		dd offset aR6017Unexpecte
		db  12h	;  
		db    0	;  
		db    0	;  
		db    0	;  
		dd offset aR6018Unexpecte
		db  13h	;  
		db    0	;  
		db    0	;  
		db    0	;  
		dd offset aR6019UnableToO
		db  18h	;  
		db    0	;  
		db    0	;  
		db    0	;  
		dd offset aR6024NotEnough
		db  19h	;  
		db    0	;  
		db    0	;  
		db    0	;  
		dd offset aR6025PureVirtu
		db  1Ah	;  
		db    0	;  
		db    0	;  
		db    0	;  
		dd offset aR6026NotEnough
		db  1Bh	;  
		db    0	;  
		db    0	;  
		db    0	;  
		dd offset aR6027NotEnough
		db  1Ch	;  
		db    0	;  
		db    0	;  
		db    0	;  
		dd offset aR6028UnableToI
		db  78h	; x
		db    0	;  
		db    0	;  
		db    0	;  
		dd offset aDomainError
		db  79h	; y
		db    0	;  
		db    0	;  
		db    0	;  
		dd offset aSingError
		db  7Ah	; z
		db    0	;  
		db    0	;  
		db    0	;  
		dd offset aTlossError
		db 0FCh	; ü
		db    0	;  
		db    0	;  
		db    0	;  
		dd offset unk_100060B8
		db 0FFh	;  
		db    0	;  
		db    0	;  
		db    0	;  
		dd offset aRuntimeError
off_10009888	dd offset unk_10009F00	; DATA XREF: __lock_file+6o
					; __lock_file+14o ...
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		dd offset unk_10009F00
		db    1	;  
		db    1	;  
		db    0	;  
		db    0	;  
unk_10009898	db    0	;		; DATA XREF: ___initstdio+83o
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db  10h	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    2	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    1	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    2	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    2	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
unk_100098F8	db    0	;		; DATA XREF: ___initstdio+B2o
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
unk_10009AE8	db    0	;		; DATA XREF: __lock_file+Do
					; __unlock_file+Do
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
unk_10009B08	db    5	;		; DATA XREF: __initptd+4o
					; ___initstdio+79o
		db    0	;  
		db    0	;  
		db 0C0h	; À
		db  0Bh	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db  1Dh	;  
		db    0	;  
		db    0	;  
		db 0C0h	; À
		db    4	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db  96h	; –
		db    0	;  
		db    0	;  
		db 0C0h	; À
		db    4	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db  8Dh	; 
		db    0	;  
		db    0	;  
		db 0C0h	; À
		db    8	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db  8Eh	; 
		db    0	;  
		db    0	;  
		db 0C0h	; À
		db    8	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db  8Fh	; 
		db    0	;  
		db    0	;  
		db 0C0h	; À
		db    8	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db  90h	; 
		db    0	;  
		db    0	;  
		db 0C0h	; À
		db    8	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db  91h	; ‘
		db    0	;  
		db    0	;  
		db 0C0h	; À
		db    8	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db  92h	; ’
		db    0	;  
		db    0	;  
		db 0C0h	; À
		db    8	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db  93h	; “
		db    0	;  
		db    0	;  
		db 0C0h	; À
		db    8	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    3	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    7	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db  78h	; x
		db    0	;  
		db    0	;  
		db    0	;  
		db  0Ah	;  
		db    0	;  
		db    0	;  
		db    0	;  
dword_10009B90	dd 0			; DATA XREF: Rex_GetCaps+1Fr
					; Rex_Init+6o ...
dword_10009B94	dd 0			; DATA XREF: Rex_GetCaps+A7r
					; Rex_Init+Dw ...
dword_10009B98	dd 0			; DATA XREF: Rex_MIDI_init+13o
					; Rex_MIDI_init+2Cr ...
dword_10009B9C	dd 0			; DATA XREF: Rex_MIDI_exit+1Cr
					; Rex_MIDI_exit+38r ...
dword_10009BA0	dd 0			; DATA XREF: Rex_MIDI_init+57o
					; Rex_MIDI_exit+60r ...
dword_10009BA4	dd 0			; DATA XREF: Rex_MIDI_unloadr
					; Rex_MIDI_unload+Fw ...
unk_10009BA8	db    0	;		; DATA XREF: Rex_CD_init+14o
		db    0	;  
		db    0	;  
		db    0	;  
dword_10009BAC	dd 0			; DATA XREF: Rex_CD_init+2Br
					; Rex_CD_playr	...
dword_10009BB0	dd 0			; DATA XREF: Rex_CD_init+3w
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
unk_10009BBC	db    0	;		; DATA XREF: Rex_CD_pause+5o
					; Rex_CD_stop+5o
		db    0	;  
		db    0	;  
		db    0	;  
dword_10009BC0	dd 0			; DATA XREF: Rex_CD_play_track+3Cw
					; Rex_CD_play_track+61o ...
dword_10009BC4	dd 0			; DATA XREF: Rex_CD_play_track+4Bw
					; Rex_CD_fforward+66w ...
dword_10009BC8	dd 0			; DATA XREF: Rex_CD_play_track+34w
					; Rex_CD_play_track+83w
dword_10009BCC	dd 0			; DATA XREF: __CRT_INIT@12+EAr
					; __CRT_INIT@12+F0w ...
dword_10009BD0	dd 0			; DATA XREF: __CRT_INIT@12+C4w
					; __setenvp+1r	...
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
dword_10009BD8	dd 0			; DATA XREF: __amsg_exitr
					; __FF_MSGBANNERr ...
dword_10009BDC	dd 0			; DATA XREF: __CRT_INIT@12+13r
					; __amsg_exit+Er ...
unk_10009BE0	db    0	;		; DATA XREF: .data:10007484o
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
unk_10009BF8	db    0	;		; DATA XREF: .data:100074C4o
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db    0	;  
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
unk_10009C10	db ? ; unexplored	; DATA XREF: .data:100074A4o
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
unk_10009C28	db ? ; unexplored	; DATA XREF: .data:100074B4o
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
dword_10009C40	dd ?			; DATA XREF: ___sbh_decommit_pages+49r
					; ___sbh_decommit_pages+50w ...
dword_10009C44	dd ?			; DATA XREF: _mallocr _calloc+89r
dword_10009C48	dd ?			; DATA XREF: __callnewhr
dword_10009C4C	dd ?			; DATA XREF: __sopen+135r
dword_10009C50	dd ?			; DATA XREF: __CRT_INIT@12+19w
					; __CRT_INIT@12+6Cr ...
dword_10009C54	dd ?			; DATA XREF: __CRT_INIT@12+90w
dword_10009C58	dd ?			; DATA XREF: __CRT_INIT@12+83w
dword_10009C5C	dd ?			; DATA XREF: __CRT_INIT@12+7Dw
dword_10009C60	dd ?			; DATA XREF: __setargv+94w
dword_10009C64	dd ?			; DATA XREF: __setargv+8Dw
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
dword_10009C6C	dd ?			; DATA XREF: __setenvp+48w
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
dword_10009C7C	dd ?			; DATA XREF: __setargv+1Dw
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
byte_10009C84	db ?			; DATA XREF: sub_10003D20+38w
					; ___endstdio+5r
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
dword_10009C88	dd ?			; DATA XREF: __CRT_INIT@12+11Br
					; sub_10003D20+2Ew
dword_10009C8C	dd ?			; DATA XREF: sub_10003D20+8r
					; sub_10003D20+9Ew
unk_10009C90	db ? ; unexplored	; DATA XREF: __setargv+Ao
					; __setargv+1Do ...
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
unk_10009D98	db ? ; unexplored	; DATA XREF: __setmbcp+81o
					; __setmbcp+172o ...
unk_10009D99	db ? ; unexplored	; DATA XREF: sub_100043F0+4Er
					; sub_100043F0+B0r ...
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
dword_10009E9C	dd ?			; DATA XREF: __setmbcp+1Dr
					; __setmbcp+ECw ...
dword_10009EA0	dd ?			; DATA XREF: __setmbcp+FAw
					; __setmbcp+107w ...
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
dword_10009EA8	dd ?			; DATA XREF: __setmbcp+111w
					; __setmbcp+1F3w ...
dword_10009EAC	dd ?			; DATA XREF: __setmbcp+117w
					; __setmbcp+1FCw ...
dword_10009EB0	dd ?			; DATA XREF: __setmbcp+11Dw
					; __setmbcp+204w ...
dword_10009EB4	dd ?			; DATA XREF: __setmbcp+135r
					; sub_10004820+4w ...
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
dword_10009EBC	dd ?			; DATA XREF: ___crtGetEnvironmentStringsAr
					; ___crtGetEnvironmentStringsA+3Dw
dword_10009EC0	dd ?			; DATA XREF: __FF_MSGBANNER+21r
dword_10009EC4	dd ?			; DATA XREF: __openfile+126r
					; __openfile+12Cw ...
dword_10009EC8	dd ?			; DATA XREF: __openfile+Er
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
dword_10009EE8	dd ?			; DATA XREF: sub_10004820+3Dr
dword_10009EEC	dd ?			; DATA XREF: ___crtMessageBoxAr
					; ___crtMessageBoxA+2Fw ...
dword_10009EF0	dd ?			; DATA XREF: ___crtMessageBoxA+44w
					; ___crtMessageBoxA+50r
dword_10009EF4	dd ?			; DATA XREF: ___crtMessageBoxA+4Bw
					; ___crtMessageBoxA+61r
dword_10009EF8	dd ?			; DATA XREF: __sopen+41r
dword_10009EFC	dd ?			; DATA XREF: sub_100034F0+26r
					; sub_100034F0+3Er ...
unk_10009F00	db ? ; unexplored	; DATA XREF: .data:10009888o
					; .data:10009890o
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
dword_1000AF00	dd ?			; DATA XREF: sub_100034F0+14r
					; sub_100034F0+96r ...
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
dword_1000AF20	dd ?			; DATA XREF: __close+1Cr
					; __close_lk+6Cr ...
unk_1000AF24	db ? ; unexplored	; DATA XREF: __ioinit+B1o
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
		db ? ; unexplored
dword_1000B020	dd ?			; DATA XREF: __closer __readr	...
dword_1000B024	dd ?			; DATA XREF: sub_10003D20+4Ar
dword_1000B028	dd ?			; DATA XREF: sub_10003D20+40r
					; sub_10003D20+5Fr
dword_1000B02C	dd ?			; DATA XREF: __cinitr
dword_1000B030	dd ?			; DATA XREF: _free+52r
					; __heap_alloc+42r ...
dword_1000B034	dd ?			; DATA XREF: __CRT_INIT@12+B4w
					; __CRT_INIT@12+BEr ...
dword_1000B038	dd ?			; DATA XREF: start+36r	start+94r
_data		ends


; Imports from DSOUND.dll

; Section 4. (virtual address 0000C000)
; Virtual size			: 0000065C (   1628.)
; Section size in file		: 00000800 (   2048.)
; Offset to raw	data for section: 00008800
; Flags	C0000040: Data Readable	Writable
; Alignment	: 16 bytes by default
; ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ

; Segment type:	Externs
; _idata
		extrn DirectSoundCreate:dword ;	DATA XREF: j_DirectSoundCreater


; Imports from KERNEL32.dll

		extrn CloseHandle:dword	; DATA XREF: __close_lk+42r
					; __sopen+1E0r
		extrn TerminateProcess:dword ; DATA XREF: sub_10003D20+1Er
		extrn ReadFile:dword	; DATA XREF: __read_lk+86r
					; __read_lk+167r
		extrn SetEndOfFile:dword ; DATA	XREF: __chsize_lk+F9r
		extrn LoadLibraryA:dword ; DATA	XREF: ___crtMessageBoxA+13r
		extrn CreateFileA:dword	; DATA XREF: __sopen+1C7r
		extrn SetFilePointer:dword ; DATA XREF:	__lseek_lk+32r
		extrn FlushFileBuffers:dword ; DATA XREF: __commit+4Er
		extrn HeapFree:dword	; DATA XREF: _free+5Fr
					; ___sbh_new_region+156r ...
		extrn HeapAlloc:dword	; DATA XREF: __heap_alloc+4Cr
					; ___sbh_new_region+21r ...
		extrn GetCurrentDirectoryA:dword ; DATA	XREF: __getdcwd_lk+7Fr
		extrn GetFullPathNameA:dword ; DATA XREF: __getdcwd_lk+6Dr
		extrn GetDriveTypeA:dword ; DATA XREF: __validdrive+28r
		extrn GetCommandLineA:dword ; DATA XREF: __CRT_INIT@12+AEr
		extrn GetProcAddress:dword ; DATA XREF:	__CRT_INIT@12+4Cr
					; ___crtMessageBoxA+1Fr
		extrn GetModuleHandleA:dword ; DATA XREF: __CRT_INIT@12+3Cr
		extrn GetVersion:dword	; DATA XREF: __CRT_INIT@12+Dr
					; Get current version number of	Windows
					; and information about	the operating system platform
		extrn HeapDestroy:dword	; DATA XREF: __heap_init+28r
					; __heap_term+2Er
		extrn HeapCreate:dword	; DATA XREF: __heap_init+9r
		extrn VirtualFree:dword	; DATA XREF: __heap_term+2r
					; ___sbh_new_region+13Fr ...
		extrn InitializeCriticalSection:dword ;	DATA XREF: __mtinitlocks+6r
					; __lock+43r ...
		extrn DeleteCriticalSection:dword ; DATA XREF: __mtdeletelocks+2r
					; __ioterm+2r ...
		extrn EnterCriticalSection:dword ; DATA	XREF: __lock+6Dr
					; __lock_file+2Er ...
		extrn LeaveCriticalSection:dword ; DATA	XREF: __unlock+Er
					; __unlock_file+2Er ...
		extrn ExitProcess:dword	; DATA XREF: sub_10003D20+A8r
		extrn VirtualAlloc:dword ; DATA	XREF: ___sbh_new_region+31r
					; ___sbh_alloc_block+152r
		extrn GetLastError:dword ; DATA	XREF: __close_lk+4Cr
					; __read_lk+90r ...
		extrn MultiByteToWideChar:dword	; DATA XREF: Rex_MIDI_load+24r
		extrn SetStdHandle:dword ; DATA	XREF: __set_osfhnd+4Br
					; __set_osfhnd+5Fr ...
		extrn GetFileType:dword	; DATA XREF: __ioinit+140r
					; __ioinit+1B9r ...
		extrn GetCurrentProcess:dword ;	DATA XREF: sub_10003D20+17r
		extrn GetCurrentThreadId:dword ; DATA XREF: __mtinit+42r
					; __getptd+49r
		extrn TlsSetValue:dword	; DATA XREF: __mtinit+2Fr __getptd+36r ...
		extrn TlsAlloc:dword	; DATA XREF: __mtinit+6r
					; Allocate a thread local storage (TLS)	index
		extrn TlsFree:dword	; DATA XREF: __mtterm+10r
					; Release a thread local storage (TLS) index
		extrn SetLastError:dword ; DATA	XREF: __getptd+59r
					; __getptd+6Fr
		extrn TlsGetValue:dword	; DATA XREF: __getptd+10r
					; __freeptd+18r
		extrn SetHandleCount:dword ; DATA XREF:	__ioinit+1FEr
		extrn GetStdHandle:dword ; DATA	XREF: __ioinit+178r
					; __NMSG_WRITE+1A0r
		extrn FreeEnvironmentStringsA:dword
					; DATA XREF: ___crtGetEnvironmentStringsA+120r
					; ___crtGetEnvironmentStringsA+142r
		extrn GetStartupInfoA:dword ; DATA XREF: __ioinit+6Ar
		extrn GetModuleFileNameA:dword ; DATA XREF: __setargv+11r
					; __NMSG_WRITE+6Br
		extrn GetCPInfo:dword	; DATA XREF: __setmbcp+6Br
		extrn GetACP:dword	; DATA XREF: sub_10004820+32r
		extrn GetOEMCP:dword	; DATA XREF: sub_10004820+1Dr
		extrn FreeEnvironmentStringsW:dword
					; DATA XREF: ___crtGetEnvironmentStringsA+C7r
					; ___crtGetEnvironmentStringsA+D5r
		extrn GetEnvironmentStrings:dword
					; DATA XREF: ___crtGetEnvironmentStringsA+7r
		extrn GetEnvironmentStringsW:dword
					; DATA XREF: ___crtGetEnvironmentStringsA+13r
		extrn WideCharToMultiByte:dword
					; DATA XREF: ___crtGetEnvironmentStringsA+8Ar
					; ___crtGetEnvironmentStringsA+B1r
		extrn WriteFile:dword	; DATA XREF: __NMSG_WRITE+1C5r
					; __write_lk+E5r ...


; Imports from USER32.dll

		extrn MessageBoxA:dword	; DATA XREF: Rex_GetCaps+BAr
					; Rex_Init+57r	...


; Imports from WINMM.dll

		extrn mciSendCommandA:dword ; DATA XREF: Rex_CD_init+Er
					; Rex_CD_play+Fr ...


; Imports from ole32.dll

		extrn CoUninitialize:dword ; DATA XREF:	Rex_MIDI_exit+6Fr
		extrn CoInitialize:dword ; DATA	XREF: Rex_MIDI_init+3r
		extrn CoCreateInstance:dword ; DATA XREF: Rex_MIDI_init+Dr



		end start
