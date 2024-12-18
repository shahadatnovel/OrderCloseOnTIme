//+------------------------------------------------------------------+
//|                                             OrderCloseOnTime.mq4 |
//|                                  Copyright 2024, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---

//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   int orderTicket = 12345;
   datetime closeTime =  D'2024.10.09 15:30';
   orderCloseTime(orderTicket,closeTime);
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---

  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool orderCloseTime(int orderTicket, datetime closeTime)
  {

   if(OrderSelect(orderTicket, SELECT_BY_POS))
  {
   if(TimeCurrent()>=closeTime)
        {
         double lots = OrderLots();
         double price = OrderClosePrice();
         int slippage = 3;

         if(OrderClose(orderTicket,lots,price,slippage,clrRed))
           {

            Print(orderTicket,TimeToStr(TimeCurrent()));
            return true;



           }
         else
           {
            Print(orderTicket,GetLastError());

           }


         return false;

        }

     }
















return 0;



  }
//+------------------------------------------------------------------+
