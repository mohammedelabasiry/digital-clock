;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (MINGW64)
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"DIG_CLK_modes.c"
	list	p=16f877a
	radix dec
	include "p16f877a.inc"
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_PB_GetState

	extern PSAVE
	extern SSAVE
	extern WSAVE
	extern STK12
	extern STK11
	extern STK10
	extern STK09
	extern STK08
	extern STK07
	extern STK06
	extern STK05
	extern STK04
	extern STK03
	extern STK02
	extern STK01
	extern STK00
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	global	_DIG_CLK_init
	global	_DIG_CLK_update
	global	_get_mode

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_DIG_CLK_modes_0	udata
r0x1001	res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

IDD_DIG_CLK_modes_0	idata
_sys_mode
	db	0x00	; 0

;--------------------------------------------------------
; initialized absolute data
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; code
;--------------------------------------------------------
code_DIG_CLK_modes	code
;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_DIG_CLK_modes__get_mode	code
_get_mode:
; 2 exit points
;	.line	44; "DIG_CLK_modes.c"	return sys_mode ;
	BANKSEL	_sys_mode
	MOVF	_sys_mode,W
;	.line	46; "DIG_CLK_modes.c"	}
	RETURN	
; exit point of _get_mode

;***
;  pBlock Stats: dbName = C
;***
;functions called:
;   _PB_GetState
;   _PB_GetState
;   _PB_GetState
;   _PB_GetState
;   _PB_GetState
;   _PB_GetState
;1 compiler assigned register :
;   r0x1001
;; Starting pCode block
S_DIG_CLK_modes__DIG_CLK_update	code
_DIG_CLK_update:
; 0 exit points
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x3=3), size=1
;	.line	18; "DIG_CLK_modes.c"	switch(sys_mode)
	MOVLW	0x03
	BANKSEL	_sys_mode
	SUBWF	_sys_mode,W
	BTFSC	STATUS,0
	GOTO	_00002_DS_
;;genSkipc:3307: created from rifx:00000000047A57B0
	MOVLW	HIGH(_00139_DS_)
	BANKSEL	PCLATH
	MOVWF	PCLATH
	MOVLW	_00139_DS_
	BANKSEL	_sys_mode
	ADDWF	_sys_mode,W
	BTFSS	STATUS,0
	GOTO	_00001_DS_
	BANKSEL	PCLATH
	INCF	PCLATH,F
_00001_DS_:
	MOVWF	PCL
_00139_DS_:
	GOTO	_00109_DS_
	GOTO	_00112_DS_
	GOTO	_00115_DS_
_00109_DS_:
;	.line	22; "DIG_CLK_modes.c"	if(PB_GetState( PB_SET) ==  PB_PRE_PRESSED)  sys_mode = setting_hour ;
	MOVLW	0x02
	PAGESEL	_PB_GetState
	CALL	_PB_GetState
	PAGESEL	$
	BANKSEL	r0x1001
	MOVWF	r0x1001
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00002_DS_
	MOVLW	0x01
	BANKSEL	_sys_mode
	MOVWF	_sys_mode
;	.line	24; "DIG_CLK_modes.c"	break;
	GOTO	_00002_DS_
_00112_DS_:
;	.line	26; "DIG_CLK_modes.c"	if(PB_GetState( PB_SET) ==  PB_PRE_PRESSED)  sys_mode = settting_minutes ;
	MOVLW	0x02
	PAGESEL	_PB_GetState
	CALL	_PB_GetState
	PAGESEL	$
	BANKSEL	r0x1001
	MOVWF	r0x1001
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00002_DS_
	MOVLW	0x02
	BANKSEL	_sys_mode
	MOVWF	_sys_mode
;	.line	27; "DIG_CLK_modes.c"	break ;
	GOTO	_00002_DS_
_00115_DS_:
;	.line	29; "DIG_CLK_modes.c"	if(PB_GetState( PB_SET) ==  PB_PRE_PRESSED)  sys_mode =  normal ;
	MOVLW	0x02
	PAGESEL	_PB_GetState
	CALL	_PB_GetState
	PAGESEL	$
	BANKSEL	r0x1001
	MOVWF	r0x1001
;	.line	38; "DIG_CLK_modes.c"	}
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00002_DS_
	BANKSEL	_sys_mode
	CLRF	_sys_mode
_00002_DS_:
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_DIG_CLK_modes__DIG_CLK_init	code
_DIG_CLK_init:
; 2 exit points
;	.line	9; "DIG_CLK_modes.c"	void DIG_CLK_init(DIG_CLK_modes init_mode)
	BANKSEL	_sys_mode
	MOVWF	_sys_mode
;	.line	13; "DIG_CLK_modes.c"	}
	RETURN	
; exit point of _DIG_CLK_init


;	code size estimation:
;	   45+   18 =    63 instructions (  162 byte)

	end
