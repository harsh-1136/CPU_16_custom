`timescale 1ns / 1ps


module ALU(
    input [15:0] a,
    input [15:0] b,
    input [3:0] opcode, 
    output [31:0] out,
    output carry,
    output zero,
    output overflow,
    output sign
    );
    add_16 ins1(a,b,out,0,carry);
    sub_16 ins2(a,b,out,carry);
    booth_mul_16 ins3(a,b,out);
    
endmodule
