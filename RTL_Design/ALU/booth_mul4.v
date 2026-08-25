`timescale 1ns / 1ps
module booth_mul_16(
    input signed [15:0] a,
    input signed [15:0] b,
    output  [31:0] out
    );
   reg[15:0] acc,mult,multid,multidm;
   reg qm;
   integer i;
  
   always@(*)begin
      acc=15'b0;
   mult=a;
   multid=b;
   qm=0;
   multidm= (~b) +1;
   for(i=0;i<16;i=i+1)begin
   if(mult[0]& ~qm){acc,mult}={acc+ multid,mult}>>>1;
   else if(~mult[0] & qm){acc,mult}={acc+ multidm,mult}>>>1;
   else {acc,mult}={acc,mult}>>>1;
   end
   end
   assign out={acc,mult};
endmodule