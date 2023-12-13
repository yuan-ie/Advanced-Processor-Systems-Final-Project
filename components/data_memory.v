`timescale 1ns / 1ps

module data_memory(clk, address, write_data, mem_read, mem_write, read_data);
    input clk;
    
    input [63:0] address, write_data;
    input mem_read, mem_write;

    output [63:0] read_data;

    // 1024 registers of 32 bits each
    reg [31:0] memory_data [0:1023]; 

    // counter
    integer i;

    // zero all of the registers
    initial begin
        for (i=0; i<1024 ; i=i+1) begin
            memory_data[i] = 32'h00000000;
        end

        // load initial data
        data_memory[0] = $signed(32'd1000)      // $1 = a
        data_memory[1] = $signed(32'd200)       // $2 = b
        data_memory[2] = $signed(-32'd1000)     // $3 = c
        data_memory[3] = $signed(32'd800)       // $4 = d
        data_memory[4] = $signed(-32'd100)      // $5 = e
        data_memory[5] = $signed(32'd3)         // $6 = f
    end

    // on the negative edge of the clock, write data to write register
    always @(negedge clk) begin
        if (mem_write == 1) begin
            memory_data[address] = write_data;
        end
        if (mem_read == 1) begin
            read = memory_data[address];
        end 
    end

endmodule