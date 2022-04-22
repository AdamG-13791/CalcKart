        psect   data
        global  _o
_o:
        defb    0
        psect   text
        global  _samplePixel
_samplePixel:
        jp      f40
f41:
        ld      b,.low.5
        ld      e,(ix+6)
        ld      d,(ix+1+6)
        ld      hl,_o
        ld      l,(hl)
        ld      h,0
        add     hl,hl
        add     hl,hl
        add     hl,de
        global  shlr
        call    shlr
        ld      l,l
        push    hl
        ld      de,32
        ld      l,(ix+4)
        ld      h,(ix+1+4)
        global  adiv
        call    adiv
        ld      a,l
        pop     hl
        add     a,l
        and     .low.1
        ld      l,a
        jp      l1
l1:
        pop     ix
        ret
f40:
        push    ix
        ld      ix,0
        add     ix,sp
        jp      f41
        global  _getScreenPixel
_getScreenPixel:
        jp      f50
f51:
        ld      a,(ix+4)
        srl     a
        ld      (ix+4),a
        ld      a,(ix+6)
        cp      .low.64
        jp      llt,l3
        ld      l,.low.0
        jp      l2
l3:
        ld      a,(ix+4)
        cp      .low.48
        jp      llt,l4
        ld      l,.low.0
        jp      l2
l4:
        ld      a,(ix+6)
        cp      .low.32
        jp      lge,l5
        ld      l,.low.0
        jp      l2
l5:
        ld      e,(ix+6)
        ld      d,0
        ld      hl,65504
        add     hl,de
        ld      de,20
        global  wrelop
        call    wrelop
        jp      lge,l6
        ld      hl,_o
        ld      e,(hl)
        ld      d,0
        ld      l,(ix+4)
        ld      h,0
        add     hl,de
        ld      (ix+-2),l
        ld      (ix+1+-2),h
        ld      de,216
        push    ix
        pop     hl
        dec     hl
        dec     hl
        global  aslmod
        call    aslmod
        ld      de,54
        ld      l,(ix+-2)
        ld      h,(ix+1+-2)
        global  lmod
        call    lmod
        ld      (ix+-4),l
        ld      (ix+1+-4),h
        ld      de,54
        ld      l,(ix+-2)
        ld      h,(ix+1+-2)
        global  wrelop
        call    wrelop
        jp      lge,l7
        global  _angles16
        ld      e,(ix+6)
        ld      d,0
        ld      hl,65504
        add     hl,de
        add     hl,hl
        add     hl,hl
        ex      de,hl
        push    de
        ld      de,80
        ld      l,(ix+-4)
        ld      h,(ix+1+-4)
        global  lmul
        call    lmul
        pop     de
        add     hl,de
        ld      de,_angles16+2
        add     hl,de
        ld      c,(hl)
        inc     hl
        ld      b,(hl)
        push    bc
        ld      e,(ix+6)
        ld      d,0
        ld      hl,65504
        add     hl,de
        add     hl,hl
        add     hl,hl
        ex      de,hl
        push    de
        ld      de,80
        ld      l,(ix+-4)
        ld      h,(ix+1+-4)
        global  lmul
        call    lmul
        pop     de
        add     hl,de
        ld      de,_angles16
        add     hl,de
        ld      c,(hl)
        inc     hl
        ld      b,(hl)
        push    bc
        call    _samplePixel
        pop     bc
        pop     bc

        jp      l2
        jp      l8
l7:
        ld      de,108
        ld      l,(ix+-2)
        ld      h,(ix+1+-2)
        global  wrelop
        call    wrelop
        jp      lge,l9
        ld      e,(ix+6)
        ld      d,0
        ld      hl,65504
        add     hl,de
        add     hl,hl
        add     hl,hl
        ex      de,hl
        push    de
        ld      de,80
        ld      l,(ix+-4)
        ld      h,(ix+1+-4)
        global  lmul
        call    lmul
        pop     de
        add     hl,de
        ld      de,_angles16
        add     hl,de
        ld      c,(hl)
        inc     hl
        ld      b,(hl)
        ld      hl,0
        or      a
        sbc     hl,bc
        push    hl
        ld      e,(ix+6)
        ld      d,0
        ld      hl,65504
        add     hl,de
        add     hl,hl
        add     hl,hl
        ex      de,hl
        push    de
        ld      de,80
        ld      l,(ix+-4)
        ld      h,(ix+1+-4)
        global  lmul
        call    lmul
        pop     de
        add     hl,de
        ld      de,_angles16+2
        add     hl,de
        ld      c,(hl)
        inc     hl
        ld      b,(hl)
        push    bc
        call    _samplePixel
        pop     bc
        pop     bc

        jp      l2
        jp      l10
