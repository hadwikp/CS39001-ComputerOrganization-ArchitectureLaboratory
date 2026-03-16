`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.08.2025 15:20:21
// Design Name: 
// Module Name: clockDivider
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


module clockDivider(clk_in,reset,clk_out);

input wire clk_in;
input wire reset;
output reg clk_out;
reg [25:0]counter;


always @(posedge clk_in or posedge reset) begin
    if (reset) begin
        clk_out <= 1'b0;
        counter <= 26'd0;
    end
    else begin
        if (counter == 26'd49999999) begin
            counter <= 26'd0;
            clk_out <= ~clk_out;
        end
        else begin
        counter <= counter +1;
        end
    end
end
    

endmodule
