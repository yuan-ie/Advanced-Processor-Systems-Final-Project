`timescale 1ns / 1ps

module multiplier_tb();

    // inputs
    reg [63:0]a, b;
    
    // outputs
    wire [127:0] product;
    wire overflow;
    reg [127:0] prod_check;
    
    // instantiate multiplier
    multiplier M1(.a(a), .b(b), .product(product), .overflow(overflow));
    
    initial
        begin
            // Check various test cases
            
            // inputs are positive
            #10 a=64'd78; b=64'd97;
            prod_check = $signed(a*b);
            
            #10 a=64'd2504532; b=64'd945327;
            prod_check = $signed(a*b);
            
            // one input is negative
            #10 a= -64'd45; b=64'd65437;
            prod_check = $signed(a*b);
            
            // both inputs are negative
            #10 a= -64'd24878735; b= -64'd8793577;
            prod_check = $signed(a*b);
            
            #10 $finish;
        end
endmodule
