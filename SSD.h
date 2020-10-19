#ifndef SSD_H_INCLUDED
#define SSD_H_INCLUDED

/************************(this enum is used to hold all SSD_(number))********************************/

typedef enum
{
    SSD_L,
    SSD_M,
    SSD_N,
    SSD_R

}tSSD;

/************************(this enum is used to hold all SSD_States)********************************/

typedef enum
{
    SSD_OFF = 0,
    SSD_ON
}tSSD_State;

/************************(this enum is used to hold all SSD_Symbols)********************************/

typedef enum
{
   SSD_0,
   SSD_1,
   SSD_2,
   SSD_3,
   SSD_4,
   SSD_5,
   SSD_6,
   SSD_7,
   SSD_8,
   SSD_9,
   SSD_NULL
}tSSD_Symbol;

/******************************************************************************************************
@brief : this function is used to initialize the ssd
@param : ssd >>>> of data type  >>>  tSSD   ,   initial_state >>>> of data type  >>>  tSSD_State   ,
         initial_symbol >>>> of data type  >>>  tSSD_Symbol
@ret   : t_Coller_Status >>> which contain the status of coller
*******************************************************************************************************/

void SSD_Init(tSSD ssd, tSSD_State initial_state, tSSD_Symbol initial_symbol);

/******************************************************************************************************
@brief : this function is used as task of ssd
@param : void
@ret   : void
*******************************************************************************************************/

void SSD_Update(void);
void SSD_Update_2(void);


/******************************************************************************************************
@brief : this function is used to set symbol of ssd
@param : ssd >>>> of data type  >>>  tSSD  , symbol >>>> of data type  >>>  tSSD_Symbol
@ret   : void
*******************************************************************************************************/

void SSD_SetSymbol(tSSD ssd, tSSD_Symbol symbol);

/******************************************************************************************************
@brief : this function is used to set state of ssd
@param :  ssd >>>> of data type  >>>  tSSD  , state >>>> of data type  >>>  tSSD_State
@ret   : void
*******************************************************************************************************/

void SSD_SetState(tSSD ssd, tSSD_State state);

/******************************************************************************************************
@brief : this function is used to get the ssd status
@param : ssd >>>> of data type  >>>  tSSD
@ret   : tSSD_Symbol >>> which contain the symbol of ssd
*******************************************************************************************************/

tSSD_Symbol SSD_GetSymbol(tSSD ssd);

/******************************************************************************************************
@brief : this function is used to get the ssd status
@param : ssd >>>> of data type  >>>  tSSD
@ret   : tSSD_State >>> which contain the status of the ssd
*******************************************************************************************************/

tSSD_State SSD_GetState(tSSD ssd);


#endif // SSD_H_INCLUDED
