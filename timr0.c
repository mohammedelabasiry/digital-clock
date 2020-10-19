#include"PB.h"
#include"SSD.h"
#include"minutes.h"
#include"hours.h"
#include"DIG_CLK_modes.h"
#include"timer0.h"
#include"port.h"

void TMR0_Init(void)
{
    TMR0_SET_STATE(1);          // TMR0 is off
    TMR0_SET_PRE_SCALER(7);     // N = 256

}

void TMR0_Start(void)
{

    TMR0_SET_INT_STATE(1);
    GIE = 1;
    TMR0_SELECT_CLOCK_SOURCE(0); // Internal oscillator
    TMR0_SET_STATE(0);          // TMR0 is on
}


void TMR0_Update(void) __interrupt 0 // @ 5 ms
{


    static unsigned char counter = 0;

    counter++;

    /* Tasks */
    if (counter == 5)
    {
        PB_Update();    // read push buttons --> 0 & 2 ---> then update samples
        DIG_CLK_update();
        minutes_update();
        hour_update();
        counter = 0;
    }

    if(get_mode() == normal)
    {
         SSD_Update_2();
    }
    else{
                SSD_Update();   // put the output module task first

    }




    TMR0_CLEAR_FLAG();
    TMR0_SET_TIME_MS(TMR0_TICK_MS);

    return;
}
