`timescale 1ns / 1ps

module control_tb;

    // Inputs
    reg clk;
    reg [2:0] sc;
    reg [7:0] pc;
    reg [7:0] mar;
    reg [7:0] ir;
    reg flag_zero;
    reg flag_carry;

    // Outputs
    wire mem_read;
    wire mem_write;
    wire pc_en;
    wire pc_latch;
    wire pc_inc;
    wire mar_en;
    wire mar_latch;
    wire mar_inc;
    wire ir_en;
    wire ir_latch;
    wire ir_inc;
    wire alu_en;
    wire [2:0] src1_bus_selector;
    wire [2:0] src2_bus_selector;
    wire [2:0] dest_bus_selector;

    // Instantiate the Unit Under Test (UUT)
    control uut (
        .clk(clk),
        .sc(sc),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .pc(pc),
        .pc_en(pc_en),
        .pc_latch(pc_latch),
        .pc_inc(pc_inc),
        .mar(mar),
        .mar_en(mar_en),
        .mar_latch(mar_latch),
        .mar_inc(mar_inc),
        .ir(ir),
        .ir_en(ir_en),
        .ir_latch(ir_latch),
        .ir_inc(ir_inc),
        .alu_en(alu_en),
        .flag_zero(flag_zero),
        .flag_carry(flag_carry),
        .src1_bus_selector(src1_bus_selector),
        .src2_bus_selector(src2_bus_selector),
        .dest_bus_selector(dest_bus_selector)
    );

    // Clock generation
    always #5 clk = ~clk; // 10ns clock period

    initial begin
        // Initialize Inputs
        clk = 0;
        sc = 3'b000;
        pc = 8'b00000000;
        mar = 8'b00000000;
        ir = 8'b00000000;
        flag_zero = 0;
        flag_carry = 0;

        // Initialize VCD dump
        $dumpfile("control_tb.vcd");
        $dumpvars(0, control_tb);

        // Wait for global reset
        #10;

        // Test sequence
        sc = 3'b000; // T0
        #10;
        sc = 3'b001; // T1
        #10;
        sc = 3'b010; // T2
        #10;
        sc = 3'b011; // T3
        #10;
        sc = 3'b100; // T4
        #10;

        // Example instruction (opcode for ADD)
        ir = 8'b00010010; // Assume ADD instruction
        sc = 3'b000; // T0
        #10;
        sc = 3'b001; // T1
        #10;
        sc = 3'b010; // T2
        #10;
        sc = 3'b011; // T3
        #10;
        sc = 3'b100; // T4
        #10;

        // Example instruction (opcode for LOAD)
        ir = 8'b00100010; // Assume LOAD instruction
        sc = 3'b000; // T0
        #10;
        sc = 3'b001; // T1
        #10;
        sc = 3'b010; // T2
        #10;
        sc = 3'b011; // T3
        #10;
        sc = 3'b100; // T4
        #10;

        // Example instruction (opcode for BEQ)
        ir = 8'b11000001; // Assume BEQ instruction
        flag_zero = 1;
        sc = 3'b000; // T0
        #10;
        sc = 3'b001; // T1
        #10;
        sc = 3'b010; // T2
        #10;
        sc = 3'b011; // T3
        #10;
        sc = 3'b100; // T4
        #10;

        // Stop the simulation
        $finish;
    end
endmodule
