`timescale 1ns / 1ps
module CPU_TB();
    reg clk;
    reg reset;

    final_CPU dut(clk, reset);

    // Generate Clock
    always #5 clk = ~clk;

    initial begin
        $dumpfile("cpu_sim.vcd");
        $dumpvars(0, CPU_TB);
        clk = 0;
        reset = 1;
        #10;
        reset = 0; // Release reset, CPU starts fetching PC = 0
        
        #100; // Let it run for 10 clock cycles
        $display("Simulation finished.");
        $finish;
    end

    // [MODIFIED] Monitor execution details on every clock edge
    always @(posedge clk) begin
        if (!reset) begin
            $display("Time=%0t | PC=%0d | Ins=%h | alu_out=%d | R1=%d | R2=%d | R3=%d | MemWrite=%b | HLT=%b",
                     $time, dut.pc_out, dut.ins_out, dut.alu_out[15:0], 
                     dut.inst3.data_out_s[1], dut.inst3.data_out_s[2], dut.inst3.data_out_s[3],
                     dut.mem_write, dut.hlt);
        end
    end
endmodule