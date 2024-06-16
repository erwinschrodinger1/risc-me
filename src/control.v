`include "parameters.v"

module control
(
    input wire clk,
    input wire [2:0] sc,
    output reg mem_read,
    output reg mem_write,


    output reg pc_en,
    output reg pc_latch,
    output reg pc_inc,
    output reg pc_reset,


    output reg mar_en,
    output reg mar_latch,
    output reg mar_inc,
    output reg mar_reset,


    input wire [7:0] ir, 
    output reg ir_en,
    output reg ir_latch,
    output reg ir_inc,
    output reg ir_reset,


    output reg alu_en,
    input wire flag_zero,
    input wire flag_carry,

    output reg [2:0] src1_bus_selector,
    output reg [2:0] src2_bus_selector,
    output reg [2:0] dest_bus_selector,


    output reg [2:0] reg_src1_bus_selector,
    output reg [2:0] reg_src2_bus_selector,
    output reg [2:0] reg_dest_bus_selector
);

    always @(posedge clk) begin
        pc_en <= 0;
        pc_latch <= 0;
        pc_inc <= 0;
        mar_en <= 0;
        mar_latch <= 0;
        mar_inc <= 0;
        ir_en <= 0;
        ir_latch <= 0;
        ir_inc <= 0;
        mem_read <= 0;
        mem_write <= 0;
        alu_en <= 0;
        src1_bus_selector <= 3'bz;
        src2_bus_selector <= 3'bz;
        dest_bus_selector <= 3'bz;
        reg_src1_bus_selector<=3'bz;
        reg_src2_bus_selector<=3'bz;
        reg_dest_bus_selector<=3'bz;

        case (sc)
            `T0: begin // fetch cycle
                dest_bus_selector <= `PC;
                mar_latch <= 1'b1;
            end
            `T1: begin // fetch cycle
                dest_bus_selector <= `MEMORY;
                pc_inc <= 1'b1;
                ir_latch <= 1'b1;
            end
            `T2: begin // decode cycle but do nothing
                // No operation
            end
            `T3: begin
                case (ir[7:5])
                    `OP_ADD, `OP_AND, `OP_OR, `OP_SUB: begin
                        reg_dest_bus_selector <= ir[4:2];
                        reg_src1_bus_selector <= ir[4:2];
                        reg_src2_bus_selector <= ir[1:0];
                        src1_bus_selector <= `GENERAL_REGISTERS;
                        src2_bus_selector <= `GENERAL_REGISTERS;
                        dest_bus_selector <= `GENERAL_REGISTERS;
                        alu_en <= 1'b1;
                    end
                    `OP_LOAD: begin
                        
                        dest_bus_selector <= `PC;
                        mar_latch <= 1'b1;
                    end
                    `OP_STORE: begin
                        
                        dest_bus_selector <= `PC;
                        mar_latch <= 1'b1;
                    end
                    `OP_JMP: begin
                        reg_src1_bus_selector <= ir[4:2];
                        dest_bus_selector <= `GENERAL_REGISTERS;
                        pc_latch <= 1'b1;
                    end
                    `OP_BEQ: begin
                        reg_src1_bus_selector <= ir[4:2];
                        src1_bus_selector <= `GENERAL_REGISTERS;
                        if (flag_zero) begin
                            pc_latch <= 1'b1;
                        end
                    end
                endcase
            end
            `T4: begin
                pc_inc <= 1'b1;
                case (ir[7:5])
                    `OP_LOAD: begin
                        reg_dest_bus_selector <= ir[4:2];
                        dest_bus_selector <= `MEMORY;
                    end
                    `OP_STORE: begin
                        reg_src1_bus_selector <= ir[4:2];
                        mem_write <= 1'b1;
                        dest_bus_selector <= `MEMORY;
                    end
                endcase
            end
        endcase
    end
    
endmodule
