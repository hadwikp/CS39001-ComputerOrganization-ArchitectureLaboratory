`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.08.2025 16:28:57
// Design Name: 
// Module Name: test_bench_16bitCLA
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


module test_bench_16bitCLA;
reg [15:0] a,b;
reg cin;
wire [15:0] s;
wire cout;

_16bitCLA test(s,cout,a,b,cin);
initial
    begin
        a=16'd7000;
        b=16'd2000;
        cin=1'd0;
        #5;
        $display("a = %d | b = %d | cin = %d || s = %d | cout = %d",a,b,cin,s,cout);
        #10;
        a=16'd1234;
        b=16'd1;
        cin=1'd1;
        #5;
        $display("a = %d | b = %d | cin = %d || s = %d | cout = %d",a,b,cin,s,cout);
        #10;
        a=16'd65535; // 2^16-1
        b=16'd1;
        cin=1'd0;
        #5;
        $display("a = %d | b = %d | cin = %d || s = %d | cout = %d",a,b,cin,s,cout);
        #10;
    end

endmodule
