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
   /* initial begin
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
    end*/

    // =================================================================
    // SIGNED-NUMBER TEST PROGRAM
  
    // =================================================================
 /*
    initial begin
        // --- Part 1: doubling chain -- drives R1 into signed overflow ---
        // Each step just doubles R1. Overflow triggers exactly when the
        // result crosses 32767 (0x7FFF), the 16-bit signed boundary.
        instruct_mem[0]  = 16'h1317; // MOV R1,#7        R1=7
        instruct_mem[1]  = 16'h4111; // ADD R1,R1,R1     R1=14
        instruct_mem[2]  = 16'h4111; // ADD R1,R1,R1     R1=28
        instruct_mem[3]  = 16'h4111; // ADD R1,R1,R1     R1=56
        instruct_mem[4]  = 16'h4111; // ADD R1,R1,R1     R1=112
        instruct_mem[5]  = 16'h4111; // ADD R1,R1,R1     R1=224
        instruct_mem[6]  = 16'h4111; // ADD R1,R1,R1     R1=448
        instruct_mem[7]  = 16'h4111; // ADD R1,R1,R1     R1=896
        instruct_mem[8]  = 16'h4111; // ADD R1,R1,R1     R1=1792
        instruct_mem[9]  = 16'h4111; // ADD R1,R1,R1     R1=3584
        instruct_mem[10] = 16'h4111; // ADD R1,R1,R1     R1=7168
        instruct_mem[11] = 16'h4111; // ADD R1,R1,R1     R1=14336
        instruct_mem[12] = 16'h4111; // ADD R1,R1,R1     R1=28672  (still positive, sign=0, overflow=0)
        instruct_mem[13] = 16'h4111; // ADD R1,R1,R1     R1=57344=0xE000=-8192 signed
                                      // ** KEY CHECK: overflow=1, sign=1, carry=0 (57344<65536, no unsigned carry) **
                                      // proves overflow and carry are genuinely different flags
 
        // --- Part 2: negative SUB, no overflow ---
        instruct_mem[14] = 16'h1323; // MOV R2,#3        R2=3
        instruct_mem[15] = 16'h1335; // MOV R3,#5        R3=5
        instruct_mem[16] = 16'h6423; // SUB R4,R2,R3     R4=3-5=-2=0xFFFE
                                      // sign=1, zero=0, overflow=0 (same-sign operands, no signed overflow)
                                      // ** check your sub_16 borrow/cout convention against this case **
 
        // --- Part 3: arithmetic right shift must preserve sign ---
        instruct_mem[17] = 16'h1351; // MOV R5,#1        R5=1 (shift amount, unambiguous small positive)
        instruct_mem[18] = 16'h3445; // Arith-right R4 by R5   R4 = ASHR(-2, 1) = -1 = 0xFFFF
                                      // ** KEY CHECK: sign bit stays 1 after the shift **
 
        // --- Part 4: signed compare + signed conditional branch ---
        instruct_mem[19] = 16'h2E42; // CMPS R4,R2       compares -1 (R4) vs 3 (R2) signed
                                      // expect: lt_s=1, gt_s=0, eq_s=0
        instruct_mem[20] = 16'h2B16; // BLT 22           condition true (R4 < R2 signed) -> should jump
        instruct_mem[21] = 16'h1369; // MOV R6,#9        SHOULD BE SKIPPED if BLT worked
        instruct_mem[22] = 16'hF000; // HLT
    end
    */
    
    
    // =================================================================
    // GENERAL-PURPOSE / EDGE-CASE TEST PROGRAM
   
    // =================================================================
 
    initial begin
        // --- R0 writability check ---
        // Nothing in your ISA said R0 is hardwired to zero -- confirm
        // it's a normal register, not a silent special case.
        instruct_mem[0]  = 16'h1305; // MOV R0,#5
        instruct_mem[1]  = 16'h1395; // MOV R9,#5        (reference value)
        instruct_mem[2]  = 16'h2F09; // CMP R0,R9
                                      // ** if R0 is writable and =5: eq=1. If hardwired 0: eq=0 **
 
        // --- all-ones pattern via NOT, and self-subtract zero flag ---
        instruct_mem[3]  = 16'h1310; // MOV R1,#0
        instruct_mem[4]  = 16'hA210; // NOT R2,R1        R2 = ~0 = 0xFFFF (all-ones edge case)
        instruct_mem[5]  = 16'h6322; // SUB R3,R2,R2     R3 = 0  -- zero flag=1 (self-subtract)
 
        // --- immediate sign-extension diagnostic ---
        // nibble 1000 = either +8 (zero-extended) or -8 (sign-extended).
        // Check R5's value in the waveform to find out which your
        // sign_extend module actually does -- do not assume.
        instruct_mem[6]  = 16'h1347; // MOV R4,#7
        instruct_mem[7]  = 16'h1358; // MOV R5,#8(nibble 1000) -- SIGN-EXTENSION DIAGNOSTIC
        instruct_mem[8]  = 16'h4645; // ADD R6,R4,R5     R6 = 7 + R5
                                      //  if R5 sign-extended to -8: R6 = -1 = 0xFFFF
                                      
 
        // --- multiply by zero ---
        instruct_mem[9]  = 16'hC714; // MUL R7,R1,R4     R7 = 0 * 7 = 0
 
        // --- clean bitwise pattern checks ---
        instruct_mem[10] = 16'h1387; // MOV R8,#7
        instruct_mem[11] = 16'h8948; // AND R9,R4,R8     R9 = 7 & 7 = 7
        instruct_mem[12] = 16'h9A21; // OR  R10,R2,R1    R10 = 0xFFFF | 0 = 0xFFFF (identity check)
        instruct_mem[13] = 16'hBB22; // XOR R11,R2,R2    R11 = 0xFFFF ^ 0xFFFF = 0 (self-XOR always zero)
 
        // --- store/load round trip through memory ---
        instruct_mem[14] = 16'h1448; // MOV [R4],R8      mem[R4=7] = R8(7)
        instruct_mem[15] = 16'h18C4; // MOV R12,[R4]     R12 = mem[7] = 7
 
        // --- CMP equal case, branch NOT taken (must fall through, not jump) ---
        instruct_mem[16] = 16'h2F48; // CMP R4,R8        R4=7, R8=7 -> eq=1, gt=0, lt=0
        instruct_mem[17] = 16'h2A13; // BGT 19           condition FALSE (not gt) -> must NOT jump
        instruct_mem[18] = 16'h13D1; // MOV R13,#1       MUST execute (branch not taken -> falls through here)
 
        // --- unconditional branch ---
        instruct_mem[19] = 16'h2015; // B 21             always taken -> jump to 21
        instruct_mem[20] = 16'h13F1; // MOV R15,#1       SHOULD BE SKIPPED
 
        instruct_mem[21] = 16'hF000; // HLT
    end
    assign ins_out = instruct_mem[pc_out[7:0]];

endmodule