module ysyx_210669_Controller(
  input  [31:0] io_inst,
  output [3:0]  io_instType,
  output        io_branch,
  output        io_regWrite,
  output        io_aluSrc,
  output [4:0]  io_aluOp,
  output        io_memWrite,
  output        io_memRead,
  output        io_sExtend,
  output [2:0]  io_lsByte,
  output        io_memtoReg,
  output [1:0]  io_shiftByte,
  output [2:0]  io_resultSrc,
  output        io_addSrc,
  output [3:0]  io_csrOp
);
  wire [31:0] _controlSign_T = io_inst & 32'hfe00707f; // @[Lookup.scala 31:38]
  wire  _controlSign_T_1 = 32'h33 == _controlSign_T; // @[Lookup.scala 31:38]
  wire  _controlSign_T_3 = 32'h40000033 == _controlSign_T; // @[Lookup.scala 31:38]
  wire  _controlSign_T_5 = 32'h1033 == _controlSign_T; // @[Lookup.scala 31:38]
  wire  _controlSign_T_7 = 32'h2033 == _controlSign_T; // @[Lookup.scala 31:38]
  wire  _controlSign_T_9 = 32'h3033 == _controlSign_T; // @[Lookup.scala 31:38]
  wire  _controlSign_T_11 = 32'h4033 == _controlSign_T; // @[Lookup.scala 31:38]
  wire  _controlSign_T_13 = 32'h5033 == _controlSign_T; // @[Lookup.scala 31:38]
  wire  _controlSign_T_15 = 32'h40005033 == _controlSign_T; // @[Lookup.scala 31:38]
  wire  _controlSign_T_17 = 32'h6033 == _controlSign_T; // @[Lookup.scala 31:38]
  wire  _controlSign_T_19 = 32'h7033 == _controlSign_T; // @[Lookup.scala 31:38]
  wire [31:0] _controlSign_T_20 = io_inst & 32'h707f; // @[Lookup.scala 31:38]
  wire  _controlSign_T_21 = 32'h67 == _controlSign_T_20; // @[Lookup.scala 31:38]
  wire  _controlSign_T_23 = 32'h3 == _controlSign_T_20; // @[Lookup.scala 31:38]
  wire  _controlSign_T_25 = 32'h1003 == _controlSign_T_20; // @[Lookup.scala 31:38]
  wire  _controlSign_T_27 = 32'h2003 == _controlSign_T_20; // @[Lookup.scala 31:38]
  wire  _controlSign_T_29 = 32'h4003 == _controlSign_T_20; // @[Lookup.scala 31:38]
  wire  _controlSign_T_31 = 32'h5003 == _controlSign_T_20; // @[Lookup.scala 31:38]
  wire  _controlSign_T_33 = 32'h13 == _controlSign_T_20; // @[Lookup.scala 31:38]
  wire  _controlSign_T_35 = 32'h2013 == _controlSign_T_20; // @[Lookup.scala 31:38]
  wire  _controlSign_T_37 = 32'h3013 == _controlSign_T_20; // @[Lookup.scala 31:38]
  wire  _controlSign_T_39 = 32'h4013 == _controlSign_T_20; // @[Lookup.scala 31:38]
  wire  _controlSign_T_41 = 32'h6013 == _controlSign_T_20; // @[Lookup.scala 31:38]
  wire  _controlSign_T_43 = 32'h7013 == _controlSign_T_20; // @[Lookup.scala 31:38]
  wire  _controlSign_T_45 = 32'h100f == io_inst; // @[Lookup.scala 31:38]
  wire  _controlSign_T_47 = 32'h73 == io_inst; // @[Lookup.scala 31:38]
  wire  _controlSign_T_49 = 32'h100073 == io_inst; // @[Lookup.scala 31:38]
  wire  _controlSign_T_51 = 32'h10200073 == io_inst; // @[Lookup.scala 31:38]
  wire  _controlSign_T_53 = 32'h30200073 == io_inst; // @[Lookup.scala 31:38]
  wire  _controlSign_T_55 = 32'h1073 == _controlSign_T_20; // @[Lookup.scala 31:38]
  wire  _controlSign_T_57 = 32'h2073 == _controlSign_T_20; // @[Lookup.scala 31:38]
  wire  _controlSign_T_59 = 32'h3073 == _controlSign_T_20; // @[Lookup.scala 31:38]
  wire  _controlSign_T_61 = 32'h5073 == _controlSign_T_20; // @[Lookup.scala 31:38]
  wire  _controlSign_T_63 = 32'h6073 == _controlSign_T_20; // @[Lookup.scala 31:38]
  wire  _controlSign_T_65 = 32'h7073 == _controlSign_T_20; // @[Lookup.scala 31:38]
  wire  _controlSign_T_67 = 32'h23 == _controlSign_T_20; // @[Lookup.scala 31:38]
  wire  _controlSign_T_69 = 32'h1023 == _controlSign_T_20; // @[Lookup.scala 31:38]
  wire  _controlSign_T_71 = 32'h2023 == _controlSign_T_20; // @[Lookup.scala 31:38]
  wire  _controlSign_T_73 = 32'h63 == _controlSign_T_20; // @[Lookup.scala 31:38]
  wire  _controlSign_T_75 = 32'h1063 == _controlSign_T_20; // @[Lookup.scala 31:38]
  wire  _controlSign_T_77 = 32'h4063 == _controlSign_T_20; // @[Lookup.scala 31:38]
  wire  _controlSign_T_79 = 32'h5063 == _controlSign_T_20; // @[Lookup.scala 31:38]
  wire  _controlSign_T_81 = 32'h6063 == _controlSign_T_20; // @[Lookup.scala 31:38]
  wire  _controlSign_T_83 = 32'h7063 == _controlSign_T_20; // @[Lookup.scala 31:38]
  wire [31:0] _controlSign_T_84 = io_inst & 32'h7f; // @[Lookup.scala 31:38]
  wire  _controlSign_T_85 = 32'h37 == _controlSign_T_84; // @[Lookup.scala 31:38]
  wire  _controlSign_T_87 = 32'h17 == _controlSign_T_84; // @[Lookup.scala 31:38]
  wire  _controlSign_T_89 = 32'h6f == _controlSign_T_84; // @[Lookup.scala 31:38]
  wire  _controlSign_T_91 = 32'h3b == _controlSign_T; // @[Lookup.scala 31:38]
  wire  _controlSign_T_93 = 32'h4000003b == _controlSign_T; // @[Lookup.scala 31:38]
  wire  _controlSign_T_95 = 32'h103b == _controlSign_T; // @[Lookup.scala 31:38]
  wire  _controlSign_T_97 = 32'h503b == _controlSign_T; // @[Lookup.scala 31:38]
  wire  _controlSign_T_99 = 32'h4000503b == _controlSign_T; // @[Lookup.scala 31:38]
  wire  _controlSign_T_101 = 32'h6003 == _controlSign_T_20; // @[Lookup.scala 31:38]
  wire  _controlSign_T_103 = 32'h3003 == _controlSign_T_20; // @[Lookup.scala 31:38]
  wire [31:0] _controlSign_T_104 = io_inst & 32'hfc00707f; // @[Lookup.scala 31:38]
  wire  _controlSign_T_105 = 32'h1013 == _controlSign_T_104; // @[Lookup.scala 31:38]
  wire  _controlSign_T_107 = 32'h5013 == _controlSign_T_104; // @[Lookup.scala 31:38]
  wire  _controlSign_T_109 = 32'h40005013 == _controlSign_T_104; // @[Lookup.scala 31:38]
  wire  _controlSign_T_111 = 32'h1b == _controlSign_T_20; // @[Lookup.scala 31:38]
  wire  _controlSign_T_113 = 32'h101b == _controlSign_T; // @[Lookup.scala 31:38]
  wire  _controlSign_T_115 = 32'h501b == _controlSign_T; // @[Lookup.scala 31:38]
  wire  _controlSign_T_117 = 32'h4000501b == _controlSign_T; // @[Lookup.scala 31:38]
  wire  _controlSign_T_119 = 32'h3023 == _controlSign_T_20; // @[Lookup.scala 31:38]
  wire [3:0] _controlSign_T_120 = _controlSign_T_119 ? 4'h4 : 4'h0; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_121 = _controlSign_T_117 ? 4'h2 : _controlSign_T_120; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_122 = _controlSign_T_115 ? 4'h2 : _controlSign_T_121; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_123 = _controlSign_T_113 ? 4'h2 : _controlSign_T_122; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_124 = _controlSign_T_111 ? 4'h1 : _controlSign_T_123; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_125 = _controlSign_T_109 ? 4'h3 : _controlSign_T_124; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_126 = _controlSign_T_107 ? 4'h3 : _controlSign_T_125; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_127 = _controlSign_T_105 ? 4'h3 : _controlSign_T_126; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_128 = _controlSign_T_103 ? 4'h1 : _controlSign_T_127; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_129 = _controlSign_T_101 ? 4'h1 : _controlSign_T_128; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_130 = _controlSign_T_99 ? 4'h0 : _controlSign_T_129; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_131 = _controlSign_T_97 ? 4'h0 : _controlSign_T_130; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_132 = _controlSign_T_95 ? 4'h0 : _controlSign_T_131; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_133 = _controlSign_T_93 ? 4'h0 : _controlSign_T_132; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_134 = _controlSign_T_91 ? 4'h0 : _controlSign_T_133; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_135 = _controlSign_T_89 ? 4'h7 : _controlSign_T_134; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_136 = _controlSign_T_87 ? 4'h6 : _controlSign_T_135; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_137 = _controlSign_T_85 ? 4'h6 : _controlSign_T_136; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_138 = _controlSign_T_83 ? 4'h5 : _controlSign_T_137; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_139 = _controlSign_T_81 ? 4'h5 : _controlSign_T_138; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_140 = _controlSign_T_79 ? 4'h5 : _controlSign_T_139; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_141 = _controlSign_T_77 ? 4'h5 : _controlSign_T_140; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_142 = _controlSign_T_75 ? 4'h5 : _controlSign_T_141; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_143 = _controlSign_T_73 ? 4'h5 : _controlSign_T_142; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_144 = _controlSign_T_71 ? 4'h4 : _controlSign_T_143; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_145 = _controlSign_T_69 ? 4'h4 : _controlSign_T_144; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_146 = _controlSign_T_67 ? 4'h4 : _controlSign_T_145; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_147 = _controlSign_T_65 ? 4'h8 : _controlSign_T_146; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_148 = _controlSign_T_63 ? 4'h8 : _controlSign_T_147; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_149 = _controlSign_T_61 ? 4'h8 : _controlSign_T_148; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_150 = _controlSign_T_59 ? 4'h8 : _controlSign_T_149; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_151 = _controlSign_T_57 ? 4'h8 : _controlSign_T_150; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_152 = _controlSign_T_55 ? 4'h8 : _controlSign_T_151; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_153 = _controlSign_T_53 ? 4'h8 : _controlSign_T_152; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_154 = _controlSign_T_51 ? 4'h8 : _controlSign_T_153; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_155 = _controlSign_T_49 ? 4'h8 : _controlSign_T_154; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_156 = _controlSign_T_47 ? 4'h8 : _controlSign_T_155; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_157 = _controlSign_T_45 ? 4'h1 : _controlSign_T_156; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_158 = _controlSign_T_43 ? 4'h1 : _controlSign_T_157; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_159 = _controlSign_T_41 ? 4'h1 : _controlSign_T_158; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_160 = _controlSign_T_39 ? 4'h1 : _controlSign_T_159; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_161 = _controlSign_T_37 ? 4'h1 : _controlSign_T_160; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_162 = _controlSign_T_35 ? 4'h1 : _controlSign_T_161; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_163 = _controlSign_T_33 ? 4'h1 : _controlSign_T_162; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_164 = _controlSign_T_31 ? 4'h1 : _controlSign_T_163; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_165 = _controlSign_T_29 ? 4'h1 : _controlSign_T_164; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_166 = _controlSign_T_27 ? 4'h1 : _controlSign_T_165; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_167 = _controlSign_T_25 ? 4'h1 : _controlSign_T_166; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_168 = _controlSign_T_23 ? 4'h1 : _controlSign_T_167; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_169 = _controlSign_T_21 ? 4'h1 : _controlSign_T_168; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_170 = _controlSign_T_19 ? 4'h0 : _controlSign_T_169; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_171 = _controlSign_T_17 ? 4'h0 : _controlSign_T_170; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_172 = _controlSign_T_15 ? 4'h0 : _controlSign_T_171; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_173 = _controlSign_T_13 ? 4'h0 : _controlSign_T_172; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_174 = _controlSign_T_11 ? 4'h0 : _controlSign_T_173; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_175 = _controlSign_T_9 ? 4'h0 : _controlSign_T_174; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_176 = _controlSign_T_7 ? 4'h0 : _controlSign_T_175; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_177 = _controlSign_T_5 ? 4'h0 : _controlSign_T_176; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_178 = _controlSign_T_3 ? 4'h0 : _controlSign_T_177; // @[Lookup.scala 33:37]
  wire  _controlSign_T_195 = _controlSign_T_87 ? 1'h0 : _controlSign_T_89; // @[Lookup.scala 33:37]
  wire  _controlSign_T_196 = _controlSign_T_85 ? 1'h0 : _controlSign_T_195; // @[Lookup.scala 33:37]
  wire  _controlSign_T_203 = _controlSign_T_71 ? 1'h0 : _controlSign_T_73 | (_controlSign_T_75 | (_controlSign_T_77 | (
    _controlSign_T_79 | (_controlSign_T_81 | (_controlSign_T_83 | _controlSign_T_196))))); // @[Lookup.scala 33:37]
  wire  _controlSign_T_204 = _controlSign_T_69 ? 1'h0 : _controlSign_T_203; // @[Lookup.scala 33:37]
  wire  _controlSign_T_205 = _controlSign_T_67 ? 1'h0 : _controlSign_T_204; // @[Lookup.scala 33:37]
  wire  _controlSign_T_206 = _controlSign_T_65 ? 1'h0 : _controlSign_T_205; // @[Lookup.scala 33:37]
  wire  _controlSign_T_207 = _controlSign_T_63 ? 1'h0 : _controlSign_T_206; // @[Lookup.scala 33:37]
  wire  _controlSign_T_208 = _controlSign_T_61 ? 1'h0 : _controlSign_T_207; // @[Lookup.scala 33:37]
  wire  _controlSign_T_209 = _controlSign_T_59 ? 1'h0 : _controlSign_T_208; // @[Lookup.scala 33:37]
  wire  _controlSign_T_210 = _controlSign_T_57 ? 1'h0 : _controlSign_T_209; // @[Lookup.scala 33:37]
  wire  _controlSign_T_211 = _controlSign_T_55 ? 1'h0 : _controlSign_T_210; // @[Lookup.scala 33:37]
  wire  _controlSign_T_216 = _controlSign_T_45 ? 1'h0 : _controlSign_T_47 | (_controlSign_T_49 | (_controlSign_T_51 | (
    _controlSign_T_53 | _controlSign_T_211))); // @[Lookup.scala 33:37]
  wire  _controlSign_T_217 = _controlSign_T_43 ? 1'h0 : _controlSign_T_216; // @[Lookup.scala 33:37]
  wire  _controlSign_T_218 = _controlSign_T_41 ? 1'h0 : _controlSign_T_217; // @[Lookup.scala 33:37]
  wire  _controlSign_T_219 = _controlSign_T_39 ? 1'h0 : _controlSign_T_218; // @[Lookup.scala 33:37]
  wire  _controlSign_T_220 = _controlSign_T_37 ? 1'h0 : _controlSign_T_219; // @[Lookup.scala 33:37]
  wire  _controlSign_T_221 = _controlSign_T_35 ? 1'h0 : _controlSign_T_220; // @[Lookup.scala 33:37]
  wire  _controlSign_T_222 = _controlSign_T_33 ? 1'h0 : _controlSign_T_221; // @[Lookup.scala 33:37]
  wire  _controlSign_T_223 = _controlSign_T_31 ? 1'h0 : _controlSign_T_222; // @[Lookup.scala 33:37]
  wire  _controlSign_T_224 = _controlSign_T_29 ? 1'h0 : _controlSign_T_223; // @[Lookup.scala 33:37]
  wire  _controlSign_T_225 = _controlSign_T_27 ? 1'h0 : _controlSign_T_224; // @[Lookup.scala 33:37]
  wire  _controlSign_T_226 = _controlSign_T_25 ? 1'h0 : _controlSign_T_225; // @[Lookup.scala 33:37]
  wire  _controlSign_T_227 = _controlSign_T_23 ? 1'h0 : _controlSign_T_226; // @[Lookup.scala 33:37]
  wire  _controlSign_T_229 = _controlSign_T_19 ? 1'h0 : _controlSign_T_21 | _controlSign_T_227; // @[Lookup.scala 33:37]
  wire  _controlSign_T_230 = _controlSign_T_17 ? 1'h0 : _controlSign_T_229; // @[Lookup.scala 33:37]
  wire  _controlSign_T_231 = _controlSign_T_15 ? 1'h0 : _controlSign_T_230; // @[Lookup.scala 33:37]
  wire  _controlSign_T_232 = _controlSign_T_13 ? 1'h0 : _controlSign_T_231; // @[Lookup.scala 33:37]
  wire  _controlSign_T_233 = _controlSign_T_11 ? 1'h0 : _controlSign_T_232; // @[Lookup.scala 33:37]
  wire  _controlSign_T_234 = _controlSign_T_9 ? 1'h0 : _controlSign_T_233; // @[Lookup.scala 33:37]
  wire  _controlSign_T_235 = _controlSign_T_7 ? 1'h0 : _controlSign_T_234; // @[Lookup.scala 33:37]
  wire  _controlSign_T_236 = _controlSign_T_5 ? 1'h0 : _controlSign_T_235; // @[Lookup.scala 33:37]
  wire  _controlSign_T_237 = _controlSign_T_3 ? 1'h0 : _controlSign_T_236; // @[Lookup.scala 33:37]
  wire  _controlSign_T_238 = _controlSign_T_119 ? 1'h0 : 1'h1; // @[Lookup.scala 33:37]
  wire  _controlSign_T_256 = _controlSign_T_83 ? 1'h0 : _controlSign_T_85 | (_controlSign_T_87 | (_controlSign_T_89 | (
    _controlSign_T_91 | (_controlSign_T_93 | (_controlSign_T_95 | (_controlSign_T_97 | (_controlSign_T_99 | (
    _controlSign_T_101 | (_controlSign_T_103 | (_controlSign_T_105 | (_controlSign_T_107 | (_controlSign_T_109 | (
    _controlSign_T_111 | (_controlSign_T_113 | (_controlSign_T_115 | (_controlSign_T_117 | _controlSign_T_238)))))))))))
    ))))); // @[Lookup.scala 33:37]
  wire  _controlSign_T_257 = _controlSign_T_81 ? 1'h0 : _controlSign_T_256; // @[Lookup.scala 33:37]
  wire  _controlSign_T_258 = _controlSign_T_79 ? 1'h0 : _controlSign_T_257; // @[Lookup.scala 33:37]
  wire  _controlSign_T_259 = _controlSign_T_77 ? 1'h0 : _controlSign_T_258; // @[Lookup.scala 33:37]
  wire  _controlSign_T_260 = _controlSign_T_75 ? 1'h0 : _controlSign_T_259; // @[Lookup.scala 33:37]
  wire  _controlSign_T_261 = _controlSign_T_73 ? 1'h0 : _controlSign_T_260; // @[Lookup.scala 33:37]
  wire  _controlSign_T_262 = _controlSign_T_71 ? 1'h0 : _controlSign_T_261; // @[Lookup.scala 33:37]
  wire  _controlSign_T_263 = _controlSign_T_69 ? 1'h0 : _controlSign_T_262; // @[Lookup.scala 33:37]
  wire  _controlSign_T_264 = _controlSign_T_67 ? 1'h0 : _controlSign_T_263; // @[Lookup.scala 33:37]
  wire  _controlSign_T_271 = _controlSign_T_53 ? 1'h0 : _controlSign_T_55 | (_controlSign_T_57 | (_controlSign_T_59 | (
    _controlSign_T_61 | (_controlSign_T_63 | (_controlSign_T_65 | _controlSign_T_264))))); // @[Lookup.scala 33:37]
  wire  _controlSign_T_272 = _controlSign_T_51 ? 1'h0 : _controlSign_T_271; // @[Lookup.scala 33:37]
  wire  _controlSign_T_273 = _controlSign_T_49 ? 1'h0 : _controlSign_T_272; // @[Lookup.scala 33:37]
  wire  _controlSign_T_274 = _controlSign_T_47 ? 1'h0 : _controlSign_T_273; // @[Lookup.scala 33:37]
  wire  _controlSign_T_307 = _controlSign_T_99 ? 1'h0 : _controlSign_T_101 | (_controlSign_T_103 | (_controlSign_T_105
     | (_controlSign_T_107 | (_controlSign_T_109 | (_controlSign_T_111 | (_controlSign_T_113 | (_controlSign_T_115 | (
    _controlSign_T_117 | _controlSign_T_119)))))))); // @[Lookup.scala 33:37]
  wire  _controlSign_T_308 = _controlSign_T_97 ? 1'h0 : _controlSign_T_307; // @[Lookup.scala 33:37]
  wire  _controlSign_T_309 = _controlSign_T_95 ? 1'h0 : _controlSign_T_308; // @[Lookup.scala 33:37]
  wire  _controlSign_T_310 = _controlSign_T_93 ? 1'h0 : _controlSign_T_309; // @[Lookup.scala 33:37]
  wire  _controlSign_T_311 = _controlSign_T_91 ? 1'h0 : _controlSign_T_310; // @[Lookup.scala 33:37]
  wire  _controlSign_T_315 = _controlSign_T_83 ? 1'h0 : _controlSign_T_85 | (_controlSign_T_87 | (_controlSign_T_89 |
    _controlSign_T_311)); // @[Lookup.scala 33:37]
  wire  _controlSign_T_316 = _controlSign_T_81 ? 1'h0 : _controlSign_T_315; // @[Lookup.scala 33:37]
  wire  _controlSign_T_317 = _controlSign_T_79 ? 1'h0 : _controlSign_T_316; // @[Lookup.scala 33:37]
  wire  _controlSign_T_318 = _controlSign_T_77 ? 1'h0 : _controlSign_T_317; // @[Lookup.scala 33:37]
  wire  _controlSign_T_319 = _controlSign_T_75 ? 1'h0 : _controlSign_T_318; // @[Lookup.scala 33:37]
  wire  _controlSign_T_320 = _controlSign_T_73 ? 1'h0 : _controlSign_T_319; // @[Lookup.scala 33:37]
  wire  _controlSign_T_347 = _controlSign_T_19 ? 1'h0 : _controlSign_T_21 | (_controlSign_T_23 | (_controlSign_T_25 | (
    _controlSign_T_27 | (_controlSign_T_29 | (_controlSign_T_31 | (_controlSign_T_33 | (_controlSign_T_35 | (
    _controlSign_T_37 | (_controlSign_T_39 | (_controlSign_T_41 | (_controlSign_T_43 | (_controlSign_T_45 | (
    _controlSign_T_47 | (_controlSign_T_49 | (_controlSign_T_51 | (_controlSign_T_53 | (_controlSign_T_55 | (
    _controlSign_T_57 | (_controlSign_T_59 | (_controlSign_T_61 | (_controlSign_T_63 | (_controlSign_T_65 | (
    _controlSign_T_67 | (_controlSign_T_69 | (_controlSign_T_71 | _controlSign_T_320))))))))))))))))))))))))); // @[Lookup.scala 33:37]
  wire  _controlSign_T_348 = _controlSign_T_17 ? 1'h0 : _controlSign_T_347; // @[Lookup.scala 33:37]
  wire  _controlSign_T_349 = _controlSign_T_15 ? 1'h0 : _controlSign_T_348; // @[Lookup.scala 33:37]
  wire  _controlSign_T_350 = _controlSign_T_13 ? 1'h0 : _controlSign_T_349; // @[Lookup.scala 33:37]
  wire  _controlSign_T_351 = _controlSign_T_11 ? 1'h0 : _controlSign_T_350; // @[Lookup.scala 33:37]
  wire  _controlSign_T_352 = _controlSign_T_9 ? 1'h0 : _controlSign_T_351; // @[Lookup.scala 33:37]
  wire  _controlSign_T_353 = _controlSign_T_7 ? 1'h0 : _controlSign_T_352; // @[Lookup.scala 33:37]
  wire  _controlSign_T_354 = _controlSign_T_5 ? 1'h0 : _controlSign_T_353; // @[Lookup.scala 33:37]
  wire  _controlSign_T_355 = _controlSign_T_3 ? 1'h0 : _controlSign_T_354; // @[Lookup.scala 33:37]
  wire [4:0] _controlSign_T_357 = _controlSign_T_117 ? 5'hd : 5'h0; // @[Lookup.scala 33:37]
  wire [4:0] _controlSign_T_358 = _controlSign_T_115 ? 5'hb : _controlSign_T_357; // @[Lookup.scala 33:37]
  wire [4:0] _controlSign_T_359 = _controlSign_T_113 ? 5'h2 : _controlSign_T_358; // @[Lookup.scala 33:37]
  wire [4:0] _controlSign_T_360 = _controlSign_T_111 ? 5'h0 : _controlSign_T_359; // @[Lookup.scala 33:37]
  wire [4:0] _controlSign_T_361 = _controlSign_T_109 ? 5'he : _controlSign_T_360; // @[Lookup.scala 33:37]
  wire [4:0] _controlSign_T_362 = _controlSign_T_107 ? 5'hc : _controlSign_T_361; // @[Lookup.scala 33:37]
  wire [4:0] _controlSign_T_363 = _controlSign_T_105 ? 5'h3 : _controlSign_T_362; // @[Lookup.scala 33:37]
  wire [4:0] _controlSign_T_364 = _controlSign_T_103 ? 5'h0 : _controlSign_T_363; // @[Lookup.scala 33:37]
  wire [4:0] _controlSign_T_365 = _controlSign_T_101 ? 5'h0 : _controlSign_T_364; // @[Lookup.scala 33:37]
  wire [4:0] _controlSign_T_366 = _controlSign_T_99 ? 5'hd : _controlSign_T_365; // @[Lookup.scala 33:37]
  wire [4:0] _controlSign_T_367 = _controlSign_T_97 ? 5'hb : _controlSign_T_366; // @[Lookup.scala 33:37]
  wire [4:0] _controlSign_T_368 = _controlSign_T_95 ? 5'h2 : _controlSign_T_367; // @[Lookup.scala 33:37]
  wire [4:0] _controlSign_T_369 = _controlSign_T_93 ? 5'h1 : _controlSign_T_368; // @[Lookup.scala 33:37]
  wire [4:0] _controlSign_T_370 = _controlSign_T_91 ? 5'h0 : _controlSign_T_369; // @[Lookup.scala 33:37]
  wire [4:0] _controlSign_T_371 = _controlSign_T_89 ? 5'h11 : _controlSign_T_370; // @[Lookup.scala 33:37]
  wire [4:0] _controlSign_T_372 = _controlSign_T_87 ? 5'h0 : _controlSign_T_371; // @[Lookup.scala 33:37]
  wire [4:0] _controlSign_T_373 = _controlSign_T_85 ? 5'h0 : _controlSign_T_372; // @[Lookup.scala 33:37]
  wire [4:0] _controlSign_T_374 = _controlSign_T_83 ? 5'h9 : _controlSign_T_373; // @[Lookup.scala 33:37]
  wire [4:0] _controlSign_T_375 = _controlSign_T_81 ? 5'h5 : _controlSign_T_374; // @[Lookup.scala 33:37]
  wire [4:0] _controlSign_T_376 = _controlSign_T_79 ? 5'h8 : _controlSign_T_375; // @[Lookup.scala 33:37]
  wire [4:0] _controlSign_T_377 = _controlSign_T_77 ? 5'h4 : _controlSign_T_376; // @[Lookup.scala 33:37]
  wire [4:0] _controlSign_T_378 = _controlSign_T_75 ? 5'h7 : _controlSign_T_377; // @[Lookup.scala 33:37]
  wire [4:0] _controlSign_T_379 = _controlSign_T_73 ? 5'h6 : _controlSign_T_378; // @[Lookup.scala 33:37]
  wire [4:0] _controlSign_T_380 = _controlSign_T_71 ? 5'h0 : _controlSign_T_379; // @[Lookup.scala 33:37]
  wire [4:0] _controlSign_T_381 = _controlSign_T_69 ? 5'h0 : _controlSign_T_380; // @[Lookup.scala 33:37]
  wire [4:0] _controlSign_T_382 = _controlSign_T_67 ? 5'h0 : _controlSign_T_381; // @[Lookup.scala 33:37]
  wire [4:0] _controlSign_T_383 = _controlSign_T_65 ? 5'h11 : _controlSign_T_382; // @[Lookup.scala 33:37]
  wire [4:0] _controlSign_T_384 = _controlSign_T_63 ? 5'h11 : _controlSign_T_383; // @[Lookup.scala 33:37]
  wire [4:0] _controlSign_T_385 = _controlSign_T_61 ? 5'h11 : _controlSign_T_384; // @[Lookup.scala 33:37]
  wire [4:0] _controlSign_T_386 = _controlSign_T_59 ? 5'h11 : _controlSign_T_385; // @[Lookup.scala 33:37]
  wire [4:0] _controlSign_T_387 = _controlSign_T_57 ? 5'h11 : _controlSign_T_386; // @[Lookup.scala 33:37]
  wire [4:0] _controlSign_T_388 = _controlSign_T_55 ? 5'h11 : _controlSign_T_387; // @[Lookup.scala 33:37]
  wire [4:0] _controlSign_T_389 = _controlSign_T_53 ? 5'h11 : _controlSign_T_388; // @[Lookup.scala 33:37]
  wire [4:0] _controlSign_T_390 = _controlSign_T_51 ? 5'h11 : _controlSign_T_389; // @[Lookup.scala 33:37]
  wire [4:0] _controlSign_T_391 = _controlSign_T_49 ? 5'h11 : _controlSign_T_390; // @[Lookup.scala 33:37]
  wire [4:0] _controlSign_T_392 = _controlSign_T_47 ? 5'h11 : _controlSign_T_391; // @[Lookup.scala 33:37]
  wire [4:0] _controlSign_T_393 = _controlSign_T_45 ? 5'h0 : _controlSign_T_392; // @[Lookup.scala 33:37]
  wire [4:0] _controlSign_T_394 = _controlSign_T_43 ? 5'h10 : _controlSign_T_393; // @[Lookup.scala 33:37]
  wire [4:0] _controlSign_T_395 = _controlSign_T_41 ? 5'hf : _controlSign_T_394; // @[Lookup.scala 33:37]
  wire [4:0] _controlSign_T_396 = _controlSign_T_39 ? 5'ha : _controlSign_T_395; // @[Lookup.scala 33:37]
  wire [4:0] _controlSign_T_397 = _controlSign_T_37 ? 5'h5 : _controlSign_T_396; // @[Lookup.scala 33:37]
  wire [4:0] _controlSign_T_398 = _controlSign_T_35 ? 5'h4 : _controlSign_T_397; // @[Lookup.scala 33:37]
  wire [4:0] _controlSign_T_399 = _controlSign_T_33 ? 5'h0 : _controlSign_T_398; // @[Lookup.scala 33:37]
  wire [4:0] _controlSign_T_400 = _controlSign_T_31 ? 5'h0 : _controlSign_T_399; // @[Lookup.scala 33:37]
  wire [4:0] _controlSign_T_401 = _controlSign_T_29 ? 5'h0 : _controlSign_T_400; // @[Lookup.scala 33:37]
  wire [4:0] _controlSign_T_402 = _controlSign_T_27 ? 5'h0 : _controlSign_T_401; // @[Lookup.scala 33:37]
  wire [4:0] _controlSign_T_403 = _controlSign_T_25 ? 5'h0 : _controlSign_T_402; // @[Lookup.scala 33:37]
  wire [4:0] _controlSign_T_404 = _controlSign_T_23 ? 5'h0 : _controlSign_T_403; // @[Lookup.scala 33:37]
  wire [4:0] _controlSign_T_405 = _controlSign_T_21 ? 5'h11 : _controlSign_T_404; // @[Lookup.scala 33:37]
  wire [4:0] _controlSign_T_406 = _controlSign_T_19 ? 5'h10 : _controlSign_T_405; // @[Lookup.scala 33:37]
  wire [4:0] _controlSign_T_407 = _controlSign_T_17 ? 5'hf : _controlSign_T_406; // @[Lookup.scala 33:37]
  wire [4:0] _controlSign_T_408 = _controlSign_T_15 ? 5'he : _controlSign_T_407; // @[Lookup.scala 33:37]
  wire [4:0] _controlSign_T_409 = _controlSign_T_13 ? 5'hc : _controlSign_T_408; // @[Lookup.scala 33:37]
  wire [4:0] _controlSign_T_410 = _controlSign_T_11 ? 5'ha : _controlSign_T_409; // @[Lookup.scala 33:37]
  wire [4:0] _controlSign_T_411 = _controlSign_T_9 ? 5'h5 : _controlSign_T_410; // @[Lookup.scala 33:37]
  wire [4:0] _controlSign_T_412 = _controlSign_T_7 ? 5'h4 : _controlSign_T_411; // @[Lookup.scala 33:37]
  wire [4:0] _controlSign_T_413 = _controlSign_T_5 ? 5'h3 : _controlSign_T_412; // @[Lookup.scala 33:37]
  wire [4:0] _controlSign_T_414 = _controlSign_T_3 ? 5'h1 : _controlSign_T_413; // @[Lookup.scala 33:37]
  wire  _controlSign_T_416 = _controlSign_T_117 ? 1'h0 : _controlSign_T_119; // @[Lookup.scala 33:37]
  wire  _controlSign_T_417 = _controlSign_T_115 ? 1'h0 : _controlSign_T_416; // @[Lookup.scala 33:37]
  wire  _controlSign_T_418 = _controlSign_T_113 ? 1'h0 : _controlSign_T_417; // @[Lookup.scala 33:37]
  wire  _controlSign_T_419 = _controlSign_T_111 ? 1'h0 : _controlSign_T_418; // @[Lookup.scala 33:37]
  wire  _controlSign_T_420 = _controlSign_T_109 ? 1'h0 : _controlSign_T_419; // @[Lookup.scala 33:37]
  wire  _controlSign_T_421 = _controlSign_T_107 ? 1'h0 : _controlSign_T_420; // @[Lookup.scala 33:37]
  wire  _controlSign_T_422 = _controlSign_T_105 ? 1'h0 : _controlSign_T_421; // @[Lookup.scala 33:37]
  wire  _controlSign_T_423 = _controlSign_T_103 ? 1'h0 : _controlSign_T_422; // @[Lookup.scala 33:37]
  wire  _controlSign_T_424 = _controlSign_T_101 ? 1'h0 : _controlSign_T_423; // @[Lookup.scala 33:37]
  wire  _controlSign_T_425 = _controlSign_T_99 ? 1'h0 : _controlSign_T_424; // @[Lookup.scala 33:37]
  wire  _controlSign_T_426 = _controlSign_T_97 ? 1'h0 : _controlSign_T_425; // @[Lookup.scala 33:37]
  wire  _controlSign_T_427 = _controlSign_T_95 ? 1'h0 : _controlSign_T_426; // @[Lookup.scala 33:37]
  wire  _controlSign_T_428 = _controlSign_T_93 ? 1'h0 : _controlSign_T_427; // @[Lookup.scala 33:37]
  wire  _controlSign_T_429 = _controlSign_T_91 ? 1'h0 : _controlSign_T_428; // @[Lookup.scala 33:37]
  wire  _controlSign_T_430 = _controlSign_T_89 ? 1'h0 : _controlSign_T_429; // @[Lookup.scala 33:37]
  wire  _controlSign_T_431 = _controlSign_T_87 ? 1'h0 : _controlSign_T_430; // @[Lookup.scala 33:37]
  wire  _controlSign_T_432 = _controlSign_T_85 ? 1'h0 : _controlSign_T_431; // @[Lookup.scala 33:37]
  wire  _controlSign_T_433 = _controlSign_T_83 ? 1'h0 : _controlSign_T_432; // @[Lookup.scala 33:37]
  wire  _controlSign_T_434 = _controlSign_T_81 ? 1'h0 : _controlSign_T_433; // @[Lookup.scala 33:37]
  wire  _controlSign_T_435 = _controlSign_T_79 ? 1'h0 : _controlSign_T_434; // @[Lookup.scala 33:37]
  wire  _controlSign_T_436 = _controlSign_T_77 ? 1'h0 : _controlSign_T_435; // @[Lookup.scala 33:37]
  wire  _controlSign_T_437 = _controlSign_T_75 ? 1'h0 : _controlSign_T_436; // @[Lookup.scala 33:37]
  wire  _controlSign_T_438 = _controlSign_T_73 ? 1'h0 : _controlSign_T_437; // @[Lookup.scala 33:37]
  wire  _controlSign_T_442 = _controlSign_T_65 ? 1'h0 : _controlSign_T_67 | (_controlSign_T_69 | (_controlSign_T_71 |
    _controlSign_T_438)); // @[Lookup.scala 33:37]
  wire  _controlSign_T_443 = _controlSign_T_63 ? 1'h0 : _controlSign_T_442; // @[Lookup.scala 33:37]
  wire  _controlSign_T_444 = _controlSign_T_61 ? 1'h0 : _controlSign_T_443; // @[Lookup.scala 33:37]
  wire  _controlSign_T_445 = _controlSign_T_59 ? 1'h0 : _controlSign_T_444; // @[Lookup.scala 33:37]
  wire  _controlSign_T_446 = _controlSign_T_57 ? 1'h0 : _controlSign_T_445; // @[Lookup.scala 33:37]
  wire  _controlSign_T_447 = _controlSign_T_55 ? 1'h0 : _controlSign_T_446; // @[Lookup.scala 33:37]
  wire  _controlSign_T_448 = _controlSign_T_53 ? 1'h0 : _controlSign_T_447; // @[Lookup.scala 33:37]
  wire  _controlSign_T_449 = _controlSign_T_51 ? 1'h0 : _controlSign_T_448; // @[Lookup.scala 33:37]
  wire  _controlSign_T_450 = _controlSign_T_49 ? 1'h0 : _controlSign_T_449; // @[Lookup.scala 33:37]
  wire  _controlSign_T_451 = _controlSign_T_47 ? 1'h0 : _controlSign_T_450; // @[Lookup.scala 33:37]
  wire  _controlSign_T_452 = _controlSign_T_45 ? 1'h0 : _controlSign_T_451; // @[Lookup.scala 33:37]
  wire  _controlSign_T_453 = _controlSign_T_43 ? 1'h0 : _controlSign_T_452; // @[Lookup.scala 33:37]
  wire  _controlSign_T_454 = _controlSign_T_41 ? 1'h0 : _controlSign_T_453; // @[Lookup.scala 33:37]
  wire  _controlSign_T_455 = _controlSign_T_39 ? 1'h0 : _controlSign_T_454; // @[Lookup.scala 33:37]
  wire  _controlSign_T_456 = _controlSign_T_37 ? 1'h0 : _controlSign_T_455; // @[Lookup.scala 33:37]
  wire  _controlSign_T_457 = _controlSign_T_35 ? 1'h0 : _controlSign_T_456; // @[Lookup.scala 33:37]
  wire  _controlSign_T_458 = _controlSign_T_33 ? 1'h0 : _controlSign_T_457; // @[Lookup.scala 33:37]
  wire  _controlSign_T_459 = _controlSign_T_31 ? 1'h0 : _controlSign_T_458; // @[Lookup.scala 33:37]
  wire  _controlSign_T_460 = _controlSign_T_29 ? 1'h0 : _controlSign_T_459; // @[Lookup.scala 33:37]
  wire  _controlSign_T_461 = _controlSign_T_27 ? 1'h0 : _controlSign_T_460; // @[Lookup.scala 33:37]
  wire  _controlSign_T_462 = _controlSign_T_25 ? 1'h0 : _controlSign_T_461; // @[Lookup.scala 33:37]
  wire  _controlSign_T_463 = _controlSign_T_23 ? 1'h0 : _controlSign_T_462; // @[Lookup.scala 33:37]
  wire  _controlSign_T_464 = _controlSign_T_21 ? 1'h0 : _controlSign_T_463; // @[Lookup.scala 33:37]
  wire  _controlSign_T_465 = _controlSign_T_19 ? 1'h0 : _controlSign_T_464; // @[Lookup.scala 33:37]
  wire  _controlSign_T_466 = _controlSign_T_17 ? 1'h0 : _controlSign_T_465; // @[Lookup.scala 33:37]
  wire  _controlSign_T_467 = _controlSign_T_15 ? 1'h0 : _controlSign_T_466; // @[Lookup.scala 33:37]
  wire  _controlSign_T_468 = _controlSign_T_13 ? 1'h0 : _controlSign_T_467; // @[Lookup.scala 33:37]
  wire  _controlSign_T_469 = _controlSign_T_11 ? 1'h0 : _controlSign_T_468; // @[Lookup.scala 33:37]
  wire  _controlSign_T_470 = _controlSign_T_9 ? 1'h0 : _controlSign_T_469; // @[Lookup.scala 33:37]
  wire  _controlSign_T_471 = _controlSign_T_7 ? 1'h0 : _controlSign_T_470; // @[Lookup.scala 33:37]
  wire  _controlSign_T_472 = _controlSign_T_5 ? 1'h0 : _controlSign_T_471; // @[Lookup.scala 33:37]
  wire  _controlSign_T_473 = _controlSign_T_3 ? 1'h0 : _controlSign_T_472; // @[Lookup.scala 33:37]
  wire  _controlSign_T_484 = _controlSign_T_99 ? 1'h0 : _controlSign_T_101 | _controlSign_T_103; // @[Lookup.scala 33:37]
  wire  _controlSign_T_485 = _controlSign_T_97 ? 1'h0 : _controlSign_T_484; // @[Lookup.scala 33:37]
  wire  _controlSign_T_486 = _controlSign_T_95 ? 1'h0 : _controlSign_T_485; // @[Lookup.scala 33:37]
  wire  _controlSign_T_487 = _controlSign_T_93 ? 1'h0 : _controlSign_T_486; // @[Lookup.scala 33:37]
  wire  _controlSign_T_488 = _controlSign_T_91 ? 1'h0 : _controlSign_T_487; // @[Lookup.scala 33:37]
  wire  _controlSign_T_489 = _controlSign_T_89 ? 1'h0 : _controlSign_T_488; // @[Lookup.scala 33:37]
  wire  _controlSign_T_490 = _controlSign_T_87 ? 1'h0 : _controlSign_T_489; // @[Lookup.scala 33:37]
  wire  _controlSign_T_491 = _controlSign_T_85 ? 1'h0 : _controlSign_T_490; // @[Lookup.scala 33:37]
  wire  _controlSign_T_492 = _controlSign_T_83 ? 1'h0 : _controlSign_T_491; // @[Lookup.scala 33:37]
  wire  _controlSign_T_493 = _controlSign_T_81 ? 1'h0 : _controlSign_T_492; // @[Lookup.scala 33:37]
  wire  _controlSign_T_494 = _controlSign_T_79 ? 1'h0 : _controlSign_T_493; // @[Lookup.scala 33:37]
  wire  _controlSign_T_495 = _controlSign_T_77 ? 1'h0 : _controlSign_T_494; // @[Lookup.scala 33:37]
  wire  _controlSign_T_496 = _controlSign_T_75 ? 1'h0 : _controlSign_T_495; // @[Lookup.scala 33:37]
  wire  _controlSign_T_497 = _controlSign_T_73 ? 1'h0 : _controlSign_T_496; // @[Lookup.scala 33:37]
  wire  _controlSign_T_498 = _controlSign_T_71 ? 1'h0 : _controlSign_T_497; // @[Lookup.scala 33:37]
  wire  _controlSign_T_499 = _controlSign_T_69 ? 1'h0 : _controlSign_T_498; // @[Lookup.scala 33:37]
  wire  _controlSign_T_500 = _controlSign_T_67 ? 1'h0 : _controlSign_T_499; // @[Lookup.scala 33:37]
  wire  _controlSign_T_501 = _controlSign_T_65 ? 1'h0 : _controlSign_T_500; // @[Lookup.scala 33:37]
  wire  _controlSign_T_502 = _controlSign_T_63 ? 1'h0 : _controlSign_T_501; // @[Lookup.scala 33:37]
  wire  _controlSign_T_503 = _controlSign_T_61 ? 1'h0 : _controlSign_T_502; // @[Lookup.scala 33:37]
  wire  _controlSign_T_504 = _controlSign_T_59 ? 1'h0 : _controlSign_T_503; // @[Lookup.scala 33:37]
  wire  _controlSign_T_505 = _controlSign_T_57 ? 1'h0 : _controlSign_T_504; // @[Lookup.scala 33:37]
  wire  _controlSign_T_506 = _controlSign_T_55 ? 1'h0 : _controlSign_T_505; // @[Lookup.scala 33:37]
  wire  _controlSign_T_507 = _controlSign_T_53 ? 1'h0 : _controlSign_T_506; // @[Lookup.scala 33:37]
  wire  _controlSign_T_508 = _controlSign_T_51 ? 1'h0 : _controlSign_T_507; // @[Lookup.scala 33:37]
  wire  _controlSign_T_509 = _controlSign_T_49 ? 1'h0 : _controlSign_T_508; // @[Lookup.scala 33:37]
  wire  _controlSign_T_510 = _controlSign_T_47 ? 1'h0 : _controlSign_T_509; // @[Lookup.scala 33:37]
  wire  _controlSign_T_511 = _controlSign_T_45 ? 1'h0 : _controlSign_T_510; // @[Lookup.scala 33:37]
  wire  _controlSign_T_512 = _controlSign_T_43 ? 1'h0 : _controlSign_T_511; // @[Lookup.scala 33:37]
  wire  _controlSign_T_513 = _controlSign_T_41 ? 1'h0 : _controlSign_T_512; // @[Lookup.scala 33:37]
  wire  _controlSign_T_514 = _controlSign_T_39 ? 1'h0 : _controlSign_T_513; // @[Lookup.scala 33:37]
  wire  _controlSign_T_515 = _controlSign_T_37 ? 1'h0 : _controlSign_T_514; // @[Lookup.scala 33:37]
  wire  _controlSign_T_516 = _controlSign_T_35 ? 1'h0 : _controlSign_T_515; // @[Lookup.scala 33:37]
  wire  _controlSign_T_517 = _controlSign_T_33 ? 1'h0 : _controlSign_T_516; // @[Lookup.scala 33:37]
  wire  _controlSign_T_523 = _controlSign_T_21 ? 1'h0 : _controlSign_T_23 | (_controlSign_T_25 | (_controlSign_T_27 | (
    _controlSign_T_29 | (_controlSign_T_31 | _controlSign_T_517)))); // @[Lookup.scala 33:37]
  wire  _controlSign_T_524 = _controlSign_T_19 ? 1'h0 : _controlSign_T_523; // @[Lookup.scala 33:37]
  wire  _controlSign_T_525 = _controlSign_T_17 ? 1'h0 : _controlSign_T_524; // @[Lookup.scala 33:37]
  wire  _controlSign_T_526 = _controlSign_T_15 ? 1'h0 : _controlSign_T_525; // @[Lookup.scala 33:37]
  wire  _controlSign_T_527 = _controlSign_T_13 ? 1'h0 : _controlSign_T_526; // @[Lookup.scala 33:37]
  wire  _controlSign_T_528 = _controlSign_T_11 ? 1'h0 : _controlSign_T_527; // @[Lookup.scala 33:37]
  wire  _controlSign_T_529 = _controlSign_T_9 ? 1'h0 : _controlSign_T_528; // @[Lookup.scala 33:37]
  wire  _controlSign_T_530 = _controlSign_T_7 ? 1'h0 : _controlSign_T_529; // @[Lookup.scala 33:37]
  wire  _controlSign_T_531 = _controlSign_T_5 ? 1'h0 : _controlSign_T_530; // @[Lookup.scala 33:37]
  wire  _controlSign_T_532 = _controlSign_T_3 ? 1'h0 : _controlSign_T_531; // @[Lookup.scala 33:37]
  wire  _controlSign_T_538 = _controlSign_T_109 ? 1'h0 : _controlSign_T_111 | (_controlSign_T_113 | (_controlSign_T_115
     | _controlSign_T_117)); // @[Lookup.scala 33:37]
  wire  _controlSign_T_539 = _controlSign_T_107 ? 1'h0 : _controlSign_T_538; // @[Lookup.scala 33:37]
  wire  _controlSign_T_540 = _controlSign_T_105 ? 1'h0 : _controlSign_T_539; // @[Lookup.scala 33:37]
  wire  _controlSign_T_541 = _controlSign_T_103 ? 1'h0 : _controlSign_T_540; // @[Lookup.scala 33:37]
  wire  _controlSign_T_542 = _controlSign_T_101 ? 1'h0 : _controlSign_T_541; // @[Lookup.scala 33:37]
  wire  _controlSign_T_548 = _controlSign_T_89 ? 1'h0 : _controlSign_T_91 | (_controlSign_T_93 | (_controlSign_T_95 | (
    _controlSign_T_97 | (_controlSign_T_99 | _controlSign_T_542)))); // @[Lookup.scala 33:37]
  wire  _controlSign_T_549 = _controlSign_T_87 ? 1'h0 : _controlSign_T_548; // @[Lookup.scala 33:37]
  wire  _controlSign_T_551 = _controlSign_T_83 ? 1'h0 : _controlSign_T_85 | _controlSign_T_549; // @[Lookup.scala 33:37]
  wire  _controlSign_T_552 = _controlSign_T_81 ? 1'h0 : _controlSign_T_551; // @[Lookup.scala 33:37]
  wire  _controlSign_T_553 = _controlSign_T_79 ? 1'h0 : _controlSign_T_552; // @[Lookup.scala 33:37]
  wire  _controlSign_T_554 = _controlSign_T_77 ? 1'h0 : _controlSign_T_553; // @[Lookup.scala 33:37]
  wire  _controlSign_T_555 = _controlSign_T_75 ? 1'h0 : _controlSign_T_554; // @[Lookup.scala 33:37]
  wire  _controlSign_T_556 = _controlSign_T_73 ? 1'h0 : _controlSign_T_555; // @[Lookup.scala 33:37]
  wire  _controlSign_T_557 = _controlSign_T_71 ? 1'h0 : _controlSign_T_556; // @[Lookup.scala 33:37]
  wire  _controlSign_T_558 = _controlSign_T_69 ? 1'h0 : _controlSign_T_557; // @[Lookup.scala 33:37]
  wire  _controlSign_T_559 = _controlSign_T_67 ? 1'h0 : _controlSign_T_558; // @[Lookup.scala 33:37]
  wire  _controlSign_T_560 = _controlSign_T_65 ? 1'h0 : _controlSign_T_559; // @[Lookup.scala 33:37]
  wire  _controlSign_T_561 = _controlSign_T_63 ? 1'h0 : _controlSign_T_560; // @[Lookup.scala 33:37]
  wire  _controlSign_T_562 = _controlSign_T_61 ? 1'h0 : _controlSign_T_561; // @[Lookup.scala 33:37]
  wire  _controlSign_T_563 = _controlSign_T_59 ? 1'h0 : _controlSign_T_562; // @[Lookup.scala 33:37]
  wire  _controlSign_T_564 = _controlSign_T_57 ? 1'h0 : _controlSign_T_563; // @[Lookup.scala 33:37]
  wire  _controlSign_T_565 = _controlSign_T_55 ? 1'h0 : _controlSign_T_564; // @[Lookup.scala 33:37]
  wire  _controlSign_T_566 = _controlSign_T_53 ? 1'h0 : _controlSign_T_565; // @[Lookup.scala 33:37]
  wire  _controlSign_T_567 = _controlSign_T_51 ? 1'h0 : _controlSign_T_566; // @[Lookup.scala 33:37]
  wire  _controlSign_T_568 = _controlSign_T_49 ? 1'h0 : _controlSign_T_567; // @[Lookup.scala 33:37]
  wire  _controlSign_T_569 = _controlSign_T_47 ? 1'h0 : _controlSign_T_568; // @[Lookup.scala 33:37]
  wire  _controlSign_T_570 = _controlSign_T_45 ? 1'h0 : _controlSign_T_569; // @[Lookup.scala 33:37]
  wire  _controlSign_T_571 = _controlSign_T_43 ? 1'h0 : _controlSign_T_570; // @[Lookup.scala 33:37]
  wire  _controlSign_T_572 = _controlSign_T_41 ? 1'h0 : _controlSign_T_571; // @[Lookup.scala 33:37]
  wire  _controlSign_T_573 = _controlSign_T_39 ? 1'h0 : _controlSign_T_572; // @[Lookup.scala 33:37]
  wire  _controlSign_T_574 = _controlSign_T_37 ? 1'h0 : _controlSign_T_573; // @[Lookup.scala 33:37]
  wire  _controlSign_T_575 = _controlSign_T_35 ? 1'h0 : _controlSign_T_574; // @[Lookup.scala 33:37]
  wire  _controlSign_T_576 = _controlSign_T_33 ? 1'h0 : _controlSign_T_575; // @[Lookup.scala 33:37]
  wire  _controlSign_T_577 = _controlSign_T_31 ? 1'h0 : _controlSign_T_576; // @[Lookup.scala 33:37]
  wire  _controlSign_T_578 = _controlSign_T_29 ? 1'h0 : _controlSign_T_577; // @[Lookup.scala 33:37]
  wire  _controlSign_T_582 = _controlSign_T_21 ? 1'h0 : _controlSign_T_23 | (_controlSign_T_25 | (_controlSign_T_27 |
    _controlSign_T_578)); // @[Lookup.scala 33:37]
  wire  _controlSign_T_583 = _controlSign_T_19 ? 1'h0 : _controlSign_T_582; // @[Lookup.scala 33:37]
  wire  _controlSign_T_584 = _controlSign_T_17 ? 1'h0 : _controlSign_T_583; // @[Lookup.scala 33:37]
  wire  _controlSign_T_585 = _controlSign_T_15 ? 1'h0 : _controlSign_T_584; // @[Lookup.scala 33:37]
  wire  _controlSign_T_586 = _controlSign_T_13 ? 1'h0 : _controlSign_T_585; // @[Lookup.scala 33:37]
  wire  _controlSign_T_587 = _controlSign_T_11 ? 1'h0 : _controlSign_T_586; // @[Lookup.scala 33:37]
  wire  _controlSign_T_588 = _controlSign_T_9 ? 1'h0 : _controlSign_T_587; // @[Lookup.scala 33:37]
  wire  _controlSign_T_589 = _controlSign_T_7 ? 1'h0 : _controlSign_T_588; // @[Lookup.scala 33:37]
  wire  _controlSign_T_590 = _controlSign_T_5 ? 1'h0 : _controlSign_T_589; // @[Lookup.scala 33:37]
  wire  _controlSign_T_591 = _controlSign_T_3 ? 1'h0 : _controlSign_T_590; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_592 = _controlSign_T_119 ? 3'h5 : 3'h0; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_593 = _controlSign_T_117 ? 3'h4 : _controlSign_T_592; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_594 = _controlSign_T_115 ? 3'h4 : _controlSign_T_593; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_595 = _controlSign_T_113 ? 3'h3 : _controlSign_T_594; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_596 = _controlSign_T_111 ? 3'h3 : _controlSign_T_595; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_597 = _controlSign_T_109 ? 3'h0 : _controlSign_T_596; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_598 = _controlSign_T_107 ? 3'h0 : _controlSign_T_597; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_599 = _controlSign_T_105 ? 3'h0 : _controlSign_T_598; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_600 = _controlSign_T_103 ? 3'h5 : _controlSign_T_599; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_601 = _controlSign_T_101 ? 3'h3 : _controlSign_T_600; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_602 = _controlSign_T_99 ? 3'h4 : _controlSign_T_601; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_603 = _controlSign_T_97 ? 3'h4 : _controlSign_T_602; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_604 = _controlSign_T_95 ? 3'h3 : _controlSign_T_603; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_605 = _controlSign_T_93 ? 3'h3 : _controlSign_T_604; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_606 = _controlSign_T_91 ? 3'h3 : _controlSign_T_605; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_607 = _controlSign_T_89 ? 3'h0 : _controlSign_T_606; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_608 = _controlSign_T_87 ? 3'h0 : _controlSign_T_607; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_609 = _controlSign_T_85 ? 3'h0 : _controlSign_T_608; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_610 = _controlSign_T_83 ? 3'h0 : _controlSign_T_609; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_611 = _controlSign_T_81 ? 3'h0 : _controlSign_T_610; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_612 = _controlSign_T_79 ? 3'h0 : _controlSign_T_611; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_613 = _controlSign_T_77 ? 3'h0 : _controlSign_T_612; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_614 = _controlSign_T_75 ? 3'h0 : _controlSign_T_613; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_615 = _controlSign_T_73 ? 3'h0 : _controlSign_T_614; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_616 = _controlSign_T_71 ? 3'h3 : _controlSign_T_615; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_617 = _controlSign_T_69 ? 3'h2 : _controlSign_T_616; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_618 = _controlSign_T_67 ? 3'h1 : _controlSign_T_617; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_619 = _controlSign_T_65 ? 3'h0 : _controlSign_T_618; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_620 = _controlSign_T_63 ? 3'h0 : _controlSign_T_619; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_621 = _controlSign_T_61 ? 3'h0 : _controlSign_T_620; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_622 = _controlSign_T_59 ? 3'h0 : _controlSign_T_621; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_623 = _controlSign_T_57 ? 3'h0 : _controlSign_T_622; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_624 = _controlSign_T_55 ? 3'h0 : _controlSign_T_623; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_625 = _controlSign_T_53 ? 3'h0 : _controlSign_T_624; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_626 = _controlSign_T_51 ? 3'h0 : _controlSign_T_625; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_627 = _controlSign_T_49 ? 3'h0 : _controlSign_T_626; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_628 = _controlSign_T_47 ? 3'h0 : _controlSign_T_627; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_629 = _controlSign_T_45 ? 3'h0 : _controlSign_T_628; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_630 = _controlSign_T_43 ? 3'h0 : _controlSign_T_629; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_631 = _controlSign_T_41 ? 3'h0 : _controlSign_T_630; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_632 = _controlSign_T_39 ? 3'h0 : _controlSign_T_631; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_633 = _controlSign_T_37 ? 3'h0 : _controlSign_T_632; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_634 = _controlSign_T_35 ? 3'h0 : _controlSign_T_633; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_635 = _controlSign_T_33 ? 3'h0 : _controlSign_T_634; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_636 = _controlSign_T_31 ? 3'h2 : _controlSign_T_635; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_637 = _controlSign_T_29 ? 3'h1 : _controlSign_T_636; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_638 = _controlSign_T_27 ? 3'h3 : _controlSign_T_637; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_639 = _controlSign_T_25 ? 3'h2 : _controlSign_T_638; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_640 = _controlSign_T_23 ? 3'h1 : _controlSign_T_639; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_641 = _controlSign_T_21 ? 3'h0 : _controlSign_T_640; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_642 = _controlSign_T_19 ? 3'h0 : _controlSign_T_641; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_643 = _controlSign_T_17 ? 3'h0 : _controlSign_T_642; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_644 = _controlSign_T_15 ? 3'h0 : _controlSign_T_643; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_645 = _controlSign_T_13 ? 3'h0 : _controlSign_T_644; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_646 = _controlSign_T_11 ? 3'h0 : _controlSign_T_645; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_647 = _controlSign_T_9 ? 3'h0 : _controlSign_T_646; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_648 = _controlSign_T_7 ? 3'h0 : _controlSign_T_647; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_649 = _controlSign_T_5 ? 3'h0 : _controlSign_T_648; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_650 = _controlSign_T_3 ? 3'h0 : _controlSign_T_649; // @[Lookup.scala 33:37]
  wire  _controlSign_T_661 = _controlSign_T_99 ? 1'h0 : _controlSign_T_101 | (_controlSign_T_103 | _controlSign_T_422); // @[Lookup.scala 33:37]
  wire  _controlSign_T_662 = _controlSign_T_97 ? 1'h0 : _controlSign_T_661; // @[Lookup.scala 33:37]
  wire  _controlSign_T_663 = _controlSign_T_95 ? 1'h0 : _controlSign_T_662; // @[Lookup.scala 33:37]
  wire  _controlSign_T_664 = _controlSign_T_93 ? 1'h0 : _controlSign_T_663; // @[Lookup.scala 33:37]
  wire  _controlSign_T_665 = _controlSign_T_91 ? 1'h0 : _controlSign_T_664; // @[Lookup.scala 33:37]
  wire  _controlSign_T_666 = _controlSign_T_89 ? 1'h0 : _controlSign_T_665; // @[Lookup.scala 33:37]
  wire  _controlSign_T_667 = _controlSign_T_87 ? 1'h0 : _controlSign_T_666; // @[Lookup.scala 33:37]
  wire  _controlSign_T_668 = _controlSign_T_85 ? 1'h0 : _controlSign_T_667; // @[Lookup.scala 33:37]
  wire  _controlSign_T_669 = _controlSign_T_83 ? 1'h0 : _controlSign_T_668; // @[Lookup.scala 33:37]
  wire  _controlSign_T_670 = _controlSign_T_81 ? 1'h0 : _controlSign_T_669; // @[Lookup.scala 33:37]
  wire  _controlSign_T_671 = _controlSign_T_79 ? 1'h0 : _controlSign_T_670; // @[Lookup.scala 33:37]
  wire  _controlSign_T_672 = _controlSign_T_77 ? 1'h0 : _controlSign_T_671; // @[Lookup.scala 33:37]
  wire  _controlSign_T_673 = _controlSign_T_75 ? 1'h0 : _controlSign_T_672; // @[Lookup.scala 33:37]
  wire  _controlSign_T_674 = _controlSign_T_73 ? 1'h0 : _controlSign_T_673; // @[Lookup.scala 33:37]
  wire  _controlSign_T_678 = _controlSign_T_65 ? 1'h0 : _controlSign_T_67 | (_controlSign_T_69 | (_controlSign_T_71 |
    _controlSign_T_674)); // @[Lookup.scala 33:37]
  wire  _controlSign_T_679 = _controlSign_T_63 ? 1'h0 : _controlSign_T_678; // @[Lookup.scala 33:37]
  wire  _controlSign_T_680 = _controlSign_T_61 ? 1'h0 : _controlSign_T_679; // @[Lookup.scala 33:37]
  wire  _controlSign_T_681 = _controlSign_T_59 ? 1'h0 : _controlSign_T_680; // @[Lookup.scala 33:37]
  wire  _controlSign_T_682 = _controlSign_T_57 ? 1'h0 : _controlSign_T_681; // @[Lookup.scala 33:37]
  wire  _controlSign_T_683 = _controlSign_T_55 ? 1'h0 : _controlSign_T_682; // @[Lookup.scala 33:37]
  wire  _controlSign_T_684 = _controlSign_T_53 ? 1'h0 : _controlSign_T_683; // @[Lookup.scala 33:37]
  wire  _controlSign_T_685 = _controlSign_T_51 ? 1'h0 : _controlSign_T_684; // @[Lookup.scala 33:37]
  wire  _controlSign_T_686 = _controlSign_T_49 ? 1'h0 : _controlSign_T_685; // @[Lookup.scala 33:37]
  wire  _controlSign_T_687 = _controlSign_T_47 ? 1'h0 : _controlSign_T_686; // @[Lookup.scala 33:37]
  wire  _controlSign_T_688 = _controlSign_T_45 ? 1'h0 : _controlSign_T_687; // @[Lookup.scala 33:37]
  wire  _controlSign_T_689 = _controlSign_T_43 ? 1'h0 : _controlSign_T_688; // @[Lookup.scala 33:37]
  wire  _controlSign_T_690 = _controlSign_T_41 ? 1'h0 : _controlSign_T_689; // @[Lookup.scala 33:37]
  wire  _controlSign_T_691 = _controlSign_T_39 ? 1'h0 : _controlSign_T_690; // @[Lookup.scala 33:37]
  wire  _controlSign_T_692 = _controlSign_T_37 ? 1'h0 : _controlSign_T_691; // @[Lookup.scala 33:37]
  wire  _controlSign_T_693 = _controlSign_T_35 ? 1'h0 : _controlSign_T_692; // @[Lookup.scala 33:37]
  wire  _controlSign_T_694 = _controlSign_T_33 ? 1'h0 : _controlSign_T_693; // @[Lookup.scala 33:37]
  wire  _controlSign_T_700 = _controlSign_T_21 ? 1'h0 : _controlSign_T_23 | (_controlSign_T_25 | (_controlSign_T_27 | (
    _controlSign_T_29 | (_controlSign_T_31 | _controlSign_T_694)))); // @[Lookup.scala 33:37]
  wire  _controlSign_T_701 = _controlSign_T_19 ? 1'h0 : _controlSign_T_700; // @[Lookup.scala 33:37]
  wire  _controlSign_T_702 = _controlSign_T_17 ? 1'h0 : _controlSign_T_701; // @[Lookup.scala 33:37]
  wire  _controlSign_T_703 = _controlSign_T_15 ? 1'h0 : _controlSign_T_702; // @[Lookup.scala 33:37]
  wire  _controlSign_T_704 = _controlSign_T_13 ? 1'h0 : _controlSign_T_703; // @[Lookup.scala 33:37]
  wire  _controlSign_T_705 = _controlSign_T_11 ? 1'h0 : _controlSign_T_704; // @[Lookup.scala 33:37]
  wire  _controlSign_T_706 = _controlSign_T_9 ? 1'h0 : _controlSign_T_705; // @[Lookup.scala 33:37]
  wire  _controlSign_T_707 = _controlSign_T_7 ? 1'h0 : _controlSign_T_706; // @[Lookup.scala 33:37]
  wire  _controlSign_T_708 = _controlSign_T_5 ? 1'h0 : _controlSign_T_707; // @[Lookup.scala 33:37]
  wire  _controlSign_T_709 = _controlSign_T_3 ? 1'h0 : _controlSign_T_708; // @[Lookup.scala 33:37]
  wire [1:0] _controlSign_T_725 = _controlSign_T_89 ? 2'h1 : 2'h0; // @[Lookup.scala 33:37]
  wire [1:0] _controlSign_T_726 = _controlSign_T_87 ? 2'h2 : _controlSign_T_725; // @[Lookup.scala 33:37]
  wire [1:0] _controlSign_T_727 = _controlSign_T_85 ? 2'h2 : _controlSign_T_726; // @[Lookup.scala 33:37]
  wire [1:0] _controlSign_T_728 = _controlSign_T_83 ? 2'h1 : _controlSign_T_727; // @[Lookup.scala 33:37]
  wire [1:0] _controlSign_T_729 = _controlSign_T_81 ? 2'h1 : _controlSign_T_728; // @[Lookup.scala 33:37]
  wire [1:0] _controlSign_T_730 = _controlSign_T_79 ? 2'h1 : _controlSign_T_729; // @[Lookup.scala 33:37]
  wire [1:0] _controlSign_T_731 = _controlSign_T_77 ? 2'h1 : _controlSign_T_730; // @[Lookup.scala 33:37]
  wire [1:0] _controlSign_T_732 = _controlSign_T_75 ? 2'h1 : _controlSign_T_731; // @[Lookup.scala 33:37]
  wire [1:0] _controlSign_T_733 = _controlSign_T_73 ? 2'h1 : _controlSign_T_732; // @[Lookup.scala 33:37]
  wire [1:0] _controlSign_T_734 = _controlSign_T_71 ? 2'h0 : _controlSign_T_733; // @[Lookup.scala 33:37]
  wire [1:0] _controlSign_T_735 = _controlSign_T_69 ? 2'h0 : _controlSign_T_734; // @[Lookup.scala 33:37]
  wire [1:0] _controlSign_T_736 = _controlSign_T_67 ? 2'h0 : _controlSign_T_735; // @[Lookup.scala 33:37]
  wire [1:0] _controlSign_T_737 = _controlSign_T_65 ? 2'h0 : _controlSign_T_736; // @[Lookup.scala 33:37]
  wire [1:0] _controlSign_T_738 = _controlSign_T_63 ? 2'h0 : _controlSign_T_737; // @[Lookup.scala 33:37]
  wire [1:0] _controlSign_T_739 = _controlSign_T_61 ? 2'h0 : _controlSign_T_738; // @[Lookup.scala 33:37]
  wire [1:0] _controlSign_T_740 = _controlSign_T_59 ? 2'h0 : _controlSign_T_739; // @[Lookup.scala 33:37]
  wire [1:0] _controlSign_T_741 = _controlSign_T_57 ? 2'h0 : _controlSign_T_740; // @[Lookup.scala 33:37]
  wire [1:0] _controlSign_T_742 = _controlSign_T_55 ? 2'h0 : _controlSign_T_741; // @[Lookup.scala 33:37]
  wire [1:0] _controlSign_T_743 = _controlSign_T_53 ? 2'h0 : _controlSign_T_742; // @[Lookup.scala 33:37]
  wire [1:0] _controlSign_T_744 = _controlSign_T_51 ? 2'h0 : _controlSign_T_743; // @[Lookup.scala 33:37]
  wire [1:0] _controlSign_T_745 = _controlSign_T_49 ? 2'h0 : _controlSign_T_744; // @[Lookup.scala 33:37]
  wire [1:0] _controlSign_T_746 = _controlSign_T_47 ? 2'h0 : _controlSign_T_745; // @[Lookup.scala 33:37]
  wire [1:0] _controlSign_T_747 = _controlSign_T_45 ? 2'h0 : _controlSign_T_746; // @[Lookup.scala 33:37]
  wire [1:0] _controlSign_T_748 = _controlSign_T_43 ? 2'h0 : _controlSign_T_747; // @[Lookup.scala 33:37]
  wire [1:0] _controlSign_T_749 = _controlSign_T_41 ? 2'h0 : _controlSign_T_748; // @[Lookup.scala 33:37]
  wire [1:0] _controlSign_T_750 = _controlSign_T_39 ? 2'h0 : _controlSign_T_749; // @[Lookup.scala 33:37]
  wire [1:0] _controlSign_T_751 = _controlSign_T_37 ? 2'h0 : _controlSign_T_750; // @[Lookup.scala 33:37]
  wire [1:0] _controlSign_T_752 = _controlSign_T_35 ? 2'h0 : _controlSign_T_751; // @[Lookup.scala 33:37]
  wire [1:0] _controlSign_T_753 = _controlSign_T_33 ? 2'h0 : _controlSign_T_752; // @[Lookup.scala 33:37]
  wire [1:0] _controlSign_T_754 = _controlSign_T_31 ? 2'h0 : _controlSign_T_753; // @[Lookup.scala 33:37]
  wire [1:0] _controlSign_T_755 = _controlSign_T_29 ? 2'h0 : _controlSign_T_754; // @[Lookup.scala 33:37]
  wire [1:0] _controlSign_T_756 = _controlSign_T_27 ? 2'h0 : _controlSign_T_755; // @[Lookup.scala 33:37]
  wire [1:0] _controlSign_T_757 = _controlSign_T_25 ? 2'h0 : _controlSign_T_756; // @[Lookup.scala 33:37]
  wire [1:0] _controlSign_T_758 = _controlSign_T_23 ? 2'h0 : _controlSign_T_757; // @[Lookup.scala 33:37]
  wire [1:0] _controlSign_T_759 = _controlSign_T_21 ? 2'h0 : _controlSign_T_758; // @[Lookup.scala 33:37]
  wire [1:0] _controlSign_T_760 = _controlSign_T_19 ? 2'h0 : _controlSign_T_759; // @[Lookup.scala 33:37]
  wire [1:0] _controlSign_T_761 = _controlSign_T_17 ? 2'h0 : _controlSign_T_760; // @[Lookup.scala 33:37]
  wire [1:0] _controlSign_T_762 = _controlSign_T_15 ? 2'h0 : _controlSign_T_761; // @[Lookup.scala 33:37]
  wire [1:0] _controlSign_T_763 = _controlSign_T_13 ? 2'h0 : _controlSign_T_762; // @[Lookup.scala 33:37]
  wire [1:0] _controlSign_T_764 = _controlSign_T_11 ? 2'h0 : _controlSign_T_763; // @[Lookup.scala 33:37]
  wire [1:0] _controlSign_T_765 = _controlSign_T_9 ? 2'h0 : _controlSign_T_764; // @[Lookup.scala 33:37]
  wire [1:0] _controlSign_T_766 = _controlSign_T_7 ? 2'h0 : _controlSign_T_765; // @[Lookup.scala 33:37]
  wire [1:0] _controlSign_T_767 = _controlSign_T_5 ? 2'h0 : _controlSign_T_766; // @[Lookup.scala 33:37]
  wire [1:0] _controlSign_T_768 = _controlSign_T_3 ? 2'h0 : _controlSign_T_767; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_784 = _controlSign_T_89 ? 3'h4 : 3'h1; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_785 = _controlSign_T_87 ? 3'h3 : _controlSign_T_784; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_786 = _controlSign_T_85 ? 3'h2 : _controlSign_T_785; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_787 = _controlSign_T_83 ? 3'h1 : _controlSign_T_786; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_788 = _controlSign_T_81 ? 3'h1 : _controlSign_T_787; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_789 = _controlSign_T_79 ? 3'h1 : _controlSign_T_788; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_790 = _controlSign_T_77 ? 3'h1 : _controlSign_T_789; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_791 = _controlSign_T_75 ? 3'h1 : _controlSign_T_790; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_792 = _controlSign_T_73 ? 3'h1 : _controlSign_T_791; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_793 = _controlSign_T_71 ? 3'h1 : _controlSign_T_792; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_794 = _controlSign_T_69 ? 3'h1 : _controlSign_T_793; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_795 = _controlSign_T_67 ? 3'h1 : _controlSign_T_794; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_796 = _controlSign_T_65 ? 3'h0 : _controlSign_T_795; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_797 = _controlSign_T_63 ? 3'h0 : _controlSign_T_796; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_798 = _controlSign_T_61 ? 3'h0 : _controlSign_T_797; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_799 = _controlSign_T_59 ? 3'h0 : _controlSign_T_798; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_800 = _controlSign_T_57 ? 3'h0 : _controlSign_T_799; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_801 = _controlSign_T_55 ? 3'h0 : _controlSign_T_800; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_802 = _controlSign_T_53 ? 3'h0 : _controlSign_T_801; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_803 = _controlSign_T_51 ? 3'h0 : _controlSign_T_802; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_804 = _controlSign_T_49 ? 3'h0 : _controlSign_T_803; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_805 = _controlSign_T_47 ? 3'h0 : _controlSign_T_804; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_806 = _controlSign_T_45 ? 3'h1 : _controlSign_T_805; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_807 = _controlSign_T_43 ? 3'h1 : _controlSign_T_806; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_808 = _controlSign_T_41 ? 3'h1 : _controlSign_T_807; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_809 = _controlSign_T_39 ? 3'h1 : _controlSign_T_808; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_810 = _controlSign_T_37 ? 3'h1 : _controlSign_T_809; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_811 = _controlSign_T_35 ? 3'h1 : _controlSign_T_810; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_812 = _controlSign_T_33 ? 3'h1 : _controlSign_T_811; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_813 = _controlSign_T_31 ? 3'h1 : _controlSign_T_812; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_814 = _controlSign_T_29 ? 3'h1 : _controlSign_T_813; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_815 = _controlSign_T_27 ? 3'h1 : _controlSign_T_814; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_816 = _controlSign_T_25 ? 3'h1 : _controlSign_T_815; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_817 = _controlSign_T_23 ? 3'h1 : _controlSign_T_816; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_818 = _controlSign_T_21 ? 3'h4 : _controlSign_T_817; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_819 = _controlSign_T_19 ? 3'h1 : _controlSign_T_818; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_820 = _controlSign_T_17 ? 3'h1 : _controlSign_T_819; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_821 = _controlSign_T_15 ? 3'h1 : _controlSign_T_820; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_822 = _controlSign_T_13 ? 3'h1 : _controlSign_T_821; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_823 = _controlSign_T_11 ? 3'h1 : _controlSign_T_822; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_824 = _controlSign_T_9 ? 3'h1 : _controlSign_T_823; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_825 = _controlSign_T_7 ? 3'h1 : _controlSign_T_824; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_826 = _controlSign_T_5 ? 3'h1 : _controlSign_T_825; // @[Lookup.scala 33:37]
  wire [2:0] _controlSign_T_827 = _controlSign_T_3 ? 3'h1 : _controlSign_T_826; // @[Lookup.scala 33:37]
  wire  _controlSign_T_878 = _controlSign_T_19 ? 1'h0 : _controlSign_T_21; // @[Lookup.scala 33:37]
  wire  _controlSign_T_879 = _controlSign_T_17 ? 1'h0 : _controlSign_T_878; // @[Lookup.scala 33:37]
  wire  _controlSign_T_880 = _controlSign_T_15 ? 1'h0 : _controlSign_T_879; // @[Lookup.scala 33:37]
  wire  _controlSign_T_881 = _controlSign_T_13 ? 1'h0 : _controlSign_T_880; // @[Lookup.scala 33:37]
  wire  _controlSign_T_882 = _controlSign_T_11 ? 1'h0 : _controlSign_T_881; // @[Lookup.scala 33:37]
  wire  _controlSign_T_883 = _controlSign_T_9 ? 1'h0 : _controlSign_T_882; // @[Lookup.scala 33:37]
  wire  _controlSign_T_884 = _controlSign_T_7 ? 1'h0 : _controlSign_T_883; // @[Lookup.scala 33:37]
  wire  _controlSign_T_885 = _controlSign_T_5 ? 1'h0 : _controlSign_T_884; // @[Lookup.scala 33:37]
  wire  _controlSign_T_886 = _controlSign_T_3 ? 1'h0 : _controlSign_T_885; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_914 = _controlSign_T_65 ? 4'h6 : 4'h0; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_915 = _controlSign_T_63 ? 4'h5 : _controlSign_T_914; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_916 = _controlSign_T_61 ? 4'h4 : _controlSign_T_915; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_917 = _controlSign_T_59 ? 4'h3 : _controlSign_T_916; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_918 = _controlSign_T_57 ? 4'h2 : _controlSign_T_917; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_919 = _controlSign_T_55 ? 4'h1 : _controlSign_T_918; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_920 = _controlSign_T_53 ? 4'h9 : _controlSign_T_919; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_921 = _controlSign_T_51 ? 4'ha : _controlSign_T_920; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_922 = _controlSign_T_49 ? 4'h8 : _controlSign_T_921; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_923 = _controlSign_T_47 ? 4'h7 : _controlSign_T_922; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_924 = _controlSign_T_45 ? 4'h0 : _controlSign_T_923; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_925 = _controlSign_T_43 ? 4'h0 : _controlSign_T_924; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_926 = _controlSign_T_41 ? 4'h0 : _controlSign_T_925; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_927 = _controlSign_T_39 ? 4'h0 : _controlSign_T_926; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_928 = _controlSign_T_37 ? 4'h0 : _controlSign_T_927; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_929 = _controlSign_T_35 ? 4'h0 : _controlSign_T_928; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_930 = _controlSign_T_33 ? 4'h0 : _controlSign_T_929; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_931 = _controlSign_T_31 ? 4'h0 : _controlSign_T_930; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_932 = _controlSign_T_29 ? 4'h0 : _controlSign_T_931; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_933 = _controlSign_T_27 ? 4'h0 : _controlSign_T_932; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_934 = _controlSign_T_25 ? 4'h0 : _controlSign_T_933; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_935 = _controlSign_T_23 ? 4'h0 : _controlSign_T_934; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_936 = _controlSign_T_21 ? 4'h0 : _controlSign_T_935; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_937 = _controlSign_T_19 ? 4'h0 : _controlSign_T_936; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_938 = _controlSign_T_17 ? 4'h0 : _controlSign_T_937; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_939 = _controlSign_T_15 ? 4'h0 : _controlSign_T_938; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_940 = _controlSign_T_13 ? 4'h0 : _controlSign_T_939; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_941 = _controlSign_T_11 ? 4'h0 : _controlSign_T_940; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_942 = _controlSign_T_9 ? 4'h0 : _controlSign_T_941; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_943 = _controlSign_T_7 ? 4'h0 : _controlSign_T_942; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_944 = _controlSign_T_5 ? 4'h0 : _controlSign_T_943; // @[Lookup.scala 33:37]
  wire [3:0] _controlSign_T_945 = _controlSign_T_3 ? 4'h0 : _controlSign_T_944; // @[Lookup.scala 33:37]
  assign io_instType = _controlSign_T_1 ? 4'h0 : _controlSign_T_178; // @[Lookup.scala 33:37]
  assign io_branch = _controlSign_T_1 ? 1'h0 : _controlSign_T_237; // @[Lookup.scala 33:37]
  assign io_regWrite = _controlSign_T_1 | (_controlSign_T_3 | (_controlSign_T_5 | (_controlSign_T_7 | (_controlSign_T_9
     | (_controlSign_T_11 | (_controlSign_T_13 | (_controlSign_T_15 | (_controlSign_T_17 | (_controlSign_T_19 | (
    _controlSign_T_21 | (_controlSign_T_23 | (_controlSign_T_25 | (_controlSign_T_27 | (_controlSign_T_29 | (
    _controlSign_T_31 | (_controlSign_T_33 | (_controlSign_T_35 | (_controlSign_T_37 | (_controlSign_T_39 | (
    _controlSign_T_41 | (_controlSign_T_43 | (_controlSign_T_45 | _controlSign_T_274)))))))))))))))))))))); // @[Lookup.scala 33:37]
  assign io_aluSrc = _controlSign_T_1 ? 1'h0 : _controlSign_T_355; // @[Lookup.scala 33:37]
  assign io_aluOp = _controlSign_T_1 ? 5'h0 : _controlSign_T_414; // @[Lookup.scala 33:37]
  assign io_memWrite = _controlSign_T_1 ? 1'h0 : _controlSign_T_473; // @[Lookup.scala 33:37]
  assign io_memRead = _controlSign_T_1 ? 1'h0 : _controlSign_T_532; // @[Lookup.scala 33:37]
  assign io_sExtend = _controlSign_T_1 ? 1'h0 : _controlSign_T_591; // @[Lookup.scala 33:37]
  assign io_lsByte = _controlSign_T_1 ? 3'h0 : _controlSign_T_650; // @[Lookup.scala 33:37]
  assign io_memtoReg = _controlSign_T_1 ? 1'h0 : _controlSign_T_709; // @[Lookup.scala 33:37]
  assign io_shiftByte = _controlSign_T_1 ? 2'h0 : _controlSign_T_768; // @[Lookup.scala 33:37]
  assign io_resultSrc = _controlSign_T_1 ? 3'h1 : _controlSign_T_827; // @[Lookup.scala 33:37]
  assign io_addSrc = _controlSign_T_1 ? 1'h0 : _controlSign_T_886; // @[Lookup.scala 33:37]
  assign io_csrOp = _controlSign_T_1 ? 4'h0 : _controlSign_T_945; // @[Lookup.scala 33:37]
endmodule
module ysyx_210669_IF(
  input         clock,
  input         reset,
  input  [63:0] io_pcIn,
  input         io_pcEn,
  input         io_pcSrc,
  output        io_rw_valid,
  input         io_rw_ready,
  output [31:0] io_rw_addr,
  input  [63:0] io_rw_rdata,
  input         io_rwValid,
  output        io_waitAXI,
  output [31:0] io_out_inst,
  output [63:0] io_out_pc,
  output [3:0]  io_out_instType,
  output        io_out_branch,
  output        io_out_regWrite,
  output        io_out_aluSrc,
  output [4:0]  io_out_aluOp,
  output        io_out_memWrite,
  output        io_out_memRead,
  output        io_out_sExtend,
  output [2:0]  io_out_lsByte,
  output        io_out_memtoReg,
  output [1:0]  io_out_shiftByte,
  output [2:0]  io_out_resultSrc,
  output        io_out_addSrc,
  output [3:0]  io_out_csrOp
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire [31:0] controller_io_inst; // @[IF.scala 90:38]
  wire [3:0] controller_io_instType; // @[IF.scala 90:38]
  wire  controller_io_branch; // @[IF.scala 90:38]
  wire  controller_io_regWrite; // @[IF.scala 90:38]
  wire  controller_io_aluSrc; // @[IF.scala 90:38]
  wire [4:0] controller_io_aluOp; // @[IF.scala 90:38]
  wire  controller_io_memWrite; // @[IF.scala 90:38]
  wire  controller_io_memRead; // @[IF.scala 90:38]
  wire  controller_io_sExtend; // @[IF.scala 90:38]
  wire [2:0] controller_io_lsByte; // @[IF.scala 90:38]
  wire  controller_io_memtoReg; // @[IF.scala 90:38]
  wire [1:0] controller_io_shiftByte; // @[IF.scala 90:38]
  wire [2:0] controller_io_resultSrc; // @[IF.scala 90:38]
  wire  controller_io_addSrc; // @[IF.scala 90:38]
  wire [3:0] controller_io_csrOp; // @[IF.scala 90:38]
  reg [63:0] pc_r; // @[Reg.scala 27:20]
  wire [63:0] _pc_T_1 = pc_r + 64'h4; // @[IF.scala 65:10]
  ysyx_210669_Controller controller ( // @[IF.scala 90:38]
    .io_inst(controller_io_inst),
    .io_instType(controller_io_instType),
    .io_branch(controller_io_branch),
    .io_regWrite(controller_io_regWrite),
    .io_aluSrc(controller_io_aluSrc),
    .io_aluOp(controller_io_aluOp),
    .io_memWrite(controller_io_memWrite),
    .io_memRead(controller_io_memRead),
    .io_sExtend(controller_io_sExtend),
    .io_lsByte(controller_io_lsByte),
    .io_memtoReg(controller_io_memtoReg),
    .io_shiftByte(controller_io_shiftByte),
    .io_resultSrc(controller_io_resultSrc),
    .io_addSrc(controller_io_addSrc),
    .io_csrOp(controller_io_csrOp)
  );
  assign io_rw_valid = io_rwValid; // @[IF.scala 86:15]
  assign io_rw_addr = pc_r[31:0]; // @[IF.scala 74:14]
  assign io_waitAXI = ~(io_rw_valid & io_rw_ready); // @[IF.scala 87:17]
  assign io_out_inst = io_rw_rdata[31:0]; // @[IF.scala 71:24 IF.scala 85:8]
  assign io_out_pc = pc_r; // @[IF.scala 57:22 IF.scala 62:6]
  assign io_out_instType = controller_io_instType; // @[IF.scala 92:19]
  assign io_out_branch = controller_io_branch; // @[IF.scala 93:17]
  assign io_out_regWrite = controller_io_regWrite; // @[IF.scala 94:19]
  assign io_out_aluSrc = controller_io_aluSrc; // @[IF.scala 95:17]
  assign io_out_aluOp = controller_io_aluOp; // @[IF.scala 96:16]
  assign io_out_memWrite = controller_io_memWrite; // @[IF.scala 97:19]
  assign io_out_memRead = controller_io_memRead; // @[IF.scala 98:18]
  assign io_out_sExtend = controller_io_sExtend; // @[IF.scala 99:18]
  assign io_out_lsByte = controller_io_lsByte; // @[IF.scala 100:17]
  assign io_out_memtoReg = controller_io_memtoReg; // @[IF.scala 101:19]
  assign io_out_shiftByte = controller_io_shiftByte; // @[IF.scala 102:20]
  assign io_out_resultSrc = controller_io_resultSrc; // @[IF.scala 103:20]
  assign io_out_addSrc = controller_io_addSrc; // @[IF.scala 104:17]
  assign io_out_csrOp = controller_io_csrOp; // @[IF.scala 105:16]
  assign controller_io_inst = io_rw_rdata[31:0]; // @[IF.scala 71:24 IF.scala 85:8]
  always @(posedge clock) begin
    if (reset) begin // @[Reg.scala 27:20]
      pc_r <= 64'h30000000; // @[Reg.scala 27:20]
    end else if (io_pcEn) begin // @[Reg.scala 28:19]
      if (io_pcSrc) begin // @[IF.scala 63:8]
        pc_r <= io_pcIn;
      end else begin
        pc_r <= _pc_T_1;
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
  pc_r = _RAND_0[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210669_ID(
  input         clock,
  input         reset,
  input  [63:0] io_writeData,
  input  [63:0] io_writeReg,
  input         io_regWrite,
  input  [31:0] io_in_inst,
  input  [63:0] io_in_pc,
  input  [3:0]  io_in_instType,
  input         io_in_branch,
  input         io_in_aluSrc,
  input  [4:0]  io_in_aluOp,
  input         io_in_memWrite,
  input         io_in_memRead,
  input         io_in_sExtend,
  input  [2:0]  io_in_lsByte,
  input         io_in_memtoReg,
  input  [1:0]  io_in_shiftByte,
  input  [2:0]  io_in_resultSrc,
  input         io_in_addSrc,
  input  [3:0]  io_in_csrOp,
  input         io_in_regWrite,
  output [63:0] io_out_pc,
  output [63:0] io_out_readData1,
  output [63:0] io_out_readData2,
  output [11:0] io_out_csrAddr,
  output [63:0] io_out_imm,
  output [63:0] io_out_writeReg,
  output        io_out_branch,
  output        io_out_aluSrc,
  output [4:0]  io_out_aluOp,
  output        io_out_memWrite,
  output        io_out_memRead,
  output        io_out_sExtend,
  output [2:0]  io_out_lsByte,
  output        io_out_memtoReg,
  output [1:0]  io_out_shiftByte,
  output [2:0]  io_out_resultSrc,
  output        io_out_addSrc,
  output [3:0]  io_out_csrOp,
  output        io_out_regWrite,
  input         io_exH2Id_regWrite,
  input  [63:0] io_exH2Id_writeReg,
  input         io_exH2Id_exLoad,
  input  [63:0] io_exH2Id_wbData,
  input         io_memH2Id_regWrite,
  input  [63:0] io_memH2Id_writeReg,
  input  [63:0] io_memH2Id_wbData,
  input         io_wbH2Id_regWrite,
  input  [63:0] io_wbH2Id_writeReg,
  input  [63:0] io_wbH2Id_wbData,
  output        io_bubble
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
  wire [52:0] hi = io_in_inst[31] ? 53'h1fffffffffffff : 53'h0; // @[Bitwise.scala 72:12]
  wire [10:0] lo = io_in_inst[30:20]; // @[ID.scala 93:59]
  wire [63:0] _T_3 = {hi,lo}; // @[Cat.scala 30:58]
  wire [4:0] lo_1 = io_in_inst[24:20]; // @[ID.scala 94:55]
  wire [63:0] _T_4 = {59'h0,lo_1}; // @[Cat.scala 30:58]
  wire [5:0] lo_2 = io_in_inst[25:20]; // @[ID.scala 95:55]
  wire [63:0] _T_5 = {58'h0,lo_2}; // @[Cat.scala 30:58]
  wire [5:0] hi_lo = io_in_inst[30:25]; // @[ID.scala 96:58]
  wire [4:0] lo_3 = io_in_inst[11:7]; // @[ID.scala 96:75]
  wire [63:0] _T_8 = {hi,hi_lo,lo_3}; // @[Cat.scala 30:58]
  wire  hi_lo_1 = io_in_inst[7]; // @[ID.scala 97:58]
  wire [3:0] lo_lo = io_in_inst[11:8]; // @[ID.scala 97:88]
  wire [63:0] _T_11 = {hi,hi_lo_1,hi_lo,lo_lo}; // @[Cat.scala 30:58]
  wire [44:0] hi_5 = io_in_inst[31] ? 45'h1fffffffffff : 45'h0; // @[Bitwise.scala 72:12]
  wire [18:0] lo_5 = io_in_inst[30:12]; // @[ID.scala 98:58]
  wire [63:0] _T_14 = {hi_5,lo_5}; // @[Cat.scala 30:58]
  wire [7:0] hi_lo_2 = io_in_inst[19:12]; // @[ID.scala 99:58]
  wire  lo_hi_1 = io_in_inst[20]; // @[ID.scala 99:75]
  wire [9:0] lo_lo_1 = io_in_inst[30:21]; // @[ID.scala 99:89]
  wire [63:0] _T_17 = {hi_5,hi_lo_2,lo_hi_1,lo_lo_1}; // @[Cat.scala 30:58]
  wire [4:0] lo_7 = io_in_inst[19:15]; // @[ID.scala 100:56]
  wire [63:0] _T_18 = {59'h0,lo_7}; // @[Cat.scala 30:58]
  wire [63:0] _io_out_imm_T_1 = 4'h0 == io_in_instType ? 64'h0 : {{32'd0}, io_in_inst}; // @[Mux.scala 80:57]
  wire [63:0] _io_out_imm_T_3 = 4'h1 == io_in_instType ? _T_3 : _io_out_imm_T_1; // @[Mux.scala 80:57]
  wire [63:0] _io_out_imm_T_5 = 4'h2 == io_in_instType ? _T_4 : _io_out_imm_T_3; // @[Mux.scala 80:57]
  wire [63:0] _io_out_imm_T_7 = 4'h3 == io_in_instType ? _T_5 : _io_out_imm_T_5; // @[Mux.scala 80:57]
  wire [63:0] _io_out_imm_T_9 = 4'h4 == io_in_instType ? _T_8 : _io_out_imm_T_7; // @[Mux.scala 80:57]
  wire [63:0] _io_out_imm_T_11 = 4'h5 == io_in_instType ? _T_11 : _io_out_imm_T_9; // @[Mux.scala 80:57]
  wire [63:0] _io_out_imm_T_13 = 4'h6 == io_in_instType ? _T_14 : _io_out_imm_T_11; // @[Mux.scala 80:57]
  wire [63:0] _io_out_imm_T_15 = 4'h7 == io_in_instType ? _T_17 : _io_out_imm_T_13; // @[Mux.scala 80:57]
  wire [63:0] _io_out_imm_T_17 = 4'h8 == io_in_instType ? _T_18 : _io_out_imm_T_15; // @[Mux.scala 80:57]
  reg [63:0] registers_0; // @[ID.scala 120:37]
  reg [63:0] registers_1; // @[ID.scala 120:37]
  reg [63:0] registers_2; // @[ID.scala 120:37]
  reg [63:0] registers_3; // @[ID.scala 120:37]
  reg [63:0] registers_4; // @[ID.scala 120:37]
  reg [63:0] registers_5; // @[ID.scala 120:37]
  reg [63:0] registers_6; // @[ID.scala 120:37]
  reg [63:0] registers_7; // @[ID.scala 120:37]
  reg [63:0] registers_8; // @[ID.scala 120:37]
  reg [63:0] registers_9; // @[ID.scala 120:37]
  reg [63:0] registers_10; // @[ID.scala 120:37]
  reg [63:0] registers_11; // @[ID.scala 120:37]
  reg [63:0] registers_12; // @[ID.scala 120:37]
  reg [63:0] registers_13; // @[ID.scala 120:37]
  reg [63:0] registers_14; // @[ID.scala 120:37]
  reg [63:0] registers_15; // @[ID.scala 120:37]
  reg [63:0] registers_16; // @[ID.scala 120:37]
  reg [63:0] registers_17; // @[ID.scala 120:37]
  reg [63:0] registers_18; // @[ID.scala 120:37]
  reg [63:0] registers_19; // @[ID.scala 120:37]
  reg [63:0] registers_20; // @[ID.scala 120:37]
  reg [63:0] registers_21; // @[ID.scala 120:37]
  reg [63:0] registers_22; // @[ID.scala 120:37]
  reg [63:0] registers_23; // @[ID.scala 120:37]
  reg [63:0] registers_24; // @[ID.scala 120:37]
  reg [63:0] registers_25; // @[ID.scala 120:37]
  reg [63:0] registers_26; // @[ID.scala 120:37]
  reg [63:0] registers_27; // @[ID.scala 120:37]
  reg [63:0] registers_28; // @[ID.scala 120:37]
  reg [63:0] registers_29; // @[ID.scala 120:37]
  reg [63:0] registers_30; // @[ID.scala 120:37]
  reg [63:0] registers_31; // @[ID.scala 120:37]
  wire [4:0] rs1 = io_in_instType == 4'h9 ? 5'ha : lo_7; // @[ID.scala 122:8]
  wire [63:0] _GEN_128 = {{59'd0}, rs1}; // @[ID.scala 135:51]
  wire  _rs1HitEx_T_2 = |rs1; // @[ID.scala 135:85]
  wire  rs1HitEx = io_exH2Id_regWrite & _GEN_128 == io_exH2Id_writeReg & |rs1; // @[ID.scala 135:75]
  wire  rs1HitMem = io_memH2Id_regWrite & _GEN_128 == io_memH2Id_writeReg & _rs1HitEx_T_2; // @[ID.scala 136:78]
  wire  rs1HitWb = io_wbH2Id_regWrite & _GEN_128 == io_wbH2Id_writeReg & _rs1HitEx_T_2; // @[ID.scala 137:75]
  wire [63:0] _GEN_131 = {{59'd0}, lo_1}; // @[ID.scala 138:51]
  wire  _rs2HitEx_T_2 = |lo_1; // @[ID.scala 138:85]
  wire  rs2HitEx = io_exH2Id_regWrite & _GEN_131 == io_exH2Id_writeReg & |lo_1; // @[ID.scala 138:75]
  wire  rs2HitMem = io_memH2Id_regWrite & _GEN_131 == io_memH2Id_writeReg & _rs2HitEx_T_2; // @[ID.scala 139:78]
  wire  rs2HitWb = io_wbH2Id_regWrite & _GEN_131 == io_wbH2Id_writeReg & _rs2HitEx_T_2; // @[ID.scala 140:75]
  wire  _readData1Res_T = ~io_exH2Id_exLoad; // @[ID.scala 144:43]
  wire [63:0] _GEN_65 = 5'h1 == rs1 ? registers_1 : registers_0; // @[ID.scala 146:10 ID.scala 146:10]
  wire [63:0] _GEN_66 = 5'h2 == rs1 ? registers_2 : _GEN_65; // @[ID.scala 146:10 ID.scala 146:10]
  wire [63:0] _GEN_67 = 5'h3 == rs1 ? registers_3 : _GEN_66; // @[ID.scala 146:10 ID.scala 146:10]
  wire [63:0] _GEN_68 = 5'h4 == rs1 ? registers_4 : _GEN_67; // @[ID.scala 146:10 ID.scala 146:10]
  wire [63:0] _GEN_69 = 5'h5 == rs1 ? registers_5 : _GEN_68; // @[ID.scala 146:10 ID.scala 146:10]
  wire [63:0] _GEN_70 = 5'h6 == rs1 ? registers_6 : _GEN_69; // @[ID.scala 146:10 ID.scala 146:10]
  wire [63:0] _GEN_71 = 5'h7 == rs1 ? registers_7 : _GEN_70; // @[ID.scala 146:10 ID.scala 146:10]
  wire [63:0] _GEN_72 = 5'h8 == rs1 ? registers_8 : _GEN_71; // @[ID.scala 146:10 ID.scala 146:10]
  wire [63:0] _GEN_73 = 5'h9 == rs1 ? registers_9 : _GEN_72; // @[ID.scala 146:10 ID.scala 146:10]
  wire [63:0] _GEN_74 = 5'ha == rs1 ? registers_10 : _GEN_73; // @[ID.scala 146:10 ID.scala 146:10]
  wire [63:0] _GEN_75 = 5'hb == rs1 ? registers_11 : _GEN_74; // @[ID.scala 146:10 ID.scala 146:10]
  wire [63:0] _GEN_76 = 5'hc == rs1 ? registers_12 : _GEN_75; // @[ID.scala 146:10 ID.scala 146:10]
  wire [63:0] _GEN_77 = 5'hd == rs1 ? registers_13 : _GEN_76; // @[ID.scala 146:10 ID.scala 146:10]
  wire [63:0] _GEN_78 = 5'he == rs1 ? registers_14 : _GEN_77; // @[ID.scala 146:10 ID.scala 146:10]
  wire [63:0] _GEN_79 = 5'hf == rs1 ? registers_15 : _GEN_78; // @[ID.scala 146:10 ID.scala 146:10]
  wire [63:0] _GEN_80 = 5'h10 == rs1 ? registers_16 : _GEN_79; // @[ID.scala 146:10 ID.scala 146:10]
  wire [63:0] _GEN_81 = 5'h11 == rs1 ? registers_17 : _GEN_80; // @[ID.scala 146:10 ID.scala 146:10]
  wire [63:0] _GEN_82 = 5'h12 == rs1 ? registers_18 : _GEN_81; // @[ID.scala 146:10 ID.scala 146:10]
  wire [63:0] _GEN_83 = 5'h13 == rs1 ? registers_19 : _GEN_82; // @[ID.scala 146:10 ID.scala 146:10]
  wire [63:0] _GEN_84 = 5'h14 == rs1 ? registers_20 : _GEN_83; // @[ID.scala 146:10 ID.scala 146:10]
  wire [63:0] _GEN_85 = 5'h15 == rs1 ? registers_21 : _GEN_84; // @[ID.scala 146:10 ID.scala 146:10]
  wire [63:0] _GEN_86 = 5'h16 == rs1 ? registers_22 : _GEN_85; // @[ID.scala 146:10 ID.scala 146:10]
  wire [63:0] _GEN_87 = 5'h17 == rs1 ? registers_23 : _GEN_86; // @[ID.scala 146:10 ID.scala 146:10]
  wire [63:0] _GEN_88 = 5'h18 == rs1 ? registers_24 : _GEN_87; // @[ID.scala 146:10 ID.scala 146:10]
  wire [63:0] _GEN_89 = 5'h19 == rs1 ? registers_25 : _GEN_88; // @[ID.scala 146:10 ID.scala 146:10]
  wire [63:0] _GEN_90 = 5'h1a == rs1 ? registers_26 : _GEN_89; // @[ID.scala 146:10 ID.scala 146:10]
  wire [63:0] _GEN_91 = 5'h1b == rs1 ? registers_27 : _GEN_90; // @[ID.scala 146:10 ID.scala 146:10]
  wire [63:0] _GEN_92 = 5'h1c == rs1 ? registers_28 : _GEN_91; // @[ID.scala 146:10 ID.scala 146:10]
  wire [63:0] _GEN_93 = 5'h1d == rs1 ? registers_29 : _GEN_92; // @[ID.scala 146:10 ID.scala 146:10]
  wire [63:0] _GEN_94 = 5'h1e == rs1 ? registers_30 : _GEN_93; // @[ID.scala 146:10 ID.scala 146:10]
  wire [63:0] _GEN_95 = 5'h1f == rs1 ? registers_31 : _GEN_94; // @[ID.scala 146:10 ID.scala 146:10]
  wire [63:0] _readData1Res_T_2 = rs1HitWb ? io_wbH2Id_wbData : _GEN_95; // @[ID.scala 146:10]
  wire [63:0] _readData1Res_T_3 = rs1HitMem ? io_memH2Id_wbData : _readData1Res_T_2; // @[ID.scala 145:8]
  wire [63:0] _GEN_97 = 5'h1 == lo_1 ? registers_1 : registers_0; // @[ID.scala 152:10 ID.scala 152:10]
  wire [63:0] _GEN_98 = 5'h2 == lo_1 ? registers_2 : _GEN_97; // @[ID.scala 152:10 ID.scala 152:10]
  wire [63:0] _GEN_99 = 5'h3 == lo_1 ? registers_3 : _GEN_98; // @[ID.scala 152:10 ID.scala 152:10]
  wire [63:0] _GEN_100 = 5'h4 == lo_1 ? registers_4 : _GEN_99; // @[ID.scala 152:10 ID.scala 152:10]
  wire [63:0] _GEN_101 = 5'h5 == lo_1 ? registers_5 : _GEN_100; // @[ID.scala 152:10 ID.scala 152:10]
  wire [63:0] _GEN_102 = 5'h6 == lo_1 ? registers_6 : _GEN_101; // @[ID.scala 152:10 ID.scala 152:10]
  wire [63:0] _GEN_103 = 5'h7 == lo_1 ? registers_7 : _GEN_102; // @[ID.scala 152:10 ID.scala 152:10]
  wire [63:0] _GEN_104 = 5'h8 == lo_1 ? registers_8 : _GEN_103; // @[ID.scala 152:10 ID.scala 152:10]
  wire [63:0] _GEN_105 = 5'h9 == lo_1 ? registers_9 : _GEN_104; // @[ID.scala 152:10 ID.scala 152:10]
  wire [63:0] _GEN_106 = 5'ha == lo_1 ? registers_10 : _GEN_105; // @[ID.scala 152:10 ID.scala 152:10]
  wire [63:0] _GEN_107 = 5'hb == lo_1 ? registers_11 : _GEN_106; // @[ID.scala 152:10 ID.scala 152:10]
  wire [63:0] _GEN_108 = 5'hc == lo_1 ? registers_12 : _GEN_107; // @[ID.scala 152:10 ID.scala 152:10]
  wire [63:0] _GEN_109 = 5'hd == lo_1 ? registers_13 : _GEN_108; // @[ID.scala 152:10 ID.scala 152:10]
  wire [63:0] _GEN_110 = 5'he == lo_1 ? registers_14 : _GEN_109; // @[ID.scala 152:10 ID.scala 152:10]
  wire [63:0] _GEN_111 = 5'hf == lo_1 ? registers_15 : _GEN_110; // @[ID.scala 152:10 ID.scala 152:10]
  wire [63:0] _GEN_112 = 5'h10 == lo_1 ? registers_16 : _GEN_111; // @[ID.scala 152:10 ID.scala 152:10]
  wire [63:0] _GEN_113 = 5'h11 == lo_1 ? registers_17 : _GEN_112; // @[ID.scala 152:10 ID.scala 152:10]
  wire [63:0] _GEN_114 = 5'h12 == lo_1 ? registers_18 : _GEN_113; // @[ID.scala 152:10 ID.scala 152:10]
  wire [63:0] _GEN_115 = 5'h13 == lo_1 ? registers_19 : _GEN_114; // @[ID.scala 152:10 ID.scala 152:10]
  wire [63:0] _GEN_116 = 5'h14 == lo_1 ? registers_20 : _GEN_115; // @[ID.scala 152:10 ID.scala 152:10]
  wire [63:0] _GEN_117 = 5'h15 == lo_1 ? registers_21 : _GEN_116; // @[ID.scala 152:10 ID.scala 152:10]
  wire [63:0] _GEN_118 = 5'h16 == lo_1 ? registers_22 : _GEN_117; // @[ID.scala 152:10 ID.scala 152:10]
  wire [63:0] _GEN_119 = 5'h17 == lo_1 ? registers_23 : _GEN_118; // @[ID.scala 152:10 ID.scala 152:10]
  wire [63:0] _GEN_120 = 5'h18 == lo_1 ? registers_24 : _GEN_119; // @[ID.scala 152:10 ID.scala 152:10]
  wire [63:0] _GEN_121 = 5'h19 == lo_1 ? registers_25 : _GEN_120; // @[ID.scala 152:10 ID.scala 152:10]
  wire [63:0] _GEN_122 = 5'h1a == lo_1 ? registers_26 : _GEN_121; // @[ID.scala 152:10 ID.scala 152:10]
  wire [63:0] _GEN_123 = 5'h1b == lo_1 ? registers_27 : _GEN_122; // @[ID.scala 152:10 ID.scala 152:10]
  wire [63:0] _GEN_124 = 5'h1c == lo_1 ? registers_28 : _GEN_123; // @[ID.scala 152:10 ID.scala 152:10]
  wire [63:0] _GEN_125 = 5'h1d == lo_1 ? registers_29 : _GEN_124; // @[ID.scala 152:10 ID.scala 152:10]
  wire [63:0] _GEN_126 = 5'h1e == lo_1 ? registers_30 : _GEN_125; // @[ID.scala 152:10 ID.scala 152:10]
  wire [63:0] _GEN_127 = 5'h1f == lo_1 ? registers_31 : _GEN_126; // @[ID.scala 152:10 ID.scala 152:10]
  wire [63:0] _readData2Res_T_2 = rs2HitWb ? io_wbH2Id_wbData : _GEN_127; // @[ID.scala 152:10]
  wire [63:0] _readData2Res_T_3 = rs2HitMem ? io_memH2Id_wbData : _readData2Res_T_2; // @[ID.scala 151:8]
  assign io_out_pc = io_in_pc; // @[ID.scala 168:13]
  assign io_out_readData1 = rs1HitEx & ~io_exH2Id_exLoad ? io_exH2Id_wbData : _readData1Res_T_3; // @[ID.scala 144:31]
  assign io_out_readData2 = rs2HitEx & _readData1Res_T ? io_exH2Id_wbData : _readData2Res_T_3; // @[ID.scala 150:31]
  assign io_out_csrAddr = io_in_inst[31:20]; // @[ID.scala 105:29]
  assign io_out_imm = 4'h9 == io_in_instType ? 64'h0 : _io_out_imm_T_17; // @[Mux.scala 80:57]
  assign io_out_writeReg = {{59'd0}, lo_3}; // @[ID.scala 166:30]
  assign io_out_branch = io_in_branch; // @[ID.scala 169:17]
  assign io_out_aluSrc = io_in_aluSrc; // @[ID.scala 170:17]
  assign io_out_aluOp = io_in_aluOp; // @[ID.scala 171:16]
  assign io_out_memWrite = io_in_memWrite; // @[ID.scala 172:19]
  assign io_out_memRead = io_in_memRead; // @[ID.scala 173:18]
  assign io_out_sExtend = io_in_sExtend; // @[ID.scala 174:18]
  assign io_out_lsByte = io_in_lsByte; // @[ID.scala 175:17]
  assign io_out_memtoReg = io_in_memtoReg; // @[ID.scala 176:19]
  assign io_out_shiftByte = io_in_shiftByte; // @[ID.scala 177:20]
  assign io_out_resultSrc = io_in_resultSrc; // @[ID.scala 178:20]
  assign io_out_addSrc = io_in_addSrc; // @[ID.scala 179:17]
  assign io_out_csrOp = io_in_csrOp; // @[ID.scala 180:16]
  assign io_out_regWrite = io_in_regWrite; // @[ID.scala 181:19]
  assign io_bubble = rs1HitEx | rs2HitEx; // @[ID.scala 142:25]
  always @(posedge clock) begin
    if (reset) begin // @[ID.scala 120:37]
      registers_0 <= 64'h0; // @[ID.scala 120:37]
    end else if (io_regWrite & |io_writeReg) begin // @[ID.scala 128:41]
      if (5'h0 == io_writeReg[4:0]) begin // @[ID.scala 129:28]
        registers_0 <= io_writeData; // @[ID.scala 129:28]
      end
    end
    if (reset) begin // @[ID.scala 120:37]
      registers_1 <= 64'h0; // @[ID.scala 120:37]
    end else if (io_regWrite & |io_writeReg) begin // @[ID.scala 128:41]
      if (5'h1 == io_writeReg[4:0]) begin // @[ID.scala 129:28]
        registers_1 <= io_writeData; // @[ID.scala 129:28]
      end
    end
    if (reset) begin // @[ID.scala 120:37]
      registers_2 <= 64'h0; // @[ID.scala 120:37]
    end else if (io_regWrite & |io_writeReg) begin // @[ID.scala 128:41]
      if (5'h2 == io_writeReg[4:0]) begin // @[ID.scala 129:28]
        registers_2 <= io_writeData; // @[ID.scala 129:28]
      end
    end
    if (reset) begin // @[ID.scala 120:37]
      registers_3 <= 64'h0; // @[ID.scala 120:37]
    end else if (io_regWrite & |io_writeReg) begin // @[ID.scala 128:41]
      if (5'h3 == io_writeReg[4:0]) begin // @[ID.scala 129:28]
        registers_3 <= io_writeData; // @[ID.scala 129:28]
      end
    end
    if (reset) begin // @[ID.scala 120:37]
      registers_4 <= 64'h0; // @[ID.scala 120:37]
    end else if (io_regWrite & |io_writeReg) begin // @[ID.scala 128:41]
      if (5'h4 == io_writeReg[4:0]) begin // @[ID.scala 129:28]
        registers_4 <= io_writeData; // @[ID.scala 129:28]
      end
    end
    if (reset) begin // @[ID.scala 120:37]
      registers_5 <= 64'h0; // @[ID.scala 120:37]
    end else if (io_regWrite & |io_writeReg) begin // @[ID.scala 128:41]
      if (5'h5 == io_writeReg[4:0]) begin // @[ID.scala 129:28]
        registers_5 <= io_writeData; // @[ID.scala 129:28]
      end
    end
    if (reset) begin // @[ID.scala 120:37]
      registers_6 <= 64'h0; // @[ID.scala 120:37]
    end else if (io_regWrite & |io_writeReg) begin // @[ID.scala 128:41]
      if (5'h6 == io_writeReg[4:0]) begin // @[ID.scala 129:28]
        registers_6 <= io_writeData; // @[ID.scala 129:28]
      end
    end
    if (reset) begin // @[ID.scala 120:37]
      registers_7 <= 64'h0; // @[ID.scala 120:37]
    end else if (io_regWrite & |io_writeReg) begin // @[ID.scala 128:41]
      if (5'h7 == io_writeReg[4:0]) begin // @[ID.scala 129:28]
        registers_7 <= io_writeData; // @[ID.scala 129:28]
      end
    end
    if (reset) begin // @[ID.scala 120:37]
      registers_8 <= 64'h0; // @[ID.scala 120:37]
    end else if (io_regWrite & |io_writeReg) begin // @[ID.scala 128:41]
      if (5'h8 == io_writeReg[4:0]) begin // @[ID.scala 129:28]
        registers_8 <= io_writeData; // @[ID.scala 129:28]
      end
    end
    if (reset) begin // @[ID.scala 120:37]
      registers_9 <= 64'h0; // @[ID.scala 120:37]
    end else if (io_regWrite & |io_writeReg) begin // @[ID.scala 128:41]
      if (5'h9 == io_writeReg[4:0]) begin // @[ID.scala 129:28]
        registers_9 <= io_writeData; // @[ID.scala 129:28]
      end
    end
    if (reset) begin // @[ID.scala 120:37]
      registers_10 <= 64'h0; // @[ID.scala 120:37]
    end else if (io_regWrite & |io_writeReg) begin // @[ID.scala 128:41]
      if (5'ha == io_writeReg[4:0]) begin // @[ID.scala 129:28]
        registers_10 <= io_writeData; // @[ID.scala 129:28]
      end
    end
    if (reset) begin // @[ID.scala 120:37]
      registers_11 <= 64'h0; // @[ID.scala 120:37]
    end else if (io_regWrite & |io_writeReg) begin // @[ID.scala 128:41]
      if (5'hb == io_writeReg[4:0]) begin // @[ID.scala 129:28]
        registers_11 <= io_writeData; // @[ID.scala 129:28]
      end
    end
    if (reset) begin // @[ID.scala 120:37]
      registers_12 <= 64'h0; // @[ID.scala 120:37]
    end else if (io_regWrite & |io_writeReg) begin // @[ID.scala 128:41]
      if (5'hc == io_writeReg[4:0]) begin // @[ID.scala 129:28]
        registers_12 <= io_writeData; // @[ID.scala 129:28]
      end
    end
    if (reset) begin // @[ID.scala 120:37]
      registers_13 <= 64'h0; // @[ID.scala 120:37]
    end else if (io_regWrite & |io_writeReg) begin // @[ID.scala 128:41]
      if (5'hd == io_writeReg[4:0]) begin // @[ID.scala 129:28]
        registers_13 <= io_writeData; // @[ID.scala 129:28]
      end
    end
    if (reset) begin // @[ID.scala 120:37]
      registers_14 <= 64'h0; // @[ID.scala 120:37]
    end else if (io_regWrite & |io_writeReg) begin // @[ID.scala 128:41]
      if (5'he == io_writeReg[4:0]) begin // @[ID.scala 129:28]
        registers_14 <= io_writeData; // @[ID.scala 129:28]
      end
    end
    if (reset) begin // @[ID.scala 120:37]
      registers_15 <= 64'h0; // @[ID.scala 120:37]
    end else if (io_regWrite & |io_writeReg) begin // @[ID.scala 128:41]
      if (5'hf == io_writeReg[4:0]) begin // @[ID.scala 129:28]
        registers_15 <= io_writeData; // @[ID.scala 129:28]
      end
    end
    if (reset) begin // @[ID.scala 120:37]
      registers_16 <= 64'h0; // @[ID.scala 120:37]
    end else if (io_regWrite & |io_writeReg) begin // @[ID.scala 128:41]
      if (5'h10 == io_writeReg[4:0]) begin // @[ID.scala 129:28]
        registers_16 <= io_writeData; // @[ID.scala 129:28]
      end
    end
    if (reset) begin // @[ID.scala 120:37]
      registers_17 <= 64'h0; // @[ID.scala 120:37]
    end else if (io_regWrite & |io_writeReg) begin // @[ID.scala 128:41]
      if (5'h11 == io_writeReg[4:0]) begin // @[ID.scala 129:28]
        registers_17 <= io_writeData; // @[ID.scala 129:28]
      end
    end
    if (reset) begin // @[ID.scala 120:37]
      registers_18 <= 64'h0; // @[ID.scala 120:37]
    end else if (io_regWrite & |io_writeReg) begin // @[ID.scala 128:41]
      if (5'h12 == io_writeReg[4:0]) begin // @[ID.scala 129:28]
        registers_18 <= io_writeData; // @[ID.scala 129:28]
      end
    end
    if (reset) begin // @[ID.scala 120:37]
      registers_19 <= 64'h0; // @[ID.scala 120:37]
    end else if (io_regWrite & |io_writeReg) begin // @[ID.scala 128:41]
      if (5'h13 == io_writeReg[4:0]) begin // @[ID.scala 129:28]
        registers_19 <= io_writeData; // @[ID.scala 129:28]
      end
    end
    if (reset) begin // @[ID.scala 120:37]
      registers_20 <= 64'h0; // @[ID.scala 120:37]
    end else if (io_regWrite & |io_writeReg) begin // @[ID.scala 128:41]
      if (5'h14 == io_writeReg[4:0]) begin // @[ID.scala 129:28]
        registers_20 <= io_writeData; // @[ID.scala 129:28]
      end
    end
    if (reset) begin // @[ID.scala 120:37]
      registers_21 <= 64'h0; // @[ID.scala 120:37]
    end else if (io_regWrite & |io_writeReg) begin // @[ID.scala 128:41]
      if (5'h15 == io_writeReg[4:0]) begin // @[ID.scala 129:28]
        registers_21 <= io_writeData; // @[ID.scala 129:28]
      end
    end
    if (reset) begin // @[ID.scala 120:37]
      registers_22 <= 64'h0; // @[ID.scala 120:37]
    end else if (io_regWrite & |io_writeReg) begin // @[ID.scala 128:41]
      if (5'h16 == io_writeReg[4:0]) begin // @[ID.scala 129:28]
        registers_22 <= io_writeData; // @[ID.scala 129:28]
      end
    end
    if (reset) begin // @[ID.scala 120:37]
      registers_23 <= 64'h0; // @[ID.scala 120:37]
    end else if (io_regWrite & |io_writeReg) begin // @[ID.scala 128:41]
      if (5'h17 == io_writeReg[4:0]) begin // @[ID.scala 129:28]
        registers_23 <= io_writeData; // @[ID.scala 129:28]
      end
    end
    if (reset) begin // @[ID.scala 120:37]
      registers_24 <= 64'h0; // @[ID.scala 120:37]
    end else if (io_regWrite & |io_writeReg) begin // @[ID.scala 128:41]
      if (5'h18 == io_writeReg[4:0]) begin // @[ID.scala 129:28]
        registers_24 <= io_writeData; // @[ID.scala 129:28]
      end
    end
    if (reset) begin // @[ID.scala 120:37]
      registers_25 <= 64'h0; // @[ID.scala 120:37]
    end else if (io_regWrite & |io_writeReg) begin // @[ID.scala 128:41]
      if (5'h19 == io_writeReg[4:0]) begin // @[ID.scala 129:28]
        registers_25 <= io_writeData; // @[ID.scala 129:28]
      end
    end
    if (reset) begin // @[ID.scala 120:37]
      registers_26 <= 64'h0; // @[ID.scala 120:37]
    end else if (io_regWrite & |io_writeReg) begin // @[ID.scala 128:41]
      if (5'h1a == io_writeReg[4:0]) begin // @[ID.scala 129:28]
        registers_26 <= io_writeData; // @[ID.scala 129:28]
      end
    end
    if (reset) begin // @[ID.scala 120:37]
      registers_27 <= 64'h0; // @[ID.scala 120:37]
    end else if (io_regWrite & |io_writeReg) begin // @[ID.scala 128:41]
      if (5'h1b == io_writeReg[4:0]) begin // @[ID.scala 129:28]
        registers_27 <= io_writeData; // @[ID.scala 129:28]
      end
    end
    if (reset) begin // @[ID.scala 120:37]
      registers_28 <= 64'h0; // @[ID.scala 120:37]
    end else if (io_regWrite & |io_writeReg) begin // @[ID.scala 128:41]
      if (5'h1c == io_writeReg[4:0]) begin // @[ID.scala 129:28]
        registers_28 <= io_writeData; // @[ID.scala 129:28]
      end
    end
    if (reset) begin // @[ID.scala 120:37]
      registers_29 <= 64'h0; // @[ID.scala 120:37]
    end else if (io_regWrite & |io_writeReg) begin // @[ID.scala 128:41]
      if (5'h1d == io_writeReg[4:0]) begin // @[ID.scala 129:28]
        registers_29 <= io_writeData; // @[ID.scala 129:28]
      end
    end
    if (reset) begin // @[ID.scala 120:37]
      registers_30 <= 64'h0; // @[ID.scala 120:37]
    end else if (io_regWrite & |io_writeReg) begin // @[ID.scala 128:41]
      if (5'h1e == io_writeReg[4:0]) begin // @[ID.scala 129:28]
        registers_30 <= io_writeData; // @[ID.scala 129:28]
      end
    end
    if (reset) begin // @[ID.scala 120:37]
      registers_31 <= 64'h0; // @[ID.scala 120:37]
    end else if (io_regWrite & |io_writeReg) begin // @[ID.scala 128:41]
      if (5'h1f == io_writeReg[4:0]) begin // @[ID.scala 129:28]
        registers_31 <= io_writeData; // @[ID.scala 129:28]
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
  registers_0 = _RAND_0[63:0];
  _RAND_1 = {2{`RANDOM}};
  registers_1 = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  registers_2 = _RAND_2[63:0];
  _RAND_3 = {2{`RANDOM}};
  registers_3 = _RAND_3[63:0];
  _RAND_4 = {2{`RANDOM}};
  registers_4 = _RAND_4[63:0];
  _RAND_5 = {2{`RANDOM}};
  registers_5 = _RAND_5[63:0];
  _RAND_6 = {2{`RANDOM}};
  registers_6 = _RAND_6[63:0];
  _RAND_7 = {2{`RANDOM}};
  registers_7 = _RAND_7[63:0];
  _RAND_8 = {2{`RANDOM}};
  registers_8 = _RAND_8[63:0];
  _RAND_9 = {2{`RANDOM}};
  registers_9 = _RAND_9[63:0];
  _RAND_10 = {2{`RANDOM}};
  registers_10 = _RAND_10[63:0];
  _RAND_11 = {2{`RANDOM}};
  registers_11 = _RAND_11[63:0];
  _RAND_12 = {2{`RANDOM}};
  registers_12 = _RAND_12[63:0];
  _RAND_13 = {2{`RANDOM}};
  registers_13 = _RAND_13[63:0];
  _RAND_14 = {2{`RANDOM}};
  registers_14 = _RAND_14[63:0];
  _RAND_15 = {2{`RANDOM}};
  registers_15 = _RAND_15[63:0];
  _RAND_16 = {2{`RANDOM}};
  registers_16 = _RAND_16[63:0];
  _RAND_17 = {2{`RANDOM}};
  registers_17 = _RAND_17[63:0];
  _RAND_18 = {2{`RANDOM}};
  registers_18 = _RAND_18[63:0];
  _RAND_19 = {2{`RANDOM}};
  registers_19 = _RAND_19[63:0];
  _RAND_20 = {2{`RANDOM}};
  registers_20 = _RAND_20[63:0];
  _RAND_21 = {2{`RANDOM}};
  registers_21 = _RAND_21[63:0];
  _RAND_22 = {2{`RANDOM}};
  registers_22 = _RAND_22[63:0];
  _RAND_23 = {2{`RANDOM}};
  registers_23 = _RAND_23[63:0];
  _RAND_24 = {2{`RANDOM}};
  registers_24 = _RAND_24[63:0];
  _RAND_25 = {2{`RANDOM}};
  registers_25 = _RAND_25[63:0];
  _RAND_26 = {2{`RANDOM}};
  registers_26 = _RAND_26[63:0];
  _RAND_27 = {2{`RANDOM}};
  registers_27 = _RAND_27[63:0];
  _RAND_28 = {2{`RANDOM}};
  registers_28 = _RAND_28[63:0];
  _RAND_29 = {2{`RANDOM}};
  registers_29 = _RAND_29[63:0];
  _RAND_30 = {2{`RANDOM}};
  registers_30 = _RAND_30[63:0];
  _RAND_31 = {2{`RANDOM}};
  registers_31 = _RAND_31[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210669_CSR(
  input         clock,
  input         reset,
  input         io_en,
  input  [11:0] io_addr,
  input  [4:0]  io_wdataImm,
  input  [63:0] io_wdataRs1,
  input  [63:0] io_curPC,
  input  [3:0]  io_csrOP,
  output [63:0] io_rdata,
  output [63:0] io_pcOut,
  output        io_jmp,
  input         io_instValid,
  input         io_mipMtip
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
  reg [63:0] _RAND_23;
  reg [63:0] _RAND_24;
  reg [63:0] _RAND_25;
  reg [63:0] _RAND_26;
  reg [63:0] _RAND_27;
  reg [63:0] _RAND_28;
  reg [63:0] _RAND_29;
  reg [63:0] _RAND_30;
  reg [63:0] _RAND_31;
  reg [63:0] _RAND_32;
  reg [63:0] _RAND_33;
  reg [63:0] _RAND_34;
  reg [31:0] _RAND_35;
`endif // RANDOMIZE_REG_INIT
  reg [26:0] status_WPRI36; // @[CSR.scala 106:31]
  reg [1:0] status_SXL; // @[CSR.scala 106:31]
  reg [1:0] status_UXL; // @[CSR.scala 106:31]
  reg [8:0] status_WPRI23; // @[CSR.scala 106:31]
  reg  status_TSR; // @[CSR.scala 106:31]
  reg  status_TW; // @[CSR.scala 106:31]
  reg  status_TVM; // @[CSR.scala 106:31]
  reg  status_MXR; // @[CSR.scala 106:31]
  reg  status_SUM; // @[CSR.scala 106:31]
  reg  status_MPRV; // @[CSR.scala 106:31]
  reg [1:0] status_XS; // @[CSR.scala 106:31]
  reg [1:0] status_FS; // @[CSR.scala 106:31]
  reg [1:0] status_MPP; // @[CSR.scala 106:31]
  reg [1:0] status_WPRI9; // @[CSR.scala 106:31]
  reg  status_SPP; // @[CSR.scala 106:31]
  reg  status_MPIE; // @[CSR.scala 106:31]
  reg  status_WPRI6; // @[CSR.scala 106:31]
  reg  status_SPIE; // @[CSR.scala 106:31]
  reg  status_UPIE; // @[CSR.scala 106:31]
  reg  status_MIE; // @[CSR.scala 106:31]
  reg  status_WPRI2; // @[CSR.scala 106:31]
  reg  status_SIE; // @[CSR.scala 106:31]
  reg  status_UIE; // @[CSR.scala 106:31]
  wire  mstatus_SD = status_XS == 2'h3 | status_FS == 2'h3; // @[CSR.scala 108:40]
  reg [63:0] medeleg; // @[CSR.scala 151:30]
  reg [63:0] mideleg; // @[CSR.scala 152:30]
  reg [63:0] mie; // @[CSR.scala 153:26]
  reg [63:0] mtvec; // @[CSR.scala 154:28]
  reg [63:0] mcounteren; // @[CSR.scala 155:33]
  wire [61:0] mtvecBase = mtvec[63:2]; // @[CSR.scala 157:34]
  wire [1:0] mtvecMode = mtvec[1:0]; // @[CSR.scala 158:34]
  reg [63:0] mscratch; // @[CSR.scala 165:31]
  reg [63:0] mepc; // @[CSR.scala 166:27]
  reg [63:0] mcause; // @[CSR.scala 167:29]
  reg [63:0] mtval; // @[CSR.scala 168:28]
  reg [63:0] mip; // @[CSR.scala 169:26]
  reg [63:0] mhpmcounter_0; // @[CSR.scala 179:12]
  reg [63:0] mhpmcounter_2; // @[CSR.scala 179:12]
  wire [5:0] lo_lo = {status_SPIE,status_UPIE,status_MIE,status_WPRI2,status_SIE,status_UIE}; // @[CSR.scala 203:48]
  wire [14:0] lo = {status_FS,status_MPP,status_WPRI9,status_SPP,status_MPIE,status_WPRI6,lo_lo}; // @[CSR.scala 203:48]
  wire [6:0] hi_lo = {status_TW,status_TVM,status_MXR,status_SUM,status_MPRV,status_XS}; // @[CSR.scala 203:48]
  wire [63:0] _T = {mstatus_SD,status_WPRI36,status_SXL,status_UXL,status_WPRI23,status_TSR,hi_lo,lo}; // @[CSR.scala 203:48]
  reg [1:0] curPriv; // @[CSR.scala 293:30]
  wire  _rdata_T_8 = 12'h300 == io_addr; // @[Mux.scala 80:60]
  wire [63:0] _rdata_T_9 = 12'h300 == io_addr ? _T : 64'h0; // @[Mux.scala 80:57]
  wire [63:0] _rdata_T_11 = 12'h301 == io_addr ? 64'h8000000000000008 : _rdata_T_9; // @[Mux.scala 80:57]
  wire  _rdata_T_12 = 12'h302 == io_addr; // @[Mux.scala 80:60]
  wire [63:0] _rdata_T_13 = 12'h302 == io_addr ? medeleg : _rdata_T_11; // @[Mux.scala 80:57]
  wire  _rdata_T_14 = 12'h303 == io_addr; // @[Mux.scala 80:60]
  wire [63:0] _rdata_T_15 = 12'h303 == io_addr ? mideleg : _rdata_T_13; // @[Mux.scala 80:57]
  wire  _rdata_T_16 = 12'h304 == io_addr; // @[Mux.scala 80:60]
  wire [63:0] _rdata_T_17 = 12'h304 == io_addr ? mie : _rdata_T_15; // @[Mux.scala 80:57]
  wire  _rdata_T_18 = 12'h305 == io_addr; // @[Mux.scala 80:60]
  wire [63:0] _rdata_T_19 = 12'h305 == io_addr ? mtvec : _rdata_T_17; // @[Mux.scala 80:57]
  wire  _rdata_T_20 = 12'h306 == io_addr; // @[Mux.scala 80:60]
  wire [63:0] _rdata_T_21 = 12'h306 == io_addr ? mcounteren : _rdata_T_19; // @[Mux.scala 80:57]
  wire  _rdata_T_22 = 12'h340 == io_addr; // @[Mux.scala 80:60]
  wire [63:0] _rdata_T_23 = 12'h340 == io_addr ? mscratch : _rdata_T_21; // @[Mux.scala 80:57]
  wire  _rdata_T_24 = 12'h341 == io_addr; // @[Mux.scala 80:60]
  wire [63:0] _rdata_T_25 = 12'h341 == io_addr ? mepc : _rdata_T_23; // @[Mux.scala 80:57]
  wire  _rdata_T_26 = 12'h342 == io_addr; // @[Mux.scala 80:60]
  wire [63:0] _rdata_T_27 = 12'h342 == io_addr ? mcause : _rdata_T_25; // @[Mux.scala 80:57]
  wire  _rdata_T_28 = 12'h343 == io_addr; // @[Mux.scala 80:60]
  wire [63:0] _rdata_T_29 = 12'h343 == io_addr ? mtval : _rdata_T_27; // @[Mux.scala 80:57]
  wire  _rdata_T_30 = 12'h344 == io_addr; // @[Mux.scala 80:60]
  wire [63:0] _rdata_T_31 = 12'h344 == io_addr ? mip : _rdata_T_29; // @[Mux.scala 80:57]
  wire  _rdata_T_32 = 12'hb00 == io_addr; // @[Mux.scala 80:60]
  wire [63:0] _rdata_T_33 = 12'hb00 == io_addr ? mhpmcounter_0 : _rdata_T_31; // @[Mux.scala 80:57]
  wire  _rdata_T_34 = 12'hb02 == io_addr; // @[Mux.scala 80:60]
  wire [63:0] rdata = 12'hb02 == io_addr ? mhpmcounter_2 : _rdata_T_33; // @[Mux.scala 80:57]
  wire [63:0] _T_1 = {59'h0,io_wdataImm}; // @[Cat.scala 30:58]
  wire [63:0] _T_2 = rdata | io_wdataRs1; // @[CSR.scala 298:32]
  wire [63:0] _T_4 = rdata | _T_1; // @[CSR.scala 299:32]
  wire [63:0] _T_5 = ~io_wdataRs1; // @[CSR.scala 300:35]
  wire [63:0] _T_6 = rdata & _T_5; // @[CSR.scala 300:32]
  wire [63:0] _T_8 = ~_T_1; // @[CSR.scala 301:35]
  wire [63:0] _T_9 = rdata & _T_8; // @[CSR.scala 301:32]
  wire [63:0] _wdata_T_1 = 4'h1 == io_csrOP ? io_wdataRs1 : 64'h0; // @[Mux.scala 80:57]
  wire [63:0] _wdata_T_3 = 4'h4 == io_csrOP ? _T_1 : _wdata_T_1; // @[Mux.scala 80:57]
  wire [63:0] _wdata_T_5 = 4'h2 == io_csrOP ? _T_2 : _wdata_T_3; // @[Mux.scala 80:57]
  wire [63:0] _wdata_T_7 = 4'h5 == io_csrOP ? _T_4 : _wdata_T_5; // @[Mux.scala 80:57]
  wire [63:0] _wdata_T_9 = 4'h3 == io_csrOP ? _T_6 : _wdata_T_7; // @[Mux.scala 80:57]
  wire [63:0] wdata = 4'h6 == io_csrOP ? _T_9 : _wdata_T_9; // @[Mux.scala 80:57]
  wire [63:0] _mhpmcounter_0_T_1 = mhpmcounter_0 + 64'h1; // @[CSR.scala 305:20]
  wire [55:0] mip_hi_hi = mip[63:8]; // @[CSR.scala 308:12]
  wire [6:0] mip_lo = mip[6:0]; // @[CSR.scala 308:31]
  wire [63:0] _mip_T = {mip_hi_hi,1'h1,mip_lo}; // @[Cat.scala 30:58]
  wire [63:0] _mip_T_1 = {mip_hi_hi,1'h0,mip_lo}; // @[Cat.scala 30:58]
  wire [63:0] _mip_T_2 = io_mipMtip ? _mip_T : _mip_T_1; // @[CSR.scala 307:13]
  wire [63:0] _mhpmcounter_2_T_1 = mhpmcounter_2 + 64'h1; // @[CSR.scala 313:26]
  wire [63:0] _GEN_0 = io_instValid ? _mhpmcounter_2_T_1 : mhpmcounter_2; // @[CSR.scala 312:23 CSR.scala 313:14 CSR.scala 179:12]
  wire [1:0] _csrOpList_T_13 = 4'h7 == io_csrOP ? 2'h2 : 2'h0; // @[Mux.scala 80:57]
  wire [1:0] _csrOpList_T_15 = 4'h8 == io_csrOP ? 2'h2 : _csrOpList_T_13; // @[Mux.scala 80:57]
  wire [1:0] _csrOpList_T_17 = 4'h9 == io_csrOP ? 2'h3 : _csrOpList_T_15; // @[Mux.scala 80:57]
  wire [1:0] _csrOpList_T_19 = 4'ha == io_csrOP ? 2'h3 : _csrOpList_T_17; // @[Mux.scala 80:57]
  wire [1:0] csrOpList = 4'hb == io_csrOP ? 2'h3 : _csrOpList_T_19; // @[Mux.scala 80:57]
  wire  isJmp = csrOpList[1]; // @[CSR.scala 317:30]
  wire  isRet = csrOpList[0]; // @[CSR.scala 318:30]
  wire [63:0] _GEN_1 = _rdata_T_34 ? wdata : _GEN_0; // @[Conditional.scala 39:67 CSR.scala 369:18]
  wire [63:0] _GEN_2 = _rdata_T_32 ? wdata : _mhpmcounter_0_T_1; // @[Conditional.scala 39:67 CSR.scala 366:16 CSR.scala 305:10]
  wire [63:0] _GEN_3 = _rdata_T_32 ? _GEN_0 : _GEN_1; // @[Conditional.scala 39:67]
  wire [63:0] _GEN_4 = _rdata_T_30 ? wdata : _mip_T_2; // @[Conditional.scala 39:67 CSR.scala 363:13 CSR.scala 307:7]
  wire [63:0] _GEN_5 = _rdata_T_30 ? _mhpmcounter_0_T_1 : _GEN_2; // @[Conditional.scala 39:67 CSR.scala 305:10]
  wire [63:0] _GEN_6 = _rdata_T_30 ? _GEN_0 : _GEN_3; // @[Conditional.scala 39:67]
  wire [63:0] _GEN_7 = _rdata_T_28 ? wdata : mtval; // @[Conditional.scala 39:67 CSR.scala 360:15 CSR.scala 168:28]
  wire [63:0] _GEN_8 = _rdata_T_28 ? _mip_T_2 : _GEN_4; // @[Conditional.scala 39:67 CSR.scala 307:7]
  wire [63:0] _GEN_9 = _rdata_T_28 ? _mhpmcounter_0_T_1 : _GEN_5; // @[Conditional.scala 39:67 CSR.scala 305:10]
  wire [63:0] _GEN_10 = _rdata_T_28 ? _GEN_0 : _GEN_6; // @[Conditional.scala 39:67]
  wire [63:0] _GEN_11 = _rdata_T_26 ? wdata : mcause; // @[Conditional.scala 39:67 CSR.scala 357:16 CSR.scala 167:29]
  wire [63:0] _GEN_12 = _rdata_T_26 ? mtval : _GEN_7; // @[Conditional.scala 39:67 CSR.scala 168:28]
  wire [63:0] _GEN_13 = _rdata_T_26 ? _mip_T_2 : _GEN_8; // @[Conditional.scala 39:67 CSR.scala 307:7]
  wire [63:0] _GEN_14 = _rdata_T_26 ? _mhpmcounter_0_T_1 : _GEN_9; // @[Conditional.scala 39:67 CSR.scala 305:10]
  wire [63:0] _GEN_15 = _rdata_T_26 ? _GEN_0 : _GEN_10; // @[Conditional.scala 39:67]
  wire [63:0] _GEN_16 = _rdata_T_24 ? wdata : mepc; // @[Conditional.scala 39:67 CSR.scala 354:14 CSR.scala 166:27]
  wire [63:0] _GEN_17 = _rdata_T_24 ? mcause : _GEN_11; // @[Conditional.scala 39:67 CSR.scala 167:29]
  wire [63:0] _GEN_18 = _rdata_T_24 ? mtval : _GEN_12; // @[Conditional.scala 39:67 CSR.scala 168:28]
  wire [63:0] _GEN_19 = _rdata_T_24 ? _mip_T_2 : _GEN_13; // @[Conditional.scala 39:67 CSR.scala 307:7]
  wire [63:0] _GEN_20 = _rdata_T_24 ? _mhpmcounter_0_T_1 : _GEN_14; // @[Conditional.scala 39:67 CSR.scala 305:10]
  wire [63:0] _GEN_21 = _rdata_T_24 ? _GEN_0 : _GEN_15; // @[Conditional.scala 39:67]
  wire [63:0] _GEN_22 = _rdata_T_22 ? wdata : mscratch; // @[Conditional.scala 39:67 CSR.scala 351:18 CSR.scala 165:31]
  wire [63:0] _GEN_23 = _rdata_T_22 ? mepc : _GEN_16; // @[Conditional.scala 39:67 CSR.scala 166:27]
  wire [63:0] _GEN_24 = _rdata_T_22 ? mcause : _GEN_17; // @[Conditional.scala 39:67 CSR.scala 167:29]
  wire [63:0] _GEN_25 = _rdata_T_22 ? mtval : _GEN_18; // @[Conditional.scala 39:67 CSR.scala 168:28]
  wire [63:0] _GEN_26 = _rdata_T_22 ? _mip_T_2 : _GEN_19; // @[Conditional.scala 39:67 CSR.scala 307:7]
  wire [63:0] _GEN_27 = _rdata_T_22 ? _mhpmcounter_0_T_1 : _GEN_20; // @[Conditional.scala 39:67 CSR.scala 305:10]
  wire [63:0] _GEN_28 = _rdata_T_22 ? _GEN_0 : _GEN_21; // @[Conditional.scala 39:67]
  wire [63:0] _GEN_29 = _rdata_T_20 ? wdata : mcounteren; // @[Conditional.scala 39:67 CSR.scala 348:20 CSR.scala 155:33]
  wire [63:0] _GEN_30 = _rdata_T_20 ? mscratch : _GEN_22; // @[Conditional.scala 39:67 CSR.scala 165:31]
  wire [63:0] _GEN_31 = _rdata_T_20 ? mepc : _GEN_23; // @[Conditional.scala 39:67 CSR.scala 166:27]
  wire [63:0] _GEN_32 = _rdata_T_20 ? mcause : _GEN_24; // @[Conditional.scala 39:67 CSR.scala 167:29]
  wire [63:0] _GEN_33 = _rdata_T_20 ? mtval : _GEN_25; // @[Conditional.scala 39:67 CSR.scala 168:28]
  wire [63:0] _GEN_34 = _rdata_T_20 ? _mip_T_2 : _GEN_26; // @[Conditional.scala 39:67 CSR.scala 307:7]
  wire [63:0] _GEN_35 = _rdata_T_20 ? _mhpmcounter_0_T_1 : _GEN_27; // @[Conditional.scala 39:67 CSR.scala 305:10]
  wire [63:0] _GEN_36 = _rdata_T_20 ? _GEN_0 : _GEN_28; // @[Conditional.scala 39:67]
  wire [63:0] _GEN_37 = _rdata_T_18 ? wdata : mtvec; // @[Conditional.scala 39:67 CSR.scala 345:15 CSR.scala 154:28]
  wire [63:0] _GEN_38 = _rdata_T_18 ? mcounteren : _GEN_29; // @[Conditional.scala 39:67 CSR.scala 155:33]
  wire [63:0] _GEN_39 = _rdata_T_18 ? mscratch : _GEN_30; // @[Conditional.scala 39:67 CSR.scala 165:31]
  wire [63:0] _GEN_40 = _rdata_T_18 ? mepc : _GEN_31; // @[Conditional.scala 39:67 CSR.scala 166:27]
  wire [63:0] _GEN_41 = _rdata_T_18 ? mcause : _GEN_32; // @[Conditional.scala 39:67 CSR.scala 167:29]
  wire [63:0] _GEN_42 = _rdata_T_18 ? mtval : _GEN_33; // @[Conditional.scala 39:67 CSR.scala 168:28]
  wire [63:0] _GEN_43 = _rdata_T_18 ? _mip_T_2 : _GEN_34; // @[Conditional.scala 39:67 CSR.scala 307:7]
  wire [63:0] _GEN_44 = _rdata_T_18 ? _mhpmcounter_0_T_1 : _GEN_35; // @[Conditional.scala 39:67 CSR.scala 305:10]
  wire [63:0] _GEN_45 = _rdata_T_18 ? _GEN_0 : _GEN_36; // @[Conditional.scala 39:67]
  wire [63:0] _GEN_46 = _rdata_T_16 ? wdata : mie; // @[Conditional.scala 39:67 CSR.scala 342:13 CSR.scala 153:26]
  wire [63:0] _GEN_47 = _rdata_T_16 ? mtvec : _GEN_37; // @[Conditional.scala 39:67 CSR.scala 154:28]
  wire [63:0] _GEN_48 = _rdata_T_16 ? mcounteren : _GEN_38; // @[Conditional.scala 39:67 CSR.scala 155:33]
  wire [63:0] _GEN_49 = _rdata_T_16 ? mscratch : _GEN_39; // @[Conditional.scala 39:67 CSR.scala 165:31]
  wire [63:0] _GEN_50 = _rdata_T_16 ? mepc : _GEN_40; // @[Conditional.scala 39:67 CSR.scala 166:27]
  wire [63:0] _GEN_51 = _rdata_T_16 ? mcause : _GEN_41; // @[Conditional.scala 39:67 CSR.scala 167:29]
  wire [63:0] _GEN_52 = _rdata_T_16 ? mtval : _GEN_42; // @[Conditional.scala 39:67 CSR.scala 168:28]
  wire [63:0] _GEN_53 = _rdata_T_16 ? _mip_T_2 : _GEN_43; // @[Conditional.scala 39:67 CSR.scala 307:7]
  wire [63:0] _GEN_54 = _rdata_T_16 ? _mhpmcounter_0_T_1 : _GEN_44; // @[Conditional.scala 39:67 CSR.scala 305:10]
  wire [63:0] _GEN_55 = _rdata_T_16 ? _GEN_0 : _GEN_45; // @[Conditional.scala 39:67]
  wire [63:0] _GEN_56 = _rdata_T_14 ? wdata : mideleg; // @[Conditional.scala 39:67 CSR.scala 339:17 CSR.scala 152:30]
  wire [63:0] _GEN_57 = _rdata_T_14 ? mie : _GEN_46; // @[Conditional.scala 39:67 CSR.scala 153:26]
  wire [63:0] _GEN_58 = _rdata_T_14 ? mtvec : _GEN_47; // @[Conditional.scala 39:67 CSR.scala 154:28]
  wire [63:0] _GEN_59 = _rdata_T_14 ? mcounteren : _GEN_48; // @[Conditional.scala 39:67 CSR.scala 155:33]
  wire [63:0] _GEN_60 = _rdata_T_14 ? mscratch : _GEN_49; // @[Conditional.scala 39:67 CSR.scala 165:31]
  wire [63:0] _GEN_61 = _rdata_T_14 ? mepc : _GEN_50; // @[Conditional.scala 39:67 CSR.scala 166:27]
  wire [63:0] _GEN_62 = _rdata_T_14 ? mcause : _GEN_51; // @[Conditional.scala 39:67 CSR.scala 167:29]
  wire [63:0] _GEN_63 = _rdata_T_14 ? mtval : _GEN_52; // @[Conditional.scala 39:67 CSR.scala 168:28]
  wire [63:0] _GEN_64 = _rdata_T_14 ? _mip_T_2 : _GEN_53; // @[Conditional.scala 39:67 CSR.scala 307:7]
  wire [63:0] _GEN_65 = _rdata_T_14 ? _mhpmcounter_0_T_1 : _GEN_54; // @[Conditional.scala 39:67 CSR.scala 305:10]
  wire [63:0] _GEN_66 = _rdata_T_14 ? _GEN_0 : _GEN_55; // @[Conditional.scala 39:67]
  wire [63:0] _newPC_T_1 = 2'h3 == curPriv ? mepc : 64'h0; // @[Mux.scala 80:57]
  wire [63:0] _T_26 = {mtvecBase,2'h0}; // @[Cat.scala 30:58]
  wire [63:0] _newPC_T_3 = 2'h0 == mtvecMode ? _T_26 : 64'h0; // @[Mux.scala 80:57]
  wire [63:0] _GEN_115 = isRet ? _newPC_T_1 : _newPC_T_3; // @[CSR.scala 374:16 CSR.scala 378:13 CSR.scala 384:13]
  wire [63:0] _GEN_116 = curPriv == 2'h3 ? io_curPC : mepc; // @[CSR.scala 387:30 CSR.scala 388:14 CSR.scala 166:27]
  wire [63:0] _GEN_117 = curPriv == 2'h3 ? 64'hb : mcause; // @[CSR.scala 387:30 CSR.scala 389:16 CSR.scala 167:29]
  wire [63:0] _GEN_118 = io_csrOP == 4'h9 ? mepc : _GEN_115; // @[CSR.scala 394:46 CSR.scala 395:13]
  wire [1:0] _GEN_119 = io_csrOP == 4'h9 ? status_MPP : curPriv; // @[CSR.scala 394:46 CSR.scala 396:15 CSR.scala 293:30]
  wire  _GEN_120 = io_csrOP == 4'h9 ? status_MPIE : status_MIE; // @[CSR.scala 394:46 CSR.scala 397:18 CSR.scala 106:31]
  wire  _GEN_121 = io_csrOP == 4'h9 | status_MPIE; // @[CSR.scala 394:46 CSR.scala 398:19 CSR.scala 106:31]
  wire [1:0] _GEN_122 = io_csrOP == 4'h9 ? 2'h0 : status_MPP; // @[CSR.scala 394:46 CSR.scala 399:18 CSR.scala 106:31]
  wire [63:0] _GEN_128 = io_csrOP == 4'h7 ? _GEN_115 : _GEN_118; // @[CSR.scala 386:41]
  wire [63:0] _GEN_130 = io_en & isJmp ? _GEN_128 : 64'h0; // @[CSR.scala 372:29]
  assign io_rdata = 12'hb02 == io_addr ? mhpmcounter_2 : _rdata_T_33; // @[Mux.scala 80:57]
  assign io_pcOut = io_en & ~isJmp ? 64'h0 : _GEN_130; // @[CSR.scala 321:24 CSR.scala 322:11]
  assign io_jmp = csrOpList[1]; // @[CSR.scala 317:30]
  always @(posedge clock) begin
    if (reset) begin // @[CSR.scala 106:31]
      status_WPRI36 <= 27'h0; // @[CSR.scala 106:31]
    end else if (io_en & ~isJmp) begin // @[CSR.scala 321:24]
      if (_rdata_T_8) begin // @[Conditional.scala 40:58]
        status_WPRI36 <= wdata[62:36]; // @[CSR.scala 333:16]
      end
    end
    if (reset) begin // @[CSR.scala 106:31]
      status_SXL <= 2'h0; // @[CSR.scala 106:31]
    end else if (io_en & ~isJmp) begin // @[CSR.scala 321:24]
      if (_rdata_T_8) begin // @[Conditional.scala 40:58]
        status_SXL <= wdata[35:34]; // @[CSR.scala 333:16]
      end
    end
    if (reset) begin // @[CSR.scala 106:31]
      status_UXL <= 2'h0; // @[CSR.scala 106:31]
    end else if (io_en & ~isJmp) begin // @[CSR.scala 321:24]
      if (_rdata_T_8) begin // @[Conditional.scala 40:58]
        status_UXL <= wdata[33:32]; // @[CSR.scala 333:16]
      end
    end
    if (reset) begin // @[CSR.scala 106:31]
      status_WPRI23 <= 9'h0; // @[CSR.scala 106:31]
    end else if (io_en & ~isJmp) begin // @[CSR.scala 321:24]
      if (_rdata_T_8) begin // @[Conditional.scala 40:58]
        status_WPRI23 <= wdata[31:23]; // @[CSR.scala 333:16]
      end
    end
    if (reset) begin // @[CSR.scala 106:31]
      status_TSR <= 1'h0; // @[CSR.scala 106:31]
    end else if (io_en & ~isJmp) begin // @[CSR.scala 321:24]
      if (_rdata_T_8) begin // @[Conditional.scala 40:58]
        status_TSR <= wdata[22]; // @[CSR.scala 333:16]
      end
    end
    if (reset) begin // @[CSR.scala 106:31]
      status_TW <= 1'h0; // @[CSR.scala 106:31]
    end else if (io_en & ~isJmp) begin // @[CSR.scala 321:24]
      if (_rdata_T_8) begin // @[Conditional.scala 40:58]
        status_TW <= wdata[21]; // @[CSR.scala 333:16]
      end
    end
    if (reset) begin // @[CSR.scala 106:31]
      status_TVM <= 1'h0; // @[CSR.scala 106:31]
    end else if (io_en & ~isJmp) begin // @[CSR.scala 321:24]
      if (_rdata_T_8) begin // @[Conditional.scala 40:58]
        status_TVM <= wdata[20]; // @[CSR.scala 333:16]
      end
    end
    if (reset) begin // @[CSR.scala 106:31]
      status_MXR <= 1'h0; // @[CSR.scala 106:31]
    end else if (io_en & ~isJmp) begin // @[CSR.scala 321:24]
      if (_rdata_T_8) begin // @[Conditional.scala 40:58]
        status_MXR <= wdata[19]; // @[CSR.scala 333:16]
      end
    end
    if (reset) begin // @[CSR.scala 106:31]
      status_SUM <= 1'h0; // @[CSR.scala 106:31]
    end else if (io_en & ~isJmp) begin // @[CSR.scala 321:24]
      if (_rdata_T_8) begin // @[Conditional.scala 40:58]
        status_SUM <= wdata[18]; // @[CSR.scala 333:16]
      end
    end
    if (reset) begin // @[CSR.scala 106:31]
      status_MPRV <= 1'h0; // @[CSR.scala 106:31]
    end else if (io_en & ~isJmp) begin // @[CSR.scala 321:24]
      if (_rdata_T_8) begin // @[Conditional.scala 40:58]
        status_MPRV <= wdata[17]; // @[CSR.scala 333:16]
      end
    end
    if (reset) begin // @[CSR.scala 106:31]
      status_XS <= 2'h0; // @[CSR.scala 106:31]
    end else if (io_en & ~isJmp) begin // @[CSR.scala 321:24]
      if (_rdata_T_8) begin // @[Conditional.scala 40:58]
        status_XS <= wdata[16:15]; // @[CSR.scala 333:16]
      end
    end
    if (reset) begin // @[CSR.scala 106:31]
      status_FS <= 2'h0; // @[CSR.scala 106:31]
    end else if (io_en & ~isJmp) begin // @[CSR.scala 321:24]
      if (_rdata_T_8) begin // @[Conditional.scala 40:58]
        status_FS <= wdata[14:13]; // @[CSR.scala 333:16]
      end
    end
    if (reset) begin // @[CSR.scala 106:31]
      status_MPP <= 2'h0; // @[CSR.scala 106:31]
    end else if (io_en & ~isJmp) begin // @[CSR.scala 321:24]
      if (_rdata_T_8) begin // @[Conditional.scala 40:58]
        status_MPP <= wdata[12:11]; // @[CSR.scala 333:16]
      end
    end else if (io_en & isJmp) begin // @[CSR.scala 372:29]
      if (io_csrOP == 4'h7) begin // @[CSR.scala 386:41]
        status_MPP <= curPriv; // @[CSR.scala 393:18]
      end else begin
        status_MPP <= _GEN_122;
      end
    end
    if (reset) begin // @[CSR.scala 106:31]
      status_WPRI9 <= 2'h0; // @[CSR.scala 106:31]
    end else if (io_en & ~isJmp) begin // @[CSR.scala 321:24]
      if (_rdata_T_8) begin // @[Conditional.scala 40:58]
        status_WPRI9 <= wdata[10:9]; // @[CSR.scala 333:16]
      end
    end
    if (reset) begin // @[CSR.scala 106:31]
      status_SPP <= 1'h0; // @[CSR.scala 106:31]
    end else if (io_en & ~isJmp) begin // @[CSR.scala 321:24]
      if (_rdata_T_8) begin // @[Conditional.scala 40:58]
        status_SPP <= wdata[8]; // @[CSR.scala 333:16]
      end
    end
    if (reset) begin // @[CSR.scala 106:31]
      status_MPIE <= 1'h0; // @[CSR.scala 106:31]
    end else if (io_en & ~isJmp) begin // @[CSR.scala 321:24]
      if (_rdata_T_8) begin // @[Conditional.scala 40:58]
        status_MPIE <= wdata[7]; // @[CSR.scala 333:16]
      end
    end else if (io_en & isJmp) begin // @[CSR.scala 372:29]
      if (io_csrOP == 4'h7) begin // @[CSR.scala 386:41]
        status_MPIE <= status_MIE; // @[CSR.scala 391:19]
      end else begin
        status_MPIE <= _GEN_121;
      end
    end
    if (reset) begin // @[CSR.scala 106:31]
      status_WPRI6 <= 1'h0; // @[CSR.scala 106:31]
    end else if (io_en & ~isJmp) begin // @[CSR.scala 321:24]
      if (_rdata_T_8) begin // @[Conditional.scala 40:58]
        status_WPRI6 <= wdata[6]; // @[CSR.scala 333:16]
      end
    end
    if (reset) begin // @[CSR.scala 106:31]
      status_SPIE <= 1'h0; // @[CSR.scala 106:31]
    end else if (io_en & ~isJmp) begin // @[CSR.scala 321:24]
      if (_rdata_T_8) begin // @[Conditional.scala 40:58]
        status_SPIE <= wdata[5]; // @[CSR.scala 333:16]
      end
    end
    if (reset) begin // @[CSR.scala 106:31]
      status_UPIE <= 1'h0; // @[CSR.scala 106:31]
    end else if (io_en & ~isJmp) begin // @[CSR.scala 321:24]
      if (_rdata_T_8) begin // @[Conditional.scala 40:58]
        status_UPIE <= wdata[4]; // @[CSR.scala 333:16]
      end
    end
    if (reset) begin // @[CSR.scala 106:31]
      status_MIE <= 1'h0; // @[CSR.scala 106:31]
    end else if (io_en & ~isJmp) begin // @[CSR.scala 321:24]
      if (_rdata_T_8) begin // @[Conditional.scala 40:58]
        status_MIE <= wdata[3]; // @[CSR.scala 333:16]
      end
    end else if (io_en & isJmp) begin // @[CSR.scala 372:29]
      if (io_csrOP == 4'h7) begin // @[CSR.scala 386:41]
        status_MIE <= 1'h0; // @[CSR.scala 392:18]
      end else begin
        status_MIE <= _GEN_120;
      end
    end
    if (reset) begin // @[CSR.scala 106:31]
      status_WPRI2 <= 1'h0; // @[CSR.scala 106:31]
    end else if (io_en & ~isJmp) begin // @[CSR.scala 321:24]
      if (_rdata_T_8) begin // @[Conditional.scala 40:58]
        status_WPRI2 <= wdata[2]; // @[CSR.scala 333:16]
      end
    end
    if (reset) begin // @[CSR.scala 106:31]
      status_SIE <= 1'h0; // @[CSR.scala 106:31]
    end else if (io_en & ~isJmp) begin // @[CSR.scala 321:24]
      if (_rdata_T_8) begin // @[Conditional.scala 40:58]
        status_SIE <= wdata[1]; // @[CSR.scala 333:16]
      end
    end
    if (reset) begin // @[CSR.scala 106:31]
      status_UIE <= 1'h0; // @[CSR.scala 106:31]
    end else if (io_en & ~isJmp) begin // @[CSR.scala 321:24]
      if (_rdata_T_8) begin // @[Conditional.scala 40:58]
        status_UIE <= wdata[0]; // @[CSR.scala 333:16]
      end
    end
    if (reset) begin // @[CSR.scala 151:30]
      medeleg <= 64'h0; // @[CSR.scala 151:30]
    end else if (io_en & ~isJmp) begin // @[CSR.scala 321:24]
      if (!(_rdata_T_8)) begin // @[Conditional.scala 40:58]
        if (_rdata_T_12) begin // @[Conditional.scala 39:67]
          medeleg <= wdata; // @[CSR.scala 336:17]
        end
      end
    end
    if (reset) begin // @[CSR.scala 152:30]
      mideleg <= 64'h0; // @[CSR.scala 152:30]
    end else if (io_en & ~isJmp) begin // @[CSR.scala 321:24]
      if (!(_rdata_T_8)) begin // @[Conditional.scala 40:58]
        if (!(_rdata_T_12)) begin // @[Conditional.scala 39:67]
          mideleg <= _GEN_56;
        end
      end
    end
    if (reset) begin // @[CSR.scala 153:26]
      mie <= 64'h0; // @[CSR.scala 153:26]
    end else if (io_en & ~isJmp) begin // @[CSR.scala 321:24]
      if (!(_rdata_T_8)) begin // @[Conditional.scala 40:58]
        if (!(_rdata_T_12)) begin // @[Conditional.scala 39:67]
          mie <= _GEN_57;
        end
      end
    end
    if (reset) begin // @[CSR.scala 154:28]
      mtvec <= 64'h0; // @[CSR.scala 154:28]
    end else if (io_en & ~isJmp) begin // @[CSR.scala 321:24]
      if (!(_rdata_T_8)) begin // @[Conditional.scala 40:58]
        if (!(_rdata_T_12)) begin // @[Conditional.scala 39:67]
          mtvec <= _GEN_58;
        end
      end
    end
    if (reset) begin // @[CSR.scala 155:33]
      mcounteren <= 64'h0; // @[CSR.scala 155:33]
    end else if (io_en & ~isJmp) begin // @[CSR.scala 321:24]
      if (!(_rdata_T_8)) begin // @[Conditional.scala 40:58]
        if (!(_rdata_T_12)) begin // @[Conditional.scala 39:67]
          mcounteren <= _GEN_59;
        end
      end
    end
    if (reset) begin // @[CSR.scala 165:31]
      mscratch <= 64'h0; // @[CSR.scala 165:31]
    end else if (io_en & ~isJmp) begin // @[CSR.scala 321:24]
      if (!(_rdata_T_8)) begin // @[Conditional.scala 40:58]
        if (!(_rdata_T_12)) begin // @[Conditional.scala 39:67]
          mscratch <= _GEN_60;
        end
      end
    end
    if (reset) begin // @[CSR.scala 166:27]
      mepc <= 64'h0; // @[CSR.scala 166:27]
    end else if (io_en & ~isJmp) begin // @[CSR.scala 321:24]
      if (!(_rdata_T_8)) begin // @[Conditional.scala 40:58]
        if (!(_rdata_T_12)) begin // @[Conditional.scala 39:67]
          mepc <= _GEN_61;
        end
      end
    end else if (io_en & isJmp) begin // @[CSR.scala 372:29]
      if (io_csrOP == 4'h7) begin // @[CSR.scala 386:41]
        mepc <= _GEN_116;
      end
    end
    if (reset) begin // @[CSR.scala 167:29]
      mcause <= 64'h0; // @[CSR.scala 167:29]
    end else if (io_en & ~isJmp) begin // @[CSR.scala 321:24]
      if (!(_rdata_T_8)) begin // @[Conditional.scala 40:58]
        if (!(_rdata_T_12)) begin // @[Conditional.scala 39:67]
          mcause <= _GEN_62;
        end
      end
    end else if (io_en & isJmp) begin // @[CSR.scala 372:29]
      if (io_csrOP == 4'h7) begin // @[CSR.scala 386:41]
        mcause <= _GEN_117;
      end
    end
    if (reset) begin // @[CSR.scala 168:28]
      mtval <= 64'h0; // @[CSR.scala 168:28]
    end else if (io_en & ~isJmp) begin // @[CSR.scala 321:24]
      if (!(_rdata_T_8)) begin // @[Conditional.scala 40:58]
        if (!(_rdata_T_12)) begin // @[Conditional.scala 39:67]
          mtval <= _GEN_63;
        end
      end
    end
    if (reset) begin // @[CSR.scala 169:26]
      mip <= 64'h0; // @[CSR.scala 169:26]
    end else if (io_en & ~isJmp) begin // @[CSR.scala 321:24]
      if (_rdata_T_8) begin // @[Conditional.scala 40:58]
        mip <= _mip_T_2; // @[CSR.scala 307:7]
      end else if (_rdata_T_12) begin // @[Conditional.scala 39:67]
        mip <= _mip_T_2; // @[CSR.scala 307:7]
      end else begin
        mip <= _GEN_64;
      end
    end else begin
      mip <= _mip_T_2; // @[CSR.scala 307:7]
    end
    if (reset) begin // @[CSR.scala 179:12]
      mhpmcounter_0 <= 64'h0; // @[CSR.scala 179:12]
    end else if (io_en & ~isJmp) begin // @[CSR.scala 321:24]
      if (_rdata_T_8) begin // @[Conditional.scala 40:58]
        mhpmcounter_0 <= _mhpmcounter_0_T_1; // @[CSR.scala 305:10]
      end else if (_rdata_T_12) begin // @[Conditional.scala 39:67]
        mhpmcounter_0 <= _mhpmcounter_0_T_1; // @[CSR.scala 305:10]
      end else begin
        mhpmcounter_0 <= _GEN_65;
      end
    end else begin
      mhpmcounter_0 <= _mhpmcounter_0_T_1; // @[CSR.scala 305:10]
    end
    if (reset) begin // @[CSR.scala 179:12]
      mhpmcounter_2 <= 64'h0; // @[CSR.scala 179:12]
    end else if (io_en & ~isJmp) begin // @[CSR.scala 321:24]
      if (_rdata_T_8) begin // @[Conditional.scala 40:58]
        mhpmcounter_2 <= _GEN_0;
      end else if (_rdata_T_12) begin // @[Conditional.scala 39:67]
        mhpmcounter_2 <= _GEN_0;
      end else begin
        mhpmcounter_2 <= _GEN_66;
      end
    end else begin
      mhpmcounter_2 <= _GEN_0;
    end
    if (reset) begin // @[CSR.scala 293:30]
      curPriv <= 2'h3; // @[CSR.scala 293:30]
    end else if (!(io_en & ~isJmp)) begin // @[CSR.scala 321:24]
      if (io_en & isJmp) begin // @[CSR.scala 372:29]
        if (!(io_csrOP == 4'h7)) begin // @[CSR.scala 386:41]
          curPriv <= _GEN_119;
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
  status_WPRI36 = _RAND_0[26:0];
  _RAND_1 = {1{`RANDOM}};
  status_SXL = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  status_UXL = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  status_WPRI23 = _RAND_3[8:0];
  _RAND_4 = {1{`RANDOM}};
  status_TSR = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  status_TW = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  status_TVM = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  status_MXR = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  status_SUM = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  status_MPRV = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  status_XS = _RAND_10[1:0];
  _RAND_11 = {1{`RANDOM}};
  status_FS = _RAND_11[1:0];
  _RAND_12 = {1{`RANDOM}};
  status_MPP = _RAND_12[1:0];
  _RAND_13 = {1{`RANDOM}};
  status_WPRI9 = _RAND_13[1:0];
  _RAND_14 = {1{`RANDOM}};
  status_SPP = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  status_MPIE = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  status_WPRI6 = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  status_SPIE = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  status_UPIE = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  status_MIE = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  status_WPRI2 = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  status_SIE = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  status_UIE = _RAND_22[0:0];
  _RAND_23 = {2{`RANDOM}};
  medeleg = _RAND_23[63:0];
  _RAND_24 = {2{`RANDOM}};
  mideleg = _RAND_24[63:0];
  _RAND_25 = {2{`RANDOM}};
  mie = _RAND_25[63:0];
  _RAND_26 = {2{`RANDOM}};
  mtvec = _RAND_26[63:0];
  _RAND_27 = {2{`RANDOM}};
  mcounteren = _RAND_27[63:0];
  _RAND_28 = {2{`RANDOM}};
  mscratch = _RAND_28[63:0];
  _RAND_29 = {2{`RANDOM}};
  mepc = _RAND_29[63:0];
  _RAND_30 = {2{`RANDOM}};
  mcause = _RAND_30[63:0];
  _RAND_31 = {2{`RANDOM}};
  mtval = _RAND_31[63:0];
  _RAND_32 = {2{`RANDOM}};
  mip = _RAND_32[63:0];
  _RAND_33 = {2{`RANDOM}};
  mhpmcounter_0 = _RAND_33[63:0];
  _RAND_34 = {2{`RANDOM}};
  mhpmcounter_2 = _RAND_34[63:0];
  _RAND_35 = {1{`RANDOM}};
  curPriv = _RAND_35[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210669_SignExtend(
  input  [63:0] io_inputData,
  output [63:0] io_outputData,
  input         io_sExtend,
  input  [2:0]  io_lsByte
);
  wire [55:0] readData_hi = io_inputData[7] ? 56'hffffffffffffff : 56'h0; // @[Bitwise.scala 72:12]
  wire [7:0] readData_lo = io_inputData[7:0]; // @[MEM.scala 508:34]
  wire [63:0] _readData_T_2 = {readData_hi,readData_lo}; // @[Cat.scala 30:58]
  wire [63:0] _readData_T_3 = {56'h0,readData_lo}; // @[Cat.scala 30:58]
  wire [63:0] _readData_T_4 = io_sExtend ? _readData_T_2 : _readData_T_3; // @[MEM.scala 506:20]
  wire [47:0] readData_hi_2 = io_inputData[15] ? 48'hffffffffffff : 48'h0; // @[Bitwise.scala 72:12]
  wire [15:0] readData_lo_2 = io_inputData[15:0]; // @[MEM.scala 515:35]
  wire [63:0] _readData_T_7 = {readData_hi_2,readData_lo_2}; // @[Cat.scala 30:58]
  wire [63:0] _readData_T_8 = {48'h0,readData_lo_2}; // @[Cat.scala 30:58]
  wire [63:0] _readData_T_9 = io_sExtend ? _readData_T_7 : _readData_T_8; // @[MEM.scala 513:20]
  wire [31:0] readData_hi_4 = io_inputData[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] readData_lo_4 = io_inputData[31:0]; // @[MEM.scala 522:35]
  wire [63:0] _readData_T_12 = {readData_hi_4,readData_lo_4}; // @[Cat.scala 30:58]
  wire [63:0] _readData_T_13 = {32'h0,readData_lo_4}; // @[Cat.scala 30:58]
  wire [63:0] _readData_T_14 = io_sExtend ? _readData_T_12 : _readData_T_13; // @[MEM.scala 520:20]
  wire [63:0] _GEN_0 = io_lsByte == 3'h3 | io_lsByte == 3'h4 ? _readData_T_14 : io_inputData; // @[MEM.scala 519:82 MEM.scala 520:14 MEM.scala 527:14]
  wire [63:0] _GEN_1 = io_lsByte == 3'h2 ? _readData_T_9 : _GEN_0; // @[MEM.scala 512:50 MEM.scala 513:14]
  assign io_outputData = io_lsByte == 3'h1 ? _readData_T_4 : _GEN_1; // @[MEM.scala 505:39 MEM.scala 506:14]
endmodule
module ysyx_210669_EX(
  input         clock,
  input         reset,
  input         io_instValid,
  output [63:0] io_pcResult,
  output        io_pcSrc,
  input         io_mipMtip,
  input  [63:0] io_in_pc,
  input  [63:0] io_in_readData1,
  input  [63:0] io_in_readData2,
  input  [11:0] io_in_csrAddr,
  input  [63:0] io_in_imm,
  input  [63:0] io_in_writeReg,
  input         io_in_addSrc,
  input         io_in_aluSrc,
  input  [1:0]  io_in_shiftByte,
  input  [4:0]  io_in_aluOp,
  input         io_in_branch,
  input  [2:0]  io_in_resultSrc,
  input  [3:0]  io_in_csrOp,
  input         io_in_memWrite,
  input         io_in_memRead,
  input         io_in_sExtend,
  input  [2:0]  io_in_lsByte,
  input         io_in_memtoReg,
  input         io_in_regWrite,
  output [63:0] io_out_result,
  output [63:0] io_out_dataOutput,
  output [63:0] io_out_writeReg,
  output        io_out_memWrite,
  output        io_out_memRead,
  output        io_out_sExtend,
  output [2:0]  io_out_lsByte,
  output        io_out_memtoReg,
  output        io_out_regWrite,
  output        io_exH2Id_regWrite,
  output [63:0] io_exH2Id_writeReg,
  output        io_exH2Id_exLoad,
  output [63:0] io_exH2Id_wbData,
  output        io_load
);
  wire  csr_clock; // @[EX.scala 228:24]
  wire  csr_reset; // @[EX.scala 228:24]
  wire  csr_io_en; // @[EX.scala 228:24]
  wire [11:0] csr_io_addr; // @[EX.scala 228:24]
  wire [4:0] csr_io_wdataImm; // @[EX.scala 228:24]
  wire [63:0] csr_io_wdataRs1; // @[EX.scala 228:24]
  wire [63:0] csr_io_curPC; // @[EX.scala 228:24]
  wire [3:0] csr_io_csrOP; // @[EX.scala 228:24]
  wire [63:0] csr_io_rdata; // @[EX.scala 228:24]
  wire [63:0] csr_io_pcOut; // @[EX.scala 228:24]
  wire  csr_io_jmp; // @[EX.scala 228:24]
  wire  csr_io_instValid; // @[EX.scala 228:24]
  wire  csr_io_mipMtip; // @[EX.scala 228:24]
  wire [63:0] adSignEx_io_inputData; // @[EX.scala 268:36]
  wire [63:0] adSignEx_io_outputData; // @[EX.scala 268:36]
  wire  adSignEx_io_sExtend; // @[EX.scala 268:36]
  wire [2:0] adSignEx_io_lsByte; // @[EX.scala 268:36]
  wire [31:0] aluIn1_hi = io_in_readData1[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] aluIn1_lo = io_in_readData1[31:0]; // @[EX.scala 95:59]
  wire [63:0] _aluIn1_T_4 = {aluIn1_hi,aluIn1_lo}; // @[Cat.scala 30:58]
  wire [63:0] _aluIn1_T_5 = {32'h0,aluIn1_lo}; // @[Cat.scala 30:58]
  wire [63:0] _aluIn1_T_6 = io_in_aluOp == 5'hd ? _aluIn1_T_4 : _aluIn1_T_5; // @[EX.scala 94:10]
  wire [63:0] aluIn1 = io_in_lsByte == 3'h4 ? _aluIn1_T_6 : io_in_readData1; // @[EX.scala 93:8]
  wire [63:0] aluIn2 = io_in_aluSrc ? io_in_imm : io_in_readData2; // @[EX.scala 102:8]
  wire [63:0] _T_1 = aluIn1 + aluIn2; // @[EX.scala 114:32]
  wire [63:0] _T_3 = aluIn1 - aluIn2; // @[EX.scala 117:32]
  wire [94:0] _GEN_0 = {{31'd0}, aluIn1}; // @[EX.scala 121:32]
  wire [94:0] _T_5 = _GEN_0 << aluIn2[4:0]; // @[EX.scala 121:32]
  wire [126:0] _GEN_1 = {{63'd0}, aluIn1}; // @[EX.scala 124:33]
  wire [126:0] _T_8 = _GEN_1 << aluIn2[5:0]; // @[EX.scala 124:33]
  wire [63:0] _T_10 = io_in_lsByte == 3'h4 ? _aluIn1_T_6 : io_in_readData1; // @[EX.scala 129:35]
  wire [63:0] _T_11 = io_in_aluSrc ? io_in_imm : io_in_readData2; // @[EX.scala 129:51]
  wire [63:0] _T_14 = $signed(_T_10) - $signed(_T_11); // @[EX.scala 129:42]
  wire  _T_15 = $signed(_T_14) < 64'sh0; // @[EX.scala 129:59]
  wire  _T_17 = aluIn1 < aluIn2; // @[EX.scala 137:35]
  wire  _T_19 = aluIn1 == aluIn2; // @[EX.scala 143:34]
  wire  _T_21 = aluIn1 != aluIn2; // @[EX.scala 149:34]
  wire  _T_28 = $signed(_T_14) >= 64'sh0; // @[EX.scala 155:59]
  wire  _T_30 = aluIn1 >= aluIn2; // @[EX.scala 161:35]
  wire [63:0] _T_32 = aluIn1 ^ aluIn2; // @[EX.scala 167:32]
  wire [63:0] _T_34 = aluIn1 >> aluIn2[4:0]; // @[EX.scala 171:32]
  wire [63:0] _T_37 = aluIn1 >> aluIn2[5:0]; // @[EX.scala 174:33]
  wire [63:0] _T_42 = $signed(_T_10) >>> aluIn2[4:0]; // @[EX.scala 178:55]
  wire [63:0] _T_46 = $signed(_T_10) >>> aluIn2[5:0]; // @[EX.scala 181:56]
  wire [63:0] _T_47 = aluIn1 | aluIn2; // @[EX.scala 185:32]
  wire [63:0] _T_48 = aluIn1 & aluIn2; // @[EX.scala 189:32]
  wire [63:0] _aluResult_T_1 = 5'h0 == io_in_aluOp ? _T_1 : 64'h0; // @[Mux.scala 80:57]
  wire [63:0] _aluResult_T_3 = 5'h1 == io_in_aluOp ? _T_3 : _aluResult_T_1; // @[Mux.scala 80:57]
  wire [63:0] _aluResult_T_5 = 5'h2 == io_in_aluOp ? _T_5[63:0] : _aluResult_T_3; // @[Mux.scala 80:57]
  wire [63:0] _aluResult_T_7 = 5'h3 == io_in_aluOp ? _T_8[63:0] : _aluResult_T_5; // @[Mux.scala 80:57]
  wire [63:0] _aluResult_T_9 = 5'h4 == io_in_aluOp ? {{63'd0}, _T_15} : _aluResult_T_7; // @[Mux.scala 80:57]
  wire [63:0] _aluResult_T_11 = 5'h5 == io_in_aluOp ? {{63'd0}, _T_17} : _aluResult_T_9; // @[Mux.scala 80:57]
  wire [63:0] _aluResult_T_13 = 5'h6 == io_in_aluOp ? {{63'd0}, _T_19} : _aluResult_T_11; // @[Mux.scala 80:57]
  wire [63:0] _aluResult_T_15 = 5'h7 == io_in_aluOp ? {{63'd0}, _T_21} : _aluResult_T_13; // @[Mux.scala 80:57]
  wire [63:0] _aluResult_T_17 = 5'h8 == io_in_aluOp ? {{63'd0}, _T_28} : _aluResult_T_15; // @[Mux.scala 80:57]
  wire [63:0] _aluResult_T_19 = 5'h9 == io_in_aluOp ? {{63'd0}, _T_30} : _aluResult_T_17; // @[Mux.scala 80:57]
  wire [63:0] _aluResult_T_21 = 5'ha == io_in_aluOp ? _T_32 : _aluResult_T_19; // @[Mux.scala 80:57]
  wire [63:0] _aluResult_T_23 = 5'hb == io_in_aluOp ? _T_34 : _aluResult_T_21; // @[Mux.scala 80:57]
  wire [63:0] _aluResult_T_25 = 5'hc == io_in_aluOp ? _T_37 : _aluResult_T_23; // @[Mux.scala 80:57]
  wire [63:0] _aluResult_T_27 = 5'hd == io_in_aluOp ? _T_42 : _aluResult_T_25; // @[Mux.scala 80:57]
  wire [63:0] _aluResult_T_29 = 5'he == io_in_aluOp ? _T_46 : _aluResult_T_27; // @[Mux.scala 80:57]
  wire [63:0] _aluResult_T_31 = 5'hf == io_in_aluOp ? _T_47 : _aluResult_T_29; // @[Mux.scala 80:57]
  wire [63:0] _aluResult_T_33 = 5'h10 == io_in_aluOp ? _T_48 : _aluResult_T_31; // @[Mux.scala 80:57]
  wire [63:0] _aluResult_T_35 = 5'h11 == io_in_aluOp ? 64'h1 : _aluResult_T_33; // @[Mux.scala 80:57]
  wire [63:0] aluResult = 5'h12 == io_in_aluOp ? 64'h0 : _aluResult_T_35; // @[Mux.scala 80:57]
  wire [63:0] pcNext = io_in_pc + 64'h4; // @[EX.scala 204:31]
  wire [63:0] addIn1 = io_in_addSrc ? io_in_readData1 : io_in_pc; // @[EX.scala 208:8]
  wire [62:0] shiftLeft_hi = io_in_imm[62:0]; // @[EX.scala 218:15]
  wire [63:0] _shiftLeft_T_1 = {shiftLeft_hi,1'h0}; // @[Cat.scala 30:58]
  wire [51:0] shiftLeft_hi_1 = io_in_imm[51:0]; // @[EX.scala 220:17]
  wire [63:0] _shiftLeft_T_3 = {shiftLeft_hi_1,12'h0}; // @[Cat.scala 30:58]
  wire [63:0] _shiftLeft_T_4 = io_in_shiftByte == 2'h2 ? _shiftLeft_T_3 : io_in_imm; // @[EX.scala 219:8]
  wire [63:0] shiftLeft = io_in_shiftByte == 2'h1 ? _shiftLeft_T_1 : _shiftLeft_T_4; // @[EX.scala 217:28]
  wire [63:0] addResult = addIn1 + shiftLeft; // @[EX.scala 225:32]
  wire  csrEn = io_in_csrOp != 4'h0; // @[EX.scala 229:33]
  wire [62:0] io_pcResult_hi = addResult[63:1]; // @[EX.scala 247:20]
  wire [63:0] _io_pcResult_T = {io_pcResult_hi,1'h0}; // @[Cat.scala 30:58]
  wire [63:0] _io_pcResult_T_1 = io_in_addSrc ? _io_pcResult_T : addResult; // @[EX.scala 246:8]
  wire [63:0] _result_T_4 = io_in_resultSrc == 3'h3 ? addResult : pcNext; // @[EX.scala 260:14]
  wire [63:0] _result_T_5 = io_in_resultSrc == 3'h2 ? shiftLeft : _result_T_4; // @[EX.scala 258:12]
  wire [63:0] _result_T_6 = io_in_resultSrc == 3'h1 ? aluResult : _result_T_5; // @[EX.scala 256:10]
  wire [63:0] result = io_in_resultSrc == 3'h0 ? csr_io_rdata : _result_T_6; // @[EX.scala 254:8]
  ysyx_210669_CSR csr ( // @[EX.scala 228:24]
    .clock(csr_clock),
    .reset(csr_reset),
    .io_en(csr_io_en),
    .io_addr(csr_io_addr),
    .io_wdataImm(csr_io_wdataImm),
    .io_wdataRs1(csr_io_wdataRs1),
    .io_curPC(csr_io_curPC),
    .io_csrOP(csr_io_csrOP),
    .io_rdata(csr_io_rdata),
    .io_pcOut(csr_io_pcOut),
    .io_jmp(csr_io_jmp),
    .io_instValid(csr_io_instValid),
    .io_mipMtip(csr_io_mipMtip)
  );
  ysyx_210669_SignExtend adSignEx ( // @[EX.scala 268:36]
    .io_inputData(adSignEx_io_inputData),
    .io_outputData(adSignEx_io_outputData),
    .io_sExtend(adSignEx_io_sExtend),
    .io_lsByte(adSignEx_io_lsByte)
  );
  assign io_pcResult = csr_io_jmp ? csr_io_pcOut : _io_pcResult_T_1; // @[EX.scala 244:21]
  assign io_pcSrc = io_in_branch & |aluResult; // @[EX.scala 288:28]
  assign io_out_result = io_in_memtoReg ? result : adSignEx_io_outputData; // @[EX.scala 275:20]
  assign io_out_dataOutput = io_in_readData2; // @[EX.scala 201:21]
  assign io_out_writeReg = io_in_writeReg; // @[EX.scala 290:19]
  assign io_out_memWrite = io_in_memWrite; // @[EX.scala 291:19]
  assign io_out_memRead = io_in_memRead; // @[EX.scala 292:18]
  assign io_out_sExtend = io_in_sExtend; // @[EX.scala 293:18]
  assign io_out_lsByte = io_in_lsByte; // @[EX.scala 294:17]
  assign io_out_memtoReg = io_in_memtoReg; // @[EX.scala 295:19]
  assign io_out_regWrite = io_in_regWrite; // @[EX.scala 296:19]
  assign io_exH2Id_regWrite = io_in_regWrite; // @[EX.scala 282:22]
  assign io_exH2Id_writeReg = io_in_writeReg; // @[EX.scala 283:22]
  assign io_exH2Id_exLoad = io_in_memRead; // @[EX.scala 284:20]
  assign io_exH2Id_wbData = io_in_memtoReg ? result : adSignEx_io_outputData; // @[EX.scala 275:20]
  assign io_load = io_in_memRead; // @[EX.scala 286:11]
  assign csr_clock = clock;
  assign csr_reset = reset;
  assign csr_io_en = csrEn & io_instValid; // @[EX.scala 230:22]
  assign csr_io_addr = io_in_csrAddr; // @[EX.scala 231:31]
  assign csr_io_wdataImm = io_in_imm[4:0]; // @[EX.scala 233:25]
  assign csr_io_wdataRs1 = io_in_readData1; // @[EX.scala 232:19]
  assign csr_io_curPC = io_in_pc; // @[EX.scala 234:16]
  assign csr_io_csrOP = io_in_csrOp; // @[EX.scala 235:16]
  assign csr_io_instValid = io_instValid; // @[EX.scala 236:20]
  assign csr_io_mipMtip = io_mipMtip; // @[EX.scala 237:18]
  assign adSignEx_io_inputData = io_in_resultSrc == 3'h0 ? csr_io_rdata : _result_T_6; // @[EX.scala 254:8]
  assign adSignEx_io_sExtend = io_in_sExtend; // @[EX.scala 271:23]
  assign adSignEx_io_lsByte = io_in_lsByte; // @[EX.scala 270:22]
endmodule
module ysyx_210669_Clint(
  input         clock,
  input         reset,
  input  [63:0] io_addr,
  input         io_ren,
  input  [63:0] io_wdata,
  input         io_wen,
  output        io_mipMtip
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] mtime; // @[Clint.scala 18:28]
  reg [63:0] mtimecmp; // @[Clint.scala 19:31]
  reg [63:0] counter; // @[Clint.scala 22:30]
  wire [63:0] _counter_T_2 = counter + 64'h1; // @[Clint.scala 26:13]
  wire [63:0] _mtime_T_1 = mtime + 64'h1; // @[Clint.scala 30:20]
  wire  _T_2 = 64'h2004000 == io_addr; // @[Conditional.scala 37:30]
  assign io_mipMtip = mtime >= mtimecmp; // @[Clint.scala 33:23]
  always @(posedge clock) begin
    if (reset) begin // @[Clint.scala 18:28]
      mtime <= 64'h0; // @[Clint.scala 18:28]
    end else if (counter == 64'ha) begin // @[Clint.scala 29:25]
      mtime <= _mtime_T_1; // @[Clint.scala 30:11]
    end
    if (reset) begin // @[Clint.scala 19:31]
      mtimecmp <= 64'h3e8; // @[Clint.scala 19:31]
    end else if (!(io_ren)) begin // @[Clint.scala 44:15]
      if (io_wen) begin // @[Clint.scala 53:21]
        if (_T_2) begin // @[Conditional.scala 40:58]
          mtimecmp <= io_wdata; // @[Clint.scala 56:18]
        end
      end
    end
    if (reset) begin // @[Clint.scala 22:30]
      counter <= 64'h0; // @[Clint.scala 22:30]
    end else if (counter < 64'ha) begin // @[Clint.scala 25:17]
      counter <= _counter_T_2;
    end else begin
      counter <= 64'h0;
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
  mtime = _RAND_0[63:0];
  _RAND_1 = {2{`RANDOM}};
  mtimecmp = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  counter = _RAND_2[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210669_MEM(
  input         clock,
  input         reset,
  input  [63:0] io_in_address,
  input  [63:0] io_in_writeData,
  input  [63:0] io_in_writeReg,
  input         io_in_memWrite,
  input         io_in_memRead,
  input         io_in_sExtend,
  input  [2:0]  io_in_lsByte,
  input         io_in_memtoReg,
  input         io_in_regWrite,
  output [63:0] io_out_readData,
  output [63:0] io_out_extendResult,
  output [63:0] io_out_writeReg,
  output        io_out_memtoReg,
  output        io_out_regWrite,
  output        io_memH2Id_regWrite,
  output [63:0] io_memH2Id_writeReg,
  output [63:0] io_memH2Id_wbData,
  output        io_mipMtip,
  output        io_rw_valid,
  input         io_rw_ready,
  output [31:0] io_rw_addr,
  output        io_rw_ren,
  input  [63:0] io_rw_rdata,
  output [2:0]  io_rw_size,
  output        io_rw_wen,
  output [63:0] io_rw_wdata,
  output [7:0]  io_rw_wmask,
  output        io_runAXI,
  input         io_rwValid,
  output        io_waitAXI
);
  wire  clint_clock; // @[MEM.scala 280:28]
  wire  clint_reset; // @[MEM.scala 280:28]
  wire [63:0] clint_io_addr; // @[MEM.scala 280:28]
  wire  clint_io_ren; // @[MEM.scala 280:28]
  wire [63:0] clint_io_wdata; // @[MEM.scala 280:28]
  wire  clint_io_wen; // @[MEM.scala 280:28]
  wire  clint_io_mipMtip; // @[MEM.scala 280:28]
  wire [63:0] dmSignEx_io_inputData; // @[MEM.scala 439:36]
  wire [63:0] dmSignEx_io_outputData; // @[MEM.scala 439:36]
  wire  dmSignEx_io_sExtend; // @[MEM.scala 439:36]
  wire [2:0] dmSignEx_io_lsByte; // @[MEM.scala 439:36]
  wire  _T = io_in_lsByte == 3'h5; // @[MEM.scala 80:21]
  wire  _T_1 = io_in_lsByte == 3'h3; // @[MEM.scala 83:27]
  wire [63:0] _GEN_0 = io_in_address[2] ? 64'hffffffff00000000 : 64'hffffffff; // @[MEM.scala 84:34 MEM.scala 85:12 MEM.scala 94:12]
  wire [7:0] _GEN_1 = io_in_address[2] ? 8'hf0 : 8'hf; // @[MEM.scala 84:34 MEM.scala 89:13 MEM.scala 98:13]
  wire  _T_4 = io_in_lsByte == 3'h2; // @[MEM.scala 103:27]
  wire  _T_6 = io_in_address[2:1] == 2'h1; // @[MEM.scala 104:29]
  wire  _T_8 = io_in_address[2:1] == 2'h2; // @[MEM.scala 115:35]
  wire  _T_10 = io_in_address[2:1] == 2'h3; // @[MEM.scala 126:35]
  wire [63:0] _GEN_2 = io_in_address[2:1] == 2'h3 ? 64'hffff000000000000 : 64'hffff; // @[MEM.scala 126:43 MEM.scala 127:12 MEM.scala 136:12]
  wire [7:0] _GEN_3 = io_in_address[2:1] == 2'h3 ? 8'hc0 : 8'h3; // @[MEM.scala 126:43 MEM.scala 131:13 MEM.scala 140:13]
  wire [63:0] _GEN_4 = io_in_address[2:1] == 2'h2 ? 64'hffff00000000 : _GEN_2; // @[MEM.scala 115:43 MEM.scala 116:12]
  wire [7:0] _GEN_5 = io_in_address[2:1] == 2'h2 ? 8'h30 : _GEN_3; // @[MEM.scala 115:43 MEM.scala 121:13]
  wire [63:0] _GEN_6 = io_in_address[2:1] == 2'h1 ? 64'hffff0000 : _GEN_4; // @[MEM.scala 104:37 MEM.scala 105:12]
  wire [7:0] _GEN_7 = io_in_address[2:1] == 2'h1 ? 8'hc : _GEN_5; // @[MEM.scala 104:37 MEM.scala 110:13]
  wire  _T_12 = io_in_address[2:0] == 3'h1; // @[MEM.scala 146:29]
  wire  _T_14 = io_in_address[2:0] == 3'h2; // @[MEM.scala 157:35]
  wire  _T_16 = io_in_address[2:0] == 3'h3; // @[MEM.scala 168:35]
  wire  _T_18 = io_in_address[2:0] == 3'h4; // @[MEM.scala 179:35]
  wire  _T_20 = io_in_address[2:0] == 3'h5; // @[MEM.scala 190:35]
  wire  _T_22 = io_in_address[2:0] == 3'h6; // @[MEM.scala 201:35]
  wire  _T_24 = io_in_address[2:0] == 3'h7; // @[MEM.scala 212:35]
  wire [63:0] _GEN_8 = io_in_address[2:0] == 3'h7 ? 64'hff00000000000000 : 64'hff; // @[MEM.scala 212:43 MEM.scala 213:12 MEM.scala 222:12]
  wire [7:0] _GEN_9 = io_in_address[2:0] == 3'h7 ? 8'h80 : 8'h1; // @[MEM.scala 212:43 MEM.scala 217:13 MEM.scala 226:13]
  wire [63:0] _GEN_10 = io_in_address[2:0] == 3'h6 ? 64'hff000000000000 : _GEN_8; // @[MEM.scala 201:43 MEM.scala 202:12]
  wire [7:0] _GEN_11 = io_in_address[2:0] == 3'h6 ? 8'h40 : _GEN_9; // @[MEM.scala 201:43 MEM.scala 207:13]
  wire [63:0] _GEN_12 = io_in_address[2:0] == 3'h5 ? 64'hff0000000000 : _GEN_10; // @[MEM.scala 190:43 MEM.scala 191:12]
  wire [7:0] _GEN_13 = io_in_address[2:0] == 3'h5 ? 8'h20 : _GEN_11; // @[MEM.scala 190:43 MEM.scala 196:13]
  wire [63:0] _GEN_14 = io_in_address[2:0] == 3'h4 ? 64'hff00000000 : _GEN_12; // @[MEM.scala 179:43 MEM.scala 180:12]
  wire [7:0] _GEN_15 = io_in_address[2:0] == 3'h4 ? 8'h10 : _GEN_13; // @[MEM.scala 179:43 MEM.scala 185:13]
  wire [63:0] _GEN_16 = io_in_address[2:0] == 3'h3 ? 64'hff000000 : _GEN_14; // @[MEM.scala 168:43 MEM.scala 169:12]
  wire [7:0] _GEN_17 = io_in_address[2:0] == 3'h3 ? 8'h8 : _GEN_15; // @[MEM.scala 168:43 MEM.scala 174:13]
  wire [63:0] _GEN_18 = io_in_address[2:0] == 3'h2 ? 64'hff0000 : _GEN_16; // @[MEM.scala 157:43 MEM.scala 158:12]
  wire [7:0] _GEN_19 = io_in_address[2:0] == 3'h2 ? 8'h4 : _GEN_17; // @[MEM.scala 157:43 MEM.scala 163:13]
  wire [63:0] _GEN_20 = io_in_address[2:0] == 3'h1 ? 64'hff00 : _GEN_18; // @[MEM.scala 146:37 MEM.scala 147:12]
  wire [7:0] _GEN_21 = io_in_address[2:0] == 3'h1 ? 8'h2 : _GEN_19; // @[MEM.scala 146:37 MEM.scala 152:13]
  wire [63:0] _GEN_22 = io_in_lsByte == 3'h2 ? _GEN_6 : _GEN_20; // @[MEM.scala 103:52]
  wire [7:0] _GEN_23 = io_in_lsByte == 3'h2 ? _GEN_7 : _GEN_21; // @[MEM.scala 103:52]
  wire [63:0] _GEN_24 = io_in_lsByte == 3'h3 ? _GEN_0 : _GEN_22; // @[MEM.scala 83:48]
  wire [7:0] _GEN_25 = io_in_lsByte == 3'h3 ? _GEN_1 : _GEN_23; // @[MEM.scala 83:48]
  wire [63:0] mask = io_in_lsByte == 3'h5 ? 64'hffffffffffffffff : _GEN_24; // @[MEM.scala 80:48 MEM.scala 81:10]
  wire [31:0] writeData_hi = io_in_writeData[31:0]; // @[MEM.scala 240:35]
  wire [63:0] _writeData_T = {writeData_hi,32'h0}; // @[Cat.scala 30:58]
  wire [63:0] _GEN_28 = io_in_address[2] ? _writeData_T : io_in_writeData; // @[MEM.scala 239:34 MEM.scala 240:17 MEM.scala 242:17]
  wire [47:0] writeData_hi_1 = io_in_writeData[47:0]; // @[MEM.scala 246:35]
  wire [63:0] _writeData_T_1 = {writeData_hi_1,16'h0}; // @[Cat.scala 30:58]
  wire [15:0] writeData_hi_3 = io_in_writeData[15:0]; // @[MEM.scala 250:35]
  wire [63:0] _writeData_T_3 = {writeData_hi_3,48'h0}; // @[Cat.scala 30:58]
  wire [63:0] _GEN_29 = _T_10 ? _writeData_T_3 : io_in_writeData; // @[MEM.scala 249:43 MEM.scala 250:17 MEM.scala 252:17]
  wire [63:0] _GEN_30 = _T_8 ? _writeData_T : _GEN_29; // @[MEM.scala 247:43 MEM.scala 248:17]
  wire [63:0] _GEN_31 = _T_6 ? _writeData_T_1 : _GEN_30; // @[MEM.scala 245:37 MEM.scala 246:17]
  wire [55:0] writeData_hi_4 = io_in_writeData[55:0]; // @[MEM.scala 256:35]
  wire [63:0] _writeData_T_4 = {writeData_hi_4,8'h0}; // @[Cat.scala 30:58]
  wire [39:0] writeData_hi_6 = io_in_writeData[39:0]; // @[MEM.scala 260:35]
  wire [63:0] _writeData_T_6 = {writeData_hi_6,24'h0}; // @[Cat.scala 30:58]
  wire [23:0] writeData_hi_8 = io_in_writeData[23:0]; // @[MEM.scala 264:35]
  wire [63:0] _writeData_T_8 = {writeData_hi_8,40'h0}; // @[Cat.scala 30:58]
  wire [7:0] writeData_hi_10 = io_in_writeData[7:0]; // @[MEM.scala 268:35]
  wire [63:0] _writeData_T_10 = {writeData_hi_10,56'h0}; // @[Cat.scala 30:58]
  wire [63:0] _GEN_32 = _T_24 ? _writeData_T_10 : io_in_writeData; // @[MEM.scala 267:43 MEM.scala 268:17 MEM.scala 270:17]
  wire [63:0] _GEN_33 = _T_22 ? _writeData_T_3 : _GEN_32; // @[MEM.scala 265:43 MEM.scala 266:17]
  wire [63:0] _GEN_34 = _T_20 ? _writeData_T_8 : _GEN_33; // @[MEM.scala 263:43 MEM.scala 264:17]
  wire [63:0] _GEN_35 = _T_18 ? _writeData_T : _GEN_34; // @[MEM.scala 261:43 MEM.scala 262:17]
  wire [63:0] _GEN_36 = _T_16 ? _writeData_T_6 : _GEN_35; // @[MEM.scala 259:43 MEM.scala 260:17]
  wire [63:0] _GEN_37 = _T_14 ? _writeData_T_1 : _GEN_36; // @[MEM.scala 257:43 MEM.scala 258:17]
  wire [63:0] _GEN_38 = _T_12 ? _writeData_T_4 : _GEN_37; // @[MEM.scala 255:37 MEM.scala 256:17]
  wire [63:0] _GEN_39 = _T_4 ? _GEN_31 : _GEN_38; // @[MEM.scala 244:54]
  wire [63:0] _GEN_40 = _T_1 ? _GEN_28 : _GEN_39; // @[MEM.scala 238:50]
  wire  _T_50 = 3'h1 == io_in_lsByte; // @[Conditional.scala 37:30]
  wire  _T_51 = 3'h2 == io_in_lsByte; // @[Conditional.scala 37:30]
  wire  _T_52 = 3'h3 == io_in_lsByte; // @[Conditional.scala 37:30]
  wire  _T_53 = 3'h5 == io_in_lsByte; // @[Conditional.scala 37:30]
  wire [1:0] _GEN_42 = _T_53 ? 2'h3 : 2'h2; // @[Conditional.scala 39:67 MEM.scala 288:37]
  wire [1:0] _GEN_43 = _T_52 ? 2'h2 : _GEN_42; // @[Conditional.scala 39:67 MEM.scala 287:31]
  wire [1:0] _GEN_44 = _T_51 ? 2'h1 : _GEN_43; // @[Conditional.scala 39:67 MEM.scala 286:35]
  wire [1:0] size = _T_50 ? 2'h0 : _GEN_44; // @[Conditional.scala 40:58 MEM.scala 285:31]
  wire  skip = io_in_address >= 64'h2000000 & io_in_address <= 64'h200ffff; // @[MEM.scala 292:38]
  wire  _io_waitAXI_T = ~io_rw_ready; // @[MEM.scala 310:7]
  wire [63:0] maskedReadData = io_rw_rdata & mask; // @[MEM.scala 389:42]
  wire [63:0] _readDataOut_T = {{32'd0}, maskedReadData[63:32]}; // @[MEM.scala 395:37]
  wire [63:0] _GEN_60 = io_in_address[2] ? _readDataOut_T : maskedReadData; // @[MEM.scala 394:34 MEM.scala 395:19 MEM.scala 397:19]
  wire [63:0] _readDataOut_T_1 = {{16'd0}, maskedReadData[63:16]}; // @[MEM.scala 401:37]
  wire [63:0] _readDataOut_T_3 = {{48'd0}, maskedReadData[63:48]}; // @[MEM.scala 405:37]
  wire [63:0] _GEN_61 = _T_10 ? _readDataOut_T_3 : maskedReadData; // @[MEM.scala 404:43 MEM.scala 405:19 MEM.scala 407:19]
  wire [63:0] _GEN_62 = _T_8 ? _readDataOut_T : _GEN_61; // @[MEM.scala 402:43 MEM.scala 403:19]
  wire [63:0] _GEN_63 = _T_6 ? _readDataOut_T_1 : _GEN_62; // @[MEM.scala 400:37 MEM.scala 401:19]
  wire [63:0] _readDataOut_T_4 = {{8'd0}, maskedReadData[63:8]}; // @[MEM.scala 411:37]
  wire [63:0] _readDataOut_T_6 = {{24'd0}, maskedReadData[63:24]}; // @[MEM.scala 415:37]
  wire [63:0] _readDataOut_T_8 = {{40'd0}, maskedReadData[63:40]}; // @[MEM.scala 419:37]
  wire [63:0] _readDataOut_T_10 = {{56'd0}, maskedReadData[63:56]}; // @[MEM.scala 423:37]
  wire [63:0] _GEN_64 = _T_24 ? _readDataOut_T_10 : maskedReadData; // @[MEM.scala 422:43 MEM.scala 423:19 MEM.scala 425:19]
  wire [63:0] _GEN_65 = _T_22 ? _readDataOut_T_3 : _GEN_64; // @[MEM.scala 420:43 MEM.scala 421:19]
  wire [63:0] _GEN_66 = _T_20 ? _readDataOut_T_8 : _GEN_65; // @[MEM.scala 418:43 MEM.scala 419:19]
  wire [63:0] _GEN_67 = _T_18 ? _readDataOut_T : _GEN_66; // @[MEM.scala 416:43 MEM.scala 417:19]
  wire [63:0] _GEN_68 = _T_16 ? _readDataOut_T_6 : _GEN_67; // @[MEM.scala 414:43 MEM.scala 415:19]
  wire [63:0] _GEN_69 = _T_14 ? _readDataOut_T_1 : _GEN_68; // @[MEM.scala 412:43 MEM.scala 413:19]
  wire [63:0] _GEN_70 = _T_12 ? _readDataOut_T_4 : _GEN_69; // @[MEM.scala 410:37 MEM.scala 411:19]
  wire [63:0] _GEN_71 = _T_4 ? _GEN_63 : _GEN_70; // @[MEM.scala 399:52]
  wire [63:0] _GEN_72 = _T_1 ? _GEN_60 : _GEN_71; // @[MEM.scala 393:50]
  ysyx_210669_Clint clint ( // @[MEM.scala 280:28]
    .clock(clint_clock),
    .reset(clint_reset),
    .io_addr(clint_io_addr),
    .io_ren(clint_io_ren),
    .io_wdata(clint_io_wdata),
    .io_wen(clint_io_wen),
    .io_mipMtip(clint_io_mipMtip)
  );
  ysyx_210669_SignExtend dmSignEx ( // @[MEM.scala 439:36]
    .io_inputData(dmSignEx_io_inputData),
    .io_outputData(dmSignEx_io_outputData),
    .io_sExtend(dmSignEx_io_sExtend),
    .io_lsByte(dmSignEx_io_lsByte)
  );
  assign io_out_readData = dmSignEx_io_outputData; // @[MEM.scala 444:19]
  assign io_out_extendResult = io_in_address; // @[MEM.scala 446:23]
  assign io_out_writeReg = io_in_writeReg; // @[MEM.scala 473:19]
  assign io_out_memtoReg = io_in_memtoReg; // @[MEM.scala 475:19]
  assign io_out_regWrite = io_in_regWrite; // @[MEM.scala 476:19]
  assign io_memH2Id_regWrite = io_in_regWrite; // @[MEM.scala 450:23]
  assign io_memH2Id_writeReg = io_in_writeReg; // @[MEM.scala 451:23]
  assign io_memH2Id_wbData = io_in_memtoReg ? dmSignEx_io_outputData : io_in_address; // @[MEM.scala 452:27]
  assign io_mipMtip = skip & clint_io_mipMtip; // @[MEM.scala 292:71 MEM.scala 299:13]
  assign io_rw_valid = skip ? 1'h0 : io_rwValid; // @[MEM.scala 292:71 MEM.scala 308:17 MEM.scala 346:17]
  assign io_rw_addr = io_in_address[31:0];
  assign io_rw_ren = skip ? 1'h0 : io_in_memRead; // @[MEM.scala 292:71 MEM.scala 302:15 MEM.scala 340:15]
  assign io_rw_size = {{1'd0}, size}; // @[Conditional.scala 40:58 MEM.scala 285:31]
  assign io_rw_wen = skip ? 1'h0 : io_in_memWrite; // @[MEM.scala 292:71 MEM.scala 305:15 MEM.scala 343:15]
  assign io_rw_wdata = _T ? io_in_writeData : _GEN_40; // @[MEM.scala 236:48 MEM.scala 237:15]
  assign io_rw_wmask = io_in_lsByte == 3'h5 ? 8'hff : _GEN_25; // @[MEM.scala 80:48 MEM.scala 82:11]
  assign io_runAXI = skip ? 1'h0 : io_in_memRead | io_in_memWrite; // @[MEM.scala 292:71 MEM.scala 313:15 MEM.scala 351:15]
  assign io_waitAXI = skip ? io_rw_valid & _io_waitAXI_T : io_rw_valid & _io_waitAXI_T; // @[MEM.scala 292:71 MEM.scala 309:16 MEM.scala 347:16]
  assign clint_clock = clock;
  assign clint_reset = reset;
  assign clint_io_addr = io_in_address; // @[MEM.scala 292:71 MEM.scala 295:19 MEM.scala 355:19]
  assign clint_io_ren = skip & io_in_memRead; // @[MEM.scala 292:71 MEM.scala 294:18 MEM.scala 354:18]
  assign clint_io_wdata = _T ? io_in_writeData : _GEN_40; // @[MEM.scala 236:48 MEM.scala 237:15]
  assign clint_io_wen = skip & io_in_memWrite; // @[MEM.scala 292:71 MEM.scala 297:18 MEM.scala 356:18]
  assign dmSignEx_io_inputData = _T ? maskedReadData : _GEN_72; // @[MEM.scala 391:48 MEM.scala 392:17]
  assign dmSignEx_io_sExtend = io_in_sExtend; // @[MEM.scala 443:23]
  assign dmSignEx_io_lsByte = io_in_lsByte; // @[MEM.scala 442:22]
endmodule
module ysyx_210669_WB(
  output [63:0] io_writeData,
  output [63:0] io_writeReg,
  output        io_regWrite,
  input  [63:0] io_in_memData,
  input  [63:0] io_in_aluData,
  input         io_in_memtoReg,
  input  [63:0] io_in_writeReg,
  input         io_in_regWrite,
  output        io_wbH2Id_regWrite,
  output [63:0] io_wbH2Id_writeReg,
  output [63:0] io_wbH2Id_wbData
);
  assign io_writeData = io_in_memtoReg ? io_in_memData : io_in_aluData; // @[WB.scala 56:28]
  assign io_writeReg = io_in_writeReg; // @[WB.scala 68:15]
  assign io_regWrite = io_in_regWrite; // @[WB.scala 69:15]
  assign io_wbH2Id_regWrite = io_in_regWrite; // @[WB.scala 64:22]
  assign io_wbH2Id_writeReg = io_in_writeReg; // @[WB.scala 65:22]
  assign io_wbH2Id_wbData = io_in_memtoReg ? io_in_memData : io_in_aluData; // @[WB.scala 56:28]
endmodule
module ysyx_210669_IFID(
  input         clock,
  input         io_en,
  input         io_reset,
  input  [31:0] io_in_inst,
  input  [63:0] io_in_pc,
  input  [3:0]  io_in_instType,
  input         io_in_branch,
  input         io_in_regWrite,
  input         io_in_aluSrc,
  input  [4:0]  io_in_aluOp,
  input         io_in_memWrite,
  input         io_in_memRead,
  input         io_in_sExtend,
  input  [2:0]  io_in_lsByte,
  input         io_in_memtoReg,
  input  [1:0]  io_in_shiftByte,
  input  [2:0]  io_in_resultSrc,
  input         io_in_addSrc,
  input  [3:0]  io_in_csrOp,
  output [31:0] io_out_inst,
  output [63:0] io_out_pc,
  output [3:0]  io_out_instType,
  output        io_out_branch,
  output        io_out_aluSrc,
  output [4:0]  io_out_aluOp,
  output        io_out_memWrite,
  output        io_out_memRead,
  output        io_out_sExtend,
  output [2:0]  io_out_lsByte,
  output        io_out_memtoReg,
  output [1:0]  io_out_shiftByte,
  output [2:0]  io_out_resultSrc,
  output        io_out_addSrc,
  output [3:0]  io_out_csrOp,
  output        io_out_regWrite
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
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
`endif // RANDOMIZE_REG_INIT
  reg [31:0] io_out_inst_r; // @[Reg.scala 27:20]
  reg [63:0] io_out_pc_r; // @[Reg.scala 27:20]
  reg [3:0] io_out_instType_r; // @[Reg.scala 27:20]
  reg  io_out_branch_r; // @[Reg.scala 27:20]
  reg  io_out_regWrite_r; // @[Reg.scala 27:20]
  reg  io_out_aluSrc_r; // @[Reg.scala 27:20]
  reg [4:0] io_out_aluOp_r; // @[Reg.scala 27:20]
  reg  io_out_memWrite_r; // @[Reg.scala 27:20]
  reg  io_out_memRead_r; // @[Reg.scala 27:20]
  reg  io_out_sExtend_r; // @[Reg.scala 27:20]
  reg [2:0] io_out_lsByte_r; // @[Reg.scala 27:20]
  reg  io_out_memtoReg_r; // @[Reg.scala 27:20]
  reg [1:0] io_out_shiftByte_r; // @[Reg.scala 27:20]
  reg [2:0] io_out_resultSrc_r; // @[Reg.scala 27:20]
  reg  io_out_addSrc_r; // @[Reg.scala 27:20]
  reg [3:0] io_out_csrOp_r; // @[Reg.scala 27:20]
  assign io_out_inst = io_out_inst_r; // @[PiplineRegs.scala 17:17]
  assign io_out_pc = io_out_pc_r; // @[PiplineRegs.scala 18:15]
  assign io_out_instType = io_out_instType_r; // @[PiplineRegs.scala 20:21]
  assign io_out_branch = io_out_branch_r; // @[PiplineRegs.scala 21:19]
  assign io_out_aluSrc = io_out_aluSrc_r; // @[PiplineRegs.scala 23:19]
  assign io_out_aluOp = io_out_aluOp_r; // @[PiplineRegs.scala 24:18]
  assign io_out_memWrite = io_out_memWrite_r; // @[PiplineRegs.scala 25:21]
  assign io_out_memRead = io_out_memRead_r; // @[PiplineRegs.scala 26:20]
  assign io_out_sExtend = io_out_sExtend_r; // @[PiplineRegs.scala 27:20]
  assign io_out_lsByte = io_out_lsByte_r; // @[PiplineRegs.scala 28:19]
  assign io_out_memtoReg = io_out_memtoReg_r; // @[PiplineRegs.scala 29:21]
  assign io_out_shiftByte = io_out_shiftByte_r; // @[PiplineRegs.scala 30:22]
  assign io_out_resultSrc = io_out_resultSrc_r; // @[PiplineRegs.scala 31:22]
  assign io_out_addSrc = io_out_addSrc_r; // @[PiplineRegs.scala 32:19]
  assign io_out_csrOp = io_out_csrOp_r; // @[PiplineRegs.scala 33:18]
  assign io_out_regWrite = io_out_regWrite_r; // @[PiplineRegs.scala 22:21]
  always @(posedge clock) begin
    if (io_reset) begin // @[Reg.scala 27:20]
      io_out_inst_r <= 32'h13; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      io_out_inst_r <= io_in_inst; // @[Reg.scala 28:23]
    end
    if (io_reset) begin // @[Reg.scala 27:20]
      io_out_pc_r <= 64'h30000000; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      io_out_pc_r <= io_in_pc; // @[Reg.scala 28:23]
    end
    if (io_reset) begin // @[Reg.scala 27:20]
      io_out_instType_r <= 4'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      io_out_instType_r <= io_in_instType; // @[Reg.scala 28:23]
    end
    if (io_reset) begin // @[Reg.scala 27:20]
      io_out_branch_r <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      io_out_branch_r <= io_in_branch; // @[Reg.scala 28:23]
    end
    if (io_reset) begin // @[Reg.scala 27:20]
      io_out_regWrite_r <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      io_out_regWrite_r <= io_in_regWrite; // @[Reg.scala 28:23]
    end
    if (io_reset) begin // @[Reg.scala 27:20]
      io_out_aluSrc_r <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      io_out_aluSrc_r <= io_in_aluSrc; // @[Reg.scala 28:23]
    end
    if (io_reset) begin // @[Reg.scala 27:20]
      io_out_aluOp_r <= 5'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      io_out_aluOp_r <= io_in_aluOp; // @[Reg.scala 28:23]
    end
    if (io_reset) begin // @[Reg.scala 27:20]
      io_out_memWrite_r <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      io_out_memWrite_r <= io_in_memWrite; // @[Reg.scala 28:23]
    end
    if (io_reset) begin // @[Reg.scala 27:20]
      io_out_memRead_r <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      io_out_memRead_r <= io_in_memRead; // @[Reg.scala 28:23]
    end
    if (io_reset) begin // @[Reg.scala 27:20]
      io_out_sExtend_r <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      io_out_sExtend_r <= io_in_sExtend; // @[Reg.scala 28:23]
    end
    if (io_reset) begin // @[Reg.scala 27:20]
      io_out_lsByte_r <= 3'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      io_out_lsByte_r <= io_in_lsByte; // @[Reg.scala 28:23]
    end
    if (io_reset) begin // @[Reg.scala 27:20]
      io_out_memtoReg_r <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      io_out_memtoReg_r <= io_in_memtoReg; // @[Reg.scala 28:23]
    end
    if (io_reset) begin // @[Reg.scala 27:20]
      io_out_shiftByte_r <= 2'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      io_out_shiftByte_r <= io_in_shiftByte; // @[Reg.scala 28:23]
    end
    if (io_reset) begin // @[Reg.scala 27:20]
      io_out_resultSrc_r <= 3'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      io_out_resultSrc_r <= io_in_resultSrc; // @[Reg.scala 28:23]
    end
    if (io_reset) begin // @[Reg.scala 27:20]
      io_out_addSrc_r <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      io_out_addSrc_r <= io_in_addSrc; // @[Reg.scala 28:23]
    end
    if (io_reset) begin // @[Reg.scala 27:20]
      io_out_csrOp_r <= 4'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      io_out_csrOp_r <= io_in_csrOp; // @[Reg.scala 28:23]
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
  io_out_inst_r = _RAND_0[31:0];
  _RAND_1 = {2{`RANDOM}};
  io_out_pc_r = _RAND_1[63:0];
  _RAND_2 = {1{`RANDOM}};
  io_out_instType_r = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  io_out_branch_r = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  io_out_regWrite_r = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  io_out_aluSrc_r = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  io_out_aluOp_r = _RAND_6[4:0];
  _RAND_7 = {1{`RANDOM}};
  io_out_memWrite_r = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  io_out_memRead_r = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  io_out_sExtend_r = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  io_out_lsByte_r = _RAND_10[2:0];
  _RAND_11 = {1{`RANDOM}};
  io_out_memtoReg_r = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  io_out_shiftByte_r = _RAND_12[1:0];
  _RAND_13 = {1{`RANDOM}};
  io_out_resultSrc_r = _RAND_13[2:0];
  _RAND_14 = {1{`RANDOM}};
  io_out_addSrc_r = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  io_out_csrOp_r = _RAND_15[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210669_IDEX(
  input         clock,
  input         io_en,
  input         io_reset,
  input  [63:0] io_in_pc,
  input  [63:0] io_in_readData1,
  input  [63:0] io_in_readData2,
  input  [11:0] io_in_csrAddr,
  input  [63:0] io_in_imm,
  input  [63:0] io_in_writeReg,
  input         io_in_branch,
  input         io_in_aluSrc,
  input  [4:0]  io_in_aluOp,
  input         io_in_memWrite,
  input         io_in_memRead,
  input         io_in_sExtend,
  input  [2:0]  io_in_lsByte,
  input         io_in_memtoReg,
  input  [1:0]  io_in_shiftByte,
  input  [2:0]  io_in_resultSrc,
  input         io_in_addSrc,
  input  [3:0]  io_in_csrOp,
  input         io_in_regWrite,
  output [63:0] io_out_pc,
  output [63:0] io_out_readData1,
  output [63:0] io_out_readData2,
  output [11:0] io_out_csrAddr,
  output [63:0] io_out_imm,
  output [63:0] io_out_writeReg,
  output        io_out_addSrc,
  output        io_out_aluSrc,
  output [1:0]  io_out_shiftByte,
  output [4:0]  io_out_aluOp,
  output        io_out_branch,
  output [2:0]  io_out_resultSrc,
  output [3:0]  io_out_csrOp,
  output        io_out_memWrite,
  output        io_out_memRead,
  output        io_out_sExtend,
  output [2:0]  io_out_lsByte,
  output        io_out_memtoReg,
  output        io_out_regWrite
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [63:0] _RAND_5;
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
`endif // RANDOMIZE_REG_INIT
  reg [63:0] io_out_pc_r; // @[Reg.scala 27:20]
  reg [63:0] io_out_readData1_r; // @[Reg.scala 27:20]
  reg [63:0] io_out_readData2_r; // @[Reg.scala 27:20]
  reg [11:0] io_out_csrAddr_r; // @[Reg.scala 27:20]
  reg [63:0] io_out_imm_r; // @[Reg.scala 27:20]
  reg [63:0] io_out_writeReg_r; // @[Reg.scala 27:20]
  reg  io_out_branch_r; // @[Reg.scala 27:20]
  reg  io_out_regWrite_r; // @[Reg.scala 27:20]
  reg  io_out_aluSrc_r; // @[Reg.scala 27:20]
  reg [4:0] io_out_aluOp_r; // @[Reg.scala 27:20]
  reg  io_out_memWrite_r; // @[Reg.scala 27:20]
  reg  io_out_memRead_r; // @[Reg.scala 27:20]
  reg  io_out_sExtend_r; // @[Reg.scala 27:20]
  reg [2:0] io_out_lsByte_r; // @[Reg.scala 27:20]
  reg  io_out_memtoReg_r; // @[Reg.scala 27:20]
  reg [1:0] io_out_shiftByte_r; // @[Reg.scala 27:20]
  reg [2:0] io_out_resultSrc_r; // @[Reg.scala 27:20]
  reg  io_out_addSrc_r; // @[Reg.scala 27:20]
  reg [3:0] io_out_csrOp_r; // @[Reg.scala 27:20]
  assign io_out_pc = io_out_pc_r; // @[PiplineRegs.scala 57:15]
  assign io_out_readData1 = io_out_readData1_r; // @[PiplineRegs.scala 58:22]
  assign io_out_readData2 = io_out_readData2_r; // @[PiplineRegs.scala 59:22]
  assign io_out_csrAddr = io_out_csrAddr_r; // @[PiplineRegs.scala 60:20]
  assign io_out_imm = io_out_imm_r; // @[PiplineRegs.scala 61:16]
  assign io_out_writeReg = io_out_writeReg_r; // @[PiplineRegs.scala 62:21]
  assign io_out_addSrc = io_out_addSrc_r; // @[PiplineRegs.scala 75:19]
  assign io_out_aluSrc = io_out_aluSrc_r; // @[PiplineRegs.scala 66:19]
  assign io_out_shiftByte = io_out_shiftByte_r; // @[PiplineRegs.scala 73:22]
  assign io_out_aluOp = io_out_aluOp_r; // @[PiplineRegs.scala 67:18]
  assign io_out_branch = io_out_branch_r; // @[PiplineRegs.scala 64:19]
  assign io_out_resultSrc = io_out_resultSrc_r; // @[PiplineRegs.scala 74:22]
  assign io_out_csrOp = io_out_csrOp_r; // @[PiplineRegs.scala 76:18]
  assign io_out_memWrite = io_out_memWrite_r; // @[PiplineRegs.scala 68:21]
  assign io_out_memRead = io_out_memRead_r; // @[PiplineRegs.scala 69:20]
  assign io_out_sExtend = io_out_sExtend_r; // @[PiplineRegs.scala 70:20]
  assign io_out_lsByte = io_out_lsByte_r; // @[PiplineRegs.scala 71:19]
  assign io_out_memtoReg = io_out_memtoReg_r; // @[PiplineRegs.scala 72:21]
  assign io_out_regWrite = io_out_regWrite_r; // @[PiplineRegs.scala 65:21]
  always @(posedge clock) begin
    if (io_reset) begin // @[Reg.scala 27:20]
      io_out_pc_r <= 64'h30000000; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      io_out_pc_r <= io_in_pc; // @[Reg.scala 28:23]
    end
    if (io_reset) begin // @[Reg.scala 27:20]
      io_out_readData1_r <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      io_out_readData1_r <= io_in_readData1; // @[Reg.scala 28:23]
    end
    if (io_reset) begin // @[Reg.scala 27:20]
      io_out_readData2_r <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      io_out_readData2_r <= io_in_readData2; // @[Reg.scala 28:23]
    end
    if (io_reset) begin // @[Reg.scala 27:20]
      io_out_csrAddr_r <= 12'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      io_out_csrAddr_r <= io_in_csrAddr; // @[Reg.scala 28:23]
    end
    if (io_reset) begin // @[Reg.scala 27:20]
      io_out_imm_r <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      io_out_imm_r <= io_in_imm; // @[Reg.scala 28:23]
    end
    if (io_reset) begin // @[Reg.scala 27:20]
      io_out_writeReg_r <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      io_out_writeReg_r <= io_in_writeReg; // @[Reg.scala 28:23]
    end
    if (io_reset) begin // @[Reg.scala 27:20]
      io_out_branch_r <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      io_out_branch_r <= io_in_branch; // @[Reg.scala 28:23]
    end
    if (io_reset) begin // @[Reg.scala 27:20]
      io_out_regWrite_r <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      io_out_regWrite_r <= io_in_regWrite; // @[Reg.scala 28:23]
    end
    if (io_reset) begin // @[Reg.scala 27:20]
      io_out_aluSrc_r <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      io_out_aluSrc_r <= io_in_aluSrc; // @[Reg.scala 28:23]
    end
    if (io_reset) begin // @[Reg.scala 27:20]
      io_out_aluOp_r <= 5'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      io_out_aluOp_r <= io_in_aluOp; // @[Reg.scala 28:23]
    end
    if (io_reset) begin // @[Reg.scala 27:20]
      io_out_memWrite_r <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      io_out_memWrite_r <= io_in_memWrite; // @[Reg.scala 28:23]
    end
    if (io_reset) begin // @[Reg.scala 27:20]
      io_out_memRead_r <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      io_out_memRead_r <= io_in_memRead; // @[Reg.scala 28:23]
    end
    if (io_reset) begin // @[Reg.scala 27:20]
      io_out_sExtend_r <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      io_out_sExtend_r <= io_in_sExtend; // @[Reg.scala 28:23]
    end
    if (io_reset) begin // @[Reg.scala 27:20]
      io_out_lsByte_r <= 3'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      io_out_lsByte_r <= io_in_lsByte; // @[Reg.scala 28:23]
    end
    if (io_reset) begin // @[Reg.scala 27:20]
      io_out_memtoReg_r <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      io_out_memtoReg_r <= io_in_memtoReg; // @[Reg.scala 28:23]
    end
    if (io_reset) begin // @[Reg.scala 27:20]
      io_out_shiftByte_r <= 2'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      io_out_shiftByte_r <= io_in_shiftByte; // @[Reg.scala 28:23]
    end
    if (io_reset) begin // @[Reg.scala 27:20]
      io_out_resultSrc_r <= 3'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      io_out_resultSrc_r <= io_in_resultSrc; // @[Reg.scala 28:23]
    end
    if (io_reset) begin // @[Reg.scala 27:20]
      io_out_addSrc_r <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      io_out_addSrc_r <= io_in_addSrc; // @[Reg.scala 28:23]
    end
    if (io_reset) begin // @[Reg.scala 27:20]
      io_out_csrOp_r <= 4'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      io_out_csrOp_r <= io_in_csrOp; // @[Reg.scala 28:23]
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
  io_out_pc_r = _RAND_0[63:0];
  _RAND_1 = {2{`RANDOM}};
  io_out_readData1_r = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  io_out_readData2_r = _RAND_2[63:0];
  _RAND_3 = {1{`RANDOM}};
  io_out_csrAddr_r = _RAND_3[11:0];
  _RAND_4 = {2{`RANDOM}};
  io_out_imm_r = _RAND_4[63:0];
  _RAND_5 = {2{`RANDOM}};
  io_out_writeReg_r = _RAND_5[63:0];
  _RAND_6 = {1{`RANDOM}};
  io_out_branch_r = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  io_out_regWrite_r = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  io_out_aluSrc_r = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  io_out_aluOp_r = _RAND_9[4:0];
  _RAND_10 = {1{`RANDOM}};
  io_out_memWrite_r = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  io_out_memRead_r = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  io_out_sExtend_r = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  io_out_lsByte_r = _RAND_13[2:0];
  _RAND_14 = {1{`RANDOM}};
  io_out_memtoReg_r = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  io_out_shiftByte_r = _RAND_15[1:0];
  _RAND_16 = {1{`RANDOM}};
  io_out_resultSrc_r = _RAND_16[2:0];
  _RAND_17 = {1{`RANDOM}};
  io_out_addSrc_r = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  io_out_csrOp_r = _RAND_18[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210669_EXMEM(
  input         clock,
  input         io_en,
  input         io_reset,
  input  [63:0] io_in_result,
  input  [63:0] io_in_dataOutput,
  input  [63:0] io_in_writeReg,
  input         io_in_memWrite,
  input         io_in_memRead,
  input         io_in_sExtend,
  input  [2:0]  io_in_lsByte,
  input         io_in_memtoReg,
  input         io_in_regWrite,
  output [63:0] io_out_address,
  output [63:0] io_out_writeData,
  output [63:0] io_out_writeReg,
  output        io_out_memWrite,
  output        io_out_memRead,
  output        io_out_sExtend,
  output [2:0]  io_out_lsByte,
  output        io_out_memtoReg,
  output        io_out_regWrite
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] io_out_address_r; // @[Reg.scala 27:20]
  reg [63:0] io_out_writeData_r; // @[Reg.scala 27:20]
  reg [63:0] io_out_writeReg_r; // @[Reg.scala 27:20]
  reg  io_out_regWrite_r; // @[Reg.scala 27:20]
  reg  io_out_memWrite_r; // @[Reg.scala 27:20]
  reg  io_out_memRead_r; // @[Reg.scala 27:20]
  reg  io_out_sExtend_r; // @[Reg.scala 27:20]
  reg [2:0] io_out_lsByte_r; // @[Reg.scala 27:20]
  reg  io_out_memtoReg_r; // @[Reg.scala 27:20]
  assign io_out_address = io_out_address_r; // @[PiplineRegs.scala 103:20]
  assign io_out_writeData = io_out_writeData_r; // @[PiplineRegs.scala 104:22]
  assign io_out_writeReg = io_out_writeReg_r; // @[PiplineRegs.scala 105:21]
  assign io_out_memWrite = io_out_memWrite_r; // @[PiplineRegs.scala 108:21]
  assign io_out_memRead = io_out_memRead_r; // @[PiplineRegs.scala 109:20]
  assign io_out_sExtend = io_out_sExtend_r; // @[PiplineRegs.scala 110:20]
  assign io_out_lsByte = io_out_lsByte_r; // @[PiplineRegs.scala 111:19]
  assign io_out_memtoReg = io_out_memtoReg_r; // @[PiplineRegs.scala 112:21]
  assign io_out_regWrite = io_out_regWrite_r; // @[PiplineRegs.scala 107:21]
  always @(posedge clock) begin
    if (io_reset) begin // @[Reg.scala 27:20]
      io_out_address_r <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      io_out_address_r <= io_in_result; // @[Reg.scala 28:23]
    end
    if (io_reset) begin // @[Reg.scala 27:20]
      io_out_writeData_r <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      io_out_writeData_r <= io_in_dataOutput; // @[Reg.scala 28:23]
    end
    if (io_reset) begin // @[Reg.scala 27:20]
      io_out_writeReg_r <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      io_out_writeReg_r <= io_in_writeReg; // @[Reg.scala 28:23]
    end
    if (io_reset) begin // @[Reg.scala 27:20]
      io_out_regWrite_r <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      io_out_regWrite_r <= io_in_regWrite; // @[Reg.scala 28:23]
    end
    if (io_reset) begin // @[Reg.scala 27:20]
      io_out_memWrite_r <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      io_out_memWrite_r <= io_in_memWrite; // @[Reg.scala 28:23]
    end
    if (io_reset) begin // @[Reg.scala 27:20]
      io_out_memRead_r <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      io_out_memRead_r <= io_in_memRead; // @[Reg.scala 28:23]
    end
    if (io_reset) begin // @[Reg.scala 27:20]
      io_out_sExtend_r <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      io_out_sExtend_r <= io_in_sExtend; // @[Reg.scala 28:23]
    end
    if (io_reset) begin // @[Reg.scala 27:20]
      io_out_lsByte_r <= 3'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      io_out_lsByte_r <= io_in_lsByte; // @[Reg.scala 28:23]
    end
    if (io_reset) begin // @[Reg.scala 27:20]
      io_out_memtoReg_r <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      io_out_memtoReg_r <= io_in_memtoReg; // @[Reg.scala 28:23]
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
  io_out_address_r = _RAND_0[63:0];
  _RAND_1 = {2{`RANDOM}};
  io_out_writeData_r = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  io_out_writeReg_r = _RAND_2[63:0];
  _RAND_3 = {1{`RANDOM}};
  io_out_regWrite_r = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  io_out_memWrite_r = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  io_out_memRead_r = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  io_out_sExtend_r = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  io_out_lsByte_r = _RAND_7[2:0];
  _RAND_8 = {1{`RANDOM}};
  io_out_memtoReg_r = _RAND_8[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210669_MEMWB(
  input         clock,
  input         io_en,
  input         io_reset,
  input  [63:0] io_in_readData,
  input  [63:0] io_in_extendResult,
  input  [63:0] io_in_writeReg,
  input         io_in_memtoReg,
  input         io_in_regWrite,
  output [63:0] io_out_memData,
  output [63:0] io_out_aluData,
  output        io_out_memtoReg,
  output [63:0] io_out_writeReg,
  output        io_out_regWrite
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] io_out_memData_r; // @[Reg.scala 27:20]
  reg [63:0] io_out_aluData_r; // @[Reg.scala 27:20]
  reg [63:0] io_out_writeReg_r; // @[Reg.scala 27:20]
  reg  io_out_regWrite_r; // @[Reg.scala 27:20]
  reg  io_out_memtoReg_r; // @[Reg.scala 27:20]
  assign io_out_memData = io_out_memData_r; // @[PiplineRegs.scala 151:20]
  assign io_out_aluData = io_out_aluData_r; // @[PiplineRegs.scala 152:20]
  assign io_out_memtoReg = io_out_memtoReg_r; // @[PiplineRegs.scala 156:21]
  assign io_out_writeReg = io_out_writeReg_r; // @[PiplineRegs.scala 153:21]
  assign io_out_regWrite = io_out_regWrite_r; // @[PiplineRegs.scala 155:21]
  always @(posedge clock) begin
    if (io_reset) begin // @[Reg.scala 27:20]
      io_out_memData_r <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      io_out_memData_r <= io_in_readData; // @[Reg.scala 28:23]
    end
    if (io_reset) begin // @[Reg.scala 27:20]
      io_out_aluData_r <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      io_out_aluData_r <= io_in_extendResult; // @[Reg.scala 28:23]
    end
    if (io_reset) begin // @[Reg.scala 27:20]
      io_out_writeReg_r <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      io_out_writeReg_r <= io_in_writeReg; // @[Reg.scala 28:23]
    end
    if (io_reset) begin // @[Reg.scala 27:20]
      io_out_regWrite_r <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      io_out_regWrite_r <= io_in_regWrite; // @[Reg.scala 28:23]
    end
    if (io_reset) begin // @[Reg.scala 27:20]
      io_out_memtoReg_r <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_en) begin // @[Reg.scala 28:19]
      io_out_memtoReg_r <= io_in_memtoReg; // @[Reg.scala 28:23]
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
  io_out_memData_r = _RAND_0[63:0];
  _RAND_1 = {2{`RANDOM}};
  io_out_aluData_r = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  io_out_writeReg_r = _RAND_2[63:0];
  _RAND_3 = {1{`RANDOM}};
  io_out_regWrite_r = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  io_out_memtoReg_r = _RAND_4[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210669_Arbiter(
  output        io_in_0_ready,
  input         io_in_0_valid,
  input  [31:0] io_in_0_bits_addr,
  output        io_in_1_ready,
  input         io_in_1_valid,
  input  [31:0] io_in_1_bits_addr,
  input  [2:0]  io_in_1_bits_size,
  input         io_out_ready,
  output        io_out_valid,
  output [31:0] io_out_bits_addr,
  output [2:0]  io_out_bits_size,
  output        io_chosen
);
  wire  grant_1 = ~io_in_0_valid; // @[Arbiter.scala 31:78]
  assign io_in_0_ready = io_out_ready; // @[Arbiter.scala 134:19]
  assign io_in_1_ready = grant_1 & io_out_ready; // @[Arbiter.scala 134:19]
  assign io_out_valid = ~grant_1 | io_in_1_valid; // @[Arbiter.scala 135:31]
  assign io_out_bits_addr = io_in_0_valid ? io_in_0_bits_addr : io_in_1_bits_addr; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_size = io_in_0_valid ? 3'h2 : io_in_1_bits_size; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_chosen = io_in_0_valid ? 1'h0 : 1'h1; // @[Arbiter.scala 126:27 Arbiter.scala 127:17 Arbiter.scala 123:13]
endmodule
module ysyx_210669_CrossBar(
  input         clock,
  input         reset,
  output        io_in_0_ar_ready,
  input         io_in_0_ar_valid,
  input  [31:0] io_in_0_ar_bits_addr,
  input         io_in_0_r_ready,
  output        io_in_0_r_valid,
  output [63:0] io_in_0_r_bits_data,
  output [3:0]  io_in_0_r_bits_id,
  output        io_in_0_r_bits_last,
  output        io_in_1_aw_ready,
  input         io_in_1_aw_valid,
  input  [31:0] io_in_1_aw_bits_addr,
  input  [2:0]  io_in_1_aw_bits_size,
  output        io_in_1_w_ready,
  input         io_in_1_w_valid,
  input  [63:0] io_in_1_w_bits_data,
  input  [7:0]  io_in_1_w_bits_strb,
  input         io_in_1_b_ready,
  output        io_in_1_b_valid,
  output [3:0]  io_in_1_b_bits_id,
  output [1:0]  io_in_1_b_bits_resp,
  output        io_in_1_ar_ready,
  input         io_in_1_ar_valid,
  input  [31:0] io_in_1_ar_bits_addr,
  input  [2:0]  io_in_1_ar_bits_size,
  input         io_in_1_r_ready,
  output        io_in_1_r_valid,
  output [63:0] io_in_1_r_bits_data,
  output [3:0]  io_in_1_r_bits_id,
  output        io_in_1_r_bits_last,
  input         io_out_aw_ready,
  output        io_out_aw_valid,
  output [31:0] io_out_aw_bits_addr,
  output [2:0]  io_out_aw_bits_size,
  input         io_out_w_ready,
  output        io_out_w_valid,
  output [63:0] io_out_w_bits_data,
  output [7:0]  io_out_w_bits_strb,
  output        io_out_b_ready,
  input         io_out_b_valid,
  input  [3:0]  io_out_b_bits_id,
  input  [1:0]  io_out_b_bits_resp,
  input         io_out_ar_ready,
  output        io_out_ar_valid,
  output [31:0] io_out_ar_bits_addr,
  output [3:0]  io_out_ar_bits_id,
  output [2:0]  io_out_ar_bits_size,
  output        io_out_r_ready,
  input         io_out_r_valid,
  input  [63:0] io_out_r_bits_data,
  input  [3:0]  io_out_r_bits_id,
  input         io_out_r_bits_last
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  readArb_io_in_0_ready; // @[CrossBar.scala 17:39]
  wire  readArb_io_in_0_valid; // @[CrossBar.scala 17:39]
  wire [31:0] readArb_io_in_0_bits_addr; // @[CrossBar.scala 17:39]
  wire  readArb_io_in_1_ready; // @[CrossBar.scala 17:39]
  wire  readArb_io_in_1_valid; // @[CrossBar.scala 17:39]
  wire [31:0] readArb_io_in_1_bits_addr; // @[CrossBar.scala 17:39]
  wire [2:0] readArb_io_in_1_bits_size; // @[CrossBar.scala 17:39]
  wire  readArb_io_out_ready; // @[CrossBar.scala 17:39]
  wire  readArb_io_out_valid; // @[CrossBar.scala 17:39]
  wire [31:0] readArb_io_out_bits_addr; // @[CrossBar.scala 17:39]
  wire [2:0] readArb_io_out_bits_size; // @[CrossBar.scala 17:39]
  wire  readArb_io_chosen; // @[CrossBar.scala 17:39]
  reg  rState; // @[CrossBar.scala 14:29]
  wire  _io_out_ar_valid_T = ~rState; // @[CrossBar.scala 33:51]
  wire  _T = 4'h1 == io_out_r_bits_id; // @[Conditional.scala 37:30]
  wire  _T_1 = 4'h2 == io_out_r_bits_id; // @[Conditional.scala 37:30]
  wire  _GEN_2 = _T_1 & io_out_r_valid; // @[Conditional.scala 39:67 CrossBar.scala 72:26 CrossBar.scala 55:20]
  wire  _GEN_3 = _T_1 & io_in_1_r_ready; // @[Conditional.scala 39:67 CrossBar.scala 73:24 CrossBar.scala 62:18]
  wire  _GEN_4 = _T & io_out_r_valid; // @[Conditional.scala 40:58 CrossBar.scala 68:26 CrossBar.scala 54:20]
  wire  _GEN_5 = _T ? io_in_0_r_ready : _GEN_3; // @[Conditional.scala 40:58 CrossBar.scala 69:24]
  wire  _GEN_6 = _T ? 1'h0 : _GEN_2; // @[Conditional.scala 40:58 CrossBar.scala 55:20]
  wire  _T_3 = readArb_io_out_ready & readArb_io_out_valid; // @[Decoupled.scala 40:37]
  wire  _GEN_10 = _T_3 | rState; // @[CrossBar.scala 94:41 CrossBar.scala 94:50 CrossBar.scala 14:29]
  wire  _T_5 = io_out_r_ready & io_out_r_valid; // @[Decoupled.scala 40:37]
  ysyx_210669_Arbiter readArb ( // @[CrossBar.scala 17:39]
    .io_in_0_ready(readArb_io_in_0_ready),
    .io_in_0_valid(readArb_io_in_0_valid),
    .io_in_0_bits_addr(readArb_io_in_0_bits_addr),
    .io_in_1_ready(readArb_io_in_1_ready),
    .io_in_1_valid(readArb_io_in_1_valid),
    .io_in_1_bits_addr(readArb_io_in_1_bits_addr),
    .io_in_1_bits_size(readArb_io_in_1_bits_size),
    .io_out_ready(readArb_io_out_ready),
    .io_out_valid(readArb_io_out_valid),
    .io_out_bits_addr(readArb_io_out_bits_addr),
    .io_out_bits_size(readArb_io_out_bits_size),
    .io_chosen(readArb_io_chosen)
  );
  assign io_in_0_ar_ready = readArb_io_in_0_ready; // @[CrossBar.scala 20:20]
  assign io_in_0_r_valid = io_out_r_valid & _GEN_4; // @[CrossBar.scala 65:24 CrossBar.scala 54:20]
  assign io_in_0_r_bits_data = io_out_r_bits_data; // @[CrossBar.scala 56:19]
  assign io_in_0_r_bits_id = io_out_r_bits_id; // @[CrossBar.scala 56:19]
  assign io_in_0_r_bits_last = io_out_r_bits_last; // @[CrossBar.scala 56:19]
  assign io_in_1_aw_ready = io_out_aw_ready; // @[CrossBar.scala 36:13]
  assign io_in_1_w_ready = io_out_w_ready; // @[CrossBar.scala 42:12]
  assign io_in_1_b_valid = io_out_b_valid; // @[CrossBar.scala 48:12]
  assign io_in_1_b_bits_id = io_out_b_bits_id; // @[CrossBar.scala 48:12]
  assign io_in_1_b_bits_resp = io_out_b_bits_resp; // @[CrossBar.scala 48:12]
  assign io_in_1_ar_ready = readArb_io_in_1_ready; // @[CrossBar.scala 21:20]
  assign io_in_1_r_valid = io_out_r_valid & _GEN_6; // @[CrossBar.scala 65:24 CrossBar.scala 55:20]
  assign io_in_1_r_bits_data = io_out_r_bits_data; // @[CrossBar.scala 57:19]
  assign io_in_1_r_bits_id = io_out_r_bits_id; // @[CrossBar.scala 57:19]
  assign io_in_1_r_bits_last = io_out_r_bits_last; // @[CrossBar.scala 57:19]
  assign io_out_aw_valid = io_in_1_aw_valid; // @[CrossBar.scala 36:13]
  assign io_out_aw_bits_addr = io_in_1_aw_bits_addr; // @[CrossBar.scala 36:13]
  assign io_out_aw_bits_size = io_in_1_aw_bits_size; // @[CrossBar.scala 36:13]
  assign io_out_w_valid = io_in_1_w_valid; // @[CrossBar.scala 42:12]
  assign io_out_w_bits_data = io_in_1_w_bits_data; // @[CrossBar.scala 42:12]
  assign io_out_w_bits_strb = io_in_1_w_bits_strb; // @[CrossBar.scala 42:12]
  assign io_out_b_ready = io_in_1_b_ready; // @[CrossBar.scala 48:12]
  assign io_out_ar_valid = readArb_io_out_valid & ~rState; // @[CrossBar.scala 33:40]
  assign io_out_ar_bits_addr = readArb_io_out_bits_addr; // @[CrossBar.scala 31:19]
  assign io_out_ar_bits_id = readArb_io_chosen ? 4'h2 : 4'h1; // @[CrossBar.scala 32:21 CrossBar.scala 32:21]
  assign io_out_ar_bits_size = readArb_io_out_bits_size; // @[CrossBar.scala 31:19]
  assign io_out_r_ready = io_out_r_valid & _GEN_5; // @[CrossBar.scala 65:24 CrossBar.scala 62:18]
  assign readArb_io_in_0_valid = io_in_0_ar_valid; // @[CrossBar.scala 20:20]
  assign readArb_io_in_0_bits_addr = io_in_0_ar_bits_addr; // @[CrossBar.scala 20:20]
  assign readArb_io_in_1_valid = io_in_1_ar_valid; // @[CrossBar.scala 21:20]
  assign readArb_io_in_1_bits_addr = io_in_1_ar_bits_addr; // @[CrossBar.scala 21:20]
  assign readArb_io_in_1_bits_size = io_in_1_ar_bits_size; // @[CrossBar.scala 21:20]
  assign readArb_io_out_ready = io_out_ar_ready & _io_out_ar_valid_T; // @[CrossBar.scala 34:40]
  always @(posedge clock) begin
    if (reset) begin // @[CrossBar.scala 14:29]
      rState <= 1'h0; // @[CrossBar.scala 14:29]
    end else if (_io_out_ar_valid_T) begin // @[Conditional.scala 40:58]
      rState <= _GEN_10;
    end else if (rState) begin // @[Conditional.scala 39:67]
      if (_T_5 & io_out_r_bits_last) begin // @[CrossBar.scala 95:60]
        rState <= 1'h0; // @[CrossBar.scala 95:69]
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
  rState = _RAND_0[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210669_AXIrw(
  input         clock,
  input         reset,
  input         io_in_valid,
  output        io_in_ready,
  input  [31:0] io_in_addr,
  output [63:0] io_in_rdata,
  input         io_out_ar_ready,
  output        io_out_ar_valid,
  output [31:0] io_out_ar_bits_addr,
  output        io_out_r_ready,
  input         io_out_r_valid,
  input  [63:0] io_out_r_bits_data,
  input  [3:0]  io_out_r_bits_id,
  input         io_out_r_bits_last
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] oldData; // @[AXIrw.scala 29:30]
  wire  axiArHandShake = io_out_ar_ready & io_out_ar_valid; // @[Decoupled.scala 40:37]
  wire  axiRHandShake = io_out_r_ready & io_out_r_valid; // @[Decoupled.scala 40:37]
  reg [1:0] rState; // @[AXIrw.scala 88:29]
  wire  _T_2 = 2'h0 == rState; // @[Conditional.scala 37:30]
  wire  _T_3 = 2'h1 == rState; // @[Conditional.scala 37:30]
  wire  _T_4 = 2'h2 == rState; // @[Conditional.scala 37:30]
  wire [1:0] _GEN_4 = axiRHandShake & io_out_r_bits_last ? 2'h3 : rState; // @[AXIrw.scala 97:57 AXIrw.scala 97:65 AXIrw.scala 88:29]
  wire  _T_6 = 2'h3 == rState; // @[Conditional.scala 37:30]
  wire [1:0] _GEN_5 = _T_6 ? 2'h0 : rState; // @[Conditional.scala 39:67 AXIrw.scala 98:28 AXIrw.scala 88:29]
  wire  _GEN_25 = _T_4 | _T_6; // @[Conditional.scala 39:67 AXIrw.scala 125:19]
  wire  _GEN_26 = _T_4 ? 1'h0 : _T_6; // @[Conditional.scala 39:67 AXIrw.scala 126:17]
  wire  _GEN_28 = _T_3 ? 1'h0 : _GEN_25; // @[Conditional.scala 39:67 AXIrw.scala 120:19]
  wire  _GEN_29 = _T_3 ? 1'h0 : _GEN_26; // @[Conditional.scala 39:67 AXIrw.scala 121:17]
  assign io_in_ready = _T_2 ? 1'h0 : _GEN_29; // @[Conditional.scala 40:58 AXIrw.scala 116:17]
  assign io_in_rdata = io_in_valid & io_out_r_bits_id == 4'h1 ? io_out_r_bits_data : oldData; // @[AXIrw.scala 30:44 AXIrw.scala 31:13 AXIrw.scala 34:13]
  assign io_out_ar_valid = _T_2 ? 1'h0 : _T_3; // @[Conditional.scala 40:58 AXIrw.scala 114:20]
  assign io_out_ar_bits_addr = io_in_addr; // @[AXIrw.scala 181:23]
  assign io_out_r_ready = _T_2 ? 1'h0 : _GEN_28; // @[Conditional.scala 40:58 AXIrw.scala 115:19]
  always @(posedge clock) begin
    if (reset) begin // @[AXIrw.scala 29:30]
      oldData <= io_out_r_bits_data; // @[AXIrw.scala 29:30]
    end else if (io_in_valid & io_out_r_bits_id == 4'h1) begin // @[AXIrw.scala 30:44]
      if (io_in_valid & io_out_r_bits_id == 4'h1) begin // @[AXIrw.scala 30:44]
        oldData <= io_out_r_bits_data; // @[AXIrw.scala 31:13]
      end
    end
    if (reset) begin // @[AXIrw.scala 88:29]
      rState <= 2'h0; // @[AXIrw.scala 88:29]
    end else if (_T_2) begin // @[Conditional.scala 40:58]
      if (io_in_valid) begin // @[AXIrw.scala 95:39]
        rState <= 2'h1; // @[AXIrw.scala 95:47]
      end
    end else if (_T_3) begin // @[Conditional.scala 39:67]
      if (axiArHandShake) begin // @[AXIrw.scala 96:46]
        rState <= 2'h2; // @[AXIrw.scala 96:54]
      end
    end else if (_T_4) begin // @[Conditional.scala 39:67]
      rState <= _GEN_4;
    end else begin
      rState <= _GEN_5;
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
  oldData = _RAND_0[63:0];
  _RAND_1 = {1{`RANDOM}};
  rState = _RAND_1[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210669_AXIrw_1(
  input         clock,
  input         reset,
  input         io_in_valid,
  output        io_in_ready,
  input  [31:0] io_in_addr,
  input         io_in_ren,
  output [63:0] io_in_rdata,
  input  [2:0]  io_in_size,
  input         io_in_wen,
  input  [63:0] io_in_wdata,
  input  [7:0]  io_in_wmask,
  input         io_out_aw_ready,
  output        io_out_aw_valid,
  output [31:0] io_out_aw_bits_addr,
  output [2:0]  io_out_aw_bits_size,
  input         io_out_w_ready,
  output        io_out_w_valid,
  output [63:0] io_out_w_bits_data,
  output [7:0]  io_out_w_bits_strb,
  output        io_out_b_ready,
  input         io_out_b_valid,
  input  [3:0]  io_out_b_bits_id,
  input  [1:0]  io_out_b_bits_resp,
  input         io_out_ar_ready,
  output        io_out_ar_valid,
  output [31:0] io_out_ar_bits_addr,
  output [2:0]  io_out_ar_bits_size,
  output        io_out_r_ready,
  input         io_out_r_valid,
  input  [63:0] io_out_r_bits_data,
  input  [3:0]  io_out_r_bits_id,
  input         io_out_r_bits_last
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] oldData; // @[AXIrw.scala 29:30]
  wire  axiArHandShake = io_out_ar_ready & io_out_ar_valid; // @[Decoupled.scala 40:37]
  wire  axiRHandShake = io_out_r_ready & io_out_r_valid; // @[Decoupled.scala 40:37]
  wire  axiAwHandShake = io_out_aw_ready & io_out_aw_valid; // @[Decoupled.scala 40:37]
  wire  axiWHandShake = io_out_w_ready & io_out_w_valid; // @[Decoupled.scala 40:37]
  wire  axiBHandShake = io_out_b_ready & io_out_b_valid; // @[Decoupled.scala 40:37]
  reg [1:0] rState; // @[AXIrw.scala 88:29]
  reg [2:0] wState; // @[AXIrw.scala 91:29]
  wire  _T_2 = 2'h0 == rState; // @[Conditional.scala 37:30]
  wire  _T_3 = 2'h1 == rState; // @[Conditional.scala 37:30]
  wire [1:0] _GEN_3 = axiArHandShake ? 2'h2 : rState; // @[AXIrw.scala 96:46 AXIrw.scala 96:54 AXIrw.scala 88:29]
  wire  _T_4 = 2'h2 == rState; // @[Conditional.scala 37:30]
  wire [1:0] _GEN_4 = axiRHandShake & io_out_r_bits_last ? 2'h3 : rState; // @[AXIrw.scala 97:57 AXIrw.scala 97:65 AXIrw.scala 88:29]
  wire  _T_6 = 2'h3 == rState; // @[Conditional.scala 37:30]
  wire [1:0] _GEN_5 = _T_6 ? 2'h0 : rState; // @[Conditional.scala 39:67 AXIrw.scala 98:28 AXIrw.scala 88:29]
  wire [1:0] _GEN_6 = _T_4 ? _GEN_4 : _GEN_5; // @[Conditional.scala 39:67]
  wire  _T_7 = 3'h0 == wState; // @[Conditional.scala 37:30]
  wire [2:0] _GEN_9 = io_in_valid ? 3'h1 : wState; // @[AXIrw.scala 102:39 AXIrw.scala 102:47 AXIrw.scala 91:29]
  wire  _T_8 = 3'h1 == wState; // @[Conditional.scala 37:30]
  wire [2:0] _GEN_10 = axiAwHandShake ? 3'h2 : wState; // @[AXIrw.scala 104:47 AXIrw.scala 104:55 AXIrw.scala 91:29]
  wire [2:0] _GEN_11 = axiAwHandShake & axiWHandShake ? 3'h3 : _GEN_10; // @[AXIrw.scala 103:73 AXIrw.scala 103:81]
  wire  _T_11 = 3'h2 == wState; // @[Conditional.scala 37:30]
  wire [2:0] _GEN_12 = axiWHandShake ? 3'h3 : wState; // @[AXIrw.scala 105:58 AXIrw.scala 105:66 AXIrw.scala 91:29]
  wire  _T_13 = 3'h3 == wState; // @[Conditional.scala 37:30]
  wire [2:0] _GEN_13 = axiBHandShake & io_out_b_bits_resp == 2'h0 & io_out_b_bits_id == 4'h2 ? 3'h4 : wState; // @[AXIrw.scala 106:108 AXIrw.scala 106:116 AXIrw.scala 91:29]
  wire  _T_18 = 3'h4 == wState; // @[Conditional.scala 37:30]
  wire [2:0] _GEN_14 = _T_18 ? 3'h0 : wState; // @[Conditional.scala 39:67 AXIrw.scala 107:28 AXIrw.scala 91:29]
  wire [2:0] _GEN_15 = _T_13 ? _GEN_13 : _GEN_14; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_16 = _T_11 ? _GEN_12 : _GEN_15; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_17 = _T_8 ? _GEN_11 : _GEN_16; // @[Conditional.scala 39:67]
  wire  _GEN_25 = _T_4 | _T_6; // @[Conditional.scala 39:67 AXIrw.scala 125:19]
  wire  _GEN_26 = _T_4 ? 1'h0 : _T_6; // @[Conditional.scala 39:67 AXIrw.scala 126:17]
  wire  _GEN_28 = _T_3 ? 1'h0 : _GEN_25; // @[Conditional.scala 39:67 AXIrw.scala 120:19]
  wire  _GEN_29 = _T_3 ? 1'h0 : _GEN_26; // @[Conditional.scala 39:67 AXIrw.scala 121:17]
  wire  _GEN_30 = _T_2 ? 1'h0 : _T_3; // @[Conditional.scala 40:58 AXIrw.scala 114:20]
  wire  _GEN_31 = _T_2 ? 1'h0 : _GEN_28; // @[Conditional.scala 40:58 AXIrw.scala 115:19]
  wire  _GEN_32 = _T_2 ? 1'h0 : _GEN_29; // @[Conditional.scala 40:58 AXIrw.scala 116:17]
  wire  _GEN_36 = _T_13 | _T_18; // @[Conditional.scala 39:67 AXIrw.scala 157:19]
  wire  _GEN_37 = _T_13 ? 1'h0 : _T_18; // @[Conditional.scala 39:67 AXIrw.scala 158:17]
  wire  _GEN_40 = _T_11 ? 1'h0 : _GEN_36; // @[Conditional.scala 39:67 AXIrw.scala 151:19]
  wire  _GEN_41 = _T_11 ? 1'h0 : _GEN_37; // @[Conditional.scala 39:67 AXIrw.scala 152:17]
  wire  _GEN_43 = _T_8 | _T_11; // @[Conditional.scala 39:67 AXIrw.scala 144:19]
  wire  _GEN_44 = _T_8 ? 1'h0 : _GEN_40; // @[Conditional.scala 39:67 AXIrw.scala 145:19]
  wire  _GEN_45 = _T_8 ? 1'h0 : _GEN_41; // @[Conditional.scala 39:67 AXIrw.scala 146:17]
  wire  _GEN_46 = _T_7 ? 1'h0 : _T_8; // @[Conditional.scala 40:58 AXIrw.scala 137:20]
  wire  _GEN_47 = _T_7 ? 1'h0 : _GEN_43; // @[Conditional.scala 40:58 AXIrw.scala 138:19]
  wire  _GEN_48 = _T_7 ? 1'h0 : _GEN_44; // @[Conditional.scala 40:58 AXIrw.scala 139:19]
  wire  _GEN_49 = _T_7 ? 1'h0 : _GEN_45; // @[Conditional.scala 40:58 AXIrw.scala 140:17]
  wire  _GEN_50 = io_in_wen & _GEN_46; // @[AXIrw.scala 134:24]
  wire  _GEN_51 = io_in_wen & _GEN_47; // @[AXIrw.scala 134:24]
  wire  _GEN_52 = io_in_wen & _GEN_48; // @[AXIrw.scala 134:24]
  wire  _GEN_53 = io_in_wen & _GEN_49; // @[AXIrw.scala 134:24]
  assign io_in_ready = io_in_ren ? _GEN_32 : _GEN_53; // @[AXIrw.scala 111:19]
  assign io_in_rdata = io_in_valid & io_out_r_bits_id == 4'h2 ? io_out_r_bits_data : oldData; // @[AXIrw.scala 30:44 AXIrw.scala 31:13 AXIrw.scala 34:13]
  assign io_out_aw_valid = io_in_ren ? 1'h0 : _GEN_50; // @[AXIrw.scala 111:19]
  assign io_out_aw_bits_addr = io_in_addr; // @[AXIrw.scala 189:23]
  assign io_out_aw_bits_size = io_in_size; // @[AXIrw.scala 191:23]
  assign io_out_w_valid = io_in_ren ? 1'h0 : _GEN_51; // @[AXIrw.scala 111:19]
  assign io_out_w_bits_data = io_in_wdata; // @[AXIrw.scala 202:22]
  assign io_out_w_bits_strb = io_in_wmask; // @[AXIrw.scala 203:22]
  assign io_out_b_ready = io_in_ren ? 1'h0 : _GEN_52; // @[AXIrw.scala 111:19]
  assign io_out_ar_valid = io_in_ren & _GEN_30; // @[AXIrw.scala 111:19]
  assign io_out_ar_bits_addr = io_in_addr; // @[AXIrw.scala 181:23]
  assign io_out_ar_bits_size = io_in_size; // @[AXIrw.scala 173:23]
  assign io_out_r_ready = io_in_ren & _GEN_31; // @[AXIrw.scala 111:19]
  always @(posedge clock) begin
    if (reset) begin // @[AXIrw.scala 29:30]
      oldData <= io_out_r_bits_data; // @[AXIrw.scala 29:30]
    end else if (io_in_valid & io_out_r_bits_id == 4'h2) begin // @[AXIrw.scala 30:44]
      if (io_in_valid & io_out_r_bits_id == 4'h2) begin // @[AXIrw.scala 30:44]
        oldData <= io_out_r_bits_data; // @[AXIrw.scala 31:13]
      end
    end
    if (reset) begin // @[AXIrw.scala 88:29]
      rState <= 2'h0; // @[AXIrw.scala 88:29]
    end else if (io_in_ren) begin // @[AXIrw.scala 93:18]
      if (_T_2) begin // @[Conditional.scala 40:58]
        if (io_in_valid) begin // @[AXIrw.scala 95:39]
          rState <= 2'h1; // @[AXIrw.scala 95:47]
        end
      end else if (_T_3) begin // @[Conditional.scala 39:67]
        rState <= _GEN_3;
      end else begin
        rState <= _GEN_6;
      end
    end
    if (reset) begin // @[AXIrw.scala 91:29]
      wState <= 3'h0; // @[AXIrw.scala 91:29]
    end else if (!(io_in_ren)) begin // @[AXIrw.scala 93:18]
      if (io_in_wen) begin // @[AXIrw.scala 100:24]
        if (_T_7) begin // @[Conditional.scala 40:58]
          wState <= _GEN_9;
        end else begin
          wState <= _GEN_17;
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
  _RAND_0 = {2{`RANDOM}};
  oldData = _RAND_0[63:0];
  _RAND_1 = {1{`RANDOM}};
  rState = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  wState = _RAND_2[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210669(
  input         clock,
  input         reset,
  input         io_interrupt,
  input         io_master_awready,
  output        io_master_awvalid,
  output [31:0] io_master_awaddr,
  output [3:0]  io_master_awid,
  output [7:0]  io_master_awlen,
  output [2:0]  io_master_awsize,
  output [1:0]  io_master_awburst,
  input         io_master_wready,
  output        io_master_wvalid,
  output [63:0] io_master_wdata,
  output [7:0]  io_master_wstrb,
  output        io_master_wlast,
  output        io_master_bready,
  input         io_master_bvalid,
  input  [1:0]  io_master_bresp,
  input  [3:0]  io_master_bid,
  input         io_master_arready,
  output        io_master_arvalid,
  output [31:0] io_master_araddr,
  output [3:0]  io_master_arid,
  output [7:0]  io_master_arlen,
  output [2:0]  io_master_arsize,
  output [1:0]  io_master_arburst,
  output        io_master_rready,
  input         io_master_rvalid,
  input  [1:0]  io_master_rresp,
  input  [63:0] io_master_rdata,
  input         io_master_rlast,
  input  [3:0]  io_master_rid,
  output        io_slave_awready,
  input         io_slave_awvalid,
  input  [31:0] io_slave_awaddr,
  input  [3:0]  io_slave_awid,
  input  [7:0]  io_slave_awlen,
  input  [2:0]  io_slave_awsize,
  input  [1:0]  io_slave_awburst,
  output        io_slave_wready,
  input         io_slave_wvalid,
  input  [63:0] io_slave_wdata,
  input  [7:0]  io_slave_wstrb,
  input         io_slave_wlast,
  input         io_slave_bready,
  output        io_slave_bvalid,
  output [1:0]  io_slave_bresp,
  output [3:0]  io_slave_bid,
  output        io_slave_arready,
  input         io_slave_arvalid,
  input  [31:0] io_slave_araddr,
  input  [3:0]  io_slave_arid,
  input  [7:0]  io_slave_arlen,
  input  [2:0]  io_slave_arsize,
  input  [1:0]  io_slave_arburst,
  input         io_slave_rready,
  output        io_slave_rvalid,
  output [1:0]  io_slave_rresp,
  output [63:0] io_slave_rdata,
  output        io_slave_rlast,
  output [3:0]  io_slave_rid
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  IfStage_clock; // @[SimTop.scala 58:27]
  wire  IfStage_reset; // @[SimTop.scala 58:27]
  wire [63:0] IfStage_io_pcIn; // @[SimTop.scala 58:27]
  wire  IfStage_io_pcEn; // @[SimTop.scala 58:27]
  wire  IfStage_io_pcSrc; // @[SimTop.scala 58:27]
  wire  IfStage_io_rw_valid; // @[SimTop.scala 58:27]
  wire  IfStage_io_rw_ready; // @[SimTop.scala 58:27]
  wire [31:0] IfStage_io_rw_addr; // @[SimTop.scala 58:27]
  wire [63:0] IfStage_io_rw_rdata; // @[SimTop.scala 58:27]
  wire  IfStage_io_rwValid; // @[SimTop.scala 58:27]
  wire  IfStage_io_waitAXI; // @[SimTop.scala 58:27]
  wire [31:0] IfStage_io_out_inst; // @[SimTop.scala 58:27]
  wire [63:0] IfStage_io_out_pc; // @[SimTop.scala 58:27]
  wire [3:0] IfStage_io_out_instType; // @[SimTop.scala 58:27]
  wire  IfStage_io_out_branch; // @[SimTop.scala 58:27]
  wire  IfStage_io_out_regWrite; // @[SimTop.scala 58:27]
  wire  IfStage_io_out_aluSrc; // @[SimTop.scala 58:27]
  wire [4:0] IfStage_io_out_aluOp; // @[SimTop.scala 58:27]
  wire  IfStage_io_out_memWrite; // @[SimTop.scala 58:27]
  wire  IfStage_io_out_memRead; // @[SimTop.scala 58:27]
  wire  IfStage_io_out_sExtend; // @[SimTop.scala 58:27]
  wire [2:0] IfStage_io_out_lsByte; // @[SimTop.scala 58:27]
  wire  IfStage_io_out_memtoReg; // @[SimTop.scala 58:27]
  wire [1:0] IfStage_io_out_shiftByte; // @[SimTop.scala 58:27]
  wire [2:0] IfStage_io_out_resultSrc; // @[SimTop.scala 58:27]
  wire  IfStage_io_out_addSrc; // @[SimTop.scala 58:27]
  wire [3:0] IfStage_io_out_csrOp; // @[SimTop.scala 58:27]
  wire  IdStage_clock; // @[SimTop.scala 59:27]
  wire  IdStage_reset; // @[SimTop.scala 59:27]
  wire [63:0] IdStage_io_writeData; // @[SimTop.scala 59:27]
  wire [63:0] IdStage_io_writeReg; // @[SimTop.scala 59:27]
  wire  IdStage_io_regWrite; // @[SimTop.scala 59:27]
  wire [31:0] IdStage_io_in_inst; // @[SimTop.scala 59:27]
  wire [63:0] IdStage_io_in_pc; // @[SimTop.scala 59:27]
  wire [3:0] IdStage_io_in_instType; // @[SimTop.scala 59:27]
  wire  IdStage_io_in_branch; // @[SimTop.scala 59:27]
  wire  IdStage_io_in_aluSrc; // @[SimTop.scala 59:27]
  wire [4:0] IdStage_io_in_aluOp; // @[SimTop.scala 59:27]
  wire  IdStage_io_in_memWrite; // @[SimTop.scala 59:27]
  wire  IdStage_io_in_memRead; // @[SimTop.scala 59:27]
  wire  IdStage_io_in_sExtend; // @[SimTop.scala 59:27]
  wire [2:0] IdStage_io_in_lsByte; // @[SimTop.scala 59:27]
  wire  IdStage_io_in_memtoReg; // @[SimTop.scala 59:27]
  wire [1:0] IdStage_io_in_shiftByte; // @[SimTop.scala 59:27]
  wire [2:0] IdStage_io_in_resultSrc; // @[SimTop.scala 59:27]
  wire  IdStage_io_in_addSrc; // @[SimTop.scala 59:27]
  wire [3:0] IdStage_io_in_csrOp; // @[SimTop.scala 59:27]
  wire  IdStage_io_in_regWrite; // @[SimTop.scala 59:27]
  wire [63:0] IdStage_io_out_pc; // @[SimTop.scala 59:27]
  wire [63:0] IdStage_io_out_readData1; // @[SimTop.scala 59:27]
  wire [63:0] IdStage_io_out_readData2; // @[SimTop.scala 59:27]
  wire [11:0] IdStage_io_out_csrAddr; // @[SimTop.scala 59:27]
  wire [63:0] IdStage_io_out_imm; // @[SimTop.scala 59:27]
  wire [63:0] IdStage_io_out_writeReg; // @[SimTop.scala 59:27]
  wire  IdStage_io_out_branch; // @[SimTop.scala 59:27]
  wire  IdStage_io_out_aluSrc; // @[SimTop.scala 59:27]
  wire [4:0] IdStage_io_out_aluOp; // @[SimTop.scala 59:27]
  wire  IdStage_io_out_memWrite; // @[SimTop.scala 59:27]
  wire  IdStage_io_out_memRead; // @[SimTop.scala 59:27]
  wire  IdStage_io_out_sExtend; // @[SimTop.scala 59:27]
  wire [2:0] IdStage_io_out_lsByte; // @[SimTop.scala 59:27]
  wire  IdStage_io_out_memtoReg; // @[SimTop.scala 59:27]
  wire [1:0] IdStage_io_out_shiftByte; // @[SimTop.scala 59:27]
  wire [2:0] IdStage_io_out_resultSrc; // @[SimTop.scala 59:27]
  wire  IdStage_io_out_addSrc; // @[SimTop.scala 59:27]
  wire [3:0] IdStage_io_out_csrOp; // @[SimTop.scala 59:27]
  wire  IdStage_io_out_regWrite; // @[SimTop.scala 59:27]
  wire  IdStage_io_exH2Id_regWrite; // @[SimTop.scala 59:27]
  wire [63:0] IdStage_io_exH2Id_writeReg; // @[SimTop.scala 59:27]
  wire  IdStage_io_exH2Id_exLoad; // @[SimTop.scala 59:27]
  wire [63:0] IdStage_io_exH2Id_wbData; // @[SimTop.scala 59:27]
  wire  IdStage_io_memH2Id_regWrite; // @[SimTop.scala 59:27]
  wire [63:0] IdStage_io_memH2Id_writeReg; // @[SimTop.scala 59:27]
  wire [63:0] IdStage_io_memH2Id_wbData; // @[SimTop.scala 59:27]
  wire  IdStage_io_wbH2Id_regWrite; // @[SimTop.scala 59:27]
  wire [63:0] IdStage_io_wbH2Id_writeReg; // @[SimTop.scala 59:27]
  wire [63:0] IdStage_io_wbH2Id_wbData; // @[SimTop.scala 59:27]
  wire  IdStage_io_bubble; // @[SimTop.scala 59:27]
  wire  ExStage_clock; // @[SimTop.scala 60:27]
  wire  ExStage_reset; // @[SimTop.scala 60:27]
  wire  ExStage_io_instValid; // @[SimTop.scala 60:27]
  wire [63:0] ExStage_io_pcResult; // @[SimTop.scala 60:27]
  wire  ExStage_io_pcSrc; // @[SimTop.scala 60:27]
  wire  ExStage_io_mipMtip; // @[SimTop.scala 60:27]
  wire [63:0] ExStage_io_in_pc; // @[SimTop.scala 60:27]
  wire [63:0] ExStage_io_in_readData1; // @[SimTop.scala 60:27]
  wire [63:0] ExStage_io_in_readData2; // @[SimTop.scala 60:27]
  wire [11:0] ExStage_io_in_csrAddr; // @[SimTop.scala 60:27]
  wire [63:0] ExStage_io_in_imm; // @[SimTop.scala 60:27]
  wire [63:0] ExStage_io_in_writeReg; // @[SimTop.scala 60:27]
  wire  ExStage_io_in_addSrc; // @[SimTop.scala 60:27]
  wire  ExStage_io_in_aluSrc; // @[SimTop.scala 60:27]
  wire [1:0] ExStage_io_in_shiftByte; // @[SimTop.scala 60:27]
  wire [4:0] ExStage_io_in_aluOp; // @[SimTop.scala 60:27]
  wire  ExStage_io_in_branch; // @[SimTop.scala 60:27]
  wire [2:0] ExStage_io_in_resultSrc; // @[SimTop.scala 60:27]
  wire [3:0] ExStage_io_in_csrOp; // @[SimTop.scala 60:27]
  wire  ExStage_io_in_memWrite; // @[SimTop.scala 60:27]
  wire  ExStage_io_in_memRead; // @[SimTop.scala 60:27]
  wire  ExStage_io_in_sExtend; // @[SimTop.scala 60:27]
  wire [2:0] ExStage_io_in_lsByte; // @[SimTop.scala 60:27]
  wire  ExStage_io_in_memtoReg; // @[SimTop.scala 60:27]
  wire  ExStage_io_in_regWrite; // @[SimTop.scala 60:27]
  wire [63:0] ExStage_io_out_result; // @[SimTop.scala 60:27]
  wire [63:0] ExStage_io_out_dataOutput; // @[SimTop.scala 60:27]
  wire [63:0] ExStage_io_out_writeReg; // @[SimTop.scala 60:27]
  wire  ExStage_io_out_memWrite; // @[SimTop.scala 60:27]
  wire  ExStage_io_out_memRead; // @[SimTop.scala 60:27]
  wire  ExStage_io_out_sExtend; // @[SimTop.scala 60:27]
  wire [2:0] ExStage_io_out_lsByte; // @[SimTop.scala 60:27]
  wire  ExStage_io_out_memtoReg; // @[SimTop.scala 60:27]
  wire  ExStage_io_out_regWrite; // @[SimTop.scala 60:27]
  wire  ExStage_io_exH2Id_regWrite; // @[SimTop.scala 60:27]
  wire [63:0] ExStage_io_exH2Id_writeReg; // @[SimTop.scala 60:27]
  wire  ExStage_io_exH2Id_exLoad; // @[SimTop.scala 60:27]
  wire [63:0] ExStage_io_exH2Id_wbData; // @[SimTop.scala 60:27]
  wire  ExStage_io_load; // @[SimTop.scala 60:27]
  wire  MemStage_clock; // @[SimTop.scala 61:29]
  wire  MemStage_reset; // @[SimTop.scala 61:29]
  wire [63:0] MemStage_io_in_address; // @[SimTop.scala 61:29]
  wire [63:0] MemStage_io_in_writeData; // @[SimTop.scala 61:29]
  wire [63:0] MemStage_io_in_writeReg; // @[SimTop.scala 61:29]
  wire  MemStage_io_in_memWrite; // @[SimTop.scala 61:29]
  wire  MemStage_io_in_memRead; // @[SimTop.scala 61:29]
  wire  MemStage_io_in_sExtend; // @[SimTop.scala 61:29]
  wire [2:0] MemStage_io_in_lsByte; // @[SimTop.scala 61:29]
  wire  MemStage_io_in_memtoReg; // @[SimTop.scala 61:29]
  wire  MemStage_io_in_regWrite; // @[SimTop.scala 61:29]
  wire [63:0] MemStage_io_out_readData; // @[SimTop.scala 61:29]
  wire [63:0] MemStage_io_out_extendResult; // @[SimTop.scala 61:29]
  wire [63:0] MemStage_io_out_writeReg; // @[SimTop.scala 61:29]
  wire  MemStage_io_out_memtoReg; // @[SimTop.scala 61:29]
  wire  MemStage_io_out_regWrite; // @[SimTop.scala 61:29]
  wire  MemStage_io_memH2Id_regWrite; // @[SimTop.scala 61:29]
  wire [63:0] MemStage_io_memH2Id_writeReg; // @[SimTop.scala 61:29]
  wire [63:0] MemStage_io_memH2Id_wbData; // @[SimTop.scala 61:29]
  wire  MemStage_io_mipMtip; // @[SimTop.scala 61:29]
  wire  MemStage_io_rw_valid; // @[SimTop.scala 61:29]
  wire  MemStage_io_rw_ready; // @[SimTop.scala 61:29]
  wire [31:0] MemStage_io_rw_addr; // @[SimTop.scala 61:29]
  wire  MemStage_io_rw_ren; // @[SimTop.scala 61:29]
  wire [63:0] MemStage_io_rw_rdata; // @[SimTop.scala 61:29]
  wire [2:0] MemStage_io_rw_size; // @[SimTop.scala 61:29]
  wire  MemStage_io_rw_wen; // @[SimTop.scala 61:29]
  wire [63:0] MemStage_io_rw_wdata; // @[SimTop.scala 61:29]
  wire [7:0] MemStage_io_rw_wmask; // @[SimTop.scala 61:29]
  wire  MemStage_io_runAXI; // @[SimTop.scala 61:29]
  wire  MemStage_io_rwValid; // @[SimTop.scala 61:29]
  wire  MemStage_io_waitAXI; // @[SimTop.scala 61:29]
  wire [63:0] WbStage_io_writeData; // @[SimTop.scala 62:27]
  wire [63:0] WbStage_io_writeReg; // @[SimTop.scala 62:27]
  wire  WbStage_io_regWrite; // @[SimTop.scala 62:27]
  wire [63:0] WbStage_io_in_memData; // @[SimTop.scala 62:27]
  wire [63:0] WbStage_io_in_aluData; // @[SimTop.scala 62:27]
  wire  WbStage_io_in_memtoReg; // @[SimTop.scala 62:27]
  wire [63:0] WbStage_io_in_writeReg; // @[SimTop.scala 62:27]
  wire  WbStage_io_in_regWrite; // @[SimTop.scala 62:27]
  wire  WbStage_io_wbH2Id_regWrite; // @[SimTop.scala 62:27]
  wire [63:0] WbStage_io_wbH2Id_writeReg; // @[SimTop.scala 62:27]
  wire [63:0] WbStage_io_wbH2Id_wbData; // @[SimTop.scala 62:27]
  wire  IfId_clock; // @[SimTop.scala 69:26]
  wire  IfId_io_en; // @[SimTop.scala 69:26]
  wire  IfId_io_reset; // @[SimTop.scala 69:26]
  wire [31:0] IfId_io_in_inst; // @[SimTop.scala 69:26]
  wire [63:0] IfId_io_in_pc; // @[SimTop.scala 69:26]
  wire [3:0] IfId_io_in_instType; // @[SimTop.scala 69:26]
  wire  IfId_io_in_branch; // @[SimTop.scala 69:26]
  wire  IfId_io_in_regWrite; // @[SimTop.scala 69:26]
  wire  IfId_io_in_aluSrc; // @[SimTop.scala 69:26]
  wire [4:0] IfId_io_in_aluOp; // @[SimTop.scala 69:26]
  wire  IfId_io_in_memWrite; // @[SimTop.scala 69:26]
  wire  IfId_io_in_memRead; // @[SimTop.scala 69:26]
  wire  IfId_io_in_sExtend; // @[SimTop.scala 69:26]
  wire [2:0] IfId_io_in_lsByte; // @[SimTop.scala 69:26]
  wire  IfId_io_in_memtoReg; // @[SimTop.scala 69:26]
  wire [1:0] IfId_io_in_shiftByte; // @[SimTop.scala 69:26]
  wire [2:0] IfId_io_in_resultSrc; // @[SimTop.scala 69:26]
  wire  IfId_io_in_addSrc; // @[SimTop.scala 69:26]
  wire [3:0] IfId_io_in_csrOp; // @[SimTop.scala 69:26]
  wire [31:0] IfId_io_out_inst; // @[SimTop.scala 69:26]
  wire [63:0] IfId_io_out_pc; // @[SimTop.scala 69:26]
  wire [3:0] IfId_io_out_instType; // @[SimTop.scala 69:26]
  wire  IfId_io_out_branch; // @[SimTop.scala 69:26]
  wire  IfId_io_out_aluSrc; // @[SimTop.scala 69:26]
  wire [4:0] IfId_io_out_aluOp; // @[SimTop.scala 69:26]
  wire  IfId_io_out_memWrite; // @[SimTop.scala 69:26]
  wire  IfId_io_out_memRead; // @[SimTop.scala 69:26]
  wire  IfId_io_out_sExtend; // @[SimTop.scala 69:26]
  wire [2:0] IfId_io_out_lsByte; // @[SimTop.scala 69:26]
  wire  IfId_io_out_memtoReg; // @[SimTop.scala 69:26]
  wire [1:0] IfId_io_out_shiftByte; // @[SimTop.scala 69:26]
  wire [2:0] IfId_io_out_resultSrc; // @[SimTop.scala 69:26]
  wire  IfId_io_out_addSrc; // @[SimTop.scala 69:26]
  wire [3:0] IfId_io_out_csrOp; // @[SimTop.scala 69:26]
  wire  IfId_io_out_regWrite; // @[SimTop.scala 69:26]
  wire  IdEx_clock; // @[SimTop.scala 74:26]
  wire  IdEx_io_en; // @[SimTop.scala 74:26]
  wire  IdEx_io_reset; // @[SimTop.scala 74:26]
  wire [63:0] IdEx_io_in_pc; // @[SimTop.scala 74:26]
  wire [63:0] IdEx_io_in_readData1; // @[SimTop.scala 74:26]
  wire [63:0] IdEx_io_in_readData2; // @[SimTop.scala 74:26]
  wire [11:0] IdEx_io_in_csrAddr; // @[SimTop.scala 74:26]
  wire [63:0] IdEx_io_in_imm; // @[SimTop.scala 74:26]
  wire [63:0] IdEx_io_in_writeReg; // @[SimTop.scala 74:26]
  wire  IdEx_io_in_branch; // @[SimTop.scala 74:26]
  wire  IdEx_io_in_aluSrc; // @[SimTop.scala 74:26]
  wire [4:0] IdEx_io_in_aluOp; // @[SimTop.scala 74:26]
  wire  IdEx_io_in_memWrite; // @[SimTop.scala 74:26]
  wire  IdEx_io_in_memRead; // @[SimTop.scala 74:26]
  wire  IdEx_io_in_sExtend; // @[SimTop.scala 74:26]
  wire [2:0] IdEx_io_in_lsByte; // @[SimTop.scala 74:26]
  wire  IdEx_io_in_memtoReg; // @[SimTop.scala 74:26]
  wire [1:0] IdEx_io_in_shiftByte; // @[SimTop.scala 74:26]
  wire [2:0] IdEx_io_in_resultSrc; // @[SimTop.scala 74:26]
  wire  IdEx_io_in_addSrc; // @[SimTop.scala 74:26]
  wire [3:0] IdEx_io_in_csrOp; // @[SimTop.scala 74:26]
  wire  IdEx_io_in_regWrite; // @[SimTop.scala 74:26]
  wire [63:0] IdEx_io_out_pc; // @[SimTop.scala 74:26]
  wire [63:0] IdEx_io_out_readData1; // @[SimTop.scala 74:26]
  wire [63:0] IdEx_io_out_readData2; // @[SimTop.scala 74:26]
  wire [11:0] IdEx_io_out_csrAddr; // @[SimTop.scala 74:26]
  wire [63:0] IdEx_io_out_imm; // @[SimTop.scala 74:26]
  wire [63:0] IdEx_io_out_writeReg; // @[SimTop.scala 74:26]
  wire  IdEx_io_out_addSrc; // @[SimTop.scala 74:26]
  wire  IdEx_io_out_aluSrc; // @[SimTop.scala 74:26]
  wire [1:0] IdEx_io_out_shiftByte; // @[SimTop.scala 74:26]
  wire [4:0] IdEx_io_out_aluOp; // @[SimTop.scala 74:26]
  wire  IdEx_io_out_branch; // @[SimTop.scala 74:26]
  wire [2:0] IdEx_io_out_resultSrc; // @[SimTop.scala 74:26]
  wire [3:0] IdEx_io_out_csrOp; // @[SimTop.scala 74:26]
  wire  IdEx_io_out_memWrite; // @[SimTop.scala 74:26]
  wire  IdEx_io_out_memRead; // @[SimTop.scala 74:26]
  wire  IdEx_io_out_sExtend; // @[SimTop.scala 74:26]
  wire [2:0] IdEx_io_out_lsByte; // @[SimTop.scala 74:26]
  wire  IdEx_io_out_memtoReg; // @[SimTop.scala 74:26]
  wire  IdEx_io_out_regWrite; // @[SimTop.scala 74:26]
  wire  ExMem_clock; // @[SimTop.scala 80:28]
  wire  ExMem_io_en; // @[SimTop.scala 80:28]
  wire  ExMem_io_reset; // @[SimTop.scala 80:28]
  wire [63:0] ExMem_io_in_result; // @[SimTop.scala 80:28]
  wire [63:0] ExMem_io_in_dataOutput; // @[SimTop.scala 80:28]
  wire [63:0] ExMem_io_in_writeReg; // @[SimTop.scala 80:28]
  wire  ExMem_io_in_memWrite; // @[SimTop.scala 80:28]
  wire  ExMem_io_in_memRead; // @[SimTop.scala 80:28]
  wire  ExMem_io_in_sExtend; // @[SimTop.scala 80:28]
  wire [2:0] ExMem_io_in_lsByte; // @[SimTop.scala 80:28]
  wire  ExMem_io_in_memtoReg; // @[SimTop.scala 80:28]
  wire  ExMem_io_in_regWrite; // @[SimTop.scala 80:28]
  wire [63:0] ExMem_io_out_address; // @[SimTop.scala 80:28]
  wire [63:0] ExMem_io_out_writeData; // @[SimTop.scala 80:28]
  wire [63:0] ExMem_io_out_writeReg; // @[SimTop.scala 80:28]
  wire  ExMem_io_out_memWrite; // @[SimTop.scala 80:28]
  wire  ExMem_io_out_memRead; // @[SimTop.scala 80:28]
  wire  ExMem_io_out_sExtend; // @[SimTop.scala 80:28]
  wire [2:0] ExMem_io_out_lsByte; // @[SimTop.scala 80:28]
  wire  ExMem_io_out_memtoReg; // @[SimTop.scala 80:28]
  wire  ExMem_io_out_regWrite; // @[SimTop.scala 80:28]
  wire  MemWb_clock; // @[SimTop.scala 85:28]
  wire  MemWb_io_en; // @[SimTop.scala 85:28]
  wire  MemWb_io_reset; // @[SimTop.scala 85:28]
  wire [63:0] MemWb_io_in_readData; // @[SimTop.scala 85:28]
  wire [63:0] MemWb_io_in_extendResult; // @[SimTop.scala 85:28]
  wire [63:0] MemWb_io_in_writeReg; // @[SimTop.scala 85:28]
  wire  MemWb_io_in_memtoReg; // @[SimTop.scala 85:28]
  wire  MemWb_io_in_regWrite; // @[SimTop.scala 85:28]
  wire [63:0] MemWb_io_out_memData; // @[SimTop.scala 85:28]
  wire [63:0] MemWb_io_out_aluData; // @[SimTop.scala 85:28]
  wire  MemWb_io_out_memtoReg; // @[SimTop.scala 85:28]
  wire [63:0] MemWb_io_out_writeReg; // @[SimTop.scala 85:28]
  wire  MemWb_io_out_regWrite; // @[SimTop.scala 85:28]
  wire  crossbar_clock; // @[SimTop.scala 126:34]
  wire  crossbar_reset; // @[SimTop.scala 126:34]
  wire  crossbar_io_in_0_ar_ready; // @[SimTop.scala 126:34]
  wire  crossbar_io_in_0_ar_valid; // @[SimTop.scala 126:34]
  wire [31:0] crossbar_io_in_0_ar_bits_addr; // @[SimTop.scala 126:34]
  wire  crossbar_io_in_0_r_ready; // @[SimTop.scala 126:34]
  wire  crossbar_io_in_0_r_valid; // @[SimTop.scala 126:34]
  wire [63:0] crossbar_io_in_0_r_bits_data; // @[SimTop.scala 126:34]
  wire [3:0] crossbar_io_in_0_r_bits_id; // @[SimTop.scala 126:34]
  wire  crossbar_io_in_0_r_bits_last; // @[SimTop.scala 126:34]
  wire  crossbar_io_in_1_aw_ready; // @[SimTop.scala 126:34]
  wire  crossbar_io_in_1_aw_valid; // @[SimTop.scala 126:34]
  wire [31:0] crossbar_io_in_1_aw_bits_addr; // @[SimTop.scala 126:34]
  wire [2:0] crossbar_io_in_1_aw_bits_size; // @[SimTop.scala 126:34]
  wire  crossbar_io_in_1_w_ready; // @[SimTop.scala 126:34]
  wire  crossbar_io_in_1_w_valid; // @[SimTop.scala 126:34]
  wire [63:0] crossbar_io_in_1_w_bits_data; // @[SimTop.scala 126:34]
  wire [7:0] crossbar_io_in_1_w_bits_strb; // @[SimTop.scala 126:34]
  wire  crossbar_io_in_1_b_ready; // @[SimTop.scala 126:34]
  wire  crossbar_io_in_1_b_valid; // @[SimTop.scala 126:34]
  wire [3:0] crossbar_io_in_1_b_bits_id; // @[SimTop.scala 126:34]
  wire [1:0] crossbar_io_in_1_b_bits_resp; // @[SimTop.scala 126:34]
  wire  crossbar_io_in_1_ar_ready; // @[SimTop.scala 126:34]
  wire  crossbar_io_in_1_ar_valid; // @[SimTop.scala 126:34]
  wire [31:0] crossbar_io_in_1_ar_bits_addr; // @[SimTop.scala 126:34]
  wire [2:0] crossbar_io_in_1_ar_bits_size; // @[SimTop.scala 126:34]
  wire  crossbar_io_in_1_r_ready; // @[SimTop.scala 126:34]
  wire  crossbar_io_in_1_r_valid; // @[SimTop.scala 126:34]
  wire [63:0] crossbar_io_in_1_r_bits_data; // @[SimTop.scala 126:34]
  wire [3:0] crossbar_io_in_1_r_bits_id; // @[SimTop.scala 126:34]
  wire  crossbar_io_in_1_r_bits_last; // @[SimTop.scala 126:34]
  wire  crossbar_io_out_aw_ready; // @[SimTop.scala 126:34]
  wire  crossbar_io_out_aw_valid; // @[SimTop.scala 126:34]
  wire [31:0] crossbar_io_out_aw_bits_addr; // @[SimTop.scala 126:34]
  wire [2:0] crossbar_io_out_aw_bits_size; // @[SimTop.scala 126:34]
  wire  crossbar_io_out_w_ready; // @[SimTop.scala 126:34]
  wire  crossbar_io_out_w_valid; // @[SimTop.scala 126:34]
  wire [63:0] crossbar_io_out_w_bits_data; // @[SimTop.scala 126:34]
  wire [7:0] crossbar_io_out_w_bits_strb; // @[SimTop.scala 126:34]
  wire  crossbar_io_out_b_ready; // @[SimTop.scala 126:34]
  wire  crossbar_io_out_b_valid; // @[SimTop.scala 126:34]
  wire [3:0] crossbar_io_out_b_bits_id; // @[SimTop.scala 126:34]
  wire [1:0] crossbar_io_out_b_bits_resp; // @[SimTop.scala 126:34]
  wire  crossbar_io_out_ar_ready; // @[SimTop.scala 126:34]
  wire  crossbar_io_out_ar_valid; // @[SimTop.scala 126:34]
  wire [31:0] crossbar_io_out_ar_bits_addr; // @[SimTop.scala 126:34]
  wire [3:0] crossbar_io_out_ar_bits_id; // @[SimTop.scala 126:34]
  wire [2:0] crossbar_io_out_ar_bits_size; // @[SimTop.scala 126:34]
  wire  crossbar_io_out_r_ready; // @[SimTop.scala 126:34]
  wire  crossbar_io_out_r_valid; // @[SimTop.scala 126:34]
  wire [63:0] crossbar_io_out_r_bits_data; // @[SimTop.scala 126:34]
  wire [3:0] crossbar_io_out_r_bits_id; // @[SimTop.scala 126:34]
  wire  crossbar_io_out_r_bits_last; // @[SimTop.scala 126:34]
  wire  IfAxiRw_clock; // @[SimTop.scala 127:30]
  wire  IfAxiRw_reset; // @[SimTop.scala 127:30]
  wire  IfAxiRw_io_in_valid; // @[SimTop.scala 127:30]
  wire  IfAxiRw_io_in_ready; // @[SimTop.scala 127:30]
  wire [31:0] IfAxiRw_io_in_addr; // @[SimTop.scala 127:30]
  wire [63:0] IfAxiRw_io_in_rdata; // @[SimTop.scala 127:30]
  wire  IfAxiRw_io_out_ar_ready; // @[SimTop.scala 127:30]
  wire  IfAxiRw_io_out_ar_valid; // @[SimTop.scala 127:30]
  wire [31:0] IfAxiRw_io_out_ar_bits_addr; // @[SimTop.scala 127:30]
  wire  IfAxiRw_io_out_r_ready; // @[SimTop.scala 127:30]
  wire  IfAxiRw_io_out_r_valid; // @[SimTop.scala 127:30]
  wire [63:0] IfAxiRw_io_out_r_bits_data; // @[SimTop.scala 127:30]
  wire [3:0] IfAxiRw_io_out_r_bits_id; // @[SimTop.scala 127:30]
  wire  IfAxiRw_io_out_r_bits_last; // @[SimTop.scala 127:30]
  wire  MemAxiRw_clock; // @[SimTop.scala 132:31]
  wire  MemAxiRw_reset; // @[SimTop.scala 132:31]
  wire  MemAxiRw_io_in_valid; // @[SimTop.scala 132:31]
  wire  MemAxiRw_io_in_ready; // @[SimTop.scala 132:31]
  wire [31:0] MemAxiRw_io_in_addr; // @[SimTop.scala 132:31]
  wire  MemAxiRw_io_in_ren; // @[SimTop.scala 132:31]
  wire [63:0] MemAxiRw_io_in_rdata; // @[SimTop.scala 132:31]
  wire [2:0] MemAxiRw_io_in_size; // @[SimTop.scala 132:31]
  wire  MemAxiRw_io_in_wen; // @[SimTop.scala 132:31]
  wire [63:0] MemAxiRw_io_in_wdata; // @[SimTop.scala 132:31]
  wire [7:0] MemAxiRw_io_in_wmask; // @[SimTop.scala 132:31]
  wire  MemAxiRw_io_out_aw_ready; // @[SimTop.scala 132:31]
  wire  MemAxiRw_io_out_aw_valid; // @[SimTop.scala 132:31]
  wire [31:0] MemAxiRw_io_out_aw_bits_addr; // @[SimTop.scala 132:31]
  wire [2:0] MemAxiRw_io_out_aw_bits_size; // @[SimTop.scala 132:31]
  wire  MemAxiRw_io_out_w_ready; // @[SimTop.scala 132:31]
  wire  MemAxiRw_io_out_w_valid; // @[SimTop.scala 132:31]
  wire [63:0] MemAxiRw_io_out_w_bits_data; // @[SimTop.scala 132:31]
  wire [7:0] MemAxiRw_io_out_w_bits_strb; // @[SimTop.scala 132:31]
  wire  MemAxiRw_io_out_b_ready; // @[SimTop.scala 132:31]
  wire  MemAxiRw_io_out_b_valid; // @[SimTop.scala 132:31]
  wire [3:0] MemAxiRw_io_out_b_bits_id; // @[SimTop.scala 132:31]
  wire [1:0] MemAxiRw_io_out_b_bits_resp; // @[SimTop.scala 132:31]
  wire  MemAxiRw_io_out_ar_ready; // @[SimTop.scala 132:31]
  wire  MemAxiRw_io_out_ar_valid; // @[SimTop.scala 132:31]
  wire [31:0] MemAxiRw_io_out_ar_bits_addr; // @[SimTop.scala 132:31]
  wire [2:0] MemAxiRw_io_out_ar_bits_size; // @[SimTop.scala 132:31]
  wire  MemAxiRw_io_out_r_ready; // @[SimTop.scala 132:31]
  wire  MemAxiRw_io_out_r_valid; // @[SimTop.scala 132:31]
  wire [63:0] MemAxiRw_io_out_r_bits_data; // @[SimTop.scala 132:31]
  wire [3:0] MemAxiRw_io_out_r_bits_id; // @[SimTop.scala 132:31]
  wire  MemAxiRw_io_out_r_bits_last; // @[SimTop.scala 132:31]
  reg [1:0] states; // @[SimTop.scala 179:29]
  wire  _T_8 = 2'h0 == states; // @[Conditional.scala 37:30]
  wire  _T_9 = 2'h1 == states; // @[Conditional.scala 37:30]
  wire  _T_10 = 2'h2 == states; // @[Conditional.scala 37:30]
  wire  _GEN_8 = _T_9 | _T_10; // @[Conditional.scala 39:67 SimTop.scala 206:17]
  wire  _GEN_11 = _T_8 ? 1'h0 : _GEN_8; // @[Conditional.scala 40:58 SimTop.scala 201:17]
  wire  cpuWait = reset ? 1'h0 : _GEN_11; // @[SimTop.scala 195:23]
  wire  _IdStage_io_regWrite_T = ~cpuWait; // @[SimTop.scala 94:48]
  wire  bubble = IdStage_io_bubble & ExStage_io_load; // @[SimTop.scala 107:40]
  wire  _IfStage_io_pcEn_T = bubble | cpuWait; // @[SimTop.scala 108:31]
  wire  ifidreset = ExStage_io_pcSrc & _IdStage_io_regWrite_T; // @[SimTop.scala 114:29]
  wire  idexreset = (ExStage_io_pcSrc | bubble) & _IdStage_io_regWrite_T; // @[SimTop.scala 115:40]
  wire  _T_2 = ~IfStage_io_waitAXI; // @[SimTop.scala 186:12]
  wire [1:0] _GEN_0 = _T_2 ? 2'h0 : states; // @[SimTop.scala 188:38 SimTop.scala 189:16 SimTop.scala 179:29]
  wire [1:0] _GEN_2 = ~MemStage_io_waitAXI ? 2'h0 : states; // @[SimTop.scala 192:45 SimTop.scala 192:53 SimTop.scala 179:29]
  wire  _GEN_7 = _T_10 ? 1'h0 : 1'h1; // @[Conditional.scala 39:67 SimTop.scala 212:17]
  wire  _GEN_9 = _T_9 | _GEN_7; // @[Conditional.scala 39:67 SimTop.scala 207:17]
  wire  _GEN_10 = _T_9 ? 1'h0 : _T_10; // @[Conditional.scala 39:67 SimTop.scala 208:18]
  wire  _GEN_12 = _T_8 ? 1'h0 : _GEN_9; // @[Conditional.scala 40:58 SimTop.scala 202:17]
  wire  _GEN_13 = _T_8 ? 1'h0 : _GEN_10; // @[Conditional.scala 40:58 SimTop.scala 203:18]
  ysyx_210669_IF IfStage ( // @[SimTop.scala 58:27]
    .clock(IfStage_clock),
    .reset(IfStage_reset),
    .io_pcIn(IfStage_io_pcIn),
    .io_pcEn(IfStage_io_pcEn),
    .io_pcSrc(IfStage_io_pcSrc),
    .io_rw_valid(IfStage_io_rw_valid),
    .io_rw_ready(IfStage_io_rw_ready),
    .io_rw_addr(IfStage_io_rw_addr),
    .io_rw_rdata(IfStage_io_rw_rdata),
    .io_rwValid(IfStage_io_rwValid),
    .io_waitAXI(IfStage_io_waitAXI),
    .io_out_inst(IfStage_io_out_inst),
    .io_out_pc(IfStage_io_out_pc),
    .io_out_instType(IfStage_io_out_instType),
    .io_out_branch(IfStage_io_out_branch),
    .io_out_regWrite(IfStage_io_out_regWrite),
    .io_out_aluSrc(IfStage_io_out_aluSrc),
    .io_out_aluOp(IfStage_io_out_aluOp),
    .io_out_memWrite(IfStage_io_out_memWrite),
    .io_out_memRead(IfStage_io_out_memRead),
    .io_out_sExtend(IfStage_io_out_sExtend),
    .io_out_lsByte(IfStage_io_out_lsByte),
    .io_out_memtoReg(IfStage_io_out_memtoReg),
    .io_out_shiftByte(IfStage_io_out_shiftByte),
    .io_out_resultSrc(IfStage_io_out_resultSrc),
    .io_out_addSrc(IfStage_io_out_addSrc),
    .io_out_csrOp(IfStage_io_out_csrOp)
  );
  ysyx_210669_ID IdStage ( // @[SimTop.scala 59:27]
    .clock(IdStage_clock),
    .reset(IdStage_reset),
    .io_writeData(IdStage_io_writeData),
    .io_writeReg(IdStage_io_writeReg),
    .io_regWrite(IdStage_io_regWrite),
    .io_in_inst(IdStage_io_in_inst),
    .io_in_pc(IdStage_io_in_pc),
    .io_in_instType(IdStage_io_in_instType),
    .io_in_branch(IdStage_io_in_branch),
    .io_in_aluSrc(IdStage_io_in_aluSrc),
    .io_in_aluOp(IdStage_io_in_aluOp),
    .io_in_memWrite(IdStage_io_in_memWrite),
    .io_in_memRead(IdStage_io_in_memRead),
    .io_in_sExtend(IdStage_io_in_sExtend),
    .io_in_lsByte(IdStage_io_in_lsByte),
    .io_in_memtoReg(IdStage_io_in_memtoReg),
    .io_in_shiftByte(IdStage_io_in_shiftByte),
    .io_in_resultSrc(IdStage_io_in_resultSrc),
    .io_in_addSrc(IdStage_io_in_addSrc),
    .io_in_csrOp(IdStage_io_in_csrOp),
    .io_in_regWrite(IdStage_io_in_regWrite),
    .io_out_pc(IdStage_io_out_pc),
    .io_out_readData1(IdStage_io_out_readData1),
    .io_out_readData2(IdStage_io_out_readData2),
    .io_out_csrAddr(IdStage_io_out_csrAddr),
    .io_out_imm(IdStage_io_out_imm),
    .io_out_writeReg(IdStage_io_out_writeReg),
    .io_out_branch(IdStage_io_out_branch),
    .io_out_aluSrc(IdStage_io_out_aluSrc),
    .io_out_aluOp(IdStage_io_out_aluOp),
    .io_out_memWrite(IdStage_io_out_memWrite),
    .io_out_memRead(IdStage_io_out_memRead),
    .io_out_sExtend(IdStage_io_out_sExtend),
    .io_out_lsByte(IdStage_io_out_lsByte),
    .io_out_memtoReg(IdStage_io_out_memtoReg),
    .io_out_shiftByte(IdStage_io_out_shiftByte),
    .io_out_resultSrc(IdStage_io_out_resultSrc),
    .io_out_addSrc(IdStage_io_out_addSrc),
    .io_out_csrOp(IdStage_io_out_csrOp),
    .io_out_regWrite(IdStage_io_out_regWrite),
    .io_exH2Id_regWrite(IdStage_io_exH2Id_regWrite),
    .io_exH2Id_writeReg(IdStage_io_exH2Id_writeReg),
    .io_exH2Id_exLoad(IdStage_io_exH2Id_exLoad),
    .io_exH2Id_wbData(IdStage_io_exH2Id_wbData),
    .io_memH2Id_regWrite(IdStage_io_memH2Id_regWrite),
    .io_memH2Id_writeReg(IdStage_io_memH2Id_writeReg),
    .io_memH2Id_wbData(IdStage_io_memH2Id_wbData),
    .io_wbH2Id_regWrite(IdStage_io_wbH2Id_regWrite),
    .io_wbH2Id_writeReg(IdStage_io_wbH2Id_writeReg),
    .io_wbH2Id_wbData(IdStage_io_wbH2Id_wbData),
    .io_bubble(IdStage_io_bubble)
  );
  ysyx_210669_EX ExStage ( // @[SimTop.scala 60:27]
    .clock(ExStage_clock),
    .reset(ExStage_reset),
    .io_instValid(ExStage_io_instValid),
    .io_pcResult(ExStage_io_pcResult),
    .io_pcSrc(ExStage_io_pcSrc),
    .io_mipMtip(ExStage_io_mipMtip),
    .io_in_pc(ExStage_io_in_pc),
    .io_in_readData1(ExStage_io_in_readData1),
    .io_in_readData2(ExStage_io_in_readData2),
    .io_in_csrAddr(ExStage_io_in_csrAddr),
    .io_in_imm(ExStage_io_in_imm),
    .io_in_writeReg(ExStage_io_in_writeReg),
    .io_in_addSrc(ExStage_io_in_addSrc),
    .io_in_aluSrc(ExStage_io_in_aluSrc),
    .io_in_shiftByte(ExStage_io_in_shiftByte),
    .io_in_aluOp(ExStage_io_in_aluOp),
    .io_in_branch(ExStage_io_in_branch),
    .io_in_resultSrc(ExStage_io_in_resultSrc),
    .io_in_csrOp(ExStage_io_in_csrOp),
    .io_in_memWrite(ExStage_io_in_memWrite),
    .io_in_memRead(ExStage_io_in_memRead),
    .io_in_sExtend(ExStage_io_in_sExtend),
    .io_in_lsByte(ExStage_io_in_lsByte),
    .io_in_memtoReg(ExStage_io_in_memtoReg),
    .io_in_regWrite(ExStage_io_in_regWrite),
    .io_out_result(ExStage_io_out_result),
    .io_out_dataOutput(ExStage_io_out_dataOutput),
    .io_out_writeReg(ExStage_io_out_writeReg),
    .io_out_memWrite(ExStage_io_out_memWrite),
    .io_out_memRead(ExStage_io_out_memRead),
    .io_out_sExtend(ExStage_io_out_sExtend),
    .io_out_lsByte(ExStage_io_out_lsByte),
    .io_out_memtoReg(ExStage_io_out_memtoReg),
    .io_out_regWrite(ExStage_io_out_regWrite),
    .io_exH2Id_regWrite(ExStage_io_exH2Id_regWrite),
    .io_exH2Id_writeReg(ExStage_io_exH2Id_writeReg),
    .io_exH2Id_exLoad(ExStage_io_exH2Id_exLoad),
    .io_exH2Id_wbData(ExStage_io_exH2Id_wbData),
    .io_load(ExStage_io_load)
  );
  ysyx_210669_MEM MemStage ( // @[SimTop.scala 61:29]
    .clock(MemStage_clock),
    .reset(MemStage_reset),
    .io_in_address(MemStage_io_in_address),
    .io_in_writeData(MemStage_io_in_writeData),
    .io_in_writeReg(MemStage_io_in_writeReg),
    .io_in_memWrite(MemStage_io_in_memWrite),
    .io_in_memRead(MemStage_io_in_memRead),
    .io_in_sExtend(MemStage_io_in_sExtend),
    .io_in_lsByte(MemStage_io_in_lsByte),
    .io_in_memtoReg(MemStage_io_in_memtoReg),
    .io_in_regWrite(MemStage_io_in_regWrite),
    .io_out_readData(MemStage_io_out_readData),
    .io_out_extendResult(MemStage_io_out_extendResult),
    .io_out_writeReg(MemStage_io_out_writeReg),
    .io_out_memtoReg(MemStage_io_out_memtoReg),
    .io_out_regWrite(MemStage_io_out_regWrite),
    .io_memH2Id_regWrite(MemStage_io_memH2Id_regWrite),
    .io_memH2Id_writeReg(MemStage_io_memH2Id_writeReg),
    .io_memH2Id_wbData(MemStage_io_memH2Id_wbData),
    .io_mipMtip(MemStage_io_mipMtip),
    .io_rw_valid(MemStage_io_rw_valid),
    .io_rw_ready(MemStage_io_rw_ready),
    .io_rw_addr(MemStage_io_rw_addr),
    .io_rw_ren(MemStage_io_rw_ren),
    .io_rw_rdata(MemStage_io_rw_rdata),
    .io_rw_size(MemStage_io_rw_size),
    .io_rw_wen(MemStage_io_rw_wen),
    .io_rw_wdata(MemStage_io_rw_wdata),
    .io_rw_wmask(MemStage_io_rw_wmask),
    .io_runAXI(MemStage_io_runAXI),
    .io_rwValid(MemStage_io_rwValid),
    .io_waitAXI(MemStage_io_waitAXI)
  );
  ysyx_210669_WB WbStage ( // @[SimTop.scala 62:27]
    .io_writeData(WbStage_io_writeData),
    .io_writeReg(WbStage_io_writeReg),
    .io_regWrite(WbStage_io_regWrite),
    .io_in_memData(WbStage_io_in_memData),
    .io_in_aluData(WbStage_io_in_aluData),
    .io_in_memtoReg(WbStage_io_in_memtoReg),
    .io_in_writeReg(WbStage_io_in_writeReg),
    .io_in_regWrite(WbStage_io_in_regWrite),
    .io_wbH2Id_regWrite(WbStage_io_wbH2Id_regWrite),
    .io_wbH2Id_writeReg(WbStage_io_wbH2Id_writeReg),
    .io_wbH2Id_wbData(WbStage_io_wbH2Id_wbData)
  );
  ysyx_210669_IFID IfId ( // @[SimTop.scala 69:26]
    .clock(IfId_clock),
    .io_en(IfId_io_en),
    .io_reset(IfId_io_reset),
    .io_in_inst(IfId_io_in_inst),
    .io_in_pc(IfId_io_in_pc),
    .io_in_instType(IfId_io_in_instType),
    .io_in_branch(IfId_io_in_branch),
    .io_in_regWrite(IfId_io_in_regWrite),
    .io_in_aluSrc(IfId_io_in_aluSrc),
    .io_in_aluOp(IfId_io_in_aluOp),
    .io_in_memWrite(IfId_io_in_memWrite),
    .io_in_memRead(IfId_io_in_memRead),
    .io_in_sExtend(IfId_io_in_sExtend),
    .io_in_lsByte(IfId_io_in_lsByte),
    .io_in_memtoReg(IfId_io_in_memtoReg),
    .io_in_shiftByte(IfId_io_in_shiftByte),
    .io_in_resultSrc(IfId_io_in_resultSrc),
    .io_in_addSrc(IfId_io_in_addSrc),
    .io_in_csrOp(IfId_io_in_csrOp),
    .io_out_inst(IfId_io_out_inst),
    .io_out_pc(IfId_io_out_pc),
    .io_out_instType(IfId_io_out_instType),
    .io_out_branch(IfId_io_out_branch),
    .io_out_aluSrc(IfId_io_out_aluSrc),
    .io_out_aluOp(IfId_io_out_aluOp),
    .io_out_memWrite(IfId_io_out_memWrite),
    .io_out_memRead(IfId_io_out_memRead),
    .io_out_sExtend(IfId_io_out_sExtend),
    .io_out_lsByte(IfId_io_out_lsByte),
    .io_out_memtoReg(IfId_io_out_memtoReg),
    .io_out_shiftByte(IfId_io_out_shiftByte),
    .io_out_resultSrc(IfId_io_out_resultSrc),
    .io_out_addSrc(IfId_io_out_addSrc),
    .io_out_csrOp(IfId_io_out_csrOp),
    .io_out_regWrite(IfId_io_out_regWrite)
  );
  ysyx_210669_IDEX IdEx ( // @[SimTop.scala 74:26]
    .clock(IdEx_clock),
    .io_en(IdEx_io_en),
    .io_reset(IdEx_io_reset),
    .io_in_pc(IdEx_io_in_pc),
    .io_in_readData1(IdEx_io_in_readData1),
    .io_in_readData2(IdEx_io_in_readData2),
    .io_in_csrAddr(IdEx_io_in_csrAddr),
    .io_in_imm(IdEx_io_in_imm),
    .io_in_writeReg(IdEx_io_in_writeReg),
    .io_in_branch(IdEx_io_in_branch),
    .io_in_aluSrc(IdEx_io_in_aluSrc),
    .io_in_aluOp(IdEx_io_in_aluOp),
    .io_in_memWrite(IdEx_io_in_memWrite),
    .io_in_memRead(IdEx_io_in_memRead),
    .io_in_sExtend(IdEx_io_in_sExtend),
    .io_in_lsByte(IdEx_io_in_lsByte),
    .io_in_memtoReg(IdEx_io_in_memtoReg),
    .io_in_shiftByte(IdEx_io_in_shiftByte),
    .io_in_resultSrc(IdEx_io_in_resultSrc),
    .io_in_addSrc(IdEx_io_in_addSrc),
    .io_in_csrOp(IdEx_io_in_csrOp),
    .io_in_regWrite(IdEx_io_in_regWrite),
    .io_out_pc(IdEx_io_out_pc),
    .io_out_readData1(IdEx_io_out_readData1),
    .io_out_readData2(IdEx_io_out_readData2),
    .io_out_csrAddr(IdEx_io_out_csrAddr),
    .io_out_imm(IdEx_io_out_imm),
    .io_out_writeReg(IdEx_io_out_writeReg),
    .io_out_addSrc(IdEx_io_out_addSrc),
    .io_out_aluSrc(IdEx_io_out_aluSrc),
    .io_out_shiftByte(IdEx_io_out_shiftByte),
    .io_out_aluOp(IdEx_io_out_aluOp),
    .io_out_branch(IdEx_io_out_branch),
    .io_out_resultSrc(IdEx_io_out_resultSrc),
    .io_out_csrOp(IdEx_io_out_csrOp),
    .io_out_memWrite(IdEx_io_out_memWrite),
    .io_out_memRead(IdEx_io_out_memRead),
    .io_out_sExtend(IdEx_io_out_sExtend),
    .io_out_lsByte(IdEx_io_out_lsByte),
    .io_out_memtoReg(IdEx_io_out_memtoReg),
    .io_out_regWrite(IdEx_io_out_regWrite)
  );
  ysyx_210669_EXMEM ExMem ( // @[SimTop.scala 80:28]
    .clock(ExMem_clock),
    .io_en(ExMem_io_en),
    .io_reset(ExMem_io_reset),
    .io_in_result(ExMem_io_in_result),
    .io_in_dataOutput(ExMem_io_in_dataOutput),
    .io_in_writeReg(ExMem_io_in_writeReg),
    .io_in_memWrite(ExMem_io_in_memWrite),
    .io_in_memRead(ExMem_io_in_memRead),
    .io_in_sExtend(ExMem_io_in_sExtend),
    .io_in_lsByte(ExMem_io_in_lsByte),
    .io_in_memtoReg(ExMem_io_in_memtoReg),
    .io_in_regWrite(ExMem_io_in_regWrite),
    .io_out_address(ExMem_io_out_address),
    .io_out_writeData(ExMem_io_out_writeData),
    .io_out_writeReg(ExMem_io_out_writeReg),
    .io_out_memWrite(ExMem_io_out_memWrite),
    .io_out_memRead(ExMem_io_out_memRead),
    .io_out_sExtend(ExMem_io_out_sExtend),
    .io_out_lsByte(ExMem_io_out_lsByte),
    .io_out_memtoReg(ExMem_io_out_memtoReg),
    .io_out_regWrite(ExMem_io_out_regWrite)
  );
  ysyx_210669_MEMWB MemWb ( // @[SimTop.scala 85:28]
    .clock(MemWb_clock),
    .io_en(MemWb_io_en),
    .io_reset(MemWb_io_reset),
    .io_in_readData(MemWb_io_in_readData),
    .io_in_extendResult(MemWb_io_in_extendResult),
    .io_in_writeReg(MemWb_io_in_writeReg),
    .io_in_memtoReg(MemWb_io_in_memtoReg),
    .io_in_regWrite(MemWb_io_in_regWrite),
    .io_out_memData(MemWb_io_out_memData),
    .io_out_aluData(MemWb_io_out_aluData),
    .io_out_memtoReg(MemWb_io_out_memtoReg),
    .io_out_writeReg(MemWb_io_out_writeReg),
    .io_out_regWrite(MemWb_io_out_regWrite)
  );
  ysyx_210669_CrossBar crossbar ( // @[SimTop.scala 126:34]
    .clock(crossbar_clock),
    .reset(crossbar_reset),
    .io_in_0_ar_ready(crossbar_io_in_0_ar_ready),
    .io_in_0_ar_valid(crossbar_io_in_0_ar_valid),
    .io_in_0_ar_bits_addr(crossbar_io_in_0_ar_bits_addr),
    .io_in_0_r_ready(crossbar_io_in_0_r_ready),
    .io_in_0_r_valid(crossbar_io_in_0_r_valid),
    .io_in_0_r_bits_data(crossbar_io_in_0_r_bits_data),
    .io_in_0_r_bits_id(crossbar_io_in_0_r_bits_id),
    .io_in_0_r_bits_last(crossbar_io_in_0_r_bits_last),
    .io_in_1_aw_ready(crossbar_io_in_1_aw_ready),
    .io_in_1_aw_valid(crossbar_io_in_1_aw_valid),
    .io_in_1_aw_bits_addr(crossbar_io_in_1_aw_bits_addr),
    .io_in_1_aw_bits_size(crossbar_io_in_1_aw_bits_size),
    .io_in_1_w_ready(crossbar_io_in_1_w_ready),
    .io_in_1_w_valid(crossbar_io_in_1_w_valid),
    .io_in_1_w_bits_data(crossbar_io_in_1_w_bits_data),
    .io_in_1_w_bits_strb(crossbar_io_in_1_w_bits_strb),
    .io_in_1_b_ready(crossbar_io_in_1_b_ready),
    .io_in_1_b_valid(crossbar_io_in_1_b_valid),
    .io_in_1_b_bits_id(crossbar_io_in_1_b_bits_id),
    .io_in_1_b_bits_resp(crossbar_io_in_1_b_bits_resp),
    .io_in_1_ar_ready(crossbar_io_in_1_ar_ready),
    .io_in_1_ar_valid(crossbar_io_in_1_ar_valid),
    .io_in_1_ar_bits_addr(crossbar_io_in_1_ar_bits_addr),
    .io_in_1_ar_bits_size(crossbar_io_in_1_ar_bits_size),
    .io_in_1_r_ready(crossbar_io_in_1_r_ready),
    .io_in_1_r_valid(crossbar_io_in_1_r_valid),
    .io_in_1_r_bits_data(crossbar_io_in_1_r_bits_data),
    .io_in_1_r_bits_id(crossbar_io_in_1_r_bits_id),
    .io_in_1_r_bits_last(crossbar_io_in_1_r_bits_last),
    .io_out_aw_ready(crossbar_io_out_aw_ready),
    .io_out_aw_valid(crossbar_io_out_aw_valid),
    .io_out_aw_bits_addr(crossbar_io_out_aw_bits_addr),
    .io_out_aw_bits_size(crossbar_io_out_aw_bits_size),
    .io_out_w_ready(crossbar_io_out_w_ready),
    .io_out_w_valid(crossbar_io_out_w_valid),
    .io_out_w_bits_data(crossbar_io_out_w_bits_data),
    .io_out_w_bits_strb(crossbar_io_out_w_bits_strb),
    .io_out_b_ready(crossbar_io_out_b_ready),
    .io_out_b_valid(crossbar_io_out_b_valid),
    .io_out_b_bits_id(crossbar_io_out_b_bits_id),
    .io_out_b_bits_resp(crossbar_io_out_b_bits_resp),
    .io_out_ar_ready(crossbar_io_out_ar_ready),
    .io_out_ar_valid(crossbar_io_out_ar_valid),
    .io_out_ar_bits_addr(crossbar_io_out_ar_bits_addr),
    .io_out_ar_bits_id(crossbar_io_out_ar_bits_id),
    .io_out_ar_bits_size(crossbar_io_out_ar_bits_size),
    .io_out_r_ready(crossbar_io_out_r_ready),
    .io_out_r_valid(crossbar_io_out_r_valid),
    .io_out_r_bits_data(crossbar_io_out_r_bits_data),
    .io_out_r_bits_id(crossbar_io_out_r_bits_id),
    .io_out_r_bits_last(crossbar_io_out_r_bits_last)
  );
  ysyx_210669_AXIrw IfAxiRw ( // @[SimTop.scala 127:30]
    .clock(IfAxiRw_clock),
    .reset(IfAxiRw_reset),
    .io_in_valid(IfAxiRw_io_in_valid),
    .io_in_ready(IfAxiRw_io_in_ready),
    .io_in_addr(IfAxiRw_io_in_addr),
    .io_in_rdata(IfAxiRw_io_in_rdata),
    .io_out_ar_ready(IfAxiRw_io_out_ar_ready),
    .io_out_ar_valid(IfAxiRw_io_out_ar_valid),
    .io_out_ar_bits_addr(IfAxiRw_io_out_ar_bits_addr),
    .io_out_r_ready(IfAxiRw_io_out_r_ready),
    .io_out_r_valid(IfAxiRw_io_out_r_valid),
    .io_out_r_bits_data(IfAxiRw_io_out_r_bits_data),
    .io_out_r_bits_id(IfAxiRw_io_out_r_bits_id),
    .io_out_r_bits_last(IfAxiRw_io_out_r_bits_last)
  );
  ysyx_210669_AXIrw_1 MemAxiRw ( // @[SimTop.scala 132:31]
    .clock(MemAxiRw_clock),
    .reset(MemAxiRw_reset),
    .io_in_valid(MemAxiRw_io_in_valid),
    .io_in_ready(MemAxiRw_io_in_ready),
    .io_in_addr(MemAxiRw_io_in_addr),
    .io_in_ren(MemAxiRw_io_in_ren),
    .io_in_rdata(MemAxiRw_io_in_rdata),
    .io_in_size(MemAxiRw_io_in_size),
    .io_in_wen(MemAxiRw_io_in_wen),
    .io_in_wdata(MemAxiRw_io_in_wdata),
    .io_in_wmask(MemAxiRw_io_in_wmask),
    .io_out_aw_ready(MemAxiRw_io_out_aw_ready),
    .io_out_aw_valid(MemAxiRw_io_out_aw_valid),
    .io_out_aw_bits_addr(MemAxiRw_io_out_aw_bits_addr),
    .io_out_aw_bits_size(MemAxiRw_io_out_aw_bits_size),
    .io_out_w_ready(MemAxiRw_io_out_w_ready),
    .io_out_w_valid(MemAxiRw_io_out_w_valid),
    .io_out_w_bits_data(MemAxiRw_io_out_w_bits_data),
    .io_out_w_bits_strb(MemAxiRw_io_out_w_bits_strb),
    .io_out_b_ready(MemAxiRw_io_out_b_ready),
    .io_out_b_valid(MemAxiRw_io_out_b_valid),
    .io_out_b_bits_id(MemAxiRw_io_out_b_bits_id),
    .io_out_b_bits_resp(MemAxiRw_io_out_b_bits_resp),
    .io_out_ar_ready(MemAxiRw_io_out_ar_ready),
    .io_out_ar_valid(MemAxiRw_io_out_ar_valid),
    .io_out_ar_bits_addr(MemAxiRw_io_out_ar_bits_addr),
    .io_out_ar_bits_size(MemAxiRw_io_out_ar_bits_size),
    .io_out_r_ready(MemAxiRw_io_out_r_ready),
    .io_out_r_valid(MemAxiRw_io_out_r_valid),
    .io_out_r_bits_data(MemAxiRw_io_out_r_bits_data),
    .io_out_r_bits_id(MemAxiRw_io_out_r_bits_id),
    .io_out_r_bits_last(MemAxiRw_io_out_r_bits_last)
  );
  assign io_master_awvalid = crossbar_io_out_aw_valid; // @[SimTop.scala 141:21]
  assign io_master_awaddr = crossbar_io_out_aw_bits_addr; // @[SimTop.scala 142:20]
  assign io_master_awid = 4'h2; // @[SimTop.scala 143:18]
  assign io_master_awlen = 8'h0; // @[SimTop.scala 144:19]
  assign io_master_awsize = crossbar_io_out_aw_bits_size; // @[SimTop.scala 145:20]
  assign io_master_awburst = 2'h1; // @[SimTop.scala 146:20]
  assign io_master_wvalid = crossbar_io_out_w_valid; // @[SimTop.scala 149:20]
  assign io_master_wdata = crossbar_io_out_w_bits_data; // @[SimTop.scala 150:19]
  assign io_master_wstrb = crossbar_io_out_w_bits_strb; // @[SimTop.scala 151:19]
  assign io_master_wlast = 1'h1; // @[SimTop.scala 152:19]
  assign io_master_bready = crossbar_io_out_b_ready; // @[SimTop.scala 154:20]
  assign io_master_arvalid = crossbar_io_out_ar_valid; // @[SimTop.scala 161:21]
  assign io_master_araddr = crossbar_io_out_ar_bits_addr; // @[SimTop.scala 162:20]
  assign io_master_arid = crossbar_io_out_ar_bits_id; // @[SimTop.scala 163:18]
  assign io_master_arlen = 8'h0; // @[SimTop.scala 164:19]
  assign io_master_arsize = crossbar_io_out_ar_bits_size; // @[SimTop.scala 165:20]
  assign io_master_arburst = 2'h1; // @[SimTop.scala 166:21]
  assign io_master_rready = crossbar_io_out_r_ready; // @[SimTop.scala 168:20]
  assign io_slave_awready = 1'h0;
  assign io_slave_wready = 1'h0;
  assign io_slave_bvalid = 1'h0;
  assign io_slave_bresp = 2'h0;
  assign io_slave_bid = 4'h0;
  assign io_slave_arready = 1'h0;
  assign io_slave_rvalid = 1'h0;
  assign io_slave_rresp = 2'h0;
  assign io_slave_rdata = 64'h0;
  assign io_slave_rlast = 1'h0;
  assign io_slave_rid = 4'h0;
  assign IfStage_clock = clock;
  assign IfStage_reset = reset;
  assign IfStage_io_pcIn = ExStage_io_pcResult; // @[SimTop.scala 90:19]
  assign IfStage_io_pcEn = ~(bubble | cpuWait); // @[SimTop.scala 108:22]
  assign IfStage_io_pcSrc = ExStage_io_pcSrc; // @[SimTop.scala 91:20]
  assign IfStage_io_rw_ready = IfAxiRw_io_in_ready; // @[SimTop.scala 128:17]
  assign IfStage_io_rw_rdata = IfAxiRw_io_in_rdata; // @[SimTop.scala 128:17]
  assign IfStage_io_rwValid = reset | _GEN_12; // @[SimTop.scala 195:23 SimTop.scala 196:13]
  assign IdStage_clock = clock;
  assign IdStage_reset = reset;
  assign IdStage_io_writeData = WbStage_io_writeData; // @[SimTop.scala 92:24]
  assign IdStage_io_writeReg = WbStage_io_writeReg; // @[SimTop.scala 93:23]
  assign IdStage_io_regWrite = WbStage_io_regWrite & ~cpuWait; // @[SimTop.scala 94:46]
  assign IdStage_io_in_inst = IfId_io_out_inst; // @[SimTop.scala 71:15]
  assign IdStage_io_in_pc = IfId_io_out_pc; // @[SimTop.scala 71:15]
  assign IdStage_io_in_instType = IfId_io_out_instType; // @[SimTop.scala 71:15]
  assign IdStage_io_in_branch = IfId_io_out_branch; // @[SimTop.scala 71:15]
  assign IdStage_io_in_aluSrc = IfId_io_out_aluSrc; // @[SimTop.scala 71:15]
  assign IdStage_io_in_aluOp = IfId_io_out_aluOp; // @[SimTop.scala 71:15]
  assign IdStage_io_in_memWrite = IfId_io_out_memWrite; // @[SimTop.scala 71:15]
  assign IdStage_io_in_memRead = IfId_io_out_memRead; // @[SimTop.scala 71:15]
  assign IdStage_io_in_sExtend = IfId_io_out_sExtend; // @[SimTop.scala 71:15]
  assign IdStage_io_in_lsByte = IfId_io_out_lsByte; // @[SimTop.scala 71:15]
  assign IdStage_io_in_memtoReg = IfId_io_out_memtoReg; // @[SimTop.scala 71:15]
  assign IdStage_io_in_shiftByte = IfId_io_out_shiftByte; // @[SimTop.scala 71:15]
  assign IdStage_io_in_resultSrc = IfId_io_out_resultSrc; // @[SimTop.scala 71:15]
  assign IdStage_io_in_addSrc = IfId_io_out_addSrc; // @[SimTop.scala 71:15]
  assign IdStage_io_in_csrOp = IfId_io_out_csrOp; // @[SimTop.scala 71:15]
  assign IdStage_io_in_regWrite = IfId_io_out_regWrite; // @[SimTop.scala 71:15]
  assign IdStage_io_exH2Id_regWrite = ExStage_io_exH2Id_regWrite; // @[SimTop.scala 101:21]
  assign IdStage_io_exH2Id_writeReg = ExStage_io_exH2Id_writeReg; // @[SimTop.scala 101:21]
  assign IdStage_io_exH2Id_exLoad = ExStage_io_exH2Id_exLoad; // @[SimTop.scala 101:21]
  assign IdStage_io_exH2Id_wbData = ExStage_io_exH2Id_wbData; // @[SimTop.scala 101:21]
  assign IdStage_io_memH2Id_regWrite = MemStage_io_memH2Id_regWrite; // @[SimTop.scala 103:22]
  assign IdStage_io_memH2Id_writeReg = MemStage_io_memH2Id_writeReg; // @[SimTop.scala 103:22]
  assign IdStage_io_memH2Id_wbData = MemStage_io_memH2Id_wbData; // @[SimTop.scala 103:22]
  assign IdStage_io_wbH2Id_regWrite = WbStage_io_wbH2Id_regWrite; // @[SimTop.scala 105:21]
  assign IdStage_io_wbH2Id_writeReg = WbStage_io_wbH2Id_writeReg; // @[SimTop.scala 105:21]
  assign IdStage_io_wbH2Id_wbData = WbStage_io_wbH2Id_wbData; // @[SimTop.scala 105:21]
  assign ExStage_clock = clock;
  assign ExStage_reset = reset;
  assign ExStage_io_instValid = ~cpuWait; // @[SimTop.scala 95:27]
  assign ExStage_io_mipMtip = MemStage_io_mipMtip; // @[SimTop.scala 96:22]
  assign ExStage_io_in_pc = IdEx_io_out_pc; // @[SimTop.scala 76:15]
  assign ExStage_io_in_readData1 = IdEx_io_out_readData1; // @[SimTop.scala 76:15]
  assign ExStage_io_in_readData2 = IdEx_io_out_readData2; // @[SimTop.scala 76:15]
  assign ExStage_io_in_csrAddr = IdEx_io_out_csrAddr; // @[SimTop.scala 76:15]
  assign ExStage_io_in_imm = IdEx_io_out_imm; // @[SimTop.scala 76:15]
  assign ExStage_io_in_writeReg = IdEx_io_out_writeReg; // @[SimTop.scala 76:15]
  assign ExStage_io_in_addSrc = IdEx_io_out_addSrc; // @[SimTop.scala 76:15]
  assign ExStage_io_in_aluSrc = IdEx_io_out_aluSrc; // @[SimTop.scala 76:15]
  assign ExStage_io_in_shiftByte = IdEx_io_out_shiftByte; // @[SimTop.scala 76:15]
  assign ExStage_io_in_aluOp = IdEx_io_out_aluOp; // @[SimTop.scala 76:15]
  assign ExStage_io_in_branch = IdEx_io_out_branch; // @[SimTop.scala 76:15]
  assign ExStage_io_in_resultSrc = IdEx_io_out_resultSrc; // @[SimTop.scala 76:15]
  assign ExStage_io_in_csrOp = IdEx_io_out_csrOp; // @[SimTop.scala 76:15]
  assign ExStage_io_in_memWrite = IdEx_io_out_memWrite; // @[SimTop.scala 76:15]
  assign ExStage_io_in_memRead = IdEx_io_out_memRead; // @[SimTop.scala 76:15]
  assign ExStage_io_in_sExtend = IdEx_io_out_sExtend; // @[SimTop.scala 76:15]
  assign ExStage_io_in_lsByte = IdEx_io_out_lsByte; // @[SimTop.scala 76:15]
  assign ExStage_io_in_memtoReg = IdEx_io_out_memtoReg; // @[SimTop.scala 76:15]
  assign ExStage_io_in_regWrite = IdEx_io_out_regWrite; // @[SimTop.scala 76:15]
  assign MemStage_clock = clock;
  assign MemStage_reset = reset;
  assign MemStage_io_in_address = ExMem_io_out_address; // @[SimTop.scala 82:16]
  assign MemStage_io_in_writeData = ExMem_io_out_writeData; // @[SimTop.scala 82:16]
  assign MemStage_io_in_writeReg = ExMem_io_out_writeReg; // @[SimTop.scala 82:16]
  assign MemStage_io_in_memWrite = ExMem_io_out_memWrite; // @[SimTop.scala 82:16]
  assign MemStage_io_in_memRead = ExMem_io_out_memRead; // @[SimTop.scala 82:16]
  assign MemStage_io_in_sExtend = ExMem_io_out_sExtend; // @[SimTop.scala 82:16]
  assign MemStage_io_in_lsByte = ExMem_io_out_lsByte; // @[SimTop.scala 82:16]
  assign MemStage_io_in_memtoReg = ExMem_io_out_memtoReg; // @[SimTop.scala 82:16]
  assign MemStage_io_in_regWrite = ExMem_io_out_regWrite; // @[SimTop.scala 82:16]
  assign MemStage_io_rw_ready = MemAxiRw_io_in_ready; // @[SimTop.scala 133:18]
  assign MemStage_io_rw_rdata = MemAxiRw_io_in_rdata; // @[SimTop.scala 133:18]
  assign MemStage_io_rwValid = reset ? 1'h0 : _GEN_13; // @[SimTop.scala 195:23 SimTop.scala 197:14]
  assign WbStage_io_in_memData = MemWb_io_out_memData; // @[SimTop.scala 87:16]
  assign WbStage_io_in_aluData = MemWb_io_out_aluData; // @[SimTop.scala 87:16]
  assign WbStage_io_in_memtoReg = MemWb_io_out_memtoReg; // @[SimTop.scala 87:16]
  assign WbStage_io_in_writeReg = MemWb_io_out_writeReg; // @[SimTop.scala 87:16]
  assign WbStage_io_in_regWrite = MemWb_io_out_regWrite; // @[SimTop.scala 87:16]
  assign IfId_clock = clock;
  assign IfId_io_en = ~_IfStage_io_pcEn_T; // @[SimTop.scala 109:17]
  assign IfId_io_reset = ifidreset | reset; // @[SimTop.scala 116:30]
  assign IfId_io_in_inst = IfStage_io_out_inst; // @[SimTop.scala 70:18]
  assign IfId_io_in_pc = IfStage_io_out_pc; // @[SimTop.scala 70:18]
  assign IfId_io_in_instType = IfStage_io_out_instType; // @[SimTop.scala 70:18]
  assign IfId_io_in_branch = IfStage_io_out_branch; // @[SimTop.scala 70:18]
  assign IfId_io_in_regWrite = IfStage_io_out_regWrite; // @[SimTop.scala 70:18]
  assign IfId_io_in_aluSrc = IfStage_io_out_aluSrc; // @[SimTop.scala 70:18]
  assign IfId_io_in_aluOp = IfStage_io_out_aluOp; // @[SimTop.scala 70:18]
  assign IfId_io_in_memWrite = IfStage_io_out_memWrite; // @[SimTop.scala 70:18]
  assign IfId_io_in_memRead = IfStage_io_out_memRead; // @[SimTop.scala 70:18]
  assign IfId_io_in_sExtend = IfStage_io_out_sExtend; // @[SimTop.scala 70:18]
  assign IfId_io_in_lsByte = IfStage_io_out_lsByte; // @[SimTop.scala 70:18]
  assign IfId_io_in_memtoReg = IfStage_io_out_memtoReg; // @[SimTop.scala 70:18]
  assign IfId_io_in_shiftByte = IfStage_io_out_shiftByte; // @[SimTop.scala 70:18]
  assign IfId_io_in_resultSrc = IfStage_io_out_resultSrc; // @[SimTop.scala 70:18]
  assign IfId_io_in_addSrc = IfStage_io_out_addSrc; // @[SimTop.scala 70:18]
  assign IfId_io_in_csrOp = IfStage_io_out_csrOp; // @[SimTop.scala 70:18]
  assign IdEx_clock = clock;
  assign IdEx_io_en = ~cpuWait; // @[SimTop.scala 110:17]
  assign IdEx_io_reset = idexreset | reset; // @[SimTop.scala 117:30]
  assign IdEx_io_in_pc = IdStage_io_out_pc; // @[SimTop.scala 75:18]
  assign IdEx_io_in_readData1 = IdStage_io_out_readData1; // @[SimTop.scala 75:18]
  assign IdEx_io_in_readData2 = IdStage_io_out_readData2; // @[SimTop.scala 75:18]
  assign IdEx_io_in_csrAddr = IdStage_io_out_csrAddr; // @[SimTop.scala 75:18]
  assign IdEx_io_in_imm = IdStage_io_out_imm; // @[SimTop.scala 75:18]
  assign IdEx_io_in_writeReg = IdStage_io_out_writeReg; // @[SimTop.scala 75:18]
  assign IdEx_io_in_branch = IdStage_io_out_branch; // @[SimTop.scala 75:18]
  assign IdEx_io_in_aluSrc = IdStage_io_out_aluSrc; // @[SimTop.scala 75:18]
  assign IdEx_io_in_aluOp = IdStage_io_out_aluOp; // @[SimTop.scala 75:18]
  assign IdEx_io_in_memWrite = IdStage_io_out_memWrite; // @[SimTop.scala 75:18]
  assign IdEx_io_in_memRead = IdStage_io_out_memRead; // @[SimTop.scala 75:18]
  assign IdEx_io_in_sExtend = IdStage_io_out_sExtend; // @[SimTop.scala 75:18]
  assign IdEx_io_in_lsByte = IdStage_io_out_lsByte; // @[SimTop.scala 75:18]
  assign IdEx_io_in_memtoReg = IdStage_io_out_memtoReg; // @[SimTop.scala 75:18]
  assign IdEx_io_in_shiftByte = IdStage_io_out_shiftByte; // @[SimTop.scala 75:18]
  assign IdEx_io_in_resultSrc = IdStage_io_out_resultSrc; // @[SimTop.scala 75:18]
  assign IdEx_io_in_addSrc = IdStage_io_out_addSrc; // @[SimTop.scala 75:18]
  assign IdEx_io_in_csrOp = IdStage_io_out_csrOp; // @[SimTop.scala 75:18]
  assign IdEx_io_in_regWrite = IdStage_io_out_regWrite; // @[SimTop.scala 75:18]
  assign ExMem_clock = clock;
  assign ExMem_io_en = ~cpuWait; // @[SimTop.scala 111:18]
  assign ExMem_io_reset = reset; // @[SimTop.scala 118:18]
  assign ExMem_io_in_result = ExStage_io_out_result; // @[SimTop.scala 81:18]
  assign ExMem_io_in_dataOutput = ExStage_io_out_dataOutput; // @[SimTop.scala 81:18]
  assign ExMem_io_in_writeReg = ExStage_io_out_writeReg; // @[SimTop.scala 81:18]
  assign ExMem_io_in_memWrite = ExStage_io_out_memWrite; // @[SimTop.scala 81:18]
  assign ExMem_io_in_memRead = ExStage_io_out_memRead; // @[SimTop.scala 81:18]
  assign ExMem_io_in_sExtend = ExStage_io_out_sExtend; // @[SimTop.scala 81:18]
  assign ExMem_io_in_lsByte = ExStage_io_out_lsByte; // @[SimTop.scala 81:18]
  assign ExMem_io_in_memtoReg = ExStage_io_out_memtoReg; // @[SimTop.scala 81:18]
  assign ExMem_io_in_regWrite = ExStage_io_out_regWrite; // @[SimTop.scala 81:18]
  assign MemWb_clock = clock;
  assign MemWb_io_en = ~cpuWait; // @[SimTop.scala 112:18]
  assign MemWb_io_reset = reset; // @[SimTop.scala 119:18]
  assign MemWb_io_in_readData = MemStage_io_out_readData; // @[SimTop.scala 86:19]
  assign MemWb_io_in_extendResult = MemStage_io_out_extendResult; // @[SimTop.scala 86:19]
  assign MemWb_io_in_writeReg = MemStage_io_out_writeReg; // @[SimTop.scala 86:19]
  assign MemWb_io_in_memtoReg = MemStage_io_out_memtoReg; // @[SimTop.scala 86:19]
  assign MemWb_io_in_regWrite = MemStage_io_out_regWrite; // @[SimTop.scala 86:19]
  assign crossbar_clock = clock;
  assign crossbar_reset = reset;
  assign crossbar_io_in_0_ar_valid = IfAxiRw_io_out_ar_valid; // @[SimTop.scala 129:21]
  assign crossbar_io_in_0_ar_bits_addr = IfAxiRw_io_out_ar_bits_addr; // @[SimTop.scala 129:21]
  assign crossbar_io_in_0_r_ready = IfAxiRw_io_out_r_ready; // @[SimTop.scala 129:21]
  assign crossbar_io_in_1_aw_valid = MemAxiRw_io_out_aw_valid; // @[SimTop.scala 136:21]
  assign crossbar_io_in_1_aw_bits_addr = MemAxiRw_io_out_aw_bits_addr; // @[SimTop.scala 136:21]
  assign crossbar_io_in_1_aw_bits_size = MemAxiRw_io_out_aw_bits_size; // @[SimTop.scala 136:21]
  assign crossbar_io_in_1_w_valid = MemAxiRw_io_out_w_valid; // @[SimTop.scala 136:21]
  assign crossbar_io_in_1_w_bits_data = MemAxiRw_io_out_w_bits_data; // @[SimTop.scala 136:21]
  assign crossbar_io_in_1_w_bits_strb = MemAxiRw_io_out_w_bits_strb; // @[SimTop.scala 136:21]
  assign crossbar_io_in_1_b_ready = MemAxiRw_io_out_b_ready; // @[SimTop.scala 136:21]
  assign crossbar_io_in_1_ar_valid = MemAxiRw_io_out_ar_valid; // @[SimTop.scala 136:21]
  assign crossbar_io_in_1_ar_bits_addr = MemAxiRw_io_out_ar_bits_addr; // @[SimTop.scala 136:21]
  assign crossbar_io_in_1_ar_bits_size = MemAxiRw_io_out_ar_bits_size; // @[SimTop.scala 136:21]
  assign crossbar_io_in_1_r_ready = MemAxiRw_io_out_r_ready; // @[SimTop.scala 136:21]
  assign crossbar_io_out_aw_ready = io_master_awready; // @[SimTop.scala 140:28]
  assign crossbar_io_out_w_ready = io_master_wready; // @[SimTop.scala 148:27]
  assign crossbar_io_out_b_valid = io_master_bvalid; // @[SimTop.scala 155:27]
  assign crossbar_io_out_b_bits_id = io_master_bid; // @[SimTop.scala 157:29]
  assign crossbar_io_out_b_bits_resp = io_master_bresp; // @[SimTop.scala 156:31]
  assign crossbar_io_out_ar_ready = io_master_arready; // @[SimTop.scala 160:28]
  assign crossbar_io_out_r_valid = io_master_rvalid; // @[SimTop.scala 169:27]
  assign crossbar_io_out_r_bits_data = io_master_rdata; // @[SimTop.scala 171:31]
  assign crossbar_io_out_r_bits_id = io_master_rid; // @[SimTop.scala 173:29]
  assign crossbar_io_out_r_bits_last = io_master_rlast; // @[SimTop.scala 172:31]
  assign IfAxiRw_clock = clock;
  assign IfAxiRw_reset = reset;
  assign IfAxiRw_io_in_valid = IfStage_io_rw_valid; // @[SimTop.scala 128:17]
  assign IfAxiRw_io_in_addr = IfStage_io_rw_addr; // @[SimTop.scala 128:17]
  assign IfAxiRw_io_out_ar_ready = crossbar_io_in_0_ar_ready; // @[SimTop.scala 129:21]
  assign IfAxiRw_io_out_r_valid = crossbar_io_in_0_r_valid; // @[SimTop.scala 129:21]
  assign IfAxiRw_io_out_r_bits_data = crossbar_io_in_0_r_bits_data; // @[SimTop.scala 129:21]
  assign IfAxiRw_io_out_r_bits_id = crossbar_io_in_0_r_bits_id; // @[SimTop.scala 129:21]
  assign IfAxiRw_io_out_r_bits_last = crossbar_io_in_0_r_bits_last; // @[SimTop.scala 129:21]
  assign MemAxiRw_clock = clock;
  assign MemAxiRw_reset = reset;
  assign MemAxiRw_io_in_valid = MemStage_io_rw_valid; // @[SimTop.scala 133:18]
  assign MemAxiRw_io_in_addr = MemStage_io_rw_addr; // @[SimTop.scala 133:18]
  assign MemAxiRw_io_in_ren = MemStage_io_rw_ren; // @[SimTop.scala 133:18]
  assign MemAxiRw_io_in_size = MemStage_io_rw_size; // @[SimTop.scala 133:18]
  assign MemAxiRw_io_in_wen = MemStage_io_rw_wen; // @[SimTop.scala 133:18]
  assign MemAxiRw_io_in_wdata = MemStage_io_rw_wdata; // @[SimTop.scala 133:18]
  assign MemAxiRw_io_in_wmask = MemStage_io_rw_wmask; // @[SimTop.scala 133:18]
  assign MemAxiRw_io_out_aw_ready = crossbar_io_in_1_aw_ready; // @[SimTop.scala 136:21]
  assign MemAxiRw_io_out_w_ready = crossbar_io_in_1_w_ready; // @[SimTop.scala 136:21]
  assign MemAxiRw_io_out_b_valid = crossbar_io_in_1_b_valid; // @[SimTop.scala 136:21]
  assign MemAxiRw_io_out_b_bits_id = crossbar_io_in_1_b_bits_id; // @[SimTop.scala 136:21]
  assign MemAxiRw_io_out_b_bits_resp = crossbar_io_in_1_b_bits_resp; // @[SimTop.scala 136:21]
  assign MemAxiRw_io_out_ar_ready = crossbar_io_in_1_ar_ready; // @[SimTop.scala 136:21]
  assign MemAxiRw_io_out_r_valid = crossbar_io_in_1_r_valid; // @[SimTop.scala 136:21]
  assign MemAxiRw_io_out_r_bits_data = crossbar_io_in_1_r_bits_data; // @[SimTop.scala 136:21]
  assign MemAxiRw_io_out_r_bits_id = crossbar_io_in_1_r_bits_id; // @[SimTop.scala 136:21]
  assign MemAxiRw_io_out_r_bits_last = crossbar_io_in_1_r_bits_last; // @[SimTop.scala 136:21]
  always @(posedge clock) begin
    if (reset) begin // @[SimTop.scala 179:29]
      states <= 2'h1; // @[SimTop.scala 179:29]
    end else if (_T_8) begin // @[Conditional.scala 40:58]
      states <= 2'h1; // @[SimTop.scala 184:20]
    end else if (_T_9) begin // @[Conditional.scala 39:67]
      if (~IfStage_io_waitAXI & MemStage_io_runAXI) begin // @[SimTop.scala 186:54]
        states <= 2'h2; // @[SimTop.scala 187:16]
      end else begin
        states <= _GEN_0;
      end
    end else if (_T_10) begin // @[Conditional.scala 39:67]
      states <= _GEN_2;
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
  states = _RAND_0[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
