
module dff(out,in,clk,reset);
input in,clk,reset;
output reg out;
always @(posedge clk or posedge reset)
    begin
        if(reset) out<=1'd0;
        else out<=in;
    end
endmodule
