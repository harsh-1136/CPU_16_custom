`timescale 1ns / 1ps


module mul_16(
    input [15:0] y,
    input [15:0] x,
    output [31:0] z
    );
    
    wire [15:0] c[1:15],sum[1:15];
 genvar i,j;
 generate
 
 for(i=0;i<16;i=i+1) begin : full_1
 FA inst1(y[0]&((i==15)?0:x[i+1]),y[1]&x[i],(i==0)?0:c[1][i-1],sum[1][i],c[1][i]);
 end
for(j=2;j<16;j=j+1)begin : full
 for(i=0;i<16;i=i+1) begin : full_2
 FA inst1((i==15)?c[j-1][i]:sum[j-1][i+1],y[j]&x[i],(i==0)?0:c[j][i-1],sum[j][i],c[j][i]);
 end
end
 for(i=1;i<16;i=i+1) begin
    assign z[i]=sum[i][0];
 end
 for(i=1;i<16;i=i+1)begin
  assign z[i+15]=sum[15][i];
 end
 endgenerate
 assign z[0]=y[0]&x[0];
 assign z[31]=c[15][15];
 
endmodule
