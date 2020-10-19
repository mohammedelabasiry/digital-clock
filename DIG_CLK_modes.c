


#include"DIG_CLK_modes.h"
#include"PB.h"

static DIG_CLK_modes sys_mode = normal;

void DIG_CLK_init(DIG_CLK_modes init_mode)
{
    sys_mode = init_mode ;

}

void DIG_CLK_update(void)
{

switch(sys_mode)
{

case normal:
        if(PB_GetState( PB_SET) ==  PB_PRE_PRESSED)  sys_mode = setting_hour ;

    break;
case setting_hour:
    if(PB_GetState( PB_SET) ==  PB_PRE_PRESSED)  sys_mode = settting_minutes ;
    break ;
case settting_minutes :
        if(PB_GetState( PB_SET) ==  PB_PRE_PRESSED)  sys_mode =  normal ;

    break;

default:
    break;


}
}


DIG_CLK_modes get_mode(void)
{

return sys_mode ;

}
