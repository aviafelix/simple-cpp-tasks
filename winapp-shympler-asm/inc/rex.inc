; rex.inc
ifdef _TASM_
	includelib	rex.lib
	extrn	Rex_CD_close		:	near
	extrn	Rex_CD_close_door	:	near
	extrn	Rex_CD_fforward		:	near
	extrn	Rex_CD_get_num_tracks	:	near
	extrn	Rex_CD_init		:	near
	extrn	Rex_CD_is_playing	:	near
	extrn	Rex_CD_open_door	:	near
	extrn	Rex_CD_pause		:	near
	extrn	Rex_CD_play			:	near
	extrn	Rex_CD_play_next_track	:	near
	extrn	Rex_CD_play_previous_track	:	near
	extrn	Rex_CD_play_track	:	near
	extrn	Rex_CD_resume		:	near
	extrn	Rex_CD_rewind		:	near
	extrn	Rex_CD_stop			:	near
	extrn	Rex_DuplicateBuffer	:	near
	extrn	Rex_Exit			:	near
	extrn	Rex_GetCaps			:	near
	extrn	Rex_GetFrequency	:	near
	extrn	Rex_GetPan			:	near
	extrn	Rex_GetPosition		:	near
	extrn	Rex_GetSound		:	near
	extrn	Rex_GetVolume		:	near
	extrn	Rex_Init			:	near
	extrn	Rex_IsPlaying		:	near
	extrn	Rex_MIDI_exit		:	near
	extrn	Rex_MIDI_init		:	near
	extrn	Rex_MIDI_load		:	near
	extrn	Rex_MIDI_play		:	near
	extrn	Rex_MIDI_playlooped	:	near
	extrn	Rex_MIDI_stop		:	near
	extrn	Rex_MIDI_unload		:	near
	extrn	Rex_Play			:	near
	extrn	Rex_PlayLooped		:	near
	extrn	Rex_SetFrequency	:	near
	extrn	Rex_SetPan			:	near
	extrn	Rex_SetVolume		:	near
	extrn	Rex_Stop			:	near
	extrn	Rex_bCreate			:	near
	extrn	Rex_bRelease		:	near
	extrn	Rex_bWrite			:	near
