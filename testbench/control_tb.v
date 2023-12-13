`timescale 1ns / 1ps

module control_tb();
    // input
    reg [6:0] opcode;
    
    // output
    wire ALUsrc, mem2reg, reg_write, mem_read, mem_write, branch;
    wire [1:0] ALU_op;
    
    // instantiate control
    control M1 (.opcode(opcode), .ALUsrc(ALUsrc), .mem2reg(mem2reg), .reg_write(reg_write), .mem_read(mem_read), .mem_write(mem_write), .branch(branch), .ALU_op(ALU_op));
    
    initial
        begin
        
            #10 opcode = 7'b0110011; // R-Type
            
            #10 opcode = 7'b0000011; // Load
            
            #10 opcode = 7'b0100011; // Store
            
            #10 opcode = 7'b1100111; // Branch
            
            #10 $finish;
        
        end
endmodule
