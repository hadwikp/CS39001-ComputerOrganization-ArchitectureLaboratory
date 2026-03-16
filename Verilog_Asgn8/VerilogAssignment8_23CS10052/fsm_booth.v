module fsm_booth(
    input q0,
    input q_1,
    input count_zero, 
    input clk,
    input reset,
    output reg load,
    output reg updateA,
    output reg selop,
    output reg shift,
    output reg done
);
    parameter IDLE  = 3'b000;
    parameter START = 3'b001;
    parameter CHECK = 3'b010;
    parameter ADD   = 3'b011;
    parameter SUB   = 3'b100;
    parameter SHIFT = 3'b101;
    parameter DONE  = 3'b110;

    reg [2:0] st_cur, st_nxt;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            st_cur <= IDLE;
        end else begin
            st_cur <= st_nxt;
        end
    end

    always @(*) begin
        load = 1'b0; updateA = 1'b0; selop = 1'b0; shift = 1'b0; done = 1'b0;
        
        case (st_cur)
            IDLE: begin
                st_nxt = reset ? IDLE : START;
            end
            START: begin
                load = 1'b1;
                st_nxt = CHECK;
            end
            CHECK: begin
                if (count_zero == 1'b0) begin
                    case ({q0, q_1})
                        2'b01:   st_nxt = ADD;
                        2'b10:   st_nxt = SUB;
                        default: st_nxt = SHIFT;
                    endcase
                end
                else begin
                    st_nxt = DONE;
                end
            end
            ADD: begin
                updateA = 1'b1;
                st_nxt = SHIFT;
            end
            SUB: begin
                updateA = 1'b1;
                selop   = 1'b1;
                st_nxt = SHIFT;
            end
            SHIFT: begin
                shift = 1'b1;
                st_nxt = CHECK;
            end
            DONE: begin
                done = 1'b1;
                st_nxt = DONE;
            end
            default: begin
                st_nxt = IDLE;
            end
        endcase
    end
endmodule
