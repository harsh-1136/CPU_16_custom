`timescale 1ns / 1ps
module main_memory(
    input  [15:0] address,
    input  [15:0] data_in,     
    output [15:0] data_out,    
    input  mem_read,           
    input  mem_write,          
    input  clk
    );

    reg [15:0] mem [255:0];    //  512 bytes
    assign data_out = mem_read ? mem[address] : 16'b0;
    always@(posedge clk) begin
        if (mem_write) mem[address] <= data_in;
    end

endmodule