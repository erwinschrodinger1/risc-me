`timescale 1ns/1ps

module memory_tb;

    reg clk;
    reg mem_read;
    reg mem_write;
    reg [7:0] address;
    reg [7:0] input_data; // Internal signal for driving input_data
    
    wire [7:0] output_data;

    // Instantiate the memory module
    memory uut (
        .clk(clk),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .address(address),
        .input_data(input_data), // Connect internal signal
        .output_data(output_data)
    );

    initial begin
        // Initialize signals
        clk = 0;
        mem_read = 0;
        mem_write = 0;
        address = 8'b0000;
        input_data = 8'b00000000;

        // Dump VCD file
        $dumpfile("memory_tb.vcd");
        $dumpvars(0, tb_memory);

        // Test reading from memory
        #10 mem_read = 1; address = 8'b00000001;
        #20 mem_read = 0;

        // Test writing to memory
        #30 mem_write = 1; address = 8'b00000010; input_data = 8'b10101010;
        #40 mem_write = 0;

        // Test reading the written data
        #50 mem_read = 1; address = 8'b00000010;
        #60 mem_read = 0;

        // Finish the simulation
        #70 $finish;
    end

    // Clock generation
    always #5 clk = ~clk;

endmodule
