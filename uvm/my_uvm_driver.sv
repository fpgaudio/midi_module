import uvm_pkg::*;

class my_uvm_driver extends uvm_driver#(my_uvm_transaction);

    `uvm_component_utils(my_uvm_driver)

    virtual my_uvm_if vif;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction: new

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        void'(uvm_resource_db#(virtual my_uvm_if)::read_by_name
            (.scope("ifs"), .name("vif"), .val(vif)));
    endfunction: build_phase

    virtual task run_phase(uvm_phase phase);
        drive();
    endtask: run_phase

    virtual task drive();
        my_uvm_transaction tx;

        // wait for reset
        @(posedge vif.reset)
        @(negedge vif.reset)

        vif.din = 1'b1;

        forever begin
            @(posedge vif.midi_clk) 
            begin                
                seq_item_port.get_next_item(tx);
                vif.din = tx.data;
                seq_item_port.item_done();
            end
        end
    endtask: drive

endclass
