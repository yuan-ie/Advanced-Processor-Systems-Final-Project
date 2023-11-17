`timescale 1ns / 1ps

module adder_4bit_tb();

    //inputs
    reg [3:0]a, b;
    reg c_in;

    //outputs
    wire c_out;
    wire [3:0]sum;
    reg [3:0]check_sum;

    //instantiate full adder
    adder_4bit M1(.a(a), .b(b), .sum(sum), .c_out(c_out), .c_in(c_in));
    
    //changing values every 10ns
    initial
        begin
            // Check various test cases
            #10 a=4'd2; b=4'd6; c_in=1'd1;
            check_sum = a+b+c_in;
            
            #10 a=4'd7; b=4'd3; c_in=1'd0;
            check_sum = a+b+c_in;
            
            #10 $finish;
        end
endmodule