`timescale 1ns / 1ps


module muls_16(
    input [15:0] x,
    input [15:0] y,
    input [31:0] z
    );
    
     wire [14:0] c[1:14],sum[1:14];
 genvar i,j;
 generate
 
 for(i=0;i<15;i=i+1) begin : full_1
 FA inst1(y[0]&((i==15)?0:x[i+1]),y[1]&x[i],(i==0)?0:c[1][i-1],sum[1][i],c[1][i]);
 end
for(j=2;j<15;j=j+1)begin : full
 for(i=0;i<15;i=i+1) begin : full_2
 FA inst1((i==14)?c[j-1][i]:sum[j-1][i+1],y[j]&x[i],(i==0)?0:c[j][i-1],sum[j][i],c[j][i]);
 end
end
 for(i=1;i<15;i=i+1) begin
    assign z[i]=sum[i][0];
 end
 for(i=1;i<15;i=i+1)begin
  assign z[i+14]=sum[14][i];
 end
 endgenerate
 assign z[0]=y[0]&x[0];
 assign z[30]=c[14][14];
 assign z[31]= x[15] ^ y[15];
 
endmodule
