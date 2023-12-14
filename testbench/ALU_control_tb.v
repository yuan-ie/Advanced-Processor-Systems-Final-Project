`timescale 1ns / 1ps

module ALU_control_tb();
    
    // inputs
    reg [1:0] ALUop;
    reg [6:0] funct7;
    reg [2:0] funct3;
    // outputs
    wire [3:0] ALU_output;

    //instantiate ALU control
    ALU_control AC (.ALUop(ALUop), .funct7(funct7), .funct3(funct3), .ALU_output(ALU_output));
    
    initial begin
        
        #10 ALUop = 2'b10; funct7 = 7'b0000000; funct3 = 3'b000;
        
        #10 ALUop = 2'b10; funct7 = 7'b0100000; funct3 = 3'b000;
        
        #10 ALUop = 2'b10; funct7 = 7'b0000000; funct3 = 3'b111;
        
        #10 ALUop = 2'b00; funct3 = 3'b000;
        
        #10 $finish;
        
    end
    
endmodule