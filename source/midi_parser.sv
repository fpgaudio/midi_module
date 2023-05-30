module midi_parser (
    input  logic clk,
    input  logic rst,
    input  logic [7:0]  midi_in,

    output logic        note_on,
    output logic [6:0]  midi_key,
    output logic [6:0]  midi_vel,
    output logic        midi_valid
);

typedef enum logic [2:0] { init, wait_for_status_in, read_key, read_vel, output_state } state_t;
state_t state, state_c;

logic [7:0] status_byte, status_byte_c;
logic [6:0] key_byte, key_byte_c;
logic [6:0] vel_byte, vel_byte_c;
logic note_on_c;

always_ff @( posedge clk or posedge rst ) begin
    if (reset == 1'b1) begin
        state <= init;
        status_byte <= 0;
        key_byte <= 0;
        vel_byte <= 0;
        note_on <= 0;
    end else begin
        state <= state_c;
        status_byte <= status_byte_c;
        key_byte <= key_byte_c;
        vel_byte <= vel_byte_c;
        note_on <= note_on_c;
    end
end

always_comb begin
    status_byte_c = status_byte;
    key_byte_c = key_byte;
    vel_byte_c = vel_byte;
    midi_valid = 1'b0;
    note_on_c = note_on;
    state_c = state;
    midi_key = key_byte;
    midi_vel = vel_byte;

    case(state)
        init: begin
            state_c = wait_for_status_in;
            status_byte_c = 0;
            key_byte_c = 0;
            vel_byte_c = 0;
            note_on_c = 0;
        end

        wait_for_status_in: begin
            if (midi_in[7] == 1'b1) begin
                state_c = read_key;
                status_byte_c = midi_in;
            end else begin
                state_c = wait_for_status_in;
                status_byte_c = 0;
            end
        end

        read_key: begin
            if (midi_in[7] == 1'b0) begin
                state_c = read_vel;
                key_byte_c = midi_in[6:0];
            end else begin
                state_c = read_key;
                key_byte_c = 0;
            end
        end

        read_vel: begin
            if (midi_in[7] == 1'b0) begin
                state_c = output_state;
                vel_byte_c = midi_in[6:0];
            end else begin
                state_c = read_vel;
                vel_byte_c = 0;
            end
        end

        output_state: begin
            note_on_c = status_byte[4];
            midi_key = key_byte;
            midi_vel = vel_byte;
            midi_valid = 1'b1;
            state_c = wait_for_status_in;
            status_byte_c = 0;
            key_byte_c = 0;
            vel_byte_c = 0;
        end

        default: begin
            state_c = init;
            status_byte_c = 0;
            key_byte_c = 0;
            vel_byte_c = 0;
            note_on_c = 0;
            midi_valid = 1'b0;
            midi_key = 0;
            midi_vel = 0;

        end
    endcase
end

endmodule