;netenum.asm
;Консольное приложение для win32, перечисляющее сетевые ресурсы
include def32.inc
include kernel32.inc
include mpr.inc

	.386
	.model flat
	.const
greet_message	db	'Пример Win32 - консольной программы',0Dh, 0Ah, 0Dh, 0Ah, 0
error1_message	db	0Dh, 0Ah,'Не могу получить имя текущего пользователя!',0Dh, 0Ah,0
error2_message	db	0Dh, 0Ah,'Не могу перечислить!', 0Dh, 0Ah, 0
good_exit_msg	db	0Dh, 0Ah,0Dh, 0Ah, 'Нормальное завершение ',0Dh, 0Ah,0
enum_msg1	db	0Dh, 0Ah,'Локальный ',0
enum_msg2	db	' отдалённый - ', 0
	.data
user_name	db	"Список сетевых ресурсов пользователя:"
user_buff	db	64 dup (?)
user_buff_l	dd	$-user_buff
enum_buf_l	dd	1056
enum_entries	dd	1
	.data?
enum_buf	NTRESOURCE <?,?,?,?,?,?,?,?>
		dd 256 dup (?)
message_l	dd	?
enum_handle	dd	?
	.code
_start:
	push	STD_OUTPUT_HANDLE
	call	GetStdHandle
	mov	ebx, eax
	mov	esi, offset greet_message
	call	output_string
	mov	esi, offset user_buff
	push	offset user_buff_l
	push	esi
	push	0
	call	WNetGetUser
	cmp	eax, NO_ERROR
	jne	error_exit1
	mov	esi, offset user_name
	call	output_string
	
	push	offset enum_handle
	push	0
	push	RESOURCEUSAGE_CONNECTABLE
	push	RESOURCETYPE_ANY
	push	RESOURCE_CONNECTED
	call	WNetOpenEnum
	cmp	eax, NO_ERROR
	jne	error_exit2
enumeration_loop:
	push	offset enum_buf_l
	push	offset enum_buf
	push	offset enum_entries
	push	dword ptr enum_handle
	call	WNetEnumResource
	cmp	eax, ERROR_NO_MORE_ITEMS
	je	end_enumeration
	cmp	eax, NO_ERROR
	jne	error_exit2

	mov	esi, offset enum_msg1
	call	output_string
	mov	esi, dword ptr enum_buf.lpLocalName
	call	output_string
	mov	esi, offset enum_msg2
	call	output_string
	mov	esi, dword ptr enum_buf.lpRemoteName
	call	output_string

	jmp	short enumeration_loop
end_enumeration:
	push	dword ptr enum_handle
	call	WNetCloseEnum

	mov	esi, offset good_exit_msg
exit_program:
	call	output_string
	push	0
	call	ExitProcess
error_exit1:
	mov esi, offset error1_message
	jmp short exit_program
error_exit2:
	mov esi, offset error2_message
	jmp short exit_program

output_string	proc	near
	cld
	xor	eax, eax
	mov	edi, esi
	repne	scasb
	dec	edi
	sub	edi, esi

	push	0
	push	offset message_l
	push	edi
	push	esi
	push	ebx
	call	WriteConsole

	ret
output_string	endp

end	_start	