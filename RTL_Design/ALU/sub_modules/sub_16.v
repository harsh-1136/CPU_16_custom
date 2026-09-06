`timescale 1ns / 1ps


module sub_16(
    input [15:0] a,
    input [15:0] b,
    output [15:0] result,
    output borrow
    );
    wire [15:0] mb;
    wire cout;
    assign mb=~b;
    add_16 ins1 (a,mb,result,cout,1'b1);
    assign borrow=~cout;
endmodule
