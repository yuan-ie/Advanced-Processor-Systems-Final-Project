`timescale 1ns / 1ps

module ALU_top_tb();

    reg [3:0] ALU_ctrl;
    reg [63:0] input1, input2;
    
    wire zero;
    wire [63:0] result, r;
    wire overflow;
    
    ALU_top AT (.ALU_ctrl(ALU_ctrl), .input1(input1), .input2(input2), .zero(zero), .result(result), .overflow(overflow), .r(r));
    
    initial begin
        
        // add
        #10 ALU_ctrl = 4'b0010;
        input1 = 64'd100; input2 = 64'd200;
        
        // subtract
        #10 ALU_ctrl = 4'b0110;
        input1 = 64'd100; input2 = 64'd200;
        
        // multiply
        #10 ALU_ctrl = 4'b0111;
        input1 = 64'd10; input2 = 64'd20;
        
        // division
        #10 ALU_ctrl = 4'b0100;
        input1 = 64'd10; input2 = 64'd20;
        
        // and
        #10 ALU_ctrl = 4'b0000;
        input1 = 64'd1; input2 = 64'd0;
        
        // or
        #10 ALU_ctrl = 4'b0001;
        input1 = 64'd1; input2 = 64'd0;
        
        // subtract to get zero
        #10 ALU_ctrl = 4'b0110;
        input1 = 64'd10; input2 = 64'd10;
        
        #10 $finish;
    
    end


endmodule