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
    output reg [3:0] alu_op
    );

    always@(*) begin
       
        reg_write  = 1'b0;
        alu_src    = 1'b0;
        mem_read   = 1'b0;
        mem_write  = 1'b0;
        mem_to_reg = 1'b0;
        branch     = 1'b0;
        alu_op     = 4'b0000;

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
                    4'b0000: ; // B        
                    4'b0001: ; // BZ
                    4'b0010: ; // BNZ
                    4'b0011: ; // BC
                    4'b0100: ; // BNC
                    4'b0101: ; // BV
                    4'b0110: ; // BNV
                    4'b0111: ; // (unused)
                    4'b1000: ; // BEQ
                    4'b1001: ; // BNE
                    4'b1010: ; // BGT
                    4'b1011: ; // BLT
                    4'b1100: ; // BGE
                    4'b1101: ; // BLE
                    4'b1110: begin // CMPS
                        branch = 1'b0;
                        alu_op = 4'b1110;
                    end
                    4'b1111: begin // CMP
                        branch = 1'b0;
                        alu_op = 4'b1111;
                    end
                endcase
            end

            4'b0011: begin // Shift group
                reg_write = 1'b1;
                case(mode_bits)
                    4'b0000: alu_op = 4'b0000; // Rshift Ra,Rb
                    4'b0001: begin alu_op = 4'b0001; alu_src = 1'b1; end // Rshift R1,#imm
                    4'b0010: alu_op = 4'b0010; // Lshift
                    4'b0011: begin alu_op = 4'b0011; alu_src = 1'b1; end // Lshift #imm
                    4'b0100: alu_op = 4'b0100; // Arith-right
                    4'b0101: begin alu_op = 4'b0101; alu_src = 1'b1; end // Arith-right #imm
                    4'b0110: alu_op = 4'b0110; // ROR
                    4'b0111: begin alu_op = 4'b0111; alu_src = 1'b1; end // ROR #imm
                    4'b1000: alu_op = 4'b1000; // ROL
                    4'b1001: begin alu_op = 4'b1001; alu_src = 1'b1; end // ROL #imm
                    default: ;
                endcase
            end

            4'b0100: begin // ADD R1,R2
                reg_write = 1'b1;
                alu_op    = 4'b0000;
            end

            4'b0101: begin // ADD R1,#imm
                reg_write = 1'b1;
                alu_src   = 1'b1;
                alu_op    = 4'b0000;
            end

            4'b0110: begin // SUB
                reg_write = 1'b1;
                alu_op    = 4'b0001;
            end

            4'b0111: begin // SUB R1,#imm
                reg_write = 1'b1;
                alu_src   = 1'b1;
                alu_op    = 4'b0001;
            end

            4'b1000: begin // AND
                reg_write = 1'b1;
                alu_op    = 4'b0010;
            end

            4'b1001: begin // OR
                reg_write = 1'b1;
                alu_op    = 4'b0011;
            end

            4'b1010: begin // NOT
                reg_write = 1'b1;
                alu_op    = 4'b0100;
            end

            4'b1011: begin // XOR
                reg_write = 1'b1;
                alu_op    = 4'b0101;
            end

            4'b1100: begin // MUL
                reg_write = 1'b1;
                alu_op    = 4'b0110;
            end

            4'b1101: begin // MULS
                reg_write = 1'b1;
                alu_op    = 4'b0111;
            end

            4'b1110: begin // NOP
                
            end

            4'b1111: begin // HLT
              
            end

        endcase
    end

endmodule