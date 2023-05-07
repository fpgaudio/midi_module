`timescale 1ns/1ns
module midi_receiver_tb;

localparam IN_FILE_NAME = "/home/gfa2226/392/midas/tb/binary.txt";
localparam OUT_FILE_NAME = "/home/gfa2226/392/midas/tb/midi.txt";
localparam CMP_FILE_NAME = "/home/gfa2226/392/midas/tb/output.txt";

localparam CLK_PERIOD = 20;
localparam MIDI_CLK_PERIOD = 32000;

logic clk;
logic midi_clk;
logic reset;
logic din;
logic [7:0] dout;
logic rd_en;
logic empty;

logic in_write_done = '0;
logic out_read_done = '0;
integer out_errors = '0;

midi_top dut (
    .clk(clk),
    .reset(reset),
    .din(din),
    .dout(dout),
    .rd_en(rd_en),
    .empty(empty)
);

always begin
    clk = 1'b0;
    #(CLK_PERIOD / 2);
    clk = 1'b1;
    #(CLK_PERIOD / 2);
end

always begin
    midi_clk = 1'b0;
    #(MIDI_CLK_PERIOD / 2);
    midi_clk = 1'b1;
    #(MIDI_CLK_PERIOD / 2);
end

initial begin
    @(posedge clk);
    reset = 1'b1;
    @(posedge clk);
    reset = 1'b0;
end

initial begin : tb_process
    longint unsigned start_time, end_time;

    @(negedge reset);
    @(posedge clk);
    start_time = $time;

    // start
    $display("@ %0t: Beginning simulation...", start_time);
    wait(out_read_done);
    end_time = $time;

    // report metrics
    $display("@ %0t: Simulation complete.", end_time);
    $display("@ %0t: Simulation time: %0t ns", end_time, end_time - start_time);
    $display("@ %0t: Output errors: %0d", end_time, out_errors);
    $display("Total simulation cycle count: %0d", (end_time - start_time) / CLK_PERIOD);

    $finish;
end

initial begin : in_process
    int in_file;
    int i;
    int count;
    @(negedge reset);

    // open input file
    in_file = $fopen(IN_FILE_NAME, "rb");

    // read input file
    while (!$feof(in_file)) begin
        @(posedge midi_clk);
        count = $fscanf(in_file, "%1h", din);
        i++;
    end

    $display("@ %0t: Input file read complete.", $time);

    // close input file
    $fclose(in_file);

    // signal write done
    @(posedge clk);
    in_write_done = 1'b1;
end

initial begin : read_process
    int cmp_data;
    int out_file;
    int cmp_file;
    int i;
    logic [7:0] cmp_dout;
    @(negedge reset);
    @(negedge clk);

    $display("@ %0t: Comparing file %s...", $time, OUT_FILE_NAME);
    i = 0;
    out_file = $fopen(OUT_FILE_NAME, "w");
    cmp_file = $fopen(CMP_FILE_NAME, "r");

    while (i < 11) begin
        @(negedge clk);
        rd_en = 1'b0;
        if (empty == 1'b0) begin
            rd_en = 1'b1;
            cmp_data = $fscanf(cmp_file, "%2h", cmp_dout);
            $fwrite(out_file, "%2h\n", $unsigned(dout));
            if ($unsigned(cmp_dout) != $unsigned(dout)) begin
                out_errors += 1;
                $write("@ %0t: Output mismatch: %2h != %2h\n", $time, cmp_dout, $unsigned(dout));
            end
            i++;
        end
    end

    @(negedge clk);
    $fclose(out_file);
    $fclose(cmp_file);
    out_read_done = 1'b1;
end
endmodule