module register_tb;
    // Inputs
    reg clk;
    reg reset;
    reg [7:0] data;
    reg enable;
    reg latch;

    // Outputs
    wire [7:0] reg_out;

    // Instantiate the Unit Under Test (UUT)
    register uut (
        .clk(clk), 
        .reset(reset), 
        .data(data), 
        .reg_out(reg_out), 
        .enable(enable), 
        .latch(latch)
    );

    initial begin
        // Initialize Inputs
        clk = 0;
        reset = 0;
        data = 0;
        enable = 0;
        latch = 0;

        // Generate VCD file
        $dumpfile("register_tb.vcd");
        $dumpvars(0, register_tb);

        // Reset the register
        reset = 1;
        #10;
        reset = 0;

        // Load value into register
        data = 8'hAA;  // Example data
        latch = 1;
        #10;
        latch = 0;

        // Enable output
        enable = 1;
        #10;

        // Change the data and latch again
        data = 8'h55;
        latch = 1;
        #10;
        latch = 0;

        // Disable output
        enable = 0;
        #10;

        // Finish simulation
        $finish;
    end

    always #5 clk = ~clk; // Generate clock signal

endmodule
