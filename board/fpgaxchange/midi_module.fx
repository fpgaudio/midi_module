###############################################################################
# Copyright (C) 1991-2023 Altera Corporation. All rights reserved.
# Any  megafunction  design,  and related netlist (encrypted  or  decrypted),
# support information,  device programming or simulation file,  and any other
# associated  documentation or information  provided by  Intel  or a partner
# under  Intel's   Megafunction   Partnership   Program  may  be  used  only
# to program  PLD  devices (but not masked  PLD  devices) from  Intel.   Any
# other  use  of such  megafunction  design,  netlist,  support  information,
# device programming or simulation file,  or any other  related documentation
# or information  is prohibited  for  any  other purpose,  including, but not
# limited to  modification,  reverse engineering,  de-compiling, or use  with
# any other  silicon devices,  unless such use is  explicitly  licensed under
# a separate agreement with  Intel  or a megafunction partner.  Title to the
# intellectual property,  including patents,  copyrights,  trademarks,  trade
# secrets,  or maskworks,  embodied in any such megafunction design, netlist,
# support  information,  device programming or simulation file,  or any other
# related documentation or information provided by  Intel  or a megafunction
# partner, remains with Intel, the megafunction partner, or their respective
# licensors. No other licenses, including any licenses needed under any third
# party's intellectual property, are provided herein.
#
###############################################################################


# FPGA Xchange file generated using Quartus Prime Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition

# DESIGN=midi_module
# REVISION=midi_module
# DEVICE=EP4CE115
# PACKAGE=FBGA
# SPEEDGRADE=7

Signal Name,Pin Number,Direction,IO Standard,Drive (mA),Termination,Slew Rate,Swap Group,Diff Type

segments_out_high[0],M24,output,2.5 V,Default,Series 50 Ohm without Calibration,FAST,swap_0,--
segments_out_high[1],Y22,output,2.5 V,Default,Series 50 Ohm without Calibration,FAST,swap_0,--
segments_out_high[2],W21,output,2.5 V,Default,Series 50 Ohm without Calibration,FAST,swap_0,--
segments_out_high[3],W22,output,2.5 V,Default,Series 50 Ohm without Calibration,FAST,swap_0,--
segments_out_high[4],W25,output,2.5 V,Default,Series 50 Ohm without Calibration,FAST,swap_0,--
segments_out_high[5],U23,output,2.5 V,Default,Series 50 Ohm without Calibration,FAST,swap_0,--
segments_out_high[6],U24,output,2.5 V,Default,Series 50 Ohm without Calibration,FAST,swap_0,--
segments_out_low[0],G18,output,2.5 V,Default,Series 50 Ohm without Calibration,FAST,swap_0,--
segments_out_low[1],F22,output,2.5 V,Default,Series 50 Ohm without Calibration,FAST,swap_0,--
segments_out_low[2],E17,output,2.5 V,Default,Series 50 Ohm without Calibration,FAST,swap_0,--
segments_out_low[3],L26,output,2.5 V,Default,Series 50 Ohm without Calibration,FAST,swap_0,--
segments_out_low[4],L25,output,2.5 V,Default,Series 50 Ohm without Calibration,FAST,swap_0,--
segments_out_low[5],J22,output,2.5 V,Default,Series 50 Ohm without Calibration,FAST,swap_0,--
segments_out_low[6],H22,output,2.5 V,Default,Series 50 Ohm without Calibration,FAST,swap_0,--
led_high_bit,F19,output,2.5 V,Default,Series 50 Ohm without Calibration,FAST,swap_0,--
led_din,G19,output,2.5 V,Default,Series 50 Ohm without Calibration,FAST,swap_0,--
din,J10,input,2.5 V,,Off,--,swap_1,--
clk,Y2,input,2.5 V,,Off,--,swap_1,--
reset,M23,input,2.5 V,,Off,--,swap_1,--
~ALTERA_ASDO_DATA1~,F4,input,2.5 V,,Off,--,NOSWAP,--
~ALTERA_FLASH_nCE_nCSO~,E2,input,2.5 V,,Off,--,NOSWAP,--
~ALTERA_DCLK~,P3,output,2.5 V,Default,Off,FAST,NOSWAP,--
~ALTERA_DATA0~,N7,input,2.5 V,,Off,--,NOSWAP,--
~ALTERA_nCEO~,P28,output,2.5 V,8,Off,FAST,NOSWAP,--
