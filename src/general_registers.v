`include "parameters.v" 

module general_registers (
    input clk,
    input reset,
    input wire [2:0] src_bus_selector,
    input wire [2:0] dest_bus_selector,
    input [7:0] data,
    output reg [7:0] src
);

wire [7:0] reg_R0_out;
wire [7:0] reg_R1_out;
wire [7:0] reg_R2_out;
wire [7:0] reg_R3_out;
wire [7:0] reg_R4_out;
wire [7:0] reg_R5_out;
wire [7:0] reg_R6_out;
wire [7:0] reg_R7_out;

// Register instances
register reg_R0 (
    .clk(clk),
    .reset(reset),
    .data(data),
    .reg_out(reg_R0_out),
    .enable((src_bus_selector == `R0_SELECTOR) ? 1'b1 : 1'b0),
    .latch((dest_bus_selector == `R0_SELECTOR) ? 1'b1 : 1'b0)
);
register reg_R1 (
    .clk(clk),
    .reset(reset),
    .data(data),
    .reg_out(reg_R1_out),
    .enable((src_bus_selector == `R1_SELECTOR) ? 1'b1 : 1'b0),
    .latch((dest_bus_selector == `R1_SELECTOR) ? 1'b1 : 1'b0)
);
register reg_R2 (
    .clk(clk),
    .reset(reset),
    .data(data),
    .reg_out(reg_R2_out),
    .enable((src_bus_selector == `R2_SELECTOR) ? 1'b1 : 1'b0),
    .latch((dest_bus_selector == `R2_SELECTOR) ? 1'b1 : 1'b0)
);
register reg_R3 (
    .clk(clk),
    .reset(reset),
    .data(data),
    .reg_out(reg_R3_out),
    .enable((src_bus_selector == `R3_SELECTOR) ? 1'b1 : 1'b0),
    .latch((dest_bus_selector == `R3_SELECTOR) ? 1'b1 : 1'b0)
);
register reg_R4 (
    .clk(clk),
    .reset(reset),
    .data(data),
    .reg_out(reg_R4_out),
    .enable((src_bus_selector == `R4_SELECTOR) ? 1'b1 : 1'b0),
    .latch((dest_bus_selector == `R4_SELECTOR) ? 1'b1 : 1'b0)
);
register reg_R5 (
    .clk(clk),
    .reset(reset),
    .data(data),
    .reg_out(reg_R5_out),
    .enable((src_bus_selector == `R5_SELECTOR) ? 1'b1 : 1'b0),
    .latch((dest_bus_selector == `R5_SELECTOR) ? 1'b1 : 1'b0)
);
register reg_R6 (
    .clk(clk),
    .reset(reset),
    .data(data),
    .reg_out(reg_R6_out),
    .enable((src_bus_selector == `R6_SELECTOR) ? 1'b1 : 1'b0),
    .latch((dest_bus_selector == `R6_SELECTOR) ? 1'b1 : 1'b0)
);
register reg_R7 (
    .clk(clk),
    .reset(reset),
    .data(data),
    .reg_out(reg_R7_out),
    .enable((src_bus_selector == `R7_SELECTOR) ? 1'b1 : 1'b0),
    .latch((dest_bus_selector == `R7_SELECTOR) ? 1'b1 : 1'b0)
);

// Outputs based on src_bus_selector
always @(posedge clk) begin
    case (src_bus_selector)
        `R0_SELECTOR: src = reg_R0_out;
        `R1_SELECTOR: src = reg_R1_out;
        `R2_SELECTOR: src = reg_R2_out;
        `R3_SELECTOR: src = reg_R3_out;
        `R4_SELECTOR: src = reg_R4_out;
        `R5_SELECTOR: src = reg_R5_out;
        `R6_SELECTOR: src = reg_R6_out;
        `R7_SELECTOR: src = reg_R7_out;
        default: src = 8'hzz; // Invalid selector
    endcase
end

endmodule
