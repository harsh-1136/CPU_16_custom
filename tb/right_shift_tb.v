`timescale 1ns / 1ps

module right_shift_16_tb;

    reg  [15:0] a;
    reg  [3:0]  s;
    wire [15:0] out;

    right_shift_16 uut (.a(a), .s(s), .out(out));

    initial begin
        a = 16'hFFFF; s = 4'd0; #10;
        
        a = 16'hFFFF; s = 4'd4; #10;
    
        a = 16'h8000; s = 4'd15; #10;
       
        a = 16'hA5A5; s = 4'd8; #10;
       
    end

endmodule