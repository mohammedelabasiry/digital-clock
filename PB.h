#ifndef PB_H_INCLUDED
#define PB_H_INCLUDED

/************************ (this enum is used to hold push buttons name) *********************************************/

typedef enum
{
    PB_PLUS,
    PB_MINUS,
    PB_SET,
    PB_UNUSED_2
}tPB;

/************************ (this enum is used to hold push buttons state) *********************************************/

typedef enum
{
    PB_RELEASED,
    PB_PRE_PRESSED,
    PB_PRESSED,
    PB_PRE_RELEASED
}tPB_State;


/****************************************************************************************
@brief : this function is used to initialize certain push button   .
@param : tPB , pb , used to pass the push button that will be initialize .
         tPB_State , initial_state , used to pass the initial state of the push button
@ret   : void
******************************************************************************************/

void PB_Init(tPB pb, tPB_State initial_state);


/****************************************************************************************
@brief : this function is used as push button task (it will be called every 20ms)  .
@param : void .
@ret   : void.
******************************************************************************************/

void PB_Update(void);


/****************************************************************************************
@brief : this function is used to get the state of certain push button   .
@param : tPB , pb , used to pass the push button that will get its state  .
@ret   : tPB_State , it returns the state of pb button .
******************************************************************************************/

tPB_State PB_GetState(tPB pb);





#endif // PB_H_INCLUDED
