`timescale 1ns / 1ps

module processor();

    // WIRES
    // wires connect from output of PROGRAM COUNTER
    wire [31:0] pc_address;
        // to input of ADD block with the +4
        // to input of ADD block with shift left
        // to instruction memory

    // wires connect from INSTRUCTION MEMORY
    wire [31:0] instruction
        // [6:0] to control
        // [19:15] to read register 1
        // [24:20] to read register 2
        // [11:7] to write register
        // [31:0] to immediate generator

    // wires connect from CONTROL
    wire branch, memread, mem2reg, memwrite, ALUsrc, regwrite;
    wire [1:0] ALUop;
        // branch to AND gate
        // memread and memwrite to data memory
        // mem2reg to MUX signal input (that is connected to data memory)
        // ALUsrc to MUX input signal (that is connected to register file and ALU)
        // regwrite to register file
        // ALUop to ALU control

    // wires connect from REGISTER FILE
    wire [63:0] read_data1, read_data2;
        // read data 1 to ALU input 1
        // read data 2 to MUX input 0

    // wire connects from IMMEDIATE GENERATOR
    wire [63:0] immediate;
        // to MUX input 1 AND left shifter

    // wires connect from ALU
    wire zero;
    wire [63:0] ALU_result;
        // zero to AND gate
        // ALU_result to address input of data memory AND input 0 of MUX

    // wires connect from DATA MEMORY
    wire [63:0] read_data;
        // to MUX input 1

    // wire connects from MUX connected to the register file
    wire [63:0] reg_mux_out;
        // to ALU input 2

    // wire connects from MUX connected to the data memory
    wire [63:0] data_mux_out;
        // to write data of register file

    // wire connects from MUX connected to add block
    wire [63:0] add_mux_out;
        // to program counter

    // wire connects from left shifter
    wire [63:0] left_shift_out;
        // to ADD block with shift left

    // wire connects from add block connected to left shifter
    wire [63:0] add_left;
        // to MUX input 1 connected add block

    // wire connects from add block connected to +4 input
    wire [63:0] add_4;
        // to MUX input 0 connected add block
    



endmodule