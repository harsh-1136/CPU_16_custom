`timescale 1ns / 1ps
module ALU(
    input  [15:0] as,
    input  [15:0] bs,
    input  [3:0]  opcode,
    output reg [31:0] outs,
    output carry,
    output zero,
    output overflow,
    output sign,
    output eq,
    output gt,
    output lt
    );

    wire [15:0] a = as;
    wire [15:0] b = bs;
    // Add these wires
    wire [15:0] and_out = a & b;
    wire [15:0] or_out  = a | b;
    wire [15:0] not_out = ~a;
    wire [15:0] xor_out = a ^ b;

    // [MODIFIED] Explicitly declared as 16-bit to prevent 1-bit truncation
    wire [15:0] add_out, sub_out;
    wire        cout_add, cout_sub;
    wire [31:0] mul_out, booth_out;
    wire        eq_u, gt_u, lt_u;   
    wire        eq_s, gt_s, lt_s;   
    wire [15:0] ashr_out, shl_out, shr_out, rol_out, ror_out;

     add_16 ins1  (a, b, add_out, cout_add,1'b0);
    sub_16 ins2  (a, b, sub_out, cout_sub);
    mul_16 ins3  (a, b, mul_out);
    booth_mul_16 ins6  (a, b, booth_out);
    cmp0 ins4  (a, b, eq_u, gt_u, lt_u);
    cmps ins5  (a, b, eq_s, gt_s, lt_s);
    arth_right ins7  (a, b[3:0], ashr_out);
    left_shift_16 ins8  (a, b[3:0], shl_out);
    right_shift_16 ins9 (a, b[3:0], shr_out);
    rol  ins10 (a, b[3:0], rol_out);
    ror  ins11 (a, b[3:0], ror_out);

    always @(*) begin
        case (opcode)
            4'd0:outs ={16'b0, add_out};    
            4'd1:outs ={16'b0, sub_out};    
            4'd2:outs =mul_out;            
            4'd3:outs =booth_out;           
            4'd4:outs ={16'b0, ashr_out};   
            4'd5:outs ={16'b0, shl_out};    
            4'd6:outs ={16'b0, shr_out};    
            4'd7:outs ={16'b0, rol_out};   
            4'd8:outs ={16'b0, ror_out};    
            4'd9:outs ={31'b0, eq_u};      
            4'd10:outs ={31'b0, eq_s};
            4'd11: outs = {16'b0, and_out}; 
            4'd12: outs = {16'b0, or_out};
            4'd13: outs = {16'b0, not_out};
            4'd14: outs = {16'b0, xor_out};
            4'd15: outs = {16'b0, b}; // [FIX] Pass operand B directly for MOV instructions (imm or Rs)
            default:outs=32'b0;
        endcase
    end

    assign carry    = (opcode==4'd0) ? cout_add : (opcode==4'd1) ? cout_sub : 1'b0;
   assign zero = (opcode==4'd9)  ? eq_u :(opcode==4'd10) ? eq_s :(outs == 32'b0);
    assign sign     = outs[15];
    assign overflow = (opcode==4'd0)?(a[15]==b[15] && outs[15]!=a[15]):(opcode==4'd1) ?(a[15]!=b[15] && outs[15]!=a[15]) : 1'b0;
    assign eq = (opcode==4'd10) ? eq_s : eq_u;
    assign gt = (opcode==4'd10) ? gt_s : gt_u;
    assign lt = (opcode==4'd10) ? lt_s : lt_u;

endmodule

// [ADDED] Unsigned 16-bit multiplier module
module mul_16(
    input  [15:0] a,
    input  [15:0] b,
    output [31:0] prod
);
    assign prod = a * b;
endmodule

// [ADDED] Signed 16-bit multiplier module
module booth_mul_16(
    input  [15:0] a,
    input  [15:0] b,
    output [31:0] prod
);
    assign prod = $signed(a) * $signed(b);
endmodule

// [ADDED] 16-bit logical left shift module
module left_shift_16(
    input  [15:0] a,
    input  [3:0]  s,
    output [15:0] out
);
    assign out = a << s;
endmodule

// [ADDED] 16-bit logical right shift module
module right_shift_16(
    input  [15:0] a,
    input  [3:0]  s,
    output [15:0] out
);
    assign out = a >> s;
endmodule