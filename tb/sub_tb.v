`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.08.2026 16:08:29
// Design Name: 
// Module Name: sub_tb
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


module sub_tb(

    );
       reg  [15:0] a, b;
    wire [15:0] result;
    wire        borrow;

    // Instantiate the DUT (Device Under Test)
    sub_16 uut (
        .a(a),
        .b(b),
        .result(result),
        .borrow(borrow)
    );

    // Task to apply a test case and check against expected values
    task run_test(input [15:0] test_a, input [15:0] test_b);
        reg [16:0] expected_full; // 17 bits to catch borrow
        reg [15:0] expected_result;
        reg        expected_borrow;
        begin
            a = test_a;
            b = test_b;
            #10; // wait for combinational logic to settle

            expected_full   = {1'b0, test_a} - {1'b0, test_b};
            expected_result = expected_full[15:0];
            expected_borrow = expected_full[16]; // 1 if a < b (unsigned)

            if (result === expected_result && borrow === expected_borrow)
                $display("PASS: a=%0d b=%0d -> result=%0d borrow=%b", a, b, result, borrow);
            else
                $display("FAIL: a=%0d b=%0d -> result=%0d borrow=%b (expected result=%0d borrow=%b)",
                          a, b, result, borrow, expected_result, expected_borrow);
        end
    endtask

    initial begin
        $display("Starting sub_16 tests...");

        run_test(16'd10, 16'd3);        // normal, no borrow
        run_test(16'd3,  16'd10);       // a < b, borrow expected
        run_test(16'd0,  16'd0);        // zero case
        run_test(16'hFFFF, 16'hFFFF);   // max - max
        run_test(16'hFFFF, 16'h0000);   // max - 0
        run_test(16'h0000, 16'hFFFF);   // 0 - max, borrow expected
        run_test(16'd100, 16'd100);     // equal values, no borrow
        run_test(16'h8000, 16'h0001);   // MSB edge case

        // A few random cases
        run_test(16'd12345, 16'd6789);
        run_test(16'd500, 16'd9999);

        $display("Testing complete.");
        $finish;
    end
endmodule
