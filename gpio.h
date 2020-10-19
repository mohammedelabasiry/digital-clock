#ifndef GPIO_H_INCLUDED
#define GPIO_H_INCLUDED

#include"gpio.h"
#include"main.h"
typedef enum
{
    GPIO_OUT = 0,
    GPIO_IN = 1
}tPortDirection;



/***********************************************************************************************
@brief : this function is used to initialize the direction of certain pin in a certain port   .
@param : tPort ,port , used to pass the port name  .
         unsigned char , pin, used to pass the pin number .
         tPortDirection ,direction , used to pass the direction .
@ret   : void
************************************************************************************************/

void GPIO_InitPortPin(tPort port, unsigned char pin, tPortDirection direction);




/***********************************************************************************************
@brief : this function is used to initialize the direction of certain port   .
@param : tPort ,port , used to pass the port name  .
         tPortDirection ,direction , used to pass the direction .
@ret   : void
************************************************************************************************/

void GPIO_InitPort(tPort port, tPortDirection direction);



/***********************************************************************************************
@brief : did not used yet   .
@param : void  .
@ret   : void
************************************************************************************************/

void GPIO_Update(void);



/***********************************************************************************************
@brief : this function is used to set certain pin in a certain port   .
@param : tPort ,port , used to pass the port name  .
         unsigned char , pin, used to pass the pin number .
          unsigned char ,state , used to pass the state (0 or 1) .
@ret   : void
************************************************************************************************/

void GPIO_SetPortPinState(tPort port, unsigned char pin, unsigned char state);



/***********************************************************************************************
@brief : this function is used to set  a certain port   .
@param : tPort ,port , used to pass the port name  .
          unsigned char ,state , used to pass the state (0 or 1) .
@ret   : void
************************************************************************************************/

void GPIO_SetPortState(tPort port, unsigned char state);



/***********************************************************************************************
@brief : this function is used to get the state of a certain pin in a certain port  .
@param : tPort ,port , used to pass the port name  .
         unsigned char , pin, used to pass the pin number .
@ret   : void
************************************************************************************************/

unsigned char GPIO_GetPortPinState(tPort port, unsigned char pin);


#endif // GPIO_H_INCLUDED
