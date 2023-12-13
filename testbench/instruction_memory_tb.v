`timescale 1ns / 1ps

module instruction_memory_tb();
    
    // inputs
    reg [31:0] address;
    
    // outputs
    wire [31:0] instruction;
    
    instruction_memory IM (.address(address), .instruction(instruction));
    
    initial begin
        // address 0 becomes 0
        #10 address = 32'b00000000000000000000000000000000;
        
        // address 4 becomes 1
        #10 address = 32'b00000000000000000000000000000100;
        
        // address 8 becomes 2
        #10 address = 32'b00000000000000000000000000001000;
        
        #10 $finish;
    end

endmodule