
#include"hours.h"
#include"DIG_CLK_modes.h"
#include"PB.h"
#include"SSD.h"
#include"minutes.h"
#include"port.h"
#define NUM_OF_TICKS_PER_ONE_SECOND 10

static unsigned char hour = 0  , flag = 1;



static unsigned char one_second_time =0  ;

static unsigned char SSD_data = SSD_NULL;

static void TOGGLE_passed_value_to_SSD(void)
{

    if(SSD_data ==  SSD_NULL)
    {
        SSD_data =hour ;
    }
    else
    {
        SSD_data = SSD_NULL;

    }
}


void hour_init(unsigned char init_hour)
{
     hour = init_hour;

     }

void hour_update(void)
{

if(get_mode()== normal)
{
    one_second_time=0;

    if( get_minutes() ==  60 && flag ){ if(hour < 24 ) {hour++;  }
                                                else {hour =0;}
                                                flag =0;

                                               }
                                               else if(get_minutes() !=60 ){
                                                flag =1;
                                               }


             SSD_SetSymbol(SSD_L , hour/10 );
             SSD_SetSymbol(SSD_M ,  hour%10);


}
else if(get_mode()== setting_hour)
{
    one_second_time++;

    if(PB_GetState(PB_MINUS) ==PB_PRE_PRESSED )
        {
            if(hour == 0){  hour =23 ; }
           else          {  hour--;    }
        }

      if(PB_GetState(PB_PLUS) ==PB_PRE_PRESSED )
        {
            if(  hour == 23){     hour =0;}
            else{                 hour++; }

        }

         if(SSD_data !=SSD_NULL)
                    {

             SSD_SetSymbol(SSD_L ,   SSD_data/10 );
             SSD_SetSymbol(SSD_M,   SSD_data%10);

                    }
                    else{


             SSD_SetSymbol(SSD_L ,   SSD_data );
             SSD_SetSymbol(SSD_M,   SSD_data);
             }

               if( one_second_time == NUM_OF_TICKS_PER_ONE_SECOND)
                 {
                    TOGGLE_passed_value_to_SSD();

                    one_second_time =0;
             }
}
}

unsigned char get_hour(void)
{

}
