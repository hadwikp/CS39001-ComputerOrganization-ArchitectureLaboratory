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
module _64bitAdder (s,cout,a,b,cin);
input [63:0]a,b;
input cin;
output [63:0] s;
output cout;
wire c1;

_32bitAdder st1(s[31:0],c1,a[31:0],b[31:0],cin);
_32bitAdder st2(s[63:32],cout,a[63:32],b[63:32],c1);

endmodule
