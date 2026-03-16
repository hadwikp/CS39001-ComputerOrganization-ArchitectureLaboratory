
module top_booth(
    input clk,                   
    input reset,                 
    input [7:0] multiplicand,   
    input [7:0] multiplier,      
 
    output [15:0] product        
);
    
    wire w_load;
    wire w_updateA;
    wire w_selop;
    wire w_shift;
    wire w_done;
    wire w_q0;
    wire w_q_1;
    wire w_count_zero; 
    wire [15:0] w_product;

    // Instantiate the Datapath
    datapath_booth Datapath(
        .clk(clk),
        .reset(reset),
        .multiplicand(multiplicand),
        .multiplier(multiplier),
        .load(w_load),
        .updateA(w_updateA),
        .selop(w_selop),
        .shift(w_shift),
        .q0(w_q0),
        .q_1(w_q_1),
        .count_zero(w_count_zero),
        .product(w_product)
    );

    
    fsm_booth FSM(
        .q0(w_q0),
        .q_1(w_q_1),
        .count_zero(w_count_zero),
        .clk(clk),
        .reset(reset),
        .load(w_load),
        .updateA(w_updateA),
        .selop(w_selop),
        .shift(w_shift),
        .done(w_done)
    );

   
    assign product = w_product;

endmodule