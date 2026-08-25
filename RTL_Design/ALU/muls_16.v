`timescale 1ns / 1ps


module mul_gates_16(
    input [3:0] y,
    input [3:0] x,
    output [7:0] z
    );
    //making 4 bit multiplier first
    wire [3:0] c[1:3],sum[1:3];
 genvar i,j;
 generate
 
 for(i=0;i<4;i=i+1) begin : full_1
 FA inst1(y[0]&((i==3)?0:x[i+1]),y[1]&x[i],(i==0)?0:c[1][i-1],sum[1][i],c[1][i]);
 end

 for(i=0;i<4;i=i+1) begin : full_2
 FA inst1((i==3)?c[1][i]:sum[1][i+1],y[2]&x[i],(i==0)?0:c[2][i-1],sum[2][i],c[2][i]);
 end

 for(i=0;i<4;i=i+1) begin : full_3
 FA inst1((i==3)?c[2][i]:sum[2][i+1],y[3]&x[i],(i==0)?0:c[3][i-1],sum[3][i],c[3][i]);
 end
 endgenerate
 assign z[0]=y[0]&x[0];
 assign z[1]=sum[1][0];
 assign z[2]=sum[2][0];
 assign z[3]=sum[3][0];
 assign z[4]=sum[3][1];
  assign z[5]=sum[3][2];
   assign z[6]=sum[3][3];
    assign z[7]=c[3][3];
 
endmodule
