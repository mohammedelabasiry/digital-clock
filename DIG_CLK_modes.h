#ifndef DIG_CLK_MODES_H_INCLUDED
#define DIG_CLK_MODES_H_INCLUDED




typedef enum{
    normal ,
    setting_hour,
    settting_minutes,



}DIG_CLK_modes;

void DIG_CLK_update(void);

void DIG_CLK_init(DIG_CLK_modes init_mode);

DIG_CLK_modes get_mode(void);








#endif // DIG_CLK_MODES_H_INCLUDED
