`timescale 1ns / 1ps
module booth_mul4(
    input [3:0] a,
    input [3:0] b,
    input clk,
    output reg [7:0] out
    );
   parameter load=0, init=1, sub=2, add=3, same=4, a_right=5, asn=6, done=7;
   reg [3:0] state, next_state;
   reg qm;
   reg [3:0] acc, multiplier, mp, mm;
   reg [7:0] result;
   reg [2:0] count;

   // Only reset state/count at time 0 -- a/b are captured later,
   // in the clocked "load" state, AFTER forces/testbench drive them.
   initial begin
       state = load;
       count = 0;
       qm    = 0;
       acc   = 4'b0;
   end

   // combinational
   always@(*) begin
       case(state)
           load: next_state = init;
           init: begin
               if (multiplier[0] & ~qm) next_state = sub;
               else if (~multiplier[0] & qm) next_state = add;
               else next_state = same;
           end
           sub:     next_state = a_right;
           add:     next_state = a_right;
           same:    next_state = a_right;
           a_right: next_state = asn;
           asn:     next_state = (count == 3) ? done : init;
           done:    next_state = done;
           default: next_state = load;
       endcase
   end

   // sequential
   always@(posedge clk) begin
       state <= next_state;
       case(state)
           load: begin
               // captured here, on a clock edge, AFTER a/b are actually driven
               multiplier <= a;
               mp         <= b;
               mm         <= -b;   // 2's complement of multiplicand
               acc        <= 4'b0;
               qm         <= 1'b0;
               count      <= 3'b0;
           end
           sub:  acc <= acc + mm;
           add:  acc <= acc + mp;
           a_right: begin
               qm     <= multiplier[0];
               result <= $signed({acc, multiplier}) >>> 1;
           end
           asn: begin
               acc        <= result[7:4];
               multiplier <= result[3:0];
               count      <= count + 1;
           end
       endcase
   end

   always@(*) begin
       out = {acc, multiplier};
   end

endmodule