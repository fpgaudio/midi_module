module midi_receiver#(
    parameter CYCLES_PER_BIT = 1600
) (
    input  logic clk,
    input  logic reset,
    input  logic din,
    output logic [7:0] dout,
    output logic valid
);

// MIDI receive state machine taking in a serial MIDI byte and outputting a parallel byte
// MIDI byte is 10 bits long, 1 start bit, 8 data bits, 1 stop bit
// MIDI byte is received LSB first
// MIDI byte is received at 31250 baud
// Input clock is 50 MHz
// MIDI byte is buffered in a register and then output on the next clock cycle

// MIDI receive state machine states
typedef enum logic [2:0] {
    IDLE,
    START,
    DATA,
    STOP,
    WAIT
} state_t;

// MIDI receive state machine state register
state_t state, state_c;

// buffer wires
logic shift_en, buffer_reset;
logic [7:0] buffer_out;

// cycle counter needs to get up to 1600 to get 31250 baud
logic [10:0] cycle_count, cycle_count_c;

// bit counter
logic [2:0] bit_count, bit_count_c;

// output register
logic [7:0] dout_c;

// valid register
logic valid_c;

shift_8 buffer(
    .clk(clk),
    .reset(buffer_reset),
    .in(din),
    .shift_en(shift_en),
    .out(buffer_out)
);

// MIDI receive state machine
always_ff @(posedge clk) begin
    if (reset) begin
        state <= IDLE;
        cycle_count <= '0;
        dout <= '0;
        valid <= '0;
        bit_count <= '0;
    end else begin
        state <= state_c;
        cycle_count <= cycle_count_c;
        dout <= dout_c;
        valid <= valid_c;
        bit_count <= bit_count_c;
    end
end

always_comb begin
	dout_c = '0;
	valid_c = '0;
	shift_en = 1'b0;
	buffer_reset = 1'b0;
	state_c = state;
	cycle_count_c = '0;
	bit_count_c = bit_count;
		
	case (state)
        IDLE: begin
            cycle_count_c = '0;
            bit_count_c = '0;
            if (din == 0) begin
                state_c = START;
            end else begin
                state_c = IDLE;
            end
        end

        START: begin
            bit_count_c = '0;
            cycle_count_c = cycle_count + 11'd1;
            if (cycle_count == ((CYCLES_PER_BIT / 2) - 1)) begin
                cycle_count_c = '0;
                state_c = DATA;
            end else begin
                state_c = START;
            end
        end

        DATA: begin
            cycle_count_c = cycle_count + 11'd1;
            if (cycle_count == CYCLES_PER_BIT - 1) begin
                cycle_count_c = '0;
                shift_en = 1'b1;
                bit_count_c = (bit_count + 3'b1);
                if (bit_count == 6) begin
                    state_c = STOP;
                    bit_count_c = '0;
                end else begin
                    state_c = DATA;
                end
                
            end else begin
                bit_count_c = bit_count;
                state_c = DATA;
            end
        end

        STOP: begin
            // if (fifo_full == 1'b0) begin
                state_c = WAIT;
                dout_c = buffer_out;
                valid_c = '1;
            // end else begin
                // state_c = STOP;
            // end
        end

        WAIT: begin
            buffer_reset = 1'b1;
            cycle_count_c = cycle_count + 11'd1;
            if (cycle_count == CYCLES_PER_BIT - 1) begin
                state_c = IDLE;
            end else begin
                state_c = WAIT;
            end
        end

        default: begin
            state_c = IDLE;
            valid_c = '0;
            dout_c = '0;
            cycle_count_c = '0;
            bit_count_c = '0;
        end
    endcase
end

endmodule
