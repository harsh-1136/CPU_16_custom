`timescale 1ns / 1ps
module left_shift_16(
    input  [15:0] a,
    input  [3:0]  s,
    output [15:0] out
    );
    wire [30:0] a_ext;
    assign a_ext = {a, 15'b0};

    genvar i, k;
    generate
        for (i = 0; i < 16; i = i + 1) begin : r_shift
            wire [15:0] window;
            for (k = 0; k < 16; k = k + 1) begin : rev
                assign window[k] = a_ext[i + 15 - k];
            end
            mux_16 inst_1(window, s, out[i]);
        end
    endgenerate
endmodule