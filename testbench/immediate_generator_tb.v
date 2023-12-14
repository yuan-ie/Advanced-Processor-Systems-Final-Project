`timescale 1ns / 1ps

module immediate_generator_tb();

    // inputs
    reg [32:0] instruction;
    // outputs
    wire [63:0] out;
    
    immediate_generator I (.instruction(instruction), .out(out));
    
    initial begin
        // load immediate 2
        #10 instruction = 32'b00000000001000000010000110000011;
        
        // store immediate 11
        #10 instruction = 32'b00000000000100000110010110100011;
        
        // branch if immediate 3
        #10 instruction = 32'b00000000001100000010000111100111;
        
        #10 $finish;
        
    end


endmodule