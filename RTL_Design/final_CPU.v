`timescale 1ns / 1ps

module final_CPU(
    input clk,
    input reset
    );
    
    wire hlt;
    wire   reg_write, alu_src,  mem_read,  mem_write,   mem_to_reg, branch;
    wire [15:0] pc_address,ins_out;
    wire [15:0] pc_out;
    program_counter ins1(clk,reset,hlt?0:1,branch?1:0,pc_address,pc_out);
    instruction_mem ins(pc_out,ins_out);
    wire [3:0] alu_op;
    main_decoder ins2(ins_out[15:12],ins_out[11:8],reg_write , alu_src,  mem_read,  mem_write,   mem_to_reg, branch,alu_op,hlt);
   //for mem to reg
   wire[15:0] mem_out,mem_address;
   main_memory inst(mem_to_reg?dataout_rb:ins_out[3:0],dataout_ra,mem_out,mem_read,mem_write,clk);
   //now for reg file 
   wire [15:0] reg_out,dataout_ra,dataout_rb;
  reg_file_16 inst3(
    mem_to_reg?mem_out:alu_out[15:0],
     ins_out[11:8],     // write address
     ins_out[7:4],     // read port A address
     ins_out[3:0],     // read port B address
     reg_write,
     clk,
     dataout_ra,
     dataout_rb
    );
   wire carry, zero,overflow,sign,eq,gt,lt;
   wire[31:0] alu_out;
    ALU inst5(
    dataout_ra,
     dataout_rb,
    alu_op,alu_out,
     carry,
     zero,
     overflow,
     sign,
     eq,
    gt,
    lt
    );
    
endmodule
