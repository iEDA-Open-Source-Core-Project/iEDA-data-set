module ysyx_210232_IFU(
  input         clock,
  input         reset,
  input         io_jump,
  input  [31:0] io_jumpPC,
  input         io_intr,
  output        io_prejump,
  output [31:0] io_pc,
  output        io_fetched,
  input         io_stall,
  output [31:0] io_inst,
  input         io_imem_req_ready,
  output        io_imem_req_valid,
  output [31:0] io_imem_req_bits_addr,
  output        io_imem_resp_ready,
  input         io_imem_resp_valid,
  input  [31:0] io_imem_resp_bits_rdata,
  input         io_imem_resp_bits_resp,
  input  [3:0]  io_imem_resp_bits_id,
  input         LDDone,
  output        If_Ld_fail_0
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
`endif // RANDOMIZE_REG_INIT
  reg [31:0] PC; // @[IFU.scala 19:31]
  reg  expt; // @[IFU.scala 20:31]
  reg  intr; // @[IFU.scala 21:31]
  reg  respready; // @[IFU.scala 22:31]
  reg  fetched; // @[IFU.scala 23:31]
  reg  lsu_wait; // @[IFU.scala 26:31]
  wire  l_inst = io_inst[6:0] == 7'h3 & fetched; // @[IFU.scala 31:49]
  wire  s_inst = io_inst[6:0] == 7'h23 & fetched; // @[IFU.scala 32:49]
  wire  b_inst = io_inst[6:0] == 7'h63; // @[IFU.scala 33:30]
  wire  j_inst = io_inst[6:0] == 7'h6f; // @[IFU.scala 34:30]
  wire  jr_inst = io_inst[6:0] == 7'h67; // @[IFU.scala 35:30]
  wire [19:0] pcoffset_hi_hi_hi = io_inst[31] ? 20'hfffff : 20'h0; // @[Bitwise.scala 72:12]
  wire  pcoffset_hi_hi_lo = io_inst[7]; // @[IFU.scala 37:49]
  wire [5:0] pcoffset_hi_lo = io_inst[30:25]; // @[IFU.scala 37:57]
  wire [3:0] pcoffset_lo_hi = io_inst[11:8]; // @[IFU.scala 37:69]
  wire [31:0] _pcoffset_T_2 = {pcoffset_hi_hi_hi,pcoffset_hi_hi_lo,pcoffset_hi_lo,pcoffset_lo_hi,1'h0}; // @[Cat.scala 30:58]
  wire [11:0] pcoffset_hi_hi_hi_1 = io_inst[31] ? 12'hfff : 12'h0; // @[Bitwise.scala 72:12]
  wire [7:0] pcoffset_hi_hi_lo_1 = io_inst[19:12]; // @[IFU.scala 38:49]
  wire  pcoffset_hi_lo_1 = io_inst[20]; // @[IFU.scala 38:62]
  wire [9:0] pcoffset_lo_hi_1 = io_inst[30:21]; // @[IFU.scala 38:71]
  wire [31:0] _pcoffset_T_5 = {pcoffset_hi_hi_hi_1,pcoffset_hi_hi_lo_1,pcoffset_hi_lo_1,pcoffset_lo_hi_1,1'h0}; // @[Cat.scala 30:58]
  wire [11:0] pcoffset_lo_2 = io_inst[31:20]; // @[IFU.scala 39:49]
  wire [31:0] _pcoffset_T_8 = {pcoffset_hi_hi_hi,pcoffset_lo_2}; // @[Cat.scala 30:58]
  wire [31:0] _pcoffset_T_9 = jr_inst ? _pcoffset_T_8 : 32'h0; // @[Mux.scala 98:16]
  wire [31:0] _pcoffset_T_10 = j_inst ? _pcoffset_T_5 : _pcoffset_T_9; // @[Mux.scala 98:16]
  wire [31:0] pcoffset = b_inst ? _pcoffset_T_2 : _pcoffset_T_10; // @[Mux.scala 98:16]
  wire [31:0] prejumpPC = PC + pcoffset; // @[IFU.scala 42:24]
  reg  If_Ld_fail; // @[IFU.scala 44:29]
  reg [1:0] ifstate; // @[IFU.scala 48:28]
  wire [31:0] _GEN_0 = io_jump ? io_jumpPC : PC; // @[IFU.scala 50:18 IFU.scala 51:12 IFU.scala 19:31]
  wire  _GEN_1 = io_jump | expt; // @[IFU.scala 50:18 IFU.scala 52:15 IFU.scala 20:31]
  wire  _GEN_2 = io_jump ? io_intr : intr; // @[IFU.scala 50:18 IFU.scala 53:15 IFU.scala 21:31]
  wire  _T = 2'h0 == ifstate; // @[Conditional.scala 37:30]
  wire  _T_1 = io_imem_req_ready & io_imem_req_valid; // @[Decoupled.scala 40:37]
  wire  _GEN_4 = _T_1 | respready; // @[IFU.scala 57:37 IFU.scala 59:27 IFU.scala 22:31]
  wire  _T_2 = 2'h1 == ifstate; // @[Conditional.scala 37:30]
  wire  _T_3 = io_imem_resp_ready & io_imem_resp_valid; // @[Decoupled.scala 40:37]
  wire  _GEN_7 = io_imem_resp_bits_id == 4'h1 & io_imem_resp_bits_resp & ~(expt | io_jump); // @[IFU.scala 64:77 IFU.scala 71:35 IFU.scala 78:32]
  wire  _GEN_8 = io_imem_resp_bits_id == 4'h1 & io_imem_resp_bits_resp ? If_Ld_fail : 1'h1; // @[IFU.scala 64:77 IFU.scala 44:29 IFU.scala 75:32]
  wire  _T_6 = 2'h2 == ifstate; // @[Conditional.scala 37:30]
  wire [31:0] _PC_T_1 = PC + 32'h4; // @[IFU.scala 90:66]
  wire [31:0] _PC_T_2 = expt ? PC : _PC_T_1; // @[IFU.scala 90:54]
  wire [31:0] _PC_T_3 = io_jump ? io_jumpPC : _PC_T_2; // @[IFU.scala 90:32]
  wire  _GEN_13 = LDDone ? 1'h0 : 1'h1; // @[IFU.scala 88:37 IFU.scala 89:30 IFU.scala 95:30]
  wire [31:0] _GEN_14 = LDDone ? _PC_T_3 : _GEN_0; // @[IFU.scala 88:37 IFU.scala 90:26]
  wire  _GEN_15 = LDDone ? 1'h0 : _GEN_1; // @[IFU.scala 88:37 IFU.scala 91:26]
  wire  _GEN_16 = LDDone ? 1'h0 : _GEN_2; // @[IFU.scala 88:37 IFU.scala 92:26]
  wire [1:0] _GEN_17 = LDDone ? 2'h0 : ifstate; // @[IFU.scala 88:37 IFU.scala 93:29 IFU.scala 48:28]
  wire  _GEN_18 = expt & ~intr ? 1'h0 : _GEN_13; // @[IFU.scala 86:36 IFU.scala 87:30]
  wire [31:0] _GEN_19 = expt & ~intr ? _GEN_0 : _GEN_14; // @[IFU.scala 86:36]
  wire  _GEN_20 = expt & ~intr ? _GEN_1 : _GEN_15; // @[IFU.scala 86:36]
  wire  _GEN_21 = expt & ~intr ? _GEN_2 : _GEN_16; // @[IFU.scala 86:36]
  wire [1:0] _GEN_22 = expt & ~intr ? ifstate : _GEN_17; // @[IFU.scala 86:36 IFU.scala 48:28]
  wire [31:0] _GEN_23 = io_prejump ? prejumpPC : _PC_T_1; // @[IFU.scala 100:34 IFU.scala 101:19 IFU.scala 104:19]
  wire  _GEN_25 = expt ? 1'h0 : _GEN_1; // @[IFU.scala 97:28 IFU.scala 98:21]
  wire [31:0] _GEN_27 = expt ? _GEN_0 : _GEN_23; // @[IFU.scala 97:28]
  wire  _GEN_28 = l_inst | s_inst | lsu_wait ? _GEN_18 : lsu_wait; // @[IFU.scala 85:46 IFU.scala 26:31]
  wire [31:0] _GEN_29 = l_inst | s_inst | lsu_wait ? _GEN_19 : _GEN_27; // @[IFU.scala 85:46]
  wire  _GEN_30 = l_inst | s_inst | lsu_wait ? _GEN_20 : _GEN_25; // @[IFU.scala 85:46]
  wire  _GEN_31 = l_inst | s_inst | lsu_wait ? _GEN_21 : _GEN_2; // @[IFU.scala 85:46]
  wire [1:0] _GEN_32 = l_inst | s_inst | lsu_wait ? _GEN_22 : 2'h0; // @[IFU.scala 85:46]
  wire  _io_imem_req_valid_T_4 = ~reset; // @[IFU.scala 110:68]
  reg [31:0] io_inst_REG; // @[IFU.scala 129:27]
  assign io_prejump = (b_inst | j_inst) & ~io_inst[31]; // @[IFU.scala 41:40]
  assign io_pc = PC; // @[IFU.scala 126:16]
  assign io_fetched = fetched; // @[IFU.scala 125:16]
  assign io_inst = io_inst_REG; // @[IFU.scala 129:17]
  assign io_imem_req_valid = ifstate == 2'h0 & ~io_stall & ~reset; // @[IFU.scala 110:65]
  assign io_imem_req_bits_addr = PC; // @[IFU.scala 111:29]
  assign io_imem_resp_ready = respready & _io_imem_req_valid_T_4; // @[IFU.scala 123:42]
  assign If_Ld_fail_0 = If_Ld_fail;
  always @(posedge clock) begin
    if (reset) begin // @[IFU.scala 19:31]
      PC <= 32'h30000000; // @[IFU.scala 19:31]
    end else if (_T) begin // @[Conditional.scala 40:58]
      PC <= _GEN_0;
    end else if (_T_2) begin // @[Conditional.scala 39:67]
      PC <= _GEN_0;
    end else if (_T_6) begin // @[Conditional.scala 39:67]
      PC <= _GEN_29;
    end else begin
      PC <= _GEN_0;
    end
    if (reset) begin // @[IFU.scala 20:31]
      expt <= 1'h0; // @[IFU.scala 20:31]
    end else if (_T) begin // @[Conditional.scala 40:58]
      expt <= _GEN_1;
    end else if (_T_2) begin // @[Conditional.scala 39:67]
      expt <= _GEN_1;
    end else if (_T_6) begin // @[Conditional.scala 39:67]
      expt <= _GEN_30;
    end else begin
      expt <= _GEN_1;
    end
    if (reset) begin // @[IFU.scala 21:31]
      intr <= 1'h0; // @[IFU.scala 21:31]
    end else if (_T) begin // @[Conditional.scala 40:58]
      intr <= _GEN_2;
    end else if (_T_2) begin // @[Conditional.scala 39:67]
      intr <= _GEN_2;
    end else if (_T_6) begin // @[Conditional.scala 39:67]
      intr <= _GEN_31;
    end else begin
      intr <= _GEN_2;
    end
    if (reset) begin // @[IFU.scala 22:31]
      respready <= 1'h0; // @[IFU.scala 22:31]
    end else if (_T) begin // @[Conditional.scala 40:58]
      respready <= _GEN_4;
    end else if (_T_2) begin // @[Conditional.scala 39:67]
      if (_T_3) begin // @[IFU.scala 63:38]
        respready <= 1'h0;
      end
    end
    if (reset) begin // @[IFU.scala 23:31]
      fetched <= 1'h0; // @[IFU.scala 23:31]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (_T_2) begin // @[Conditional.scala 39:67]
        if (_T_3) begin // @[IFU.scala 63:38]
          fetched <= _GEN_7;
        end
      end else if (_T_6) begin // @[Conditional.scala 39:67]
        fetched <= 1'h0; // @[IFU.scala 83:20]
      end
    end
    if (reset) begin // @[IFU.scala 26:31]
      lsu_wait <= 1'h0; // @[IFU.scala 26:31]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        if (_T_6) begin // @[Conditional.scala 39:67]
          lsu_wait <= _GEN_28;
        end
      end
    end
    if (reset) begin // @[IFU.scala 44:29]
      If_Ld_fail <= 1'h0; // @[IFU.scala 44:29]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (_T_2) begin // @[Conditional.scala 39:67]
        if (_T_3) begin // @[IFU.scala 63:38]
          If_Ld_fail <= _GEN_8;
        end
      end else if (_T_6) begin // @[Conditional.scala 39:67]
        If_Ld_fail <= 1'h0; // @[IFU.scala 84:23]
      end
    end
    if (reset) begin // @[IFU.scala 48:28]
      ifstate <= 2'h0; // @[IFU.scala 48:28]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (_T_1) begin // @[IFU.scala 57:37]
        ifstate <= 2'h1; // @[IFU.scala 58:25]
      end
    end else if (_T_2) begin // @[Conditional.scala 39:67]
      if (_T_3) begin // @[IFU.scala 63:38]
        ifstate <= 2'h2;
      end
    end else if (_T_6) begin // @[Conditional.scala 39:67]
      ifstate <= _GEN_32;
    end
    io_inst_REG <= io_imem_resp_bits_rdata[31:0]; // @[IFU.scala 129:51]
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
  PC = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  expt = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  intr = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  respready = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  fetched = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  lsu_wait = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  If_Ld_fail = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  ifstate = _RAND_7[1:0];
  _RAND_8 = {1{`RANDOM}};
  io_inst_REG = _RAND_8[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210232_UserBusDispute(
  output        io_in_req_ready,
  input         io_in_req_valid,
  input  [31:0] io_in_req_bits_addr,
  input         io_in_req_bits_ren,
  input  [2:0]  io_in_req_bits_size,
  input         io_in_req_bits_wen,
  input  [7:0]  io_in_req_bits_wmask,
  input  [63:0] io_in_req_bits_wdata,
  input         io_in_resp_ready,
  output        io_in_resp_valid,
  output [63:0] io_in_resp_bits_rdata,
  output        io_in_resp_bits_resp,
  output [3:0]  io_in_resp_bits_id,
  input         io_r_req_ready,
  output        io_r_req_valid,
  output [31:0] io_r_req_bits_addr,
  output [2:0]  io_r_req_bits_size,
  output        io_r_resp_ready,
  input         io_r_resp_valid,
  input  [63:0] io_r_resp_bits_rdata,
  input         io_r_resp_bits_resp,
  input  [3:0]  io_r_resp_bits_id,
  input         io_w_req_ready,
  output        io_w_req_valid,
  output [31:0] io_w_req_bits_addr,
  output [2:0]  io_w_req_bits_size,
  output        io_w_req_bits_wen,
  output [7:0]  io_w_req_bits_wmask,
  output [63:0] io_w_req_bits_wdata,
  output        io_w_resp_ready,
  input         io_w_resp_valid,
  input         io_w_resp_bits_resp,
  input  [3:0]  io_w_resp_bits_id
);
  wire  _GEN_0 = io_in_req_bits_ren & io_r_req_ready; // @[Crossbar.scala 82:33 Crossbar.scala 83:22 Crossbar.scala 90:22]
  wire  _GEN_1 = io_in_req_bits_ren & io_in_req_valid; // @[Crossbar.scala 82:33 Crossbar.scala 84:22 Crossbar.scala 91:22]
  wire  _GEN_3 = io_in_req_bits_ren & io_r_resp_valid; // @[Crossbar.scala 82:33 Crossbar.scala 86:22 Crossbar.scala 93:22]
  wire  _GEN_4 = io_in_req_bits_ren & io_in_resp_ready; // @[Crossbar.scala 82:33 Crossbar.scala 87:22 Crossbar.scala 94:22]
  assign io_in_req_ready = io_in_req_bits_wen ? io_w_req_ready : _GEN_0; // @[Crossbar.scala 75:27 Crossbar.scala 76:22]
  assign io_in_resp_valid = io_in_req_bits_wen ? io_w_resp_valid : _GEN_3; // @[Crossbar.scala 75:27 Crossbar.scala 79:22]
  assign io_in_resp_bits_rdata = io_in_req_bits_wen ? 64'h0 : io_r_resp_bits_rdata; // @[Crossbar.scala 71:25]
  assign io_in_resp_bits_resp = io_in_req_bits_wen ? io_w_resp_bits_resp : io_r_resp_bits_resp; // @[Crossbar.scala 71:25]
  assign io_in_resp_bits_id = io_in_req_bits_wen ? io_w_resp_bits_id : io_r_resp_bits_id; // @[Crossbar.scala 71:25]
  assign io_r_req_valid = io_in_req_bits_wen ? 1'h0 : _GEN_1; // @[Crossbar.scala 75:27 Crossbar.scala 78:22]
  assign io_r_req_bits_addr = io_in_req_bits_addr; // @[Crossbar.scala 69:19]
  assign io_r_req_bits_size = io_in_req_bits_size; // @[Crossbar.scala 69:19]
  assign io_r_resp_ready = io_in_req_bits_wen ? 1'h0 : _GEN_4; // @[Crossbar.scala 75:27 Crossbar.scala 81:22]
  assign io_w_req_valid = io_in_req_bits_wen & io_in_req_valid; // @[Crossbar.scala 75:27 Crossbar.scala 77:22]
  assign io_w_req_bits_addr = io_in_req_bits_addr; // @[Crossbar.scala 70:19]
  assign io_w_req_bits_size = io_in_req_bits_size; // @[Crossbar.scala 70:19]
  assign io_w_req_bits_wen = io_in_req_bits_wen; // @[Crossbar.scala 70:19]
  assign io_w_req_bits_wmask = io_in_req_bits_wmask; // @[Crossbar.scala 70:19]
  assign io_w_req_bits_wdata = io_in_req_bits_wdata; // @[Crossbar.scala 70:19]
  assign io_w_resp_ready = io_in_req_bits_wen & io_in_resp_ready; // @[Crossbar.scala 75:27 Crossbar.scala 80:22]
endmodule
module ysyx_210232_RRArbiter(
  input         clock,
  input         reset,
  input         io_in_0_valid,
  input  [31:0] io_in_0_bits_addr,
  input         io_in_1_valid,
  input  [31:0] io_in_1_bits_addr,
  input  [2:0]  io_in_1_bits_size,
  input         io_out_ready,
  output        io_out_valid,
  output [31:0] io_out_bits_addr,
  output [2:0]  io_out_bits_size,
  output [3:0]  io_out_bits_id,
  output        io_chosen
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  _ctrl_validMask_grantMask_lastGrant_T = io_out_ready & io_out_valid; // @[Decoupled.scala 40:37]
  reg  lastGrant; // @[Reg.scala 15:16]
  wire  grantMask_1 = 1'h1 > lastGrant; // @[Arbiter.scala 67:49]
  wire  validMask_1 = io_in_1_valid & grantMask_1; // @[Arbiter.scala 68:75]
  wire  _GEN_19 = io_in_0_valid ? 1'h0 : 1'h1; // @[Arbiter.scala 77:27 Arbiter.scala 77:36]
  assign io_out_valid = io_chosen ? io_in_1_valid : io_in_0_valid; // @[Arbiter.scala 41:16 Arbiter.scala 41:16]
  assign io_out_bits_addr = io_chosen ? io_in_1_bits_addr : io_in_0_bits_addr; // @[Arbiter.scala 42:15 Arbiter.scala 42:15]
  assign io_out_bits_size = io_chosen ? io_in_1_bits_size : 3'h2; // @[Arbiter.scala 42:15 Arbiter.scala 42:15]
  assign io_out_bits_id = io_chosen ? 4'h2 : 4'h1; // @[Arbiter.scala 42:15 Arbiter.scala 42:15]
  assign io_chosen = validMask_1 | _GEN_19; // @[Arbiter.scala 79:25 Arbiter.scala 79:34]
  always @(posedge clock) begin
    if(reset)
      lastGrant <= 1'b0;
    else if (_ctrl_validMask_grantMask_lastGrant_T) begin
      lastGrant <= io_chosen; 
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
  lastGrant = _RAND_0[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210232_Crossbar(
  input         clock,
  input         reset,
  output        io_in_0_req_ready,
  input         io_in_0_req_valid,
  input  [31:0] io_in_0_req_bits_addr,
  input         io_in_0_resp_ready,
  output        io_in_0_resp_valid,
  output [31:0] io_in_0_resp_bits_rdata,
  output        io_in_0_resp_bits_resp,
  output [3:0]  io_in_0_resp_bits_id,
  output        io_in_1_req_ready,
  input         io_in_1_req_valid,
  input  [31:0] io_in_1_req_bits_addr,
  input         io_in_1_req_bits_ren,
  input  [2:0]  io_in_1_req_bits_size,
  input         io_in_1_req_bits_wen,
  input  [7:0]  io_in_1_req_bits_wmask,
  input  [63:0] io_in_1_req_bits_wdata,
  input         io_in_1_resp_ready,
  output        io_in_1_resp_valid,
  output [63:0] io_in_1_resp_bits_rdata,
  output        io_in_1_resp_bits_resp,
  output [3:0]  io_in_1_resp_bits_id,
  input         io_out_req_ready,
  output        io_out_req_valid,
  output [31:0] io_out_req_bits_addr,
  output [2:0]  io_out_req_bits_size,
  output [3:0]  io_out_req_bits_id,
  output        io_out_resp_ready,
  input         io_out_resp_valid,
  input  [63:0] io_out_resp_bits_rdata,
  input         io_out_resp_bits_resp,
  input  [3:0]  io_out_resp_bits_id,
  input         io_outw_req_ready,
  output        io_outw_req_valid,
  output [31:0] io_outw_req_bits_addr,
  output [2:0]  io_outw_req_bits_size,
  output        io_outw_req_bits_wen,
  output [7:0]  io_outw_req_bits_wmask,
  output [63:0] io_outw_req_bits_wdata,
  output        io_outw_resp_ready,
  input         io_outw_resp_valid,
  input         io_outw_resp_bits_resp,
  input  [3:0]  io_outw_resp_bits_id
);
  wire  dispute_io_in_req_ready; // @[Crossbar.scala 28:26]
  wire  dispute_io_in_req_valid; // @[Crossbar.scala 28:26]
  wire [31:0] dispute_io_in_req_bits_addr; // @[Crossbar.scala 28:26]
  wire  dispute_io_in_req_bits_ren; // @[Crossbar.scala 28:26]
  wire [2:0] dispute_io_in_req_bits_size; // @[Crossbar.scala 28:26]
  wire  dispute_io_in_req_bits_wen; // @[Crossbar.scala 28:26]
  wire [7:0] dispute_io_in_req_bits_wmask; // @[Crossbar.scala 28:26]
  wire [63:0] dispute_io_in_req_bits_wdata; // @[Crossbar.scala 28:26]
  wire  dispute_io_in_resp_ready; // @[Crossbar.scala 28:26]
  wire  dispute_io_in_resp_valid; // @[Crossbar.scala 28:26]
  wire [63:0] dispute_io_in_resp_bits_rdata; // @[Crossbar.scala 28:26]
  wire  dispute_io_in_resp_bits_resp; // @[Crossbar.scala 28:26]
  wire [3:0] dispute_io_in_resp_bits_id; // @[Crossbar.scala 28:26]
  wire  dispute_io_r_req_ready; // @[Crossbar.scala 28:26]
  wire  dispute_io_r_req_valid; // @[Crossbar.scala 28:26]
  wire [31:0] dispute_io_r_req_bits_addr; // @[Crossbar.scala 28:26]
  wire [2:0] dispute_io_r_req_bits_size; // @[Crossbar.scala 28:26]
  wire  dispute_io_r_resp_ready; // @[Crossbar.scala 28:26]
  wire  dispute_io_r_resp_valid; // @[Crossbar.scala 28:26]
  wire [63:0] dispute_io_r_resp_bits_rdata; // @[Crossbar.scala 28:26]
  wire  dispute_io_r_resp_bits_resp; // @[Crossbar.scala 28:26]
  wire [3:0] dispute_io_r_resp_bits_id; // @[Crossbar.scala 28:26]
  wire  dispute_io_w_req_ready; // @[Crossbar.scala 28:26]
  wire  dispute_io_w_req_valid; // @[Crossbar.scala 28:26]
  wire [31:0] dispute_io_w_req_bits_addr; // @[Crossbar.scala 28:26]
  wire [2:0] dispute_io_w_req_bits_size; // @[Crossbar.scala 28:26]
  wire  dispute_io_w_req_bits_wen; // @[Crossbar.scala 28:26]
  wire [7:0] dispute_io_w_req_bits_wmask; // @[Crossbar.scala 28:26]
  wire [63:0] dispute_io_w_req_bits_wdata; // @[Crossbar.scala 28:26]
  wire  dispute_io_w_resp_ready; // @[Crossbar.scala 28:26]
  wire  dispute_io_w_resp_valid; // @[Crossbar.scala 28:26]
  wire  dispute_io_w_resp_bits_resp; // @[Crossbar.scala 28:26]
  wire [3:0] dispute_io_w_resp_bits_id; // @[Crossbar.scala 28:26]
  wire  arb_clock; // @[Crossbar.scala 32:21]
  wire  arb_io_in_0_valid; // @[Crossbar.scala 32:21]
  wire [31:0] arb_io_in_0_bits_addr; // @[Crossbar.scala 32:21]
  wire  arb_io_in_1_valid; // @[Crossbar.scala 32:21]
  wire [31:0] arb_io_in_1_bits_addr; // @[Crossbar.scala 32:21]
  wire [2:0] arb_io_in_1_bits_size; // @[Crossbar.scala 32:21]
  wire  arb_io_out_ready; // @[Crossbar.scala 32:21]
  wire  arb_io_out_valid; // @[Crossbar.scala 32:21]
  wire [31:0] arb_io_out_bits_addr; // @[Crossbar.scala 32:21]
  wire [2:0] arb_io_out_bits_size; // @[Crossbar.scala 32:21]
  wire [3:0] arb_io_out_bits_id; // @[Crossbar.scala 32:21]
  wire  arb_io_chosen; // @[Crossbar.scala 32:21]
  wire  _GEN_0 = io_out_resp_bits_id == 4'h1 & io_in_0_resp_ready; // @[Crossbar.scala 50:46 Crossbar.scala 51:25 Crossbar.scala 55:27]
  wire  _GEN_1 = io_out_resp_bits_id == 4'h1 & io_out_resp_valid; // @[Crossbar.scala 50:46 Crossbar.scala 52:27 Crossbar.scala 56:29]
  ysyx_210232_UserBusDispute dispute ( // @[Crossbar.scala 28:26]
    .io_in_req_ready(dispute_io_in_req_ready),
    .io_in_req_valid(dispute_io_in_req_valid),
    .io_in_req_bits_addr(dispute_io_in_req_bits_addr),
    .io_in_req_bits_ren(dispute_io_in_req_bits_ren),
    .io_in_req_bits_size(dispute_io_in_req_bits_size),
    .io_in_req_bits_wen(dispute_io_in_req_bits_wen),
    .io_in_req_bits_wmask(dispute_io_in_req_bits_wmask),
    .io_in_req_bits_wdata(dispute_io_in_req_bits_wdata),
    .io_in_resp_ready(dispute_io_in_resp_ready),
    .io_in_resp_valid(dispute_io_in_resp_valid),
    .io_in_resp_bits_rdata(dispute_io_in_resp_bits_rdata),
    .io_in_resp_bits_resp(dispute_io_in_resp_bits_resp),
    .io_in_resp_bits_id(dispute_io_in_resp_bits_id),
    .io_r_req_ready(dispute_io_r_req_ready),
    .io_r_req_valid(dispute_io_r_req_valid),
    .io_r_req_bits_addr(dispute_io_r_req_bits_addr),
    .io_r_req_bits_size(dispute_io_r_req_bits_size),
    .io_r_resp_ready(dispute_io_r_resp_ready),
    .io_r_resp_valid(dispute_io_r_resp_valid),
    .io_r_resp_bits_rdata(dispute_io_r_resp_bits_rdata),
    .io_r_resp_bits_resp(dispute_io_r_resp_bits_resp),
    .io_r_resp_bits_id(dispute_io_r_resp_bits_id),
    .io_w_req_ready(dispute_io_w_req_ready),
    .io_w_req_valid(dispute_io_w_req_valid),
    .io_w_req_bits_addr(dispute_io_w_req_bits_addr),
    .io_w_req_bits_size(dispute_io_w_req_bits_size),
    .io_w_req_bits_wen(dispute_io_w_req_bits_wen),
    .io_w_req_bits_wmask(dispute_io_w_req_bits_wmask),
    .io_w_req_bits_wdata(dispute_io_w_req_bits_wdata),
    .io_w_resp_ready(dispute_io_w_resp_ready),
    .io_w_resp_valid(dispute_io_w_resp_valid),
    .io_w_resp_bits_resp(dispute_io_w_resp_bits_resp),
    .io_w_resp_bits_id(dispute_io_w_resp_bits_id)
  );
  ysyx_210232_RRArbiter arb ( // @[Crossbar.scala 32:21]
    .clock(arb_clock),
    .reset(reset),
    .io_in_0_valid(arb_io_in_0_valid),
    .io_in_0_bits_addr(arb_io_in_0_bits_addr),
    .io_in_1_valid(arb_io_in_1_valid),
    .io_in_1_bits_addr(arb_io_in_1_bits_addr),
    .io_in_1_bits_size(arb_io_in_1_bits_size),
    .io_out_ready(arb_io_out_ready),
    .io_out_valid(arb_io_out_valid),
    .io_out_bits_addr(arb_io_out_bits_addr),
    .io_out_bits_size(arb_io_out_bits_size),
    .io_out_bits_id(arb_io_out_bits_id),
    .io_chosen(arb_io_chosen)
  );
  assign io_in_0_req_ready = ~arb_io_chosen & io_out_req_ready; // @[Crossbar.scala 37:55]
  assign io_in_0_resp_valid = io_out_resp_bits_id == 4'h2 ? 1'h0 : _GEN_1; // @[Crossbar.scala 46:40 Crossbar.scala 48:27]
  assign io_in_0_resp_bits_rdata = io_out_resp_bits_rdata[31:0]; // @[Crossbar.scala 43:24]
  assign io_in_0_resp_bits_resp = io_out_resp_bits_resp; // @[Crossbar.scala 43:24]
  assign io_in_0_resp_bits_id = io_out_resp_bits_id; // @[Crossbar.scala 43:24]
  assign io_in_1_req_ready = dispute_io_in_req_ready; // @[Crossbar.scala 29:19]
  assign io_in_1_resp_valid = dispute_io_in_resp_valid; // @[Crossbar.scala 29:19]
  assign io_in_1_resp_bits_rdata = dispute_io_in_resp_bits_rdata; // @[Crossbar.scala 29:19]
  assign io_in_1_resp_bits_resp = dispute_io_in_resp_bits_resp; // @[Crossbar.scala 29:19]
  assign io_in_1_resp_bits_id = dispute_io_in_resp_bits_id; // @[Crossbar.scala 29:19]
  assign io_out_req_valid = arb_io_out_valid; // @[Crossbar.scala 40:24]
  assign io_out_req_bits_addr = arb_io_out_bits_addr; // @[Crossbar.scala 39:24]
  assign io_out_req_bits_size = arb_io_out_bits_size; // @[Crossbar.scala 39:24]
  assign io_out_req_bits_id = arb_io_out_bits_id; // @[Crossbar.scala 39:24]
  assign io_out_resp_ready = io_out_resp_bits_id == 4'h2 ? dispute_io_r_resp_ready : _GEN_0; // @[Crossbar.scala 46:40 Crossbar.scala 47:25]
  assign io_outw_req_valid = dispute_io_w_req_valid; // @[Crossbar.scala 30:13]
  assign io_outw_req_bits_addr = dispute_io_w_req_bits_addr; // @[Crossbar.scala 30:13]
  assign io_outw_req_bits_size = dispute_io_w_req_bits_size; // @[Crossbar.scala 30:13]
  assign io_outw_req_bits_wen = dispute_io_w_req_bits_wen; // @[Crossbar.scala 30:13]
  assign io_outw_req_bits_wmask = dispute_io_w_req_bits_wmask; // @[Crossbar.scala 30:13]
  assign io_outw_req_bits_wdata = dispute_io_w_req_bits_wdata; // @[Crossbar.scala 30:13]
  assign io_outw_resp_ready = dispute_io_w_resp_ready; // @[Crossbar.scala 30:13]
  assign dispute_io_in_req_valid = io_in_1_req_valid; // @[Crossbar.scala 29:19]
  assign dispute_io_in_req_bits_addr = io_in_1_req_bits_addr; // @[Crossbar.scala 29:19]
  assign dispute_io_in_req_bits_ren = io_in_1_req_bits_ren; // @[Crossbar.scala 29:19]
  assign dispute_io_in_req_bits_size = io_in_1_req_bits_size; // @[Crossbar.scala 29:19]
  assign dispute_io_in_req_bits_wen = io_in_1_req_bits_wen; // @[Crossbar.scala 29:19]
  assign dispute_io_in_req_bits_wmask = io_in_1_req_bits_wmask; // @[Crossbar.scala 29:19]
  assign dispute_io_in_req_bits_wdata = io_in_1_req_bits_wdata; // @[Crossbar.scala 29:19]
  assign dispute_io_in_resp_ready = io_in_1_resp_ready; // @[Crossbar.scala 29:19]
  assign dispute_io_r_req_ready = arb_io_chosen & io_out_req_ready; // @[Crossbar.scala 38:55]
  assign dispute_io_r_resp_valid = io_out_resp_bits_id == 4'h2 & io_out_resp_valid; // @[Crossbar.scala 46:40 Crossbar.scala 49:31]
  assign dispute_io_r_resp_bits_rdata = io_out_resp_bits_rdata; // @[Crossbar.scala 44:28]
  assign dispute_io_r_resp_bits_resp = io_out_resp_bits_resp; // @[Crossbar.scala 44:28]
  assign dispute_io_r_resp_bits_id = io_out_resp_bits_id; // @[Crossbar.scala 44:28]
  assign dispute_io_w_req_ready = io_outw_req_ready; // @[Crossbar.scala 30:13]
  assign dispute_io_w_resp_valid = io_outw_resp_valid; // @[Crossbar.scala 30:13]
  assign dispute_io_w_resp_bits_resp = io_outw_resp_bits_resp; // @[Crossbar.scala 30:13]
  assign dispute_io_w_resp_bits_id = io_outw_resp_bits_id; // @[Crossbar.scala 30:13]
  assign arb_clock = clock;
  assign arb_io_in_0_valid = io_in_0_req_valid; // @[Crossbar.scala 33:18]
  assign arb_io_in_0_bits_addr = io_in_0_req_bits_addr; // @[Crossbar.scala 33:18]
  assign arb_io_in_1_valid = dispute_io_r_req_valid; // @[Crossbar.scala 34:18]
  assign arb_io_in_1_bits_addr = dispute_io_r_req_bits_addr; // @[Crossbar.scala 34:18]
  assign arb_io_in_1_bits_size = dispute_io_r_req_bits_size; // @[Crossbar.scala 34:18]
  assign arb_io_out_ready = io_out_req_ready; // @[Crossbar.scala 41:24]
endmodule
module ysyx_210232_User2AXI(
  input         clock,
  input         reset,
  output        io_wruser_req_ready,
  input         io_wruser_req_valid,
  input  [31:0] io_wruser_req_bits_addr,
  input  [2:0]  io_wruser_req_bits_size,
  input         io_wruser_req_bits_wen,
  input  [7:0]  io_wruser_req_bits_wmask,
  input  [63:0] io_wruser_req_bits_wdata,
  input         io_wruser_resp_ready,
  output        io_wruser_resp_valid,
  output        io_wruser_resp_bits_resp,
  output [3:0]  io_wruser_resp_bits_id,
  output        io_rduser_req_ready,
  input         io_rduser_req_valid,
  input  [31:0] io_rduser_req_bits_addr,
  input  [2:0]  io_rduser_req_bits_size,
  input  [3:0]  io_rduser_req_bits_id,
  input         io_rduser_resp_ready,
  output        io_rduser_resp_valid,
  output [63:0] io_rduser_resp_bits_rdata,
  output        io_rduser_resp_bits_resp,
  output [3:0]  io_rduser_resp_bits_id,
  input         io_axi_aw_ready,
  output        io_axi_aw_valid,
  output [31:0] io_axi_aw_bits_addr,
  output [2:0]  io_axi_aw_bits_size,
  input         io_axi_w_ready,
  output        io_axi_w_valid,
  output [63:0] io_axi_w_bits_data,
  output [7:0]  io_axi_w_bits_strb,
  output        io_axi_b_ready,
  input         io_axi_b_valid,
  input  [3:0]  io_axi_b_bits_id,
  input  [1:0]  io_axi_b_bits_resp,
  input         io_axi_ar_ready,
  output        io_axi_ar_valid,
  output [3:0]  io_axi_ar_bits_id,
  output [31:0] io_axi_ar_bits_addr,
  output [2:0]  io_axi_ar_bits_size,
  output        io_axi_r_ready,
  input         io_axi_r_valid,
  input  [3:0]  io_axi_r_bits_id,
  input  [63:0] io_axi_r_bits_data,
  input  [1:0]  io_axi_r_bits_resp,
  input         io_axi_r_bits_last
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  w_valid = io_wruser_req_valid & io_wruser_req_bits_wen; // @[User2AXI.scala 82:39]
  wire  aw_hs = io_axi_aw_ready & io_axi_aw_valid; // @[Decoupled.scala 40:37]
  wire  w_hs = io_axi_w_ready & io_axi_w_valid; // @[Decoupled.scala 40:37]
  reg [1:0] wstate; // @[User2AXI.scala 88:25]
  wire  _T = 2'h0 == wstate; // @[Conditional.scala 37:30]
  wire  _T_1 = 2'h1 == wstate; // @[Conditional.scala 37:30]
  wire  _T_2 = 2'h2 == wstate; // @[Conditional.scala 37:30]
  wire [1:0] _GEN_2 = w_hs ? 2'h0 : wstate; // @[User2AXI.scala 93:39 User2AXI.scala 93:48 User2AXI.scala 88:25]
  assign io_wruser_req_ready = io_axi_w_ready; // @[User2AXI.scala 98:27]
  assign io_wruser_resp_valid = io_axi_b_valid; // @[User2AXI.scala 101:27]
  assign io_wruser_resp_bits_resp = io_axi_b_bits_resp == 2'h0; // @[User2AXI.scala 120:53]
  assign io_wruser_resp_bits_id = io_axi_b_bits_id; // @[User2AXI.scala 121:31]
  assign io_rduser_req_ready = io_axi_ar_ready; // @[User2AXI.scala 60:28]
  assign io_rduser_resp_valid = io_axi_r_valid; // @[User2AXI.scala 74:31]
  assign io_rduser_resp_bits_rdata = io_axi_r_bits_data; // @[User2AXI.scala 77:31]
  assign io_rduser_resp_bits_resp = io_axi_r_bits_resp == 2'h0 & io_axi_r_bits_last; // @[User2AXI.scala 78:64]
  assign io_rduser_resp_bits_id = io_axi_r_bits_id; // @[User2AXI.scala 79:31]
  assign io_axi_aw_valid = wstate == 2'h1; // @[User2AXI.scala 96:37]
  assign io_axi_aw_bits_addr = io_wruser_req_bits_addr; // @[User2AXI.scala 112:27]
  assign io_axi_aw_bits_size = io_wruser_req_bits_size; // @[User2AXI.scala 107:27]
  assign io_axi_w_valid = wstate == 2'h2; // @[User2AXI.scala 97:37]
  assign io_axi_w_bits_data = io_wruser_req_bits_wdata; // @[User2AXI.scala 115:27]
  assign io_axi_w_bits_strb = io_wruser_req_bits_wmask; // @[User2AXI.scala 116:27]
  assign io_axi_b_ready = io_wruser_resp_ready; // @[User2AXI.scala 100:27]
  assign io_axi_ar_valid = io_rduser_req_valid; // @[User2AXI.scala 61:28]
  assign io_axi_ar_bits_id = io_rduser_req_bits_id; // @[User2AXI.scala 65:26]
  assign io_axi_ar_bits_addr = io_rduser_req_bits_addr; // @[User2AXI.scala 63:26]
  assign io_axi_ar_bits_size = io_rduser_req_bits_size; // @[User2AXI.scala 68:26]
  assign io_axi_r_ready = io_rduser_resp_ready; // @[User2AXI.scala 75:31]
  always @(posedge clock) begin
    if (reset) begin // @[User2AXI.scala 88:25]
      wstate <= 2'h0; // @[User2AXI.scala 88:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (w_valid) begin // @[User2AXI.scala 91:39]
        wstate <= 2'h1; // @[User2AXI.scala 91:48]
      end
    end else if (_T_1) begin // @[Conditional.scala 39:67]
      if (aw_hs) begin // @[User2AXI.scala 92:39]
        wstate <= 2'h2; // @[User2AXI.scala 92:48]
      end
    end else if (_T_2) begin // @[Conditional.scala 39:67]
      wstate <= _GEN_2;
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
  wstate = _RAND_0[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210232_IDU(
  input  [31:0] io_pc,
  input  [31:0] io_inst,
  input         io_prejump,
  input         io_valid,
  output        io_issue_valid,
  output        io_issue_prejump,
  output [31:0] io_issue_pc,
  output [31:0] io_issue_inst,
  output [2:0]  io_issue_func_type,
  output [3:0]  io_issue_func_mode,
  output [4:0]  io_issue_rf_raddr1,
  output [4:0]  io_issue_rf_raddr2,
  output [1:0]  io_issue_opsrc1,
  output [1:0]  io_issue_opsrc2,
  output [63:0] io_issue_imm,
  output        io_issue_rv64w,
  output        io_issue_rf_wen,
  output [4:0]  io_issue_rf_waddr,
  output        _T_1_0
);
  wire [4:0] rd = io_inst[11:7]; // @[IDU.scala 18:22]
  wire [4:0] rs1 = io_inst[19:15]; // @[IDU.scala 20:22]
  wire [11:0] imm = io_inst[31:20]; // @[IDU.scala 21:22]
  wire [31:0] _csignals_T = io_valid ? io_inst : 32'h13; // @[IDU.scala 24:34]
  wire [31:0] _csignals_T_1 = _csignals_T & 32'hfe00707f; // @[Lookup.scala 31:38]
  wire  _csignals_T_2 = 32'h1033 == _csignals_T_1; // @[Lookup.scala 31:38]
  wire  _csignals_T_4 = 32'h33 == _csignals_T_1; // @[Lookup.scala 31:38]
  wire  _csignals_T_6 = 32'h40000033 == _csignals_T_1; // @[Lookup.scala 31:38]
  wire  _csignals_T_8 = 32'h2033 == _csignals_T_1; // @[Lookup.scala 31:38]
  wire  _csignals_T_10 = 32'h3033 == _csignals_T_1; // @[Lookup.scala 31:38]
  wire  _csignals_T_12 = 32'h7033 == _csignals_T_1; // @[Lookup.scala 31:38]
  wire  _csignals_T_14 = 32'h6033 == _csignals_T_1; // @[Lookup.scala 31:38]
  wire  _csignals_T_16 = 32'h4033 == _csignals_T_1; // @[Lookup.scala 31:38]
  wire  _csignals_T_18 = 32'h40005033 == _csignals_T_1; // @[Lookup.scala 31:38]
  wire  _csignals_T_20 = 32'h5033 == _csignals_T_1; // @[Lookup.scala 31:38]
  wire [31:0] _csignals_T_21 = _csignals_T & 32'h707f; // @[Lookup.scala 31:38]
  wire  _csignals_T_22 = 32'h13 == _csignals_T_21; // @[Lookup.scala 31:38]
  wire  _csignals_T_24 = 32'h7013 == _csignals_T_21; // @[Lookup.scala 31:38]
  wire  _csignals_T_26 = 32'h6013 == _csignals_T_21; // @[Lookup.scala 31:38]
  wire  _csignals_T_28 = 32'h4013 == _csignals_T_21; // @[Lookup.scala 31:38]
  wire  _csignals_T_30 = 32'h2013 == _csignals_T_21; // @[Lookup.scala 31:38]
  wire  _csignals_T_32 = 32'h3013 == _csignals_T_21; // @[Lookup.scala 31:38]
  wire [31:0] _csignals_T_33 = _csignals_T & 32'hfc00707f; // @[Lookup.scala 31:38]
  wire  _csignals_T_34 = 32'h1013 == _csignals_T_33; // @[Lookup.scala 31:38]
  wire  _csignals_T_36 = 32'h40005013 == _csignals_T_33; // @[Lookup.scala 31:38]
  wire  _csignals_T_38 = 32'h5013 == _csignals_T_33; // @[Lookup.scala 31:38]
  wire  _csignals_T_40 = 32'h1b == _csignals_T_21; // @[Lookup.scala 31:38]
  wire  _csignals_T_42 = 32'h101b == _csignals_T_1; // @[Lookup.scala 31:38]
  wire  _csignals_T_44 = 32'h501b == _csignals_T_1; // @[Lookup.scala 31:38]
  wire  _csignals_T_46 = 32'h4000501b == _csignals_T_1; // @[Lookup.scala 31:38]
  wire  _csignals_T_48 = 32'h3b == _csignals_T_1; // @[Lookup.scala 31:38]
  wire  _csignals_T_50 = 32'h4000003b == _csignals_T_1; // @[Lookup.scala 31:38]
  wire  _csignals_T_52 = 32'h103b == _csignals_T_1; // @[Lookup.scala 31:38]
  wire  _csignals_T_54 = 32'h503b == _csignals_T_1; // @[Lookup.scala 31:38]
  wire  _csignals_T_56 = 32'h4000503b == _csignals_T_1; // @[Lookup.scala 31:38]
  wire [31:0] _csignals_T_57 = _csignals_T & 32'h7f; // @[Lookup.scala 31:38]
  wire  _csignals_T_58 = 32'h6f == _csignals_T_57; // @[Lookup.scala 31:38]
  wire  _csignals_T_60 = 32'h67 == _csignals_T_21; // @[Lookup.scala 31:38]
  wire  _csignals_T_62 = 32'h63 == _csignals_T_21; // @[Lookup.scala 31:38]
  wire  _csignals_T_64 = 32'h1063 == _csignals_T_21; // @[Lookup.scala 31:38]
  wire  _csignals_T_66 = 32'h5063 == _csignals_T_21; // @[Lookup.scala 31:38]
  wire  _csignals_T_68 = 32'h7063 == _csignals_T_21; // @[Lookup.scala 31:38]
  wire  _csignals_T_70 = 32'h4063 == _csignals_T_21; // @[Lookup.scala 31:38]
  wire  _csignals_T_72 = 32'h6063 == _csignals_T_21; // @[Lookup.scala 31:38]
  wire  _csignals_T_74 = 32'h3 == _csignals_T_21; // @[Lookup.scala 31:38]
  wire  _csignals_T_76 = 32'h4003 == _csignals_T_21; // @[Lookup.scala 31:38]
  wire  _csignals_T_78 = 32'h1003 == _csignals_T_21; // @[Lookup.scala 31:38]
  wire  _csignals_T_80 = 32'h5003 == _csignals_T_21; // @[Lookup.scala 31:38]
  wire  _csignals_T_82 = 32'h2003 == _csignals_T_21; // @[Lookup.scala 31:38]
  wire  _csignals_T_84 = 32'h6003 == _csignals_T_21; // @[Lookup.scala 31:38]
  wire  _csignals_T_86 = 32'h3003 == _csignals_T_21; // @[Lookup.scala 31:38]
  wire  _csignals_T_88 = 32'h23 == _csignals_T_21; // @[Lookup.scala 31:38]
  wire  _csignals_T_90 = 32'h1023 == _csignals_T_21; // @[Lookup.scala 31:38]
  wire  _csignals_T_92 = 32'h2023 == _csignals_T_21; // @[Lookup.scala 31:38]
  wire  _csignals_T_94 = 32'h3023 == _csignals_T_21; // @[Lookup.scala 31:38]
  wire  _csignals_T_96 = 32'h17 == _csignals_T_57; // @[Lookup.scala 31:38]
  wire  _csignals_T_98 = 32'h37 == _csignals_T_57; // @[Lookup.scala 31:38]
  wire  _csignals_T_100 = 32'h1073 == _csignals_T_21; // @[Lookup.scala 31:38]
  wire  _csignals_T_102 = 32'h2073 == _csignals_T_21; // @[Lookup.scala 31:38]
  wire  _csignals_T_104 = 32'h3073 == _csignals_T_21; // @[Lookup.scala 31:38]
  wire  _csignals_T_106 = 32'h5073 == _csignals_T_21; // @[Lookup.scala 31:38]
  wire  _csignals_T_108 = 32'h6073 == _csignals_T_21; // @[Lookup.scala 31:38]
  wire  _csignals_T_110 = 32'h7073 == _csignals_T_21; // @[Lookup.scala 31:38]
  wire  _csignals_T_112 = 32'h73 == _csignals_T; // @[Lookup.scala 31:38]
  wire  _csignals_T_114 = 32'h30200073 == _csignals_T; // @[Lookup.scala 31:38]
  wire  _csignals_T_116 = 32'h6b == _csignals_T; // @[Lookup.scala 31:38]
  wire  _csignals_T_118 = 32'h7b == _csignals_T; // @[Lookup.scala 31:38]
  wire  _csignals_T_149 = _csignals_T_58 | (_csignals_T_60 | (_csignals_T_62 | (_csignals_T_64 | (_csignals_T_66 | (
    _csignals_T_68 | (_csignals_T_70 | (_csignals_T_72 | (_csignals_T_74 | (_csignals_T_76 | (_csignals_T_78 | (
    _csignals_T_80 | (_csignals_T_82 | (_csignals_T_84 | (_csignals_T_86 | (_csignals_T_88 | (_csignals_T_90 | (
    _csignals_T_92 | (_csignals_T_94 | (_csignals_T_96 | (_csignals_T_98 | (_csignals_T_100 | (_csignals_T_102 | (
    _csignals_T_104 | (_csignals_T_106 | (_csignals_T_108 | (_csignals_T_110 | (_csignals_T_112 | (_csignals_T_114 | (
    _csignals_T_116 | _csignals_T_118))))))))))))))))))))))))))))); // @[Lookup.scala 33:37]
  wire  cs_valid = _csignals_T_2 | (_csignals_T_4 | (_csignals_T_6 | (_csignals_T_8 | (_csignals_T_10 | (_csignals_T_12
     | (_csignals_T_14 | (_csignals_T_16 | (_csignals_T_18 | (_csignals_T_20 | (_csignals_T_22 | (_csignals_T_24 | (
    _csignals_T_26 | (_csignals_T_28 | (_csignals_T_30 | (_csignals_T_32 | (_csignals_T_34 | (_csignals_T_36 | (
    _csignals_T_38 | (_csignals_T_40 | (_csignals_T_42 | (_csignals_T_44 | (_csignals_T_46 | (_csignals_T_48 | (
    _csignals_T_50 | (_csignals_T_52 | (_csignals_T_54 | (_csignals_T_56 | _csignals_T_149))))))))))))))))))))))))))); // @[Lookup.scala 33:37]
  wire  _csignals_T_217 = _csignals_T_38 ? 1'h0 : _csignals_T_40 | (_csignals_T_42 | (_csignals_T_44 | (_csignals_T_46
     | (_csignals_T_48 | (_csignals_T_50 | (_csignals_T_52 | (_csignals_T_54 | _csignals_T_56))))))); // @[Lookup.scala 33:37]
  wire  _csignals_T_218 = _csignals_T_36 ? 1'h0 : _csignals_T_217; // @[Lookup.scala 33:37]
  wire  _csignals_T_219 = _csignals_T_34 ? 1'h0 : _csignals_T_218; // @[Lookup.scala 33:37]
  wire  _csignals_T_220 = _csignals_T_32 ? 1'h0 : _csignals_T_219; // @[Lookup.scala 33:37]
  wire  _csignals_T_221 = _csignals_T_30 ? 1'h0 : _csignals_T_220; // @[Lookup.scala 33:37]
  wire  _csignals_T_222 = _csignals_T_28 ? 1'h0 : _csignals_T_221; // @[Lookup.scala 33:37]
  wire  _csignals_T_223 = _csignals_T_26 ? 1'h0 : _csignals_T_222; // @[Lookup.scala 33:37]
  wire  _csignals_T_224 = _csignals_T_24 ? 1'h0 : _csignals_T_223; // @[Lookup.scala 33:37]
  wire  _csignals_T_225 = _csignals_T_22 ? 1'h0 : _csignals_T_224; // @[Lookup.scala 33:37]
  wire  _csignals_T_226 = _csignals_T_20 ? 1'h0 : _csignals_T_225; // @[Lookup.scala 33:37]
  wire  _csignals_T_227 = _csignals_T_18 ? 1'h0 : _csignals_T_226; // @[Lookup.scala 33:37]
  wire  _csignals_T_228 = _csignals_T_16 ? 1'h0 : _csignals_T_227; // @[Lookup.scala 33:37]
  wire  _csignals_T_229 = _csignals_T_14 ? 1'h0 : _csignals_T_228; // @[Lookup.scala 33:37]
  wire  _csignals_T_230 = _csignals_T_12 ? 1'h0 : _csignals_T_229; // @[Lookup.scala 33:37]
  wire  _csignals_T_231 = _csignals_T_10 ? 1'h0 : _csignals_T_230; // @[Lookup.scala 33:37]
  wire  _csignals_T_232 = _csignals_T_8 ? 1'h0 : _csignals_T_231; // @[Lookup.scala 33:37]
  wire  _csignals_T_233 = _csignals_T_6 ? 1'h0 : _csignals_T_232; // @[Lookup.scala 33:37]
  wire  _csignals_T_234 = _csignals_T_4 ? 1'h0 : _csignals_T_233; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_237 = _csignals_T_114 ? 3'h3 : 3'h0; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_238 = _csignals_T_112 ? 3'h3 : _csignals_T_237; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_239 = _csignals_T_110 ? 3'h3 : _csignals_T_238; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_240 = _csignals_T_108 ? 3'h3 : _csignals_T_239; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_241 = _csignals_T_106 ? 3'h3 : _csignals_T_240; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_242 = _csignals_T_104 ? 3'h3 : _csignals_T_241; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_243 = _csignals_T_102 ? 3'h3 : _csignals_T_242; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_244 = _csignals_T_100 ? 3'h3 : _csignals_T_243; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_245 = _csignals_T_98 ? 3'h1 : _csignals_T_244; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_246 = _csignals_T_96 ? 3'h1 : _csignals_T_245; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_247 = _csignals_T_94 ? 3'h2 : _csignals_T_246; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_248 = _csignals_T_92 ? 3'h2 : _csignals_T_247; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_249 = _csignals_T_90 ? 3'h2 : _csignals_T_248; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_250 = _csignals_T_88 ? 3'h2 : _csignals_T_249; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_251 = _csignals_T_86 ? 3'h2 : _csignals_T_250; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_252 = _csignals_T_84 ? 3'h2 : _csignals_T_251; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_253 = _csignals_T_82 ? 3'h2 : _csignals_T_252; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_254 = _csignals_T_80 ? 3'h2 : _csignals_T_253; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_255 = _csignals_T_78 ? 3'h2 : _csignals_T_254; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_256 = _csignals_T_76 ? 3'h2 : _csignals_T_255; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_257 = _csignals_T_74 ? 3'h2 : _csignals_T_256; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_258 = _csignals_T_72 ? 3'h4 : _csignals_T_257; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_259 = _csignals_T_70 ? 3'h4 : _csignals_T_258; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_260 = _csignals_T_68 ? 3'h4 : _csignals_T_259; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_261 = _csignals_T_66 ? 3'h4 : _csignals_T_260; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_262 = _csignals_T_64 ? 3'h4 : _csignals_T_261; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_263 = _csignals_T_62 ? 3'h4 : _csignals_T_262; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_264 = _csignals_T_60 ? 3'h4 : _csignals_T_263; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_265 = _csignals_T_58 ? 3'h4 : _csignals_T_264; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_266 = _csignals_T_56 ? 3'h1 : _csignals_T_265; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_267 = _csignals_T_54 ? 3'h1 : _csignals_T_266; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_268 = _csignals_T_52 ? 3'h1 : _csignals_T_267; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_269 = _csignals_T_50 ? 3'h1 : _csignals_T_268; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_270 = _csignals_T_48 ? 3'h1 : _csignals_T_269; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_271 = _csignals_T_46 ? 3'h1 : _csignals_T_270; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_272 = _csignals_T_44 ? 3'h1 : _csignals_T_271; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_273 = _csignals_T_42 ? 3'h1 : _csignals_T_272; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_274 = _csignals_T_40 ? 3'h1 : _csignals_T_273; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_275 = _csignals_T_38 ? 3'h1 : _csignals_T_274; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_276 = _csignals_T_36 ? 3'h1 : _csignals_T_275; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_277 = _csignals_T_34 ? 3'h1 : _csignals_T_276; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_278 = _csignals_T_32 ? 3'h1 : _csignals_T_277; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_279 = _csignals_T_30 ? 3'h1 : _csignals_T_278; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_280 = _csignals_T_28 ? 3'h1 : _csignals_T_279; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_281 = _csignals_T_26 ? 3'h1 : _csignals_T_280; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_282 = _csignals_T_24 ? 3'h1 : _csignals_T_281; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_283 = _csignals_T_22 ? 3'h1 : _csignals_T_282; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_284 = _csignals_T_20 ? 3'h1 : _csignals_T_283; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_285 = _csignals_T_18 ? 3'h1 : _csignals_T_284; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_286 = _csignals_T_16 ? 3'h1 : _csignals_T_285; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_287 = _csignals_T_14 ? 3'h1 : _csignals_T_286; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_288 = _csignals_T_12 ? 3'h1 : _csignals_T_287; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_289 = _csignals_T_10 ? 3'h1 : _csignals_T_288; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_290 = _csignals_T_8 ? 3'h1 : _csignals_T_289; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_291 = _csignals_T_6 ? 3'h1 : _csignals_T_290; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_292 = _csignals_T_4 ? 3'h1 : _csignals_T_291; // @[Lookup.scala 33:37]
  wire [3:0] _csignals_T_295 = _csignals_T_114 ? 4'h4 : 4'h0; // @[Lookup.scala 33:37]
  wire [3:0] _csignals_T_296 = _csignals_T_112 ? 4'h4 : _csignals_T_295; // @[Lookup.scala 33:37]
  wire [3:0] _csignals_T_297 = _csignals_T_110 ? 4'h3 : _csignals_T_296; // @[Lookup.scala 33:37]
  wire [3:0] _csignals_T_298 = _csignals_T_108 ? 4'h2 : _csignals_T_297; // @[Lookup.scala 33:37]
  wire [3:0] _csignals_T_299 = _csignals_T_106 ? 4'h1 : _csignals_T_298; // @[Lookup.scala 33:37]
  wire [3:0] _csignals_T_300 = _csignals_T_104 ? 4'h3 : _csignals_T_299; // @[Lookup.scala 33:37]
  wire [3:0] _csignals_T_301 = _csignals_T_102 ? 4'h2 : _csignals_T_300; // @[Lookup.scala 33:37]
  wire [3:0] _csignals_T_302 = _csignals_T_100 ? 4'h1 : _csignals_T_301; // @[Lookup.scala 33:37]
  wire [3:0] _csignals_T_303 = _csignals_T_98 ? 4'h1 : _csignals_T_302; // @[Lookup.scala 33:37]
  wire [3:0] _csignals_T_304 = _csignals_T_96 ? 4'h1 : _csignals_T_303; // @[Lookup.scala 33:37]
  wire [3:0] _csignals_T_305 = _csignals_T_94 ? 4'he : _csignals_T_304; // @[Lookup.scala 33:37]
  wire [3:0] _csignals_T_306 = _csignals_T_92 ? 4'hc : _csignals_T_305; // @[Lookup.scala 33:37]
  wire [3:0] _csignals_T_307 = _csignals_T_90 ? 4'ha : _csignals_T_306; // @[Lookup.scala 33:37]
  wire [3:0] _csignals_T_308 = _csignals_T_88 ? 4'h8 : _csignals_T_307; // @[Lookup.scala 33:37]
  wire [3:0] _csignals_T_309 = _csignals_T_86 ? 4'h6 : _csignals_T_308; // @[Lookup.scala 33:37]
  wire [3:0] _csignals_T_310 = _csignals_T_84 ? 4'h5 : _csignals_T_309; // @[Lookup.scala 33:37]
  wire [3:0] _csignals_T_311 = _csignals_T_82 ? 4'h4 : _csignals_T_310; // @[Lookup.scala 33:37]
  wire [3:0] _csignals_T_312 = _csignals_T_80 ? 4'h3 : _csignals_T_311; // @[Lookup.scala 33:37]
  wire [3:0] _csignals_T_313 = _csignals_T_78 ? 4'h2 : _csignals_T_312; // @[Lookup.scala 33:37]
  wire [3:0] _csignals_T_314 = _csignals_T_76 ? 4'h1 : _csignals_T_313; // @[Lookup.scala 33:37]
  wire [3:0] _csignals_T_315 = _csignals_T_74 ? 4'h0 : _csignals_T_314; // @[Lookup.scala 33:37]
  wire [3:0] _csignals_T_316 = _csignals_T_72 ? 4'h8 : _csignals_T_315; // @[Lookup.scala 33:37]
  wire [3:0] _csignals_T_317 = _csignals_T_70 ? 4'h7 : _csignals_T_316; // @[Lookup.scala 33:37]
  wire [3:0] _csignals_T_318 = _csignals_T_68 ? 4'h6 : _csignals_T_317; // @[Lookup.scala 33:37]
  wire [3:0] _csignals_T_319 = _csignals_T_66 ? 4'h5 : _csignals_T_318; // @[Lookup.scala 33:37]
  wire [3:0] _csignals_T_320 = _csignals_T_64 ? 4'h4 : _csignals_T_319; // @[Lookup.scala 33:37]
  wire [3:0] _csignals_T_321 = _csignals_T_62 ? 4'h3 : _csignals_T_320; // @[Lookup.scala 33:37]
  wire [3:0] _csignals_T_322 = _csignals_T_60 ? 4'h2 : _csignals_T_321; // @[Lookup.scala 33:37]
  wire [3:0] _csignals_T_323 = _csignals_T_58 ? 4'h1 : _csignals_T_322; // @[Lookup.scala 33:37]
  wire [3:0] _csignals_T_324 = _csignals_T_56 ? 4'h5 : _csignals_T_323; // @[Lookup.scala 33:37]
  wire [3:0] _csignals_T_325 = _csignals_T_54 ? 4'h4 : _csignals_T_324; // @[Lookup.scala 33:37]
  wire [3:0] _csignals_T_326 = _csignals_T_52 ? 4'h3 : _csignals_T_325; // @[Lookup.scala 33:37]
  wire [3:0] _csignals_T_327 = _csignals_T_50 ? 4'h2 : _csignals_T_326; // @[Lookup.scala 33:37]
  wire [3:0] _csignals_T_328 = _csignals_T_48 ? 4'h1 : _csignals_T_327; // @[Lookup.scala 33:37]
  wire [3:0] _csignals_T_329 = _csignals_T_46 ? 4'h5 : _csignals_T_328; // @[Lookup.scala 33:37]
  wire [3:0] _csignals_T_330 = _csignals_T_44 ? 4'h4 : _csignals_T_329; // @[Lookup.scala 33:37]
  wire [3:0] _csignals_T_331 = _csignals_T_42 ? 4'h3 : _csignals_T_330; // @[Lookup.scala 33:37]
  wire [3:0] _csignals_T_332 = _csignals_T_40 ? 4'h1 : _csignals_T_331; // @[Lookup.scala 33:37]
  wire [3:0] _csignals_T_333 = _csignals_T_38 ? 4'h4 : _csignals_T_332; // @[Lookup.scala 33:37]
  wire [3:0] _csignals_T_334 = _csignals_T_36 ? 4'h5 : _csignals_T_333; // @[Lookup.scala 33:37]
  wire [3:0] _csignals_T_335 = _csignals_T_34 ? 4'h3 : _csignals_T_334; // @[Lookup.scala 33:37]
  wire [3:0] _csignals_T_336 = _csignals_T_32 ? 4'ha : _csignals_T_335; // @[Lookup.scala 33:37]
  wire [3:0] _csignals_T_337 = _csignals_T_30 ? 4'h9 : _csignals_T_336; // @[Lookup.scala 33:37]
  wire [3:0] _csignals_T_338 = _csignals_T_28 ? 4'h8 : _csignals_T_337; // @[Lookup.scala 33:37]
  wire [3:0] _csignals_T_339 = _csignals_T_26 ? 4'h7 : _csignals_T_338; // @[Lookup.scala 33:37]
  wire [3:0] _csignals_T_340 = _csignals_T_24 ? 4'h6 : _csignals_T_339; // @[Lookup.scala 33:37]
  wire [3:0] _csignals_T_341 = _csignals_T_22 ? 4'h1 : _csignals_T_340; // @[Lookup.scala 33:37]
  wire [3:0] _csignals_T_342 = _csignals_T_20 ? 4'h4 : _csignals_T_341; // @[Lookup.scala 33:37]
  wire [3:0] _csignals_T_343 = _csignals_T_18 ? 4'h5 : _csignals_T_342; // @[Lookup.scala 33:37]
  wire [3:0] _csignals_T_344 = _csignals_T_16 ? 4'h8 : _csignals_T_343; // @[Lookup.scala 33:37]
  wire [3:0] _csignals_T_345 = _csignals_T_14 ? 4'h7 : _csignals_T_344; // @[Lookup.scala 33:37]
  wire [3:0] _csignals_T_346 = _csignals_T_12 ? 4'h6 : _csignals_T_345; // @[Lookup.scala 33:37]
  wire [3:0] _csignals_T_347 = _csignals_T_10 ? 4'ha : _csignals_T_346; // @[Lookup.scala 33:37]
  wire [3:0] _csignals_T_348 = _csignals_T_8 ? 4'h9 : _csignals_T_347; // @[Lookup.scala 33:37]
  wire [3:0] _csignals_T_349 = _csignals_T_6 ? 4'h2 : _csignals_T_348; // @[Lookup.scala 33:37]
  wire [3:0] _csignals_T_350 = _csignals_T_4 ? 4'h1 : _csignals_T_349; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_358 = _csignals_T_104 ? 2'h1 : 2'h0; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_359 = _csignals_T_102 ? 2'h1 : _csignals_T_358; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_360 = _csignals_T_100 ? 2'h1 : _csignals_T_359; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_361 = _csignals_T_98 ? 2'h0 : _csignals_T_360; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_362 = _csignals_T_96 ? 2'h2 : _csignals_T_361; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_363 = _csignals_T_94 ? 2'h1 : _csignals_T_362; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_364 = _csignals_T_92 ? 2'h1 : _csignals_T_363; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_365 = _csignals_T_90 ? 2'h1 : _csignals_T_364; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_366 = _csignals_T_88 ? 2'h1 : _csignals_T_365; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_367 = _csignals_T_86 ? 2'h1 : _csignals_T_366; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_368 = _csignals_T_84 ? 2'h1 : _csignals_T_367; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_369 = _csignals_T_82 ? 2'h1 : _csignals_T_368; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_370 = _csignals_T_80 ? 2'h1 : _csignals_T_369; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_371 = _csignals_T_78 ? 2'h1 : _csignals_T_370; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_372 = _csignals_T_76 ? 2'h1 : _csignals_T_371; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_373 = _csignals_T_74 ? 2'h1 : _csignals_T_372; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_374 = _csignals_T_72 ? 2'h1 : _csignals_T_373; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_375 = _csignals_T_70 ? 2'h1 : _csignals_T_374; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_376 = _csignals_T_68 ? 2'h1 : _csignals_T_375; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_377 = _csignals_T_66 ? 2'h1 : _csignals_T_376; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_378 = _csignals_T_64 ? 2'h1 : _csignals_T_377; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_379 = _csignals_T_62 ? 2'h1 : _csignals_T_378; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_380 = _csignals_T_60 ? 2'h1 : _csignals_T_379; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_381 = _csignals_T_58 ? 2'h2 : _csignals_T_380; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_382 = _csignals_T_56 ? 2'h1 : _csignals_T_381; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_383 = _csignals_T_54 ? 2'h1 : _csignals_T_382; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_384 = _csignals_T_52 ? 2'h1 : _csignals_T_383; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_385 = _csignals_T_50 ? 2'h1 : _csignals_T_384; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_386 = _csignals_T_48 ? 2'h1 : _csignals_T_385; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_387 = _csignals_T_46 ? 2'h1 : _csignals_T_386; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_388 = _csignals_T_44 ? 2'h1 : _csignals_T_387; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_389 = _csignals_T_42 ? 2'h1 : _csignals_T_388; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_390 = _csignals_T_40 ? 2'h1 : _csignals_T_389; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_391 = _csignals_T_38 ? 2'h1 : _csignals_T_390; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_392 = _csignals_T_36 ? 2'h1 : _csignals_T_391; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_393 = _csignals_T_34 ? 2'h1 : _csignals_T_392; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_394 = _csignals_T_32 ? 2'h1 : _csignals_T_393; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_395 = _csignals_T_30 ? 2'h1 : _csignals_T_394; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_396 = _csignals_T_28 ? 2'h1 : _csignals_T_395; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_397 = _csignals_T_26 ? 2'h1 : _csignals_T_396; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_398 = _csignals_T_24 ? 2'h1 : _csignals_T_397; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_399 = _csignals_T_22 ? 2'h1 : _csignals_T_398; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_400 = _csignals_T_20 ? 2'h1 : _csignals_T_399; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_401 = _csignals_T_18 ? 2'h1 : _csignals_T_400; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_402 = _csignals_T_16 ? 2'h1 : _csignals_T_401; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_403 = _csignals_T_14 ? 2'h1 : _csignals_T_402; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_404 = _csignals_T_12 ? 2'h1 : _csignals_T_403; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_405 = _csignals_T_10 ? 2'h1 : _csignals_T_404; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_406 = _csignals_T_8 ? 2'h1 : _csignals_T_405; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_407 = _csignals_T_6 ? 2'h1 : _csignals_T_406; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_408 = _csignals_T_4 ? 2'h1 : _csignals_T_407; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_413 = _csignals_T_110 ? 2'h3 : 2'h0; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_414 = _csignals_T_108 ? 2'h3 : _csignals_T_413; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_415 = _csignals_T_106 ? 2'h3 : _csignals_T_414; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_416 = _csignals_T_104 ? 2'h0 : _csignals_T_415; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_417 = _csignals_T_102 ? 2'h0 : _csignals_T_416; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_418 = _csignals_T_100 ? 2'h0 : _csignals_T_417; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_419 = _csignals_T_98 ? 2'h3 : _csignals_T_418; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_420 = _csignals_T_96 ? 2'h3 : _csignals_T_419; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_421 = _csignals_T_94 ? 2'h1 : _csignals_T_420; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_422 = _csignals_T_92 ? 2'h1 : _csignals_T_421; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_423 = _csignals_T_90 ? 2'h1 : _csignals_T_422; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_424 = _csignals_T_88 ? 2'h1 : _csignals_T_423; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_425 = _csignals_T_86 ? 2'h3 : _csignals_T_424; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_426 = _csignals_T_84 ? 2'h3 : _csignals_T_425; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_427 = _csignals_T_82 ? 2'h3 : _csignals_T_426; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_428 = _csignals_T_80 ? 2'h3 : _csignals_T_427; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_429 = _csignals_T_78 ? 2'h3 : _csignals_T_428; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_430 = _csignals_T_76 ? 2'h3 : _csignals_T_429; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_431 = _csignals_T_74 ? 2'h3 : _csignals_T_430; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_432 = _csignals_T_72 ? 2'h1 : _csignals_T_431; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_433 = _csignals_T_70 ? 2'h1 : _csignals_T_432; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_434 = _csignals_T_68 ? 2'h1 : _csignals_T_433; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_435 = _csignals_T_66 ? 2'h1 : _csignals_T_434; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_436 = _csignals_T_64 ? 2'h1 : _csignals_T_435; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_437 = _csignals_T_62 ? 2'h1 : _csignals_T_436; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_438 = _csignals_T_60 ? 2'h0 : _csignals_T_437; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_439 = _csignals_T_58 ? 2'h3 : _csignals_T_438; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_440 = _csignals_T_56 ? 2'h1 : _csignals_T_439; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_441 = _csignals_T_54 ? 2'h1 : _csignals_T_440; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_442 = _csignals_T_52 ? 2'h1 : _csignals_T_441; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_443 = _csignals_T_50 ? 2'h1 : _csignals_T_442; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_444 = _csignals_T_48 ? 2'h1 : _csignals_T_443; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_445 = _csignals_T_46 ? 2'h3 : _csignals_T_444; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_446 = _csignals_T_44 ? 2'h3 : _csignals_T_445; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_447 = _csignals_T_42 ? 2'h3 : _csignals_T_446; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_448 = _csignals_T_40 ? 2'h3 : _csignals_T_447; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_449 = _csignals_T_38 ? 2'h3 : _csignals_T_448; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_450 = _csignals_T_36 ? 2'h3 : _csignals_T_449; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_451 = _csignals_T_34 ? 2'h3 : _csignals_T_450; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_452 = _csignals_T_32 ? 2'h3 : _csignals_T_451; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_453 = _csignals_T_30 ? 2'h3 : _csignals_T_452; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_454 = _csignals_T_28 ? 2'h3 : _csignals_T_453; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_455 = _csignals_T_26 ? 2'h3 : _csignals_T_454; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_456 = _csignals_T_24 ? 2'h3 : _csignals_T_455; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_457 = _csignals_T_22 ? 2'h3 : _csignals_T_456; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_458 = _csignals_T_20 ? 2'h1 : _csignals_T_457; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_459 = _csignals_T_18 ? 2'h1 : _csignals_T_458; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_460 = _csignals_T_16 ? 2'h1 : _csignals_T_459; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_461 = _csignals_T_14 ? 2'h1 : _csignals_T_460; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_462 = _csignals_T_12 ? 2'h1 : _csignals_T_461; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_463 = _csignals_T_10 ? 2'h1 : _csignals_T_462; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_464 = _csignals_T_8 ? 2'h1 : _csignals_T_463; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_465 = _csignals_T_6 ? 2'h1 : _csignals_T_464; // @[Lookup.scala 33:37]
  wire [1:0] _csignals_T_466 = _csignals_T_4 ? 2'h1 : _csignals_T_465; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_471 = _csignals_T_110 ? 3'h7 : 3'h0; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_472 = _csignals_T_108 ? 3'h7 : _csignals_T_471; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_473 = _csignals_T_106 ? 3'h7 : _csignals_T_472; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_474 = _csignals_T_104 ? 3'h0 : _csignals_T_473; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_475 = _csignals_T_102 ? 3'h0 : _csignals_T_474; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_476 = _csignals_T_100 ? 3'h0 : _csignals_T_475; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_477 = _csignals_T_98 ? 3'h4 : _csignals_T_476; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_478 = _csignals_T_96 ? 3'h4 : _csignals_T_477; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_479 = _csignals_T_94 ? 3'h2 : _csignals_T_478; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_480 = _csignals_T_92 ? 3'h2 : _csignals_T_479; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_481 = _csignals_T_90 ? 3'h2 : _csignals_T_480; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_482 = _csignals_T_88 ? 3'h2 : _csignals_T_481; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_483 = _csignals_T_86 ? 3'h1 : _csignals_T_482; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_484 = _csignals_T_84 ? 3'h1 : _csignals_T_483; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_485 = _csignals_T_82 ? 3'h1 : _csignals_T_484; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_486 = _csignals_T_80 ? 3'h1 : _csignals_T_485; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_487 = _csignals_T_78 ? 3'h1 : _csignals_T_486; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_488 = _csignals_T_76 ? 3'h1 : _csignals_T_487; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_489 = _csignals_T_74 ? 3'h1 : _csignals_T_488; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_490 = _csignals_T_72 ? 3'h3 : _csignals_T_489; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_491 = _csignals_T_70 ? 3'h3 : _csignals_T_490; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_492 = _csignals_T_68 ? 3'h3 : _csignals_T_491; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_493 = _csignals_T_66 ? 3'h3 : _csignals_T_492; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_494 = _csignals_T_64 ? 3'h3 : _csignals_T_493; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_495 = _csignals_T_62 ? 3'h3 : _csignals_T_494; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_496 = _csignals_T_60 ? 3'h1 : _csignals_T_495; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_497 = _csignals_T_58 ? 3'h5 : _csignals_T_496; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_498 = _csignals_T_56 ? 3'h0 : _csignals_T_497; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_499 = _csignals_T_54 ? 3'h0 : _csignals_T_498; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_500 = _csignals_T_52 ? 3'h0 : _csignals_T_499; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_501 = _csignals_T_50 ? 3'h0 : _csignals_T_500; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_502 = _csignals_T_48 ? 3'h0 : _csignals_T_501; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_503 = _csignals_T_46 ? 3'h1 : _csignals_T_502; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_504 = _csignals_T_44 ? 3'h1 : _csignals_T_503; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_505 = _csignals_T_42 ? 3'h1 : _csignals_T_504; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_506 = _csignals_T_40 ? 3'h1 : _csignals_T_505; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_507 = _csignals_T_38 ? 3'h1 : _csignals_T_506; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_508 = _csignals_T_36 ? 3'h1 : _csignals_T_507; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_509 = _csignals_T_34 ? 3'h1 : _csignals_T_508; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_510 = _csignals_T_32 ? 3'h1 : _csignals_T_509; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_511 = _csignals_T_30 ? 3'h1 : _csignals_T_510; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_512 = _csignals_T_28 ? 3'h1 : _csignals_T_511; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_513 = _csignals_T_26 ? 3'h1 : _csignals_T_512; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_514 = _csignals_T_24 ? 3'h1 : _csignals_T_513; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_515 = _csignals_T_22 ? 3'h1 : _csignals_T_514; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_516 = _csignals_T_20 ? 3'h0 : _csignals_T_515; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_517 = _csignals_T_18 ? 3'h0 : _csignals_T_516; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_518 = _csignals_T_16 ? 3'h0 : _csignals_T_517; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_519 = _csignals_T_14 ? 3'h0 : _csignals_T_518; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_520 = _csignals_T_12 ? 3'h0 : _csignals_T_519; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_521 = _csignals_T_10 ? 3'h0 : _csignals_T_520; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_522 = _csignals_T_8 ? 3'h0 : _csignals_T_521; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_523 = _csignals_T_6 ? 3'h0 : _csignals_T_522; // @[Lookup.scala 33:37]
  wire [2:0] _csignals_T_524 = _csignals_T_4 ? 3'h0 : _csignals_T_523; // @[Lookup.scala 33:37]
  wire [2:0] cs0_2 = _csignals_T_2 ? 3'h0 : _csignals_T_524; // @[Lookup.scala 33:37]
  wire  _csignals_T_537 = _csignals_T_94 ? 1'h0 : _csignals_T_96 | (_csignals_T_98 | (_csignals_T_100 | (_csignals_T_102
     | (_csignals_T_104 | (_csignals_T_106 | (_csignals_T_108 | _csignals_T_110)))))); // @[Lookup.scala 33:37]
  wire  _csignals_T_538 = _csignals_T_92 ? 1'h0 : _csignals_T_537; // @[Lookup.scala 33:37]
  wire  _csignals_T_539 = _csignals_T_90 ? 1'h0 : _csignals_T_538; // @[Lookup.scala 33:37]
  wire  _csignals_T_540 = _csignals_T_88 ? 1'h0 : _csignals_T_539; // @[Lookup.scala 33:37]
  wire  _csignals_T_548 = _csignals_T_72 ? 1'h0 : _csignals_T_74 | (_csignals_T_76 | (_csignals_T_78 | (_csignals_T_80
     | (_csignals_T_82 | (_csignals_T_84 | (_csignals_T_86 | _csignals_T_540)))))); // @[Lookup.scala 33:37]
  wire  _csignals_T_549 = _csignals_T_70 ? 1'h0 : _csignals_T_548; // @[Lookup.scala 33:37]
  wire  _csignals_T_550 = _csignals_T_68 ? 1'h0 : _csignals_T_549; // @[Lookup.scala 33:37]
  wire  _csignals_T_551 = _csignals_T_66 ? 1'h0 : _csignals_T_550; // @[Lookup.scala 33:37]
  wire  _csignals_T_552 = _csignals_T_64 ? 1'h0 : _csignals_T_551; // @[Lookup.scala 33:37]
  wire  _csignals_T_553 = _csignals_T_62 ? 1'h0 : _csignals_T_552; // @[Lookup.scala 33:37]
  wire [51:0] immm_hi = io_inst[31] ? 52'hfffffffffffff : 52'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _immm_T_2 = {immm_hi,imm}; // @[Cat.scala 30:58]
  wire [6:0] immm_hi_lo = io_inst[31:25]; // @[IDU.scala 109:49]
  wire [63:0] _immm_T_5 = {immm_hi,immm_hi_lo,rd}; // @[Cat.scala 30:58]
  wire  immm_hi_hi_lo = io_inst[7]; // @[IDU.scala 110:49]
  wire [5:0] immm_hi_lo_1 = io_inst[30:25]; // @[IDU.scala 110:57]
  wire [3:0] immm_lo_hi = io_inst[11:8]; // @[IDU.scala 110:69]
  wire [63:0] _immm_T_8 = {immm_hi,immm_hi_hi_lo,immm_hi_lo_1,immm_lo_hi,1'h0}; // @[Cat.scala 30:58]
  wire [31:0] immm_hi_hi_2 = io_inst[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [19:0] immm_hi_lo_2 = io_inst[31:12]; // @[IDU.scala 111:49]
  wire [63:0] _immm_T_11 = {immm_hi_hi_2,immm_hi_lo_2,12'h0}; // @[Cat.scala 30:58]
  wire [43:0] immm_hi_hi_hi_1 = io_inst[31] ? 44'hfffffffffff : 44'h0; // @[Bitwise.scala 72:12]
  wire [7:0] immm_hi_hi_lo_1 = io_inst[19:12]; // @[IDU.scala 112:49]
  wire  immm_hi_lo_3 = io_inst[20]; // @[IDU.scala 112:62]
  wire [9:0] immm_lo_hi_1 = io_inst[30:21]; // @[IDU.scala 112:71]
  wire [63:0] _immm_T_14 = {immm_hi_hi_hi_1,immm_hi_hi_lo_1,immm_hi_lo_3,immm_lo_hi_1,1'h0}; // @[Cat.scala 30:58]
  wire [63:0] _immm_T_15 = {59'h0,rs1}; // @[Cat.scala 30:58]
  wire [63:0] _immm_T_17 = 3'h1 == cs0_2 ? _immm_T_2 : 64'h0; // @[Mux.scala 80:57]
  wire [63:0] _immm_T_19 = 3'h2 == cs0_2 ? _immm_T_5 : _immm_T_17; // @[Mux.scala 80:57]
  wire [63:0] _immm_T_21 = 3'h3 == cs0_2 ? _immm_T_8 : _immm_T_19; // @[Mux.scala 80:57]
  wire [63:0] _immm_T_23 = 3'h4 == cs0_2 ? _immm_T_11 : _immm_T_21; // @[Mux.scala 80:57]
  wire [63:0] _immm_T_25 = 3'h5 == cs0_2 ? _immm_T_14 : _immm_T_23; // @[Mux.scala 80:57]
  wire  _T_1 = ~cs_valid & io_valid; // @[IDU.scala 132:37]
  assign io_issue_valid = io_valid & cs_valid; // @[IDU.scala 120:37]
  assign io_issue_prejump = io_prejump; // @[IDU.scala 119:25]
  assign io_issue_pc = io_pc; // @[IDU.scala 117:25]
  assign io_issue_inst = io_inst; // @[IDU.scala 118:25]
  assign io_issue_func_type = _csignals_T_2 ? 3'h1 : _csignals_T_292; // @[Lookup.scala 33:37]
  assign io_issue_func_mode = _csignals_T_2 ? 4'h3 : _csignals_T_350; // @[Lookup.scala 33:37]
  assign io_issue_rf_raddr1 = io_inst[19:15]; // @[IDU.scala 20:22]
  assign io_issue_rf_raddr2 = io_inst[24:20]; // @[IDU.scala 22:22]
  assign io_issue_opsrc1 = _csignals_T_2 ? 2'h1 : _csignals_T_408; // @[Lookup.scala 33:37]
  assign io_issue_opsrc2 = _csignals_T_2 ? 2'h1 : _csignals_T_466; // @[Lookup.scala 33:37]
  assign io_issue_imm = 3'h7 == cs0_2 ? _immm_T_15 : _immm_T_25; // @[Mux.scala 80:57]
  assign io_issue_rv64w = _csignals_T_2 ? 1'h0 : _csignals_T_234; // @[Lookup.scala 33:37]
  assign io_issue_rf_wen = _csignals_T_2 | (_csignals_T_4 | (_csignals_T_6 | (_csignals_T_8 | (_csignals_T_10 | (
    _csignals_T_12 | (_csignals_T_14 | (_csignals_T_16 | (_csignals_T_18 | (_csignals_T_20 | (_csignals_T_22 | (
    _csignals_T_24 | (_csignals_T_26 | (_csignals_T_28 | (_csignals_T_30 | (_csignals_T_32 | (_csignals_T_34 | (
    _csignals_T_36 | (_csignals_T_38 | (_csignals_T_40 | (_csignals_T_42 | (_csignals_T_44 | (_csignals_T_46 | (
    _csignals_T_48 | (_csignals_T_50 | (_csignals_T_52 | (_csignals_T_54 | (_csignals_T_56 | (_csignals_T_58 | (
    _csignals_T_60 | _csignals_T_553))))))))))))))))))))))))))))); // @[Lookup.scala 33:37]
  assign io_issue_rf_waddr = io_inst[11:7]; // @[IDU.scala 18:22]
  assign _T_1_0 = _T_1;
endmodule
module ysyx_210232_ALU(
  input  [63:0] io_op1,
  input  [63:0] io_op2,
  input         io_rv64w,
  input  [3:0]  io_mode,
  output [63:0] io_out
);
  wire [5:0] shamt = io_op2[5:0]; // @[ALU.scala 18:22]
  wire [31:0] srl_1 = io_op1[31:0] >> shamt[4:0]; // @[ALU.scala 20:28]
  wire [31:0] sra_1 = $signed(io_op1[31:0]) >>> shamt[4:0]; // @[ALU.scala 21:51]
  wire [31:0] sll_1 = io_op1[31:0] << shamt[4:0]; // @[ALU.scala 22:51]
  wire [63:0] sll_0 = io_op1 << shamt; // @[ALU.scala 24:51]
  wire [63:0] sra_0 = $signed(io_op1) >>> shamt; // @[ALU.scala 25:51]
  wire [63:0] srl_0 = io_op1 >> shamt; // @[ALU.scala 26:22]
  wire [63:0] _sll_out_T = {32'h0,sll_1}; // @[Cat.scala 30:58]
  wire [63:0] sll_out = io_rv64w ? _sll_out_T : sll_0; // @[ALU.scala 28:22]
  wire [31:0] sra_out_hi = sra_1[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _sra_out_T_2 = {sra_out_hi,sra_1}; // @[Cat.scala 30:58]
  wire [63:0] sra_out = io_rv64w ? _sra_out_T_2 : sra_0; // @[ALU.scala 29:22]
  wire [63:0] _srl_out_T = {32'h0,srl_1}; // @[Cat.scala 30:58]
  wire [63:0] srl_out = io_rv64w ? _srl_out_T : srl_0; // @[ALU.scala 30:22]
  wire [63:0] _culout_T_1 = io_op1 + io_op2; // @[ALU.scala 33:26]
  wire [63:0] _culout_T_3 = io_op1 - io_op2; // @[ALU.scala 34:26]
  wire [63:0] _culout_T_4 = io_op1 & io_op2; // @[ALU.scala 35:26]
  wire [63:0] _culout_T_5 = io_op1 | io_op2; // @[ALU.scala 36:26]
  wire [63:0] _culout_T_6 = io_op1 ^ io_op2; // @[ALU.scala 37:26]
  wire  _culout_T_9 = $signed(io_op1) < $signed(io_op2); // @[ALU.scala 38:35]
  wire  _culout_T_10 = io_op1 < io_op2; // @[ALU.scala 39:26]
  wire [63:0] _culout_T_12 = 4'h1 == io_mode ? _culout_T_1 : 64'h0; // @[Mux.scala 80:57]
  wire [63:0] _culout_T_14 = 4'h2 == io_mode ? _culout_T_3 : _culout_T_12; // @[Mux.scala 80:57]
  wire [63:0] _culout_T_16 = 4'h6 == io_mode ? _culout_T_4 : _culout_T_14; // @[Mux.scala 80:57]
  wire [63:0] _culout_T_18 = 4'h7 == io_mode ? _culout_T_5 : _culout_T_16; // @[Mux.scala 80:57]
  wire [63:0] _culout_T_20 = 4'h8 == io_mode ? _culout_T_6 : _culout_T_18; // @[Mux.scala 80:57]
  wire [63:0] _culout_T_22 = 4'h9 == io_mode ? {{63'd0}, _culout_T_9} : _culout_T_20; // @[Mux.scala 80:57]
  wire [63:0] _culout_T_24 = 4'ha == io_mode ? {{63'd0}, _culout_T_10} : _culout_T_22; // @[Mux.scala 80:57]
  wire [63:0] _culout_T_26 = 4'h3 == io_mode ? sll_out : _culout_T_24; // @[Mux.scala 80:57]
  wire [63:0] _culout_T_28 = 4'h5 == io_mode ? sra_out : _culout_T_26; // @[Mux.scala 80:57]
  wire [63:0] culout = 4'h4 == io_mode ? srl_out : _culout_T_28; // @[Mux.scala 80:57]
  wire [31:0] io_out_hi = culout[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] io_out_lo = culout[31:0]; // @[ALU.scala 46:58]
  wire [63:0] _io_out_T_2 = {io_out_hi,io_out_lo}; // @[Cat.scala 30:58]
  assign io_out = io_rv64w ? _io_out_T_2 : culout; // @[ALU.scala 46:18]
endmodule
module ysyx_210232_MemProxy(
  input  [2:0]  io_miniaddr,
  input  [2:0]  io_in_wmask,
  input  [63:0] io_in_wdata,
  output [63:0] io_in_rdata,
  output [7:0]  io_out_wmask,
  output [63:0] io_out_wdata,
  input  [63:0] io_out_rdata
);
  wire [7:0] _mskb_T_1 = 3'h1 == io_miniaddr ? 8'h2 : 8'h1; // @[Mux.scala 80:57]
  wire [7:0] _mskb_T_3 = 3'h2 == io_miniaddr ? 8'h4 : _mskb_T_1; // @[Mux.scala 80:57]
  wire [7:0] _mskb_T_5 = 3'h3 == io_miniaddr ? 8'h8 : _mskb_T_3; // @[Mux.scala 80:57]
  wire [7:0] _mskb_T_7 = 3'h4 == io_miniaddr ? 8'h10 : _mskb_T_5; // @[Mux.scala 80:57]
  wire [7:0] _mskb_T_9 = 3'h5 == io_miniaddr ? 8'h20 : _mskb_T_7; // @[Mux.scala 80:57]
  wire [7:0] _mskb_T_11 = 3'h6 == io_miniaddr ? 8'h40 : _mskb_T_9; // @[Mux.scala 80:57]
  wire [7:0] mskb = 3'h7 == io_miniaddr ? 8'h80 : _mskb_T_11; // @[Mux.scala 80:57]
  wire [7:0] wdatb_lo = io_in_wdata[7:0]; // @[LSU.scala 181:39]
  wire [63:0] _wdatb_T = {56'h0,wdatb_lo}; // @[Cat.scala 30:58]
  wire [63:0] _wdatb_T_1 = {48'h0,wdatb_lo,8'h0}; // @[Cat.scala 30:58]
  wire [63:0] _wdatb_T_2 = {40'h0,wdatb_lo,16'h0}; // @[Cat.scala 30:58]
  wire [63:0] _wdatb_T_3 = {32'h0,wdatb_lo,24'h0}; // @[Cat.scala 30:58]
  wire [63:0] _wdatb_T_4 = {24'h0,wdatb_lo,32'h0}; // @[Cat.scala 30:58]
  wire [63:0] _wdatb_T_5 = {16'h0,wdatb_lo,40'h0}; // @[Cat.scala 30:58]
  wire [63:0] _wdatb_T_6 = {8'h0,wdatb_lo,48'h0}; // @[Cat.scala 30:58]
  wire [63:0] _wdatb_T_7 = {wdatb_lo,56'h0}; // @[Cat.scala 30:58]
  wire [63:0] _wdatb_T_9 = 3'h1 == io_miniaddr ? _wdatb_T_1 : _wdatb_T; // @[Mux.scala 80:57]
  wire [63:0] _wdatb_T_11 = 3'h2 == io_miniaddr ? _wdatb_T_2 : _wdatb_T_9; // @[Mux.scala 80:57]
  wire [63:0] _wdatb_T_13 = 3'h3 == io_miniaddr ? _wdatb_T_3 : _wdatb_T_11; // @[Mux.scala 80:57]
  wire [63:0] _wdatb_T_15 = 3'h4 == io_miniaddr ? _wdatb_T_4 : _wdatb_T_13; // @[Mux.scala 80:57]
  wire [63:0] _wdatb_T_17 = 3'h5 == io_miniaddr ? _wdatb_T_5 : _wdatb_T_15; // @[Mux.scala 80:57]
  wire [63:0] _wdatb_T_19 = 3'h6 == io_miniaddr ? _wdatb_T_6 : _wdatb_T_17; // @[Mux.scala 80:57]
  wire [63:0] wdatb = 3'h7 == io_miniaddr ? _wdatb_T_7 : _wdatb_T_19; // @[Mux.scala 80:57]
  wire [7:0] _mskh_T_2 = 2'h1 == io_miniaddr[2:1] ? 8'hc : 8'h3; // @[Mux.scala 80:57]
  wire [7:0] _mskh_T_4 = 2'h2 == io_miniaddr[2:1] ? 8'h30 : _mskh_T_2; // @[Mux.scala 80:57]
  wire [7:0] mskh = 2'h3 == io_miniaddr[2:1] ? 8'hc0 : _mskh_T_4; // @[Mux.scala 80:57]
  wire [15:0] wdath_lo = io_in_wdata[15:0]; // @[LSU.scala 200:39]
  wire [63:0] _wdath_T_1 = {48'h0,wdath_lo}; // @[Cat.scala 30:58]
  wire [63:0] _wdath_T_2 = {32'h0,wdath_lo,16'h0}; // @[Cat.scala 30:58]
  wire [63:0] _wdath_T_3 = {16'h0,wdath_lo,32'h0}; // @[Cat.scala 30:58]
  wire [63:0] _wdath_T_4 = {wdath_lo,48'h0}; // @[Cat.scala 30:58]
  wire [63:0] _wdath_T_6 = 2'h1 == io_miniaddr[2:1] ? _wdath_T_2 : _wdath_T_1; // @[Mux.scala 80:57]
  wire [63:0] _wdath_T_8 = 2'h2 == io_miniaddr[2:1] ? _wdath_T_3 : _wdath_T_6; // @[Mux.scala 80:57]
  wire [63:0] wdath = 2'h3 == io_miniaddr[2:1] ? _wdath_T_4 : _wdath_T_8; // @[Mux.scala 80:57]
  wire [7:0] mskw = io_miniaddr[2] ? 8'hf0 : 8'hf; // @[LSU.scala 207:20]
  wire [31:0] wdatw_hi = io_in_wdata[31:0]; // @[LSU.scala 208:44]
  wire [63:0] _wdatw_T_1 = {wdatw_hi,32'h0}; // @[Cat.scala 30:58]
  wire [63:0] _wdatw_T_2 = {32'h0,wdatw_hi}; // @[Cat.scala 30:58]
  wire [63:0] wdatw = io_miniaddr[2] ? _wdatw_T_1 : _wdatw_T_2; // @[LSU.scala 208:20]
  wire  _io_out_wmask_T_1 = io_in_wmask[2:1] == 2'h0; // @[LSU.scala 211:27]
  wire  _io_out_wmask_T_3 = io_in_wmask[2:1] == 2'h1; // @[LSU.scala 212:27]
  wire  _io_out_wmask_T_5 = io_in_wmask[2:1] == 2'h2; // @[LSU.scala 213:27]
  wire  _io_out_wmask_T_7 = io_in_wmask[2:1] == 2'h3; // @[LSU.scala 214:27]
  wire [7:0] _io_out_wmask_T_8 = _io_out_wmask_T_7 ? 8'hff : 8'h0; // @[Mux.scala 98:16]
  wire [7:0] _io_out_wmask_T_9 = _io_out_wmask_T_5 ? mskw : _io_out_wmask_T_8; // @[Mux.scala 98:16]
  wire [7:0] _io_out_wmask_T_10 = _io_out_wmask_T_3 ? mskh : _io_out_wmask_T_9; // @[Mux.scala 98:16]
  wire [63:0] _io_out_wdata_T_8 = _io_out_wmask_T_7 ? io_in_wdata : 64'h0; // @[Mux.scala 98:16]
  wire [63:0] _io_out_wdata_T_9 = _io_out_wmask_T_5 ? wdatw : _io_out_wdata_T_8; // @[Mux.scala 98:16]
  wire [63:0] _io_out_wdata_T_10 = _io_out_wmask_T_3 ? wdath : _io_out_wdata_T_9; // @[Mux.scala 98:16]
  wire [7:0] _bsel_rd_T_9 = 3'h1 == io_miniaddr ? io_out_rdata[15:8] : io_out_rdata[7:0]; // @[Mux.scala 80:57]
  wire [7:0] _bsel_rd_T_11 = 3'h2 == io_miniaddr ? io_out_rdata[23:16] : _bsel_rd_T_9; // @[Mux.scala 80:57]
  wire [7:0] _bsel_rd_T_13 = 3'h3 == io_miniaddr ? io_out_rdata[31:24] : _bsel_rd_T_11; // @[Mux.scala 80:57]
  wire [7:0] _bsel_rd_T_15 = 3'h4 == io_miniaddr ? io_out_rdata[39:32] : _bsel_rd_T_13; // @[Mux.scala 80:57]
  wire [7:0] _bsel_rd_T_17 = 3'h5 == io_miniaddr ? io_out_rdata[47:40] : _bsel_rd_T_15; // @[Mux.scala 80:57]
  wire [7:0] _bsel_rd_T_19 = 3'h6 == io_miniaddr ? io_out_rdata[55:48] : _bsel_rd_T_17; // @[Mux.scala 80:57]
  wire [7:0] bsel_rd = 3'h7 == io_miniaddr ? io_out_rdata[63:56] : _bsel_rd_T_19; // @[Mux.scala 80:57]
  wire [15:0] _hsel_rd_T_6 = 2'h1 == io_miniaddr[2:1] ? io_out_rdata[31:16] : io_out_rdata[15:0]; // @[Mux.scala 80:57]
  wire [15:0] _hsel_rd_T_8 = 2'h2 == io_miniaddr[2:1] ? io_out_rdata[47:32] : _hsel_rd_T_6; // @[Mux.scala 80:57]
  wire [15:0] hsel_rd = 2'h3 == io_miniaddr[2:1] ? io_out_rdata[63:48] : _hsel_rd_T_8; // @[Mux.scala 80:57]
  wire [31:0] wsel_rd = io_miniaddr[2] ? io_out_rdata[63:32] : io_out_rdata[31:0]; // @[LSU.scala 245:23]
  wire  _io_in_rdata_T = io_in_wmask == 3'h0; // @[LSU.scala 248:22]
  wire [55:0] io_in_rdata_hi = bsel_rd[7] ? 56'hffffffffffffff : 56'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _io_in_rdata_T_3 = {io_in_rdata_hi,bsel_rd}; // @[Cat.scala 30:58]
  wire  _io_in_rdata_T_4 = io_in_wmask == 3'h2; // @[LSU.scala 249:22]
  wire [47:0] io_in_rdata_hi_1 = hsel_rd[15] ? 48'hffffffffffff : 48'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _io_in_rdata_T_7 = {io_in_rdata_hi_1,hsel_rd}; // @[Cat.scala 30:58]
  wire  _io_in_rdata_T_8 = io_in_wmask == 3'h4; // @[LSU.scala 250:22]
  wire [31:0] io_in_rdata_hi_2 = wsel_rd[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _io_in_rdata_T_11 = {io_in_rdata_hi_2,wsel_rd}; // @[Cat.scala 30:58]
  wire  _io_in_rdata_T_12 = io_in_wmask == 3'h6; // @[LSU.scala 251:22]
  wire  _io_in_rdata_T_13 = io_in_wmask == 3'h1; // @[LSU.scala 252:22]
  wire [63:0] _io_in_rdata_T_14 = {56'h0,bsel_rd}; // @[Cat.scala 30:58]
  wire  _io_in_rdata_T_15 = io_in_wmask == 3'h3; // @[LSU.scala 253:22]
  wire [63:0] _io_in_rdata_T_16 = {48'h0,hsel_rd}; // @[Cat.scala 30:58]
  wire  _io_in_rdata_T_17 = io_in_wmask == 3'h5; // @[LSU.scala 254:22]
  wire [63:0] _io_in_rdata_T_18 = {32'h0,wsel_rd}; // @[Cat.scala 30:58]
  wire [63:0] _io_in_rdata_T_19 = _io_in_rdata_T_17 ? _io_in_rdata_T_18 : 64'h0; // @[Mux.scala 98:16]
  wire [63:0] _io_in_rdata_T_20 = _io_in_rdata_T_15 ? _io_in_rdata_T_16 : _io_in_rdata_T_19; // @[Mux.scala 98:16]
  wire [63:0] _io_in_rdata_T_21 = _io_in_rdata_T_13 ? _io_in_rdata_T_14 : _io_in_rdata_T_20; // @[Mux.scala 98:16]
  wire [63:0] _io_in_rdata_T_22 = _io_in_rdata_T_12 ? io_out_rdata : _io_in_rdata_T_21; // @[Mux.scala 98:16]
  wire [63:0] _io_in_rdata_T_23 = _io_in_rdata_T_8 ? _io_in_rdata_T_11 : _io_in_rdata_T_22; // @[Mux.scala 98:16]
  wire [63:0] _io_in_rdata_T_24 = _io_in_rdata_T_4 ? _io_in_rdata_T_7 : _io_in_rdata_T_23; // @[Mux.scala 98:16]
  assign io_in_rdata = _io_in_rdata_T ? _io_in_rdata_T_3 : _io_in_rdata_T_24; // @[Mux.scala 98:16]
  assign io_out_wmask = _io_out_wmask_T_1 ? mskb : _io_out_wmask_T_10; // @[Mux.scala 98:16]
  assign io_out_wdata = _io_out_wmask_T_1 ? wdatb : _io_out_wdata_T_10; // @[Mux.scala 98:16]
endmodule
module ysyx_210232_Clint(
  input         clock,
  input         reset,
  input         io_ren,
  input         io_wen,
  input  [31:0] io_addr,
  input  [63:0] io_wdata,
  output [63:0] io_rdata,
  input         io_en,
  output        intr_0
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] mtime; // @[Clint.scala 19:27]
  reg [63:0] mtimecmp; // @[Clint.scala 20:27]
  wire  mtime_sel = io_addr == 32'h200bff8; // @[Clint.scala 21:30]
  wire  cmp_sel = io_addr == 32'h2004000; // @[Clint.scala 22:30]
  wire [63:0] _rd_data_T = cmp_sel ? mtimecmp : 64'h0; // @[Clint.scala 24:22]
  wire [63:0] rd_data = mtime_sel ? mtime : _rd_data_T; // @[Clint.scala 23:22]
  wire [63:0] _mtime_T_1 = mtime + 64'h1; // @[Clint.scala 31:24]
  wire  intr = io_en & mtime >= mtimecmp; // @[Clint.scala 38:19]
  assign io_rdata = io_ren ? rd_data : 64'h0; // @[Clint.scala 26:20]
  assign intr_0 = intr;
  always @(posedge clock) begin
    if (reset) begin // @[Clint.scala 19:27]
      mtime <= 64'h0; // @[Clint.scala 19:27]
    end else if (mtime_sel & io_wen) begin // @[Clint.scala 28:30]
      mtime <= io_wdata; // @[Clint.scala 29:15]
    end else if (io_en) begin // @[Clint.scala 30:22]
      mtime <= _mtime_T_1; // @[Clint.scala 31:15]
    end
    if (reset) begin // @[Clint.scala 20:27]
      mtimecmp <= 64'h0; // @[Clint.scala 20:27]
    end else if (cmp_sel & io_wen) begin // @[Clint.scala 34:28]
      mtimecmp <= io_wdata; // @[Clint.scala 35:18]
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
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210232_LSUwithUserBus(
  input         clock,
  input         reset,
  input         io_valid,
  input  [31:0] io_op1,
  input  [31:0] io_op2,
  input  [3:0]  io_m_mode,
  input  [63:0] io_m_wdata,
  output [63:0] io_m_rdata,
  output        io_stall,
  input         io_dmem_req_ready,
  output        io_dmem_req_valid,
  output [31:0] io_dmem_req_bits_addr,
  output        io_dmem_req_bits_ren,
  output [2:0]  io_dmem_req_bits_size,
  output        io_dmem_req_bits_wen,
  output [7:0]  io_dmem_req_bits_wmask,
  output [63:0] io_dmem_req_bits_wdata,
  output        io_dmem_resp_ready,
  input         io_dmem_resp_valid,
  input  [63:0] io_dmem_resp_bits_rdata,
  input         io_dmem_resp_bits_resp,
  input  [3:0]  io_dmem_resp_bits_id,
  output        intr,
  output        Ex_Ld_fail_0,
  output        lsu_done_0,
  input         clint_en_0,
  output        Ex_Sd_fail_0
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
`endif // RANDOMIZE_REG_INIT
  wire [2:0] proxy_io_miniaddr; // @[LSU.scala 27:23]
  wire [2:0] proxy_io_in_wmask; // @[LSU.scala 27:23]
  wire [63:0] proxy_io_in_wdata; // @[LSU.scala 27:23]
  wire [63:0] proxy_io_in_rdata; // @[LSU.scala 27:23]
  wire [7:0] proxy_io_out_wmask; // @[LSU.scala 27:23]
  wire [63:0] proxy_io_out_wdata; // @[LSU.scala 27:23]
  wire [63:0] proxy_io_out_rdata; // @[LSU.scala 27:23]
  wire  clint_clock; // @[LSU.scala 43:29]
  wire  clint_reset; // @[LSU.scala 43:29]
  wire  clint_io_ren; // @[LSU.scala 43:29]
  wire  clint_io_wen; // @[LSU.scala 43:29]
  wire [31:0] clint_io_addr; // @[LSU.scala 43:29]
  wire [63:0] clint_io_wdata; // @[LSU.scala 43:29]
  wire [63:0] clint_io_rdata; // @[LSU.scala 43:29]
  wire  clint_io_en; // @[LSU.scala 43:29]
  wire  clint_intr_0; // @[LSU.scala 43:29]
  wire [31:0] m_addr = io_op1 + io_op2; // @[LSU.scala 29:26]
  wire  wen = io_m_mode[3] & io_valid; // @[LSU.scala 30:36]
  wire  ren = ~io_m_mode[3] & io_valid; // @[LSU.scala 31:36]
  wire  clint_sel = m_addr[31:16] == 16'h200; // @[LSU.scala 42:38]
  reg [63:0] proxy_io_out_rdata_REG; // @[LSU.scala 54:63]
  reg [2:0] lsu_state; // @[LSU.scala 57:28]
  reg  renR; // @[LSU.scala 58:25]
  reg  wenR; // @[LSU.scala 59:25]
  reg [31:0] addrR; // @[LSU.scala 60:25]
  reg [7:0] wmaskR; // @[LSU.scala 61:25]
  reg [63:0] wdataR; // @[LSU.scala 62:25]
  reg  Ex_Ld_fail; // @[LSU.scala 66:29]
  reg  Ex_Sd_fail; // @[LSU.scala 67:29]
  wire  _T = 3'h0 == lsu_state; // @[Conditional.scala 37:30]
  wire  _T_2 = ~clint_sel; // @[LSU.scala 72:34]
  wire  _T_4 = 3'h1 == lsu_state; // @[Conditional.scala 37:30]
  wire  _T_5 = io_dmem_req_ready & io_dmem_req_valid; // @[Decoupled.scala 40:37]
  wire [2:0] _GEN_6 = _T_5 & wenR ? 3'h2 : 3'h1; // @[LSU.scala 84:51 LSU.scala 85:27 LSU.scala 87:27]
  wire  _T_9 = 3'h3 == lsu_state; // @[Conditional.scala 37:30]
  wire  _T_10 = io_dmem_resp_ready & io_dmem_resp_valid; // @[Decoupled.scala 40:37]
  wire  _GEN_8 = io_dmem_resp_bits_resp & io_dmem_resp_bits_id == 4'h2 ? 1'h0 : 1'h1; // @[LSU.scala 92:77 LSU.scala 93:32 LSU.scala 95:32]
  wire  _GEN_9 = _T_10 ? _GEN_8 : Ex_Ld_fail; // @[LSU.scala 91:38 LSU.scala 66:29]
  wire [2:0] _GEN_10 = _T_10 ? 3'h4 : lsu_state; // @[LSU.scala 91:38 LSU.scala 97:27 LSU.scala 57:28]
  wire  _T_13 = 3'h2 == lsu_state; // @[Conditional.scala 37:30]
  wire  _GEN_12 = _T_10 ? _GEN_8 : Ex_Sd_fail; // @[LSU.scala 102:38 LSU.scala 67:29]
  wire  _T_17 = 3'h4 == lsu_state; // @[Conditional.scala 37:30]
  wire [2:0] _GEN_14 = _T_17 ? 3'h0 : lsu_state; // @[Conditional.scala 39:67 LSU.scala 112:23 LSU.scala 57:28]
  wire  _GEN_15 = _T_17 ? 1'h0 : wenR; // @[Conditional.scala 39:67 LSU.scala 113:18 LSU.scala 59:25]
  wire  _GEN_16 = _T_17 ? 1'h0 : renR; // @[Conditional.scala 39:67 LSU.scala 114:18 LSU.scala 58:25]
  wire [31:0] _GEN_17 = _T_17 ? 32'h0 : addrR; // @[Conditional.scala 39:67 LSU.scala 115:19 LSU.scala 60:25]
  wire [7:0] _GEN_18 = _T_17 ? 8'h0 : wmaskR; // @[Conditional.scala 39:67 LSU.scala 116:20 LSU.scala 61:25]
  wire [63:0] _GEN_19 = _T_17 ? 64'h0 : wdataR; // @[Conditional.scala 39:67 LSU.scala 117:20 LSU.scala 62:25]
  wire  _GEN_20 = _T_17 ? 1'h0 : Ex_Ld_fail; // @[Conditional.scala 39:67 LSU.scala 118:24 LSU.scala 66:29]
  wire  _GEN_21 = _T_13 ? _GEN_12 : Ex_Sd_fail; // @[Conditional.scala 39:67 LSU.scala 67:29]
  wire [2:0] _GEN_22 = _T_13 ? _GEN_10 : _GEN_14; // @[Conditional.scala 39:67]
  wire  _GEN_23 = _T_13 ? wenR : _GEN_15; // @[Conditional.scala 39:67 LSU.scala 59:25]
  wire  _GEN_24 = _T_13 ? renR : _GEN_16; // @[Conditional.scala 39:67 LSU.scala 58:25]
  wire [31:0] _GEN_25 = _T_13 ? addrR : _GEN_17; // @[Conditional.scala 39:67 LSU.scala 60:25]
  wire [7:0] _GEN_26 = _T_13 ? wmaskR : _GEN_18; // @[Conditional.scala 39:67 LSU.scala 61:25]
  wire [63:0] _GEN_27 = _T_13 ? wdataR : _GEN_19; // @[Conditional.scala 39:67 LSU.scala 62:25]
  wire  _GEN_28 = _T_13 ? Ex_Ld_fail : _GEN_20; // @[Conditional.scala 39:67 LSU.scala 66:29]
  wire  _io_dmem_req_valid_T = lsu_state == 3'h1; // @[LSU.scala 122:42]
  wire [1:0] _io_dmem_req_bits_size_T_2 = addrR[31:28] < 4'h8 ? 2'h2 : 2'h3; // @[LSU.scala 126:38]
  wire  _io_dmem_resp_ready_T = lsu_state == 3'h2; // @[LSU.scala 136:39]
  wire  _io_dmem_resp_ready_T_1 = lsu_state == 3'h3; // @[LSU.scala 136:62]
  wire  _io_stall_T_2 = _io_dmem_req_valid_T | _io_dmem_resp_ready_T; // @[LSU.scala 137:38]
  wire  _io_stall_T_4 = _io_stall_T_2 | _io_dmem_resp_ready_T_1; // @[LSU.scala 138:38]
  wire  _io_stall_T_8 = lsu_state == 3'h0 & io_valid & _T_2; // @[LSU.scala 140:50]
  wire  lsu_done = lsu_state == 3'h4 | clint_sel; // @[LSU.scala 65:40]
  ysyx_210232_MemProxy proxy ( // @[LSU.scala 27:23]
    .io_miniaddr(proxy_io_miniaddr),
    .io_in_wmask(proxy_io_in_wmask),
    .io_in_wdata(proxy_io_in_wdata),
    .io_in_rdata(proxy_io_in_rdata),
    .io_out_wmask(proxy_io_out_wmask),
    .io_out_wdata(proxy_io_out_wdata),
    .io_out_rdata(proxy_io_out_rdata)
  );
  ysyx_210232_Clint clint ( // @[LSU.scala 43:29]
    .clock(clint_clock),
    .reset(clint_reset),
    .io_ren(clint_io_ren),
    .io_wen(clint_io_wen),
    .io_addr(clint_io_addr),
    .io_wdata(clint_io_wdata),
    .io_rdata(clint_io_rdata),
    .io_en(clint_io_en),
    .intr_0(clint_intr_0)
  );
  assign io_m_rdata = proxy_io_in_rdata; // @[LSU.scala 39:16]
  assign io_stall = _io_stall_T_4 | _io_stall_T_8; // @[LSU.scala 139:38]
  assign io_dmem_req_valid = lsu_state == 3'h1; // @[LSU.scala 122:42]
  assign io_dmem_req_bits_addr = addrR; // @[LSU.scala 123:28]
  assign io_dmem_req_bits_ren = renR; // @[LSU.scala 124:28]
  assign io_dmem_req_bits_size = {{1'd0}, _io_dmem_req_bits_size_T_2}; // @[LSU.scala 126:38]
  assign io_dmem_req_bits_wen = wenR; // @[LSU.scala 130:28]
  assign io_dmem_req_bits_wmask = wmaskR; // @[LSU.scala 131:28]
  assign io_dmem_req_bits_wdata = wdataR; // @[LSU.scala 132:28]
  assign io_dmem_resp_ready = lsu_state == 3'h2 | lsu_state == 3'h3; // @[LSU.scala 136:48]
  assign intr = clint_intr_0;
  assign Ex_Ld_fail_0 = Ex_Ld_fail;
  assign lsu_done_0 = lsu_done;
  assign Ex_Sd_fail_0 = Ex_Sd_fail;
  assign proxy_io_miniaddr = m_addr[2:0]; // @[LSU.scala 33:34]
  assign proxy_io_in_wmask = io_m_mode[2:0]; // @[LSU.scala 34:37]
  assign proxy_io_in_wdata = io_m_wdata; // @[LSU.scala 35:25]
  assign proxy_io_out_rdata = clint_sel ? clint_io_rdata : proxy_io_out_rdata_REG; // @[LSU.scala 54:30]
  assign clint_clock = clock;
  assign clint_reset = reset;
  assign clint_io_ren = clint_sel & ren; // @[LSU.scala 52:28]
  assign clint_io_wen = clint_sel & wen; // @[LSU.scala 50:28]
  assign clint_io_addr = clint_sel ? m_addr : 32'h0; // @[LSU.scala 49:28]
  assign clint_io_wdata = clint_sel ? proxy_io_out_wdata : 64'h0; // @[LSU.scala 51:28]
  assign clint_io_en = clint_en_0; // @[LSU.scala 48:22]
  always @(posedge clock) begin
    if (reset) begin // @[LSU.scala 54:63]
      proxy_io_out_rdata_REG <= 64'h0; // @[LSU.scala 54:63]
    end else begin
      proxy_io_out_rdata_REG <= io_dmem_resp_bits_rdata; // @[LSU.scala 54:63]
    end
    if (reset) begin // @[LSU.scala 57:28]
      lsu_state <= 3'h0; // @[LSU.scala 57:28]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if ((wen | ren) & ~clint_sel) begin // @[LSU.scala 72:45]
        lsu_state <= 3'h1; // @[LSU.scala 73:27]
      end
    end else if (_T_4) begin // @[Conditional.scala 39:67]
      if (_T_5 & renR) begin // @[LSU.scala 82:45]
        lsu_state <= 3'h3; // @[LSU.scala 83:27]
      end else begin
        lsu_state <= _GEN_6;
      end
    end else if (_T_9) begin // @[Conditional.scala 39:67]
      lsu_state <= _GEN_10;
    end else begin
      lsu_state <= _GEN_22;
    end
    if (reset) begin // @[LSU.scala 58:25]
      renR <= 1'h0; // @[LSU.scala 58:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if ((wen | ren) & ~clint_sel) begin // @[LSU.scala 72:45]
        renR <= ren; // @[LSU.scala 75:27]
      end
    end else if (!(_T_4)) begin // @[Conditional.scala 39:67]
      if (!(_T_9)) begin // @[Conditional.scala 39:67]
        renR <= _GEN_24;
      end
    end
    if (reset) begin // @[LSU.scala 59:25]
      wenR <= 1'h0; // @[LSU.scala 59:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if ((wen | ren) & ~clint_sel) begin // @[LSU.scala 72:45]
        wenR <= wen; // @[LSU.scala 74:27]
      end
    end else if (!(_T_4)) begin // @[Conditional.scala 39:67]
      if (!(_T_9)) begin // @[Conditional.scala 39:67]
        wenR <= _GEN_23;
      end
    end
    if (reset) begin // @[LSU.scala 60:25]
      addrR <= 32'h0; // @[LSU.scala 60:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if ((wen | ren) & ~clint_sel) begin // @[LSU.scala 72:45]
        addrR <= m_addr; // @[LSU.scala 76:27]
      end
    end else if (!(_T_4)) begin // @[Conditional.scala 39:67]
      if (!(_T_9)) begin // @[Conditional.scala 39:67]
        addrR <= _GEN_25;
      end
    end
    if (reset) begin // @[LSU.scala 61:25]
      wmaskR <= 8'h0; // @[LSU.scala 61:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if ((wen | ren) & ~clint_sel) begin // @[LSU.scala 72:45]
        wmaskR <= proxy_io_out_wmask; // @[LSU.scala 77:27]
      end
    end else if (!(_T_4)) begin // @[Conditional.scala 39:67]
      if (!(_T_9)) begin // @[Conditional.scala 39:67]
        wmaskR <= _GEN_26;
      end
    end
    if (reset) begin // @[LSU.scala 62:25]
      wdataR <= 64'h0; // @[LSU.scala 62:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if ((wen | ren) & ~clint_sel) begin // @[LSU.scala 72:45]
        wdataR <= proxy_io_out_wdata; // @[LSU.scala 78:27]
      end
    end else if (!(_T_4)) begin // @[Conditional.scala 39:67]
      if (!(_T_9)) begin // @[Conditional.scala 39:67]
        wdataR <= _GEN_27;
      end
    end
    if (reset) begin // @[LSU.scala 66:29]
      Ex_Ld_fail <= 1'h0; // @[LSU.scala 66:29]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_4)) begin // @[Conditional.scala 39:67]
        if (_T_9) begin // @[Conditional.scala 39:67]
          Ex_Ld_fail <= _GEN_9;
        end else begin
          Ex_Ld_fail <= _GEN_28;
        end
      end
    end
    if (reset) begin // @[LSU.scala 67:29]
      Ex_Sd_fail <= 1'h0; // @[LSU.scala 67:29]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (!(_T_4)) begin // @[Conditional.scala 39:67]
        if (!(_T_9)) begin // @[Conditional.scala 39:67]
          Ex_Sd_fail <= _GEN_21;
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
  proxy_io_out_rdata_REG = _RAND_0[63:0];
  _RAND_1 = {1{`RANDOM}};
  lsu_state = _RAND_1[2:0];
  _RAND_2 = {1{`RANDOM}};
  renR = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  wenR = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  addrR = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  wmaskR = _RAND_5[7:0];
  _RAND_6 = {2{`RANDOM}};
  wdataR = _RAND_6[63:0];
  _RAND_7 = {1{`RANDOM}};
  Ex_Ld_fail = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  Ex_Sd_fail = _RAND_8[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210232_CSR(
  input         clock,
  input         reset,
  input  [31:0] io_pc,
  input  [31:0] io_inst,
  input         io_valid,
  input         io_sel,
  input  [3:0]  io_csrmode,
  input  [63:0] io_wr_data,
  output [63:0] io_rd_data,
  output        io_jump,
  output [31:0] io_jumpPC,
  output        io_intr,
  output [31:0] io_intrPC,
  input         clint_intr_0,
  input         Ex_Ld_fail_0,
  input         WB_COMMIT,
  output        clint_en_0,
  input         inst_illegal,
  input         Ex_Sd_fail_0,
  input         If_Ld_fail_0
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [63:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [63:0] _RAND_7;
  reg [63:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [63:0] _RAND_12;
  reg [63:0] _RAND_13;
`endif // RANDOMIZE_REG_INIT
  wire [4:0] rs1_addr = io_inst[19:15]; // @[CSR.scala 27:27]
  wire  _csr_addr_T = io_csrmode != 4'h0; // @[CSR.scala 28:36]
  wire [11:0] csr_addr = io_csrmode != 4'h0 ? io_inst[31:20] : 12'h0; // @[CSR.scala 28:23]
  wire [63:0] wr_zimm = {59'h0,rs1_addr}; // @[Cat.scala 30:58]
  wire [58:0] wr_rimm_hi = io_rd_data[63:5]; // @[CSR.scala 30:33]
  wire [63:0] wr_rimm = {wr_rimm_hi,rs1_addr}; // @[Cat.scala 30:58]
  wire  imm_sel = io_inst[14]; // @[CSR.scala 32:30]
  wire  _mode_SC_T = io_csrmode == 4'h2; // @[CSR.scala 33:35]
  wire  _mode_SC_T_1 = io_csrmode == 4'h3; // @[CSR.scala 33:61]
  wire  mode_SC = io_csrmode == 4'h2 | io_csrmode == 4'h3; // @[CSR.scala 33:46]
  wire [63:0] _wr_data_RI_T = mode_SC ? wr_zimm : wr_rimm; // @[CSR.scala 34:38]
  wire [63:0] wr_data_RI = imm_sel ? _wr_data_RI_T : io_wr_data; // @[CSR.scala 34:26]
  reg [1:0] FS; // @[CSR.scala 38:23]
  reg  MIE; // @[CSR.scala 40:23]
  reg [1:0] MPP; // @[CSR.scala 41:23]
  reg  MPIE; // @[CSR.scala 42:23]
  wire  SD = FS == 2'h3; // @[CSR.scala 43:14]
  wire [63:0] mstatus = {SD,48'h0,FS,MPP,3'h0,MPIE,3'h0,MIE,3'h0}; // @[Cat.scala 30:58]
  reg [63:0] mcycle; // @[CSR.scala 47:25]
  wire [63:0] _mcycle_T_1 = mcycle + 64'h1; // @[CSR.scala 48:22]
  reg [63:0] minstret; // @[CSR.scala 53:27]
  wire [63:0] _GEN_94 = {{63'd0}, WB_COMMIT}; // @[CSR.scala 54:26]
  wire [63:0] _minstret_T_1 = minstret + _GEN_94; // @[CSR.scala 54:26]
  reg [63:0] mtvec; // @[CSR.scala 57:24]
  reg [63:0] mepc; // @[CSR.scala 60:24]
  reg [62:0] mcause62_0; // @[CSR.scala 63:30]
  reg  mcause63; // @[CSR.scala 64:29]
  wire [63:0] mcause = {mcause63,mcause62_0}; // @[Cat.scala 30:58]
  reg  MTIP; // @[CSR.scala 68:23]
  wire [63:0] mip = {56'h0,MTIP,7'h0}; // @[Cat.scala 30:58]
  reg  MTIE; // @[CSR.scala 75:23]
  wire [63:0] mie = {56'h0,MTIE,7'h0}; // @[Cat.scala 30:58]
  reg [63:0] mscratch; // @[CSR.scala 79:27]
  reg [63:0] mtval; // @[CSR.scala 82:27]
  wire  _io_rd_data_T_1 = 12'h300 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_rd_data_T_3 = 12'h305 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_rd_data_T_5 = 12'h341 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_rd_data_T_7 = 12'h342 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_rd_data_T_9 = 12'h344 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_rd_data_T_11 = 12'h304 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_rd_data_T_13 = 12'hb00 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_rd_data_T_15 = 12'hb02 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_rd_data_T_17 = 12'h340 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_rd_data_T_19 = 12'h343 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_rd_data_T_21 = 12'h301 == csr_addr; // @[Lookup.scala 31:38]
  wire  _io_rd_data_T_23 = 12'hf12 == csr_addr; // @[Lookup.scala 31:38]
  wire [63:0] _io_rd_data_T_24 = _io_rd_data_T_23 ? 64'h48454c4c4f534a48 : 64'h0; // @[Lookup.scala 33:37]
  wire [63:0] _io_rd_data_T_25 = _io_rd_data_T_21 ? 64'h1000000000000100 : _io_rd_data_T_24; // @[Lookup.scala 33:37]
  wire [63:0] _io_rd_data_T_26 = _io_rd_data_T_19 ? mtval : _io_rd_data_T_25; // @[Lookup.scala 33:37]
  wire [63:0] _io_rd_data_T_27 = _io_rd_data_T_17 ? mscratch : _io_rd_data_T_26; // @[Lookup.scala 33:37]
  wire [63:0] _io_rd_data_T_28 = _io_rd_data_T_15 ? minstret : _io_rd_data_T_27; // @[Lookup.scala 33:37]
  wire [63:0] _io_rd_data_T_29 = _io_rd_data_T_13 ? mcycle : _io_rd_data_T_28; // @[Lookup.scala 33:37]
  wire [63:0] _io_rd_data_T_30 = _io_rd_data_T_11 ? mie : _io_rd_data_T_29; // @[Lookup.scala 33:37]
  wire [63:0] _io_rd_data_T_31 = _io_rd_data_T_9 ? mip : _io_rd_data_T_30; // @[Lookup.scala 33:37]
  wire [63:0] _io_rd_data_T_32 = _io_rd_data_T_7 ? mcause : _io_rd_data_T_31; // @[Lookup.scala 33:37]
  wire [63:0] _io_rd_data_T_33 = _io_rd_data_T_5 ? mepc : _io_rd_data_T_32; // @[Lookup.scala 33:37]
  wire [63:0] _io_rd_data_T_34 = _io_rd_data_T_3 ? mtvec : _io_rd_data_T_33; // @[Lookup.scala 33:37]
  wire  privInst = io_csrmode == 4'h4 & io_sel; // @[CSR.scala 109:45]
  wire  _isEcall_T_2 = privInst & ~csr_addr[0]; // @[CSR.scala 110:32]
  wire  isEcall = privInst & ~csr_addr[0] & ~csr_addr[1]; // @[CSR.scala 110:48]
  wire  isMret = _isEcall_T_2 & csr_addr[1]; // @[CSR.scala 112:48]
  wire  clint_en = MIE & MTIE; // @[CSR.scala 113:27]
  wire  isClint = clint_en & MTIP & io_valid; // @[CSR.scala 114:40]
  wire  wen = io_sel & (io_csrmode == 4'h1 | _mode_SC_T | _mode_SC_T_1) & |rs1_addr; // @[CSR.scala 117:102]
  wire  ro = &csr_addr[11:10] & _csr_addr_T; // @[CSR.scala 118:36]
  wire [63:0] _wr_data_T = io_rd_data | wr_data_RI; // @[CSR.scala 121:30]
  wire [63:0] _wr_data_T_1 = ~wr_data_RI; // @[CSR.scala 122:32]
  wire [63:0] _wr_data_T_2 = io_rd_data & _wr_data_T_1; // @[CSR.scala 122:30]
  wire [63:0] _wr_data_T_4 = 4'h1 == io_csrmode ? wr_data_RI : 64'h0; // @[Mux.scala 80:57]
  wire [63:0] _wr_data_T_6 = 4'h2 == io_csrmode ? _wr_data_T : _wr_data_T_4; // @[Mux.scala 80:57]
  wire [63:0] wr_data = 4'h3 == io_csrmode ? _wr_data_T_2 : _wr_data_T_6; // @[Mux.scala 80:57]
  wire  isMem = Ex_Ld_fail_0 | If_Ld_fail_0 | Ex_Sd_fail_0; // @[CSR.scala 134:56]
  wire  hack = wen & ro; // @[CSR.scala 137:20]
  wire  expt = inst_illegal | hack | isEcall | isMem; // @[CSR.scala 138:44]
  wire [29:0] io_intrPC_hi = mtvec[31:2]; // @[CSR.scala 156:31]
  wire [31:0] _io_intrPC_T = {io_intrPC_hi,2'h0}; // @[Cat.scala 30:58]
  wire [63:0] _GEN_1 = isClint ? {{32'd0}, io_pc} : mepc; // @[CSR.scala 148:18 CSR.scala 149:16 CSR.scala 60:24]
  wire [63:0] _GEN_2 = isClint ? {{32'd0}, io_inst} : mtval; // @[CSR.scala 148:18 CSR.scala 150:16 CSR.scala 82:27]
  wire  _GEN_3 = isClint | mcause63; // @[CSR.scala 148:18 CSR.scala 151:20 CSR.scala 64:29]
  wire [62:0] _GEN_4 = isClint ? 63'h7 : mcause62_0; // @[CSR.scala 148:18 CSR.scala 152:20 CSR.scala 63:30]
  wire  _GEN_5 = isClint ? MIE : MPIE; // @[CSR.scala 148:18 CSR.scala 153:14 CSR.scala 42:23]
  wire  _GEN_6 = isClint ? 1'h0 : MIE; // @[CSR.scala 148:18 CSR.scala 154:14 CSR.scala 40:23]
  wire [62:0] _lo_T_3 = Ex_Sd_fail_0 ? 63'h7 : 63'h0; // @[Mux.scala 98:16]
  wire [62:0] _lo_T_4 = Ex_Ld_fail_0 ? 63'h5 : _lo_T_3; // @[Mux.scala 98:16]
  wire [62:0] _lo_T_5 = If_Ld_fail_0 ? 63'h5 : _lo_T_4; // @[Mux.scala 98:16]
  wire [62:0] _lo_T_6 = hack ? 63'hf : _lo_T_5; // @[Mux.scala 98:16]
  wire [31:0] _GEN_10 = isEcall ? _io_intrPC_T : 32'h0; // @[CSR.scala 177:22 CSR.scala 179:23 CSR.scala 142:15]
  wire [29:0] io_jumpPC_hi_1 = mepc[31:2]; // @[CSR.scala 184:34]
  wire [31:0] _io_jumpPC_T_1 = {io_jumpPC_hi_1,2'h0}; // @[Cat.scala 30:58]
  wire [61:0] mtvec_hi = wr_data[63:2]; // @[CSR.scala 196:33]
  wire [63:0] _mtvec_T = {mtvec_hi,2'h0}; // @[Cat.scala 30:58]
  wire [63:0] _GEN_11 = csr_addr == 12'h343 ? wr_data : _GEN_2; // @[CSR.scala 214:45 CSR.scala 215:19]
  wire [63:0] _GEN_12 = csr_addr == 12'h340 ? wr_data : mscratch; // @[CSR.scala 211:48 CSR.scala 212:22 CSR.scala 79:27]
  wire [63:0] _GEN_13 = csr_addr == 12'h340 ? _GEN_2 : _GEN_11; // @[CSR.scala 211:48]
  wire  _GEN_14 = csr_addr == 12'h304 ? wr_data[7] : MTIE; // @[CSR.scala 208:43 CSR.scala 209:18 CSR.scala 75:23]
  wire [63:0] _GEN_15 = csr_addr == 12'h304 ? mscratch : _GEN_12; // @[CSR.scala 208:43 CSR.scala 79:27]
  wire [63:0] _GEN_16 = csr_addr == 12'h304 ? _GEN_2 : _GEN_13; // @[CSR.scala 208:43]
  wire  _GEN_17 = csr_addr == 12'h344 ? wr_data[7] : clint_intr_0; // @[CSR.scala 205:43 CSR.scala 206:18 CSR.scala 71:10]
  wire  _GEN_18 = csr_addr == 12'h344 ? MTIE : _GEN_14; // @[CSR.scala 205:43 CSR.scala 75:23]
  wire [63:0] _GEN_19 = csr_addr == 12'h344 ? mscratch : _GEN_15; // @[CSR.scala 205:43 CSR.scala 79:27]
  wire [63:0] _GEN_20 = csr_addr == 12'h344 ? _GEN_2 : _GEN_16; // @[CSR.scala 205:43]
  wire  _GEN_21 = csr_addr == 12'h342 ? wr_data[63] : _GEN_3; // @[CSR.scala 201:46 CSR.scala 202:24]
  wire [62:0] _GEN_22 = csr_addr == 12'h342 ? wr_data[62:0] : _GEN_4; // @[CSR.scala 201:46 CSR.scala 203:24]
  wire  _GEN_23 = csr_addr == 12'h342 ? clint_intr_0 : _GEN_17; // @[CSR.scala 201:46 CSR.scala 71:10]
  wire  _GEN_24 = csr_addr == 12'h342 ? MTIE : _GEN_18; // @[CSR.scala 201:46 CSR.scala 75:23]
  wire [63:0] _GEN_25 = csr_addr == 12'h342 ? mscratch : _GEN_19; // @[CSR.scala 201:46 CSR.scala 79:27]
  wire [63:0] _GEN_26 = csr_addr == 12'h342 ? _GEN_2 : _GEN_20; // @[CSR.scala 201:46]
  wire [63:0] _GEN_27 = csr_addr == 12'h341 ? _mtvec_T : _GEN_1; // @[CSR.scala 198:44 CSR.scala 199:19]
  wire  _GEN_28 = csr_addr == 12'h341 ? _GEN_3 : _GEN_21; // @[CSR.scala 198:44]
  wire [62:0] _GEN_29 = csr_addr == 12'h341 ? _GEN_4 : _GEN_22; // @[CSR.scala 198:44]
  wire  _GEN_30 = csr_addr == 12'h341 ? clint_intr_0 : _GEN_23; // @[CSR.scala 198:44 CSR.scala 71:10]
  wire  _GEN_31 = csr_addr == 12'h341 ? MTIE : _GEN_24; // @[CSR.scala 198:44 CSR.scala 75:23]
  wire [63:0] _GEN_32 = csr_addr == 12'h341 ? mscratch : _GEN_25; // @[CSR.scala 198:44 CSR.scala 79:27]
  wire [63:0] _GEN_33 = csr_addr == 12'h341 ? _GEN_2 : _GEN_26; // @[CSR.scala 198:44]
  wire [63:0] _GEN_34 = csr_addr == 12'h305 ? _mtvec_T : mtvec; // @[CSR.scala 195:45 CSR.scala 196:19 CSR.scala 57:24]
  wire [63:0] _GEN_35 = csr_addr == 12'h305 ? _GEN_1 : _GEN_27; // @[CSR.scala 195:45]
  wire  _GEN_36 = csr_addr == 12'h305 ? _GEN_3 : _GEN_28; // @[CSR.scala 195:45]
  wire [62:0] _GEN_37 = csr_addr == 12'h305 ? _GEN_4 : _GEN_29; // @[CSR.scala 195:45]
  wire  _GEN_38 = csr_addr == 12'h305 ? clint_intr_0 : _GEN_30; // @[CSR.scala 195:45 CSR.scala 71:10]
  wire  _GEN_39 = csr_addr == 12'h305 ? MTIE : _GEN_31; // @[CSR.scala 195:45 CSR.scala 75:23]
  wire [63:0] _GEN_40 = csr_addr == 12'h305 ? mscratch : _GEN_32; // @[CSR.scala 195:45 CSR.scala 79:27]
  wire [63:0] _GEN_41 = csr_addr == 12'h305 ? _GEN_2 : _GEN_33; // @[CSR.scala 195:45]
  wire [1:0] _GEN_42 = csr_addr == 12'h300 ? wr_data[14:13] : FS; // @[CSR.scala 189:43 CSR.scala 190:18 CSR.scala 38:23]
  wire [1:0] _GEN_43 = csr_addr == 12'h300 ? wr_data[12:11] : MPP; // @[CSR.scala 189:43 CSR.scala 191:18 CSR.scala 41:23]
  wire  _GEN_44 = csr_addr == 12'h300 ? wr_data[7] : _GEN_5; // @[CSR.scala 189:43 CSR.scala 192:18]
  wire  _GEN_45 = csr_addr == 12'h300 ? wr_data[3] : _GEN_6; // @[CSR.scala 189:43 CSR.scala 193:18]
  wire [63:0] _GEN_46 = csr_addr == 12'h300 ? mtvec : _GEN_34; // @[CSR.scala 189:43 CSR.scala 57:24]
  wire [63:0] _GEN_47 = csr_addr == 12'h300 ? _GEN_1 : _GEN_35; // @[CSR.scala 189:43]
  wire  _GEN_48 = csr_addr == 12'h300 ? _GEN_3 : _GEN_36; // @[CSR.scala 189:43]
  wire [62:0] _GEN_49 = csr_addr == 12'h300 ? _GEN_4 : _GEN_37; // @[CSR.scala 189:43]
  wire  _GEN_50 = csr_addr == 12'h300 ? clint_intr_0 : _GEN_38; // @[CSR.scala 189:43 CSR.scala 71:10]
  wire  _GEN_51 = csr_addr == 12'h300 ? MTIE : _GEN_39; // @[CSR.scala 189:43 CSR.scala 75:23]
  wire [63:0] _GEN_52 = csr_addr == 12'h300 ? mscratch : _GEN_40; // @[CSR.scala 189:43 CSR.scala 79:27]
  wire [63:0] _GEN_53 = csr_addr == 12'h300 ? _GEN_2 : _GEN_41; // @[CSR.scala 189:43]
  wire  _GEN_56 = wen ? _GEN_44 : _GEN_5; // @[CSR.scala 188:19]
  wire [31:0] _GEN_67 = isMret ? _io_jumpPC_T_1 : 32'h0; // @[CSR.scala 182:22 CSR.scala 184:23 CSR.scala 142:15]
  wire  _GEN_69 = isMret | _GEN_56; // @[CSR.scala 182:22 CSR.scala 186:18]
  assign io_rd_data = _io_rd_data_T_1 ? mstatus : _io_rd_data_T_34; // @[Lookup.scala 33:37]
  assign io_jump = expt ? isEcall : isMret; // @[CSR.scala 162:15]
  assign io_jumpPC = expt ? _GEN_10 : _GEN_67; // @[CSR.scala 162:15]
  assign io_intr = clint_en & MTIP & io_valid; // @[CSR.scala 114:40]
  assign io_intrPC = isClint ? _io_intrPC_T : 32'h0; // @[CSR.scala 148:18 CSR.scala 156:19 CSR.scala 159:19]
  assign clint_en_0 = clint_en;
  always @(posedge clock) begin
    if (reset) begin // @[CSR.scala 38:23]
      FS <= 2'h0; // @[CSR.scala 38:23]
    end else if (!(expt)) begin // @[CSR.scala 162:15]
      if (!(isMret)) begin // @[CSR.scala 182:22]
        if (wen) begin // @[CSR.scala 188:19]
          FS <= _GEN_42;
        end
      end
    end
    if (reset) begin // @[CSR.scala 40:23]
      MIE <= 1'h0; // @[CSR.scala 40:23]
    end else if (expt) begin // @[CSR.scala 162:15]
      MIE <= 1'h0; // @[CSR.scala 176:14]
    end else if (isMret) begin // @[CSR.scala 182:22]
      MIE <= MPIE; // @[CSR.scala 185:17]
    end else if (wen) begin // @[CSR.scala 188:19]
      MIE <= _GEN_45;
    end else begin
      MIE <= _GEN_6;
    end
    if (reset) begin // @[CSR.scala 41:23]
      MPP <= 2'h3; // @[CSR.scala 41:23]
    end else if (!(expt)) begin // @[CSR.scala 162:15]
      if (!(isMret)) begin // @[CSR.scala 182:22]
        if (wen) begin // @[CSR.scala 188:19]
          MPP <= _GEN_43;
        end
      end
    end
    if (reset) begin // @[CSR.scala 42:23]
      MPIE <= 1'h0; // @[CSR.scala 42:23]
    end else if (expt) begin // @[CSR.scala 162:15]
      MPIE <= MIE; // @[CSR.scala 175:14]
    end else begin
      MPIE <= _GEN_69;
    end
    if (reset) begin // @[CSR.scala 47:25]
      mcycle <= 64'h0; // @[CSR.scala 47:25]
    end else begin
      mcycle <= _mcycle_T_1; // @[CSR.scala 48:12]
    end
    if (reset) begin // @[CSR.scala 53:27]
      minstret <= 64'h0; // @[CSR.scala 53:27]
    end else begin
      minstret <= _minstret_T_1; // @[CSR.scala 54:14]
    end
    if (reset) begin // @[CSR.scala 57:24]
      mtvec <= 64'h0; // @[CSR.scala 57:24]
    end else if (!(expt)) begin // @[CSR.scala 162:15]
      if (!(isMret)) begin // @[CSR.scala 182:22]
        if (wen) begin // @[CSR.scala 188:19]
          mtvec <= _GEN_46;
        end
      end
    end
    if (reset) begin // @[CSR.scala 60:24]
      mepc <= 64'h0; // @[CSR.scala 60:24]
    end else if (expt) begin // @[CSR.scala 162:15]
      mepc <= {{32'd0}, io_pc}; // @[CSR.scala 163:16]
    end else if (isMret) begin // @[CSR.scala 182:22]
      mepc <= _GEN_1;
    end else if (wen) begin // @[CSR.scala 188:19]
      mepc <= _GEN_47;
    end else begin
      mepc <= _GEN_1;
    end
    if (reset) begin // @[CSR.scala 63:30]
      mcause62_0 <= 63'h0; // @[CSR.scala 63:30]
    end else if (expt) begin // @[CSR.scala 162:15]
      if (inst_illegal) begin // @[Mux.scala 98:16]
        mcause62_0 <= 63'h2;
      end else if (isEcall) begin // @[Mux.scala 98:16]
        mcause62_0 <= 63'hb;
      end else begin
        mcause62_0 <= _lo_T_6;
      end
    end else if (isMret) begin // @[CSR.scala 182:22]
      mcause62_0 <= _GEN_4;
    end else if (wen) begin // @[CSR.scala 188:19]
      mcause62_0 <= _GEN_49;
    end else begin
      mcause62_0 <= _GEN_4;
    end
    if (reset) begin // @[CSR.scala 64:29]
      mcause63 <= 1'h0; // @[CSR.scala 64:29]
    end else if (expt) begin // @[CSR.scala 162:15]
      mcause63 <= 1'h0; // @[CSR.scala 165:18]
    end else if (isMret) begin // @[CSR.scala 182:22]
      mcause63 <= _GEN_3;
    end else if (wen) begin // @[CSR.scala 188:19]
      mcause63 <= _GEN_48;
    end else begin
      mcause63 <= _GEN_3;
    end
    if (reset) begin // @[CSR.scala 68:23]
      MTIP <= 1'h0; // @[CSR.scala 68:23]
    end else if (expt) begin // @[CSR.scala 162:15]
      MTIP <= clint_intr_0; // @[CSR.scala 71:10]
    end else if (isMret) begin // @[CSR.scala 182:22]
      MTIP <= clint_intr_0; // @[CSR.scala 71:10]
    end else if (wen) begin // @[CSR.scala 188:19]
      MTIP <= _GEN_50;
    end else begin
      MTIP <= clint_intr_0; // @[CSR.scala 71:10]
    end
    if (reset) begin // @[CSR.scala 75:23]
      MTIE <= 1'h0; // @[CSR.scala 75:23]
    end else if (!(expt)) begin // @[CSR.scala 162:15]
      if (!(isMret)) begin // @[CSR.scala 182:22]
        if (wen) begin // @[CSR.scala 188:19]
          MTIE <= _GEN_51;
        end
      end
    end
    if (reset) begin // @[CSR.scala 79:27]
      mscratch <= 64'h0; // @[CSR.scala 79:27]
    end else if (!(expt)) begin // @[CSR.scala 162:15]
      if (!(isMret)) begin // @[CSR.scala 182:22]
        if (wen) begin // @[CSR.scala 188:19]
          mscratch <= _GEN_52;
        end
      end
    end
    if (reset) begin // @[CSR.scala 82:27]
      mtval <= 64'h0; // @[CSR.scala 82:27]
    end else if (expt) begin // @[CSR.scala 162:15]
      mtval <= {{32'd0}, io_inst}; // @[CSR.scala 164:16]
    end else if (isMret) begin // @[CSR.scala 182:22]
      mtval <= _GEN_2;
    end else if (wen) begin // @[CSR.scala 188:19]
      mtval <= _GEN_53;
    end else begin
      mtval <= _GEN_2;
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
  FS = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  MIE = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  MPP = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  MPIE = _RAND_3[0:0];
  _RAND_4 = {2{`RANDOM}};
  mcycle = _RAND_4[63:0];
  _RAND_5 = {2{`RANDOM}};
  minstret = _RAND_5[63:0];
  _RAND_6 = {2{`RANDOM}};
  mtvec = _RAND_6[63:0];
  _RAND_7 = {2{`RANDOM}};
  mepc = _RAND_7[63:0];
  _RAND_8 = {2{`RANDOM}};
  mcause62_0 = _RAND_8[62:0];
  _RAND_9 = {1{`RANDOM}};
  mcause63 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  MTIP = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  MTIE = _RAND_11[0:0];
  _RAND_12 = {2{`RANDOM}};
  mscratch = _RAND_12[63:0];
  _RAND_13 = {2{`RANDOM}};
  mtval = _RAND_13[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210232_JMP(
  input  [31:0] io_pc,
  input  [3:0]  io_mode,
  input  [63:0] io_op1,
  input  [63:0] io_op2,
  input  [31:0] io_imm,
  input         io_valid,
  output        io_jump,
  output [31:0] io_jumpPC,
  input         io_prejump,
  output [31:0] io_out
);
  wire  equ = io_op1 == io_op2; // @[JMP.scala 26:23]
  wire  lt = $signed(io_op1) < $signed(io_op2); // @[JMP.scala 27:32]
  wire  ltu = io_op1 < io_op2; // @[JMP.scala 28:23]
  wire  n_equ = ~equ; // @[JMP.scala 30:17]
  wire  n_lt = ~lt; // @[JMP.scala 31:17]
  wire  n_ltu = ~ltu; // @[JMP.scala 32:17]
  wire  _jump_T_5 = 4'h3 == io_mode ? equ : 4'h2 == io_mode | 4'h1 == io_mode; // @[Mux.scala 80:57]
  wire  _jump_T_7 = 4'h4 == io_mode ? n_equ : _jump_T_5; // @[Mux.scala 80:57]
  wire  _jump_T_9 = 4'h5 == io_mode ? n_lt : _jump_T_7; // @[Mux.scala 80:57]
  wire  _jump_T_11 = 4'h6 == io_mode ? n_ltu : _jump_T_9; // @[Mux.scala 80:57]
  wire  _jump_T_13 = 4'h7 == io_mode ? lt : _jump_T_11; // @[Mux.scala 80:57]
  wire  jump = 4'h8 == io_mode ? ltu : _jump_T_13; // @[Mux.scala 80:57]
  wire  jal_sel = io_mode == 4'h1; // @[JMP.scala 45:28]
  wire  jalr_sel = io_mode == 4'h2; // @[JMP.scala 46:29]
  wire  J_inst = jal_sel | jalr_sel; // @[JMP.scala 47:26]
  wire [31:0] _op1_T_3 = 4'h1 == io_mode ? io_op1[31:0] : 32'h0; // @[Mux.scala 80:57]
  wire [31:0] _op1_T_5 = 4'h2 == io_mode ? io_op1[31:0] : _op1_T_3; // @[Mux.scala 80:57]
  wire [31:0] _op1_T_7 = 4'h3 == io_mode ? io_pc : _op1_T_5; // @[Mux.scala 80:57]
  wire [31:0] _op1_T_9 = 4'h4 == io_mode ? io_pc : _op1_T_7; // @[Mux.scala 80:57]
  wire [31:0] _op1_T_11 = 4'h5 == io_mode ? io_pc : _op1_T_9; // @[Mux.scala 80:57]
  wire [31:0] _op1_T_13 = 4'h6 == io_mode ? io_pc : _op1_T_11; // @[Mux.scala 80:57]
  wire [31:0] _op1_T_15 = 4'h7 == io_mode ? io_pc : _op1_T_13; // @[Mux.scala 80:57]
  wire [31:0] op1 = 4'h8 == io_mode ? io_pc : _op1_T_15; // @[Mux.scala 80:57]
  wire [31:0] addout = op1 + io_imm; // @[JMP.scala 60:28]
  wire [31:0] pc4 = io_pc + 32'h4; // @[JMP.scala 61:24]
  wire [30:0] realjumpPC_hi = addout[31:1]; // @[JMP.scala 68:63]
  wire [31:0] _realjumpPC_T_1 = {realjumpPC_hi,1'h0}; // @[Cat.scala 30:58]
  wire [31:0] _realjumpPC_T_2 = jalr_sel ? _realjumpPC_T_1 : addout; // @[JMP.scala 68:41]
  wire [31:0] realjumpPC = jump ? _realjumpPC_T_2 : 32'h0; // @[JMP.scala 68:25]
  wire  _io_jump_T_1 = io_prejump & ~jump; // @[JMP.scala 72:28]
  wire  _io_jump_T_3 = ~io_prejump & jump; // @[JMP.scala 72:55]
  wire [31:0] _io_jumpPC_T_4 = _io_jump_T_3 ? realjumpPC : 32'h0; // @[Mux.scala 98:16]
  assign io_jump = (io_prejump & ~jump | ~io_prejump & jump) & io_valid; // @[JMP.scala 72:69]
  assign io_jumpPC = _io_jump_T_1 ? pc4 : _io_jumpPC_T_4; // @[Mux.scala 98:16]
  assign io_out = J_inst ? pc4 : 32'h0; // @[JMP.scala 65:18]
endmodule
module ysyx_210232_EXU(
  input         clock,
  input         reset,
  input         io_issue_valid,
  input         io_issue_prejump,
  input  [31:0] io_issue_pc,
  input  [31:0] io_issue_inst,
  input  [2:0]  io_issue_func_type,
  input  [3:0]  io_issue_func_mode,
  input  [4:0]  io_issue_rf_raddr1,
  input  [4:0]  io_issue_rf_raddr2,
  input  [1:0]  io_issue_opsrc1,
  input  [1:0]  io_issue_opsrc2,
  input  [63:0] io_issue_imm,
  input         io_issue_rv64w,
  input         io_issue_rf_wen,
  input  [4:0]  io_issue_rf_waddr,
  output        io_rf_ren1,
  output        io_rf_ren2,
  output [4:0]  io_rf_raddr1,
  output [4:0]  io_rf_raddr2,
  input  [63:0] io_rf_rdata1,
  input  [63:0] io_rf_rdata2,
  input         io_dmem_req_ready,
  output        io_dmem_req_valid,
  output [31:0] io_dmem_req_bits_addr,
  output        io_dmem_req_bits_ren,
  output [2:0]  io_dmem_req_bits_size,
  output        io_dmem_req_bits_wen,
  output [7:0]  io_dmem_req_bits_wmask,
  output [63:0] io_dmem_req_bits_wdata,
  output        io_dmem_resp_ready,
  input         io_dmem_resp_valid,
  input  [63:0] io_dmem_resp_bits_rdata,
  input         io_dmem_resp_bits_resp,
  input  [3:0]  io_dmem_resp_bits_id,
  output        io_rf_wen,
  output [4:0]  io_rf_waddr,
  output [2:0]  io_func_type,
  output [63:0] io_alu_out,
  output [63:0] io_lsu_out,
  output [63:0] io_csr_out,
  output [63:0] io_jmp_out,
  output        io_stall,
  output        io_valid,
  output        io_jump,
  output        io_intr,
  output [31:0] io_jumpPC,
  output        LDDone,
  input         commit,
  input         _T_1,
  input         If_Ld_fail
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire [63:0] alu_io_op1; // @[EXU.scala 36:21]
  wire [63:0] alu_io_op2; // @[EXU.scala 36:21]
  wire  alu_io_rv64w; // @[EXU.scala 36:21]
  wire [3:0] alu_io_mode; // @[EXU.scala 36:21]
  wire [63:0] alu_io_out; // @[EXU.scala 36:21]
  wire  lsu_clock; // @[EXU.scala 43:21]
  wire  lsu_reset; // @[EXU.scala 43:21]
  wire  lsu_io_valid; // @[EXU.scala 43:21]
  wire [31:0] lsu_io_op1; // @[EXU.scala 43:21]
  wire [31:0] lsu_io_op2; // @[EXU.scala 43:21]
  wire [3:0] lsu_io_m_mode; // @[EXU.scala 43:21]
  wire [63:0] lsu_io_m_wdata; // @[EXU.scala 43:21]
  wire [63:0] lsu_io_m_rdata; // @[EXU.scala 43:21]
  wire  lsu_io_stall; // @[EXU.scala 43:21]
  wire  lsu_io_dmem_req_ready; // @[EXU.scala 43:21]
  wire  lsu_io_dmem_req_valid; // @[EXU.scala 43:21]
  wire [31:0] lsu_io_dmem_req_bits_addr; // @[EXU.scala 43:21]
  wire  lsu_io_dmem_req_bits_ren; // @[EXU.scala 43:21]
  wire [2:0] lsu_io_dmem_req_bits_size; // @[EXU.scala 43:21]
  wire  lsu_io_dmem_req_bits_wen; // @[EXU.scala 43:21]
  wire [7:0] lsu_io_dmem_req_bits_wmask; // @[EXU.scala 43:21]
  wire [63:0] lsu_io_dmem_req_bits_wdata; // @[EXU.scala 43:21]
  wire  lsu_io_dmem_resp_ready; // @[EXU.scala 43:21]
  wire  lsu_io_dmem_resp_valid; // @[EXU.scala 43:21]
  wire [63:0] lsu_io_dmem_resp_bits_rdata; // @[EXU.scala 43:21]
  wire  lsu_io_dmem_resp_bits_resp; // @[EXU.scala 43:21]
  wire [3:0] lsu_io_dmem_resp_bits_id; // @[EXU.scala 43:21]
  wire  lsu_intr; // @[EXU.scala 43:21]
  wire  lsu_Ex_Ld_fail_0; // @[EXU.scala 43:21]
  wire  lsu_lsu_done_0; // @[EXU.scala 43:21]
  wire  lsu_clint_en_0; // @[EXU.scala 43:21]
  wire  lsu_Ex_Sd_fail_0; // @[EXU.scala 43:21]
  wire  csr_clock; // @[EXU.scala 55:21]
  wire  csr_reset; // @[EXU.scala 55:21]
  wire [31:0] csr_io_pc; // @[EXU.scala 55:21]
  wire [31:0] csr_io_inst; // @[EXU.scala 55:21]
  wire  csr_io_valid; // @[EXU.scala 55:21]
  wire  csr_io_sel; // @[EXU.scala 55:21]
  wire [3:0] csr_io_csrmode; // @[EXU.scala 55:21]
  wire [63:0] csr_io_wr_data; // @[EXU.scala 55:21]
  wire [63:0] csr_io_rd_data; // @[EXU.scala 55:21]
  wire  csr_io_jump; // @[EXU.scala 55:21]
  wire [31:0] csr_io_jumpPC; // @[EXU.scala 55:21]
  wire  csr_io_intr; // @[EXU.scala 55:21]
  wire [31:0] csr_io_intrPC; // @[EXU.scala 55:21]
  wire  csr_clint_intr_0; // @[EXU.scala 55:21]
  wire  csr_Ex_Ld_fail_0; // @[EXU.scala 55:21]
  wire  csr_WB_COMMIT; // @[EXU.scala 55:21]
  wire  csr_clint_en_0; // @[EXU.scala 55:21]
  wire  csr_inst_illegal; // @[EXU.scala 55:21]
  wire  csr_Ex_Sd_fail_0; // @[EXU.scala 55:21]
  wire  csr_If_Ld_fail_0; // @[EXU.scala 55:21]
  wire [31:0] jmp_io_pc; // @[EXU.scala 67:21]
  wire [3:0] jmp_io_mode; // @[EXU.scala 67:21]
  wire [63:0] jmp_io_op1; // @[EXU.scala 67:21]
  wire [63:0] jmp_io_op2; // @[EXU.scala 67:21]
  wire [31:0] jmp_io_imm; // @[EXU.scala 67:21]
  wire  jmp_io_valid; // @[EXU.scala 67:21]
  wire  jmp_io_jump; // @[EXU.scala 67:21]
  wire [31:0] jmp_io_jumpPC; // @[EXU.scala 67:21]
  wire  jmp_io_prejump; // @[EXU.scala 67:21]
  wire [31:0] jmp_io_out; // @[EXU.scala 67:21]
  wire  alu_sel = io_issue_func_type == 3'h1; // @[EXU.scala 12:39]
  wire  csr_sel = io_issue_func_type == 3'h3; // @[EXU.scala 13:39]
  wire  lsu_sel = io_issue_func_type == 3'h2; // @[EXU.scala 14:39]
  wire  jmp_sel = io_issue_func_type == 3'h4; // @[EXU.scala 15:39]
  wire [63:0] _op1_T_1 = 2'h1 == io_issue_opsrc1 ? io_rf_rdata1 : 64'h0; // @[Mux.scala 80:57]
  wire [63:0] _op1_T_3 = 2'h2 == io_issue_opsrc1 ? {{32'd0}, io_issue_pc} : _op1_T_1; // @[Mux.scala 80:57]
  wire [63:0] op1 = 2'h3 == io_issue_opsrc1 ? io_issue_imm : _op1_T_3; // @[Mux.scala 80:57]
  wire [63:0] _op2_T_1 = 2'h1 == io_issue_opsrc2 ? io_rf_rdata2 : 64'h0; // @[Mux.scala 80:57]
  wire [63:0] _op2_T_3 = 2'h2 == io_issue_opsrc2 ? {{32'd0}, io_issue_pc} : _op2_T_1; // @[Mux.scala 80:57]
  wire [63:0] op2 = 2'h3 == io_issue_opsrc2 ? io_issue_imm : _op2_T_3; // @[Mux.scala 80:57]
  wire  _io_jump_T_3 = 3'h4 == io_issue_func_type ? jmp_io_jump : 3'h3 == io_issue_func_type & csr_io_jump; // @[Mux.scala 80:57]
  wire [31:0] _io_jumpPC_T_1 = 3'h3 == io_issue_func_type ? csr_io_jumpPC : 32'h0; // @[Mux.scala 80:57]
  wire [31:0] _io_jumpPC_T_3 = 3'h4 == io_issue_func_type ? jmp_io_jumpPC : _io_jumpPC_T_1; // @[Mux.scala 80:57]
  reg  intr_cancel; // @[EXU.scala 101:30]
  wire  _GEN_0 = LDDone ? 1'h0 : intr_cancel; // @[EXU.scala 104:25 EXU.scala 105:21 EXU.scala 101:30]
  wire  _GEN_1 = csr_io_intr | _GEN_0; // @[EXU.scala 102:22 EXU.scala 103:21]
  ysyx_210232_ALU alu ( // @[EXU.scala 36:21]
    .io_op1(alu_io_op1),
    .io_op2(alu_io_op2),
    .io_rv64w(alu_io_rv64w),
    .io_mode(alu_io_mode),
    .io_out(alu_io_out)
  );
  ysyx_210232_LSUwithUserBus lsu ( // @[EXU.scala 43:21]
    .clock(lsu_clock),
    .reset(lsu_reset),
    .io_valid(lsu_io_valid),
    .io_op1(lsu_io_op1),
    .io_op2(lsu_io_op2),
    .io_m_mode(lsu_io_m_mode),
    .io_m_wdata(lsu_io_m_wdata),
    .io_m_rdata(lsu_io_m_rdata),
    .io_stall(lsu_io_stall),
    .io_dmem_req_ready(lsu_io_dmem_req_ready),
    .io_dmem_req_valid(lsu_io_dmem_req_valid),
    .io_dmem_req_bits_addr(lsu_io_dmem_req_bits_addr),
    .io_dmem_req_bits_ren(lsu_io_dmem_req_bits_ren),
    .io_dmem_req_bits_size(lsu_io_dmem_req_bits_size),
    .io_dmem_req_bits_wen(lsu_io_dmem_req_bits_wen),
    .io_dmem_req_bits_wmask(lsu_io_dmem_req_bits_wmask),
    .io_dmem_req_bits_wdata(lsu_io_dmem_req_bits_wdata),
    .io_dmem_resp_ready(lsu_io_dmem_resp_ready),
    .io_dmem_resp_valid(lsu_io_dmem_resp_valid),
    .io_dmem_resp_bits_rdata(lsu_io_dmem_resp_bits_rdata),
    .io_dmem_resp_bits_resp(lsu_io_dmem_resp_bits_resp),
    .io_dmem_resp_bits_id(lsu_io_dmem_resp_bits_id),
    .intr(lsu_intr),
    .Ex_Ld_fail_0(lsu_Ex_Ld_fail_0),
    .lsu_done_0(lsu_lsu_done_0),
    .clint_en_0(lsu_clint_en_0),
    .Ex_Sd_fail_0(lsu_Ex_Sd_fail_0)
  );
  ysyx_210232_CSR csr ( // @[EXU.scala 55:21]
    .clock(csr_clock),
    .reset(csr_reset),
    .io_pc(csr_io_pc),
    .io_inst(csr_io_inst),
    .io_valid(csr_io_valid),
    .io_sel(csr_io_sel),
    .io_csrmode(csr_io_csrmode),
    .io_wr_data(csr_io_wr_data),
    .io_rd_data(csr_io_rd_data),
    .io_jump(csr_io_jump),
    .io_jumpPC(csr_io_jumpPC),
    .io_intr(csr_io_intr),
    .io_intrPC(csr_io_intrPC),
    .clint_intr_0(csr_clint_intr_0),
    .Ex_Ld_fail_0(csr_Ex_Ld_fail_0),
    .WB_COMMIT(csr_WB_COMMIT),
    .clint_en_0(csr_clint_en_0),
    .inst_illegal(csr_inst_illegal),
    .Ex_Sd_fail_0(csr_Ex_Sd_fail_0),
    .If_Ld_fail_0(csr_If_Ld_fail_0)
  );
  ysyx_210232_JMP jmp ( // @[EXU.scala 67:21]
    .io_pc(jmp_io_pc),
    .io_mode(jmp_io_mode),
    .io_op1(jmp_io_op1),
    .io_op2(jmp_io_op2),
    .io_imm(jmp_io_imm),
    .io_valid(jmp_io_valid),
    .io_jump(jmp_io_jump),
    .io_jumpPC(jmp_io_jumpPC),
    .io_prejump(jmp_io_prejump),
    .io_out(jmp_io_out)
  );
  assign io_rf_ren1 = io_issue_opsrc1 == 2'h1; // @[EXU.scala 18:38]
  assign io_rf_ren2 = io_issue_opsrc2 == 2'h1; // @[EXU.scala 19:38]
  assign io_rf_raddr1 = io_issue_rf_raddr1; // @[EXU.scala 20:19]
  assign io_rf_raddr2 = io_issue_rf_raddr2; // @[EXU.scala 21:19]
  assign io_dmem_req_valid = lsu_io_dmem_req_valid; // @[EXU.scala 51:20]
  assign io_dmem_req_bits_addr = lsu_io_dmem_req_bits_addr; // @[EXU.scala 51:20]
  assign io_dmem_req_bits_ren = lsu_io_dmem_req_bits_ren; // @[EXU.scala 51:20]
  assign io_dmem_req_bits_size = lsu_io_dmem_req_bits_size; // @[EXU.scala 51:20]
  assign io_dmem_req_bits_wen = lsu_io_dmem_req_bits_wen; // @[EXU.scala 51:20]
  assign io_dmem_req_bits_wmask = lsu_io_dmem_req_bits_wmask; // @[EXU.scala 51:20]
  assign io_dmem_req_bits_wdata = lsu_io_dmem_req_bits_wdata; // @[EXU.scala 51:20]
  assign io_dmem_resp_ready = lsu_io_dmem_resp_ready; // @[EXU.scala 51:20]
  assign io_rf_wen = io_issue_rf_wen; // @[EXU.scala 97:17]
  assign io_rf_waddr = io_issue_rf_waddr; // @[EXU.scala 98:17]
  assign io_func_type = io_issue_func_type; // @[EXU.scala 17:18]
  assign io_alu_out = alu_io_out; // @[EXU.scala 41:18]
  assign io_lsu_out = lsu_io_m_rdata; // @[EXU.scala 52:20]
  assign io_csr_out = csr_io_rd_data; // @[EXU.scala 62:21]
  assign io_jmp_out = {{32'd0}, jmp_io_out}; // @[EXU.scala 76:17]
  assign io_stall = lsu_io_stall; // @[EXU.scala 53:20]
  assign io_valid = io_issue_valid | LDDone & ~intr_cancel; // @[EXU.scala 109:32]
  assign io_jump = csr_io_intr ? csr_io_intr : _io_jump_T_3; // @[EXU.scala 81:19]
  assign io_intr = csr_io_intr; // @[EXU.scala 80:15]
  assign io_jumpPC = csr_io_intr ? csr_io_intrPC : _io_jumpPC_T_3; // @[EXU.scala 89:21]
  assign LDDone = lsu_lsu_done_0;
  assign alu_io_op1 = alu_sel ? op1 : 64'h0; // @[EXU.scala 37:24]
  assign alu_io_op2 = alu_sel ? op2 : 64'h0; // @[EXU.scala 38:24]
  assign alu_io_rv64w = alu_sel & io_issue_rv64w; // @[EXU.scala 39:24]
  assign alu_io_mode = alu_sel ? io_issue_func_mode : 4'h0; // @[EXU.scala 40:24]
  assign lsu_clock = clock;
  assign lsu_reset = reset;
  assign lsu_io_valid = io_issue_valid & lsu_sel; // @[EXU.scala 50:38]
  assign lsu_io_op1 = lsu_sel ? op1[31:0] : 32'h0; // @[EXU.scala 44:26]
  assign lsu_io_op2 = lsu_sel ? io_issue_imm[31:0] : 32'h0; // @[EXU.scala 45:26]
  assign lsu_io_m_mode = lsu_sel ? io_issue_func_mode : 4'h0; // @[EXU.scala 48:26]
  assign lsu_io_m_wdata = lsu_sel ? op2 : 64'h0; // @[EXU.scala 49:26]
  assign lsu_io_dmem_req_ready = io_dmem_req_ready; // @[EXU.scala 51:20]
  assign lsu_io_dmem_resp_valid = io_dmem_resp_valid; // @[EXU.scala 51:20]
  assign lsu_io_dmem_resp_bits_rdata = io_dmem_resp_bits_rdata; // @[EXU.scala 51:20]
  assign lsu_io_dmem_resp_bits_resp = io_dmem_resp_bits_resp; // @[EXU.scala 51:20]
  assign lsu_io_dmem_resp_bits_id = io_dmem_resp_bits_id; // @[EXU.scala 51:20]
  assign lsu_clint_en_0 = csr_clint_en_0;
  assign csr_clock = clock;
  assign csr_reset = reset;
  assign csr_io_pc = io_issue_pc; // @[EXU.scala 56:21]
  assign csr_io_inst = csr_sel ? io_issue_inst : 32'h0; // @[EXU.scala 59:27]
  assign csr_io_valid = io_issue_valid & ~lsu_sel; // @[EXU.scala 57:39]
  assign csr_io_sel = io_issue_func_type == 3'h3; // @[EXU.scala 13:39]
  assign csr_io_csrmode = csr_sel ? io_issue_func_mode : 4'h0; // @[EXU.scala 60:27]
  assign csr_io_wr_data = csr_sel ? op1 : 64'h0; // @[EXU.scala 61:27]
  assign csr_clint_intr_0 = lsu_intr;
  assign csr_Ex_Ld_fail_0 = lsu_Ex_Ld_fail_0;
  assign csr_WB_COMMIT = commit;
  assign csr_inst_illegal = _T_1;
  assign csr_Ex_Sd_fail_0 = lsu_Ex_Sd_fail_0;
  assign csr_If_Ld_fail_0 = If_Ld_fail;
  assign jmp_io_pc = io_issue_pc; // @[EXU.scala 69:17]
  assign jmp_io_mode = jmp_sel ? io_issue_func_mode : 4'h0; // @[EXU.scala 72:24]
  assign jmp_io_op1 = jmp_sel ? op1 : 64'h0; // @[EXU.scala 73:24]
  assign jmp_io_op2 = jmp_sel ? op2 : 64'h0; // @[EXU.scala 74:24]
  assign jmp_io_imm = jmp_sel ? io_issue_imm[31:0] : 32'h0; // @[EXU.scala 75:24]
  assign jmp_io_valid = io_issue_valid & jmp_sel; // @[EXU.scala 68:36]
  assign jmp_io_prejump = io_issue_prejump; // @[EXU.scala 71:22]
  always @(posedge clock) begin
    if (reset) begin // @[EXU.scala 101:30]
      intr_cancel <= 1'h0; // @[EXU.scala 101:30]
    end else begin
      intr_cancel <= _GEN_1;
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
  intr_cancel = _RAND_0[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210232_regfile(
  input         clock,
  input         reset,
  input         io_wen,
  input  [4:0]  io_waddr,
  input         io_ren1,
  input  [4:0]  io_raddr1,
  input         io_ren2,
  input  [4:0]  io_raddr2,
  output [63:0] io_rdata1,
  output [63:0] io_rdata2,
  input  [63:0] io_wdata
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
  reg [63:0] regs_0; // @[regfile.scala 28:27]
  reg [63:0] regs_1; // @[regfile.scala 28:27]
  reg [63:0] regs_2; // @[regfile.scala 28:27]
  reg [63:0] regs_3; // @[regfile.scala 28:27]
  reg [63:0] regs_4; // @[regfile.scala 28:27]
  reg [63:0] regs_5; // @[regfile.scala 28:27]
  reg [63:0] regs_6; // @[regfile.scala 28:27]
  reg [63:0] regs_7; // @[regfile.scala 28:27]
  reg [63:0] regs_8; // @[regfile.scala 28:27]
  reg [63:0] regs_9; // @[regfile.scala 28:27]
  reg [63:0] regs_10; // @[regfile.scala 28:27]
  reg [63:0] regs_11; // @[regfile.scala 28:27]
  reg [63:0] regs_12; // @[regfile.scala 28:27]
  reg [63:0] regs_13; // @[regfile.scala 28:27]
  reg [63:0] regs_14; // @[regfile.scala 28:27]
  reg [63:0] regs_15; // @[regfile.scala 28:27]
  reg [63:0] regs_16; // @[regfile.scala 28:27]
  reg [63:0] regs_17; // @[regfile.scala 28:27]
  reg [63:0] regs_18; // @[regfile.scala 28:27]
  reg [63:0] regs_19; // @[regfile.scala 28:27]
  reg [63:0] regs_20; // @[regfile.scala 28:27]
  reg [63:0] regs_21; // @[regfile.scala 28:27]
  reg [63:0] regs_22; // @[regfile.scala 28:27]
  reg [63:0] regs_23; // @[regfile.scala 28:27]
  reg [63:0] regs_24; // @[regfile.scala 28:27]
  reg [63:0] regs_25; // @[regfile.scala 28:27]
  reg [63:0] regs_26; // @[regfile.scala 28:27]
  reg [63:0] regs_27; // @[regfile.scala 28:27]
  reg [63:0] regs_28; // @[regfile.scala 28:27]
  reg [63:0] regs_29; // @[regfile.scala 28:27]
  reg [63:0] regs_30; // @[regfile.scala 28:27]
  reg [63:0] regs_31; // @[regfile.scala 28:27]
  wire [63:0] _GEN_65 = 5'h1 == io_raddr1 ? regs_1 : regs_0; // @[regfile.scala 36:21 regfile.scala 36:21]
  wire [63:0] _GEN_66 = 5'h2 == io_raddr1 ? regs_2 : _GEN_65; // @[regfile.scala 36:21 regfile.scala 36:21]
  wire [63:0] _GEN_67 = 5'h3 == io_raddr1 ? regs_3 : _GEN_66; // @[regfile.scala 36:21 regfile.scala 36:21]
  wire [63:0] _GEN_68 = 5'h4 == io_raddr1 ? regs_4 : _GEN_67; // @[regfile.scala 36:21 regfile.scala 36:21]
  wire [63:0] _GEN_69 = 5'h5 == io_raddr1 ? regs_5 : _GEN_68; // @[regfile.scala 36:21 regfile.scala 36:21]
  wire [63:0] _GEN_70 = 5'h6 == io_raddr1 ? regs_6 : _GEN_69; // @[regfile.scala 36:21 regfile.scala 36:21]
  wire [63:0] _GEN_71 = 5'h7 == io_raddr1 ? regs_7 : _GEN_70; // @[regfile.scala 36:21 regfile.scala 36:21]
  wire [63:0] _GEN_72 = 5'h8 == io_raddr1 ? regs_8 : _GEN_71; // @[regfile.scala 36:21 regfile.scala 36:21]
  wire [63:0] _GEN_73 = 5'h9 == io_raddr1 ? regs_9 : _GEN_72; // @[regfile.scala 36:21 regfile.scala 36:21]
  wire [63:0] _GEN_74 = 5'ha == io_raddr1 ? regs_10 : _GEN_73; // @[regfile.scala 36:21 regfile.scala 36:21]
  wire [63:0] _GEN_75 = 5'hb == io_raddr1 ? regs_11 : _GEN_74; // @[regfile.scala 36:21 regfile.scala 36:21]
  wire [63:0] _GEN_76 = 5'hc == io_raddr1 ? regs_12 : _GEN_75; // @[regfile.scala 36:21 regfile.scala 36:21]
  wire [63:0] _GEN_77 = 5'hd == io_raddr1 ? regs_13 : _GEN_76; // @[regfile.scala 36:21 regfile.scala 36:21]
  wire [63:0] _GEN_78 = 5'he == io_raddr1 ? regs_14 : _GEN_77; // @[regfile.scala 36:21 regfile.scala 36:21]
  wire [63:0] _GEN_79 = 5'hf == io_raddr1 ? regs_15 : _GEN_78; // @[regfile.scala 36:21 regfile.scala 36:21]
  wire [63:0] _GEN_80 = 5'h10 == io_raddr1 ? regs_16 : _GEN_79; // @[regfile.scala 36:21 regfile.scala 36:21]
  wire [63:0] _GEN_81 = 5'h11 == io_raddr1 ? regs_17 : _GEN_80; // @[regfile.scala 36:21 regfile.scala 36:21]
  wire [63:0] _GEN_82 = 5'h12 == io_raddr1 ? regs_18 : _GEN_81; // @[regfile.scala 36:21 regfile.scala 36:21]
  wire [63:0] _GEN_83 = 5'h13 == io_raddr1 ? regs_19 : _GEN_82; // @[regfile.scala 36:21 regfile.scala 36:21]
  wire [63:0] _GEN_84 = 5'h14 == io_raddr1 ? regs_20 : _GEN_83; // @[regfile.scala 36:21 regfile.scala 36:21]
  wire [63:0] _GEN_85 = 5'h15 == io_raddr1 ? regs_21 : _GEN_84; // @[regfile.scala 36:21 regfile.scala 36:21]
  wire [63:0] _GEN_86 = 5'h16 == io_raddr1 ? regs_22 : _GEN_85; // @[regfile.scala 36:21 regfile.scala 36:21]
  wire [63:0] _GEN_87 = 5'h17 == io_raddr1 ? regs_23 : _GEN_86; // @[regfile.scala 36:21 regfile.scala 36:21]
  wire [63:0] _GEN_88 = 5'h18 == io_raddr1 ? regs_24 : _GEN_87; // @[regfile.scala 36:21 regfile.scala 36:21]
  wire [63:0] _GEN_89 = 5'h19 == io_raddr1 ? regs_25 : _GEN_88; // @[regfile.scala 36:21 regfile.scala 36:21]
  wire [63:0] _GEN_90 = 5'h1a == io_raddr1 ? regs_26 : _GEN_89; // @[regfile.scala 36:21 regfile.scala 36:21]
  wire [63:0] _GEN_91 = 5'h1b == io_raddr1 ? regs_27 : _GEN_90; // @[regfile.scala 36:21 regfile.scala 36:21]
  wire [63:0] _GEN_92 = 5'h1c == io_raddr1 ? regs_28 : _GEN_91; // @[regfile.scala 36:21 regfile.scala 36:21]
  wire [63:0] _GEN_93 = 5'h1d == io_raddr1 ? regs_29 : _GEN_92; // @[regfile.scala 36:21 regfile.scala 36:21]
  wire [63:0] _GEN_94 = 5'h1e == io_raddr1 ? regs_30 : _GEN_93; // @[regfile.scala 36:21 regfile.scala 36:21]
  wire [63:0] _GEN_95 = 5'h1f == io_raddr1 ? regs_31 : _GEN_94; // @[regfile.scala 36:21 regfile.scala 36:21]
  wire [63:0] _GEN_97 = 5'h1 == io_raddr2 ? regs_1 : regs_0; // @[regfile.scala 37:21 regfile.scala 37:21]
  wire [63:0] _GEN_98 = 5'h2 == io_raddr2 ? regs_2 : _GEN_97; // @[regfile.scala 37:21 regfile.scala 37:21]
  wire [63:0] _GEN_99 = 5'h3 == io_raddr2 ? regs_3 : _GEN_98; // @[regfile.scala 37:21 regfile.scala 37:21]
  wire [63:0] _GEN_100 = 5'h4 == io_raddr2 ? regs_4 : _GEN_99; // @[regfile.scala 37:21 regfile.scala 37:21]
  wire [63:0] _GEN_101 = 5'h5 == io_raddr2 ? regs_5 : _GEN_100; // @[regfile.scala 37:21 regfile.scala 37:21]
  wire [63:0] _GEN_102 = 5'h6 == io_raddr2 ? regs_6 : _GEN_101; // @[regfile.scala 37:21 regfile.scala 37:21]
  wire [63:0] _GEN_103 = 5'h7 == io_raddr2 ? regs_7 : _GEN_102; // @[regfile.scala 37:21 regfile.scala 37:21]
  wire [63:0] _GEN_104 = 5'h8 == io_raddr2 ? regs_8 : _GEN_103; // @[regfile.scala 37:21 regfile.scala 37:21]
  wire [63:0] _GEN_105 = 5'h9 == io_raddr2 ? regs_9 : _GEN_104; // @[regfile.scala 37:21 regfile.scala 37:21]
  wire [63:0] _GEN_106 = 5'ha == io_raddr2 ? regs_10 : _GEN_105; // @[regfile.scala 37:21 regfile.scala 37:21]
  wire [63:0] _GEN_107 = 5'hb == io_raddr2 ? regs_11 : _GEN_106; // @[regfile.scala 37:21 regfile.scala 37:21]
  wire [63:0] _GEN_108 = 5'hc == io_raddr2 ? regs_12 : _GEN_107; // @[regfile.scala 37:21 regfile.scala 37:21]
  wire [63:0] _GEN_109 = 5'hd == io_raddr2 ? regs_13 : _GEN_108; // @[regfile.scala 37:21 regfile.scala 37:21]
  wire [63:0] _GEN_110 = 5'he == io_raddr2 ? regs_14 : _GEN_109; // @[regfile.scala 37:21 regfile.scala 37:21]
  wire [63:0] _GEN_111 = 5'hf == io_raddr2 ? regs_15 : _GEN_110; // @[regfile.scala 37:21 regfile.scala 37:21]
  wire [63:0] _GEN_112 = 5'h10 == io_raddr2 ? regs_16 : _GEN_111; // @[regfile.scala 37:21 regfile.scala 37:21]
  wire [63:0] _GEN_113 = 5'h11 == io_raddr2 ? regs_17 : _GEN_112; // @[regfile.scala 37:21 regfile.scala 37:21]
  wire [63:0] _GEN_114 = 5'h12 == io_raddr2 ? regs_18 : _GEN_113; // @[regfile.scala 37:21 regfile.scala 37:21]
  wire [63:0] _GEN_115 = 5'h13 == io_raddr2 ? regs_19 : _GEN_114; // @[regfile.scala 37:21 regfile.scala 37:21]
  wire [63:0] _GEN_116 = 5'h14 == io_raddr2 ? regs_20 : _GEN_115; // @[regfile.scala 37:21 regfile.scala 37:21]
  wire [63:0] _GEN_117 = 5'h15 == io_raddr2 ? regs_21 : _GEN_116; // @[regfile.scala 37:21 regfile.scala 37:21]
  wire [63:0] _GEN_118 = 5'h16 == io_raddr2 ? regs_22 : _GEN_117; // @[regfile.scala 37:21 regfile.scala 37:21]
  wire [63:0] _GEN_119 = 5'h17 == io_raddr2 ? regs_23 : _GEN_118; // @[regfile.scala 37:21 regfile.scala 37:21]
  wire [63:0] _GEN_120 = 5'h18 == io_raddr2 ? regs_24 : _GEN_119; // @[regfile.scala 37:21 regfile.scala 37:21]
  wire [63:0] _GEN_121 = 5'h19 == io_raddr2 ? regs_25 : _GEN_120; // @[regfile.scala 37:21 regfile.scala 37:21]
  wire [63:0] _GEN_122 = 5'h1a == io_raddr2 ? regs_26 : _GEN_121; // @[regfile.scala 37:21 regfile.scala 37:21]
  wire [63:0] _GEN_123 = 5'h1b == io_raddr2 ? regs_27 : _GEN_122; // @[regfile.scala 37:21 regfile.scala 37:21]
  wire [63:0] _GEN_124 = 5'h1c == io_raddr2 ? regs_28 : _GEN_123; // @[regfile.scala 37:21 regfile.scala 37:21]
  wire [63:0] _GEN_125 = 5'h1d == io_raddr2 ? regs_29 : _GEN_124; // @[regfile.scala 37:21 regfile.scala 37:21]
  wire [63:0] _GEN_126 = 5'h1e == io_raddr2 ? regs_30 : _GEN_125; // @[regfile.scala 37:21 regfile.scala 37:21]
  wire [63:0] _GEN_127 = 5'h1f == io_raddr2 ? regs_31 : _GEN_126; // @[regfile.scala 37:21 regfile.scala 37:21]
  assign io_rdata1 = io_ren1 ? _GEN_95 : 64'h0; // @[regfile.scala 36:21]
  assign io_rdata2 = io_ren2 ? _GEN_127 : 64'h0; // @[regfile.scala 37:21]
  always @(posedge clock) begin
    if (reset) begin // @[regfile.scala 28:27]
      regs_0 <= 64'h0; // @[regfile.scala 28:27]
    end else if (io_wen & io_waddr != 5'h0) begin // @[regfile.scala 32:36]
      if (5'h0 == io_waddr) begin // @[regfile.scala 33:23]
        regs_0 <= io_wdata; // @[regfile.scala 33:23]
      end
    end
    if (reset) begin // @[regfile.scala 28:27]
      regs_1 <= 64'h0; // @[regfile.scala 28:27]
    end else if (io_wen & io_waddr != 5'h0) begin // @[regfile.scala 32:36]
      if (5'h1 == io_waddr) begin // @[regfile.scala 33:23]
        regs_1 <= io_wdata; // @[regfile.scala 33:23]
      end
    end
    if (reset) begin // @[regfile.scala 28:27]
      regs_2 <= 64'h0; // @[regfile.scala 28:27]
    end else if (io_wen & io_waddr != 5'h0) begin // @[regfile.scala 32:36]
      if (5'h2 == io_waddr) begin // @[regfile.scala 33:23]
        regs_2 <= io_wdata; // @[regfile.scala 33:23]
      end
    end
    if (reset) begin // @[regfile.scala 28:27]
      regs_3 <= 64'h0; // @[regfile.scala 28:27]
    end else if (io_wen & io_waddr != 5'h0) begin // @[regfile.scala 32:36]
      if (5'h3 == io_waddr) begin // @[regfile.scala 33:23]
        regs_3 <= io_wdata; // @[regfile.scala 33:23]
      end
    end
    if (reset) begin // @[regfile.scala 28:27]
      regs_4 <= 64'h0; // @[regfile.scala 28:27]
    end else if (io_wen & io_waddr != 5'h0) begin // @[regfile.scala 32:36]
      if (5'h4 == io_waddr) begin // @[regfile.scala 33:23]
        regs_4 <= io_wdata; // @[regfile.scala 33:23]
      end
    end
    if (reset) begin // @[regfile.scala 28:27]
      regs_5 <= 64'h0; // @[regfile.scala 28:27]
    end else if (io_wen & io_waddr != 5'h0) begin // @[regfile.scala 32:36]
      if (5'h5 == io_waddr) begin // @[regfile.scala 33:23]
        regs_5 <= io_wdata; // @[regfile.scala 33:23]
      end
    end
    if (reset) begin // @[regfile.scala 28:27]
      regs_6 <= 64'h0; // @[regfile.scala 28:27]
    end else if (io_wen & io_waddr != 5'h0) begin // @[regfile.scala 32:36]
      if (5'h6 == io_waddr) begin // @[regfile.scala 33:23]
        regs_6 <= io_wdata; // @[regfile.scala 33:23]
      end
    end
    if (reset) begin // @[regfile.scala 28:27]
      regs_7 <= 64'h0; // @[regfile.scala 28:27]
    end else if (io_wen & io_waddr != 5'h0) begin // @[regfile.scala 32:36]
      if (5'h7 == io_waddr) begin // @[regfile.scala 33:23]
        regs_7 <= io_wdata; // @[regfile.scala 33:23]
      end
    end
    if (reset) begin // @[regfile.scala 28:27]
      regs_8 <= 64'h0; // @[regfile.scala 28:27]
    end else if (io_wen & io_waddr != 5'h0) begin // @[regfile.scala 32:36]
      if (5'h8 == io_waddr) begin // @[regfile.scala 33:23]
        regs_8 <= io_wdata; // @[regfile.scala 33:23]
      end
    end
    if (reset) begin // @[regfile.scala 28:27]
      regs_9 <= 64'h0; // @[regfile.scala 28:27]
    end else if (io_wen & io_waddr != 5'h0) begin // @[regfile.scala 32:36]
      if (5'h9 == io_waddr) begin // @[regfile.scala 33:23]
        regs_9 <= io_wdata; // @[regfile.scala 33:23]
      end
    end
    if (reset) begin // @[regfile.scala 28:27]
      regs_10 <= 64'h0; // @[regfile.scala 28:27]
    end else if (io_wen & io_waddr != 5'h0) begin // @[regfile.scala 32:36]
      if (5'ha == io_waddr) begin // @[regfile.scala 33:23]
        regs_10 <= io_wdata; // @[regfile.scala 33:23]
      end
    end
    if (reset) begin // @[regfile.scala 28:27]
      regs_11 <= 64'h0; // @[regfile.scala 28:27]
    end else if (io_wen & io_waddr != 5'h0) begin // @[regfile.scala 32:36]
      if (5'hb == io_waddr) begin // @[regfile.scala 33:23]
        regs_11 <= io_wdata; // @[regfile.scala 33:23]
      end
    end
    if (reset) begin // @[regfile.scala 28:27]
      regs_12 <= 64'h0; // @[regfile.scala 28:27]
    end else if (io_wen & io_waddr != 5'h0) begin // @[regfile.scala 32:36]
      if (5'hc == io_waddr) begin // @[regfile.scala 33:23]
        regs_12 <= io_wdata; // @[regfile.scala 33:23]
      end
    end
    if (reset) begin // @[regfile.scala 28:27]
      regs_13 <= 64'h0; // @[regfile.scala 28:27]
    end else if (io_wen & io_waddr != 5'h0) begin // @[regfile.scala 32:36]
      if (5'hd == io_waddr) begin // @[regfile.scala 33:23]
        regs_13 <= io_wdata; // @[regfile.scala 33:23]
      end
    end
    if (reset) begin // @[regfile.scala 28:27]
      regs_14 <= 64'h0; // @[regfile.scala 28:27]
    end else if (io_wen & io_waddr != 5'h0) begin // @[regfile.scala 32:36]
      if (5'he == io_waddr) begin // @[regfile.scala 33:23]
        regs_14 <= io_wdata; // @[regfile.scala 33:23]
      end
    end
    if (reset) begin // @[regfile.scala 28:27]
      regs_15 <= 64'h0; // @[regfile.scala 28:27]
    end else if (io_wen & io_waddr != 5'h0) begin // @[regfile.scala 32:36]
      if (5'hf == io_waddr) begin // @[regfile.scala 33:23]
        regs_15 <= io_wdata; // @[regfile.scala 33:23]
      end
    end
    if (reset) begin // @[regfile.scala 28:27]
      regs_16 <= 64'h0; // @[regfile.scala 28:27]
    end else if (io_wen & io_waddr != 5'h0) begin // @[regfile.scala 32:36]
      if (5'h10 == io_waddr) begin // @[regfile.scala 33:23]
        regs_16 <= io_wdata; // @[regfile.scala 33:23]
      end
    end
    if (reset) begin // @[regfile.scala 28:27]
      regs_17 <= 64'h0; // @[regfile.scala 28:27]
    end else if (io_wen & io_waddr != 5'h0) begin // @[regfile.scala 32:36]
      if (5'h11 == io_waddr) begin // @[regfile.scala 33:23]
        regs_17 <= io_wdata; // @[regfile.scala 33:23]
      end
    end
    if (reset) begin // @[regfile.scala 28:27]
      regs_18 <= 64'h0; // @[regfile.scala 28:27]
    end else if (io_wen & io_waddr != 5'h0) begin // @[regfile.scala 32:36]
      if (5'h12 == io_waddr) begin // @[regfile.scala 33:23]
        regs_18 <= io_wdata; // @[regfile.scala 33:23]
      end
    end
    if (reset) begin // @[regfile.scala 28:27]
      regs_19 <= 64'h0; // @[regfile.scala 28:27]
    end else if (io_wen & io_waddr != 5'h0) begin // @[regfile.scala 32:36]
      if (5'h13 == io_waddr) begin // @[regfile.scala 33:23]
        regs_19 <= io_wdata; // @[regfile.scala 33:23]
      end
    end
    if (reset) begin // @[regfile.scala 28:27]
      regs_20 <= 64'h0; // @[regfile.scala 28:27]
    end else if (io_wen & io_waddr != 5'h0) begin // @[regfile.scala 32:36]
      if (5'h14 == io_waddr) begin // @[regfile.scala 33:23]
        regs_20 <= io_wdata; // @[regfile.scala 33:23]
      end
    end
    if (reset) begin // @[regfile.scala 28:27]
      regs_21 <= 64'h0; // @[regfile.scala 28:27]
    end else if (io_wen & io_waddr != 5'h0) begin // @[regfile.scala 32:36]
      if (5'h15 == io_waddr) begin // @[regfile.scala 33:23]
        regs_21 <= io_wdata; // @[regfile.scala 33:23]
      end
    end
    if (reset) begin // @[regfile.scala 28:27]
      regs_22 <= 64'h0; // @[regfile.scala 28:27]
    end else if (io_wen & io_waddr != 5'h0) begin // @[regfile.scala 32:36]
      if (5'h16 == io_waddr) begin // @[regfile.scala 33:23]
        regs_22 <= io_wdata; // @[regfile.scala 33:23]
      end
    end
    if (reset) begin // @[regfile.scala 28:27]
      regs_23 <= 64'h0; // @[regfile.scala 28:27]
    end else if (io_wen & io_waddr != 5'h0) begin // @[regfile.scala 32:36]
      if (5'h17 == io_waddr) begin // @[regfile.scala 33:23]
        regs_23 <= io_wdata; // @[regfile.scala 33:23]
      end
    end
    if (reset) begin // @[regfile.scala 28:27]
      regs_24 <= 64'h0; // @[regfile.scala 28:27]
    end else if (io_wen & io_waddr != 5'h0) begin // @[regfile.scala 32:36]
      if (5'h18 == io_waddr) begin // @[regfile.scala 33:23]
        regs_24 <= io_wdata; // @[regfile.scala 33:23]
      end
    end
    if (reset) begin // @[regfile.scala 28:27]
      regs_25 <= 64'h0; // @[regfile.scala 28:27]
    end else if (io_wen & io_waddr != 5'h0) begin // @[regfile.scala 32:36]
      if (5'h19 == io_waddr) begin // @[regfile.scala 33:23]
        regs_25 <= io_wdata; // @[regfile.scala 33:23]
      end
    end
    if (reset) begin // @[regfile.scala 28:27]
      regs_26 <= 64'h0; // @[regfile.scala 28:27]
    end else if (io_wen & io_waddr != 5'h0) begin // @[regfile.scala 32:36]
      if (5'h1a == io_waddr) begin // @[regfile.scala 33:23]
        regs_26 <= io_wdata; // @[regfile.scala 33:23]
      end
    end
    if (reset) begin // @[regfile.scala 28:27]
      regs_27 <= 64'h0; // @[regfile.scala 28:27]
    end else if (io_wen & io_waddr != 5'h0) begin // @[regfile.scala 32:36]
      if (5'h1b == io_waddr) begin // @[regfile.scala 33:23]
        regs_27 <= io_wdata; // @[regfile.scala 33:23]
      end
    end
    if (reset) begin // @[regfile.scala 28:27]
      regs_28 <= 64'h0; // @[regfile.scala 28:27]
    end else if (io_wen & io_waddr != 5'h0) begin // @[regfile.scala 32:36]
      if (5'h1c == io_waddr) begin // @[regfile.scala 33:23]
        regs_28 <= io_wdata; // @[regfile.scala 33:23]
      end
    end
    if (reset) begin // @[regfile.scala 28:27]
      regs_29 <= 64'h0; // @[regfile.scala 28:27]
    end else if (io_wen & io_waddr != 5'h0) begin // @[regfile.scala 32:36]
      if (5'h1d == io_waddr) begin // @[regfile.scala 33:23]
        regs_29 <= io_wdata; // @[regfile.scala 33:23]
      end
    end
    if (reset) begin // @[regfile.scala 28:27]
      regs_30 <= 64'h0; // @[regfile.scala 28:27]
    end else if (io_wen & io_waddr != 5'h0) begin // @[regfile.scala 32:36]
      if (5'h1e == io_waddr) begin // @[regfile.scala 33:23]
        regs_30 <= io_wdata; // @[regfile.scala 33:23]
      end
    end
    if (reset) begin // @[regfile.scala 28:27]
      regs_31 <= 64'h0; // @[regfile.scala 28:27]
    end else if (io_wen & io_waddr != 5'h0) begin // @[regfile.scala 32:36]
      if (5'h1f == io_waddr) begin // @[regfile.scala 33:23]
        regs_31 <= io_wdata; // @[regfile.scala 33:23]
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
  regs_0 = _RAND_0[63:0];
  _RAND_1 = {2{`RANDOM}};
  regs_1 = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  regs_2 = _RAND_2[63:0];
  _RAND_3 = {2{`RANDOM}};
  regs_3 = _RAND_3[63:0];
  _RAND_4 = {2{`RANDOM}};
  regs_4 = _RAND_4[63:0];
  _RAND_5 = {2{`RANDOM}};
  regs_5 = _RAND_5[63:0];
  _RAND_6 = {2{`RANDOM}};
  regs_6 = _RAND_6[63:0];
  _RAND_7 = {2{`RANDOM}};
  regs_7 = _RAND_7[63:0];
  _RAND_8 = {2{`RANDOM}};
  regs_8 = _RAND_8[63:0];
  _RAND_9 = {2{`RANDOM}};
  regs_9 = _RAND_9[63:0];
  _RAND_10 = {2{`RANDOM}};
  regs_10 = _RAND_10[63:0];
  _RAND_11 = {2{`RANDOM}};
  regs_11 = _RAND_11[63:0];
  _RAND_12 = {2{`RANDOM}};
  regs_12 = _RAND_12[63:0];
  _RAND_13 = {2{`RANDOM}};
  regs_13 = _RAND_13[63:0];
  _RAND_14 = {2{`RANDOM}};
  regs_14 = _RAND_14[63:0];
  _RAND_15 = {2{`RANDOM}};
  regs_15 = _RAND_15[63:0];
  _RAND_16 = {2{`RANDOM}};
  regs_16 = _RAND_16[63:0];
  _RAND_17 = {2{`RANDOM}};
  regs_17 = _RAND_17[63:0];
  _RAND_18 = {2{`RANDOM}};
  regs_18 = _RAND_18[63:0];
  _RAND_19 = {2{`RANDOM}};
  regs_19 = _RAND_19[63:0];
  _RAND_20 = {2{`RANDOM}};
  regs_20 = _RAND_20[63:0];
  _RAND_21 = {2{`RANDOM}};
  regs_21 = _RAND_21[63:0];
  _RAND_22 = {2{`RANDOM}};
  regs_22 = _RAND_22[63:0];
  _RAND_23 = {2{`RANDOM}};
  regs_23 = _RAND_23[63:0];
  _RAND_24 = {2{`RANDOM}};
  regs_24 = _RAND_24[63:0];
  _RAND_25 = {2{`RANDOM}};
  regs_25 = _RAND_25[63:0];
  _RAND_26 = {2{`RANDOM}};
  regs_26 = _RAND_26[63:0];
  _RAND_27 = {2{`RANDOM}};
  regs_27 = _RAND_27[63:0];
  _RAND_28 = {2{`RANDOM}};
  regs_28 = _RAND_28[63:0];
  _RAND_29 = {2{`RANDOM}};
  regs_29 = _RAND_29[63:0];
  _RAND_30 = {2{`RANDOM}};
  regs_30 = _RAND_30[63:0];
  _RAND_31 = {2{`RANDOM}};
  regs_31 = _RAND_31[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210232_WBU(
  input  [2:0]  io_func_type,
  input  [63:0] io_alu_out,
  input  [63:0] io_lsu_out,
  input  [63:0] io_csr_out,
  input  [63:0] io_jmp_out,
  output [63:0] io_rf_wdata
);
  wire [63:0] _io_rf_wdata_T_1 = 3'h1 == io_func_type ? io_alu_out : 64'h0; // @[Mux.scala 80:57]
  wire [63:0] _io_rf_wdata_T_3 = 3'h2 == io_func_type ? io_lsu_out : _io_rf_wdata_T_1; // @[Mux.scala 80:57]
  wire [63:0] _io_rf_wdata_T_5 = 3'h3 == io_func_type ? io_csr_out : _io_rf_wdata_T_3; // @[Mux.scala 80:57]
  assign io_rf_wdata = 3'h4 == io_func_type ? io_jmp_out : _io_rf_wdata_T_5; // @[Mux.scala 80:57]
endmodule
module ysyx_210232_PipelineReg(
  input         clock,
  input         reset,
  input  [31:0] io_in_pc,
  input  [31:0] io_in_inst,
  input         io_in_valid,
  input         io_in_prejump,
  output [31:0] io_out_pc,
  output [31:0] io_out_inst,
  output        io_out_valid,
  output        io_out_prejump,
  input         io_flush,
  input         io_stall
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] reg_pc; // @[Pipline.scala 73:16]
  reg [31:0] reg_inst; // @[Pipline.scala 73:16]
  reg  reg_valid; // @[Pipline.scala 73:16]
  reg  reg_prejump; // @[Pipline.scala 73:16]
  assign io_out_pc = reg_pc; // @[Pipline.scala 83:10]
  assign io_out_inst = reg_inst; // @[Pipline.scala 83:10]
  assign io_out_valid = reg_valid; // @[Pipline.scala 83:10]
  assign io_out_prejump = reg_prejump; // @[Pipline.scala 83:10]
  always @(posedge clock) begin
    if (reset) begin // @[Pipline.scala 75:26]
      reg_pc <= 32'h0; // @[Pipline.scala 21:13]
    end else if (io_flush) begin // @[Pipline.scala 77:23]
      reg_pc <= 32'h0; // @[Pipline.scala 21:13]
    end else if (~io_stall) begin // @[Pipline.scala 79:26]
      reg_pc <= io_in_pc; // @[Pipline.scala 80:9]
    end
    if (reset) begin // @[Pipline.scala 75:26]
      reg_inst <= 32'h0; // @[Pipline.scala 22:13]
    end else if (io_flush) begin // @[Pipline.scala 77:23]
      reg_inst <= 32'h0; // @[Pipline.scala 22:13]
    end else if (~io_stall) begin // @[Pipline.scala 79:26]
      reg_inst <= io_in_inst; // @[Pipline.scala 80:9]
    end
    if (reset) begin // @[Pipline.scala 75:26]
      reg_valid <= 1'h0; // @[Pipline.scala 23:13]
    end else if (io_flush) begin // @[Pipline.scala 77:23]
      reg_valid <= 1'h0; // @[Pipline.scala 23:13]
    end else if (~io_stall) begin // @[Pipline.scala 79:26]
      reg_valid <= io_in_valid; // @[Pipline.scala 80:9]
    end
    if (reset) begin // @[Pipline.scala 75:26]
      reg_prejump <= 1'h0; // @[Pipline.scala 24:13]
    end else if (io_flush) begin // @[Pipline.scala 77:23]
      reg_prejump <= 1'h0; // @[Pipline.scala 24:13]
    end else if (~io_stall) begin // @[Pipline.scala 79:26]
      reg_prejump <= io_in_prejump; // @[Pipline.scala 80:9]
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
  reg_pc = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  reg_inst = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  reg_valid = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  reg_prejump = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210232_PipelineReg_1(
  input         clock,
  input         reset,
  input         io_in_issue_valid,
  input         io_in_issue_prejump,
  input  [31:0] io_in_issue_pc,
  input  [31:0] io_in_issue_inst,
  input  [2:0]  io_in_issue_func_type,
  input  [3:0]  io_in_issue_func_mode,
  input  [4:0]  io_in_issue_rf_raddr1,
  input  [4:0]  io_in_issue_rf_raddr2,
  input  [1:0]  io_in_issue_opsrc1,
  input  [1:0]  io_in_issue_opsrc2,
  input  [63:0] io_in_issue_imm,
  input         io_in_issue_rv64w,
  input         io_in_issue_rf_wen,
  input  [4:0]  io_in_issue_rf_waddr,
  output        io_out_issue_valid,
  output        io_out_issue_prejump,
  output [31:0] io_out_issue_pc,
  output [31:0] io_out_issue_inst,
  output [2:0]  io_out_issue_func_type,
  output [3:0]  io_out_issue_func_mode,
  output [4:0]  io_out_issue_rf_raddr1,
  output [4:0]  io_out_issue_rf_raddr2,
  output [1:0]  io_out_issue_opsrc1,
  output [1:0]  io_out_issue_opsrc2,
  output [63:0] io_out_issue_imm,
  output        io_out_issue_rv64w,
  output        io_out_issue_rf_wen,
  output [4:0]  io_out_issue_rf_waddr,
  input         io_flush,
  input         io_stall
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
  reg [63:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
`endif // RANDOMIZE_REG_INIT
  reg  reg_issue_valid; // @[Pipline.scala 73:16]
  reg  reg_issue_prejump; // @[Pipline.scala 73:16]
  reg [31:0] reg_issue_pc; // @[Pipline.scala 73:16]
  reg [31:0] reg_issue_inst; // @[Pipline.scala 73:16]
  reg [2:0] reg_issue_func_type; // @[Pipline.scala 73:16]
  reg [3:0] reg_issue_func_mode; // @[Pipline.scala 73:16]
  reg [4:0] reg_issue_rf_raddr1; // @[Pipline.scala 73:16]
  reg [4:0] reg_issue_rf_raddr2; // @[Pipline.scala 73:16]
  reg [1:0] reg_issue_opsrc1; // @[Pipline.scala 73:16]
  reg [1:0] reg_issue_opsrc2; // @[Pipline.scala 73:16]
  reg [63:0] reg_issue_imm; // @[Pipline.scala 73:16]
  reg  reg_issue_rv64w; // @[Pipline.scala 73:16]
  reg  reg_issue_rf_wen; // @[Pipline.scala 73:16]
  reg [4:0] reg_issue_rf_waddr; // @[Pipline.scala 73:16]
  assign io_out_issue_valid = reg_issue_valid; // @[Pipline.scala 83:10]
  assign io_out_issue_prejump = reg_issue_prejump; // @[Pipline.scala 83:10]
  assign io_out_issue_pc = reg_issue_pc; // @[Pipline.scala 83:10]
  assign io_out_issue_inst = reg_issue_inst; // @[Pipline.scala 83:10]
  assign io_out_issue_func_type = reg_issue_func_type; // @[Pipline.scala 83:10]
  assign io_out_issue_func_mode = reg_issue_func_mode; // @[Pipline.scala 83:10]
  assign io_out_issue_rf_raddr1 = reg_issue_rf_raddr1; // @[Pipline.scala 83:10]
  assign io_out_issue_rf_raddr2 = reg_issue_rf_raddr2; // @[Pipline.scala 83:10]
  assign io_out_issue_opsrc1 = reg_issue_opsrc1; // @[Pipline.scala 83:10]
  assign io_out_issue_opsrc2 = reg_issue_opsrc2; // @[Pipline.scala 83:10]
  assign io_out_issue_imm = reg_issue_imm; // @[Pipline.scala 83:10]
  assign io_out_issue_rv64w = reg_issue_rv64w; // @[Pipline.scala 83:10]
  assign io_out_issue_rf_wen = reg_issue_rf_wen; // @[Pipline.scala 83:10]
  assign io_out_issue_rf_waddr = reg_issue_rf_waddr; // @[Pipline.scala 83:10]
  always @(posedge clock) begin
    if (reset) begin // @[Pipline.scala 75:26]
      reg_issue_valid <= 1'h0; // @[ALLIOs.scala 28:19]
    end else if (io_flush) begin // @[Pipline.scala 77:23]
      reg_issue_valid <= 1'h0; // @[ALLIOs.scala 28:19]
    end else if (~io_stall) begin // @[Pipline.scala 79:26]
      reg_issue_valid <= io_in_issue_valid; // @[Pipline.scala 80:9]
    end
    if (reset) begin // @[Pipline.scala 75:26]
      reg_issue_prejump <= 1'h0; // @[ALLIOs.scala 39:19]
    end else if (io_flush) begin // @[Pipline.scala 77:23]
      reg_issue_prejump <= 1'h0; // @[ALLIOs.scala 39:19]
    end else if (~io_stall) begin // @[Pipline.scala 79:26]
      reg_issue_prejump <= io_in_issue_prejump; // @[Pipline.scala 80:9]
    end
    if (reset) begin // @[Pipline.scala 75:26]
      reg_issue_pc <= 32'h0; // @[ALLIOs.scala 29:19]
    end else if (io_flush) begin // @[Pipline.scala 77:23]
      reg_issue_pc <= 32'h0; // @[ALLIOs.scala 29:19]
    end else if (~io_stall) begin // @[Pipline.scala 79:26]
      reg_issue_pc <= io_in_issue_pc; // @[Pipline.scala 80:9]
    end
    if (reset) begin // @[Pipline.scala 75:26]
      reg_issue_inst <= 32'h0; // @[ALLIOs.scala 30:19]
    end else if (io_flush) begin // @[Pipline.scala 77:23]
      reg_issue_inst <= 32'h0; // @[ALLIOs.scala 30:19]
    end else if (~io_stall) begin // @[Pipline.scala 79:26]
      reg_issue_inst <= io_in_issue_inst; // @[Pipline.scala 80:9]
    end
    if (reset) begin // @[Pipline.scala 75:26]
      reg_issue_func_type <= 3'h0; // @[ALLIOs.scala 31:19]
    end else if (io_flush) begin // @[Pipline.scala 77:23]
      reg_issue_func_type <= 3'h0; // @[ALLIOs.scala 31:19]
    end else if (~io_stall) begin // @[Pipline.scala 79:26]
      reg_issue_func_type <= io_in_issue_func_type; // @[Pipline.scala 80:9]
    end
    if (reset) begin // @[Pipline.scala 75:26]
      reg_issue_func_mode <= 4'h0; // @[ALLIOs.scala 32:19]
    end else if (io_flush) begin // @[Pipline.scala 77:23]
      reg_issue_func_mode <= 4'h0; // @[ALLIOs.scala 32:19]
    end else if (~io_stall) begin // @[Pipline.scala 79:26]
      reg_issue_func_mode <= io_in_issue_func_mode; // @[Pipline.scala 80:9]
    end
    if (reset) begin // @[Pipline.scala 75:26]
      reg_issue_rf_raddr1 <= 5'h0; // @[ALLIOs.scala 33:19]
    end else if (io_flush) begin // @[Pipline.scala 77:23]
      reg_issue_rf_raddr1 <= 5'h0; // @[ALLIOs.scala 33:19]
    end else if (~io_stall) begin // @[Pipline.scala 79:26]
      reg_issue_rf_raddr1 <= io_in_issue_rf_raddr1; // @[Pipline.scala 80:9]
    end
    if (reset) begin // @[Pipline.scala 75:26]
      reg_issue_rf_raddr2 <= 5'h0; // @[ALLIOs.scala 34:19]
    end else if (io_flush) begin // @[Pipline.scala 77:23]
      reg_issue_rf_raddr2 <= 5'h0; // @[ALLIOs.scala 34:19]
    end else if (~io_stall) begin // @[Pipline.scala 79:26]
      reg_issue_rf_raddr2 <= io_in_issue_rf_raddr2; // @[Pipline.scala 80:9]
    end
    if (reset) begin // @[Pipline.scala 75:26]
      reg_issue_opsrc1 <= 2'h0; // @[ALLIOs.scala 35:19]
    end else if (io_flush) begin // @[Pipline.scala 77:23]
      reg_issue_opsrc1 <= 2'h0; // @[ALLIOs.scala 35:19]
    end else if (~io_stall) begin // @[Pipline.scala 79:26]
      reg_issue_opsrc1 <= io_in_issue_opsrc1; // @[Pipline.scala 80:9]
    end
    if (reset) begin // @[Pipline.scala 75:26]
      reg_issue_opsrc2 <= 2'h0; // @[ALLIOs.scala 36:19]
    end else if (io_flush) begin // @[Pipline.scala 77:23]
      reg_issue_opsrc2 <= 2'h0; // @[ALLIOs.scala 36:19]
    end else if (~io_stall) begin // @[Pipline.scala 79:26]
      reg_issue_opsrc2 <= io_in_issue_opsrc2; // @[Pipline.scala 80:9]
    end
    if (reset) begin // @[Pipline.scala 75:26]
      reg_issue_imm <= 64'h0; // @[ALLIOs.scala 37:19]
    end else if (io_flush) begin // @[Pipline.scala 77:23]
      reg_issue_imm <= 64'h0; // @[ALLIOs.scala 37:19]
    end else if (~io_stall) begin // @[Pipline.scala 79:26]
      reg_issue_imm <= io_in_issue_imm; // @[Pipline.scala 80:9]
    end
    if (reset) begin // @[Pipline.scala 75:26]
      reg_issue_rv64w <= 1'h0; // @[ALLIOs.scala 38:19]
    end else if (io_flush) begin // @[Pipline.scala 77:23]
      reg_issue_rv64w <= 1'h0; // @[ALLIOs.scala 38:19]
    end else if (~io_stall) begin // @[Pipline.scala 79:26]
      reg_issue_rv64w <= io_in_issue_rv64w; // @[Pipline.scala 80:9]
    end
    if (reset) begin // @[Pipline.scala 75:26]
      reg_issue_rf_wen <= 1'h0; // @[ALLIOs.scala 40:19]
    end else if (io_flush) begin // @[Pipline.scala 77:23]
      reg_issue_rf_wen <= 1'h0; // @[ALLIOs.scala 40:19]
    end else if (~io_stall) begin // @[Pipline.scala 79:26]
      reg_issue_rf_wen <= io_in_issue_rf_wen; // @[Pipline.scala 80:9]
    end
    if (reset) begin // @[Pipline.scala 75:26]
      reg_issue_rf_waddr <= 5'h0; // @[ALLIOs.scala 41:19]
    end else if (io_flush) begin // @[Pipline.scala 77:23]
      reg_issue_rf_waddr <= 5'h0; // @[ALLIOs.scala 41:19]
    end else if (~io_stall) begin // @[Pipline.scala 79:26]
      reg_issue_rf_waddr <= io_in_issue_rf_waddr; // @[Pipline.scala 80:9]
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
  reg_issue_valid = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  reg_issue_prejump = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  reg_issue_pc = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  reg_issue_inst = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  reg_issue_func_type = _RAND_4[2:0];
  _RAND_5 = {1{`RANDOM}};
  reg_issue_func_mode = _RAND_5[3:0];
  _RAND_6 = {1{`RANDOM}};
  reg_issue_rf_raddr1 = _RAND_6[4:0];
  _RAND_7 = {1{`RANDOM}};
  reg_issue_rf_raddr2 = _RAND_7[4:0];
  _RAND_8 = {1{`RANDOM}};
  reg_issue_opsrc1 = _RAND_8[1:0];
  _RAND_9 = {1{`RANDOM}};
  reg_issue_opsrc2 = _RAND_9[1:0];
  _RAND_10 = {2{`RANDOM}};
  reg_issue_imm = _RAND_10[63:0];
  _RAND_11 = {1{`RANDOM}};
  reg_issue_rv64w = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  reg_issue_rf_wen = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  reg_issue_rf_waddr = _RAND_13[4:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210232_PipelineReg_2(
  input         clock,
  input         reset,
  input         io_in_valid,
  input  [2:0]  io_in_func_type,
  input  [63:0] io_in_alu_out,
  input  [63:0] io_in_lsu_out,
  input  [63:0] io_in_csr_out,
  input  [63:0] io_in_jmp_out,
  input         io_in_rf_wen,
  input  [4:0]  io_in_rf_waddr,
  output        io_out_valid,
  output [2:0]  io_out_func_type,
  output [63:0] io_out_alu_out,
  output [63:0] io_out_lsu_out,
  output [63:0] io_out_csr_out,
  output [63:0] io_out_jmp_out,
  output        io_out_rf_wen,
  output [4:0]  io_out_rf_waddr,
  input         io_flush,
  input         io_stall
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [63:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
`endif // RANDOMIZE_REG_INIT
  reg  reg_valid; // @[Pipline.scala 73:16]
  reg [2:0] reg_func_type; // @[Pipline.scala 73:16]
  reg [63:0] reg_alu_out; // @[Pipline.scala 73:16]
  reg [63:0] reg_lsu_out; // @[Pipline.scala 73:16]
  reg [63:0] reg_csr_out; // @[Pipline.scala 73:16]
  reg [63:0] reg_jmp_out; // @[Pipline.scala 73:16]
  reg  reg_rf_wen; // @[Pipline.scala 73:16]
  reg [4:0] reg_rf_waddr; // @[Pipline.scala 73:16]
  assign io_out_valid = reg_valid; // @[Pipline.scala 83:10]
  assign io_out_func_type = reg_func_type; // @[Pipline.scala 83:10]
  assign io_out_alu_out = reg_alu_out; // @[Pipline.scala 83:10]
  assign io_out_lsu_out = reg_lsu_out; // @[Pipline.scala 83:10]
  assign io_out_csr_out = reg_csr_out; // @[Pipline.scala 83:10]
  assign io_out_jmp_out = reg_jmp_out; // @[Pipline.scala 83:10]
  assign io_out_rf_wen = reg_rf_wen; // @[Pipline.scala 83:10]
  assign io_out_rf_waddr = reg_rf_waddr; // @[Pipline.scala 83:10]
  always @(posedge clock) begin
    if (reset) begin // @[Pipline.scala 75:26]
      reg_valid <= 1'h0; // @[Pipline.scala 52:15]
    end else if (io_flush) begin // @[Pipline.scala 77:23]
      reg_valid <= 1'h0; // @[Pipline.scala 52:15]
    end else if (~io_stall) begin // @[Pipline.scala 79:26]
      reg_valid <= io_in_valid; // @[Pipline.scala 80:9]
    end
    if (reset) begin // @[Pipline.scala 75:26]
      reg_func_type <= 3'h0; // @[Pipline.scala 53:15]
    end else if (io_flush) begin // @[Pipline.scala 77:23]
      reg_func_type <= 3'h0; // @[Pipline.scala 53:15]
    end else if (~io_stall) begin // @[Pipline.scala 79:26]
      reg_func_type <= io_in_func_type; // @[Pipline.scala 80:9]
    end
    if (reset) begin // @[Pipline.scala 75:26]
      reg_alu_out <= 64'h0; // @[Pipline.scala 54:15]
    end else if (io_flush) begin // @[Pipline.scala 77:23]
      reg_alu_out <= 64'h0; // @[Pipline.scala 54:15]
    end else if (~io_stall) begin // @[Pipline.scala 79:26]
      reg_alu_out <= io_in_alu_out; // @[Pipline.scala 80:9]
    end
    if (reset) begin // @[Pipline.scala 75:26]
      reg_lsu_out <= 64'h0; // @[Pipline.scala 55:15]
    end else if (io_flush) begin // @[Pipline.scala 77:23]
      reg_lsu_out <= 64'h0; // @[Pipline.scala 55:15]
    end else if (~io_stall) begin // @[Pipline.scala 79:26]
      reg_lsu_out <= io_in_lsu_out; // @[Pipline.scala 80:9]
    end
    if (reset) begin // @[Pipline.scala 75:26]
      reg_csr_out <= 64'h0; // @[Pipline.scala 56:15]
    end else if (io_flush) begin // @[Pipline.scala 77:23]
      reg_csr_out <= 64'h0; // @[Pipline.scala 56:15]
    end else if (~io_stall) begin // @[Pipline.scala 79:26]
      reg_csr_out <= io_in_csr_out; // @[Pipline.scala 80:9]
    end
    if (reset) begin // @[Pipline.scala 75:26]
      reg_jmp_out <= 64'h0; // @[Pipline.scala 57:15]
    end else if (io_flush) begin // @[Pipline.scala 77:23]
      reg_jmp_out <= 64'h0; // @[Pipline.scala 57:15]
    end else if (~io_stall) begin // @[Pipline.scala 79:26]
      reg_jmp_out <= io_in_jmp_out; // @[Pipline.scala 80:9]
    end
    if (reset) begin // @[Pipline.scala 75:26]
      reg_rf_wen <= 1'h0; // @[Pipline.scala 59:15]
    end else if (io_flush) begin // @[Pipline.scala 77:23]
      reg_rf_wen <= 1'h0; // @[Pipline.scala 59:15]
    end else if (~io_stall) begin // @[Pipline.scala 79:26]
      reg_rf_wen <= io_in_rf_wen; // @[Pipline.scala 80:9]
    end
    if (reset) begin // @[Pipline.scala 75:26]
      reg_rf_waddr <= 5'h0; // @[Pipline.scala 60:15]
    end else if (io_flush) begin // @[Pipline.scala 77:23]
      reg_rf_waddr <= 5'h0; // @[Pipline.scala 60:15]
    end else if (~io_stall) begin // @[Pipline.scala 79:26]
      reg_rf_waddr <= io_in_rf_waddr; // @[Pipline.scala 80:9]
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
  reg_func_type = _RAND_1[2:0];
  _RAND_2 = {2{`RANDOM}};
  reg_alu_out = _RAND_2[63:0];
  _RAND_3 = {2{`RANDOM}};
  reg_lsu_out = _RAND_3[63:0];
  _RAND_4 = {2{`RANDOM}};
  reg_csr_out = _RAND_4[63:0];
  _RAND_5 = {2{`RANDOM}};
  reg_jmp_out = _RAND_5[63:0];
  _RAND_6 = {1{`RANDOM}};
  reg_rf_wen = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  reg_rf_waddr = _RAND_7[4:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210232_Core(
  input         clock,
  input         reset,
  input         io_axi_aw_ready,
  output        io_axi_aw_valid,
  output [31:0] io_axi_aw_bits_addr,
  output [2:0]  io_axi_aw_bits_size,
  input         io_axi_w_ready,
  output        io_axi_w_valid,
  output [63:0] io_axi_w_bits_data,
  output [7:0]  io_axi_w_bits_strb,
  output        io_axi_b_ready,
  input         io_axi_b_valid,
  input  [3:0]  io_axi_b_bits_id,
  input  [1:0]  io_axi_b_bits_resp,
  input         io_axi_ar_ready,
  output        io_axi_ar_valid,
  output [3:0]  io_axi_ar_bits_id,
  output [31:0] io_axi_ar_bits_addr,
  output [2:0]  io_axi_ar_bits_size,
  output        io_axi_r_ready,
  input         io_axi_r_valid,
  input  [3:0]  io_axi_r_bits_id,
  input  [63:0] io_axi_r_bits_data,
  input  [1:0]  io_axi_r_bits_resp,
  input         io_axi_r_bits_last
);
  wire  If_clock; // @[Core.scala 17:22]
  wire  If_reset; // @[Core.scala 17:22]
  wire  If_io_jump; // @[Core.scala 17:22]
  wire [31:0] If_io_jumpPC; // @[Core.scala 17:22]
  wire  If_io_intr; // @[Core.scala 17:22]
  wire  If_io_prejump; // @[Core.scala 17:22]
  wire [31:0] If_io_pc; // @[Core.scala 17:22]
  wire  If_io_fetched; // @[Core.scala 17:22]
  wire  If_io_stall; // @[Core.scala 17:22]
  wire [31:0] If_io_inst; // @[Core.scala 17:22]
  wire  If_io_imem_req_ready; // @[Core.scala 17:22]
  wire  If_io_imem_req_valid; // @[Core.scala 17:22]
  wire [31:0] If_io_imem_req_bits_addr; // @[Core.scala 17:22]
  wire  If_io_imem_resp_ready; // @[Core.scala 17:22]
  wire  If_io_imem_resp_valid; // @[Core.scala 17:22]
  wire [31:0] If_io_imem_resp_bits_rdata; // @[Core.scala 17:22]
  wire  If_io_imem_resp_bits_resp; // @[Core.scala 17:22]
  wire [3:0] If_io_imem_resp_bits_id; // @[Core.scala 17:22]
  wire  If_LDDone; // @[Core.scala 17:22]
  wire  If_If_Ld_fail_0; // @[Core.scala 17:22]
  wire  crb_clock; // @[Core.scala 18:22]
  wire  crb_io_in_0_req_ready; // @[Core.scala 18:22]
  wire  crb_io_in_0_req_valid; // @[Core.scala 18:22]
  wire [31:0] crb_io_in_0_req_bits_addr; // @[Core.scala 18:22]
  wire  crb_io_in_0_resp_ready; // @[Core.scala 18:22]
  wire  crb_io_in_0_resp_valid; // @[Core.scala 18:22]
  wire [31:0] crb_io_in_0_resp_bits_rdata; // @[Core.scala 18:22]
  wire  crb_io_in_0_resp_bits_resp; // @[Core.scala 18:22]
  wire [3:0] crb_io_in_0_resp_bits_id; // @[Core.scala 18:22]
  wire  crb_io_in_1_req_ready; // @[Core.scala 18:22]
  wire  crb_io_in_1_req_valid; // @[Core.scala 18:22]
  wire [31:0] crb_io_in_1_req_bits_addr; // @[Core.scala 18:22]
  wire  crb_io_in_1_req_bits_ren; // @[Core.scala 18:22]
  wire [2:0] crb_io_in_1_req_bits_size; // @[Core.scala 18:22]
  wire  crb_io_in_1_req_bits_wen; // @[Core.scala 18:22]
  wire [7:0] crb_io_in_1_req_bits_wmask; // @[Core.scala 18:22]
  wire [63:0] crb_io_in_1_req_bits_wdata; // @[Core.scala 18:22]
  wire  crb_io_in_1_resp_ready; // @[Core.scala 18:22]
  wire  crb_io_in_1_resp_valid; // @[Core.scala 18:22]
  wire [63:0] crb_io_in_1_resp_bits_rdata; // @[Core.scala 18:22]
  wire  crb_io_in_1_resp_bits_resp; // @[Core.scala 18:22]
  wire [3:0] crb_io_in_1_resp_bits_id; // @[Core.scala 18:22]
  wire  crb_io_out_req_ready; // @[Core.scala 18:22]
  wire  crb_io_out_req_valid; // @[Core.scala 18:22]
  wire [31:0] crb_io_out_req_bits_addr; // @[Core.scala 18:22]
  wire [2:0] crb_io_out_req_bits_size; // @[Core.scala 18:22]
  wire [3:0] crb_io_out_req_bits_id; // @[Core.scala 18:22]
  wire  crb_io_out_resp_ready; // @[Core.scala 18:22]
  wire  crb_io_out_resp_valid; // @[Core.scala 18:22]
  wire [63:0] crb_io_out_resp_bits_rdata; // @[Core.scala 18:22]
  wire  crb_io_out_resp_bits_resp; // @[Core.scala 18:22]
  wire [3:0] crb_io_out_resp_bits_id; // @[Core.scala 18:22]
  wire  crb_io_outw_req_ready; // @[Core.scala 18:22]
  wire  crb_io_outw_req_valid; // @[Core.scala 18:22]
  wire [31:0] crb_io_outw_req_bits_addr; // @[Core.scala 18:22]
  wire [2:0] crb_io_outw_req_bits_size; // @[Core.scala 18:22]
  wire  crb_io_outw_req_bits_wen; // @[Core.scala 18:22]
  wire [7:0] crb_io_outw_req_bits_wmask; // @[Core.scala 18:22]
  wire [63:0] crb_io_outw_req_bits_wdata; // @[Core.scala 18:22]
  wire  crb_io_outw_resp_ready; // @[Core.scala 18:22]
  wire  crb_io_outw_resp_valid; // @[Core.scala 18:22]
  wire  crb_io_outw_resp_bits_resp; // @[Core.scala 18:22]
  wire [3:0] crb_io_outw_resp_bits_id; // @[Core.scala 18:22]
  wire  u2i_clock; // @[Core.scala 19:22]
  wire  u2i_reset; // @[Core.scala 19:22]
  wire  u2i_io_wruser_req_ready; // @[Core.scala 19:22]
  wire  u2i_io_wruser_req_valid; // @[Core.scala 19:22]
  wire [31:0] u2i_io_wruser_req_bits_addr; // @[Core.scala 19:22]
  wire [2:0] u2i_io_wruser_req_bits_size; // @[Core.scala 19:22]
  wire  u2i_io_wruser_req_bits_wen; // @[Core.scala 19:22]
  wire [7:0] u2i_io_wruser_req_bits_wmask; // @[Core.scala 19:22]
  wire [63:0] u2i_io_wruser_req_bits_wdata; // @[Core.scala 19:22]
  wire  u2i_io_wruser_resp_ready; // @[Core.scala 19:22]
  wire  u2i_io_wruser_resp_valid; // @[Core.scala 19:22]
  wire  u2i_io_wruser_resp_bits_resp; // @[Core.scala 19:22]
  wire [3:0] u2i_io_wruser_resp_bits_id; // @[Core.scala 19:22]
  wire  u2i_io_rduser_req_ready; // @[Core.scala 19:22]
  wire  u2i_io_rduser_req_valid; // @[Core.scala 19:22]
  wire [31:0] u2i_io_rduser_req_bits_addr; // @[Core.scala 19:22]
  wire [2:0] u2i_io_rduser_req_bits_size; // @[Core.scala 19:22]
  wire [3:0] u2i_io_rduser_req_bits_id; // @[Core.scala 19:22]
  wire  u2i_io_rduser_resp_ready; // @[Core.scala 19:22]
  wire  u2i_io_rduser_resp_valid; // @[Core.scala 19:22]
  wire [63:0] u2i_io_rduser_resp_bits_rdata; // @[Core.scala 19:22]
  wire  u2i_io_rduser_resp_bits_resp; // @[Core.scala 19:22]
  wire [3:0] u2i_io_rduser_resp_bits_id; // @[Core.scala 19:22]
  wire  u2i_io_axi_aw_ready; // @[Core.scala 19:22]
  wire  u2i_io_axi_aw_valid; // @[Core.scala 19:22]
  wire [31:0] u2i_io_axi_aw_bits_addr; // @[Core.scala 19:22]
  wire [2:0] u2i_io_axi_aw_bits_size; // @[Core.scala 19:22]
  wire  u2i_io_axi_w_ready; // @[Core.scala 19:22]
  wire  u2i_io_axi_w_valid; // @[Core.scala 19:22]
  wire [63:0] u2i_io_axi_w_bits_data; // @[Core.scala 19:22]
  wire [7:0] u2i_io_axi_w_bits_strb; // @[Core.scala 19:22]
  wire  u2i_io_axi_b_ready; // @[Core.scala 19:22]
  wire  u2i_io_axi_b_valid; // @[Core.scala 19:22]
  wire [3:0] u2i_io_axi_b_bits_id; // @[Core.scala 19:22]
  wire [1:0] u2i_io_axi_b_bits_resp; // @[Core.scala 19:22]
  wire  u2i_io_axi_ar_ready; // @[Core.scala 19:22]
  wire  u2i_io_axi_ar_valid; // @[Core.scala 19:22]
  wire [3:0] u2i_io_axi_ar_bits_id; // @[Core.scala 19:22]
  wire [31:0] u2i_io_axi_ar_bits_addr; // @[Core.scala 19:22]
  wire [2:0] u2i_io_axi_ar_bits_size; // @[Core.scala 19:22]
  wire  u2i_io_axi_r_ready; // @[Core.scala 19:22]
  wire  u2i_io_axi_r_valid; // @[Core.scala 19:22]
  wire [3:0] u2i_io_axi_r_bits_id; // @[Core.scala 19:22]
  wire [63:0] u2i_io_axi_r_bits_data; // @[Core.scala 19:22]
  wire [1:0] u2i_io_axi_r_bits_resp; // @[Core.scala 19:22]
  wire  u2i_io_axi_r_bits_last; // @[Core.scala 19:22]
  wire [31:0] Id_io_pc; // @[Core.scala 20:22]
  wire [31:0] Id_io_inst; // @[Core.scala 20:22]
  wire  Id_io_prejump; // @[Core.scala 20:22]
  wire  Id_io_valid; // @[Core.scala 20:22]
  wire  Id_io_issue_valid; // @[Core.scala 20:22]
  wire  Id_io_issue_prejump; // @[Core.scala 20:22]
  wire [31:0] Id_io_issue_pc; // @[Core.scala 20:22]
  wire [31:0] Id_io_issue_inst; // @[Core.scala 20:22]
  wire [2:0] Id_io_issue_func_type; // @[Core.scala 20:22]
  wire [3:0] Id_io_issue_func_mode; // @[Core.scala 20:22]
  wire [4:0] Id_io_issue_rf_raddr1; // @[Core.scala 20:22]
  wire [4:0] Id_io_issue_rf_raddr2; // @[Core.scala 20:22]
  wire [1:0] Id_io_issue_opsrc1; // @[Core.scala 20:22]
  wire [1:0] Id_io_issue_opsrc2; // @[Core.scala 20:22]
  wire [63:0] Id_io_issue_imm; // @[Core.scala 20:22]
  wire  Id_io_issue_rv64w; // @[Core.scala 20:22]
  wire  Id_io_issue_rf_wen; // @[Core.scala 20:22]
  wire [4:0] Id_io_issue_rf_waddr; // @[Core.scala 20:22]
  wire  Id__T_1_0; // @[Core.scala 20:22]
  wire  Ex_clock; // @[Core.scala 21:22]
  wire  Ex_reset; // @[Core.scala 21:22]
  wire  Ex_io_issue_valid; // @[Core.scala 21:22]
  wire  Ex_io_issue_prejump; // @[Core.scala 21:22]
  wire [31:0] Ex_io_issue_pc; // @[Core.scala 21:22]
  wire [31:0] Ex_io_issue_inst; // @[Core.scala 21:22]
  wire [2:0] Ex_io_issue_func_type; // @[Core.scala 21:22]
  wire [3:0] Ex_io_issue_func_mode; // @[Core.scala 21:22]
  wire [4:0] Ex_io_issue_rf_raddr1; // @[Core.scala 21:22]
  wire [4:0] Ex_io_issue_rf_raddr2; // @[Core.scala 21:22]
  wire [1:0] Ex_io_issue_opsrc1; // @[Core.scala 21:22]
  wire [1:0] Ex_io_issue_opsrc2; // @[Core.scala 21:22]
  wire [63:0] Ex_io_issue_imm; // @[Core.scala 21:22]
  wire  Ex_io_issue_rv64w; // @[Core.scala 21:22]
  wire  Ex_io_issue_rf_wen; // @[Core.scala 21:22]
  wire [4:0] Ex_io_issue_rf_waddr; // @[Core.scala 21:22]
  wire  Ex_io_rf_ren1; // @[Core.scala 21:22]
  wire  Ex_io_rf_ren2; // @[Core.scala 21:22]
  wire [4:0] Ex_io_rf_raddr1; // @[Core.scala 21:22]
  wire [4:0] Ex_io_rf_raddr2; // @[Core.scala 21:22]
  wire [63:0] Ex_io_rf_rdata1; // @[Core.scala 21:22]
  wire [63:0] Ex_io_rf_rdata2; // @[Core.scala 21:22]
  wire  Ex_io_dmem_req_ready; // @[Core.scala 21:22]
  wire  Ex_io_dmem_req_valid; // @[Core.scala 21:22]
  wire [31:0] Ex_io_dmem_req_bits_addr; // @[Core.scala 21:22]
  wire  Ex_io_dmem_req_bits_ren; // @[Core.scala 21:22]
  wire [2:0] Ex_io_dmem_req_bits_size; // @[Core.scala 21:22]
  wire  Ex_io_dmem_req_bits_wen; // @[Core.scala 21:22]
  wire [7:0] Ex_io_dmem_req_bits_wmask; // @[Core.scala 21:22]
  wire [63:0] Ex_io_dmem_req_bits_wdata; // @[Core.scala 21:22]
  wire  Ex_io_dmem_resp_ready; // @[Core.scala 21:22]
  wire  Ex_io_dmem_resp_valid; // @[Core.scala 21:22]
  wire [63:0] Ex_io_dmem_resp_bits_rdata; // @[Core.scala 21:22]
  wire  Ex_io_dmem_resp_bits_resp; // @[Core.scala 21:22]
  wire [3:0] Ex_io_dmem_resp_bits_id; // @[Core.scala 21:22]
  wire  Ex_io_rf_wen; // @[Core.scala 21:22]
  wire [4:0] Ex_io_rf_waddr; // @[Core.scala 21:22]
  wire [2:0] Ex_io_func_type; // @[Core.scala 21:22]
  wire [63:0] Ex_io_alu_out; // @[Core.scala 21:22]
  wire [63:0] Ex_io_lsu_out; // @[Core.scala 21:22]
  wire [63:0] Ex_io_csr_out; // @[Core.scala 21:22]
  wire [63:0] Ex_io_jmp_out; // @[Core.scala 21:22]
  wire  Ex_io_stall; // @[Core.scala 21:22]
  wire  Ex_io_valid; // @[Core.scala 21:22]
  wire  Ex_io_jump; // @[Core.scala 21:22]
  wire  Ex_io_intr; // @[Core.scala 21:22]
  wire [31:0] Ex_io_jumpPC; // @[Core.scala 21:22]
  wire  Ex_LDDone; // @[Core.scala 21:22]
  wire  Ex_commit; // @[Core.scala 21:22]
  wire  Ex__T_1; // @[Core.scala 21:22]
  wire  Ex_If_Ld_fail; // @[Core.scala 21:22]
  wire  Rf_clock; // @[Core.scala 22:22]
  wire  Rf_reset; // @[Core.scala 22:22]
  wire  Rf_io_wen; // @[Core.scala 22:22]
  wire [4:0] Rf_io_waddr; // @[Core.scala 22:22]
  wire  Rf_io_ren1; // @[Core.scala 22:22]
  wire [4:0] Rf_io_raddr1; // @[Core.scala 22:22]
  wire  Rf_io_ren2; // @[Core.scala 22:22]
  wire [4:0] Rf_io_raddr2; // @[Core.scala 22:22]
  wire [63:0] Rf_io_rdata1; // @[Core.scala 22:22]
  wire [63:0] Rf_io_rdata2; // @[Core.scala 22:22]
  wire [63:0] Rf_io_wdata; // @[Core.scala 22:22]
  wire [2:0] Wb_io_func_type; // @[Core.scala 23:22]
  wire [63:0] Wb_io_alu_out; // @[Core.scala 23:22]
  wire [63:0] Wb_io_lsu_out; // @[Core.scala 23:22]
  wire [63:0] Wb_io_csr_out; // @[Core.scala 23:22]
  wire [63:0] Wb_io_jmp_out; // @[Core.scala 23:22]
  wire [63:0] Wb_io_rf_wdata; // @[Core.scala 23:22]
  wire  IdReg_clock; // @[Core.scala 26:24]
  wire  IdReg_reset; // @[Core.scala 26:24]
  wire [31:0] IdReg_io_in_pc; // @[Core.scala 26:24]
  wire [31:0] IdReg_io_in_inst; // @[Core.scala 26:24]
  wire  IdReg_io_in_valid; // @[Core.scala 26:24]
  wire  IdReg_io_in_prejump; // @[Core.scala 26:24]
  wire [31:0] IdReg_io_out_pc; // @[Core.scala 26:24]
  wire [31:0] IdReg_io_out_inst; // @[Core.scala 26:24]
  wire  IdReg_io_out_valid; // @[Core.scala 26:24]
  wire  IdReg_io_out_prejump; // @[Core.scala 26:24]
  wire  IdReg_io_flush; // @[Core.scala 26:24]
  wire  IdReg_io_stall; // @[Core.scala 26:24]
  wire  ExReg_clock; // @[Core.scala 38:23]
  wire  ExReg_reset; // @[Core.scala 38:23]
  wire  ExReg_io_in_issue_valid; // @[Core.scala 38:23]
  wire  ExReg_io_in_issue_prejump; // @[Core.scala 38:23]
  wire [31:0] ExReg_io_in_issue_pc; // @[Core.scala 38:23]
  wire [31:0] ExReg_io_in_issue_inst; // @[Core.scala 38:23]
  wire [2:0] ExReg_io_in_issue_func_type; // @[Core.scala 38:23]
  wire [3:0] ExReg_io_in_issue_func_mode; // @[Core.scala 38:23]
  wire [4:0] ExReg_io_in_issue_rf_raddr1; // @[Core.scala 38:23]
  wire [4:0] ExReg_io_in_issue_rf_raddr2; // @[Core.scala 38:23]
  wire [1:0] ExReg_io_in_issue_opsrc1; // @[Core.scala 38:23]
  wire [1:0] ExReg_io_in_issue_opsrc2; // @[Core.scala 38:23]
  wire [63:0] ExReg_io_in_issue_imm; // @[Core.scala 38:23]
  wire  ExReg_io_in_issue_rv64w; // @[Core.scala 38:23]
  wire  ExReg_io_in_issue_rf_wen; // @[Core.scala 38:23]
  wire [4:0] ExReg_io_in_issue_rf_waddr; // @[Core.scala 38:23]
  wire  ExReg_io_out_issue_valid; // @[Core.scala 38:23]
  wire  ExReg_io_out_issue_prejump; // @[Core.scala 38:23]
  wire [31:0] ExReg_io_out_issue_pc; // @[Core.scala 38:23]
  wire [31:0] ExReg_io_out_issue_inst; // @[Core.scala 38:23]
  wire [2:0] ExReg_io_out_issue_func_type; // @[Core.scala 38:23]
  wire [3:0] ExReg_io_out_issue_func_mode; // @[Core.scala 38:23]
  wire [4:0] ExReg_io_out_issue_rf_raddr1; // @[Core.scala 38:23]
  wire [4:0] ExReg_io_out_issue_rf_raddr2; // @[Core.scala 38:23]
  wire [1:0] ExReg_io_out_issue_opsrc1; // @[Core.scala 38:23]
  wire [1:0] ExReg_io_out_issue_opsrc2; // @[Core.scala 38:23]
  wire [63:0] ExReg_io_out_issue_imm; // @[Core.scala 38:23]
  wire  ExReg_io_out_issue_rv64w; // @[Core.scala 38:23]
  wire  ExReg_io_out_issue_rf_wen; // @[Core.scala 38:23]
  wire [4:0] ExReg_io_out_issue_rf_waddr; // @[Core.scala 38:23]
  wire  ExReg_io_flush; // @[Core.scala 38:23]
  wire  ExReg_io_stall; // @[Core.scala 38:23]
  wire  WbReg_clock; // @[Core.scala 56:23]
  wire  WbReg_reset; // @[Core.scala 56:23]
  wire  WbReg_io_in_valid; // @[Core.scala 56:23]
  wire [2:0] WbReg_io_in_func_type; // @[Core.scala 56:23]
  wire [63:0] WbReg_io_in_alu_out; // @[Core.scala 56:23]
  wire [63:0] WbReg_io_in_lsu_out; // @[Core.scala 56:23]
  wire [63:0] WbReg_io_in_csr_out; // @[Core.scala 56:23]
  wire [63:0] WbReg_io_in_jmp_out; // @[Core.scala 56:23]
  wire  WbReg_io_in_rf_wen; // @[Core.scala 56:23]
  wire [4:0] WbReg_io_in_rf_waddr; // @[Core.scala 56:23]
  wire  WbReg_io_out_valid; // @[Core.scala 56:23]
  wire [2:0] WbReg_io_out_func_type; // @[Core.scala 56:23]
  wire [63:0] WbReg_io_out_alu_out; // @[Core.scala 56:23]
  wire [63:0] WbReg_io_out_lsu_out; // @[Core.scala 56:23]
  wire [63:0] WbReg_io_out_csr_out; // @[Core.scala 56:23]
  wire [63:0] WbReg_io_out_jmp_out; // @[Core.scala 56:23]
  wire  WbReg_io_out_rf_wen; // @[Core.scala 56:23]
  wire [4:0] WbReg_io_out_rf_waddr; // @[Core.scala 56:23]
  wire  WbReg_io_flush; // @[Core.scala 56:23]
  wire  WbReg_io_stall; // @[Core.scala 56:23]
  wire  commit = WbReg_io_out_valid & ~Ex_io_stall; // @[Core.scala 78:37]
  wire  _data1_hzard_T = WbReg_io_out_rf_wen & WbReg_io_out_valid; // @[Core.scala 85:43]
  wire  _data1_hzard_T_1 = _data1_hzard_T & Ex_io_rf_ren1; // @[Core.scala 86:29]
  wire  _data1_hzard_T_2 = Ex_io_rf_raddr1 != 5'h0; // @[Core.scala 88:26]
  wire  _data1_hzard_T_3 = _data1_hzard_T_1 & _data1_hzard_T_2; // @[Core.scala 87:25]
  wire  _data1_hzard_T_4 = WbReg_io_out_rf_waddr == Ex_io_rf_raddr1; // @[Core.scala 89:32]
  wire  data1_hzard = _data1_hzard_T_3 & _data1_hzard_T_4; // @[Core.scala 88:35]
  wire  _data2_hzard_T_1 = _data1_hzard_T & Ex_io_rf_ren2; // @[Core.scala 91:29]
  wire  _data2_hzard_T_2 = Ex_io_rf_raddr2 != 5'h0; // @[Core.scala 93:26]
  wire  _data2_hzard_T_3 = _data2_hzard_T_1 & _data2_hzard_T_2; // @[Core.scala 92:25]
  wire  _data2_hzard_T_4 = WbReg_io_out_rf_waddr == Ex_io_rf_raddr2; // @[Core.scala 94:32]
  wire  data2_hzard = _data2_hzard_T_3 & _data2_hzard_T_4; // @[Core.scala 93:35]
  ysyx_210232_IFU If ( // @[Core.scala 17:22]
    .clock(If_clock),
    .reset(If_reset),
    .io_jump(If_io_jump),
    .io_jumpPC(If_io_jumpPC),
    .io_intr(If_io_intr),
    .io_prejump(If_io_prejump),
    .io_pc(If_io_pc),
    .io_fetched(If_io_fetched),
    .io_stall(If_io_stall),
    .io_inst(If_io_inst),
    .io_imem_req_ready(If_io_imem_req_ready),
    .io_imem_req_valid(If_io_imem_req_valid),
    .io_imem_req_bits_addr(If_io_imem_req_bits_addr),
    .io_imem_resp_ready(If_io_imem_resp_ready),
    .io_imem_resp_valid(If_io_imem_resp_valid),
    .io_imem_resp_bits_rdata(If_io_imem_resp_bits_rdata),
    .io_imem_resp_bits_resp(If_io_imem_resp_bits_resp),
    .io_imem_resp_bits_id(If_io_imem_resp_bits_id),
    .LDDone(If_LDDone),
    .If_Ld_fail_0(If_If_Ld_fail_0)
  );
  ysyx_210232_Crossbar crb ( // @[Core.scala 18:22]
    .clock(crb_clock),
    .reset(reset),
    .io_in_0_req_ready(crb_io_in_0_req_ready),
    .io_in_0_req_valid(crb_io_in_0_req_valid),
    .io_in_0_req_bits_addr(crb_io_in_0_req_bits_addr),
    .io_in_0_resp_ready(crb_io_in_0_resp_ready),
    .io_in_0_resp_valid(crb_io_in_0_resp_valid),
    .io_in_0_resp_bits_rdata(crb_io_in_0_resp_bits_rdata),
    .io_in_0_resp_bits_resp(crb_io_in_0_resp_bits_resp),
    .io_in_0_resp_bits_id(crb_io_in_0_resp_bits_id),
    .io_in_1_req_ready(crb_io_in_1_req_ready),
    .io_in_1_req_valid(crb_io_in_1_req_valid),
    .io_in_1_req_bits_addr(crb_io_in_1_req_bits_addr),
    .io_in_1_req_bits_ren(crb_io_in_1_req_bits_ren),
    .io_in_1_req_bits_size(crb_io_in_1_req_bits_size),
    .io_in_1_req_bits_wen(crb_io_in_1_req_bits_wen),
    .io_in_1_req_bits_wmask(crb_io_in_1_req_bits_wmask),
    .io_in_1_req_bits_wdata(crb_io_in_1_req_bits_wdata),
    .io_in_1_resp_ready(crb_io_in_1_resp_ready),
    .io_in_1_resp_valid(crb_io_in_1_resp_valid),
    .io_in_1_resp_bits_rdata(crb_io_in_1_resp_bits_rdata),
    .io_in_1_resp_bits_resp(crb_io_in_1_resp_bits_resp),
    .io_in_1_resp_bits_id(crb_io_in_1_resp_bits_id),
    .io_out_req_ready(crb_io_out_req_ready),
    .io_out_req_valid(crb_io_out_req_valid),
    .io_out_req_bits_addr(crb_io_out_req_bits_addr),
    .io_out_req_bits_size(crb_io_out_req_bits_size),
    .io_out_req_bits_id(crb_io_out_req_bits_id),
    .io_out_resp_ready(crb_io_out_resp_ready),
    .io_out_resp_valid(crb_io_out_resp_valid),
    .io_out_resp_bits_rdata(crb_io_out_resp_bits_rdata),
    .io_out_resp_bits_resp(crb_io_out_resp_bits_resp),
    .io_out_resp_bits_id(crb_io_out_resp_bits_id),
    .io_outw_req_ready(crb_io_outw_req_ready),
    .io_outw_req_valid(crb_io_outw_req_valid),
    .io_outw_req_bits_addr(crb_io_outw_req_bits_addr),
    .io_outw_req_bits_size(crb_io_outw_req_bits_size),
    .io_outw_req_bits_wen(crb_io_outw_req_bits_wen),
    .io_outw_req_bits_wmask(crb_io_outw_req_bits_wmask),
    .io_outw_req_bits_wdata(crb_io_outw_req_bits_wdata),
    .io_outw_resp_ready(crb_io_outw_resp_ready),
    .io_outw_resp_valid(crb_io_outw_resp_valid),
    .io_outw_resp_bits_resp(crb_io_outw_resp_bits_resp),
    .io_outw_resp_bits_id(crb_io_outw_resp_bits_id)
  );
  ysyx_210232_User2AXI u2i ( // @[Core.scala 19:22]
    .clock(u2i_clock),
    .reset(u2i_reset),
    .io_wruser_req_ready(u2i_io_wruser_req_ready),
    .io_wruser_req_valid(u2i_io_wruser_req_valid),
    .io_wruser_req_bits_addr(u2i_io_wruser_req_bits_addr),
    .io_wruser_req_bits_size(u2i_io_wruser_req_bits_size),
    .io_wruser_req_bits_wen(u2i_io_wruser_req_bits_wen),
    .io_wruser_req_bits_wmask(u2i_io_wruser_req_bits_wmask),
    .io_wruser_req_bits_wdata(u2i_io_wruser_req_bits_wdata),
    .io_wruser_resp_ready(u2i_io_wruser_resp_ready),
    .io_wruser_resp_valid(u2i_io_wruser_resp_valid),
    .io_wruser_resp_bits_resp(u2i_io_wruser_resp_bits_resp),
    .io_wruser_resp_bits_id(u2i_io_wruser_resp_bits_id),
    .io_rduser_req_ready(u2i_io_rduser_req_ready),
    .io_rduser_req_valid(u2i_io_rduser_req_valid),
    .io_rduser_req_bits_addr(u2i_io_rduser_req_bits_addr),
    .io_rduser_req_bits_size(u2i_io_rduser_req_bits_size),
    .io_rduser_req_bits_id(u2i_io_rduser_req_bits_id),
    .io_rduser_resp_ready(u2i_io_rduser_resp_ready),
    .io_rduser_resp_valid(u2i_io_rduser_resp_valid),
    .io_rduser_resp_bits_rdata(u2i_io_rduser_resp_bits_rdata),
    .io_rduser_resp_bits_resp(u2i_io_rduser_resp_bits_resp),
    .io_rduser_resp_bits_id(u2i_io_rduser_resp_bits_id),
    .io_axi_aw_ready(u2i_io_axi_aw_ready),
    .io_axi_aw_valid(u2i_io_axi_aw_valid),
    .io_axi_aw_bits_addr(u2i_io_axi_aw_bits_addr),
    .io_axi_aw_bits_size(u2i_io_axi_aw_bits_size),
    .io_axi_w_ready(u2i_io_axi_w_ready),
    .io_axi_w_valid(u2i_io_axi_w_valid),
    .io_axi_w_bits_data(u2i_io_axi_w_bits_data),
    .io_axi_w_bits_strb(u2i_io_axi_w_bits_strb),
    .io_axi_b_ready(u2i_io_axi_b_ready),
    .io_axi_b_valid(u2i_io_axi_b_valid),
    .io_axi_b_bits_id(u2i_io_axi_b_bits_id),
    .io_axi_b_bits_resp(u2i_io_axi_b_bits_resp),
    .io_axi_ar_ready(u2i_io_axi_ar_ready),
    .io_axi_ar_valid(u2i_io_axi_ar_valid),
    .io_axi_ar_bits_id(u2i_io_axi_ar_bits_id),
    .io_axi_ar_bits_addr(u2i_io_axi_ar_bits_addr),
    .io_axi_ar_bits_size(u2i_io_axi_ar_bits_size),
    .io_axi_r_ready(u2i_io_axi_r_ready),
    .io_axi_r_valid(u2i_io_axi_r_valid),
    .io_axi_r_bits_id(u2i_io_axi_r_bits_id),
    .io_axi_r_bits_data(u2i_io_axi_r_bits_data),
    .io_axi_r_bits_resp(u2i_io_axi_r_bits_resp),
    .io_axi_r_bits_last(u2i_io_axi_r_bits_last)
  );
  ysyx_210232_IDU Id ( // @[Core.scala 20:22]
    .io_pc(Id_io_pc),
    .io_inst(Id_io_inst),
    .io_prejump(Id_io_prejump),
    .io_valid(Id_io_valid),
    .io_issue_valid(Id_io_issue_valid),
    .io_issue_prejump(Id_io_issue_prejump),
    .io_issue_pc(Id_io_issue_pc),
    .io_issue_inst(Id_io_issue_inst),
    .io_issue_func_type(Id_io_issue_func_type),
    .io_issue_func_mode(Id_io_issue_func_mode),
    .io_issue_rf_raddr1(Id_io_issue_rf_raddr1),
    .io_issue_rf_raddr2(Id_io_issue_rf_raddr2),
    .io_issue_opsrc1(Id_io_issue_opsrc1),
    .io_issue_opsrc2(Id_io_issue_opsrc2),
    .io_issue_imm(Id_io_issue_imm),
    .io_issue_rv64w(Id_io_issue_rv64w),
    .io_issue_rf_wen(Id_io_issue_rf_wen),
    .io_issue_rf_waddr(Id_io_issue_rf_waddr),
    ._T_1_0(Id__T_1_0)
  );
  ysyx_210232_EXU Ex ( // @[Core.scala 21:22]
    .clock(Ex_clock),
    .reset(Ex_reset),
    .io_issue_valid(Ex_io_issue_valid),
    .io_issue_prejump(Ex_io_issue_prejump),
    .io_issue_pc(Ex_io_issue_pc),
    .io_issue_inst(Ex_io_issue_inst),
    .io_issue_func_type(Ex_io_issue_func_type),
    .io_issue_func_mode(Ex_io_issue_func_mode),
    .io_issue_rf_raddr1(Ex_io_issue_rf_raddr1),
    .io_issue_rf_raddr2(Ex_io_issue_rf_raddr2),
    .io_issue_opsrc1(Ex_io_issue_opsrc1),
    .io_issue_opsrc2(Ex_io_issue_opsrc2),
    .io_issue_imm(Ex_io_issue_imm),
    .io_issue_rv64w(Ex_io_issue_rv64w),
    .io_issue_rf_wen(Ex_io_issue_rf_wen),
    .io_issue_rf_waddr(Ex_io_issue_rf_waddr),
    .io_rf_ren1(Ex_io_rf_ren1),
    .io_rf_ren2(Ex_io_rf_ren2),
    .io_rf_raddr1(Ex_io_rf_raddr1),
    .io_rf_raddr2(Ex_io_rf_raddr2),
    .io_rf_rdata1(Ex_io_rf_rdata1),
    .io_rf_rdata2(Ex_io_rf_rdata2),
    .io_dmem_req_ready(Ex_io_dmem_req_ready),
    .io_dmem_req_valid(Ex_io_dmem_req_valid),
    .io_dmem_req_bits_addr(Ex_io_dmem_req_bits_addr),
    .io_dmem_req_bits_ren(Ex_io_dmem_req_bits_ren),
    .io_dmem_req_bits_size(Ex_io_dmem_req_bits_size),
    .io_dmem_req_bits_wen(Ex_io_dmem_req_bits_wen),
    .io_dmem_req_bits_wmask(Ex_io_dmem_req_bits_wmask),
    .io_dmem_req_bits_wdata(Ex_io_dmem_req_bits_wdata),
    .io_dmem_resp_ready(Ex_io_dmem_resp_ready),
    .io_dmem_resp_valid(Ex_io_dmem_resp_valid),
    .io_dmem_resp_bits_rdata(Ex_io_dmem_resp_bits_rdata),
    .io_dmem_resp_bits_resp(Ex_io_dmem_resp_bits_resp),
    .io_dmem_resp_bits_id(Ex_io_dmem_resp_bits_id),
    .io_rf_wen(Ex_io_rf_wen),
    .io_rf_waddr(Ex_io_rf_waddr),
    .io_func_type(Ex_io_func_type),
    .io_alu_out(Ex_io_alu_out),
    .io_lsu_out(Ex_io_lsu_out),
    .io_csr_out(Ex_io_csr_out),
    .io_jmp_out(Ex_io_jmp_out),
    .io_stall(Ex_io_stall),
    .io_valid(Ex_io_valid),
    .io_jump(Ex_io_jump),
    .io_intr(Ex_io_intr),
    .io_jumpPC(Ex_io_jumpPC),
    .LDDone(Ex_LDDone),
    .commit(Ex_commit),
    ._T_1(Ex__T_1),
    .If_Ld_fail(Ex_If_Ld_fail)
  );
  ysyx_210232_regfile Rf ( // @[Core.scala 22:22]
    .clock(Rf_clock),
    .reset(Rf_reset),
    .io_wen(Rf_io_wen),
    .io_waddr(Rf_io_waddr),
    .io_ren1(Rf_io_ren1),
    .io_raddr1(Rf_io_raddr1),
    .io_ren2(Rf_io_ren2),
    .io_raddr2(Rf_io_raddr2),
    .io_rdata1(Rf_io_rdata1),
    .io_rdata2(Rf_io_rdata2),
    .io_wdata(Rf_io_wdata)
  );
  ysyx_210232_WBU Wb ( // @[Core.scala 23:22]
    .io_func_type(Wb_io_func_type),
    .io_alu_out(Wb_io_alu_out),
    .io_lsu_out(Wb_io_lsu_out),
    .io_csr_out(Wb_io_csr_out),
    .io_jmp_out(Wb_io_jmp_out),
    .io_rf_wdata(Wb_io_rf_wdata)
  );
  ysyx_210232_PipelineReg IdReg ( // @[Core.scala 26:24]
    .clock(IdReg_clock),
    .reset(IdReg_reset),
    .io_in_pc(IdReg_io_in_pc),
    .io_in_inst(IdReg_io_in_inst),
    .io_in_valid(IdReg_io_in_valid),
    .io_in_prejump(IdReg_io_in_prejump),
    .io_out_pc(IdReg_io_out_pc),
    .io_out_inst(IdReg_io_out_inst),
    .io_out_valid(IdReg_io_out_valid),
    .io_out_prejump(IdReg_io_out_prejump),
    .io_flush(IdReg_io_flush),
    .io_stall(IdReg_io_stall)
  );
  ysyx_210232_PipelineReg_1 ExReg ( // @[Core.scala 38:23]
    .clock(ExReg_clock),
    .reset(ExReg_reset),
    .io_in_issue_valid(ExReg_io_in_issue_valid),
    .io_in_issue_prejump(ExReg_io_in_issue_prejump),
    .io_in_issue_pc(ExReg_io_in_issue_pc),
    .io_in_issue_inst(ExReg_io_in_issue_inst),
    .io_in_issue_func_type(ExReg_io_in_issue_func_type),
    .io_in_issue_func_mode(ExReg_io_in_issue_func_mode),
    .io_in_issue_rf_raddr1(ExReg_io_in_issue_rf_raddr1),
    .io_in_issue_rf_raddr2(ExReg_io_in_issue_rf_raddr2),
    .io_in_issue_opsrc1(ExReg_io_in_issue_opsrc1),
    .io_in_issue_opsrc2(ExReg_io_in_issue_opsrc2),
    .io_in_issue_imm(ExReg_io_in_issue_imm),
    .io_in_issue_rv64w(ExReg_io_in_issue_rv64w),
    .io_in_issue_rf_wen(ExReg_io_in_issue_rf_wen),
    .io_in_issue_rf_waddr(ExReg_io_in_issue_rf_waddr),
    .io_out_issue_valid(ExReg_io_out_issue_valid),
    .io_out_issue_prejump(ExReg_io_out_issue_prejump),
    .io_out_issue_pc(ExReg_io_out_issue_pc),
    .io_out_issue_inst(ExReg_io_out_issue_inst),
    .io_out_issue_func_type(ExReg_io_out_issue_func_type),
    .io_out_issue_func_mode(ExReg_io_out_issue_func_mode),
    .io_out_issue_rf_raddr1(ExReg_io_out_issue_rf_raddr1),
    .io_out_issue_rf_raddr2(ExReg_io_out_issue_rf_raddr2),
    .io_out_issue_opsrc1(ExReg_io_out_issue_opsrc1),
    .io_out_issue_opsrc2(ExReg_io_out_issue_opsrc2),
    .io_out_issue_imm(ExReg_io_out_issue_imm),
    .io_out_issue_rv64w(ExReg_io_out_issue_rv64w),
    .io_out_issue_rf_wen(ExReg_io_out_issue_rf_wen),
    .io_out_issue_rf_waddr(ExReg_io_out_issue_rf_waddr),
    .io_flush(ExReg_io_flush),
    .io_stall(ExReg_io_stall)
  );
  ysyx_210232_PipelineReg_2 WbReg ( // @[Core.scala 56:23]
    .clock(WbReg_clock),
    .reset(WbReg_reset),
    .io_in_valid(WbReg_io_in_valid),
    .io_in_func_type(WbReg_io_in_func_type),
    .io_in_alu_out(WbReg_io_in_alu_out),
    .io_in_lsu_out(WbReg_io_in_lsu_out),
    .io_in_csr_out(WbReg_io_in_csr_out),
    .io_in_jmp_out(WbReg_io_in_jmp_out),
    .io_in_rf_wen(WbReg_io_in_rf_wen),
    .io_in_rf_waddr(WbReg_io_in_rf_waddr),
    .io_out_valid(WbReg_io_out_valid),
    .io_out_func_type(WbReg_io_out_func_type),
    .io_out_alu_out(WbReg_io_out_alu_out),
    .io_out_lsu_out(WbReg_io_out_lsu_out),
    .io_out_csr_out(WbReg_io_out_csr_out),
    .io_out_jmp_out(WbReg_io_out_jmp_out),
    .io_out_rf_wen(WbReg_io_out_rf_wen),
    .io_out_rf_waddr(WbReg_io_out_rf_waddr),
    .io_flush(WbReg_io_flush),
    .io_stall(WbReg_io_stall)
  );
  assign io_axi_aw_valid = u2i_io_axi_aw_valid; // @[Core.scala 53:19]
  assign io_axi_aw_bits_addr = u2i_io_axi_aw_bits_addr; // @[Core.scala 53:19]
  assign io_axi_aw_bits_size = u2i_io_axi_aw_bits_size; // @[Core.scala 53:19]
  assign io_axi_w_valid = u2i_io_axi_w_valid; // @[Core.scala 53:19]
  assign io_axi_w_bits_data = u2i_io_axi_w_bits_data; // @[Core.scala 53:19]
  assign io_axi_w_bits_strb = u2i_io_axi_w_bits_strb; // @[Core.scala 53:19]
  assign io_axi_b_ready = u2i_io_axi_b_ready; // @[Core.scala 53:19]
  assign io_axi_ar_valid = u2i_io_axi_ar_valid; // @[Core.scala 53:19]
  assign io_axi_ar_bits_id = u2i_io_axi_ar_bits_id; // @[Core.scala 53:19]
  assign io_axi_ar_bits_addr = u2i_io_axi_ar_bits_addr; // @[Core.scala 53:19]
  assign io_axi_ar_bits_size = u2i_io_axi_ar_bits_size; // @[Core.scala 53:19]
  assign io_axi_r_ready = u2i_io_axi_r_ready; // @[Core.scala 53:19]
  assign If_clock = clock;
  assign If_reset = reset;
  assign If_io_jump = Ex_io_jump; // @[Core.scala 103:23]
  assign If_io_jumpPC = Ex_io_jumpPC; // @[Core.scala 104:23]
  assign If_io_intr = Ex_io_intr; // @[Core.scala 105:23]
  assign If_io_stall = Ex_io_stall; // @[Core.scala 107:23]
  assign If_io_imem_req_ready = crb_io_in_0_req_ready; // @[Core.scala 49:19]
  assign If_io_imem_resp_valid = crb_io_in_0_resp_valid; // @[Core.scala 49:19]
  assign If_io_imem_resp_bits_rdata = crb_io_in_0_resp_bits_rdata; // @[Core.scala 49:19]
  assign If_io_imem_resp_bits_resp = crb_io_in_0_resp_bits_resp; // @[Core.scala 49:19]
  assign If_io_imem_resp_bits_id = crb_io_in_0_resp_bits_id; // @[Core.scala 49:19]
  assign If_LDDone = Ex_LDDone;
  assign crb_clock = clock;
  assign crb_io_in_0_req_valid = If_io_imem_req_valid; // @[Core.scala 49:19]
  assign crb_io_in_0_req_bits_addr = If_io_imem_req_bits_addr; // @[Core.scala 49:19]
  assign crb_io_in_0_resp_ready = If_io_imem_resp_ready; // @[Core.scala 49:19]
  assign crb_io_in_1_req_valid = Ex_io_dmem_req_valid; // @[Core.scala 50:19]
  assign crb_io_in_1_req_bits_addr = Ex_io_dmem_req_bits_addr; // @[Core.scala 50:19]
  assign crb_io_in_1_req_bits_ren = Ex_io_dmem_req_bits_ren; // @[Core.scala 50:19]
  assign crb_io_in_1_req_bits_size = Ex_io_dmem_req_bits_size; // @[Core.scala 50:19]
  assign crb_io_in_1_req_bits_wen = Ex_io_dmem_req_bits_wen; // @[Core.scala 50:19]
  assign crb_io_in_1_req_bits_wmask = Ex_io_dmem_req_bits_wmask; // @[Core.scala 50:19]
  assign crb_io_in_1_req_bits_wdata = Ex_io_dmem_req_bits_wdata; // @[Core.scala 50:19]
  assign crb_io_in_1_resp_ready = Ex_io_dmem_resp_ready; // @[Core.scala 50:19]
  assign crb_io_out_req_ready = u2i_io_rduser_req_ready; // @[Core.scala 51:19]
  assign crb_io_out_resp_valid = u2i_io_rduser_resp_valid; // @[Core.scala 51:19]
  assign crb_io_out_resp_bits_rdata = u2i_io_rduser_resp_bits_rdata; // @[Core.scala 51:19]
  assign crb_io_out_resp_bits_resp = u2i_io_rduser_resp_bits_resp; // @[Core.scala 51:19]
  assign crb_io_out_resp_bits_id = u2i_io_rduser_resp_bits_id; // @[Core.scala 51:19]
  assign crb_io_outw_req_ready = u2i_io_wruser_req_ready; // @[Core.scala 52:19]
  assign crb_io_outw_resp_valid = u2i_io_wruser_resp_valid; // @[Core.scala 52:19]
  assign crb_io_outw_resp_bits_resp = u2i_io_wruser_resp_bits_resp; // @[Core.scala 52:19]
  assign crb_io_outw_resp_bits_id = u2i_io_wruser_resp_bits_id; // @[Core.scala 52:19]
  assign u2i_clock = clock;
  assign u2i_reset = reset;
  assign u2i_io_wruser_req_valid = crb_io_outw_req_valid; // @[Core.scala 52:19]
  assign u2i_io_wruser_req_bits_addr = crb_io_outw_req_bits_addr; // @[Core.scala 52:19]
  assign u2i_io_wruser_req_bits_size = crb_io_outw_req_bits_size; // @[Core.scala 52:19]
  assign u2i_io_wruser_req_bits_wen = crb_io_outw_req_bits_wen; // @[Core.scala 52:19]
  assign u2i_io_wruser_req_bits_wmask = crb_io_outw_req_bits_wmask; // @[Core.scala 52:19]
  assign u2i_io_wruser_req_bits_wdata = crb_io_outw_req_bits_wdata; // @[Core.scala 52:19]
  assign u2i_io_wruser_resp_ready = crb_io_outw_resp_ready; // @[Core.scala 52:19]
  assign u2i_io_rduser_req_valid = crb_io_out_req_valid; // @[Core.scala 51:19]
  assign u2i_io_rduser_req_bits_addr = crb_io_out_req_bits_addr; // @[Core.scala 51:19]
  assign u2i_io_rduser_req_bits_size = crb_io_out_req_bits_size; // @[Core.scala 51:19]
  assign u2i_io_rduser_req_bits_id = crb_io_out_req_bits_id; // @[Core.scala 51:19]
  assign u2i_io_rduser_resp_ready = crb_io_out_resp_ready; // @[Core.scala 51:19]
  assign u2i_io_axi_aw_ready = io_axi_aw_ready; // @[Core.scala 53:19]
  assign u2i_io_axi_w_ready = io_axi_w_ready; // @[Core.scala 53:19]
  assign u2i_io_axi_b_valid = io_axi_b_valid; // @[Core.scala 53:19]
  assign u2i_io_axi_b_bits_id = io_axi_b_bits_id; // @[Core.scala 53:19]
  assign u2i_io_axi_b_bits_resp = io_axi_b_bits_resp; // @[Core.scala 53:19]
  assign u2i_io_axi_ar_ready = io_axi_ar_ready; // @[Core.scala 53:19]
  assign u2i_io_axi_r_valid = io_axi_r_valid; // @[Core.scala 53:19]
  assign u2i_io_axi_r_bits_id = io_axi_r_bits_id; // @[Core.scala 53:19]
  assign u2i_io_axi_r_bits_data = io_axi_r_bits_data; // @[Core.scala 53:19]
  assign u2i_io_axi_r_bits_resp = io_axi_r_bits_resp; // @[Core.scala 53:19]
  assign u2i_io_axi_r_bits_last = io_axi_r_bits_last; // @[Core.scala 53:19]
  assign Id_io_pc = IdReg_io_out_pc; // @[Core.scala 32:21]
  assign Id_io_inst = IdReg_io_out_inst; // @[Core.scala 33:21]
  assign Id_io_prejump = IdReg_io_out_prejump; // @[Core.scala 35:21]
  assign Id_io_valid = IdReg_io_out_valid; // @[Core.scala 34:21]
  assign Ex_clock = clock;
  assign Ex_reset = reset;
  assign Ex_io_issue_valid = ExReg_io_out_issue_valid; // @[Core.scala 40:17]
  assign Ex_io_issue_prejump = ExReg_io_out_issue_prejump; // @[Core.scala 40:17]
  assign Ex_io_issue_pc = ExReg_io_out_issue_pc; // @[Core.scala 40:17]
  assign Ex_io_issue_inst = ExReg_io_out_issue_inst; // @[Core.scala 40:17]
  assign Ex_io_issue_func_type = ExReg_io_out_issue_func_type; // @[Core.scala 40:17]
  assign Ex_io_issue_func_mode = ExReg_io_out_issue_func_mode; // @[Core.scala 40:17]
  assign Ex_io_issue_rf_raddr1 = ExReg_io_out_issue_rf_raddr1; // @[Core.scala 40:17]
  assign Ex_io_issue_rf_raddr2 = ExReg_io_out_issue_rf_raddr2; // @[Core.scala 40:17]
  assign Ex_io_issue_opsrc1 = ExReg_io_out_issue_opsrc1; // @[Core.scala 40:17]
  assign Ex_io_issue_opsrc2 = ExReg_io_out_issue_opsrc2; // @[Core.scala 40:17]
  assign Ex_io_issue_imm = ExReg_io_out_issue_imm; // @[Core.scala 40:17]
  assign Ex_io_issue_rv64w = ExReg_io_out_issue_rv64w; // @[Core.scala 40:17]
  assign Ex_io_issue_rf_wen = ExReg_io_out_issue_rf_wen; // @[Core.scala 40:17]
  assign Ex_io_issue_rf_waddr = ExReg_io_out_issue_rf_waddr; // @[Core.scala 40:17]
  assign Ex_io_rf_rdata1 = data1_hzard ? Wb_io_rf_wdata : Rf_io_rdata1; // @[Core.scala 97:27]
  assign Ex_io_rf_rdata2 = data2_hzard ? Wb_io_rf_wdata : Rf_io_rdata2; // @[Core.scala 98:27]
  assign Ex_io_dmem_req_ready = crb_io_in_1_req_ready; // @[Core.scala 50:19]
  assign Ex_io_dmem_resp_valid = crb_io_in_1_resp_valid; // @[Core.scala 50:19]
  assign Ex_io_dmem_resp_bits_rdata = crb_io_in_1_resp_bits_rdata; // @[Core.scala 50:19]
  assign Ex_io_dmem_resp_bits_resp = crb_io_in_1_resp_bits_resp; // @[Core.scala 50:19]
  assign Ex_io_dmem_resp_bits_id = crb_io_in_1_resp_bits_id; // @[Core.scala 50:19]
  assign Ex_commit = commit;
  assign Ex__T_1 = Id__T_1_0;
  assign Ex_If_Ld_fail = If_If_Ld_fail_0;
  assign Rf_clock = clock;
  assign Rf_reset = reset;
  assign Rf_io_wen = WbReg_io_out_rf_wen & commit; // @[Core.scala 81:45]
  assign Rf_io_waddr = WbReg_io_out_rf_waddr; // @[Core.scala 80:21]
  assign Rf_io_ren1 = Ex_io_rf_ren1; // @[Core.scala 43:18]
  assign Rf_io_raddr1 = Ex_io_rf_raddr1; // @[Core.scala 45:18]
  assign Rf_io_ren2 = Ex_io_rf_ren2; // @[Core.scala 44:18]
  assign Rf_io_raddr2 = Ex_io_rf_raddr2; // @[Core.scala 46:18]
  assign Rf_io_wdata = Wb_io_rf_wdata; // @[Core.scala 82:21]
  assign Wb_io_func_type = WbReg_io_out_func_type; // @[Core.scala 71:22]
  assign Wb_io_alu_out = WbReg_io_out_alu_out; // @[Core.scala 72:22]
  assign Wb_io_lsu_out = WbReg_io_out_lsu_out; // @[Core.scala 73:22]
  assign Wb_io_csr_out = WbReg_io_out_csr_out; // @[Core.scala 74:22]
  assign Wb_io_jmp_out = WbReg_io_out_jmp_out; // @[Core.scala 75:22]
  assign IdReg_clock = clock;
  assign IdReg_reset = reset;
  assign IdReg_io_in_pc = If_io_pc; // @[Core.scala 27:23]
  assign IdReg_io_in_inst = If_io_inst; // @[Core.scala 28:23]
  assign IdReg_io_in_valid = If_io_fetched; // @[Core.scala 29:23]
  assign IdReg_io_in_prejump = If_io_prejump; // @[Core.scala 30:26]
  assign IdReg_io_flush = Ex_io_jump; // @[Core.scala 112:23]
  assign IdReg_io_stall = Ex_io_stall; // @[Core.scala 108:23]
  assign ExReg_clock = clock;
  assign ExReg_reset = reset;
  assign ExReg_io_in_issue_valid = Id_io_issue_valid; // @[Core.scala 39:23]
  assign ExReg_io_in_issue_prejump = Id_io_issue_prejump; // @[Core.scala 39:23]
  assign ExReg_io_in_issue_pc = Id_io_issue_pc; // @[Core.scala 39:23]
  assign ExReg_io_in_issue_inst = Id_io_issue_inst; // @[Core.scala 39:23]
  assign ExReg_io_in_issue_func_type = Id_io_issue_func_type; // @[Core.scala 39:23]
  assign ExReg_io_in_issue_func_mode = Id_io_issue_func_mode; // @[Core.scala 39:23]
  assign ExReg_io_in_issue_rf_raddr1 = Id_io_issue_rf_raddr1; // @[Core.scala 39:23]
  assign ExReg_io_in_issue_rf_raddr2 = Id_io_issue_rf_raddr2; // @[Core.scala 39:23]
  assign ExReg_io_in_issue_opsrc1 = Id_io_issue_opsrc1; // @[Core.scala 39:23]
  assign ExReg_io_in_issue_opsrc2 = Id_io_issue_opsrc2; // @[Core.scala 39:23]
  assign ExReg_io_in_issue_imm = Id_io_issue_imm; // @[Core.scala 39:23]
  assign ExReg_io_in_issue_rv64w = Id_io_issue_rv64w; // @[Core.scala 39:23]
  assign ExReg_io_in_issue_rf_wen = Id_io_issue_rf_wen; // @[Core.scala 39:23]
  assign ExReg_io_in_issue_rf_waddr = Id_io_issue_rf_waddr; // @[Core.scala 39:23]
  assign ExReg_io_flush = Ex_io_jump; // @[Core.scala 113:23]
  assign ExReg_io_stall = Ex_io_stall; // @[Core.scala 109:23]
  assign WbReg_clock = clock;
  assign WbReg_reset = reset;
  assign WbReg_io_in_valid = Ex_io_valid; // @[Core.scala 59:27]
  assign WbReg_io_in_func_type = Ex_io_func_type; // @[Core.scala 60:27]
  assign WbReg_io_in_alu_out = Ex_io_alu_out; // @[Core.scala 61:27]
  assign WbReg_io_in_lsu_out = Ex_io_lsu_out; // @[Core.scala 62:27]
  assign WbReg_io_in_csr_out = Ex_io_csr_out; // @[Core.scala 63:27]
  assign WbReg_io_in_jmp_out = Ex_io_jmp_out; // @[Core.scala 64:27]
  assign WbReg_io_in_rf_wen = Ex_io_rf_wen; // @[Core.scala 65:27]
  assign WbReg_io_in_rf_waddr = Ex_io_rf_waddr; // @[Core.scala 66:27]
  assign WbReg_io_flush = Ex_io_intr; // @[Core.scala 114:23]
  assign WbReg_io_stall = Ex_io_stall; // @[Core.scala 110:23]
endmodule
module ysyx_210232(
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
  wire  core_clock; // @[SOCTop.scala 54:22]
  wire  core_reset; // @[SOCTop.scala 54:22]
  wire  core_io_axi_aw_ready; // @[SOCTop.scala 54:22]
  wire  core_io_axi_aw_valid; // @[SOCTop.scala 54:22]
  wire [31:0] core_io_axi_aw_bits_addr; // @[SOCTop.scala 54:22]
  wire [2:0] core_io_axi_aw_bits_size; // @[SOCTop.scala 54:22]
  wire  core_io_axi_w_ready; // @[SOCTop.scala 54:22]
  wire  core_io_axi_w_valid; // @[SOCTop.scala 54:22]
  wire [63:0] core_io_axi_w_bits_data; // @[SOCTop.scala 54:22]
  wire [7:0] core_io_axi_w_bits_strb; // @[SOCTop.scala 54:22]
  wire  core_io_axi_b_ready; // @[SOCTop.scala 54:22]
  wire  core_io_axi_b_valid; // @[SOCTop.scala 54:22]
  wire [3:0] core_io_axi_b_bits_id; // @[SOCTop.scala 54:22]
  wire [1:0] core_io_axi_b_bits_resp; // @[SOCTop.scala 54:22]
  wire  core_io_axi_ar_ready; // @[SOCTop.scala 54:22]
  wire  core_io_axi_ar_valid; // @[SOCTop.scala 54:22]
  wire [3:0] core_io_axi_ar_bits_id; // @[SOCTop.scala 54:22]
  wire [31:0] core_io_axi_ar_bits_addr; // @[SOCTop.scala 54:22]
  wire [2:0] core_io_axi_ar_bits_size; // @[SOCTop.scala 54:22]
  wire  core_io_axi_r_ready; // @[SOCTop.scala 54:22]
  wire  core_io_axi_r_valid; // @[SOCTop.scala 54:22]
  wire [3:0] core_io_axi_r_bits_id; // @[SOCTop.scala 54:22]
  wire [63:0] core_io_axi_r_bits_data; // @[SOCTop.scala 54:22]
  wire [1:0] core_io_axi_r_bits_resp; // @[SOCTop.scala 54:22]
  wire  core_io_axi_r_bits_last; // @[SOCTop.scala 54:22]
  ysyx_210232_Core core ( // @[SOCTop.scala 54:22]
    .clock(core_clock),
    .reset(core_reset),
    .io_axi_aw_ready(core_io_axi_aw_ready),
    .io_axi_aw_valid(core_io_axi_aw_valid),
    .io_axi_aw_bits_addr(core_io_axi_aw_bits_addr),
    .io_axi_aw_bits_size(core_io_axi_aw_bits_size),
    .io_axi_w_ready(core_io_axi_w_ready),
    .io_axi_w_valid(core_io_axi_w_valid),
    .io_axi_w_bits_data(core_io_axi_w_bits_data),
    .io_axi_w_bits_strb(core_io_axi_w_bits_strb),
    .io_axi_b_ready(core_io_axi_b_ready),
    .io_axi_b_valid(core_io_axi_b_valid),
    .io_axi_b_bits_id(core_io_axi_b_bits_id),
    .io_axi_b_bits_resp(core_io_axi_b_bits_resp),
    .io_axi_ar_ready(core_io_axi_ar_ready),
    .io_axi_ar_valid(core_io_axi_ar_valid),
    .io_axi_ar_bits_id(core_io_axi_ar_bits_id),
    .io_axi_ar_bits_addr(core_io_axi_ar_bits_addr),
    .io_axi_ar_bits_size(core_io_axi_ar_bits_size),
    .io_axi_r_ready(core_io_axi_r_ready),
    .io_axi_r_valid(core_io_axi_r_valid),
    .io_axi_r_bits_id(core_io_axi_r_bits_id),
    .io_axi_r_bits_data(core_io_axi_r_bits_data),
    .io_axi_r_bits_resp(core_io_axi_r_bits_resp),
    .io_axi_r_bits_last(core_io_axi_r_bits_last)
  );
  assign io_master_awvalid = core_io_axi_aw_valid; // @[SOCTop.scala 60:26]
  assign io_master_awaddr = core_io_axi_aw_bits_addr; // @[SOCTop.scala 61:26]
  assign io_master_awid = 4'h2; // @[SOCTop.scala 62:26]
  assign io_master_awlen = 8'h0; // @[SOCTop.scala 63:26]
  assign io_master_awsize = core_io_axi_aw_bits_size; // @[SOCTop.scala 64:26]
  assign io_master_awburst = 2'h1; // @[SOCTop.scala 65:26]
  assign io_master_wvalid = core_io_axi_w_valid; // @[SOCTop.scala 68:25]
  assign io_master_wdata = core_io_axi_w_bits_data; // @[SOCTop.scala 69:25]
  assign io_master_wstrb = core_io_axi_w_bits_strb; // @[SOCTop.scala 70:25]
  assign io_master_wlast = 1'h1; // @[SOCTop.scala 71:25]
  assign io_master_bready = core_io_axi_b_ready; // @[SOCTop.scala 73:30]
  assign io_master_arvalid = core_io_axi_ar_valid; // @[SOCTop.scala 79:26]
  assign io_master_araddr = core_io_axi_ar_bits_addr; // @[SOCTop.scala 80:26]
  assign io_master_arid = core_io_axi_ar_bits_id; // @[SOCTop.scala 81:26]
  assign io_master_arlen = 8'h0; // @[SOCTop.scala 82:26]
  assign io_master_arsize = core_io_axi_ar_bits_size; // @[SOCTop.scala 83:26]
  assign io_master_arburst = 2'h1; // @[SOCTop.scala 84:26]
  assign io_master_rready = core_io_axi_r_ready; // @[SOCTop.scala 86:29]
  assign io_slave_awready = 1'h0; // @[SOCTop.scala 97:22]
  assign io_slave_wready = 1'h0; // @[SOCTop.scala 105:22]
  assign io_slave_bvalid = 1'h0; // @[SOCTop.scala 112:21]
  assign io_slave_bresp = 2'h0; // @[SOCTop.scala 113:21]
  assign io_slave_bid = 4'h0; // @[SOCTop.scala 114:21]
  assign io_slave_arready = 1'h0; // @[SOCTop.scala 117:22]
  assign io_slave_rvalid = 1'h0; // @[SOCTop.scala 125:21]
  assign io_slave_rresp = 2'h0; // @[SOCTop.scala 126:21]
  assign io_slave_rdata = 64'h0; // @[SOCTop.scala 127:21]
  assign io_slave_rlast = 1'h0; // @[SOCTop.scala 128:21]
  assign io_slave_rid = 4'h0; // @[SOCTop.scala 129:21]
  assign core_clock = clock;
  assign core_reset = reset;
  assign core_io_axi_aw_ready = io_master_awready; // @[SOCTop.scala 59:26]
  assign core_io_axi_w_ready = io_master_wready; // @[SOCTop.scala 67:25]
  assign core_io_axi_b_valid = io_master_bvalid; // @[SOCTop.scala 74:30]
  assign core_io_axi_b_bits_id = io_master_bid; // @[SOCTop.scala 76:30]
  assign core_io_axi_b_bits_resp = io_master_bresp; // @[SOCTop.scala 75:30]
  assign core_io_axi_ar_ready = io_master_arready; // @[SOCTop.scala 78:26]
  assign core_io_axi_r_valid = io_master_rvalid; // @[SOCTop.scala 87:29]
  assign core_io_axi_r_bits_id = io_master_rid; // @[SOCTop.scala 91:29]
  assign core_io_axi_r_bits_data = io_master_rdata; // @[SOCTop.scala 89:29]
  assign core_io_axi_r_bits_resp = io_master_rresp; // @[SOCTop.scala 88:29]
  assign core_io_axi_r_bits_last = io_master_rlast; // @[SOCTop.scala 90:29]
endmodule