else
		includelib	rex.lib
		extrn	__imp__Rex_CD_close@0		:	dword
		extrn	__imp__Rex_CD_close_door@0	:	dword
		extrn	__imp__Rex_CD_fforward@0		:	dword
		extrn	__imp__Rex_CD_get_num_tracks@0	:	dword
		extrn	__imp__Rex_CD_init@0			:	dword
		extrn	__imp__Rex_CD_is_playing@0	:	dword
		extrn	__imp__Rex_CD_open_door@0	:	dword
		extrn	__imp__Rex_CD_pause@0		:	dword
		extrn	__imp__Rex_CD_play@0		:	dword
		extrn	__imp__Rex_CD_play_next_track@0	:	dword
		extrn	__imp__Rex_CD_play_previous_track@0	:	dword
		extrn	__imp__Rex_CD_play_track@0	:	dword
		extrn	__imp__Rex_CD_resume@0		:	dword
		extrn	__imp__Rex_CD_rewind@0		:	dword
		extrn	__imp__Rex_CD_stop@0			:	dword
		extrn	__imp__Rex_DuplicateBuffer@8	:	dword
		extrn	__imp__Rex_Exit@0			:	dword
		extrn	__imp__Rex_GetCaps@4			:	dword
		extrn	__imp__Rex_GetFrequency@8	:	dword
		extrn	__imp__Rex_GetPan@8			:	dword
		extrn	__imp__Rex_GetPosition@12		:	dword
		extrn	__imp__Rex_GetSound@8		:	dword
		extrn	__imp__Rex_GetVolume@8		:	dword
		extrn	__imp__Rex_Init@4			:	dword
		extrn	__imp__Rex_IsPlaying@8		:	dword
		extrn	__imp__Rex_MIDI_exit@0		:	dword
		extrn	__imp__Rex_MIDI_init@0		:	dword
		extrn	__imp__Rex_MIDI_load@4		:	dword
		extrn	__imp__Rex_MIDI_play@0		:	dword
		extrn	__imp__Rex_MIDI_playlooped@4	:	dword
		extrn	__imp__Rex_MIDI_stop@0		:	dword
		extrn	__imp__Rex_MIDI_unload@0		:	dword
		extrn	__imp__Rex_Play@8			:	dword
		extrn	__imp__Rex_PlayLooped@4		:	dword
		extrn	__imp__Rex_SetFrequency@8	:	dword
		extrn	__imp__Rex_SetPan@8			:	dword
		extrn	__imp__Rex_SetVolume@8		:	dword
		extrn	__imp__Rex_Stop@4			:	dword
		extrn	__imp__Rex_bCreate@20			:	dword
		extrn	__imp__Rex_bRelease@4		:	dword
		extrn	__imp__Rex_bWrite@16			:	dword

		Rex_CD_close 	equ	__imp__Rex_CD_close@0
		Rex_CD_close_door 	equ	__imp__Rex_CD_close_door@0
		Rex_CD_fforward 	equ	__imp__Rex_CD_fforward@0
		Rex_CD_get_num_tracks 	equ	__imp__Rex_CD_get_num_tracks@0
		Rex_CD_init 	equ	__imp__Rex_CD_init@0
		Rex_CD_is_playing 	equ	__imp__Rex_CD_is_playing@0
		Rex_CD_open_door 	equ	__imp__Rex_CD_open_door@0
		Rex_CD_pause 	equ	__imp__Rex_CD_pause@0
		Rex_CD_play 	equ	__imp__Rex_CD_play@0
		Rex_CD_play_next_track 	equ	__imp__Rex_CD_play_next_track@0
		Rex_CD_play_previous_track 	equ	__imp__Rex_CD_play_previous_track@0
		Rex_CD_play_track 	equ	__imp__Rex_CD_play_track@0
		Rex_CD_resume 	equ	__imp__Rex_CD_resume@0
		Rex_CD_rewind 	equ	__imp__Rex_CD_rewind@0
		Rex_CD_stop 	equ	__imp__Rex_CD_stop@0
		Rex_DuplicateBuffer 	equ	__imp__Rex_DuplicateBuffer@8
		Rex_Exit 	equ	__imp__Rex_Exit@0
		Rex_GetCaps 	equ	__imp__Rex_GetCaps@4
		Rex_GetFrequency 	equ	__imp__Rex_GetFrequency@8
		Rex_GetPan 	equ	__imp__Rex_GetPan@8
		Rex_GetPosition 	equ	__imp__Rex_GetPosition@12
		Rex_GetSound 	equ	__imp__Rex_GetSound@8
		Rex_GetVolume 	equ	__imp__Rex_GetVolume@8
		Rex_Init 	equ	__imp__Rex_Init@4
		Rex_IsPlaying 	equ	__imp__Rex_IsPlaying@8
		Rex_MIDI_exit 	equ	__imp__Rex_MIDI_exit@0
		Rex_MIDI_init 	equ	__imp__Rex_MIDI_init@0
		Rex_MIDI_load 	equ	__imp__Rex_MIDI_load@4
		Rex_MIDI_play 	equ	__imp__Rex_MIDI_play@0
		Rex_MIDI_playlooped 	equ	__imp__Rex_MIDI_playlooped@4
		Rex_MIDI_stop 	equ	__imp__Rex_MIDI_stop@0
		Rex_MIDI_unload 	equ	__imp__Rex_MIDI_unload@0
		Rex_Play 	equ	__imp__Rex_Play@8
		Rex_PlayLooped 	equ	__imp__Rex_PlayLooped@4
		Rex_SetFrequency 	equ	__imp__Rex_SetFrequency@8
		Rex_SetPan 	equ	__imp__Rex_SetPan@8
		Rex_SetVolume 	equ	__imp__Rex_SetVolume@8
		Rex_Stop 	equ	__imp__Rex_Stop@4
		Rex_bCreate 	equ	__imp__Rex_bCreate@20
		Rex_bRelease 	equ	__imp__Rex_bRelease@4
		Rex_bWrite 	equ	__imp__Rex_bWrite@16
endif
