`timescale 1ns / 1ps


module add_16(
    input [15:0] a,
    input [15:0] b,
    output [15:0] sum,
    output cout,
    input cin
    );
     wire [16:0] carry;
    assign carry[0] = cin;
    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin : FA_chain
            FA fa_inst (
                .a(a[i]),
                .b(b[i]),
                .cin(carry[i]),
                .sum(sum[i]),
                .cout(carry[i+1])
            );
        end
    endgenerate
     assign cout = carry[16];
endmodule

// [ADDED] 1-bit Full Adder module used by add_16 and other arithmetic units
module FA(
    input a,
    input b,
    input cin,
    output sum,
    output cout
);
    assign sum  = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);
endmodule
