// module main();

// initial
//   begin
//   wire clk;
//   reg reset;
//   reg [2:0]src_bus_selector;
//   reg [2:0]dest_bus_selector;
//   wire [7:0] data;
//   wire [7:0]src;
  

//   Gowin_OSC cock_instance(
//     .oscout(clk)
//   );

//   wire [2:0] sc;

//   sequence_counter sequence_counter_instance(
//     clk(clk),
//     sc(sc)
//   )

//   reg [7:0] pc =8'b0;
//   register program_counter(
//     .clk(clk),
//     .reset(),
//     .data(pc),
//     .reg_out(pc),
//     .enable(),
//     .latch()
//     .inc()
// );

  
//   general_registers general_registers_instance(
//     clk(clk),
//     reset(reset),
//     src_bus_selector(src_bus_selector),
//     dest_bus_selector(dest_bus_selector),
//     data(data),
//     src(src)
//   );  



//   end

// endmodule