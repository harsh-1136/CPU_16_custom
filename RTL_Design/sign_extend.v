`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2026 21:52:42
// Design Name: 
// Module Name: sign+extend
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module sign_extend(
    input [3:0] imm_in,
    output [15:0] imm_out
    );
    // [MODIFIED] Sign extend 4-bit immediate to 16-bit
    assign imm_out = {{12{imm_in[3]}}, imm_in};
endmodule
