;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (MINGW64)
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"timr0.c"
	list	p=16f877a
	radix dec
	include "p16f877a.inc"
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_get_mode
	extern	_DIG_CLK_update
	extern	_hour_update
	extern	_minutes_update
	extern	_SSD_Update_2
	extern	_SSD_Update
	extern	_PB_Update
	extern	_TMR0
	extern	_OPTION_REGbits
	extern	_INTCONbits

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
	global	_TMR0_Init
	global	_TMR0_Start
	global	_TMR0_Update

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_timr0_0	udata
r0x1002	res	1
___sdcc_saved_fsr	res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

IDD_timr0_0	idata
_TMR0_Update_counter_65536_34
	db	0x00	; 0

;--------------------------------------------------------
; initialized absolute data
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; interrupt and initialization code
;--------------------------------------------------------
c_interrupt	code	0x0004
__sdcc_interrupt:
;***
;  pBlock Stats: dbName = I
;***
;functions called:
;   _PB_Update
;   _DIG_CLK_update
;   _minutes_update
;   _hour_update
;   _get_mode
;   _SSD_Update_2
;   _SSD_Update
;   _PB_Update
;   _DIG_CLK_update
;   _minutes_update
;   _hour_update
;   _get_mode
;   _SSD_Update_2
;   _SSD_Update
;1 compiler assigned register :
;   r0x1002
;; Starting pCode block
_TMR0_Update:
; 0 exit points
;	.line	26; "timr0.c"	void TMR0_Update(void) __interrupt 0 // @ 5 ms
	MOVWF	WSAVE
	SWAPF	STATUS,W
	CLRF	STATUS
	MOVWF	SSAVE
	MOVF	PCLATH,W
	CLRF	PCLATH
	MOVWF	PSAVE
	MOVF	FSR,W
	BANKSEL	___sdcc_saved_fsr
	MOVWF	___sdcc_saved_fsr
;	.line	32; "timr0.c"	counter++;
	BANKSEL	_TMR0_Update_counter_65536_34
	INCF	_TMR0_Update_counter_65536_34,F
;	.line	35; "timr0.c"	if (counter == 5)
	MOVF	_TMR0_Update_counter_65536_34,W
	XORLW	0x05
	BTFSS	STATUS,2
	GOTO	_00114_DS_
;	.line	37; "timr0.c"	PB_Update();    // read push buttons --> 0 & 2 ---> then update samples
	PAGESEL	_PB_Update
	CALL	_PB_Update
	PAGESEL	$
;	.line	38; "timr0.c"	DIG_CLK_update();
	PAGESEL	_DIG_CLK_update
	CALL	_DIG_CLK_update
	PAGESEL	$
;	.line	39; "timr0.c"	minutes_update();
	PAGESEL	_minutes_update
	CALL	_minutes_update
	PAGESEL	$
;	.line	40; "timr0.c"	hour_update();
	PAGESEL	_hour_update
	CALL	_hour_update
	PAGESEL	$
;	.line	41; "timr0.c"	counter = 0;
	BANKSEL	_TMR0_Update_counter_65536_34
	CLRF	_TMR0_Update_counter_65536_34
_00114_DS_:
;	.line	44; "timr0.c"	if(get_mode() == normal)
	PAGESEL	_get_mode
	CALL	_get_mode
	PAGESEL	$
	BANKSEL	r0x1002
	MOVWF	r0x1002
	MOVF	r0x1002,W
	BTFSS	STATUS,2
	GOTO	_00116_DS_
;	.line	46; "timr0.c"	SSD_Update_2();
	PAGESEL	_SSD_Update_2
	CALL	_SSD_Update_2
	PAGESEL	$
	GOTO	_00117_DS_
_00116_DS_:
;	.line	49; "timr0.c"	SSD_Update();   // put the output module task first
	PAGESEL	_SSD_Update
	CALL	_SSD_Update
	PAGESEL	$
_00117_DS_:
;	.line	56; "timr0.c"	TMR0_CLEAR_FLAG();
	BANKSEL	_INTCONbits
	BCF	_INTCONbits,2
;	.line	57; "timr0.c"	TMR0_SET_TIME_MS(TMR0_TICK_MS);
	MOVLW	0xd8
	MOVWF	_TMR0
;	.line	60; "timr0.c"	}
	BANKSEL	___sdcc_saved_fsr
	MOVF	___sdcc_saved_fsr,W
	BANKSEL	FSR
	MOVWF	FSR
	MOVF	PSAVE,W
	MOVWF	PCLATH
	CLRF	STATUS
	SWAPF	SSAVE,W
	MOVWF	STATUS
	SWAPF	WSAVE,F
	SWAPF	WSAVE,W
END_OF_INTERRUPT:
	RETFIE	

;--------------------------------------------------------
; code
;--------------------------------------------------------
code_timr0	code
;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_timr0__TMR0_Start	code
_TMR0_Start:
; 2 exit points
;	.line	19; "timr0.c"	TMR0_SET_INT_STATE(1);
	BANKSEL	_INTCONbits
	BSF	_INTCONbits,5
;	.line	20; "timr0.c"	GIE = 1;
	BSF	_INTCONbits,7
;	.line	21; "timr0.c"	TMR0_SELECT_CLOCK_SOURCE(0); // Internal oscillator
	BANKSEL	_OPTION_REGbits
	BCF	_OPTION_REGbits,5
;	.line	22; "timr0.c"	TMR0_SET_STATE(0);          // TMR0 is on
	BCF	_OPTION_REGbits,5
;	.line	23; "timr0.c"	}
	RETURN	
; exit point of _TMR0_Start

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_timr0__TMR0_Init	code
_TMR0_Init:
; 2 exit points
;	.line	11; "timr0.c"	TMR0_SET_STATE(1);          // TMR0 is off
	BANKSEL	_OPTION_REGbits
	BSF	_OPTION_REGbits,5
;	.line	12; "timr0.c"	TMR0_SET_PRE_SCALER(7);     // N = 256
	BCF	_OPTION_REGbits,3
	BSF	_OPTION_REGbits,0
	BSF	_OPTION_REGbits,1
	BSF	_OPTION_REGbits,2
;	.line	14; "timr0.c"	}
	RETURN	
; exit point of _TMR0_Init


;	code size estimation:
;	   51+   24 =    75 instructions (  198 byte)

	end
