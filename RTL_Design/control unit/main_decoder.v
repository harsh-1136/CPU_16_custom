`timescale 1ns / 1ps
module main_decoder(
    input  [3:0] opcode,
    input  [3:0] mode_bits,   // sub-mode field used by MOV / Branch-Compare / Shift groups
    output reg   reg_write,
    output reg   alu_src,     // 0 = second ALU operand from reg, 1 = from immediate
    output reg   mem_read,
    output reg   mem_write,
    output reg   mem_to_reg,
    output reg   branch,
    output reg [3:0] alu_op,
    output reg hlt
    );
  
    always@(*) begin
       
        reg_write  = 1'b0;
        alu_src    = 1'b0;
        mem_read   = 1'b0;
        mem_write  = 1'b0;
        mem_to_reg = 1'b0;
        branch     = 1'b0;
        alu_op     = 4'b0000;
      
        hlt=0;
        case(opcode)

            4'b0000: begin // RST
              
            end

            4'b0001: begin // [MODIFIED] MOV group with support for all modes from ISA
                reg_write = 1'b1;
                case(mode_bits)
                    4'b0000: begin // MOV Rd, Rs (Register-to-Register)
                        alu_src   = 1'b0;
                        alu_op    = 4'd15; // PASS B through ALU (outs = b = dataout_rb)
                        reg_write = 1'b1;
                    end
                    4'b0001, 4'b0100: begin // MOV [Ra], Rb (Store to memory: Mode 1 or Mode 4)
                        mem_write = 1'b1;
                        reg_write = 1'b0;
                    end
                    4'b0010, 4'b1000: begin // MOV Rd, [Rb] (Load from memory: Mode 2 or Mode 8)
                        mem_read   = 1'b1;
                        mem_to_reg = 1'b1;
                        reg_write  = 1'b1;
                    end
                    4'b0011: begin // MOV Rd, #imm (Immediate-to-Register: Mode 3)
                        alu_src   = 1'b1;  // Select immediate
                        alu_op    = 4'd15; // PASS B through ALU (outs = b = imm)
                        reg_write = 1'b1;
                    end
                    4'b0101: begin // MVN Rd, Rs (Move NOT Register)
                        alu_src   = 1'b0;
                        alu_op    = 4'd13; // NOT operation
                        reg_write = 1'b1;
                    end
                    default: begin
                        reg_write  = 1'b0;
                    end
                endcase
            end

            4'b0010: begin // Branch-Compare group
                branch = 1'b1;
                case(mode_bits)
                    // ... (keep branch logic the same) ...
                   
                    4'b1110: begin // CMPS
                        branch = 1'b0;
                        alu_op = 4'd10; // ALIGNED TO ALU
                    end
                    4'b1111: begin // CMP
                        branch = 1'b0;
                        alu_op = 4'd9;  // ALIGNED TO ALU
                    end
                endcase
            end

            4'b0011: begin // Shift group
                reg_write = 1'b1;
                case(mode_bits)
                    4'b0000: begin alu_op = 4'd6; end // Rshift Ra,Rb
                    4'b0001: begin alu_op = 4'd6; alu_src = 1'b1; end // Rshift R1,#imm
                    4'b0010: begin alu_op = 4'd5; end // Lshift
                    4'b0011: begin alu_op = 4'd5; alu_src = 1'b1; end // Lshift #imm
                    4'b0100: begin alu_op = 4'd4; end // Arith-right
                    4'b0101: begin alu_op = 4'd4; alu_src = 1'b1; end // Arith-right #imm
                    4'b0110: begin alu_op = 4'd8; end // ROR
                    4'b0111: begin alu_op = 4'd8; alu_src = 1'b1; end // ROR #imm
                    4'b1000: begin alu_op = 4'd7; end // ROL
                    4'b1001: begin alu_op = 4'd7; alu_src = 1'b1; end // ROL #imm
                    default: ;
                endcase
            end

            // [MODIFIED] Added missing arithmetic opcodes (ADD, ADDI, SUB, SBI)
            4'b0100: begin // ADD Rd, Ra, Rb
                reg_write = 1'b1;
                alu_src   = 1'b0;
                alu_op    = 4'd0;
            end

            4'b0101: begin // ADDI Rd, Ra, #imm
                reg_write = 1'b1;
                alu_src   = 1'b1;
                alu_op    = 4'd0;
            end

            4'b0110: begin // SUB Rd, Ra, Rb
                reg_write = 1'b1;
                alu_src   = 1'b0;
                alu_op    = 4'd1;
            end

            4'b0111: begin // SBI Rd, Ra, #imm (SUBI)
                reg_write = 1'b1;
                alu_src   = 1'b1;
                alu_op    = 4'd1;
            end

            4'b1000: begin // AND
                reg_write = 1'b1;
                alu_op    = 4'd11; // NEW ALU OPCODE
            end

            4'b1001: begin // OR
                reg_write = 1'b1;
                alu_op    = 4'd12; // NEW ALU OPCODE
            end

            4'b1010: begin // NOT
                reg_write = 1'b1;
                alu_op    = 4'd13; // NEW ALU OPCODE
            end

            4'b1011: begin // XOR
                reg_write = 1'b1;
                alu_op    = 4'd14; // NEW ALU OPCODE
            end

            4'b1100: begin // MUL (Unsigned)
                reg_write = 1'b1;
                alu_op    = 4'd2;  // ALIGNED TO ALU
            end

            4'b1101: begin // MULS (Signed)
                reg_write = 1'b1;
                alu_op    = 4'd3;  // ALIGNED TO ALU
            end

            4'b1110: begin // NOP
                
            end

            4'b1111: begin // HLT
              hlt=1;
            end

        endcase
    end

endmodule