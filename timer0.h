#ifndef TIMER0_H_INCLUDED
#define TIMER0_H_INCLUDED

/*****************************************************************************
@brief : this function is used to initialize timer0 module .
@param : void
@ret   : void
******************************************************************************/

void TMR0_Init(void);

/*************************************************************************************
@brief : this function is used to be called when  timer0 overflow interrupt happens .
@param : void
@ret   : void
***************************************************************************************/

void TMR0_Update(void) __interrupt 0;


/*****************************************************************************
@brief : thiD:\Embedded Amr_ali\digital clock\Digital_Clock\timr0.cs function is used to start timer0 module .
@param : void
@ret   : void
******************************************************************************/

void TMR0_Start(void);



#endif // TIMER0_H_INCLUDED
