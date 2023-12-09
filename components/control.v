`timescale 1ns / 1ps

module control (opcode, ALUsrc, mem2reg, reg_write, mem_read, mem_write, branch, ALU_op);
    input [6:0] opcode; 
    output ALUsrc, mem2reg, reg_write, mem_read, mem_write, branch;
    output [1:0] ALU_op;

    reg [6:0] R_TYPE, LOAD, STORE, BRANCH, opcode;

    always @* begin
        // determine instruction type from opcode
        opcode = instruction[6:0];

        // instruction type opcodes
        R_TYPE = 7'b0110011;
        LOAD = 7'b0000011;
        STORE = 7'b0100011;
        BRANCH = 7'b1100111;

        if (R_TYPE == opcode)
            begin
                ALUsrc = 0;
                mem2reg = 0;
                reg_write = 1;
                mem_read = 0;
                mem_write = 0;
                branch = 0;
                ALU_op = 2'b10;
            end
        if (LOAD == opcode)
            begin
                ALUsrc = 1;
                mem2reg = 1;
                reg_write = 1;
                mem_read = 1;
                mem_write = 0;
                branch = 0;
                ALU_op = 2'b00;
            end
        if (STORE == opcode)
            begin
                ALUsrc = 1;
                mem2reg = X;
                reg_write = 0;
                mem_read = 0;
                mem_write = 1;
                branch = 0;
                ALU_op = 2'b00;
            end
        if (BRANCH == opcode)
            begin
                ALUsrc = 0;
                mem2reg = X;
                reg_write = 0;
                mem_read = 0;
                mem_write = 0;
                branch = 1;
                ALU_op = 2'b01;
            end
    end

endmodule