# File saved with Nlview 7.8.0 2024-04-26 e1825d835c VDI=44 GEI=38 GUI=JA:21.0 threadsafe
# 
# non-default properties - (restore without -noprops)
property -colorscheme classic
property attrcolor #000000
property attrfontsize 8
property autobundle 1
property backgroundcolor #ffffff
property boxcolor0 #000000
property boxcolor1 #000000
property boxcolor2 #000000
property boxinstcolor #000000
property boxpincolor #000000
property buscolor #008000
property closeenough 5
property createnetattrdsp 2048
property decorate 1
property elidetext 40
property fillcolor1 #ffffcc
property fillcolor2 #dfebf8
property fillcolor3 #f0f0f0
property gatecellname 2
property instattrmax 30
property instdrag 15
property instorder 1
property marksize 12
property maxfontsize 15
property maxzoom 6.25
property netcolor #19b400
property objecthighlight0 #ff00ff
property objecthighlight1 #ffff00
property objecthighlight2 #00ff00
property objecthighlight3 #0095ff
property objecthighlight4 #8000ff
property objecthighlight5 #ffc800
property objecthighlight7 #00ffff
property objecthighlight8 #ff00ff
property objecthighlight9 #ccccff
property objecthighlight10 #0ead00
property objecthighlight11 #cefc00
property objecthighlight12 #9e2dbe
property objecthighlight13 #ba6a29
property objecthighlight14 #fc0188
property objecthighlight15 #02f990
property objecthighlight16 #f1b0fb
property objecthighlight17 #fec004
property objecthighlight18 #149bff
property objecthighlight19 #eb591b
property overlaycolor #19b400
property pbuscolor #000000
property pbusnamecolor #000000
property pinattrmax 20
property pinorder 2
property pinpermute 0
property portcolor #000000
property portnamecolor #000000
property ripindexfontsize 4
property rippercolor #000000
property rubberbandcolor #000000
property rubberbandfontsize 15
property selectattr 0
property selectionappearance 2
property selectioncolor #0000ff
property sheetheight 44
property sheetwidth 68
property showmarks 1
property shownetname 0
property showpagenumbers 1
property showripindex 1
property timelimit 1
#
module new final_CPU work:final_CPU:NOFILE -nosplit
load symbol RTL_MUX work MUX pin S input.bot pinBus I0 input.left [15:0] pinBus I1 input.left [15:0] pinBus O output.right [15:0] fillcolor 1
load symbol RTL_MUX62 work MUX pinBus I0 input.left [3:0] pinBus I1 input.left [3:0] pinBus I2 input.left [3:0] pinBus I3 input.left [3:0] pinBus O output.right [3:0] pinBus S input.bot [3:0] fillcolor 1
load symbol RTL_EQ1 work RTL(=) pin I0 input.left pin I1 input.left pin O output.right fillcolor 1
load symbol RTL_OR0 work OR pin I0 input pin I1 input pin O output fillcolor 1
load symbol RTL_NEQ work RTL(!=) pin I0 input.left pin I1 input.left pin O output.right fillcolor 1
load symbol RTL_MUX58 work MUX pin I0 input.left pin I1 input.left pin I10 input.left pin I11 input.left pin I12 input.left pin I13 input.left pin I2 input.left pin I3 input.left pin I4 input.left pin I5 input.left pin I6 input.left pin I7 input.left pin I8 input.left pin I9 input.left pin O output.right pinBus S input.bot [3:0] fillcolor 1
load symbol RTL_MUX0 work MUX pin I0 input.left pin I1 input.left pin O output.right pin S input.bot fillcolor 1
load symbol RTL_REG_ASYNC__BREG_1 work GEN pin C input.clk.left pin CE input.left pin CLR input.top pin D input.left pin Q output.right fillcolor 1
load symbol instruction_mem work:instruction_mem:NOFILE HIERBOX pinBus ins_out output.right [15:0] pinBus pc_out input.left [15:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol program_counter work:program_counter:NOFILE HIERBOX pin clk input.left pin en input.left pin load input.left pin reset input.left pinBus address input.left [15:0] pinBus out output.right [15:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol main_decoder work:main_decoder:NOFILE HIERBOX pin alu_src output.right pin branch output.right pin hlt output.right pin mem_read output.right pin mem_to_reg output.right pin mem_write output.right pin reg_write output.right pinBus alu_op output.right [3:0] pinBus mode_bits input.left [3:0] pinBus opcode input.left [3:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol main_memory work:main_memory:NOFILE HIERBOX pin clk input.left pin mem_read input.left pin mem_write input.left pinBus address input.left [15:0] pinBus data_in input.left [15:0] pinBus data_out output.right [15:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol reg_file_16 work:reg_file_16:NOFILE HIERBOX pin clk input.left pin reset input.left pin wr input.left pinBus addr_ra input.left [3:0] pinBus addr_rb input.left [3:0] pinBus address input.left [3:0] pinBus datain input.left [15:0] pinBus dataout_ra output.right [15:0] pinBus dataout_rb output.right [15:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol ALU work:ALU:NOFILE HIERBOX pin carry output.right pin eq output.right pin gt output.right pin lt output.right pin overflow output.right pin sign output.right pin zero output.right pinBus as input.left [15:0] pinBus bs input.left [15:0] pinBus opcode input.left [3:0] pinBus outs output.right [31:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol sign_extend work:sign_extend:NOFILE HIERBOX pinBus imm_in input.left [3:0] pinBus imm_out output.right [15:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol RTL_EQ11 work RTL(=) pin O output.right pinBus I0 input.left [3:0] pinBus I1 input.left [3:0] fillcolor 1
load symbol RTL_MUX60 work MUX pin S input.bot pinBus I0 input.left [3:0] pinBus I1 input.left [3:0] pinBus O output.right [3:0] fillcolor 1
load port clk input -pg 1 -lvl 0 -x 0 -y 280
load port reset input -pg 1 -lvl 0 -x 0 -y 460
load inst address0_i RTL_MUX work -attr @cell(#000000) RTL_MUX -pinBusAttr I0 @name I0[15:0] -pinBusAttr I0 @attr S=1'b1 -pinBusAttr I1 @name I1[15:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[15:0] -pg 1 -lvl 14 -x 4590 -y 550
load inst alu_op_i RTL_MUX62 work -attr @cell(#000000) RTL_MUX -pinBusAttr I0 @name I0[3:0] -pinBusAttr I0 @attr V=B\"0001\",\ S=4'b0000 -pinBusAttr I1 @name I1[3:0] -pinBusAttr I1 @attr V=B\"0010\",\ S=4'b0001 -pinBusAttr I2 @name I2[3:0] -pinBusAttr I2 @attr V=B\"0100\",\ S=4'b1001 -pinBusAttr I3 @name I3[3:0] -pinBusAttr I3 @attr V=B\"1000\",\ S=4'b1010 -pinBusAttr O @name O[3:0] -pinBusAttr S @name S[3:0] -pg 1 -lvl 2 -x 610 -y 90
load inst b0_i RTL_EQ1 work -attr @cell(#000000) RTL_EQ -pg 1 -lvl 8 -x 2650 -y 510
load inst b0_i__0 RTL_EQ1 work -attr @cell(#000000) RTL_EQ -pg 1 -lvl 8 -x 2650 -y 600
load inst b0_i__1 RTL_EQ1 work -attr @cell(#000000) RTL_EQ -pg 1 -lvl 8 -x 2650 -y 740
load inst b0_i__10 RTL_OR0 work -attr @cell(#000000) RTL_OR -pg 1 -lvl 8 -x 2650 -y 1420
load inst b0_i__2 RTL_EQ1 work -attr @cell(#000000) RTL_EQ -pg 1 -lvl 8 -x 2650 -y 860
load inst b0_i__3 RTL_EQ1 work -attr @cell(#000000) RTL_EQ -pg 1 -lvl 8 -x 2650 -y 980
load inst b0_i__4 RTL_EQ1 work -attr @cell(#000000) RTL_EQ -pg 1 -lvl 8 -x 2650 -y 1120
load inst b0_i__5 RTL_EQ1 work -attr @cell(#000000) RTL_EQ -pg 1 -lvl 7 -x 2360 -y 1100
load inst b0_i__6 RTL_NEQ work -attr @cell(#000000) RTL_NEQ -pg 1 -lvl 8 -x 2650 -y 1240
load inst b0_i__7 RTL_EQ1 work -attr @cell(#000000) RTL_EQ -pg 1 -lvl 7 -x 2360 -y 1200
load inst b0_i__8 RTL_EQ1 work -attr @cell(#000000) RTL_EQ -pg 1 -lvl 7 -x 2360 -y 1290
load inst b0_i__9 RTL_OR0 work -attr @cell(#000000) RTL_OR -pg 1 -lvl 8 -x 2650 -y 1320
load inst b_i RTL_MUX58 work -attr @cell(#000000) RTL_MUX -pinAttr I0 @attr S=4'b0000 -pinAttr I1 @attr S=4'b0001 -pinAttr I10 @attr S=4'b1011 -pinAttr I11 @attr S=4'b1100 -pinAttr I12 @attr S=4'b1101 -pinAttr I13 @attr S=default -pinAttr I2 @attr S=4'b0010 -pinAttr I3 @attr S=4'b0011 -pinAttr I4 @attr S=4'b0100 -pinAttr I5 @attr S=4'b0101 -pinAttr I6 @attr S=4'b0110 -pinAttr I7 @attr S=4'b1000 -pinAttr I8 @attr S=4'b1001 -pinAttr I9 @attr S=4'b1010 -pinBusAttr S @name S[3:0] -pg 1 -lvl 9 -x 3110 -y 800
load inst b_i__0 RTL_MUX0 work -attr @cell(#000000) RTL_MUX -pinAttr I0 @attr S=1'b1 -pinAttr I1 @attr S=default -pg 1 -lvl 10 -x 3350 -y 810
load inst bs0_i RTL_MUX work -attr @cell(#000000) RTL_MUX -pinBusAttr I0 @name I0[15:0] -pinBusAttr I0 @attr S=1'b1 -pinBusAttr I1 @name I1[15:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[15:0] -pg 1 -lvl 4 -x 1350 -y 670
load inst carry_r_reg RTL_REG_ASYNC__BREG_1 work -attr @cell(#000000) RTL_REG_ASYNC -pg 1 -lvl 7 -x 2360 -y 760
load inst datain0_i RTL_MUX work -attr @cell(#000000) RTL_MUX -pinBusAttr I0 @name I0[15:0] -pinBusAttr I0 @attr S=1'b1 -pinBusAttr I1 @name I1[15:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[15:0] -pg 1 -lvl 3 -x 930 -y 310
load inst en0_i RTL_MUX0 work -attr @cell(#000000) RTL_MUX -pinAttr I0 @attr S=1'b1 -pinAttr I1 @attr S=default -pg 1 -lvl 10 -x 3350 -y 520
load inst eq_r_reg RTL_REG_ASYNC__BREG_1 work -attr @cell(#000000) RTL_REG_ASYNC -pg 1 -lvl 6 -x 2030 -y 940
load inst flag_write0_i RTL_OR0 work -attr @cell(#000000) RTL_OR -pg 1 -lvl 4 -x 1350 -y 90
load inst flag_write1_i RTL_OR0 work -attr @cell(#000000) RTL_OR -pinAttr I0 @attr n/c -pg 1 -lvl 3 -x 930 -y 80
load inst flag_write_i RTL_OR0 work -attr @cell(#000000) RTL_OR -pg 1 -lvl 5 -x 1690 -y 130
load inst gt_r_reg RTL_REG_ASYNC__BREG_1 work -attr @cell(#000000) RTL_REG_ASYNC -pg 1 -lvl 6 -x 2030 -y 540
load inst ins instruction_mem work:instruction_mem:NOFILE -autohide -attr @cell(#000000) instruction_mem -pinBusAttr ins_out @name ins_out[15:0] -pinBusAttr pc_out @name pc_out[15:0] -pg 1 -lvl 12 -x 3860 -y 760
load inst ins1 program_counter work:program_counter:NOFILE -autohide -attr @cell(#000000) program_counter -pinBusAttr address @name address[15:0] -pinBusAttr out @name out[15:0] -pg 1 -lvl 11 -x 3640 -y 720
load inst ins2 main_decoder work:main_decoder:NOFILE -autohide -attr @cell(#000000) main_decoder -pinBusAttr alu_op @name alu_op[3:0] -pinBusAttr mode_bits @name mode_bits[3:0] -pinBusAttr opcode @name opcode[3:0] -pg 1 -lvl 13 -x 4180 -y 350
load inst inst main_memory work:main_memory:NOFILE -autohide -attr @cell(#000000) main_memory -pinBusAttr address @name address[15:0] -pinBusAttr data_in @name data_in[15:0] -pinBusAttr data_out @name data_out[15:0] -pg 1 -lvl 2 -x 610 -y 250
load inst inst3 reg_file_16 work:reg_file_16:NOFILE -autohide -attr @cell(#000000) reg_file_16 -pinBusAttr addr_ra @name addr_ra[3:0] -pinBusAttr addr_rb @name addr_rb[3:0] -pinBusAttr address @name address[3:0] -pinBusAttr datain @name datain[15:0] -pinBusAttr dataout_ra @name dataout_ra[15:0] -pinBusAttr dataout_rb @name dataout_rb[15:0] -pg 1 -lvl 4 -x 1350 -y 310
load inst inst5 ALU work:ALU:NOFILE -autohide -attr @cell(#000000) ALU -pinAttr sign @attr n/c -pinBusAttr as @name as[15:0] -pinBusAttr bs @name bs[15:0] -pinBusAttr opcode @name opcode[3:0] -pinBusAttr outs @name outs[31:0] -pg 1 -lvl 5 -x 1690 -y 600
load inst inst6 sign_extend work:sign_extend:NOFILE -autohide -attr @cell(#000000) sign_extend -pinBusAttr imm_in @name imm_in[3:0] -pinBusAttr imm_out @name imm_out[15:0] -pg 1 -lvl 3 -x 930 -y 650
load inst lt_r_reg RTL_REG_ASYNC__BREG_1 work -attr @cell(#000000) RTL_REG_ASYNC -pg 1 -lvl 6 -x 2030 -y 740
load inst overflow_r_reg RTL_REG_ASYNC__BREG_1 work -attr @cell(#000000) RTL_REG_ASYNC -pg 1 -lvl 7 -x 2360 -y 920
load inst write_reg_addr1_i RTL_OR0 work -attr @cell(#000000) RTL_OR -pg 1 -lvl 2 -x 610 -y 580
load inst write_reg_addr2_i RTL_EQ11 work -attr @cell(#000000) RTL_EQ -pinBusAttr I0 @name I0[3:0] -pinBusAttr I1 @name I1[3:0] -pinBusAttr I1 @attr V=B\"0001\" -pg 1 -lvl 1 -x 190 -y 530
load inst write_reg_addr2_i__0 RTL_EQ11 work -attr @cell(#000000) RTL_EQ -pinBusAttr I0 @name I0[3:0] -pinBusAttr I1 @name I1[3:0] -pinBusAttr I1 @attr V=B\"0011\" -pg 1 -lvl 1 -x 190 -y 620
load inst write_reg_addr_i RTL_MUX60 work -attr @cell(#000000) RTL_MUX -pinBusAttr I0 @name I0[3:0] -pinBusAttr I0 @attr S=1'b1 -pinBusAttr I1 @name I1[3:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[3:0] -pg 1 -lvl 3 -x 930 -y 520
load inst zero_r_reg RTL_REG_ASYNC__BREG_1 work -attr @cell(#000000) RTL_REG_ASYNC -pg 1 -lvl 7 -x 2360 -y 600
load net <const0> -ground -pin alu_op_i I0[3] -pin alu_op_i I0[2] -pin alu_op_i I0[1] -pin alu_op_i I1[3] -pin alu_op_i I1[2] -pin alu_op_i I1[0] -pin alu_op_i I2[3] -pin alu_op_i I2[1] -pin alu_op_i I2[0] -pin alu_op_i I3[2] -pin alu_op_i I3[1] -pin alu_op_i I3[0] -pin b0_i__0 I1 -pin b0_i__2 I1 -pin b0_i__4 I1 -pin b_i I13 -pin b_i__0 I1 -pin en0_i I0 -pin ins1 address[15] -pin ins1 address[14] -pin ins1 address[13] -pin ins1 address[12] -pin ins1 address[11] -pin ins1 address[10] -pin ins1 address[9] -pin ins1 address[8] -pin write_reg_addr2_i I1[3] -pin write_reg_addr2_i I1[2] -pin write_reg_addr2_i I1[1] -pin write_reg_addr2_i__0 I1[3] -pin write_reg_addr2_i__0 I1[2]
load net <const1> -power -pin alu_op_i I0[0] -pin alu_op_i I1[1] -pin alu_op_i I2[2] -pin alu_op_i I3[3] -pin b0_i I1 -pin b0_i__1 I1 -pin b0_i__3 I1 -pin b0_i__5 I1 -pin b0_i__6 I1 -pin b0_i__7 I1 -pin b0_i__8 I1 -pin b_i I0 -pin en0_i I1 -pin write_reg_addr2_i I1[0] -pin write_reg_addr2_i__0 I1[1] -pin write_reg_addr2_i__0 I1[0]
load net address0[0] -attr @rip(#000000) O[0] -pin address0_i O[0] -pin inst address[0]
load net address0[10] -attr @rip(#000000) O[10] -pin address0_i O[10] -pin inst address[10]
load net address0[11] -attr @rip(#000000) O[11] -pin address0_i O[11] -pin inst address[11]
load net address0[12] -attr @rip(#000000) O[12] -pin address0_i O[12] -pin inst address[12]
load net address0[13] -attr @rip(#000000) O[13] -pin address0_i O[13] -pin inst address[13]
load net address0[14] -attr @rip(#000000) O[14] -pin address0_i O[14] -pin inst address[14]
load net address0[15] -attr @rip(#000000) O[15] -pin address0_i O[15] -pin inst address[15]
load net address0[1] -attr @rip(#000000) O[1] -pin address0_i O[1] -pin inst address[1]
load net address0[2] -attr @rip(#000000) O[2] -pin address0_i O[2] -pin inst address[2]
load net address0[3] -attr @rip(#000000) O[3] -pin address0_i O[3] -pin inst address[3]
load net address0[4] -attr @rip(#000000) O[4] -pin address0_i O[4] -pin inst address[4]
load net address0[5] -attr @rip(#000000) O[5] -pin address0_i O[5] -pin inst address[5]
load net address0[6] -attr @rip(#000000) O[6] -pin address0_i O[6] -pin inst address[6]
load net address0[7] -attr @rip(#000000) O[7] -pin address0_i O[7] -pin inst address[7]
load net address0[8] -attr @rip(#000000) O[8] -pin address0_i O[8] -pin inst address[8]
load net address0[9] -attr @rip(#000000) O[9] -pin address0_i O[9] -pin inst address[9]
load net alu_op[0] -attr @rip(#000000) alu_op[0] -pin alu_op_i S[0] -pin ins2 alu_op[0] -pin inst5 opcode[0]
load net alu_op[1] -attr @rip(#000000) alu_op[1] -pin alu_op_i S[1] -pin ins2 alu_op[1] -pin inst5 opcode[1]
load net alu_op[2] -attr @rip(#000000) alu_op[2] -pin alu_op_i S[2] -pin ins2 alu_op[2] -pin inst5 opcode[2]
load net alu_op[3] -attr @rip(#000000) alu_op[3] -pin alu_op_i S[3] -pin ins2 alu_op[3] -pin inst5 opcode[3]
load net alu_op_i_n_0 -attr @rip(#000000) O[3] -pin alu_op_i O[3] -pin flag_write_i I1
load net alu_op_i_n_1 -attr @rip(#000000) O[2] -pin alu_op_i O[2] -pin flag_write0_i I1
load net alu_op_i_n_2 -attr @rip(#000000) O[1] -pin alu_op_i O[1] -pin flag_write1_i I1
load net alu_op_i_n_3 -attr @rip(#000000) O[0] -pin alu_op_i O[0]
load net alu_out[0] -attr @rip(#000000) outs[0] -pin datain0_i I1[0] -pin inst5 outs[0]
load net alu_out[10] -attr @rip(#000000) outs[10] -pin datain0_i I1[10] -pin inst5 outs[10]
load net alu_out[11] -attr @rip(#000000) outs[11] -pin datain0_i I1[11] -pin inst5 outs[11]
load net alu_out[12] -attr @rip(#000000) outs[12] -pin datain0_i I1[12] -pin inst5 outs[12]
load net alu_out[13] -attr @rip(#000000) outs[13] -pin datain0_i I1[13] -pin inst5 outs[13]
load net alu_out[14] -attr @rip(#000000) outs[14] -pin datain0_i I1[14] -pin inst5 outs[14]
load net alu_out[15] -attr @rip(#000000) outs[15] -pin datain0_i I1[15] -pin inst5 outs[15]
load net alu_out[1] -attr @rip(#000000) outs[1] -pin datain0_i I1[1] -pin inst5 outs[1]
load net alu_out[2] -attr @rip(#000000) outs[2] -pin datain0_i I1[2] -pin inst5 outs[2]
load net alu_out[3] -attr @rip(#000000) outs[3] -pin datain0_i I1[3] -pin inst5 outs[3]
load net alu_out[4] -attr @rip(#000000) outs[4] -pin datain0_i I1[4] -pin inst5 outs[4]
load net alu_out[5] -attr @rip(#000000) outs[5] -pin datain0_i I1[5] -pin inst5 outs[5]
load net alu_out[6] -attr @rip(#000000) outs[6] -pin datain0_i I1[6] -pin inst5 outs[6]
load net alu_out[7] -attr @rip(#000000) outs[7] -pin datain0_i I1[7] -pin inst5 outs[7]
load net alu_out[8] -attr @rip(#000000) outs[8] -pin datain0_i I1[8] -pin inst5 outs[8]
load net alu_out[9] -attr @rip(#000000) outs[9] -pin datain0_i I1[9] -pin inst5 outs[9]
load net alu_src -pin bs0_i S -pin ins2 alu_src
netloc alu_src 1 4 10 1590 300 NJ 300 NJ 300 NJ 300 NJ 300 NJ 300 NJ 300 NJ 300 NJ 300 4340
load net b -pin b_i O -pin b_i__0 I0
netloc b 1 9 1 N 800
load net b0 -pin b0_i O -pin b_i I1
netloc b0 1 8 1 2980 510n
load net b0_i__0_n_0 -pin b0_i__0 O -pin b_i I2
netloc b0_i__0_n_0 1 8 1 2900 600n
load net b0_i__10_n_0 -pin b0_i__10 O -pin b_i I12
netloc b0_i__10_n_0 1 8 1 2940 750n
load net b0_i__1_n_0 -pin b0_i__1 O -pin b_i I3
netloc b0_i__1_n_0 1 8 1 2840 740n
load net b0_i__2_n_0 -pin b0_i__2 O -pin b_i I4
netloc b0_i__2_n_0 1 8 1 2780 830n
load net b0_i__3_n_0 -pin b0_i__3 O -pin b_i I5
netloc b0_i__3_n_0 1 8 1 2800 850n
load net b0_i__4_n_0 -pin b0_i__4 O -pin b_i I6
netloc b0_i__4_n_0 1 8 1 2900 870n
load net b0_i__5_n_0 -pin b0_i__10 I1 -pin b0_i__5 O -pin b0_i__9 I1 -pin b_i I7
netloc b0_i__5_n_0 1 7 2 2540 1070 2920
load net b0_i__6_n_0 -pin b0_i__6 O -pin b_i I8
netloc b0_i__6_n_0 1 8 1 2980 910n
load net b0_i__7_n_0 -pin b0_i__7 O -pin b0_i__9 I0 -pin b_i I9
netloc b0_i__7_n_0 1 7 2 2580 1050 2960
load net b0_i__8_n_0 -pin b0_i__10 I0 -pin b0_i__8 O -pin b_i I10
netloc b0_i__8_n_0 1 7 2 2520 1370 2860
load net b0_i__9_n_0 -pin b0_i__9 O -pin b_i I11
netloc b0_i__9_n_0 1 8 1 2880 730n
load net b0_out -pin b_i__0 O -pin ins1 load
netloc b0_out 1 10 1 3470 790n
load net branch -pin b_i__0 S -pin ins2 branch
netloc branch 1 10 4 NJ 870 NJ 870 NJ 870 4420
load net bs0[0] -attr @rip(#000000) O[0] -pin bs0_i O[0] -pin inst5 bs[0]
load net bs0[10] -attr @rip(#000000) O[10] -pin bs0_i O[10] -pin inst5 bs[10]
load net bs0[11] -attr @rip(#000000) O[11] -pin bs0_i O[11] -pin inst5 bs[11]
load net bs0[12] -attr @rip(#000000) O[12] -pin bs0_i O[12] -pin inst5 bs[12]
load net bs0[13] -attr @rip(#000000) O[13] -pin bs0_i O[13] -pin inst5 bs[13]
load net bs0[14] -attr @rip(#000000) O[14] -pin bs0_i O[14] -pin inst5 bs[14]
load net bs0[15] -attr @rip(#000000) O[15] -pin bs0_i O[15] -pin inst5 bs[15]
load net bs0[1] -attr @rip(#000000) O[1] -pin bs0_i O[1] -pin inst5 bs[1]
load net bs0[2] -attr @rip(#000000) O[2] -pin bs0_i O[2] -pin inst5 bs[2]
load net bs0[3] -attr @rip(#000000) O[3] -pin bs0_i O[3] -pin inst5 bs[3]
load net bs0[4] -attr @rip(#000000) O[4] -pin bs0_i O[4] -pin inst5 bs[4]
load net bs0[5] -attr @rip(#000000) O[5] -pin bs0_i O[5] -pin inst5 bs[5]
load net bs0[6] -attr @rip(#000000) O[6] -pin bs0_i O[6] -pin inst5 bs[6]
load net bs0[7] -attr @rip(#000000) O[7] -pin bs0_i O[7] -pin inst5 bs[7]
load net bs0[8] -attr @rip(#000000) O[8] -pin bs0_i O[8] -pin inst5 bs[8]
load net bs0[9] -attr @rip(#000000) O[9] -pin bs0_i O[9] -pin inst5 bs[9]
load net carry -pin carry_r_reg D -pin inst5 carry
netloc carry 1 5 2 NJ 610 2250
load net carry_r -pin b0_i__1 I0 -pin b0_i__2 I0 -pin carry_r_reg Q
netloc carry_r 1 7 1 2560 730n
load net clk -pin carry_r_reg C -port clk -pin eq_r_reg C -pin gt_r_reg C -pin ins1 clk -pin inst clk -pin inst3 clk -pin lt_r_reg C -pin overflow_r_reg C -pin zero_r_reg C
netloc clk 1 0 11 NJ 280 370 440 NJ 440 1180 520 NJ 520 1960 650 2290 670 NJ 670 2940J 600 3230J 610 3490
load net datain0[0] -attr @rip(#000000) O[0] -pin datain0_i O[0] -pin inst3 datain[0]
load net datain0[10] -attr @rip(#000000) O[10] -pin datain0_i O[10] -pin inst3 datain[10]
load net datain0[11] -attr @rip(#000000) O[11] -pin datain0_i O[11] -pin inst3 datain[11]
load net datain0[12] -attr @rip(#000000) O[12] -pin datain0_i O[12] -pin inst3 datain[12]
load net datain0[13] -attr @rip(#000000) O[13] -pin datain0_i O[13] -pin inst3 datain[13]
load net datain0[14] -attr @rip(#000000) O[14] -pin datain0_i O[14] -pin inst3 datain[14]
load net datain0[15] -attr @rip(#000000) O[15] -pin datain0_i O[15] -pin inst3 datain[15]
load net datain0[1] -attr @rip(#000000) O[1] -pin datain0_i O[1] -pin inst3 datain[1]
load net datain0[2] -attr @rip(#000000) O[2] -pin datain0_i O[2] -pin inst3 datain[2]
load net datain0[3] -attr @rip(#000000) O[3] -pin datain0_i O[3] -pin inst3 datain[3]
load net datain0[4] -attr @rip(#000000) O[4] -pin datain0_i O[4] -pin inst3 datain[4]
load net datain0[5] -attr @rip(#000000) O[5] -pin datain0_i O[5] -pin inst3 datain[5]
load net datain0[6] -attr @rip(#000000) O[6] -pin datain0_i O[6] -pin inst3 datain[6]
load net datain0[7] -attr @rip(#000000) O[7] -pin datain0_i O[7] -pin inst3 datain[7]
load net datain0[8] -attr @rip(#000000) O[8] -pin datain0_i O[8] -pin inst3 datain[8]
load net datain0[9] -attr @rip(#000000) O[9] -pin datain0_i O[9] -pin inst3 datain[9]
load net dataout_ra[0] -attr @rip(#000000) dataout_ra[0] -pin address0_i I1[0] -pin inst3 dataout_ra[0] -pin inst5 as[0]
load net dataout_ra[10] -attr @rip(#000000) dataout_ra[10] -pin address0_i I1[10] -pin inst3 dataout_ra[10] -pin inst5 as[10]
load net dataout_ra[11] -attr @rip(#000000) dataout_ra[11] -pin address0_i I1[11] -pin inst3 dataout_ra[11] -pin inst5 as[11]
load net dataout_ra[12] -attr @rip(#000000) dataout_ra[12] -pin address0_i I1[12] -pin inst3 dataout_ra[12] -pin inst5 as[12]
load net dataout_ra[13] -attr @rip(#000000) dataout_ra[13] -pin address0_i I1[13] -pin inst3 dataout_ra[13] -pin inst5 as[13]
load net dataout_ra[14] -attr @rip(#000000) dataout_ra[14] -pin address0_i I1[14] -pin inst3 dataout_ra[14] -pin inst5 as[14]
load net dataout_ra[15] -attr @rip(#000000) dataout_ra[15] -pin address0_i I1[15] -pin inst3 dataout_ra[15] -pin inst5 as[15]
load net dataout_ra[1] -attr @rip(#000000) dataout_ra[1] -pin address0_i I1[1] -pin inst3 dataout_ra[1] -pin inst5 as[1]
load net dataout_ra[2] -attr @rip(#000000) dataout_ra[2] -pin address0_i I1[2] -pin inst3 dataout_ra[2] -pin inst5 as[2]
load net dataout_ra[3] -attr @rip(#000000) dataout_ra[3] -pin address0_i I1[3] -pin inst3 dataout_ra[3] -pin inst5 as[3]
load net dataout_ra[4] -attr @rip(#000000) dataout_ra[4] -pin address0_i I1[4] -pin inst3 dataout_ra[4] -pin inst5 as[4]
load net dataout_ra[5] -attr @rip(#000000) dataout_ra[5] -pin address0_i I1[5] -pin inst3 dataout_ra[5] -pin inst5 as[5]
load net dataout_ra[6] -attr @rip(#000000) dataout_ra[6] -pin address0_i I1[6] -pin inst3 dataout_ra[6] -pin inst5 as[6]
load net dataout_ra[7] -attr @rip(#000000) dataout_ra[7] -pin address0_i I1[7] -pin inst3 dataout_ra[7] -pin inst5 as[7]
load net dataout_ra[8] -attr @rip(#000000) dataout_ra[8] -pin address0_i I1[8] -pin inst3 dataout_ra[8] -pin inst5 as[8]
load net dataout_ra[9] -attr @rip(#000000) dataout_ra[9] -pin address0_i I1[9] -pin inst3 dataout_ra[9] -pin inst5 as[9]
load net dataout_rb[0] -attr @rip(#000000) dataout_rb[0] -pin address0_i I0[0] -pin bs0_i I1[0] -pin inst data_in[0] -pin inst3 dataout_rb[0]
load net dataout_rb[10] -attr @rip(#000000) dataout_rb[10] -pin address0_i I0[10] -pin bs0_i I1[10] -pin inst data_in[10] -pin inst3 dataout_rb[10]
load net dataout_rb[11] -attr @rip(#000000) dataout_rb[11] -pin address0_i I0[11] -pin bs0_i I1[11] -pin inst data_in[11] -pin inst3 dataout_rb[11]
load net dataout_rb[12] -attr @rip(#000000) dataout_rb[12] -pin address0_i I0[12] -pin bs0_i I1[12] -pin inst data_in[12] -pin inst3 dataout_rb[12]
load net dataout_rb[13] -attr @rip(#000000) dataout_rb[13] -pin address0_i I0[13] -pin bs0_i I1[13] -pin inst data_in[13] -pin inst3 dataout_rb[13]
load net dataout_rb[14] -attr @rip(#000000) dataout_rb[14] -pin address0_i I0[14] -pin bs0_i I1[14] -pin inst data_in[14] -pin inst3 dataout_rb[14]
load net dataout_rb[15] -attr @rip(#000000) dataout_rb[15] -pin address0_i I0[15] -pin bs0_i I1[15] -pin inst data_in[15] -pin inst3 dataout_rb[15]
load net dataout_rb[1] -attr @rip(#000000) dataout_rb[1] -pin address0_i I0[1] -pin bs0_i I1[1] -pin inst data_in[1] -pin inst3 dataout_rb[1]
load net dataout_rb[2] -attr @rip(#000000) dataout_rb[2] -pin address0_i I0[2] -pin bs0_i I1[2] -pin inst data_in[2] -pin inst3 dataout_rb[2]
load net dataout_rb[3] -attr @rip(#000000) dataout_rb[3] -pin address0_i I0[3] -pin bs0_i I1[3] -pin inst data_in[3] -pin inst3 dataout_rb[3]
load net dataout_rb[4] -attr @rip(#000000) dataout_rb[4] -pin address0_i I0[4] -pin bs0_i I1[4] -pin inst data_in[4] -pin inst3 dataout_rb[4]
load net dataout_rb[5] -attr @rip(#000000) dataout_rb[5] -pin address0_i I0[5] -pin bs0_i I1[5] -pin inst data_in[5] -pin inst3 dataout_rb[5]
load net dataout_rb[6] -attr @rip(#000000) dataout_rb[6] -pin address0_i I0[6] -pin bs0_i I1[6] -pin inst data_in[6] -pin inst3 dataout_rb[6]
load net dataout_rb[7] -attr @rip(#000000) dataout_rb[7] -pin address0_i I0[7] -pin bs0_i I1[7] -pin inst data_in[7] -pin inst3 dataout_rb[7]
load net dataout_rb[8] -attr @rip(#000000) dataout_rb[8] -pin address0_i I0[8] -pin bs0_i I1[8] -pin inst data_in[8] -pin inst3 dataout_rb[8]
load net dataout_rb[9] -attr @rip(#000000) dataout_rb[9] -pin address0_i I0[9] -pin bs0_i I1[9] -pin inst data_in[9] -pin inst3 dataout_rb[9]
load net en0 -pin en0_i O -pin ins1 en
netloc en0 1 10 1 3510 520n
load net eq -pin eq_r_reg D -pin inst5 eq
netloc eq 1 5 1 1860 630n
load net eq_r -pin b0_i__5 I0 -pin b0_i__6 I0 -pin eq_r_reg Q
netloc eq_r 1 6 2 2150 1150 2520
load net flag_write -pin carry_r_reg CE -pin eq_r_reg CE -pin flag_write_i O -pin gt_r_reg CE -pin lt_r_reg CE -pin overflow_r_reg CE -pin zero_r_reg CE
netloc flag_write 1 5 2 1920 810 2310
load net flag_write0 -pin flag_write0_i O -pin flag_write_i I0
netloc flag_write0 1 4 1 1570 90n
load net flag_write1 -pin flag_write0_i I0 -pin flag_write1_i O
netloc flag_write1 1 3 1 NJ 80
load net gt -pin gt_r_reg D -pin inst5 gt
netloc gt 1 5 1 1940 560n
load net gt_r -pin b0_i__7 I0 -pin gt_r_reg Q
netloc gt_r 1 6 1 2210 540n
load net hlt -pin en0_i S -pin ins2 hlt
netloc hlt 1 10 4 NJ 580 NJ 580 NJ 580 4380
load net imm[0] -attr @rip(#000000) imm_out[0] -pin bs0_i I0[0] -pin inst6 imm_out[0]
load net imm[10] -attr @rip(#000000) imm_out[10] -pin bs0_i I0[10] -pin inst6 imm_out[10]
load net imm[11] -attr @rip(#000000) imm_out[11] -pin bs0_i I0[11] -pin inst6 imm_out[11]
load net imm[12] -attr @rip(#000000) imm_out[12] -pin bs0_i I0[12] -pin inst6 imm_out[12]
load net imm[13] -attr @rip(#000000) imm_out[13] -pin bs0_i I0[13] -pin inst6 imm_out[13]
load net imm[14] -attr @rip(#000000) imm_out[14] -pin bs0_i I0[14] -pin inst6 imm_out[14]
load net imm[15] -attr @rip(#000000) imm_out[15] -pin bs0_i I0[15] -pin inst6 imm_out[15]
load net imm[1] -attr @rip(#000000) imm_out[1] -pin bs0_i I0[1] -pin inst6 imm_out[1]
load net imm[2] -attr @rip(#000000) imm_out[2] -pin bs0_i I0[2] -pin inst6 imm_out[2]
load net imm[3] -attr @rip(#000000) imm_out[3] -pin bs0_i I0[3] -pin inst6 imm_out[3]
load net imm[4] -attr @rip(#000000) imm_out[4] -pin bs0_i I0[4] -pin inst6 imm_out[4]
load net imm[5] -attr @rip(#000000) imm_out[5] -pin bs0_i I0[5] -pin inst6 imm_out[5]
load net imm[6] -attr @rip(#000000) imm_out[6] -pin bs0_i I0[6] -pin inst6 imm_out[6]
load net imm[7] -attr @rip(#000000) imm_out[7] -pin bs0_i I0[7] -pin inst6 imm_out[7]
load net imm[8] -attr @rip(#000000) imm_out[8] -pin bs0_i I0[8] -pin inst6 imm_out[8]
load net imm[9] -attr @rip(#000000) imm_out[9] -pin bs0_i I0[9] -pin inst6 imm_out[9]
load net ins_n_12 -attr @rip(#000000) ins_out[3] -pin ins ins_out[3] -pin ins1 address[3] -pin inst3 addr_rb[3] -pin inst6 imm_in[3]
load net ins_n_13 -attr @rip(#000000) ins_out[2] -pin ins ins_out[2] -pin ins1 address[2] -pin inst3 addr_rb[2] -pin inst6 imm_in[2]
load net ins_n_14 -attr @rip(#000000) ins_out[1] -pin ins ins_out[1] -pin ins1 address[1] -pin inst3 addr_rb[1] -pin inst6 imm_in[1]
load net ins_n_15 -attr @rip(#000000) ins_out[0] -pin ins ins_out[0] -pin ins1 address[0] -pin inst3 addr_rb[0] -pin inst6 imm_in[0]
load net ins_n_4 -attr @rip(#000000) ins_out[11] -pin b_i S[3] -pin ins ins_out[11] -pin ins2 mode_bits[3] -pin write_reg_addr_i I1[3]
load net ins_n_5 -attr @rip(#000000) ins_out[10] -pin b_i S[2] -pin ins ins_out[10] -pin ins2 mode_bits[2] -pin write_reg_addr_i I1[2]
load net ins_n_6 -attr @rip(#000000) ins_out[9] -pin b_i S[1] -pin ins ins_out[9] -pin ins2 mode_bits[1] -pin write_reg_addr_i I1[1]
load net ins_n_7 -attr @rip(#000000) ins_out[8] -pin b_i S[0] -pin ins ins_out[8] -pin ins2 mode_bits[0] -pin write_reg_addr_i I1[0]
load net lt -pin inst5 lt -pin lt_r_reg D
netloc lt 1 5 1 1940 670n
load net lt_r -pin b0_i__8 I0 -pin lt_r_reg Q
netloc lt_r 1 6 1 2170 740n
load net mem_out[0] -attr @rip(#000000) data_out[0] -pin datain0_i I0[0] -pin inst data_out[0]
load net mem_out[10] -attr @rip(#000000) data_out[10] -pin datain0_i I0[10] -pin inst data_out[10]
load net mem_out[11] -attr @rip(#000000) data_out[11] -pin datain0_i I0[11] -pin inst data_out[11]
load net mem_out[12] -attr @rip(#000000) data_out[12] -pin datain0_i I0[12] -pin inst data_out[12]
load net mem_out[13] -attr @rip(#000000) data_out[13] -pin datain0_i I0[13] -pin inst data_out[13]
load net mem_out[14] -attr @rip(#000000) data_out[14] -pin datain0_i I0[14] -pin inst data_out[14]
load net mem_out[15] -attr @rip(#000000) data_out[15] -pin datain0_i I0[15] -pin inst data_out[15]
load net mem_out[1] -attr @rip(#000000) data_out[1] -pin datain0_i I0[1] -pin inst data_out[1]
load net mem_out[2] -attr @rip(#000000) data_out[2] -pin datain0_i I0[2] -pin inst data_out[2]
load net mem_out[3] -attr @rip(#000000) data_out[3] -pin datain0_i I0[3] -pin inst data_out[3]
load net mem_out[4] -attr @rip(#000000) data_out[4] -pin datain0_i I0[4] -pin inst data_out[4]
load net mem_out[5] -attr @rip(#000000) data_out[5] -pin datain0_i I0[5] -pin inst data_out[5]
load net mem_out[6] -attr @rip(#000000) data_out[6] -pin datain0_i I0[6] -pin inst data_out[6]
load net mem_out[7] -attr @rip(#000000) data_out[7] -pin datain0_i I0[7] -pin inst data_out[7]
load net mem_out[8] -attr @rip(#000000) data_out[8] -pin datain0_i I0[8] -pin inst data_out[8]
load net mem_out[9] -attr @rip(#000000) data_out[9] -pin datain0_i I0[9] -pin inst data_out[9]
load net mem_read -pin address0_i S -pin ins2 mem_read -pin inst mem_read
netloc mem_read 1 1 13 430 380 780J 220 NJ 220 NJ 220 NJ 220 NJ 220 NJ 220 NJ 220 NJ 220 NJ 220 NJ 220 NJ 220 4440
load net mem_to_reg -pin datain0_i S -pin ins2 mem_to_reg
netloc mem_to_reg 1 3 11 1100 240 NJ 240 NJ 240 NJ 240 NJ 240 NJ 240 NJ 240 NJ 240 NJ 240 NJ 240 4360
load net mem_write -pin ins2 mem_write -pin inst mem_write
netloc mem_write 1 1 13 390 420 NJ 420 1120J 480 NJ 480 1860J 450 NJ 450 2540J 440 NJ 440 NJ 440 NJ 440 NJ 440 4020J 560 4340
load net overflow -pin inst5 overflow -pin overflow_r_reg D
netloc overflow 1 5 2 1880 850 2190J
load net overflow_r -pin b0_i__3 I0 -pin b0_i__4 I0 -pin overflow_r_reg Q
netloc overflow_r 1 7 1 2560 920n
load net p_0_in[0] -attr @rip(#000000) ins_out[12] -pin ins ins_out[12] -pin ins2 opcode[0] -pin write_reg_addr2_i I0[0] -pin write_reg_addr2_i__0 I0[0]
load net p_0_in[1] -attr @rip(#000000) ins_out[13] -pin ins ins_out[13] -pin ins2 opcode[1] -pin write_reg_addr2_i I0[1] -pin write_reg_addr2_i__0 I0[1]
load net p_0_in[2] -attr @rip(#000000) ins_out[14] -pin ins ins_out[14] -pin ins2 opcode[2] -pin write_reg_addr2_i I0[2] -pin write_reg_addr2_i__0 I0[2]
load net p_0_in[3] -attr @rip(#000000) ins_out[15] -pin ins ins_out[15] -pin ins2 opcode[3] -pin write_reg_addr2_i I0[3] -pin write_reg_addr2_i__0 I0[3]
load net p_1_in[0] -attr @rip(#000000) ins_out[4] -pin ins ins_out[4] -pin ins1 address[4] -pin inst3 addr_ra[0] -pin write_reg_addr_i I0[0]
load net p_1_in[1] -attr @rip(#000000) ins_out[5] -pin ins ins_out[5] -pin ins1 address[5] -pin inst3 addr_ra[1] -pin write_reg_addr_i I0[1]
load net p_1_in[2] -attr @rip(#000000) ins_out[6] -pin ins ins_out[6] -pin ins1 address[6] -pin inst3 addr_ra[2] -pin write_reg_addr_i I0[2]
load net p_1_in[3] -attr @rip(#000000) ins_out[7] -pin ins ins_out[7] -pin ins1 address[7] -pin inst3 addr_ra[3] -pin write_reg_addr_i I0[3]
load net pc_out[0] -attr @rip(#000000) out[0] -pin ins pc_out[0] -pin ins1 out[0]
load net pc_out[10] -attr @rip(#000000) out[10] -pin ins pc_out[10] -pin ins1 out[10]
load net pc_out[11] -attr @rip(#000000) out[11] -pin ins pc_out[11] -pin ins1 out[11]
load net pc_out[12] -attr @rip(#000000) out[12] -pin ins pc_out[12] -pin ins1 out[12]
load net pc_out[13] -attr @rip(#000000) out[13] -pin ins pc_out[13] -pin ins1 out[13]
load net pc_out[14] -attr @rip(#000000) out[14] -pin ins pc_out[14] -pin ins1 out[14]
load net pc_out[15] -attr @rip(#000000) out[15] -pin ins pc_out[15] -pin ins1 out[15]
load net pc_out[1] -attr @rip(#000000) out[1] -pin ins pc_out[1] -pin ins1 out[1]
load net pc_out[2] -attr @rip(#000000) out[2] -pin ins pc_out[2] -pin ins1 out[2]
load net pc_out[3] -attr @rip(#000000) out[3] -pin ins pc_out[3] -pin ins1 out[3]
load net pc_out[4] -attr @rip(#000000) out[4] -pin ins pc_out[4] -pin ins1 out[4]
load net pc_out[5] -attr @rip(#000000) out[5] -pin ins pc_out[5] -pin ins1 out[5]
load net pc_out[6] -attr @rip(#000000) out[6] -pin ins pc_out[6] -pin ins1 out[6]
load net pc_out[7] -attr @rip(#000000) out[7] -pin ins pc_out[7] -pin ins1 out[7]
load net pc_out[8] -attr @rip(#000000) out[8] -pin ins pc_out[8] -pin ins1 out[8]
load net pc_out[9] -attr @rip(#000000) out[9] -pin ins pc_out[9] -pin ins1 out[9]
load net reg_write -pin ins2 reg_write -pin inst3 wr
netloc reg_write 1 3 11 1220 260 NJ 260 NJ 260 NJ 260 NJ 260 NJ 260 NJ 260 NJ 260 NJ 260 NJ 260 4400
load net reset -pin carry_r_reg CLR -pin eq_r_reg CLR -pin gt_r_reg CLR -pin ins1 reset -pin inst3 reset -pin lt_r_reg CLR -pin overflow_r_reg CLR -port reset -pin zero_r_reg CLR
netloc reset 1 0 11 NJ 460 NJ 460 NJ 460 1200 500 NJ 500 1980 870N 2230 690N 2540 810 2760J 1010 NJ 1010 3510J
load net write_reg_addr1 -pin write_reg_addr1_i O -pin write_reg_addr_i S
netloc write_reg_addr1 1 2 1 N 580
load net write_reg_addr2 -pin write_reg_addr1_i I0 -pin write_reg_addr2_i O
netloc write_reg_addr2 1 1 1 370J 530n
load net write_reg_addr2_i__0_n_0 -pin write_reg_addr1_i I1 -pin write_reg_addr2_i__0 O
netloc write_reg_addr2_i__0_n_0 1 1 1 430J 590n
load net write_reg_addr[0] -attr @rip(#000000) O[0] -pin inst3 address[0] -pin write_reg_addr_i O[0]
load net write_reg_addr[1] -attr @rip(#000000) O[1] -pin inst3 address[1] -pin write_reg_addr_i O[1]
load net write_reg_addr[2] -attr @rip(#000000) O[2] -pin inst3 address[2] -pin write_reg_addr_i O[2]
load net write_reg_addr[3] -attr @rip(#000000) O[3] -pin inst3 address[3] -pin write_reg_addr_i O[3]
load net zero -pin inst5 zero -pin zero_r_reg D
netloc zero 1 5 2 1900J 630 2270
load net zero_r -pin b0_i I0 -pin b0_i__0 I0 -pin zero_r_reg Q
netloc zero_r 1 7 1 2540 500n
load netBundle @address0 16 address0[15] address0[14] address0[13] address0[12] address0[11] address0[10] address0[9] address0[8] address0[7] address0[6] address0[5] address0[4] address0[3] address0[2] address0[1] address0[0] -autobundled
netbloc @address0 1 1 14 430 200 NJ 200 NJ 200 NJ 200 NJ 200 NJ 200 NJ 200 NJ 200 NJ 200 NJ 200 NJ 200 NJ 200 NJ 200 4710
load netBundle @alu_op_i_n_ 4 alu_op_i_n_0 alu_op_i_n_1 alu_op_i_n_2 alu_op_i_n_3 -autobundled
netbloc @alu_op_i_n_ 1 2 3 780 130 1100 140 1570J
load netBundle @bs0 16 bs0[15] bs0[14] bs0[13] bs0[12] bs0[11] bs0[10] bs0[9] bs0[8] bs0[7] bs0[6] bs0[5] bs0[4] bs0[3] bs0[2] bs0[1] bs0[0] -autobundled
netbloc @bs0 1 4 1 N 670
load netBundle @datain0 16 datain0[15] datain0[14] datain0[13] datain0[12] datain0[11] datain0[10] datain0[9] datain0[8] datain0[7] datain0[6] datain0[5] datain0[4] datain0[3] datain0[2] datain0[1] datain0[0] -autobundled
netbloc @datain0 1 3 1 1120 310n
load netBundle @ins_n_,p_0_in,p_1_in 16 p_0_in[3] p_0_in[2] p_0_in[1] p_0_in[0] ins_n_4 ins_n_5 ins_n_6 ins_n_7 p_1_in[3] p_1_in[2] p_1_in[1] p_1_in[0] ins_n_12 ins_n_13 ins_n_14 ins_n_15 -autobundled
netbloc @ins_n_,p_0_in,p_1_in 1 0 13 20 690 NJ 690 780 600 1140 830 NJ 830 NJ 830 NJ 830 2520J 790 2820J 980N 3230 750 3470 670 NJ 670 4060
load netBundle @pc_out 16 pc_out[15] pc_out[14] pc_out[13] pc_out[12] pc_out[11] pc_out[10] pc_out[9] pc_out[8] pc_out[7] pc_out[6] pc_out[5] pc_out[4] pc_out[3] pc_out[2] pc_out[1] pc_out[0] -autobundled
netbloc @pc_out 1 11 1 NJ 770
load netBundle @alu_op 4 alu_op[3] alu_op[2] alu_op[1] alu_op[0] -autobundled
netbloc @alu_op 1 2 12 NJ 170 NJ 170 1570 280 NJ 280 NJ 280 NJ 280 NJ 280 NJ 280 NJ 280 NJ 280 NJ 280 4380
load netBundle @mem_out 16 mem_out[15] mem_out[14] mem_out[13] mem_out[12] mem_out[11] mem_out[10] mem_out[9] mem_out[8] mem_out[7] mem_out[6] mem_out[5] mem_out[4] mem_out[3] mem_out[2] mem_out[1] mem_out[0] -autobundled
netbloc @mem_out 1 2 1 N 300
load netBundle @dataout_ra 16 dataout_ra[15] dataout_ra[14] dataout_ra[13] dataout_ra[12] dataout_ra[11] dataout_ra[10] dataout_ra[9] dataout_ra[8] dataout_ra[7] dataout_ra[6] dataout_ra[5] dataout_ra[4] dataout_ra[3] dataout_ra[2] dataout_ra[1] dataout_ra[0] -autobundled
netbloc @dataout_ra 1 4 10 1550 1030 NJ 1030 NJ 1030 NJ 1030 NJ 1030 NJ 1030 NJ 1030 NJ 1030 NJ 1030 4460
load netBundle @dataout_rb 16 dataout_rb[15] dataout_rb[14] dataout_rb[13] dataout_rb[12] dataout_rb[11] dataout_rb[10] dataout_rb[9] dataout_rb[8] dataout_rb[7] dataout_rb[6] dataout_rb[5] dataout_rb[4] dataout_rb[3] dataout_rb[2] dataout_rb[1] dataout_rb[0] -autobundled
netbloc @dataout_rb 1 1 13 410 400 NJ 400 1100 540 1530 420 NJ 420 NJ 420 NJ 420 NJ 420 NJ 420 NJ 420 NJ 420 4040J 540 NJ
load netBundle @alu_out 16 alu_out[15] alu_out[14] alu_out[13] alu_out[12] alu_out[11] alu_out[10] alu_out[9] alu_out[8] alu_out[7] alu_out[6] alu_out[5] alu_out[4] alu_out[3] alu_out[2] alu_out[1] alu_out[0] -autobundled
netbloc @alu_out 1 2 4 800 770 NJ 770 NJ 770 1840
load netBundle @imm 16 imm[15] imm[14] imm[13] imm[12] imm[11] imm[10] imm[9] imm[8] imm[7] imm[6] imm[5] imm[4] imm[3] imm[2] imm[1] imm[0] -autobundled
netbloc @imm 1 3 1 NJ 660
load netBundle @write_reg_addr 4 write_reg_addr[3] write_reg_addr[2] write_reg_addr[1] write_reg_addr[0] -autobundled
netbloc @write_reg_addr 1 3 1 1160 360n
levelinfo -pg 1 0 190 610 930 1350 1690 2030 2360 2650 3110 3350 3640 3860 4180 4590 4730
pagesize -pg 1 -db -bbox -sgen -80 0 4730 1460
show
zoom 0.431589
scrollpos -126 -239
#
# initialize ictrl to current module final_CPU work:final_CPU:NOFILE
ictrl init topinfo |
