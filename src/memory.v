module memory (
    input wire clk,
    input wire mem_read,
    input wire mem_write,
    input wire [7:0] address,
    input wire [7:0] input_data,
    output reg [7:0] output_data
);

// memory memory_instance(
//     clk(),
//     mem_read(),
//     mem_write(),
//     address(),
//     input_data(),
//     output_data()
// );

    reg [7:0] mem [0:255]; // 256 bytes of memory

    always @(posedge clk) begin
        if (mem_write) begin
            mem[address] <= input_data;
        end 
    end

    always @(*) begin
        if (mem_read) begin
            output_data = mem[address]; // Continuous assignment for read operation
        end else begin
            output_data = 8'bz; // Output data is high impedance during non-read operations
        end
    end

endmodule
