;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (MINGW64)
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"hours.c"
	list	p=16f877a
	radix dec
	include "p16f877a.inc"
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	__modsint
	extern	__divsint
	extern	_get_minutes
	extern	_SSD_SetSymbol
	extern	_PB_GetState
	extern	_get_mode

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
	global	_hour_init
	global	_hour_update
	global	_get_hour

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_hours_0	udata
r0x1004	res	1
r0x1005	res	1
r0x1006	res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

IDD_hours_0	idata
_hour
	db	0x00	; 0


IDD_hours_1	idata
_flag
	db	0x01	; 1


IDD_hours_2	idata
_one_second_time
	db	0x00	; 0


IDD_hours_3	idata
_SSD_data
	db	0x0a	; 10

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
code_hours	code
;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_hours__get_hour	code
_get_hour:
; 2 exit points
;	.line	104; "hours.c"	}
	RETURN	
; exit point of _get_hour

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _get_mode
;   _get_minutes
;   _get_minutes
;   __divsint
;   _SSD_SetSymbol
;   __modsint
;   _SSD_SetSymbol
;   _get_mode
;   _PB_GetState
;   _PB_GetState
;   __divsint
;   _SSD_SetSymbol
;   __modsint
;   _SSD_SetSymbol
;   _SSD_SetSymbol
;   _SSD_SetSymbol
;   _TOGGLE_passed_value_to_SSD
;   _get_mode
;   _get_minutes
;   _get_minutes
;   __divsint
;   _SSD_SetSymbol
;   __modsint
;   _SSD_SetSymbol
;   _get_mode
;   _PB_GetState
;   _PB_GetState
;   __divsint
;   _SSD_SetSymbol
;   __modsint
;   _SSD_SetSymbol
;   _SSD_SetSymbol
;   _SSD_SetSymbol
;   _TOGGLE_passed_value_to_SSD
;6 compiler assigned registers:
;   r0x1004
;   r0x1005
;   STK02
;   STK01
;   STK00
;   r0x1006
;; Starting pCode block
S_hours__hour_update	code
_hour_update:
; 2 exit points
;	.line	42; "hours.c"	if(get_mode()== normal)
	PAGESEL	_get_mode
	CALL	_get_mode
	PAGESEL	$
	BANKSEL	r0x1004
	MOVWF	r0x1004
	MOVF	r0x1004,W
	BTFSS	STATUS,2
	GOTO	_00144_DS_
;	.line	44; "hours.c"	one_second_time=0;
	BANKSEL	_one_second_time
	CLRF	_one_second_time
