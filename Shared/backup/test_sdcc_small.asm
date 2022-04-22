;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.0 #12072 (MINGW64)
;--------------------------------------------------------
	.module test
	.optsdcc -mz80
	
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
;test.c:8: void test(short a) {
;	---------------------------------
; Function test
; ---------------------------------
_test::
;test.c:9: xPos += a;
	ld	hl, #2
	add	hl, sp
	push	de
	ld	de, #_xPos
	push	de
	pop	de
	ld	a, (de)
	add	a, (hl)
	ld	(de), a
	inc	de
	ld	a, (de)
	inc	hl
	adc	a, (hl)
	ld	(de), a
	pop	de
;test.c:10: yPos += a;
	ld	hl, #2
	add	hl, sp
	push	de
	ld	de, #_yPos
	push	de
	pop	de
	ld	a, (de)
	add	a, (hl)
	ld	(de), a
	inc	de
	ld	a, (de)
	inc	hl
	adc	a, (hl)
	ld	(de), a
	pop	de
;test.c:11: if (xPos > 0) {
	ld	bc, (_xPos)
;test.c:12: ang -= a;
	ld	a, (#_ang + 0)
	ld	e, a
;test.c:11: if (xPos > 0) {
	xor	a, a
	cp	a, c
	sbc	a, b
	jp	PO, 00111$
	xor	a, #0x80
00111$:
	jp	P, 00102$
;test.c:12: ang -= a;
	ld	hl, #2
	add	hl, sp
	ld	c, (hl)
	ld	hl, #_ang
	ld	a, e
	sub	a, c
	ld	(hl), a
	ret
00102$:
;test.c:14: yPos = xPos * 2;
	ld	l, c
	ld	h, b
	add	hl, hl
	ld	(_yPos), hl
;test.c:15: ang += xPos;
	ld	a,(#_xPos + 0)
	add	a, e
	ld	(_ang+0), a
;test.c:17: }
	ret
;test.c:19: int main() {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;test.c:20: test(20);
	ld	hl, #0x0014
	push	hl
	call	_test
	pop	af
;test.c:21: return 123;
	ld	hl, #0x007b
;test.c:22: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
