`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.08.2025 16:21:13
// Design Name: 
// Module Name: multiply4
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

module multiply4(out,in);
input [3:0] in;
output reg [3:0] out;
always @(*)begin 
case (in)
    4'h0:   out <= 4'h0;
    4'h1:   out <= 4'h4;
    4'h2:   out <= 4'h8;
    4'h3:   out <= 4'hC;
    4'h4:   out <= 4'h3;
    4'h5:   out <= 4'h7;
    4'h6:   out <= 4'hB;
    4'h7:   out <= 4'hF;
    4'h8:   out <= 4'h6;
    4'h9:   out <= 4'h2;
    4'hA:   out <= 4'hE;
    4'hB:   out <= 4'hA;
    4'hC:   out <= 4'h5;
    4'hD:   out <= 4'h1;
    4'hE:   out <= 4'h9;
    4'hF:   out <= 4'hD;
    default:   out <= 4'h0; 
        endcase
end

endmodule
