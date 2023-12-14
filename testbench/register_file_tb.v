`timescale 1ns / 1ps

module register_file_tb();
    // input
    reg clk;
    // rs1 and rs2 are read registers 1 and 2; rd is write register
    reg [4:0] rs1, rs2, rd; // rs1 [19:15], rs2 [24:20], rd [11:7] 
    reg [63:0] write_data; // output from mux
    reg reg_write;
    
    // output
    wire [63:0] read_data1, read_data2;   // sends data to ALU input
    
    // instantiate control
    register_file R (.clk(clk), .rs1(rs1), .rs2(rs2), .rd(rd), .write_data(write_data), .reg_write(reg_write), .read_data1(read_data1), .read_data2(read_data2));
    
    initial
        begin
        
            #10 clk = 0; rs1 = 4'b0001; rs2 = 4'b0010; rd = 4'b0001;   
            write_data = 64'd100; reg_write = 1;
            #10 clk = 1;
            
            // did not change so doesn't write
            #10 clk = 0; rs1 = 4'b0001; rs2 = 4'b0010; rd = 4'b0001;
            write_data = 64'd200; reg_write = 1;
            #10 clk = 1;
            
            #10 clk = 0; rs1 = 4'b0001; rs2 = 4'b0011; rd = 4'b0001;
            write_data = 64'd300; reg_write = 1;
            #10 clk = 1;
            
            
            #10 clk = 0; rs1 = 4'b0001; rs2 = 4'b0100; rd = 4'b0010;
            write_data = 64'd400; reg_write = 1;
            #10 clk = 1;
            
            #10 clk = 0; rs1 = 4'b0001; rs2 = 4'b0010; rd = 4'b0001;
            write_data = 64'd500; reg_write = 1;
            #10 clk = 1;
            
            #10 $finish;
        
        end
endmodule
