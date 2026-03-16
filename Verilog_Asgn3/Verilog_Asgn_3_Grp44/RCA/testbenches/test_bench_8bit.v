`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.08.2025 14:28:55
// Design Name: 
// Module Name: test_bench_8bit
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


module test_bench_8bit;
reg [7:0]a,b;
reg cin;
wire [7:0]s;
wire cout;
_8bitAdder test(s,cout,a,b,cin);
initial
    begin
       cin  <= 1'b1;
        a    <= 8'b10010011;
        b    <= 8'b01101100;
        #5;
        $display("a = %b | b = %b | cin = %b || s = %b | cout = %b \n",a,b,cin,s,cout);
        
        #10;
        cin  <= 1'b1;
        a    <= 8'b10011011;
        b    <= 8'b00101100;
        #5;
        $display("a = %b | b = %b | cin = %b || s = %b | cout = %b \n",a,b,cin,s,cout);
        
        #10;
        cin  <= 1'b1;
        a    <= 8'b10000011;
        b    <= 8'b11100100;
        #5;
        $display("a = %b | b = %b | cin = %b || s = %b | cout = %b \n",a,b,cin,s,cout);
        
        
    end
   
endmodule