l9:
        ld      de,162
        ld      l,(ix+-2)
        ld      h,(ix+1+-2)
        global  wrelop
        call    wrelop
        jp      lge,l11
        ld      e,(ix+6)
        ld      d,0
        ld      hl,65504
        add     hl,de
        add     hl,hl
        add     hl,hl
        ex      de,hl
        push    de
        ld      de,80
        ld      l,(ix+-4)
        ld      h,(ix+1+-4)
        global  lmul
        call    lmul
        pop     de
        add     hl,de
        ld      de,_angles16+2
        add     hl,de
        ld      c,(hl)
        inc     hl
        ld      b,(hl)
        ld      hl,0
        or      a
        sbc     hl,bc
        push    hl
        ld      e,(ix+6)
        ld      d,0
        ld      hl,65504
        add     hl,de
        add     hl,hl
        add     hl,hl
        ex      de,hl
        push    de
        ld      de,80
        ld      l,(ix+-4)
        ld      h,(ix+1+-4)
        global  lmul
        call    lmul
        pop     de
        add     hl,de
        ld      de,_angles16
        add     hl,de
        ld      c,(hl)
        inc     hl
        ld      b,(hl)
        ld      hl,0
        or      a
        sbc     hl,bc
        push    hl
        call    _samplePixel
        pop     bc
        pop     bc

        jp      l2
        jp      l12
l11:
        ld      de,108
        ld      l,(ix+-2)
        ld      h,(ix+1+-2)
        global  wrelop
        call    wrelop
        jp      lge,l13
        ld      e,(ix+6)
        ld      d,0
        ld      hl,65504
        add     hl,de
        add     hl,hl
        add     hl,hl
        ex      de,hl
        push    de
        ld      de,80
        ld      l,(ix+-4)
        ld      h,(ix+1+-4)
        global  lmul
        call    lmul
        pop     de
        add     hl,de
        ld      de,_angles16
        add     hl,de
        ld      c,(hl)
        inc     hl
        ld      b,(hl)
        push    bc
        ld      e,(ix+6)
        ld      d,0
        ld      hl,65504
        add     hl,de
        add     hl,hl
        add     hl,hl
        ex      de,hl
        push    de
        ld      de,80
        ld      l,(ix+-4)
        ld      h,(ix+1+-4)
        global  lmul
        call    lmul
        pop     de
        add     hl,de
        ld      de,_angles16+2
        add     hl,de
        ld      c,(hl)
        inc     hl
        ld      b,(hl)
        ld      hl,0
        or      a
        sbc     hl,bc
        push    hl
        call    _samplePixel
        pop     bc
        pop     bc

        jp      l2
l13:
l12:
l10:
l8:
        jp      l14
l6:
        ld      hl,_o
        ld      e,(hl)
        ld      d,0
        ld      l,(ix+4)
        ld      h,0
        add     hl,de
        ld      (ix+-6),l
        ld      (ix+1+-6),h
        push    ix
        pop     de
        ld      hl,-6
        add     hl,de
        ld      de,216
        global  aslmod
        call    aslmod
        ld      de,54
        ld      l,(ix+-6)
        ld      h,(ix+1+-6)
        global  lmod
        call    lmod
        ld      (ix+-8),l
        ld      (ix+1+-8),h
        ld      de,54
        ld      l,(ix+-6)
        ld      h,(ix+1+-6)
        global  wrelop
        call    wrelop
        jp      lge,l15
        global  _angles8
        ld      e,(ix+6)
        ld      d,0
        ld      hl,65484
        add     hl,de
        add     hl,hl
        ex      de,hl
        push    de
        ld      de,24
        ld      l,(ix+-8)
        ld      h,(ix+1+-8)
        global  lmul
        call    lmul
        pop     de
        add     hl,de
        ld      de,_angles8+1
        add     hl,de
        ld      c,(hl)
        inc     hl
        ld      b,(hl)
        push    bc
        ld      e,(ix+6)
        ld      d,0
        ld      hl,65484
        add     hl,de
        add     hl,hl
        ex      de,hl
        push    de
        ld      de,24
        ld      l,(ix+-8)
        ld      h,(ix+1+-8)
        global  lmul
        call    lmul
        pop     de
        add     hl,de
        ld      de,_angles8
        add     hl,de
        ld      c,(hl)
        inc     hl
        ld      b,(hl)
        push    bc
        call    _samplePixel
        pop     bc
        pop     bc

        jp      l2
        jp      l16
