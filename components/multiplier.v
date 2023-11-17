`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2023 11:29:33 PM
// Design Name: 
// Module Name: multiplier
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


module multiplier(a, b, product, overflow);
    input [63:0] a, b;
    output reg [127:0] product;
    output reg overflow;
    reg [63:0] c, d;
    integer sign, i;
    
    // this block will execute if a or b changes
    always @(a or b)
        begin
            sign = 0;
            
            // check if input a is negative
            if(a[63] == 1) begin
                c = ~a + 1; //2's complement
                sign = sign + 1;
            end
            else begin
                c = a;
            end
            
            // check if input b is negative
            if(b[63] == 1) begin
                d = ~b + 1; //2's complement
                sign = sign + 1;
            end
            else begin
                d = b;
            end
            
            // note to self: 64'h(16zeros) = 64'b(64zeros) because one hex is 4 bits.
            product = {64'h0000000000000000, d}; // concatenates so it becomes 128 bits
            
            
            for(i=0; i<64; i=i+1) begin
                // if very first bit = 1, do operation (product + multiplicand)
                if (product[0] == 1) begin
                    product[127:64] = product[127:64] + c;
                end
                // else no operation
                
                // shift right by 1
                product = product >> 1;
            end
            
            // if there is one negative, then the product is negative
            // so do 2's complement
            if(sign == 1) begin
                product = ~product + 1;
            end
            
            // check the most-significant bit.
            // if product is positive but MSB = 1, then overflow.
            // if product is negative but MSB = 0, then overflow.
            if( (product[127] == 1 && (sign == 0 || sign == 2)) || (product[127] == 0 && (sign == 1))) begin
                overflow = 1;
            end
            else begin
                overflow = 0;
            end
        end
endmodule
