`timescale 1ns / 1ps
module instruction_mem(
    input  [15:0] pc_out,
    output [15:0] ins_out
    );
    reg [15:0] instruct_mem [255:0];

    // ---------------------------------------------------------------
    // Test program -- exercises every instruction group at least once.
    // Field layout: [15:12]=opcode [11:8]=mode_bits/Rd [7:4]=Ra [3:0]=Rb/imm
    // R1=5, R2=3 are set up first and used as operands throughout.
    // ---------------------------------------------------------------
    initial begin
        instruct_mem[0]  = 16'h1315; // MOV R1,#5        -> R1=5
        instruct_mem[1]  = 16'h1323; // MOV R2,#3        -> R2=3
        instruct_mem[2]  = 16'h4312; // ADD R3,R1,R2     -> R3=8
        instruct_mem[3]  = 16'h6421; // SUB R4,R2,R1     -> R4=-2 (0xFFFE)
        instruct_mem[4]  = 16'h8512; // AND R5,R1,R2     -> R5=1
        instruct_mem[5]  = 16'h9612; // OR  R6,R1,R2     -> R6=7
        instruct_mem[6]  = 16'hB712; // XOR R7,R1,R2     -> R7=6
        instruct_mem[7]  = 16'hA810; // NOT R8,R1        -> R8=0xFFFA
        instruct_mem[8]  = 16'hC912; // MUL R9,R1,R2     -> R9=15
        instruct_mem[9]  = 16'h3082; // SHR R8,R2 (amt)  -> R8=0xFFFA>>3=0x1FFF
        instruct_mem[10] = 16'h1412; // MOV [R1],R2      -> mem[5]=3
        instruct_mem[11] = 16'h1891; // MOV R9,[R1]      -> R9=mem[5]=3
        instruct_mem[12] = 16'h2F12; // CMP R1,R2        -> R1(5) > R2(3): gt=1
        instruct_mem[13] = 16'h2A0F; // BGT 15           -> condition true, jump to 15
        instruct_mem[14] = 16'h1CA9; // MOV R10,#9       -> SHOULD BE SKIPPED
        instruct_mem[15] = 16'hF000; // HLT
    end

    assign ins_out = instruct_mem[pc_out[7:0]];

endmodule