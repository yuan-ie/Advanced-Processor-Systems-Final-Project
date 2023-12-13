`timescale 1ns / 1ps

module instruction_memory (address, instruction);
    input wire [31:0] address;
    output reg [31:0] instruction;

    instruction = [31:0] address;

    // 1024 registers of 32 bits each
    reg [31:0] instruction_mem [0:1023]; 

    // counter
    integer i;

    // zero all of the registers
    initial begin
        for (i=0; i<1024 ; i=i+1) begin
            instruction_mem[i] = 32'h00000000;
        end

        // load all the initial data
        // a = 1000
        

        // y = (a*b + c*d - e)/f



    end

endmodule