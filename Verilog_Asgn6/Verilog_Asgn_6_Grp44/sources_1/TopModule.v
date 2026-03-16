`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2025 14:13:49
// Design Name: 
// Module Name: TopModule
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module TopModule(led,sw,clk,rst);
input  wire clk,rst;
input  wire [15:0] sw;
output wire [15:0] led;

localparam MASTER_KEY = 16'h2D65;
// FSM state defs
localparam S_IDLE         = 4'b0000;
localparam S_PRE_ROUND    = 4'b0001;
localparam S_R1_SBOX      = 4'b0010;
localparam S_R1_SHIFT     = 4'b0011;
localparam S_R1_MIX       = 4'b0100;
localparam S_R1_ADD_KEY   = 4'b0101;
localparam S_R2_SBOX      = 4'b0110;
localparam S_R2_SHIFT     = 4'b0111;
localparam S_R2_ADD_KEY   = 4'b1000;
localparam S_DONE         = 4'b1001;

reg [3:0] curr_state, next_state;

reg [15:0] state_reg,state_next;

wire [15:0] key0,key1,key2;
wire [15:0] selected_RKey;

wire [15:0] sbox_out;
wire [15:0] shift_rows_out;
wire [15:0] mix_cols_out;
wire [15:0] add_round_key_out;

reg [1:0] key_select; 
reg sbox_ena;

KeyExpansion keyGen(key0,key1,key2,MASTER_KEY,clk,1'b1);

NibbleSub  SBox(sbox_out,state_reg,clk,sbox_ena);

AddRoundKey  xorkey(add_round_key_out,state_reg,selected_RKey);

ShiftRows  shiftrows(shift_rows_out,state_reg);

MixColumns  mixcolumns(mix_cols_out,state_reg);

always @(posedge clk  or posedge rst)
    begin
        if(rst) state_reg<=16'b0;
        else state_reg<=state_next;
    end
    
assign selected_RKey = (key_select == 2'b00) ? key0 :
                       (key_select == 2'b01) ? key1:
                       (key_select == 2'b10) ? key2 :16'b0;
    
always @(*)begin
    case (curr_state)
        S_IDLE:       state_next = sw;
        S_PRE_ROUND:  state_next = add_round_key_out;
        S_R1_SBOX:    state_next = sbox_out;
        S_R1_SHIFT:   state_next = shift_rows_out;
        S_R1_MIX:     state_next = mix_cols_out;
        S_R1_ADD_KEY: state_next = add_round_key_out;
        S_R2_SBOX:    state_next = sbox_out;
        S_R2_SHIFT:   state_next = shift_rows_out;
        S_R2_ADD_KEY: state_next = add_round_key_out;
        S_DONE:       state_next = state_reg; // Hold the final value
        default:      state_next = state_reg; // Default case to prevent latches
    endcase
end

assign led = state_reg;

always @(posedge rst or posedge clk)begin
    if (rst) curr_state <= S_IDLE;
    else curr_state <= next_state;
end

always @(*)begin
    case(curr_state)
        S_IDLE:       next_state = S_PRE_ROUND;
        S_PRE_ROUND:  next_state = S_R1_SBOX;
        S_R1_SBOX:    next_state = S_R1_SHIFT;
        S_R1_SHIFT:   next_state = S_R1_MIX;
        S_R1_MIX:     next_state = S_R1_ADD_KEY;
        S_R1_ADD_KEY: next_state = S_R2_SBOX;
        S_R2_SBOX:    next_state = S_R2_SHIFT;
        S_R2_SHIFT:   next_state = S_R2_ADD_KEY;
        S_R2_ADD_KEY: next_state = S_DONE;
        S_DONE:       next_state = S_DONE; 
        default:      next_state = S_IDLE;
    endcase
end

always @(*) begin
    key_select = 2'bxx; // 'x' is good for signals that don't matter
    sbox_ena   = 1'b0;

    case (curr_state)
        S_PRE_ROUND:  key_select = 2'b00; 
        S_R1_SBOX:    sbox_ena   = 1'b1;        
        S_R1_ADD_KEY: key_select = 2'b01; // Select K1        
        S_R2_SBOX:    sbox_ena   = 1'b1; 
        S_R2_ADD_KEY: key_select = 2'b10; // Select K2
       
        default: ; 
    endcase
end
 
endmodule
