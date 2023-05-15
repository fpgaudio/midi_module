


INPUT reset;
INPUT clk;
INPUT din;
OUTPUT segments_out_high[0];
OUTPUT segments_out_high[1];
OUTPUT segments_out_high[2];
OUTPUT segments_out_high[3];
OUTPUT segments_out_high[4];
OUTPUT segments_out_high[5];
OUTPUT segments_out_high[6];
OUTPUT segments_out_low[0];
OUTPUT segments_out_low[1];
OUTPUT segments_out_low[2];
OUTPUT segments_out_low[3];
OUTPUT segments_out_low[4];
OUTPUT segments_out_low[5];
OUTPUT segments_out_low[6];
OUTPUT led_high_bit;
OUTPUT led_din;

/*Arc definitions start here*/
pos_din__SYSCLK__setup:		SETUP (POSEDGE) din SYSCLK ;
pos_reset__SYSCLK__setup:		SETUP (POSEDGE) reset SYSCLK ;
pos_din__SYSCLK__hold:		HOLD (POSEDGE) din SYSCLK ;
pos_reset__SYSCLK__hold:		HOLD (POSEDGE) reset SYSCLK ;
pos_SYSCLK__segments_out_high[0]__delay:		DELAY (POSEDGE) SYSCLK segments_out_high[0] ;
pos_SYSCLK__segments_out_high[1]__delay:		DELAY (POSEDGE) SYSCLK segments_out_high[1] ;
pos_SYSCLK__segments_out_high[2]__delay:		DELAY (POSEDGE) SYSCLK segments_out_high[2] ;
pos_SYSCLK__segments_out_high[3]__delay:		DELAY (POSEDGE) SYSCLK segments_out_high[3] ;
pos_SYSCLK__segments_out_high[4]__delay:		DELAY (POSEDGE) SYSCLK segments_out_high[4] ;
pos_SYSCLK__segments_out_high[5]__delay:		DELAY (POSEDGE) SYSCLK segments_out_high[5] ;
pos_SYSCLK__segments_out_high[6]__delay:		DELAY (POSEDGE) SYSCLK segments_out_high[6] ;
pos_SYSCLK__segments_out_low[0]__delay:		DELAY (POSEDGE) SYSCLK segments_out_low[0] ;
pos_SYSCLK__segments_out_low[1]__delay:		DELAY (POSEDGE) SYSCLK segments_out_low[1] ;
pos_SYSCLK__segments_out_low[2]__delay:		DELAY (POSEDGE) SYSCLK segments_out_low[2] ;
pos_SYSCLK__segments_out_low[3]__delay:		DELAY (POSEDGE) SYSCLK segments_out_low[3] ;
pos_SYSCLK__segments_out_low[4]__delay:		DELAY (POSEDGE) SYSCLK segments_out_low[4] ;
pos_SYSCLK__segments_out_low[5]__delay:		DELAY (POSEDGE) SYSCLK segments_out_low[5] ;
pos_SYSCLK__segments_out_low[6]__delay:		DELAY (POSEDGE) SYSCLK segments_out_low[6] ;
___8.542__delay:		DELAY  8.542 ;

ENDMODEL
