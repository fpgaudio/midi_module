module midi_top(
    input  logic clk,
    input  logic reset,
    input  logic din,
	output logic [6:0] segments_out_high,
	output logic [6:0] segments_out_low,
	output logic 		 led_high_bit,
	output logic 	    led_din
);

logic [7:0] midi_dout;
logic valid;
logic reset_n;
assign reset_n = ~reset;

midi_receiver midi (
    .clk(clk),
    .reset(reset_n),
    .din(din),
    .dout(midi_dout),
    .valid(valid)
);

led_dec led_high (
    .data_in(midi_dout[7:4]),
    .segments_out(segments_out_high),
    .valid_in(valid),
    .clk(clk),
    .reset(reset_n)
);

led_dec led_low (
	 .data_in(midi_dout[3:0]),
	 .segments_out(segments_out_low),
	 .valid_in(valid),
     .clk(clk),
     .reset(reset_n)
);

assign led_high_bit = 1'b1;
assign led_din = din;


endmodule
