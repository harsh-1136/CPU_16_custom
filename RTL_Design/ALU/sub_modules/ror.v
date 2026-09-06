`timescale 1ns / 1ps


module ror(
    input [15:0] a,
    input [3:0] s,
    output [15:0] out
    );

      wire [30:0] a_ext;
    assign a_ext = {a[14:0], a};
genvar i;
generate
for(i=0;i<16;i=i+1)begin: r_shift
   
  mux_16 inst_1(a_ext[i+15:i], s, out[i]);
    
end
endgenerate
endmodule
