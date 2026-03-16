`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.08.2025 16:18:11
// Design Name: 
// Module Name: accumulator
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



module accumulator(clk, reset,in,out);
input clk,reset,in;
output [3:0]out;
wire s1, c1, s2, c2, s3, c3, s4, c4;
wire zero = 1'd0;

// using 4 full adders and 4 D-Flipflops to output and input 
fullAdder a1 (s1,c1,in,out[0],zero);
dff d1(s1,out[0],clk,reset);

fullAdder a2 (s2,c2,zero,out[1],c1);
dff d2(s2,out[1],clk,reset);

fullAdder a3 (s3,c3,zero,out[2],c2);
dff d3(s3,out[2],clk,reset);

fullAdder a4 (s4,c4,zero,out[3],c3);
dff d4(s4,out[3],clk,reset);


endmodule
