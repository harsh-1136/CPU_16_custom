`timescale 1ns / 1ps

module arth_right(
    input [15:0] a,
    input [3:0] s,
    output [15:0] out
    );
    

      wire [30:0] a_ext;
    assign a_ext = {{15{a[15]}}, a};
genvar i;
generate
for(i=0;i<16;i=i+1)begin: r_shift
   
  mux_16 inst_1(a_ext[i+15:i], s, out[i]);
    
end
endgenerate

endmodule

// [ADDED] 16-to-1 multiplexer module used for barrel shifting and rotation
module mux_16(
    input [15:0] in,
    input [3:0]  sel,
    output       out
);
    assign out = in[sel];
endmodule
