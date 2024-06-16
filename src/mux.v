module mux (
    input wire [2:0] selector_line,
    input wire [7:0] general_registers_data,
    input wire [7:0] pc_data,
    input wire [7:0] ir_data,
    input wire [7:0] mar_data,
    input wire [7:0] memory_data,
    output reg [7:0] mux_output
);

// mux mux_instance (
//     .selector_line(),
//     .general_registers_data(),
//     .pc_data(),
//     .ir_data(),
//     .mar_data(),
//     .memory_data(),
//     .mux_output()
// );

    always @* begin
        case (selector_line)
            `GENERAL_REGISTERS: mux_output <= general_registers_data;
            `PC: mux_output <= pc_data;
            `IR: mux_output <= ir_data;
            `MAR: mux_output <= mar_data;
            `MEMORY: mux_output <= memory_data;
            default: mux_output <= 8'bz; // Output high impedance for unknown selector
        endcase
    end

endmodule
