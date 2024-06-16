module register (
    input wire clk,
    input wire reset,
    input wire latch,
    input wire inc,
    input wire [7:0] data,
    output reg [7:0] reg_out
);
    always @(posedge clk) begin
        if (reset) begin
            reg_out <= 8'h00; // Reset to 0
        end else if (latch) begin
            reg_out <= data; // Load with data
        end else if (inc) begin
            reg_out <= reg_out + 1'b1; // Increment
        end
    end

endmodule
