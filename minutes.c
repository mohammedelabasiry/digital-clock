
#include"minutes.h"
#include"DIG_CLK_modes.h"
#include"SSD.h"
#define  NUM_OFF_TICK_PER_minutes  50


#define NUM_OF_TICKS_PER_ONE_SECOND 10

static unsigned char one_second_time =0;

static unsigned char minutes = 0 ;

static unsigned int  minutes_time =0;

static unsigned char SSD_data = SSD_NULL;


static void TOGGLE_passed_value_to_SSD(void)
{

    if(SSD_data ==  SSD_NULL)
    {
        SSD_data = minutes ;
    }
    else
    {
        SSD_data = SSD_NULL;

    }



}

void minutes_init(unsigned char init_minutes)
{
    minutes=init_minutes;
}

void minutes_update(void)
{

    //minutes_time++;

if(get_mode()== normal)
{
        minutes_time++;    one_second_time =0;


    if(minutes_time ==  NUM_OFF_TICK_PER_minutes ){  if(minutes < 60 ) {minutes++; }
                                                     else              {minutes =0;}
                                                      minutes_time=0;
                                                  }


             SSD_SetSymbol(SSD_N , minutes/10 );
             SSD_SetSymbol( SSD_R, minutes%10);


}
else if(get_mode()== settting_minutes)
{
     one_second_time++;
    if(PB_GetState(PB_MINUS) ==PB_PRE_PRESSED )
        {
            if(minutes == 0){ minutes =60 ; }
            else             { minutes--;    }
        }

      if(PB_GetState(PB_PLUS) ==PB_PRE_PRESSED )
        {
            if(  minutes == 60){    minutes =0;}
            else{                   minutes++; }

        }
                    minutes_time=0;

                    if(SSD_data !=SSD_NULL)
                    {

             SSD_SetSymbol(SSD_N ,   SSD_data/10 );
             SSD_SetSymbol(SSD_R,   SSD_data%10);

                    }
                    else{


             SSD_SetSymbol(SSD_N ,   SSD_data );
             SSD_SetSymbol(SSD_R,   SSD_data);
             }

               if( one_second_time == NUM_OF_TICKS_PER_ONE_SECOND)
                 {
                    TOGGLE_passed_value_to_SSD();

                    one_second_time =0;
             }


}


}

unsigned char get_minutes(void)
{
    return minutes ;
}
