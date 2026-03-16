`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.08.2025 16:17:05
// Design Name: 
// Module Name: dff
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


module dff(in,out,clk,reset);
input in,clk,reset;
output reg out;
always @(posedge clk or posedge reset)
    begin
        if(reset) out<=1'd0;
        else out<=in;
    end
endmodule

