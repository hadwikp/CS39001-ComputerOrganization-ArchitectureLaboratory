`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.08.2025 14:35:51
// Design Name: 
// Module Name: clkDiv
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



module clkDiv(clk_out,clk_in);

input wire clk_in;

output reg clk_out;
reg [26:0]counter;


always @(posedge clk_in) begin
     if (counter == 27'd99999999) begin
        counter <= 27'd0;
        clk_out <= ~clk_out;
    end
    else begin
    counter <= counter +1;
    end
  
end
    

endmodule
