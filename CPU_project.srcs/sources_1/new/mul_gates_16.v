`timescale 1ns / 1ps


module mul_gates_16 (
    input  [3:0] y,
    input  [3:0] x,
    output [7:0] z
);
    //making 4 bit multiplier first
    wire [3:0] c1, c2, c3, sum_1, sum_2, sum_3;
    genvar i, j;
    generate

        for (i = 0; i < 4; i = i + 1) begin : full_1
            FA inst1 (
                y[0] & ((i == 3) ? 0 : x[i+1]),
                y[1] & x[i],
                (i == 0) ? 0 : c1[i-1],
                sum_1[i],
                c1[i]
            );
        end

        for (i = 0; i < 4; i = i + 1) begin : full_2
            FA inst1 (
                (i == 3) ? c1[i] : sum_1[i+1],
                y[2] & x[i],
                (i == 0) ? 0 : c2[i-1],
                sum_2[i],
                c2[i]
            );
        end

        for (i = 0; i < 4; i = i + 1) begin : full_3
            FA inst1 (
                (i == 3) ? c2[i] : sum_2[i+1],
                y[3] & x[i],
                (i == 0) ? 0 : c3[i-1],
                sum_3[i],
                c3[i]
            );
        end
    endgenerate
    assign z[0] = y[0] & x[0];
    assign z[1] = sum_1[0];
    assign z[2] = sum_2[0];
    assign z[3] = sum_3[0];
    assign z[4] = sum_3[1];
    assign z[5] = sum_3[2];
    assign z[6] = sum_3[3];
    assign z[7] = c3[3];

endmodule
