`timescale 1ns / 1ps
`include "parameters.v"

module general_registers_tb;

// Testbench signals
reg clk;
reg reset;
reg [2:0] src_bus_selector;
reg [2:0] dest_bus_selector;
reg [7:0] data;
wire [7:0] src;

// Instantiate the registers module
general_registers uut (
    .clk(clk),
    .reset(reset),
    .src_bus_selector(src_bus_selector),
    .dest_bus_selector(dest_bus_selector),
    .data(data),
    .src(src)
);

// Clock generation
always #5 clk = ~clk;  // 100MHz clock

// Testbench procedure
initial begin
    // Dump VCD file
    $dumpfile("registers_tb.vcd");
    $dumpvars(0, testbench);

    // Initialize signals
    clk = 0;
    reset = 1;
    src_bus_selector = 3'b000;
    dest_bus_selector = 3'b000;
    data = 8'h00;
    
    // Reset sequence
    #10 reset = 0;
    #10 reset = 1;

    // Write to registers
    #10 dest_bus_selector = `R0_SELECTOR; data = 8'hA5;  // Write 0xA5 to R0
    #10 dest_bus_selector = `R1_SELECTOR; data = 8'h5A;  // Write 0x5A to R1
    #10 dest_bus_selector = `R2_SELECTOR; data = 8'hFF;  // Write 0xFF to R2
    #10 dest_bus_selector = `R3_SELECTOR; data = 8'h00;  // Write 0x00 to R3
    
    // Read from registers
    #10 src_bus_selector = `R0_SELECTOR;  // Read from R0
    #10 src_bus_selector = `R1_SELECTOR;  // Read from R1
    #10 src_bus_selector = `R2_SELECTOR;  // Read from R2
    #10 src_bus_selector = `R3_SELECTOR;  // Read from R3

    // End simulation
    #10 $finish;
end

endmodule
