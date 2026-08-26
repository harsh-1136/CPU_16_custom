`timescale 1ns / 1ps


module D_ff(
    input d,
    input en,
    input clk,
    output reg q
    );
    always@(posedge clk) begin
    if(en) q<=d;
    else q<=q;
    end
endmodule
