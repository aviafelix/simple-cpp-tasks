;mystub.asm
	.model small
;	.stack 100h
	.data
mesrusdos db 'Программа не может быть запущена в DOS; требуется WIN32', 0Dh, 0Ah
	  db 'This program requres Win32.				Shyar STUB, 2003.', 0Dh, 0Ah, '$'
	.code
start:
	mov	ax, @data
	mov	ds, ax

	mov	ah, 9
	mov	dx, offset mesrusdos
	int	21h

	mov	ax, 4C00h
	int	21h
end start