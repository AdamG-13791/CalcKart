;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.7 #12036 (MINGW64)
;--------------------------------------------------------
	.module C__Users_Adam_AppData_Local_Temp_zcc000038A4C52D2
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _test
	.globl _ang
	.globl _yVel
	.globl _xVel
	.globl _yPos
	.globl _xPos
;--------------------------------------------------------
; Externals used
;--------------------------------------------------------
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_xPos::
	.ds 2
_yPos::
	.ds 2
_xVel::
	.ds 2
_yVel::
	.ds 2
_ang::
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;	---------------------------------
; Function test
; ---------------------------------
_test::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #_xPos
	ld	a, (hl)
	add	a, 4 (ix)
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	adc	a, 5 (ix)
	ld	(hl), a
	ld	hl, #_yPos
	ld	a, (hl)
	add	a, 4 (ix)
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	adc	a, 5 (ix)
	ld	(hl), a
	ld	bc, (_xPos)
	ld	hl, #_ang
	ld	e, (hl)
	xor	a, a
	cp	a, c
	sbc	a, b
	jp	PO, l_test_00111$
	xor	a, #0x80
l_test_00111$:
	jp	P, l_test_00102$
	ld	c, 4 (ix)
	ld	a, e
	sub	a, c
	ld	(#_ang),a
	jr	l_test_00104$
l_test_00102$:
	ld	l, c
	ld	h, b
	add	hl, hl
	ld	a, l
	ld	(_yPos), a
	ld	a, h
	ld	(_yPos + 1), a
	ld	a,(#_xPos)
	add	a, e
	ld	(#_ang),a
l_test_00104$:
	pop	ix
	ret
	.area _rodata_compiler
	.area _CODE
;	---------------------------------
; Function main
; ---------------------------------
_main::
	ld	hl, #0x0014
	push	hl
	call	_test
	pop	af
	ld	hl, #0x007b
	ret
	.area _rodata_compiler
	.area _CODE
	.area _CODE
	.area _rodata_compiler
	.area _INITIALIZER
	.area _CABS (ABS)
