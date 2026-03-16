`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.08.2025 16:15:26
// Design Name: 
// Module Name: MixColumns
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


module MixColumns(out , in);
input [15:0] in;
output [15:0] out;

wire [15:0] temp;
multiply4 m1(temp[15:12],in[7:4]);
assign out[15:12] = temp[15:12] ^ in[15:12];

multiply4 m2(temp[7:4],in[15:12]);
assign out[7:4] = temp[7:4] ^ in[7:4];

multiply4 m3(temp[11:8],in[3:0]);
assign out[11:8] = temp[11:8] ^ in[11:8];

multiply4 m4(temp[3:0],in[11:8]);
assign out[3:0] = temp[3:0] ^ in[3:0];
endmodule
