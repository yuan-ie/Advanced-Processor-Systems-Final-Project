`timescale 1ns / 1ps

module processor();

    // WIRES
    wire clk;
    wire c_in;
    wire overflow;
    wire [64:0] r;

    assign c_in = 0;

    // wires connect from output of PROGRAM COUNTER
    wire [31:0] pc_address;
        // to input of ADD block with the +4
        // to input of ADD block with shift left
        // to instruction memory

    // wires connect from INSTRUCTION MEMORY
    wire [31:0] instruction;
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

    // wire connects from ALU control
    wire [3:0] ALU_ctrl;
        // to ALU

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
    wire [63:0] sum_left;
        // to MUX input 1 connected add block

    // wire connects from add block connected to +4 input
    wire [63:0] sum_4;
        // to MUX input 0 connected add block

    // wires connect from branch and zero signals
    wire and_result;
        // to MUX signal input connected to add block
    

    // instantiate modules
    
    // PROGRAM COUNTER
    program_counter P(.clk(clk), .addr_in(add_mux_out), .addr_out(pc_address));

    // INSTRUCTION MEMORY
    instruction_memory IM (.address(pc_address), .instruction(instruction));

    // CONTROL
    control C (.opcode(instruction[6:0]), .ALUsrc(ALUsrc), .mem2reg(mem2reg), .reg_write(regwrite), .mem_read(memread), .mem_write(memwrite), .branch(branch), .ALU_op(ALUop));

    // REGISTER FILE
    register_file R (.clk(clk), .rs1(instruction[19:15]), .rs2(instruction[24:20]), .rd(instruction[11:7]), .write_data(data_mux_out), .reg_write(regwrite), .read_data1(read_data1), .read_data2(read_data2));

    // IMMEDIATE GENERATOR
    immediate_generator I (.instruction(instruction), .out(immediate));

    // MUX CONNECTED TO REGISTER FILE
    mux M1 (.in_1(read_data2), .in_2(immediate), .signal(ALUsrc), .out(reg_mux_out));

    // ALU CONTROL
    ALU_control AC (.ALUop(ALUop), .funct7(instruction[31:25]), .funct3(instruction[14:12]), .ALU_output(ALU_ctrl));

    // ALU
    ALU_top AT (.ALU_ctrl(ALU_ctrl), .input1(read_data1), .input2(reg_mux_out), .zero(zero), .result(ALU_result), .overflow(overflow), .r(r));

    // DATA MEMORY
    data_memory D (.clk(clk), .address(ALU_result), .write_data(read_data2), .mem_read(memread), .mem_write(memwrite), .read_data(read_data));

    // MUX CONNECTED TO DATA MEMORY
    mux M2 (.in_1(ALU_result), .in_2(read_data), .signal(mem2reg), .out(data_mux_out));
    
    // AND the branch and zero signal
    AND L1 (.in1(branch), .in2(zero), .out(add_mux_out)); 

    // MUX CONNECTED TO ADD BLOCK
    mux M3 (.in_1(sum_4), .in_2(sum_left), .signal(and_result), .out(add_mux_out));

    // SHIFT LEFT
    left_shifter_1 LS (.in(immediate), .out(left_shift_out));

    // ADD WITH SHIFT
    adder_64bit ADL (.a(pc_address), .b(left_shift_out), .sum(sum_left), .overflow(overflow), .c_in(c_in));
    
    // ADD + 4
    adder_64bit AD4 (.a(pc_address), .b(64'd4), .sum(sum_4), .overflow(overflow), .c_in(c_in));

endmodule