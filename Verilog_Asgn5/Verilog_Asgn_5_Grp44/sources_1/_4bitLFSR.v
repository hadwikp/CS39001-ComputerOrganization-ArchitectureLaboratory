module _4bitLFSR(out,seed,sel,reset,clk);
input [3:0] seed;
input reset,clk,sel;
output [3:0] out;
wire clk_modi;
wire w1,w2,w3,w4,w5,w1int,w2int,w3int,w4int;

clkDiv  c1(clk_modi,clk);
//assign clk_modi=clk;

assign w1 = w4^w5;

mux m3 (w1int,w1,seed[3],sel);
mux m2 (w2int,w2,seed[2],sel);
mux m1 (w3int,w3,seed[1],sel);
mux m0 (w4int,w4,seed[0],sel);

dff d0 (w5,w4int,clk_modi,reset);
dff d1 (w4,w3int,clk_modi,reset);
dff d2 (w3,w2int,clk_modi,reset);
dff d3 (w2,w1int,clk_modi,reset);

assign out[3] = w2;
assign out[2] = w3;
assign out[1] = w4;
assign out[0] = w5;


endmodule
