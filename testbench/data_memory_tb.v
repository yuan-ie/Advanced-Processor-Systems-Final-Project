`timescale 1ns / 1ps

module data_memory_tb();
    // inputs
    reg clk;
    reg [63:0] address;
    reg [31:0] write_data;
    reg mem_read, mem_write;
    
    wire [31:0] read_data;
    
    // instantiate the data memory
    data_memory D (.clk(clk), .address(address), .write_data(write_data), .mem_read(mem_read), .mem_write(mem_write), .read_data(read_data));
    
    initial begin
    
        #10 clk = 0; address = 64'd6; write_data = 32'd100;
        mem_read = 1'b0; mem_write = 1'b1;
        #10 clk = 1;
        
        #10 clk = 0; address = 64'd6; write_data = 32'd100;
        mem_read = 1'b1; mem_write = 1'b0;
        #10 clk = 1;
        
        #10 $finish;
        
    end
    
endmodule