l15:
        ld      de,108
        ld      l,(ix+-6)
        ld      h,(ix+1+-6)
        global  wrelop
        call    wrelop
        jp      lge,l17
        ld      e,(ix+6)
        ld      d,0
        ld      hl,65484
        add     hl,de
        add     hl,hl
        ex      de,hl
        push    de
        ld      de,24
        ld      l,(ix+-8)
        ld      h,(ix+1+-8)
        global  lmul
        call    lmul
        pop     de
        add     hl,de
        ld      de,_angles8
        add     hl,de
        ld      c,(hl)
        inc     hl
        ld      b,(hl)
        ld      hl,0
        or      a
        sbc     hl,bc
        push    hl
        ld      e,(ix+6)
        ld      d,0
        ld      hl,65484
        add     hl,de
        add     hl,hl
        ex      de,hl
        push    de
        ld      de,24
        ld      l,(ix+-8)
        ld      h,(ix+1+-8)
        global  lmul
        call    lmul
        pop     de
        add     hl,de
        ld      de,_angles8+1
        add     hl,de
        ld      c,(hl)
        inc     hl
        ld      b,(hl)
        push    bc
        call    _samplePixel
        pop     bc
        pop     bc

        jp      l2
        jp      l18
l17:
        ld      de,162
        ld      l,(ix+-6)
        ld      h,(ix+1+-6)
        global  wrelop
        call    wrelop
        jp      lge,l19
        ld      e,(ix+6)
        ld      d,0
        ld      hl,65484
        add     hl,de
        add     hl,hl
        ex      de,hl
        push    de
        ld      de,24
        ld      l,(ix+-8)
        ld      h,(ix+1+-8)
        global  lmul
        call    lmul
        pop     de
        add     hl,de
        ld      de,_angles8+1
        add     hl,de
        ld      c,(hl)
        inc     hl
        ld      b,(hl)
        ld      hl,0
        or      a
        sbc     hl,bc
        push    hl
        ld      e,(ix+6)
        ld      d,0
        ld      hl,65484
        add     hl,de
        add     hl,hl
        ex      de,hl
        push    de
        ld      de,24
        ld      l,(ix+-8)
        ld      h,(ix+1+-8)
        global  lmul
        call    lmul
        pop     de
        add     hl,de
        ld      de,_angles8
        add     hl,de
        ld      c,(hl)
        inc     hl
        ld      b,(hl)
        ld      hl,0
        or      a
        sbc     hl,bc
        push    hl
        call    _samplePixel
        pop     bc
        pop     bc

        jp      l2
        jp      l20
l19:
        ld      de,108
        ld      l,(ix+-6)
        ld      h,(ix+1+-6)
        global  wrelop
        call    wrelop
        jp      lge,l21
        ld      e,(ix+6)
        ld      d,0
        ld      hl,65484
        add     hl,de
        add     hl,hl
        ex      de,hl
        push    de
        ld      de,24
        ld      l,(ix+-8)
        ld      h,(ix+1+-8)
        global  lmul
        call    lmul
        pop     de
        add     hl,de
        ld      de,_angles8
        add     hl,de
        ld      c,(hl)
        inc     hl
        ld      b,(hl)
        push    bc
        ld      e,(ix+6)
        ld      d,0
        ld      hl,65484
        add     hl,de
        add     hl,hl
        ex      de,hl
        push    de
        ld      de,24
        ld      l,(ix+-8)
        ld      h,(ix+1+-8)
        global  lmul
        call    lmul
        pop     de
        add     hl,de
        ld      de,_angles8+1
        add     hl,de
        ld      c,(hl)
        inc     hl
        ld      b,(hl)
        ld      hl,0
        or      a
        sbc     hl,bc
        push    hl
        call    _samplePixel
        pop     bc
        pop     bc

        jp      l2
l21:
l20:
l18:
l16:
l14:
l2:
        ld      sp,ix
        pop     ix
        ret
f50:
        push    ix
        ld      ix,0
        add     ix,sp
        push    bc
        push    bc
        push    bc
        push    bc
        jp      f51
        global  _getScreenByte
