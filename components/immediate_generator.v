`timescale 1ns / 1ps

module immediate_generator(instruction, out);

    input [31:0] instruction;
    output [63:0] out;
    wire [6:0] opcode;

    always @* begin
        // determine instruction type from opcode
        opcode = instruction[6:0];

        // instruction type opcodes
        LOAD = 7'b0000011;
        STORE = 7'b0100011;
        BRANCH = 7'b1100111;

        // depending on the type, get the output from the instruction
        if (LOAD == opcode)
            begin
                out = $signed(instruction[31:20]); // 12 bits
            end
        if (STORE == opcode)
            begin
                out = $signed({instruction[31:25] , instruction[11:7]}); // concatenate to make 12 bits
            end
        if (BRANCH == opcode)
            begin
                out = $signed(instruction[31:20]); // 12 bits
            end
    end

endmodule