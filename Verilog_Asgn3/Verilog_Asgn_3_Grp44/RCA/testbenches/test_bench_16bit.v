`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.08.2025 14:45:28
// Design Name: 
// Module Name: test_bench_16bit
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


module test_bench_16bit;
reg [15:0]a,b;
reg cin;
wire [15:0]s;
wire cout;
_16bitAdder test(s,cout,a,b,cin);
initial
    begin
        cin  <= 1'b1;
        a    <= 16'b1001001110010011;
        b    <= 16'b0110110001101100;
        #5;
        $display("a = %b | b = %b | cin = %b || s = %b | cout = %b \n",a,b,cin,s,cout);
        
        #10;
        cin  <= 1'b1;
        a    <= 16'b1001111110010011;
        b    <= 16'b1000110001101100;
        #5;
        $display("a = %b | b = %b | cin = %b || s = %b | cout = %b \n",a,b,cin,s,cout);
        
        #10;
        cin  <= 1'b1;
        a    <= 16'b1001000010000011;
        b    <= 16'b0110110111100100;
        #5;
        $display("a = %b | b = %b | cin = %b || s = %b | cout = %b \n",a,b,cin,s,cout);
        
         
    end
   
endmodule
