#ifndef HOURS_H_INCLUDED
#define HOURS_H_INCLUDED

#include"gpio.h"
void hour_init(unsigned char init_hour);

void hour_update(void);

unsigned char get_hour(void);




#endif // HOURS_H_INCLUDED
