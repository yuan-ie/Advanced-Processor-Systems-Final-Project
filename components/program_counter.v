`timescale 1ns / 1ps

module program_counter (clk, addr_in, addr_out);

    input clk;
    input [31:0] addr_in;    // input address
    output reg [31:0] addr_out;  // output address

    // zero the address
    initial begin
        addr_out = 32'h00000000;
    end

    // at positive edge of clock, set output address equal to the input address
    always @(posedge clk) begin
        addr_out = addr_in;
    end
    
endmodule
