`timescale 1ns / 1ps

module data_memory(clk, address, write_data, mem_read, mem_write, read_data);
    input clk;
    
    input [63:0] address;
    input [31:0] write_data;
    input mem_read, mem_write;

    output reg [31:0] read_data;

    // 1024 registers of 32 bits each
    reg [31:0] data_mem [0:1023]; 

    // counter
    integer i;

    // zero all of the registers
    initial begin
        for (i=0; i<1024 ; i=i+1) begin
            data_mem[i] = 32'h00000000;
        end

        // load initial data
        data_mem[0] = $signed(32'd1000);      // $1 = a
        data_mem[1] = $signed(32'd200);       // $2 = b
        data_mem[2] = $signed(-32'd1000);     // $3 = c
        data_mem[3] = $signed(32'd800);       // $4 = d
        data_mem[4] = $signed(-32'd100);      // $5 = e
        data_mem[5] = $signed(32'd3);         // $6 = f
    end

    // on the negative edge of the clock, 
    always @(negedge clk) begin
        // write data to register
        if (mem_write == 1) begin
            data_mem[address] = write_data;
        end
        
        // read the data from register
        if (mem_read == 1) begin
            read_data = data_mem[address];
        end 
    end

endmodule