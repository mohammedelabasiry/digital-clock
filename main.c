
#include"main.h"
#include"timer0.h"
#include"SSD.h"
#include"PB.h"
#include"port.h"
#include"minutes.h"
#include"hours.h"
#include"DIG_CLK_modes.h"


unsigned int  __at(0x2007) CONFIG = _HS_OSC & _WDT_OFF & _PWRTE_ON & _BODEN_OFF & _LVP_OFF & _CPD_OFF & _WRT_OFF & _DEBUG_OFF & _CP_OFF;


void main(void)
{
    PB_Init(PB_MINUS ,   PB_RELEASED);
    PB_Init(PB_PLUS  ,   PB_RELEASED);
    PB_Init(PB_SET   ,   PB_RELEASED);

    /****************************************************************************/

    SSD_Init( SSD_L  , SSD_OFF  ,    SSD_NULL);
    SSD_Init( SSD_R  , SSD_OFF  ,    SSD_NULL);
    SSD_Init( SSD_M  , SSD_OFF  ,    SSD_NULL);
    SSD_Init( SSD_N  , SSD_OFF  ,    SSD_NULL);

   /*******************************************************************************/
   DIG_CLK_init(normal);
   hour_init(20);
   minutes_init(40);
  /******************************************************************************/
  TMR0_Init();
  TMR0_Start();



    while(1)
    {

    }


}