;	.line	46; "hours.c"	if( get_minutes() ==  60 && flag ){ if(hour < 24 ) {hour++;  }
	PAGESEL	_get_minutes
	CALL	_get_minutes
	PAGESEL	$
	BANKSEL	r0x1004
	MOVWF	r0x1004
	XORLW	0x3c
	BTFSS	STATUS,2
	GOTO	_00123_DS_
	BANKSEL	_flag
	MOVF	_flag,W
	BTFSC	STATUS,2
	GOTO	_00123_DS_
;;unsigned compare: left < lit(0x18=24), size=1
	MOVLW	0x18
	BANKSEL	_hour
	SUBWF	_hour,W
	BTFSC	STATUS,0
	GOTO	_00118_DS_
;;genSkipc:3307: created from rifx:00000000047A57B0
	INCF	_hour,F
	GOTO	_00119_DS_
_00118_DS_:
;	.line	47; "hours.c"	else {hour =0;}
	BANKSEL	_hour
	CLRF	_hour
_00119_DS_:
;	.line	48; "hours.c"	flag =0;
	BANKSEL	_flag
	CLRF	_flag
	GOTO	_00124_DS_
_00123_DS_:
;	.line	51; "hours.c"	else if(get_minutes() !=60 ){
	PAGESEL	_get_minutes
	CALL	_get_minutes
	PAGESEL	$
	BANKSEL	r0x1004
	MOVWF	r0x1004
;	.line	52; "hours.c"	flag =1;
	XORLW	0x3c
	BTFSC	STATUS,2
	GOTO	_00124_DS_
	MOVLW	0x01
	BANKSEL	_flag
	MOVWF	_flag
;;106	MOVF	_hour,W
_00124_DS_:
;	.line	56; "hours.c"	SSD_SetSymbol(SSD_L , hour/10 );
	BANKSEL	r0x1005
	CLRF	r0x1005
	MOVLW	0x0a
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
;;105	MOVF	r0x1004,W
	BANKSEL	_hour
	MOVF	_hour,W
	BANKSEL	r0x1004
	MOVWF	r0x1004
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	__divsint
	CALL	__divsint
	PAGESEL	$
	BANKSEL	r0x1005
	MOVWF	r0x1005
	MOVF	STK00,W
	MOVWF	r0x1004
	MOVWF	r0x1006
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_SSD_SetSymbol
	CALL	_SSD_SetSymbol
	PAGESEL	$
;;104	MOVF	_hour,W
;	.line	57; "hours.c"	SSD_SetSymbol(SSD_M ,  hour%10);
	BANKSEL	r0x1005
	CLRF	r0x1005
	MOVLW	0x0a
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
;;103	MOVF	r0x1004,W
	BANKSEL	_hour
	MOVF	_hour,W
	BANKSEL	r0x1004
	MOVWF	r0x1004
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	__modsint
	CALL	__modsint
	PAGESEL	$
	BANKSEL	r0x1005
	MOVWF	r0x1005
	MOVF	STK00,W
	MOVWF	r0x1004
	MOVWF	r0x1006
	MOVWF	STK00
	MOVLW	0x01
	PAGESEL	_SSD_SetSymbol
	CALL	_SSD_SetSymbol
	PAGESEL	$
	GOTO	_00146_DS_
_00144_DS_:
;	.line	61; "hours.c"	else if(get_mode()== setting_hour)
	PAGESEL	_get_mode
	CALL	_get_mode
	PAGESEL	$
	BANKSEL	r0x1004
	MOVWF	r0x1004
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00146_DS_
;	.line	63; "hours.c"	one_second_time++;
	BANKSEL	_one_second_time
	INCF	_one_second_time,F
;	.line	65; "hours.c"	if(PB_GetState(PB_MINUS) ==PB_PRE_PRESSED )
	MOVLW	0x01
	PAGESEL	_PB_GetState
	CALL	_PB_GetState
	PAGESEL	$
	BANKSEL	r0x1004
	MOVWF	r0x1004
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00130_DS_
;	.line	67; "hours.c"	if(hour == 0){  hour =23 ; }
	BANKSEL	_hour
	MOVF	_hour,W
	BTFSS	STATUS,2
	GOTO	_00127_DS_
	MOVLW	0x17
	MOVWF	_hour
	GOTO	_00130_DS_
_00127_DS_:
;	.line	68; "hours.c"	else          {  hour--;    }
	BANKSEL	_hour
	DECF	_hour,F
_00130_DS_:
;	.line	71; "hours.c"	if(PB_GetState(PB_PLUS) ==PB_PRE_PRESSED )
	MOVLW	0x00
	PAGESEL	_PB_GetState
	CALL	_PB_GetState
	PAGESEL	$
	BANKSEL	r0x1004
	MOVWF	r0x1004
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00135_DS_
;	.line	73; "hours.c"	if(  hour == 23){     hour =0;}
	BANKSEL	_hour
	MOVF	_hour,W
	XORLW	0x17
	BTFSS	STATUS,2
	GOTO	_00132_DS_
	CLRF	_hour
	GOTO	_00135_DS_
_00132_DS_:
;	.line	74; "hours.c"	else{                 hour++; }
	BANKSEL	_hour
	INCF	_hour,F
_00135_DS_:
;	.line	78; "hours.c"	if(SSD_data !=SSD_NULL)
	BANKSEL	_SSD_data
	MOVF	_SSD_data,W
;	.line	81; "hours.c"	SSD_SetSymbol(SSD_L ,   SSD_data/10 );
	XORLW	0x0a
	BTFSC	STATUS,2
	GOTO	_00137_DS_
;;102	MOVF	_SSD_data,W
	BANKSEL	r0x1005
	CLRF	r0x1005
	MOVLW	0x0a
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
;;101	MOVF	r0x1004,W
	BANKSEL	_SSD_data
	MOVF	_SSD_data,W
	BANKSEL	r0x1004
	MOVWF	r0x1004
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	__divsint
	CALL	__divsint
	PAGESEL	$
	BANKSEL	r0x1005
	MOVWF	r0x1005
	MOVF	STK00,W
	MOVWF	r0x1004
	MOVWF	r0x1006
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_SSD_SetSymbol
	CALL	_SSD_SetSymbol
	PAGESEL	$
;;100	MOVF	_SSD_data,W
;	.line	82; "hours.c"	SSD_SetSymbol(SSD_M,   SSD_data%10);
	BANKSEL	r0x1005
	CLRF	r0x1005
	MOVLW	0x0a
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
;;99	MOVF	r0x1004,W
	BANKSEL	_SSD_data
	MOVF	_SSD_data,W
	BANKSEL	r0x1004
	MOVWF	r0x1004
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	__modsint
	CALL	__modsint
	PAGESEL	$
	BANKSEL	r0x1005
	MOVWF	r0x1005
	MOVF	STK00,W
	MOVWF	r0x1004
	MOVWF	r0x1006
	MOVWF	STK00
	MOVLW	0x01
	PAGESEL	_SSD_SetSymbol
	CALL	_SSD_SetSymbol
	PAGESEL	$
	GOTO	_00138_DS_
_00137_DS_:
;	.line	88; "hours.c"	SSD_SetSymbol(SSD_L ,   SSD_data );
	BANKSEL	_SSD_data
	MOVF	_SSD_data,W
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_SSD_SetSymbol
	CALL	_SSD_SetSymbol
	PAGESEL	$
;	.line	89; "hours.c"	SSD_SetSymbol(SSD_M,   SSD_data);
	BANKSEL	_SSD_data
	MOVF	_SSD_data,W
	MOVWF	STK00
	MOVLW	0x01
	PAGESEL	_SSD_SetSymbol
	CALL	_SSD_SetSymbol
	PAGESEL	$
_00138_DS_:
;	.line	92; "hours.c"	if( one_second_time == NUM_OF_TICKS_PER_ONE_SECOND)
	BANKSEL	_one_second_time
	MOVF	_one_second_time,W
	XORLW	0x0a
	BTFSS	STATUS,2
	GOTO	_00146_DS_
;	.line	94; "hours.c"	TOGGLE_passed_value_to_SSD();
	PAGESEL	_TOGGLE_passed_value_to_SSD
	CALL	_TOGGLE_passed_value_to_SSD
	PAGESEL	$
;	.line	96; "hours.c"	one_second_time =0;
	BANKSEL	_one_second_time
	CLRF	_one_second_time
_00146_DS_:
;	.line	99; "hours.c"	}
	RETURN	
; exit point of _hour_update

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_hours__hour_init	code
_hour_init:
; 2 exit points
;	.line	33; "hours.c"	void hour_init(unsigned char init_hour)
	BANKSEL	_hour
	MOVWF	_hour
;	.line	37; "hours.c"	}
	RETURN	
; exit point of _hour_init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_hours__TOGGLE_passed_value_to_SSD	code
_TOGGLE_passed_value_to_SSD:
; 2 exit points
;	.line	21; "hours.c"	if(SSD_data ==  SSD_NULL)
	BANKSEL	_SSD_data
	MOVF	_SSD_data,W
	XORLW	0x0a
	BTFSS	STATUS,2
	GOTO	_00106_DS_
;	.line	23; "hours.c"	SSD_data =hour ;
	BANKSEL	_hour
	MOVF	_hour,W
	BANKSEL	_SSD_data
	MOVWF	_SSD_data
	GOTO	_00108_DS_
_00106_DS_:
;	.line	27; "hours.c"	SSD_data = SSD_NULL;
	MOVLW	0x0a
	BANKSEL	_SSD_data
	MOVWF	_SSD_data
_00108_DS_:
;	.line	30; "hours.c"	}
	RETURN	
; exit point of _TOGGLE_passed_value_to_SSD


;	code size estimation:
;	  164+   77 =   241 instructions (  636 byte)

	end
