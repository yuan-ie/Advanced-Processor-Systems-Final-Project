`timescale 1ns / 1ps

module instruction_memory (address, instruction);
    input wire [63:0] address;
    output reg [31:0] instruction;

    instruction = [31:0] address;
endmodule