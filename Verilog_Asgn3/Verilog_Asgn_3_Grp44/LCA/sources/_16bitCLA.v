`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.08.2025 16:03:49
// Design Name: 
// Module Name: _16bitCLA
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


module _16bitCLA(s,cout,a,b,cin);
input [15:0] a,b;
input cin;
output [15:0] s;
output cout;

wire [3:0] p,g;
wire[4:0] c;

_4bitCLA_aug CLA1 (s[3:0],p[0],g[0],a[3:0],b[3:0],cin);
_4bitCLA_aug CLA2 (s[7:4],p[1],g[1],a[7:4],b[7:4],c[1]);
_4bitCLA_aug CLA3 (s[11:8],p[2],g[2],a[11:8],b[11:8],c[2]);
_4bitCLA_aug CLA4 (s[15:12],p[3],g[3],a[15:12],b[15:12],c[3]);

LCU l1(p,g,cin,c);

assign cout = c[4];
endmodule
