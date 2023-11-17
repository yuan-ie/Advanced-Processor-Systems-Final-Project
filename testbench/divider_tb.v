`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2023 12:38:01 AM
// Design Name: 
// Module Name: multiplier_tb2
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


module divider_tb();

    // inputs
    reg [63:0]a, b;
    
    // outputs
    wire [63:0] quotient, r;
    wire overflow;
    reg [63:0] quot_check;
    reg [63:0] rem_check;
    
    // instantiate multiplier
    divider M1(.a(a), .b(b), .quotient(quotient), .overflow(overflow), .r(r));
    
    initial
        begin
            // Check various test cases
            
            // inputs are positive
            #10 a=64'd78; b=64'd97;
            quot_check = $signed(a/b);
            rem_check = $signed(a%b);
            
            #10 a=64'd2504532; b=64'd945327;
            quot_check = $signed(a/b);
            rem_check = $signed(a%b);
            
            // one input is negative
            #10 a= -64'd45; b=64'd65437;
            quot_check = $signed(a/b);
            rem_check = $signed(a%b);
            
            // both inputs are negative
            #10 a= -64'd24878735; b= -64'd879357;
            quot_check = $signed(a/b);
            rem_check = $signed(a%b);
            
            // simple inputs
            #10 a= -64'd20; b= -64'd5;
            quot_check = $signed(a/b);
            rem_check = $signed(a%b);
            
            #10 a= 64'd20; b= -64'd5;
            quot_check = $signed(a/b);
            rem_check = $signed(a%b);
            
            #10 a= -64'd20; b= 64'd5;
            quot_check = $signed(a/b);
            rem_check = $signed(a%b);
            
            #10 a= 64'd20; b= 64'd5;
            quot_check = $signed(a/b);
            rem_check = $signed(a%b);
            
            #10 $finish;
        end
endmodule
