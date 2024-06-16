module memory (
    input wire clk,
    input wire mem_write,
    input wire [7:0] address,
    input wire [7:0] input_data,
    output reg [7:0] output_data
);

    reg [7:0] mem [0:255]; // 256 bytes of memory

    always @(posedge clk) begin
        if (mem_write) begin
            mem[address] <= input_data;
        end
        
        output_data = mem[address]; // Continuous assignment for read operation
    end

endmodule
