`timescale 1ns / 1ps

module half_adder_tb();

    //inputs
    reg a,b;

    //outputs
    wire c_out;
    wire sum;
    reg check_c_out;
    reg check_sum;

    //instantiate half adder
    half_adder M1(.a(a), .b(b), .sum(sum), .c_out(c_out));

    //changing values every 10ns
    initial
        begin
            // Check various test cases
            #10 a=1'd0; b=1'd0;
            check_sum = a ^ b;
            check_c_out = a & b;

            #10 a=1'd0; b=1'd1;
            check_sum = a ^ b;
            check_c_out = a & b;

//            #10 a=1'd1; b=1'd0;
//            check_sum = a ^ b;
//            check_c_out = a & b;

//            #10 a=1'd1; b=1'd1;
//            check_sum = a ^ b;
//            check_c_out = a & b;

            #10 $finish;
        end
endmodule