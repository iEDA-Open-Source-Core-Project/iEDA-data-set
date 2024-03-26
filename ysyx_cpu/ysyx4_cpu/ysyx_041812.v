module ysyx_041812_AluSimple(
  input  [63:0] io_A,
  input  [63:0] io_B,
  input  [1:0]  io_width_type,
  input  [3:0]  io_alu_op,
  output [63:0] io_out
);
  wire  _shamt_T = io_width_type == 2'h1; // @[alu.scala 50:39]
  wire [5:0] shamt = io_width_type == 2'h1 ? {{1'd0}, io_B[4:0]} : io_B[5:0]; // @[alu.scala 50:24]
  wire [63:0] _out_T_1 = io_A + io_B; // @[alu.scala 55:42]
  wire [63:0] _out_T_3 = io_A - io_B; // @[alu.scala 56:42]
  wire [31:0] _out_T_6 = io_A[31:0]; // @[alu.scala 57:75]
  wire [63:0] _out_T_8 = _shamt_T ? $signed({{32{_out_T_6[31]}},_out_T_6}) : $signed(io_A); // @[alu.scala 57:40]
  wire [63:0] _out_T_10 = $signed(_out_T_8) >>> shamt; // @[alu.scala 57:112]
  wire [63:0] _out_T_11 = io_A >> shamt; // @[alu.scala 58:42]
  wire [126:0] _GEN_1 = {{63'd0}, io_A}; // @[alu.scala 59:42]
  wire [126:0] _out_T_12 = _GEN_1 << shamt; // @[alu.scala 59:42]
  wire  _out_T_15 = $signed(io_A) < $signed(io_B); // @[alu.scala 60:49]
  wire  _out_T_16 = io_A < io_B; // @[alu.scala 61:43]
  wire [63:0] _out_T_17 = io_A & io_B; // @[alu.scala 62:42]
  wire [63:0] _out_T_18 = io_A | io_B; // @[alu.scala 63:41]
  wire [63:0] _out_T_19 = io_A ^ io_B; // @[alu.scala 64:42]
  wire [4:0] _GEN_0 = {{1'd0}, io_alu_op}; // @[Mux.scala 81:61]
  wire [63:0] _out_T_21 = 5'h0 == _GEN_0 ? _out_T_1 : io_B; // @[Mux.scala 81:58]
  wire [63:0] _out_T_23 = 5'h1 == _GEN_0 ? _out_T_3 : _out_T_21; // @[Mux.scala 81:58]
  wire [63:0] _out_T_25 = 5'h9 == _GEN_0 ? _out_T_10 : _out_T_23; // @[Mux.scala 81:58]
  wire [63:0] _out_T_27 = 5'h8 == _GEN_0 ? _out_T_11 : _out_T_25; // @[Mux.scala 81:58]
  wire [126:0] _out_T_29 = 5'h6 == _GEN_0 ? _out_T_12 : {{63'd0}, _out_T_27}; // @[Mux.scala 81:58]
  wire [126:0] _out_T_31 = 5'h5 == _GEN_0 ? {{126'd0}, _out_T_15} : _out_T_29; // @[Mux.scala 81:58]
  wire [126:0] _out_T_33 = 5'h7 == _GEN_0 ? {{126'd0}, _out_T_16} : _out_T_31; // @[Mux.scala 81:58]
  wire [126:0] _out_T_35 = 5'h2 == _GEN_0 ? {{63'd0}, _out_T_17} : _out_T_33; // @[Mux.scala 81:58]
  wire [126:0] _out_T_37 = 5'h3 == _GEN_0 ? {{63'd0}, _out_T_18} : _out_T_35; // @[Mux.scala 81:58]
  wire [126:0] _out_T_39 = 5'h4 == _GEN_0 ? {{63'd0}, _out_T_19} : _out_T_37; // @[Mux.scala 81:58]
  wire [126:0] _out_T_41 = 5'ha == _GEN_0 ? {{63'd0}, io_A} : _out_T_39; // @[Mux.scala 81:58]
  wire [63:0] out = _out_T_41[63:0];
  wire [31:0] _io_out_T_3 = out[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 74:12]
  wire [63:0] _io_out_T_5 = {_io_out_T_3,out[31:0]}; // @[Cat.scala 31:58]
  assign io_out = _shamt_T ? _io_out_T_5 : out; // @[alu.scala 76:22]
endmodule
module ysyx_041812_ImmGenWire(
  input  [31:0] io_inst,
  input  [2:0]  io_sel,
  output [63:0] io_out
);
  wire  sign = io_inst[31]; // @[immGen.scala 19:27]
  wire [31:0] _Iimm_T_1 = sign ? 32'hffffffff : 32'h0; // @[Bitwise.scala 74:12]
  wire [11:0] Iimm_lo = io_inst[31:20]; // @[Cat.scala 31:58]
  wire [43:0] Iimm = {_Iimm_T_1,Iimm_lo}; // @[immGen.scala 21:64]
  wire [11:0] Simm_lo = {io_inst[31:25],io_inst[11:7]}; // @[Cat.scala 31:58]
  wire [43:0] Simm = {_Iimm_T_1,Simm_lo}; // @[immGen.scala 22:85]
  wire [12:0] Bimm_lo_1 = {sign,io_inst[7],io_inst[30:25],io_inst[11:8],1'h0}; // @[Cat.scala 31:58]
  wire [44:0] Bimm = {_Iimm_T_1,Bimm_lo_1}; // @[immGen.scala 23:120]
  wire [31:0] Uimm_lo = {io_inst[31:12],12'h0}; // @[Cat.scala 31:58]
  wire [63:0] Uimm = {_Iimm_T_1,Uimm_lo}; // @[immGen.scala 24:80]
  wire [20:0] Jimm_lo_1 = {sign,io_inst[19:12],io_inst[20],io_inst[30:25],io_inst[24:21],1'h0}; // @[Cat.scala 31:58]
  wire [52:0] Jimm = {_Iimm_T_1,Jimm_lo_1}; // @[immGen.scala 25:139]
  wire [63:0] Zimm = {59'h0,io_inst[19:15]}; // @[immGen.scala 26:56]
  wire [43:0] _io_out_T_1 = $signed(Iimm) & -44'sh2; // @[immGen.scala 31:22]
  wire [43:0] _io_out_T_3 = 3'h1 == io_sel ? $signed(Iimm) : $signed(_io_out_T_1); // @[Mux.scala 81:58]
  wire [43:0] _io_out_T_5 = 3'h2 == io_sel ? $signed(Simm) : $signed(_io_out_T_3); // @[Mux.scala 81:58]
  wire [44:0] _io_out_T_7 = 3'h5 == io_sel ? $signed(Bimm) : $signed({{1{_io_out_T_5[43]}},_io_out_T_5}); // @[Mux.scala 81:58]
  wire [63:0] _io_out_T_9 = 3'h3 == io_sel ? $signed(Uimm) : $signed({{19{_io_out_T_7[44]}},_io_out_T_7}); // @[Mux.scala 81:58]
  wire [63:0] _io_out_T_11 = 3'h4 == io_sel ? $signed({{11{Jimm[52]}},Jimm}) : $signed(_io_out_T_9); // @[Mux.scala 81:58]
  assign io_out = 3'h6 == io_sel ? $signed(Zimm) : $signed(_io_out_T_11); // @[immGen.scala 33:11]
endmodule
module ysyx_041812_BrCondSimple(
  input  [63:0] io_rs1,
  input  [63:0] io_rs2,
  input  [2:0]  io_br_type,
  output        io_taken
);
  wire  eq = io_rs1 == io_rs2; // @[BrCond.scala 21:25]
  wire  neq = ~eq; // @[BrCond.scala 22:19]
  wire  lt = $signed(io_rs1) < $signed(io_rs2); // @[BrCond.scala 23:32]
  wire  ge = ~lt; // @[BrCond.scala 24:18]
  wire  ltu = io_rs1 < io_rs2; // @[BrCond.scala 25:26]
  wire  geu = ~ltu; // @[BrCond.scala 26:19]
  wire  _io_taken_T_3 = io_br_type == 3'h6 & neq; // @[BrCond.scala 29:41]
  wire  _io_taken_T_4 = io_br_type == 3'h3 & eq | _io_taken_T_3; // @[BrCond.scala 28:48]
  wire  _io_taken_T_6 = io_br_type == 3'h2 & lt; // @[BrCond.scala 30:41]
  wire  _io_taken_T_7 = _io_taken_T_4 | _io_taken_T_6; // @[BrCond.scala 29:49]
  wire  _io_taken_T_9 = io_br_type == 3'h5 & ge; // @[BrCond.scala 31:41]
  wire  _io_taken_T_10 = _io_taken_T_7 | _io_taken_T_9; // @[BrCond.scala 30:48]
  wire  _io_taken_T_12 = io_br_type == 3'h1 & ltu; // @[BrCond.scala 32:42]
  wire  _io_taken_T_13 = _io_taken_T_10 | _io_taken_T_12; // @[BrCond.scala 31:48]
  wire  _io_taken_T_15 = io_br_type == 3'h4 & geu; // @[BrCond.scala 33:42]
  assign io_taken = _io_taken_T_13 | _io_taken_T_15; // @[BrCond.scala 32:50]
endmodule
module ysyx_041812_RegisterFile(
  input         clock,
  input         reset,
  input         io_wen,
  input  [4:0]  io_waddr,
  input  [63:0] io_wdata,
  input  [4:0]  io_raddr_0,
  input  [4:0]  io_raddr_1,
  output [63:0] io_rdata_0,
  output [63:0] io_rdata_1
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
  reg [63:0] reg_0; // @[datapath.scala 35:22]
  reg [63:0] reg_1; // @[datapath.scala 35:22]
  reg [63:0] reg_2; // @[datapath.scala 35:22]
  reg [63:0] reg_3; // @[datapath.scala 35:22]
  reg [63:0] reg_4; // @[datapath.scala 35:22]
  reg [63:0] reg_5; // @[datapath.scala 35:22]
  reg [63:0] reg_6; // @[datapath.scala 35:22]
  reg [63:0] reg_7; // @[datapath.scala 35:22]
  reg [63:0] reg_8; // @[datapath.scala 35:22]
  reg [63:0] reg_9; // @[datapath.scala 35:22]
  reg [63:0] reg_10; // @[datapath.scala 35:22]
  reg [63:0] reg_11; // @[datapath.scala 35:22]
  reg [63:0] reg_12; // @[datapath.scala 35:22]
  reg [63:0] reg_13; // @[datapath.scala 35:22]
  reg [63:0] reg_14; // @[datapath.scala 35:22]
  reg [63:0] reg_15; // @[datapath.scala 35:22]
  reg [63:0] reg_16; // @[datapath.scala 35:22]
  reg [63:0] reg_17; // @[datapath.scala 35:22]
  reg [63:0] reg_18; // @[datapath.scala 35:22]
  reg [63:0] reg_19; // @[datapath.scala 35:22]
  reg [63:0] reg_20; // @[datapath.scala 35:22]
  reg [63:0] reg_21; // @[datapath.scala 35:22]
  reg [63:0] reg_22; // @[datapath.scala 35:22]
  reg [63:0] reg_23; // @[datapath.scala 35:22]
  reg [63:0] reg_24; // @[datapath.scala 35:22]
  reg [63:0] reg_25; // @[datapath.scala 35:22]
  reg [63:0] reg_26; // @[datapath.scala 35:22]
  reg [63:0] reg_27; // @[datapath.scala 35:22]
  reg [63:0] reg_28; // @[datapath.scala 35:22]
  reg [63:0] reg_29; // @[datapath.scala 35:22]
  reg [63:0] reg_30; // @[datapath.scala 35:22]
  reg [63:0] reg_31; // @[datapath.scala 35:22]
  wire [63:0] _GEN_65 = 5'h1 == io_raddr_0 ? reg_1 : reg_0; // @[datapath.scala 48:{37,37}]
  wire [63:0] _GEN_66 = 5'h2 == io_raddr_0 ? reg_2 : _GEN_65; // @[datapath.scala 48:{37,37}]
  wire [63:0] _GEN_67 = 5'h3 == io_raddr_0 ? reg_3 : _GEN_66; // @[datapath.scala 48:{37,37}]
  wire [63:0] _GEN_68 = 5'h4 == io_raddr_0 ? reg_4 : _GEN_67; // @[datapath.scala 48:{37,37}]
  wire [63:0] _GEN_69 = 5'h5 == io_raddr_0 ? reg_5 : _GEN_68; // @[datapath.scala 48:{37,37}]
  wire [63:0] _GEN_70 = 5'h6 == io_raddr_0 ? reg_6 : _GEN_69; // @[datapath.scala 48:{37,37}]
  wire [63:0] _GEN_71 = 5'h7 == io_raddr_0 ? reg_7 : _GEN_70; // @[datapath.scala 48:{37,37}]
  wire [63:0] _GEN_72 = 5'h8 == io_raddr_0 ? reg_8 : _GEN_71; // @[datapath.scala 48:{37,37}]
  wire [63:0] _GEN_73 = 5'h9 == io_raddr_0 ? reg_9 : _GEN_72; // @[datapath.scala 48:{37,37}]
  wire [63:0] _GEN_74 = 5'ha == io_raddr_0 ? reg_10 : _GEN_73; // @[datapath.scala 48:{37,37}]
  wire [63:0] _GEN_75 = 5'hb == io_raddr_0 ? reg_11 : _GEN_74; // @[datapath.scala 48:{37,37}]
  wire [63:0] _GEN_76 = 5'hc == io_raddr_0 ? reg_12 : _GEN_75; // @[datapath.scala 48:{37,37}]
  wire [63:0] _GEN_77 = 5'hd == io_raddr_0 ? reg_13 : _GEN_76; // @[datapath.scala 48:{37,37}]
  wire [63:0] _GEN_78 = 5'he == io_raddr_0 ? reg_14 : _GEN_77; // @[datapath.scala 48:{37,37}]
  wire [63:0] _GEN_79 = 5'hf == io_raddr_0 ? reg_15 : _GEN_78; // @[datapath.scala 48:{37,37}]
  wire [63:0] _GEN_80 = 5'h10 == io_raddr_0 ? reg_16 : _GEN_79; // @[datapath.scala 48:{37,37}]
  wire [63:0] _GEN_81 = 5'h11 == io_raddr_0 ? reg_17 : _GEN_80; // @[datapath.scala 48:{37,37}]
  wire [63:0] _GEN_82 = 5'h12 == io_raddr_0 ? reg_18 : _GEN_81; // @[datapath.scala 48:{37,37}]
  wire [63:0] _GEN_83 = 5'h13 == io_raddr_0 ? reg_19 : _GEN_82; // @[datapath.scala 48:{37,37}]
  wire [63:0] _GEN_84 = 5'h14 == io_raddr_0 ? reg_20 : _GEN_83; // @[datapath.scala 48:{37,37}]
  wire [63:0] _GEN_85 = 5'h15 == io_raddr_0 ? reg_21 : _GEN_84; // @[datapath.scala 48:{37,37}]
  wire [63:0] _GEN_86 = 5'h16 == io_raddr_0 ? reg_22 : _GEN_85; // @[datapath.scala 48:{37,37}]
  wire [63:0] _GEN_87 = 5'h17 == io_raddr_0 ? reg_23 : _GEN_86; // @[datapath.scala 48:{37,37}]
  wire [63:0] _GEN_88 = 5'h18 == io_raddr_0 ? reg_24 : _GEN_87; // @[datapath.scala 48:{37,37}]
  wire [63:0] _GEN_89 = 5'h19 == io_raddr_0 ? reg_25 : _GEN_88; // @[datapath.scala 48:{37,37}]
  wire [63:0] _GEN_90 = 5'h1a == io_raddr_0 ? reg_26 : _GEN_89; // @[datapath.scala 48:{37,37}]
  wire [63:0] _GEN_91 = 5'h1b == io_raddr_0 ? reg_27 : _GEN_90; // @[datapath.scala 48:{37,37}]
  wire [63:0] _GEN_92 = 5'h1c == io_raddr_0 ? reg_28 : _GEN_91; // @[datapath.scala 48:{37,37}]
  wire [63:0] _GEN_93 = 5'h1d == io_raddr_0 ? reg_29 : _GEN_92; // @[datapath.scala 48:{37,37}]
  wire [63:0] _GEN_94 = 5'h1e == io_raddr_0 ? reg_30 : _GEN_93; // @[datapath.scala 48:{37,37}]
  wire [63:0] _GEN_95 = 5'h1f == io_raddr_0 ? reg_31 : _GEN_94; // @[datapath.scala 48:{37,37}]
  wire [63:0] _GEN_98 = 5'h1 == io_raddr_1 ? reg_1 : reg_0; // @[datapath.scala 48:{37,37}]
  wire [63:0] _GEN_99 = 5'h2 == io_raddr_1 ? reg_2 : _GEN_98; // @[datapath.scala 48:{37,37}]
  wire [63:0] _GEN_100 = 5'h3 == io_raddr_1 ? reg_3 : _GEN_99; // @[datapath.scala 48:{37,37}]
  wire [63:0] _GEN_101 = 5'h4 == io_raddr_1 ? reg_4 : _GEN_100; // @[datapath.scala 48:{37,37}]
  wire [63:0] _GEN_102 = 5'h5 == io_raddr_1 ? reg_5 : _GEN_101; // @[datapath.scala 48:{37,37}]
  wire [63:0] _GEN_103 = 5'h6 == io_raddr_1 ? reg_6 : _GEN_102; // @[datapath.scala 48:{37,37}]
  wire [63:0] _GEN_104 = 5'h7 == io_raddr_1 ? reg_7 : _GEN_103; // @[datapath.scala 48:{37,37}]
  wire [63:0] _GEN_105 = 5'h8 == io_raddr_1 ? reg_8 : _GEN_104; // @[datapath.scala 48:{37,37}]
  wire [63:0] _GEN_106 = 5'h9 == io_raddr_1 ? reg_9 : _GEN_105; // @[datapath.scala 48:{37,37}]
  wire [63:0] _GEN_107 = 5'ha == io_raddr_1 ? reg_10 : _GEN_106; // @[datapath.scala 48:{37,37}]
  wire [63:0] _GEN_108 = 5'hb == io_raddr_1 ? reg_11 : _GEN_107; // @[datapath.scala 48:{37,37}]
  wire [63:0] _GEN_109 = 5'hc == io_raddr_1 ? reg_12 : _GEN_108; // @[datapath.scala 48:{37,37}]
  wire [63:0] _GEN_110 = 5'hd == io_raddr_1 ? reg_13 : _GEN_109; // @[datapath.scala 48:{37,37}]
  wire [63:0] _GEN_111 = 5'he == io_raddr_1 ? reg_14 : _GEN_110; // @[datapath.scala 48:{37,37}]
  wire [63:0] _GEN_112 = 5'hf == io_raddr_1 ? reg_15 : _GEN_111; // @[datapath.scala 48:{37,37}]
  wire [63:0] _GEN_113 = 5'h10 == io_raddr_1 ? reg_16 : _GEN_112; // @[datapath.scala 48:{37,37}]
  wire [63:0] _GEN_114 = 5'h11 == io_raddr_1 ? reg_17 : _GEN_113; // @[datapath.scala 48:{37,37}]
  wire [63:0] _GEN_115 = 5'h12 == io_raddr_1 ? reg_18 : _GEN_114; // @[datapath.scala 48:{37,37}]
  wire [63:0] _GEN_116 = 5'h13 == io_raddr_1 ? reg_19 : _GEN_115; // @[datapath.scala 48:{37,37}]
  wire [63:0] _GEN_117 = 5'h14 == io_raddr_1 ? reg_20 : _GEN_116; // @[datapath.scala 48:{37,37}]
  wire [63:0] _GEN_118 = 5'h15 == io_raddr_1 ? reg_21 : _GEN_117; // @[datapath.scala 48:{37,37}]
  wire [63:0] _GEN_119 = 5'h16 == io_raddr_1 ? reg_22 : _GEN_118; // @[datapath.scala 48:{37,37}]
  wire [63:0] _GEN_120 = 5'h17 == io_raddr_1 ? reg_23 : _GEN_119; // @[datapath.scala 48:{37,37}]
  wire [63:0] _GEN_121 = 5'h18 == io_raddr_1 ? reg_24 : _GEN_120; // @[datapath.scala 48:{37,37}]
  wire [63:0] _GEN_122 = 5'h19 == io_raddr_1 ? reg_25 : _GEN_121; // @[datapath.scala 48:{37,37}]
  wire [63:0] _GEN_123 = 5'h1a == io_raddr_1 ? reg_26 : _GEN_122; // @[datapath.scala 48:{37,37}]
  wire [63:0] _GEN_124 = 5'h1b == io_raddr_1 ? reg_27 : _GEN_123; // @[datapath.scala 48:{37,37}]
  wire [63:0] _GEN_125 = 5'h1c == io_raddr_1 ? reg_28 : _GEN_124; // @[datapath.scala 48:{37,37}]
  wire [63:0] _GEN_126 = 5'h1d == io_raddr_1 ? reg_29 : _GEN_125; // @[datapath.scala 48:{37,37}]
  wire [63:0] _GEN_127 = 5'h1e == io_raddr_1 ? reg_30 : _GEN_126; // @[datapath.scala 48:{37,37}]
  wire [63:0] _GEN_128 = 5'h1f == io_raddr_1 ? reg_31 : _GEN_127; // @[datapath.scala 48:{37,37}]
  assign io_rdata_0 = io_raddr_0 == 5'h0 ? 64'h0 : _GEN_95; // @[datapath.scala 45:42 46:37 48:37]
  assign io_rdata_1 = io_raddr_1 == 5'h0 ? 64'h0 : _GEN_128; // @[datapath.scala 45:42 46:37 48:37]
  always @(posedge clock) begin
    if (reset) begin // @[datapath.scala 35:22]
      reg_0 <= 64'h0; // @[datapath.scala 35:22]
    end else if (io_wen) begin // @[datapath.scala 37:17]
      if (5'h0 == io_waddr) begin // @[datapath.scala 38:23]
        reg_0 <= io_wdata; // @[datapath.scala 38:23]
      end
    end
    if (reset) begin // @[datapath.scala 35:22]
      reg_1 <= 64'h0; // @[datapath.scala 35:22]
    end else if (io_wen) begin // @[datapath.scala 37:17]
      if (5'h1 == io_waddr) begin // @[datapath.scala 38:23]
        reg_1 <= io_wdata; // @[datapath.scala 38:23]
      end
    end
    if (reset) begin // @[datapath.scala 35:22]
      reg_2 <= 64'h0; // @[datapath.scala 35:22]
    end else if (io_wen) begin // @[datapath.scala 37:17]
      if (5'h2 == io_waddr) begin // @[datapath.scala 38:23]
        reg_2 <= io_wdata; // @[datapath.scala 38:23]
      end
    end
    if (reset) begin // @[datapath.scala 35:22]
      reg_3 <= 64'h0; // @[datapath.scala 35:22]
    end else if (io_wen) begin // @[datapath.scala 37:17]
      if (5'h3 == io_waddr) begin // @[datapath.scala 38:23]
        reg_3 <= io_wdata; // @[datapath.scala 38:23]
      end
    end
    if (reset) begin // @[datapath.scala 35:22]
      reg_4 <= 64'h0; // @[datapath.scala 35:22]
    end else if (io_wen) begin // @[datapath.scala 37:17]
      if (5'h4 == io_waddr) begin // @[datapath.scala 38:23]
        reg_4 <= io_wdata; // @[datapath.scala 38:23]
      end
    end
    if (reset) begin // @[datapath.scala 35:22]
      reg_5 <= 64'h0; // @[datapath.scala 35:22]
    end else if (io_wen) begin // @[datapath.scala 37:17]
      if (5'h5 == io_waddr) begin // @[datapath.scala 38:23]
        reg_5 <= io_wdata; // @[datapath.scala 38:23]
      end
    end
    if (reset) begin // @[datapath.scala 35:22]
      reg_6 <= 64'h0; // @[datapath.scala 35:22]
    end else if (io_wen) begin // @[datapath.scala 37:17]
      if (5'h6 == io_waddr) begin // @[datapath.scala 38:23]
        reg_6 <= io_wdata; // @[datapath.scala 38:23]
      end
    end
    if (reset) begin // @[datapath.scala 35:22]
      reg_7 <= 64'h0; // @[datapath.scala 35:22]
    end else if (io_wen) begin // @[datapath.scala 37:17]
      if (5'h7 == io_waddr) begin // @[datapath.scala 38:23]
        reg_7 <= io_wdata; // @[datapath.scala 38:23]
      end
    end
    if (reset) begin // @[datapath.scala 35:22]
      reg_8 <= 64'h0; // @[datapath.scala 35:22]
    end else if (io_wen) begin // @[datapath.scala 37:17]
      if (5'h8 == io_waddr) begin // @[datapath.scala 38:23]
        reg_8 <= io_wdata; // @[datapath.scala 38:23]
      end
    end
    if (reset) begin // @[datapath.scala 35:22]
      reg_9 <= 64'h0; // @[datapath.scala 35:22]
    end else if (io_wen) begin // @[datapath.scala 37:17]
      if (5'h9 == io_waddr) begin // @[datapath.scala 38:23]
        reg_9 <= io_wdata; // @[datapath.scala 38:23]
      end
    end
    if (reset) begin // @[datapath.scala 35:22]
      reg_10 <= 64'h0; // @[datapath.scala 35:22]
    end else if (io_wen) begin // @[datapath.scala 37:17]
      if (5'ha == io_waddr) begin // @[datapath.scala 38:23]
        reg_10 <= io_wdata; // @[datapath.scala 38:23]
      end
    end
    if (reset) begin // @[datapath.scala 35:22]
      reg_11 <= 64'h0; // @[datapath.scala 35:22]
    end else if (io_wen) begin // @[datapath.scala 37:17]
      if (5'hb == io_waddr) begin // @[datapath.scala 38:23]
        reg_11 <= io_wdata; // @[datapath.scala 38:23]
      end
    end
    if (reset) begin // @[datapath.scala 35:22]
      reg_12 <= 64'h0; // @[datapath.scala 35:22]
    end else if (io_wen) begin // @[datapath.scala 37:17]
      if (5'hc == io_waddr) begin // @[datapath.scala 38:23]
        reg_12 <= io_wdata; // @[datapath.scala 38:23]
      end
    end
    if (reset) begin // @[datapath.scala 35:22]
      reg_13 <= 64'h0; // @[datapath.scala 35:22]
    end else if (io_wen) begin // @[datapath.scala 37:17]
      if (5'hd == io_waddr) begin // @[datapath.scala 38:23]
        reg_13 <= io_wdata; // @[datapath.scala 38:23]
      end
    end
    if (reset) begin // @[datapath.scala 35:22]
      reg_14 <= 64'h0; // @[datapath.scala 35:22]
    end else if (io_wen) begin // @[datapath.scala 37:17]
      if (5'he == io_waddr) begin // @[datapath.scala 38:23]
        reg_14 <= io_wdata; // @[datapath.scala 38:23]
      end
    end
    if (reset) begin // @[datapath.scala 35:22]
      reg_15 <= 64'h0; // @[datapath.scala 35:22]
    end else if (io_wen) begin // @[datapath.scala 37:17]
      if (5'hf == io_waddr) begin // @[datapath.scala 38:23]
        reg_15 <= io_wdata; // @[datapath.scala 38:23]
      end
    end
    if (reset) begin // @[datapath.scala 35:22]
      reg_16 <= 64'h0; // @[datapath.scala 35:22]
    end else if (io_wen) begin // @[datapath.scala 37:17]
      if (5'h10 == io_waddr) begin // @[datapath.scala 38:23]
        reg_16 <= io_wdata; // @[datapath.scala 38:23]
      end
    end
    if (reset) begin // @[datapath.scala 35:22]
      reg_17 <= 64'h0; // @[datapath.scala 35:22]
    end else if (io_wen) begin // @[datapath.scala 37:17]
      if (5'h11 == io_waddr) begin // @[datapath.scala 38:23]
        reg_17 <= io_wdata; // @[datapath.scala 38:23]
      end
    end
    if (reset) begin // @[datapath.scala 35:22]
      reg_18 <= 64'h0; // @[datapath.scala 35:22]
    end else if (io_wen) begin // @[datapath.scala 37:17]
      if (5'h12 == io_waddr) begin // @[datapath.scala 38:23]
        reg_18 <= io_wdata; // @[datapath.scala 38:23]
      end
    end
    if (reset) begin // @[datapath.scala 35:22]
      reg_19 <= 64'h0; // @[datapath.scala 35:22]
    end else if (io_wen) begin // @[datapath.scala 37:17]
      if (5'h13 == io_waddr) begin // @[datapath.scala 38:23]
        reg_19 <= io_wdata; // @[datapath.scala 38:23]
      end
    end
    if (reset) begin // @[datapath.scala 35:22]
      reg_20 <= 64'h0; // @[datapath.scala 35:22]
    end else if (io_wen) begin // @[datapath.scala 37:17]
      if (5'h14 == io_waddr) begin // @[datapath.scala 38:23]
        reg_20 <= io_wdata; // @[datapath.scala 38:23]
      end
    end
    if (reset) begin // @[datapath.scala 35:22]
      reg_21 <= 64'h0; // @[datapath.scala 35:22]
    end else if (io_wen) begin // @[datapath.scala 37:17]
      if (5'h15 == io_waddr) begin // @[datapath.scala 38:23]
        reg_21 <= io_wdata; // @[datapath.scala 38:23]
      end
    end
    if (reset) begin // @[datapath.scala 35:22]
      reg_22 <= 64'h0; // @[datapath.scala 35:22]
    end else if (io_wen) begin // @[datapath.scala 37:17]
      if (5'h16 == io_waddr) begin // @[datapath.scala 38:23]
        reg_22 <= io_wdata; // @[datapath.scala 38:23]
      end
    end
    if (reset) begin // @[datapath.scala 35:22]
      reg_23 <= 64'h0; // @[datapath.scala 35:22]
    end else if (io_wen) begin // @[datapath.scala 37:17]
      if (5'h17 == io_waddr) begin // @[datapath.scala 38:23]
        reg_23 <= io_wdata; // @[datapath.scala 38:23]
      end
    end
    if (reset) begin // @[datapath.scala 35:22]
      reg_24 <= 64'h0; // @[datapath.scala 35:22]
    end else if (io_wen) begin // @[datapath.scala 37:17]
      if (5'h18 == io_waddr) begin // @[datapath.scala 38:23]
        reg_24 <= io_wdata; // @[datapath.scala 38:23]
      end
    end
    if (reset) begin // @[datapath.scala 35:22]
      reg_25 <= 64'h0; // @[datapath.scala 35:22]
    end else if (io_wen) begin // @[datapath.scala 37:17]
      if (5'h19 == io_waddr) begin // @[datapath.scala 38:23]
        reg_25 <= io_wdata; // @[datapath.scala 38:23]
      end
    end
    if (reset) begin // @[datapath.scala 35:22]
      reg_26 <= 64'h0; // @[datapath.scala 35:22]
    end else if (io_wen) begin // @[datapath.scala 37:17]
      if (5'h1a == io_waddr) begin // @[datapath.scala 38:23]
        reg_26 <= io_wdata; // @[datapath.scala 38:23]
      end
    end
    if (reset) begin // @[datapath.scala 35:22]
      reg_27 <= 64'h0; // @[datapath.scala 35:22]
    end else if (io_wen) begin // @[datapath.scala 37:17]
      if (5'h1b == io_waddr) begin // @[datapath.scala 38:23]
        reg_27 <= io_wdata; // @[datapath.scala 38:23]
      end
    end
    if (reset) begin // @[datapath.scala 35:22]
      reg_28 <= 64'h0; // @[datapath.scala 35:22]
    end else if (io_wen) begin // @[datapath.scala 37:17]
      if (5'h1c == io_waddr) begin // @[datapath.scala 38:23]
        reg_28 <= io_wdata; // @[datapath.scala 38:23]
      end
    end
    if (reset) begin // @[datapath.scala 35:22]
      reg_29 <= 64'h0; // @[datapath.scala 35:22]
    end else if (io_wen) begin // @[datapath.scala 37:17]
      if (5'h1d == io_waddr) begin // @[datapath.scala 38:23]
        reg_29 <= io_wdata; // @[datapath.scala 38:23]
      end
    end
    if (reset) begin // @[datapath.scala 35:22]
      reg_30 <= 64'h0; // @[datapath.scala 35:22]
    end else if (io_wen) begin // @[datapath.scala 37:17]
      if (5'h1e == io_waddr) begin // @[datapath.scala 38:23]
        reg_30 <= io_wdata; // @[datapath.scala 38:23]
      end
    end
    if (reset) begin // @[datapath.scala 35:22]
      reg_31 <= 64'h0; // @[datapath.scala 35:22]
    end else if (io_wen) begin // @[datapath.scala 37:17]
      if (5'h1f == io_waddr) begin // @[datapath.scala 38:23]
        reg_31 <= io_wdata; // @[datapath.scala 38:23]
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
  reg_0 = _RAND_0[63:0];
  _RAND_1 = {2{`RANDOM}};
  reg_1 = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  reg_2 = _RAND_2[63:0];
  _RAND_3 = {2{`RANDOM}};
  reg_3 = _RAND_3[63:0];
  _RAND_4 = {2{`RANDOM}};
  reg_4 = _RAND_4[63:0];
  _RAND_5 = {2{`RANDOM}};
  reg_5 = _RAND_5[63:0];
  _RAND_6 = {2{`RANDOM}};
  reg_6 = _RAND_6[63:0];
  _RAND_7 = {2{`RANDOM}};
  reg_7 = _RAND_7[63:0];
  _RAND_8 = {2{`RANDOM}};
  reg_8 = _RAND_8[63:0];
  _RAND_9 = {2{`RANDOM}};
  reg_9 = _RAND_9[63:0];
  _RAND_10 = {2{`RANDOM}};
  reg_10 = _RAND_10[63:0];
  _RAND_11 = {2{`RANDOM}};
  reg_11 = _RAND_11[63:0];
  _RAND_12 = {2{`RANDOM}};
  reg_12 = _RAND_12[63:0];
  _RAND_13 = {2{`RANDOM}};
  reg_13 = _RAND_13[63:0];
  _RAND_14 = {2{`RANDOM}};
  reg_14 = _RAND_14[63:0];
  _RAND_15 = {2{`RANDOM}};
  reg_15 = _RAND_15[63:0];
  _RAND_16 = {2{`RANDOM}};
  reg_16 = _RAND_16[63:0];
  _RAND_17 = {2{`RANDOM}};
  reg_17 = _RAND_17[63:0];
  _RAND_18 = {2{`RANDOM}};
  reg_18 = _RAND_18[63:0];
  _RAND_19 = {2{`RANDOM}};
  reg_19 = _RAND_19[63:0];
  _RAND_20 = {2{`RANDOM}};
  reg_20 = _RAND_20[63:0];
  _RAND_21 = {2{`RANDOM}};
  reg_21 = _RAND_21[63:0];
  _RAND_22 = {2{`RANDOM}};
  reg_22 = _RAND_22[63:0];
  _RAND_23 = {2{`RANDOM}};
  reg_23 = _RAND_23[63:0];
  _RAND_24 = {2{`RANDOM}};
  reg_24 = _RAND_24[63:0];
  _RAND_25 = {2{`RANDOM}};
  reg_25 = _RAND_25[63:0];
  _RAND_26 = {2{`RANDOM}};
  reg_26 = _RAND_26[63:0];
  _RAND_27 = {2{`RANDOM}};
  reg_27 = _RAND_27[63:0];
  _RAND_28 = {2{`RANDOM}};
  reg_28 = _RAND_28[63:0];
  _RAND_29 = {2{`RANDOM}};
  reg_29 = _RAND_29[63:0];
  _RAND_30 = {2{`RANDOM}};
  reg_30 = _RAND_30[63:0];
  _RAND_31 = {2{`RANDOM}};
  reg_31 = _RAND_31[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_041812_Multiplier(
  input         clock,
  input         reset,
  input         io_mul_valid,
  input         io_flush,
  input         io_mulw,
  input  [1:0]  io_mul_op,
  input  [63:0] io_multilicand,
  input  [63:0] io_multiplier,
  output        io_out_valid,
  output [63:0] io_result
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [63:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] mul_state; // @[MDU.scala 32:32]
  reg [63:0] multiplicand_reg; // @[MDU.scala 33:39]
  reg [63:0] multiplier_reg; // @[MDU.scala 34:37]
  reg [63:0] mid_result_0; // @[MDU.scala 36:33]
  reg [63:0] mid_result_1; // @[MDU.scala 36:33]
  reg [63:0] mid_result_2; // @[MDU.scala 36:33]
  reg [63:0] mid_result_3; // @[MDU.scala 36:33]
  reg  out_sign; // @[MDU.scala 37:31]
  reg  out_high; // @[MDU.scala 38:31]
  reg  is_w; // @[MDU.scala 39:27]
  wire  _T = mul_state == 2'h1; // @[MDU.scala 40:47]
  reg [4:0] index; // @[Counter.scala 62:40]
  wire  wrap_wrap = index == 5'h1f; // @[Counter.scala 74:24]
  wire [4:0] _wrap_value_T_1 = index + 5'h1; // @[Counter.scala 78:24]
  wire [4:0] _GEN_0 = _T ? _wrap_value_T_1 : index; // @[Counter.scala 120:16 78:15 62:40]
  wire  last = _T & wrap_wrap; // @[Counter.scala 120:{16,23}]
  wire [31:0] src1_lo = io_multilicand[31:0]; // @[Cat.scala 31:58]
  wire [63:0] _src1_T_3 = {32'h0,src1_lo}; // @[MDU.scala 53:78]
  wire [63:0] src1 = io_mulw ? $signed(_src1_T_3) : $signed(io_multilicand); // @[MDU.scala 53:23]
  wire [31:0] src2_lo = io_multiplier[31:0]; // @[Cat.scala 31:58]
  wire [63:0] _src2_T_3 = {32'h0,src2_lo}; // @[MDU.scala 54:77]
  wire [63:0] src2 = io_mulw ? $signed(_src2_T_3) : $signed(io_multiplier); // @[MDU.scala 54:23]
  wire  src1_sign = io_mulw ? src1[31] : src1[63]; // @[MDU.scala 55:28]
  wire  src2_sign = io_mulw ? src1[31] : src2[63]; // @[MDU.scala 56:28]
  wire  _T_5 = io_mul_valid & ~io_flush; // @[MDU.scala 71:43]
  wire  _T_7 = io_mul_op == 2'h0; // @[MDU.scala 83:40]
  wire [63:0] _multiplicand_reg_T = io_mulw ? $signed(_src1_T_3) : $signed(io_multilicand); // @[MDU.scala 89:58]
  wire [63:0] _multiplier_reg_T = io_mulw ? $signed(_src2_T_3) : $signed(io_multiplier); // @[MDU.scala 90:56]
  wire [63:0] _multiplicand_reg_T_4 = 64'sh0 - $signed(src1); // @[MDU.scala 94:58]
  wire [63:0] _multiplicand_reg_T_6 = $signed(src1) < 64'sh0 ? $signed(_multiplicand_reg_T_4) : $signed(src1); // @[MDU.scala 94:62]
  wire [63:0] _multiplier_reg_T_4 = 64'sh0 - $signed(src2); // @[MDU.scala 95:56]
  wire [63:0] _multiplier_reg_T_6 = $signed(src2) < 64'sh0 ? $signed(_multiplier_reg_T_4) : $signed(src2); // @[MDU.scala 95:60]
  wire  _GEN_8 = io_mul_op == 2'h2 ? 1'h0 : src1_sign; // @[MDU.scala 102:42 96:63 97:42]
  wire [63:0] _GEN_10 = io_mul_op == 2'h2 ? _multiplicand_reg_T : _multiplicand_reg_T_6; // @[MDU.scala 104:50 96:63 99:50]
  wire [63:0] _GEN_11 = io_mul_op == 2'h2 ? _multiplier_reg_T : _multiplier_reg_T; // @[MDU.scala 100:48 105:48 96:63]
  wire [1:0] _GEN_20 = last ? 2'h2 : 2'h1; // @[MDU.scala 113:41 114:44 118:44]
  wire [62:0] _GEN_1 = {{31'd0}, multiplicand_reg[31:0]}; // @[MDU.scala 131:105]
  wire [62:0] _mid_result_0_T_2 = _GEN_1 << index; // @[MDU.scala 131:105]
  wire [63:0] _mid_result_0_T_3 = multiplier_reg[0] ? {{1'd0}, _mid_result_0_T_2} : 64'h0; // @[MDU.scala 131:61]
  wire [63:0] _mid_result_0_T_5 = mid_result_0 + _mid_result_0_T_3; // @[MDU.scala 131:56]
  wire [63:0] _mid_result_1_T_3 = multiplier_reg[32] ? {{1'd0}, _mid_result_0_T_2} : 64'h0; // @[MDU.scala 132:61]
  wire [63:0] _mid_result_1_T_5 = mid_result_1 + _mid_result_1_T_3; // @[MDU.scala 132:56]
  wire [62:0] _GEN_2 = {{31'd0}, multiplicand_reg[63:32]}; // @[MDU.scala 133:106]
  wire [62:0] _mid_result_2_T_2 = _GEN_2 << index; // @[MDU.scala 133:106]
  wire [63:0] _mid_result_2_T_3 = multiplier_reg[0] ? {{1'd0}, _mid_result_2_T_2} : 64'h0; // @[MDU.scala 133:61]
  wire [63:0] _mid_result_2_T_5 = mid_result_2 + _mid_result_2_T_3; // @[MDU.scala 133:56]
  wire [63:0] _mid_result_3_T_3 = multiplier_reg[32] ? {{1'd0}, _mid_result_2_T_2} : 64'h0; // @[MDU.scala 134:61]
  wire [63:0] _mid_result_3_T_5 = mid_result_3 + _mid_result_3_T_3; // @[MDU.scala 134:56]
  wire [63:0] _multiplier_reg_T_11 = {1'h0,multiplier_reg[63:33],1'h0,multiplier_reg[31:1]}; // @[Cat.scala 31:58]
  wire [127:0] _result_u_T = {mid_result_3, 64'h0}; // @[MDU.scala 147:52]
  wire [95:0] _result_u_T_1 = {mid_result_2, 32'h0}; // @[MDU.scala 147:76]
  wire [127:0] _GEN_52 = {{32'd0}, _result_u_T_1}; // @[MDU.scala 147:59]
  wire [127:0] _result_u_T_3 = _result_u_T + _GEN_52; // @[MDU.scala 147:59]
  wire [95:0] _result_u_T_4 = {mid_result_1, 32'h0}; // @[MDU.scala 147:100]
  wire [127:0] _GEN_53 = {{32'd0}, _result_u_T_4}; // @[MDU.scala 147:83]
  wire [127:0] _result_u_T_6 = _result_u_T_3 + _GEN_53; // @[MDU.scala 147:83]
  wire [127:0] _GEN_54 = {{64'd0}, mid_result_0}; // @[MDU.scala 147:107]
  wire [127:0] _result_u_T_8 = _result_u_T_6 + _GEN_54; // @[MDU.scala 147:107]
  wire [127:0] _GEN_24 = 2'h2 == mul_state ? _result_u_T_8 : 128'h0; // @[MDU.scala 68:26 147:34]
  wire [127:0] _GEN_34 = 2'h1 == mul_state ? 128'h0 : _GEN_24; // @[MDU.scala 68:26]
  wire [127:0] _result_s_T = 2'h0 == mul_state ? 128'h0 : _GEN_34; // @[MDU.scala 148:63]
  wire [127:0] _result_s_T_3 = 128'sh0 - $signed(_result_s_T); // @[MDU.scala 148:52]
  wire [127:0] _result_s_T_5 = out_sign ? $signed(_result_s_T_3) : $signed(_result_s_T); // @[MDU.scala 148:40]
  wire [127:0] _GEN_25 = 2'h2 == mul_state ? $signed(_result_s_T_5) : $signed(128'sh0); // @[MDU.scala 68:26 148:34]
  wire [127:0] _GEN_35 = 2'h1 == mul_state ? $signed(128'sh0) : $signed(_GEN_25); // @[MDU.scala 68:26]
  wire [127:0] result_s = 2'h0 == mul_state ? $signed(128'sh0) : $signed(_GEN_35); // @[MDU.scala 68:26]
  wire [31:0] _io_result_T_1 = result_s[63:32]; // @[MDU.scala 150:96]
  wire [31:0] _io_result_T_3 = result_s[31:0]; // @[MDU.scala 150:120]
  wire [31:0] _io_result_T_4 = out_high ? $signed(_io_result_T_1) : $signed(_io_result_T_3); // @[MDU.scala 150:68]
  wire [63:0] _io_result_T_6 = result_s[127:64]; // @[MDU.scala 151:97]
  wire [63:0] _io_result_T_8 = result_s[63:0]; // @[MDU.scala 151:121]
  wire [63:0] _io_result_T_9 = out_high ? $signed(_io_result_T_6) : $signed(_io_result_T_8); // @[MDU.scala 151:68]
  wire [63:0] _io_result_T_10 = is_w ? $signed({{32{_io_result_T_4[31]}},_io_result_T_4}) : $signed(_io_result_T_9); // @[MDU.scala 149:41]
  wire [63:0] _GEN_26 = 2'h2 == mul_state ? $signed(_io_result_T_10) : $signed(64'sh0); // @[MDU.scala 68:26 149:35 51:19]
  wire  _GEN_33 = 2'h1 == mul_state ? 1'h0 : 2'h2 == mul_state; // @[MDU.scala 45:22 68:26]
  wire [63:0] _GEN_36 = 2'h1 == mul_state ? $signed(64'sh0) : $signed(_GEN_26); // @[MDU.scala 51:19 68:26]
  assign io_out_valid = 2'h0 == mul_state ? 1'h0 : _GEN_33; // @[MDU.scala 45:22 68:26]
  assign io_result = 2'h0 == mul_state ? $signed(64'sh0) : $signed(_GEN_36); // @[MDU.scala 51:19 68:26]
  always @(posedge clock) begin
    if (reset) begin // @[MDU.scala 32:32]
      mul_state <= 2'h0; // @[MDU.scala 32:32]
    end else if (2'h0 == mul_state) begin // @[MDU.scala 68:26]
      mul_state <= {{1'd0}, _T_5};
    end else if (2'h1 == mul_state) begin // @[MDU.scala 68:26]
      if (io_flush) begin // @[MDU.scala 111:39]
        mul_state <= 2'h0; // @[MDU.scala 112:44]
      end else begin
        mul_state <= _GEN_20;
      end
    end else begin
      mul_state <= 2'h0;
    end
    if (reset) begin // @[MDU.scala 33:39]
      multiplicand_reg <= 64'h0; // @[MDU.scala 33:39]
    end else if (2'h0 == mul_state) begin // @[MDU.scala 68:26]
      if (_T_7) begin // @[MDU.scala 84:25]
        multiplicand_reg <= _multiplicand_reg_T; // @[MDU.scala 89:50]
      end else if (io_mul_op == 2'h1) begin // @[MDU.scala 91:62]
        multiplicand_reg <= _multiplicand_reg_T_6; // @[MDU.scala 94:50]
      end else begin
        multiplicand_reg <= _GEN_10;
      end
    end
    if (reset) begin // @[MDU.scala 34:37]
      multiplier_reg <= 64'h0; // @[MDU.scala 34:37]
    end else if (2'h0 == mul_state) begin // @[MDU.scala 68:26]
      if (_T_7) begin // @[MDU.scala 84:25]
        multiplier_reg <= _multiplier_reg_T; // @[MDU.scala 90:48]
      end else if (io_mul_op == 2'h1) begin // @[MDU.scala 91:62]
        multiplier_reg <= _multiplier_reg_T_6; // @[MDU.scala 95:48]
      end else begin
        multiplier_reg <= _GEN_11;
      end
    end else if (2'h1 == mul_state) begin // @[MDU.scala 68:26]
      multiplier_reg <= _multiplier_reg_T_11; // @[MDU.scala 136:40]
    end
    if (reset) begin // @[MDU.scala 36:33]
      mid_result_0 <= 64'h0; // @[MDU.scala 36:33]
    end else if (2'h0 == mul_state) begin // @[MDU.scala 68:26]
      if (io_mul_valid & ~io_flush) begin // @[MDU.scala 71:56]
        mid_result_0 <= 64'h0; // @[MDU.scala 75:55]
      end
    end else if (2'h1 == mul_state) begin // @[MDU.scala 68:26]
      mid_result_0 <= _mid_result_0_T_5; // @[MDU.scala 131:39]
    end
    if (reset) begin // @[MDU.scala 36:33]
      mid_result_1 <= 64'h0; // @[MDU.scala 36:33]
    end else if (2'h0 == mul_state) begin // @[MDU.scala 68:26]
      if (io_mul_valid & ~io_flush) begin // @[MDU.scala 71:56]
        mid_result_1 <= 64'h0; // @[MDU.scala 75:55]
      end
    end else if (2'h1 == mul_state) begin // @[MDU.scala 68:26]
      mid_result_1 <= _mid_result_1_T_5; // @[MDU.scala 132:39]
    end
    if (reset) begin // @[MDU.scala 36:33]
      mid_result_2 <= 64'h0; // @[MDU.scala 36:33]
    end else if (2'h0 == mul_state) begin // @[MDU.scala 68:26]
      if (io_mul_valid & ~io_flush) begin // @[MDU.scala 71:56]
        mid_result_2 <= 64'h0; // @[MDU.scala 75:55]
      end
    end else if (2'h1 == mul_state) begin // @[MDU.scala 68:26]
      mid_result_2 <= _mid_result_2_T_5; // @[MDU.scala 133:39]
    end
    if (reset) begin // @[MDU.scala 36:33]
      mid_result_3 <= 64'h0; // @[MDU.scala 36:33]
    end else if (2'h0 == mul_state) begin // @[MDU.scala 68:26]
      if (io_mul_valid & ~io_flush) begin // @[MDU.scala 71:56]
        mid_result_3 <= 64'h0; // @[MDU.scala 75:55]
      end
    end else if (2'h1 == mul_state) begin // @[MDU.scala 68:26]
      mid_result_3 <= _mid_result_3_T_5; // @[MDU.scala 134:39]
    end
    if (reset) begin // @[MDU.scala 37:31]
      out_sign <= 1'h0; // @[MDU.scala 37:31]
    end else if (2'h0 == mul_state) begin // @[MDU.scala 68:26]
      if (_T_7) begin // @[MDU.scala 84:25]
        out_sign <= 1'h0; // @[MDU.scala 87:42]
      end else if (io_mul_op == 2'h1) begin // @[MDU.scala 91:62]
        out_sign <= src1_sign ^ src2_sign; // @[MDU.scala 92:42]
      end else begin
        out_sign <= _GEN_8;
      end
    end
    if (reset) begin // @[MDU.scala 38:31]
      out_high <= 1'h0; // @[MDU.scala 38:31]
    end else if (2'h0 == mul_state) begin // @[MDU.scala 68:26]
      if (_T_7) begin // @[MDU.scala 84:25]
        out_high <= 1'h0; // @[MDU.scala 88:42]
      end else begin
        out_high <= 1'h1;
      end
    end
    if (reset) begin // @[MDU.scala 39:27]
      is_w <= 1'h0; // @[MDU.scala 39:27]
    end else if (2'h0 == mul_state) begin // @[MDU.scala 68:26]
      is_w <= io_mulw; // @[MDU.scala 108:30]
    end
    if (reset) begin // @[Counter.scala 62:40]
      index <= 5'h0; // @[Counter.scala 62:40]
    end else if (2'h0 == mul_state) begin // @[MDU.scala 68:26]
      if (io_mul_valid & ~io_flush) begin // @[MDU.scala 71:56]
        index <= 5'h0; // @[MDU.scala 73:39]
      end else begin
        index <= _GEN_0;
      end
    end else begin
      index <= _GEN_0;
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
  mul_state = _RAND_0[1:0];
  _RAND_1 = {2{`RANDOM}};
  multiplicand_reg = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  multiplier_reg = _RAND_2[63:0];
  _RAND_3 = {2{`RANDOM}};
  mid_result_0 = _RAND_3[63:0];
  _RAND_4 = {2{`RANDOM}};
  mid_result_1 = _RAND_4[63:0];
  _RAND_5 = {2{`RANDOM}};
  mid_result_2 = _RAND_5[63:0];
  _RAND_6 = {2{`RANDOM}};
  mid_result_3 = _RAND_6[63:0];
  _RAND_7 = {1{`RANDOM}};
  out_sign = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  out_high = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  is_w = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  index = _RAND_10[4:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_041812_Divider(
  input         clock,
  input         reset,
  input  [63:0] io_dividend,
  input  [63:0] io_divisor,
  input         io_div_valid,
  input         io_divw,
  input         io_div_signed,
  input         io_flush,
  output        io_out_valid,
  output [63:0] io_quotient,
  output [63:0] io_remainder
);
`ifdef RANDOMIZE_REG_INIT
  reg [127:0] _RAND_0;
  reg [127:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
`endif // RANDOMIZE_REG_INIT
  reg [127:0] dividend; // @[MDU.scala 181:31]
  reg [127:0] divisor; // @[MDU.scala 182:31]
  reg [63:0] result; // @[MDU.scala 183:29]
  reg  sign_a; // @[MDU.scala 184:29]
  reg  sign_b; // @[MDU.scala 185:29]
  reg [1:0] div_state; // @[MDU.scala 186:32]
  reg  is_w; // @[MDU.scala 187:27]
  reg  is_sign; // @[MDU.scala 188:30]
  wire  _counter_enable_T = div_state == 2'h1; // @[MDU.scala 206:41]
  wire  _counter_enable_T_1 = ~is_w; // @[MDU.scala 206:56]
  wire  counter_enable = div_state == 2'h1 & ~is_w; // @[MDU.scala 206:52]
  wire  w_counter_enable = _counter_enable_T & is_w; // @[MDU.scala 207:54]
  reg [6:0] index; // @[Counter.scala 62:40]
  wire  wrap_wrap = index == 7'h40; // @[Counter.scala 74:24]
  wire [6:0] _wrap_value_T_1 = index + 7'h1; // @[Counter.scala 78:24]
  wire [6:0] _GEN_0 = wrap_wrap ? 7'h0 : _wrap_value_T_1; // @[Counter.scala 78:15 88:{20,28}]
  wire [6:0] _GEN_1 = counter_enable ? _GEN_0 : index; // @[Counter.scala 120:16 62:40]
  wire  last_calc = counter_enable & wrap_wrap; // @[Counter.scala 120:{16,23}]
  reg [5:0] windex; // @[Counter.scala 62:40]
  wire  wrap_wrap_1 = windex == 6'h20; // @[Counter.scala 74:24]
  wire [5:0] _wrap_value_T_3 = windex + 6'h1; // @[Counter.scala 78:24]
  wire [5:0] _GEN_3 = wrap_wrap_1 ? 6'h0 : _wrap_value_T_3; // @[Counter.scala 78:15 88:{20,28}]
  wire [5:0] _GEN_4 = w_counter_enable ? _GEN_3 : windex; // @[Counter.scala 120:16 62:40]
  wire  w_last_calc = w_counter_enable & wrap_wrap_1; // @[Counter.scala 120:{16,23}]
  wire  _T_4 = io_div_valid & ~io_flush; // @[MDU.scala 224:43]
  wire [31:0] _dividend_T_1 = io_dividend[31:0]; // @[MDU.scala 231:100]
  wire [31:0] _dividend_T_5 = 32'sh0 - $signed(_dividend_T_1); // @[MDU.scala 231:107]
  wire [31:0] _dividend_T_7 = $signed(_dividend_T_1) < 32'sh0 ? $signed(_dividend_T_5) : $signed(_dividend_T_1); // @[MDU.scala 231:111]
  wire [127:0] _dividend_T_8 = {96'h0,_dividend_T_7}; // @[Cat.scala 31:58]
  wire [63:0] _dividend_T_12 = 64'sh0 - $signed(io_dividend); // @[MDU.scala 231:147]
  wire [63:0] _dividend_T_14 = $signed(io_dividend) < 64'sh0 ? $signed(_dividend_T_12) : $signed(io_dividend); // @[MDU.scala 231:151]
  wire [127:0] _dividend_T_15 = {64'h0,_dividend_T_14}; // @[Cat.scala 31:58]
  wire [127:0] _dividend_T_16 = io_divw ? _dividend_T_8 : _dividend_T_15; // @[MDU.scala 231:56]
  wire [31:0] _divisor_T_1 = io_divisor[31:0]; // @[MDU.scala 232:98]
  wire [31:0] _divisor_T_5 = 32'sh0 - $signed(_divisor_T_1); // @[MDU.scala 232:105]
  wire [31:0] _divisor_T_7 = $signed(_divisor_T_1) < 32'sh0 ? $signed(_divisor_T_5) : $signed(_divisor_T_1); // @[MDU.scala 232:109]
  wire [127:0] _divisor_T_8 = {64'h0,_divisor_T_7,32'h0}; // @[Cat.scala 31:58]
  wire [63:0] _divisor_T_12 = 64'sh0 - $signed(io_divisor); // @[MDU.scala 232:144]
  wire [63:0] _divisor_T_14 = $signed(io_divisor) < 64'sh0 ? $signed(_divisor_T_12) : $signed(io_divisor); // @[MDU.scala 232:148]
  wire [127:0] _divisor_T_15 = {_divisor_T_14,64'h0}; // @[Cat.scala 31:58]
  wire [127:0] _divisor_T_16 = io_divw ? _divisor_T_8 : _divisor_T_15; // @[MDU.scala 232:55]
  wire [127:0] _dividend_T_18 = {96'h0,io_dividend[31:0]}; // @[Cat.scala 31:58]
  wire [127:0] _dividend_T_20 = {64'h0,io_dividend}; // @[Cat.scala 31:58]
  wire [127:0] _dividend_T_21 = io_divw ? _dividend_T_18 : _dividend_T_20; // @[MDU.scala 234:56]
  wire [127:0] _divisor_T_18 = {64'h0,io_divisor[31:0],32'h0}; // @[Cat.scala 31:58]
  wire [127:0] _divisor_T_20 = {io_divisor,64'h0}; // @[Cat.scala 31:58]
  wire [127:0] _divisor_T_21 = io_divw ? _divisor_T_18 : _divisor_T_20; // @[MDU.scala 235:55]
  wire [63:0] _GEN_9 = io_div_valid & ~io_flush ? 64'h0 : result; // @[MDU.scala 183:29 224:56 226:40]
  wire [1:0] _GEN_18 = w_last_calc | last_calc ? 2'h2 : 2'h1; // @[MDU.scala 252:61 253:44 255:44]
  wire [127:0] _mid64_result_T_1 = dividend - divisor; // @[MDU.scala 259:59]
  wire [63:0] _GEN_22 = is_w ? _mid64_result_T_1[63:0] : 64'h0; // @[MDU.scala 258:35 259:46]
  wire [63:0] _GEN_39 = 2'h1 == div_state ? _GEN_22 : 64'h0; // @[MDU.scala 222:26]
  wire [63:0] mid64_result = 2'h0 == div_state ? 64'h0 : _GEN_39; // @[MDU.scala 222:26]
  wire [127:0] _dividend_T_22 = {64'h0,mid64_result}; // @[Cat.scala 31:58]
  wire [64:0] _result_T = {result, 1'h0}; // @[MDU.scala 262:59]
  wire [64:0] _result_T_1 = _result_T | 65'h1; // @[MDU.scala 262:67]
  wire [127:0] _GEN_20 = ~mid64_result[63] ? _dividend_T_22 : dividend; // @[MDU.scala 181:31 260:56 261:50]
  wire [64:0] _GEN_21 = ~mid64_result[63] ? _result_T_1 : _result_T; // @[MDU.scala 260:56 262:48 265:48]
  wire [63:0] _divisor_T_23 = {{1'd0}, divisor[63:1]}; // @[MDU.scala 269:74]
  wire [127:0] _divisor_T_24 = {64'h0,_divisor_T_23}; // @[Cat.scala 31:58]
  wire [127:0] _GEN_23 = is_w ? _GEN_20 : dividend; // @[MDU.scala 181:31 258:35]
  wire [64:0] _GEN_24 = is_w ? _GEN_21 : {{1'd0}, result}; // @[MDU.scala 183:29 258:35]
  wire [127:0] _GEN_25 = is_w ? _divisor_T_24 : divisor; // @[MDU.scala 182:31 258:35 269:41]
  wire [127:0] _GEN_28 = _counter_enable_T_1 ? _mid64_result_T_1 : 128'h0; // @[MDU.scala 273:36 274:47]
  wire [127:0] _GEN_43 = 2'h1 == div_state ? _GEN_28 : 128'h0; // @[MDU.scala 222:26]
  wire [127:0] mid128_result = 2'h0 == div_state ? 128'h0 : _GEN_43; // @[MDU.scala 222:26]
  wire [127:0] _GEN_26 = ~mid128_result[127] ? mid128_result : _GEN_23; // @[MDU.scala 275:58 276:50]
  wire [64:0] _GEN_27 = ~mid128_result[127] ? _result_T_1 : _result_T; // @[MDU.scala 275:58 277:48 280:48]
  wire [127:0] _divisor_T_25 = {{1'd0}, divisor[127:1]}; // @[MDU.scala 285:52]
  wire [64:0] _GEN_30 = _counter_enable_T_1 ? _GEN_27 : _GEN_24; // @[MDU.scala 273:36]
  wire [63:0] _io_quotient_T_2 = 64'h0 - result; // @[MDU.scala 295:69]
  wire [63:0] _io_quotient_T_5 = sign_a ^ sign_b ? _io_quotient_T_2 : result; // @[MDU.scala 295:93]
  wire [127:0] _io_remainder_T_5 = 128'h0 - dividend; // @[MDU.scala 296:96]
  wire [127:0] _io_remainder_T_6 = sign_a & sign_b | sign_a & ~sign_b ? _io_remainder_T_5 : dividend; // @[MDU.scala 296:52]
  wire [63:0] _io_remainder_T_8 = _io_remainder_T_6[63:0]; // @[MDU.scala 296:124]
  wire [63:0] _io_remainder_T_10 = dividend[63:0]; // @[MDU.scala 299:65]
  wire [63:0] _GEN_32 = is_sign ? $signed(_io_quotient_T_5) : $signed(result); // @[MDU.scala 294:38 295:45 298:45]
  wire [63:0] _GEN_33 = is_sign ? $signed(_io_remainder_T_8) : $signed(_io_remainder_T_10); // @[MDU.scala 294:38 296:46 299:46]
  wire [63:0] _GEN_35 = 2'h2 == div_state ? $signed(_GEN_32) : $signed(64'sh0); // @[MDU.scala 213:21 222:26]
  wire [63:0] _GEN_36 = 2'h2 == div_state ? $signed(_GEN_33) : $signed(64'sh0); // @[MDU.scala 214:22 222:26]
  wire [64:0] _GEN_41 = 2'h1 == div_state ? _GEN_30 : {{1'd0}, result}; // @[MDU.scala 222:26 183:29]
  wire  _GEN_44 = 2'h1 == div_state ? 1'h0 : 2'h2 == div_state; // @[MDU.scala 212:22 222:26]
  wire [63:0] _GEN_45 = 2'h1 == div_state ? $signed(64'sh0) : $signed(_GEN_35); // @[MDU.scala 213:21 222:26]
  wire [63:0] _GEN_46 = 2'h1 == div_state ? $signed(64'sh0) : $signed(_GEN_36); // @[MDU.scala 214:22 222:26]
  wire [64:0] _GEN_48 = 2'h0 == div_state ? {{1'd0}, _GEN_9} : _GEN_41; // @[MDU.scala 222:26]
  wire [64:0] _GEN_64 = reset ? 65'h0 : _GEN_48; // @[MDU.scala 183:{29,29}]
  assign io_out_valid = 2'h0 == div_state ? 1'h0 : _GEN_44; // @[MDU.scala 212:22 222:26]
  assign io_quotient = 2'h0 == div_state ? $signed(64'sh0) : $signed(_GEN_45); // @[MDU.scala 213:21 222:26]
  assign io_remainder = 2'h0 == div_state ? $signed(64'sh0) : $signed(_GEN_46); // @[MDU.scala 214:22 222:26]
  always @(posedge clock) begin
    if (reset) begin // @[MDU.scala 181:31]
      dividend <= 128'h0; // @[MDU.scala 181:31]
    end else if (2'h0 == div_state) begin // @[MDU.scala 222:26]
      if (io_div_valid & ~io_flush) begin // @[MDU.scala 224:56]
        if (io_div_signed) begin // @[MDU.scala 230:52]
          dividend <= _dividend_T_16; // @[MDU.scala 231:50]
        end else begin
          dividend <= _dividend_T_21; // @[MDU.scala 234:50]
        end
      end
    end else if (2'h1 == div_state) begin // @[MDU.scala 222:26]
      if (_counter_enable_T_1) begin // @[MDU.scala 273:36]
        dividend <= _GEN_26;
      end else begin
        dividend <= _GEN_23;
      end
    end
    if (reset) begin // @[MDU.scala 182:31]
      divisor <= 128'h0; // @[MDU.scala 182:31]
    end else if (2'h0 == div_state) begin // @[MDU.scala 222:26]
      if (io_div_valid & ~io_flush) begin // @[MDU.scala 224:56]
        if (io_div_signed) begin // @[MDU.scala 230:52]
          divisor <= _divisor_T_16; // @[MDU.scala 232:49]
        end else begin
          divisor <= _divisor_T_21; // @[MDU.scala 235:49]
        end
      end
    end else if (2'h1 == div_state) begin // @[MDU.scala 222:26]
      if (_counter_enable_T_1) begin // @[MDU.scala 273:36]
        divisor <= _divisor_T_25; // @[MDU.scala 285:41]
      end else begin
        divisor <= _GEN_25;
      end
    end
    result <= _GEN_64[63:0]; // @[MDU.scala 183:{29,29}]
    if (reset) begin // @[MDU.scala 184:29]
      sign_a <= 1'h0; // @[MDU.scala 184:29]
    end else if (2'h0 == div_state) begin // @[MDU.scala 222:26]
      if (io_div_valid & ~io_flush) begin // @[MDU.scala 224:56]
        if (io_divw) begin // @[MDU.scala 241:46]
          sign_a <= io_dividend[31];
        end else begin
          sign_a <= io_dividend[63];
        end
      end
    end
    if (reset) begin // @[MDU.scala 185:29]
      sign_b <= 1'h0; // @[MDU.scala 185:29]
    end else if (2'h0 == div_state) begin // @[MDU.scala 222:26]
      if (io_div_valid & ~io_flush) begin // @[MDU.scala 224:56]
        if (io_divw) begin // @[MDU.scala 242:46]
          sign_b <= io_divisor[31];
        end else begin
          sign_b <= io_divisor[63];
        end
      end
    end
    if (reset) begin // @[MDU.scala 186:32]
      div_state <= 2'h0; // @[MDU.scala 186:32]
    end else if (2'h0 == div_state) begin // @[MDU.scala 222:26]
      div_state <= {{1'd0}, _T_4};
    end else if (2'h1 == div_state) begin // @[MDU.scala 222:26]
      if (io_flush) begin // @[MDU.scala 250:39]
        div_state <= 2'h0; // @[MDU.scala 251:44]
      end else begin
        div_state <= _GEN_18;
      end
    end else begin
      div_state <= 2'h0;
    end
    if (reset) begin // @[MDU.scala 187:27]
      is_w <= 1'h0; // @[MDU.scala 187:27]
    end else if (2'h0 == div_state) begin // @[MDU.scala 222:26]
      if (io_div_valid & ~io_flush) begin // @[MDU.scala 224:56]
        is_w <= io_divw; // @[MDU.scala 239:38]
      end
    end
    if (reset) begin // @[MDU.scala 188:30]
      is_sign <= 1'h0; // @[MDU.scala 188:30]
    end else if (2'h0 == div_state) begin // @[MDU.scala 222:26]
      if (io_div_valid & ~io_flush) begin // @[MDU.scala 224:56]
        is_sign <= io_div_signed; // @[MDU.scala 240:41]
      end
    end
    if (reset) begin // @[Counter.scala 62:40]
      index <= 7'h0; // @[Counter.scala 62:40]
    end else if (2'h0 == div_state) begin // @[MDU.scala 222:26]
      if (io_div_valid & ~io_flush) begin // @[MDU.scala 224:56]
        index <= 7'h0; // @[MDU.scala 227:39]
      end else begin
        index <= _GEN_1;
      end
    end else begin
      index <= _GEN_1;
    end
    if (reset) begin // @[Counter.scala 62:40]
      windex <= 6'h0; // @[Counter.scala 62:40]
    end else if (2'h0 == div_state) begin // @[MDU.scala 222:26]
      if (io_div_valid & ~io_flush) begin // @[MDU.scala 224:56]
        windex <= 6'h0; // @[MDU.scala 228:40]
      end else begin
        windex <= _GEN_4;
      end
    end else begin
      windex <= _GEN_4;
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
  _RAND_0 = {4{`RANDOM}};
  dividend = _RAND_0[127:0];
  _RAND_1 = {4{`RANDOM}};
  divisor = _RAND_1[127:0];
  _RAND_2 = {2{`RANDOM}};
  result = _RAND_2[63:0];
  _RAND_3 = {1{`RANDOM}};
  sign_a = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  sign_b = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  div_state = _RAND_5[1:0];
  _RAND_6 = {1{`RANDOM}};
  is_w = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  is_sign = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  index = _RAND_8[6:0];
  _RAND_9 = {1{`RANDOM}};
  windex = _RAND_9[5:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_041812_CSR(
  input         clock,
  input         reset,
  output [3:0]  io_flush_mask,
  input  [2:0]  io_r_op,
  input  [11:0] io_r_addr,
  output [63:0] io_r_data,
  input  [2:0]  io_w_op,
  input  [11:0] io_w_addr,
  input  [63:0] io_w_data,
  input         io_retired,
  input  [31:0] io_inst,
  input         io_int_timer_clear,
  input         io_int_soft_clear,
  input         io_int_timer,
  input         io_int_soft,
  input         io_extern,
  input         io_jump_taken,
  input         io_isSret,
  input         io_isMret,
  input  [63:0] io_de_pipe_reg_pc,
  input  [63:0] io_fd_pipe_reg_pc,
  input  [63:0] io_jump_addr,
  input  [63:0] io_excPC,
  output [63:0] io_trapVec,
  input         io_stall,
  output        io_trap,
  output [1:0]  io_mode,
  output        io_accessType_illegal,
  input         io_is_illegal,
  input         io_inst_misalign,
  input         io_store_misalign,
  input         io_load_misalign,
  input  [63:0] io_alu_out,
  input         io_mw_enable,
  input         io_em_enable,
  input         io_de_enable,
  input         io_fd_enable
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
  reg [63:0] _RAND_8;
  reg [63:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [63:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [63:0] _RAND_18;
  reg [63:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [63:0] _RAND_21;
  reg [63:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [63:0] _RAND_29;
  reg [63:0] _RAND_30;
  reg [63:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [63:0] _RAND_33;
  reg [63:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [63:0] _RAND_36;
  reg [63:0] _RAND_37;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] mode; // @[csr.scala 146:27]
  reg  mstatus_sum; // @[csr.scala 148:30]
  reg [1:0] mstatus_mpp; // @[csr.scala 148:30]
  reg  mstatus_spp; // @[csr.scala 148:30]
  reg  mstatus_mpie; // @[csr.scala 148:30]
  reg  mstatus_spie; // @[csr.scala 148:30]
  reg  mstatus_mie; // @[csr.scala 148:30]
  reg  mstatus_sie; // @[csr.scala 148:30]
  reg [63:0] medeleg_data; // @[csr.scala 150:30]
  reg [63:0] mideleg_data; // @[csr.scala 151:30]
  reg  mie_meie; // @[csr.scala 152:34]
  reg  mie_seie; // @[csr.scala 152:34]
  reg  mie_mtie; // @[csr.scala 152:34]
  reg  mie_stie; // @[csr.scala 152:34]
  reg  mie_msie; // @[csr.scala 152:34]
  reg  mie_ssie; // @[csr.scala 152:34]
  reg [61:0] mtvec_base; // @[csr.scala 153:34]
  reg [1:0] mtvec_mode; // @[csr.scala 153:34]
  reg [63:0] mscratch_data; // @[csr.scala 154:30]
  reg [63:0] mepc_data; // @[csr.scala 155:34]
  reg  mcause_int; // @[csr.scala 156:34]
  reg [62:0] mcause_code; // @[csr.scala 156:34]
  reg [63:0] mtval_data; // @[csr.scala 157:34]
  reg  mip_meip; // @[csr.scala 158:34]
  reg  mip_seip; // @[csr.scala 158:34]
  reg  mip_mtip; // @[csr.scala 158:34]
  reg  mip_stip; // @[csr.scala 158:34]
  reg  mip_msip; // @[csr.scala 158:34]
  reg  mip_ssip; // @[csr.scala 158:34]
  reg [63:0] mcycle_data; // @[csr.scala 159:34]
  reg [63:0] minstret_data; // @[csr.scala 160:30]
  wire [5:0] sstatus_lo_lo = {mstatus_spie,1'h0,mstatus_mie,1'h0,mstatus_sie,1'h0}; // @[csrFile.scala 41:30]
  wire [16:0] sstatus_lo = {4'h0,mstatus_mpp,2'h0,mstatus_spp,mstatus_mpie,1'h0,sstatus_lo_lo}; // @[csrFile.scala 41:30]
  wire [63:0] _sstatus_T = {41'h0,3'h0,1'h0,mstatus_sum,1'h0,sstatus_lo}; // @[csrFile.scala 41:30]
  wire  sstatus_sd = _sstatus_T[63]; // @[csrFile.scala 92:32]
  wire  sstatus_sum = _sstatus_T[18]; // @[csrFile.scala 97:32]
  wire  sstatus_spp = _sstatus_T[8]; // @[csrFile.scala 102:40]
  wire  sstatus_spie = _sstatus_T[5]; // @[csrFile.scala 105:32]
  wire  sstatus_sie = _sstatus_T[1]; // @[csrFile.scala 107:32]
  wire [5:0] sie_lo = {mie_stie,1'h0,mie_msie,1'h0,mie_ssie,1'h0}; // @[csrFile.scala 41:30]
  wire [63:0] _sie_T = {52'h0,mie_meie,1'h0,mie_seie,1'h0,mie_mtie,1'h0,sie_lo}; // @[csrFile.scala 41:30]
  wire [5:0] sip_lo = {mip_stip,1'h0,mip_msip,1'h0,mip_ssip,1'h0}; // @[csrFile.scala 41:30]
  wire [63:0] _sip_T = {52'h0,mip_meip,1'h0,mip_seip,1'h0,mip_mtip,1'h0,sip_lo}; // @[csrFile.scala 41:30]
  reg [61:0] stvec_base; // @[csr.scala 164:34]
  reg [1:0] stvec_mode; // @[csr.scala 164:34]
  reg [63:0] sscratch_data; // @[csr.scala 165:30]
  reg [63:0] sepc_data; // @[csr.scala 166:34]
  reg  scause_int; // @[csr.scala 167:34]
  reg [62:0] scause_code; // @[csr.scala 167:34]
  reg [63:0] stval_data; // @[csr.scala 168:34]
  wire [12:0] lo = {4'h0,sstatus_spp,2'h0,sstatus_spie,3'h0,sstatus_sie,1'h0}; // @[csr.scala 179:70]
  wire [63:0] _T = {sstatus_sd,29'h0,2'h0,13'h0,sstatus_sum,1'h0,4'h0,lo}; // @[csr.scala 179:70]
  wire  tmp_meie = _sie_T[11]; // @[csrFile.scala 355:18]
  wire  tmp_mtie = _sie_T[7]; // @[csrFile.scala 359:18]
  wire  tmp_msie = _sie_T[3]; // @[csrFile.scala 363:18]
  wire [5:0] lo_7 = {_sie_T[5],1'h0,tmp_msie,1'h0,_sie_T[1],1'h0}; // @[csrFile.scala 31:29]
  wire [63:0] _T_160 = {52'h0,tmp_meie,1'h0,_sie_T[9],1'h0,tmp_mtie,1'h0,lo_7}; // @[csrFile.scala 31:29]
  wire  sie_ssie = _T_160[1]; // @[csrFile.scala 62:32]
  wire  sie_stie = _T_160[5]; // @[csrFile.scala 60:32]
  wire  sie_seie = _T_160[9]; // @[csrFile.scala 58:32]
  wire [63:0] _T_1 = {54'h0,sie_seie,3'h0,sie_stie,3'h0,sie_ssie,1'h0}; // @[csr.scala 180:66]
  wire [63:0] _T_2 = {stvec_base,stvec_mode}; // @[csr.scala 181:68]
  wire [63:0] _T_3 = {scause_int,scause_code}; // @[csr.scala 185:69]
  wire [63:0] _T_4 = {54'h0,mip_seip,3'h0,mip_stip,3'h0,mip_ssip,1'h0}; // @[csr.scala 187:66]
  wire [63:0] _T_9 = {mtvec_base,mtvec_mode}; // @[csr.scala 198:68]
  wire [63:0] _T_10 = {mcause_int,mcause_code}; // @[csr.scala 202:69]
  wire  _T_13 = 12'hc00 == io_r_addr; // @[Lookup.scala 31:38]
  wire  _T_15 = 12'hc02 == io_r_addr; // @[Lookup.scala 31:38]
  wire  _T_17 = 12'h100 == io_r_addr; // @[Lookup.scala 31:38]
  wire  _T_19 = 12'h104 == io_r_addr; // @[Lookup.scala 31:38]
  wire  _T_21 = 12'h105 == io_r_addr; // @[Lookup.scala 31:38]
  wire  _T_23 = 12'h106 == io_r_addr; // @[Lookup.scala 31:38]
  wire  _T_25 = 12'h140 == io_r_addr; // @[Lookup.scala 31:38]
  wire  _T_27 = 12'h141 == io_r_addr; // @[Lookup.scala 31:38]
  wire  _T_29 = 12'h142 == io_r_addr; // @[Lookup.scala 31:38]
  wire  _T_31 = 12'h143 == io_r_addr; // @[Lookup.scala 31:38]
  wire  _T_33 = 12'h144 == io_r_addr; // @[Lookup.scala 31:38]
  wire  _T_35 = 12'h180 == io_r_addr; // @[Lookup.scala 31:38]
  wire  _T_37 = 12'hf11 == io_r_addr; // @[Lookup.scala 31:38]
  wire  _T_39 = 12'hf12 == io_r_addr; // @[Lookup.scala 31:38]
  wire  _T_41 = 12'hf13 == io_r_addr; // @[Lookup.scala 31:38]
  wire  _T_43 = 12'hf14 == io_r_addr; // @[Lookup.scala 31:38]
  wire  _T_45 = 12'h300 == io_r_addr; // @[Lookup.scala 31:38]
  wire  _T_47 = 12'h301 == io_r_addr; // @[Lookup.scala 31:38]
  wire  _T_49 = 12'h302 == io_r_addr; // @[Lookup.scala 31:38]
  wire  _T_51 = 12'h303 == io_r_addr; // @[Lookup.scala 31:38]
  wire  _T_53 = 12'h304 == io_r_addr; // @[Lookup.scala 31:38]
  wire  _T_55 = 12'h305 == io_r_addr; // @[Lookup.scala 31:38]
  wire  _T_57 = 12'h306 == io_r_addr; // @[Lookup.scala 31:38]
  wire  _T_59 = 12'h340 == io_r_addr; // @[Lookup.scala 31:38]
  wire  _T_61 = 12'h341 == io_r_addr; // @[Lookup.scala 31:38]
  wire  _T_63 = 12'h342 == io_r_addr; // @[Lookup.scala 31:38]
  wire  _T_65 = 12'h343 == io_r_addr; // @[Lookup.scala 31:38]
  wire  _T_67 = 12'h344 == io_r_addr; // @[Lookup.scala 31:38]
  wire  _T_69 = 12'hb00 == io_r_addr; // @[Lookup.scala 31:38]
  wire  _T_71 = 12'hb02 == io_r_addr; // @[Lookup.scala 31:38]
  wire [63:0] _T_72 = _T_71 ? minstret_data : 64'h0; // @[Lookup.scala 34:39]
  wire [63:0] _T_73 = _T_69 ? mcycle_data : _T_72; // @[Lookup.scala 34:39]
  wire [63:0] _T_74 = _T_67 ? _sip_T : _T_73; // @[Lookup.scala 34:39]
  wire [63:0] _T_75 = _T_65 ? mtval_data : _T_74; // @[Lookup.scala 34:39]
  wire [63:0] _T_76 = _T_63 ? _T_10 : _T_75; // @[Lookup.scala 34:39]
  wire [63:0] _T_77 = _T_61 ? mepc_data : _T_76; // @[Lookup.scala 34:39]
  wire [63:0] _T_78 = _T_59 ? mscratch_data : _T_77; // @[Lookup.scala 34:39]
  wire [63:0] _T_79 = _T_57 ? 64'h0 : _T_78; // @[Lookup.scala 34:39]
  wire [63:0] _T_80 = _T_55 ? _T_9 : _T_79; // @[Lookup.scala 34:39]
  wire [63:0] _T_81 = _T_53 ? _sie_T : _T_80; // @[Lookup.scala 34:39]
  wire [63:0] _T_82 = _T_51 ? mideleg_data : _T_81; // @[Lookup.scala 34:39]
  wire [63:0] _T_83 = _T_49 ? medeleg_data : _T_82; // @[Lookup.scala 34:39]
  wire [63:0] _T_84 = _T_47 ? 64'h8000000000001100 : _T_83; // @[Lookup.scala 34:39]
  wire [63:0] _T_85 = _T_45 ? _sstatus_T : _T_84; // @[Lookup.scala 34:39]
  wire [63:0] _T_86 = _T_43 ? 64'h0 : _T_85; // @[Lookup.scala 34:39]
  wire [63:0] _T_87 = _T_41 ? 64'h0 : _T_86; // @[Lookup.scala 34:39]
  wire [63:0] _T_88 = _T_39 ? 64'h0 : _T_87; // @[Lookup.scala 34:39]
  wire [63:0] _T_89 = _T_37 ? 64'h0 : _T_88; // @[Lookup.scala 34:39]
  wire [63:0] _T_90 = _T_35 ? 64'h0 : _T_89; // @[Lookup.scala 34:39]
  wire [63:0] _T_91 = _T_33 ? _T_4 : _T_90; // @[Lookup.scala 34:39]
  wire [63:0] _T_92 = _T_31 ? stval_data : _T_91; // @[Lookup.scala 34:39]
  wire [63:0] _T_93 = _T_29 ? _T_3 : _T_92; // @[Lookup.scala 34:39]
  wire [63:0] _T_94 = _T_27 ? sepc_data : _T_93; // @[Lookup.scala 34:39]
  wire [63:0] _T_95 = _T_25 ? sscratch_data : _T_94; // @[Lookup.scala 34:39]
  wire [63:0] _T_96 = _T_23 ? 64'h0 : _T_95; // @[Lookup.scala 34:39]
  wire [63:0] _T_97 = _T_21 ? _T_2 : _T_96; // @[Lookup.scala 34:39]
  wire [63:0] _T_98 = _T_19 ? _T_1 : _T_97; // @[Lookup.scala 34:39]
  wire [63:0] _T_99 = _T_17 ? _T : _T_98; // @[Lookup.scala 34:39]
  wire [63:0] _T_100 = _T_15 ? minstret_data : _T_99; // @[Lookup.scala 34:39]
  wire  readable = _T_13 | (_T_15 | (_T_17 | (_T_19 | (_T_21 | (_T_23 | (_T_25 | (_T_27 | (_T_29 | (_T_31 | (_T_33 | (
    _T_35 | (_T_37 | (_T_39 | (_T_41 | (_T_43 | (_T_45 | (_T_47 | (_T_49 | (_T_51 | (_T_53 | (_T_55 | (_T_57 | (_T_59 |
    (_T_61 | (_T_63 | (_T_65 | (_T_67 | (_T_69 | _T_71)))))))))))))))))))))))))))); // @[Lookup.scala 34:39]
  wire  _T_142 = _T_47 ? 1'h0 : _T_49 | (_T_51 | (_T_53 | (_T_55 | (_T_57 | (_T_59 | (_T_61 | (_T_63 | (_T_65 | (_T_67
     | (_T_69 | _T_71)))))))))); // @[Lookup.scala 34:39]
  wire  _T_144 = _T_43 ? 1'h0 : _T_45 | _T_142; // @[Lookup.scala 34:39]
  wire  _T_145 = _T_41 ? 1'h0 : _T_144; // @[Lookup.scala 34:39]
  wire  _T_146 = _T_39 ? 1'h0 : _T_145; // @[Lookup.scala 34:39]
  wire  _T_147 = _T_37 ? 1'h0 : _T_146; // @[Lookup.scala 34:39]
  wire  _T_158 = _T_15 ? 1'h0 : _T_17 | (_T_19 | (_T_21 | (_T_23 | (_T_25 | (_T_27 | (_T_29 | (_T_31 | (_T_33 | (_T_35
     | _T_147))))))))); // @[Lookup.scala 34:39]
  wire  writable = _T_13 ? 1'h0 : _T_158; // @[Lookup.scala 34:39]
  wire  _instValid_T = readable & writable; // @[csr.scala 218:43]
  wire  _instValid_T_4 = 3'h1 == io_r_op ? readable : 1'h1; // @[Mux.scala 81:58]
  wire  _instValid_T_6 = 3'h2 == io_r_op ? writable : _instValid_T_4; // @[Mux.scala 81:58]
  wire  _instValid_T_8 = 3'h3 == io_r_op ? _instValid_T : _instValid_T_6; // @[Mux.scala 81:58]
  wire  _instValid_T_10 = 3'h4 == io_r_op ? _instValid_T : _instValid_T_8; // @[Mux.scala 81:58]
  wire  instValid = 3'h5 == io_r_op ? _instValid_T : _instValid_T_10; // @[Mux.scala 81:58]
  wire  _csrData_T_1 = 12'hc00 == io_w_addr; // @[Lookup.scala 31:38]
  wire  _csrData_T_3 = 12'hc02 == io_w_addr; // @[Lookup.scala 31:38]
  wire  _csrData_T_5 = 12'h100 == io_w_addr; // @[Lookup.scala 31:38]
  wire  _csrData_T_7 = 12'h104 == io_w_addr; // @[Lookup.scala 31:38]
  wire  _csrData_T_9 = 12'h105 == io_w_addr; // @[Lookup.scala 31:38]
  wire  _csrData_T_11 = 12'h106 == io_w_addr; // @[Lookup.scala 31:38]
  wire  _csrData_T_13 = 12'h140 == io_w_addr; // @[Lookup.scala 31:38]
  wire  _csrData_T_15 = 12'h141 == io_w_addr; // @[Lookup.scala 31:38]
  wire  _csrData_T_17 = 12'h142 == io_w_addr; // @[Lookup.scala 31:38]
  wire  _csrData_T_19 = 12'h143 == io_w_addr; // @[Lookup.scala 31:38]
  wire  _csrData_T_21 = 12'h144 == io_w_addr; // @[Lookup.scala 31:38]
  wire  _csrData_T_23 = 12'h180 == io_w_addr; // @[Lookup.scala 31:38]
  wire  _csrData_T_25 = 12'hf11 == io_w_addr; // @[Lookup.scala 31:38]
  wire  _csrData_T_27 = 12'hf12 == io_w_addr; // @[Lookup.scala 31:38]
  wire  _csrData_T_29 = 12'hf13 == io_w_addr; // @[Lookup.scala 31:38]
  wire  _csrData_T_31 = 12'hf14 == io_w_addr; // @[Lookup.scala 31:38]
  wire  _csrData_T_33 = 12'h300 == io_w_addr; // @[Lookup.scala 31:38]
  wire  _csrData_T_35 = 12'h301 == io_w_addr; // @[Lookup.scala 31:38]
  wire  _csrData_T_37 = 12'h302 == io_w_addr; // @[Lookup.scala 31:38]
  wire  _csrData_T_39 = 12'h303 == io_w_addr; // @[Lookup.scala 31:38]
  wire  _csrData_T_41 = 12'h304 == io_w_addr; // @[Lookup.scala 31:38]
  wire  _csrData_T_43 = 12'h305 == io_w_addr; // @[Lookup.scala 31:38]
  wire  _csrData_T_45 = 12'h306 == io_w_addr; // @[Lookup.scala 31:38]
  wire  _csrData_T_47 = 12'h340 == io_w_addr; // @[Lookup.scala 31:38]
  wire  _csrData_T_49 = 12'h341 == io_w_addr; // @[Lookup.scala 31:38]
  wire  _csrData_T_51 = 12'h342 == io_w_addr; // @[Lookup.scala 31:38]
  wire  _csrData_T_53 = 12'h343 == io_w_addr; // @[Lookup.scala 31:38]
  wire  _csrData_T_55 = 12'h344 == io_w_addr; // @[Lookup.scala 31:38]
  wire  _csrData_T_57 = 12'hb00 == io_w_addr; // @[Lookup.scala 31:38]
  wire  _csrData_T_59 = 12'hb02 == io_w_addr; // @[Lookup.scala 31:38]
  wire [63:0] _csrData_T_60 = _csrData_T_59 ? minstret_data : 64'h0; // @[Lookup.scala 34:39]
  wire [63:0] _csrData_T_61 = _csrData_T_57 ? mcycle_data : _csrData_T_60; // @[Lookup.scala 34:39]
  wire [63:0] _csrData_T_62 = _csrData_T_55 ? _sip_T : _csrData_T_61; // @[Lookup.scala 34:39]
  wire [63:0] _csrData_T_63 = _csrData_T_53 ? mtval_data : _csrData_T_62; // @[Lookup.scala 34:39]
  wire [63:0] _csrData_T_64 = _csrData_T_51 ? _T_10 : _csrData_T_63; // @[Lookup.scala 34:39]
  wire [63:0] _csrData_T_65 = _csrData_T_49 ? mepc_data : _csrData_T_64; // @[Lookup.scala 34:39]
  wire [63:0] _csrData_T_66 = _csrData_T_47 ? mscratch_data : _csrData_T_65; // @[Lookup.scala 34:39]
  wire [63:0] _csrData_T_67 = _csrData_T_45 ? 64'h0 : _csrData_T_66; // @[Lookup.scala 34:39]
  wire [63:0] _csrData_T_68 = _csrData_T_43 ? _T_9 : _csrData_T_67; // @[Lookup.scala 34:39]
  wire [63:0] _csrData_T_69 = _csrData_T_41 ? _sie_T : _csrData_T_68; // @[Lookup.scala 34:39]
  wire [63:0] _csrData_T_70 = _csrData_T_39 ? mideleg_data : _csrData_T_69; // @[Lookup.scala 34:39]
  wire [63:0] _csrData_T_71 = _csrData_T_37 ? medeleg_data : _csrData_T_70; // @[Lookup.scala 34:39]
  wire [63:0] _csrData_T_72 = _csrData_T_35 ? 64'h8000000000001100 : _csrData_T_71; // @[Lookup.scala 34:39]
  wire [63:0] _csrData_T_73 = _csrData_T_33 ? _sstatus_T : _csrData_T_72; // @[Lookup.scala 34:39]
  wire [63:0] _csrData_T_74 = _csrData_T_31 ? 64'h0 : _csrData_T_73; // @[Lookup.scala 34:39]
  wire [63:0] _csrData_T_75 = _csrData_T_29 ? 64'h0 : _csrData_T_74; // @[Lookup.scala 34:39]
  wire [63:0] _csrData_T_76 = _csrData_T_27 ? 64'h0 : _csrData_T_75; // @[Lookup.scala 34:39]
  wire [63:0] _csrData_T_77 = _csrData_T_25 ? 64'h0 : _csrData_T_76; // @[Lookup.scala 34:39]
  wire [63:0] _csrData_T_78 = _csrData_T_23 ? 64'h0 : _csrData_T_77; // @[Lookup.scala 34:39]
  wire [63:0] _csrData_T_79 = _csrData_T_21 ? _T_4 : _csrData_T_78; // @[Lookup.scala 34:39]
  wire [63:0] _csrData_T_80 = _csrData_T_19 ? stval_data : _csrData_T_79; // @[Lookup.scala 34:39]
  wire [63:0] _csrData_T_81 = _csrData_T_17 ? _T_3 : _csrData_T_80; // @[Lookup.scala 34:39]
  wire [63:0] _csrData_T_82 = _csrData_T_15 ? sepc_data : _csrData_T_81; // @[Lookup.scala 34:39]
  wire [63:0] _csrData_T_83 = _csrData_T_13 ? sscratch_data : _csrData_T_82; // @[Lookup.scala 34:39]
  wire [63:0] _csrData_T_84 = _csrData_T_11 ? 64'h0 : _csrData_T_83; // @[Lookup.scala 34:39]
  wire [63:0] _csrData_T_85 = _csrData_T_9 ? _T_2 : _csrData_T_84; // @[Lookup.scala 34:39]
  wire [63:0] _csrData_T_86 = _csrData_T_7 ? _T_1 : _csrData_T_85; // @[Lookup.scala 34:39]
  wire [63:0] _csrData_T_87 = _csrData_T_5 ? _T : _csrData_T_86; // @[Lookup.scala 34:39]
  wire [63:0] _csrData_T_88 = _csrData_T_3 ? minstret_data : _csrData_T_87; // @[Lookup.scala 34:39]
  wire [63:0] csrData = _csrData_T_1 ? mcycle_data : _csrData_T_88; // @[Lookup.scala 34:39]
  wire  writeEn = (io_w_op == 3'h2 | io_w_op == 3'h3 | io_w_op == 3'h5 | io_w_op == 3'h4) & io_mw_enable; // @[csr.scala 228:93]
  wire [63:0] _writeData_T = csrData | io_w_data; // @[csr.scala 232:37]
  wire [63:0] _writeData_T_1 = ~io_w_data; // @[csr.scala 233:39]
  wire [63:0] _writeData_T_2 = csrData & _writeData_T_1; // @[csr.scala 233:37]
  wire [63:0] _writeData_T_4 = 3'h2 == io_w_op ? io_w_data : csrData; // @[Mux.scala 81:58]
  wire [63:0] _writeData_T_6 = 3'h3 == io_w_op ? io_w_data : _writeData_T_4; // @[Mux.scala 81:58]
  wire [63:0] _writeData_T_8 = 3'h4 == io_w_op ? _writeData_T : _writeData_T_6; // @[Mux.scala 81:58]
  wire [63:0] writeData = 3'h5 == io_w_op ? _writeData_T_2 : _writeData_T_8; // @[Mux.scala 81:58]
  wire  _hasExc_T_2 = io_is_illegal | io_inst_misalign | io_store_misalign | io_load_misalign; // @[csr.scala 237:83]
  wire  _hasExc_T_4 = 32'h73 == io_inst; // @[csr.scala 238:71]
  wire  _hasExc_T_7 = 32'h100073 == io_inst; // @[csr.scala 238:107]
  wire  _hasExc_T_10 = ~io_stall; // @[csr.scala 238:152]
  wire  _hasExc_T_12 = ~writeEn; // @[csr.scala 238:165]
  wire  hasExc = (_hasExc_T_2 | 32'h73 == io_inst | 32'h100073 == io_inst) & io_em_enable & ~io_stall & ~writeEn; // @[csr.scala 238:162]
  wire  _excCause_T_3 = mode == 2'h1; // @[csr.scala 246:98]
  wire [62:0] _excCause_T_4 = mode == 2'h1 ? 63'h9 : 63'hb; // @[csr.scala 246:92]
  wire [62:0] _excCause_T_5 = mode == 2'h0 ? 63'h8 : _excCause_T_4; // @[csr.scala 245:84]
  wire [62:0] _excCause_T_6 = _hasExc_T_7 ? 63'h3 : _excCause_T_5; // @[csr.scala 244:76]
  wire [62:0] _excCause_T_7 = io_store_misalign ? 63'h6 : _excCause_T_6; // @[csr.scala 243:68]
  wire [62:0] _excCause_T_8 = io_load_misalign ? 63'h4 : _excCause_T_7; // @[csr.scala 242:60]
  wire [62:0] _excCause_T_9 = io_is_illegal ? 63'h2 : _excCause_T_8; // @[csr.scala 241:52]
  wire [62:0] excCause = io_inst_misalign ? 63'h0 : _excCause_T_9; // @[csr.scala 240:27]
  wire [63:0] _hasExcS_T_1 = medeleg_data >> excCause[3:0]; // @[csr.scala 254:47]
  wire  hasExcS = hasExc & _hasExcS_T_1[0]; // @[csr.scala 254:30]
  wire  handExcS = ~mode[1] & hasExcS; // @[csr.scala 255:33]
  wire [63:0] flagIntS = _T_4 & _T_1; // @[csr.scala 258:35]
  wire [63:0] flagIntM = _sip_T & _sie_T; // @[csr.scala 259:35]
  wire [63:0] _hasIntS_T_4 = flagIntS & mideleg_data; // @[csr.scala 268:97]
  wire  hasIntS = (mode < 2'h1 | _excCause_T_3 & mstatus_sie) & |_hasIntS_T_4; // @[csr.scala 268:27]
  wire [63:0] _hasIntM_T_2 = ~mideleg_data; // @[csr.scala 269:79]
  wire [63:0] _hasIntM_T_3 = flagIntM & _hasIntM_T_2; // @[csr.scala 269:77]
  wire  hasIntM = (mode <= 2'h1 | mstatus_mie) & |_hasIntM_T_3; // @[csr.scala 269:31]
  wire  hasInt = (hasIntM | hasIntS) & (io_fd_enable | io_de_enable | io_em_enable & (hasExc | io_jump_taken)) &
    io_de_enable & _hasExc_T_10 & _hasExc_T_12; // @[csr.scala 270:155]
  wire  handIntS = hasInt & ~hasIntM; // @[csr.scala 272:31]
  wire [63:0] _intCauseS_T = {{9'd0}, flagIntS[63:9]}; // @[csr.scala 285:37]
  wire [63:0] _intCauseS_T_2 = {{1'd0}, flagIntS[63:1]}; // @[csr.scala 286:61]
  wire [62:0] _intCauseS_T_4 = _intCauseS_T_2[0] ? 63'h1 : 63'h5; // @[csr.scala 286:52]
  wire [62:0] intCauseS = _intCauseS_T[0] ? 63'h9 : _intCauseS_T_4; // @[csr.scala 285:28]
  wire [63:0] _intCause_T = {{11'd0}, flagIntM[63:11]}; // @[csr.scala 289:36]
  wire [63:0] _intCause_T_2 = {{3'd0}, flagIntM[63:3]}; // @[csr.scala 290:61]
  wire [63:0] _intCause_T_4 = {{7'd0}, flagIntM[63:7]}; // @[csr.scala 291:69]
  wire [62:0] _intCause_T_6 = _intCause_T_4[0] ? 63'h7 : intCauseS; // @[csr.scala 291:60]
  wire [62:0] _intCause_T_7 = _intCause_T_2[0] ? 63'h3 : _intCause_T_6; // @[csr.scala 290:52]
  wire [62:0] intCause = _intCause_T[0] ? 63'hb : _intCause_T_7; // @[csr.scala 289:27]
  wire [63:0] _cause_T = {1'h1,intCause}; // @[Cat.scala 31:58]
  wire [63:0] _cause_T_1 = {1'h0,excCause}; // @[Cat.scala 31:58]
  wire [63:0] cause = hasInt ? _cause_T : _cause_T_1; // @[csr.scala 296:24]
  wire [31:0] _excValue_T_7 = excCause == 63'h2 ? io_inst : 32'h0; // @[csr.scala 301:76]
  wire [63:0] _excValue_T_8 = excCause == 63'h3 | excCause == 63'h0 ? io_excPC : {{32'd0}, _excValue_T_7}; // @[csr.scala 300:60]
  wire [63:0] excValue = excCause == 63'h4 | excCause == 63'h6 ? io_alu_out : _excValue_T_8; // @[csr.scala 299:27]
  wire [63:0] _GEN_335 = {{2'd0}, stvec_base}; // @[csr.scala 305:65]
  wire [63:0] _trapVecS_T_4 = _GEN_335 + cause; // @[csr.scala 305:65]
  wire [63:0] _trapVecS_T_5 = stvec_mode[0] & hasInt ? _trapVecS_T_4 : {{2'd0}, stvec_base}; // @[csr.scala 305:27]
  wire [65:0] trapVecS = {_trapVecS_T_5, 2'h0}; // @[csr.scala 305:94]
  wire [63:0] _GEN_336 = {{2'd0}, mtvec_base}; // @[csr.scala 306:65]
  wire [63:0] _trapVecM_T_4 = _GEN_336 + cause; // @[csr.scala 306:65]
  wire [63:0] _trapVecM_T_5 = mtvec_mode[0] & hasInt ? _trapVecM_T_4 : {{2'd0}, mtvec_base}; // @[csr.scala 306:27]
  wire [65:0] trapVecM = {_trapVecM_T_5, 2'h0}; // @[csr.scala 306:94]
  wire [65:0] trapVec = handIntS | handExcS ? trapVecS : trapVecM; // @[csr.scala 307:26]
  wire [1:0] sretMode = {1'h0,sstatus_spp}; // @[Cat.scala 31:58]
  wire [1:0] excMode = handExcS ? 2'h1 : 2'h3; // @[csr.scala 317:26]
  wire [1:0] _trapMode_T = io_isMret ? mstatus_mpp : mode; // @[csr.scala 321:60]
  wire [1:0] _trapMode_T_1 = io_isSret ? sretMode : _trapMode_T; // @[csr.scala 320:52]
  wire  _nextMode_T = hasInt | hasExc; // @[csr.scala 325:36]
  wire  _mip_mtip_T_1 = ~io_int_timer_clear; // @[csr.scala 331:50]
  wire  _mip_msip_T_1 = ~io_int_soft_clear; // @[csr.scala 333:49]
  wire [63:0] _mcycle_data_T_1 = mcycle_data + 64'h1; // @[csr.scala 341:36]
  wire [63:0] _minstret_data_T_1 = minstret_data + 64'h1; // @[csr.scala 343:48]
  wire [63:0] _GEN_0 = io_retired ? _minstret_data_T_1 : minstret_data; // @[csr.scala 342:25 160:30 343:31]
  wire [2:0] _GEN_1 = io_isSret | io_isMret ? 3'h7 : 3'h0; // @[csr.scala 347:23 357:51 358:39]
  wire [3:0] _GEN_2 = hasExc ? 4'hf : {{1'd0}, _GEN_1}; // @[csr.scala 355:35 356:39]
  wire [3:0] _GEN_3 = _hasExc_T_4 ? 4'h7 : _GEN_2; // @[csr.scala 353:59 354:39]
  wire [3:0] _GEN_4 = hasInt & (hasExc | io_isMret | io_isSret) ? 4'hf : _GEN_3; // @[csr.scala 351:73 352:39]
  wire [3:0] _GEN_5 = hasInt & ~hasExc & ~io_isMret & ~io_isSret ? 4'h7 : _GEN_4; // @[csr.scala 349:68 350:39]
  wire [63:0] _interrupt_return_addr_T_1 = io_fd_enable ? io_fd_pipe_reg_pc : io_excPC; // @[csr.scala 364:84]
  wire [63:0] _interrupt_return_addr_T_2 = io_de_enable ? io_de_pipe_reg_pc : _interrupt_return_addr_T_1; // @[csr.scala 363:76]
  wire [63:0] interrupt_return_addr = io_jump_taken & io_em_enable ? io_jump_addr : _interrupt_return_addr_T_2; // @[csr.scala 362:40]
  wire  tmp_1_sd = writeData[63]; // @[csrFile.scala 92:32]
  wire  tmp_1_sum = writeData[18]; // @[csrFile.scala 97:32]
  wire  tmp_1_spp = writeData[8]; // @[csrFile.scala 102:40]
  wire  tmp_1_spie = writeData[5]; // @[csrFile.scala 105:32]
  wire  tmp_1_sie = writeData[1]; // @[csrFile.scala 107:32]
  wire [12:0] lo_8 = {4'h0,tmp_1_spp,2'h0,tmp_1_spie,3'h0,tmp_1_sie,1'h0}; // @[csrFile.scala 31:29]
  wire [63:0] _T_178 = {tmp_1_sd,29'h0,2'h0,13'h0,tmp_1_sum,1'h0,4'h0,lo_8}; // @[csrFile.scala 31:29]
  wire  _GEN_18 = io_w_addr == 12'h100 ? _T_178[18] : mstatus_sum; // @[csr.scala 371:56 csrFile.scala 270:11 csr.scala 148:30]
  wire [1:0] _GEN_22 = io_w_addr == 12'h100 ? _T_178[12:11] : mstatus_mpp; // @[csr.scala 371:56 csrFile.scala 274:11 csr.scala 148:30]
  wire  _GEN_24 = io_w_addr == 12'h100 ? _T_178[8] : mstatus_spp; // @[csr.scala 371:56 csrFile.scala 276:11 csr.scala 148:30]
  wire  _GEN_25 = io_w_addr == 12'h100 ? _T_178[7] : mstatus_mpie; // @[csr.scala 371:56 csrFile.scala 277:11 csr.scala 148:30]
  wire  _GEN_27 = io_w_addr == 12'h100 ? _T_178[5] : mstatus_spie; // @[csr.scala 371:56 csrFile.scala 279:11 csr.scala 148:30]
  wire  _GEN_29 = io_w_addr == 12'h100 ? _T_178[3] : mstatus_mie; // @[csr.scala 371:56 csrFile.scala 281:11 csr.scala 148:30]
  wire  _GEN_31 = io_w_addr == 12'h100 ? _T_178[1] : mstatus_sie; // @[csr.scala 371:56 csrFile.scala 283:11 csr.scala 148:30]
  wire  tmp_2_seie = writeData[9]; // @[csrFile.scala 58:32]
  wire [63:0] _T_180 = {54'h0,tmp_2_seie,3'h0,tmp_1_spie,3'h0,tmp_1_sie,1'h0}; // @[csrFile.scala 31:29]
  wire  _GEN_34 = io_w_addr == 12'h104 ? _T_180[11] : mie_meie; // @[csr.scala 372:52 csrFile.scala 355:11 csr.scala 152:34]
  wire  _GEN_36 = io_w_addr == 12'h104 ? _T_180[9] : mie_seie; // @[csr.scala 372:52 csrFile.scala 357:11 csr.scala 152:34]
  wire  _GEN_38 = io_w_addr == 12'h104 ? _T_180[7] : mie_mtie; // @[csr.scala 372:52 csrFile.scala 359:11 csr.scala 152:34]
  wire  _GEN_40 = io_w_addr == 12'h104 ? _T_180[5] : mie_stie; // @[csr.scala 372:52 csrFile.scala 361:11 csr.scala 152:34]
  wire  _GEN_42 = io_w_addr == 12'h104 ? _T_180[3] : mie_msie; // @[csr.scala 372:52 csrFile.scala 363:11 csr.scala 152:34]
  wire  _GEN_44 = io_w_addr == 12'h104 ? _T_180[1] : mie_ssie; // @[csr.scala 372:52 csrFile.scala 365:11 csr.scala 152:34]
  wire  _GEN_47 = io_w_addr == 12'h144 ? _T_180[11] : mip_meip & io_extern; // @[csr.scala 373:52 csrFile.scala 393:15 csr.scala 329:18]
  wire  _GEN_49 = io_w_addr == 12'h144 ? _T_180[9] : mip_seip & io_extern; // @[csr.scala 373:52 csrFile.scala 395:11 csr.scala 330:18]
  wire  _GEN_51 = io_w_addr == 12'h144 ? _T_180[7] : (mip_mtip | io_int_timer) & ~io_int_timer_clear; // @[csr.scala 373:52 csrFile.scala 397:15 csr.scala 331:18]
  wire  _GEN_53 = io_w_addr == 12'h144 ? _T_180[5] : (mip_stip | io_int_timer) & _mip_mtip_T_1; // @[csr.scala 373:52 csrFile.scala 399:11 csr.scala 332:18]
  wire  _GEN_55 = io_w_addr == 12'h144 ? _T_180[3] : (mip_msip | io_int_soft) & ~io_int_soft_clear; // @[csr.scala 373:52 csrFile.scala 401:15 csr.scala 333:18]
  wire  _GEN_57 = io_w_addr == 12'h144 ? _T_180[1] : (mip_ssip | io_int_soft) & _mip_msip_T_1; // @[csr.scala 373:52 csrFile.scala 403:11 csr.scala 334:18]
  wire [63:0] _sepc_data_T_1 = {writeData[63:2],2'h0}; // @[Cat.scala 31:58]
  wire [62:0] _scause_code_T_1 = {59'h0,writeData[3:0]}; // @[Cat.scala 31:58]
  wire [63:0] _medeleg_data_T_5 = {52'h0,writeData[11],1'h0,writeData[9:8],1'h0,writeData[6],1'h0,writeData[4:2],1'h0,
    writeData[0]}; // @[Cat.scala 31:58]
  wire [5:0] mideleg_data_lo = {tmp_1_spie,1'h0,writeData[3],1'h0,tmp_1_sie,1'h0}; // @[Cat.scala 31:58]
  wire [63:0] _mideleg_data_T_6 = {52'h0,writeData[11],1'h0,tmp_2_seie,1'h0,writeData[7],1'h0,mideleg_data_lo}; // @[Cat.scala 31:58]
  wire  _T_201 = hasExc | io_isSret | io_isMret; // @[csr.scala 392:60]
  wire [63:0] _T_202 = hasExc | io_isSret | io_isMret ? io_excPC : interrupt_return_addr; // @[csr.scala 392:39]
  wire [63:0] _sepc_data_T_3 = {_T_202[63:2],2'h0}; // @[Cat.scala 31:58]
  wire [62:0] _scause_code_T_3 = {59'h0,cause[3:0]}; // @[Cat.scala 31:58]
  wire [63:0] _sepc_data_T_5 = {io_excPC[63:2],2'h0}; // @[Cat.scala 31:58]
  wire  _GEN_129 = io_isMret ? mstatus_mpie : mstatus_mie; // @[csr.scala 148:30 442:38 443:37]
  wire  _GEN_130 = io_isMret | mstatus_mpie; // @[csr.scala 148:30 442:38 444:38]
  wire [1:0] _GEN_131 = io_isMret ? 2'h0 : mstatus_mpp; // @[csr.scala 148:30 442:38 445:37]
  wire  _GEN_132 = io_isSret ? mstatus_spie : mstatus_sie; // @[csr.scala 148:30 438:38 439:37]
  wire  _GEN_133 = io_isSret | mstatus_spie; // @[csr.scala 148:30 438:38 440:38]
  wire  _GEN_134 = io_isSret ? 1'h0 : mstatus_spp; // @[csr.scala 148:30 438:38 441:41]
  wire  _GEN_135 = io_isSret ? mstatus_mie : _GEN_129; // @[csr.scala 148:30 438:38]
  wire  _GEN_136 = io_isSret ? mstatus_mpie : _GEN_130; // @[csr.scala 148:30 438:38]
  wire [1:0] _GEN_137 = io_isSret ? mstatus_mpp : _GEN_131; // @[csr.scala 148:30 438:38]
  wire [63:0] _GEN_138 = hasExc ? _sepc_data_T_5 : mepc_data; // @[csr.scala 426:35 csrFile.scala 447:11 csr.scala 155:34]
  wire  _GEN_139 = hasExc ? cause[63] : mcause_int; // @[csr.scala 426:35 csrFile.scala 462:11 csr.scala 156:34]
  wire [62:0] _GEN_140 = hasExc ? _scause_code_T_3 : mcause_code; // @[csr.scala 426:35 csrFile.scala 463:11 csr.scala 156:34]
  wire [63:0] _GEN_141 = hasExc ? excValue : mtval_data; // @[csr.scala 426:35 csrFile.scala 475:14 csr.scala 157:34]
  wire  _GEN_142 = hasExc ? mstatus_mie : _GEN_136; // @[csr.scala 426:35 430:38]
  wire  _GEN_143 = hasExc ? 1'h0 : _GEN_135; // @[csr.scala 426:35 431:37]
  wire [1:0] _GEN_144 = hasExc ? mode : _GEN_137; // @[csr.scala 426:35 432:37]
  wire  _GEN_145 = hasExc ? mstatus_sie : _GEN_132; // @[csr.scala 148:30 426:35]
  wire  _GEN_146 = hasExc ? mstatus_spie : _GEN_133; // @[csr.scala 148:30 426:35]
  wire  _GEN_147 = hasExc ? mstatus_spp : _GEN_134; // @[csr.scala 148:30 426:35]
  wire [63:0] _GEN_148 = hasExcS ? _sepc_data_T_5 : sepc_data; // @[csr.scala 414:36 csrFile.scala 173:22 csr.scala 166:34]
  wire  _GEN_149 = hasExcS ? cause[63] : scause_int; // @[csr.scala 414:36 csrFile.scala 188:11 csr.scala 167:34]
  wire [62:0] _GEN_150 = hasExcS ? _scause_code_T_3 : scause_code; // @[csr.scala 414:36 csrFile.scala 189:11 csr.scala 167:34]
  wire [63:0] _GEN_151 = hasExcS ? excValue : stval_data; // @[csr.scala 414:36 csrFile.scala 202:14 csr.scala 168:34]
  wire  _GEN_152 = hasExcS ? mstatus_sie : _GEN_146; // @[csr.scala 414:36 418:38]
  wire  _GEN_153 = hasExcS ? 1'h0 : _GEN_145; // @[csr.scala 414:36 419:37]
  wire  _GEN_154 = hasExcS ? mode[0] : _GEN_147; // @[csr.scala 414:36 420:37]
  wire [63:0] _GEN_155 = hasExcS ? mepc_data : _GEN_138; // @[csr.scala 155:34 414:36]
  wire  _GEN_156 = hasExcS ? mcause_int : _GEN_139; // @[csr.scala 156:34 414:36]
  wire [62:0] _GEN_157 = hasExcS ? mcause_code : _GEN_140; // @[csr.scala 156:34 414:36]
  wire [63:0] _GEN_158 = hasExcS ? mtval_data : _GEN_141; // @[csr.scala 157:34 414:36]
  wire  _GEN_159 = hasExcS ? mstatus_mpie : _GEN_142; // @[csr.scala 148:30 414:36]
  wire  _GEN_160 = hasExcS ? mstatus_mie : _GEN_143; // @[csr.scala 148:30 414:36]
  wire [1:0] _GEN_161 = hasExcS ? mstatus_mpp : _GEN_144; // @[csr.scala 148:30 414:36]
  wire [63:0] _GEN_162 = hasInt ? _sepc_data_T_3 : _GEN_155; // @[csr.scala 401:35 csrFile.scala 447:11]
  wire  _GEN_163 = hasInt ? cause[63] : _GEN_156; // @[csr.scala 401:35 csrFile.scala 462:11]
  wire [62:0] _GEN_164 = hasInt ? _scause_code_T_3 : _GEN_157; // @[csr.scala 401:35 csrFile.scala 463:11]
  wire [63:0] _GEN_165 = hasInt ? excValue : _GEN_158; // @[csr.scala 401:35 csrFile.scala 475:14]
  wire  _GEN_166 = hasInt ? mstatus_mie : _GEN_159; // @[csr.scala 401:35 405:38]
  wire  _GEN_167 = hasInt ? 1'h0 : _GEN_160; // @[csr.scala 401:35 406:37]
  wire [1:0] _GEN_168 = hasInt ? mode : _GEN_161; // @[csr.scala 401:35 407:37]
  wire [63:0] _GEN_169 = hasInt ? sepc_data : _GEN_148; // @[csr.scala 166:34 401:35]
  wire  _GEN_170 = hasInt ? scause_int : _GEN_149; // @[csr.scala 167:34 401:35]
  wire [62:0] _GEN_171 = hasInt ? scause_code : _GEN_150; // @[csr.scala 167:34 401:35]
  wire [63:0] _GEN_172 = hasInt ? stval_data : _GEN_151; // @[csr.scala 168:34 401:35]
  wire  _GEN_173 = hasInt ? mstatus_spie : _GEN_152; // @[csr.scala 148:30 401:35]
  wire  _GEN_174 = hasInt ? mstatus_sie : _GEN_153; // @[csr.scala 148:30 401:35]
  wire  _GEN_175 = hasInt ? mstatus_spp : _GEN_154; // @[csr.scala 148:30 401:35]
  wire [63:0] _io_trapVec_T_1 = io_isMret ? mepc_data : sepc_data; // @[csr.scala 451:44]
  wire [65:0] _io_trapVec_T_2 = _nextMode_T ? trapVec : {{2'd0}, _io_trapVec_T_1}; // @[csr.scala 450:26]
  assign io_flush_mask = _hasExc_T_10 & _hasExc_T_12 ? _GEN_5 : 4'h0; // @[csr.scala 347:23 348:36]
  assign io_r_data = _T_13 ? mcycle_data : _T_100; // @[Lookup.scala 34:39]
  assign io_trapVec = _io_trapVec_T_2[63:0]; // @[csr.scala 450:20]
  assign io_trap = (_T_201 & io_em_enable | hasInt) & _hasExc_T_10 & _hasExc_T_12; // @[csr.scala 455:98]
  assign io_mode = mode; // @[csr.scala 209:17]
  assign io_accessType_illegal = ~instValid; // @[csr.scala 222:34]
  always @(posedge clock) begin
    if (reset) begin // @[csr.scala 146:27]
      mode <= 2'h3; // @[csr.scala 146:27]
    end else if ((hasInt | hasExc) & _hasExc_T_10 & _hasExc_T_12) begin // @[csr.scala 325:27]
      if (hasInt) begin // @[csr.scala 318:27]
        if (handIntS) begin // @[csr.scala 314:26]
          mode <= 2'h1;
        end else begin
          mode <= 2'h3;
        end
      end else if (hasExc) begin // @[csr.scala 319:44]
        mode <= excMode;
      end else begin
        mode <= _trapMode_T_1;
      end
    end
    if (reset) begin // @[csr.scala 148:30]
      mstatus_sum <= 1'h0; // @[csr.scala 148:30]
    end else if (_hasExc_T_10) begin // @[csr.scala 369:24]
      if (writeEn) begin // @[csr.scala 370:30]
        if (io_w_addr == 12'h300) begin // @[csr.scala 381:56]
          mstatus_sum <= tmp_1_sum; // @[csrFile.scala 270:11]
        end else begin
          mstatus_sum <= _GEN_18;
        end
      end
    end
    if (reset) begin // @[csr.scala 148:30]
      mstatus_mpp <= 2'h0; // @[csr.scala 148:30]
    end else if (_hasExc_T_10) begin // @[csr.scala 369:24]
      if (writeEn) begin // @[csr.scala 370:30]
        if (io_w_addr == 12'h300) begin // @[csr.scala 381:56]
          mstatus_mpp <= writeData[12:11]; // @[csrFile.scala 274:11]
        end else begin
          mstatus_mpp <= _GEN_22;
        end
      end else if (!(handIntS)) begin // @[csr.scala 391:37]
        mstatus_mpp <= _GEN_168;
      end
    end
    if (reset) begin // @[csr.scala 148:30]
      mstatus_spp <= 1'h0; // @[csr.scala 148:30]
    end else if (_hasExc_T_10) begin // @[csr.scala 369:24]
      if (writeEn) begin // @[csr.scala 370:30]
        if (io_w_addr == 12'h300) begin // @[csr.scala 381:56]
          mstatus_spp <= tmp_1_spp; // @[csrFile.scala 276:11]
        end else begin
          mstatus_spp <= _GEN_24;
        end
      end else if (handIntS) begin // @[csr.scala 391:37]
        mstatus_spp <= mode[0]; // @[csr.scala 397:37]
      end else begin
        mstatus_spp <= _GEN_175;
      end
    end
    if (reset) begin // @[csr.scala 148:30]
      mstatus_mpie <= 1'h0; // @[csr.scala 148:30]
    end else if (_hasExc_T_10) begin // @[csr.scala 369:24]
      if (writeEn) begin // @[csr.scala 370:30]
        if (io_w_addr == 12'h300) begin // @[csr.scala 381:56]
          mstatus_mpie <= writeData[7]; // @[csrFile.scala 277:11]
        end else begin
          mstatus_mpie <= _GEN_25;
        end
      end else if (!(handIntS)) begin // @[csr.scala 391:37]
        mstatus_mpie <= _GEN_166;
      end
    end
    if (reset) begin // @[csr.scala 148:30]
      mstatus_spie <= 1'h0; // @[csr.scala 148:30]
    end else if (_hasExc_T_10) begin // @[csr.scala 369:24]
      if (writeEn) begin // @[csr.scala 370:30]
        if (io_w_addr == 12'h300) begin // @[csr.scala 381:56]
          mstatus_spie <= tmp_1_spie; // @[csrFile.scala 279:11]
        end else begin
          mstatus_spie <= _GEN_27;
        end
      end else if (handIntS) begin // @[csr.scala 391:37]
        mstatus_spie <= mstatus_sie; // @[csr.scala 395:38]
      end else begin
        mstatus_spie <= _GEN_173;
      end
    end
    if (reset) begin // @[csr.scala 148:30]
      mstatus_mie <= 1'h0; // @[csr.scala 148:30]
    end else if (_hasExc_T_10) begin // @[csr.scala 369:24]
      if (writeEn) begin // @[csr.scala 370:30]
        if (io_w_addr == 12'h300) begin // @[csr.scala 381:56]
          mstatus_mie <= writeData[3]; // @[csrFile.scala 281:11]
        end else begin
          mstatus_mie <= _GEN_29;
        end
      end else if (!(handIntS)) begin // @[csr.scala 391:37]
        mstatus_mie <= _GEN_167;
      end
    end
    if (reset) begin // @[csr.scala 148:30]
      mstatus_sie <= 1'h0; // @[csr.scala 148:30]
    end else if (_hasExc_T_10) begin // @[csr.scala 369:24]
      if (writeEn) begin // @[csr.scala 370:30]
        if (io_w_addr == 12'h300) begin // @[csr.scala 381:56]
          mstatus_sie <= tmp_1_sie; // @[csrFile.scala 283:11]
        end else begin
          mstatus_sie <= _GEN_31;
        end
      end else if (handIntS) begin // @[csr.scala 391:37]
        mstatus_sie <= 1'h0; // @[csr.scala 396:37]
      end else begin
        mstatus_sie <= _GEN_174;
      end
    end
    if (reset) begin // @[csr.scala 150:30]
      medeleg_data <= 64'h0; // @[csr.scala 150:30]
    end else if (_hasExc_T_10) begin // @[csr.scala 369:24]
      if (writeEn) begin // @[csr.scala 370:30]
        if (io_w_addr == 12'h302) begin // @[csr.scala 382:56]
          medeleg_data <= _medeleg_data_T_5; // @[csrFile.scala 313:11]
        end
      end
    end
    if (reset) begin // @[csr.scala 151:30]
      mideleg_data <= 64'h0; // @[csr.scala 151:30]
    end else if (_hasExc_T_10) begin // @[csr.scala 369:24]
      if (writeEn) begin // @[csr.scala 370:30]
        if (io_w_addr == 12'h303) begin // @[csr.scala 383:56]
          mideleg_data <= _mideleg_data_T_6; // @[csrFile.scala 328:11]
        end
      end
    end
    if (reset) begin // @[csr.scala 152:34]
      mie_meie <= 1'h0; // @[csr.scala 152:34]
    end else if (_hasExc_T_10) begin // @[csr.scala 369:24]
      if (writeEn) begin // @[csr.scala 370:30]
        if (io_w_addr == 12'h304) begin // @[csr.scala 384:52]
          mie_meie <= writeData[11]; // @[csrFile.scala 355:11]
        end else begin
          mie_meie <= _GEN_34;
        end
      end
    end
    if (reset) begin // @[csr.scala 152:34]
      mie_seie <= 1'h0; // @[csr.scala 152:34]
    end else if (_hasExc_T_10) begin // @[csr.scala 369:24]
      if (writeEn) begin // @[csr.scala 370:30]
        if (io_w_addr == 12'h304) begin // @[csr.scala 384:52]
          mie_seie <= tmp_2_seie; // @[csrFile.scala 357:11]
        end else begin
          mie_seie <= _GEN_36;
        end
      end
    end
    if (reset) begin // @[csr.scala 152:34]
      mie_mtie <= 1'h0; // @[csr.scala 152:34]
    end else if (_hasExc_T_10) begin // @[csr.scala 369:24]
      if (writeEn) begin // @[csr.scala 370:30]
        if (io_w_addr == 12'h304) begin // @[csr.scala 384:52]
          mie_mtie <= writeData[7]; // @[csrFile.scala 359:11]
        end else begin
          mie_mtie <= _GEN_38;
        end
      end
    end
    if (reset) begin // @[csr.scala 152:34]
      mie_stie <= 1'h0; // @[csr.scala 152:34]
    end else if (_hasExc_T_10) begin // @[csr.scala 369:24]
      if (writeEn) begin // @[csr.scala 370:30]
        if (io_w_addr == 12'h304) begin // @[csr.scala 384:52]
          mie_stie <= tmp_1_spie; // @[csrFile.scala 361:11]
        end else begin
          mie_stie <= _GEN_40;
        end
      end
    end
    if (reset) begin // @[csr.scala 152:34]
      mie_msie <= 1'h0; // @[csr.scala 152:34]
    end else if (_hasExc_T_10) begin // @[csr.scala 369:24]
      if (writeEn) begin // @[csr.scala 370:30]
        if (io_w_addr == 12'h304) begin // @[csr.scala 384:52]
          mie_msie <= writeData[3]; // @[csrFile.scala 363:11]
        end else begin
          mie_msie <= _GEN_42;
        end
      end
    end
    if (reset) begin // @[csr.scala 152:34]
      mie_ssie <= 1'h0; // @[csr.scala 152:34]
    end else if (_hasExc_T_10) begin // @[csr.scala 369:24]
      if (writeEn) begin // @[csr.scala 370:30]
        if (io_w_addr == 12'h304) begin // @[csr.scala 384:52]
          mie_ssie <= tmp_1_sie; // @[csrFile.scala 365:11]
        end else begin
          mie_ssie <= _GEN_44;
        end
      end
    end
    if (reset) begin // @[csr.scala 153:34]
      mtvec_base <= 62'h0; // @[csr.scala 153:34]
    end else if (_hasExc_T_10) begin // @[csr.scala 369:24]
      if (writeEn) begin // @[csr.scala 370:30]
        if (io_w_addr == 12'h305) begin // @[csr.scala 386:54]
          mtvec_base <= writeData[63:2]; // @[csrFile.scala 419:11]
        end
      end
    end
    if (reset) begin // @[csr.scala 153:34]
      mtvec_mode <= 2'h0; // @[csr.scala 153:34]
    end else if (_hasExc_T_10) begin // @[csr.scala 369:24]
      if (writeEn) begin // @[csr.scala 370:30]
        if (io_w_addr == 12'h305) begin // @[csr.scala 386:54]
          mtvec_mode <= {{1'd0}, writeData[0]}; // @[csrFile.scala 420:11]
        end
      end
    end
    if (reset) begin // @[csr.scala 154:30]
      mscratch_data <= 64'h0; // @[csr.scala 154:30]
    end else if (_hasExc_T_10) begin // @[csr.scala 369:24]
      if (writeEn) begin // @[csr.scala 370:30]
        if (io_w_addr == 12'h340) begin // @[csr.scala 387:57]
          mscratch_data <= writeData; // @[csrFile.scala 433:14]
        end
      end
    end
    if (reset) begin // @[csr.scala 155:34]
      mepc_data <= 64'h0; // @[csr.scala 155:34]
    end else if (_hasExc_T_10) begin // @[csr.scala 369:24]
      if (writeEn) begin // @[csr.scala 370:30]
        if (io_w_addr == 12'h341) begin // @[csr.scala 388:53]
          mepc_data <= _sepc_data_T_1; // @[csrFile.scala 447:11]
        end
      end else if (!(handIntS)) begin // @[csr.scala 391:37]
        mepc_data <= _GEN_162;
      end
    end
    if (reset) begin // @[csr.scala 156:34]
      mcause_int <= 1'h0; // @[csr.scala 156:34]
    end else if (_hasExc_T_10) begin // @[csr.scala 369:24]
      if (writeEn) begin // @[csr.scala 370:30]
        if (io_w_addr == 12'h342) begin // @[csr.scala 389:55]
          mcause_int <= tmp_1_sd; // @[csrFile.scala 462:11]
        end
      end else if (!(handIntS)) begin // @[csr.scala 391:37]
        mcause_int <= _GEN_163;
      end
    end
    if (reset) begin // @[csr.scala 156:34]
      mcause_code <= 63'h0; // @[csr.scala 156:34]
    end else if (_hasExc_T_10) begin // @[csr.scala 369:24]
      if (writeEn) begin // @[csr.scala 370:30]
        if (io_w_addr == 12'h342) begin // @[csr.scala 389:55]
          mcause_code <= _scause_code_T_1; // @[csrFile.scala 463:11]
        end
      end else if (!(handIntS)) begin // @[csr.scala 391:37]
        mcause_code <= _GEN_164;
      end
    end
    if (reset) begin // @[csr.scala 157:34]
      mtval_data <= 64'h0; // @[csr.scala 157:34]
    end else if (_hasExc_T_10) begin // @[csr.scala 369:24]
      if (writeEn) begin // @[csr.scala 370:30]
        if (io_w_addr == 12'h343) begin // @[csr.scala 390:54]
          mtval_data <= writeData; // @[csrFile.scala 475:14]
        end
      end else if (!(handIntS)) begin // @[csr.scala 391:37]
        mtval_data <= _GEN_165;
      end
    end
    if (reset) begin // @[csr.scala 158:34]
      mip_meip <= 1'h0; // @[csr.scala 158:34]
    end else if (_hasExc_T_10) begin // @[csr.scala 369:24]
      if (writeEn) begin // @[csr.scala 370:30]
        if (io_w_addr == 12'h344) begin // @[csr.scala 385:52]
          mip_meip <= writeData[11]; // @[csrFile.scala 393:15]
        end else begin
          mip_meip <= _GEN_47;
        end
      end else begin
        mip_meip <= mip_meip & io_extern; // @[csr.scala 329:18]
      end
    end else begin
      mip_meip <= mip_meip & io_extern; // @[csr.scala 329:18]
    end
    if (reset) begin // @[csr.scala 158:34]
      mip_seip <= 1'h0; // @[csr.scala 158:34]
    end else if (_hasExc_T_10) begin // @[csr.scala 369:24]
      if (writeEn) begin // @[csr.scala 370:30]
        if (io_w_addr == 12'h344) begin // @[csr.scala 385:52]
          mip_seip <= tmp_2_seie; // @[csrFile.scala 395:11]
        end else begin
          mip_seip <= _GEN_49;
        end
      end else begin
        mip_seip <= mip_seip & io_extern; // @[csr.scala 330:18]
      end
    end else begin
      mip_seip <= mip_seip & io_extern; // @[csr.scala 330:18]
    end
    if (reset) begin // @[csr.scala 158:34]
      mip_mtip <= 1'h0; // @[csr.scala 158:34]
    end else if (_hasExc_T_10) begin // @[csr.scala 369:24]
      if (writeEn) begin // @[csr.scala 370:30]
        if (io_w_addr == 12'h344) begin // @[csr.scala 385:52]
          mip_mtip <= writeData[7]; // @[csrFile.scala 397:15]
        end else begin
          mip_mtip <= _GEN_51;
        end
      end else begin
        mip_mtip <= (mip_mtip | io_int_timer) & ~io_int_timer_clear; // @[csr.scala 331:18]
      end
    end else begin
      mip_mtip <= (mip_mtip | io_int_timer) & ~io_int_timer_clear; // @[csr.scala 331:18]
    end
    if (reset) begin // @[csr.scala 158:34]
      mip_stip <= 1'h0; // @[csr.scala 158:34]
    end else if (_hasExc_T_10) begin // @[csr.scala 369:24]
      if (writeEn) begin // @[csr.scala 370:30]
        if (io_w_addr == 12'h344) begin // @[csr.scala 385:52]
          mip_stip <= tmp_1_spie; // @[csrFile.scala 399:11]
        end else begin
          mip_stip <= _GEN_53;
        end
      end else begin
        mip_stip <= (mip_stip | io_int_timer) & _mip_mtip_T_1; // @[csr.scala 332:18]
      end
    end else begin
      mip_stip <= (mip_stip | io_int_timer) & _mip_mtip_T_1; // @[csr.scala 332:18]
    end
    if (reset) begin // @[csr.scala 158:34]
      mip_msip <= 1'h0; // @[csr.scala 158:34]
    end else if (_hasExc_T_10) begin // @[csr.scala 369:24]
      if (writeEn) begin // @[csr.scala 370:30]
        if (io_w_addr == 12'h344) begin // @[csr.scala 385:52]
          mip_msip <= writeData[3]; // @[csrFile.scala 401:15]
        end else begin
          mip_msip <= _GEN_55;
        end
      end else begin
        mip_msip <= (mip_msip | io_int_soft) & ~io_int_soft_clear; // @[csr.scala 333:18]
      end
    end else begin
      mip_msip <= (mip_msip | io_int_soft) & ~io_int_soft_clear; // @[csr.scala 333:18]
    end
    if (reset) begin // @[csr.scala 158:34]
      mip_ssip <= 1'h0; // @[csr.scala 158:34]
    end else if (_hasExc_T_10) begin // @[csr.scala 369:24]
      if (writeEn) begin // @[csr.scala 370:30]
        if (io_w_addr == 12'h344) begin // @[csr.scala 385:52]
          mip_ssip <= tmp_1_sie; // @[csrFile.scala 403:11]
        end else begin
          mip_ssip <= _GEN_57;
        end
      end else begin
        mip_ssip <= (mip_ssip | io_int_soft) & _mip_msip_T_1; // @[csr.scala 334:18]
      end
    end else begin
      mip_ssip <= (mip_ssip | io_int_soft) & _mip_msip_T_1; // @[csr.scala 334:18]
    end
    if (reset) begin // @[csr.scala 159:34]
      mcycle_data <= 64'h0; // @[csr.scala 159:34]
    end else if (_hasExc_T_10) begin // @[csr.scala 369:24]
      if (writeEn) begin // @[csr.scala 370:30]
        if (io_w_addr == 12'hb00) begin // @[csr.scala 374:55]
          mcycle_data <= writeData; // @[csrFile.scala 487:14]
        end else begin
          mcycle_data <= _mcycle_data_T_1; // @[csr.scala 341:21]
        end
      end else begin
        mcycle_data <= _mcycle_data_T_1; // @[csr.scala 341:21]
      end
    end else begin
      mcycle_data <= _mcycle_data_T_1; // @[csr.scala 341:21]
    end
    if (reset) begin // @[csr.scala 160:30]
      minstret_data <= 64'h0; // @[csr.scala 160:30]
    end else if (_hasExc_T_10) begin // @[csr.scala 369:24]
      if (writeEn) begin // @[csr.scala 370:30]
        if (io_w_addr == 12'hb02) begin // @[csr.scala 375:57]
          minstret_data <= writeData; // @[csrFile.scala 499:14]
        end else begin
          minstret_data <= _GEN_0;
        end
      end else begin
        minstret_data <= _GEN_0;
      end
    end else begin
      minstret_data <= _GEN_0;
    end
    if (reset) begin // @[csr.scala 164:34]
      stvec_base <= 62'h0; // @[csr.scala 164:34]
    end else if (_hasExc_T_10) begin // @[csr.scala 369:24]
      if (writeEn) begin // @[csr.scala 370:30]
        if (io_w_addr == 12'h105) begin // @[csr.scala 376:54]
          stvec_base <= writeData[63:2]; // @[csrFile.scala 148:22]
        end
      end
    end
    if (reset) begin // @[csr.scala 164:34]
      stvec_mode <= 2'h0; // @[csr.scala 164:34]
    end else if (_hasExc_T_10) begin // @[csr.scala 369:24]
      if (writeEn) begin // @[csr.scala 370:30]
        if (io_w_addr == 12'h105) begin // @[csr.scala 376:54]
          stvec_mode <= {{1'd0}, writeData[0]}; // @[csrFile.scala 149:22]
        end
      end
    end
    if (reset) begin // @[csr.scala 165:30]
      sscratch_data <= 64'h0; // @[csr.scala 165:30]
    end else if (_hasExc_T_10) begin // @[csr.scala 369:24]
      if (writeEn) begin // @[csr.scala 370:30]
        if (io_w_addr == 12'h140) begin // @[csr.scala 377:57]
          sscratch_data <= writeData; // @[csrFile.scala 161:22]
        end
      end
    end
    if (reset) begin // @[csr.scala 166:34]
      sepc_data <= 64'h0; // @[csr.scala 166:34]
    end else if (_hasExc_T_10) begin // @[csr.scala 369:24]
      if (writeEn) begin // @[csr.scala 370:30]
        if (io_w_addr == 12'h141) begin // @[csr.scala 378:53]
          sepc_data <= _sepc_data_T_1; // @[csrFile.scala 173:22]
        end
      end else if (handIntS) begin // @[csr.scala 391:37]
        sepc_data <= _sepc_data_T_3; // @[csrFile.scala 173:22]
      end else begin
        sepc_data <= _GEN_169;
      end
    end
    if (reset) begin // @[csr.scala 167:34]
      scause_int <= 1'h0; // @[csr.scala 167:34]
    end else if (_hasExc_T_10) begin // @[csr.scala 369:24]
      if (writeEn) begin // @[csr.scala 370:30]
        if (io_w_addr == 12'h142) begin // @[csr.scala 379:55]
          scause_int <= tmp_1_sd; // @[csrFile.scala 188:11]
        end
      end else if (handIntS) begin // @[csr.scala 391:37]
        scause_int <= cause[63]; // @[csrFile.scala 188:11]
      end else begin
        scause_int <= _GEN_170;
      end
    end
    if (reset) begin // @[csr.scala 167:34]
      scause_code <= 63'h0; // @[csr.scala 167:34]
    end else if (_hasExc_T_10) begin // @[csr.scala 369:24]
      if (writeEn) begin // @[csr.scala 370:30]
        if (io_w_addr == 12'h142) begin // @[csr.scala 379:55]
          scause_code <= _scause_code_T_1; // @[csrFile.scala 189:11]
        end
      end else if (handIntS) begin // @[csr.scala 391:37]
        scause_code <= _scause_code_T_3; // @[csrFile.scala 189:11]
      end else begin
        scause_code <= _GEN_171;
      end
    end
    if (reset) begin // @[csr.scala 168:34]
      stval_data <= 64'h0; // @[csr.scala 168:34]
    end else if (_hasExc_T_10) begin // @[csr.scala 369:24]
      if (writeEn) begin // @[csr.scala 370:30]
        if (io_w_addr == 12'h143) begin // @[csr.scala 380:54]
          stval_data <= writeData; // @[csrFile.scala 202:14]
        end
      end else if (handIntS) begin // @[csr.scala 391:37]
        stval_data <= excValue; // @[csrFile.scala 202:14]
      end else begin
        stval_data <= _GEN_172;
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
  mode = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  mstatus_sum = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  mstatus_mpp = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  mstatus_spp = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  mstatus_mpie = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  mstatus_spie = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  mstatus_mie = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  mstatus_sie = _RAND_7[0:0];
  _RAND_8 = {2{`RANDOM}};
  medeleg_data = _RAND_8[63:0];
  _RAND_9 = {2{`RANDOM}};
  mideleg_data = _RAND_9[63:0];
  _RAND_10 = {1{`RANDOM}};
  mie_meie = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  mie_seie = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  mie_mtie = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  mie_stie = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  mie_msie = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  mie_ssie = _RAND_15[0:0];
  _RAND_16 = {2{`RANDOM}};
  mtvec_base = _RAND_16[61:0];
  _RAND_17 = {1{`RANDOM}};
  mtvec_mode = _RAND_17[1:0];
  _RAND_18 = {2{`RANDOM}};
  mscratch_data = _RAND_18[63:0];
  _RAND_19 = {2{`RANDOM}};
  mepc_data = _RAND_19[63:0];
  _RAND_20 = {1{`RANDOM}};
  mcause_int = _RAND_20[0:0];
  _RAND_21 = {2{`RANDOM}};
  mcause_code = _RAND_21[62:0];
  _RAND_22 = {2{`RANDOM}};
  mtval_data = _RAND_22[63:0];
  _RAND_23 = {1{`RANDOM}};
  mip_meip = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  mip_seip = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  mip_mtip = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  mip_stip = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  mip_msip = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  mip_ssip = _RAND_28[0:0];
  _RAND_29 = {2{`RANDOM}};
  mcycle_data = _RAND_29[63:0];
  _RAND_30 = {2{`RANDOM}};
  minstret_data = _RAND_30[63:0];
  _RAND_31 = {2{`RANDOM}};
  stvec_base = _RAND_31[61:0];
  _RAND_32 = {1{`RANDOM}};
  stvec_mode = _RAND_32[1:0];
  _RAND_33 = {2{`RANDOM}};
  sscratch_data = _RAND_33[63:0];
  _RAND_34 = {2{`RANDOM}};
  sepc_data = _RAND_34[63:0];
  _RAND_35 = {1{`RANDOM}};
  scause_int = _RAND_35[0:0];
  _RAND_36 = {2{`RANDOM}};
  scause_code = _RAND_36[62:0];
  _RAND_37 = {2{`RANDOM}};
  stval_data = _RAND_37[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_041812_clint(
  input         clock,
  input         reset,
  input  [63:0] io_addr,
  input  [63:0] io_w_data,
  input         io_wen,
  output [63:0] io_r_data,
  output        io_soft_valid,
  output        io_timer_valid,
  output        io_timer_clear,
  output        io_soft_clear
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] msip; // @[clint.scala 21:27]
  reg [63:0] mtimecmp; // @[clint.scala 22:31]
  reg [63:0] mtime; // @[clint.scala 23:28]
  wire  _T = io_addr == 64'h2000000; // @[clint.scala 32:30]
  wire  _T_1 = io_addr == 64'h2004000; // @[clint.scala 36:30]
  wire  _T_2 = io_addr == 64'h200bff8; // @[clint.scala 41:30]
  wire [63:0] _io_r_data_T_3 = _T_2 ? mtime : 64'h0; // @[clint.scala 47:60]
  wire [63:0] _io_r_data_T_4 = _T_1 ? mtimecmp : _io_r_data_T_3; // @[clint.scala 46:52]
  wire [63:0] _io_r_data_T_5 = _T ? msip : _io_r_data_T_4; // @[clint.scala 45:33]
  wire [63:0] _mtime_T_1 = mtime + 64'h1; // @[clint.scala 61:24]
  assign io_r_data = io_wen ? 64'h0 : _io_r_data_T_5; // @[clint.scala 25:19 31:21 45:27]
  assign io_soft_valid = msip[0]; // @[clint.scala 51:18]
  assign io_timer_valid = mtime >= mtimecmp; // @[clint.scala 57:20]
  assign io_timer_clear = io_wen & _T_1; // @[clint.scala 31:21 28:24]
  assign io_soft_clear = msip[0] ? 1'h0 : 1'h1; // @[clint.scala 29:23 51:29 54:31]
  always @(posedge clock) begin
    if (reset) begin // @[clint.scala 21:27]
      msip <= 64'h0; // @[clint.scala 21:27]
    end else if (io_wen) begin // @[clint.scala 31:21]
      if (io_addr == 64'h2000000) begin // @[clint.scala 32:47]
        msip <= io_w_data; // @[clint.scala 33:30]
      end
    end
    if (reset) begin // @[clint.scala 22:31]
      mtimecmp <= 64'h0; // @[clint.scala 22:31]
    end else if (io_wen) begin // @[clint.scala 31:21]
      if (io_addr == 64'h2004000) begin // @[clint.scala 36:47]
        mtimecmp <= io_w_data; // @[clint.scala 37:34]
      end
    end
    if (reset) begin // @[clint.scala 23:28]
      mtime <= 64'h0; // @[clint.scala 23:28]
    end else begin
      mtime <= _mtime_T_1; // @[clint.scala 61:15]
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
  msip = _RAND_0[63:0];
  _RAND_1 = {2{`RANDOM}};
  mtimecmp = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  mtime = _RAND_2[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_041812_Datapath(
  input         clock,
  input         reset,
  output [31:0] io_ctrl_inst,
  input  [1:0]  io_ctrl_pc_sel,
  input         io_ctrl_A_sel,
  input         io_ctrl_B_sel,
  input  [1:0]  io_ctrl_wd_type,
  input  [2:0]  io_ctrl_imm_sel,
  input  [2:0]  io_ctrl_br_type,
  input  [2:0]  io_ctrl_st_type,
  input  [2:0]  io_ctrl_ld_type,
  input  [1:0]  io_ctrl_wb_sel,
  input         io_ctrl_wb_en,
  input  [4:0]  io_ctrl_alu_op,
  input         io_ctrl_prv,
  input  [2:0]  io_ctrl_csr_cmd,
  input         io_ctrl_is_illegal,
  output [31:0] io_icache_cpu_request_addr,
  input  [63:0] io_icache_cpu_response_data,
  input         io_icache_cpu_response_ready,
  output        io_icache_flush,
  output [31:0] io_dcache_cpu_request_addr,
  output [63:0] io_dcache_cpu_request_data,
  output [7:0]  io_dcache_cpu_request_mask,
  output        io_dcache_cpu_request_rw,
  output        io_dcache_cpu_request_valid,
  input  [63:0] io_dcache_cpu_response_data,
  input         io_dcache_cpu_response_ready,
  output        io_dcache_flush,
  output [1:0]  io_dcache_accessType,
  input         io_interrupt
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [63:0] _RAND_8;
  reg [63:0] _RAND_9;
  reg [63:0] _RAND_10;
  reg [63:0] _RAND_11;
  reg [63:0] _RAND_12;
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
  reg [63:0] _RAND_28;
  reg [63:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [63:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [63:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [63:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [63:0] _RAND_48;
  reg [63:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [63:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [63:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [63:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [63:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_66;
  reg [63:0] _RAND_67;
  reg [63:0] _RAND_68;
  reg [63:0] _RAND_69;
`endif // RANDOMIZE_REG_INIT
  wire [63:0] alu_io_A; // @[datapath.scala 243:25]
  wire [63:0] alu_io_B; // @[datapath.scala 243:25]
  wire [1:0] alu_io_width_type; // @[datapath.scala 243:25]
  wire [3:0] alu_io_alu_op; // @[datapath.scala 243:25]
  wire [63:0] alu_io_out; // @[datapath.scala 243:25]
  wire [31:0] immGen_io_inst; // @[datapath.scala 244:28]
  wire [2:0] immGen_io_sel; // @[datapath.scala 244:28]
  wire [63:0] immGen_io_out; // @[datapath.scala 244:28]
  wire [63:0] brCond_io_rs1; // @[datapath.scala 245:28]
  wire [63:0] brCond_io_rs2; // @[datapath.scala 245:28]
  wire [2:0] brCond_io_br_type; // @[datapath.scala 245:28]
  wire  brCond_io_taken; // @[datapath.scala 245:28]
  wire  regFile_clock; // @[datapath.scala 246:29]
  wire  regFile_reset; // @[datapath.scala 246:29]
  wire  regFile_io_wen; // @[datapath.scala 246:29]
  wire [4:0] regFile_io_waddr; // @[datapath.scala 246:29]
  wire [63:0] regFile_io_wdata; // @[datapath.scala 246:29]
  wire [4:0] regFile_io_raddr_0; // @[datapath.scala 246:29]
  wire [4:0] regFile_io_raddr_1; // @[datapath.scala 246:29]
  wire [63:0] regFile_io_rdata_0; // @[datapath.scala 246:29]
  wire [63:0] regFile_io_rdata_1; // @[datapath.scala 246:29]
  wire  multiplier_clock; // @[datapath.scala 247:32]
  wire  multiplier_reset; // @[datapath.scala 247:32]
  wire  multiplier_io_mul_valid; // @[datapath.scala 247:32]
  wire  multiplier_io_flush; // @[datapath.scala 247:32]
  wire  multiplier_io_mulw; // @[datapath.scala 247:32]
  wire [1:0] multiplier_io_mul_op; // @[datapath.scala 247:32]
  wire [63:0] multiplier_io_multilicand; // @[datapath.scala 247:32]
  wire [63:0] multiplier_io_multiplier; // @[datapath.scala 247:32]
  wire  multiplier_io_out_valid; // @[datapath.scala 247:32]
  wire [63:0] multiplier_io_result; // @[datapath.scala 247:32]
  wire  divider_clock; // @[datapath.scala 248:29]
  wire  divider_reset; // @[datapath.scala 248:29]
  wire [63:0] divider_io_dividend; // @[datapath.scala 248:29]
  wire [63:0] divider_io_divisor; // @[datapath.scala 248:29]
  wire  divider_io_div_valid; // @[datapath.scala 248:29]
  wire  divider_io_divw; // @[datapath.scala 248:29]
  wire  divider_io_div_signed; // @[datapath.scala 248:29]
  wire  divider_io_flush; // @[datapath.scala 248:29]
  wire  divider_io_out_valid; // @[datapath.scala 248:29]
  wire [63:0] divider_io_quotient; // @[datapath.scala 248:29]
  wire [63:0] divider_io_remainder; // @[datapath.scala 248:29]
  wire  csr_clock; // @[datapath.scala 261:25]
  wire  csr_reset; // @[datapath.scala 261:25]
  wire [3:0] csr_io_flush_mask; // @[datapath.scala 261:25]
  wire [2:0] csr_io_r_op; // @[datapath.scala 261:25]
  wire [11:0] csr_io_r_addr; // @[datapath.scala 261:25]
  wire [63:0] csr_io_r_data; // @[datapath.scala 261:25]
  wire [2:0] csr_io_w_op; // @[datapath.scala 261:25]
  wire [11:0] csr_io_w_addr; // @[datapath.scala 261:25]
  wire [63:0] csr_io_w_data; // @[datapath.scala 261:25]
  wire  csr_io_retired; // @[datapath.scala 261:25]
  wire [31:0] csr_io_inst; // @[datapath.scala 261:25]
  wire  csr_io_int_timer_clear; // @[datapath.scala 261:25]
  wire  csr_io_int_soft_clear; // @[datapath.scala 261:25]
  wire  csr_io_int_timer; // @[datapath.scala 261:25]
  wire  csr_io_int_soft; // @[datapath.scala 261:25]
  wire  csr_io_extern; // @[datapath.scala 261:25]
  wire  csr_io_jump_taken; // @[datapath.scala 261:25]
  wire  csr_io_isSret; // @[datapath.scala 261:25]
  wire  csr_io_isMret; // @[datapath.scala 261:25]
  wire [63:0] csr_io_de_pipe_reg_pc; // @[datapath.scala 261:25]
  wire [63:0] csr_io_fd_pipe_reg_pc; // @[datapath.scala 261:25]
  wire [63:0] csr_io_jump_addr; // @[datapath.scala 261:25]
  wire [63:0] csr_io_excPC; // @[datapath.scala 261:25]
  wire [63:0] csr_io_trapVec; // @[datapath.scala 261:25]
  wire  csr_io_stall; // @[datapath.scala 261:25]
  wire  csr_io_trap; // @[datapath.scala 261:25]
  wire [1:0] csr_io_mode; // @[datapath.scala 261:25]
  wire  csr_io_accessType_illegal; // @[datapath.scala 261:25]
  wire  csr_io_is_illegal; // @[datapath.scala 261:25]
  wire  csr_io_inst_misalign; // @[datapath.scala 261:25]
  wire  csr_io_store_misalign; // @[datapath.scala 261:25]
  wire  csr_io_load_misalign; // @[datapath.scala 261:25]
  wire [63:0] csr_io_alu_out; // @[datapath.scala 261:25]
  wire  csr_io_mw_enable; // @[datapath.scala 261:25]
  wire  csr_io_em_enable; // @[datapath.scala 261:25]
  wire  csr_io_de_enable; // @[datapath.scala 261:25]
  wire  csr_io_fd_enable; // @[datapath.scala 261:25]
  wire  clint_clock; // @[datapath.scala 264:28]
  wire  clint_reset; // @[datapath.scala 264:28]
  wire [63:0] clint_io_addr; // @[datapath.scala 264:28]
  wire [63:0] clint_io_w_data; // @[datapath.scala 264:28]
  wire  clint_io_wen; // @[datapath.scala 264:28]
  wire [63:0] clint_io_r_data; // @[datapath.scala 264:28]
  wire  clint_io_soft_valid; // @[datapath.scala 264:28]
  wire  clint_io_timer_valid; // @[datapath.scala 264:28]
  wire  clint_io_timer_clear; // @[datapath.scala 264:28]
  wire  clint_io_soft_clear; // @[datapath.scala 264:28]
  reg [31:0] fd_pipe_reg_inst; // @[datapath.scala 156:34]
  reg [63:0] fd_pipe_reg_pc; // @[datapath.scala 156:34]
  reg  fd_pipe_reg_enable; // @[datapath.scala 156:34]
  reg [4:0] de_pipe_reg_alu_op; // @[datapath.scala 164:34]
  reg [63:0] de_pipe_reg_pc; // @[datapath.scala 164:34]
  reg [31:0] de_pipe_reg_inst; // @[datapath.scala 164:34]
  reg [63:0] de_pipe_reg_imm; // @[datapath.scala 164:34]
  reg [2:0] de_pipe_reg_imm_sel; // @[datapath.scala 164:34]
  reg [63:0] de_pipe_reg_rs1; // @[datapath.scala 164:34]
  reg [63:0] de_pipe_reg_src1_addr; // @[datapath.scala 164:34]
  reg [63:0] de_pipe_reg_rs2; // @[datapath.scala 164:34]
  reg [63:0] de_pipe_reg_src2_addr; // @[datapath.scala 164:34]
  reg [63:0] de_pipe_reg_csr_read_data; // @[datapath.scala 164:34]
  reg [2:0] de_pipe_reg_csr_write_op; // @[datapath.scala 164:34]
  reg [11:0] de_pipe_reg_csr_write_addr; // @[datapath.scala 164:34]
  reg [4:0] de_pipe_reg_dest; // @[datapath.scala 164:34]
  reg  de_pipe_reg_A_sel; // @[datapath.scala 164:34]
  reg  de_pipe_reg_B_sel; // @[datapath.scala 164:34]
  reg [1:0] de_pipe_reg_pc_sel; // @[datapath.scala 164:34]
  reg [2:0] de_pipe_reg_br_type; // @[datapath.scala 164:34]
  reg [1:0] de_pipe_reg_wd_type; // @[datapath.scala 164:34]
  reg [2:0] de_pipe_reg_st_type; // @[datapath.scala 164:34]
  reg [2:0] de_pipe_reg_ld_type; // @[datapath.scala 164:34]
  reg [1:0] de_pipe_reg_wb_sel; // @[datapath.scala 164:34]
  reg  de_pipe_reg_wb_en; // @[datapath.scala 164:34]
  reg  de_pipe_reg_csr_is_illegal; // @[datapath.scala 164:34]
  reg  de_pipe_reg_csr_inst_misalign; // @[datapath.scala 164:34]
  reg  de_pipe_reg_enable; // @[datapath.scala 164:34]
  reg [63:0] em_pipe_reg_alu_out; // @[datapath.scala 196:34]
  reg [63:0] em_pipe_reg_csr_read_data; // @[datapath.scala 196:34]
  reg [2:0] em_pipe_reg_csr_write_op; // @[datapath.scala 196:34]
  reg [11:0] em_pipe_reg_csr_write_addr; // @[datapath.scala 196:34]
  reg [63:0] em_pipe_reg_csr_write_data; // @[datapath.scala 196:34]
  reg  em_pipe_reg_jump_taken; // @[datapath.scala 196:34]
  reg [63:0] em_pipe_reg_st_data; // @[datapath.scala 196:34]
  reg [2:0] em_pipe_reg_st_type; // @[datapath.scala 196:34]
  reg [2:0] em_pipe_reg_ld_type; // @[datapath.scala 196:34]
  reg [1:0] em_pipe_reg_wb_sel; // @[datapath.scala 196:34]
  reg  em_pipe_reg_wb_en; // @[datapath.scala 196:34]
  reg [4:0] em_pipe_reg_dest; // @[datapath.scala 196:34]
  reg [63:0] em_pipe_reg_pc; // @[datapath.scala 196:34]
  reg [31:0] em_pipe_reg_inst; // @[datapath.scala 196:34]
  reg  em_pipe_reg_is_clint; // @[datapath.scala 196:34]
  reg  em_pipe_reg_csr_is_illegal; // @[datapath.scala 196:34]
  reg  em_pipe_reg_csr_inst_misalign; // @[datapath.scala 196:34]
  reg  em_pipe_reg_csr_load_misalign; // @[datapath.scala 196:34]
  reg  em_pipe_reg_csr_store_misalign; // @[datapath.scala 196:34]
  reg  em_pipe_reg_enable; // @[datapath.scala 196:34]
  reg [63:0] mw_pipe_reg_load_data; // @[datapath.scala 223:34]
  reg [63:0] mw_pipe_reg_alu_out; // @[datapath.scala 223:34]
  reg [4:0] mw_pipe_reg_dest; // @[datapath.scala 223:34]
  reg [63:0] mw_pipe_reg_csr_read_data; // @[datapath.scala 223:34]
  reg [1:0] mw_pipe_reg_wb_sel; // @[datapath.scala 223:34]
  reg  mw_pipe_reg_wb_en; // @[datapath.scala 223:34]
  reg [63:0] mw_pipe_reg_pc; // @[datapath.scala 223:34]
  reg [31:0] mw_pipe_reg_inst; // @[datapath.scala 223:34]
  reg [2:0] mw_pipe_reg_csr_write_op; // @[datapath.scala 223:34]
  reg [11:0] mw_pipe_reg_csr_write_addr; // @[datapath.scala 223:34]
  reg [63:0] mw_pipe_reg_csr_write_data; // @[datapath.scala 223:34]
  reg  mw_pipe_reg_enable; // @[datapath.scala 223:34]
  reg  started; // @[datapath.scala 249:30]
  reg  icache_flush_tag; // @[datapath.scala 250:39]
  reg  dcache_flush_tag; // @[datapath.scala 251:39]
  reg  data_cache_tag; // @[datapath.scala 254:37]
  reg [63:0] data_cache_response_data; // @[datapath.scala 255:47]
  wire  _dcache_stall_T = |em_pipe_reg_ld_type; // @[datapath.scala 256:50]
  wire  _dcache_stall_T_1 = |em_pipe_reg_st_type; // @[datapath.scala 256:79]
  wire  _dcache_stall_T_2 = |em_pipe_reg_ld_type | (|em_pipe_reg_st_type); // @[datapath.scala 256:55]
  wire  _dcache_stall_T_6 = (|em_pipe_reg_ld_type | (|em_pipe_reg_st_type) | 32'h100f == em_pipe_reg_inst) &
    em_pipe_reg_enable; // @[datapath.scala 256:117]
  wire  _dcache_stall_T_7 = ~data_cache_tag; // @[datapath.scala 257:71]
  wire  _dcache_stall_T_9 = ~em_pipe_reg_is_clint; // @[datapath.scala 257:90]
  wire  dcache_stall = _dcache_stall_T_6 & ~data_cache_tag & ~em_pipe_reg_is_clint; // @[datapath.scala 257:87]
  wire  icache_stall = ~io_icache_cpu_response_ready; // @[datapath.scala 258:28]
  reg  mul_result_enable; // @[datapath.scala 517:40]
  wire  _mul_stall_T = ~mul_result_enable; // @[datapath.scala 524:45]
  wire  _mul_stall_T_2 = de_pipe_reg_alu_op == 5'hc; // @[datapath.scala 524:87]
  wire  mul_stall = de_pipe_reg_enable & ~mul_result_enable & de_pipe_reg_alu_op == 5'hc; // @[datapath.scala 524:64]
  reg  div_result_enable; // @[datapath.scala 519:40]
  wire  _div_stall_T = ~div_result_enable; // @[datapath.scala 525:45]
  wire  _div_stall_T_2 = de_pipe_reg_alu_op == 5'he; // @[datapath.scala 525:88]
  wire  _div_stall_T_3 = de_pipe_reg_alu_op == 5'hd; // @[datapath.scala 526:152]
  wire  _div_stall_T_4 = _div_stall_T_2 | de_pipe_reg_alu_op == 5'hd; // @[datapath.scala 526:129]
  wire  _div_stall_T_5 = de_pipe_reg_alu_op == 5'h10; // @[datapath.scala 527:152]
  wire  _div_stall_T_6 = _div_stall_T_4 | de_pipe_reg_alu_op == 5'h10; // @[datapath.scala 527:129]
  wire  _div_stall_T_7 = de_pipe_reg_alu_op == 5'hf; // @[datapath.scala 528:152]
  wire  _div_stall_T_8 = _div_stall_T_6 | de_pipe_reg_alu_op == 5'hf; // @[datapath.scala 528:129]
  wire  div_stall = de_pipe_reg_enable & ~div_result_enable & _div_stall_T_8; // @[datapath.scala 525:64]
  wire  stall = icache_stall | dcache_stall | mul_stall | div_stall; // @[datapath.scala 259:63]
  wire  brCond_taken = brCond_io_taken & de_pipe_reg_enable; // @[datapath.scala 625:41]
  wire  _jmp_occur_T = de_pipe_reg_pc_sel == 2'h1; // @[datapath.scala 619:64]
  wire  jmp_occur = de_pipe_reg_enable & de_pipe_reg_pc_sel == 2'h1; // @[datapath.scala 619:41]
  wire  _flush_fd_T_1 = brCond_taken | jmp_occur; // @[datapath.scala 272:58]
  wire  _csr_atomic_flush_T_1 = mw_pipe_reg_enable & mw_pipe_reg_csr_write_op != 3'h0; // @[datapath.scala 307:53]
  wire  _csr_atomic_flush_T_3 = em_pipe_reg_enable & em_pipe_reg_csr_write_op != 3'h0; // @[datapath.scala 308:88]
  wire  _csr_atomic_flush_T_5 = de_pipe_reg_enable & de_pipe_reg_csr_write_op != 3'h0; // @[datapath.scala 309:96]
  wire  _csr_atomic_flush_T_7 = fd_pipe_reg_enable & io_ctrl_csr_cmd != 3'h0; // @[datapath.scala 310:104]
  wire [1:0] _csr_atomic_flush_T_9 = de_pipe_reg_enable & de_pipe_reg_csr_write_op != 3'h0 ? 2'h3 : {{1'd0},
    _csr_atomic_flush_T_7}; // @[datapath.scala 309:76]
  wire [2:0] _csr_atomic_flush_T_10 = em_pipe_reg_enable & em_pipe_reg_csr_write_op != 3'h0 ? 3'h7 : {{1'd0},
    _csr_atomic_flush_T_9}; // @[datapath.scala 308:68]
  wire [3:0] csr_atomic_flush = mw_pipe_reg_enable & mw_pipe_reg_csr_write_op != 3'h0 ? 4'hf : {{1'd0},
    _csr_atomic_flush_T_10}; // @[datapath.scala 307:33]
  wire  flush_fd = csr_io_flush_mask[0] | (brCond_taken | jmp_occur) | csr_atomic_flush[0] | icache_flush_tag |
    dcache_flush_tag; // @[datapath.scala 272:115]
  wire  flush_de = csr_io_flush_mask[1] | _flush_fd_T_1 | csr_atomic_flush[1] | icache_flush_tag | dcache_flush_tag; // @[datapath.scala 273:119]
  wire  _flush_em_T_3 = icache_flush_tag | dcache_flush_tag; // @[datapath.scala 274:93]
  wire  flush_em = csr_io_flush_mask[2] | csr_atomic_flush[2] | (icache_flush_tag | dcache_flush_tag); // @[datapath.scala 274:72]
  wire  flush_mw = csr_io_flush_mask[3] | csr_atomic_flush[3]; // @[datapath.scala 275:45]
  wire [63:0] _csr_next_fetch_T_3 = mw_pipe_reg_pc + 64'h4; // @[datapath.scala 314:107]
  wire [63:0] _csr_next_fetch_T_7 = em_pipe_reg_pc + 64'h4; // @[datapath.scala 315:142]
  wire [63:0] _csr_next_fetch_T_11 = de_pipe_reg_pc + 64'h4; // @[datapath.scala 316:158]
  wire [63:0] _csr_next_fetch_T_13 = fd_pipe_reg_pc + 64'h4; // @[datapath.scala 316:180]
  wire [63:0] _csr_next_fetch_T_14 = _csr_atomic_flush_T_5 ? _csr_next_fetch_T_11 : _csr_next_fetch_T_13; // @[datapath.scala 316:84]
  wire [63:0] _csr_next_fetch_T_15 = _csr_atomic_flush_T_3 ? _csr_next_fetch_T_7 : _csr_next_fetch_T_14; // @[datapath.scala 315:68]
  wire [63:0] csr_next_fetch = _csr_atomic_flush_T_1 ? _csr_next_fetch_T_3 : _csr_next_fetch_T_15; // @[datapath.scala 314:33]
  wire  csr_atomic = |csr_atomic_flush; // @[datapath.scala 320:40]
  wire [63:0] _pc_T_1 = 64'h30000000 - 64'h4; // @[datapath.scala 322:46]
  reg [63:0] pc; // @[datapath.scala 322:25]
  wire  _GEN_0 = started ? 1'h0 : started; // @[datapath.scala 323:22 324:25 249:30]
  wire [63:0] _next_pc_T_1 = pc + 64'h4; // @[datapath.scala 329:20]
  wire  _next_pc_T_3 = ~started & stall; // @[datapath.scala 331:27]
  wire  _next_pc_T_8 = _jmp_occur_T & de_pipe_reg_enable; // @[datapath.scala 334:51]
  wire  _next_pc_T_9 = _jmp_occur_T & de_pipe_reg_enable | brCond_taken; // @[datapath.scala 334:73]
  wire [63:0] alu_out = alu_io_out;
  wire [63:0] _next_pc_T_10 = {{1'd0}, alu_out[63:1]}; // @[datapath.scala 334:103]
  wire [64:0] _next_pc_T_11 = {_next_pc_T_10, 1'h0}; // @[datapath.scala 334:110]
  wire [63:0] _next_pc_T_12 = csr_atomic ? csr_next_fetch : _next_pc_T_1; // @[Mux.scala 101:16]
  wire [64:0] _next_pc_T_13 = _next_pc_T_9 ? _next_pc_T_11 : {{1'd0}, _next_pc_T_12}; // @[Mux.scala 101:16]
  wire [64:0] _next_pc_T_14 = _flush_em_T_3 ? {{1'd0}, _csr_next_fetch_T_7} : _next_pc_T_13; // @[Mux.scala 101:16]
  wire [64:0] _next_pc_T_15 = csr_io_trap ? {{1'd0}, csr_io_trapVec} : _next_pc_T_14; // @[Mux.scala 101:16]
  wire [64:0] _next_pc_T_16 = _next_pc_T_3 ? {{1'd0}, pc} : _next_pc_T_15; // @[Mux.scala 101:16]
  wire [31:0] _inst_T_4 = pc[2] ? io_icache_cpu_response_data[63:32] : io_icache_cpu_response_data[31:0]; // @[datapath.scala 340:58]
  wire  _T = ~stall; // @[datapath.scala 354:26]
  wire  _GEN_3 = _T & ~flush_fd | fd_pipe_reg_enable; // @[datapath.scala 156:34 358:40 361:36]
  wire [4:0] src1_addr = fd_pipe_reg_inst[19:15]; // @[datapath.scala 373:41]
  wire [4:0] src2_addr = fd_pipe_reg_inst[24:20]; // @[datapath.scala 374:41]
  wire [4:0] dest_addr = fd_pipe_reg_inst[11:7]; // @[datapath.scala 375:41]
  wire  _csr_op_T = io_ctrl_csr_cmd == 3'h1; // @[datapath.scala 387:58]
  wire  _csr_op_T_2 = io_ctrl_csr_cmd == 3'h1 & dest_addr == 5'h0; // @[datapath.scala 387:70]
  wire  _csr_op_T_4 = io_ctrl_csr_cmd == 3'h3; // @[datapath.scala 389:70]
  wire  _csr_op_T_5 = src1_addr == 5'h0; // @[datapath.scala 389:96]
  wire  _csr_op_T_8 = io_ctrl_csr_cmd == 3'h2; // @[datapath.scala 391:86]
  wire [2:0] _csr_op_T_12 = _csr_op_T_8 ? 3'h4 : 3'h0; // @[datapath.scala 392:76]
  wire [2:0] _csr_op_T_13 = io_ctrl_csr_cmd == 3'h2 & _csr_op_T_5 ? 3'h1 : _csr_op_T_12; // @[datapath.scala 391:68]
  wire [2:0] _csr_op_T_14 = _csr_op_T_4 ? 3'h5 : _csr_op_T_13; // @[datapath.scala 390:60]
  wire [2:0] _csr_op_T_15 = io_ctrl_csr_cmd == 3'h3 & src1_addr == 5'h0 ? 3'h1 : _csr_op_T_14; // @[datapath.scala 389:52]
  wire [2:0] _csr_op_T_16 = _csr_op_T ? 3'h3 : _csr_op_T_15; // @[datapath.scala 388:44]
  wire [2:0] csr_op = _csr_op_T_2 ? 3'h2 : _csr_op_T_16; // @[datapath.scala 386:25]
  wire  mode_illegal = fd_pipe_reg_inst[29:28] > csr_io_mode & csr_op != 3'h0; // @[datapath.scala 401:67]
  wire  _csr_write_data_T_5 = mw_pipe_reg_wb_sel == 2'h0; // @[datapath.scala 405:80]
  wire  _csr_write_data_T_6 = mw_pipe_reg_wb_sel == 2'h2; // @[datapath.scala 406:88]
  wire  _csr_write_data_T_9 = mw_pipe_reg_wb_sel == 2'h3; // @[datapath.scala 407:96]
  wire [63:0] _csr_write_data_T_10 = mw_pipe_reg_wb_sel == 2'h3 ? mw_pipe_reg_csr_read_data : mw_pipe_reg_load_data; // @[datapath.scala 407:76]
  wire [63:0] _csr_write_data_T_11 = mw_pipe_reg_wb_sel == 2'h2 ? _csr_next_fetch_T_3 : _csr_write_data_T_10; // @[datapath.scala 406:68]
  wire [63:0] _csr_write_data_T_12 = mw_pipe_reg_wb_sel == 2'h0 ? mw_pipe_reg_alu_out : _csr_write_data_T_11; // @[datapath.scala 405:60]
  wire [1:0] _GEN_162 = {{1'd0}, io_ctrl_prv}; // @[datapath.scala 469:127]
  wire [63:0] _de_pipe_reg_csr_inst_misalign_T = fd_pipe_reg_pc & 64'h3; // @[datapath.scala 470:67]
  wire  _GEN_61 = io_icache_cpu_response_ready ? 1'h0 : icache_flush_tag; // @[datapath.scala 250:39 486:51 487:42]
  wire  _GEN_62 = io_dcache_cpu_response_ready ? 1'h0 : dcache_flush_tag; // @[datapath.scala 251:39 489:51 490:42]
  wire  _GEN_63 = 32'h100f == de_pipe_reg_inst & _T | _GEN_61; // @[datapath.scala 482:59 483:34]
  wire  _GEN_64 = 32'h100f == de_pipe_reg_inst & _T | _GEN_62; // @[datapath.scala 482:59 484:34]
  wire  _is_clint_T_5 = |de_pipe_reg_st_type; // @[datapath.scala 499:151]
  wire  _is_clint_T_6 = |de_pipe_reg_ld_type | (|de_pipe_reg_st_type); // @[datapath.scala 499:127]
  wire  is_clint = alu_out >= 64'h2000000 & alu_out <= 64'h200ffff & de_pipe_reg_enable & (|de_pipe_reg_ld_type | (|de_pipe_reg_st_type)); // @[datapath.scala 499:97]
  wire [63:0] _load_data_hazard_T_1 = em_pipe_reg_alu_out & 64'h7; // @[datapath.scala 501:147]
  wire [66:0] _load_data_hazard_T_2 = {_load_data_hazard_T_1, 3'h0}; // @[datapath.scala 501:158]
  wire [63:0] _load_data_hazard_T_3 = data_cache_response_data >> _load_data_hazard_T_2; // @[datapath.scala 501:122]
  wire [63:0] load_data_hazard = em_pipe_reg_is_clint & em_pipe_reg_enable ? clint_io_r_data : _load_data_hazard_T_3; // @[datapath.scala 501:35]
  wire  _load_data_ext_hazard_T = em_pipe_reg_ld_type == 3'h1; // @[datapath.scala 502:60]
  wire [31:0] _load_data_ext_hazard_T_3 = load_data_hazard[31] ? 32'hffffffff : 32'h0; // @[datapath.scala 502:78]
  wire [63:0] _load_data_ext_hazard_T_5 = {_load_data_ext_hazard_T_3,load_data_hazard[31:0]}; // @[Cat.scala 31:58]
  wire  _load_data_ext_hazard_T_6 = em_pipe_reg_ld_type == 3'h6; // @[datapath.scala 503:89]
  wire [63:0] _load_data_ext_hazard_T_9 = {32'h0,load_data_hazard[31:0]}; // @[Cat.scala 31:58]
  wire  _load_data_ext_hazard_T_10 = em_pipe_reg_ld_type == 3'h2; // @[datapath.scala 504:97]
  wire [47:0] _load_data_ext_hazard_T_13 = load_data_hazard[15] ? 48'hffffffffffff : 48'h0; // @[datapath.scala 504:115]
  wire [63:0] _load_data_ext_hazard_T_15 = {_load_data_ext_hazard_T_13,load_data_hazard[15:0]}; // @[Cat.scala 31:58]
  wire  _load_data_ext_hazard_T_16 = em_pipe_reg_ld_type == 3'h4; // @[datapath.scala 505:105]
  wire [63:0] _load_data_ext_hazard_T_19 = {48'h0,load_data_hazard[15:0]}; // @[Cat.scala 31:58]
  wire  _load_data_ext_hazard_T_20 = em_pipe_reg_ld_type == 3'h3; // @[datapath.scala 506:113]
  wire [55:0] _load_data_ext_hazard_T_23 = load_data_hazard[7] ? 56'hffffffffffffff : 56'h0; // @[datapath.scala 506:131]
  wire [63:0] _load_data_ext_hazard_T_25 = {_load_data_ext_hazard_T_23,load_data_hazard[7:0]}; // @[Cat.scala 31:58]
  wire  _load_data_ext_hazard_T_26 = em_pipe_reg_ld_type == 3'h5; // @[datapath.scala 507:121]
  wire [63:0] _load_data_ext_hazard_T_29 = {56'h0,load_data_hazard[7:0]}; // @[Cat.scala 31:58]
  wire [63:0] _load_data_ext_hazard_T_30 = em_pipe_reg_ld_type == 3'h5 ? _load_data_ext_hazard_T_29 : load_data_hazard; // @[datapath.scala 507:100]
  wire [63:0] _load_data_ext_hazard_T_31 = em_pipe_reg_ld_type == 3'h3 ? _load_data_ext_hazard_T_25 :
    _load_data_ext_hazard_T_30; // @[datapath.scala 506:92]
  wire [63:0] _load_data_ext_hazard_T_32 = em_pipe_reg_ld_type == 3'h4 ? _load_data_ext_hazard_T_19 :
    _load_data_ext_hazard_T_31; // @[datapath.scala 505:84]
  wire [63:0] _load_data_ext_hazard_T_33 = em_pipe_reg_ld_type == 3'h2 ? _load_data_ext_hazard_T_15 :
    _load_data_ext_hazard_T_32; // @[datapath.scala 504:76]
  wire [63:0] _load_data_ext_hazard_T_34 = em_pipe_reg_ld_type == 3'h6 ? _load_data_ext_hazard_T_9 :
    _load_data_ext_hazard_T_33; // @[datapath.scala 503:68]
  wire [63:0] load_data_ext_hazard = em_pipe_reg_ld_type == 3'h1 ? _load_data_ext_hazard_T_5 :
    _load_data_ext_hazard_T_34; // @[datapath.scala 502:39]
  wire [63:0] _GEN_163 = {{59'd0}, em_pipe_reg_dest}; // @[datapath.scala 514:51]
  wire  _src_unready_T = de_pipe_reg_src1_addr == _GEN_163; // @[datapath.scala 514:51]
  wire  _src_unready_T_1 = de_pipe_reg_src2_addr == _GEN_163; // @[datapath.scala 515:75]
  wire  src_unready = (_src_unready_T | de_pipe_reg_src2_addr == _GEN_163) & _dcache_stall_T & _dcache_stall_T_7 &
    em_pipe_reg_enable & de_pipe_reg_enable & _dcache_stall_T_9; // @[datapath.scala 515:188]
  reg [63:0] mul_result; // @[datapath.scala 516:33]
  reg [63:0] div_result; // @[datapath.scala 518:33]
  wire  _multiplier_io_mul_valid_T_2 = ~src_unready; // @[datapath.scala 531:100]
  wire  _multiplier_io_mulw_T = de_pipe_reg_wd_type == 2'h0; // @[datapath.scala 533:55]
  wire [31:0] _multiplier_io_mul_op_T = de_pipe_reg_inst & 32'hfe00707f; // @[datapath.scala 534:54]
  wire [1:0] _multiplier_io_mul_op_T_13 = 32'h2002033 == _multiplier_io_mul_op_T ? 2'h3 : 2'h2; // @[datapath.scala 536:68]
  wire [1:0] _multiplier_io_mul_op_T_14 = 32'h2001033 == _multiplier_io_mul_op_T ? 2'h1 : _multiplier_io_mul_op_T_13; // @[datapath.scala 535:60]
  wire  _T_22 = em_pipe_reg_enable & em_pipe_reg_wb_en; // @[datapath.scala 580:33]
  wire  _T_25 = de_pipe_reg_src1_addr != 64'h0; // @[datapath.scala 580:128]
  wire [63:0] _src1_data_T_5 = em_pipe_reg_wb_sel == 2'h3 ? em_pipe_reg_csr_read_data : load_data_ext_hazard; // @[datapath.scala 584:60]
  wire [63:0] _src1_data_T_6 = em_pipe_reg_wb_sel == 2'h2 ? _csr_next_fetch_T_7 : _src1_data_T_5; // @[datapath.scala 583:52]
  wire [63:0] _src1_data_T_7 = em_pipe_reg_wb_sel == 2'h0 ? em_pipe_reg_alu_out : _src1_data_T_6; // @[datapath.scala 582:41]
  wire [63:0] _GEN_77 = _src_unready_T ? _src1_data_T_7 : 64'h0; // @[datapath.scala 581:65 582:35]
  wire  _T_28 = mw_pipe_reg_enable & mw_pipe_reg_wb_en; // @[datapath.scala 586:39]
  wire [63:0] _GEN_167 = {{59'd0}, mw_pipe_reg_dest}; // @[datapath.scala 586:85]
  wire  _T_29 = de_pipe_reg_src1_addr == _GEN_167; // @[datapath.scala 586:85]
  wire [63:0] _GEN_78 = _T_29 ? _csr_write_data_T_12 : 64'h0; // @[datapath.scala 587:65 588:35]
  wire [63:0] _GEN_79 = mw_pipe_reg_enable & mw_pipe_reg_wb_en & de_pipe_reg_src1_addr == _GEN_167 & _T_25 ? _GEN_78 :
    de_pipe_reg_rs1; // @[datapath.scala 586:142 593:27]
  wire [63:0] src1_data = em_pipe_reg_enable & em_pipe_reg_wb_en & _src_unready_T & de_pipe_reg_src1_addr != 64'h0 ?
    _GEN_77 : _GEN_79; // @[datapath.scala 580:137]
  wire  _T_37 = de_pipe_reg_src2_addr != 64'h0; // @[datapath.scala 596:128]
  wire [63:0] _GEN_81 = _src_unready_T_1 ? _src1_data_T_7 : 64'h0; // @[datapath.scala 597:65 598:35]
  wire  _T_41 = de_pipe_reg_src2_addr == _GEN_167; // @[datapath.scala 602:85]
  wire [63:0] _GEN_82 = _T_41 ? _csr_write_data_T_12 : 64'h0; // @[datapath.scala 603:65 604:35]
  wire [63:0] _GEN_83 = _T_28 & de_pipe_reg_src2_addr == _GEN_167 & _T_37 ? _GEN_82 : de_pipe_reg_rs2; // @[datapath.scala 602:142 609:27]
  wire [63:0] src2_data = _T_22 & _src_unready_T_1 & de_pipe_reg_src2_addr != 64'h0 ? _GEN_81 : _GEN_83; // @[datapath.scala 596:137]
  wire  _divider_io_div_valid_T_2 = _div_stall_T_7 | _div_stall_T_3; // @[datapath.scala 543:72]
  wire  _divider_io_div_valid_T_4 = _divider_io_div_valid_T_2 | _div_stall_T_2; // @[datapath.scala 544:102]
  wire  _divider_io_div_valid_T_6 = _divider_io_div_valid_T_4 | _div_stall_T_5; // @[datapath.scala 545:102]
  wire  _GEN_68 = multiplier_io_out_valid | mul_result_enable; // @[datapath.scala 555:44 557:35 517:40]
  wire  _GEN_69 = flush_de ? 1'h0 : _GEN_68; // @[datapath.scala 553:23 554:35]
  wire [63:0] _GEN_71 = _div_stall_T_5 | _div_stall_T_2 ? divider_io_remainder : div_result; // @[datapath.scala 566:102 518:33 567:36]
  wire  _GEN_73 = divider_io_out_valid | div_result_enable; // @[datapath.scala 562:41 563:35 519:40]
  wire  _GEN_75 = flush_de ? 1'h0 : _GEN_73; // @[datapath.scala 560:23 561:35]
  wire [63:0] _computation_result_T_7 = _mul_stall_T_2 ? mul_result : alu_out; // @[datapath.scala 576:76]
  wire [63:0] _computation_result_T_8 = _div_stall_T_2 | _div_stall_T_5 ? div_result : _computation_result_T_7; // @[datapath.scala 575:68]
  wire [63:0] A_data = de_pipe_reg_A_sel ? src1_data : de_pipe_reg_pc; // @[datapath.scala 614:25]
  wire [63:0] B_data = de_pipe_reg_B_sel ? src2_data : de_pipe_reg_imm; // @[datapath.scala 615:25]
  wire  _alu_io_A_T = de_pipe_reg_wd_type == 2'h1; // @[datapath.scala 616:45]
  wire  _T_49 = ~flush_em; // @[datapath.scala 651:30]
  wire  _em_pipe_reg_csr_store_misalign_T_1 = de_pipe_reg_st_type == 3'h3; // @[datapath.scala 676:126]
  wire  _em_pipe_reg_csr_store_misalign_T_2 = de_pipe_reg_st_type == 3'h2; // @[datapath.scala 677:126]
  wire  _em_pipe_reg_csr_store_misalign_T_5 = de_pipe_reg_st_type == 3'h1; // @[datapath.scala 678:126]
  wire  _em_pipe_reg_csr_store_misalign_T_7 = alu_out[1:0] != 2'h0; // @[datapath.scala 678:155]
  wire  _em_pipe_reg_csr_store_misalign_T_8 = de_pipe_reg_st_type == 3'h4; // @[datapath.scala 679:126]
  wire  _em_pipe_reg_csr_store_misalign_T_10 = alu_out[2:0] != 3'h0; // @[datapath.scala 679:155]
  wire  _em_pipe_reg_csr_store_misalign_T_12 = _em_pipe_reg_csr_store_misalign_T_5 ? _em_pipe_reg_csr_store_misalign_T_7
     : _em_pipe_reg_csr_store_misalign_T_8 & _em_pipe_reg_csr_store_misalign_T_10; // @[Mux.scala 101:16]
  wire  _em_pipe_reg_csr_store_misalign_T_13 = _em_pipe_reg_csr_store_misalign_T_2 ? alu_out[0] :
    _em_pipe_reg_csr_store_misalign_T_12; // @[Mux.scala 101:16]
  wire  _em_pipe_reg_csr_store_misalign_T_14 = _em_pipe_reg_csr_store_misalign_T_1 ? 1'h0 :
    _em_pipe_reg_csr_store_misalign_T_13; // @[Mux.scala 101:16]
  wire  _em_pipe_reg_csr_load_misalign_T_3 = de_pipe_reg_ld_type == 3'h3 | de_pipe_reg_ld_type == 3'h5; // @[datapath.scala 685:136]
  wire  _em_pipe_reg_csr_load_misalign_T_4 = de_pipe_reg_ld_type == 3'h2; // @[datapath.scala 686:126]
  wire  _em_pipe_reg_csr_load_misalign_T_5 = de_pipe_reg_ld_type == 3'h4; // @[datapath.scala 686:159]
  wire  _em_pipe_reg_csr_load_misalign_T_6 = de_pipe_reg_ld_type == 3'h2 | de_pipe_reg_ld_type == 3'h4; // @[datapath.scala 686:136]
  wire  _em_pipe_reg_csr_load_misalign_T_9 = de_pipe_reg_ld_type == 3'h1; // @[datapath.scala 687:126]
  wire [14:0] _GEN_173 = {{12'd0}, de_pipe_reg_ld_type}; // @[datapath.scala 687:159]
  wire [14:0] _em_pipe_reg_csr_load_misalign_T_10 = _GEN_173 & 15'h707f; // @[datapath.scala 687:159]
  wire  _em_pipe_reg_csr_load_misalign_T_12 = de_pipe_reg_ld_type == 3'h1 | 15'h6003 ==
    _em_pipe_reg_csr_load_misalign_T_10; // @[datapath.scala 687:136]
  wire  _em_pipe_reg_csr_load_misalign_T_15 = de_pipe_reg_ld_type == 3'h7; // @[datapath.scala 688:126]
  wire  _em_pipe_reg_csr_load_misalign_T_19 = _em_pipe_reg_csr_load_misalign_T_12 ? _em_pipe_reg_csr_store_misalign_T_7
     : _em_pipe_reg_csr_load_misalign_T_15 & _em_pipe_reg_csr_store_misalign_T_10; // @[Mux.scala 101:16]
  wire  _em_pipe_reg_csr_load_misalign_T_20 = _em_pipe_reg_csr_load_misalign_T_6 ? alu_out[0] :
    _em_pipe_reg_csr_load_misalign_T_19; // @[Mux.scala 101:16]
  wire  _em_pipe_reg_csr_load_misalign_T_21 = _em_pipe_reg_csr_load_misalign_T_3 ? 1'h0 :
    _em_pipe_reg_csr_load_misalign_T_20; // @[Mux.scala 101:16]
  wire  _GEN_133 = io_dcache_cpu_request_valid & io_dcache_cpu_response_ready | data_cache_tag; // @[datapath.scala 698:80 699:32 254:37]
  wire  _clint_io_wen_T_1 = _dcache_stall_T_1 & em_pipe_reg_enable; // @[datapath.scala 705:49]
  wire  _io_dcache_cpu_request_valid_T_13 = _is_clint_T_6 & de_pipe_reg_enable & ~is_clint & _T_49; // @[datapath.scala 710:169]
  wire  _io_dcache_cpu_request_valid_T_14 = stall ? _dcache_stall_T_2 & em_pipe_reg_enable & _dcache_stall_T_9 :
    _io_dcache_cpu_request_valid_T_13; // @[datapath.scala 709:44]
  wire [63:0] _io_dcache_cpu_request_addr_T = stall ? em_pipe_reg_alu_out : alu_out; // @[datapath.scala 712:42]
  wire [5:0] _io_dcache_cpu_request_data_T_1 = {em_pipe_reg_alu_out[2:0], 3'h0}; // @[datapath.scala 713:100]
  wire [126:0] _GEN_13 = {{63'd0}, em_pipe_reg_st_data}; // @[datapath.scala 713:70]
  wire [126:0] _io_dcache_cpu_request_data_T_2 = _GEN_13 << _io_dcache_cpu_request_data_T_1; // @[datapath.scala 713:70]
  wire [5:0] _io_dcache_cpu_request_data_T_4 = {alu_out[2:0], 3'h0}; // @[datapath.scala 713:137]
  wire [126:0] _GEN_30 = {{63'd0}, src2_data}; // @[datapath.scala 713:119]
  wire [126:0] _io_dcache_cpu_request_data_T_5 = _GEN_30 << _io_dcache_cpu_request_data_T_4; // @[datapath.scala 713:119]
  wire [126:0] _io_dcache_cpu_request_data_T_6 = stall ? _io_dcache_cpu_request_data_T_2 :
    _io_dcache_cpu_request_data_T_5; // @[datapath.scala 713:42]
  wire  _accessType_stall_T_7 = em_pipe_reg_st_type == 3'h1; // @[datapath.scala 715:156]
  wire  _accessType_stall_T_13 = em_pipe_reg_st_type == 3'h2; // @[datapath.scala 716:164]
  wire  _accessType_stall_T_14 = _load_data_ext_hazard_T_16 | _load_data_ext_hazard_T_10 | em_pipe_reg_st_type == 3'h2; // @[datapath.scala 716:140]
  wire [1:0] _accessType_stall_T_18 = _load_data_ext_hazard_T | _load_data_ext_hazard_T_6 | em_pipe_reg_st_type == 3'h1
     ? 2'h2 : {{1'd0}, _accessType_stall_T_14}; // @[datapath.scala 715:68]
  wire [1:0] accessType_stall = em_pipe_reg_ld_type == 3'h7 | em_pipe_reg_st_type == 3'h4 ? 2'h3 :
    _accessType_stall_T_18; // @[datapath.scala 714:35]
  wire  _accessType_direct_T_14 = _em_pipe_reg_csr_load_misalign_T_5 | _em_pipe_reg_csr_load_misalign_T_4 |
    _em_pipe_reg_csr_store_misalign_T_2; // @[datapath.scala 722:140]
  wire [1:0] _accessType_direct_T_18 = _em_pipe_reg_csr_load_misalign_T_9 | de_pipe_reg_ld_type == 3'h6 |
    _em_pipe_reg_csr_store_misalign_T_5 ? 2'h2 : {{1'd0}, _accessType_direct_T_14}; // @[datapath.scala 721:68]
  wire [1:0] accessType_direct = _em_pipe_reg_csr_load_misalign_T_15 | _em_pipe_reg_csr_store_misalign_T_8 ? 2'h3 :
    _accessType_direct_T_18; // @[datapath.scala 720:36]
  wire [7:0] _st_mask_T_3 = em_pipe_reg_st_type == 3'h3 ? 8'h1 : 8'hff; // @[datapath.scala 729:76]
  wire [7:0] _st_mask_T_4 = _accessType_stall_T_13 ? 8'h3 : _st_mask_T_3; // @[datapath.scala 728:68]
  wire [7:0] _st_mask_T_5 = _accessType_stall_T_7 ? 8'hf : _st_mask_T_4; // @[datapath.scala 727:37]
  wire [7:0] _st_mask_T_9 = _em_pipe_reg_csr_store_misalign_T_1 ? 8'h1 : 8'hff; // @[datapath.scala 734:76]
  wire [7:0] _st_mask_T_10 = _em_pipe_reg_csr_store_misalign_T_2 ? 8'h3 : _st_mask_T_9; // @[datapath.scala 733:68]
  wire [7:0] _st_mask_T_11 = _em_pipe_reg_csr_store_misalign_T_5 ? 8'hf : _st_mask_T_10; // @[datapath.scala 732:60]
  wire [7:0] st_mask = stall ? _st_mask_T_5 : _st_mask_T_11; // @[datapath.scala 727:26]
  wire [14:0] _GEN_40 = {{7'd0}, st_mask}; // @[datapath.scala 739:105]
  wire [14:0] _io_dcache_cpu_request_mask_T_3 = _GEN_40 << em_pipe_reg_alu_out[2:0]; // @[datapath.scala 739:105]
  wire [14:0] _GEN_57 = {{7'd0}, st_mask}; // @[datapath.scala 739:150]
  wire [14:0] _io_dcache_cpu_request_mask_T_6 = _GEN_57 << alu_out[2:0]; // @[datapath.scala 739:150]
  wire [7:0] _io_dcache_cpu_request_mask_T_8 = stall ? _io_dcache_cpu_request_mask_T_3[7:0] :
    _io_dcache_cpu_request_mask_T_6[7:0]; // @[datapath.scala 739:88]
  wire [63:0] load_data = em_pipe_reg_is_clint ? clint_io_r_data : _load_data_hazard_T_3; // @[datapath.scala 740:28]
  wire [31:0] _load_data_ext_T_3 = load_data[31] ? 32'hffffffff : 32'h0; // @[datapath.scala 741:71]
  wire [63:0] _load_data_ext_T_5 = {_load_data_ext_T_3,load_data[31:0]}; // @[Cat.scala 31:58]
  wire [63:0] _load_data_ext_T_9 = {32'h0,load_data[31:0]}; // @[Cat.scala 31:58]
  wire [47:0] _load_data_ext_T_13 = load_data[15] ? 48'hffffffffffff : 48'h0; // @[datapath.scala 743:107]
  wire [63:0] _load_data_ext_T_15 = {_load_data_ext_T_13,load_data[15:0]}; // @[Cat.scala 31:58]
  wire [63:0] _load_data_ext_T_19 = {48'h0,load_data[15:0]}; // @[Cat.scala 31:58]
  wire [55:0] _load_data_ext_T_23 = load_data[7] ? 56'hffffffffffffff : 56'h0; // @[datapath.scala 745:123]
  wire [63:0] _load_data_ext_T_25 = {_load_data_ext_T_23,load_data[7:0]}; // @[Cat.scala 31:58]
  wire [63:0] _load_data_ext_T_29 = {56'h0,load_data[7:0]}; // @[Cat.scala 31:58]
  wire [63:0] _load_data_ext_T_30 = _load_data_ext_hazard_T_26 ? _load_data_ext_T_29 : load_data; // @[datapath.scala 746:92]
  wire [63:0] _load_data_ext_T_31 = _load_data_ext_hazard_T_20 ? _load_data_ext_T_25 : _load_data_ext_T_30; // @[datapath.scala 745:84]
  wire [63:0] _load_data_ext_T_32 = _load_data_ext_hazard_T_16 ? _load_data_ext_T_19 : _load_data_ext_T_31; // @[datapath.scala 744:76]
  wire [63:0] _load_data_ext_T_33 = _load_data_ext_hazard_T_10 ? _load_data_ext_T_15 : _load_data_ext_T_32; // @[datapath.scala 743:68]
  wire [63:0] _load_data_ext_T_34 = _load_data_ext_hazard_T_6 ? _load_data_ext_T_9 : _load_data_ext_T_33; // @[datapath.scala 742:60]
  wire  _regFile_io_wen_T_2 = _csr_write_data_T_5 | _csr_write_data_T_6; // @[datapath.scala 806:59]
  wire  _regFile_io_wen_T_3 = mw_pipe_reg_wb_sel == 2'h1; // @[datapath.scala 808:68]
  wire  _regFile_io_wen_T_4 = _regFile_io_wen_T_2 | _regFile_io_wen_T_3; // @[datapath.scala 807:79]
  wire [63:0] next_pc = _next_pc_T_16[63:0];
  ysyx_041812_AluSimple alu ( // @[datapath.scala 243:25]
    .io_A(alu_io_A),
    .io_B(alu_io_B),
    .io_width_type(alu_io_width_type),
    .io_alu_op(alu_io_alu_op),
    .io_out(alu_io_out)
  );
  ysyx_041812_ImmGenWire immGen ( // @[datapath.scala 244:28]
    .io_inst(immGen_io_inst),
    .io_sel(immGen_io_sel),
    .io_out(immGen_io_out)
  );
  ysyx_041812_BrCondSimple brCond ( // @[datapath.scala 245:28]
    .io_rs1(brCond_io_rs1),
    .io_rs2(brCond_io_rs2),
    .io_br_type(brCond_io_br_type),
    .io_taken(brCond_io_taken)
  );
  ysyx_041812_RegisterFile regFile ( // @[datapath.scala 246:29]
    .clock(regFile_clock),
    .reset(regFile_reset),
    .io_wen(regFile_io_wen),
    .io_waddr(regFile_io_waddr),
    .io_wdata(regFile_io_wdata),
    .io_raddr_0(regFile_io_raddr_0),
    .io_raddr_1(regFile_io_raddr_1),
    .io_rdata_0(regFile_io_rdata_0),
    .io_rdata_1(regFile_io_rdata_1)
  );
  ysyx_041812_Multiplier multiplier ( // @[datapath.scala 247:32]
    .clock(multiplier_clock),
    .reset(multiplier_reset),
    .io_mul_valid(multiplier_io_mul_valid),
    .io_flush(multiplier_io_flush),
    .io_mulw(multiplier_io_mulw),
    .io_mul_op(multiplier_io_mul_op),
    .io_multilicand(multiplier_io_multilicand),
    .io_multiplier(multiplier_io_multiplier),
    .io_out_valid(multiplier_io_out_valid),
    .io_result(multiplier_io_result)
  );
  ysyx_041812_Divider divider ( // @[datapath.scala 248:29]
    .clock(divider_clock),
    .reset(divider_reset),
    .io_dividend(divider_io_dividend),
    .io_divisor(divider_io_divisor),
    .io_div_valid(divider_io_div_valid),
    .io_divw(divider_io_divw),
    .io_div_signed(divider_io_div_signed),
    .io_flush(divider_io_flush),
    .io_out_valid(divider_io_out_valid),
    .io_quotient(divider_io_quotient),
    .io_remainder(divider_io_remainder)
  );
  ysyx_041812_CSR csr ( // @[datapath.scala 261:25]
    .clock(csr_clock),
    .reset(csr_reset),
    .io_flush_mask(csr_io_flush_mask),
    .io_r_op(csr_io_r_op),
    .io_r_addr(csr_io_r_addr),
    .io_r_data(csr_io_r_data),
    .io_w_op(csr_io_w_op),
    .io_w_addr(csr_io_w_addr),
    .io_w_data(csr_io_w_data),
    .io_retired(csr_io_retired),
    .io_inst(csr_io_inst),
    .io_int_timer_clear(csr_io_int_timer_clear),
    .io_int_soft_clear(csr_io_int_soft_clear),
    .io_int_timer(csr_io_int_timer),
    .io_int_soft(csr_io_int_soft),
    .io_extern(csr_io_extern),
    .io_jump_taken(csr_io_jump_taken),
    .io_isSret(csr_io_isSret),
    .io_isMret(csr_io_isMret),
    .io_de_pipe_reg_pc(csr_io_de_pipe_reg_pc),
    .io_fd_pipe_reg_pc(csr_io_fd_pipe_reg_pc),
    .io_jump_addr(csr_io_jump_addr),
    .io_excPC(csr_io_excPC),
    .io_trapVec(csr_io_trapVec),
    .io_stall(csr_io_stall),
    .io_trap(csr_io_trap),
    .io_mode(csr_io_mode),
    .io_accessType_illegal(csr_io_accessType_illegal),
    .io_is_illegal(csr_io_is_illegal),
    .io_inst_misalign(csr_io_inst_misalign),
    .io_store_misalign(csr_io_store_misalign),
    .io_load_misalign(csr_io_load_misalign),
    .io_alu_out(csr_io_alu_out),
    .io_mw_enable(csr_io_mw_enable),
    .io_em_enable(csr_io_em_enable),
    .io_de_enable(csr_io_de_enable),
    .io_fd_enable(csr_io_fd_enable)
  );
  ysyx_041812_clint clint ( // @[datapath.scala 264:28]
    .clock(clint_clock),
    .reset(clint_reset),
    .io_addr(clint_io_addr),
    .io_w_data(clint_io_w_data),
    .io_wen(clint_io_wen),
    .io_r_data(clint_io_r_data),
    .io_soft_valid(clint_io_soft_valid),
    .io_timer_valid(clint_io_timer_valid),
    .io_timer_clear(clint_io_timer_clear),
    .io_soft_clear(clint_io_soft_clear)
  );
  assign io_ctrl_inst = fd_pipe_reg_inst; // @[datapath.scala 370:22]
  assign io_icache_cpu_request_addr = next_pc[31:0]; // @[datapath.scala 347:36]
  assign io_icache_flush = icache_flush_tag; // @[datapath.scala 346:25]
  assign io_dcache_cpu_request_addr = _io_dcache_cpu_request_addr_T[31:0]; // @[datapath.scala 712:36]
  assign io_dcache_cpu_request_data = _io_dcache_cpu_request_data_T_6[63:0]; // @[datapath.scala 713:145]
  assign io_dcache_cpu_request_mask = st_mask == 8'hff ? st_mask : _io_dcache_cpu_request_mask_T_8; // @[datapath.scala 739:42]
  assign io_dcache_cpu_request_rw = stall ? _clint_io_wen_T_1 : _is_clint_T_5 & de_pipe_reg_enable; // @[datapath.scala 711:40]
  assign io_dcache_cpu_request_valid = (_io_dcache_cpu_request_valid_T_14 | dcache_flush_tag) & _dcache_stall_T_7; // @[datapath.scala 710:206]
  assign io_dcache_flush = dcache_flush_tag; // @[datapath.scala 708:25]
  assign io_dcache_accessType = stall ? accessType_stall : accessType_direct; // @[datapath.scala 726:36]
  assign alu_io_A = de_pipe_reg_wd_type == 2'h1 ? {{32'd0}, A_data[31:0]} : A_data; // @[datapath.scala 616:24]
  assign alu_io_B = _alu_io_A_T ? {{32'd0}, B_data[31:0]} : B_data; // @[datapath.scala 617:24]
  assign alu_io_width_type = de_pipe_reg_wd_type; // @[datapath.scala 613:27]
  assign alu_io_alu_op = de_pipe_reg_alu_op[3:0]; // @[datapath.scala 612:23]
  assign immGen_io_inst = fd_pipe_reg_inst; // @[datapath.scala 382:24]
  assign immGen_io_sel = io_ctrl_imm_sel; // @[datapath.scala 383:23]
  assign brCond_io_rs1 = em_pipe_reg_enable & em_pipe_reg_wb_en & _src_unready_T & de_pipe_reg_src1_addr != 64'h0 ?
    _GEN_77 : _GEN_79; // @[datapath.scala 580:137]
  assign brCond_io_rs2 = _T_22 & _src_unready_T_1 & de_pipe_reg_src2_addr != 64'h0 ? _GEN_81 : _GEN_83; // @[datapath.scala 596:137]
  assign brCond_io_br_type = de_pipe_reg_br_type; // @[datapath.scala 621:27]
  assign regFile_clock = clock;
  assign regFile_reset = reset;
  assign regFile_io_wen = (_regFile_io_wen_T_4 | _csr_write_data_T_9) & mw_pipe_reg_wb_en & mw_pipe_reg_enable & _T; // @[datapath.scala 808:159]
  assign regFile_io_waddr = mw_pipe_reg_dest; // @[datapath.scala 809:26]
  assign regFile_io_wdata = _csr_write_data_T_5 ? mw_pipe_reg_alu_out : _csr_write_data_T_11; // @[datapath.scala 810:32]
  assign regFile_io_raddr_0 = fd_pipe_reg_inst[19:15]; // @[datapath.scala 373:41]
  assign regFile_io_raddr_1 = fd_pipe_reg_inst[24:20]; // @[datapath.scala 374:41]
  assign multiplier_clock = clock;
  assign multiplier_reset = reset;
  assign multiplier_io_mul_valid = _mul_stall_T_2 & de_pipe_reg_enable & ~src_unready & _mul_stall_T; // @[datapath.scala 531:113]
  assign multiplier_io_flush = csr_io_flush_mask[1] | _flush_fd_T_1 | csr_atomic_flush[1] | icache_flush_tag |
    dcache_flush_tag; // @[datapath.scala 273:119]
  assign multiplier_io_mulw = de_pipe_reg_wd_type == 2'h0 ? 1'h0 : 1'h1; // @[datapath.scala 533:34]
  assign multiplier_io_mul_op = 32'h2000033 == _multiplier_io_mul_op_T | 32'h200003b == _multiplier_io_mul_op_T ? 2'h0
     : _multiplier_io_mul_op_T_14; // @[datapath.scala 534:36]
  assign multiplier_io_multilicand = em_pipe_reg_enable & em_pipe_reg_wb_en & _src_unready_T & de_pipe_reg_src1_addr != 64'h0
     ? _GEN_77 : _GEN_79; // @[datapath.scala 540:48]
  assign multiplier_io_multiplier = _T_22 & _src_unready_T_1 & de_pipe_reg_src2_addr != 64'h0 ? _GEN_81 : _GEN_83; // @[datapath.scala 541:47]
  assign divider_clock = clock;
  assign divider_reset = reset;
  assign divider_io_dividend = em_pipe_reg_enable & em_pipe_reg_wb_en & _src_unready_T & de_pipe_reg_src1_addr != 64'h0
     ? _GEN_77 : _GEN_79; // @[datapath.scala 550:42]
  assign divider_io_divisor = _T_22 & _src_unready_T_1 & de_pipe_reg_src2_addr != 64'h0 ? _GEN_81 : _GEN_83; // @[datapath.scala 551:41]
  assign divider_io_div_valid = _divider_io_div_valid_T_6 & de_pipe_reg_enable & _multiplier_io_mul_valid_T_2 &
    _div_stall_T; // @[datapath.scala 546:142]
  assign divider_io_divw = _multiplier_io_mulw_T ? 1'h0 : 1'h1; // @[datapath.scala 548:31]
  assign divider_io_div_signed = _div_stall_T_3 | _div_stall_T_2; // @[datapath.scala 549:71]
  assign divider_io_flush = csr_io_flush_mask[1] | _flush_fd_T_1 | csr_atomic_flush[1] | icache_flush_tag |
    dcache_flush_tag; // @[datapath.scala 273:119]
  assign csr_clock = clock;
  assign csr_reset = reset;
  assign csr_io_r_op = _csr_op_T_2 ? 3'h2 : _csr_op_T_16; // @[datapath.scala 386:25]
  assign csr_io_r_addr = fd_pipe_reg_inst[31:20]; // @[datapath.scala 400:42]
  assign csr_io_w_op = mw_pipe_reg_csr_write_op; // @[datapath.scala 798:21]
  assign csr_io_w_addr = mw_pipe_reg_csr_write_addr; // @[datapath.scala 799:23]
  assign csr_io_w_data = mw_pipe_reg_csr_write_data; // @[datapath.scala 800:23]
  assign csr_io_retired = mw_pipe_reg_inst != 32'h13; // @[datapath.scala 797:44]
  assign csr_io_inst = em_pipe_reg_inst; // @[datapath.scala 754:21]
  assign csr_io_int_timer_clear = clint_io_timer_clear; // @[datapath.scala 284:32]
  assign csr_io_int_soft_clear = clint_io_soft_clear; // @[datapath.scala 285:31]
  assign csr_io_int_timer = clint_io_timer_valid; // @[datapath.scala 286:26]
  assign csr_io_int_soft = clint_io_soft_valid; // @[datapath.scala 287:26]
  assign csr_io_extern = io_interrupt; // @[datapath.scala 288:26]
  assign csr_io_jump_taken = em_pipe_reg_jump_taken; // @[datapath.scala 758:27]
  assign csr_io_isSret = 32'h10200073 == em_pipe_reg_inst; // @[datapath.scala 755:43]
  assign csr_io_isMret = 32'h30200073 == em_pipe_reg_inst; // @[datapath.scala 756:43]
  assign csr_io_de_pipe_reg_pc = de_pipe_reg_pc; // @[datapath.scala 478:31]
  assign csr_io_fd_pipe_reg_pc = fd_pipe_reg_pc; // @[datapath.scala 369:31]
  assign csr_io_jump_addr = alu_io_out; // @[datapath.scala 753:26]
  assign csr_io_excPC = em_pipe_reg_pc; // @[datapath.scala 757:22]
  assign csr_io_stall = icache_stall | dcache_stall | mul_stall | div_stall; // @[datapath.scala 259:63]
  assign csr_io_is_illegal = em_pipe_reg_csr_is_illegal; // @[datapath.scala 760:27]
  assign csr_io_inst_misalign = em_pipe_reg_csr_inst_misalign; // @[datapath.scala 761:30]
  assign csr_io_store_misalign = em_pipe_reg_csr_store_misalign; // @[datapath.scala 762:31]
  assign csr_io_load_misalign = em_pipe_reg_csr_load_misalign; // @[datapath.scala 763:30]
  assign csr_io_alu_out = em_pipe_reg_alu_out; // @[datapath.scala 764:24]
  assign csr_io_mw_enable = mw_pipe_reg_enable; // @[datapath.scala 796:26]
  assign csr_io_em_enable = em_pipe_reg_enable; // @[datapath.scala 707:26]
  assign csr_io_de_enable = de_pipe_reg_enable; // @[datapath.scala 477:26]
  assign csr_io_fd_enable = fd_pipe_reg_enable; // @[datapath.scala 368:26]
  assign clint_clock = clock;
  assign clint_reset = reset;
  assign clint_io_addr = em_pipe_reg_alu_out; // @[datapath.scala 703:23]
  assign clint_io_w_data = em_pipe_reg_st_data; // @[datapath.scala 704:25]
  assign clint_io_wen = _dcache_stall_T_1 & em_pipe_reg_enable & em_pipe_reg_is_clint; // @[datapath.scala 705:71]
  always @(posedge clock) begin
    if (reset) begin // @[datapath.scala 156:34]
      fd_pipe_reg_inst <= 32'h13; // @[datapath.scala 156:34]
    end else if (flush_fd & ~stall) begin // @[datapath.scala 354:33]
      fd_pipe_reg_inst <= 32'h13; // @[datapath.scala 356:34]
    end else if (_T & ~flush_fd) begin // @[datapath.scala 358:40]
      if (started) begin // @[datapath.scala 340:27]
        fd_pipe_reg_inst <= 32'h13;
      end else begin
        fd_pipe_reg_inst <= _inst_T_4;
      end
    end
    if (reset) begin // @[datapath.scala 156:34]
      fd_pipe_reg_pc <= 64'h80000000; // @[datapath.scala 156:34]
    end else if (flush_fd & ~stall) begin // @[datapath.scala 354:33]
      fd_pipe_reg_pc <= 64'h80000000; // @[datapath.scala 355:32]
    end else if (_T & ~flush_fd) begin // @[datapath.scala 358:40]
      fd_pipe_reg_pc <= pc; // @[datapath.scala 359:32]
    end
    if (reset) begin // @[datapath.scala 156:34]
      fd_pipe_reg_enable <= 1'h0; // @[datapath.scala 156:34]
    end else if (flush_fd & ~stall) begin // @[datapath.scala 354:33]
      fd_pipe_reg_enable <= 1'h0; // @[datapath.scala 357:36]
    end else begin
      fd_pipe_reg_enable <= _GEN_3;
    end
    if (reset) begin // @[datapath.scala 164:34]
      de_pipe_reg_alu_op <= 5'h0; // @[datapath.scala 164:34]
    end else if (flush_de & _T) begin // @[datapath.scala 410:33]
      de_pipe_reg_alu_op <= 5'h0; // @[datapath.scala 412:36]
    end else if (_T & ~flush_de) begin // @[datapath.scala 438:40]
      de_pipe_reg_alu_op <= io_ctrl_alu_op; // @[datapath.scala 440:36]
    end
    if (reset) begin // @[datapath.scala 164:34]
      de_pipe_reg_pc <= 64'h80000000; // @[datapath.scala 164:34]
    end else if (flush_de & _T) begin // @[datapath.scala 410:33]
      de_pipe_reg_pc <= 64'h80000000; // @[datapath.scala 419:32]
    end else if (_T & ~flush_de) begin // @[datapath.scala 438:40]
      de_pipe_reg_pc <= fd_pipe_reg_pc; // @[datapath.scala 447:32]
    end
    if (reset) begin // @[datapath.scala 164:34]
      de_pipe_reg_inst <= 32'h13; // @[datapath.scala 164:34]
    end else if (flush_de & _T) begin // @[datapath.scala 410:33]
      de_pipe_reg_inst <= 32'h13; // @[datapath.scala 411:34]
    end else if (_T & ~flush_de) begin // @[datapath.scala 438:40]
      de_pipe_reg_inst <= fd_pipe_reg_inst; // @[datapath.scala 439:34]
    end
    if (reset) begin // @[datapath.scala 164:34]
      de_pipe_reg_imm <= 64'h0; // @[datapath.scala 164:34]
    end else if (flush_de & _T) begin // @[datapath.scala 410:33]
      de_pipe_reg_imm <= 64'h0; // @[datapath.scala 420:33]
    end else if (_T & ~flush_de) begin // @[datapath.scala 438:40]
      de_pipe_reg_imm <= immGen_io_out; // @[datapath.scala 448:33]
    end
    if (reset) begin // @[datapath.scala 164:34]
      de_pipe_reg_imm_sel <= 3'h0; // @[datapath.scala 164:34]
    end else if (flush_de & _T) begin // @[datapath.scala 410:33]
      de_pipe_reg_imm_sel <= 3'h0; // @[datapath.scala 421:37]
    end else if (_T & ~flush_de) begin // @[datapath.scala 438:40]
      de_pipe_reg_imm_sel <= io_ctrl_imm_sel; // @[datapath.scala 449:37]
    end
    if (reset) begin // @[datapath.scala 164:34]
      de_pipe_reg_rs1 <= 64'h0; // @[datapath.scala 164:34]
    end else if (flush_de & _T) begin // @[datapath.scala 410:33]
      de_pipe_reg_rs1 <= 64'h0; // @[datapath.scala 422:33]
    end else if (_T & ~flush_de) begin // @[datapath.scala 438:40]
      if (mw_pipe_reg_enable & mw_pipe_reg_dest == src1_addr & mw_pipe_reg_wb_en & src1_addr != 5'h0) begin // @[datapath.scala 404:33]
        de_pipe_reg_rs1 <= _csr_write_data_T_12;
      end else begin
        de_pipe_reg_rs1 <= regFile_io_rdata_0;
      end
    end
    if (reset) begin // @[datapath.scala 164:34]
      de_pipe_reg_src1_addr <= 64'h0; // @[datapath.scala 164:34]
    end else if (flush_de & _T) begin // @[datapath.scala 410:33]
      de_pipe_reg_src1_addr <= 64'h0; // @[datapath.scala 423:39]
    end else if (_T & ~flush_de) begin // @[datapath.scala 438:40]
      de_pipe_reg_src1_addr <= {{59'd0}, src1_addr}; // @[datapath.scala 454:39]
    end
    if (reset) begin // @[datapath.scala 164:34]
      de_pipe_reg_rs2 <= 64'h0; // @[datapath.scala 164:34]
    end else if (flush_de & _T) begin // @[datapath.scala 410:33]
      de_pipe_reg_rs2 <= 64'h0; // @[datapath.scala 424:33]
    end else if (_T & ~flush_de) begin // @[datapath.scala 438:40]
      if (mw_pipe_reg_enable & mw_pipe_reg_dest == src2_addr & mw_pipe_reg_wb_en & src2_addr != 5'h0) begin // @[datapath.scala 455:39]
        de_pipe_reg_rs2 <= _csr_write_data_T_12;
      end else begin
        de_pipe_reg_rs2 <= regFile_io_rdata_1;
      end
    end
    if (reset) begin // @[datapath.scala 164:34]
      de_pipe_reg_src2_addr <= 64'h0; // @[datapath.scala 164:34]
    end else if (flush_de & _T) begin // @[datapath.scala 410:33]
      de_pipe_reg_src2_addr <= 64'h0; // @[datapath.scala 425:39]
    end else if (_T & ~flush_de) begin // @[datapath.scala 438:40]
      de_pipe_reg_src2_addr <= {{59'd0}, src2_addr}; // @[datapath.scala 459:39]
    end
    if (reset) begin // @[datapath.scala 164:34]
      de_pipe_reg_csr_read_data <= 64'h0; // @[datapath.scala 164:34]
    end else if (flush_de & _T) begin // @[datapath.scala 410:33]
      de_pipe_reg_csr_read_data <= 64'h0; // @[datapath.scala 415:43]
    end else if (_T & ~flush_de) begin // @[datapath.scala 438:40]
      de_pipe_reg_csr_read_data <= csr_io_r_data; // @[datapath.scala 443:43]
    end
    if (reset) begin // @[datapath.scala 164:34]
      de_pipe_reg_csr_write_op <= 3'h0; // @[datapath.scala 164:34]
    end else if (flush_de & _T) begin // @[datapath.scala 410:33]
      de_pipe_reg_csr_write_op <= 3'h0; // @[datapath.scala 416:42]
    end else if (_T & ~flush_de) begin // @[datapath.scala 438:40]
      if (_csr_op_T_2) begin // @[datapath.scala 386:25]
        de_pipe_reg_csr_write_op <= 3'h2;
      end else begin
        de_pipe_reg_csr_write_op <= _csr_op_T_16;
      end
    end
    if (reset) begin // @[datapath.scala 164:34]
      de_pipe_reg_csr_write_addr <= 12'h0; // @[datapath.scala 164:34]
    end else if (flush_de & _T) begin // @[datapath.scala 410:33]
      de_pipe_reg_csr_write_addr <= 12'h0; // @[datapath.scala 418:44]
    end else if (_T & ~flush_de) begin // @[datapath.scala 438:40]
      de_pipe_reg_csr_write_addr <= fd_pipe_reg_inst[31:20]; // @[datapath.scala 446:44]
    end
    if (reset) begin // @[datapath.scala 164:34]
      de_pipe_reg_dest <= 5'h0; // @[datapath.scala 164:34]
    end else if (flush_de & _T) begin // @[datapath.scala 410:33]
      de_pipe_reg_dest <= 5'h0; // @[datapath.scala 426:34]
    end else if (_T & ~flush_de) begin // @[datapath.scala 438:40]
      de_pipe_reg_dest <= dest_addr; // @[datapath.scala 460:34]
    end
    if (reset) begin // @[datapath.scala 164:34]
      de_pipe_reg_A_sel <= 1'h0; // @[datapath.scala 164:34]
    end else if (flush_de & _T) begin // @[datapath.scala 410:33]
      de_pipe_reg_A_sel <= 1'h0; // @[datapath.scala 413:35]
    end else if (_T & ~flush_de) begin // @[datapath.scala 438:40]
      de_pipe_reg_A_sel <= io_ctrl_A_sel; // @[datapath.scala 441:35]
    end
    if (reset) begin // @[datapath.scala 164:34]
      de_pipe_reg_B_sel <= 1'h0; // @[datapath.scala 164:34]
    end else if (flush_de & _T) begin // @[datapath.scala 410:33]
      de_pipe_reg_B_sel <= 1'h0; // @[datapath.scala 414:35]
    end else if (_T & ~flush_de) begin // @[datapath.scala 438:40]
      de_pipe_reg_B_sel <= io_ctrl_B_sel; // @[datapath.scala 442:35]
    end
    if (reset) begin // @[datapath.scala 164:34]
      de_pipe_reg_pc_sel <= 2'h0; // @[datapath.scala 164:34]
    end else if (flush_de & _T) begin // @[datapath.scala 410:33]
      de_pipe_reg_pc_sel <= 2'h0; // @[datapath.scala 427:36]
    end else if (_T & ~flush_de) begin // @[datapath.scala 438:40]
      de_pipe_reg_pc_sel <= io_ctrl_pc_sel; // @[datapath.scala 461:36]
    end
    if (reset) begin // @[datapath.scala 164:34]
      de_pipe_reg_br_type <= 3'h0; // @[datapath.scala 164:34]
    end else if (flush_de & _T) begin // @[datapath.scala 410:33]
      de_pipe_reg_br_type <= 3'h0; // @[datapath.scala 428:37]
    end else if (_T & ~flush_de) begin // @[datapath.scala 438:40]
      de_pipe_reg_br_type <= io_ctrl_br_type; // @[datapath.scala 462:37]
    end
    if (reset) begin // @[datapath.scala 164:34]
      de_pipe_reg_wd_type <= 2'h0; // @[datapath.scala 164:34]
    end else if (flush_de & _T) begin // @[datapath.scala 410:33]
      de_pipe_reg_wd_type <= 2'h0; // @[datapath.scala 431:37]
    end else if (_T & ~flush_de) begin // @[datapath.scala 438:40]
      de_pipe_reg_wd_type <= io_ctrl_wd_type; // @[datapath.scala 465:37]
    end
    if (reset) begin // @[datapath.scala 164:34]
      de_pipe_reg_st_type <= 3'h0; // @[datapath.scala 164:34]
    end else if (flush_de & _T) begin // @[datapath.scala 410:33]
      de_pipe_reg_st_type <= 3'h0; // @[datapath.scala 429:37]
    end else if (_T & ~flush_de) begin // @[datapath.scala 438:40]
      de_pipe_reg_st_type <= io_ctrl_st_type; // @[datapath.scala 463:37]
    end
    if (reset) begin // @[datapath.scala 164:34]
      de_pipe_reg_ld_type <= 3'h0; // @[datapath.scala 164:34]
    end else if (flush_de & _T) begin // @[datapath.scala 410:33]
      de_pipe_reg_ld_type <= 3'h0; // @[datapath.scala 430:37]
    end else if (_T & ~flush_de) begin // @[datapath.scala 438:40]
      de_pipe_reg_ld_type <= io_ctrl_ld_type; // @[datapath.scala 464:37]
    end
    if (reset) begin // @[datapath.scala 164:34]
      de_pipe_reg_wb_sel <= 2'h0; // @[datapath.scala 164:34]
    end else if (flush_de & _T) begin // @[datapath.scala 410:33]
      de_pipe_reg_wb_sel <= 2'h0; // @[datapath.scala 432:36]
    end else if (_T & ~flush_de) begin // @[datapath.scala 438:40]
      de_pipe_reg_wb_sel <= io_ctrl_wb_sel; // @[datapath.scala 466:36]
    end
    if (reset) begin // @[datapath.scala 164:34]
      de_pipe_reg_wb_en <= 1'h0; // @[datapath.scala 164:34]
    end else if (flush_de & _T) begin // @[datapath.scala 410:33]
      de_pipe_reg_wb_en <= 1'h0; // @[datapath.scala 433:35]
    end else if (_T & ~flush_de) begin // @[datapath.scala 438:40]
      de_pipe_reg_wb_en <= io_ctrl_wb_en; // @[datapath.scala 467:35]
    end
    if (reset) begin // @[datapath.scala 164:34]
      de_pipe_reg_csr_is_illegal <= 1'h0; // @[datapath.scala 164:34]
    end else if (flush_de & _T) begin // @[datapath.scala 410:33]
      de_pipe_reg_csr_is_illegal <= 1'h0; // @[datapath.scala 435:44]
    end else if (_T & ~flush_de) begin // @[datapath.scala 438:40]
      de_pipe_reg_csr_is_illegal <= io_ctrl_is_illegal | mode_illegal | csr_io_accessType_illegal | _GEN_162 >
        csr_io_mode; // @[datapath.scala 469:44]
    end
    if (reset) begin // @[datapath.scala 164:34]
      de_pipe_reg_csr_inst_misalign <= 1'h0; // @[datapath.scala 164:34]
    end else if (flush_de & _T) begin // @[datapath.scala 410:33]
      de_pipe_reg_csr_inst_misalign <= 1'h0; // @[datapath.scala 436:47]
    end else if (_T & ~flush_de) begin // @[datapath.scala 438:40]
      de_pipe_reg_csr_inst_misalign <= _de_pipe_reg_csr_inst_misalign_T != 64'h0 & fd_pipe_reg_enable; // @[datapath.scala 470:47]
    end
    if (reset) begin // @[datapath.scala 164:34]
      de_pipe_reg_enable <= 1'h0; // @[datapath.scala 164:34]
    end else if (flush_de & _T) begin // @[datapath.scala 410:33]
      de_pipe_reg_enable <= 1'h0; // @[datapath.scala 437:36]
    end else if (_T & ~flush_de) begin // @[datapath.scala 438:40]
      de_pipe_reg_enable <= fd_pipe_reg_enable; // @[datapath.scala 471:36]
    end
    if (reset) begin // @[datapath.scala 196:34]
      em_pipe_reg_alu_out <= 64'h0; // @[datapath.scala 196:34]
    end else if (flush_em & _T) begin // @[datapath.scala 628:33]
      em_pipe_reg_alu_out <= 64'h0; // @[datapath.scala 631:37]
    end else if (_T & ~flush_em) begin // @[datapath.scala 651:40]
      if (_div_stall_T_3 | _div_stall_T_7) begin // @[datapath.scala 574:34]
        em_pipe_reg_alu_out <= div_result;
      end else begin
        em_pipe_reg_alu_out <= _computation_result_T_8;
      end
    end
    if (reset) begin // @[datapath.scala 196:34]
      em_pipe_reg_csr_read_data <= 64'h0; // @[datapath.scala 196:34]
    end else if (flush_em & _T) begin // @[datapath.scala 628:33]
      em_pipe_reg_csr_read_data <= 64'h0; // @[datapath.scala 633:43]
    end else if (_T & ~flush_em) begin // @[datapath.scala 651:40]
      em_pipe_reg_csr_read_data <= de_pipe_reg_csr_read_data; // @[datapath.scala 658:43]
    end
    if (reset) begin // @[datapath.scala 196:34]
      em_pipe_reg_csr_write_op <= 3'h0; // @[datapath.scala 196:34]
    end else if (flush_em & _T) begin // @[datapath.scala 628:33]
      em_pipe_reg_csr_write_op <= 3'h0; // @[datapath.scala 634:42]
    end else if (_T & ~flush_em) begin // @[datapath.scala 651:40]
      em_pipe_reg_csr_write_op <= de_pipe_reg_csr_write_op; // @[datapath.scala 659:42]
    end
    if (reset) begin // @[datapath.scala 196:34]
      em_pipe_reg_csr_write_addr <= 12'h0; // @[datapath.scala 196:34]
    end else if (flush_em & _T) begin // @[datapath.scala 628:33]
      em_pipe_reg_csr_write_addr <= 12'h0; // @[datapath.scala 635:44]
    end else if (_T & ~flush_em) begin // @[datapath.scala 651:40]
      em_pipe_reg_csr_write_addr <= de_pipe_reg_csr_write_addr; // @[datapath.scala 660:44]
    end
    if (reset) begin // @[datapath.scala 196:34]
      em_pipe_reg_csr_write_data <= 64'h0; // @[datapath.scala 196:34]
    end else if (flush_em & _T) begin // @[datapath.scala 628:33]
      em_pipe_reg_csr_write_data <= 64'h0; // @[datapath.scala 636:44]
    end else if (_T & ~flush_em) begin // @[datapath.scala 651:40]
      if (de_pipe_reg_imm_sel == 3'h6) begin // @[datapath.scala 661:50]
        em_pipe_reg_csr_write_data <= de_pipe_reg_imm;
      end else begin
        em_pipe_reg_csr_write_data <= src1_data;
      end
    end
    if (reset) begin // @[datapath.scala 196:34]
      em_pipe_reg_jump_taken <= 1'h0; // @[datapath.scala 196:34]
    end else if (flush_em & _T) begin // @[datapath.scala 628:33]
      em_pipe_reg_jump_taken <= 1'h0; // @[datapath.scala 637:40]
    end else if (_T & ~flush_em) begin // @[datapath.scala 651:40]
      em_pipe_reg_jump_taken <= brCond_taken | _next_pc_T_8; // @[datapath.scala 662:40]
    end
    if (reset) begin // @[datapath.scala 196:34]
      em_pipe_reg_st_data <= 64'h0; // @[datapath.scala 196:34]
    end else if (flush_em & _T) begin // @[datapath.scala 628:33]
      em_pipe_reg_st_data <= 64'h0; // @[datapath.scala 638:37]
    end else if (_T & ~flush_em) begin // @[datapath.scala 651:40]
      if (_T_22 & _src_unready_T_1 & de_pipe_reg_src2_addr != 64'h0) begin // @[datapath.scala 596:137]
        em_pipe_reg_st_data <= _GEN_81;
      end else begin
        em_pipe_reg_st_data <= _GEN_83;
      end
    end
    if (reset) begin // @[datapath.scala 196:34]
      em_pipe_reg_st_type <= 3'h0; // @[datapath.scala 196:34]
    end else if (flush_em & _T) begin // @[datapath.scala 628:33]
      em_pipe_reg_st_type <= 3'h0; // @[datapath.scala 639:37]
    end else if (_T & ~flush_em) begin // @[datapath.scala 651:40]
      em_pipe_reg_st_type <= de_pipe_reg_st_type; // @[datapath.scala 664:37]
    end
    if (reset) begin // @[datapath.scala 196:34]
      em_pipe_reg_ld_type <= 3'h0; // @[datapath.scala 196:34]
    end else if (flush_em & _T) begin // @[datapath.scala 628:33]
      em_pipe_reg_ld_type <= 3'h0; // @[datapath.scala 640:37]
    end else if (_T & ~flush_em) begin // @[datapath.scala 651:40]
      em_pipe_reg_ld_type <= de_pipe_reg_ld_type; // @[datapath.scala 665:37]
    end
    if (reset) begin // @[datapath.scala 196:34]
      em_pipe_reg_wb_sel <= 2'h0; // @[datapath.scala 196:34]
    end else if (flush_em & _T) begin // @[datapath.scala 628:33]
      em_pipe_reg_wb_sel <= 2'h0; // @[datapath.scala 641:36]
    end else if (_T & ~flush_em) begin // @[datapath.scala 651:40]
      em_pipe_reg_wb_sel <= de_pipe_reg_wb_sel; // @[datapath.scala 666:36]
    end
    if (reset) begin // @[datapath.scala 196:34]
      em_pipe_reg_wb_en <= 1'h0; // @[datapath.scala 196:34]
    end else if (flush_em & _T) begin // @[datapath.scala 628:33]
      em_pipe_reg_wb_en <= 1'h0; // @[datapath.scala 642:35]
    end else if (_T & ~flush_em) begin // @[datapath.scala 651:40]
      em_pipe_reg_wb_en <= de_pipe_reg_wb_en; // @[datapath.scala 667:35]
    end
    if (reset) begin // @[datapath.scala 196:34]
      em_pipe_reg_dest <= 5'h0; // @[datapath.scala 196:34]
    end else if (flush_em & _T) begin // @[datapath.scala 628:33]
      em_pipe_reg_dest <= 5'h0; // @[datapath.scala 630:34]
    end else if (_T & ~flush_em) begin // @[datapath.scala 651:40]
      em_pipe_reg_dest <= de_pipe_reg_dest; // @[datapath.scala 653:34]
    end
    if (reset) begin // @[datapath.scala 196:34]
      em_pipe_reg_pc <= 64'h80000000; // @[datapath.scala 196:34]
    end else if (flush_em & _T) begin // @[datapath.scala 628:33]
      em_pipe_reg_pc <= 64'h80000000; // @[datapath.scala 643:32]
    end else if (_T & ~flush_em) begin // @[datapath.scala 651:40]
      em_pipe_reg_pc <= de_pipe_reg_pc; // @[datapath.scala 668:32]
    end
    if (reset) begin // @[datapath.scala 196:34]
      em_pipe_reg_inst <= 32'h13; // @[datapath.scala 196:34]
    end else if (flush_em & _T) begin // @[datapath.scala 628:33]
      em_pipe_reg_inst <= 32'h13; // @[datapath.scala 629:34]
    end else if (_T & ~flush_em) begin // @[datapath.scala 651:40]
      em_pipe_reg_inst <= de_pipe_reg_inst; // @[datapath.scala 652:34]
    end
    if (reset) begin // @[datapath.scala 196:34]
      em_pipe_reg_is_clint <= 1'h0; // @[datapath.scala 196:34]
    end else if (flush_em & _T) begin // @[datapath.scala 628:33]
      em_pipe_reg_is_clint <= 1'h0; // @[datapath.scala 644:38]
    end else if (_T & ~flush_em) begin // @[datapath.scala 651:40]
      em_pipe_reg_is_clint <= is_clint; // @[datapath.scala 669:38]
    end
    if (reset) begin // @[datapath.scala 196:34]
      em_pipe_reg_csr_is_illegal <= 1'h0; // @[datapath.scala 196:34]
    end else if (flush_em & _T) begin // @[datapath.scala 628:33]
      em_pipe_reg_csr_is_illegal <= 1'h0; // @[datapath.scala 646:44]
    end else if (_T & ~flush_em) begin // @[datapath.scala 651:40]
      em_pipe_reg_csr_is_illegal <= de_pipe_reg_csr_is_illegal; // @[datapath.scala 671:44]
    end
    if (reset) begin // @[datapath.scala 196:34]
      em_pipe_reg_csr_inst_misalign <= 1'h0; // @[datapath.scala 196:34]
    end else if (flush_em & _T) begin // @[datapath.scala 628:33]
      em_pipe_reg_csr_inst_misalign <= 1'h0; // @[datapath.scala 647:47]
    end else if (_T & ~flush_em) begin // @[datapath.scala 651:40]
      em_pipe_reg_csr_inst_misalign <= de_pipe_reg_csr_inst_misalign; // @[datapath.scala 672:47]
    end
    if (reset) begin // @[datapath.scala 196:34]
      em_pipe_reg_csr_load_misalign <= 1'h0; // @[datapath.scala 196:34]
    end else if (flush_em & _T) begin // @[datapath.scala 628:33]
      em_pipe_reg_csr_load_misalign <= 1'h0; // @[datapath.scala 649:47]
    end else if (_T & ~flush_em) begin // @[datapath.scala 651:40]
      em_pipe_reg_csr_load_misalign <= de_pipe_reg_ld_type != 3'h0 & _em_pipe_reg_csr_load_misalign_T_21; // @[datapath.scala 682:47]
    end
    if (reset) begin // @[datapath.scala 196:34]
      em_pipe_reg_csr_store_misalign <= 1'h0; // @[datapath.scala 196:34]
    end else if (flush_em & _T) begin // @[datapath.scala 628:33]
      em_pipe_reg_csr_store_misalign <= 1'h0; // @[datapath.scala 648:48]
    end else if (_T & ~flush_em) begin // @[datapath.scala 651:40]
      em_pipe_reg_csr_store_misalign <= de_pipe_reg_st_type != 3'h0 & _em_pipe_reg_csr_store_misalign_T_14; // @[datapath.scala 673:48]
    end
    if (reset) begin // @[datapath.scala 196:34]
      em_pipe_reg_enable <= 1'h0; // @[datapath.scala 196:34]
    end else if (flush_em & _T) begin // @[datapath.scala 628:33]
      em_pipe_reg_enable <= 1'h0; // @[datapath.scala 650:36]
    end else if (_T & ~flush_em) begin // @[datapath.scala 651:40]
      em_pipe_reg_enable <= de_pipe_reg_enable; // @[datapath.scala 691:36]
    end
    if (reset) begin // @[datapath.scala 223:34]
      mw_pipe_reg_load_data <= 64'h0; // @[datapath.scala 223:34]
    end else if (flush_mw & _T) begin // @[datapath.scala 766:33]
      mw_pipe_reg_load_data <= 64'h0; // @[datapath.scala 767:39]
    end else if (_T & ~flush_mw) begin // @[datapath.scala 779:40]
      if (_load_data_ext_hazard_T) begin // @[datapath.scala 741:32]
        mw_pipe_reg_load_data <= _load_data_ext_T_5;
      end else begin
        mw_pipe_reg_load_data <= _load_data_ext_T_34;
      end
    end
    if (flush_mw & _T) begin // @[datapath.scala 766:33]
      mw_pipe_reg_alu_out <= 64'h0; // @[datapath.scala 768:37]
    end else if (_T & ~flush_mw) begin // @[datapath.scala 779:40]
      mw_pipe_reg_alu_out <= em_pipe_reg_alu_out; // @[datapath.scala 781:37]
    end
    if (flush_mw & _T) begin // @[datapath.scala 766:33]
      mw_pipe_reg_dest <= 5'h0; // @[datapath.scala 769:34]
    end else if (_T & ~flush_mw) begin // @[datapath.scala 779:40]
      mw_pipe_reg_dest <= em_pipe_reg_dest; // @[datapath.scala 782:34]
    end
    if (reset) begin // @[datapath.scala 223:34]
      mw_pipe_reg_csr_read_data <= 64'h0; // @[datapath.scala 223:34]
    end else if (flush_mw & _T) begin // @[datapath.scala 766:33]
      mw_pipe_reg_csr_read_data <= 64'h0; // @[datapath.scala 774:43]
    end else if (_T & ~flush_mw) begin // @[datapath.scala 779:40]
      mw_pipe_reg_csr_read_data <= em_pipe_reg_csr_read_data; // @[datapath.scala 787:43]
    end
    if (reset) begin // @[datapath.scala 223:34]
      mw_pipe_reg_wb_sel <= 2'h0; // @[datapath.scala 223:34]
    end else if (flush_mw & _T) begin // @[datapath.scala 766:33]
      mw_pipe_reg_wb_sel <= 2'h0; // @[datapath.scala 770:36]
    end else if (_T & ~flush_mw) begin // @[datapath.scala 779:40]
      mw_pipe_reg_wb_sel <= em_pipe_reg_wb_sel; // @[datapath.scala 783:36]
    end
    if (reset) begin // @[datapath.scala 223:34]
      mw_pipe_reg_wb_en <= 1'h0; // @[datapath.scala 223:34]
    end else if (flush_mw & _T) begin // @[datapath.scala 766:33]
      mw_pipe_reg_wb_en <= 1'h0; // @[datapath.scala 771:35]
    end else if (_T & ~flush_mw) begin // @[datapath.scala 779:40]
      mw_pipe_reg_wb_en <= em_pipe_reg_wb_en; // @[datapath.scala 784:35]
    end
    if (reset) begin // @[datapath.scala 223:34]
      mw_pipe_reg_pc <= 64'h80000000; // @[datapath.scala 223:34]
    end else if (flush_mw & _T) begin // @[datapath.scala 766:33]
      mw_pipe_reg_pc <= 64'h80000000; // @[datapath.scala 772:32]
    end else if (_T & ~flush_mw) begin // @[datapath.scala 779:40]
      mw_pipe_reg_pc <= em_pipe_reg_pc; // @[datapath.scala 785:32]
    end
    if (reset) begin // @[datapath.scala 223:34]
      mw_pipe_reg_inst <= 32'h13; // @[datapath.scala 223:34]
    end else if (flush_mw & _T) begin // @[datapath.scala 766:33]
      mw_pipe_reg_inst <= 32'h13; // @[datapath.scala 773:34]
    end else if (_T & ~flush_mw) begin // @[datapath.scala 779:40]
      mw_pipe_reg_inst <= em_pipe_reg_inst; // @[datapath.scala 786:34]
    end
    if (reset) begin // @[datapath.scala 223:34]
      mw_pipe_reg_csr_write_op <= 3'h0; // @[datapath.scala 223:34]
    end else if (flush_mw & _T) begin // @[datapath.scala 766:33]
      mw_pipe_reg_csr_write_op <= 3'h0; // @[datapath.scala 775:42]
    end else if (_T & ~flush_mw) begin // @[datapath.scala 779:40]
      mw_pipe_reg_csr_write_op <= em_pipe_reg_csr_write_op; // @[datapath.scala 788:42]
    end
    if (reset) begin // @[datapath.scala 223:34]
      mw_pipe_reg_csr_write_addr <= 12'h0; // @[datapath.scala 223:34]
    end else if (flush_mw & _T) begin // @[datapath.scala 766:33]
      mw_pipe_reg_csr_write_addr <= 12'h0; // @[datapath.scala 776:44]
    end else if (_T & ~flush_mw) begin // @[datapath.scala 779:40]
      mw_pipe_reg_csr_write_addr <= em_pipe_reg_csr_write_addr; // @[datapath.scala 789:44]
    end
    if (reset) begin // @[datapath.scala 223:34]
      mw_pipe_reg_csr_write_data <= 64'h0; // @[datapath.scala 223:34]
    end else if (flush_mw & _T) begin // @[datapath.scala 766:33]
      mw_pipe_reg_csr_write_data <= 64'h0; // @[datapath.scala 777:44]
    end else if (_T & ~flush_mw) begin // @[datapath.scala 779:40]
      mw_pipe_reg_csr_write_data <= em_pipe_reg_csr_write_data; // @[datapath.scala 790:44]
    end
    if (reset) begin // @[datapath.scala 223:34]
      mw_pipe_reg_enable <= 1'h0; // @[datapath.scala 223:34]
    end else if (flush_mw & _T) begin // @[datapath.scala 766:33]
      mw_pipe_reg_enable <= 1'h0; // @[datapath.scala 778:36]
    end else if (_T & ~flush_mw) begin // @[datapath.scala 779:40]
      mw_pipe_reg_enable <= em_pipe_reg_enable; // @[datapath.scala 791:36]
    end
    started <= reset | _GEN_0; // @[datapath.scala 249:{30,30}]
    if (reset) begin // @[datapath.scala 250:39]
      icache_flush_tag <= 1'h0; // @[datapath.scala 250:39]
    end else if (_T & flush_em) begin // @[datapath.scala 479:33]
      icache_flush_tag <= 1'h0; // @[datapath.scala 480:34]
    end else begin
      icache_flush_tag <= _GEN_63;
    end
    if (reset) begin // @[datapath.scala 251:39]
      dcache_flush_tag <= 1'h0; // @[datapath.scala 251:39]
    end else if (_T & flush_em) begin // @[datapath.scala 479:33]
      dcache_flush_tag <= 1'h0; // @[datapath.scala 481:34]
    end else begin
      dcache_flush_tag <= _GEN_64;
    end
    if (reset) begin // @[datapath.scala 254:37]
      data_cache_tag <= 1'h0; // @[datapath.scala 254:37]
    end else if (_T) begin // @[datapath.scala 696:21]
      data_cache_tag <= 1'h0; // @[datapath.scala 697:32]
    end else begin
      data_cache_tag <= _GEN_133;
    end
    if (reset) begin // @[datapath.scala 255:47]
      data_cache_response_data <= 64'h0; // @[datapath.scala 255:47]
    end else if (!(_T)) begin // @[datapath.scala 696:21]
      if (io_dcache_cpu_request_valid & io_dcache_cpu_response_ready) begin // @[datapath.scala 698:80]
        data_cache_response_data <= io_dcache_cpu_response_data; // @[datapath.scala 700:42]
      end
    end
    if (reset) begin // @[datapath.scala 517:40]
      mul_result_enable <= 1'h0; // @[datapath.scala 517:40]
    end else if (flush_em & _T) begin // @[datapath.scala 628:33]
      mul_result_enable <= _GEN_69;
    end else if (_T & ~flush_em) begin // @[datapath.scala 651:40]
      mul_result_enable <= 1'h0; // @[datapath.scala 655:35]
    end else begin
      mul_result_enable <= _GEN_69;
    end
    if (reset) begin // @[datapath.scala 519:40]
      div_result_enable <= 1'h0; // @[datapath.scala 519:40]
    end else if (flush_em & _T) begin // @[datapath.scala 628:33]
      div_result_enable <= _GEN_75;
    end else if (_T & ~flush_em) begin // @[datapath.scala 651:40]
      div_result_enable <= 1'h0; // @[datapath.scala 656:35]
    end else begin
      div_result_enable <= _GEN_75;
    end
    if (reset) begin // @[datapath.scala 322:25]
      pc <= _pc_T_1; // @[datapath.scala 322:25]
    end else begin
      pc <= next_pc; // @[datapath.scala 343:12]
    end
    if (reset) begin // @[datapath.scala 516:33]
      mul_result <= 64'h0; // @[datapath.scala 516:33]
    end else if (!(flush_de)) begin // @[datapath.scala 553:23]
      if (multiplier_io_out_valid) begin // @[datapath.scala 555:44]
        mul_result <= multiplier_io_result; // @[datapath.scala 556:28]
      end
    end
    if (reset) begin // @[datapath.scala 518:33]
      div_result <= 64'h0; // @[datapath.scala 518:33]
    end else if (!(flush_de)) begin // @[datapath.scala 560:23]
      if (divider_io_out_valid) begin // @[datapath.scala 562:41]
        if (_divider_io_div_valid_T_2) begin // @[datapath.scala 564:96]
          div_result <= divider_io_quotient; // @[datapath.scala 565:36]
        end else begin
          div_result <= _GEN_71;
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
  fd_pipe_reg_inst = _RAND_0[31:0];
  _RAND_1 = {2{`RANDOM}};
  fd_pipe_reg_pc = _RAND_1[63:0];
  _RAND_2 = {1{`RANDOM}};
  fd_pipe_reg_enable = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  de_pipe_reg_alu_op = _RAND_3[4:0];
  _RAND_4 = {2{`RANDOM}};
  de_pipe_reg_pc = _RAND_4[63:0];
  _RAND_5 = {1{`RANDOM}};
  de_pipe_reg_inst = _RAND_5[31:0];
  _RAND_6 = {2{`RANDOM}};
  de_pipe_reg_imm = _RAND_6[63:0];
  _RAND_7 = {1{`RANDOM}};
  de_pipe_reg_imm_sel = _RAND_7[2:0];
  _RAND_8 = {2{`RANDOM}};
  de_pipe_reg_rs1 = _RAND_8[63:0];
  _RAND_9 = {2{`RANDOM}};
  de_pipe_reg_src1_addr = _RAND_9[63:0];
  _RAND_10 = {2{`RANDOM}};
  de_pipe_reg_rs2 = _RAND_10[63:0];
  _RAND_11 = {2{`RANDOM}};
  de_pipe_reg_src2_addr = _RAND_11[63:0];
  _RAND_12 = {2{`RANDOM}};
  de_pipe_reg_csr_read_data = _RAND_12[63:0];
  _RAND_13 = {1{`RANDOM}};
  de_pipe_reg_csr_write_op = _RAND_13[2:0];
  _RAND_14 = {1{`RANDOM}};
  de_pipe_reg_csr_write_addr = _RAND_14[11:0];
  _RAND_15 = {1{`RANDOM}};
  de_pipe_reg_dest = _RAND_15[4:0];
  _RAND_16 = {1{`RANDOM}};
  de_pipe_reg_A_sel = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  de_pipe_reg_B_sel = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  de_pipe_reg_pc_sel = _RAND_18[1:0];
  _RAND_19 = {1{`RANDOM}};
  de_pipe_reg_br_type = _RAND_19[2:0];
  _RAND_20 = {1{`RANDOM}};
  de_pipe_reg_wd_type = _RAND_20[1:0];
  _RAND_21 = {1{`RANDOM}};
  de_pipe_reg_st_type = _RAND_21[2:0];
  _RAND_22 = {1{`RANDOM}};
  de_pipe_reg_ld_type = _RAND_22[2:0];
  _RAND_23 = {1{`RANDOM}};
  de_pipe_reg_wb_sel = _RAND_23[1:0];
  _RAND_24 = {1{`RANDOM}};
  de_pipe_reg_wb_en = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  de_pipe_reg_csr_is_illegal = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  de_pipe_reg_csr_inst_misalign = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  de_pipe_reg_enable = _RAND_27[0:0];
  _RAND_28 = {2{`RANDOM}};
  em_pipe_reg_alu_out = _RAND_28[63:0];
  _RAND_29 = {2{`RANDOM}};
  em_pipe_reg_csr_read_data = _RAND_29[63:0];
  _RAND_30 = {1{`RANDOM}};
  em_pipe_reg_csr_write_op = _RAND_30[2:0];
  _RAND_31 = {1{`RANDOM}};
  em_pipe_reg_csr_write_addr = _RAND_31[11:0];
  _RAND_32 = {2{`RANDOM}};
  em_pipe_reg_csr_write_data = _RAND_32[63:0];
  _RAND_33 = {1{`RANDOM}};
  em_pipe_reg_jump_taken = _RAND_33[0:0];
  _RAND_34 = {2{`RANDOM}};
  em_pipe_reg_st_data = _RAND_34[63:0];
  _RAND_35 = {1{`RANDOM}};
  em_pipe_reg_st_type = _RAND_35[2:0];
  _RAND_36 = {1{`RANDOM}};
  em_pipe_reg_ld_type = _RAND_36[2:0];
  _RAND_37 = {1{`RANDOM}};
  em_pipe_reg_wb_sel = _RAND_37[1:0];
  _RAND_38 = {1{`RANDOM}};
  em_pipe_reg_wb_en = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  em_pipe_reg_dest = _RAND_39[4:0];
  _RAND_40 = {2{`RANDOM}};
  em_pipe_reg_pc = _RAND_40[63:0];
  _RAND_41 = {1{`RANDOM}};
  em_pipe_reg_inst = _RAND_41[31:0];
  _RAND_42 = {1{`RANDOM}};
  em_pipe_reg_is_clint = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  em_pipe_reg_csr_is_illegal = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  em_pipe_reg_csr_inst_misalign = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  em_pipe_reg_csr_load_misalign = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  em_pipe_reg_csr_store_misalign = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  em_pipe_reg_enable = _RAND_47[0:0];
  _RAND_48 = {2{`RANDOM}};
  mw_pipe_reg_load_data = _RAND_48[63:0];
  _RAND_49 = {2{`RANDOM}};
  mw_pipe_reg_alu_out = _RAND_49[63:0];
  _RAND_50 = {1{`RANDOM}};
  mw_pipe_reg_dest = _RAND_50[4:0];
  _RAND_51 = {2{`RANDOM}};
  mw_pipe_reg_csr_read_data = _RAND_51[63:0];
  _RAND_52 = {1{`RANDOM}};
  mw_pipe_reg_wb_sel = _RAND_52[1:0];
  _RAND_53 = {1{`RANDOM}};
  mw_pipe_reg_wb_en = _RAND_53[0:0];
  _RAND_54 = {2{`RANDOM}};
  mw_pipe_reg_pc = _RAND_54[63:0];
  _RAND_55 = {1{`RANDOM}};
  mw_pipe_reg_inst = _RAND_55[31:0];
  _RAND_56 = {1{`RANDOM}};
  mw_pipe_reg_csr_write_op = _RAND_56[2:0];
  _RAND_57 = {1{`RANDOM}};
  mw_pipe_reg_csr_write_addr = _RAND_57[11:0];
  _RAND_58 = {2{`RANDOM}};
  mw_pipe_reg_csr_write_data = _RAND_58[63:0];
  _RAND_59 = {1{`RANDOM}};
  mw_pipe_reg_enable = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  started = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  icache_flush_tag = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  dcache_flush_tag = _RAND_62[0:0];
  _RAND_63 = {1{`RANDOM}};
  data_cache_tag = _RAND_63[0:0];
  _RAND_64 = {2{`RANDOM}};
  data_cache_response_data = _RAND_64[63:0];
  _RAND_65 = {1{`RANDOM}};
  mul_result_enable = _RAND_65[0:0];
  _RAND_66 = {1{`RANDOM}};
  div_result_enable = _RAND_66[0:0];
  _RAND_67 = {2{`RANDOM}};
  pc = _RAND_67[63:0];
  _RAND_68 = {2{`RANDOM}};
  mul_result = _RAND_68[63:0];
  _RAND_69 = {2{`RANDOM}};
  div_result = _RAND_69[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_041812_Control(
  input  [31:0] io_inst,
  output [1:0]  io_pc_sel,
  output        io_A_sel,
  output        io_B_sel,
  output [1:0]  io_wd_type,
  output [2:0]  io_imm_sel,
  output [2:0]  io_br_type,
  output [2:0]  io_st_type,
  output [2:0]  io_ld_type,
  output [1:0]  io_wb_sel,
  output        io_wb_en,
  output [4:0]  io_alu_op,
  output        io_prv,
  output [2:0]  io_csr_cmd,
  output        io_is_illegal
);
  wire [31:0] _ctrlSignals_T = io_inst & 32'h7f; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_1 = 32'h37 == _ctrlSignals_T; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_3 = 32'h17 == _ctrlSignals_T; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_5 = 32'h6f == _ctrlSignals_T; // @[Lookup.scala 31:38]
  wire [31:0] _ctrlSignals_T_6 = io_inst & 32'h707f; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_7 = 32'h67 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_9 = 32'h63 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_11 = 32'h1063 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_13 = 32'h4063 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_15 = 32'h5063 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_17 = 32'h6063 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_19 = 32'h7063 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_21 = 32'h3 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_23 = 32'h1003 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_25 = 32'h2003 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_27 = 32'h4003 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_29 = 32'h5003 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_31 = 32'h6003 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_33 = 32'h3003 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_35 = 32'h23 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_37 = 32'h1023 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_39 = 32'h2023 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_41 = 32'h3023 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_43 = 32'h13 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_45 = 32'h1b == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_47 = 32'h2013 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_49 = 32'h3013 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_51 = 32'h4013 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_53 = 32'h6013 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_55 = 32'h7013 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire [31:0] _ctrlSignals_T_56 = io_inst & 32'hfc00707f; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_57 = 32'h1013 == _ctrlSignals_T_56; // @[Lookup.scala 31:38]
  wire [31:0] _ctrlSignals_T_58 = io_inst & 32'hfe00707f; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_59 = 32'h101b == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_61 = 32'h5013 == _ctrlSignals_T_56; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_63 = 32'h501b == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_65 = 32'h40005013 == _ctrlSignals_T_56; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_67 = 32'h4000501b == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_69 = 32'h33 == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_71 = 32'h3b == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_73 = 32'h40000033 == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_75 = 32'h4000003b == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_77 = 32'h1033 == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_79 = 32'h103b == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_81 = 32'h2033 == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_83 = 32'h3033 == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_85 = 32'h4033 == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_87 = 32'h5033 == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_89 = 32'h503b == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_91 = 32'h40005033 == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_93 = 32'h4000503b == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_95 = 32'h6033 == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_97 = 32'h7033 == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_99 = 32'h2000033 == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_101 = 32'h200003b == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_103 = 32'h2001033 == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_105 = 32'h2003033 == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_107 = 32'h2002033 == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_109 = 32'h2004033 == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_111 = 32'h2005033 == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_113 = 32'h200403b == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_115 = 32'h200503b == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_117 = 32'h2006033 == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_119 = 32'h2007033 == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_121 = 32'h200603b == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_123 = 32'h200703b == _ctrlSignals_T_58; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_125 = 32'h1073 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_127 = 32'h2073 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_129 = 32'h3073 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_131 = 32'h5073 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_133 = 32'h6073 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_135 = 32'h7073 == _ctrlSignals_T_6; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_137 = 32'h30200073 == io_inst; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_139 = 32'h10200073 == io_inst; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_141 = 32'h73 == io_inst; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_143 = 32'h100073 == io_inst; // @[Lookup.scala 31:38]
  wire  _ctrlSignals_T_145 = 32'h100f == io_inst; // @[Lookup.scala 31:38]
  wire [1:0] _ctrlSignals_T_146 = _ctrlSignals_T_145 ? 2'h2 : 2'h0; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_147 = _ctrlSignals_T_143 ? 2'h0 : _ctrlSignals_T_146; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_148 = _ctrlSignals_T_141 ? 2'h0 : _ctrlSignals_T_147; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_149 = _ctrlSignals_T_139 ? 2'h3 : _ctrlSignals_T_148; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_150 = _ctrlSignals_T_137 ? 2'h3 : _ctrlSignals_T_149; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_151 = _ctrlSignals_T_135 ? 2'h2 : _ctrlSignals_T_150; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_152 = _ctrlSignals_T_133 ? 2'h2 : _ctrlSignals_T_151; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_153 = _ctrlSignals_T_131 ? 2'h2 : _ctrlSignals_T_152; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_154 = _ctrlSignals_T_129 ? 2'h2 : _ctrlSignals_T_153; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_155 = _ctrlSignals_T_127 ? 2'h2 : _ctrlSignals_T_154; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_156 = _ctrlSignals_T_125 ? 2'h2 : _ctrlSignals_T_155; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_157 = _ctrlSignals_T_123 ? 2'h0 : _ctrlSignals_T_156; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_158 = _ctrlSignals_T_121 ? 2'h0 : _ctrlSignals_T_157; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_159 = _ctrlSignals_T_119 ? 2'h0 : _ctrlSignals_T_158; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_160 = _ctrlSignals_T_117 ? 2'h0 : _ctrlSignals_T_159; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_161 = _ctrlSignals_T_115 ? 2'h0 : _ctrlSignals_T_160; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_162 = _ctrlSignals_T_113 ? 2'h0 : _ctrlSignals_T_161; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_163 = _ctrlSignals_T_111 ? 2'h0 : _ctrlSignals_T_162; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_164 = _ctrlSignals_T_109 ? 2'h0 : _ctrlSignals_T_163; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_165 = _ctrlSignals_T_107 ? 2'h0 : _ctrlSignals_T_164; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_166 = _ctrlSignals_T_105 ? 2'h0 : _ctrlSignals_T_165; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_167 = _ctrlSignals_T_103 ? 2'h0 : _ctrlSignals_T_166; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_168 = _ctrlSignals_T_101 ? 2'h0 : _ctrlSignals_T_167; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_169 = _ctrlSignals_T_99 ? 2'h0 : _ctrlSignals_T_168; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_170 = _ctrlSignals_T_97 ? 2'h0 : _ctrlSignals_T_169; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_171 = _ctrlSignals_T_95 ? 2'h0 : _ctrlSignals_T_170; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_172 = _ctrlSignals_T_93 ? 2'h0 : _ctrlSignals_T_171; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_173 = _ctrlSignals_T_91 ? 2'h0 : _ctrlSignals_T_172; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_174 = _ctrlSignals_T_89 ? 2'h0 : _ctrlSignals_T_173; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_175 = _ctrlSignals_T_87 ? 2'h0 : _ctrlSignals_T_174; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_176 = _ctrlSignals_T_85 ? 2'h0 : _ctrlSignals_T_175; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_177 = _ctrlSignals_T_83 ? 2'h0 : _ctrlSignals_T_176; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_178 = _ctrlSignals_T_81 ? 2'h0 : _ctrlSignals_T_177; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_179 = _ctrlSignals_T_79 ? 2'h0 : _ctrlSignals_T_178; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_180 = _ctrlSignals_T_77 ? 2'h0 : _ctrlSignals_T_179; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_181 = _ctrlSignals_T_75 ? 2'h0 : _ctrlSignals_T_180; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_182 = _ctrlSignals_T_73 ? 2'h0 : _ctrlSignals_T_181; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_183 = _ctrlSignals_T_71 ? 2'h0 : _ctrlSignals_T_182; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_184 = _ctrlSignals_T_69 ? 2'h0 : _ctrlSignals_T_183; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_185 = _ctrlSignals_T_67 ? 2'h0 : _ctrlSignals_T_184; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_186 = _ctrlSignals_T_65 ? 2'h0 : _ctrlSignals_T_185; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_187 = _ctrlSignals_T_63 ? 2'h0 : _ctrlSignals_T_186; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_188 = _ctrlSignals_T_61 ? 2'h0 : _ctrlSignals_T_187; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_189 = _ctrlSignals_T_59 ? 2'h0 : _ctrlSignals_T_188; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_190 = _ctrlSignals_T_57 ? 2'h0 : _ctrlSignals_T_189; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_191 = _ctrlSignals_T_55 ? 2'h0 : _ctrlSignals_T_190; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_192 = _ctrlSignals_T_53 ? 2'h0 : _ctrlSignals_T_191; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_193 = _ctrlSignals_T_51 ? 2'h0 : _ctrlSignals_T_192; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_194 = _ctrlSignals_T_49 ? 2'h0 : _ctrlSignals_T_193; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_195 = _ctrlSignals_T_47 ? 2'h0 : _ctrlSignals_T_194; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_196 = _ctrlSignals_T_45 ? 2'h0 : _ctrlSignals_T_195; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_197 = _ctrlSignals_T_43 ? 2'h0 : _ctrlSignals_T_196; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_198 = _ctrlSignals_T_41 ? 2'h0 : _ctrlSignals_T_197; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_199 = _ctrlSignals_T_39 ? 2'h0 : _ctrlSignals_T_198; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_200 = _ctrlSignals_T_37 ? 2'h0 : _ctrlSignals_T_199; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_201 = _ctrlSignals_T_35 ? 2'h0 : _ctrlSignals_T_200; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_202 = _ctrlSignals_T_33 ? 2'h0 : _ctrlSignals_T_201; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_203 = _ctrlSignals_T_31 ? 2'h0 : _ctrlSignals_T_202; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_204 = _ctrlSignals_T_29 ? 2'h0 : _ctrlSignals_T_203; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_205 = _ctrlSignals_T_27 ? 2'h0 : _ctrlSignals_T_204; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_206 = _ctrlSignals_T_25 ? 2'h0 : _ctrlSignals_T_205; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_207 = _ctrlSignals_T_23 ? 2'h0 : _ctrlSignals_T_206; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_208 = _ctrlSignals_T_21 ? 2'h0 : _ctrlSignals_T_207; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_209 = _ctrlSignals_T_19 ? 2'h0 : _ctrlSignals_T_208; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_210 = _ctrlSignals_T_17 ? 2'h0 : _ctrlSignals_T_209; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_211 = _ctrlSignals_T_15 ? 2'h0 : _ctrlSignals_T_210; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_212 = _ctrlSignals_T_13 ? 2'h0 : _ctrlSignals_T_211; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_213 = _ctrlSignals_T_11 ? 2'h0 : _ctrlSignals_T_212; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_214 = _ctrlSignals_T_9 ? 2'h0 : _ctrlSignals_T_213; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_215 = _ctrlSignals_T_7 ? 2'h1 : _ctrlSignals_T_214; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_216 = _ctrlSignals_T_5 ? 2'h1 : _ctrlSignals_T_215; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_217 = _ctrlSignals_T_3 ? 2'h0 : _ctrlSignals_T_216; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_256 = _ctrlSignals_T_69 | (_ctrlSignals_T_71 | (_ctrlSignals_T_73 | (_ctrlSignals_T_75 | (
    _ctrlSignals_T_77 | (_ctrlSignals_T_79 | (_ctrlSignals_T_81 | (_ctrlSignals_T_83 | (_ctrlSignals_T_85 | (
    _ctrlSignals_T_87 | (_ctrlSignals_T_89 | (_ctrlSignals_T_91 | (_ctrlSignals_T_93 | (_ctrlSignals_T_95 | (
    _ctrlSignals_T_97 | (_ctrlSignals_T_99 | (_ctrlSignals_T_101 | (_ctrlSignals_T_103 | (_ctrlSignals_T_105 | (
    _ctrlSignals_T_107 | (_ctrlSignals_T_109 | (_ctrlSignals_T_111 | (_ctrlSignals_T_113 | (_ctrlSignals_T_115 | (
    _ctrlSignals_T_117 | (_ctrlSignals_T_119 | (_ctrlSignals_T_121 | (_ctrlSignals_T_123 | (_ctrlSignals_T_125 | (
    _ctrlSignals_T_127 | _ctrlSignals_T_129))))))))))))))))))))))))))))); // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_281 = _ctrlSignals_T_19 ? 1'h0 : _ctrlSignals_T_21 | (_ctrlSignals_T_23 | (_ctrlSignals_T_25 | (
    _ctrlSignals_T_27 | (_ctrlSignals_T_29 | (_ctrlSignals_T_31 | (_ctrlSignals_T_33 | (_ctrlSignals_T_35 | (
    _ctrlSignals_T_37 | (_ctrlSignals_T_39 | (_ctrlSignals_T_41 | (_ctrlSignals_T_43 | (_ctrlSignals_T_45 | (
    _ctrlSignals_T_47 | (_ctrlSignals_T_49 | (_ctrlSignals_T_51 | (_ctrlSignals_T_53 | (_ctrlSignals_T_55 | (
    _ctrlSignals_T_57 | (_ctrlSignals_T_59 | (_ctrlSignals_T_61 | (_ctrlSignals_T_63 | (_ctrlSignals_T_65 | (
    _ctrlSignals_T_67 | _ctrlSignals_T_256))))))))))))))))))))))); // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_282 = _ctrlSignals_T_17 ? 1'h0 : _ctrlSignals_T_281; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_283 = _ctrlSignals_T_15 ? 1'h0 : _ctrlSignals_T_282; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_284 = _ctrlSignals_T_13 ? 1'h0 : _ctrlSignals_T_283; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_285 = _ctrlSignals_T_11 ? 1'h0 : _ctrlSignals_T_284; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_286 = _ctrlSignals_T_9 ? 1'h0 : _ctrlSignals_T_285; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_288 = _ctrlSignals_T_5 ? 1'h0 : _ctrlSignals_T_7 | _ctrlSignals_T_286; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_289 = _ctrlSignals_T_3 ? 1'h0 : _ctrlSignals_T_288; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_329 = _ctrlSignals_T_67 ? 1'h0 : _ctrlSignals_T_69 | (_ctrlSignals_T_71 | (_ctrlSignals_T_73 | (
    _ctrlSignals_T_75 | (_ctrlSignals_T_77 | (_ctrlSignals_T_79 | (_ctrlSignals_T_81 | (_ctrlSignals_T_83 | (
    _ctrlSignals_T_85 | (_ctrlSignals_T_87 | (_ctrlSignals_T_89 | (_ctrlSignals_T_91 | (_ctrlSignals_T_93 | (
    _ctrlSignals_T_95 | (_ctrlSignals_T_97 | (_ctrlSignals_T_99 | (_ctrlSignals_T_101 | (_ctrlSignals_T_103 | (
    _ctrlSignals_T_105 | (_ctrlSignals_T_107 | (_ctrlSignals_T_109 | (_ctrlSignals_T_111 | (_ctrlSignals_T_113 | (
    _ctrlSignals_T_115 | (_ctrlSignals_T_117 | (_ctrlSignals_T_119 | (_ctrlSignals_T_121 | _ctrlSignals_T_123)))))))))))
    ))))))))))))))); // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_330 = _ctrlSignals_T_65 ? 1'h0 : _ctrlSignals_T_329; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_331 = _ctrlSignals_T_63 ? 1'h0 : _ctrlSignals_T_330; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_332 = _ctrlSignals_T_61 ? 1'h0 : _ctrlSignals_T_331; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_333 = _ctrlSignals_T_59 ? 1'h0 : _ctrlSignals_T_332; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_334 = _ctrlSignals_T_57 ? 1'h0 : _ctrlSignals_T_333; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_335 = _ctrlSignals_T_55 ? 1'h0 : _ctrlSignals_T_334; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_336 = _ctrlSignals_T_53 ? 1'h0 : _ctrlSignals_T_335; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_337 = _ctrlSignals_T_51 ? 1'h0 : _ctrlSignals_T_336; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_338 = _ctrlSignals_T_49 ? 1'h0 : _ctrlSignals_T_337; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_339 = _ctrlSignals_T_47 ? 1'h0 : _ctrlSignals_T_338; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_340 = _ctrlSignals_T_45 ? 1'h0 : _ctrlSignals_T_339; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_341 = _ctrlSignals_T_43 ? 1'h0 : _ctrlSignals_T_340; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_342 = _ctrlSignals_T_41 ? 1'h0 : _ctrlSignals_T_341; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_343 = _ctrlSignals_T_39 ? 1'h0 : _ctrlSignals_T_342; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_344 = _ctrlSignals_T_37 ? 1'h0 : _ctrlSignals_T_343; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_345 = _ctrlSignals_T_35 ? 1'h0 : _ctrlSignals_T_344; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_346 = _ctrlSignals_T_33 ? 1'h0 : _ctrlSignals_T_345; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_347 = _ctrlSignals_T_31 ? 1'h0 : _ctrlSignals_T_346; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_348 = _ctrlSignals_T_29 ? 1'h0 : _ctrlSignals_T_347; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_349 = _ctrlSignals_T_27 ? 1'h0 : _ctrlSignals_T_348; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_350 = _ctrlSignals_T_25 ? 1'h0 : _ctrlSignals_T_349; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_351 = _ctrlSignals_T_23 ? 1'h0 : _ctrlSignals_T_350; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_352 = _ctrlSignals_T_21 ? 1'h0 : _ctrlSignals_T_351; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_353 = _ctrlSignals_T_19 ? 1'h0 : _ctrlSignals_T_352; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_354 = _ctrlSignals_T_17 ? 1'h0 : _ctrlSignals_T_353; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_355 = _ctrlSignals_T_15 ? 1'h0 : _ctrlSignals_T_354; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_356 = _ctrlSignals_T_13 ? 1'h0 : _ctrlSignals_T_355; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_357 = _ctrlSignals_T_11 ? 1'h0 : _ctrlSignals_T_356; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_358 = _ctrlSignals_T_9 ? 1'h0 : _ctrlSignals_T_357; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_359 = _ctrlSignals_T_7 ? 1'h0 : _ctrlSignals_T_358; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_360 = _ctrlSignals_T_5 ? 1'h0 : _ctrlSignals_T_359; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_361 = _ctrlSignals_T_3 ? 1'h0 : _ctrlSignals_T_360; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_373 = _ctrlSignals_T_123 ? 2'h1 : 2'h0; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_374 = _ctrlSignals_T_121 ? 2'h1 : _ctrlSignals_T_373; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_375 = _ctrlSignals_T_119 ? 2'h0 : _ctrlSignals_T_374; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_376 = _ctrlSignals_T_117 ? 2'h0 : _ctrlSignals_T_375; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_377 = _ctrlSignals_T_115 ? 2'h1 : _ctrlSignals_T_376; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_378 = _ctrlSignals_T_113 ? 2'h1 : _ctrlSignals_T_377; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_379 = _ctrlSignals_T_111 ? 2'h0 : _ctrlSignals_T_378; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_380 = _ctrlSignals_T_109 ? 2'h0 : _ctrlSignals_T_379; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_381 = _ctrlSignals_T_107 ? 2'h0 : _ctrlSignals_T_380; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_382 = _ctrlSignals_T_105 ? 2'h0 : _ctrlSignals_T_381; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_383 = _ctrlSignals_T_103 ? 2'h0 : _ctrlSignals_T_382; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_384 = _ctrlSignals_T_101 ? 2'h1 : _ctrlSignals_T_383; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_385 = _ctrlSignals_T_99 ? 2'h0 : _ctrlSignals_T_384; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_386 = _ctrlSignals_T_97 ? 2'h0 : _ctrlSignals_T_385; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_387 = _ctrlSignals_T_95 ? 2'h0 : _ctrlSignals_T_386; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_388 = _ctrlSignals_T_93 ? 2'h1 : _ctrlSignals_T_387; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_389 = _ctrlSignals_T_91 ? 2'h0 : _ctrlSignals_T_388; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_390 = _ctrlSignals_T_89 ? 2'h1 : _ctrlSignals_T_389; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_391 = _ctrlSignals_T_87 ? 2'h0 : _ctrlSignals_T_390; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_392 = _ctrlSignals_T_85 ? 2'h0 : _ctrlSignals_T_391; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_393 = _ctrlSignals_T_83 ? 2'h0 : _ctrlSignals_T_392; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_394 = _ctrlSignals_T_81 ? 2'h0 : _ctrlSignals_T_393; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_395 = _ctrlSignals_T_79 ? 2'h1 : _ctrlSignals_T_394; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_396 = _ctrlSignals_T_77 ? 2'h0 : _ctrlSignals_T_395; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_397 = _ctrlSignals_T_75 ? 2'h1 : _ctrlSignals_T_396; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_398 = _ctrlSignals_T_73 ? 2'h0 : _ctrlSignals_T_397; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_399 = _ctrlSignals_T_71 ? 2'h1 : _ctrlSignals_T_398; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_400 = _ctrlSignals_T_69 ? 2'h0 : _ctrlSignals_T_399; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_401 = _ctrlSignals_T_67 ? 2'h1 : _ctrlSignals_T_400; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_402 = _ctrlSignals_T_65 ? 2'h0 : _ctrlSignals_T_401; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_403 = _ctrlSignals_T_63 ? 2'h1 : _ctrlSignals_T_402; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_404 = _ctrlSignals_T_61 ? 2'h0 : _ctrlSignals_T_403; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_405 = _ctrlSignals_T_59 ? 2'h1 : _ctrlSignals_T_404; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_406 = _ctrlSignals_T_57 ? 2'h0 : _ctrlSignals_T_405; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_407 = _ctrlSignals_T_55 ? 2'h0 : _ctrlSignals_T_406; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_408 = _ctrlSignals_T_53 ? 2'h0 : _ctrlSignals_T_407; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_409 = _ctrlSignals_T_51 ? 2'h0 : _ctrlSignals_T_408; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_410 = _ctrlSignals_T_49 ? 2'h0 : _ctrlSignals_T_409; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_411 = _ctrlSignals_T_47 ? 2'h0 : _ctrlSignals_T_410; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_412 = _ctrlSignals_T_45 ? 2'h1 : _ctrlSignals_T_411; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_413 = _ctrlSignals_T_43 ? 2'h0 : _ctrlSignals_T_412; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_414 = _ctrlSignals_T_41 ? 2'h0 : _ctrlSignals_T_413; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_415 = _ctrlSignals_T_39 ? 2'h0 : _ctrlSignals_T_414; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_416 = _ctrlSignals_T_37 ? 2'h0 : _ctrlSignals_T_415; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_417 = _ctrlSignals_T_35 ? 2'h0 : _ctrlSignals_T_416; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_418 = _ctrlSignals_T_33 ? 2'h0 : _ctrlSignals_T_417; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_419 = _ctrlSignals_T_31 ? 2'h0 : _ctrlSignals_T_418; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_420 = _ctrlSignals_T_29 ? 2'h0 : _ctrlSignals_T_419; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_421 = _ctrlSignals_T_27 ? 2'h0 : _ctrlSignals_T_420; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_422 = _ctrlSignals_T_25 ? 2'h0 : _ctrlSignals_T_421; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_423 = _ctrlSignals_T_23 ? 2'h0 : _ctrlSignals_T_422; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_424 = _ctrlSignals_T_21 ? 2'h0 : _ctrlSignals_T_423; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_425 = _ctrlSignals_T_19 ? 2'h0 : _ctrlSignals_T_424; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_426 = _ctrlSignals_T_17 ? 2'h0 : _ctrlSignals_T_425; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_427 = _ctrlSignals_T_15 ? 2'h0 : _ctrlSignals_T_426; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_428 = _ctrlSignals_T_13 ? 2'h0 : _ctrlSignals_T_427; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_429 = _ctrlSignals_T_11 ? 2'h0 : _ctrlSignals_T_428; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_430 = _ctrlSignals_T_9 ? 2'h0 : _ctrlSignals_T_429; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_431 = _ctrlSignals_T_7 ? 2'h0 : _ctrlSignals_T_430; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_432 = _ctrlSignals_T_5 ? 2'h0 : _ctrlSignals_T_431; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_433 = _ctrlSignals_T_3 ? 2'h0 : _ctrlSignals_T_432; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_434 = _ctrlSignals_T_145 ? 3'h0 : 3'h3; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_435 = _ctrlSignals_T_143 ? 3'h0 : _ctrlSignals_T_434; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_436 = _ctrlSignals_T_141 ? 3'h0 : _ctrlSignals_T_435; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_437 = _ctrlSignals_T_139 ? 3'h0 : _ctrlSignals_T_436; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_438 = _ctrlSignals_T_137 ? 3'h0 : _ctrlSignals_T_437; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_439 = _ctrlSignals_T_135 ? 3'h6 : _ctrlSignals_T_438; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_440 = _ctrlSignals_T_133 ? 3'h6 : _ctrlSignals_T_439; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_441 = _ctrlSignals_T_131 ? 3'h6 : _ctrlSignals_T_440; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_442 = _ctrlSignals_T_129 ? 3'h0 : _ctrlSignals_T_441; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_443 = _ctrlSignals_T_127 ? 3'h0 : _ctrlSignals_T_442; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_444 = _ctrlSignals_T_125 ? 3'h0 : _ctrlSignals_T_443; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_445 = _ctrlSignals_T_123 ? 3'h0 : _ctrlSignals_T_444; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_446 = _ctrlSignals_T_121 ? 3'h0 : _ctrlSignals_T_445; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_447 = _ctrlSignals_T_119 ? 3'h0 : _ctrlSignals_T_446; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_448 = _ctrlSignals_T_117 ? 3'h0 : _ctrlSignals_T_447; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_449 = _ctrlSignals_T_115 ? 3'h0 : _ctrlSignals_T_448; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_450 = _ctrlSignals_T_113 ? 3'h0 : _ctrlSignals_T_449; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_451 = _ctrlSignals_T_111 ? 3'h0 : _ctrlSignals_T_450; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_452 = _ctrlSignals_T_109 ? 3'h0 : _ctrlSignals_T_451; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_453 = _ctrlSignals_T_107 ? 3'h0 : _ctrlSignals_T_452; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_454 = _ctrlSignals_T_105 ? 3'h0 : _ctrlSignals_T_453; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_455 = _ctrlSignals_T_103 ? 3'h0 : _ctrlSignals_T_454; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_456 = _ctrlSignals_T_101 ? 3'h0 : _ctrlSignals_T_455; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_457 = _ctrlSignals_T_99 ? 3'h0 : _ctrlSignals_T_456; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_458 = _ctrlSignals_T_97 ? 3'h0 : _ctrlSignals_T_457; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_459 = _ctrlSignals_T_95 ? 3'h0 : _ctrlSignals_T_458; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_460 = _ctrlSignals_T_93 ? 3'h0 : _ctrlSignals_T_459; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_461 = _ctrlSignals_T_91 ? 3'h0 : _ctrlSignals_T_460; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_462 = _ctrlSignals_T_89 ? 3'h0 : _ctrlSignals_T_461; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_463 = _ctrlSignals_T_87 ? 3'h0 : _ctrlSignals_T_462; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_464 = _ctrlSignals_T_85 ? 3'h0 : _ctrlSignals_T_463; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_465 = _ctrlSignals_T_83 ? 3'h0 : _ctrlSignals_T_464; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_466 = _ctrlSignals_T_81 ? 3'h0 : _ctrlSignals_T_465; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_467 = _ctrlSignals_T_79 ? 3'h0 : _ctrlSignals_T_466; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_468 = _ctrlSignals_T_77 ? 3'h0 : _ctrlSignals_T_467; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_469 = _ctrlSignals_T_75 ? 3'h0 : _ctrlSignals_T_468; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_470 = _ctrlSignals_T_73 ? 3'h0 : _ctrlSignals_T_469; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_471 = _ctrlSignals_T_71 ? 3'h0 : _ctrlSignals_T_470; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_472 = _ctrlSignals_T_69 ? 3'h0 : _ctrlSignals_T_471; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_473 = _ctrlSignals_T_67 ? 3'h1 : _ctrlSignals_T_472; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_474 = _ctrlSignals_T_65 ? 3'h1 : _ctrlSignals_T_473; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_475 = _ctrlSignals_T_63 ? 3'h1 : _ctrlSignals_T_474; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_476 = _ctrlSignals_T_61 ? 3'h1 : _ctrlSignals_T_475; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_477 = _ctrlSignals_T_59 ? 3'h1 : _ctrlSignals_T_476; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_478 = _ctrlSignals_T_57 ? 3'h1 : _ctrlSignals_T_477; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_479 = _ctrlSignals_T_55 ? 3'h1 : _ctrlSignals_T_478; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_480 = _ctrlSignals_T_53 ? 3'h1 : _ctrlSignals_T_479; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_481 = _ctrlSignals_T_51 ? 3'h1 : _ctrlSignals_T_480; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_482 = _ctrlSignals_T_49 ? 3'h1 : _ctrlSignals_T_481; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_483 = _ctrlSignals_T_47 ? 3'h1 : _ctrlSignals_T_482; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_484 = _ctrlSignals_T_45 ? 3'h1 : _ctrlSignals_T_483; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_485 = _ctrlSignals_T_43 ? 3'h1 : _ctrlSignals_T_484; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_486 = _ctrlSignals_T_41 ? 3'h2 : _ctrlSignals_T_485; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_487 = _ctrlSignals_T_39 ? 3'h2 : _ctrlSignals_T_486; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_488 = _ctrlSignals_T_37 ? 3'h2 : _ctrlSignals_T_487; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_489 = _ctrlSignals_T_35 ? 3'h2 : _ctrlSignals_T_488; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_490 = _ctrlSignals_T_33 ? 3'h1 : _ctrlSignals_T_489; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_491 = _ctrlSignals_T_31 ? 3'h1 : _ctrlSignals_T_490; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_492 = _ctrlSignals_T_29 ? 3'h1 : _ctrlSignals_T_491; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_493 = _ctrlSignals_T_27 ? 3'h1 : _ctrlSignals_T_492; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_494 = _ctrlSignals_T_25 ? 3'h1 : _ctrlSignals_T_493; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_495 = _ctrlSignals_T_23 ? 3'h1 : _ctrlSignals_T_494; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_496 = _ctrlSignals_T_21 ? 3'h1 : _ctrlSignals_T_495; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_497 = _ctrlSignals_T_19 ? 3'h5 : _ctrlSignals_T_496; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_498 = _ctrlSignals_T_17 ? 3'h5 : _ctrlSignals_T_497; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_499 = _ctrlSignals_T_15 ? 3'h5 : _ctrlSignals_T_498; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_500 = _ctrlSignals_T_13 ? 3'h5 : _ctrlSignals_T_499; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_501 = _ctrlSignals_T_11 ? 3'h5 : _ctrlSignals_T_500; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_502 = _ctrlSignals_T_9 ? 3'h5 : _ctrlSignals_T_501; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_503 = _ctrlSignals_T_7 ? 3'h1 : _ctrlSignals_T_502; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_504 = _ctrlSignals_T_5 ? 3'h4 : _ctrlSignals_T_503; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_505 = _ctrlSignals_T_3 ? 3'h3 : _ctrlSignals_T_504; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_506 = _ctrlSignals_T_145 ? 5'h11 : 5'hb; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_507 = _ctrlSignals_T_143 ? 5'h11 : _ctrlSignals_T_506; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_508 = _ctrlSignals_T_141 ? 5'h11 : _ctrlSignals_T_507; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_509 = _ctrlSignals_T_139 ? 5'h11 : _ctrlSignals_T_508; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_510 = _ctrlSignals_T_137 ? 5'h11 : _ctrlSignals_T_509; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_511 = _ctrlSignals_T_135 ? 5'h11 : _ctrlSignals_T_510; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_512 = _ctrlSignals_T_133 ? 5'h11 : _ctrlSignals_T_511; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_513 = _ctrlSignals_T_131 ? 5'h11 : _ctrlSignals_T_512; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_514 = _ctrlSignals_T_129 ? 5'ha : _ctrlSignals_T_513; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_515 = _ctrlSignals_T_127 ? 5'ha : _ctrlSignals_T_514; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_516 = _ctrlSignals_T_125 ? 5'ha : _ctrlSignals_T_515; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_517 = _ctrlSignals_T_123 ? 5'h10 : _ctrlSignals_T_516; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_518 = _ctrlSignals_T_121 ? 5'he : _ctrlSignals_T_517; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_519 = _ctrlSignals_T_119 ? 5'h10 : _ctrlSignals_T_518; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_520 = _ctrlSignals_T_117 ? 5'he : _ctrlSignals_T_519; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_521 = _ctrlSignals_T_115 ? 5'hf : _ctrlSignals_T_520; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_522 = _ctrlSignals_T_113 ? 5'hd : _ctrlSignals_T_521; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_523 = _ctrlSignals_T_111 ? 5'hf : _ctrlSignals_T_522; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_524 = _ctrlSignals_T_109 ? 5'hd : _ctrlSignals_T_523; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_525 = _ctrlSignals_T_107 ? 5'hc : _ctrlSignals_T_524; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_526 = _ctrlSignals_T_105 ? 5'hc : _ctrlSignals_T_525; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_527 = _ctrlSignals_T_103 ? 5'hc : _ctrlSignals_T_526; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_528 = _ctrlSignals_T_101 ? 5'hc : _ctrlSignals_T_527; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_529 = _ctrlSignals_T_99 ? 5'hc : _ctrlSignals_T_528; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_530 = _ctrlSignals_T_97 ? 5'h2 : _ctrlSignals_T_529; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_531 = _ctrlSignals_T_95 ? 5'h3 : _ctrlSignals_T_530; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_532 = _ctrlSignals_T_93 ? 5'h9 : _ctrlSignals_T_531; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_533 = _ctrlSignals_T_91 ? 5'h9 : _ctrlSignals_T_532; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_534 = _ctrlSignals_T_89 ? 5'h8 : _ctrlSignals_T_533; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_535 = _ctrlSignals_T_87 ? 5'h8 : _ctrlSignals_T_534; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_536 = _ctrlSignals_T_85 ? 5'h4 : _ctrlSignals_T_535; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_537 = _ctrlSignals_T_83 ? 5'h7 : _ctrlSignals_T_536; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_538 = _ctrlSignals_T_81 ? 5'h5 : _ctrlSignals_T_537; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_539 = _ctrlSignals_T_79 ? 5'h6 : _ctrlSignals_T_538; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_540 = _ctrlSignals_T_77 ? 5'h6 : _ctrlSignals_T_539; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_541 = _ctrlSignals_T_75 ? 5'h1 : _ctrlSignals_T_540; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_542 = _ctrlSignals_T_73 ? 5'h1 : _ctrlSignals_T_541; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_543 = _ctrlSignals_T_71 ? 5'h0 : _ctrlSignals_T_542; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_544 = _ctrlSignals_T_69 ? 5'h0 : _ctrlSignals_T_543; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_545 = _ctrlSignals_T_67 ? 5'h9 : _ctrlSignals_T_544; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_546 = _ctrlSignals_T_65 ? 5'h9 : _ctrlSignals_T_545; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_547 = _ctrlSignals_T_63 ? 5'h8 : _ctrlSignals_T_546; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_548 = _ctrlSignals_T_61 ? 5'h8 : _ctrlSignals_T_547; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_549 = _ctrlSignals_T_59 ? 5'h6 : _ctrlSignals_T_548; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_550 = _ctrlSignals_T_57 ? 5'h6 : _ctrlSignals_T_549; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_551 = _ctrlSignals_T_55 ? 5'h2 : _ctrlSignals_T_550; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_552 = _ctrlSignals_T_53 ? 5'h3 : _ctrlSignals_T_551; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_553 = _ctrlSignals_T_51 ? 5'h4 : _ctrlSignals_T_552; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_554 = _ctrlSignals_T_49 ? 5'h7 : _ctrlSignals_T_553; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_555 = _ctrlSignals_T_47 ? 5'h5 : _ctrlSignals_T_554; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_556 = _ctrlSignals_T_45 ? 5'h0 : _ctrlSignals_T_555; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_557 = _ctrlSignals_T_43 ? 5'h0 : _ctrlSignals_T_556; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_558 = _ctrlSignals_T_41 ? 5'h0 : _ctrlSignals_T_557; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_559 = _ctrlSignals_T_39 ? 5'h0 : _ctrlSignals_T_558; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_560 = _ctrlSignals_T_37 ? 5'h0 : _ctrlSignals_T_559; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_561 = _ctrlSignals_T_35 ? 5'h0 : _ctrlSignals_T_560; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_562 = _ctrlSignals_T_33 ? 5'h0 : _ctrlSignals_T_561; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_563 = _ctrlSignals_T_31 ? 5'h0 : _ctrlSignals_T_562; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_564 = _ctrlSignals_T_29 ? 5'h0 : _ctrlSignals_T_563; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_565 = _ctrlSignals_T_27 ? 5'h0 : _ctrlSignals_T_564; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_566 = _ctrlSignals_T_25 ? 5'h0 : _ctrlSignals_T_565; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_567 = _ctrlSignals_T_23 ? 5'h0 : _ctrlSignals_T_566; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_568 = _ctrlSignals_T_21 ? 5'h0 : _ctrlSignals_T_567; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_569 = _ctrlSignals_T_19 ? 5'h0 : _ctrlSignals_T_568; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_570 = _ctrlSignals_T_17 ? 5'h0 : _ctrlSignals_T_569; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_571 = _ctrlSignals_T_15 ? 5'h0 : _ctrlSignals_T_570; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_572 = _ctrlSignals_T_13 ? 5'h0 : _ctrlSignals_T_571; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_573 = _ctrlSignals_T_11 ? 5'h0 : _ctrlSignals_T_572; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_574 = _ctrlSignals_T_9 ? 5'h0 : _ctrlSignals_T_573; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_575 = _ctrlSignals_T_7 ? 5'h0 : _ctrlSignals_T_574; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_576 = _ctrlSignals_T_5 ? 5'h0 : _ctrlSignals_T_575; // @[Lookup.scala 34:39]
  wire [4:0] _ctrlSignals_T_577 = _ctrlSignals_T_3 ? 5'h0 : _ctrlSignals_T_576; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_641 = _ctrlSignals_T_19 ? 3'h4 : 3'h0; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_642 = _ctrlSignals_T_17 ? 3'h1 : _ctrlSignals_T_641; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_643 = _ctrlSignals_T_15 ? 3'h5 : _ctrlSignals_T_642; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_644 = _ctrlSignals_T_13 ? 3'h2 : _ctrlSignals_T_643; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_645 = _ctrlSignals_T_11 ? 3'h6 : _ctrlSignals_T_644; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_646 = _ctrlSignals_T_9 ? 3'h3 : _ctrlSignals_T_645; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_647 = _ctrlSignals_T_7 ? 3'h0 : _ctrlSignals_T_646; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_648 = _ctrlSignals_T_5 ? 3'h0 : _ctrlSignals_T_647; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_649 = _ctrlSignals_T_3 ? 3'h0 : _ctrlSignals_T_648; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_702 = _ctrlSignals_T_41 ? 3'h4 : 3'h0; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_703 = _ctrlSignals_T_39 ? 3'h1 : _ctrlSignals_T_702; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_704 = _ctrlSignals_T_37 ? 3'h2 : _ctrlSignals_T_703; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_705 = _ctrlSignals_T_35 ? 3'h3 : _ctrlSignals_T_704; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_706 = _ctrlSignals_T_33 ? 3'h0 : _ctrlSignals_T_705; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_707 = _ctrlSignals_T_31 ? 3'h0 : _ctrlSignals_T_706; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_708 = _ctrlSignals_T_29 ? 3'h0 : _ctrlSignals_T_707; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_709 = _ctrlSignals_T_27 ? 3'h0 : _ctrlSignals_T_708; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_710 = _ctrlSignals_T_25 ? 3'h0 : _ctrlSignals_T_709; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_711 = _ctrlSignals_T_23 ? 3'h0 : _ctrlSignals_T_710; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_712 = _ctrlSignals_T_21 ? 3'h0 : _ctrlSignals_T_711; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_713 = _ctrlSignals_T_19 ? 3'h0 : _ctrlSignals_T_712; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_714 = _ctrlSignals_T_17 ? 3'h0 : _ctrlSignals_T_713; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_715 = _ctrlSignals_T_15 ? 3'h0 : _ctrlSignals_T_714; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_716 = _ctrlSignals_T_13 ? 3'h0 : _ctrlSignals_T_715; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_717 = _ctrlSignals_T_11 ? 3'h0 : _ctrlSignals_T_716; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_718 = _ctrlSignals_T_9 ? 3'h0 : _ctrlSignals_T_717; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_719 = _ctrlSignals_T_7 ? 3'h0 : _ctrlSignals_T_718; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_720 = _ctrlSignals_T_5 ? 3'h0 : _ctrlSignals_T_719; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_721 = _ctrlSignals_T_3 ? 3'h0 : _ctrlSignals_T_720; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_778 = _ctrlSignals_T_33 ? 3'h7 : 3'h0; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_779 = _ctrlSignals_T_31 ? 3'h6 : _ctrlSignals_T_778; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_780 = _ctrlSignals_T_29 ? 3'h4 : _ctrlSignals_T_779; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_781 = _ctrlSignals_T_27 ? 3'h5 : _ctrlSignals_T_780; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_782 = _ctrlSignals_T_25 ? 3'h1 : _ctrlSignals_T_781; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_783 = _ctrlSignals_T_23 ? 3'h2 : _ctrlSignals_T_782; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_784 = _ctrlSignals_T_21 ? 3'h3 : _ctrlSignals_T_783; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_785 = _ctrlSignals_T_19 ? 3'h0 : _ctrlSignals_T_784; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_786 = _ctrlSignals_T_17 ? 3'h0 : _ctrlSignals_T_785; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_787 = _ctrlSignals_T_15 ? 3'h0 : _ctrlSignals_T_786; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_788 = _ctrlSignals_T_13 ? 3'h0 : _ctrlSignals_T_787; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_789 = _ctrlSignals_T_11 ? 3'h0 : _ctrlSignals_T_788; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_790 = _ctrlSignals_T_9 ? 3'h0 : _ctrlSignals_T_789; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_791 = _ctrlSignals_T_7 ? 3'h0 : _ctrlSignals_T_790; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_792 = _ctrlSignals_T_5 ? 3'h0 : _ctrlSignals_T_791; // @[Lookup.scala 34:39]
  wire [2:0] _ctrlSignals_T_793 = _ctrlSignals_T_3 ? 3'h0 : _ctrlSignals_T_792; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_795 = _ctrlSignals_T_143 ? 2'h3 : 2'h0; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_796 = _ctrlSignals_T_141 ? 2'h3 : _ctrlSignals_T_795; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_797 = _ctrlSignals_T_139 ? 2'h3 : _ctrlSignals_T_796; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_798 = _ctrlSignals_T_137 ? 2'h3 : _ctrlSignals_T_797; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_799 = _ctrlSignals_T_135 ? 2'h3 : _ctrlSignals_T_798; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_800 = _ctrlSignals_T_133 ? 2'h3 : _ctrlSignals_T_799; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_801 = _ctrlSignals_T_131 ? 2'h3 : _ctrlSignals_T_800; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_802 = _ctrlSignals_T_129 ? 2'h3 : _ctrlSignals_T_801; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_803 = _ctrlSignals_T_127 ? 2'h3 : _ctrlSignals_T_802; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_804 = _ctrlSignals_T_125 ? 2'h3 : _ctrlSignals_T_803; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_805 = _ctrlSignals_T_123 ? 2'h0 : _ctrlSignals_T_804; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_806 = _ctrlSignals_T_121 ? 2'h0 : _ctrlSignals_T_805; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_807 = _ctrlSignals_T_119 ? 2'h0 : _ctrlSignals_T_806; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_808 = _ctrlSignals_T_117 ? 2'h0 : _ctrlSignals_T_807; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_809 = _ctrlSignals_T_115 ? 2'h0 : _ctrlSignals_T_808; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_810 = _ctrlSignals_T_113 ? 2'h0 : _ctrlSignals_T_809; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_811 = _ctrlSignals_T_111 ? 2'h0 : _ctrlSignals_T_810; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_812 = _ctrlSignals_T_109 ? 2'h0 : _ctrlSignals_T_811; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_813 = _ctrlSignals_T_107 ? 2'h0 : _ctrlSignals_T_812; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_814 = _ctrlSignals_T_105 ? 2'h0 : _ctrlSignals_T_813; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_815 = _ctrlSignals_T_103 ? 2'h0 : _ctrlSignals_T_814; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_816 = _ctrlSignals_T_101 ? 2'h0 : _ctrlSignals_T_815; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_817 = _ctrlSignals_T_99 ? 2'h0 : _ctrlSignals_T_816; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_818 = _ctrlSignals_T_97 ? 2'h0 : _ctrlSignals_T_817; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_819 = _ctrlSignals_T_95 ? 2'h0 : _ctrlSignals_T_818; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_820 = _ctrlSignals_T_93 ? 2'h0 : _ctrlSignals_T_819; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_821 = _ctrlSignals_T_91 ? 2'h0 : _ctrlSignals_T_820; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_822 = _ctrlSignals_T_89 ? 2'h0 : _ctrlSignals_T_821; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_823 = _ctrlSignals_T_87 ? 2'h0 : _ctrlSignals_T_822; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_824 = _ctrlSignals_T_85 ? 2'h0 : _ctrlSignals_T_823; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_825 = _ctrlSignals_T_83 ? 2'h0 : _ctrlSignals_T_824; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_826 = _ctrlSignals_T_81 ? 2'h0 : _ctrlSignals_T_825; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_827 = _ctrlSignals_T_79 ? 2'h0 : _ctrlSignals_T_826; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_828 = _ctrlSignals_T_77 ? 2'h0 : _ctrlSignals_T_827; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_829 = _ctrlSignals_T_75 ? 2'h0 : _ctrlSignals_T_828; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_830 = _ctrlSignals_T_73 ? 2'h0 : _ctrlSignals_T_829; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_831 = _ctrlSignals_T_71 ? 2'h0 : _ctrlSignals_T_830; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_832 = _ctrlSignals_T_69 ? 2'h0 : _ctrlSignals_T_831; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_833 = _ctrlSignals_T_67 ? 2'h0 : _ctrlSignals_T_832; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_834 = _ctrlSignals_T_65 ? 2'h0 : _ctrlSignals_T_833; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_835 = _ctrlSignals_T_63 ? 2'h0 : _ctrlSignals_T_834; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_836 = _ctrlSignals_T_61 ? 2'h0 : _ctrlSignals_T_835; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_837 = _ctrlSignals_T_59 ? 2'h0 : _ctrlSignals_T_836; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_838 = _ctrlSignals_T_57 ? 2'h0 : _ctrlSignals_T_837; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_839 = _ctrlSignals_T_55 ? 2'h0 : _ctrlSignals_T_838; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_840 = _ctrlSignals_T_53 ? 2'h0 : _ctrlSignals_T_839; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_841 = _ctrlSignals_T_51 ? 2'h0 : _ctrlSignals_T_840; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_842 = _ctrlSignals_T_49 ? 2'h0 : _ctrlSignals_T_841; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_843 = _ctrlSignals_T_47 ? 2'h0 : _ctrlSignals_T_842; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_844 = _ctrlSignals_T_45 ? 2'h0 : _ctrlSignals_T_843; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_845 = _ctrlSignals_T_43 ? 2'h0 : _ctrlSignals_T_844; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_846 = _ctrlSignals_T_41 ? 2'h0 : _ctrlSignals_T_845; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_847 = _ctrlSignals_T_39 ? 2'h0 : _ctrlSignals_T_846; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_848 = _ctrlSignals_T_37 ? 2'h0 : _ctrlSignals_T_847; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_849 = _ctrlSignals_T_35 ? 2'h0 : _ctrlSignals_T_848; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_850 = _ctrlSignals_T_33 ? 2'h1 : _ctrlSignals_T_849; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_851 = _ctrlSignals_T_31 ? 2'h1 : _ctrlSignals_T_850; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_852 = _ctrlSignals_T_29 ? 2'h1 : _ctrlSignals_T_851; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_853 = _ctrlSignals_T_27 ? 2'h1 : _ctrlSignals_T_852; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_854 = _ctrlSignals_T_25 ? 2'h1 : _ctrlSignals_T_853; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_855 = _ctrlSignals_T_23 ? 2'h1 : _ctrlSignals_T_854; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_856 = _ctrlSignals_T_21 ? 2'h1 : _ctrlSignals_T_855; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_857 = _ctrlSignals_T_19 ? 2'h0 : _ctrlSignals_T_856; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_858 = _ctrlSignals_T_17 ? 2'h0 : _ctrlSignals_T_857; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_859 = _ctrlSignals_T_15 ? 2'h0 : _ctrlSignals_T_858; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_860 = _ctrlSignals_T_13 ? 2'h0 : _ctrlSignals_T_859; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_861 = _ctrlSignals_T_11 ? 2'h0 : _ctrlSignals_T_860; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_862 = _ctrlSignals_T_9 ? 2'h0 : _ctrlSignals_T_861; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_863 = _ctrlSignals_T_7 ? 2'h2 : _ctrlSignals_T_862; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_864 = _ctrlSignals_T_5 ? 2'h2 : _ctrlSignals_T_863; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_865 = _ctrlSignals_T_3 ? 2'h0 : _ctrlSignals_T_864; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_866 = _ctrlSignals_T_145 ? 1'h0 : 1'h1; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_867 = _ctrlSignals_T_143 ? 1'h0 : _ctrlSignals_T_866; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_868 = _ctrlSignals_T_141 ? 1'h0 : _ctrlSignals_T_867; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_869 = _ctrlSignals_T_139 ? 1'h0 : _ctrlSignals_T_868; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_870 = _ctrlSignals_T_137 ? 1'h0 : _ctrlSignals_T_869; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_900 = _ctrlSignals_T_77 | (_ctrlSignals_T_79 | (_ctrlSignals_T_81 | (_ctrlSignals_T_83 | (
    _ctrlSignals_T_85 | (_ctrlSignals_T_87 | (_ctrlSignals_T_89 | (_ctrlSignals_T_91 | (_ctrlSignals_T_93 | (
    _ctrlSignals_T_95 | (_ctrlSignals_T_97 | (_ctrlSignals_T_99 | (_ctrlSignals_T_101 | (_ctrlSignals_T_103 | (
    _ctrlSignals_T_105 | (_ctrlSignals_T_107 | (_ctrlSignals_T_109 | (_ctrlSignals_T_111 | (_ctrlSignals_T_113 | (
    _ctrlSignals_T_115 | (_ctrlSignals_T_117 | (_ctrlSignals_T_119 | (_ctrlSignals_T_121 | (_ctrlSignals_T_123 | (
    _ctrlSignals_T_125 | (_ctrlSignals_T_127 | (_ctrlSignals_T_129 | (_ctrlSignals_T_131 | (_ctrlSignals_T_133 | (
    _ctrlSignals_T_135 | _ctrlSignals_T_870))))))))))))))))))))))))))))); // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_918 = _ctrlSignals_T_41 ? 1'h0 : _ctrlSignals_T_43 | (_ctrlSignals_T_45 | (_ctrlSignals_T_47 | (
    _ctrlSignals_T_49 | (_ctrlSignals_T_51 | (_ctrlSignals_T_53 | (_ctrlSignals_T_55 | (_ctrlSignals_T_57 | (
    _ctrlSignals_T_59 | (_ctrlSignals_T_61 | (_ctrlSignals_T_63 | (_ctrlSignals_T_65 | (_ctrlSignals_T_67 | (
    _ctrlSignals_T_69 | (_ctrlSignals_T_71 | (_ctrlSignals_T_73 | (_ctrlSignals_T_75 | _ctrlSignals_T_900)))))))))))))))
    ); // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_919 = _ctrlSignals_T_39 ? 1'h0 : _ctrlSignals_T_918; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_920 = _ctrlSignals_T_37 ? 1'h0 : _ctrlSignals_T_919; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_921 = _ctrlSignals_T_35 ? 1'h0 : _ctrlSignals_T_920; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_929 = _ctrlSignals_T_19 ? 1'h0 : _ctrlSignals_T_21 | (_ctrlSignals_T_23 | (_ctrlSignals_T_25 | (
    _ctrlSignals_T_27 | (_ctrlSignals_T_29 | (_ctrlSignals_T_31 | (_ctrlSignals_T_33 | _ctrlSignals_T_921)))))); // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_930 = _ctrlSignals_T_17 ? 1'h0 : _ctrlSignals_T_929; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_931 = _ctrlSignals_T_15 ? 1'h0 : _ctrlSignals_T_930; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_932 = _ctrlSignals_T_13 ? 1'h0 : _ctrlSignals_T_931; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_933 = _ctrlSignals_T_11 ? 1'h0 : _ctrlSignals_T_932; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_934 = _ctrlSignals_T_9 ? 1'h0 : _ctrlSignals_T_933; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_941 = _ctrlSignals_T_139 ? 2'h1 : 2'h0; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_942 = _ctrlSignals_T_137 ? 2'h3 : _ctrlSignals_T_941; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_943 = _ctrlSignals_T_135 ? 2'h0 : _ctrlSignals_T_942; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_944 = _ctrlSignals_T_133 ? 2'h0 : _ctrlSignals_T_943; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_945 = _ctrlSignals_T_131 ? 2'h0 : _ctrlSignals_T_944; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_946 = _ctrlSignals_T_129 ? 2'h0 : _ctrlSignals_T_945; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_947 = _ctrlSignals_T_127 ? 2'h0 : _ctrlSignals_T_946; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_948 = _ctrlSignals_T_125 ? 2'h0 : _ctrlSignals_T_947; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_949 = _ctrlSignals_T_123 ? 2'h0 : _ctrlSignals_T_948; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_950 = _ctrlSignals_T_121 ? 2'h0 : _ctrlSignals_T_949; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_951 = _ctrlSignals_T_119 ? 2'h0 : _ctrlSignals_T_950; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_952 = _ctrlSignals_T_117 ? 2'h0 : _ctrlSignals_T_951; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_953 = _ctrlSignals_T_115 ? 2'h0 : _ctrlSignals_T_952; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_954 = _ctrlSignals_T_113 ? 2'h0 : _ctrlSignals_T_953; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_955 = _ctrlSignals_T_111 ? 2'h0 : _ctrlSignals_T_954; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_956 = _ctrlSignals_T_109 ? 2'h0 : _ctrlSignals_T_955; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_957 = _ctrlSignals_T_107 ? 2'h0 : _ctrlSignals_T_956; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_958 = _ctrlSignals_T_105 ? 2'h0 : _ctrlSignals_T_957; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_959 = _ctrlSignals_T_103 ? 2'h0 : _ctrlSignals_T_958; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_960 = _ctrlSignals_T_101 ? 2'h0 : _ctrlSignals_T_959; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_961 = _ctrlSignals_T_99 ? 2'h0 : _ctrlSignals_T_960; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_962 = _ctrlSignals_T_97 ? 2'h0 : _ctrlSignals_T_961; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_963 = _ctrlSignals_T_95 ? 2'h0 : _ctrlSignals_T_962; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_964 = _ctrlSignals_T_93 ? 2'h0 : _ctrlSignals_T_963; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_965 = _ctrlSignals_T_91 ? 2'h0 : _ctrlSignals_T_964; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_966 = _ctrlSignals_T_89 ? 2'h0 : _ctrlSignals_T_965; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_967 = _ctrlSignals_T_87 ? 2'h0 : _ctrlSignals_T_966; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_968 = _ctrlSignals_T_85 ? 2'h0 : _ctrlSignals_T_967; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_969 = _ctrlSignals_T_83 ? 2'h0 : _ctrlSignals_T_968; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_970 = _ctrlSignals_T_81 ? 2'h0 : _ctrlSignals_T_969; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_971 = _ctrlSignals_T_79 ? 2'h0 : _ctrlSignals_T_970; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_972 = _ctrlSignals_T_77 ? 2'h0 : _ctrlSignals_T_971; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_973 = _ctrlSignals_T_75 ? 2'h0 : _ctrlSignals_T_972; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_974 = _ctrlSignals_T_73 ? 2'h0 : _ctrlSignals_T_973; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_975 = _ctrlSignals_T_71 ? 2'h0 : _ctrlSignals_T_974; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_976 = _ctrlSignals_T_69 ? 2'h0 : _ctrlSignals_T_975; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_977 = _ctrlSignals_T_67 ? 2'h0 : _ctrlSignals_T_976; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_978 = _ctrlSignals_T_65 ? 2'h0 : _ctrlSignals_T_977; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_979 = _ctrlSignals_T_63 ? 2'h0 : _ctrlSignals_T_978; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_980 = _ctrlSignals_T_61 ? 2'h0 : _ctrlSignals_T_979; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_981 = _ctrlSignals_T_59 ? 2'h0 : _ctrlSignals_T_980; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_982 = _ctrlSignals_T_57 ? 2'h0 : _ctrlSignals_T_981; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_983 = _ctrlSignals_T_55 ? 2'h0 : _ctrlSignals_T_982; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_984 = _ctrlSignals_T_53 ? 2'h0 : _ctrlSignals_T_983; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_985 = _ctrlSignals_T_51 ? 2'h0 : _ctrlSignals_T_984; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_986 = _ctrlSignals_T_49 ? 2'h0 : _ctrlSignals_T_985; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_987 = _ctrlSignals_T_47 ? 2'h0 : _ctrlSignals_T_986; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_988 = _ctrlSignals_T_45 ? 2'h0 : _ctrlSignals_T_987; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_989 = _ctrlSignals_T_43 ? 2'h0 : _ctrlSignals_T_988; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_990 = _ctrlSignals_T_41 ? 2'h0 : _ctrlSignals_T_989; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_991 = _ctrlSignals_T_39 ? 2'h0 : _ctrlSignals_T_990; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_992 = _ctrlSignals_T_37 ? 2'h0 : _ctrlSignals_T_991; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_993 = _ctrlSignals_T_35 ? 2'h0 : _ctrlSignals_T_992; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_994 = _ctrlSignals_T_33 ? 2'h0 : _ctrlSignals_T_993; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_995 = _ctrlSignals_T_31 ? 2'h0 : _ctrlSignals_T_994; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_996 = _ctrlSignals_T_29 ? 2'h0 : _ctrlSignals_T_995; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_997 = _ctrlSignals_T_27 ? 2'h0 : _ctrlSignals_T_996; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_998 = _ctrlSignals_T_25 ? 2'h0 : _ctrlSignals_T_997; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_999 = _ctrlSignals_T_23 ? 2'h0 : _ctrlSignals_T_998; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1000 = _ctrlSignals_T_21 ? 2'h0 : _ctrlSignals_T_999; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1001 = _ctrlSignals_T_19 ? 2'h0 : _ctrlSignals_T_1000; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1002 = _ctrlSignals_T_17 ? 2'h0 : _ctrlSignals_T_1001; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1003 = _ctrlSignals_T_15 ? 2'h0 : _ctrlSignals_T_1002; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1004 = _ctrlSignals_T_13 ? 2'h0 : _ctrlSignals_T_1003; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1005 = _ctrlSignals_T_11 ? 2'h0 : _ctrlSignals_T_1004; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1006 = _ctrlSignals_T_9 ? 2'h0 : _ctrlSignals_T_1005; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1007 = _ctrlSignals_T_7 ? 2'h0 : _ctrlSignals_T_1006; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1008 = _ctrlSignals_T_5 ? 2'h0 : _ctrlSignals_T_1007; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1009 = _ctrlSignals_T_3 ? 2'h0 : _ctrlSignals_T_1008; // @[Lookup.scala 34:39]
  wire [1:0] ctrlSignals_11 = _ctrlSignals_T_1 ? 2'h0 : _ctrlSignals_T_1009; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1015 = _ctrlSignals_T_135 ? 2'h3 : 2'h0; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1016 = _ctrlSignals_T_133 ? 2'h2 : _ctrlSignals_T_1015; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1017 = _ctrlSignals_T_131 ? 2'h1 : _ctrlSignals_T_1016; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1018 = _ctrlSignals_T_129 ? 2'h3 : _ctrlSignals_T_1017; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1019 = _ctrlSignals_T_127 ? 2'h2 : _ctrlSignals_T_1018; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1020 = _ctrlSignals_T_125 ? 2'h1 : _ctrlSignals_T_1019; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1021 = _ctrlSignals_T_123 ? 2'h0 : _ctrlSignals_T_1020; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1022 = _ctrlSignals_T_121 ? 2'h0 : _ctrlSignals_T_1021; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1023 = _ctrlSignals_T_119 ? 2'h0 : _ctrlSignals_T_1022; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1024 = _ctrlSignals_T_117 ? 2'h0 : _ctrlSignals_T_1023; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1025 = _ctrlSignals_T_115 ? 2'h0 : _ctrlSignals_T_1024; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1026 = _ctrlSignals_T_113 ? 2'h0 : _ctrlSignals_T_1025; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1027 = _ctrlSignals_T_111 ? 2'h0 : _ctrlSignals_T_1026; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1028 = _ctrlSignals_T_109 ? 2'h0 : _ctrlSignals_T_1027; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1029 = _ctrlSignals_T_107 ? 2'h0 : _ctrlSignals_T_1028; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1030 = _ctrlSignals_T_105 ? 2'h0 : _ctrlSignals_T_1029; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1031 = _ctrlSignals_T_103 ? 2'h0 : _ctrlSignals_T_1030; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1032 = _ctrlSignals_T_101 ? 2'h0 : _ctrlSignals_T_1031; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1033 = _ctrlSignals_T_99 ? 2'h0 : _ctrlSignals_T_1032; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1034 = _ctrlSignals_T_97 ? 2'h0 : _ctrlSignals_T_1033; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1035 = _ctrlSignals_T_95 ? 2'h0 : _ctrlSignals_T_1034; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1036 = _ctrlSignals_T_93 ? 2'h0 : _ctrlSignals_T_1035; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1037 = _ctrlSignals_T_91 ? 2'h0 : _ctrlSignals_T_1036; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1038 = _ctrlSignals_T_89 ? 2'h0 : _ctrlSignals_T_1037; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1039 = _ctrlSignals_T_87 ? 2'h0 : _ctrlSignals_T_1038; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1040 = _ctrlSignals_T_85 ? 2'h0 : _ctrlSignals_T_1039; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1041 = _ctrlSignals_T_83 ? 2'h0 : _ctrlSignals_T_1040; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1042 = _ctrlSignals_T_81 ? 2'h0 : _ctrlSignals_T_1041; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1043 = _ctrlSignals_T_79 ? 2'h0 : _ctrlSignals_T_1042; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1044 = _ctrlSignals_T_77 ? 2'h0 : _ctrlSignals_T_1043; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1045 = _ctrlSignals_T_75 ? 2'h0 : _ctrlSignals_T_1044; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1046 = _ctrlSignals_T_73 ? 2'h0 : _ctrlSignals_T_1045; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1047 = _ctrlSignals_T_71 ? 2'h0 : _ctrlSignals_T_1046; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1048 = _ctrlSignals_T_69 ? 2'h0 : _ctrlSignals_T_1047; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1049 = _ctrlSignals_T_67 ? 2'h0 : _ctrlSignals_T_1048; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1050 = _ctrlSignals_T_65 ? 2'h0 : _ctrlSignals_T_1049; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1051 = _ctrlSignals_T_63 ? 2'h0 : _ctrlSignals_T_1050; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1052 = _ctrlSignals_T_61 ? 2'h0 : _ctrlSignals_T_1051; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1053 = _ctrlSignals_T_59 ? 2'h0 : _ctrlSignals_T_1052; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1054 = _ctrlSignals_T_57 ? 2'h0 : _ctrlSignals_T_1053; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1055 = _ctrlSignals_T_55 ? 2'h0 : _ctrlSignals_T_1054; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1056 = _ctrlSignals_T_53 ? 2'h0 : _ctrlSignals_T_1055; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1057 = _ctrlSignals_T_51 ? 2'h0 : _ctrlSignals_T_1056; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1058 = _ctrlSignals_T_49 ? 2'h0 : _ctrlSignals_T_1057; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1059 = _ctrlSignals_T_47 ? 2'h0 : _ctrlSignals_T_1058; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1060 = _ctrlSignals_T_45 ? 2'h0 : _ctrlSignals_T_1059; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1061 = _ctrlSignals_T_43 ? 2'h0 : _ctrlSignals_T_1060; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1062 = _ctrlSignals_T_41 ? 2'h0 : _ctrlSignals_T_1061; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1063 = _ctrlSignals_T_39 ? 2'h0 : _ctrlSignals_T_1062; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1064 = _ctrlSignals_T_37 ? 2'h0 : _ctrlSignals_T_1063; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1065 = _ctrlSignals_T_35 ? 2'h0 : _ctrlSignals_T_1064; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1066 = _ctrlSignals_T_33 ? 2'h0 : _ctrlSignals_T_1065; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1067 = _ctrlSignals_T_31 ? 2'h0 : _ctrlSignals_T_1066; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1068 = _ctrlSignals_T_29 ? 2'h0 : _ctrlSignals_T_1067; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1069 = _ctrlSignals_T_27 ? 2'h0 : _ctrlSignals_T_1068; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1070 = _ctrlSignals_T_25 ? 2'h0 : _ctrlSignals_T_1069; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1071 = _ctrlSignals_T_23 ? 2'h0 : _ctrlSignals_T_1070; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1072 = _ctrlSignals_T_21 ? 2'h0 : _ctrlSignals_T_1071; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1073 = _ctrlSignals_T_19 ? 2'h0 : _ctrlSignals_T_1072; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1074 = _ctrlSignals_T_17 ? 2'h0 : _ctrlSignals_T_1073; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1075 = _ctrlSignals_T_15 ? 2'h0 : _ctrlSignals_T_1074; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1076 = _ctrlSignals_T_13 ? 2'h0 : _ctrlSignals_T_1075; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1077 = _ctrlSignals_T_11 ? 2'h0 : _ctrlSignals_T_1076; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1078 = _ctrlSignals_T_9 ? 2'h0 : _ctrlSignals_T_1077; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1079 = _ctrlSignals_T_7 ? 2'h0 : _ctrlSignals_T_1078; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1080 = _ctrlSignals_T_5 ? 2'h0 : _ctrlSignals_T_1079; // @[Lookup.scala 34:39]
  wire [1:0] _ctrlSignals_T_1081 = _ctrlSignals_T_3 ? 2'h0 : _ctrlSignals_T_1080; // @[Lookup.scala 34:39]
  wire [1:0] ctrlSignals_12 = _ctrlSignals_T_1 ? 2'h0 : _ctrlSignals_T_1081; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1087 = _ctrlSignals_T_135 ? 1'h0 : _ctrlSignals_T_870; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1088 = _ctrlSignals_T_133 ? 1'h0 : _ctrlSignals_T_1087; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1089 = _ctrlSignals_T_131 ? 1'h0 : _ctrlSignals_T_1088; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1090 = _ctrlSignals_T_129 ? 1'h0 : _ctrlSignals_T_1089; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1091 = _ctrlSignals_T_127 ? 1'h0 : _ctrlSignals_T_1090; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1092 = _ctrlSignals_T_125 ? 1'h0 : _ctrlSignals_T_1091; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1093 = _ctrlSignals_T_123 ? 1'h0 : _ctrlSignals_T_1092; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1094 = _ctrlSignals_T_121 ? 1'h0 : _ctrlSignals_T_1093; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1095 = _ctrlSignals_T_119 ? 1'h0 : _ctrlSignals_T_1094; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1096 = _ctrlSignals_T_117 ? 1'h0 : _ctrlSignals_T_1095; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1097 = _ctrlSignals_T_115 ? 1'h0 : _ctrlSignals_T_1096; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1098 = _ctrlSignals_T_113 ? 1'h0 : _ctrlSignals_T_1097; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1099 = _ctrlSignals_T_111 ? 1'h0 : _ctrlSignals_T_1098; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1100 = _ctrlSignals_T_109 ? 1'h0 : _ctrlSignals_T_1099; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1101 = _ctrlSignals_T_107 ? 1'h0 : _ctrlSignals_T_1100; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1102 = _ctrlSignals_T_105 ? 1'h0 : _ctrlSignals_T_1101; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1103 = _ctrlSignals_T_103 ? 1'h0 : _ctrlSignals_T_1102; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1104 = _ctrlSignals_T_101 ? 1'h0 : _ctrlSignals_T_1103; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1105 = _ctrlSignals_T_99 ? 1'h0 : _ctrlSignals_T_1104; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1106 = _ctrlSignals_T_97 ? 1'h0 : _ctrlSignals_T_1105; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1107 = _ctrlSignals_T_95 ? 1'h0 : _ctrlSignals_T_1106; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1108 = _ctrlSignals_T_93 ? 1'h0 : _ctrlSignals_T_1107; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1109 = _ctrlSignals_T_91 ? 1'h0 : _ctrlSignals_T_1108; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1110 = _ctrlSignals_T_89 ? 1'h0 : _ctrlSignals_T_1109; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1111 = _ctrlSignals_T_87 ? 1'h0 : _ctrlSignals_T_1110; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1112 = _ctrlSignals_T_85 ? 1'h0 : _ctrlSignals_T_1111; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1113 = _ctrlSignals_T_83 ? 1'h0 : _ctrlSignals_T_1112; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1114 = _ctrlSignals_T_81 ? 1'h0 : _ctrlSignals_T_1113; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1115 = _ctrlSignals_T_79 ? 1'h0 : _ctrlSignals_T_1114; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1116 = _ctrlSignals_T_77 ? 1'h0 : _ctrlSignals_T_1115; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1117 = _ctrlSignals_T_75 ? 1'h0 : _ctrlSignals_T_1116; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1118 = _ctrlSignals_T_73 ? 1'h0 : _ctrlSignals_T_1117; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1119 = _ctrlSignals_T_71 ? 1'h0 : _ctrlSignals_T_1118; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1120 = _ctrlSignals_T_69 ? 1'h0 : _ctrlSignals_T_1119; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1121 = _ctrlSignals_T_67 ? 1'h0 : _ctrlSignals_T_1120; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1122 = _ctrlSignals_T_65 ? 1'h0 : _ctrlSignals_T_1121; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1123 = _ctrlSignals_T_63 ? 1'h0 : _ctrlSignals_T_1122; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1124 = _ctrlSignals_T_61 ? 1'h0 : _ctrlSignals_T_1123; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1125 = _ctrlSignals_T_59 ? 1'h0 : _ctrlSignals_T_1124; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1126 = _ctrlSignals_T_57 ? 1'h0 : _ctrlSignals_T_1125; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1127 = _ctrlSignals_T_55 ? 1'h0 : _ctrlSignals_T_1126; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1128 = _ctrlSignals_T_53 ? 1'h0 : _ctrlSignals_T_1127; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1129 = _ctrlSignals_T_51 ? 1'h0 : _ctrlSignals_T_1128; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1130 = _ctrlSignals_T_49 ? 1'h0 : _ctrlSignals_T_1129; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1131 = _ctrlSignals_T_47 ? 1'h0 : _ctrlSignals_T_1130; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1132 = _ctrlSignals_T_45 ? 1'h0 : _ctrlSignals_T_1131; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1133 = _ctrlSignals_T_43 ? 1'h0 : _ctrlSignals_T_1132; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1134 = _ctrlSignals_T_41 ? 1'h0 : _ctrlSignals_T_1133; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1135 = _ctrlSignals_T_39 ? 1'h0 : _ctrlSignals_T_1134; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1136 = _ctrlSignals_T_37 ? 1'h0 : _ctrlSignals_T_1135; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1137 = _ctrlSignals_T_35 ? 1'h0 : _ctrlSignals_T_1136; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1138 = _ctrlSignals_T_33 ? 1'h0 : _ctrlSignals_T_1137; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1139 = _ctrlSignals_T_31 ? 1'h0 : _ctrlSignals_T_1138; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1140 = _ctrlSignals_T_29 ? 1'h0 : _ctrlSignals_T_1139; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1141 = _ctrlSignals_T_27 ? 1'h0 : _ctrlSignals_T_1140; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1142 = _ctrlSignals_T_25 ? 1'h0 : _ctrlSignals_T_1141; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1143 = _ctrlSignals_T_23 ? 1'h0 : _ctrlSignals_T_1142; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1144 = _ctrlSignals_T_21 ? 1'h0 : _ctrlSignals_T_1143; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1145 = _ctrlSignals_T_19 ? 1'h0 : _ctrlSignals_T_1144; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1146 = _ctrlSignals_T_17 ? 1'h0 : _ctrlSignals_T_1145; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1147 = _ctrlSignals_T_15 ? 1'h0 : _ctrlSignals_T_1146; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1148 = _ctrlSignals_T_13 ? 1'h0 : _ctrlSignals_T_1147; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1149 = _ctrlSignals_T_11 ? 1'h0 : _ctrlSignals_T_1148; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1150 = _ctrlSignals_T_9 ? 1'h0 : _ctrlSignals_T_1149; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1151 = _ctrlSignals_T_7 ? 1'h0 : _ctrlSignals_T_1150; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1152 = _ctrlSignals_T_5 ? 1'h0 : _ctrlSignals_T_1151; // @[Lookup.scala 34:39]
  wire  _ctrlSignals_T_1153 = _ctrlSignals_T_3 ? 1'h0 : _ctrlSignals_T_1152; // @[Lookup.scala 34:39]
  assign io_pc_sel = _ctrlSignals_T_1 ? 2'h0 : _ctrlSignals_T_217; // @[Lookup.scala 34:39]
  assign io_A_sel = _ctrlSignals_T_1 ? 1'h0 : _ctrlSignals_T_289; // @[Lookup.scala 34:39]
  assign io_B_sel = _ctrlSignals_T_1 ? 1'h0 : _ctrlSignals_T_361; // @[Lookup.scala 34:39]
  assign io_wd_type = _ctrlSignals_T_1 ? 2'h0 : _ctrlSignals_T_433; // @[Lookup.scala 34:39]
  assign io_imm_sel = _ctrlSignals_T_1 ? 3'h3 : _ctrlSignals_T_505; // @[Lookup.scala 34:39]
  assign io_br_type = _ctrlSignals_T_1 ? 3'h0 : _ctrlSignals_T_649; // @[Lookup.scala 34:39]
  assign io_st_type = _ctrlSignals_T_1 ? 3'h0 : _ctrlSignals_T_721; // @[Lookup.scala 34:39]
  assign io_ld_type = _ctrlSignals_T_1 ? 3'h0 : _ctrlSignals_T_793; // @[Lookup.scala 34:39]
  assign io_wb_sel = _ctrlSignals_T_1 ? 2'h0 : _ctrlSignals_T_865; // @[Lookup.scala 34:39]
  assign io_wb_en = _ctrlSignals_T_1 | (_ctrlSignals_T_3 | (_ctrlSignals_T_5 | (_ctrlSignals_T_7 | _ctrlSignals_T_934)))
    ; // @[Lookup.scala 34:39]
  assign io_alu_op = _ctrlSignals_T_1 ? 5'hb : _ctrlSignals_T_577; // @[Lookup.scala 34:39]
  assign io_prv = ctrlSignals_11[0]; // @[control.scala 188:16]
  assign io_csr_cmd = {{1'd0}, ctrlSignals_12}; // @[control.scala 189:20]
  assign io_is_illegal = _ctrlSignals_T_1 ? 1'h0 : _ctrlSignals_T_1153; // @[Lookup.scala 34:39]
endmodule
module ysyx_041812_tag_cache(
  input         clock,
  input         reset,
  input  [5:0]  io_cache_req_index,
  input         io_cache_req_we,
  input         io_tag_write_valid,
  input         io_tag_write_dirty,
  input  [7:0]  io_tag_write_visit,
  input  [21:0] io_tag_write_tag,
  output        io_tag_read_valid,
  output        io_tag_read_dirty,
  output [7:0]  io_tag_read_visit,
  output [21:0] io_tag_read_tag
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
  reg [31:0] _RAND_128;
  reg [31:0] _RAND_129;
  reg [31:0] _RAND_130;
  reg [31:0] _RAND_131;
  reg [31:0] _RAND_132;
  reg [31:0] _RAND_133;
  reg [31:0] _RAND_134;
  reg [31:0] _RAND_135;
  reg [31:0] _RAND_136;
  reg [31:0] _RAND_137;
  reg [31:0] _RAND_138;
  reg [31:0] _RAND_139;
  reg [31:0] _RAND_140;
  reg [31:0] _RAND_141;
  reg [31:0] _RAND_142;
  reg [31:0] _RAND_143;
  reg [31:0] _RAND_144;
  reg [31:0] _RAND_145;
  reg [31:0] _RAND_146;
  reg [31:0] _RAND_147;
  reg [31:0] _RAND_148;
  reg [31:0] _RAND_149;
  reg [31:0] _RAND_150;
  reg [31:0] _RAND_151;
  reg [31:0] _RAND_152;
  reg [31:0] _RAND_153;
  reg [31:0] _RAND_154;
  reg [31:0] _RAND_155;
  reg [31:0] _RAND_156;
  reg [31:0] _RAND_157;
  reg [31:0] _RAND_158;
  reg [31:0] _RAND_159;
  reg [31:0] _RAND_160;
  reg [31:0] _RAND_161;
  reg [31:0] _RAND_162;
  reg [31:0] _RAND_163;
  reg [31:0] _RAND_164;
  reg [31:0] _RAND_165;
  reg [31:0] _RAND_166;
  reg [31:0] _RAND_167;
  reg [31:0] _RAND_168;
  reg [31:0] _RAND_169;
  reg [31:0] _RAND_170;
  reg [31:0] _RAND_171;
  reg [31:0] _RAND_172;
  reg [31:0] _RAND_173;
  reg [31:0] _RAND_174;
  reg [31:0] _RAND_175;
  reg [31:0] _RAND_176;
  reg [31:0] _RAND_177;
  reg [31:0] _RAND_178;
  reg [31:0] _RAND_179;
  reg [31:0] _RAND_180;
  reg [31:0] _RAND_181;
  reg [31:0] _RAND_182;
  reg [31:0] _RAND_183;
  reg [31:0] _RAND_184;
  reg [31:0] _RAND_185;
  reg [31:0] _RAND_186;
  reg [31:0] _RAND_187;
  reg [31:0] _RAND_188;
  reg [31:0] _RAND_189;
  reg [31:0] _RAND_190;
  reg [31:0] _RAND_191;
  reg [31:0] _RAND_192;
  reg [31:0] _RAND_193;
  reg [31:0] _RAND_194;
  reg [31:0] _RAND_195;
  reg [31:0] _RAND_196;
  reg [31:0] _RAND_197;
  reg [31:0] _RAND_198;
  reg [31:0] _RAND_199;
  reg [31:0] _RAND_200;
  reg [31:0] _RAND_201;
  reg [31:0] _RAND_202;
  reg [31:0] _RAND_203;
  reg [31:0] _RAND_204;
  reg [31:0] _RAND_205;
  reg [31:0] _RAND_206;
  reg [31:0] _RAND_207;
  reg [31:0] _RAND_208;
  reg [31:0] _RAND_209;
  reg [31:0] _RAND_210;
  reg [31:0] _RAND_211;
  reg [31:0] _RAND_212;
  reg [31:0] _RAND_213;
  reg [31:0] _RAND_214;
  reg [31:0] _RAND_215;
  reg [31:0] _RAND_216;
  reg [31:0] _RAND_217;
  reg [31:0] _RAND_218;
  reg [31:0] _RAND_219;
  reg [31:0] _RAND_220;
  reg [31:0] _RAND_221;
  reg [31:0] _RAND_222;
  reg [31:0] _RAND_223;
  reg [31:0] _RAND_224;
  reg [31:0] _RAND_225;
  reg [31:0] _RAND_226;
  reg [31:0] _RAND_227;
  reg [31:0] _RAND_228;
  reg [31:0] _RAND_229;
  reg [31:0] _RAND_230;
  reg [31:0] _RAND_231;
  reg [31:0] _RAND_232;
  reg [31:0] _RAND_233;
  reg [31:0] _RAND_234;
  reg [31:0] _RAND_235;
  reg [31:0] _RAND_236;
  reg [31:0] _RAND_237;
  reg [31:0] _RAND_238;
  reg [31:0] _RAND_239;
  reg [31:0] _RAND_240;
  reg [31:0] _RAND_241;
  reg [31:0] _RAND_242;
  reg [31:0] _RAND_243;
  reg [31:0] _RAND_244;
  reg [31:0] _RAND_245;
  reg [31:0] _RAND_246;
  reg [31:0] _RAND_247;
  reg [31:0] _RAND_248;
  reg [31:0] _RAND_249;
  reg [31:0] _RAND_250;
  reg [31:0] _RAND_251;
  reg [31:0] _RAND_252;
  reg [31:0] _RAND_253;
  reg [31:0] _RAND_254;
  reg [31:0] _RAND_255;
`endif // RANDOMIZE_REG_INIT
  reg  tag_mem_0_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_0_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_0_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_0_tag; // @[cache_single_port.scala 67:30]
  reg  tag_mem_1_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_1_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_1_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_1_tag; // @[cache_single_port.scala 67:30]
  reg  tag_mem_2_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_2_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_2_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_2_tag; // @[cache_single_port.scala 67:30]
  reg  tag_mem_3_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_3_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_3_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_3_tag; // @[cache_single_port.scala 67:30]
  reg  tag_mem_4_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_4_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_4_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_4_tag; // @[cache_single_port.scala 67:30]
  reg  tag_mem_5_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_5_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_5_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_5_tag; // @[cache_single_port.scala 67:30]
  reg  tag_mem_6_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_6_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_6_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_6_tag; // @[cache_single_port.scala 67:30]
  reg  tag_mem_7_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_7_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_7_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_7_tag; // @[cache_single_port.scala 67:30]
  reg  tag_mem_8_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_8_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_8_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_8_tag; // @[cache_single_port.scala 67:30]
  reg  tag_mem_9_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_9_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_9_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_9_tag; // @[cache_single_port.scala 67:30]
  reg  tag_mem_10_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_10_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_10_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_10_tag; // @[cache_single_port.scala 67:30]
  reg  tag_mem_11_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_11_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_11_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_11_tag; // @[cache_single_port.scala 67:30]
  reg  tag_mem_12_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_12_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_12_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_12_tag; // @[cache_single_port.scala 67:30]
  reg  tag_mem_13_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_13_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_13_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_13_tag; // @[cache_single_port.scala 67:30]
  reg  tag_mem_14_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_14_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_14_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_14_tag; // @[cache_single_port.scala 67:30]
  reg  tag_mem_15_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_15_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_15_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_15_tag; // @[cache_single_port.scala 67:30]
  reg  tag_mem_16_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_16_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_16_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_16_tag; // @[cache_single_port.scala 67:30]
  reg  tag_mem_17_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_17_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_17_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_17_tag; // @[cache_single_port.scala 67:30]
  reg  tag_mem_18_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_18_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_18_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_18_tag; // @[cache_single_port.scala 67:30]
  reg  tag_mem_19_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_19_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_19_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_19_tag; // @[cache_single_port.scala 67:30]
  reg  tag_mem_20_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_20_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_20_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_20_tag; // @[cache_single_port.scala 67:30]
  reg  tag_mem_21_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_21_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_21_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_21_tag; // @[cache_single_port.scala 67:30]
  reg  tag_mem_22_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_22_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_22_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_22_tag; // @[cache_single_port.scala 67:30]
  reg  tag_mem_23_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_23_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_23_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_23_tag; // @[cache_single_port.scala 67:30]
  reg  tag_mem_24_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_24_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_24_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_24_tag; // @[cache_single_port.scala 67:30]
  reg  tag_mem_25_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_25_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_25_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_25_tag; // @[cache_single_port.scala 67:30]
  reg  tag_mem_26_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_26_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_26_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_26_tag; // @[cache_single_port.scala 67:30]
  reg  tag_mem_27_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_27_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_27_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_27_tag; // @[cache_single_port.scala 67:30]
  reg  tag_mem_28_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_28_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_28_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_28_tag; // @[cache_single_port.scala 67:30]
  reg  tag_mem_29_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_29_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_29_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_29_tag; // @[cache_single_port.scala 67:30]
  reg  tag_mem_30_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_30_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_30_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_30_tag; // @[cache_single_port.scala 67:30]
  reg  tag_mem_31_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_31_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_31_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_31_tag; // @[cache_single_port.scala 67:30]
  reg  tag_mem_32_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_32_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_32_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_32_tag; // @[cache_single_port.scala 67:30]
  reg  tag_mem_33_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_33_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_33_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_33_tag; // @[cache_single_port.scala 67:30]
  reg  tag_mem_34_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_34_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_34_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_34_tag; // @[cache_single_port.scala 67:30]
  reg  tag_mem_35_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_35_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_35_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_35_tag; // @[cache_single_port.scala 67:30]
  reg  tag_mem_36_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_36_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_36_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_36_tag; // @[cache_single_port.scala 67:30]
  reg  tag_mem_37_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_37_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_37_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_37_tag; // @[cache_single_port.scala 67:30]
  reg  tag_mem_38_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_38_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_38_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_38_tag; // @[cache_single_port.scala 67:30]
  reg  tag_mem_39_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_39_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_39_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_39_tag; // @[cache_single_port.scala 67:30]
  reg  tag_mem_40_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_40_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_40_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_40_tag; // @[cache_single_port.scala 67:30]
  reg  tag_mem_41_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_41_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_41_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_41_tag; // @[cache_single_port.scala 67:30]
  reg  tag_mem_42_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_42_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_42_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_42_tag; // @[cache_single_port.scala 67:30]
  reg  tag_mem_43_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_43_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_43_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_43_tag; // @[cache_single_port.scala 67:30]
  reg  tag_mem_44_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_44_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_44_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_44_tag; // @[cache_single_port.scala 67:30]
  reg  tag_mem_45_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_45_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_45_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_45_tag; // @[cache_single_port.scala 67:30]
  reg  tag_mem_46_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_46_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_46_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_46_tag; // @[cache_single_port.scala 67:30]
  reg  tag_mem_47_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_47_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_47_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_47_tag; // @[cache_single_port.scala 67:30]
  reg  tag_mem_48_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_48_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_48_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_48_tag; // @[cache_single_port.scala 67:30]
  reg  tag_mem_49_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_49_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_49_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_49_tag; // @[cache_single_port.scala 67:30]
  reg  tag_mem_50_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_50_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_50_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_50_tag; // @[cache_single_port.scala 67:30]
  reg  tag_mem_51_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_51_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_51_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_51_tag; // @[cache_single_port.scala 67:30]
  reg  tag_mem_52_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_52_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_52_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_52_tag; // @[cache_single_port.scala 67:30]
  reg  tag_mem_53_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_53_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_53_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_53_tag; // @[cache_single_port.scala 67:30]
  reg  tag_mem_54_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_54_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_54_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_54_tag; // @[cache_single_port.scala 67:30]
  reg  tag_mem_55_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_55_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_55_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_55_tag; // @[cache_single_port.scala 67:30]
  reg  tag_mem_56_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_56_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_56_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_56_tag; // @[cache_single_port.scala 67:30]
  reg  tag_mem_57_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_57_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_57_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_57_tag; // @[cache_single_port.scala 67:30]
  reg  tag_mem_58_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_58_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_58_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_58_tag; // @[cache_single_port.scala 67:30]
  reg  tag_mem_59_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_59_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_59_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_59_tag; // @[cache_single_port.scala 67:30]
  reg  tag_mem_60_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_60_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_60_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_60_tag; // @[cache_single_port.scala 67:30]
  reg  tag_mem_61_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_61_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_61_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_61_tag; // @[cache_single_port.scala 67:30]
  reg  tag_mem_62_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_62_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_62_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_62_tag; // @[cache_single_port.scala 67:30]
  reg  tag_mem_63_valid; // @[cache_single_port.scala 67:30]
  reg  tag_mem_63_dirty; // @[cache_single_port.scala 67:30]
  reg [7:0] tag_mem_63_visit; // @[cache_single_port.scala 67:30]
  reg [21:0] tag_mem_63_tag; // @[cache_single_port.scala 67:30]
  wire [21:0] _GEN_1 = 6'h1 == io_cache_req_index ? tag_mem_1_tag : tag_mem_0_tag; // @[cache_single_port.scala 68:{21,21}]
  wire [21:0] _GEN_2 = 6'h2 == io_cache_req_index ? tag_mem_2_tag : _GEN_1; // @[cache_single_port.scala 68:{21,21}]
  wire [21:0] _GEN_3 = 6'h3 == io_cache_req_index ? tag_mem_3_tag : _GEN_2; // @[cache_single_port.scala 68:{21,21}]
  wire [21:0] _GEN_4 = 6'h4 == io_cache_req_index ? tag_mem_4_tag : _GEN_3; // @[cache_single_port.scala 68:{21,21}]
  wire [21:0] _GEN_5 = 6'h5 == io_cache_req_index ? tag_mem_5_tag : _GEN_4; // @[cache_single_port.scala 68:{21,21}]
  wire [21:0] _GEN_6 = 6'h6 == io_cache_req_index ? tag_mem_6_tag : _GEN_5; // @[cache_single_port.scala 68:{21,21}]
  wire [21:0] _GEN_7 = 6'h7 == io_cache_req_index ? tag_mem_7_tag : _GEN_6; // @[cache_single_port.scala 68:{21,21}]
  wire [21:0] _GEN_8 = 6'h8 == io_cache_req_index ? tag_mem_8_tag : _GEN_7; // @[cache_single_port.scala 68:{21,21}]
  wire [21:0] _GEN_9 = 6'h9 == io_cache_req_index ? tag_mem_9_tag : _GEN_8; // @[cache_single_port.scala 68:{21,21}]
  wire [21:0] _GEN_10 = 6'ha == io_cache_req_index ? tag_mem_10_tag : _GEN_9; // @[cache_single_port.scala 68:{21,21}]
  wire [21:0] _GEN_11 = 6'hb == io_cache_req_index ? tag_mem_11_tag : _GEN_10; // @[cache_single_port.scala 68:{21,21}]
  wire [21:0] _GEN_12 = 6'hc == io_cache_req_index ? tag_mem_12_tag : _GEN_11; // @[cache_single_port.scala 68:{21,21}]
  wire [21:0] _GEN_13 = 6'hd == io_cache_req_index ? tag_mem_13_tag : _GEN_12; // @[cache_single_port.scala 68:{21,21}]
  wire [21:0] _GEN_14 = 6'he == io_cache_req_index ? tag_mem_14_tag : _GEN_13; // @[cache_single_port.scala 68:{21,21}]
  wire [21:0] _GEN_15 = 6'hf == io_cache_req_index ? tag_mem_15_tag : _GEN_14; // @[cache_single_port.scala 68:{21,21}]
  wire [21:0] _GEN_16 = 6'h10 == io_cache_req_index ? tag_mem_16_tag : _GEN_15; // @[cache_single_port.scala 68:{21,21}]
  wire [21:0] _GEN_17 = 6'h11 == io_cache_req_index ? tag_mem_17_tag : _GEN_16; // @[cache_single_port.scala 68:{21,21}]
  wire [21:0] _GEN_18 = 6'h12 == io_cache_req_index ? tag_mem_18_tag : _GEN_17; // @[cache_single_port.scala 68:{21,21}]
  wire [21:0] _GEN_19 = 6'h13 == io_cache_req_index ? tag_mem_19_tag : _GEN_18; // @[cache_single_port.scala 68:{21,21}]
  wire [21:0] _GEN_20 = 6'h14 == io_cache_req_index ? tag_mem_20_tag : _GEN_19; // @[cache_single_port.scala 68:{21,21}]
  wire [21:0] _GEN_21 = 6'h15 == io_cache_req_index ? tag_mem_21_tag : _GEN_20; // @[cache_single_port.scala 68:{21,21}]
  wire [21:0] _GEN_22 = 6'h16 == io_cache_req_index ? tag_mem_22_tag : _GEN_21; // @[cache_single_port.scala 68:{21,21}]
  wire [21:0] _GEN_23 = 6'h17 == io_cache_req_index ? tag_mem_23_tag : _GEN_22; // @[cache_single_port.scala 68:{21,21}]
  wire [21:0] _GEN_24 = 6'h18 == io_cache_req_index ? tag_mem_24_tag : _GEN_23; // @[cache_single_port.scala 68:{21,21}]
  wire [21:0] _GEN_25 = 6'h19 == io_cache_req_index ? tag_mem_25_tag : _GEN_24; // @[cache_single_port.scala 68:{21,21}]
  wire [21:0] _GEN_26 = 6'h1a == io_cache_req_index ? tag_mem_26_tag : _GEN_25; // @[cache_single_port.scala 68:{21,21}]
  wire [21:0] _GEN_27 = 6'h1b == io_cache_req_index ? tag_mem_27_tag : _GEN_26; // @[cache_single_port.scala 68:{21,21}]
  wire [21:0] _GEN_28 = 6'h1c == io_cache_req_index ? tag_mem_28_tag : _GEN_27; // @[cache_single_port.scala 68:{21,21}]
  wire [21:0] _GEN_29 = 6'h1d == io_cache_req_index ? tag_mem_29_tag : _GEN_28; // @[cache_single_port.scala 68:{21,21}]
  wire [21:0] _GEN_30 = 6'h1e == io_cache_req_index ? tag_mem_30_tag : _GEN_29; // @[cache_single_port.scala 68:{21,21}]
  wire [21:0] _GEN_31 = 6'h1f == io_cache_req_index ? tag_mem_31_tag : _GEN_30; // @[cache_single_port.scala 68:{21,21}]
  wire [21:0] _GEN_32 = 6'h20 == io_cache_req_index ? tag_mem_32_tag : _GEN_31; // @[cache_single_port.scala 68:{21,21}]
  wire [21:0] _GEN_33 = 6'h21 == io_cache_req_index ? tag_mem_33_tag : _GEN_32; // @[cache_single_port.scala 68:{21,21}]
  wire [21:0] _GEN_34 = 6'h22 == io_cache_req_index ? tag_mem_34_tag : _GEN_33; // @[cache_single_port.scala 68:{21,21}]
  wire [21:0] _GEN_35 = 6'h23 == io_cache_req_index ? tag_mem_35_tag : _GEN_34; // @[cache_single_port.scala 68:{21,21}]
  wire [21:0] _GEN_36 = 6'h24 == io_cache_req_index ? tag_mem_36_tag : _GEN_35; // @[cache_single_port.scala 68:{21,21}]
  wire [21:0] _GEN_37 = 6'h25 == io_cache_req_index ? tag_mem_37_tag : _GEN_36; // @[cache_single_port.scala 68:{21,21}]
  wire [21:0] _GEN_38 = 6'h26 == io_cache_req_index ? tag_mem_38_tag : _GEN_37; // @[cache_single_port.scala 68:{21,21}]
  wire [21:0] _GEN_39 = 6'h27 == io_cache_req_index ? tag_mem_39_tag : _GEN_38; // @[cache_single_port.scala 68:{21,21}]
  wire [21:0] _GEN_40 = 6'h28 == io_cache_req_index ? tag_mem_40_tag : _GEN_39; // @[cache_single_port.scala 68:{21,21}]
  wire [21:0] _GEN_41 = 6'h29 == io_cache_req_index ? tag_mem_41_tag : _GEN_40; // @[cache_single_port.scala 68:{21,21}]
  wire [21:0] _GEN_42 = 6'h2a == io_cache_req_index ? tag_mem_42_tag : _GEN_41; // @[cache_single_port.scala 68:{21,21}]
  wire [21:0] _GEN_43 = 6'h2b == io_cache_req_index ? tag_mem_43_tag : _GEN_42; // @[cache_single_port.scala 68:{21,21}]
  wire [21:0] _GEN_44 = 6'h2c == io_cache_req_index ? tag_mem_44_tag : _GEN_43; // @[cache_single_port.scala 68:{21,21}]
  wire [21:0] _GEN_45 = 6'h2d == io_cache_req_index ? tag_mem_45_tag : _GEN_44; // @[cache_single_port.scala 68:{21,21}]
  wire [21:0] _GEN_46 = 6'h2e == io_cache_req_index ? tag_mem_46_tag : _GEN_45; // @[cache_single_port.scala 68:{21,21}]
  wire [21:0] _GEN_47 = 6'h2f == io_cache_req_index ? tag_mem_47_tag : _GEN_46; // @[cache_single_port.scala 68:{21,21}]
  wire [21:0] _GEN_48 = 6'h30 == io_cache_req_index ? tag_mem_48_tag : _GEN_47; // @[cache_single_port.scala 68:{21,21}]
  wire [21:0] _GEN_49 = 6'h31 == io_cache_req_index ? tag_mem_49_tag : _GEN_48; // @[cache_single_port.scala 68:{21,21}]
  wire [21:0] _GEN_50 = 6'h32 == io_cache_req_index ? tag_mem_50_tag : _GEN_49; // @[cache_single_port.scala 68:{21,21}]
  wire [21:0] _GEN_51 = 6'h33 == io_cache_req_index ? tag_mem_51_tag : _GEN_50; // @[cache_single_port.scala 68:{21,21}]
  wire [21:0] _GEN_52 = 6'h34 == io_cache_req_index ? tag_mem_52_tag : _GEN_51; // @[cache_single_port.scala 68:{21,21}]
  wire [21:0] _GEN_53 = 6'h35 == io_cache_req_index ? tag_mem_53_tag : _GEN_52; // @[cache_single_port.scala 68:{21,21}]
  wire [21:0] _GEN_54 = 6'h36 == io_cache_req_index ? tag_mem_54_tag : _GEN_53; // @[cache_single_port.scala 68:{21,21}]
  wire [21:0] _GEN_55 = 6'h37 == io_cache_req_index ? tag_mem_55_tag : _GEN_54; // @[cache_single_port.scala 68:{21,21}]
  wire [21:0] _GEN_56 = 6'h38 == io_cache_req_index ? tag_mem_56_tag : _GEN_55; // @[cache_single_port.scala 68:{21,21}]
  wire [21:0] _GEN_57 = 6'h39 == io_cache_req_index ? tag_mem_57_tag : _GEN_56; // @[cache_single_port.scala 68:{21,21}]
  wire [21:0] _GEN_58 = 6'h3a == io_cache_req_index ? tag_mem_58_tag : _GEN_57; // @[cache_single_port.scala 68:{21,21}]
  wire [21:0] _GEN_59 = 6'h3b == io_cache_req_index ? tag_mem_59_tag : _GEN_58; // @[cache_single_port.scala 68:{21,21}]
  wire [21:0] _GEN_60 = 6'h3c == io_cache_req_index ? tag_mem_60_tag : _GEN_59; // @[cache_single_port.scala 68:{21,21}]
  wire [21:0] _GEN_61 = 6'h3d == io_cache_req_index ? tag_mem_61_tag : _GEN_60; // @[cache_single_port.scala 68:{21,21}]
  wire [21:0] _GEN_62 = 6'h3e == io_cache_req_index ? tag_mem_62_tag : _GEN_61; // @[cache_single_port.scala 68:{21,21}]
  wire [7:0] _GEN_65 = 6'h1 == io_cache_req_index ? tag_mem_1_visit : tag_mem_0_visit; // @[cache_single_port.scala 68:{21,21}]
  wire [7:0] _GEN_66 = 6'h2 == io_cache_req_index ? tag_mem_2_visit : _GEN_65; // @[cache_single_port.scala 68:{21,21}]
  wire [7:0] _GEN_67 = 6'h3 == io_cache_req_index ? tag_mem_3_visit : _GEN_66; // @[cache_single_port.scala 68:{21,21}]
  wire [7:0] _GEN_68 = 6'h4 == io_cache_req_index ? tag_mem_4_visit : _GEN_67; // @[cache_single_port.scala 68:{21,21}]
  wire [7:0] _GEN_69 = 6'h5 == io_cache_req_index ? tag_mem_5_visit : _GEN_68; // @[cache_single_port.scala 68:{21,21}]
  wire [7:0] _GEN_70 = 6'h6 == io_cache_req_index ? tag_mem_6_visit : _GEN_69; // @[cache_single_port.scala 68:{21,21}]
  wire [7:0] _GEN_71 = 6'h7 == io_cache_req_index ? tag_mem_7_visit : _GEN_70; // @[cache_single_port.scala 68:{21,21}]
  wire [7:0] _GEN_72 = 6'h8 == io_cache_req_index ? tag_mem_8_visit : _GEN_71; // @[cache_single_port.scala 68:{21,21}]
  wire [7:0] _GEN_73 = 6'h9 == io_cache_req_index ? tag_mem_9_visit : _GEN_72; // @[cache_single_port.scala 68:{21,21}]
  wire [7:0] _GEN_74 = 6'ha == io_cache_req_index ? tag_mem_10_visit : _GEN_73; // @[cache_single_port.scala 68:{21,21}]
  wire [7:0] _GEN_75 = 6'hb == io_cache_req_index ? tag_mem_11_visit : _GEN_74; // @[cache_single_port.scala 68:{21,21}]
  wire [7:0] _GEN_76 = 6'hc == io_cache_req_index ? tag_mem_12_visit : _GEN_75; // @[cache_single_port.scala 68:{21,21}]
  wire [7:0] _GEN_77 = 6'hd == io_cache_req_index ? tag_mem_13_visit : _GEN_76; // @[cache_single_port.scala 68:{21,21}]
  wire [7:0] _GEN_78 = 6'he == io_cache_req_index ? tag_mem_14_visit : _GEN_77; // @[cache_single_port.scala 68:{21,21}]
  wire [7:0] _GEN_79 = 6'hf == io_cache_req_index ? tag_mem_15_visit : _GEN_78; // @[cache_single_port.scala 68:{21,21}]
  wire [7:0] _GEN_80 = 6'h10 == io_cache_req_index ? tag_mem_16_visit : _GEN_79; // @[cache_single_port.scala 68:{21,21}]
  wire [7:0] _GEN_81 = 6'h11 == io_cache_req_index ? tag_mem_17_visit : _GEN_80; // @[cache_single_port.scala 68:{21,21}]
  wire [7:0] _GEN_82 = 6'h12 == io_cache_req_index ? tag_mem_18_visit : _GEN_81; // @[cache_single_port.scala 68:{21,21}]
  wire [7:0] _GEN_83 = 6'h13 == io_cache_req_index ? tag_mem_19_visit : _GEN_82; // @[cache_single_port.scala 68:{21,21}]
  wire [7:0] _GEN_84 = 6'h14 == io_cache_req_index ? tag_mem_20_visit : _GEN_83; // @[cache_single_port.scala 68:{21,21}]
  wire [7:0] _GEN_85 = 6'h15 == io_cache_req_index ? tag_mem_21_visit : _GEN_84; // @[cache_single_port.scala 68:{21,21}]
  wire [7:0] _GEN_86 = 6'h16 == io_cache_req_index ? tag_mem_22_visit : _GEN_85; // @[cache_single_port.scala 68:{21,21}]
  wire [7:0] _GEN_87 = 6'h17 == io_cache_req_index ? tag_mem_23_visit : _GEN_86; // @[cache_single_port.scala 68:{21,21}]
  wire [7:0] _GEN_88 = 6'h18 == io_cache_req_index ? tag_mem_24_visit : _GEN_87; // @[cache_single_port.scala 68:{21,21}]
  wire [7:0] _GEN_89 = 6'h19 == io_cache_req_index ? tag_mem_25_visit : _GEN_88; // @[cache_single_port.scala 68:{21,21}]
  wire [7:0] _GEN_90 = 6'h1a == io_cache_req_index ? tag_mem_26_visit : _GEN_89; // @[cache_single_port.scala 68:{21,21}]
  wire [7:0] _GEN_91 = 6'h1b == io_cache_req_index ? tag_mem_27_visit : _GEN_90; // @[cache_single_port.scala 68:{21,21}]
  wire [7:0] _GEN_92 = 6'h1c == io_cache_req_index ? tag_mem_28_visit : _GEN_91; // @[cache_single_port.scala 68:{21,21}]
  wire [7:0] _GEN_93 = 6'h1d == io_cache_req_index ? tag_mem_29_visit : _GEN_92; // @[cache_single_port.scala 68:{21,21}]
  wire [7:0] _GEN_94 = 6'h1e == io_cache_req_index ? tag_mem_30_visit : _GEN_93; // @[cache_single_port.scala 68:{21,21}]
  wire [7:0] _GEN_95 = 6'h1f == io_cache_req_index ? tag_mem_31_visit : _GEN_94; // @[cache_single_port.scala 68:{21,21}]
  wire [7:0] _GEN_96 = 6'h20 == io_cache_req_index ? tag_mem_32_visit : _GEN_95; // @[cache_single_port.scala 68:{21,21}]
  wire [7:0] _GEN_97 = 6'h21 == io_cache_req_index ? tag_mem_33_visit : _GEN_96; // @[cache_single_port.scala 68:{21,21}]
  wire [7:0] _GEN_98 = 6'h22 == io_cache_req_index ? tag_mem_34_visit : _GEN_97; // @[cache_single_port.scala 68:{21,21}]
  wire [7:0] _GEN_99 = 6'h23 == io_cache_req_index ? tag_mem_35_visit : _GEN_98; // @[cache_single_port.scala 68:{21,21}]
  wire [7:0] _GEN_100 = 6'h24 == io_cache_req_index ? tag_mem_36_visit : _GEN_99; // @[cache_single_port.scala 68:{21,21}]
  wire [7:0] _GEN_101 = 6'h25 == io_cache_req_index ? tag_mem_37_visit : _GEN_100; // @[cache_single_port.scala 68:{21,21}]
  wire [7:0] _GEN_102 = 6'h26 == io_cache_req_index ? tag_mem_38_visit : _GEN_101; // @[cache_single_port.scala 68:{21,21}]
  wire [7:0] _GEN_103 = 6'h27 == io_cache_req_index ? tag_mem_39_visit : _GEN_102; // @[cache_single_port.scala 68:{21,21}]
  wire [7:0] _GEN_104 = 6'h28 == io_cache_req_index ? tag_mem_40_visit : _GEN_103; // @[cache_single_port.scala 68:{21,21}]
  wire [7:0] _GEN_105 = 6'h29 == io_cache_req_index ? tag_mem_41_visit : _GEN_104; // @[cache_single_port.scala 68:{21,21}]
  wire [7:0] _GEN_106 = 6'h2a == io_cache_req_index ? tag_mem_42_visit : _GEN_105; // @[cache_single_port.scala 68:{21,21}]
  wire [7:0] _GEN_107 = 6'h2b == io_cache_req_index ? tag_mem_43_visit : _GEN_106; // @[cache_single_port.scala 68:{21,21}]
  wire [7:0] _GEN_108 = 6'h2c == io_cache_req_index ? tag_mem_44_visit : _GEN_107; // @[cache_single_port.scala 68:{21,21}]
  wire [7:0] _GEN_109 = 6'h2d == io_cache_req_index ? tag_mem_45_visit : _GEN_108; // @[cache_single_port.scala 68:{21,21}]
  wire [7:0] _GEN_110 = 6'h2e == io_cache_req_index ? tag_mem_46_visit : _GEN_109; // @[cache_single_port.scala 68:{21,21}]
  wire [7:0] _GEN_111 = 6'h2f == io_cache_req_index ? tag_mem_47_visit : _GEN_110; // @[cache_single_port.scala 68:{21,21}]
  wire [7:0] _GEN_112 = 6'h30 == io_cache_req_index ? tag_mem_48_visit : _GEN_111; // @[cache_single_port.scala 68:{21,21}]
  wire [7:0] _GEN_113 = 6'h31 == io_cache_req_index ? tag_mem_49_visit : _GEN_112; // @[cache_single_port.scala 68:{21,21}]
  wire [7:0] _GEN_114 = 6'h32 == io_cache_req_index ? tag_mem_50_visit : _GEN_113; // @[cache_single_port.scala 68:{21,21}]
  wire [7:0] _GEN_115 = 6'h33 == io_cache_req_index ? tag_mem_51_visit : _GEN_114; // @[cache_single_port.scala 68:{21,21}]
  wire [7:0] _GEN_116 = 6'h34 == io_cache_req_index ? tag_mem_52_visit : _GEN_115; // @[cache_single_port.scala 68:{21,21}]
  wire [7:0] _GEN_117 = 6'h35 == io_cache_req_index ? tag_mem_53_visit : _GEN_116; // @[cache_single_port.scala 68:{21,21}]
  wire [7:0] _GEN_118 = 6'h36 == io_cache_req_index ? tag_mem_54_visit : _GEN_117; // @[cache_single_port.scala 68:{21,21}]
  wire [7:0] _GEN_119 = 6'h37 == io_cache_req_index ? tag_mem_55_visit : _GEN_118; // @[cache_single_port.scala 68:{21,21}]
  wire [7:0] _GEN_120 = 6'h38 == io_cache_req_index ? tag_mem_56_visit : _GEN_119; // @[cache_single_port.scala 68:{21,21}]
  wire [7:0] _GEN_121 = 6'h39 == io_cache_req_index ? tag_mem_57_visit : _GEN_120; // @[cache_single_port.scala 68:{21,21}]
  wire [7:0] _GEN_122 = 6'h3a == io_cache_req_index ? tag_mem_58_visit : _GEN_121; // @[cache_single_port.scala 68:{21,21}]
  wire [7:0] _GEN_123 = 6'h3b == io_cache_req_index ? tag_mem_59_visit : _GEN_122; // @[cache_single_port.scala 68:{21,21}]
  wire [7:0] _GEN_124 = 6'h3c == io_cache_req_index ? tag_mem_60_visit : _GEN_123; // @[cache_single_port.scala 68:{21,21}]
  wire [7:0] _GEN_125 = 6'h3d == io_cache_req_index ? tag_mem_61_visit : _GEN_124; // @[cache_single_port.scala 68:{21,21}]
  wire [7:0] _GEN_126 = 6'h3e == io_cache_req_index ? tag_mem_62_visit : _GEN_125; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_129 = 6'h1 == io_cache_req_index ? tag_mem_1_dirty : tag_mem_0_dirty; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_130 = 6'h2 == io_cache_req_index ? tag_mem_2_dirty : _GEN_129; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_131 = 6'h3 == io_cache_req_index ? tag_mem_3_dirty : _GEN_130; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_132 = 6'h4 == io_cache_req_index ? tag_mem_4_dirty : _GEN_131; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_133 = 6'h5 == io_cache_req_index ? tag_mem_5_dirty : _GEN_132; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_134 = 6'h6 == io_cache_req_index ? tag_mem_6_dirty : _GEN_133; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_135 = 6'h7 == io_cache_req_index ? tag_mem_7_dirty : _GEN_134; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_136 = 6'h8 == io_cache_req_index ? tag_mem_8_dirty : _GEN_135; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_137 = 6'h9 == io_cache_req_index ? tag_mem_9_dirty : _GEN_136; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_138 = 6'ha == io_cache_req_index ? tag_mem_10_dirty : _GEN_137; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_139 = 6'hb == io_cache_req_index ? tag_mem_11_dirty : _GEN_138; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_140 = 6'hc == io_cache_req_index ? tag_mem_12_dirty : _GEN_139; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_141 = 6'hd == io_cache_req_index ? tag_mem_13_dirty : _GEN_140; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_142 = 6'he == io_cache_req_index ? tag_mem_14_dirty : _GEN_141; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_143 = 6'hf == io_cache_req_index ? tag_mem_15_dirty : _GEN_142; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_144 = 6'h10 == io_cache_req_index ? tag_mem_16_dirty : _GEN_143; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_145 = 6'h11 == io_cache_req_index ? tag_mem_17_dirty : _GEN_144; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_146 = 6'h12 == io_cache_req_index ? tag_mem_18_dirty : _GEN_145; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_147 = 6'h13 == io_cache_req_index ? tag_mem_19_dirty : _GEN_146; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_148 = 6'h14 == io_cache_req_index ? tag_mem_20_dirty : _GEN_147; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_149 = 6'h15 == io_cache_req_index ? tag_mem_21_dirty : _GEN_148; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_150 = 6'h16 == io_cache_req_index ? tag_mem_22_dirty : _GEN_149; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_151 = 6'h17 == io_cache_req_index ? tag_mem_23_dirty : _GEN_150; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_152 = 6'h18 == io_cache_req_index ? tag_mem_24_dirty : _GEN_151; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_153 = 6'h19 == io_cache_req_index ? tag_mem_25_dirty : _GEN_152; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_154 = 6'h1a == io_cache_req_index ? tag_mem_26_dirty : _GEN_153; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_155 = 6'h1b == io_cache_req_index ? tag_mem_27_dirty : _GEN_154; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_156 = 6'h1c == io_cache_req_index ? tag_mem_28_dirty : _GEN_155; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_157 = 6'h1d == io_cache_req_index ? tag_mem_29_dirty : _GEN_156; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_158 = 6'h1e == io_cache_req_index ? tag_mem_30_dirty : _GEN_157; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_159 = 6'h1f == io_cache_req_index ? tag_mem_31_dirty : _GEN_158; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_160 = 6'h20 == io_cache_req_index ? tag_mem_32_dirty : _GEN_159; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_161 = 6'h21 == io_cache_req_index ? tag_mem_33_dirty : _GEN_160; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_162 = 6'h22 == io_cache_req_index ? tag_mem_34_dirty : _GEN_161; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_163 = 6'h23 == io_cache_req_index ? tag_mem_35_dirty : _GEN_162; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_164 = 6'h24 == io_cache_req_index ? tag_mem_36_dirty : _GEN_163; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_165 = 6'h25 == io_cache_req_index ? tag_mem_37_dirty : _GEN_164; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_166 = 6'h26 == io_cache_req_index ? tag_mem_38_dirty : _GEN_165; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_167 = 6'h27 == io_cache_req_index ? tag_mem_39_dirty : _GEN_166; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_168 = 6'h28 == io_cache_req_index ? tag_mem_40_dirty : _GEN_167; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_169 = 6'h29 == io_cache_req_index ? tag_mem_41_dirty : _GEN_168; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_170 = 6'h2a == io_cache_req_index ? tag_mem_42_dirty : _GEN_169; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_171 = 6'h2b == io_cache_req_index ? tag_mem_43_dirty : _GEN_170; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_172 = 6'h2c == io_cache_req_index ? tag_mem_44_dirty : _GEN_171; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_173 = 6'h2d == io_cache_req_index ? tag_mem_45_dirty : _GEN_172; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_174 = 6'h2e == io_cache_req_index ? tag_mem_46_dirty : _GEN_173; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_175 = 6'h2f == io_cache_req_index ? tag_mem_47_dirty : _GEN_174; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_176 = 6'h30 == io_cache_req_index ? tag_mem_48_dirty : _GEN_175; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_177 = 6'h31 == io_cache_req_index ? tag_mem_49_dirty : _GEN_176; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_178 = 6'h32 == io_cache_req_index ? tag_mem_50_dirty : _GEN_177; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_179 = 6'h33 == io_cache_req_index ? tag_mem_51_dirty : _GEN_178; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_180 = 6'h34 == io_cache_req_index ? tag_mem_52_dirty : _GEN_179; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_181 = 6'h35 == io_cache_req_index ? tag_mem_53_dirty : _GEN_180; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_182 = 6'h36 == io_cache_req_index ? tag_mem_54_dirty : _GEN_181; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_183 = 6'h37 == io_cache_req_index ? tag_mem_55_dirty : _GEN_182; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_184 = 6'h38 == io_cache_req_index ? tag_mem_56_dirty : _GEN_183; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_185 = 6'h39 == io_cache_req_index ? tag_mem_57_dirty : _GEN_184; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_186 = 6'h3a == io_cache_req_index ? tag_mem_58_dirty : _GEN_185; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_187 = 6'h3b == io_cache_req_index ? tag_mem_59_dirty : _GEN_186; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_188 = 6'h3c == io_cache_req_index ? tag_mem_60_dirty : _GEN_187; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_189 = 6'h3d == io_cache_req_index ? tag_mem_61_dirty : _GEN_188; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_190 = 6'h3e == io_cache_req_index ? tag_mem_62_dirty : _GEN_189; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_193 = 6'h1 == io_cache_req_index ? tag_mem_1_valid : tag_mem_0_valid; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_194 = 6'h2 == io_cache_req_index ? tag_mem_2_valid : _GEN_193; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_195 = 6'h3 == io_cache_req_index ? tag_mem_3_valid : _GEN_194; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_196 = 6'h4 == io_cache_req_index ? tag_mem_4_valid : _GEN_195; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_197 = 6'h5 == io_cache_req_index ? tag_mem_5_valid : _GEN_196; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_198 = 6'h6 == io_cache_req_index ? tag_mem_6_valid : _GEN_197; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_199 = 6'h7 == io_cache_req_index ? tag_mem_7_valid : _GEN_198; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_200 = 6'h8 == io_cache_req_index ? tag_mem_8_valid : _GEN_199; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_201 = 6'h9 == io_cache_req_index ? tag_mem_9_valid : _GEN_200; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_202 = 6'ha == io_cache_req_index ? tag_mem_10_valid : _GEN_201; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_203 = 6'hb == io_cache_req_index ? tag_mem_11_valid : _GEN_202; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_204 = 6'hc == io_cache_req_index ? tag_mem_12_valid : _GEN_203; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_205 = 6'hd == io_cache_req_index ? tag_mem_13_valid : _GEN_204; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_206 = 6'he == io_cache_req_index ? tag_mem_14_valid : _GEN_205; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_207 = 6'hf == io_cache_req_index ? tag_mem_15_valid : _GEN_206; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_208 = 6'h10 == io_cache_req_index ? tag_mem_16_valid : _GEN_207; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_209 = 6'h11 == io_cache_req_index ? tag_mem_17_valid : _GEN_208; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_210 = 6'h12 == io_cache_req_index ? tag_mem_18_valid : _GEN_209; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_211 = 6'h13 == io_cache_req_index ? tag_mem_19_valid : _GEN_210; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_212 = 6'h14 == io_cache_req_index ? tag_mem_20_valid : _GEN_211; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_213 = 6'h15 == io_cache_req_index ? tag_mem_21_valid : _GEN_212; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_214 = 6'h16 == io_cache_req_index ? tag_mem_22_valid : _GEN_213; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_215 = 6'h17 == io_cache_req_index ? tag_mem_23_valid : _GEN_214; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_216 = 6'h18 == io_cache_req_index ? tag_mem_24_valid : _GEN_215; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_217 = 6'h19 == io_cache_req_index ? tag_mem_25_valid : _GEN_216; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_218 = 6'h1a == io_cache_req_index ? tag_mem_26_valid : _GEN_217; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_219 = 6'h1b == io_cache_req_index ? tag_mem_27_valid : _GEN_218; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_220 = 6'h1c == io_cache_req_index ? tag_mem_28_valid : _GEN_219; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_221 = 6'h1d == io_cache_req_index ? tag_mem_29_valid : _GEN_220; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_222 = 6'h1e == io_cache_req_index ? tag_mem_30_valid : _GEN_221; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_223 = 6'h1f == io_cache_req_index ? tag_mem_31_valid : _GEN_222; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_224 = 6'h20 == io_cache_req_index ? tag_mem_32_valid : _GEN_223; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_225 = 6'h21 == io_cache_req_index ? tag_mem_33_valid : _GEN_224; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_226 = 6'h22 == io_cache_req_index ? tag_mem_34_valid : _GEN_225; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_227 = 6'h23 == io_cache_req_index ? tag_mem_35_valid : _GEN_226; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_228 = 6'h24 == io_cache_req_index ? tag_mem_36_valid : _GEN_227; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_229 = 6'h25 == io_cache_req_index ? tag_mem_37_valid : _GEN_228; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_230 = 6'h26 == io_cache_req_index ? tag_mem_38_valid : _GEN_229; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_231 = 6'h27 == io_cache_req_index ? tag_mem_39_valid : _GEN_230; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_232 = 6'h28 == io_cache_req_index ? tag_mem_40_valid : _GEN_231; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_233 = 6'h29 == io_cache_req_index ? tag_mem_41_valid : _GEN_232; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_234 = 6'h2a == io_cache_req_index ? tag_mem_42_valid : _GEN_233; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_235 = 6'h2b == io_cache_req_index ? tag_mem_43_valid : _GEN_234; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_236 = 6'h2c == io_cache_req_index ? tag_mem_44_valid : _GEN_235; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_237 = 6'h2d == io_cache_req_index ? tag_mem_45_valid : _GEN_236; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_238 = 6'h2e == io_cache_req_index ? tag_mem_46_valid : _GEN_237; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_239 = 6'h2f == io_cache_req_index ? tag_mem_47_valid : _GEN_238; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_240 = 6'h30 == io_cache_req_index ? tag_mem_48_valid : _GEN_239; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_241 = 6'h31 == io_cache_req_index ? tag_mem_49_valid : _GEN_240; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_242 = 6'h32 == io_cache_req_index ? tag_mem_50_valid : _GEN_241; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_243 = 6'h33 == io_cache_req_index ? tag_mem_51_valid : _GEN_242; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_244 = 6'h34 == io_cache_req_index ? tag_mem_52_valid : _GEN_243; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_245 = 6'h35 == io_cache_req_index ? tag_mem_53_valid : _GEN_244; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_246 = 6'h36 == io_cache_req_index ? tag_mem_54_valid : _GEN_245; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_247 = 6'h37 == io_cache_req_index ? tag_mem_55_valid : _GEN_246; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_248 = 6'h38 == io_cache_req_index ? tag_mem_56_valid : _GEN_247; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_249 = 6'h39 == io_cache_req_index ? tag_mem_57_valid : _GEN_248; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_250 = 6'h3a == io_cache_req_index ? tag_mem_58_valid : _GEN_249; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_251 = 6'h3b == io_cache_req_index ? tag_mem_59_valid : _GEN_250; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_252 = 6'h3c == io_cache_req_index ? tag_mem_60_valid : _GEN_251; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_253 = 6'h3d == io_cache_req_index ? tag_mem_61_valid : _GEN_252; // @[cache_single_port.scala 68:{21,21}]
  wire  _GEN_254 = 6'h3e == io_cache_req_index ? tag_mem_62_valid : _GEN_253; // @[cache_single_port.scala 68:{21,21}]
  assign io_tag_read_valid = 6'h3f == io_cache_req_index ? tag_mem_63_valid : _GEN_254; // @[cache_single_port.scala 68:{21,21}]
  assign io_tag_read_dirty = 6'h3f == io_cache_req_index ? tag_mem_63_dirty : _GEN_190; // @[cache_single_port.scala 68:{21,21}]
  assign io_tag_read_visit = 6'h3f == io_cache_req_index ? tag_mem_63_visit : _GEN_126; // @[cache_single_port.scala 68:{21,21}]
  assign io_tag_read_tag = 6'h3f == io_cache_req_index ? tag_mem_63_tag : _GEN_62; // @[cache_single_port.scala 68:{21,21}]
  always @(posedge clock) begin
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_0_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h0 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_0_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_0_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h0 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_0_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_0_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h0 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_0_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_0_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h0 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_0_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_1_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h1 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_1_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_1_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h1 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_1_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_1_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h1 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_1_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_1_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h1 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_1_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_2_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h2 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_2_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_2_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h2 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_2_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_2_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h2 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_2_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_2_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h2 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_2_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_3_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h3 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_3_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_3_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h3 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_3_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_3_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h3 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_3_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_3_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h3 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_3_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_4_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h4 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_4_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_4_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h4 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_4_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_4_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h4 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_4_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_4_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h4 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_4_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_5_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h5 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_5_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_5_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h5 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_5_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_5_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h5 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_5_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_5_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h5 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_5_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_6_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h6 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_6_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_6_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h6 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_6_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_6_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h6 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_6_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_6_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h6 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_6_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_7_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h7 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_7_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_7_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h7 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_7_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_7_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h7 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_7_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_7_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h7 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_7_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_8_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h8 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_8_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_8_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h8 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_8_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_8_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h8 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_8_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_8_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h8 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_8_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_9_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h9 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_9_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_9_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h9 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_9_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_9_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h9 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_9_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_9_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h9 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_9_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_10_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'ha == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_10_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_10_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'ha == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_10_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_10_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'ha == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_10_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_10_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'ha == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_10_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_11_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'hb == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_11_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_11_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'hb == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_11_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_11_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'hb == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_11_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_11_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'hb == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_11_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_12_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'hc == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_12_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_12_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'hc == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_12_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_12_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'hc == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_12_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_12_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'hc == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_12_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_13_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'hd == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_13_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_13_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'hd == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_13_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_13_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'hd == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_13_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_13_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'hd == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_13_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_14_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'he == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_14_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_14_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'he == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_14_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_14_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'he == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_14_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_14_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'he == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_14_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_15_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'hf == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_15_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_15_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'hf == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_15_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_15_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'hf == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_15_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_15_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'hf == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_15_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_16_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h10 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_16_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_16_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h10 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_16_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_16_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h10 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_16_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_16_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h10 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_16_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_17_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h11 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_17_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_17_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h11 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_17_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_17_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h11 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_17_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_17_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h11 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_17_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_18_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h12 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_18_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_18_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h12 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_18_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_18_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h12 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_18_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_18_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h12 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_18_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_19_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h13 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_19_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_19_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h13 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_19_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_19_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h13 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_19_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_19_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h13 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_19_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_20_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h14 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_20_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_20_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h14 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_20_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_20_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h14 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_20_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_20_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h14 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_20_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_21_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h15 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_21_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_21_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h15 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_21_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_21_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h15 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_21_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_21_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h15 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_21_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_22_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h16 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_22_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_22_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h16 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_22_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_22_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h16 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_22_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_22_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h16 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_22_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_23_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h17 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_23_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_23_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h17 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_23_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_23_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h17 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_23_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_23_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h17 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_23_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_24_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h18 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_24_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_24_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h18 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_24_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_24_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h18 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_24_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_24_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h18 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_24_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_25_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h19 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_25_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_25_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h19 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_25_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_25_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h19 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_25_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_25_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h19 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_25_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_26_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h1a == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_26_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_26_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h1a == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_26_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_26_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h1a == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_26_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_26_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h1a == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_26_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_27_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h1b == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_27_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_27_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h1b == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_27_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_27_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h1b == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_27_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_27_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h1b == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_27_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_28_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h1c == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_28_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_28_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h1c == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_28_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_28_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h1c == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_28_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_28_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h1c == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_28_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_29_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h1d == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_29_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_29_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h1d == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_29_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_29_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h1d == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_29_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_29_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h1d == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_29_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_30_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h1e == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_30_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_30_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h1e == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_30_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_30_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h1e == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_30_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_30_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h1e == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_30_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_31_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h1f == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_31_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_31_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h1f == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_31_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_31_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h1f == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_31_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_31_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h1f == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_31_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_32_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h20 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_32_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_32_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h20 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_32_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_32_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h20 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_32_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_32_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h20 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_32_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_33_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h21 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_33_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_33_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h21 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_33_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_33_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h21 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_33_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_33_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h21 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_33_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_34_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h22 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_34_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_34_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h22 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_34_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_34_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h22 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_34_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_34_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h22 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_34_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_35_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h23 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_35_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_35_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h23 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_35_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_35_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h23 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_35_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_35_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h23 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_35_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_36_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h24 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_36_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_36_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h24 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_36_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_36_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h24 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_36_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_36_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h24 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_36_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_37_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h25 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_37_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_37_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h25 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_37_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_37_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h25 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_37_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_37_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h25 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_37_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_38_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h26 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_38_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_38_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h26 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_38_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_38_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h26 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_38_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_38_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h26 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_38_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_39_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h27 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_39_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_39_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h27 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_39_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_39_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h27 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_39_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_39_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h27 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_39_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_40_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h28 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_40_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_40_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h28 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_40_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_40_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h28 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_40_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_40_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h28 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_40_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_41_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h29 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_41_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_41_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h29 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_41_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_41_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h29 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_41_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_41_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h29 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_41_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_42_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h2a == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_42_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_42_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h2a == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_42_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_42_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h2a == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_42_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_42_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h2a == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_42_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_43_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h2b == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_43_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_43_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h2b == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_43_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_43_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h2b == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_43_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_43_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h2b == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_43_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_44_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h2c == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_44_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_44_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h2c == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_44_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_44_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h2c == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_44_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_44_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h2c == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_44_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_45_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h2d == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_45_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_45_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h2d == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_45_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_45_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h2d == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_45_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_45_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h2d == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_45_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_46_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h2e == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_46_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_46_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h2e == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_46_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_46_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h2e == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_46_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_46_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h2e == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_46_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_47_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h2f == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_47_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_47_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h2f == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_47_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_47_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h2f == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_47_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_47_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h2f == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_47_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_48_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h30 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_48_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_48_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h30 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_48_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_48_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h30 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_48_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_48_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h30 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_48_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_49_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h31 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_49_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_49_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h31 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_49_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_49_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h31 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_49_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_49_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h31 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_49_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_50_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h32 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_50_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_50_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h32 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_50_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_50_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h32 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_50_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_50_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h32 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_50_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_51_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h33 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_51_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_51_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h33 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_51_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_51_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h33 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_51_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_51_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h33 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_51_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_52_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h34 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_52_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_52_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h34 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_52_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_52_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h34 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_52_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_52_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h34 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_52_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_53_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h35 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_53_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_53_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h35 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_53_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_53_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h35 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_53_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_53_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h35 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_53_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_54_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h36 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_54_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_54_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h36 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_54_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_54_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h36 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_54_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_54_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h36 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_54_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_55_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h37 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_55_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_55_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h37 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_55_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_55_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h37 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_55_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_55_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h37 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_55_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_56_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h38 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_56_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_56_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h38 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_56_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_56_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h38 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_56_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_56_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h38 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_56_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_57_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h39 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_57_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_57_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h39 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_57_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_57_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h39 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_57_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_57_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h39 == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_57_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_58_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h3a == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_58_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_58_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h3a == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_58_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_58_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h3a == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_58_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_58_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h3a == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_58_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_59_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h3b == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_59_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_59_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h3b == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_59_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_59_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h3b == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_59_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_59_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h3b == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_59_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_60_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h3c == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_60_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_60_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h3c == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_60_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_60_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h3c == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_60_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_60_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h3c == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_60_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_61_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h3d == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_61_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_61_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h3d == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_61_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_61_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h3d == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_61_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_61_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h3d == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_61_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_62_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h3e == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_62_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_62_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h3e == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_62_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_62_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h3e == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_62_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_62_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h3e == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_62_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_63_valid <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h3f == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_63_valid <= io_tag_write_valid; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_63_dirty <= 1'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h3f == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_63_dirty <= io_tag_write_dirty; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_63_visit <= 8'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h3f == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_63_visit <= io_tag_write_visit; // @[cache_single_port.scala 71:45]
      end
    end
    if (reset) begin // @[cache_single_port.scala 67:30]
      tag_mem_63_tag <= 22'h0; // @[cache_single_port.scala 67:30]
    end else if (io_cache_req_we) begin // @[cache_single_port.scala 70:30]
      if (6'h3f == io_cache_req_index) begin // @[cache_single_port.scala 71:45]
        tag_mem_63_tag <= io_tag_write_tag; // @[cache_single_port.scala 71:45]
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
  tag_mem_0_valid = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  tag_mem_0_dirty = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  tag_mem_0_visit = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  tag_mem_0_tag = _RAND_3[21:0];
  _RAND_4 = {1{`RANDOM}};
  tag_mem_1_valid = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  tag_mem_1_dirty = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  tag_mem_1_visit = _RAND_6[7:0];
  _RAND_7 = {1{`RANDOM}};
  tag_mem_1_tag = _RAND_7[21:0];
  _RAND_8 = {1{`RANDOM}};
  tag_mem_2_valid = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  tag_mem_2_dirty = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  tag_mem_2_visit = _RAND_10[7:0];
  _RAND_11 = {1{`RANDOM}};
  tag_mem_2_tag = _RAND_11[21:0];
  _RAND_12 = {1{`RANDOM}};
  tag_mem_3_valid = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  tag_mem_3_dirty = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  tag_mem_3_visit = _RAND_14[7:0];
  _RAND_15 = {1{`RANDOM}};
  tag_mem_3_tag = _RAND_15[21:0];
  _RAND_16 = {1{`RANDOM}};
  tag_mem_4_valid = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  tag_mem_4_dirty = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  tag_mem_4_visit = _RAND_18[7:0];
  _RAND_19 = {1{`RANDOM}};
  tag_mem_4_tag = _RAND_19[21:0];
  _RAND_20 = {1{`RANDOM}};
  tag_mem_5_valid = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  tag_mem_5_dirty = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  tag_mem_5_visit = _RAND_22[7:0];
  _RAND_23 = {1{`RANDOM}};
  tag_mem_5_tag = _RAND_23[21:0];
  _RAND_24 = {1{`RANDOM}};
  tag_mem_6_valid = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  tag_mem_6_dirty = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  tag_mem_6_visit = _RAND_26[7:0];
  _RAND_27 = {1{`RANDOM}};
  tag_mem_6_tag = _RAND_27[21:0];
  _RAND_28 = {1{`RANDOM}};
  tag_mem_7_valid = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  tag_mem_7_dirty = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  tag_mem_7_visit = _RAND_30[7:0];
  _RAND_31 = {1{`RANDOM}};
  tag_mem_7_tag = _RAND_31[21:0];
  _RAND_32 = {1{`RANDOM}};
  tag_mem_8_valid = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  tag_mem_8_dirty = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  tag_mem_8_visit = _RAND_34[7:0];
  _RAND_35 = {1{`RANDOM}};
  tag_mem_8_tag = _RAND_35[21:0];
  _RAND_36 = {1{`RANDOM}};
  tag_mem_9_valid = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  tag_mem_9_dirty = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  tag_mem_9_visit = _RAND_38[7:0];
  _RAND_39 = {1{`RANDOM}};
  tag_mem_9_tag = _RAND_39[21:0];
  _RAND_40 = {1{`RANDOM}};
  tag_mem_10_valid = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  tag_mem_10_dirty = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  tag_mem_10_visit = _RAND_42[7:0];
  _RAND_43 = {1{`RANDOM}};
  tag_mem_10_tag = _RAND_43[21:0];
  _RAND_44 = {1{`RANDOM}};
  tag_mem_11_valid = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  tag_mem_11_dirty = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  tag_mem_11_visit = _RAND_46[7:0];
  _RAND_47 = {1{`RANDOM}};
  tag_mem_11_tag = _RAND_47[21:0];
  _RAND_48 = {1{`RANDOM}};
  tag_mem_12_valid = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  tag_mem_12_dirty = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  tag_mem_12_visit = _RAND_50[7:0];
  _RAND_51 = {1{`RANDOM}};
  tag_mem_12_tag = _RAND_51[21:0];
  _RAND_52 = {1{`RANDOM}};
  tag_mem_13_valid = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  tag_mem_13_dirty = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  tag_mem_13_visit = _RAND_54[7:0];
  _RAND_55 = {1{`RANDOM}};
  tag_mem_13_tag = _RAND_55[21:0];
  _RAND_56 = {1{`RANDOM}};
  tag_mem_14_valid = _RAND_56[0:0];
  _RAND_57 = {1{`RANDOM}};
  tag_mem_14_dirty = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  tag_mem_14_visit = _RAND_58[7:0];
  _RAND_59 = {1{`RANDOM}};
  tag_mem_14_tag = _RAND_59[21:0];
  _RAND_60 = {1{`RANDOM}};
  tag_mem_15_valid = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  tag_mem_15_dirty = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  tag_mem_15_visit = _RAND_62[7:0];
  _RAND_63 = {1{`RANDOM}};
  tag_mem_15_tag = _RAND_63[21:0];
  _RAND_64 = {1{`RANDOM}};
  tag_mem_16_valid = _RAND_64[0:0];
  _RAND_65 = {1{`RANDOM}};
  tag_mem_16_dirty = _RAND_65[0:0];
  _RAND_66 = {1{`RANDOM}};
  tag_mem_16_visit = _RAND_66[7:0];
  _RAND_67 = {1{`RANDOM}};
  tag_mem_16_tag = _RAND_67[21:0];
  _RAND_68 = {1{`RANDOM}};
  tag_mem_17_valid = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  tag_mem_17_dirty = _RAND_69[0:0];
  _RAND_70 = {1{`RANDOM}};
  tag_mem_17_visit = _RAND_70[7:0];
  _RAND_71 = {1{`RANDOM}};
  tag_mem_17_tag = _RAND_71[21:0];
  _RAND_72 = {1{`RANDOM}};
  tag_mem_18_valid = _RAND_72[0:0];
  _RAND_73 = {1{`RANDOM}};
  tag_mem_18_dirty = _RAND_73[0:0];
  _RAND_74 = {1{`RANDOM}};
  tag_mem_18_visit = _RAND_74[7:0];
  _RAND_75 = {1{`RANDOM}};
  tag_mem_18_tag = _RAND_75[21:0];
  _RAND_76 = {1{`RANDOM}};
  tag_mem_19_valid = _RAND_76[0:0];
  _RAND_77 = {1{`RANDOM}};
  tag_mem_19_dirty = _RAND_77[0:0];
  _RAND_78 = {1{`RANDOM}};
  tag_mem_19_visit = _RAND_78[7:0];
  _RAND_79 = {1{`RANDOM}};
  tag_mem_19_tag = _RAND_79[21:0];
  _RAND_80 = {1{`RANDOM}};
  tag_mem_20_valid = _RAND_80[0:0];
  _RAND_81 = {1{`RANDOM}};
  tag_mem_20_dirty = _RAND_81[0:0];
  _RAND_82 = {1{`RANDOM}};
  tag_mem_20_visit = _RAND_82[7:0];
  _RAND_83 = {1{`RANDOM}};
  tag_mem_20_tag = _RAND_83[21:0];
  _RAND_84 = {1{`RANDOM}};
  tag_mem_21_valid = _RAND_84[0:0];
  _RAND_85 = {1{`RANDOM}};
  tag_mem_21_dirty = _RAND_85[0:0];
  _RAND_86 = {1{`RANDOM}};
  tag_mem_21_visit = _RAND_86[7:0];
  _RAND_87 = {1{`RANDOM}};
  tag_mem_21_tag = _RAND_87[21:0];
  _RAND_88 = {1{`RANDOM}};
  tag_mem_22_valid = _RAND_88[0:0];
  _RAND_89 = {1{`RANDOM}};
  tag_mem_22_dirty = _RAND_89[0:0];
  _RAND_90 = {1{`RANDOM}};
  tag_mem_22_visit = _RAND_90[7:0];
  _RAND_91 = {1{`RANDOM}};
  tag_mem_22_tag = _RAND_91[21:0];
  _RAND_92 = {1{`RANDOM}};
  tag_mem_23_valid = _RAND_92[0:0];
  _RAND_93 = {1{`RANDOM}};
  tag_mem_23_dirty = _RAND_93[0:0];
  _RAND_94 = {1{`RANDOM}};
  tag_mem_23_visit = _RAND_94[7:0];
  _RAND_95 = {1{`RANDOM}};
  tag_mem_23_tag = _RAND_95[21:0];
  _RAND_96 = {1{`RANDOM}};
  tag_mem_24_valid = _RAND_96[0:0];
  _RAND_97 = {1{`RANDOM}};
  tag_mem_24_dirty = _RAND_97[0:0];
  _RAND_98 = {1{`RANDOM}};
  tag_mem_24_visit = _RAND_98[7:0];
  _RAND_99 = {1{`RANDOM}};
  tag_mem_24_tag = _RAND_99[21:0];
  _RAND_100 = {1{`RANDOM}};
  tag_mem_25_valid = _RAND_100[0:0];
  _RAND_101 = {1{`RANDOM}};
  tag_mem_25_dirty = _RAND_101[0:0];
  _RAND_102 = {1{`RANDOM}};
  tag_mem_25_visit = _RAND_102[7:0];
  _RAND_103 = {1{`RANDOM}};
  tag_mem_25_tag = _RAND_103[21:0];
  _RAND_104 = {1{`RANDOM}};
  tag_mem_26_valid = _RAND_104[0:0];
  _RAND_105 = {1{`RANDOM}};
  tag_mem_26_dirty = _RAND_105[0:0];
  _RAND_106 = {1{`RANDOM}};
  tag_mem_26_visit = _RAND_106[7:0];
  _RAND_107 = {1{`RANDOM}};
  tag_mem_26_tag = _RAND_107[21:0];
  _RAND_108 = {1{`RANDOM}};
  tag_mem_27_valid = _RAND_108[0:0];
  _RAND_109 = {1{`RANDOM}};
  tag_mem_27_dirty = _RAND_109[0:0];
  _RAND_110 = {1{`RANDOM}};
  tag_mem_27_visit = _RAND_110[7:0];
  _RAND_111 = {1{`RANDOM}};
  tag_mem_27_tag = _RAND_111[21:0];
  _RAND_112 = {1{`RANDOM}};
  tag_mem_28_valid = _RAND_112[0:0];
  _RAND_113 = {1{`RANDOM}};
  tag_mem_28_dirty = _RAND_113[0:0];
  _RAND_114 = {1{`RANDOM}};
  tag_mem_28_visit = _RAND_114[7:0];
  _RAND_115 = {1{`RANDOM}};
  tag_mem_28_tag = _RAND_115[21:0];
  _RAND_116 = {1{`RANDOM}};
  tag_mem_29_valid = _RAND_116[0:0];
  _RAND_117 = {1{`RANDOM}};
  tag_mem_29_dirty = _RAND_117[0:0];
  _RAND_118 = {1{`RANDOM}};
  tag_mem_29_visit = _RAND_118[7:0];
  _RAND_119 = {1{`RANDOM}};
  tag_mem_29_tag = _RAND_119[21:0];
  _RAND_120 = {1{`RANDOM}};
  tag_mem_30_valid = _RAND_120[0:0];
  _RAND_121 = {1{`RANDOM}};
  tag_mem_30_dirty = _RAND_121[0:0];
  _RAND_122 = {1{`RANDOM}};
  tag_mem_30_visit = _RAND_122[7:0];
  _RAND_123 = {1{`RANDOM}};
  tag_mem_30_tag = _RAND_123[21:0];
  _RAND_124 = {1{`RANDOM}};
  tag_mem_31_valid = _RAND_124[0:0];
  _RAND_125 = {1{`RANDOM}};
  tag_mem_31_dirty = _RAND_125[0:0];
  _RAND_126 = {1{`RANDOM}};
  tag_mem_31_visit = _RAND_126[7:0];
  _RAND_127 = {1{`RANDOM}};
  tag_mem_31_tag = _RAND_127[21:0];
  _RAND_128 = {1{`RANDOM}};
  tag_mem_32_valid = _RAND_128[0:0];
  _RAND_129 = {1{`RANDOM}};
  tag_mem_32_dirty = _RAND_129[0:0];
  _RAND_130 = {1{`RANDOM}};
  tag_mem_32_visit = _RAND_130[7:0];
  _RAND_131 = {1{`RANDOM}};
  tag_mem_32_tag = _RAND_131[21:0];
  _RAND_132 = {1{`RANDOM}};
  tag_mem_33_valid = _RAND_132[0:0];
  _RAND_133 = {1{`RANDOM}};
  tag_mem_33_dirty = _RAND_133[0:0];
  _RAND_134 = {1{`RANDOM}};
  tag_mem_33_visit = _RAND_134[7:0];
  _RAND_135 = {1{`RANDOM}};
  tag_mem_33_tag = _RAND_135[21:0];
  _RAND_136 = {1{`RANDOM}};
  tag_mem_34_valid = _RAND_136[0:0];
  _RAND_137 = {1{`RANDOM}};
  tag_mem_34_dirty = _RAND_137[0:0];
  _RAND_138 = {1{`RANDOM}};
  tag_mem_34_visit = _RAND_138[7:0];
  _RAND_139 = {1{`RANDOM}};
  tag_mem_34_tag = _RAND_139[21:0];
  _RAND_140 = {1{`RANDOM}};
  tag_mem_35_valid = _RAND_140[0:0];
  _RAND_141 = {1{`RANDOM}};
  tag_mem_35_dirty = _RAND_141[0:0];
  _RAND_142 = {1{`RANDOM}};
  tag_mem_35_visit = _RAND_142[7:0];
  _RAND_143 = {1{`RANDOM}};
  tag_mem_35_tag = _RAND_143[21:0];
  _RAND_144 = {1{`RANDOM}};
  tag_mem_36_valid = _RAND_144[0:0];
  _RAND_145 = {1{`RANDOM}};
  tag_mem_36_dirty = _RAND_145[0:0];
  _RAND_146 = {1{`RANDOM}};
  tag_mem_36_visit = _RAND_146[7:0];
  _RAND_147 = {1{`RANDOM}};
  tag_mem_36_tag = _RAND_147[21:0];
  _RAND_148 = {1{`RANDOM}};
  tag_mem_37_valid = _RAND_148[0:0];
  _RAND_149 = {1{`RANDOM}};
  tag_mem_37_dirty = _RAND_149[0:0];
  _RAND_150 = {1{`RANDOM}};
  tag_mem_37_visit = _RAND_150[7:0];
  _RAND_151 = {1{`RANDOM}};
  tag_mem_37_tag = _RAND_151[21:0];
  _RAND_152 = {1{`RANDOM}};
  tag_mem_38_valid = _RAND_152[0:0];
  _RAND_153 = {1{`RANDOM}};
  tag_mem_38_dirty = _RAND_153[0:0];
  _RAND_154 = {1{`RANDOM}};
  tag_mem_38_visit = _RAND_154[7:0];
  _RAND_155 = {1{`RANDOM}};
  tag_mem_38_tag = _RAND_155[21:0];
  _RAND_156 = {1{`RANDOM}};
  tag_mem_39_valid = _RAND_156[0:0];
  _RAND_157 = {1{`RANDOM}};
  tag_mem_39_dirty = _RAND_157[0:0];
  _RAND_158 = {1{`RANDOM}};
  tag_mem_39_visit = _RAND_158[7:0];
  _RAND_159 = {1{`RANDOM}};
  tag_mem_39_tag = _RAND_159[21:0];
  _RAND_160 = {1{`RANDOM}};
  tag_mem_40_valid = _RAND_160[0:0];
  _RAND_161 = {1{`RANDOM}};
  tag_mem_40_dirty = _RAND_161[0:0];
  _RAND_162 = {1{`RANDOM}};
  tag_mem_40_visit = _RAND_162[7:0];
  _RAND_163 = {1{`RANDOM}};
  tag_mem_40_tag = _RAND_163[21:0];
  _RAND_164 = {1{`RANDOM}};
  tag_mem_41_valid = _RAND_164[0:0];
  _RAND_165 = {1{`RANDOM}};
  tag_mem_41_dirty = _RAND_165[0:0];
  _RAND_166 = {1{`RANDOM}};
  tag_mem_41_visit = _RAND_166[7:0];
  _RAND_167 = {1{`RANDOM}};
  tag_mem_41_tag = _RAND_167[21:0];
  _RAND_168 = {1{`RANDOM}};
  tag_mem_42_valid = _RAND_168[0:0];
  _RAND_169 = {1{`RANDOM}};
  tag_mem_42_dirty = _RAND_169[0:0];
  _RAND_170 = {1{`RANDOM}};
  tag_mem_42_visit = _RAND_170[7:0];
  _RAND_171 = {1{`RANDOM}};
  tag_mem_42_tag = _RAND_171[21:0];
  _RAND_172 = {1{`RANDOM}};
  tag_mem_43_valid = _RAND_172[0:0];
  _RAND_173 = {1{`RANDOM}};
  tag_mem_43_dirty = _RAND_173[0:0];
  _RAND_174 = {1{`RANDOM}};
  tag_mem_43_visit = _RAND_174[7:0];
  _RAND_175 = {1{`RANDOM}};
  tag_mem_43_tag = _RAND_175[21:0];
  _RAND_176 = {1{`RANDOM}};
  tag_mem_44_valid = _RAND_176[0:0];
  _RAND_177 = {1{`RANDOM}};
  tag_mem_44_dirty = _RAND_177[0:0];
  _RAND_178 = {1{`RANDOM}};
  tag_mem_44_visit = _RAND_178[7:0];
  _RAND_179 = {1{`RANDOM}};
  tag_mem_44_tag = _RAND_179[21:0];
  _RAND_180 = {1{`RANDOM}};
  tag_mem_45_valid = _RAND_180[0:0];
  _RAND_181 = {1{`RANDOM}};
  tag_mem_45_dirty = _RAND_181[0:0];
  _RAND_182 = {1{`RANDOM}};
  tag_mem_45_visit = _RAND_182[7:0];
  _RAND_183 = {1{`RANDOM}};
  tag_mem_45_tag = _RAND_183[21:0];
  _RAND_184 = {1{`RANDOM}};
  tag_mem_46_valid = _RAND_184[0:0];
  _RAND_185 = {1{`RANDOM}};
  tag_mem_46_dirty = _RAND_185[0:0];
  _RAND_186 = {1{`RANDOM}};
  tag_mem_46_visit = _RAND_186[7:0];
  _RAND_187 = {1{`RANDOM}};
  tag_mem_46_tag = _RAND_187[21:0];
  _RAND_188 = {1{`RANDOM}};
  tag_mem_47_valid = _RAND_188[0:0];
  _RAND_189 = {1{`RANDOM}};
  tag_mem_47_dirty = _RAND_189[0:0];
  _RAND_190 = {1{`RANDOM}};
  tag_mem_47_visit = _RAND_190[7:0];
  _RAND_191 = {1{`RANDOM}};
  tag_mem_47_tag = _RAND_191[21:0];
  _RAND_192 = {1{`RANDOM}};
  tag_mem_48_valid = _RAND_192[0:0];
  _RAND_193 = {1{`RANDOM}};
  tag_mem_48_dirty = _RAND_193[0:0];
  _RAND_194 = {1{`RANDOM}};
  tag_mem_48_visit = _RAND_194[7:0];
  _RAND_195 = {1{`RANDOM}};
  tag_mem_48_tag = _RAND_195[21:0];
  _RAND_196 = {1{`RANDOM}};
  tag_mem_49_valid = _RAND_196[0:0];
  _RAND_197 = {1{`RANDOM}};
  tag_mem_49_dirty = _RAND_197[0:0];
  _RAND_198 = {1{`RANDOM}};
  tag_mem_49_visit = _RAND_198[7:0];
  _RAND_199 = {1{`RANDOM}};
  tag_mem_49_tag = _RAND_199[21:0];
  _RAND_200 = {1{`RANDOM}};
  tag_mem_50_valid = _RAND_200[0:0];
  _RAND_201 = {1{`RANDOM}};
  tag_mem_50_dirty = _RAND_201[0:0];
  _RAND_202 = {1{`RANDOM}};
  tag_mem_50_visit = _RAND_202[7:0];
  _RAND_203 = {1{`RANDOM}};
  tag_mem_50_tag = _RAND_203[21:0];
  _RAND_204 = {1{`RANDOM}};
  tag_mem_51_valid = _RAND_204[0:0];
  _RAND_205 = {1{`RANDOM}};
  tag_mem_51_dirty = _RAND_205[0:0];
  _RAND_206 = {1{`RANDOM}};
  tag_mem_51_visit = _RAND_206[7:0];
  _RAND_207 = {1{`RANDOM}};
  tag_mem_51_tag = _RAND_207[21:0];
  _RAND_208 = {1{`RANDOM}};
  tag_mem_52_valid = _RAND_208[0:0];
  _RAND_209 = {1{`RANDOM}};
  tag_mem_52_dirty = _RAND_209[0:0];
  _RAND_210 = {1{`RANDOM}};
  tag_mem_52_visit = _RAND_210[7:0];
  _RAND_211 = {1{`RANDOM}};
  tag_mem_52_tag = _RAND_211[21:0];
  _RAND_212 = {1{`RANDOM}};
  tag_mem_53_valid = _RAND_212[0:0];
  _RAND_213 = {1{`RANDOM}};
  tag_mem_53_dirty = _RAND_213[0:0];
  _RAND_214 = {1{`RANDOM}};
  tag_mem_53_visit = _RAND_214[7:0];
  _RAND_215 = {1{`RANDOM}};
  tag_mem_53_tag = _RAND_215[21:0];
  _RAND_216 = {1{`RANDOM}};
  tag_mem_54_valid = _RAND_216[0:0];
  _RAND_217 = {1{`RANDOM}};
  tag_mem_54_dirty = _RAND_217[0:0];
  _RAND_218 = {1{`RANDOM}};
  tag_mem_54_visit = _RAND_218[7:0];
  _RAND_219 = {1{`RANDOM}};
  tag_mem_54_tag = _RAND_219[21:0];
  _RAND_220 = {1{`RANDOM}};
  tag_mem_55_valid = _RAND_220[0:0];
  _RAND_221 = {1{`RANDOM}};
  tag_mem_55_dirty = _RAND_221[0:0];
  _RAND_222 = {1{`RANDOM}};
  tag_mem_55_visit = _RAND_222[7:0];
  _RAND_223 = {1{`RANDOM}};
  tag_mem_55_tag = _RAND_223[21:0];
  _RAND_224 = {1{`RANDOM}};
  tag_mem_56_valid = _RAND_224[0:0];
  _RAND_225 = {1{`RANDOM}};
  tag_mem_56_dirty = _RAND_225[0:0];
  _RAND_226 = {1{`RANDOM}};
  tag_mem_56_visit = _RAND_226[7:0];
  _RAND_227 = {1{`RANDOM}};
  tag_mem_56_tag = _RAND_227[21:0];
  _RAND_228 = {1{`RANDOM}};
  tag_mem_57_valid = _RAND_228[0:0];
  _RAND_229 = {1{`RANDOM}};
  tag_mem_57_dirty = _RAND_229[0:0];
  _RAND_230 = {1{`RANDOM}};
  tag_mem_57_visit = _RAND_230[7:0];
  _RAND_231 = {1{`RANDOM}};
  tag_mem_57_tag = _RAND_231[21:0];
  _RAND_232 = {1{`RANDOM}};
  tag_mem_58_valid = _RAND_232[0:0];
  _RAND_233 = {1{`RANDOM}};
  tag_mem_58_dirty = _RAND_233[0:0];
  _RAND_234 = {1{`RANDOM}};
  tag_mem_58_visit = _RAND_234[7:0];
  _RAND_235 = {1{`RANDOM}};
  tag_mem_58_tag = _RAND_235[21:0];
  _RAND_236 = {1{`RANDOM}};
  tag_mem_59_valid = _RAND_236[0:0];
  _RAND_237 = {1{`RANDOM}};
  tag_mem_59_dirty = _RAND_237[0:0];
  _RAND_238 = {1{`RANDOM}};
  tag_mem_59_visit = _RAND_238[7:0];
  _RAND_239 = {1{`RANDOM}};
  tag_mem_59_tag = _RAND_239[21:0];
  _RAND_240 = {1{`RANDOM}};
  tag_mem_60_valid = _RAND_240[0:0];
  _RAND_241 = {1{`RANDOM}};
  tag_mem_60_dirty = _RAND_241[0:0];
  _RAND_242 = {1{`RANDOM}};
  tag_mem_60_visit = _RAND_242[7:0];
  _RAND_243 = {1{`RANDOM}};
  tag_mem_60_tag = _RAND_243[21:0];
  _RAND_244 = {1{`RANDOM}};
  tag_mem_61_valid = _RAND_244[0:0];
  _RAND_245 = {1{`RANDOM}};
  tag_mem_61_dirty = _RAND_245[0:0];
  _RAND_246 = {1{`RANDOM}};
  tag_mem_61_visit = _RAND_246[7:0];
  _RAND_247 = {1{`RANDOM}};
  tag_mem_61_tag = _RAND_247[21:0];
  _RAND_248 = {1{`RANDOM}};
  tag_mem_62_valid = _RAND_248[0:0];
  _RAND_249 = {1{`RANDOM}};
  tag_mem_62_dirty = _RAND_249[0:0];
  _RAND_250 = {1{`RANDOM}};
  tag_mem_62_visit = _RAND_250[7:0];
  _RAND_251 = {1{`RANDOM}};
  tag_mem_62_tag = _RAND_251[21:0];
  _RAND_252 = {1{`RANDOM}};
  tag_mem_63_valid = _RAND_252[0:0];
  _RAND_253 = {1{`RANDOM}};
  tag_mem_63_dirty = _RAND_253[0:0];
  _RAND_254 = {1{`RANDOM}};
  tag_mem_63_visit = _RAND_254[7:0];
  _RAND_255 = {1{`RANDOM}};
  tag_mem_63_tag = _RAND_255[21:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_041812_data_cache(
  input  [127:0] io_cache_req_wmask,
  input  [5:0]   io_cache_req_index,
  input          io_cache_req_we,
  input  [127:0] io_data_write_data,
  output [127:0] io_data_read_data,
  output [5:0]   io_sram_addr,
  output         io_sram_wen,
  output [127:0] io_sram_wmask,
  output [127:0] io_sram_wdata,
  input  [127:0] io_sram_rdata
);
  assign io_data_read_data = io_sram_rdata; // @[cache_single_port.scala 95:47]
  assign io_sram_addr = io_cache_req_index; // @[cache_single_port.scala 91:22]
  assign io_sram_wen = ~io_cache_req_we; // @[cache_single_port.scala 92:24]
  assign io_sram_wmask = io_cache_req_wmask; // @[cache_single_port.scala 93:23]
  assign io_sram_wdata = io_data_write_data; // @[cache_single_port.scala 94:23]
endmodule
module ysyx_041812_Cache(
  input          clock,
  input          reset,
  input  [31:0]  io_cpu_request_addr,
  output [63:0]  io_cpu_response_data,
  output         io_cpu_response_ready,
  input          io_mem_io_ar_ready,
  output         io_mem_io_ar_valid,
  output [31:0]  io_mem_io_ar_bits_addr,
  output [7:0]   io_mem_io_ar_bits_len,
  output [2:0]   io_mem_io_ar_bits_size,
  output         io_mem_io_r_ready,
  input          io_mem_io_r_valid,
  input  [63:0]  io_mem_io_r_bits_data,
  input          io_mem_io_r_bits_last,
  input          io_flush,
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
  reg [63:0] _RAND_9;
`endif // RANDOMIZE_REG_INIT
  wire  tag_mem_0_clock; // @[cache_single_port.scala 158:45]
  wire  tag_mem_0_reset; // @[cache_single_port.scala 158:45]
  wire [5:0] tag_mem_0_io_cache_req_index; // @[cache_single_port.scala 158:45]
  wire  tag_mem_0_io_cache_req_we; // @[cache_single_port.scala 158:45]
  wire  tag_mem_0_io_tag_write_valid; // @[cache_single_port.scala 158:45]
  wire  tag_mem_0_io_tag_write_dirty; // @[cache_single_port.scala 158:45]
  wire [7:0] tag_mem_0_io_tag_write_visit; // @[cache_single_port.scala 158:45]
  wire [21:0] tag_mem_0_io_tag_write_tag; // @[cache_single_port.scala 158:45]
  wire  tag_mem_0_io_tag_read_valid; // @[cache_single_port.scala 158:45]
  wire  tag_mem_0_io_tag_read_dirty; // @[cache_single_port.scala 158:45]
  wire [7:0] tag_mem_0_io_tag_read_visit; // @[cache_single_port.scala 158:45]
  wire [21:0] tag_mem_0_io_tag_read_tag; // @[cache_single_port.scala 158:45]
  wire  tag_mem_1_clock; // @[cache_single_port.scala 158:45]
  wire  tag_mem_1_reset; // @[cache_single_port.scala 158:45]
  wire [5:0] tag_mem_1_io_cache_req_index; // @[cache_single_port.scala 158:45]
  wire  tag_mem_1_io_cache_req_we; // @[cache_single_port.scala 158:45]
  wire  tag_mem_1_io_tag_write_valid; // @[cache_single_port.scala 158:45]
  wire  tag_mem_1_io_tag_write_dirty; // @[cache_single_port.scala 158:45]
  wire [7:0] tag_mem_1_io_tag_write_visit; // @[cache_single_port.scala 158:45]
  wire [21:0] tag_mem_1_io_tag_write_tag; // @[cache_single_port.scala 158:45]
  wire  tag_mem_1_io_tag_read_valid; // @[cache_single_port.scala 158:45]
  wire  tag_mem_1_io_tag_read_dirty; // @[cache_single_port.scala 158:45]
  wire [7:0] tag_mem_1_io_tag_read_visit; // @[cache_single_port.scala 158:45]
  wire [21:0] tag_mem_1_io_tag_read_tag; // @[cache_single_port.scala 158:45]
  wire  tag_mem_2_clock; // @[cache_single_port.scala 158:45]
  wire  tag_mem_2_reset; // @[cache_single_port.scala 158:45]
  wire [5:0] tag_mem_2_io_cache_req_index; // @[cache_single_port.scala 158:45]
  wire  tag_mem_2_io_cache_req_we; // @[cache_single_port.scala 158:45]
  wire  tag_mem_2_io_tag_write_valid; // @[cache_single_port.scala 158:45]
  wire  tag_mem_2_io_tag_write_dirty; // @[cache_single_port.scala 158:45]
  wire [7:0] tag_mem_2_io_tag_write_visit; // @[cache_single_port.scala 158:45]
  wire [21:0] tag_mem_2_io_tag_write_tag; // @[cache_single_port.scala 158:45]
  wire  tag_mem_2_io_tag_read_valid; // @[cache_single_port.scala 158:45]
  wire  tag_mem_2_io_tag_read_dirty; // @[cache_single_port.scala 158:45]
  wire [7:0] tag_mem_2_io_tag_read_visit; // @[cache_single_port.scala 158:45]
  wire [21:0] tag_mem_2_io_tag_read_tag; // @[cache_single_port.scala 158:45]
  wire  tag_mem_3_clock; // @[cache_single_port.scala 158:45]
  wire  tag_mem_3_reset; // @[cache_single_port.scala 158:45]
  wire [5:0] tag_mem_3_io_cache_req_index; // @[cache_single_port.scala 158:45]
  wire  tag_mem_3_io_cache_req_we; // @[cache_single_port.scala 158:45]
  wire  tag_mem_3_io_tag_write_valid; // @[cache_single_port.scala 158:45]
  wire  tag_mem_3_io_tag_write_dirty; // @[cache_single_port.scala 158:45]
  wire [7:0] tag_mem_3_io_tag_write_visit; // @[cache_single_port.scala 158:45]
  wire [21:0] tag_mem_3_io_tag_write_tag; // @[cache_single_port.scala 158:45]
  wire  tag_mem_3_io_tag_read_valid; // @[cache_single_port.scala 158:45]
  wire  tag_mem_3_io_tag_read_dirty; // @[cache_single_port.scala 158:45]
  wire [7:0] tag_mem_3_io_tag_read_visit; // @[cache_single_port.scala 158:45]
  wire [21:0] tag_mem_3_io_tag_read_tag; // @[cache_single_port.scala 158:45]
  wire [127:0] data_mem_0_io_cache_req_wmask; // @[cache_single_port.scala 159:46]
  wire [5:0] data_mem_0_io_cache_req_index; // @[cache_single_port.scala 159:46]
  wire  data_mem_0_io_cache_req_we; // @[cache_single_port.scala 159:46]
  wire [127:0] data_mem_0_io_data_write_data; // @[cache_single_port.scala 159:46]
  wire [127:0] data_mem_0_io_data_read_data; // @[cache_single_port.scala 159:46]
  wire [5:0] data_mem_0_io_sram_addr; // @[cache_single_port.scala 159:46]
  wire  data_mem_0_io_sram_wen; // @[cache_single_port.scala 159:46]
  wire [127:0] data_mem_0_io_sram_wmask; // @[cache_single_port.scala 159:46]
  wire [127:0] data_mem_0_io_sram_wdata; // @[cache_single_port.scala 159:46]
  wire [127:0] data_mem_0_io_sram_rdata; // @[cache_single_port.scala 159:46]
  wire [127:0] data_mem_1_io_cache_req_wmask; // @[cache_single_port.scala 159:46]
  wire [5:0] data_mem_1_io_cache_req_index; // @[cache_single_port.scala 159:46]
  wire  data_mem_1_io_cache_req_we; // @[cache_single_port.scala 159:46]
  wire [127:0] data_mem_1_io_data_write_data; // @[cache_single_port.scala 159:46]
  wire [127:0] data_mem_1_io_data_read_data; // @[cache_single_port.scala 159:46]
  wire [5:0] data_mem_1_io_sram_addr; // @[cache_single_port.scala 159:46]
  wire  data_mem_1_io_sram_wen; // @[cache_single_port.scala 159:46]
  wire [127:0] data_mem_1_io_sram_wmask; // @[cache_single_port.scala 159:46]
  wire [127:0] data_mem_1_io_sram_wdata; // @[cache_single_port.scala 159:46]
  wire [127:0] data_mem_1_io_sram_rdata; // @[cache_single_port.scala 159:46]
  wire [127:0] data_mem_2_io_cache_req_wmask; // @[cache_single_port.scala 159:46]
  wire [5:0] data_mem_2_io_cache_req_index; // @[cache_single_port.scala 159:46]
  wire  data_mem_2_io_cache_req_we; // @[cache_single_port.scala 159:46]
  wire [127:0] data_mem_2_io_data_write_data; // @[cache_single_port.scala 159:46]
  wire [127:0] data_mem_2_io_data_read_data; // @[cache_single_port.scala 159:46]
  wire [5:0] data_mem_2_io_sram_addr; // @[cache_single_port.scala 159:46]
  wire  data_mem_2_io_sram_wen; // @[cache_single_port.scala 159:46]
  wire [127:0] data_mem_2_io_sram_wmask; // @[cache_single_port.scala 159:46]
  wire [127:0] data_mem_2_io_sram_wdata; // @[cache_single_port.scala 159:46]
  wire [127:0] data_mem_2_io_sram_rdata; // @[cache_single_port.scala 159:46]
  wire [127:0] data_mem_3_io_cache_req_wmask; // @[cache_single_port.scala 159:46]
  wire [5:0] data_mem_3_io_cache_req_index; // @[cache_single_port.scala 159:46]
  wire  data_mem_3_io_cache_req_we; // @[cache_single_port.scala 159:46]
  wire [127:0] data_mem_3_io_data_write_data; // @[cache_single_port.scala 159:46]
  wire [127:0] data_mem_3_io_data_read_data; // @[cache_single_port.scala 159:46]
  wire [5:0] data_mem_3_io_sram_addr; // @[cache_single_port.scala 159:46]
  wire  data_mem_3_io_sram_wen; // @[cache_single_port.scala 159:46]
  wire [127:0] data_mem_3_io_sram_wmask; // @[cache_single_port.scala 159:46]
  wire [127:0] data_mem_3_io_sram_wdata; // @[cache_single_port.scala 159:46]
  wire [127:0] data_mem_3_io_sram_rdata; // @[cache_single_port.scala 159:46]
  reg [4:0] cache_state; // @[cache_single_port.scala 157:34]
  reg  index; // @[Counter.scala 62:40]
  wire  _GEN_564 = 5'h8 == cache_state & io_mem_io_r_valid; // @[cache_single_port.scala 290:28 682:39]
  wire  _GEN_596 = 5'h9 == cache_state ? 1'h0 : _GEN_564; // @[cache_single_port.scala 290:28]
  wire  _GEN_629 = 5'hd == cache_state ? 1'h0 : _GEN_596; // @[cache_single_port.scala 290:28]
  wire  _GEN_663 = 5'hc == cache_state ? 1'h0 : _GEN_629; // @[cache_single_port.scala 290:28]
  wire  _GEN_734 = 5'h6 == cache_state ? 1'h0 : _GEN_663; // @[cache_single_port.scala 290:28]
  wire  _GEN_806 = 5'h5 == cache_state ? 1'h0 : _GEN_734; // @[cache_single_port.scala 290:28]
  wire  _GEN_887 = 5'h4 == cache_state ? 1'h0 : _GEN_806; // @[cache_single_port.scala 290:28]
  wire  _GEN_960 = 5'h3 == cache_state ? 1'h0 : _GEN_887; // @[cache_single_port.scala 290:28]
  wire  _GEN_1034 = 5'h1 == cache_state ? 1'h0 : _GEN_960; // @[cache_single_port.scala 290:28]
  wire  _GEN_1112 = 5'h13 == cache_state ? 1'h0 : _GEN_1034; // @[cache_single_port.scala 290:28]
  wire  _GEN_1126 = 5'h11 == cache_state ? 1'h0 : _GEN_1112; // @[cache_single_port.scala 290:28]
  wire  _GEN_1238 = 5'h10 == cache_state ? 1'h0 : _GEN_1126; // @[cache_single_port.scala 290:28]
  wire  _GEN_1322 = 5'hf == cache_state ? 1'h0 : _GEN_1238; // @[cache_single_port.scala 290:28]
  wire  fill_block_en = 5'h0 == cache_state ? 1'h0 : _GEN_1322; // @[cache_single_port.scala 290:28]
  wire  _GEN_0 = fill_block_en ? index + 1'h1 : index; // @[Counter.scala 120:16 78:15 62:40]
  reg [1:0] replace; // @[cache_single_port.scala 165:30]
  reg [31:0] refill_addr; // @[cache_single_port.scala 166:34]
  reg [31:0] cpu_request_addr_reg_origin; // @[cache_single_port.scala 171:50]
  reg [31:0] cpu_request_addr_reg; // @[cache_single_port.scala 172:43]
  reg [1:0] cpu_request_accessType; // @[cache_single_port.scala 177:45]
  wire [31:0] align_addr = {io_cpu_request_addr[31:3],3'h0}; // @[Cat.scala 31:58]
  wire [5:0] cpu_request_addr_index = cpu_request_addr_reg[9:4]; // @[cache_single_port.scala 224:58]
  wire [21:0] cpu_request_addr_tag = cpu_request_addr_reg[31:10]; // @[cache_single_port.scala 225:56]
  reg [5:0] flush_loop; // @[Counter.scala 62:40]
  wire  wrap_wrap_1 = flush_loop == 6'h3f; // @[Counter.scala 74:24]
  wire [5:0] _wrap_value_T_3 = flush_loop + 6'h1; // @[Counter.scala 78:24]
  wire  _GEN_678 = 5'h6 == cache_state & (tag_mem_3_io_tag_read_tag == cpu_request_addr_tag &
    tag_mem_3_io_tag_read_valid); // @[cache_single_port.scala 290:28 227:31 535:34]
  wire  _GEN_752 = 5'h5 == cache_state ? 1'h0 : _GEN_678; // @[cache_single_port.scala 290:28 227:31]
  wire  _GEN_833 = 5'h4 == cache_state ? 1'h0 : _GEN_752; // @[cache_single_port.scala 290:28 227:31]
  wire  _GEN_908 = 5'h3 == cache_state ? 1'h0 : _GEN_833; // @[cache_single_port.scala 290:28 227:31]
  wire  _GEN_985 = 5'h1 == cache_state ? 1'h0 : _GEN_908; // @[cache_single_port.scala 290:28 227:31]
  wire  _GEN_1063 = 5'h13 == cache_state ? 1'h0 : _GEN_985; // @[cache_single_port.scala 290:28 227:31]
  wire  _GEN_1153 = 5'h11 == cache_state ? 1'h0 : _GEN_1063; // @[cache_single_port.scala 290:28 227:31]
  wire  _GEN_1200 = 5'h10 == cache_state ? 1'h0 : _GEN_1153; // @[cache_single_port.scala 290:28]
  wire  _GEN_1286 = 5'hf == cache_state ? 1'h0 : _GEN_1200; // @[cache_single_port.scala 290:28 227:31]
  wire  is_match_3 = 5'h0 == cache_state ? 1'h0 : _GEN_1286; // @[cache_single_port.scala 290:28 227:31]
  wire  _GEN_677 = 5'h6 == cache_state & (tag_mem_2_io_tag_read_tag == cpu_request_addr_tag &
    tag_mem_2_io_tag_read_valid); // @[cache_single_port.scala 290:28 227:31 535:34]
  wire  _GEN_751 = 5'h5 == cache_state ? 1'h0 : _GEN_677; // @[cache_single_port.scala 290:28 227:31]
  wire  _GEN_832 = 5'h4 == cache_state ? 1'h0 : _GEN_751; // @[cache_single_port.scala 290:28 227:31]
  wire  _GEN_907 = 5'h3 == cache_state ? 1'h0 : _GEN_832; // @[cache_single_port.scala 290:28 227:31]
  wire  _GEN_984 = 5'h1 == cache_state ? 1'h0 : _GEN_907; // @[cache_single_port.scala 290:28 227:31]
  wire  _GEN_1062 = 5'h13 == cache_state ? 1'h0 : _GEN_984; // @[cache_single_port.scala 290:28 227:31]
  wire  _GEN_1152 = 5'h11 == cache_state ? 1'h0 : _GEN_1062; // @[cache_single_port.scala 290:28 227:31]
  wire  _GEN_1199 = 5'h10 == cache_state ? 1'h0 : _GEN_1152; // @[cache_single_port.scala 290:28]
  wire  _GEN_1285 = 5'hf == cache_state ? 1'h0 : _GEN_1199; // @[cache_single_port.scala 290:28 227:31]
  wire  is_match_2 = 5'h0 == cache_state ? 1'h0 : _GEN_1285; // @[cache_single_port.scala 290:28 227:31]
  wire  _GEN_676 = 5'h6 == cache_state & (tag_mem_1_io_tag_read_tag == cpu_request_addr_tag &
    tag_mem_1_io_tag_read_valid); // @[cache_single_port.scala 290:28 227:31 535:34]
  wire  _GEN_750 = 5'h5 == cache_state ? 1'h0 : _GEN_676; // @[cache_single_port.scala 290:28 227:31]
  wire  _GEN_831 = 5'h4 == cache_state ? 1'h0 : _GEN_750; // @[cache_single_port.scala 290:28 227:31]
  wire  _GEN_906 = 5'h3 == cache_state ? 1'h0 : _GEN_831; // @[cache_single_port.scala 290:28 227:31]
  wire  _GEN_983 = 5'h1 == cache_state ? 1'h0 : _GEN_906; // @[cache_single_port.scala 290:28 227:31]
  wire  _GEN_1061 = 5'h13 == cache_state ? 1'h0 : _GEN_983; // @[cache_single_port.scala 290:28 227:31]
  wire  _GEN_1151 = 5'h11 == cache_state ? 1'h0 : _GEN_1061; // @[cache_single_port.scala 290:28 227:31]
  wire  _GEN_1198 = 5'h10 == cache_state ? 1'h0 : _GEN_1151; // @[cache_single_port.scala 290:28]
  wire  _GEN_1284 = 5'hf == cache_state ? 1'h0 : _GEN_1198; // @[cache_single_port.scala 290:28 227:31]
  wire  is_match_1 = 5'h0 == cache_state ? 1'h0 : _GEN_1284; // @[cache_single_port.scala 290:28 227:31]
  wire  _GEN_675 = 5'h6 == cache_state & (tag_mem_0_io_tag_read_tag == cpu_request_addr_tag &
    tag_mem_0_io_tag_read_valid); // @[cache_single_port.scala 290:28 227:31 535:34]
  wire  _GEN_749 = 5'h5 == cache_state ? 1'h0 : _GEN_675; // @[cache_single_port.scala 290:28 227:31]
  wire  _GEN_830 = 5'h4 == cache_state ? 1'h0 : _GEN_749; // @[cache_single_port.scala 290:28 227:31]
  wire  _GEN_905 = 5'h3 == cache_state ? 1'h0 : _GEN_830; // @[cache_single_port.scala 290:28 227:31]
  wire  _GEN_982 = 5'h1 == cache_state ? 1'h0 : _GEN_905; // @[cache_single_port.scala 290:28 227:31]
  wire  _GEN_1060 = 5'h13 == cache_state ? 1'h0 : _GEN_982; // @[cache_single_port.scala 290:28 227:31]
  wire  _GEN_1150 = 5'h11 == cache_state ? 1'h0 : _GEN_1060; // @[cache_single_port.scala 290:28 227:31]
  wire  _GEN_1197 = 5'h10 == cache_state ? 1'h0 : _GEN_1150; // @[cache_single_port.scala 290:28]
  wire  _GEN_1283 = 5'hf == cache_state ? 1'h0 : _GEN_1197; // @[cache_single_port.scala 290:28 227:31]
  wire  is_match_0 = 5'h0 == cache_state ? 1'h0 : _GEN_1283; // @[cache_single_port.scala 290:28 227:31]
  wire  _GEN_1289 = 5'hf == cache_state ? 1'h0 : 5'h10 == cache_state; // @[cache_single_port.scala 283:27 290:28]
  wire  flush_loop_enable = 5'h0 == cache_state ? 1'h0 : _GEN_1289; // @[cache_single_port.scala 283:27 290:28]
  wire [5:0] _GEN_2 = flush_loop_enable ? _wrap_value_T_3 : flush_loop; // @[Counter.scala 120:16 78:15 62:40]
  reg  flush_over; // @[cache_single_port.scala 280:33]
  reg [63:0] tmp_response_data; // @[cache_single_port.scala 285:40]
  wire  _T_6 = align_addr <= 32'h88000000; // @[cache_single_port.scala 296:52]
  wire  _T_7 = align_addr >= 32'h80000000 & _T_6; // @[cache_single_port.scala 295:69]
  wire [2:0] _GEN_8 = _T_7 ? 3'h6 : 3'h1; // @[cache_single_port.scala 296:69 298:44]
  wire [3:0] _GEN_9 = io_flush ? 4'hf : {{1'd0}, _GEN_8}; // @[cache_single_port.scala 292:63 293:44]
  wire  _GEN_14 = wrap_wrap_1 | flush_over; // @[cache_single_port.scala 280:33 342:91 343:76]
  wire [21:0] _GEN_107 = tag_mem_0_io_tag_read_tag; // @[cache_single_port.scala 237:41 326:42 358:69]
  wire [21:0] _GEN_110 = tag_mem_1_io_tag_read_tag; // @[cache_single_port.scala 237:41 326:42 358:69]
  wire [21:0] _GEN_113 = tag_mem_2_io_tag_read_tag; // @[cache_single_port.scala 237:41 326:42 358:69]
  wire [21:0] _GEN_116 = tag_mem_3_io_tag_read_tag; // @[cache_single_port.scala 237:41 326:42 358:69]
  wire  _T_144 = 2'h3 == replace; // @[cache_single_port.scala 668:50]
  wire [63:0] _GEN_460 = ~index ? io_mem_io_r_bits_data : 64'h0; // @[cache_single_port.scala 670:60 672:{67,67}]
  wire  _T_143 = 2'h2 == replace; // @[cache_single_port.scala 668:50]
  wire  _T_142 = 2'h1 == replace; // @[cache_single_port.scala 668:50]
  wire  _T_141 = 2'h0 == replace; // @[cache_single_port.scala 668:50]
  wire [63:0] _GEN_431 = 2'h0 == replace ? _GEN_460 : 64'h0; // @[cache_single_port.scala 230:33 668:62]
  wire [63:0] _GEN_442 = 2'h1 == replace ? _GEN_460 : _GEN_431; // @[cache_single_port.scala 668:62]
  wire [63:0] _GEN_453 = 2'h2 == replace ? _GEN_460 : _GEN_442; // @[cache_single_port.scala 668:62]
  wire [63:0] _GEN_464 = 2'h3 == replace ? _GEN_460 : _GEN_453; // @[cache_single_port.scala 668:62]
  wire [63:0] _GEN_471 = io_mem_io_r_valid ? _GEN_464 : 64'h0; // @[cache_single_port.scala 230:33 666:48]
  wire [63:0] _GEN_492 = _T_141 ? data_mem_0_io_data_read_data[63:0] : 64'h0; // @[cache_single_port.scala 230:33 722:62 723:60]
  wire [63:0] _GEN_495 = _T_142 ? data_mem_1_io_data_read_data[63:0] : _GEN_492; // @[cache_single_port.scala 722:62 723:60]
  wire [63:0] _GEN_498 = _T_143 ? data_mem_2_io_data_read_data[63:0] : _GEN_495; // @[cache_single_port.scala 722:62 723:60]
  wire [63:0] _GEN_501 = _T_144 ? data_mem_3_io_data_read_data[63:0] : _GEN_498; // @[cache_single_port.scala 722:62 723:60]
  wire [63:0] _GEN_526 = 5'h7 == cache_state ? _GEN_501 : 64'h0; // @[cache_single_port.scala 290:28 230:33]
  wire [63:0] _GEN_540 = 5'he == cache_state ? 64'h0 : _GEN_526; // @[cache_single_port.scala 290:28 230:33]
  wire [63:0] _GEN_548 = 5'h8 == cache_state ? _GEN_471 : _GEN_540; // @[cache_single_port.scala 290:28]
  wire [63:0] _GEN_580 = 5'h9 == cache_state ? 64'h0 : _GEN_548; // @[cache_single_port.scala 290:28 230:33]
  wire [63:0] _GEN_613 = 5'hd == cache_state ? 64'h0 : _GEN_580; // @[cache_single_port.scala 290:28 230:33]
  wire [63:0] _GEN_647 = 5'hc == cache_state ? 64'h0 : _GEN_613; // @[cache_single_port.scala 290:28 230:33]
  wire [63:0] _GEN_702 = 5'h6 == cache_state ? 64'h0 : _GEN_647; // @[cache_single_port.scala 290:28]
  wire [63:0] _GEN_775 = 5'h5 == cache_state ? 64'h0 : _GEN_702; // @[cache_single_port.scala 290:28 230:33]
  wire [63:0] _GEN_856 = 5'h4 == cache_state ? 64'h0 : _GEN_775; // @[cache_single_port.scala 290:28 230:33]
  wire [63:0] _GEN_931 = 5'h3 == cache_state ? 64'h0 : _GEN_856; // @[cache_single_port.scala 290:28 230:33]
  wire [63:0] _GEN_1008 = 5'h1 == cache_state ? 64'h0 : _GEN_931; // @[cache_single_port.scala 290:28 230:33]
  wire [63:0] _GEN_1086 = 5'h13 == cache_state ? 64'h0 : _GEN_1008; // @[cache_single_port.scala 290:28 230:33]
  wire [63:0] _GEN_1129 = 5'h11 == cache_state ? data_mem_0_io_data_read_data[63:0] : _GEN_1086; // @[cache_single_port.scala 290:28]
  wire [63:0] _GEN_1241 = 5'h10 == cache_state ? 64'h0 : _GEN_1129; // @[cache_single_port.scala 290:28 230:33]
  wire [63:0] _GEN_1325 = 5'hf == cache_state ? 64'h0 : _GEN_1241; // @[cache_single_port.scala 290:28 230:33]
  wire [63:0] cache_data_0 = 5'h0 == cache_state ? 64'h0 : _GEN_1325; // @[cache_single_port.scala 290:28 230:33]
  wire [63:0] _GEN_461 = index ? io_mem_io_r_bits_data : 64'h0; // @[cache_single_port.scala 670:60 672:{67,67}]
  wire [63:0] _GEN_432 = 2'h0 == replace ? _GEN_461 : 64'h0; // @[cache_single_port.scala 230:33 668:62]
  wire [63:0] _GEN_443 = 2'h1 == replace ? _GEN_461 : _GEN_432; // @[cache_single_port.scala 668:62]
  wire [63:0] _GEN_454 = 2'h2 == replace ? _GEN_461 : _GEN_443; // @[cache_single_port.scala 668:62]
  wire [63:0] _GEN_465 = 2'h3 == replace ? _GEN_461 : _GEN_454; // @[cache_single_port.scala 668:62]
  wire [63:0] _GEN_472 = io_mem_io_r_valid ? _GEN_465 : 64'h0; // @[cache_single_port.scala 230:33 666:48]
  wire [63:0] _GEN_493 = _T_141 ? data_mem_0_io_data_read_data[127:64] : 64'h0; // @[cache_single_port.scala 230:33 722:62 723:60]
  wire [63:0] _GEN_496 = _T_142 ? data_mem_1_io_data_read_data[127:64] : _GEN_493; // @[cache_single_port.scala 722:62 723:60]
  wire [63:0] _GEN_499 = _T_143 ? data_mem_2_io_data_read_data[127:64] : _GEN_496; // @[cache_single_port.scala 722:62 723:60]
  wire [63:0] _GEN_502 = _T_144 ? data_mem_3_io_data_read_data[127:64] : _GEN_499; // @[cache_single_port.scala 722:62 723:60]
  wire [63:0] _GEN_527 = 5'h7 == cache_state ? _GEN_502 : 64'h0; // @[cache_single_port.scala 290:28 230:33]
  wire [63:0] _GEN_541 = 5'he == cache_state ? 64'h0 : _GEN_527; // @[cache_single_port.scala 290:28 230:33]
  wire [63:0] _GEN_549 = 5'h8 == cache_state ? _GEN_472 : _GEN_541; // @[cache_single_port.scala 290:28]
  wire [63:0] _GEN_581 = 5'h9 == cache_state ? 64'h0 : _GEN_549; // @[cache_single_port.scala 290:28 230:33]
  wire [63:0] _GEN_614 = 5'hd == cache_state ? 64'h0 : _GEN_581; // @[cache_single_port.scala 290:28 230:33]
  wire [63:0] _GEN_648 = 5'hc == cache_state ? 64'h0 : _GEN_614; // @[cache_single_port.scala 290:28 230:33]
  wire [63:0] _GEN_703 = 5'h6 == cache_state ? 64'h0 : _GEN_648; // @[cache_single_port.scala 290:28]
  wire [63:0] _GEN_776 = 5'h5 == cache_state ? 64'h0 : _GEN_703; // @[cache_single_port.scala 290:28 230:33]
  wire [63:0] _GEN_857 = 5'h4 == cache_state ? 64'h0 : _GEN_776; // @[cache_single_port.scala 290:28 230:33]
  wire [63:0] _GEN_932 = 5'h3 == cache_state ? 64'h0 : _GEN_857; // @[cache_single_port.scala 290:28 230:33]
  wire [63:0] _GEN_1009 = 5'h1 == cache_state ? 64'h0 : _GEN_932; // @[cache_single_port.scala 290:28 230:33]
  wire [63:0] _GEN_1087 = 5'h13 == cache_state ? 64'h0 : _GEN_1009; // @[cache_single_port.scala 290:28 230:33]
  wire [63:0] _GEN_1130 = 5'h11 == cache_state ? data_mem_0_io_data_read_data[127:64] : _GEN_1087; // @[cache_single_port.scala 290:28]
  wire [63:0] _GEN_1242 = 5'h10 == cache_state ? 64'h0 : _GEN_1130; // @[cache_single_port.scala 290:28 230:33]
  wire [63:0] _GEN_1326 = 5'hf == cache_state ? 64'h0 : _GEN_1242; // @[cache_single_port.scala 290:28 230:33]
  wire [63:0] cache_data_1 = 5'h0 == cache_state ? 64'h0 : _GEN_1326; // @[cache_single_port.scala 290:28 230:33]
  wire [1:0] _GEN_192 = io_mem_io_ar_ready ? 2'h3 : 2'h1; // @[cache_single_port.scala 460:36 461:49 462:44]
  wire [1:0] _GEN_193 = io_mem_io_r_valid ? 2'h0 : 2'h3; // @[cache_single_port.scala 470:48 471:44 474:44]
  wire [63:0] _GEN_210 = cpu_request_addr_reg[3] ? data_mem_2_io_data_read_data[127:64] : data_mem_2_io_data_read_data[
    63:0]; // @[Mux.scala 101:{16,16}]
  wire [63:0] _GEN_212 = cpu_request_addr_reg[3] ? data_mem_3_io_data_read_data[127:64] : data_mem_3_io_data_read_data[
    63:0]; // @[Mux.scala 101:{16,16}]
  wire [63:0] _tmp_response_data_T_12 = is_match_2 ? _GEN_210 : _GEN_212; // @[Mux.scala 101:16]
  wire [63:0] _GEN_214 = cpu_request_addr_reg[3] ? data_mem_1_io_data_read_data[127:64] : data_mem_1_io_data_read_data[
    63:0]; // @[Mux.scala 101:{16,16}]
  wire [63:0] _tmp_response_data_T_13 = is_match_1 ? _GEN_214 : _tmp_response_data_T_12; // @[Mux.scala 101:16]
  wire [63:0] _GEN_216 = cpu_request_addr_reg[3] ? data_mem_0_io_data_read_data[127:64] : data_mem_0_io_data_read_data[
    63:0]; // @[Mux.scala 101:{16,16}]
  wire [63:0] _tmp_response_data_T_14 = is_match_0 ? _GEN_216 : _tmp_response_data_T_13; // @[Mux.scala 101:16]
  wire  _GEN_219 = tag_mem_0_io_tag_read_dirty; // @[cache_single_port.scala 560:69 554:71 561:87]
  wire [7:0] _tag_mem_0_io_tag_write_visit_T = ~tag_mem_0_io_tag_read_visit; // @[cache_single_port.scala 565:87]
  wire [7:0] _tag_mem_0_io_tag_write_visit_T_3 = tag_mem_0_io_tag_read_visit + 8'h1; // @[cache_single_port.scala 565:186]
  wire [7:0] _tag_mem_0_io_tag_write_visit_T_4 = _tag_mem_0_io_tag_write_visit_T == 8'h0 ? tag_mem_0_io_tag_read_visit
     : _tag_mem_0_io_tag_write_visit_T_3; // @[cache_single_port.scala 565:85]
  wire  _GEN_220 = tag_mem_0_io_tag_read_valid; // @[cache_single_port.scala 235:44 563:81 564:76]
  wire [7:0] _GEN_221 = tag_mem_0_io_tag_read_valid ? _tag_mem_0_io_tag_write_visit_T_4 : tag_mem_0_io_tag_read_visit; // @[cache_single_port.scala 237:41 563:81 565:79]
  wire  _GEN_223 = is_match_0 | _GEN_220; // @[cache_single_port.scala 556:58 557:76]
  wire [7:0] _GEN_224 = is_match_0 ? 8'h0 : _GEN_221; // @[cache_single_port.scala 556:58 558:79]
  wire  _GEN_226 = is_match_0 ? _GEN_219 : tag_mem_0_io_tag_read_dirty; // @[cache_single_port.scala 556:58 554:71]
  wire  _GEN_227 = tag_mem_1_io_tag_read_dirty; // @[cache_single_port.scala 560:69 554:71 561:87]
  wire [7:0] _tag_mem_1_io_tag_write_visit_T = ~tag_mem_1_io_tag_read_visit; // @[cache_single_port.scala 565:87]
  wire [7:0] _tag_mem_1_io_tag_write_visit_T_3 = tag_mem_1_io_tag_read_visit + 8'h1; // @[cache_single_port.scala 565:186]
  wire [7:0] _tag_mem_1_io_tag_write_visit_T_4 = _tag_mem_1_io_tag_write_visit_T == 8'h0 ? tag_mem_1_io_tag_read_visit
     : _tag_mem_1_io_tag_write_visit_T_3; // @[cache_single_port.scala 565:85]
  wire  _GEN_228 = tag_mem_1_io_tag_read_valid; // @[cache_single_port.scala 235:44 563:81 564:76]
  wire [7:0] _GEN_229 = tag_mem_1_io_tag_read_valid ? _tag_mem_1_io_tag_write_visit_T_4 : tag_mem_1_io_tag_read_visit; // @[cache_single_port.scala 237:41 563:81 565:79]
  wire  _GEN_231 = is_match_1 | _GEN_228; // @[cache_single_port.scala 556:58 557:76]
  wire [7:0] _GEN_232 = is_match_1 ? 8'h0 : _GEN_229; // @[cache_single_port.scala 556:58 558:79]
  wire  _GEN_234 = is_match_1 ? _GEN_227 : tag_mem_1_io_tag_read_dirty; // @[cache_single_port.scala 556:58 554:71]
  wire  _GEN_235 = tag_mem_2_io_tag_read_dirty; // @[cache_single_port.scala 560:69 554:71 561:87]
  wire [7:0] _tag_mem_2_io_tag_write_visit_T = ~tag_mem_2_io_tag_read_visit; // @[cache_single_port.scala 565:87]
  wire [7:0] _tag_mem_2_io_tag_write_visit_T_3 = tag_mem_2_io_tag_read_visit + 8'h1; // @[cache_single_port.scala 565:186]
  wire [7:0] _tag_mem_2_io_tag_write_visit_T_4 = _tag_mem_2_io_tag_write_visit_T == 8'h0 ? tag_mem_2_io_tag_read_visit
     : _tag_mem_2_io_tag_write_visit_T_3; // @[cache_single_port.scala 565:85]
  wire  _GEN_236 = tag_mem_2_io_tag_read_valid; // @[cache_single_port.scala 235:44 563:81 564:76]
  wire [7:0] _GEN_237 = tag_mem_2_io_tag_read_valid ? _tag_mem_2_io_tag_write_visit_T_4 : tag_mem_2_io_tag_read_visit; // @[cache_single_port.scala 237:41 563:81 565:79]
  wire  _GEN_239 = is_match_2 | _GEN_236; // @[cache_single_port.scala 556:58 557:76]
  wire [7:0] _GEN_240 = is_match_2 ? 8'h0 : _GEN_237; // @[cache_single_port.scala 556:58 558:79]
  wire  _GEN_242 = is_match_2 ? _GEN_235 : tag_mem_2_io_tag_read_dirty; // @[cache_single_port.scala 556:58 554:71]
  wire  _GEN_243 = tag_mem_3_io_tag_read_dirty; // @[cache_single_port.scala 560:69 554:71 561:87]
  wire [7:0] _tag_mem_3_io_tag_write_visit_T = ~tag_mem_3_io_tag_read_visit; // @[cache_single_port.scala 565:87]
  wire [7:0] _tag_mem_3_io_tag_write_visit_T_3 = tag_mem_3_io_tag_read_visit + 8'h1; // @[cache_single_port.scala 565:186]
  wire [7:0] _tag_mem_3_io_tag_write_visit_T_4 = _tag_mem_3_io_tag_write_visit_T == 8'h0 ? tag_mem_3_io_tag_read_visit
     : _tag_mem_3_io_tag_write_visit_T_3; // @[cache_single_port.scala 565:85]
  wire  _GEN_244 = tag_mem_3_io_tag_read_valid; // @[cache_single_port.scala 235:44 563:81 564:76]
  wire [7:0] _GEN_245 = tag_mem_3_io_tag_read_valid ? _tag_mem_3_io_tag_write_visit_T_4 : tag_mem_3_io_tag_read_visit; // @[cache_single_port.scala 237:41 563:81 565:79]
  wire  _GEN_247 = is_match_3 | _GEN_244; // @[cache_single_port.scala 556:58 557:76]
  wire [7:0] _GEN_248 = is_match_3 ? 8'h0 : _GEN_245; // @[cache_single_port.scala 556:58 558:79]
  wire  _GEN_250 = is_match_3 ? _GEN_243 : tag_mem_3_io_tag_read_dirty; // @[cache_single_port.scala 556:58 554:71]
  wire [127:0] _data_mem_0_io_data_write_data_T = {cache_data_1,cache_data_0}; // @[cache_single_port.scala 590:102]
  wire [63:0] _GEN_463 = index ? 64'hffffffffffffffff : 64'h0; // @[cache_single_port.scala 671:55 673:{62,62}]
  wire [63:0] _GEN_434 = 2'h0 == replace ? _GEN_463 : 64'h0; // @[cache_single_port.scala 281:28 668:62]
  wire [63:0] _GEN_445 = 2'h1 == replace ? _GEN_463 : _GEN_434; // @[cache_single_port.scala 668:62]
  wire [63:0] _GEN_456 = 2'h2 == replace ? _GEN_463 : _GEN_445; // @[cache_single_port.scala 668:62]
  wire [63:0] _GEN_467 = 2'h3 == replace ? _GEN_463 : _GEN_456; // @[cache_single_port.scala 668:62]
  wire [63:0] _GEN_474 = io_mem_io_r_valid ? _GEN_467 : 64'h0; // @[cache_single_port.scala 281:28 666:48]
  wire [63:0] _GEN_551 = 5'h8 == cache_state ? _GEN_474 : 64'h0; // @[cache_single_port.scala 281:28 290:28]
  wire [63:0] _GEN_583 = 5'h9 == cache_state ? 64'h0 : _GEN_551; // @[cache_single_port.scala 281:28 290:28]
  wire [63:0] _GEN_616 = 5'hd == cache_state ? 64'h0 : _GEN_583; // @[cache_single_port.scala 281:28 290:28]
  wire [63:0] _GEN_650 = 5'hc == cache_state ? 64'h0 : _GEN_616; // @[cache_single_port.scala 281:28 290:28]
  wire [63:0] _GEN_706 = 5'h6 == cache_state ? 64'h0 : _GEN_650; // @[cache_single_port.scala 290:28]
  wire [63:0] _GEN_779 = 5'h5 == cache_state ? 64'h0 : _GEN_706; // @[cache_single_port.scala 281:28 290:28]
  wire [63:0] _GEN_860 = 5'h4 == cache_state ? 64'h0 : _GEN_779; // @[cache_single_port.scala 281:28 290:28]
  wire [63:0] _GEN_935 = 5'h3 == cache_state ? 64'h0 : _GEN_860; // @[cache_single_port.scala 281:28 290:28]
  wire [63:0] _GEN_1012 = 5'h1 == cache_state ? 64'h0 : _GEN_935; // @[cache_single_port.scala 281:28 290:28]
  wire [63:0] _GEN_1090 = 5'h13 == cache_state ? 64'h0 : _GEN_1012; // @[cache_single_port.scala 281:28 290:28]
  wire [63:0] _GEN_1177 = 5'h11 == cache_state ? 64'h0 : _GEN_1090; // @[cache_single_port.scala 281:28 290:28]
  wire [63:0] _GEN_1260 = 5'h10 == cache_state ? 64'h0 : _GEN_1177; // @[cache_single_port.scala 281:28 290:28]
  wire [63:0] _GEN_1343 = 5'hf == cache_state ? 64'h0 : _GEN_1260; // @[cache_single_port.scala 281:28 290:28]
  wire [63:0] wmask_1 = 5'h0 == cache_state ? 64'h0 : _GEN_1343; // @[cache_single_port.scala 281:28 290:28]
  wire [63:0] _GEN_462 = ~index ? 64'hffffffffffffffff : 64'h0; // @[cache_single_port.scala 671:55 673:{62,62}]
  wire [63:0] _GEN_433 = 2'h0 == replace ? _GEN_462 : 64'h0; // @[cache_single_port.scala 281:28 668:62]
  wire [63:0] _GEN_444 = 2'h1 == replace ? _GEN_462 : _GEN_433; // @[cache_single_port.scala 668:62]
  wire [63:0] _GEN_455 = 2'h2 == replace ? _GEN_462 : _GEN_444; // @[cache_single_port.scala 668:62]
  wire [63:0] _GEN_466 = 2'h3 == replace ? _GEN_462 : _GEN_455; // @[cache_single_port.scala 668:62]
  wire [63:0] _GEN_473 = io_mem_io_r_valid ? _GEN_466 : 64'h0; // @[cache_single_port.scala 281:28 666:48]
  wire [63:0] _GEN_550 = 5'h8 == cache_state ? _GEN_473 : 64'h0; // @[cache_single_port.scala 281:28 290:28]
  wire [63:0] _GEN_582 = 5'h9 == cache_state ? 64'h0 : _GEN_550; // @[cache_single_port.scala 281:28 290:28]
  wire [63:0] _GEN_615 = 5'hd == cache_state ? 64'h0 : _GEN_582; // @[cache_single_port.scala 281:28 290:28]
  wire [63:0] _GEN_649 = 5'hc == cache_state ? 64'h0 : _GEN_615; // @[cache_single_port.scala 281:28 290:28]
  wire [63:0] _GEN_705 = 5'h6 == cache_state ? 64'h0 : _GEN_649; // @[cache_single_port.scala 290:28]
  wire [63:0] _GEN_778 = 5'h5 == cache_state ? 64'h0 : _GEN_705; // @[cache_single_port.scala 281:28 290:28]
  wire [63:0] _GEN_859 = 5'h4 == cache_state ? 64'h0 : _GEN_778; // @[cache_single_port.scala 281:28 290:28]
  wire [63:0] _GEN_934 = 5'h3 == cache_state ? 64'h0 : _GEN_859; // @[cache_single_port.scala 281:28 290:28]
  wire [63:0] _GEN_1011 = 5'h1 == cache_state ? 64'h0 : _GEN_934; // @[cache_single_port.scala 281:28 290:28]
  wire [63:0] _GEN_1089 = 5'h13 == cache_state ? 64'h0 : _GEN_1011; // @[cache_single_port.scala 281:28 290:28]
  wire [63:0] _GEN_1176 = 5'h11 == cache_state ? 64'h0 : _GEN_1089; // @[cache_single_port.scala 281:28 290:28]
  wire [63:0] _GEN_1259 = 5'h10 == cache_state ? 64'h0 : _GEN_1176; // @[cache_single_port.scala 281:28 290:28]
  wire [63:0] _GEN_1342 = 5'hf == cache_state ? 64'h0 : _GEN_1259; // @[cache_single_port.scala 281:28 290:28]
  wire [63:0] wmask_0 = 5'h0 == cache_state ? 64'h0 : _GEN_1342; // @[cache_single_port.scala 281:28 290:28]
  wire [127:0] _data_mem_0_io_cache_req_wmask_T = {wmask_1,wmask_0}; // @[cache_single_port.scala 594:98]
  wire [127:0] _data_mem_0_io_cache_req_wmask_T_1 = ~_data_mem_0_io_cache_req_wmask_T; // @[cache_single_port.scala 594:91]
  wire [127:0] _GEN_298 = data_mem_0_io_data_read_data; // @[cache_single_port.scala 238:43 570:53]
  wire [127:0] _GEN_303 = data_mem_1_io_data_read_data; // @[cache_single_port.scala 238:43 570:53]
  wire [127:0] _GEN_306 = data_mem_2_io_data_read_data; // @[cache_single_port.scala 238:43 570:53]
  wire [127:0] _GEN_309 = data_mem_3_io_data_read_data; // @[cache_single_port.scala 238:43 570:53]
  wire [7:0] _GEN_313 = tag_mem_0_io_tag_read_valid & tag_mem_1_io_tag_read_valid & tag_mem_2_io_tag_read_valid &
    tag_mem_3_io_tag_read_valid ? tag_mem_1_io_tag_read_visit : 8'h0; // @[cache_single_port.scala 272:28 601:92 602:47]
  wire [7:0] _GEN_416 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? 8'h0 : _GEN_313; // @[cache_single_port.scala 272:28 537:51]
  wire [7:0] _GEN_718 = 5'h6 == cache_state ? _GEN_416 : 8'h0; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_791 = 5'h5 == cache_state ? 8'h0 : _GEN_718; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_872 = 5'h4 == cache_state ? 8'h0 : _GEN_791; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_947 = 5'h3 == cache_state ? 8'h0 : _GEN_872; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_1024 = 5'h1 == cache_state ? 8'h0 : _GEN_947; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_1102 = 5'h13 == cache_state ? 8'h0 : _GEN_1024; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_1186 = 5'h11 == cache_state ? 8'h0 : _GEN_1102; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_1269 = 5'h10 == cache_state ? 8'h0 : _GEN_1186; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_1352 = 5'hf == cache_state ? 8'h0 : _GEN_1269; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] visit_1 = 5'h0 == cache_state ? 8'h0 : _GEN_1352; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_312 = tag_mem_0_io_tag_read_valid & tag_mem_1_io_tag_read_valid & tag_mem_2_io_tag_read_valid &
    tag_mem_3_io_tag_read_valid ? tag_mem_0_io_tag_read_visit : 8'h0; // @[cache_single_port.scala 272:28 601:92 602:47]
  wire [7:0] _GEN_415 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? 8'h0 : _GEN_312; // @[cache_single_port.scala 272:28 537:51]
  wire [7:0] _GEN_717 = 5'h6 == cache_state ? _GEN_415 : 8'h0; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_790 = 5'h5 == cache_state ? 8'h0 : _GEN_717; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_871 = 5'h4 == cache_state ? 8'h0 : _GEN_790; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_946 = 5'h3 == cache_state ? 8'h0 : _GEN_871; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_1023 = 5'h1 == cache_state ? 8'h0 : _GEN_946; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_1101 = 5'h13 == cache_state ? 8'h0 : _GEN_1023; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_1185 = 5'h11 == cache_state ? 8'h0 : _GEN_1101; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_1268 = 5'h10 == cache_state ? 8'h0 : _GEN_1185; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_1351 = 5'hf == cache_state ? 8'h0 : _GEN_1268; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] visit_0 = 5'h0 == cache_state ? 8'h0 : _GEN_1351; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_315 = tag_mem_0_io_tag_read_valid & tag_mem_1_io_tag_read_valid & tag_mem_2_io_tag_read_valid &
    tag_mem_3_io_tag_read_valid ? tag_mem_3_io_tag_read_visit : 8'h0; // @[cache_single_port.scala 272:28 601:92 602:47]
  wire [7:0] _GEN_418 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? 8'h0 : _GEN_315; // @[cache_single_port.scala 272:28 537:51]
  wire [7:0] _GEN_720 = 5'h6 == cache_state ? _GEN_418 : 8'h0; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_793 = 5'h5 == cache_state ? 8'h0 : _GEN_720; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_874 = 5'h4 == cache_state ? 8'h0 : _GEN_793; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_949 = 5'h3 == cache_state ? 8'h0 : _GEN_874; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_1026 = 5'h1 == cache_state ? 8'h0 : _GEN_949; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_1104 = 5'h13 == cache_state ? 8'h0 : _GEN_1026; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_1188 = 5'h11 == cache_state ? 8'h0 : _GEN_1104; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_1271 = 5'h10 == cache_state ? 8'h0 : _GEN_1188; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_1354 = 5'hf == cache_state ? 8'h0 : _GEN_1271; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] visit_3 = 5'h0 == cache_state ? 8'h0 : _GEN_1354; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_314 = tag_mem_0_io_tag_read_valid & tag_mem_1_io_tag_read_valid & tag_mem_2_io_tag_read_valid &
    tag_mem_3_io_tag_read_valid ? tag_mem_2_io_tag_read_visit : 8'h0; // @[cache_single_port.scala 272:28 601:92 602:47]
  wire [7:0] _GEN_417 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? 8'h0 : _GEN_314; // @[cache_single_port.scala 272:28 537:51]
  wire [7:0] _GEN_719 = 5'h6 == cache_state ? _GEN_417 : 8'h0; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_792 = 5'h5 == cache_state ? 8'h0 : _GEN_719; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_873 = 5'h4 == cache_state ? 8'h0 : _GEN_792; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_948 = 5'h3 == cache_state ? 8'h0 : _GEN_873; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_1025 = 5'h1 == cache_state ? 8'h0 : _GEN_948; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_1103 = 5'h13 == cache_state ? 8'h0 : _GEN_1025; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_1187 = 5'h11 == cache_state ? 8'h0 : _GEN_1103; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_1270 = 5'h10 == cache_state ? 8'h0 : _GEN_1187; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_1353 = 5'hf == cache_state ? 8'h0 : _GEN_1270; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] visit_2 = 5'h0 == cache_state ? 8'h0 : _GEN_1353; // @[cache_single_port.scala 272:28 290:28]
  wire  _GEN_317 = tag_mem_0_io_tag_read_valid & tag_mem_1_io_tag_read_valid & tag_mem_2_io_tag_read_valid &
    tag_mem_3_io_tag_read_valid & visit_3 > visit_2; // @[cache_single_port.scala 601:92 604:53]
  wire  _GEN_420 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? 1'h0 : _GEN_317; // @[cache_single_port.scala 537:51]
  wire  _GEN_795 = 5'h5 == cache_state ? 1'h0 : 5'h6 == cache_state & _GEN_420; // @[cache_single_port.scala 290:28]
  wire  _GEN_876 = 5'h4 == cache_state ? 1'h0 : _GEN_795; // @[cache_single_port.scala 290:28]
  wire  _GEN_951 = 5'h3 == cache_state ? 1'h0 : _GEN_876; // @[cache_single_port.scala 290:28]
  wire  _GEN_1028 = 5'h1 == cache_state ? 1'h0 : _GEN_951; // @[cache_single_port.scala 290:28]
  wire  _GEN_1106 = 5'h13 == cache_state ? 1'h0 : _GEN_1028; // @[cache_single_port.scala 290:28]
  wire  _GEN_1190 = 5'h11 == cache_state ? 1'h0 : _GEN_1106; // @[cache_single_port.scala 290:28]
  wire  _GEN_1273 = 5'h10 == cache_state ? 1'h0 : _GEN_1190; // @[cache_single_port.scala 290:28]
  wire  _GEN_1356 = 5'hf == cache_state ? 1'h0 : _GEN_1273; // @[cache_single_port.scala 290:28]
  wire  compare_2_3 = 5'h0 == cache_state ? 1'h0 : _GEN_1356; // @[cache_single_port.scala 290:28]
  wire [7:0] _max_01_or_23_T = compare_2_3 ? visit_3 : visit_2; // @[cache_single_port.scala 605:60]
  wire  _GEN_316 = tag_mem_0_io_tag_read_valid & tag_mem_1_io_tag_read_valid & tag_mem_2_io_tag_read_valid &
    tag_mem_3_io_tag_read_valid & visit_1 > visit_0; // @[cache_single_port.scala 601:92 603:53]
  wire  _GEN_419 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? 1'h0 : _GEN_316; // @[cache_single_port.scala 537:51]
  wire  _GEN_794 = 5'h5 == cache_state ? 1'h0 : 5'h6 == cache_state & _GEN_419; // @[cache_single_port.scala 290:28]
  wire  _GEN_875 = 5'h4 == cache_state ? 1'h0 : _GEN_794; // @[cache_single_port.scala 290:28]
  wire  _GEN_950 = 5'h3 == cache_state ? 1'h0 : _GEN_875; // @[cache_single_port.scala 290:28]
  wire  _GEN_1027 = 5'h1 == cache_state ? 1'h0 : _GEN_950; // @[cache_single_port.scala 290:28]
  wire  _GEN_1105 = 5'h13 == cache_state ? 1'h0 : _GEN_1027; // @[cache_single_port.scala 290:28]
  wire  _GEN_1189 = 5'h11 == cache_state ? 1'h0 : _GEN_1105; // @[cache_single_port.scala 290:28]
  wire  _GEN_1272 = 5'h10 == cache_state ? 1'h0 : _GEN_1189; // @[cache_single_port.scala 290:28]
  wire  _GEN_1355 = 5'hf == cache_state ? 1'h0 : _GEN_1272; // @[cache_single_port.scala 290:28]
  wire  compare_1_0 = 5'h0 == cache_state ? 1'h0 : _GEN_1355; // @[cache_single_port.scala 290:28]
  wire [7:0] _max_01_or_23_T_1 = compare_1_0 ? visit_1 : visit_0; // @[cache_single_port.scala 605:99]
  wire  _GEN_318 = tag_mem_0_io_tag_read_valid & tag_mem_1_io_tag_read_valid & tag_mem_2_io_tag_read_valid &
    tag_mem_3_io_tag_read_valid & _max_01_or_23_T > _max_01_or_23_T_1; // @[cache_single_port.scala 601:92 605:54]
  wire  _GEN_421 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? 1'h0 : _GEN_318; // @[cache_single_port.scala 537:51]
  wire  _GEN_796 = 5'h5 == cache_state ? 1'h0 : 5'h6 == cache_state & _GEN_421; // @[cache_single_port.scala 290:28]
  wire  _GEN_877 = 5'h4 == cache_state ? 1'h0 : _GEN_796; // @[cache_single_port.scala 290:28]
  wire  _GEN_952 = 5'h3 == cache_state ? 1'h0 : _GEN_877; // @[cache_single_port.scala 290:28]
  wire  _GEN_1029 = 5'h1 == cache_state ? 1'h0 : _GEN_952; // @[cache_single_port.scala 290:28]
  wire  _GEN_1107 = 5'h13 == cache_state ? 1'h0 : _GEN_1029; // @[cache_single_port.scala 290:28]
  wire  _GEN_1191 = 5'h11 == cache_state ? 1'h0 : _GEN_1107; // @[cache_single_port.scala 290:28]
  wire  _GEN_1274 = 5'h10 == cache_state ? 1'h0 : _GEN_1191; // @[cache_single_port.scala 290:28]
  wire  _GEN_1357 = 5'hf == cache_state ? 1'h0 : _GEN_1274; // @[cache_single_port.scala 290:28]
  wire  max_01_or_23 = 5'h0 == cache_state ? 1'h0 : _GEN_1357; // @[cache_single_port.scala 290:28]
  wire  _max_T = max_01_or_23 ? compare_2_3 : compare_1_0; // @[cache_single_port.scala 606:69]
  wire [1:0] _max_T_1 = {max_01_or_23,_max_T}; // @[Cat.scala 31:58]
  wire  _max_T_2 = ~tag_mem_1_io_tag_read_valid; // @[cache_single_port.scala 609:97]
  wire  _max_T_3 = ~tag_mem_2_io_tag_read_valid; // @[cache_single_port.scala 609:144]
  wire  _max_T_4 = ~tag_mem_3_io_tag_read_valid; // @[cache_single_port.scala 609:191]
  wire [1:0] _max_T_5 = _max_T_4 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _max_T_6 = _max_T_3 ? 2'h2 : _max_T_5; // @[Mux.scala 101:16]
  wire [1:0] _max_T_7 = _max_T_2 ? 2'h1 : _max_T_6; // @[Mux.scala 101:16]
  wire [1:0] _GEN_319 = tag_mem_0_io_tag_read_valid & tag_mem_1_io_tag_read_valid & tag_mem_2_io_tag_read_valid &
    tag_mem_3_io_tag_read_valid ? _max_T_1 : _max_T_7; // @[cache_single_port.scala 601:92 606:45 609:45]
  wire [1:0] _GEN_422 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? 2'h0 : _GEN_319; // @[cache_single_port.scala 537:51]
  wire [1:0] _GEN_724 = 5'h6 == cache_state ? _GEN_422 : 2'h0; // @[cache_single_port.scala 290:28]
  wire [1:0] _GEN_797 = 5'h5 == cache_state ? 2'h0 : _GEN_724; // @[cache_single_port.scala 290:28]
  wire [1:0] _GEN_878 = 5'h4 == cache_state ? 2'h0 : _GEN_797; // @[cache_single_port.scala 290:28]
  wire [1:0] _GEN_953 = 5'h3 == cache_state ? 2'h0 : _GEN_878; // @[cache_single_port.scala 290:28]
  wire [1:0] _GEN_1030 = 5'h1 == cache_state ? 2'h0 : _GEN_953; // @[cache_single_port.scala 290:28]
  wire [1:0] _GEN_1108 = 5'h13 == cache_state ? 2'h0 : _GEN_1030; // @[cache_single_port.scala 290:28]
  wire [1:0] _GEN_1192 = 5'h11 == cache_state ? 2'h0 : _GEN_1108; // @[cache_single_port.scala 290:28]
  wire [1:0] _GEN_1275 = 5'h10 == cache_state ? 2'h0 : _GEN_1192; // @[cache_single_port.scala 290:28]
  wire [1:0] _GEN_1358 = 5'hf == cache_state ? 2'h0 : _GEN_1275; // @[cache_single_port.scala 290:28]
  wire [1:0] max = 5'h0 == cache_state ? 2'h0 : _GEN_1358; // @[cache_single_port.scala 290:28]
  wire [31:0] _refill_addr_T_1 = {cpu_request_addr_reg[31:4],4'h0}; // @[Cat.scala 31:58]
  wire  _T_105 = 2'h0 == max; // @[cache_single_port.scala 616:50]
  wire [3:0] _GEN_321 = ~tag_mem_0_io_tag_read_valid | ~tag_mem_0_io_tag_read_dirty ? 4'h9 : 4'h7; // @[cache_single_port.scala 622:119 623:68 626:68]
  wire  _GEN_324 = 2'h0 == max | tag_mem_0_io_tag_read_valid; // @[cache_single_port.scala 237:41 616:58 618:79]
  wire  _GEN_325 = 2'h0 == max ? 1'h0 : tag_mem_0_io_tag_read_dirty; // @[cache_single_port.scala 237:41 616:58 619:79]
  wire [21:0] _GEN_326 = 2'h0 == max ? cpu_request_addr_tag : tag_mem_0_io_tag_read_tag; // @[cache_single_port.scala 237:41 616:58 620:77]
  wire [7:0] _GEN_327 = 2'h0 == max ? 8'h0 : tag_mem_0_io_tag_read_visit; // @[cache_single_port.scala 237:41 616:58 621:79]
  wire [3:0] _GEN_328 = 2'h0 == max ? _GEN_321 : 4'h0; // @[cache_single_port.scala 616:58]
  wire  _T_109 = 2'h1 == max; // @[cache_single_port.scala 616:50]
  wire [3:0] _GEN_330 = _max_T_2 | ~tag_mem_1_io_tag_read_dirty ? 4'h9 : 4'h7; // @[cache_single_port.scala 622:119 623:68 626:68]
  wire  _GEN_333 = 2'h1 == max | tag_mem_1_io_tag_read_valid; // @[cache_single_port.scala 237:41 616:58 618:79]
  wire  _GEN_334 = 2'h1 == max ? 1'h0 : tag_mem_1_io_tag_read_dirty; // @[cache_single_port.scala 237:41 616:58 619:79]
  wire [21:0] _GEN_335 = 2'h1 == max ? cpu_request_addr_tag : tag_mem_1_io_tag_read_tag; // @[cache_single_port.scala 237:41 616:58 620:77]
  wire [7:0] _GEN_336 = 2'h1 == max ? 8'h0 : tag_mem_1_io_tag_read_visit; // @[cache_single_port.scala 237:41 616:58 621:79]
  wire [3:0] _GEN_337 = 2'h1 == max ? _GEN_330 : _GEN_328; // @[cache_single_port.scala 616:58]
  wire  _T_113 = 2'h2 == max; // @[cache_single_port.scala 616:50]
  wire [3:0] _GEN_339 = _max_T_3 | ~tag_mem_2_io_tag_read_dirty ? 4'h9 : 4'h7; // @[cache_single_port.scala 622:119 623:68 626:68]
  wire  _GEN_342 = 2'h2 == max | tag_mem_2_io_tag_read_valid; // @[cache_single_port.scala 237:41 616:58 618:79]
  wire  _GEN_343 = 2'h2 == max ? 1'h0 : tag_mem_2_io_tag_read_dirty; // @[cache_single_port.scala 237:41 616:58 619:79]
  wire [21:0] _GEN_344 = 2'h2 == max ? cpu_request_addr_tag : tag_mem_2_io_tag_read_tag; // @[cache_single_port.scala 237:41 616:58 620:77]
  wire [7:0] _GEN_345 = 2'h2 == max ? 8'h0 : tag_mem_2_io_tag_read_visit; // @[cache_single_port.scala 237:41 616:58 621:79]
  wire [3:0] _GEN_346 = 2'h2 == max ? _GEN_339 : _GEN_337; // @[cache_single_port.scala 616:58]
  wire  _T_117 = 2'h3 == max; // @[cache_single_port.scala 616:50]
  wire [3:0] _GEN_348 = _max_T_4 | ~tag_mem_3_io_tag_read_dirty ? 4'h9 : 4'h7; // @[cache_single_port.scala 622:119 623:68 626:68]
  wire  _GEN_351 = 2'h3 == max | tag_mem_3_io_tag_read_valid; // @[cache_single_port.scala 237:41 616:58 618:79]
  wire  _GEN_352 = 2'h3 == max ? 1'h0 : tag_mem_3_io_tag_read_dirty; // @[cache_single_port.scala 237:41 616:58 619:79]
  wire [21:0] _GEN_353 = 2'h3 == max ? cpu_request_addr_tag : tag_mem_3_io_tag_read_tag; // @[cache_single_port.scala 237:41 616:58 620:77]
  wire [7:0] _GEN_354 = 2'h3 == max ? 8'h0 : tag_mem_3_io_tag_read_visit; // @[cache_single_port.scala 237:41 616:58 621:79]
  wire [3:0] _GEN_355 = 2'h3 == max ? _GEN_348 : _GEN_346; // @[cache_single_port.scala 616:58]
  wire  _GEN_357 = 2'h0 != max & tag_mem_0_io_tag_read_valid | _T_105; // @[cache_single_port.scala 632:92 633:76]
  wire  _GEN_358 = 2'h0 != max & tag_mem_0_io_tag_read_valid | _GEN_324; // @[cache_single_port.scala 632:92 634:79]
  wire  _GEN_359 = 2'h0 != max & tag_mem_0_io_tag_read_valid ? tag_mem_0_io_tag_read_dirty : _GEN_325; // @[cache_single_port.scala 632:92 635:79]
  wire [7:0] _GEN_360 = 2'h0 != max & tag_mem_0_io_tag_read_valid ? _tag_mem_0_io_tag_write_visit_T_4 : _GEN_327; // @[cache_single_port.scala 632:92 636:79]
  wire [21:0] _GEN_361 = 2'h0 != max & tag_mem_0_io_tag_read_valid ? tag_mem_0_io_tag_read_tag : _GEN_326; // @[cache_single_port.scala 632:92 637:77]
  wire  _GEN_362 = 2'h1 != max & tag_mem_1_io_tag_read_valid | _T_109; // @[cache_single_port.scala 632:92 633:76]
  wire  _GEN_363 = 2'h1 != max & tag_mem_1_io_tag_read_valid | _GEN_333; // @[cache_single_port.scala 632:92 634:79]
  wire  _GEN_364 = 2'h1 != max & tag_mem_1_io_tag_read_valid ? tag_mem_1_io_tag_read_dirty : _GEN_334; // @[cache_single_port.scala 632:92 635:79]
  wire [7:0] _GEN_365 = 2'h1 != max & tag_mem_1_io_tag_read_valid ? _tag_mem_1_io_tag_write_visit_T_4 : _GEN_336; // @[cache_single_port.scala 632:92 636:79]
  wire [21:0] _GEN_366 = 2'h1 != max & tag_mem_1_io_tag_read_valid ? tag_mem_1_io_tag_read_tag : _GEN_335; // @[cache_single_port.scala 632:92 637:77]
  wire  _GEN_367 = 2'h2 != max & tag_mem_2_io_tag_read_valid | _T_113; // @[cache_single_port.scala 632:92 633:76]
  wire  _GEN_368 = 2'h2 != max & tag_mem_2_io_tag_read_valid | _GEN_342; // @[cache_single_port.scala 632:92 634:79]
  wire  _GEN_369 = 2'h2 != max & tag_mem_2_io_tag_read_valid ? tag_mem_2_io_tag_read_dirty : _GEN_343; // @[cache_single_port.scala 632:92 635:79]
  wire [7:0] _GEN_370 = 2'h2 != max & tag_mem_2_io_tag_read_valid ? _tag_mem_2_io_tag_write_visit_T_4 : _GEN_345; // @[cache_single_port.scala 632:92 636:79]
  wire [21:0] _GEN_371 = 2'h2 != max & tag_mem_2_io_tag_read_valid ? tag_mem_2_io_tag_read_tag : _GEN_344; // @[cache_single_port.scala 632:92 637:77]
  wire  _GEN_372 = 2'h3 != max & tag_mem_3_io_tag_read_valid | _T_117; // @[cache_single_port.scala 632:92 633:76]
  wire  _GEN_373 = 2'h3 != max & tag_mem_3_io_tag_read_valid | _GEN_351; // @[cache_single_port.scala 632:92 634:79]
  wire  _GEN_374 = 2'h3 != max & tag_mem_3_io_tag_read_valid ? tag_mem_3_io_tag_read_dirty : _GEN_352; // @[cache_single_port.scala 632:92 635:79]
  wire [7:0] _GEN_375 = 2'h3 != max & tag_mem_3_io_tag_read_valid ? _tag_mem_3_io_tag_write_visit_T_4 : _GEN_354; // @[cache_single_port.scala 632:92 636:79]
  wire [21:0] _GEN_376 = 2'h3 != max & tag_mem_3_io_tag_read_valid ? tag_mem_3_io_tag_read_tag : _GEN_353; // @[cache_single_port.scala 632:92 637:77]
  wire [63:0] _GEN_377 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _tmp_response_data_T_14 : tmp_response_data
    ; // @[cache_single_port.scala 285:40 537:51]
  wire [3:0] _GEN_378 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? 4'hc : _GEN_355; // @[cache_single_port.scala 537:51]
  wire  _GEN_379 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_226 : _GEN_359; // @[cache_single_port.scala 537:51]
  wire [21:0] _GEN_380 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? tag_mem_0_io_tag_read_tag : _GEN_361; // @[cache_single_port.scala 537:51 555:69]
  wire  _GEN_381 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_223 : _GEN_357; // @[cache_single_port.scala 537:51]
  wire [7:0] _GEN_382 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_224 : _GEN_360; // @[cache_single_port.scala 537:51]
  wire  _GEN_383 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_223 : _GEN_358; // @[cache_single_port.scala 537:51]
  wire  _GEN_384 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_234 : _GEN_364; // @[cache_single_port.scala 537:51]
  wire [21:0] _GEN_385 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? tag_mem_1_io_tag_read_tag : _GEN_366; // @[cache_single_port.scala 537:51 555:69]
  wire  _GEN_386 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_231 : _GEN_362; // @[cache_single_port.scala 537:51]
  wire [7:0] _GEN_387 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_232 : _GEN_365; // @[cache_single_port.scala 537:51]
  wire  _GEN_388 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_231 : _GEN_363; // @[cache_single_port.scala 537:51]
  wire  _GEN_389 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_242 : _GEN_369; // @[cache_single_port.scala 537:51]
  wire [21:0] _GEN_390 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? tag_mem_2_io_tag_read_tag : _GEN_371; // @[cache_single_port.scala 537:51 555:69]
  wire  _GEN_391 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_239 : _GEN_367; // @[cache_single_port.scala 537:51]
  wire [7:0] _GEN_392 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_240 : _GEN_370; // @[cache_single_port.scala 537:51]
  wire  _GEN_393 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_239 : _GEN_368; // @[cache_single_port.scala 537:51]
  wire  _GEN_394 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_250 : _GEN_374; // @[cache_single_port.scala 537:51]
  wire [21:0] _GEN_395 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? tag_mem_3_io_tag_read_tag : _GEN_376; // @[cache_single_port.scala 537:51 555:69]
  wire  _GEN_396 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_247 : _GEN_372; // @[cache_single_port.scala 537:51]
  wire [7:0] _GEN_397 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_248 : _GEN_375; // @[cache_single_port.scala 537:51]
  wire  _GEN_398 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_247 : _GEN_373; // @[cache_single_port.scala 537:51]
  wire [127:0] _GEN_402 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_298 : data_mem_0_io_data_read_data; // @[cache_single_port.scala 238:43 537:51]
  wire [127:0] _GEN_407 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_303 : data_mem_1_io_data_read_data; // @[cache_single_port.scala 238:43 537:51]
  wire [127:0] _GEN_410 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_306 : data_mem_2_io_data_read_data; // @[cache_single_port.scala 238:43 537:51]
  wire [127:0] _GEN_413 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_309 : data_mem_3_io_data_read_data; // @[cache_single_port.scala 238:43 537:51]
  wire [1:0] _GEN_423 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? replace : max; // @[cache_single_port.scala 165:30 537:51]
  wire [31:0] _GEN_424 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? refill_addr : _refill_addr_T_1; // @[cache_single_port.scala 166:34 537:51 613:45]
  wire [3:0] _GEN_426 = io_mem_io_ar_ready ? 4'h8 : 4'h9; // @[cache_single_port.scala 655:36 657:49 658:44]
  wire [127:0] _GEN_435 = 2'h0 == replace ? _data_mem_0_io_data_write_data_T : data_mem_0_io_data_read_data; // @[cache_single_port.scala 238:43 668:62 674:80]
  wire [127:0] _GEN_436 = 2'h0 == replace ? _data_mem_0_io_cache_req_wmask_T_1 : 128'h0; // @[cache_single_port.scala 240:48 668:62 675:80]
  wire [127:0] _GEN_446 = 2'h1 == replace ? _data_mem_0_io_data_write_data_T : data_mem_1_io_data_read_data; // @[cache_single_port.scala 238:43 668:62 674:80]
  wire [127:0] _GEN_447 = 2'h1 == replace ? _data_mem_0_io_cache_req_wmask_T_1 : 128'h0; // @[cache_single_port.scala 240:48 668:62 675:80]
  wire [127:0] _GEN_457 = 2'h2 == replace ? _data_mem_0_io_data_write_data_T : data_mem_2_io_data_read_data; // @[cache_single_port.scala 238:43 668:62 674:80]
  wire [127:0] _GEN_458 = 2'h2 == replace ? _data_mem_0_io_cache_req_wmask_T_1 : 128'h0; // @[cache_single_port.scala 240:48 668:62 675:80]
  wire [127:0] _GEN_468 = 2'h3 == replace ? _data_mem_0_io_data_write_data_T : data_mem_3_io_data_read_data; // @[cache_single_port.scala 238:43 668:62 674:80]
  wire [127:0] _GEN_469 = 2'h3 == replace ? _data_mem_0_io_cache_req_wmask_T_1 : 128'h0; // @[cache_single_port.scala 240:48 668:62 675:80]
  wire [127:0] _GEN_475 = io_mem_io_r_valid ? _GEN_435 : data_mem_0_io_data_read_data; // @[cache_single_port.scala 238:43 666:48]
  wire [127:0] _GEN_476 = io_mem_io_r_valid ? _GEN_436 : 128'h0; // @[cache_single_port.scala 240:48 666:48]
  wire  _GEN_477 = io_mem_io_r_valid & _T_141; // @[cache_single_port.scala 236:45 666:48]
  wire [127:0] _GEN_478 = io_mem_io_r_valid ? _GEN_446 : data_mem_1_io_data_read_data; // @[cache_single_port.scala 238:43 666:48]
  wire [127:0] _GEN_479 = io_mem_io_r_valid ? _GEN_447 : 128'h0; // @[cache_single_port.scala 240:48 666:48]
  wire  _GEN_480 = io_mem_io_r_valid & _T_142; // @[cache_single_port.scala 236:45 666:48]
  wire [127:0] _GEN_481 = io_mem_io_r_valid ? _GEN_457 : data_mem_2_io_data_read_data; // @[cache_single_port.scala 238:43 666:48]
  wire [127:0] _GEN_482 = io_mem_io_r_valid ? _GEN_458 : 128'h0; // @[cache_single_port.scala 240:48 666:48]
  wire  _GEN_483 = io_mem_io_r_valid & _T_143; // @[cache_single_port.scala 236:45 666:48]
  wire [127:0] _GEN_484 = io_mem_io_r_valid ? _GEN_468 : data_mem_3_io_data_read_data; // @[cache_single_port.scala 238:43 666:48]
  wire [127:0] _GEN_485 = io_mem_io_r_valid ? _GEN_469 : 128'h0; // @[cache_single_port.scala 240:48 666:48]
  wire  _GEN_486 = io_mem_io_r_valid & _T_144; // @[cache_single_port.scala 236:45 666:48]
  wire [3:0] _GEN_487 = io_mem_io_r_bits_last ? 4'he : 4'h8; // @[cache_single_port.scala 665:36 684:52 685:44]
  wire  _GEN_488 = io_mem_io_r_bits_last ? 1'h0 : _GEN_0; // @[cache_single_port.scala 684:52 686:39]
  wire [3:0] _GEN_517 = 5'hb == cache_state ? 4'hb : 4'h0; // @[cache_single_port.scala 290:28]
  wire [3:0] _GEN_518 = 5'h7 == cache_state ? 4'h7 : _GEN_517; // @[cache_single_port.scala 290:28]
  wire [3:0] _GEN_532 = 5'he == cache_state ? 4'h6 : _GEN_518; // @[cache_single_port.scala 290:28 690:36]
  wire [3:0] _GEN_547 = 5'h8 == cache_state ? _GEN_487 : _GEN_532; // @[cache_single_port.scala 290:28]
  wire [127:0] _GEN_552 = 5'h8 == cache_state ? _GEN_475 : data_mem_0_io_data_read_data; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_553 = 5'h8 == cache_state ? _GEN_476 : 128'h0; // @[cache_single_port.scala 290:28 240:48]
  wire [127:0] _GEN_555 = 5'h8 == cache_state ? _GEN_478 : data_mem_1_io_data_read_data; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_556 = 5'h8 == cache_state ? _GEN_479 : 128'h0; // @[cache_single_port.scala 290:28 240:48]
  wire [127:0] _GEN_558 = 5'h8 == cache_state ? _GEN_481 : data_mem_2_io_data_read_data; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_559 = 5'h8 == cache_state ? _GEN_482 : 128'h0; // @[cache_single_port.scala 290:28 240:48]
  wire [127:0] _GEN_561 = 5'h8 == cache_state ? _GEN_484 : data_mem_3_io_data_read_data; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_562 = 5'h8 == cache_state ? _GEN_485 : 128'h0; // @[cache_single_port.scala 290:28 240:48]
  wire  _GEN_565 = 5'h8 == cache_state ? _GEN_488 : _GEN_0; // @[cache_single_port.scala 290:28]
  wire [3:0] _GEN_577 = 5'h9 == cache_state ? _GEN_426 : _GEN_547; // @[cache_single_port.scala 290:28]
  wire [31:0] _GEN_578 = 5'h9 == cache_state ? refill_addr : cpu_request_addr_reg; // @[cache_single_port.scala 290:28 255:32 656:48]
  wire  _GEN_579 = 5'h9 == cache_state ? 1'h0 : 5'h8 == cache_state; // @[cache_single_port.scala 266:27 290:28]
  wire [127:0] _GEN_584 = 5'h9 == cache_state ? data_mem_0_io_data_read_data : _GEN_552; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_585 = 5'h9 == cache_state ? 128'h0 : _GEN_553; // @[cache_single_port.scala 290:28 240:48]
  wire  _GEN_586 = 5'h9 == cache_state ? 1'h0 : 5'h8 == cache_state & _GEN_477; // @[cache_single_port.scala 290:28 236:45]
  wire [127:0] _GEN_587 = 5'h9 == cache_state ? data_mem_1_io_data_read_data : _GEN_555; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_588 = 5'h9 == cache_state ? 128'h0 : _GEN_556; // @[cache_single_port.scala 290:28 240:48]
  wire  _GEN_589 = 5'h9 == cache_state ? 1'h0 : 5'h8 == cache_state & _GEN_480; // @[cache_single_port.scala 290:28 236:45]
  wire [127:0] _GEN_590 = 5'h9 == cache_state ? data_mem_2_io_data_read_data : _GEN_558; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_591 = 5'h9 == cache_state ? 128'h0 : _GEN_559; // @[cache_single_port.scala 290:28 240:48]
  wire  _GEN_592 = 5'h9 == cache_state ? 1'h0 : 5'h8 == cache_state & _GEN_483; // @[cache_single_port.scala 290:28 236:45]
  wire [127:0] _GEN_593 = 5'h9 == cache_state ? data_mem_3_io_data_read_data : _GEN_561; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_594 = 5'h9 == cache_state ? 128'h0 : _GEN_562; // @[cache_single_port.scala 290:28 240:48]
  wire  _GEN_595 = 5'h9 == cache_state ? 1'h0 : 5'h8 == cache_state & _GEN_486; // @[cache_single_port.scala 290:28 236:45]
  wire  _GEN_597 = 5'h9 == cache_state ? _GEN_0 : _GEN_565; // @[cache_single_port.scala 290:28]
  wire [3:0] _GEN_608 = 5'hd == cache_state ? 4'h0 : _GEN_577; // @[cache_single_port.scala 290:28 649:36]
  wire  _GEN_609 = 5'hd == cache_state ? 1'h0 : 5'h9 == cache_state; // @[cache_single_port.scala 254:28 290:28]
  wire [31:0] _GEN_611 = 5'hd == cache_state ? cpu_request_addr_reg : _GEN_578; // @[cache_single_port.scala 290:28 255:32]
  wire  _GEN_612 = 5'hd == cache_state ? 1'h0 : _GEN_579; // @[cache_single_port.scala 266:27 290:28]
  wire [127:0] _GEN_617 = 5'hd == cache_state ? data_mem_0_io_data_read_data : _GEN_584; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_618 = 5'hd == cache_state ? 128'h0 : _GEN_585; // @[cache_single_port.scala 290:28 240:48]
  wire  _GEN_619 = 5'hd == cache_state ? 1'h0 : _GEN_586; // @[cache_single_port.scala 290:28 236:45]
  wire [127:0] _GEN_620 = 5'hd == cache_state ? data_mem_1_io_data_read_data : _GEN_587; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_621 = 5'hd == cache_state ? 128'h0 : _GEN_588; // @[cache_single_port.scala 290:28 240:48]
  wire  _GEN_622 = 5'hd == cache_state ? 1'h0 : _GEN_589; // @[cache_single_port.scala 290:28 236:45]
  wire [127:0] _GEN_623 = 5'hd == cache_state ? data_mem_2_io_data_read_data : _GEN_590; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_624 = 5'hd == cache_state ? 128'h0 : _GEN_591; // @[cache_single_port.scala 290:28 240:48]
  wire  _GEN_625 = 5'hd == cache_state ? 1'h0 : _GEN_592; // @[cache_single_port.scala 290:28 236:45]
  wire [127:0] _GEN_626 = 5'hd == cache_state ? data_mem_3_io_data_read_data : _GEN_593; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_627 = 5'hd == cache_state ? 128'h0 : _GEN_594; // @[cache_single_port.scala 290:28 240:48]
  wire  _GEN_628 = 5'hd == cache_state ? 1'h0 : _GEN_595; // @[cache_single_port.scala 290:28 236:45]
  wire  _GEN_630 = 5'hd == cache_state ? _GEN_0 : _GEN_597; // @[cache_single_port.scala 290:28]
  wire  _GEN_640 = 5'hc == cache_state | 5'hd == cache_state; // @[cache_single_port.scala 290:28 643:47]
  wire [63:0] _GEN_641 = 5'hc == cache_state ? tmp_response_data : 64'h0; // @[cache_single_port.scala 290:28 245:30 644:46]
  wire [3:0] _GEN_642 = 5'hc == cache_state ? 4'h0 : _GEN_608; // @[cache_single_port.scala 290:28 645:36]
  wire  _GEN_643 = 5'hc == cache_state ? 1'h0 : _GEN_609; // @[cache_single_port.scala 254:28 290:28]
  wire [31:0] _GEN_645 = 5'hc == cache_state ? cpu_request_addr_reg : _GEN_611; // @[cache_single_port.scala 290:28 255:32]
  wire  _GEN_646 = 5'hc == cache_state ? 1'h0 : _GEN_612; // @[cache_single_port.scala 266:27 290:28]
  wire [127:0] _GEN_651 = 5'hc == cache_state ? data_mem_0_io_data_read_data : _GEN_617; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_652 = 5'hc == cache_state ? 128'h0 : _GEN_618; // @[cache_single_port.scala 290:28 240:48]
  wire  _GEN_653 = 5'hc == cache_state ? 1'h0 : _GEN_619; // @[cache_single_port.scala 290:28 236:45]
  wire [127:0] _GEN_654 = 5'hc == cache_state ? data_mem_1_io_data_read_data : _GEN_620; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_655 = 5'hc == cache_state ? 128'h0 : _GEN_621; // @[cache_single_port.scala 290:28 240:48]
  wire  _GEN_656 = 5'hc == cache_state ? 1'h0 : _GEN_622; // @[cache_single_port.scala 290:28 236:45]
  wire [127:0] _GEN_657 = 5'hc == cache_state ? data_mem_2_io_data_read_data : _GEN_623; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_658 = 5'hc == cache_state ? 128'h0 : _GEN_624; // @[cache_single_port.scala 290:28 240:48]
  wire  _GEN_659 = 5'hc == cache_state ? 1'h0 : _GEN_625; // @[cache_single_port.scala 290:28 236:45]
  wire [127:0] _GEN_660 = 5'hc == cache_state ? data_mem_3_io_data_read_data : _GEN_626; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_661 = 5'hc == cache_state ? 128'h0 : _GEN_627; // @[cache_single_port.scala 290:28 240:48]
  wire  _GEN_662 = 5'hc == cache_state ? 1'h0 : _GEN_628; // @[cache_single_port.scala 290:28 236:45]
  wire  _GEN_664 = 5'hc == cache_state ? _GEN_0 : _GEN_630; // @[cache_single_port.scala 290:28]
  wire [63:0] _GEN_679 = 5'h6 == cache_state ? _GEN_377 : tmp_response_data; // @[cache_single_port.scala 290:28 285:40]
  wire [3:0] _GEN_680 = 5'h6 == cache_state ? _GEN_378 : _GEN_642; // @[cache_single_port.scala 290:28]
  wire  _GEN_681 = 5'h6 == cache_state ? _GEN_379 : tag_mem_0_io_tag_read_dirty; // @[cache_single_port.scala 290:28 237:41]
  wire [21:0] _GEN_682 = 5'h6 == cache_state ? _GEN_380 : tag_mem_0_io_tag_read_tag; // @[cache_single_port.scala 290:28 237:41]
  wire [7:0] _GEN_684 = 5'h6 == cache_state ? _GEN_382 : tag_mem_0_io_tag_read_visit; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_685 = 5'h6 == cache_state ? _GEN_383 : tag_mem_0_io_tag_read_valid; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_686 = 5'h6 == cache_state ? _GEN_384 : tag_mem_1_io_tag_read_dirty; // @[cache_single_port.scala 290:28 237:41]
  wire [21:0] _GEN_687 = 5'h6 == cache_state ? _GEN_385 : tag_mem_1_io_tag_read_tag; // @[cache_single_port.scala 290:28 237:41]
  wire [7:0] _GEN_689 = 5'h6 == cache_state ? _GEN_387 : tag_mem_1_io_tag_read_visit; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_690 = 5'h6 == cache_state ? _GEN_388 : tag_mem_1_io_tag_read_valid; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_691 = 5'h6 == cache_state ? _GEN_389 : tag_mem_2_io_tag_read_dirty; // @[cache_single_port.scala 290:28 237:41]
  wire [21:0] _GEN_692 = 5'h6 == cache_state ? _GEN_390 : tag_mem_2_io_tag_read_tag; // @[cache_single_port.scala 290:28 237:41]
  wire [7:0] _GEN_694 = 5'h6 == cache_state ? _GEN_392 : tag_mem_2_io_tag_read_visit; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_695 = 5'h6 == cache_state ? _GEN_393 : tag_mem_2_io_tag_read_valid; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_696 = 5'h6 == cache_state ? _GEN_394 : tag_mem_3_io_tag_read_dirty; // @[cache_single_port.scala 290:28 237:41]
  wire [21:0] _GEN_697 = 5'h6 == cache_state ? _GEN_395 : tag_mem_3_io_tag_read_tag; // @[cache_single_port.scala 290:28 237:41]
  wire [7:0] _GEN_699 = 5'h6 == cache_state ? _GEN_397 : tag_mem_3_io_tag_read_visit; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_700 = 5'h6 == cache_state ? _GEN_398 : tag_mem_3_io_tag_read_valid; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_701 = 5'h6 == cache_state ? 1'h0 : _GEN_653; // @[cache_single_port.scala 290:28]
  wire [127:0] _GEN_704 = 5'h6 == cache_state ? _GEN_402 : _GEN_651; // @[cache_single_port.scala 290:28]
  wire [127:0] _GEN_707 = 5'h6 == cache_state ? 128'h0 : _GEN_652; // @[cache_single_port.scala 290:28]
  wire  _GEN_708 = 5'h6 == cache_state ? 1'h0 : _GEN_656; // @[cache_single_port.scala 290:28]
  wire [127:0] _GEN_709 = 5'h6 == cache_state ? _GEN_407 : _GEN_654; // @[cache_single_port.scala 290:28]
  wire [127:0] _GEN_710 = 5'h6 == cache_state ? 128'h0 : _GEN_655; // @[cache_single_port.scala 290:28]
  wire  _GEN_711 = 5'h6 == cache_state ? 1'h0 : _GEN_659; // @[cache_single_port.scala 290:28]
  wire [127:0] _GEN_712 = 5'h6 == cache_state ? _GEN_410 : _GEN_657; // @[cache_single_port.scala 290:28]
  wire [127:0] _GEN_713 = 5'h6 == cache_state ? 128'h0 : _GEN_658; // @[cache_single_port.scala 290:28]
  wire  _GEN_714 = 5'h6 == cache_state ? 1'h0 : _GEN_662; // @[cache_single_port.scala 290:28]
  wire [127:0] _GEN_715 = 5'h6 == cache_state ? _GEN_413 : _GEN_660; // @[cache_single_port.scala 290:28]
  wire [127:0] _GEN_716 = 5'h6 == cache_state ? 128'h0 : _GEN_661; // @[cache_single_port.scala 290:28]
  wire [1:0] _GEN_725 = 5'h6 == cache_state ? _GEN_423 : replace; // @[cache_single_port.scala 290:28 165:30]
  wire [31:0] _GEN_726 = 5'h6 == cache_state ? _GEN_424 : refill_addr; // @[cache_single_port.scala 290:28 166:34]
  wire  _GEN_728 = 5'h6 == cache_state ? 1'h0 : _GEN_640; // @[cache_single_port.scala 290:28 244:31]
  wire [63:0] _GEN_729 = 5'h6 == cache_state ? 64'h0 : _GEN_641; // @[cache_single_port.scala 290:28 245:30]
  wire  _GEN_730 = 5'h6 == cache_state ? 1'h0 : _GEN_643; // @[cache_single_port.scala 254:28 290:28]
  wire [31:0] _GEN_732 = 5'h6 == cache_state ? cpu_request_addr_reg : _GEN_645; // @[cache_single_port.scala 290:28 255:32]
  wire  _GEN_733 = 5'h6 == cache_state ? 1'h0 : _GEN_646; // @[cache_single_port.scala 266:27 290:28]
  wire  _GEN_735 = 5'h6 == cache_state ? _GEN_0 : _GEN_664; // @[cache_single_port.scala 290:28]
  wire  _GEN_746 = 5'h5 == cache_state ? 1'h0 : _GEN_728; // @[cache_single_port.scala 290:28]
  wire [3:0] _GEN_747 = 5'h5 == cache_state ? 4'h5 : _GEN_680; // @[cache_single_port.scala 290:28]
  wire [63:0] _GEN_753 = 5'h5 == cache_state ? tmp_response_data : _GEN_679; // @[cache_single_port.scala 290:28 285:40]
  wire  _GEN_754 = 5'h5 == cache_state ? tag_mem_0_io_tag_read_dirty : _GEN_681; // @[cache_single_port.scala 290:28 237:41]
  wire [21:0] _GEN_755 = 5'h5 == cache_state ? tag_mem_0_io_tag_read_tag : _GEN_682; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_756 = 5'h5 == cache_state ? 1'h0 : 5'h6 == cache_state & _GEN_381; // @[cache_single_port.scala 290:28 235:44]
  wire [7:0] _GEN_757 = 5'h5 == cache_state ? tag_mem_0_io_tag_read_visit : _GEN_684; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_758 = 5'h5 == cache_state ? tag_mem_0_io_tag_read_valid : _GEN_685; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_759 = 5'h5 == cache_state ? tag_mem_1_io_tag_read_dirty : _GEN_686; // @[cache_single_port.scala 290:28 237:41]
  wire [21:0] _GEN_760 = 5'h5 == cache_state ? tag_mem_1_io_tag_read_tag : _GEN_687; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_761 = 5'h5 == cache_state ? 1'h0 : 5'h6 == cache_state & _GEN_386; // @[cache_single_port.scala 290:28 235:44]
  wire [7:0] _GEN_762 = 5'h5 == cache_state ? tag_mem_1_io_tag_read_visit : _GEN_689; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_763 = 5'h5 == cache_state ? tag_mem_1_io_tag_read_valid : _GEN_690; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_764 = 5'h5 == cache_state ? tag_mem_2_io_tag_read_dirty : _GEN_691; // @[cache_single_port.scala 290:28 237:41]
  wire [21:0] _GEN_765 = 5'h5 == cache_state ? tag_mem_2_io_tag_read_tag : _GEN_692; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_766 = 5'h5 == cache_state ? 1'h0 : 5'h6 == cache_state & _GEN_391; // @[cache_single_port.scala 290:28 235:44]
  wire [7:0] _GEN_767 = 5'h5 == cache_state ? tag_mem_2_io_tag_read_visit : _GEN_694; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_768 = 5'h5 == cache_state ? tag_mem_2_io_tag_read_valid : _GEN_695; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_769 = 5'h5 == cache_state ? tag_mem_3_io_tag_read_dirty : _GEN_696; // @[cache_single_port.scala 290:28 237:41]
  wire [21:0] _GEN_770 = 5'h5 == cache_state ? tag_mem_3_io_tag_read_tag : _GEN_697; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_771 = 5'h5 == cache_state ? 1'h0 : 5'h6 == cache_state & _GEN_396; // @[cache_single_port.scala 290:28 235:44]
  wire [7:0] _GEN_772 = 5'h5 == cache_state ? tag_mem_3_io_tag_read_visit : _GEN_699; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_773 = 5'h5 == cache_state ? tag_mem_3_io_tag_read_valid : _GEN_700; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_774 = 5'h5 == cache_state ? 1'h0 : _GEN_701; // @[cache_single_port.scala 290:28 236:45]
  wire [127:0] _GEN_777 = 5'h5 == cache_state ? data_mem_0_io_data_read_data : _GEN_704; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_780 = 5'h5 == cache_state ? 128'h0 : _GEN_707; // @[cache_single_port.scala 290:28 240:48]
  wire  _GEN_781 = 5'h5 == cache_state ? 1'h0 : _GEN_708; // @[cache_single_port.scala 290:28 236:45]
  wire [127:0] _GEN_782 = 5'h5 == cache_state ? data_mem_1_io_data_read_data : _GEN_709; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_783 = 5'h5 == cache_state ? 128'h0 : _GEN_710; // @[cache_single_port.scala 290:28 240:48]
  wire  _GEN_784 = 5'h5 == cache_state ? 1'h0 : _GEN_711; // @[cache_single_port.scala 290:28 236:45]
  wire [127:0] _GEN_785 = 5'h5 == cache_state ? data_mem_2_io_data_read_data : _GEN_712; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_786 = 5'h5 == cache_state ? 128'h0 : _GEN_713; // @[cache_single_port.scala 290:28 240:48]
  wire  _GEN_787 = 5'h5 == cache_state ? 1'h0 : _GEN_714; // @[cache_single_port.scala 290:28 236:45]
  wire [127:0] _GEN_788 = 5'h5 == cache_state ? data_mem_3_io_data_read_data : _GEN_715; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_789 = 5'h5 == cache_state ? 128'h0 : _GEN_716; // @[cache_single_port.scala 290:28 240:48]
  wire [1:0] _GEN_798 = 5'h5 == cache_state ? replace : _GEN_725; // @[cache_single_port.scala 290:28 165:30]
  wire [31:0] _GEN_799 = 5'h5 == cache_state ? refill_addr : _GEN_726; // @[cache_single_port.scala 290:28 166:34]
  wire [63:0] _GEN_801 = 5'h5 == cache_state ? 64'h0 : _GEN_729; // @[cache_single_port.scala 290:28 245:30]
  wire  _GEN_802 = 5'h5 == cache_state ? 1'h0 : _GEN_730; // @[cache_single_port.scala 254:28 290:28]
  wire [31:0] _GEN_804 = 5'h5 == cache_state ? cpu_request_addr_reg : _GEN_732; // @[cache_single_port.scala 290:28 255:32]
  wire  _GEN_805 = 5'h5 == cache_state ? 1'h0 : _GEN_733; // @[cache_single_port.scala 266:27 290:28]
  wire  _GEN_807 = 5'h5 == cache_state ? _GEN_0 : _GEN_735; // @[cache_single_port.scala 290:28]
  wire [3:0] _GEN_816 = 5'h4 == cache_state ? 4'h4 : _GEN_747; // @[cache_single_port.scala 290:28]
  wire  _GEN_828 = 5'h4 == cache_state ? 1'h0 : _GEN_746; // @[cache_single_port.scala 290:28 244:31]
  wire [63:0] _GEN_834 = 5'h4 == cache_state ? tmp_response_data : _GEN_753; // @[cache_single_port.scala 290:28 285:40]
  wire  _GEN_835 = 5'h4 == cache_state ? tag_mem_0_io_tag_read_dirty : _GEN_754; // @[cache_single_port.scala 290:28 237:41]
  wire [21:0] _GEN_836 = 5'h4 == cache_state ? tag_mem_0_io_tag_read_tag : _GEN_755; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_837 = 5'h4 == cache_state ? 1'h0 : _GEN_756; // @[cache_single_port.scala 290:28 235:44]
  wire [7:0] _GEN_838 = 5'h4 == cache_state ? tag_mem_0_io_tag_read_visit : _GEN_757; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_839 = 5'h4 == cache_state ? tag_mem_0_io_tag_read_valid : _GEN_758; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_840 = 5'h4 == cache_state ? tag_mem_1_io_tag_read_dirty : _GEN_759; // @[cache_single_port.scala 290:28 237:41]
  wire [21:0] _GEN_841 = 5'h4 == cache_state ? tag_mem_1_io_tag_read_tag : _GEN_760; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_842 = 5'h4 == cache_state ? 1'h0 : _GEN_761; // @[cache_single_port.scala 290:28 235:44]
  wire [7:0] _GEN_843 = 5'h4 == cache_state ? tag_mem_1_io_tag_read_visit : _GEN_762; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_844 = 5'h4 == cache_state ? tag_mem_1_io_tag_read_valid : _GEN_763; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_845 = 5'h4 == cache_state ? tag_mem_2_io_tag_read_dirty : _GEN_764; // @[cache_single_port.scala 290:28 237:41]
  wire [21:0] _GEN_846 = 5'h4 == cache_state ? tag_mem_2_io_tag_read_tag : _GEN_765; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_847 = 5'h4 == cache_state ? 1'h0 : _GEN_766; // @[cache_single_port.scala 290:28 235:44]
  wire [7:0] _GEN_848 = 5'h4 == cache_state ? tag_mem_2_io_tag_read_visit : _GEN_767; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_849 = 5'h4 == cache_state ? tag_mem_2_io_tag_read_valid : _GEN_768; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_850 = 5'h4 == cache_state ? tag_mem_3_io_tag_read_dirty : _GEN_769; // @[cache_single_port.scala 290:28 237:41]
  wire [21:0] _GEN_851 = 5'h4 == cache_state ? tag_mem_3_io_tag_read_tag : _GEN_770; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_852 = 5'h4 == cache_state ? 1'h0 : _GEN_771; // @[cache_single_port.scala 290:28 235:44]
  wire [7:0] _GEN_853 = 5'h4 == cache_state ? tag_mem_3_io_tag_read_visit : _GEN_772; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_854 = 5'h4 == cache_state ? tag_mem_3_io_tag_read_valid : _GEN_773; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_855 = 5'h4 == cache_state ? 1'h0 : _GEN_774; // @[cache_single_port.scala 290:28 236:45]
  wire [127:0] _GEN_858 = 5'h4 == cache_state ? data_mem_0_io_data_read_data : _GEN_777; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_861 = 5'h4 == cache_state ? 128'h0 : _GEN_780; // @[cache_single_port.scala 290:28 240:48]
  wire  _GEN_862 = 5'h4 == cache_state ? 1'h0 : _GEN_781; // @[cache_single_port.scala 290:28 236:45]
  wire [127:0] _GEN_863 = 5'h4 == cache_state ? data_mem_1_io_data_read_data : _GEN_782; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_864 = 5'h4 == cache_state ? 128'h0 : _GEN_783; // @[cache_single_port.scala 290:28 240:48]
  wire  _GEN_865 = 5'h4 == cache_state ? 1'h0 : _GEN_784; // @[cache_single_port.scala 290:28 236:45]
  wire [127:0] _GEN_866 = 5'h4 == cache_state ? data_mem_2_io_data_read_data : _GEN_785; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_867 = 5'h4 == cache_state ? 128'h0 : _GEN_786; // @[cache_single_port.scala 290:28 240:48]
  wire  _GEN_868 = 5'h4 == cache_state ? 1'h0 : _GEN_787; // @[cache_single_port.scala 290:28 236:45]
  wire [127:0] _GEN_869 = 5'h4 == cache_state ? data_mem_3_io_data_read_data : _GEN_788; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_870 = 5'h4 == cache_state ? 128'h0 : _GEN_789; // @[cache_single_port.scala 290:28 240:48]
  wire [1:0] _GEN_879 = 5'h4 == cache_state ? replace : _GEN_798; // @[cache_single_port.scala 290:28 165:30]
  wire [31:0] _GEN_880 = 5'h4 == cache_state ? refill_addr : _GEN_799; // @[cache_single_port.scala 290:28 166:34]
  wire [63:0] _GEN_882 = 5'h4 == cache_state ? 64'h0 : _GEN_801; // @[cache_single_port.scala 290:28 245:30]
  wire  _GEN_883 = 5'h4 == cache_state ? 1'h0 : _GEN_802; // @[cache_single_port.scala 254:28 290:28]
  wire [31:0] _GEN_885 = 5'h4 == cache_state ? cpu_request_addr_reg : _GEN_804; // @[cache_single_port.scala 290:28 255:32]
  wire  _GEN_886 = 5'h4 == cache_state ? 1'h0 : _GEN_805; // @[cache_single_port.scala 266:27 290:28]
  wire  _GEN_888 = 5'h4 == cache_state ? _GEN_0 : _GEN_807; // @[cache_single_port.scala 290:28]
  wire [63:0] _GEN_889 = 5'h3 == cache_state ? io_mem_io_r_bits_data : _GEN_882; // @[cache_single_port.scala 290:28 468:46]
  wire  _GEN_890 = 5'h3 == cache_state | _GEN_886; // @[cache_single_port.scala 290:28 469:43]
  wire [3:0] _GEN_891 = 5'h3 == cache_state ? {{2'd0}, _GEN_193} : _GEN_816; // @[cache_single_port.scala 290:28]
  wire  _GEN_892 = 5'h3 == cache_state ? io_mem_io_r_valid : _GEN_828; // @[cache_single_port.scala 290:28]
  wire [63:0] _GEN_909 = 5'h3 == cache_state ? tmp_response_data : _GEN_834; // @[cache_single_port.scala 290:28 285:40]
  wire  _GEN_910 = 5'h3 == cache_state ? tag_mem_0_io_tag_read_dirty : _GEN_835; // @[cache_single_port.scala 290:28 237:41]
  wire [21:0] _GEN_911 = 5'h3 == cache_state ? tag_mem_0_io_tag_read_tag : _GEN_836; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_912 = 5'h3 == cache_state ? 1'h0 : _GEN_837; // @[cache_single_port.scala 290:28 235:44]
  wire [7:0] _GEN_913 = 5'h3 == cache_state ? tag_mem_0_io_tag_read_visit : _GEN_838; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_914 = 5'h3 == cache_state ? tag_mem_0_io_tag_read_valid : _GEN_839; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_915 = 5'h3 == cache_state ? tag_mem_1_io_tag_read_dirty : _GEN_840; // @[cache_single_port.scala 290:28 237:41]
  wire [21:0] _GEN_916 = 5'h3 == cache_state ? tag_mem_1_io_tag_read_tag : _GEN_841; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_917 = 5'h3 == cache_state ? 1'h0 : _GEN_842; // @[cache_single_port.scala 290:28 235:44]
  wire [7:0] _GEN_918 = 5'h3 == cache_state ? tag_mem_1_io_tag_read_visit : _GEN_843; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_919 = 5'h3 == cache_state ? tag_mem_1_io_tag_read_valid : _GEN_844; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_920 = 5'h3 == cache_state ? tag_mem_2_io_tag_read_dirty : _GEN_845; // @[cache_single_port.scala 290:28 237:41]
  wire [21:0] _GEN_921 = 5'h3 == cache_state ? tag_mem_2_io_tag_read_tag : _GEN_846; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_922 = 5'h3 == cache_state ? 1'h0 : _GEN_847; // @[cache_single_port.scala 290:28 235:44]
  wire [7:0] _GEN_923 = 5'h3 == cache_state ? tag_mem_2_io_tag_read_visit : _GEN_848; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_924 = 5'h3 == cache_state ? tag_mem_2_io_tag_read_valid : _GEN_849; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_925 = 5'h3 == cache_state ? tag_mem_3_io_tag_read_dirty : _GEN_850; // @[cache_single_port.scala 290:28 237:41]
  wire [21:0] _GEN_926 = 5'h3 == cache_state ? tag_mem_3_io_tag_read_tag : _GEN_851; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_927 = 5'h3 == cache_state ? 1'h0 : _GEN_852; // @[cache_single_port.scala 290:28 235:44]
  wire [7:0] _GEN_928 = 5'h3 == cache_state ? tag_mem_3_io_tag_read_visit : _GEN_853; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_929 = 5'h3 == cache_state ? tag_mem_3_io_tag_read_valid : _GEN_854; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_930 = 5'h3 == cache_state ? 1'h0 : _GEN_855; // @[cache_single_port.scala 290:28 236:45]
  wire [127:0] _GEN_933 = 5'h3 == cache_state ? data_mem_0_io_data_read_data : _GEN_858; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_936 = 5'h3 == cache_state ? 128'h0 : _GEN_861; // @[cache_single_port.scala 290:28 240:48]
  wire  _GEN_937 = 5'h3 == cache_state ? 1'h0 : _GEN_862; // @[cache_single_port.scala 290:28 236:45]
  wire [127:0] _GEN_938 = 5'h3 == cache_state ? data_mem_1_io_data_read_data : _GEN_863; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_939 = 5'h3 == cache_state ? 128'h0 : _GEN_864; // @[cache_single_port.scala 290:28 240:48]
  wire  _GEN_940 = 5'h3 == cache_state ? 1'h0 : _GEN_865; // @[cache_single_port.scala 290:28 236:45]
  wire [127:0] _GEN_941 = 5'h3 == cache_state ? data_mem_2_io_data_read_data : _GEN_866; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_942 = 5'h3 == cache_state ? 128'h0 : _GEN_867; // @[cache_single_port.scala 290:28 240:48]
  wire  _GEN_943 = 5'h3 == cache_state ? 1'h0 : _GEN_868; // @[cache_single_port.scala 290:28 236:45]
  wire [127:0] _GEN_944 = 5'h3 == cache_state ? data_mem_3_io_data_read_data : _GEN_869; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_945 = 5'h3 == cache_state ? 128'h0 : _GEN_870; // @[cache_single_port.scala 290:28 240:48]
  wire [1:0] _GEN_954 = 5'h3 == cache_state ? replace : _GEN_879; // @[cache_single_port.scala 290:28 165:30]
  wire [31:0] _GEN_955 = 5'h3 == cache_state ? refill_addr : _GEN_880; // @[cache_single_port.scala 290:28 166:34]
  wire  _GEN_957 = 5'h3 == cache_state ? 1'h0 : _GEN_883; // @[cache_single_port.scala 254:28 290:28]
  wire [31:0] _GEN_959 = 5'h3 == cache_state ? cpu_request_addr_reg : _GEN_885; // @[cache_single_port.scala 290:28 255:32]
  wire  _GEN_961 = 5'h3 == cache_state ? _GEN_0 : _GEN_888; // @[cache_single_port.scala 290:28]
  wire  _GEN_962 = 5'h1 == cache_state | _GEN_957; // @[cache_single_port.scala 290:28 456:44]
  wire  _GEN_963 = 5'h1 == cache_state ? 1'h0 : 1'h1; // @[cache_single_port.scala 290:28 457:47]
  wire [1:0] _GEN_964 = 5'h1 == cache_state ? cpu_request_accessType : 2'h3; // @[cache_single_port.scala 290:28 257:32 458:48]
  wire [31:0] _GEN_965 = 5'h1 == cache_state ? cpu_request_addr_reg_origin : _GEN_959; // @[cache_single_port.scala 290:28 459:48]
  wire [3:0] _GEN_966 = 5'h1 == cache_state ? {{2'd0}, _GEN_192} : _GEN_891; // @[cache_single_port.scala 290:28]
  wire [63:0] _GEN_967 = 5'h1 == cache_state ? 64'h0 : _GEN_889; // @[cache_single_port.scala 290:28 245:30]
  wire  _GEN_968 = 5'h1 == cache_state ? 1'h0 : _GEN_890; // @[cache_single_port.scala 266:27 290:28]
  wire  _GEN_969 = 5'h1 == cache_state ? 1'h0 : _GEN_892; // @[cache_single_port.scala 290:28 244:31]
  wire [63:0] _GEN_986 = 5'h1 == cache_state ? tmp_response_data : _GEN_909; // @[cache_single_port.scala 290:28 285:40]
  wire  _GEN_987 = 5'h1 == cache_state ? tag_mem_0_io_tag_read_dirty : _GEN_910; // @[cache_single_port.scala 290:28 237:41]
  wire [21:0] _GEN_988 = 5'h1 == cache_state ? tag_mem_0_io_tag_read_tag : _GEN_911; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_989 = 5'h1 == cache_state ? 1'h0 : _GEN_912; // @[cache_single_port.scala 290:28 235:44]
  wire [7:0] _GEN_990 = 5'h1 == cache_state ? tag_mem_0_io_tag_read_visit : _GEN_913; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_991 = 5'h1 == cache_state ? tag_mem_0_io_tag_read_valid : _GEN_914; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_992 = 5'h1 == cache_state ? tag_mem_1_io_tag_read_dirty : _GEN_915; // @[cache_single_port.scala 290:28 237:41]
  wire [21:0] _GEN_993 = 5'h1 == cache_state ? tag_mem_1_io_tag_read_tag : _GEN_916; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_994 = 5'h1 == cache_state ? 1'h0 : _GEN_917; // @[cache_single_port.scala 290:28 235:44]
  wire [7:0] _GEN_995 = 5'h1 == cache_state ? tag_mem_1_io_tag_read_visit : _GEN_918; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_996 = 5'h1 == cache_state ? tag_mem_1_io_tag_read_valid : _GEN_919; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_997 = 5'h1 == cache_state ? tag_mem_2_io_tag_read_dirty : _GEN_920; // @[cache_single_port.scala 290:28 237:41]
  wire [21:0] _GEN_998 = 5'h1 == cache_state ? tag_mem_2_io_tag_read_tag : _GEN_921; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_999 = 5'h1 == cache_state ? 1'h0 : _GEN_922; // @[cache_single_port.scala 290:28 235:44]
  wire [7:0] _GEN_1000 = 5'h1 == cache_state ? tag_mem_2_io_tag_read_visit : _GEN_923; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1001 = 5'h1 == cache_state ? tag_mem_2_io_tag_read_valid : _GEN_924; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1002 = 5'h1 == cache_state ? tag_mem_3_io_tag_read_dirty : _GEN_925; // @[cache_single_port.scala 290:28 237:41]
  wire [21:0] _GEN_1003 = 5'h1 == cache_state ? tag_mem_3_io_tag_read_tag : _GEN_926; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1004 = 5'h1 == cache_state ? 1'h0 : _GEN_927; // @[cache_single_port.scala 290:28 235:44]
  wire [7:0] _GEN_1005 = 5'h1 == cache_state ? tag_mem_3_io_tag_read_visit : _GEN_928; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1006 = 5'h1 == cache_state ? tag_mem_3_io_tag_read_valid : _GEN_929; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1007 = 5'h1 == cache_state ? 1'h0 : _GEN_930; // @[cache_single_port.scala 290:28 236:45]
  wire [127:0] _GEN_1010 = 5'h1 == cache_state ? data_mem_0_io_data_read_data : _GEN_933; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_1013 = 5'h1 == cache_state ? 128'h0 : _GEN_936; // @[cache_single_port.scala 290:28 240:48]
  wire  _GEN_1014 = 5'h1 == cache_state ? 1'h0 : _GEN_937; // @[cache_single_port.scala 290:28 236:45]
  wire [127:0] _GEN_1015 = 5'h1 == cache_state ? data_mem_1_io_data_read_data : _GEN_938; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_1016 = 5'h1 == cache_state ? 128'h0 : _GEN_939; // @[cache_single_port.scala 290:28 240:48]
  wire  _GEN_1017 = 5'h1 == cache_state ? 1'h0 : _GEN_940; // @[cache_single_port.scala 290:28 236:45]
  wire [127:0] _GEN_1018 = 5'h1 == cache_state ? data_mem_2_io_data_read_data : _GEN_941; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_1019 = 5'h1 == cache_state ? 128'h0 : _GEN_942; // @[cache_single_port.scala 290:28 240:48]
  wire  _GEN_1020 = 5'h1 == cache_state ? 1'h0 : _GEN_943; // @[cache_single_port.scala 290:28 236:45]
  wire [127:0] _GEN_1021 = 5'h1 == cache_state ? data_mem_3_io_data_read_data : _GEN_944; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_1022 = 5'h1 == cache_state ? 128'h0 : _GEN_945; // @[cache_single_port.scala 290:28 240:48]
  wire [1:0] _GEN_1031 = 5'h1 == cache_state ? replace : _GEN_954; // @[cache_single_port.scala 290:28 165:30]
  wire [31:0] _GEN_1032 = 5'h1 == cache_state ? refill_addr : _GEN_955; // @[cache_single_port.scala 290:28 166:34]
  wire  _GEN_1035 = 5'h1 == cache_state ? _GEN_0 : _GEN_961; // @[cache_single_port.scala 290:28]
  wire [4:0] _GEN_1037 = 5'h13 == cache_state ? 5'h13 : {{1'd0}, _GEN_966}; // @[cache_single_port.scala 290:28]
  wire  _GEN_1042 = 5'h13 == cache_state ? 1'h0 : _GEN_962; // @[cache_single_port.scala 254:28 290:28]
  wire [1:0] _GEN_1044 = 5'h13 == cache_state ? 2'h3 : _GEN_964; // @[cache_single_port.scala 290:28 257:32]
  wire [31:0] _GEN_1045 = 5'h13 == cache_state ? cpu_request_addr_reg : _GEN_965; // @[cache_single_port.scala 290:28 255:32]
  wire [63:0] _GEN_1046 = 5'h13 == cache_state ? 64'h0 : _GEN_967; // @[cache_single_port.scala 290:28 245:30]
  wire  _GEN_1047 = 5'h13 == cache_state ? 1'h0 : _GEN_968; // @[cache_single_port.scala 266:27 290:28]
  wire  _GEN_1048 = 5'h13 == cache_state ? 1'h0 : _GEN_969; // @[cache_single_port.scala 290:28 244:31]
  wire [63:0] _GEN_1064 = 5'h13 == cache_state ? tmp_response_data : _GEN_986; // @[cache_single_port.scala 290:28 285:40]
  wire  _GEN_1065 = 5'h13 == cache_state ? tag_mem_0_io_tag_read_dirty : _GEN_987; // @[cache_single_port.scala 290:28 237:41]
  wire [21:0] _GEN_1066 = 5'h13 == cache_state ? tag_mem_0_io_tag_read_tag : _GEN_988; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1067 = 5'h13 == cache_state ? 1'h0 : _GEN_989; // @[cache_single_port.scala 290:28 235:44]
  wire [7:0] _GEN_1068 = 5'h13 == cache_state ? tag_mem_0_io_tag_read_visit : _GEN_990; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1069 = 5'h13 == cache_state ? tag_mem_0_io_tag_read_valid : _GEN_991; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1070 = 5'h13 == cache_state ? tag_mem_1_io_tag_read_dirty : _GEN_992; // @[cache_single_port.scala 290:28 237:41]
  wire [21:0] _GEN_1071 = 5'h13 == cache_state ? tag_mem_1_io_tag_read_tag : _GEN_993; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1072 = 5'h13 == cache_state ? 1'h0 : _GEN_994; // @[cache_single_port.scala 290:28 235:44]
  wire [7:0] _GEN_1073 = 5'h13 == cache_state ? tag_mem_1_io_tag_read_visit : _GEN_995; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1074 = 5'h13 == cache_state ? tag_mem_1_io_tag_read_valid : _GEN_996; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1075 = 5'h13 == cache_state ? tag_mem_2_io_tag_read_dirty : _GEN_997; // @[cache_single_port.scala 290:28 237:41]
  wire [21:0] _GEN_1076 = 5'h13 == cache_state ? tag_mem_2_io_tag_read_tag : _GEN_998; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1077 = 5'h13 == cache_state ? 1'h0 : _GEN_999; // @[cache_single_port.scala 290:28 235:44]
  wire [7:0] _GEN_1078 = 5'h13 == cache_state ? tag_mem_2_io_tag_read_visit : _GEN_1000; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1079 = 5'h13 == cache_state ? tag_mem_2_io_tag_read_valid : _GEN_1001; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1080 = 5'h13 == cache_state ? tag_mem_3_io_tag_read_dirty : _GEN_1002; // @[cache_single_port.scala 290:28 237:41]
  wire [21:0] _GEN_1081 = 5'h13 == cache_state ? tag_mem_3_io_tag_read_tag : _GEN_1003; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1082 = 5'h13 == cache_state ? 1'h0 : _GEN_1004; // @[cache_single_port.scala 290:28 235:44]
  wire [7:0] _GEN_1083 = 5'h13 == cache_state ? tag_mem_3_io_tag_read_visit : _GEN_1005; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1084 = 5'h13 == cache_state ? tag_mem_3_io_tag_read_valid : _GEN_1006; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1085 = 5'h13 == cache_state ? 1'h0 : _GEN_1007; // @[cache_single_port.scala 290:28 236:45]
  wire [127:0] _GEN_1088 = 5'h13 == cache_state ? data_mem_0_io_data_read_data : _GEN_1010; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_1091 = 5'h13 == cache_state ? 128'h0 : _GEN_1013; // @[cache_single_port.scala 290:28 240:48]
  wire  _GEN_1092 = 5'h13 == cache_state ? 1'h0 : _GEN_1014; // @[cache_single_port.scala 290:28 236:45]
  wire [127:0] _GEN_1093 = 5'h13 == cache_state ? data_mem_1_io_data_read_data : _GEN_1015; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_1094 = 5'h13 == cache_state ? 128'h0 : _GEN_1016; // @[cache_single_port.scala 290:28 240:48]
  wire  _GEN_1095 = 5'h13 == cache_state ? 1'h0 : _GEN_1017; // @[cache_single_port.scala 290:28 236:45]
  wire [127:0] _GEN_1096 = 5'h13 == cache_state ? data_mem_2_io_data_read_data : _GEN_1018; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_1097 = 5'h13 == cache_state ? 128'h0 : _GEN_1019; // @[cache_single_port.scala 290:28 240:48]
  wire  _GEN_1098 = 5'h13 == cache_state ? 1'h0 : _GEN_1020; // @[cache_single_port.scala 290:28 236:45]
  wire [127:0] _GEN_1099 = 5'h13 == cache_state ? data_mem_3_io_data_read_data : _GEN_1021; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_1100 = 5'h13 == cache_state ? 128'h0 : _GEN_1022; // @[cache_single_port.scala 290:28 240:48]
  wire [1:0] _GEN_1109 = 5'h13 == cache_state ? replace : _GEN_1031; // @[cache_single_port.scala 290:28 165:30]
  wire [31:0] _GEN_1110 = 5'h13 == cache_state ? refill_addr : _GEN_1032; // @[cache_single_port.scala 290:28 166:34]
  wire  _GEN_1113 = 5'h13 == cache_state ? _GEN_0 : _GEN_1035; // @[cache_single_port.scala 290:28]
  wire [4:0] _GEN_1114 = 5'h11 == cache_state ? 5'h11 : _GEN_1037; // @[cache_single_port.scala 290:28]
  wire [5:0] _GEN_1115 = 5'h11 == cache_state ? flush_loop : io_cpu_request_addr[9:4]; // @[cache_single_port.scala 290:28 234:48]
  wire  _GEN_1116 = 5'h11 == cache_state ? 1'h0 : _GEN_1085; // @[cache_single_port.scala 290:28]
  wire  _GEN_1118 = 5'h11 == cache_state ? 1'h0 : _GEN_1092; // @[cache_single_port.scala 290:28]
  wire  _GEN_1120 = 5'h11 == cache_state ? 1'h0 : _GEN_1095; // @[cache_single_port.scala 290:28]
  wire  _GEN_1122 = 5'h11 == cache_state ? 1'h0 : _GEN_1098; // @[cache_single_port.scala 290:28]
  wire  _GEN_1134 = 5'h11 == cache_state ? _GEN_0 : _GEN_1113; // @[cache_single_port.scala 290:28]
  wire  _GEN_1140 = 5'h11 == cache_state ? 1'h0 : _GEN_1042; // @[cache_single_port.scala 254:28 290:28]
  wire [1:0] _GEN_1142 = 5'h11 == cache_state ? 2'h3 : _GEN_1044; // @[cache_single_port.scala 290:28 257:32]
  wire [31:0] _GEN_1143 = 5'h11 == cache_state ? cpu_request_addr_reg : _GEN_1045; // @[cache_single_port.scala 290:28 255:32]
  wire [63:0] _GEN_1144 = 5'h11 == cache_state ? 64'h0 : _GEN_1046; // @[cache_single_port.scala 290:28 245:30]
  wire  _GEN_1145 = 5'h11 == cache_state ? 1'h0 : _GEN_1047; // @[cache_single_port.scala 266:27 290:28]
  wire  _GEN_1146 = 5'h11 == cache_state ? 1'h0 : _GEN_1048; // @[cache_single_port.scala 290:28 244:31]
  wire [63:0] _GEN_1154 = 5'h11 == cache_state ? tmp_response_data : _GEN_1064; // @[cache_single_port.scala 290:28 285:40]
  wire  _GEN_1155 = 5'h11 == cache_state ? tag_mem_0_io_tag_read_dirty : _GEN_1065; // @[cache_single_port.scala 290:28 237:41]
  wire [21:0] _GEN_1156 = 5'h11 == cache_state ? tag_mem_0_io_tag_read_tag : _GEN_1066; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1157 = 5'h11 == cache_state ? 1'h0 : _GEN_1067; // @[cache_single_port.scala 290:28 235:44]
  wire [7:0] _GEN_1158 = 5'h11 == cache_state ? tag_mem_0_io_tag_read_visit : _GEN_1068; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1159 = 5'h11 == cache_state ? tag_mem_0_io_tag_read_valid : _GEN_1069; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1160 = 5'h11 == cache_state ? tag_mem_1_io_tag_read_dirty : _GEN_1070; // @[cache_single_port.scala 290:28 237:41]
  wire [21:0] _GEN_1161 = 5'h11 == cache_state ? tag_mem_1_io_tag_read_tag : _GEN_1071; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1162 = 5'h11 == cache_state ? 1'h0 : _GEN_1072; // @[cache_single_port.scala 290:28 235:44]
  wire [7:0] _GEN_1163 = 5'h11 == cache_state ? tag_mem_1_io_tag_read_visit : _GEN_1073; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1164 = 5'h11 == cache_state ? tag_mem_1_io_tag_read_valid : _GEN_1074; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1165 = 5'h11 == cache_state ? tag_mem_2_io_tag_read_dirty : _GEN_1075; // @[cache_single_port.scala 290:28 237:41]
  wire [21:0] _GEN_1166 = 5'h11 == cache_state ? tag_mem_2_io_tag_read_tag : _GEN_1076; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1167 = 5'h11 == cache_state ? 1'h0 : _GEN_1077; // @[cache_single_port.scala 290:28 235:44]
  wire [7:0] _GEN_1168 = 5'h11 == cache_state ? tag_mem_2_io_tag_read_visit : _GEN_1078; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1169 = 5'h11 == cache_state ? tag_mem_2_io_tag_read_valid : _GEN_1079; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1170 = 5'h11 == cache_state ? tag_mem_3_io_tag_read_dirty : _GEN_1080; // @[cache_single_port.scala 290:28 237:41]
  wire [21:0] _GEN_1171 = 5'h11 == cache_state ? tag_mem_3_io_tag_read_tag : _GEN_1081; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1172 = 5'h11 == cache_state ? 1'h0 : _GEN_1082; // @[cache_single_port.scala 290:28 235:44]
  wire [7:0] _GEN_1173 = 5'h11 == cache_state ? tag_mem_3_io_tag_read_visit : _GEN_1083; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1174 = 5'h11 == cache_state ? tag_mem_3_io_tag_read_valid : _GEN_1084; // @[cache_single_port.scala 290:28 237:41]
  wire [127:0] _GEN_1175 = 5'h11 == cache_state ? data_mem_0_io_data_read_data : _GEN_1088; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_1178 = 5'h11 == cache_state ? 128'h0 : _GEN_1091; // @[cache_single_port.scala 290:28 240:48]
  wire [127:0] _GEN_1179 = 5'h11 == cache_state ? data_mem_1_io_data_read_data : _GEN_1093; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_1180 = 5'h11 == cache_state ? 128'h0 : _GEN_1094; // @[cache_single_port.scala 290:28 240:48]
  wire [127:0] _GEN_1181 = 5'h11 == cache_state ? data_mem_2_io_data_read_data : _GEN_1096; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_1182 = 5'h11 == cache_state ? 128'h0 : _GEN_1097; // @[cache_single_port.scala 290:28 240:48]
  wire [127:0] _GEN_1183 = 5'h11 == cache_state ? data_mem_3_io_data_read_data : _GEN_1099; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_1184 = 5'h11 == cache_state ? 128'h0 : _GEN_1100; // @[cache_single_port.scala 290:28 240:48]
  wire [1:0] _GEN_1193 = 5'h11 == cache_state ? replace : _GEN_1109; // @[cache_single_port.scala 290:28 165:30]
  wire [31:0] _GEN_1194 = 5'h11 == cache_state ? refill_addr : _GEN_1110; // @[cache_single_port.scala 290:28 166:34]
  wire [5:0] _GEN_1196 = 5'h10 == cache_state ? flush_loop : cpu_request_addr_index; // @[cache_single_port.scala 290:28]
  wire [21:0] _GEN_1208 = 5'h10 == cache_state ? _GEN_107 : _GEN_1156; // @[cache_single_port.scala 290:28]
  wire [7:0] _GEN_1209 = 5'h10 == cache_state ? 8'h0 : _GEN_1158; // @[cache_single_port.scala 290:28]
  wire  _GEN_1210 = 5'h10 == cache_state ? 1'h0 : _GEN_1155; // @[cache_single_port.scala 290:28]
  wire  _GEN_1211 = 5'h10 == cache_state ? 1'h0 : _GEN_1159; // @[cache_single_port.scala 290:28]
  wire [21:0] _GEN_1213 = 5'h10 == cache_state ? _GEN_110 : _GEN_1161; // @[cache_single_port.scala 290:28]
  wire [7:0] _GEN_1214 = 5'h10 == cache_state ? 8'h0 : _GEN_1163; // @[cache_single_port.scala 290:28]
  wire  _GEN_1215 = 5'h10 == cache_state ? 1'h0 : _GEN_1160; // @[cache_single_port.scala 290:28]
  wire  _GEN_1216 = 5'h10 == cache_state ? 1'h0 : _GEN_1164; // @[cache_single_port.scala 290:28]
  wire [21:0] _GEN_1218 = 5'h10 == cache_state ? _GEN_113 : _GEN_1166; // @[cache_single_port.scala 290:28]
  wire [7:0] _GEN_1219 = 5'h10 == cache_state ? 8'h0 : _GEN_1168; // @[cache_single_port.scala 290:28]
  wire  _GEN_1220 = 5'h10 == cache_state ? 1'h0 : _GEN_1165; // @[cache_single_port.scala 290:28]
  wire  _GEN_1221 = 5'h10 == cache_state ? 1'h0 : _GEN_1169; // @[cache_single_port.scala 290:28]
  wire [21:0] _GEN_1223 = 5'h10 == cache_state ? _GEN_116 : _GEN_1171; // @[cache_single_port.scala 290:28]
  wire [7:0] _GEN_1224 = 5'h10 == cache_state ? 8'h0 : _GEN_1173; // @[cache_single_port.scala 290:28]
  wire  _GEN_1225 = 5'h10 == cache_state ? 1'h0 : _GEN_1170; // @[cache_single_port.scala 290:28]
  wire  _GEN_1226 = 5'h10 == cache_state ? 1'h0 : _GEN_1174; // @[cache_single_port.scala 290:28]
  wire [5:0] _GEN_1227 = 5'h10 == cache_state ? io_cpu_request_addr[9:4] : _GEN_1115; // @[cache_single_port.scala 290:28 234:48]
  wire  _GEN_1228 = 5'h10 == cache_state ? 1'h0 : _GEN_1116; // @[cache_single_port.scala 290:28 236:45]
  wire  _GEN_1230 = 5'h10 == cache_state ? 1'h0 : _GEN_1118; // @[cache_single_port.scala 290:28 236:45]
  wire  _GEN_1232 = 5'h10 == cache_state ? 1'h0 : _GEN_1120; // @[cache_single_port.scala 290:28 236:45]
  wire  _GEN_1234 = 5'h10 == cache_state ? 1'h0 : _GEN_1122; // @[cache_single_port.scala 290:28 236:45]
  wire  _GEN_1248 = 5'h10 == cache_state ? 1'h0 : _GEN_1140; // @[cache_single_port.scala 254:28 290:28]
  wire [1:0] _GEN_1250 = 5'h10 == cache_state ? 2'h3 : _GEN_1142; // @[cache_single_port.scala 290:28 257:32]
  wire [31:0] _GEN_1251 = 5'h10 == cache_state ? cpu_request_addr_reg : _GEN_1143; // @[cache_single_port.scala 290:28 255:32]
  wire [63:0] _GEN_1252 = 5'h10 == cache_state ? 64'h0 : _GEN_1144; // @[cache_single_port.scala 290:28 245:30]
  wire  _GEN_1253 = 5'h10 == cache_state ? 1'h0 : _GEN_1145; // @[cache_single_port.scala 266:27 290:28]
  wire  _GEN_1254 = 5'h10 == cache_state ? 1'h0 : _GEN_1146; // @[cache_single_port.scala 290:28 244:31]
  wire [127:0] _GEN_1258 = 5'h10 == cache_state ? data_mem_0_io_data_read_data : _GEN_1175; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_1261 = 5'h10 == cache_state ? 128'h0 : _GEN_1178; // @[cache_single_port.scala 290:28 240:48]
  wire [127:0] _GEN_1262 = 5'h10 == cache_state ? data_mem_1_io_data_read_data : _GEN_1179; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_1263 = 5'h10 == cache_state ? 128'h0 : _GEN_1180; // @[cache_single_port.scala 290:28 240:48]
  wire [127:0] _GEN_1264 = 5'h10 == cache_state ? data_mem_2_io_data_read_data : _GEN_1181; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_1265 = 5'h10 == cache_state ? 128'h0 : _GEN_1182; // @[cache_single_port.scala 290:28 240:48]
  wire [127:0] _GEN_1266 = 5'h10 == cache_state ? data_mem_3_io_data_read_data : _GEN_1183; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_1267 = 5'h10 == cache_state ? 128'h0 : _GEN_1184; // @[cache_single_port.scala 290:28 240:48]
  wire  _GEN_1281 = 5'hf == cache_state ? flush_over : _GEN_1254; // @[cache_single_port.scala 290:28]
  wire [5:0] _GEN_1282 = 5'hf == cache_state ? cpu_request_addr_index : _GEN_1196; // @[cache_single_port.scala 290:28 233:47]
  wire  _GEN_1291 = 5'hf == cache_state ? 1'h0 : 5'h10 == cache_state | _GEN_1157; // @[cache_single_port.scala 290:28 235:44]
  wire [21:0] _GEN_1292 = 5'hf == cache_state ? tag_mem_0_io_tag_read_tag : _GEN_1208; // @[cache_single_port.scala 290:28 237:41]
  wire [7:0] _GEN_1293 = 5'hf == cache_state ? tag_mem_0_io_tag_read_visit : _GEN_1209; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1294 = 5'hf == cache_state ? tag_mem_0_io_tag_read_dirty : _GEN_1210; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1295 = 5'hf == cache_state ? tag_mem_0_io_tag_read_valid : _GEN_1211; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1296 = 5'hf == cache_state ? 1'h0 : 5'h10 == cache_state | _GEN_1162; // @[cache_single_port.scala 290:28 235:44]
  wire [21:0] _GEN_1297 = 5'hf == cache_state ? tag_mem_1_io_tag_read_tag : _GEN_1213; // @[cache_single_port.scala 290:28 237:41]
  wire [7:0] _GEN_1298 = 5'hf == cache_state ? tag_mem_1_io_tag_read_visit : _GEN_1214; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1299 = 5'hf == cache_state ? tag_mem_1_io_tag_read_dirty : _GEN_1215; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1300 = 5'hf == cache_state ? tag_mem_1_io_tag_read_valid : _GEN_1216; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1301 = 5'hf == cache_state ? 1'h0 : 5'h10 == cache_state | _GEN_1167; // @[cache_single_port.scala 290:28 235:44]
  wire [21:0] _GEN_1302 = 5'hf == cache_state ? tag_mem_2_io_tag_read_tag : _GEN_1218; // @[cache_single_port.scala 290:28 237:41]
  wire [7:0] _GEN_1303 = 5'hf == cache_state ? tag_mem_2_io_tag_read_visit : _GEN_1219; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1304 = 5'hf == cache_state ? tag_mem_2_io_tag_read_dirty : _GEN_1220; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1305 = 5'hf == cache_state ? tag_mem_2_io_tag_read_valid : _GEN_1221; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1306 = 5'hf == cache_state ? 1'h0 : 5'h10 == cache_state | _GEN_1172; // @[cache_single_port.scala 290:28 235:44]
  wire [21:0] _GEN_1307 = 5'hf == cache_state ? tag_mem_3_io_tag_read_tag : _GEN_1223; // @[cache_single_port.scala 290:28 237:41]
  wire [7:0] _GEN_1308 = 5'hf == cache_state ? tag_mem_3_io_tag_read_visit : _GEN_1224; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1309 = 5'hf == cache_state ? tag_mem_3_io_tag_read_dirty : _GEN_1225; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1310 = 5'hf == cache_state ? tag_mem_3_io_tag_read_valid : _GEN_1226; // @[cache_single_port.scala 290:28 237:41]
  wire [5:0] _GEN_1311 = 5'hf == cache_state ? io_cpu_request_addr[9:4] : _GEN_1227; // @[cache_single_port.scala 290:28 234:48]
  wire  _GEN_1312 = 5'hf == cache_state ? 1'h0 : _GEN_1228; // @[cache_single_port.scala 290:28 236:45]
  wire  _GEN_1314 = 5'hf == cache_state ? 1'h0 : _GEN_1230; // @[cache_single_port.scala 290:28 236:45]
  wire  _GEN_1316 = 5'hf == cache_state ? 1'h0 : _GEN_1232; // @[cache_single_port.scala 290:28 236:45]
  wire  _GEN_1318 = 5'hf == cache_state ? 1'h0 : _GEN_1234; // @[cache_single_port.scala 290:28 236:45]
  wire  _GEN_1332 = 5'hf == cache_state ? 1'h0 : _GEN_1248; // @[cache_single_port.scala 254:28 290:28]
  wire [1:0] _GEN_1334 = 5'hf == cache_state ? 2'h3 : _GEN_1250; // @[cache_single_port.scala 290:28 257:32]
  wire [31:0] _GEN_1335 = 5'hf == cache_state ? cpu_request_addr_reg : _GEN_1251; // @[cache_single_port.scala 290:28 255:32]
  wire [63:0] _GEN_1336 = 5'hf == cache_state ? 64'h0 : _GEN_1252; // @[cache_single_port.scala 290:28 245:30]
  wire  _GEN_1337 = 5'hf == cache_state ? 1'h0 : _GEN_1253; // @[cache_single_port.scala 266:27 290:28]
  wire [127:0] _GEN_1341 = 5'hf == cache_state ? data_mem_0_io_data_read_data : _GEN_1258; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_1344 = 5'hf == cache_state ? 128'h0 : _GEN_1261; // @[cache_single_port.scala 290:28 240:48]
  wire [127:0] _GEN_1345 = 5'hf == cache_state ? data_mem_1_io_data_read_data : _GEN_1262; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_1346 = 5'hf == cache_state ? 128'h0 : _GEN_1263; // @[cache_single_port.scala 290:28 240:48]
  wire [127:0] _GEN_1347 = 5'hf == cache_state ? data_mem_2_io_data_read_data : _GEN_1264; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_1348 = 5'hf == cache_state ? 128'h0 : _GEN_1265; // @[cache_single_port.scala 290:28 240:48]
  wire [127:0] _GEN_1349 = 5'hf == cache_state ? data_mem_3_io_data_read_data : _GEN_1266; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_1350 = 5'hf == cache_state ? 128'h0 : _GEN_1267; // @[cache_single_port.scala 290:28 240:48]
  wire  _GEN_1416 = 5'h0 == cache_state | (5'hf == cache_state | (5'h10 == cache_state | (5'h11 == cache_state | (5'h13
     == cache_state | _GEN_963)))); // @[cache_single_port.scala 290:28 256:31]
  wire [1:0] _GEN_1417 = 5'h0 == cache_state ? 2'h3 : _GEN_1334; // @[cache_single_port.scala 290:28 257:32]
  ysyx_041812_tag_cache tag_mem_0 ( // @[cache_single_port.scala 158:45]
    .clock(tag_mem_0_clock),
    .reset(tag_mem_0_reset),
    .io_cache_req_index(tag_mem_0_io_cache_req_index),
    .io_cache_req_we(tag_mem_0_io_cache_req_we),
    .io_tag_write_valid(tag_mem_0_io_tag_write_valid),
    .io_tag_write_dirty(tag_mem_0_io_tag_write_dirty),
    .io_tag_write_visit(tag_mem_0_io_tag_write_visit),
    .io_tag_write_tag(tag_mem_0_io_tag_write_tag),
    .io_tag_read_valid(tag_mem_0_io_tag_read_valid),
    .io_tag_read_dirty(tag_mem_0_io_tag_read_dirty),
    .io_tag_read_visit(tag_mem_0_io_tag_read_visit),
    .io_tag_read_tag(tag_mem_0_io_tag_read_tag)
  );
  ysyx_041812_tag_cache tag_mem_1 ( // @[cache_single_port.scala 158:45]
    .clock(tag_mem_1_clock),
    .reset(tag_mem_1_reset),
    .io_cache_req_index(tag_mem_1_io_cache_req_index),
    .io_cache_req_we(tag_mem_1_io_cache_req_we),
    .io_tag_write_valid(tag_mem_1_io_tag_write_valid),
    .io_tag_write_dirty(tag_mem_1_io_tag_write_dirty),
    .io_tag_write_visit(tag_mem_1_io_tag_write_visit),
    .io_tag_write_tag(tag_mem_1_io_tag_write_tag),
    .io_tag_read_valid(tag_mem_1_io_tag_read_valid),
    .io_tag_read_dirty(tag_mem_1_io_tag_read_dirty),
    .io_tag_read_visit(tag_mem_1_io_tag_read_visit),
    .io_tag_read_tag(tag_mem_1_io_tag_read_tag)
  );
  ysyx_041812_tag_cache tag_mem_2 ( // @[cache_single_port.scala 158:45]
    .clock(tag_mem_2_clock),
    .reset(tag_mem_2_reset),
    .io_cache_req_index(tag_mem_2_io_cache_req_index),
    .io_cache_req_we(tag_mem_2_io_cache_req_we),
    .io_tag_write_valid(tag_mem_2_io_tag_write_valid),
    .io_tag_write_dirty(tag_mem_2_io_tag_write_dirty),
    .io_tag_write_visit(tag_mem_2_io_tag_write_visit),
    .io_tag_write_tag(tag_mem_2_io_tag_write_tag),
    .io_tag_read_valid(tag_mem_2_io_tag_read_valid),
    .io_tag_read_dirty(tag_mem_2_io_tag_read_dirty),
    .io_tag_read_visit(tag_mem_2_io_tag_read_visit),
    .io_tag_read_tag(tag_mem_2_io_tag_read_tag)
  );
  ysyx_041812_tag_cache tag_mem_3 ( // @[cache_single_port.scala 158:45]
    .clock(tag_mem_3_clock),
    .reset(tag_mem_3_reset),
    .io_cache_req_index(tag_mem_3_io_cache_req_index),
    .io_cache_req_we(tag_mem_3_io_cache_req_we),
    .io_tag_write_valid(tag_mem_3_io_tag_write_valid),
    .io_tag_write_dirty(tag_mem_3_io_tag_write_dirty),
    .io_tag_write_visit(tag_mem_3_io_tag_write_visit),
    .io_tag_write_tag(tag_mem_3_io_tag_write_tag),
    .io_tag_read_valid(tag_mem_3_io_tag_read_valid),
    .io_tag_read_dirty(tag_mem_3_io_tag_read_dirty),
    .io_tag_read_visit(tag_mem_3_io_tag_read_visit),
    .io_tag_read_tag(tag_mem_3_io_tag_read_tag)
  );
  ysyx_041812_data_cache data_mem_0 ( // @[cache_single_port.scala 159:46]
    .io_cache_req_wmask(data_mem_0_io_cache_req_wmask),
    .io_cache_req_index(data_mem_0_io_cache_req_index),
    .io_cache_req_we(data_mem_0_io_cache_req_we),
    .io_data_write_data(data_mem_0_io_data_write_data),
    .io_data_read_data(data_mem_0_io_data_read_data),
    .io_sram_addr(data_mem_0_io_sram_addr),
    .io_sram_wen(data_mem_0_io_sram_wen),
    .io_sram_wmask(data_mem_0_io_sram_wmask),
    .io_sram_wdata(data_mem_0_io_sram_wdata),
    .io_sram_rdata(data_mem_0_io_sram_rdata)
  );
  ysyx_041812_data_cache data_mem_1 ( // @[cache_single_port.scala 159:46]
    .io_cache_req_wmask(data_mem_1_io_cache_req_wmask),
    .io_cache_req_index(data_mem_1_io_cache_req_index),
    .io_cache_req_we(data_mem_1_io_cache_req_we),
    .io_data_write_data(data_mem_1_io_data_write_data),
    .io_data_read_data(data_mem_1_io_data_read_data),
    .io_sram_addr(data_mem_1_io_sram_addr),
    .io_sram_wen(data_mem_1_io_sram_wen),
    .io_sram_wmask(data_mem_1_io_sram_wmask),
    .io_sram_wdata(data_mem_1_io_sram_wdata),
    .io_sram_rdata(data_mem_1_io_sram_rdata)
  );
  ysyx_041812_data_cache data_mem_2 ( // @[cache_single_port.scala 159:46]
    .io_cache_req_wmask(data_mem_2_io_cache_req_wmask),
    .io_cache_req_index(data_mem_2_io_cache_req_index),
    .io_cache_req_we(data_mem_2_io_cache_req_we),
    .io_data_write_data(data_mem_2_io_data_write_data),
    .io_data_read_data(data_mem_2_io_data_read_data),
    .io_sram_addr(data_mem_2_io_sram_addr),
    .io_sram_wen(data_mem_2_io_sram_wen),
    .io_sram_wmask(data_mem_2_io_sram_wmask),
    .io_sram_wdata(data_mem_2_io_sram_wdata),
    .io_sram_rdata(data_mem_2_io_sram_rdata)
  );
  ysyx_041812_data_cache data_mem_3 ( // @[cache_single_port.scala 159:46]
    .io_cache_req_wmask(data_mem_3_io_cache_req_wmask),
    .io_cache_req_index(data_mem_3_io_cache_req_index),
    .io_cache_req_we(data_mem_3_io_cache_req_we),
    .io_data_write_data(data_mem_3_io_data_write_data),
    .io_data_read_data(data_mem_3_io_data_read_data),
    .io_sram_addr(data_mem_3_io_sram_addr),
    .io_sram_wen(data_mem_3_io_sram_wen),
    .io_sram_wmask(data_mem_3_io_sram_wmask),
    .io_sram_wdata(data_mem_3_io_sram_wdata),
    .io_sram_rdata(data_mem_3_io_sram_rdata)
  );
  assign io_cpu_response_data = 5'h0 == cache_state ? 64'h0 : _GEN_1336; // @[cache_single_port.scala 290:28 245:30]
  assign io_cpu_response_ready = 5'h0 == cache_state ? 1'h0 : _GEN_1281; // @[cache_single_port.scala 290:28 244:31]
  assign io_mem_io_ar_valid = 5'h0 == cache_state ? 1'h0 : _GEN_1332; // @[cache_single_port.scala 254:28 290:28]
  assign io_mem_io_ar_bits_addr = 5'h0 == cache_state ? cpu_request_addr_reg : _GEN_1335; // @[cache_single_port.scala 290:28 255:32]
  assign io_mem_io_ar_bits_len = {{7'd0}, _GEN_1416};
  assign io_mem_io_ar_bits_size = {{1'd0}, _GEN_1417};
  assign io_mem_io_r_ready = 5'h0 == cache_state ? 1'h0 : _GEN_1337; // @[cache_single_port.scala 266:27 290:28]
  assign io_sram0_addr = data_mem_0_io_sram_addr; // @[cache_single_port.scala 179:23]
  assign io_sram0_wen = data_mem_0_io_sram_wen; // @[cache_single_port.scala 181:23]
  assign io_sram0_wmask = data_mem_0_io_sram_wmask; // @[cache_single_port.scala 182:24]
  assign io_sram0_wdata = data_mem_0_io_sram_wdata; // @[cache_single_port.scala 183:24]
  assign io_sram1_addr = data_mem_1_io_sram_addr; // @[cache_single_port.scala 186:23]
  assign io_sram1_wen = data_mem_1_io_sram_wen; // @[cache_single_port.scala 188:23]
  assign io_sram1_wmask = data_mem_1_io_sram_wmask; // @[cache_single_port.scala 189:24]
  assign io_sram1_wdata = data_mem_1_io_sram_wdata; // @[cache_single_port.scala 190:24]
  assign io_sram2_addr = data_mem_2_io_sram_addr; // @[cache_single_port.scala 193:23]
  assign io_sram2_wen = data_mem_2_io_sram_wen; // @[cache_single_port.scala 195:23]
  assign io_sram2_wmask = data_mem_2_io_sram_wmask; // @[cache_single_port.scala 196:24]
  assign io_sram2_wdata = data_mem_2_io_sram_wdata; // @[cache_single_port.scala 197:24]
  assign io_sram3_addr = data_mem_3_io_sram_addr; // @[cache_single_port.scala 200:23]
  assign io_sram3_wen = data_mem_3_io_sram_wen; // @[cache_single_port.scala 202:23]
  assign io_sram3_wmask = data_mem_3_io_sram_wmask; // @[cache_single_port.scala 203:24]
  assign io_sram3_wdata = data_mem_3_io_sram_wdata; // @[cache_single_port.scala 204:24]
  assign tag_mem_0_clock = clock;
  assign tag_mem_0_reset = reset;
  assign tag_mem_0_io_cache_req_index = 5'h0 == cache_state ? cpu_request_addr_index : _GEN_1282; // @[cache_single_port.scala 290:28 233:47]
  assign tag_mem_0_io_cache_req_we = 5'h0 == cache_state ? 1'h0 : _GEN_1291; // @[cache_single_port.scala 290:28 235:44]
  assign tag_mem_0_io_tag_write_valid = 5'h0 == cache_state ? tag_mem_0_io_tag_read_valid : _GEN_1295; // @[cache_single_port.scala 290:28 237:41]
  assign tag_mem_0_io_tag_write_dirty = 5'h0 == cache_state ? tag_mem_0_io_tag_read_dirty : _GEN_1294; // @[cache_single_port.scala 290:28 237:41]
  assign tag_mem_0_io_tag_write_visit = 5'h0 == cache_state ? tag_mem_0_io_tag_read_visit : _GEN_1293; // @[cache_single_port.scala 290:28 237:41]
  assign tag_mem_0_io_tag_write_tag = 5'h0 == cache_state ? tag_mem_0_io_tag_read_tag : _GEN_1292; // @[cache_single_port.scala 290:28 237:41]
  assign tag_mem_1_clock = clock;
  assign tag_mem_1_reset = reset;
  assign tag_mem_1_io_cache_req_index = 5'h0 == cache_state ? cpu_request_addr_index : _GEN_1282; // @[cache_single_port.scala 290:28 233:47]
  assign tag_mem_1_io_cache_req_we = 5'h0 == cache_state ? 1'h0 : _GEN_1296; // @[cache_single_port.scala 290:28 235:44]
  assign tag_mem_1_io_tag_write_valid = 5'h0 == cache_state ? tag_mem_1_io_tag_read_valid : _GEN_1300; // @[cache_single_port.scala 290:28 237:41]
  assign tag_mem_1_io_tag_write_dirty = 5'h0 == cache_state ? tag_mem_1_io_tag_read_dirty : _GEN_1299; // @[cache_single_port.scala 290:28 237:41]
  assign tag_mem_1_io_tag_write_visit = 5'h0 == cache_state ? tag_mem_1_io_tag_read_visit : _GEN_1298; // @[cache_single_port.scala 290:28 237:41]
  assign tag_mem_1_io_tag_write_tag = 5'h0 == cache_state ? tag_mem_1_io_tag_read_tag : _GEN_1297; // @[cache_single_port.scala 290:28 237:41]
  assign tag_mem_2_clock = clock;
  assign tag_mem_2_reset = reset;
  assign tag_mem_2_io_cache_req_index = 5'h0 == cache_state ? cpu_request_addr_index : _GEN_1282; // @[cache_single_port.scala 290:28 233:47]
  assign tag_mem_2_io_cache_req_we = 5'h0 == cache_state ? 1'h0 : _GEN_1301; // @[cache_single_port.scala 290:28 235:44]
  assign tag_mem_2_io_tag_write_valid = 5'h0 == cache_state ? tag_mem_2_io_tag_read_valid : _GEN_1305; // @[cache_single_port.scala 290:28 237:41]
  assign tag_mem_2_io_tag_write_dirty = 5'h0 == cache_state ? tag_mem_2_io_tag_read_dirty : _GEN_1304; // @[cache_single_port.scala 290:28 237:41]
  assign tag_mem_2_io_tag_write_visit = 5'h0 == cache_state ? tag_mem_2_io_tag_read_visit : _GEN_1303; // @[cache_single_port.scala 290:28 237:41]
  assign tag_mem_2_io_tag_write_tag = 5'h0 == cache_state ? tag_mem_2_io_tag_read_tag : _GEN_1302; // @[cache_single_port.scala 290:28 237:41]
  assign tag_mem_3_clock = clock;
  assign tag_mem_3_reset = reset;
  assign tag_mem_3_io_cache_req_index = 5'h0 == cache_state ? cpu_request_addr_index : _GEN_1282; // @[cache_single_port.scala 290:28 233:47]
  assign tag_mem_3_io_cache_req_we = 5'h0 == cache_state ? 1'h0 : _GEN_1306; // @[cache_single_port.scala 290:28 235:44]
  assign tag_mem_3_io_tag_write_valid = 5'h0 == cache_state ? tag_mem_3_io_tag_read_valid : _GEN_1310; // @[cache_single_port.scala 290:28 237:41]
  assign tag_mem_3_io_tag_write_dirty = 5'h0 == cache_state ? tag_mem_3_io_tag_read_dirty : _GEN_1309; // @[cache_single_port.scala 290:28 237:41]
  assign tag_mem_3_io_tag_write_visit = 5'h0 == cache_state ? tag_mem_3_io_tag_read_visit : _GEN_1308; // @[cache_single_port.scala 290:28 237:41]
  assign tag_mem_3_io_tag_write_tag = 5'h0 == cache_state ? tag_mem_3_io_tag_read_tag : _GEN_1307; // @[cache_single_port.scala 290:28 237:41]
  assign data_mem_0_io_cache_req_wmask = 5'h0 == cache_state ? 128'h0 : _GEN_1344; // @[cache_single_port.scala 290:28 240:48]
  assign data_mem_0_io_cache_req_index = 5'h0 == cache_state ? io_cpu_request_addr[9:4] : _GEN_1311; // @[cache_single_port.scala 290:28 234:48]
  assign data_mem_0_io_cache_req_we = 5'h0 == cache_state ? 1'h0 : _GEN_1312; // @[cache_single_port.scala 290:28 236:45]
  assign data_mem_0_io_data_write_data = 5'h0 == cache_state ? data_mem_0_io_data_read_data : _GEN_1341; // @[cache_single_port.scala 290:28 238:43]
  assign data_mem_0_io_sram_rdata = io_sram0_rdata; // @[cache_single_port.scala 184:35]
  assign data_mem_1_io_cache_req_wmask = 5'h0 == cache_state ? 128'h0 : _GEN_1346; // @[cache_single_port.scala 290:28 240:48]
  assign data_mem_1_io_cache_req_index = io_cpu_request_addr[9:4]; // @[cache_single_port.scala 234:70]
  assign data_mem_1_io_cache_req_we = 5'h0 == cache_state ? 1'h0 : _GEN_1314; // @[cache_single_port.scala 290:28 236:45]
  assign data_mem_1_io_data_write_data = 5'h0 == cache_state ? data_mem_1_io_data_read_data : _GEN_1345; // @[cache_single_port.scala 290:28 238:43]
  assign data_mem_1_io_sram_rdata = io_sram1_rdata; // @[cache_single_port.scala 191:35]
  assign data_mem_2_io_cache_req_wmask = 5'h0 == cache_state ? 128'h0 : _GEN_1348; // @[cache_single_port.scala 290:28 240:48]
  assign data_mem_2_io_cache_req_index = io_cpu_request_addr[9:4]; // @[cache_single_port.scala 234:70]
  assign data_mem_2_io_cache_req_we = 5'h0 == cache_state ? 1'h0 : _GEN_1316; // @[cache_single_port.scala 290:28 236:45]
  assign data_mem_2_io_data_write_data = 5'h0 == cache_state ? data_mem_2_io_data_read_data : _GEN_1347; // @[cache_single_port.scala 290:28 238:43]
  assign data_mem_2_io_sram_rdata = io_sram2_rdata; // @[cache_single_port.scala 198:35]
  assign data_mem_3_io_cache_req_wmask = 5'h0 == cache_state ? 128'h0 : _GEN_1350; // @[cache_single_port.scala 290:28 240:48]
  assign data_mem_3_io_cache_req_index = io_cpu_request_addr[9:4]; // @[cache_single_port.scala 234:70]
  assign data_mem_3_io_cache_req_we = 5'h0 == cache_state ? 1'h0 : _GEN_1318; // @[cache_single_port.scala 290:28 236:45]
  assign data_mem_3_io_data_write_data = 5'h0 == cache_state ? data_mem_3_io_data_read_data : _GEN_1349; // @[cache_single_port.scala 290:28 238:43]
  assign data_mem_3_io_sram_rdata = io_sram3_rdata; // @[cache_single_port.scala 205:35]
  always @(posedge clock) begin
    if (reset) begin // @[cache_single_port.scala 157:34]
      cache_state <= 5'h0; // @[cache_single_port.scala 157:34]
    end else if (5'h0 == cache_state) begin // @[cache_single_port.scala 290:28]
      cache_state <= {{1'd0}, _GEN_9};
    end else if (5'hf == cache_state) begin // @[cache_single_port.scala 290:28]
      if (flush_over) begin // @[cache_single_port.scala 314:49]
        cache_state <= 5'h0; // @[cache_single_port.scala 315:52]
      end else begin
        cache_state <= 5'h10; // @[cache_single_port.scala 320:52]
      end
    end else if (5'h10 == cache_state) begin // @[cache_single_port.scala 290:28]
      cache_state <= 5'hf;
    end else begin
      cache_state <= _GEN_1114;
    end
    if (reset) begin // @[Counter.scala 62:40]
      index <= 1'h0; // @[Counter.scala 62:40]
    end else if (5'h0 == cache_state) begin // @[cache_single_port.scala 290:28]
      index <= _GEN_0;
    end else if (5'hf == cache_state) begin // @[cache_single_port.scala 290:28]
      index <= _GEN_0;
    end else if (5'h10 == cache_state) begin // @[cache_single_port.scala 290:28]
      index <= _GEN_0;
    end else begin
      index <= _GEN_1134;
    end
    if (reset) begin // @[cache_single_port.scala 165:30]
      replace <= 2'h0; // @[cache_single_port.scala 165:30]
    end else if (!(5'h0 == cache_state)) begin // @[cache_single_port.scala 290:28]
      if (!(5'hf == cache_state)) begin // @[cache_single_port.scala 290:28]
        if (!(5'h10 == cache_state)) begin // @[cache_single_port.scala 290:28]
          replace <= _GEN_1193;
        end
      end
    end
    if (reset) begin // @[cache_single_port.scala 166:34]
      refill_addr <= 32'h0; // @[cache_single_port.scala 166:34]
    end else if (!(5'h0 == cache_state)) begin // @[cache_single_port.scala 290:28]
      if (!(5'hf == cache_state)) begin // @[cache_single_port.scala 290:28]
        if (!(5'h10 == cache_state)) begin // @[cache_single_port.scala 290:28]
          refill_addr <= _GEN_1194;
        end
      end
    end
    if (reset) begin // @[cache_single_port.scala 171:50]
      cpu_request_addr_reg_origin <= 32'h0; // @[cache_single_port.scala 171:50]
    end else begin
      cpu_request_addr_reg_origin <= io_cpu_request_addr; // @[cache_single_port.scala 217:37]
    end
    if (reset) begin // @[cache_single_port.scala 172:43]
      cpu_request_addr_reg <= 32'h0; // @[cache_single_port.scala 172:43]
    end else begin
      cpu_request_addr_reg <= align_addr; // @[cache_single_port.scala 216:30]
    end
    if (reset) begin // @[cache_single_port.scala 177:45]
      cpu_request_accessType <= 2'h0; // @[cache_single_port.scala 177:45]
    end else begin
      cpu_request_accessType <= 2'h2; // @[cache_single_port.scala 222:32]
    end
    if (reset) begin // @[Counter.scala 62:40]
      flush_loop <= 6'h0; // @[Counter.scala 62:40]
    end else if (5'h0 == cache_state) begin // @[cache_single_port.scala 290:28]
      flush_loop <= _GEN_2;
    end else if (5'hf == cache_state) begin // @[cache_single_port.scala 290:28]
      if (flush_over) begin // @[cache_single_port.scala 314:49]
        flush_loop <= 6'h0; // @[cache_single_port.scala 316:52]
      end else begin
        flush_loop <= _GEN_2;
      end
    end else begin
      flush_loop <= _GEN_2;
    end
    if (reset) begin // @[cache_single_port.scala 280:33]
      flush_over <= 1'h0; // @[cache_single_port.scala 280:33]
    end else if (!(5'h0 == cache_state)) begin // @[cache_single_port.scala 290:28]
      if (5'hf == cache_state) begin // @[cache_single_port.scala 290:28]
        if (flush_over) begin // @[cache_single_port.scala 314:49]
          flush_over <= 1'h0; // @[cache_single_port.scala 317:52]
        end
      end else if (5'h10 == cache_state) begin // @[cache_single_port.scala 290:28]
        flush_over <= _GEN_14;
      end
    end
    if (reset) begin // @[cache_single_port.scala 285:40]
      tmp_response_data <= 64'h0; // @[cache_single_port.scala 285:40]
    end else if (!(5'h0 == cache_state)) begin // @[cache_single_port.scala 290:28]
      if (!(5'hf == cache_state)) begin // @[cache_single_port.scala 290:28]
        if (!(5'h10 == cache_state)) begin // @[cache_single_port.scala 290:28]
          tmp_response_data <= _GEN_1154;
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
  cache_state = _RAND_0[4:0];
  _RAND_1 = {1{`RANDOM}};
  index = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  replace = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  refill_addr = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  cpu_request_addr_reg_origin = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  cpu_request_addr_reg = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  cpu_request_accessType = _RAND_6[1:0];
  _RAND_7 = {1{`RANDOM}};
  flush_loop = _RAND_7[5:0];
  _RAND_8 = {1{`RANDOM}};
  flush_over = _RAND_8[0:0];
  _RAND_9 = {2{`RANDOM}};
  tmp_response_data = _RAND_9[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_041812_Cache_1(
  input          clock,
  input          reset,
  input  [31:0]  io_cpu_request_addr,
  input  [63:0]  io_cpu_request_data,
  input  [7:0]   io_cpu_request_mask,
  input          io_cpu_request_rw,
  input          io_cpu_request_valid,
  output [63:0]  io_cpu_response_data,
  output         io_cpu_response_ready,
  input          io_mem_io_aw_ready,
  output         io_mem_io_aw_valid,
  output [31:0]  io_mem_io_aw_bits_addr,
  output [7:0]   io_mem_io_aw_bits_len,
  output [2:0]   io_mem_io_aw_bits_size,
  input          io_mem_io_w_ready,
  output         io_mem_io_w_valid,
  output [63:0]  io_mem_io_w_bits_data,
  output [7:0]   io_mem_io_w_bits_strb,
  output         io_mem_io_w_bits_last,
  output         io_mem_io_b_ready,
  input          io_mem_io_b_valid,
  input          io_mem_io_ar_ready,
  output         io_mem_io_ar_valid,
  output [31:0]  io_mem_io_ar_bits_addr,
  output [7:0]   io_mem_io_ar_bits_len,
  output [2:0]   io_mem_io_ar_bits_size,
  output         io_mem_io_r_ready,
  input          io_mem_io_r_valid,
  input  [63:0]  io_mem_io_r_bits_data,
  input          io_mem_io_r_bits_last,
  input          io_flush,
  input  [1:0]   io_accessType,
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
  reg [63:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [63:0] _RAND_15;
  reg [31:0] _RAND_16;
`endif // RANDOMIZE_REG_INIT
  wire  tag_mem_0_clock; // @[cache_single_port.scala 158:45]
  wire  tag_mem_0_reset; // @[cache_single_port.scala 158:45]
  wire [5:0] tag_mem_0_io_cache_req_index; // @[cache_single_port.scala 158:45]
  wire  tag_mem_0_io_cache_req_we; // @[cache_single_port.scala 158:45]
  wire  tag_mem_0_io_tag_write_valid; // @[cache_single_port.scala 158:45]
  wire  tag_mem_0_io_tag_write_dirty; // @[cache_single_port.scala 158:45]
  wire [7:0] tag_mem_0_io_tag_write_visit; // @[cache_single_port.scala 158:45]
  wire [21:0] tag_mem_0_io_tag_write_tag; // @[cache_single_port.scala 158:45]
  wire  tag_mem_0_io_tag_read_valid; // @[cache_single_port.scala 158:45]
  wire  tag_mem_0_io_tag_read_dirty; // @[cache_single_port.scala 158:45]
  wire [7:0] tag_mem_0_io_tag_read_visit; // @[cache_single_port.scala 158:45]
  wire [21:0] tag_mem_0_io_tag_read_tag; // @[cache_single_port.scala 158:45]
  wire  tag_mem_1_clock; // @[cache_single_port.scala 158:45]
  wire  tag_mem_1_reset; // @[cache_single_port.scala 158:45]
  wire [5:0] tag_mem_1_io_cache_req_index; // @[cache_single_port.scala 158:45]
  wire  tag_mem_1_io_cache_req_we; // @[cache_single_port.scala 158:45]
  wire  tag_mem_1_io_tag_write_valid; // @[cache_single_port.scala 158:45]
  wire  tag_mem_1_io_tag_write_dirty; // @[cache_single_port.scala 158:45]
  wire [7:0] tag_mem_1_io_tag_write_visit; // @[cache_single_port.scala 158:45]
  wire [21:0] tag_mem_1_io_tag_write_tag; // @[cache_single_port.scala 158:45]
  wire  tag_mem_1_io_tag_read_valid; // @[cache_single_port.scala 158:45]
  wire  tag_mem_1_io_tag_read_dirty; // @[cache_single_port.scala 158:45]
  wire [7:0] tag_mem_1_io_tag_read_visit; // @[cache_single_port.scala 158:45]
  wire [21:0] tag_mem_1_io_tag_read_tag; // @[cache_single_port.scala 158:45]
  wire  tag_mem_2_clock; // @[cache_single_port.scala 158:45]
  wire  tag_mem_2_reset; // @[cache_single_port.scala 158:45]
  wire [5:0] tag_mem_2_io_cache_req_index; // @[cache_single_port.scala 158:45]
  wire  tag_mem_2_io_cache_req_we; // @[cache_single_port.scala 158:45]
  wire  tag_mem_2_io_tag_write_valid; // @[cache_single_port.scala 158:45]
  wire  tag_mem_2_io_tag_write_dirty; // @[cache_single_port.scala 158:45]
  wire [7:0] tag_mem_2_io_tag_write_visit; // @[cache_single_port.scala 158:45]
  wire [21:0] tag_mem_2_io_tag_write_tag; // @[cache_single_port.scala 158:45]
  wire  tag_mem_2_io_tag_read_valid; // @[cache_single_port.scala 158:45]
  wire  tag_mem_2_io_tag_read_dirty; // @[cache_single_port.scala 158:45]
  wire [7:0] tag_mem_2_io_tag_read_visit; // @[cache_single_port.scala 158:45]
  wire [21:0] tag_mem_2_io_tag_read_tag; // @[cache_single_port.scala 158:45]
  wire  tag_mem_3_clock; // @[cache_single_port.scala 158:45]
  wire  tag_mem_3_reset; // @[cache_single_port.scala 158:45]
  wire [5:0] tag_mem_3_io_cache_req_index; // @[cache_single_port.scala 158:45]
  wire  tag_mem_3_io_cache_req_we; // @[cache_single_port.scala 158:45]
  wire  tag_mem_3_io_tag_write_valid; // @[cache_single_port.scala 158:45]
  wire  tag_mem_3_io_tag_write_dirty; // @[cache_single_port.scala 158:45]
  wire [7:0] tag_mem_3_io_tag_write_visit; // @[cache_single_port.scala 158:45]
  wire [21:0] tag_mem_3_io_tag_write_tag; // @[cache_single_port.scala 158:45]
  wire  tag_mem_3_io_tag_read_valid; // @[cache_single_port.scala 158:45]
  wire  tag_mem_3_io_tag_read_dirty; // @[cache_single_port.scala 158:45]
  wire [7:0] tag_mem_3_io_tag_read_visit; // @[cache_single_port.scala 158:45]
  wire [21:0] tag_mem_3_io_tag_read_tag; // @[cache_single_port.scala 158:45]
  wire [127:0] data_mem_0_io_cache_req_wmask; // @[cache_single_port.scala 159:46]
  wire [5:0] data_mem_0_io_cache_req_index; // @[cache_single_port.scala 159:46]
  wire  data_mem_0_io_cache_req_we; // @[cache_single_port.scala 159:46]
  wire [127:0] data_mem_0_io_data_write_data; // @[cache_single_port.scala 159:46]
  wire [127:0] data_mem_0_io_data_read_data; // @[cache_single_port.scala 159:46]
  wire [5:0] data_mem_0_io_sram_addr; // @[cache_single_port.scala 159:46]
  wire  data_mem_0_io_sram_wen; // @[cache_single_port.scala 159:46]
  wire [127:0] data_mem_0_io_sram_wmask; // @[cache_single_port.scala 159:46]
  wire [127:0] data_mem_0_io_sram_wdata; // @[cache_single_port.scala 159:46]
  wire [127:0] data_mem_0_io_sram_rdata; // @[cache_single_port.scala 159:46]
  wire [127:0] data_mem_1_io_cache_req_wmask; // @[cache_single_port.scala 159:46]
  wire [5:0] data_mem_1_io_cache_req_index; // @[cache_single_port.scala 159:46]
  wire  data_mem_1_io_cache_req_we; // @[cache_single_port.scala 159:46]
  wire [127:0] data_mem_1_io_data_write_data; // @[cache_single_port.scala 159:46]
  wire [127:0] data_mem_1_io_data_read_data; // @[cache_single_port.scala 159:46]
  wire [5:0] data_mem_1_io_sram_addr; // @[cache_single_port.scala 159:46]
  wire  data_mem_1_io_sram_wen; // @[cache_single_port.scala 159:46]
  wire [127:0] data_mem_1_io_sram_wmask; // @[cache_single_port.scala 159:46]
  wire [127:0] data_mem_1_io_sram_wdata; // @[cache_single_port.scala 159:46]
  wire [127:0] data_mem_1_io_sram_rdata; // @[cache_single_port.scala 159:46]
  wire [127:0] data_mem_2_io_cache_req_wmask; // @[cache_single_port.scala 159:46]
  wire [5:0] data_mem_2_io_cache_req_index; // @[cache_single_port.scala 159:46]
  wire  data_mem_2_io_cache_req_we; // @[cache_single_port.scala 159:46]
  wire [127:0] data_mem_2_io_data_write_data; // @[cache_single_port.scala 159:46]
  wire [127:0] data_mem_2_io_data_read_data; // @[cache_single_port.scala 159:46]
  wire [5:0] data_mem_2_io_sram_addr; // @[cache_single_port.scala 159:46]
  wire  data_mem_2_io_sram_wen; // @[cache_single_port.scala 159:46]
  wire [127:0] data_mem_2_io_sram_wmask; // @[cache_single_port.scala 159:46]
  wire [127:0] data_mem_2_io_sram_wdata; // @[cache_single_port.scala 159:46]
  wire [127:0] data_mem_2_io_sram_rdata; // @[cache_single_port.scala 159:46]
  wire [127:0] data_mem_3_io_cache_req_wmask; // @[cache_single_port.scala 159:46]
  wire [5:0] data_mem_3_io_cache_req_index; // @[cache_single_port.scala 159:46]
  wire  data_mem_3_io_cache_req_we; // @[cache_single_port.scala 159:46]
  wire [127:0] data_mem_3_io_data_write_data; // @[cache_single_port.scala 159:46]
  wire [127:0] data_mem_3_io_data_read_data; // @[cache_single_port.scala 159:46]
  wire [5:0] data_mem_3_io_sram_addr; // @[cache_single_port.scala 159:46]
  wire  data_mem_3_io_sram_wen; // @[cache_single_port.scala 159:46]
  wire [127:0] data_mem_3_io_sram_wmask; // @[cache_single_port.scala 159:46]
  wire [127:0] data_mem_3_io_sram_wdata; // @[cache_single_port.scala 159:46]
  wire [127:0] data_mem_3_io_sram_rdata; // @[cache_single_port.scala 159:46]
  reg [4:0] cache_state; // @[cache_single_port.scala 157:34]
  reg  index; // @[Counter.scala 62:40]
  reg  write_data_reg; // @[cache_single_port.scala 288:37]
  wire  _T_40 = ~write_data_reg; // @[cache_single_port.scala 403:30]
  wire  _GEN_168 = ~write_data_reg & io_mem_io_w_ready; // @[cache_single_port.scala 403:46 411:47]
  wire  _GEN_537 = 5'he == cache_state ? 1'h0 : 5'h7 == cache_state & _GEN_168; // @[cache_single_port.scala 290:28]
  wire  _GEN_564 = 5'h8 == cache_state ? io_mem_io_r_valid : _GEN_537; // @[cache_single_port.scala 290:28 682:39]
  wire  _GEN_596 = 5'h9 == cache_state ? 1'h0 : _GEN_564; // @[cache_single_port.scala 290:28]
  wire  _GEN_629 = 5'hd == cache_state ? 1'h0 : _GEN_596; // @[cache_single_port.scala 290:28]
  wire  _GEN_663 = 5'hc == cache_state ? 1'h0 : _GEN_629; // @[cache_single_port.scala 290:28]
  wire  _GEN_734 = 5'h6 == cache_state ? 1'h0 : _GEN_663; // @[cache_single_port.scala 290:28]
  wire  _GEN_806 = 5'h5 == cache_state ? 1'h0 : _GEN_734; // @[cache_single_port.scala 290:28]
  wire  _GEN_887 = 5'h4 == cache_state ? 1'h0 : _GEN_806; // @[cache_single_port.scala 290:28]
  wire  _GEN_960 = 5'h3 == cache_state ? 1'h0 : _GEN_887; // @[cache_single_port.scala 290:28]
  wire  _GEN_1034 = 5'h1 == cache_state ? 1'h0 : _GEN_960; // @[cache_single_port.scala 290:28]
  wire  _GEN_1112 = 5'h13 == cache_state ? 1'h0 : _GEN_1034; // @[cache_single_port.scala 290:28]
  wire  _GEN_1126 = 5'h11 == cache_state ? _GEN_168 : _GEN_1112; // @[cache_single_port.scala 290:28]
  wire  _GEN_1238 = 5'h10 == cache_state ? 1'h0 : _GEN_1126; // @[cache_single_port.scala 290:28]
  wire  _GEN_1322 = 5'hf == cache_state ? 1'h0 : _GEN_1238; // @[cache_single_port.scala 290:28]
  wire  fill_block_en = 5'h0 == cache_state ? 1'h0 : _GEN_1322; // @[cache_single_port.scala 290:28]
  wire  _GEN_0 = fill_block_en ? index + 1'h1 : index; // @[Counter.scala 120:16 78:15 62:40]
  wire  last = fill_block_en & index; // @[Counter.scala 120:{16,23}]
  reg [1:0] replace; // @[cache_single_port.scala 165:30]
  reg [31:0] refill_addr; // @[cache_single_port.scala 166:34]
  reg [31:0] writeback_addr; // @[cache_single_port.scala 167:37]
  reg [31:0] cpu_request_addr_reg_origin; // @[cache_single_port.scala 171:50]
  reg [31:0] cpu_request_addr_reg; // @[cache_single_port.scala 172:43]
  reg [63:0] cpu_request_data; // @[cache_single_port.scala 173:39]
  reg [7:0] cpu_request_mask; // @[cache_single_port.scala 174:39]
  reg  cpu_request_rw; // @[cache_single_port.scala 175:37]
  reg [1:0] cpu_request_accessType; // @[cache_single_port.scala 177:45]
  wire [31:0] align_addr = {io_cpu_request_addr[31:3],3'h0}; // @[Cat.scala 31:58]
  wire [5:0] cpu_request_addr_index = cpu_request_addr_reg[9:4]; // @[cache_single_port.scala 224:58]
  wire [21:0] cpu_request_addr_tag = cpu_request_addr_reg[31:10]; // @[cache_single_port.scala 225:56]
  reg [5:0] flush_loop; // @[Counter.scala 62:40]
  wire  wrap_wrap_1 = flush_loop == 6'h3f; // @[Counter.scala 74:24]
  wire [5:0] _wrap_value_T_3 = flush_loop + 6'h1; // @[Counter.scala 78:24]
  reg [1:0] index_in_line; // @[Counter.scala 62:40]
  wire  _T_27 = 2'h3 == index_in_line; // @[cache_single_port.scala 333:50]
  wire  _GEN_99 = tag_mem_3_io_tag_read_valid; // @[cache_single_port.scala 227:31 326:42 331:42]
  wire  _GEN_678 = 5'h6 == cache_state & (tag_mem_3_io_tag_read_tag == cpu_request_addr_tag &
    tag_mem_3_io_tag_read_valid); // @[cache_single_port.scala 290:28 227:31 535:34]
  wire  _GEN_752 = 5'h5 == cache_state ? 1'h0 : _GEN_678; // @[cache_single_port.scala 290:28 227:31]
  wire  _GEN_833 = 5'h4 == cache_state ? 1'h0 : _GEN_752; // @[cache_single_port.scala 290:28 227:31]
  wire  _GEN_908 = 5'h3 == cache_state ? 1'h0 : _GEN_833; // @[cache_single_port.scala 290:28 227:31]
  wire  _GEN_985 = 5'h1 == cache_state ? 1'h0 : _GEN_908; // @[cache_single_port.scala 290:28 227:31]
  wire  _GEN_1063 = 5'h13 == cache_state ? 1'h0 : _GEN_985; // @[cache_single_port.scala 290:28 227:31]
  wire  _GEN_1153 = 5'h11 == cache_state ? 1'h0 : _GEN_1063; // @[cache_single_port.scala 290:28 227:31]
  wire  _GEN_1200 = 5'h10 == cache_state ? _GEN_99 : _GEN_1153; // @[cache_single_port.scala 290:28]
  wire  _GEN_1286 = 5'hf == cache_state ? 1'h0 : _GEN_1200; // @[cache_single_port.scala 290:28 227:31]
  wire  is_match_3 = 5'h0 == cache_state ? 1'h0 : _GEN_1286; // @[cache_single_port.scala 290:28 227:31]
  wire  _T_23 = 2'h2 == index_in_line; // @[cache_single_port.scala 333:50]
  wire  _GEN_98 = tag_mem_2_io_tag_read_valid; // @[cache_single_port.scala 227:31 326:42 331:42]
  wire  _GEN_677 = 5'h6 == cache_state & (tag_mem_2_io_tag_read_tag == cpu_request_addr_tag &
    tag_mem_2_io_tag_read_valid); // @[cache_single_port.scala 290:28 227:31 535:34]
  wire  _GEN_751 = 5'h5 == cache_state ? 1'h0 : _GEN_677; // @[cache_single_port.scala 290:28 227:31]
  wire  _GEN_832 = 5'h4 == cache_state ? 1'h0 : _GEN_751; // @[cache_single_port.scala 290:28 227:31]
  wire  _GEN_907 = 5'h3 == cache_state ? 1'h0 : _GEN_832; // @[cache_single_port.scala 290:28 227:31]
  wire  _GEN_984 = 5'h1 == cache_state ? 1'h0 : _GEN_907; // @[cache_single_port.scala 290:28 227:31]
  wire  _GEN_1062 = 5'h13 == cache_state ? 1'h0 : _GEN_984; // @[cache_single_port.scala 290:28 227:31]
  wire  _GEN_1152 = 5'h11 == cache_state ? 1'h0 : _GEN_1062; // @[cache_single_port.scala 290:28 227:31]
  wire  _GEN_1199 = 5'h10 == cache_state ? _GEN_98 : _GEN_1152; // @[cache_single_port.scala 290:28]
  wire  _GEN_1285 = 5'hf == cache_state ? 1'h0 : _GEN_1199; // @[cache_single_port.scala 290:28 227:31]
  wire  is_match_2 = 5'h0 == cache_state ? 1'h0 : _GEN_1285; // @[cache_single_port.scala 290:28 227:31]
  wire  _T_19 = 2'h1 == index_in_line; // @[cache_single_port.scala 333:50]
  wire  _GEN_97 = tag_mem_1_io_tag_read_valid; // @[cache_single_port.scala 227:31 326:42 331:42]
  wire  _GEN_676 = 5'h6 == cache_state & (tag_mem_1_io_tag_read_tag == cpu_request_addr_tag &
    tag_mem_1_io_tag_read_valid); // @[cache_single_port.scala 290:28 227:31 535:34]
  wire  _GEN_750 = 5'h5 == cache_state ? 1'h0 : _GEN_676; // @[cache_single_port.scala 290:28 227:31]
  wire  _GEN_831 = 5'h4 == cache_state ? 1'h0 : _GEN_750; // @[cache_single_port.scala 290:28 227:31]
  wire  _GEN_906 = 5'h3 == cache_state ? 1'h0 : _GEN_831; // @[cache_single_port.scala 290:28 227:31]
  wire  _GEN_983 = 5'h1 == cache_state ? 1'h0 : _GEN_906; // @[cache_single_port.scala 290:28 227:31]
  wire  _GEN_1061 = 5'h13 == cache_state ? 1'h0 : _GEN_983; // @[cache_single_port.scala 290:28 227:31]
  wire  _GEN_1151 = 5'h11 == cache_state ? 1'h0 : _GEN_1061; // @[cache_single_port.scala 290:28 227:31]
  wire  _GEN_1198 = 5'h10 == cache_state ? _GEN_97 : _GEN_1151; // @[cache_single_port.scala 290:28]
  wire  _GEN_1284 = 5'hf == cache_state ? 1'h0 : _GEN_1198; // @[cache_single_port.scala 290:28 227:31]
  wire  is_match_1 = 5'h0 == cache_state ? 1'h0 : _GEN_1284; // @[cache_single_port.scala 290:28 227:31]
  wire  _T_15 = 2'h0 == index_in_line; // @[cache_single_port.scala 333:50]
  wire  _GEN_96 = tag_mem_0_io_tag_read_valid; // @[cache_single_port.scala 227:31 326:42 331:42]
  wire  _GEN_675 = 5'h6 == cache_state & (tag_mem_0_io_tag_read_tag == cpu_request_addr_tag &
    tag_mem_0_io_tag_read_valid); // @[cache_single_port.scala 290:28 227:31 535:34]
  wire  _GEN_749 = 5'h5 == cache_state ? 1'h0 : _GEN_675; // @[cache_single_port.scala 290:28 227:31]
  wire  _GEN_830 = 5'h4 == cache_state ? 1'h0 : _GEN_749; // @[cache_single_port.scala 290:28 227:31]
  wire  _GEN_905 = 5'h3 == cache_state ? 1'h0 : _GEN_830; // @[cache_single_port.scala 290:28 227:31]
  wire  _GEN_982 = 5'h1 == cache_state ? 1'h0 : _GEN_905; // @[cache_single_port.scala 290:28 227:31]
  wire  _GEN_1060 = 5'h13 == cache_state ? 1'h0 : _GEN_982; // @[cache_single_port.scala 290:28 227:31]
  wire  _GEN_1150 = 5'h11 == cache_state ? 1'h0 : _GEN_1060; // @[cache_single_port.scala 290:28 227:31]
  wire  _GEN_1197 = 5'h10 == cache_state ? _GEN_96 : _GEN_1150; // @[cache_single_port.scala 290:28]
  wire  _GEN_1283 = 5'hf == cache_state ? 1'h0 : _GEN_1197; // @[cache_single_port.scala 290:28 227:31]
  wire  is_match_0 = 5'h0 == cache_state ? 1'h0 : _GEN_1283; // @[cache_single_port.scala 290:28 227:31]
  wire  _T_17 = ~(index_in_line == 2'h3); // @[cache_single_port.scala 337:60]
  wire  _GEN_15 = wrap_wrap_1 ? 1'h0 : 1'h1; // @[cache_single_port.scala 283:27 342:91 345:83]
  wire  _GEN_20 = ~(index_in_line == 2'h3) ? 1'h0 : _GEN_15; // @[cache_single_port.scala 283:27 337:95]
  wire  _GEN_26 = is_match_0 ? 1'h0 : _GEN_20; // @[cache_single_port.scala 283:27 334:66]
  wire  _GEN_32 = 2'h0 == index_in_line & _GEN_26; // @[cache_single_port.scala 283:27 333:68]
  wire  _GEN_35 = wrap_wrap_1 ? _GEN_32 : 1'h1; // @[cache_single_port.scala 342:91 345:83]
  wire  _GEN_40 = ~(index_in_line == 2'h3) ? _GEN_32 : _GEN_35; // @[cache_single_port.scala 337:95]
  wire  _GEN_46 = is_match_1 ? _GEN_32 : _GEN_40; // @[cache_single_port.scala 334:66]
  wire  _GEN_52 = 2'h1 == index_in_line ? _GEN_46 : _GEN_32; // @[cache_single_port.scala 333:68]
  wire  _GEN_55 = wrap_wrap_1 ? _GEN_52 : 1'h1; // @[cache_single_port.scala 342:91 345:83]
  wire  _GEN_60 = ~(index_in_line == 2'h3) ? _GEN_52 : _GEN_55; // @[cache_single_port.scala 337:95]
  wire  _GEN_66 = is_match_2 ? _GEN_52 : _GEN_60; // @[cache_single_port.scala 334:66]
  wire  _GEN_72 = 2'h2 == index_in_line ? _GEN_66 : _GEN_52; // @[cache_single_port.scala 333:68]
  wire  _GEN_75 = wrap_wrap_1 ? _GEN_72 : 1'h1; // @[cache_single_port.scala 342:91 345:83]
  wire  _GEN_80 = ~(index_in_line == 2'h3) ? _GEN_72 : _GEN_75; // @[cache_single_port.scala 337:95]
  wire  _GEN_86 = is_match_3 ? _GEN_72 : _GEN_80; // @[cache_single_port.scala 334:66]
  wire  _GEN_92 = 2'h3 == index_in_line ? _GEN_86 : _GEN_72; // @[cache_single_port.scala 333:68]
  wire  _T_62 = index_in_line != 2'h3; // @[cache_single_port.scala 441:52]
  wire  _GEN_186 = index_in_line != 2'h3 ? 1'h0 : _GEN_15; // @[cache_single_port.scala 283:27 441:70]
  wire  _GEN_191 = io_mem_io_b_valid & _GEN_186; // @[cache_single_port.scala 283:27 440:48]
  wire  _GEN_1139 = 5'h11 == cache_state ? 1'h0 : 5'h13 == cache_state & _GEN_191; // @[cache_single_port.scala 283:27 290:28]
  wire  _GEN_1205 = 5'h10 == cache_state ? _GEN_92 : _GEN_1139; // @[cache_single_port.scala 290:28]
  wire  _GEN_1289 = 5'hf == cache_state ? 1'h0 : _GEN_1205; // @[cache_single_port.scala 283:27 290:28]
  wire  flush_loop_enable = 5'h0 == cache_state ? 1'h0 : _GEN_1289; // @[cache_single_port.scala 283:27 290:28]
  wire [5:0] _GEN_2 = flush_loop_enable ? _wrap_value_T_3 : flush_loop; // @[Counter.scala 120:16 78:15 62:40]
  wire [1:0] _wrap_value_T_5 = index_in_line + 2'h1; // @[Counter.scala 78:24]
  wire  _GEN_24 = is_match_0 ? 1'h0 : _T_17; // @[cache_single_port.scala 284:30 334:66]
  wire  _GEN_30 = 2'h0 == index_in_line & _GEN_24; // @[cache_single_port.scala 284:30 333:68]
  wire  _GEN_38 = ~(index_in_line == 2'h3) | _GEN_30; // @[cache_single_port.scala 337:95 339:78]
  wire  _GEN_44 = is_match_1 ? _GEN_30 : _GEN_38; // @[cache_single_port.scala 334:66]
  wire  _GEN_50 = 2'h1 == index_in_line ? _GEN_44 : _GEN_30; // @[cache_single_port.scala 333:68]
  wire  _GEN_58 = ~(index_in_line == 2'h3) | _GEN_50; // @[cache_single_port.scala 337:95 339:78]
  wire  _GEN_64 = is_match_2 ? _GEN_50 : _GEN_58; // @[cache_single_port.scala 334:66]
  wire  _GEN_70 = 2'h2 == index_in_line ? _GEN_64 : _GEN_50; // @[cache_single_port.scala 333:68]
  wire  _GEN_78 = ~(index_in_line == 2'h3) | _GEN_70; // @[cache_single_port.scala 337:95 339:78]
  wire  _GEN_84 = is_match_3 ? _GEN_70 : _GEN_78; // @[cache_single_port.scala 334:66]
  wire  _GEN_90 = 2'h3 == index_in_line ? _GEN_84 : _GEN_70; // @[cache_single_port.scala 333:68]
  wire  _GEN_188 = io_mem_io_b_valid & _T_62; // @[cache_single_port.scala 284:30 440:48]
  wire  _GEN_1136 = 5'h11 == cache_state ? 1'h0 : 5'h13 == cache_state & _GEN_188; // @[cache_single_port.scala 290:28 284:30]
  wire  _GEN_1203 = 5'h10 == cache_state ? _GEN_90 : _GEN_1136; // @[cache_single_port.scala 290:28]
  wire  _GEN_1288 = 5'hf == cache_state ? 1'h0 : _GEN_1203; // @[cache_single_port.scala 290:28 284:30]
  wire  index_in_line_enable = 5'h0 == cache_state ? 1'h0 : _GEN_1288; // @[cache_single_port.scala 290:28 284:30]
  wire [1:0] _GEN_4 = index_in_line_enable ? _wrap_value_T_5 : index_in_line; // @[Counter.scala 120:16 78:15 62:40]
  reg  flush_over; // @[cache_single_port.scala 280:33]
  reg [63:0] tmp_response_data; // @[cache_single_port.scala 285:40]
  reg  write_addr_reg; // @[cache_single_port.scala 287:37]
  wire  _T_4 = align_addr >= 32'h80000000; // @[cache_single_port.scala 295:52]
  wire  _T_5 = io_cpu_request_valid & _T_4; // @[cache_single_port.scala 294:57]
  wire  _T_6 = align_addr <= 32'h88000000; // @[cache_single_port.scala 296:52]
  wire  _T_7 = _T_5 & _T_6; // @[cache_single_port.scala 295:69]
  wire [2:0] _GEN_6 = io_cpu_request_rw ? 3'h4 : 3'h1; // @[cache_single_port.scala 300:56 301:52 303:52]
  wire [2:0] _GEN_7 = io_cpu_request_valid ? _GEN_6 : 3'h0; // @[cache_single_port.scala 299:57 306:44]
  wire [2:0] _GEN_8 = _T_7 ? 3'h6 : _GEN_7; // @[cache_single_port.scala 296:69 298:44]
  wire [3:0] _GEN_9 = io_flush & io_cpu_request_valid ? 4'hf : {{1'd0}, _GEN_8}; // @[cache_single_port.scala 292:63 293:44]
  wire [31:0] _writeback_addr_T = {tag_mem_0_io_tag_read_tag,flush_loop,4'h0}; // @[Cat.scala 31:58]
  wire  _GEN_14 = wrap_wrap_1 | flush_over; // @[cache_single_port.scala 280:33 342:91 343:76]
  wire [1:0] _GEN_16 = wrap_wrap_1 ? _GEN_4 : 2'h0; // @[cache_single_port.scala 342:91 346:79]
  wire [4:0] _GEN_17 = ~(index_in_line == 2'h3) ? 5'h10 : 5'hf; // @[cache_single_port.scala 337:95 338:68 341:68]
  wire  _GEN_19 = ~(index_in_line == 2'h3) ? flush_over : _GEN_14; // @[cache_single_port.scala 280:33 337:95]
  wire [1:0] _GEN_21 = ~(index_in_line == 2'h3) ? _GEN_4 : _GEN_16; // @[cache_single_port.scala 337:95]
  wire [4:0] _GEN_22 = is_match_0 ? 5'h11 : _GEN_17; // @[cache_single_port.scala 334:66 335:68]
  wire [31:0] _GEN_23 = is_match_0 ? _writeback_addr_T : writeback_addr; // @[cache_single_port.scala 167:37 334:66 336:72]
  wire  _GEN_25 = is_match_0 ? flush_over : _GEN_19; // @[cache_single_port.scala 280:33 334:66]
  wire [1:0] _GEN_27 = is_match_0 ? _GEN_4 : _GEN_21; // @[cache_single_port.scala 334:66]
  wire [4:0] _GEN_28 = 2'h0 == index_in_line ? _GEN_22 : 5'h0; // @[cache_single_port.scala 333:68]
  wire [31:0] _GEN_29 = 2'h0 == index_in_line ? _GEN_23 : writeback_addr; // @[cache_single_port.scala 167:37 333:68]
  wire  _GEN_31 = 2'h0 == index_in_line ? _GEN_25 : flush_over; // @[cache_single_port.scala 280:33 333:68]
  wire [1:0] _GEN_33 = 2'h0 == index_in_line ? _GEN_27 : _GEN_4; // @[cache_single_port.scala 333:68]
  wire [31:0] _writeback_addr_T_1 = {tag_mem_1_io_tag_read_tag,flush_loop,4'h0}; // @[Cat.scala 31:58]
  wire  _GEN_34 = wrap_wrap_1 | _GEN_31; // @[cache_single_port.scala 342:91 343:76]
  wire [1:0] _GEN_36 = wrap_wrap_1 ? _GEN_33 : 2'h0; // @[cache_single_port.scala 342:91 346:79]
  wire  _GEN_39 = ~(index_in_line == 2'h3) ? _GEN_31 : _GEN_34; // @[cache_single_port.scala 337:95]
  wire [1:0] _GEN_41 = ~(index_in_line == 2'h3) ? _GEN_33 : _GEN_36; // @[cache_single_port.scala 337:95]
  wire [4:0] _GEN_42 = is_match_1 ? 5'h11 : _GEN_17; // @[cache_single_port.scala 334:66 335:68]
  wire [31:0] _GEN_43 = is_match_1 ? _writeback_addr_T_1 : _GEN_29; // @[cache_single_port.scala 334:66 336:72]
  wire  _GEN_45 = is_match_1 ? _GEN_31 : _GEN_39; // @[cache_single_port.scala 334:66]
  wire [1:0] _GEN_47 = is_match_1 ? _GEN_33 : _GEN_41; // @[cache_single_port.scala 334:66]
  wire [4:0] _GEN_48 = 2'h1 == index_in_line ? _GEN_42 : _GEN_28; // @[cache_single_port.scala 333:68]
  wire [31:0] _GEN_49 = 2'h1 == index_in_line ? _GEN_43 : _GEN_29; // @[cache_single_port.scala 333:68]
  wire  _GEN_51 = 2'h1 == index_in_line ? _GEN_45 : _GEN_31; // @[cache_single_port.scala 333:68]
  wire [1:0] _GEN_53 = 2'h1 == index_in_line ? _GEN_47 : _GEN_33; // @[cache_single_port.scala 333:68]
  wire [31:0] _writeback_addr_T_2 = {tag_mem_2_io_tag_read_tag,flush_loop,4'h0}; // @[Cat.scala 31:58]
  wire  _GEN_54 = wrap_wrap_1 | _GEN_51; // @[cache_single_port.scala 342:91 343:76]
  wire [1:0] _GEN_56 = wrap_wrap_1 ? _GEN_53 : 2'h0; // @[cache_single_port.scala 342:91 346:79]
  wire  _GEN_59 = ~(index_in_line == 2'h3) ? _GEN_51 : _GEN_54; // @[cache_single_port.scala 337:95]
  wire [1:0] _GEN_61 = ~(index_in_line == 2'h3) ? _GEN_53 : _GEN_56; // @[cache_single_port.scala 337:95]
  wire [4:0] _GEN_62 = is_match_2 ? 5'h11 : _GEN_17; // @[cache_single_port.scala 334:66 335:68]
  wire [31:0] _GEN_63 = is_match_2 ? _writeback_addr_T_2 : _GEN_49; // @[cache_single_port.scala 334:66 336:72]
  wire  _GEN_65 = is_match_2 ? _GEN_51 : _GEN_59; // @[cache_single_port.scala 334:66]
  wire [1:0] _GEN_67 = is_match_2 ? _GEN_53 : _GEN_61; // @[cache_single_port.scala 334:66]
  wire [4:0] _GEN_68 = 2'h2 == index_in_line ? _GEN_62 : _GEN_48; // @[cache_single_port.scala 333:68]
  wire [31:0] _GEN_69 = 2'h2 == index_in_line ? _GEN_63 : _GEN_49; // @[cache_single_port.scala 333:68]
  wire  _GEN_71 = 2'h2 == index_in_line ? _GEN_65 : _GEN_51; // @[cache_single_port.scala 333:68]
  wire [1:0] _GEN_73 = 2'h2 == index_in_line ? _GEN_67 : _GEN_53; // @[cache_single_port.scala 333:68]
  wire [31:0] _writeback_addr_T_3 = {tag_mem_3_io_tag_read_tag,flush_loop,4'h0}; // @[Cat.scala 31:58]
  wire  _GEN_74 = wrap_wrap_1 | _GEN_71; // @[cache_single_port.scala 342:91 343:76]
  wire [1:0] _GEN_76 = wrap_wrap_1 ? _GEN_73 : 2'h0; // @[cache_single_port.scala 342:91 346:79]
  wire  _GEN_79 = ~(index_in_line == 2'h3) ? _GEN_71 : _GEN_74; // @[cache_single_port.scala 337:95]
  wire [1:0] _GEN_81 = ~(index_in_line == 2'h3) ? _GEN_73 : _GEN_76; // @[cache_single_port.scala 337:95]
  wire [4:0] _GEN_82 = is_match_3 ? 5'h11 : _GEN_17; // @[cache_single_port.scala 334:66 335:68]
  wire [31:0] _GEN_83 = is_match_3 ? _writeback_addr_T_3 : _GEN_69; // @[cache_single_port.scala 334:66 336:72]
  wire  _GEN_85 = is_match_3 ? _GEN_71 : _GEN_79; // @[cache_single_port.scala 334:66]
  wire [1:0] _GEN_87 = is_match_3 ? _GEN_73 : _GEN_81; // @[cache_single_port.scala 334:66]
  wire [4:0] _GEN_88 = 2'h3 == index_in_line ? _GEN_82 : _GEN_68; // @[cache_single_port.scala 333:68]
  wire [31:0] _GEN_89 = 2'h3 == index_in_line ? _GEN_83 : _GEN_69; // @[cache_single_port.scala 333:68]
  wire  _GEN_91 = 2'h3 == index_in_line ? _GEN_85 : _GEN_71; // @[cache_single_port.scala 333:68]
  wire [1:0] _GEN_93 = 2'h3 == index_in_line ? _GEN_87 : _GEN_73; // @[cache_single_port.scala 333:68]
  wire [21:0] _GEN_107 = tag_mem_0_io_tag_read_tag; // @[cache_single_port.scala 237:41 326:42 358:69]
  wire [7:0] _GEN_108 = tag_mem_0_io_tag_read_visit; // @[cache_single_port.scala 237:41 326:42 359:71]
  wire  _GEN_109 = tag_mem_0_io_tag_read_dirty; // @[cache_single_port.scala 237:41 326:42 360:71]
  wire [21:0] _GEN_110 = tag_mem_1_io_tag_read_tag; // @[cache_single_port.scala 237:41 326:42 358:69]
  wire [7:0] _GEN_111 = tag_mem_1_io_tag_read_visit; // @[cache_single_port.scala 237:41 326:42 359:71]
  wire  _GEN_112 = tag_mem_1_io_tag_read_dirty; // @[cache_single_port.scala 237:41 326:42 360:71]
  wire [21:0] _GEN_113 = tag_mem_2_io_tag_read_tag; // @[cache_single_port.scala 237:41 326:42 358:69]
  wire [7:0] _GEN_114 = tag_mem_2_io_tag_read_visit; // @[cache_single_port.scala 237:41 326:42 359:71]
  wire  _GEN_115 = tag_mem_2_io_tag_read_dirty; // @[cache_single_port.scala 237:41 326:42 360:71]
  wire [21:0] _GEN_116 = tag_mem_3_io_tag_read_tag; // @[cache_single_port.scala 237:41 326:42 358:69]
  wire [7:0] _GEN_117 = tag_mem_3_io_tag_read_visit; // @[cache_single_port.scala 237:41 326:42 359:71]
  wire  _GEN_118 = tag_mem_3_io_tag_read_dirty; // @[cache_single_port.scala 237:41 326:42 360:71]
  wire  _T_35 = ~write_addr_reg; // @[cache_single_port.scala 390:30]
  wire [5:0] _GEN_119 = _T_15 ? flush_loop : io_cpu_request_addr[9:4]; // @[cache_single_port.scala 234:48 392:68 393:80]
  wire [5:0] _GEN_121 = _T_19 ? flush_loop : io_cpu_request_addr[9:4]; // @[cache_single_port.scala 234:48 392:68 393:80]
  wire [5:0] _GEN_123 = _T_23 ? flush_loop : io_cpu_request_addr[9:4]; // @[cache_single_port.scala 234:48 392:68 393:80]
  wire [5:0] _GEN_125 = _T_27 ? flush_loop : io_cpu_request_addr[9:4]; // @[cache_single_port.scala 234:48 392:68 393:80]
  wire [5:0] _GEN_127 = ~write_addr_reg ? _GEN_119 : io_cpu_request_addr[9:4]; // @[cache_single_port.scala 390:46 234:48]
  wire [5:0] _GEN_129 = ~write_addr_reg ? _GEN_121 : io_cpu_request_addr[9:4]; // @[cache_single_port.scala 390:46 234:48]
  wire [5:0] _GEN_131 = ~write_addr_reg ? _GEN_123 : io_cpu_request_addr[9:4]; // @[cache_single_port.scala 390:46 234:48]
  wire [5:0] _GEN_133 = ~write_addr_reg ? _GEN_125 : io_cpu_request_addr[9:4]; // @[cache_single_port.scala 390:46 234:48]
  wire [31:0] _GEN_137 = ~write_addr_reg ? writeback_addr : cpu_request_addr_reg; // @[cache_single_port.scala 248:32 390:46 400:56]
  wire [5:0] _GEN_138 = _T_15 ? flush_loop : _GEN_127; // @[cache_single_port.scala 405:68 406:80]
  wire [5:0] _GEN_140 = _T_19 ? flush_loop : _GEN_129; // @[cache_single_port.scala 405:68 406:80]
  wire [5:0] _GEN_142 = _T_23 ? flush_loop : _GEN_131; // @[cache_single_port.scala 405:68 406:80]
  wire [5:0] _GEN_144 = _T_27 ? flush_loop : _GEN_133; // @[cache_single_port.scala 405:68 406:80]
  wire [63:0] _GEN_148 = _T_15 ? data_mem_0_io_data_read_data[63:0] : 64'h0; // @[cache_single_port.scala 230:33 415:68 416:60]
  wire [63:0] _GEN_151 = _T_19 ? data_mem_1_io_data_read_data[63:0] : _GEN_148; // @[cache_single_port.scala 415:68 416:60]
  wire [63:0] _GEN_154 = _T_23 ? data_mem_2_io_data_read_data[63:0] : _GEN_151; // @[cache_single_port.scala 415:68 416:60]
  wire [63:0] _GEN_157 = _T_27 ? data_mem_3_io_data_read_data[63:0] : _GEN_154; // @[cache_single_port.scala 415:68 416:60]
  wire [63:0] _GEN_171 = ~write_data_reg ? _GEN_157 : 64'h0; // @[cache_single_port.scala 230:33 403:46]
  wire [63:0] _GEN_284 = ~cpu_request_addr_reg[3] ? cpu_request_data : 64'h0; // @[cache_single_port.scala 584:{131,131} 583:68]
  wire [63:0] _GEN_256 = is_match_0 ? _GEN_284 : 64'h0; // @[cache_single_port.scala 230:33 573:66]
  wire [63:0] _GEN_267 = is_match_1 ? _GEN_284 : _GEN_256; // @[cache_single_port.scala 573:66]
  wire [63:0] _GEN_278 = is_match_2 ? _GEN_284 : _GEN_267; // @[cache_single_port.scala 573:66]
  wire [63:0] _GEN_289 = is_match_3 ? _GEN_284 : _GEN_278; // @[cache_single_port.scala 573:66]
  wire [63:0] _GEN_296 = cpu_request_rw ? _GEN_289 : 64'h0; // @[cache_single_port.scala 230:33 570:53]
  wire [63:0] _GEN_400 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_296 : 64'h0; // @[cache_single_port.scala 230:33 537:51]
  wire  _T_144 = 2'h3 == replace; // @[cache_single_port.scala 668:50]
  wire [63:0] _GEN_460 = ~index ? io_mem_io_r_bits_data : 64'h0; // @[cache_single_port.scala 670:60 672:{67,67}]
  wire  _T_143 = 2'h2 == replace; // @[cache_single_port.scala 668:50]
  wire  _T_142 = 2'h1 == replace; // @[cache_single_port.scala 668:50]
  wire  _T_141 = 2'h0 == replace; // @[cache_single_port.scala 668:50]
  wire [63:0] _GEN_431 = 2'h0 == replace ? _GEN_460 : 64'h0; // @[cache_single_port.scala 230:33 668:62]
  wire [63:0] _GEN_442 = 2'h1 == replace ? _GEN_460 : _GEN_431; // @[cache_single_port.scala 668:62]
  wire [63:0] _GEN_453 = 2'h2 == replace ? _GEN_460 : _GEN_442; // @[cache_single_port.scala 668:62]
  wire [63:0] _GEN_464 = 2'h3 == replace ? _GEN_460 : _GEN_453; // @[cache_single_port.scala 668:62]
  wire [63:0] _GEN_471 = io_mem_io_r_valid ? _GEN_464 : 64'h0; // @[cache_single_port.scala 230:33 666:48]
  wire [63:0] _GEN_492 = _T_141 ? data_mem_0_io_data_read_data[63:0] : 64'h0; // @[cache_single_port.scala 230:33 722:62 723:60]
  wire [63:0] _GEN_495 = _T_142 ? data_mem_1_io_data_read_data[63:0] : _GEN_492; // @[cache_single_port.scala 722:62 723:60]
  wire [63:0] _GEN_498 = _T_143 ? data_mem_2_io_data_read_data[63:0] : _GEN_495; // @[cache_single_port.scala 722:62 723:60]
  wire [63:0] _GEN_501 = _T_144 ? data_mem_3_io_data_read_data[63:0] : _GEN_498; // @[cache_single_port.scala 722:62 723:60]
  wire [63:0] _GEN_507 = _T_40 ? _GEN_501 : 64'h0; // @[cache_single_port.scala 230:33 717:46]
  wire [63:0] _GEN_526 = 5'h7 == cache_state ? _GEN_507 : 64'h0; // @[cache_single_port.scala 290:28 230:33]
  wire [63:0] _GEN_540 = 5'he == cache_state ? 64'h0 : _GEN_526; // @[cache_single_port.scala 290:28 230:33]
  wire [63:0] _GEN_548 = 5'h8 == cache_state ? _GEN_471 : _GEN_540; // @[cache_single_port.scala 290:28]
  wire [63:0] _GEN_580 = 5'h9 == cache_state ? 64'h0 : _GEN_548; // @[cache_single_port.scala 290:28 230:33]
  wire [63:0] _GEN_613 = 5'hd == cache_state ? 64'h0 : _GEN_580; // @[cache_single_port.scala 290:28 230:33]
  wire [63:0] _GEN_647 = 5'hc == cache_state ? 64'h0 : _GEN_613; // @[cache_single_port.scala 290:28 230:33]
  wire [63:0] _GEN_702 = 5'h6 == cache_state ? _GEN_400 : _GEN_647; // @[cache_single_port.scala 290:28]
  wire [63:0] _GEN_775 = 5'h5 == cache_state ? 64'h0 : _GEN_702; // @[cache_single_port.scala 290:28 230:33]
  wire [63:0] _GEN_856 = 5'h4 == cache_state ? 64'h0 : _GEN_775; // @[cache_single_port.scala 290:28 230:33]
  wire [63:0] _GEN_931 = 5'h3 == cache_state ? 64'h0 : _GEN_856; // @[cache_single_port.scala 290:28 230:33]
  wire [63:0] _GEN_1008 = 5'h1 == cache_state ? 64'h0 : _GEN_931; // @[cache_single_port.scala 290:28 230:33]
  wire [63:0] _GEN_1086 = 5'h13 == cache_state ? 64'h0 : _GEN_1008; // @[cache_single_port.scala 290:28 230:33]
  wire [63:0] _GEN_1129 = 5'h11 == cache_state ? _GEN_171 : _GEN_1086; // @[cache_single_port.scala 290:28]
  wire [63:0] _GEN_1241 = 5'h10 == cache_state ? 64'h0 : _GEN_1129; // @[cache_single_port.scala 290:28 230:33]
  wire [63:0] _GEN_1325 = 5'hf == cache_state ? 64'h0 : _GEN_1241; // @[cache_single_port.scala 290:28 230:33]
  wire [63:0] cache_data_0 = 5'h0 == cache_state ? 64'h0 : _GEN_1325; // @[cache_single_port.scala 290:28 230:33]
  wire [63:0] _GEN_149 = _T_15 ? data_mem_0_io_data_read_data[127:64] : 64'h0; // @[cache_single_port.scala 230:33 415:68 416:60]
  wire [63:0] _GEN_152 = _T_19 ? data_mem_1_io_data_read_data[127:64] : _GEN_149; // @[cache_single_port.scala 415:68 416:60]
  wire [63:0] _GEN_155 = _T_23 ? data_mem_2_io_data_read_data[127:64] : _GEN_152; // @[cache_single_port.scala 415:68 416:60]
  wire [63:0] _GEN_158 = _T_27 ? data_mem_3_io_data_read_data[127:64] : _GEN_155; // @[cache_single_port.scala 415:68 416:60]
  wire [63:0] _GEN_172 = ~write_data_reg ? _GEN_158 : 64'h0; // @[cache_single_port.scala 230:33 403:46]
  wire [63:0] _GEN_285 = cpu_request_addr_reg[3] ? cpu_request_data : 64'h0; // @[cache_single_port.scala 584:{131,131} 583:68]
  wire [63:0] _GEN_257 = is_match_0 ? _GEN_285 : 64'h0; // @[cache_single_port.scala 230:33 573:66]
  wire [63:0] _GEN_268 = is_match_1 ? _GEN_285 : _GEN_257; // @[cache_single_port.scala 573:66]
  wire [63:0] _GEN_279 = is_match_2 ? _GEN_285 : _GEN_268; // @[cache_single_port.scala 573:66]
  wire [63:0] _GEN_290 = is_match_3 ? _GEN_285 : _GEN_279; // @[cache_single_port.scala 573:66]
  wire [63:0] _GEN_297 = cpu_request_rw ? _GEN_290 : 64'h0; // @[cache_single_port.scala 230:33 570:53]
  wire [63:0] _GEN_401 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_297 : 64'h0; // @[cache_single_port.scala 230:33 537:51]
  wire [63:0] _GEN_461 = index ? io_mem_io_r_bits_data : 64'h0; // @[cache_single_port.scala 670:60 672:{67,67}]
  wire [63:0] _GEN_432 = 2'h0 == replace ? _GEN_461 : 64'h0; // @[cache_single_port.scala 230:33 668:62]
  wire [63:0] _GEN_443 = 2'h1 == replace ? _GEN_461 : _GEN_432; // @[cache_single_port.scala 668:62]
  wire [63:0] _GEN_454 = 2'h2 == replace ? _GEN_461 : _GEN_443; // @[cache_single_port.scala 668:62]
  wire [63:0] _GEN_465 = 2'h3 == replace ? _GEN_461 : _GEN_454; // @[cache_single_port.scala 668:62]
  wire [63:0] _GEN_472 = io_mem_io_r_valid ? _GEN_465 : 64'h0; // @[cache_single_port.scala 230:33 666:48]
  wire [63:0] _GEN_493 = _T_141 ? data_mem_0_io_data_read_data[127:64] : 64'h0; // @[cache_single_port.scala 230:33 722:62 723:60]
  wire [63:0] _GEN_496 = _T_142 ? data_mem_1_io_data_read_data[127:64] : _GEN_493; // @[cache_single_port.scala 722:62 723:60]
  wire [63:0] _GEN_499 = _T_143 ? data_mem_2_io_data_read_data[127:64] : _GEN_496; // @[cache_single_port.scala 722:62 723:60]
  wire [63:0] _GEN_502 = _T_144 ? data_mem_3_io_data_read_data[127:64] : _GEN_499; // @[cache_single_port.scala 722:62 723:60]
  wire [63:0] _GEN_508 = _T_40 ? _GEN_502 : 64'h0; // @[cache_single_port.scala 230:33 717:46]
  wire [63:0] _GEN_527 = 5'h7 == cache_state ? _GEN_508 : 64'h0; // @[cache_single_port.scala 290:28 230:33]
  wire [63:0] _GEN_541 = 5'he == cache_state ? 64'h0 : _GEN_527; // @[cache_single_port.scala 290:28 230:33]
  wire [63:0] _GEN_549 = 5'h8 == cache_state ? _GEN_472 : _GEN_541; // @[cache_single_port.scala 290:28]
  wire [63:0] _GEN_581 = 5'h9 == cache_state ? 64'h0 : _GEN_549; // @[cache_single_port.scala 290:28 230:33]
  wire [63:0] _GEN_614 = 5'hd == cache_state ? 64'h0 : _GEN_581; // @[cache_single_port.scala 290:28 230:33]
  wire [63:0] _GEN_648 = 5'hc == cache_state ? 64'h0 : _GEN_614; // @[cache_single_port.scala 290:28 230:33]
  wire [63:0] _GEN_703 = 5'h6 == cache_state ? _GEN_401 : _GEN_648; // @[cache_single_port.scala 290:28]
  wire [63:0] _GEN_776 = 5'h5 == cache_state ? 64'h0 : _GEN_703; // @[cache_single_port.scala 290:28 230:33]
  wire [63:0] _GEN_857 = 5'h4 == cache_state ? 64'h0 : _GEN_776; // @[cache_single_port.scala 290:28 230:33]
  wire [63:0] _GEN_932 = 5'h3 == cache_state ? 64'h0 : _GEN_857; // @[cache_single_port.scala 290:28 230:33]
  wire [63:0] _GEN_1009 = 5'h1 == cache_state ? 64'h0 : _GEN_932; // @[cache_single_port.scala 290:28 230:33]
  wire [63:0] _GEN_1087 = 5'h13 == cache_state ? 64'h0 : _GEN_1009; // @[cache_single_port.scala 290:28 230:33]
  wire [63:0] _GEN_1130 = 5'h11 == cache_state ? _GEN_172 : _GEN_1087; // @[cache_single_port.scala 290:28]
  wire [63:0] _GEN_1242 = 5'h10 == cache_state ? 64'h0 : _GEN_1130; // @[cache_single_port.scala 290:28 230:33]
  wire [63:0] _GEN_1326 = 5'hf == cache_state ? 64'h0 : _GEN_1242; // @[cache_single_port.scala 290:28 230:33]
  wire [63:0] cache_data_1 = 5'h0 == cache_state ? 64'h0 : _GEN_1326; // @[cache_single_port.scala 290:28 230:33]
  wire [63:0] _GEN_147 = index ? cache_data_1 : cache_data_0; // @[cache_single_port.scala 417:{71,71}]
  wire [63:0] _GEN_150 = _T_15 ? _GEN_147 : 64'h0; // @[cache_single_port.scala 263:31 415:68 417:71]
  wire [63:0] _GEN_153 = _T_19 ? _GEN_147 : _GEN_150; // @[cache_single_port.scala 415:68 417:71]
  wire [63:0] _GEN_156 = _T_23 ? _GEN_147 : _GEN_153; // @[cache_single_port.scala 415:68 417:71]
  wire [63:0] _GEN_159 = _T_27 ? _GEN_147 : _GEN_156; // @[cache_single_port.scala 415:68 417:71]
  wire [5:0] _GEN_160 = ~write_data_reg ? _GEN_138 : _GEN_127; // @[cache_single_port.scala 403:46]
  wire [5:0] _GEN_162 = ~write_data_reg ? _GEN_140 : _GEN_129; // @[cache_single_port.scala 403:46]
  wire [5:0] _GEN_164 = ~write_data_reg ? _GEN_142 : _GEN_131; // @[cache_single_port.scala 403:46]
  wire [5:0] _GEN_166 = ~write_data_reg ? _GEN_144 : _GEN_133; // @[cache_single_port.scala 403:46]
  wire [63:0] _GEN_173 = ~write_data_reg ? _GEN_159 : 64'h0; // @[cache_single_port.scala 263:31 403:46]
  wire  _GEN_174 = io_mem_io_aw_ready | write_addr_reg; // @[cache_single_port.scala 287:37 422:49 423:48]
  wire  _GEN_175 = io_mem_io_w_ready & last | write_data_reg; // @[cache_single_port.scala 288:37 426:56 427:48]
  wire  _T_58 = write_addr_reg & write_data_reg; // @[cache_single_port.scala 430:45]
  wire [4:0] _GEN_176 = write_addr_reg & write_data_reg ? 5'h13 : 5'h11; // @[cache_single_port.scala 389:36 430:63 431:44]
  wire  _GEN_177 = write_addr_reg & write_data_reg ? 1'h0 : _GEN_174; // @[cache_single_port.scala 430:63 432:48]
  wire  _GEN_178 = write_addr_reg & write_data_reg ? 1'h0 : _GEN_175; // @[cache_single_port.scala 430:63 433:48]
  wire  _GEN_179 = write_addr_reg & write_data_reg ? 1'h0 : _GEN_0; // @[cache_single_port.scala 430:63 434:39]
  wire [4:0] _GEN_182 = index_in_line != 2'h3 ? 5'h10 : 5'hf; // @[cache_single_port.scala 441:70 442:52 445:52]
  wire [1:0] _GEN_184 = index_in_line != 2'h3 ? _GEN_4 : 2'h0; // @[cache_single_port.scala 441:70 446:55]
  wire  _GEN_185 = index_in_line != 2'h3 ? flush_over : _GEN_14; // @[cache_single_port.scala 280:33 441:70]
  wire [4:0] _GEN_187 = io_mem_io_b_valid ? _GEN_182 : 5'h13; // @[cache_single_port.scala 439:36 440:48]
  wire [1:0] _GEN_189 = io_mem_io_b_valid ? _GEN_184 : _GEN_4; // @[cache_single_port.scala 440:48]
  wire  _GEN_190 = io_mem_io_b_valid ? _GEN_185 : flush_over; // @[cache_single_port.scala 280:33 440:48]
  wire [1:0] _GEN_192 = io_mem_io_ar_ready ? 2'h3 : 2'h1; // @[cache_single_port.scala 460:36 461:49 462:44]
  wire [1:0] _GEN_193 = io_mem_io_r_valid ? 2'h0 : 2'h3; // @[cache_single_port.scala 470:48 471:44 474:44]
  wire  _GEN_196 = _T_35 ? 1'h0 : 1'h1; // @[cache_single_port.scala 249:31 492:46 494:55]
  wire [1:0] _GEN_197 = _T_35 ? cpu_request_accessType : 2'h3; // @[cache_single_port.scala 250:32 492:46 495:56]
  wire [31:0] _GEN_198 = _T_35 ? cpu_request_addr_reg_origin : cpu_request_addr_reg; // @[cache_single_port.scala 248:32 492:46 496:56]
  wire  _GEN_200 = _T_40 | last; // @[cache_single_port.scala 264:31 503:46 505:55]
  wire [63:0] _GEN_201 = _T_40 ? cpu_request_data : 64'h0; // @[cache_single_port.scala 263:31 503:46 506:55]
  wire [7:0] _GEN_202 = _T_40 ? cpu_request_mask : 8'hff; // @[cache_single_port.scala 262:31 503:46 507:55]
  wire  _GEN_203 = io_mem_io_w_ready | write_data_reg; // @[cache_single_port.scala 288:37 510:48 511:48]
  wire [2:0] _GEN_204 = _T_58 ? 3'h5 : 3'h4; // @[cache_single_port.scala 491:36 514:63 515:44]
  wire  _GEN_206 = _T_58 ? 1'h0 : _GEN_203; // @[cache_single_port.scala 514:63 517:48]
  wire [2:0] _GEN_208 = io_mem_io_b_valid ? 3'h0 : 3'h5; // @[cache_single_port.scala 522:48 524:44 526:44]
  wire [63:0] _GEN_210 = cpu_request_addr_reg[3] ? data_mem_2_io_data_read_data[127:64] : data_mem_2_io_data_read_data[
    63:0]; // @[Mux.scala 101:{16,16}]
  wire [63:0] _GEN_212 = cpu_request_addr_reg[3] ? data_mem_3_io_data_read_data[127:64] : data_mem_3_io_data_read_data[
    63:0]; // @[Mux.scala 101:{16,16}]
  wire [63:0] _tmp_response_data_T_12 = is_match_2 ? _GEN_210 : _GEN_212; // @[Mux.scala 101:16]
  wire [63:0] _GEN_214 = cpu_request_addr_reg[3] ? data_mem_1_io_data_read_data[127:64] : data_mem_1_io_data_read_data[
    63:0]; // @[Mux.scala 101:{16,16}]
  wire [63:0] _tmp_response_data_T_13 = is_match_1 ? _GEN_214 : _tmp_response_data_T_12; // @[Mux.scala 101:16]
  wire [63:0] _GEN_216 = cpu_request_addr_reg[3] ? data_mem_0_io_data_read_data[127:64] : data_mem_0_io_data_read_data[
    63:0]; // @[Mux.scala 101:{16,16}]
  wire [63:0] _tmp_response_data_T_14 = is_match_0 ? _GEN_216 : _tmp_response_data_T_13; // @[Mux.scala 101:16]
  wire [63:0] _GEN_217 = ~cpu_request_rw ? _tmp_response_data_T_14 : tmp_response_data; // @[cache_single_port.scala 285:40 538:54 542:59]
  wire [3:0] _GEN_218 = ~cpu_request_rw ? 4'hc : 4'h0; // @[cache_single_port.scala 538:54 550:52]
  wire  _GEN_219 = cpu_request_rw | tag_mem_0_io_tag_read_dirty; // @[cache_single_port.scala 560:69 554:71 561:87]
  wire [7:0] _tag_mem_0_io_tag_write_visit_T = ~tag_mem_0_io_tag_read_visit; // @[cache_single_port.scala 565:87]
  wire [7:0] _tag_mem_0_io_tag_write_visit_T_3 = tag_mem_0_io_tag_read_visit + 8'h1; // @[cache_single_port.scala 565:186]
  wire [7:0] _tag_mem_0_io_tag_write_visit_T_4 = _tag_mem_0_io_tag_write_visit_T == 8'h0 ? tag_mem_0_io_tag_read_visit
     : _tag_mem_0_io_tag_write_visit_T_3; // @[cache_single_port.scala 565:85]
  wire [7:0] _GEN_221 = tag_mem_0_io_tag_read_valid ? _tag_mem_0_io_tag_write_visit_T_4 : tag_mem_0_io_tag_read_visit; // @[cache_single_port.scala 237:41 563:81 565:79]
  wire  _GEN_223 = is_match_0 | _GEN_96; // @[cache_single_port.scala 556:58 557:76]
  wire [7:0] _GEN_224 = is_match_0 ? 8'h0 : _GEN_221; // @[cache_single_port.scala 556:58 558:79]
  wire  _GEN_226 = is_match_0 ? _GEN_219 : tag_mem_0_io_tag_read_dirty; // @[cache_single_port.scala 556:58 554:71]
  wire  _GEN_227 = cpu_request_rw | tag_mem_1_io_tag_read_dirty; // @[cache_single_port.scala 560:69 554:71 561:87]
  wire [7:0] _tag_mem_1_io_tag_write_visit_T = ~tag_mem_1_io_tag_read_visit; // @[cache_single_port.scala 565:87]
  wire [7:0] _tag_mem_1_io_tag_write_visit_T_3 = tag_mem_1_io_tag_read_visit + 8'h1; // @[cache_single_port.scala 565:186]
  wire [7:0] _tag_mem_1_io_tag_write_visit_T_4 = _tag_mem_1_io_tag_write_visit_T == 8'h0 ? tag_mem_1_io_tag_read_visit
     : _tag_mem_1_io_tag_write_visit_T_3; // @[cache_single_port.scala 565:85]
  wire [7:0] _GEN_229 = tag_mem_1_io_tag_read_valid ? _tag_mem_1_io_tag_write_visit_T_4 : tag_mem_1_io_tag_read_visit; // @[cache_single_port.scala 237:41 563:81 565:79]
  wire  _GEN_231 = is_match_1 | _GEN_97; // @[cache_single_port.scala 556:58 557:76]
  wire [7:0] _GEN_232 = is_match_1 ? 8'h0 : _GEN_229; // @[cache_single_port.scala 556:58 558:79]
  wire  _GEN_234 = is_match_1 ? _GEN_227 : tag_mem_1_io_tag_read_dirty; // @[cache_single_port.scala 556:58 554:71]
  wire  _GEN_235 = cpu_request_rw | tag_mem_2_io_tag_read_dirty; // @[cache_single_port.scala 560:69 554:71 561:87]
  wire [7:0] _tag_mem_2_io_tag_write_visit_T = ~tag_mem_2_io_tag_read_visit; // @[cache_single_port.scala 565:87]
  wire [7:0] _tag_mem_2_io_tag_write_visit_T_3 = tag_mem_2_io_tag_read_visit + 8'h1; // @[cache_single_port.scala 565:186]
  wire [7:0] _tag_mem_2_io_tag_write_visit_T_4 = _tag_mem_2_io_tag_write_visit_T == 8'h0 ? tag_mem_2_io_tag_read_visit
     : _tag_mem_2_io_tag_write_visit_T_3; // @[cache_single_port.scala 565:85]
  wire [7:0] _GEN_237 = tag_mem_2_io_tag_read_valid ? _tag_mem_2_io_tag_write_visit_T_4 : tag_mem_2_io_tag_read_visit; // @[cache_single_port.scala 237:41 563:81 565:79]
  wire  _GEN_239 = is_match_2 | _GEN_98; // @[cache_single_port.scala 556:58 557:76]
  wire [7:0] _GEN_240 = is_match_2 ? 8'h0 : _GEN_237; // @[cache_single_port.scala 556:58 558:79]
  wire  _GEN_242 = is_match_2 ? _GEN_235 : tag_mem_2_io_tag_read_dirty; // @[cache_single_port.scala 556:58 554:71]
  wire  _GEN_243 = cpu_request_rw | tag_mem_3_io_tag_read_dirty; // @[cache_single_port.scala 560:69 554:71 561:87]
  wire [7:0] _tag_mem_3_io_tag_write_visit_T = ~tag_mem_3_io_tag_read_visit; // @[cache_single_port.scala 565:87]
  wire [7:0] _tag_mem_3_io_tag_write_visit_T_3 = tag_mem_3_io_tag_read_visit + 8'h1; // @[cache_single_port.scala 565:186]
  wire [7:0] _tag_mem_3_io_tag_write_visit_T_4 = _tag_mem_3_io_tag_write_visit_T == 8'h0 ? tag_mem_3_io_tag_read_visit
     : _tag_mem_3_io_tag_write_visit_T_3; // @[cache_single_port.scala 565:85]
  wire [7:0] _GEN_245 = tag_mem_3_io_tag_read_valid ? _tag_mem_3_io_tag_write_visit_T_4 : tag_mem_3_io_tag_read_visit; // @[cache_single_port.scala 237:41 563:81 565:79]
  wire  _GEN_247 = is_match_3 | _GEN_99; // @[cache_single_port.scala 556:58 557:76]
  wire [7:0] _GEN_248 = is_match_3 ? 8'h0 : _GEN_245; // @[cache_single_port.scala 556:58 558:79]
  wire  _GEN_250 = is_match_3 ? _GEN_243 : tag_mem_3_io_tag_read_dirty; // @[cache_single_port.scala 556:58 554:71]
  wire [127:0] _data_mem_0_io_data_write_data_T = {cache_data_1,cache_data_0}; // @[cache_single_port.scala 590:102]
  wire [7:0] _wmask_T_2 = cpu_request_mask[7] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _wmask_T_5 = cpu_request_mask[6] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _wmask_T_8 = cpu_request_mask[5] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _wmask_T_11 = cpu_request_mask[4] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _wmask_T_14 = cpu_request_mask[3] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _wmask_T_17 = cpu_request_mask[2] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _wmask_T_20 = cpu_request_mask[1] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _wmask_T_23 = cpu_request_mask[0] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [63:0] _wmask_T_24 = {_wmask_T_2,_wmask_T_5,_wmask_T_8,_wmask_T_11,_wmask_T_14,_wmask_T_17,_wmask_T_20,
    _wmask_T_23}; // @[Cat.scala 31:58]
  wire [63:0] _GEN_253 = ~cpu_request_addr_reg[3] ? _wmask_T_24 : 64'h0; // @[cache_single_port.scala 592:{126,126} 591:63]
  wire [63:0] _GEN_254 = cpu_request_addr_reg[3] ? _wmask_T_24 : 64'h0; // @[cache_single_port.scala 592:{126,126} 591:63]
  wire [63:0] _GEN_260 = is_match_0 ? _GEN_254 : 64'h0; // @[cache_single_port.scala 281:28 573:66]
  wire [63:0] _GEN_271 = is_match_1 ? _GEN_254 : _GEN_260; // @[cache_single_port.scala 573:66]
  wire [63:0] _GEN_282 = is_match_2 ? _GEN_254 : _GEN_271; // @[cache_single_port.scala 573:66]
  wire [63:0] _GEN_293 = is_match_3 ? _GEN_254 : _GEN_282; // @[cache_single_port.scala 573:66]
  wire [63:0] _GEN_300 = cpu_request_rw ? _GEN_293 : 64'h0; // @[cache_single_port.scala 281:28 570:53]
  wire [63:0] _GEN_404 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_300 : 64'h0; // @[cache_single_port.scala 281:28 537:51]
  wire [63:0] _GEN_463 = index ? 64'hffffffffffffffff : 64'h0; // @[cache_single_port.scala 671:55 673:{62,62}]
  wire [63:0] _GEN_434 = 2'h0 == replace ? _GEN_463 : 64'h0; // @[cache_single_port.scala 281:28 668:62]
  wire [63:0] _GEN_445 = 2'h1 == replace ? _GEN_463 : _GEN_434; // @[cache_single_port.scala 668:62]
  wire [63:0] _GEN_456 = 2'h2 == replace ? _GEN_463 : _GEN_445; // @[cache_single_port.scala 668:62]
  wire [63:0] _GEN_467 = 2'h3 == replace ? _GEN_463 : _GEN_456; // @[cache_single_port.scala 668:62]
  wire [63:0] _GEN_474 = io_mem_io_r_valid ? _GEN_467 : 64'h0; // @[cache_single_port.scala 281:28 666:48]
  wire [63:0] _GEN_551 = 5'h8 == cache_state ? _GEN_474 : 64'h0; // @[cache_single_port.scala 281:28 290:28]
  wire [63:0] _GEN_583 = 5'h9 == cache_state ? 64'h0 : _GEN_551; // @[cache_single_port.scala 281:28 290:28]
  wire [63:0] _GEN_616 = 5'hd == cache_state ? 64'h0 : _GEN_583; // @[cache_single_port.scala 281:28 290:28]
  wire [63:0] _GEN_650 = 5'hc == cache_state ? 64'h0 : _GEN_616; // @[cache_single_port.scala 281:28 290:28]
  wire [63:0] _GEN_706 = 5'h6 == cache_state ? _GEN_404 : _GEN_650; // @[cache_single_port.scala 290:28]
  wire [63:0] _GEN_779 = 5'h5 == cache_state ? 64'h0 : _GEN_706; // @[cache_single_port.scala 281:28 290:28]
  wire [63:0] _GEN_860 = 5'h4 == cache_state ? 64'h0 : _GEN_779; // @[cache_single_port.scala 281:28 290:28]
  wire [63:0] _GEN_935 = 5'h3 == cache_state ? 64'h0 : _GEN_860; // @[cache_single_port.scala 281:28 290:28]
  wire [63:0] _GEN_1012 = 5'h1 == cache_state ? 64'h0 : _GEN_935; // @[cache_single_port.scala 281:28 290:28]
  wire [63:0] _GEN_1090 = 5'h13 == cache_state ? 64'h0 : _GEN_1012; // @[cache_single_port.scala 281:28 290:28]
  wire [63:0] _GEN_1177 = 5'h11 == cache_state ? 64'h0 : _GEN_1090; // @[cache_single_port.scala 281:28 290:28]
  wire [63:0] _GEN_1260 = 5'h10 == cache_state ? 64'h0 : _GEN_1177; // @[cache_single_port.scala 281:28 290:28]
  wire [63:0] _GEN_1343 = 5'hf == cache_state ? 64'h0 : _GEN_1260; // @[cache_single_port.scala 281:28 290:28]
  wire [63:0] wmask_1 = 5'h0 == cache_state ? 64'h0 : _GEN_1343; // @[cache_single_port.scala 281:28 290:28]
  wire [63:0] _GEN_259 = is_match_0 ? _GEN_253 : 64'h0; // @[cache_single_port.scala 281:28 573:66]
  wire [63:0] _GEN_270 = is_match_1 ? _GEN_253 : _GEN_259; // @[cache_single_port.scala 573:66]
  wire [63:0] _GEN_281 = is_match_2 ? _GEN_253 : _GEN_270; // @[cache_single_port.scala 573:66]
  wire [63:0] _GEN_292 = is_match_3 ? _GEN_253 : _GEN_281; // @[cache_single_port.scala 573:66]
  wire [63:0] _GEN_299 = cpu_request_rw ? _GEN_292 : 64'h0; // @[cache_single_port.scala 281:28 570:53]
  wire [63:0] _GEN_403 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_299 : 64'h0; // @[cache_single_port.scala 281:28 537:51]
  wire [63:0] _GEN_462 = ~index ? 64'hffffffffffffffff : 64'h0; // @[cache_single_port.scala 671:55 673:{62,62}]
  wire [63:0] _GEN_433 = 2'h0 == replace ? _GEN_462 : 64'h0; // @[cache_single_port.scala 281:28 668:62]
  wire [63:0] _GEN_444 = 2'h1 == replace ? _GEN_462 : _GEN_433; // @[cache_single_port.scala 668:62]
  wire [63:0] _GEN_455 = 2'h2 == replace ? _GEN_462 : _GEN_444; // @[cache_single_port.scala 668:62]
  wire [63:0] _GEN_466 = 2'h3 == replace ? _GEN_462 : _GEN_455; // @[cache_single_port.scala 668:62]
  wire [63:0] _GEN_473 = io_mem_io_r_valid ? _GEN_466 : 64'h0; // @[cache_single_port.scala 281:28 666:48]
  wire [63:0] _GEN_550 = 5'h8 == cache_state ? _GEN_473 : 64'h0; // @[cache_single_port.scala 281:28 290:28]
  wire [63:0] _GEN_582 = 5'h9 == cache_state ? 64'h0 : _GEN_550; // @[cache_single_port.scala 281:28 290:28]
  wire [63:0] _GEN_615 = 5'hd == cache_state ? 64'h0 : _GEN_582; // @[cache_single_port.scala 281:28 290:28]
  wire [63:0] _GEN_649 = 5'hc == cache_state ? 64'h0 : _GEN_615; // @[cache_single_port.scala 281:28 290:28]
  wire [63:0] _GEN_705 = 5'h6 == cache_state ? _GEN_403 : _GEN_649; // @[cache_single_port.scala 290:28]
  wire [63:0] _GEN_778 = 5'h5 == cache_state ? 64'h0 : _GEN_705; // @[cache_single_port.scala 281:28 290:28]
  wire [63:0] _GEN_859 = 5'h4 == cache_state ? 64'h0 : _GEN_778; // @[cache_single_port.scala 281:28 290:28]
  wire [63:0] _GEN_934 = 5'h3 == cache_state ? 64'h0 : _GEN_859; // @[cache_single_port.scala 281:28 290:28]
  wire [63:0] _GEN_1011 = 5'h1 == cache_state ? 64'h0 : _GEN_934; // @[cache_single_port.scala 281:28 290:28]
  wire [63:0] _GEN_1089 = 5'h13 == cache_state ? 64'h0 : _GEN_1011; // @[cache_single_port.scala 281:28 290:28]
  wire [63:0] _GEN_1176 = 5'h11 == cache_state ? 64'h0 : _GEN_1089; // @[cache_single_port.scala 281:28 290:28]
  wire [63:0] _GEN_1259 = 5'h10 == cache_state ? 64'h0 : _GEN_1176; // @[cache_single_port.scala 281:28 290:28]
  wire [63:0] _GEN_1342 = 5'hf == cache_state ? 64'h0 : _GEN_1259; // @[cache_single_port.scala 281:28 290:28]
  wire [63:0] wmask_0 = 5'h0 == cache_state ? 64'h0 : _GEN_1342; // @[cache_single_port.scala 281:28 290:28]
  wire [127:0] _data_mem_0_io_cache_req_wmask_T = {wmask_1,wmask_0}; // @[cache_single_port.scala 594:98]
  wire [127:0] _data_mem_0_io_cache_req_wmask_T_1 = ~_data_mem_0_io_cache_req_wmask_T; // @[cache_single_port.scala 594:91]
  wire [127:0] _GEN_258 = is_match_0 ? _data_mem_0_io_data_write_data_T : data_mem_0_io_data_read_data; // @[cache_single_port.scala 238:43 573:66 590:88]
  wire [127:0] _GEN_261 = is_match_0 ? _data_mem_0_io_cache_req_wmask_T_1 : 128'h0; // @[cache_single_port.scala 240:48 573:66 594:88]
  wire [127:0] _GEN_269 = is_match_1 ? _data_mem_0_io_data_write_data_T : data_mem_1_io_data_read_data; // @[cache_single_port.scala 238:43 573:66 590:88]
  wire [127:0] _GEN_272 = is_match_1 ? _data_mem_0_io_cache_req_wmask_T_1 : 128'h0; // @[cache_single_port.scala 240:48 573:66 594:88]
  wire [127:0] _GEN_280 = is_match_2 ? _data_mem_0_io_data_write_data_T : data_mem_2_io_data_read_data; // @[cache_single_port.scala 238:43 573:66 590:88]
  wire [127:0] _GEN_283 = is_match_2 ? _data_mem_0_io_cache_req_wmask_T_1 : 128'h0; // @[cache_single_port.scala 240:48 573:66 594:88]
  wire [127:0] _GEN_291 = is_match_3 ? _data_mem_0_io_data_write_data_T : data_mem_3_io_data_read_data; // @[cache_single_port.scala 238:43 573:66 590:88]
  wire [127:0] _GEN_294 = is_match_3 ? _data_mem_0_io_cache_req_wmask_T_1 : 128'h0; // @[cache_single_port.scala 240:48 573:66 594:88]
  wire  _GEN_295 = cpu_request_rw & is_match_0; // @[cache_single_port.scala 236:45 570:53]
  wire [127:0] _GEN_298 = cpu_request_rw ? _GEN_258 : data_mem_0_io_data_read_data; // @[cache_single_port.scala 238:43 570:53]
  wire [127:0] _GEN_301 = cpu_request_rw ? _GEN_261 : 128'h0; // @[cache_single_port.scala 240:48 570:53]
  wire  _GEN_302 = cpu_request_rw & is_match_1; // @[cache_single_port.scala 236:45 570:53]
  wire [127:0] _GEN_303 = cpu_request_rw ? _GEN_269 : data_mem_1_io_data_read_data; // @[cache_single_port.scala 238:43 570:53]
  wire [127:0] _GEN_304 = cpu_request_rw ? _GEN_272 : 128'h0; // @[cache_single_port.scala 240:48 570:53]
  wire  _GEN_305 = cpu_request_rw & is_match_2; // @[cache_single_port.scala 236:45 570:53]
  wire [127:0] _GEN_306 = cpu_request_rw ? _GEN_280 : data_mem_2_io_data_read_data; // @[cache_single_port.scala 238:43 570:53]
  wire [127:0] _GEN_307 = cpu_request_rw ? _GEN_283 : 128'h0; // @[cache_single_port.scala 240:48 570:53]
  wire  _GEN_308 = cpu_request_rw & is_match_3; // @[cache_single_port.scala 236:45 570:53]
  wire [127:0] _GEN_309 = cpu_request_rw ? _GEN_291 : data_mem_3_io_data_read_data; // @[cache_single_port.scala 238:43 570:53]
  wire [127:0] _GEN_310 = cpu_request_rw ? _GEN_294 : 128'h0; // @[cache_single_port.scala 240:48 570:53]
  wire [3:0] _GEN_311 = cpu_request_rw ? 4'hd : _GEN_218; // @[cache_single_port.scala 570:53 598:52]
  wire [7:0] _GEN_313 = tag_mem_0_io_tag_read_valid & tag_mem_1_io_tag_read_valid & tag_mem_2_io_tag_read_valid &
    tag_mem_3_io_tag_read_valid ? tag_mem_1_io_tag_read_visit : 8'h0; // @[cache_single_port.scala 272:28 601:92 602:47]
  wire [7:0] _GEN_416 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? 8'h0 : _GEN_313; // @[cache_single_port.scala 272:28 537:51]
  wire [7:0] _GEN_718 = 5'h6 == cache_state ? _GEN_416 : 8'h0; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_791 = 5'h5 == cache_state ? 8'h0 : _GEN_718; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_872 = 5'h4 == cache_state ? 8'h0 : _GEN_791; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_947 = 5'h3 == cache_state ? 8'h0 : _GEN_872; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_1024 = 5'h1 == cache_state ? 8'h0 : _GEN_947; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_1102 = 5'h13 == cache_state ? 8'h0 : _GEN_1024; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_1186 = 5'h11 == cache_state ? 8'h0 : _GEN_1102; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_1269 = 5'h10 == cache_state ? 8'h0 : _GEN_1186; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_1352 = 5'hf == cache_state ? 8'h0 : _GEN_1269; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] visit_1 = 5'h0 == cache_state ? 8'h0 : _GEN_1352; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_312 = tag_mem_0_io_tag_read_valid & tag_mem_1_io_tag_read_valid & tag_mem_2_io_tag_read_valid &
    tag_mem_3_io_tag_read_valid ? tag_mem_0_io_tag_read_visit : 8'h0; // @[cache_single_port.scala 272:28 601:92 602:47]
  wire [7:0] _GEN_415 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? 8'h0 : _GEN_312; // @[cache_single_port.scala 272:28 537:51]
  wire [7:0] _GEN_717 = 5'h6 == cache_state ? _GEN_415 : 8'h0; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_790 = 5'h5 == cache_state ? 8'h0 : _GEN_717; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_871 = 5'h4 == cache_state ? 8'h0 : _GEN_790; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_946 = 5'h3 == cache_state ? 8'h0 : _GEN_871; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_1023 = 5'h1 == cache_state ? 8'h0 : _GEN_946; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_1101 = 5'h13 == cache_state ? 8'h0 : _GEN_1023; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_1185 = 5'h11 == cache_state ? 8'h0 : _GEN_1101; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_1268 = 5'h10 == cache_state ? 8'h0 : _GEN_1185; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_1351 = 5'hf == cache_state ? 8'h0 : _GEN_1268; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] visit_0 = 5'h0 == cache_state ? 8'h0 : _GEN_1351; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_315 = tag_mem_0_io_tag_read_valid & tag_mem_1_io_tag_read_valid & tag_mem_2_io_tag_read_valid &
    tag_mem_3_io_tag_read_valid ? tag_mem_3_io_tag_read_visit : 8'h0; // @[cache_single_port.scala 272:28 601:92 602:47]
  wire [7:0] _GEN_418 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? 8'h0 : _GEN_315; // @[cache_single_port.scala 272:28 537:51]
  wire [7:0] _GEN_720 = 5'h6 == cache_state ? _GEN_418 : 8'h0; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_793 = 5'h5 == cache_state ? 8'h0 : _GEN_720; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_874 = 5'h4 == cache_state ? 8'h0 : _GEN_793; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_949 = 5'h3 == cache_state ? 8'h0 : _GEN_874; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_1026 = 5'h1 == cache_state ? 8'h0 : _GEN_949; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_1104 = 5'h13 == cache_state ? 8'h0 : _GEN_1026; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_1188 = 5'h11 == cache_state ? 8'h0 : _GEN_1104; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_1271 = 5'h10 == cache_state ? 8'h0 : _GEN_1188; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_1354 = 5'hf == cache_state ? 8'h0 : _GEN_1271; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] visit_3 = 5'h0 == cache_state ? 8'h0 : _GEN_1354; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_314 = tag_mem_0_io_tag_read_valid & tag_mem_1_io_tag_read_valid & tag_mem_2_io_tag_read_valid &
    tag_mem_3_io_tag_read_valid ? tag_mem_2_io_tag_read_visit : 8'h0; // @[cache_single_port.scala 272:28 601:92 602:47]
  wire [7:0] _GEN_417 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? 8'h0 : _GEN_314; // @[cache_single_port.scala 272:28 537:51]
  wire [7:0] _GEN_719 = 5'h6 == cache_state ? _GEN_417 : 8'h0; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_792 = 5'h5 == cache_state ? 8'h0 : _GEN_719; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_873 = 5'h4 == cache_state ? 8'h0 : _GEN_792; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_948 = 5'h3 == cache_state ? 8'h0 : _GEN_873; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_1025 = 5'h1 == cache_state ? 8'h0 : _GEN_948; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_1103 = 5'h13 == cache_state ? 8'h0 : _GEN_1025; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_1187 = 5'h11 == cache_state ? 8'h0 : _GEN_1103; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_1270 = 5'h10 == cache_state ? 8'h0 : _GEN_1187; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] _GEN_1353 = 5'hf == cache_state ? 8'h0 : _GEN_1270; // @[cache_single_port.scala 272:28 290:28]
  wire [7:0] visit_2 = 5'h0 == cache_state ? 8'h0 : _GEN_1353; // @[cache_single_port.scala 272:28 290:28]
  wire  _GEN_317 = tag_mem_0_io_tag_read_valid & tag_mem_1_io_tag_read_valid & tag_mem_2_io_tag_read_valid &
    tag_mem_3_io_tag_read_valid & visit_3 > visit_2; // @[cache_single_port.scala 601:92 604:53]
  wire  _GEN_420 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? 1'h0 : _GEN_317; // @[cache_single_port.scala 537:51]
  wire  _GEN_795 = 5'h5 == cache_state ? 1'h0 : 5'h6 == cache_state & _GEN_420; // @[cache_single_port.scala 290:28]
  wire  _GEN_876 = 5'h4 == cache_state ? 1'h0 : _GEN_795; // @[cache_single_port.scala 290:28]
  wire  _GEN_951 = 5'h3 == cache_state ? 1'h0 : _GEN_876; // @[cache_single_port.scala 290:28]
  wire  _GEN_1028 = 5'h1 == cache_state ? 1'h0 : _GEN_951; // @[cache_single_port.scala 290:28]
  wire  _GEN_1106 = 5'h13 == cache_state ? 1'h0 : _GEN_1028; // @[cache_single_port.scala 290:28]
  wire  _GEN_1190 = 5'h11 == cache_state ? 1'h0 : _GEN_1106; // @[cache_single_port.scala 290:28]
  wire  _GEN_1273 = 5'h10 == cache_state ? 1'h0 : _GEN_1190; // @[cache_single_port.scala 290:28]
  wire  _GEN_1356 = 5'hf == cache_state ? 1'h0 : _GEN_1273; // @[cache_single_port.scala 290:28]
  wire  compare_2_3 = 5'h0 == cache_state ? 1'h0 : _GEN_1356; // @[cache_single_port.scala 290:28]
  wire [7:0] _max_01_or_23_T = compare_2_3 ? visit_3 : visit_2; // @[cache_single_port.scala 605:60]
  wire  _GEN_316 = tag_mem_0_io_tag_read_valid & tag_mem_1_io_tag_read_valid & tag_mem_2_io_tag_read_valid &
    tag_mem_3_io_tag_read_valid & visit_1 > visit_0; // @[cache_single_port.scala 601:92 603:53]
  wire  _GEN_419 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? 1'h0 : _GEN_316; // @[cache_single_port.scala 537:51]
  wire  _GEN_794 = 5'h5 == cache_state ? 1'h0 : 5'h6 == cache_state & _GEN_419; // @[cache_single_port.scala 290:28]
  wire  _GEN_875 = 5'h4 == cache_state ? 1'h0 : _GEN_794; // @[cache_single_port.scala 290:28]
  wire  _GEN_950 = 5'h3 == cache_state ? 1'h0 : _GEN_875; // @[cache_single_port.scala 290:28]
  wire  _GEN_1027 = 5'h1 == cache_state ? 1'h0 : _GEN_950; // @[cache_single_port.scala 290:28]
  wire  _GEN_1105 = 5'h13 == cache_state ? 1'h0 : _GEN_1027; // @[cache_single_port.scala 290:28]
  wire  _GEN_1189 = 5'h11 == cache_state ? 1'h0 : _GEN_1105; // @[cache_single_port.scala 290:28]
  wire  _GEN_1272 = 5'h10 == cache_state ? 1'h0 : _GEN_1189; // @[cache_single_port.scala 290:28]
  wire  _GEN_1355 = 5'hf == cache_state ? 1'h0 : _GEN_1272; // @[cache_single_port.scala 290:28]
  wire  compare_1_0 = 5'h0 == cache_state ? 1'h0 : _GEN_1355; // @[cache_single_port.scala 290:28]
  wire [7:0] _max_01_or_23_T_1 = compare_1_0 ? visit_1 : visit_0; // @[cache_single_port.scala 605:99]
  wire  _GEN_318 = tag_mem_0_io_tag_read_valid & tag_mem_1_io_tag_read_valid & tag_mem_2_io_tag_read_valid &
    tag_mem_3_io_tag_read_valid & _max_01_or_23_T > _max_01_or_23_T_1; // @[cache_single_port.scala 601:92 605:54]
  wire  _GEN_421 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? 1'h0 : _GEN_318; // @[cache_single_port.scala 537:51]
  wire  _GEN_796 = 5'h5 == cache_state ? 1'h0 : 5'h6 == cache_state & _GEN_421; // @[cache_single_port.scala 290:28]
  wire  _GEN_877 = 5'h4 == cache_state ? 1'h0 : _GEN_796; // @[cache_single_port.scala 290:28]
  wire  _GEN_952 = 5'h3 == cache_state ? 1'h0 : _GEN_877; // @[cache_single_port.scala 290:28]
  wire  _GEN_1029 = 5'h1 == cache_state ? 1'h0 : _GEN_952; // @[cache_single_port.scala 290:28]
  wire  _GEN_1107 = 5'h13 == cache_state ? 1'h0 : _GEN_1029; // @[cache_single_port.scala 290:28]
  wire  _GEN_1191 = 5'h11 == cache_state ? 1'h0 : _GEN_1107; // @[cache_single_port.scala 290:28]
  wire  _GEN_1274 = 5'h10 == cache_state ? 1'h0 : _GEN_1191; // @[cache_single_port.scala 290:28]
  wire  _GEN_1357 = 5'hf == cache_state ? 1'h0 : _GEN_1274; // @[cache_single_port.scala 290:28]
  wire  max_01_or_23 = 5'h0 == cache_state ? 1'h0 : _GEN_1357; // @[cache_single_port.scala 290:28]
  wire  _max_T = max_01_or_23 ? compare_2_3 : compare_1_0; // @[cache_single_port.scala 606:69]
  wire [1:0] _max_T_1 = {max_01_or_23,_max_T}; // @[Cat.scala 31:58]
  wire  _max_T_2 = ~tag_mem_1_io_tag_read_valid; // @[cache_single_port.scala 609:97]
  wire  _max_T_3 = ~tag_mem_2_io_tag_read_valid; // @[cache_single_port.scala 609:144]
  wire  _max_T_4 = ~tag_mem_3_io_tag_read_valid; // @[cache_single_port.scala 609:191]
  wire [1:0] _max_T_5 = _max_T_4 ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _max_T_6 = _max_T_3 ? 2'h2 : _max_T_5; // @[Mux.scala 101:16]
  wire [1:0] _max_T_7 = _max_T_2 ? 2'h1 : _max_T_6; // @[Mux.scala 101:16]
  wire [1:0] _GEN_319 = tag_mem_0_io_tag_read_valid & tag_mem_1_io_tag_read_valid & tag_mem_2_io_tag_read_valid &
    tag_mem_3_io_tag_read_valid ? _max_T_1 : _max_T_7; // @[cache_single_port.scala 601:92 606:45 609:45]
  wire [1:0] _GEN_422 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? 2'h0 : _GEN_319; // @[cache_single_port.scala 537:51]
  wire [1:0] _GEN_724 = 5'h6 == cache_state ? _GEN_422 : 2'h0; // @[cache_single_port.scala 290:28]
  wire [1:0] _GEN_797 = 5'h5 == cache_state ? 2'h0 : _GEN_724; // @[cache_single_port.scala 290:28]
  wire [1:0] _GEN_878 = 5'h4 == cache_state ? 2'h0 : _GEN_797; // @[cache_single_port.scala 290:28]
  wire [1:0] _GEN_953 = 5'h3 == cache_state ? 2'h0 : _GEN_878; // @[cache_single_port.scala 290:28]
  wire [1:0] _GEN_1030 = 5'h1 == cache_state ? 2'h0 : _GEN_953; // @[cache_single_port.scala 290:28]
  wire [1:0] _GEN_1108 = 5'h13 == cache_state ? 2'h0 : _GEN_1030; // @[cache_single_port.scala 290:28]
  wire [1:0] _GEN_1192 = 5'h11 == cache_state ? 2'h0 : _GEN_1108; // @[cache_single_port.scala 290:28]
  wire [1:0] _GEN_1275 = 5'h10 == cache_state ? 2'h0 : _GEN_1192; // @[cache_single_port.scala 290:28]
  wire [1:0] _GEN_1358 = 5'hf == cache_state ? 2'h0 : _GEN_1275; // @[cache_single_port.scala 290:28]
  wire [1:0] max = 5'h0 == cache_state ? 2'h0 : _GEN_1358; // @[cache_single_port.scala 290:28]
  wire [31:0] _refill_addr_T_1 = {cpu_request_addr_reg[31:4],4'h0}; // @[Cat.scala 31:58]
  wire  _T_105 = 2'h0 == max; // @[cache_single_port.scala 616:50]
  wire [31:0] _writeback_addr_T_4 = {tag_mem_0_io_tag_read_tag,cpu_request_addr_index,4'h0}; // @[Cat.scala 31:58]
  wire [3:0] _GEN_321 = ~tag_mem_0_io_tag_read_valid | ~tag_mem_0_io_tag_read_dirty ? 4'h9 : 4'h7; // @[cache_single_port.scala 622:119 623:68 626:68]
  wire [31:0] _GEN_322 = ~tag_mem_0_io_tag_read_valid | ~tag_mem_0_io_tag_read_dirty ? writeback_addr :
    _writeback_addr_T_4; // @[cache_single_port.scala 622:119 167:37 625:72]
  wire  _GEN_324 = 2'h0 == max | tag_mem_0_io_tag_read_valid; // @[cache_single_port.scala 237:41 616:58 618:79]
  wire  _GEN_325 = 2'h0 == max ? cpu_request_rw : tag_mem_0_io_tag_read_dirty; // @[cache_single_port.scala 237:41 616:58 619:79]
  wire [21:0] _GEN_326 = 2'h0 == max ? cpu_request_addr_tag : tag_mem_0_io_tag_read_tag; // @[cache_single_port.scala 237:41 616:58 620:77]
  wire [7:0] _GEN_327 = 2'h0 == max ? 8'h0 : tag_mem_0_io_tag_read_visit; // @[cache_single_port.scala 237:41 616:58 621:79]
  wire [3:0] _GEN_328 = 2'h0 == max ? _GEN_321 : 4'h0; // @[cache_single_port.scala 616:58]
  wire [31:0] _GEN_329 = 2'h0 == max ? _GEN_322 : writeback_addr; // @[cache_single_port.scala 167:37 616:58]
  wire  _T_109 = 2'h1 == max; // @[cache_single_port.scala 616:50]
  wire [31:0] _writeback_addr_T_5 = {tag_mem_1_io_tag_read_tag,cpu_request_addr_index,4'h0}; // @[Cat.scala 31:58]
  wire [3:0] _GEN_330 = _max_T_2 | ~tag_mem_1_io_tag_read_dirty ? 4'h9 : 4'h7; // @[cache_single_port.scala 622:119 623:68 626:68]
  wire [31:0] _GEN_331 = _max_T_2 | ~tag_mem_1_io_tag_read_dirty ? _GEN_329 : _writeback_addr_T_5; // @[cache_single_port.scala 622:119 625:72]
  wire  _GEN_333 = 2'h1 == max | tag_mem_1_io_tag_read_valid; // @[cache_single_port.scala 237:41 616:58 618:79]
  wire  _GEN_334 = 2'h1 == max ? cpu_request_rw : tag_mem_1_io_tag_read_dirty; // @[cache_single_port.scala 237:41 616:58 619:79]
  wire [21:0] _GEN_335 = 2'h1 == max ? cpu_request_addr_tag : tag_mem_1_io_tag_read_tag; // @[cache_single_port.scala 237:41 616:58 620:77]
  wire [7:0] _GEN_336 = 2'h1 == max ? 8'h0 : tag_mem_1_io_tag_read_visit; // @[cache_single_port.scala 237:41 616:58 621:79]
  wire [3:0] _GEN_337 = 2'h1 == max ? _GEN_330 : _GEN_328; // @[cache_single_port.scala 616:58]
  wire [31:0] _GEN_338 = 2'h1 == max ? _GEN_331 : _GEN_329; // @[cache_single_port.scala 616:58]
  wire  _T_113 = 2'h2 == max; // @[cache_single_port.scala 616:50]
  wire [31:0] _writeback_addr_T_6 = {tag_mem_2_io_tag_read_tag,cpu_request_addr_index,4'h0}; // @[Cat.scala 31:58]
  wire [3:0] _GEN_339 = _max_T_3 | ~tag_mem_2_io_tag_read_dirty ? 4'h9 : 4'h7; // @[cache_single_port.scala 622:119 623:68 626:68]
  wire [31:0] _GEN_340 = _max_T_3 | ~tag_mem_2_io_tag_read_dirty ? _GEN_338 : _writeback_addr_T_6; // @[cache_single_port.scala 622:119 625:72]
  wire  _GEN_342 = 2'h2 == max | tag_mem_2_io_tag_read_valid; // @[cache_single_port.scala 237:41 616:58 618:79]
  wire  _GEN_343 = 2'h2 == max ? cpu_request_rw : tag_mem_2_io_tag_read_dirty; // @[cache_single_port.scala 237:41 616:58 619:79]
  wire [21:0] _GEN_344 = 2'h2 == max ? cpu_request_addr_tag : tag_mem_2_io_tag_read_tag; // @[cache_single_port.scala 237:41 616:58 620:77]
  wire [7:0] _GEN_345 = 2'h2 == max ? 8'h0 : tag_mem_2_io_tag_read_visit; // @[cache_single_port.scala 237:41 616:58 621:79]
  wire [3:0] _GEN_346 = 2'h2 == max ? _GEN_339 : _GEN_337; // @[cache_single_port.scala 616:58]
  wire [31:0] _GEN_347 = 2'h2 == max ? _GEN_340 : _GEN_338; // @[cache_single_port.scala 616:58]
  wire  _T_117 = 2'h3 == max; // @[cache_single_port.scala 616:50]
  wire [31:0] _writeback_addr_T_7 = {tag_mem_3_io_tag_read_tag,cpu_request_addr_index,4'h0}; // @[Cat.scala 31:58]
  wire [3:0] _GEN_348 = _max_T_4 | ~tag_mem_3_io_tag_read_dirty ? 4'h9 : 4'h7; // @[cache_single_port.scala 622:119 623:68 626:68]
  wire [31:0] _GEN_349 = _max_T_4 | ~tag_mem_3_io_tag_read_dirty ? _GEN_347 : _writeback_addr_T_7; // @[cache_single_port.scala 622:119 625:72]
  wire  _GEN_351 = 2'h3 == max | tag_mem_3_io_tag_read_valid; // @[cache_single_port.scala 237:41 616:58 618:79]
  wire  _GEN_352 = 2'h3 == max ? cpu_request_rw : tag_mem_3_io_tag_read_dirty; // @[cache_single_port.scala 237:41 616:58 619:79]
  wire [21:0] _GEN_353 = 2'h3 == max ? cpu_request_addr_tag : tag_mem_3_io_tag_read_tag; // @[cache_single_port.scala 237:41 616:58 620:77]
  wire [7:0] _GEN_354 = 2'h3 == max ? 8'h0 : tag_mem_3_io_tag_read_visit; // @[cache_single_port.scala 237:41 616:58 621:79]
  wire [3:0] _GEN_355 = 2'h3 == max ? _GEN_348 : _GEN_346; // @[cache_single_port.scala 616:58]
  wire [31:0] _GEN_356 = 2'h3 == max ? _GEN_349 : _GEN_347; // @[cache_single_port.scala 616:58]
  wire  _GEN_357 = 2'h0 != max & tag_mem_0_io_tag_read_valid | _T_105; // @[cache_single_port.scala 632:92 633:76]
  wire  _GEN_358 = 2'h0 != max & tag_mem_0_io_tag_read_valid | _GEN_324; // @[cache_single_port.scala 632:92 634:79]
  wire  _GEN_359 = 2'h0 != max & tag_mem_0_io_tag_read_valid ? tag_mem_0_io_tag_read_dirty : _GEN_325; // @[cache_single_port.scala 632:92 635:79]
  wire [7:0] _GEN_360 = 2'h0 != max & tag_mem_0_io_tag_read_valid ? _tag_mem_0_io_tag_write_visit_T_4 : _GEN_327; // @[cache_single_port.scala 632:92 636:79]
  wire [21:0] _GEN_361 = 2'h0 != max & tag_mem_0_io_tag_read_valid ? tag_mem_0_io_tag_read_tag : _GEN_326; // @[cache_single_port.scala 632:92 637:77]
  wire  _GEN_362 = 2'h1 != max & tag_mem_1_io_tag_read_valid | _T_109; // @[cache_single_port.scala 632:92 633:76]
  wire  _GEN_363 = 2'h1 != max & tag_mem_1_io_tag_read_valid | _GEN_333; // @[cache_single_port.scala 632:92 634:79]
  wire  _GEN_364 = 2'h1 != max & tag_mem_1_io_tag_read_valid ? tag_mem_1_io_tag_read_dirty : _GEN_334; // @[cache_single_port.scala 632:92 635:79]
  wire [7:0] _GEN_365 = 2'h1 != max & tag_mem_1_io_tag_read_valid ? _tag_mem_1_io_tag_write_visit_T_4 : _GEN_336; // @[cache_single_port.scala 632:92 636:79]
  wire [21:0] _GEN_366 = 2'h1 != max & tag_mem_1_io_tag_read_valid ? tag_mem_1_io_tag_read_tag : _GEN_335; // @[cache_single_port.scala 632:92 637:77]
  wire  _GEN_367 = 2'h2 != max & tag_mem_2_io_tag_read_valid | _T_113; // @[cache_single_port.scala 632:92 633:76]
  wire  _GEN_368 = 2'h2 != max & tag_mem_2_io_tag_read_valid | _GEN_342; // @[cache_single_port.scala 632:92 634:79]
  wire  _GEN_369 = 2'h2 != max & tag_mem_2_io_tag_read_valid ? tag_mem_2_io_tag_read_dirty : _GEN_343; // @[cache_single_port.scala 632:92 635:79]
  wire [7:0] _GEN_370 = 2'h2 != max & tag_mem_2_io_tag_read_valid ? _tag_mem_2_io_tag_write_visit_T_4 : _GEN_345; // @[cache_single_port.scala 632:92 636:79]
  wire [21:0] _GEN_371 = 2'h2 != max & tag_mem_2_io_tag_read_valid ? tag_mem_2_io_tag_read_tag : _GEN_344; // @[cache_single_port.scala 632:92 637:77]
  wire  _GEN_372 = 2'h3 != max & tag_mem_3_io_tag_read_valid | _T_117; // @[cache_single_port.scala 632:92 633:76]
  wire  _GEN_373 = 2'h3 != max & tag_mem_3_io_tag_read_valid | _GEN_351; // @[cache_single_port.scala 632:92 634:79]
  wire  _GEN_374 = 2'h3 != max & tag_mem_3_io_tag_read_valid ? tag_mem_3_io_tag_read_dirty : _GEN_352; // @[cache_single_port.scala 632:92 635:79]
  wire [7:0] _GEN_375 = 2'h3 != max & tag_mem_3_io_tag_read_valid ? _tag_mem_3_io_tag_write_visit_T_4 : _GEN_354; // @[cache_single_port.scala 632:92 636:79]
  wire [21:0] _GEN_376 = 2'h3 != max & tag_mem_3_io_tag_read_valid ? tag_mem_3_io_tag_read_tag : _GEN_353; // @[cache_single_port.scala 632:92 637:77]
  wire [63:0] _GEN_377 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_217 : tmp_response_data; // @[cache_single_port.scala 285:40 537:51]
  wire [3:0] _GEN_378 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_311 : _GEN_355; // @[cache_single_port.scala 537:51]
  wire  _GEN_379 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_226 : _GEN_359; // @[cache_single_port.scala 537:51]
  wire [21:0] _GEN_380 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? tag_mem_0_io_tag_read_tag : _GEN_361; // @[cache_single_port.scala 537:51 555:69]
  wire  _GEN_381 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_223 : _GEN_357; // @[cache_single_port.scala 537:51]
  wire [7:0] _GEN_382 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_224 : _GEN_360; // @[cache_single_port.scala 537:51]
  wire  _GEN_383 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_223 : _GEN_358; // @[cache_single_port.scala 537:51]
  wire  _GEN_384 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_234 : _GEN_364; // @[cache_single_port.scala 537:51]
  wire [21:0] _GEN_385 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? tag_mem_1_io_tag_read_tag : _GEN_366; // @[cache_single_port.scala 537:51 555:69]
  wire  _GEN_386 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_231 : _GEN_362; // @[cache_single_port.scala 537:51]
  wire [7:0] _GEN_387 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_232 : _GEN_365; // @[cache_single_port.scala 537:51]
  wire  _GEN_388 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_231 : _GEN_363; // @[cache_single_port.scala 537:51]
  wire  _GEN_389 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_242 : _GEN_369; // @[cache_single_port.scala 537:51]
  wire [21:0] _GEN_390 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? tag_mem_2_io_tag_read_tag : _GEN_371; // @[cache_single_port.scala 537:51 555:69]
  wire  _GEN_391 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_239 : _GEN_367; // @[cache_single_port.scala 537:51]
  wire [7:0] _GEN_392 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_240 : _GEN_370; // @[cache_single_port.scala 537:51]
  wire  _GEN_393 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_239 : _GEN_368; // @[cache_single_port.scala 537:51]
  wire  _GEN_394 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_250 : _GEN_374; // @[cache_single_port.scala 537:51]
  wire [21:0] _GEN_395 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? tag_mem_3_io_tag_read_tag : _GEN_376; // @[cache_single_port.scala 537:51 555:69]
  wire  _GEN_396 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_247 : _GEN_372; // @[cache_single_port.scala 537:51]
  wire [7:0] _GEN_397 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_248 : _GEN_375; // @[cache_single_port.scala 537:51]
  wire  _GEN_398 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_247 : _GEN_373; // @[cache_single_port.scala 537:51]
  wire  _GEN_399 = (is_match_0 | is_match_1 | is_match_2 | is_match_3) & _GEN_295; // @[cache_single_port.scala 236:45 537:51]
  wire [127:0] _GEN_402 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_298 : data_mem_0_io_data_read_data; // @[cache_single_port.scala 238:43 537:51]
  wire [127:0] _GEN_405 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_301 : 128'h0; // @[cache_single_port.scala 240:48 537:51]
  wire  _GEN_406 = (is_match_0 | is_match_1 | is_match_2 | is_match_3) & _GEN_302; // @[cache_single_port.scala 236:45 537:51]
  wire [127:0] _GEN_407 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_303 : data_mem_1_io_data_read_data; // @[cache_single_port.scala 238:43 537:51]
  wire [127:0] _GEN_408 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_304 : 128'h0; // @[cache_single_port.scala 240:48 537:51]
  wire  _GEN_409 = (is_match_0 | is_match_1 | is_match_2 | is_match_3) & _GEN_305; // @[cache_single_port.scala 236:45 537:51]
  wire [127:0] _GEN_410 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_306 : data_mem_2_io_data_read_data; // @[cache_single_port.scala 238:43 537:51]
  wire [127:0] _GEN_411 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_307 : 128'h0; // @[cache_single_port.scala 240:48 537:51]
  wire  _GEN_412 = (is_match_0 | is_match_1 | is_match_2 | is_match_3) & _GEN_308; // @[cache_single_port.scala 236:45 537:51]
  wire [127:0] _GEN_413 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_309 : data_mem_3_io_data_read_data; // @[cache_single_port.scala 238:43 537:51]
  wire [127:0] _GEN_414 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? _GEN_310 : 128'h0; // @[cache_single_port.scala 240:48 537:51]
  wire [1:0] _GEN_423 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? replace : max; // @[cache_single_port.scala 165:30 537:51]
  wire [31:0] _GEN_424 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? refill_addr : _refill_addr_T_1; // @[cache_single_port.scala 166:34 537:51 613:45]
  wire [31:0] _GEN_425 = is_match_0 | is_match_1 | is_match_2 | is_match_3 ? writeback_addr : _GEN_356; // @[cache_single_port.scala 167:37 537:51]
  wire [3:0] _GEN_426 = io_mem_io_ar_ready ? 4'h8 : 4'h9; // @[cache_single_port.scala 655:36 657:49 658:44]
  wire [127:0] _GEN_435 = 2'h0 == replace ? _data_mem_0_io_data_write_data_T : data_mem_0_io_data_read_data; // @[cache_single_port.scala 238:43 668:62 674:80]
  wire [127:0] _GEN_436 = 2'h0 == replace ? _data_mem_0_io_cache_req_wmask_T_1 : 128'h0; // @[cache_single_port.scala 240:48 668:62 675:80]
  wire [127:0] _GEN_446 = 2'h1 == replace ? _data_mem_0_io_data_write_data_T : data_mem_1_io_data_read_data; // @[cache_single_port.scala 238:43 668:62 674:80]
  wire [127:0] _GEN_447 = 2'h1 == replace ? _data_mem_0_io_cache_req_wmask_T_1 : 128'h0; // @[cache_single_port.scala 240:48 668:62 675:80]
  wire [127:0] _GEN_457 = 2'h2 == replace ? _data_mem_0_io_data_write_data_T : data_mem_2_io_data_read_data; // @[cache_single_port.scala 238:43 668:62 674:80]
  wire [127:0] _GEN_458 = 2'h2 == replace ? _data_mem_0_io_cache_req_wmask_T_1 : 128'h0; // @[cache_single_port.scala 240:48 668:62 675:80]
  wire [127:0] _GEN_468 = 2'h3 == replace ? _data_mem_0_io_data_write_data_T : data_mem_3_io_data_read_data; // @[cache_single_port.scala 238:43 668:62 674:80]
  wire [127:0] _GEN_469 = 2'h3 == replace ? _data_mem_0_io_cache_req_wmask_T_1 : 128'h0; // @[cache_single_port.scala 240:48 668:62 675:80]
  wire [127:0] _GEN_475 = io_mem_io_r_valid ? _GEN_435 : data_mem_0_io_data_read_data; // @[cache_single_port.scala 238:43 666:48]
  wire [127:0] _GEN_476 = io_mem_io_r_valid ? _GEN_436 : 128'h0; // @[cache_single_port.scala 240:48 666:48]
  wire  _GEN_477 = io_mem_io_r_valid & _T_141; // @[cache_single_port.scala 236:45 666:48]
  wire [127:0] _GEN_478 = io_mem_io_r_valid ? _GEN_446 : data_mem_1_io_data_read_data; // @[cache_single_port.scala 238:43 666:48]
  wire [127:0] _GEN_479 = io_mem_io_r_valid ? _GEN_447 : 128'h0; // @[cache_single_port.scala 240:48 666:48]
  wire  _GEN_480 = io_mem_io_r_valid & _T_142; // @[cache_single_port.scala 236:45 666:48]
  wire [127:0] _GEN_481 = io_mem_io_r_valid ? _GEN_457 : data_mem_2_io_data_read_data; // @[cache_single_port.scala 238:43 666:48]
  wire [127:0] _GEN_482 = io_mem_io_r_valid ? _GEN_458 : 128'h0; // @[cache_single_port.scala 240:48 666:48]
  wire  _GEN_483 = io_mem_io_r_valid & _T_143; // @[cache_single_port.scala 236:45 666:48]
  wire [127:0] _GEN_484 = io_mem_io_r_valid ? _GEN_468 : data_mem_3_io_data_read_data; // @[cache_single_port.scala 238:43 666:48]
  wire [127:0] _GEN_485 = io_mem_io_r_valid ? _GEN_469 : 128'h0; // @[cache_single_port.scala 240:48 666:48]
  wire  _GEN_486 = io_mem_io_r_valid & _T_144; // @[cache_single_port.scala 236:45 666:48]
  wire [3:0] _GEN_487 = io_mem_io_r_bits_last ? 4'he : 4'h8; // @[cache_single_port.scala 665:36 684:52 685:44]
  wire  _GEN_488 = io_mem_io_r_bits_last ? 1'h0 : _GEN_0; // @[cache_single_port.scala 684:52 686:39]
  wire [63:0] _GEN_494 = _T_141 ? _GEN_147 : 64'h0; // @[cache_single_port.scala 263:31 722:62 724:71]
  wire [63:0] _GEN_497 = _T_142 ? _GEN_147 : _GEN_494; // @[cache_single_port.scala 722:62 724:71]
  wire [63:0] _GEN_500 = _T_143 ? _GEN_147 : _GEN_497; // @[cache_single_port.scala 722:62 724:71]
  wire [63:0] _GEN_503 = _T_144 ? _GEN_147 : _GEN_500; // @[cache_single_port.scala 722:62 724:71]
  wire [63:0] _GEN_509 = _T_40 ? _GEN_503 : 64'h0; // @[cache_single_port.scala 263:31 717:46]
  wire [3:0] _GEN_511 = _T_58 ? 4'hb : 4'h7; // @[cache_single_port.scala 705:36 734:63 735:44]
  wire [3:0] _GEN_515 = io_mem_io_b_valid ? 4'h9 : 4'hb; // @[cache_single_port.scala 743:36 744:48 745:44]
  wire [3:0] _GEN_517 = 5'hb == cache_state ? _GEN_515 : 4'h0; // @[cache_single_port.scala 290:28]
  wire [3:0] _GEN_518 = 5'h7 == cache_state ? _GEN_511 : _GEN_517; // @[cache_single_port.scala 290:28]
  wire [31:0] _GEN_521 = 5'h7 == cache_state ? _GEN_137 : cpu_request_addr_reg; // @[cache_single_port.scala 290:28 248:32]
  wire  _GEN_522 = 5'h7 == cache_state ? _GEN_177 : write_addr_reg; // @[cache_single_port.scala 290:28 287:37]
  wire [63:0] _GEN_528 = 5'h7 == cache_state ? _GEN_509 : 64'h0; // @[cache_single_port.scala 290:28 263:31]
  wire  _GEN_529 = 5'h7 == cache_state ? _GEN_178 : write_data_reg; // @[cache_single_port.scala 290:28 288:37]
  wire  _GEN_530 = 5'h7 == cache_state ? _GEN_179 : _GEN_0; // @[cache_single_port.scala 290:28]
  wire  _GEN_531 = 5'h7 == cache_state ? 1'h0 : 5'hb == cache_state; // @[cache_single_port.scala 268:27 290:28]
  wire [3:0] _GEN_532 = 5'he == cache_state ? 4'h6 : _GEN_518; // @[cache_single_port.scala 290:28 690:36]
  wire  _GEN_533 = 5'he == cache_state ? 1'h0 : 5'h7 == cache_state & _T_35; // @[cache_single_port.scala 247:28 290:28]
  wire [31:0] _GEN_535 = 5'he == cache_state ? cpu_request_addr_reg : _GEN_521; // @[cache_single_port.scala 290:28 248:32]
  wire  _GEN_536 = 5'he == cache_state ? write_addr_reg : _GEN_522; // @[cache_single_port.scala 290:28 287:37]
  wire  _GEN_538 = 5'he == cache_state ? 1'h0 : 5'h7 == cache_state & _T_40; // @[cache_single_port.scala 261:27 290:28]
  wire [63:0] _GEN_542 = 5'he == cache_state ? 64'h0 : _GEN_528; // @[cache_single_port.scala 290:28 263:31]
  wire  _GEN_543 = 5'he == cache_state ? write_data_reg : _GEN_529; // @[cache_single_port.scala 290:28 288:37]
  wire  _GEN_544 = 5'he == cache_state ? _GEN_0 : _GEN_530; // @[cache_single_port.scala 290:28]
  wire  _GEN_545 = 5'he == cache_state ? 1'h0 : _GEN_531; // @[cache_single_port.scala 268:27 290:28]
  wire [3:0] _GEN_547 = 5'h8 == cache_state ? _GEN_487 : _GEN_532; // @[cache_single_port.scala 290:28]
  wire [127:0] _GEN_552 = 5'h8 == cache_state ? _GEN_475 : data_mem_0_io_data_read_data; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_553 = 5'h8 == cache_state ? _GEN_476 : 128'h0; // @[cache_single_port.scala 290:28 240:48]
  wire [127:0] _GEN_555 = 5'h8 == cache_state ? _GEN_478 : data_mem_1_io_data_read_data; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_556 = 5'h8 == cache_state ? _GEN_479 : 128'h0; // @[cache_single_port.scala 290:28 240:48]
  wire [127:0] _GEN_558 = 5'h8 == cache_state ? _GEN_481 : data_mem_2_io_data_read_data; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_559 = 5'h8 == cache_state ? _GEN_482 : 128'h0; // @[cache_single_port.scala 290:28 240:48]
  wire [127:0] _GEN_561 = 5'h8 == cache_state ? _GEN_484 : data_mem_3_io_data_read_data; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_562 = 5'h8 == cache_state ? _GEN_485 : 128'h0; // @[cache_single_port.scala 290:28 240:48]
  wire  _GEN_565 = 5'h8 == cache_state ? _GEN_488 : _GEN_544; // @[cache_single_port.scala 290:28]
  wire  _GEN_566 = 5'h8 == cache_state ? 1'h0 : _GEN_533; // @[cache_single_port.scala 247:28 290:28]
  wire [31:0] _GEN_568 = 5'h8 == cache_state ? cpu_request_addr_reg : _GEN_535; // @[cache_single_port.scala 290:28 248:32]
  wire  _GEN_569 = 5'h8 == cache_state ? write_addr_reg : _GEN_536; // @[cache_single_port.scala 290:28 287:37]
  wire  _GEN_570 = 5'h8 == cache_state ? 1'h0 : _GEN_538; // @[cache_single_port.scala 261:27 290:28]
  wire [63:0] _GEN_572 = 5'h8 == cache_state ? 64'h0 : _GEN_542; // @[cache_single_port.scala 290:28 263:31]
  wire  _GEN_573 = 5'h8 == cache_state ? write_data_reg : _GEN_543; // @[cache_single_port.scala 290:28 288:37]
  wire  _GEN_574 = 5'h8 == cache_state ? 1'h0 : _GEN_545; // @[cache_single_port.scala 268:27 290:28]
  wire [3:0] _GEN_577 = 5'h9 == cache_state ? _GEN_426 : _GEN_547; // @[cache_single_port.scala 290:28]
  wire [31:0] _GEN_578 = 5'h9 == cache_state ? refill_addr : cpu_request_addr_reg; // @[cache_single_port.scala 290:28 255:32 656:48]
  wire  _GEN_579 = 5'h9 == cache_state ? 1'h0 : 5'h8 == cache_state; // @[cache_single_port.scala 266:27 290:28]
  wire [127:0] _GEN_584 = 5'h9 == cache_state ? data_mem_0_io_data_read_data : _GEN_552; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_585 = 5'h9 == cache_state ? 128'h0 : _GEN_553; // @[cache_single_port.scala 290:28 240:48]
  wire  _GEN_586 = 5'h9 == cache_state ? 1'h0 : 5'h8 == cache_state & _GEN_477; // @[cache_single_port.scala 290:28 236:45]
  wire [127:0] _GEN_587 = 5'h9 == cache_state ? data_mem_1_io_data_read_data : _GEN_555; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_588 = 5'h9 == cache_state ? 128'h0 : _GEN_556; // @[cache_single_port.scala 290:28 240:48]
  wire  _GEN_589 = 5'h9 == cache_state ? 1'h0 : 5'h8 == cache_state & _GEN_480; // @[cache_single_port.scala 290:28 236:45]
  wire [127:0] _GEN_590 = 5'h9 == cache_state ? data_mem_2_io_data_read_data : _GEN_558; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_591 = 5'h9 == cache_state ? 128'h0 : _GEN_559; // @[cache_single_port.scala 290:28 240:48]
  wire  _GEN_592 = 5'h9 == cache_state ? 1'h0 : 5'h8 == cache_state & _GEN_483; // @[cache_single_port.scala 290:28 236:45]
  wire [127:0] _GEN_593 = 5'h9 == cache_state ? data_mem_3_io_data_read_data : _GEN_561; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_594 = 5'h9 == cache_state ? 128'h0 : _GEN_562; // @[cache_single_port.scala 290:28 240:48]
  wire  _GEN_595 = 5'h9 == cache_state ? 1'h0 : 5'h8 == cache_state & _GEN_486; // @[cache_single_port.scala 290:28 236:45]
  wire  _GEN_597 = 5'h9 == cache_state ? _GEN_0 : _GEN_565; // @[cache_single_port.scala 290:28]
  wire  _GEN_598 = 5'h9 == cache_state ? 1'h0 : _GEN_566; // @[cache_single_port.scala 247:28 290:28]
  wire [31:0] _GEN_600 = 5'h9 == cache_state ? cpu_request_addr_reg : _GEN_568; // @[cache_single_port.scala 290:28 248:32]
  wire  _GEN_601 = 5'h9 == cache_state ? write_addr_reg : _GEN_569; // @[cache_single_port.scala 290:28 287:37]
  wire  _GEN_602 = 5'h9 == cache_state ? 1'h0 : _GEN_570; // @[cache_single_port.scala 261:27 290:28]
  wire [63:0] _GEN_604 = 5'h9 == cache_state ? 64'h0 : _GEN_572; // @[cache_single_port.scala 290:28 263:31]
  wire  _GEN_605 = 5'h9 == cache_state ? write_data_reg : _GEN_573; // @[cache_single_port.scala 290:28 288:37]
  wire  _GEN_606 = 5'h9 == cache_state ? 1'h0 : _GEN_574; // @[cache_single_port.scala 268:27 290:28]
  wire [3:0] _GEN_608 = 5'hd == cache_state ? 4'h0 : _GEN_577; // @[cache_single_port.scala 290:28 649:36]
  wire  _GEN_609 = 5'hd == cache_state ? 1'h0 : 5'h9 == cache_state; // @[cache_single_port.scala 254:28 290:28]
  wire [31:0] _GEN_611 = 5'hd == cache_state ? cpu_request_addr_reg : _GEN_578; // @[cache_single_port.scala 290:28 255:32]
  wire  _GEN_612 = 5'hd == cache_state ? 1'h0 : _GEN_579; // @[cache_single_port.scala 266:27 290:28]
  wire [127:0] _GEN_617 = 5'hd == cache_state ? data_mem_0_io_data_read_data : _GEN_584; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_618 = 5'hd == cache_state ? 128'h0 : _GEN_585; // @[cache_single_port.scala 290:28 240:48]
  wire  _GEN_619 = 5'hd == cache_state ? 1'h0 : _GEN_586; // @[cache_single_port.scala 290:28 236:45]
  wire [127:0] _GEN_620 = 5'hd == cache_state ? data_mem_1_io_data_read_data : _GEN_587; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_621 = 5'hd == cache_state ? 128'h0 : _GEN_588; // @[cache_single_port.scala 290:28 240:48]
  wire  _GEN_622 = 5'hd == cache_state ? 1'h0 : _GEN_589; // @[cache_single_port.scala 290:28 236:45]
  wire [127:0] _GEN_623 = 5'hd == cache_state ? data_mem_2_io_data_read_data : _GEN_590; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_624 = 5'hd == cache_state ? 128'h0 : _GEN_591; // @[cache_single_port.scala 290:28 240:48]
  wire  _GEN_625 = 5'hd == cache_state ? 1'h0 : _GEN_592; // @[cache_single_port.scala 290:28 236:45]
  wire [127:0] _GEN_626 = 5'hd == cache_state ? data_mem_3_io_data_read_data : _GEN_593; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_627 = 5'hd == cache_state ? 128'h0 : _GEN_594; // @[cache_single_port.scala 290:28 240:48]
  wire  _GEN_628 = 5'hd == cache_state ? 1'h0 : _GEN_595; // @[cache_single_port.scala 290:28 236:45]
  wire  _GEN_630 = 5'hd == cache_state ? _GEN_0 : _GEN_597; // @[cache_single_port.scala 290:28]
  wire  _GEN_631 = 5'hd == cache_state ? 1'h0 : _GEN_598; // @[cache_single_port.scala 247:28 290:28]
  wire [31:0] _GEN_633 = 5'hd == cache_state ? cpu_request_addr_reg : _GEN_600; // @[cache_single_port.scala 290:28 248:32]
  wire  _GEN_634 = 5'hd == cache_state ? write_addr_reg : _GEN_601; // @[cache_single_port.scala 290:28 287:37]
  wire  _GEN_635 = 5'hd == cache_state ? 1'h0 : _GEN_602; // @[cache_single_port.scala 261:27 290:28]
  wire [63:0] _GEN_637 = 5'hd == cache_state ? 64'h0 : _GEN_604; // @[cache_single_port.scala 290:28 263:31]
  wire  _GEN_638 = 5'hd == cache_state ? write_data_reg : _GEN_605; // @[cache_single_port.scala 290:28 288:37]
  wire  _GEN_639 = 5'hd == cache_state ? 1'h0 : _GEN_606; // @[cache_single_port.scala 268:27 290:28]
  wire  _GEN_640 = 5'hc == cache_state | 5'hd == cache_state; // @[cache_single_port.scala 290:28 643:47]
  wire [63:0] _GEN_641 = 5'hc == cache_state ? tmp_response_data : 64'h0; // @[cache_single_port.scala 290:28 245:30 644:46]
  wire [3:0] _GEN_642 = 5'hc == cache_state ? 4'h0 : _GEN_608; // @[cache_single_port.scala 290:28 645:36]
  wire  _GEN_643 = 5'hc == cache_state ? 1'h0 : _GEN_609; // @[cache_single_port.scala 254:28 290:28]
  wire [31:0] _GEN_645 = 5'hc == cache_state ? cpu_request_addr_reg : _GEN_611; // @[cache_single_port.scala 290:28 255:32]
  wire  _GEN_646 = 5'hc == cache_state ? 1'h0 : _GEN_612; // @[cache_single_port.scala 266:27 290:28]
  wire [127:0] _GEN_651 = 5'hc == cache_state ? data_mem_0_io_data_read_data : _GEN_617; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_652 = 5'hc == cache_state ? 128'h0 : _GEN_618; // @[cache_single_port.scala 290:28 240:48]
  wire  _GEN_653 = 5'hc == cache_state ? 1'h0 : _GEN_619; // @[cache_single_port.scala 290:28 236:45]
  wire [127:0] _GEN_654 = 5'hc == cache_state ? data_mem_1_io_data_read_data : _GEN_620; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_655 = 5'hc == cache_state ? 128'h0 : _GEN_621; // @[cache_single_port.scala 290:28 240:48]
  wire  _GEN_656 = 5'hc == cache_state ? 1'h0 : _GEN_622; // @[cache_single_port.scala 290:28 236:45]
  wire [127:0] _GEN_657 = 5'hc == cache_state ? data_mem_2_io_data_read_data : _GEN_623; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_658 = 5'hc == cache_state ? 128'h0 : _GEN_624; // @[cache_single_port.scala 290:28 240:48]
  wire  _GEN_659 = 5'hc == cache_state ? 1'h0 : _GEN_625; // @[cache_single_port.scala 290:28 236:45]
  wire [127:0] _GEN_660 = 5'hc == cache_state ? data_mem_3_io_data_read_data : _GEN_626; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_661 = 5'hc == cache_state ? 128'h0 : _GEN_627; // @[cache_single_port.scala 290:28 240:48]
  wire  _GEN_662 = 5'hc == cache_state ? 1'h0 : _GEN_628; // @[cache_single_port.scala 290:28 236:45]
  wire  _GEN_664 = 5'hc == cache_state ? _GEN_0 : _GEN_630; // @[cache_single_port.scala 290:28]
  wire  _GEN_665 = 5'hc == cache_state ? 1'h0 : _GEN_631; // @[cache_single_port.scala 247:28 290:28]
  wire [31:0] _GEN_667 = 5'hc == cache_state ? cpu_request_addr_reg : _GEN_633; // @[cache_single_port.scala 290:28 248:32]
  wire  _GEN_668 = 5'hc == cache_state ? write_addr_reg : _GEN_634; // @[cache_single_port.scala 290:28 287:37]
  wire  _GEN_669 = 5'hc == cache_state ? 1'h0 : _GEN_635; // @[cache_single_port.scala 261:27 290:28]
  wire [63:0] _GEN_671 = 5'hc == cache_state ? 64'h0 : _GEN_637; // @[cache_single_port.scala 290:28 263:31]
  wire  _GEN_672 = 5'hc == cache_state ? write_data_reg : _GEN_638; // @[cache_single_port.scala 290:28 288:37]
  wire  _GEN_673 = 5'hc == cache_state ? 1'h0 : _GEN_639; // @[cache_single_port.scala 268:27 290:28]
  wire [63:0] _GEN_679 = 5'h6 == cache_state ? _GEN_377 : tmp_response_data; // @[cache_single_port.scala 290:28 285:40]
  wire [3:0] _GEN_680 = 5'h6 == cache_state ? _GEN_378 : _GEN_642; // @[cache_single_port.scala 290:28]
  wire  _GEN_681 = 5'h6 == cache_state ? _GEN_379 : tag_mem_0_io_tag_read_dirty; // @[cache_single_port.scala 290:28 237:41]
  wire [21:0] _GEN_682 = 5'h6 == cache_state ? _GEN_380 : tag_mem_0_io_tag_read_tag; // @[cache_single_port.scala 290:28 237:41]
  wire [7:0] _GEN_684 = 5'h6 == cache_state ? _GEN_382 : tag_mem_0_io_tag_read_visit; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_685 = 5'h6 == cache_state ? _GEN_383 : tag_mem_0_io_tag_read_valid; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_686 = 5'h6 == cache_state ? _GEN_384 : tag_mem_1_io_tag_read_dirty; // @[cache_single_port.scala 290:28 237:41]
  wire [21:0] _GEN_687 = 5'h6 == cache_state ? _GEN_385 : tag_mem_1_io_tag_read_tag; // @[cache_single_port.scala 290:28 237:41]
  wire [7:0] _GEN_689 = 5'h6 == cache_state ? _GEN_387 : tag_mem_1_io_tag_read_visit; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_690 = 5'h6 == cache_state ? _GEN_388 : tag_mem_1_io_tag_read_valid; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_691 = 5'h6 == cache_state ? _GEN_389 : tag_mem_2_io_tag_read_dirty; // @[cache_single_port.scala 290:28 237:41]
  wire [21:0] _GEN_692 = 5'h6 == cache_state ? _GEN_390 : tag_mem_2_io_tag_read_tag; // @[cache_single_port.scala 290:28 237:41]
  wire [7:0] _GEN_694 = 5'h6 == cache_state ? _GEN_392 : tag_mem_2_io_tag_read_visit; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_695 = 5'h6 == cache_state ? _GEN_393 : tag_mem_2_io_tag_read_valid; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_696 = 5'h6 == cache_state ? _GEN_394 : tag_mem_3_io_tag_read_dirty; // @[cache_single_port.scala 290:28 237:41]
  wire [21:0] _GEN_697 = 5'h6 == cache_state ? _GEN_395 : tag_mem_3_io_tag_read_tag; // @[cache_single_port.scala 290:28 237:41]
  wire [7:0] _GEN_699 = 5'h6 == cache_state ? _GEN_397 : tag_mem_3_io_tag_read_visit; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_700 = 5'h6 == cache_state ? _GEN_398 : tag_mem_3_io_tag_read_valid; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_701 = 5'h6 == cache_state ? _GEN_399 : _GEN_653; // @[cache_single_port.scala 290:28]
  wire [127:0] _GEN_704 = 5'h6 == cache_state ? _GEN_402 : _GEN_651; // @[cache_single_port.scala 290:28]
  wire [127:0] _GEN_707 = 5'h6 == cache_state ? _GEN_405 : _GEN_652; // @[cache_single_port.scala 290:28]
  wire  _GEN_708 = 5'h6 == cache_state ? _GEN_406 : _GEN_656; // @[cache_single_port.scala 290:28]
  wire [127:0] _GEN_709 = 5'h6 == cache_state ? _GEN_407 : _GEN_654; // @[cache_single_port.scala 290:28]
  wire [127:0] _GEN_710 = 5'h6 == cache_state ? _GEN_408 : _GEN_655; // @[cache_single_port.scala 290:28]
  wire  _GEN_711 = 5'h6 == cache_state ? _GEN_409 : _GEN_659; // @[cache_single_port.scala 290:28]
  wire [127:0] _GEN_712 = 5'h6 == cache_state ? _GEN_410 : _GEN_657; // @[cache_single_port.scala 290:28]
  wire [127:0] _GEN_713 = 5'h6 == cache_state ? _GEN_411 : _GEN_658; // @[cache_single_port.scala 290:28]
  wire  _GEN_714 = 5'h6 == cache_state ? _GEN_412 : _GEN_662; // @[cache_single_port.scala 290:28]
  wire [127:0] _GEN_715 = 5'h6 == cache_state ? _GEN_413 : _GEN_660; // @[cache_single_port.scala 290:28]
  wire [127:0] _GEN_716 = 5'h6 == cache_state ? _GEN_414 : _GEN_661; // @[cache_single_port.scala 290:28]
  wire [1:0] _GEN_725 = 5'h6 == cache_state ? _GEN_423 : replace; // @[cache_single_port.scala 290:28 165:30]
  wire [31:0] _GEN_726 = 5'h6 == cache_state ? _GEN_424 : refill_addr; // @[cache_single_port.scala 290:28 166:34]
  wire [31:0] _GEN_727 = 5'h6 == cache_state ? _GEN_425 : writeback_addr; // @[cache_single_port.scala 290:28 167:37]
  wire  _GEN_728 = 5'h6 == cache_state ? 1'h0 : _GEN_640; // @[cache_single_port.scala 290:28 244:31]
  wire [63:0] _GEN_729 = 5'h6 == cache_state ? 64'h0 : _GEN_641; // @[cache_single_port.scala 290:28 245:30]
  wire  _GEN_730 = 5'h6 == cache_state ? 1'h0 : _GEN_643; // @[cache_single_port.scala 254:28 290:28]
  wire [31:0] _GEN_732 = 5'h6 == cache_state ? cpu_request_addr_reg : _GEN_645; // @[cache_single_port.scala 290:28 255:32]
  wire  _GEN_733 = 5'h6 == cache_state ? 1'h0 : _GEN_646; // @[cache_single_port.scala 266:27 290:28]
  wire  _GEN_735 = 5'h6 == cache_state ? _GEN_0 : _GEN_664; // @[cache_single_port.scala 290:28]
  wire  _GEN_736 = 5'h6 == cache_state ? 1'h0 : _GEN_665; // @[cache_single_port.scala 247:28 290:28]
  wire [31:0] _GEN_738 = 5'h6 == cache_state ? cpu_request_addr_reg : _GEN_667; // @[cache_single_port.scala 290:28 248:32]
  wire  _GEN_739 = 5'h6 == cache_state ? write_addr_reg : _GEN_668; // @[cache_single_port.scala 290:28 287:37]
  wire  _GEN_740 = 5'h6 == cache_state ? 1'h0 : _GEN_669; // @[cache_single_port.scala 261:27 290:28]
  wire [63:0] _GEN_742 = 5'h6 == cache_state ? 64'h0 : _GEN_671; // @[cache_single_port.scala 290:28 263:31]
  wire  _GEN_743 = 5'h6 == cache_state ? write_data_reg : _GEN_672; // @[cache_single_port.scala 290:28 288:37]
  wire  _GEN_744 = 5'h6 == cache_state ? 1'h0 : _GEN_673; // @[cache_single_port.scala 268:27 290:28]
  wire  _GEN_745 = 5'h5 == cache_state | _GEN_744; // @[cache_single_port.scala 290:28 521:43]
  wire  _GEN_746 = 5'h5 == cache_state ? io_mem_io_b_valid : _GEN_728; // @[cache_single_port.scala 290:28]
  wire [3:0] _GEN_747 = 5'h5 == cache_state ? {{1'd0}, _GEN_208} : _GEN_680; // @[cache_single_port.scala 290:28]
  wire [63:0] _GEN_753 = 5'h5 == cache_state ? tmp_response_data : _GEN_679; // @[cache_single_port.scala 290:28 285:40]
  wire  _GEN_754 = 5'h5 == cache_state ? tag_mem_0_io_tag_read_dirty : _GEN_681; // @[cache_single_port.scala 290:28 237:41]
  wire [21:0] _GEN_755 = 5'h5 == cache_state ? tag_mem_0_io_tag_read_tag : _GEN_682; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_756 = 5'h5 == cache_state ? 1'h0 : 5'h6 == cache_state & _GEN_381; // @[cache_single_port.scala 290:28 235:44]
  wire [7:0] _GEN_757 = 5'h5 == cache_state ? tag_mem_0_io_tag_read_visit : _GEN_684; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_758 = 5'h5 == cache_state ? tag_mem_0_io_tag_read_valid : _GEN_685; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_759 = 5'h5 == cache_state ? tag_mem_1_io_tag_read_dirty : _GEN_686; // @[cache_single_port.scala 290:28 237:41]
  wire [21:0] _GEN_760 = 5'h5 == cache_state ? tag_mem_1_io_tag_read_tag : _GEN_687; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_761 = 5'h5 == cache_state ? 1'h0 : 5'h6 == cache_state & _GEN_386; // @[cache_single_port.scala 290:28 235:44]
  wire [7:0] _GEN_762 = 5'h5 == cache_state ? tag_mem_1_io_tag_read_visit : _GEN_689; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_763 = 5'h5 == cache_state ? tag_mem_1_io_tag_read_valid : _GEN_690; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_764 = 5'h5 == cache_state ? tag_mem_2_io_tag_read_dirty : _GEN_691; // @[cache_single_port.scala 290:28 237:41]
  wire [21:0] _GEN_765 = 5'h5 == cache_state ? tag_mem_2_io_tag_read_tag : _GEN_692; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_766 = 5'h5 == cache_state ? 1'h0 : 5'h6 == cache_state & _GEN_391; // @[cache_single_port.scala 290:28 235:44]
  wire [7:0] _GEN_767 = 5'h5 == cache_state ? tag_mem_2_io_tag_read_visit : _GEN_694; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_768 = 5'h5 == cache_state ? tag_mem_2_io_tag_read_valid : _GEN_695; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_769 = 5'h5 == cache_state ? tag_mem_3_io_tag_read_dirty : _GEN_696; // @[cache_single_port.scala 290:28 237:41]
  wire [21:0] _GEN_770 = 5'h5 == cache_state ? tag_mem_3_io_tag_read_tag : _GEN_697; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_771 = 5'h5 == cache_state ? 1'h0 : 5'h6 == cache_state & _GEN_396; // @[cache_single_port.scala 290:28 235:44]
  wire [7:0] _GEN_772 = 5'h5 == cache_state ? tag_mem_3_io_tag_read_visit : _GEN_699; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_773 = 5'h5 == cache_state ? tag_mem_3_io_tag_read_valid : _GEN_700; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_774 = 5'h5 == cache_state ? 1'h0 : _GEN_701; // @[cache_single_port.scala 290:28 236:45]
  wire [127:0] _GEN_777 = 5'h5 == cache_state ? data_mem_0_io_data_read_data : _GEN_704; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_780 = 5'h5 == cache_state ? 128'h0 : _GEN_707; // @[cache_single_port.scala 290:28 240:48]
  wire  _GEN_781 = 5'h5 == cache_state ? 1'h0 : _GEN_708; // @[cache_single_port.scala 290:28 236:45]
  wire [127:0] _GEN_782 = 5'h5 == cache_state ? data_mem_1_io_data_read_data : _GEN_709; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_783 = 5'h5 == cache_state ? 128'h0 : _GEN_710; // @[cache_single_port.scala 290:28 240:48]
  wire  _GEN_784 = 5'h5 == cache_state ? 1'h0 : _GEN_711; // @[cache_single_port.scala 290:28 236:45]
  wire [127:0] _GEN_785 = 5'h5 == cache_state ? data_mem_2_io_data_read_data : _GEN_712; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_786 = 5'h5 == cache_state ? 128'h0 : _GEN_713; // @[cache_single_port.scala 290:28 240:48]
  wire  _GEN_787 = 5'h5 == cache_state ? 1'h0 : _GEN_714; // @[cache_single_port.scala 290:28 236:45]
  wire [127:0] _GEN_788 = 5'h5 == cache_state ? data_mem_3_io_data_read_data : _GEN_715; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_789 = 5'h5 == cache_state ? 128'h0 : _GEN_716; // @[cache_single_port.scala 290:28 240:48]
  wire [1:0] _GEN_798 = 5'h5 == cache_state ? replace : _GEN_725; // @[cache_single_port.scala 290:28 165:30]
  wire [31:0] _GEN_799 = 5'h5 == cache_state ? refill_addr : _GEN_726; // @[cache_single_port.scala 290:28 166:34]
  wire [31:0] _GEN_800 = 5'h5 == cache_state ? writeback_addr : _GEN_727; // @[cache_single_port.scala 290:28 167:37]
  wire [63:0] _GEN_801 = 5'h5 == cache_state ? 64'h0 : _GEN_729; // @[cache_single_port.scala 290:28 245:30]
  wire  _GEN_802 = 5'h5 == cache_state ? 1'h0 : _GEN_730; // @[cache_single_port.scala 254:28 290:28]
  wire [31:0] _GEN_804 = 5'h5 == cache_state ? cpu_request_addr_reg : _GEN_732; // @[cache_single_port.scala 290:28 255:32]
  wire  _GEN_805 = 5'h5 == cache_state ? 1'h0 : _GEN_733; // @[cache_single_port.scala 266:27 290:28]
  wire  _GEN_807 = 5'h5 == cache_state ? _GEN_0 : _GEN_735; // @[cache_single_port.scala 290:28]
  wire  _GEN_808 = 5'h5 == cache_state ? 1'h0 : _GEN_736; // @[cache_single_port.scala 247:28 290:28]
  wire [31:0] _GEN_810 = 5'h5 == cache_state ? cpu_request_addr_reg : _GEN_738; // @[cache_single_port.scala 290:28 248:32]
  wire  _GEN_811 = 5'h5 == cache_state ? write_addr_reg : _GEN_739; // @[cache_single_port.scala 290:28 287:37]
  wire  _GEN_812 = 5'h5 == cache_state ? 1'h0 : _GEN_740; // @[cache_single_port.scala 261:27 290:28]
  wire [63:0] _GEN_814 = 5'h5 == cache_state ? 64'h0 : _GEN_742; // @[cache_single_port.scala 290:28 263:31]
  wire  _GEN_815 = 5'h5 == cache_state ? write_data_reg : _GEN_743; // @[cache_single_port.scala 290:28 288:37]
  wire [3:0] _GEN_816 = 5'h4 == cache_state ? {{1'd0}, _GEN_204} : _GEN_747; // @[cache_single_port.scala 290:28]
  wire  _GEN_817 = 5'h4 == cache_state ? _T_35 : _GEN_808; // @[cache_single_port.scala 290:28]
  wire  _GEN_818 = 5'h4 == cache_state ? _GEN_196 : 1'h1; // @[cache_single_port.scala 290:28]
  wire [1:0] _GEN_819 = 5'h4 == cache_state ? _GEN_197 : 2'h3; // @[cache_single_port.scala 290:28 250:32]
  wire [31:0] _GEN_820 = 5'h4 == cache_state ? _GEN_198 : _GEN_810; // @[cache_single_port.scala 290:28]
  wire  _GEN_821 = 5'h4 == cache_state ? _GEN_177 : _GEN_811; // @[cache_single_port.scala 290:28]
  wire  _GEN_822 = 5'h4 == cache_state ? _T_40 : _GEN_812; // @[cache_single_port.scala 290:28]
  wire  _GEN_823 = 5'h4 == cache_state ? _GEN_200 : last; // @[cache_single_port.scala 290:28 264:31]
  wire [63:0] _GEN_824 = 5'h4 == cache_state ? _GEN_201 : _GEN_814; // @[cache_single_port.scala 290:28]
  wire [7:0] _GEN_825 = 5'h4 == cache_state ? _GEN_202 : 8'hff; // @[cache_single_port.scala 290:28]
  wire  _GEN_826 = 5'h4 == cache_state ? _GEN_206 : _GEN_815; // @[cache_single_port.scala 290:28]
  wire  _GEN_827 = 5'h4 == cache_state ? 1'h0 : _GEN_745; // @[cache_single_port.scala 268:27 290:28]
  wire  _GEN_828 = 5'h4 == cache_state ? 1'h0 : _GEN_746; // @[cache_single_port.scala 290:28 244:31]
  wire [63:0] _GEN_834 = 5'h4 == cache_state ? tmp_response_data : _GEN_753; // @[cache_single_port.scala 290:28 285:40]
  wire  _GEN_835 = 5'h4 == cache_state ? tag_mem_0_io_tag_read_dirty : _GEN_754; // @[cache_single_port.scala 290:28 237:41]
  wire [21:0] _GEN_836 = 5'h4 == cache_state ? tag_mem_0_io_tag_read_tag : _GEN_755; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_837 = 5'h4 == cache_state ? 1'h0 : _GEN_756; // @[cache_single_port.scala 290:28 235:44]
  wire [7:0] _GEN_838 = 5'h4 == cache_state ? tag_mem_0_io_tag_read_visit : _GEN_757; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_839 = 5'h4 == cache_state ? tag_mem_0_io_tag_read_valid : _GEN_758; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_840 = 5'h4 == cache_state ? tag_mem_1_io_tag_read_dirty : _GEN_759; // @[cache_single_port.scala 290:28 237:41]
  wire [21:0] _GEN_841 = 5'h4 == cache_state ? tag_mem_1_io_tag_read_tag : _GEN_760; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_842 = 5'h4 == cache_state ? 1'h0 : _GEN_761; // @[cache_single_port.scala 290:28 235:44]
  wire [7:0] _GEN_843 = 5'h4 == cache_state ? tag_mem_1_io_tag_read_visit : _GEN_762; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_844 = 5'h4 == cache_state ? tag_mem_1_io_tag_read_valid : _GEN_763; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_845 = 5'h4 == cache_state ? tag_mem_2_io_tag_read_dirty : _GEN_764; // @[cache_single_port.scala 290:28 237:41]
  wire [21:0] _GEN_846 = 5'h4 == cache_state ? tag_mem_2_io_tag_read_tag : _GEN_765; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_847 = 5'h4 == cache_state ? 1'h0 : _GEN_766; // @[cache_single_port.scala 290:28 235:44]
  wire [7:0] _GEN_848 = 5'h4 == cache_state ? tag_mem_2_io_tag_read_visit : _GEN_767; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_849 = 5'h4 == cache_state ? tag_mem_2_io_tag_read_valid : _GEN_768; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_850 = 5'h4 == cache_state ? tag_mem_3_io_tag_read_dirty : _GEN_769; // @[cache_single_port.scala 290:28 237:41]
  wire [21:0] _GEN_851 = 5'h4 == cache_state ? tag_mem_3_io_tag_read_tag : _GEN_770; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_852 = 5'h4 == cache_state ? 1'h0 : _GEN_771; // @[cache_single_port.scala 290:28 235:44]
  wire [7:0] _GEN_853 = 5'h4 == cache_state ? tag_mem_3_io_tag_read_visit : _GEN_772; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_854 = 5'h4 == cache_state ? tag_mem_3_io_tag_read_valid : _GEN_773; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_855 = 5'h4 == cache_state ? 1'h0 : _GEN_774; // @[cache_single_port.scala 290:28 236:45]
  wire [127:0] _GEN_858 = 5'h4 == cache_state ? data_mem_0_io_data_read_data : _GEN_777; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_861 = 5'h4 == cache_state ? 128'h0 : _GEN_780; // @[cache_single_port.scala 290:28 240:48]
  wire  _GEN_862 = 5'h4 == cache_state ? 1'h0 : _GEN_781; // @[cache_single_port.scala 290:28 236:45]
  wire [127:0] _GEN_863 = 5'h4 == cache_state ? data_mem_1_io_data_read_data : _GEN_782; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_864 = 5'h4 == cache_state ? 128'h0 : _GEN_783; // @[cache_single_port.scala 290:28 240:48]
  wire  _GEN_865 = 5'h4 == cache_state ? 1'h0 : _GEN_784; // @[cache_single_port.scala 290:28 236:45]
  wire [127:0] _GEN_866 = 5'h4 == cache_state ? data_mem_2_io_data_read_data : _GEN_785; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_867 = 5'h4 == cache_state ? 128'h0 : _GEN_786; // @[cache_single_port.scala 290:28 240:48]
  wire  _GEN_868 = 5'h4 == cache_state ? 1'h0 : _GEN_787; // @[cache_single_port.scala 290:28 236:45]
  wire [127:0] _GEN_869 = 5'h4 == cache_state ? data_mem_3_io_data_read_data : _GEN_788; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_870 = 5'h4 == cache_state ? 128'h0 : _GEN_789; // @[cache_single_port.scala 290:28 240:48]
  wire [1:0] _GEN_879 = 5'h4 == cache_state ? replace : _GEN_798; // @[cache_single_port.scala 290:28 165:30]
  wire [31:0] _GEN_880 = 5'h4 == cache_state ? refill_addr : _GEN_799; // @[cache_single_port.scala 290:28 166:34]
  wire [31:0] _GEN_881 = 5'h4 == cache_state ? writeback_addr : _GEN_800; // @[cache_single_port.scala 290:28 167:37]
  wire [63:0] _GEN_882 = 5'h4 == cache_state ? 64'h0 : _GEN_801; // @[cache_single_port.scala 290:28 245:30]
  wire  _GEN_883 = 5'h4 == cache_state ? 1'h0 : _GEN_802; // @[cache_single_port.scala 254:28 290:28]
  wire [31:0] _GEN_885 = 5'h4 == cache_state ? cpu_request_addr_reg : _GEN_804; // @[cache_single_port.scala 290:28 255:32]
  wire  _GEN_886 = 5'h4 == cache_state ? 1'h0 : _GEN_805; // @[cache_single_port.scala 266:27 290:28]
  wire  _GEN_888 = 5'h4 == cache_state ? _GEN_0 : _GEN_807; // @[cache_single_port.scala 290:28]
  wire [63:0] _GEN_889 = 5'h3 == cache_state ? io_mem_io_r_bits_data : _GEN_882; // @[cache_single_port.scala 290:28 468:46]
  wire  _GEN_890 = 5'h3 == cache_state | _GEN_886; // @[cache_single_port.scala 290:28 469:43]
  wire [3:0] _GEN_891 = 5'h3 == cache_state ? {{2'd0}, _GEN_193} : _GEN_816; // @[cache_single_port.scala 290:28]
  wire  _GEN_892 = 5'h3 == cache_state ? io_mem_io_r_valid : _GEN_828; // @[cache_single_port.scala 290:28]
  wire  _GEN_893 = 5'h3 == cache_state ? 1'h0 : _GEN_817; // @[cache_single_port.scala 247:28 290:28]
  wire [1:0] _GEN_895 = 5'h3 == cache_state ? 2'h3 : _GEN_819; // @[cache_single_port.scala 290:28 250:32]
  wire [31:0] _GEN_896 = 5'h3 == cache_state ? cpu_request_addr_reg : _GEN_820; // @[cache_single_port.scala 290:28 248:32]
  wire  _GEN_897 = 5'h3 == cache_state ? write_addr_reg : _GEN_821; // @[cache_single_port.scala 290:28 287:37]
  wire  _GEN_898 = 5'h3 == cache_state ? 1'h0 : _GEN_822; // @[cache_single_port.scala 261:27 290:28]
  wire  _GEN_899 = 5'h3 == cache_state ? last : _GEN_823; // @[cache_single_port.scala 290:28 264:31]
  wire [63:0] _GEN_900 = 5'h3 == cache_state ? 64'h0 : _GEN_824; // @[cache_single_port.scala 290:28 263:31]
  wire [7:0] _GEN_901 = 5'h3 == cache_state ? 8'hff : _GEN_825; // @[cache_single_port.scala 290:28 262:31]
  wire  _GEN_902 = 5'h3 == cache_state ? write_data_reg : _GEN_826; // @[cache_single_port.scala 290:28 288:37]
  wire  _GEN_903 = 5'h3 == cache_state ? 1'h0 : _GEN_827; // @[cache_single_port.scala 268:27 290:28]
  wire [63:0] _GEN_909 = 5'h3 == cache_state ? tmp_response_data : _GEN_834; // @[cache_single_port.scala 290:28 285:40]
  wire  _GEN_910 = 5'h3 == cache_state ? tag_mem_0_io_tag_read_dirty : _GEN_835; // @[cache_single_port.scala 290:28 237:41]
  wire [21:0] _GEN_911 = 5'h3 == cache_state ? tag_mem_0_io_tag_read_tag : _GEN_836; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_912 = 5'h3 == cache_state ? 1'h0 : _GEN_837; // @[cache_single_port.scala 290:28 235:44]
  wire [7:0] _GEN_913 = 5'h3 == cache_state ? tag_mem_0_io_tag_read_visit : _GEN_838; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_914 = 5'h3 == cache_state ? tag_mem_0_io_tag_read_valid : _GEN_839; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_915 = 5'h3 == cache_state ? tag_mem_1_io_tag_read_dirty : _GEN_840; // @[cache_single_port.scala 290:28 237:41]
  wire [21:0] _GEN_916 = 5'h3 == cache_state ? tag_mem_1_io_tag_read_tag : _GEN_841; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_917 = 5'h3 == cache_state ? 1'h0 : _GEN_842; // @[cache_single_port.scala 290:28 235:44]
  wire [7:0] _GEN_918 = 5'h3 == cache_state ? tag_mem_1_io_tag_read_visit : _GEN_843; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_919 = 5'h3 == cache_state ? tag_mem_1_io_tag_read_valid : _GEN_844; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_920 = 5'h3 == cache_state ? tag_mem_2_io_tag_read_dirty : _GEN_845; // @[cache_single_port.scala 290:28 237:41]
  wire [21:0] _GEN_921 = 5'h3 == cache_state ? tag_mem_2_io_tag_read_tag : _GEN_846; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_922 = 5'h3 == cache_state ? 1'h0 : _GEN_847; // @[cache_single_port.scala 290:28 235:44]
  wire [7:0] _GEN_923 = 5'h3 == cache_state ? tag_mem_2_io_tag_read_visit : _GEN_848; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_924 = 5'h3 == cache_state ? tag_mem_2_io_tag_read_valid : _GEN_849; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_925 = 5'h3 == cache_state ? tag_mem_3_io_tag_read_dirty : _GEN_850; // @[cache_single_port.scala 290:28 237:41]
  wire [21:0] _GEN_926 = 5'h3 == cache_state ? tag_mem_3_io_tag_read_tag : _GEN_851; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_927 = 5'h3 == cache_state ? 1'h0 : _GEN_852; // @[cache_single_port.scala 290:28 235:44]
  wire [7:0] _GEN_928 = 5'h3 == cache_state ? tag_mem_3_io_tag_read_visit : _GEN_853; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_929 = 5'h3 == cache_state ? tag_mem_3_io_tag_read_valid : _GEN_854; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_930 = 5'h3 == cache_state ? 1'h0 : _GEN_855; // @[cache_single_port.scala 290:28 236:45]
  wire [127:0] _GEN_933 = 5'h3 == cache_state ? data_mem_0_io_data_read_data : _GEN_858; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_936 = 5'h3 == cache_state ? 128'h0 : _GEN_861; // @[cache_single_port.scala 290:28 240:48]
  wire  _GEN_937 = 5'h3 == cache_state ? 1'h0 : _GEN_862; // @[cache_single_port.scala 290:28 236:45]
  wire [127:0] _GEN_938 = 5'h3 == cache_state ? data_mem_1_io_data_read_data : _GEN_863; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_939 = 5'h3 == cache_state ? 128'h0 : _GEN_864; // @[cache_single_port.scala 290:28 240:48]
  wire  _GEN_940 = 5'h3 == cache_state ? 1'h0 : _GEN_865; // @[cache_single_port.scala 290:28 236:45]
  wire [127:0] _GEN_941 = 5'h3 == cache_state ? data_mem_2_io_data_read_data : _GEN_866; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_942 = 5'h3 == cache_state ? 128'h0 : _GEN_867; // @[cache_single_port.scala 290:28 240:48]
  wire  _GEN_943 = 5'h3 == cache_state ? 1'h0 : _GEN_868; // @[cache_single_port.scala 290:28 236:45]
  wire [127:0] _GEN_944 = 5'h3 == cache_state ? data_mem_3_io_data_read_data : _GEN_869; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_945 = 5'h3 == cache_state ? 128'h0 : _GEN_870; // @[cache_single_port.scala 290:28 240:48]
  wire [1:0] _GEN_954 = 5'h3 == cache_state ? replace : _GEN_879; // @[cache_single_port.scala 290:28 165:30]
  wire [31:0] _GEN_955 = 5'h3 == cache_state ? refill_addr : _GEN_880; // @[cache_single_port.scala 290:28 166:34]
  wire [31:0] _GEN_956 = 5'h3 == cache_state ? writeback_addr : _GEN_881; // @[cache_single_port.scala 290:28 167:37]
  wire  _GEN_957 = 5'h3 == cache_state ? 1'h0 : _GEN_883; // @[cache_single_port.scala 254:28 290:28]
  wire [31:0] _GEN_959 = 5'h3 == cache_state ? cpu_request_addr_reg : _GEN_885; // @[cache_single_port.scala 290:28 255:32]
  wire  _GEN_961 = 5'h3 == cache_state ? _GEN_0 : _GEN_888; // @[cache_single_port.scala 290:28]
  wire  _GEN_962 = 5'h1 == cache_state | _GEN_957; // @[cache_single_port.scala 290:28 456:44]
  wire  _GEN_963 = 5'h1 == cache_state ? 1'h0 : 1'h1; // @[cache_single_port.scala 290:28 457:47]
  wire [1:0] _GEN_964 = 5'h1 == cache_state ? cpu_request_accessType : 2'h3; // @[cache_single_port.scala 290:28 257:32 458:48]
  wire [31:0] _GEN_965 = 5'h1 == cache_state ? cpu_request_addr_reg_origin : _GEN_959; // @[cache_single_port.scala 290:28 459:48]
  wire [3:0] _GEN_966 = 5'h1 == cache_state ? {{2'd0}, _GEN_192} : _GEN_891; // @[cache_single_port.scala 290:28]
  wire [63:0] _GEN_967 = 5'h1 == cache_state ? 64'h0 : _GEN_889; // @[cache_single_port.scala 290:28 245:30]
  wire  _GEN_968 = 5'h1 == cache_state ? 1'h0 : _GEN_890; // @[cache_single_port.scala 266:27 290:28]
  wire  _GEN_969 = 5'h1 == cache_state ? 1'h0 : _GEN_892; // @[cache_single_port.scala 290:28 244:31]
  wire  _GEN_970 = 5'h1 == cache_state ? 1'h0 : _GEN_893; // @[cache_single_port.scala 247:28 290:28]
  wire [1:0] _GEN_972 = 5'h1 == cache_state ? 2'h3 : _GEN_895; // @[cache_single_port.scala 290:28 250:32]
  wire [31:0] _GEN_973 = 5'h1 == cache_state ? cpu_request_addr_reg : _GEN_896; // @[cache_single_port.scala 290:28 248:32]
  wire  _GEN_974 = 5'h1 == cache_state ? write_addr_reg : _GEN_897; // @[cache_single_port.scala 290:28 287:37]
  wire  _GEN_975 = 5'h1 == cache_state ? 1'h0 : _GEN_898; // @[cache_single_port.scala 261:27 290:28]
  wire  _GEN_976 = 5'h1 == cache_state ? last : _GEN_899; // @[cache_single_port.scala 290:28 264:31]
  wire [63:0] _GEN_977 = 5'h1 == cache_state ? 64'h0 : _GEN_900; // @[cache_single_port.scala 290:28 263:31]
  wire [7:0] _GEN_978 = 5'h1 == cache_state ? 8'hff : _GEN_901; // @[cache_single_port.scala 290:28 262:31]
  wire  _GEN_979 = 5'h1 == cache_state ? write_data_reg : _GEN_902; // @[cache_single_port.scala 290:28 288:37]
  wire  _GEN_980 = 5'h1 == cache_state ? 1'h0 : _GEN_903; // @[cache_single_port.scala 268:27 290:28]
  wire [63:0] _GEN_986 = 5'h1 == cache_state ? tmp_response_data : _GEN_909; // @[cache_single_port.scala 290:28 285:40]
  wire  _GEN_987 = 5'h1 == cache_state ? tag_mem_0_io_tag_read_dirty : _GEN_910; // @[cache_single_port.scala 290:28 237:41]
  wire [21:0] _GEN_988 = 5'h1 == cache_state ? tag_mem_0_io_tag_read_tag : _GEN_911; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_989 = 5'h1 == cache_state ? 1'h0 : _GEN_912; // @[cache_single_port.scala 290:28 235:44]
  wire [7:0] _GEN_990 = 5'h1 == cache_state ? tag_mem_0_io_tag_read_visit : _GEN_913; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_991 = 5'h1 == cache_state ? tag_mem_0_io_tag_read_valid : _GEN_914; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_992 = 5'h1 == cache_state ? tag_mem_1_io_tag_read_dirty : _GEN_915; // @[cache_single_port.scala 290:28 237:41]
  wire [21:0] _GEN_993 = 5'h1 == cache_state ? tag_mem_1_io_tag_read_tag : _GEN_916; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_994 = 5'h1 == cache_state ? 1'h0 : _GEN_917; // @[cache_single_port.scala 290:28 235:44]
  wire [7:0] _GEN_995 = 5'h1 == cache_state ? tag_mem_1_io_tag_read_visit : _GEN_918; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_996 = 5'h1 == cache_state ? tag_mem_1_io_tag_read_valid : _GEN_919; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_997 = 5'h1 == cache_state ? tag_mem_2_io_tag_read_dirty : _GEN_920; // @[cache_single_port.scala 290:28 237:41]
  wire [21:0] _GEN_998 = 5'h1 == cache_state ? tag_mem_2_io_tag_read_tag : _GEN_921; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_999 = 5'h1 == cache_state ? 1'h0 : _GEN_922; // @[cache_single_port.scala 290:28 235:44]
  wire [7:0] _GEN_1000 = 5'h1 == cache_state ? tag_mem_2_io_tag_read_visit : _GEN_923; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1001 = 5'h1 == cache_state ? tag_mem_2_io_tag_read_valid : _GEN_924; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1002 = 5'h1 == cache_state ? tag_mem_3_io_tag_read_dirty : _GEN_925; // @[cache_single_port.scala 290:28 237:41]
  wire [21:0] _GEN_1003 = 5'h1 == cache_state ? tag_mem_3_io_tag_read_tag : _GEN_926; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1004 = 5'h1 == cache_state ? 1'h0 : _GEN_927; // @[cache_single_port.scala 290:28 235:44]
  wire [7:0] _GEN_1005 = 5'h1 == cache_state ? tag_mem_3_io_tag_read_visit : _GEN_928; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1006 = 5'h1 == cache_state ? tag_mem_3_io_tag_read_valid : _GEN_929; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1007 = 5'h1 == cache_state ? 1'h0 : _GEN_930; // @[cache_single_port.scala 290:28 236:45]
  wire [127:0] _GEN_1010 = 5'h1 == cache_state ? data_mem_0_io_data_read_data : _GEN_933; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_1013 = 5'h1 == cache_state ? 128'h0 : _GEN_936; // @[cache_single_port.scala 290:28 240:48]
  wire  _GEN_1014 = 5'h1 == cache_state ? 1'h0 : _GEN_937; // @[cache_single_port.scala 290:28 236:45]
  wire [127:0] _GEN_1015 = 5'h1 == cache_state ? data_mem_1_io_data_read_data : _GEN_938; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_1016 = 5'h1 == cache_state ? 128'h0 : _GEN_939; // @[cache_single_port.scala 290:28 240:48]
  wire  _GEN_1017 = 5'h1 == cache_state ? 1'h0 : _GEN_940; // @[cache_single_port.scala 290:28 236:45]
  wire [127:0] _GEN_1018 = 5'h1 == cache_state ? data_mem_2_io_data_read_data : _GEN_941; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_1019 = 5'h1 == cache_state ? 128'h0 : _GEN_942; // @[cache_single_port.scala 290:28 240:48]
  wire  _GEN_1020 = 5'h1 == cache_state ? 1'h0 : _GEN_943; // @[cache_single_port.scala 290:28 236:45]
  wire [127:0] _GEN_1021 = 5'h1 == cache_state ? data_mem_3_io_data_read_data : _GEN_944; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_1022 = 5'h1 == cache_state ? 128'h0 : _GEN_945; // @[cache_single_port.scala 290:28 240:48]
  wire [1:0] _GEN_1031 = 5'h1 == cache_state ? replace : _GEN_954; // @[cache_single_port.scala 290:28 165:30]
  wire [31:0] _GEN_1032 = 5'h1 == cache_state ? refill_addr : _GEN_955; // @[cache_single_port.scala 290:28 166:34]
  wire [31:0] _GEN_1033 = 5'h1 == cache_state ? writeback_addr : _GEN_956; // @[cache_single_port.scala 290:28 167:37]
  wire  _GEN_1035 = 5'h1 == cache_state ? _GEN_0 : _GEN_961; // @[cache_single_port.scala 290:28]
  wire  _GEN_1036 = 5'h13 == cache_state | _GEN_980; // @[cache_single_port.scala 290:28 438:43]
  wire [4:0] _GEN_1037 = 5'h13 == cache_state ? _GEN_187 : {{1'd0}, _GEN_966}; // @[cache_single_port.scala 290:28]
  wire [1:0] _GEN_1039 = 5'h13 == cache_state ? _GEN_189 : _GEN_4; // @[cache_single_port.scala 290:28]
  wire  _GEN_1040 = 5'h13 == cache_state ? _GEN_190 : flush_over; // @[cache_single_port.scala 290:28 280:33]
  wire  _GEN_1042 = 5'h13 == cache_state ? 1'h0 : _GEN_962; // @[cache_single_port.scala 254:28 290:28]
  wire [1:0] _GEN_1044 = 5'h13 == cache_state ? 2'h3 : _GEN_964; // @[cache_single_port.scala 290:28 257:32]
  wire [31:0] _GEN_1045 = 5'h13 == cache_state ? cpu_request_addr_reg : _GEN_965; // @[cache_single_port.scala 290:28 255:32]
  wire [63:0] _GEN_1046 = 5'h13 == cache_state ? 64'h0 : _GEN_967; // @[cache_single_port.scala 290:28 245:30]
  wire  _GEN_1047 = 5'h13 == cache_state ? 1'h0 : _GEN_968; // @[cache_single_port.scala 266:27 290:28]
  wire  _GEN_1048 = 5'h13 == cache_state ? 1'h0 : _GEN_969; // @[cache_single_port.scala 290:28 244:31]
  wire  _GEN_1049 = 5'h13 == cache_state ? 1'h0 : _GEN_970; // @[cache_single_port.scala 247:28 290:28]
  wire  _GEN_1050 = 5'h13 == cache_state | (5'h1 == cache_state | (5'h3 == cache_state | _GEN_818)); // @[cache_single_port.scala 290:28 249:31]
  wire [1:0] _GEN_1051 = 5'h13 == cache_state ? 2'h3 : _GEN_972; // @[cache_single_port.scala 290:28 250:32]
  wire [31:0] _GEN_1052 = 5'h13 == cache_state ? cpu_request_addr_reg : _GEN_973; // @[cache_single_port.scala 290:28 248:32]
  wire  _GEN_1053 = 5'h13 == cache_state ? write_addr_reg : _GEN_974; // @[cache_single_port.scala 290:28 287:37]
  wire  _GEN_1054 = 5'h13 == cache_state ? 1'h0 : _GEN_975; // @[cache_single_port.scala 261:27 290:28]
  wire  _GEN_1055 = 5'h13 == cache_state ? last : _GEN_976; // @[cache_single_port.scala 290:28 264:31]
  wire [63:0] _GEN_1056 = 5'h13 == cache_state ? 64'h0 : _GEN_977; // @[cache_single_port.scala 290:28 263:31]
  wire [7:0] _GEN_1057 = 5'h13 == cache_state ? 8'hff : _GEN_978; // @[cache_single_port.scala 290:28 262:31]
  wire  _GEN_1058 = 5'h13 == cache_state ? write_data_reg : _GEN_979; // @[cache_single_port.scala 290:28 288:37]
  wire [63:0] _GEN_1064 = 5'h13 == cache_state ? tmp_response_data : _GEN_986; // @[cache_single_port.scala 290:28 285:40]
  wire  _GEN_1065 = 5'h13 == cache_state ? tag_mem_0_io_tag_read_dirty : _GEN_987; // @[cache_single_port.scala 290:28 237:41]
  wire [21:0] _GEN_1066 = 5'h13 == cache_state ? tag_mem_0_io_tag_read_tag : _GEN_988; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1067 = 5'h13 == cache_state ? 1'h0 : _GEN_989; // @[cache_single_port.scala 290:28 235:44]
  wire [7:0] _GEN_1068 = 5'h13 == cache_state ? tag_mem_0_io_tag_read_visit : _GEN_990; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1069 = 5'h13 == cache_state ? tag_mem_0_io_tag_read_valid : _GEN_991; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1070 = 5'h13 == cache_state ? tag_mem_1_io_tag_read_dirty : _GEN_992; // @[cache_single_port.scala 290:28 237:41]
  wire [21:0] _GEN_1071 = 5'h13 == cache_state ? tag_mem_1_io_tag_read_tag : _GEN_993; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1072 = 5'h13 == cache_state ? 1'h0 : _GEN_994; // @[cache_single_port.scala 290:28 235:44]
  wire [7:0] _GEN_1073 = 5'h13 == cache_state ? tag_mem_1_io_tag_read_visit : _GEN_995; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1074 = 5'h13 == cache_state ? tag_mem_1_io_tag_read_valid : _GEN_996; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1075 = 5'h13 == cache_state ? tag_mem_2_io_tag_read_dirty : _GEN_997; // @[cache_single_port.scala 290:28 237:41]
  wire [21:0] _GEN_1076 = 5'h13 == cache_state ? tag_mem_2_io_tag_read_tag : _GEN_998; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1077 = 5'h13 == cache_state ? 1'h0 : _GEN_999; // @[cache_single_port.scala 290:28 235:44]
  wire [7:0] _GEN_1078 = 5'h13 == cache_state ? tag_mem_2_io_tag_read_visit : _GEN_1000; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1079 = 5'h13 == cache_state ? tag_mem_2_io_tag_read_valid : _GEN_1001; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1080 = 5'h13 == cache_state ? tag_mem_3_io_tag_read_dirty : _GEN_1002; // @[cache_single_port.scala 290:28 237:41]
  wire [21:0] _GEN_1081 = 5'h13 == cache_state ? tag_mem_3_io_tag_read_tag : _GEN_1003; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1082 = 5'h13 == cache_state ? 1'h0 : _GEN_1004; // @[cache_single_port.scala 290:28 235:44]
  wire [7:0] _GEN_1083 = 5'h13 == cache_state ? tag_mem_3_io_tag_read_visit : _GEN_1005; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1084 = 5'h13 == cache_state ? tag_mem_3_io_tag_read_valid : _GEN_1006; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1085 = 5'h13 == cache_state ? 1'h0 : _GEN_1007; // @[cache_single_port.scala 290:28 236:45]
  wire [127:0] _GEN_1088 = 5'h13 == cache_state ? data_mem_0_io_data_read_data : _GEN_1010; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_1091 = 5'h13 == cache_state ? 128'h0 : _GEN_1013; // @[cache_single_port.scala 290:28 240:48]
  wire  _GEN_1092 = 5'h13 == cache_state ? 1'h0 : _GEN_1014; // @[cache_single_port.scala 290:28 236:45]
  wire [127:0] _GEN_1093 = 5'h13 == cache_state ? data_mem_1_io_data_read_data : _GEN_1015; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_1094 = 5'h13 == cache_state ? 128'h0 : _GEN_1016; // @[cache_single_port.scala 290:28 240:48]
  wire  _GEN_1095 = 5'h13 == cache_state ? 1'h0 : _GEN_1017; // @[cache_single_port.scala 290:28 236:45]
  wire [127:0] _GEN_1096 = 5'h13 == cache_state ? data_mem_2_io_data_read_data : _GEN_1018; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_1097 = 5'h13 == cache_state ? 128'h0 : _GEN_1019; // @[cache_single_port.scala 290:28 240:48]
  wire  _GEN_1098 = 5'h13 == cache_state ? 1'h0 : _GEN_1020; // @[cache_single_port.scala 290:28 236:45]
  wire [127:0] _GEN_1099 = 5'h13 == cache_state ? data_mem_3_io_data_read_data : _GEN_1021; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_1100 = 5'h13 == cache_state ? 128'h0 : _GEN_1022; // @[cache_single_port.scala 290:28 240:48]
  wire [1:0] _GEN_1109 = 5'h13 == cache_state ? replace : _GEN_1031; // @[cache_single_port.scala 290:28 165:30]
  wire [31:0] _GEN_1110 = 5'h13 == cache_state ? refill_addr : _GEN_1032; // @[cache_single_port.scala 290:28 166:34]
  wire [31:0] _GEN_1111 = 5'h13 == cache_state ? writeback_addr : _GEN_1033; // @[cache_single_port.scala 290:28 167:37]
  wire  _GEN_1113 = 5'h13 == cache_state ? _GEN_0 : _GEN_1035; // @[cache_single_port.scala 290:28]
  wire [4:0] _GEN_1114 = 5'h11 == cache_state ? _GEN_176 : _GEN_1037; // @[cache_single_port.scala 290:28]
  wire [5:0] _GEN_1115 = 5'h11 == cache_state ? _GEN_160 : io_cpu_request_addr[9:4]; // @[cache_single_port.scala 290:28 234:48]
  wire  _GEN_1116 = 5'h11 == cache_state ? 1'h0 : _GEN_1085; // @[cache_single_port.scala 290:28]
  wire [5:0] _GEN_1117 = 5'h11 == cache_state ? _GEN_162 : io_cpu_request_addr[9:4]; // @[cache_single_port.scala 290:28 234:48]
  wire  _GEN_1118 = 5'h11 == cache_state ? 1'h0 : _GEN_1092; // @[cache_single_port.scala 290:28]
  wire [5:0] _GEN_1119 = 5'h11 == cache_state ? _GEN_164 : io_cpu_request_addr[9:4]; // @[cache_single_port.scala 290:28 234:48]
  wire  _GEN_1120 = 5'h11 == cache_state ? 1'h0 : _GEN_1095; // @[cache_single_port.scala 290:28]
  wire [5:0] _GEN_1121 = 5'h11 == cache_state ? _GEN_166 : io_cpu_request_addr[9:4]; // @[cache_single_port.scala 290:28 234:48]
  wire  _GEN_1122 = 5'h11 == cache_state ? 1'h0 : _GEN_1098; // @[cache_single_port.scala 290:28]
  wire  _GEN_1123 = 5'h11 == cache_state ? _T_35 : _GEN_1049; // @[cache_single_port.scala 290:28]
  wire [31:0] _GEN_1125 = 5'h11 == cache_state ? _GEN_137 : _GEN_1052; // @[cache_single_port.scala 290:28]
  wire [7:0] _GEN_1127 = 5'h11 == cache_state ? 8'hff : _GEN_1057; // @[cache_single_port.scala 290:28]
  wire  _GEN_1128 = 5'h11 == cache_state ? _T_40 : _GEN_1054; // @[cache_single_port.scala 290:28]
  wire [63:0] _GEN_1131 = 5'h11 == cache_state ? _GEN_173 : _GEN_1056; // @[cache_single_port.scala 290:28]
  wire  _GEN_1132 = 5'h11 == cache_state ? _GEN_177 : _GEN_1053; // @[cache_single_port.scala 290:28]
  wire  _GEN_1133 = 5'h11 == cache_state ? _GEN_178 : _GEN_1058; // @[cache_single_port.scala 290:28]
  wire  _GEN_1134 = 5'h11 == cache_state ? _GEN_179 : _GEN_1113; // @[cache_single_port.scala 290:28]
  wire  _GEN_1135 = 5'h11 == cache_state ? 1'h0 : _GEN_1036; // @[cache_single_port.scala 268:27 290:28]
  wire [1:0] _GEN_1137 = 5'h11 == cache_state ? _GEN_4 : _GEN_1039; // @[cache_single_port.scala 290:28]
  wire  _GEN_1138 = 5'h11 == cache_state ? flush_over : _GEN_1040; // @[cache_single_port.scala 290:28 280:33]
  wire  _GEN_1140 = 5'h11 == cache_state ? 1'h0 : _GEN_1042; // @[cache_single_port.scala 254:28 290:28]
  wire [1:0] _GEN_1142 = 5'h11 == cache_state ? 2'h3 : _GEN_1044; // @[cache_single_port.scala 290:28 257:32]
  wire [31:0] _GEN_1143 = 5'h11 == cache_state ? cpu_request_addr_reg : _GEN_1045; // @[cache_single_port.scala 290:28 255:32]
  wire [63:0] _GEN_1144 = 5'h11 == cache_state ? 64'h0 : _GEN_1046; // @[cache_single_port.scala 290:28 245:30]
  wire  _GEN_1145 = 5'h11 == cache_state ? 1'h0 : _GEN_1047; // @[cache_single_port.scala 266:27 290:28]
  wire  _GEN_1146 = 5'h11 == cache_state ? 1'h0 : _GEN_1048; // @[cache_single_port.scala 290:28 244:31]
  wire [1:0] _GEN_1147 = 5'h11 == cache_state ? 2'h3 : _GEN_1051; // @[cache_single_port.scala 290:28 250:32]
  wire  _GEN_1148 = 5'h11 == cache_state ? last : _GEN_1055; // @[cache_single_port.scala 290:28 264:31]
  wire [63:0] _GEN_1154 = 5'h11 == cache_state ? tmp_response_data : _GEN_1064; // @[cache_single_port.scala 290:28 285:40]
  wire  _GEN_1155 = 5'h11 == cache_state ? tag_mem_0_io_tag_read_dirty : _GEN_1065; // @[cache_single_port.scala 290:28 237:41]
  wire [21:0] _GEN_1156 = 5'h11 == cache_state ? tag_mem_0_io_tag_read_tag : _GEN_1066; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1157 = 5'h11 == cache_state ? 1'h0 : _GEN_1067; // @[cache_single_port.scala 290:28 235:44]
  wire [7:0] _GEN_1158 = 5'h11 == cache_state ? tag_mem_0_io_tag_read_visit : _GEN_1068; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1159 = 5'h11 == cache_state ? tag_mem_0_io_tag_read_valid : _GEN_1069; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1160 = 5'h11 == cache_state ? tag_mem_1_io_tag_read_dirty : _GEN_1070; // @[cache_single_port.scala 290:28 237:41]
  wire [21:0] _GEN_1161 = 5'h11 == cache_state ? tag_mem_1_io_tag_read_tag : _GEN_1071; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1162 = 5'h11 == cache_state ? 1'h0 : _GEN_1072; // @[cache_single_port.scala 290:28 235:44]
  wire [7:0] _GEN_1163 = 5'h11 == cache_state ? tag_mem_1_io_tag_read_visit : _GEN_1073; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1164 = 5'h11 == cache_state ? tag_mem_1_io_tag_read_valid : _GEN_1074; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1165 = 5'h11 == cache_state ? tag_mem_2_io_tag_read_dirty : _GEN_1075; // @[cache_single_port.scala 290:28 237:41]
  wire [21:0] _GEN_1166 = 5'h11 == cache_state ? tag_mem_2_io_tag_read_tag : _GEN_1076; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1167 = 5'h11 == cache_state ? 1'h0 : _GEN_1077; // @[cache_single_port.scala 290:28 235:44]
  wire [7:0] _GEN_1168 = 5'h11 == cache_state ? tag_mem_2_io_tag_read_visit : _GEN_1078; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1169 = 5'h11 == cache_state ? tag_mem_2_io_tag_read_valid : _GEN_1079; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1170 = 5'h11 == cache_state ? tag_mem_3_io_tag_read_dirty : _GEN_1080; // @[cache_single_port.scala 290:28 237:41]
  wire [21:0] _GEN_1171 = 5'h11 == cache_state ? tag_mem_3_io_tag_read_tag : _GEN_1081; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1172 = 5'h11 == cache_state ? 1'h0 : _GEN_1082; // @[cache_single_port.scala 290:28 235:44]
  wire [7:0] _GEN_1173 = 5'h11 == cache_state ? tag_mem_3_io_tag_read_visit : _GEN_1083; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1174 = 5'h11 == cache_state ? tag_mem_3_io_tag_read_valid : _GEN_1084; // @[cache_single_port.scala 290:28 237:41]
  wire [127:0] _GEN_1175 = 5'h11 == cache_state ? data_mem_0_io_data_read_data : _GEN_1088; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_1178 = 5'h11 == cache_state ? 128'h0 : _GEN_1091; // @[cache_single_port.scala 290:28 240:48]
  wire [127:0] _GEN_1179 = 5'h11 == cache_state ? data_mem_1_io_data_read_data : _GEN_1093; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_1180 = 5'h11 == cache_state ? 128'h0 : _GEN_1094; // @[cache_single_port.scala 290:28 240:48]
  wire [127:0] _GEN_1181 = 5'h11 == cache_state ? data_mem_2_io_data_read_data : _GEN_1096; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_1182 = 5'h11 == cache_state ? 128'h0 : _GEN_1097; // @[cache_single_port.scala 290:28 240:48]
  wire [127:0] _GEN_1183 = 5'h11 == cache_state ? data_mem_3_io_data_read_data : _GEN_1099; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_1184 = 5'h11 == cache_state ? 128'h0 : _GEN_1100; // @[cache_single_port.scala 290:28 240:48]
  wire [1:0] _GEN_1193 = 5'h11 == cache_state ? replace : _GEN_1109; // @[cache_single_port.scala 290:28 165:30]
  wire [31:0] _GEN_1194 = 5'h11 == cache_state ? refill_addr : _GEN_1110; // @[cache_single_port.scala 290:28 166:34]
  wire [31:0] _GEN_1195 = 5'h11 == cache_state ? writeback_addr : _GEN_1111; // @[cache_single_port.scala 290:28 167:37]
  wire [5:0] _GEN_1196 = 5'h10 == cache_state ? flush_loop : cpu_request_addr_index; // @[cache_single_port.scala 290:28]
  wire  _GEN_1207 = 5'h10 == cache_state ? 1'h0 : _GEN_1157; // @[cache_single_port.scala 290:28]
  wire [21:0] _GEN_1208 = 5'h10 == cache_state ? _GEN_107 : _GEN_1156; // @[cache_single_port.scala 290:28]
  wire [7:0] _GEN_1209 = 5'h10 == cache_state ? _GEN_108 : _GEN_1158; // @[cache_single_port.scala 290:28]
  wire  _GEN_1210 = 5'h10 == cache_state ? _GEN_109 : _GEN_1155; // @[cache_single_port.scala 290:28]
  wire  _GEN_1211 = 5'h10 == cache_state ? _GEN_96 : _GEN_1159; // @[cache_single_port.scala 290:28]
  wire  _GEN_1212 = 5'h10 == cache_state ? 1'h0 : _GEN_1162; // @[cache_single_port.scala 290:28]
  wire [21:0] _GEN_1213 = 5'h10 == cache_state ? _GEN_110 : _GEN_1161; // @[cache_single_port.scala 290:28]
  wire [7:0] _GEN_1214 = 5'h10 == cache_state ? _GEN_111 : _GEN_1163; // @[cache_single_port.scala 290:28]
  wire  _GEN_1215 = 5'h10 == cache_state ? _GEN_112 : _GEN_1160; // @[cache_single_port.scala 290:28]
  wire  _GEN_1216 = 5'h10 == cache_state ? _GEN_97 : _GEN_1164; // @[cache_single_port.scala 290:28]
  wire  _GEN_1217 = 5'h10 == cache_state ? 1'h0 : _GEN_1167; // @[cache_single_port.scala 290:28]
  wire [21:0] _GEN_1218 = 5'h10 == cache_state ? _GEN_113 : _GEN_1166; // @[cache_single_port.scala 290:28]
  wire [7:0] _GEN_1219 = 5'h10 == cache_state ? _GEN_114 : _GEN_1168; // @[cache_single_port.scala 290:28]
  wire  _GEN_1220 = 5'h10 == cache_state ? _GEN_115 : _GEN_1165; // @[cache_single_port.scala 290:28]
  wire  _GEN_1221 = 5'h10 == cache_state ? _GEN_98 : _GEN_1169; // @[cache_single_port.scala 290:28]
  wire  _GEN_1222 = 5'h10 == cache_state ? 1'h0 : _GEN_1172; // @[cache_single_port.scala 290:28]
  wire [21:0] _GEN_1223 = 5'h10 == cache_state ? _GEN_116 : _GEN_1171; // @[cache_single_port.scala 290:28]
  wire [7:0] _GEN_1224 = 5'h10 == cache_state ? _GEN_117 : _GEN_1173; // @[cache_single_port.scala 290:28]
  wire  _GEN_1225 = 5'h10 == cache_state ? _GEN_118 : _GEN_1170; // @[cache_single_port.scala 290:28]
  wire  _GEN_1226 = 5'h10 == cache_state ? _GEN_99 : _GEN_1174; // @[cache_single_port.scala 290:28]
  wire [5:0] _GEN_1227 = 5'h10 == cache_state ? io_cpu_request_addr[9:4] : _GEN_1115; // @[cache_single_port.scala 290:28 234:48]
  wire  _GEN_1228 = 5'h10 == cache_state ? 1'h0 : _GEN_1116; // @[cache_single_port.scala 290:28 236:45]
  wire [5:0] _GEN_1229 = 5'h10 == cache_state ? io_cpu_request_addr[9:4] : _GEN_1117; // @[cache_single_port.scala 290:28 234:48]
  wire  _GEN_1230 = 5'h10 == cache_state ? 1'h0 : _GEN_1118; // @[cache_single_port.scala 290:28 236:45]
  wire [5:0] _GEN_1231 = 5'h10 == cache_state ? io_cpu_request_addr[9:4] : _GEN_1119; // @[cache_single_port.scala 290:28 234:48]
  wire  _GEN_1232 = 5'h10 == cache_state ? 1'h0 : _GEN_1120; // @[cache_single_port.scala 290:28 236:45]
  wire [5:0] _GEN_1233 = 5'h10 == cache_state ? io_cpu_request_addr[9:4] : _GEN_1121; // @[cache_single_port.scala 290:28 234:48]
  wire  _GEN_1234 = 5'h10 == cache_state ? 1'h0 : _GEN_1122; // @[cache_single_port.scala 290:28 236:45]
  wire  _GEN_1235 = 5'h10 == cache_state ? 1'h0 : _GEN_1123; // @[cache_single_port.scala 247:28 290:28]
  wire [31:0] _GEN_1237 = 5'h10 == cache_state ? cpu_request_addr_reg : _GEN_1125; // @[cache_single_port.scala 290:28 248:32]
  wire [7:0] _GEN_1239 = 5'h10 == cache_state ? 8'hff : _GEN_1127; // @[cache_single_port.scala 290:28 262:31]
  wire  _GEN_1240 = 5'h10 == cache_state ? 1'h0 : _GEN_1128; // @[cache_single_port.scala 261:27 290:28]
  wire [63:0] _GEN_1243 = 5'h10 == cache_state ? 64'h0 : _GEN_1131; // @[cache_single_port.scala 290:28 263:31]
  wire  _GEN_1247 = 5'h10 == cache_state ? 1'h0 : _GEN_1135; // @[cache_single_port.scala 268:27 290:28]
  wire  _GEN_1248 = 5'h10 == cache_state ? 1'h0 : _GEN_1140; // @[cache_single_port.scala 254:28 290:28]
  wire [1:0] _GEN_1250 = 5'h10 == cache_state ? 2'h3 : _GEN_1142; // @[cache_single_port.scala 290:28 257:32]
  wire [31:0] _GEN_1251 = 5'h10 == cache_state ? cpu_request_addr_reg : _GEN_1143; // @[cache_single_port.scala 290:28 255:32]
  wire [63:0] _GEN_1252 = 5'h10 == cache_state ? 64'h0 : _GEN_1144; // @[cache_single_port.scala 290:28 245:30]
  wire  _GEN_1253 = 5'h10 == cache_state ? 1'h0 : _GEN_1145; // @[cache_single_port.scala 266:27 290:28]
  wire  _GEN_1254 = 5'h10 == cache_state ? 1'h0 : _GEN_1146; // @[cache_single_port.scala 290:28 244:31]
  wire [1:0] _GEN_1255 = 5'h10 == cache_state ? 2'h3 : _GEN_1147; // @[cache_single_port.scala 290:28 250:32]
  wire  _GEN_1256 = 5'h10 == cache_state ? last : _GEN_1148; // @[cache_single_port.scala 290:28 264:31]
  wire [127:0] _GEN_1258 = 5'h10 == cache_state ? data_mem_0_io_data_read_data : _GEN_1175; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_1261 = 5'h10 == cache_state ? 128'h0 : _GEN_1178; // @[cache_single_port.scala 290:28 240:48]
  wire [127:0] _GEN_1262 = 5'h10 == cache_state ? data_mem_1_io_data_read_data : _GEN_1179; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_1263 = 5'h10 == cache_state ? 128'h0 : _GEN_1180; // @[cache_single_port.scala 290:28 240:48]
  wire [127:0] _GEN_1264 = 5'h10 == cache_state ? data_mem_2_io_data_read_data : _GEN_1181; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_1265 = 5'h10 == cache_state ? 128'h0 : _GEN_1182; // @[cache_single_port.scala 290:28 240:48]
  wire [127:0] _GEN_1266 = 5'h10 == cache_state ? data_mem_3_io_data_read_data : _GEN_1183; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_1267 = 5'h10 == cache_state ? 128'h0 : _GEN_1184; // @[cache_single_port.scala 290:28 240:48]
  wire  _GEN_1281 = 5'hf == cache_state ? flush_over : _GEN_1254; // @[cache_single_port.scala 290:28]
  wire [5:0] _GEN_1282 = 5'hf == cache_state ? cpu_request_addr_index : _GEN_1196; // @[cache_single_port.scala 290:28 233:47]
  wire  _GEN_1291 = 5'hf == cache_state ? 1'h0 : _GEN_1207; // @[cache_single_port.scala 290:28 235:44]
  wire [21:0] _GEN_1292 = 5'hf == cache_state ? tag_mem_0_io_tag_read_tag : _GEN_1208; // @[cache_single_port.scala 290:28 237:41]
  wire [7:0] _GEN_1293 = 5'hf == cache_state ? tag_mem_0_io_tag_read_visit : _GEN_1209; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1294 = 5'hf == cache_state ? tag_mem_0_io_tag_read_dirty : _GEN_1210; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1295 = 5'hf == cache_state ? tag_mem_0_io_tag_read_valid : _GEN_1211; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1296 = 5'hf == cache_state ? 1'h0 : _GEN_1212; // @[cache_single_port.scala 290:28 235:44]
  wire [21:0] _GEN_1297 = 5'hf == cache_state ? tag_mem_1_io_tag_read_tag : _GEN_1213; // @[cache_single_port.scala 290:28 237:41]
  wire [7:0] _GEN_1298 = 5'hf == cache_state ? tag_mem_1_io_tag_read_visit : _GEN_1214; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1299 = 5'hf == cache_state ? tag_mem_1_io_tag_read_dirty : _GEN_1215; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1300 = 5'hf == cache_state ? tag_mem_1_io_tag_read_valid : _GEN_1216; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1301 = 5'hf == cache_state ? 1'h0 : _GEN_1217; // @[cache_single_port.scala 290:28 235:44]
  wire [21:0] _GEN_1302 = 5'hf == cache_state ? tag_mem_2_io_tag_read_tag : _GEN_1218; // @[cache_single_port.scala 290:28 237:41]
  wire [7:0] _GEN_1303 = 5'hf == cache_state ? tag_mem_2_io_tag_read_visit : _GEN_1219; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1304 = 5'hf == cache_state ? tag_mem_2_io_tag_read_dirty : _GEN_1220; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1305 = 5'hf == cache_state ? tag_mem_2_io_tag_read_valid : _GEN_1221; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1306 = 5'hf == cache_state ? 1'h0 : _GEN_1222; // @[cache_single_port.scala 290:28 235:44]
  wire [21:0] _GEN_1307 = 5'hf == cache_state ? tag_mem_3_io_tag_read_tag : _GEN_1223; // @[cache_single_port.scala 290:28 237:41]
  wire [7:0] _GEN_1308 = 5'hf == cache_state ? tag_mem_3_io_tag_read_visit : _GEN_1224; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1309 = 5'hf == cache_state ? tag_mem_3_io_tag_read_dirty : _GEN_1225; // @[cache_single_port.scala 290:28 237:41]
  wire  _GEN_1310 = 5'hf == cache_state ? tag_mem_3_io_tag_read_valid : _GEN_1226; // @[cache_single_port.scala 290:28 237:41]
  wire [5:0] _GEN_1311 = 5'hf == cache_state ? io_cpu_request_addr[9:4] : _GEN_1227; // @[cache_single_port.scala 290:28 234:48]
  wire  _GEN_1312 = 5'hf == cache_state ? 1'h0 : _GEN_1228; // @[cache_single_port.scala 290:28 236:45]
  wire [5:0] _GEN_1313 = 5'hf == cache_state ? io_cpu_request_addr[9:4] : _GEN_1229; // @[cache_single_port.scala 290:28 234:48]
  wire  _GEN_1314 = 5'hf == cache_state ? 1'h0 : _GEN_1230; // @[cache_single_port.scala 290:28 236:45]
  wire [5:0] _GEN_1315 = 5'hf == cache_state ? io_cpu_request_addr[9:4] : _GEN_1231; // @[cache_single_port.scala 290:28 234:48]
  wire  _GEN_1316 = 5'hf == cache_state ? 1'h0 : _GEN_1232; // @[cache_single_port.scala 290:28 236:45]
  wire [5:0] _GEN_1317 = 5'hf == cache_state ? io_cpu_request_addr[9:4] : _GEN_1233; // @[cache_single_port.scala 290:28 234:48]
  wire  _GEN_1318 = 5'hf == cache_state ? 1'h0 : _GEN_1234; // @[cache_single_port.scala 290:28 236:45]
  wire  _GEN_1319 = 5'hf == cache_state ? 1'h0 : _GEN_1235; // @[cache_single_port.scala 247:28 290:28]
  wire [31:0] _GEN_1321 = 5'hf == cache_state ? cpu_request_addr_reg : _GEN_1237; // @[cache_single_port.scala 290:28 248:32]
  wire [7:0] _GEN_1323 = 5'hf == cache_state ? 8'hff : _GEN_1239; // @[cache_single_port.scala 290:28 262:31]
  wire  _GEN_1324 = 5'hf == cache_state ? 1'h0 : _GEN_1240; // @[cache_single_port.scala 261:27 290:28]
  wire [63:0] _GEN_1327 = 5'hf == cache_state ? 64'h0 : _GEN_1243; // @[cache_single_port.scala 290:28 263:31]
  wire  _GEN_1331 = 5'hf == cache_state ? 1'h0 : _GEN_1247; // @[cache_single_port.scala 268:27 290:28]
  wire  _GEN_1332 = 5'hf == cache_state ? 1'h0 : _GEN_1248; // @[cache_single_port.scala 254:28 290:28]
  wire [1:0] _GEN_1334 = 5'hf == cache_state ? 2'h3 : _GEN_1250; // @[cache_single_port.scala 290:28 257:32]
  wire [31:0] _GEN_1335 = 5'hf == cache_state ? cpu_request_addr_reg : _GEN_1251; // @[cache_single_port.scala 290:28 255:32]
  wire [63:0] _GEN_1336 = 5'hf == cache_state ? 64'h0 : _GEN_1252; // @[cache_single_port.scala 290:28 245:30]
  wire  _GEN_1337 = 5'hf == cache_state ? 1'h0 : _GEN_1253; // @[cache_single_port.scala 266:27 290:28]
  wire [1:0] _GEN_1338 = 5'hf == cache_state ? 2'h3 : _GEN_1255; // @[cache_single_port.scala 290:28 250:32]
  wire  _GEN_1339 = 5'hf == cache_state ? last : _GEN_1256; // @[cache_single_port.scala 290:28 264:31]
  wire [127:0] _GEN_1341 = 5'hf == cache_state ? data_mem_0_io_data_read_data : _GEN_1258; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_1344 = 5'hf == cache_state ? 128'h0 : _GEN_1261; // @[cache_single_port.scala 290:28 240:48]
  wire [127:0] _GEN_1345 = 5'hf == cache_state ? data_mem_1_io_data_read_data : _GEN_1262; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_1346 = 5'hf == cache_state ? 128'h0 : _GEN_1263; // @[cache_single_port.scala 290:28 240:48]
  wire [127:0] _GEN_1347 = 5'hf == cache_state ? data_mem_2_io_data_read_data : _GEN_1264; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_1348 = 5'hf == cache_state ? 128'h0 : _GEN_1265; // @[cache_single_port.scala 290:28 240:48]
  wire [127:0] _GEN_1349 = 5'hf == cache_state ? data_mem_3_io_data_read_data : _GEN_1266; // @[cache_single_port.scala 290:28 238:43]
  wire [127:0] _GEN_1350 = 5'hf == cache_state ? 128'h0 : _GEN_1267; // @[cache_single_port.scala 290:28 240:48]
  wire  _GEN_1403 = 5'h0 == cache_state | (5'hf == cache_state | (5'h10 == cache_state | (5'h11 == cache_state |
    _GEN_1050))); // @[cache_single_port.scala 290:28 249:31]
  wire  _GEN_1416 = 5'h0 == cache_state | (5'hf == cache_state | (5'h10 == cache_state | (5'h11 == cache_state | (5'h13
     == cache_state | _GEN_963)))); // @[cache_single_port.scala 290:28 256:31]
  wire [1:0] _GEN_1417 = 5'h0 == cache_state ? 2'h3 : _GEN_1334; // @[cache_single_port.scala 290:28 257:32]
  wire [1:0] _GEN_1421 = 5'h0 == cache_state ? 2'h3 : _GEN_1338; // @[cache_single_port.scala 290:28 250:32]
  ysyx_041812_tag_cache tag_mem_0 ( // @[cache_single_port.scala 158:45]
    .clock(tag_mem_0_clock),
    .reset(tag_mem_0_reset),
    .io_cache_req_index(tag_mem_0_io_cache_req_index),
    .io_cache_req_we(tag_mem_0_io_cache_req_we),
    .io_tag_write_valid(tag_mem_0_io_tag_write_valid),
    .io_tag_write_dirty(tag_mem_0_io_tag_write_dirty),
    .io_tag_write_visit(tag_mem_0_io_tag_write_visit),
    .io_tag_write_tag(tag_mem_0_io_tag_write_tag),
    .io_tag_read_valid(tag_mem_0_io_tag_read_valid),
    .io_tag_read_dirty(tag_mem_0_io_tag_read_dirty),
    .io_tag_read_visit(tag_mem_0_io_tag_read_visit),
    .io_tag_read_tag(tag_mem_0_io_tag_read_tag)
  );
  ysyx_041812_tag_cache tag_mem_1 ( // @[cache_single_port.scala 158:45]
    .clock(tag_mem_1_clock),
    .reset(tag_mem_1_reset),
    .io_cache_req_index(tag_mem_1_io_cache_req_index),
    .io_cache_req_we(tag_mem_1_io_cache_req_we),
    .io_tag_write_valid(tag_mem_1_io_tag_write_valid),
    .io_tag_write_dirty(tag_mem_1_io_tag_write_dirty),
    .io_tag_write_visit(tag_mem_1_io_tag_write_visit),
    .io_tag_write_tag(tag_mem_1_io_tag_write_tag),
    .io_tag_read_valid(tag_mem_1_io_tag_read_valid),
    .io_tag_read_dirty(tag_mem_1_io_tag_read_dirty),
    .io_tag_read_visit(tag_mem_1_io_tag_read_visit),
    .io_tag_read_tag(tag_mem_1_io_tag_read_tag)
  );
  ysyx_041812_tag_cache tag_mem_2 ( // @[cache_single_port.scala 158:45]
    .clock(tag_mem_2_clock),
    .reset(tag_mem_2_reset),
    .io_cache_req_index(tag_mem_2_io_cache_req_index),
    .io_cache_req_we(tag_mem_2_io_cache_req_we),
    .io_tag_write_valid(tag_mem_2_io_tag_write_valid),
    .io_tag_write_dirty(tag_mem_2_io_tag_write_dirty),
    .io_tag_write_visit(tag_mem_2_io_tag_write_visit),
    .io_tag_write_tag(tag_mem_2_io_tag_write_tag),
    .io_tag_read_valid(tag_mem_2_io_tag_read_valid),
    .io_tag_read_dirty(tag_mem_2_io_tag_read_dirty),
    .io_tag_read_visit(tag_mem_2_io_tag_read_visit),
    .io_tag_read_tag(tag_mem_2_io_tag_read_tag)
  );
  ysyx_041812_tag_cache tag_mem_3 ( // @[cache_single_port.scala 158:45]
    .clock(tag_mem_3_clock),
    .reset(tag_mem_3_reset),
    .io_cache_req_index(tag_mem_3_io_cache_req_index),
    .io_cache_req_we(tag_mem_3_io_cache_req_we),
    .io_tag_write_valid(tag_mem_3_io_tag_write_valid),
    .io_tag_write_dirty(tag_mem_3_io_tag_write_dirty),
    .io_tag_write_visit(tag_mem_3_io_tag_write_visit),
    .io_tag_write_tag(tag_mem_3_io_tag_write_tag),
    .io_tag_read_valid(tag_mem_3_io_tag_read_valid),
    .io_tag_read_dirty(tag_mem_3_io_tag_read_dirty),
    .io_tag_read_visit(tag_mem_3_io_tag_read_visit),
    .io_tag_read_tag(tag_mem_3_io_tag_read_tag)
  );
  ysyx_041812_data_cache data_mem_0 ( // @[cache_single_port.scala 159:46]
    .io_cache_req_wmask(data_mem_0_io_cache_req_wmask),
    .io_cache_req_index(data_mem_0_io_cache_req_index),
    .io_cache_req_we(data_mem_0_io_cache_req_we),
    .io_data_write_data(data_mem_0_io_data_write_data),
    .io_data_read_data(data_mem_0_io_data_read_data),
    .io_sram_addr(data_mem_0_io_sram_addr),
    .io_sram_wen(data_mem_0_io_sram_wen),
    .io_sram_wmask(data_mem_0_io_sram_wmask),
    .io_sram_wdata(data_mem_0_io_sram_wdata),
    .io_sram_rdata(data_mem_0_io_sram_rdata)
  );
  ysyx_041812_data_cache data_mem_1 ( // @[cache_single_port.scala 159:46]
    .io_cache_req_wmask(data_mem_1_io_cache_req_wmask),
    .io_cache_req_index(data_mem_1_io_cache_req_index),
    .io_cache_req_we(data_mem_1_io_cache_req_we),
    .io_data_write_data(data_mem_1_io_data_write_data),
    .io_data_read_data(data_mem_1_io_data_read_data),
    .io_sram_addr(data_mem_1_io_sram_addr),
    .io_sram_wen(data_mem_1_io_sram_wen),
    .io_sram_wmask(data_mem_1_io_sram_wmask),
    .io_sram_wdata(data_mem_1_io_sram_wdata),
    .io_sram_rdata(data_mem_1_io_sram_rdata)
  );
  ysyx_041812_data_cache data_mem_2 ( // @[cache_single_port.scala 159:46]
    .io_cache_req_wmask(data_mem_2_io_cache_req_wmask),
    .io_cache_req_index(data_mem_2_io_cache_req_index),
    .io_cache_req_we(data_mem_2_io_cache_req_we),
    .io_data_write_data(data_mem_2_io_data_write_data),
    .io_data_read_data(data_mem_2_io_data_read_data),
    .io_sram_addr(data_mem_2_io_sram_addr),
    .io_sram_wen(data_mem_2_io_sram_wen),
    .io_sram_wmask(data_mem_2_io_sram_wmask),
    .io_sram_wdata(data_mem_2_io_sram_wdata),
    .io_sram_rdata(data_mem_2_io_sram_rdata)
  );
  ysyx_041812_data_cache data_mem_3 ( // @[cache_single_port.scala 159:46]
    .io_cache_req_wmask(data_mem_3_io_cache_req_wmask),
    .io_cache_req_index(data_mem_3_io_cache_req_index),
    .io_cache_req_we(data_mem_3_io_cache_req_we),
    .io_data_write_data(data_mem_3_io_data_write_data),
    .io_data_read_data(data_mem_3_io_data_read_data),
    .io_sram_addr(data_mem_3_io_sram_addr),
    .io_sram_wen(data_mem_3_io_sram_wen),
    .io_sram_wmask(data_mem_3_io_sram_wmask),
    .io_sram_wdata(data_mem_3_io_sram_wdata),
    .io_sram_rdata(data_mem_3_io_sram_rdata)
  );
  assign io_cpu_response_data = 5'h0 == cache_state ? 64'h0 : _GEN_1336; // @[cache_single_port.scala 290:28 245:30]
  assign io_cpu_response_ready = 5'h0 == cache_state ? 1'h0 : _GEN_1281; // @[cache_single_port.scala 290:28 244:31]
  assign io_mem_io_aw_valid = 5'h0 == cache_state ? 1'h0 : _GEN_1319; // @[cache_single_port.scala 247:28 290:28]
  assign io_mem_io_aw_bits_addr = 5'h0 == cache_state ? cpu_request_addr_reg : _GEN_1321; // @[cache_single_port.scala 290:28 248:32]
  assign io_mem_io_aw_bits_len = {{7'd0}, _GEN_1403};
  assign io_mem_io_aw_bits_size = {{1'd0}, _GEN_1421};
  assign io_mem_io_w_valid = 5'h0 == cache_state ? 1'h0 : _GEN_1324; // @[cache_single_port.scala 261:27 290:28]
  assign io_mem_io_w_bits_data = 5'h0 == cache_state ? 64'h0 : _GEN_1327; // @[cache_single_port.scala 290:28 263:31]
  assign io_mem_io_w_bits_strb = 5'h0 == cache_state ? 8'hff : _GEN_1323; // @[cache_single_port.scala 290:28 262:31]
  assign io_mem_io_w_bits_last = 5'h0 == cache_state ? last : _GEN_1339; // @[cache_single_port.scala 290:28 264:31]
  assign io_mem_io_b_ready = 5'h0 == cache_state ? 1'h0 : _GEN_1331; // @[cache_single_port.scala 268:27 290:28]
  assign io_mem_io_ar_valid = 5'h0 == cache_state ? 1'h0 : _GEN_1332; // @[cache_single_port.scala 254:28 290:28]
  assign io_mem_io_ar_bits_addr = 5'h0 == cache_state ? cpu_request_addr_reg : _GEN_1335; // @[cache_single_port.scala 290:28 255:32]
  assign io_mem_io_ar_bits_len = {{7'd0}, _GEN_1416};
  assign io_mem_io_ar_bits_size = {{1'd0}, _GEN_1417};
  assign io_mem_io_r_ready = 5'h0 == cache_state ? 1'h0 : _GEN_1337; // @[cache_single_port.scala 266:27 290:28]
  assign io_sram0_addr = data_mem_0_io_sram_addr; // @[cache_single_port.scala 179:23]
  assign io_sram0_wen = data_mem_0_io_sram_wen; // @[cache_single_port.scala 181:23]
  assign io_sram0_wmask = data_mem_0_io_sram_wmask; // @[cache_single_port.scala 182:24]
  assign io_sram0_wdata = data_mem_0_io_sram_wdata; // @[cache_single_port.scala 183:24]
  assign io_sram1_addr = data_mem_1_io_sram_addr; // @[cache_single_port.scala 186:23]
  assign io_sram1_wen = data_mem_1_io_sram_wen; // @[cache_single_port.scala 188:23]
  assign io_sram1_wmask = data_mem_1_io_sram_wmask; // @[cache_single_port.scala 189:24]
  assign io_sram1_wdata = data_mem_1_io_sram_wdata; // @[cache_single_port.scala 190:24]
  assign io_sram2_addr = data_mem_2_io_sram_addr; // @[cache_single_port.scala 193:23]
  assign io_sram2_wen = data_mem_2_io_sram_wen; // @[cache_single_port.scala 195:23]
  assign io_sram2_wmask = data_mem_2_io_sram_wmask; // @[cache_single_port.scala 196:24]
  assign io_sram2_wdata = data_mem_2_io_sram_wdata; // @[cache_single_port.scala 197:24]
  assign io_sram3_addr = data_mem_3_io_sram_addr; // @[cache_single_port.scala 200:23]
  assign io_sram3_wen = data_mem_3_io_sram_wen; // @[cache_single_port.scala 202:23]
  assign io_sram3_wmask = data_mem_3_io_sram_wmask; // @[cache_single_port.scala 203:24]
  assign io_sram3_wdata = data_mem_3_io_sram_wdata; // @[cache_single_port.scala 204:24]
  assign tag_mem_0_clock = clock;
  assign tag_mem_0_reset = reset;
  assign tag_mem_0_io_cache_req_index = 5'h0 == cache_state ? cpu_request_addr_index : _GEN_1282; // @[cache_single_port.scala 290:28 233:47]
  assign tag_mem_0_io_cache_req_we = 5'h0 == cache_state ? 1'h0 : _GEN_1291; // @[cache_single_port.scala 290:28 235:44]
  assign tag_mem_0_io_tag_write_valid = 5'h0 == cache_state ? tag_mem_0_io_tag_read_valid : _GEN_1295; // @[cache_single_port.scala 290:28 237:41]
  assign tag_mem_0_io_tag_write_dirty = 5'h0 == cache_state ? tag_mem_0_io_tag_read_dirty : _GEN_1294; // @[cache_single_port.scala 290:28 237:41]
  assign tag_mem_0_io_tag_write_visit = 5'h0 == cache_state ? tag_mem_0_io_tag_read_visit : _GEN_1293; // @[cache_single_port.scala 290:28 237:41]
  assign tag_mem_0_io_tag_write_tag = 5'h0 == cache_state ? tag_mem_0_io_tag_read_tag : _GEN_1292; // @[cache_single_port.scala 290:28 237:41]
  assign tag_mem_1_clock = clock;
  assign tag_mem_1_reset = reset;
  assign tag_mem_1_io_cache_req_index = 5'h0 == cache_state ? cpu_request_addr_index : _GEN_1282; // @[cache_single_port.scala 290:28 233:47]
  assign tag_mem_1_io_cache_req_we = 5'h0 == cache_state ? 1'h0 : _GEN_1296; // @[cache_single_port.scala 290:28 235:44]
  assign tag_mem_1_io_tag_write_valid = 5'h0 == cache_state ? tag_mem_1_io_tag_read_valid : _GEN_1300; // @[cache_single_port.scala 290:28 237:41]
  assign tag_mem_1_io_tag_write_dirty = 5'h0 == cache_state ? tag_mem_1_io_tag_read_dirty : _GEN_1299; // @[cache_single_port.scala 290:28 237:41]
  assign tag_mem_1_io_tag_write_visit = 5'h0 == cache_state ? tag_mem_1_io_tag_read_visit : _GEN_1298; // @[cache_single_port.scala 290:28 237:41]
  assign tag_mem_1_io_tag_write_tag = 5'h0 == cache_state ? tag_mem_1_io_tag_read_tag : _GEN_1297; // @[cache_single_port.scala 290:28 237:41]
  assign tag_mem_2_clock = clock;
  assign tag_mem_2_reset = reset;
  assign tag_mem_2_io_cache_req_index = 5'h0 == cache_state ? cpu_request_addr_index : _GEN_1282; // @[cache_single_port.scala 290:28 233:47]
  assign tag_mem_2_io_cache_req_we = 5'h0 == cache_state ? 1'h0 : _GEN_1301; // @[cache_single_port.scala 290:28 235:44]
  assign tag_mem_2_io_tag_write_valid = 5'h0 == cache_state ? tag_mem_2_io_tag_read_valid : _GEN_1305; // @[cache_single_port.scala 290:28 237:41]
  assign tag_mem_2_io_tag_write_dirty = 5'h0 == cache_state ? tag_mem_2_io_tag_read_dirty : _GEN_1304; // @[cache_single_port.scala 290:28 237:41]
  assign tag_mem_2_io_tag_write_visit = 5'h0 == cache_state ? tag_mem_2_io_tag_read_visit : _GEN_1303; // @[cache_single_port.scala 290:28 237:41]
  assign tag_mem_2_io_tag_write_tag = 5'h0 == cache_state ? tag_mem_2_io_tag_read_tag : _GEN_1302; // @[cache_single_port.scala 290:28 237:41]
  assign tag_mem_3_clock = clock;
  assign tag_mem_3_reset = reset;
  assign tag_mem_3_io_cache_req_index = 5'h0 == cache_state ? cpu_request_addr_index : _GEN_1282; // @[cache_single_port.scala 290:28 233:47]
  assign tag_mem_3_io_cache_req_we = 5'h0 == cache_state ? 1'h0 : _GEN_1306; // @[cache_single_port.scala 290:28 235:44]
  assign tag_mem_3_io_tag_write_valid = 5'h0 == cache_state ? tag_mem_3_io_tag_read_valid : _GEN_1310; // @[cache_single_port.scala 290:28 237:41]
  assign tag_mem_3_io_tag_write_dirty = 5'h0 == cache_state ? tag_mem_3_io_tag_read_dirty : _GEN_1309; // @[cache_single_port.scala 290:28 237:41]
  assign tag_mem_3_io_tag_write_visit = 5'h0 == cache_state ? tag_mem_3_io_tag_read_visit : _GEN_1308; // @[cache_single_port.scala 290:28 237:41]
  assign tag_mem_3_io_tag_write_tag = 5'h0 == cache_state ? tag_mem_3_io_tag_read_tag : _GEN_1307; // @[cache_single_port.scala 290:28 237:41]
  assign data_mem_0_io_cache_req_wmask = 5'h0 == cache_state ? 128'h0 : _GEN_1344; // @[cache_single_port.scala 290:28 240:48]
  assign data_mem_0_io_cache_req_index = 5'h0 == cache_state ? io_cpu_request_addr[9:4] : _GEN_1311; // @[cache_single_port.scala 290:28 234:48]
  assign data_mem_0_io_cache_req_we = 5'h0 == cache_state ? 1'h0 : _GEN_1312; // @[cache_single_port.scala 290:28 236:45]
  assign data_mem_0_io_data_write_data = 5'h0 == cache_state ? data_mem_0_io_data_read_data : _GEN_1341; // @[cache_single_port.scala 290:28 238:43]
  assign data_mem_0_io_sram_rdata = io_sram0_rdata; // @[cache_single_port.scala 184:35]
  assign data_mem_1_io_cache_req_wmask = 5'h0 == cache_state ? 128'h0 : _GEN_1346; // @[cache_single_port.scala 290:28 240:48]
  assign data_mem_1_io_cache_req_index = 5'h0 == cache_state ? io_cpu_request_addr[9:4] : _GEN_1313; // @[cache_single_port.scala 290:28 234:48]
  assign data_mem_1_io_cache_req_we = 5'h0 == cache_state ? 1'h0 : _GEN_1314; // @[cache_single_port.scala 290:28 236:45]
  assign data_mem_1_io_data_write_data = 5'h0 == cache_state ? data_mem_1_io_data_read_data : _GEN_1345; // @[cache_single_port.scala 290:28 238:43]
  assign data_mem_1_io_sram_rdata = io_sram1_rdata; // @[cache_single_port.scala 191:35]
  assign data_mem_2_io_cache_req_wmask = 5'h0 == cache_state ? 128'h0 : _GEN_1348; // @[cache_single_port.scala 290:28 240:48]
  assign data_mem_2_io_cache_req_index = 5'h0 == cache_state ? io_cpu_request_addr[9:4] : _GEN_1315; // @[cache_single_port.scala 290:28 234:48]
  assign data_mem_2_io_cache_req_we = 5'h0 == cache_state ? 1'h0 : _GEN_1316; // @[cache_single_port.scala 290:28 236:45]
  assign data_mem_2_io_data_write_data = 5'h0 == cache_state ? data_mem_2_io_data_read_data : _GEN_1347; // @[cache_single_port.scala 290:28 238:43]
  assign data_mem_2_io_sram_rdata = io_sram2_rdata; // @[cache_single_port.scala 198:35]
  assign data_mem_3_io_cache_req_wmask = 5'h0 == cache_state ? 128'h0 : _GEN_1350; // @[cache_single_port.scala 290:28 240:48]
  assign data_mem_3_io_cache_req_index = 5'h0 == cache_state ? io_cpu_request_addr[9:4] : _GEN_1317; // @[cache_single_port.scala 290:28 234:48]
  assign data_mem_3_io_cache_req_we = 5'h0 == cache_state ? 1'h0 : _GEN_1318; // @[cache_single_port.scala 290:28 236:45]
  assign data_mem_3_io_data_write_data = 5'h0 == cache_state ? data_mem_3_io_data_read_data : _GEN_1349; // @[cache_single_port.scala 290:28 238:43]
  assign data_mem_3_io_sram_rdata = io_sram3_rdata; // @[cache_single_port.scala 205:35]
  always @(posedge clock) begin
    if (reset) begin // @[cache_single_port.scala 157:34]
      cache_state <= 5'h0; // @[cache_single_port.scala 157:34]
    end else if (5'h0 == cache_state) begin // @[cache_single_port.scala 290:28]
      cache_state <= {{1'd0}, _GEN_9};
    end else if (5'hf == cache_state) begin // @[cache_single_port.scala 290:28]
      if (flush_over) begin // @[cache_single_port.scala 314:49]
        cache_state <= 5'h0; // @[cache_single_port.scala 315:52]
      end else begin
        cache_state <= 5'h10; // @[cache_single_port.scala 320:52]
      end
    end else if (5'h10 == cache_state) begin // @[cache_single_port.scala 290:28]
      cache_state <= _GEN_88;
    end else begin
      cache_state <= _GEN_1114;
    end
    if (reset) begin // @[Counter.scala 62:40]
      index <= 1'h0; // @[Counter.scala 62:40]
    end else if (5'h0 == cache_state) begin // @[cache_single_port.scala 290:28]
      index <= _GEN_0;
    end else if (5'hf == cache_state) begin // @[cache_single_port.scala 290:28]
      index <= _GEN_0;
    end else if (5'h10 == cache_state) begin // @[cache_single_port.scala 290:28]
      index <= _GEN_0;
    end else begin
      index <= _GEN_1134;
    end
    if (reset) begin // @[cache_single_port.scala 288:37]
      write_data_reg <= 1'h0; // @[cache_single_port.scala 288:37]
    end else if (!(5'h0 == cache_state)) begin // @[cache_single_port.scala 290:28]
      if (!(5'hf == cache_state)) begin // @[cache_single_port.scala 290:28]
        if (!(5'h10 == cache_state)) begin // @[cache_single_port.scala 290:28]
          write_data_reg <= _GEN_1133;
        end
      end
    end
    if (reset) begin // @[cache_single_port.scala 165:30]
      replace <= 2'h0; // @[cache_single_port.scala 165:30]
    end else if (!(5'h0 == cache_state)) begin // @[cache_single_port.scala 290:28]
      if (!(5'hf == cache_state)) begin // @[cache_single_port.scala 290:28]
        if (!(5'h10 == cache_state)) begin // @[cache_single_port.scala 290:28]
          replace <= _GEN_1193;
        end
      end
    end
    if (reset) begin // @[cache_single_port.scala 166:34]
      refill_addr <= 32'h0; // @[cache_single_port.scala 166:34]
    end else if (!(5'h0 == cache_state)) begin // @[cache_single_port.scala 290:28]
      if (!(5'hf == cache_state)) begin // @[cache_single_port.scala 290:28]
        if (!(5'h10 == cache_state)) begin // @[cache_single_port.scala 290:28]
          refill_addr <= _GEN_1194;
        end
      end
    end
    if (reset) begin // @[cache_single_port.scala 167:37]
      writeback_addr <= 32'h0; // @[cache_single_port.scala 167:37]
    end else if (!(5'h0 == cache_state)) begin // @[cache_single_port.scala 290:28]
      if (!(5'hf == cache_state)) begin // @[cache_single_port.scala 290:28]
        if (5'h10 == cache_state) begin // @[cache_single_port.scala 290:28]
          writeback_addr <= _GEN_89;
        end else begin
          writeback_addr <= _GEN_1195;
        end
      end
    end
    if (reset) begin // @[cache_single_port.scala 171:50]
      cpu_request_addr_reg_origin <= 32'h0; // @[cache_single_port.scala 171:50]
    end else begin
      cpu_request_addr_reg_origin <= io_cpu_request_addr; // @[cache_single_port.scala 217:37]
    end
    if (reset) begin // @[cache_single_port.scala 172:43]
      cpu_request_addr_reg <= 32'h0; // @[cache_single_port.scala 172:43]
    end else begin
      cpu_request_addr_reg <= align_addr; // @[cache_single_port.scala 216:30]
    end
    if (reset) begin // @[cache_single_port.scala 173:39]
      cpu_request_data <= 64'h0; // @[cache_single_port.scala 173:39]
    end else begin
      cpu_request_data <= io_cpu_request_data; // @[cache_single_port.scala 218:26]
    end
    if (reset) begin // @[cache_single_port.scala 174:39]
      cpu_request_mask <= 8'h0; // @[cache_single_port.scala 174:39]
    end else begin
      cpu_request_mask <= io_cpu_request_mask; // @[cache_single_port.scala 219:26]
    end
    if (reset) begin // @[cache_single_port.scala 175:37]
      cpu_request_rw <= 1'h0; // @[cache_single_port.scala 175:37]
    end else begin
      cpu_request_rw <= io_cpu_request_rw; // @[cache_single_port.scala 220:24]
    end
    if (reset) begin // @[cache_single_port.scala 177:45]
      cpu_request_accessType <= 2'h0; // @[cache_single_port.scala 177:45]
    end else begin
      cpu_request_accessType <= io_accessType; // @[cache_single_port.scala 222:32]
    end
    if (reset) begin // @[Counter.scala 62:40]
      flush_loop <= 6'h0; // @[Counter.scala 62:40]
    end else if (5'h0 == cache_state) begin // @[cache_single_port.scala 290:28]
      flush_loop <= _GEN_2;
    end else if (5'hf == cache_state) begin // @[cache_single_port.scala 290:28]
      if (flush_over) begin // @[cache_single_port.scala 314:49]
        flush_loop <= 6'h0; // @[cache_single_port.scala 316:52]
      end else begin
        flush_loop <= _GEN_2;
      end
    end else begin
      flush_loop <= _GEN_2;
    end
    if (reset) begin // @[Counter.scala 62:40]
      index_in_line <= 2'h0; // @[Counter.scala 62:40]
    end else if (5'h0 == cache_state) begin // @[cache_single_port.scala 290:28]
      index_in_line <= _GEN_4;
    end else if (5'hf == cache_state) begin // @[cache_single_port.scala 290:28]
      index_in_line <= _GEN_4;
    end else if (5'h10 == cache_state) begin // @[cache_single_port.scala 290:28]
      index_in_line <= _GEN_93;
    end else begin
      index_in_line <= _GEN_1137;
    end
    if (reset) begin // @[cache_single_port.scala 280:33]
      flush_over <= 1'h0; // @[cache_single_port.scala 280:33]
    end else if (!(5'h0 == cache_state)) begin // @[cache_single_port.scala 290:28]
      if (5'hf == cache_state) begin // @[cache_single_port.scala 290:28]
        if (flush_over) begin // @[cache_single_port.scala 314:49]
          flush_over <= 1'h0; // @[cache_single_port.scala 317:52]
        end
      end else if (5'h10 == cache_state) begin // @[cache_single_port.scala 290:28]
        flush_over <= _GEN_91;
      end else begin
        flush_over <= _GEN_1138;
      end
    end
    if (reset) begin // @[cache_single_port.scala 285:40]
      tmp_response_data <= 64'h0; // @[cache_single_port.scala 285:40]
    end else if (!(5'h0 == cache_state)) begin // @[cache_single_port.scala 290:28]
      if (!(5'hf == cache_state)) begin // @[cache_single_port.scala 290:28]
        if (!(5'h10 == cache_state)) begin // @[cache_single_port.scala 290:28]
          tmp_response_data <= _GEN_1154;
        end
      end
    end
    if (reset) begin // @[cache_single_port.scala 287:37]
      write_addr_reg <= 1'h0; // @[cache_single_port.scala 287:37]
    end else if (!(5'h0 == cache_state)) begin // @[cache_single_port.scala 290:28]
      if (!(5'hf == cache_state)) begin // @[cache_single_port.scala 290:28]
        if (!(5'h10 == cache_state)) begin // @[cache_single_port.scala 290:28]
          write_addr_reg <= _GEN_1132;
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
  cache_state = _RAND_0[4:0];
  _RAND_1 = {1{`RANDOM}};
  index = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  write_data_reg = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  replace = _RAND_3[1:0];
  _RAND_4 = {1{`RANDOM}};
  refill_addr = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  writeback_addr = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  cpu_request_addr_reg_origin = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  cpu_request_addr_reg = _RAND_7[31:0];
  _RAND_8 = {2{`RANDOM}};
  cpu_request_data = _RAND_8[63:0];
  _RAND_9 = {1{`RANDOM}};
  cpu_request_mask = _RAND_9[7:0];
  _RAND_10 = {1{`RANDOM}};
  cpu_request_rw = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  cpu_request_accessType = _RAND_11[1:0];
  _RAND_12 = {1{`RANDOM}};
  flush_loop = _RAND_12[5:0];
  _RAND_13 = {1{`RANDOM}};
  index_in_line = _RAND_13[1:0];
  _RAND_14 = {1{`RANDOM}};
  flush_over = _RAND_14[0:0];
  _RAND_15 = {2{`RANDOM}};
  tmp_response_data = _RAND_15[63:0];
  _RAND_16 = {1{`RANDOM}};
  write_addr_reg = _RAND_16[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_041812_CacheArbiter(
  input         clock,
  input         reset,
  output        io_icache_ar_ready,
  input         io_icache_ar_valid,
  input  [31:0] io_icache_ar_bits_addr,
  input  [7:0]  io_icache_ar_bits_len,
  input  [2:0]  io_icache_ar_bits_size,
  input         io_icache_r_ready,
  output        io_icache_r_valid,
  output [63:0] io_icache_r_bits_data,
  output        io_icache_r_bits_last,
  output        io_dcache_aw_ready,
  input         io_dcache_aw_valid,
  input  [31:0] io_dcache_aw_bits_addr,
  input  [7:0]  io_dcache_aw_bits_len,
  input  [2:0]  io_dcache_aw_bits_size,
  output        io_dcache_w_ready,
  input         io_dcache_w_valid,
  input  [63:0] io_dcache_w_bits_data,
  input  [7:0]  io_dcache_w_bits_strb,
  input         io_dcache_w_bits_last,
  input         io_dcache_b_ready,
  output        io_dcache_b_valid,
  output        io_dcache_ar_ready,
  input         io_dcache_ar_valid,
  input  [31:0] io_dcache_ar_bits_addr,
  input  [7:0]  io_dcache_ar_bits_len,
  input  [2:0]  io_dcache_ar_bits_size,
  input         io_dcache_r_ready,
  output        io_dcache_r_valid,
  output [63:0] io_dcache_r_bits_data,
  output        io_dcache_r_bits_last,
  input         io_axi_out_aw_ready,
  output        io_axi_out_aw_valid,
  output [31:0] io_axi_out_aw_bits_addr,
  output [7:0]  io_axi_out_aw_bits_len,
  output [2:0]  io_axi_out_aw_bits_size,
  input         io_axi_out_w_ready,
  output        io_axi_out_w_valid,
  output [63:0] io_axi_out_w_bits_data,
  output [7:0]  io_axi_out_w_bits_strb,
  output        io_axi_out_w_bits_last,
  output        io_axi_out_b_ready,
  input         io_axi_out_b_valid,
  input         io_axi_out_ar_ready,
  output        io_axi_out_ar_valid,
  output [31:0] io_axi_out_ar_bits_addr,
  output [7:0]  io_axi_out_ar_bits_len,
  output [2:0]  io_axi_out_ar_bits_size,
  output        io_axi_out_r_ready,
  input         io_axi_out_r_valid,
  input  [63:0] io_axi_out_r_bits_data,
  input         io_axi_out_r_bits_last
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] state; // @[Arbiter.scala 24:28]
  wire  _io_axi_out_aw_valid_T = state == 3'h3; // @[Arbiter.scala 28:60]
  wire  _io_dcache_b_valid_T = state == 3'h7; // @[Arbiter.scala 40:58]
  wire  _io_axi_out_ar_bits_T = state == 3'h5; // @[Arbiter.scala 46:27]
  wire  _io_axi_out_ar_valid_T_1 = state == 3'h4; // @[Arbiter.scala 51:85]
  wire  _io_icache_r_valid_T = state == 3'h1; // @[Arbiter.scala 58:58]
  wire  _io_dcache_r_valid_T = state == 3'h2; // @[Arbiter.scala 59:58]
  wire  _io_axi_out_r_ready_T_3 = io_dcache_r_ready & _io_dcache_r_valid_T; // @[Arbiter.scala 61:36]
  reg  write_addr_reg; // @[Arbiter.scala 66:37]
  reg  write_data_reg; // @[Arbiter.scala 67:37]
  wire [2:0] _GEN_0 = io_icache_ar_valid ? 3'h4 : state; // @[Arbiter.scala 24:28 79:55 80:39]
  wire  _T_7 = io_icache_ar_ready & io_icache_ar_valid; // @[Decoupled.scala 50:35]
  wire  _T_11 = io_dcache_ar_ready & io_dcache_ar_valid; // @[Decoupled.scala 50:35]
  wire [2:0] _GEN_4 = _T_11 ? 3'h2 : state; // @[Arbiter.scala 100:48 101:39 24:28]
  wire  _T_15 = io_axi_out_r_ready & io_axi_out_r_valid; // @[Decoupled.scala 50:35]
  wire [2:0] _GEN_5 = _T_15 & io_axi_out_r_bits_last ? 3'h0 : state; // @[Arbiter.scala 106:74 107:39 24:28]
  wire  _T_25 = io_dcache_aw_ready & io_dcache_aw_valid; // @[Decoupled.scala 50:35]
  wire  _GEN_7 = _T_25 | write_addr_reg; // @[Arbiter.scala 124:48 125:48 66:37]
  wire  _T_26 = io_dcache_w_ready & io_dcache_w_valid; // @[Decoupled.scala 50:35]
  wire  _GEN_8 = _T_26 & io_dcache_w_bits_last | write_data_reg; // @[Arbiter.scala 128:72 130:48 67:37]
  wire [2:0] _GEN_9 = write_addr_reg & write_data_reg ? 3'h7 : state; // @[Arbiter.scala 133:63 134:39 24:28]
  wire  _GEN_10 = write_addr_reg & write_data_reg ? 1'h0 : _GEN_7; // @[Arbiter.scala 133:63 135:48]
  wire  _GEN_11 = write_addr_reg & write_data_reg ? 1'h0 : _GEN_8; // @[Arbiter.scala 133:63 136:48]
  wire  _T_32 = io_axi_out_b_ready & io_axi_out_b_valid; // @[Decoupled.scala 50:35]
  wire [2:0] _GEN_12 = _T_32 ? 3'h0 : state; // @[Arbiter.scala 140:48 141:39 24:28]
  wire [2:0] _GEN_13 = 3'h7 == state ? _GEN_12 : state; // @[Arbiter.scala 70:22 24:28]
  wire  _GEN_14 = 3'h3 == state ? _GEN_10 : write_addr_reg; // @[Arbiter.scala 70:22 66:37]
  wire  _GEN_15 = 3'h3 == state ? _GEN_11 : write_data_reg; // @[Arbiter.scala 70:22 67:37]
  wire [2:0] _GEN_16 = 3'h3 == state ? _GEN_9 : _GEN_13; // @[Arbiter.scala 70:22]
  wire [2:0] _GEN_17 = 3'h2 == state ? _GEN_5 : _GEN_16; // @[Arbiter.scala 70:22]
  wire  _GEN_18 = 3'h2 == state ? write_addr_reg : _GEN_14; // @[Arbiter.scala 70:22 66:37]
  wire  _GEN_19 = 3'h2 == state ? write_data_reg : _GEN_15; // @[Arbiter.scala 70:22 67:37]
  wire [2:0] _GEN_20 = 3'h1 == state ? _GEN_5 : _GEN_17; // @[Arbiter.scala 70:22]
  wire  _GEN_21 = 3'h1 == state ? write_addr_reg : _GEN_18; // @[Arbiter.scala 70:22 66:37]
  wire  _GEN_22 = 3'h1 == state ? write_data_reg : _GEN_19; // @[Arbiter.scala 70:22 67:37]
  assign io_icache_ar_ready = io_axi_out_ar_ready & _io_axi_out_ar_valid_T_1; // @[Arbiter.scala 53:51]
  assign io_icache_r_valid = io_axi_out_r_valid & state == 3'h1; // @[Arbiter.scala 58:49]
  assign io_icache_r_bits_data = io_axi_out_r_bits_data; // @[Arbiter.scala 56:26]
  assign io_icache_r_bits_last = io_axi_out_r_bits_last; // @[Arbiter.scala 56:26]
  assign io_dcache_aw_ready = io_axi_out_aw_ready & _io_axi_out_aw_valid_T; // @[Arbiter.scala 29:51]
  assign io_dcache_w_ready = io_axi_out_w_ready & _io_axi_out_aw_valid_T; // @[Arbiter.scala 35:49]
  assign io_dcache_b_valid = io_axi_out_b_valid & state == 3'h7; // @[Arbiter.scala 40:49]
  assign io_dcache_ar_ready = io_axi_out_ar_ready & _io_axi_out_ar_bits_T; // @[Arbiter.scala 52:51]
  assign io_dcache_r_valid = io_axi_out_r_valid & state == 3'h2; // @[Arbiter.scala 59:49]
  assign io_dcache_r_bits_data = io_axi_out_r_bits_data; // @[Arbiter.scala 57:26]
  assign io_dcache_r_bits_last = io_axi_out_r_bits_last; // @[Arbiter.scala 57:26]
  assign io_axi_out_aw_valid = io_dcache_aw_valid & state == 3'h3; // @[Arbiter.scala 28:51]
  assign io_axi_out_aw_bits_addr = io_dcache_aw_bits_addr; // @[Arbiter.scala 27:28]
  assign io_axi_out_aw_bits_len = io_dcache_aw_bits_len; // @[Arbiter.scala 27:28]
  assign io_axi_out_aw_bits_size = io_dcache_aw_bits_size; // @[Arbiter.scala 27:28]
  assign io_axi_out_w_valid = io_dcache_w_valid & _io_axi_out_aw_valid_T; // @[Arbiter.scala 34:49]
  assign io_axi_out_w_bits_data = io_dcache_w_bits_data; // @[Arbiter.scala 33:27]
  assign io_axi_out_w_bits_strb = io_dcache_w_bits_strb; // @[Arbiter.scala 33:27]
  assign io_axi_out_w_bits_last = io_dcache_w_bits_last; // @[Arbiter.scala 33:27]
  assign io_axi_out_b_ready = io_dcache_b_ready & _io_dcache_b_valid_T; // @[Arbiter.scala 41:49]
  assign io_axi_out_ar_valid = (io_icache_ar_valid | io_dcache_ar_valid) & (state == 3'h4 | _io_axi_out_ar_bits_T); // @[Arbiter.scala 51:75]
  assign io_axi_out_ar_bits_addr = _io_axi_out_ar_bits_T ? io_dcache_ar_bits_addr : io_icache_ar_bits_addr; // @[Arbiter.scala 47:20]
  assign io_axi_out_ar_bits_len = _io_axi_out_ar_bits_T ? io_dcache_ar_bits_len : io_icache_ar_bits_len; // @[Arbiter.scala 49:20]
  assign io_axi_out_ar_bits_size = _io_axi_out_ar_bits_T ? io_dcache_ar_bits_size : io_icache_ar_bits_size; // @[Arbiter.scala 48:20]
  assign io_axi_out_r_ready = io_icache_r_ready & _io_icache_r_valid_T | _io_axi_out_r_ready_T_3; // @[Arbiter.scala 60:76]
  always @(posedge clock) begin
    if (reset) begin // @[Arbiter.scala 24:28]
      state <= 3'h0; // @[Arbiter.scala 24:28]
    end else if (3'h0 == state) begin // @[Arbiter.scala 70:22]
      if (io_dcache_aw_valid | io_dcache_w_valid) begin // @[Arbiter.scala 73:70]
        state <= 3'h3; // @[Arbiter.scala 74:39]
      end else if (io_dcache_ar_valid) begin // @[Arbiter.scala 76:55]
        state <= 3'h5; // @[Arbiter.scala 77:39]
      end else begin
        state <= _GEN_0;
      end
    end else if (3'h4 == state) begin // @[Arbiter.scala 70:22]
      if (_T_7) begin // @[Arbiter.scala 94:48]
        state <= 3'h1; // @[Arbiter.scala 95:39]
      end
    end else if (3'h5 == state) begin // @[Arbiter.scala 70:22]
      state <= _GEN_4;
    end else begin
      state <= _GEN_20;
    end
    if (reset) begin // @[Arbiter.scala 66:37]
      write_addr_reg <= 1'h0; // @[Arbiter.scala 66:37]
    end else if (!(3'h0 == state)) begin // @[Arbiter.scala 70:22]
      if (!(3'h4 == state)) begin // @[Arbiter.scala 70:22]
        if (!(3'h5 == state)) begin // @[Arbiter.scala 70:22]
          write_addr_reg <= _GEN_21;
        end
      end
    end
    if (reset) begin // @[Arbiter.scala 67:37]
      write_data_reg <= 1'h0; // @[Arbiter.scala 67:37]
    end else if (!(3'h0 == state)) begin // @[Arbiter.scala 70:22]
      if (!(3'h4 == state)) begin // @[Arbiter.scala 70:22]
        if (!(3'h5 == state)) begin // @[Arbiter.scala 70:22]
          write_data_reg <= _GEN_22;
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
  state = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  write_addr_reg = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  write_data_reg = _RAND_2[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_041812(
  input          clock,
  input          reset,
  input          io_interrupt,
  input          io_master_awready,
  output         io_master_awvalid,
  output [31:0]  io_master_awaddr,
  output [3:0]   io_master_awid,
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
  input  [1:0]   io_master_bresp,
  input  [3:0]   io_master_bid,
  input          io_master_arready,
  output         io_master_arvalid,
  output [31:0]  io_master_araddr,
  output [3:0]   io_master_arid,
  output [7:0]   io_master_arlen,
  output [2:0]   io_master_arsize,
  output [1:0]   io_master_arburst,
  output         io_master_rready,
  input          io_master_rvalid,
  input  [1:0]   io_master_rresp,
  input  [63:0]  io_master_rdata,
  input          io_master_rlast,
  input  [3:0]   io_master_rid,
  output         io_slave_awready,
  input          io_slave_awvalid,
  input  [31:0]  io_slave_awaddr,
  input  [3:0]   io_slave_awid,
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
  output [1:0]   io_slave_bresp,
  output [3:0]   io_slave_bid,
  output         io_slave_arready,
  input          io_slave_arvalid,
  input  [31:0]  io_slave_araddr,
  input  [3:0]   io_slave_arid,
  input  [7:0]   io_slave_arlen,
  input  [2:0]   io_slave_arsize,
  input  [1:0]   io_slave_arburst,
  input          io_slave_rready,
  output         io_slave_rvalid,
  output [1:0]   io_slave_rresp,
  output [63:0]  io_slave_rdata,
  output         io_slave_rlast,
  output [3:0]   io_slave_rid,
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
  wire  datapath_clock; // @[datapath.scala 961:30]
  wire  datapath_reset; // @[datapath.scala 961:30]
  wire [31:0] datapath_io_ctrl_inst; // @[datapath.scala 961:30]
  wire [1:0] datapath_io_ctrl_pc_sel; // @[datapath.scala 961:30]
  wire  datapath_io_ctrl_A_sel; // @[datapath.scala 961:30]
  wire  datapath_io_ctrl_B_sel; // @[datapath.scala 961:30]
  wire [1:0] datapath_io_ctrl_wd_type; // @[datapath.scala 961:30]
  wire [2:0] datapath_io_ctrl_imm_sel; // @[datapath.scala 961:30]
  wire [2:0] datapath_io_ctrl_br_type; // @[datapath.scala 961:30]
  wire [2:0] datapath_io_ctrl_st_type; // @[datapath.scala 961:30]
  wire [2:0] datapath_io_ctrl_ld_type; // @[datapath.scala 961:30]
  wire [1:0] datapath_io_ctrl_wb_sel; // @[datapath.scala 961:30]
  wire  datapath_io_ctrl_wb_en; // @[datapath.scala 961:30]
  wire [4:0] datapath_io_ctrl_alu_op; // @[datapath.scala 961:30]
  wire  datapath_io_ctrl_prv; // @[datapath.scala 961:30]
  wire [2:0] datapath_io_ctrl_csr_cmd; // @[datapath.scala 961:30]
  wire  datapath_io_ctrl_is_illegal; // @[datapath.scala 961:30]
  wire [31:0] datapath_io_icache_cpu_request_addr; // @[datapath.scala 961:30]
  wire [63:0] datapath_io_icache_cpu_response_data; // @[datapath.scala 961:30]
  wire  datapath_io_icache_cpu_response_ready; // @[datapath.scala 961:30]
  wire  datapath_io_icache_flush; // @[datapath.scala 961:30]
  wire [31:0] datapath_io_dcache_cpu_request_addr; // @[datapath.scala 961:30]
  wire [63:0] datapath_io_dcache_cpu_request_data; // @[datapath.scala 961:30]
  wire [7:0] datapath_io_dcache_cpu_request_mask; // @[datapath.scala 961:30]
  wire  datapath_io_dcache_cpu_request_rw; // @[datapath.scala 961:30]
  wire  datapath_io_dcache_cpu_request_valid; // @[datapath.scala 961:30]
  wire [63:0] datapath_io_dcache_cpu_response_data; // @[datapath.scala 961:30]
  wire  datapath_io_dcache_cpu_response_ready; // @[datapath.scala 961:30]
  wire  datapath_io_dcache_flush; // @[datapath.scala 961:30]
  wire [1:0] datapath_io_dcache_accessType; // @[datapath.scala 961:30]
  wire  datapath_io_interrupt; // @[datapath.scala 961:30]
  wire [31:0] control_io_inst; // @[datapath.scala 962:29]
  wire [1:0] control_io_pc_sel; // @[datapath.scala 962:29]
  wire  control_io_A_sel; // @[datapath.scala 962:29]
  wire  control_io_B_sel; // @[datapath.scala 962:29]
  wire [1:0] control_io_wd_type; // @[datapath.scala 962:29]
  wire [2:0] control_io_imm_sel; // @[datapath.scala 962:29]
  wire [2:0] control_io_br_type; // @[datapath.scala 962:29]
  wire [2:0] control_io_st_type; // @[datapath.scala 962:29]
  wire [2:0] control_io_ld_type; // @[datapath.scala 962:29]
  wire [1:0] control_io_wb_sel; // @[datapath.scala 962:29]
  wire  control_io_wb_en; // @[datapath.scala 962:29]
  wire [4:0] control_io_alu_op; // @[datapath.scala 962:29]
  wire  control_io_prv; // @[datapath.scala 962:29]
  wire [2:0] control_io_csr_cmd; // @[datapath.scala 962:29]
  wire  control_io_is_illegal; // @[datapath.scala 962:29]
  wire  icache_clock; // @[datapath.scala 963:28]
  wire  icache_reset; // @[datapath.scala 963:28]
  wire [31:0] icache_io_cpu_request_addr; // @[datapath.scala 963:28]
  wire [63:0] icache_io_cpu_response_data; // @[datapath.scala 963:28]
  wire  icache_io_cpu_response_ready; // @[datapath.scala 963:28]
  wire  icache_io_mem_io_ar_ready; // @[datapath.scala 963:28]
  wire  icache_io_mem_io_ar_valid; // @[datapath.scala 963:28]
  wire [31:0] icache_io_mem_io_ar_bits_addr; // @[datapath.scala 963:28]
  wire [7:0] icache_io_mem_io_ar_bits_len; // @[datapath.scala 963:28]
  wire [2:0] icache_io_mem_io_ar_bits_size; // @[datapath.scala 963:28]
  wire  icache_io_mem_io_r_ready; // @[datapath.scala 963:28]
  wire  icache_io_mem_io_r_valid; // @[datapath.scala 963:28]
  wire [63:0] icache_io_mem_io_r_bits_data; // @[datapath.scala 963:28]
  wire  icache_io_mem_io_r_bits_last; // @[datapath.scala 963:28]
  wire  icache_io_flush; // @[datapath.scala 963:28]
  wire [5:0] icache_io_sram0_addr; // @[datapath.scala 963:28]
  wire  icache_io_sram0_wen; // @[datapath.scala 963:28]
  wire [127:0] icache_io_sram0_wmask; // @[datapath.scala 963:28]
  wire [127:0] icache_io_sram0_wdata; // @[datapath.scala 963:28]
  wire [127:0] icache_io_sram0_rdata; // @[datapath.scala 963:28]
  wire [5:0] icache_io_sram1_addr; // @[datapath.scala 963:28]
  wire  icache_io_sram1_wen; // @[datapath.scala 963:28]
  wire [127:0] icache_io_sram1_wmask; // @[datapath.scala 963:28]
  wire [127:0] icache_io_sram1_wdata; // @[datapath.scala 963:28]
  wire [127:0] icache_io_sram1_rdata; // @[datapath.scala 963:28]
  wire [5:0] icache_io_sram2_addr; // @[datapath.scala 963:28]
  wire  icache_io_sram2_wen; // @[datapath.scala 963:28]
  wire [127:0] icache_io_sram2_wmask; // @[datapath.scala 963:28]
  wire [127:0] icache_io_sram2_wdata; // @[datapath.scala 963:28]
  wire [127:0] icache_io_sram2_rdata; // @[datapath.scala 963:28]
  wire [5:0] icache_io_sram3_addr; // @[datapath.scala 963:28]
  wire  icache_io_sram3_wen; // @[datapath.scala 963:28]
  wire [127:0] icache_io_sram3_wmask; // @[datapath.scala 963:28]
  wire [127:0] icache_io_sram3_wdata; // @[datapath.scala 963:28]
  wire [127:0] icache_io_sram3_rdata; // @[datapath.scala 963:28]
  wire  dcache_clock; // @[datapath.scala 964:28]
  wire  dcache_reset; // @[datapath.scala 964:28]
  wire [31:0] dcache_io_cpu_request_addr; // @[datapath.scala 964:28]
  wire [63:0] dcache_io_cpu_request_data; // @[datapath.scala 964:28]
  wire [7:0] dcache_io_cpu_request_mask; // @[datapath.scala 964:28]
  wire  dcache_io_cpu_request_rw; // @[datapath.scala 964:28]
  wire  dcache_io_cpu_request_valid; // @[datapath.scala 964:28]
  wire [63:0] dcache_io_cpu_response_data; // @[datapath.scala 964:28]
  wire  dcache_io_cpu_response_ready; // @[datapath.scala 964:28]
  wire  dcache_io_mem_io_aw_ready; // @[datapath.scala 964:28]
  wire  dcache_io_mem_io_aw_valid; // @[datapath.scala 964:28]
  wire [31:0] dcache_io_mem_io_aw_bits_addr; // @[datapath.scala 964:28]
  wire [7:0] dcache_io_mem_io_aw_bits_len; // @[datapath.scala 964:28]
  wire [2:0] dcache_io_mem_io_aw_bits_size; // @[datapath.scala 964:28]
  wire  dcache_io_mem_io_w_ready; // @[datapath.scala 964:28]
  wire  dcache_io_mem_io_w_valid; // @[datapath.scala 964:28]
  wire [63:0] dcache_io_mem_io_w_bits_data; // @[datapath.scala 964:28]
  wire [7:0] dcache_io_mem_io_w_bits_strb; // @[datapath.scala 964:28]
  wire  dcache_io_mem_io_w_bits_last; // @[datapath.scala 964:28]
  wire  dcache_io_mem_io_b_ready; // @[datapath.scala 964:28]
  wire  dcache_io_mem_io_b_valid; // @[datapath.scala 964:28]
  wire  dcache_io_mem_io_ar_ready; // @[datapath.scala 964:28]
  wire  dcache_io_mem_io_ar_valid; // @[datapath.scala 964:28]
  wire [31:0] dcache_io_mem_io_ar_bits_addr; // @[datapath.scala 964:28]
  wire [7:0] dcache_io_mem_io_ar_bits_len; // @[datapath.scala 964:28]
  wire [2:0] dcache_io_mem_io_ar_bits_size; // @[datapath.scala 964:28]
  wire  dcache_io_mem_io_r_ready; // @[datapath.scala 964:28]
  wire  dcache_io_mem_io_r_valid; // @[datapath.scala 964:28]
  wire [63:0] dcache_io_mem_io_r_bits_data; // @[datapath.scala 964:28]
  wire  dcache_io_mem_io_r_bits_last; // @[datapath.scala 964:28]
  wire  dcache_io_flush; // @[datapath.scala 964:28]
  wire [1:0] dcache_io_accessType; // @[datapath.scala 964:28]
  wire [5:0] dcache_io_sram0_addr; // @[datapath.scala 964:28]
  wire  dcache_io_sram0_wen; // @[datapath.scala 964:28]
  wire [127:0] dcache_io_sram0_wmask; // @[datapath.scala 964:28]
  wire [127:0] dcache_io_sram0_wdata; // @[datapath.scala 964:28]
  wire [127:0] dcache_io_sram0_rdata; // @[datapath.scala 964:28]
  wire [5:0] dcache_io_sram1_addr; // @[datapath.scala 964:28]
  wire  dcache_io_sram1_wen; // @[datapath.scala 964:28]
  wire [127:0] dcache_io_sram1_wmask; // @[datapath.scala 964:28]
  wire [127:0] dcache_io_sram1_wdata; // @[datapath.scala 964:28]
  wire [127:0] dcache_io_sram1_rdata; // @[datapath.scala 964:28]
  wire [5:0] dcache_io_sram2_addr; // @[datapath.scala 964:28]
  wire  dcache_io_sram2_wen; // @[datapath.scala 964:28]
  wire [127:0] dcache_io_sram2_wmask; // @[datapath.scala 964:28]
  wire [127:0] dcache_io_sram2_wdata; // @[datapath.scala 964:28]
  wire [127:0] dcache_io_sram2_rdata; // @[datapath.scala 964:28]
  wire [5:0] dcache_io_sram3_addr; // @[datapath.scala 964:28]
  wire  dcache_io_sram3_wen; // @[datapath.scala 964:28]
  wire [127:0] dcache_io_sram3_wmask; // @[datapath.scala 964:28]
  wire [127:0] dcache_io_sram3_wdata; // @[datapath.scala 964:28]
  wire [127:0] dcache_io_sram3_rdata; // @[datapath.scala 964:28]
  wire  arb_clock; // @[datapath.scala 965:25]
  wire  arb_reset; // @[datapath.scala 965:25]
  wire  arb_io_icache_ar_ready; // @[datapath.scala 965:25]
  wire  arb_io_icache_ar_valid; // @[datapath.scala 965:25]
  wire [31:0] arb_io_icache_ar_bits_addr; // @[datapath.scala 965:25]
  wire [7:0] arb_io_icache_ar_bits_len; // @[datapath.scala 965:25]
  wire [2:0] arb_io_icache_ar_bits_size; // @[datapath.scala 965:25]
  wire  arb_io_icache_r_ready; // @[datapath.scala 965:25]
  wire  arb_io_icache_r_valid; // @[datapath.scala 965:25]
  wire [63:0] arb_io_icache_r_bits_data; // @[datapath.scala 965:25]
  wire  arb_io_icache_r_bits_last; // @[datapath.scala 965:25]
  wire  arb_io_dcache_aw_ready; // @[datapath.scala 965:25]
  wire  arb_io_dcache_aw_valid; // @[datapath.scala 965:25]
  wire [31:0] arb_io_dcache_aw_bits_addr; // @[datapath.scala 965:25]
  wire [7:0] arb_io_dcache_aw_bits_len; // @[datapath.scala 965:25]
  wire [2:0] arb_io_dcache_aw_bits_size; // @[datapath.scala 965:25]
  wire  arb_io_dcache_w_ready; // @[datapath.scala 965:25]
  wire  arb_io_dcache_w_valid; // @[datapath.scala 965:25]
  wire [63:0] arb_io_dcache_w_bits_data; // @[datapath.scala 965:25]
  wire [7:0] arb_io_dcache_w_bits_strb; // @[datapath.scala 965:25]
  wire  arb_io_dcache_w_bits_last; // @[datapath.scala 965:25]
  wire  arb_io_dcache_b_ready; // @[datapath.scala 965:25]
  wire  arb_io_dcache_b_valid; // @[datapath.scala 965:25]
  wire  arb_io_dcache_ar_ready; // @[datapath.scala 965:25]
  wire  arb_io_dcache_ar_valid; // @[datapath.scala 965:25]
  wire [31:0] arb_io_dcache_ar_bits_addr; // @[datapath.scala 965:25]
  wire [7:0] arb_io_dcache_ar_bits_len; // @[datapath.scala 965:25]
  wire [2:0] arb_io_dcache_ar_bits_size; // @[datapath.scala 965:25]
  wire  arb_io_dcache_r_ready; // @[datapath.scala 965:25]
  wire  arb_io_dcache_r_valid; // @[datapath.scala 965:25]
  wire [63:0] arb_io_dcache_r_bits_data; // @[datapath.scala 965:25]
  wire  arb_io_dcache_r_bits_last; // @[datapath.scala 965:25]
  wire  arb_io_axi_out_aw_ready; // @[datapath.scala 965:25]
  wire  arb_io_axi_out_aw_valid; // @[datapath.scala 965:25]
  wire [31:0] arb_io_axi_out_aw_bits_addr; // @[datapath.scala 965:25]
  wire [7:0] arb_io_axi_out_aw_bits_len; // @[datapath.scala 965:25]
  wire [2:0] arb_io_axi_out_aw_bits_size; // @[datapath.scala 965:25]
  wire  arb_io_axi_out_w_ready; // @[datapath.scala 965:25]
  wire  arb_io_axi_out_w_valid; // @[datapath.scala 965:25]
  wire [63:0] arb_io_axi_out_w_bits_data; // @[datapath.scala 965:25]
  wire [7:0] arb_io_axi_out_w_bits_strb; // @[datapath.scala 965:25]
  wire  arb_io_axi_out_w_bits_last; // @[datapath.scala 965:25]
  wire  arb_io_axi_out_b_ready; // @[datapath.scala 965:25]
  wire  arb_io_axi_out_b_valid; // @[datapath.scala 965:25]
  wire  arb_io_axi_out_ar_ready; // @[datapath.scala 965:25]
  wire  arb_io_axi_out_ar_valid; // @[datapath.scala 965:25]
  wire [31:0] arb_io_axi_out_ar_bits_addr; // @[datapath.scala 965:25]
  wire [7:0] arb_io_axi_out_ar_bits_len; // @[datapath.scala 965:25]
  wire [2:0] arb_io_axi_out_ar_bits_size; // @[datapath.scala 965:25]
  wire  arb_io_axi_out_r_ready; // @[datapath.scala 965:25]
  wire  arb_io_axi_out_r_valid; // @[datapath.scala 965:25]
  wire [63:0] arb_io_axi_out_r_bits_data; // @[datapath.scala 965:25]
  wire  arb_io_axi_out_r_bits_last; // @[datapath.scala 965:25]
  ysyx_041812_Datapath datapath ( // @[datapath.scala 961:30]
    .clock(datapath_clock),
    .reset(datapath_reset),
    .io_ctrl_inst(datapath_io_ctrl_inst),
    .io_ctrl_pc_sel(datapath_io_ctrl_pc_sel),
    .io_ctrl_A_sel(datapath_io_ctrl_A_sel),
    .io_ctrl_B_sel(datapath_io_ctrl_B_sel),
    .io_ctrl_wd_type(datapath_io_ctrl_wd_type),
    .io_ctrl_imm_sel(datapath_io_ctrl_imm_sel),
    .io_ctrl_br_type(datapath_io_ctrl_br_type),
    .io_ctrl_st_type(datapath_io_ctrl_st_type),
    .io_ctrl_ld_type(datapath_io_ctrl_ld_type),
    .io_ctrl_wb_sel(datapath_io_ctrl_wb_sel),
    .io_ctrl_wb_en(datapath_io_ctrl_wb_en),
    .io_ctrl_alu_op(datapath_io_ctrl_alu_op),
    .io_ctrl_prv(datapath_io_ctrl_prv),
    .io_ctrl_csr_cmd(datapath_io_ctrl_csr_cmd),
    .io_ctrl_is_illegal(datapath_io_ctrl_is_illegal),
    .io_icache_cpu_request_addr(datapath_io_icache_cpu_request_addr),
    .io_icache_cpu_response_data(datapath_io_icache_cpu_response_data),
    .io_icache_cpu_response_ready(datapath_io_icache_cpu_response_ready),
    .io_icache_flush(datapath_io_icache_flush),
    .io_dcache_cpu_request_addr(datapath_io_dcache_cpu_request_addr),
    .io_dcache_cpu_request_data(datapath_io_dcache_cpu_request_data),
    .io_dcache_cpu_request_mask(datapath_io_dcache_cpu_request_mask),
    .io_dcache_cpu_request_rw(datapath_io_dcache_cpu_request_rw),
    .io_dcache_cpu_request_valid(datapath_io_dcache_cpu_request_valid),
    .io_dcache_cpu_response_data(datapath_io_dcache_cpu_response_data),
    .io_dcache_cpu_response_ready(datapath_io_dcache_cpu_response_ready),
    .io_dcache_flush(datapath_io_dcache_flush),
    .io_dcache_accessType(datapath_io_dcache_accessType),
    .io_interrupt(datapath_io_interrupt)
  );
  ysyx_041812_Control control ( // @[datapath.scala 962:29]
    .io_inst(control_io_inst),
    .io_pc_sel(control_io_pc_sel),
    .io_A_sel(control_io_A_sel),
    .io_B_sel(control_io_B_sel),
    .io_wd_type(control_io_wd_type),
    .io_imm_sel(control_io_imm_sel),
    .io_br_type(control_io_br_type),
    .io_st_type(control_io_st_type),
    .io_ld_type(control_io_ld_type),
    .io_wb_sel(control_io_wb_sel),
    .io_wb_en(control_io_wb_en),
    .io_alu_op(control_io_alu_op),
    .io_prv(control_io_prv),
    .io_csr_cmd(control_io_csr_cmd),
    .io_is_illegal(control_io_is_illegal)
  );
  ysyx_041812_Cache icache ( // @[datapath.scala 963:28]
    .clock(icache_clock),
    .reset(icache_reset),
    .io_cpu_request_addr(icache_io_cpu_request_addr),
    .io_cpu_response_data(icache_io_cpu_response_data),
    .io_cpu_response_ready(icache_io_cpu_response_ready),
    .io_mem_io_ar_ready(icache_io_mem_io_ar_ready),
    .io_mem_io_ar_valid(icache_io_mem_io_ar_valid),
    .io_mem_io_ar_bits_addr(icache_io_mem_io_ar_bits_addr),
    .io_mem_io_ar_bits_len(icache_io_mem_io_ar_bits_len),
    .io_mem_io_ar_bits_size(icache_io_mem_io_ar_bits_size),
    .io_mem_io_r_ready(icache_io_mem_io_r_ready),
    .io_mem_io_r_valid(icache_io_mem_io_r_valid),
    .io_mem_io_r_bits_data(icache_io_mem_io_r_bits_data),
    .io_mem_io_r_bits_last(icache_io_mem_io_r_bits_last),
    .io_flush(icache_io_flush),
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
  ysyx_041812_Cache_1 dcache ( // @[datapath.scala 964:28]
    .clock(dcache_clock),
    .reset(dcache_reset),
    .io_cpu_request_addr(dcache_io_cpu_request_addr),
    .io_cpu_request_data(dcache_io_cpu_request_data),
    .io_cpu_request_mask(dcache_io_cpu_request_mask),
    .io_cpu_request_rw(dcache_io_cpu_request_rw),
    .io_cpu_request_valid(dcache_io_cpu_request_valid),
    .io_cpu_response_data(dcache_io_cpu_response_data),
    .io_cpu_response_ready(dcache_io_cpu_response_ready),
    .io_mem_io_aw_ready(dcache_io_mem_io_aw_ready),
    .io_mem_io_aw_valid(dcache_io_mem_io_aw_valid),
    .io_mem_io_aw_bits_addr(dcache_io_mem_io_aw_bits_addr),
    .io_mem_io_aw_bits_len(dcache_io_mem_io_aw_bits_len),
    .io_mem_io_aw_bits_size(dcache_io_mem_io_aw_bits_size),
    .io_mem_io_w_ready(dcache_io_mem_io_w_ready),
    .io_mem_io_w_valid(dcache_io_mem_io_w_valid),
    .io_mem_io_w_bits_data(dcache_io_mem_io_w_bits_data),
    .io_mem_io_w_bits_strb(dcache_io_mem_io_w_bits_strb),
    .io_mem_io_w_bits_last(dcache_io_mem_io_w_bits_last),
    .io_mem_io_b_ready(dcache_io_mem_io_b_ready),
    .io_mem_io_b_valid(dcache_io_mem_io_b_valid),
    .io_mem_io_ar_ready(dcache_io_mem_io_ar_ready),
    .io_mem_io_ar_valid(dcache_io_mem_io_ar_valid),
    .io_mem_io_ar_bits_addr(dcache_io_mem_io_ar_bits_addr),
    .io_mem_io_ar_bits_len(dcache_io_mem_io_ar_bits_len),
    .io_mem_io_ar_bits_size(dcache_io_mem_io_ar_bits_size),
    .io_mem_io_r_ready(dcache_io_mem_io_r_ready),
    .io_mem_io_r_valid(dcache_io_mem_io_r_valid),
    .io_mem_io_r_bits_data(dcache_io_mem_io_r_bits_data),
    .io_mem_io_r_bits_last(dcache_io_mem_io_r_bits_last),
    .io_flush(dcache_io_flush),
    .io_accessType(dcache_io_accessType),
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
  ysyx_041812_CacheArbiter arb ( // @[datapath.scala 965:25]
    .clock(arb_clock),
    .reset(arb_reset),
    .io_icache_ar_ready(arb_io_icache_ar_ready),
    .io_icache_ar_valid(arb_io_icache_ar_valid),
    .io_icache_ar_bits_addr(arb_io_icache_ar_bits_addr),
    .io_icache_ar_bits_len(arb_io_icache_ar_bits_len),
    .io_icache_ar_bits_size(arb_io_icache_ar_bits_size),
    .io_icache_r_ready(arb_io_icache_r_ready),
    .io_icache_r_valid(arb_io_icache_r_valid),
    .io_icache_r_bits_data(arb_io_icache_r_bits_data),
    .io_icache_r_bits_last(arb_io_icache_r_bits_last),
    .io_dcache_aw_ready(arb_io_dcache_aw_ready),
    .io_dcache_aw_valid(arb_io_dcache_aw_valid),
    .io_dcache_aw_bits_addr(arb_io_dcache_aw_bits_addr),
    .io_dcache_aw_bits_len(arb_io_dcache_aw_bits_len),
    .io_dcache_aw_bits_size(arb_io_dcache_aw_bits_size),
    .io_dcache_w_ready(arb_io_dcache_w_ready),
    .io_dcache_w_valid(arb_io_dcache_w_valid),
    .io_dcache_w_bits_data(arb_io_dcache_w_bits_data),
    .io_dcache_w_bits_strb(arb_io_dcache_w_bits_strb),
    .io_dcache_w_bits_last(arb_io_dcache_w_bits_last),
    .io_dcache_b_ready(arb_io_dcache_b_ready),
    .io_dcache_b_valid(arb_io_dcache_b_valid),
    .io_dcache_ar_ready(arb_io_dcache_ar_ready),
    .io_dcache_ar_valid(arb_io_dcache_ar_valid),
    .io_dcache_ar_bits_addr(arb_io_dcache_ar_bits_addr),
    .io_dcache_ar_bits_len(arb_io_dcache_ar_bits_len),
    .io_dcache_ar_bits_size(arb_io_dcache_ar_bits_size),
    .io_dcache_r_ready(arb_io_dcache_r_ready),
    .io_dcache_r_valid(arb_io_dcache_r_valid),
    .io_dcache_r_bits_data(arb_io_dcache_r_bits_data),
    .io_dcache_r_bits_last(arb_io_dcache_r_bits_last),
    .io_axi_out_aw_ready(arb_io_axi_out_aw_ready),
    .io_axi_out_aw_valid(arb_io_axi_out_aw_valid),
    .io_axi_out_aw_bits_addr(arb_io_axi_out_aw_bits_addr),
    .io_axi_out_aw_bits_len(arb_io_axi_out_aw_bits_len),
    .io_axi_out_aw_bits_size(arb_io_axi_out_aw_bits_size),
    .io_axi_out_w_ready(arb_io_axi_out_w_ready),
    .io_axi_out_w_valid(arb_io_axi_out_w_valid),
    .io_axi_out_w_bits_data(arb_io_axi_out_w_bits_data),
    .io_axi_out_w_bits_strb(arb_io_axi_out_w_bits_strb),
    .io_axi_out_w_bits_last(arb_io_axi_out_w_bits_last),
    .io_axi_out_b_ready(arb_io_axi_out_b_ready),
    .io_axi_out_b_valid(arb_io_axi_out_b_valid),
    .io_axi_out_ar_ready(arb_io_axi_out_ar_ready),
    .io_axi_out_ar_valid(arb_io_axi_out_ar_valid),
    .io_axi_out_ar_bits_addr(arb_io_axi_out_ar_bits_addr),
    .io_axi_out_ar_bits_len(arb_io_axi_out_ar_bits_len),
    .io_axi_out_ar_bits_size(arb_io_axi_out_ar_bits_size),
    .io_axi_out_r_ready(arb_io_axi_out_r_ready),
    .io_axi_out_r_valid(arb_io_axi_out_r_valid),
    .io_axi_out_r_bits_data(arb_io_axi_out_r_bits_data),
    .io_axi_out_r_bits_last(arb_io_axi_out_r_bits_last)
  );
  assign io_master_awvalid = arb_io_axi_out_aw_valid; // @[datapath.scala 1036:27]
  assign io_master_awaddr = arb_io_axi_out_aw_bits_addr; // @[datapath.scala 1037:26]
  assign io_master_awid = 4'h0; // @[datapath.scala 1038:24]
  assign io_master_awlen = arb_io_axi_out_aw_bits_len; // @[datapath.scala 1039:25]
  assign io_master_awsize = arb_io_axi_out_aw_bits_size; // @[datapath.scala 1040:26]
  assign io_master_awburst = 2'h1; // @[datapath.scala 1041:27]
  assign io_master_wvalid = arb_io_axi_out_w_valid; // @[datapath.scala 1044:26]
  assign io_master_wdata = arb_io_axi_out_w_bits_data; // @[datapath.scala 1045:25]
  assign io_master_wstrb = arb_io_axi_out_w_bits_strb; // @[datapath.scala 1046:25]
  assign io_master_wlast = arb_io_axi_out_w_bits_last; // @[datapath.scala 1047:25]
  assign io_master_bready = arb_io_axi_out_b_ready; // @[datapath.scala 1049:26]
  assign io_master_arvalid = arb_io_axi_out_ar_valid; // @[datapath.scala 1055:27]
  assign io_master_araddr = arb_io_axi_out_ar_bits_addr; // @[datapath.scala 1056:26]
  assign io_master_arid = 4'h0; // @[datapath.scala 1057:24]
  assign io_master_arlen = arb_io_axi_out_ar_bits_len; // @[datapath.scala 1058:25]
  assign io_master_arsize = arb_io_axi_out_ar_bits_size; // @[datapath.scala 1059:26]
  assign io_master_arburst = 2'h1; // @[datapath.scala 1060:27]
  assign io_master_rready = arb_io_axi_out_r_ready; // @[datapath.scala 1062:26]
  assign io_slave_awready = 1'h0; // @[datapath.scala 1069:26]
  assign io_slave_wready = 1'h0; // @[datapath.scala 1070:26]
  assign io_slave_bvalid = 1'h0; // @[datapath.scala 1071:26]
  assign io_slave_bresp = 2'h0; // @[datapath.scala 1072:26]
  assign io_slave_bid = 4'h0; // @[datapath.scala 1073:26]
  assign io_slave_arready = 1'h0; // @[datapath.scala 1074:26]
  assign io_slave_rvalid = 1'h0; // @[datapath.scala 1075:26]
  assign io_slave_rresp = 2'h0; // @[datapath.scala 1076:26]
  assign io_slave_rdata = 64'h0; // @[datapath.scala 1077:26]
  assign io_slave_rlast = 1'h0; // @[datapath.scala 1078:26]
  assign io_slave_rid = 4'h0; // @[datapath.scala 1079:26]
  assign io_sram0_addr = icache_io_sram0_addr; // @[datapath.scala 979:23]
  assign io_sram0_cen = 1'h0; // @[datapath.scala 980:23]
  assign io_sram0_wen = icache_io_sram0_wen; // @[datapath.scala 981:23]
  assign io_sram0_wmask = icache_io_sram0_wmask; // @[datapath.scala 982:24]
  assign io_sram0_wdata = icache_io_sram0_wdata; // @[datapath.scala 983:24]
  assign io_sram1_addr = icache_io_sram1_addr; // @[datapath.scala 986:23]
  assign io_sram1_cen = 1'h0; // @[datapath.scala 987:23]
  assign io_sram1_wen = icache_io_sram1_wen; // @[datapath.scala 988:23]
  assign io_sram1_wmask = icache_io_sram1_wmask; // @[datapath.scala 989:24]
  assign io_sram1_wdata = icache_io_sram1_wdata; // @[datapath.scala 990:24]
  assign io_sram2_addr = icache_io_sram2_addr; // @[datapath.scala 993:23]
  assign io_sram2_cen = 1'h0; // @[datapath.scala 994:23]
  assign io_sram2_wen = icache_io_sram2_wen; // @[datapath.scala 995:23]
  assign io_sram2_wmask = icache_io_sram2_wmask; // @[datapath.scala 996:24]
  assign io_sram2_wdata = icache_io_sram2_wdata; // @[datapath.scala 997:24]
  assign io_sram3_addr = icache_io_sram3_addr; // @[datapath.scala 1000:23]
  assign io_sram3_cen = 1'h0; // @[datapath.scala 1001:23]
  assign io_sram3_wen = icache_io_sram3_wen; // @[datapath.scala 1002:23]
  assign io_sram3_wmask = icache_io_sram3_wmask; // @[datapath.scala 1003:24]
  assign io_sram3_wdata = icache_io_sram3_wdata; // @[datapath.scala 1004:24]
  assign io_sram4_addr = dcache_io_sram0_addr; // @[datapath.scala 1007:23]
  assign io_sram4_cen = 1'h0; // @[datapath.scala 1008:23]
  assign io_sram4_wen = dcache_io_sram0_wen; // @[datapath.scala 1009:23]
  assign io_sram4_wmask = dcache_io_sram0_wmask; // @[datapath.scala 1010:24]
  assign io_sram4_wdata = dcache_io_sram0_wdata; // @[datapath.scala 1011:24]
  assign io_sram5_addr = dcache_io_sram1_addr; // @[datapath.scala 1014:23]
  assign io_sram5_cen = 1'h0; // @[datapath.scala 1015:23]
  assign io_sram5_wen = dcache_io_sram1_wen; // @[datapath.scala 1016:23]
  assign io_sram5_wmask = dcache_io_sram1_wmask; // @[datapath.scala 1017:24]
  assign io_sram5_wdata = dcache_io_sram1_wdata; // @[datapath.scala 1018:24]
  assign io_sram6_addr = dcache_io_sram2_addr; // @[datapath.scala 1021:23]
  assign io_sram6_cen = 1'h0; // @[datapath.scala 1022:23]
  assign io_sram6_wen = dcache_io_sram2_wen; // @[datapath.scala 1023:23]
  assign io_sram6_wmask = dcache_io_sram2_wmask; // @[datapath.scala 1024:24]
  assign io_sram6_wdata = dcache_io_sram2_wdata; // @[datapath.scala 1025:24]
  assign io_sram7_addr = dcache_io_sram3_addr; // @[datapath.scala 1028:23]
  assign io_sram7_cen = 1'h0; // @[datapath.scala 1029:23]
  assign io_sram7_wen = dcache_io_sram3_wen; // @[datapath.scala 1030:23]
  assign io_sram7_wmask = dcache_io_sram3_wmask; // @[datapath.scala 1031:24]
  assign io_sram7_wdata = dcache_io_sram3_wdata; // @[datapath.scala 1032:24]
  assign datapath_clock = clock;
  assign datapath_reset = reset;
  assign datapath_io_ctrl_pc_sel = control_io_pc_sel; // @[datapath.scala 966:26]
  assign datapath_io_ctrl_A_sel = control_io_A_sel; // @[datapath.scala 966:26]
  assign datapath_io_ctrl_B_sel = control_io_B_sel; // @[datapath.scala 966:26]
  assign datapath_io_ctrl_wd_type = control_io_wd_type; // @[datapath.scala 966:26]
  assign datapath_io_ctrl_imm_sel = control_io_imm_sel; // @[datapath.scala 966:26]
  assign datapath_io_ctrl_br_type = control_io_br_type; // @[datapath.scala 966:26]
  assign datapath_io_ctrl_st_type = control_io_st_type; // @[datapath.scala 966:26]
  assign datapath_io_ctrl_ld_type = control_io_ld_type; // @[datapath.scala 966:26]
  assign datapath_io_ctrl_wb_sel = control_io_wb_sel; // @[datapath.scala 966:26]
  assign datapath_io_ctrl_wb_en = control_io_wb_en; // @[datapath.scala 966:26]
  assign datapath_io_ctrl_alu_op = control_io_alu_op; // @[datapath.scala 966:26]
  assign datapath_io_ctrl_prv = control_io_prv; // @[datapath.scala 966:26]
  assign datapath_io_ctrl_csr_cmd = control_io_csr_cmd; // @[datapath.scala 966:26]
  assign datapath_io_ctrl_is_illegal = control_io_is_illegal; // @[datapath.scala 966:26]
  assign datapath_io_icache_cpu_response_data = icache_io_cpu_response_data; // @[datapath.scala 969:41]
  assign datapath_io_icache_cpu_response_ready = icache_io_cpu_response_ready; // @[datapath.scala 969:41]
  assign datapath_io_dcache_cpu_response_data = dcache_io_cpu_response_data; // @[datapath.scala 970:41]
  assign datapath_io_dcache_cpu_response_ready = dcache_io_cpu_response_ready; // @[datapath.scala 970:41]
  assign datapath_io_interrupt = io_interrupt; // @[datapath.scala 971:31]
  assign control_io_inst = datapath_io_ctrl_inst; // @[datapath.scala 966:26]
  assign icache_clock = clock;
  assign icache_reset = reset;
  assign icache_io_cpu_request_addr = datapath_io_icache_cpu_request_addr; // @[datapath.scala 967:40]
  assign icache_io_mem_io_ar_ready = arb_io_icache_ar_ready; // @[datapath.scala 976:26]
  assign icache_io_mem_io_r_valid = arb_io_icache_r_valid; // @[datapath.scala 976:26]
  assign icache_io_mem_io_r_bits_data = arb_io_icache_r_bits_data; // @[datapath.scala 976:26]
  assign icache_io_mem_io_r_bits_last = arb_io_icache_r_bits_last; // @[datapath.scala 976:26]
  assign icache_io_flush = datapath_io_icache_flush; // @[datapath.scala 972:25]
  assign icache_io_sram0_rdata = io_sram0_rdata; // @[datapath.scala 984:31]
  assign icache_io_sram1_rdata = io_sram1_rdata; // @[datapath.scala 991:31]
  assign icache_io_sram2_rdata = io_sram2_rdata; // @[datapath.scala 998:31]
  assign icache_io_sram3_rdata = io_sram3_rdata; // @[datapath.scala 1005:31]
  assign dcache_clock = clock;
  assign dcache_reset = reset;
  assign dcache_io_cpu_request_addr = datapath_io_dcache_cpu_request_addr; // @[datapath.scala 968:40]
  assign dcache_io_cpu_request_data = datapath_io_dcache_cpu_request_data; // @[datapath.scala 968:40]
  assign dcache_io_cpu_request_mask = datapath_io_dcache_cpu_request_mask; // @[datapath.scala 968:40]
  assign dcache_io_cpu_request_rw = datapath_io_dcache_cpu_request_rw; // @[datapath.scala 968:40]
  assign dcache_io_cpu_request_valid = datapath_io_dcache_cpu_request_valid; // @[datapath.scala 968:40]
  assign dcache_io_mem_io_aw_ready = arb_io_dcache_aw_ready; // @[datapath.scala 977:26]
  assign dcache_io_mem_io_w_ready = arb_io_dcache_w_ready; // @[datapath.scala 977:26]
  assign dcache_io_mem_io_b_valid = arb_io_dcache_b_valid; // @[datapath.scala 977:26]
  assign dcache_io_mem_io_ar_ready = arb_io_dcache_ar_ready; // @[datapath.scala 977:26]
  assign dcache_io_mem_io_r_valid = arb_io_dcache_r_valid; // @[datapath.scala 977:26]
  assign dcache_io_mem_io_r_bits_data = arb_io_dcache_r_bits_data; // @[datapath.scala 977:26]
  assign dcache_io_mem_io_r_bits_last = arb_io_dcache_r_bits_last; // @[datapath.scala 977:26]
  assign dcache_io_flush = datapath_io_dcache_flush; // @[datapath.scala 973:25]
  assign dcache_io_accessType = datapath_io_dcache_accessType; // @[datapath.scala 975:30]
  assign dcache_io_sram0_rdata = io_sram4_rdata; // @[datapath.scala 1012:31]
  assign dcache_io_sram1_rdata = io_sram5_rdata; // @[datapath.scala 1019:31]
  assign dcache_io_sram2_rdata = io_sram6_rdata; // @[datapath.scala 1026:31]
  assign dcache_io_sram3_rdata = io_sram7_rdata; // @[datapath.scala 1033:31]
  assign arb_clock = clock;
  assign arb_reset = reset;
  assign arb_io_icache_ar_valid = icache_io_mem_io_ar_valid; // @[datapath.scala 976:26]
  assign arb_io_icache_ar_bits_addr = icache_io_mem_io_ar_bits_addr; // @[datapath.scala 976:26]
  assign arb_io_icache_ar_bits_len = icache_io_mem_io_ar_bits_len; // @[datapath.scala 976:26]
  assign arb_io_icache_ar_bits_size = icache_io_mem_io_ar_bits_size; // @[datapath.scala 976:26]
  assign arb_io_icache_r_ready = icache_io_mem_io_r_ready; // @[datapath.scala 976:26]
  assign arb_io_dcache_aw_valid = dcache_io_mem_io_aw_valid; // @[datapath.scala 977:26]
  assign arb_io_dcache_aw_bits_addr = dcache_io_mem_io_aw_bits_addr; // @[datapath.scala 977:26]
  assign arb_io_dcache_aw_bits_len = dcache_io_mem_io_aw_bits_len; // @[datapath.scala 977:26]
  assign arb_io_dcache_aw_bits_size = dcache_io_mem_io_aw_bits_size; // @[datapath.scala 977:26]
  assign arb_io_dcache_w_valid = dcache_io_mem_io_w_valid; // @[datapath.scala 977:26]
  assign arb_io_dcache_w_bits_data = dcache_io_mem_io_w_bits_data; // @[datapath.scala 977:26]
  assign arb_io_dcache_w_bits_strb = dcache_io_mem_io_w_bits_strb; // @[datapath.scala 977:26]
  assign arb_io_dcache_w_bits_last = dcache_io_mem_io_w_bits_last; // @[datapath.scala 977:26]
  assign arb_io_dcache_b_ready = dcache_io_mem_io_b_ready; // @[datapath.scala 977:26]
  assign arb_io_dcache_ar_valid = dcache_io_mem_io_ar_valid; // @[datapath.scala 977:26]
  assign arb_io_dcache_ar_bits_addr = dcache_io_mem_io_ar_bits_addr; // @[datapath.scala 977:26]
  assign arb_io_dcache_ar_bits_len = dcache_io_mem_io_ar_bits_len; // @[datapath.scala 977:26]
  assign arb_io_dcache_ar_bits_size = dcache_io_mem_io_ar_bits_size; // @[datapath.scala 977:26]
  assign arb_io_dcache_r_ready = dcache_io_mem_io_r_ready; // @[datapath.scala 977:26]
  assign arb_io_axi_out_aw_ready = io_master_awready; // @[datapath.scala 1035:33]
  assign arb_io_axi_out_w_ready = io_master_wready; // @[datapath.scala 1043:32]
  assign arb_io_axi_out_b_valid = io_master_bvalid; // @[datapath.scala 1050:32]
  assign arb_io_axi_out_ar_ready = io_master_arready; // @[datapath.scala 1054:33]
  assign arb_io_axi_out_r_valid = io_master_rvalid; // @[datapath.scala 1063:32]
  assign arb_io_axi_out_r_bits_data = io_master_rdata; // @[datapath.scala 1065:36]
  assign arb_io_axi_out_r_bits_last = io_master_rlast; // @[datapath.scala 1066:36]
endmodule
