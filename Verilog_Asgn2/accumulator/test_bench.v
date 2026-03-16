`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.08.2025 14:13:55
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

reg clk,reset,in;

wire [3:0] out;

accumulator uut(clk,reset,in,out);
initial 
    begin
        clk = 0;
        forever #10 clk = ~clk;  
    end

initial begin
        reset = 1; in = 0;
        #15;
        reset = 0;#10;
        
        in = 1; 
        repeat(16) @(posedge clk);
        
        in = 0; 
        repeat(5) @(posedge clk);
      
        reset = 1;
        @(posedge clk);
        reset = 0;
        
        in = 1;
        @(posedge clk);
        in = 0;
        @(posedge clk);
        in = 1;
        @(posedge clk);
        in = 0;
        @(posedge clk);

        // Stop simulation after some time
        #50;
        
       $stop;       
    end       
endmodule
