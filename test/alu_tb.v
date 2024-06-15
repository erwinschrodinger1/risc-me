module alu_tb;
    // Inputs
    reg enable;
    reg clk;
    reg [2:0] mode;
    reg [7:0] in_a;
    reg [7:0] in_b;

    // Outputs
    wire [7:0] out;
    wire flag_zero;
    wire flag_carry;

    // Instantiate the ALU (Unit Under Test)
    alu uut (
        .enable(enable),
        .clk(clk),
        .mode(mode),
        .in_a(in_a),
        .in_b(in_b),
        .out(out),
        .flag_zero(flag_zero),
        .flag_carry(flag_carry)
    );

    initial begin
        // Initialize Inputs
        enable = 0;
        clk = 0;
        mode = 0;
        in_a = 0;
        in_b = 0;

        // Generate VCD file
        $dumpfile("alu_tb.vcd");
        $dumpvars(0, alu_tb);

        // Apply test vectors
        #10 enable = 1; mode = `OP_ADD; in_a = 8'h0F; in_b = 8'h01;
        #10 clk = 1; #10 clk = 0;

        #10 enable = 1; mode = `OP_SUB; in_a = 8'h10; in_b = 8'h01;
        #10 clk = 1; #10 clk = 0;

        #10 enable = 1; mode = `OP_AND; in_a = 8'hF0; in_b = 8'h0F;
        #10 clk = 1; #10 clk = 0;

        #10 enable = 1; mode = `OP_OR;  in_a = 8'hF0; in_b = 8'h0F;
        #10 clk = 1; #10 clk = 0;

        // Test for zero flag
        #10 enable = 1; mode = `OP_SUB; in_a = 8'h01; in_b = 8'h01;
        #10 clk = 1; #10 clk = 0;

        // Disable ALU
        #10 enable = 0; mode = `OP_ADD; in_a = 8'hFF; in_b = 8'h01;
        #10 clk = 1; #10 clk = 0;

        // Finish simulation
        #10 $finish;
    end

    always #5 clk = ~clk; // Generate clock signal

endmodule
