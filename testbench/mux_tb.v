`timescale 1ns / 1ps

module mux_tb();

    //inputs
    reg [63:0] in_1, in_2;
    reg signal;
    //outputs
    wire [63:0] out;

    //instantiate multiplexor
    mux M1 (.in_1(in_1), .in_2(in_2), .signal(signal), .out(out));
    
    //changing values every 10ns
    initial
        begin
            // Check various test cases
            in_1 = 64'd10000; in_2 = 64'd20000; 
            
            #10 signal = 1'd0;
            
            #10 signal = 1'd1;
            
            #10 $finish;
        end
endmodule