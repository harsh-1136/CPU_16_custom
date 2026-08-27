`timescale 1ns / 1ps


module sign_extend(
    input [3:0] imm_in,
    output [15:0] imm_out
    );
    assign imm_out={{12{imm_in[3]}},imm_in};
endmodule
