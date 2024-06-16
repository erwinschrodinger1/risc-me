`timescale 1ns / 1ps

module memory_tb;

    // Parameters
    parameter CLK_PERIOD = 10; // Clock period in time units

    // Signals
    reg clk;
    reg mem_write;
    reg [7:0] address;
    reg [7:0] input_data;
    wire [7:0] output_data;

    // Instantiate memory module
    memory dut (
        .clk(clk),
        .mem_write(mem_write),
        .address(address),
        .input_data(input_data),
        .output_data(output_data)
    );

    // Stimulus
    initial begin
        clk = 0;
        $dumpfile("memory_tb.vcd");
        $dumpvars(0, memory_tb);

        // Write operations
        mem_write = 1;
        address = 8'h00;
        input_data = 8'hAA;
        #20;
        
        mem_write = 1;
        address = 8'hFF;
        input_data = 8'h55;
        #20;
        
        mem_write = 1;
        address = 8'h0A;
        input_data = 8'hF0;
        #20;
        
        mem_write = 0;

        // Read operations
        mem_write = 0;
        address = 8'h00;
        #20;
        
        mem_write = 0;
        address = 8'hFF;
        #20;
        
        mem_write = 0;
        address = 8'h0A;
        #20;

        // Further tests can be added here

        // End simulation
        #100;
        $finish;
    end

    always #5 clk = ~clk;

endmodule
