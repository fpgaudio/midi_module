import uvm_pkg::*;


class my_uvm_transaction extends uvm_sequence_item;
    logic data;

    function new(string name = "");
        super.new(name);
    endfunction: new

    `uvm_object_utils_begin(my_uvm_transaction)
        `uvm_field_int(data, UVM_ALL_ON)
    `uvm_object_utils_end
endclass: my_uvm_transaction


class my_uvm_sequence extends uvm_sequence#(my_uvm_transaction);
    `uvm_object_utils(my_uvm_sequence)

    function new(string name = "");
        super.new(name);
    endfunction: new

    task body();        
        my_uvm_transaction tx;

        int i, n_lines;
        int in_file, throwaway;
        logic din;

        `uvm_info("SEQ_RUN", $sformatf("Loading file %s...", IN_FILE_NAME), UVM_LOW);

        in_file = $fopen(IN_FILE_NAME, "rb");

        if ( !in_file ) begin
            `uvm_fatal("SEQ_RUN", $sformatf("Failed to open file %s...", IN_FILE_NAME));
        end

        
        n_lines = 2079;

        i = 0;

        while ( i < n_lines ) begin
            tx = my_uvm_transaction::type_id::create(.name("tx"), .contxt(get_full_name()));
            start_item(tx);
            throwaway = $fscanf(in_file, "%1h", din);
            tx.data = din;
            finish_item(tx);
            i++;
        end

        `uvm_info("SEQ_RUN", $sformatf("Closing file %s...", IN_FILE_NAME), UVM_LOW);
        $fclose(in_file);
    endtask: body
endclass: my_uvm_sequence

typedef uvm_sequencer#(my_uvm_transaction) my_uvm_sequencer;
