`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.08.2025 16:41:39
// Design Name: 
// Module Name: KeyExpansion
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
module gval(out,in,rcon,clk,ena);
input [7:0] in,rcon;
output [7:0] out;
input clk,ena;

wire [3:0] temp00,temp01,temp10,temp11;
assign temp00 = in[7:4];
assign temp01 = in[3:0];
Sbox_ROM s1 (
  .clka(clk),    // input wire clka
  .ena(ena),      // input wire ena
  .addra(temp01),  // input wire [3 : 0] addra
  .douta(temp11)  // output wire [3 : 0] douta
);
Sbox_ROM s0 (
  .clka(clk),    // input wire clka
  .ena(ena),      // input wire ena
  .addra(temp00),  // input wire [3 : 0] addra
  .douta(temp10)  // output wire [3 : 0] douta
);

wire [7:0] temp2;
assign temp2 = {temp11,temp10};

assign out = temp2 ^ rcon;
endmodule

module KeyExpansion(key0,key1,key2,masterKey,clk,ena);
input [15:0] masterKey;
input clk,ena;
output [15:0] key0,key1,key2;
assign key0 = masterKey;

localparam R_CON1 = 8'h80;
localparam R_CON2 = 8'h30;
// round1 key 
wire [7:0] w0,w1,w2,w3;
assign w0 = key0[15:8];
assign w1 = key0[7:0];

wire [7:0] gw1;
gval g1(gw1,w1,R_CON1,clk,ena);

assign w2 = w0^gw1;
assign w3 = w1 ^w2;

assign key1 ={w2,w3};
// round 2 key


wire [7:0] w4,w5,gw3;
gval g2(gw3,w3,R_CON2,clk,ena);

assign w4 = w2^gw3;
assign w5 = w3 ^w4;

assign key2 ={w4,w5};

endmodule
