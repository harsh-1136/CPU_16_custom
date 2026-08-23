`timescale 1ns / 1ps


module cmps(
    input [15:0] a,
    input [15:0] b,
    output z,
    output  gr,
    output ls
    );
    
    wire grs ,lss;
    cmp0 ins1(a,b,z,grs,lss);
    //always@(*)begin
    //if(a[15] ^ b[15])begin
     //   if(a&~b) gr=1;
      //  else ls=1;
   //end
    //else begin 
    //end
   //end
   assign gr=(a[15]^b[15])?((~a[15]&b[15])?1:0):grs;
   assign ls=(a[15]^b[15])?((a[15]&~b[15])?1:0):lss;
  
endmodule
