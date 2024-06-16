`timescale 1ns / 1ps

module general_registers_tb;

    `include "parameters.v"
    // Parameters

    // Define constants for easier readability
    localparam CLK_PERIOD = 10;  // Clock period in ns

    // Signals for module ports
    reg clk;
    reg reset;
    reg [2:0] src1_bus_selector;
    reg [2:0] src2_bus_selector;
    reg [2:0] dest_bus_selector;
    reg [7:0] data;
    wire [7:0] src1;
    wire [7:0] src2;

    // Instantiate the module under test
    general_registers uut (
        .clk(clk),
        .reset(reset),
        .src1_bus_selector(src1_bus_selector),
        .src2_bus_selector(src2_bus_selector),
        .dest_bus_selector(dest_bus_selector),
        .data(data),
        .src1(src1),
        .src2(src2)
    );

    // Clock generation
    always #5 clk = ~clk;  // Toggle clock every half period

    // Initial stimulus
    initial begin
        clk=0;
        // Initialize inputs
        reset = 1;
        src1_bus_selector = 0;
        src2_bus_selector = 0;
        dest_bus_selector = 0;
        data = 8'h00;

        // Start of testbench
        $dumpfile("general_registers_tb.vcd");
        $dumpvars(0, general_registers_tb);

        // Reset sequence
        #20 reset = 0;

        // Test case 1: Write data to R0
        data = 8'hFF;
        dest_bus_selector = `R0_SELECTOR;
        #20;

        // Test case 2: Select R3 and R6 for src1 and src2 respectively
        src1_bus_selector = `R3_SELECTOR;
        src2_bus_selector = `R6_SELECTOR;
        #20;

        // End simulation
        #20 $finish;
    end

endmodule
