module midi_top(
    input  logic clk,
    input  logic reset,
    input  logic din,
   // output logic [7:0] dout,
  //  input  logic rd_en,
   // output logic empty,
	 output logic [6:0] segments_out_high,
	 output logic [6:0] segments_out_low
);

logic [7:0] midi_dout;
// logic full = 1'b0;
logic valid;

midi_receiver midi (
    .clk(clk),
    .reset(reset),
    .din(din),
    .dout(midi_dout),
    .valid(valid)
    // .fifo_full(full)
);

// fifo #(
//     .FIFO_DATA_WIDTH(8),
//     .FIFO_BUFFER_SIZE(16)
// ) out_fifo (
//     .reset(reset),
//     .wr_clk(clk),
//     .wr_en(valid),
//     .din(midi_dout),
//     .full(full),
//     .rd_clk(clk),
//     .rd_en(rd_en),
//     .dout(dout),
//     .empty(empty)
// );

led_dec led_high (
    .data_in(midi_dout[7:4]),
    .segments_out(segments_out_high),
    .valid_in(valid)
);

led_dec led_low (
	 .data_in(midi_dout[3:0]),
	 .segments_out(segments_out_low),
	 .valid_in(valid)
);


// assign dout = '0;
// assign empty = '0;


endmodule
