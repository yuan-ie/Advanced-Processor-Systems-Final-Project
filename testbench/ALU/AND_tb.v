`timescale 1ns / 1ps

module AND_tb();

    // inputs
    reg [63:0]a, b;
    
    // outputs
    wire [63:0] out;
    reg [63:0] check_out;
    
    // instantiate AND logic
    AND M1(.in1(a), .in2(b), .out(out)); 
    
    initial
        begin
            // Check various test cases
            
            // inputs are positive
            #10 a=64'd100; b=64'd200;
            check_out = $signed(a&b);
            
            #10 a=64'd1000; b=64'd10;
            check_out = $signed(a&b);            
            
            #10 $finish;
        end

endmodule