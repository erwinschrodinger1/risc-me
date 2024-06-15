module main();

initial
  begin
  wire clock;

  Gowin_OSC cock_instance(
    .oscout(clock)
  );

  general_registers general_registers_instance(
    clk(),
    reset(),
    src_bus_selector(),
    dest_bus_selector(),
    data(),
    src()
  );  

  end

endmodule