`timescale 1ns / 1ps



module mux_16(
    input [15:0] i,
    input [3:0] s,
    output mux_out
    );
     assign mux_out = i[s];
endmodule
