`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.08.2025 15:40:30
// Design Name: 
// Module Name: adderSubtractor_4bit
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
module adderSubtractor_4bit(in,dirn,out);
input [3:0] in;
input dirn;
output [3:0] out;

wire dir,c1,c2,c3,c4;
assign dir = ~dirn;

fullAdder fa0(out[0],c1,in[0],1^dir,dir);
fullAdder fa1(out[1],c2,in[1],0^dir,c1);
fullAdder fa2(out[2],c3,in[2],0^dir,c2);
fullAdder fa3(out[3],c4,in[3],0^dir,c3);
endmodule
