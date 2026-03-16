`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.08.2025 16:34:32
// Design Name: 
// Module Name: fullAdder
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

module halfAdder (sum,c,a,b);
input a,b;
output sum,c;
xor g1(sum, a,b);
and g2(c,a,b);

endmodule

module fullAdder(sum,cout,a,b,cin);
input a,b,cin;
output sum,cout;

halfAdder h1(s1,c1,a,b);
halfAdder h2(sum,c2,s1,cin);
or g3 (cout,c2,c1);

endmodule
