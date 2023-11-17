`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/16/2023 09:39:06 PM
// Design Name: 
// Module Name: mux
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


module mux (in_1, in_2, out, signal);
    input [63:0] in_1, in_2;
    input signal;
    output reg [63:0] out;
    
    always @ *
    begin
        if (signal == 0)
        begin
            out = in_1;
        end
        else if (signal == 1)
        begin
            out = in_2;
        end
    
    end  
endmodule
