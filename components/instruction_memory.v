`timescale 1ns / 1ps

module instruction_memory (address, instruction);
    input wire [31:0] address;
    output reg [31:0] instruction;

    // generate about 4kB of memory (32 * 1024 / 8)
    reg [31:0] mem [0:1023]; 

    // counter
    integer i;

    // zero all of the memory blocks
    initial begin
        for (i=0; i<1024 ; i=i+1) begin
            mem[i] = 32'h00000000;
        end

        // load all the initial data
        // [31:20] immediate (12 bits), [19:15] rs1 (5 bits), 
        // [14:12] 010 funct 3 (for load), [11:7] rd, [6:0] 0000011 opcode for load

        // for 0: 000000000000 00001 010 00001 0000011
        // note: immediate and rd increments
        mem[0] = 32'b00000000000000000010000010000011; // $1 = a
        mem[1] = 32'b00000000000100000010000100000011; // $2 = b
        mem[2] = 32'b00000000001000000010000110000011; // $3 = c
        mem[3] = 32'b00000000001100000010001000000011; // $4 = d
        mem[4] = 32'b00000000010000000010001010000011; // $5 = e
        mem[5] = 32'b00000000010100000010001100000011; // $6 = f

        // do the operation of the data: y = (a*b + c*d - e)/f
        // [31:25] funct7 (12 bits), [24:20] rs2, [19:15] rs1 (5 bits), 
        // [14:12] 010 funct 3 (for load), [11:7] rd, [6:0] 0110011 opcode for R-TYPE
        mem[6] = 32'b00000010001000001000000010110011; // $1 = a * b
        mem[7] = 32'b00000010010000011000000110110011; // $3 = c * d
        mem[8] = 32'b00000000001100001000000010110011; // $1 = $1 + $3
        mem[9] = 32'b01000000010100001010000010110011; // $1 = $1 - e
        mem[10] = 32'b00000010011000001100000010110011; // y = $1 = $1 / f

        // store y into address 2
        mem[11] = 32'b00000000000100000110010110100011; // rs2 = $1, rs1 = $0
    end

    always @* begin
        instruction = mem[address/4];
    end

endmodule