`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.08.2025 16:03:33
// Design Name: 
// Module Name: mainCounter
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


module mainCounter(out,mode_led,dirn,reset,rst_clk,clk_in);
input dirn,reset,clk_in,rst_clk;
output [3:0]out;
output mode_led;

wire clk_modi;
wire [3:0] in;
clockDivider div1(clk_in,rst_clk,clk_modi);


dff d1(in[0],out[0],clk_modi,reset);
dff d2(in[1],out[1],clk_modi,reset);
dff d3(in[2],out[2],clk_modi,reset);
dff d4(in[3],out[3],clk_modi,reset);

adderSubtractor_4bit fa (out,dirn,in);
assign mode_led = dirn;
        
endmodule
