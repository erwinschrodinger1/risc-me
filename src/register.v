module register(
    input wire clk,
    input wire reset,
    input wire enable,
    input wire latch,
    input wire inc,
    input wire [7:0] data,
    output reg [7:0] reg_out
);

// instance
// register register_instance(
//     .clk(),
//     .reset(),
//     .data(),
//     .reg_out(),
//     .enable(),
//     .latch()
//     .inc()
// );

reg[7:0] r;

always @(posedge clk ) begin
    if (reset) begin
        r <= 0;
    end else if (latch) begin
        r<=data;
    end else if (inc) begin
        r <= r+1;
    end
    
end

always @(*) begin
    if(enable) begin
        reg_out = r;
    end else begin
        reg_out = 8'bz;
    end
end

endmodule

