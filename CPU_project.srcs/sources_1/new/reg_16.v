`timescale 1ns / 1ps


module reg_16(
    input [15:0] a,
    output [15:0] b,
    input wr,
    input clk
    );
    wire [15:0] b_s;
    genvar i;
    generate
        for(i=0;i<16;i=i+1)begin
            D_ff ins(a[i],wr,clk,b_s[i]);        
        end
    endgenerate
    assign b=b_s;
endmodule
