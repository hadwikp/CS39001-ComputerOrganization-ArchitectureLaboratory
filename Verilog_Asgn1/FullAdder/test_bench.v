`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.08.2025 16:41:26
// Design Name: 
// Module Name: test_bench
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


module test_bench;

reg a,b,cin;
wire sum, cout;
fullAdder uut(sum,cout,a,b,cin);

initial
    begin
        a <= 1'd1;
        b <= 1'd0;
        cin <= 1'd1;
    end
endmodule