_getScreenByte:
        jp      f60
f61:
        ld      (ix+-1),0
        ld      (ix+-2),0
        jp      l26
l23:
        ld      l,(ix+6)
        push    hl
        ld      a,(ix+4)
        add     a,(ix+-2)
        ld      c,a
        push    bc
        call    _getScreenPixel
        pop     bc
        pop     bc

        ld      a,l
        or      a
        jp      lz,l27
        ld      a,.low.7
        sub     (ix+-2)
        ld      b,a
        ld      a,.low.1
        inc     b
        dec     b
        jr      z,u24081
u24080:
        sll     a
        djnz    u24080
u24081:
        or      (ix+-1)
        ld      (ix+-1),a
l27:
        inc     (ix+-2)
l26:
        ld      a,(ix+-2)
        cp      .low.8
        jp      llt,l23
        ld      l,(ix+-1)
        jp      l22
l22:
        ld      sp,ix
        pop     ix
        ret
f60:
        push    ix
        ld      ix,0
        add     ix,sp
        push    bc
        jp      f61
        global  _main
_main:
        jp      f70
f71:
        push    ix
        pop     de
        ld      hl,-6145
        add     hl,de
        ld      (hl),0
        jp      l29
l30:
        push    ix
        pop     de
        ld      hl,-6145
        add     hl,de
        inc     (hl)
        push    ix
        pop     de
        ld      hl,-6145
        add     hl,de
        ld      a,(hl)
        ld      l,a
        rla
        sbc     a,a
        ld      h,a
        ld      de,20
        global  amod
        call    amod
        ld      a,l
        or      a
        jp      anz,l32
l32:
        push    ix
        pop     de
        ld      hl,-6144
        add     hl,de
        ex      de,hl
        push    ix
        pop     bc
        ld      hl,-6147
        add     hl,bc
        ld      (hl),e
        inc     hl
        ld      (hl),d
        push    ix
        pop     de
        ld      hl,-6149
        add     hl,de
        ld      (hl),0
        jp      l36
l33:
        push    ix
        pop     de
        ld      hl,-6148
        add     hl,de
        ld      (hl),0
        jp      l40
l37:
        push    ix
        pop     de
        ld      hl,-6149
        add     hl,de
        ld      l,(hl)
        push    hl
        push    ix
        pop     de
        ld      hl,-6148
        add     hl,de
        ld      l,(hl)
        push    hl
        call    _getScreenByte
        pop     bc
        pop     bc

        ld      a,l
        push    ix
        pop     de
        ld      hl,-6147
        add     hl,de
        ld      e,(hl)
        inc     hl
        ld      h,(hl)
        ld      l,e
        ld      (hl),a
        push    ix
        pop     de
        ld      hl,-6147
        add     hl,de
        ld      c,(hl)
        inc     hl
        ld      b,(hl)
        inc     bc
        ld      (hl),b
        dec     hl
        ld      (hl),c
        push    ix
        pop     de
        ld      hl,-6148
        add     hl,de
        ld      a,(hl)
        add     a,.low.8
        ld      (hl),a
l40:
        push    ix
        pop     de
        ld      hl,-6148
        add     hl,de
        ld      a,(hl)
        cp      .low.96
        jp      llt,l37
        push    ix
        pop     de
        ld      hl,-6149
        add     hl,de
        inc     (hl)
l36:
        push    ix
        pop     de
        ld      hl,-6149
        add     hl,de
        ld      a,(hl)
        cp      .low.64
        jp      llt,l33
        push    ix
        pop     de
        ld      hl,-6150
        add     hl,de
        ld      (hl),10
        push    ix
        pop     de
        ld      hl,-6150
        add     hl,de
        ld      a,(hl)
        or      a
        jp      lnz,l41
        jp      l31
l41:
        push    ix
        pop     de
        ld      hl,-6150
        add     hl,de
        ld      a,(hl)
        cp      .low.2
        jp      nz,l42
        ld      hl,_o
        dec     (hl)
        jp      l43
l42:
        ld      hl,_o
        inc     (hl)
l43:
l29:
        jp      l30
l31:
        ld      hl,0
        jp      l28
l28:
        ld      sp,ix
        pop     ix
        ret
f70:
        push    ix
        ld      ix,0
        add     ix,sp
        ld      hl,-6150
        add     hl,sp
        ld      sp,hl
        jp      f71
        psect   bss
_angles16:
        defs    4320
_angles8:
        defs    1296