`timescale 1ns / 1ps

module program_counter(
    input clk,
    input reset,
    input en,
    input load,
    input [15:0] address,
    output [15:0] out
    );
    
    reg [15:0] counter;
    always@(posedge clk or posedge reset) begin
    if(reset) counter <= 16'd0;
    else if(load) counter <= address;
    else if(en) counter <= counter + 16'd1;
    else counter <= counter;
end
    assign out=counter;
endmodule
