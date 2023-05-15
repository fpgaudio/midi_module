/*
 Copyright (C) 2018  Intel Corporation. All rights reserved.
 Your use of Intel Corporation's design tools, logic functions 
 and other software and tools, and its AMPP partner logic 
 functions, and any output files from any of the foregoing 
 (including device programming or simulation files), and any 
 associated documentation or information are expressly subject 
 to the terms and conditions of the Intel Program License 
 Subscription Agreement, the Intel Quartus Prime License Agreement,
 the Intel FPGA IP License Agreement, or other applicable license
 agreement, including, without limitation, that your use is for
 the sole purpose of programming logic devices manufactured by
 Intel and sold by Intel or its authorized distributors.  Please
 refer to the applicable agreement for further details.
*/
MODEL
/*MODEL HEADER*/
/*
 This file contains Slow Corner delays for the design using part EP4CE115F29C7
 with speed grade 7, core voltage 1.2V, and temperature 85 Celsius

*/
MODEL_VERSION "1.0";
DESIGN "midi_module";
DATE "05/15/2023 16:52:46";
PROGRAM "Quartus Prime";



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
