module control
(
    input wire clk,
    input wire [2:0] sc
//    input [3:0] instruction,
//    input clk,
//    input bReset,
//    input flag_carry,
//    input flag_zero,
//    output reg hlt,
//    output reg memory_in,
//    output reg ram_in,
//    output reg instruction_in,
//    output reg reg_a_in,
//    output reg subtract,
//    output reg reg_b_in,
//    output reg out_in,
//    output reg advance_pc,
//    output reg pc_in,
//    output reg flags_in,
//    output reg [`BusSelectorBits-1:0] bus_selector
   );

    // always @(posedge clk ) begin
    //     case (sc)
    //         `T0: 
                
    //         `T1: 
    //     endcase
    // end
    
//    `include "src/parameters.v"
//    `include "src/alu.v"


//    reg [1:0] sc;
//    reg [2:0] opcode;
//    always @(posedge clk ) begin
//        case(sc)
//            `T0:        // fetch the operation
//                pc_in <= 1;

//            `T1:        // decode cycle
//                opcode <= instruction[7:5] 
//            
//            `T2:        // execution cycle
//                if(opcode[2]==0)
//                    alu alu(
//                        enable(1'b1),
//                        clk(.clk),
//                        mode(.opcode),
//                        in_a,
//                        in_b,
//                        flag_zero(.flag_zero),
//                        flag_carry(.flag_carry)
//                    );
//                else
//                    case(opcode)
//                        `OP_LOAD:
//                             load operations
//                        `OP_STORE:
//                             store operations
//                        `OP_JMP:
//                             jmp opeations
//                        `OP_BEQ:
//                             break if equal operation
//                    endcase

//            default:
//                 do nothing or send error
//        endcase
//    end

endmodule