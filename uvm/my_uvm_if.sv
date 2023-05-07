import uvm_pkg::*;

interface my_uvm_if;
    logic       clk;
    logic       reset;
    logic       din;
    logic [7:0] dout;
    logic       rd_en;
    logic       empty;
    logic       midi_clk;
endinterface
