module sequence_counter(
  input wire clk,
  output reg [2:0] sc
);

// sequence_counter sequence_counter_instance(
//   clk(),
//   sc()
// )

  reg [2:0] internal_sc = 3'b000;

  always @(posedge clk) begin
    if (internal_sc == 3'b111) begin
      internal_sc <= 3'b000;
    end else begin
      internal_sc <= internal_sc + 1;
    end
    sc <= internal_sc; 
  end

endmodule
