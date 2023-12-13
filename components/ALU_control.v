`timescale 1ns / 1ps

module ALU_control(ALUop, funct7, funct3, ALU_output);
    input [1:0] ALUop;
    input [6:0] funct7;
    input [2:0] funct3;
    output [3:0] ALU_output;

    reg [1:0] R_TYPE, LOAD, STORE, BRANCH, opcode;
    
        

    always @* begin

        // instruction type opcodes
        // R_TYPE = 2'b10;
        // LOAD = 2'b00;
        // STORE = 2'00;
        // BRANCH = 2'b01;


        // R-TYPE
        if (ALUop == 2'b10) begin
            // instruction add
            if ((funct3 = 3'b000) && (funct7 = 7'b0000000)) begin
                ALU_output = 4'b0010;
            end

            // instruction subtract
            if ((funct3 = 3'b000) && (funct7 = 7'b0100000)) begin
                ALU_output = 4'b0110;
            end

            // instruction AND
            if ((funct3 = 3'111) && (funct7 = 7'b0000000)) begin
                ALU_output = 4'b0000;
            end

            // instruction OR
            if ((funct3 = 3'b110) && (funct7 = 7'b0000000)) begin
                ALU_output = 4'b0001;
            end

            // instruction multiply
            if ((funct3 = 3'b000) && (funct7 = 7'b0000001)) begin
                ALU_output = 4'b0111;
            end

            // instruction division
            if ((funct3 = 3'b100) && (funct7 = 7'b0000001)) begin
                ALU_output = 4'b0100;
            end

        end

        // LOAD and STORE
        if (ALU_op == 2'b00) begin
            // instruction lw and sw
            if (funct3 = 3'b110) begin
                ALU_output = 4'0010;
            end
        end

        // BRANCH
        if (ALU_op == 2'b00) begin
            // instruction beq
            if (funct3 = 3'b000) begin
                ALU_output = 4'0110;
            end
        end
    end


endmodule