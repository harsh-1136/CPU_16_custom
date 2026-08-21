`timescale 1ns / 1ps


module mul_16_tb(

    );
    
     reg  [3:0] x, y;
    wire [7:0] z;

    mul_gates_16 uut (
        .y(y),
        .x(x),
        .z(z)
    );

    integer i, j;
    reg [7:0] expected;
    integer pass_count, fail_count;

    initial begin
        pass_count = 0;
        fail_count = 0;
        for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                x = i;
                y = j;
                #10; // wait for combinational logic to settle

                expected = i * j; // unsigned multiplication

                if (z === expected) begin
                    pass_count = pass_count + 1;
                end else begin
                    fail_count = fail_count + 1;
                    $display("FAIL: x=%0d y=%0d -> z=%0d (expected %0d)", x, y, z, expected);
                end
            end
        end

        $display("Testing complete. PASS=%0d FAIL=%0d out of %0d total", pass_count, fail_count, 256);
        $finish;
    end
endmodule
