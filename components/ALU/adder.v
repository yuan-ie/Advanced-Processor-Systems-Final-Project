`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2023 10:07:05 PM
// Design Name: 
// Module Name: adder
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
module half_adder (sum, c_out, a, b);
    output sum, c_out;
    input a, b;
    
    assign sum = a ^ b;
    assign c_out = a & b; 
endmodule

module full_adder (sum, c_out, a, b, c_in);
    output sum, c_out;
    input a, b, c_in;
    wire w1, w2, w3;
    half_adder M1 (w1, w2, a, b);
    half_adder M2 (sum, w3, w1, c_in);
    or M3 (c_out, w2, w3);
endmodule

module adder_4bit (sum, c_out, a, b, c_in);
    output [3: 0] sum;
    output c_out;
    input [3: 0] a, b;
    input c_in;
    wire c_in2, c_in3, c_in4;
    full_adder M1 (sum[0], c_in2, a[0], b[0], c_in);
    full_adder M2 (sum[1], c_in3, a[1], b[1], c_in2);
    full_adder M3 (sum[2], c_in4, a[2], b[2], c_in3);
    full_adder M4 (sum[3], c_out, a[3], b[3], c_in4);
endmodule

module adder_16bit (sum, c_out, a, b, c_in);
    output [15:0] sum;
    output c_out;
    input [15:0] a, b;
    input c_in;
    wire c_in4, c_in8, c_in12;
    
    adder_4bit M1 (sum[3:0], c_in4, a[3:0], b[3:0], c_in);
    adder_4bit M2 (sum[7:4], c_in8, a[7:4], b[7:4], c_in4);
    adder_4bit M3 (sum[11:8], c_in12, a[11:8], b[11:8], c_in8);
    adder_4bit M4 (sum[15:12], c_out, a[15:12], b[15:12], c_in12);
endmodule

module adder_64bit (sum, overflow, a, b, c_in);
    output [63:0] sum;
    output reg overflow;
    input [63:0] a, b;
    input c_in;
    wire c_in16, c_in32, c_in48, c_out;
    
    adder_16bit M1 (sum[15:0], c_in16, a[15:0], b[15:0], c_in);
    adder_16bit M2 (sum[31:16], c_in32, a[31:16], b[31:16], c_in16);
    adder_16bit M3 (sum[47:32], c_in48, a[47:32], b[47:32], c_in32);
    adder_16bit M4 (sum[63:48], c_out, a[63:48], b[63:48], c_in48);
    
    always @*
        begin
            overflow = 0;
            // if both input numbers are negative, but output is positive, overflow = 1
            // if both input numbers are positive but output is negative, overflow = 1   
            if( (a[63]==1 && b[63]==1 && sum[63]==0) || (a[63]==0 && b[63]==0 && sum[63]==1) )
            begin
                overflow = 1;
            end
        
        
        end
endmodule