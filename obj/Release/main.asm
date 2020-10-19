;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (MINGW64)
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"main.c"
	list	p=16f877a
	radix dec
	include "p16f877a.inc"
;--------------------------------------------------------
; config word(s)
;--------------------------------------------------------
	__config 0x3f32
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_DIG_CLK_init
	extern	_hour_init
	extern	_minutes_init
	extern	_PB_Init
	extern	_SSD_Init
	extern	_TMR0_Start
	extern	_TMR0_Init
	extern	__sdcc_gsinit_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	global	_main

	global PSAVE
	global SSAVE
	global WSAVE
	global STK12
	global STK11
	global STK10
	global STK09
	global STK08
	global STK07
	global STK06
	global STK05
	global STK04
	global STK03
	global STK02
	global STK01
	global STK00

sharebank udata_ovr 0x0070
PSAVE	res 1
SSAVE	res 1
WSAVE	res 1
STK12	res 1
STK11	res 1
STK10	res 1
STK09	res 1
STK08	res 1
STK07	res 1
STK06	res 1
STK05	res 1
STK04	res 1
STK03	res 1
STK02	res 1
STK01	res 1
STK00	res 1

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------
;--------------------------------------------------------
; initialized absolute data
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; reset vector 
;--------------------------------------------------------
STARTUP	code 0x0000
	nop
	pagesel __sdcc_gsinit_startup
	goto	__sdcc_gsinit_startup
;--------------------------------------------------------
; code
;--------------------------------------------------------
code_main	code
;***
;  pBlock Stats: dbName = M
;***
;has an exit
;functions called:
;   _PB_Init
;   _PB_Init
;   _PB_Init
;   _SSD_Init
;   _SSD_Init
;   _SSD_Init
;   _SSD_Init
;   _DIG_CLK_init
;   _hour_init
;   _minutes_init
;   _TMR0_Init
;   _TMR0_Start
;   _PB_Init
;   _PB_Init
;   _PB_Init
;   _SSD_Init
;   _SSD_Init
;   _SSD_Init
;   _SSD_Init
;   _DIG_CLK_init
;   _hour_init
;   _minutes_init
;   _TMR0_Init
;   _TMR0_Start
;2 compiler assigned registers:
;   STK00
;   STK01
;; Starting pCode block
S_main__main	code
_main:
; 2 exit points
;	.line	17; "main.c"	PB_Init(PB_MINUS ,   PB_RELEASED);
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x01
	PAGESEL	_PB_Init
	CALL	_PB_Init
	PAGESEL	$
;	.line	18; "main.c"	PB_Init(PB_PLUS  ,   PB_RELEASED);
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_PB_Init
	CALL	_PB_Init
	PAGESEL	$
;	.line	19; "main.c"	PB_Init(PB_SET   ,   PB_RELEASED);
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x02
	PAGESEL	_PB_Init
	CALL	_PB_Init
	PAGESEL	$
;	.line	23; "main.c"	SSD_Init( SSD_L  , SSD_OFF  ,    SSD_NULL);
	MOVLW	0x0a
	MOVWF	STK01
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_SSD_Init
	CALL	_SSD_Init
	PAGESEL	$
;	.line	24; "main.c"	SSD_Init( SSD_R  , SSD_OFF  ,    SSD_NULL);
	MOVLW	0x0a
	MOVWF	STK01
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x03
	PAGESEL	_SSD_Init
	CALL	_SSD_Init
	PAGESEL	$
;	.line	25; "main.c"	SSD_Init( SSD_M  , SSD_OFF  ,    SSD_NULL);
	MOVLW	0x0a
	MOVWF	STK01
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x01
	PAGESEL	_SSD_Init
	CALL	_SSD_Init
	PAGESEL	$
;	.line	26; "main.c"	SSD_Init( SSD_N  , SSD_OFF  ,    SSD_NULL);
	MOVLW	0x0a
	MOVWF	STK01
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x02
	PAGESEL	_SSD_Init
	CALL	_SSD_Init
	PAGESEL	$
;	.line	29; "main.c"	DIG_CLK_init(normal);
	MOVLW	0x00
	PAGESEL	_DIG_CLK_init
	CALL	_DIG_CLK_init
	PAGESEL	$
;	.line	30; "main.c"	hour_init(20);
	MOVLW	0x14
	PAGESEL	_hour_init
	CALL	_hour_init
	PAGESEL	$
;	.line	31; "main.c"	minutes_init(40);
	MOVLW	0x28
	PAGESEL	_minutes_init
	CALL	_minutes_init
	PAGESEL	$
;	.line	33; "main.c"	TMR0_Init();
	PAGESEL	_TMR0_Init
	CALL	_TMR0_Init
	PAGESEL	$
;	.line	34; "main.c"	TMR0_Start();
	PAGESEL	_TMR0_Start
	CALL	_TMR0_Start
	PAGESEL	$
_00106_DS_:
;	.line	38; "main.c"	while(1)
	GOTO	_00106_DS_
;	.line	44; "main.c"	}
	RETURN	
; exit point of _main


;	code size estimation:
;	   46+   24 =    70 instructions (  188 byte)

	end
