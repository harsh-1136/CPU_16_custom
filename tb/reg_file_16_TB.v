`timescale 1ns / 1ps
module reg_file_16_TB(
    );
    reg clk;
    initial clk = 0;
    always #5 clk = ~clk;

    reg [15:0] datain_s;
    wire [15:0] dataout_s;
    reg wr_s;
    reg [3:0] address_s;

    reg_file_16 ins1(datain_s, address_s, wr_s, clk, dataout_s);

    initial begin
        // ---- Test 1: write reg0, read back ----
        address_s = 4'd0; datain_s = 16'h1234; wr_s = 1'b1;
        @(posedge clk); @(posedge clk);
        wr_s = 1'b0; address_s = 4'd0;
        @(posedge clk); #1;
        $display("T1: addr=0 dataout=%h (expect 1234)", dataout_s);

        // ---- Test 2: write reg5, read back ----
        address_s = 4'd5; datain_s = 16'hABCD; wr_s = 1'b1;
        @(posedge clk); @(posedge clk);
        wr_s = 1'b0; address_s = 4'd5;
        @(posedge clk); #1;
        $display("T2: addr=5 dataout=%h (expect abcd)", dataout_s);

        // ---- Test 3: CRITICAL - reg0 must still hold old value after reg5 write ----
        address_s = 4'd0; wr_s = 1'b0;
        @(posedge clk); #1;
        $display("T3: addr=0 dataout=%h (expect 1234, checks no cross-write corruption)", dataout_s);

        // ---- Test 4: overwrite reg0 ----
        address_s = 4'd0; datain_s = 16'h9999; wr_s = 1'b1;
        @(posedge clk); @(posedge clk);
        wr_s = 1'b0; address_s = 4'd0;
        @(posedge clk); #1;
        $display("T4: addr=0 dataout=%h (expect 9999, overwrite check)", dataout_s);

        // ---- Test 5: CRITICAL - reg5 must be unaffected by reg0 overwrite ----
        address_s = 4'd5; wr_s = 1'b0;
        @(posedge clk); #1;
        $display("T5: addr=5 dataout=%h (expect abcd, checks no cross-write corruption)", dataout_s);

        // ---- Test 6: boundary - highest address (15) ----
        address_s = 4'd15; datain_s = 16'hFFFF; wr_s = 1'b1;
        @(posedge clk); @(posedge clk);
        wr_s = 1'b0; address_s = 4'd15;
        @(posedge clk); #1;
        $display("T6: addr=15 dataout=%h (expect ffff, boundary check)", dataout_s);

        // ---- Test 7: wr=0 must block writing ----
        address_s = 4'd3; datain_s = 16'h5555; wr_s = 1'b0;  // wr LOW, attempt "write"
        @(posedge clk); @(posedge clk);
        address_s = 4'd3;
        @(posedge clk); #1;
        $display("T7: addr=3 dataout=%h (expect NOT 5555, since wr was 0)", dataout_s);

        // ---- Test 8: boundary - address 0 vs address 15 no interference ----
        address_s = 4'd0; wr_s = 1'b0;
        @(posedge clk); #1;
        $display("T8: addr=0 dataout=%h (expect 9999, checks reg15 write didn't corrupt reg0)", dataout_s);

        $finish;
    end
endmodule