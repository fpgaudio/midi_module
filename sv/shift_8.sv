module shift_8 (
    input  logic clk,
    input  logic reset,
    input  logic in,
    input  logic shift_en,
    output logic [7:0] out
);

logic [7:0] buffer;

always_ff @(posedge clk or posedge reset) begin
    if (reset == 1'b1) begin
        buffer <= 8'b0;
    end else if (shift_en == 1'b1) begin
        buffer <= {in, buffer[7:1]};
    end else begin
        buffer <= buffer;
    end
end

assign out = buffer;

endmodule