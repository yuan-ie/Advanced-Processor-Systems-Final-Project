`timescale 1ns / 1ps

module left_shifter_1 (in, out);
    input [63:0] in;
    output [63:0] out;
    
    assign out = in << 1;
endmodule
