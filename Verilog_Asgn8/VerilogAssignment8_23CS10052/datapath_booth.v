`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.09.2025 16:46:10
// Design Name: 
// Module Name: datapath_booth
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


module arithmetic_shifter(
    input  [16:0] in_val,
    output [16:0] out_val
);
    assign out_val = {in_val[16], in_val[16:1]};
endmodule

module adder_subtractor(
    input  [7:0] A,
    input  [7:0] M,
    input        selop,
    output [7:0] result
);
    wire [7:0] m_eff = selop ? (~M + 1'b1) : M;
    assign result = A + m_eff;
endmodule

module datapath_booth(
    input clk,
    input reset,
    input [7:0] multiplicand,
    input [7:0] multiplier,
    input load,
    input updateA,
    input selop,
    input shift,
    output q0,
    output q_1,
    output count_zero,
    output [15:0] product
);
    reg [7:0] acc_reg;
    reg [7:0] qreg;
    reg [7:0] mreg;
    reg       qm1_reg;
    reg [3:0] cnt_reg;

    wire [7:0] sum_w;
    wire [16:0] sh_in = {acc_reg, qreg, qm1_reg};
    wire [16:0] sh_out;

    adder_subtractor u_addsub(
        .A(acc_reg),
        .M(mreg),
        .selop(selop),
        .result(sum_w)
    );

    arithmetic_shifter u_shift (
        .in_val(sh_in),
        .out_val(sh_out)
    );

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            acc_reg  <= 8'd0;
            qreg     <= 8'd0;
            mreg     <= 8'd0;
            qm1_reg  <= 1'b0;
            cnt_reg  <= 4'd0;
        end else begin
            if (load) begin
                acc_reg  <= 8'd0;
                qreg     <= multiplier;
                mreg     <= multiplicand;
                qm1_reg  <= 1'b0;
                cnt_reg  <= 4'd8;
            end
            else if (updateA) begin
                acc_reg <= sum_w;
            end
            else if (shift) begin
                {acc_reg, qreg, qm1_reg} <= sh_out;
                cnt_reg <= cnt_reg - 1'b1;
            end
        end
    end

    assign q0         = qreg[0];
    assign q_1        = qm1_reg;
    assign count_zero = (cnt_reg == 4'd0);
    assign product    = {acc_reg, qreg};
endmodule

