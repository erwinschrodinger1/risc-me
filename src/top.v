module top();
    initial begin
    end

    wire clk;
    Gowin_OSC clk_instance(
        .oscout(clk)
    );

    wire [2:0] sc;
    sequence_counter sequence_counter_instance(
        .clk(clk),
        .sc(sc)
    );

    wire [7:0] src1_bus;
    wire [2:0] src1_bus_selector;

    mux src1_bus_instance (
        .selector_line(src1_bus_selector),
        // .general_registers_data(reg_src1_output),
        .pc_data(pc_output),
        .ir_data(ir_output),
        .mar_data(mar_output),
        .memory_data(memory_output),
        .mux_output(src1_bus)
    );

    wire [7:0] src2_bus;
    wire [2:0] src2_bus_selector;

    mux src2_bus_instance (
        .selector_line(src2_bus_selector),
        .general_registers_data(reg_src2_output),
        .pc_data(pc_output),
        .ir_data(ir_output),
        .mar_data(mar_output),
        .memory_data(memory_output),
        .mux_output(src2_bus)
    );

    wire [7:0] dest_bus;
    wire [2:0] dest_bus_selector;
    
    mux dest_bus_instance (
        .selector_line(dest_bus_selector),
        .general_registers_data(reg_dest_output),
        .pc_data(pc_output),
        .ir_data(ir_output),
        .mar_data(mar_output),
        .memory_data(memory_output),
        .mux_output(dest_bus)
    );

    wire [7:0] pc;
    wire pc_reset;
    wire pc_latch;
    wire pc_inc;
    wire [7:0]pc_output;
    register program_counter(
        .clk(clk),
        .reset(pc_reset),
        .data(dest_bus),
        .reg_out(pc),
        .latch(pc_latch),
        .inc(pc_inc)
    );

    wire [7:0] mar;
    wire mar_reset;
    wire mar_latch;
    wire mar_inc;
    wire [7:0]mar_output;
    register memory_address_register(
        .clk(clk),
        .reset(mar_reset),
        .data(dest_bus),
        .reg_out(mar),
        .latch(mar_latch),
        .inc(mar_inc)
    );

    wire [7:0] ir;
    wire ir_reset;
    wire ir_latch;
    wire ir_inc;
    wire [7:0]ir_output;
    register instruction_register(
        .clk(clk),
        .reset(ir_reset),
        .data(dest_bus),
        .reg_out(ir),
        .latch(ir_latch),
        .inc(ir_inc)
    );

    wire mem_write;
    wire [7:0]memory_output;
    memory memory_instance(
        .clk(clk),
        .mem_write(mem_write),
        .address(mar),
        .input_data(dest_bus),
        .output_data(memory_output)
    );

    wire [2:0] reg_src1_bus_selector;
    wire [2:0] reg_src2_bus_selector;
    wire [2:0] reg_dest_bus_selector;
    wire [7:0] reg_src1_output;
    wire [7:0] reg_src2_output;

    general_registers general_registers_instance(
        .clk(clk),
        .reset(1'b0),
        .src1_bus_selector(reg_src1_bus_selector),
        .src2_bus_selector(reg_src2_bus_selector),
        .dest_bus_selector(reg_dest_bus_selector),
        .data(dest_bus),
        .src1(reg_src1_output),
        .src2(reg_src2_output)
    );

    wire alu_en;
    wire flag_zero;
    wire flag_carry;

    alu alu_instance(
        .enable(alu_en),
        .clk(clk),
        .mode(ir[7:5]),
        .in_a(src1_bus),
        .in_b(src2_bus),
        .out(dest_bus),
        .flag_zero(flag_zero),
        .flag_carry(flag_carry)
    );

    control control_instance(
        .clk(clk),
        .sc(sc),
        .mem_write(mem_write),

 
        .pc_latch(pc_latch),
        .pc_inc(pc_inc),
        .pc_reset(pc_reset),

 
        .mar_latch(mar_latch),
        .mar_inc(mar_inc),
        .mar_reset(mar_reset),


        .ir(ir),
        .ir_latch(ir_latch),
        .ir_inc(ir_inc),
        .ir_reset(ir_reset),


        .alu_en(alu_en),
        .flag_zero(flag_zero),
        .flag_carry(flag_carry),

        .src1_bus_selector(src1_bus_selector),
        .src2_bus_selector(src2_bus_selector),
        .dest_bus_selector(dest_bus_selector),

        .reg_src1_bus_selector(reg_src1_bus_selector),
        .reg_src2_bus_selector(reg_src2_bus_selector),
        .reg_dest_bus_selector(reg_dest_bus_selector)
    );
endmodule
