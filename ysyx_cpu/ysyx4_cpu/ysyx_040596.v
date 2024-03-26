module ysyx_040596_IFetch(
  input         reset,
  input         io_jump_en,
  input  [63:0] io_jump_pc,
  input  [63:0] io_pc,
  output [63:0] io_next_pc,
  output        io_valid
);
  wire [63:0] _io_next_pc_T_1 = io_pc + 64'h4; // @[IFetch.scala 13:51]
  assign io_next_pc = io_jump_en ? io_jump_pc : _io_next_pc_T_1; // @[IFetch.scala 13:20]
  assign io_valid = ~reset; // @[IFetch.scala 14:17]
endmodule
module ysyx_040596_Decode(
  input  [63:0] io_pc,
  input  [31:0] io_inst,
  output        io_rs1_en,
  output        io_rs2_en,
  output [4:0]  io_rs1_addr,
  output [4:0]  io_rs2_addr,
  input  [63:0] io_rs1_data,
  input  [63:0] io_rs2_data,
  output        io_rd_en,
  output [4:0]  io_rd_addr,
  output [6:0]  io_decode_info_fu_code,
  output [15:0] io_decode_info_alu_code,
  output [7:0]  io_decode_info_bu_code,
  output [6:0]  io_decode_info_lu_code,
  output [3:0]  io_decode_info_su_code,
  output [1:0]  io_decode_info_mu_code,
  output [7:0]  io_decode_info_du_code,
  output [7:0]  io_decode_info_csru_code,
  output        io_jump_en,
  output [63:0] io_jump_pc,
  output [63:0] io_op1,
  output [63:0] io_op2,
  output [63:0] io_imm,
  input  [63:0] io_mtvec,
  input  [63:0] io_mepc,
  input         io_intr
);
  wire [31:0] _sll_T = io_inst & 32'hfe00707f; // @[Decode.scala 58:20]
  wire  sll = 32'h1033 == _sll_T; // @[Decode.scala 58:20]
  wire  srl = 32'h5033 == _sll_T; // @[Decode.scala 59:20]
  wire  sra = 32'h40005033 == _sll_T; // @[Decode.scala 60:20]
  wire [31:0] _slli_T = io_inst & 32'hfc00707f; // @[Decode.scala 61:21]
  wire  slli = 32'h1013 == _slli_T; // @[Decode.scala 61:21]
  wire  srli = 32'h5013 == _slli_T; // @[Decode.scala 62:21]
  wire  srai = 32'h40005013 == _slli_T; // @[Decode.scala 63:21]
  wire  sllw = 32'h103b == _sll_T; // @[Decode.scala 64:21]
  wire  srlw = 32'h503b == _sll_T; // @[Decode.scala 65:21]
  wire  sraw = 32'h4000503b == _sll_T; // @[Decode.scala 66:21]
  wire  slliw = 32'h101b == _sll_T; // @[Decode.scala 67:22]
  wire  srliw = 32'h501b == _sll_T; // @[Decode.scala 68:22]
  wire  sraiw = 32'h4000501b == _sll_T; // @[Decode.scala 69:22]
  wire  add = 32'h33 == _sll_T; // @[Decode.scala 71:24]
  wire  addw = 32'h3b == _sll_T; // @[Decode.scala 72:24]
  wire [31:0] _addi_T = io_inst & 32'h707f; // @[Decode.scala 73:24]
  wire  addi = 32'h13 == _addi_T; // @[Decode.scala 73:24]
  wire  addiw = 32'h1b == _addi_T; // @[Decode.scala 74:24]
  wire  alu_sub = 32'h40000033 == _sll_T; // @[Decode.scala 75:24]
  wire  alu_subw = 32'h4000003b == _sll_T; // @[Decode.scala 76:24]
  wire [31:0] _lui_T = io_inst & 32'h7f; // @[Decode.scala 77:24]
  wire  lui = 32'h37 == _lui_T; // @[Decode.scala 77:24]
  wire  alu_auipc = 32'h17 == _lui_T; // @[Decode.scala 78:24]
  wire  xor_ = 32'h4033 == _sll_T; // @[Decode.scala 80:24]
  wire  or_ = 32'h6033 == _sll_T; // @[Decode.scala 81:24]
  wire  and_ = 32'h7033 == _sll_T; // @[Decode.scala 82:24]
  wire  xori = 32'h4013 == _addi_T; // @[Decode.scala 83:24]
  wire  ori = 32'h6013 == _addi_T; // @[Decode.scala 84:24]
  wire  andi = 32'h7013 == _addi_T; // @[Decode.scala 85:24]
  wire  slt = 32'h2033 == _sll_T; // @[Decode.scala 87:24]
  wire  sltu = 32'h3033 == _sll_T; // @[Decode.scala 88:24]
  wire  slti = 32'h2013 == _addi_T; // @[Decode.scala 89:24]
  wire  sltiu = 32'h3013 == _addi_T; // @[Decode.scala 90:24]
  wire  beq = 32'h63 == _addi_T; // @[Decode.scala 92:24]
  wire  bne = 32'h1063 == _addi_T; // @[Decode.scala 93:24]
  wire  blt = 32'h4063 == _addi_T; // @[Decode.scala 94:24]
  wire  bge = 32'h5063 == _addi_T; // @[Decode.scala 95:24]
  wire  bltu = 32'h6063 == _addi_T; // @[Decode.scala 96:24]
  wire  bgeu = 32'h7063 == _addi_T; // @[Decode.scala 97:24]
  wire  jal = 32'h6f == _lui_T; // @[Decode.scala 99:24]
  wire  jalr = 32'h67 == _addi_T; // @[Decode.scala 100:24]
  wire  lb = 32'h3 == _addi_T; // @[Decode.scala 102:24]
  wire  lh = 32'h1003 == _addi_T; // @[Decode.scala 103:24]
  wire  lw = 32'h2003 == _addi_T; // @[Decode.scala 104:24]
  wire  ld = 32'h3003 == _addi_T; // @[Decode.scala 105:24]
  wire  lbu = 32'h4003 == _addi_T; // @[Decode.scala 106:24]
  wire  lhu = 32'h5003 == _addi_T; // @[Decode.scala 107:24]
  wire  lwu = 32'h6003 == _addi_T; // @[Decode.scala 108:24]
  wire  sb = 32'h23 == _addi_T; // @[Decode.scala 110:24]
  wire  sh = 32'h1023 == _addi_T; // @[Decode.scala 111:24]
  wire  sw = 32'h2023 == _addi_T; // @[Decode.scala 112:24]
  wire  sd = 32'h3023 == _addi_T; // @[Decode.scala 113:24]
  wire  mul = 32'h2000033 == _sll_T; // @[Decode.scala 115:24]
  wire  mulw = 32'h200003b == _sll_T; // @[Decode.scala 116:24]
  wire  div = 32'h2004033 == _sll_T; // @[Decode.scala 117:24]
  wire  divw = 32'h200403b == _sll_T; // @[Decode.scala 118:24]
  wire  divu = 32'h2005033 == _sll_T; // @[Decode.scala 119:24]
  wire  divuw = 32'h200503b == _sll_T; // @[Decode.scala 120:24]
  wire  rem = 32'h2006033 == _sll_T; // @[Decode.scala 121:24]
  wire  remw = 32'h200603b == _sll_T; // @[Decode.scala 122:24]
  wire  remu = 32'h2007033 == _sll_T; // @[Decode.scala 123:24]
  wire  remuw = 32'h200703b == _sll_T; // @[Decode.scala 124:24]
  wire  ecall = 32'h73 == io_inst; // @[Decode.scala 126:24]
  wire  mret = 32'h30200073 == io_inst; // @[Decode.scala 127:24]
  wire  csrrs = 32'h2073 == _addi_T; // @[Decode.scala 128:24]
  wire  csrrw = 32'h1073 == _addi_T; // @[Decode.scala 129:24]
  wire  csrrc = 32'h3073 == _addi_T; // @[Decode.scala 130:24]
  wire  csrrsi = 32'h6073 == _addi_T; // @[Decode.scala 131:24]
  wire  csrrwi = 32'h5073 == _addi_T; // @[Decode.scala 132:24]
  wire  csrrci = 32'h7073 == _addi_T; // @[Decode.scala 133:24]
  wire  alu_add = add | addi | lui; // @[Decode.scala 141:33]
  wire  alu_addw = addw | addiw; // @[Decode.scala 142:26]
  wire  alu_sll = sll | slli; // @[Decode.scala 147:26]
  wire  alu_srl = srl | srli; // @[Decode.scala 148:26]
  wire  alu_sra = sra | srai; // @[Decode.scala 149:26]
  wire  alu_sllw = sllw | slliw; // @[Decode.scala 150:26]
  wire  alu_srlw = srlw | srliw; // @[Decode.scala 151:26]
  wire  alu_sraw = sraw | sraiw; // @[Decode.scala 152:26]
  wire  alu_xor = xor_ | xori; // @[Decode.scala 154:26]
  wire  alu_or = or_ | ori; // @[Decode.scala 155:26]
  wire  alu_and = and_ | andi; // @[Decode.scala 156:26]
  wire  alu_slt = slt | slti; // @[Decode.scala 158:26]
  wire  alu_sltu = sltu | sltiu; // @[Decode.scala 159:26]
  wire [7:0] alu_code_lo = {alu_sra,alu_srl,alu_sll,alu_auipc,alu_subw,alu_sub,alu_addw,alu_add}; // @[Cat.scala 30:58]
  wire [7:0] alu_code_hi = {alu_sltu,alu_slt,alu_and,alu_or,alu_xor,alu_sraw,alu_srlw,alu_sllw}; // @[Cat.scala 30:58]
  wire [15:0] alu_code = {alu_sltu,alu_slt,alu_and,alu_or,alu_xor,alu_sraw,alu_srlw,alu_sllw,alu_code_lo}; // @[Cat.scala 30:58]
  wire  alu_en = alu_code != 16'h0; // @[Decode.scala 162:29]
  wire [3:0] bu_code_lo = {bge,blt,bne,beq}; // @[Cat.scala 30:58]
  wire [3:0] bu_code_hi = {jalr,jal,bgeu,bltu}; // @[Cat.scala 30:58]
  wire [7:0] bu_code = {jalr,jal,bgeu,bltu,bge,blt,bne,beq}; // @[Cat.scala 30:58]
  wire  bu_en = bu_code != 8'h0; // @[Decode.scala 165:27]
  wire [2:0] lu_code_lo = {lw,lh,lb}; // @[Cat.scala 30:58]
  wire [3:0] lu_code_hi = {lwu,lhu,lbu,ld}; // @[Cat.scala 30:58]
  wire [6:0] lu_code = {lwu,lhu,lbu,ld,lw,lh,lb}; // @[Cat.scala 30:58]
  wire  lu_en = lu_code != 7'h0; // @[Decode.scala 168:27]
  wire [1:0] su_code_lo = {sh,sb}; // @[Cat.scala 30:58]
  wire [1:0] su_code_hi = {sd,sw}; // @[Cat.scala 30:58]
  wire [3:0] su_code = {sd,sw,sh,sb}; // @[Cat.scala 30:58]
  wire  su_en = su_code != 4'h0; // @[Decode.scala 171:27]
  wire [1:0] mu_code = {mulw,mul}; // @[Cat.scala 30:58]
  wire  mu_en = mu_code != 2'h0; // @[Decode.scala 174:27]
  wire [3:0] du_code_lo = {divuw,divu,divw,div}; // @[Cat.scala 30:58]
  wire [3:0] du_code_hi = {remuw,remu,remw,rem}; // @[Cat.scala 30:58]
  wire [7:0] du_code = {remuw,remu,remw,rem,divuw,divu,divw,div}; // @[Cat.scala 30:58]
  wire  du_en = du_code != 8'h0; // @[Decode.scala 177:27]
  wire [3:0] csru_code_lo = {csrrw,csrrs,mret,ecall}; // @[Cat.scala 30:58]
  wire [3:0] csru_code_hi = {csrrci,csrrwi,csrrsi,csrrc}; // @[Cat.scala 30:58]
  wire [7:0] csru_code = {csrrci,csrrwi,csrrsi,csrrc,csrrw,csrrs,mret,ecall}; // @[Cat.scala 30:58]
  wire  csr_en = csru_code != 8'h0; // @[Decode.scala 180:31]
  wire [2:0] fu_code_lo = {lu_en,bu_en,alu_en}; // @[Cat.scala 30:58]
  wire [3:0] fu_code_hi = {csr_en,du_en,mu_en,su_en}; // @[Cat.scala 30:58]
  wire  _type_r_T_5 = sll | srl | sra | sllw | srlw | sraw | add; // @[Decode.scala 185:74]
  wire  _type_r_T_9 = _type_r_T_5 | addw | alu_sub | alu_subw | xor_; // @[Decode.scala 186:54]
  wire  _type_r_T_12 = _type_r_T_9 | or_ | and_ | slt; // @[Decode.scala 187:45]
  wire  _type_r_T_14 = _type_r_T_12 | sltu | mul; // @[Decode.scala 188:36]
  wire  _type_r_T_16 = _type_r_T_14 | mulw | div; // @[Decode.scala 189:36]
  wire  _type_r_T_20 = _type_r_T_16 | divw | divu | divuw | rem; // @[Decode.scala 190:54]
  wire  type_r = _type_r_T_20 | remw | remu | remuw | mret; // @[Decode.scala 191:54]
  wire  _type_i_T_5 = slli | srli | srai | slliw | srliw | sraiw | addi; // @[Decode.scala 193:74]
  wire  _type_i_T_7 = _type_i_T_5 | addiw | xori; // @[Decode.scala 194:36]
  wire  _type_i_T_10 = _type_i_T_7 | ori | andi | slti; // @[Decode.scala 195:45]
  wire  _type_i_T_12 = _type_i_T_10 | sltiu | jalr; // @[Decode.scala 196:36]
  wire  _type_i_T_13 = _type_i_T_12 | lb; // @[Decode.scala 197:27]
  wire  _type_i_T_20 = _type_i_T_13 | lh | lw | ld | lbu | lhu | lwu | ecall; // @[Decode.scala 198:81]
  wire  type_i = _type_i_T_20 | csrrs | csrrw | csrrc | csrrwi | csrrci | csrrsi; // @[Decode.scala 199:74]
  wire  type_s = sb | sh | sw | sd; // @[Decode.scala 200:45]
  wire  type_b = beq | bne | blt | bge | bltu | bgeu; // @[Decode.scala 201:64]
  wire  type_u = lui | alu_auipc; // @[Decode.scala 202:27]
  wire [5:0] inst_type = {type_r,type_i,type_s,type_b,type_u,jal}; // @[Cat.scala 30:58]
  wire [51:0] imm_i_hi = io_inst[31] ? 52'hfffffffffffff : 52'h0; // @[Bitwise.scala 72:12]
  wire [11:0] imm_i_lo = io_inst[31:20]; // @[Decode.scala 208:45]
  wire [63:0] imm_i = {imm_i_hi,imm_i_lo}; // @[Cat.scala 30:58]
  wire [6:0] imm_s_hi_lo = io_inst[31:25]; // @[Decode.scala 209:45]
  wire [4:0] imm_s_lo = io_inst[11:7]; // @[Decode.scala 209:59]
  wire [63:0] imm_s = {imm_i_hi,imm_s_hi_lo,imm_s_lo}; // @[Cat.scala 30:58]
  wire [50:0] imm_b_hi_hi_hi = io_inst[31] ? 51'h7ffffffffffff : 51'h0; // @[Bitwise.scala 72:12]
  wire  imm_b_hi_lo = io_inst[7]; // @[Decode.scala 210:55]
  wire [5:0] imm_b_lo_hi_hi = io_inst[30:25]; // @[Decode.scala 210:64]
  wire [3:0] imm_b_lo_hi_lo = io_inst[11:8]; // @[Decode.scala 210:78]
  wire [63:0] imm_b = {imm_b_hi_hi_hi,io_inst[31],imm_b_hi_lo,imm_b_lo_hi_hi,imm_b_lo_hi_lo,1'h0}; // @[Cat.scala 30:58]
  wire [31:0] imm_u_hi_hi = io_inst[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [19:0] imm_u_hi_lo = io_inst[31:12]; // @[Decode.scala 211:45]
  wire [63:0] imm_u = {imm_u_hi_hi,imm_u_hi_lo,12'h0}; // @[Cat.scala 30:58]
  wire [42:0] imm_j_hi_hi_hi = io_inst[31] ? 43'h7ffffffffff : 43'h0; // @[Bitwise.scala 72:12]
  wire [7:0] imm_j_hi_lo = io_inst[19:12]; // @[Decode.scala 212:55]
  wire  imm_j_lo_hi_hi = io_inst[20]; // @[Decode.scala 212:69]
  wire [9:0] imm_j_lo_hi_lo = io_inst[30:21]; // @[Decode.scala 212:79]
  wire [63:0] imm_j = {imm_j_hi_hi_hi,io_inst[31],imm_j_hi_lo,imm_j_lo_hi_hi,imm_j_lo_hi_lo,1'h0}; // @[Cat.scala 30:58]
  wire [63:0] _imm_T_3 = 6'h10 == inst_type ? imm_i : 64'h0; // @[Mux.scala 80:57]
  wire [63:0] _imm_T_5 = 6'h8 == inst_type ? imm_s : _imm_T_3; // @[Mux.scala 80:57]
  wire [63:0] _imm_T_7 = 6'h4 == inst_type ? imm_b : _imm_T_5; // @[Mux.scala 80:57]
  wire [63:0] _imm_T_9 = 6'h2 == inst_type ? imm_u : _imm_T_7; // @[Mux.scala 80:57]
  wire [63:0] imm = 6'h1 == inst_type ? imm_j : _imm_T_9; // @[Mux.scala 80:57]
  wire  _io_rs1_en_T = type_r | type_i; // @[Decode.scala 236:25]
  wire [63:0] _bu_jump_pc_T_2 = io_op1 + io_op2; // @[Decode.scala 248:59]
  wire [63:0] _bu_jump_pc_T_3 = _bu_jump_pc_T_2 & 64'hfffffffffffffffe; // @[Decode.scala 248:66]
  wire [63:0] _bu_jump_pc_T_5 = io_pc + imm; // @[Decode.scala 248:95]
  wire [63:0] bu_jump_pc = bu_code == 8'h80 ? _bu_jump_pc_T_3 : _bu_jump_pc_T_5; // @[Decode.scala 248:25]
  wire  _bu_jump_en_T = io_op1 == io_op2; // @[Decode.scala 250:31]
  wire  _bu_jump_en_T_1 = io_op1 != io_op2; // @[Decode.scala 251:31]
  wire  _bu_jump_en_T_4 = $signed(io_op1) < $signed(io_op2); // @[Decode.scala 252:41]
  wire  _bu_jump_en_T_7 = $signed(io_op1) >= $signed(io_op2); // @[Decode.scala 253:41]
  wire  _bu_jump_en_T_8 = io_op1 < io_op2; // @[Decode.scala 254:32]
  wire  _bu_jump_en_T_9 = io_op1 >= io_op2; // @[Decode.scala 255:32]
  wire  _bu_jump_en_T_13 = 8'h2 == bu_code ? _bu_jump_en_T_1 : 8'h1 == bu_code & _bu_jump_en_T; // @[Mux.scala 80:57]
  wire  _bu_jump_en_T_15 = 8'h4 == bu_code ? _bu_jump_en_T_4 : _bu_jump_en_T_13; // @[Mux.scala 80:57]
  wire  _bu_jump_en_T_17 = 8'h8 == bu_code ? _bu_jump_en_T_7 : _bu_jump_en_T_15; // @[Mux.scala 80:57]
  wire  _bu_jump_en_T_19 = 8'h10 == bu_code ? _bu_jump_en_T_8 : _bu_jump_en_T_17; // @[Mux.scala 80:57]
  wire  _bu_jump_en_T_21 = 8'h20 == bu_code ? _bu_jump_en_T_9 : _bu_jump_en_T_19; // @[Mux.scala 80:57]
  wire  bu_jump_en = 8'h80 == bu_code | (8'h40 == bu_code | _bu_jump_en_T_21); // @[Mux.scala 80:57]
  wire [63:0] _csru_jump_pc_T_1 = 8'h1 == csru_code ? io_mtvec : 64'h0; // @[Mux.scala 80:57]
  wire [63:0] csru_jump_pc = 8'h2 == csru_code ? io_mepc : _csru_jump_pc_T_1; // @[Mux.scala 80:57]
  wire  csru_jump_en = 8'h2 == csru_code | 8'h1 == csru_code; // @[Mux.scala 80:57]
  wire [63:0] _GEN_1 = csru_jump_en ? csru_jump_pc : 64'h0; // @[Decode.scala 279:28 Decode.scala 281:20 Decode.scala 285:20]
  wire  _GEN_2 = bu_jump_en | csru_jump_en; // @[Decode.scala 275:26 Decode.scala 276:20]
  wire [63:0] _GEN_3 = bu_jump_en ? bu_jump_pc : _GEN_1; // @[Decode.scala 275:26 Decode.scala 277:20]
  assign io_rs1_en = type_r | type_i | type_s | type_b; // @[Decode.scala 236:45]
  assign io_rs2_en = type_r | type_s | type_b; // @[Decode.scala 237:35]
  assign io_rs1_addr = io_inst[19:15]; // @[Decode.scala 232:24]
  assign io_rs2_addr = io_inst[24:20]; // @[Decode.scala 233:24]
  assign io_rd_en = _io_rs1_en_T | type_u | jal; // @[Decode.scala 238:45]
  assign io_rd_addr = io_inst[11:7]; // @[Decode.scala 234:24]
  assign io_decode_info_fu_code = {fu_code_hi,fu_code_lo}; // @[Cat.scala 30:58]
  assign io_decode_info_alu_code = {alu_code_hi,alu_code_lo}; // @[Cat.scala 30:58]
  assign io_decode_info_bu_code = {bu_code_hi,bu_code_lo}; // @[Cat.scala 30:58]
  assign io_decode_info_lu_code = {lu_code_hi,lu_code_lo}; // @[Cat.scala 30:58]
  assign io_decode_info_su_code = {su_code_hi,su_code_lo}; // @[Cat.scala 30:58]
  assign io_decode_info_mu_code = {mulw,mul}; // @[Cat.scala 30:58]
  assign io_decode_info_du_code = {du_code_hi,du_code_lo}; // @[Cat.scala 30:58]
  assign io_decode_info_csru_code = {csru_code_hi,csru_code_lo}; // @[Cat.scala 30:58]
  assign io_jump_en = io_intr | _GEN_2; // @[Decode.scala 271:18 Decode.scala 272:20]
  assign io_jump_pc = io_intr ? io_mtvec : _GEN_3; // @[Decode.scala 271:18 Decode.scala 273:20]
  assign io_op1 = io_rs1_en ? io_rs1_data : 64'h0; // @[Decode.scala 240:18]
  assign io_op2 = io_rs2_en ? io_rs2_data : imm; // @[Decode.scala 241:18]
  assign io_imm = 6'h1 == inst_type ? imm_j : _imm_T_9; // @[Mux.scala 80:57]
endmodule
module ysyx_040596_Execution(
  input  [15:0] io_alu_code,
  input  [7:0]  io_bu_code,
  input  [7:0]  io_csru_code,
  input  [63:0] io_op1,
  input  [63:0] io_op2,
  input  [63:0] io_pc,
  output [63:0] io_alu_out,
  output [63:0] io_bu_out,
  output [63:0] io_csru_out,
  input  [4:0]  io_rs1_addr,
  output [11:0] io_csr_raddr,
  input  [63:0] io_csr_rdata,
  output        io_csr_wen,
  output [11:0] io_csr_waddr,
  output [63:0] io_csr_wdata
);
  wire [63:0] _alu_out_T_1 = io_op1 + io_op2; // @[Execution.scala 55:39]
  wire [31:0] alu_out_hi = _alu_out_T_1[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] alu_out_lo = _alu_out_T_1[31:0]; // @[Execution.scala 45:41]
  wire [63:0] _alu_out_T_6 = {alu_out_hi,alu_out_lo}; // @[Cat.scala 30:58]
  wire [63:0] _alu_out_T_8 = io_op1 - io_op2; // @[Execution.scala 57:39]
  wire [31:0] alu_out_hi_1 = _alu_out_T_8[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] alu_out_lo_1 = _alu_out_T_8[31:0]; // @[Execution.scala 45:41]
  wire [63:0] _alu_out_T_13 = {alu_out_hi_1,alu_out_lo_1}; // @[Cat.scala 30:58]
  wire [63:0] _alu_out_T_15 = io_op2 + io_pc; // @[Execution.scala 59:39]
  wire [126:0] _GEN_0 = {{63'd0}, io_op1}; // @[Execution.scala 60:39]
  wire [126:0] _alu_out_T_17 = _GEN_0 << io_op2[5:0]; // @[Execution.scala 60:39]
  wire [63:0] _alu_out_T_20 = io_op1 >> io_op2[5:0]; // @[Execution.scala 61:39]
  wire [63:0] _alu_out_T_24 = $signed(io_op1) >>> io_op2[5:0]; // @[Execution.scala 62:68]
  wire [62:0] _GEN_1 = {{31'd0}, io_op1[31:0]}; // @[Execution.scala 63:51]
  wire [62:0] _alu_out_T_27 = _GEN_1 << io_op2[4:0]; // @[Execution.scala 63:51]
  wire [31:0] alu_out_hi_2 = _alu_out_T_27[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] alu_out_lo_2 = _alu_out_T_27[31:0]; // @[Execution.scala 45:41]
  wire [63:0] _alu_out_T_30 = {alu_out_hi_2,alu_out_lo_2}; // @[Cat.scala 30:58]
  wire [31:0] alu_out_lo_3 = io_op1[31:0] >> io_op2[4:0]; // @[Execution.scala 64:51]
  wire [31:0] alu_out_hi_3 = alu_out_lo_3[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _alu_out_T_36 = {alu_out_hi_3,alu_out_lo_3}; // @[Cat.scala 30:58]
  wire [31:0] _alu_out_T_38 = io_op1[31:0]; // @[Execution.scala 65:57]
  wire [31:0] alu_out_lo_4 = $signed(_alu_out_T_38) >>> io_op2[4:0]; // @[Execution.scala 65:80]
  wire [31:0] alu_out_hi_4 = alu_out_lo_4[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _alu_out_T_44 = {alu_out_hi_4,alu_out_lo_4}; // @[Cat.scala 30:58]
  wire [63:0] _alu_out_T_45 = io_op1 ^ io_op2; // @[Execution.scala 66:39]
  wire [63:0] _alu_out_T_46 = io_op1 | io_op2; // @[Execution.scala 67:39]
  wire [63:0] _alu_out_T_47 = io_op1 & io_op2; // @[Execution.scala 68:39]
  wire  _alu_out_T_50 = $signed(io_op1) < $signed(io_op2); // @[Execution.scala 69:48]
  wire  _alu_out_T_51 = io_op1 < io_op2; // @[Execution.scala 70:39]
  wire [63:0] _alu_out_T_53 = 16'h1 == io_alu_code ? _alu_out_T_1 : 64'h0; // @[Mux.scala 80:57]
  wire [63:0] _alu_out_T_55 = 16'h2 == io_alu_code ? _alu_out_T_6 : _alu_out_T_53; // @[Mux.scala 80:57]
  wire [63:0] _alu_out_T_57 = 16'h4 == io_alu_code ? _alu_out_T_8 : _alu_out_T_55; // @[Mux.scala 80:57]
  wire [63:0] _alu_out_T_59 = 16'h8 == io_alu_code ? _alu_out_T_13 : _alu_out_T_57; // @[Mux.scala 80:57]
  wire [63:0] _alu_out_T_61 = 16'h10 == io_alu_code ? _alu_out_T_15 : _alu_out_T_59; // @[Mux.scala 80:57]
  wire [63:0] _alu_out_T_63 = 16'h20 == io_alu_code ? _alu_out_T_17[63:0] : _alu_out_T_61; // @[Mux.scala 80:57]
  wire [63:0] _alu_out_T_65 = 16'h40 == io_alu_code ? _alu_out_T_20 : _alu_out_T_63; // @[Mux.scala 80:57]
  wire [63:0] _alu_out_T_67 = 16'h80 == io_alu_code ? _alu_out_T_24 : _alu_out_T_65; // @[Mux.scala 80:57]
  wire [63:0] _alu_out_T_69 = 16'h100 == io_alu_code ? _alu_out_T_30 : _alu_out_T_67; // @[Mux.scala 80:57]
  wire [63:0] _alu_out_T_71 = 16'h200 == io_alu_code ? _alu_out_T_36 : _alu_out_T_69; // @[Mux.scala 80:57]
  wire [63:0] _alu_out_T_73 = 16'h400 == io_alu_code ? _alu_out_T_44 : _alu_out_T_71; // @[Mux.scala 80:57]
  wire [63:0] _alu_out_T_75 = 16'h800 == io_alu_code ? _alu_out_T_45 : _alu_out_T_73; // @[Mux.scala 80:57]
  wire [63:0] _alu_out_T_77 = 16'h1000 == io_alu_code ? _alu_out_T_46 : _alu_out_T_75; // @[Mux.scala 80:57]
  wire [63:0] _alu_out_T_79 = 16'h2000 == io_alu_code ? _alu_out_T_47 : _alu_out_T_77; // @[Mux.scala 80:57]
  wire [63:0] _alu_out_T_81 = 16'h4000 == io_alu_code ? {{63'd0}, _alu_out_T_50} : _alu_out_T_79; // @[Mux.scala 80:57]
  wire [63:0] _bu_out_T_4 = io_pc + 64'h4; // @[Execution.scala 74:81]
  wire [63:0] _csru_out_T_1 = 8'h4 == io_csru_code ? io_csr_rdata : 64'h0; // @[Mux.scala 80:57]
  wire [63:0] _csru_out_T_3 = 8'h8 == io_csru_code ? io_csr_rdata : _csru_out_T_1; // @[Mux.scala 80:57]
  wire [63:0] _csru_out_T_5 = 8'h10 == io_csru_code ? io_csr_rdata : _csru_out_T_3; // @[Mux.scala 80:57]
  wire [63:0] _csru_out_T_7 = 8'h20 == io_csru_code ? io_csr_rdata : _csru_out_T_5; // @[Mux.scala 80:57]
  wire [63:0] _csru_out_T_9 = 8'h40 == io_csru_code ? io_csr_rdata : _csru_out_T_7; // @[Mux.scala 80:57]
  wire [63:0] _csr_waddr_T_1 = 8'h4 == io_csru_code ? io_op2 : 64'h0; // @[Mux.scala 80:57]
  wire [63:0] _csr_waddr_T_3 = 8'h8 == io_csru_code ? io_op2 : _csr_waddr_T_1; // @[Mux.scala 80:57]
  wire [63:0] _csr_waddr_T_5 = 8'h10 == io_csru_code ? io_op2 : _csr_waddr_T_3; // @[Mux.scala 80:57]
  wire [63:0] _csr_waddr_T_7 = 8'h20 == io_csru_code ? io_op2 : _csr_waddr_T_5; // @[Mux.scala 80:57]
  wire [63:0] _csr_waddr_T_9 = 8'h40 == io_csru_code ? io_op2 : _csr_waddr_T_7; // @[Mux.scala 80:57]
  wire [63:0] csr_waddr = 8'h80 == io_csru_code ? io_op2 : _csr_waddr_T_9; // @[Mux.scala 80:57]
  wire [63:0] _csr_wdata_T = io_csr_rdata | io_op1; // @[Execution.scala 103:40]
  wire [63:0] _csr_wdata_T_1 = ~io_op1; // @[Execution.scala 105:43]
  wire [63:0] _csr_wdata_T_2 = io_csr_rdata & _csr_wdata_T_1; // @[Execution.scala 105:40]
  wire [63:0] _csr_wdata_T_3 = {59'h0,io_rs1_addr}; // @[Cat.scala 30:58]
  wire [63:0] _csr_wdata_T_4 = io_csr_rdata | _csr_wdata_T_3; // @[Execution.scala 106:40]
  wire [63:0] _csr_wdata_T_7 = ~_csr_wdata_T_3; // @[Execution.scala 108:43]
  wire [63:0] _csr_wdata_T_8 = io_csr_rdata & _csr_wdata_T_7; // @[Execution.scala 108:40]
  wire [63:0] _csr_wdata_T_10 = 8'h4 == io_csru_code ? _csr_wdata_T : 64'h0; // @[Mux.scala 80:57]
  wire [63:0] _csr_wdata_T_12 = 8'h8 == io_csru_code ? io_op1 : _csr_wdata_T_10; // @[Mux.scala 80:57]
  wire [63:0] _csr_wdata_T_14 = 8'h10 == io_csru_code ? _csr_wdata_T_2 : _csr_wdata_T_12; // @[Mux.scala 80:57]
  wire [63:0] _csr_wdata_T_16 = 8'h20 == io_csru_code ? _csr_wdata_T_4 : _csr_wdata_T_14; // @[Mux.scala 80:57]
  wire [63:0] _csr_wdata_T_18 = 8'h40 == io_csru_code ? _csr_wdata_T_3 : _csr_wdata_T_16; // @[Mux.scala 80:57]
  assign io_alu_out = 16'h8000 == io_alu_code ? {{63'd0}, _alu_out_T_51} : _alu_out_T_81; // @[Mux.scala 80:57]
  assign io_bu_out = io_bu_code == 8'h80 | io_bu_code == 8'h40 ? _bu_out_T_4 : 64'h0; // @[Execution.scala 74:21]
  assign io_csru_out = 8'h80 == io_csru_code ? io_csr_rdata : _csru_out_T_9; // @[Mux.scala 80:57]
  assign io_csr_raddr = io_op2[11:0]; // @[Execution.scala 77:18]
  assign io_csr_wen = 8'h80 == io_csru_code | (8'h40 == io_csru_code | (8'h20 == io_csru_code | (8'h10 == io_csru_code
     | (8'h8 == io_csru_code | 8'h4 == io_csru_code)))); // @[Mux.scala 80:57]
  assign io_csr_waddr = csr_waddr[11:0]; // @[Execution.scala 118:21]
  assign io_csr_wdata = 8'h80 == io_csru_code ? _csr_wdata_T_8 : _csr_wdata_T_18; // @[Mux.scala 80:57]
endmodule
module ysyx_040596_PreAccessMemory(
  input  [6:0]  io_lu_code,
  input  [3:0]  io_su_code,
  input  [63:0] io_op1,
  input  [63:0] io_op2,
  input  [63:0] io_imm,
  output [5:0]  io_lu_shift,
  output        io_ren,
  output [63:0] io_raddr,
  output        io_wen,
  output [63:0] io_waddr,
  output [63:0] io_wdata,
  output [7:0]  io_wmask,
  output [2:0]  io_transfer
);
  wire [63:0] lu_offset = io_op1 + io_op2; // @[PreAccessMemory.scala 25:28]
  wire [63:0] su_offset = io_op1 + io_imm; // @[PreAccessMemory.scala 31:28]
  wire [5:0] su_shift = {su_offset[2:0], 3'h0}; // @[PreAccessMemory.scala 32:37]
  wire [126:0] _GEN_0 = {{63'd0}, io_op2}; // @[PreAccessMemory.scala 35:28]
  wire [126:0] su_wdata = _GEN_0 << su_shift; // @[PreAccessMemory.scala 35:28]
  wire [7:0] _su_wmask_T_1 = 8'h1 << su_offset[2:0]; // @[PreAccessMemory.scala 37:37]
  wire [8:0] _su_wmask_T_3 = 9'h3 << su_offset[2:0]; // @[PreAccessMemory.scala 38:37]
  wire [10:0] _su_wmask_T_5 = 11'hf << su_offset[2:0]; // @[PreAccessMemory.scala 39:37]
  wire [7:0] _su_wmask_T_7 = 4'h1 == io_su_code ? _su_wmask_T_1 : 8'h0; // @[Mux.scala 80:57]
  wire [8:0] _su_wmask_T_9 = 4'h2 == io_su_code ? _su_wmask_T_3 : {{1'd0}, _su_wmask_T_7}; // @[Mux.scala 80:57]
  wire [10:0] _su_wmask_T_11 = 4'h4 == io_su_code ? _su_wmask_T_5 : {{2'd0}, _su_wmask_T_9}; // @[Mux.scala 80:57]
  wire [10:0] su_wmask = 4'h8 == io_su_code ? 11'hff : _su_wmask_T_11; // @[Mux.scala 80:57]
  wire [10:0] _transfer_T = {io_su_code,io_lu_code}; // @[Cat.scala 30:58]
  wire [1:0] _transfer_T_6 = 11'h4 == _transfer_T ? 2'h2 : {{1'd0}, 11'h2 == _transfer_T}; // @[Mux.scala 80:57]
  wire [1:0] _transfer_T_8 = 11'h8 == _transfer_T ? 2'h3 : _transfer_T_6; // @[Mux.scala 80:57]
  wire [1:0] _transfer_T_10 = 11'h10 == _transfer_T ? 2'h0 : _transfer_T_8; // @[Mux.scala 80:57]
  wire [1:0] _transfer_T_12 = 11'h20 == _transfer_T ? 2'h1 : _transfer_T_10; // @[Mux.scala 80:57]
  wire [1:0] _transfer_T_14 = 11'h40 == _transfer_T ? 2'h2 : _transfer_T_12; // @[Mux.scala 80:57]
  wire [1:0] _transfer_T_16 = 11'h80 == _transfer_T ? 2'h0 : _transfer_T_14; // @[Mux.scala 80:57]
  wire [1:0] _transfer_T_18 = 11'h100 == _transfer_T ? 2'h1 : _transfer_T_16; // @[Mux.scala 80:57]
  wire [1:0] _transfer_T_20 = 11'h200 == _transfer_T ? 2'h2 : _transfer_T_18; // @[Mux.scala 80:57]
  wire [1:0] transfer = 11'h400 == _transfer_T ? 2'h3 : _transfer_T_20; // @[Mux.scala 80:57]
  assign io_lu_shift = {lu_offset[2:0], 3'h0}; // @[PreAccessMemory.scala 26:36]
  assign io_ren = io_lu_code != 7'h0; // @[PreAccessMemory.scala 27:29]
  assign io_raddr = io_op1 + io_op2; // @[PreAccessMemory.scala 25:28]
  assign io_wen = io_su_code != 4'h0; // @[PreAccessMemory.scala 33:32]
  assign io_waddr = io_op1 + io_imm; // @[PreAccessMemory.scala 31:28]
  assign io_wdata = su_wdata[63:0]; // @[PreAccessMemory.scala 63:17]
  assign io_wmask = su_wmask[7:0]; // @[PreAccessMemory.scala 64:17]
  assign io_transfer = {{1'd0}, transfer}; // @[Mux.scala 80:57]
endmodule
module ysyx_040596_AccessMemory(
  input  [6:0]  io_lu_code,
  input  [5:0]  io_lu_shift,
  input  [63:0] io_rdata,
  output [63:0] io_lu_out
);
  wire [63:0] _io_lu_out_T = io_rdata >> io_lu_shift; // @[AccessMemory.scala 23:41]
  wire [55:0] io_lu_out_hi = _io_lu_out_T[7] ? 56'hffffffffffffff : 56'h0; // @[Bitwise.scala 72:12]
  wire [7:0] io_lu_out_lo = _io_lu_out_T[7:0]; // @[AccessMemory.scala 13:40]
  wire [63:0] _io_lu_out_T_3 = {io_lu_out_hi,io_lu_out_lo}; // @[Cat.scala 30:58]
  wire [47:0] io_lu_out_hi_1 = _io_lu_out_T[15] ? 48'hffffffffffff : 48'h0; // @[Bitwise.scala 72:12]
  wire [15:0] io_lu_out_lo_1 = _io_lu_out_T[15:0]; // @[AccessMemory.scala 14:41]
  wire [63:0] _io_lu_out_T_7 = {io_lu_out_hi_1,io_lu_out_lo_1}; // @[Cat.scala 30:58]
  wire [31:0] io_lu_out_hi_2 = _io_lu_out_T[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] io_lu_out_lo_2 = _io_lu_out_T[31:0]; // @[AccessMemory.scala 15:41]
  wire [63:0] _io_lu_out_T_11 = {io_lu_out_hi_2,io_lu_out_lo_2}; // @[Cat.scala 30:58]
  wire [63:0] _io_lu_out_T_14 = {56'h0,io_lu_out_lo}; // @[Cat.scala 30:58]
  wire [63:0] _io_lu_out_T_16 = {48'h0,io_lu_out_lo_1}; // @[Cat.scala 30:58]
  wire [63:0] _io_lu_out_T_18 = {32'h0,io_lu_out_lo_2}; // @[Cat.scala 30:58]
  wire [63:0] _io_lu_out_T_20 = 7'h1 == io_lu_code ? _io_lu_out_T_3 : 64'h0; // @[Mux.scala 80:57]
  wire [63:0] _io_lu_out_T_22 = 7'h2 == io_lu_code ? _io_lu_out_T_7 : _io_lu_out_T_20; // @[Mux.scala 80:57]
  wire [63:0] _io_lu_out_T_24 = 7'h4 == io_lu_code ? _io_lu_out_T_11 : _io_lu_out_T_22; // @[Mux.scala 80:57]
  wire [63:0] _io_lu_out_T_26 = 7'h8 == io_lu_code ? _io_lu_out_T : _io_lu_out_T_24; // @[Mux.scala 80:57]
  wire [63:0] _io_lu_out_T_28 = 7'h10 == io_lu_code ? _io_lu_out_T_14 : _io_lu_out_T_26; // @[Mux.scala 80:57]
  wire [63:0] _io_lu_out_T_30 = 7'h20 == io_lu_code ? _io_lu_out_T_16 : _io_lu_out_T_28; // @[Mux.scala 80:57]
  assign io_lu_out = 7'h40 == io_lu_code ? _io_lu_out_T_18 : _io_lu_out_T_30; // @[Mux.scala 80:57]
endmodule
module ysyx_040596_WriteBack(
  input  [6:0]  io_fu_code,
  input  [63:0] io_alu_out,
  input  [63:0] io_bu_out,
  input  [63:0] io_mu_out,
  input  [63:0] io_du_out,
  input  [63:0] io_lu_out,
  input  [63:0] io_csru_out,
  output [63:0] io_out
);
  wire [63:0] _io_out_T_1 = 7'h1 == io_fu_code ? io_alu_out : 64'h0; // @[Mux.scala 80:57]
  wire [63:0] _io_out_T_3 = 7'h2 == io_fu_code ? io_bu_out : _io_out_T_1; // @[Mux.scala 80:57]
  wire [63:0] _io_out_T_5 = 7'h4 == io_fu_code ? io_lu_out : _io_out_T_3; // @[Mux.scala 80:57]
  wire [63:0] _io_out_T_7 = 7'h8 == io_fu_code ? 64'h0 : _io_out_T_5; // @[Mux.scala 80:57]
  wire [63:0] _io_out_T_9 = 7'h10 == io_fu_code ? io_mu_out : _io_out_T_7; // @[Mux.scala 80:57]
  wire [63:0] _io_out_T_11 = 7'h20 == io_fu_code ? io_du_out : _io_out_T_9; // @[Mux.scala 80:57]
  assign io_out = 7'h40 == io_fu_code ? io_csru_out : _io_out_T_11; // @[Mux.scala 80:57]
endmodule
module ysyx_040596_IDReg(
  input         clock,
  input         reset,
  input         io_en,
  input         io_in_valid,
  input  [63:0] io_in_pc,
  input         io_in_intr,
  output        io_out_valid,
  output [63:0] io_out_pc,
  output        io_out_intr,
  output [63:0] io_out_cause,
  output        io_imem_en,
  output [63:0] io_imem_addr,
  input  [31:0] io_imem_data,
  output [31:0] io_inst
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg  valid; // @[Reg.scala 27:20]
  reg [63:0] pc; // @[Reg.scala 27:20]
  reg  intr; // @[Reg.scala 27:20]
  reg [63:0] cause; // @[Reg.scala 27:20]
  reg  icache_data_reset_mask; // @[PipelineReg.scala 34:41]
  assign io_out_valid = valid; // @[PipelineReg.scala 37:21]
  assign io_out_pc = pc; // @[PipelineReg.scala 38:21]
  assign io_out_intr = intr; // @[PipelineReg.scala 39:21]
  assign io_out_cause = cause; // @[PipelineReg.scala 40:21]
  assign io_imem_en = io_en; // @[PipelineReg.scala 33:21]
  assign io_imem_addr = io_in_pc; // @[PipelineReg.scala 32:21]
  assign io_inst = icache_data_reset_mask ? io_imem_data : 32'h0; // @[PipelineReg.scala 35:27]
  always @(posedge clock) begin
    if (reset) begin // @[Reg.scala 27:20]
      valid <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      valid <= io_in_valid; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      pc <= 64'h2ffffffc; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      pc <= io_in_pc; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      intr <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      intr <= io_in_intr; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      cause <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      cause <= 64'h8000000000000007; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[PipelineReg.scala 34:41]
      icache_data_reset_mask <= 1'h0; // @[PipelineReg.scala 34:41]
    end else begin
      icache_data_reset_mask <= 1'h1; // @[PipelineReg.scala 34:41]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  valid = _RAND_0[0:0];
  _RAND_1 = {2{`RANDOM}};
  pc = _RAND_1[63:0];
  _RAND_2 = {1{`RANDOM}};
  intr = _RAND_2[0:0];
  _RAND_3 = {2{`RANDOM}};
  cause = _RAND_3[63:0];
  _RAND_4 = {1{`RANDOM}};
  icache_data_reset_mask = _RAND_4[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_040596_ExeReg(
  input         clock,
  input         reset,
  input         io_en,
  input         io_in_valid,
  input  [63:0] io_in_pc,
  input         io_in_rd_en,
  input  [4:0]  io_in_rd_addr,
  input  [63:0] io_in_imm,
  input  [63:0] io_in_op1,
  input  [63:0] io_in_op2,
  input  [6:0]  io_in_fu_code,
  input  [15:0] io_in_alu_code,
  input  [7:0]  io_in_bu_code,
  input  [6:0]  io_in_lu_code,
  input  [3:0]  io_in_su_code,
  input  [1:0]  io_in_mu_code,
  input  [7:0]  io_in_du_code,
  input  [7:0]  io_in_csru_code,
  input  [4:0]  io_in_rs1_addr,
  output        io_out_valid,
  output [63:0] io_out_pc,
  output        io_out_rd_en,
  output [4:0]  io_out_rd_addr,
  output [63:0] io_out_imm,
  output [63:0] io_out_op1,
  output [63:0] io_out_op2,
  output [6:0]  io_out_fu_code,
  output [15:0] io_out_alu_code,
  output [7:0]  io_out_bu_code,
  output [6:0]  io_out_lu_code,
  output [3:0]  io_out_su_code,
  output [1:0]  io_out_mu_code,
  output [7:0]  io_out_du_code,
  output [7:0]  io_out_csru_code,
  output [4:0]  io_out_rs1_addr
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [63:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
`endif // RANDOMIZE_REG_INIT
  reg  reg_valid; // @[Reg.scala 27:20]
  reg [63:0] reg_pc; // @[Reg.scala 27:20]
  reg  reg_rd_en; // @[Reg.scala 27:20]
  reg [4:0] reg_rd_addr; // @[Reg.scala 27:20]
  reg [63:0] reg_imm; // @[Reg.scala 27:20]
  reg [63:0] reg_op1; // @[Reg.scala 27:20]
  reg [63:0] reg_op2; // @[Reg.scala 27:20]
  reg [6:0] reg_fu_code; // @[Reg.scala 27:20]
  reg [15:0] reg_alu_code; // @[Reg.scala 27:20]
  reg [7:0] reg_bu_code; // @[Reg.scala 27:20]
  reg [6:0] reg_lu_code; // @[Reg.scala 27:20]
  reg [3:0] reg_su_code; // @[Reg.scala 27:20]
  reg [1:0] reg_mu_code; // @[Reg.scala 27:20]
  reg [7:0] reg_du_code; // @[Reg.scala 27:20]
  reg [7:0] reg_csru_code; // @[Reg.scala 27:20]
  reg [4:0] reg_rs1_addr; // @[Reg.scala 27:20]
  assign io_out_valid = reg_valid; // @[PipelineReg.scala 102:10]
  assign io_out_pc = reg_pc; // @[PipelineReg.scala 102:10]
  assign io_out_rd_en = reg_rd_en; // @[PipelineReg.scala 102:10]
  assign io_out_rd_addr = reg_rd_addr; // @[PipelineReg.scala 102:10]
  assign io_out_imm = reg_imm; // @[PipelineReg.scala 102:10]
  assign io_out_op1 = reg_op1; // @[PipelineReg.scala 102:10]
  assign io_out_op2 = reg_op2; // @[PipelineReg.scala 102:10]
  assign io_out_fu_code = reg_fu_code; // @[PipelineReg.scala 102:10]
  assign io_out_alu_code = reg_alu_code; // @[PipelineReg.scala 102:10]
  assign io_out_bu_code = reg_bu_code; // @[PipelineReg.scala 102:10]
  assign io_out_lu_code = reg_lu_code; // @[PipelineReg.scala 102:10]
  assign io_out_su_code = reg_su_code; // @[PipelineReg.scala 102:10]
  assign io_out_mu_code = reg_mu_code; // @[PipelineReg.scala 102:10]
  assign io_out_du_code = reg_du_code; // @[PipelineReg.scala 102:10]
  assign io_out_csru_code = reg_csru_code; // @[PipelineReg.scala 102:10]
  assign io_out_rs1_addr = reg_rs1_addr; // @[PipelineReg.scala 102:10]
  always @(posedge clock) begin
    if (reset) begin // @[Reg.scala 27:20]
      reg_valid <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      reg_valid <= io_in_valid; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      reg_pc <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      reg_pc <= io_in_pc; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      reg_rd_en <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      reg_rd_en <= io_in_rd_en; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      reg_rd_addr <= 5'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      reg_rd_addr <= io_in_rd_addr; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      reg_imm <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      reg_imm <= io_in_imm; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      reg_op1 <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      reg_op1 <= io_in_op1; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      reg_op2 <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      reg_op2 <= io_in_op2; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      reg_fu_code <= 7'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      reg_fu_code <= io_in_fu_code; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      reg_alu_code <= 16'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      reg_alu_code <= io_in_alu_code; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      reg_bu_code <= 8'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      reg_bu_code <= io_in_bu_code; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      reg_lu_code <= 7'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      reg_lu_code <= io_in_lu_code; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      reg_su_code <= 4'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      reg_su_code <= io_in_su_code; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      reg_mu_code <= 2'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      reg_mu_code <= io_in_mu_code; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      reg_du_code <= 8'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      reg_du_code <= io_in_du_code; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      reg_csru_code <= 8'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      reg_csru_code <= io_in_csru_code; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      reg_rs1_addr <= 5'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      reg_rs1_addr <= io_in_rs1_addr; // @[Reg.scala 28:23]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  reg_valid = _RAND_0[0:0];
  _RAND_1 = {2{`RANDOM}};
  reg_pc = _RAND_1[63:0];
  _RAND_2 = {1{`RANDOM}};
  reg_rd_en = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  reg_rd_addr = _RAND_3[4:0];
  _RAND_4 = {2{`RANDOM}};
  reg_imm = _RAND_4[63:0];
  _RAND_5 = {2{`RANDOM}};
  reg_op1 = _RAND_5[63:0];
  _RAND_6 = {2{`RANDOM}};
  reg_op2 = _RAND_6[63:0];
  _RAND_7 = {1{`RANDOM}};
  reg_fu_code = _RAND_7[6:0];
  _RAND_8 = {1{`RANDOM}};
  reg_alu_code = _RAND_8[15:0];
  _RAND_9 = {1{`RANDOM}};
  reg_bu_code = _RAND_9[7:0];
  _RAND_10 = {1{`RANDOM}};
  reg_lu_code = _RAND_10[6:0];
  _RAND_11 = {1{`RANDOM}};
  reg_su_code = _RAND_11[3:0];
  _RAND_12 = {1{`RANDOM}};
  reg_mu_code = _RAND_12[1:0];
  _RAND_13 = {1{`RANDOM}};
  reg_du_code = _RAND_13[7:0];
  _RAND_14 = {1{`RANDOM}};
  reg_csru_code = _RAND_14[7:0];
  _RAND_15 = {1{`RANDOM}};
  reg_rs1_addr = _RAND_15[4:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_040596_MemReg(
  input         clock,
  input         reset,
  input         io_en,
  input         io_in_valid,
  input         io_in_rd_en,
  input  [4:0]  io_in_rd_addr,
  input  [63:0] io_in_imm,
  input  [63:0] io_in_op1,
  input  [63:0] io_in_op2,
  input  [63:0] io_in_alu_out,
  input  [63:0] io_in_bu_out,
  input  [63:0] io_in_mu_out,
  input  [63:0] io_in_du_out,
  input  [63:0] io_in_csru_out,
  input  [6:0]  io_in_fu_code,
  input  [6:0]  io_in_lu_code,
  input  [3:0]  io_in_su_code,
  input         io_in_csr_wen,
  input  [11:0] io_in_csr_waddr,
  input  [63:0] io_in_csr_wdata,
  output        io_out_valid,
  output        io_out_rd_en,
  output [4:0]  io_out_rd_addr,
  output [63:0] io_out_imm,
  output [63:0] io_out_op1,
  output [63:0] io_out_op2,
  output [63:0] io_out_alu_out,
  output [63:0] io_out_bu_out,
  output [63:0] io_out_mu_out,
  output [63:0] io_out_du_out,
  output [63:0] io_out_csru_out,
  output [6:0]  io_out_fu_code,
  output [6:0]  io_out_lu_code,
  output [3:0]  io_out_su_code,
  output        io_out_csr_wen,
  output [11:0] io_out_csr_waddr,
  output [63:0] io_out_csr_wdata
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [63:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [63:0] _RAND_7;
  reg [63:0] _RAND_8;
  reg [63:0] _RAND_9;
  reg [63:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [63:0] _RAND_16;
`endif // RANDOMIZE_REG_INIT
  reg  reg_valid; // @[Reg.scala 27:20]
  reg  reg_rd_en; // @[Reg.scala 27:20]
  reg [4:0] reg_rd_addr; // @[Reg.scala 27:20]
  reg [63:0] reg_imm; // @[Reg.scala 27:20]
  reg [63:0] reg_op1; // @[Reg.scala 27:20]
  reg [63:0] reg_op2; // @[Reg.scala 27:20]
  reg [63:0] reg_alu_out; // @[Reg.scala 27:20]
  reg [63:0] reg_bu_out; // @[Reg.scala 27:20]
  reg [63:0] reg_mu_out; // @[Reg.scala 27:20]
  reg [63:0] reg_du_out; // @[Reg.scala 27:20]
  reg [63:0] reg_csru_out; // @[Reg.scala 27:20]
  reg [6:0] reg_fu_code; // @[Reg.scala 27:20]
  reg [6:0] reg_lu_code; // @[Reg.scala 27:20]
  reg [3:0] reg_su_code; // @[Reg.scala 27:20]
  reg  reg_csr_wen; // @[Reg.scala 27:20]
  reg [11:0] reg_csr_waddr; // @[Reg.scala 27:20]
  reg [63:0] reg_csr_wdata; // @[Reg.scala 27:20]
  assign io_out_valid = reg_valid; // @[PipelineReg.scala 181:10]
  assign io_out_rd_en = reg_rd_en; // @[PipelineReg.scala 181:10]
  assign io_out_rd_addr = reg_rd_addr; // @[PipelineReg.scala 181:10]
  assign io_out_imm = reg_imm; // @[PipelineReg.scala 181:10]
  assign io_out_op1 = reg_op1; // @[PipelineReg.scala 181:10]
  assign io_out_op2 = reg_op2; // @[PipelineReg.scala 181:10]
  assign io_out_alu_out = reg_alu_out; // @[PipelineReg.scala 181:10]
  assign io_out_bu_out = reg_bu_out; // @[PipelineReg.scala 181:10]
  assign io_out_mu_out = reg_mu_out; // @[PipelineReg.scala 181:10]
  assign io_out_du_out = reg_du_out; // @[PipelineReg.scala 181:10]
  assign io_out_csru_out = reg_csru_out; // @[PipelineReg.scala 181:10]
  assign io_out_fu_code = reg_fu_code; // @[PipelineReg.scala 181:10]
  assign io_out_lu_code = reg_lu_code; // @[PipelineReg.scala 181:10]
  assign io_out_su_code = reg_su_code; // @[PipelineReg.scala 181:10]
  assign io_out_csr_wen = reg_csr_wen; // @[PipelineReg.scala 181:10]
  assign io_out_csr_waddr = reg_csr_waddr; // @[PipelineReg.scala 181:10]
  assign io_out_csr_wdata = reg_csr_wdata; // @[PipelineReg.scala 181:10]
  always @(posedge clock) begin
    if (reset) begin // @[Reg.scala 27:20]
      reg_valid <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      reg_valid <= io_in_valid; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      reg_rd_en <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      reg_rd_en <= io_in_rd_en; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      reg_rd_addr <= 5'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      reg_rd_addr <= io_in_rd_addr; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      reg_imm <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      reg_imm <= io_in_imm; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      reg_op1 <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      reg_op1 <= io_in_op1; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      reg_op2 <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      reg_op2 <= io_in_op2; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      reg_alu_out <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      reg_alu_out <= io_in_alu_out; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      reg_bu_out <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      reg_bu_out <= io_in_bu_out; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      reg_mu_out <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      reg_mu_out <= io_in_mu_out; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      reg_du_out <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      reg_du_out <= io_in_du_out; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      reg_csru_out <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      reg_csru_out <= io_in_csru_out; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      reg_fu_code <= 7'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      reg_fu_code <= io_in_fu_code; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      reg_lu_code <= 7'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      reg_lu_code <= io_in_lu_code; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      reg_su_code <= 4'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      reg_su_code <= io_in_su_code; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      reg_csr_wen <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      reg_csr_wen <= io_in_csr_wen; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      reg_csr_waddr <= 12'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      reg_csr_waddr <= io_in_csr_waddr; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      reg_csr_wdata <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      reg_csr_wdata <= io_in_csr_wdata; // @[Reg.scala 28:23]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  reg_valid = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  reg_rd_en = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  reg_rd_addr = _RAND_2[4:0];
  _RAND_3 = {2{`RANDOM}};
  reg_imm = _RAND_3[63:0];
  _RAND_4 = {2{`RANDOM}};
  reg_op1 = _RAND_4[63:0];
  _RAND_5 = {2{`RANDOM}};
  reg_op2 = _RAND_5[63:0];
  _RAND_6 = {2{`RANDOM}};
  reg_alu_out = _RAND_6[63:0];
  _RAND_7 = {2{`RANDOM}};
  reg_bu_out = _RAND_7[63:0];
  _RAND_8 = {2{`RANDOM}};
  reg_mu_out = _RAND_8[63:0];
  _RAND_9 = {2{`RANDOM}};
  reg_du_out = _RAND_9[63:0];
  _RAND_10 = {2{`RANDOM}};
  reg_csru_out = _RAND_10[63:0];
  _RAND_11 = {1{`RANDOM}};
  reg_fu_code = _RAND_11[6:0];
  _RAND_12 = {1{`RANDOM}};
  reg_lu_code = _RAND_12[6:0];
  _RAND_13 = {1{`RANDOM}};
  reg_su_code = _RAND_13[3:0];
  _RAND_14 = {1{`RANDOM}};
  reg_csr_wen = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  reg_csr_waddr = _RAND_15[11:0];
  _RAND_16 = {2{`RANDOM}};
  reg_csr_wdata = _RAND_16[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_040596_WBReg(
  input         clock,
  input         reset,
  input         io_en,
  input         io_in_valid,
  input         io_in_rd_en,
  input  [4:0]  io_in_rd_addr,
  input  [63:0] io_in_alu_out,
  input  [63:0] io_in_bu_out,
  input  [63:0] io_in_mu_out,
  input  [63:0] io_in_du_out,
  input  [63:0] io_in_csru_out,
  input  [6:0]  io_in_fu_code,
  input  [6:0]  io_in_lu_code,
  input  [5:0]  io_in_lu_shift,
  input         io_in_csr_wen,
  input  [11:0] io_in_csr_waddr,
  input  [63:0] io_in_csr_wdata,
  output        io_out_valid,
  output        io_out_rd_en,
  output [4:0]  io_out_rd_addr,
  output [63:0] io_out_alu_out,
  output [63:0] io_out_bu_out,
  output [63:0] io_out_mu_out,
  output [63:0] io_out_du_out,
  output [63:0] io_out_csru_out,
  output [6:0]  io_out_fu_code,
  output [6:0]  io_out_lu_code,
  output [5:0]  io_out_lu_shift,
  output        io_out_csr_wen,
  output [11:0] io_out_csr_waddr,
  output [63:0] io_out_csr_wdata
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [63:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [63:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [63:0] _RAND_13;
`endif // RANDOMIZE_REG_INIT
  reg  reg_valid; // @[Reg.scala 27:20]
  reg  reg_rd_en; // @[Reg.scala 27:20]
  reg [4:0] reg_rd_addr; // @[Reg.scala 27:20]
  reg [63:0] reg_alu_out; // @[Reg.scala 27:20]
  reg [63:0] reg_bu_out; // @[Reg.scala 27:20]
  reg [63:0] reg_mu_out; // @[Reg.scala 27:20]
  reg [63:0] reg_du_out; // @[Reg.scala 27:20]
  reg [63:0] reg_csru_out; // @[Reg.scala 27:20]
  reg [6:0] reg_fu_code; // @[Reg.scala 27:20]
  reg [6:0] reg_lu_code; // @[Reg.scala 27:20]
  reg [5:0] reg_lu_shift; // @[Reg.scala 27:20]
  reg  reg_csr_wen; // @[Reg.scala 27:20]
  reg [11:0] reg_csr_waddr; // @[Reg.scala 27:20]
  reg [63:0] reg_csr_wdata; // @[Reg.scala 27:20]
  assign io_out_valid = reg_valid; // @[PipelineReg.scala 246:10]
  assign io_out_rd_en = reg_rd_en; // @[PipelineReg.scala 246:10]
  assign io_out_rd_addr = reg_rd_addr; // @[PipelineReg.scala 246:10]
  assign io_out_alu_out = reg_alu_out; // @[PipelineReg.scala 246:10]
  assign io_out_bu_out = reg_bu_out; // @[PipelineReg.scala 246:10]
  assign io_out_mu_out = reg_mu_out; // @[PipelineReg.scala 246:10]
  assign io_out_du_out = reg_du_out; // @[PipelineReg.scala 246:10]
  assign io_out_csru_out = reg_csru_out; // @[PipelineReg.scala 246:10]
  assign io_out_fu_code = reg_fu_code; // @[PipelineReg.scala 246:10]
  assign io_out_lu_code = reg_lu_code; // @[PipelineReg.scala 246:10]
  assign io_out_lu_shift = reg_lu_shift; // @[PipelineReg.scala 246:10]
  assign io_out_csr_wen = reg_csr_wen; // @[PipelineReg.scala 246:10]
  assign io_out_csr_waddr = reg_csr_waddr; // @[PipelineReg.scala 246:10]
  assign io_out_csr_wdata = reg_csr_wdata; // @[PipelineReg.scala 246:10]
  always @(posedge clock) begin
    if (reset) begin // @[Reg.scala 27:20]
      reg_valid <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      reg_valid <= io_in_valid; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      reg_rd_en <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      reg_rd_en <= io_in_rd_en; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      reg_rd_addr <= 5'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      reg_rd_addr <= io_in_rd_addr; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      reg_alu_out <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      reg_alu_out <= io_in_alu_out; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      reg_bu_out <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      reg_bu_out <= io_in_bu_out; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      reg_mu_out <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      reg_mu_out <= io_in_mu_out; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      reg_du_out <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      reg_du_out <= io_in_du_out; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      reg_csru_out <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      reg_csru_out <= io_in_csru_out; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      reg_fu_code <= 7'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      reg_fu_code <= io_in_fu_code; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      reg_lu_code <= 7'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      reg_lu_code <= io_in_lu_code; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      reg_lu_shift <= 6'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      reg_lu_shift <= io_in_lu_shift; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      reg_csr_wen <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      reg_csr_wen <= io_in_csr_wen; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      reg_csr_waddr <= 12'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      reg_csr_waddr <= io_in_csr_waddr; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      reg_csr_wdata <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      reg_csr_wdata <= io_in_csr_wdata; // @[Reg.scala 28:23]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  reg_valid = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  reg_rd_en = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  reg_rd_addr = _RAND_2[4:0];
  _RAND_3 = {2{`RANDOM}};
  reg_alu_out = _RAND_3[63:0];
  _RAND_4 = {2{`RANDOM}};
  reg_bu_out = _RAND_4[63:0];
  _RAND_5 = {2{`RANDOM}};
  reg_mu_out = _RAND_5[63:0];
  _RAND_6 = {2{`RANDOM}};
  reg_du_out = _RAND_6[63:0];
  _RAND_7 = {2{`RANDOM}};
  reg_csru_out = _RAND_7[63:0];
  _RAND_8 = {1{`RANDOM}};
  reg_fu_code = _RAND_8[6:0];
  _RAND_9 = {1{`RANDOM}};
  reg_lu_code = _RAND_9[6:0];
  _RAND_10 = {1{`RANDOM}};
  reg_lu_shift = _RAND_10[5:0];
  _RAND_11 = {1{`RANDOM}};
  reg_csr_wen = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  reg_csr_waddr = _RAND_12[11:0];
  _RAND_13 = {2{`RANDOM}};
  reg_csr_wdata = _RAND_13[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_040596_CorrelationConflict(
  input        io_rs_valid,
  input        io_rd_valid,
  input        io_rs1_en,
  input        io_rs2_en,
  input  [4:0] io_rs1_addr,
  input  [4:0] io_rs2_addr,
  input        io_rd_en,
  input  [4:0] io_rd_addr,
  output       io_conflict
);
  wire  inst_valid = io_rs_valid & io_rd_valid; // @[PipelineReg.scala 262:39]
  wire  rs1_conflict = io_rs1_en & io_rs1_addr == io_rd_addr; // @[PipelineReg.scala 263:37]
  wire  rs2_conflict = io_rs2_en & io_rs2_addr == io_rd_addr; // @[PipelineReg.scala 264:37]
  wire  rd_valid = io_rd_addr != 5'h0 & io_rd_en; // @[PipelineReg.scala 265:48]
  assign io_conflict = inst_valid & rd_valid & (rs1_conflict | rs2_conflict); // @[PipelineReg.scala 267:43]
endmodule
module ysyx_040596_RegfileConflict(
  input        io_rs_valid,
  input        io_rs1_en,
  input        io_rs2_en,
  input  [4:0] io_rs1_addr,
  input  [4:0] io_rs2_addr,
  input        io_rd1_valid,
  input        io_rd1_en,
  input  [4:0] io_rd1_addr,
  input        io_rd2_valid,
  input        io_rd2_en,
  input  [4:0] io_rd2_addr,
  input        io_rd3_valid,
  input        io_rd3_en,
  input  [4:0] io_rd3_addr,
  output       io_conflict
);
  wire  cconflict1_io_rs_valid; // @[PipelineReg.scala 290:28]
  wire  cconflict1_io_rd_valid; // @[PipelineReg.scala 290:28]
  wire  cconflict1_io_rs1_en; // @[PipelineReg.scala 290:28]
  wire  cconflict1_io_rs2_en; // @[PipelineReg.scala 290:28]
  wire [4:0] cconflict1_io_rs1_addr; // @[PipelineReg.scala 290:28]
  wire [4:0] cconflict1_io_rs2_addr; // @[PipelineReg.scala 290:28]
  wire  cconflict1_io_rd_en; // @[PipelineReg.scala 290:28]
  wire [4:0] cconflict1_io_rd_addr; // @[PipelineReg.scala 290:28]
  wire  cconflict1_io_conflict; // @[PipelineReg.scala 290:28]
  wire  cconflict2_io_rs_valid; // @[PipelineReg.scala 291:28]
  wire  cconflict2_io_rd_valid; // @[PipelineReg.scala 291:28]
  wire  cconflict2_io_rs1_en; // @[PipelineReg.scala 291:28]
  wire  cconflict2_io_rs2_en; // @[PipelineReg.scala 291:28]
  wire [4:0] cconflict2_io_rs1_addr; // @[PipelineReg.scala 291:28]
  wire [4:0] cconflict2_io_rs2_addr; // @[PipelineReg.scala 291:28]
  wire  cconflict2_io_rd_en; // @[PipelineReg.scala 291:28]
  wire [4:0] cconflict2_io_rd_addr; // @[PipelineReg.scala 291:28]
  wire  cconflict2_io_conflict; // @[PipelineReg.scala 291:28]
  wire  cconflict3_io_rs_valid; // @[PipelineReg.scala 292:28]
  wire  cconflict3_io_rd_valid; // @[PipelineReg.scala 292:28]
  wire  cconflict3_io_rs1_en; // @[PipelineReg.scala 292:28]
  wire  cconflict3_io_rs2_en; // @[PipelineReg.scala 292:28]
  wire [4:0] cconflict3_io_rs1_addr; // @[PipelineReg.scala 292:28]
  wire [4:0] cconflict3_io_rs2_addr; // @[PipelineReg.scala 292:28]
  wire  cconflict3_io_rd_en; // @[PipelineReg.scala 292:28]
  wire [4:0] cconflict3_io_rd_addr; // @[PipelineReg.scala 292:28]
  wire  cconflict3_io_conflict; // @[PipelineReg.scala 292:28]
  ysyx_040596_CorrelationConflict cconflict1 ( // @[PipelineReg.scala 290:28]
    .io_rs_valid(cconflict1_io_rs_valid),
    .io_rd_valid(cconflict1_io_rd_valid),
    .io_rs1_en(cconflict1_io_rs1_en),
    .io_rs2_en(cconflict1_io_rs2_en),
    .io_rs1_addr(cconflict1_io_rs1_addr),
    .io_rs2_addr(cconflict1_io_rs2_addr),
    .io_rd_en(cconflict1_io_rd_en),
    .io_rd_addr(cconflict1_io_rd_addr),
    .io_conflict(cconflict1_io_conflict)
  );
  ysyx_040596_CorrelationConflict cconflict2 ( // @[PipelineReg.scala 291:28]
    .io_rs_valid(cconflict2_io_rs_valid),
    .io_rd_valid(cconflict2_io_rd_valid),
    .io_rs1_en(cconflict2_io_rs1_en),
    .io_rs2_en(cconflict2_io_rs2_en),
    .io_rs1_addr(cconflict2_io_rs1_addr),
    .io_rs2_addr(cconflict2_io_rs2_addr),
    .io_rd_en(cconflict2_io_rd_en),
    .io_rd_addr(cconflict2_io_rd_addr),
    .io_conflict(cconflict2_io_conflict)
  );
  ysyx_040596_CorrelationConflict cconflict3 ( // @[PipelineReg.scala 292:28]
    .io_rs_valid(cconflict3_io_rs_valid),
    .io_rd_valid(cconflict3_io_rd_valid),
    .io_rs1_en(cconflict3_io_rs1_en),
    .io_rs2_en(cconflict3_io_rs2_en),
    .io_rs1_addr(cconflict3_io_rs1_addr),
    .io_rs2_addr(cconflict3_io_rs2_addr),
    .io_rd_en(cconflict3_io_rd_en),
    .io_rd_addr(cconflict3_io_rd_addr),
    .io_conflict(cconflict3_io_conflict)
  );
  assign io_conflict = cconflict1_io_conflict | cconflict2_io_conflict | cconflict3_io_conflict; // @[PipelineReg.scala 321:69]
  assign cconflict1_io_rs_valid = io_rs_valid; // @[PipelineReg.scala 294:29]
  assign cconflict1_io_rd_valid = io_rd1_valid; // @[PipelineReg.scala 295:29]
  assign cconflict1_io_rs1_en = io_rs1_en; // @[PipelineReg.scala 296:29]
  assign cconflict1_io_rs2_en = io_rs2_en; // @[PipelineReg.scala 297:29]
  assign cconflict1_io_rs1_addr = io_rs1_addr; // @[PipelineReg.scala 298:29]
  assign cconflict1_io_rs2_addr = io_rs2_addr; // @[PipelineReg.scala 299:29]
  assign cconflict1_io_rd_en = io_rd1_en; // @[PipelineReg.scala 300:29]
  assign cconflict1_io_rd_addr = io_rd1_addr; // @[PipelineReg.scala 301:29]
  assign cconflict2_io_rs_valid = io_rs_valid; // @[PipelineReg.scala 303:29]
  assign cconflict2_io_rd_valid = io_rd2_valid; // @[PipelineReg.scala 304:29]
  assign cconflict2_io_rs1_en = io_rs1_en; // @[PipelineReg.scala 305:29]
  assign cconflict2_io_rs2_en = io_rs2_en; // @[PipelineReg.scala 306:29]
  assign cconflict2_io_rs1_addr = io_rs1_addr; // @[PipelineReg.scala 307:29]
  assign cconflict2_io_rs2_addr = io_rs2_addr; // @[PipelineReg.scala 308:29]
  assign cconflict2_io_rd_en = io_rd2_en; // @[PipelineReg.scala 309:29]
  assign cconflict2_io_rd_addr = io_rd2_addr; // @[PipelineReg.scala 310:29]
  assign cconflict3_io_rs_valid = io_rs_valid; // @[PipelineReg.scala 312:29]
  assign cconflict3_io_rd_valid = io_rd3_valid; // @[PipelineReg.scala 313:29]
  assign cconflict3_io_rs1_en = io_rs1_en; // @[PipelineReg.scala 314:29]
  assign cconflict3_io_rs2_en = io_rs2_en; // @[PipelineReg.scala 315:29]
  assign cconflict3_io_rs1_addr = io_rs1_addr; // @[PipelineReg.scala 316:29]
  assign cconflict3_io_rs2_addr = io_rs2_addr; // @[PipelineReg.scala 317:29]
  assign cconflict3_io_rd_en = io_rd3_en; // @[PipelineReg.scala 318:29]
  assign cconflict3_io_rd_addr = io_rd3_addr; // @[PipelineReg.scala 319:29]
endmodule
module ysyx_040596_Pipeline(
  input         clock,
  input         reset,
  output        io_imem_en,
  output [63:0] io_imem_addr,
  input  [31:0] io_imem_data,
  output        io_dmem_ren,
  output [63:0] io_dmem_raddr,
  output        io_dmem_wen,
  output [63:0] io_dmem_waddr,
  output [63:0] io_dmem_wdata,
  output [7:0]  io_dmem_wmask,
  input  [63:0] io_dmem_rdata,
  output [31:0] io_dmem_transfer,
  output [4:0]  io_rs1_addr,
  output [4:0]  io_rs2_addr,
  input  [63:0] io_rs1_data,
  input  [63:0] io_rs2_data,
  output        io_rfconflict,
  output [1:0]  io_mu_code,
  output [63:0] io_mu_op1,
  output [63:0] io_mu_op2,
  input  [63:0] io_mu_out,
  output [7:0]  io_du_code,
  output [63:0] io_du_op1,
  output [63:0] io_du_op2,
  input  [63:0] io_du_out,
  output [11:0] io_csr_raddr,
  input  [63:0] io_csr_rdata,
  output        io_csr_wen,
  output [11:0] io_csr_waddr,
  output [63:0] io_csr_wdata,
  input  [63:0] io_csr_mtvec,
  input  [63:0] io_csr_mepc,
  output        io_id_ecall,
  output        io_id_mret,
  output [63:0] io_id_pc,
  input         io_intr,
  output        io_id_intr,
  output [63:0] io_id_cause,
  output        io_id_fencei,
  input         io_stall_id,
  input         io_stall_ie,
  input         io_stall_wb,
  output        io_ie_valid,
  output        io_mem_valid,
  output        io_wb_valid,
  output        io_commit,
  output        io_rf_rd_en,
  output [4:0]  io_rf_rd_addr,
  output [63:0] io_rf_rd_data
);
  wire  ifu_reset; // @[Pipeline.scala 103:25]
  wire  ifu_io_jump_en; // @[Pipeline.scala 103:25]
  wire [63:0] ifu_io_jump_pc; // @[Pipeline.scala 103:25]
  wire [63:0] ifu_io_pc; // @[Pipeline.scala 103:25]
  wire [63:0] ifu_io_next_pc; // @[Pipeline.scala 103:25]
  wire  ifu_io_valid; // @[Pipeline.scala 103:25]
  wire [63:0] idu_io_pc; // @[Pipeline.scala 104:25]
  wire [31:0] idu_io_inst; // @[Pipeline.scala 104:25]
  wire  idu_io_rs1_en; // @[Pipeline.scala 104:25]
  wire  idu_io_rs2_en; // @[Pipeline.scala 104:25]
  wire [4:0] idu_io_rs1_addr; // @[Pipeline.scala 104:25]
  wire [4:0] idu_io_rs2_addr; // @[Pipeline.scala 104:25]
  wire [63:0] idu_io_rs1_data; // @[Pipeline.scala 104:25]
  wire [63:0] idu_io_rs2_data; // @[Pipeline.scala 104:25]
  wire  idu_io_rd_en; // @[Pipeline.scala 104:25]
  wire [4:0] idu_io_rd_addr; // @[Pipeline.scala 104:25]
  wire [6:0] idu_io_decode_info_fu_code; // @[Pipeline.scala 104:25]
  wire [15:0] idu_io_decode_info_alu_code; // @[Pipeline.scala 104:25]
  wire [7:0] idu_io_decode_info_bu_code; // @[Pipeline.scala 104:25]
  wire [6:0] idu_io_decode_info_lu_code; // @[Pipeline.scala 104:25]
  wire [3:0] idu_io_decode_info_su_code; // @[Pipeline.scala 104:25]
  wire [1:0] idu_io_decode_info_mu_code; // @[Pipeline.scala 104:25]
  wire [7:0] idu_io_decode_info_du_code; // @[Pipeline.scala 104:25]
  wire [7:0] idu_io_decode_info_csru_code; // @[Pipeline.scala 104:25]
  wire  idu_io_jump_en; // @[Pipeline.scala 104:25]
  wire [63:0] idu_io_jump_pc; // @[Pipeline.scala 104:25]
  wire [63:0] idu_io_op1; // @[Pipeline.scala 104:25]
  wire [63:0] idu_io_op2; // @[Pipeline.scala 104:25]
  wire [63:0] idu_io_imm; // @[Pipeline.scala 104:25]
  wire [63:0] idu_io_mtvec; // @[Pipeline.scala 104:25]
  wire [63:0] idu_io_mepc; // @[Pipeline.scala 104:25]
  wire  idu_io_intr; // @[Pipeline.scala 104:25]
  wire [15:0] ieu_io_alu_code; // @[Pipeline.scala 105:25]
  wire [7:0] ieu_io_bu_code; // @[Pipeline.scala 105:25]
  wire [7:0] ieu_io_csru_code; // @[Pipeline.scala 105:25]
  wire [63:0] ieu_io_op1; // @[Pipeline.scala 105:25]
  wire [63:0] ieu_io_op2; // @[Pipeline.scala 105:25]
  wire [63:0] ieu_io_pc; // @[Pipeline.scala 105:25]
  wire [63:0] ieu_io_alu_out; // @[Pipeline.scala 105:25]
  wire [63:0] ieu_io_bu_out; // @[Pipeline.scala 105:25]
  wire [63:0] ieu_io_csru_out; // @[Pipeline.scala 105:25]
  wire [4:0] ieu_io_rs1_addr; // @[Pipeline.scala 105:25]
  wire [11:0] ieu_io_csr_raddr; // @[Pipeline.scala 105:25]
  wire [63:0] ieu_io_csr_rdata; // @[Pipeline.scala 105:25]
  wire  ieu_io_csr_wen; // @[Pipeline.scala 105:25]
  wire [11:0] ieu_io_csr_waddr; // @[Pipeline.scala 105:25]
  wire [63:0] ieu_io_csr_wdata; // @[Pipeline.scala 105:25]
  wire [6:0] preamu_io_lu_code; // @[Pipeline.scala 106:25]
  wire [3:0] preamu_io_su_code; // @[Pipeline.scala 106:25]
  wire [63:0] preamu_io_op1; // @[Pipeline.scala 106:25]
  wire [63:0] preamu_io_op2; // @[Pipeline.scala 106:25]
  wire [63:0] preamu_io_imm; // @[Pipeline.scala 106:25]
  wire [5:0] preamu_io_lu_shift; // @[Pipeline.scala 106:25]
  wire  preamu_io_ren; // @[Pipeline.scala 106:25]
  wire [63:0] preamu_io_raddr; // @[Pipeline.scala 106:25]
  wire  preamu_io_wen; // @[Pipeline.scala 106:25]
  wire [63:0] preamu_io_waddr; // @[Pipeline.scala 106:25]
  wire [63:0] preamu_io_wdata; // @[Pipeline.scala 106:25]
  wire [7:0] preamu_io_wmask; // @[Pipeline.scala 106:25]
  wire [2:0] preamu_io_transfer; // @[Pipeline.scala 106:25]
  wire [6:0] amu_io_lu_code; // @[Pipeline.scala 107:25]
  wire [5:0] amu_io_lu_shift; // @[Pipeline.scala 107:25]
  wire [63:0] amu_io_rdata; // @[Pipeline.scala 107:25]
  wire [63:0] amu_io_lu_out; // @[Pipeline.scala 107:25]
  wire [6:0] wbu_io_fu_code; // @[Pipeline.scala 108:25]
  wire [63:0] wbu_io_alu_out; // @[Pipeline.scala 108:25]
  wire [63:0] wbu_io_bu_out; // @[Pipeline.scala 108:25]
  wire [63:0] wbu_io_mu_out; // @[Pipeline.scala 108:25]
  wire [63:0] wbu_io_du_out; // @[Pipeline.scala 108:25]
  wire [63:0] wbu_io_lu_out; // @[Pipeline.scala 108:25]
  wire [63:0] wbu_io_csru_out; // @[Pipeline.scala 108:25]
  wire [63:0] wbu_io_out; // @[Pipeline.scala 108:25]
  wire  idreg_clock; // @[Pipeline.scala 110:25]
  wire  idreg_reset; // @[Pipeline.scala 110:25]
  wire  idreg_io_en; // @[Pipeline.scala 110:25]
  wire  idreg_io_in_valid; // @[Pipeline.scala 110:25]
  wire [63:0] idreg_io_in_pc; // @[Pipeline.scala 110:25]
  wire  idreg_io_in_intr; // @[Pipeline.scala 110:25]
  wire  idreg_io_out_valid; // @[Pipeline.scala 110:25]
  wire [63:0] idreg_io_out_pc; // @[Pipeline.scala 110:25]
  wire  idreg_io_out_intr; // @[Pipeline.scala 110:25]
  wire [63:0] idreg_io_out_cause; // @[Pipeline.scala 110:25]
  wire  idreg_io_imem_en; // @[Pipeline.scala 110:25]
  wire [63:0] idreg_io_imem_addr; // @[Pipeline.scala 110:25]
  wire [31:0] idreg_io_imem_data; // @[Pipeline.scala 110:25]
  wire [31:0] idreg_io_inst; // @[Pipeline.scala 110:25]
  wire  exereg_clock; // @[Pipeline.scala 111:25]
  wire  exereg_reset; // @[Pipeline.scala 111:25]
  wire  exereg_io_en; // @[Pipeline.scala 111:25]
  wire  exereg_io_in_valid; // @[Pipeline.scala 111:25]
  wire [63:0] exereg_io_in_pc; // @[Pipeline.scala 111:25]
  wire  exereg_io_in_rd_en; // @[Pipeline.scala 111:25]
  wire [4:0] exereg_io_in_rd_addr; // @[Pipeline.scala 111:25]
  wire [63:0] exereg_io_in_imm; // @[Pipeline.scala 111:25]
  wire [63:0] exereg_io_in_op1; // @[Pipeline.scala 111:25]
  wire [63:0] exereg_io_in_op2; // @[Pipeline.scala 111:25]
  wire [6:0] exereg_io_in_fu_code; // @[Pipeline.scala 111:25]
  wire [15:0] exereg_io_in_alu_code; // @[Pipeline.scala 111:25]
  wire [7:0] exereg_io_in_bu_code; // @[Pipeline.scala 111:25]
  wire [6:0] exereg_io_in_lu_code; // @[Pipeline.scala 111:25]
  wire [3:0] exereg_io_in_su_code; // @[Pipeline.scala 111:25]
  wire [1:0] exereg_io_in_mu_code; // @[Pipeline.scala 111:25]
  wire [7:0] exereg_io_in_du_code; // @[Pipeline.scala 111:25]
  wire [7:0] exereg_io_in_csru_code; // @[Pipeline.scala 111:25]
  wire [4:0] exereg_io_in_rs1_addr; // @[Pipeline.scala 111:25]
  wire  exereg_io_out_valid; // @[Pipeline.scala 111:25]
  wire [63:0] exereg_io_out_pc; // @[Pipeline.scala 111:25]
  wire  exereg_io_out_rd_en; // @[Pipeline.scala 111:25]
  wire [4:0] exereg_io_out_rd_addr; // @[Pipeline.scala 111:25]
  wire [63:0] exereg_io_out_imm; // @[Pipeline.scala 111:25]
  wire [63:0] exereg_io_out_op1; // @[Pipeline.scala 111:25]
  wire [63:0] exereg_io_out_op2; // @[Pipeline.scala 111:25]
  wire [6:0] exereg_io_out_fu_code; // @[Pipeline.scala 111:25]
  wire [15:0] exereg_io_out_alu_code; // @[Pipeline.scala 111:25]
  wire [7:0] exereg_io_out_bu_code; // @[Pipeline.scala 111:25]
  wire [6:0] exereg_io_out_lu_code; // @[Pipeline.scala 111:25]
  wire [3:0] exereg_io_out_su_code; // @[Pipeline.scala 111:25]
  wire [1:0] exereg_io_out_mu_code; // @[Pipeline.scala 111:25]
  wire [7:0] exereg_io_out_du_code; // @[Pipeline.scala 111:25]
  wire [7:0] exereg_io_out_csru_code; // @[Pipeline.scala 111:25]
  wire [4:0] exereg_io_out_rs1_addr; // @[Pipeline.scala 111:25]
  wire  memreg_clock; // @[Pipeline.scala 112:25]
  wire  memreg_reset; // @[Pipeline.scala 112:25]
  wire  memreg_io_en; // @[Pipeline.scala 112:25]
  wire  memreg_io_in_valid; // @[Pipeline.scala 112:25]
  wire  memreg_io_in_rd_en; // @[Pipeline.scala 112:25]
  wire [4:0] memreg_io_in_rd_addr; // @[Pipeline.scala 112:25]
  wire [63:0] memreg_io_in_imm; // @[Pipeline.scala 112:25]
  wire [63:0] memreg_io_in_op1; // @[Pipeline.scala 112:25]
  wire [63:0] memreg_io_in_op2; // @[Pipeline.scala 112:25]
  wire [63:0] memreg_io_in_alu_out; // @[Pipeline.scala 112:25]
  wire [63:0] memreg_io_in_bu_out; // @[Pipeline.scala 112:25]
  wire [63:0] memreg_io_in_mu_out; // @[Pipeline.scala 112:25]
  wire [63:0] memreg_io_in_du_out; // @[Pipeline.scala 112:25]
  wire [63:0] memreg_io_in_csru_out; // @[Pipeline.scala 112:25]
  wire [6:0] memreg_io_in_fu_code; // @[Pipeline.scala 112:25]
  wire [6:0] memreg_io_in_lu_code; // @[Pipeline.scala 112:25]
  wire [3:0] memreg_io_in_su_code; // @[Pipeline.scala 112:25]
  wire  memreg_io_in_csr_wen; // @[Pipeline.scala 112:25]
  wire [11:0] memreg_io_in_csr_waddr; // @[Pipeline.scala 112:25]
  wire [63:0] memreg_io_in_csr_wdata; // @[Pipeline.scala 112:25]
  wire  memreg_io_out_valid; // @[Pipeline.scala 112:25]
  wire  memreg_io_out_rd_en; // @[Pipeline.scala 112:25]
  wire [4:0] memreg_io_out_rd_addr; // @[Pipeline.scala 112:25]
  wire [63:0] memreg_io_out_imm; // @[Pipeline.scala 112:25]
  wire [63:0] memreg_io_out_op1; // @[Pipeline.scala 112:25]
  wire [63:0] memreg_io_out_op2; // @[Pipeline.scala 112:25]
  wire [63:0] memreg_io_out_alu_out; // @[Pipeline.scala 112:25]
  wire [63:0] memreg_io_out_bu_out; // @[Pipeline.scala 112:25]
  wire [63:0] memreg_io_out_mu_out; // @[Pipeline.scala 112:25]
  wire [63:0] memreg_io_out_du_out; // @[Pipeline.scala 112:25]
  wire [63:0] memreg_io_out_csru_out; // @[Pipeline.scala 112:25]
  wire [6:0] memreg_io_out_fu_code; // @[Pipeline.scala 112:25]
  wire [6:0] memreg_io_out_lu_code; // @[Pipeline.scala 112:25]
  wire [3:0] memreg_io_out_su_code; // @[Pipeline.scala 112:25]
  wire  memreg_io_out_csr_wen; // @[Pipeline.scala 112:25]
  wire [11:0] memreg_io_out_csr_waddr; // @[Pipeline.scala 112:25]
  wire [63:0] memreg_io_out_csr_wdata; // @[Pipeline.scala 112:25]
  wire  wbreg_clock; // @[Pipeline.scala 113:25]
  wire  wbreg_reset; // @[Pipeline.scala 113:25]
  wire  wbreg_io_en; // @[Pipeline.scala 113:25]
  wire  wbreg_io_in_valid; // @[Pipeline.scala 113:25]
  wire  wbreg_io_in_rd_en; // @[Pipeline.scala 113:25]
  wire [4:0] wbreg_io_in_rd_addr; // @[Pipeline.scala 113:25]
  wire [63:0] wbreg_io_in_alu_out; // @[Pipeline.scala 113:25]
  wire [63:0] wbreg_io_in_bu_out; // @[Pipeline.scala 113:25]
  wire [63:0] wbreg_io_in_mu_out; // @[Pipeline.scala 113:25]
  wire [63:0] wbreg_io_in_du_out; // @[Pipeline.scala 113:25]
  wire [63:0] wbreg_io_in_csru_out; // @[Pipeline.scala 113:25]
  wire [6:0] wbreg_io_in_fu_code; // @[Pipeline.scala 113:25]
  wire [6:0] wbreg_io_in_lu_code; // @[Pipeline.scala 113:25]
  wire [5:0] wbreg_io_in_lu_shift; // @[Pipeline.scala 113:25]
  wire  wbreg_io_in_csr_wen; // @[Pipeline.scala 113:25]
  wire [11:0] wbreg_io_in_csr_waddr; // @[Pipeline.scala 113:25]
  wire [63:0] wbreg_io_in_csr_wdata; // @[Pipeline.scala 113:25]
  wire  wbreg_io_out_valid; // @[Pipeline.scala 113:25]
  wire  wbreg_io_out_rd_en; // @[Pipeline.scala 113:25]
  wire [4:0] wbreg_io_out_rd_addr; // @[Pipeline.scala 113:25]
  wire [63:0] wbreg_io_out_alu_out; // @[Pipeline.scala 113:25]
  wire [63:0] wbreg_io_out_bu_out; // @[Pipeline.scala 113:25]
  wire [63:0] wbreg_io_out_mu_out; // @[Pipeline.scala 113:25]
  wire [63:0] wbreg_io_out_du_out; // @[Pipeline.scala 113:25]
  wire [63:0] wbreg_io_out_csru_out; // @[Pipeline.scala 113:25]
  wire [6:0] wbreg_io_out_fu_code; // @[Pipeline.scala 113:25]
  wire [6:0] wbreg_io_out_lu_code; // @[Pipeline.scala 113:25]
  wire [5:0] wbreg_io_out_lu_shift; // @[Pipeline.scala 113:25]
  wire  wbreg_io_out_csr_wen; // @[Pipeline.scala 113:25]
  wire [11:0] wbreg_io_out_csr_waddr; // @[Pipeline.scala 113:25]
  wire [63:0] wbreg_io_out_csr_wdata; // @[Pipeline.scala 113:25]
  wire  rfconflict_io_rs_valid; // @[Pipeline.scala 115:29]
  wire  rfconflict_io_rs1_en; // @[Pipeline.scala 115:29]
  wire  rfconflict_io_rs2_en; // @[Pipeline.scala 115:29]
  wire [4:0] rfconflict_io_rs1_addr; // @[Pipeline.scala 115:29]
  wire [4:0] rfconflict_io_rs2_addr; // @[Pipeline.scala 115:29]
  wire  rfconflict_io_rd1_valid; // @[Pipeline.scala 115:29]
  wire  rfconflict_io_rd1_en; // @[Pipeline.scala 115:29]
  wire [4:0] rfconflict_io_rd1_addr; // @[Pipeline.scala 115:29]
  wire  rfconflict_io_rd2_valid; // @[Pipeline.scala 115:29]
  wire  rfconflict_io_rd2_en; // @[Pipeline.scala 115:29]
  wire [4:0] rfconflict_io_rd2_addr; // @[Pipeline.scala 115:29]
  wire  rfconflict_io_rd3_valid; // @[Pipeline.scala 115:29]
  wire  rfconflict_io_rd3_en; // @[Pipeline.scala 115:29]
  wire [4:0] rfconflict_io_rd3_addr; // @[Pipeline.scala 115:29]
  wire  rfconflict_io_conflict; // @[Pipeline.scala 115:29]
  wire [31:0] _io_id_fencei_T = idreg_io_inst; // @[Pipeline.scala 132:42]
  wire  _exereg_io_in_valid_T = ~io_stall_id; // @[Pipeline.scala 363:50]
  wire  _memreg_io_in_valid_T = ~io_stall_ie; // @[Pipeline.scala 364:51]
  wire  _commit_valid_T = ~io_stall_wb; // @[Pipeline.scala 366:49]
  ysyx_040596_IFetch ifu ( // @[Pipeline.scala 103:25]
    .reset(ifu_reset),
    .io_jump_en(ifu_io_jump_en),
    .io_jump_pc(ifu_io_jump_pc),
    .io_pc(ifu_io_pc),
    .io_next_pc(ifu_io_next_pc),
    .io_valid(ifu_io_valid)
  );
  ysyx_040596_Decode idu ( // @[Pipeline.scala 104:25]
    .io_pc(idu_io_pc),
    .io_inst(idu_io_inst),
    .io_rs1_en(idu_io_rs1_en),
    .io_rs2_en(idu_io_rs2_en),
    .io_rs1_addr(idu_io_rs1_addr),
    .io_rs2_addr(idu_io_rs2_addr),
    .io_rs1_data(idu_io_rs1_data),
    .io_rs2_data(idu_io_rs2_data),
    .io_rd_en(idu_io_rd_en),
    .io_rd_addr(idu_io_rd_addr),
    .io_decode_info_fu_code(idu_io_decode_info_fu_code),
    .io_decode_info_alu_code(idu_io_decode_info_alu_code),
    .io_decode_info_bu_code(idu_io_decode_info_bu_code),
    .io_decode_info_lu_code(idu_io_decode_info_lu_code),
    .io_decode_info_su_code(idu_io_decode_info_su_code),
    .io_decode_info_mu_code(idu_io_decode_info_mu_code),
    .io_decode_info_du_code(idu_io_decode_info_du_code),
    .io_decode_info_csru_code(idu_io_decode_info_csru_code),
    .io_jump_en(idu_io_jump_en),
    .io_jump_pc(idu_io_jump_pc),
    .io_op1(idu_io_op1),
    .io_op2(idu_io_op2),
    .io_imm(idu_io_imm),
    .io_mtvec(idu_io_mtvec),
    .io_mepc(idu_io_mepc),
    .io_intr(idu_io_intr)
  );
  ysyx_040596_Execution ieu ( // @[Pipeline.scala 105:25]
    .io_alu_code(ieu_io_alu_code),
    .io_bu_code(ieu_io_bu_code),
    .io_csru_code(ieu_io_csru_code),
    .io_op1(ieu_io_op1),
    .io_op2(ieu_io_op2),
    .io_pc(ieu_io_pc),
    .io_alu_out(ieu_io_alu_out),
    .io_bu_out(ieu_io_bu_out),
    .io_csru_out(ieu_io_csru_out),
    .io_rs1_addr(ieu_io_rs1_addr),
    .io_csr_raddr(ieu_io_csr_raddr),
    .io_csr_rdata(ieu_io_csr_rdata),
    .io_csr_wen(ieu_io_csr_wen),
    .io_csr_waddr(ieu_io_csr_waddr),
    .io_csr_wdata(ieu_io_csr_wdata)
  );
  ysyx_040596_PreAccessMemory preamu ( // @[Pipeline.scala 106:25]
    .io_lu_code(preamu_io_lu_code),
    .io_su_code(preamu_io_su_code),
    .io_op1(preamu_io_op1),
    .io_op2(preamu_io_op2),
    .io_imm(preamu_io_imm),
    .io_lu_shift(preamu_io_lu_shift),
    .io_ren(preamu_io_ren),
    .io_raddr(preamu_io_raddr),
    .io_wen(preamu_io_wen),
    .io_waddr(preamu_io_waddr),
    .io_wdata(preamu_io_wdata),
    .io_wmask(preamu_io_wmask),
    .io_transfer(preamu_io_transfer)
  );
  ysyx_040596_AccessMemory amu ( // @[Pipeline.scala 107:25]
    .io_lu_code(amu_io_lu_code),
    .io_lu_shift(amu_io_lu_shift),
    .io_rdata(amu_io_rdata),
    .io_lu_out(amu_io_lu_out)
  );
  ysyx_040596_WriteBack wbu ( // @[Pipeline.scala 108:25]
    .io_fu_code(wbu_io_fu_code),
    .io_alu_out(wbu_io_alu_out),
    .io_bu_out(wbu_io_bu_out),
    .io_mu_out(wbu_io_mu_out),
    .io_du_out(wbu_io_du_out),
    .io_lu_out(wbu_io_lu_out),
    .io_csru_out(wbu_io_csru_out),
    .io_out(wbu_io_out)
  );
  ysyx_040596_IDReg idreg ( // @[Pipeline.scala 110:25]
    .clock(idreg_clock),
    .reset(idreg_reset),
    .io_en(idreg_io_en),
    .io_in_valid(idreg_io_in_valid),
    .io_in_pc(idreg_io_in_pc),
    .io_in_intr(idreg_io_in_intr),
    .io_out_valid(idreg_io_out_valid),
    .io_out_pc(idreg_io_out_pc),
    .io_out_intr(idreg_io_out_intr),
    .io_out_cause(idreg_io_out_cause),
    .io_imem_en(idreg_io_imem_en),
    .io_imem_addr(idreg_io_imem_addr),
    .io_imem_data(idreg_io_imem_data),
    .io_inst(idreg_io_inst)
  );
  ysyx_040596_ExeReg exereg ( // @[Pipeline.scala 111:25]
    .clock(exereg_clock),
    .reset(exereg_reset),
    .io_en(exereg_io_en),
    .io_in_valid(exereg_io_in_valid),
    .io_in_pc(exereg_io_in_pc),
    .io_in_rd_en(exereg_io_in_rd_en),
    .io_in_rd_addr(exereg_io_in_rd_addr),
    .io_in_imm(exereg_io_in_imm),
    .io_in_op1(exereg_io_in_op1),
    .io_in_op2(exereg_io_in_op2),
    .io_in_fu_code(exereg_io_in_fu_code),
    .io_in_alu_code(exereg_io_in_alu_code),
    .io_in_bu_code(exereg_io_in_bu_code),
    .io_in_lu_code(exereg_io_in_lu_code),
    .io_in_su_code(exereg_io_in_su_code),
    .io_in_mu_code(exereg_io_in_mu_code),
    .io_in_du_code(exereg_io_in_du_code),
    .io_in_csru_code(exereg_io_in_csru_code),
    .io_in_rs1_addr(exereg_io_in_rs1_addr),
    .io_out_valid(exereg_io_out_valid),
    .io_out_pc(exereg_io_out_pc),
    .io_out_rd_en(exereg_io_out_rd_en),
    .io_out_rd_addr(exereg_io_out_rd_addr),
    .io_out_imm(exereg_io_out_imm),
    .io_out_op1(exereg_io_out_op1),
    .io_out_op2(exereg_io_out_op2),
    .io_out_fu_code(exereg_io_out_fu_code),
    .io_out_alu_code(exereg_io_out_alu_code),
    .io_out_bu_code(exereg_io_out_bu_code),
    .io_out_lu_code(exereg_io_out_lu_code),
    .io_out_su_code(exereg_io_out_su_code),
    .io_out_mu_code(exereg_io_out_mu_code),
    .io_out_du_code(exereg_io_out_du_code),
    .io_out_csru_code(exereg_io_out_csru_code),
    .io_out_rs1_addr(exereg_io_out_rs1_addr)
  );
  ysyx_040596_MemReg memreg ( // @[Pipeline.scala 112:25]
    .clock(memreg_clock),
    .reset(memreg_reset),
    .io_en(memreg_io_en),
    .io_in_valid(memreg_io_in_valid),
    .io_in_rd_en(memreg_io_in_rd_en),
    .io_in_rd_addr(memreg_io_in_rd_addr),
    .io_in_imm(memreg_io_in_imm),
    .io_in_op1(memreg_io_in_op1),
    .io_in_op2(memreg_io_in_op2),
    .io_in_alu_out(memreg_io_in_alu_out),
    .io_in_bu_out(memreg_io_in_bu_out),
    .io_in_mu_out(memreg_io_in_mu_out),
    .io_in_du_out(memreg_io_in_du_out),
    .io_in_csru_out(memreg_io_in_csru_out),
    .io_in_fu_code(memreg_io_in_fu_code),
    .io_in_lu_code(memreg_io_in_lu_code),
    .io_in_su_code(memreg_io_in_su_code),
    .io_in_csr_wen(memreg_io_in_csr_wen),
    .io_in_csr_waddr(memreg_io_in_csr_waddr),
    .io_in_csr_wdata(memreg_io_in_csr_wdata),
    .io_out_valid(memreg_io_out_valid),
    .io_out_rd_en(memreg_io_out_rd_en),
    .io_out_rd_addr(memreg_io_out_rd_addr),
    .io_out_imm(memreg_io_out_imm),
    .io_out_op1(memreg_io_out_op1),
    .io_out_op2(memreg_io_out_op2),
    .io_out_alu_out(memreg_io_out_alu_out),
    .io_out_bu_out(memreg_io_out_bu_out),
    .io_out_mu_out(memreg_io_out_mu_out),
    .io_out_du_out(memreg_io_out_du_out),
    .io_out_csru_out(memreg_io_out_csru_out),
    .io_out_fu_code(memreg_io_out_fu_code),
    .io_out_lu_code(memreg_io_out_lu_code),
    .io_out_su_code(memreg_io_out_su_code),
    .io_out_csr_wen(memreg_io_out_csr_wen),
    .io_out_csr_waddr(memreg_io_out_csr_waddr),
    .io_out_csr_wdata(memreg_io_out_csr_wdata)
  );
  ysyx_040596_WBReg wbreg ( // @[Pipeline.scala 113:25]
    .clock(wbreg_clock),
    .reset(wbreg_reset),
    .io_en(wbreg_io_en),
    .io_in_valid(wbreg_io_in_valid),
    .io_in_rd_en(wbreg_io_in_rd_en),
    .io_in_rd_addr(wbreg_io_in_rd_addr),
    .io_in_alu_out(wbreg_io_in_alu_out),
    .io_in_bu_out(wbreg_io_in_bu_out),
    .io_in_mu_out(wbreg_io_in_mu_out),
    .io_in_du_out(wbreg_io_in_du_out),
    .io_in_csru_out(wbreg_io_in_csru_out),
    .io_in_fu_code(wbreg_io_in_fu_code),
    .io_in_lu_code(wbreg_io_in_lu_code),
    .io_in_lu_shift(wbreg_io_in_lu_shift),
    .io_in_csr_wen(wbreg_io_in_csr_wen),
    .io_in_csr_waddr(wbreg_io_in_csr_waddr),
    .io_in_csr_wdata(wbreg_io_in_csr_wdata),
    .io_out_valid(wbreg_io_out_valid),
    .io_out_rd_en(wbreg_io_out_rd_en),
    .io_out_rd_addr(wbreg_io_out_rd_addr),
    .io_out_alu_out(wbreg_io_out_alu_out),
    .io_out_bu_out(wbreg_io_out_bu_out),
    .io_out_mu_out(wbreg_io_out_mu_out),
    .io_out_du_out(wbreg_io_out_du_out),
    .io_out_csru_out(wbreg_io_out_csru_out),
    .io_out_fu_code(wbreg_io_out_fu_code),
    .io_out_lu_code(wbreg_io_out_lu_code),
    .io_out_lu_shift(wbreg_io_out_lu_shift),
    .io_out_csr_wen(wbreg_io_out_csr_wen),
    .io_out_csr_waddr(wbreg_io_out_csr_waddr),
    .io_out_csr_wdata(wbreg_io_out_csr_wdata)
  );
  ysyx_040596_RegfileConflict rfconflict ( // @[Pipeline.scala 115:29]
    .io_rs_valid(rfconflict_io_rs_valid),
    .io_rs1_en(rfconflict_io_rs1_en),
    .io_rs2_en(rfconflict_io_rs2_en),
    .io_rs1_addr(rfconflict_io_rs1_addr),
    .io_rs2_addr(rfconflict_io_rs2_addr),
    .io_rd1_valid(rfconflict_io_rd1_valid),
    .io_rd1_en(rfconflict_io_rd1_en),
    .io_rd1_addr(rfconflict_io_rd1_addr),
    .io_rd2_valid(rfconflict_io_rd2_valid),
    .io_rd2_en(rfconflict_io_rd2_en),
    .io_rd2_addr(rfconflict_io_rd2_addr),
    .io_rd3_valid(rfconflict_io_rd3_valid),
    .io_rd3_en(rfconflict_io_rd3_en),
    .io_rd3_addr(rfconflict_io_rd3_addr),
    .io_conflict(rfconflict_io_conflict)
  );
  assign io_imem_en = idreg_io_imem_en; // @[Pipeline.scala 123:25]
  assign io_imem_addr = idreg_io_imem_addr; // @[Pipeline.scala 122:25]
  assign io_dmem_ren = preamu_io_ren; // @[Pipeline.scala 240:21]
  assign io_dmem_raddr = preamu_io_raddr; // @[Pipeline.scala 241:21]
  assign io_dmem_wen = preamu_io_wen; // @[Pipeline.scala 242:21]
  assign io_dmem_waddr = preamu_io_waddr; // @[Pipeline.scala 243:21]
  assign io_dmem_wdata = preamu_io_wdata; // @[Pipeline.scala 244:21]
  assign io_dmem_wmask = preamu_io_wmask; // @[Pipeline.scala 245:21]
  assign io_dmem_transfer = {{29'd0}, preamu_io_transfer}; // @[Pipeline.scala 246:22]
  assign io_rs1_addr = idu_io_rs1_addr; // @[Pipeline.scala 138:21]
  assign io_rs2_addr = idu_io_rs2_addr; // @[Pipeline.scala 139:21]
  assign io_rfconflict = rfconflict_io_conflict; // @[Pipeline.scala 380:21]
  assign io_mu_code = exereg_io_out_mu_code; // @[Pipeline.scala 184:21]
  assign io_mu_op1 = exereg_io_out_op1; // @[Pipeline.scala 185:21]
  assign io_mu_op2 = exereg_io_out_op2; // @[Pipeline.scala 186:21]
  assign io_du_code = exereg_io_out_du_code; // @[Pipeline.scala 189:21]
  assign io_du_op1 = exereg_io_out_op1; // @[Pipeline.scala 190:21]
  assign io_du_op2 = exereg_io_out_op2; // @[Pipeline.scala 191:21]
  assign io_csr_raddr = ieu_io_csr_raddr; // @[Pipeline.scala 181:25]
  assign io_csr_wen = wbreg_io_out_csr_wen; // @[Pipeline.scala 390:21]
  assign io_csr_waddr = wbreg_io_out_csr_waddr; // @[Pipeline.scala 391:21]
  assign io_csr_wdata = wbreg_io_out_csr_wdata; // @[Pipeline.scala 392:21]
  assign io_id_ecall = 32'h73 == _io_id_fencei_T; // @[Pipeline.scala 143:38]
  assign io_id_mret = 32'h30200073 == _io_id_fencei_T; // @[Pipeline.scala 144:38]
  assign io_id_pc = idreg_io_out_pc; // @[Pipeline.scala 145:21]
  assign io_id_intr = idreg_io_out_intr; // @[Pipeline.scala 129:25]
  assign io_id_cause = idreg_io_out_cause; // @[Pipeline.scala 130:25]
  assign io_id_fencei = 32'h100f == _io_id_fencei_T; // @[Pipeline.scala 132:42]
  assign io_ie_valid = exereg_io_out_valid; // @[Pipeline.scala 376:21]
  assign io_mem_valid = memreg_io_out_valid; // @[Pipeline.scala 377:21]
  assign io_wb_valid = wbreg_io_out_valid; // @[Pipeline.scala 378:21]
  assign io_commit = wbreg_io_out_valid & ~io_stall_wb; // @[Pipeline.scala 366:46]
  assign io_rf_rd_en = wbreg_io_out_rd_en; // @[Pipeline.scala 386:21]
  assign io_rf_rd_addr = wbreg_io_out_rd_addr; // @[Pipeline.scala 387:21]
  assign io_rf_rd_data = wbu_io_out; // @[Pipeline.scala 388:21]
  assign ifu_reset = reset;
  assign ifu_io_jump_en = idu_io_jump_en; // @[Pipeline.scala 118:21]
  assign ifu_io_jump_pc = idu_io_jump_pc; // @[Pipeline.scala 119:21]
  assign ifu_io_pc = idreg_io_out_pc; // @[Pipeline.scala 120:21]
  assign idu_io_pc = idreg_io_out_pc; // @[Pipeline.scala 134:21]
  assign idu_io_inst = idreg_io_inst; // @[Pipeline.scala 135:21]
  assign idu_io_rs1_data = io_rs1_data; // @[Pipeline.scala 136:21]
  assign idu_io_rs2_data = io_rs2_data; // @[Pipeline.scala 137:21]
  assign idu_io_mtvec = io_csr_mtvec; // @[Pipeline.scala 140:21]
  assign idu_io_mepc = io_csr_mepc; // @[Pipeline.scala 141:21]
  assign idu_io_intr = idreg_io_out_intr; // @[Pipeline.scala 146:21]
  assign ieu_io_alu_code = exereg_io_out_alu_code; // @[Pipeline.scala 170:25]
  assign ieu_io_bu_code = exereg_io_out_bu_code; // @[Pipeline.scala 171:25]
  assign ieu_io_csru_code = exereg_io_out_csru_code; // @[Pipeline.scala 174:25]
  assign ieu_io_op1 = exereg_io_out_op1; // @[Pipeline.scala 175:25]
  assign ieu_io_op2 = exereg_io_out_op2; // @[Pipeline.scala 176:25]
  assign ieu_io_pc = exereg_io_out_pc; // @[Pipeline.scala 177:25]
  assign ieu_io_rs1_addr = exereg_io_out_rs1_addr; // @[Pipeline.scala 179:25]
  assign ieu_io_csr_rdata = io_csr_rdata; // @[Pipeline.scala 180:25]
  assign preamu_io_lu_code = memreg_io_out_lu_code; // @[Pipeline.scala 225:23]
  assign preamu_io_su_code = memreg_io_out_su_code; // @[Pipeline.scala 226:23]
  assign preamu_io_op1 = memreg_io_out_op1; // @[Pipeline.scala 227:23]
  assign preamu_io_op2 = memreg_io_out_op2; // @[Pipeline.scala 228:23]
  assign preamu_io_imm = memreg_io_out_imm; // @[Pipeline.scala 229:23]
  assign amu_io_lu_code = wbreg_io_out_lu_code; // @[Pipeline.scala 273:21]
  assign amu_io_lu_shift = wbreg_io_out_lu_shift; // @[Pipeline.scala 274:21]
  assign amu_io_rdata = io_dmem_rdata; // @[Pipeline.scala 275:21]
  assign wbu_io_fu_code = wbreg_io_out_fu_code; // @[Pipeline.scala 277:21]
  assign wbu_io_alu_out = wbreg_io_out_alu_out; // @[Pipeline.scala 278:21]
  assign wbu_io_bu_out = wbreg_io_out_bu_out; // @[Pipeline.scala 279:21]
  assign wbu_io_mu_out = wbreg_io_out_mu_out; // @[Pipeline.scala 280:21]
  assign wbu_io_du_out = wbreg_io_out_du_out; // @[Pipeline.scala 281:21]
  assign wbu_io_lu_out = amu_io_lu_out; // @[Pipeline.scala 283:21]
  assign wbu_io_csru_out = wbreg_io_out_csru_out; // @[Pipeline.scala 282:21]
  assign idreg_clock = clock;
  assign idreg_reset = reset;
  assign idreg_io_en = _commit_valid_T & _memreg_io_in_valid_T & _exereg_io_in_valid_T; // @[Pipeline.scala 368:70]
  assign idreg_io_in_valid = ifu_io_valid & ~io_intr; // @[Pipeline.scala 362:41]
  assign idreg_io_in_pc = ifu_io_next_pc; // @[Pipeline.scala 125:25]
  assign idreg_io_in_intr = io_intr; // @[Pipeline.scala 127:25]
  assign idreg_io_imem_data = io_imem_data; // @[Pipeline.scala 124:25]
  assign exereg_clock = clock;
  assign exereg_reset = reset;
  assign exereg_io_en = _commit_valid_T & _memreg_io_in_valid_T; // @[Pipeline.scala 369:54]
  assign exereg_io_in_valid = idreg_io_out_valid & ~io_stall_id; // @[Pipeline.scala 363:47]
  assign exereg_io_in_pc = idreg_io_out_pc; // @[Pipeline.scala 148:29]
  assign exereg_io_in_rd_en = idu_io_rd_en; // @[Pipeline.scala 152:29]
  assign exereg_io_in_rd_addr = idu_io_rd_addr; // @[Pipeline.scala 153:29]
  assign exereg_io_in_imm = idu_io_imm; // @[Pipeline.scala 154:29]
  assign exereg_io_in_op1 = idu_io_op1; // @[Pipeline.scala 155:29]
  assign exereg_io_in_op2 = idu_io_op2; // @[Pipeline.scala 156:29]
  assign exereg_io_in_fu_code = idu_io_decode_info_fu_code; // @[Pipeline.scala 158:29]
  assign exereg_io_in_alu_code = idu_io_decode_info_alu_code; // @[Pipeline.scala 159:29]
  assign exereg_io_in_bu_code = idu_io_decode_info_bu_code; // @[Pipeline.scala 160:29]
  assign exereg_io_in_lu_code = idu_io_decode_info_lu_code; // @[Pipeline.scala 163:29]
  assign exereg_io_in_su_code = idu_io_decode_info_su_code; // @[Pipeline.scala 164:29]
  assign exereg_io_in_mu_code = idu_io_decode_info_mu_code; // @[Pipeline.scala 161:29]
  assign exereg_io_in_du_code = idu_io_decode_info_du_code; // @[Pipeline.scala 162:29]
  assign exereg_io_in_csru_code = idu_io_decode_info_csru_code; // @[Pipeline.scala 165:29]
  assign exereg_io_in_rs1_addr = idu_io_rs1_addr; // @[Pipeline.scala 157:29]
  assign memreg_clock = clock;
  assign memreg_reset = reset;
  assign memreg_io_en = ~io_stall_wb; // @[Pipeline.scala 370:24]
  assign memreg_io_in_valid = exereg_io_out_valid & ~io_stall_ie; // @[Pipeline.scala 364:48]
  assign memreg_io_in_rd_en = exereg_io_out_rd_en; // @[Pipeline.scala 197:27]
  assign memreg_io_in_rd_addr = exereg_io_out_rd_addr; // @[Pipeline.scala 198:27]
  assign memreg_io_in_imm = exereg_io_out_imm; // @[Pipeline.scala 199:27]
  assign memreg_io_in_op1 = exereg_io_out_op1; // @[Pipeline.scala 200:27]
  assign memreg_io_in_op2 = exereg_io_out_op2; // @[Pipeline.scala 201:27]
  assign memreg_io_in_alu_out = ieu_io_alu_out; // @[Pipeline.scala 211:27]
  assign memreg_io_in_bu_out = ieu_io_bu_out; // @[Pipeline.scala 212:27]
  assign memreg_io_in_mu_out = io_mu_out; // @[Pipeline.scala 213:27]
  assign memreg_io_in_du_out = io_du_out; // @[Pipeline.scala 214:27]
  assign memreg_io_in_csru_out = ieu_io_csru_out; // @[Pipeline.scala 215:27]
  assign memreg_io_in_fu_code = exereg_io_out_fu_code; // @[Pipeline.scala 202:27]
  assign memreg_io_in_lu_code = exereg_io_out_lu_code; // @[Pipeline.scala 207:27]
  assign memreg_io_in_su_code = exereg_io_out_su_code; // @[Pipeline.scala 208:27]
  assign memreg_io_in_csr_wen = ieu_io_csr_wen; // @[Pipeline.scala 218:29]
  assign memreg_io_in_csr_waddr = ieu_io_csr_waddr; // @[Pipeline.scala 219:29]
  assign memreg_io_in_csr_wdata = ieu_io_csr_wdata; // @[Pipeline.scala 220:29]
  assign wbreg_clock = clock;
  assign wbreg_reset = reset;
  assign wbreg_io_en = ~io_stall_wb; // @[Pipeline.scala 371:24]
  assign wbreg_io_in_valid = memreg_io_out_valid; // @[Pipeline.scala 365:48]
  assign wbreg_io_in_rd_en = memreg_io_out_rd_en; // @[Pipeline.scala 252:27]
  assign wbreg_io_in_rd_addr = memreg_io_out_rd_addr; // @[Pipeline.scala 253:27]
  assign wbreg_io_in_alu_out = memreg_io_out_alu_out; // @[Pipeline.scala 254:27]
  assign wbreg_io_in_bu_out = memreg_io_out_bu_out; // @[Pipeline.scala 255:27]
  assign wbreg_io_in_mu_out = memreg_io_out_mu_out; // @[Pipeline.scala 256:27]
  assign wbreg_io_in_du_out = memreg_io_out_du_out; // @[Pipeline.scala 257:27]
  assign wbreg_io_in_csru_out = memreg_io_out_csru_out; // @[Pipeline.scala 258:27]
  assign wbreg_io_in_fu_code = memreg_io_out_fu_code; // @[Pipeline.scala 259:27]
  assign wbreg_io_in_lu_code = memreg_io_out_lu_code; // @[Pipeline.scala 260:27]
  assign wbreg_io_in_lu_shift = preamu_io_lu_shift; // @[Pipeline.scala 263:27]
  assign wbreg_io_in_csr_wen = memreg_io_out_csr_wen; // @[Pipeline.scala 266:27]
  assign wbreg_io_in_csr_waddr = memreg_io_out_csr_waddr; // @[Pipeline.scala 267:27]
  assign wbreg_io_in_csr_wdata = memreg_io_out_csr_wdata; // @[Pipeline.scala 268:27]
  assign rfconflict_io_rs_valid = idreg_io_out_valid; // @[Pipeline.scala 302:30]
  assign rfconflict_io_rs1_en = idu_io_rs1_en; // @[Pipeline.scala 303:30]
  assign rfconflict_io_rs2_en = idu_io_rs2_en; // @[Pipeline.scala 304:30]
  assign rfconflict_io_rs1_addr = idu_io_rs1_addr; // @[Pipeline.scala 305:30]
  assign rfconflict_io_rs2_addr = idu_io_rs2_addr; // @[Pipeline.scala 306:30]
  assign rfconflict_io_rd1_valid = exereg_io_out_valid; // @[Pipeline.scala 307:30]
  assign rfconflict_io_rd1_en = exereg_io_out_rd_en; // @[Pipeline.scala 308:30]
  assign rfconflict_io_rd1_addr = exereg_io_out_rd_addr; // @[Pipeline.scala 309:30]
  assign rfconflict_io_rd2_valid = memreg_io_out_valid; // @[Pipeline.scala 310:30]
  assign rfconflict_io_rd2_en = memreg_io_out_rd_en; // @[Pipeline.scala 311:30]
  assign rfconflict_io_rd2_addr = memreg_io_out_rd_addr; // @[Pipeline.scala 312:30]
  assign rfconflict_io_rd3_valid = wbreg_io_out_valid; // @[Pipeline.scala 313:30]
  assign rfconflict_io_rd3_en = wbreg_io_out_rd_en; // @[Pipeline.scala 314:30]
  assign rfconflict_io_rd3_addr = wbreg_io_out_rd_addr; // @[Pipeline.scala 315:30]
endmodule
module ysyx_040596_RegFile(
  input         clock,
  input         reset,
  input  [4:0]  io_rs1_addr,
  input  [4:0]  io_rs2_addr,
  output [63:0] io_rs1_data,
  output [63:0] io_rs2_data,
  input         io_rd_en,
  input  [4:0]  io_rd_addr,
  input  [63:0] io_rd_data
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [63:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [63:0] _RAND_7;
  reg [63:0] _RAND_8;
  reg [63:0] _RAND_9;
  reg [63:0] _RAND_10;
  reg [63:0] _RAND_11;
  reg [63:0] _RAND_12;
  reg [63:0] _RAND_13;
  reg [63:0] _RAND_14;
  reg [63:0] _RAND_15;
  reg [63:0] _RAND_16;
  reg [63:0] _RAND_17;
  reg [63:0] _RAND_18;
  reg [63:0] _RAND_19;
  reg [63:0] _RAND_20;
  reg [63:0] _RAND_21;
  reg [63:0] _RAND_22;
  reg [63:0] _RAND_23;
  reg [63:0] _RAND_24;
  reg [63:0] _RAND_25;
  reg [63:0] _RAND_26;
  reg [63:0] _RAND_27;
  reg [63:0] _RAND_28;
  reg [63:0] _RAND_29;
  reg [63:0] _RAND_30;
  reg [63:0] _RAND_31;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] rf_0; // @[RegFile.scala 32:21]
  reg [63:0] rf_1; // @[RegFile.scala 32:21]
  reg [63:0] rf_2; // @[RegFile.scala 32:21]
  reg [63:0] rf_3; // @[RegFile.scala 32:21]
  reg [63:0] rf_4; // @[RegFile.scala 32:21]
  reg [63:0] rf_5; // @[RegFile.scala 32:21]
  reg [63:0] rf_6; // @[RegFile.scala 32:21]
  reg [63:0] rf_7; // @[RegFile.scala 32:21]
  reg [63:0] rf_8; // @[RegFile.scala 32:21]
  reg [63:0] rf_9; // @[RegFile.scala 32:21]
  reg [63:0] rf_10; // @[RegFile.scala 32:21]
  reg [63:0] rf_11; // @[RegFile.scala 32:21]
  reg [63:0] rf_12; // @[RegFile.scala 32:21]
  reg [63:0] rf_13; // @[RegFile.scala 32:21]
  reg [63:0] rf_14; // @[RegFile.scala 32:21]
  reg [63:0] rf_15; // @[RegFile.scala 32:21]
  reg [63:0] rf_16; // @[RegFile.scala 32:21]
  reg [63:0] rf_17; // @[RegFile.scala 32:21]
  reg [63:0] rf_18; // @[RegFile.scala 32:21]
  reg [63:0] rf_19; // @[RegFile.scala 32:21]
  reg [63:0] rf_20; // @[RegFile.scala 32:21]
  reg [63:0] rf_21; // @[RegFile.scala 32:21]
  reg [63:0] rf_22; // @[RegFile.scala 32:21]
  reg [63:0] rf_23; // @[RegFile.scala 32:21]
  reg [63:0] rf_24; // @[RegFile.scala 32:21]
  reg [63:0] rf_25; // @[RegFile.scala 32:21]
  reg [63:0] rf_26; // @[RegFile.scala 32:21]
  reg [63:0] rf_27; // @[RegFile.scala 32:21]
  reg [63:0] rf_28; // @[RegFile.scala 32:21]
  reg [63:0] rf_29; // @[RegFile.scala 32:21]
  reg [63:0] rf_30; // @[RegFile.scala 32:21]
  reg [63:0] rf_31; // @[RegFile.scala 32:21]
  wire [63:0] _GEN_65 = 5'h1 == io_rs1_addr ? rf_1 : rf_0; // @[RegFile.scala 36:23 RegFile.scala 36:23]
  wire [63:0] _GEN_66 = 5'h2 == io_rs1_addr ? rf_2 : _GEN_65; // @[RegFile.scala 36:23 RegFile.scala 36:23]
  wire [63:0] _GEN_67 = 5'h3 == io_rs1_addr ? rf_3 : _GEN_66; // @[RegFile.scala 36:23 RegFile.scala 36:23]
  wire [63:0] _GEN_68 = 5'h4 == io_rs1_addr ? rf_4 : _GEN_67; // @[RegFile.scala 36:23 RegFile.scala 36:23]
  wire [63:0] _GEN_69 = 5'h5 == io_rs1_addr ? rf_5 : _GEN_68; // @[RegFile.scala 36:23 RegFile.scala 36:23]
  wire [63:0] _GEN_70 = 5'h6 == io_rs1_addr ? rf_6 : _GEN_69; // @[RegFile.scala 36:23 RegFile.scala 36:23]
  wire [63:0] _GEN_71 = 5'h7 == io_rs1_addr ? rf_7 : _GEN_70; // @[RegFile.scala 36:23 RegFile.scala 36:23]
  wire [63:0] _GEN_72 = 5'h8 == io_rs1_addr ? rf_8 : _GEN_71; // @[RegFile.scala 36:23 RegFile.scala 36:23]
  wire [63:0] _GEN_73 = 5'h9 == io_rs1_addr ? rf_9 : _GEN_72; // @[RegFile.scala 36:23 RegFile.scala 36:23]
  wire [63:0] _GEN_74 = 5'ha == io_rs1_addr ? rf_10 : _GEN_73; // @[RegFile.scala 36:23 RegFile.scala 36:23]
  wire [63:0] _GEN_75 = 5'hb == io_rs1_addr ? rf_11 : _GEN_74; // @[RegFile.scala 36:23 RegFile.scala 36:23]
  wire [63:0] _GEN_76 = 5'hc == io_rs1_addr ? rf_12 : _GEN_75; // @[RegFile.scala 36:23 RegFile.scala 36:23]
  wire [63:0] _GEN_77 = 5'hd == io_rs1_addr ? rf_13 : _GEN_76; // @[RegFile.scala 36:23 RegFile.scala 36:23]
  wire [63:0] _GEN_78 = 5'he == io_rs1_addr ? rf_14 : _GEN_77; // @[RegFile.scala 36:23 RegFile.scala 36:23]
  wire [63:0] _GEN_79 = 5'hf == io_rs1_addr ? rf_15 : _GEN_78; // @[RegFile.scala 36:23 RegFile.scala 36:23]
  wire [63:0] _GEN_80 = 5'h10 == io_rs1_addr ? rf_16 : _GEN_79; // @[RegFile.scala 36:23 RegFile.scala 36:23]
  wire [63:0] _GEN_81 = 5'h11 == io_rs1_addr ? rf_17 : _GEN_80; // @[RegFile.scala 36:23 RegFile.scala 36:23]
  wire [63:0] _GEN_82 = 5'h12 == io_rs1_addr ? rf_18 : _GEN_81; // @[RegFile.scala 36:23 RegFile.scala 36:23]
  wire [63:0] _GEN_83 = 5'h13 == io_rs1_addr ? rf_19 : _GEN_82; // @[RegFile.scala 36:23 RegFile.scala 36:23]
  wire [63:0] _GEN_84 = 5'h14 == io_rs1_addr ? rf_20 : _GEN_83; // @[RegFile.scala 36:23 RegFile.scala 36:23]
  wire [63:0] _GEN_85 = 5'h15 == io_rs1_addr ? rf_21 : _GEN_84; // @[RegFile.scala 36:23 RegFile.scala 36:23]
  wire [63:0] _GEN_86 = 5'h16 == io_rs1_addr ? rf_22 : _GEN_85; // @[RegFile.scala 36:23 RegFile.scala 36:23]
  wire [63:0] _GEN_87 = 5'h17 == io_rs1_addr ? rf_23 : _GEN_86; // @[RegFile.scala 36:23 RegFile.scala 36:23]
  wire [63:0] _GEN_88 = 5'h18 == io_rs1_addr ? rf_24 : _GEN_87; // @[RegFile.scala 36:23 RegFile.scala 36:23]
  wire [63:0] _GEN_89 = 5'h19 == io_rs1_addr ? rf_25 : _GEN_88; // @[RegFile.scala 36:23 RegFile.scala 36:23]
  wire [63:0] _GEN_90 = 5'h1a == io_rs1_addr ? rf_26 : _GEN_89; // @[RegFile.scala 36:23 RegFile.scala 36:23]
  wire [63:0] _GEN_91 = 5'h1b == io_rs1_addr ? rf_27 : _GEN_90; // @[RegFile.scala 36:23 RegFile.scala 36:23]
  wire [63:0] _GEN_92 = 5'h1c == io_rs1_addr ? rf_28 : _GEN_91; // @[RegFile.scala 36:23 RegFile.scala 36:23]
  wire [63:0] _GEN_93 = 5'h1d == io_rs1_addr ? rf_29 : _GEN_92; // @[RegFile.scala 36:23 RegFile.scala 36:23]
  wire [63:0] _GEN_94 = 5'h1e == io_rs1_addr ? rf_30 : _GEN_93; // @[RegFile.scala 36:23 RegFile.scala 36:23]
  wire [63:0] _GEN_95 = 5'h1f == io_rs1_addr ? rf_31 : _GEN_94; // @[RegFile.scala 36:23 RegFile.scala 36:23]
  wire [63:0] _GEN_97 = 5'h1 == io_rs2_addr ? rf_1 : rf_0; // @[RegFile.scala 37:23 RegFile.scala 37:23]
  wire [63:0] _GEN_98 = 5'h2 == io_rs2_addr ? rf_2 : _GEN_97; // @[RegFile.scala 37:23 RegFile.scala 37:23]
  wire [63:0] _GEN_99 = 5'h3 == io_rs2_addr ? rf_3 : _GEN_98; // @[RegFile.scala 37:23 RegFile.scala 37:23]
  wire [63:0] _GEN_100 = 5'h4 == io_rs2_addr ? rf_4 : _GEN_99; // @[RegFile.scala 37:23 RegFile.scala 37:23]
  wire [63:0] _GEN_101 = 5'h5 == io_rs2_addr ? rf_5 : _GEN_100; // @[RegFile.scala 37:23 RegFile.scala 37:23]
  wire [63:0] _GEN_102 = 5'h6 == io_rs2_addr ? rf_6 : _GEN_101; // @[RegFile.scala 37:23 RegFile.scala 37:23]
  wire [63:0] _GEN_103 = 5'h7 == io_rs2_addr ? rf_7 : _GEN_102; // @[RegFile.scala 37:23 RegFile.scala 37:23]
  wire [63:0] _GEN_104 = 5'h8 == io_rs2_addr ? rf_8 : _GEN_103; // @[RegFile.scala 37:23 RegFile.scala 37:23]
  wire [63:0] _GEN_105 = 5'h9 == io_rs2_addr ? rf_9 : _GEN_104; // @[RegFile.scala 37:23 RegFile.scala 37:23]
  wire [63:0] _GEN_106 = 5'ha == io_rs2_addr ? rf_10 : _GEN_105; // @[RegFile.scala 37:23 RegFile.scala 37:23]
  wire [63:0] _GEN_107 = 5'hb == io_rs2_addr ? rf_11 : _GEN_106; // @[RegFile.scala 37:23 RegFile.scala 37:23]
  wire [63:0] _GEN_108 = 5'hc == io_rs2_addr ? rf_12 : _GEN_107; // @[RegFile.scala 37:23 RegFile.scala 37:23]
  wire [63:0] _GEN_109 = 5'hd == io_rs2_addr ? rf_13 : _GEN_108; // @[RegFile.scala 37:23 RegFile.scala 37:23]
  wire [63:0] _GEN_110 = 5'he == io_rs2_addr ? rf_14 : _GEN_109; // @[RegFile.scala 37:23 RegFile.scala 37:23]
  wire [63:0] _GEN_111 = 5'hf == io_rs2_addr ? rf_15 : _GEN_110; // @[RegFile.scala 37:23 RegFile.scala 37:23]
  wire [63:0] _GEN_112 = 5'h10 == io_rs2_addr ? rf_16 : _GEN_111; // @[RegFile.scala 37:23 RegFile.scala 37:23]
  wire [63:0] _GEN_113 = 5'h11 == io_rs2_addr ? rf_17 : _GEN_112; // @[RegFile.scala 37:23 RegFile.scala 37:23]
  wire [63:0] _GEN_114 = 5'h12 == io_rs2_addr ? rf_18 : _GEN_113; // @[RegFile.scala 37:23 RegFile.scala 37:23]
  wire [63:0] _GEN_115 = 5'h13 == io_rs2_addr ? rf_19 : _GEN_114; // @[RegFile.scala 37:23 RegFile.scala 37:23]
  wire [63:0] _GEN_116 = 5'h14 == io_rs2_addr ? rf_20 : _GEN_115; // @[RegFile.scala 37:23 RegFile.scala 37:23]
  wire [63:0] _GEN_117 = 5'h15 == io_rs2_addr ? rf_21 : _GEN_116; // @[RegFile.scala 37:23 RegFile.scala 37:23]
  wire [63:0] _GEN_118 = 5'h16 == io_rs2_addr ? rf_22 : _GEN_117; // @[RegFile.scala 37:23 RegFile.scala 37:23]
  wire [63:0] _GEN_119 = 5'h17 == io_rs2_addr ? rf_23 : _GEN_118; // @[RegFile.scala 37:23 RegFile.scala 37:23]
  wire [63:0] _GEN_120 = 5'h18 == io_rs2_addr ? rf_24 : _GEN_119; // @[RegFile.scala 37:23 RegFile.scala 37:23]
  wire [63:0] _GEN_121 = 5'h19 == io_rs2_addr ? rf_25 : _GEN_120; // @[RegFile.scala 37:23 RegFile.scala 37:23]
  wire [63:0] _GEN_122 = 5'h1a == io_rs2_addr ? rf_26 : _GEN_121; // @[RegFile.scala 37:23 RegFile.scala 37:23]
  wire [63:0] _GEN_123 = 5'h1b == io_rs2_addr ? rf_27 : _GEN_122; // @[RegFile.scala 37:23 RegFile.scala 37:23]
  wire [63:0] _GEN_124 = 5'h1c == io_rs2_addr ? rf_28 : _GEN_123; // @[RegFile.scala 37:23 RegFile.scala 37:23]
  wire [63:0] _GEN_125 = 5'h1d == io_rs2_addr ? rf_29 : _GEN_124; // @[RegFile.scala 37:23 RegFile.scala 37:23]
  wire [63:0] _GEN_126 = 5'h1e == io_rs2_addr ? rf_30 : _GEN_125; // @[RegFile.scala 37:23 RegFile.scala 37:23]
  wire [63:0] _GEN_127 = 5'h1f == io_rs2_addr ? rf_31 : _GEN_126; // @[RegFile.scala 37:23 RegFile.scala 37:23]
  assign io_rs1_data = io_rs1_addr != 5'h0 ? _GEN_95 : 64'h0; // @[RegFile.scala 36:23]
  assign io_rs2_data = io_rs2_addr != 5'h0 ? _GEN_127 : 64'h0; // @[RegFile.scala 37:23]
  always @(posedge clock) begin
    if (reset) begin // @[RegFile.scala 32:21]
      rf_0 <= 64'h0; // @[RegFile.scala 32:21]
    end else if (io_rd_en & io_rd_addr != 5'h0) begin // @[RegFile.scala 33:45]
      if (5'h0 == io_rd_addr) begin // @[RegFile.scala 34:22]
        rf_0 <= io_rd_data; // @[RegFile.scala 34:22]
      end
    end
    if (reset) begin // @[RegFile.scala 32:21]
      rf_1 <= 64'h0; // @[RegFile.scala 32:21]
    end else if (io_rd_en & io_rd_addr != 5'h0) begin // @[RegFile.scala 33:45]
      if (5'h1 == io_rd_addr) begin // @[RegFile.scala 34:22]
        rf_1 <= io_rd_data; // @[RegFile.scala 34:22]
      end
    end
    if (reset) begin // @[RegFile.scala 32:21]
      rf_2 <= 64'h0; // @[RegFile.scala 32:21]
    end else if (io_rd_en & io_rd_addr != 5'h0) begin // @[RegFile.scala 33:45]
      if (5'h2 == io_rd_addr) begin // @[RegFile.scala 34:22]
        rf_2 <= io_rd_data; // @[RegFile.scala 34:22]
      end
    end
    if (reset) begin // @[RegFile.scala 32:21]
      rf_3 <= 64'h0; // @[RegFile.scala 32:21]
    end else if (io_rd_en & io_rd_addr != 5'h0) begin // @[RegFile.scala 33:45]
      if (5'h3 == io_rd_addr) begin // @[RegFile.scala 34:22]
        rf_3 <= io_rd_data; // @[RegFile.scala 34:22]
      end
    end
    if (reset) begin // @[RegFile.scala 32:21]
      rf_4 <= 64'h0; // @[RegFile.scala 32:21]
    end else if (io_rd_en & io_rd_addr != 5'h0) begin // @[RegFile.scala 33:45]
      if (5'h4 == io_rd_addr) begin // @[RegFile.scala 34:22]
        rf_4 <= io_rd_data; // @[RegFile.scala 34:22]
      end
    end
    if (reset) begin // @[RegFile.scala 32:21]
      rf_5 <= 64'h0; // @[RegFile.scala 32:21]
    end else if (io_rd_en & io_rd_addr != 5'h0) begin // @[RegFile.scala 33:45]
      if (5'h5 == io_rd_addr) begin // @[RegFile.scala 34:22]
        rf_5 <= io_rd_data; // @[RegFile.scala 34:22]
      end
    end
    if (reset) begin // @[RegFile.scala 32:21]
      rf_6 <= 64'h0; // @[RegFile.scala 32:21]
    end else if (io_rd_en & io_rd_addr != 5'h0) begin // @[RegFile.scala 33:45]
      if (5'h6 == io_rd_addr) begin // @[RegFile.scala 34:22]
        rf_6 <= io_rd_data; // @[RegFile.scala 34:22]
      end
    end
    if (reset) begin // @[RegFile.scala 32:21]
      rf_7 <= 64'h0; // @[RegFile.scala 32:21]
    end else if (io_rd_en & io_rd_addr != 5'h0) begin // @[RegFile.scala 33:45]
      if (5'h7 == io_rd_addr) begin // @[RegFile.scala 34:22]
        rf_7 <= io_rd_data; // @[RegFile.scala 34:22]
      end
    end
    if (reset) begin // @[RegFile.scala 32:21]
      rf_8 <= 64'h0; // @[RegFile.scala 32:21]
    end else if (io_rd_en & io_rd_addr != 5'h0) begin // @[RegFile.scala 33:45]
      if (5'h8 == io_rd_addr) begin // @[RegFile.scala 34:22]
        rf_8 <= io_rd_data; // @[RegFile.scala 34:22]
      end
    end
    if (reset) begin // @[RegFile.scala 32:21]
      rf_9 <= 64'h0; // @[RegFile.scala 32:21]
    end else if (io_rd_en & io_rd_addr != 5'h0) begin // @[RegFile.scala 33:45]
      if (5'h9 == io_rd_addr) begin // @[RegFile.scala 34:22]
        rf_9 <= io_rd_data; // @[RegFile.scala 34:22]
      end
    end
    if (reset) begin // @[RegFile.scala 32:21]
      rf_10 <= 64'h0; // @[RegFile.scala 32:21]
    end else if (io_rd_en & io_rd_addr != 5'h0) begin // @[RegFile.scala 33:45]
      if (5'ha == io_rd_addr) begin // @[RegFile.scala 34:22]
        rf_10 <= io_rd_data; // @[RegFile.scala 34:22]
      end
    end
    if (reset) begin // @[RegFile.scala 32:21]
      rf_11 <= 64'h0; // @[RegFile.scala 32:21]
    end else if (io_rd_en & io_rd_addr != 5'h0) begin // @[RegFile.scala 33:45]
      if (5'hb == io_rd_addr) begin // @[RegFile.scala 34:22]
        rf_11 <= io_rd_data; // @[RegFile.scala 34:22]
      end
    end
    if (reset) begin // @[RegFile.scala 32:21]
      rf_12 <= 64'h0; // @[RegFile.scala 32:21]
    end else if (io_rd_en & io_rd_addr != 5'h0) begin // @[RegFile.scala 33:45]
      if (5'hc == io_rd_addr) begin // @[RegFile.scala 34:22]
        rf_12 <= io_rd_data; // @[RegFile.scala 34:22]
      end
    end
    if (reset) begin // @[RegFile.scala 32:21]
      rf_13 <= 64'h0; // @[RegFile.scala 32:21]
    end else if (io_rd_en & io_rd_addr != 5'h0) begin // @[RegFile.scala 33:45]
      if (5'hd == io_rd_addr) begin // @[RegFile.scala 34:22]
        rf_13 <= io_rd_data; // @[RegFile.scala 34:22]
      end
    end
    if (reset) begin // @[RegFile.scala 32:21]
      rf_14 <= 64'h0; // @[RegFile.scala 32:21]
    end else if (io_rd_en & io_rd_addr != 5'h0) begin // @[RegFile.scala 33:45]
      if (5'he == io_rd_addr) begin // @[RegFile.scala 34:22]
        rf_14 <= io_rd_data; // @[RegFile.scala 34:22]
      end
    end
    if (reset) begin // @[RegFile.scala 32:21]
      rf_15 <= 64'h0; // @[RegFile.scala 32:21]
    end else if (io_rd_en & io_rd_addr != 5'h0) begin // @[RegFile.scala 33:45]
      if (5'hf == io_rd_addr) begin // @[RegFile.scala 34:22]
        rf_15 <= io_rd_data; // @[RegFile.scala 34:22]
      end
    end
    if (reset) begin // @[RegFile.scala 32:21]
      rf_16 <= 64'h0; // @[RegFile.scala 32:21]
    end else if (io_rd_en & io_rd_addr != 5'h0) begin // @[RegFile.scala 33:45]
      if (5'h10 == io_rd_addr) begin // @[RegFile.scala 34:22]
        rf_16 <= io_rd_data; // @[RegFile.scala 34:22]
      end
    end
    if (reset) begin // @[RegFile.scala 32:21]
      rf_17 <= 64'h0; // @[RegFile.scala 32:21]
    end else if (io_rd_en & io_rd_addr != 5'h0) begin // @[RegFile.scala 33:45]
      if (5'h11 == io_rd_addr) begin // @[RegFile.scala 34:22]
        rf_17 <= io_rd_data; // @[RegFile.scala 34:22]
      end
    end
    if (reset) begin // @[RegFile.scala 32:21]
      rf_18 <= 64'h0; // @[RegFile.scala 32:21]
    end else if (io_rd_en & io_rd_addr != 5'h0) begin // @[RegFile.scala 33:45]
      if (5'h12 == io_rd_addr) begin // @[RegFile.scala 34:22]
        rf_18 <= io_rd_data; // @[RegFile.scala 34:22]
      end
    end
    if (reset) begin // @[RegFile.scala 32:21]
      rf_19 <= 64'h0; // @[RegFile.scala 32:21]
    end else if (io_rd_en & io_rd_addr != 5'h0) begin // @[RegFile.scala 33:45]
      if (5'h13 == io_rd_addr) begin // @[RegFile.scala 34:22]
        rf_19 <= io_rd_data; // @[RegFile.scala 34:22]
      end
    end
    if (reset) begin // @[RegFile.scala 32:21]
      rf_20 <= 64'h0; // @[RegFile.scala 32:21]
    end else if (io_rd_en & io_rd_addr != 5'h0) begin // @[RegFile.scala 33:45]
      if (5'h14 == io_rd_addr) begin // @[RegFile.scala 34:22]
        rf_20 <= io_rd_data; // @[RegFile.scala 34:22]
      end
    end
    if (reset) begin // @[RegFile.scala 32:21]
      rf_21 <= 64'h0; // @[RegFile.scala 32:21]
    end else if (io_rd_en & io_rd_addr != 5'h0) begin // @[RegFile.scala 33:45]
      if (5'h15 == io_rd_addr) begin // @[RegFile.scala 34:22]
        rf_21 <= io_rd_data; // @[RegFile.scala 34:22]
      end
    end
    if (reset) begin // @[RegFile.scala 32:21]
      rf_22 <= 64'h0; // @[RegFile.scala 32:21]
    end else if (io_rd_en & io_rd_addr != 5'h0) begin // @[RegFile.scala 33:45]
      if (5'h16 == io_rd_addr) begin // @[RegFile.scala 34:22]
        rf_22 <= io_rd_data; // @[RegFile.scala 34:22]
      end
    end
    if (reset) begin // @[RegFile.scala 32:21]
      rf_23 <= 64'h0; // @[RegFile.scala 32:21]
    end else if (io_rd_en & io_rd_addr != 5'h0) begin // @[RegFile.scala 33:45]
      if (5'h17 == io_rd_addr) begin // @[RegFile.scala 34:22]
        rf_23 <= io_rd_data; // @[RegFile.scala 34:22]
      end
    end
    if (reset) begin // @[RegFile.scala 32:21]
      rf_24 <= 64'h0; // @[RegFile.scala 32:21]
    end else if (io_rd_en & io_rd_addr != 5'h0) begin // @[RegFile.scala 33:45]
      if (5'h18 == io_rd_addr) begin // @[RegFile.scala 34:22]
        rf_24 <= io_rd_data; // @[RegFile.scala 34:22]
      end
    end
    if (reset) begin // @[RegFile.scala 32:21]
      rf_25 <= 64'h0; // @[RegFile.scala 32:21]
    end else if (io_rd_en & io_rd_addr != 5'h0) begin // @[RegFile.scala 33:45]
      if (5'h19 == io_rd_addr) begin // @[RegFile.scala 34:22]
        rf_25 <= io_rd_data; // @[RegFile.scala 34:22]
      end
    end
    if (reset) begin // @[RegFile.scala 32:21]
      rf_26 <= 64'h0; // @[RegFile.scala 32:21]
    end else if (io_rd_en & io_rd_addr != 5'h0) begin // @[RegFile.scala 33:45]
      if (5'h1a == io_rd_addr) begin // @[RegFile.scala 34:22]
        rf_26 <= io_rd_data; // @[RegFile.scala 34:22]
      end
    end
    if (reset) begin // @[RegFile.scala 32:21]
      rf_27 <= 64'h0; // @[RegFile.scala 32:21]
    end else if (io_rd_en & io_rd_addr != 5'h0) begin // @[RegFile.scala 33:45]
      if (5'h1b == io_rd_addr) begin // @[RegFile.scala 34:22]
        rf_27 <= io_rd_data; // @[RegFile.scala 34:22]
      end
    end
    if (reset) begin // @[RegFile.scala 32:21]
      rf_28 <= 64'h0; // @[RegFile.scala 32:21]
    end else if (io_rd_en & io_rd_addr != 5'h0) begin // @[RegFile.scala 33:45]
      if (5'h1c == io_rd_addr) begin // @[RegFile.scala 34:22]
        rf_28 <= io_rd_data; // @[RegFile.scala 34:22]
      end
    end
    if (reset) begin // @[RegFile.scala 32:21]
      rf_29 <= 64'h0; // @[RegFile.scala 32:21]
    end else if (io_rd_en & io_rd_addr != 5'h0) begin // @[RegFile.scala 33:45]
      if (5'h1d == io_rd_addr) begin // @[RegFile.scala 34:22]
        rf_29 <= io_rd_data; // @[RegFile.scala 34:22]
      end
    end
    if (reset) begin // @[RegFile.scala 32:21]
      rf_30 <= 64'h0; // @[RegFile.scala 32:21]
    end else if (io_rd_en & io_rd_addr != 5'h0) begin // @[RegFile.scala 33:45]
      if (5'h1e == io_rd_addr) begin // @[RegFile.scala 34:22]
        rf_30 <= io_rd_data; // @[RegFile.scala 34:22]
      end
    end
    if (reset) begin // @[RegFile.scala 32:21]
      rf_31 <= 64'h0; // @[RegFile.scala 32:21]
    end else if (io_rd_en & io_rd_addr != 5'h0) begin // @[RegFile.scala 33:45]
      if (5'h1f == io_rd_addr) begin // @[RegFile.scala 34:22]
        rf_31 <= io_rd_data; // @[RegFile.scala 34:22]
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {2{`RANDOM}};
  rf_0 = _RAND_0[63:0];
  _RAND_1 = {2{`RANDOM}};
  rf_1 = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  rf_2 = _RAND_2[63:0];
  _RAND_3 = {2{`RANDOM}};
  rf_3 = _RAND_3[63:0];
  _RAND_4 = {2{`RANDOM}};
  rf_4 = _RAND_4[63:0];
  _RAND_5 = {2{`RANDOM}};
  rf_5 = _RAND_5[63:0];
  _RAND_6 = {2{`RANDOM}};
  rf_6 = _RAND_6[63:0];
  _RAND_7 = {2{`RANDOM}};
  rf_7 = _RAND_7[63:0];
  _RAND_8 = {2{`RANDOM}};
  rf_8 = _RAND_8[63:0];
  _RAND_9 = {2{`RANDOM}};
  rf_9 = _RAND_9[63:0];
  _RAND_10 = {2{`RANDOM}};
  rf_10 = _RAND_10[63:0];
  _RAND_11 = {2{`RANDOM}};
  rf_11 = _RAND_11[63:0];
  _RAND_12 = {2{`RANDOM}};
  rf_12 = _RAND_12[63:0];
  _RAND_13 = {2{`RANDOM}};
  rf_13 = _RAND_13[63:0];
  _RAND_14 = {2{`RANDOM}};
  rf_14 = _RAND_14[63:0];
  _RAND_15 = {2{`RANDOM}};
  rf_15 = _RAND_15[63:0];
  _RAND_16 = {2{`RANDOM}};
  rf_16 = _RAND_16[63:0];
  _RAND_17 = {2{`RANDOM}};
  rf_17 = _RAND_17[63:0];
  _RAND_18 = {2{`RANDOM}};
  rf_18 = _RAND_18[63:0];
  _RAND_19 = {2{`RANDOM}};
  rf_19 = _RAND_19[63:0];
  _RAND_20 = {2{`RANDOM}};
  rf_20 = _RAND_20[63:0];
  _RAND_21 = {2{`RANDOM}};
  rf_21 = _RAND_21[63:0];
  _RAND_22 = {2{`RANDOM}};
  rf_22 = _RAND_22[63:0];
  _RAND_23 = {2{`RANDOM}};
  rf_23 = _RAND_23[63:0];
  _RAND_24 = {2{`RANDOM}};
  rf_24 = _RAND_24[63:0];
  _RAND_25 = {2{`RANDOM}};
  rf_25 = _RAND_25[63:0];
  _RAND_26 = {2{`RANDOM}};
  rf_26 = _RAND_26[63:0];
  _RAND_27 = {2{`RANDOM}};
  rf_27 = _RAND_27[63:0];
  _RAND_28 = {2{`RANDOM}};
  rf_28 = _RAND_28[63:0];
  _RAND_29 = {2{`RANDOM}};
  rf_29 = _RAND_29[63:0];
  _RAND_30 = {2{`RANDOM}};
  rf_30 = _RAND_30[63:0];
  _RAND_31 = {2{`RANDOM}};
  rf_31 = _RAND_31[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_040596_Csr(
  input         clock,
  input         reset,
  input  [11:0] io_raddr,
  output [63:0] io_rdata,
  input         io_wen,
  input  [11:0] io_waddr,
  input  [63:0] io_wdata,
  output [63:0] io_mtvec,
  output [63:0] io_mepc,
  input         io_ecall,
  input         io_mret,
  input  [63:0] io_pc,
  output        io_time_intr,
  input         io_interrupt,
  input  [63:0] io_cause
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [63:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [63:0] _RAND_7;
  reg [63:0] _RAND_8;
  reg [63:0] _RAND_9;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] mstatus; // @[Csr.scala 45:30]
  reg [63:0] mtvec; // @[Csr.scala 46:30]
  reg [63:0] mepc; // @[Csr.scala 47:30]
  reg [63:0] mcause; // @[Csr.scala 48:30]
  reg [63:0] mcycle; // @[Csr.scala 49:30]
  reg [63:0] mhartid; // @[Csr.scala 51:30]
  reg [63:0] mie; // @[Csr.scala 52:30]
  reg [63:0] mip; // @[Csr.scala 53:30]
  reg [63:0] mscratch; // @[Csr.scala 54:30]
  reg [63:0] satp; // @[Csr.scala 55:30]
  wire [63:0] _io_rdata_T_1 = 12'h300 == io_raddr ? mstatus : 64'h0; // @[Mux.scala 80:57]
  wire [63:0] _io_rdata_T_3 = 12'h305 == io_raddr ? mtvec : _io_rdata_T_1; // @[Mux.scala 80:57]
  wire [63:0] _io_rdata_T_5 = 12'h341 == io_raddr ? mepc : _io_rdata_T_3; // @[Mux.scala 80:57]
  wire [63:0] _io_rdata_T_7 = 12'h342 == io_raddr ? mcause : _io_rdata_T_5; // @[Mux.scala 80:57]
  wire [63:0] _io_rdata_T_9 = 12'hb00 == io_raddr ? mcycle : _io_rdata_T_7; // @[Mux.scala 80:57]
  wire [63:0] _io_rdata_T_11 = 12'hf14 == io_raddr ? mhartid : _io_rdata_T_9; // @[Mux.scala 80:57]
  wire [63:0] _io_rdata_T_13 = 12'h304 == io_raddr ? mie : _io_rdata_T_11; // @[Mux.scala 80:57]
  wire [63:0] _io_rdata_T_15 = 12'h344 == io_raddr ? mip : _io_rdata_T_13; // @[Mux.scala 80:57]
  wire [63:0] _io_rdata_T_17 = 12'h340 == io_raddr ? mscratch : _io_rdata_T_15; // @[Mux.scala 80:57]
  wire [63:0] _mcycle_T_3 = mcycle + 64'h1; // @[Csr.scala 70:68]
  wire  mstatus_SD = io_wdata[14:13] == 2'h3 | io_wdata[16:15] == 2'h3; // @[Csr.scala 72:60]
  wire  _T = io_interrupt | io_ecall; // @[Csr.scala 74:23]
  wire [50:0] mstatus_hi_hi_hi = mstatus[63:13]; // @[Csr.scala 75:31]
  wire [2:0] mstatus_hi_lo_hi = mstatus[10:8]; // @[Csr.scala 75:61]
  wire  mstatus_hi_lo_lo = mstatus[3]; // @[Csr.scala 75:76]
  wire [2:0] mstatus_lo_hi_hi = mstatus[6:4]; // @[Csr.scala 75:88]
  wire [2:0] mstatus_lo_lo = mstatus[2:0]; // @[Csr.scala 75:108]
  wire [63:0] _mstatus_T = {mstatus_hi_hi_hi,2'h3,mstatus_hi_lo_hi,mstatus_hi_lo_lo,mstatus_lo_hi_hi,1'h0,mstatus_lo_lo}
    ; // @[Cat.scala 30:58]
  wire  mstatus_lo_hi_lo = mstatus[7]; // @[Csr.scala 78:96]
  wire [63:0] _mstatus_T_1 = {mstatus_hi_hi_hi,2'h0,mstatus_hi_lo_hi,1'h1,mstatus_lo_hi_hi,mstatus_lo_hi_lo,
    mstatus_lo_lo}; // @[Cat.scala 30:58]
  wire [62:0] mstatus_lo_2 = io_wdata[62:0]; // @[Csr.scala 81:44]
  wire [63:0] _mstatus_T_2 = {mstatus_SD,mstatus_lo_2}; // @[Cat.scala 30:58]
  wire [61:0] mepc_hi = io_wdata[63:2]; // @[Csr.scala 90:65]
  wire [63:0] _mepc_T = {mepc_hi,2'h0}; // @[Cat.scala 30:58]
  wire [55:0] mip_hi_hi = io_wdata[63:8]; // @[Csr.scala 100:63]
  wire  mip_hi_lo = mip[7]; // @[Csr.scala 100:75]
  wire [6:0] mip_lo = io_wdata[6:0]; // @[Csr.scala 100:88]
  wire [63:0] _mip_T_2 = {mip_hi_hi,mip_hi_lo,mip_lo}; // @[Cat.scala 30:58]
  assign io_rdata = 12'h180 == io_raddr ? satp : _io_rdata_T_17; // @[Mux.scala 80:57]
  assign io_mtvec = mtvec; // @[Csr.scala 110:14]
  assign io_mepc = mepc; // @[Csr.scala 111:14]
  assign io_time_intr = mip_hi_lo & mie[7] & mstatus_hi_lo_lo; // @[Csr.scala 112:38]
  always @(posedge clock) begin
    if (reset) begin // @[Csr.scala 45:30]
      mstatus <= 64'ha00001800; // @[Csr.scala 45:30]
    end else if (io_interrupt | io_ecall) begin // @[Csr.scala 74:35]
      mstatus <= _mstatus_T; // @[Csr.scala 75:17]
    end else if (io_mret) begin // @[Csr.scala 77:23]
      mstatus <= _mstatus_T_1; // @[Csr.scala 78:17]
    end else if (io_wen & io_waddr == 12'h300) begin // @[Csr.scala 80:46]
      mstatus <= _mstatus_T_2; // @[Csr.scala 81:17]
    end
    if (reset) begin // @[Csr.scala 46:30]
      mtvec <= 64'h0; // @[Csr.scala 46:30]
    end else if (io_wen & io_waddr == 12'h305) begin // @[Csr.scala 87:17]
      mtvec <= io_wdata;
    end
    if (reset) begin // @[Csr.scala 47:30]
      mepc <= 64'h0; // @[Csr.scala 47:30]
    end else if (_T) begin // @[Csr.scala 89:36]
      mepc <= io_pc; // @[Csr.scala 89:42]
    end else if (io_wen & io_waddr == 12'h341) begin // @[Csr.scala 90:44]
      mepc <= _mepc_T; // @[Csr.scala 90:50]
    end
    if (reset) begin // @[Csr.scala 48:30]
      mcause <= 64'h0; // @[Csr.scala 48:30]
    end else if (io_interrupt) begin // @[Csr.scala 93:24]
      mcause <= io_cause; // @[Csr.scala 93:32]
    end else if (io_ecall) begin // @[Csr.scala 94:25]
      mcause <= 64'hb; // @[Csr.scala 94:33]
    end else if (io_wen & io_waddr == 12'h342) begin // @[Csr.scala 95:46]
      mcause <= io_wdata; // @[Csr.scala 95:54]
    end
    if (reset) begin // @[Csr.scala 49:30]
      mcycle <= 64'h0; // @[Csr.scala 49:30]
    end else if (io_wen & io_waddr == 12'hb00) begin // @[Csr.scala 70:19]
      mcycle <= io_wdata;
    end else begin
      mcycle <= _mcycle_T_3;
    end
    if (reset) begin // @[Csr.scala 51:30]
      mhartid <= 64'h0; // @[Csr.scala 51:30]
    end else if (io_wen & io_waddr == 12'hf14) begin // @[Csr.scala 104:23]
      mhartid <= io_wdata;
    end
    if (reset) begin // @[Csr.scala 52:30]
      mie <= 64'h0; // @[Csr.scala 52:30]
    end else if (io_wen & io_waddr == 12'h304) begin // @[Csr.scala 105:23]
      mie <= io_wdata;
    end
    if (reset) begin // @[Csr.scala 53:30]
      mip <= 64'h0; // @[Csr.scala 53:30]
    end else if (io_wen & io_waddr == 12'h344) begin // @[Csr.scala 100:43]
      mip <= _mip_T_2; // @[Csr.scala 100:48]
    end
    if (reset) begin // @[Csr.scala 54:30]
      mscratch <= 64'h0; // @[Csr.scala 54:30]
    end else if (io_wen & io_waddr == 12'h340) begin // @[Csr.scala 106:23]
      mscratch <= io_wdata;
    end
    if (reset) begin // @[Csr.scala 55:30]
      satp <= 64'h0; // @[Csr.scala 55:30]
    end else if (io_wen & io_waddr == 12'h180) begin // @[Csr.scala 107:23]
      satp <= io_wdata;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {2{`RANDOM}};
  mstatus = _RAND_0[63:0];
  _RAND_1 = {2{`RANDOM}};
  mtvec = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  mepc = _RAND_2[63:0];
  _RAND_3 = {2{`RANDOM}};
  mcause = _RAND_3[63:0];
  _RAND_4 = {2{`RANDOM}};
  mcycle = _RAND_4[63:0];
  _RAND_5 = {2{`RANDOM}};
  mhartid = _RAND_5[63:0];
  _RAND_6 = {2{`RANDOM}};
  mie = _RAND_6[63:0];
  _RAND_7 = {2{`RANDOM}};
  mip = _RAND_7[63:0];
  _RAND_8 = {2{`RANDOM}};
  mscratch = _RAND_8[63:0];
  _RAND_9 = {2{`RANDOM}};
  satp = _RAND_9[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_040596_Fence(
  input   clock,
  input   reset,
  input   io_go,
  output  io_ok,
  output  io_ifence_req,
  input   io_ifence_done,
  output  io_dfence_req,
  input   io_dfence_done
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] state; // @[Fence.scala 19:24]
  wire  _T = 3'h0 == state; // @[Conditional.scala 37:30]
  wire  _T_1 = 3'h1 == state; // @[Conditional.scala 37:30]
  wire  _T_2 = 3'h2 == state; // @[Conditional.scala 37:30]
  wire [2:0] _GEN_1 = io_dfence_done ? 3'h3 : state; // @[Fence.scala 29:33 Fence.scala 29:40 Fence.scala 19:24]
  wire  _T_3 = 3'h3 == state; // @[Conditional.scala 37:30]
  wire [2:0] _GEN_2 = io_ifence_done ? 3'h4 : state; // @[Fence.scala 32:33 Fence.scala 32:40 Fence.scala 19:24]
  wire  _T_4 = 3'h4 == state; // @[Conditional.scala 37:30]
  wire [2:0] _GEN_3 = _T_4 ? 3'h0 : state; // @[Conditional.scala 39:67 Fence.scala 35:19 Fence.scala 19:24]
  wire [2:0] _GEN_4 = _T_3 ? _GEN_2 : _GEN_3; // @[Conditional.scala 39:67]
  assign io_ok = state == 3'h0 & ~io_go | state == 3'h4; // @[Fence.scala 39:52]
  assign io_ifence_req = state == 3'h3; // @[Fence.scala 41:28]
  assign io_dfence_req = state == 3'h2; // @[Fence.scala 40:28]
  always @(posedge clock) begin
    if (reset) begin // @[Fence.scala 19:24]
      state <= 3'h0; // @[Fence.scala 19:24]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (io_go) begin // @[Fence.scala 23:24]
        state <= 3'h1; // @[Fence.scala 23:31]
      end
    end else if (_T_1) begin // @[Conditional.scala 39:67]
      state <= 3'h2; // @[Fence.scala 26:19]
    end else if (_T_2) begin // @[Conditional.scala 39:67]
      state <= _GEN_1;
    end else begin
      state <= _GEN_4;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  state = _RAND_0[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_040596_Mul(
  input          clock,
  input          reset,
  input          io_en,
  input  [64:0]  io_x,
  input  [64:0]  io_y,
  output [129:0] io_out,
  output         io_stall
);
`ifdef RANDOMIZE_REG_INIT
  reg [159:0] _RAND_0;
  reg [95:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [159:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg [129:0] x; // @[Mul.scala 14:20]
  reg [64:0] y; // @[Mul.scala 15:20]
  reg [6:0] cnt; // @[Mul.scala 16:22]
  reg [129:0] sum; // @[Mul.scala 17:22]
  reg [1:0] state; // @[Mul.scala 20:24]
  wire  _T = 2'h0 == state; // @[Conditional.scala 37:30]
  wire  _T_1 = 2'h1 == state; // @[Conditional.scala 37:30]
  wire  _T_2 = 2'h2 == state; // @[Conditional.scala 37:30]
  wire [1:0] _GEN_1 = cnt == 7'h40 ? 2'h3 : state; // @[Mul.scala 30:31 Mul.scala 30:38 Mul.scala 20:24]
  wire  _T_4 = 2'h3 == state; // @[Conditional.scala 37:30]
  wire [1:0] _GEN_2 = _T_4 ? 2'h0 : state; // @[Conditional.scala 39:67 Mul.scala 33:19 Mul.scala 20:24]
  wire [64:0] x_hi = io_x[64] ? 65'h1ffffffffffffffff : 65'h0; // @[Bitwise.scala 72:12]
  wire [129:0] _x_T_2 = {x_hi,io_x}; // @[Cat.scala 30:58]
  wire [130:0] _x_T_3 = {x, 1'h0}; // @[Mul.scala 44:16]
  wire [64:0] _y_T = {{1'd0}, y[64:1]}; // @[Mul.scala 45:16]
  wire [6:0] _cnt_T_1 = cnt + 7'h1; // @[Mul.scala 46:20]
  wire [129:0] _sum_T_1 = y[0] ? x : 130'h0; // @[Mul.scala 47:25]
  wire [129:0] _sum_T_3 = sum + _sum_T_1; // @[Mul.scala 47:20]
  wire [130:0] _GEN_6 = state == 2'h2 ? _x_T_3 : {{1'd0}, x}; // @[Mul.scala 43:33 Mul.scala 44:11 Mul.scala 14:20]
  wire [130:0] _GEN_10 = state == 2'h1 ? {{1'd0}, _x_T_2} : _GEN_6; // @[Mul.scala 37:26 Mul.scala 38:11]
  assign io_out = sum; // @[Mul.scala 50:12]
  assign io_stall = ~(state == 2'h3 | state == 2'h0 & ~io_en); // @[Mul.scala 51:17]
  always @(posedge clock) begin
    if (reset) begin // @[Mul.scala 14:20]
      x <= 130'h0; // @[Mul.scala 14:20]
    end else begin
      x <= _GEN_10[129:0];
    end
    if (reset) begin // @[Mul.scala 15:20]
      y <= 65'h0; // @[Mul.scala 15:20]
    end else if (state == 2'h1) begin // @[Mul.scala 37:26]
      y <= io_y; // @[Mul.scala 39:11]
    end else if (state == 2'h2) begin // @[Mul.scala 43:33]
      y <= _y_T; // @[Mul.scala 45:11]
    end
    if (reset) begin // @[Mul.scala 16:22]
      cnt <= 7'h0; // @[Mul.scala 16:22]
    end else if (state == 2'h1) begin // @[Mul.scala 37:26]
      cnt <= 7'h0; // @[Mul.scala 40:13]
    end else if (state == 2'h2) begin // @[Mul.scala 43:33]
      cnt <= _cnt_T_1; // @[Mul.scala 46:13]
    end
    if (reset) begin // @[Mul.scala 17:22]
      sum <= 130'h0; // @[Mul.scala 17:22]
    end else if (state == 2'h1) begin // @[Mul.scala 37:26]
      sum <= 130'h0; // @[Mul.scala 41:13]
    end else if (state == 2'h2) begin // @[Mul.scala 43:33]
      sum <= _sum_T_3; // @[Mul.scala 47:13]
    end
    if (reset) begin // @[Mul.scala 20:24]
      state <= 2'h0; // @[Mul.scala 20:24]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (io_en) begin // @[Mul.scala 24:24]
        state <= 2'h1; // @[Mul.scala 24:31]
      end
    end else if (_T_1) begin // @[Conditional.scala 39:67]
      state <= 2'h2; // @[Mul.scala 27:19]
    end else if (_T_2) begin // @[Conditional.scala 39:67]
      state <= _GEN_1;
    end else begin
      state <= _GEN_2;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {5{`RANDOM}};
  x = _RAND_0[129:0];
  _RAND_1 = {3{`RANDOM}};
  y = _RAND_1[64:0];
  _RAND_2 = {1{`RANDOM}};
  cnt = _RAND_2[6:0];
  _RAND_3 = {5{`RANDOM}};
  sum = _RAND_3[129:0];
  _RAND_4 = {1{`RANDOM}};
  state = _RAND_4[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_040596_MU(
  input         clock,
  input         reset,
  input         io_en,
  input  [1:0]  io_mu_code,
  input  [63:0] io_op1,
  input  [63:0] io_op2,
  output [63:0] io_mu_out,
  output        io_stall
);
  wire  mul_clock; // @[Mul.scala 69:21]
  wire  mul_reset; // @[Mul.scala 69:21]
  wire  mul_io_en; // @[Mul.scala 69:21]
  wire [64:0] mul_io_x; // @[Mul.scala 69:21]
  wire [64:0] mul_io_y; // @[Mul.scala 69:21]
  wire [129:0] mul_io_out; // @[Mul.scala 69:21]
  wire  mul_io_stall; // @[Mul.scala 69:21]
  wire [31:0] mu_out_hi = mul_io_out[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] mu_out_lo = mul_io_out[31:0]; // @[Mul.scala 67:41]
  wire [63:0] _mu_out_T_2 = {mu_out_hi,mu_out_lo}; // @[Cat.scala 30:58]
  wire [129:0] _mu_out_T_4 = 2'h1 == io_mu_code ? mul_io_out : 130'h0; // @[Mux.scala 80:57]
  wire [129:0] mu_out = 2'h2 == io_mu_code ? {{66'd0}, _mu_out_T_2} : _mu_out_T_4; // @[Mux.scala 80:57]
  ysyx_040596_Mul mul ( // @[Mul.scala 69:21]
    .clock(mul_clock),
    .reset(mul_reset),
    .io_en(mul_io_en),
    .io_x(mul_io_x),
    .io_y(mul_io_y),
    .io_out(mul_io_out),
    .io_stall(mul_io_stall)
  );
  assign io_mu_out = mu_out[63:0]; // @[Mul.scala 79:17]
  assign io_stall = mul_io_stall; // @[Mul.scala 80:17]
  assign mul_clock = clock;
  assign mul_reset = reset;
  assign mul_io_en = io_en; // @[Mul.scala 70:17]
  assign mul_io_x = {{1'd0}, io_op1}; // @[Mul.scala 71:17]
  assign mul_io_y = {{1'd0}, io_op2}; // @[Mul.scala 72:17]
endmodule
module ysyx_040596_Div(
  input         clock,
  input         reset,
  input         io_en,
  input         io_signed,
  input  [63:0] io_x,
  input  [63:0] io_y,
  output [63:0] io_s,
  output [63:0] io_r,
  output        io_stall
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [127:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [63:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [63:0] _RAND_7;
  reg [31:0] _RAND_8;
`endif // RANDOMIZE_REG_INIT
  wire [63:0] _x_abs_T_1 = ~io_x; // @[Div.scala 22:46]
  wire [63:0] _x_abs_T_3 = _x_abs_T_1 + 64'h1; // @[Div.scala 22:52]
  wire [63:0] x_abs_lo = io_x[63] ? _x_abs_T_3 : io_x; // @[Div.scala 22:35]
  wire [127:0] x_abs = {64'h0,x_abs_lo}; // @[Cat.scala 30:58]
  wire [63:0] _y_abs_T_1 = ~io_y; // @[Div.scala 23:31]
  wire [63:0] _y_abs_T_3 = _y_abs_T_1 + 64'h1; // @[Div.scala 23:37]
  wire [127:0] _x_input_T = {64'h0,io_x}; // @[Cat.scala 30:58]
  wire [127:0] x_input = io_signed ? x_abs : _x_input_T; // @[Div.scala 26:22]
  reg  signed_; // @[Div.scala 30:25]
  reg  x_input_signed; // @[Div.scala 31:33]
  reg  y_input_signed; // @[Div.scala 32:33]
  reg [127:0] x; // @[Div.scala 33:20]
  reg [63:0] y; // @[Div.scala 34:20]
  reg [63:0] s; // @[Div.scala 35:20]
  reg [63:0] r_out; // @[Div.scala 36:24]
  reg [63:0] s_out; // @[Div.scala 37:24]
  reg [6:0] cnt; // @[Div.scala 38:22]
  wire [254:0] _GEN_12 = {{127'd0}, x}; // @[Div.scala 41:20]
  wire [254:0] _x_sub_T = _GEN_12 << cnt; // @[Div.scala 41:20]
  wire [64:0] _GEN_13 = {{1'd0}, y}; // @[Div.scala 41:37]
  wire [64:0] x_sub = _x_sub_T[128:64] - _GEN_13; // @[Div.scala 41:37]
  wire  x_sign = x_sub[64]; // @[Div.scala 42:23]
  wire [128:0] _x_mask_T = {x_sub,64'h0}; // @[Cat.scala 30:58]
  wire [128:0] x_mask = _x_mask_T >> cnt; // @[Div.scala 43:41]
  wire [127:0] _x_clean_T_1 = 128'hffffffffffffffff >> cnt; // @[Div.scala 44:50]
  wire [127:0] x_clean = _x_clean_T_1 & x; // @[Div.scala 44:58]
  wire [128:0] _GEN_14 = {{1'd0}, x_clean}; // @[Div.scala 45:42]
  wire [128:0] _x_update_T = x_mask | _GEN_14; // @[Div.scala 45:42]
  wire [128:0] x_update = x_sign ? {{1'd0}, x} : _x_update_T; // @[Div.scala 45:23]
  wire [64:0] _s_update_T_1 = 65'h10000000000000000 >> cnt; // @[Div.scala 47:60]
  wire [63:0] _s_update_T_3 = s | _s_update_T_1[63:0]; // @[Div.scala 47:37]
  wire [63:0] s_update = x_sign ? s : _s_update_T_3; // @[Div.scala 47:23]
  wire  _T = cnt == 7'h0; // @[Div.scala 50:23]
  wire  _T_1 = io_en & cnt == 7'h0; // @[Div.scala 50:16]
  wire  _T_12 = cnt != 7'h0 & cnt != 7'h41; // @[Div.scala 58:27]
  wire [128:0] _GEN_4 = cnt != 7'h0 & cnt != 7'h41 ? x_update : {{1'd0}, x}; // @[Div.scala 58:43 Div.scala 58:46 Div.scala 33:20]
  wire [128:0] _GEN_5 = _T_1 ? {{1'd0}, x_input} : _GEN_4; // @[Div.scala 57:31 Div.scala 57:34]
  wire  _T_16 = cnt == 7'h41; // @[Div.scala 61:19]
  wire  _T_17 = cnt == 7'h40; // @[Div.scala 63:14]
  wire [63:0] _s_out_T_2 = ~s_update; // @[Div.scala 63:82]
  wire [63:0] _s_out_T_4 = _s_out_T_2 + 64'h1; // @[Div.scala 63:92]
  wire [63:0] _r_out_T_2 = ~x_update[63:0]; // @[Div.scala 65:63]
  wire [63:0] _r_out_T_4 = _r_out_T_2 + 64'h1; // @[Div.scala 65:80]
  wire [6:0] _cnt_T_2 = cnt + 7'h1; // @[Div.scala 69:27]
  assign io_s = s_out; // @[Div.scala 74:10]
  assign io_r = r_out; // @[Div.scala 75:10]
  assign io_stall = ~(_T_16 | _T & ~io_en); // @[Div.scala 77:17]
  always @(posedge clock) begin
    if (reset) begin // @[Div.scala 30:25]
      signed_ <= 1'h0; // @[Div.scala 30:25]
    end else if (io_en & cnt == 7'h0) begin // @[Div.scala 50:31]
      signed_ <= io_signed; // @[Div.scala 50:39]
    end
    if (reset) begin // @[Div.scala 31:33]
      x_input_signed <= 1'h0; // @[Div.scala 31:33]
    end else if (_T_1) begin // @[Div.scala 52:31]
      x_input_signed <= io_x[63]; // @[Div.scala 52:47]
    end
    if (reset) begin // @[Div.scala 32:33]
      y_input_signed <= 1'h0; // @[Div.scala 32:33]
    end else if (_T_1) begin // @[Div.scala 53:31]
      y_input_signed <= io_y[63]; // @[Div.scala 53:47]
    end
    if (reset) begin // @[Div.scala 33:20]
      x <= 128'h0; // @[Div.scala 33:20]
    end else begin
      x <= _GEN_5[127:0];
    end
    if (reset) begin // @[Div.scala 34:20]
      y <= 64'h0; // @[Div.scala 34:20]
    end else if (_T_1) begin // @[Div.scala 55:31]
      if (io_signed) begin // @[Div.scala 27:22]
        if (io_y[63]) begin // @[Div.scala 23:20]
          y <= _y_abs_T_3;
        end else begin
          y <= io_y;
        end
      end else begin
        y <= io_y;
      end
    end
    if (reset) begin // @[Div.scala 35:20]
      s <= 64'h0; // @[Div.scala 35:20]
    end else if (_T_12) begin // @[Div.scala 60:38]
      if (!(x_sign)) begin // @[Div.scala 47:23]
        s <= _s_update_T_3;
      end
    end else if (cnt == 7'h41) begin // @[Div.scala 61:28]
      s <= 64'h0; // @[Div.scala 61:31]
    end
    if (reset) begin // @[Div.scala 36:24]
      r_out <= 64'h0; // @[Div.scala 36:24]
    end else if (_T_17) begin // @[Div.scala 65:23]
      if (signed_ & x_input_signed) begin // @[Div.scala 65:36]
        r_out <= _r_out_T_4;
      end else begin
        r_out <= x_update[63:0];
      end
    end
    if (reset) begin // @[Div.scala 37:24]
      s_out <= 64'h0; // @[Div.scala 37:24]
    end else if (cnt == 7'h40) begin // @[Div.scala 63:23]
      if (signed_ & (x_input_signed ^ y_input_signed)) begin // @[Div.scala 63:36]
        s_out <= _s_out_T_4;
      end else if (x_sign) begin // @[Div.scala 47:23]
        s_out <= s;
      end else begin
        s_out <= _s_update_T_3;
      end
    end
    if (reset) begin // @[Div.scala 38:22]
      cnt <= 7'h0; // @[Div.scala 38:22]
    end else if (_T) begin // @[Div.scala 67:22]
      cnt <= {{6'd0}, io_en}; // @[Div.scala 67:27]
    end else if (_T_16) begin // @[Div.scala 68:28]
      cnt <= 7'h0; // @[Div.scala 68:33]
    end else begin
      cnt <= _cnt_T_2; // @[Div.scala 69:20]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  signed_ = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  x_input_signed = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  y_input_signed = _RAND_2[0:0];
  _RAND_3 = {4{`RANDOM}};
  x = _RAND_3[127:0];
  _RAND_4 = {2{`RANDOM}};
  y = _RAND_4[63:0];
  _RAND_5 = {2{`RANDOM}};
  s = _RAND_5[63:0];
  _RAND_6 = {2{`RANDOM}};
  r_out = _RAND_6[63:0];
  _RAND_7 = {2{`RANDOM}};
  s_out = _RAND_7[63:0];
  _RAND_8 = {1{`RANDOM}};
  cnt = _RAND_8[6:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_040596_DU(
  input         clock,
  input         reset,
  input         io_en,
  input  [7:0]  io_du_code,
  input  [63:0] io_op1,
  input  [63:0] io_op2,
  output [63:0] io_du_out,
  output        io_stall
);
  wire  div_clock; // @[Div.scala 132:21]
  wire  div_reset; // @[Div.scala 132:21]
  wire  div_io_en; // @[Div.scala 132:21]
  wire  div_io_signed; // @[Div.scala 132:21]
  wire [63:0] div_io_x; // @[Div.scala 132:21]
  wire [63:0] div_io_y; // @[Div.scala 132:21]
  wire [63:0] div_io_s; // @[Div.scala 132:21]
  wire [63:0] div_io_r; // @[Div.scala 132:21]
  wire  div_io_stall; // @[Div.scala 132:21]
  wire [31:0] x_hi = io_op1[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] x_lo = io_op1[31:0]; // @[Div.scala 93:41]
  wire [63:0] _x_T_2 = {x_hi,x_lo}; // @[Cat.scala 30:58]
  wire [63:0] _x_T_3 = {32'h0,x_lo}; // @[Cat.scala 30:58]
  wire [63:0] _x_T_9 = 8'h1 == io_du_code ? io_op1 : 64'h0; // @[Mux.scala 80:57]
  wire [63:0] _x_T_11 = 8'h2 == io_du_code ? _x_T_2 : _x_T_9; // @[Mux.scala 80:57]
  wire [63:0] _x_T_13 = 8'h4 == io_du_code ? io_op1 : _x_T_11; // @[Mux.scala 80:57]
  wire [63:0] _x_T_15 = 8'h8 == io_du_code ? _x_T_3 : _x_T_13; // @[Mux.scala 80:57]
  wire [63:0] _x_T_17 = 8'h10 == io_du_code ? io_op1 : _x_T_15; // @[Mux.scala 80:57]
  wire [63:0] _x_T_19 = 8'h20 == io_du_code ? _x_T_2 : _x_T_17; // @[Mux.scala 80:57]
  wire [63:0] _x_T_21 = 8'h40 == io_du_code ? io_op1 : _x_T_19; // @[Mux.scala 80:57]
  wire [31:0] y_hi = io_op2[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] y_lo = io_op2[31:0]; // @[Div.scala 93:41]
  wire [63:0] _y_T_2 = {y_hi,y_lo}; // @[Cat.scala 30:58]
  wire [63:0] _y_T_3 = {32'h0,y_lo}; // @[Cat.scala 30:58]
  wire [63:0] _y_T_9 = 8'h1 == io_du_code ? io_op2 : 64'h0; // @[Mux.scala 80:57]
  wire [63:0] _y_T_11 = 8'h2 == io_du_code ? _y_T_2 : _y_T_9; // @[Mux.scala 80:57]
  wire [63:0] _y_T_13 = 8'h4 == io_du_code ? io_op2 : _y_T_11; // @[Mux.scala 80:57]
  wire [63:0] _y_T_15 = 8'h8 == io_du_code ? _y_T_3 : _y_T_13; // @[Mux.scala 80:57]
  wire [63:0] _y_T_17 = 8'h10 == io_du_code ? io_op2 : _y_T_15; // @[Mux.scala 80:57]
  wire [63:0] _y_T_19 = 8'h20 == io_du_code ? _y_T_2 : _y_T_17; // @[Mux.scala 80:57]
  wire [63:0] _y_T_21 = 8'h40 == io_du_code ? io_op2 : _y_T_19; // @[Mux.scala 80:57]
  wire  _signed_T_5 = 8'h4 == io_du_code ? 1'h0 : 8'h2 == io_du_code | 8'h1 == io_du_code; // @[Mux.scala 80:57]
  wire  _signed_T_7 = 8'h8 == io_du_code ? 1'h0 : _signed_T_5; // @[Mux.scala 80:57]
  wire  _signed_T_13 = 8'h40 == io_du_code ? 1'h0 : 8'h20 == io_du_code | (8'h10 == io_du_code | _signed_T_7); // @[Mux.scala 80:57]
  wire [63:0] _out_T_1 = 8'h1 == io_du_code ? div_io_s : 64'h0; // @[Mux.scala 80:57]
  wire [63:0] _out_T_3 = 8'h2 == io_du_code ? div_io_s : _out_T_1; // @[Mux.scala 80:57]
  wire [63:0] _out_T_5 = 8'h4 == io_du_code ? div_io_s : _out_T_3; // @[Mux.scala 80:57]
  wire [63:0] _out_T_7 = 8'h8 == io_du_code ? div_io_s : _out_T_5; // @[Mux.scala 80:57]
  wire [63:0] _out_T_9 = 8'h10 == io_du_code ? div_io_r : _out_T_7; // @[Mux.scala 80:57]
  wire [63:0] _out_T_11 = 8'h20 == io_du_code ? div_io_r : _out_T_9; // @[Mux.scala 80:57]
  wire [63:0] _out_T_13 = 8'h40 == io_du_code ? div_io_r : _out_T_11; // @[Mux.scala 80:57]
  ysyx_040596_Div div ( // @[Div.scala 132:21]
    .clock(div_clock),
    .reset(div_reset),
    .io_en(div_io_en),
    .io_signed(div_io_signed),
    .io_x(div_io_x),
    .io_y(div_io_y),
    .io_s(div_io_s),
    .io_r(div_io_r),
    .io_stall(div_io_stall)
  );
  assign io_du_out = 8'h80 == io_du_code ? div_io_r : _out_T_13; // @[Mux.scala 80:57]
  assign io_stall = div_io_stall; // @[Div.scala 150:17]
  assign div_clock = clock;
  assign div_reset = reset;
  assign div_io_en = io_en; // @[Div.scala 133:21]
  assign div_io_signed = 8'h80 == io_du_code ? 1'h0 : _signed_T_13; // @[Mux.scala 80:57]
  assign div_io_x = 8'h80 == io_du_code ? _x_T_3 : _x_T_21; // @[Mux.scala 80:57]
  assign div_io_y = 8'h80 == io_du_code ? _y_T_3 : _y_T_21; // @[Mux.scala 80:57]
endmodule
module ysyx_040596_SRam_4k(
  input          clock,
  input          reset,
  input  [5:0]   io_addr,
  input          io_cen,
  input          io_wen,
  input  [511:0] io_wmask,
  input  [511:0] io_wdata,
  output [511:0] io_rdata,
  output [5:0]   io_sram0_addr,
  output         io_sram0_wen,
  output [127:0] io_sram0_wmask,
  output [127:0] io_sram0_wdata,
  input  [127:0] io_sram0_rdata,
  output [5:0]   io_sram1_addr,
  output         io_sram1_wen,
  output [127:0] io_sram1_wmask,
  output [127:0] io_sram1_wdata,
  input  [127:0] io_sram1_rdata,
  output [5:0]   io_sram2_addr,
  output         io_sram2_wen,
  output [127:0] io_sram2_wmask,
  output [127:0] io_sram2_wdata,
  input  [127:0] io_sram2_rdata,
  output [5:0]   io_sram3_addr,
  output         io_sram3_wen,
  output [127:0] io_sram3_wmask,
  output [127:0] io_sram3_wdata,
  input  [127:0] io_sram3_rdata
);
`ifdef RANDOMIZE_REG_INIT
  reg [511:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire  _io_sram0_wen_T = io_wen & io_cen; // @[ICache.scala 166:33]
  wire [511:0] rdata = {io_sram3_rdata,io_sram2_rdata,io_sram1_rdata,io_sram0_rdata}; // @[Cat.scala 30:58]
  reg [511:0] data_stay; // @[ICache.scala 191:28]
  reg [1:0] state; // @[ICache.scala 194:24]
  wire  _T = 2'h0 == state; // @[Conditional.scala 37:30]
  wire  _T_2 = 2'h1 == state; // @[Conditional.scala 37:30]
  wire  _T_3 = 2'h2 == state; // @[Conditional.scala 37:30]
  wire [1:0] _GEN_1 = io_cen ? 2'h0 : state; // @[ICache.scala 203:25 ICache.scala 203:32 ICache.scala 194:24]
  assign io_rdata = state == 2'h2 ? data_stay : rdata; // @[ICache.scala 207:20]
  assign io_sram0_addr = io_addr; // @[ICache.scala 164:21]
  assign io_sram0_wen = ~(io_wen & io_cen); // @[ICache.scala 166:24]
  assign io_sram0_wmask = ~io_wmask[127:0]; // @[ICache.scala 167:24]
  assign io_sram0_wdata = io_wdata[127:0]; // @[ICache.scala 168:32]
  assign io_sram1_addr = io_addr; // @[ICache.scala 170:21]
  assign io_sram1_wen = ~_io_sram0_wen_T; // @[ICache.scala 172:24]
  assign io_sram1_wmask = ~io_wmask[255:128]; // @[ICache.scala 173:24]
  assign io_sram1_wdata = io_wdata[255:128]; // @[ICache.scala 174:32]
  assign io_sram2_addr = io_addr; // @[ICache.scala 176:21]
  assign io_sram2_wen = ~_io_sram0_wen_T; // @[ICache.scala 178:24]
  assign io_sram2_wmask = ~io_wmask[383:256]; // @[ICache.scala 179:24]
  assign io_sram2_wdata = io_wdata[383:256]; // @[ICache.scala 180:32]
  assign io_sram3_addr = io_addr; // @[ICache.scala 182:21]
  assign io_sram3_wen = ~_io_sram0_wen_T; // @[ICache.scala 184:24]
  assign io_sram3_wmask = ~io_wmask[511:384]; // @[ICache.scala 185:24]
  assign io_sram3_wdata = io_wdata[511:384]; // @[ICache.scala 186:32]
  always @(posedge clock) begin
    if (reset) begin // @[ICache.scala 191:28]
      data_stay <= 512'h0; // @[ICache.scala 191:28]
    end else if (state == 2'h1) begin // @[ICache.scala 206:21]
      data_stay <= rdata;
    end
    if (reset) begin // @[ICache.scala 194:24]
      state <= 2'h0; // @[ICache.scala 194:24]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (~io_cen) begin // @[ICache.scala 197:26]
        state <= 2'h1; // @[ICache.scala 197:33]
      end
    end else if (_T_2) begin // @[Conditional.scala 39:67]
      if (io_cen) begin // @[ICache.scala 200:25]
        state <= 2'h0;
      end else begin
        state <= 2'h2;
      end
    end else if (_T_3) begin // @[Conditional.scala 39:67]
      state <= _GEN_1;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {16{`RANDOM}};
  data_stay = _RAND_0[511:0];
  _RAND_1 = {1{`RANDOM}};
  state = _RAND_1[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_040596_ICache(
  input          clock,
  input          reset,
  input  [63:0]  io_imem_addr,
  input          io_imem_en,
  output [31:0]  io_imem_data,
  output         io_imem_ok,
  output         io_axi_req,
  output [63:0]  io_axi_addr,
  input          io_axi_valid,
  input  [511:0] io_axi_data,
  input          io_fence_req,
  output         io_fence_done,
  output [5:0]   io_sram0_addr,
  output         io_sram0_wen,
  output [127:0] io_sram0_wmask,
  output [127:0] io_sram0_wdata,
  input  [127:0] io_sram0_rdata,
  output [5:0]   io_sram1_addr,
  output         io_sram1_wen,
  output [127:0] io_sram1_wmask,
  output [127:0] io_sram1_wdata,
  input  [127:0] io_sram1_rdata,
  output [5:0]   io_sram2_addr,
  output         io_sram2_wen,
  output [127:0] io_sram2_wmask,
  output [127:0] io_sram2_wdata,
  input  [127:0] io_sram2_rdata,
  output [5:0]   io_sram3_addr,
  output         io_sram3_wen,
  output [127:0] io_sram3_wmask,
  output [127:0] io_sram3_wdata,
  input  [127:0] io_sram3_rdata
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [63:0] _RAND_64;
  reg [63:0] _RAND_65;
  reg [63:0] _RAND_66;
  reg [63:0] _RAND_67;
  reg [63:0] _RAND_68;
  reg [63:0] _RAND_69;
  reg [63:0] _RAND_70;
  reg [63:0] _RAND_71;
  reg [63:0] _RAND_72;
  reg [63:0] _RAND_73;
  reg [63:0] _RAND_74;
  reg [63:0] _RAND_75;
  reg [63:0] _RAND_76;
  reg [63:0] _RAND_77;
  reg [63:0] _RAND_78;
  reg [63:0] _RAND_79;
  reg [63:0] _RAND_80;
  reg [63:0] _RAND_81;
  reg [63:0] _RAND_82;
  reg [63:0] _RAND_83;
  reg [63:0] _RAND_84;
  reg [63:0] _RAND_85;
  reg [63:0] _RAND_86;
  reg [63:0] _RAND_87;
  reg [63:0] _RAND_88;
  reg [63:0] _RAND_89;
  reg [63:0] _RAND_90;
  reg [63:0] _RAND_91;
  reg [63:0] _RAND_92;
  reg [63:0] _RAND_93;
  reg [63:0] _RAND_94;
  reg [63:0] _RAND_95;
  reg [63:0] _RAND_96;
  reg [63:0] _RAND_97;
  reg [63:0] _RAND_98;
  reg [63:0] _RAND_99;
  reg [63:0] _RAND_100;
  reg [63:0] _RAND_101;
  reg [63:0] _RAND_102;
  reg [63:0] _RAND_103;
  reg [63:0] _RAND_104;
  reg [63:0] _RAND_105;
  reg [63:0] _RAND_106;
  reg [63:0] _RAND_107;
  reg [63:0] _RAND_108;
  reg [63:0] _RAND_109;
  reg [63:0] _RAND_110;
  reg [63:0] _RAND_111;
  reg [63:0] _RAND_112;
  reg [63:0] _RAND_113;
  reg [63:0] _RAND_114;
  reg [63:0] _RAND_115;
  reg [63:0] _RAND_116;
  reg [63:0] _RAND_117;
  reg [63:0] _RAND_118;
  reg [63:0] _RAND_119;
  reg [63:0] _RAND_120;
  reg [63:0] _RAND_121;
  reg [63:0] _RAND_122;
  reg [63:0] _RAND_123;
  reg [63:0] _RAND_124;
  reg [63:0] _RAND_125;
  reg [63:0] _RAND_126;
  reg [63:0] _RAND_127;
  reg [31:0] _RAND_128;
  reg [31:0] _RAND_129;
  reg [63:0] _RAND_130;
  reg [511:0] _RAND_131;
`endif // RANDOMIZE_REG_INIT
  wire  SRam_4k_clock; // @[ICache.scala 394:25]
  wire  SRam_4k_reset; // @[ICache.scala 394:25]
  wire [5:0] SRam_4k_io_addr; // @[ICache.scala 394:25]
  wire  SRam_4k_io_cen; // @[ICache.scala 394:25]
  wire  SRam_4k_io_wen; // @[ICache.scala 394:25]
  wire [511:0] SRam_4k_io_wmask; // @[ICache.scala 394:25]
  wire [511:0] SRam_4k_io_wdata; // @[ICache.scala 394:25]
  wire [511:0] SRam_4k_io_rdata; // @[ICache.scala 394:25]
  wire [5:0] SRam_4k_io_sram0_addr; // @[ICache.scala 394:25]
  wire  SRam_4k_io_sram0_wen; // @[ICache.scala 394:25]
  wire [127:0] SRam_4k_io_sram0_wmask; // @[ICache.scala 394:25]
  wire [127:0] SRam_4k_io_sram0_wdata; // @[ICache.scala 394:25]
  wire [127:0] SRam_4k_io_sram0_rdata; // @[ICache.scala 394:25]
  wire [5:0] SRam_4k_io_sram1_addr; // @[ICache.scala 394:25]
  wire  SRam_4k_io_sram1_wen; // @[ICache.scala 394:25]
  wire [127:0] SRam_4k_io_sram1_wmask; // @[ICache.scala 394:25]
  wire [127:0] SRam_4k_io_sram1_wdata; // @[ICache.scala 394:25]
  wire [127:0] SRam_4k_io_sram1_rdata; // @[ICache.scala 394:25]
  wire [5:0] SRam_4k_io_sram2_addr; // @[ICache.scala 394:25]
  wire  SRam_4k_io_sram2_wen; // @[ICache.scala 394:25]
  wire [127:0] SRam_4k_io_sram2_wmask; // @[ICache.scala 394:25]
  wire [127:0] SRam_4k_io_sram2_wdata; // @[ICache.scala 394:25]
  wire [127:0] SRam_4k_io_sram2_rdata; // @[ICache.scala 394:25]
  wire [5:0] SRam_4k_io_sram3_addr; // @[ICache.scala 394:25]
  wire  SRam_4k_io_sram3_wen; // @[ICache.scala 394:25]
  wire [127:0] SRam_4k_io_sram3_wmask; // @[ICache.scala 394:25]
  wire [127:0] SRam_4k_io_sram3_wdata; // @[ICache.scala 394:25]
  wire [127:0] SRam_4k_io_sram3_rdata; // @[ICache.scala 394:25]
  wire [51:0] tag_addr = io_imem_addr[63:12]; // @[ICache.scala 388:35]
  wire [5:0] index_addr = io_imem_addr[11:6]; // @[ICache.scala 389:35]
  reg  v_0; // @[ICache.scala 392:26]
  reg  v_1; // @[ICache.scala 392:26]
  reg  v_2; // @[ICache.scala 392:26]
  reg  v_3; // @[ICache.scala 392:26]
  reg  v_4; // @[ICache.scala 392:26]
  reg  v_5; // @[ICache.scala 392:26]
  reg  v_6; // @[ICache.scala 392:26]
  reg  v_7; // @[ICache.scala 392:26]
  reg  v_8; // @[ICache.scala 392:26]
  reg  v_9; // @[ICache.scala 392:26]
  reg  v_10; // @[ICache.scala 392:26]
  reg  v_11; // @[ICache.scala 392:26]
  reg  v_12; // @[ICache.scala 392:26]
  reg  v_13; // @[ICache.scala 392:26]
  reg  v_14; // @[ICache.scala 392:26]
  reg  v_15; // @[ICache.scala 392:26]
  reg  v_16; // @[ICache.scala 392:26]
  reg  v_17; // @[ICache.scala 392:26]
  reg  v_18; // @[ICache.scala 392:26]
  reg  v_19; // @[ICache.scala 392:26]
  reg  v_20; // @[ICache.scala 392:26]
  reg  v_21; // @[ICache.scala 392:26]
  reg  v_22; // @[ICache.scala 392:26]
  reg  v_23; // @[ICache.scala 392:26]
  reg  v_24; // @[ICache.scala 392:26]
  reg  v_25; // @[ICache.scala 392:26]
  reg  v_26; // @[ICache.scala 392:26]
  reg  v_27; // @[ICache.scala 392:26]
  reg  v_28; // @[ICache.scala 392:26]
  reg  v_29; // @[ICache.scala 392:26]
  reg  v_30; // @[ICache.scala 392:26]
  reg  v_31; // @[ICache.scala 392:26]
  reg  v_32; // @[ICache.scala 392:26]
  reg  v_33; // @[ICache.scala 392:26]
  reg  v_34; // @[ICache.scala 392:26]
  reg  v_35; // @[ICache.scala 392:26]
  reg  v_36; // @[ICache.scala 392:26]
  reg  v_37; // @[ICache.scala 392:26]
  reg  v_38; // @[ICache.scala 392:26]
  reg  v_39; // @[ICache.scala 392:26]
  reg  v_40; // @[ICache.scala 392:26]
  reg  v_41; // @[ICache.scala 392:26]
  reg  v_42; // @[ICache.scala 392:26]
  reg  v_43; // @[ICache.scala 392:26]
  reg  v_44; // @[ICache.scala 392:26]
  reg  v_45; // @[ICache.scala 392:26]
  reg  v_46; // @[ICache.scala 392:26]
  reg  v_47; // @[ICache.scala 392:26]
  reg  v_48; // @[ICache.scala 392:26]
  reg  v_49; // @[ICache.scala 392:26]
  reg  v_50; // @[ICache.scala 392:26]
  reg  v_51; // @[ICache.scala 392:26]
  reg  v_52; // @[ICache.scala 392:26]
  reg  v_53; // @[ICache.scala 392:26]
  reg  v_54; // @[ICache.scala 392:26]
  reg  v_55; // @[ICache.scala 392:26]
  reg  v_56; // @[ICache.scala 392:26]
  reg  v_57; // @[ICache.scala 392:26]
  reg  v_58; // @[ICache.scala 392:26]
  reg  v_59; // @[ICache.scala 392:26]
  reg  v_60; // @[ICache.scala 392:26]
  reg  v_61; // @[ICache.scala 392:26]
  reg  v_62; // @[ICache.scala 392:26]
  reg  v_63; // @[ICache.scala 392:26]
  reg [51:0] tag_0; // @[ICache.scala 393:26]
  reg [51:0] tag_1; // @[ICache.scala 393:26]
  reg [51:0] tag_2; // @[ICache.scala 393:26]
  reg [51:0] tag_3; // @[ICache.scala 393:26]
  reg [51:0] tag_4; // @[ICache.scala 393:26]
  reg [51:0] tag_5; // @[ICache.scala 393:26]
  reg [51:0] tag_6; // @[ICache.scala 393:26]
  reg [51:0] tag_7; // @[ICache.scala 393:26]
  reg [51:0] tag_8; // @[ICache.scala 393:26]
  reg [51:0] tag_9; // @[ICache.scala 393:26]
  reg [51:0] tag_10; // @[ICache.scala 393:26]
  reg [51:0] tag_11; // @[ICache.scala 393:26]
  reg [51:0] tag_12; // @[ICache.scala 393:26]
  reg [51:0] tag_13; // @[ICache.scala 393:26]
  reg [51:0] tag_14; // @[ICache.scala 393:26]
  reg [51:0] tag_15; // @[ICache.scala 393:26]
  reg [51:0] tag_16; // @[ICache.scala 393:26]
  reg [51:0] tag_17; // @[ICache.scala 393:26]
  reg [51:0] tag_18; // @[ICache.scala 393:26]
  reg [51:0] tag_19; // @[ICache.scala 393:26]
  reg [51:0] tag_20; // @[ICache.scala 393:26]
  reg [51:0] tag_21; // @[ICache.scala 393:26]
  reg [51:0] tag_22; // @[ICache.scala 393:26]
  reg [51:0] tag_23; // @[ICache.scala 393:26]
  reg [51:0] tag_24; // @[ICache.scala 393:26]
  reg [51:0] tag_25; // @[ICache.scala 393:26]
  reg [51:0] tag_26; // @[ICache.scala 393:26]
  reg [51:0] tag_27; // @[ICache.scala 393:26]
  reg [51:0] tag_28; // @[ICache.scala 393:26]
  reg [51:0] tag_29; // @[ICache.scala 393:26]
  reg [51:0] tag_30; // @[ICache.scala 393:26]
  reg [51:0] tag_31; // @[ICache.scala 393:26]
  reg [51:0] tag_32; // @[ICache.scala 393:26]
  reg [51:0] tag_33; // @[ICache.scala 393:26]
  reg [51:0] tag_34; // @[ICache.scala 393:26]
  reg [51:0] tag_35; // @[ICache.scala 393:26]
  reg [51:0] tag_36; // @[ICache.scala 393:26]
  reg [51:0] tag_37; // @[ICache.scala 393:26]
  reg [51:0] tag_38; // @[ICache.scala 393:26]
  reg [51:0] tag_39; // @[ICache.scala 393:26]
  reg [51:0] tag_40; // @[ICache.scala 393:26]
  reg [51:0] tag_41; // @[ICache.scala 393:26]
  reg [51:0] tag_42; // @[ICache.scala 393:26]
  reg [51:0] tag_43; // @[ICache.scala 393:26]
  reg [51:0] tag_44; // @[ICache.scala 393:26]
  reg [51:0] tag_45; // @[ICache.scala 393:26]
  reg [51:0] tag_46; // @[ICache.scala 393:26]
  reg [51:0] tag_47; // @[ICache.scala 393:26]
  reg [51:0] tag_48; // @[ICache.scala 393:26]
  reg [51:0] tag_49; // @[ICache.scala 393:26]
  reg [51:0] tag_50; // @[ICache.scala 393:26]
  reg [51:0] tag_51; // @[ICache.scala 393:26]
  reg [51:0] tag_52; // @[ICache.scala 393:26]
  reg [51:0] tag_53; // @[ICache.scala 393:26]
  reg [51:0] tag_54; // @[ICache.scala 393:26]
  reg [51:0] tag_55; // @[ICache.scala 393:26]
  reg [51:0] tag_56; // @[ICache.scala 393:26]
  reg [51:0] tag_57; // @[ICache.scala 393:26]
  reg [51:0] tag_58; // @[ICache.scala 393:26]
  reg [51:0] tag_59; // @[ICache.scala 393:26]
  reg [51:0] tag_60; // @[ICache.scala 393:26]
  reg [51:0] tag_61; // @[ICache.scala 393:26]
  reg [51:0] tag_62; // @[ICache.scala 393:26]
  reg [51:0] tag_63; // @[ICache.scala 393:26]
  reg [2:0] state; // @[ICache.scala 403:24]
  reg [5:0] fence_reg; // @[ICache.scala 405:28]
  wire  _T = 3'h0 == state; // @[Conditional.scala 37:30]
  wire [51:0] _GEN_12 = 6'h1 == index_addr ? tag_1 : tag_0; // @[ICache.scala 439:32 ICache.scala 439:32]
  wire [51:0] _GEN_13 = 6'h2 == index_addr ? tag_2 : _GEN_12; // @[ICache.scala 439:32 ICache.scala 439:32]
  wire [51:0] _GEN_14 = 6'h3 == index_addr ? tag_3 : _GEN_13; // @[ICache.scala 439:32 ICache.scala 439:32]
  wire [51:0] _GEN_15 = 6'h4 == index_addr ? tag_4 : _GEN_14; // @[ICache.scala 439:32 ICache.scala 439:32]
  wire [51:0] _GEN_16 = 6'h5 == index_addr ? tag_5 : _GEN_15; // @[ICache.scala 439:32 ICache.scala 439:32]
  wire [51:0] _GEN_17 = 6'h6 == index_addr ? tag_6 : _GEN_16; // @[ICache.scala 439:32 ICache.scala 439:32]
  wire [51:0] _GEN_18 = 6'h7 == index_addr ? tag_7 : _GEN_17; // @[ICache.scala 439:32 ICache.scala 439:32]
  wire [51:0] _GEN_19 = 6'h8 == index_addr ? tag_8 : _GEN_18; // @[ICache.scala 439:32 ICache.scala 439:32]
  wire [51:0] _GEN_20 = 6'h9 == index_addr ? tag_9 : _GEN_19; // @[ICache.scala 439:32 ICache.scala 439:32]
  wire [51:0] _GEN_21 = 6'ha == index_addr ? tag_10 : _GEN_20; // @[ICache.scala 439:32 ICache.scala 439:32]
  wire [51:0] _GEN_22 = 6'hb == index_addr ? tag_11 : _GEN_21; // @[ICache.scala 439:32 ICache.scala 439:32]
  wire [51:0] _GEN_23 = 6'hc == index_addr ? tag_12 : _GEN_22; // @[ICache.scala 439:32 ICache.scala 439:32]
  wire [51:0] _GEN_24 = 6'hd == index_addr ? tag_13 : _GEN_23; // @[ICache.scala 439:32 ICache.scala 439:32]
  wire [51:0] _GEN_25 = 6'he == index_addr ? tag_14 : _GEN_24; // @[ICache.scala 439:32 ICache.scala 439:32]
  wire [51:0] _GEN_26 = 6'hf == index_addr ? tag_15 : _GEN_25; // @[ICache.scala 439:32 ICache.scala 439:32]
  wire [51:0] _GEN_27 = 6'h10 == index_addr ? tag_16 : _GEN_26; // @[ICache.scala 439:32 ICache.scala 439:32]
  wire [51:0] _GEN_28 = 6'h11 == index_addr ? tag_17 : _GEN_27; // @[ICache.scala 439:32 ICache.scala 439:32]
  wire [51:0] _GEN_29 = 6'h12 == index_addr ? tag_18 : _GEN_28; // @[ICache.scala 439:32 ICache.scala 439:32]
  wire [51:0] _GEN_30 = 6'h13 == index_addr ? tag_19 : _GEN_29; // @[ICache.scala 439:32 ICache.scala 439:32]
  wire [51:0] _GEN_31 = 6'h14 == index_addr ? tag_20 : _GEN_30; // @[ICache.scala 439:32 ICache.scala 439:32]
  wire [51:0] _GEN_32 = 6'h15 == index_addr ? tag_21 : _GEN_31; // @[ICache.scala 439:32 ICache.scala 439:32]
  wire [51:0] _GEN_33 = 6'h16 == index_addr ? tag_22 : _GEN_32; // @[ICache.scala 439:32 ICache.scala 439:32]
  wire [51:0] _GEN_34 = 6'h17 == index_addr ? tag_23 : _GEN_33; // @[ICache.scala 439:32 ICache.scala 439:32]
  wire [51:0] _GEN_35 = 6'h18 == index_addr ? tag_24 : _GEN_34; // @[ICache.scala 439:32 ICache.scala 439:32]
  wire [51:0] _GEN_36 = 6'h19 == index_addr ? tag_25 : _GEN_35; // @[ICache.scala 439:32 ICache.scala 439:32]
  wire [51:0] _GEN_37 = 6'h1a == index_addr ? tag_26 : _GEN_36; // @[ICache.scala 439:32 ICache.scala 439:32]
  wire [51:0] _GEN_38 = 6'h1b == index_addr ? tag_27 : _GEN_37; // @[ICache.scala 439:32 ICache.scala 439:32]
  wire [51:0] _GEN_39 = 6'h1c == index_addr ? tag_28 : _GEN_38; // @[ICache.scala 439:32 ICache.scala 439:32]
  wire [51:0] _GEN_40 = 6'h1d == index_addr ? tag_29 : _GEN_39; // @[ICache.scala 439:32 ICache.scala 439:32]
  wire [51:0] _GEN_41 = 6'h1e == index_addr ? tag_30 : _GEN_40; // @[ICache.scala 439:32 ICache.scala 439:32]
  wire [51:0] _GEN_42 = 6'h1f == index_addr ? tag_31 : _GEN_41; // @[ICache.scala 439:32 ICache.scala 439:32]
  wire [51:0] _GEN_43 = 6'h20 == index_addr ? tag_32 : _GEN_42; // @[ICache.scala 439:32 ICache.scala 439:32]
  wire [51:0] _GEN_44 = 6'h21 == index_addr ? tag_33 : _GEN_43; // @[ICache.scala 439:32 ICache.scala 439:32]
  wire [51:0] _GEN_45 = 6'h22 == index_addr ? tag_34 : _GEN_44; // @[ICache.scala 439:32 ICache.scala 439:32]
  wire [51:0] _GEN_46 = 6'h23 == index_addr ? tag_35 : _GEN_45; // @[ICache.scala 439:32 ICache.scala 439:32]
  wire [51:0] _GEN_47 = 6'h24 == index_addr ? tag_36 : _GEN_46; // @[ICache.scala 439:32 ICache.scala 439:32]
  wire [51:0] _GEN_48 = 6'h25 == index_addr ? tag_37 : _GEN_47; // @[ICache.scala 439:32 ICache.scala 439:32]
  wire [51:0] _GEN_49 = 6'h26 == index_addr ? tag_38 : _GEN_48; // @[ICache.scala 439:32 ICache.scala 439:32]
  wire [51:0] _GEN_50 = 6'h27 == index_addr ? tag_39 : _GEN_49; // @[ICache.scala 439:32 ICache.scala 439:32]
  wire [51:0] _GEN_51 = 6'h28 == index_addr ? tag_40 : _GEN_50; // @[ICache.scala 439:32 ICache.scala 439:32]
  wire [51:0] _GEN_52 = 6'h29 == index_addr ? tag_41 : _GEN_51; // @[ICache.scala 439:32 ICache.scala 439:32]
  wire [51:0] _GEN_53 = 6'h2a == index_addr ? tag_42 : _GEN_52; // @[ICache.scala 439:32 ICache.scala 439:32]
  wire [51:0] _GEN_54 = 6'h2b == index_addr ? tag_43 : _GEN_53; // @[ICache.scala 439:32 ICache.scala 439:32]
  wire [51:0] _GEN_55 = 6'h2c == index_addr ? tag_44 : _GEN_54; // @[ICache.scala 439:32 ICache.scala 439:32]
  wire [51:0] _GEN_56 = 6'h2d == index_addr ? tag_45 : _GEN_55; // @[ICache.scala 439:32 ICache.scala 439:32]
  wire [51:0] _GEN_57 = 6'h2e == index_addr ? tag_46 : _GEN_56; // @[ICache.scala 439:32 ICache.scala 439:32]
  wire [51:0] _GEN_58 = 6'h2f == index_addr ? tag_47 : _GEN_57; // @[ICache.scala 439:32 ICache.scala 439:32]
  wire [51:0] _GEN_59 = 6'h30 == index_addr ? tag_48 : _GEN_58; // @[ICache.scala 439:32 ICache.scala 439:32]
  wire [51:0] _GEN_60 = 6'h31 == index_addr ? tag_49 : _GEN_59; // @[ICache.scala 439:32 ICache.scala 439:32]
  wire [51:0] _GEN_61 = 6'h32 == index_addr ? tag_50 : _GEN_60; // @[ICache.scala 439:32 ICache.scala 439:32]
  wire [51:0] _GEN_62 = 6'h33 == index_addr ? tag_51 : _GEN_61; // @[ICache.scala 439:32 ICache.scala 439:32]
  wire [51:0] _GEN_63 = 6'h34 == index_addr ? tag_52 : _GEN_62; // @[ICache.scala 439:32 ICache.scala 439:32]
  wire [51:0] _GEN_64 = 6'h35 == index_addr ? tag_53 : _GEN_63; // @[ICache.scala 439:32 ICache.scala 439:32]
  wire [51:0] _GEN_65 = 6'h36 == index_addr ? tag_54 : _GEN_64; // @[ICache.scala 439:32 ICache.scala 439:32]
  wire [51:0] _GEN_66 = 6'h37 == index_addr ? tag_55 : _GEN_65; // @[ICache.scala 439:32 ICache.scala 439:32]
  wire [51:0] _GEN_67 = 6'h38 == index_addr ? tag_56 : _GEN_66; // @[ICache.scala 439:32 ICache.scala 439:32]
  wire [51:0] _GEN_68 = 6'h39 == index_addr ? tag_57 : _GEN_67; // @[ICache.scala 439:32 ICache.scala 439:32]
  wire [51:0] _GEN_69 = 6'h3a == index_addr ? tag_58 : _GEN_68; // @[ICache.scala 439:32 ICache.scala 439:32]
  wire [51:0] _GEN_70 = 6'h3b == index_addr ? tag_59 : _GEN_69; // @[ICache.scala 439:32 ICache.scala 439:32]
  wire [51:0] _GEN_71 = 6'h3c == index_addr ? tag_60 : _GEN_70; // @[ICache.scala 439:32 ICache.scala 439:32]
  wire [51:0] _GEN_72 = 6'h3d == index_addr ? tag_61 : _GEN_71; // @[ICache.scala 439:32 ICache.scala 439:32]
  wire [51:0] _GEN_73 = 6'h3e == index_addr ? tag_62 : _GEN_72; // @[ICache.scala 439:32 ICache.scala 439:32]
  wire [51:0] _GEN_74 = 6'h3f == index_addr ? tag_63 : _GEN_73; // @[ICache.scala 439:32 ICache.scala 439:32]
  wire  _GEN_76 = 6'h1 == index_addr ? v_1 : v_0; // @[ICache.scala 439:69 ICache.scala 439:69]
  wire  _GEN_77 = 6'h2 == index_addr ? v_2 : _GEN_76; // @[ICache.scala 439:69 ICache.scala 439:69]
  wire  _GEN_78 = 6'h3 == index_addr ? v_3 : _GEN_77; // @[ICache.scala 439:69 ICache.scala 439:69]
  wire  _GEN_79 = 6'h4 == index_addr ? v_4 : _GEN_78; // @[ICache.scala 439:69 ICache.scala 439:69]
  wire  _GEN_80 = 6'h5 == index_addr ? v_5 : _GEN_79; // @[ICache.scala 439:69 ICache.scala 439:69]
  wire  _GEN_81 = 6'h6 == index_addr ? v_6 : _GEN_80; // @[ICache.scala 439:69 ICache.scala 439:69]
  wire  _GEN_82 = 6'h7 == index_addr ? v_7 : _GEN_81; // @[ICache.scala 439:69 ICache.scala 439:69]
  wire  _GEN_83 = 6'h8 == index_addr ? v_8 : _GEN_82; // @[ICache.scala 439:69 ICache.scala 439:69]
  wire  _GEN_84 = 6'h9 == index_addr ? v_9 : _GEN_83; // @[ICache.scala 439:69 ICache.scala 439:69]
  wire  _GEN_85 = 6'ha == index_addr ? v_10 : _GEN_84; // @[ICache.scala 439:69 ICache.scala 439:69]
  wire  _GEN_86 = 6'hb == index_addr ? v_11 : _GEN_85; // @[ICache.scala 439:69 ICache.scala 439:69]
  wire  _GEN_87 = 6'hc == index_addr ? v_12 : _GEN_86; // @[ICache.scala 439:69 ICache.scala 439:69]
  wire  _GEN_88 = 6'hd == index_addr ? v_13 : _GEN_87; // @[ICache.scala 439:69 ICache.scala 439:69]
  wire  _GEN_89 = 6'he == index_addr ? v_14 : _GEN_88; // @[ICache.scala 439:69 ICache.scala 439:69]
  wire  _GEN_90 = 6'hf == index_addr ? v_15 : _GEN_89; // @[ICache.scala 439:69 ICache.scala 439:69]
  wire  _GEN_91 = 6'h10 == index_addr ? v_16 : _GEN_90; // @[ICache.scala 439:69 ICache.scala 439:69]
  wire  _GEN_92 = 6'h11 == index_addr ? v_17 : _GEN_91; // @[ICache.scala 439:69 ICache.scala 439:69]
  wire  _GEN_93 = 6'h12 == index_addr ? v_18 : _GEN_92; // @[ICache.scala 439:69 ICache.scala 439:69]
  wire  _GEN_94 = 6'h13 == index_addr ? v_19 : _GEN_93; // @[ICache.scala 439:69 ICache.scala 439:69]
  wire  _GEN_95 = 6'h14 == index_addr ? v_20 : _GEN_94; // @[ICache.scala 439:69 ICache.scala 439:69]
  wire  _GEN_96 = 6'h15 == index_addr ? v_21 : _GEN_95; // @[ICache.scala 439:69 ICache.scala 439:69]
  wire  _GEN_97 = 6'h16 == index_addr ? v_22 : _GEN_96; // @[ICache.scala 439:69 ICache.scala 439:69]
  wire  _GEN_98 = 6'h17 == index_addr ? v_23 : _GEN_97; // @[ICache.scala 439:69 ICache.scala 439:69]
  wire  _GEN_99 = 6'h18 == index_addr ? v_24 : _GEN_98; // @[ICache.scala 439:69 ICache.scala 439:69]
  wire  _GEN_100 = 6'h19 == index_addr ? v_25 : _GEN_99; // @[ICache.scala 439:69 ICache.scala 439:69]
  wire  _GEN_101 = 6'h1a == index_addr ? v_26 : _GEN_100; // @[ICache.scala 439:69 ICache.scala 439:69]
  wire  _GEN_102 = 6'h1b == index_addr ? v_27 : _GEN_101; // @[ICache.scala 439:69 ICache.scala 439:69]
  wire  _GEN_103 = 6'h1c == index_addr ? v_28 : _GEN_102; // @[ICache.scala 439:69 ICache.scala 439:69]
  wire  _GEN_104 = 6'h1d == index_addr ? v_29 : _GEN_103; // @[ICache.scala 439:69 ICache.scala 439:69]
  wire  _GEN_105 = 6'h1e == index_addr ? v_30 : _GEN_104; // @[ICache.scala 439:69 ICache.scala 439:69]
  wire  _GEN_106 = 6'h1f == index_addr ? v_31 : _GEN_105; // @[ICache.scala 439:69 ICache.scala 439:69]
  wire  _GEN_107 = 6'h20 == index_addr ? v_32 : _GEN_106; // @[ICache.scala 439:69 ICache.scala 439:69]
  wire  _GEN_108 = 6'h21 == index_addr ? v_33 : _GEN_107; // @[ICache.scala 439:69 ICache.scala 439:69]
  wire  _GEN_109 = 6'h22 == index_addr ? v_34 : _GEN_108; // @[ICache.scala 439:69 ICache.scala 439:69]
  wire  _GEN_110 = 6'h23 == index_addr ? v_35 : _GEN_109; // @[ICache.scala 439:69 ICache.scala 439:69]
  wire  _GEN_111 = 6'h24 == index_addr ? v_36 : _GEN_110; // @[ICache.scala 439:69 ICache.scala 439:69]
  wire  _GEN_112 = 6'h25 == index_addr ? v_37 : _GEN_111; // @[ICache.scala 439:69 ICache.scala 439:69]
  wire  _GEN_113 = 6'h26 == index_addr ? v_38 : _GEN_112; // @[ICache.scala 439:69 ICache.scala 439:69]
  wire  _GEN_114 = 6'h27 == index_addr ? v_39 : _GEN_113; // @[ICache.scala 439:69 ICache.scala 439:69]
  wire  _GEN_115 = 6'h28 == index_addr ? v_40 : _GEN_114; // @[ICache.scala 439:69 ICache.scala 439:69]
  wire  _GEN_116 = 6'h29 == index_addr ? v_41 : _GEN_115; // @[ICache.scala 439:69 ICache.scala 439:69]
  wire  _GEN_117 = 6'h2a == index_addr ? v_42 : _GEN_116; // @[ICache.scala 439:69 ICache.scala 439:69]
  wire  _GEN_118 = 6'h2b == index_addr ? v_43 : _GEN_117; // @[ICache.scala 439:69 ICache.scala 439:69]
  wire  _GEN_119 = 6'h2c == index_addr ? v_44 : _GEN_118; // @[ICache.scala 439:69 ICache.scala 439:69]
  wire  _GEN_120 = 6'h2d == index_addr ? v_45 : _GEN_119; // @[ICache.scala 439:69 ICache.scala 439:69]
  wire  _GEN_121 = 6'h2e == index_addr ? v_46 : _GEN_120; // @[ICache.scala 439:69 ICache.scala 439:69]
  wire  _GEN_122 = 6'h2f == index_addr ? v_47 : _GEN_121; // @[ICache.scala 439:69 ICache.scala 439:69]
  wire  _GEN_123 = 6'h30 == index_addr ? v_48 : _GEN_122; // @[ICache.scala 439:69 ICache.scala 439:69]
  wire  _GEN_124 = 6'h31 == index_addr ? v_49 : _GEN_123; // @[ICache.scala 439:69 ICache.scala 439:69]
  wire  _GEN_125 = 6'h32 == index_addr ? v_50 : _GEN_124; // @[ICache.scala 439:69 ICache.scala 439:69]
  wire  _GEN_126 = 6'h33 == index_addr ? v_51 : _GEN_125; // @[ICache.scala 439:69 ICache.scala 439:69]
  wire  _GEN_127 = 6'h34 == index_addr ? v_52 : _GEN_126; // @[ICache.scala 439:69 ICache.scala 439:69]
  wire  _GEN_128 = 6'h35 == index_addr ? v_53 : _GEN_127; // @[ICache.scala 439:69 ICache.scala 439:69]
  wire  _GEN_129 = 6'h36 == index_addr ? v_54 : _GEN_128; // @[ICache.scala 439:69 ICache.scala 439:69]
  wire  _GEN_130 = 6'h37 == index_addr ? v_55 : _GEN_129; // @[ICache.scala 439:69 ICache.scala 439:69]
  wire  _GEN_131 = 6'h38 == index_addr ? v_56 : _GEN_130; // @[ICache.scala 439:69 ICache.scala 439:69]
  wire  _GEN_132 = 6'h39 == index_addr ? v_57 : _GEN_131; // @[ICache.scala 439:69 ICache.scala 439:69]
  wire  _GEN_133 = 6'h3a == index_addr ? v_58 : _GEN_132; // @[ICache.scala 439:69 ICache.scala 439:69]
  wire  _GEN_134 = 6'h3b == index_addr ? v_59 : _GEN_133; // @[ICache.scala 439:69 ICache.scala 439:69]
  wire  _GEN_135 = 6'h3c == index_addr ? v_60 : _GEN_134; // @[ICache.scala 439:69 ICache.scala 439:69]
  wire  _GEN_136 = 6'h3d == index_addr ? v_61 : _GEN_135; // @[ICache.scala 439:69 ICache.scala 439:69]
  wire  _GEN_137 = 6'h3e == index_addr ? v_62 : _GEN_136; // @[ICache.scala 439:69 ICache.scala 439:69]
  wire  _GEN_138 = 6'h3f == index_addr ? v_63 : _GEN_137; // @[ICache.scala 439:69 ICache.scala 439:69]
  wire  hit = tag_addr == _GEN_74 & _GEN_138; // @[ICache.scala 439:52]
  wire  miss = ~hit; // @[ICache.scala 440:24]
  wire  _T_2 = 3'h1 == state; // @[Conditional.scala 37:30]
  wire  _T_3 = 3'h2 == state; // @[Conditional.scala 37:30]
  wire  _T_4 = 3'h3 == state; // @[Conditional.scala 37:30]
  wire  _T_5 = 3'h4 == state; // @[Conditional.scala 37:30]
  wire  _T_6 = 3'h5 == state; // @[Conditional.scala 37:30]
  wire  _T_8 = fence_reg == 6'h3f; // @[ICache.scala 427:28]
  wire [2:0] _GEN_3 = fence_reg == 6'h3f ? 3'h0 : 3'h5; // @[ICache.scala 427:59 ICache.scala 427:66 ICache.scala 428:30]
  wire [2:0] _GEN_4 = _T_6 ? _GEN_3 : state; // @[Conditional.scala 39:67 ICache.scala 403:24]
  wire [2:0] _GEN_5 = _T_5 ? 3'h5 : _GEN_4; // @[Conditional.scala 39:67 ICache.scala 424:19]
  wire [2:0] _GEN_6 = _T_4 ? 3'h0 : _GEN_5; // @[Conditional.scala 39:67 ICache.scala 420:19]
  wire  _addr_stay_T = state == 3'h0; // @[ICache.scala 434:62]
  wire  _addr_stay_T_1 = state == 3'h0 & io_imem_en; // @[ICache.scala 434:71]
  reg [63:0] addr_stay; // @[Reg.scala 27:20]
  wire [51:0] tag_addr_stay = addr_stay[63:12]; // @[ICache.scala 435:40]
  wire [5:0] index_addr_stay = addr_stay[11:6]; // @[ICache.scala 436:40]
  wire [5:0] offset_addr_stay = addr_stay[5:0]; // @[ICache.scala 437:40]
  wire [8:0] _data_T = {offset_addr_stay, 3'h0}; // @[ICache.scala 441:57]
  wire [511:0] _data_T_1 = SRam_4k_io_rdata >> _data_T; // @[ICache.scala 441:36]
  wire [31:0] data = _data_T_1[31:0]; // @[ICache.scala 441:63]
  wire  _io_axi_req_T = state == 3'h1; // @[ICache.scala 448:30]
  wire  _axi_buffer_T_1 = _io_axi_req_T & io_axi_valid; // @[ICache.scala 450:87]
  reg [511:0] axi_buffer; // @[Reg.scala 27:20]
  wire  _T_13 = _addr_stay_T & ~io_imem_en; // @[ICache.scala 456:31]
  wire  _T_14 = state == 3'h2; // @[ICache.scala 456:56]
  wire [5:0] _GEN_140 = _addr_stay_T & ~io_imem_en | state == 3'h2 | state == 3'h3 ? index_addr_stay : 6'h0; // @[ICache.scala 456:92 ICache.scala 457:20 ICache.scala 460:20]
  wire  _GEN_206 = 6'h0 == index_addr_stay | v_0; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_207 = 6'h1 == index_addr_stay | v_1; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_208 = 6'h2 == index_addr_stay | v_2; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_209 = 6'h3 == index_addr_stay | v_3; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_210 = 6'h4 == index_addr_stay | v_4; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_211 = 6'h5 == index_addr_stay | v_5; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_212 = 6'h6 == index_addr_stay | v_6; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_213 = 6'h7 == index_addr_stay | v_7; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_214 = 6'h8 == index_addr_stay | v_8; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_215 = 6'h9 == index_addr_stay | v_9; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_216 = 6'ha == index_addr_stay | v_10; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_217 = 6'hb == index_addr_stay | v_11; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_218 = 6'hc == index_addr_stay | v_12; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_219 = 6'hd == index_addr_stay | v_13; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_220 = 6'he == index_addr_stay | v_14; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_221 = 6'hf == index_addr_stay | v_15; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_222 = 6'h10 == index_addr_stay | v_16; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_223 = 6'h11 == index_addr_stay | v_17; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_224 = 6'h12 == index_addr_stay | v_18; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_225 = 6'h13 == index_addr_stay | v_19; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_226 = 6'h14 == index_addr_stay | v_20; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_227 = 6'h15 == index_addr_stay | v_21; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_228 = 6'h16 == index_addr_stay | v_22; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_229 = 6'h17 == index_addr_stay | v_23; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_230 = 6'h18 == index_addr_stay | v_24; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_231 = 6'h19 == index_addr_stay | v_25; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_232 = 6'h1a == index_addr_stay | v_26; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_233 = 6'h1b == index_addr_stay | v_27; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_234 = 6'h1c == index_addr_stay | v_28; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_235 = 6'h1d == index_addr_stay | v_29; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_236 = 6'h1e == index_addr_stay | v_30; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_237 = 6'h1f == index_addr_stay | v_31; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_238 = 6'h20 == index_addr_stay | v_32; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_239 = 6'h21 == index_addr_stay | v_33; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_240 = 6'h22 == index_addr_stay | v_34; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_241 = 6'h23 == index_addr_stay | v_35; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_242 = 6'h24 == index_addr_stay | v_36; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_243 = 6'h25 == index_addr_stay | v_37; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_244 = 6'h26 == index_addr_stay | v_38; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_245 = 6'h27 == index_addr_stay | v_39; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_246 = 6'h28 == index_addr_stay | v_40; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_247 = 6'h29 == index_addr_stay | v_41; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_248 = 6'h2a == index_addr_stay | v_42; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_249 = 6'h2b == index_addr_stay | v_43; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_250 = 6'h2c == index_addr_stay | v_44; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_251 = 6'h2d == index_addr_stay | v_45; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_252 = 6'h2e == index_addr_stay | v_46; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_253 = 6'h2f == index_addr_stay | v_47; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_254 = 6'h30 == index_addr_stay | v_48; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_255 = 6'h31 == index_addr_stay | v_49; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_256 = 6'h32 == index_addr_stay | v_50; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_257 = 6'h33 == index_addr_stay | v_51; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_258 = 6'h34 == index_addr_stay | v_52; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_259 = 6'h35 == index_addr_stay | v_53; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_260 = 6'h36 == index_addr_stay | v_54; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_261 = 6'h37 == index_addr_stay | v_55; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_262 = 6'h38 == index_addr_stay | v_56; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_263 = 6'h39 == index_addr_stay | v_57; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_264 = 6'h3a == index_addr_stay | v_58; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_265 = 6'h3b == index_addr_stay | v_59; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_266 = 6'h3c == index_addr_stay | v_60; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_267 = 6'h3d == index_addr_stay | v_61; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_268 = 6'h3e == index_addr_stay | v_62; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_269 = 6'h3f == index_addr_stay | v_63; // @[ICache.scala 470:33 ICache.scala 470:33 ICache.scala 392:26]
  wire  _GEN_334 = _T_14 ? _GEN_206 : v_0; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _GEN_335 = _T_14 ? _GEN_207 : v_1; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _GEN_336 = _T_14 ? _GEN_208 : v_2; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _GEN_337 = _T_14 ? _GEN_209 : v_3; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _GEN_338 = _T_14 ? _GEN_210 : v_4; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _GEN_339 = _T_14 ? _GEN_211 : v_5; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _GEN_340 = _T_14 ? _GEN_212 : v_6; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _GEN_341 = _T_14 ? _GEN_213 : v_7; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _GEN_342 = _T_14 ? _GEN_214 : v_8; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _GEN_343 = _T_14 ? _GEN_215 : v_9; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _GEN_344 = _T_14 ? _GEN_216 : v_10; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _GEN_345 = _T_14 ? _GEN_217 : v_11; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _GEN_346 = _T_14 ? _GEN_218 : v_12; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _GEN_347 = _T_14 ? _GEN_219 : v_13; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _GEN_348 = _T_14 ? _GEN_220 : v_14; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _GEN_349 = _T_14 ? _GEN_221 : v_15; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _GEN_350 = _T_14 ? _GEN_222 : v_16; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _GEN_351 = _T_14 ? _GEN_223 : v_17; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _GEN_352 = _T_14 ? _GEN_224 : v_18; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _GEN_353 = _T_14 ? _GEN_225 : v_19; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _GEN_354 = _T_14 ? _GEN_226 : v_20; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _GEN_355 = _T_14 ? _GEN_227 : v_21; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _GEN_356 = _T_14 ? _GEN_228 : v_22; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _GEN_357 = _T_14 ? _GEN_229 : v_23; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _GEN_358 = _T_14 ? _GEN_230 : v_24; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _GEN_359 = _T_14 ? _GEN_231 : v_25; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _GEN_360 = _T_14 ? _GEN_232 : v_26; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _GEN_361 = _T_14 ? _GEN_233 : v_27; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _GEN_362 = _T_14 ? _GEN_234 : v_28; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _GEN_363 = _T_14 ? _GEN_235 : v_29; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _GEN_364 = _T_14 ? _GEN_236 : v_30; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _GEN_365 = _T_14 ? _GEN_237 : v_31; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _GEN_366 = _T_14 ? _GEN_238 : v_32; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _GEN_367 = _T_14 ? _GEN_239 : v_33; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _GEN_368 = _T_14 ? _GEN_240 : v_34; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _GEN_369 = _T_14 ? _GEN_241 : v_35; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _GEN_370 = _T_14 ? _GEN_242 : v_36; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _GEN_371 = _T_14 ? _GEN_243 : v_37; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _GEN_372 = _T_14 ? _GEN_244 : v_38; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _GEN_373 = _T_14 ? _GEN_245 : v_39; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _GEN_374 = _T_14 ? _GEN_246 : v_40; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _GEN_375 = _T_14 ? _GEN_247 : v_41; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _GEN_376 = _T_14 ? _GEN_248 : v_42; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _GEN_377 = _T_14 ? _GEN_249 : v_43; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _GEN_378 = _T_14 ? _GEN_250 : v_44; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _GEN_379 = _T_14 ? _GEN_251 : v_45; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _GEN_380 = _T_14 ? _GEN_252 : v_46; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _GEN_381 = _T_14 ? _GEN_253 : v_47; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _GEN_382 = _T_14 ? _GEN_254 : v_48; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _GEN_383 = _T_14 ? _GEN_255 : v_49; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _GEN_384 = _T_14 ? _GEN_256 : v_50; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _GEN_385 = _T_14 ? _GEN_257 : v_51; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _GEN_386 = _T_14 ? _GEN_258 : v_52; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _GEN_387 = _T_14 ? _GEN_259 : v_53; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _GEN_388 = _T_14 ? _GEN_260 : v_54; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _GEN_389 = _T_14 ? _GEN_261 : v_55; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _GEN_390 = _T_14 ? _GEN_262 : v_56; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _GEN_391 = _T_14 ? _GEN_263 : v_57; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _GEN_392 = _T_14 ? _GEN_264 : v_58; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _GEN_393 = _T_14 ? _GEN_265 : v_59; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _GEN_394 = _T_14 ? _GEN_266 : v_60; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _GEN_395 = _T_14 ? _GEN_267 : v_61; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _GEN_396 = _T_14 ? _GEN_268 : v_62; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _GEN_397 = _T_14 ? _GEN_269 : v_63; // @[ICache.scala 468:27 ICache.scala 392:26]
  wire  _T_25 = state == 3'h5; // @[ICache.scala 472:16]
  wire [5:0] _fence_reg_T_1 = fence_reg + 6'h1; // @[ICache.scala 479:61]
  ysyx_040596_SRam_4k SRam_4k ( // @[ICache.scala 394:25]
    .clock(SRam_4k_clock),
    .reset(SRam_4k_reset),
    .io_addr(SRam_4k_io_addr),
    .io_cen(SRam_4k_io_cen),
    .io_wen(SRam_4k_io_wen),
    .io_wmask(SRam_4k_io_wmask),
    .io_wdata(SRam_4k_io_wdata),
    .io_rdata(SRam_4k_io_rdata),
    .io_sram0_addr(SRam_4k_io_sram0_addr),
    .io_sram0_wen(SRam_4k_io_sram0_wen),
    .io_sram0_wmask(SRam_4k_io_sram0_wmask),
    .io_sram0_wdata(SRam_4k_io_sram0_wdata),
    .io_sram0_rdata(SRam_4k_io_sram0_rdata),
    .io_sram1_addr(SRam_4k_io_sram1_addr),
    .io_sram1_wen(SRam_4k_io_sram1_wen),
    .io_sram1_wmask(SRam_4k_io_sram1_wmask),
    .io_sram1_wdata(SRam_4k_io_sram1_wdata),
    .io_sram1_rdata(SRam_4k_io_sram1_rdata),
    .io_sram2_addr(SRam_4k_io_sram2_addr),
    .io_sram2_wen(SRam_4k_io_sram2_wen),
    .io_sram2_wmask(SRam_4k_io_sram2_wmask),
    .io_sram2_wdata(SRam_4k_io_sram2_wdata),
    .io_sram2_rdata(SRam_4k_io_sram2_rdata),
    .io_sram3_addr(SRam_4k_io_sram3_addr),
    .io_sram3_wen(SRam_4k_io_sram3_wen),
    .io_sram3_wmask(SRam_4k_io_sram3_wmask),
    .io_sram3_wdata(SRam_4k_io_sram3_wdata),
    .io_sram3_rdata(SRam_4k_io_sram3_rdata)
  );
  assign io_imem_data = _addr_stay_T ? data : 32'h0; // @[ICache.scala 444:27]
  assign io_imem_ok = state == 3'h0; // @[ICache.scala 445:30]
  assign io_axi_req = state == 3'h1; // @[ICache.scala 448:30]
  assign io_axi_addr = addr_stay & 64'hffffffffffffffc0; // @[ICache.scala 449:34]
  assign io_fence_done = _T_25 & _T_8; // @[ICache.scala 482:32 ICache.scala 483:23 ICache.scala 485:30]
  assign io_sram0_addr = SRam_4k_io_sram0_addr; // @[ICache.scala 396:17]
  assign io_sram0_wen = SRam_4k_io_sram0_wen; // @[ICache.scala 396:17]
  assign io_sram0_wmask = SRam_4k_io_sram0_wmask; // @[ICache.scala 396:17]
  assign io_sram0_wdata = SRam_4k_io_sram0_wdata; // @[ICache.scala 396:17]
  assign io_sram1_addr = SRam_4k_io_sram1_addr; // @[ICache.scala 397:17]
  assign io_sram1_wen = SRam_4k_io_sram1_wen; // @[ICache.scala 397:17]
  assign io_sram1_wmask = SRam_4k_io_sram1_wmask; // @[ICache.scala 397:17]
  assign io_sram1_wdata = SRam_4k_io_sram1_wdata; // @[ICache.scala 397:17]
  assign io_sram2_addr = SRam_4k_io_sram2_addr; // @[ICache.scala 398:17]
  assign io_sram2_wen = SRam_4k_io_sram2_wen; // @[ICache.scala 398:17]
  assign io_sram2_wmask = SRam_4k_io_sram2_wmask; // @[ICache.scala 398:17]
  assign io_sram2_wdata = SRam_4k_io_sram2_wdata; // @[ICache.scala 398:17]
  assign io_sram3_addr = SRam_4k_io_sram3_addr; // @[ICache.scala 399:17]
  assign io_sram3_wen = SRam_4k_io_sram3_wen; // @[ICache.scala 399:17]
  assign io_sram3_wmask = SRam_4k_io_sram3_wmask; // @[ICache.scala 399:17]
  assign io_sram3_wdata = SRam_4k_io_sram3_wdata; // @[ICache.scala 399:17]
  assign SRam_4k_clock = clock;
  assign SRam_4k_reset = reset;
  assign SRam_4k_io_addr = _addr_stay_T_1 ? index_addr : _GEN_140; // @[ICache.scala 453:39 ICache.scala 454:20]
  assign SRam_4k_io_cen = ~_T_13; // @[ICache.scala 462:20]
  assign SRam_4k_io_wen = state == 3'h2; // @[ICache.scala 463:26]
  assign SRam_4k_io_wmask = 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
    ; // @[Bitwise.scala 72:12]
  assign SRam_4k_io_wdata = axi_buffer; // @[ICache.scala 464:17]
  assign SRam_4k_io_sram0_rdata = io_sram0_rdata; // @[ICache.scala 396:17]
  assign SRam_4k_io_sram1_rdata = io_sram1_rdata; // @[ICache.scala 397:17]
  assign SRam_4k_io_sram2_rdata = io_sram2_rdata; // @[ICache.scala 398:17]
  assign SRam_4k_io_sram3_rdata = io_sram3_rdata; // @[ICache.scala 399:17]
  always @(posedge clock) begin
    if (reset) begin // @[ICache.scala 392:26]
      v_0 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'h0 == fence_reg) begin // @[ICache.scala 473:33]
        v_0 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_0 <= _GEN_334;
      end
    end else begin
      v_0 <= _GEN_334;
    end
    if (reset) begin // @[ICache.scala 392:26]
      v_1 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'h1 == fence_reg) begin // @[ICache.scala 473:33]
        v_1 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_1 <= _GEN_335;
      end
    end else begin
      v_1 <= _GEN_335;
    end
    if (reset) begin // @[ICache.scala 392:26]
      v_2 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'h2 == fence_reg) begin // @[ICache.scala 473:33]
        v_2 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_2 <= _GEN_336;
      end
    end else begin
      v_2 <= _GEN_336;
    end
    if (reset) begin // @[ICache.scala 392:26]
      v_3 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'h3 == fence_reg) begin // @[ICache.scala 473:33]
        v_3 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_3 <= _GEN_337;
      end
    end else begin
      v_3 <= _GEN_337;
    end
    if (reset) begin // @[ICache.scala 392:26]
      v_4 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'h4 == fence_reg) begin // @[ICache.scala 473:33]
        v_4 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_4 <= _GEN_338;
      end
    end else begin
      v_4 <= _GEN_338;
    end
    if (reset) begin // @[ICache.scala 392:26]
      v_5 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'h5 == fence_reg) begin // @[ICache.scala 473:33]
        v_5 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_5 <= _GEN_339;
      end
    end else begin
      v_5 <= _GEN_339;
    end
    if (reset) begin // @[ICache.scala 392:26]
      v_6 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'h6 == fence_reg) begin // @[ICache.scala 473:33]
        v_6 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_6 <= _GEN_340;
      end
    end else begin
      v_6 <= _GEN_340;
    end
    if (reset) begin // @[ICache.scala 392:26]
      v_7 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'h7 == fence_reg) begin // @[ICache.scala 473:33]
        v_7 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_7 <= _GEN_341;
      end
    end else begin
      v_7 <= _GEN_341;
    end
    if (reset) begin // @[ICache.scala 392:26]
      v_8 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'h8 == fence_reg) begin // @[ICache.scala 473:33]
        v_8 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_8 <= _GEN_342;
      end
    end else begin
      v_8 <= _GEN_342;
    end
    if (reset) begin // @[ICache.scala 392:26]
      v_9 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'h9 == fence_reg) begin // @[ICache.scala 473:33]
        v_9 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_9 <= _GEN_343;
      end
    end else begin
      v_9 <= _GEN_343;
    end
    if (reset) begin // @[ICache.scala 392:26]
      v_10 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'ha == fence_reg) begin // @[ICache.scala 473:33]
        v_10 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_10 <= _GEN_344;
      end
    end else begin
      v_10 <= _GEN_344;
    end
    if (reset) begin // @[ICache.scala 392:26]
      v_11 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'hb == fence_reg) begin // @[ICache.scala 473:33]
        v_11 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_11 <= _GEN_345;
      end
    end else begin
      v_11 <= _GEN_345;
    end
    if (reset) begin // @[ICache.scala 392:26]
      v_12 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'hc == fence_reg) begin // @[ICache.scala 473:33]
        v_12 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_12 <= _GEN_346;
      end
    end else begin
      v_12 <= _GEN_346;
    end
    if (reset) begin // @[ICache.scala 392:26]
      v_13 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'hd == fence_reg) begin // @[ICache.scala 473:33]
        v_13 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_13 <= _GEN_347;
      end
    end else begin
      v_13 <= _GEN_347;
    end
    if (reset) begin // @[ICache.scala 392:26]
      v_14 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'he == fence_reg) begin // @[ICache.scala 473:33]
        v_14 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_14 <= _GEN_348;
      end
    end else begin
      v_14 <= _GEN_348;
    end
    if (reset) begin // @[ICache.scala 392:26]
      v_15 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'hf == fence_reg) begin // @[ICache.scala 473:33]
        v_15 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_15 <= _GEN_349;
      end
    end else begin
      v_15 <= _GEN_349;
    end
    if (reset) begin // @[ICache.scala 392:26]
      v_16 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'h10 == fence_reg) begin // @[ICache.scala 473:33]
        v_16 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_16 <= _GEN_350;
      end
    end else begin
      v_16 <= _GEN_350;
    end
    if (reset) begin // @[ICache.scala 392:26]
      v_17 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'h11 == fence_reg) begin // @[ICache.scala 473:33]
        v_17 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_17 <= _GEN_351;
      end
    end else begin
      v_17 <= _GEN_351;
    end
    if (reset) begin // @[ICache.scala 392:26]
      v_18 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'h12 == fence_reg) begin // @[ICache.scala 473:33]
        v_18 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_18 <= _GEN_352;
      end
    end else begin
      v_18 <= _GEN_352;
    end
    if (reset) begin // @[ICache.scala 392:26]
      v_19 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'h13 == fence_reg) begin // @[ICache.scala 473:33]
        v_19 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_19 <= _GEN_353;
      end
    end else begin
      v_19 <= _GEN_353;
    end
    if (reset) begin // @[ICache.scala 392:26]
      v_20 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'h14 == fence_reg) begin // @[ICache.scala 473:33]
        v_20 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_20 <= _GEN_354;
      end
    end else begin
      v_20 <= _GEN_354;
    end
    if (reset) begin // @[ICache.scala 392:26]
      v_21 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'h15 == fence_reg) begin // @[ICache.scala 473:33]
        v_21 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_21 <= _GEN_355;
      end
    end else begin
      v_21 <= _GEN_355;
    end
    if (reset) begin // @[ICache.scala 392:26]
      v_22 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'h16 == fence_reg) begin // @[ICache.scala 473:33]
        v_22 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_22 <= _GEN_356;
      end
    end else begin
      v_22 <= _GEN_356;
    end
    if (reset) begin // @[ICache.scala 392:26]
      v_23 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'h17 == fence_reg) begin // @[ICache.scala 473:33]
        v_23 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_23 <= _GEN_357;
      end
    end else begin
      v_23 <= _GEN_357;
    end
    if (reset) begin // @[ICache.scala 392:26]
      v_24 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'h18 == fence_reg) begin // @[ICache.scala 473:33]
        v_24 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_24 <= _GEN_358;
      end
    end else begin
      v_24 <= _GEN_358;
    end
    if (reset) begin // @[ICache.scala 392:26]
      v_25 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'h19 == fence_reg) begin // @[ICache.scala 473:33]
        v_25 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_25 <= _GEN_359;
      end
    end else begin
      v_25 <= _GEN_359;
    end
    if (reset) begin // @[ICache.scala 392:26]
      v_26 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'h1a == fence_reg) begin // @[ICache.scala 473:33]
        v_26 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_26 <= _GEN_360;
      end
    end else begin
      v_26 <= _GEN_360;
    end
    if (reset) begin // @[ICache.scala 392:26]
      v_27 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'h1b == fence_reg) begin // @[ICache.scala 473:33]
        v_27 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_27 <= _GEN_361;
      end
    end else begin
      v_27 <= _GEN_361;
    end
    if (reset) begin // @[ICache.scala 392:26]
      v_28 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'h1c == fence_reg) begin // @[ICache.scala 473:33]
        v_28 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_28 <= _GEN_362;
      end
    end else begin
      v_28 <= _GEN_362;
    end
    if (reset) begin // @[ICache.scala 392:26]
      v_29 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'h1d == fence_reg) begin // @[ICache.scala 473:33]
        v_29 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_29 <= _GEN_363;
      end
    end else begin
      v_29 <= _GEN_363;
    end
    if (reset) begin // @[ICache.scala 392:26]
      v_30 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'h1e == fence_reg) begin // @[ICache.scala 473:33]
        v_30 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_30 <= _GEN_364;
      end
    end else begin
      v_30 <= _GEN_364;
    end
    if (reset) begin // @[ICache.scala 392:26]
      v_31 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'h1f == fence_reg) begin // @[ICache.scala 473:33]
        v_31 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_31 <= _GEN_365;
      end
    end else begin
      v_31 <= _GEN_365;
    end
    if (reset) begin // @[ICache.scala 392:26]
      v_32 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'h20 == fence_reg) begin // @[ICache.scala 473:33]
        v_32 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_32 <= _GEN_366;
      end
    end else begin
      v_32 <= _GEN_366;
    end
    if (reset) begin // @[ICache.scala 392:26]
      v_33 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'h21 == fence_reg) begin // @[ICache.scala 473:33]
        v_33 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_33 <= _GEN_367;
      end
    end else begin
      v_33 <= _GEN_367;
    end
    if (reset) begin // @[ICache.scala 392:26]
      v_34 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'h22 == fence_reg) begin // @[ICache.scala 473:33]
        v_34 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_34 <= _GEN_368;
      end
    end else begin
      v_34 <= _GEN_368;
    end
    if (reset) begin // @[ICache.scala 392:26]
      v_35 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'h23 == fence_reg) begin // @[ICache.scala 473:33]
        v_35 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_35 <= _GEN_369;
      end
    end else begin
      v_35 <= _GEN_369;
    end
    if (reset) begin // @[ICache.scala 392:26]
      v_36 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'h24 == fence_reg) begin // @[ICache.scala 473:33]
        v_36 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_36 <= _GEN_370;
      end
    end else begin
      v_36 <= _GEN_370;
    end
    if (reset) begin // @[ICache.scala 392:26]
      v_37 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'h25 == fence_reg) begin // @[ICache.scala 473:33]
        v_37 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_37 <= _GEN_371;
      end
    end else begin
      v_37 <= _GEN_371;
    end
    if (reset) begin // @[ICache.scala 392:26]
      v_38 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'h26 == fence_reg) begin // @[ICache.scala 473:33]
        v_38 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_38 <= _GEN_372;
      end
    end else begin
      v_38 <= _GEN_372;
    end
    if (reset) begin // @[ICache.scala 392:26]
      v_39 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'h27 == fence_reg) begin // @[ICache.scala 473:33]
        v_39 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_39 <= _GEN_373;
      end
    end else begin
      v_39 <= _GEN_373;
    end
    if (reset) begin // @[ICache.scala 392:26]
      v_40 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'h28 == fence_reg) begin // @[ICache.scala 473:33]
        v_40 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_40 <= _GEN_374;
      end
    end else begin
      v_40 <= _GEN_374;
    end
    if (reset) begin // @[ICache.scala 392:26]
      v_41 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'h29 == fence_reg) begin // @[ICache.scala 473:33]
        v_41 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_41 <= _GEN_375;
      end
    end else begin
      v_41 <= _GEN_375;
    end
    if (reset) begin // @[ICache.scala 392:26]
      v_42 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'h2a == fence_reg) begin // @[ICache.scala 473:33]
        v_42 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_42 <= _GEN_376;
      end
    end else begin
      v_42 <= _GEN_376;
    end
    if (reset) begin // @[ICache.scala 392:26]
      v_43 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'h2b == fence_reg) begin // @[ICache.scala 473:33]
        v_43 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_43 <= _GEN_377;
      end
    end else begin
      v_43 <= _GEN_377;
    end
    if (reset) begin // @[ICache.scala 392:26]
      v_44 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'h2c == fence_reg) begin // @[ICache.scala 473:33]
        v_44 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_44 <= _GEN_378;
      end
    end else begin
      v_44 <= _GEN_378;
    end
    if (reset) begin // @[ICache.scala 392:26]
      v_45 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'h2d == fence_reg) begin // @[ICache.scala 473:33]
        v_45 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_45 <= _GEN_379;
      end
    end else begin
      v_45 <= _GEN_379;
    end
    if (reset) begin // @[ICache.scala 392:26]
      v_46 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'h2e == fence_reg) begin // @[ICache.scala 473:33]
        v_46 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_46 <= _GEN_380;
      end
    end else begin
      v_46 <= _GEN_380;
    end
    if (reset) begin // @[ICache.scala 392:26]
      v_47 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'h2f == fence_reg) begin // @[ICache.scala 473:33]
        v_47 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_47 <= _GEN_381;
      end
    end else begin
      v_47 <= _GEN_381;
    end
    if (reset) begin // @[ICache.scala 392:26]
      v_48 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'h30 == fence_reg) begin // @[ICache.scala 473:33]
        v_48 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_48 <= _GEN_382;
      end
    end else begin
      v_48 <= _GEN_382;
    end
    if (reset) begin // @[ICache.scala 392:26]
      v_49 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'h31 == fence_reg) begin // @[ICache.scala 473:33]
        v_49 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_49 <= _GEN_383;
      end
    end else begin
      v_49 <= _GEN_383;
    end
    if (reset) begin // @[ICache.scala 392:26]
      v_50 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'h32 == fence_reg) begin // @[ICache.scala 473:33]
        v_50 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_50 <= _GEN_384;
      end
    end else begin
      v_50 <= _GEN_384;
    end
    if (reset) begin // @[ICache.scala 392:26]
      v_51 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'h33 == fence_reg) begin // @[ICache.scala 473:33]
        v_51 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_51 <= _GEN_385;
      end
    end else begin
      v_51 <= _GEN_385;
    end
    if (reset) begin // @[ICache.scala 392:26]
      v_52 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'h34 == fence_reg) begin // @[ICache.scala 473:33]
        v_52 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_52 <= _GEN_386;
      end
    end else begin
      v_52 <= _GEN_386;
    end
    if (reset) begin // @[ICache.scala 392:26]
      v_53 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'h35 == fence_reg) begin // @[ICache.scala 473:33]
        v_53 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_53 <= _GEN_387;
      end
    end else begin
      v_53 <= _GEN_387;
    end
    if (reset) begin // @[ICache.scala 392:26]
      v_54 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'h36 == fence_reg) begin // @[ICache.scala 473:33]
        v_54 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_54 <= _GEN_388;
      end
    end else begin
      v_54 <= _GEN_388;
    end
    if (reset) begin // @[ICache.scala 392:26]
      v_55 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'h37 == fence_reg) begin // @[ICache.scala 473:33]
        v_55 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_55 <= _GEN_389;
      end
    end else begin
      v_55 <= _GEN_389;
    end
    if (reset) begin // @[ICache.scala 392:26]
      v_56 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'h38 == fence_reg) begin // @[ICache.scala 473:33]
        v_56 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_56 <= _GEN_390;
      end
    end else begin
      v_56 <= _GEN_390;
    end
    if (reset) begin // @[ICache.scala 392:26]
      v_57 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'h39 == fence_reg) begin // @[ICache.scala 473:33]
        v_57 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_57 <= _GEN_391;
      end
    end else begin
      v_57 <= _GEN_391;
    end
    if (reset) begin // @[ICache.scala 392:26]
      v_58 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'h3a == fence_reg) begin // @[ICache.scala 473:33]
        v_58 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_58 <= _GEN_392;
      end
    end else begin
      v_58 <= _GEN_392;
    end
    if (reset) begin // @[ICache.scala 392:26]
      v_59 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'h3b == fence_reg) begin // @[ICache.scala 473:33]
        v_59 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_59 <= _GEN_393;
      end
    end else begin
      v_59 <= _GEN_393;
    end
    if (reset) begin // @[ICache.scala 392:26]
      v_60 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'h3c == fence_reg) begin // @[ICache.scala 473:33]
        v_60 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_60 <= _GEN_394;
      end
    end else begin
      v_60 <= _GEN_394;
    end
    if (reset) begin // @[ICache.scala 392:26]
      v_61 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'h3d == fence_reg) begin // @[ICache.scala 473:33]
        v_61 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_61 <= _GEN_395;
      end
    end else begin
      v_61 <= _GEN_395;
    end
    if (reset) begin // @[ICache.scala 392:26]
      v_62 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'h3e == fence_reg) begin // @[ICache.scala 473:33]
        v_62 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_62 <= _GEN_396;
      end
    end else begin
      v_62 <= _GEN_396;
    end
    if (reset) begin // @[ICache.scala 392:26]
      v_63 <= 1'h0; // @[ICache.scala 392:26]
    end else if (state == 3'h5) begin // @[ICache.scala 472:32]
      if (6'h3f == fence_reg) begin // @[ICache.scala 473:33]
        v_63 <= 1'h0; // @[ICache.scala 473:33]
      end else begin
        v_63 <= _GEN_397;
      end
    end else begin
      v_63 <= _GEN_397;
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_0 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'h0 == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_0 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_1 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'h1 == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_1 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_2 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'h2 == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_2 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_3 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'h3 == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_3 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_4 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'h4 == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_4 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_5 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'h5 == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_5 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_6 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'h6 == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_6 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_7 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'h7 == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_7 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_8 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'h8 == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_8 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_9 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'h9 == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_9 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_10 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'ha == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_10 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_11 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'hb == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_11 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_12 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'hc == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_12 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_13 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'hd == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_13 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_14 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'he == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_14 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_15 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'hf == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_15 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_16 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'h10 == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_16 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_17 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'h11 == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_17 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_18 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'h12 == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_18 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_19 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'h13 == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_19 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_20 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'h14 == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_20 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_21 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'h15 == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_21 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_22 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'h16 == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_22 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_23 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'h17 == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_23 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_24 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'h18 == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_24 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_25 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'h19 == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_25 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_26 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'h1a == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_26 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_27 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'h1b == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_27 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_28 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'h1c == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_28 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_29 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'h1d == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_29 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_30 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'h1e == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_30 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_31 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'h1f == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_31 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_32 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'h20 == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_32 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_33 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'h21 == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_33 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_34 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'h22 == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_34 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_35 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'h23 == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_35 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_36 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'h24 == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_36 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_37 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'h25 == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_37 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_38 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'h26 == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_38 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_39 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'h27 == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_39 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_40 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'h28 == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_40 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_41 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'h29 == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_41 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_42 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'h2a == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_42 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_43 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'h2b == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_43 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_44 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'h2c == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_44 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_45 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'h2d == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_45 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_46 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'h2e == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_46 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_47 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'h2f == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_47 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_48 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'h30 == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_48 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_49 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'h31 == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_49 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_50 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'h32 == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_50 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_51 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'h33 == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_51 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_52 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'h34 == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_52 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_53 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'h35 == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_53 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_54 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'h36 == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_54 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_55 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'h37 == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_55 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_56 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'h38 == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_56 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_57 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'h39 == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_57 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_58 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'h3a == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_58 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_59 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'h3b == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_59 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_60 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'h3c == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_60 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_61 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'h3d == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_61 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_62 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'h3e == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_62 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 393:26]
      tag_63 <= 52'h0; // @[ICache.scala 393:26]
    end else if (_T_14) begin // @[ICache.scala 468:27]
      if (6'h3f == index_addr_stay) begin // @[ICache.scala 469:33]
        tag_63 <= tag_addr_stay; // @[ICache.scala 469:33]
      end
    end
    if (reset) begin // @[ICache.scala 403:24]
      state <= 3'h0; // @[ICache.scala 403:24]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (miss & io_imem_en) begin // @[ICache.scala 411:37]
        state <= 3'h1; // @[ICache.scala 411:44]
      end else if (io_fence_req) begin // @[ICache.scala 410:31]
        state <= 3'h4; // @[ICache.scala 410:38]
      end
    end else if (_T_2) begin // @[Conditional.scala 39:67]
      if (io_axi_valid) begin // @[ICache.scala 414:32]
        state <= 3'h2; // @[ICache.scala 414:39]
      end
    end else if (_T_3) begin // @[Conditional.scala 39:67]
      state <= 3'h3; // @[ICache.scala 417:19]
    end else begin
      state <= _GEN_6;
    end
    if (reset) begin // @[ICache.scala 405:28]
      fence_reg <= 6'h0; // @[ICache.scala 405:28]
    end else if (state == 3'h4) begin // @[ICache.scala 478:32]
      fence_reg <= 6'h0; // @[ICache.scala 478:43]
    end else if (_T_25) begin // @[ICache.scala 479:37]
      fence_reg <= _fence_reg_T_1; // @[ICache.scala 479:48]
    end
    if (reset) begin // @[Reg.scala 27:20]
      addr_stay <= 64'h0; // @[Reg.scala 27:20]
    end else if (_addr_stay_T_1) begin // @[Reg.scala 28:19]
      addr_stay <= io_imem_addr; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      axi_buffer <= 512'h0; // @[Reg.scala 27:20]
    end else if (_axi_buffer_T_1) begin // @[Reg.scala 28:19]
      axi_buffer <= io_axi_data; // @[Reg.scala 28:23]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  v_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  v_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  v_2 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  v_3 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  v_4 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  v_5 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  v_6 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  v_7 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  v_8 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  v_9 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  v_10 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  v_11 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  v_12 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  v_13 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  v_14 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  v_15 = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  v_16 = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  v_17 = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  v_18 = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  v_19 = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  v_20 = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  v_21 = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  v_22 = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  v_23 = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  v_24 = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  v_25 = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  v_26 = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  v_27 = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  v_28 = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  v_29 = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  v_30 = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  v_31 = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  v_32 = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  v_33 = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  v_34 = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  v_35 = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  v_36 = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  v_37 = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  v_38 = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  v_39 = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  v_40 = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  v_41 = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  v_42 = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  v_43 = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  v_44 = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  v_45 = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  v_46 = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  v_47 = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  v_48 = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  v_49 = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  v_50 = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  v_51 = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  v_52 = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  v_53 = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  v_54 = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  v_55 = _RAND_55[0:0];
  _RAND_56 = {1{`RANDOM}};
  v_56 = _RAND_56[0:0];
  _RAND_57 = {1{`RANDOM}};
  v_57 = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  v_58 = _RAND_58[0:0];
  _RAND_59 = {1{`RANDOM}};
  v_59 = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  v_60 = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  v_61 = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  v_62 = _RAND_62[0:0];
  _RAND_63 = {1{`RANDOM}};
  v_63 = _RAND_63[0:0];
  _RAND_64 = {2{`RANDOM}};
  tag_0 = _RAND_64[51:0];
  _RAND_65 = {2{`RANDOM}};
  tag_1 = _RAND_65[51:0];
  _RAND_66 = {2{`RANDOM}};
  tag_2 = _RAND_66[51:0];
  _RAND_67 = {2{`RANDOM}};
  tag_3 = _RAND_67[51:0];
  _RAND_68 = {2{`RANDOM}};
  tag_4 = _RAND_68[51:0];
  _RAND_69 = {2{`RANDOM}};
  tag_5 = _RAND_69[51:0];
  _RAND_70 = {2{`RANDOM}};
  tag_6 = _RAND_70[51:0];
  _RAND_71 = {2{`RANDOM}};
  tag_7 = _RAND_71[51:0];
  _RAND_72 = {2{`RANDOM}};
  tag_8 = _RAND_72[51:0];
  _RAND_73 = {2{`RANDOM}};
  tag_9 = _RAND_73[51:0];
  _RAND_74 = {2{`RANDOM}};
  tag_10 = _RAND_74[51:0];
  _RAND_75 = {2{`RANDOM}};
  tag_11 = _RAND_75[51:0];
  _RAND_76 = {2{`RANDOM}};
  tag_12 = _RAND_76[51:0];
  _RAND_77 = {2{`RANDOM}};
  tag_13 = _RAND_77[51:0];
  _RAND_78 = {2{`RANDOM}};
  tag_14 = _RAND_78[51:0];
  _RAND_79 = {2{`RANDOM}};
  tag_15 = _RAND_79[51:0];
  _RAND_80 = {2{`RANDOM}};
  tag_16 = _RAND_80[51:0];
  _RAND_81 = {2{`RANDOM}};
  tag_17 = _RAND_81[51:0];
  _RAND_82 = {2{`RANDOM}};
  tag_18 = _RAND_82[51:0];
  _RAND_83 = {2{`RANDOM}};
  tag_19 = _RAND_83[51:0];
  _RAND_84 = {2{`RANDOM}};
  tag_20 = _RAND_84[51:0];
  _RAND_85 = {2{`RANDOM}};
  tag_21 = _RAND_85[51:0];
  _RAND_86 = {2{`RANDOM}};
  tag_22 = _RAND_86[51:0];
  _RAND_87 = {2{`RANDOM}};
  tag_23 = _RAND_87[51:0];
  _RAND_88 = {2{`RANDOM}};
  tag_24 = _RAND_88[51:0];
  _RAND_89 = {2{`RANDOM}};
  tag_25 = _RAND_89[51:0];
  _RAND_90 = {2{`RANDOM}};
  tag_26 = _RAND_90[51:0];
  _RAND_91 = {2{`RANDOM}};
  tag_27 = _RAND_91[51:0];
  _RAND_92 = {2{`RANDOM}};
  tag_28 = _RAND_92[51:0];
  _RAND_93 = {2{`RANDOM}};
  tag_29 = _RAND_93[51:0];
  _RAND_94 = {2{`RANDOM}};
  tag_30 = _RAND_94[51:0];
  _RAND_95 = {2{`RANDOM}};
  tag_31 = _RAND_95[51:0];
  _RAND_96 = {2{`RANDOM}};
  tag_32 = _RAND_96[51:0];
  _RAND_97 = {2{`RANDOM}};
  tag_33 = _RAND_97[51:0];
  _RAND_98 = {2{`RANDOM}};
  tag_34 = _RAND_98[51:0];
  _RAND_99 = {2{`RANDOM}};
  tag_35 = _RAND_99[51:0];
  _RAND_100 = {2{`RANDOM}};
  tag_36 = _RAND_100[51:0];
  _RAND_101 = {2{`RANDOM}};
  tag_37 = _RAND_101[51:0];
  _RAND_102 = {2{`RANDOM}};
  tag_38 = _RAND_102[51:0];
  _RAND_103 = {2{`RANDOM}};
  tag_39 = _RAND_103[51:0];
  _RAND_104 = {2{`RANDOM}};
  tag_40 = _RAND_104[51:0];
  _RAND_105 = {2{`RANDOM}};
  tag_41 = _RAND_105[51:0];
  _RAND_106 = {2{`RANDOM}};
  tag_42 = _RAND_106[51:0];
  _RAND_107 = {2{`RANDOM}};
  tag_43 = _RAND_107[51:0];
  _RAND_108 = {2{`RANDOM}};
  tag_44 = _RAND_108[51:0];
  _RAND_109 = {2{`RANDOM}};
  tag_45 = _RAND_109[51:0];
  _RAND_110 = {2{`RANDOM}};
  tag_46 = _RAND_110[51:0];
  _RAND_111 = {2{`RANDOM}};
  tag_47 = _RAND_111[51:0];
  _RAND_112 = {2{`RANDOM}};
  tag_48 = _RAND_112[51:0];
  _RAND_113 = {2{`RANDOM}};
  tag_49 = _RAND_113[51:0];
  _RAND_114 = {2{`RANDOM}};
  tag_50 = _RAND_114[51:0];
  _RAND_115 = {2{`RANDOM}};
  tag_51 = _RAND_115[51:0];
  _RAND_116 = {2{`RANDOM}};
  tag_52 = _RAND_116[51:0];
  _RAND_117 = {2{`RANDOM}};
  tag_53 = _RAND_117[51:0];
  _RAND_118 = {2{`RANDOM}};
  tag_54 = _RAND_118[51:0];
  _RAND_119 = {2{`RANDOM}};
  tag_55 = _RAND_119[51:0];
  _RAND_120 = {2{`RANDOM}};
  tag_56 = _RAND_120[51:0];
  _RAND_121 = {2{`RANDOM}};
  tag_57 = _RAND_121[51:0];
  _RAND_122 = {2{`RANDOM}};
  tag_58 = _RAND_122[51:0];
  _RAND_123 = {2{`RANDOM}};
  tag_59 = _RAND_123[51:0];
  _RAND_124 = {2{`RANDOM}};
  tag_60 = _RAND_124[51:0];
  _RAND_125 = {2{`RANDOM}};
  tag_61 = _RAND_125[51:0];
  _RAND_126 = {2{`RANDOM}};
  tag_62 = _RAND_126[51:0];
  _RAND_127 = {2{`RANDOM}};
  tag_63 = _RAND_127[51:0];
  _RAND_128 = {1{`RANDOM}};
  state = _RAND_128[2:0];
  _RAND_129 = {1{`RANDOM}};
  fence_reg = _RAND_129[5:0];
  _RAND_130 = {2{`RANDOM}};
  addr_stay = _RAND_130[63:0];
  _RAND_131 = {16{`RANDOM}};
  axi_buffer = _RAND_131[511:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_040596_ICacheSocAxi(
  input          clock,
  input          reset,
  input          io_in_req,
  input  [63:0]  io_in_addr,
  output         io_in_valid,
  output [511:0] io_in_data,
  output         io_out0_req,
  output [63:0]  io_out0_addr,
  input          io_out0_valid,
  input  [511:0] io_out0_data,
  output         io_out1_req,
  output [31:0]  io_out1_addr,
  input          io_out1_valid,
  input  [63:0]  io_out1_data
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] state; // @[CacheBypass.scala 131:24]
  reg [3:0] cnt; // @[CacheBypass.scala 133:22]
  reg [31:0] buffer_0; // @[CacheBypass.scala 134:25]
  reg [31:0] buffer_1; // @[CacheBypass.scala 134:25]
  reg [31:0] buffer_2; // @[CacheBypass.scala 134:25]
  reg [31:0] buffer_3; // @[CacheBypass.scala 134:25]
  reg [31:0] buffer_4; // @[CacheBypass.scala 134:25]
  reg [31:0] buffer_5; // @[CacheBypass.scala 134:25]
  reg [31:0] buffer_6; // @[CacheBypass.scala 134:25]
  reg [31:0] buffer_7; // @[CacheBypass.scala 134:25]
  reg [31:0] buffer_8; // @[CacheBypass.scala 134:25]
  reg [31:0] buffer_9; // @[CacheBypass.scala 134:25]
  reg [31:0] buffer_10; // @[CacheBypass.scala 134:25]
  reg [31:0] buffer_11; // @[CacheBypass.scala 134:25]
  reg [31:0] buffer_12; // @[CacheBypass.scala 134:25]
  reg [31:0] buffer_13; // @[CacheBypass.scala 134:25]
  reg [31:0] buffer_14; // @[CacheBypass.scala 134:25]
  reg [31:0] buffer_15; // @[CacheBypass.scala 134:25]
  wire  _T = 3'h0 == state; // @[Conditional.scala 37:30]
  wire  _T_3 = 3'h1 == state; // @[Conditional.scala 37:30]
  wire  _T_4 = 3'h2 == state; // @[Conditional.scala 37:30]
  wire  _T_5 = 3'h3 == state; // @[Conditional.scala 37:30]
  wire [2:0] _GEN_3 = io_out1_valid ? 3'h4 : state; // @[CacheBypass.scala 149:32 CacheBypass.scala 149:39 CacheBypass.scala 131:24]
  wire  _T_6 = 3'h4 == state; // @[Conditional.scala 37:30]
  wire [2:0] _GEN_4 = cnt == 4'hf ? 3'h5 : 3'h3; // @[CacheBypass.scala 152:40 CacheBypass.scala 152:47 CacheBypass.scala 153:30]
  wire  _T_8 = 3'h5 == state; // @[Conditional.scala 37:30]
  wire [2:0] _GEN_5 = _T_8 ? 3'h0 : state; // @[Conditional.scala 39:67 CacheBypass.scala 156:19 CacheBypass.scala 131:24]
  wire [2:0] _GEN_6 = _T_6 ? _GEN_4 : _GEN_5; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_7 = _T_5 ? _GEN_3 : _GEN_6; // @[Conditional.scala 39:67]
  wire  _T_9 = state == 3'h4; // @[CacheBypass.scala 160:16]
  wire [288:0] lo_8 = {buffer_8,buffer_7,buffer_6,buffer_5,buffer_4,buffer_3,buffer_2,buffer_1,buffer_0,1'h0}; // @[Cat.scala 30:58]
  wire [512:0] _T_10 = {buffer_15,buffer_14,buffer_13,buffer_12,buffer_11,buffer_10,buffer_9,lo_8}; // @[Cat.scala 30:58]
  wire [511:0] data = _T_10[512:1]; // @[CacheBypass.scala 163:16]
  wire [3:0] _cnt_T_1 = cnt + 4'h1; // @[CacheBypass.scala 165:41]
  wire  _T_12 = state == 3'h5; // @[CacheBypass.scala 166:21]
  wire [5:0] _GEN_47 = {cnt, 2'h0}; // @[CacheBypass.scala 172:39]
  wire [6:0] _io_out1_addr_T = {{1'd0}, _GEN_47}; // @[CacheBypass.scala 172:39]
  wire [63:0] _GEN_48 = {{57'd0}, _io_out1_addr_T}; // @[CacheBypass.scala 172:32]
  wire [63:0] _io_out1_addr_T_2 = io_in_addr + _GEN_48; // @[CacheBypass.scala 172:32]
  wire  _io_in_valid_T_1 = state == 3'h2; // @[CacheBypass.scala 174:52]
  wire [511:0] _GEN_45 = _T_12 ? data : 512'h0; // @[CacheBypass.scala 176:38 CacheBypass.scala 176:50 CacheBypass.scala 177:27]
  assign io_in_valid = _T_12 | state == 3'h2; // @[CacheBypass.scala 174:43]
  assign io_in_data = _io_in_valid_T_1 ? io_out0_data : _GEN_45; // @[CacheBypass.scala 175:25 CacheBypass.scala 175:37]
  assign io_out0_req = state == 3'h1; // @[CacheBypass.scala 169:27]
  assign io_out0_addr = io_in_addr; // @[CacheBypass.scala 170:18]
  assign io_out1_req = state == 3'h3; // @[CacheBypass.scala 171:27]
  assign io_out1_addr = _io_out1_addr_T_2[31:0]; // @[CacheBypass.scala 172:18]
  always @(posedge clock) begin
    if (reset) begin // @[CacheBypass.scala 131:24]
      state <= 3'h0; // @[CacheBypass.scala 131:24]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (io_in_req & io_in_addr < 64'h80000000) begin // @[CacheBypass.scala 138:60]
        state <= 3'h3; // @[CacheBypass.scala 138:67]
      end else if (io_in_req) begin // @[CacheBypass.scala 139:33]
        state <= 3'h1; // @[CacheBypass.scala 139:40]
      end
    end else if (_T_3) begin // @[Conditional.scala 39:67]
      if (io_out0_valid) begin // @[CacheBypass.scala 143:32]
        state <= 3'h2; // @[CacheBypass.scala 143:39]
      end
    end else if (_T_4) begin // @[Conditional.scala 39:67]
      state <= 3'h0; // @[CacheBypass.scala 146:19]
    end else begin
      state <= _GEN_7;
    end
    if (reset) begin // @[CacheBypass.scala 133:22]
      cnt <= 4'h0; // @[CacheBypass.scala 133:22]
    end else if (_T_9) begin // @[CacheBypass.scala 165:29]
      cnt <= _cnt_T_1; // @[CacheBypass.scala 165:34]
    end else if (state == 3'h5) begin // @[CacheBypass.scala 166:38]
      cnt <= 4'h0; // @[CacheBypass.scala 166:43]
    end
    if (reset) begin // @[CacheBypass.scala 134:25]
      buffer_0 <= 32'h0; // @[CacheBypass.scala 134:25]
    end else if (state == 3'h4) begin // @[CacheBypass.scala 160:29]
      if (4'h0 == cnt) begin // @[CacheBypass.scala 160:42]
        buffer_0 <= io_out1_data[31:0]; // @[CacheBypass.scala 160:42]
      end
    end
    if (reset) begin // @[CacheBypass.scala 134:25]
      buffer_1 <= 32'h0; // @[CacheBypass.scala 134:25]
    end else if (state == 3'h4) begin // @[CacheBypass.scala 160:29]
      if (4'h1 == cnt) begin // @[CacheBypass.scala 160:42]
        buffer_1 <= io_out1_data[31:0]; // @[CacheBypass.scala 160:42]
      end
    end
    if (reset) begin // @[CacheBypass.scala 134:25]
      buffer_2 <= 32'h0; // @[CacheBypass.scala 134:25]
    end else if (state == 3'h4) begin // @[CacheBypass.scala 160:29]
      if (4'h2 == cnt) begin // @[CacheBypass.scala 160:42]
        buffer_2 <= io_out1_data[31:0]; // @[CacheBypass.scala 160:42]
      end
    end
    if (reset) begin // @[CacheBypass.scala 134:25]
      buffer_3 <= 32'h0; // @[CacheBypass.scala 134:25]
    end else if (state == 3'h4) begin // @[CacheBypass.scala 160:29]
      if (4'h3 == cnt) begin // @[CacheBypass.scala 160:42]
        buffer_3 <= io_out1_data[31:0]; // @[CacheBypass.scala 160:42]
      end
    end
    if (reset) begin // @[CacheBypass.scala 134:25]
      buffer_4 <= 32'h0; // @[CacheBypass.scala 134:25]
    end else if (state == 3'h4) begin // @[CacheBypass.scala 160:29]
      if (4'h4 == cnt) begin // @[CacheBypass.scala 160:42]
        buffer_4 <= io_out1_data[31:0]; // @[CacheBypass.scala 160:42]
      end
    end
    if (reset) begin // @[CacheBypass.scala 134:25]
      buffer_5 <= 32'h0; // @[CacheBypass.scala 134:25]
    end else if (state == 3'h4) begin // @[CacheBypass.scala 160:29]
      if (4'h5 == cnt) begin // @[CacheBypass.scala 160:42]
        buffer_5 <= io_out1_data[31:0]; // @[CacheBypass.scala 160:42]
      end
    end
    if (reset) begin // @[CacheBypass.scala 134:25]
      buffer_6 <= 32'h0; // @[CacheBypass.scala 134:25]
    end else if (state == 3'h4) begin // @[CacheBypass.scala 160:29]
      if (4'h6 == cnt) begin // @[CacheBypass.scala 160:42]
        buffer_6 <= io_out1_data[31:0]; // @[CacheBypass.scala 160:42]
      end
    end
    if (reset) begin // @[CacheBypass.scala 134:25]
      buffer_7 <= 32'h0; // @[CacheBypass.scala 134:25]
    end else if (state == 3'h4) begin // @[CacheBypass.scala 160:29]
      if (4'h7 == cnt) begin // @[CacheBypass.scala 160:42]
        buffer_7 <= io_out1_data[31:0]; // @[CacheBypass.scala 160:42]
      end
    end
    if (reset) begin // @[CacheBypass.scala 134:25]
      buffer_8 <= 32'h0; // @[CacheBypass.scala 134:25]
    end else if (state == 3'h4) begin // @[CacheBypass.scala 160:29]
      if (4'h8 == cnt) begin // @[CacheBypass.scala 160:42]
        buffer_8 <= io_out1_data[31:0]; // @[CacheBypass.scala 160:42]
      end
    end
    if (reset) begin // @[CacheBypass.scala 134:25]
      buffer_9 <= 32'h0; // @[CacheBypass.scala 134:25]
    end else if (state == 3'h4) begin // @[CacheBypass.scala 160:29]
      if (4'h9 == cnt) begin // @[CacheBypass.scala 160:42]
        buffer_9 <= io_out1_data[31:0]; // @[CacheBypass.scala 160:42]
      end
    end
    if (reset) begin // @[CacheBypass.scala 134:25]
      buffer_10 <= 32'h0; // @[CacheBypass.scala 134:25]
    end else if (state == 3'h4) begin // @[CacheBypass.scala 160:29]
      if (4'ha == cnt) begin // @[CacheBypass.scala 160:42]
        buffer_10 <= io_out1_data[31:0]; // @[CacheBypass.scala 160:42]
      end
    end
    if (reset) begin // @[CacheBypass.scala 134:25]
      buffer_11 <= 32'h0; // @[CacheBypass.scala 134:25]
    end else if (state == 3'h4) begin // @[CacheBypass.scala 160:29]
      if (4'hb == cnt) begin // @[CacheBypass.scala 160:42]
        buffer_11 <= io_out1_data[31:0]; // @[CacheBypass.scala 160:42]
      end
    end
    if (reset) begin // @[CacheBypass.scala 134:25]
      buffer_12 <= 32'h0; // @[CacheBypass.scala 134:25]
    end else if (state == 3'h4) begin // @[CacheBypass.scala 160:29]
      if (4'hc == cnt) begin // @[CacheBypass.scala 160:42]
        buffer_12 <= io_out1_data[31:0]; // @[CacheBypass.scala 160:42]
      end
    end
    if (reset) begin // @[CacheBypass.scala 134:25]
      buffer_13 <= 32'h0; // @[CacheBypass.scala 134:25]
    end else if (state == 3'h4) begin // @[CacheBypass.scala 160:29]
      if (4'hd == cnt) begin // @[CacheBypass.scala 160:42]
        buffer_13 <= io_out1_data[31:0]; // @[CacheBypass.scala 160:42]
      end
    end
    if (reset) begin // @[CacheBypass.scala 134:25]
      buffer_14 <= 32'h0; // @[CacheBypass.scala 134:25]
    end else if (state == 3'h4) begin // @[CacheBypass.scala 160:29]
      if (4'he == cnt) begin // @[CacheBypass.scala 160:42]
        buffer_14 <= io_out1_data[31:0]; // @[CacheBypass.scala 160:42]
      end
    end
    if (reset) begin // @[CacheBypass.scala 134:25]
      buffer_15 <= 32'h0; // @[CacheBypass.scala 134:25]
    end else if (state == 3'h4) begin // @[CacheBypass.scala 160:29]
      if (4'hf == cnt) begin // @[CacheBypass.scala 160:42]
        buffer_15 <= io_out1_data[31:0]; // @[CacheBypass.scala 160:42]
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  state = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  cnt = _RAND_1[3:0];
  _RAND_2 = {1{`RANDOM}};
  buffer_0 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  buffer_1 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  buffer_2 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  buffer_3 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  buffer_4 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  buffer_5 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  buffer_6 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  buffer_7 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  buffer_8 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  buffer_9 = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  buffer_10 = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  buffer_11 = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  buffer_12 = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  buffer_13 = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  buffer_14 = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  buffer_15 = _RAND_17[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_040596_DMMIO(
  input         clock,
  input         reset,
  input         io_dmem_en,
  input         io_dmem_op,
  input  [63:0] io_dmem_addr,
  input  [63:0] io_dmem_wdata,
  input  [7:0]  io_dmem_wmask,
  input  [31:0] io_dmem_transfer,
  output        io_dmem_ok,
  output [63:0] io_dmem_rdata,
  output        io_mem0_en,
  output        io_mem0_op,
  output [63:0] io_mem0_addr,
  output [63:0] io_mem0_wdata,
  output [7:0]  io_mem0_wmask,
  input         io_mem0_ok,
  input  [63:0] io_mem0_rdata,
  output        io_mem1_en,
  output        io_mem1_op,
  output [63:0] io_mem1_addr,
  output [63:0] io_mem1_wdata,
  output [7:0]  io_mem1_wmask,
  input  [63:0] io_mem1_rdata,
  output        io_mem2_en,
  output        io_mem2_op,
  output [63:0] io_mem2_addr,
  output [63:0] io_mem2_wdata,
  output [7:0]  io_mem2_wmask,
  output [31:0] io_mem2_transfer,
  input         io_mem2_ok,
  input  [63:0] io_mem2_rdata
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire [1:0] _GEN_0 = io_dmem_addr < 64'h80000000 | 64'hfc000000 <= io_dmem_addr ? 2'h2 : 2'h0; // @[MMIO.scala 62:85 MMIO.scala 62:90 MMIO.scala 63:28]
  wire [1:0] _GEN_1 = 64'h2000000 <= io_dmem_addr & io_dmem_addr < 64'h200c000 ? 2'h1 : _GEN_0; // @[MMIO.scala 61:80 MMIO.scala 61:85]
  wire [1:0] _GEN_2 = ~io_mem2_ok ? 2'h2 : _GEN_1; // @[MMIO.scala 57:27 MMIO.scala 57:32]
  wire [1:0] sel = ~io_mem0_ok ? 2'h0 : _GEN_2; // @[MMIO.scala 55:22 MMIO.scala 55:27]
  reg [1:0] sel_r; // @[Reg.scala 27:20]
  wire  out_ok = 2'h2 == sel_r ? io_mem2_ok : 2'h1 == sel_r | 2'h0 == sel_r & io_mem0_ok; // @[Mux.scala 80:57]
  wire  _sel_r_T = out_ok & io_dmem_en; // @[MMIO.scala 73:44]
  wire  _io_mem0_en_T = sel == 2'h0; // @[MMIO.scala 75:36]
  wire  _io_mem1_en_T = sel == 2'h1; // @[MMIO.scala 81:36]
  wire  _io_mem2_en_T = sel == 2'h2; // @[MMIO.scala 87:36]
  wire [63:0] _out_rdata_T_1 = 2'h0 == sel_r ? io_mem0_rdata : 64'h0; // @[Mux.scala 80:57]
  wire [63:0] _out_rdata_T_3 = 2'h1 == sel_r ? io_mem1_rdata : _out_rdata_T_1; // @[Mux.scala 80:57]
  assign io_dmem_ok = 2'h2 == sel_r ? io_mem2_ok : 2'h1 == sel_r | 2'h0 == sel_r & io_mem0_ok; // @[Mux.scala 80:57]
  assign io_dmem_rdata = 2'h2 == sel_r ? io_mem2_rdata : _out_rdata_T_3; // @[Mux.scala 80:57]
  assign io_mem0_en = sel == 2'h0 & io_dmem_en; // @[MMIO.scala 75:31]
  assign io_mem0_op = _io_mem0_en_T & io_dmem_op; // @[MMIO.scala 76:31]
  assign io_mem0_addr = _io_mem0_en_T ? io_dmem_addr : 64'h0; // @[MMIO.scala 77:31]
  assign io_mem0_wdata = _io_mem0_en_T ? io_dmem_wdata : 64'h0; // @[MMIO.scala 78:31]
  assign io_mem0_wmask = _io_mem0_en_T ? io_dmem_wmask : 8'h0; // @[MMIO.scala 79:31]
  assign io_mem1_en = sel == 2'h1 & io_dmem_en; // @[MMIO.scala 81:31]
  assign io_mem1_op = _io_mem1_en_T & io_dmem_op; // @[MMIO.scala 82:31]
  assign io_mem1_addr = _io_mem1_en_T ? io_dmem_addr : 64'h0; // @[MMIO.scala 83:31]
  assign io_mem1_wdata = _io_mem1_en_T ? io_dmem_wdata : 64'h0; // @[MMIO.scala 84:31]
  assign io_mem1_wmask = _io_mem1_en_T ? io_dmem_wmask : 8'h0; // @[MMIO.scala 85:31]
  assign io_mem2_en = sel == 2'h2 & io_dmem_en; // @[MMIO.scala 87:31]
  assign io_mem2_op = _io_mem2_en_T & io_dmem_op; // @[MMIO.scala 88:31]
  assign io_mem2_addr = _io_mem2_en_T ? io_dmem_addr : 64'h0; // @[MMIO.scala 89:31]
  assign io_mem2_wdata = _io_mem2_en_T ? io_dmem_wdata : 64'h0; // @[MMIO.scala 90:31]
  assign io_mem2_wmask = _io_mem2_en_T ? io_dmem_wmask : 8'h0; // @[MMIO.scala 91:31]
  assign io_mem2_transfer = _io_mem2_en_T ? io_dmem_transfer : 32'h0; // @[MMIO.scala 92:31]
  always @(posedge clock) begin
    if (reset) begin // @[Reg.scala 27:20]
      sel_r <= 2'h0; // @[Reg.scala 27:20]
    end else if (_sel_r_T) begin // @[Reg.scala 28:19]
      if (~io_mem0_ok) begin // @[MMIO.scala 55:22]
        sel_r <= 2'h0; // @[MMIO.scala 55:27]
      end else if (~io_mem2_ok) begin // @[MMIO.scala 57:27]
        sel_r <= 2'h2; // @[MMIO.scala 57:32]
      end else begin
        sel_r <= _GEN_1;
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  sel_r = _RAND_0[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_040596_DCache(
  input          clock,
  input          reset,
  input          io_dmem_en,
  input          io_dmem_op,
  input  [63:0]  io_dmem_addr,
  input  [63:0]  io_dmem_wdata,
  input  [7:0]   io_dmem_wmask,
  output         io_dmem_ok,
  output [63:0]  io_dmem_rdata,
  output         io_axi_req,
  output [63:0]  io_axi_raddr,
  input          io_axi_rvalid,
  input  [511:0] io_axi_rdata,
  output         io_axi_weq,
  output [63:0]  io_axi_waddr,
  output [511:0] io_axi_wdata,
  input          io_axi_wdone,
  input          io_fence_req,
  output         io_fence_done,
  output [5:0]   io_sram0_addr,
  output         io_sram0_wen,
  output [127:0] io_sram0_wmask,
  output [127:0] io_sram0_wdata,
  input  [127:0] io_sram0_rdata,
  output [5:0]   io_sram1_addr,
  output         io_sram1_wen,
  output [127:0] io_sram1_wmask,
  output [127:0] io_sram1_wdata,
  input  [127:0] io_sram1_rdata,
  output [5:0]   io_sram2_addr,
  output         io_sram2_wen,
  output [127:0] io_sram2_wmask,
  output [127:0] io_sram2_wdata,
  input  [127:0] io_sram2_rdata,
  output [5:0]   io_sram3_addr,
  output         io_sram3_wen,
  output [127:0] io_sram3_wmask,
  output [127:0] io_sram3_wdata,
  input  [127:0] io_sram3_rdata
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_66;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [31:0] _RAND_73;
  reg [31:0] _RAND_74;
  reg [31:0] _RAND_75;
  reg [31:0] _RAND_76;
  reg [31:0] _RAND_77;
  reg [31:0] _RAND_78;
  reg [31:0] _RAND_79;
  reg [31:0] _RAND_80;
  reg [31:0] _RAND_81;
  reg [31:0] _RAND_82;
  reg [31:0] _RAND_83;
  reg [31:0] _RAND_84;
  reg [31:0] _RAND_85;
  reg [31:0] _RAND_86;
  reg [31:0] _RAND_87;
  reg [31:0] _RAND_88;
  reg [31:0] _RAND_89;
  reg [31:0] _RAND_90;
  reg [31:0] _RAND_91;
  reg [31:0] _RAND_92;
  reg [31:0] _RAND_93;
  reg [31:0] _RAND_94;
  reg [31:0] _RAND_95;
  reg [31:0] _RAND_96;
  reg [31:0] _RAND_97;
  reg [31:0] _RAND_98;
  reg [31:0] _RAND_99;
  reg [31:0] _RAND_100;
  reg [31:0] _RAND_101;
  reg [31:0] _RAND_102;
  reg [31:0] _RAND_103;
  reg [31:0] _RAND_104;
  reg [31:0] _RAND_105;
  reg [31:0] _RAND_106;
  reg [31:0] _RAND_107;
  reg [31:0] _RAND_108;
  reg [31:0] _RAND_109;
  reg [31:0] _RAND_110;
  reg [31:0] _RAND_111;
  reg [31:0] _RAND_112;
  reg [31:0] _RAND_113;
  reg [31:0] _RAND_114;
  reg [31:0] _RAND_115;
  reg [31:0] _RAND_116;
  reg [31:0] _RAND_117;
  reg [31:0] _RAND_118;
  reg [31:0] _RAND_119;
  reg [31:0] _RAND_120;
  reg [31:0] _RAND_121;
  reg [31:0] _RAND_122;
  reg [31:0] _RAND_123;
  reg [31:0] _RAND_124;
  reg [31:0] _RAND_125;
  reg [31:0] _RAND_126;
  reg [31:0] _RAND_127;
  reg [63:0] _RAND_128;
  reg [63:0] _RAND_129;
  reg [63:0] _RAND_130;
  reg [63:0] _RAND_131;
  reg [63:0] _RAND_132;
  reg [63:0] _RAND_133;
  reg [63:0] _RAND_134;
  reg [63:0] _RAND_135;
  reg [63:0] _RAND_136;
  reg [63:0] _RAND_137;
  reg [63:0] _RAND_138;
  reg [63:0] _RAND_139;
  reg [63:0] _RAND_140;
  reg [63:0] _RAND_141;
  reg [63:0] _RAND_142;
  reg [63:0] _RAND_143;
  reg [63:0] _RAND_144;
  reg [63:0] _RAND_145;
  reg [63:0] _RAND_146;
  reg [63:0] _RAND_147;
  reg [63:0] _RAND_148;
  reg [63:0] _RAND_149;
  reg [63:0] _RAND_150;
  reg [63:0] _RAND_151;
  reg [63:0] _RAND_152;
  reg [63:0] _RAND_153;
  reg [63:0] _RAND_154;
  reg [63:0] _RAND_155;
  reg [63:0] _RAND_156;
  reg [63:0] _RAND_157;
  reg [63:0] _RAND_158;
  reg [63:0] _RAND_159;
  reg [63:0] _RAND_160;
  reg [63:0] _RAND_161;
  reg [63:0] _RAND_162;
  reg [63:0] _RAND_163;
  reg [63:0] _RAND_164;
  reg [63:0] _RAND_165;
  reg [63:0] _RAND_166;
  reg [63:0] _RAND_167;
  reg [63:0] _RAND_168;
  reg [63:0] _RAND_169;
  reg [63:0] _RAND_170;
  reg [63:0] _RAND_171;
  reg [63:0] _RAND_172;
  reg [63:0] _RAND_173;
  reg [63:0] _RAND_174;
  reg [63:0] _RAND_175;
  reg [63:0] _RAND_176;
  reg [63:0] _RAND_177;
  reg [63:0] _RAND_178;
  reg [63:0] _RAND_179;
  reg [63:0] _RAND_180;
  reg [63:0] _RAND_181;
  reg [63:0] _RAND_182;
  reg [63:0] _RAND_183;
  reg [63:0] _RAND_184;
  reg [63:0] _RAND_185;
  reg [63:0] _RAND_186;
  reg [63:0] _RAND_187;
  reg [63:0] _RAND_188;
  reg [63:0] _RAND_189;
  reg [63:0] _RAND_190;
  reg [63:0] _RAND_191;
  reg [31:0] _RAND_192;
  reg [31:0] _RAND_193;
  reg [63:0] _RAND_194;
  reg [31:0] _RAND_195;
  reg [63:0] _RAND_196;
  reg [31:0] _RAND_197;
  reg [511:0] _RAND_198;
  reg [511:0] _RAND_199;
  reg [511:0] _RAND_200;
`endif // RANDOMIZE_REG_INIT
  wire  SRam_4k_clock; // @[DCache.scala 338:24]
  wire  SRam_4k_reset; // @[DCache.scala 338:24]
  wire [5:0] SRam_4k_io_addr; // @[DCache.scala 338:24]
  wire  SRam_4k_io_cen; // @[DCache.scala 338:24]
  wire  SRam_4k_io_wen; // @[DCache.scala 338:24]
  wire [511:0] SRam_4k_io_wmask; // @[DCache.scala 338:24]
  wire [511:0] SRam_4k_io_wdata; // @[DCache.scala 338:24]
  wire [511:0] SRam_4k_io_rdata; // @[DCache.scala 338:24]
  wire [5:0] SRam_4k_io_sram0_addr; // @[DCache.scala 338:24]
  wire  SRam_4k_io_sram0_wen; // @[DCache.scala 338:24]
  wire [127:0] SRam_4k_io_sram0_wmask; // @[DCache.scala 338:24]
  wire [127:0] SRam_4k_io_sram0_wdata; // @[DCache.scala 338:24]
  wire [127:0] SRam_4k_io_sram0_rdata; // @[DCache.scala 338:24]
  wire [5:0] SRam_4k_io_sram1_addr; // @[DCache.scala 338:24]
  wire  SRam_4k_io_sram1_wen; // @[DCache.scala 338:24]
  wire [127:0] SRam_4k_io_sram1_wmask; // @[DCache.scala 338:24]
  wire [127:0] SRam_4k_io_sram1_wdata; // @[DCache.scala 338:24]
  wire [127:0] SRam_4k_io_sram1_rdata; // @[DCache.scala 338:24]
  wire [5:0] SRam_4k_io_sram2_addr; // @[DCache.scala 338:24]
  wire  SRam_4k_io_sram2_wen; // @[DCache.scala 338:24]
  wire [127:0] SRam_4k_io_sram2_wmask; // @[DCache.scala 338:24]
  wire [127:0] SRam_4k_io_sram2_wdata; // @[DCache.scala 338:24]
  wire [127:0] SRam_4k_io_sram2_rdata; // @[DCache.scala 338:24]
  wire [5:0] SRam_4k_io_sram3_addr; // @[DCache.scala 338:24]
  wire  SRam_4k_io_sram3_wen; // @[DCache.scala 338:24]
  wire [127:0] SRam_4k_io_sram3_wmask; // @[DCache.scala 338:24]
  wire [127:0] SRam_4k_io_sram3_wdata; // @[DCache.scala 338:24]
  wire [127:0] SRam_4k_io_sram3_rdata; // @[DCache.scala 338:24]
  wire [63:0] addr = io_dmem_addr & 64'hfffffffffffffff8; // @[DCache.scala 329:29]
  wire [51:0] tag_addr = addr[63:12]; // @[DCache.scala 330:27]
  wire [5:0] index_addr = addr[11:6]; // @[DCache.scala 331:27]
  wire [5:0] offset_addr = addr[5:0]; // @[DCache.scala 332:27]
  reg  v_0; // @[DCache.scala 334:25]
  reg  v_1; // @[DCache.scala 334:25]
  reg  v_2; // @[DCache.scala 334:25]
  reg  v_3; // @[DCache.scala 334:25]
  reg  v_4; // @[DCache.scala 334:25]
  reg  v_5; // @[DCache.scala 334:25]
  reg  v_6; // @[DCache.scala 334:25]
  reg  v_7; // @[DCache.scala 334:25]
  reg  v_8; // @[DCache.scala 334:25]
  reg  v_9; // @[DCache.scala 334:25]
  reg  v_10; // @[DCache.scala 334:25]
  reg  v_11; // @[DCache.scala 334:25]
  reg  v_12; // @[DCache.scala 334:25]
  reg  v_13; // @[DCache.scala 334:25]
  reg  v_14; // @[DCache.scala 334:25]
  reg  v_15; // @[DCache.scala 334:25]
  reg  v_16; // @[DCache.scala 334:25]
  reg  v_17; // @[DCache.scala 334:25]
  reg  v_18; // @[DCache.scala 334:25]
  reg  v_19; // @[DCache.scala 334:25]
  reg  v_20; // @[DCache.scala 334:25]
  reg  v_21; // @[DCache.scala 334:25]
  reg  v_22; // @[DCache.scala 334:25]
  reg  v_23; // @[DCache.scala 334:25]
  reg  v_24; // @[DCache.scala 334:25]
  reg  v_25; // @[DCache.scala 334:25]
  reg  v_26; // @[DCache.scala 334:25]
  reg  v_27; // @[DCache.scala 334:25]
  reg  v_28; // @[DCache.scala 334:25]
  reg  v_29; // @[DCache.scala 334:25]
  reg  v_30; // @[DCache.scala 334:25]
  reg  v_31; // @[DCache.scala 334:25]
  reg  v_32; // @[DCache.scala 334:25]
  reg  v_33; // @[DCache.scala 334:25]
  reg  v_34; // @[DCache.scala 334:25]
  reg  v_35; // @[DCache.scala 334:25]
  reg  v_36; // @[DCache.scala 334:25]
  reg  v_37; // @[DCache.scala 334:25]
  reg  v_38; // @[DCache.scala 334:25]
  reg  v_39; // @[DCache.scala 334:25]
  reg  v_40; // @[DCache.scala 334:25]
  reg  v_41; // @[DCache.scala 334:25]
  reg  v_42; // @[DCache.scala 334:25]
  reg  v_43; // @[DCache.scala 334:25]
  reg  v_44; // @[DCache.scala 334:25]
  reg  v_45; // @[DCache.scala 334:25]
  reg  v_46; // @[DCache.scala 334:25]
  reg  v_47; // @[DCache.scala 334:25]
  reg  v_48; // @[DCache.scala 334:25]
  reg  v_49; // @[DCache.scala 334:25]
  reg  v_50; // @[DCache.scala 334:25]
  reg  v_51; // @[DCache.scala 334:25]
  reg  v_52; // @[DCache.scala 334:25]
  reg  v_53; // @[DCache.scala 334:25]
  reg  v_54; // @[DCache.scala 334:25]
  reg  v_55; // @[DCache.scala 334:25]
  reg  v_56; // @[DCache.scala 334:25]
  reg  v_57; // @[DCache.scala 334:25]
  reg  v_58; // @[DCache.scala 334:25]
  reg  v_59; // @[DCache.scala 334:25]
  reg  v_60; // @[DCache.scala 334:25]
  reg  v_61; // @[DCache.scala 334:25]
  reg  v_62; // @[DCache.scala 334:25]
  reg  v_63; // @[DCache.scala 334:25]
  reg  d_0; // @[DCache.scala 335:25]
  reg  d_1; // @[DCache.scala 335:25]
  reg  d_2; // @[DCache.scala 335:25]
  reg  d_3; // @[DCache.scala 335:25]
  reg  d_4; // @[DCache.scala 335:25]
  reg  d_5; // @[DCache.scala 335:25]
  reg  d_6; // @[DCache.scala 335:25]
  reg  d_7; // @[DCache.scala 335:25]
  reg  d_8; // @[DCache.scala 335:25]
  reg  d_9; // @[DCache.scala 335:25]
  reg  d_10; // @[DCache.scala 335:25]
  reg  d_11; // @[DCache.scala 335:25]
  reg  d_12; // @[DCache.scala 335:25]
  reg  d_13; // @[DCache.scala 335:25]
  reg  d_14; // @[DCache.scala 335:25]
  reg  d_15; // @[DCache.scala 335:25]
  reg  d_16; // @[DCache.scala 335:25]
  reg  d_17; // @[DCache.scala 335:25]
  reg  d_18; // @[DCache.scala 335:25]
  reg  d_19; // @[DCache.scala 335:25]
  reg  d_20; // @[DCache.scala 335:25]
  reg  d_21; // @[DCache.scala 335:25]
  reg  d_22; // @[DCache.scala 335:25]
  reg  d_23; // @[DCache.scala 335:25]
  reg  d_24; // @[DCache.scala 335:25]
  reg  d_25; // @[DCache.scala 335:25]
  reg  d_26; // @[DCache.scala 335:25]
  reg  d_27; // @[DCache.scala 335:25]
  reg  d_28; // @[DCache.scala 335:25]
  reg  d_29; // @[DCache.scala 335:25]
  reg  d_30; // @[DCache.scala 335:25]
  reg  d_31; // @[DCache.scala 335:25]
  reg  d_32; // @[DCache.scala 335:25]
  reg  d_33; // @[DCache.scala 335:25]
  reg  d_34; // @[DCache.scala 335:25]
  reg  d_35; // @[DCache.scala 335:25]
  reg  d_36; // @[DCache.scala 335:25]
  reg  d_37; // @[DCache.scala 335:25]
  reg  d_38; // @[DCache.scala 335:25]
  reg  d_39; // @[DCache.scala 335:25]
  reg  d_40; // @[DCache.scala 335:25]
  reg  d_41; // @[DCache.scala 335:25]
  reg  d_42; // @[DCache.scala 335:25]
  reg  d_43; // @[DCache.scala 335:25]
  reg  d_44; // @[DCache.scala 335:25]
  reg  d_45; // @[DCache.scala 335:25]
  reg  d_46; // @[DCache.scala 335:25]
  reg  d_47; // @[DCache.scala 335:25]
  reg  d_48; // @[DCache.scala 335:25]
  reg  d_49; // @[DCache.scala 335:25]
  reg  d_50; // @[DCache.scala 335:25]
  reg  d_51; // @[DCache.scala 335:25]
  reg  d_52; // @[DCache.scala 335:25]
  reg  d_53; // @[DCache.scala 335:25]
  reg  d_54; // @[DCache.scala 335:25]
  reg  d_55; // @[DCache.scala 335:25]
  reg  d_56; // @[DCache.scala 335:25]
  reg  d_57; // @[DCache.scala 335:25]
  reg  d_58; // @[DCache.scala 335:25]
  reg  d_59; // @[DCache.scala 335:25]
  reg  d_60; // @[DCache.scala 335:25]
  reg  d_61; // @[DCache.scala 335:25]
  reg  d_62; // @[DCache.scala 335:25]
  reg  d_63; // @[DCache.scala 335:25]
  reg [51:0] tag_0; // @[DCache.scala 337:25]
  reg [51:0] tag_1; // @[DCache.scala 337:25]
  reg [51:0] tag_2; // @[DCache.scala 337:25]
  reg [51:0] tag_3; // @[DCache.scala 337:25]
  reg [51:0] tag_4; // @[DCache.scala 337:25]
  reg [51:0] tag_5; // @[DCache.scala 337:25]
  reg [51:0] tag_6; // @[DCache.scala 337:25]
  reg [51:0] tag_7; // @[DCache.scala 337:25]
  reg [51:0] tag_8; // @[DCache.scala 337:25]
  reg [51:0] tag_9; // @[DCache.scala 337:25]
  reg [51:0] tag_10; // @[DCache.scala 337:25]
  reg [51:0] tag_11; // @[DCache.scala 337:25]
  reg [51:0] tag_12; // @[DCache.scala 337:25]
  reg [51:0] tag_13; // @[DCache.scala 337:25]
  reg [51:0] tag_14; // @[DCache.scala 337:25]
  reg [51:0] tag_15; // @[DCache.scala 337:25]
  reg [51:0] tag_16; // @[DCache.scala 337:25]
  reg [51:0] tag_17; // @[DCache.scala 337:25]
  reg [51:0] tag_18; // @[DCache.scala 337:25]
  reg [51:0] tag_19; // @[DCache.scala 337:25]
  reg [51:0] tag_20; // @[DCache.scala 337:25]
  reg [51:0] tag_21; // @[DCache.scala 337:25]
  reg [51:0] tag_22; // @[DCache.scala 337:25]
  reg [51:0] tag_23; // @[DCache.scala 337:25]
  reg [51:0] tag_24; // @[DCache.scala 337:25]
  reg [51:0] tag_25; // @[DCache.scala 337:25]
  reg [51:0] tag_26; // @[DCache.scala 337:25]
  reg [51:0] tag_27; // @[DCache.scala 337:25]
  reg [51:0] tag_28; // @[DCache.scala 337:25]
  reg [51:0] tag_29; // @[DCache.scala 337:25]
  reg [51:0] tag_30; // @[DCache.scala 337:25]
  reg [51:0] tag_31; // @[DCache.scala 337:25]
  reg [51:0] tag_32; // @[DCache.scala 337:25]
  reg [51:0] tag_33; // @[DCache.scala 337:25]
  reg [51:0] tag_34; // @[DCache.scala 337:25]
  reg [51:0] tag_35; // @[DCache.scala 337:25]
  reg [51:0] tag_36; // @[DCache.scala 337:25]
  reg [51:0] tag_37; // @[DCache.scala 337:25]
  reg [51:0] tag_38; // @[DCache.scala 337:25]
  reg [51:0] tag_39; // @[DCache.scala 337:25]
  reg [51:0] tag_40; // @[DCache.scala 337:25]
  reg [51:0] tag_41; // @[DCache.scala 337:25]
  reg [51:0] tag_42; // @[DCache.scala 337:25]
  reg [51:0] tag_43; // @[DCache.scala 337:25]
  reg [51:0] tag_44; // @[DCache.scala 337:25]
  reg [51:0] tag_45; // @[DCache.scala 337:25]
  reg [51:0] tag_46; // @[DCache.scala 337:25]
  reg [51:0] tag_47; // @[DCache.scala 337:25]
  reg [51:0] tag_48; // @[DCache.scala 337:25]
  reg [51:0] tag_49; // @[DCache.scala 337:25]
  reg [51:0] tag_50; // @[DCache.scala 337:25]
  reg [51:0] tag_51; // @[DCache.scala 337:25]
  reg [51:0] tag_52; // @[DCache.scala 337:25]
  reg [51:0] tag_53; // @[DCache.scala 337:25]
  reg [51:0] tag_54; // @[DCache.scala 337:25]
  reg [51:0] tag_55; // @[DCache.scala 337:25]
  reg [51:0] tag_56; // @[DCache.scala 337:25]
  reg [51:0] tag_57; // @[DCache.scala 337:25]
  reg [51:0] tag_58; // @[DCache.scala 337:25]
  reg [51:0] tag_59; // @[DCache.scala 337:25]
  reg [51:0] tag_60; // @[DCache.scala 337:25]
  reg [51:0] tag_61; // @[DCache.scala 337:25]
  reg [51:0] tag_62; // @[DCache.scala 337:25]
  reg [51:0] tag_63; // @[DCache.scala 337:25]
  reg [3:0] state; // @[DCache.scala 347:24]
  reg [5:0] fence_reg; // @[DCache.scala 350:28]
  wire  _T = 4'h0 == state; // @[Conditional.scala 37:30]
  wire [51:0] _GEN_216 = 6'h1 == index_addr ? tag_1 : tag_0; // @[DCache.scala 409:40 DCache.scala 409:40]
  wire [51:0] _GEN_217 = 6'h2 == index_addr ? tag_2 : _GEN_216; // @[DCache.scala 409:40 DCache.scala 409:40]
  wire [51:0] _GEN_218 = 6'h3 == index_addr ? tag_3 : _GEN_217; // @[DCache.scala 409:40 DCache.scala 409:40]
  wire [51:0] _GEN_219 = 6'h4 == index_addr ? tag_4 : _GEN_218; // @[DCache.scala 409:40 DCache.scala 409:40]
  wire [51:0] _GEN_220 = 6'h5 == index_addr ? tag_5 : _GEN_219; // @[DCache.scala 409:40 DCache.scala 409:40]
  wire [51:0] _GEN_221 = 6'h6 == index_addr ? tag_6 : _GEN_220; // @[DCache.scala 409:40 DCache.scala 409:40]
  wire [51:0] _GEN_222 = 6'h7 == index_addr ? tag_7 : _GEN_221; // @[DCache.scala 409:40 DCache.scala 409:40]
  wire [51:0] _GEN_223 = 6'h8 == index_addr ? tag_8 : _GEN_222; // @[DCache.scala 409:40 DCache.scala 409:40]
  wire [51:0] _GEN_224 = 6'h9 == index_addr ? tag_9 : _GEN_223; // @[DCache.scala 409:40 DCache.scala 409:40]
  wire [51:0] _GEN_225 = 6'ha == index_addr ? tag_10 : _GEN_224; // @[DCache.scala 409:40 DCache.scala 409:40]
  wire [51:0] _GEN_226 = 6'hb == index_addr ? tag_11 : _GEN_225; // @[DCache.scala 409:40 DCache.scala 409:40]
  wire [51:0] _GEN_227 = 6'hc == index_addr ? tag_12 : _GEN_226; // @[DCache.scala 409:40 DCache.scala 409:40]
  wire [51:0] _GEN_228 = 6'hd == index_addr ? tag_13 : _GEN_227; // @[DCache.scala 409:40 DCache.scala 409:40]
  wire [51:0] _GEN_229 = 6'he == index_addr ? tag_14 : _GEN_228; // @[DCache.scala 409:40 DCache.scala 409:40]
  wire [51:0] _GEN_230 = 6'hf == index_addr ? tag_15 : _GEN_229; // @[DCache.scala 409:40 DCache.scala 409:40]
  wire [51:0] _GEN_231 = 6'h10 == index_addr ? tag_16 : _GEN_230; // @[DCache.scala 409:40 DCache.scala 409:40]
  wire [51:0] _GEN_232 = 6'h11 == index_addr ? tag_17 : _GEN_231; // @[DCache.scala 409:40 DCache.scala 409:40]
  wire [51:0] _GEN_233 = 6'h12 == index_addr ? tag_18 : _GEN_232; // @[DCache.scala 409:40 DCache.scala 409:40]
  wire [51:0] _GEN_234 = 6'h13 == index_addr ? tag_19 : _GEN_233; // @[DCache.scala 409:40 DCache.scala 409:40]
  wire [51:0] _GEN_235 = 6'h14 == index_addr ? tag_20 : _GEN_234; // @[DCache.scala 409:40 DCache.scala 409:40]
  wire [51:0] _GEN_236 = 6'h15 == index_addr ? tag_21 : _GEN_235; // @[DCache.scala 409:40 DCache.scala 409:40]
  wire [51:0] _GEN_237 = 6'h16 == index_addr ? tag_22 : _GEN_236; // @[DCache.scala 409:40 DCache.scala 409:40]
  wire [51:0] _GEN_238 = 6'h17 == index_addr ? tag_23 : _GEN_237; // @[DCache.scala 409:40 DCache.scala 409:40]
  wire [51:0] _GEN_239 = 6'h18 == index_addr ? tag_24 : _GEN_238; // @[DCache.scala 409:40 DCache.scala 409:40]
  wire [51:0] _GEN_240 = 6'h19 == index_addr ? tag_25 : _GEN_239; // @[DCache.scala 409:40 DCache.scala 409:40]
  wire [51:0] _GEN_241 = 6'h1a == index_addr ? tag_26 : _GEN_240; // @[DCache.scala 409:40 DCache.scala 409:40]
  wire [51:0] _GEN_242 = 6'h1b == index_addr ? tag_27 : _GEN_241; // @[DCache.scala 409:40 DCache.scala 409:40]
  wire [51:0] _GEN_243 = 6'h1c == index_addr ? tag_28 : _GEN_242; // @[DCache.scala 409:40 DCache.scala 409:40]
  wire [51:0] _GEN_244 = 6'h1d == index_addr ? tag_29 : _GEN_243; // @[DCache.scala 409:40 DCache.scala 409:40]
  wire [51:0] _GEN_245 = 6'h1e == index_addr ? tag_30 : _GEN_244; // @[DCache.scala 409:40 DCache.scala 409:40]
  wire [51:0] _GEN_246 = 6'h1f == index_addr ? tag_31 : _GEN_245; // @[DCache.scala 409:40 DCache.scala 409:40]
  wire [51:0] _GEN_247 = 6'h20 == index_addr ? tag_32 : _GEN_246; // @[DCache.scala 409:40 DCache.scala 409:40]
  wire [51:0] _GEN_248 = 6'h21 == index_addr ? tag_33 : _GEN_247; // @[DCache.scala 409:40 DCache.scala 409:40]
  wire [51:0] _GEN_249 = 6'h22 == index_addr ? tag_34 : _GEN_248; // @[DCache.scala 409:40 DCache.scala 409:40]
  wire [51:0] _GEN_250 = 6'h23 == index_addr ? tag_35 : _GEN_249; // @[DCache.scala 409:40 DCache.scala 409:40]
  wire [51:0] _GEN_251 = 6'h24 == index_addr ? tag_36 : _GEN_250; // @[DCache.scala 409:40 DCache.scala 409:40]
  wire [51:0] _GEN_252 = 6'h25 == index_addr ? tag_37 : _GEN_251; // @[DCache.scala 409:40 DCache.scala 409:40]
  wire [51:0] _GEN_253 = 6'h26 == index_addr ? tag_38 : _GEN_252; // @[DCache.scala 409:40 DCache.scala 409:40]
  wire [51:0] _GEN_254 = 6'h27 == index_addr ? tag_39 : _GEN_253; // @[DCache.scala 409:40 DCache.scala 409:40]
  wire [51:0] _GEN_255 = 6'h28 == index_addr ? tag_40 : _GEN_254; // @[DCache.scala 409:40 DCache.scala 409:40]
  wire [51:0] _GEN_256 = 6'h29 == index_addr ? tag_41 : _GEN_255; // @[DCache.scala 409:40 DCache.scala 409:40]
  wire [51:0] _GEN_257 = 6'h2a == index_addr ? tag_42 : _GEN_256; // @[DCache.scala 409:40 DCache.scala 409:40]
  wire [51:0] _GEN_258 = 6'h2b == index_addr ? tag_43 : _GEN_257; // @[DCache.scala 409:40 DCache.scala 409:40]
  wire [51:0] _GEN_259 = 6'h2c == index_addr ? tag_44 : _GEN_258; // @[DCache.scala 409:40 DCache.scala 409:40]
  wire [51:0] _GEN_260 = 6'h2d == index_addr ? tag_45 : _GEN_259; // @[DCache.scala 409:40 DCache.scala 409:40]
  wire [51:0] _GEN_261 = 6'h2e == index_addr ? tag_46 : _GEN_260; // @[DCache.scala 409:40 DCache.scala 409:40]
  wire [51:0] _GEN_262 = 6'h2f == index_addr ? tag_47 : _GEN_261; // @[DCache.scala 409:40 DCache.scala 409:40]
  wire [51:0] _GEN_263 = 6'h30 == index_addr ? tag_48 : _GEN_262; // @[DCache.scala 409:40 DCache.scala 409:40]
  wire [51:0] _GEN_264 = 6'h31 == index_addr ? tag_49 : _GEN_263; // @[DCache.scala 409:40 DCache.scala 409:40]
  wire [51:0] _GEN_265 = 6'h32 == index_addr ? tag_50 : _GEN_264; // @[DCache.scala 409:40 DCache.scala 409:40]
  wire [51:0] _GEN_266 = 6'h33 == index_addr ? tag_51 : _GEN_265; // @[DCache.scala 409:40 DCache.scala 409:40]
  wire [51:0] _GEN_267 = 6'h34 == index_addr ? tag_52 : _GEN_266; // @[DCache.scala 409:40 DCache.scala 409:40]
  wire [51:0] _GEN_268 = 6'h35 == index_addr ? tag_53 : _GEN_267; // @[DCache.scala 409:40 DCache.scala 409:40]
  wire [51:0] _GEN_269 = 6'h36 == index_addr ? tag_54 : _GEN_268; // @[DCache.scala 409:40 DCache.scala 409:40]
  wire [51:0] _GEN_270 = 6'h37 == index_addr ? tag_55 : _GEN_269; // @[DCache.scala 409:40 DCache.scala 409:40]
  wire [51:0] _GEN_271 = 6'h38 == index_addr ? tag_56 : _GEN_270; // @[DCache.scala 409:40 DCache.scala 409:40]
  wire [51:0] _GEN_272 = 6'h39 == index_addr ? tag_57 : _GEN_271; // @[DCache.scala 409:40 DCache.scala 409:40]
  wire [51:0] _GEN_273 = 6'h3a == index_addr ? tag_58 : _GEN_272; // @[DCache.scala 409:40 DCache.scala 409:40]
  wire [51:0] _GEN_274 = 6'h3b == index_addr ? tag_59 : _GEN_273; // @[DCache.scala 409:40 DCache.scala 409:40]
  wire [51:0] _GEN_275 = 6'h3c == index_addr ? tag_60 : _GEN_274; // @[DCache.scala 409:40 DCache.scala 409:40]
  wire [51:0] _GEN_276 = 6'h3d == index_addr ? tag_61 : _GEN_275; // @[DCache.scala 409:40 DCache.scala 409:40]
  wire [51:0] _GEN_277 = 6'h3e == index_addr ? tag_62 : _GEN_276; // @[DCache.scala 409:40 DCache.scala 409:40]
  wire [51:0] _GEN_278 = 6'h3f == index_addr ? tag_63 : _GEN_277; // @[DCache.scala 409:40 DCache.scala 409:40]
  wire  _GEN_280 = 6'h1 == index_addr ? v_1 : v_0; // @[DCache.scala 409:77 DCache.scala 409:77]
  wire  _GEN_281 = 6'h2 == index_addr ? v_2 : _GEN_280; // @[DCache.scala 409:77 DCache.scala 409:77]
  wire  _GEN_282 = 6'h3 == index_addr ? v_3 : _GEN_281; // @[DCache.scala 409:77 DCache.scala 409:77]
  wire  _GEN_283 = 6'h4 == index_addr ? v_4 : _GEN_282; // @[DCache.scala 409:77 DCache.scala 409:77]
  wire  _GEN_284 = 6'h5 == index_addr ? v_5 : _GEN_283; // @[DCache.scala 409:77 DCache.scala 409:77]
  wire  _GEN_285 = 6'h6 == index_addr ? v_6 : _GEN_284; // @[DCache.scala 409:77 DCache.scala 409:77]
  wire  _GEN_286 = 6'h7 == index_addr ? v_7 : _GEN_285; // @[DCache.scala 409:77 DCache.scala 409:77]
  wire  _GEN_287 = 6'h8 == index_addr ? v_8 : _GEN_286; // @[DCache.scala 409:77 DCache.scala 409:77]
  wire  _GEN_288 = 6'h9 == index_addr ? v_9 : _GEN_287; // @[DCache.scala 409:77 DCache.scala 409:77]
  wire  _GEN_289 = 6'ha == index_addr ? v_10 : _GEN_288; // @[DCache.scala 409:77 DCache.scala 409:77]
  wire  _GEN_290 = 6'hb == index_addr ? v_11 : _GEN_289; // @[DCache.scala 409:77 DCache.scala 409:77]
  wire  _GEN_291 = 6'hc == index_addr ? v_12 : _GEN_290; // @[DCache.scala 409:77 DCache.scala 409:77]
  wire  _GEN_292 = 6'hd == index_addr ? v_13 : _GEN_291; // @[DCache.scala 409:77 DCache.scala 409:77]
  wire  _GEN_293 = 6'he == index_addr ? v_14 : _GEN_292; // @[DCache.scala 409:77 DCache.scala 409:77]
  wire  _GEN_294 = 6'hf == index_addr ? v_15 : _GEN_293; // @[DCache.scala 409:77 DCache.scala 409:77]
  wire  _GEN_295 = 6'h10 == index_addr ? v_16 : _GEN_294; // @[DCache.scala 409:77 DCache.scala 409:77]
  wire  _GEN_296 = 6'h11 == index_addr ? v_17 : _GEN_295; // @[DCache.scala 409:77 DCache.scala 409:77]
  wire  _GEN_297 = 6'h12 == index_addr ? v_18 : _GEN_296; // @[DCache.scala 409:77 DCache.scala 409:77]
  wire  _GEN_298 = 6'h13 == index_addr ? v_19 : _GEN_297; // @[DCache.scala 409:77 DCache.scala 409:77]
  wire  _GEN_299 = 6'h14 == index_addr ? v_20 : _GEN_298; // @[DCache.scala 409:77 DCache.scala 409:77]
  wire  _GEN_300 = 6'h15 == index_addr ? v_21 : _GEN_299; // @[DCache.scala 409:77 DCache.scala 409:77]
  wire  _GEN_301 = 6'h16 == index_addr ? v_22 : _GEN_300; // @[DCache.scala 409:77 DCache.scala 409:77]
  wire  _GEN_302 = 6'h17 == index_addr ? v_23 : _GEN_301; // @[DCache.scala 409:77 DCache.scala 409:77]
  wire  _GEN_303 = 6'h18 == index_addr ? v_24 : _GEN_302; // @[DCache.scala 409:77 DCache.scala 409:77]
  wire  _GEN_304 = 6'h19 == index_addr ? v_25 : _GEN_303; // @[DCache.scala 409:77 DCache.scala 409:77]
  wire  _GEN_305 = 6'h1a == index_addr ? v_26 : _GEN_304; // @[DCache.scala 409:77 DCache.scala 409:77]
  wire  _GEN_306 = 6'h1b == index_addr ? v_27 : _GEN_305; // @[DCache.scala 409:77 DCache.scala 409:77]
  wire  _GEN_307 = 6'h1c == index_addr ? v_28 : _GEN_306; // @[DCache.scala 409:77 DCache.scala 409:77]
  wire  _GEN_308 = 6'h1d == index_addr ? v_29 : _GEN_307; // @[DCache.scala 409:77 DCache.scala 409:77]
  wire  _GEN_309 = 6'h1e == index_addr ? v_30 : _GEN_308; // @[DCache.scala 409:77 DCache.scala 409:77]
  wire  _GEN_310 = 6'h1f == index_addr ? v_31 : _GEN_309; // @[DCache.scala 409:77 DCache.scala 409:77]
  wire  _GEN_311 = 6'h20 == index_addr ? v_32 : _GEN_310; // @[DCache.scala 409:77 DCache.scala 409:77]
  wire  _GEN_312 = 6'h21 == index_addr ? v_33 : _GEN_311; // @[DCache.scala 409:77 DCache.scala 409:77]
  wire  _GEN_313 = 6'h22 == index_addr ? v_34 : _GEN_312; // @[DCache.scala 409:77 DCache.scala 409:77]
  wire  _GEN_314 = 6'h23 == index_addr ? v_35 : _GEN_313; // @[DCache.scala 409:77 DCache.scala 409:77]
  wire  _GEN_315 = 6'h24 == index_addr ? v_36 : _GEN_314; // @[DCache.scala 409:77 DCache.scala 409:77]
  wire  _GEN_316 = 6'h25 == index_addr ? v_37 : _GEN_315; // @[DCache.scala 409:77 DCache.scala 409:77]
  wire  _GEN_317 = 6'h26 == index_addr ? v_38 : _GEN_316; // @[DCache.scala 409:77 DCache.scala 409:77]
  wire  _GEN_318 = 6'h27 == index_addr ? v_39 : _GEN_317; // @[DCache.scala 409:77 DCache.scala 409:77]
  wire  _GEN_319 = 6'h28 == index_addr ? v_40 : _GEN_318; // @[DCache.scala 409:77 DCache.scala 409:77]
  wire  _GEN_320 = 6'h29 == index_addr ? v_41 : _GEN_319; // @[DCache.scala 409:77 DCache.scala 409:77]
  wire  _GEN_321 = 6'h2a == index_addr ? v_42 : _GEN_320; // @[DCache.scala 409:77 DCache.scala 409:77]
  wire  _GEN_322 = 6'h2b == index_addr ? v_43 : _GEN_321; // @[DCache.scala 409:77 DCache.scala 409:77]
  wire  _GEN_323 = 6'h2c == index_addr ? v_44 : _GEN_322; // @[DCache.scala 409:77 DCache.scala 409:77]
  wire  _GEN_324 = 6'h2d == index_addr ? v_45 : _GEN_323; // @[DCache.scala 409:77 DCache.scala 409:77]
  wire  _GEN_325 = 6'h2e == index_addr ? v_46 : _GEN_324; // @[DCache.scala 409:77 DCache.scala 409:77]
  wire  _GEN_326 = 6'h2f == index_addr ? v_47 : _GEN_325; // @[DCache.scala 409:77 DCache.scala 409:77]
  wire  _GEN_327 = 6'h30 == index_addr ? v_48 : _GEN_326; // @[DCache.scala 409:77 DCache.scala 409:77]
  wire  _GEN_328 = 6'h31 == index_addr ? v_49 : _GEN_327; // @[DCache.scala 409:77 DCache.scala 409:77]
  wire  _GEN_329 = 6'h32 == index_addr ? v_50 : _GEN_328; // @[DCache.scala 409:77 DCache.scala 409:77]
  wire  _GEN_330 = 6'h33 == index_addr ? v_51 : _GEN_329; // @[DCache.scala 409:77 DCache.scala 409:77]
  wire  _GEN_331 = 6'h34 == index_addr ? v_52 : _GEN_330; // @[DCache.scala 409:77 DCache.scala 409:77]
  wire  _GEN_332 = 6'h35 == index_addr ? v_53 : _GEN_331; // @[DCache.scala 409:77 DCache.scala 409:77]
  wire  _GEN_333 = 6'h36 == index_addr ? v_54 : _GEN_332; // @[DCache.scala 409:77 DCache.scala 409:77]
  wire  _GEN_334 = 6'h37 == index_addr ? v_55 : _GEN_333; // @[DCache.scala 409:77 DCache.scala 409:77]
  wire  _GEN_335 = 6'h38 == index_addr ? v_56 : _GEN_334; // @[DCache.scala 409:77 DCache.scala 409:77]
  wire  _GEN_336 = 6'h39 == index_addr ? v_57 : _GEN_335; // @[DCache.scala 409:77 DCache.scala 409:77]
  wire  _GEN_337 = 6'h3a == index_addr ? v_58 : _GEN_336; // @[DCache.scala 409:77 DCache.scala 409:77]
  wire  _GEN_338 = 6'h3b == index_addr ? v_59 : _GEN_337; // @[DCache.scala 409:77 DCache.scala 409:77]
  wire  _GEN_339 = 6'h3c == index_addr ? v_60 : _GEN_338; // @[DCache.scala 409:77 DCache.scala 409:77]
  wire  _GEN_340 = 6'h3d == index_addr ? v_61 : _GEN_339; // @[DCache.scala 409:77 DCache.scala 409:77]
  wire  _GEN_341 = 6'h3e == index_addr ? v_62 : _GEN_340; // @[DCache.scala 409:77 DCache.scala 409:77]
  wire  _GEN_342 = 6'h3f == index_addr ? v_63 : _GEN_341; // @[DCache.scala 409:77 DCache.scala 409:77]
  wire  hit = tag_addr == _GEN_278 & _GEN_342; // @[DCache.scala 409:60]
  wire  miss = ~hit; // @[DCache.scala 410:32]
  wire  _GEN_152 = 6'h1 == index_addr ? d_1 : d_0; // @[DCache.scala 407:29 DCache.scala 407:29]
  wire  _GEN_153 = 6'h2 == index_addr ? d_2 : _GEN_152; // @[DCache.scala 407:29 DCache.scala 407:29]
  wire  _GEN_154 = 6'h3 == index_addr ? d_3 : _GEN_153; // @[DCache.scala 407:29 DCache.scala 407:29]
  wire  _GEN_155 = 6'h4 == index_addr ? d_4 : _GEN_154; // @[DCache.scala 407:29 DCache.scala 407:29]
  wire  _GEN_156 = 6'h5 == index_addr ? d_5 : _GEN_155; // @[DCache.scala 407:29 DCache.scala 407:29]
  wire  _GEN_157 = 6'h6 == index_addr ? d_6 : _GEN_156; // @[DCache.scala 407:29 DCache.scala 407:29]
  wire  _GEN_158 = 6'h7 == index_addr ? d_7 : _GEN_157; // @[DCache.scala 407:29 DCache.scala 407:29]
  wire  _GEN_159 = 6'h8 == index_addr ? d_8 : _GEN_158; // @[DCache.scala 407:29 DCache.scala 407:29]
  wire  _GEN_160 = 6'h9 == index_addr ? d_9 : _GEN_159; // @[DCache.scala 407:29 DCache.scala 407:29]
  wire  _GEN_161 = 6'ha == index_addr ? d_10 : _GEN_160; // @[DCache.scala 407:29 DCache.scala 407:29]
  wire  _GEN_162 = 6'hb == index_addr ? d_11 : _GEN_161; // @[DCache.scala 407:29 DCache.scala 407:29]
  wire  _GEN_163 = 6'hc == index_addr ? d_12 : _GEN_162; // @[DCache.scala 407:29 DCache.scala 407:29]
  wire  _GEN_164 = 6'hd == index_addr ? d_13 : _GEN_163; // @[DCache.scala 407:29 DCache.scala 407:29]
  wire  _GEN_165 = 6'he == index_addr ? d_14 : _GEN_164; // @[DCache.scala 407:29 DCache.scala 407:29]
  wire  _GEN_166 = 6'hf == index_addr ? d_15 : _GEN_165; // @[DCache.scala 407:29 DCache.scala 407:29]
  wire  _GEN_167 = 6'h10 == index_addr ? d_16 : _GEN_166; // @[DCache.scala 407:29 DCache.scala 407:29]
  wire  _GEN_168 = 6'h11 == index_addr ? d_17 : _GEN_167; // @[DCache.scala 407:29 DCache.scala 407:29]
  wire  _GEN_169 = 6'h12 == index_addr ? d_18 : _GEN_168; // @[DCache.scala 407:29 DCache.scala 407:29]
  wire  _GEN_170 = 6'h13 == index_addr ? d_19 : _GEN_169; // @[DCache.scala 407:29 DCache.scala 407:29]
  wire  _GEN_171 = 6'h14 == index_addr ? d_20 : _GEN_170; // @[DCache.scala 407:29 DCache.scala 407:29]
  wire  _GEN_172 = 6'h15 == index_addr ? d_21 : _GEN_171; // @[DCache.scala 407:29 DCache.scala 407:29]
  wire  _GEN_173 = 6'h16 == index_addr ? d_22 : _GEN_172; // @[DCache.scala 407:29 DCache.scala 407:29]
  wire  _GEN_174 = 6'h17 == index_addr ? d_23 : _GEN_173; // @[DCache.scala 407:29 DCache.scala 407:29]
  wire  _GEN_175 = 6'h18 == index_addr ? d_24 : _GEN_174; // @[DCache.scala 407:29 DCache.scala 407:29]
  wire  _GEN_176 = 6'h19 == index_addr ? d_25 : _GEN_175; // @[DCache.scala 407:29 DCache.scala 407:29]
  wire  _GEN_177 = 6'h1a == index_addr ? d_26 : _GEN_176; // @[DCache.scala 407:29 DCache.scala 407:29]
  wire  _GEN_178 = 6'h1b == index_addr ? d_27 : _GEN_177; // @[DCache.scala 407:29 DCache.scala 407:29]
  wire  _GEN_179 = 6'h1c == index_addr ? d_28 : _GEN_178; // @[DCache.scala 407:29 DCache.scala 407:29]
  wire  _GEN_180 = 6'h1d == index_addr ? d_29 : _GEN_179; // @[DCache.scala 407:29 DCache.scala 407:29]
  wire  _GEN_181 = 6'h1e == index_addr ? d_30 : _GEN_180; // @[DCache.scala 407:29 DCache.scala 407:29]
  wire  _GEN_182 = 6'h1f == index_addr ? d_31 : _GEN_181; // @[DCache.scala 407:29 DCache.scala 407:29]
  wire  _GEN_183 = 6'h20 == index_addr ? d_32 : _GEN_182; // @[DCache.scala 407:29 DCache.scala 407:29]
  wire  _GEN_184 = 6'h21 == index_addr ? d_33 : _GEN_183; // @[DCache.scala 407:29 DCache.scala 407:29]
  wire  _GEN_185 = 6'h22 == index_addr ? d_34 : _GEN_184; // @[DCache.scala 407:29 DCache.scala 407:29]
  wire  _GEN_186 = 6'h23 == index_addr ? d_35 : _GEN_185; // @[DCache.scala 407:29 DCache.scala 407:29]
  wire  _GEN_187 = 6'h24 == index_addr ? d_36 : _GEN_186; // @[DCache.scala 407:29 DCache.scala 407:29]
  wire  _GEN_188 = 6'h25 == index_addr ? d_37 : _GEN_187; // @[DCache.scala 407:29 DCache.scala 407:29]
  wire  _GEN_189 = 6'h26 == index_addr ? d_38 : _GEN_188; // @[DCache.scala 407:29 DCache.scala 407:29]
  wire  _GEN_190 = 6'h27 == index_addr ? d_39 : _GEN_189; // @[DCache.scala 407:29 DCache.scala 407:29]
  wire  _GEN_191 = 6'h28 == index_addr ? d_40 : _GEN_190; // @[DCache.scala 407:29 DCache.scala 407:29]
  wire  _GEN_192 = 6'h29 == index_addr ? d_41 : _GEN_191; // @[DCache.scala 407:29 DCache.scala 407:29]
  wire  _GEN_193 = 6'h2a == index_addr ? d_42 : _GEN_192; // @[DCache.scala 407:29 DCache.scala 407:29]
  wire  _GEN_194 = 6'h2b == index_addr ? d_43 : _GEN_193; // @[DCache.scala 407:29 DCache.scala 407:29]
  wire  _GEN_195 = 6'h2c == index_addr ? d_44 : _GEN_194; // @[DCache.scala 407:29 DCache.scala 407:29]
  wire  _GEN_196 = 6'h2d == index_addr ? d_45 : _GEN_195; // @[DCache.scala 407:29 DCache.scala 407:29]
  wire  _GEN_197 = 6'h2e == index_addr ? d_46 : _GEN_196; // @[DCache.scala 407:29 DCache.scala 407:29]
  wire  _GEN_198 = 6'h2f == index_addr ? d_47 : _GEN_197; // @[DCache.scala 407:29 DCache.scala 407:29]
  wire  _GEN_199 = 6'h30 == index_addr ? d_48 : _GEN_198; // @[DCache.scala 407:29 DCache.scala 407:29]
  wire  _GEN_200 = 6'h31 == index_addr ? d_49 : _GEN_199; // @[DCache.scala 407:29 DCache.scala 407:29]
  wire  _GEN_201 = 6'h32 == index_addr ? d_50 : _GEN_200; // @[DCache.scala 407:29 DCache.scala 407:29]
  wire  _GEN_202 = 6'h33 == index_addr ? d_51 : _GEN_201; // @[DCache.scala 407:29 DCache.scala 407:29]
  wire  _GEN_203 = 6'h34 == index_addr ? d_52 : _GEN_202; // @[DCache.scala 407:29 DCache.scala 407:29]
  wire  _GEN_204 = 6'h35 == index_addr ? d_53 : _GEN_203; // @[DCache.scala 407:29 DCache.scala 407:29]
  wire  _GEN_205 = 6'h36 == index_addr ? d_54 : _GEN_204; // @[DCache.scala 407:29 DCache.scala 407:29]
  wire  _GEN_206 = 6'h37 == index_addr ? d_55 : _GEN_205; // @[DCache.scala 407:29 DCache.scala 407:29]
  wire  _GEN_207 = 6'h38 == index_addr ? d_56 : _GEN_206; // @[DCache.scala 407:29 DCache.scala 407:29]
  wire  _GEN_208 = 6'h39 == index_addr ? d_57 : _GEN_207; // @[DCache.scala 407:29 DCache.scala 407:29]
  wire  _GEN_209 = 6'h3a == index_addr ? d_58 : _GEN_208; // @[DCache.scala 407:29 DCache.scala 407:29]
  wire  _GEN_210 = 6'h3b == index_addr ? d_59 : _GEN_209; // @[DCache.scala 407:29 DCache.scala 407:29]
  wire  _GEN_211 = 6'h3c == index_addr ? d_60 : _GEN_210; // @[DCache.scala 407:29 DCache.scala 407:29]
  wire  _GEN_212 = 6'h3d == index_addr ? d_61 : _GEN_211; // @[DCache.scala 407:29 DCache.scala 407:29]
  wire  _GEN_213 = 6'h3e == index_addr ? d_62 : _GEN_212; // @[DCache.scala 407:29 DCache.scala 407:29]
  wire  dirty = 6'h3f == index_addr ? d_63 : _GEN_213; // @[DCache.scala 407:29 DCache.scala 407:29]
  wire  _T_2 = 4'h1 == state; // @[Conditional.scala 37:30]
  wire  _T_3 = 4'h2 == state; // @[Conditional.scala 37:30]
  wire  _T_4 = 4'h3 == state; // @[Conditional.scala 37:30]
  wire [3:0] _GEN_2 = io_axi_wdone ? 4'h4 : state; // @[DCache.scala 365:31 DCache.scala 365:38 DCache.scala 347:24]
  wire  _T_5 = 4'h4 == state; // @[Conditional.scala 37:30]
  wire [3:0] _GEN_3 = io_axi_rvalid ? 4'h5 : state; // @[DCache.scala 368:32 DCache.scala 368:39 DCache.scala 347:24]
  wire  _T_6 = 4'h5 == state; // @[Conditional.scala 37:30]
  wire  _T_7 = 4'h6 == state; // @[Conditional.scala 37:30]
  wire  _T_8 = 4'h7 == state; // @[Conditional.scala 37:30]
  wire  _T_9 = 4'h8 == state; // @[Conditional.scala 37:30]
  wire  _GEN_5 = 6'h1 == fence_reg ? v_1 : v_0; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_6 = 6'h2 == fence_reg ? v_2 : _GEN_5; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_7 = 6'h3 == fence_reg ? v_3 : _GEN_6; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_8 = 6'h4 == fence_reg ? v_4 : _GEN_7; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_9 = 6'h5 == fence_reg ? v_5 : _GEN_8; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_10 = 6'h6 == fence_reg ? v_6 : _GEN_9; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_11 = 6'h7 == fence_reg ? v_7 : _GEN_10; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_12 = 6'h8 == fence_reg ? v_8 : _GEN_11; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_13 = 6'h9 == fence_reg ? v_9 : _GEN_12; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_14 = 6'ha == fence_reg ? v_10 : _GEN_13; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_15 = 6'hb == fence_reg ? v_11 : _GEN_14; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_16 = 6'hc == fence_reg ? v_12 : _GEN_15; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_17 = 6'hd == fence_reg ? v_13 : _GEN_16; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_18 = 6'he == fence_reg ? v_14 : _GEN_17; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_19 = 6'hf == fence_reg ? v_15 : _GEN_18; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_20 = 6'h10 == fence_reg ? v_16 : _GEN_19; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_21 = 6'h11 == fence_reg ? v_17 : _GEN_20; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_22 = 6'h12 == fence_reg ? v_18 : _GEN_21; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_23 = 6'h13 == fence_reg ? v_19 : _GEN_22; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_24 = 6'h14 == fence_reg ? v_20 : _GEN_23; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_25 = 6'h15 == fence_reg ? v_21 : _GEN_24; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_26 = 6'h16 == fence_reg ? v_22 : _GEN_25; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_27 = 6'h17 == fence_reg ? v_23 : _GEN_26; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_28 = 6'h18 == fence_reg ? v_24 : _GEN_27; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_29 = 6'h19 == fence_reg ? v_25 : _GEN_28; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_30 = 6'h1a == fence_reg ? v_26 : _GEN_29; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_31 = 6'h1b == fence_reg ? v_27 : _GEN_30; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_32 = 6'h1c == fence_reg ? v_28 : _GEN_31; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_33 = 6'h1d == fence_reg ? v_29 : _GEN_32; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_34 = 6'h1e == fence_reg ? v_30 : _GEN_33; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_35 = 6'h1f == fence_reg ? v_31 : _GEN_34; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_36 = 6'h20 == fence_reg ? v_32 : _GEN_35; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_37 = 6'h21 == fence_reg ? v_33 : _GEN_36; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_38 = 6'h22 == fence_reg ? v_34 : _GEN_37; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_39 = 6'h23 == fence_reg ? v_35 : _GEN_38; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_40 = 6'h24 == fence_reg ? v_36 : _GEN_39; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_41 = 6'h25 == fence_reg ? v_37 : _GEN_40; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_42 = 6'h26 == fence_reg ? v_38 : _GEN_41; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_43 = 6'h27 == fence_reg ? v_39 : _GEN_42; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_44 = 6'h28 == fence_reg ? v_40 : _GEN_43; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_45 = 6'h29 == fence_reg ? v_41 : _GEN_44; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_46 = 6'h2a == fence_reg ? v_42 : _GEN_45; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_47 = 6'h2b == fence_reg ? v_43 : _GEN_46; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_48 = 6'h2c == fence_reg ? v_44 : _GEN_47; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_49 = 6'h2d == fence_reg ? v_45 : _GEN_48; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_50 = 6'h2e == fence_reg ? v_46 : _GEN_49; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_51 = 6'h2f == fence_reg ? v_47 : _GEN_50; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_52 = 6'h30 == fence_reg ? v_48 : _GEN_51; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_53 = 6'h31 == fence_reg ? v_49 : _GEN_52; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_54 = 6'h32 == fence_reg ? v_50 : _GEN_53; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_55 = 6'h33 == fence_reg ? v_51 : _GEN_54; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_56 = 6'h34 == fence_reg ? v_52 : _GEN_55; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_57 = 6'h35 == fence_reg ? v_53 : _GEN_56; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_58 = 6'h36 == fence_reg ? v_54 : _GEN_57; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_59 = 6'h37 == fence_reg ? v_55 : _GEN_58; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_60 = 6'h38 == fence_reg ? v_56 : _GEN_59; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_61 = 6'h39 == fence_reg ? v_57 : _GEN_60; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_62 = 6'h3a == fence_reg ? v_58 : _GEN_61; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_63 = 6'h3b == fence_reg ? v_59 : _GEN_62; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_64 = 6'h3c == fence_reg ? v_60 : _GEN_63; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_65 = 6'h3d == fence_reg ? v_61 : _GEN_64; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_66 = 6'h3e == fence_reg ? v_62 : _GEN_65; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_67 = 6'h3f == fence_reg ? v_63 : _GEN_66; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_69 = 6'h1 == fence_reg ? d_1 : d_0; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_70 = 6'h2 == fence_reg ? d_2 : _GEN_69; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_71 = 6'h3 == fence_reg ? d_3 : _GEN_70; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_72 = 6'h4 == fence_reg ? d_4 : _GEN_71; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_73 = 6'h5 == fence_reg ? d_5 : _GEN_72; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_74 = 6'h6 == fence_reg ? d_6 : _GEN_73; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_75 = 6'h7 == fence_reg ? d_7 : _GEN_74; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_76 = 6'h8 == fence_reg ? d_8 : _GEN_75; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_77 = 6'h9 == fence_reg ? d_9 : _GEN_76; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_78 = 6'ha == fence_reg ? d_10 : _GEN_77; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_79 = 6'hb == fence_reg ? d_11 : _GEN_78; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_80 = 6'hc == fence_reg ? d_12 : _GEN_79; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_81 = 6'hd == fence_reg ? d_13 : _GEN_80; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_82 = 6'he == fence_reg ? d_14 : _GEN_81; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_83 = 6'hf == fence_reg ? d_15 : _GEN_82; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_84 = 6'h10 == fence_reg ? d_16 : _GEN_83; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_85 = 6'h11 == fence_reg ? d_17 : _GEN_84; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_86 = 6'h12 == fence_reg ? d_18 : _GEN_85; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_87 = 6'h13 == fence_reg ? d_19 : _GEN_86; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_88 = 6'h14 == fence_reg ? d_20 : _GEN_87; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_89 = 6'h15 == fence_reg ? d_21 : _GEN_88; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_90 = 6'h16 == fence_reg ? d_22 : _GEN_89; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_91 = 6'h17 == fence_reg ? d_23 : _GEN_90; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_92 = 6'h18 == fence_reg ? d_24 : _GEN_91; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_93 = 6'h19 == fence_reg ? d_25 : _GEN_92; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_94 = 6'h1a == fence_reg ? d_26 : _GEN_93; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_95 = 6'h1b == fence_reg ? d_27 : _GEN_94; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_96 = 6'h1c == fence_reg ? d_28 : _GEN_95; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_97 = 6'h1d == fence_reg ? d_29 : _GEN_96; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_98 = 6'h1e == fence_reg ? d_30 : _GEN_97; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_99 = 6'h1f == fence_reg ? d_31 : _GEN_98; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_100 = 6'h20 == fence_reg ? d_32 : _GEN_99; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_101 = 6'h21 == fence_reg ? d_33 : _GEN_100; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_102 = 6'h22 == fence_reg ? d_34 : _GEN_101; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_103 = 6'h23 == fence_reg ? d_35 : _GEN_102; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_104 = 6'h24 == fence_reg ? d_36 : _GEN_103; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_105 = 6'h25 == fence_reg ? d_37 : _GEN_104; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_106 = 6'h26 == fence_reg ? d_38 : _GEN_105; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_107 = 6'h27 == fence_reg ? d_39 : _GEN_106; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_108 = 6'h28 == fence_reg ? d_40 : _GEN_107; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_109 = 6'h29 == fence_reg ? d_41 : _GEN_108; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_110 = 6'h2a == fence_reg ? d_42 : _GEN_109; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_111 = 6'h2b == fence_reg ? d_43 : _GEN_110; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_112 = 6'h2c == fence_reg ? d_44 : _GEN_111; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_113 = 6'h2d == fence_reg ? d_45 : _GEN_112; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_114 = 6'h2e == fence_reg ? d_46 : _GEN_113; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_115 = 6'h2f == fence_reg ? d_47 : _GEN_114; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_116 = 6'h30 == fence_reg ? d_48 : _GEN_115; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_117 = 6'h31 == fence_reg ? d_49 : _GEN_116; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_118 = 6'h32 == fence_reg ? d_50 : _GEN_117; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_119 = 6'h33 == fence_reg ? d_51 : _GEN_118; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_120 = 6'h34 == fence_reg ? d_52 : _GEN_119; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_121 = 6'h35 == fence_reg ? d_53 : _GEN_120; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_122 = 6'h36 == fence_reg ? d_54 : _GEN_121; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_123 = 6'h37 == fence_reg ? d_55 : _GEN_122; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_124 = 6'h38 == fence_reg ? d_56 : _GEN_123; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_125 = 6'h39 == fence_reg ? d_57 : _GEN_124; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_126 = 6'h3a == fence_reg ? d_58 : _GEN_125; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_127 = 6'h3b == fence_reg ? d_59 : _GEN_126; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_128 = 6'h3c == fence_reg ? d_60 : _GEN_127; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_129 = 6'h3d == fence_reg ? d_61 : _GEN_128; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_130 = 6'h3e == fence_reg ? d_62 : _GEN_129; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire  _GEN_131 = 6'h3f == fence_reg ? d_63 : _GEN_130; // @[DCache.scala 381:31 DCache.scala 381:31]
  wire [3:0] _GEN_132 = _GEN_67 & _GEN_131 ? 4'h9 : 4'hb; // @[DCache.scala 381:47 DCache.scala 381:54 DCache.scala 382:30]
  wire  _T_11 = 4'h9 == state; // @[Conditional.scala 37:30]
  wire  _T_12 = 4'ha == state; // @[Conditional.scala 37:30]
  wire [3:0] _GEN_133 = io_axi_wdone ? 4'hb : state; // @[DCache.scala 388:31 DCache.scala 388:38 DCache.scala 347:24]
  wire  _T_13 = 4'hb == state; // @[Conditional.scala 37:30]
  wire  _T_15 = fence_reg == 6'h3f; // @[DCache.scala 391:28]
  wire [3:0] _GEN_134 = fence_reg == 6'h3f ? 4'h0 : 4'h8; // @[DCache.scala 391:59 DCache.scala 391:66 DCache.scala 392:30]
  wire [3:0] _GEN_135 = _T_13 ? _GEN_134 : state; // @[Conditional.scala 39:67 DCache.scala 347:24]
  wire [3:0] _GEN_136 = _T_12 ? _GEN_133 : _GEN_135; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_137 = _T_11 ? 4'ha : _GEN_136; // @[Conditional.scala 39:67 DCache.scala 385:19]
  wire [3:0] _GEN_138 = _T_9 ? _GEN_132 : _GEN_137; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_139 = _T_8 ? 4'h8 : _GEN_138; // @[Conditional.scala 39:67 DCache.scala 378:19]
  wire [3:0] _GEN_140 = _T_7 ? 4'h0 : _GEN_139; // @[Conditional.scala 39:67 DCache.scala 374:19]
  wire [3:0] _GEN_141 = _T_6 ? 4'h6 : _GEN_140; // @[Conditional.scala 39:67 DCache.scala 371:19]
  wire [3:0] _GEN_142 = _T_5 ? _GEN_3 : _GEN_141; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_143 = _T_4 ? _GEN_2 : _GEN_142; // @[Conditional.scala 39:67]
  wire  _addr_stay_T_1 = state == 4'h0 & io_dmem_en; // @[DCache.scala 398:73]
  reg [63:0] addr_stay; // @[Reg.scala 27:20]
  wire [51:0] tag_addr_stay = addr_stay[63:12]; // @[DCache.scala 399:40]
  wire [5:0] index_addr_stay = addr_stay[11:6]; // @[DCache.scala 400:40]
  wire [5:0] offset_addr_stay = addr_stay[5:0]; // @[DCache.scala 401:40]
  reg  op_stay; // @[Reg.scala 27:20]
  reg [63:0] wdata_stay; // @[Reg.scala 27:20]
  reg [7:0] wmask_stay; // @[Reg.scala 27:20]
  wire [8:0] _data_T = {offset_addr_stay, 3'h0}; // @[DCache.scala 412:83]
  wire [511:0] _data_T_1 = SRam_4k_io_rdata >> _data_T; // @[DCache.scala 412:62]
  wire [63:0] data = op_stay ? 64'h0 : _data_T_1[63:0]; // @[DCache.scala 412:34]
  reg [511:0] axi_wbuffer; // @[DCache.scala 434:30]
  reg [511:0] axi_rbuffer; // @[DCache.scala 435:30]
  reg [511:0] fence_buffer; // @[DCache.scala 436:31]
  wire  _T_17 = io_dmem_op & hit; // @[DCache.scala 447:43]
  wire [8:0] _T_18 = {offset_addr, 3'h0}; // @[DCache.scala 448:62]
  wire [574:0] _GEN_3094 = {{511'd0}, io_dmem_wdata}; // @[DCache.scala 448:46]
  wire [574:0] _T_19 = _GEN_3094 << _T_18; // @[DCache.scala 448:46]
  wire [7:0] hi_hi_hi = io_dmem_wmask[7] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] hi_hi_lo = io_dmem_wmask[6] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] hi_lo_hi = io_dmem_wmask[5] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] hi_lo_lo = io_dmem_wmask[4] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] lo_hi_hi = io_dmem_wmask[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] lo_hi_lo = io_dmem_wmask[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] lo_lo_hi = io_dmem_wmask[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] lo_lo_lo = io_dmem_wmask[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _T_36 = {hi_hi_hi,hi_hi_lo,hi_lo_hi,hi_lo_lo,lo_hi_hi,lo_hi_lo,lo_lo_hi,lo_lo_lo}; // @[Cat.scala 30:58]
  wire [574:0] _GEN_3095 = {{511'd0}, _T_36}; // @[DCache.scala 449:59]
  wire [574:0] _T_38 = _GEN_3095 << _T_18; // @[DCache.scala 449:59]
  wire [51:0] _GEN_472 = 6'h1 == index_addr_stay ? tag_1 : tag_0; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_473 = 6'h2 == index_addr_stay ? tag_2 : _GEN_472; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_474 = 6'h3 == index_addr_stay ? tag_3 : _GEN_473; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_475 = 6'h4 == index_addr_stay ? tag_4 : _GEN_474; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_476 = 6'h5 == index_addr_stay ? tag_5 : _GEN_475; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_477 = 6'h6 == index_addr_stay ? tag_6 : _GEN_476; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_478 = 6'h7 == index_addr_stay ? tag_7 : _GEN_477; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_479 = 6'h8 == index_addr_stay ? tag_8 : _GEN_478; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_480 = 6'h9 == index_addr_stay ? tag_9 : _GEN_479; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_481 = 6'ha == index_addr_stay ? tag_10 : _GEN_480; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_482 = 6'hb == index_addr_stay ? tag_11 : _GEN_481; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_483 = 6'hc == index_addr_stay ? tag_12 : _GEN_482; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_484 = 6'hd == index_addr_stay ? tag_13 : _GEN_483; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_485 = 6'he == index_addr_stay ? tag_14 : _GEN_484; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_486 = 6'hf == index_addr_stay ? tag_15 : _GEN_485; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_487 = 6'h10 == index_addr_stay ? tag_16 : _GEN_486; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_488 = 6'h11 == index_addr_stay ? tag_17 : _GEN_487; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_489 = 6'h12 == index_addr_stay ? tag_18 : _GEN_488; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_490 = 6'h13 == index_addr_stay ? tag_19 : _GEN_489; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_491 = 6'h14 == index_addr_stay ? tag_20 : _GEN_490; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_492 = 6'h15 == index_addr_stay ? tag_21 : _GEN_491; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_493 = 6'h16 == index_addr_stay ? tag_22 : _GEN_492; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_494 = 6'h17 == index_addr_stay ? tag_23 : _GEN_493; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_495 = 6'h18 == index_addr_stay ? tag_24 : _GEN_494; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_496 = 6'h19 == index_addr_stay ? tag_25 : _GEN_495; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_497 = 6'h1a == index_addr_stay ? tag_26 : _GEN_496; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_498 = 6'h1b == index_addr_stay ? tag_27 : _GEN_497; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_499 = 6'h1c == index_addr_stay ? tag_28 : _GEN_498; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_500 = 6'h1d == index_addr_stay ? tag_29 : _GEN_499; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_501 = 6'h1e == index_addr_stay ? tag_30 : _GEN_500; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_502 = 6'h1f == index_addr_stay ? tag_31 : _GEN_501; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_503 = 6'h20 == index_addr_stay ? tag_32 : _GEN_502; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_504 = 6'h21 == index_addr_stay ? tag_33 : _GEN_503; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_505 = 6'h22 == index_addr_stay ? tag_34 : _GEN_504; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_506 = 6'h23 == index_addr_stay ? tag_35 : _GEN_505; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_507 = 6'h24 == index_addr_stay ? tag_36 : _GEN_506; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_508 = 6'h25 == index_addr_stay ? tag_37 : _GEN_507; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_509 = 6'h26 == index_addr_stay ? tag_38 : _GEN_508; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_510 = 6'h27 == index_addr_stay ? tag_39 : _GEN_509; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_511 = 6'h28 == index_addr_stay ? tag_40 : _GEN_510; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_512 = 6'h29 == index_addr_stay ? tag_41 : _GEN_511; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_513 = 6'h2a == index_addr_stay ? tag_42 : _GEN_512; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_514 = 6'h2b == index_addr_stay ? tag_43 : _GEN_513; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_515 = 6'h2c == index_addr_stay ? tag_44 : _GEN_514; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_516 = 6'h2d == index_addr_stay ? tag_45 : _GEN_515; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_517 = 6'h2e == index_addr_stay ? tag_46 : _GEN_516; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_518 = 6'h2f == index_addr_stay ? tag_47 : _GEN_517; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_519 = 6'h30 == index_addr_stay ? tag_48 : _GEN_518; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_520 = 6'h31 == index_addr_stay ? tag_49 : _GEN_519; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_521 = 6'h32 == index_addr_stay ? tag_50 : _GEN_520; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_522 = 6'h33 == index_addr_stay ? tag_51 : _GEN_521; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_523 = 6'h34 == index_addr_stay ? tag_52 : _GEN_522; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_524 = 6'h35 == index_addr_stay ? tag_53 : _GEN_523; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_525 = 6'h36 == index_addr_stay ? tag_54 : _GEN_524; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_526 = 6'h37 == index_addr_stay ? tag_55 : _GEN_525; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_527 = 6'h38 == index_addr_stay ? tag_56 : _GEN_526; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_528 = 6'h39 == index_addr_stay ? tag_57 : _GEN_527; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_529 = 6'h3a == index_addr_stay ? tag_58 : _GEN_528; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_530 = 6'h3b == index_addr_stay ? tag_59 : _GEN_529; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_531 = 6'h3c == index_addr_stay ? tag_60 : _GEN_530; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_532 = 6'h3d == index_addr_stay ? tag_61 : _GEN_531; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_533 = 6'h3e == index_addr_stay ? tag_62 : _GEN_532; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_534 = 6'h3f == index_addr_stay ? tag_63 : _GEN_533; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [63:0] _io_axi_waddr_T = {_GEN_534,index_addr_stay,6'h0}; // @[Cat.scala 30:58]
  wire [63:0] _io_axi_raddr_T_1 = addr_stay & 64'hffffffffffffffc0; // @[DCache.scala 468:42]
  wire [511:0] _GEN_535 = io_axi_rvalid ? io_axi_rdata : axi_rbuffer; // @[DCache.scala 469:32 DCache.scala 469:45 DCache.scala 435:30]
  wire [51:0] _GEN_536 = 6'h0 == index_addr_stay ? tag_addr_stay : tag_0; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire [51:0] _GEN_537 = 6'h1 == index_addr_stay ? tag_addr_stay : tag_1; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire [51:0] _GEN_538 = 6'h2 == index_addr_stay ? tag_addr_stay : tag_2; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire [51:0] _GEN_539 = 6'h3 == index_addr_stay ? tag_addr_stay : tag_3; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire [51:0] _GEN_540 = 6'h4 == index_addr_stay ? tag_addr_stay : tag_4; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire [51:0] _GEN_541 = 6'h5 == index_addr_stay ? tag_addr_stay : tag_5; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire [51:0] _GEN_542 = 6'h6 == index_addr_stay ? tag_addr_stay : tag_6; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire [51:0] _GEN_543 = 6'h7 == index_addr_stay ? tag_addr_stay : tag_7; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire [51:0] _GEN_544 = 6'h8 == index_addr_stay ? tag_addr_stay : tag_8; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire [51:0] _GEN_545 = 6'h9 == index_addr_stay ? tag_addr_stay : tag_9; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire [51:0] _GEN_546 = 6'ha == index_addr_stay ? tag_addr_stay : tag_10; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire [51:0] _GEN_547 = 6'hb == index_addr_stay ? tag_addr_stay : tag_11; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire [51:0] _GEN_548 = 6'hc == index_addr_stay ? tag_addr_stay : tag_12; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire [51:0] _GEN_549 = 6'hd == index_addr_stay ? tag_addr_stay : tag_13; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire [51:0] _GEN_550 = 6'he == index_addr_stay ? tag_addr_stay : tag_14; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire [51:0] _GEN_551 = 6'hf == index_addr_stay ? tag_addr_stay : tag_15; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire [51:0] _GEN_552 = 6'h10 == index_addr_stay ? tag_addr_stay : tag_16; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire [51:0] _GEN_553 = 6'h11 == index_addr_stay ? tag_addr_stay : tag_17; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire [51:0] _GEN_554 = 6'h12 == index_addr_stay ? tag_addr_stay : tag_18; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire [51:0] _GEN_555 = 6'h13 == index_addr_stay ? tag_addr_stay : tag_19; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire [51:0] _GEN_556 = 6'h14 == index_addr_stay ? tag_addr_stay : tag_20; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire [51:0] _GEN_557 = 6'h15 == index_addr_stay ? tag_addr_stay : tag_21; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire [51:0] _GEN_558 = 6'h16 == index_addr_stay ? tag_addr_stay : tag_22; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire [51:0] _GEN_559 = 6'h17 == index_addr_stay ? tag_addr_stay : tag_23; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire [51:0] _GEN_560 = 6'h18 == index_addr_stay ? tag_addr_stay : tag_24; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire [51:0] _GEN_561 = 6'h19 == index_addr_stay ? tag_addr_stay : tag_25; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire [51:0] _GEN_562 = 6'h1a == index_addr_stay ? tag_addr_stay : tag_26; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire [51:0] _GEN_563 = 6'h1b == index_addr_stay ? tag_addr_stay : tag_27; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire [51:0] _GEN_564 = 6'h1c == index_addr_stay ? tag_addr_stay : tag_28; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire [51:0] _GEN_565 = 6'h1d == index_addr_stay ? tag_addr_stay : tag_29; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire [51:0] _GEN_566 = 6'h1e == index_addr_stay ? tag_addr_stay : tag_30; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire [51:0] _GEN_567 = 6'h1f == index_addr_stay ? tag_addr_stay : tag_31; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire [51:0] _GEN_568 = 6'h20 == index_addr_stay ? tag_addr_stay : tag_32; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire [51:0] _GEN_569 = 6'h21 == index_addr_stay ? tag_addr_stay : tag_33; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire [51:0] _GEN_570 = 6'h22 == index_addr_stay ? tag_addr_stay : tag_34; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire [51:0] _GEN_571 = 6'h23 == index_addr_stay ? tag_addr_stay : tag_35; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire [51:0] _GEN_572 = 6'h24 == index_addr_stay ? tag_addr_stay : tag_36; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire [51:0] _GEN_573 = 6'h25 == index_addr_stay ? tag_addr_stay : tag_37; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire [51:0] _GEN_574 = 6'h26 == index_addr_stay ? tag_addr_stay : tag_38; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire [51:0] _GEN_575 = 6'h27 == index_addr_stay ? tag_addr_stay : tag_39; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire [51:0] _GEN_576 = 6'h28 == index_addr_stay ? tag_addr_stay : tag_40; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire [51:0] _GEN_577 = 6'h29 == index_addr_stay ? tag_addr_stay : tag_41; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire [51:0] _GEN_578 = 6'h2a == index_addr_stay ? tag_addr_stay : tag_42; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire [51:0] _GEN_579 = 6'h2b == index_addr_stay ? tag_addr_stay : tag_43; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire [51:0] _GEN_580 = 6'h2c == index_addr_stay ? tag_addr_stay : tag_44; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire [51:0] _GEN_581 = 6'h2d == index_addr_stay ? tag_addr_stay : tag_45; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire [51:0] _GEN_582 = 6'h2e == index_addr_stay ? tag_addr_stay : tag_46; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire [51:0] _GEN_583 = 6'h2f == index_addr_stay ? tag_addr_stay : tag_47; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire [51:0] _GEN_584 = 6'h30 == index_addr_stay ? tag_addr_stay : tag_48; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire [51:0] _GEN_585 = 6'h31 == index_addr_stay ? tag_addr_stay : tag_49; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire [51:0] _GEN_586 = 6'h32 == index_addr_stay ? tag_addr_stay : tag_50; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire [51:0] _GEN_587 = 6'h33 == index_addr_stay ? tag_addr_stay : tag_51; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire [51:0] _GEN_588 = 6'h34 == index_addr_stay ? tag_addr_stay : tag_52; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire [51:0] _GEN_589 = 6'h35 == index_addr_stay ? tag_addr_stay : tag_53; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire [51:0] _GEN_590 = 6'h36 == index_addr_stay ? tag_addr_stay : tag_54; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire [51:0] _GEN_591 = 6'h37 == index_addr_stay ? tag_addr_stay : tag_55; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire [51:0] _GEN_592 = 6'h38 == index_addr_stay ? tag_addr_stay : tag_56; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire [51:0] _GEN_593 = 6'h39 == index_addr_stay ? tag_addr_stay : tag_57; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire [51:0] _GEN_594 = 6'h3a == index_addr_stay ? tag_addr_stay : tag_58; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire [51:0] _GEN_595 = 6'h3b == index_addr_stay ? tag_addr_stay : tag_59; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire [51:0] _GEN_596 = 6'h3c == index_addr_stay ? tag_addr_stay : tag_60; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire [51:0] _GEN_597 = 6'h3d == index_addr_stay ? tag_addr_stay : tag_61; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire [51:0] _GEN_598 = 6'h3e == index_addr_stay ? tag_addr_stay : tag_62; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire [51:0] _GEN_599 = 6'h3f == index_addr_stay ? tag_addr_stay : tag_63; // @[DCache.scala 479:37 DCache.scala 479:37 DCache.scala 337:25]
  wire  _GEN_3160 = 6'h0 == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_600 = 6'h0 == index_addr_stay | v_0; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_3161 = 6'h1 == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_601 = 6'h1 == index_addr_stay | v_1; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_3162 = 6'h2 == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_602 = 6'h2 == index_addr_stay | v_2; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_3163 = 6'h3 == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_603 = 6'h3 == index_addr_stay | v_3; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_3164 = 6'h4 == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_604 = 6'h4 == index_addr_stay | v_4; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_3165 = 6'h5 == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_605 = 6'h5 == index_addr_stay | v_5; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_3166 = 6'h6 == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_606 = 6'h6 == index_addr_stay | v_6; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_3167 = 6'h7 == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_607 = 6'h7 == index_addr_stay | v_7; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_3168 = 6'h8 == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_608 = 6'h8 == index_addr_stay | v_8; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_3169 = 6'h9 == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_609 = 6'h9 == index_addr_stay | v_9; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_3170 = 6'ha == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_610 = 6'ha == index_addr_stay | v_10; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_3171 = 6'hb == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_611 = 6'hb == index_addr_stay | v_11; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_3172 = 6'hc == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_612 = 6'hc == index_addr_stay | v_12; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_3173 = 6'hd == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_613 = 6'hd == index_addr_stay | v_13; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_3174 = 6'he == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_614 = 6'he == index_addr_stay | v_14; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_3175 = 6'hf == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_615 = 6'hf == index_addr_stay | v_15; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_3176 = 6'h10 == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_616 = 6'h10 == index_addr_stay | v_16; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_3177 = 6'h11 == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_617 = 6'h11 == index_addr_stay | v_17; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_3178 = 6'h12 == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_618 = 6'h12 == index_addr_stay | v_18; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_3179 = 6'h13 == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_619 = 6'h13 == index_addr_stay | v_19; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_3180 = 6'h14 == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_620 = 6'h14 == index_addr_stay | v_20; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_3181 = 6'h15 == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_621 = 6'h15 == index_addr_stay | v_21; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_3182 = 6'h16 == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_622 = 6'h16 == index_addr_stay | v_22; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_3183 = 6'h17 == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_623 = 6'h17 == index_addr_stay | v_23; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_3184 = 6'h18 == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_624 = 6'h18 == index_addr_stay | v_24; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_3185 = 6'h19 == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_625 = 6'h19 == index_addr_stay | v_25; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_3186 = 6'h1a == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_626 = 6'h1a == index_addr_stay | v_26; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_3187 = 6'h1b == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_627 = 6'h1b == index_addr_stay | v_27; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_3188 = 6'h1c == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_628 = 6'h1c == index_addr_stay | v_28; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_3189 = 6'h1d == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_629 = 6'h1d == index_addr_stay | v_29; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_3190 = 6'h1e == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_630 = 6'h1e == index_addr_stay | v_30; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_3191 = 6'h1f == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_631 = 6'h1f == index_addr_stay | v_31; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_3192 = 6'h20 == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_632 = 6'h20 == index_addr_stay | v_32; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_3193 = 6'h21 == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_633 = 6'h21 == index_addr_stay | v_33; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_3194 = 6'h22 == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_634 = 6'h22 == index_addr_stay | v_34; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_3195 = 6'h23 == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_635 = 6'h23 == index_addr_stay | v_35; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_3196 = 6'h24 == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_636 = 6'h24 == index_addr_stay | v_36; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_3197 = 6'h25 == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_637 = 6'h25 == index_addr_stay | v_37; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_3198 = 6'h26 == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_638 = 6'h26 == index_addr_stay | v_38; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_3199 = 6'h27 == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_639 = 6'h27 == index_addr_stay | v_39; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_3200 = 6'h28 == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_640 = 6'h28 == index_addr_stay | v_40; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_3201 = 6'h29 == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_641 = 6'h29 == index_addr_stay | v_41; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_3202 = 6'h2a == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_642 = 6'h2a == index_addr_stay | v_42; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_3203 = 6'h2b == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_643 = 6'h2b == index_addr_stay | v_43; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_3204 = 6'h2c == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_644 = 6'h2c == index_addr_stay | v_44; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_3205 = 6'h2d == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_645 = 6'h2d == index_addr_stay | v_45; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_3206 = 6'h2e == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_646 = 6'h2e == index_addr_stay | v_46; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_3207 = 6'h2f == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_647 = 6'h2f == index_addr_stay | v_47; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_3208 = 6'h30 == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_648 = 6'h30 == index_addr_stay | v_48; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_3209 = 6'h31 == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_649 = 6'h31 == index_addr_stay | v_49; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_3210 = 6'h32 == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_650 = 6'h32 == index_addr_stay | v_50; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_3211 = 6'h33 == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_651 = 6'h33 == index_addr_stay | v_51; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_3212 = 6'h34 == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_652 = 6'h34 == index_addr_stay | v_52; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_3213 = 6'h35 == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_653 = 6'h35 == index_addr_stay | v_53; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_3214 = 6'h36 == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_654 = 6'h36 == index_addr_stay | v_54; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_3215 = 6'h37 == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_655 = 6'h37 == index_addr_stay | v_55; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_3216 = 6'h38 == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_656 = 6'h38 == index_addr_stay | v_56; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_3217 = 6'h39 == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_657 = 6'h39 == index_addr_stay | v_57; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_3218 = 6'h3a == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_658 = 6'h3a == index_addr_stay | v_58; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_3219 = 6'h3b == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_659 = 6'h3b == index_addr_stay | v_59; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_3220 = 6'h3c == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_660 = 6'h3c == index_addr_stay | v_60; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_3221 = 6'h3d == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_661 = 6'h3d == index_addr_stay | v_61; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_3222 = 6'h3e == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_662 = 6'h3e == index_addr_stay | v_62; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_3223 = 6'h3f == index_addr_stay; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_663 = 6'h3f == index_addr_stay | v_63; // @[DCache.scala 480:37 DCache.scala 480:37 DCache.scala 334:25]
  wire  _GEN_664 = 6'h0 == index_addr_stay ? 1'h0 : d_0; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire  _GEN_665 = 6'h1 == index_addr_stay ? 1'h0 : d_1; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire  _GEN_666 = 6'h2 == index_addr_stay ? 1'h0 : d_2; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire  _GEN_667 = 6'h3 == index_addr_stay ? 1'h0 : d_3; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire  _GEN_668 = 6'h4 == index_addr_stay ? 1'h0 : d_4; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire  _GEN_669 = 6'h5 == index_addr_stay ? 1'h0 : d_5; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire  _GEN_670 = 6'h6 == index_addr_stay ? 1'h0 : d_6; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire  _GEN_671 = 6'h7 == index_addr_stay ? 1'h0 : d_7; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire  _GEN_672 = 6'h8 == index_addr_stay ? 1'h0 : d_8; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire  _GEN_673 = 6'h9 == index_addr_stay ? 1'h0 : d_9; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire  _GEN_674 = 6'ha == index_addr_stay ? 1'h0 : d_10; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire  _GEN_675 = 6'hb == index_addr_stay ? 1'h0 : d_11; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire  _GEN_676 = 6'hc == index_addr_stay ? 1'h0 : d_12; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire  _GEN_677 = 6'hd == index_addr_stay ? 1'h0 : d_13; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire  _GEN_678 = 6'he == index_addr_stay ? 1'h0 : d_14; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire  _GEN_679 = 6'hf == index_addr_stay ? 1'h0 : d_15; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire  _GEN_680 = 6'h10 == index_addr_stay ? 1'h0 : d_16; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire  _GEN_681 = 6'h11 == index_addr_stay ? 1'h0 : d_17; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire  _GEN_682 = 6'h12 == index_addr_stay ? 1'h0 : d_18; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire  _GEN_683 = 6'h13 == index_addr_stay ? 1'h0 : d_19; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire  _GEN_684 = 6'h14 == index_addr_stay ? 1'h0 : d_20; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire  _GEN_685 = 6'h15 == index_addr_stay ? 1'h0 : d_21; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire  _GEN_686 = 6'h16 == index_addr_stay ? 1'h0 : d_22; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire  _GEN_687 = 6'h17 == index_addr_stay ? 1'h0 : d_23; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire  _GEN_688 = 6'h18 == index_addr_stay ? 1'h0 : d_24; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire  _GEN_689 = 6'h19 == index_addr_stay ? 1'h0 : d_25; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire  _GEN_690 = 6'h1a == index_addr_stay ? 1'h0 : d_26; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire  _GEN_691 = 6'h1b == index_addr_stay ? 1'h0 : d_27; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire  _GEN_692 = 6'h1c == index_addr_stay ? 1'h0 : d_28; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire  _GEN_693 = 6'h1d == index_addr_stay ? 1'h0 : d_29; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire  _GEN_694 = 6'h1e == index_addr_stay ? 1'h0 : d_30; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire  _GEN_695 = 6'h1f == index_addr_stay ? 1'h0 : d_31; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire  _GEN_696 = 6'h20 == index_addr_stay ? 1'h0 : d_32; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire  _GEN_697 = 6'h21 == index_addr_stay ? 1'h0 : d_33; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire  _GEN_698 = 6'h22 == index_addr_stay ? 1'h0 : d_34; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire  _GEN_699 = 6'h23 == index_addr_stay ? 1'h0 : d_35; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire  _GEN_700 = 6'h24 == index_addr_stay ? 1'h0 : d_36; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire  _GEN_701 = 6'h25 == index_addr_stay ? 1'h0 : d_37; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire  _GEN_702 = 6'h26 == index_addr_stay ? 1'h0 : d_38; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire  _GEN_703 = 6'h27 == index_addr_stay ? 1'h0 : d_39; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire  _GEN_704 = 6'h28 == index_addr_stay ? 1'h0 : d_40; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire  _GEN_705 = 6'h29 == index_addr_stay ? 1'h0 : d_41; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire  _GEN_706 = 6'h2a == index_addr_stay ? 1'h0 : d_42; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire  _GEN_707 = 6'h2b == index_addr_stay ? 1'h0 : d_43; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire  _GEN_708 = 6'h2c == index_addr_stay ? 1'h0 : d_44; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire  _GEN_709 = 6'h2d == index_addr_stay ? 1'h0 : d_45; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire  _GEN_710 = 6'h2e == index_addr_stay ? 1'h0 : d_46; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire  _GEN_711 = 6'h2f == index_addr_stay ? 1'h0 : d_47; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire  _GEN_712 = 6'h30 == index_addr_stay ? 1'h0 : d_48; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire  _GEN_713 = 6'h31 == index_addr_stay ? 1'h0 : d_49; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire  _GEN_714 = 6'h32 == index_addr_stay ? 1'h0 : d_50; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire  _GEN_715 = 6'h33 == index_addr_stay ? 1'h0 : d_51; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire  _GEN_716 = 6'h34 == index_addr_stay ? 1'h0 : d_52; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire  _GEN_717 = 6'h35 == index_addr_stay ? 1'h0 : d_53; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire  _GEN_718 = 6'h36 == index_addr_stay ? 1'h0 : d_54; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire  _GEN_719 = 6'h37 == index_addr_stay ? 1'h0 : d_55; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire  _GEN_720 = 6'h38 == index_addr_stay ? 1'h0 : d_56; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire  _GEN_721 = 6'h39 == index_addr_stay ? 1'h0 : d_57; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire  _GEN_722 = 6'h3a == index_addr_stay ? 1'h0 : d_58; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire  _GEN_723 = 6'h3b == index_addr_stay ? 1'h0 : d_59; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire  _GEN_724 = 6'h3c == index_addr_stay ? 1'h0 : d_60; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire  _GEN_725 = 6'h3d == index_addr_stay ? 1'h0 : d_61; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire  _GEN_726 = 6'h3e == index_addr_stay ? 1'h0 : d_62; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire  _GEN_727 = 6'h3f == index_addr_stay ? 1'h0 : d_63; // @[DCache.scala 481:37 DCache.scala 481:37 DCache.scala 335:25]
  wire [574:0] _GEN_3224 = {{511'd0}, wdata_stay}; // @[DCache.scala 488:43]
  wire [574:0] _T_48 = _GEN_3224 << _data_T; // @[DCache.scala 488:43]
  wire [7:0] hi_hi_hi_1 = wmask_stay[7] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] hi_hi_lo_1 = wmask_stay[6] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] hi_lo_hi_1 = wmask_stay[5] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] hi_lo_lo_1 = wmask_stay[4] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] lo_hi_hi_1 = wmask_stay[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] lo_hi_lo_1 = wmask_stay[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] lo_lo_hi_1 = wmask_stay[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] lo_lo_lo_1 = wmask_stay[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _T_65 = {hi_hi_hi_1,hi_hi_lo_1,hi_lo_hi_1,hi_lo_lo_1,lo_hi_hi_1,lo_hi_lo_1,lo_lo_hi_1,lo_lo_lo_1}; // @[Cat.scala 30:58]
  wire [574:0] _GEN_3225 = {{511'd0}, _T_65}; // @[DCache.scala 489:56]
  wire [574:0] _T_67 = _GEN_3225 << _data_T; // @[DCache.scala 489:56]
  wire  _GEN_792 = op_stay ? _GEN_3160 | d_0 : d_0; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire  _GEN_793 = op_stay ? _GEN_3161 | d_1 : d_1; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire  _GEN_794 = op_stay ? _GEN_3162 | d_2 : d_2; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire  _GEN_795 = op_stay ? _GEN_3163 | d_3 : d_3; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire  _GEN_796 = op_stay ? _GEN_3164 | d_4 : d_4; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire  _GEN_797 = op_stay ? _GEN_3165 | d_5 : d_5; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire  _GEN_798 = op_stay ? _GEN_3166 | d_6 : d_6; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire  _GEN_799 = op_stay ? _GEN_3167 | d_7 : d_7; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire  _GEN_800 = op_stay ? _GEN_3168 | d_8 : d_8; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire  _GEN_801 = op_stay ? _GEN_3169 | d_9 : d_9; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire  _GEN_802 = op_stay ? _GEN_3170 | d_10 : d_10; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire  _GEN_803 = op_stay ? _GEN_3171 | d_11 : d_11; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire  _GEN_804 = op_stay ? _GEN_3172 | d_12 : d_12; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire  _GEN_805 = op_stay ? _GEN_3173 | d_13 : d_13; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire  _GEN_806 = op_stay ? _GEN_3174 | d_14 : d_14; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire  _GEN_807 = op_stay ? _GEN_3175 | d_15 : d_15; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire  _GEN_808 = op_stay ? _GEN_3176 | d_16 : d_16; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire  _GEN_809 = op_stay ? _GEN_3177 | d_17 : d_17; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire  _GEN_810 = op_stay ? _GEN_3178 | d_18 : d_18; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire  _GEN_811 = op_stay ? _GEN_3179 | d_19 : d_19; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire  _GEN_812 = op_stay ? _GEN_3180 | d_20 : d_20; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire  _GEN_813 = op_stay ? _GEN_3181 | d_21 : d_21; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire  _GEN_814 = op_stay ? _GEN_3182 | d_22 : d_22; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire  _GEN_815 = op_stay ? _GEN_3183 | d_23 : d_23; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire  _GEN_816 = op_stay ? _GEN_3184 | d_24 : d_24; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire  _GEN_817 = op_stay ? _GEN_3185 | d_25 : d_25; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire  _GEN_818 = op_stay ? _GEN_3186 | d_26 : d_26; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire  _GEN_819 = op_stay ? _GEN_3187 | d_27 : d_27; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire  _GEN_820 = op_stay ? _GEN_3188 | d_28 : d_28; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire  _GEN_821 = op_stay ? _GEN_3189 | d_29 : d_29; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire  _GEN_822 = op_stay ? _GEN_3190 | d_30 : d_30; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire  _GEN_823 = op_stay ? _GEN_3191 | d_31 : d_31; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire  _GEN_824 = op_stay ? _GEN_3192 | d_32 : d_32; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire  _GEN_825 = op_stay ? _GEN_3193 | d_33 : d_33; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire  _GEN_826 = op_stay ? _GEN_3194 | d_34 : d_34; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire  _GEN_827 = op_stay ? _GEN_3195 | d_35 : d_35; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire  _GEN_828 = op_stay ? _GEN_3196 | d_36 : d_36; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire  _GEN_829 = op_stay ? _GEN_3197 | d_37 : d_37; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire  _GEN_830 = op_stay ? _GEN_3198 | d_38 : d_38; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire  _GEN_831 = op_stay ? _GEN_3199 | d_39 : d_39; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire  _GEN_832 = op_stay ? _GEN_3200 | d_40 : d_40; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire  _GEN_833 = op_stay ? _GEN_3201 | d_41 : d_41; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire  _GEN_834 = op_stay ? _GEN_3202 | d_42 : d_42; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire  _GEN_835 = op_stay ? _GEN_3203 | d_43 : d_43; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire  _GEN_836 = op_stay ? _GEN_3204 | d_44 : d_44; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire  _GEN_837 = op_stay ? _GEN_3205 | d_45 : d_45; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire  _GEN_838 = op_stay ? _GEN_3206 | d_46 : d_46; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire  _GEN_839 = op_stay ? _GEN_3207 | d_47 : d_47; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire  _GEN_840 = op_stay ? _GEN_3208 | d_48 : d_48; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire  _GEN_841 = op_stay ? _GEN_3209 | d_49 : d_49; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire  _GEN_842 = op_stay ? _GEN_3210 | d_50 : d_50; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire  _GEN_843 = op_stay ? _GEN_3211 | d_51 : d_51; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire  _GEN_844 = op_stay ? _GEN_3212 | d_52 : d_52; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire  _GEN_845 = op_stay ? _GEN_3213 | d_53 : d_53; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire  _GEN_846 = op_stay ? _GEN_3214 | d_54 : d_54; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire  _GEN_847 = op_stay ? _GEN_3215 | d_55 : d_55; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire  _GEN_848 = op_stay ? _GEN_3216 | d_56 : d_56; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire  _GEN_849 = op_stay ? _GEN_3217 | d_57 : d_57; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire  _GEN_850 = op_stay ? _GEN_3218 | d_58 : d_58; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire  _GEN_851 = op_stay ? _GEN_3219 | d_59 : d_59; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire  _GEN_852 = op_stay ? _GEN_3220 | d_60 : d_60; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire  _GEN_853 = op_stay ? _GEN_3221 | d_61 : d_61; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire  _GEN_854 = op_stay ? _GEN_3222 | d_62 : d_62; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire  _GEN_855 = op_stay ? _GEN_3223 | d_63 : d_63; // @[DCache.scala 491:26 DCache.scala 335:25]
  wire [51:0] _GEN_857 = 6'h1 == fence_reg ? tag_1 : tag_0; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_858 = 6'h2 == fence_reg ? tag_2 : _GEN_857; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_859 = 6'h3 == fence_reg ? tag_3 : _GEN_858; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_860 = 6'h4 == fence_reg ? tag_4 : _GEN_859; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_861 = 6'h5 == fence_reg ? tag_5 : _GEN_860; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_862 = 6'h6 == fence_reg ? tag_6 : _GEN_861; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_863 = 6'h7 == fence_reg ? tag_7 : _GEN_862; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_864 = 6'h8 == fence_reg ? tag_8 : _GEN_863; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_865 = 6'h9 == fence_reg ? tag_9 : _GEN_864; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_866 = 6'ha == fence_reg ? tag_10 : _GEN_865; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_867 = 6'hb == fence_reg ? tag_11 : _GEN_866; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_868 = 6'hc == fence_reg ? tag_12 : _GEN_867; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_869 = 6'hd == fence_reg ? tag_13 : _GEN_868; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_870 = 6'he == fence_reg ? tag_14 : _GEN_869; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_871 = 6'hf == fence_reg ? tag_15 : _GEN_870; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_872 = 6'h10 == fence_reg ? tag_16 : _GEN_871; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_873 = 6'h11 == fence_reg ? tag_17 : _GEN_872; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_874 = 6'h12 == fence_reg ? tag_18 : _GEN_873; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_875 = 6'h13 == fence_reg ? tag_19 : _GEN_874; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_876 = 6'h14 == fence_reg ? tag_20 : _GEN_875; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_877 = 6'h15 == fence_reg ? tag_21 : _GEN_876; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_878 = 6'h16 == fence_reg ? tag_22 : _GEN_877; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_879 = 6'h17 == fence_reg ? tag_23 : _GEN_878; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_880 = 6'h18 == fence_reg ? tag_24 : _GEN_879; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_881 = 6'h19 == fence_reg ? tag_25 : _GEN_880; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_882 = 6'h1a == fence_reg ? tag_26 : _GEN_881; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_883 = 6'h1b == fence_reg ? tag_27 : _GEN_882; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_884 = 6'h1c == fence_reg ? tag_28 : _GEN_883; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_885 = 6'h1d == fence_reg ? tag_29 : _GEN_884; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_886 = 6'h1e == fence_reg ? tag_30 : _GEN_885; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_887 = 6'h1f == fence_reg ? tag_31 : _GEN_886; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_888 = 6'h20 == fence_reg ? tag_32 : _GEN_887; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_889 = 6'h21 == fence_reg ? tag_33 : _GEN_888; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_890 = 6'h22 == fence_reg ? tag_34 : _GEN_889; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_891 = 6'h23 == fence_reg ? tag_35 : _GEN_890; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_892 = 6'h24 == fence_reg ? tag_36 : _GEN_891; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_893 = 6'h25 == fence_reg ? tag_37 : _GEN_892; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_894 = 6'h26 == fence_reg ? tag_38 : _GEN_893; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_895 = 6'h27 == fence_reg ? tag_39 : _GEN_894; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_896 = 6'h28 == fence_reg ? tag_40 : _GEN_895; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_897 = 6'h29 == fence_reg ? tag_41 : _GEN_896; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_898 = 6'h2a == fence_reg ? tag_42 : _GEN_897; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_899 = 6'h2b == fence_reg ? tag_43 : _GEN_898; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_900 = 6'h2c == fence_reg ? tag_44 : _GEN_899; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_901 = 6'h2d == fence_reg ? tag_45 : _GEN_900; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_902 = 6'h2e == fence_reg ? tag_46 : _GEN_901; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_903 = 6'h2f == fence_reg ? tag_47 : _GEN_902; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_904 = 6'h30 == fence_reg ? tag_48 : _GEN_903; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_905 = 6'h31 == fence_reg ? tag_49 : _GEN_904; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_906 = 6'h32 == fence_reg ? tag_50 : _GEN_905; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_907 = 6'h33 == fence_reg ? tag_51 : _GEN_906; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_908 = 6'h34 == fence_reg ? tag_52 : _GEN_907; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_909 = 6'h35 == fence_reg ? tag_53 : _GEN_908; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_910 = 6'h36 == fence_reg ? tag_54 : _GEN_909; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_911 = 6'h37 == fence_reg ? tag_55 : _GEN_910; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_912 = 6'h38 == fence_reg ? tag_56 : _GEN_911; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_913 = 6'h39 == fence_reg ? tag_57 : _GEN_912; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_914 = 6'h3a == fence_reg ? tag_58 : _GEN_913; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_915 = 6'h3b == fence_reg ? tag_59 : _GEN_914; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_916 = 6'h3c == fence_reg ? tag_60 : _GEN_915; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_917 = 6'h3d == fence_reg ? tag_61 : _GEN_916; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_918 = 6'h3e == fence_reg ? tag_62 : _GEN_917; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [51:0] _GEN_919 = 6'h3f == fence_reg ? tag_63 : _GEN_918; // @[Cat.scala 30:58 Cat.scala 30:58]
  wire [63:0] _io_axi_waddr_T_1 = {_GEN_919,fence_reg,6'h0}; // @[Cat.scala 30:58]
  wire [5:0] _fence_reg_T_1 = fence_reg + 6'h1; // @[DCache.scala 510:36]
  wire  _GEN_920 = 6'h0 == fence_reg ? 1'h0 : v_0; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_921 = 6'h1 == fence_reg ? 1'h0 : v_1; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_922 = 6'h2 == fence_reg ? 1'h0 : v_2; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_923 = 6'h3 == fence_reg ? 1'h0 : v_3; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_924 = 6'h4 == fence_reg ? 1'h0 : v_4; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_925 = 6'h5 == fence_reg ? 1'h0 : v_5; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_926 = 6'h6 == fence_reg ? 1'h0 : v_6; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_927 = 6'h7 == fence_reg ? 1'h0 : v_7; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_928 = 6'h8 == fence_reg ? 1'h0 : v_8; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_929 = 6'h9 == fence_reg ? 1'h0 : v_9; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_930 = 6'ha == fence_reg ? 1'h0 : v_10; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_931 = 6'hb == fence_reg ? 1'h0 : v_11; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_932 = 6'hc == fence_reg ? 1'h0 : v_12; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_933 = 6'hd == fence_reg ? 1'h0 : v_13; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_934 = 6'he == fence_reg ? 1'h0 : v_14; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_935 = 6'hf == fence_reg ? 1'h0 : v_15; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_936 = 6'h10 == fence_reg ? 1'h0 : v_16; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_937 = 6'h11 == fence_reg ? 1'h0 : v_17; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_938 = 6'h12 == fence_reg ? 1'h0 : v_18; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_939 = 6'h13 == fence_reg ? 1'h0 : v_19; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_940 = 6'h14 == fence_reg ? 1'h0 : v_20; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_941 = 6'h15 == fence_reg ? 1'h0 : v_21; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_942 = 6'h16 == fence_reg ? 1'h0 : v_22; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_943 = 6'h17 == fence_reg ? 1'h0 : v_23; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_944 = 6'h18 == fence_reg ? 1'h0 : v_24; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_945 = 6'h19 == fence_reg ? 1'h0 : v_25; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_946 = 6'h1a == fence_reg ? 1'h0 : v_26; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_947 = 6'h1b == fence_reg ? 1'h0 : v_27; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_948 = 6'h1c == fence_reg ? 1'h0 : v_28; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_949 = 6'h1d == fence_reg ? 1'h0 : v_29; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_950 = 6'h1e == fence_reg ? 1'h0 : v_30; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_951 = 6'h1f == fence_reg ? 1'h0 : v_31; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_952 = 6'h20 == fence_reg ? 1'h0 : v_32; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_953 = 6'h21 == fence_reg ? 1'h0 : v_33; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_954 = 6'h22 == fence_reg ? 1'h0 : v_34; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_955 = 6'h23 == fence_reg ? 1'h0 : v_35; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_956 = 6'h24 == fence_reg ? 1'h0 : v_36; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_957 = 6'h25 == fence_reg ? 1'h0 : v_37; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_958 = 6'h26 == fence_reg ? 1'h0 : v_38; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_959 = 6'h27 == fence_reg ? 1'h0 : v_39; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_960 = 6'h28 == fence_reg ? 1'h0 : v_40; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_961 = 6'h29 == fence_reg ? 1'h0 : v_41; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_962 = 6'h2a == fence_reg ? 1'h0 : v_42; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_963 = 6'h2b == fence_reg ? 1'h0 : v_43; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_964 = 6'h2c == fence_reg ? 1'h0 : v_44; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_965 = 6'h2d == fence_reg ? 1'h0 : v_45; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_966 = 6'h2e == fence_reg ? 1'h0 : v_46; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_967 = 6'h2f == fence_reg ? 1'h0 : v_47; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_968 = 6'h30 == fence_reg ? 1'h0 : v_48; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_969 = 6'h31 == fence_reg ? 1'h0 : v_49; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_970 = 6'h32 == fence_reg ? 1'h0 : v_50; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_971 = 6'h33 == fence_reg ? 1'h0 : v_51; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_972 = 6'h34 == fence_reg ? 1'h0 : v_52; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_973 = 6'h35 == fence_reg ? 1'h0 : v_53; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_974 = 6'h36 == fence_reg ? 1'h0 : v_54; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_975 = 6'h37 == fence_reg ? 1'h0 : v_55; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_976 = 6'h38 == fence_reg ? 1'h0 : v_56; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_977 = 6'h39 == fence_reg ? 1'h0 : v_57; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_978 = 6'h3a == fence_reg ? 1'h0 : v_58; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_979 = 6'h3b == fence_reg ? 1'h0 : v_59; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_980 = 6'h3c == fence_reg ? 1'h0 : v_60; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_981 = 6'h3d == fence_reg ? 1'h0 : v_61; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_982 = 6'h3e == fence_reg ? 1'h0 : v_62; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_983 = 6'h3f == fence_reg ? 1'h0 : v_63; // @[DCache.scala 511:29 DCache.scala 511:29 DCache.scala 334:25]
  wire  _GEN_984 = 6'h0 == fence_reg ? 1'h0 : d_0; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire  _GEN_985 = 6'h1 == fence_reg ? 1'h0 : d_1; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire  _GEN_986 = 6'h2 == fence_reg ? 1'h0 : d_2; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire  _GEN_987 = 6'h3 == fence_reg ? 1'h0 : d_3; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire  _GEN_988 = 6'h4 == fence_reg ? 1'h0 : d_4; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire  _GEN_989 = 6'h5 == fence_reg ? 1'h0 : d_5; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire  _GEN_990 = 6'h6 == fence_reg ? 1'h0 : d_6; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire  _GEN_991 = 6'h7 == fence_reg ? 1'h0 : d_7; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire  _GEN_992 = 6'h8 == fence_reg ? 1'h0 : d_8; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire  _GEN_993 = 6'h9 == fence_reg ? 1'h0 : d_9; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire  _GEN_994 = 6'ha == fence_reg ? 1'h0 : d_10; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire  _GEN_995 = 6'hb == fence_reg ? 1'h0 : d_11; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire  _GEN_996 = 6'hc == fence_reg ? 1'h0 : d_12; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire  _GEN_997 = 6'hd == fence_reg ? 1'h0 : d_13; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire  _GEN_998 = 6'he == fence_reg ? 1'h0 : d_14; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire  _GEN_999 = 6'hf == fence_reg ? 1'h0 : d_15; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire  _GEN_1000 = 6'h10 == fence_reg ? 1'h0 : d_16; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire  _GEN_1001 = 6'h11 == fence_reg ? 1'h0 : d_17; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire  _GEN_1002 = 6'h12 == fence_reg ? 1'h0 : d_18; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire  _GEN_1003 = 6'h13 == fence_reg ? 1'h0 : d_19; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire  _GEN_1004 = 6'h14 == fence_reg ? 1'h0 : d_20; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire  _GEN_1005 = 6'h15 == fence_reg ? 1'h0 : d_21; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire  _GEN_1006 = 6'h16 == fence_reg ? 1'h0 : d_22; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire  _GEN_1007 = 6'h17 == fence_reg ? 1'h0 : d_23; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire  _GEN_1008 = 6'h18 == fence_reg ? 1'h0 : d_24; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire  _GEN_1009 = 6'h19 == fence_reg ? 1'h0 : d_25; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire  _GEN_1010 = 6'h1a == fence_reg ? 1'h0 : d_26; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire  _GEN_1011 = 6'h1b == fence_reg ? 1'h0 : d_27; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire  _GEN_1012 = 6'h1c == fence_reg ? 1'h0 : d_28; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire  _GEN_1013 = 6'h1d == fence_reg ? 1'h0 : d_29; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire  _GEN_1014 = 6'h1e == fence_reg ? 1'h0 : d_30; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire  _GEN_1015 = 6'h1f == fence_reg ? 1'h0 : d_31; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire  _GEN_1016 = 6'h20 == fence_reg ? 1'h0 : d_32; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire  _GEN_1017 = 6'h21 == fence_reg ? 1'h0 : d_33; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire  _GEN_1018 = 6'h22 == fence_reg ? 1'h0 : d_34; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire  _GEN_1019 = 6'h23 == fence_reg ? 1'h0 : d_35; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire  _GEN_1020 = 6'h24 == fence_reg ? 1'h0 : d_36; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire  _GEN_1021 = 6'h25 == fence_reg ? 1'h0 : d_37; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire  _GEN_1022 = 6'h26 == fence_reg ? 1'h0 : d_38; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire  _GEN_1023 = 6'h27 == fence_reg ? 1'h0 : d_39; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire  _GEN_1024 = 6'h28 == fence_reg ? 1'h0 : d_40; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire  _GEN_1025 = 6'h29 == fence_reg ? 1'h0 : d_41; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire  _GEN_1026 = 6'h2a == fence_reg ? 1'h0 : d_42; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire  _GEN_1027 = 6'h2b == fence_reg ? 1'h0 : d_43; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire  _GEN_1028 = 6'h2c == fence_reg ? 1'h0 : d_44; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire  _GEN_1029 = 6'h2d == fence_reg ? 1'h0 : d_45; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire  _GEN_1030 = 6'h2e == fence_reg ? 1'h0 : d_46; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire  _GEN_1031 = 6'h2f == fence_reg ? 1'h0 : d_47; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire  _GEN_1032 = 6'h30 == fence_reg ? 1'h0 : d_48; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire  _GEN_1033 = 6'h31 == fence_reg ? 1'h0 : d_49; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire  _GEN_1034 = 6'h32 == fence_reg ? 1'h0 : d_50; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire  _GEN_1035 = 6'h33 == fence_reg ? 1'h0 : d_51; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire  _GEN_1036 = 6'h34 == fence_reg ? 1'h0 : d_52; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire  _GEN_1037 = 6'h35 == fence_reg ? 1'h0 : d_53; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire  _GEN_1038 = 6'h36 == fence_reg ? 1'h0 : d_54; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire  _GEN_1039 = 6'h37 == fence_reg ? 1'h0 : d_55; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire  _GEN_1040 = 6'h38 == fence_reg ? 1'h0 : d_56; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire  _GEN_1041 = 6'h39 == fence_reg ? 1'h0 : d_57; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire  _GEN_1042 = 6'h3a == fence_reg ? 1'h0 : d_58; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire  _GEN_1043 = 6'h3b == fence_reg ? 1'h0 : d_59; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire  _GEN_1044 = 6'h3c == fence_reg ? 1'h0 : d_60; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire  _GEN_1045 = 6'h3d == fence_reg ? 1'h0 : d_61; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire  _GEN_1046 = 6'h3e == fence_reg ? 1'h0 : d_62; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire  _GEN_1047 = 6'h3f == fence_reg ? 1'h0 : d_63; // @[DCache.scala 512:29 DCache.scala 512:29 DCache.scala 335:25]
  wire [5:0] _GEN_1048 = _T_13 ? _fence_reg_T_1 : fence_reg; // @[Conditional.scala 39:67 DCache.scala 510:23 DCache.scala 350:28]
  wire  _GEN_1049 = _T_13 ? _GEN_920 : v_0; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1050 = _T_13 ? _GEN_921 : v_1; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1051 = _T_13 ? _GEN_922 : v_2; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1052 = _T_13 ? _GEN_923 : v_3; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1053 = _T_13 ? _GEN_924 : v_4; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1054 = _T_13 ? _GEN_925 : v_5; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1055 = _T_13 ? _GEN_926 : v_6; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1056 = _T_13 ? _GEN_927 : v_7; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1057 = _T_13 ? _GEN_928 : v_8; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1058 = _T_13 ? _GEN_929 : v_9; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1059 = _T_13 ? _GEN_930 : v_10; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1060 = _T_13 ? _GEN_931 : v_11; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1061 = _T_13 ? _GEN_932 : v_12; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1062 = _T_13 ? _GEN_933 : v_13; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1063 = _T_13 ? _GEN_934 : v_14; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1064 = _T_13 ? _GEN_935 : v_15; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1065 = _T_13 ? _GEN_936 : v_16; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1066 = _T_13 ? _GEN_937 : v_17; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1067 = _T_13 ? _GEN_938 : v_18; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1068 = _T_13 ? _GEN_939 : v_19; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1069 = _T_13 ? _GEN_940 : v_20; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1070 = _T_13 ? _GEN_941 : v_21; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1071 = _T_13 ? _GEN_942 : v_22; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1072 = _T_13 ? _GEN_943 : v_23; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1073 = _T_13 ? _GEN_944 : v_24; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1074 = _T_13 ? _GEN_945 : v_25; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1075 = _T_13 ? _GEN_946 : v_26; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1076 = _T_13 ? _GEN_947 : v_27; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1077 = _T_13 ? _GEN_948 : v_28; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1078 = _T_13 ? _GEN_949 : v_29; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1079 = _T_13 ? _GEN_950 : v_30; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1080 = _T_13 ? _GEN_951 : v_31; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1081 = _T_13 ? _GEN_952 : v_32; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1082 = _T_13 ? _GEN_953 : v_33; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1083 = _T_13 ? _GEN_954 : v_34; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1084 = _T_13 ? _GEN_955 : v_35; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1085 = _T_13 ? _GEN_956 : v_36; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1086 = _T_13 ? _GEN_957 : v_37; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1087 = _T_13 ? _GEN_958 : v_38; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1088 = _T_13 ? _GEN_959 : v_39; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1089 = _T_13 ? _GEN_960 : v_40; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1090 = _T_13 ? _GEN_961 : v_41; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1091 = _T_13 ? _GEN_962 : v_42; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1092 = _T_13 ? _GEN_963 : v_43; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1093 = _T_13 ? _GEN_964 : v_44; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1094 = _T_13 ? _GEN_965 : v_45; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1095 = _T_13 ? _GEN_966 : v_46; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1096 = _T_13 ? _GEN_967 : v_47; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1097 = _T_13 ? _GEN_968 : v_48; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1098 = _T_13 ? _GEN_969 : v_49; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1099 = _T_13 ? _GEN_970 : v_50; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1100 = _T_13 ? _GEN_971 : v_51; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1101 = _T_13 ? _GEN_972 : v_52; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1102 = _T_13 ? _GEN_973 : v_53; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1103 = _T_13 ? _GEN_974 : v_54; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1104 = _T_13 ? _GEN_975 : v_55; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1105 = _T_13 ? _GEN_976 : v_56; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1106 = _T_13 ? _GEN_977 : v_57; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1107 = _T_13 ? _GEN_978 : v_58; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1108 = _T_13 ? _GEN_979 : v_59; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1109 = _T_13 ? _GEN_980 : v_60; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1110 = _T_13 ? _GEN_981 : v_61; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1111 = _T_13 ? _GEN_982 : v_62; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1112 = _T_13 ? _GEN_983 : v_63; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1113 = _T_13 ? _GEN_984 : d_0; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1114 = _T_13 ? _GEN_985 : d_1; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1115 = _T_13 ? _GEN_986 : d_2; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1116 = _T_13 ? _GEN_987 : d_3; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1117 = _T_13 ? _GEN_988 : d_4; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1118 = _T_13 ? _GEN_989 : d_5; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1119 = _T_13 ? _GEN_990 : d_6; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1120 = _T_13 ? _GEN_991 : d_7; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1121 = _T_13 ? _GEN_992 : d_8; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1122 = _T_13 ? _GEN_993 : d_9; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1123 = _T_13 ? _GEN_994 : d_10; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1124 = _T_13 ? _GEN_995 : d_11; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1125 = _T_13 ? _GEN_996 : d_12; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1126 = _T_13 ? _GEN_997 : d_13; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1127 = _T_13 ? _GEN_998 : d_14; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1128 = _T_13 ? _GEN_999 : d_15; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1129 = _T_13 ? _GEN_1000 : d_16; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1130 = _T_13 ? _GEN_1001 : d_17; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1131 = _T_13 ? _GEN_1002 : d_18; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1132 = _T_13 ? _GEN_1003 : d_19; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1133 = _T_13 ? _GEN_1004 : d_20; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1134 = _T_13 ? _GEN_1005 : d_21; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1135 = _T_13 ? _GEN_1006 : d_22; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1136 = _T_13 ? _GEN_1007 : d_23; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1137 = _T_13 ? _GEN_1008 : d_24; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1138 = _T_13 ? _GEN_1009 : d_25; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1139 = _T_13 ? _GEN_1010 : d_26; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1140 = _T_13 ? _GEN_1011 : d_27; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1141 = _T_13 ? _GEN_1012 : d_28; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1142 = _T_13 ? _GEN_1013 : d_29; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1143 = _T_13 ? _GEN_1014 : d_30; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1144 = _T_13 ? _GEN_1015 : d_31; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1145 = _T_13 ? _GEN_1016 : d_32; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1146 = _T_13 ? _GEN_1017 : d_33; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1147 = _T_13 ? _GEN_1018 : d_34; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1148 = _T_13 ? _GEN_1019 : d_35; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1149 = _T_13 ? _GEN_1020 : d_36; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1150 = _T_13 ? _GEN_1021 : d_37; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1151 = _T_13 ? _GEN_1022 : d_38; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1152 = _T_13 ? _GEN_1023 : d_39; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1153 = _T_13 ? _GEN_1024 : d_40; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1154 = _T_13 ? _GEN_1025 : d_41; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1155 = _T_13 ? _GEN_1026 : d_42; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1156 = _T_13 ? _GEN_1027 : d_43; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1157 = _T_13 ? _GEN_1028 : d_44; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1158 = _T_13 ? _GEN_1029 : d_45; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1159 = _T_13 ? _GEN_1030 : d_46; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1160 = _T_13 ? _GEN_1031 : d_47; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1161 = _T_13 ? _GEN_1032 : d_48; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1162 = _T_13 ? _GEN_1033 : d_49; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1163 = _T_13 ? _GEN_1034 : d_50; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1164 = _T_13 ? _GEN_1035 : d_51; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1165 = _T_13 ? _GEN_1036 : d_52; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1166 = _T_13 ? _GEN_1037 : d_53; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1167 = _T_13 ? _GEN_1038 : d_54; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1168 = _T_13 ? _GEN_1039 : d_55; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1169 = _T_13 ? _GEN_1040 : d_56; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1170 = _T_13 ? _GEN_1041 : d_57; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1171 = _T_13 ? _GEN_1042 : d_58; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1172 = _T_13 ? _GEN_1043 : d_59; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1173 = _T_13 ? _GEN_1044 : d_60; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1174 = _T_13 ? _GEN_1045 : d_61; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1175 = _T_13 ? _GEN_1046 : d_62; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1176 = _T_13 ? _GEN_1047 : d_63; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1177 = _T_13 & _T_15; // @[Conditional.scala 39:67 DCache.scala 513:29 DCache.scala 425:21]
  wire [63:0] _GEN_1179 = _T_12 ? _io_axi_waddr_T_1 : 64'h0; // @[Conditional.scala 39:67 DCache.scala 506:29 DCache.scala 422:21]
  wire [511:0] _GEN_1180 = _T_12 ? fence_buffer : 512'h0; // @[Conditional.scala 39:67 DCache.scala 507:29 DCache.scala 423:21]
  wire [5:0] _GEN_1181 = _T_12 ? fence_reg : _GEN_1048; // @[Conditional.scala 39:67 DCache.scala 350:28]
  wire  _GEN_1182 = _T_12 ? v_0 : _GEN_1049; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1183 = _T_12 ? v_1 : _GEN_1050; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1184 = _T_12 ? v_2 : _GEN_1051; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1185 = _T_12 ? v_3 : _GEN_1052; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1186 = _T_12 ? v_4 : _GEN_1053; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1187 = _T_12 ? v_5 : _GEN_1054; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1188 = _T_12 ? v_6 : _GEN_1055; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1189 = _T_12 ? v_7 : _GEN_1056; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1190 = _T_12 ? v_8 : _GEN_1057; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1191 = _T_12 ? v_9 : _GEN_1058; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1192 = _T_12 ? v_10 : _GEN_1059; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1193 = _T_12 ? v_11 : _GEN_1060; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1194 = _T_12 ? v_12 : _GEN_1061; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1195 = _T_12 ? v_13 : _GEN_1062; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1196 = _T_12 ? v_14 : _GEN_1063; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1197 = _T_12 ? v_15 : _GEN_1064; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1198 = _T_12 ? v_16 : _GEN_1065; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1199 = _T_12 ? v_17 : _GEN_1066; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1200 = _T_12 ? v_18 : _GEN_1067; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1201 = _T_12 ? v_19 : _GEN_1068; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1202 = _T_12 ? v_20 : _GEN_1069; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1203 = _T_12 ? v_21 : _GEN_1070; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1204 = _T_12 ? v_22 : _GEN_1071; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1205 = _T_12 ? v_23 : _GEN_1072; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1206 = _T_12 ? v_24 : _GEN_1073; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1207 = _T_12 ? v_25 : _GEN_1074; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1208 = _T_12 ? v_26 : _GEN_1075; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1209 = _T_12 ? v_27 : _GEN_1076; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1210 = _T_12 ? v_28 : _GEN_1077; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1211 = _T_12 ? v_29 : _GEN_1078; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1212 = _T_12 ? v_30 : _GEN_1079; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1213 = _T_12 ? v_31 : _GEN_1080; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1214 = _T_12 ? v_32 : _GEN_1081; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1215 = _T_12 ? v_33 : _GEN_1082; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1216 = _T_12 ? v_34 : _GEN_1083; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1217 = _T_12 ? v_35 : _GEN_1084; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1218 = _T_12 ? v_36 : _GEN_1085; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1219 = _T_12 ? v_37 : _GEN_1086; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1220 = _T_12 ? v_38 : _GEN_1087; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1221 = _T_12 ? v_39 : _GEN_1088; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1222 = _T_12 ? v_40 : _GEN_1089; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1223 = _T_12 ? v_41 : _GEN_1090; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1224 = _T_12 ? v_42 : _GEN_1091; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1225 = _T_12 ? v_43 : _GEN_1092; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1226 = _T_12 ? v_44 : _GEN_1093; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1227 = _T_12 ? v_45 : _GEN_1094; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1228 = _T_12 ? v_46 : _GEN_1095; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1229 = _T_12 ? v_47 : _GEN_1096; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1230 = _T_12 ? v_48 : _GEN_1097; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1231 = _T_12 ? v_49 : _GEN_1098; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1232 = _T_12 ? v_50 : _GEN_1099; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1233 = _T_12 ? v_51 : _GEN_1100; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1234 = _T_12 ? v_52 : _GEN_1101; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1235 = _T_12 ? v_53 : _GEN_1102; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1236 = _T_12 ? v_54 : _GEN_1103; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1237 = _T_12 ? v_55 : _GEN_1104; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1238 = _T_12 ? v_56 : _GEN_1105; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1239 = _T_12 ? v_57 : _GEN_1106; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1240 = _T_12 ? v_58 : _GEN_1107; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1241 = _T_12 ? v_59 : _GEN_1108; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1242 = _T_12 ? v_60 : _GEN_1109; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1243 = _T_12 ? v_61 : _GEN_1110; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1244 = _T_12 ? v_62 : _GEN_1111; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1245 = _T_12 ? v_63 : _GEN_1112; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1246 = _T_12 ? d_0 : _GEN_1113; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1247 = _T_12 ? d_1 : _GEN_1114; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1248 = _T_12 ? d_2 : _GEN_1115; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1249 = _T_12 ? d_3 : _GEN_1116; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1250 = _T_12 ? d_4 : _GEN_1117; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1251 = _T_12 ? d_5 : _GEN_1118; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1252 = _T_12 ? d_6 : _GEN_1119; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1253 = _T_12 ? d_7 : _GEN_1120; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1254 = _T_12 ? d_8 : _GEN_1121; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1255 = _T_12 ? d_9 : _GEN_1122; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1256 = _T_12 ? d_10 : _GEN_1123; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1257 = _T_12 ? d_11 : _GEN_1124; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1258 = _T_12 ? d_12 : _GEN_1125; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1259 = _T_12 ? d_13 : _GEN_1126; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1260 = _T_12 ? d_14 : _GEN_1127; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1261 = _T_12 ? d_15 : _GEN_1128; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1262 = _T_12 ? d_16 : _GEN_1129; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1263 = _T_12 ? d_17 : _GEN_1130; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1264 = _T_12 ? d_18 : _GEN_1131; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1265 = _T_12 ? d_19 : _GEN_1132; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1266 = _T_12 ? d_20 : _GEN_1133; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1267 = _T_12 ? d_21 : _GEN_1134; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1268 = _T_12 ? d_22 : _GEN_1135; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1269 = _T_12 ? d_23 : _GEN_1136; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1270 = _T_12 ? d_24 : _GEN_1137; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1271 = _T_12 ? d_25 : _GEN_1138; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1272 = _T_12 ? d_26 : _GEN_1139; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1273 = _T_12 ? d_27 : _GEN_1140; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1274 = _T_12 ? d_28 : _GEN_1141; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1275 = _T_12 ? d_29 : _GEN_1142; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1276 = _T_12 ? d_30 : _GEN_1143; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1277 = _T_12 ? d_31 : _GEN_1144; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1278 = _T_12 ? d_32 : _GEN_1145; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1279 = _T_12 ? d_33 : _GEN_1146; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1280 = _T_12 ? d_34 : _GEN_1147; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1281 = _T_12 ? d_35 : _GEN_1148; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1282 = _T_12 ? d_36 : _GEN_1149; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1283 = _T_12 ? d_37 : _GEN_1150; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1284 = _T_12 ? d_38 : _GEN_1151; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1285 = _T_12 ? d_39 : _GEN_1152; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1286 = _T_12 ? d_40 : _GEN_1153; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1287 = _T_12 ? d_41 : _GEN_1154; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1288 = _T_12 ? d_42 : _GEN_1155; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1289 = _T_12 ? d_43 : _GEN_1156; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1290 = _T_12 ? d_44 : _GEN_1157; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1291 = _T_12 ? d_45 : _GEN_1158; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1292 = _T_12 ? d_46 : _GEN_1159; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1293 = _T_12 ? d_47 : _GEN_1160; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1294 = _T_12 ? d_48 : _GEN_1161; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1295 = _T_12 ? d_49 : _GEN_1162; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1296 = _T_12 ? d_50 : _GEN_1163; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1297 = _T_12 ? d_51 : _GEN_1164; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1298 = _T_12 ? d_52 : _GEN_1165; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1299 = _T_12 ? d_53 : _GEN_1166; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1300 = _T_12 ? d_54 : _GEN_1167; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1301 = _T_12 ? d_55 : _GEN_1168; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1302 = _T_12 ? d_56 : _GEN_1169; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1303 = _T_12 ? d_57 : _GEN_1170; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1304 = _T_12 ? d_58 : _GEN_1171; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1305 = _T_12 ? d_59 : _GEN_1172; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1306 = _T_12 ? d_60 : _GEN_1173; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1307 = _T_12 ? d_61 : _GEN_1174; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1308 = _T_12 ? d_62 : _GEN_1175; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1309 = _T_12 ? d_63 : _GEN_1176; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1310 = _T_12 ? 1'h0 : _GEN_1177; // @[Conditional.scala 39:67 DCache.scala 425:21]
  wire [511:0] _GEN_1311 = _T_11 ? SRam_4k_io_rdata : fence_buffer; // @[Conditional.scala 39:67 DCache.scala 502:29 DCache.scala 436:31]
  wire  _GEN_1312 = _T_11 ? 1'h0 : _T_12; // @[Conditional.scala 39:67 DCache.scala 421:21]
  wire [63:0] _GEN_1313 = _T_11 ? 64'h0 : _GEN_1179; // @[Conditional.scala 39:67 DCache.scala 422:21]
  wire [511:0] _GEN_1314 = _T_11 ? 512'h0 : _GEN_1180; // @[Conditional.scala 39:67 DCache.scala 423:21]
  wire [5:0] _GEN_1315 = _T_11 ? fence_reg : _GEN_1181; // @[Conditional.scala 39:67 DCache.scala 350:28]
  wire  _GEN_1316 = _T_11 ? v_0 : _GEN_1182; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1317 = _T_11 ? v_1 : _GEN_1183; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1318 = _T_11 ? v_2 : _GEN_1184; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1319 = _T_11 ? v_3 : _GEN_1185; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1320 = _T_11 ? v_4 : _GEN_1186; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1321 = _T_11 ? v_5 : _GEN_1187; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1322 = _T_11 ? v_6 : _GEN_1188; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1323 = _T_11 ? v_7 : _GEN_1189; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1324 = _T_11 ? v_8 : _GEN_1190; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1325 = _T_11 ? v_9 : _GEN_1191; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1326 = _T_11 ? v_10 : _GEN_1192; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1327 = _T_11 ? v_11 : _GEN_1193; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1328 = _T_11 ? v_12 : _GEN_1194; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1329 = _T_11 ? v_13 : _GEN_1195; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1330 = _T_11 ? v_14 : _GEN_1196; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1331 = _T_11 ? v_15 : _GEN_1197; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1332 = _T_11 ? v_16 : _GEN_1198; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1333 = _T_11 ? v_17 : _GEN_1199; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1334 = _T_11 ? v_18 : _GEN_1200; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1335 = _T_11 ? v_19 : _GEN_1201; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1336 = _T_11 ? v_20 : _GEN_1202; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1337 = _T_11 ? v_21 : _GEN_1203; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1338 = _T_11 ? v_22 : _GEN_1204; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1339 = _T_11 ? v_23 : _GEN_1205; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1340 = _T_11 ? v_24 : _GEN_1206; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1341 = _T_11 ? v_25 : _GEN_1207; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1342 = _T_11 ? v_26 : _GEN_1208; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1343 = _T_11 ? v_27 : _GEN_1209; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1344 = _T_11 ? v_28 : _GEN_1210; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1345 = _T_11 ? v_29 : _GEN_1211; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1346 = _T_11 ? v_30 : _GEN_1212; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1347 = _T_11 ? v_31 : _GEN_1213; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1348 = _T_11 ? v_32 : _GEN_1214; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1349 = _T_11 ? v_33 : _GEN_1215; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1350 = _T_11 ? v_34 : _GEN_1216; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1351 = _T_11 ? v_35 : _GEN_1217; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1352 = _T_11 ? v_36 : _GEN_1218; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1353 = _T_11 ? v_37 : _GEN_1219; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1354 = _T_11 ? v_38 : _GEN_1220; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1355 = _T_11 ? v_39 : _GEN_1221; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1356 = _T_11 ? v_40 : _GEN_1222; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1357 = _T_11 ? v_41 : _GEN_1223; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1358 = _T_11 ? v_42 : _GEN_1224; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1359 = _T_11 ? v_43 : _GEN_1225; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1360 = _T_11 ? v_44 : _GEN_1226; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1361 = _T_11 ? v_45 : _GEN_1227; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1362 = _T_11 ? v_46 : _GEN_1228; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1363 = _T_11 ? v_47 : _GEN_1229; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1364 = _T_11 ? v_48 : _GEN_1230; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1365 = _T_11 ? v_49 : _GEN_1231; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1366 = _T_11 ? v_50 : _GEN_1232; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1367 = _T_11 ? v_51 : _GEN_1233; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1368 = _T_11 ? v_52 : _GEN_1234; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1369 = _T_11 ? v_53 : _GEN_1235; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1370 = _T_11 ? v_54 : _GEN_1236; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1371 = _T_11 ? v_55 : _GEN_1237; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1372 = _T_11 ? v_56 : _GEN_1238; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1373 = _T_11 ? v_57 : _GEN_1239; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1374 = _T_11 ? v_58 : _GEN_1240; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1375 = _T_11 ? v_59 : _GEN_1241; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1376 = _T_11 ? v_60 : _GEN_1242; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1377 = _T_11 ? v_61 : _GEN_1243; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1378 = _T_11 ? v_62 : _GEN_1244; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1379 = _T_11 ? v_63 : _GEN_1245; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1380 = _T_11 ? d_0 : _GEN_1246; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1381 = _T_11 ? d_1 : _GEN_1247; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1382 = _T_11 ? d_2 : _GEN_1248; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1383 = _T_11 ? d_3 : _GEN_1249; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1384 = _T_11 ? d_4 : _GEN_1250; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1385 = _T_11 ? d_5 : _GEN_1251; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1386 = _T_11 ? d_6 : _GEN_1252; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1387 = _T_11 ? d_7 : _GEN_1253; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1388 = _T_11 ? d_8 : _GEN_1254; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1389 = _T_11 ? d_9 : _GEN_1255; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1390 = _T_11 ? d_10 : _GEN_1256; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1391 = _T_11 ? d_11 : _GEN_1257; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1392 = _T_11 ? d_12 : _GEN_1258; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1393 = _T_11 ? d_13 : _GEN_1259; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1394 = _T_11 ? d_14 : _GEN_1260; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1395 = _T_11 ? d_15 : _GEN_1261; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1396 = _T_11 ? d_16 : _GEN_1262; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1397 = _T_11 ? d_17 : _GEN_1263; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1398 = _T_11 ? d_18 : _GEN_1264; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1399 = _T_11 ? d_19 : _GEN_1265; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1400 = _T_11 ? d_20 : _GEN_1266; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1401 = _T_11 ? d_21 : _GEN_1267; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1402 = _T_11 ? d_22 : _GEN_1268; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1403 = _T_11 ? d_23 : _GEN_1269; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1404 = _T_11 ? d_24 : _GEN_1270; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1405 = _T_11 ? d_25 : _GEN_1271; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1406 = _T_11 ? d_26 : _GEN_1272; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1407 = _T_11 ? d_27 : _GEN_1273; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1408 = _T_11 ? d_28 : _GEN_1274; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1409 = _T_11 ? d_29 : _GEN_1275; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1410 = _T_11 ? d_30 : _GEN_1276; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1411 = _T_11 ? d_31 : _GEN_1277; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1412 = _T_11 ? d_32 : _GEN_1278; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1413 = _T_11 ? d_33 : _GEN_1279; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1414 = _T_11 ? d_34 : _GEN_1280; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1415 = _T_11 ? d_35 : _GEN_1281; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1416 = _T_11 ? d_36 : _GEN_1282; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1417 = _T_11 ? d_37 : _GEN_1283; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1418 = _T_11 ? d_38 : _GEN_1284; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1419 = _T_11 ? d_39 : _GEN_1285; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1420 = _T_11 ? d_40 : _GEN_1286; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1421 = _T_11 ? d_41 : _GEN_1287; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1422 = _T_11 ? d_42 : _GEN_1288; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1423 = _T_11 ? d_43 : _GEN_1289; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1424 = _T_11 ? d_44 : _GEN_1290; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1425 = _T_11 ? d_45 : _GEN_1291; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1426 = _T_11 ? d_46 : _GEN_1292; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1427 = _T_11 ? d_47 : _GEN_1293; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1428 = _T_11 ? d_48 : _GEN_1294; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1429 = _T_11 ? d_49 : _GEN_1295; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1430 = _T_11 ? d_50 : _GEN_1296; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1431 = _T_11 ? d_51 : _GEN_1297; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1432 = _T_11 ? d_52 : _GEN_1298; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1433 = _T_11 ? d_53 : _GEN_1299; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1434 = _T_11 ? d_54 : _GEN_1300; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1435 = _T_11 ? d_55 : _GEN_1301; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1436 = _T_11 ? d_56 : _GEN_1302; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1437 = _T_11 ? d_57 : _GEN_1303; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1438 = _T_11 ? d_58 : _GEN_1304; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1439 = _T_11 ? d_59 : _GEN_1305; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1440 = _T_11 ? d_60 : _GEN_1306; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1441 = _T_11 ? d_61 : _GEN_1307; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1442 = _T_11 ? d_62 : _GEN_1308; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1443 = _T_11 ? d_63 : _GEN_1309; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1444 = _T_11 ? 1'h0 : _GEN_1310; // @[Conditional.scala 39:67 DCache.scala 425:21]
  wire [5:0] _GEN_1445 = _T_9 ? fence_reg : 6'h0; // @[Conditional.scala 39:67 DCache.scala 498:29 DCache.scala 427:21]
  wire [511:0] _GEN_1447 = _T_9 ? fence_buffer : _GEN_1311; // @[Conditional.scala 39:67 DCache.scala 436:31]
  wire  _GEN_1448 = _T_9 ? 1'h0 : _GEN_1312; // @[Conditional.scala 39:67 DCache.scala 421:21]
  wire [63:0] _GEN_1449 = _T_9 ? 64'h0 : _GEN_1313; // @[Conditional.scala 39:67 DCache.scala 422:21]
  wire [511:0] _GEN_1450 = _T_9 ? 512'h0 : _GEN_1314; // @[Conditional.scala 39:67 DCache.scala 423:21]
  wire [5:0] _GEN_1451 = _T_9 ? fence_reg : _GEN_1315; // @[Conditional.scala 39:67 DCache.scala 350:28]
  wire  _GEN_1452 = _T_9 ? v_0 : _GEN_1316; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1453 = _T_9 ? v_1 : _GEN_1317; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1454 = _T_9 ? v_2 : _GEN_1318; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1455 = _T_9 ? v_3 : _GEN_1319; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1456 = _T_9 ? v_4 : _GEN_1320; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1457 = _T_9 ? v_5 : _GEN_1321; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1458 = _T_9 ? v_6 : _GEN_1322; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1459 = _T_9 ? v_7 : _GEN_1323; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1460 = _T_9 ? v_8 : _GEN_1324; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1461 = _T_9 ? v_9 : _GEN_1325; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1462 = _T_9 ? v_10 : _GEN_1326; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1463 = _T_9 ? v_11 : _GEN_1327; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1464 = _T_9 ? v_12 : _GEN_1328; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1465 = _T_9 ? v_13 : _GEN_1329; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1466 = _T_9 ? v_14 : _GEN_1330; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1467 = _T_9 ? v_15 : _GEN_1331; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1468 = _T_9 ? v_16 : _GEN_1332; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1469 = _T_9 ? v_17 : _GEN_1333; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1470 = _T_9 ? v_18 : _GEN_1334; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1471 = _T_9 ? v_19 : _GEN_1335; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1472 = _T_9 ? v_20 : _GEN_1336; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1473 = _T_9 ? v_21 : _GEN_1337; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1474 = _T_9 ? v_22 : _GEN_1338; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1475 = _T_9 ? v_23 : _GEN_1339; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1476 = _T_9 ? v_24 : _GEN_1340; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1477 = _T_9 ? v_25 : _GEN_1341; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1478 = _T_9 ? v_26 : _GEN_1342; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1479 = _T_9 ? v_27 : _GEN_1343; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1480 = _T_9 ? v_28 : _GEN_1344; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1481 = _T_9 ? v_29 : _GEN_1345; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1482 = _T_9 ? v_30 : _GEN_1346; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1483 = _T_9 ? v_31 : _GEN_1347; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1484 = _T_9 ? v_32 : _GEN_1348; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1485 = _T_9 ? v_33 : _GEN_1349; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1486 = _T_9 ? v_34 : _GEN_1350; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1487 = _T_9 ? v_35 : _GEN_1351; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1488 = _T_9 ? v_36 : _GEN_1352; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1489 = _T_9 ? v_37 : _GEN_1353; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1490 = _T_9 ? v_38 : _GEN_1354; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1491 = _T_9 ? v_39 : _GEN_1355; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1492 = _T_9 ? v_40 : _GEN_1356; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1493 = _T_9 ? v_41 : _GEN_1357; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1494 = _T_9 ? v_42 : _GEN_1358; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1495 = _T_9 ? v_43 : _GEN_1359; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1496 = _T_9 ? v_44 : _GEN_1360; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1497 = _T_9 ? v_45 : _GEN_1361; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1498 = _T_9 ? v_46 : _GEN_1362; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1499 = _T_9 ? v_47 : _GEN_1363; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1500 = _T_9 ? v_48 : _GEN_1364; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1501 = _T_9 ? v_49 : _GEN_1365; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1502 = _T_9 ? v_50 : _GEN_1366; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1503 = _T_9 ? v_51 : _GEN_1367; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1504 = _T_9 ? v_52 : _GEN_1368; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1505 = _T_9 ? v_53 : _GEN_1369; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1506 = _T_9 ? v_54 : _GEN_1370; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1507 = _T_9 ? v_55 : _GEN_1371; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1508 = _T_9 ? v_56 : _GEN_1372; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1509 = _T_9 ? v_57 : _GEN_1373; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1510 = _T_9 ? v_58 : _GEN_1374; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1511 = _T_9 ? v_59 : _GEN_1375; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1512 = _T_9 ? v_60 : _GEN_1376; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1513 = _T_9 ? v_61 : _GEN_1377; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1514 = _T_9 ? v_62 : _GEN_1378; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1515 = _T_9 ? v_63 : _GEN_1379; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1516 = _T_9 ? d_0 : _GEN_1380; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1517 = _T_9 ? d_1 : _GEN_1381; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1518 = _T_9 ? d_2 : _GEN_1382; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1519 = _T_9 ? d_3 : _GEN_1383; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1520 = _T_9 ? d_4 : _GEN_1384; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1521 = _T_9 ? d_5 : _GEN_1385; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1522 = _T_9 ? d_6 : _GEN_1386; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1523 = _T_9 ? d_7 : _GEN_1387; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1524 = _T_9 ? d_8 : _GEN_1388; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1525 = _T_9 ? d_9 : _GEN_1389; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1526 = _T_9 ? d_10 : _GEN_1390; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1527 = _T_9 ? d_11 : _GEN_1391; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1528 = _T_9 ? d_12 : _GEN_1392; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1529 = _T_9 ? d_13 : _GEN_1393; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1530 = _T_9 ? d_14 : _GEN_1394; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1531 = _T_9 ? d_15 : _GEN_1395; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1532 = _T_9 ? d_16 : _GEN_1396; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1533 = _T_9 ? d_17 : _GEN_1397; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1534 = _T_9 ? d_18 : _GEN_1398; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1535 = _T_9 ? d_19 : _GEN_1399; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1536 = _T_9 ? d_20 : _GEN_1400; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1537 = _T_9 ? d_21 : _GEN_1401; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1538 = _T_9 ? d_22 : _GEN_1402; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1539 = _T_9 ? d_23 : _GEN_1403; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1540 = _T_9 ? d_24 : _GEN_1404; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1541 = _T_9 ? d_25 : _GEN_1405; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1542 = _T_9 ? d_26 : _GEN_1406; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1543 = _T_9 ? d_27 : _GEN_1407; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1544 = _T_9 ? d_28 : _GEN_1408; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1545 = _T_9 ? d_29 : _GEN_1409; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1546 = _T_9 ? d_30 : _GEN_1410; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1547 = _T_9 ? d_31 : _GEN_1411; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1548 = _T_9 ? d_32 : _GEN_1412; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1549 = _T_9 ? d_33 : _GEN_1413; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1550 = _T_9 ? d_34 : _GEN_1414; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1551 = _T_9 ? d_35 : _GEN_1415; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1552 = _T_9 ? d_36 : _GEN_1416; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1553 = _T_9 ? d_37 : _GEN_1417; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1554 = _T_9 ? d_38 : _GEN_1418; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1555 = _T_9 ? d_39 : _GEN_1419; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1556 = _T_9 ? d_40 : _GEN_1420; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1557 = _T_9 ? d_41 : _GEN_1421; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1558 = _T_9 ? d_42 : _GEN_1422; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1559 = _T_9 ? d_43 : _GEN_1423; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1560 = _T_9 ? d_44 : _GEN_1424; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1561 = _T_9 ? d_45 : _GEN_1425; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1562 = _T_9 ? d_46 : _GEN_1426; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1563 = _T_9 ? d_47 : _GEN_1427; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1564 = _T_9 ? d_48 : _GEN_1428; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1565 = _T_9 ? d_49 : _GEN_1429; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1566 = _T_9 ? d_50 : _GEN_1430; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1567 = _T_9 ? d_51 : _GEN_1431; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1568 = _T_9 ? d_52 : _GEN_1432; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1569 = _T_9 ? d_53 : _GEN_1433; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1570 = _T_9 ? d_54 : _GEN_1434; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1571 = _T_9 ? d_55 : _GEN_1435; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1572 = _T_9 ? d_56 : _GEN_1436; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1573 = _T_9 ? d_57 : _GEN_1437; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1574 = _T_9 ? d_58 : _GEN_1438; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1575 = _T_9 ? d_59 : _GEN_1439; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1576 = _T_9 ? d_60 : _GEN_1440; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1577 = _T_9 ? d_61 : _GEN_1441; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1578 = _T_9 ? d_62 : _GEN_1442; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1579 = _T_9 ? d_63 : _GEN_1443; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1580 = _T_9 ? 1'h0 : _GEN_1444; // @[Conditional.scala 39:67 DCache.scala 425:21]
  wire [5:0] _GEN_1581 = _T_8 ? 6'h0 : _GEN_1451; // @[Conditional.scala 39:67 DCache.scala 495:23]
  wire [5:0] _GEN_1582 = _T_8 ? 6'h0 : _GEN_1445; // @[Conditional.scala 39:67 DCache.scala 427:21]
  wire  _GEN_1583 = _T_8 ? 1'h0 : _T_9; // @[Conditional.scala 39:67 DCache.scala 428:21]
  wire [511:0] _GEN_1584 = _T_8 ? fence_buffer : _GEN_1447; // @[Conditional.scala 39:67 DCache.scala 436:31]
  wire  _GEN_1585 = _T_8 ? 1'h0 : _GEN_1448; // @[Conditional.scala 39:67 DCache.scala 421:21]
  wire [63:0] _GEN_1586 = _T_8 ? 64'h0 : _GEN_1449; // @[Conditional.scala 39:67 DCache.scala 422:21]
  wire [511:0] _GEN_1587 = _T_8 ? 512'h0 : _GEN_1450; // @[Conditional.scala 39:67 DCache.scala 423:21]
  wire  _GEN_1588 = _T_8 ? v_0 : _GEN_1452; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1589 = _T_8 ? v_1 : _GEN_1453; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1590 = _T_8 ? v_2 : _GEN_1454; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1591 = _T_8 ? v_3 : _GEN_1455; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1592 = _T_8 ? v_4 : _GEN_1456; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1593 = _T_8 ? v_5 : _GEN_1457; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1594 = _T_8 ? v_6 : _GEN_1458; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1595 = _T_8 ? v_7 : _GEN_1459; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1596 = _T_8 ? v_8 : _GEN_1460; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1597 = _T_8 ? v_9 : _GEN_1461; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1598 = _T_8 ? v_10 : _GEN_1462; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1599 = _T_8 ? v_11 : _GEN_1463; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1600 = _T_8 ? v_12 : _GEN_1464; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1601 = _T_8 ? v_13 : _GEN_1465; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1602 = _T_8 ? v_14 : _GEN_1466; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1603 = _T_8 ? v_15 : _GEN_1467; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1604 = _T_8 ? v_16 : _GEN_1468; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1605 = _T_8 ? v_17 : _GEN_1469; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1606 = _T_8 ? v_18 : _GEN_1470; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1607 = _T_8 ? v_19 : _GEN_1471; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1608 = _T_8 ? v_20 : _GEN_1472; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1609 = _T_8 ? v_21 : _GEN_1473; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1610 = _T_8 ? v_22 : _GEN_1474; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1611 = _T_8 ? v_23 : _GEN_1475; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1612 = _T_8 ? v_24 : _GEN_1476; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1613 = _T_8 ? v_25 : _GEN_1477; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1614 = _T_8 ? v_26 : _GEN_1478; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1615 = _T_8 ? v_27 : _GEN_1479; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1616 = _T_8 ? v_28 : _GEN_1480; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1617 = _T_8 ? v_29 : _GEN_1481; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1618 = _T_8 ? v_30 : _GEN_1482; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1619 = _T_8 ? v_31 : _GEN_1483; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1620 = _T_8 ? v_32 : _GEN_1484; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1621 = _T_8 ? v_33 : _GEN_1485; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1622 = _T_8 ? v_34 : _GEN_1486; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1623 = _T_8 ? v_35 : _GEN_1487; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1624 = _T_8 ? v_36 : _GEN_1488; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1625 = _T_8 ? v_37 : _GEN_1489; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1626 = _T_8 ? v_38 : _GEN_1490; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1627 = _T_8 ? v_39 : _GEN_1491; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1628 = _T_8 ? v_40 : _GEN_1492; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1629 = _T_8 ? v_41 : _GEN_1493; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1630 = _T_8 ? v_42 : _GEN_1494; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1631 = _T_8 ? v_43 : _GEN_1495; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1632 = _T_8 ? v_44 : _GEN_1496; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1633 = _T_8 ? v_45 : _GEN_1497; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1634 = _T_8 ? v_46 : _GEN_1498; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1635 = _T_8 ? v_47 : _GEN_1499; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1636 = _T_8 ? v_48 : _GEN_1500; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1637 = _T_8 ? v_49 : _GEN_1501; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1638 = _T_8 ? v_50 : _GEN_1502; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1639 = _T_8 ? v_51 : _GEN_1503; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1640 = _T_8 ? v_52 : _GEN_1504; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1641 = _T_8 ? v_53 : _GEN_1505; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1642 = _T_8 ? v_54 : _GEN_1506; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1643 = _T_8 ? v_55 : _GEN_1507; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1644 = _T_8 ? v_56 : _GEN_1508; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1645 = _T_8 ? v_57 : _GEN_1509; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1646 = _T_8 ? v_58 : _GEN_1510; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1647 = _T_8 ? v_59 : _GEN_1511; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1648 = _T_8 ? v_60 : _GEN_1512; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1649 = _T_8 ? v_61 : _GEN_1513; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1650 = _T_8 ? v_62 : _GEN_1514; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1651 = _T_8 ? v_63 : _GEN_1515; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1652 = _T_8 ? d_0 : _GEN_1516; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1653 = _T_8 ? d_1 : _GEN_1517; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1654 = _T_8 ? d_2 : _GEN_1518; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1655 = _T_8 ? d_3 : _GEN_1519; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1656 = _T_8 ? d_4 : _GEN_1520; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1657 = _T_8 ? d_5 : _GEN_1521; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1658 = _T_8 ? d_6 : _GEN_1522; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1659 = _T_8 ? d_7 : _GEN_1523; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1660 = _T_8 ? d_8 : _GEN_1524; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1661 = _T_8 ? d_9 : _GEN_1525; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1662 = _T_8 ? d_10 : _GEN_1526; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1663 = _T_8 ? d_11 : _GEN_1527; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1664 = _T_8 ? d_12 : _GEN_1528; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1665 = _T_8 ? d_13 : _GEN_1529; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1666 = _T_8 ? d_14 : _GEN_1530; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1667 = _T_8 ? d_15 : _GEN_1531; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1668 = _T_8 ? d_16 : _GEN_1532; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1669 = _T_8 ? d_17 : _GEN_1533; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1670 = _T_8 ? d_18 : _GEN_1534; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1671 = _T_8 ? d_19 : _GEN_1535; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1672 = _T_8 ? d_20 : _GEN_1536; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1673 = _T_8 ? d_21 : _GEN_1537; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1674 = _T_8 ? d_22 : _GEN_1538; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1675 = _T_8 ? d_23 : _GEN_1539; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1676 = _T_8 ? d_24 : _GEN_1540; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1677 = _T_8 ? d_25 : _GEN_1541; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1678 = _T_8 ? d_26 : _GEN_1542; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1679 = _T_8 ? d_27 : _GEN_1543; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1680 = _T_8 ? d_28 : _GEN_1544; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1681 = _T_8 ? d_29 : _GEN_1545; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1682 = _T_8 ? d_30 : _GEN_1546; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1683 = _T_8 ? d_31 : _GEN_1547; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1684 = _T_8 ? d_32 : _GEN_1548; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1685 = _T_8 ? d_33 : _GEN_1549; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1686 = _T_8 ? d_34 : _GEN_1550; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1687 = _T_8 ? d_35 : _GEN_1551; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1688 = _T_8 ? d_36 : _GEN_1552; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1689 = _T_8 ? d_37 : _GEN_1553; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1690 = _T_8 ? d_38 : _GEN_1554; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1691 = _T_8 ? d_39 : _GEN_1555; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1692 = _T_8 ? d_40 : _GEN_1556; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1693 = _T_8 ? d_41 : _GEN_1557; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1694 = _T_8 ? d_42 : _GEN_1558; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1695 = _T_8 ? d_43 : _GEN_1559; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1696 = _T_8 ? d_44 : _GEN_1560; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1697 = _T_8 ? d_45 : _GEN_1561; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1698 = _T_8 ? d_46 : _GEN_1562; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1699 = _T_8 ? d_47 : _GEN_1563; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1700 = _T_8 ? d_48 : _GEN_1564; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1701 = _T_8 ? d_49 : _GEN_1565; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1702 = _T_8 ? d_50 : _GEN_1566; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1703 = _T_8 ? d_51 : _GEN_1567; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1704 = _T_8 ? d_52 : _GEN_1568; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1705 = _T_8 ? d_53 : _GEN_1569; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1706 = _T_8 ? d_54 : _GEN_1570; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1707 = _T_8 ? d_55 : _GEN_1571; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1708 = _T_8 ? d_56 : _GEN_1572; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1709 = _T_8 ? d_57 : _GEN_1573; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1710 = _T_8 ? d_58 : _GEN_1574; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1711 = _T_8 ? d_59 : _GEN_1575; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1712 = _T_8 ? d_60 : _GEN_1576; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1713 = _T_8 ? d_61 : _GEN_1577; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1714 = _T_8 ? d_62 : _GEN_1578; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1715 = _T_8 ? d_63 : _GEN_1579; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_1716 = _T_8 ? 1'h0 : _GEN_1580; // @[Conditional.scala 39:67 DCache.scala 425:21]
  wire [5:0] _GEN_1717 = _T_7 ? index_addr_stay : _GEN_1582; // @[Conditional.scala 39:67 DCache.scala 485:29]
  wire  _GEN_1718 = _T_7 | _GEN_1583; // @[Conditional.scala 39:67 DCache.scala 486:29]
  wire  _GEN_1719 = _T_7 & op_stay; // @[Conditional.scala 39:67 DCache.scala 487:29 DCache.scala 429:21]
  wire [574:0] _GEN_1720 = _T_7 ? _T_48 : 575'h0; // @[Conditional.scala 39:67 DCache.scala 488:29 DCache.scala 430:21]
  wire [574:0] _GEN_1721 = _T_7 ? _T_67 : 575'h0; // @[Conditional.scala 39:67 DCache.scala 489:29 DCache.scala 431:21]
  wire  _GEN_1722 = _T_7 ? _GEN_792 : _GEN_1652; // @[Conditional.scala 39:67]
  wire  _GEN_1723 = _T_7 ? _GEN_793 : _GEN_1653; // @[Conditional.scala 39:67]
  wire  _GEN_1724 = _T_7 ? _GEN_794 : _GEN_1654; // @[Conditional.scala 39:67]
  wire  _GEN_1725 = _T_7 ? _GEN_795 : _GEN_1655; // @[Conditional.scala 39:67]
  wire  _GEN_1726 = _T_7 ? _GEN_796 : _GEN_1656; // @[Conditional.scala 39:67]
  wire  _GEN_1727 = _T_7 ? _GEN_797 : _GEN_1657; // @[Conditional.scala 39:67]
  wire  _GEN_1728 = _T_7 ? _GEN_798 : _GEN_1658; // @[Conditional.scala 39:67]
  wire  _GEN_1729 = _T_7 ? _GEN_799 : _GEN_1659; // @[Conditional.scala 39:67]
  wire  _GEN_1730 = _T_7 ? _GEN_800 : _GEN_1660; // @[Conditional.scala 39:67]
  wire  _GEN_1731 = _T_7 ? _GEN_801 : _GEN_1661; // @[Conditional.scala 39:67]
  wire  _GEN_1732 = _T_7 ? _GEN_802 : _GEN_1662; // @[Conditional.scala 39:67]
  wire  _GEN_1733 = _T_7 ? _GEN_803 : _GEN_1663; // @[Conditional.scala 39:67]
  wire  _GEN_1734 = _T_7 ? _GEN_804 : _GEN_1664; // @[Conditional.scala 39:67]
  wire  _GEN_1735 = _T_7 ? _GEN_805 : _GEN_1665; // @[Conditional.scala 39:67]
  wire  _GEN_1736 = _T_7 ? _GEN_806 : _GEN_1666; // @[Conditional.scala 39:67]
  wire  _GEN_1737 = _T_7 ? _GEN_807 : _GEN_1667; // @[Conditional.scala 39:67]
  wire  _GEN_1738 = _T_7 ? _GEN_808 : _GEN_1668; // @[Conditional.scala 39:67]
  wire  _GEN_1739 = _T_7 ? _GEN_809 : _GEN_1669; // @[Conditional.scala 39:67]
  wire  _GEN_1740 = _T_7 ? _GEN_810 : _GEN_1670; // @[Conditional.scala 39:67]
  wire  _GEN_1741 = _T_7 ? _GEN_811 : _GEN_1671; // @[Conditional.scala 39:67]
  wire  _GEN_1742 = _T_7 ? _GEN_812 : _GEN_1672; // @[Conditional.scala 39:67]
  wire  _GEN_1743 = _T_7 ? _GEN_813 : _GEN_1673; // @[Conditional.scala 39:67]
  wire  _GEN_1744 = _T_7 ? _GEN_814 : _GEN_1674; // @[Conditional.scala 39:67]
  wire  _GEN_1745 = _T_7 ? _GEN_815 : _GEN_1675; // @[Conditional.scala 39:67]
  wire  _GEN_1746 = _T_7 ? _GEN_816 : _GEN_1676; // @[Conditional.scala 39:67]
  wire  _GEN_1747 = _T_7 ? _GEN_817 : _GEN_1677; // @[Conditional.scala 39:67]
  wire  _GEN_1748 = _T_7 ? _GEN_818 : _GEN_1678; // @[Conditional.scala 39:67]
  wire  _GEN_1749 = _T_7 ? _GEN_819 : _GEN_1679; // @[Conditional.scala 39:67]
  wire  _GEN_1750 = _T_7 ? _GEN_820 : _GEN_1680; // @[Conditional.scala 39:67]
  wire  _GEN_1751 = _T_7 ? _GEN_821 : _GEN_1681; // @[Conditional.scala 39:67]
  wire  _GEN_1752 = _T_7 ? _GEN_822 : _GEN_1682; // @[Conditional.scala 39:67]
  wire  _GEN_1753 = _T_7 ? _GEN_823 : _GEN_1683; // @[Conditional.scala 39:67]
  wire  _GEN_1754 = _T_7 ? _GEN_824 : _GEN_1684; // @[Conditional.scala 39:67]
  wire  _GEN_1755 = _T_7 ? _GEN_825 : _GEN_1685; // @[Conditional.scala 39:67]
  wire  _GEN_1756 = _T_7 ? _GEN_826 : _GEN_1686; // @[Conditional.scala 39:67]
  wire  _GEN_1757 = _T_7 ? _GEN_827 : _GEN_1687; // @[Conditional.scala 39:67]
  wire  _GEN_1758 = _T_7 ? _GEN_828 : _GEN_1688; // @[Conditional.scala 39:67]
  wire  _GEN_1759 = _T_7 ? _GEN_829 : _GEN_1689; // @[Conditional.scala 39:67]
  wire  _GEN_1760 = _T_7 ? _GEN_830 : _GEN_1690; // @[Conditional.scala 39:67]
  wire  _GEN_1761 = _T_7 ? _GEN_831 : _GEN_1691; // @[Conditional.scala 39:67]
  wire  _GEN_1762 = _T_7 ? _GEN_832 : _GEN_1692; // @[Conditional.scala 39:67]
  wire  _GEN_1763 = _T_7 ? _GEN_833 : _GEN_1693; // @[Conditional.scala 39:67]
  wire  _GEN_1764 = _T_7 ? _GEN_834 : _GEN_1694; // @[Conditional.scala 39:67]
  wire  _GEN_1765 = _T_7 ? _GEN_835 : _GEN_1695; // @[Conditional.scala 39:67]
  wire  _GEN_1766 = _T_7 ? _GEN_836 : _GEN_1696; // @[Conditional.scala 39:67]
  wire  _GEN_1767 = _T_7 ? _GEN_837 : _GEN_1697; // @[Conditional.scala 39:67]
  wire  _GEN_1768 = _T_7 ? _GEN_838 : _GEN_1698; // @[Conditional.scala 39:67]
  wire  _GEN_1769 = _T_7 ? _GEN_839 : _GEN_1699; // @[Conditional.scala 39:67]
  wire  _GEN_1770 = _T_7 ? _GEN_840 : _GEN_1700; // @[Conditional.scala 39:67]
  wire  _GEN_1771 = _T_7 ? _GEN_841 : _GEN_1701; // @[Conditional.scala 39:67]
  wire  _GEN_1772 = _T_7 ? _GEN_842 : _GEN_1702; // @[Conditional.scala 39:67]
  wire  _GEN_1773 = _T_7 ? _GEN_843 : _GEN_1703; // @[Conditional.scala 39:67]
  wire  _GEN_1774 = _T_7 ? _GEN_844 : _GEN_1704; // @[Conditional.scala 39:67]
  wire  _GEN_1775 = _T_7 ? _GEN_845 : _GEN_1705; // @[Conditional.scala 39:67]
  wire  _GEN_1776 = _T_7 ? _GEN_846 : _GEN_1706; // @[Conditional.scala 39:67]
  wire  _GEN_1777 = _T_7 ? _GEN_847 : _GEN_1707; // @[Conditional.scala 39:67]
  wire  _GEN_1778 = _T_7 ? _GEN_848 : _GEN_1708; // @[Conditional.scala 39:67]
  wire  _GEN_1779 = _T_7 ? _GEN_849 : _GEN_1709; // @[Conditional.scala 39:67]
  wire  _GEN_1780 = _T_7 ? _GEN_850 : _GEN_1710; // @[Conditional.scala 39:67]
  wire  _GEN_1781 = _T_7 ? _GEN_851 : _GEN_1711; // @[Conditional.scala 39:67]
  wire  _GEN_1782 = _T_7 ? _GEN_852 : _GEN_1712; // @[Conditional.scala 39:67]
  wire  _GEN_1783 = _T_7 ? _GEN_853 : _GEN_1713; // @[Conditional.scala 39:67]
  wire  _GEN_1784 = _T_7 ? _GEN_854 : _GEN_1714; // @[Conditional.scala 39:67]
  wire  _GEN_1785 = _T_7 ? _GEN_855 : _GEN_1715; // @[Conditional.scala 39:67]
  wire [5:0] _GEN_1786 = _T_7 ? fence_reg : _GEN_1581; // @[Conditional.scala 39:67 DCache.scala 350:28]
  wire [511:0] _GEN_1787 = _T_7 ? fence_buffer : _GEN_1584; // @[Conditional.scala 39:67 DCache.scala 436:31]
  wire  _GEN_1788 = _T_7 ? 1'h0 : _GEN_1585; // @[Conditional.scala 39:67 DCache.scala 421:21]
  wire [63:0] _GEN_1789 = _T_7 ? 64'h0 : _GEN_1586; // @[Conditional.scala 39:67 DCache.scala 422:21]
  wire [511:0] _GEN_1790 = _T_7 ? 512'h0 : _GEN_1587; // @[Conditional.scala 39:67 DCache.scala 423:21]
  wire  _GEN_1791 = _T_7 ? v_0 : _GEN_1588; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1792 = _T_7 ? v_1 : _GEN_1589; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1793 = _T_7 ? v_2 : _GEN_1590; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1794 = _T_7 ? v_3 : _GEN_1591; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1795 = _T_7 ? v_4 : _GEN_1592; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1796 = _T_7 ? v_5 : _GEN_1593; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1797 = _T_7 ? v_6 : _GEN_1594; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1798 = _T_7 ? v_7 : _GEN_1595; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1799 = _T_7 ? v_8 : _GEN_1596; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1800 = _T_7 ? v_9 : _GEN_1597; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1801 = _T_7 ? v_10 : _GEN_1598; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1802 = _T_7 ? v_11 : _GEN_1599; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1803 = _T_7 ? v_12 : _GEN_1600; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1804 = _T_7 ? v_13 : _GEN_1601; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1805 = _T_7 ? v_14 : _GEN_1602; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1806 = _T_7 ? v_15 : _GEN_1603; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1807 = _T_7 ? v_16 : _GEN_1604; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1808 = _T_7 ? v_17 : _GEN_1605; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1809 = _T_7 ? v_18 : _GEN_1606; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1810 = _T_7 ? v_19 : _GEN_1607; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1811 = _T_7 ? v_20 : _GEN_1608; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1812 = _T_7 ? v_21 : _GEN_1609; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1813 = _T_7 ? v_22 : _GEN_1610; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1814 = _T_7 ? v_23 : _GEN_1611; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1815 = _T_7 ? v_24 : _GEN_1612; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1816 = _T_7 ? v_25 : _GEN_1613; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1817 = _T_7 ? v_26 : _GEN_1614; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1818 = _T_7 ? v_27 : _GEN_1615; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1819 = _T_7 ? v_28 : _GEN_1616; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1820 = _T_7 ? v_29 : _GEN_1617; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1821 = _T_7 ? v_30 : _GEN_1618; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1822 = _T_7 ? v_31 : _GEN_1619; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1823 = _T_7 ? v_32 : _GEN_1620; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1824 = _T_7 ? v_33 : _GEN_1621; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1825 = _T_7 ? v_34 : _GEN_1622; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1826 = _T_7 ? v_35 : _GEN_1623; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1827 = _T_7 ? v_36 : _GEN_1624; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1828 = _T_7 ? v_37 : _GEN_1625; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1829 = _T_7 ? v_38 : _GEN_1626; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1830 = _T_7 ? v_39 : _GEN_1627; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1831 = _T_7 ? v_40 : _GEN_1628; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1832 = _T_7 ? v_41 : _GEN_1629; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1833 = _T_7 ? v_42 : _GEN_1630; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1834 = _T_7 ? v_43 : _GEN_1631; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1835 = _T_7 ? v_44 : _GEN_1632; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1836 = _T_7 ? v_45 : _GEN_1633; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1837 = _T_7 ? v_46 : _GEN_1634; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1838 = _T_7 ? v_47 : _GEN_1635; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1839 = _T_7 ? v_48 : _GEN_1636; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1840 = _T_7 ? v_49 : _GEN_1637; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1841 = _T_7 ? v_50 : _GEN_1638; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1842 = _T_7 ? v_51 : _GEN_1639; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1843 = _T_7 ? v_52 : _GEN_1640; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1844 = _T_7 ? v_53 : _GEN_1641; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1845 = _T_7 ? v_54 : _GEN_1642; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1846 = _T_7 ? v_55 : _GEN_1643; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1847 = _T_7 ? v_56 : _GEN_1644; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1848 = _T_7 ? v_57 : _GEN_1645; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1849 = _T_7 ? v_58 : _GEN_1646; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1850 = _T_7 ? v_59 : _GEN_1647; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1851 = _T_7 ? v_60 : _GEN_1648; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1852 = _T_7 ? v_61 : _GEN_1649; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1853 = _T_7 ? v_62 : _GEN_1650; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1854 = _T_7 ? v_63 : _GEN_1651; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_1855 = _T_7 ? 1'h0 : _GEN_1716; // @[Conditional.scala 39:67 DCache.scala 425:21]
  wire [5:0] _GEN_1856 = _T_6 ? index_addr_stay : _GEN_1717; // @[Conditional.scala 39:67 DCache.scala 472:29]
  wire  _GEN_1857 = _T_6 | _GEN_1718; // @[Conditional.scala 39:67 DCache.scala 473:29]
  wire  _GEN_1858 = _T_6 | _GEN_1719; // @[Conditional.scala 39:67 DCache.scala 474:29]
  wire [574:0] _GEN_1859 = _T_6 ? {{63'd0}, axi_rbuffer} : _GEN_1720; // @[Conditional.scala 39:67 DCache.scala 475:29]
  wire [574:0] _GEN_1860 = _T_6 ? 575'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
     : _GEN_1721; // @[Conditional.scala 39:67 DCache.scala 476:29]
  wire [51:0] _GEN_1861 = _T_6 ? _GEN_536 : tag_0; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_1862 = _T_6 ? _GEN_537 : tag_1; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_1863 = _T_6 ? _GEN_538 : tag_2; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_1864 = _T_6 ? _GEN_539 : tag_3; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_1865 = _T_6 ? _GEN_540 : tag_4; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_1866 = _T_6 ? _GEN_541 : tag_5; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_1867 = _T_6 ? _GEN_542 : tag_6; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_1868 = _T_6 ? _GEN_543 : tag_7; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_1869 = _T_6 ? _GEN_544 : tag_8; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_1870 = _T_6 ? _GEN_545 : tag_9; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_1871 = _T_6 ? _GEN_546 : tag_10; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_1872 = _T_6 ? _GEN_547 : tag_11; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_1873 = _T_6 ? _GEN_548 : tag_12; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_1874 = _T_6 ? _GEN_549 : tag_13; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_1875 = _T_6 ? _GEN_550 : tag_14; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_1876 = _T_6 ? _GEN_551 : tag_15; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_1877 = _T_6 ? _GEN_552 : tag_16; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_1878 = _T_6 ? _GEN_553 : tag_17; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_1879 = _T_6 ? _GEN_554 : tag_18; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_1880 = _T_6 ? _GEN_555 : tag_19; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_1881 = _T_6 ? _GEN_556 : tag_20; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_1882 = _T_6 ? _GEN_557 : tag_21; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_1883 = _T_6 ? _GEN_558 : tag_22; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_1884 = _T_6 ? _GEN_559 : tag_23; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_1885 = _T_6 ? _GEN_560 : tag_24; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_1886 = _T_6 ? _GEN_561 : tag_25; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_1887 = _T_6 ? _GEN_562 : tag_26; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_1888 = _T_6 ? _GEN_563 : tag_27; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_1889 = _T_6 ? _GEN_564 : tag_28; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_1890 = _T_6 ? _GEN_565 : tag_29; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_1891 = _T_6 ? _GEN_566 : tag_30; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_1892 = _T_6 ? _GEN_567 : tag_31; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_1893 = _T_6 ? _GEN_568 : tag_32; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_1894 = _T_6 ? _GEN_569 : tag_33; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_1895 = _T_6 ? _GEN_570 : tag_34; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_1896 = _T_6 ? _GEN_571 : tag_35; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_1897 = _T_6 ? _GEN_572 : tag_36; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_1898 = _T_6 ? _GEN_573 : tag_37; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_1899 = _T_6 ? _GEN_574 : tag_38; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_1900 = _T_6 ? _GEN_575 : tag_39; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_1901 = _T_6 ? _GEN_576 : tag_40; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_1902 = _T_6 ? _GEN_577 : tag_41; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_1903 = _T_6 ? _GEN_578 : tag_42; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_1904 = _T_6 ? _GEN_579 : tag_43; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_1905 = _T_6 ? _GEN_580 : tag_44; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_1906 = _T_6 ? _GEN_581 : tag_45; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_1907 = _T_6 ? _GEN_582 : tag_46; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_1908 = _T_6 ? _GEN_583 : tag_47; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_1909 = _T_6 ? _GEN_584 : tag_48; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_1910 = _T_6 ? _GEN_585 : tag_49; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_1911 = _T_6 ? _GEN_586 : tag_50; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_1912 = _T_6 ? _GEN_587 : tag_51; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_1913 = _T_6 ? _GEN_588 : tag_52; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_1914 = _T_6 ? _GEN_589 : tag_53; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_1915 = _T_6 ? _GEN_590 : tag_54; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_1916 = _T_6 ? _GEN_591 : tag_55; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_1917 = _T_6 ? _GEN_592 : tag_56; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_1918 = _T_6 ? _GEN_593 : tag_57; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_1919 = _T_6 ? _GEN_594 : tag_58; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_1920 = _T_6 ? _GEN_595 : tag_59; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_1921 = _T_6 ? _GEN_596 : tag_60; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_1922 = _T_6 ? _GEN_597 : tag_61; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_1923 = _T_6 ? _GEN_598 : tag_62; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_1924 = _T_6 ? _GEN_599 : tag_63; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire  _GEN_1925 = _T_6 ? _GEN_600 : _GEN_1791; // @[Conditional.scala 39:67]
  wire  _GEN_1926 = _T_6 ? _GEN_601 : _GEN_1792; // @[Conditional.scala 39:67]
  wire  _GEN_1927 = _T_6 ? _GEN_602 : _GEN_1793; // @[Conditional.scala 39:67]
  wire  _GEN_1928 = _T_6 ? _GEN_603 : _GEN_1794; // @[Conditional.scala 39:67]
  wire  _GEN_1929 = _T_6 ? _GEN_604 : _GEN_1795; // @[Conditional.scala 39:67]
  wire  _GEN_1930 = _T_6 ? _GEN_605 : _GEN_1796; // @[Conditional.scala 39:67]
  wire  _GEN_1931 = _T_6 ? _GEN_606 : _GEN_1797; // @[Conditional.scala 39:67]
  wire  _GEN_1932 = _T_6 ? _GEN_607 : _GEN_1798; // @[Conditional.scala 39:67]
  wire  _GEN_1933 = _T_6 ? _GEN_608 : _GEN_1799; // @[Conditional.scala 39:67]
  wire  _GEN_1934 = _T_6 ? _GEN_609 : _GEN_1800; // @[Conditional.scala 39:67]
  wire  _GEN_1935 = _T_6 ? _GEN_610 : _GEN_1801; // @[Conditional.scala 39:67]
  wire  _GEN_1936 = _T_6 ? _GEN_611 : _GEN_1802; // @[Conditional.scala 39:67]
  wire  _GEN_1937 = _T_6 ? _GEN_612 : _GEN_1803; // @[Conditional.scala 39:67]
  wire  _GEN_1938 = _T_6 ? _GEN_613 : _GEN_1804; // @[Conditional.scala 39:67]
  wire  _GEN_1939 = _T_6 ? _GEN_614 : _GEN_1805; // @[Conditional.scala 39:67]
  wire  _GEN_1940 = _T_6 ? _GEN_615 : _GEN_1806; // @[Conditional.scala 39:67]
  wire  _GEN_1941 = _T_6 ? _GEN_616 : _GEN_1807; // @[Conditional.scala 39:67]
  wire  _GEN_1942 = _T_6 ? _GEN_617 : _GEN_1808; // @[Conditional.scala 39:67]
  wire  _GEN_1943 = _T_6 ? _GEN_618 : _GEN_1809; // @[Conditional.scala 39:67]
  wire  _GEN_1944 = _T_6 ? _GEN_619 : _GEN_1810; // @[Conditional.scala 39:67]
  wire  _GEN_1945 = _T_6 ? _GEN_620 : _GEN_1811; // @[Conditional.scala 39:67]
  wire  _GEN_1946 = _T_6 ? _GEN_621 : _GEN_1812; // @[Conditional.scala 39:67]
  wire  _GEN_1947 = _T_6 ? _GEN_622 : _GEN_1813; // @[Conditional.scala 39:67]
  wire  _GEN_1948 = _T_6 ? _GEN_623 : _GEN_1814; // @[Conditional.scala 39:67]
  wire  _GEN_1949 = _T_6 ? _GEN_624 : _GEN_1815; // @[Conditional.scala 39:67]
  wire  _GEN_1950 = _T_6 ? _GEN_625 : _GEN_1816; // @[Conditional.scala 39:67]
  wire  _GEN_1951 = _T_6 ? _GEN_626 : _GEN_1817; // @[Conditional.scala 39:67]
  wire  _GEN_1952 = _T_6 ? _GEN_627 : _GEN_1818; // @[Conditional.scala 39:67]
  wire  _GEN_1953 = _T_6 ? _GEN_628 : _GEN_1819; // @[Conditional.scala 39:67]
  wire  _GEN_1954 = _T_6 ? _GEN_629 : _GEN_1820; // @[Conditional.scala 39:67]
  wire  _GEN_1955 = _T_6 ? _GEN_630 : _GEN_1821; // @[Conditional.scala 39:67]
  wire  _GEN_1956 = _T_6 ? _GEN_631 : _GEN_1822; // @[Conditional.scala 39:67]
  wire  _GEN_1957 = _T_6 ? _GEN_632 : _GEN_1823; // @[Conditional.scala 39:67]
  wire  _GEN_1958 = _T_6 ? _GEN_633 : _GEN_1824; // @[Conditional.scala 39:67]
  wire  _GEN_1959 = _T_6 ? _GEN_634 : _GEN_1825; // @[Conditional.scala 39:67]
  wire  _GEN_1960 = _T_6 ? _GEN_635 : _GEN_1826; // @[Conditional.scala 39:67]
  wire  _GEN_1961 = _T_6 ? _GEN_636 : _GEN_1827; // @[Conditional.scala 39:67]
  wire  _GEN_1962 = _T_6 ? _GEN_637 : _GEN_1828; // @[Conditional.scala 39:67]
  wire  _GEN_1963 = _T_6 ? _GEN_638 : _GEN_1829; // @[Conditional.scala 39:67]
  wire  _GEN_1964 = _T_6 ? _GEN_639 : _GEN_1830; // @[Conditional.scala 39:67]
  wire  _GEN_1965 = _T_6 ? _GEN_640 : _GEN_1831; // @[Conditional.scala 39:67]
  wire  _GEN_1966 = _T_6 ? _GEN_641 : _GEN_1832; // @[Conditional.scala 39:67]
  wire  _GEN_1967 = _T_6 ? _GEN_642 : _GEN_1833; // @[Conditional.scala 39:67]
  wire  _GEN_1968 = _T_6 ? _GEN_643 : _GEN_1834; // @[Conditional.scala 39:67]
  wire  _GEN_1969 = _T_6 ? _GEN_644 : _GEN_1835; // @[Conditional.scala 39:67]
  wire  _GEN_1970 = _T_6 ? _GEN_645 : _GEN_1836; // @[Conditional.scala 39:67]
  wire  _GEN_1971 = _T_6 ? _GEN_646 : _GEN_1837; // @[Conditional.scala 39:67]
  wire  _GEN_1972 = _T_6 ? _GEN_647 : _GEN_1838; // @[Conditional.scala 39:67]
  wire  _GEN_1973 = _T_6 ? _GEN_648 : _GEN_1839; // @[Conditional.scala 39:67]
  wire  _GEN_1974 = _T_6 ? _GEN_649 : _GEN_1840; // @[Conditional.scala 39:67]
  wire  _GEN_1975 = _T_6 ? _GEN_650 : _GEN_1841; // @[Conditional.scala 39:67]
  wire  _GEN_1976 = _T_6 ? _GEN_651 : _GEN_1842; // @[Conditional.scala 39:67]
  wire  _GEN_1977 = _T_6 ? _GEN_652 : _GEN_1843; // @[Conditional.scala 39:67]
  wire  _GEN_1978 = _T_6 ? _GEN_653 : _GEN_1844; // @[Conditional.scala 39:67]
  wire  _GEN_1979 = _T_6 ? _GEN_654 : _GEN_1845; // @[Conditional.scala 39:67]
  wire  _GEN_1980 = _T_6 ? _GEN_655 : _GEN_1846; // @[Conditional.scala 39:67]
  wire  _GEN_1981 = _T_6 ? _GEN_656 : _GEN_1847; // @[Conditional.scala 39:67]
  wire  _GEN_1982 = _T_6 ? _GEN_657 : _GEN_1848; // @[Conditional.scala 39:67]
  wire  _GEN_1983 = _T_6 ? _GEN_658 : _GEN_1849; // @[Conditional.scala 39:67]
  wire  _GEN_1984 = _T_6 ? _GEN_659 : _GEN_1850; // @[Conditional.scala 39:67]
  wire  _GEN_1985 = _T_6 ? _GEN_660 : _GEN_1851; // @[Conditional.scala 39:67]
  wire  _GEN_1986 = _T_6 ? _GEN_661 : _GEN_1852; // @[Conditional.scala 39:67]
  wire  _GEN_1987 = _T_6 ? _GEN_662 : _GEN_1853; // @[Conditional.scala 39:67]
  wire  _GEN_1988 = _T_6 ? _GEN_663 : _GEN_1854; // @[Conditional.scala 39:67]
  wire  _GEN_1989 = _T_6 ? _GEN_664 : _GEN_1722; // @[Conditional.scala 39:67]
  wire  _GEN_1990 = _T_6 ? _GEN_665 : _GEN_1723; // @[Conditional.scala 39:67]
  wire  _GEN_1991 = _T_6 ? _GEN_666 : _GEN_1724; // @[Conditional.scala 39:67]
  wire  _GEN_1992 = _T_6 ? _GEN_667 : _GEN_1725; // @[Conditional.scala 39:67]
  wire  _GEN_1993 = _T_6 ? _GEN_668 : _GEN_1726; // @[Conditional.scala 39:67]
  wire  _GEN_1994 = _T_6 ? _GEN_669 : _GEN_1727; // @[Conditional.scala 39:67]
  wire  _GEN_1995 = _T_6 ? _GEN_670 : _GEN_1728; // @[Conditional.scala 39:67]
  wire  _GEN_1996 = _T_6 ? _GEN_671 : _GEN_1729; // @[Conditional.scala 39:67]
  wire  _GEN_1997 = _T_6 ? _GEN_672 : _GEN_1730; // @[Conditional.scala 39:67]
  wire  _GEN_1998 = _T_6 ? _GEN_673 : _GEN_1731; // @[Conditional.scala 39:67]
  wire  _GEN_1999 = _T_6 ? _GEN_674 : _GEN_1732; // @[Conditional.scala 39:67]
  wire  _GEN_2000 = _T_6 ? _GEN_675 : _GEN_1733; // @[Conditional.scala 39:67]
  wire  _GEN_2001 = _T_6 ? _GEN_676 : _GEN_1734; // @[Conditional.scala 39:67]
  wire  _GEN_2002 = _T_6 ? _GEN_677 : _GEN_1735; // @[Conditional.scala 39:67]
  wire  _GEN_2003 = _T_6 ? _GEN_678 : _GEN_1736; // @[Conditional.scala 39:67]
  wire  _GEN_2004 = _T_6 ? _GEN_679 : _GEN_1737; // @[Conditional.scala 39:67]
  wire  _GEN_2005 = _T_6 ? _GEN_680 : _GEN_1738; // @[Conditional.scala 39:67]
  wire  _GEN_2006 = _T_6 ? _GEN_681 : _GEN_1739; // @[Conditional.scala 39:67]
  wire  _GEN_2007 = _T_6 ? _GEN_682 : _GEN_1740; // @[Conditional.scala 39:67]
  wire  _GEN_2008 = _T_6 ? _GEN_683 : _GEN_1741; // @[Conditional.scala 39:67]
  wire  _GEN_2009 = _T_6 ? _GEN_684 : _GEN_1742; // @[Conditional.scala 39:67]
  wire  _GEN_2010 = _T_6 ? _GEN_685 : _GEN_1743; // @[Conditional.scala 39:67]
  wire  _GEN_2011 = _T_6 ? _GEN_686 : _GEN_1744; // @[Conditional.scala 39:67]
  wire  _GEN_2012 = _T_6 ? _GEN_687 : _GEN_1745; // @[Conditional.scala 39:67]
  wire  _GEN_2013 = _T_6 ? _GEN_688 : _GEN_1746; // @[Conditional.scala 39:67]
  wire  _GEN_2014 = _T_6 ? _GEN_689 : _GEN_1747; // @[Conditional.scala 39:67]
  wire  _GEN_2015 = _T_6 ? _GEN_690 : _GEN_1748; // @[Conditional.scala 39:67]
  wire  _GEN_2016 = _T_6 ? _GEN_691 : _GEN_1749; // @[Conditional.scala 39:67]
  wire  _GEN_2017 = _T_6 ? _GEN_692 : _GEN_1750; // @[Conditional.scala 39:67]
  wire  _GEN_2018 = _T_6 ? _GEN_693 : _GEN_1751; // @[Conditional.scala 39:67]
  wire  _GEN_2019 = _T_6 ? _GEN_694 : _GEN_1752; // @[Conditional.scala 39:67]
  wire  _GEN_2020 = _T_6 ? _GEN_695 : _GEN_1753; // @[Conditional.scala 39:67]
  wire  _GEN_2021 = _T_6 ? _GEN_696 : _GEN_1754; // @[Conditional.scala 39:67]
  wire  _GEN_2022 = _T_6 ? _GEN_697 : _GEN_1755; // @[Conditional.scala 39:67]
  wire  _GEN_2023 = _T_6 ? _GEN_698 : _GEN_1756; // @[Conditional.scala 39:67]
  wire  _GEN_2024 = _T_6 ? _GEN_699 : _GEN_1757; // @[Conditional.scala 39:67]
  wire  _GEN_2025 = _T_6 ? _GEN_700 : _GEN_1758; // @[Conditional.scala 39:67]
  wire  _GEN_2026 = _T_6 ? _GEN_701 : _GEN_1759; // @[Conditional.scala 39:67]
  wire  _GEN_2027 = _T_6 ? _GEN_702 : _GEN_1760; // @[Conditional.scala 39:67]
  wire  _GEN_2028 = _T_6 ? _GEN_703 : _GEN_1761; // @[Conditional.scala 39:67]
  wire  _GEN_2029 = _T_6 ? _GEN_704 : _GEN_1762; // @[Conditional.scala 39:67]
  wire  _GEN_2030 = _T_6 ? _GEN_705 : _GEN_1763; // @[Conditional.scala 39:67]
  wire  _GEN_2031 = _T_6 ? _GEN_706 : _GEN_1764; // @[Conditional.scala 39:67]
  wire  _GEN_2032 = _T_6 ? _GEN_707 : _GEN_1765; // @[Conditional.scala 39:67]
  wire  _GEN_2033 = _T_6 ? _GEN_708 : _GEN_1766; // @[Conditional.scala 39:67]
  wire  _GEN_2034 = _T_6 ? _GEN_709 : _GEN_1767; // @[Conditional.scala 39:67]
  wire  _GEN_2035 = _T_6 ? _GEN_710 : _GEN_1768; // @[Conditional.scala 39:67]
  wire  _GEN_2036 = _T_6 ? _GEN_711 : _GEN_1769; // @[Conditional.scala 39:67]
  wire  _GEN_2037 = _T_6 ? _GEN_712 : _GEN_1770; // @[Conditional.scala 39:67]
  wire  _GEN_2038 = _T_6 ? _GEN_713 : _GEN_1771; // @[Conditional.scala 39:67]
  wire  _GEN_2039 = _T_6 ? _GEN_714 : _GEN_1772; // @[Conditional.scala 39:67]
  wire  _GEN_2040 = _T_6 ? _GEN_715 : _GEN_1773; // @[Conditional.scala 39:67]
  wire  _GEN_2041 = _T_6 ? _GEN_716 : _GEN_1774; // @[Conditional.scala 39:67]
  wire  _GEN_2042 = _T_6 ? _GEN_717 : _GEN_1775; // @[Conditional.scala 39:67]
  wire  _GEN_2043 = _T_6 ? _GEN_718 : _GEN_1776; // @[Conditional.scala 39:67]
  wire  _GEN_2044 = _T_6 ? _GEN_719 : _GEN_1777; // @[Conditional.scala 39:67]
  wire  _GEN_2045 = _T_6 ? _GEN_720 : _GEN_1778; // @[Conditional.scala 39:67]
  wire  _GEN_2046 = _T_6 ? _GEN_721 : _GEN_1779; // @[Conditional.scala 39:67]
  wire  _GEN_2047 = _T_6 ? _GEN_722 : _GEN_1780; // @[Conditional.scala 39:67]
  wire  _GEN_2048 = _T_6 ? _GEN_723 : _GEN_1781; // @[Conditional.scala 39:67]
  wire  _GEN_2049 = _T_6 ? _GEN_724 : _GEN_1782; // @[Conditional.scala 39:67]
  wire  _GEN_2050 = _T_6 ? _GEN_725 : _GEN_1783; // @[Conditional.scala 39:67]
  wire  _GEN_2051 = _T_6 ? _GEN_726 : _GEN_1784; // @[Conditional.scala 39:67]
  wire  _GEN_2052 = _T_6 ? _GEN_727 : _GEN_1785; // @[Conditional.scala 39:67]
  wire [5:0] _GEN_2053 = _T_6 ? fence_reg : _GEN_1786; // @[Conditional.scala 39:67 DCache.scala 350:28]
  wire [511:0] _GEN_2054 = _T_6 ? fence_buffer : _GEN_1787; // @[Conditional.scala 39:67 DCache.scala 436:31]
  wire  _GEN_2055 = _T_6 ? 1'h0 : _GEN_1788; // @[Conditional.scala 39:67 DCache.scala 421:21]
  wire [63:0] _GEN_2056 = _T_6 ? 64'h0 : _GEN_1789; // @[Conditional.scala 39:67 DCache.scala 422:21]
  wire [511:0] _GEN_2057 = _T_6 ? 512'h0 : _GEN_1790; // @[Conditional.scala 39:67 DCache.scala 423:21]
  wire  _GEN_2058 = _T_6 ? 1'h0 : _GEN_1855; // @[Conditional.scala 39:67 DCache.scala 425:21]
  wire  _GEN_2059 = _T_5 & state == 4'h4; // @[Conditional.scala 39:67 DCache.scala 467:29 DCache.scala 419:21]
  wire [63:0] _GEN_2060 = _T_5 ? _io_axi_raddr_T_1 : 64'h0; // @[Conditional.scala 39:67 DCache.scala 468:29 DCache.scala 420:21]
  wire [511:0] _GEN_2061 = _T_5 ? _GEN_535 : axi_rbuffer; // @[Conditional.scala 39:67 DCache.scala 435:30]
  wire [5:0] _GEN_2062 = _T_5 ? 6'h0 : _GEN_1856; // @[Conditional.scala 39:67 DCache.scala 427:21]
  wire  _GEN_2063 = _T_5 ? 1'h0 : _GEN_1857; // @[Conditional.scala 39:67 DCache.scala 428:21]
  wire  _GEN_2064 = _T_5 ? 1'h0 : _GEN_1858; // @[Conditional.scala 39:67 DCache.scala 429:21]
  wire [574:0] _GEN_2065 = _T_5 ? 575'h0 : _GEN_1859; // @[Conditional.scala 39:67 DCache.scala 430:21]
  wire [574:0] _GEN_2066 = _T_5 ? 575'h0 : _GEN_1860; // @[Conditional.scala 39:67 DCache.scala 431:21]
  wire [51:0] _GEN_2067 = _T_5 ? tag_0 : _GEN_1861; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2068 = _T_5 ? tag_1 : _GEN_1862; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2069 = _T_5 ? tag_2 : _GEN_1863; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2070 = _T_5 ? tag_3 : _GEN_1864; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2071 = _T_5 ? tag_4 : _GEN_1865; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2072 = _T_5 ? tag_5 : _GEN_1866; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2073 = _T_5 ? tag_6 : _GEN_1867; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2074 = _T_5 ? tag_7 : _GEN_1868; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2075 = _T_5 ? tag_8 : _GEN_1869; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2076 = _T_5 ? tag_9 : _GEN_1870; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2077 = _T_5 ? tag_10 : _GEN_1871; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2078 = _T_5 ? tag_11 : _GEN_1872; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2079 = _T_5 ? tag_12 : _GEN_1873; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2080 = _T_5 ? tag_13 : _GEN_1874; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2081 = _T_5 ? tag_14 : _GEN_1875; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2082 = _T_5 ? tag_15 : _GEN_1876; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2083 = _T_5 ? tag_16 : _GEN_1877; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2084 = _T_5 ? tag_17 : _GEN_1878; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2085 = _T_5 ? tag_18 : _GEN_1879; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2086 = _T_5 ? tag_19 : _GEN_1880; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2087 = _T_5 ? tag_20 : _GEN_1881; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2088 = _T_5 ? tag_21 : _GEN_1882; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2089 = _T_5 ? tag_22 : _GEN_1883; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2090 = _T_5 ? tag_23 : _GEN_1884; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2091 = _T_5 ? tag_24 : _GEN_1885; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2092 = _T_5 ? tag_25 : _GEN_1886; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2093 = _T_5 ? tag_26 : _GEN_1887; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2094 = _T_5 ? tag_27 : _GEN_1888; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2095 = _T_5 ? tag_28 : _GEN_1889; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2096 = _T_5 ? tag_29 : _GEN_1890; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2097 = _T_5 ? tag_30 : _GEN_1891; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2098 = _T_5 ? tag_31 : _GEN_1892; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2099 = _T_5 ? tag_32 : _GEN_1893; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2100 = _T_5 ? tag_33 : _GEN_1894; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2101 = _T_5 ? tag_34 : _GEN_1895; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2102 = _T_5 ? tag_35 : _GEN_1896; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2103 = _T_5 ? tag_36 : _GEN_1897; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2104 = _T_5 ? tag_37 : _GEN_1898; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2105 = _T_5 ? tag_38 : _GEN_1899; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2106 = _T_5 ? tag_39 : _GEN_1900; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2107 = _T_5 ? tag_40 : _GEN_1901; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2108 = _T_5 ? tag_41 : _GEN_1902; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2109 = _T_5 ? tag_42 : _GEN_1903; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2110 = _T_5 ? tag_43 : _GEN_1904; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2111 = _T_5 ? tag_44 : _GEN_1905; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2112 = _T_5 ? tag_45 : _GEN_1906; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2113 = _T_5 ? tag_46 : _GEN_1907; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2114 = _T_5 ? tag_47 : _GEN_1908; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2115 = _T_5 ? tag_48 : _GEN_1909; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2116 = _T_5 ? tag_49 : _GEN_1910; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2117 = _T_5 ? tag_50 : _GEN_1911; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2118 = _T_5 ? tag_51 : _GEN_1912; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2119 = _T_5 ? tag_52 : _GEN_1913; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2120 = _T_5 ? tag_53 : _GEN_1914; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2121 = _T_5 ? tag_54 : _GEN_1915; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2122 = _T_5 ? tag_55 : _GEN_1916; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2123 = _T_5 ? tag_56 : _GEN_1917; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2124 = _T_5 ? tag_57 : _GEN_1918; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2125 = _T_5 ? tag_58 : _GEN_1919; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2126 = _T_5 ? tag_59 : _GEN_1920; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2127 = _T_5 ? tag_60 : _GEN_1921; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2128 = _T_5 ? tag_61 : _GEN_1922; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2129 = _T_5 ? tag_62 : _GEN_1923; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2130 = _T_5 ? tag_63 : _GEN_1924; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire  _GEN_2131 = _T_5 ? v_0 : _GEN_1925; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2132 = _T_5 ? v_1 : _GEN_1926; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2133 = _T_5 ? v_2 : _GEN_1927; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2134 = _T_5 ? v_3 : _GEN_1928; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2135 = _T_5 ? v_4 : _GEN_1929; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2136 = _T_5 ? v_5 : _GEN_1930; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2137 = _T_5 ? v_6 : _GEN_1931; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2138 = _T_5 ? v_7 : _GEN_1932; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2139 = _T_5 ? v_8 : _GEN_1933; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2140 = _T_5 ? v_9 : _GEN_1934; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2141 = _T_5 ? v_10 : _GEN_1935; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2142 = _T_5 ? v_11 : _GEN_1936; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2143 = _T_5 ? v_12 : _GEN_1937; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2144 = _T_5 ? v_13 : _GEN_1938; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2145 = _T_5 ? v_14 : _GEN_1939; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2146 = _T_5 ? v_15 : _GEN_1940; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2147 = _T_5 ? v_16 : _GEN_1941; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2148 = _T_5 ? v_17 : _GEN_1942; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2149 = _T_5 ? v_18 : _GEN_1943; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2150 = _T_5 ? v_19 : _GEN_1944; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2151 = _T_5 ? v_20 : _GEN_1945; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2152 = _T_5 ? v_21 : _GEN_1946; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2153 = _T_5 ? v_22 : _GEN_1947; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2154 = _T_5 ? v_23 : _GEN_1948; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2155 = _T_5 ? v_24 : _GEN_1949; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2156 = _T_5 ? v_25 : _GEN_1950; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2157 = _T_5 ? v_26 : _GEN_1951; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2158 = _T_5 ? v_27 : _GEN_1952; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2159 = _T_5 ? v_28 : _GEN_1953; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2160 = _T_5 ? v_29 : _GEN_1954; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2161 = _T_5 ? v_30 : _GEN_1955; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2162 = _T_5 ? v_31 : _GEN_1956; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2163 = _T_5 ? v_32 : _GEN_1957; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2164 = _T_5 ? v_33 : _GEN_1958; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2165 = _T_5 ? v_34 : _GEN_1959; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2166 = _T_5 ? v_35 : _GEN_1960; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2167 = _T_5 ? v_36 : _GEN_1961; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2168 = _T_5 ? v_37 : _GEN_1962; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2169 = _T_5 ? v_38 : _GEN_1963; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2170 = _T_5 ? v_39 : _GEN_1964; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2171 = _T_5 ? v_40 : _GEN_1965; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2172 = _T_5 ? v_41 : _GEN_1966; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2173 = _T_5 ? v_42 : _GEN_1967; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2174 = _T_5 ? v_43 : _GEN_1968; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2175 = _T_5 ? v_44 : _GEN_1969; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2176 = _T_5 ? v_45 : _GEN_1970; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2177 = _T_5 ? v_46 : _GEN_1971; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2178 = _T_5 ? v_47 : _GEN_1972; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2179 = _T_5 ? v_48 : _GEN_1973; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2180 = _T_5 ? v_49 : _GEN_1974; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2181 = _T_5 ? v_50 : _GEN_1975; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2182 = _T_5 ? v_51 : _GEN_1976; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2183 = _T_5 ? v_52 : _GEN_1977; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2184 = _T_5 ? v_53 : _GEN_1978; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2185 = _T_5 ? v_54 : _GEN_1979; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2186 = _T_5 ? v_55 : _GEN_1980; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2187 = _T_5 ? v_56 : _GEN_1981; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2188 = _T_5 ? v_57 : _GEN_1982; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2189 = _T_5 ? v_58 : _GEN_1983; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2190 = _T_5 ? v_59 : _GEN_1984; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2191 = _T_5 ? v_60 : _GEN_1985; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2192 = _T_5 ? v_61 : _GEN_1986; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2193 = _T_5 ? v_62 : _GEN_1987; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2194 = _T_5 ? v_63 : _GEN_1988; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2195 = _T_5 ? d_0 : _GEN_1989; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2196 = _T_5 ? d_1 : _GEN_1990; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2197 = _T_5 ? d_2 : _GEN_1991; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2198 = _T_5 ? d_3 : _GEN_1992; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2199 = _T_5 ? d_4 : _GEN_1993; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2200 = _T_5 ? d_5 : _GEN_1994; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2201 = _T_5 ? d_6 : _GEN_1995; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2202 = _T_5 ? d_7 : _GEN_1996; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2203 = _T_5 ? d_8 : _GEN_1997; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2204 = _T_5 ? d_9 : _GEN_1998; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2205 = _T_5 ? d_10 : _GEN_1999; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2206 = _T_5 ? d_11 : _GEN_2000; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2207 = _T_5 ? d_12 : _GEN_2001; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2208 = _T_5 ? d_13 : _GEN_2002; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2209 = _T_5 ? d_14 : _GEN_2003; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2210 = _T_5 ? d_15 : _GEN_2004; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2211 = _T_5 ? d_16 : _GEN_2005; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2212 = _T_5 ? d_17 : _GEN_2006; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2213 = _T_5 ? d_18 : _GEN_2007; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2214 = _T_5 ? d_19 : _GEN_2008; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2215 = _T_5 ? d_20 : _GEN_2009; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2216 = _T_5 ? d_21 : _GEN_2010; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2217 = _T_5 ? d_22 : _GEN_2011; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2218 = _T_5 ? d_23 : _GEN_2012; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2219 = _T_5 ? d_24 : _GEN_2013; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2220 = _T_5 ? d_25 : _GEN_2014; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2221 = _T_5 ? d_26 : _GEN_2015; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2222 = _T_5 ? d_27 : _GEN_2016; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2223 = _T_5 ? d_28 : _GEN_2017; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2224 = _T_5 ? d_29 : _GEN_2018; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2225 = _T_5 ? d_30 : _GEN_2019; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2226 = _T_5 ? d_31 : _GEN_2020; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2227 = _T_5 ? d_32 : _GEN_2021; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2228 = _T_5 ? d_33 : _GEN_2022; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2229 = _T_5 ? d_34 : _GEN_2023; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2230 = _T_5 ? d_35 : _GEN_2024; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2231 = _T_5 ? d_36 : _GEN_2025; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2232 = _T_5 ? d_37 : _GEN_2026; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2233 = _T_5 ? d_38 : _GEN_2027; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2234 = _T_5 ? d_39 : _GEN_2028; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2235 = _T_5 ? d_40 : _GEN_2029; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2236 = _T_5 ? d_41 : _GEN_2030; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2237 = _T_5 ? d_42 : _GEN_2031; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2238 = _T_5 ? d_43 : _GEN_2032; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2239 = _T_5 ? d_44 : _GEN_2033; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2240 = _T_5 ? d_45 : _GEN_2034; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2241 = _T_5 ? d_46 : _GEN_2035; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2242 = _T_5 ? d_47 : _GEN_2036; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2243 = _T_5 ? d_48 : _GEN_2037; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2244 = _T_5 ? d_49 : _GEN_2038; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2245 = _T_5 ? d_50 : _GEN_2039; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2246 = _T_5 ? d_51 : _GEN_2040; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2247 = _T_5 ? d_52 : _GEN_2041; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2248 = _T_5 ? d_53 : _GEN_2042; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2249 = _T_5 ? d_54 : _GEN_2043; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2250 = _T_5 ? d_55 : _GEN_2044; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2251 = _T_5 ? d_56 : _GEN_2045; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2252 = _T_5 ? d_57 : _GEN_2046; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2253 = _T_5 ? d_58 : _GEN_2047; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2254 = _T_5 ? d_59 : _GEN_2048; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2255 = _T_5 ? d_60 : _GEN_2049; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2256 = _T_5 ? d_61 : _GEN_2050; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2257 = _T_5 ? d_62 : _GEN_2051; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2258 = _T_5 ? d_63 : _GEN_2052; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire [5:0] _GEN_2259 = _T_5 ? fence_reg : _GEN_2053; // @[Conditional.scala 39:67 DCache.scala 350:28]
  wire [511:0] _GEN_2260 = _T_5 ? fence_buffer : _GEN_2054; // @[Conditional.scala 39:67 DCache.scala 436:31]
  wire  _GEN_2261 = _T_5 ? 1'h0 : _GEN_2055; // @[Conditional.scala 39:67 DCache.scala 421:21]
  wire [63:0] _GEN_2262 = _T_5 ? 64'h0 : _GEN_2056; // @[Conditional.scala 39:67 DCache.scala 422:21]
  wire [511:0] _GEN_2263 = _T_5 ? 512'h0 : _GEN_2057; // @[Conditional.scala 39:67 DCache.scala 423:21]
  wire  _GEN_2264 = _T_5 ? 1'h0 : _GEN_2058; // @[Conditional.scala 39:67 DCache.scala 425:21]
  wire  _GEN_2265 = _T_4 | _GEN_2261; // @[Conditional.scala 39:67 DCache.scala 462:29]
  wire [63:0] _GEN_2266 = _T_4 ? _io_axi_waddr_T : _GEN_2262; // @[Conditional.scala 39:67 DCache.scala 463:29]
  wire [511:0] _GEN_2267 = _T_4 ? axi_wbuffer : _GEN_2263; // @[Conditional.scala 39:67 DCache.scala 464:29]
  wire  _GEN_2268 = _T_4 ? 1'h0 : _GEN_2059; // @[Conditional.scala 39:67 DCache.scala 419:21]
  wire [63:0] _GEN_2269 = _T_4 ? 64'h0 : _GEN_2060; // @[Conditional.scala 39:67 DCache.scala 420:21]
  wire [511:0] _GEN_2270 = _T_4 ? axi_rbuffer : _GEN_2061; // @[Conditional.scala 39:67 DCache.scala 435:30]
  wire [5:0] _GEN_2271 = _T_4 ? 6'h0 : _GEN_2062; // @[Conditional.scala 39:67 DCache.scala 427:21]
  wire  _GEN_2272 = _T_4 ? 1'h0 : _GEN_2063; // @[Conditional.scala 39:67 DCache.scala 428:21]
  wire  _GEN_2273 = _T_4 ? 1'h0 : _GEN_2064; // @[Conditional.scala 39:67 DCache.scala 429:21]
  wire [574:0] _GEN_2274 = _T_4 ? 575'h0 : _GEN_2065; // @[Conditional.scala 39:67 DCache.scala 430:21]
  wire [574:0] _GEN_2275 = _T_4 ? 575'h0 : _GEN_2066; // @[Conditional.scala 39:67 DCache.scala 431:21]
  wire [51:0] _GEN_2276 = _T_4 ? tag_0 : _GEN_2067; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2277 = _T_4 ? tag_1 : _GEN_2068; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2278 = _T_4 ? tag_2 : _GEN_2069; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2279 = _T_4 ? tag_3 : _GEN_2070; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2280 = _T_4 ? tag_4 : _GEN_2071; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2281 = _T_4 ? tag_5 : _GEN_2072; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2282 = _T_4 ? tag_6 : _GEN_2073; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2283 = _T_4 ? tag_7 : _GEN_2074; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2284 = _T_4 ? tag_8 : _GEN_2075; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2285 = _T_4 ? tag_9 : _GEN_2076; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2286 = _T_4 ? tag_10 : _GEN_2077; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2287 = _T_4 ? tag_11 : _GEN_2078; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2288 = _T_4 ? tag_12 : _GEN_2079; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2289 = _T_4 ? tag_13 : _GEN_2080; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2290 = _T_4 ? tag_14 : _GEN_2081; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2291 = _T_4 ? tag_15 : _GEN_2082; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2292 = _T_4 ? tag_16 : _GEN_2083; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2293 = _T_4 ? tag_17 : _GEN_2084; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2294 = _T_4 ? tag_18 : _GEN_2085; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2295 = _T_4 ? tag_19 : _GEN_2086; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2296 = _T_4 ? tag_20 : _GEN_2087; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2297 = _T_4 ? tag_21 : _GEN_2088; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2298 = _T_4 ? tag_22 : _GEN_2089; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2299 = _T_4 ? tag_23 : _GEN_2090; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2300 = _T_4 ? tag_24 : _GEN_2091; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2301 = _T_4 ? tag_25 : _GEN_2092; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2302 = _T_4 ? tag_26 : _GEN_2093; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2303 = _T_4 ? tag_27 : _GEN_2094; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2304 = _T_4 ? tag_28 : _GEN_2095; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2305 = _T_4 ? tag_29 : _GEN_2096; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2306 = _T_4 ? tag_30 : _GEN_2097; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2307 = _T_4 ? tag_31 : _GEN_2098; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2308 = _T_4 ? tag_32 : _GEN_2099; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2309 = _T_4 ? tag_33 : _GEN_2100; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2310 = _T_4 ? tag_34 : _GEN_2101; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2311 = _T_4 ? tag_35 : _GEN_2102; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2312 = _T_4 ? tag_36 : _GEN_2103; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2313 = _T_4 ? tag_37 : _GEN_2104; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2314 = _T_4 ? tag_38 : _GEN_2105; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2315 = _T_4 ? tag_39 : _GEN_2106; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2316 = _T_4 ? tag_40 : _GEN_2107; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2317 = _T_4 ? tag_41 : _GEN_2108; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2318 = _T_4 ? tag_42 : _GEN_2109; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2319 = _T_4 ? tag_43 : _GEN_2110; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2320 = _T_4 ? tag_44 : _GEN_2111; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2321 = _T_4 ? tag_45 : _GEN_2112; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2322 = _T_4 ? tag_46 : _GEN_2113; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2323 = _T_4 ? tag_47 : _GEN_2114; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2324 = _T_4 ? tag_48 : _GEN_2115; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2325 = _T_4 ? tag_49 : _GEN_2116; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2326 = _T_4 ? tag_50 : _GEN_2117; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2327 = _T_4 ? tag_51 : _GEN_2118; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2328 = _T_4 ? tag_52 : _GEN_2119; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2329 = _T_4 ? tag_53 : _GEN_2120; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2330 = _T_4 ? tag_54 : _GEN_2121; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2331 = _T_4 ? tag_55 : _GEN_2122; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2332 = _T_4 ? tag_56 : _GEN_2123; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2333 = _T_4 ? tag_57 : _GEN_2124; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2334 = _T_4 ? tag_58 : _GEN_2125; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2335 = _T_4 ? tag_59 : _GEN_2126; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2336 = _T_4 ? tag_60 : _GEN_2127; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2337 = _T_4 ? tag_61 : _GEN_2128; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2338 = _T_4 ? tag_62 : _GEN_2129; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire [51:0] _GEN_2339 = _T_4 ? tag_63 : _GEN_2130; // @[Conditional.scala 39:67 DCache.scala 337:25]
  wire  _GEN_2340 = _T_4 ? v_0 : _GEN_2131; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2341 = _T_4 ? v_1 : _GEN_2132; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2342 = _T_4 ? v_2 : _GEN_2133; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2343 = _T_4 ? v_3 : _GEN_2134; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2344 = _T_4 ? v_4 : _GEN_2135; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2345 = _T_4 ? v_5 : _GEN_2136; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2346 = _T_4 ? v_6 : _GEN_2137; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2347 = _T_4 ? v_7 : _GEN_2138; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2348 = _T_4 ? v_8 : _GEN_2139; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2349 = _T_4 ? v_9 : _GEN_2140; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2350 = _T_4 ? v_10 : _GEN_2141; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2351 = _T_4 ? v_11 : _GEN_2142; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2352 = _T_4 ? v_12 : _GEN_2143; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2353 = _T_4 ? v_13 : _GEN_2144; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2354 = _T_4 ? v_14 : _GEN_2145; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2355 = _T_4 ? v_15 : _GEN_2146; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2356 = _T_4 ? v_16 : _GEN_2147; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2357 = _T_4 ? v_17 : _GEN_2148; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2358 = _T_4 ? v_18 : _GEN_2149; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2359 = _T_4 ? v_19 : _GEN_2150; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2360 = _T_4 ? v_20 : _GEN_2151; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2361 = _T_4 ? v_21 : _GEN_2152; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2362 = _T_4 ? v_22 : _GEN_2153; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2363 = _T_4 ? v_23 : _GEN_2154; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2364 = _T_4 ? v_24 : _GEN_2155; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2365 = _T_4 ? v_25 : _GEN_2156; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2366 = _T_4 ? v_26 : _GEN_2157; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2367 = _T_4 ? v_27 : _GEN_2158; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2368 = _T_4 ? v_28 : _GEN_2159; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2369 = _T_4 ? v_29 : _GEN_2160; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2370 = _T_4 ? v_30 : _GEN_2161; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2371 = _T_4 ? v_31 : _GEN_2162; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2372 = _T_4 ? v_32 : _GEN_2163; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2373 = _T_4 ? v_33 : _GEN_2164; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2374 = _T_4 ? v_34 : _GEN_2165; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2375 = _T_4 ? v_35 : _GEN_2166; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2376 = _T_4 ? v_36 : _GEN_2167; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2377 = _T_4 ? v_37 : _GEN_2168; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2378 = _T_4 ? v_38 : _GEN_2169; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2379 = _T_4 ? v_39 : _GEN_2170; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2380 = _T_4 ? v_40 : _GEN_2171; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2381 = _T_4 ? v_41 : _GEN_2172; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2382 = _T_4 ? v_42 : _GEN_2173; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2383 = _T_4 ? v_43 : _GEN_2174; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2384 = _T_4 ? v_44 : _GEN_2175; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2385 = _T_4 ? v_45 : _GEN_2176; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2386 = _T_4 ? v_46 : _GEN_2177; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2387 = _T_4 ? v_47 : _GEN_2178; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2388 = _T_4 ? v_48 : _GEN_2179; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2389 = _T_4 ? v_49 : _GEN_2180; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2390 = _T_4 ? v_50 : _GEN_2181; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2391 = _T_4 ? v_51 : _GEN_2182; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2392 = _T_4 ? v_52 : _GEN_2183; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2393 = _T_4 ? v_53 : _GEN_2184; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2394 = _T_4 ? v_54 : _GEN_2185; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2395 = _T_4 ? v_55 : _GEN_2186; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2396 = _T_4 ? v_56 : _GEN_2187; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2397 = _T_4 ? v_57 : _GEN_2188; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2398 = _T_4 ? v_58 : _GEN_2189; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2399 = _T_4 ? v_59 : _GEN_2190; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2400 = _T_4 ? v_60 : _GEN_2191; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2401 = _T_4 ? v_61 : _GEN_2192; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2402 = _T_4 ? v_62 : _GEN_2193; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2403 = _T_4 ? v_63 : _GEN_2194; // @[Conditional.scala 39:67 DCache.scala 334:25]
  wire  _GEN_2404 = _T_4 ? d_0 : _GEN_2195; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2405 = _T_4 ? d_1 : _GEN_2196; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2406 = _T_4 ? d_2 : _GEN_2197; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2407 = _T_4 ? d_3 : _GEN_2198; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2408 = _T_4 ? d_4 : _GEN_2199; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2409 = _T_4 ? d_5 : _GEN_2200; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2410 = _T_4 ? d_6 : _GEN_2201; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2411 = _T_4 ? d_7 : _GEN_2202; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2412 = _T_4 ? d_8 : _GEN_2203; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2413 = _T_4 ? d_9 : _GEN_2204; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2414 = _T_4 ? d_10 : _GEN_2205; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2415 = _T_4 ? d_11 : _GEN_2206; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2416 = _T_4 ? d_12 : _GEN_2207; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2417 = _T_4 ? d_13 : _GEN_2208; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2418 = _T_4 ? d_14 : _GEN_2209; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2419 = _T_4 ? d_15 : _GEN_2210; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2420 = _T_4 ? d_16 : _GEN_2211; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2421 = _T_4 ? d_17 : _GEN_2212; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2422 = _T_4 ? d_18 : _GEN_2213; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2423 = _T_4 ? d_19 : _GEN_2214; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2424 = _T_4 ? d_20 : _GEN_2215; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2425 = _T_4 ? d_21 : _GEN_2216; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2426 = _T_4 ? d_22 : _GEN_2217; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2427 = _T_4 ? d_23 : _GEN_2218; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2428 = _T_4 ? d_24 : _GEN_2219; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2429 = _T_4 ? d_25 : _GEN_2220; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2430 = _T_4 ? d_26 : _GEN_2221; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2431 = _T_4 ? d_27 : _GEN_2222; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2432 = _T_4 ? d_28 : _GEN_2223; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2433 = _T_4 ? d_29 : _GEN_2224; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2434 = _T_4 ? d_30 : _GEN_2225; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2435 = _T_4 ? d_31 : _GEN_2226; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2436 = _T_4 ? d_32 : _GEN_2227; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2437 = _T_4 ? d_33 : _GEN_2228; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2438 = _T_4 ? d_34 : _GEN_2229; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2439 = _T_4 ? d_35 : _GEN_2230; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2440 = _T_4 ? d_36 : _GEN_2231; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2441 = _T_4 ? d_37 : _GEN_2232; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2442 = _T_4 ? d_38 : _GEN_2233; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2443 = _T_4 ? d_39 : _GEN_2234; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2444 = _T_4 ? d_40 : _GEN_2235; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2445 = _T_4 ? d_41 : _GEN_2236; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2446 = _T_4 ? d_42 : _GEN_2237; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2447 = _T_4 ? d_43 : _GEN_2238; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2448 = _T_4 ? d_44 : _GEN_2239; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2449 = _T_4 ? d_45 : _GEN_2240; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2450 = _T_4 ? d_46 : _GEN_2241; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2451 = _T_4 ? d_47 : _GEN_2242; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2452 = _T_4 ? d_48 : _GEN_2243; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2453 = _T_4 ? d_49 : _GEN_2244; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2454 = _T_4 ? d_50 : _GEN_2245; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2455 = _T_4 ? d_51 : _GEN_2246; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2456 = _T_4 ? d_52 : _GEN_2247; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2457 = _T_4 ? d_53 : _GEN_2248; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2458 = _T_4 ? d_54 : _GEN_2249; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2459 = _T_4 ? d_55 : _GEN_2250; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2460 = _T_4 ? d_56 : _GEN_2251; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2461 = _T_4 ? d_57 : _GEN_2252; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2462 = _T_4 ? d_58 : _GEN_2253; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2463 = _T_4 ? d_59 : _GEN_2254; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2464 = _T_4 ? d_60 : _GEN_2255; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2465 = _T_4 ? d_61 : _GEN_2256; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2466 = _T_4 ? d_62 : _GEN_2257; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire  _GEN_2467 = _T_4 ? d_63 : _GEN_2258; // @[Conditional.scala 39:67 DCache.scala 335:25]
  wire [5:0] _GEN_2468 = _T_4 ? fence_reg : _GEN_2259; // @[Conditional.scala 39:67 DCache.scala 350:28]
  wire [511:0] _GEN_2469 = _T_4 ? fence_buffer : _GEN_2260; // @[Conditional.scala 39:67 DCache.scala 436:31]
  wire  _GEN_2470 = _T_4 ? 1'h0 : _GEN_2264; // @[Conditional.scala 39:67 DCache.scala 425:21]
  wire  _GEN_2472 = _T_3 ? 1'h0 : _GEN_2265; // @[Conditional.scala 39:67 DCache.scala 421:21]
  wire [63:0] _GEN_2473 = _T_3 ? 64'h0 : _GEN_2266; // @[Conditional.scala 39:67 DCache.scala 422:21]
  wire [511:0] _GEN_2474 = _T_3 ? 512'h0 : _GEN_2267; // @[Conditional.scala 39:67 DCache.scala 423:21]
  wire  _GEN_2475 = _T_3 ? 1'h0 : _GEN_2268; // @[Conditional.scala 39:67 DCache.scala 419:21]
  wire [63:0] _GEN_2476 = _T_3 ? 64'h0 : _GEN_2269; // @[Conditional.scala 39:67 DCache.scala 420:21]
  wire [5:0] _GEN_2478 = _T_3 ? 6'h0 : _GEN_2271; // @[Conditional.scala 39:67 DCache.scala 427:21]
  wire  _GEN_2479 = _T_3 ? 1'h0 : _GEN_2272; // @[Conditional.scala 39:67 DCache.scala 428:21]
  wire  _GEN_2480 = _T_3 ? 1'h0 : _GEN_2273; // @[Conditional.scala 39:67 DCache.scala 429:21]
  wire [574:0] _GEN_2481 = _T_3 ? 575'h0 : _GEN_2274; // @[Conditional.scala 39:67 DCache.scala 430:21]
  wire [574:0] _GEN_2482 = _T_3 ? 575'h0 : _GEN_2275; // @[Conditional.scala 39:67 DCache.scala 431:21]
  wire  _GEN_2677 = _T_3 ? 1'h0 : _GEN_2470; // @[Conditional.scala 39:67 DCache.scala 425:21]
  wire [5:0] _GEN_2678 = _T_2 ? index_addr_stay : _GEN_2478; // @[Conditional.scala 39:67 DCache.scala 454:29]
  wire  _GEN_2679 = _T_2 | _GEN_2479; // @[Conditional.scala 39:67 DCache.scala 455:29]
  wire  _GEN_2680 = _T_2 ? 1'h0 : _GEN_2480; // @[Conditional.scala 39:67 DCache.scala 456:29]
  wire  _GEN_2682 = _T_2 ? 1'h0 : _GEN_2472; // @[Conditional.scala 39:67 DCache.scala 421:21]
  wire [63:0] _GEN_2683 = _T_2 ? 64'h0 : _GEN_2473; // @[Conditional.scala 39:67 DCache.scala 422:21]
  wire [511:0] _GEN_2684 = _T_2 ? 512'h0 : _GEN_2474; // @[Conditional.scala 39:67 DCache.scala 423:21]
  wire  _GEN_2685 = _T_2 ? 1'h0 : _GEN_2475; // @[Conditional.scala 39:67 DCache.scala 419:21]
  wire [63:0] _GEN_2686 = _T_2 ? 64'h0 : _GEN_2476; // @[Conditional.scala 39:67 DCache.scala 420:21]
  wire [574:0] _GEN_2688 = _T_2 ? 575'h0 : _GEN_2481; // @[Conditional.scala 39:67 DCache.scala 430:21]
  wire [574:0] _GEN_2689 = _T_2 ? 575'h0 : _GEN_2482; // @[Conditional.scala 39:67 DCache.scala 431:21]
  wire  _GEN_2884 = _T_2 ? 1'h0 : _GEN_2677; // @[Conditional.scala 39:67 DCache.scala 425:21]
  wire [574:0] _GEN_2890 = _T ? _T_19 : _GEN_2688; // @[Conditional.scala 40:58 DCache.scala 448:29]
  wire [574:0] _GEN_2891 = _T ? _T_38 : _GEN_2689; // @[Conditional.scala 40:58 DCache.scala 449:29]
  ysyx_040596_SRam_4k SRam_4k ( // @[DCache.scala 338:24]
    .clock(SRam_4k_clock),
    .reset(SRam_4k_reset),
    .io_addr(SRam_4k_io_addr),
    .io_cen(SRam_4k_io_cen),
    .io_wen(SRam_4k_io_wen),
    .io_wmask(SRam_4k_io_wmask),
    .io_wdata(SRam_4k_io_wdata),
    .io_rdata(SRam_4k_io_rdata),
    .io_sram0_addr(SRam_4k_io_sram0_addr),
    .io_sram0_wen(SRam_4k_io_sram0_wen),
    .io_sram0_wmask(SRam_4k_io_sram0_wmask),
    .io_sram0_wdata(SRam_4k_io_sram0_wdata),
    .io_sram0_rdata(SRam_4k_io_sram0_rdata),
    .io_sram1_addr(SRam_4k_io_sram1_addr),
    .io_sram1_wen(SRam_4k_io_sram1_wen),
    .io_sram1_wmask(SRam_4k_io_sram1_wmask),
    .io_sram1_wdata(SRam_4k_io_sram1_wdata),
    .io_sram1_rdata(SRam_4k_io_sram1_rdata),
    .io_sram2_addr(SRam_4k_io_sram2_addr),
    .io_sram2_wen(SRam_4k_io_sram2_wen),
    .io_sram2_wmask(SRam_4k_io_sram2_wmask),
    .io_sram2_wdata(SRam_4k_io_sram2_wdata),
    .io_sram2_rdata(SRam_4k_io_sram2_rdata),
    .io_sram3_addr(SRam_4k_io_sram3_addr),
    .io_sram3_wen(SRam_4k_io_sram3_wen),
    .io_sram3_wmask(SRam_4k_io_sram3_wmask),
    .io_sram3_wdata(SRam_4k_io_sram3_wdata),
    .io_sram3_rdata(SRam_4k_io_sram3_rdata)
  );
  assign io_dmem_ok = 4'h0 == state; // @[Conditional.scala 37:30]
  assign io_dmem_rdata = _T ? data : 64'h0; // @[Conditional.scala 40:58 DCache.scala 442:29 DCache.scala 416:21]
  assign io_axi_req = _T ? 1'h0 : _GEN_2685; // @[Conditional.scala 40:58 DCache.scala 419:21]
  assign io_axi_raddr = _T ? 64'h0 : _GEN_2686; // @[Conditional.scala 40:58 DCache.scala 420:21]
  assign io_axi_weq = _T ? 1'h0 : _GEN_2682; // @[Conditional.scala 40:58 DCache.scala 421:21]
  assign io_axi_waddr = _T ? 64'h0 : _GEN_2683; // @[Conditional.scala 40:58 DCache.scala 422:21]
  assign io_axi_wdata = _T ? 512'h0 : _GEN_2684; // @[Conditional.scala 40:58 DCache.scala 423:21]
  assign io_fence_done = _T ? 1'h0 : _GEN_2884; // @[Conditional.scala 40:58 DCache.scala 425:21]
  assign io_sram0_addr = SRam_4k_io_sram0_addr; // @[DCache.scala 340:17]
  assign io_sram0_wen = SRam_4k_io_sram0_wen; // @[DCache.scala 340:17]
  assign io_sram0_wmask = SRam_4k_io_sram0_wmask; // @[DCache.scala 340:17]
  assign io_sram0_wdata = SRam_4k_io_sram0_wdata; // @[DCache.scala 340:17]
  assign io_sram1_addr = SRam_4k_io_sram1_addr; // @[DCache.scala 341:17]
  assign io_sram1_wen = SRam_4k_io_sram1_wen; // @[DCache.scala 341:17]
  assign io_sram1_wmask = SRam_4k_io_sram1_wmask; // @[DCache.scala 341:17]
  assign io_sram1_wdata = SRam_4k_io_sram1_wdata; // @[DCache.scala 341:17]
  assign io_sram2_addr = SRam_4k_io_sram2_addr; // @[DCache.scala 342:17]
  assign io_sram2_wen = SRam_4k_io_sram2_wen; // @[DCache.scala 342:17]
  assign io_sram2_wmask = SRam_4k_io_sram2_wmask; // @[DCache.scala 342:17]
  assign io_sram2_wdata = SRam_4k_io_sram2_wdata; // @[DCache.scala 342:17]
  assign io_sram3_addr = SRam_4k_io_sram3_addr; // @[DCache.scala 343:17]
  assign io_sram3_wen = SRam_4k_io_sram3_wen; // @[DCache.scala 343:17]
  assign io_sram3_wmask = SRam_4k_io_sram3_wmask; // @[DCache.scala 343:17]
  assign io_sram3_wdata = SRam_4k_io_sram3_wdata; // @[DCache.scala 343:17]
  assign SRam_4k_clock = clock;
  assign SRam_4k_reset = reset;
  assign SRam_4k_io_addr = _T ? index_addr : _GEN_2678; // @[Conditional.scala 40:58 DCache.scala 445:29]
  assign SRam_4k_io_cen = _T ? io_dmem_en : _GEN_2679; // @[Conditional.scala 40:58 DCache.scala 446:29]
  assign SRam_4k_io_wen = _T ? io_dmem_op & hit : _GEN_2680; // @[Conditional.scala 40:58 DCache.scala 447:29]
  assign SRam_4k_io_wmask = _GEN_2891[511:0];
  assign SRam_4k_io_wdata = _GEN_2890[511:0];
  assign SRam_4k_io_sram0_rdata = io_sram0_rdata; // @[DCache.scala 340:17]
  assign SRam_4k_io_sram1_rdata = io_sram1_rdata; // @[DCache.scala 341:17]
  assign SRam_4k_io_sram2_rdata = io_sram2_rdata; // @[DCache.scala 342:17]
  assign SRam_4k_io_sram3_rdata = io_sram3_rdata; // @[DCache.scala 343:17]
  always @(posedge clock) begin
    if (reset) begin // @[DCache.scala 334:25]
      v_0 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_0 <= _GEN_2340;
        end
      end
    end
    if (reset) begin // @[DCache.scala 334:25]
      v_1 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_1 <= _GEN_2341;
        end
      end
    end
    if (reset) begin // @[DCache.scala 334:25]
      v_2 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_2 <= _GEN_2342;
        end
      end
    end
    if (reset) begin // @[DCache.scala 334:25]
      v_3 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_3 <= _GEN_2343;
        end
      end
    end
    if (reset) begin // @[DCache.scala 334:25]
      v_4 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_4 <= _GEN_2344;
        end
      end
    end
    if (reset) begin // @[DCache.scala 334:25]
      v_5 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_5 <= _GEN_2345;
        end
      end
    end
    if (reset) begin // @[DCache.scala 334:25]
      v_6 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_6 <= _GEN_2346;
        end
      end
    end
    if (reset) begin // @[DCache.scala 334:25]
      v_7 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_7 <= _GEN_2347;
        end
      end
    end
    if (reset) begin // @[DCache.scala 334:25]
      v_8 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_8 <= _GEN_2348;
        end
      end
    end
    if (reset) begin // @[DCache.scala 334:25]
      v_9 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_9 <= _GEN_2349;
        end
      end
    end
    if (reset) begin // @[DCache.scala 334:25]
      v_10 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_10 <= _GEN_2350;
        end
      end
    end
    if (reset) begin // @[DCache.scala 334:25]
      v_11 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_11 <= _GEN_2351;
        end
      end
    end
    if (reset) begin // @[DCache.scala 334:25]
      v_12 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_12 <= _GEN_2352;
        end
      end
    end
    if (reset) begin // @[DCache.scala 334:25]
      v_13 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_13 <= _GEN_2353;
        end
      end
    end
    if (reset) begin // @[DCache.scala 334:25]
      v_14 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_14 <= _GEN_2354;
        end
      end
    end
    if (reset) begin // @[DCache.scala 334:25]
      v_15 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_15 <= _GEN_2355;
        end
      end
    end
    if (reset) begin // @[DCache.scala 334:25]
      v_16 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_16 <= _GEN_2356;
        end
      end
    end
    if (reset) begin // @[DCache.scala 334:25]
      v_17 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_17 <= _GEN_2357;
        end
      end
    end
    if (reset) begin // @[DCache.scala 334:25]
      v_18 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_18 <= _GEN_2358;
        end
      end
    end
    if (reset) begin // @[DCache.scala 334:25]
      v_19 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_19 <= _GEN_2359;
        end
      end
    end
    if (reset) begin // @[DCache.scala 334:25]
      v_20 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_20 <= _GEN_2360;
        end
      end
    end
    if (reset) begin // @[DCache.scala 334:25]
      v_21 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_21 <= _GEN_2361;
        end
      end
    end
    if (reset) begin // @[DCache.scala 334:25]
      v_22 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_22 <= _GEN_2362;
        end
      end
    end
    if (reset) begin // @[DCache.scala 334:25]
      v_23 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_23 <= _GEN_2363;
        end
      end
    end
    if (reset) begin // @[DCache.scala 334:25]
      v_24 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_24 <= _GEN_2364;
        end
      end
    end
    if (reset) begin // @[DCache.scala 334:25]
      v_25 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_25 <= _GEN_2365;
        end
      end
    end
    if (reset) begin // @[DCache.scala 334:25]
      v_26 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_26 <= _GEN_2366;
        end
      end
    end
    if (reset) begin // @[DCache.scala 334:25]
      v_27 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_27 <= _GEN_2367;
        end
      end
    end
    if (reset) begin // @[DCache.scala 334:25]
      v_28 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_28 <= _GEN_2368;
        end
      end
    end
    if (reset) begin // @[DCache.scala 334:25]
      v_29 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_29 <= _GEN_2369;
        end
      end
    end
    if (reset) begin // @[DCache.scala 334:25]
      v_30 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_30 <= _GEN_2370;
        end
      end
    end
    if (reset) begin // @[DCache.scala 334:25]
      v_31 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_31 <= _GEN_2371;
        end
      end
    end
    if (reset) begin // @[DCache.scala 334:25]
      v_32 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_32 <= _GEN_2372;
        end
      end
    end
    if (reset) begin // @[DCache.scala 334:25]
      v_33 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_33 <= _GEN_2373;
        end
      end
    end
    if (reset) begin // @[DCache.scala 334:25]
      v_34 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_34 <= _GEN_2374;
        end
      end
    end
    if (reset) begin // @[DCache.scala 334:25]
      v_35 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_35 <= _GEN_2375;
        end
      end
    end
    if (reset) begin // @[DCache.scala 334:25]
      v_36 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_36 <= _GEN_2376;
        end
      end
    end
    if (reset) begin // @[DCache.scala 334:25]
      v_37 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_37 <= _GEN_2377;
        end
      end
    end
    if (reset) begin // @[DCache.scala 334:25]
      v_38 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_38 <= _GEN_2378;
        end
      end
    end
    if (reset) begin // @[DCache.scala 334:25]
      v_39 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_39 <= _GEN_2379;
        end
      end
    end
    if (reset) begin // @[DCache.scala 334:25]
      v_40 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_40 <= _GEN_2380;
        end
      end
    end
    if (reset) begin // @[DCache.scala 334:25]
      v_41 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_41 <= _GEN_2381;
        end
      end
    end
    if (reset) begin // @[DCache.scala 334:25]
      v_42 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_42 <= _GEN_2382;
        end
      end
    end
    if (reset) begin // @[DCache.scala 334:25]
      v_43 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_43 <= _GEN_2383;
        end
      end
    end
    if (reset) begin // @[DCache.scala 334:25]
      v_44 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_44 <= _GEN_2384;
        end
      end
    end
    if (reset) begin // @[DCache.scala 334:25]
      v_45 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_45 <= _GEN_2385;
        end
      end
    end
    if (reset) begin // @[DCache.scala 334:25]
      v_46 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_46 <= _GEN_2386;
        end
      end
    end
    if (reset) begin // @[DCache.scala 334:25]
      v_47 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_47 <= _GEN_2387;
        end
      end
    end
    if (reset) begin // @[DCache.scala 334:25]
      v_48 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_48 <= _GEN_2388;
        end
      end
    end
    if (reset) begin // @[DCache.scala 334:25]
      v_49 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_49 <= _GEN_2389;
        end
      end
    end
    if (reset) begin // @[DCache.scala 334:25]
      v_50 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_50 <= _GEN_2390;
        end
      end
    end
    if (reset) begin // @[DCache.scala 334:25]
      v_51 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_51 <= _GEN_2391;
        end
      end
    end
    if (reset) begin // @[DCache.scala 334:25]
      v_52 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_52 <= _GEN_2392;
        end
      end
    end
    if (reset) begin // @[DCache.scala 334:25]
      v_53 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_53 <= _GEN_2393;
        end
      end
    end
    if (reset) begin // @[DCache.scala 334:25]
      v_54 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_54 <= _GEN_2394;
        end
      end
    end
    if (reset) begin // @[DCache.scala 334:25]
      v_55 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_55 <= _GEN_2395;
        end
      end
    end
    if (reset) begin // @[DCache.scala 334:25]
      v_56 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_56 <= _GEN_2396;
        end
      end
    end
    if (reset) begin // @[DCache.scala 334:25]
      v_57 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_57 <= _GEN_2397;
        end
      end
    end
    if (reset) begin // @[DCache.scala 334:25]
      v_58 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_58 <= _GEN_2398;
        end
      end
    end
    if (reset) begin // @[DCache.scala 334:25]
      v_59 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_59 <= _GEN_2399;
        end
      end
    end
    if (reset) begin // @[DCache.scala 334:25]
      v_60 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_60 <= _GEN_2400;
        end
      end
    end
    if (reset) begin // @[DCache.scala 334:25]
      v_61 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_61 <= _GEN_2401;
        end
      end
    end
    if (reset) begin // @[DCache.scala 334:25]
      v_62 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_62 <= _GEN_2402;
        end
      end
    end
    if (reset) begin // @[DCache.scala 334:25]
      v_63 <= 1'h0; // @[DCache.scala 334:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          v_63 <= _GEN_2403;
        end
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_0 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_0 <= 6'h0 == index_addr | d_0;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_0 <= _GEN_2404;
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_1 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_1 <= 6'h1 == index_addr | d_1;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_1 <= _GEN_2405;
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_2 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_2 <= 6'h2 == index_addr | d_2;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_2 <= _GEN_2406;
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_3 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_3 <= 6'h3 == index_addr | d_3;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_3 <= _GEN_2407;
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_4 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_4 <= 6'h4 == index_addr | d_4;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_4 <= _GEN_2408;
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_5 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_5 <= 6'h5 == index_addr | d_5;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_5 <= _GEN_2409;
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_6 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_6 <= 6'h6 == index_addr | d_6;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_6 <= _GEN_2410;
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_7 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_7 <= 6'h7 == index_addr | d_7;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_7 <= _GEN_2411;
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_8 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_8 <= 6'h8 == index_addr | d_8;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_8 <= _GEN_2412;
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_9 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_9 <= 6'h9 == index_addr | d_9;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_9 <= _GEN_2413;
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_10 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_10 <= 6'ha == index_addr | d_10;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_10 <= _GEN_2414;
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_11 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_11 <= 6'hb == index_addr | d_11;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_11 <= _GEN_2415;
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_12 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_12 <= 6'hc == index_addr | d_12;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_12 <= _GEN_2416;
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_13 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_13 <= 6'hd == index_addr | d_13;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_13 <= _GEN_2417;
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_14 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_14 <= 6'he == index_addr | d_14;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_14 <= _GEN_2418;
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_15 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_15 <= 6'hf == index_addr | d_15;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_15 <= _GEN_2419;
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_16 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_16 <= 6'h10 == index_addr | d_16;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_16 <= _GEN_2420;
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_17 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_17 <= 6'h11 == index_addr | d_17;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_17 <= _GEN_2421;
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_18 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_18 <= 6'h12 == index_addr | d_18;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_18 <= _GEN_2422;
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_19 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_19 <= 6'h13 == index_addr | d_19;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_19 <= _GEN_2423;
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_20 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_20 <= 6'h14 == index_addr | d_20;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_20 <= _GEN_2424;
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_21 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_21 <= 6'h15 == index_addr | d_21;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_21 <= _GEN_2425;
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_22 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_22 <= 6'h16 == index_addr | d_22;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_22 <= _GEN_2426;
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_23 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_23 <= 6'h17 == index_addr | d_23;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_23 <= _GEN_2427;
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_24 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_24 <= 6'h18 == index_addr | d_24;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_24 <= _GEN_2428;
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_25 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_25 <= 6'h19 == index_addr | d_25;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_25 <= _GEN_2429;
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_26 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_26 <= 6'h1a == index_addr | d_26;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_26 <= _GEN_2430;
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_27 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_27 <= 6'h1b == index_addr | d_27;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_27 <= _GEN_2431;
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_28 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_28 <= 6'h1c == index_addr | d_28;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_28 <= _GEN_2432;
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_29 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_29 <= 6'h1d == index_addr | d_29;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_29 <= _GEN_2433;
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_30 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_30 <= 6'h1e == index_addr | d_30;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_30 <= _GEN_2434;
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_31 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_31 <= 6'h1f == index_addr | d_31;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_31 <= _GEN_2435;
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_32 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_32 <= 6'h20 == index_addr | d_32;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_32 <= _GEN_2436;
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_33 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_33 <= 6'h21 == index_addr | d_33;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_33 <= _GEN_2437;
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_34 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_34 <= 6'h22 == index_addr | d_34;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_34 <= _GEN_2438;
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_35 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_35 <= 6'h23 == index_addr | d_35;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_35 <= _GEN_2439;
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_36 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_36 <= 6'h24 == index_addr | d_36;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_36 <= _GEN_2440;
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_37 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_37 <= 6'h25 == index_addr | d_37;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_37 <= _GEN_2441;
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_38 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_38 <= 6'h26 == index_addr | d_38;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_38 <= _GEN_2442;
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_39 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_39 <= 6'h27 == index_addr | d_39;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_39 <= _GEN_2443;
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_40 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_40 <= 6'h28 == index_addr | d_40;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_40 <= _GEN_2444;
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_41 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_41 <= 6'h29 == index_addr | d_41;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_41 <= _GEN_2445;
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_42 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_42 <= 6'h2a == index_addr | d_42;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_42 <= _GEN_2446;
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_43 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_43 <= 6'h2b == index_addr | d_43;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_43 <= _GEN_2447;
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_44 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_44 <= 6'h2c == index_addr | d_44;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_44 <= _GEN_2448;
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_45 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_45 <= 6'h2d == index_addr | d_45;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_45 <= _GEN_2449;
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_46 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_46 <= 6'h2e == index_addr | d_46;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_46 <= _GEN_2450;
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_47 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_47 <= 6'h2f == index_addr | d_47;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_47 <= _GEN_2451;
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_48 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_48 <= 6'h30 == index_addr | d_48;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_48 <= _GEN_2452;
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_49 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_49 <= 6'h31 == index_addr | d_49;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_49 <= _GEN_2453;
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_50 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_50 <= 6'h32 == index_addr | d_50;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_50 <= _GEN_2454;
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_51 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_51 <= 6'h33 == index_addr | d_51;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_51 <= _GEN_2455;
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_52 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_52 <= 6'h34 == index_addr | d_52;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_52 <= _GEN_2456;
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_53 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_53 <= 6'h35 == index_addr | d_53;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_53 <= _GEN_2457;
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_54 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_54 <= 6'h36 == index_addr | d_54;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_54 <= _GEN_2458;
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_55 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_55 <= 6'h37 == index_addr | d_55;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_55 <= _GEN_2459;
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_56 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_56 <= 6'h38 == index_addr | d_56;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_56 <= _GEN_2460;
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_57 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_57 <= 6'h39 == index_addr | d_57;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_57 <= _GEN_2461;
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_58 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_58 <= 6'h3a == index_addr | d_58;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_58 <= _GEN_2462;
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_59 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_59 <= 6'h3b == index_addr | d_59;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_59 <= _GEN_2463;
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_60 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_60 <= 6'h3c == index_addr | d_60;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_60 <= _GEN_2464;
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_61 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_61 <= 6'h3d == index_addr | d_61;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_61 <= _GEN_2465;
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_62 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_62 <= 6'h3e == index_addr | d_62;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_62 <= _GEN_2466;
      end
    end
    if (reset) begin // @[DCache.scala 335:25]
      d_63 <= 1'h0; // @[DCache.scala 335:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_17) begin // @[DCache.scala 451:36]
        d_63 <= 6'h3f == index_addr | d_63;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      if (!(_T_3)) begin // @[Conditional.scala 39:67]
        d_63 <= _GEN_2467;
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_0 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_0 <= _GEN_2276;
        end
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_1 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_1 <= _GEN_2277;
        end
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_2 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_2 <= _GEN_2278;
        end
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_3 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_3 <= _GEN_2279;
        end
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_4 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_4 <= _GEN_2280;
        end
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_5 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_5 <= _GEN_2281;
        end
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_6 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_6 <= _GEN_2282;
        end
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_7 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_7 <= _GEN_2283;
        end
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_8 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_8 <= _GEN_2284;
        end
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_9 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_9 <= _GEN_2285;
        end
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_10 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_10 <= _GEN_2286;
        end
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_11 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_11 <= _GEN_2287;
        end
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_12 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_12 <= _GEN_2288;
        end
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_13 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_13 <= _GEN_2289;
        end
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_14 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_14 <= _GEN_2290;
        end
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_15 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_15 <= _GEN_2291;
        end
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_16 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_16 <= _GEN_2292;
        end
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_17 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_17 <= _GEN_2293;
        end
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_18 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_18 <= _GEN_2294;
        end
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_19 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_19 <= _GEN_2295;
        end
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_20 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_20 <= _GEN_2296;
        end
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_21 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_21 <= _GEN_2297;
        end
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_22 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_22 <= _GEN_2298;
        end
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_23 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_23 <= _GEN_2299;
        end
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_24 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_24 <= _GEN_2300;
        end
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_25 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_25 <= _GEN_2301;
        end
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_26 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_26 <= _GEN_2302;
        end
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_27 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_27 <= _GEN_2303;
        end
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_28 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_28 <= _GEN_2304;
        end
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_29 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_29 <= _GEN_2305;
        end
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_30 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_30 <= _GEN_2306;
        end
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_31 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_31 <= _GEN_2307;
        end
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_32 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_32 <= _GEN_2308;
        end
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_33 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_33 <= _GEN_2309;
        end
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_34 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_34 <= _GEN_2310;
        end
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_35 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_35 <= _GEN_2311;
        end
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_36 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_36 <= _GEN_2312;
        end
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_37 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_37 <= _GEN_2313;
        end
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_38 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_38 <= _GEN_2314;
        end
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_39 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_39 <= _GEN_2315;
        end
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_40 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_40 <= _GEN_2316;
        end
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_41 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_41 <= _GEN_2317;
        end
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_42 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_42 <= _GEN_2318;
        end
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_43 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_43 <= _GEN_2319;
        end
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_44 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_44 <= _GEN_2320;
        end
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_45 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_45 <= _GEN_2321;
        end
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_46 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_46 <= _GEN_2322;
        end
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_47 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_47 <= _GEN_2323;
        end
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_48 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_48 <= _GEN_2324;
        end
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_49 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_49 <= _GEN_2325;
        end
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_50 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_50 <= _GEN_2326;
        end
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_51 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_51 <= _GEN_2327;
        end
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_52 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_52 <= _GEN_2328;
        end
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_53 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_53 <= _GEN_2329;
        end
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_54 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_54 <= _GEN_2330;
        end
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_55 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_55 <= _GEN_2331;
        end
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_56 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_56 <= _GEN_2332;
        end
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_57 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_57 <= _GEN_2333;
        end
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_58 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_58 <= _GEN_2334;
        end
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_59 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_59 <= _GEN_2335;
        end
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_60 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_60 <= _GEN_2336;
        end
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_61 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_61 <= _GEN_2337;
        end
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_62 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_62 <= _GEN_2338;
        end
      end
    end
    if (reset) begin // @[DCache.scala 337:25]
      tag_63 <= 52'h0; // @[DCache.scala 337:25]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          tag_63 <= _GEN_2339;
        end
      end
    end
    if (reset) begin // @[DCache.scala 347:24]
      state <= 4'h0; // @[DCache.scala 347:24]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (miss & io_dmem_en) begin // @[DCache.scala 356:37]
        if (dirty) begin // @[DCache.scala 356:50]
          state <= 4'h1;
        end else begin
          state <= 4'h4;
        end
      end else if (io_fence_req) begin // @[DCache.scala 355:31]
        state <= 4'h7; // @[DCache.scala 355:38]
      end
    end else if (_T_2) begin // @[Conditional.scala 39:67]
      state <= 4'h2; // @[DCache.scala 359:19]
    end else if (_T_3) begin // @[Conditional.scala 39:67]
      state <= 4'h3; // @[DCache.scala 362:19]
    end else begin
      state <= _GEN_143;
    end
    if (reset) begin // @[DCache.scala 350:28]
      fence_reg <= 6'h0; // @[DCache.scala 350:28]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          fence_reg <= _GEN_2468;
        end
      end
    end
    if (reset) begin // @[Reg.scala 27:20]
      addr_stay <= 64'h0; // @[Reg.scala 27:20]
    end else if (_addr_stay_T_1) begin // @[Reg.scala 28:19]
      addr_stay <= addr; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      op_stay <= 1'h0; // @[Reg.scala 27:20]
    end else if (_addr_stay_T_1) begin // @[Reg.scala 28:19]
      op_stay <= io_dmem_op; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      wdata_stay <= 64'h0; // @[Reg.scala 27:20]
    end else if (_addr_stay_T_1) begin // @[Reg.scala 28:19]
      wdata_stay <= io_dmem_wdata; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      wmask_stay <= 8'h0; // @[Reg.scala 27:20]
    end else if (_addr_stay_T_1) begin // @[Reg.scala 28:19]
      wmask_stay <= io_dmem_wmask; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[DCache.scala 434:30]
      axi_wbuffer <= 512'h0; // @[DCache.scala 434:30]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (_T_3) begin // @[Conditional.scala 39:67]
          axi_wbuffer <= SRam_4k_io_rdata; // @[DCache.scala 459:29]
        end
      end
    end
    if (reset) begin // @[DCache.scala 435:30]
      axi_rbuffer <= 512'h0; // @[DCache.scala 435:30]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          axi_rbuffer <= _GEN_2270;
        end
      end
    end
    if (reset) begin // @[DCache.scala 436:31]
      fence_buffer <= 512'h0; // @[DCache.scala 436:31]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (!(_T_3)) begin // @[Conditional.scala 39:67]
          fence_buffer <= _GEN_2469;
        end
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  v_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  v_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  v_2 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  v_3 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  v_4 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  v_5 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  v_6 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  v_7 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  v_8 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  v_9 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  v_10 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  v_11 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  v_12 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  v_13 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  v_14 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  v_15 = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  v_16 = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  v_17 = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  v_18 = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  v_19 = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  v_20 = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  v_21 = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  v_22 = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  v_23 = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  v_24 = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  v_25 = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  v_26 = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  v_27 = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  v_28 = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  v_29 = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  v_30 = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  v_31 = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  v_32 = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  v_33 = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  v_34 = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  v_35 = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  v_36 = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  v_37 = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  v_38 = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  v_39 = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  v_40 = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  v_41 = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  v_42 = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  v_43 = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  v_44 = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  v_45 = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  v_46 = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  v_47 = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  v_48 = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  v_49 = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  v_50 = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  v_51 = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  v_52 = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  v_53 = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  v_54 = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  v_55 = _RAND_55[0:0];
  _RAND_56 = {1{`RANDOM}};
  v_56 = _RAND_56[0:0];
  _RAND_57 = {1{`RANDOM}};
  v_57 = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  v_58 = _RAND_58[0:0];
  _RAND_59 = {1{`RANDOM}};
  v_59 = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  v_60 = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  v_61 = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  v_62 = _RAND_62[0:0];
  _RAND_63 = {1{`RANDOM}};
  v_63 = _RAND_63[0:0];
  _RAND_64 = {1{`RANDOM}};
  d_0 = _RAND_64[0:0];
  _RAND_65 = {1{`RANDOM}};
  d_1 = _RAND_65[0:0];
  _RAND_66 = {1{`RANDOM}};
  d_2 = _RAND_66[0:0];
  _RAND_67 = {1{`RANDOM}};
  d_3 = _RAND_67[0:0];
  _RAND_68 = {1{`RANDOM}};
  d_4 = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  d_5 = _RAND_69[0:0];
  _RAND_70 = {1{`RANDOM}};
  d_6 = _RAND_70[0:0];
  _RAND_71 = {1{`RANDOM}};
  d_7 = _RAND_71[0:0];
  _RAND_72 = {1{`RANDOM}};
  d_8 = _RAND_72[0:0];
  _RAND_73 = {1{`RANDOM}};
  d_9 = _RAND_73[0:0];
  _RAND_74 = {1{`RANDOM}};
  d_10 = _RAND_74[0:0];
  _RAND_75 = {1{`RANDOM}};
  d_11 = _RAND_75[0:0];
  _RAND_76 = {1{`RANDOM}};
  d_12 = _RAND_76[0:0];
  _RAND_77 = {1{`RANDOM}};
  d_13 = _RAND_77[0:0];
  _RAND_78 = {1{`RANDOM}};
  d_14 = _RAND_78[0:0];
  _RAND_79 = {1{`RANDOM}};
  d_15 = _RAND_79[0:0];
  _RAND_80 = {1{`RANDOM}};
  d_16 = _RAND_80[0:0];
  _RAND_81 = {1{`RANDOM}};
  d_17 = _RAND_81[0:0];
  _RAND_82 = {1{`RANDOM}};
  d_18 = _RAND_82[0:0];
  _RAND_83 = {1{`RANDOM}};
  d_19 = _RAND_83[0:0];
  _RAND_84 = {1{`RANDOM}};
  d_20 = _RAND_84[0:0];
  _RAND_85 = {1{`RANDOM}};
  d_21 = _RAND_85[0:0];
  _RAND_86 = {1{`RANDOM}};
  d_22 = _RAND_86[0:0];
  _RAND_87 = {1{`RANDOM}};
  d_23 = _RAND_87[0:0];
  _RAND_88 = {1{`RANDOM}};
  d_24 = _RAND_88[0:0];
  _RAND_89 = {1{`RANDOM}};
  d_25 = _RAND_89[0:0];
  _RAND_90 = {1{`RANDOM}};
  d_26 = _RAND_90[0:0];
  _RAND_91 = {1{`RANDOM}};
  d_27 = _RAND_91[0:0];
  _RAND_92 = {1{`RANDOM}};
  d_28 = _RAND_92[0:0];
  _RAND_93 = {1{`RANDOM}};
  d_29 = _RAND_93[0:0];
  _RAND_94 = {1{`RANDOM}};
  d_30 = _RAND_94[0:0];
  _RAND_95 = {1{`RANDOM}};
  d_31 = _RAND_95[0:0];
  _RAND_96 = {1{`RANDOM}};
  d_32 = _RAND_96[0:0];
  _RAND_97 = {1{`RANDOM}};
  d_33 = _RAND_97[0:0];
  _RAND_98 = {1{`RANDOM}};
  d_34 = _RAND_98[0:0];
  _RAND_99 = {1{`RANDOM}};
  d_35 = _RAND_99[0:0];
  _RAND_100 = {1{`RANDOM}};
  d_36 = _RAND_100[0:0];
  _RAND_101 = {1{`RANDOM}};
  d_37 = _RAND_101[0:0];
  _RAND_102 = {1{`RANDOM}};
  d_38 = _RAND_102[0:0];
  _RAND_103 = {1{`RANDOM}};
  d_39 = _RAND_103[0:0];
  _RAND_104 = {1{`RANDOM}};
  d_40 = _RAND_104[0:0];
  _RAND_105 = {1{`RANDOM}};
  d_41 = _RAND_105[0:0];
  _RAND_106 = {1{`RANDOM}};
  d_42 = _RAND_106[0:0];
  _RAND_107 = {1{`RANDOM}};
  d_43 = _RAND_107[0:0];
  _RAND_108 = {1{`RANDOM}};
  d_44 = _RAND_108[0:0];
  _RAND_109 = {1{`RANDOM}};
  d_45 = _RAND_109[0:0];
  _RAND_110 = {1{`RANDOM}};
  d_46 = _RAND_110[0:0];
  _RAND_111 = {1{`RANDOM}};
  d_47 = _RAND_111[0:0];
  _RAND_112 = {1{`RANDOM}};
  d_48 = _RAND_112[0:0];
  _RAND_113 = {1{`RANDOM}};
  d_49 = _RAND_113[0:0];
  _RAND_114 = {1{`RANDOM}};
  d_50 = _RAND_114[0:0];
  _RAND_115 = {1{`RANDOM}};
  d_51 = _RAND_115[0:0];
  _RAND_116 = {1{`RANDOM}};
  d_52 = _RAND_116[0:0];
  _RAND_117 = {1{`RANDOM}};
  d_53 = _RAND_117[0:0];
  _RAND_118 = {1{`RANDOM}};
  d_54 = _RAND_118[0:0];
  _RAND_119 = {1{`RANDOM}};
  d_55 = _RAND_119[0:0];
  _RAND_120 = {1{`RANDOM}};
  d_56 = _RAND_120[0:0];
  _RAND_121 = {1{`RANDOM}};
  d_57 = _RAND_121[0:0];
  _RAND_122 = {1{`RANDOM}};
  d_58 = _RAND_122[0:0];
  _RAND_123 = {1{`RANDOM}};
  d_59 = _RAND_123[0:0];
  _RAND_124 = {1{`RANDOM}};
  d_60 = _RAND_124[0:0];
  _RAND_125 = {1{`RANDOM}};
  d_61 = _RAND_125[0:0];
  _RAND_126 = {1{`RANDOM}};
  d_62 = _RAND_126[0:0];
  _RAND_127 = {1{`RANDOM}};
  d_63 = _RAND_127[0:0];
  _RAND_128 = {2{`RANDOM}};
  tag_0 = _RAND_128[51:0];
  _RAND_129 = {2{`RANDOM}};
  tag_1 = _RAND_129[51:0];
  _RAND_130 = {2{`RANDOM}};
  tag_2 = _RAND_130[51:0];
  _RAND_131 = {2{`RANDOM}};
  tag_3 = _RAND_131[51:0];
  _RAND_132 = {2{`RANDOM}};
  tag_4 = _RAND_132[51:0];
  _RAND_133 = {2{`RANDOM}};
  tag_5 = _RAND_133[51:0];
  _RAND_134 = {2{`RANDOM}};
  tag_6 = _RAND_134[51:0];
  _RAND_135 = {2{`RANDOM}};
  tag_7 = _RAND_135[51:0];
  _RAND_136 = {2{`RANDOM}};
  tag_8 = _RAND_136[51:0];
  _RAND_137 = {2{`RANDOM}};
  tag_9 = _RAND_137[51:0];
  _RAND_138 = {2{`RANDOM}};
  tag_10 = _RAND_138[51:0];
  _RAND_139 = {2{`RANDOM}};
  tag_11 = _RAND_139[51:0];
  _RAND_140 = {2{`RANDOM}};
  tag_12 = _RAND_140[51:0];
  _RAND_141 = {2{`RANDOM}};
  tag_13 = _RAND_141[51:0];
  _RAND_142 = {2{`RANDOM}};
  tag_14 = _RAND_142[51:0];
  _RAND_143 = {2{`RANDOM}};
  tag_15 = _RAND_143[51:0];
  _RAND_144 = {2{`RANDOM}};
  tag_16 = _RAND_144[51:0];
  _RAND_145 = {2{`RANDOM}};
  tag_17 = _RAND_145[51:0];
  _RAND_146 = {2{`RANDOM}};
  tag_18 = _RAND_146[51:0];
  _RAND_147 = {2{`RANDOM}};
  tag_19 = _RAND_147[51:0];
  _RAND_148 = {2{`RANDOM}};
  tag_20 = _RAND_148[51:0];
  _RAND_149 = {2{`RANDOM}};
  tag_21 = _RAND_149[51:0];
  _RAND_150 = {2{`RANDOM}};
  tag_22 = _RAND_150[51:0];
  _RAND_151 = {2{`RANDOM}};
  tag_23 = _RAND_151[51:0];
  _RAND_152 = {2{`RANDOM}};
  tag_24 = _RAND_152[51:0];
  _RAND_153 = {2{`RANDOM}};
  tag_25 = _RAND_153[51:0];
  _RAND_154 = {2{`RANDOM}};
  tag_26 = _RAND_154[51:0];
  _RAND_155 = {2{`RANDOM}};
  tag_27 = _RAND_155[51:0];
  _RAND_156 = {2{`RANDOM}};
  tag_28 = _RAND_156[51:0];
  _RAND_157 = {2{`RANDOM}};
  tag_29 = _RAND_157[51:0];
  _RAND_158 = {2{`RANDOM}};
  tag_30 = _RAND_158[51:0];
  _RAND_159 = {2{`RANDOM}};
  tag_31 = _RAND_159[51:0];
  _RAND_160 = {2{`RANDOM}};
  tag_32 = _RAND_160[51:0];
  _RAND_161 = {2{`RANDOM}};
  tag_33 = _RAND_161[51:0];
  _RAND_162 = {2{`RANDOM}};
  tag_34 = _RAND_162[51:0];
  _RAND_163 = {2{`RANDOM}};
  tag_35 = _RAND_163[51:0];
  _RAND_164 = {2{`RANDOM}};
  tag_36 = _RAND_164[51:0];
  _RAND_165 = {2{`RANDOM}};
  tag_37 = _RAND_165[51:0];
  _RAND_166 = {2{`RANDOM}};
  tag_38 = _RAND_166[51:0];
  _RAND_167 = {2{`RANDOM}};
  tag_39 = _RAND_167[51:0];
  _RAND_168 = {2{`RANDOM}};
  tag_40 = _RAND_168[51:0];
  _RAND_169 = {2{`RANDOM}};
  tag_41 = _RAND_169[51:0];
  _RAND_170 = {2{`RANDOM}};
  tag_42 = _RAND_170[51:0];
  _RAND_171 = {2{`RANDOM}};
  tag_43 = _RAND_171[51:0];
  _RAND_172 = {2{`RANDOM}};
  tag_44 = _RAND_172[51:0];
  _RAND_173 = {2{`RANDOM}};
  tag_45 = _RAND_173[51:0];
  _RAND_174 = {2{`RANDOM}};
  tag_46 = _RAND_174[51:0];
  _RAND_175 = {2{`RANDOM}};
  tag_47 = _RAND_175[51:0];
  _RAND_176 = {2{`RANDOM}};
  tag_48 = _RAND_176[51:0];
  _RAND_177 = {2{`RANDOM}};
  tag_49 = _RAND_177[51:0];
  _RAND_178 = {2{`RANDOM}};
  tag_50 = _RAND_178[51:0];
  _RAND_179 = {2{`RANDOM}};
  tag_51 = _RAND_179[51:0];
  _RAND_180 = {2{`RANDOM}};
  tag_52 = _RAND_180[51:0];
  _RAND_181 = {2{`RANDOM}};
  tag_53 = _RAND_181[51:0];
  _RAND_182 = {2{`RANDOM}};
  tag_54 = _RAND_182[51:0];
  _RAND_183 = {2{`RANDOM}};
  tag_55 = _RAND_183[51:0];
  _RAND_184 = {2{`RANDOM}};
  tag_56 = _RAND_184[51:0];
  _RAND_185 = {2{`RANDOM}};
  tag_57 = _RAND_185[51:0];
  _RAND_186 = {2{`RANDOM}};
  tag_58 = _RAND_186[51:0];
  _RAND_187 = {2{`RANDOM}};
  tag_59 = _RAND_187[51:0];
  _RAND_188 = {2{`RANDOM}};
  tag_60 = _RAND_188[51:0];
  _RAND_189 = {2{`RANDOM}};
  tag_61 = _RAND_189[51:0];
  _RAND_190 = {2{`RANDOM}};
  tag_62 = _RAND_190[51:0];
  _RAND_191 = {2{`RANDOM}};
  tag_63 = _RAND_191[51:0];
  _RAND_192 = {1{`RANDOM}};
  state = _RAND_192[3:0];
  _RAND_193 = {1{`RANDOM}};
  fence_reg = _RAND_193[5:0];
  _RAND_194 = {2{`RANDOM}};
  addr_stay = _RAND_194[63:0];
  _RAND_195 = {1{`RANDOM}};
  op_stay = _RAND_195[0:0];
  _RAND_196 = {2{`RANDOM}};
  wdata_stay = _RAND_196[63:0];
  _RAND_197 = {1{`RANDOM}};
  wmask_stay = _RAND_197[7:0];
  _RAND_198 = {16{`RANDOM}};
  axi_wbuffer = _RAND_198[511:0];
  _RAND_199 = {16{`RANDOM}};
  axi_rbuffer = _RAND_199[511:0];
  _RAND_200 = {16{`RANDOM}};
  fence_buffer = _RAND_200[511:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_040596_ClintReg(
  input         clock,
  input         reset,
  input         io_mem_en,
  input         io_mem_op,
  input  [63:0] io_mem_addr,
  input  [63:0] io_mem_wdata,
  input  [7:0]  io_mem_wmask,
  output [63:0] io_mem_rdata
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [63:0] _RAND_5;
  reg [63:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  reg  en; // @[MMIO.scala 117:26]
  reg  op; // @[MMIO.scala 118:26]
  reg [63:0] addr; // @[MMIO.scala 119:26]
  reg [63:0] wdata; // @[MMIO.scala 120:26]
  reg [7:0] wm; // @[MMIO.scala 121:26]
  reg [63:0] mtime; // @[MMIO.scala 124:24]
  reg [63:0] mtimecmp; // @[MMIO.scala 125:27]
  wire [7:0] mask64_hi_hi_hi = wm[7] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] mask64_hi_hi_lo = wm[6] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] mask64_hi_lo_hi = wm[5] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] mask64_hi_lo_lo = wm[4] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] mask64_lo_hi_hi = wm[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] mask64_lo_hi_lo = wm[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] mask64_lo_lo_hi = wm[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] mask64_lo_lo_lo = wm[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [63:0] mask64 = {mask64_hi_hi_hi,mask64_hi_hi_lo,mask64_hi_lo_hi,mask64_hi_lo_lo,mask64_lo_hi_hi,mask64_lo_hi_lo,
    mask64_lo_lo_hi,mask64_lo_lo_lo}; // @[Cat.scala 30:58]
  wire [63:0] _mtime_update_T = ~mask64; // @[MMIO.scala 129:34]
  wire [63:0] _mtime_update_T_1 = mtime & _mtime_update_T; // @[MMIO.scala 129:31]
  wire [63:0] _mtime_update_T_2 = mask64 & wdata; // @[MMIO.scala 129:54]
  wire [63:0] mtime_update = _mtime_update_T_1 | _mtime_update_T_2; // @[MMIO.scala 129:44]
  wire [63:0] _mtimecmp_update_T_1 = mtimecmp & _mtime_update_T; // @[MMIO.scala 130:37]
  wire [63:0] mtimecmp_update = _mtimecmp_update_T_1 | _mtime_update_T_2; // @[MMIO.scala 130:50]
  wire  sel_hi = addr == 64'h2004000; // @[MMIO.scala 132:24]
  wire  sel_lo = addr == 64'h200bff8; // @[MMIO.scala 132:48]
  wire [1:0] sel = {sel_hi,sel_lo}; // @[Cat.scala 30:58]
  wire  _T = en & op; // @[MMIO.scala 142:13]
  wire [63:0] _mtime_T_1 = mtime + 64'h1; // @[MMIO.scala 145:24]
  wire [63:0] _io_mem_rdata_T_1 = 2'h1 == sel ? mtime : 64'h0; // @[Mux.scala 80:57]
  wire [63:0] _io_mem_rdata_T_3 = 2'h2 == sel ? mtimecmp : _io_mem_rdata_T_1; // @[Mux.scala 80:57]
  assign io_mem_rdata = en & ~op ? _io_mem_rdata_T_3 : 64'h0; // @[MMIO.scala 152:20 MMIO.scala 153:22 MMIO.scala 158:29]
  always @(posedge clock) begin
    if (reset) begin // @[MMIO.scala 117:26]
      en <= 1'h0; // @[MMIO.scala 117:26]
    end else begin
      en <= io_mem_en; // @[MMIO.scala 117:26]
    end
    if (reset) begin // @[MMIO.scala 118:26]
      op <= 1'h0; // @[MMIO.scala 118:26]
    end else begin
      op <= io_mem_op; // @[MMIO.scala 118:26]
    end
    if (reset) begin // @[MMIO.scala 119:26]
      addr <= 64'h0; // @[MMIO.scala 119:26]
    end else begin
      addr <= io_mem_addr; // @[MMIO.scala 119:26]
    end
    if (reset) begin // @[MMIO.scala 120:26]
      wdata <= 64'h0; // @[MMIO.scala 120:26]
    end else begin
      wdata <= io_mem_wdata; // @[MMIO.scala 120:26]
    end
    if (reset) begin // @[MMIO.scala 121:26]
      wm <= 8'h0; // @[MMIO.scala 121:26]
    end else begin
      wm <= io_mem_wmask; // @[MMIO.scala 121:26]
    end
    if (reset) begin // @[MMIO.scala 124:24]
      mtime <= 64'h0; // @[MMIO.scala 124:24]
    end else if (en & op & sel == 2'h1) begin // @[MMIO.scala 142:38]
      mtime <= mtime_update; // @[MMIO.scala 142:45]
    end else begin
      mtime <= _mtime_T_1; // @[MMIO.scala 145:15]
    end
    if (reset) begin // @[MMIO.scala 125:27]
      mtimecmp <= 64'h0; // @[MMIO.scala 125:27]
    end else if (_T & sel == 2'h2) begin // @[MMIO.scala 148:38]
      mtimecmp <= mtimecmp_update; // @[MMIO.scala 148:48]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  en = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  op = _RAND_1[0:0];
  _RAND_2 = {2{`RANDOM}};
  addr = _RAND_2[63:0];
  _RAND_3 = {2{`RANDOM}};
  wdata = _RAND_3[63:0];
  _RAND_4 = {1{`RANDOM}};
  wm = _RAND_4[7:0];
  _RAND_5 = {2{`RANDOM}};
  mtime = _RAND_5[63:0];
  _RAND_6 = {2{`RANDOM}};
  mtimecmp = _RAND_6[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_040596_DCacheBypass(
  input         clock,
  input         reset,
  input         io_dmem_en,
  input         io_dmem_op,
  input  [63:0] io_dmem_addr,
  input  [63:0] io_dmem_wdata,
  input  [7:0]  io_dmem_wmask,
  input  [31:0] io_dmem_transfer,
  output        io_dmem_ok,
  output [63:0] io_dmem_rdata,
  output        io_axi_req,
  output [31:0] io_axi_raddr,
  input         io_axi_rvalid,
  input  [63:0] io_axi_rdata,
  output        io_axi_weq,
  output [31:0] io_axi_waddr,
  output [63:0] io_axi_wdata,
  output [7:0]  io_axi_wmask,
  input         io_axi_wdone,
  output [2:0]  io_axi_transfer
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] addr; // @[CacheBypass.scala 68:26]
  reg [63:0] wdata; // @[CacheBypass.scala 69:26]
  reg [7:0] wmask; // @[CacheBypass.scala 70:26]
  reg [63:0] rdata; // @[CacheBypass.scala 71:26]
  reg [2:0] transfer; // @[CacheBypass.scala 72:27]
  reg [1:0] state; // @[CacheBypass.scala 75:24]
  wire  _T = 2'h0 == state; // @[Conditional.scala 37:30]
  wire  _T_4 = 2'h1 == state; // @[Conditional.scala 37:30]
  wire  _T_5 = 2'h2 == state; // @[Conditional.scala 37:30]
  wire  _T_6 = 2'h3 == state; // @[Conditional.scala 37:30]
  wire [1:0] _GEN_3 = io_axi_wdone ? 2'h0 : state; // @[CacheBypass.scala 89:32 CacheBypass.scala 89:39 CacheBypass.scala 75:24]
  wire [1:0] _GEN_4 = _T_6 ? _GEN_3 : state; // @[Conditional.scala 39:67 CacheBypass.scala 75:24]
  wire [63:0] _GEN_9 = state == 2'h0 & io_dmem_en ? io_dmem_addr : {{32'd0}, addr}; // @[CacheBypass.scala 93:39 CacheBypass.scala 95:17 CacheBypass.scala 68:26]
  wire [31:0] _GEN_12 = state == 2'h0 & io_dmem_en ? io_dmem_transfer : {{29'd0}, transfer}; // @[CacheBypass.scala 93:39 CacheBypass.scala 98:18 CacheBypass.scala 72:27]
  wire [38:0] _io_axi_raddr_T = 39'hffffffff << transfer; // @[CacheBypass.scala 103:45]
  wire [38:0] _GEN_13 = {{7'd0}, addr}; // @[CacheBypass.scala 103:29]
  wire [38:0] _io_axi_raddr_T_1 = _GEN_13 & _io_axi_raddr_T; // @[CacheBypass.scala 103:29]
  assign io_dmem_ok = state == 2'h0; // @[CacheBypass.scala 113:30]
  assign io_dmem_rdata = rdata; // @[CacheBypass.scala 112:21]
  assign io_axi_req = state == 2'h1; // @[CacheBypass.scala 102:30]
  assign io_axi_raddr = _io_axi_raddr_T_1[31:0]; // @[CacheBypass.scala 103:21]
  assign io_axi_weq = state == 2'h3; // @[CacheBypass.scala 105:30]
  assign io_axi_waddr = _io_axi_raddr_T_1[31:0]; // @[CacheBypass.scala 106:21]
  assign io_axi_wdata = wdata; // @[CacheBypass.scala 107:21]
  assign io_axi_wmask = wmask; // @[CacheBypass.scala 108:21]
  assign io_axi_transfer = transfer; // @[CacheBypass.scala 110:21]
  always @(posedge clock) begin
    if (reset) begin // @[CacheBypass.scala 68:26]
      addr <= 32'h0; // @[CacheBypass.scala 68:26]
    end else begin
      addr <= _GEN_9[31:0];
    end
    if (reset) begin // @[CacheBypass.scala 69:26]
      wdata <= 64'h0; // @[CacheBypass.scala 69:26]
    end else if (state == 2'h0 & io_dmem_en) begin // @[CacheBypass.scala 93:39]
      wdata <= io_dmem_wdata; // @[CacheBypass.scala 96:17]
    end
    if (reset) begin // @[CacheBypass.scala 70:26]
      wmask <= 8'h0; // @[CacheBypass.scala 70:26]
    end else if (state == 2'h0 & io_dmem_en) begin // @[CacheBypass.scala 93:39]
      wmask <= io_dmem_wmask; // @[CacheBypass.scala 97:17]
    end
    if (reset) begin // @[CacheBypass.scala 71:26]
      rdata <= 64'h0; // @[CacheBypass.scala 71:26]
    end else if (state == 2'h2) begin // @[CacheBypass.scala 100:17]
      rdata <= io_axi_rdata;
    end
    if (reset) begin // @[CacheBypass.scala 72:27]
      transfer <= 3'h0; // @[CacheBypass.scala 72:27]
    end else begin
      transfer <= _GEN_12[2:0];
    end
    if (reset) begin // @[CacheBypass.scala 75:24]
      state <= 2'h0; // @[CacheBypass.scala 75:24]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (io_dmem_en & ~io_dmem_op) begin // @[CacheBypass.scala 79:45]
        state <= 2'h1; // @[CacheBypass.scala 79:52]
      end else if (io_dmem_en & io_dmem_op) begin // @[CacheBypass.scala 80:49]
        state <= 2'h3; // @[CacheBypass.scala 80:56]
      end
    end else if (_T_4) begin // @[Conditional.scala 39:67]
      if (io_axi_rvalid) begin // @[CacheBypass.scala 83:33]
        state <= 2'h2; // @[CacheBypass.scala 83:40]
      end
    end else if (_T_5) begin // @[Conditional.scala 39:67]
      state <= 2'h0; // @[CacheBypass.scala 86:19]
    end else begin
      state <= _GEN_4;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  addr = _RAND_0[31:0];
  _RAND_1 = {2{`RANDOM}};
  wdata = _RAND_1[63:0];
  _RAND_2 = {1{`RANDOM}};
  wmask = _RAND_2[7:0];
  _RAND_3 = {2{`RANDOM}};
  rdata = _RAND_3[63:0];
  _RAND_4 = {1{`RANDOM}};
  transfer = _RAND_4[2:0];
  _RAND_5 = {1{`RANDOM}};
  state = _RAND_5[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_040596_AXI(
  input          clock,
  input          reset,
  input          io_out_aw_ready,
  output         io_out_aw_valid,
  output [7:0]   io_out_aw_bits_len,
  output [2:0]   io_out_aw_bits_size,
  output [63:0]  io_out_aw_bits_addr,
  input          io_out_w_ready,
  output         io_out_w_valid,
  output [63:0]  io_out_w_bits_data,
  output [7:0]   io_out_w_bits_strb,
  output         io_out_w_bits_last,
  output         io_out_b_ready,
  input          io_out_b_valid,
  input          io_out_ar_ready,
  output         io_out_ar_valid,
  output [7:0]   io_out_ar_bits_len,
  output [2:0]   io_out_ar_bits_size,
  output [63:0]  io_out_ar_bits_addr,
  output         io_out_r_ready,
  input          io_out_r_valid,
  input  [63:0]  io_out_r_bits_data,
  input          io_out_r_bits_last,
  input          io_icacheio_req,
  input  [63:0]  io_icacheio_addr,
  output         io_icacheio_valid,
  output [511:0] io_icacheio_data,
  input          io_dcacheio_req,
  input  [63:0]  io_dcacheio_raddr,
  output         io_dcacheio_rvalid,
  output [511:0] io_dcacheio_rdata,
  input          io_dcacheio_weq,
  input  [63:0]  io_dcacheio_waddr,
  input  [511:0] io_dcacheio_wdata,
  output         io_dcacheio_wdone,
  input          io_icacheBypassIO_req,
  input  [31:0]  io_icacheBypassIO_addr,
  output         io_icacheBypassIO_valid,
  output [63:0]  io_icacheBypassIO_data,
  input          io_dcacheBypassIO_req,
  input  [31:0]  io_dcacheBypassIO_raddr,
  output         io_dcacheBypassIO_rvalid,
  output [63:0]  io_dcacheBypassIO_rdata,
  input          io_dcacheBypassIO_weq,
  input  [31:0]  io_dcacheBypassIO_waddr,
  input  [63:0]  io_dcacheBypassIO_wdata,
  input  [7:0]   io_dcacheBypassIO_wmask,
  output         io_dcacheBypassIO_wdone,
  input  [2:0]   io_dcacheBypassIO_transfer
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [63:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [63:0] _RAND_7;
  reg [63:0] _RAND_8;
  reg [63:0] _RAND_9;
  reg [63:0] _RAND_10;
  reg [63:0] _RAND_11;
  reg [63:0] _RAND_12;
  reg [63:0] _RAND_13;
  reg [63:0] _RAND_14;
  reg [63:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] ibuffer_0; // @[AXI.scala 107:30]
  reg [63:0] ibuffer_1; // @[AXI.scala 107:30]
  reg [63:0] ibuffer_2; // @[AXI.scala 107:30]
  reg [63:0] ibuffer_3; // @[AXI.scala 107:30]
  reg [63:0] ibuffer_4; // @[AXI.scala 107:30]
  reg [63:0] ibuffer_5; // @[AXI.scala 107:30]
  reg [63:0] ibuffer_6; // @[AXI.scala 107:30]
  reg [63:0] ibuffer_7; // @[AXI.scala 107:30]
  reg [63:0] drbuffer_0; // @[AXI.scala 108:30]
  reg [63:0] drbuffer_1; // @[AXI.scala 108:30]
  reg [63:0] drbuffer_2; // @[AXI.scala 108:30]
  reg [63:0] drbuffer_3; // @[AXI.scala 108:30]
  reg [63:0] drbuffer_4; // @[AXI.scala 108:30]
  reg [63:0] drbuffer_5; // @[AXI.scala 108:30]
  reg [63:0] drbuffer_6; // @[AXI.scala 108:30]
  reg [63:0] drbuffer_7; // @[AXI.scala 108:30]
  reg [5:0] icnt; // @[AXI.scala 109:30]
  reg [5:0] drcnt; // @[AXI.scala 110:30]
  reg [5:0] dwcnt; // @[AXI.scala 111:30]
  reg [3:0] rstate; // @[AXI.scala 115:25]
  reg [2:0] wstate; // @[AXI.scala 116:25]
  reg  r_bypass; // @[AXI.scala 117:27]
  reg  w_bypass; // @[AXI.scala 118:27]
  wire  _T = 4'h0 == rstate; // @[Conditional.scala 37:30]
  wire [3:0] _GEN_0 = io_dcacheBypassIO_req ? 4'h5 : rstate; // @[AXI.scala 135:42 AXI.scala 136:24 AXI.scala 115:25]
  wire  _GEN_1 = io_dcacheBypassIO_req | r_bypass; // @[AXI.scala 135:42 AXI.scala 137:26 AXI.scala 117:27]
  wire [3:0] _GEN_2 = io_icacheBypassIO_req ? 4'h1 : _GEN_0; // @[AXI.scala 131:42 AXI.scala 132:24]
  wire  _GEN_3 = io_icacheBypassIO_req | _GEN_1; // @[AXI.scala 131:42 AXI.scala 133:26]
  wire  _T_1 = 4'h1 == rstate; // @[Conditional.scala 37:30]
  wire  _T_2 = 4'h2 == rstate; // @[Conditional.scala 37:30]
  wire [3:0] _GEN_9 = io_out_r_valid ? 4'h3 : rstate; // @[AXI.scala 145:31 AXI.scala 145:39 AXI.scala 115:25]
  wire  _T_3 = 4'h3 == rstate; // @[Conditional.scala 37:30]
  wire  _T_4 = io_out_r_valid & io_out_r_bits_last; // @[AXI.scala 148:30]
  wire [3:0] _GEN_10 = io_out_r_valid & io_out_r_bits_last ? 4'h4 : rstate; // @[AXI.scala 148:50 AXI.scala 148:58 AXI.scala 115:25]
  wire  _T_5 = 4'h4 == rstate; // @[Conditional.scala 37:30]
  wire  _T_6 = 4'h5 == rstate; // @[Conditional.scala 37:30]
  wire [3:0] _GEN_11 = io_out_ar_ready ? 4'h6 : rstate; // @[AXI.scala 155:32 AXI.scala 155:40 AXI.scala 115:25]
  wire  _T_7 = 4'h6 == rstate; // @[Conditional.scala 37:30]
  wire [3:0] _GEN_12 = io_out_r_valid ? 4'h7 : rstate; // @[AXI.scala 158:31 AXI.scala 158:39 AXI.scala 115:25]
  wire  _T_8 = 4'h7 == rstate; // @[Conditional.scala 37:30]
  wire [3:0] _GEN_13 = _T_4 ? 4'h8 : rstate; // @[AXI.scala 161:50 AXI.scala 161:58 AXI.scala 115:25]
  wire  _T_10 = 4'h8 == rstate; // @[Conditional.scala 37:30]
  wire [3:0] _GEN_14 = _T_10 ? 4'h0 : rstate; // @[Conditional.scala 39:67 AXI.scala 164:20 AXI.scala 115:25]
  wire [3:0] _GEN_15 = _T_8 ? _GEN_13 : _GEN_14; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_16 = _T_7 ? _GEN_12 : _GEN_15; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_17 = _T_6 ? _GEN_11 : _GEN_16; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_18 = _T_5 ? 4'h0 : _GEN_17; // @[Conditional.scala 39:67 AXI.scala 151:20]
  wire [3:0] _GEN_19 = _T_3 ? _GEN_10 : _GEN_18; // @[Conditional.scala 39:67]
  wire  _T_11 = 3'h0 == wstate; // @[Conditional.scala 37:30]
  wire  _GEN_25 = io_dcacheBypassIO_weq | w_bypass; // @[AXI.scala 175:42 AXI.scala 177:26 AXI.scala 118:27]
  wire  _T_12 = 3'h1 == wstate; // @[Conditional.scala 37:30]
  wire  _T_13 = 3'h2 == wstate; // @[Conditional.scala 37:30]
  wire [2:0] _GEN_29 = io_out_w_bits_last & io_out_w_ready ? 3'h3 : wstate; // @[AXI.scala 184:50 AXI.scala 184:58 AXI.scala 116:25]
  wire  _T_15 = 3'h3 == wstate; // @[Conditional.scala 37:30]
  wire [2:0] _GEN_30 = io_out_b_valid ? 3'h4 : wstate; // @[AXI.scala 187:31 AXI.scala 187:39 AXI.scala 116:25]
  wire  _T_16 = 3'h4 == wstate; // @[Conditional.scala 37:30]
  wire  _T_17 = ~io_out_b_valid; // @[AXI.scala 190:18]
  wire [2:0] _GEN_31 = ~io_out_b_valid ? 3'h0 : wstate; // @[AXI.scala 190:32 AXI.scala 190:40 AXI.scala 116:25]
  wire [2:0] _GEN_32 = _T_16 ? _GEN_31 : wstate; // @[Conditional.scala 39:67 AXI.scala 116:25]
  wire [2:0] _GEN_33 = _T_15 ? _GEN_30 : _GEN_32; // @[Conditional.scala 39:67]
  wire  _ibuffer_T = rstate == 4'h3; // @[AXI.scala 196:33]
  wire [63:0] _GEN_39 = 3'h1 == icnt[2:0] ? ibuffer_1 : ibuffer_0; // @[AXI.scala 196:25 AXI.scala 196:25]
  wire [63:0] _GEN_40 = 3'h2 == icnt[2:0] ? ibuffer_2 : _GEN_39; // @[AXI.scala 196:25 AXI.scala 196:25]
  wire [63:0] _GEN_41 = 3'h3 == icnt[2:0] ? ibuffer_3 : _GEN_40; // @[AXI.scala 196:25 AXI.scala 196:25]
  wire [63:0] _GEN_42 = 3'h4 == icnt[2:0] ? ibuffer_4 : _GEN_41; // @[AXI.scala 196:25 AXI.scala 196:25]
  wire [63:0] _GEN_43 = 3'h5 == icnt[2:0] ? ibuffer_5 : _GEN_42; // @[AXI.scala 196:25 AXI.scala 196:25]
  wire [63:0] _GEN_44 = 3'h6 == icnt[2:0] ? ibuffer_6 : _GEN_43; // @[AXI.scala 196:25 AXI.scala 196:25]
  wire [5:0] _icnt_T_2 = icnt + 6'h1; // @[AXI.scala 197:59]
  wire  _drbuffer_T = rstate == 4'h7; // @[AXI.scala 198:35]
  wire [63:0] _GEN_55 = 3'h1 == drcnt[2:0] ? drbuffer_1 : drbuffer_0; // @[AXI.scala 198:27 AXI.scala 198:27]
  wire [63:0] _GEN_56 = 3'h2 == drcnt[2:0] ? drbuffer_2 : _GEN_55; // @[AXI.scala 198:27 AXI.scala 198:27]
  wire [63:0] _GEN_57 = 3'h3 == drcnt[2:0] ? drbuffer_3 : _GEN_56; // @[AXI.scala 198:27 AXI.scala 198:27]
  wire [63:0] _GEN_58 = 3'h4 == drcnt[2:0] ? drbuffer_4 : _GEN_57; // @[AXI.scala 198:27 AXI.scala 198:27]
  wire [63:0] _GEN_59 = 3'h5 == drcnt[2:0] ? drbuffer_5 : _GEN_58; // @[AXI.scala 198:27 AXI.scala 198:27]
  wire [63:0] _GEN_60 = 3'h6 == drcnt[2:0] ? drbuffer_6 : _GEN_59; // @[AXI.scala 198:27 AXI.scala 198:27]
  wire [5:0] _drcnt_T_2 = drcnt + 6'h1; // @[AXI.scala 199:61]
  wire [5:0] _dwcnt_T_2 = dwcnt + 6'h1; // @[AXI.scala 200:60]
  wire [512:0] _T_20 = {ibuffer_7,ibuffer_6,ibuffer_5,ibuffer_4,ibuffer_3,ibuffer_2,ibuffer_1,ibuffer_0,1'h0}; // @[Cat.scala 30:58]
  wire [511:0] idata = _T_20[512:1]; // @[AXI.scala 206:18]
  wire [512:0] _T_21 = {drbuffer_7,drbuffer_6,drbuffer_5,drbuffer_4,drbuffer_3,drbuffer_2,drbuffer_1,drbuffer_0,1'h0}; // @[Cat.scala 30:58]
  wire [511:0] drdata = _T_21[512:1]; // @[AXI.scala 209:20]
  wire  _io_icacheio_valid_T = rstate == 4'h4; // @[AXI.scala 214:31]
  wire  _io_icacheio_valid_T_1 = ~r_bypass; // @[AXI.scala 214:55]
  wire  _io_dcacheio_rvalid_T = rstate == 4'h8; // @[AXI.scala 219:31]
  wire  _io_dcacheio_wdone_T_2 = wstate == 3'h4 & _T_17; // @[AXI.scala 221:42]
  wire  sel_raddr_hi_hi = rstate == 4'h1; // @[AXI.scala 237:32]
  wire  sel_raddr_hi_lo = rstate == 4'h5; // @[AXI.scala 237:52]
  wire [2:0] sel_raddr = {sel_raddr_hi_hi,sel_raddr_hi_lo,r_bypass}; // @[Cat.scala 30:58]
  wire [63:0] _io_out_ar_bits_addr_T_1 = 3'h4 == sel_raddr ? io_icacheio_addr : 64'h0; // @[Mux.scala 80:57]
  wire [63:0] _io_out_ar_bits_addr_T_3 = 3'h2 == sel_raddr ? io_dcacheio_raddr : _io_out_ar_bits_addr_T_1; // @[Mux.scala 80:57]
  wire [63:0] _io_out_ar_bits_addr_T_5 = 3'h5 == sel_raddr ? {{32'd0}, io_icacheBypassIO_addr} :
    _io_out_ar_bits_addr_T_3; // @[Mux.scala 80:57]
  wire [2:0] _io_out_ar_bits_len_T = r_bypass ? 3'h0 : 3'h7; // @[AXI.scala 250:31]
  wire [1:0] _io_out_ar_bits_size_T_1 = 3'h4 == sel_raddr ? 2'h3 : 2'h0; // @[Mux.scala 80:57]
  wire [1:0] _io_out_ar_bits_size_T_3 = 3'h2 == sel_raddr ? 2'h3 : _io_out_ar_bits_size_T_1; // @[Mux.scala 80:57]
  wire [1:0] _io_out_ar_bits_size_T_5 = 3'h5 == sel_raddr ? 2'h2 : _io_out_ar_bits_size_T_3; // @[Mux.scala 80:57]
  wire [2:0] _io_out_aw_bits_len_T = w_bypass ? 3'h0 : 3'h7; // @[AXI.scala 278:31]
  wire [11:0] _io_out_w_bits_data_T = {dwcnt, 6'h0}; // @[AXI.scala 286:90]
  wire [511:0] _io_out_w_bits_data_T_1 = io_dcacheio_wdata >> _io_out_w_bits_data_T; // @[AXI.scala 286:80]
  assign io_out_aw_valid = wstate == 3'h1; // @[AXI.scala 273:35]
  assign io_out_aw_bits_len = {{5'd0}, _io_out_aw_bits_len_T}; // @[AXI.scala 278:31]
  assign io_out_aw_bits_size = w_bypass ? io_dcacheBypassIO_transfer : 3'h3; // @[AXI.scala 279:31]
  assign io_out_aw_bits_addr = w_bypass ? {{32'd0}, io_dcacheBypassIO_waddr} : io_dcacheio_waddr; // @[AXI.scala 274:31]
  assign io_out_w_valid = wstate == 3'h2; // @[AXI.scala 285:35]
  assign io_out_w_bits_data = w_bypass ? io_dcacheBypassIO_wdata : _io_out_w_bits_data_T_1[63:0]; // @[AXI.scala 286:31]
  assign io_out_w_bits_strb = w_bypass ? io_dcacheBypassIO_wmask : 8'hff; // @[AXI.scala 287:31]
  assign io_out_w_bits_last = w_bypass ? dwcnt == 6'h0 : dwcnt == 6'h7; // @[AXI.scala 288:31]
  assign io_out_b_ready = wstate == 3'h4; // @[AXI.scala 290:35]
  assign io_out_ar_valid = sel_raddr_hi_hi | sel_raddr_hi_lo; // @[AXI.scala 240:47]
  assign io_out_ar_bits_len = {{5'd0}, _io_out_ar_bits_len_T}; // @[AXI.scala 250:31]
  assign io_out_ar_bits_size = 3'h3 == sel_raddr ? io_dcacheBypassIO_transfer : {{1'd0}, _io_out_ar_bits_size_T_5}; // @[Mux.scala 80:57]
  assign io_out_ar_bits_addr = 3'h3 == sel_raddr ? {{32'd0}, io_dcacheBypassIO_raddr} : _io_out_ar_bits_addr_T_5; // @[Mux.scala 80:57]
  assign io_out_r_ready = _ibuffer_T | _drbuffer_T; // @[AXI.scala 269:47]
  assign io_icacheio_valid = rstate == 4'h4 & ~r_bypass; // @[AXI.scala 214:43]
  assign io_icacheio_data = _T_20[512:1]; // @[AXI.scala 206:18]
  assign io_dcacheio_rvalid = rstate == 4'h8 & _io_icacheio_valid_T_1; // @[AXI.scala 219:43]
  assign io_dcacheio_rdata = _T_21[512:1]; // @[AXI.scala 209:20]
  assign io_dcacheio_wdone = wstate == 3'h4 & _T_17; // @[AXI.scala 221:42]
  assign io_icacheBypassIO_valid = _io_icacheio_valid_T & r_bypass; // @[AXI.scala 225:49]
  assign io_icacheBypassIO_data = idata[63:0]; // @[AXI.scala 226:35]
  assign io_dcacheBypassIO_rvalid = _io_dcacheio_rvalid_T & r_bypass; // @[AXI.scala 231:49]
  assign io_dcacheBypassIO_rdata = drdata[63:0]; // @[AXI.scala 232:36]
  assign io_dcacheBypassIO_wdone = _io_dcacheio_wdone_T_2 & w_bypass; // @[AXI.scala 233:64]
  always @(posedge clock) begin
    if (reset) begin // @[AXI.scala 107:30]
      ibuffer_0 <= 64'h0; // @[AXI.scala 107:30]
    end else if (3'h0 == icnt[2:0]) begin // @[AXI.scala 196:19]
      if (rstate == 4'h3) begin // @[AXI.scala 196:25]
        ibuffer_0 <= io_out_r_bits_data;
      end else if (3'h7 == icnt[2:0]) begin // @[AXI.scala 196:25]
        ibuffer_0 <= ibuffer_7; // @[AXI.scala 196:25]
      end else begin
        ibuffer_0 <= _GEN_44;
      end
    end
    if (reset) begin // @[AXI.scala 107:30]
      ibuffer_1 <= 64'h0; // @[AXI.scala 107:30]
    end else if (3'h1 == icnt[2:0]) begin // @[AXI.scala 196:19]
      if (rstate == 4'h3) begin // @[AXI.scala 196:25]
        ibuffer_1 <= io_out_r_bits_data;
      end else if (3'h7 == icnt[2:0]) begin // @[AXI.scala 196:25]
        ibuffer_1 <= ibuffer_7; // @[AXI.scala 196:25]
      end else begin
        ibuffer_1 <= _GEN_44;
      end
    end
    if (reset) begin // @[AXI.scala 107:30]
      ibuffer_2 <= 64'h0; // @[AXI.scala 107:30]
    end else if (3'h2 == icnt[2:0]) begin // @[AXI.scala 196:19]
      if (rstate == 4'h3) begin // @[AXI.scala 196:25]
        ibuffer_2 <= io_out_r_bits_data;
      end else if (3'h7 == icnt[2:0]) begin // @[AXI.scala 196:25]
        ibuffer_2 <= ibuffer_7; // @[AXI.scala 196:25]
      end else begin
        ibuffer_2 <= _GEN_44;
      end
    end
    if (reset) begin // @[AXI.scala 107:30]
      ibuffer_3 <= 64'h0; // @[AXI.scala 107:30]
    end else if (3'h3 == icnt[2:0]) begin // @[AXI.scala 196:19]
      if (rstate == 4'h3) begin // @[AXI.scala 196:25]
        ibuffer_3 <= io_out_r_bits_data;
      end else if (3'h7 == icnt[2:0]) begin // @[AXI.scala 196:25]
        ibuffer_3 <= ibuffer_7; // @[AXI.scala 196:25]
      end else begin
        ibuffer_3 <= _GEN_44;
      end
    end
    if (reset) begin // @[AXI.scala 107:30]
      ibuffer_4 <= 64'h0; // @[AXI.scala 107:30]
    end else if (3'h4 == icnt[2:0]) begin // @[AXI.scala 196:19]
      if (rstate == 4'h3) begin // @[AXI.scala 196:25]
        ibuffer_4 <= io_out_r_bits_data;
      end else if (3'h7 == icnt[2:0]) begin // @[AXI.scala 196:25]
        ibuffer_4 <= ibuffer_7; // @[AXI.scala 196:25]
      end else begin
        ibuffer_4 <= _GEN_44;
      end
    end
    if (reset) begin // @[AXI.scala 107:30]
      ibuffer_5 <= 64'h0; // @[AXI.scala 107:30]
    end else if (3'h5 == icnt[2:0]) begin // @[AXI.scala 196:19]
      if (rstate == 4'h3) begin // @[AXI.scala 196:25]
        ibuffer_5 <= io_out_r_bits_data;
      end else if (3'h7 == icnt[2:0]) begin // @[AXI.scala 196:25]
        ibuffer_5 <= ibuffer_7; // @[AXI.scala 196:25]
      end else begin
        ibuffer_5 <= _GEN_44;
      end
    end
    if (reset) begin // @[AXI.scala 107:30]
      ibuffer_6 <= 64'h0; // @[AXI.scala 107:30]
    end else if (3'h6 == icnt[2:0]) begin // @[AXI.scala 196:19]
      if (rstate == 4'h3) begin // @[AXI.scala 196:25]
        ibuffer_6 <= io_out_r_bits_data;
      end else if (3'h7 == icnt[2:0]) begin // @[AXI.scala 196:25]
        ibuffer_6 <= ibuffer_7; // @[AXI.scala 196:25]
      end else begin
        ibuffer_6 <= _GEN_44;
      end
    end
    if (reset) begin // @[AXI.scala 107:30]
      ibuffer_7 <= 64'h0; // @[AXI.scala 107:30]
    end else if (3'h7 == icnt[2:0]) begin // @[AXI.scala 196:19]
      if (rstate == 4'h3) begin // @[AXI.scala 196:25]
        ibuffer_7 <= io_out_r_bits_data;
      end else if (!(3'h7 == icnt[2:0])) begin // @[AXI.scala 196:25]
        ibuffer_7 <= _GEN_44;
      end
    end
    if (reset) begin // @[AXI.scala 108:30]
      drbuffer_0 <= 64'h0; // @[AXI.scala 108:30]
    end else if (3'h0 == drcnt[2:0]) begin // @[AXI.scala 198:21]
      if (rstate == 4'h7) begin // @[AXI.scala 198:27]
        drbuffer_0 <= io_out_r_bits_data;
      end else if (3'h7 == drcnt[2:0]) begin // @[AXI.scala 198:27]
        drbuffer_0 <= drbuffer_7; // @[AXI.scala 198:27]
      end else begin
        drbuffer_0 <= _GEN_60;
      end
    end
    if (reset) begin // @[AXI.scala 108:30]
      drbuffer_1 <= 64'h0; // @[AXI.scala 108:30]
    end else if (3'h1 == drcnt[2:0]) begin // @[AXI.scala 198:21]
      if (rstate == 4'h7) begin // @[AXI.scala 198:27]
        drbuffer_1 <= io_out_r_bits_data;
      end else if (3'h7 == drcnt[2:0]) begin // @[AXI.scala 198:27]
        drbuffer_1 <= drbuffer_7; // @[AXI.scala 198:27]
      end else begin
        drbuffer_1 <= _GEN_60;
      end
    end
    if (reset) begin // @[AXI.scala 108:30]
      drbuffer_2 <= 64'h0; // @[AXI.scala 108:30]
    end else if (3'h2 == drcnt[2:0]) begin // @[AXI.scala 198:21]
      if (rstate == 4'h7) begin // @[AXI.scala 198:27]
        drbuffer_2 <= io_out_r_bits_data;
      end else if (3'h7 == drcnt[2:0]) begin // @[AXI.scala 198:27]
        drbuffer_2 <= drbuffer_7; // @[AXI.scala 198:27]
      end else begin
        drbuffer_2 <= _GEN_60;
      end
    end
    if (reset) begin // @[AXI.scala 108:30]
      drbuffer_3 <= 64'h0; // @[AXI.scala 108:30]
    end else if (3'h3 == drcnt[2:0]) begin // @[AXI.scala 198:21]
      if (rstate == 4'h7) begin // @[AXI.scala 198:27]
        drbuffer_3 <= io_out_r_bits_data;
      end else if (3'h7 == drcnt[2:0]) begin // @[AXI.scala 198:27]
        drbuffer_3 <= drbuffer_7; // @[AXI.scala 198:27]
      end else begin
        drbuffer_3 <= _GEN_60;
      end
    end
    if (reset) begin // @[AXI.scala 108:30]
      drbuffer_4 <= 64'h0; // @[AXI.scala 108:30]
    end else if (3'h4 == drcnt[2:0]) begin // @[AXI.scala 198:21]
      if (rstate == 4'h7) begin // @[AXI.scala 198:27]
        drbuffer_4 <= io_out_r_bits_data;
      end else if (3'h7 == drcnt[2:0]) begin // @[AXI.scala 198:27]
        drbuffer_4 <= drbuffer_7; // @[AXI.scala 198:27]
      end else begin
        drbuffer_4 <= _GEN_60;
      end
    end
    if (reset) begin // @[AXI.scala 108:30]
      drbuffer_5 <= 64'h0; // @[AXI.scala 108:30]
    end else if (3'h5 == drcnt[2:0]) begin // @[AXI.scala 198:21]
      if (rstate == 4'h7) begin // @[AXI.scala 198:27]
        drbuffer_5 <= io_out_r_bits_data;
      end else if (3'h7 == drcnt[2:0]) begin // @[AXI.scala 198:27]
        drbuffer_5 <= drbuffer_7; // @[AXI.scala 198:27]
      end else begin
        drbuffer_5 <= _GEN_60;
      end
    end
    if (reset) begin // @[AXI.scala 108:30]
      drbuffer_6 <= 64'h0; // @[AXI.scala 108:30]
    end else if (3'h6 == drcnt[2:0]) begin // @[AXI.scala 198:21]
      if (rstate == 4'h7) begin // @[AXI.scala 198:27]
        drbuffer_6 <= io_out_r_bits_data;
      end else if (3'h7 == drcnt[2:0]) begin // @[AXI.scala 198:27]
        drbuffer_6 <= drbuffer_7; // @[AXI.scala 198:27]
      end else begin
        drbuffer_6 <= _GEN_60;
      end
    end
    if (reset) begin // @[AXI.scala 108:30]
      drbuffer_7 <= 64'h0; // @[AXI.scala 108:30]
    end else if (3'h7 == drcnt[2:0]) begin // @[AXI.scala 198:21]
      if (rstate == 4'h7) begin // @[AXI.scala 198:27]
        drbuffer_7 <= io_out_r_bits_data;
      end else if (!(3'h7 == drcnt[2:0])) begin // @[AXI.scala 198:27]
        drbuffer_7 <= _GEN_60;
      end
    end
    if (reset) begin // @[AXI.scala 109:30]
      icnt <= 6'h0; // @[AXI.scala 109:30]
    end else if (_ibuffer_T) begin // @[AXI.scala 197:16]
      if (io_out_r_valid) begin // @[AXI.scala 197:40]
        icnt <= _icnt_T_2;
      end
    end else begin
      icnt <= 6'h0;
    end
    if (reset) begin // @[AXI.scala 110:30]
      drcnt <= 6'h0; // @[AXI.scala 110:30]
    end else if (_drbuffer_T) begin // @[AXI.scala 199:17]
      if (io_out_r_valid) begin // @[AXI.scala 199:41]
        drcnt <= _drcnt_T_2;
      end
    end else begin
      drcnt <= 6'h0;
    end
    if (reset) begin // @[AXI.scala 111:30]
      dwcnt <= 6'h0; // @[AXI.scala 111:30]
    end else if (wstate == 3'h2) begin // @[AXI.scala 200:17]
      if (io_out_w_ready) begin // @[AXI.scala 200:40]
        dwcnt <= _dwcnt_T_2;
      end
    end else begin
      dwcnt <= 6'h0;
    end
    if (reset) begin // @[AXI.scala 115:25]
      rstate <= 4'h0; // @[AXI.scala 115:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (io_icacheio_req) begin // @[AXI.scala 123:31]
        rstate <= 4'h1; // @[AXI.scala 124:24]
      end else if (io_dcacheio_req) begin // @[AXI.scala 127:36]
        rstate <= 4'h5; // @[AXI.scala 128:24]
      end else begin
        rstate <= _GEN_2;
      end
    end else if (_T_1) begin // @[Conditional.scala 39:67]
      if (io_out_ar_ready) begin // @[AXI.scala 142:32]
        rstate <= 4'h2; // @[AXI.scala 142:40]
      end
    end else if (_T_2) begin // @[Conditional.scala 39:67]
      rstate <= _GEN_9;
    end else begin
      rstate <= _GEN_19;
    end
    if (reset) begin // @[AXI.scala 116:25]
      wstate <= 3'h0; // @[AXI.scala 116:25]
    end else if (_T_11) begin // @[Conditional.scala 40:58]
      if (io_dcacheio_weq) begin // @[AXI.scala 171:31]
        wstate <= 3'h1; // @[AXI.scala 172:24]
      end else if (io_dcacheBypassIO_weq) begin // @[AXI.scala 175:42]
        wstate <= 3'h1; // @[AXI.scala 176:24]
      end
    end else if (_T_12) begin // @[Conditional.scala 39:67]
      if (io_out_aw_ready) begin // @[AXI.scala 181:32]
        wstate <= 3'h2; // @[AXI.scala 181:40]
      end
    end else if (_T_13) begin // @[Conditional.scala 39:67]
      wstate <= _GEN_29;
    end else begin
      wstate <= _GEN_33;
    end
    if (reset) begin // @[AXI.scala 117:27]
      r_bypass <= 1'h0; // @[AXI.scala 117:27]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (io_icacheio_req) begin // @[AXI.scala 123:31]
        r_bypass <= 1'h0; // @[AXI.scala 125:26]
      end else if (io_dcacheio_req) begin // @[AXI.scala 127:36]
        r_bypass <= 1'h0; // @[AXI.scala 129:26]
      end else begin
        r_bypass <= _GEN_3;
      end
    end
    if (reset) begin // @[AXI.scala 118:27]
      w_bypass <= 1'h0; // @[AXI.scala 118:27]
    end else if (_T_11) begin // @[Conditional.scala 40:58]
      if (io_dcacheio_weq) begin // @[AXI.scala 171:31]
        w_bypass <= 1'h0; // @[AXI.scala 173:26]
      end else begin
        w_bypass <= _GEN_25;
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {2{`RANDOM}};
  ibuffer_0 = _RAND_0[63:0];
  _RAND_1 = {2{`RANDOM}};
  ibuffer_1 = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  ibuffer_2 = _RAND_2[63:0];
  _RAND_3 = {2{`RANDOM}};
  ibuffer_3 = _RAND_3[63:0];
  _RAND_4 = {2{`RANDOM}};
  ibuffer_4 = _RAND_4[63:0];
  _RAND_5 = {2{`RANDOM}};
  ibuffer_5 = _RAND_5[63:0];
  _RAND_6 = {2{`RANDOM}};
  ibuffer_6 = _RAND_6[63:0];
  _RAND_7 = {2{`RANDOM}};
  ibuffer_7 = _RAND_7[63:0];
  _RAND_8 = {2{`RANDOM}};
  drbuffer_0 = _RAND_8[63:0];
  _RAND_9 = {2{`RANDOM}};
  drbuffer_1 = _RAND_9[63:0];
  _RAND_10 = {2{`RANDOM}};
  drbuffer_2 = _RAND_10[63:0];
  _RAND_11 = {2{`RANDOM}};
  drbuffer_3 = _RAND_11[63:0];
  _RAND_12 = {2{`RANDOM}};
  drbuffer_4 = _RAND_12[63:0];
  _RAND_13 = {2{`RANDOM}};
  drbuffer_5 = _RAND_13[63:0];
  _RAND_14 = {2{`RANDOM}};
  drbuffer_6 = _RAND_14[63:0];
  _RAND_15 = {2{`RANDOM}};
  drbuffer_7 = _RAND_15[63:0];
  _RAND_16 = {1{`RANDOM}};
  icnt = _RAND_16[5:0];
  _RAND_17 = {1{`RANDOM}};
  drcnt = _RAND_17[5:0];
  _RAND_18 = {1{`RANDOM}};
  dwcnt = _RAND_18[5:0];
  _RAND_19 = {1{`RANDOM}};
  rstate = _RAND_19[3:0];
  _RAND_20 = {1{`RANDOM}};
  wstate = _RAND_20[2:0];
  _RAND_21 = {1{`RANDOM}};
  r_bypass = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  w_bypass = _RAND_22[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_040596_Core(
  input          clock,
  input          reset,
  input          io_axi_aw_ready,
  output         io_axi_aw_valid,
  output [7:0]   io_axi_aw_bits_len,
  output [2:0]   io_axi_aw_bits_size,
  output [63:0]  io_axi_aw_bits_addr,
  input          io_axi_w_ready,
  output         io_axi_w_valid,
  output [63:0]  io_axi_w_bits_data,
  output [7:0]   io_axi_w_bits_strb,
  output         io_axi_w_bits_last,
  output         io_axi_b_ready,
  input          io_axi_b_valid,
  input          io_axi_ar_ready,
  output         io_axi_ar_valid,
  output [7:0]   io_axi_ar_bits_len,
  output [2:0]   io_axi_ar_bits_size,
  output [63:0]  io_axi_ar_bits_addr,
  output         io_axi_r_ready,
  input          io_axi_r_valid,
  input  [63:0]  io_axi_r_bits_data,
  input          io_axi_r_bits_last,
  output [5:0]   io_sram0_addr,
  output         io_sram0_wen,
  output [127:0] io_sram0_wmask,
  output [127:0] io_sram0_wdata,
  input  [127:0] io_sram0_rdata,
  output [5:0]   io_sram1_addr,
  output         io_sram1_wen,
  output [127:0] io_sram1_wmask,
  output [127:0] io_sram1_wdata,
  input  [127:0] io_sram1_rdata,
  output [5:0]   io_sram2_addr,
  output         io_sram2_wen,
  output [127:0] io_sram2_wmask,
  output [127:0] io_sram2_wdata,
  input  [127:0] io_sram2_rdata,
  output [5:0]   io_sram3_addr,
  output         io_sram3_wen,
  output [127:0] io_sram3_wmask,
  output [127:0] io_sram3_wdata,
  input  [127:0] io_sram3_rdata,
  output [5:0]   io_sram4_addr,
  output         io_sram4_wen,
  output [127:0] io_sram4_wmask,
  output [127:0] io_sram4_wdata,
  input  [127:0] io_sram4_rdata,
  output [5:0]   io_sram5_addr,
  output         io_sram5_wen,
  output [127:0] io_sram5_wmask,
  output [127:0] io_sram5_wdata,
  input  [127:0] io_sram5_rdata,
  output [5:0]   io_sram6_addr,
  output         io_sram6_wen,
  output [127:0] io_sram6_wmask,
  output [127:0] io_sram6_wdata,
  input  [127:0] io_sram6_rdata,
  output [5:0]   io_sram7_addr,
  output         io_sram7_wen,
  output [127:0] io_sram7_wmask,
  output [127:0] io_sram7_wdata,
  input  [127:0] io_sram7_rdata
);
  wire  pipeline_clock; // @[Core.scala 135:33]
  wire  pipeline_reset; // @[Core.scala 135:33]
  wire  pipeline_io_imem_en; // @[Core.scala 135:33]
  wire [63:0] pipeline_io_imem_addr; // @[Core.scala 135:33]
  wire [31:0] pipeline_io_imem_data; // @[Core.scala 135:33]
  wire  pipeline_io_dmem_ren; // @[Core.scala 135:33]
  wire [63:0] pipeline_io_dmem_raddr; // @[Core.scala 135:33]
  wire  pipeline_io_dmem_wen; // @[Core.scala 135:33]
  wire [63:0] pipeline_io_dmem_waddr; // @[Core.scala 135:33]
  wire [63:0] pipeline_io_dmem_wdata; // @[Core.scala 135:33]
  wire [7:0] pipeline_io_dmem_wmask; // @[Core.scala 135:33]
  wire [63:0] pipeline_io_dmem_rdata; // @[Core.scala 135:33]
  wire [31:0] pipeline_io_dmem_transfer; // @[Core.scala 135:33]
  wire [4:0] pipeline_io_rs1_addr; // @[Core.scala 135:33]
  wire [4:0] pipeline_io_rs2_addr; // @[Core.scala 135:33]
  wire [63:0] pipeline_io_rs1_data; // @[Core.scala 135:33]
  wire [63:0] pipeline_io_rs2_data; // @[Core.scala 135:33]
  wire  pipeline_io_rfconflict; // @[Core.scala 135:33]
  wire [1:0] pipeline_io_mu_code; // @[Core.scala 135:33]
  wire [63:0] pipeline_io_mu_op1; // @[Core.scala 135:33]
  wire [63:0] pipeline_io_mu_op2; // @[Core.scala 135:33]
  wire [63:0] pipeline_io_mu_out; // @[Core.scala 135:33]
  wire [7:0] pipeline_io_du_code; // @[Core.scala 135:33]
  wire [63:0] pipeline_io_du_op1; // @[Core.scala 135:33]
  wire [63:0] pipeline_io_du_op2; // @[Core.scala 135:33]
  wire [63:0] pipeline_io_du_out; // @[Core.scala 135:33]
  wire [11:0] pipeline_io_csr_raddr; // @[Core.scala 135:33]
  wire [63:0] pipeline_io_csr_rdata; // @[Core.scala 135:33]
  wire  pipeline_io_csr_wen; // @[Core.scala 135:33]
  wire [11:0] pipeline_io_csr_waddr; // @[Core.scala 135:33]
  wire [63:0] pipeline_io_csr_wdata; // @[Core.scala 135:33]
  wire [63:0] pipeline_io_csr_mtvec; // @[Core.scala 135:33]
  wire [63:0] pipeline_io_csr_mepc; // @[Core.scala 135:33]
  wire  pipeline_io_id_ecall; // @[Core.scala 135:33]
  wire  pipeline_io_id_mret; // @[Core.scala 135:33]
  wire [63:0] pipeline_io_id_pc; // @[Core.scala 135:33]
  wire  pipeline_io_intr; // @[Core.scala 135:33]
  wire  pipeline_io_id_intr; // @[Core.scala 135:33]
  wire [63:0] pipeline_io_id_cause; // @[Core.scala 135:33]
  wire  pipeline_io_id_fencei; // @[Core.scala 135:33]
  wire  pipeline_io_stall_id; // @[Core.scala 135:33]
  wire  pipeline_io_stall_ie; // @[Core.scala 135:33]
  wire  pipeline_io_stall_wb; // @[Core.scala 135:33]
  wire  pipeline_io_ie_valid; // @[Core.scala 135:33]
  wire  pipeline_io_mem_valid; // @[Core.scala 135:33]
  wire  pipeline_io_wb_valid; // @[Core.scala 135:33]
  wire  pipeline_io_commit; // @[Core.scala 135:33]
  wire  pipeline_io_rf_rd_en; // @[Core.scala 135:33]
  wire [4:0] pipeline_io_rf_rd_addr; // @[Core.scala 135:33]
  wire [63:0] pipeline_io_rf_rd_data; // @[Core.scala 135:33]
  wire  rfu_clock; // @[Core.scala 137:21]
  wire  rfu_reset; // @[Core.scala 137:21]
  wire [4:0] rfu_io_rs1_addr; // @[Core.scala 137:21]
  wire [4:0] rfu_io_rs2_addr; // @[Core.scala 137:21]
  wire [63:0] rfu_io_rs1_data; // @[Core.scala 137:21]
  wire [63:0] rfu_io_rs2_data; // @[Core.scala 137:21]
  wire  rfu_io_rd_en; // @[Core.scala 137:21]
  wire [4:0] rfu_io_rd_addr; // @[Core.scala 137:21]
  wire [63:0] rfu_io_rd_data; // @[Core.scala 137:21]
  wire  csru_clock; // @[Core.scala 139:33]
  wire  csru_reset; // @[Core.scala 139:33]
  wire [11:0] csru_io_raddr; // @[Core.scala 139:33]
  wire [63:0] csru_io_rdata; // @[Core.scala 139:33]
  wire  csru_io_wen; // @[Core.scala 139:33]
  wire [11:0] csru_io_waddr; // @[Core.scala 139:33]
  wire [63:0] csru_io_wdata; // @[Core.scala 139:33]
  wire [63:0] csru_io_mtvec; // @[Core.scala 139:33]
  wire [63:0] csru_io_mepc; // @[Core.scala 139:33]
  wire  csru_io_ecall; // @[Core.scala 139:33]
  wire  csru_io_mret; // @[Core.scala 139:33]
  wire [63:0] csru_io_pc; // @[Core.scala 139:33]
  wire  csru_io_time_intr; // @[Core.scala 139:33]
  wire  csru_io_interrupt; // @[Core.scala 139:33]
  wire [63:0] csru_io_cause; // @[Core.scala 139:33]
  wire  fence_clock; // @[Core.scala 140:33]
  wire  fence_reset; // @[Core.scala 140:33]
  wire  fence_io_go; // @[Core.scala 140:33]
  wire  fence_io_ok; // @[Core.scala 140:33]
  wire  fence_io_ifence_req; // @[Core.scala 140:33]
  wire  fence_io_ifence_done; // @[Core.scala 140:33]
  wire  fence_io_dfence_req; // @[Core.scala 140:33]
  wire  fence_io_dfence_done; // @[Core.scala 140:33]
  wire  mu_clock; // @[Core.scala 142:33]
  wire  mu_reset; // @[Core.scala 142:33]
  wire  mu_io_en; // @[Core.scala 142:33]
  wire [1:0] mu_io_mu_code; // @[Core.scala 142:33]
  wire [63:0] mu_io_op1; // @[Core.scala 142:33]
  wire [63:0] mu_io_op2; // @[Core.scala 142:33]
  wire [63:0] mu_io_mu_out; // @[Core.scala 142:33]
  wire  mu_io_stall; // @[Core.scala 142:33]
  wire  du_clock; // @[Core.scala 143:33]
  wire  du_reset; // @[Core.scala 143:33]
  wire  du_io_en; // @[Core.scala 143:33]
  wire [7:0] du_io_du_code; // @[Core.scala 143:33]
  wire [63:0] du_io_op1; // @[Core.scala 143:33]
  wire [63:0] du_io_op2; // @[Core.scala 143:33]
  wire [63:0] du_io_du_out; // @[Core.scala 143:33]
  wire  du_io_stall; // @[Core.scala 143:33]
  wire  icache_clock; // @[Core.scala 145:33]
  wire  icache_reset; // @[Core.scala 145:33]
  wire [63:0] icache_io_imem_addr; // @[Core.scala 145:33]
  wire  icache_io_imem_en; // @[Core.scala 145:33]
  wire [31:0] icache_io_imem_data; // @[Core.scala 145:33]
  wire  icache_io_imem_ok; // @[Core.scala 145:33]
  wire  icache_io_axi_req; // @[Core.scala 145:33]
  wire [63:0] icache_io_axi_addr; // @[Core.scala 145:33]
  wire  icache_io_axi_valid; // @[Core.scala 145:33]
  wire [511:0] icache_io_axi_data; // @[Core.scala 145:33]
  wire  icache_io_fence_req; // @[Core.scala 145:33]
  wire  icache_io_fence_done; // @[Core.scala 145:33]
  wire [5:0] icache_io_sram0_addr; // @[Core.scala 145:33]
  wire  icache_io_sram0_wen; // @[Core.scala 145:33]
  wire [127:0] icache_io_sram0_wmask; // @[Core.scala 145:33]
  wire [127:0] icache_io_sram0_wdata; // @[Core.scala 145:33]
  wire [127:0] icache_io_sram0_rdata; // @[Core.scala 145:33]
  wire [5:0] icache_io_sram1_addr; // @[Core.scala 145:33]
  wire  icache_io_sram1_wen; // @[Core.scala 145:33]
  wire [127:0] icache_io_sram1_wmask; // @[Core.scala 145:33]
  wire [127:0] icache_io_sram1_wdata; // @[Core.scala 145:33]
  wire [127:0] icache_io_sram1_rdata; // @[Core.scala 145:33]
  wire [5:0] icache_io_sram2_addr; // @[Core.scala 145:33]
  wire  icache_io_sram2_wen; // @[Core.scala 145:33]
  wire [127:0] icache_io_sram2_wmask; // @[Core.scala 145:33]
  wire [127:0] icache_io_sram2_wdata; // @[Core.scala 145:33]
  wire [127:0] icache_io_sram2_rdata; // @[Core.scala 145:33]
  wire [5:0] icache_io_sram3_addr; // @[Core.scala 145:33]
  wire  icache_io_sram3_wen; // @[Core.scala 145:33]
  wire [127:0] icache_io_sram3_wmask; // @[Core.scala 145:33]
  wire [127:0] icache_io_sram3_wdata; // @[Core.scala 145:33]
  wire [127:0] icache_io_sram3_rdata; // @[Core.scala 145:33]
  wire  icacheaxi_clock; // @[Core.scala 146:33]
  wire  icacheaxi_reset; // @[Core.scala 146:33]
  wire  icacheaxi_io_in_req; // @[Core.scala 146:33]
  wire [63:0] icacheaxi_io_in_addr; // @[Core.scala 146:33]
  wire  icacheaxi_io_in_valid; // @[Core.scala 146:33]
  wire [511:0] icacheaxi_io_in_data; // @[Core.scala 146:33]
  wire  icacheaxi_io_out0_req; // @[Core.scala 146:33]
  wire [63:0] icacheaxi_io_out0_addr; // @[Core.scala 146:33]
  wire  icacheaxi_io_out0_valid; // @[Core.scala 146:33]
  wire [511:0] icacheaxi_io_out0_data; // @[Core.scala 146:33]
  wire  icacheaxi_io_out1_req; // @[Core.scala 146:33]
  wire [31:0] icacheaxi_io_out1_addr; // @[Core.scala 146:33]
  wire  icacheaxi_io_out1_valid; // @[Core.scala 146:33]
  wire [63:0] icacheaxi_io_out1_data; // @[Core.scala 146:33]
  wire  dmmio_clock; // @[Core.scala 148:33]
  wire  dmmio_reset; // @[Core.scala 148:33]
  wire  dmmio_io_dmem_en; // @[Core.scala 148:33]
  wire  dmmio_io_dmem_op; // @[Core.scala 148:33]
  wire [63:0] dmmio_io_dmem_addr; // @[Core.scala 148:33]
  wire [63:0] dmmio_io_dmem_wdata; // @[Core.scala 148:33]
  wire [7:0] dmmio_io_dmem_wmask; // @[Core.scala 148:33]
  wire [31:0] dmmio_io_dmem_transfer; // @[Core.scala 148:33]
  wire  dmmio_io_dmem_ok; // @[Core.scala 148:33]
  wire [63:0] dmmio_io_dmem_rdata; // @[Core.scala 148:33]
  wire  dmmio_io_mem0_en; // @[Core.scala 148:33]
  wire  dmmio_io_mem0_op; // @[Core.scala 148:33]
  wire [63:0] dmmio_io_mem0_addr; // @[Core.scala 148:33]
  wire [63:0] dmmio_io_mem0_wdata; // @[Core.scala 148:33]
  wire [7:0] dmmio_io_mem0_wmask; // @[Core.scala 148:33]
  wire  dmmio_io_mem0_ok; // @[Core.scala 148:33]
  wire [63:0] dmmio_io_mem0_rdata; // @[Core.scala 148:33]
  wire  dmmio_io_mem1_en; // @[Core.scala 148:33]
  wire  dmmio_io_mem1_op; // @[Core.scala 148:33]
  wire [63:0] dmmio_io_mem1_addr; // @[Core.scala 148:33]
  wire [63:0] dmmio_io_mem1_wdata; // @[Core.scala 148:33]
  wire [7:0] dmmio_io_mem1_wmask; // @[Core.scala 148:33]
  wire [63:0] dmmio_io_mem1_rdata; // @[Core.scala 148:33]
  wire  dmmio_io_mem2_en; // @[Core.scala 148:33]
  wire  dmmio_io_mem2_op; // @[Core.scala 148:33]
  wire [63:0] dmmio_io_mem2_addr; // @[Core.scala 148:33]
  wire [63:0] dmmio_io_mem2_wdata; // @[Core.scala 148:33]
  wire [7:0] dmmio_io_mem2_wmask; // @[Core.scala 148:33]
  wire [31:0] dmmio_io_mem2_transfer; // @[Core.scala 148:33]
  wire  dmmio_io_mem2_ok; // @[Core.scala 148:33]
  wire [63:0] dmmio_io_mem2_rdata; // @[Core.scala 148:33]
  wire  dcache_clock; // @[Core.scala 149:33]
  wire  dcache_reset; // @[Core.scala 149:33]
  wire  dcache_io_dmem_en; // @[Core.scala 149:33]
  wire  dcache_io_dmem_op; // @[Core.scala 149:33]
  wire [63:0] dcache_io_dmem_addr; // @[Core.scala 149:33]
  wire [63:0] dcache_io_dmem_wdata; // @[Core.scala 149:33]
  wire [7:0] dcache_io_dmem_wmask; // @[Core.scala 149:33]
  wire  dcache_io_dmem_ok; // @[Core.scala 149:33]
  wire [63:0] dcache_io_dmem_rdata; // @[Core.scala 149:33]
  wire  dcache_io_axi_req; // @[Core.scala 149:33]
  wire [63:0] dcache_io_axi_raddr; // @[Core.scala 149:33]
  wire  dcache_io_axi_rvalid; // @[Core.scala 149:33]
  wire [511:0] dcache_io_axi_rdata; // @[Core.scala 149:33]
  wire  dcache_io_axi_weq; // @[Core.scala 149:33]
  wire [63:0] dcache_io_axi_waddr; // @[Core.scala 149:33]
  wire [511:0] dcache_io_axi_wdata; // @[Core.scala 149:33]
  wire  dcache_io_axi_wdone; // @[Core.scala 149:33]
  wire  dcache_io_fence_req; // @[Core.scala 149:33]
  wire  dcache_io_fence_done; // @[Core.scala 149:33]
  wire [5:0] dcache_io_sram0_addr; // @[Core.scala 149:33]
  wire  dcache_io_sram0_wen; // @[Core.scala 149:33]
  wire [127:0] dcache_io_sram0_wmask; // @[Core.scala 149:33]
  wire [127:0] dcache_io_sram0_wdata; // @[Core.scala 149:33]
  wire [127:0] dcache_io_sram0_rdata; // @[Core.scala 149:33]
  wire [5:0] dcache_io_sram1_addr; // @[Core.scala 149:33]
  wire  dcache_io_sram1_wen; // @[Core.scala 149:33]
  wire [127:0] dcache_io_sram1_wmask; // @[Core.scala 149:33]
  wire [127:0] dcache_io_sram1_wdata; // @[Core.scala 149:33]
  wire [127:0] dcache_io_sram1_rdata; // @[Core.scala 149:33]
  wire [5:0] dcache_io_sram2_addr; // @[Core.scala 149:33]
  wire  dcache_io_sram2_wen; // @[Core.scala 149:33]
  wire [127:0] dcache_io_sram2_wmask; // @[Core.scala 149:33]
  wire [127:0] dcache_io_sram2_wdata; // @[Core.scala 149:33]
  wire [127:0] dcache_io_sram2_rdata; // @[Core.scala 149:33]
  wire [5:0] dcache_io_sram3_addr; // @[Core.scala 149:33]
  wire  dcache_io_sram3_wen; // @[Core.scala 149:33]
  wire [127:0] dcache_io_sram3_wmask; // @[Core.scala 149:33]
  wire [127:0] dcache_io_sram3_wdata; // @[Core.scala 149:33]
  wire [127:0] dcache_io_sram3_rdata; // @[Core.scala 149:33]
  wire  clintreg_clock; // @[Core.scala 150:33]
  wire  clintreg_reset; // @[Core.scala 150:33]
  wire  clintreg_io_mem_en; // @[Core.scala 150:33]
  wire  clintreg_io_mem_op; // @[Core.scala 150:33]
  wire [63:0] clintreg_io_mem_addr; // @[Core.scala 150:33]
  wire [63:0] clintreg_io_mem_wdata; // @[Core.scala 150:33]
  wire [7:0] clintreg_io_mem_wmask; // @[Core.scala 150:33]
  wire [63:0] clintreg_io_mem_rdata; // @[Core.scala 150:33]
  wire  dcachebypass_clock; // @[Core.scala 151:33]
  wire  dcachebypass_reset; // @[Core.scala 151:33]
  wire  dcachebypass_io_dmem_en; // @[Core.scala 151:33]
  wire  dcachebypass_io_dmem_op; // @[Core.scala 151:33]
  wire [63:0] dcachebypass_io_dmem_addr; // @[Core.scala 151:33]
  wire [63:0] dcachebypass_io_dmem_wdata; // @[Core.scala 151:33]
  wire [7:0] dcachebypass_io_dmem_wmask; // @[Core.scala 151:33]
  wire [31:0] dcachebypass_io_dmem_transfer; // @[Core.scala 151:33]
  wire  dcachebypass_io_dmem_ok; // @[Core.scala 151:33]
  wire [63:0] dcachebypass_io_dmem_rdata; // @[Core.scala 151:33]
  wire  dcachebypass_io_axi_req; // @[Core.scala 151:33]
  wire [31:0] dcachebypass_io_axi_raddr; // @[Core.scala 151:33]
  wire  dcachebypass_io_axi_rvalid; // @[Core.scala 151:33]
  wire [63:0] dcachebypass_io_axi_rdata; // @[Core.scala 151:33]
  wire  dcachebypass_io_axi_weq; // @[Core.scala 151:33]
  wire [31:0] dcachebypass_io_axi_waddr; // @[Core.scala 151:33]
  wire [63:0] dcachebypass_io_axi_wdata; // @[Core.scala 151:33]
  wire [7:0] dcachebypass_io_axi_wmask; // @[Core.scala 151:33]
  wire  dcachebypass_io_axi_wdone; // @[Core.scala 151:33]
  wire [2:0] dcachebypass_io_axi_transfer; // @[Core.scala 151:33]
  wire  axi_clock; // @[Core.scala 153:33]
  wire  axi_reset; // @[Core.scala 153:33]
  wire  axi_io_out_aw_ready; // @[Core.scala 153:33]
  wire  axi_io_out_aw_valid; // @[Core.scala 153:33]
  wire [7:0] axi_io_out_aw_bits_len; // @[Core.scala 153:33]
  wire [2:0] axi_io_out_aw_bits_size; // @[Core.scala 153:33]
  wire [63:0] axi_io_out_aw_bits_addr; // @[Core.scala 153:33]
  wire  axi_io_out_w_ready; // @[Core.scala 153:33]
  wire  axi_io_out_w_valid; // @[Core.scala 153:33]
  wire [63:0] axi_io_out_w_bits_data; // @[Core.scala 153:33]
  wire [7:0] axi_io_out_w_bits_strb; // @[Core.scala 153:33]
  wire  axi_io_out_w_bits_last; // @[Core.scala 153:33]
  wire  axi_io_out_b_ready; // @[Core.scala 153:33]
  wire  axi_io_out_b_valid; // @[Core.scala 153:33]
  wire  axi_io_out_ar_ready; // @[Core.scala 153:33]
  wire  axi_io_out_ar_valid; // @[Core.scala 153:33]
  wire [7:0] axi_io_out_ar_bits_len; // @[Core.scala 153:33]
  wire [2:0] axi_io_out_ar_bits_size; // @[Core.scala 153:33]
  wire [63:0] axi_io_out_ar_bits_addr; // @[Core.scala 153:33]
  wire  axi_io_out_r_ready; // @[Core.scala 153:33]
  wire  axi_io_out_r_valid; // @[Core.scala 153:33]
  wire [63:0] axi_io_out_r_bits_data; // @[Core.scala 153:33]
  wire  axi_io_out_r_bits_last; // @[Core.scala 153:33]
  wire  axi_io_icacheio_req; // @[Core.scala 153:33]
  wire [63:0] axi_io_icacheio_addr; // @[Core.scala 153:33]
  wire  axi_io_icacheio_valid; // @[Core.scala 153:33]
  wire [511:0] axi_io_icacheio_data; // @[Core.scala 153:33]
  wire  axi_io_dcacheio_req; // @[Core.scala 153:33]
  wire [63:0] axi_io_dcacheio_raddr; // @[Core.scala 153:33]
  wire  axi_io_dcacheio_rvalid; // @[Core.scala 153:33]
  wire [511:0] axi_io_dcacheio_rdata; // @[Core.scala 153:33]
  wire  axi_io_dcacheio_weq; // @[Core.scala 153:33]
  wire [63:0] axi_io_dcacheio_waddr; // @[Core.scala 153:33]
  wire [511:0] axi_io_dcacheio_wdata; // @[Core.scala 153:33]
  wire  axi_io_dcacheio_wdone; // @[Core.scala 153:33]
  wire  axi_io_icacheBypassIO_req; // @[Core.scala 153:33]
  wire [31:0] axi_io_icacheBypassIO_addr; // @[Core.scala 153:33]
  wire  axi_io_icacheBypassIO_valid; // @[Core.scala 153:33]
  wire [63:0] axi_io_icacheBypassIO_data; // @[Core.scala 153:33]
  wire  axi_io_dcacheBypassIO_req; // @[Core.scala 153:33]
  wire [31:0] axi_io_dcacheBypassIO_raddr; // @[Core.scala 153:33]
  wire  axi_io_dcacheBypassIO_rvalid; // @[Core.scala 153:33]
  wire [63:0] axi_io_dcacheBypassIO_rdata; // @[Core.scala 153:33]
  wire  axi_io_dcacheBypassIO_weq; // @[Core.scala 153:33]
  wire [31:0] axi_io_dcacheBypassIO_waddr; // @[Core.scala 153:33]
  wire [63:0] axi_io_dcacheBypassIO_wdata; // @[Core.scala 153:33]
  wire [7:0] axi_io_dcacheBypassIO_wmask; // @[Core.scala 153:33]
  wire  axi_io_dcacheBypassIO_wdone; // @[Core.scala 153:33]
  wire [2:0] axi_io_dcacheBypassIO_transfer; // @[Core.scala 153:33]
  wire  _env_wait_T_1 = pipeline_io_id_ecall | pipeline_io_id_mret | pipeline_io_id_intr; // @[Core.scala 157:65]
  wire  _env_wait_T_3 = pipeline_io_ie_valid | pipeline_io_mem_valid | pipeline_io_wb_valid; // @[Core.scala 157:139]
  wire  env_wait = (pipeline_io_id_ecall | pipeline_io_id_mret | pipeline_io_id_intr) & (pipeline_io_ie_valid |
    pipeline_io_mem_valid | pipeline_io_wb_valid); // @[Core.scala 157:89]
  wire  _env_go_T_4 = ~pipeline_io_ie_valid; // @[Core.scala 158:116]
  wire  _env_go_T_5 = ~pipeline_io_mem_valid; // @[Core.scala 158:141]
  wire  _env_go_T_7 = ~pipeline_io_wb_valid; // @[Core.scala 158:167]
  wire  env_go = ~pipeline_io_stall_id & _env_wait_T_1 & (~pipeline_io_ie_valid & ~pipeline_io_mem_valid & ~
    pipeline_io_wb_valid); // @[Core.scala 158:112]
  wire  imem_not_ok = ~icache_io_imem_ok; // @[Core.scala 159:23]
  wire  fence_wait = pipeline_io_id_fencei & _env_wait_T_3; // @[Core.scala 162:44]
  wire  fence_running = ~fence_io_ok; // @[Core.scala 164:25]
  wire  dmem_en = pipeline_io_dmem_ren | pipeline_io_dmem_wen; // @[Core.scala 243:40]
  ysyx_040596_Pipeline pipeline ( // @[Core.scala 135:33]
    .clock(pipeline_clock),
    .reset(pipeline_reset),
    .io_imem_en(pipeline_io_imem_en),
    .io_imem_addr(pipeline_io_imem_addr),
    .io_imem_data(pipeline_io_imem_data),
    .io_dmem_ren(pipeline_io_dmem_ren),
    .io_dmem_raddr(pipeline_io_dmem_raddr),
    .io_dmem_wen(pipeline_io_dmem_wen),
    .io_dmem_waddr(pipeline_io_dmem_waddr),
    .io_dmem_wdata(pipeline_io_dmem_wdata),
    .io_dmem_wmask(pipeline_io_dmem_wmask),
    .io_dmem_rdata(pipeline_io_dmem_rdata),
    .io_dmem_transfer(pipeline_io_dmem_transfer),
    .io_rs1_addr(pipeline_io_rs1_addr),
    .io_rs2_addr(pipeline_io_rs2_addr),
    .io_rs1_data(pipeline_io_rs1_data),
    .io_rs2_data(pipeline_io_rs2_data),
    .io_rfconflict(pipeline_io_rfconflict),
    .io_mu_code(pipeline_io_mu_code),
    .io_mu_op1(pipeline_io_mu_op1),
    .io_mu_op2(pipeline_io_mu_op2),
    .io_mu_out(pipeline_io_mu_out),
    .io_du_code(pipeline_io_du_code),
    .io_du_op1(pipeline_io_du_op1),
    .io_du_op2(pipeline_io_du_op2),
    .io_du_out(pipeline_io_du_out),
    .io_csr_raddr(pipeline_io_csr_raddr),
    .io_csr_rdata(pipeline_io_csr_rdata),
    .io_csr_wen(pipeline_io_csr_wen),
    .io_csr_waddr(pipeline_io_csr_waddr),
    .io_csr_wdata(pipeline_io_csr_wdata),
    .io_csr_mtvec(pipeline_io_csr_mtvec),
    .io_csr_mepc(pipeline_io_csr_mepc),
    .io_id_ecall(pipeline_io_id_ecall),
    .io_id_mret(pipeline_io_id_mret),
    .io_id_pc(pipeline_io_id_pc),
    .io_intr(pipeline_io_intr),
    .io_id_intr(pipeline_io_id_intr),
    .io_id_cause(pipeline_io_id_cause),
    .io_id_fencei(pipeline_io_id_fencei),
    .io_stall_id(pipeline_io_stall_id),
    .io_stall_ie(pipeline_io_stall_ie),
    .io_stall_wb(pipeline_io_stall_wb),
    .io_ie_valid(pipeline_io_ie_valid),
    .io_mem_valid(pipeline_io_mem_valid),
    .io_wb_valid(pipeline_io_wb_valid),
    .io_commit(pipeline_io_commit),
    .io_rf_rd_en(pipeline_io_rf_rd_en),
    .io_rf_rd_addr(pipeline_io_rf_rd_addr),
    .io_rf_rd_data(pipeline_io_rf_rd_data)
  );
  ysyx_040596_RegFile rfu ( // @[Core.scala 137:21]
    .clock(rfu_clock),
    .reset(rfu_reset),
    .io_rs1_addr(rfu_io_rs1_addr),
    .io_rs2_addr(rfu_io_rs2_addr),
    .io_rs1_data(rfu_io_rs1_data),
    .io_rs2_data(rfu_io_rs2_data),
    .io_rd_en(rfu_io_rd_en),
    .io_rd_addr(rfu_io_rd_addr),
    .io_rd_data(rfu_io_rd_data)
  );
  ysyx_040596_Csr csru ( // @[Core.scala 139:33]
    .clock(csru_clock),
    .reset(csru_reset),
    .io_raddr(csru_io_raddr),
    .io_rdata(csru_io_rdata),
    .io_wen(csru_io_wen),
    .io_waddr(csru_io_waddr),
    .io_wdata(csru_io_wdata),
    .io_mtvec(csru_io_mtvec),
    .io_mepc(csru_io_mepc),
    .io_ecall(csru_io_ecall),
    .io_mret(csru_io_mret),
    .io_pc(csru_io_pc),
    .io_time_intr(csru_io_time_intr),
    .io_interrupt(csru_io_interrupt),
    .io_cause(csru_io_cause)
  );
  ysyx_040596_Fence fence ( // @[Core.scala 140:33]
    .clock(fence_clock),
    .reset(fence_reset),
    .io_go(fence_io_go),
    .io_ok(fence_io_ok),
    .io_ifence_req(fence_io_ifence_req),
    .io_ifence_done(fence_io_ifence_done),
    .io_dfence_req(fence_io_dfence_req),
    .io_dfence_done(fence_io_dfence_done)
  );
  ysyx_040596_MU mu ( // @[Core.scala 142:33]
    .clock(mu_clock),
    .reset(mu_reset),
    .io_en(mu_io_en),
    .io_mu_code(mu_io_mu_code),
    .io_op1(mu_io_op1),
    .io_op2(mu_io_op2),
    .io_mu_out(mu_io_mu_out),
    .io_stall(mu_io_stall)
  );
  ysyx_040596_DU du ( // @[Core.scala 143:33]
    .clock(du_clock),
    .reset(du_reset),
    .io_en(du_io_en),
    .io_du_code(du_io_du_code),
    .io_op1(du_io_op1),
    .io_op2(du_io_op2),
    .io_du_out(du_io_du_out),
    .io_stall(du_io_stall)
  );
  ysyx_040596_ICache icache ( // @[Core.scala 145:33]
    .clock(icache_clock),
    .reset(icache_reset),
    .io_imem_addr(icache_io_imem_addr),
    .io_imem_en(icache_io_imem_en),
    .io_imem_data(icache_io_imem_data),
    .io_imem_ok(icache_io_imem_ok),
    .io_axi_req(icache_io_axi_req),
    .io_axi_addr(icache_io_axi_addr),
    .io_axi_valid(icache_io_axi_valid),
    .io_axi_data(icache_io_axi_data),
    .io_fence_req(icache_io_fence_req),
    .io_fence_done(icache_io_fence_done),
    .io_sram0_addr(icache_io_sram0_addr),
    .io_sram0_wen(icache_io_sram0_wen),
    .io_sram0_wmask(icache_io_sram0_wmask),
    .io_sram0_wdata(icache_io_sram0_wdata),
    .io_sram0_rdata(icache_io_sram0_rdata),
    .io_sram1_addr(icache_io_sram1_addr),
    .io_sram1_wen(icache_io_sram1_wen),
    .io_sram1_wmask(icache_io_sram1_wmask),
    .io_sram1_wdata(icache_io_sram1_wdata),
    .io_sram1_rdata(icache_io_sram1_rdata),
    .io_sram2_addr(icache_io_sram2_addr),
    .io_sram2_wen(icache_io_sram2_wen),
    .io_sram2_wmask(icache_io_sram2_wmask),
    .io_sram2_wdata(icache_io_sram2_wdata),
    .io_sram2_rdata(icache_io_sram2_rdata),
    .io_sram3_addr(icache_io_sram3_addr),
    .io_sram3_wen(icache_io_sram3_wen),
    .io_sram3_wmask(icache_io_sram3_wmask),
    .io_sram3_wdata(icache_io_sram3_wdata),
    .io_sram3_rdata(icache_io_sram3_rdata)
  );
  ysyx_040596_ICacheSocAxi icacheaxi ( // @[Core.scala 146:33]
    .clock(icacheaxi_clock),
    .reset(icacheaxi_reset),
    .io_in_req(icacheaxi_io_in_req),
    .io_in_addr(icacheaxi_io_in_addr),
    .io_in_valid(icacheaxi_io_in_valid),
    .io_in_data(icacheaxi_io_in_data),
    .io_out0_req(icacheaxi_io_out0_req),
    .io_out0_addr(icacheaxi_io_out0_addr),
    .io_out0_valid(icacheaxi_io_out0_valid),
    .io_out0_data(icacheaxi_io_out0_data),
    .io_out1_req(icacheaxi_io_out1_req),
    .io_out1_addr(icacheaxi_io_out1_addr),
    .io_out1_valid(icacheaxi_io_out1_valid),
    .io_out1_data(icacheaxi_io_out1_data)
  );
  ysyx_040596_DMMIO dmmio ( // @[Core.scala 148:33]
    .clock(dmmio_clock),
    .reset(dmmio_reset),
    .io_dmem_en(dmmio_io_dmem_en),
    .io_dmem_op(dmmio_io_dmem_op),
    .io_dmem_addr(dmmio_io_dmem_addr),
    .io_dmem_wdata(dmmio_io_dmem_wdata),
    .io_dmem_wmask(dmmio_io_dmem_wmask),
    .io_dmem_transfer(dmmio_io_dmem_transfer),
    .io_dmem_ok(dmmio_io_dmem_ok),
    .io_dmem_rdata(dmmio_io_dmem_rdata),
    .io_mem0_en(dmmio_io_mem0_en),
    .io_mem0_op(dmmio_io_mem0_op),
    .io_mem0_addr(dmmio_io_mem0_addr),
    .io_mem0_wdata(dmmio_io_mem0_wdata),
    .io_mem0_wmask(dmmio_io_mem0_wmask),
    .io_mem0_ok(dmmio_io_mem0_ok),
    .io_mem0_rdata(dmmio_io_mem0_rdata),
    .io_mem1_en(dmmio_io_mem1_en),
    .io_mem1_op(dmmio_io_mem1_op),
    .io_mem1_addr(dmmio_io_mem1_addr),
    .io_mem1_wdata(dmmio_io_mem1_wdata),
    .io_mem1_wmask(dmmio_io_mem1_wmask),
    .io_mem1_rdata(dmmio_io_mem1_rdata),
    .io_mem2_en(dmmio_io_mem2_en),
    .io_mem2_op(dmmio_io_mem2_op),
    .io_mem2_addr(dmmio_io_mem2_addr),
    .io_mem2_wdata(dmmio_io_mem2_wdata),
    .io_mem2_wmask(dmmio_io_mem2_wmask),
    .io_mem2_transfer(dmmio_io_mem2_transfer),
    .io_mem2_ok(dmmio_io_mem2_ok),
    .io_mem2_rdata(dmmio_io_mem2_rdata)
  );
  ysyx_040596_DCache dcache ( // @[Core.scala 149:33]
    .clock(dcache_clock),
    .reset(dcache_reset),
    .io_dmem_en(dcache_io_dmem_en),
    .io_dmem_op(dcache_io_dmem_op),
    .io_dmem_addr(dcache_io_dmem_addr),
    .io_dmem_wdata(dcache_io_dmem_wdata),
    .io_dmem_wmask(dcache_io_dmem_wmask),
    .io_dmem_ok(dcache_io_dmem_ok),
    .io_dmem_rdata(dcache_io_dmem_rdata),
    .io_axi_req(dcache_io_axi_req),
    .io_axi_raddr(dcache_io_axi_raddr),
    .io_axi_rvalid(dcache_io_axi_rvalid),
    .io_axi_rdata(dcache_io_axi_rdata),
    .io_axi_weq(dcache_io_axi_weq),
    .io_axi_waddr(dcache_io_axi_waddr),
    .io_axi_wdata(dcache_io_axi_wdata),
    .io_axi_wdone(dcache_io_axi_wdone),
    .io_fence_req(dcache_io_fence_req),
    .io_fence_done(dcache_io_fence_done),
    .io_sram0_addr(dcache_io_sram0_addr),
    .io_sram0_wen(dcache_io_sram0_wen),
    .io_sram0_wmask(dcache_io_sram0_wmask),
    .io_sram0_wdata(dcache_io_sram0_wdata),
    .io_sram0_rdata(dcache_io_sram0_rdata),
    .io_sram1_addr(dcache_io_sram1_addr),
    .io_sram1_wen(dcache_io_sram1_wen),
    .io_sram1_wmask(dcache_io_sram1_wmask),
    .io_sram1_wdata(dcache_io_sram1_wdata),
    .io_sram1_rdata(dcache_io_sram1_rdata),
    .io_sram2_addr(dcache_io_sram2_addr),
    .io_sram2_wen(dcache_io_sram2_wen),
    .io_sram2_wmask(dcache_io_sram2_wmask),
    .io_sram2_wdata(dcache_io_sram2_wdata),
    .io_sram2_rdata(dcache_io_sram2_rdata),
    .io_sram3_addr(dcache_io_sram3_addr),
    .io_sram3_wen(dcache_io_sram3_wen),
    .io_sram3_wmask(dcache_io_sram3_wmask),
    .io_sram3_wdata(dcache_io_sram3_wdata),
    .io_sram3_rdata(dcache_io_sram3_rdata)
  );
  ysyx_040596_ClintReg clintreg ( // @[Core.scala 150:33]
    .clock(clintreg_clock),
    .reset(clintreg_reset),
    .io_mem_en(clintreg_io_mem_en),
    .io_mem_op(clintreg_io_mem_op),
    .io_mem_addr(clintreg_io_mem_addr),
    .io_mem_wdata(clintreg_io_mem_wdata),
    .io_mem_wmask(clintreg_io_mem_wmask),
    .io_mem_rdata(clintreg_io_mem_rdata)
  );
  ysyx_040596_DCacheBypass dcachebypass ( // @[Core.scala 151:33]
    .clock(dcachebypass_clock),
    .reset(dcachebypass_reset),
    .io_dmem_en(dcachebypass_io_dmem_en),
    .io_dmem_op(dcachebypass_io_dmem_op),
    .io_dmem_addr(dcachebypass_io_dmem_addr),
    .io_dmem_wdata(dcachebypass_io_dmem_wdata),
    .io_dmem_wmask(dcachebypass_io_dmem_wmask),
    .io_dmem_transfer(dcachebypass_io_dmem_transfer),
    .io_dmem_ok(dcachebypass_io_dmem_ok),
    .io_dmem_rdata(dcachebypass_io_dmem_rdata),
    .io_axi_req(dcachebypass_io_axi_req),
    .io_axi_raddr(dcachebypass_io_axi_raddr),
    .io_axi_rvalid(dcachebypass_io_axi_rvalid),
    .io_axi_rdata(dcachebypass_io_axi_rdata),
    .io_axi_weq(dcachebypass_io_axi_weq),
    .io_axi_waddr(dcachebypass_io_axi_waddr),
    .io_axi_wdata(dcachebypass_io_axi_wdata),
    .io_axi_wmask(dcachebypass_io_axi_wmask),
    .io_axi_wdone(dcachebypass_io_axi_wdone),
    .io_axi_transfer(dcachebypass_io_axi_transfer)
  );
  ysyx_040596_AXI axi ( // @[Core.scala 153:33]
    .clock(axi_clock),
    .reset(axi_reset),
    .io_out_aw_ready(axi_io_out_aw_ready),
    .io_out_aw_valid(axi_io_out_aw_valid),
    .io_out_aw_bits_len(axi_io_out_aw_bits_len),
    .io_out_aw_bits_size(axi_io_out_aw_bits_size),
    .io_out_aw_bits_addr(axi_io_out_aw_bits_addr),
    .io_out_w_ready(axi_io_out_w_ready),
    .io_out_w_valid(axi_io_out_w_valid),
    .io_out_w_bits_data(axi_io_out_w_bits_data),
    .io_out_w_bits_strb(axi_io_out_w_bits_strb),
    .io_out_w_bits_last(axi_io_out_w_bits_last),
    .io_out_b_ready(axi_io_out_b_ready),
    .io_out_b_valid(axi_io_out_b_valid),
    .io_out_ar_ready(axi_io_out_ar_ready),
    .io_out_ar_valid(axi_io_out_ar_valid),
    .io_out_ar_bits_len(axi_io_out_ar_bits_len),
    .io_out_ar_bits_size(axi_io_out_ar_bits_size),
    .io_out_ar_bits_addr(axi_io_out_ar_bits_addr),
    .io_out_r_ready(axi_io_out_r_ready),
    .io_out_r_valid(axi_io_out_r_valid),
    .io_out_r_bits_data(axi_io_out_r_bits_data),
    .io_out_r_bits_last(axi_io_out_r_bits_last),
    .io_icacheio_req(axi_io_icacheio_req),
    .io_icacheio_addr(axi_io_icacheio_addr),
    .io_icacheio_valid(axi_io_icacheio_valid),
    .io_icacheio_data(axi_io_icacheio_data),
    .io_dcacheio_req(axi_io_dcacheio_req),
    .io_dcacheio_raddr(axi_io_dcacheio_raddr),
    .io_dcacheio_rvalid(axi_io_dcacheio_rvalid),
    .io_dcacheio_rdata(axi_io_dcacheio_rdata),
    .io_dcacheio_weq(axi_io_dcacheio_weq),
    .io_dcacheio_waddr(axi_io_dcacheio_waddr),
    .io_dcacheio_wdata(axi_io_dcacheio_wdata),
    .io_dcacheio_wdone(axi_io_dcacheio_wdone),
    .io_icacheBypassIO_req(axi_io_icacheBypassIO_req),
    .io_icacheBypassIO_addr(axi_io_icacheBypassIO_addr),
    .io_icacheBypassIO_valid(axi_io_icacheBypassIO_valid),
    .io_icacheBypassIO_data(axi_io_icacheBypassIO_data),
    .io_dcacheBypassIO_req(axi_io_dcacheBypassIO_req),
    .io_dcacheBypassIO_raddr(axi_io_dcacheBypassIO_raddr),
    .io_dcacheBypassIO_rvalid(axi_io_dcacheBypassIO_rvalid),
    .io_dcacheBypassIO_rdata(axi_io_dcacheBypassIO_rdata),
    .io_dcacheBypassIO_weq(axi_io_dcacheBypassIO_weq),
    .io_dcacheBypassIO_waddr(axi_io_dcacheBypassIO_waddr),
    .io_dcacheBypassIO_wdata(axi_io_dcacheBypassIO_wdata),
    .io_dcacheBypassIO_wmask(axi_io_dcacheBypassIO_wmask),
    .io_dcacheBypassIO_wdone(axi_io_dcacheBypassIO_wdone),
    .io_dcacheBypassIO_transfer(axi_io_dcacheBypassIO_transfer)
  );
  assign io_axi_aw_valid = axi_io_out_aw_valid; // @[Core.scala 267:19]
  assign io_axi_aw_bits_len = axi_io_out_aw_bits_len; // @[Core.scala 267:19]
  assign io_axi_aw_bits_size = axi_io_out_aw_bits_size; // @[Core.scala 267:19]
  assign io_axi_aw_bits_addr = axi_io_out_aw_bits_addr; // @[Core.scala 267:19]
  assign io_axi_w_valid = axi_io_out_w_valid; // @[Core.scala 268:19]
  assign io_axi_w_bits_data = axi_io_out_w_bits_data; // @[Core.scala 268:19]
  assign io_axi_w_bits_strb = axi_io_out_w_bits_strb; // @[Core.scala 268:19]
  assign io_axi_w_bits_last = axi_io_out_w_bits_last; // @[Core.scala 268:19]
  assign io_axi_b_ready = axi_io_out_b_ready; // @[Core.scala 269:19]
  assign io_axi_ar_valid = axi_io_out_ar_valid; // @[Core.scala 265:19]
  assign io_axi_ar_bits_len = axi_io_out_ar_bits_len; // @[Core.scala 265:19]
  assign io_axi_ar_bits_size = axi_io_out_ar_bits_size; // @[Core.scala 265:19]
  assign io_axi_ar_bits_addr = axi_io_out_ar_bits_addr; // @[Core.scala 265:19]
  assign io_axi_r_ready = axi_io_out_r_ready; // @[Core.scala 266:19]
  assign io_sram0_addr = icache_io_sram0_addr; // @[Core.scala 220:21]
  assign io_sram0_wen = icache_io_sram0_wen; // @[Core.scala 220:21]
  assign io_sram0_wmask = icache_io_sram0_wmask; // @[Core.scala 220:21]
  assign io_sram0_wdata = icache_io_sram0_wdata; // @[Core.scala 220:21]
  assign io_sram1_addr = icache_io_sram1_addr; // @[Core.scala 221:21]
  assign io_sram1_wen = icache_io_sram1_wen; // @[Core.scala 221:21]
  assign io_sram1_wmask = icache_io_sram1_wmask; // @[Core.scala 221:21]
  assign io_sram1_wdata = icache_io_sram1_wdata; // @[Core.scala 221:21]
  assign io_sram2_addr = icache_io_sram2_addr; // @[Core.scala 222:21]
  assign io_sram2_wen = icache_io_sram2_wen; // @[Core.scala 222:21]
  assign io_sram2_wmask = icache_io_sram2_wmask; // @[Core.scala 222:21]
  assign io_sram2_wdata = icache_io_sram2_wdata; // @[Core.scala 222:21]
  assign io_sram3_addr = icache_io_sram3_addr; // @[Core.scala 223:21]
  assign io_sram3_wen = icache_io_sram3_wen; // @[Core.scala 223:21]
  assign io_sram3_wmask = icache_io_sram3_wmask; // @[Core.scala 223:21]
  assign io_sram3_wdata = icache_io_sram3_wdata; // @[Core.scala 223:21]
  assign io_sram4_addr = dcache_io_sram0_addr; // @[Core.scala 224:21]
  assign io_sram4_wen = dcache_io_sram0_wen; // @[Core.scala 224:21]
  assign io_sram4_wmask = dcache_io_sram0_wmask; // @[Core.scala 224:21]
  assign io_sram4_wdata = dcache_io_sram0_wdata; // @[Core.scala 224:21]
  assign io_sram5_addr = dcache_io_sram1_addr; // @[Core.scala 225:21]
  assign io_sram5_wen = dcache_io_sram1_wen; // @[Core.scala 225:21]
  assign io_sram5_wmask = dcache_io_sram1_wmask; // @[Core.scala 225:21]
  assign io_sram5_wdata = dcache_io_sram1_wdata; // @[Core.scala 225:21]
  assign io_sram6_addr = dcache_io_sram2_addr; // @[Core.scala 226:21]
  assign io_sram6_wen = dcache_io_sram2_wen; // @[Core.scala 226:21]
  assign io_sram6_wmask = dcache_io_sram2_wmask; // @[Core.scala 226:21]
  assign io_sram6_wdata = dcache_io_sram2_wdata; // @[Core.scala 226:21]
  assign io_sram7_addr = dcache_io_sram3_addr; // @[Core.scala 227:21]
  assign io_sram7_wen = dcache_io_sram3_wen; // @[Core.scala 227:21]
  assign io_sram7_wmask = dcache_io_sram3_wmask; // @[Core.scala 227:21]
  assign io_sram7_wdata = dcache_io_sram3_wdata; // @[Core.scala 227:21]
  assign pipeline_clock = clock;
  assign pipeline_reset = reset;
  assign pipeline_io_imem_data = icache_io_imem_data; // @[Core.scala 241:29]
  assign pipeline_io_dmem_rdata = dmmio_io_dmem_rdata; // @[Core.scala 252:29]
  assign pipeline_io_rs1_data = rfu_io_rs1_data; // @[Core.scala 174:29]
  assign pipeline_io_rs2_data = rfu_io_rs2_data; // @[Core.scala 175:29]
  assign pipeline_io_mu_out = mu_io_mu_out; // @[Core.scala 185:25]
  assign pipeline_io_du_out = du_io_du_out; // @[Core.scala 191:25]
  assign pipeline_io_csr_rdata = csru_io_rdata; // @[Core.scala 195:29]
  assign pipeline_io_csr_mtvec = csru_io_mtvec; // @[Core.scala 209:29]
  assign pipeline_io_csr_mepc = csru_io_mepc; // @[Core.scala 210:29]
  assign pipeline_io_intr = csru_io_time_intr & ~env_go; // @[Core.scala 206:46]
  assign pipeline_io_stall_id = pipeline_io_rfconflict | imem_not_ok | env_wait | fence_wait | fence_running; // @[Core.scala 166:96]
  assign pipeline_io_stall_ie = mu_io_stall | du_io_stall; // @[Core.scala 167:44]
  assign pipeline_io_stall_wb = ~dmmio_io_dmem_ok; // @[Core.scala 160:23]
  assign rfu_clock = clock;
  assign rfu_reset = reset;
  assign rfu_io_rs1_addr = pipeline_io_rs1_addr; // @[Core.scala 172:29]
  assign rfu_io_rs2_addr = pipeline_io_rs2_addr; // @[Core.scala 173:29]
  assign rfu_io_rd_en = pipeline_io_commit & pipeline_io_rf_rd_en; // @[Core.scala 176:43]
  assign rfu_io_rd_addr = pipeline_io_rf_rd_addr; // @[Core.scala 177:21]
  assign rfu_io_rd_data = pipeline_io_rf_rd_data; // @[Core.scala 178:21]
  assign csru_clock = clock;
  assign csru_reset = reset;
  assign csru_io_raddr = pipeline_io_csr_raddr; // @[Core.scala 194:29]
  assign csru_io_wen = pipeline_io_commit & pipeline_io_csr_wen; // @[Core.scala 196:51]
  assign csru_io_waddr = pipeline_io_csr_waddr; // @[Core.scala 197:29]
  assign csru_io_wdata = pipeline_io_csr_wdata; // @[Core.scala 198:29]
  assign csru_io_ecall = env_go & pipeline_io_id_ecall; // @[Core.scala 211:31]
  assign csru_io_mret = env_go & pipeline_io_id_mret; // @[Core.scala 212:31]
  assign csru_io_pc = pipeline_io_id_pc; // @[Core.scala 213:21]
  assign csru_io_interrupt = env_go & pipeline_io_id_intr; // @[Core.scala 203:35]
  assign csru_io_cause = pipeline_io_id_cause; // @[Core.scala 204:25]
  assign fence_clock = clock;
  assign fence_reset = reset;
  assign fence_io_go = pipeline_io_id_fencei & _env_go_T_4 & _env_go_T_5 & _env_go_T_7; // @[Core.scala 163:93]
  assign fence_io_ifence_done = icache_io_fence_done; // @[Core.scala 216:21]
  assign fence_io_dfence_done = dcache_io_fence_done; // @[Core.scala 217:21]
  assign mu_clock = clock;
  assign mu_reset = reset;
  assign mu_io_en = pipeline_io_mu_code != 2'h0 & pipeline_io_ie_valid; // @[Core.scala 181:56]
  assign mu_io_mu_code = pipeline_io_mu_code; // @[Core.scala 182:25]
  assign mu_io_op1 = pipeline_io_mu_op1; // @[Core.scala 183:25]
  assign mu_io_op2 = pipeline_io_mu_op2; // @[Core.scala 184:25]
  assign du_clock = clock;
  assign du_reset = reset;
  assign du_io_en = pipeline_io_du_code != 8'h0 & pipeline_io_ie_valid; // @[Core.scala 187:56]
  assign du_io_du_code = pipeline_io_du_code; // @[Core.scala 188:25]
  assign du_io_op1 = pipeline_io_du_op1; // @[Core.scala 189:25]
  assign du_io_op2 = pipeline_io_du_op2; // @[Core.scala 190:25]
  assign icache_clock = clock;
  assign icache_reset = reset;
  assign icache_io_imem_addr = pipeline_io_imem_addr; // @[Core.scala 239:29]
  assign icache_io_imem_en = pipeline_io_imem_en; // @[Core.scala 240:29]
  assign icache_io_axi_valid = icacheaxi_io_in_valid; // @[Core.scala 254:19]
  assign icache_io_axi_data = icacheaxi_io_in_data; // @[Core.scala 254:19]
  assign icache_io_fence_req = fence_io_ifence_req; // @[Core.scala 216:21]
  assign icache_io_sram0_rdata = io_sram0_rdata; // @[Core.scala 220:21]
  assign icache_io_sram1_rdata = io_sram1_rdata; // @[Core.scala 221:21]
  assign icache_io_sram2_rdata = io_sram2_rdata; // @[Core.scala 222:21]
  assign icache_io_sram3_rdata = io_sram3_rdata; // @[Core.scala 223:21]
  assign icacheaxi_clock = clock;
  assign icacheaxi_reset = reset;
  assign icacheaxi_io_in_req = icache_io_axi_req; // @[Core.scala 254:19]
  assign icacheaxi_io_in_addr = icache_io_axi_addr; // @[Core.scala 254:19]
  assign icacheaxi_io_out0_valid = axi_io_icacheio_valid; // @[Core.scala 255:23]
  assign icacheaxi_io_out0_data = axi_io_icacheio_data; // @[Core.scala 255:23]
  assign icacheaxi_io_out1_valid = axi_io_icacheBypassIO_valid; // @[Core.scala 256:23]
  assign icacheaxi_io_out1_data = axi_io_icacheBypassIO_data; // @[Core.scala 256:23]
  assign dmmio_clock = clock;
  assign dmmio_reset = reset;
  assign dmmio_io_dmem_en = dmem_en & pipeline_io_mem_valid; // @[Core.scala 246:40]
  assign dmmio_io_dmem_op = pipeline_io_dmem_wen; // @[Core.scala 247:29]
  assign dmmio_io_dmem_addr = pipeline_io_dmem_wen ? pipeline_io_dmem_waddr : pipeline_io_dmem_raddr; // @[Core.scala 245:24]
  assign dmmio_io_dmem_wdata = pipeline_io_dmem_wdata; // @[Core.scala 249:29]
  assign dmmio_io_dmem_wmask = pipeline_io_dmem_wmask; // @[Core.scala 250:29]
  assign dmmio_io_dmem_transfer = pipeline_io_dmem_transfer; // @[Core.scala 251:29]
  assign dmmio_io_mem0_ok = dcache_io_dmem_ok; // @[Core.scala 258:19]
  assign dmmio_io_mem0_rdata = dcache_io_dmem_rdata; // @[Core.scala 258:19]
  assign dmmio_io_mem1_rdata = clintreg_io_mem_rdata; // @[Core.scala 259:19]
  assign dmmio_io_mem2_ok = dcachebypass_io_dmem_ok; // @[Core.scala 260:19]
  assign dmmio_io_mem2_rdata = dcachebypass_io_dmem_rdata; // @[Core.scala 260:19]
  assign dcache_clock = clock;
  assign dcache_reset = reset;
  assign dcache_io_dmem_en = dmmio_io_mem0_en; // @[Core.scala 258:19]
  assign dcache_io_dmem_op = dmmio_io_mem0_op; // @[Core.scala 258:19]
  assign dcache_io_dmem_addr = dmmio_io_mem0_addr; // @[Core.scala 258:19]
  assign dcache_io_dmem_wdata = dmmio_io_mem0_wdata; // @[Core.scala 258:19]
  assign dcache_io_dmem_wmask = dmmio_io_mem0_wmask; // @[Core.scala 258:19]
  assign dcache_io_axi_rvalid = axi_io_dcacheio_rvalid; // @[Core.scala 262:25]
  assign dcache_io_axi_rdata = axi_io_dcacheio_rdata; // @[Core.scala 262:25]
  assign dcache_io_axi_wdone = axi_io_dcacheio_wdone; // @[Core.scala 262:25]
  assign dcache_io_fence_req = fence_io_dfence_req; // @[Core.scala 217:21]
  assign dcache_io_sram0_rdata = io_sram4_rdata; // @[Core.scala 224:21]
  assign dcache_io_sram1_rdata = io_sram5_rdata; // @[Core.scala 225:21]
  assign dcache_io_sram2_rdata = io_sram6_rdata; // @[Core.scala 226:21]
  assign dcache_io_sram3_rdata = io_sram7_rdata; // @[Core.scala 227:21]
  assign clintreg_clock = clock;
  assign clintreg_reset = reset;
  assign clintreg_io_mem_en = dmmio_io_mem1_en; // @[Core.scala 259:19]
  assign clintreg_io_mem_op = dmmio_io_mem1_op; // @[Core.scala 259:19]
  assign clintreg_io_mem_addr = dmmio_io_mem1_addr; // @[Core.scala 259:19]
  assign clintreg_io_mem_wdata = dmmio_io_mem1_wdata; // @[Core.scala 259:19]
  assign clintreg_io_mem_wmask = dmmio_io_mem1_wmask; // @[Core.scala 259:19]
  assign dcachebypass_clock = clock;
  assign dcachebypass_reset = reset;
  assign dcachebypass_io_dmem_en = dmmio_io_mem2_en; // @[Core.scala 260:19]
  assign dcachebypass_io_dmem_op = dmmio_io_mem2_op; // @[Core.scala 260:19]
  assign dcachebypass_io_dmem_addr = dmmio_io_mem2_addr; // @[Core.scala 260:19]
  assign dcachebypass_io_dmem_wdata = dmmio_io_mem2_wdata; // @[Core.scala 260:19]
  assign dcachebypass_io_dmem_wmask = dmmio_io_mem2_wmask; // @[Core.scala 260:19]
  assign dcachebypass_io_dmem_transfer = dmmio_io_mem2_transfer; // @[Core.scala 260:19]
  assign dcachebypass_io_axi_rvalid = axi_io_dcacheBypassIO_rvalid; // @[Core.scala 263:25]
  assign dcachebypass_io_axi_rdata = axi_io_dcacheBypassIO_rdata; // @[Core.scala 263:25]
  assign dcachebypass_io_axi_wdone = axi_io_dcacheBypassIO_wdone; // @[Core.scala 263:25]
  assign axi_clock = clock;
  assign axi_reset = reset;
  assign axi_io_out_aw_ready = io_axi_aw_ready; // @[Core.scala 267:19]
  assign axi_io_out_w_ready = io_axi_w_ready; // @[Core.scala 268:19]
  assign axi_io_out_b_valid = io_axi_b_valid; // @[Core.scala 269:19]
  assign axi_io_out_ar_ready = io_axi_ar_ready; // @[Core.scala 265:19]
  assign axi_io_out_r_valid = io_axi_r_valid; // @[Core.scala 266:19]
  assign axi_io_out_r_bits_data = io_axi_r_bits_data; // @[Core.scala 266:19]
  assign axi_io_out_r_bits_last = io_axi_r_bits_last; // @[Core.scala 266:19]
  assign axi_io_icacheio_req = icacheaxi_io_out0_req; // @[Core.scala 255:23]
  assign axi_io_icacheio_addr = icacheaxi_io_out0_addr; // @[Core.scala 255:23]
  assign axi_io_dcacheio_req = dcache_io_axi_req; // @[Core.scala 262:25]
  assign axi_io_dcacheio_raddr = dcache_io_axi_raddr; // @[Core.scala 262:25]
  assign axi_io_dcacheio_weq = dcache_io_axi_weq; // @[Core.scala 262:25]
  assign axi_io_dcacheio_waddr = dcache_io_axi_waddr; // @[Core.scala 262:25]
  assign axi_io_dcacheio_wdata = dcache_io_axi_wdata; // @[Core.scala 262:25]
  assign axi_io_icacheBypassIO_req = icacheaxi_io_out1_req; // @[Core.scala 256:23]
  assign axi_io_icacheBypassIO_addr = icacheaxi_io_out1_addr; // @[Core.scala 256:23]
  assign axi_io_dcacheBypassIO_req = dcachebypass_io_axi_req; // @[Core.scala 263:25]
  assign axi_io_dcacheBypassIO_raddr = dcachebypass_io_axi_raddr; // @[Core.scala 263:25]
  assign axi_io_dcacheBypassIO_weq = dcachebypass_io_axi_weq; // @[Core.scala 263:25]
  assign axi_io_dcacheBypassIO_waddr = dcachebypass_io_axi_waddr; // @[Core.scala 263:25]
  assign axi_io_dcacheBypassIO_wdata = dcachebypass_io_axi_wdata; // @[Core.scala 263:25]
  assign axi_io_dcacheBypassIO_wmask = dcachebypass_io_axi_wmask; // @[Core.scala 263:25]
  assign axi_io_dcacheBypassIO_transfer = dcachebypass_io_axi_transfer; // @[Core.scala 263:25]
endmodule
module ysyx_040596(
  input          clock,
  input          reset,
  input          io_interrupt,
  input          io_master_awready,
  output         io_master_awvalid,
  output [3:0]   io_master_awid,
  output [31:0]  io_master_awaddr,
  output [7:0]   io_master_awlen,
  output [2:0]   io_master_awsize,
  output [1:0]   io_master_awburst,
  input          io_master_wready,
  output         io_master_wvalid,
  output [63:0]  io_master_wdata,
  output [7:0]   io_master_wstrb,
  output         io_master_wlast,
  output         io_master_bready,
  input          io_master_bvalid,
  input  [3:0]   io_master_bid,
  input  [1:0]   io_master_bresp,
  input          io_master_arready,
  output         io_master_arvalid,
  output [3:0]   io_master_arid,
  output [31:0]  io_master_araddr,
  output [7:0]   io_master_arlen,
  output [2:0]   io_master_arsize,
  output [1:0]   io_master_arburst,
  output         io_master_rready,
  input          io_master_rvalid,
  input  [3:0]   io_master_rid,
  input  [1:0]   io_master_rresp,
  input  [63:0]  io_master_rdata,
  input          io_master_rlast,
  output         io_slave_awready,
  input          io_slave_awvalid,
  input  [3:0]   io_slave_awid,
  input  [31:0]  io_slave_awaddr,
  input  [7:0]   io_slave_awlen,
  input  [2:0]   io_slave_awsize,
  input  [1:0]   io_slave_awburst,
  output         io_slave_wready,
  input          io_slave_wvalid,
  input  [63:0]  io_slave_wdata,
  input  [7:0]   io_slave_wstrb,
  input          io_slave_wlast,
  input          io_slave_bready,
  output         io_slave_bvalid,
  output [3:0]   io_slave_bid,
  output [1:0]   io_slave_bresp,
  output         io_slave_arready,
  input          io_slave_arvalid,
  input  [3:0]   io_slave_arid,
  input  [31:0]  io_slave_araddr,
  input  [7:0]   io_slave_arlen,
  input  [2:0]   io_slave_arsize,
  input  [1:0]   io_slave_arburst,
  input          io_slave_rready,
  output         io_slave_rvalid,
  output [3:0]   io_slave_rid,
  output [1:0]   io_slave_rresp,
  output [63:0]  io_slave_rdata,
  output         io_slave_rlast,
  output [5:0]   io_sram0_addr,
  output         io_sram0_cen,
  output         io_sram0_wen,
  output [127:0] io_sram0_wmask,
  output [127:0] io_sram0_wdata,
  input  [127:0] io_sram0_rdata,
  output [5:0]   io_sram1_addr,
  output         io_sram1_cen,
  output         io_sram1_wen,
  output [127:0] io_sram1_wmask,
  output [127:0] io_sram1_wdata,
  input  [127:0] io_sram1_rdata,
  output [5:0]   io_sram2_addr,
  output         io_sram2_cen,
  output         io_sram2_wen,
  output [127:0] io_sram2_wmask,
  output [127:0] io_sram2_wdata,
  input  [127:0] io_sram2_rdata,
  output [5:0]   io_sram3_addr,
  output         io_sram3_cen,
  output         io_sram3_wen,
  output [127:0] io_sram3_wmask,
  output [127:0] io_sram3_wdata,
  input  [127:0] io_sram3_rdata,
  output [5:0]   io_sram4_addr,
  output         io_sram4_cen,
  output         io_sram4_wen,
  output [127:0] io_sram4_wmask,
  output [127:0] io_sram4_wdata,
  input  [127:0] io_sram4_rdata,
  output [5:0]   io_sram5_addr,
  output         io_sram5_cen,
  output         io_sram5_wen,
  output [127:0] io_sram5_wmask,
  output [127:0] io_sram5_wdata,
  input  [127:0] io_sram5_rdata,
  output [5:0]   io_sram6_addr,
  output         io_sram6_cen,
  output         io_sram6_wen,
  output [127:0] io_sram6_wmask,
  output [127:0] io_sram6_wdata,
  input  [127:0] io_sram6_rdata,
  output [5:0]   io_sram7_addr,
  output         io_sram7_cen,
  output         io_sram7_wen,
  output [127:0] io_sram7_wmask,
  output [127:0] io_sram7_wdata,
  input  [127:0] io_sram7_rdata
);
  wire  core_clock; // @[SimTop.scala 121:22]
  wire  core_reset; // @[SimTop.scala 121:22]
  wire  core_io_axi_aw_ready; // @[SimTop.scala 121:22]
  wire  core_io_axi_aw_valid; // @[SimTop.scala 121:22]
  wire [7:0] core_io_axi_aw_bits_len; // @[SimTop.scala 121:22]
  wire [2:0] core_io_axi_aw_bits_size; // @[SimTop.scala 121:22]
  wire [63:0] core_io_axi_aw_bits_addr; // @[SimTop.scala 121:22]
  wire  core_io_axi_w_ready; // @[SimTop.scala 121:22]
  wire  core_io_axi_w_valid; // @[SimTop.scala 121:22]
  wire [63:0] core_io_axi_w_bits_data; // @[SimTop.scala 121:22]
  wire [7:0] core_io_axi_w_bits_strb; // @[SimTop.scala 121:22]
  wire  core_io_axi_w_bits_last; // @[SimTop.scala 121:22]
  wire  core_io_axi_b_ready; // @[SimTop.scala 121:22]
  wire  core_io_axi_b_valid; // @[SimTop.scala 121:22]
  wire  core_io_axi_ar_ready; // @[SimTop.scala 121:22]
  wire  core_io_axi_ar_valid; // @[SimTop.scala 121:22]
  wire [7:0] core_io_axi_ar_bits_len; // @[SimTop.scala 121:22]
  wire [2:0] core_io_axi_ar_bits_size; // @[SimTop.scala 121:22]
  wire [63:0] core_io_axi_ar_bits_addr; // @[SimTop.scala 121:22]
  wire  core_io_axi_r_ready; // @[SimTop.scala 121:22]
  wire  core_io_axi_r_valid; // @[SimTop.scala 121:22]
  wire [63:0] core_io_axi_r_bits_data; // @[SimTop.scala 121:22]
  wire  core_io_axi_r_bits_last; // @[SimTop.scala 121:22]
  wire [5:0] core_io_sram0_addr; // @[SimTop.scala 121:22]
  wire  core_io_sram0_wen; // @[SimTop.scala 121:22]
  wire [127:0] core_io_sram0_wmask; // @[SimTop.scala 121:22]
  wire [127:0] core_io_sram0_wdata; // @[SimTop.scala 121:22]
  wire [127:0] core_io_sram0_rdata; // @[SimTop.scala 121:22]
  wire [5:0] core_io_sram1_addr; // @[SimTop.scala 121:22]
  wire  core_io_sram1_wen; // @[SimTop.scala 121:22]
  wire [127:0] core_io_sram1_wmask; // @[SimTop.scala 121:22]
  wire [127:0] core_io_sram1_wdata; // @[SimTop.scala 121:22]
  wire [127:0] core_io_sram1_rdata; // @[SimTop.scala 121:22]
  wire [5:0] core_io_sram2_addr; // @[SimTop.scala 121:22]
  wire  core_io_sram2_wen; // @[SimTop.scala 121:22]
  wire [127:0] core_io_sram2_wmask; // @[SimTop.scala 121:22]
  wire [127:0] core_io_sram2_wdata; // @[SimTop.scala 121:22]
  wire [127:0] core_io_sram2_rdata; // @[SimTop.scala 121:22]
  wire [5:0] core_io_sram3_addr; // @[SimTop.scala 121:22]
  wire  core_io_sram3_wen; // @[SimTop.scala 121:22]
  wire [127:0] core_io_sram3_wmask; // @[SimTop.scala 121:22]
  wire [127:0] core_io_sram3_wdata; // @[SimTop.scala 121:22]
  wire [127:0] core_io_sram3_rdata; // @[SimTop.scala 121:22]
  wire [5:0] core_io_sram4_addr; // @[SimTop.scala 121:22]
  wire  core_io_sram4_wen; // @[SimTop.scala 121:22]
  wire [127:0] core_io_sram4_wmask; // @[SimTop.scala 121:22]
  wire [127:0] core_io_sram4_wdata; // @[SimTop.scala 121:22]
  wire [127:0] core_io_sram4_rdata; // @[SimTop.scala 121:22]
  wire [5:0] core_io_sram5_addr; // @[SimTop.scala 121:22]
  wire  core_io_sram5_wen; // @[SimTop.scala 121:22]
  wire [127:0] core_io_sram5_wmask; // @[SimTop.scala 121:22]
  wire [127:0] core_io_sram5_wdata; // @[SimTop.scala 121:22]
  wire [127:0] core_io_sram5_rdata; // @[SimTop.scala 121:22]
  wire [5:0] core_io_sram6_addr; // @[SimTop.scala 121:22]
  wire  core_io_sram6_wen; // @[SimTop.scala 121:22]
  wire [127:0] core_io_sram6_wmask; // @[SimTop.scala 121:22]
  wire [127:0] core_io_sram6_wdata; // @[SimTop.scala 121:22]
  wire [127:0] core_io_sram6_rdata; // @[SimTop.scala 121:22]
  wire [5:0] core_io_sram7_addr; // @[SimTop.scala 121:22]
  wire  core_io_sram7_wen; // @[SimTop.scala 121:22]
  wire [127:0] core_io_sram7_wmask; // @[SimTop.scala 121:22]
  wire [127:0] core_io_sram7_wdata; // @[SimTop.scala 121:22]
  wire [127:0] core_io_sram7_rdata; // @[SimTop.scala 121:22]
  ysyx_040596_Core core ( // @[SimTop.scala 121:22]
    .clock(core_clock),
    .reset(core_reset),
    .io_axi_aw_ready(core_io_axi_aw_ready),
    .io_axi_aw_valid(core_io_axi_aw_valid),
    .io_axi_aw_bits_len(core_io_axi_aw_bits_len),
    .io_axi_aw_bits_size(core_io_axi_aw_bits_size),
    .io_axi_aw_bits_addr(core_io_axi_aw_bits_addr),
    .io_axi_w_ready(core_io_axi_w_ready),
    .io_axi_w_valid(core_io_axi_w_valid),
    .io_axi_w_bits_data(core_io_axi_w_bits_data),
    .io_axi_w_bits_strb(core_io_axi_w_bits_strb),
    .io_axi_w_bits_last(core_io_axi_w_bits_last),
    .io_axi_b_ready(core_io_axi_b_ready),
    .io_axi_b_valid(core_io_axi_b_valid),
    .io_axi_ar_ready(core_io_axi_ar_ready),
    .io_axi_ar_valid(core_io_axi_ar_valid),
    .io_axi_ar_bits_len(core_io_axi_ar_bits_len),
    .io_axi_ar_bits_size(core_io_axi_ar_bits_size),
    .io_axi_ar_bits_addr(core_io_axi_ar_bits_addr),
    .io_axi_r_ready(core_io_axi_r_ready),
    .io_axi_r_valid(core_io_axi_r_valid),
    .io_axi_r_bits_data(core_io_axi_r_bits_data),
    .io_axi_r_bits_last(core_io_axi_r_bits_last),
    .io_sram0_addr(core_io_sram0_addr),
    .io_sram0_wen(core_io_sram0_wen),
    .io_sram0_wmask(core_io_sram0_wmask),
    .io_sram0_wdata(core_io_sram0_wdata),
    .io_sram0_rdata(core_io_sram0_rdata),
    .io_sram1_addr(core_io_sram1_addr),
    .io_sram1_wen(core_io_sram1_wen),
    .io_sram1_wmask(core_io_sram1_wmask),
    .io_sram1_wdata(core_io_sram1_wdata),
    .io_sram1_rdata(core_io_sram1_rdata),
    .io_sram2_addr(core_io_sram2_addr),
    .io_sram2_wen(core_io_sram2_wen),
    .io_sram2_wmask(core_io_sram2_wmask),
    .io_sram2_wdata(core_io_sram2_wdata),
    .io_sram2_rdata(core_io_sram2_rdata),
    .io_sram3_addr(core_io_sram3_addr),
    .io_sram3_wen(core_io_sram3_wen),
    .io_sram3_wmask(core_io_sram3_wmask),
    .io_sram3_wdata(core_io_sram3_wdata),
    .io_sram3_rdata(core_io_sram3_rdata),
    .io_sram4_addr(core_io_sram4_addr),
    .io_sram4_wen(core_io_sram4_wen),
    .io_sram4_wmask(core_io_sram4_wmask),
    .io_sram4_wdata(core_io_sram4_wdata),
    .io_sram4_rdata(core_io_sram4_rdata),
    .io_sram5_addr(core_io_sram5_addr),
    .io_sram5_wen(core_io_sram5_wen),
    .io_sram5_wmask(core_io_sram5_wmask),
    .io_sram5_wdata(core_io_sram5_wdata),
    .io_sram5_rdata(core_io_sram5_rdata),
    .io_sram6_addr(core_io_sram6_addr),
    .io_sram6_wen(core_io_sram6_wen),
    .io_sram6_wmask(core_io_sram6_wmask),
    .io_sram6_wdata(core_io_sram6_wdata),
    .io_sram6_rdata(core_io_sram6_rdata),
    .io_sram7_addr(core_io_sram7_addr),
    .io_sram7_wen(core_io_sram7_wen),
    .io_sram7_wmask(core_io_sram7_wmask),
    .io_sram7_wdata(core_io_sram7_wdata),
    .io_sram7_rdata(core_io_sram7_rdata)
  );
  assign io_master_awvalid = core_io_axi_aw_valid; // @[SimTop.scala 153:29]
  assign io_master_awid = 4'h0; // @[SimTop.scala 155:29]
  assign io_master_awaddr = core_io_axi_aw_bits_addr[31:0]; // @[SimTop.scala 154:29]
  assign io_master_awlen = core_io_axi_aw_bits_len; // @[SimTop.scala 156:29]
  assign io_master_awsize = core_io_axi_aw_bits_size; // @[SimTop.scala 157:29]
  assign io_master_awburst = 2'h1; // @[SimTop.scala 158:29]
  assign io_master_wvalid = core_io_axi_w_valid; // @[SimTop.scala 161:29]
  assign io_master_wdata = core_io_axi_w_bits_data; // @[SimTop.scala 162:29]
  assign io_master_wstrb = core_io_axi_w_bits_strb; // @[SimTop.scala 163:29]
  assign io_master_wlast = core_io_axi_w_bits_last; // @[SimTop.scala 164:29]
  assign io_master_bready = core_io_axi_b_ready; // @[SimTop.scala 166:29]
  assign io_master_arvalid = core_io_axi_ar_valid; // @[SimTop.scala 172:29]
  assign io_master_arid = 4'h0; // @[SimTop.scala 174:29]
  assign io_master_araddr = core_io_axi_ar_bits_addr[31:0]; // @[SimTop.scala 173:29]
  assign io_master_arlen = core_io_axi_ar_bits_len; // @[SimTop.scala 175:29]
  assign io_master_arsize = core_io_axi_ar_bits_size; // @[SimTop.scala 176:29]
  assign io_master_arburst = 2'h1; // @[SimTop.scala 177:29]
  assign io_master_rready = core_io_axi_r_ready; // @[SimTop.scala 179:29]
  assign io_slave_awready = 1'h0; // @[SimTop.scala 190:23]
  assign io_slave_wready = 1'h0; // @[SimTop.scala 198:23]
  assign io_slave_bvalid = 1'h0; // @[SimTop.scala 205:23]
  assign io_slave_bid = 4'h0; // @[SimTop.scala 207:23]
  assign io_slave_bresp = 2'h0; // @[SimTop.scala 206:23]
  assign io_slave_arready = 1'h0; // @[SimTop.scala 209:23]
  assign io_slave_rvalid = 1'h0; // @[SimTop.scala 218:23]
  assign io_slave_rid = 4'h0; // @[SimTop.scala 222:23]
  assign io_slave_rresp = 2'h0; // @[SimTop.scala 219:23]
  assign io_slave_rdata = 64'h0; // @[SimTop.scala 220:23]
  assign io_slave_rlast = 1'h0; // @[SimTop.scala 221:23]
  assign io_sram0_addr = core_io_sram0_addr; // @[SimTop.scala 142:19]
  assign io_sram0_cen = 1'h0; // @[SimTop.scala 142:19]
  assign io_sram0_wen = core_io_sram0_wen; // @[SimTop.scala 142:19]
  assign io_sram0_wmask = core_io_sram0_wmask; // @[SimTop.scala 142:19]
  assign io_sram0_wdata = core_io_sram0_wdata; // @[SimTop.scala 142:19]
  assign io_sram1_addr = core_io_sram1_addr; // @[SimTop.scala 143:19]
  assign io_sram1_cen = 1'h0; // @[SimTop.scala 143:19]
  assign io_sram1_wen = core_io_sram1_wen; // @[SimTop.scala 143:19]
  assign io_sram1_wmask = core_io_sram1_wmask; // @[SimTop.scala 143:19]
  assign io_sram1_wdata = core_io_sram1_wdata; // @[SimTop.scala 143:19]
  assign io_sram2_addr = core_io_sram2_addr; // @[SimTop.scala 144:19]
  assign io_sram2_cen = 1'h0; // @[SimTop.scala 144:19]
  assign io_sram2_wen = core_io_sram2_wen; // @[SimTop.scala 144:19]
  assign io_sram2_wmask = core_io_sram2_wmask; // @[SimTop.scala 144:19]
  assign io_sram2_wdata = core_io_sram2_wdata; // @[SimTop.scala 144:19]
  assign io_sram3_addr = core_io_sram3_addr; // @[SimTop.scala 145:19]
  assign io_sram3_cen = 1'h0; // @[SimTop.scala 145:19]
  assign io_sram3_wen = core_io_sram3_wen; // @[SimTop.scala 145:19]
  assign io_sram3_wmask = core_io_sram3_wmask; // @[SimTop.scala 145:19]
  assign io_sram3_wdata = core_io_sram3_wdata; // @[SimTop.scala 145:19]
  assign io_sram4_addr = core_io_sram4_addr; // @[SimTop.scala 146:19]
  assign io_sram4_cen = 1'h0; // @[SimTop.scala 146:19]
  assign io_sram4_wen = core_io_sram4_wen; // @[SimTop.scala 146:19]
  assign io_sram4_wmask = core_io_sram4_wmask; // @[SimTop.scala 146:19]
  assign io_sram4_wdata = core_io_sram4_wdata; // @[SimTop.scala 146:19]
  assign io_sram5_addr = core_io_sram5_addr; // @[SimTop.scala 147:19]
  assign io_sram5_cen = 1'h0; // @[SimTop.scala 147:19]
  assign io_sram5_wen = core_io_sram5_wen; // @[SimTop.scala 147:19]
  assign io_sram5_wmask = core_io_sram5_wmask; // @[SimTop.scala 147:19]
  assign io_sram5_wdata = core_io_sram5_wdata; // @[SimTop.scala 147:19]
  assign io_sram6_addr = core_io_sram6_addr; // @[SimTop.scala 148:19]
  assign io_sram6_cen = 1'h0; // @[SimTop.scala 148:19]
  assign io_sram6_wen = core_io_sram6_wen; // @[SimTop.scala 148:19]
  assign io_sram6_wmask = core_io_sram6_wmask; // @[SimTop.scala 148:19]
  assign io_sram6_wdata = core_io_sram6_wdata; // @[SimTop.scala 148:19]
  assign io_sram7_addr = core_io_sram7_addr; // @[SimTop.scala 149:19]
  assign io_sram7_cen = 1'h0; // @[SimTop.scala 149:19]
  assign io_sram7_wen = core_io_sram7_wen; // @[SimTop.scala 149:19]
  assign io_sram7_wmask = core_io_sram7_wmask; // @[SimTop.scala 149:19]
  assign io_sram7_wdata = core_io_sram7_wdata; // @[SimTop.scala 149:19]
  assign core_clock = clock;
  assign core_reset = reset;
  assign core_io_axi_aw_ready = io_master_awready; // @[SimTop.scala 152:29]
  assign core_io_axi_w_ready = io_master_wready; // @[SimTop.scala 160:29]
  assign core_io_axi_b_valid = io_master_bvalid; // @[SimTop.scala 167:29]
  assign core_io_axi_ar_ready = io_master_arready; // @[SimTop.scala 171:29]
  assign core_io_axi_r_valid = io_master_rvalid; // @[SimTop.scala 180:29]
  assign core_io_axi_r_bits_data = io_master_rdata; // @[SimTop.scala 182:29]
  assign core_io_axi_r_bits_last = io_master_rlast; // @[SimTop.scala 183:29]
  assign core_io_sram0_rdata = io_sram0_rdata; // @[SimTop.scala 142:19]
  assign core_io_sram1_rdata = io_sram1_rdata; // @[SimTop.scala 143:19]
  assign core_io_sram2_rdata = io_sram2_rdata; // @[SimTop.scala 144:19]
  assign core_io_sram3_rdata = io_sram3_rdata; // @[SimTop.scala 145:19]
  assign core_io_sram4_rdata = io_sram4_rdata; // @[SimTop.scala 146:19]
  assign core_io_sram5_rdata = io_sram5_rdata; // @[SimTop.scala 147:19]
  assign core_io_sram6_rdata = io_sram6_rdata; // @[SimTop.scala 148:19]
  assign core_io_sram7_rdata = io_sram7_rdata; // @[SimTop.scala 149:19]
endmodule
