
import uvm_pkg::*;
import my_uvm_package::*;

`include "my_uvm_if.sv"

`timescale 1 ns / 1 ns

module my_uvm_tb;

    my_uvm_if vif();

    midi_top dut (
        .clk(vif.clk),
        .reset(vif.reset),
        .din(vif.din),
        .dout(vif.dout),
        .rd_en(vif.rd_en),
        .empty(vif.empty)
    );

    initial begin
        // store the vif so it can be retrieved by the driver & monitor
        uvm_resource_db#(virtual my_uvm_if)::set
            (.scope("ifs"), .name("vif"), .val(vif));

        // run the test
        run_test("my_uvm_test");        
    end

    // reset
    initial begin
        vif.clk <= 1'b1;
        vif.midi_clk <= 1'b1;
        vif.reset <= 1'b0;
        @(posedge vif.clk);
        vif.reset <= 1'b1;
        @(posedge vif.clk);
        vif.reset <= 1'b0;
    end

    // 10ns clock
    always begin
        #(CLK_PERIOD/2) vif.clk = ~vif.clk;
    end
    
    always begin
        #(MIDI_CLK_PERIOD/2) vif.midi_clk = ~vif.midi_clk;
    end
endmodule






