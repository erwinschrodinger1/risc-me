`timescale 1ns / 1ps

module register_tb;

    // Parameters
    parameter CLK_PERIOD = 10; // Clock period in time units

    // Signals
    reg clk;
    reg reset;
    reg latch;
    reg inc;
    reg [7:0] data;
    wire [7:0] reg_out;

    // Instantiate register module
    register dut (
        .clk(clk),
        .reset(reset),
        .latch(latch),
        .inc(inc),
        .data(data),
        .reg_out(reg_out)
    );

    // Stimulus
    initial begin
        clk = 0;
        $dumpfile("register_tb.vcd");
        $dumpvars(0, register_tb);

        // Reset test
        reset = 1;
        #20;
        reset = 0;
        #20;

        // Load data test
        data = 8'hAA;
        latch = 1;
        #20;
        latch = 0;
        #20;

        // Increment test
        inc = 1;
        #20;
        inc = 0;
        #20;

        // Further tests can be added here

        // End simulation
        #100;
        $finish;
    end

    always #5 clk = ~clk;

endmodule
