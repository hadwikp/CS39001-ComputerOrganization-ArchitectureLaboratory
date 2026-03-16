`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2025 14:42:26
// Design Name: 
// Module Name: NibbleSub
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


module NibbleSub(out, in , clk ,ena);
input [15:0] in;
input clk,ena;
output [15:0] out;

wire [3:0] tin1,tin2,tin3,tin4;

wire [3:0] tout1,tout2,tout3,tout4;

assign tin1 = in[15:12];
assign tin2 = in[11:8];
assign tin3 = in[7:4];
assign tin4 = in[3:0];

Sbox_ROM s4 (
  .clka(clk),    // input wire clka
  .ena(ena),      // input wire ena
  .addra(tin4),  // input wire [3 : 0] addra
  .douta(tout4)  // output wire [3 : 0] douta
);

Sbox_ROM s3 (
  .clka(clk),    // input wire clka
  .ena(ena),      // input wire ena
  .addra(tin3),  // input wire [3 : 0] addra
  .douta(tout3)  // output wire [3 : 0] douta
);

Sbox_ROM s2 (
  .clka(clk),    // input wire clka
  .ena(ena),      // input wire ena
  .addra(tin2),  // input wire [3 : 0] addra
  .douta(tout2)  // output wire [3 : 0] douta
);

Sbox_ROM s1 (
  .clka(clk),    // input wire clka
  .ena(ena),      // input wire ena
  .addra(tin1),  // input wire [3 : 0] addra
  .douta(tout1)  
);

assign out = {tout1,tout2,tout3,tout4};

endmodule
