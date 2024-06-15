// OPCODES in bits
`define OP_ADD 3'b000
`define OP_SUB 3'b001
`define OP_AND 3'b010
`define OP_OR  3'b011
`define OP_LOAD 3'b100
`define OP_STORE 3'b101
`define OP_JMP 3'b110
`define OP_BEQ 3'b111

`define R0_SELECTOR 3'b000
`define R1_SELECTOR 3'b001
`define R2_SELECTOR 3'b010
`define R3_SELECTOR  3'b011
`define R4_SELECTOR 3'b100
`define R5_SELECTOR 3'b101
`define R6_SELECTOR 3'b110
`define R7_SELECTOR 3'b111

// SC States
`define T0 2'b00
`define T1 2'b01
`define T2 2'b10
`define T3 2'b11
