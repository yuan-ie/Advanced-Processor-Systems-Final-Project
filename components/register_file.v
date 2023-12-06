module register_file (instruction, write_data, read_data1, read_data2);
    input [31:0] instruction; 
    input wire [4:0] rs1, rs2, rd; // rs1 [19:15], rs2 [24:20], rd [11:7] 
    input [63:0] write_data; // output from mux
    input wire reg_write;

    output reg [63:0] read_data1, read_data2;   // sends data to ALU input

    reg [6:0] R_TYPE, LOAD, STORE, BRANCH, opcode;

    always @* begin
        // determine instruction type from opcode
        opcode = instruction[6:0];

        // instruction type opcodes
        R_TYPE = 7'b0110011;
        LOAD = 7'b0000011;
        STORE = 7'b0100011;
        BRANCH = 7'b1100011;

        if (R_TYPE == opcode) begin
            rs1 = instruction[19:15];
            rs2 = instruction[24:20];
            rd = instruction[11:7];

            read_data2 = ;
        end
        
        else if (LOAD == opcode) begin
            rs1 = instruction[19:15];
            rd = instruction[11:7];

        end

        else if (STORE == opcode) begin

        end

        else if (BRANCH == opcode) begin

        end



endmodule
