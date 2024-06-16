module sequence_counter_tb;
    reg clk;
    wire [2:0] sc;

    sequence_counter dut (
        .clk(clk),
        .sc(sc)
    );

    initial begin

        clk = 0;
        // Dump VCD file
        $dumpfile("sequence_coutner_tb.vcd");
        $dumpvars(0, sequence_counter_tb);
        #10; // Wait for 10 time units
        repeat (16) begin // Repeat 16 times for a 4-bit counter
            #5; // Toggle clock every 5 time units
            clk = ~clk;
        end
        $finish; // Finish simulation
    end

    always #1 clk = ~clk; // Generate clock with period of 1 time unit

endmodule
