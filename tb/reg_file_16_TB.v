`timescale 1ns / 1ps
module reg_file_16_tb;

    reg clk;
    initial clk = 0;
    always #5 clk = ~clk;

    reg  [15:0] datain;
    reg  [3:0]  address, addr_ra, addr_rb;
    reg  wr;
    wire [15:0] dataout_ra, dataout_rb;

    reg_file_16 uut (
        .datain(datain),
        .address(address),
        .addr_ra(addr_ra),
        .addr_rb(addr_rb),
        .wr(wr),
        .clk(clk),
        .dataout_ra(dataout_ra),
        .dataout_rb(dataout_rb)
    );

    initial begin
        // ---- Test 1: write reg0, read back on port A ----
        address = 4'd0; datain = 16'h1111; wr = 1'b1;
        @(posedge clk); @(posedge clk);
        wr = 1'b0;
        addr_ra = 4'd0;
        @(posedge clk); #1;
        $display("T1: ra(0)=%h (expect 1111)", dataout_ra);

        // ---- Test 2: write reg5, read on port B ----
        address = 4'd5; datain = 16'h2222; wr = 1'b1;
        @(posedge clk); @(posedge clk);
        wr = 1'b0;
        addr_rb = 4'd5;
        @(posedge clk); #1;
        $display("T2: rb(5)=%h (expect 2222)", dataout_rb);

        // ---- Test 3: CRITICAL - read both ports simultaneously, different regs ----
        addr_ra = 4'd0; addr_rb = 4'd5;
        @(posedge clk); #1;
        $display("T3: ra(0)=%h rb(5)=%h (expect 1111 / 2222, dual-port read)", dataout_ra, dataout_rb);

        // ---- Test 4: EDGE CASE - both read ports point to the SAME register ----
        addr_ra = 4'd5; addr_rb = 4'd5;
        @(posedge clk); #1;
        $display("T4: ra(5)=%h rb(5)=%h (expect both 2222, same-address dual read)", dataout_ra, dataout_rb);

        // ---- Test 5: CRITICAL - reg0 unaffected by reg5 write (no cross-write corruption) ----
        addr_ra = 4'd0;
        @(posedge clk); #1;
        $display("T5: ra(0)=%h (expect 1111, still unaffected)", dataout_ra);

        // ---- Test 6: overwrite reg0, confirm new value on both ports ----
        address = 4'd0; datain = 16'h9999; wr = 1'b1;
        @(posedge clk); @(posedge clk);
        wr = 1'b0;
        addr_ra = 4'd0; addr_rb = 4'd0;
        @(posedge clk); #1;
        $display("T6: ra(0)=%h rb(0)=%h (expect both 9999, overwrite check)", dataout_ra, dataout_rb);

        // ---- Test 7: EDGE CASE - write and read the same reg on port A in the same cycle ----
        // (reading old value while a write to the same address is in flight)
        address = 4'd7; datain = 16'hAAAA; wr = 1'b1;
        addr_ra = 4'd7;
        @(posedge clk); #1;
        $display("T7: ra(7) immediately after write pulse=%h (check timing - old val or new?)", dataout_ra);
        @(posedge clk); #1;
        $display("T7b: ra(7) one cycle later=%h (expect aaaa, settled)", dataout_ra);
        wr = 1'b0;

        // ---- Test 8: boundary - highest address (15) ----
        address = 4'd15; datain = 16'hFFFF; wr = 1'b1;
        @(posedge clk); @(posedge clk);
        wr = 1'b0;
        addr_ra = 4'd15;
        @(posedge clk); #1;
        $display("T8: ra(15)=%h (expect ffff, boundary check)", dataout_ra);

        // ---- Test 9: wr=0 must block writing ----
        address = 4'd3; datain = 16'h5555; wr = 1'b0;   // attempt write with wr LOW
        @(posedge clk); @(posedge clk);
        addr_ra = 4'd3;
        @(posedge clk); #1;
        $display("T9: ra(3)=%h (expect NOT 5555, since wr was 0)", dataout_ra);

        // ---- Test 10: reg15 write must not corrupt reg0 (opposite-direction cross-write check) ----
        addr_ra = 4'd0;
        @(posedge clk); #1;
        $display("T10: ra(0)=%h (expect 9999, unaffected by reg15 write)", dataout_ra);

        $finish;
    end

endmodule