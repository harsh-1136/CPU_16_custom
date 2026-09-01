`timescale 1ns / 1ps

module final_CPU(
    input clk,
    input reset
);

    // -------------------------------------------------------------------
    // Control & data wires
    // -------------------------------------------------------------------
    wire        hlt;
    wire        reg_write, alu_src, mem_read, mem_write, mem_to_reg, branch;

    wire [15:0] pc_address, ins_out, pc_out;
    wire [3:0]  alu_op;

    wire [15:0] mem_out;
    wire [15:0] dataout_ra, dataout_rb;
    wire [15:0] imm;

    wire        carry, zero, overflow, sign, eq, gt, lt;
    wire [31:0] alu_out;

    // -------------------------------------------------------------------
    // Program counter
    // -------------------------------------------------------------------
    assign pc_address = {8'b0, ins_out[7:0]};

    program_counter ins1(
        .clk(clk),
        .reset(reset),
        .en(hlt ? 1'b0 : 1'b1),
        .load(b ? 1'b1 : 1'b0),
        .address(pc_address),
        .out(pc_out)
    );

    // -------------------------------------------------------------------
    // Instruction memory
    // -------------------------------------------------------------------
    instruction_mem ins(
        .pc_out(pc_out),
        .ins_out(ins_out)
    );

    // -------------------------------------------------------------------
    // Main decoder
    // -------------------------------------------------------------------
    main_decoder ins2(
        .opcode(ins_out[15:12]),
        .mode_bits(ins_out[11:8]),
        .reg_write(reg_write),
        .alu_src(alu_src),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .mem_to_reg(mem_to_reg),
        .branch(branch),
        .alu_op(alu_op),
        .hlt(hlt)
    );

    // -------------------------------------------------------------------
    // Main memory
    // store address = Ra, load address = Rb, data written = Rb
    // -------------------------------------------------------------------
    main_memory inst(
        .address(mem_read ? dataout_rb : dataout_ra),
        .data_in(dataout_rb),
        .data_out(mem_out),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .clk(clk)
    );

    // -------------------------------------------------------------------
    // Register file
    // MOV / Shift groups use ins_out[7:4] as Rd; ALU-type groups use ins_out[11:8]
    // -------------------------------------------------------------------
    wire [3:0] write_reg_addr = (ins_out[15:12] == 4'b0001 || ins_out[15:12] == 4'b0011)
                                 ? ins_out[7:4] : ins_out[11:8];

    reg_file_16 inst3(
        .datain(mem_to_reg ? mem_out : alu_out[15:0]),
        .address(write_reg_addr),
        .addr_ra(ins_out[7:4]),
        .addr_rb(ins_out[3:0]),
        .wr(reg_write),
        .reset(reset),
        .clk(clk),
        .dataout_ra(dataout_ra),
        .dataout_rb(dataout_rb)
    );

    // -------------------------------------------------------------------
    // Sign extend
    // -------------------------------------------------------------------
    sign_extend inst6(
        .imm_in(ins_out[3:0]),
        .imm_out(imm)
    );

    // -------------------------------------------------------------------
    // ALU
    // -------------------------------------------------------------------
    ALU inst5(
        .as(dataout_ra),
        .bs(alu_src ? imm : dataout_rb),
        .opcode(alu_op),
        .outs(alu_out),
        .carry(carry),
        .zero(zero),
        .overflow(overflow),
        .sign(sign),
        .eq(eq),
        .gt(gt),
        .lt(lt)
    );

    // -------------------------------------------------------------------
    // Flag register
    // latches ALU flags on ADD, SUB, CMP, CMPS; holds otherwise
    // -------------------------------------------------------------------
    reg zero_r, carry_r, sign_r, overflow_r, eq_r, gt_r, lt_r;

    wire flag_write = (alu_op == 4'b0000) || (alu_op == 4'b0001) ||   // ADD, SUB
                       (alu_op == 4'b1101) || (alu_op == 4'b1110);    // CMP, CMPS

    always@(posedge clk or posedge reset) begin
        if (reset) begin
            zero_r     <= 1'b0;
            carry_r    <= 1'b0;
            sign_r     <= 1'b0;
            overflow_r <= 1'b0;
            eq_r       <= 1'b0;
            gt_r       <= 1'b0;
            lt_r       <= 1'b0;
        end
        else if (flag_write) begin
            zero_r     <= zero;
            carry_r    <= carry;
            sign_r     <= sign;
            overflow_r <= overflow;
            eq_r       <= eq;
            gt_r       <= gt;
            lt_r       <= lt;
        end
    end

    // -------------------------------------------------------------------
    // Branch condition
    // reads latched flags, not live ALU wires
    // -------------------------------------------------------------------
    reg b;

    always@(*) begin
        b = 1'b0;
        if (branch) begin
            case (ins_out[11:8])
                4'b0000: b = 1'b1;                       // B    (unconditional)
                4'b0001: b = (zero_r == 1'b1);            // BZ
                4'b0010: b = (zero_r == 1'b0);            // BNZ
                4'b0011: b = (carry_r == 1'b1);           // BC
                4'b0100: b = (carry_r == 1'b0);           // BNC
                4'b0101: b = (overflow_r == 1'b1);        // BV
                4'b0110: b = (overflow_r == 1'b0);        // BNV
                4'b1000: b = (eq_r == 1'b1);               // BEQ
                4'b1001: b = (eq_r != 1'b1);               // BNE
                4'b1010: b = (gt_r == 1'b1);               // BGT
                4'b1011: b = (lt_r == 1'b1);               // BLT
                4'b1100: b = (gt_r == 1'b1) | (eq_r == 1'b1); // BGE
                4'b1101: b = (lt_r == 1'b1) | (eq_r == 1'b1); // BLE
                default: b = 1'b0;                         // 0111, 1110, 1111 unused
            endcase
        end
    end

endmodule