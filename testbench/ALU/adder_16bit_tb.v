`timescale 1ns / 1ps

module adder_16bit_tb();

    //inputs
    reg [15:0]a, b;
    reg c_in;

    //outputs
    wire c_out;
    wire [15:0]sum;
    reg [15:0]check_sum;

    //instantiate full adder
    adder_16bit M1 (.a(a), .b(b), .sum(sum), .c_out(c_out), .c_in(c_in));
    
    //changing values every 10ns
    initial
        begin
            // Check various test cases
            #10 a=16'd465; b=16'd987; c_in=1'd1;
            check_sum = a+b+c_in;
            
            #10 a=16'd356; b=16'd74; c_in=1'd0;
            check_sum = a+b+c_in;
            
            #10 $finish;
        end
endmodule