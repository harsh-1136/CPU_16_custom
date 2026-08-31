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

            4'b0001: begin // MOV group -- fill in sub-modes yourself
                reg_write = 1'b1;
                case(mode_bits)
                    4'b0000: begin // MOV R1,R2
                        alu_src = 1'b0;
                    end
                    4'b0100: begin // MOV [R1],R2
                        mem_write = 1'b1;
                        reg_write = 1'b0;
                    end
                    4'b1000: begin // MOV R1,[R2]
                        mem_read   = 1'b1;
                        mem_to_reg = 1'b1;
                    end
                    mode_bits[3]&mode_bits[2]: begin // MOV R1,#imm
                        alu_src = 1'b1;
                    end
                    
                    default: ;
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

            // ALU opcodes 0 and 1 (ADD/SUB) were already aligned.

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