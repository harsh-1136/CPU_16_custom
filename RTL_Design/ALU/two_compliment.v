`timescale 1ns / 1ps


module two_compliment(
    input [15:0] in,
    output reg[15:0] out
    );
    reg[4:0] i;
    always@(*)begin
    i=0;
    while(in[i]!=1 & i<16) begin
    out[i]=in[i];
    i=i+1;
    end
    out[i]=in[i];
    i=i+1;
    while(i<16)begin
     out[i]=~in[i];
     i=i+1;
     end
    end
    
    
    
    
endmodule
