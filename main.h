#ifndef MAIN_H_INCLUDED
#define MAIN_H_INCLUDED

#include"pic16f877a.h"

/*****************************   Std_Types    ********************/
typedef unsigned char uint8;
typedef unsigned short uint16;
typedef unsigned long uint32;
//typedef unsigned long long uint64;
typedef  char sint8;
typedef  short sint16;
typedef  long sint32;
//typedef  long long sint64;

/*****************************   GPIO_typedef    ********************/

typedef enum
{
   PORT_A,
   PORT_B,
   PORT_C,
   PORT_D,
   PORT_E
}tPort;


/*****************************   Adc_macros   ********************/

#define ADC_SELECT_CHANNEL(channel)	                (CHS2 = ((channel & 0x4) >> 2));\
                                                    (CHS1 = ((channel & 0x2) >> 1));\
                                                    (CHS0 = (channel & 0x1))


#define ADC_SET_STATE(x)	                            (ADON = x)


#define ADC_SELECT_VREFP(x)
#define ADC_SELECT_VREFN(x)

#define ADC_SELECT_RESULT_JUSTIFICATION(justification)	(ADFM = justification)

#define ADC_READ_RESULT(justification)                  (justification)?(((unsigned int)((unsigned int)ADRESH)<<8)|(ADRESL)):((((unsigned int)ADRESH)<<2)|(ADRESL>>6))

#define ADC_START_CONVERSION()                          (GO = 1)

#define ADC_WAIT_FOR_RESULT()	                        while(GO == 1)

#define ADC_SELECT_CLOCK_SOURCE(clock)	                (ADCS2 = ((clock) & 0x4 ) >> 2);\
										                (ADCS1 = ((clock) & 0x2 ) >> 1);\
										                (ADCS0 = (clock) & 0x1)


#define ADC_CONFIGURE_PORT()                             PCFG3 = 0;\
                                                         PCFG2 = 0;\
                                                         PCFG1 = 1;\
                                                         PCFG0 = 0

/*****************************   timer_0_macros    ********************/

#define TMR0_TICK_MS                (5)

#define TMR0_SET_PRE_SCALER(x) 		PSA = 0;\
									PS0 = (x&0x1);\
									PS1 = (x&0x2)>>1;\
									PS2 = (x&0x4)>>2;

#define TMR0_CHECK_FLAG()			(TMR0IF)

#define TMR0_CLEAR_FLAG()			(TMR0IF = 0)


#define TMR0_SELECT_CLOCK_SOURCE(y)	(T0CS = y)

#define TMR0_SELECT_EDGE(z)			(T0SE = z)

#define TMR0_READ_COUNTER()			(TMR0)
#define TMR0_SET_TIME_MS(t)			(TMR0 = 256 - 8*t)

#define TMR0_SET_INT_STATE(x)		(TMR0IE = x)

#define TMR0_SET_STATE(x)			(T0CS = x)


#endif // MAIN_H_INCLUDED
