`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.08.2025 15:44:03
// Design Name: 
// Module Name: test_bench_4bitCLA
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


module test_bench_4bitCLA;

reg [3:0] a, b;
reg cin;
wire [3:0] s;
wire cout;

_4bitCLA  uut(s,cout,a,b,cin);

initial
    begin
        a=4'd6;
        b=4'd10;
        cin=1'd0;
        #5;
       $display("a = %d | b = %d | cin = %d || s = %d | cout = %d", a,b,cin,s,cout);
       #10;
        a=4'd5;
        b=4'd9;
        cin=1'd1;
        #5;
       $display("a = %d | b = %d | cin = %d || s = %d | cout = %d", a,b,cin,s,cout);
       
    end
endmodule
