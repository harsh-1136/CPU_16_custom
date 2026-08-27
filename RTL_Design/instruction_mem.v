`timescale 1ns / 1ps


module instruction_mem(
    input [15:0] address,
    output [15:0] out
    );
    reg [15:0] instruct_mem [255:0];
     assign out = instruct_mem[address[7:0]];
endmodule
