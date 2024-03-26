module ysyx_210292_Fetch(
  input         clock,
  input         reset,
  input         io_ENABLE,
  output        io_ifid_Valid,
  output [31:0] io_ifid_Inst,
  output [63:0] io_ifid_PC,
  output [63:0] io_InstFetch_addr,
  input  [31:0] io_InstFetch_data,
  input         io_cancel,
  input         io_nextPC_trap,
  input  [63:0] io_nextPC_mtvec,
  input         io_nextPC_mret,
  input  [63:0] io_nextPC_mepc,
  input         io_nextPC_branch,
  input  [63:0] io_nextPC_target
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  Valid = reset ? 1'h0 : 1'h1; // @[Fetch.scala 23:18]
  reg [63:0] PC; // @[Fetch.scala 25:19]
  wire [63:0] _PC_T_1 = PC + 64'h4; // @[Fetch.scala 39:16]
  wire [63:0] _GEN_0 = io_nextPC_branch ? io_nextPC_target : _PC_T_1; // @[Fetch.scala 36:33 Fetch.scala 37:10 Fetch.scala 39:10]
  assign io_ifid_Valid = io_cancel ? 1'h0 : Valid; // @[Fetch.scala 45:23]
  assign io_ifid_Inst = io_InstFetch_data; // @[Fetch.scala 46:16]
  assign io_ifid_PC = PC; // @[Fetch.scala 47:14]
  assign io_InstFetch_addr = PC; // @[Fetch.scala 52:21]
  always @(posedge clock) begin
    if (reset) begin // @[Fetch.scala 25:19]
      PC <= 64'h30000000; // @[Fetch.scala 25:19]
    end else if (io_ENABLE) begin // @[Fetch.scala 31:19]
      if (io_nextPC_trap) begin // @[Fetch.scala 32:25]
        PC <= io_nextPC_mtvec; // @[Fetch.scala 33:10]
      end else if (io_nextPC_mret) begin // @[Fetch.scala 34:31]
        PC <= io_nextPC_mepc; // @[Fetch.scala 35:10]
      end else begin
        PC <= _GEN_0;
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
  PC = _RAND_0[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210292_Decoder(
  input  [31:0] io_inst,
  output        io_isa_ADD,
  output        io_isa_ADDI,
  output        io_isa_ADDW,
  output        io_isa_ADDIW,
  output        io_isa_SUB,
  output        io_isa_SUBW,
  output        io_isa_LUI,
  output        io_isa_AUIPC,
  output        io_isa_XOR,
  output        io_isa_XORI,
  output        io_isa_OR,
  output        io_isa_ORI,
  output        io_isa_AND,
  output        io_isa_ANDI,
  output        io_isa_SLL,
  output        io_isa_SLLI,
  output        io_isa_SLLW,
  output        io_isa_SLLIW,
  output        io_isa_SRL,
  output        io_isa_SRLI,
  output        io_isa_SRLW,
  output        io_isa_SRLIW,
  output        io_isa_SRA,
  output        io_isa_SRAI,
  output        io_isa_SRAW,
  output        io_isa_SRAIW,
  output        io_isa_SLT,
  output        io_isa_SLTI,
  output        io_isa_SLTU,
  output        io_isa_SLTIU,
  output        io_isa_BEQ,
  output        io_isa_BNE,
  output        io_isa_BLT,
  output        io_isa_BGE,
  output        io_isa_BLTU,
  output        io_isa_BGEU,
  output        io_isa_JAL,
  output        io_isa_JALR,
  output        io_isa_CSRRW,
  output        io_isa_CSRRS,
  output        io_isa_CSRRC,
  output        io_isa_CSRRWI,
  output        io_isa_CSRRSI,
  output        io_isa_CSRRCI,
  output        io_isa_LD,
  output        io_isa_LW,
  output        io_isa_LH,
  output        io_isa_LB,
  output        io_isa_LWU,
  output        io_isa_LHU,
  output        io_isa_LBU,
  output        io_isa_SD,
  output        io_isa_SW,
  output        io_isa_SH,
  output        io_isa_SB,
  output        io_isa_MRET,
  output [63:0] io_imm_I,
  output [63:0] io_imm_B,
  output [63:0] io_imm_S,
  output [63:0] io_imm_U,
  output [63:0] io_imm_J,
  output        io_wen
);
  wire [31:0] _io_isa_SLLI_T = io_inst & 32'hfc00707f; // @[Decoder.scala 17:45]
  wire [31:0] _io_isa_ADDI_T = io_inst & 32'h707f; // @[Decoder.scala 24:45]
  wire [31:0] _io_isa_LUI_T = io_inst & 32'h7f; // @[Decoder.scala 95:45]
  wire  Arithmetic = io_isa_ADD | io_isa_ADDW | io_isa_ADDI | io_isa_ADDIW | io_isa_SUB | io_isa_SUBW | io_isa_LUI |
    io_isa_AUIPC; // @[Decoder.scala 99:127]
  wire  Logical = io_isa_XOR | io_isa_XORI | io_isa_OR | io_isa_ORI | io_isa_AND | io_isa_ANDI; // @[Decoder.scala 100:102]
  wire  Shifts = io_isa_SLL | io_isa_SLLI | io_isa_SLLW | io_isa_SLLIW | io_isa_SRL | io_isa_SRLI | io_isa_SRLW |
    io_isa_SRLIW | io_isa_SRA | io_isa_SRAI | io_isa_SRAW | io_isa_SRAIW; // @[Decoder.scala 101:204]
  wire  Compare = io_isa_SLT | io_isa_SLTI | io_isa_SLTU | io_isa_SLTIU; // @[Decoder.scala 102:76]
  wire  Jump_Link = io_isa_JAL | io_isa_JALR; // @[Decoder.scala 104:46]
  wire  CSR = io_isa_CSRRW | io_isa_CSRRS | io_isa_CSRRC | io_isa_CSRRWI | io_isa_CSRRSI | io_isa_CSRRCI; // @[Decoder.scala 107:130]
  wire  Loads = io_isa_LD | io_isa_LW | io_isa_LH | io_isa_LB | io_isa_LWU | io_isa_LHU | io_isa_LBU; // @[Decoder.scala 108:120]
  wire  _Legal_T_2 = Arithmetic | Logical | Shifts | Compare; // @[Decoder.scala 111:75]
  wire [11:0] I = io_inst[31:20]; // @[Decoder.scala 115:24]
  wire  B_hi_hi_hi = io_inst[31]; // @[Decoder.scala 116:28]
  wire  B_hi_hi_lo = io_inst[7]; // @[Decoder.scala 116:41]
  wire [5:0] B_hi_lo = io_inst[30:25]; // @[Decoder.scala 116:53]
  wire [3:0] B_lo_hi = io_inst[11:8]; // @[Decoder.scala 116:69]
  wire [12:0] B = {B_hi_hi_hi,B_hi_hi_lo,B_hi_lo,B_lo_hi,1'h0}; // @[Cat.scala 30:58]
  wire [6:0] S_hi = io_inst[31:25]; // @[Decoder.scala 117:28]
  wire [4:0] S_lo = io_inst[11:7]; // @[Decoder.scala 117:44]
  wire [11:0] S = {S_hi,S_lo}; // @[Cat.scala 30:58]
  wire [19:0] U_hi = io_inst[31:12]; // @[Decoder.scala 118:28]
  wire [31:0] U = {U_hi,12'h0}; // @[Cat.scala 30:58]
  wire [7:0] J_hi_hi_lo = io_inst[19:12]; // @[Decoder.scala 119:41]
  wire  J_hi_lo = io_inst[20]; // @[Decoder.scala 119:57]
  wire [9:0] J_lo_hi = io_inst[30:21]; // @[Decoder.scala 119:70]
  wire [20:0] J = {B_hi_hi_hi,J_hi_hi_lo,J_hi_lo,J_lo_hi,1'h0}; // @[Cat.scala 30:58]
  wire  io_imm_I_signBit = I[11]; // @[Bundle.scala 220:20]
  wire [51:0] io_imm_I_hi = io_imm_I_signBit ? 52'hfffffffffffff : 52'h0; // @[Bitwise.scala 72:12]
  wire  io_imm_B_signBit = B[12]; // @[Bundle.scala 220:20]
  wire [50:0] io_imm_B_hi = io_imm_B_signBit ? 51'h7ffffffffffff : 51'h0; // @[Bitwise.scala 72:12]
  wire  io_imm_S_signBit = S[11]; // @[Bundle.scala 220:20]
  wire [51:0] io_imm_S_hi = io_imm_S_signBit ? 52'hfffffffffffff : 52'h0; // @[Bitwise.scala 72:12]
  wire  io_imm_U_signBit = U[31]; // @[Bundle.scala 220:20]
  wire [31:0] io_imm_U_hi = io_imm_U_signBit ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire  io_imm_J_signBit = J[20]; // @[Bundle.scala 220:20]
  wire [42:0] io_imm_J_hi = io_imm_J_signBit ? 43'h7ffffffffff : 43'h0; // @[Bitwise.scala 72:12]
  assign io_isa_ADD = 32'h33 == _io_isa_SLLI_T; // @[Decoder.scala 65:37]
  assign io_isa_ADDI = 32'h13 == _io_isa_ADDI_T; // @[Decoder.scala 24:45]
  assign io_isa_ADDW = 32'h3b == _io_isa_SLLI_T; // @[Decoder.scala 66:37]
  assign io_isa_ADDIW = 32'h1b == _io_isa_ADDI_T; // @[Decoder.scala 25:37]
  assign io_isa_SUB = 32'h40000033 == _io_isa_SLLI_T; // @[Decoder.scala 67:37]
  assign io_isa_SUBW = 32'h4000003b == _io_isa_SLLI_T; // @[Decoder.scala 68:37]
  assign io_isa_LUI = 32'h37 == _io_isa_LUI_T; // @[Decoder.scala 95:45]
  assign io_isa_AUIPC = 32'h17 == _io_isa_LUI_T; // @[Decoder.scala 96:37]
  assign io_isa_XOR = 32'h4033 == _io_isa_SLLI_T; // @[Decoder.scala 70:37]
  assign io_isa_XORI = 32'h4013 == _io_isa_ADDI_T; // @[Decoder.scala 27:45]
  assign io_isa_OR = 32'h6033 == _io_isa_SLLI_T; // @[Decoder.scala 71:45]
  assign io_isa_ORI = 32'h6013 == _io_isa_ADDI_T; // @[Decoder.scala 28:45]
  assign io_isa_AND = 32'h7033 == _io_isa_SLLI_T; // @[Decoder.scala 72:37]
  assign io_isa_ANDI = 32'h7013 == _io_isa_ADDI_T; // @[Decoder.scala 29:45]
  assign io_isa_SLL = 32'h1033 == _io_isa_SLLI_T; // @[Decoder.scala 58:37]
  assign io_isa_SLLI = 32'h1013 == _io_isa_SLLI_T; // @[Decoder.scala 17:45]
  assign io_isa_SLLW = 32'h103b == _io_isa_SLLI_T; // @[Decoder.scala 59:37]
  assign io_isa_SLLIW = 32'h101b == _io_isa_SLLI_T; // @[Decoder.scala 18:37]
  assign io_isa_SRL = 32'h5033 == _io_isa_SLLI_T; // @[Decoder.scala 60:37]
  assign io_isa_SRLI = 32'h5013 == _io_isa_SLLI_T; // @[Decoder.scala 19:45]
  assign io_isa_SRLW = 32'h503b == _io_isa_SLLI_T; // @[Decoder.scala 61:37]
  assign io_isa_SRLIW = 32'h501b == _io_isa_SLLI_T; // @[Decoder.scala 20:37]
  assign io_isa_SRA = 32'h40005033 == _io_isa_SLLI_T; // @[Decoder.scala 62:37]
  assign io_isa_SRAI = 32'h40005013 == _io_isa_SLLI_T; // @[Decoder.scala 21:45]
  assign io_isa_SRAW = 32'h4000503b == _io_isa_SLLI_T; // @[Decoder.scala 63:37]
  assign io_isa_SRAIW = 32'h4000501b == _io_isa_SLLI_T; // @[Decoder.scala 22:37]
  assign io_isa_SLT = 32'h2033 == _io_isa_SLLI_T; // @[Decoder.scala 74:37]
  assign io_isa_SLTI = 32'h2013 == _io_isa_ADDI_T; // @[Decoder.scala 31:45]
  assign io_isa_SLTU = 32'h3033 == _io_isa_SLLI_T; // @[Decoder.scala 75:37]
  assign io_isa_SLTIU = 32'h3013 == _io_isa_ADDI_T; // @[Decoder.scala 32:37]
  assign io_isa_BEQ = 32'h63 == _io_isa_ADDI_T; // @[Decoder.scala 83:37]
  assign io_isa_BNE = 32'h1063 == _io_isa_ADDI_T; // @[Decoder.scala 84:29]
  assign io_isa_BLT = 32'h4063 == _io_isa_ADDI_T; // @[Decoder.scala 85:29]
  assign io_isa_BGE = 32'h5063 == _io_isa_ADDI_T; // @[Decoder.scala 86:29]
  assign io_isa_BLTU = 32'h6063 == _io_isa_ADDI_T; // @[Decoder.scala 87:29]
  assign io_isa_BGEU = 32'h7063 == _io_isa_ADDI_T; // @[Decoder.scala 88:29]
  assign io_isa_JAL = 32'h6f == _io_isa_LUI_T; // @[Decoder.scala 97:45]
  assign io_isa_JALR = 32'h67 == _io_isa_ADDI_T; // @[Decoder.scala 34:45]
  assign io_isa_CSRRW = 32'h1073 == _io_isa_ADDI_T; // @[Decoder.scala 42:37]
  assign io_isa_CSRRS = 32'h2073 == _io_isa_ADDI_T; // @[Decoder.scala 44:37]
  assign io_isa_CSRRC = 32'h3073 == _io_isa_ADDI_T; // @[Decoder.scala 46:37]
  assign io_isa_CSRRWI = 32'h5073 == _io_isa_ADDI_T; // @[Decoder.scala 43:37]
  assign io_isa_CSRRSI = 32'h6073 == _io_isa_ADDI_T; // @[Decoder.scala 45:37]
  assign io_isa_CSRRCI = 32'h7073 == _io_isa_ADDI_T; // @[Decoder.scala 47:37]
  assign io_isa_LD = 32'h3003 == _io_isa_ADDI_T; // @[Decoder.scala 49:45]
  assign io_isa_LW = 32'h2003 == _io_isa_ADDI_T; // @[Decoder.scala 50:45]
  assign io_isa_LH = 32'h1003 == _io_isa_ADDI_T; // @[Decoder.scala 52:45]
  assign io_isa_LB = 32'h3 == _io_isa_ADDI_T; // @[Decoder.scala 54:45]
  assign io_isa_LWU = 32'h6003 == _io_isa_ADDI_T; // @[Decoder.scala 51:37]
  assign io_isa_LHU = 32'h5003 == _io_isa_ADDI_T; // @[Decoder.scala 53:37]
  assign io_isa_LBU = 32'h4003 == _io_isa_ADDI_T; // @[Decoder.scala 55:37]
  assign io_isa_SD = 32'h3023 == _io_isa_ADDI_T; // @[Decoder.scala 89:37]
  assign io_isa_SW = 32'h2023 == _io_isa_ADDI_T; // @[Decoder.scala 90:37]
  assign io_isa_SH = 32'h1023 == _io_isa_ADDI_T; // @[Decoder.scala 91:37]
  assign io_isa_SB = 32'h23 == _io_isa_ADDI_T; // @[Decoder.scala 92:37]
  assign io_isa_MRET = 32'h30200073 == io_inst; // @[Decoder.scala 77:61]
  assign io_imm_I = {io_imm_I_hi,I}; // @[Cat.scala 30:58]
  assign io_imm_B = {io_imm_B_hi,B}; // @[Cat.scala 30:58]
  assign io_imm_S = {io_imm_S_hi,S}; // @[Cat.scala 30:58]
  assign io_imm_U = {io_imm_U_hi,U}; // @[Cat.scala 30:58]
  assign io_imm_J = {io_imm_J_hi,J}; // @[Cat.scala 30:58]
  assign io_wen = _Legal_T_2 | Jump_Link | Loads | CSR; // @[Decoder.scala 129:84]
endmodule
module ysyx_210292_InstDecode(
  input         clock,
  input         reset,
  input         io_ENABLE,
  input         io_ifid_Valid,
  input  [31:0] io_ifid_Inst,
  input  [63:0] io_ifid_PC,
  output        io_idex_Valid,
  output [31:0] io_idex_Inst,
  output [63:0] io_idex_PC,
  output        io_idex_isa_ADD,
  output        io_idex_isa_ADDI,
  output        io_idex_isa_ADDW,
  output        io_idex_isa_ADDIW,
  output        io_idex_isa_SUB,
  output        io_idex_isa_SUBW,
  output        io_idex_isa_LUI,
  output        io_idex_isa_AUIPC,
  output        io_idex_isa_XOR,
  output        io_idex_isa_XORI,
  output        io_idex_isa_OR,
  output        io_idex_isa_ORI,
  output        io_idex_isa_AND,
  output        io_idex_isa_ANDI,
  output        io_idex_isa_SLL,
  output        io_idex_isa_SLLI,
  output        io_idex_isa_SLLW,
  output        io_idex_isa_SLLIW,
  output        io_idex_isa_SRL,
  output        io_idex_isa_SRLI,
  output        io_idex_isa_SRLW,
  output        io_idex_isa_SRLIW,
  output        io_idex_isa_SRA,
  output        io_idex_isa_SRAI,
  output        io_idex_isa_SRAW,
  output        io_idex_isa_SRAIW,
  output        io_idex_isa_SLT,
  output        io_idex_isa_SLTI,
  output        io_idex_isa_SLTU,
  output        io_idex_isa_SLTIU,
  output        io_idex_isa_BEQ,
  output        io_idex_isa_BNE,
  output        io_idex_isa_BLT,
  output        io_idex_isa_BGE,
  output        io_idex_isa_BLTU,
  output        io_idex_isa_BGEU,
  output        io_idex_isa_JAL,
  output        io_idex_isa_JALR,
  output        io_idex_isa_LD,
  output        io_idex_isa_LW,
  output        io_idex_isa_LH,
  output        io_idex_isa_LB,
  output        io_idex_isa_LWU,
  output        io_idex_isa_LHU,
  output        io_idex_isa_LBU,
  output        io_idex_isa_SD,
  output        io_idex_isa_SW,
  output        io_idex_isa_SH,
  output        io_idex_isa_SB,
  output        io_idex_isa_MRET,
  output [63:0] io_idex_src1,
  output [63:0] io_idex_src2,
  output [63:0] io_idex_imm_I,
  output [63:0] io_idex_imm_B,
  output [63:0] io_idex_imm_S,
  output [63:0] io_idex_imm_U,
  output [63:0] io_idex_imm_J,
  output        io_idex_wen,
  output [4:0]  io_idex_regdes,
  input         io_cancel,
  input         io_wbdata_wen,
  input  [4:0]  io_wbdata_regdes,
  input  [63:0] io_wbdata_data
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
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
  reg [63:0] _RAND_32;
  reg [63:0] _RAND_33;
  reg [63:0] _RAND_34;
`endif // RANDOMIZE_REG_INIT
  wire [31:0] decoder_io_inst; // @[InstDecode.scala 32:23]
  wire  decoder_io_isa_ADD; // @[InstDecode.scala 32:23]
  wire  decoder_io_isa_ADDI; // @[InstDecode.scala 32:23]
  wire  decoder_io_isa_ADDW; // @[InstDecode.scala 32:23]
  wire  decoder_io_isa_ADDIW; // @[InstDecode.scala 32:23]
  wire  decoder_io_isa_SUB; // @[InstDecode.scala 32:23]
  wire  decoder_io_isa_SUBW; // @[InstDecode.scala 32:23]
  wire  decoder_io_isa_LUI; // @[InstDecode.scala 32:23]
  wire  decoder_io_isa_AUIPC; // @[InstDecode.scala 32:23]
  wire  decoder_io_isa_XOR; // @[InstDecode.scala 32:23]
  wire  decoder_io_isa_XORI; // @[InstDecode.scala 32:23]
  wire  decoder_io_isa_OR; // @[InstDecode.scala 32:23]
  wire  decoder_io_isa_ORI; // @[InstDecode.scala 32:23]
  wire  decoder_io_isa_AND; // @[InstDecode.scala 32:23]
  wire  decoder_io_isa_ANDI; // @[InstDecode.scala 32:23]
  wire  decoder_io_isa_SLL; // @[InstDecode.scala 32:23]
  wire  decoder_io_isa_SLLI; // @[InstDecode.scala 32:23]
  wire  decoder_io_isa_SLLW; // @[InstDecode.scala 32:23]
  wire  decoder_io_isa_SLLIW; // @[InstDecode.scala 32:23]
  wire  decoder_io_isa_SRL; // @[InstDecode.scala 32:23]
  wire  decoder_io_isa_SRLI; // @[InstDecode.scala 32:23]
  wire  decoder_io_isa_SRLW; // @[InstDecode.scala 32:23]
  wire  decoder_io_isa_SRLIW; // @[InstDecode.scala 32:23]
  wire  decoder_io_isa_SRA; // @[InstDecode.scala 32:23]
  wire  decoder_io_isa_SRAI; // @[InstDecode.scala 32:23]
  wire  decoder_io_isa_SRAW; // @[InstDecode.scala 32:23]
  wire  decoder_io_isa_SRAIW; // @[InstDecode.scala 32:23]
  wire  decoder_io_isa_SLT; // @[InstDecode.scala 32:23]
  wire  decoder_io_isa_SLTI; // @[InstDecode.scala 32:23]
  wire  decoder_io_isa_SLTU; // @[InstDecode.scala 32:23]
  wire  decoder_io_isa_SLTIU; // @[InstDecode.scala 32:23]
  wire  decoder_io_isa_BEQ; // @[InstDecode.scala 32:23]
  wire  decoder_io_isa_BNE; // @[InstDecode.scala 32:23]
  wire  decoder_io_isa_BLT; // @[InstDecode.scala 32:23]
  wire  decoder_io_isa_BGE; // @[InstDecode.scala 32:23]
  wire  decoder_io_isa_BLTU; // @[InstDecode.scala 32:23]
  wire  decoder_io_isa_BGEU; // @[InstDecode.scala 32:23]
  wire  decoder_io_isa_JAL; // @[InstDecode.scala 32:23]
  wire  decoder_io_isa_JALR; // @[InstDecode.scala 32:23]
  wire  decoder_io_isa_CSRRW; // @[InstDecode.scala 32:23]
  wire  decoder_io_isa_CSRRS; // @[InstDecode.scala 32:23]
  wire  decoder_io_isa_CSRRC; // @[InstDecode.scala 32:23]
  wire  decoder_io_isa_CSRRWI; // @[InstDecode.scala 32:23]
  wire  decoder_io_isa_CSRRSI; // @[InstDecode.scala 32:23]
  wire  decoder_io_isa_CSRRCI; // @[InstDecode.scala 32:23]
  wire  decoder_io_isa_LD; // @[InstDecode.scala 32:23]
  wire  decoder_io_isa_LW; // @[InstDecode.scala 32:23]
  wire  decoder_io_isa_LH; // @[InstDecode.scala 32:23]
  wire  decoder_io_isa_LB; // @[InstDecode.scala 32:23]
  wire  decoder_io_isa_LWU; // @[InstDecode.scala 32:23]
  wire  decoder_io_isa_LHU; // @[InstDecode.scala 32:23]
  wire  decoder_io_isa_LBU; // @[InstDecode.scala 32:23]
  wire  decoder_io_isa_SD; // @[InstDecode.scala 32:23]
  wire  decoder_io_isa_SW; // @[InstDecode.scala 32:23]
  wire  decoder_io_isa_SH; // @[InstDecode.scala 32:23]
  wire  decoder_io_isa_SB; // @[InstDecode.scala 32:23]
  wire  decoder_io_isa_MRET; // @[InstDecode.scala 32:23]
  wire [63:0] decoder_io_imm_I; // @[InstDecode.scala 32:23]
  wire [63:0] decoder_io_imm_B; // @[InstDecode.scala 32:23]
  wire [63:0] decoder_io_imm_S; // @[InstDecode.scala 32:23]
  wire [63:0] decoder_io_imm_U; // @[InstDecode.scala 32:23]
  wire [63:0] decoder_io_imm_J; // @[InstDecode.scala 32:23]
  wire  decoder_io_wen; // @[InstDecode.scala 32:23]
  reg  ids_Valid; // @[Reg.scala 27:20]
  reg [31:0] ids_Inst; // @[Reg.scala 27:20]
  reg [63:0] ids_PC; // @[Reg.scala 27:20]
  wire [4:0] rs1 = ids_Inst[19:15]; // @[InstDecode.scala 28:17]
  wire [4:0] rs2 = ids_Inst[24:20]; // @[InstDecode.scala 29:17]
  reg [63:0] gpr_0; // @[RegFile.scala 8:20]
  reg [63:0] gpr_1; // @[RegFile.scala 8:20]
  reg [63:0] gpr_2; // @[RegFile.scala 8:20]
  reg [63:0] gpr_3; // @[RegFile.scala 8:20]
  reg [63:0] gpr_4; // @[RegFile.scala 8:20]
  reg [63:0] gpr_5; // @[RegFile.scala 8:20]
  reg [63:0] gpr_6; // @[RegFile.scala 8:20]
  reg [63:0] gpr_7; // @[RegFile.scala 8:20]
  reg [63:0] gpr_8; // @[RegFile.scala 8:20]
  reg [63:0] gpr_9; // @[RegFile.scala 8:20]
  reg [63:0] gpr_10; // @[RegFile.scala 8:20]
  reg [63:0] gpr_11; // @[RegFile.scala 8:20]
  reg [63:0] gpr_12; // @[RegFile.scala 8:20]
  reg [63:0] gpr_13; // @[RegFile.scala 8:20]
  reg [63:0] gpr_14; // @[RegFile.scala 8:20]
  reg [63:0] gpr_15; // @[RegFile.scala 8:20]
  reg [63:0] gpr_16; // @[RegFile.scala 8:20]
  reg [63:0] gpr_17; // @[RegFile.scala 8:20]
  reg [63:0] gpr_18; // @[RegFile.scala 8:20]
  reg [63:0] gpr_19; // @[RegFile.scala 8:20]
  reg [63:0] gpr_20; // @[RegFile.scala 8:20]
  reg [63:0] gpr_21; // @[RegFile.scala 8:20]
  reg [63:0] gpr_22; // @[RegFile.scala 8:20]
  reg [63:0] gpr_23; // @[RegFile.scala 8:20]
  reg [63:0] gpr_24; // @[RegFile.scala 8:20]
  reg [63:0] gpr_25; // @[RegFile.scala 8:20]
  reg [63:0] gpr_26; // @[RegFile.scala 8:20]
  reg [63:0] gpr_27; // @[RegFile.scala 8:20]
  reg [63:0] gpr_28; // @[RegFile.scala 8:20]
  reg [63:0] gpr_29; // @[RegFile.scala 8:20]
  reg [63:0] gpr_30; // @[RegFile.scala 8:20]
  reg [63:0] gpr_31; // @[RegFile.scala 8:20]
  wire  src1_hit = io_wbdata_wen & rs1 == io_wbdata_regdes & rs1 != 5'h0; // @[InstDecode.scala 39:62]
  wire  src2_hit = io_wbdata_wen & rs2 == io_wbdata_regdes & rs2 != 5'h0; // @[InstDecode.scala 40:62]
  wire [63:0] _GEN_4 = 5'h1 == rs1 ? gpr_1 : gpr_0; // @[InstDecode.scala 41:17 InstDecode.scala 41:17]
  wire [63:0] _GEN_5 = 5'h2 == rs1 ? gpr_2 : _GEN_4; // @[InstDecode.scala 41:17 InstDecode.scala 41:17]
  wire [63:0] _GEN_6 = 5'h3 == rs1 ? gpr_3 : _GEN_5; // @[InstDecode.scala 41:17 InstDecode.scala 41:17]
  wire [63:0] _GEN_7 = 5'h4 == rs1 ? gpr_4 : _GEN_6; // @[InstDecode.scala 41:17 InstDecode.scala 41:17]
  wire [63:0] _GEN_8 = 5'h5 == rs1 ? gpr_5 : _GEN_7; // @[InstDecode.scala 41:17 InstDecode.scala 41:17]
  wire [63:0] _GEN_9 = 5'h6 == rs1 ? gpr_6 : _GEN_8; // @[InstDecode.scala 41:17 InstDecode.scala 41:17]
  wire [63:0] _GEN_10 = 5'h7 == rs1 ? gpr_7 : _GEN_9; // @[InstDecode.scala 41:17 InstDecode.scala 41:17]
  wire [63:0] _GEN_11 = 5'h8 == rs1 ? gpr_8 : _GEN_10; // @[InstDecode.scala 41:17 InstDecode.scala 41:17]
  wire [63:0] _GEN_12 = 5'h9 == rs1 ? gpr_9 : _GEN_11; // @[InstDecode.scala 41:17 InstDecode.scala 41:17]
  wire [63:0] _GEN_13 = 5'ha == rs1 ? gpr_10 : _GEN_12; // @[InstDecode.scala 41:17 InstDecode.scala 41:17]
  wire [63:0] _GEN_14 = 5'hb == rs1 ? gpr_11 : _GEN_13; // @[InstDecode.scala 41:17 InstDecode.scala 41:17]
  wire [63:0] _GEN_15 = 5'hc == rs1 ? gpr_12 : _GEN_14; // @[InstDecode.scala 41:17 InstDecode.scala 41:17]
  wire [63:0] _GEN_16 = 5'hd == rs1 ? gpr_13 : _GEN_15; // @[InstDecode.scala 41:17 InstDecode.scala 41:17]
  wire [63:0] _GEN_17 = 5'he == rs1 ? gpr_14 : _GEN_16; // @[InstDecode.scala 41:17 InstDecode.scala 41:17]
  wire [63:0] _GEN_18 = 5'hf == rs1 ? gpr_15 : _GEN_17; // @[InstDecode.scala 41:17 InstDecode.scala 41:17]
  wire [63:0] _GEN_19 = 5'h10 == rs1 ? gpr_16 : _GEN_18; // @[InstDecode.scala 41:17 InstDecode.scala 41:17]
  wire [63:0] _GEN_20 = 5'h11 == rs1 ? gpr_17 : _GEN_19; // @[InstDecode.scala 41:17 InstDecode.scala 41:17]
  wire [63:0] _GEN_21 = 5'h12 == rs1 ? gpr_18 : _GEN_20; // @[InstDecode.scala 41:17 InstDecode.scala 41:17]
  wire [63:0] _GEN_22 = 5'h13 == rs1 ? gpr_19 : _GEN_21; // @[InstDecode.scala 41:17 InstDecode.scala 41:17]
  wire [63:0] _GEN_23 = 5'h14 == rs1 ? gpr_20 : _GEN_22; // @[InstDecode.scala 41:17 InstDecode.scala 41:17]
  wire [63:0] _GEN_24 = 5'h15 == rs1 ? gpr_21 : _GEN_23; // @[InstDecode.scala 41:17 InstDecode.scala 41:17]
  wire [63:0] _GEN_25 = 5'h16 == rs1 ? gpr_22 : _GEN_24; // @[InstDecode.scala 41:17 InstDecode.scala 41:17]
  wire [63:0] _GEN_26 = 5'h17 == rs1 ? gpr_23 : _GEN_25; // @[InstDecode.scala 41:17 InstDecode.scala 41:17]
  wire [63:0] _GEN_27 = 5'h18 == rs1 ? gpr_24 : _GEN_26; // @[InstDecode.scala 41:17 InstDecode.scala 41:17]
  wire [63:0] _GEN_28 = 5'h19 == rs1 ? gpr_25 : _GEN_27; // @[InstDecode.scala 41:17 InstDecode.scala 41:17]
  wire [63:0] _GEN_29 = 5'h1a == rs1 ? gpr_26 : _GEN_28; // @[InstDecode.scala 41:17 InstDecode.scala 41:17]
  wire [63:0] _GEN_30 = 5'h1b == rs1 ? gpr_27 : _GEN_29; // @[InstDecode.scala 41:17 InstDecode.scala 41:17]
  wire [63:0] _GEN_31 = 5'h1c == rs1 ? gpr_28 : _GEN_30; // @[InstDecode.scala 41:17 InstDecode.scala 41:17]
  wire [63:0] _GEN_32 = 5'h1d == rs1 ? gpr_29 : _GEN_31; // @[InstDecode.scala 41:17 InstDecode.scala 41:17]
  wire [63:0] _GEN_33 = 5'h1e == rs1 ? gpr_30 : _GEN_32; // @[InstDecode.scala 41:17 InstDecode.scala 41:17]
  wire [63:0] _GEN_34 = 5'h1f == rs1 ? gpr_31 : _GEN_33; // @[InstDecode.scala 41:17 InstDecode.scala 41:17]
  wire [63:0] _GEN_36 = 5'h1 == rs2 ? gpr_1 : gpr_0; // @[InstDecode.scala 42:17 InstDecode.scala 42:17]
  wire [63:0] _GEN_37 = 5'h2 == rs2 ? gpr_2 : _GEN_36; // @[InstDecode.scala 42:17 InstDecode.scala 42:17]
  wire [63:0] _GEN_38 = 5'h3 == rs2 ? gpr_3 : _GEN_37; // @[InstDecode.scala 42:17 InstDecode.scala 42:17]
  wire [63:0] _GEN_39 = 5'h4 == rs2 ? gpr_4 : _GEN_38; // @[InstDecode.scala 42:17 InstDecode.scala 42:17]
  wire [63:0] _GEN_40 = 5'h5 == rs2 ? gpr_5 : _GEN_39; // @[InstDecode.scala 42:17 InstDecode.scala 42:17]
  wire [63:0] _GEN_41 = 5'h6 == rs2 ? gpr_6 : _GEN_40; // @[InstDecode.scala 42:17 InstDecode.scala 42:17]
  wire [63:0] _GEN_42 = 5'h7 == rs2 ? gpr_7 : _GEN_41; // @[InstDecode.scala 42:17 InstDecode.scala 42:17]
  wire [63:0] _GEN_43 = 5'h8 == rs2 ? gpr_8 : _GEN_42; // @[InstDecode.scala 42:17 InstDecode.scala 42:17]
  wire [63:0] _GEN_44 = 5'h9 == rs2 ? gpr_9 : _GEN_43; // @[InstDecode.scala 42:17 InstDecode.scala 42:17]
  wire [63:0] _GEN_45 = 5'ha == rs2 ? gpr_10 : _GEN_44; // @[InstDecode.scala 42:17 InstDecode.scala 42:17]
  wire [63:0] _GEN_46 = 5'hb == rs2 ? gpr_11 : _GEN_45; // @[InstDecode.scala 42:17 InstDecode.scala 42:17]
  wire [63:0] _GEN_47 = 5'hc == rs2 ? gpr_12 : _GEN_46; // @[InstDecode.scala 42:17 InstDecode.scala 42:17]
  wire [63:0] _GEN_48 = 5'hd == rs2 ? gpr_13 : _GEN_47; // @[InstDecode.scala 42:17 InstDecode.scala 42:17]
  wire [63:0] _GEN_49 = 5'he == rs2 ? gpr_14 : _GEN_48; // @[InstDecode.scala 42:17 InstDecode.scala 42:17]
  wire [63:0] _GEN_50 = 5'hf == rs2 ? gpr_15 : _GEN_49; // @[InstDecode.scala 42:17 InstDecode.scala 42:17]
  wire [63:0] _GEN_51 = 5'h10 == rs2 ? gpr_16 : _GEN_50; // @[InstDecode.scala 42:17 InstDecode.scala 42:17]
  wire [63:0] _GEN_52 = 5'h11 == rs2 ? gpr_17 : _GEN_51; // @[InstDecode.scala 42:17 InstDecode.scala 42:17]
  wire [63:0] _GEN_53 = 5'h12 == rs2 ? gpr_18 : _GEN_52; // @[InstDecode.scala 42:17 InstDecode.scala 42:17]
  wire [63:0] _GEN_54 = 5'h13 == rs2 ? gpr_19 : _GEN_53; // @[InstDecode.scala 42:17 InstDecode.scala 42:17]
  wire [63:0] _GEN_55 = 5'h14 == rs2 ? gpr_20 : _GEN_54; // @[InstDecode.scala 42:17 InstDecode.scala 42:17]
  wire [63:0] _GEN_56 = 5'h15 == rs2 ? gpr_21 : _GEN_55; // @[InstDecode.scala 42:17 InstDecode.scala 42:17]
  wire [63:0] _GEN_57 = 5'h16 == rs2 ? gpr_22 : _GEN_56; // @[InstDecode.scala 42:17 InstDecode.scala 42:17]
  wire [63:0] _GEN_58 = 5'h17 == rs2 ? gpr_23 : _GEN_57; // @[InstDecode.scala 42:17 InstDecode.scala 42:17]
  wire [63:0] _GEN_59 = 5'h18 == rs2 ? gpr_24 : _GEN_58; // @[InstDecode.scala 42:17 InstDecode.scala 42:17]
  wire [63:0] _GEN_60 = 5'h19 == rs2 ? gpr_25 : _GEN_59; // @[InstDecode.scala 42:17 InstDecode.scala 42:17]
  wire [63:0] _GEN_61 = 5'h1a == rs2 ? gpr_26 : _GEN_60; // @[InstDecode.scala 42:17 InstDecode.scala 42:17]
  wire [63:0] _GEN_62 = 5'h1b == rs2 ? gpr_27 : _GEN_61; // @[InstDecode.scala 42:17 InstDecode.scala 42:17]
  wire [63:0] _GEN_63 = 5'h1c == rs2 ? gpr_28 : _GEN_62; // @[InstDecode.scala 42:17 InstDecode.scala 42:17]
  wire [63:0] _GEN_64 = 5'h1d == rs2 ? gpr_29 : _GEN_63; // @[InstDecode.scala 42:17 InstDecode.scala 42:17]
  wire [63:0] _GEN_65 = 5'h1e == rs2 ? gpr_30 : _GEN_64; // @[InstDecode.scala 42:17 InstDecode.scala 42:17]
  wire [63:0] _GEN_66 = 5'h1f == rs2 ? gpr_31 : _GEN_65; // @[InstDecode.scala 42:17 InstDecode.scala 42:17]
  ysyx_210292_Decoder decoder ( // @[InstDecode.scala 32:23]
    .io_inst(decoder_io_inst),
    .io_isa_ADD(decoder_io_isa_ADD),
    .io_isa_ADDI(decoder_io_isa_ADDI),
    .io_isa_ADDW(decoder_io_isa_ADDW),
    .io_isa_ADDIW(decoder_io_isa_ADDIW),
    .io_isa_SUB(decoder_io_isa_SUB),
    .io_isa_SUBW(decoder_io_isa_SUBW),
    .io_isa_LUI(decoder_io_isa_LUI),
    .io_isa_AUIPC(decoder_io_isa_AUIPC),
    .io_isa_XOR(decoder_io_isa_XOR),
    .io_isa_XORI(decoder_io_isa_XORI),
    .io_isa_OR(decoder_io_isa_OR),
    .io_isa_ORI(decoder_io_isa_ORI),
    .io_isa_AND(decoder_io_isa_AND),
    .io_isa_ANDI(decoder_io_isa_ANDI),
    .io_isa_SLL(decoder_io_isa_SLL),
    .io_isa_SLLI(decoder_io_isa_SLLI),
    .io_isa_SLLW(decoder_io_isa_SLLW),
    .io_isa_SLLIW(decoder_io_isa_SLLIW),
    .io_isa_SRL(decoder_io_isa_SRL),
    .io_isa_SRLI(decoder_io_isa_SRLI),
    .io_isa_SRLW(decoder_io_isa_SRLW),
    .io_isa_SRLIW(decoder_io_isa_SRLIW),
    .io_isa_SRA(decoder_io_isa_SRA),
    .io_isa_SRAI(decoder_io_isa_SRAI),
    .io_isa_SRAW(decoder_io_isa_SRAW),
    .io_isa_SRAIW(decoder_io_isa_SRAIW),
    .io_isa_SLT(decoder_io_isa_SLT),
    .io_isa_SLTI(decoder_io_isa_SLTI),
    .io_isa_SLTU(decoder_io_isa_SLTU),
    .io_isa_SLTIU(decoder_io_isa_SLTIU),
    .io_isa_BEQ(decoder_io_isa_BEQ),
    .io_isa_BNE(decoder_io_isa_BNE),
    .io_isa_BLT(decoder_io_isa_BLT),
    .io_isa_BGE(decoder_io_isa_BGE),
    .io_isa_BLTU(decoder_io_isa_BLTU),
    .io_isa_BGEU(decoder_io_isa_BGEU),
    .io_isa_JAL(decoder_io_isa_JAL),
    .io_isa_JALR(decoder_io_isa_JALR),
    .io_isa_CSRRW(decoder_io_isa_CSRRW),
    .io_isa_CSRRS(decoder_io_isa_CSRRS),
    .io_isa_CSRRC(decoder_io_isa_CSRRC),
    .io_isa_CSRRWI(decoder_io_isa_CSRRWI),
    .io_isa_CSRRSI(decoder_io_isa_CSRRSI),
    .io_isa_CSRRCI(decoder_io_isa_CSRRCI),
    .io_isa_LD(decoder_io_isa_LD),
    .io_isa_LW(decoder_io_isa_LW),
    .io_isa_LH(decoder_io_isa_LH),
    .io_isa_LB(decoder_io_isa_LB),
    .io_isa_LWU(decoder_io_isa_LWU),
    .io_isa_LHU(decoder_io_isa_LHU),
    .io_isa_LBU(decoder_io_isa_LBU),
    .io_isa_SD(decoder_io_isa_SD),
    .io_isa_SW(decoder_io_isa_SW),
    .io_isa_SH(decoder_io_isa_SH),
    .io_isa_SB(decoder_io_isa_SB),
    .io_isa_MRET(decoder_io_isa_MRET),
    .io_imm_I(decoder_io_imm_I),
    .io_imm_B(decoder_io_imm_B),
    .io_imm_S(decoder_io_imm_S),
    .io_imm_U(decoder_io_imm_U),
    .io_imm_J(decoder_io_imm_J),
    .io_wen(decoder_io_wen)
  );
  assign io_idex_Valid = io_cancel ? 1'h0 : ids_Valid; // @[InstDecode.scala 51:25]
  assign io_idex_Inst = ids_Inst; // @[InstDecode.scala 52:19]
  assign io_idex_PC = ids_PC; // @[InstDecode.scala 53:19]
  assign io_idex_isa_ADD = decoder_io_isa_ADD; // @[InstDecode.scala 54:19]
  assign io_idex_isa_ADDI = decoder_io_isa_ADDI; // @[InstDecode.scala 54:19]
  assign io_idex_isa_ADDW = decoder_io_isa_ADDW; // @[InstDecode.scala 54:19]
  assign io_idex_isa_ADDIW = decoder_io_isa_ADDIW; // @[InstDecode.scala 54:19]
  assign io_idex_isa_SUB = decoder_io_isa_SUB; // @[InstDecode.scala 54:19]
  assign io_idex_isa_SUBW = decoder_io_isa_SUBW; // @[InstDecode.scala 54:19]
  assign io_idex_isa_LUI = decoder_io_isa_LUI; // @[InstDecode.scala 54:19]
  assign io_idex_isa_AUIPC = decoder_io_isa_AUIPC; // @[InstDecode.scala 54:19]
  assign io_idex_isa_XOR = decoder_io_isa_XOR; // @[InstDecode.scala 54:19]
  assign io_idex_isa_XORI = decoder_io_isa_XORI; // @[InstDecode.scala 54:19]
  assign io_idex_isa_OR = decoder_io_isa_OR; // @[InstDecode.scala 54:19]
  assign io_idex_isa_ORI = decoder_io_isa_ORI; // @[InstDecode.scala 54:19]
  assign io_idex_isa_AND = decoder_io_isa_AND; // @[InstDecode.scala 54:19]
  assign io_idex_isa_ANDI = decoder_io_isa_ANDI; // @[InstDecode.scala 54:19]
  assign io_idex_isa_SLL = decoder_io_isa_SLL; // @[InstDecode.scala 54:19]
  assign io_idex_isa_SLLI = decoder_io_isa_SLLI; // @[InstDecode.scala 54:19]
  assign io_idex_isa_SLLW = decoder_io_isa_SLLW; // @[InstDecode.scala 54:19]
  assign io_idex_isa_SLLIW = decoder_io_isa_SLLIW; // @[InstDecode.scala 54:19]
  assign io_idex_isa_SRL = decoder_io_isa_SRL; // @[InstDecode.scala 54:19]
  assign io_idex_isa_SRLI = decoder_io_isa_SRLI; // @[InstDecode.scala 54:19]
  assign io_idex_isa_SRLW = decoder_io_isa_SRLW; // @[InstDecode.scala 54:19]
  assign io_idex_isa_SRLIW = decoder_io_isa_SRLIW; // @[InstDecode.scala 54:19]
  assign io_idex_isa_SRA = decoder_io_isa_SRA; // @[InstDecode.scala 54:19]
  assign io_idex_isa_SRAI = decoder_io_isa_SRAI; // @[InstDecode.scala 54:19]
  assign io_idex_isa_SRAW = decoder_io_isa_SRAW; // @[InstDecode.scala 54:19]
  assign io_idex_isa_SRAIW = decoder_io_isa_SRAIW; // @[InstDecode.scala 54:19]
  assign io_idex_isa_SLT = decoder_io_isa_SLT; // @[InstDecode.scala 54:19]
  assign io_idex_isa_SLTI = decoder_io_isa_SLTI; // @[InstDecode.scala 54:19]
  assign io_idex_isa_SLTU = decoder_io_isa_SLTU; // @[InstDecode.scala 54:19]
  assign io_idex_isa_SLTIU = decoder_io_isa_SLTIU; // @[InstDecode.scala 54:19]
  assign io_idex_isa_BEQ = decoder_io_isa_BEQ; // @[InstDecode.scala 54:19]
  assign io_idex_isa_BNE = decoder_io_isa_BNE; // @[InstDecode.scala 54:19]
  assign io_idex_isa_BLT = decoder_io_isa_BLT; // @[InstDecode.scala 54:19]
  assign io_idex_isa_BGE = decoder_io_isa_BGE; // @[InstDecode.scala 54:19]
  assign io_idex_isa_BLTU = decoder_io_isa_BLTU; // @[InstDecode.scala 54:19]
  assign io_idex_isa_BGEU = decoder_io_isa_BGEU; // @[InstDecode.scala 54:19]
  assign io_idex_isa_JAL = decoder_io_isa_JAL; // @[InstDecode.scala 54:19]
  assign io_idex_isa_JALR = decoder_io_isa_JALR; // @[InstDecode.scala 54:19]
  assign io_idex_isa_LD = decoder_io_isa_LD; // @[InstDecode.scala 54:19]
  assign io_idex_isa_LW = decoder_io_isa_LW; // @[InstDecode.scala 54:19]
  assign io_idex_isa_LH = decoder_io_isa_LH; // @[InstDecode.scala 54:19]
  assign io_idex_isa_LB = decoder_io_isa_LB; // @[InstDecode.scala 54:19]
  assign io_idex_isa_LWU = decoder_io_isa_LWU; // @[InstDecode.scala 54:19]
  assign io_idex_isa_LHU = decoder_io_isa_LHU; // @[InstDecode.scala 54:19]
  assign io_idex_isa_LBU = decoder_io_isa_LBU; // @[InstDecode.scala 54:19]
  assign io_idex_isa_SD = decoder_io_isa_SD; // @[InstDecode.scala 54:19]
  assign io_idex_isa_SW = decoder_io_isa_SW; // @[InstDecode.scala 54:19]
  assign io_idex_isa_SH = decoder_io_isa_SH; // @[InstDecode.scala 54:19]
  assign io_idex_isa_SB = decoder_io_isa_SB; // @[InstDecode.scala 54:19]
  assign io_idex_isa_MRET = decoder_io_isa_MRET; // @[InstDecode.scala 54:19]
  assign io_idex_src1 = src1_hit ? io_wbdata_data : _GEN_34; // @[InstDecode.scala 41:17]
  assign io_idex_src2 = src2_hit ? io_wbdata_data : _GEN_66; // @[InstDecode.scala 42:17]
  assign io_idex_imm_I = decoder_io_imm_I; // @[InstDecode.scala 57:19]
  assign io_idex_imm_B = decoder_io_imm_B; // @[InstDecode.scala 57:19]
  assign io_idex_imm_S = decoder_io_imm_S; // @[InstDecode.scala 57:19]
  assign io_idex_imm_U = decoder_io_imm_U; // @[InstDecode.scala 57:19]
  assign io_idex_imm_J = decoder_io_imm_J; // @[InstDecode.scala 57:19]
  assign io_idex_wen = decoder_io_wen; // @[InstDecode.scala 58:19]
  assign io_idex_regdes = ids_Inst[11:7]; // @[InstDecode.scala 30:20]
  assign decoder_io_inst = ids_Inst; // @[InstDecode.scala 33:19]
  always @(posedge clock) begin
    if (reset) begin // @[Reg.scala 27:20]
      ids_Valid <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      ids_Valid <= io_ifid_Valid; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      ids_Inst <= 32'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      ids_Inst <= io_ifid_Inst; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      ids_PC <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      ids_PC <= io_ifid_PC; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_0 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_ENABLE) begin // @[InstDecode.scala 44:19]
      if (io_wbdata_wen & io_wbdata_regdes != 5'h0) begin // @[RegFile.scala 11:30]
        if (5'h0 == io_wbdata_regdes) begin // @[RegFile.scala 11:42]
          gpr_0 <= io_wbdata_data; // @[RegFile.scala 11:42]
        end
      end
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_1 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_ENABLE) begin // @[InstDecode.scala 44:19]
      if (io_wbdata_wen & io_wbdata_regdes != 5'h0) begin // @[RegFile.scala 11:30]
        if (5'h1 == io_wbdata_regdes) begin // @[RegFile.scala 11:42]
          gpr_1 <= io_wbdata_data; // @[RegFile.scala 11:42]
        end
      end
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_2 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_ENABLE) begin // @[InstDecode.scala 44:19]
      if (io_wbdata_wen & io_wbdata_regdes != 5'h0) begin // @[RegFile.scala 11:30]
        if (5'h2 == io_wbdata_regdes) begin // @[RegFile.scala 11:42]
          gpr_2 <= io_wbdata_data; // @[RegFile.scala 11:42]
        end
      end
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_3 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_ENABLE) begin // @[InstDecode.scala 44:19]
      if (io_wbdata_wen & io_wbdata_regdes != 5'h0) begin // @[RegFile.scala 11:30]
        if (5'h3 == io_wbdata_regdes) begin // @[RegFile.scala 11:42]
          gpr_3 <= io_wbdata_data; // @[RegFile.scala 11:42]
        end
      end
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_4 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_ENABLE) begin // @[InstDecode.scala 44:19]
      if (io_wbdata_wen & io_wbdata_regdes != 5'h0) begin // @[RegFile.scala 11:30]
        if (5'h4 == io_wbdata_regdes) begin // @[RegFile.scala 11:42]
          gpr_4 <= io_wbdata_data; // @[RegFile.scala 11:42]
        end
      end
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_5 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_ENABLE) begin // @[InstDecode.scala 44:19]
      if (io_wbdata_wen & io_wbdata_regdes != 5'h0) begin // @[RegFile.scala 11:30]
        if (5'h5 == io_wbdata_regdes) begin // @[RegFile.scala 11:42]
          gpr_5 <= io_wbdata_data; // @[RegFile.scala 11:42]
        end
      end
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_6 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_ENABLE) begin // @[InstDecode.scala 44:19]
      if (io_wbdata_wen & io_wbdata_regdes != 5'h0) begin // @[RegFile.scala 11:30]
        if (5'h6 == io_wbdata_regdes) begin // @[RegFile.scala 11:42]
          gpr_6 <= io_wbdata_data; // @[RegFile.scala 11:42]
        end
      end
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_7 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_ENABLE) begin // @[InstDecode.scala 44:19]
      if (io_wbdata_wen & io_wbdata_regdes != 5'h0) begin // @[RegFile.scala 11:30]
        if (5'h7 == io_wbdata_regdes) begin // @[RegFile.scala 11:42]
          gpr_7 <= io_wbdata_data; // @[RegFile.scala 11:42]
        end
      end
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_8 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_ENABLE) begin // @[InstDecode.scala 44:19]
      if (io_wbdata_wen & io_wbdata_regdes != 5'h0) begin // @[RegFile.scala 11:30]
        if (5'h8 == io_wbdata_regdes) begin // @[RegFile.scala 11:42]
          gpr_8 <= io_wbdata_data; // @[RegFile.scala 11:42]
        end
      end
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_9 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_ENABLE) begin // @[InstDecode.scala 44:19]
      if (io_wbdata_wen & io_wbdata_regdes != 5'h0) begin // @[RegFile.scala 11:30]
        if (5'h9 == io_wbdata_regdes) begin // @[RegFile.scala 11:42]
          gpr_9 <= io_wbdata_data; // @[RegFile.scala 11:42]
        end
      end
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_10 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_ENABLE) begin // @[InstDecode.scala 44:19]
      if (io_wbdata_wen & io_wbdata_regdes != 5'h0) begin // @[RegFile.scala 11:30]
        if (5'ha == io_wbdata_regdes) begin // @[RegFile.scala 11:42]
          gpr_10 <= io_wbdata_data; // @[RegFile.scala 11:42]
        end
      end
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_11 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_ENABLE) begin // @[InstDecode.scala 44:19]
      if (io_wbdata_wen & io_wbdata_regdes != 5'h0) begin // @[RegFile.scala 11:30]
        if (5'hb == io_wbdata_regdes) begin // @[RegFile.scala 11:42]
          gpr_11 <= io_wbdata_data; // @[RegFile.scala 11:42]
        end
      end
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_12 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_ENABLE) begin // @[InstDecode.scala 44:19]
      if (io_wbdata_wen & io_wbdata_regdes != 5'h0) begin // @[RegFile.scala 11:30]
        if (5'hc == io_wbdata_regdes) begin // @[RegFile.scala 11:42]
          gpr_12 <= io_wbdata_data; // @[RegFile.scala 11:42]
        end
      end
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_13 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_ENABLE) begin // @[InstDecode.scala 44:19]
      if (io_wbdata_wen & io_wbdata_regdes != 5'h0) begin // @[RegFile.scala 11:30]
        if (5'hd == io_wbdata_regdes) begin // @[RegFile.scala 11:42]
          gpr_13 <= io_wbdata_data; // @[RegFile.scala 11:42]
        end
      end
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_14 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_ENABLE) begin // @[InstDecode.scala 44:19]
      if (io_wbdata_wen & io_wbdata_regdes != 5'h0) begin // @[RegFile.scala 11:30]
        if (5'he == io_wbdata_regdes) begin // @[RegFile.scala 11:42]
          gpr_14 <= io_wbdata_data; // @[RegFile.scala 11:42]
        end
      end
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_15 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_ENABLE) begin // @[InstDecode.scala 44:19]
      if (io_wbdata_wen & io_wbdata_regdes != 5'h0) begin // @[RegFile.scala 11:30]
        if (5'hf == io_wbdata_regdes) begin // @[RegFile.scala 11:42]
          gpr_15 <= io_wbdata_data; // @[RegFile.scala 11:42]
        end
      end
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_16 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_ENABLE) begin // @[InstDecode.scala 44:19]
      if (io_wbdata_wen & io_wbdata_regdes != 5'h0) begin // @[RegFile.scala 11:30]
        if (5'h10 == io_wbdata_regdes) begin // @[RegFile.scala 11:42]
          gpr_16 <= io_wbdata_data; // @[RegFile.scala 11:42]
        end
      end
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_17 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_ENABLE) begin // @[InstDecode.scala 44:19]
      if (io_wbdata_wen & io_wbdata_regdes != 5'h0) begin // @[RegFile.scala 11:30]
        if (5'h11 == io_wbdata_regdes) begin // @[RegFile.scala 11:42]
          gpr_17 <= io_wbdata_data; // @[RegFile.scala 11:42]
        end
      end
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_18 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_ENABLE) begin // @[InstDecode.scala 44:19]
      if (io_wbdata_wen & io_wbdata_regdes != 5'h0) begin // @[RegFile.scala 11:30]
        if (5'h12 == io_wbdata_regdes) begin // @[RegFile.scala 11:42]
          gpr_18 <= io_wbdata_data; // @[RegFile.scala 11:42]
        end
      end
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_19 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_ENABLE) begin // @[InstDecode.scala 44:19]
      if (io_wbdata_wen & io_wbdata_regdes != 5'h0) begin // @[RegFile.scala 11:30]
        if (5'h13 == io_wbdata_regdes) begin // @[RegFile.scala 11:42]
          gpr_19 <= io_wbdata_data; // @[RegFile.scala 11:42]
        end
      end
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_20 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_ENABLE) begin // @[InstDecode.scala 44:19]
      if (io_wbdata_wen & io_wbdata_regdes != 5'h0) begin // @[RegFile.scala 11:30]
        if (5'h14 == io_wbdata_regdes) begin // @[RegFile.scala 11:42]
          gpr_20 <= io_wbdata_data; // @[RegFile.scala 11:42]
        end
      end
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_21 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_ENABLE) begin // @[InstDecode.scala 44:19]
      if (io_wbdata_wen & io_wbdata_regdes != 5'h0) begin // @[RegFile.scala 11:30]
        if (5'h15 == io_wbdata_regdes) begin // @[RegFile.scala 11:42]
          gpr_21 <= io_wbdata_data; // @[RegFile.scala 11:42]
        end
      end
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_22 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_ENABLE) begin // @[InstDecode.scala 44:19]
      if (io_wbdata_wen & io_wbdata_regdes != 5'h0) begin // @[RegFile.scala 11:30]
        if (5'h16 == io_wbdata_regdes) begin // @[RegFile.scala 11:42]
          gpr_22 <= io_wbdata_data; // @[RegFile.scala 11:42]
        end
      end
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_23 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_ENABLE) begin // @[InstDecode.scala 44:19]
      if (io_wbdata_wen & io_wbdata_regdes != 5'h0) begin // @[RegFile.scala 11:30]
        if (5'h17 == io_wbdata_regdes) begin // @[RegFile.scala 11:42]
          gpr_23 <= io_wbdata_data; // @[RegFile.scala 11:42]
        end
      end
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_24 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_ENABLE) begin // @[InstDecode.scala 44:19]
      if (io_wbdata_wen & io_wbdata_regdes != 5'h0) begin // @[RegFile.scala 11:30]
        if (5'h18 == io_wbdata_regdes) begin // @[RegFile.scala 11:42]
          gpr_24 <= io_wbdata_data; // @[RegFile.scala 11:42]
        end
      end
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_25 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_ENABLE) begin // @[InstDecode.scala 44:19]
      if (io_wbdata_wen & io_wbdata_regdes != 5'h0) begin // @[RegFile.scala 11:30]
        if (5'h19 == io_wbdata_regdes) begin // @[RegFile.scala 11:42]
          gpr_25 <= io_wbdata_data; // @[RegFile.scala 11:42]
        end
      end
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_26 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_ENABLE) begin // @[InstDecode.scala 44:19]
      if (io_wbdata_wen & io_wbdata_regdes != 5'h0) begin // @[RegFile.scala 11:30]
        if (5'h1a == io_wbdata_regdes) begin // @[RegFile.scala 11:42]
          gpr_26 <= io_wbdata_data; // @[RegFile.scala 11:42]
        end
      end
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_27 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_ENABLE) begin // @[InstDecode.scala 44:19]
      if (io_wbdata_wen & io_wbdata_regdes != 5'h0) begin // @[RegFile.scala 11:30]
        if (5'h1b == io_wbdata_regdes) begin // @[RegFile.scala 11:42]
          gpr_27 <= io_wbdata_data; // @[RegFile.scala 11:42]
        end
      end
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_28 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_ENABLE) begin // @[InstDecode.scala 44:19]
      if (io_wbdata_wen & io_wbdata_regdes != 5'h0) begin // @[RegFile.scala 11:30]
        if (5'h1c == io_wbdata_regdes) begin // @[RegFile.scala 11:42]
          gpr_28 <= io_wbdata_data; // @[RegFile.scala 11:42]
        end
      end
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_29 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_ENABLE) begin // @[InstDecode.scala 44:19]
      if (io_wbdata_wen & io_wbdata_regdes != 5'h0) begin // @[RegFile.scala 11:30]
        if (5'h1d == io_wbdata_regdes) begin // @[RegFile.scala 11:42]
          gpr_29 <= io_wbdata_data; // @[RegFile.scala 11:42]
        end
      end
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_30 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_ENABLE) begin // @[InstDecode.scala 44:19]
      if (io_wbdata_wen & io_wbdata_regdes != 5'h0) begin // @[RegFile.scala 11:30]
        if (5'h1e == io_wbdata_regdes) begin // @[RegFile.scala 11:42]
          gpr_30 <= io_wbdata_data; // @[RegFile.scala 11:42]
        end
      end
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_31 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_ENABLE) begin // @[InstDecode.scala 44:19]
      if (io_wbdata_wen & io_wbdata_regdes != 5'h0) begin // @[RegFile.scala 11:30]
        if (5'h1f == io_wbdata_regdes) begin // @[RegFile.scala 11:42]
          gpr_31 <= io_wbdata_data; // @[RegFile.scala 11:42]
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
  ids_Valid = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  ids_Inst = _RAND_1[31:0];
  _RAND_2 = {2{`RANDOM}};
  ids_PC = _RAND_2[63:0];
  _RAND_3 = {2{`RANDOM}};
  gpr_0 = _RAND_3[63:0];
  _RAND_4 = {2{`RANDOM}};
  gpr_1 = _RAND_4[63:0];
  _RAND_5 = {2{`RANDOM}};
  gpr_2 = _RAND_5[63:0];
  _RAND_6 = {2{`RANDOM}};
  gpr_3 = _RAND_6[63:0];
  _RAND_7 = {2{`RANDOM}};
  gpr_4 = _RAND_7[63:0];
  _RAND_8 = {2{`RANDOM}};
  gpr_5 = _RAND_8[63:0];
  _RAND_9 = {2{`RANDOM}};
  gpr_6 = _RAND_9[63:0];
  _RAND_10 = {2{`RANDOM}};
  gpr_7 = _RAND_10[63:0];
  _RAND_11 = {2{`RANDOM}};
  gpr_8 = _RAND_11[63:0];
  _RAND_12 = {2{`RANDOM}};
  gpr_9 = _RAND_12[63:0];
  _RAND_13 = {2{`RANDOM}};
  gpr_10 = _RAND_13[63:0];
  _RAND_14 = {2{`RANDOM}};
  gpr_11 = _RAND_14[63:0];
  _RAND_15 = {2{`RANDOM}};
  gpr_12 = _RAND_15[63:0];
  _RAND_16 = {2{`RANDOM}};
  gpr_13 = _RAND_16[63:0];
  _RAND_17 = {2{`RANDOM}};
  gpr_14 = _RAND_17[63:0];
  _RAND_18 = {2{`RANDOM}};
  gpr_15 = _RAND_18[63:0];
  _RAND_19 = {2{`RANDOM}};
  gpr_16 = _RAND_19[63:0];
  _RAND_20 = {2{`RANDOM}};
  gpr_17 = _RAND_20[63:0];
  _RAND_21 = {2{`RANDOM}};
  gpr_18 = _RAND_21[63:0];
  _RAND_22 = {2{`RANDOM}};
  gpr_19 = _RAND_22[63:0];
  _RAND_23 = {2{`RANDOM}};
  gpr_20 = _RAND_23[63:0];
  _RAND_24 = {2{`RANDOM}};
  gpr_21 = _RAND_24[63:0];
  _RAND_25 = {2{`RANDOM}};
  gpr_22 = _RAND_25[63:0];
  _RAND_26 = {2{`RANDOM}};
  gpr_23 = _RAND_26[63:0];
  _RAND_27 = {2{`RANDOM}};
  gpr_24 = _RAND_27[63:0];
  _RAND_28 = {2{`RANDOM}};
  gpr_25 = _RAND_28[63:0];
  _RAND_29 = {2{`RANDOM}};
  gpr_26 = _RAND_29[63:0];
  _RAND_30 = {2{`RANDOM}};
  gpr_27 = _RAND_30[63:0];
  _RAND_31 = {2{`RANDOM}};
  gpr_28 = _RAND_31[63:0];
  _RAND_32 = {2{`RANDOM}};
  gpr_29 = _RAND_32[63:0];
  _RAND_33 = {2{`RANDOM}};
  gpr_30 = _RAND_33[63:0];
  _RAND_34 = {2{`RANDOM}};
  gpr_31 = _RAND_34[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210292_ArithmeticLogicalUnit(
  input         io_isa_ADD,
  input         io_isa_ADDI,
  input         io_isa_ADDW,
  input         io_isa_ADDIW,
  input         io_isa_SUB,
  input         io_isa_SUBW,
  input         io_isa_LUI,
  input         io_isa_XOR,
  input         io_isa_XORI,
  input         io_isa_OR,
  input         io_isa_ORI,
  input         io_isa_AND,
  input         io_isa_ANDI,
  input         io_isa_SLL,
  input         io_isa_SLLI,
  input         io_isa_SLLW,
  input         io_isa_SLLIW,
  input         io_isa_SRL,
  input         io_isa_SRLI,
  input         io_isa_SRLW,
  input         io_isa_SRLIW,
  input         io_isa_SRA,
  input         io_isa_SRAI,
  input         io_isa_SRAW,
  input         io_isa_SRAIW,
  input         io_isa_SLT,
  input         io_isa_SLTI,
  input         io_isa_SLTU,
  input         io_isa_SLTIU,
  input  [63:0] io_src1,
  input  [63:0] io_src2,
  input  [63:0] io_imm_I,
  input  [63:0] io_imm_U,
  output [63:0] io_result
);
  wire [62:0] addi_hi = io_isa_ADDI ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _addi_T_1 = {addi_hi,io_isa_ADDI}; // @[Cat.scala 30:58]
  wire [63:0] _addi_T_3 = io_src1 + io_imm_I; // @[ArithmeticLogicalUnit.scala 24:76]
  wire [63:0] addi = _addi_T_1 & _addi_T_3; // @[ArithmeticLogicalUnit.scala 24:65]
  wire [62:0] add_hi = io_isa_ADD ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _add_T_1 = {add_hi,io_isa_ADD}; // @[Cat.scala 30:58]
  wire [63:0] _add_T_3 = io_src1 + io_src2; // @[ArithmeticLogicalUnit.scala 25:76]
  wire [63:0] add = _add_T_1 & _add_T_3; // @[ArithmeticLogicalUnit.scala 25:65]
  wire [62:0] lui_hi = io_isa_LUI ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _lui_T_1 = {lui_hi,io_isa_LUI}; // @[Cat.scala 30:58]
  wire [63:0] lui = _lui_T_1 & io_imm_U; // @[ArithmeticLogicalUnit.scala 26:65]
  wire [62:0] sub_hi = io_isa_SUB ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _sub_T_1 = {sub_hi,io_isa_SUB}; // @[Cat.scala 30:58]
  wire [63:0] _sub_T_3 = io_src1 - io_src2; // @[ArithmeticLogicalUnit.scala 27:76]
  wire [63:0] sub = _sub_T_1 & _sub_T_3; // @[ArithmeticLogicalUnit.scala 27:65]
  wire [62:0] addiw_hi = io_isa_ADDIW ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _addiw_T_1 = {addiw_hi,io_isa_ADDIW}; // @[Cat.scala 30:58]
  wire [31:0] addiw_lo = _addi_T_3[31:0]; // @[ArithmeticLogicalUnit.scala 28:95]
  wire  addiw_signBit_1 = addiw_lo[31]; // @[Bundle.scala 220:20]
  wire [31:0] addiw_hi_1 = addiw_signBit_1 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _addiw_T_5 = {addiw_hi_1,addiw_lo}; // @[Cat.scala 30:58]
  wire [63:0] addiw = _addiw_T_1 & _addiw_T_5; // @[ArithmeticLogicalUnit.scala 28:65]
  wire [62:0] addw_hi = io_isa_ADDW ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _addw_T_1 = {addw_hi,io_isa_ADDW}; // @[Cat.scala 30:58]
  wire [31:0] addw_lo = _add_T_3[31:0]; // @[ArithmeticLogicalUnit.scala 29:94]
  wire  addw_signBit_1 = addw_lo[31]; // @[Bundle.scala 220:20]
  wire [31:0] addw_hi_1 = addw_signBit_1 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _addw_T_5 = {addw_hi_1,addw_lo}; // @[Cat.scala 30:58]
  wire [63:0] addw = _addw_T_1 & _addw_T_5; // @[ArithmeticLogicalUnit.scala 29:65]
  wire [62:0] subw_hi = io_isa_SUBW ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _subw_T_1 = {subw_hi,io_isa_SUBW}; // @[Cat.scala 30:58]
  wire [31:0] subw_lo = _sub_T_3[31:0]; // @[ArithmeticLogicalUnit.scala 30:94]
  wire  subw_signBit_1 = subw_lo[31]; // @[Bundle.scala 220:20]
  wire [31:0] subw_hi_1 = subw_signBit_1 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _subw_T_5 = {subw_hi_1,subw_lo}; // @[Cat.scala 30:58]
  wire [63:0] subw = _subw_T_1 & _subw_T_5; // @[ArithmeticLogicalUnit.scala 30:65]
  wire [63:0] _Arithmetic_T = addi | add; // @[ArithmeticLogicalUnit.scala 31:31]
  wire [63:0] _Arithmetic_T_1 = _Arithmetic_T | lui; // @[ArithmeticLogicalUnit.scala 31:37]
  wire [63:0] _Arithmetic_T_2 = _Arithmetic_T_1 | sub; // @[ArithmeticLogicalUnit.scala 31:43]
  wire [63:0] _Arithmetic_T_3 = _Arithmetic_T_2 | addiw; // @[ArithmeticLogicalUnit.scala 31:49]
  wire [63:0] _Arithmetic_T_4 = _Arithmetic_T_3 | addw; // @[ArithmeticLogicalUnit.scala 31:57]
  wire [63:0] Arithmetic = _Arithmetic_T_4 | subw; // @[ArithmeticLogicalUnit.scala 31:64]
  wire [62:0] andi_hi = io_isa_ANDI ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _andi_T_1 = {andi_hi,io_isa_ANDI}; // @[Cat.scala 30:58]
  wire [63:0] _andi_T_2 = io_src1 & io_imm_I; // @[ArithmeticLogicalUnit.scala 33:76]
  wire [63:0] andi = _andi_T_1 & _andi_T_2; // @[ArithmeticLogicalUnit.scala 33:65]
  wire [62:0] and_hi = io_isa_AND ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _and_T_1 = {and_hi,io_isa_AND}; // @[Cat.scala 30:58]
  wire [63:0] _and_T_2 = io_src1 & io_src2; // @[ArithmeticLogicalUnit.scala 34:76]
  wire [63:0] and_ = _and_T_1 & _and_T_2; // @[ArithmeticLogicalUnit.scala 34:65]
  wire [62:0] ori_hi = io_isa_ORI ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _ori_T_1 = {ori_hi,io_isa_ORI}; // @[Cat.scala 30:58]
  wire [63:0] _ori_T_2 = io_src1 | io_imm_I; // @[ArithmeticLogicalUnit.scala 35:76]
  wire [63:0] ori = _ori_T_1 & _ori_T_2; // @[ArithmeticLogicalUnit.scala 35:65]
  wire [62:0] or_hi = io_isa_OR ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _or_T_1 = {or_hi,io_isa_OR}; // @[Cat.scala 30:58]
  wire [63:0] _or_T_2 = io_src1 | io_src2; // @[ArithmeticLogicalUnit.scala 36:76]
  wire [63:0] or_ = _or_T_1 & _or_T_2; // @[ArithmeticLogicalUnit.scala 36:65]
  wire [62:0] xori_hi = io_isa_XORI ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _xori_T_1 = {xori_hi,io_isa_XORI}; // @[Cat.scala 30:58]
  wire [63:0] _xori_T_2 = io_src1 ^ io_imm_I; // @[ArithmeticLogicalUnit.scala 37:76]
  wire [63:0] xori = _xori_T_1 & _xori_T_2; // @[ArithmeticLogicalUnit.scala 37:65]
  wire [62:0] xor_hi = io_isa_XOR ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _xor_T_1 = {xor_hi,io_isa_XOR}; // @[Cat.scala 30:58]
  wire [63:0] _xor_T_2 = io_src1 ^ io_src2; // @[ArithmeticLogicalUnit.scala 38:76]
  wire [63:0] xor_ = _xor_T_1 & _xor_T_2; // @[ArithmeticLogicalUnit.scala 38:65]
  wire [63:0] _Logical_T = andi | and_; // @[ArithmeticLogicalUnit.scala 39:28]
  wire [63:0] _Logical_T_1 = _Logical_T | ori; // @[ArithmeticLogicalUnit.scala 39:34]
  wire [63:0] _Logical_T_2 = _Logical_T_1 | or_; // @[ArithmeticLogicalUnit.scala 39:40]
  wire [63:0] _Logical_T_3 = _Logical_T_2 | xori; // @[ArithmeticLogicalUnit.scala 39:45]
  wire [63:0] Logical = _Logical_T_3 | xor_; // @[ArithmeticLogicalUnit.scala 39:52]
  wire [63:0] slt = io_isa_SLT & $signed(io_src1) < $signed(io_src2) ? 64'h1 : 64'h0; // @[ArithmeticLogicalUnit.scala 41:30]
  wire [63:0] slti = io_isa_SLTI & $signed(io_src1) < $signed(io_imm_I) ? 64'h1 : 64'h0; // @[ArithmeticLogicalUnit.scala 42:30]
  wire [63:0] sltu = io_isa_SLTU & io_src1 < io_src2 ? 64'h1 : 64'h0; // @[ArithmeticLogicalUnit.scala 43:30]
  wire [63:0] sltiu = io_isa_SLTIU & io_src1 < io_imm_I ? 64'h1 : 64'h0; // @[ArithmeticLogicalUnit.scala 44:30]
  wire [63:0] _Compare_T = slt | slti; // @[ArithmeticLogicalUnit.scala 45:27]
  wire [63:0] _Compare_T_1 = _Compare_T | sltu; // @[ArithmeticLogicalUnit.scala 45:34]
  wire [63:0] Compare = _Compare_T_1 | sltiu; // @[ArithmeticLogicalUnit.scala 45:41]
  wire [62:0] sll_hi = io_isa_SLL ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _sll_T_1 = {sll_hi,io_isa_SLL}; // @[Cat.scala 30:58]
  wire [126:0] _GEN_0 = {{63'd0}, io_src1}; // @[ArithmeticLogicalUnit.scala 47:97]
  wire [126:0] _sll_T_3 = _GEN_0 << io_src2[5:0]; // @[ArithmeticLogicalUnit.scala 47:97]
  wire [63:0] sll = _sll_T_1 & _sll_T_3[63:0]; // @[ArithmeticLogicalUnit.scala 47:65]
  wire [62:0] srl_hi = io_isa_SRL ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _srl_T_1 = {srl_hi,io_isa_SRL}; // @[Cat.scala 30:58]
  wire [63:0] _srl_T_3 = io_src1 >> io_src2[5:0]; // @[ArithmeticLogicalUnit.scala 48:97]
  wire [63:0] srl = _srl_T_1 & _srl_T_3; // @[ArithmeticLogicalUnit.scala 48:65]
  wire [62:0] sra_hi = io_isa_SRA ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _sra_T_1 = {sra_hi,io_isa_SRA}; // @[Cat.scala 30:58]
  wire [63:0] _sra_T_5 = $signed(io_src1) >>> io_src2[5:0]; // @[ArithmeticLogicalUnit.scala 49:106]
  wire [63:0] sra = _sra_T_1 & _sra_T_5; // @[ArithmeticLogicalUnit.scala 49:65]
  wire [62:0] slli_hi = io_isa_SLLI ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _slli_T_1 = {slli_hi,io_isa_SLLI}; // @[Cat.scala 30:58]
  wire [126:0] _slli_T_3 = _GEN_0 << io_imm_I[5:0]; // @[ArithmeticLogicalUnit.scala 50:97]
  wire [63:0] slli = _slli_T_1 & _slli_T_3[63:0]; // @[ArithmeticLogicalUnit.scala 50:65]
  wire [62:0] srli_hi = io_isa_SRLI ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _srli_T_1 = {srli_hi,io_isa_SRLI}; // @[Cat.scala 30:58]
  wire [63:0] _srli_T_3 = io_src1 >> io_imm_I[5:0]; // @[ArithmeticLogicalUnit.scala 51:97]
  wire [63:0] srli = _srli_T_1 & _srli_T_3; // @[ArithmeticLogicalUnit.scala 51:65]
  wire [62:0] srai_hi = io_isa_SRAI ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _srai_T_1 = {srai_hi,io_isa_SRAI}; // @[Cat.scala 30:58]
  wire [63:0] _srai_T_5 = $signed(io_src1) >>> io_imm_I[5:0]; // @[ArithmeticLogicalUnit.scala 52:107]
  wire [63:0] srai = _srai_T_1 & _srai_T_5; // @[ArithmeticLogicalUnit.scala 52:65]
  wire [62:0] sllw_hi = io_isa_SLLW ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _sllw_T_1 = {sllw_hi,io_isa_SLLW}; // @[Cat.scala 30:58]
  wire [94:0] _GEN_2 = {{31'd0}, io_src1}; // @[ArithmeticLogicalUnit.scala 53:113]
  wire [94:0] _sllw_T_3 = _GEN_2 << io_src2[4:0]; // @[ArithmeticLogicalUnit.scala 53:113]
  wire [31:0] sllw_lo = _sllw_T_3[31:0]; // @[ArithmeticLogicalUnit.scala 53:129]
  wire  sllw_signBit_1 = sllw_lo[31]; // @[Bundle.scala 220:20]
  wire [31:0] sllw_hi_1 = sllw_signBit_1 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _sllw_T_5 = {sllw_hi_1,sllw_lo}; // @[Cat.scala 30:58]
  wire [63:0] sllw = _sllw_T_1 & _sllw_T_5; // @[ArithmeticLogicalUnit.scala 53:65]
  wire [62:0] srlw_hi = io_isa_SRLW ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _srlw_T_1 = {srlw_hi,io_isa_SRLW}; // @[Cat.scala 30:58]
  wire [31:0] srlw_lo = io_src1[31:0] >> io_src2[4:0]; // @[ArithmeticLogicalUnit.scala 54:105]
  wire  srlw_signBit_1 = srlw_lo[31]; // @[Bundle.scala 220:20]
  wire [31:0] srlw_hi_1 = srlw_signBit_1 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _srlw_T_5 = {srlw_hi_1,srlw_lo}; // @[Cat.scala 30:58]
  wire [63:0] srlw = _srlw_T_1 & _srlw_T_5; // @[ArithmeticLogicalUnit.scala 54:65]
  wire [62:0] sraw_hi = io_isa_SRAW ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _sraw_T_1 = {sraw_hi,io_isa_SRAW}; // @[Cat.scala 30:58]
  wire [31:0] _sraw_T_3 = io_src1[31:0]; // @[ArithmeticLogicalUnit.scala 55:90]
  wire [31:0] sraw_lo = $signed(_sraw_T_3) >>> io_src2[4:0]; // @[ArithmeticLogicalUnit.scala 55:114]
  wire  sraw_signBit_1 = sraw_lo[31]; // @[Bundle.scala 220:20]
  wire [31:0] sraw_hi_1 = sraw_signBit_1 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _sraw_T_7 = {sraw_hi_1,sraw_lo}; // @[Cat.scala 30:58]
  wire [63:0] sraw = _sraw_T_1 & _sraw_T_7; // @[ArithmeticLogicalUnit.scala 55:65]
  wire [62:0] slliw_hi = io_isa_SLLIW ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _slliw_T_1 = {slliw_hi,io_isa_SLLIW}; // @[Cat.scala 30:58]
  wire [94:0] _slliw_T_3 = _GEN_2 << io_imm_I[4:0]; // @[ArithmeticLogicalUnit.scala 56:113]
  wire [31:0] slliw_lo = _slliw_T_3[31:0]; // @[ArithmeticLogicalUnit.scala 56:130]
  wire  slliw_signBit_1 = slliw_lo[31]; // @[Bundle.scala 220:20]
  wire [31:0] slliw_hi_1 = slliw_signBit_1 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _slliw_T_5 = {slliw_hi_1,slliw_lo}; // @[Cat.scala 30:58]
  wire [63:0] slliw = _slliw_T_1 & _slliw_T_5; // @[ArithmeticLogicalUnit.scala 56:65]
  wire [62:0] srliw_hi = io_isa_SRLIW ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _srliw_T_1 = {srliw_hi,io_isa_SRLIW}; // @[Cat.scala 30:58]
  wire [31:0] srliw_lo = io_src1[31:0] >> io_imm_I[4:0]; // @[ArithmeticLogicalUnit.scala 57:105]
  wire  srliw_signBit_1 = srliw_lo[31]; // @[Bundle.scala 220:20]
  wire [31:0] srliw_hi_1 = srliw_signBit_1 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _srliw_T_5 = {srliw_hi_1,srliw_lo}; // @[Cat.scala 30:58]
  wire [63:0] srliw = _srliw_T_1 & _srliw_T_5; // @[ArithmeticLogicalUnit.scala 57:65]
  wire [62:0] sraiw_hi = io_isa_SRAIW ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _sraiw_T_1 = {sraiw_hi,io_isa_SRAIW}; // @[Cat.scala 30:58]
  wire [31:0] sraiw_lo = $signed(_sraw_T_3) >>> io_imm_I[4:0]; // @[ArithmeticLogicalUnit.scala 58:115]
  wire  sraiw_signBit_1 = sraiw_lo[31]; // @[Bundle.scala 220:20]
  wire [31:0] sraiw_hi_1 = sraiw_signBit_1 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _sraiw_T_7 = {sraiw_hi_1,sraiw_lo}; // @[Cat.scala 30:58]
  wire [63:0] sraiw = _sraiw_T_1 & _sraiw_T_7; // @[ArithmeticLogicalUnit.scala 58:65]
  wire [63:0] _Shifts_T = sll | srl; // @[ArithmeticLogicalUnit.scala 59:26]
  wire [63:0] _Shifts_T_1 = _Shifts_T | sra; // @[ArithmeticLogicalUnit.scala 59:32]
  wire [63:0] _Shifts_T_2 = _Shifts_T_1 | slli; // @[ArithmeticLogicalUnit.scala 59:38]
  wire [63:0] _Shifts_T_3 = _Shifts_T_2 | srli; // @[ArithmeticLogicalUnit.scala 59:45]
  wire [63:0] _Shifts_T_4 = _Shifts_T_3 | srai; // @[ArithmeticLogicalUnit.scala 59:52]
  wire [63:0] _Shifts_T_5 = _Shifts_T_4 | sllw; // @[ArithmeticLogicalUnit.scala 59:59]
  wire [63:0] _Shifts_T_6 = _Shifts_T_5 | srlw; // @[ArithmeticLogicalUnit.scala 59:66]
  wire [63:0] _Shifts_T_7 = _Shifts_T_6 | sraw; // @[ArithmeticLogicalUnit.scala 59:73]
  wire [63:0] _Shifts_T_8 = _Shifts_T_7 | slliw; // @[ArithmeticLogicalUnit.scala 59:80]
  wire [63:0] _Shifts_T_9 = _Shifts_T_8 | srliw; // @[ArithmeticLogicalUnit.scala 59:88]
  wire [63:0] Shifts = _Shifts_T_9 | sraiw; // @[ArithmeticLogicalUnit.scala 59:96]
  wire [63:0] _io_result_T = Arithmetic | Logical; // @[ArithmeticLogicalUnit.scala 61:33]
  wire [63:0] _io_result_T_1 = _io_result_T | Compare; // @[ArithmeticLogicalUnit.scala 61:43]
  assign io_result = _io_result_T_1 | Shifts; // @[ArithmeticLogicalUnit.scala 61:53]
endmodule
module ysyx_210292_BranchController(
  input         io_isa_BEQ,
  input         io_isa_BNE,
  input         io_isa_BLT,
  input         io_isa_BGE,
  input         io_isa_BLTU,
  input         io_isa_BGEU,
  input         io_isa_JAL,
  input         io_isa_JALR,
  input  [63:0] io_imm_I,
  input  [63:0] io_imm_B,
  input  [63:0] io_imm_J,
  input  [63:0] io_src1,
  input  [63:0] io_src2,
  input  [63:0] io_pc,
  output        io_branch,
  output [63:0] io_target
);
  wire  beq = io_isa_BEQ & io_src1 == io_src2; // @[BranchController.scala 19:30]
  wire  bne = io_isa_BNE & io_src1 != io_src2; // @[BranchController.scala 20:30]
  wire  bgeu = io_isa_BGEU & io_src1 >= io_src2; // @[BranchController.scala 21:32]
  wire  bltu = io_isa_BLTU & io_src1 < io_src2; // @[BranchController.scala 22:32]
  wire  bge = io_isa_BGE & $signed(io_src1) >= $signed(io_src2); // @[BranchController.scala 23:30]
  wire  blt = io_isa_BLT & $signed(io_src1) < $signed(io_src2); // @[BranchController.scala 24:30]
  wire  b = beq | bne | bgeu | bltu | bge | blt; // @[BranchController.scala 25:47]
  wire [63:0] b_target = io_pc + io_imm_B; // @[BranchController.scala 30:30]
  wire [63:0] jal_target = io_pc + io_imm_J; // @[BranchController.scala 31:32]
  wire [63:0] jalr_target = io_src1 + io_imm_I; // @[BranchController.scala 32:35]
  wire [63:0] _GEN_0 = io_isa_JALR ? jalr_target : b_target; // @[BranchController.scala 38:26 BranchController.scala 39:27 BranchController.scala 41:27]
  assign io_branch = b | io_isa_JAL | io_isa_JALR; // @[BranchController.scala 34:30]
  assign io_target = io_isa_JAL ? jal_target : _GEN_0; // @[BranchController.scala 36:19 BranchController.scala 37:27]
endmodule
module ysyx_210292_ControlStatusRegisterUnit(
  input         clock,
  input         reset,
  input         io_ENABLE,
  input  [63:0] io_pc,
  input  [63:0] io_inst,
  input  [63:0] io_src,
  output [63:0] io_dataout,
  input         io_TimeOver,
  output        io_TimerInterrupt,
  output        io_EnvironmentCall,
  output [63:0] io_CSRState_mepc,
  output [63:0] io_CSRState_mtvec
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
  reg [31:0] _RAND_10;
`endif // RANDOMIZE_REG_INIT
  wire [63:0] _CSRRW_T = io_inst & 64'h707f; // @[ControlStatusRegisterUnit.scala 27:44]
  wire  CSRRW = 64'h1073 == _CSRRW_T; // @[ControlStatusRegisterUnit.scala 27:44]
  wire  CSRRWI = 64'h5073 == _CSRRW_T; // @[ControlStatusRegisterUnit.scala 28:36]
  wire  CSRRS = 64'h2073 == _CSRRW_T; // @[ControlStatusRegisterUnit.scala 29:44]
  wire  CSRRSI = 64'h6073 == _CSRRW_T; // @[ControlStatusRegisterUnit.scala 30:36]
  wire  CSRRC = 64'h3073 == _CSRRW_T; // @[ControlStatusRegisterUnit.scala 31:44]
  wire  CSRRCI = 64'h7073 == _CSRRW_T; // @[ControlStatusRegisterUnit.scala 32:36]
  wire  isCSR = CSRRC | CSRRCI | CSRRS | CSRRSI | CSRRW | CSRRWI; // @[ControlStatusRegisterUnit.scala 33:71]
  wire [63:0] _isMRET_T = io_inst & 64'hffffffff; // @[ControlStatusRegisterUnit.scala 34:26]
  wire  isMRET = 64'h30200073 == _isMRET_T; // @[ControlStatusRegisterUnit.scala 34:26]
  wire  EnvironmentCall = 64'h73 == _isMRET_T; // @[ControlStatusRegisterUnit.scala 35:26]
  wire [4:0] zimm_lo = io_inst[19:15]; // @[ControlStatusRegisterUnit.scala 36:42]
  wire [63:0] zimm = {59'h0,zimm_lo}; // @[Cat.scala 30:58]
  wire [11:0] addr = io_inst[31:20]; // @[ControlStatusRegisterUnit.scala 37:34]
  reg [63:0] mcycle; // @[ControlStatusRegisterUnit.scala 40:26]
  reg [63:0] mstatus; // @[ControlStatusRegisterUnit.scala 41:24]
  reg [63:0] mtvec; // @[ControlStatusRegisterUnit.scala 42:26]
  reg [63:0] mcause; // @[ControlStatusRegisterUnit.scala 43:26]
  reg [63:0] mepc; // @[ControlStatusRegisterUnit.scala 44:34]
  reg [63:0] mie; // @[ControlStatusRegisterUnit.scala 45:24]
  reg [63:0] mip; // @[ControlStatusRegisterUnit.scala 46:24]
  reg [63:0] mscratch; // @[ControlStatusRegisterUnit.scala 47:28]
  reg [63:0] medeleg; // @[ControlStatusRegisterUnit.scala 48:28]
  reg [63:0] mhartid; // @[ControlStatusRegisterUnit.scala 49:28]
  wire  vis_mcycle = addr == 12'hb00; // @[ControlStatusRegisterUnit.scala 52:32]
  wire  vis_mstatus = addr == 12'h300; // @[ControlStatusRegisterUnit.scala 53:32]
  wire  vis_mtvec = addr == 12'h305; // @[ControlStatusRegisterUnit.scala 54:32]
  wire  vis_mcause = addr == 12'h342; // @[ControlStatusRegisterUnit.scala 55:32]
  wire  vis_mepc = addr == 12'h341; // @[ControlStatusRegisterUnit.scala 56:32]
  wire  vis_mie = addr == 12'h304; // @[ControlStatusRegisterUnit.scala 57:26]
  wire  vis_mip = addr == 12'h344; // @[ControlStatusRegisterUnit.scala 58:26]
  wire  vis_mscratch = addr == 12'h340; // @[ControlStatusRegisterUnit.scala 59:30]
  wire  vis_medeleg = addr == 12'h302; // @[ControlStatusRegisterUnit.scala 60:30]
  wire  vis_mhartid = addr == 12'hf14; // @[ControlStatusRegisterUnit.scala 61:30]
  wire  _temp_mcycle_T = isCSR & vis_mcycle; // @[ControlStatusRegisterUnit.scala 64:31]
  wire [63:0] temp_mcycle = isCSR & vis_mcycle ? mcycle : 64'h0; // @[ControlStatusRegisterUnit.scala 64:24]
  wire  _temp_mstatus_T = isCSR & vis_mstatus; // @[ControlStatusRegisterUnit.scala 65:31]
  wire [63:0] temp_mstatus = isCSR & vis_mstatus ? mstatus : 64'h0; // @[ControlStatusRegisterUnit.scala 65:24]
  wire  _temp_mtvec_T = isCSR & vis_mtvec; // @[ControlStatusRegisterUnit.scala 66:37]
  wire [63:0] temp_mtvec = isCSR & vis_mtvec ? mtvec : 64'h0; // @[ControlStatusRegisterUnit.scala 66:30]
  wire  _temp_mcause_T = isCSR & vis_mcause; // @[ControlStatusRegisterUnit.scala 67:31]
  wire [63:0] temp_mcause = isCSR & vis_mcause ? mcause : 64'h0; // @[ControlStatusRegisterUnit.scala 67:24]
  wire  _temp_mepc_T = isCSR & vis_mepc; // @[ControlStatusRegisterUnit.scala 68:37]
  wire [63:0] temp_mepc = isCSR & vis_mepc ? mepc : 64'h0; // @[ControlStatusRegisterUnit.scala 68:30]
  wire  _temp_mie_T = isCSR & vis_mie; // @[ControlStatusRegisterUnit.scala 69:31]
  wire [63:0] temp_mie = isCSR & vis_mie ? mie : 64'h0; // @[ControlStatusRegisterUnit.scala 69:24]
  wire  _temp_mip_T = isCSR & vis_mip; // @[ControlStatusRegisterUnit.scala 70:31]
  wire [63:0] temp_mip = isCSR & vis_mip ? mip : 64'h0; // @[ControlStatusRegisterUnit.scala 70:24]
  wire  _temp_mscratch_T = isCSR & vis_mscratch; // @[ControlStatusRegisterUnit.scala 71:35]
  wire [63:0] temp_mscratch = isCSR & vis_mscratch ? mscratch : 64'h0; // @[ControlStatusRegisterUnit.scala 71:28]
  wire  _temp_medeleg_T = isCSR & vis_medeleg; // @[ControlStatusRegisterUnit.scala 72:35]
  wire [63:0] temp_medeleg = isCSR & vis_medeleg ? medeleg : 64'h0; // @[ControlStatusRegisterUnit.scala 72:28]
  wire  _temp_mhartid_T = isCSR & vis_mhartid; // @[ControlStatusRegisterUnit.scala 73:35]
  wire [63:0] temp_mhartid = isCSR & vis_mhartid ? mhartid : 64'h0; // @[ControlStatusRegisterUnit.scala 73:28]
  wire [63:0] _temp_T = temp_mcycle | temp_mstatus; // @[ControlStatusRegisterUnit.scala 74:26]
  wire [63:0] _temp_T_1 = _temp_T | temp_mtvec; // @[ControlStatusRegisterUnit.scala 74:41]
  wire [63:0] _temp_T_2 = _temp_T_1 | temp_mcause; // @[ControlStatusRegisterUnit.scala 74:54]
  wire [63:0] _temp_T_3 = _temp_T_2 | temp_mepc; // @[ControlStatusRegisterUnit.scala 74:68]
  wire [63:0] _temp_T_4 = _temp_T_3 | temp_mie; // @[ControlStatusRegisterUnit.scala 74:80]
  wire [63:0] _temp_T_5 = _temp_T_4 | temp_mip; // @[ControlStatusRegisterUnit.scala 74:91]
  wire [63:0] _temp_T_6 = _temp_T_5 | temp_mscratch; // @[ControlStatusRegisterUnit.scala 74:102]
  wire [63:0] _temp_T_7 = _temp_T_6 | temp_medeleg; // @[ControlStatusRegisterUnit.scala 75:28]
  wire [63:0] temp = _temp_T_7 | temp_mhartid; // @[ControlStatusRegisterUnit.scala 75:43]
  wire  MIE = mstatus[3]; // @[ControlStatusRegisterUnit.scala 78:20]
  wire  MPIE = mstatus[7]; // @[ControlStatusRegisterUnit.scala 79:21]
  wire  MTIE = mie[7]; // @[ControlStatusRegisterUnit.scala 81:17]
  wire  MTIP = mip[7]; // @[ControlStatusRegisterUnit.scala 82:17]
  wire  TIV = MIE & (MTIE & MTIP); // @[ControlStatusRegisterUnit.scala 83:17]
  reg  TIVR; // @[Reg.scala 27:20]
  wire  TimerInterrupt = TIV & ~TIVR; // @[ControlStatusRegisterUnit.scala 88:28]
  wire [62:0] data_rc_hi = CSRRC ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _data_rc_T_1 = {data_rc_hi,CSRRC}; // @[Cat.scala 30:58]
  wire [63:0] _data_rc_T_2 = ~io_src; // @[ControlStatusRegisterUnit.scala 94:67]
  wire [63:0] _data_rc_T_3 = temp & _data_rc_T_2; // @[ControlStatusRegisterUnit.scala 94:65]
  wire [63:0] data_rc = _data_rc_T_1 & _data_rc_T_3; // @[ControlStatusRegisterUnit.scala 94:57]
  wire [62:0] data_rci_hi = CSRRCI ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _data_rci_T_1 = {data_rci_hi,CSRRCI}; // @[Cat.scala 30:58]
  wire [63:0] _data_rci_T_2 = ~zimm; // @[ControlStatusRegisterUnit.scala 95:59]
  wire [63:0] _data_rci_T_3 = temp & _data_rci_T_2; // @[ControlStatusRegisterUnit.scala 95:57]
  wire [63:0] data_rci = _data_rci_T_1 & _data_rci_T_3; // @[ControlStatusRegisterUnit.scala 95:49]
  wire [62:0] data_rs_hi = CSRRS ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _data_rs_T_1 = {data_rs_hi,CSRRS}; // @[Cat.scala 30:58]
  wire [63:0] _data_rs_T_2 = temp | io_src; // @[ControlStatusRegisterUnit.scala 96:65]
  wire [63:0] data_rs = _data_rs_T_1 & _data_rs_T_2; // @[ControlStatusRegisterUnit.scala 96:57]
  wire [62:0] data_rsi_hi = CSRRSI ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _data_rsi_T_1 = {data_rsi_hi,CSRRSI}; // @[Cat.scala 30:58]
  wire [63:0] _data_rsi_T_2 = temp | zimm; // @[ControlStatusRegisterUnit.scala 97:57]
  wire [63:0] data_rsi = _data_rsi_T_1 & _data_rsi_T_2; // @[ControlStatusRegisterUnit.scala 97:49]
  wire [62:0] data_rw_hi = CSRRW ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _data_rw_T_1 = {data_rw_hi,CSRRW}; // @[Cat.scala 30:58]
  wire [63:0] data_rw = _data_rw_T_1 & io_src; // @[ControlStatusRegisterUnit.scala 98:57]
  wire [62:0] data_rwi_hi = CSRRWI ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _data_rwi_T_1 = {data_rwi_hi,CSRRWI}; // @[Cat.scala 30:58]
  wire [63:0] data_rwi = _data_rwi_T_1 & zimm; // @[ControlStatusRegisterUnit.scala 99:49]
  wire [63:0] _wdata_T = data_rc | data_rci; // @[ControlStatusRegisterUnit.scala 100:35]
  wire [63:0] _wdata_T_1 = _wdata_T | data_rs; // @[ControlStatusRegisterUnit.scala 100:46]
  wire [63:0] _wdata_T_2 = _wdata_T_1 | data_rsi; // @[ControlStatusRegisterUnit.scala 100:56]
  wire [63:0] _wdata_T_3 = _wdata_T_2 | data_rw; // @[ControlStatusRegisterUnit.scala 100:67]
  wire [63:0] wdata = _wdata_T_3 | data_rwi; // @[ControlStatusRegisterUnit.scala 100:77]
  wire  SD = wdata[16:15] == 2'h3 | wdata[14:13] == 2'h3; // @[ControlStatusRegisterUnit.scala 108:31]
  wire [50:0] Trap_hi_hi_hi = mstatus[63:13]; // @[ControlStatusRegisterUnit.scala 113:25]
  wire [63:0] Trap = {Trap_hi_hi_hi,2'h3,3'h0,MIE,7'h0}; // @[Cat.scala 30:58]
  wire [63:0] Return = {Trap_hi_hi_hi,2'h0,4'h1,3'h0,MPIE,3'h0}; // @[Cat.scala 30:58]
  wire [63:0] _mcycle_T_1 = mcycle + 64'h1; // @[ControlStatusRegisterUnit.scala 121:22]
  wire  _T_1 = TimerInterrupt | EnvironmentCall; // @[ControlStatusRegisterUnit.scala 126:29]
  wire [62:0] mstatus_lo = wdata[62:0]; // @[ControlStatusRegisterUnit.scala 131:38]
  wire [63:0] _mstatus_T = {SD,mstatus_lo}; // @[Cat.scala 30:58]
  wire [63:0] _GEN_2 = _temp_mstatus_T ? _mstatus_T : mstatus; // @[ControlStatusRegisterUnit.scala 130:42 ControlStatusRegisterUnit.scala 131:15 ControlStatusRegisterUnit.scala 41:24]
  wire [7:0] _mip_T = io_TimeOver ? 8'h80 : 8'h0; // @[ControlStatusRegisterUnit.scala 141:17]
  wire [63:0] _GEN_8 = _temp_mcause_T ? wdata : mcause; // @[ControlStatusRegisterUnit.scala 148:49 ControlStatusRegisterUnit.scala 149:32 ControlStatusRegisterUnit.scala 43:26]
  assign io_dataout = _temp_T_7 | temp_mhartid; // @[ControlStatusRegisterUnit.scala 75:43]
  assign io_TimerInterrupt = TIV & ~TIVR; // @[ControlStatusRegisterUnit.scala 88:28]
  assign io_EnvironmentCall = 64'h73 == _isMRET_T; // @[ControlStatusRegisterUnit.scala 35:26]
  assign io_CSRState_mepc = mepc; // @[ControlStatusRegisterUnit.scala 176:20]
  assign io_CSRState_mtvec = mtvec; // @[ControlStatusRegisterUnit.scala 189:21]
  always @(posedge clock) begin
    if (reset) begin // @[ControlStatusRegisterUnit.scala 40:26]
      mcycle <= 64'h0; // @[ControlStatusRegisterUnit.scala 40:26]
    end else if (_temp_mcycle_T) begin // @[ControlStatusRegisterUnit.scala 118:29]
      mcycle <= wdata; // @[ControlStatusRegisterUnit.scala 119:12]
    end else begin
      mcycle <= _mcycle_T_1; // @[ControlStatusRegisterUnit.scala 121:12]
    end
    if (reset) begin // @[ControlStatusRegisterUnit.scala 41:24]
      mstatus <= 64'h0; // @[ControlStatusRegisterUnit.scala 41:24]
    end else if (io_ENABLE) begin // @[ControlStatusRegisterUnit.scala 124:18]
      if (TimerInterrupt | EnvironmentCall) begin // @[ControlStatusRegisterUnit.scala 126:49]
        mstatus <= Trap; // @[ControlStatusRegisterUnit.scala 127:25]
      end else if (isMRET) begin // @[ControlStatusRegisterUnit.scala 128:24]
        mstatus <= Return; // @[ControlStatusRegisterUnit.scala 129:15]
      end else begin
        mstatus <= _GEN_2;
      end
    end
    if (reset) begin // @[ControlStatusRegisterUnit.scala 42:26]
      mtvec <= 64'h0; // @[ControlStatusRegisterUnit.scala 42:26]
    end else if (io_ENABLE) begin // @[ControlStatusRegisterUnit.scala 124:18]
      if (_temp_mtvec_T) begin // @[ControlStatusRegisterUnit.scala 134:42]
        mtvec <= wdata; // @[ControlStatusRegisterUnit.scala 134:50]
      end
    end
    if (reset) begin // @[ControlStatusRegisterUnit.scala 43:26]
      mcause <= 64'h0; // @[ControlStatusRegisterUnit.scala 43:26]
    end else if (io_ENABLE) begin // @[ControlStatusRegisterUnit.scala 124:18]
      if (TimerInterrupt) begin // @[ControlStatusRegisterUnit.scala 144:38]
        mcause <= 64'h8000000000000007; // @[ControlStatusRegisterUnit.scala 145:32]
      end else if (EnvironmentCall) begin // @[ControlStatusRegisterUnit.scala 146:45]
        mcause <= 64'hb; // @[ControlStatusRegisterUnit.scala 147:32]
      end else begin
        mcause <= _GEN_8;
      end
    end
    if (reset) begin // @[ControlStatusRegisterUnit.scala 44:34]
      mepc <= 64'h0; // @[ControlStatusRegisterUnit.scala 44:34]
    end else if (io_ENABLE) begin // @[ControlStatusRegisterUnit.scala 124:18]
      if (_T_1) begin // @[ControlStatusRegisterUnit.scala 152:57]
        mepc <= io_pc; // @[ControlStatusRegisterUnit.scala 153:30]
      end else if (_temp_mepc_T) begin // @[ControlStatusRegisterUnit.scala 154:47]
        mepc <= wdata; // @[ControlStatusRegisterUnit.scala 155:30]
      end
    end
    if (reset) begin // @[ControlStatusRegisterUnit.scala 45:24]
      mie <= 64'h0; // @[ControlStatusRegisterUnit.scala 45:24]
    end else if (io_ENABLE) begin // @[ControlStatusRegisterUnit.scala 124:18]
      if (_temp_mie_T) begin // @[ControlStatusRegisterUnit.scala 136:28]
        mie <= wdata; // @[ControlStatusRegisterUnit.scala 136:34]
      end
    end
    if (reset) begin // @[ControlStatusRegisterUnit.scala 46:24]
      mip <= 64'h0; // @[ControlStatusRegisterUnit.scala 46:24]
    end else if (io_ENABLE) begin // @[ControlStatusRegisterUnit.scala 124:18]
      if (_temp_mip_T) begin // @[ControlStatusRegisterUnit.scala 138:28]
        mip <= wdata; // @[ControlStatusRegisterUnit.scala 139:11]
      end else begin
        mip <= {{56'd0}, _mip_T}; // @[ControlStatusRegisterUnit.scala 141:11]
      end
    end
    if (reset) begin // @[ControlStatusRegisterUnit.scala 47:28]
      mscratch <= 64'h0; // @[ControlStatusRegisterUnit.scala 47:28]
    end else if (io_ENABLE) begin // @[ControlStatusRegisterUnit.scala 124:18]
      if (_temp_mscratch_T) begin // @[ControlStatusRegisterUnit.scala 158:33]
        mscratch <= wdata; // @[ControlStatusRegisterUnit.scala 158:44]
      end
    end
    if (reset) begin // @[ControlStatusRegisterUnit.scala 48:28]
      medeleg <= 64'h0; // @[ControlStatusRegisterUnit.scala 48:28]
    end else if (io_ENABLE) begin // @[ControlStatusRegisterUnit.scala 124:18]
      if (_temp_medeleg_T) begin // @[ControlStatusRegisterUnit.scala 159:32]
        medeleg <= wdata; // @[ControlStatusRegisterUnit.scala 159:42]
      end
    end
    if (reset) begin // @[ControlStatusRegisterUnit.scala 49:28]
      mhartid <= 64'h0; // @[ControlStatusRegisterUnit.scala 49:28]
    end else if (io_ENABLE) begin // @[ControlStatusRegisterUnit.scala 124:18]
      if (_temp_mhartid_T) begin // @[ControlStatusRegisterUnit.scala 160:32]
        mhartid <= wdata; // @[ControlStatusRegisterUnit.scala 160:42]
      end
    end
    if (reset) begin // @[Reg.scala 27:20]
      TIVR <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      TIVR <= TIV; // @[Reg.scala 28:23]
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
  mcycle = _RAND_0[63:0];
  _RAND_1 = {2{`RANDOM}};
  mstatus = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  mtvec = _RAND_2[63:0];
  _RAND_3 = {2{`RANDOM}};
  mcause = _RAND_3[63:0];
  _RAND_4 = {2{`RANDOM}};
  mepc = _RAND_4[63:0];
  _RAND_5 = {2{`RANDOM}};
  mie = _RAND_5[63:0];
  _RAND_6 = {2{`RANDOM}};
  mip = _RAND_6[63:0];
  _RAND_7 = {2{`RANDOM}};
  mscratch = _RAND_7[63:0];
  _RAND_8 = {2{`RANDOM}};
  medeleg = _RAND_8[63:0];
  _RAND_9 = {2{`RANDOM}};
  mhartid = _RAND_9[63:0];
  _RAND_10 = {1{`RANDOM}};
  TIVR = _RAND_10[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210292_Execute(
  input         clock,
  input         reset,
  input         io_ENABLE,
  input         io_idex_Valid,
  input  [31:0] io_idex_Inst,
  input  [63:0] io_idex_PC,
  input         io_idex_isa_ADD,
  input         io_idex_isa_ADDI,
  input         io_idex_isa_ADDW,
  input         io_idex_isa_ADDIW,
  input         io_idex_isa_SUB,
  input         io_idex_isa_SUBW,
  input         io_idex_isa_LUI,
  input         io_idex_isa_AUIPC,
  input         io_idex_isa_XOR,
  input         io_idex_isa_XORI,
  input         io_idex_isa_OR,
  input         io_idex_isa_ORI,
  input         io_idex_isa_AND,
  input         io_idex_isa_ANDI,
  input         io_idex_isa_SLL,
  input         io_idex_isa_SLLI,
  input         io_idex_isa_SLLW,
  input         io_idex_isa_SLLIW,
  input         io_idex_isa_SRL,
  input         io_idex_isa_SRLI,
  input         io_idex_isa_SRLW,
  input         io_idex_isa_SRLIW,
  input         io_idex_isa_SRA,
  input         io_idex_isa_SRAI,
  input         io_idex_isa_SRAW,
  input         io_idex_isa_SRAIW,
  input         io_idex_isa_SLT,
  input         io_idex_isa_SLTI,
  input         io_idex_isa_SLTU,
  input         io_idex_isa_SLTIU,
  input         io_idex_isa_BEQ,
  input         io_idex_isa_BNE,
  input         io_idex_isa_BLT,
  input         io_idex_isa_BGE,
  input         io_idex_isa_BLTU,
  input         io_idex_isa_BGEU,
  input         io_idex_isa_JAL,
  input         io_idex_isa_JALR,
  input         io_idex_isa_LD,
  input         io_idex_isa_LW,
  input         io_idex_isa_LH,
  input         io_idex_isa_LB,
  input         io_idex_isa_LWU,
  input         io_idex_isa_LHU,
  input         io_idex_isa_LBU,
  input         io_idex_isa_SD,
  input         io_idex_isa_SW,
  input         io_idex_isa_SH,
  input         io_idex_isa_SB,
  input         io_idex_isa_MRET,
  input  [63:0] io_idex_src1,
  input  [63:0] io_idex_src2,
  input  [63:0] io_idex_imm_I,
  input  [63:0] io_idex_imm_B,
  input  [63:0] io_idex_imm_S,
  input  [63:0] io_idex_imm_U,
  input  [63:0] io_idex_imm_J,
  input         io_idex_wen,
  input  [4:0]  io_idex_regdes,
  output        io_exmem_Valid,
  output        io_exmem_isa_LD,
  output        io_exmem_isa_LW,
  output        io_exmem_isa_LH,
  output        io_exmem_isa_LB,
  output        io_exmem_isa_LWU,
  output        io_exmem_isa_LHU,
  output        io_exmem_isa_LBU,
  output        io_exmem_isa_SD,
  output        io_exmem_isa_SW,
  output        io_exmem_isa_SH,
  output        io_exmem_isa_SB,
  output [63:0] io_exmem_src1,
  output [63:0] io_exmem_src2,
  output [63:0] io_exmem_imm_I,
  output [63:0] io_exmem_imm_S,
  output        io_exmem_wen,
  output [4:0]  io_exmem_regdes,
  output [63:0] io_exmem_aluresult,
  output [63:0] io_exmem_link,
  output [63:0] io_exmem_auipc,
  output [63:0] io_exmem_csrData,
  output        io_cancel,
  output        io_nextPC_trap,
  output [63:0] io_nextPC_mtvec,
  output        io_nextPC_mret,
  output [63:0] io_nextPC_mepc,
  output        io_nextPC_branch,
  output [63:0] io_nextPC_target,
  input         io_redesMem_wen,
  input  [4:0]  io_redesMem_regdes,
  input  [63:0] io_redesMem_data,
  input         io_redesWb_wen,
  input  [4:0]  io_redesWb_regdes,
  input  [63:0] io_redesWb_data,
  input         io_TimeOver
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [63:0] _RAND_2;
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
  reg [63:0] _RAND_53;
  reg [63:0] _RAND_54;
  reg [63:0] _RAND_55;
  reg [63:0] _RAND_56;
  reg [63:0] _RAND_57;
  reg [63:0] _RAND_58;
  reg [63:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
`endif // RANDOMIZE_REG_INIT
  wire  alu_io_isa_ADD; // @[Execute.scala 43:19]
  wire  alu_io_isa_ADDI; // @[Execute.scala 43:19]
  wire  alu_io_isa_ADDW; // @[Execute.scala 43:19]
  wire  alu_io_isa_ADDIW; // @[Execute.scala 43:19]
  wire  alu_io_isa_SUB; // @[Execute.scala 43:19]
  wire  alu_io_isa_SUBW; // @[Execute.scala 43:19]
  wire  alu_io_isa_LUI; // @[Execute.scala 43:19]
  wire  alu_io_isa_XOR; // @[Execute.scala 43:19]
  wire  alu_io_isa_XORI; // @[Execute.scala 43:19]
  wire  alu_io_isa_OR; // @[Execute.scala 43:19]
  wire  alu_io_isa_ORI; // @[Execute.scala 43:19]
  wire  alu_io_isa_AND; // @[Execute.scala 43:19]
  wire  alu_io_isa_ANDI; // @[Execute.scala 43:19]
  wire  alu_io_isa_SLL; // @[Execute.scala 43:19]
  wire  alu_io_isa_SLLI; // @[Execute.scala 43:19]
  wire  alu_io_isa_SLLW; // @[Execute.scala 43:19]
  wire  alu_io_isa_SLLIW; // @[Execute.scala 43:19]
  wire  alu_io_isa_SRL; // @[Execute.scala 43:19]
  wire  alu_io_isa_SRLI; // @[Execute.scala 43:19]
  wire  alu_io_isa_SRLW; // @[Execute.scala 43:19]
  wire  alu_io_isa_SRLIW; // @[Execute.scala 43:19]
  wire  alu_io_isa_SRA; // @[Execute.scala 43:19]
  wire  alu_io_isa_SRAI; // @[Execute.scala 43:19]
  wire  alu_io_isa_SRAW; // @[Execute.scala 43:19]
  wire  alu_io_isa_SRAIW; // @[Execute.scala 43:19]
  wire  alu_io_isa_SLT; // @[Execute.scala 43:19]
  wire  alu_io_isa_SLTI; // @[Execute.scala 43:19]
  wire  alu_io_isa_SLTU; // @[Execute.scala 43:19]
  wire  alu_io_isa_SLTIU; // @[Execute.scala 43:19]
  wire [63:0] alu_io_src1; // @[Execute.scala 43:19]
  wire [63:0] alu_io_src2; // @[Execute.scala 43:19]
  wire [63:0] alu_io_imm_I; // @[Execute.scala 43:19]
  wire [63:0] alu_io_imm_U; // @[Execute.scala 43:19]
  wire [63:0] alu_io_result; // @[Execute.scala 43:19]
  wire  bc_io_isa_BEQ; // @[Execute.scala 50:18]
  wire  bc_io_isa_BNE; // @[Execute.scala 50:18]
  wire  bc_io_isa_BLT; // @[Execute.scala 50:18]
  wire  bc_io_isa_BGE; // @[Execute.scala 50:18]
  wire  bc_io_isa_BLTU; // @[Execute.scala 50:18]
  wire  bc_io_isa_BGEU; // @[Execute.scala 50:18]
  wire  bc_io_isa_JAL; // @[Execute.scala 50:18]
  wire  bc_io_isa_JALR; // @[Execute.scala 50:18]
  wire [63:0] bc_io_imm_I; // @[Execute.scala 50:18]
  wire [63:0] bc_io_imm_B; // @[Execute.scala 50:18]
  wire [63:0] bc_io_imm_J; // @[Execute.scala 50:18]
  wire [63:0] bc_io_src1; // @[Execute.scala 50:18]
  wire [63:0] bc_io_src2; // @[Execute.scala 50:18]
  wire [63:0] bc_io_pc; // @[Execute.scala 50:18]
  wire  bc_io_branch; // @[Execute.scala 50:18]
  wire [63:0] bc_io_target; // @[Execute.scala 50:18]
  wire  csru_clock; // @[Execute.scala 62:20]
  wire  csru_reset; // @[Execute.scala 62:20]
  wire  csru_io_ENABLE; // @[Execute.scala 62:20]
  wire [63:0] csru_io_pc; // @[Execute.scala 62:20]
  wire [63:0] csru_io_inst; // @[Execute.scala 62:20]
  wire [63:0] csru_io_src; // @[Execute.scala 62:20]
  wire [63:0] csru_io_dataout; // @[Execute.scala 62:20]
  wire  csru_io_TimeOver; // @[Execute.scala 62:20]
  wire  csru_io_TimerInterrupt; // @[Execute.scala 62:20]
  wire  csru_io_EnvironmentCall; // @[Execute.scala 62:20]
  wire [63:0] csru_io_CSRState_mepc; // @[Execute.scala 62:20]
  wire [63:0] csru_io_CSRState_mtvec; // @[Execute.scala 62:20]
  reg  exs_Valid; // @[Reg.scala 27:20]
  reg [31:0] exs_Inst; // @[Reg.scala 27:20]
  reg [63:0] exs_PC; // @[Reg.scala 27:20]
  reg  exs_isa_ADD; // @[Reg.scala 27:20]
  reg  exs_isa_ADDI; // @[Reg.scala 27:20]
  reg  exs_isa_ADDW; // @[Reg.scala 27:20]
  reg  exs_isa_ADDIW; // @[Reg.scala 27:20]
  reg  exs_isa_SUB; // @[Reg.scala 27:20]
  reg  exs_isa_SUBW; // @[Reg.scala 27:20]
  reg  exs_isa_LUI; // @[Reg.scala 27:20]
  reg  exs_isa_AUIPC; // @[Reg.scala 27:20]
  reg  exs_isa_XOR; // @[Reg.scala 27:20]
  reg  exs_isa_XORI; // @[Reg.scala 27:20]
  reg  exs_isa_OR; // @[Reg.scala 27:20]
  reg  exs_isa_ORI; // @[Reg.scala 27:20]
  reg  exs_isa_AND; // @[Reg.scala 27:20]
  reg  exs_isa_ANDI; // @[Reg.scala 27:20]
  reg  exs_isa_SLL; // @[Reg.scala 27:20]
  reg  exs_isa_SLLI; // @[Reg.scala 27:20]
  reg  exs_isa_SLLW; // @[Reg.scala 27:20]
  reg  exs_isa_SLLIW; // @[Reg.scala 27:20]
  reg  exs_isa_SRL; // @[Reg.scala 27:20]
  reg  exs_isa_SRLI; // @[Reg.scala 27:20]
  reg  exs_isa_SRLW; // @[Reg.scala 27:20]
  reg  exs_isa_SRLIW; // @[Reg.scala 27:20]
  reg  exs_isa_SRA; // @[Reg.scala 27:20]
  reg  exs_isa_SRAI; // @[Reg.scala 27:20]
  reg  exs_isa_SRAW; // @[Reg.scala 27:20]
  reg  exs_isa_SRAIW; // @[Reg.scala 27:20]
  reg  exs_isa_SLT; // @[Reg.scala 27:20]
  reg  exs_isa_SLTI; // @[Reg.scala 27:20]
  reg  exs_isa_SLTU; // @[Reg.scala 27:20]
  reg  exs_isa_SLTIU; // @[Reg.scala 27:20]
  reg  exs_isa_BEQ; // @[Reg.scala 27:20]
  reg  exs_isa_BNE; // @[Reg.scala 27:20]
  reg  exs_isa_BLT; // @[Reg.scala 27:20]
  reg  exs_isa_BGE; // @[Reg.scala 27:20]
  reg  exs_isa_BLTU; // @[Reg.scala 27:20]
  reg  exs_isa_BGEU; // @[Reg.scala 27:20]
  reg  exs_isa_JAL; // @[Reg.scala 27:20]
  reg  exs_isa_JALR; // @[Reg.scala 27:20]
  reg  exs_isa_LD; // @[Reg.scala 27:20]
  reg  exs_isa_LW; // @[Reg.scala 27:20]
  reg  exs_isa_LH; // @[Reg.scala 27:20]
  reg  exs_isa_LB; // @[Reg.scala 27:20]
  reg  exs_isa_LWU; // @[Reg.scala 27:20]
  reg  exs_isa_LHU; // @[Reg.scala 27:20]
  reg  exs_isa_LBU; // @[Reg.scala 27:20]
  reg  exs_isa_SD; // @[Reg.scala 27:20]
  reg  exs_isa_SW; // @[Reg.scala 27:20]
  reg  exs_isa_SH; // @[Reg.scala 27:20]
  reg  exs_isa_SB; // @[Reg.scala 27:20]
  reg  exs_isa_MRET; // @[Reg.scala 27:20]
  reg [63:0] exs_src1; // @[Reg.scala 27:20]
  reg [63:0] exs_src2; // @[Reg.scala 27:20]
  reg [63:0] exs_imm_I; // @[Reg.scala 27:20]
  reg [63:0] exs_imm_B; // @[Reg.scala 27:20]
  reg [63:0] exs_imm_S; // @[Reg.scala 27:20]
  reg [63:0] exs_imm_U; // @[Reg.scala 27:20]
  reg [63:0] exs_imm_J; // @[Reg.scala 27:20]
  reg  exs_wen; // @[Reg.scala 27:20]
  reg [4:0] exs_regdes; // @[Reg.scala 27:20]
  wire [4:0] rs1 = exs_Inst[19:15]; // @[Execute.scala 29:21]
  wire [4:0] rs2 = exs_Inst[24:20]; // @[Execute.scala 30:21]
  wire  _redesMem_src1_hit_T_2 = rs1 != 5'h0; // @[Execute.scala 33:83]
  wire  redesMem_src1_hit = io_redesMem_wen & rs1 == io_redesMem_regdes & rs1 != 5'h0; // @[Execute.scala 33:75]
  wire  _redesMem_src2_hit_T_2 = rs2 != 5'h0; // @[Execute.scala 34:83]
  wire  redesMem_src2_hit = io_redesMem_wen & rs2 == io_redesMem_regdes & rs2 != 5'h0; // @[Execute.scala 34:75]
  wire  redesWb_src1_hit = io_redesWb_wen & rs1 == io_redesWb_regdes & _redesMem_src1_hit_T_2; // @[Execute.scala 35:72]
  wire  redesWb_src2_hit = io_redesWb_wen & rs2 == io_redesWb_regdes & _redesMem_src2_hit_T_2; // @[Execute.scala 36:72]
  wire [63:0] _src1_T = redesWb_src1_hit ? io_redesWb_data : exs_src1; // @[Execute.scala 37:58]
  wire [63:0] _src2_T = redesWb_src2_hit ? io_redesWb_data : exs_src2; // @[Execute.scala 38:58]
  wire  link_lo = exs_isa_JAL | exs_isa_JALR; // @[Execute.scala 59:32]
  wire [62:0] link_hi = link_lo ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _link_T_1 = {link_hi,link_lo}; // @[Cat.scala 30:58]
  wire [63:0] _link_T_3 = exs_PC + 64'h4; // @[Execute.scala 59:63]
  wire [62:0] auipc_hi = exs_isa_AUIPC ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _auipc_T_1 = {auipc_hi,exs_isa_AUIPC}; // @[Cat.scala 30:58]
  wire [63:0] _auipc_T_3 = exs_PC + exs_imm_U; // @[Execute.scala 60:51]
  wire [31:0] _csru_io_inst_T = exs_Valid ? exs_Inst : 32'h13; // @[Execute.scala 65:25]
  ysyx_210292_ArithmeticLogicalUnit alu ( // @[Execute.scala 43:19]
    .io_isa_ADD(alu_io_isa_ADD),
    .io_isa_ADDI(alu_io_isa_ADDI),
    .io_isa_ADDW(alu_io_isa_ADDW),
    .io_isa_ADDIW(alu_io_isa_ADDIW),
    .io_isa_SUB(alu_io_isa_SUB),
    .io_isa_SUBW(alu_io_isa_SUBW),
    .io_isa_LUI(alu_io_isa_LUI),
    .io_isa_XOR(alu_io_isa_XOR),
    .io_isa_XORI(alu_io_isa_XORI),
    .io_isa_OR(alu_io_isa_OR),
    .io_isa_ORI(alu_io_isa_ORI),
    .io_isa_AND(alu_io_isa_AND),
    .io_isa_ANDI(alu_io_isa_ANDI),
    .io_isa_SLL(alu_io_isa_SLL),
    .io_isa_SLLI(alu_io_isa_SLLI),
    .io_isa_SLLW(alu_io_isa_SLLW),
    .io_isa_SLLIW(alu_io_isa_SLLIW),
    .io_isa_SRL(alu_io_isa_SRL),
    .io_isa_SRLI(alu_io_isa_SRLI),
    .io_isa_SRLW(alu_io_isa_SRLW),
    .io_isa_SRLIW(alu_io_isa_SRLIW),
    .io_isa_SRA(alu_io_isa_SRA),
    .io_isa_SRAI(alu_io_isa_SRAI),
    .io_isa_SRAW(alu_io_isa_SRAW),
    .io_isa_SRAIW(alu_io_isa_SRAIW),
    .io_isa_SLT(alu_io_isa_SLT),
    .io_isa_SLTI(alu_io_isa_SLTI),
    .io_isa_SLTU(alu_io_isa_SLTU),
    .io_isa_SLTIU(alu_io_isa_SLTIU),
    .io_src1(alu_io_src1),
    .io_src2(alu_io_src2),
    .io_imm_I(alu_io_imm_I),
    .io_imm_U(alu_io_imm_U),
    .io_result(alu_io_result)
  );
  ysyx_210292_BranchController bc ( // @[Execute.scala 50:18]
    .io_isa_BEQ(bc_io_isa_BEQ),
    .io_isa_BNE(bc_io_isa_BNE),
    .io_isa_BLT(bc_io_isa_BLT),
    .io_isa_BGE(bc_io_isa_BGE),
    .io_isa_BLTU(bc_io_isa_BLTU),
    .io_isa_BGEU(bc_io_isa_BGEU),
    .io_isa_JAL(bc_io_isa_JAL),
    .io_isa_JALR(bc_io_isa_JALR),
    .io_imm_I(bc_io_imm_I),
    .io_imm_B(bc_io_imm_B),
    .io_imm_J(bc_io_imm_J),
    .io_src1(bc_io_src1),
    .io_src2(bc_io_src2),
    .io_pc(bc_io_pc),
    .io_branch(bc_io_branch),
    .io_target(bc_io_target)
  );
  ysyx_210292_ControlStatusRegisterUnit csru ( // @[Execute.scala 62:20]
    .clock(csru_clock),
    .reset(csru_reset),
    .io_ENABLE(csru_io_ENABLE),
    .io_pc(csru_io_pc),
    .io_inst(csru_io_inst),
    .io_src(csru_io_src),
    .io_dataout(csru_io_dataout),
    .io_TimeOver(csru_io_TimeOver),
    .io_TimerInterrupt(csru_io_TimerInterrupt),
    .io_EnvironmentCall(csru_io_EnvironmentCall),
    .io_CSRState_mepc(csru_io_CSRState_mepc),
    .io_CSRState_mtvec(csru_io_CSRState_mtvec)
  );
  assign io_exmem_Valid = csru_io_TimerInterrupt ? 1'h0 : exs_Valid; // @[Execute.scala 83:27]
  assign io_exmem_isa_LD = exs_isa_LD; // @[Execute.scala 86:21]
  assign io_exmem_isa_LW = exs_isa_LW; // @[Execute.scala 86:21]
  assign io_exmem_isa_LH = exs_isa_LH; // @[Execute.scala 86:21]
  assign io_exmem_isa_LB = exs_isa_LB; // @[Execute.scala 86:21]
  assign io_exmem_isa_LWU = exs_isa_LWU; // @[Execute.scala 86:21]
  assign io_exmem_isa_LHU = exs_isa_LHU; // @[Execute.scala 86:21]
  assign io_exmem_isa_LBU = exs_isa_LBU; // @[Execute.scala 86:21]
  assign io_exmem_isa_SD = exs_isa_SD; // @[Execute.scala 86:21]
  assign io_exmem_isa_SW = exs_isa_SW; // @[Execute.scala 86:21]
  assign io_exmem_isa_SH = exs_isa_SH; // @[Execute.scala 86:21]
  assign io_exmem_isa_SB = exs_isa_SB; // @[Execute.scala 86:21]
  assign io_exmem_src1 = redesMem_src1_hit ? io_redesMem_data : _src1_T; // @[Execute.scala 37:17]
  assign io_exmem_src2 = redesMem_src2_hit ? io_redesMem_data : _src2_T; // @[Execute.scala 38:17]
  assign io_exmem_imm_I = exs_imm_I; // @[Execute.scala 89:21]
  assign io_exmem_imm_S = exs_imm_S; // @[Execute.scala 89:21]
  assign io_exmem_wen = exs_wen; // @[Execute.scala 90:21]
  assign io_exmem_regdes = exs_regdes; // @[Execute.scala 91:21]
  assign io_exmem_aluresult = alu_io_result; // @[Execute.scala 92:21]
  assign io_exmem_link = _link_T_1 & _link_T_3; // @[Execute.scala 59:57]
  assign io_exmem_auipc = _auipc_T_1 & _auipc_T_3; // @[Execute.scala 60:45]
  assign io_exmem_csrData = csru_io_dataout; // @[Execute.scala 97:21]
  assign io_cancel = exs_Valid & (bc_io_branch | csru_io_TimerInterrupt | csru_io_EnvironmentCall | exs_isa_MRET); // @[Execute.scala 79:22]
  assign io_nextPC_trap = exs_Valid & (csru_io_TimerInterrupt | csru_io_EnvironmentCall); // @[Execute.scala 72:27]
  assign io_nextPC_mtvec = csru_io_CSRState_mtvec; // @[Execute.scala 73:19]
  assign io_nextPC_mret = exs_Valid & exs_isa_MRET; // @[Execute.scala 74:27]
  assign io_nextPC_mepc = csru_io_CSRState_mepc; // @[Execute.scala 75:18]
  assign io_nextPC_branch = exs_Valid & bc_io_branch; // @[Execute.scala 76:29]
  assign io_nextPC_target = bc_io_target; // @[Execute.scala 77:20]
  assign alu_io_isa_ADD = exs_isa_ADD; // @[Execute.scala 44:14]
  assign alu_io_isa_ADDI = exs_isa_ADDI; // @[Execute.scala 44:14]
  assign alu_io_isa_ADDW = exs_isa_ADDW; // @[Execute.scala 44:14]
  assign alu_io_isa_ADDIW = exs_isa_ADDIW; // @[Execute.scala 44:14]
  assign alu_io_isa_SUB = exs_isa_SUB; // @[Execute.scala 44:14]
  assign alu_io_isa_SUBW = exs_isa_SUBW; // @[Execute.scala 44:14]
  assign alu_io_isa_LUI = exs_isa_LUI; // @[Execute.scala 44:14]
  assign alu_io_isa_XOR = exs_isa_XOR; // @[Execute.scala 44:14]
  assign alu_io_isa_XORI = exs_isa_XORI; // @[Execute.scala 44:14]
  assign alu_io_isa_OR = exs_isa_OR; // @[Execute.scala 44:14]
  assign alu_io_isa_ORI = exs_isa_ORI; // @[Execute.scala 44:14]
  assign alu_io_isa_AND = exs_isa_AND; // @[Execute.scala 44:14]
  assign alu_io_isa_ANDI = exs_isa_ANDI; // @[Execute.scala 44:14]
  assign alu_io_isa_SLL = exs_isa_SLL; // @[Execute.scala 44:14]
  assign alu_io_isa_SLLI = exs_isa_SLLI; // @[Execute.scala 44:14]
  assign alu_io_isa_SLLW = exs_isa_SLLW; // @[Execute.scala 44:14]
  assign alu_io_isa_SLLIW = exs_isa_SLLIW; // @[Execute.scala 44:14]
  assign alu_io_isa_SRL = exs_isa_SRL; // @[Execute.scala 44:14]
  assign alu_io_isa_SRLI = exs_isa_SRLI; // @[Execute.scala 44:14]
  assign alu_io_isa_SRLW = exs_isa_SRLW; // @[Execute.scala 44:14]
  assign alu_io_isa_SRLIW = exs_isa_SRLIW; // @[Execute.scala 44:14]
  assign alu_io_isa_SRA = exs_isa_SRA; // @[Execute.scala 44:14]
  assign alu_io_isa_SRAI = exs_isa_SRAI; // @[Execute.scala 44:14]
  assign alu_io_isa_SRAW = exs_isa_SRAW; // @[Execute.scala 44:14]
  assign alu_io_isa_SRAIW = exs_isa_SRAIW; // @[Execute.scala 44:14]
  assign alu_io_isa_SLT = exs_isa_SLT; // @[Execute.scala 44:14]
  assign alu_io_isa_SLTI = exs_isa_SLTI; // @[Execute.scala 44:14]
  assign alu_io_isa_SLTU = exs_isa_SLTU; // @[Execute.scala 44:14]
  assign alu_io_isa_SLTIU = exs_isa_SLTIU; // @[Execute.scala 44:14]
  assign alu_io_src1 = redesMem_src1_hit ? io_redesMem_data : _src1_T; // @[Execute.scala 37:17]
  assign alu_io_src2 = redesMem_src2_hit ? io_redesMem_data : _src2_T; // @[Execute.scala 38:17]
  assign alu_io_imm_I = exs_imm_I; // @[Execute.scala 45:14]
  assign alu_io_imm_U = exs_imm_U; // @[Execute.scala 45:14]
  assign bc_io_isa_BEQ = exs_isa_BEQ; // @[Execute.scala 51:13]
  assign bc_io_isa_BNE = exs_isa_BNE; // @[Execute.scala 51:13]
  assign bc_io_isa_BLT = exs_isa_BLT; // @[Execute.scala 51:13]
  assign bc_io_isa_BGE = exs_isa_BGE; // @[Execute.scala 51:13]
  assign bc_io_isa_BLTU = exs_isa_BLTU; // @[Execute.scala 51:13]
  assign bc_io_isa_BGEU = exs_isa_BGEU; // @[Execute.scala 51:13]
  assign bc_io_isa_JAL = exs_isa_JAL; // @[Execute.scala 51:13]
  assign bc_io_isa_JALR = exs_isa_JALR; // @[Execute.scala 51:13]
  assign bc_io_imm_I = exs_imm_I; // @[Execute.scala 52:13]
  assign bc_io_imm_B = exs_imm_B; // @[Execute.scala 52:13]
  assign bc_io_imm_J = exs_imm_J; // @[Execute.scala 52:13]
  assign bc_io_src1 = redesMem_src1_hit ? io_redesMem_data : _src1_T; // @[Execute.scala 37:17]
  assign bc_io_src2 = redesMem_src2_hit ? io_redesMem_data : _src2_T; // @[Execute.scala 38:17]
  assign bc_io_pc = exs_PC; // @[Execute.scala 55:12]
  assign csru_clock = clock;
  assign csru_reset = reset;
  assign csru_io_ENABLE = io_ENABLE; // @[Execute.scala 63:19]
  assign csru_io_pc = exs_PC; // @[Execute.scala 64:19]
  assign csru_io_inst = {{32'd0}, _csru_io_inst_T}; // @[Execute.scala 65:25]
  assign csru_io_src = redesMem_src1_hit ? io_redesMem_data : _src1_T; // @[Execute.scala 37:17]
  assign csru_io_TimeOver = io_TimeOver; // @[Execute.scala 67:19]
  always @(posedge clock) begin
    if (reset) begin // @[Reg.scala 27:20]
      exs_Valid <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      exs_Valid <= io_idex_Valid; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exs_Inst <= 32'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      exs_Inst <= io_idex_Inst; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exs_PC <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      exs_PC <= io_idex_PC; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exs_isa_ADD <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      exs_isa_ADD <= io_idex_isa_ADD; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exs_isa_ADDI <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      exs_isa_ADDI <= io_idex_isa_ADDI; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exs_isa_ADDW <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      exs_isa_ADDW <= io_idex_isa_ADDW; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exs_isa_ADDIW <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      exs_isa_ADDIW <= io_idex_isa_ADDIW; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exs_isa_SUB <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      exs_isa_SUB <= io_idex_isa_SUB; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exs_isa_SUBW <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      exs_isa_SUBW <= io_idex_isa_SUBW; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exs_isa_LUI <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      exs_isa_LUI <= io_idex_isa_LUI; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exs_isa_AUIPC <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      exs_isa_AUIPC <= io_idex_isa_AUIPC; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exs_isa_XOR <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      exs_isa_XOR <= io_idex_isa_XOR; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exs_isa_XORI <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      exs_isa_XORI <= io_idex_isa_XORI; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exs_isa_OR <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      exs_isa_OR <= io_idex_isa_OR; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exs_isa_ORI <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      exs_isa_ORI <= io_idex_isa_ORI; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exs_isa_AND <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      exs_isa_AND <= io_idex_isa_AND; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exs_isa_ANDI <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      exs_isa_ANDI <= io_idex_isa_ANDI; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exs_isa_SLL <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      exs_isa_SLL <= io_idex_isa_SLL; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exs_isa_SLLI <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      exs_isa_SLLI <= io_idex_isa_SLLI; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exs_isa_SLLW <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      exs_isa_SLLW <= io_idex_isa_SLLW; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exs_isa_SLLIW <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      exs_isa_SLLIW <= io_idex_isa_SLLIW; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exs_isa_SRL <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      exs_isa_SRL <= io_idex_isa_SRL; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exs_isa_SRLI <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      exs_isa_SRLI <= io_idex_isa_SRLI; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exs_isa_SRLW <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      exs_isa_SRLW <= io_idex_isa_SRLW; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exs_isa_SRLIW <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      exs_isa_SRLIW <= io_idex_isa_SRLIW; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exs_isa_SRA <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      exs_isa_SRA <= io_idex_isa_SRA; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exs_isa_SRAI <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      exs_isa_SRAI <= io_idex_isa_SRAI; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exs_isa_SRAW <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      exs_isa_SRAW <= io_idex_isa_SRAW; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exs_isa_SRAIW <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      exs_isa_SRAIW <= io_idex_isa_SRAIW; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exs_isa_SLT <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      exs_isa_SLT <= io_idex_isa_SLT; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exs_isa_SLTI <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      exs_isa_SLTI <= io_idex_isa_SLTI; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exs_isa_SLTU <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      exs_isa_SLTU <= io_idex_isa_SLTU; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exs_isa_SLTIU <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      exs_isa_SLTIU <= io_idex_isa_SLTIU; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exs_isa_BEQ <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      exs_isa_BEQ <= io_idex_isa_BEQ; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exs_isa_BNE <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      exs_isa_BNE <= io_idex_isa_BNE; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exs_isa_BLT <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      exs_isa_BLT <= io_idex_isa_BLT; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exs_isa_BGE <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      exs_isa_BGE <= io_idex_isa_BGE; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exs_isa_BLTU <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      exs_isa_BLTU <= io_idex_isa_BLTU; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exs_isa_BGEU <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      exs_isa_BGEU <= io_idex_isa_BGEU; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exs_isa_JAL <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      exs_isa_JAL <= io_idex_isa_JAL; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exs_isa_JALR <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      exs_isa_JALR <= io_idex_isa_JALR; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exs_isa_LD <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      exs_isa_LD <= io_idex_isa_LD; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exs_isa_LW <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      exs_isa_LW <= io_idex_isa_LW; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exs_isa_LH <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      exs_isa_LH <= io_idex_isa_LH; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exs_isa_LB <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      exs_isa_LB <= io_idex_isa_LB; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exs_isa_LWU <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      exs_isa_LWU <= io_idex_isa_LWU; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exs_isa_LHU <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      exs_isa_LHU <= io_idex_isa_LHU; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exs_isa_LBU <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      exs_isa_LBU <= io_idex_isa_LBU; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exs_isa_SD <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      exs_isa_SD <= io_idex_isa_SD; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exs_isa_SW <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      exs_isa_SW <= io_idex_isa_SW; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exs_isa_SH <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      exs_isa_SH <= io_idex_isa_SH; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exs_isa_SB <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      exs_isa_SB <= io_idex_isa_SB; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exs_isa_MRET <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      exs_isa_MRET <= io_idex_isa_MRET; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exs_src1 <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      exs_src1 <= io_idex_src1; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exs_src2 <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      exs_src2 <= io_idex_src2; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exs_imm_I <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      exs_imm_I <= io_idex_imm_I; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exs_imm_B <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      exs_imm_B <= io_idex_imm_B; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exs_imm_S <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      exs_imm_S <= io_idex_imm_S; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exs_imm_U <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      exs_imm_U <= io_idex_imm_U; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exs_imm_J <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      exs_imm_J <= io_idex_imm_J; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exs_wen <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      exs_wen <= io_idex_wen; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exs_regdes <= 5'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      exs_regdes <= io_idex_regdes; // @[Reg.scala 28:23]
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
  exs_Valid = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  exs_Inst = _RAND_1[31:0];
  _RAND_2 = {2{`RANDOM}};
  exs_PC = _RAND_2[63:0];
  _RAND_3 = {1{`RANDOM}};
  exs_isa_ADD = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  exs_isa_ADDI = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  exs_isa_ADDW = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  exs_isa_ADDIW = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  exs_isa_SUB = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  exs_isa_SUBW = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  exs_isa_LUI = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  exs_isa_AUIPC = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  exs_isa_XOR = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  exs_isa_XORI = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  exs_isa_OR = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  exs_isa_ORI = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  exs_isa_AND = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  exs_isa_ANDI = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  exs_isa_SLL = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  exs_isa_SLLI = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  exs_isa_SLLW = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  exs_isa_SLLIW = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  exs_isa_SRL = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  exs_isa_SRLI = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  exs_isa_SRLW = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  exs_isa_SRLIW = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  exs_isa_SRA = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  exs_isa_SRAI = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  exs_isa_SRAW = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  exs_isa_SRAIW = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  exs_isa_SLT = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  exs_isa_SLTI = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  exs_isa_SLTU = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  exs_isa_SLTIU = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  exs_isa_BEQ = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  exs_isa_BNE = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  exs_isa_BLT = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  exs_isa_BGE = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  exs_isa_BLTU = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  exs_isa_BGEU = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  exs_isa_JAL = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  exs_isa_JALR = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  exs_isa_LD = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  exs_isa_LW = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  exs_isa_LH = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  exs_isa_LB = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  exs_isa_LWU = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  exs_isa_LHU = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  exs_isa_LBU = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  exs_isa_SD = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  exs_isa_SW = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  exs_isa_SH = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  exs_isa_SB = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  exs_isa_MRET = _RAND_52[0:0];
  _RAND_53 = {2{`RANDOM}};
  exs_src1 = _RAND_53[63:0];
  _RAND_54 = {2{`RANDOM}};
  exs_src2 = _RAND_54[63:0];
  _RAND_55 = {2{`RANDOM}};
  exs_imm_I = _RAND_55[63:0];
  _RAND_56 = {2{`RANDOM}};
  exs_imm_B = _RAND_56[63:0];
  _RAND_57 = {2{`RANDOM}};
  exs_imm_S = _RAND_57[63:0];
  _RAND_58 = {2{`RANDOM}};
  exs_imm_U = _RAND_58[63:0];
  _RAND_59 = {2{`RANDOM}};
  exs_imm_J = _RAND_59[63:0];
  _RAND_60 = {1{`RANDOM}};
  exs_wen = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  exs_regdes = _RAND_61[4:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210292_LoadStoreUnit(
  input         io_isa_LD,
  input         io_isa_LW,
  input         io_isa_LH,
  input         io_isa_LB,
  input         io_isa_LWU,
  input         io_isa_LHU,
  input         io_isa_LBU,
  input         io_isa_SD,
  input         io_isa_SW,
  input         io_isa_SH,
  input         io_isa_SB,
  input  [63:0] io_src1,
  input  [63:0] io_src2,
  input  [63:0] io_imm_I,
  input  [63:0] io_imm_S,
  input         io_Valid,
  output        io_DataLoad_en,
  output [63:0] io_DataLoad_addr,
  input  [63:0] io_DataLoad_data,
  output [2:0]  io_DataLoad_size,
  output        io_DataStore_en,
  output [63:0] io_DataStore_addr,
  output [63:0] io_DataStore_data,
  output [7:0]  io_DataStore_mask,
  output [63:0] io_load_data
);
  wire  loads = io_isa_LD | io_isa_LW | io_isa_LH | io_isa_LB | io_isa_LWU | io_isa_LHU | io_isa_LBU; // @[LoadStoreUnit.scala 22:96]
  wire  stores = io_isa_SD | io_isa_SW | io_isa_SH | io_isa_SB; // @[LoadStoreUnit.scala 23:52]
  wire  h_size = io_isa_LH | io_isa_LHU; // @[LoadStoreUnit.scala 28:30]
  wire [1:0] w_size = io_isa_LW | io_isa_LWU ? 2'h2 : 2'h0; // @[LoadStoreUnit.scala 29:19]
  wire [1:0] d_size = io_isa_LD ? 2'h3 : 2'h0; // @[LoadStoreUnit.scala 30:19]
  wire [2:0] _load_size_T = {{2'd0}, h_size}; // @[LoadStoreUnit.scala 31:26]
  wire [2:0] _GEN_0 = {{1'd0}, w_size}; // @[LoadStoreUnit.scala 31:35]
  wire [2:0] _load_size_T_1 = _load_size_T | _GEN_0; // @[LoadStoreUnit.scala 31:35]
  wire [2:0] _GEN_1 = {{1'd0}, d_size}; // @[LoadStoreUnit.scala 31:44]
  wire [31:0] w_data = io_DataLoad_addr[2] ? io_DataLoad_data[63:32] : io_DataLoad_data[31:0]; // @[LoadStoreUnit.scala 34:19]
  wire [15:0] h_data = io_DataLoad_addr[1] ? w_data[31:16] : w_data[15:0]; // @[LoadStoreUnit.scala 35:19]
  wire [7:0] b_data = io_DataLoad_addr[0] ? h_data[15:8] : h_data[7:0]; // @[LoadStoreUnit.scala 36:19]
  wire [62:0] LD_data_hi = io_isa_LD ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _LD_data_T_1 = {LD_data_hi,io_isa_LD}; // @[Cat.scala 30:58]
  wire [63:0] LD_data = _LD_data_T_1 & io_DataLoad_data; // @[LoadStoreUnit.scala 41:49]
  wire [62:0] LW_data_hi = io_isa_LW ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _LW_data_T_1 = {LW_data_hi,io_isa_LW}; // @[Cat.scala 30:58]
  wire  LW_data_signBit_1 = w_data[31]; // @[Bundle.scala 220:20]
  wire [31:0] LW_data_hi_1 = LW_data_signBit_1 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _LW_data_T_3 = {LW_data_hi_1,w_data}; // @[Cat.scala 30:58]
  wire [63:0] LW_data = _LW_data_T_1 & _LW_data_T_3; // @[LoadStoreUnit.scala 42:49]
  wire [62:0] LH_data_hi = io_isa_LH ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _LH_data_T_1 = {LH_data_hi,io_isa_LH}; // @[Cat.scala 30:58]
  wire  LH_data_signBit_1 = h_data[15]; // @[Bundle.scala 220:20]
  wire [47:0] LH_data_hi_1 = LH_data_signBit_1 ? 48'hffffffffffff : 48'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _LH_data_T_3 = {LH_data_hi_1,h_data}; // @[Cat.scala 30:58]
  wire [63:0] LH_data = _LH_data_T_1 & _LH_data_T_3; // @[LoadStoreUnit.scala 43:49]
  wire [62:0] LB_data_hi = io_isa_LB ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _LB_data_T_1 = {LB_data_hi,io_isa_LB}; // @[Cat.scala 30:58]
  wire  LB_data_signBit_1 = b_data[7]; // @[Bundle.scala 220:20]
  wire [55:0] LB_data_hi_1 = LB_data_signBit_1 ? 56'hffffffffffffff : 56'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _LB_data_T_3 = {LB_data_hi_1,b_data}; // @[Cat.scala 30:58]
  wire [63:0] LB_data = _LB_data_T_1 & _LB_data_T_3; // @[LoadStoreUnit.scala 44:49]
  wire [62:0] LWU_data_hi = io_isa_LWU ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _LWU_data_T_1 = {LWU_data_hi,io_isa_LWU}; // @[Cat.scala 30:58]
  wire [63:0] _LWU_data_T_2 = {32'h0,w_data}; // @[Cat.scala 30:58]
  wire [63:0] LWU_data = _LWU_data_T_1 & _LWU_data_T_2; // @[LoadStoreUnit.scala 45:49]
  wire [62:0] LHU_data_hi = io_isa_LHU ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _LHU_data_T_1 = {LHU_data_hi,io_isa_LHU}; // @[Cat.scala 30:58]
  wire [63:0] _LHU_data_T_2 = {48'h0,h_data}; // @[Cat.scala 30:58]
  wire [63:0] LHU_data = _LHU_data_T_1 & _LHU_data_T_2; // @[LoadStoreUnit.scala 46:49]
  wire [62:0] LBU_data_hi = io_isa_LBU ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _LBU_data_T_1 = {LBU_data_hi,io_isa_LBU}; // @[Cat.scala 30:58]
  wire [63:0] _LBU_data_T_2 = {56'h0,b_data}; // @[Cat.scala 30:58]
  wire [63:0] LBU_data = _LBU_data_T_1 & _LBU_data_T_2; // @[LoadStoreUnit.scala 47:49]
  wire [63:0] _io_load_data_T = LD_data | LW_data; // @[LoadStoreUnit.scala 48:27]
  wire [63:0] _io_load_data_T_1 = _io_load_data_T | LH_data; // @[LoadStoreUnit.scala 48:37]
  wire [63:0] _io_load_data_T_2 = _io_load_data_T_1 | LB_data; // @[LoadStoreUnit.scala 48:47]
  wire [63:0] _io_load_data_T_3 = _io_load_data_T_2 | LWU_data; // @[LoadStoreUnit.scala 48:57]
  wire [63:0] _io_load_data_T_4 = _io_load_data_T_3 | LHU_data; // @[LoadStoreUnit.scala 48:68]
  wire [62:0] SD_data_hi = io_isa_SD ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _SD_data_T_1 = {SD_data_hi,io_isa_SD}; // @[Cat.scala 30:58]
  wire [63:0] SD_data = _SD_data_T_1 & io_src2; // @[LoadStoreUnit.scala 52:47]
  wire [62:0] SW_data_hi = io_isa_SW ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _SW_data_T_1 = {SW_data_hi,io_isa_SW}; // @[Cat.scala 30:58]
  wire [31:0] SW_data_hi_1 = io_src2[31:0]; // @[LoadStoreUnit.scala 53:60]
  wire [63:0] _SW_data_T_2 = {SW_data_hi_1,SW_data_hi_1}; // @[Cat.scala 30:58]
  wire [63:0] SW_data = _SW_data_T_1 & _SW_data_T_2; // @[LoadStoreUnit.scala 53:47]
  wire [62:0] SH_data_hi = io_isa_SH ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _SH_data_T_1 = {SH_data_hi,io_isa_SH}; // @[Cat.scala 30:58]
  wire [15:0] SH_data_hi_hi = io_src2[15:0]; // @[LoadStoreUnit.scala 54:60]
  wire [63:0] _SH_data_T_2 = {SH_data_hi_hi,SH_data_hi_hi,SH_data_hi_hi,SH_data_hi_hi}; // @[Cat.scala 30:58]
  wire [63:0] SH_data = _SH_data_T_1 & _SH_data_T_2; // @[LoadStoreUnit.scala 54:47]
  wire [62:0] SB_data_hi = io_isa_SB ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _SB_data_T_1 = {SB_data_hi,io_isa_SB}; // @[Cat.scala 30:58]
  wire [7:0] SB_data_hi_hi_hi = io_src2[7:0]; // @[LoadStoreUnit.scala 55:60]
  wire [63:0] _SB_data_T_2 = {SB_data_hi_hi_hi,SB_data_hi_hi_hi,SB_data_hi_hi_hi,SB_data_hi_hi_hi,SB_data_hi_hi_hi,
    SB_data_hi_hi_hi,SB_data_hi_hi_hi,SB_data_hi_hi_hi}; // @[Cat.scala 30:58]
  wire [63:0] SB_data = _SB_data_T_1 & _SB_data_T_2; // @[LoadStoreUnit.scala 55:47]
  wire [63:0] _store_data_T = SD_data | SW_data; // @[LoadStoreUnit.scala 56:28]
  wire [63:0] _store_data_T_1 = _store_data_T | SH_data; // @[LoadStoreUnit.scala 56:38]
  wire [63:0] store_data = _store_data_T_1 | SB_data; // @[LoadStoreUnit.scala 56:48]
  wire [6:0] d_mask_hi = io_isa_SD ? 7'h7f : 7'h0; // @[Bitwise.scala 72:12]
  wire [7:0] d_mask = {d_mask_hi,io_isa_SD}; // @[Cat.scala 30:58]
  wire [6:0] w_mask_hi = io_isa_SW ? 7'h7f : 7'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _w_mask_T_1 = {w_mask_hi,io_isa_SW}; // @[Cat.scala 30:58]
  wire [14:0] _w_mask_T_3 = 15'hf << io_DataStore_addr[2:0]; // @[LoadStoreUnit.scala 58:68]
  wire [14:0] _GEN_2 = {{7'd0}, _w_mask_T_1}; // @[LoadStoreUnit.scala 58:45]
  wire [14:0] w_mask = _GEN_2 & _w_mask_T_3; // @[LoadStoreUnit.scala 58:45]
  wire [6:0] h_mask_hi = io_isa_SH ? 7'h7f : 7'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _h_mask_T_1 = {h_mask_hi,io_isa_SH}; // @[Cat.scala 30:58]
  wire [14:0] _h_mask_T_3 = 15'h3 << io_DataStore_addr[2:0]; // @[LoadStoreUnit.scala 59:68]
  wire [14:0] _GEN_3 = {{7'd0}, _h_mask_T_1}; // @[LoadStoreUnit.scala 59:45]
  wire [14:0] h_mask = _GEN_3 & _h_mask_T_3; // @[LoadStoreUnit.scala 59:45]
  wire [6:0] b_mask_hi = io_isa_SB ? 7'h7f : 7'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _b_mask_T_1 = {b_mask_hi,io_isa_SB}; // @[Cat.scala 30:58]
  wire [14:0] _b_mask_T_3 = 15'h1 << io_DataStore_addr[2:0]; // @[LoadStoreUnit.scala 60:68]
  wire [14:0] _GEN_4 = {{7'd0}, _b_mask_T_1}; // @[LoadStoreUnit.scala 60:45]
  wire [14:0] b_mask = _GEN_4 & _b_mask_T_3; // @[LoadStoreUnit.scala 60:45]
  wire [14:0] _GEN_5 = {{7'd0}, d_mask}; // @[LoadStoreUnit.scala 61:26]
  wire [14:0] _byte_mask_T = _GEN_5 | w_mask; // @[LoadStoreUnit.scala 61:26]
  wire [14:0] _byte_mask_T_1 = _byte_mask_T | h_mask; // @[LoadStoreUnit.scala 61:35]
  wire [14:0] byte_mask = _byte_mask_T_1 | b_mask; // @[LoadStoreUnit.scala 61:44]
  wire [7:0] byte_mask_0 = byte_mask[0] ? 8'hff : 8'h0; // @[LoadStoreUnit.scala 64:24]
  wire [7:0] byte_mask_1 = byte_mask[1] ? 8'hff : 8'h0; // @[LoadStoreUnit.scala 65:24]
  wire [7:0] byte_mask_2 = byte_mask[2] ? 8'hff : 8'h0; // @[LoadStoreUnit.scala 66:24]
  wire [7:0] byte_mask_3 = byte_mask[3] ? 8'hff : 8'h0; // @[LoadStoreUnit.scala 67:24]
  wire [7:0] byte_mask_4 = byte_mask[4] ? 8'hff : 8'h0; // @[LoadStoreUnit.scala 68:24]
  wire [7:0] byte_mask_5 = byte_mask[5] ? 8'hff : 8'h0; // @[LoadStoreUnit.scala 69:24]
  wire [7:0] byte_mask_6 = byte_mask[6] ? 8'hff : 8'h0; // @[LoadStoreUnit.scala 70:24]
  wire [7:0] byte_mask_7 = byte_mask[7] ? 8'hff : 8'h0; // @[LoadStoreUnit.scala 71:24]
  wire [63:0] store_mask = {byte_mask_7,byte_mask_6,byte_mask_5,byte_mask_4,byte_mask_3,byte_mask_2,byte_mask_1,
    byte_mask_0}; // @[Cat.scala 30:58]
  assign io_DataLoad_en = io_Valid & loads; // @[LoadStoreUnit.scala 25:30]
  assign io_DataLoad_addr = io_src1 + io_imm_I; // @[LoadStoreUnit.scala 26:31]
  assign io_DataLoad_size = _load_size_T_1 | _GEN_1; // @[LoadStoreUnit.scala 31:44]
  assign io_DataStore_en = io_Valid & stores; // @[LoadStoreUnit.scala 50:31]
  assign io_DataStore_addr = io_src1 + io_imm_S; // @[LoadStoreUnit.scala 51:32]
  assign io_DataStore_data = store_data & store_mask; // @[LoadStoreUnit.scala 74:35]
  assign io_DataStore_mask = byte_mask[7:0]; // @[LoadStoreUnit.scala 75:21]
  assign io_load_data = _io_load_data_T_4 | LBU_data; // @[LoadStoreUnit.scala 48:79]
endmodule
module ysyx_210292_CoreLocalInterruptor(
  input         clock,
  input         reset,
  input         io_Valid,
  input         io_ClintLoad_en,
  input  [63:0] io_ClintLoad_addr,
  output [63:0] io_ClintLoad_data,
  input  [2:0]  io_ClintLoad_size,
  input         io_ClintStore_en,
  input  [63:0] io_ClintStore_addr,
  input  [63:0] io_ClintStore_data,
  input  [7:0]  io_ClintStore_mask,
  output        io_DataLoad_en,
  output [63:0] io_DataLoad_addr,
  input  [63:0] io_DataLoad_data,
  output [2:0]  io_DataLoad_size,
  output        io_DataStore_en,
  output [63:0] io_DataStore_addr,
  output [63:0] io_DataStore_data,
  output [7:0]  io_DataStore_mask,
  output        io_TimeOver
);
`ifdef RANDOMIZE_REG_INIT
  reg [127:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire [31:0] _Addr_T_1 = io_ClintLoad_en ? io_ClintLoad_addr[31:0] : 32'h0; // @[CoreLocalInterruptor.scala 24:18]
  wire [31:0] _Addr_T_3 = io_ClintStore_en ? io_ClintStore_addr[31:0] : 32'h0; // @[CoreLocalInterruptor.scala 24:71]
  wire [31:0] Addr = _Addr_T_1 | _Addr_T_3; // @[CoreLocalInterruptor.scala 24:66]
  wire  hit_mtime = Addr == 32'h200bff8; // @[CoreLocalInterruptor.scala 26:32]
  wire  hit_mtimecmp = Addr == 32'h2004000; // @[CoreLocalInterruptor.scala 27:32]
  wire  _ren_T = hit_mtimecmp | hit_mtime; // @[CoreLocalInterruptor.scala 30:47]
  wire  ren = io_ClintLoad_en & (hit_mtimecmp | hit_mtime) & io_Valid; // @[CoreLocalInterruptor.scala 30:61]
  wire  wen = io_ClintStore_en & _ren_T & io_Valid; // @[CoreLocalInterruptor.scala 31:61]
  wire  ClintValid = ren | wen; // @[CoreLocalInterruptor.scala 32:24]
  reg [127:0] tickCnt; // @[CoreLocalInterruptor.scala 35:24]
  wire  tick = tickCnt == 128'h5; // @[CoreLocalInterruptor.scala 36:22]
  wire [127:0] _tickCnt_T_1 = tickCnt + 128'h1; // @[CoreLocalInterruptor.scala 40:28]
  reg [63:0] mtime; // @[CoreLocalInterruptor.scala 43:25]
  reg [63:0] mtimecmp; // @[CoreLocalInterruptor.scala 44:25]
  wire [63:0] _GEN_3 = {{63'd0}, tick}; // @[CoreLocalInterruptor.scala 49:24]
  wire [63:0] _mtime_T_1 = mtime + _GEN_3; // @[CoreLocalInterruptor.scala 49:24]
  wire [63:0] temp_mtime = ren & hit_mtime ? mtime : 64'h0; // @[CoreLocalInterruptor.scala 54:30]
  wire [63:0] temp_mtimecmp = ren & hit_mtimecmp ? mtimecmp : 64'h0; // @[CoreLocalInterruptor.scala 55:26]
  wire [63:0] rdata = temp_mtime | temp_mtimecmp; // @[CoreLocalInterruptor.scala 56:26]
  assign io_ClintLoad_data = ClintValid ? rdata : io_DataLoad_data; // @[CoreLocalInterruptor.scala 62:27]
  assign io_DataLoad_en = ClintValid ? 1'h0 : io_ClintLoad_en; // @[CoreLocalInterruptor.scala 59:31]
  assign io_DataLoad_addr = io_ClintLoad_addr; // @[CoreLocalInterruptor.scala 60:25]
  assign io_DataLoad_size = io_ClintLoad_size; // @[CoreLocalInterruptor.scala 61:21]
  assign io_DataStore_en = ClintValid ? 1'h0 : io_ClintStore_en; // @[CoreLocalInterruptor.scala 65:31]
  assign io_DataStore_addr = io_ClintStore_addr; // @[CoreLocalInterruptor.scala 66:21]
  assign io_DataStore_data = io_ClintStore_data; // @[CoreLocalInterruptor.scala 67:21]
  assign io_DataStore_mask = io_ClintStore_mask; // @[CoreLocalInterruptor.scala 68:21]
  assign io_TimeOver = mtime >= mtimecmp; // @[CoreLocalInterruptor.scala 70:24]
  always @(posedge clock) begin
    if (reset) begin // @[CoreLocalInterruptor.scala 35:24]
      tickCnt <= 128'h1; // @[CoreLocalInterruptor.scala 35:24]
    end else if (tick) begin // @[CoreLocalInterruptor.scala 37:13]
      tickCnt <= 128'h1; // @[CoreLocalInterruptor.scala 38:17]
    end else begin
      tickCnt <= _tickCnt_T_1; // @[CoreLocalInterruptor.scala 40:17]
    end
    if (reset) begin // @[CoreLocalInterruptor.scala 43:25]
      mtime <= 64'h0; // @[CoreLocalInterruptor.scala 43:25]
    end else if (wen & hit_mtime) begin // @[CoreLocalInterruptor.scala 46:26]
      mtime <= io_ClintStore_data; // @[CoreLocalInterruptor.scala 47:15]
    end else begin
      mtime <= _mtime_T_1; // @[CoreLocalInterruptor.scala 49:15]
    end
    if (reset) begin // @[CoreLocalInterruptor.scala 44:25]
      mtimecmp <= 64'h0; // @[CoreLocalInterruptor.scala 44:25]
    end else if (wen & hit_mtimecmp) begin // @[CoreLocalInterruptor.scala 52:29]
      mtimecmp <= io_ClintStore_data; // @[CoreLocalInterruptor.scala 52:40]
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
  tickCnt = _RAND_0[127:0];
  _RAND_1 = {2{`RANDOM}};
  mtime = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  mtimecmp = _RAND_2[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210292_Memory(
  input         clock,
  input         reset,
  input         io_ENABLE,
  input         io_exmem_Valid,
  input         io_exmem_isa_LD,
  input         io_exmem_isa_LW,
  input         io_exmem_isa_LH,
  input         io_exmem_isa_LB,
  input         io_exmem_isa_LWU,
  input         io_exmem_isa_LHU,
  input         io_exmem_isa_LBU,
  input         io_exmem_isa_SD,
  input         io_exmem_isa_SW,
  input         io_exmem_isa_SH,
  input         io_exmem_isa_SB,
  input  [63:0] io_exmem_src1,
  input  [63:0] io_exmem_src2,
  input  [63:0] io_exmem_imm_I,
  input  [63:0] io_exmem_imm_S,
  input         io_exmem_wen,
  input  [4:0]  io_exmem_regdes,
  input  [63:0] io_exmem_aluresult,
  input  [63:0] io_exmem_link,
  input  [63:0] io_exmem_auipc,
  input  [63:0] io_exmem_csrData,
  output        io_memwb_Valid,
  output        io_memwb_wen,
  output [4:0]  io_memwb_regdes,
  output [63:0] io_memwb_aluresult,
  output [63:0] io_memwb_link,
  output [63:0] io_memwb_auipc,
  output [63:0] io_memwb_csrData,
  output [63:0] io_memwb_loadData,
  output        io_DataLoad_en,
  output [63:0] io_DataLoad_addr,
  input  [63:0] io_DataLoad_data,
  output [2:0]  io_DataLoad_size,
  output        io_DataStore_en,
  output [63:0] io_DataStore_addr,
  output [63:0] io_DataStore_data,
  output [7:0]  io_DataStore_mask,
  output        io_redesMem_wen,
  output [4:0]  io_redesMem_regdes,
  output [63:0] io_redesMem_data,
  output        io_TimeOver
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
  reg [63:0] _RAND_12;
  reg [63:0] _RAND_13;
  reg [63:0] _RAND_14;
  reg [63:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [63:0] _RAND_18;
  reg [63:0] _RAND_19;
  reg [63:0] _RAND_20;
  reg [63:0] _RAND_21;
`endif // RANDOMIZE_REG_INIT
  wire  lsu_io_isa_LD; // @[Memory.scala 34:19]
  wire  lsu_io_isa_LW; // @[Memory.scala 34:19]
  wire  lsu_io_isa_LH; // @[Memory.scala 34:19]
  wire  lsu_io_isa_LB; // @[Memory.scala 34:19]
  wire  lsu_io_isa_LWU; // @[Memory.scala 34:19]
  wire  lsu_io_isa_LHU; // @[Memory.scala 34:19]
  wire  lsu_io_isa_LBU; // @[Memory.scala 34:19]
  wire  lsu_io_isa_SD; // @[Memory.scala 34:19]
  wire  lsu_io_isa_SW; // @[Memory.scala 34:19]
  wire  lsu_io_isa_SH; // @[Memory.scala 34:19]
  wire  lsu_io_isa_SB; // @[Memory.scala 34:19]
  wire [63:0] lsu_io_src1; // @[Memory.scala 34:19]
  wire [63:0] lsu_io_src2; // @[Memory.scala 34:19]
  wire [63:0] lsu_io_imm_I; // @[Memory.scala 34:19]
  wire [63:0] lsu_io_imm_S; // @[Memory.scala 34:19]
  wire  lsu_io_Valid; // @[Memory.scala 34:19]
  wire  lsu_io_DataLoad_en; // @[Memory.scala 34:19]
  wire [63:0] lsu_io_DataLoad_addr; // @[Memory.scala 34:19]
  wire [63:0] lsu_io_DataLoad_data; // @[Memory.scala 34:19]
  wire [2:0] lsu_io_DataLoad_size; // @[Memory.scala 34:19]
  wire  lsu_io_DataStore_en; // @[Memory.scala 34:19]
  wire [63:0] lsu_io_DataStore_addr; // @[Memory.scala 34:19]
  wire [63:0] lsu_io_DataStore_data; // @[Memory.scala 34:19]
  wire [7:0] lsu_io_DataStore_mask; // @[Memory.scala 34:19]
  wire [63:0] lsu_io_load_data; // @[Memory.scala 34:19]
  wire  clint_clock; // @[Memory.scala 42:21]
  wire  clint_reset; // @[Memory.scala 42:21]
  wire  clint_io_Valid; // @[Memory.scala 42:21]
  wire  clint_io_ClintLoad_en; // @[Memory.scala 42:21]
  wire [63:0] clint_io_ClintLoad_addr; // @[Memory.scala 42:21]
  wire [63:0] clint_io_ClintLoad_data; // @[Memory.scala 42:21]
  wire [2:0] clint_io_ClintLoad_size; // @[Memory.scala 42:21]
  wire  clint_io_ClintStore_en; // @[Memory.scala 42:21]
  wire [63:0] clint_io_ClintStore_addr; // @[Memory.scala 42:21]
  wire [63:0] clint_io_ClintStore_data; // @[Memory.scala 42:21]
  wire [7:0] clint_io_ClintStore_mask; // @[Memory.scala 42:21]
  wire  clint_io_DataLoad_en; // @[Memory.scala 42:21]
  wire [63:0] clint_io_DataLoad_addr; // @[Memory.scala 42:21]
  wire [63:0] clint_io_DataLoad_data; // @[Memory.scala 42:21]
  wire [2:0] clint_io_DataLoad_size; // @[Memory.scala 42:21]
  wire  clint_io_DataStore_en; // @[Memory.scala 42:21]
  wire [63:0] clint_io_DataStore_addr; // @[Memory.scala 42:21]
  wire [63:0] clint_io_DataStore_data; // @[Memory.scala 42:21]
  wire [7:0] clint_io_DataStore_mask; // @[Memory.scala 42:21]
  wire  clint_io_TimeOver; // @[Memory.scala 42:21]
  reg  mems_Valid; // @[Reg.scala 27:20]
  reg  mems_isa_LD; // @[Reg.scala 27:20]
  reg  mems_isa_LW; // @[Reg.scala 27:20]
  reg  mems_isa_LH; // @[Reg.scala 27:20]
  reg  mems_isa_LB; // @[Reg.scala 27:20]
  reg  mems_isa_LWU; // @[Reg.scala 27:20]
  reg  mems_isa_LHU; // @[Reg.scala 27:20]
  reg  mems_isa_LBU; // @[Reg.scala 27:20]
  reg  mems_isa_SD; // @[Reg.scala 27:20]
  reg  mems_isa_SW; // @[Reg.scala 27:20]
  reg  mems_isa_SH; // @[Reg.scala 27:20]
  reg  mems_isa_SB; // @[Reg.scala 27:20]
  reg [63:0] mems_src1; // @[Reg.scala 27:20]
  reg [63:0] mems_src2; // @[Reg.scala 27:20]
  reg [63:0] mems_imm_I; // @[Reg.scala 27:20]
  reg [63:0] mems_imm_S; // @[Reg.scala 27:20]
  reg  mems_wen; // @[Reg.scala 27:20]
  reg [4:0] mems_regdes; // @[Reg.scala 27:20]
  reg [63:0] mems_aluresult; // @[Reg.scala 27:20]
  reg [63:0] mems_link; // @[Reg.scala 27:20]
  reg [63:0] mems_auipc; // @[Reg.scala 27:20]
  reg [63:0] mems_csrData; // @[Reg.scala 27:20]
  wire [63:0] _memWbdata_T = mems_aluresult | mems_link; // @[Memory.scala 50:34]
  wire [63:0] _memWbdata_T_1 = _memWbdata_T | mems_auipc; // @[Memory.scala 50:46]
  wire [63:0] memWbdata = _memWbdata_T_1 | mems_csrData; // @[Memory.scala 50:59]
  ysyx_210292_LoadStoreUnit lsu ( // @[Memory.scala 34:19]
    .io_isa_LD(lsu_io_isa_LD),
    .io_isa_LW(lsu_io_isa_LW),
    .io_isa_LH(lsu_io_isa_LH),
    .io_isa_LB(lsu_io_isa_LB),
    .io_isa_LWU(lsu_io_isa_LWU),
    .io_isa_LHU(lsu_io_isa_LHU),
    .io_isa_LBU(lsu_io_isa_LBU),
    .io_isa_SD(lsu_io_isa_SD),
    .io_isa_SW(lsu_io_isa_SW),
    .io_isa_SH(lsu_io_isa_SH),
    .io_isa_SB(lsu_io_isa_SB),
    .io_src1(lsu_io_src1),
    .io_src2(lsu_io_src2),
    .io_imm_I(lsu_io_imm_I),
    .io_imm_S(lsu_io_imm_S),
    .io_Valid(lsu_io_Valid),
    .io_DataLoad_en(lsu_io_DataLoad_en),
    .io_DataLoad_addr(lsu_io_DataLoad_addr),
    .io_DataLoad_data(lsu_io_DataLoad_data),
    .io_DataLoad_size(lsu_io_DataLoad_size),
    .io_DataStore_en(lsu_io_DataStore_en),
    .io_DataStore_addr(lsu_io_DataStore_addr),
    .io_DataStore_data(lsu_io_DataStore_data),
    .io_DataStore_mask(lsu_io_DataStore_mask),
    .io_load_data(lsu_io_load_data)
  );
  ysyx_210292_CoreLocalInterruptor clint ( // @[Memory.scala 42:21]
    .clock(clint_clock),
    .reset(clint_reset),
    .io_Valid(clint_io_Valid),
    .io_ClintLoad_en(clint_io_ClintLoad_en),
    .io_ClintLoad_addr(clint_io_ClintLoad_addr),
    .io_ClintLoad_data(clint_io_ClintLoad_data),
    .io_ClintLoad_size(clint_io_ClintLoad_size),
    .io_ClintStore_en(clint_io_ClintStore_en),
    .io_ClintStore_addr(clint_io_ClintStore_addr),
    .io_ClintStore_data(clint_io_ClintStore_data),
    .io_ClintStore_mask(clint_io_ClintStore_mask),
    .io_DataLoad_en(clint_io_DataLoad_en),
    .io_DataLoad_addr(clint_io_DataLoad_addr),
    .io_DataLoad_data(clint_io_DataLoad_data),
    .io_DataLoad_size(clint_io_DataLoad_size),
    .io_DataStore_en(clint_io_DataStore_en),
    .io_DataStore_addr(clint_io_DataStore_addr),
    .io_DataStore_data(clint_io_DataStore_data),
    .io_DataStore_mask(clint_io_DataStore_mask),
    .io_TimeOver(clint_io_TimeOver)
  );
  assign io_memwb_Valid = mems_Valid; // @[Memory.scala 57:21]
  assign io_memwb_wen = mems_wen; // @[Memory.scala 64:21]
  assign io_memwb_regdes = mems_regdes; // @[Memory.scala 65:23]
  assign io_memwb_aluresult = mems_aluresult; // @[Memory.scala 66:23]
  assign io_memwb_link = mems_link; // @[Memory.scala 69:23]
  assign io_memwb_auipc = mems_auipc; // @[Memory.scala 70:23]
  assign io_memwb_csrData = mems_csrData; // @[Memory.scala 71:23]
  assign io_memwb_loadData = lsu_io_load_data; // @[Memory.scala 72:23]
  assign io_DataLoad_en = clint_io_DataLoad_en; // @[Memory.scala 46:15]
  assign io_DataLoad_addr = clint_io_DataLoad_addr; // @[Memory.scala 46:15]
  assign io_DataLoad_size = clint_io_DataLoad_size; // @[Memory.scala 46:15]
  assign io_DataStore_en = clint_io_DataStore_en; // @[Memory.scala 47:16]
  assign io_DataStore_addr = clint_io_DataStore_addr; // @[Memory.scala 47:16]
  assign io_DataStore_data = clint_io_DataStore_data; // @[Memory.scala 47:16]
  assign io_DataStore_mask = clint_io_DataStore_mask; // @[Memory.scala 47:16]
  assign io_redesMem_wen = (lsu_io_DataLoad_en | mems_wen) & mems_Valid; // @[Memory.scala 51:56]
  assign io_redesMem_regdes = mems_regdes; // @[Memory.scala 52:29]
  assign io_redesMem_data = lsu_io_DataLoad_en ? lsu_io_load_data : memWbdata; // @[Memory.scala 53:29]
  assign io_TimeOver = clint_io_TimeOver; // @[Memory.scala 78:15]
  assign lsu_io_isa_LD = mems_isa_LD; // @[Memory.scala 36:14]
  assign lsu_io_isa_LW = mems_isa_LW; // @[Memory.scala 36:14]
  assign lsu_io_isa_LH = mems_isa_LH; // @[Memory.scala 36:14]
  assign lsu_io_isa_LB = mems_isa_LB; // @[Memory.scala 36:14]
  assign lsu_io_isa_LWU = mems_isa_LWU; // @[Memory.scala 36:14]
  assign lsu_io_isa_LHU = mems_isa_LHU; // @[Memory.scala 36:14]
  assign lsu_io_isa_LBU = mems_isa_LBU; // @[Memory.scala 36:14]
  assign lsu_io_isa_SD = mems_isa_SD; // @[Memory.scala 36:14]
  assign lsu_io_isa_SW = mems_isa_SW; // @[Memory.scala 36:14]
  assign lsu_io_isa_SH = mems_isa_SH; // @[Memory.scala 36:14]
  assign lsu_io_isa_SB = mems_isa_SB; // @[Memory.scala 36:14]
  assign lsu_io_src1 = mems_src1; // @[Memory.scala 37:15]
  assign lsu_io_src2 = mems_src2; // @[Memory.scala 38:15]
  assign lsu_io_imm_I = mems_imm_I; // @[Memory.scala 39:14]
  assign lsu_io_imm_S = mems_imm_S; // @[Memory.scala 39:14]
  assign lsu_io_Valid = mems_Valid; // @[Memory.scala 35:16]
  assign lsu_io_DataLoad_data = clint_io_ClintLoad_data; // @[Memory.scala 44:22]
  assign clint_clock = clock;
  assign clint_reset = reset;
  assign clint_io_Valid = mems_Valid; // @[Memory.scala 43:18]
  assign clint_io_ClintLoad_en = lsu_io_DataLoad_en; // @[Memory.scala 44:22]
  assign clint_io_ClintLoad_addr = lsu_io_DataLoad_addr; // @[Memory.scala 44:22]
  assign clint_io_ClintLoad_size = lsu_io_DataLoad_size; // @[Memory.scala 44:22]
  assign clint_io_ClintStore_en = lsu_io_DataStore_en; // @[Memory.scala 45:23]
  assign clint_io_ClintStore_addr = lsu_io_DataStore_addr; // @[Memory.scala 45:23]
  assign clint_io_ClintStore_data = lsu_io_DataStore_data; // @[Memory.scala 45:23]
  assign clint_io_ClintStore_mask = lsu_io_DataStore_mask; // @[Memory.scala 45:23]
  assign clint_io_DataLoad_data = io_DataLoad_data; // @[Memory.scala 46:15]
  always @(posedge clock) begin
    if (reset) begin // @[Reg.scala 27:20]
      mems_Valid <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      mems_Valid <= io_exmem_Valid; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      mems_isa_LD <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      mems_isa_LD <= io_exmem_isa_LD; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      mems_isa_LW <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      mems_isa_LW <= io_exmem_isa_LW; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      mems_isa_LH <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      mems_isa_LH <= io_exmem_isa_LH; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      mems_isa_LB <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      mems_isa_LB <= io_exmem_isa_LB; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      mems_isa_LWU <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      mems_isa_LWU <= io_exmem_isa_LWU; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      mems_isa_LHU <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      mems_isa_LHU <= io_exmem_isa_LHU; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      mems_isa_LBU <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      mems_isa_LBU <= io_exmem_isa_LBU; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      mems_isa_SD <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      mems_isa_SD <= io_exmem_isa_SD; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      mems_isa_SW <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      mems_isa_SW <= io_exmem_isa_SW; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      mems_isa_SH <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      mems_isa_SH <= io_exmem_isa_SH; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      mems_isa_SB <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      mems_isa_SB <= io_exmem_isa_SB; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      mems_src1 <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      mems_src1 <= io_exmem_src1; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      mems_src2 <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      mems_src2 <= io_exmem_src2; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      mems_imm_I <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      mems_imm_I <= io_exmem_imm_I; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      mems_imm_S <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      mems_imm_S <= io_exmem_imm_S; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      mems_wen <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      mems_wen <= io_exmem_wen; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      mems_regdes <= 5'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      mems_regdes <= io_exmem_regdes; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      mems_aluresult <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      mems_aluresult <= io_exmem_aluresult; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      mems_link <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      mems_link <= io_exmem_link; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      mems_auipc <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      mems_auipc <= io_exmem_auipc; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      mems_csrData <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      mems_csrData <= io_exmem_csrData; // @[Reg.scala 28:23]
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
  mems_Valid = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  mems_isa_LD = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  mems_isa_LW = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  mems_isa_LH = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  mems_isa_LB = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  mems_isa_LWU = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  mems_isa_LHU = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  mems_isa_LBU = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  mems_isa_SD = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  mems_isa_SW = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  mems_isa_SH = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  mems_isa_SB = _RAND_11[0:0];
  _RAND_12 = {2{`RANDOM}};
  mems_src1 = _RAND_12[63:0];
  _RAND_13 = {2{`RANDOM}};
  mems_src2 = _RAND_13[63:0];
  _RAND_14 = {2{`RANDOM}};
  mems_imm_I = _RAND_14[63:0];
  _RAND_15 = {2{`RANDOM}};
  mems_imm_S = _RAND_15[63:0];
  _RAND_16 = {1{`RANDOM}};
  mems_wen = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  mems_regdes = _RAND_17[4:0];
  _RAND_18 = {2{`RANDOM}};
  mems_aluresult = _RAND_18[63:0];
  _RAND_19 = {2{`RANDOM}};
  mems_link = _RAND_19[63:0];
  _RAND_20 = {2{`RANDOM}};
  mems_auipc = _RAND_20[63:0];
  _RAND_21 = {2{`RANDOM}};
  mems_csrData = _RAND_21[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210292_WriteBack(
  input         clock,
  input         reset,
  input         io_ENABLE,
  input         io_memwb_Valid,
  input         io_memwb_wen,
  input  [4:0]  io_memwb_regdes,
  input  [63:0] io_memwb_aluresult,
  input  [63:0] io_memwb_link,
  input  [63:0] io_memwb_auipc,
  input  [63:0] io_memwb_csrData,
  input  [63:0] io_memwb_loadData,
  output        io_wbdata_wen,
  output [4:0]  io_wbdata_regdes,
  output [63:0] io_wbdata_data
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
`endif // RANDOMIZE_REG_INIT
  reg  wbs_Valid; // @[Reg.scala 27:20]
  reg  wbs_wen; // @[Reg.scala 27:20]
  reg [4:0] wbs_regdes; // @[Reg.scala 27:20]
  reg [63:0] wbs_aluresult; // @[Reg.scala 27:20]
  reg [63:0] wbs_link; // @[Reg.scala 27:20]
  reg [63:0] wbs_auipc; // @[Reg.scala 27:20]
  reg [63:0] wbs_csrData; // @[Reg.scala 27:20]
  reg [63:0] wbs_loadData; // @[Reg.scala 27:20]
  wire [63:0] _wbdata_T = wbs_aluresult | wbs_link; // @[WriteBack.scala 57:26]
  wire [63:0] _wbdata_T_1 = _wbdata_T | wbs_auipc; // @[WriteBack.scala 57:33]
  wire [63:0] _wbdata_T_2 = _wbdata_T_1 | wbs_loadData; // @[WriteBack.scala 57:41]
  assign io_wbdata_wen = wbs_Valid & wbs_wen; // @[WriteBack.scala 59:26]
  assign io_wbdata_regdes = wbs_regdes; // @[WriteBack.scala 60:20]
  assign io_wbdata_data = _wbdata_T_2 | wbs_csrData; // @[WriteBack.scala 57:52]
  always @(posedge clock) begin
    if (reset) begin // @[Reg.scala 27:20]
      wbs_Valid <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      wbs_Valid <= io_memwb_Valid; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      wbs_wen <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      wbs_wen <= io_memwb_wen; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      wbs_regdes <= 5'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      wbs_regdes <= io_memwb_regdes; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      wbs_aluresult <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      wbs_aluresult <= io_memwb_aluresult; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      wbs_link <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      wbs_link <= io_memwb_link; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      wbs_auipc <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      wbs_auipc <= io_memwb_auipc; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      wbs_csrData <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      wbs_csrData <= io_memwb_csrData; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      wbs_loadData <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      wbs_loadData <= io_memwb_loadData; // @[Reg.scala 28:23]
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
  wbs_Valid = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  wbs_wen = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  wbs_regdes = _RAND_2[4:0];
  _RAND_3 = {2{`RANDOM}};
  wbs_aluresult = _RAND_3[63:0];
  _RAND_4 = {2{`RANDOM}};
  wbs_link = _RAND_4[63:0];
  _RAND_5 = {2{`RANDOM}};
  wbs_auipc = _RAND_5[63:0];
  _RAND_6 = {2{`RANDOM}};
  wbs_csrData = _RAND_6[63:0];
  _RAND_7 = {2{`RANDOM}};
  wbs_loadData = _RAND_7[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210292_Rainbow(
  input         clock,
  input         reset,
  input         io_ENABLE,
  output [63:0] io_InstFetch_addr,
  input  [31:0] io_InstFetch_data,
  output        io_DataLoad_en,
  output [63:0] io_DataLoad_addr,
  input  [63:0] io_DataLoad_data,
  output [2:0]  io_DataLoad_size,
  output        io_DataStore_en,
  output [63:0] io_DataStore_addr,
  output [63:0] io_DataStore_data,
  output [7:0]  io_DataStore_mask
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire  Fetch_clock; // @[Rainbow.scala 26:27]
  wire  Fetch_reset; // @[Rainbow.scala 26:27]
  wire  Fetch_io_ENABLE; // @[Rainbow.scala 26:27]
  wire  Fetch_io_ifid_Valid; // @[Rainbow.scala 26:27]
  wire [31:0] Fetch_io_ifid_Inst; // @[Rainbow.scala 26:27]
  wire [63:0] Fetch_io_ifid_PC; // @[Rainbow.scala 26:27]
  wire [63:0] Fetch_io_InstFetch_addr; // @[Rainbow.scala 26:27]
  wire [31:0] Fetch_io_InstFetch_data; // @[Rainbow.scala 26:27]
  wire  Fetch_io_cancel; // @[Rainbow.scala 26:27]
  wire  Fetch_io_nextPC_trap; // @[Rainbow.scala 26:27]
  wire [63:0] Fetch_io_nextPC_mtvec; // @[Rainbow.scala 26:27]
  wire  Fetch_io_nextPC_mret; // @[Rainbow.scala 26:27]
  wire [63:0] Fetch_io_nextPC_mepc; // @[Rainbow.scala 26:27]
  wire  Fetch_io_nextPC_branch; // @[Rainbow.scala 26:27]
  wire [63:0] Fetch_io_nextPC_target; // @[Rainbow.scala 26:27]
  wire  InstDecode_clock; // @[Rainbow.scala 27:27]
  wire  InstDecode_reset; // @[Rainbow.scala 27:27]
  wire  InstDecode_io_ENABLE; // @[Rainbow.scala 27:27]
  wire  InstDecode_io_ifid_Valid; // @[Rainbow.scala 27:27]
  wire [31:0] InstDecode_io_ifid_Inst; // @[Rainbow.scala 27:27]
  wire [63:0] InstDecode_io_ifid_PC; // @[Rainbow.scala 27:27]
  wire  InstDecode_io_idex_Valid; // @[Rainbow.scala 27:27]
  wire [31:0] InstDecode_io_idex_Inst; // @[Rainbow.scala 27:27]
  wire [63:0] InstDecode_io_idex_PC; // @[Rainbow.scala 27:27]
  wire  InstDecode_io_idex_isa_ADD; // @[Rainbow.scala 27:27]
  wire  InstDecode_io_idex_isa_ADDI; // @[Rainbow.scala 27:27]
  wire  InstDecode_io_idex_isa_ADDW; // @[Rainbow.scala 27:27]
  wire  InstDecode_io_idex_isa_ADDIW; // @[Rainbow.scala 27:27]
  wire  InstDecode_io_idex_isa_SUB; // @[Rainbow.scala 27:27]
  wire  InstDecode_io_idex_isa_SUBW; // @[Rainbow.scala 27:27]
  wire  InstDecode_io_idex_isa_LUI; // @[Rainbow.scala 27:27]
  wire  InstDecode_io_idex_isa_AUIPC; // @[Rainbow.scala 27:27]
  wire  InstDecode_io_idex_isa_XOR; // @[Rainbow.scala 27:27]
  wire  InstDecode_io_idex_isa_XORI; // @[Rainbow.scala 27:27]
  wire  InstDecode_io_idex_isa_OR; // @[Rainbow.scala 27:27]
  wire  InstDecode_io_idex_isa_ORI; // @[Rainbow.scala 27:27]
  wire  InstDecode_io_idex_isa_AND; // @[Rainbow.scala 27:27]
  wire  InstDecode_io_idex_isa_ANDI; // @[Rainbow.scala 27:27]
  wire  InstDecode_io_idex_isa_SLL; // @[Rainbow.scala 27:27]
  wire  InstDecode_io_idex_isa_SLLI; // @[Rainbow.scala 27:27]
  wire  InstDecode_io_idex_isa_SLLW; // @[Rainbow.scala 27:27]
  wire  InstDecode_io_idex_isa_SLLIW; // @[Rainbow.scala 27:27]
  wire  InstDecode_io_idex_isa_SRL; // @[Rainbow.scala 27:27]
  wire  InstDecode_io_idex_isa_SRLI; // @[Rainbow.scala 27:27]
  wire  InstDecode_io_idex_isa_SRLW; // @[Rainbow.scala 27:27]
  wire  InstDecode_io_idex_isa_SRLIW; // @[Rainbow.scala 27:27]
  wire  InstDecode_io_idex_isa_SRA; // @[Rainbow.scala 27:27]
  wire  InstDecode_io_idex_isa_SRAI; // @[Rainbow.scala 27:27]
  wire  InstDecode_io_idex_isa_SRAW; // @[Rainbow.scala 27:27]
  wire  InstDecode_io_idex_isa_SRAIW; // @[Rainbow.scala 27:27]
  wire  InstDecode_io_idex_isa_SLT; // @[Rainbow.scala 27:27]
  wire  InstDecode_io_idex_isa_SLTI; // @[Rainbow.scala 27:27]
  wire  InstDecode_io_idex_isa_SLTU; // @[Rainbow.scala 27:27]
  wire  InstDecode_io_idex_isa_SLTIU; // @[Rainbow.scala 27:27]
  wire  InstDecode_io_idex_isa_BEQ; // @[Rainbow.scala 27:27]
  wire  InstDecode_io_idex_isa_BNE; // @[Rainbow.scala 27:27]
  wire  InstDecode_io_idex_isa_BLT; // @[Rainbow.scala 27:27]
  wire  InstDecode_io_idex_isa_BGE; // @[Rainbow.scala 27:27]
  wire  InstDecode_io_idex_isa_BLTU; // @[Rainbow.scala 27:27]
  wire  InstDecode_io_idex_isa_BGEU; // @[Rainbow.scala 27:27]
  wire  InstDecode_io_idex_isa_JAL; // @[Rainbow.scala 27:27]
  wire  InstDecode_io_idex_isa_JALR; // @[Rainbow.scala 27:27]
  wire  InstDecode_io_idex_isa_LD; // @[Rainbow.scala 27:27]
  wire  InstDecode_io_idex_isa_LW; // @[Rainbow.scala 27:27]
  wire  InstDecode_io_idex_isa_LH; // @[Rainbow.scala 27:27]
  wire  InstDecode_io_idex_isa_LB; // @[Rainbow.scala 27:27]
  wire  InstDecode_io_idex_isa_LWU; // @[Rainbow.scala 27:27]
  wire  InstDecode_io_idex_isa_LHU; // @[Rainbow.scala 27:27]
  wire  InstDecode_io_idex_isa_LBU; // @[Rainbow.scala 27:27]
  wire  InstDecode_io_idex_isa_SD; // @[Rainbow.scala 27:27]
  wire  InstDecode_io_idex_isa_SW; // @[Rainbow.scala 27:27]
  wire  InstDecode_io_idex_isa_SH; // @[Rainbow.scala 27:27]
  wire  InstDecode_io_idex_isa_SB; // @[Rainbow.scala 27:27]
  wire  InstDecode_io_idex_isa_MRET; // @[Rainbow.scala 27:27]
  wire [63:0] InstDecode_io_idex_src1; // @[Rainbow.scala 27:27]
  wire [63:0] InstDecode_io_idex_src2; // @[Rainbow.scala 27:27]
  wire [63:0] InstDecode_io_idex_imm_I; // @[Rainbow.scala 27:27]
  wire [63:0] InstDecode_io_idex_imm_B; // @[Rainbow.scala 27:27]
  wire [63:0] InstDecode_io_idex_imm_S; // @[Rainbow.scala 27:27]
  wire [63:0] InstDecode_io_idex_imm_U; // @[Rainbow.scala 27:27]
  wire [63:0] InstDecode_io_idex_imm_J; // @[Rainbow.scala 27:27]
  wire  InstDecode_io_idex_wen; // @[Rainbow.scala 27:27]
  wire [4:0] InstDecode_io_idex_regdes; // @[Rainbow.scala 27:27]
  wire  InstDecode_io_cancel; // @[Rainbow.scala 27:27]
  wire  InstDecode_io_wbdata_wen; // @[Rainbow.scala 27:27]
  wire [4:0] InstDecode_io_wbdata_regdes; // @[Rainbow.scala 27:27]
  wire [63:0] InstDecode_io_wbdata_data; // @[Rainbow.scala 27:27]
  wire  Execute_clock; // @[Rainbow.scala 28:27]
  wire  Execute_reset; // @[Rainbow.scala 28:27]
  wire  Execute_io_ENABLE; // @[Rainbow.scala 28:27]
  wire  Execute_io_idex_Valid; // @[Rainbow.scala 28:27]
  wire [31:0] Execute_io_idex_Inst; // @[Rainbow.scala 28:27]
  wire [63:0] Execute_io_idex_PC; // @[Rainbow.scala 28:27]
  wire  Execute_io_idex_isa_ADD; // @[Rainbow.scala 28:27]
  wire  Execute_io_idex_isa_ADDI; // @[Rainbow.scala 28:27]
  wire  Execute_io_idex_isa_ADDW; // @[Rainbow.scala 28:27]
  wire  Execute_io_idex_isa_ADDIW; // @[Rainbow.scala 28:27]
  wire  Execute_io_idex_isa_SUB; // @[Rainbow.scala 28:27]
  wire  Execute_io_idex_isa_SUBW; // @[Rainbow.scala 28:27]
  wire  Execute_io_idex_isa_LUI; // @[Rainbow.scala 28:27]
  wire  Execute_io_idex_isa_AUIPC; // @[Rainbow.scala 28:27]
  wire  Execute_io_idex_isa_XOR; // @[Rainbow.scala 28:27]
  wire  Execute_io_idex_isa_XORI; // @[Rainbow.scala 28:27]
  wire  Execute_io_idex_isa_OR; // @[Rainbow.scala 28:27]
  wire  Execute_io_idex_isa_ORI; // @[Rainbow.scala 28:27]
  wire  Execute_io_idex_isa_AND; // @[Rainbow.scala 28:27]
  wire  Execute_io_idex_isa_ANDI; // @[Rainbow.scala 28:27]
  wire  Execute_io_idex_isa_SLL; // @[Rainbow.scala 28:27]
  wire  Execute_io_idex_isa_SLLI; // @[Rainbow.scala 28:27]
  wire  Execute_io_idex_isa_SLLW; // @[Rainbow.scala 28:27]
  wire  Execute_io_idex_isa_SLLIW; // @[Rainbow.scala 28:27]
  wire  Execute_io_idex_isa_SRL; // @[Rainbow.scala 28:27]
  wire  Execute_io_idex_isa_SRLI; // @[Rainbow.scala 28:27]
  wire  Execute_io_idex_isa_SRLW; // @[Rainbow.scala 28:27]
  wire  Execute_io_idex_isa_SRLIW; // @[Rainbow.scala 28:27]
  wire  Execute_io_idex_isa_SRA; // @[Rainbow.scala 28:27]
  wire  Execute_io_idex_isa_SRAI; // @[Rainbow.scala 28:27]
  wire  Execute_io_idex_isa_SRAW; // @[Rainbow.scala 28:27]
  wire  Execute_io_idex_isa_SRAIW; // @[Rainbow.scala 28:27]
  wire  Execute_io_idex_isa_SLT; // @[Rainbow.scala 28:27]
  wire  Execute_io_idex_isa_SLTI; // @[Rainbow.scala 28:27]
  wire  Execute_io_idex_isa_SLTU; // @[Rainbow.scala 28:27]
  wire  Execute_io_idex_isa_SLTIU; // @[Rainbow.scala 28:27]
  wire  Execute_io_idex_isa_BEQ; // @[Rainbow.scala 28:27]
  wire  Execute_io_idex_isa_BNE; // @[Rainbow.scala 28:27]
  wire  Execute_io_idex_isa_BLT; // @[Rainbow.scala 28:27]
  wire  Execute_io_idex_isa_BGE; // @[Rainbow.scala 28:27]
  wire  Execute_io_idex_isa_BLTU; // @[Rainbow.scala 28:27]
  wire  Execute_io_idex_isa_BGEU; // @[Rainbow.scala 28:27]
  wire  Execute_io_idex_isa_JAL; // @[Rainbow.scala 28:27]
  wire  Execute_io_idex_isa_JALR; // @[Rainbow.scala 28:27]
  wire  Execute_io_idex_isa_LD; // @[Rainbow.scala 28:27]
  wire  Execute_io_idex_isa_LW; // @[Rainbow.scala 28:27]
  wire  Execute_io_idex_isa_LH; // @[Rainbow.scala 28:27]
  wire  Execute_io_idex_isa_LB; // @[Rainbow.scala 28:27]
  wire  Execute_io_idex_isa_LWU; // @[Rainbow.scala 28:27]
  wire  Execute_io_idex_isa_LHU; // @[Rainbow.scala 28:27]
  wire  Execute_io_idex_isa_LBU; // @[Rainbow.scala 28:27]
  wire  Execute_io_idex_isa_SD; // @[Rainbow.scala 28:27]
  wire  Execute_io_idex_isa_SW; // @[Rainbow.scala 28:27]
  wire  Execute_io_idex_isa_SH; // @[Rainbow.scala 28:27]
  wire  Execute_io_idex_isa_SB; // @[Rainbow.scala 28:27]
  wire  Execute_io_idex_isa_MRET; // @[Rainbow.scala 28:27]
  wire [63:0] Execute_io_idex_src1; // @[Rainbow.scala 28:27]
  wire [63:0] Execute_io_idex_src2; // @[Rainbow.scala 28:27]
  wire [63:0] Execute_io_idex_imm_I; // @[Rainbow.scala 28:27]
  wire [63:0] Execute_io_idex_imm_B; // @[Rainbow.scala 28:27]
  wire [63:0] Execute_io_idex_imm_S; // @[Rainbow.scala 28:27]
  wire [63:0] Execute_io_idex_imm_U; // @[Rainbow.scala 28:27]
  wire [63:0] Execute_io_idex_imm_J; // @[Rainbow.scala 28:27]
  wire  Execute_io_idex_wen; // @[Rainbow.scala 28:27]
  wire [4:0] Execute_io_idex_regdes; // @[Rainbow.scala 28:27]
  wire  Execute_io_exmem_Valid; // @[Rainbow.scala 28:27]
  wire  Execute_io_exmem_isa_LD; // @[Rainbow.scala 28:27]
  wire  Execute_io_exmem_isa_LW; // @[Rainbow.scala 28:27]
  wire  Execute_io_exmem_isa_LH; // @[Rainbow.scala 28:27]
  wire  Execute_io_exmem_isa_LB; // @[Rainbow.scala 28:27]
  wire  Execute_io_exmem_isa_LWU; // @[Rainbow.scala 28:27]
  wire  Execute_io_exmem_isa_LHU; // @[Rainbow.scala 28:27]
  wire  Execute_io_exmem_isa_LBU; // @[Rainbow.scala 28:27]
  wire  Execute_io_exmem_isa_SD; // @[Rainbow.scala 28:27]
  wire  Execute_io_exmem_isa_SW; // @[Rainbow.scala 28:27]
  wire  Execute_io_exmem_isa_SH; // @[Rainbow.scala 28:27]
  wire  Execute_io_exmem_isa_SB; // @[Rainbow.scala 28:27]
  wire [63:0] Execute_io_exmem_src1; // @[Rainbow.scala 28:27]
  wire [63:0] Execute_io_exmem_src2; // @[Rainbow.scala 28:27]
  wire [63:0] Execute_io_exmem_imm_I; // @[Rainbow.scala 28:27]
  wire [63:0] Execute_io_exmem_imm_S; // @[Rainbow.scala 28:27]
  wire  Execute_io_exmem_wen; // @[Rainbow.scala 28:27]
  wire [4:0] Execute_io_exmem_regdes; // @[Rainbow.scala 28:27]
  wire [63:0] Execute_io_exmem_aluresult; // @[Rainbow.scala 28:27]
  wire [63:0] Execute_io_exmem_link; // @[Rainbow.scala 28:27]
  wire [63:0] Execute_io_exmem_auipc; // @[Rainbow.scala 28:27]
  wire [63:0] Execute_io_exmem_csrData; // @[Rainbow.scala 28:27]
  wire  Execute_io_cancel; // @[Rainbow.scala 28:27]
  wire  Execute_io_nextPC_trap; // @[Rainbow.scala 28:27]
  wire [63:0] Execute_io_nextPC_mtvec; // @[Rainbow.scala 28:27]
  wire  Execute_io_nextPC_mret; // @[Rainbow.scala 28:27]
  wire [63:0] Execute_io_nextPC_mepc; // @[Rainbow.scala 28:27]
  wire  Execute_io_nextPC_branch; // @[Rainbow.scala 28:27]
  wire [63:0] Execute_io_nextPC_target; // @[Rainbow.scala 28:27]
  wire  Execute_io_redesMem_wen; // @[Rainbow.scala 28:27]
  wire [4:0] Execute_io_redesMem_regdes; // @[Rainbow.scala 28:27]
  wire [63:0] Execute_io_redesMem_data; // @[Rainbow.scala 28:27]
  wire  Execute_io_redesWb_wen; // @[Rainbow.scala 28:27]
  wire [4:0] Execute_io_redesWb_regdes; // @[Rainbow.scala 28:27]
  wire [63:0] Execute_io_redesWb_data; // @[Rainbow.scala 28:27]
  wire  Execute_io_TimeOver; // @[Rainbow.scala 28:27]
  wire  Memory_clock; // @[Rainbow.scala 29:27]
  wire  Memory_reset; // @[Rainbow.scala 29:27]
  wire  Memory_io_ENABLE; // @[Rainbow.scala 29:27]
  wire  Memory_io_exmem_Valid; // @[Rainbow.scala 29:27]
  wire  Memory_io_exmem_isa_LD; // @[Rainbow.scala 29:27]
  wire  Memory_io_exmem_isa_LW; // @[Rainbow.scala 29:27]
  wire  Memory_io_exmem_isa_LH; // @[Rainbow.scala 29:27]
  wire  Memory_io_exmem_isa_LB; // @[Rainbow.scala 29:27]
  wire  Memory_io_exmem_isa_LWU; // @[Rainbow.scala 29:27]
  wire  Memory_io_exmem_isa_LHU; // @[Rainbow.scala 29:27]
  wire  Memory_io_exmem_isa_LBU; // @[Rainbow.scala 29:27]
  wire  Memory_io_exmem_isa_SD; // @[Rainbow.scala 29:27]
  wire  Memory_io_exmem_isa_SW; // @[Rainbow.scala 29:27]
  wire  Memory_io_exmem_isa_SH; // @[Rainbow.scala 29:27]
  wire  Memory_io_exmem_isa_SB; // @[Rainbow.scala 29:27]
  wire [63:0] Memory_io_exmem_src1; // @[Rainbow.scala 29:27]
  wire [63:0] Memory_io_exmem_src2; // @[Rainbow.scala 29:27]
  wire [63:0] Memory_io_exmem_imm_I; // @[Rainbow.scala 29:27]
  wire [63:0] Memory_io_exmem_imm_S; // @[Rainbow.scala 29:27]
  wire  Memory_io_exmem_wen; // @[Rainbow.scala 29:27]
  wire [4:0] Memory_io_exmem_regdes; // @[Rainbow.scala 29:27]
  wire [63:0] Memory_io_exmem_aluresult; // @[Rainbow.scala 29:27]
  wire [63:0] Memory_io_exmem_link; // @[Rainbow.scala 29:27]
  wire [63:0] Memory_io_exmem_auipc; // @[Rainbow.scala 29:27]
  wire [63:0] Memory_io_exmem_csrData; // @[Rainbow.scala 29:27]
  wire  Memory_io_memwb_Valid; // @[Rainbow.scala 29:27]
  wire  Memory_io_memwb_wen; // @[Rainbow.scala 29:27]
  wire [4:0] Memory_io_memwb_regdes; // @[Rainbow.scala 29:27]
  wire [63:0] Memory_io_memwb_aluresult; // @[Rainbow.scala 29:27]
  wire [63:0] Memory_io_memwb_link; // @[Rainbow.scala 29:27]
  wire [63:0] Memory_io_memwb_auipc; // @[Rainbow.scala 29:27]
  wire [63:0] Memory_io_memwb_csrData; // @[Rainbow.scala 29:27]
  wire [63:0] Memory_io_memwb_loadData; // @[Rainbow.scala 29:27]
  wire  Memory_io_DataLoad_en; // @[Rainbow.scala 29:27]
  wire [63:0] Memory_io_DataLoad_addr; // @[Rainbow.scala 29:27]
  wire [63:0] Memory_io_DataLoad_data; // @[Rainbow.scala 29:27]
  wire [2:0] Memory_io_DataLoad_size; // @[Rainbow.scala 29:27]
  wire  Memory_io_DataStore_en; // @[Rainbow.scala 29:27]
  wire [63:0] Memory_io_DataStore_addr; // @[Rainbow.scala 29:27]
  wire [63:0] Memory_io_DataStore_data; // @[Rainbow.scala 29:27]
  wire [7:0] Memory_io_DataStore_mask; // @[Rainbow.scala 29:27]
  wire  Memory_io_redesMem_wen; // @[Rainbow.scala 29:27]
  wire [4:0] Memory_io_redesMem_regdes; // @[Rainbow.scala 29:27]
  wire [63:0] Memory_io_redesMem_data; // @[Rainbow.scala 29:27]
  wire  Memory_io_TimeOver; // @[Rainbow.scala 29:27]
  wire  WriteBack_clock; // @[Rainbow.scala 30:27]
  wire  WriteBack_reset; // @[Rainbow.scala 30:27]
  wire  WriteBack_io_ENABLE; // @[Rainbow.scala 30:27]
  wire  WriteBack_io_memwb_Valid; // @[Rainbow.scala 30:27]
  wire  WriteBack_io_memwb_wen; // @[Rainbow.scala 30:27]
  wire [4:0] WriteBack_io_memwb_regdes; // @[Rainbow.scala 30:27]
  wire [63:0] WriteBack_io_memwb_aluresult; // @[Rainbow.scala 30:27]
  wire [63:0] WriteBack_io_memwb_link; // @[Rainbow.scala 30:27]
  wire [63:0] WriteBack_io_memwb_auipc; // @[Rainbow.scala 30:27]
  wire [63:0] WriteBack_io_memwb_csrData; // @[Rainbow.scala 30:27]
  wire [63:0] WriteBack_io_memwb_loadData; // @[Rainbow.scala 30:27]
  wire  WriteBack_io_wbdata_wen; // @[Rainbow.scala 30:27]
  wire [4:0] WriteBack_io_wbdata_regdes; // @[Rainbow.scala 30:27]
  wire [63:0] WriteBack_io_wbdata_data; // @[Rainbow.scala 30:27]
  reg [3:0] CampactCnt; // @[Rainbow.scala 77:27]
  wire  _T = CampactCnt == 4'h3; // @[Rainbow.scala 80:21]
  wire [3:0] _CampactCnt_T_1 = CampactCnt + 4'h1; // @[Rainbow.scala 83:32]
  wire  CampactCycleOne = Execute_io_cancel & CampactCnt == 4'h1; // @[Rainbow.scala 87:33]
  wire  CampactCycleTwo = Execute_io_cancel & CampactCnt == 4'h2; // @[Rainbow.scala 88:33]
  wire  CampactCycleThree = Execute_io_cancel & _T; // @[Rainbow.scala 89:35]
  wire  _Execute_io_ENABLE_T = CampactCycleOne | CampactCycleTwo; // @[Rainbow.scala 96:48]
  reg [63:0] LoadDataInCampact; // @[Rainbow.scala 105:34]
  reg  LoadStoreBlocker_r; // @[Reg.scala 27:20]
  reg  LoadStoreBlocker_r_1; // @[Reg.scala 27:20]
  wire  LoadStoreBlocker = LoadStoreBlocker_r | LoadStoreBlocker_r_1; // @[Rainbow.scala 118:73]
  wire  _io_DataLoad_en_T = ~LoadStoreBlocker; // @[Rainbow.scala 119:46]
  ysyx_210292_Fetch Fetch ( // @[Rainbow.scala 26:27]
    .clock(Fetch_clock),
    .reset(Fetch_reset),
    .io_ENABLE(Fetch_io_ENABLE),
    .io_ifid_Valid(Fetch_io_ifid_Valid),
    .io_ifid_Inst(Fetch_io_ifid_Inst),
    .io_ifid_PC(Fetch_io_ifid_PC),
    .io_InstFetch_addr(Fetch_io_InstFetch_addr),
    .io_InstFetch_data(Fetch_io_InstFetch_data),
    .io_cancel(Fetch_io_cancel),
    .io_nextPC_trap(Fetch_io_nextPC_trap),
    .io_nextPC_mtvec(Fetch_io_nextPC_mtvec),
    .io_nextPC_mret(Fetch_io_nextPC_mret),
    .io_nextPC_mepc(Fetch_io_nextPC_mepc),
    .io_nextPC_branch(Fetch_io_nextPC_branch),
    .io_nextPC_target(Fetch_io_nextPC_target)
  );
  ysyx_210292_InstDecode InstDecode ( // @[Rainbow.scala 27:27]
    .clock(InstDecode_clock),
    .reset(InstDecode_reset),
    .io_ENABLE(InstDecode_io_ENABLE),
    .io_ifid_Valid(InstDecode_io_ifid_Valid),
    .io_ifid_Inst(InstDecode_io_ifid_Inst),
    .io_ifid_PC(InstDecode_io_ifid_PC),
    .io_idex_Valid(InstDecode_io_idex_Valid),
    .io_idex_Inst(InstDecode_io_idex_Inst),
    .io_idex_PC(InstDecode_io_idex_PC),
    .io_idex_isa_ADD(InstDecode_io_idex_isa_ADD),
    .io_idex_isa_ADDI(InstDecode_io_idex_isa_ADDI),
    .io_idex_isa_ADDW(InstDecode_io_idex_isa_ADDW),
    .io_idex_isa_ADDIW(InstDecode_io_idex_isa_ADDIW),
    .io_idex_isa_SUB(InstDecode_io_idex_isa_SUB),
    .io_idex_isa_SUBW(InstDecode_io_idex_isa_SUBW),
    .io_idex_isa_LUI(InstDecode_io_idex_isa_LUI),
    .io_idex_isa_AUIPC(InstDecode_io_idex_isa_AUIPC),
    .io_idex_isa_XOR(InstDecode_io_idex_isa_XOR),
    .io_idex_isa_XORI(InstDecode_io_idex_isa_XORI),
    .io_idex_isa_OR(InstDecode_io_idex_isa_OR),
    .io_idex_isa_ORI(InstDecode_io_idex_isa_ORI),
    .io_idex_isa_AND(InstDecode_io_idex_isa_AND),
    .io_idex_isa_ANDI(InstDecode_io_idex_isa_ANDI),
    .io_idex_isa_SLL(InstDecode_io_idex_isa_SLL),
    .io_idex_isa_SLLI(InstDecode_io_idex_isa_SLLI),
    .io_idex_isa_SLLW(InstDecode_io_idex_isa_SLLW),
    .io_idex_isa_SLLIW(InstDecode_io_idex_isa_SLLIW),
    .io_idex_isa_SRL(InstDecode_io_idex_isa_SRL),
    .io_idex_isa_SRLI(InstDecode_io_idex_isa_SRLI),
    .io_idex_isa_SRLW(InstDecode_io_idex_isa_SRLW),
    .io_idex_isa_SRLIW(InstDecode_io_idex_isa_SRLIW),
    .io_idex_isa_SRA(InstDecode_io_idex_isa_SRA),
    .io_idex_isa_SRAI(InstDecode_io_idex_isa_SRAI),
    .io_idex_isa_SRAW(InstDecode_io_idex_isa_SRAW),
    .io_idex_isa_SRAIW(InstDecode_io_idex_isa_SRAIW),
    .io_idex_isa_SLT(InstDecode_io_idex_isa_SLT),
    .io_idex_isa_SLTI(InstDecode_io_idex_isa_SLTI),
    .io_idex_isa_SLTU(InstDecode_io_idex_isa_SLTU),
    .io_idex_isa_SLTIU(InstDecode_io_idex_isa_SLTIU),
    .io_idex_isa_BEQ(InstDecode_io_idex_isa_BEQ),
    .io_idex_isa_BNE(InstDecode_io_idex_isa_BNE),
    .io_idex_isa_BLT(InstDecode_io_idex_isa_BLT),
    .io_idex_isa_BGE(InstDecode_io_idex_isa_BGE),
    .io_idex_isa_BLTU(InstDecode_io_idex_isa_BLTU),
    .io_idex_isa_BGEU(InstDecode_io_idex_isa_BGEU),
    .io_idex_isa_JAL(InstDecode_io_idex_isa_JAL),
    .io_idex_isa_JALR(InstDecode_io_idex_isa_JALR),
    .io_idex_isa_LD(InstDecode_io_idex_isa_LD),
    .io_idex_isa_LW(InstDecode_io_idex_isa_LW),
    .io_idex_isa_LH(InstDecode_io_idex_isa_LH),
    .io_idex_isa_LB(InstDecode_io_idex_isa_LB),
    .io_idex_isa_LWU(InstDecode_io_idex_isa_LWU),
    .io_idex_isa_LHU(InstDecode_io_idex_isa_LHU),
    .io_idex_isa_LBU(InstDecode_io_idex_isa_LBU),
    .io_idex_isa_SD(InstDecode_io_idex_isa_SD),
    .io_idex_isa_SW(InstDecode_io_idex_isa_SW),
    .io_idex_isa_SH(InstDecode_io_idex_isa_SH),
    .io_idex_isa_SB(InstDecode_io_idex_isa_SB),
    .io_idex_isa_MRET(InstDecode_io_idex_isa_MRET),
    .io_idex_src1(InstDecode_io_idex_src1),
    .io_idex_src2(InstDecode_io_idex_src2),
    .io_idex_imm_I(InstDecode_io_idex_imm_I),
    .io_idex_imm_B(InstDecode_io_idex_imm_B),
    .io_idex_imm_S(InstDecode_io_idex_imm_S),
    .io_idex_imm_U(InstDecode_io_idex_imm_U),
    .io_idex_imm_J(InstDecode_io_idex_imm_J),
    .io_idex_wen(InstDecode_io_idex_wen),
    .io_idex_regdes(InstDecode_io_idex_regdes),
    .io_cancel(InstDecode_io_cancel),
    .io_wbdata_wen(InstDecode_io_wbdata_wen),
    .io_wbdata_regdes(InstDecode_io_wbdata_regdes),
    .io_wbdata_data(InstDecode_io_wbdata_data)
  );
  ysyx_210292_Execute Execute ( // @[Rainbow.scala 28:27]
    .clock(Execute_clock),
    .reset(Execute_reset),
    .io_ENABLE(Execute_io_ENABLE),
    .io_idex_Valid(Execute_io_idex_Valid),
    .io_idex_Inst(Execute_io_idex_Inst),
    .io_idex_PC(Execute_io_idex_PC),
    .io_idex_isa_ADD(Execute_io_idex_isa_ADD),
    .io_idex_isa_ADDI(Execute_io_idex_isa_ADDI),
    .io_idex_isa_ADDW(Execute_io_idex_isa_ADDW),
    .io_idex_isa_ADDIW(Execute_io_idex_isa_ADDIW),
    .io_idex_isa_SUB(Execute_io_idex_isa_SUB),
    .io_idex_isa_SUBW(Execute_io_idex_isa_SUBW),
    .io_idex_isa_LUI(Execute_io_idex_isa_LUI),
    .io_idex_isa_AUIPC(Execute_io_idex_isa_AUIPC),
    .io_idex_isa_XOR(Execute_io_idex_isa_XOR),
    .io_idex_isa_XORI(Execute_io_idex_isa_XORI),
    .io_idex_isa_OR(Execute_io_idex_isa_OR),
    .io_idex_isa_ORI(Execute_io_idex_isa_ORI),
    .io_idex_isa_AND(Execute_io_idex_isa_AND),
    .io_idex_isa_ANDI(Execute_io_idex_isa_ANDI),
    .io_idex_isa_SLL(Execute_io_idex_isa_SLL),
    .io_idex_isa_SLLI(Execute_io_idex_isa_SLLI),
    .io_idex_isa_SLLW(Execute_io_idex_isa_SLLW),
    .io_idex_isa_SLLIW(Execute_io_idex_isa_SLLIW),
    .io_idex_isa_SRL(Execute_io_idex_isa_SRL),
    .io_idex_isa_SRLI(Execute_io_idex_isa_SRLI),
    .io_idex_isa_SRLW(Execute_io_idex_isa_SRLW),
    .io_idex_isa_SRLIW(Execute_io_idex_isa_SRLIW),
    .io_idex_isa_SRA(Execute_io_idex_isa_SRA),
    .io_idex_isa_SRAI(Execute_io_idex_isa_SRAI),
    .io_idex_isa_SRAW(Execute_io_idex_isa_SRAW),
    .io_idex_isa_SRAIW(Execute_io_idex_isa_SRAIW),
    .io_idex_isa_SLT(Execute_io_idex_isa_SLT),
    .io_idex_isa_SLTI(Execute_io_idex_isa_SLTI),
    .io_idex_isa_SLTU(Execute_io_idex_isa_SLTU),
    .io_idex_isa_SLTIU(Execute_io_idex_isa_SLTIU),
    .io_idex_isa_BEQ(Execute_io_idex_isa_BEQ),
    .io_idex_isa_BNE(Execute_io_idex_isa_BNE),
    .io_idex_isa_BLT(Execute_io_idex_isa_BLT),
    .io_idex_isa_BGE(Execute_io_idex_isa_BGE),
    .io_idex_isa_BLTU(Execute_io_idex_isa_BLTU),
    .io_idex_isa_BGEU(Execute_io_idex_isa_BGEU),
    .io_idex_isa_JAL(Execute_io_idex_isa_JAL),
    .io_idex_isa_JALR(Execute_io_idex_isa_JALR),
    .io_idex_isa_LD(Execute_io_idex_isa_LD),
    .io_idex_isa_LW(Execute_io_idex_isa_LW),
    .io_idex_isa_LH(Execute_io_idex_isa_LH),
    .io_idex_isa_LB(Execute_io_idex_isa_LB),
    .io_idex_isa_LWU(Execute_io_idex_isa_LWU),
    .io_idex_isa_LHU(Execute_io_idex_isa_LHU),
    .io_idex_isa_LBU(Execute_io_idex_isa_LBU),
    .io_idex_isa_SD(Execute_io_idex_isa_SD),
    .io_idex_isa_SW(Execute_io_idex_isa_SW),
    .io_idex_isa_SH(Execute_io_idex_isa_SH),
    .io_idex_isa_SB(Execute_io_idex_isa_SB),
    .io_idex_isa_MRET(Execute_io_idex_isa_MRET),
    .io_idex_src1(Execute_io_idex_src1),
    .io_idex_src2(Execute_io_idex_src2),
    .io_idex_imm_I(Execute_io_idex_imm_I),
    .io_idex_imm_B(Execute_io_idex_imm_B),
    .io_idex_imm_S(Execute_io_idex_imm_S),
    .io_idex_imm_U(Execute_io_idex_imm_U),
    .io_idex_imm_J(Execute_io_idex_imm_J),
    .io_idex_wen(Execute_io_idex_wen),
    .io_idex_regdes(Execute_io_idex_regdes),
    .io_exmem_Valid(Execute_io_exmem_Valid),
    .io_exmem_isa_LD(Execute_io_exmem_isa_LD),
    .io_exmem_isa_LW(Execute_io_exmem_isa_LW),
    .io_exmem_isa_LH(Execute_io_exmem_isa_LH),
    .io_exmem_isa_LB(Execute_io_exmem_isa_LB),
    .io_exmem_isa_LWU(Execute_io_exmem_isa_LWU),
    .io_exmem_isa_LHU(Execute_io_exmem_isa_LHU),
    .io_exmem_isa_LBU(Execute_io_exmem_isa_LBU),
    .io_exmem_isa_SD(Execute_io_exmem_isa_SD),
    .io_exmem_isa_SW(Execute_io_exmem_isa_SW),
    .io_exmem_isa_SH(Execute_io_exmem_isa_SH),
    .io_exmem_isa_SB(Execute_io_exmem_isa_SB),
    .io_exmem_src1(Execute_io_exmem_src1),
    .io_exmem_src2(Execute_io_exmem_src2),
    .io_exmem_imm_I(Execute_io_exmem_imm_I),
    .io_exmem_imm_S(Execute_io_exmem_imm_S),
    .io_exmem_wen(Execute_io_exmem_wen),
    .io_exmem_regdes(Execute_io_exmem_regdes),
    .io_exmem_aluresult(Execute_io_exmem_aluresult),
    .io_exmem_link(Execute_io_exmem_link),
    .io_exmem_auipc(Execute_io_exmem_auipc),
    .io_exmem_csrData(Execute_io_exmem_csrData),
    .io_cancel(Execute_io_cancel),
    .io_nextPC_trap(Execute_io_nextPC_trap),
    .io_nextPC_mtvec(Execute_io_nextPC_mtvec),
    .io_nextPC_mret(Execute_io_nextPC_mret),
    .io_nextPC_mepc(Execute_io_nextPC_mepc),
    .io_nextPC_branch(Execute_io_nextPC_branch),
    .io_nextPC_target(Execute_io_nextPC_target),
    .io_redesMem_wen(Execute_io_redesMem_wen),
    .io_redesMem_regdes(Execute_io_redesMem_regdes),
    .io_redesMem_data(Execute_io_redesMem_data),
    .io_redesWb_wen(Execute_io_redesWb_wen),
    .io_redesWb_regdes(Execute_io_redesWb_regdes),
    .io_redesWb_data(Execute_io_redesWb_data),
    .io_TimeOver(Execute_io_TimeOver)
  );
  ysyx_210292_Memory Memory ( // @[Rainbow.scala 29:27]
    .clock(Memory_clock),
    .reset(Memory_reset),
    .io_ENABLE(Memory_io_ENABLE),
    .io_exmem_Valid(Memory_io_exmem_Valid),
    .io_exmem_isa_LD(Memory_io_exmem_isa_LD),
    .io_exmem_isa_LW(Memory_io_exmem_isa_LW),
    .io_exmem_isa_LH(Memory_io_exmem_isa_LH),
    .io_exmem_isa_LB(Memory_io_exmem_isa_LB),
    .io_exmem_isa_LWU(Memory_io_exmem_isa_LWU),
    .io_exmem_isa_LHU(Memory_io_exmem_isa_LHU),
    .io_exmem_isa_LBU(Memory_io_exmem_isa_LBU),
    .io_exmem_isa_SD(Memory_io_exmem_isa_SD),
    .io_exmem_isa_SW(Memory_io_exmem_isa_SW),
    .io_exmem_isa_SH(Memory_io_exmem_isa_SH),
    .io_exmem_isa_SB(Memory_io_exmem_isa_SB),
    .io_exmem_src1(Memory_io_exmem_src1),
    .io_exmem_src2(Memory_io_exmem_src2),
    .io_exmem_imm_I(Memory_io_exmem_imm_I),
    .io_exmem_imm_S(Memory_io_exmem_imm_S),
    .io_exmem_wen(Memory_io_exmem_wen),
    .io_exmem_regdes(Memory_io_exmem_regdes),
    .io_exmem_aluresult(Memory_io_exmem_aluresult),
    .io_exmem_link(Memory_io_exmem_link),
    .io_exmem_auipc(Memory_io_exmem_auipc),
    .io_exmem_csrData(Memory_io_exmem_csrData),
    .io_memwb_Valid(Memory_io_memwb_Valid),
    .io_memwb_wen(Memory_io_memwb_wen),
    .io_memwb_regdes(Memory_io_memwb_regdes),
    .io_memwb_aluresult(Memory_io_memwb_aluresult),
    .io_memwb_link(Memory_io_memwb_link),
    .io_memwb_auipc(Memory_io_memwb_auipc),
    .io_memwb_csrData(Memory_io_memwb_csrData),
    .io_memwb_loadData(Memory_io_memwb_loadData),
    .io_DataLoad_en(Memory_io_DataLoad_en),
    .io_DataLoad_addr(Memory_io_DataLoad_addr),
    .io_DataLoad_data(Memory_io_DataLoad_data),
    .io_DataLoad_size(Memory_io_DataLoad_size),
    .io_DataStore_en(Memory_io_DataStore_en),
    .io_DataStore_addr(Memory_io_DataStore_addr),
    .io_DataStore_data(Memory_io_DataStore_data),
    .io_DataStore_mask(Memory_io_DataStore_mask),
    .io_redesMem_wen(Memory_io_redesMem_wen),
    .io_redesMem_regdes(Memory_io_redesMem_regdes),
    .io_redesMem_data(Memory_io_redesMem_data),
    .io_TimeOver(Memory_io_TimeOver)
  );
  ysyx_210292_WriteBack WriteBack ( // @[Rainbow.scala 30:27]
    .clock(WriteBack_clock),
    .reset(WriteBack_reset),
    .io_ENABLE(WriteBack_io_ENABLE),
    .io_memwb_Valid(WriteBack_io_memwb_Valid),
    .io_memwb_wen(WriteBack_io_memwb_wen),
    .io_memwb_regdes(WriteBack_io_memwb_regdes),
    .io_memwb_aluresult(WriteBack_io_memwb_aluresult),
    .io_memwb_link(WriteBack_io_memwb_link),
    .io_memwb_auipc(WriteBack_io_memwb_auipc),
    .io_memwb_csrData(WriteBack_io_memwb_csrData),
    .io_memwb_loadData(WriteBack_io_memwb_loadData),
    .io_wbdata_wen(WriteBack_io_wbdata_wen),
    .io_wbdata_regdes(WriteBack_io_wbdata_regdes),
    .io_wbdata_data(WriteBack_io_wbdata_data)
  );
  assign io_InstFetch_addr = Fetch_io_InstFetch_addr; // @[Rainbow.scala 115:17]
  assign io_DataLoad_en = Memory_io_DataLoad_en & ~LoadStoreBlocker; // @[Rainbow.scala 119:43]
  assign io_DataLoad_addr = Memory_io_DataLoad_addr; // @[Rainbow.scala 120:20]
  assign io_DataLoad_size = Memory_io_DataLoad_size; // @[Rainbow.scala 122:20]
  assign io_DataStore_en = Memory_io_DataStore_en & _io_DataLoad_en_T; // @[Rainbow.scala 124:45]
  assign io_DataStore_addr = Memory_io_DataStore_addr; // @[Rainbow.scala 125:21]
  assign io_DataStore_data = Memory_io_DataStore_data; // @[Rainbow.scala 126:21]
  assign io_DataStore_mask = Memory_io_DataStore_mask; // @[Rainbow.scala 127:21]
  assign Fetch_clock = clock;
  assign Fetch_reset = reset;
  assign Fetch_io_ENABLE = io_ENABLE; // @[Rainbow.scala 94:25]
  assign Fetch_io_InstFetch_data = io_InstFetch_data; // @[Rainbow.scala 115:17]
  assign Fetch_io_cancel = Execute_io_cancel & CampactCnt == 4'h1; // @[Rainbow.scala 87:33]
  assign Fetch_io_nextPC_trap = CampactCycleOne & Execute_io_nextPC_trap; // @[Rainbow.scala 101:25]
  assign Fetch_io_nextPC_mtvec = CampactCycleOne ? Execute_io_nextPC_mtvec : 64'h0; // @[Rainbow.scala 101:25]
  assign Fetch_io_nextPC_mret = CampactCycleOne & Execute_io_nextPC_mret; // @[Rainbow.scala 101:25]
  assign Fetch_io_nextPC_mepc = CampactCycleOne ? Execute_io_nextPC_mepc : 64'h0; // @[Rainbow.scala 101:25]
  assign Fetch_io_nextPC_branch = CampactCycleOne & Execute_io_nextPC_branch; // @[Rainbow.scala 101:25]
  assign Fetch_io_nextPC_target = CampactCycleOne ? Execute_io_nextPC_target : 64'h0; // @[Rainbow.scala 101:25]
  assign InstDecode_clock = clock;
  assign InstDecode_reset = reset;
  assign InstDecode_io_ENABLE = io_ENABLE; // @[Rainbow.scala 95:25]
  assign InstDecode_io_ifid_Valid = Fetch_io_ifid_Valid; // @[Rainbow.scala 36:23]
  assign InstDecode_io_ifid_Inst = Fetch_io_ifid_Inst; // @[Rainbow.scala 36:23]
  assign InstDecode_io_ifid_PC = Fetch_io_ifid_PC; // @[Rainbow.scala 36:23]
  assign InstDecode_io_cancel = Execute_io_cancel & CampactCnt == 4'h1; // @[Rainbow.scala 87:33]
  assign InstDecode_io_wbdata_wen = _Execute_io_ENABLE_T ? 1'h0 : WriteBack_io_wbdata_wen; // @[Rainbow.scala 100:30]
  assign InstDecode_io_wbdata_regdes = _Execute_io_ENABLE_T ? 5'h0 : WriteBack_io_wbdata_regdes; // @[Rainbow.scala 100:30]
  assign InstDecode_io_wbdata_data = _Execute_io_ENABLE_T ? 64'h0 : WriteBack_io_wbdata_data; // @[Rainbow.scala 100:30]
  assign Execute_clock = clock;
  assign Execute_reset = reset;
  assign Execute_io_ENABLE = CampactCycleOne | CampactCycleTwo ? 1'h0 : io_ENABLE; // @[Rainbow.scala 96:31]
  assign Execute_io_idex_Valid = InstDecode_io_idex_Valid; // @[Rainbow.scala 37:23]
  assign Execute_io_idex_Inst = InstDecode_io_idex_Inst; // @[Rainbow.scala 37:23]
  assign Execute_io_idex_PC = InstDecode_io_idex_PC; // @[Rainbow.scala 37:23]
  assign Execute_io_idex_isa_ADD = InstDecode_io_idex_isa_ADD; // @[Rainbow.scala 37:23]
  assign Execute_io_idex_isa_ADDI = InstDecode_io_idex_isa_ADDI; // @[Rainbow.scala 37:23]
  assign Execute_io_idex_isa_ADDW = InstDecode_io_idex_isa_ADDW; // @[Rainbow.scala 37:23]
  assign Execute_io_idex_isa_ADDIW = InstDecode_io_idex_isa_ADDIW; // @[Rainbow.scala 37:23]
  assign Execute_io_idex_isa_SUB = InstDecode_io_idex_isa_SUB; // @[Rainbow.scala 37:23]
  assign Execute_io_idex_isa_SUBW = InstDecode_io_idex_isa_SUBW; // @[Rainbow.scala 37:23]
  assign Execute_io_idex_isa_LUI = InstDecode_io_idex_isa_LUI; // @[Rainbow.scala 37:23]
  assign Execute_io_idex_isa_AUIPC = InstDecode_io_idex_isa_AUIPC; // @[Rainbow.scala 37:23]
  assign Execute_io_idex_isa_XOR = InstDecode_io_idex_isa_XOR; // @[Rainbow.scala 37:23]
  assign Execute_io_idex_isa_XORI = InstDecode_io_idex_isa_XORI; // @[Rainbow.scala 37:23]
  assign Execute_io_idex_isa_OR = InstDecode_io_idex_isa_OR; // @[Rainbow.scala 37:23]
  assign Execute_io_idex_isa_ORI = InstDecode_io_idex_isa_ORI; // @[Rainbow.scala 37:23]
  assign Execute_io_idex_isa_AND = InstDecode_io_idex_isa_AND; // @[Rainbow.scala 37:23]
  assign Execute_io_idex_isa_ANDI = InstDecode_io_idex_isa_ANDI; // @[Rainbow.scala 37:23]
  assign Execute_io_idex_isa_SLL = InstDecode_io_idex_isa_SLL; // @[Rainbow.scala 37:23]
  assign Execute_io_idex_isa_SLLI = InstDecode_io_idex_isa_SLLI; // @[Rainbow.scala 37:23]
  assign Execute_io_idex_isa_SLLW = InstDecode_io_idex_isa_SLLW; // @[Rainbow.scala 37:23]
  assign Execute_io_idex_isa_SLLIW = InstDecode_io_idex_isa_SLLIW; // @[Rainbow.scala 37:23]
  assign Execute_io_idex_isa_SRL = InstDecode_io_idex_isa_SRL; // @[Rainbow.scala 37:23]
  assign Execute_io_idex_isa_SRLI = InstDecode_io_idex_isa_SRLI; // @[Rainbow.scala 37:23]
  assign Execute_io_idex_isa_SRLW = InstDecode_io_idex_isa_SRLW; // @[Rainbow.scala 37:23]
  assign Execute_io_idex_isa_SRLIW = InstDecode_io_idex_isa_SRLIW; // @[Rainbow.scala 37:23]
  assign Execute_io_idex_isa_SRA = InstDecode_io_idex_isa_SRA; // @[Rainbow.scala 37:23]
  assign Execute_io_idex_isa_SRAI = InstDecode_io_idex_isa_SRAI; // @[Rainbow.scala 37:23]
  assign Execute_io_idex_isa_SRAW = InstDecode_io_idex_isa_SRAW; // @[Rainbow.scala 37:23]
  assign Execute_io_idex_isa_SRAIW = InstDecode_io_idex_isa_SRAIW; // @[Rainbow.scala 37:23]
  assign Execute_io_idex_isa_SLT = InstDecode_io_idex_isa_SLT; // @[Rainbow.scala 37:23]
  assign Execute_io_idex_isa_SLTI = InstDecode_io_idex_isa_SLTI; // @[Rainbow.scala 37:23]
  assign Execute_io_idex_isa_SLTU = InstDecode_io_idex_isa_SLTU; // @[Rainbow.scala 37:23]
  assign Execute_io_idex_isa_SLTIU = InstDecode_io_idex_isa_SLTIU; // @[Rainbow.scala 37:23]
  assign Execute_io_idex_isa_BEQ = InstDecode_io_idex_isa_BEQ; // @[Rainbow.scala 37:23]
  assign Execute_io_idex_isa_BNE = InstDecode_io_idex_isa_BNE; // @[Rainbow.scala 37:23]
  assign Execute_io_idex_isa_BLT = InstDecode_io_idex_isa_BLT; // @[Rainbow.scala 37:23]
  assign Execute_io_idex_isa_BGE = InstDecode_io_idex_isa_BGE; // @[Rainbow.scala 37:23]
  assign Execute_io_idex_isa_BLTU = InstDecode_io_idex_isa_BLTU; // @[Rainbow.scala 37:23]
  assign Execute_io_idex_isa_BGEU = InstDecode_io_idex_isa_BGEU; // @[Rainbow.scala 37:23]
  assign Execute_io_idex_isa_JAL = InstDecode_io_idex_isa_JAL; // @[Rainbow.scala 37:23]
  assign Execute_io_idex_isa_JALR = InstDecode_io_idex_isa_JALR; // @[Rainbow.scala 37:23]
  assign Execute_io_idex_isa_LD = InstDecode_io_idex_isa_LD; // @[Rainbow.scala 37:23]
  assign Execute_io_idex_isa_LW = InstDecode_io_idex_isa_LW; // @[Rainbow.scala 37:23]
  assign Execute_io_idex_isa_LH = InstDecode_io_idex_isa_LH; // @[Rainbow.scala 37:23]
  assign Execute_io_idex_isa_LB = InstDecode_io_idex_isa_LB; // @[Rainbow.scala 37:23]
  assign Execute_io_idex_isa_LWU = InstDecode_io_idex_isa_LWU; // @[Rainbow.scala 37:23]
  assign Execute_io_idex_isa_LHU = InstDecode_io_idex_isa_LHU; // @[Rainbow.scala 37:23]
  assign Execute_io_idex_isa_LBU = InstDecode_io_idex_isa_LBU; // @[Rainbow.scala 37:23]
  assign Execute_io_idex_isa_SD = InstDecode_io_idex_isa_SD; // @[Rainbow.scala 37:23]
  assign Execute_io_idex_isa_SW = InstDecode_io_idex_isa_SW; // @[Rainbow.scala 37:23]
  assign Execute_io_idex_isa_SH = InstDecode_io_idex_isa_SH; // @[Rainbow.scala 37:23]
  assign Execute_io_idex_isa_SB = InstDecode_io_idex_isa_SB; // @[Rainbow.scala 37:23]
  assign Execute_io_idex_isa_MRET = InstDecode_io_idex_isa_MRET; // @[Rainbow.scala 37:23]
  assign Execute_io_idex_src1 = InstDecode_io_idex_src1; // @[Rainbow.scala 37:23]
  assign Execute_io_idex_src2 = InstDecode_io_idex_src2; // @[Rainbow.scala 37:23]
  assign Execute_io_idex_imm_I = InstDecode_io_idex_imm_I; // @[Rainbow.scala 37:23]
  assign Execute_io_idex_imm_B = InstDecode_io_idex_imm_B; // @[Rainbow.scala 37:23]
  assign Execute_io_idex_imm_S = InstDecode_io_idex_imm_S; // @[Rainbow.scala 37:23]
  assign Execute_io_idex_imm_U = InstDecode_io_idex_imm_U; // @[Rainbow.scala 37:23]
  assign Execute_io_idex_imm_J = InstDecode_io_idex_imm_J; // @[Rainbow.scala 37:23]
  assign Execute_io_idex_wen = InstDecode_io_idex_wen; // @[Rainbow.scala 37:23]
  assign Execute_io_idex_regdes = InstDecode_io_idex_regdes; // @[Rainbow.scala 37:23]
  assign Execute_io_redesMem_wen = Memory_io_redesMem_wen; // @[Rainbow.scala 45:23]
  assign Execute_io_redesMem_regdes = Memory_io_redesMem_regdes; // @[Rainbow.scala 45:23]
  assign Execute_io_redesMem_data = Memory_io_redesMem_data; // @[Rainbow.scala 45:23]
  assign Execute_io_redesWb_wen = WriteBack_io_wbdata_wen; // @[Rainbow.scala 46:23]
  assign Execute_io_redesWb_regdes = WriteBack_io_wbdata_regdes; // @[Rainbow.scala 46:23]
  assign Execute_io_redesWb_data = WriteBack_io_wbdata_data; // @[Rainbow.scala 46:23]
  assign Execute_io_TimeOver = Memory_io_TimeOver; // @[Rainbow.scala 50:23]
  assign Memory_clock = clock;
  assign Memory_reset = reset;
  assign Memory_io_ENABLE = _Execute_io_ENABLE_T ? 1'h0 : io_ENABLE; // @[Rainbow.scala 97:31]
  assign Memory_io_exmem_Valid = Execute_io_exmem_Valid; // @[Rainbow.scala 38:23]
  assign Memory_io_exmem_isa_LD = Execute_io_exmem_isa_LD; // @[Rainbow.scala 38:23]
  assign Memory_io_exmem_isa_LW = Execute_io_exmem_isa_LW; // @[Rainbow.scala 38:23]
  assign Memory_io_exmem_isa_LH = Execute_io_exmem_isa_LH; // @[Rainbow.scala 38:23]
  assign Memory_io_exmem_isa_LB = Execute_io_exmem_isa_LB; // @[Rainbow.scala 38:23]
  assign Memory_io_exmem_isa_LWU = Execute_io_exmem_isa_LWU; // @[Rainbow.scala 38:23]
  assign Memory_io_exmem_isa_LHU = Execute_io_exmem_isa_LHU; // @[Rainbow.scala 38:23]
  assign Memory_io_exmem_isa_LBU = Execute_io_exmem_isa_LBU; // @[Rainbow.scala 38:23]
  assign Memory_io_exmem_isa_SD = Execute_io_exmem_isa_SD; // @[Rainbow.scala 38:23]
  assign Memory_io_exmem_isa_SW = Execute_io_exmem_isa_SW; // @[Rainbow.scala 38:23]
  assign Memory_io_exmem_isa_SH = Execute_io_exmem_isa_SH; // @[Rainbow.scala 38:23]
  assign Memory_io_exmem_isa_SB = Execute_io_exmem_isa_SB; // @[Rainbow.scala 38:23]
  assign Memory_io_exmem_src1 = Execute_io_exmem_src1; // @[Rainbow.scala 38:23]
  assign Memory_io_exmem_src2 = Execute_io_exmem_src2; // @[Rainbow.scala 38:23]
  assign Memory_io_exmem_imm_I = Execute_io_exmem_imm_I; // @[Rainbow.scala 38:23]
  assign Memory_io_exmem_imm_S = Execute_io_exmem_imm_S; // @[Rainbow.scala 38:23]
  assign Memory_io_exmem_wen = Execute_io_exmem_wen; // @[Rainbow.scala 38:23]
  assign Memory_io_exmem_regdes = Execute_io_exmem_regdes; // @[Rainbow.scala 38:23]
  assign Memory_io_exmem_aluresult = Execute_io_exmem_aluresult; // @[Rainbow.scala 38:23]
  assign Memory_io_exmem_link = Execute_io_exmem_link; // @[Rainbow.scala 38:23]
  assign Memory_io_exmem_auipc = Execute_io_exmem_auipc; // @[Rainbow.scala 38:23]
  assign Memory_io_exmem_csrData = Execute_io_exmem_csrData; // @[Rainbow.scala 38:23]
  assign Memory_io_DataLoad_data = LoadStoreBlocker ? LoadDataInCampact : io_DataLoad_data; // @[Rainbow.scala 121:33]
  assign WriteBack_clock = clock;
  assign WriteBack_reset = reset;
  assign WriteBack_io_ENABLE = _Execute_io_ENABLE_T ? 1'h0 : io_ENABLE; // @[Rainbow.scala 98:31]
  assign WriteBack_io_memwb_Valid = Memory_io_memwb_Valid; // @[Rainbow.scala 39:23]
  assign WriteBack_io_memwb_wen = Memory_io_memwb_wen; // @[Rainbow.scala 39:23]
  assign WriteBack_io_memwb_regdes = Memory_io_memwb_regdes; // @[Rainbow.scala 39:23]
  assign WriteBack_io_memwb_aluresult = Memory_io_memwb_aluresult; // @[Rainbow.scala 39:23]
  assign WriteBack_io_memwb_link = Memory_io_memwb_link; // @[Rainbow.scala 39:23]
  assign WriteBack_io_memwb_auipc = Memory_io_memwb_auipc; // @[Rainbow.scala 39:23]
  assign WriteBack_io_memwb_csrData = Memory_io_memwb_csrData; // @[Rainbow.scala 39:23]
  assign WriteBack_io_memwb_loadData = Memory_io_memwb_loadData; // @[Rainbow.scala 39:23]
  always @(posedge clock) begin
    if (reset) begin // @[Rainbow.scala 77:27]
      CampactCnt <= 4'h1; // @[Rainbow.scala 77:27]
    end else if (io_ENABLE) begin // @[Rainbow.scala 79:18]
      if (CampactCnt == 4'h3) begin // @[Rainbow.scala 80:30]
        CampactCnt <= 4'h1; // @[Rainbow.scala 81:18]
      end else if (Execute_io_cancel) begin // @[Rainbow.scala 82:24]
        CampactCnt <= _CampactCnt_T_1; // @[Rainbow.scala 83:18]
      end
    end
    if (reset) begin // @[Rainbow.scala 105:34]
      LoadDataInCampact <= 64'h0; // @[Rainbow.scala 105:34]
    end else if (io_ENABLE) begin // @[Rainbow.scala 107:18]
      if (CampactCycleOne) begin // @[Rainbow.scala 108:26]
        LoadDataInCampact <= io_DataLoad_data; // @[Rainbow.scala 109:25]
      end else if (CampactCycleThree) begin // @[Rainbow.scala 110:34]
        LoadDataInCampact <= 64'h0; // @[Rainbow.scala 111:25]
      end
    end
    if (reset) begin // @[Reg.scala 27:20]
      LoadStoreBlocker_r <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      LoadStoreBlocker_r <= CampactCycleOne; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      LoadStoreBlocker_r_1 <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_ENABLE) begin // @[Reg.scala 28:19]
      LoadStoreBlocker_r_1 <= CampactCycleTwo; // @[Reg.scala 28:23]
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
  CampactCnt = _RAND_0[3:0];
  _RAND_1 = {2{`RANDOM}};
  LoadDataInCampact = _RAND_1[63:0];
  _RAND_2 = {1{`RANDOM}};
  LoadStoreBlocker_r = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  LoadStoreBlocker_r_1 = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210292_InterfaceAgent(
  input         clock,
  input         reset,
  input         io_TIME,
  output        io_ramhelperIO_en,
  output [63:0] io_ramhelperIO_rIdx,
  output [2:0]  io_ramhelperIO_rsize,
  input  [63:0] io_ramhelperIO_rdata,
  output [63:0] io_ramhelperIO_wIdx,
  output [63:0] io_ramhelperIO_wdata,
  output [7:0]  io_ramhelperIO_wmask,
  output        io_ramhelperIO_wen,
  output        io_mycoreIO_ENABLE,
  input  [63:0] io_mycoreIO_InstFetch_addr,
  output [31:0] io_mycoreIO_InstFetch_data,
  input         io_mycoreIO_DataLoad_en,
  input  [63:0] io_mycoreIO_DataLoad_addr,
  output [63:0] io_mycoreIO_DataLoad_data,
  input  [2:0]  io_mycoreIO_DataLoad_size,
  input         io_mycoreIO_DataStore_en,
  input  [63:0] io_mycoreIO_DataStore_addr,
  input  [63:0] io_mycoreIO_DataStore_data,
  input  [7:0]  io_mycoreIO_DataStore_mask
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg  ENABLE; // @[InterfaceAgent.scala 25:23]
  reg [31:0] INST; // @[InterfaceAgent.scala 26:23]
  reg  StateReg; // @[InterfaceAgent.scala 37:25]
  wire  _T = ~StateReg; // @[Conditional.scala 37:30]
  wire  _GEN_0 = io_TIME | StateReg; // @[InterfaceAgent.scala 42:20 InterfaceAgent.scala 43:19 InterfaceAgent.scala 37:25]
  wire  _GEN_1 = io_TIME | ENABLE; // @[InterfaceAgent.scala 42:20 InterfaceAgent.scala 44:19 InterfaceAgent.scala 25:23]
  wire [63:0] fetch_addr = io_mycoreIO_InstFetch_addr - 64'h0; // @[InterfaceAgent.scala 63:48]
  wire [63:0] load_addr = io_mycoreIO_DataLoad_addr - 64'h0; // @[InterfaceAgent.scala 64:47]
  wire  memory_en = io_mycoreIO_DataLoad_en | io_mycoreIO_DataStore_en; // @[InterfaceAgent.scala 67:43]
  assign io_ramhelperIO_en = _T | StateReg & memory_en; // @[InterfaceAgent.scala 70:47]
  assign io_ramhelperIO_rIdx = _T ? fetch_addr : load_addr; // @[InterfaceAgent.scala 71:31]
  assign io_ramhelperIO_rsize = StateReg & io_mycoreIO_DataLoad_en ? io_mycoreIO_DataLoad_size : 3'h2; // @[InterfaceAgent.scala 72:31]
  assign io_ramhelperIO_wIdx = io_mycoreIO_DataStore_addr - 64'h0; // @[InterfaceAgent.scala 65:48]
  assign io_ramhelperIO_wdata = io_mycoreIO_DataStore_data; // @[InterfaceAgent.scala 74:25]
  assign io_ramhelperIO_wmask = io_mycoreIO_DataStore_mask; // @[InterfaceAgent.scala 75:25]
  assign io_ramhelperIO_wen = StateReg & io_mycoreIO_DataStore_en; // @[InterfaceAgent.scala 76:46]
  assign io_mycoreIO_ENABLE = io_TIME & ENABLE; // @[InterfaceAgent.scala 29:37]
  assign io_mycoreIO_InstFetch_data = INST; // @[InterfaceAgent.scala 30:31]
  assign io_mycoreIO_DataLoad_data = io_ramhelperIO_rdata; // @[InterfaceAgent.scala 31:31]
  always @(posedge clock) begin
    if (reset) begin // @[InterfaceAgent.scala 25:23]
      ENABLE <= 1'h0; // @[InterfaceAgent.scala 25:23]
    end else if (_T) begin // @[Conditional.scala 40:58]
      ENABLE <= _GEN_1;
    end else if (StateReg) begin // @[Conditional.scala 39:67]
      if (io_TIME) begin // @[InterfaceAgent.scala 51:20]
        ENABLE <= 1'h0; // @[InterfaceAgent.scala 53:19]
      end
    end
    if (reset) begin // @[InterfaceAgent.scala 26:23]
      INST <= 32'h0; // @[InterfaceAgent.scala 26:23]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (io_TIME) begin // @[InterfaceAgent.scala 42:20]
        if (io_mycoreIO_InstFetch_addr[2]) begin // @[InterfaceAgent.scala 27:19]
          INST <= io_ramhelperIO_rdata[63:32];
        end else begin
          INST <= io_ramhelperIO_rdata[31:0];
        end
      end
    end else if (StateReg) begin // @[Conditional.scala 39:67]
      if (io_TIME) begin // @[InterfaceAgent.scala 51:20]
        INST <= 32'h13; // @[InterfaceAgent.scala 54:19]
      end
    end
    if (reset) begin // @[InterfaceAgent.scala 37:25]
      StateReg <= 1'h0; // @[InterfaceAgent.scala 37:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      StateReg <= _GEN_0;
    end else if (StateReg) begin // @[Conditional.scala 39:67]
      if (io_TIME) begin // @[InterfaceAgent.scala 51:20]
        StateReg <= 1'h0; // @[InterfaceAgent.scala 52:19]
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
  ENABLE = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  INST = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  StateReg = _RAND_2[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210292_AbstractCore(
  input         clock,
  input         reset,
  input         io_TIME,
  output        io_ramhelperIO_en,
  output [63:0] io_ramhelperIO_rIdx,
  output [2:0]  io_ramhelperIO_rsize,
  input  [63:0] io_ramhelperIO_rdata,
  output [63:0] io_ramhelperIO_wIdx,
  output [63:0] io_ramhelperIO_wdata,
  output [7:0]  io_ramhelperIO_wmask,
  output        io_ramhelperIO_wen
);
  wire  mycore_clock; // @[AbstractCore.scala 29:22]
  wire  mycore_reset; // @[AbstractCore.scala 29:22]
  wire  mycore_io_ENABLE; // @[AbstractCore.scala 29:22]
  wire [63:0] mycore_io_InstFetch_addr; // @[AbstractCore.scala 29:22]
  wire [31:0] mycore_io_InstFetch_data; // @[AbstractCore.scala 29:22]
  wire  mycore_io_DataLoad_en; // @[AbstractCore.scala 29:22]
  wire [63:0] mycore_io_DataLoad_addr; // @[AbstractCore.scala 29:22]
  wire [63:0] mycore_io_DataLoad_data; // @[AbstractCore.scala 29:22]
  wire [2:0] mycore_io_DataLoad_size; // @[AbstractCore.scala 29:22]
  wire  mycore_io_DataStore_en; // @[AbstractCore.scala 29:22]
  wire [63:0] mycore_io_DataStore_addr; // @[AbstractCore.scala 29:22]
  wire [63:0] mycore_io_DataStore_data; // @[AbstractCore.scala 29:22]
  wire [7:0] mycore_io_DataStore_mask; // @[AbstractCore.scala 29:22]
  wire  iagent_clock; // @[AbstractCore.scala 30:22]
  wire  iagent_reset; // @[AbstractCore.scala 30:22]
  wire  iagent_io_TIME; // @[AbstractCore.scala 30:22]
  wire  iagent_io_ramhelperIO_en; // @[AbstractCore.scala 30:22]
  wire [63:0] iagent_io_ramhelperIO_rIdx; // @[AbstractCore.scala 30:22]
  wire [2:0] iagent_io_ramhelperIO_rsize; // @[AbstractCore.scala 30:22]
  wire [63:0] iagent_io_ramhelperIO_rdata; // @[AbstractCore.scala 30:22]
  wire [63:0] iagent_io_ramhelperIO_wIdx; // @[AbstractCore.scala 30:22]
  wire [63:0] iagent_io_ramhelperIO_wdata; // @[AbstractCore.scala 30:22]
  wire [7:0] iagent_io_ramhelperIO_wmask; // @[AbstractCore.scala 30:22]
  wire  iagent_io_ramhelperIO_wen; // @[AbstractCore.scala 30:22]
  wire  iagent_io_mycoreIO_ENABLE; // @[AbstractCore.scala 30:22]
  wire [63:0] iagent_io_mycoreIO_InstFetch_addr; // @[AbstractCore.scala 30:22]
  wire [31:0] iagent_io_mycoreIO_InstFetch_data; // @[AbstractCore.scala 30:22]
  wire  iagent_io_mycoreIO_DataLoad_en; // @[AbstractCore.scala 30:22]
  wire [63:0] iagent_io_mycoreIO_DataLoad_addr; // @[AbstractCore.scala 30:22]
  wire [63:0] iagent_io_mycoreIO_DataLoad_data; // @[AbstractCore.scala 30:22]
  wire [2:0] iagent_io_mycoreIO_DataLoad_size; // @[AbstractCore.scala 30:22]
  wire  iagent_io_mycoreIO_DataStore_en; // @[AbstractCore.scala 30:22]
  wire [63:0] iagent_io_mycoreIO_DataStore_addr; // @[AbstractCore.scala 30:22]
  wire [63:0] iagent_io_mycoreIO_DataStore_data; // @[AbstractCore.scala 30:22]
  wire [7:0] iagent_io_mycoreIO_DataStore_mask; // @[AbstractCore.scala 30:22]
  ysyx_210292_Rainbow mycore ( // @[AbstractCore.scala 29:22]
    .clock(mycore_clock),
    .reset(mycore_reset),
    .io_ENABLE(mycore_io_ENABLE),
    .io_InstFetch_addr(mycore_io_InstFetch_addr),
    .io_InstFetch_data(mycore_io_InstFetch_data),
    .io_DataLoad_en(mycore_io_DataLoad_en),
    .io_DataLoad_addr(mycore_io_DataLoad_addr),
    .io_DataLoad_data(mycore_io_DataLoad_data),
    .io_DataLoad_size(mycore_io_DataLoad_size),
    .io_DataStore_en(mycore_io_DataStore_en),
    .io_DataStore_addr(mycore_io_DataStore_addr),
    .io_DataStore_data(mycore_io_DataStore_data),
    .io_DataStore_mask(mycore_io_DataStore_mask)
  );
  ysyx_210292_InterfaceAgent iagent ( // @[AbstractCore.scala 30:22]
    .clock(iagent_clock),
    .reset(iagent_reset),
    .io_TIME(iagent_io_TIME),
    .io_ramhelperIO_en(iagent_io_ramhelperIO_en),
    .io_ramhelperIO_rIdx(iagent_io_ramhelperIO_rIdx),
    .io_ramhelperIO_rsize(iagent_io_ramhelperIO_rsize),
    .io_ramhelperIO_rdata(iagent_io_ramhelperIO_rdata),
    .io_ramhelperIO_wIdx(iagent_io_ramhelperIO_wIdx),
    .io_ramhelperIO_wdata(iagent_io_ramhelperIO_wdata),
    .io_ramhelperIO_wmask(iagent_io_ramhelperIO_wmask),
    .io_ramhelperIO_wen(iagent_io_ramhelperIO_wen),
    .io_mycoreIO_ENABLE(iagent_io_mycoreIO_ENABLE),
    .io_mycoreIO_InstFetch_addr(iagent_io_mycoreIO_InstFetch_addr),
    .io_mycoreIO_InstFetch_data(iagent_io_mycoreIO_InstFetch_data),
    .io_mycoreIO_DataLoad_en(iagent_io_mycoreIO_DataLoad_en),
    .io_mycoreIO_DataLoad_addr(iagent_io_mycoreIO_DataLoad_addr),
    .io_mycoreIO_DataLoad_data(iagent_io_mycoreIO_DataLoad_data),
    .io_mycoreIO_DataLoad_size(iagent_io_mycoreIO_DataLoad_size),
    .io_mycoreIO_DataStore_en(iagent_io_mycoreIO_DataStore_en),
    .io_mycoreIO_DataStore_addr(iagent_io_mycoreIO_DataStore_addr),
    .io_mycoreIO_DataStore_data(iagent_io_mycoreIO_DataStore_data),
    .io_mycoreIO_DataStore_mask(iagent_io_mycoreIO_DataStore_mask)
  );
  assign io_ramhelperIO_en = iagent_io_ramhelperIO_en; // @[AbstractCore.scala 36:25]
  assign io_ramhelperIO_rIdx = iagent_io_ramhelperIO_rIdx; // @[AbstractCore.scala 36:25]
  assign io_ramhelperIO_rsize = iagent_io_ramhelperIO_rsize; // @[AbstractCore.scala 36:25]
  assign io_ramhelperIO_wIdx = iagent_io_ramhelperIO_wIdx; // @[AbstractCore.scala 36:25]
  assign io_ramhelperIO_wdata = iagent_io_ramhelperIO_wdata; // @[AbstractCore.scala 36:25]
  assign io_ramhelperIO_wmask = iagent_io_ramhelperIO_wmask; // @[AbstractCore.scala 36:25]
  assign io_ramhelperIO_wen = iagent_io_ramhelperIO_wen; // @[AbstractCore.scala 36:25]
  assign mycore_clock = clock;
  assign mycore_reset = reset;
  assign mycore_io_ENABLE = iagent_io_mycoreIO_ENABLE; // @[AbstractCore.scala 32:20]
  assign mycore_io_InstFetch_data = iagent_io_mycoreIO_InstFetch_data; // @[AbstractCore.scala 33:23]
  assign mycore_io_DataLoad_data = iagent_io_mycoreIO_DataLoad_data; // @[AbstractCore.scala 34:22]
  assign iagent_clock = clock;
  assign iagent_reset = reset;
  assign iagent_io_TIME = io_TIME; // @[AbstractCore.scala 45:18]
  assign iagent_io_ramhelperIO_rdata = io_ramhelperIO_rdata; // @[AbstractCore.scala 36:25]
  assign iagent_io_mycoreIO_InstFetch_addr = mycore_io_InstFetch_addr; // @[AbstractCore.scala 33:23]
  assign iagent_io_mycoreIO_DataLoad_en = mycore_io_DataLoad_en; // @[AbstractCore.scala 34:22]
  assign iagent_io_mycoreIO_DataLoad_addr = mycore_io_DataLoad_addr; // @[AbstractCore.scala 34:22]
  assign iagent_io_mycoreIO_DataLoad_size = mycore_io_DataLoad_size; // @[AbstractCore.scala 34:22]
  assign iagent_io_mycoreIO_DataStore_en = mycore_io_DataStore_en; // @[AbstractCore.scala 35:23]
  assign iagent_io_mycoreIO_DataStore_addr = mycore_io_DataStore_addr; // @[AbstractCore.scala 35:23]
  assign iagent_io_mycoreIO_DataStore_data = mycore_io_DataStore_data; // @[AbstractCore.scala 35:23]
  assign iagent_io_mycoreIO_DataStore_mask = mycore_io_DataStore_mask; // @[AbstractCore.scala 35:23]
endmodule
module ysyx_210292_AXICare(
  input         clock,
  input         reset,
  output        io_TIME,
  input         io_ramhelperIO_en,
  input  [63:0] io_ramhelperIO_rIdx,
  input  [2:0]  io_ramhelperIO_rsize,
  output [63:0] io_ramhelperIO_rdata,
  input  [63:0] io_ramhelperIO_wIdx,
  input  [63:0] io_ramhelperIO_wdata,
  input  [7:0]  io_ramhelperIO_wmask,
  input         io_ramhelperIO_wen,
  output        io_MYAXI_AWVALID,
  input         io_MYAXI_AWREADY,
  output [2:0]  io_MYAXI_AWSIZE,
  output [63:0] io_MYAXI_AWADDR,
  output        io_MYAXI_WVALID,
  input         io_MYAXI_WREADY,
  output [7:0]  io_MYAXI_WSTRB,
  output [63:0] io_MYAXI_WDATA,
  input         io_MYAXI_BVALID,
  output        io_MYAXI_BREADY,
  output        io_MYAXI_ARVALID,
  input         io_MYAXI_ARREADY,
  output [2:0]  io_MYAXI_ARSIZE,
  output [63:0] io_MYAXI_ARADDR,
  input         io_MYAXI_RVALID,
  output        io_MYAXI_RREADY,
  input  [63:0] io_MYAXI_RDATA
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [63:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
`endif // RANDOMIZE_REG_INIT
  reg  TIME; // @[AXICare.scala 20:21]
  reg  finished; // @[AXICare.scala 202:25]
  reg  en; // @[AXICare.scala 204:19]
  reg [63:0] rIdx; // @[AXICare.scala 205:21]
  reg [63:0] rdata; // @[AXICare.scala 206:22]
  reg [2:0] SoC_arsize; // @[AXICare.scala 207:22]
  reg [63:0] wIdx; // @[AXICare.scala 208:21]
  reg [63:0] wdata; // @[AXICare.scala 209:22]
  reg [7:0] WSTRB; // @[AXICare.scala 210:22]
  reg  wen; // @[AXICare.scala 211:20]
  wire  AWhandshake = io_MYAXI_AWVALID & io_MYAXI_AWREADY; // @[AXICare.scala 25:38]
  wire  Whandshake = io_MYAXI_WVALID & io_MYAXI_WREADY; // @[AXICare.scala 26:38]
  wire  Bhandshake = io_MYAXI_BVALID & io_MYAXI_BREADY; // @[AXICare.scala 27:38]
  wire  Rhandshake = io_MYAXI_RVALID & io_MYAXI_RREADY; // @[AXICare.scala 29:38]
  reg [2:0] StateReg; // @[AXICare.scala 35:25]
  wire  _T = 3'h0 == StateReg; // @[Conditional.scala 37:30]
  wire  _T_1 = 3'h1 == StateReg; // @[Conditional.scala 37:30]
  wire [2:0] _GEN_0 = en ? 3'h6 : 3'h1; // @[AXICare.scala 56:35 AXICare.scala 57:26 AXICare.scala 60:26]
  wire  _GEN_1 = en ? finished : 1'h1; // @[AXICare.scala 56:35 AXICare.scala 202:25 AXICare.scala 59:36]
  wire [2:0] _GEN_2 = wen ? 3'h3 : _GEN_0; // @[AXICare.scala 54:36 AXICare.scala 55:26]
  wire  _GEN_3 = wen ? finished : _GEN_1; // @[AXICare.scala 54:36 AXICare.scala 202:25]
  wire  _GEN_4 = finished | TIME; // @[AXICare.scala 51:35 AXICare.scala 52:22 AXICare.scala 20:21]
  wire  _T_2 = 3'h2 == StateReg; // @[Conditional.scala 37:30]
  wire  _T_3 = 3'h6 == StateReg; // @[Conditional.scala 37:30]
  wire [2:0] _GEN_7 = io_MYAXI_ARREADY ? 3'h7 : StateReg; // @[AXICare.scala 68:33 AXICare.scala 69:22 AXICare.scala 35:25]
  wire  _T_4 = 3'h7 == StateReg; // @[Conditional.scala 37:30]
  wire [63:0] _GEN_8 = Rhandshake ? io_MYAXI_RDATA : rdata; // @[AXICare.scala 73:27 AXICare.scala 74:29 AXICare.scala 206:22]
  wire  _GEN_9 = Rhandshake | finished; // @[AXICare.scala 73:27 AXICare.scala 75:32 AXICare.scala 202:25]
  wire [2:0] _GEN_10 = Rhandshake ? 3'h1 : StateReg; // @[AXICare.scala 73:27 AXICare.scala 76:22 AXICare.scala 35:25]
  wire  _T_5 = 3'h3 == StateReg; // @[Conditional.scala 37:30]
  wire [2:0] _GEN_11 = AWhandshake ? 3'h4 : StateReg; // @[AXICare.scala 80:28 AXICare.scala 81:26 AXICare.scala 35:25]
  wire  _T_6 = 3'h4 == StateReg; // @[Conditional.scala 37:30]
  wire [2:0] _GEN_12 = Whandshake ? 3'h5 : StateReg; // @[AXICare.scala 85:27 AXICare.scala 86:26 AXICare.scala 35:25]
  wire  _T_7 = 3'h5 == StateReg; // @[Conditional.scala 37:30]
  wire  _GEN_13 = Bhandshake | finished; // @[AXICare.scala 90:27 AXICare.scala 91:36 AXICare.scala 202:25]
  wire [2:0] _GEN_14 = Bhandshake ? 3'h1 : StateReg; // @[AXICare.scala 90:27 AXICare.scala 92:26 AXICare.scala 35:25]
  wire  _GEN_15 = _T_7 ? _GEN_13 : finished; // @[Conditional.scala 39:67 AXICare.scala 202:25]
  wire [2:0] _GEN_16 = _T_7 ? _GEN_14 : StateReg; // @[Conditional.scala 39:67 AXICare.scala 35:25]
  wire [2:0] _GEN_17 = _T_6 ? _GEN_12 : _GEN_16; // @[Conditional.scala 39:67]
  wire  _GEN_18 = _T_6 ? finished : _GEN_15; // @[Conditional.scala 39:67 AXICare.scala 202:25]
  wire [2:0] _GEN_19 = _T_5 ? _GEN_11 : _GEN_17; // @[Conditional.scala 39:67]
  wire  _GEN_20 = _T_5 ? finished : _GEN_18; // @[Conditional.scala 39:67 AXICare.scala 202:25]
  wire [63:0] _GEN_21 = _T_4 ? _GEN_8 : rdata; // @[Conditional.scala 39:67 AXICare.scala 206:22]
  wire  _GEN_22 = _T_4 ? _GEN_9 : _GEN_20; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_23 = _T_4 ? _GEN_10 : _GEN_19; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_24 = _T_3 ? _GEN_7 : _GEN_23; // @[Conditional.scala 39:67]
  wire [63:0] _GEN_25 = _T_3 ? rdata : _GEN_21; // @[Conditional.scala 39:67 AXICare.scala 206:22]
  wire  _GEN_26 = _T_3 ? finished : _GEN_22; // @[Conditional.scala 39:67 AXICare.scala 202:25]
  wire  _BitOneCnt_T_3 = WSTRB[7] + WSTRB[6]; // @[AXICare.scala 98:27]
  wire  _BitOneCnt_T_6 = _BitOneCnt_T_3 + WSTRB[5]; // @[AXICare.scala 98:37]
  wire  _BitOneCnt_T_9 = _BitOneCnt_T_6 + WSTRB[4]; // @[AXICare.scala 98:47]
  wire  _BitOneCnt_T_12 = _BitOneCnt_T_9 + WSTRB[3]; // @[AXICare.scala 98:57]
  wire  _BitOneCnt_T_15 = _BitOneCnt_T_12 + WSTRB[2]; // @[AXICare.scala 98:67]
  wire  _BitOneCnt_T_18 = _BitOneCnt_T_15 + WSTRB[1]; // @[AXICare.scala 98:77]
  wire  BitOneCnt = _BitOneCnt_T_18 + WSTRB[0]; // @[AXICare.scala 98:87]
  wire [2:0] _GEN_85 = {{2'd0}, BitOneCnt}; // @[Mux.scala 80:60]
  wire [1:0] _SoC_awsize_T_1 = 3'h4 == _GEN_85 ? 2'h2 : 2'h3; // @[Mux.scala 80:57]
  wire [1:0] _GEN_86 = {{1'd0}, BitOneCnt}; // @[Mux.scala 80:60]
  wire [1:0] _SoC_awsize_T_3 = 2'h2 == _GEN_86 ? 2'h1 : _SoC_awsize_T_1; // @[Mux.scala 80:57]
  wire [1:0] SoC_awsize = BitOneCnt ? 2'h0 : _SoC_awsize_T_3; // @[Mux.scala 80:57]
  wire  _T_9 = StateReg == 3'h7; // @[AXICare.scala 127:22]
  wire  _T_10 = StateReg == 3'h3; // @[AXICare.scala 141:22]
  wire  _T_11 = StateReg == 3'h4; // @[AXICare.scala 155:22]
  wire  _T_12 = StateReg == 3'h5; // @[AXICare.scala 169:22]
  wire [7:0] _GEN_49 = StateReg == 3'h4 ? WSTRB : 8'h0; // @[AXICare.scala 155:33 AXICare.scala 158:32]
  wire [63:0] _GEN_50 = StateReg == 3'h4 ? wdata : 64'h0; // @[AXICare.scala 155:33 AXICare.scala 159:32]
  wire [1:0] _GEN_52 = StateReg == 3'h4 ? SoC_awsize : 2'h0; // @[AXICare.scala 155:33 AXICare.scala 162:33]
  wire [63:0] _GEN_53 = StateReg == 3'h4 ? wIdx : 64'h0; // @[AXICare.scala 155:33 AXICare.scala 163:33]
  wire  _GEN_54 = StateReg == 3'h4 ? 1'h0 : _T_12; // @[AXICare.scala 155:33 AXICare.scala 164:33]
  wire [1:0] _GEN_56 = StateReg == 3'h3 ? SoC_awsize : _GEN_52; // @[AXICare.scala 141:34 AXICare.scala 144:33]
  wire [63:0] _GEN_57 = StateReg == 3'h3 ? wIdx : _GEN_53; // @[AXICare.scala 141:34 AXICare.scala 145:33]
  wire  _GEN_58 = StateReg == 3'h3 ? 1'h0 : _T_11; // @[AXICare.scala 141:34 AXICare.scala 147:33]
  wire [7:0] _GEN_59 = StateReg == 3'h3 ? 8'h0 : _GEN_49; // @[AXICare.scala 141:34 AXICare.scala 148:32]
  wire [63:0] _GEN_60 = StateReg == 3'h3 ? 64'h0 : _GEN_50; // @[AXICare.scala 141:34 AXICare.scala 149:32]
  wire  _GEN_61 = StateReg == 3'h3 ? 1'h0 : _GEN_54; // @[AXICare.scala 141:34 AXICare.scala 150:33]
  wire  _GEN_64 = StateReg == 3'h7 ? 1'h0 : _T_10; // @[AXICare.scala 127:33 AXICare.scala 131:26]
  wire [1:0] _GEN_65 = StateReg == 3'h7 ? 2'h0 : _GEN_56; // @[AXICare.scala 127:33 AXICare.scala 132:33]
  wire [63:0] _GEN_66 = StateReg == 3'h7 ? 64'h0 : _GEN_57; // @[AXICare.scala 127:33 AXICare.scala 133:33]
  wire  _GEN_67 = StateReg == 3'h7 ? 1'h0 : _GEN_58; // @[AXICare.scala 127:33 AXICare.scala 134:33]
  wire [7:0] _GEN_68 = StateReg == 3'h7 ? 8'h0 : _GEN_59; // @[AXICare.scala 127:33 AXICare.scala 135:32]
  wire [63:0] _GEN_69 = StateReg == 3'h7 ? 64'h0 : _GEN_60; // @[AXICare.scala 127:33 AXICare.scala 136:32]
  wire  _GEN_70 = StateReg == 3'h7 ? 1'h0 : _GEN_61; // @[AXICare.scala 127:33 AXICare.scala 137:33]
  wire [2:0] _GEN_72 = StateReg == 3'h7 ? SoC_arsize : 3'h0; // @[AXICare.scala 127:33 AXICare.scala 139:33]
  wire [63:0] _GEN_73 = StateReg == 3'h7 ? rIdx : 64'h0; // @[AXICare.scala 127:33 AXICare.scala 140:33]
  wire [1:0] _GEN_78 = StateReg == 3'h6 ? 2'h0 : _GEN_65; // @[AXICare.scala 113:28 AXICare.scala 120:33]
  assign io_TIME = reset ? 1'h0 : TIME; // @[AXICare.scala 21:17]
  assign io_ramhelperIO_rdata = rdata; // @[AXICare.scala 197:24]
  assign io_MYAXI_AWVALID = StateReg == 3'h6 ? 1'h0 : _GEN_64; // @[AXICare.scala 113:28 AXICare.scala 119:26]
  assign io_MYAXI_AWSIZE = {{1'd0}, _GEN_78}; // @[AXICare.scala 113:28 AXICare.scala 120:33]
  assign io_MYAXI_AWADDR = StateReg == 3'h6 ? 64'h0 : _GEN_66; // @[AXICare.scala 113:28 AXICare.scala 121:33]
  assign io_MYAXI_WVALID = StateReg == 3'h6 ? 1'h0 : _GEN_67; // @[AXICare.scala 113:28 AXICare.scala 122:33]
  assign io_MYAXI_WSTRB = StateReg == 3'h6 ? 8'h0 : _GEN_68; // @[AXICare.scala 113:28 AXICare.scala 123:32]
  assign io_MYAXI_WDATA = StateReg == 3'h6 ? 64'h0 : _GEN_69; // @[AXICare.scala 113:28 AXICare.scala 124:32]
  assign io_MYAXI_BREADY = StateReg == 3'h6 ? 1'h0 : _GEN_70; // @[AXICare.scala 113:28 AXICare.scala 125:33]
  assign io_MYAXI_ARVALID = StateReg == 3'h6; // @[AXICare.scala 113:16]
  assign io_MYAXI_ARSIZE = StateReg == 3'h6 ? SoC_arsize : _GEN_72; // @[AXICare.scala 113:28 AXICare.scala 116:33]
  assign io_MYAXI_ARADDR = StateReg == 3'h6 ? rIdx : _GEN_73; // @[AXICare.scala 113:28 AXICare.scala 117:33]
  assign io_MYAXI_RREADY = StateReg == 3'h6 ? 1'h0 : _T_9; // @[AXICare.scala 113:28 AXICare.scala 126:33]
  always @(posedge clock) begin
    if (reset) begin // @[AXICare.scala 20:21]
      TIME <= 1'h0; // @[AXICare.scala 20:21]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (_T_1) begin // @[Conditional.scala 39:67]
        TIME <= _GEN_4;
      end else if (_T_2) begin // @[Conditional.scala 39:67]
        TIME <= 1'h0; // @[AXICare.scala 64:16]
      end
    end
    if (reset) begin // @[AXICare.scala 202:25]
      finished <= 1'h0; // @[AXICare.scala 202:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      finished <= 1'h0; // @[AXICare.scala 39:30]
    end else if (_T_1) begin // @[Conditional.scala 39:67]
      if (!(finished)) begin // @[AXICare.scala 51:35]
        finished <= _GEN_3;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      finished <= _GEN_26;
    end
    if (reset) begin // @[AXICare.scala 204:19]
      en <= 1'h0; // @[AXICare.scala 204:19]
    end else if (_T) begin // @[Conditional.scala 40:58]
      en <= io_ramhelperIO_en; // @[AXICare.scala 40:24]
    end
    if (reset) begin // @[AXICare.scala 205:21]
      rIdx <= 64'h0; // @[AXICare.scala 205:21]
    end else if (_T) begin // @[Conditional.scala 40:58]
      rIdx <= io_ramhelperIO_rIdx; // @[AXICare.scala 41:26]
    end
    if (reset) begin // @[AXICare.scala 206:22]
      rdata <= 64'h0; // @[AXICare.scala 206:22]
    end else if (_T) begin // @[Conditional.scala 40:58]
      rdata <= io_ramhelperIO_rdata; // @[AXICare.scala 42:27]
    end else if (!(_T_1)) begin // @[Conditional.scala 39:67]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        rdata <= _GEN_25;
      end
    end
    if (reset) begin // @[AXICare.scala 207:22]
      SoC_arsize <= 3'h0; // @[AXICare.scala 207:22]
    end else if (_T) begin // @[Conditional.scala 40:58]
      SoC_arsize <= io_ramhelperIO_rsize; // @[AXICare.scala 43:27]
    end
    if (reset) begin // @[AXICare.scala 208:21]
      wIdx <= 64'h0; // @[AXICare.scala 208:21]
    end else if (_T) begin // @[Conditional.scala 40:58]
      wIdx <= io_ramhelperIO_wIdx; // @[AXICare.scala 44:26]
    end
    if (reset) begin // @[AXICare.scala 209:22]
      wdata <= 64'h0; // @[AXICare.scala 209:22]
    end else if (_T) begin // @[Conditional.scala 40:58]
      wdata <= io_ramhelperIO_wdata; // @[AXICare.scala 45:27]
    end
    if (reset) begin // @[AXICare.scala 210:22]
      WSTRB <= 8'h0; // @[AXICare.scala 210:22]
    end else if (_T) begin // @[Conditional.scala 40:58]
      WSTRB <= io_ramhelperIO_wmask; // @[AXICare.scala 46:27]
    end
    if (reset) begin // @[AXICare.scala 211:20]
      wen <= 1'h0; // @[AXICare.scala 211:20]
    end else if (_T) begin // @[Conditional.scala 40:58]
      wen <= io_ramhelperIO_wen; // @[AXICare.scala 47:25]
    end
    if (reset) begin // @[AXICare.scala 35:25]
      StateReg <= 3'h0; // @[AXICare.scala 35:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      StateReg <= 3'h1; // @[AXICare.scala 48:20]
    end else if (_T_1) begin // @[Conditional.scala 39:67]
      if (finished) begin // @[AXICare.scala 51:35]
        StateReg <= 3'h2; // @[AXICare.scala 53:26]
      end else begin
        StateReg <= _GEN_2;
      end
    end else if (_T_2) begin // @[Conditional.scala 39:67]
      StateReg <= 3'h0; // @[AXICare.scala 65:20]
    end else begin
      StateReg <= _GEN_24;
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
  TIME = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  finished = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  en = _RAND_2[0:0];
  _RAND_3 = {2{`RANDOM}};
  rIdx = _RAND_3[63:0];
  _RAND_4 = {2{`RANDOM}};
  rdata = _RAND_4[63:0];
  _RAND_5 = {1{`RANDOM}};
  SoC_arsize = _RAND_5[2:0];
  _RAND_6 = {2{`RANDOM}};
  wIdx = _RAND_6[63:0];
  _RAND_7 = {2{`RANDOM}};
  wdata = _RAND_7[63:0];
  _RAND_8 = {1{`RANDOM}};
  WSTRB = _RAND_8[7:0];
  _RAND_9 = {1{`RANDOM}};
  wen = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  StateReg = _RAND_10[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210292(
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
  wire  AbstractCore_clock; // @[SocTop.scala 15:28]
  wire  AbstractCore_reset; // @[SocTop.scala 15:28]
  wire  AbstractCore_io_TIME; // @[SocTop.scala 15:28]
  wire  AbstractCore_io_ramhelperIO_en; // @[SocTop.scala 15:28]
  wire [63:0] AbstractCore_io_ramhelperIO_rIdx; // @[SocTop.scala 15:28]
  wire [2:0] AbstractCore_io_ramhelperIO_rsize; // @[SocTop.scala 15:28]
  wire [63:0] AbstractCore_io_ramhelperIO_rdata; // @[SocTop.scala 15:28]
  wire [63:0] AbstractCore_io_ramhelperIO_wIdx; // @[SocTop.scala 15:28]
  wire [63:0] AbstractCore_io_ramhelperIO_wdata; // @[SocTop.scala 15:28]
  wire [7:0] AbstractCore_io_ramhelperIO_wmask; // @[SocTop.scala 15:28]
  wire  AbstractCore_io_ramhelperIO_wen; // @[SocTop.scala 15:28]
  wire  AXICare_clock; // @[SocTop.scala 16:23]
  wire  AXICare_reset; // @[SocTop.scala 16:23]
  wire  AXICare_io_TIME; // @[SocTop.scala 16:23]
  wire  AXICare_io_ramhelperIO_en; // @[SocTop.scala 16:23]
  wire [63:0] AXICare_io_ramhelperIO_rIdx; // @[SocTop.scala 16:23]
  wire [2:0] AXICare_io_ramhelperIO_rsize; // @[SocTop.scala 16:23]
  wire [63:0] AXICare_io_ramhelperIO_rdata; // @[SocTop.scala 16:23]
  wire [63:0] AXICare_io_ramhelperIO_wIdx; // @[SocTop.scala 16:23]
  wire [63:0] AXICare_io_ramhelperIO_wdata; // @[SocTop.scala 16:23]
  wire [7:0] AXICare_io_ramhelperIO_wmask; // @[SocTop.scala 16:23]
  wire  AXICare_io_ramhelperIO_wen; // @[SocTop.scala 16:23]
  wire  AXICare_io_MYAXI_AWVALID; // @[SocTop.scala 16:23]
  wire  AXICare_io_MYAXI_AWREADY; // @[SocTop.scala 16:23]
  wire [2:0] AXICare_io_MYAXI_AWSIZE; // @[SocTop.scala 16:23]
  wire [63:0] AXICare_io_MYAXI_AWADDR; // @[SocTop.scala 16:23]
  wire  AXICare_io_MYAXI_WVALID; // @[SocTop.scala 16:23]
  wire  AXICare_io_MYAXI_WREADY; // @[SocTop.scala 16:23]
  wire [7:0] AXICare_io_MYAXI_WSTRB; // @[SocTop.scala 16:23]
  wire [63:0] AXICare_io_MYAXI_WDATA; // @[SocTop.scala 16:23]
  wire  AXICare_io_MYAXI_BVALID; // @[SocTop.scala 16:23]
  wire  AXICare_io_MYAXI_BREADY; // @[SocTop.scala 16:23]
  wire  AXICare_io_MYAXI_ARVALID; // @[SocTop.scala 16:23]
  wire  AXICare_io_MYAXI_ARREADY; // @[SocTop.scala 16:23]
  wire [2:0] AXICare_io_MYAXI_ARSIZE; // @[SocTop.scala 16:23]
  wire [63:0] AXICare_io_MYAXI_ARADDR; // @[SocTop.scala 16:23]
  wire  AXICare_io_MYAXI_RVALID; // @[SocTop.scala 16:23]
  wire  AXICare_io_MYAXI_RREADY; // @[SocTop.scala 16:23]
  wire [63:0] AXICare_io_MYAXI_RDATA; // @[SocTop.scala 16:23]
  ysyx_210292_AbstractCore AbstractCore ( // @[SocTop.scala 15:28]
    .clock(AbstractCore_clock),
    .reset(AbstractCore_reset),
    .io_TIME(AbstractCore_io_TIME),
    .io_ramhelperIO_en(AbstractCore_io_ramhelperIO_en),
    .io_ramhelperIO_rIdx(AbstractCore_io_ramhelperIO_rIdx),
    .io_ramhelperIO_rsize(AbstractCore_io_ramhelperIO_rsize),
    .io_ramhelperIO_rdata(AbstractCore_io_ramhelperIO_rdata),
    .io_ramhelperIO_wIdx(AbstractCore_io_ramhelperIO_wIdx),
    .io_ramhelperIO_wdata(AbstractCore_io_ramhelperIO_wdata),
    .io_ramhelperIO_wmask(AbstractCore_io_ramhelperIO_wmask),
    .io_ramhelperIO_wen(AbstractCore_io_ramhelperIO_wen)
  );
  ysyx_210292_AXICare AXICare ( // @[SocTop.scala 16:23]
    .clock(AXICare_clock),
    .reset(AXICare_reset),
    .io_TIME(AXICare_io_TIME),
    .io_ramhelperIO_en(AXICare_io_ramhelperIO_en),
    .io_ramhelperIO_rIdx(AXICare_io_ramhelperIO_rIdx),
    .io_ramhelperIO_rsize(AXICare_io_ramhelperIO_rsize),
    .io_ramhelperIO_rdata(AXICare_io_ramhelperIO_rdata),
    .io_ramhelperIO_wIdx(AXICare_io_ramhelperIO_wIdx),
    .io_ramhelperIO_wdata(AXICare_io_ramhelperIO_wdata),
    .io_ramhelperIO_wmask(AXICare_io_ramhelperIO_wmask),
    .io_ramhelperIO_wen(AXICare_io_ramhelperIO_wen),
    .io_MYAXI_AWVALID(AXICare_io_MYAXI_AWVALID),
    .io_MYAXI_AWREADY(AXICare_io_MYAXI_AWREADY),
    .io_MYAXI_AWSIZE(AXICare_io_MYAXI_AWSIZE),
    .io_MYAXI_AWADDR(AXICare_io_MYAXI_AWADDR),
    .io_MYAXI_WVALID(AXICare_io_MYAXI_WVALID),
    .io_MYAXI_WREADY(AXICare_io_MYAXI_WREADY),
    .io_MYAXI_WSTRB(AXICare_io_MYAXI_WSTRB),
    .io_MYAXI_WDATA(AXICare_io_MYAXI_WDATA),
    .io_MYAXI_BVALID(AXICare_io_MYAXI_BVALID),
    .io_MYAXI_BREADY(AXICare_io_MYAXI_BREADY),
    .io_MYAXI_ARVALID(AXICare_io_MYAXI_ARVALID),
    .io_MYAXI_ARREADY(AXICare_io_MYAXI_ARREADY),
    .io_MYAXI_ARSIZE(AXICare_io_MYAXI_ARSIZE),
    .io_MYAXI_ARADDR(AXICare_io_MYAXI_ARADDR),
    .io_MYAXI_RVALID(AXICare_io_MYAXI_RVALID),
    .io_MYAXI_RREADY(AXICare_io_MYAXI_RREADY),
    .io_MYAXI_RDATA(AXICare_io_MYAXI_RDATA)
  );
  assign io_master_awvalid = AXICare_io_MYAXI_AWVALID; // @[SocTop.scala 24:21]
  assign io_master_awaddr = AXICare_io_MYAXI_AWADDR[31:0]; // @[SocTop.scala 25:46]
  assign io_master_awid = 4'h0; // @[SocTop.scala 26:18]
  assign io_master_awlen = 8'h0; // @[SocTop.scala 27:19]
  assign io_master_awsize = AXICare_io_MYAXI_AWSIZE; // @[SocTop.scala 28:20]
  assign io_master_awburst = 2'h1; // @[SocTop.scala 29:21]
  assign io_master_wvalid = AXICare_io_MYAXI_WVALID; // @[SocTop.scala 32:20]
  assign io_master_wdata = AXICare_io_MYAXI_WDATA; // @[SocTop.scala 33:19]
  assign io_master_wstrb = AXICare_io_MYAXI_WSTRB; // @[SocTop.scala 34:19]
  assign io_master_wlast = 1'h1; // @[SocTop.scala 35:19]
  assign io_master_bready = AXICare_io_MYAXI_BREADY; // @[SocTop.scala 37:20]
  assign io_master_arvalid = AXICare_io_MYAXI_ARVALID; // @[SocTop.scala 43:21]
  assign io_master_araddr = AXICare_io_MYAXI_ARADDR[31:0]; // @[SocTop.scala 44:46]
  assign io_master_arid = 4'h0; // @[SocTop.scala 45:18]
  assign io_master_arlen = 8'h0; // @[SocTop.scala 46:19]
  assign io_master_arsize = AXICare_io_MYAXI_ARSIZE; // @[SocTop.scala 47:20]
  assign io_master_arburst = 2'h1; // @[SocTop.scala 48:21]
  assign io_master_rready = AXICare_io_MYAXI_RREADY; // @[SocTop.scala 50:20]
  assign io_slave_awready = 1'h0; // @[SocTop.scala 57:20]
  assign io_slave_wready = 1'h0; // @[SocTop.scala 58:19]
  assign io_slave_bvalid = 1'h0; // @[SocTop.scala 59:19]
  assign io_slave_bresp = 2'h0; // @[SocTop.scala 60:18]
  assign io_slave_bid = 4'h0; // @[SocTop.scala 61:16]
  assign io_slave_arready = 1'h0; // @[SocTop.scala 62:20]
  assign io_slave_rvalid = 1'h0; // @[SocTop.scala 63:19]
  assign io_slave_rresp = 2'h0; // @[SocTop.scala 64:18]
  assign io_slave_rdata = 64'h0; // @[SocTop.scala 65:18]
  assign io_slave_rlast = 1'h0; // @[SocTop.scala 66:18]
  assign io_slave_rid = 4'h0; // @[SocTop.scala 67:16]
  assign AbstractCore_clock = clock;
  assign AbstractCore_reset = reset;
  assign AbstractCore_io_TIME = AXICare_io_TIME; // @[SocTop.scala 17:24]
  assign AbstractCore_io_ramhelperIO_rdata = AXICare_io_ramhelperIO_rdata; // @[SocTop.scala 18:31]
  assign AXICare_clock = clock;
  assign AXICare_reset = reset;
  assign AXICare_io_ramhelperIO_en = AbstractCore_io_ramhelperIO_en; // @[SocTop.scala 18:31]
  assign AXICare_io_ramhelperIO_rIdx = AbstractCore_io_ramhelperIO_rIdx; // @[SocTop.scala 18:31]
  assign AXICare_io_ramhelperIO_rsize = AbstractCore_io_ramhelperIO_rsize; // @[SocTop.scala 18:31]
  assign AXICare_io_ramhelperIO_wIdx = AbstractCore_io_ramhelperIO_wIdx; // @[SocTop.scala 18:31]
  assign AXICare_io_ramhelperIO_wdata = AbstractCore_io_ramhelperIO_wdata; // @[SocTop.scala 18:31]
  assign AXICare_io_ramhelperIO_wmask = AbstractCore_io_ramhelperIO_wmask; // @[SocTop.scala 18:31]
  assign AXICare_io_ramhelperIO_wen = AbstractCore_io_ramhelperIO_wen; // @[SocTop.scala 18:31]
  assign AXICare_io_MYAXI_AWREADY = io_master_awready; // @[SocTop.scala 23:21]
  assign AXICare_io_MYAXI_WREADY = io_master_wready; // @[SocTop.scala 31:20]
  assign AXICare_io_MYAXI_BVALID = io_master_bvalid; // @[SocTop.scala 38:20]
  assign AXICare_io_MYAXI_ARREADY = io_master_arready; // @[SocTop.scala 42:21]
  assign AXICare_io_MYAXI_RVALID = io_master_rvalid; // @[SocTop.scala 51:20]
  assign AXICare_io_MYAXI_RDATA = io_master_rdata; // @[SocTop.scala 52:19]
endmodule
