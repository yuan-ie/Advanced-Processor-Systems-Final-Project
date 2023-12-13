`timescale 1ns / 1ps

module subtractor_64bit_tb();

    //inputs
    reg [63:0]a, b;
    reg c_in;

    //outputs
    wire overflow;
    wire [63:0]difference;
    reg [63:0]check_dif;

    //instantiate full adder
    subtractor_64bit M1 (.a(a), .b(b), .difference(difference), .overflow(overflow), .c_in(c_in));
    
    //changing values every 10ns
    initial
        begin
            // Check various test cases
            #10 a=64'd738468; b=64'd900000; c_in=1'd0;
            check_dif = a-b;
            
            #10 a=64'd7446525; b=64'd1000000; c_in=1'd0;
            check_dif = a-b;
            
            #10 $finish;
        end
endmodule