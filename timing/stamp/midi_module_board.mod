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
DATE "05/10/2023 17:00:46";
PROGRAM "Quartus Prime";



INPUT din;
INPUT reset;
INPUT clk;
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

/*Arc definitions start here*/

ENDMODEL
