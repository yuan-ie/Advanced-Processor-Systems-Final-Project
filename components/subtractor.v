`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2023 01:54:52 PM
// Design Name: 
// Module Name: subtractor
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module subtractor_64bit (difference, overflow, a, b, c_in);
    output [63:0] difference;
    output overflow;
    input [63:0] a, b;
    input c_in;
    wire [63:0]negative;
    
    assign negative = ~b + 1;
    
    adder_64bit M1(.a(a), .b(negative), .sum(difference), .overflow(overflow), .c_in(c_in));
endmodule