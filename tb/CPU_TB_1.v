`timescale 1ns / 1ps
module CPU_TB();

    reg clk;
    reg reset;

    final_CPU dut(clk, reset);

    always #5 clk = ~clk;

    initial begin
        $dumpfile("cpu_sim.vcd");
        $dumpvars(0, CPU_TB);

        clk   = 0;
        reset = 1;
        #10;
        reset = 0;      // release reset, CPU starts fetching from PC=0

        #180;           // enough cycles for all 16 instructions + branch skip

        $display("--------------------------------------------------------");
        $display("Simulation finished. Expected final register values:");
        $display("R1=5  R2=3  R3=8  R4=65534(-2)  R5=1  R6=7  R7=6");
        $display("R8=8191(0x1FFF)  R9=3  R10=0 (untouched, branch skipped it)");
        $display("HLT should be 1, PC should have stopped advancing at 15");
        $display("--------------------------------------------------------");
        $finish;
    end

    // one line per clock cycle -- read top to bottom against the expected
    // program trace in instruction_mem.v to spot exactly where it diverges
    always @(posedge clk) begin
        if (!reset) begin
            $display("t=%0t | PC=%0d | Ins=%h | ALU=%0d | R1=%0d R2=%0d R3=%0d R4=%0d R5=%0d R6=%0d R7=%0d R8=%0d R9=%0d R10=%0d | memW=%b memR=%b | branch=%b HLT=%b",
                     $time, dut.pc_out, dut.ins_out, dut.alu_out[15:0],
                     dut.inst3.data_out_s[1], dut.inst3.data_out_s[2], dut.inst3.data_out_s[3],
                     dut.inst3.data_out_s[4], dut.inst3.data_out_s[5], dut.inst3.data_out_s[6],
                     dut.inst3.data_out_s[7], dut.inst3.data_out_s[8], dut.inst3.data_out_s[9],
                     dut.inst3.data_out_s[10],
                     dut.mem_write, dut.mem_read, dut.b, dut.hlt);
        end
    end

endmodule