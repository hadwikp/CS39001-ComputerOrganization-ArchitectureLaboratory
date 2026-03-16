`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.08.2025 14:18:24
// Design Name: 
// Module Name: _32bitAdder
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
module _32bitAdder (s,cout,a,b,cin);
input [31:0]a,b;
input cin;
output [31:0] s;
output cout;
wire c1;

_16bitAdder st1(s[15:0],c1,a[15:0],b[15:0],cin);
_16bitAdder st2(s[31:16],cout,a[31:16],b[31:16],c1);

endmodule
