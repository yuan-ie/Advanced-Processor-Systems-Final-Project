`timescale 1ns / 1ps

module ALU_top(ALU_ctrl, input1, input2, zero, result, overflow, r);
    input [3:0] ALU_ctrl;
    input [63:0] input1, input2;

    output zero;
    output [63:0] result;
    output overflow;
    output [63:0] r;

    // result of each instruction module
    wire [63:0] add_result, sub_result, mul_result, div_result, and_result, or_result;

    // instantiate each instruction module
    adder_16bit add (.a(input1), .b(input2), .sum(add_result), .overflow(overflow), .c_in(1'b0));
    subtract sub (.a(input1), .b(input2), .difference(sum_result), .overflow(overflow), .c_in(1'b0));
    multiply mul (.a(input1), .b(input2), .product(mul_result), .overflow(overflow));
    divider div (.a(input1), .b(input2), .quotient(div_result), .overflow(overflow), .r(r));
    AND logic1 (.a(input1), .b(input2), .out(and_result));
    OR logic2 (.a(input1), .b(input2), .out(or_result));

    always @* begin

        // use ADDITION result
        if ALU_ctrl == 4'b0010 begin
            result = add_result;
        end
        // use SUBTRACTION result
        if ALU_ctrl == 4'b0110 begin
            result = sub_result;
        end
        // use MULTIPLICATION result
        if ALU_ctrl == 4'b0111 begin
            result = mul_result;
        end
        // use DIVISION result
        if ALU_ctrl == 4'b0100 begin
            result = div_result;
        end
        // use AND result
        if ALU_ctrl == 4'b0000 begin
            result = and_result;
        end
        // use OR result
        if ALU_ctrl == 4'b0001 begin
            result = or_result;
        end

        if result == 64'd0 begin
            zero = 1'b1;
        end

    end

endmodule