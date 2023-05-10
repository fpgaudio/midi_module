module led_dec(
    input  logic [3:0]  data_in,
    output logic [6:0]  segments_out,
    input  logic        valid_in
);


always_ff @(posedge valid_in) begin
    case (data_in)
        4'h0: segments_out = 7'b1000000;
        4'h1: segments_out = 7'b1111001;
        4'h2: segments_out = 7'b0100100;
        4'h3: segments_out = 7'b0110000;
        4'h4: segments_out = 7'b0011001;
        4'h5: segments_out = 7'b0010010;
        4'h6: segments_out = 7'b0000010;
        4'h7: segments_out = 7'b1111000;
        4'h8: segments_out = 7'b0000000;
        4'h9: segments_out = 7'b0011000;
        4'ha: segments_out = 7'b0001000;
        4'hb: segments_out = 7'b0000011;
        4'hc: segments_out = 7'b0100111;
        4'hd: segments_out = 7'b0100001;
        4'he: segments_out = 7'b0000110;
        default: segments_out = 7'b0001110;
    endcase
end

endmodule
