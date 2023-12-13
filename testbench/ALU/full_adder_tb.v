`timescale 1ns / 1ps

module full_adder_tb();

    //inputs
    reg a,b,c_in;

    //outputs
    wire c_out;
    wire sum;
    reg d, e, f;
    reg check_c_out;
    reg check_sum;

    //instantiate full adder
    full_adder M1(.a(a), .b(b), .sum(sum), .c_out(c_out), .c_in(c_in));
    
    //changing values every 10ns
    initial
        begin
            // Check various test cases
            #10 a=1'd0; b=1'd1; c_in=1'd1;
            
            d = a ^ b;
            check_sum = c_in ^ d;
            e = a & b;
            f = d & c_in;
            check_c_out = e | f;
            
            #10 $finish;
        end
endmodule