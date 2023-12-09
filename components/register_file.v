`timescale 1ns / 1ps

module register_file (clk, rs1, rs2, rd, reg_write, write_data, read_data1, read_data2);
    
    input clk;

    // rs1 and rs2 are read registers 1 and 2; rd is write register
    input [4:0] rs1, rs2, rd; // rs1 [19:15], rs2 [24:20], rd [11:7] 
    input [63:0] write_data; // output from mux
    input reg_write;

    output reg [63:0] read_data1, read_data2;   // sends data to ALU input

    // opcodes
    reg [6:0] R_TYPE, LOAD, STORE, BRANCH, opcode;

    // declare thirty-two 32-bit registers
    reg [31:0] registers [31:0];

    // counter
    integer i;

    // zero all of the registers
    initial begin
        for (i=0; i<32 ; i=i+1) begin
            registers[i] = 32'h00000000;
        end
    end

    // run only when rs1 or rs2 is updated
    // note: if always @*, then it runs when ANY input is updated
    always @(rs1, rs2) begin
        // assign read_data1 and read_data2 simultaneously
        read_data1 <- $signed(registers[rs1]);
        read_data2 <- $signed(registers[rs2]);
    end

    // on the positive edge of the clock, write data to write register
    always @(posedge clk) begin
        if (reg_write == 1) begin
            register[rd] = write_data;
        end
    end

endmodule
