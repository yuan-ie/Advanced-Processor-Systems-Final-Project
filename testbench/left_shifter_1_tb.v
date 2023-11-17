`timescale 1ns / 1ps

module left_shifter_tb();

    //inputs
    reg [63:0] in;
    wire [63:0] out;

    //instantiate left_shifter_1
    left_shifter_1 M1(.in(in), .out(out));
    
    //changing values every 10ns
    initial
        begin
            // Check various test cases

            #10 in = 64'd1;
            
            #10 in = 64'd2;
            
            #10 in = 64'd4;
            
            #10 in = 64'd8;
            
            #10 $finish;
        end
endmodule