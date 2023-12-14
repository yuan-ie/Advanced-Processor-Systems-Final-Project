`timescale 1ns / 1ps

module subtractor (difference, overflow, a, b, c_in);
    output [63:0] difference;
    output overflow;
    input [63:0] a, b;
    input c_in;
    wire [63:0]negative;
    
    assign negative = ~b + 1;
    
    adder_64bit M1(.a(a), .b(negative), .sum(difference), .overflow(overflow), .c_in(c_in));
endmodule