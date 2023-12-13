`timescale 1ns / 1ps
module program_counter_tb();
    
    // inputs
    reg [31:0] in;
    reg clk;
    
    // outputs
    reg [31:0] check_out;
    wire [31:0] out;
    
    program_counter P (.clk(clk), .addr_in(in), .addr_out(out));
    
    initial begin
    
    # 10 clk = 1; in = 32'b00000000000000000000000000000001;

    # 10 clk = 0; in = 32'b00000000000000000000000000011000;
    
    # 10 clk = 1; in = 32'b00000000000000000000000000001010;
    
    #10 $finish;
    
    end


endmodule
