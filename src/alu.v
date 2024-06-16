`include "parameters.v"

module alu(
    input wire enable,
    input wire clk,
    input wire [2:0] mode,
    input wire [7:0] in_a,
    input wire [7:0] in_b,
    output reg [7:0] out,
    output reg flag_zero,
    output reg flag_carry
);

    initial begin
        flag_carry = 0;
        flag_zero = 0;
    end

    always @(posedge clk) begin
        if (enable) begin
            case (mode)
                `OP_ADD: {flag_carry, out} = in_a + in_b;
                `OP_SUB: {flag_carry, out} = in_a - in_b;
                `OP_AND: out = in_a & in_b;
                `OP_OR: out = in_a | in_b;
                default: out = 8'bz;
            endcase

            flag_zero = (out == 0) ? 1 : 0;
        end
    end


endmodule
