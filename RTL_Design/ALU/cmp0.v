`timescale 1ns / 1ps



module cmp0(
    input [15:0] a,
    input [15:0] b,
    output z,
    output gr,
    output ls
    
    );
    
    wire borrow;wire[15:0] sum;
    sub_16 ins1(a,b,sum,borrow);
    assign z= (sum ==16'b0);
    assign gr=(borrow==0 & ~(sum==16'b0));
    assign ls=(borrow==1 & ~(sum==16'b0));
    
endmodule
