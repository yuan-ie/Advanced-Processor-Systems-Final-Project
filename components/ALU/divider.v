`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2023 11:25:34 PM
// Design Name: 
// Module Name: divider
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


module divider(a, b, quotient, overflow, r);

    // I/O
    input [63:0] a, b;
    output reg [63:0] quotient, r;
    output reg overflow;
    
    // others
    reg [127:0] remainder;
    reg [63:0] c, d; // temporary registers for inputs a and b
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
                d = b; // divisor
            end
            
            // note to self: 64'h(16zeros) = 64'b(64zeros) because one hex is 4 bits.
            remainder = {64'h0000000000000000, c}; // concatenates so it becomes 128 bits
            
            // shift remainder left 1 bit
            remainder = remainder << 1;
            
            for(i=0; i<64; i=i+1) begin
                // remainder(left half) = remainder(left half) - divisor
                remainder[127:64] = remainder[127:64] - d;
                
                // if MSB = 1 (if remainder is negative)
                if (remainder[127] == 1) begin
                    // reverse previous step
                    remainder[127:64] = remainder[127:64] + d;
                    // shift remainder left by 1
                    remainder = remainder << 1;
                end
                // if MSB = 0 (if remainder is positive)
                else if (remainder[127] == 0) begin
                    // shift remainder left by 1
                    remainder = remainder << 1;
                    // add 1
                    remainder = remainder + 1;
                end
            end
            
            // shift left half of remainder right 1 bit
            //remainder[127:64] = remainder[127:64] >> 1;
            
            
            
            // the actual remainder is left half of 'remainder'
            // store that into r and shift right by 1
            r = remainder[127:64];
            r = r >> 1;
            
            
            quotient = remainder[63:0];
            
            // if there is one negative, then the product is negative
            // so do 2's complement
            if(sign == 1) begin
                quotient = ~quotient + 1;
            end
            
            // if dividend is negative, then remainder is negative
            if (a[63] == 1) begin
                r = ~r + 1;
            end
                
            // check the most-significant bit.
            // if product is positive but MSB = 1, then overflow.
            // if product is negative but MSB = 0, then overflow.
            if( (remainder[127] == 1 && (sign == 0 || sign == 2)) || (remainder[127] == 0 && (sign == 1))) begin
                overflow = 1;
            end
            else begin
                overflow = 0;
            end
        end
endmodule
