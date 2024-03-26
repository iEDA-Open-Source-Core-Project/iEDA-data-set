module ysyx_210285_RegFile(
  input         clock,
  input         reset,
  input  [4:0]  io_rport_raddr_0,
  input  [4:0]  io_rport_raddr_1,
  output [63:0] io_rport_rdata_0,
  output [63:0] io_rport_rdata_1,
  input  [4:0]  io_wb_rd,
  input  [63:0] io_wb_data
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
  wire  negClock = ~clock; // @[RegFile.scala 21:41]
  reg [63:0] reg_0; // @[RegFile.scala 23:12]
  reg [63:0] reg_1; // @[RegFile.scala 23:12]
  reg [63:0] reg_2; // @[RegFile.scala 23:12]
  reg [63:0] reg_3; // @[RegFile.scala 23:12]
  reg [63:0] reg_4; // @[RegFile.scala 23:12]
  reg [63:0] reg_5; // @[RegFile.scala 23:12]
  reg [63:0] reg_6; // @[RegFile.scala 23:12]
  reg [63:0] reg_7; // @[RegFile.scala 23:12]
  reg [63:0] reg_8; // @[RegFile.scala 23:12]
  reg [63:0] reg_9; // @[RegFile.scala 23:12]
  reg [63:0] reg_10; // @[RegFile.scala 23:12]
  reg [63:0] reg_11; // @[RegFile.scala 23:12]
  reg [63:0] reg_12; // @[RegFile.scala 23:12]
  reg [63:0] reg_13; // @[RegFile.scala 23:12]
  reg [63:0] reg_14; // @[RegFile.scala 23:12]
  reg [63:0] reg_15; // @[RegFile.scala 23:12]
  reg [63:0] reg_16; // @[RegFile.scala 23:12]
  reg [63:0] reg_17; // @[RegFile.scala 23:12]
  reg [63:0] reg_18; // @[RegFile.scala 23:12]
  reg [63:0] reg_19; // @[RegFile.scala 23:12]
  reg [63:0] reg_20; // @[RegFile.scala 23:12]
  reg [63:0] reg_21; // @[RegFile.scala 23:12]
  reg [63:0] reg_22; // @[RegFile.scala 23:12]
  reg [63:0] reg_23; // @[RegFile.scala 23:12]
  reg [63:0] reg_24; // @[RegFile.scala 23:12]
  reg [63:0] reg_25; // @[RegFile.scala 23:12]
  reg [63:0] reg_26; // @[RegFile.scala 23:12]
  reg [63:0] reg_27; // @[RegFile.scala 23:12]
  reg [63:0] reg_28; // @[RegFile.scala 23:12]
  reg [63:0] reg_29; // @[RegFile.scala 23:12]
  reg [63:0] reg_30; // @[RegFile.scala 23:12]
  reg [63:0] reg_31; // @[RegFile.scala 23:12]
  wire [63:0] _GEN_65 = 5'h1 == io_rport_raddr_0 ? reg_1 : reg_0; // @[RegFile.scala 30:23 RegFile.scala 30:23]
  wire [63:0] _GEN_66 = 5'h2 == io_rport_raddr_0 ? reg_2 : _GEN_65; // @[RegFile.scala 30:23 RegFile.scala 30:23]
  wire [63:0] _GEN_67 = 5'h3 == io_rport_raddr_0 ? reg_3 : _GEN_66; // @[RegFile.scala 30:23 RegFile.scala 30:23]
  wire [63:0] _GEN_68 = 5'h4 == io_rport_raddr_0 ? reg_4 : _GEN_67; // @[RegFile.scala 30:23 RegFile.scala 30:23]
  wire [63:0] _GEN_69 = 5'h5 == io_rport_raddr_0 ? reg_5 : _GEN_68; // @[RegFile.scala 30:23 RegFile.scala 30:23]
  wire [63:0] _GEN_70 = 5'h6 == io_rport_raddr_0 ? reg_6 : _GEN_69; // @[RegFile.scala 30:23 RegFile.scala 30:23]
  wire [63:0] _GEN_71 = 5'h7 == io_rport_raddr_0 ? reg_7 : _GEN_70; // @[RegFile.scala 30:23 RegFile.scala 30:23]
  wire [63:0] _GEN_72 = 5'h8 == io_rport_raddr_0 ? reg_8 : _GEN_71; // @[RegFile.scala 30:23 RegFile.scala 30:23]
  wire [63:0] _GEN_73 = 5'h9 == io_rport_raddr_0 ? reg_9 : _GEN_72; // @[RegFile.scala 30:23 RegFile.scala 30:23]
  wire [63:0] _GEN_74 = 5'ha == io_rport_raddr_0 ? reg_10 : _GEN_73; // @[RegFile.scala 30:23 RegFile.scala 30:23]
  wire [63:0] _GEN_75 = 5'hb == io_rport_raddr_0 ? reg_11 : _GEN_74; // @[RegFile.scala 30:23 RegFile.scala 30:23]
  wire [63:0] _GEN_76 = 5'hc == io_rport_raddr_0 ? reg_12 : _GEN_75; // @[RegFile.scala 30:23 RegFile.scala 30:23]
  wire [63:0] _GEN_77 = 5'hd == io_rport_raddr_0 ? reg_13 : _GEN_76; // @[RegFile.scala 30:23 RegFile.scala 30:23]
  wire [63:0] _GEN_78 = 5'he == io_rport_raddr_0 ? reg_14 : _GEN_77; // @[RegFile.scala 30:23 RegFile.scala 30:23]
  wire [63:0] _GEN_79 = 5'hf == io_rport_raddr_0 ? reg_15 : _GEN_78; // @[RegFile.scala 30:23 RegFile.scala 30:23]
  wire [63:0] _GEN_80 = 5'h10 == io_rport_raddr_0 ? reg_16 : _GEN_79; // @[RegFile.scala 30:23 RegFile.scala 30:23]
  wire [63:0] _GEN_81 = 5'h11 == io_rport_raddr_0 ? reg_17 : _GEN_80; // @[RegFile.scala 30:23 RegFile.scala 30:23]
  wire [63:0] _GEN_82 = 5'h12 == io_rport_raddr_0 ? reg_18 : _GEN_81; // @[RegFile.scala 30:23 RegFile.scala 30:23]
  wire [63:0] _GEN_83 = 5'h13 == io_rport_raddr_0 ? reg_19 : _GEN_82; // @[RegFile.scala 30:23 RegFile.scala 30:23]
  wire [63:0] _GEN_84 = 5'h14 == io_rport_raddr_0 ? reg_20 : _GEN_83; // @[RegFile.scala 30:23 RegFile.scala 30:23]
  wire [63:0] _GEN_85 = 5'h15 == io_rport_raddr_0 ? reg_21 : _GEN_84; // @[RegFile.scala 30:23 RegFile.scala 30:23]
  wire [63:0] _GEN_86 = 5'h16 == io_rport_raddr_0 ? reg_22 : _GEN_85; // @[RegFile.scala 30:23 RegFile.scala 30:23]
  wire [63:0] _GEN_87 = 5'h17 == io_rport_raddr_0 ? reg_23 : _GEN_86; // @[RegFile.scala 30:23 RegFile.scala 30:23]
  wire [63:0] _GEN_88 = 5'h18 == io_rport_raddr_0 ? reg_24 : _GEN_87; // @[RegFile.scala 30:23 RegFile.scala 30:23]
  wire [63:0] _GEN_89 = 5'h19 == io_rport_raddr_0 ? reg_25 : _GEN_88; // @[RegFile.scala 30:23 RegFile.scala 30:23]
  wire [63:0] _GEN_90 = 5'h1a == io_rport_raddr_0 ? reg_26 : _GEN_89; // @[RegFile.scala 30:23 RegFile.scala 30:23]
  wire [63:0] _GEN_91 = 5'h1b == io_rport_raddr_0 ? reg_27 : _GEN_90; // @[RegFile.scala 30:23 RegFile.scala 30:23]
  wire [63:0] _GEN_92 = 5'h1c == io_rport_raddr_0 ? reg_28 : _GEN_91; // @[RegFile.scala 30:23 RegFile.scala 30:23]
  wire [63:0] _GEN_93 = 5'h1d == io_rport_raddr_0 ? reg_29 : _GEN_92; // @[RegFile.scala 30:23 RegFile.scala 30:23]
  wire [63:0] _GEN_94 = 5'h1e == io_rport_raddr_0 ? reg_30 : _GEN_93; // @[RegFile.scala 30:23 RegFile.scala 30:23]
  wire [63:0] _GEN_97 = 5'h1 == io_rport_raddr_1 ? reg_1 : reg_0; // @[RegFile.scala 30:23 RegFile.scala 30:23]
  wire [63:0] _GEN_98 = 5'h2 == io_rport_raddr_1 ? reg_2 : _GEN_97; // @[RegFile.scala 30:23 RegFile.scala 30:23]
  wire [63:0] _GEN_99 = 5'h3 == io_rport_raddr_1 ? reg_3 : _GEN_98; // @[RegFile.scala 30:23 RegFile.scala 30:23]
  wire [63:0] _GEN_100 = 5'h4 == io_rport_raddr_1 ? reg_4 : _GEN_99; // @[RegFile.scala 30:23 RegFile.scala 30:23]
  wire [63:0] _GEN_101 = 5'h5 == io_rport_raddr_1 ? reg_5 : _GEN_100; // @[RegFile.scala 30:23 RegFile.scala 30:23]
  wire [63:0] _GEN_102 = 5'h6 == io_rport_raddr_1 ? reg_6 : _GEN_101; // @[RegFile.scala 30:23 RegFile.scala 30:23]
  wire [63:0] _GEN_103 = 5'h7 == io_rport_raddr_1 ? reg_7 : _GEN_102; // @[RegFile.scala 30:23 RegFile.scala 30:23]
  wire [63:0] _GEN_104 = 5'h8 == io_rport_raddr_1 ? reg_8 : _GEN_103; // @[RegFile.scala 30:23 RegFile.scala 30:23]
  wire [63:0] _GEN_105 = 5'h9 == io_rport_raddr_1 ? reg_9 : _GEN_104; // @[RegFile.scala 30:23 RegFile.scala 30:23]
  wire [63:0] _GEN_106 = 5'ha == io_rport_raddr_1 ? reg_10 : _GEN_105; // @[RegFile.scala 30:23 RegFile.scala 30:23]
  wire [63:0] _GEN_107 = 5'hb == io_rport_raddr_1 ? reg_11 : _GEN_106; // @[RegFile.scala 30:23 RegFile.scala 30:23]
  wire [63:0] _GEN_108 = 5'hc == io_rport_raddr_1 ? reg_12 : _GEN_107; // @[RegFile.scala 30:23 RegFile.scala 30:23]
  wire [63:0] _GEN_109 = 5'hd == io_rport_raddr_1 ? reg_13 : _GEN_108; // @[RegFile.scala 30:23 RegFile.scala 30:23]
  wire [63:0] _GEN_110 = 5'he == io_rport_raddr_1 ? reg_14 : _GEN_109; // @[RegFile.scala 30:23 RegFile.scala 30:23]
  wire [63:0] _GEN_111 = 5'hf == io_rport_raddr_1 ? reg_15 : _GEN_110; // @[RegFile.scala 30:23 RegFile.scala 30:23]
  wire [63:0] _GEN_112 = 5'h10 == io_rport_raddr_1 ? reg_16 : _GEN_111; // @[RegFile.scala 30:23 RegFile.scala 30:23]
  wire [63:0] _GEN_113 = 5'h11 == io_rport_raddr_1 ? reg_17 : _GEN_112; // @[RegFile.scala 30:23 RegFile.scala 30:23]
  wire [63:0] _GEN_114 = 5'h12 == io_rport_raddr_1 ? reg_18 : _GEN_113; // @[RegFile.scala 30:23 RegFile.scala 30:23]
  wire [63:0] _GEN_115 = 5'h13 == io_rport_raddr_1 ? reg_19 : _GEN_114; // @[RegFile.scala 30:23 RegFile.scala 30:23]
  wire [63:0] _GEN_116 = 5'h14 == io_rport_raddr_1 ? reg_20 : _GEN_115; // @[RegFile.scala 30:23 RegFile.scala 30:23]
  wire [63:0] _GEN_117 = 5'h15 == io_rport_raddr_1 ? reg_21 : _GEN_116; // @[RegFile.scala 30:23 RegFile.scala 30:23]
  wire [63:0] _GEN_118 = 5'h16 == io_rport_raddr_1 ? reg_22 : _GEN_117; // @[RegFile.scala 30:23 RegFile.scala 30:23]
  wire [63:0] _GEN_119 = 5'h17 == io_rport_raddr_1 ? reg_23 : _GEN_118; // @[RegFile.scala 30:23 RegFile.scala 30:23]
  wire [63:0] _GEN_120 = 5'h18 == io_rport_raddr_1 ? reg_24 : _GEN_119; // @[RegFile.scala 30:23 RegFile.scala 30:23]
  wire [63:0] _GEN_121 = 5'h19 == io_rport_raddr_1 ? reg_25 : _GEN_120; // @[RegFile.scala 30:23 RegFile.scala 30:23]
  wire [63:0] _GEN_122 = 5'h1a == io_rport_raddr_1 ? reg_26 : _GEN_121; // @[RegFile.scala 30:23 RegFile.scala 30:23]
  wire [63:0] _GEN_123 = 5'h1b == io_rport_raddr_1 ? reg_27 : _GEN_122; // @[RegFile.scala 30:23 RegFile.scala 30:23]
  wire [63:0] _GEN_124 = 5'h1c == io_rport_raddr_1 ? reg_28 : _GEN_123; // @[RegFile.scala 30:23 RegFile.scala 30:23]
  wire [63:0] _GEN_125 = 5'h1d == io_rport_raddr_1 ? reg_29 : _GEN_124; // @[RegFile.scala 30:23 RegFile.scala 30:23]
  wire [63:0] _GEN_126 = 5'h1e == io_rport_raddr_1 ? reg_30 : _GEN_125; // @[RegFile.scala 30:23 RegFile.scala 30:23]
  assign io_rport_rdata_0 = 5'h1f == io_rport_raddr_0 ? reg_31 : _GEN_94; // @[RegFile.scala 30:23 RegFile.scala 30:23]
  assign io_rport_rdata_1 = 5'h1f == io_rport_raddr_1 ? reg_31 : _GEN_126; // @[RegFile.scala 30:23 RegFile.scala 30:23]
  always @(posedge negClock) begin
    if (reset) begin // @[RegFile.scala 23:12]
      reg_0 <= 64'h0; // @[RegFile.scala 23:12]
    end else if (io_wb_rd != 5'h0) begin // @[RegFile.scala 26:26]
      if (5'h0 == io_wb_rd) begin // @[RegFile.scala 27:19]
        reg_0 <= io_wb_data; // @[RegFile.scala 27:19]
      end
    end
    if (reset) begin // @[RegFile.scala 23:12]
      reg_1 <= 64'h0; // @[RegFile.scala 23:12]
    end else if (io_wb_rd != 5'h0) begin // @[RegFile.scala 26:26]
      if (5'h1 == io_wb_rd) begin // @[RegFile.scala 27:19]
        reg_1 <= io_wb_data; // @[RegFile.scala 27:19]
      end
    end
    if (reset) begin // @[RegFile.scala 23:12]
      reg_2 <= 64'h0; // @[RegFile.scala 23:12]
    end else if (io_wb_rd != 5'h0) begin // @[RegFile.scala 26:26]
      if (5'h2 == io_wb_rd) begin // @[RegFile.scala 27:19]
        reg_2 <= io_wb_data; // @[RegFile.scala 27:19]
      end
    end
    if (reset) begin // @[RegFile.scala 23:12]
      reg_3 <= 64'h0; // @[RegFile.scala 23:12]
    end else if (io_wb_rd != 5'h0) begin // @[RegFile.scala 26:26]
      if (5'h3 == io_wb_rd) begin // @[RegFile.scala 27:19]
        reg_3 <= io_wb_data; // @[RegFile.scala 27:19]
      end
    end
    if (reset) begin // @[RegFile.scala 23:12]
      reg_4 <= 64'h0; // @[RegFile.scala 23:12]
    end else if (io_wb_rd != 5'h0) begin // @[RegFile.scala 26:26]
      if (5'h4 == io_wb_rd) begin // @[RegFile.scala 27:19]
        reg_4 <= io_wb_data; // @[RegFile.scala 27:19]
      end
    end
    if (reset) begin // @[RegFile.scala 23:12]
      reg_5 <= 64'h0; // @[RegFile.scala 23:12]
    end else if (io_wb_rd != 5'h0) begin // @[RegFile.scala 26:26]
      if (5'h5 == io_wb_rd) begin // @[RegFile.scala 27:19]
        reg_5 <= io_wb_data; // @[RegFile.scala 27:19]
      end
    end
    if (reset) begin // @[RegFile.scala 23:12]
      reg_6 <= 64'h0; // @[RegFile.scala 23:12]
    end else if (io_wb_rd != 5'h0) begin // @[RegFile.scala 26:26]
      if (5'h6 == io_wb_rd) begin // @[RegFile.scala 27:19]
        reg_6 <= io_wb_data; // @[RegFile.scala 27:19]
      end
    end
    if (reset) begin // @[RegFile.scala 23:12]
      reg_7 <= 64'h0; // @[RegFile.scala 23:12]
    end else if (io_wb_rd != 5'h0) begin // @[RegFile.scala 26:26]
      if (5'h7 == io_wb_rd) begin // @[RegFile.scala 27:19]
        reg_7 <= io_wb_data; // @[RegFile.scala 27:19]
      end
    end
    if (reset) begin // @[RegFile.scala 23:12]
      reg_8 <= 64'h0; // @[RegFile.scala 23:12]
    end else if (io_wb_rd != 5'h0) begin // @[RegFile.scala 26:26]
      if (5'h8 == io_wb_rd) begin // @[RegFile.scala 27:19]
        reg_8 <= io_wb_data; // @[RegFile.scala 27:19]
      end
    end
    if (reset) begin // @[RegFile.scala 23:12]
      reg_9 <= 64'h0; // @[RegFile.scala 23:12]
    end else if (io_wb_rd != 5'h0) begin // @[RegFile.scala 26:26]
      if (5'h9 == io_wb_rd) begin // @[RegFile.scala 27:19]
        reg_9 <= io_wb_data; // @[RegFile.scala 27:19]
      end
    end
    if (reset) begin // @[RegFile.scala 23:12]
      reg_10 <= 64'h0; // @[RegFile.scala 23:12]
    end else if (io_wb_rd != 5'h0) begin // @[RegFile.scala 26:26]
      if (5'ha == io_wb_rd) begin // @[RegFile.scala 27:19]
        reg_10 <= io_wb_data; // @[RegFile.scala 27:19]
      end
    end
    if (reset) begin // @[RegFile.scala 23:12]
      reg_11 <= 64'h0; // @[RegFile.scala 23:12]
    end else if (io_wb_rd != 5'h0) begin // @[RegFile.scala 26:26]
      if (5'hb == io_wb_rd) begin // @[RegFile.scala 27:19]
        reg_11 <= io_wb_data; // @[RegFile.scala 27:19]
      end
    end
    if (reset) begin // @[RegFile.scala 23:12]
      reg_12 <= 64'h0; // @[RegFile.scala 23:12]
    end else if (io_wb_rd != 5'h0) begin // @[RegFile.scala 26:26]
      if (5'hc == io_wb_rd) begin // @[RegFile.scala 27:19]
        reg_12 <= io_wb_data; // @[RegFile.scala 27:19]
      end
    end
    if (reset) begin // @[RegFile.scala 23:12]
      reg_13 <= 64'h0; // @[RegFile.scala 23:12]
    end else if (io_wb_rd != 5'h0) begin // @[RegFile.scala 26:26]
      if (5'hd == io_wb_rd) begin // @[RegFile.scala 27:19]
        reg_13 <= io_wb_data; // @[RegFile.scala 27:19]
      end
    end
    if (reset) begin // @[RegFile.scala 23:12]
      reg_14 <= 64'h0; // @[RegFile.scala 23:12]
    end else if (io_wb_rd != 5'h0) begin // @[RegFile.scala 26:26]
      if (5'he == io_wb_rd) begin // @[RegFile.scala 27:19]
        reg_14 <= io_wb_data; // @[RegFile.scala 27:19]
      end
    end
    if (reset) begin // @[RegFile.scala 23:12]
      reg_15 <= 64'h0; // @[RegFile.scala 23:12]
    end else if (io_wb_rd != 5'h0) begin // @[RegFile.scala 26:26]
      if (5'hf == io_wb_rd) begin // @[RegFile.scala 27:19]
        reg_15 <= io_wb_data; // @[RegFile.scala 27:19]
      end
    end
    if (reset) begin // @[RegFile.scala 23:12]
      reg_16 <= 64'h0; // @[RegFile.scala 23:12]
    end else if (io_wb_rd != 5'h0) begin // @[RegFile.scala 26:26]
      if (5'h10 == io_wb_rd) begin // @[RegFile.scala 27:19]
        reg_16 <= io_wb_data; // @[RegFile.scala 27:19]
      end
    end
    if (reset) begin // @[RegFile.scala 23:12]
      reg_17 <= 64'h0; // @[RegFile.scala 23:12]
    end else if (io_wb_rd != 5'h0) begin // @[RegFile.scala 26:26]
      if (5'h11 == io_wb_rd) begin // @[RegFile.scala 27:19]
        reg_17 <= io_wb_data; // @[RegFile.scala 27:19]
      end
    end
    if (reset) begin // @[RegFile.scala 23:12]
      reg_18 <= 64'h0; // @[RegFile.scala 23:12]
    end else if (io_wb_rd != 5'h0) begin // @[RegFile.scala 26:26]
      if (5'h12 == io_wb_rd) begin // @[RegFile.scala 27:19]
        reg_18 <= io_wb_data; // @[RegFile.scala 27:19]
      end
    end
    if (reset) begin // @[RegFile.scala 23:12]
      reg_19 <= 64'h0; // @[RegFile.scala 23:12]
    end else if (io_wb_rd != 5'h0) begin // @[RegFile.scala 26:26]
      if (5'h13 == io_wb_rd) begin // @[RegFile.scala 27:19]
        reg_19 <= io_wb_data; // @[RegFile.scala 27:19]
      end
    end
    if (reset) begin // @[RegFile.scala 23:12]
      reg_20 <= 64'h0; // @[RegFile.scala 23:12]
    end else if (io_wb_rd != 5'h0) begin // @[RegFile.scala 26:26]
      if (5'h14 == io_wb_rd) begin // @[RegFile.scala 27:19]
        reg_20 <= io_wb_data; // @[RegFile.scala 27:19]
      end
    end
    if (reset) begin // @[RegFile.scala 23:12]
      reg_21 <= 64'h0; // @[RegFile.scala 23:12]
    end else if (io_wb_rd != 5'h0) begin // @[RegFile.scala 26:26]
      if (5'h15 == io_wb_rd) begin // @[RegFile.scala 27:19]
        reg_21 <= io_wb_data; // @[RegFile.scala 27:19]
      end
    end
    if (reset) begin // @[RegFile.scala 23:12]
      reg_22 <= 64'h0; // @[RegFile.scala 23:12]
    end else if (io_wb_rd != 5'h0) begin // @[RegFile.scala 26:26]
      if (5'h16 == io_wb_rd) begin // @[RegFile.scala 27:19]
        reg_22 <= io_wb_data; // @[RegFile.scala 27:19]
      end
    end
    if (reset) begin // @[RegFile.scala 23:12]
      reg_23 <= 64'h0; // @[RegFile.scala 23:12]
    end else if (io_wb_rd != 5'h0) begin // @[RegFile.scala 26:26]
      if (5'h17 == io_wb_rd) begin // @[RegFile.scala 27:19]
        reg_23 <= io_wb_data; // @[RegFile.scala 27:19]
      end
    end
    if (reset) begin // @[RegFile.scala 23:12]
      reg_24 <= 64'h0; // @[RegFile.scala 23:12]
    end else if (io_wb_rd != 5'h0) begin // @[RegFile.scala 26:26]
      if (5'h18 == io_wb_rd) begin // @[RegFile.scala 27:19]
        reg_24 <= io_wb_data; // @[RegFile.scala 27:19]
      end
    end
    if (reset) begin // @[RegFile.scala 23:12]
      reg_25 <= 64'h0; // @[RegFile.scala 23:12]
    end else if (io_wb_rd != 5'h0) begin // @[RegFile.scala 26:26]
      if (5'h19 == io_wb_rd) begin // @[RegFile.scala 27:19]
        reg_25 <= io_wb_data; // @[RegFile.scala 27:19]
      end
    end
    if (reset) begin // @[RegFile.scala 23:12]
      reg_26 <= 64'h0; // @[RegFile.scala 23:12]
    end else if (io_wb_rd != 5'h0) begin // @[RegFile.scala 26:26]
      if (5'h1a == io_wb_rd) begin // @[RegFile.scala 27:19]
        reg_26 <= io_wb_data; // @[RegFile.scala 27:19]
      end
    end
    if (reset) begin // @[RegFile.scala 23:12]
      reg_27 <= 64'h0; // @[RegFile.scala 23:12]
    end else if (io_wb_rd != 5'h0) begin // @[RegFile.scala 26:26]
      if (5'h1b == io_wb_rd) begin // @[RegFile.scala 27:19]
        reg_27 <= io_wb_data; // @[RegFile.scala 27:19]
      end
    end
    if (reset) begin // @[RegFile.scala 23:12]
      reg_28 <= 64'h0; // @[RegFile.scala 23:12]
    end else if (io_wb_rd != 5'h0) begin // @[RegFile.scala 26:26]
      if (5'h1c == io_wb_rd) begin // @[RegFile.scala 27:19]
        reg_28 <= io_wb_data; // @[RegFile.scala 27:19]
      end
    end
    if (reset) begin // @[RegFile.scala 23:12]
      reg_29 <= 64'h0; // @[RegFile.scala 23:12]
    end else if (io_wb_rd != 5'h0) begin // @[RegFile.scala 26:26]
      if (5'h1d == io_wb_rd) begin // @[RegFile.scala 27:19]
        reg_29 <= io_wb_data; // @[RegFile.scala 27:19]
      end
    end
    if (reset) begin // @[RegFile.scala 23:12]
      reg_30 <= 64'h0; // @[RegFile.scala 23:12]
    end else if (io_wb_rd != 5'h0) begin // @[RegFile.scala 26:26]
      if (5'h1e == io_wb_rd) begin // @[RegFile.scala 27:19]
        reg_30 <= io_wb_data; // @[RegFile.scala 27:19]
      end
    end
    if (reset) begin // @[RegFile.scala 23:12]
      reg_31 <= 64'h0; // @[RegFile.scala 23:12]
    end else if (io_wb_rd != 5'h0) begin // @[RegFile.scala 26:26]
      if (5'h1f == io_wb_rd) begin // @[RegFile.scala 27:19]
        reg_31 <= io_wb_data; // @[RegFile.scala 27:19]
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
module ysyx_210285_IF(
  input         clock,
  input         reset,
  input         io_stall,
  input         io_flush,
  input         io_in_next_pc_valid,
  input  [63:0] io_in_next_pc_bits,
  input         io_axi_ar_ready,
  output        io_axi_ar_valid,
  output [31:0] io_axi_ar_bits_addr,
  output        io_axi_r_ready,
  input         io_axi_r_valid,
  input  [63:0] io_axi_r_bits_data,
  output        io_out_valid,
  output [63:0] io_out_pc,
  output [31:0] io_out_instr
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [63:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] cache; // @[IF.scala 29:18]
  reg [61:0] cacheIdx; // @[IF.scala 30:21]
  reg [63:0] next_pc_r; // @[Reg.scala 27:20]
  wire [63:0] _GEN_0 = io_in_next_pc_valid ? io_in_next_pc_bits : next_pc_r; // @[Reg.scala 28:19 Reg.scala 28:23 Reg.scala 27:20]
  wire [61:0] pcIdx = _GEN_0[63:2]; // @[IF.scala 37:22]
  wire  cacheMiss = cacheIdx != pcIdx; // @[IF.scala 38:28]
  reg [1:0] state; // @[IF.scala 40:22]
  reg [61:0] pcFetchIdx; // @[IF.scala 41:23]
  wire  _T = 2'h0 == state; // @[Conditional.scala 37:30]
  wire  _T_1 = 2'h1 == state; // @[Conditional.scala 37:30]
  wire  _io_out_valid_T_1 = ~io_stall; // @[IF.scala 77:14]
  reg  io_out_valid_r; // @[Reg.scala 27:20]
  wire  _GEN_26 = _io_out_valid_T_1 ? cacheMiss : io_out_valid_r; // @[Reg.scala 28:19 Reg.scala 28:23 Reg.scala 27:20]
  reg [63:0] io_out_pc_r; // @[Reg.scala 15:16]
  assign io_axi_ar_valid = _T & cacheMiss; // @[Conditional.scala 40:58 AXI4.scala 72:16]
  assign io_axi_ar_bits_addr = _GEN_0[31:0];
  assign io_axi_r_ready = _T ? 1'h0 : _T_1; // @[Conditional.scala 40:58 AXI4.scala 74:15]
  assign io_out_valid = ~io_flush & ~io_out_valid_r; // @[IF.scala 74:29]
  assign io_out_pc = io_out_pc_r; // @[IF.scala 79:13]
  assign io_out_instr = io_out_pc[2] ? cache[63:32] : cache[31:0]; // @[IF.scala 80:22]
  always @(posedge clock) begin
    if (!(_T)) begin // @[Conditional.scala 40:58]
      if (_T_1) begin // @[Conditional.scala 39:67]
        if (io_axi_r_valid) begin // @[IF.scala 61:28]
          cache <= io_axi_r_bits_data; // @[IF.scala 64:15]
        end
      end
    end
    if (!(_T)) begin // @[Conditional.scala 40:58]
      if (_T_1) begin // @[Conditional.scala 39:67]
        if (io_axi_r_valid) begin // @[IF.scala 61:28]
          cacheIdx <= pcFetchIdx; // @[IF.scala 63:18]
        end
      end
    end
    if (reset) begin // @[Reg.scala 27:20]
      next_pc_r <= 64'h30000000; // @[Reg.scala 27:20]
    end else if (io_in_next_pc_valid) begin // @[Reg.scala 28:19]
      next_pc_r <= io_in_next_pc_bits; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[IF.scala 40:22]
      state <= 2'h0; // @[IF.scala 40:22]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (cacheMiss) begin // @[IF.scala 45:23]
        if (io_axi_ar_ready) begin // @[IF.scala 54:31]
          state <= 2'h1; // @[IF.scala 55:17]
        end
      end
    end else if (_T_1) begin // @[Conditional.scala 39:67]
      if (io_axi_r_valid) begin // @[IF.scala 61:28]
        state <= 2'h0; // @[IF.scala 62:15]
      end
    end
    if (_T) begin // @[Conditional.scala 40:58]
      if (cacheMiss) begin // @[IF.scala 45:23]
        pcFetchIdx <= pcIdx; // @[IF.scala 53:20]
      end
    end
    io_out_valid_r <= reset | _GEN_26; // @[Reg.scala 27:20 Reg.scala 27:20]
    if (_io_out_valid_T_1) begin // @[Reg.scala 16:19]
      if (io_in_next_pc_valid) begin // @[Reg.scala 28:19]
        io_out_pc_r <= io_in_next_pc_bits; // @[Reg.scala 28:23]
      end else begin
        io_out_pc_r <= next_pc_r; // @[Reg.scala 27:20]
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
  cache = _RAND_0[63:0];
  _RAND_1 = {2{`RANDOM}};
  cacheIdx = _RAND_1[61:0];
  _RAND_2 = {2{`RANDOM}};
  next_pc_r = _RAND_2[63:0];
  _RAND_3 = {1{`RANDOM}};
  state = _RAND_3[1:0];
  _RAND_4 = {2{`RANDOM}};
  pcFetchIdx = _RAND_4[61:0];
  _RAND_5 = {1{`RANDOM}};
  io_out_valid_r = _RAND_5[0:0];
  _RAND_6 = {2{`RANDOM}};
  io_out_pc_r = _RAND_6[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210285_ID(
  input  [63:0] io_in_pc,
  input  [31:0] io_in_instr,
  output [4:0]  io_reg_io_raddr_0,
  output [4:0]  io_reg_io_raddr_1,
  input  [63:0] io_reg_io_rdata_0,
  input  [63:0] io_reg_io_rdata_1,
  output        io_out_has_error,
  output [63:0] io_out_predicted_pc,
  output [63:0] io_out_commit_pc,
  output        io_out_ex_is_op32,
  output        io_out_ex_is_jump,
  output        io_out_ex_is_branch,
  output        io_out_ex_is_csr,
  output        io_out_ex_is_trap,
  output [3:0]  io_out_ex_fn,
  output [4:0]  io_out_ex_rs1,
  output [4:0]  io_out_ex_rs2,
  output [63:0] io_out_ex_op1,
  output [63:0] io_out_ex_op2,
  output        io_out_ex_use_imm,
  output [63:0] io_out_ex_imm,
  output [1:0]  io_out_ex_csrfn,
  output        io_out_mem_en,
  output        io_out_mem_rw,
  output        io_out_mem_unsigned,
  output [2:0]  io_out_mem_wWidth,
  output [4:0]  io_out_wb_rd
);
  wire [2:0] decodeInfoList_funct3 = io_in_instr[14:12]; // @[ISA.scala 27:31]
  wire [6:0] decodeInfoList_funct7 = io_in_instr[31:25]; // @[ISA.scala 29:31]
  wire [4:0] decodeInfoList_rd = io_in_instr[11:7]; // @[ISA.scala 31:27]
  wire [4:0] decodeInfoList_rs1 = io_in_instr[19:15]; // @[ISA.scala 32:28]
  wire [4:0] decodeInfoList_rs2 = io_in_instr[24:20]; // @[ISA.scala 33:28]
  wire [11:0] decodeInfoList_I_imm_lo = io_in_instr[31:20]; // @[ISA.scala 35:38]
  wire [51:0] decodeInfoList_I_imm_hi = decodeInfoList_I_imm_lo[11] ? 52'hfffffffffffff : 52'h0; // @[Bitwise.scala 72:12]
  wire [11:0] decodeInfoList_S_imm_lo_1 = {decodeInfoList_funct7,decodeInfoList_rd}; // @[Cat.scala 30:58]
  wire [51:0] decodeInfoList_S_imm_hi_1 = decodeInfoList_S_imm_lo_1[11] ? 52'hfffffffffffff : 52'h0; // @[Bitwise.scala 72:12]
  wire  decodeInfoList_B_imm_hi_hi_hi = io_in_instr[31]; // @[ISA.scala 38:14]
  wire  decodeInfoList_B_imm_hi_hi_lo = io_in_instr[7]; // @[ISA.scala 38:25]
  wire [5:0] decodeInfoList_B_imm_hi_lo = io_in_instr[30:25]; // @[ISA.scala 38:35]
  wire [3:0] decodeInfoList_B_imm_lo_hi = io_in_instr[11:8]; // @[ISA.scala 38:50]
  wire [12:0] decodeInfoList_B_imm_lo_1 = {decodeInfoList_B_imm_hi_hi_hi,decodeInfoList_B_imm_hi_hi_lo,
    decodeInfoList_B_imm_hi_lo,decodeInfoList_B_imm_lo_hi,1'h0}; // @[Cat.scala 30:58]
  wire [50:0] decodeInfoList_B_imm_hi_1 = decodeInfoList_B_imm_lo_1[12] ? 51'h7ffffffffffff : 51'h0; // @[Bitwise.scala 72:12]
  wire [63:0] decodeInfoList_B_imm = {decodeInfoList_B_imm_hi_1,decodeInfoList_B_imm_hi_hi_hi,
    decodeInfoList_B_imm_hi_hi_lo,decodeInfoList_B_imm_hi_lo,decodeInfoList_B_imm_lo_hi,1'h0}; // @[Cat.scala 30:58]
  wire [19:0] decodeInfoList_U_imm_hi = io_in_instr[31:12]; // @[ISA.scala 41:42]
  wire [31:0] decodeInfoList_U_imm_lo = {decodeInfoList_U_imm_hi,12'h0}; // @[Cat.scala 30:58]
  wire [31:0] decodeInfoList_U_imm_hi_1 = decodeInfoList_U_imm_lo[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [7:0] decodeInfoList_J_imm_hi_hi_lo = io_in_instr[19:12]; // @[ISA.scala 43:25]
  wire  decodeInfoList_J_imm_hi_lo = io_in_instr[20]; // @[ISA.scala 43:40]
  wire [9:0] decodeInfoList_J_imm_lo_hi = io_in_instr[30:21]; // @[ISA.scala 43:51]
  wire [20:0] decodeInfoList_J_imm_lo_1 = {decodeInfoList_B_imm_hi_hi_hi,decodeInfoList_J_imm_hi_hi_lo,
    decodeInfoList_J_imm_hi_lo,decodeInfoList_J_imm_lo_hi,1'h0}; // @[Cat.scala 30:58]
  wire [42:0] decodeInfoList_J_imm_hi_1 = decodeInfoList_J_imm_lo_1[20] ? 43'h7ffffffffff : 43'h0; // @[Bitwise.scala 72:12]
  wire [379:0] decodeInfoList_lo = {4'h0,decodeInfoList_rs1,decodeInfoList_rs2,64'h0,131'h0,171'h0}; // @[ID.scala 53:72]
  wire [645:0] _decodeInfoList_T = {2'h2,1'h0,io_in_pc,io_in_instr,1'h0,33'h0,133'h0,decodeInfoList_lo}; // @[ID.scala 53:72]
  wire  decodeInfoList_bits_1_ex_is_op32 = io_in_instr[3]; // @[rv64i.scala 31:31]
  wire  decodeInfoList_bits_1_ex_use_imm = ~io_in_instr[5]; // @[rv64i.scala 32:26]
  wire [170:0] decodeInfoList_lo_lo_1 = {6'h0,96'h0,decodeInfoList_rd,64'h0}; // @[ID.scala 54:67]
  wire [208:0] decodeInfoList_lo_hi_1 = {1'h0,decodeInfoList_funct3,decodeInfoList_rs1,decodeInfoList_rs2,64'h0,64'h0,
    decodeInfoList_bits_1_ex_use_imm,decodeInfoList_I_imm_hi,decodeInfoList_I_imm_lo,2'h0}; // @[ID.scala 54:67]
  wire [265:0] decodeInfoList_hi_1 = {2'h0,1'h0,io_in_pc,io_in_instr,1'h0,33'h0,96'h0,32'h0,
    decodeInfoList_bits_1_ex_is_op32,4'h0}; // @[ID.scala 54:67]
  wire [645:0] _decodeInfoList_T_1 = {decodeInfoList_hi_1,decodeInfoList_lo_hi_1,6'h0,96'h0,decodeInfoList_rd,64'h0}; // @[ID.scala 54:67]
  wire [208:0] decodeInfoList_lo_hi_2 = {io_in_instr[30],decodeInfoList_funct3,decodeInfoList_rs1,decodeInfoList_rs2,64'h0
    ,64'h0,decodeInfoList_bits_1_ex_use_imm,decodeInfoList_I_imm_hi,decodeInfoList_I_imm_lo,2'h0}; // @[ID.scala 54:67]
  wire [645:0] _decodeInfoList_T_2 = {decodeInfoList_hi_1,decodeInfoList_lo_hi_2,6'h0,96'h0,decodeInfoList_rd,64'h0}; // @[ID.scala 54:67]
  wire [379:0] decodeInfoList_lo_20 = {9'h0,decodeInfoList_rs2,64'h0,65'h1,decodeInfoList_U_imm_hi_1,
    decodeInfoList_U_imm_hi,12'h0,2'h0,decodeInfoList_lo_lo_1}; // @[ID.scala 54:67]
  wire [645:0] _decodeInfoList_T_20 = {2'h1,1'h0,io_in_pc,io_in_instr,1'h0,33'h0,133'h0,decodeInfoList_lo_20}; // @[ID.scala 54:67]
  wire [379:0] decodeInfoList_lo_21 = {9'h0,decodeInfoList_rs2,io_in_pc,65'h1,decodeInfoList_U_imm_hi_1,
    decodeInfoList_U_imm_hi,12'h0,2'h0,decodeInfoList_lo_lo_1}; // @[ID.scala 54:67]
  wire [645:0] _decodeInfoList_T_21 = {2'h1,1'h0,io_in_pc,io_in_instr,1'h0,33'h0,133'h0,decodeInfoList_lo_21}; // @[ID.scala 54:67]
  wire  decodeInfoList_bits_22_mem_unsigned = decodeInfoList_funct3[2]; // @[rv64i.scala 133:36]
  wire [2:0] decodeInfoList_bits_22_mem_wWidth = {{1'd0}, decodeInfoList_funct3[1:0]}; // @[ISA.scala 21:18 rv64i.scala 134:25]
  wire [170:0] decodeInfoList_lo_lo_22 = {2'h2,decodeInfoList_bits_22_mem_unsigned,decodeInfoList_bits_22_mem_wWidth,96'h0
    ,decodeInfoList_rd,64'h0}; // @[ID.scala 54:67]
  wire [379:0] decodeInfoList_lo_22 = {4'h0,decodeInfoList_rs1,decodeInfoList_rs2,64'h0,65'h1,decodeInfoList_I_imm_hi,
    decodeInfoList_I_imm_lo,2'h0,decodeInfoList_lo_lo_22}; // @[ID.scala 54:67]
  wire [645:0] _decodeInfoList_T_22 = {2'h0,1'h0,io_in_pc,io_in_instr,1'h0,33'h0,133'h0,decodeInfoList_lo_22}; // @[ID.scala 54:67]
  wire [170:0] decodeInfoList_lo_lo_29 = {2'h3,1'h0,decodeInfoList_bits_22_mem_wWidth,165'h0}; // @[ID.scala 54:67]
  wire [379:0] decodeInfoList_lo_29 = {4'h0,decodeInfoList_rs1,decodeInfoList_rs2,64'h0,65'h1,decodeInfoList_S_imm_hi_1,
    decodeInfoList_funct7,decodeInfoList_rd,2'h0,decodeInfoList_lo_lo_29}; // @[ID.scala 54:67]
  wire [645:0] _decodeInfoList_T_29 = {2'h0,1'h0,io_in_pc,io_in_instr,1'h0,33'h0,133'h0,decodeInfoList_lo_29}; // @[ID.scala 54:67]
  wire [63:0] decodeInfoList_bits_33_ex_imm = io_in_pc + 64'h4; // @[rv64i.scala 191:27]
  wire [130:0] decodeInfoList_lo_hi_lo_33 = {decodeInfoList_J_imm_hi_1,decodeInfoList_B_imm_hi_hi_hi,
    decodeInfoList_J_imm_hi_hi_lo,decodeInfoList_J_imm_hi_lo,decodeInfoList_J_imm_lo_hi,1'h0,1'h0,
    decodeInfoList_bits_33_ex_imm,2'h0}; // @[ID.scala 54:67]
  wire [379:0] decodeInfoList_lo_33 = {9'h0,5'h0,io_in_pc,decodeInfoList_lo_hi_lo_33,6'h0,96'h0,decodeInfoList_rd,64'h0}
    ; // @[ID.scala 54:67]
  wire [645:0] _decodeInfoList_T_33 = {2'h1,1'h1,io_in_pc,io_in_instr,1'h0,33'h0,133'h8,decodeInfoList_lo_33}; // @[ID.scala 54:67]
  wire [379:0] decodeInfoList_lo_34 = {4'h0,decodeInfoList_rs1,69'h0,decodeInfoList_I_imm_hi,decodeInfoList_I_imm_lo,1'h0
    ,decodeInfoList_bits_33_ex_imm,2'h0,decodeInfoList_lo_lo_1}; // @[ID.scala 54:67]
  wire [645:0] _decodeInfoList_T_34 = {2'h0,1'h1,io_in_pc,io_in_instr,1'h0,33'h0,133'h8,decodeInfoList_lo_34}; // @[ID.scala 54:67]
  wire [63:0] decodeInfoList_bits_35_ex_imm = io_in_pc + decodeInfoList_B_imm; // @[rv64i.scala 227:27]
  wire [379:0] decodeInfoList_lo_35 = {4'he,decodeInfoList_rs1,decodeInfoList_rs2,64'h0,65'h0,
    decodeInfoList_bits_35_ex_imm,2'h0,171'h0}; // @[ID.scala 54:67]
  wire [645:0] _decodeInfoList_T_35 = {2'h0,1'h0,io_in_pc,io_in_instr,1'h0,33'h0,133'h4,decodeInfoList_lo_35}; // @[ID.scala 54:67]
  wire [379:0] decodeInfoList_lo_36 = {4'hf,decodeInfoList_rs1,decodeInfoList_rs2,64'h0,65'h0,
    decodeInfoList_bits_35_ex_imm,2'h0,171'h0}; // @[ID.scala 54:67]
  wire [645:0] _decodeInfoList_T_36 = {2'h0,1'h0,io_in_pc,io_in_instr,1'h0,33'h0,133'h4,decodeInfoList_lo_36}; // @[ID.scala 54:67]
  wire [379:0] decodeInfoList_lo_37 = {4'h2,decodeInfoList_rs1,decodeInfoList_rs2,64'h0,65'h0,
    decodeInfoList_bits_35_ex_imm,2'h0,171'h0}; // @[ID.scala 54:67]
  wire [645:0] _decodeInfoList_T_37 = {2'h0,1'h0,io_in_pc,io_in_instr,1'h0,33'h0,133'h4,decodeInfoList_lo_37}; // @[ID.scala 54:67]
  wire [379:0] decodeInfoList_lo_38 = {4'ha,decodeInfoList_rs1,decodeInfoList_rs2,64'h0,65'h0,
    decodeInfoList_bits_35_ex_imm,2'h0,171'h0}; // @[ID.scala 54:67]
  wire [645:0] _decodeInfoList_T_38 = {2'h0,1'h0,io_in_pc,io_in_instr,1'h0,33'h0,133'h4,decodeInfoList_lo_38}; // @[ID.scala 54:67]
  wire [379:0] decodeInfoList_lo_39 = {4'h3,decodeInfoList_rs1,decodeInfoList_rs2,64'h0,65'h0,
    decodeInfoList_bits_35_ex_imm,2'h0,171'h0}; // @[ID.scala 54:67]
  wire [645:0] _decodeInfoList_T_39 = {2'h0,1'h0,io_in_pc,io_in_instr,1'h0,33'h0,133'h4,decodeInfoList_lo_39}; // @[ID.scala 54:67]
  wire [379:0] decodeInfoList_lo_40 = {4'hb,decodeInfoList_rs1,decodeInfoList_rs2,64'h0,65'h0,
    decodeInfoList_bits_35_ex_imm,2'h0,171'h0}; // @[ID.scala 54:67]
  wire [645:0] _decodeInfoList_T_40 = {2'h0,1'h0,io_in_pc,io_in_instr,1'h0,33'h0,133'h4,decodeInfoList_lo_40}; // @[ID.scala 54:67]
  wire  decodeInfoList_bits_50_ex_use_imm = io_in_instr[14]; // @[rv64i.scala 299:33]
  wire [379:0] decodeInfoList_lo_50 = {4'h0,decodeInfoList_rs1,decodeInfoList_rs2,64'h0,64'h0,
    decodeInfoList_bits_50_ex_use_imm,decodeInfoList_I_imm_hi,decodeInfoList_I_imm_lo,decodeInfoList_funct3[1:0],
    decodeInfoList_lo_lo_1}; // @[ID.scala 54:67]
  wire [645:0] _decodeInfoList_T_50 = {2'h0,1'h0,io_in_pc,io_in_instr,1'h0,33'h0,133'h2,decodeInfoList_lo_50}; // @[ID.scala 54:67]
  wire [645:0] _decodeInfoList_T_56 = {2'h0,1'h0,io_in_pc,io_in_instr,1'h0,33'h0,133'h0,decodeInfoList_lo}; // @[ID.scala 54:67]
  wire [645:0] _decodeInfoList_T_57 = {2'h0,1'h0,io_in_pc,io_in_instr,1'h1,33'h0,133'h0,decodeInfoList_lo}; // @[ID.scala 54:67]
  wire [645:0] _decodeInfoList_T_58 = {2'h0,1'h0,io_in_pc,io_in_instr,1'h0,33'h0,133'h1,decodeInfoList_lo}; // @[ID.scala 54:67]
  wire [31:0] _decodeInfoList_T_60 = io_in_instr & 32'h707f; // @[Lookup.scala 31:38]
  wire  _decodeInfoList_T_61 = 32'h13 == _decodeInfoList_T_60; // @[Lookup.scala 31:38]
  wire [31:0] _decodeInfoList_T_62 = io_in_instr & 32'hfc00707f; // @[Lookup.scala 31:38]
  wire  _decodeInfoList_T_63 = 32'h1013 == _decodeInfoList_T_62; // @[Lookup.scala 31:38]
  wire  _decodeInfoList_T_65 = 32'h2013 == _decodeInfoList_T_60; // @[Lookup.scala 31:38]
  wire  _decodeInfoList_T_67 = 32'h3013 == _decodeInfoList_T_60; // @[Lookup.scala 31:38]
  wire  _decodeInfoList_T_69 = 32'h4013 == _decodeInfoList_T_60; // @[Lookup.scala 31:38]
  wire  _decodeInfoList_T_71 = 32'h5013 == _decodeInfoList_T_62; // @[Lookup.scala 31:38]
  wire  _decodeInfoList_T_73 = 32'h40005013 == _decodeInfoList_T_62; // @[Lookup.scala 31:38]
  wire  _decodeInfoList_T_75 = 32'h6013 == _decodeInfoList_T_60; // @[Lookup.scala 31:38]
  wire  _decodeInfoList_T_77 = 32'h7013 == _decodeInfoList_T_60; // @[Lookup.scala 31:38]
  wire [31:0] _decodeInfoList_T_78 = io_in_instr & 32'hfe00707f; // @[Lookup.scala 31:38]
  wire  _decodeInfoList_T_79 = 32'h33 == _decodeInfoList_T_78; // @[Lookup.scala 31:38]
  wire  _decodeInfoList_T_81 = 32'h40000033 == _decodeInfoList_T_78; // @[Lookup.scala 31:38]
  wire  _decodeInfoList_T_83 = 32'h1033 == _decodeInfoList_T_78; // @[Lookup.scala 31:38]
  wire  _decodeInfoList_T_85 = 32'h2033 == _decodeInfoList_T_78; // @[Lookup.scala 31:38]
  wire  _decodeInfoList_T_87 = 32'h3033 == _decodeInfoList_T_78; // @[Lookup.scala 31:38]
  wire  _decodeInfoList_T_89 = 32'h4033 == _decodeInfoList_T_78; // @[Lookup.scala 31:38]
  wire  _decodeInfoList_T_91 = 32'h5033 == _decodeInfoList_T_78; // @[Lookup.scala 31:38]
  wire  _decodeInfoList_T_93 = 32'h40005033 == _decodeInfoList_T_78; // @[Lookup.scala 31:38]
  wire  _decodeInfoList_T_95 = 32'h6033 == _decodeInfoList_T_78; // @[Lookup.scala 31:38]
  wire  _decodeInfoList_T_97 = 32'h7033 == _decodeInfoList_T_78; // @[Lookup.scala 31:38]
  wire [31:0] _decodeInfoList_T_98 = io_in_instr & 32'h7f; // @[Lookup.scala 31:38]
  wire  _decodeInfoList_T_99 = 32'h37 == _decodeInfoList_T_98; // @[Lookup.scala 31:38]
  wire  _decodeInfoList_T_101 = 32'h17 == _decodeInfoList_T_98; // @[Lookup.scala 31:38]
  wire  _decodeInfoList_T_103 = 32'h3 == _decodeInfoList_T_60; // @[Lookup.scala 31:38]
  wire  _decodeInfoList_T_105 = 32'h1003 == _decodeInfoList_T_60; // @[Lookup.scala 31:38]
  wire  _decodeInfoList_T_107 = 32'h2003 == _decodeInfoList_T_60; // @[Lookup.scala 31:38]
  wire  _decodeInfoList_T_109 = 32'h3003 == _decodeInfoList_T_60; // @[Lookup.scala 31:38]
  wire  _decodeInfoList_T_111 = 32'h4003 == _decodeInfoList_T_60; // @[Lookup.scala 31:38]
  wire  _decodeInfoList_T_113 = 32'h5003 == _decodeInfoList_T_60; // @[Lookup.scala 31:38]
  wire  _decodeInfoList_T_115 = 32'h6003 == _decodeInfoList_T_60; // @[Lookup.scala 31:38]
  wire  _decodeInfoList_T_117 = 32'h23 == _decodeInfoList_T_60; // @[Lookup.scala 31:38]
  wire  _decodeInfoList_T_119 = 32'h1023 == _decodeInfoList_T_60; // @[Lookup.scala 31:38]
  wire  _decodeInfoList_T_121 = 32'h2023 == _decodeInfoList_T_60; // @[Lookup.scala 31:38]
  wire  _decodeInfoList_T_123 = 32'h3023 == _decodeInfoList_T_60; // @[Lookup.scala 31:38]
  wire  _decodeInfoList_T_125 = 32'h6f == _decodeInfoList_T_98; // @[Lookup.scala 31:38]
  wire  _decodeInfoList_T_127 = 32'h67 == _decodeInfoList_T_60; // @[Lookup.scala 31:38]
  wire  _decodeInfoList_T_129 = 32'h63 == _decodeInfoList_T_60; // @[Lookup.scala 31:38]
  wire  _decodeInfoList_T_131 = 32'h1063 == _decodeInfoList_T_60; // @[Lookup.scala 31:38]
  wire  _decodeInfoList_T_133 = 32'h4063 == _decodeInfoList_T_60; // @[Lookup.scala 31:38]
  wire  _decodeInfoList_T_135 = 32'h5063 == _decodeInfoList_T_60; // @[Lookup.scala 31:38]
  wire  _decodeInfoList_T_137 = 32'h6063 == _decodeInfoList_T_60; // @[Lookup.scala 31:38]
  wire  _decodeInfoList_T_139 = 32'h7063 == _decodeInfoList_T_60; // @[Lookup.scala 31:38]
  wire  _decodeInfoList_T_141 = 32'h1b == _decodeInfoList_T_60; // @[Lookup.scala 31:38]
  wire  _decodeInfoList_T_143 = 32'h101b == _decodeInfoList_T_62; // @[Lookup.scala 31:38]
  wire  _decodeInfoList_T_145 = 32'h501b == _decodeInfoList_T_62; // @[Lookup.scala 31:38]
  wire  _decodeInfoList_T_147 = 32'h4000501b == _decodeInfoList_T_62; // @[Lookup.scala 31:38]
  wire  _decodeInfoList_T_149 = 32'h3b == _decodeInfoList_T_78; // @[Lookup.scala 31:38]
  wire  _decodeInfoList_T_151 = 32'h4000003b == _decodeInfoList_T_78; // @[Lookup.scala 31:38]
  wire  _decodeInfoList_T_153 = 32'h103b == _decodeInfoList_T_78; // @[Lookup.scala 31:38]
  wire  _decodeInfoList_T_155 = 32'h503b == _decodeInfoList_T_78; // @[Lookup.scala 31:38]
  wire  _decodeInfoList_T_157 = 32'h4000503b == _decodeInfoList_T_78; // @[Lookup.scala 31:38]
  wire  _decodeInfoList_T_159 = 32'h1073 == _decodeInfoList_T_60; // @[Lookup.scala 31:38]
  wire  _decodeInfoList_T_161 = 32'h2073 == _decodeInfoList_T_60; // @[Lookup.scala 31:38]
  wire  _decodeInfoList_T_163 = 32'h3073 == _decodeInfoList_T_60; // @[Lookup.scala 31:38]
  wire  _decodeInfoList_T_165 = 32'h5073 == _decodeInfoList_T_60; // @[Lookup.scala 31:38]
  wire  _decodeInfoList_T_167 = 32'h6073 == _decodeInfoList_T_60; // @[Lookup.scala 31:38]
  wire  _decodeInfoList_T_169 = 32'h7073 == _decodeInfoList_T_60; // @[Lookup.scala 31:38]
  wire  _decodeInfoList_T_171 = 32'h6b == _decodeInfoList_T_98; // @[Lookup.scala 31:38]
  wire  _decodeInfoList_T_173 = 32'h7b == _decodeInfoList_T_98; // @[Lookup.scala 31:38]
  wire  _decodeInfoList_T_175 = 32'h73 == io_in_instr; // @[Lookup.scala 31:38]
  wire  _decodeInfoList_T_177 = 32'h30200073 == io_in_instr; // @[Lookup.scala 31:38]
  wire [645:0] _decodeInfoList_T_178 = _decodeInfoList_T_177 ? _decodeInfoList_T_58 : _decodeInfoList_T; // @[Lookup.scala 33:37]
  wire [645:0] _decodeInfoList_T_179 = _decodeInfoList_T_175 ? _decodeInfoList_T_58 : _decodeInfoList_T_178; // @[Lookup.scala 33:37]
  wire [645:0] _decodeInfoList_T_180 = _decodeInfoList_T_173 ? _decodeInfoList_T_57 : _decodeInfoList_T_179; // @[Lookup.scala 33:37]
  wire [645:0] _decodeInfoList_T_181 = _decodeInfoList_T_171 ? _decodeInfoList_T_56 : _decodeInfoList_T_180; // @[Lookup.scala 33:37]
  wire [645:0] _decodeInfoList_T_182 = _decodeInfoList_T_169 ? _decodeInfoList_T_50 : _decodeInfoList_T_181; // @[Lookup.scala 33:37]
  wire [645:0] _decodeInfoList_T_183 = _decodeInfoList_T_167 ? _decodeInfoList_T_50 : _decodeInfoList_T_182; // @[Lookup.scala 33:37]
  wire [645:0] _decodeInfoList_T_184 = _decodeInfoList_T_165 ? _decodeInfoList_T_50 : _decodeInfoList_T_183; // @[Lookup.scala 33:37]
  wire [645:0] _decodeInfoList_T_185 = _decodeInfoList_T_163 ? _decodeInfoList_T_50 : _decodeInfoList_T_184; // @[Lookup.scala 33:37]
  wire [645:0] _decodeInfoList_T_186 = _decodeInfoList_T_161 ? _decodeInfoList_T_50 : _decodeInfoList_T_185; // @[Lookup.scala 33:37]
  wire [645:0] _decodeInfoList_T_187 = _decodeInfoList_T_159 ? _decodeInfoList_T_50 : _decodeInfoList_T_186; // @[Lookup.scala 33:37]
  wire [645:0] _decodeInfoList_T_188 = _decodeInfoList_T_157 ? _decodeInfoList_T_2 : _decodeInfoList_T_187; // @[Lookup.scala 33:37]
  wire [645:0] _decodeInfoList_T_189 = _decodeInfoList_T_155 ? _decodeInfoList_T_2 : _decodeInfoList_T_188; // @[Lookup.scala 33:37]
  wire [645:0] _decodeInfoList_T_190 = _decodeInfoList_T_153 ? _decodeInfoList_T_2 : _decodeInfoList_T_189; // @[Lookup.scala 33:37]
  wire [645:0] _decodeInfoList_T_191 = _decodeInfoList_T_151 ? _decodeInfoList_T_2 : _decodeInfoList_T_190; // @[Lookup.scala 33:37]
  wire [645:0] _decodeInfoList_T_192 = _decodeInfoList_T_149 ? _decodeInfoList_T_2 : _decodeInfoList_T_191; // @[Lookup.scala 33:37]
  wire [645:0] _decodeInfoList_T_193 = _decodeInfoList_T_147 ? _decodeInfoList_T_2 : _decodeInfoList_T_192; // @[Lookup.scala 33:37]
  wire [645:0] _decodeInfoList_T_194 = _decodeInfoList_T_145 ? _decodeInfoList_T_2 : _decodeInfoList_T_193; // @[Lookup.scala 33:37]
  wire [645:0] _decodeInfoList_T_195 = _decodeInfoList_T_143 ? _decodeInfoList_T_2 : _decodeInfoList_T_194; // @[Lookup.scala 33:37]
  wire [645:0] _decodeInfoList_T_196 = _decodeInfoList_T_141 ? _decodeInfoList_T_1 : _decodeInfoList_T_195; // @[Lookup.scala 33:37]
  wire [645:0] _decodeInfoList_T_197 = _decodeInfoList_T_139 ? _decodeInfoList_T_40 : _decodeInfoList_T_196; // @[Lookup.scala 33:37]
  wire [645:0] _decodeInfoList_T_198 = _decodeInfoList_T_137 ? _decodeInfoList_T_39 : _decodeInfoList_T_197; // @[Lookup.scala 33:37]
  wire [645:0] _decodeInfoList_T_199 = _decodeInfoList_T_135 ? _decodeInfoList_T_38 : _decodeInfoList_T_198; // @[Lookup.scala 33:37]
  wire [645:0] _decodeInfoList_T_200 = _decodeInfoList_T_133 ? _decodeInfoList_T_37 : _decodeInfoList_T_199; // @[Lookup.scala 33:37]
  wire [645:0] _decodeInfoList_T_201 = _decodeInfoList_T_131 ? _decodeInfoList_T_36 : _decodeInfoList_T_200; // @[Lookup.scala 33:37]
  wire [645:0] _decodeInfoList_T_202 = _decodeInfoList_T_129 ? _decodeInfoList_T_35 : _decodeInfoList_T_201; // @[Lookup.scala 33:37]
  wire [645:0] _decodeInfoList_T_203 = _decodeInfoList_T_127 ? _decodeInfoList_T_34 : _decodeInfoList_T_202; // @[Lookup.scala 33:37]
  wire [645:0] _decodeInfoList_T_204 = _decodeInfoList_T_125 ? _decodeInfoList_T_33 : _decodeInfoList_T_203; // @[Lookup.scala 33:37]
  wire [645:0] _decodeInfoList_T_205 = _decodeInfoList_T_123 ? _decodeInfoList_T_29 : _decodeInfoList_T_204; // @[Lookup.scala 33:37]
  wire [645:0] _decodeInfoList_T_206 = _decodeInfoList_T_121 ? _decodeInfoList_T_29 : _decodeInfoList_T_205; // @[Lookup.scala 33:37]
  wire [645:0] _decodeInfoList_T_207 = _decodeInfoList_T_119 ? _decodeInfoList_T_29 : _decodeInfoList_T_206; // @[Lookup.scala 33:37]
  wire [645:0] _decodeInfoList_T_208 = _decodeInfoList_T_117 ? _decodeInfoList_T_29 : _decodeInfoList_T_207; // @[Lookup.scala 33:37]
  wire [645:0] _decodeInfoList_T_209 = _decodeInfoList_T_115 ? _decodeInfoList_T_22 : _decodeInfoList_T_208; // @[Lookup.scala 33:37]
  wire [645:0] _decodeInfoList_T_210 = _decodeInfoList_T_113 ? _decodeInfoList_T_22 : _decodeInfoList_T_209; // @[Lookup.scala 33:37]
  wire [645:0] _decodeInfoList_T_211 = _decodeInfoList_T_111 ? _decodeInfoList_T_22 : _decodeInfoList_T_210; // @[Lookup.scala 33:37]
  wire [645:0] _decodeInfoList_T_212 = _decodeInfoList_T_109 ? _decodeInfoList_T_22 : _decodeInfoList_T_211; // @[Lookup.scala 33:37]
  wire [645:0] _decodeInfoList_T_213 = _decodeInfoList_T_107 ? _decodeInfoList_T_22 : _decodeInfoList_T_212; // @[Lookup.scala 33:37]
  wire [645:0] _decodeInfoList_T_214 = _decodeInfoList_T_105 ? _decodeInfoList_T_22 : _decodeInfoList_T_213; // @[Lookup.scala 33:37]
  wire [645:0] _decodeInfoList_T_215 = _decodeInfoList_T_103 ? _decodeInfoList_T_22 : _decodeInfoList_T_214; // @[Lookup.scala 33:37]
  wire [645:0] _decodeInfoList_T_216 = _decodeInfoList_T_101 ? _decodeInfoList_T_21 : _decodeInfoList_T_215; // @[Lookup.scala 33:37]
  wire [645:0] _decodeInfoList_T_217 = _decodeInfoList_T_99 ? _decodeInfoList_T_20 : _decodeInfoList_T_216; // @[Lookup.scala 33:37]
  wire [645:0] _decodeInfoList_T_218 = _decodeInfoList_T_97 ? _decodeInfoList_T_2 : _decodeInfoList_T_217; // @[Lookup.scala 33:37]
  wire [645:0] _decodeInfoList_T_219 = _decodeInfoList_T_95 ? _decodeInfoList_T_2 : _decodeInfoList_T_218; // @[Lookup.scala 33:37]
  wire [645:0] _decodeInfoList_T_220 = _decodeInfoList_T_93 ? _decodeInfoList_T_2 : _decodeInfoList_T_219; // @[Lookup.scala 33:37]
  wire [645:0] _decodeInfoList_T_221 = _decodeInfoList_T_91 ? _decodeInfoList_T_2 : _decodeInfoList_T_220; // @[Lookup.scala 33:37]
  wire [645:0] _decodeInfoList_T_222 = _decodeInfoList_T_89 ? _decodeInfoList_T_2 : _decodeInfoList_T_221; // @[Lookup.scala 33:37]
  wire [645:0] _decodeInfoList_T_223 = _decodeInfoList_T_87 ? _decodeInfoList_T_2 : _decodeInfoList_T_222; // @[Lookup.scala 33:37]
  wire [645:0] _decodeInfoList_T_224 = _decodeInfoList_T_85 ? _decodeInfoList_T_2 : _decodeInfoList_T_223; // @[Lookup.scala 33:37]
  wire [645:0] _decodeInfoList_T_225 = _decodeInfoList_T_83 ? _decodeInfoList_T_2 : _decodeInfoList_T_224; // @[Lookup.scala 33:37]
  wire [645:0] _decodeInfoList_T_226 = _decodeInfoList_T_81 ? _decodeInfoList_T_2 : _decodeInfoList_T_225; // @[Lookup.scala 33:37]
  wire [645:0] _decodeInfoList_T_227 = _decodeInfoList_T_79 ? _decodeInfoList_T_2 : _decodeInfoList_T_226; // @[Lookup.scala 33:37]
  wire [645:0] _decodeInfoList_T_228 = _decodeInfoList_T_77 ? _decodeInfoList_T_1 : _decodeInfoList_T_227; // @[Lookup.scala 33:37]
  wire [645:0] _decodeInfoList_T_229 = _decodeInfoList_T_75 ? _decodeInfoList_T_1 : _decodeInfoList_T_228; // @[Lookup.scala 33:37]
  wire [645:0] _decodeInfoList_T_230 = _decodeInfoList_T_73 ? _decodeInfoList_T_2 : _decodeInfoList_T_229; // @[Lookup.scala 33:37]
  wire [645:0] _decodeInfoList_T_231 = _decodeInfoList_T_71 ? _decodeInfoList_T_2 : _decodeInfoList_T_230; // @[Lookup.scala 33:37]
  wire [645:0] _decodeInfoList_T_232 = _decodeInfoList_T_69 ? _decodeInfoList_T_1 : _decodeInfoList_T_231; // @[Lookup.scala 33:37]
  wire [645:0] _decodeInfoList_T_233 = _decodeInfoList_T_67 ? _decodeInfoList_T_1 : _decodeInfoList_T_232; // @[Lookup.scala 33:37]
  wire [645:0] _decodeInfoList_T_234 = _decodeInfoList_T_65 ? _decodeInfoList_T_1 : _decodeInfoList_T_233; // @[Lookup.scala 33:37]
  wire [645:0] _decodeInfoList_T_235 = _decodeInfoList_T_63 ? _decodeInfoList_T_2 : _decodeInfoList_T_234; // @[Lookup.scala 33:37]
  wire [645:0] decodeInfoList = _decodeInfoList_T_61 ? _decodeInfoList_T_1 : _decodeInfoList_T_235; // @[Lookup.scala 33:37]
  wire [63:0] decodeInfo_ex_op2 = decodeInfoList[301:238]; // @[ID.scala 56:43]
  wire [63:0] decodeInfo_ex_op1 = decodeInfoList[365:302]; // @[ID.scala 56:43]
  wire  decodeInfo_use_op2 = decodeInfoList[643]; // @[ID.scala 56:43]
  wire  decodeInfo_use_op1 = decodeInfoList[644]; // @[ID.scala 56:43]
  assign io_reg_io_raddr_0 = decodeInfoList[375:371]; // @[ID.scala 56:43]
  assign io_reg_io_raddr_1 = decodeInfoList[370:366]; // @[ID.scala 56:43]
  assign io_out_has_error = decodeInfoList[645]; // @[ID.scala 56:43]
  assign io_out_predicted_pc = io_in_pc + 64'h4; // @[ID.scala 64:29]
  assign io_out_commit_pc = decodeInfoList[642:579]; // @[ID.scala 56:43]
  assign io_out_ex_is_op32 = decodeInfoList[384]; // @[ID.scala 56:43]
  assign io_out_ex_is_jump = decodeInfoList[383]; // @[ID.scala 56:43]
  assign io_out_ex_is_branch = decodeInfoList[382]; // @[ID.scala 56:43]
  assign io_out_ex_is_csr = decodeInfoList[381]; // @[ID.scala 56:43]
  assign io_out_ex_is_trap = decodeInfoList[380]; // @[ID.scala 56:43]
  assign io_out_ex_fn = decodeInfoList[379:376]; // @[ID.scala 56:43]
  assign io_out_ex_rs1 = decodeInfoList[375:371]; // @[ID.scala 56:43]
  assign io_out_ex_rs2 = decodeInfoList[370:366]; // @[ID.scala 56:43]
  assign io_out_ex_op1 = ~decodeInfo_use_op1 ? io_reg_io_rdata_0 : decodeInfo_ex_op1; // @[ID.scala 70:30 ID.scala 71:19 ID.scala 66:13]
  assign io_out_ex_op2 = ~decodeInfo_use_op2 ? io_reg_io_rdata_1 : decodeInfo_ex_op2; // @[ID.scala 73:30 ID.scala 74:19 ID.scala 66:13]
  assign io_out_ex_use_imm = decodeInfoList[237]; // @[ID.scala 56:43]
  assign io_out_ex_imm = decodeInfoList[236:173]; // @[ID.scala 56:43]
  assign io_out_ex_csrfn = decodeInfoList[172:171]; // @[ID.scala 56:43]
  assign io_out_mem_en = decodeInfoList[170]; // @[ID.scala 56:43]
  assign io_out_mem_rw = decodeInfoList[169]; // @[ID.scala 56:43]
  assign io_out_mem_unsigned = decodeInfoList[168]; // @[ID.scala 56:43]
  assign io_out_mem_wWidth = decodeInfoList[167:165]; // @[ID.scala 56:43]
  assign io_out_wb_rd = decodeInfoList[68:64]; // @[ID.scala 56:43]
endmodule
module ysyx_210285_ID_EX(
  input         clock,
  input         reset,
  input         io_stall,
  input         io_in_valid,
  input  [63:0] io_in_predicted_pc,
  input  [63:0] io_in_commit_pc,
  input         io_in_ex_is_op32,
  input         io_in_ex_is_jump,
  input         io_in_ex_is_branch,
  input         io_in_ex_is_csr,
  input         io_in_ex_is_trap,
  input  [3:0]  io_in_ex_fn,
  input  [4:0]  io_in_ex_rs1,
  input  [4:0]  io_in_ex_rs2,
  input  [63:0] io_in_ex_op1,
  input  [63:0] io_in_ex_op2,
  input         io_in_ex_use_imm,
  input  [63:0] io_in_ex_imm,
  input  [1:0]  io_in_ex_csrfn,
  input         io_in_mem_en,
  input         io_in_mem_rw,
  input         io_in_mem_unsigned,
  input  [2:0]  io_in_mem_wWidth,
  input  [4:0]  io_in_wb_rd,
  output        io_out_valid,
  output [63:0] io_out_predicted_pc,
  output [63:0] io_out_commit_pc,
  output        io_out_ex_is_op32,
  output        io_out_ex_is_jump,
  output        io_out_ex_is_branch,
  output        io_out_ex_is_csr,
  output        io_out_ex_is_trap,
  output [3:0]  io_out_ex_fn,
  output [4:0]  io_out_ex_rs1,
  output [4:0]  io_out_ex_rs2,
  output [63:0] io_out_ex_op1,
  output [63:0] io_out_ex_op2,
  output        io_out_ex_use_imm,
  output [63:0] io_out_ex_imm,
  output [1:0]  io_out_ex_csrfn,
  output        io_out_mem_en,
  output        io_out_mem_rw,
  output        io_out_mem_unsigned,
  output [2:0]  io_out_mem_wWidth,
  output [4:0]  io_out_wb_rd
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [63:0] _RAND_11;
  reg [63:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [63:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
`endif // RANDOMIZE_REG_INIT
  wire  _io_out_valid_T = ~io_stall; // @[ID_EX.scala 30:51]
  reg  io_out_valid_r; // @[Reg.scala 27:20]
  reg [63:0] io_out_predicted_pc_r; // @[Reg.scala 15:16]
  reg [63:0] io_out_commit_r_pc; // @[Reg.scala 15:16]
  reg  io_out_ex_r_is_op32; // @[Reg.scala 15:16]
  reg  io_out_ex_r_is_jump; // @[Reg.scala 15:16]
  reg  io_out_ex_r_is_branch; // @[Reg.scala 15:16]
  reg  io_out_ex_r_is_csr; // @[Reg.scala 15:16]
  reg  io_out_ex_r_is_trap; // @[Reg.scala 15:16]
  reg [3:0] io_out_ex_r_fn; // @[Reg.scala 15:16]
  reg [4:0] io_out_ex_r_rs1; // @[Reg.scala 15:16]
  reg [4:0] io_out_ex_r_rs2; // @[Reg.scala 15:16]
  reg [63:0] io_out_ex_r_op1; // @[Reg.scala 15:16]
  reg [63:0] io_out_ex_r_op2; // @[Reg.scala 15:16]
  reg  io_out_ex_r_use_imm; // @[Reg.scala 15:16]
  reg [63:0] io_out_ex_r_imm; // @[Reg.scala 15:16]
  reg [1:0] io_out_ex_r_csrfn; // @[Reg.scala 15:16]
  reg  io_out_mem_r_en; // @[Reg.scala 15:16]
  reg  io_out_mem_r_rw; // @[Reg.scala 15:16]
  reg  io_out_mem_r_unsigned; // @[Reg.scala 15:16]
  reg [2:0] io_out_mem_r_wWidth; // @[Reg.scala 15:16]
  wire  _T = ~io_out_valid; // @[Bundle.scala 32:10]
  reg [4:0] io_out_wb_r_rd; // @[Reg.scala 15:16]
  assign io_out_valid = io_out_valid_r; // @[ID_EX.scala 30:16]
  assign io_out_predicted_pc = io_out_predicted_pc_r; // @[ID_EX.scala 31:23]
  assign io_out_commit_pc = io_out_commit_r_pc; // @[ID_EX.scala 32:17]
  assign io_out_ex_is_op32 = io_out_ex_r_is_op32; // @[ID_EX.scala 34:13]
  assign io_out_ex_is_jump = io_out_ex_r_is_jump; // @[ID_EX.scala 34:13]
  assign io_out_ex_is_branch = io_out_ex_r_is_branch; // @[ID_EX.scala 34:13]
  assign io_out_ex_is_csr = io_out_ex_r_is_csr; // @[ID_EX.scala 34:13]
  assign io_out_ex_is_trap = io_out_ex_r_is_trap; // @[ID_EX.scala 34:13]
  assign io_out_ex_fn = io_out_ex_r_fn; // @[ID_EX.scala 34:13]
  assign io_out_ex_rs1 = io_out_ex_r_rs1; // @[ID_EX.scala 34:13]
  assign io_out_ex_rs2 = io_out_ex_r_rs2; // @[ID_EX.scala 34:13]
  assign io_out_ex_op1 = io_out_ex_r_op1; // @[ID_EX.scala 34:13]
  assign io_out_ex_op2 = io_out_ex_r_op2; // @[ID_EX.scala 34:13]
  assign io_out_ex_use_imm = io_out_ex_r_use_imm; // @[ID_EX.scala 34:13]
  assign io_out_ex_imm = io_out_ex_r_imm; // @[ID_EX.scala 34:13]
  assign io_out_ex_csrfn = io_out_ex_r_csrfn; // @[ID_EX.scala 34:13]
  assign io_out_mem_en = ~io_out_valid ? 1'h0 : io_out_mem_r_en; // @[Bundle.scala 32:18 Bundle.scala 33:15 ID_EX.scala 36:14]
  assign io_out_mem_rw = io_out_mem_r_rw; // @[ID_EX.scala 36:14]
  assign io_out_mem_unsigned = io_out_mem_r_unsigned; // @[ID_EX.scala 36:14]
  assign io_out_mem_wWidth = io_out_mem_r_wWidth; // @[ID_EX.scala 36:14]
  assign io_out_wb_rd = _T ? 5'h0 : io_out_wb_r_rd; // @[Bundle.scala 43:18 Bundle.scala 44:15 ID_EX.scala 39:13]
  always @(posedge clock) begin
    if (reset) begin // @[Reg.scala 27:20]
      io_out_valid_r <= 1'h0; // @[Reg.scala 27:20]
    end else if (_io_out_valid_T) begin // @[Reg.scala 28:19]
      io_out_valid_r <= io_in_valid; // @[Reg.scala 28:23]
    end
    if (_io_out_valid_T) begin // @[Reg.scala 16:19]
      io_out_predicted_pc_r <= io_in_predicted_pc; // @[Reg.scala 16:23]
    end
    if (_io_out_valid_T) begin // @[Reg.scala 16:19]
      io_out_commit_r_pc <= io_in_commit_pc; // @[Reg.scala 16:23]
    end
    if (_io_out_valid_T) begin // @[Reg.scala 16:19]
      io_out_ex_r_is_op32 <= io_in_ex_is_op32; // @[Reg.scala 16:23]
    end
    if (_io_out_valid_T) begin // @[Reg.scala 16:19]
      io_out_ex_r_is_jump <= io_in_ex_is_jump; // @[Reg.scala 16:23]
    end
    if (_io_out_valid_T) begin // @[Reg.scala 16:19]
      io_out_ex_r_is_branch <= io_in_ex_is_branch; // @[Reg.scala 16:23]
    end
    if (_io_out_valid_T) begin // @[Reg.scala 16:19]
      io_out_ex_r_is_csr <= io_in_ex_is_csr; // @[Reg.scala 16:23]
    end
    if (_io_out_valid_T) begin // @[Reg.scala 16:19]
      io_out_ex_r_is_trap <= io_in_ex_is_trap; // @[Reg.scala 16:23]
    end
    if (_io_out_valid_T) begin // @[Reg.scala 16:19]
      io_out_ex_r_fn <= io_in_ex_fn; // @[Reg.scala 16:23]
    end
    if (_io_out_valid_T) begin // @[Reg.scala 16:19]
      io_out_ex_r_rs1 <= io_in_ex_rs1; // @[Reg.scala 16:23]
    end
    if (_io_out_valid_T) begin // @[Reg.scala 16:19]
      io_out_ex_r_rs2 <= io_in_ex_rs2; // @[Reg.scala 16:23]
    end
    if (_io_out_valid_T) begin // @[Reg.scala 16:19]
      io_out_ex_r_op1 <= io_in_ex_op1; // @[Reg.scala 16:23]
    end
    if (_io_out_valid_T) begin // @[Reg.scala 16:19]
      io_out_ex_r_op2 <= io_in_ex_op2; // @[Reg.scala 16:23]
    end
    if (_io_out_valid_T) begin // @[Reg.scala 16:19]
      io_out_ex_r_use_imm <= io_in_ex_use_imm; // @[Reg.scala 16:23]
    end
    if (_io_out_valid_T) begin // @[Reg.scala 16:19]
      io_out_ex_r_imm <= io_in_ex_imm; // @[Reg.scala 16:23]
    end
    if (_io_out_valid_T) begin // @[Reg.scala 16:19]
      io_out_ex_r_csrfn <= io_in_ex_csrfn; // @[Reg.scala 16:23]
    end
    if (_io_out_valid_T) begin // @[Reg.scala 16:19]
      io_out_mem_r_en <= io_in_mem_en; // @[Reg.scala 16:23]
    end
    if (_io_out_valid_T) begin // @[Reg.scala 16:19]
      io_out_mem_r_rw <= io_in_mem_rw; // @[Reg.scala 16:23]
    end
    if (_io_out_valid_T) begin // @[Reg.scala 16:19]
      io_out_mem_r_unsigned <= io_in_mem_unsigned; // @[Reg.scala 16:23]
    end
    if (_io_out_valid_T) begin // @[Reg.scala 16:19]
      io_out_mem_r_wWidth <= io_in_mem_wWidth; // @[Reg.scala 16:23]
    end
    if (_io_out_valid_T) begin // @[Reg.scala 16:19]
      io_out_wb_r_rd <= io_in_wb_rd; // @[Reg.scala 16:23]
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
  io_out_valid_r = _RAND_0[0:0];
  _RAND_1 = {2{`RANDOM}};
  io_out_predicted_pc_r = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  io_out_commit_r_pc = _RAND_2[63:0];
  _RAND_3 = {1{`RANDOM}};
  io_out_ex_r_is_op32 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  io_out_ex_r_is_jump = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  io_out_ex_r_is_branch = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  io_out_ex_r_is_csr = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  io_out_ex_r_is_trap = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  io_out_ex_r_fn = _RAND_8[3:0];
  _RAND_9 = {1{`RANDOM}};
  io_out_ex_r_rs1 = _RAND_9[4:0];
  _RAND_10 = {1{`RANDOM}};
  io_out_ex_r_rs2 = _RAND_10[4:0];
  _RAND_11 = {2{`RANDOM}};
  io_out_ex_r_op1 = _RAND_11[63:0];
  _RAND_12 = {2{`RANDOM}};
  io_out_ex_r_op2 = _RAND_12[63:0];
  _RAND_13 = {1{`RANDOM}};
  io_out_ex_r_use_imm = _RAND_13[0:0];
  _RAND_14 = {2{`RANDOM}};
  io_out_ex_r_imm = _RAND_14[63:0];
  _RAND_15 = {1{`RANDOM}};
  io_out_ex_r_csrfn = _RAND_15[1:0];
  _RAND_16 = {1{`RANDOM}};
  io_out_mem_r_en = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  io_out_mem_r_rw = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  io_out_mem_r_unsigned = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  io_out_mem_r_wWidth = _RAND_19[2:0];
  _RAND_20 = {1{`RANDOM}};
  io_out_wb_r_rd = _RAND_20[4:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210285_Alu(
  input  [3:0]  io_in_fn,
  input         io_in_is_op32,
  input  [63:0] io_in_op1,
  input  [63:0] io_in_op2,
  output [63:0] io_out
);
  wire [4:0] shift_op2_lo = io_in_op2[4:0]; // @[Alu.scala 48:49]
  wire [5:0] _shift_op2_T = {1'h0,shift_op2_lo}; // @[Cat.scala 30:58]
  wire [5:0] shift_op2 = io_in_is_op32 ? _shift_op2_T : io_in_op2[5:0]; // @[Alu.scala 48:22]
  wire [63:0] add = io_in_op1 + io_in_op2; // @[Alu.scala 50:17]
  wire [63:0] sub = io_in_op1 - io_in_op2; // @[Alu.scala 51:17]
  wire [126:0] _GEN_0 = {{63'd0}, io_in_op1}; // @[Alu.scala 52:17]
  wire [126:0] sll = _GEN_0 << shift_op2; // @[Alu.scala 52:17]
  wire  lt = $signed(io_in_op1) < $signed(io_in_op2); // @[Alu.scala 53:23]
  wire  ltu = io_in_op1 < io_in_op2; // @[Alu.scala 54:17]
  wire [63:0] slt = {63'h0,lt}; // @[Cat.scala 30:58]
  wire [63:0] sltu = {63'h0,ltu}; // @[Cat.scala 30:58]
  wire [63:0] xor_ = io_in_op1 ^ io_in_op2; // @[Alu.scala 57:17]
  wire [63:0] srl_64 = io_in_op1 >> shift_op2; // @[Alu.scala 58:20]
  wire [31:0] srl_32 = io_in_op1[31:0] >> shift_op2; // @[Alu.scala 59:27]
  wire [31:0] srl_hi = srl_32[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _srl_T_2 = {srl_hi,srl_32}; // @[Cat.scala 30:58]
  wire [63:0] srl = io_in_is_op32 ? _srl_T_2 : srl_64; // @[Alu.scala 60:16]
  wire [63:0] sra_64 = $signed(io_in_op1) >>> shift_op2; // @[Alu.scala 61:42]
  wire [31:0] _sra_32_T_1 = io_in_op1[31:0]; // @[Alu.scala 62:28]
  wire [31:0] sra_32 = $signed(_sra_32_T_1) >>> shift_op2; // @[Alu.scala 62:49]
  wire [31:0] sra_hi = sra_32[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _sra_T_2 = {sra_hi,sra_32}; // @[Cat.scala 30:58]
  wire [63:0] sra = io_in_is_op32 ? _sra_T_2 : sra_64; // @[Alu.scala 63:16]
  wire [63:0] or_ = io_in_op1 | io_in_op2; // @[Alu.scala 64:16]
  wire [63:0] and_ = io_in_op1 & io_in_op2; // @[Alu.scala 65:17]
  wire  ne = |xor_; // @[Alu.scala 67:16]
  wire  seq_lo = ~ne; // @[Alu.scala 68:22]
  wire [63:0] seq = {63'h0,seq_lo}; // @[Cat.scala 30:58]
  wire [63:0] sne = {63'h0,ne}; // @[Cat.scala 30:58]
  wire  sge_lo = ~lt; // @[Alu.scala 70:22]
  wire [63:0] sge = {63'h0,sge_lo}; // @[Cat.scala 30:58]
  wire  sgeu_lo = ~ltu; // @[Alu.scala 71:23]
  wire [63:0] sgeu = {63'h0,sgeu_lo}; // @[Cat.scala 30:58]
  wire [63:0] _res_T_3 = 4'h8 == io_in_fn ? sub : add; // @[Mux.scala 80:57]
  wire [126:0] _res_T_5 = 4'h1 == io_in_fn ? sll : {{63'd0}, _res_T_3}; // @[Mux.scala 80:57]
  wire [126:0] _res_T_7 = 4'h2 == io_in_fn ? {{63'd0}, slt} : _res_T_5; // @[Mux.scala 80:57]
  wire [126:0] _res_T_9 = 4'h3 == io_in_fn ? {{63'd0}, sltu} : _res_T_7; // @[Mux.scala 80:57]
  wire [126:0] _res_T_11 = 4'h4 == io_in_fn ? {{63'd0}, xor_} : _res_T_9; // @[Mux.scala 80:57]
  wire [126:0] _res_T_13 = 4'h5 == io_in_fn ? {{63'd0}, srl} : _res_T_11; // @[Mux.scala 80:57]
  wire [126:0] _res_T_15 = 4'hd == io_in_fn ? {{63'd0}, sra} : _res_T_13; // @[Mux.scala 80:57]
  wire [126:0] _res_T_17 = 4'h6 == io_in_fn ? {{63'd0}, or_} : _res_T_15; // @[Mux.scala 80:57]
  wire [126:0] _res_T_19 = 4'h7 == io_in_fn ? {{63'd0}, and_} : _res_T_17; // @[Mux.scala 80:57]
  wire [126:0] _res_T_21 = 4'he == io_in_fn ? {{63'd0}, seq} : _res_T_19; // @[Mux.scala 80:57]
  wire [126:0] _res_T_23 = 4'hf == io_in_fn ? {{63'd0}, sne} : _res_T_21; // @[Mux.scala 80:57]
  wire [126:0] _res_T_25 = 4'ha == io_in_fn ? {{63'd0}, sge} : _res_T_23; // @[Mux.scala 80:57]
  wire [126:0] res = 4'hb == io_in_fn ? {{63'd0}, sgeu} : _res_T_25; // @[Mux.scala 80:57]
  wire [31:0] io_out_lo = res[31:0]; // @[Alu.scala 93:37]
  wire [31:0] io_out_hi = io_out_lo[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _io_out_T_2 = {io_out_hi,io_out_lo}; // @[Cat.scala 30:58]
  wire [126:0] _io_out_T_3 = io_in_is_op32 ? {{63'd0}, _io_out_T_2} : res; // @[Alu.scala 93:16]
  assign io_out = _io_out_T_3[63:0]; // @[Alu.scala 93:10]
endmodule
module ysyx_210285_MStatus(
  input         clock,
  input         reset,
  output [63:0] io_value,
  input         io_wen,
  input  [63:0] io_wdata
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] reg_; // @[CSR.scala 47:22]
  wire  out_uie = reg_[0]; // @[CSR.scala 84:37]
  wire  out_sie = reg_[1]; // @[CSR.scala 84:37]
  wire  out_wpri_2 = reg_[2]; // @[CSR.scala 84:37]
  wire  out_mie = reg_[3]; // @[CSR.scala 84:37]
  wire  out_upie = reg_[4]; // @[CSR.scala 84:37]
  wire  out_spie = reg_[5]; // @[CSR.scala 84:37]
  wire  out_wpri_6 = reg_[6]; // @[CSR.scala 84:37]
  wire  out_mpie = reg_[7]; // @[CSR.scala 84:37]
  wire  out_spp = reg_[8]; // @[CSR.scala 84:37]
  wire [1:0] out_wpri_10_9 = reg_[10:9]; // @[CSR.scala 84:37]
  wire [1:0] out_mpp = reg_[12:11]; // @[CSR.scala 84:37]
  wire [1:0] out_fs = reg_[14:13]; // @[CSR.scala 84:37]
  wire [1:0] out_xs = reg_[16:15]; // @[CSR.scala 84:37]
  wire [45:0] out_dontcare = reg_[62:17]; // @[CSR.scala 84:37]
  wire  out_sd = out_fs != 2'h0 | out_xs != 2'h0; // @[CSR.scala 85:30]
  wire [6:0] io_value_lo = {out_wpri_6,out_spie,out_upie,out_mie,out_wpri_2,out_sie,out_uie}; // @[CSR.scala 86:21]
  wire [56:0] io_value_hi = {out_sd,out_dontcare,out_xs,out_fs,out_mpp,out_wpri_10_9,out_spp,out_mpie}; // @[CSR.scala 86:21]
  assign io_value = {io_value_hi,io_value_lo}; // @[CSR.scala 86:21]
  always @(posedge clock) begin
    if (reset) begin // @[CSR.scala 47:22]
      reg_ <= 64'h0; // @[CSR.scala 47:22]
    end else if (io_wen) begin // @[CSR.scala 87:18]
      reg_ <= io_wdata; // @[CSR.scala 88:11]
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
  reg_ = _RAND_0[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210285_Csr_Anon(
  input         clock,
  input         reset,
  output [63:0] io_value,
  input         io_wen,
  input  [63:0] io_wdata
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] reg_; // @[CSR.scala 47:22]
  assign io_value = reg_; // @[CSR.scala 49:20]
  always @(posedge clock) begin
    if (reset) begin // @[CSR.scala 47:22]
      reg_ <= 64'h0; // @[CSR.scala 47:22]
    end else if (io_wen) begin // @[CSR.scala 55:18]
      reg_ <= io_wdata; // @[CSR.scala 56:11]
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
  reg_ = _RAND_0[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210285_Mcycle(
  input         clock,
  input         reset,
  output [63:0] io_value
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] reg_; // @[CSR.scala 47:22]
  wire [63:0] _reg_T_1 = reg_ + 64'h1; // @[CSR.scala 62:16]
  assign io_value = reg_; // @[CSR.scala 49:20]
  always @(posedge clock) begin
    if (reset) begin // @[CSR.scala 47:22]
      reg_ <= 64'h0; // @[CSR.scala 47:22]
    end else begin
      reg_ <= _reg_T_1; // @[CSR.scala 62:9]
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
  reg_ = _RAND_0[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210285_Csr(
  input         clock,
  input         reset,
  input         io_en,
  input  [1:0]  io_csrfn,
  input  [11:0] io_csr_number,
  input  [63:0] io_op,
  output [63:0] io_res,
  input         io_trap_is_ecall,
  input         io_trap_is_mret,
  input         io_trap_is_timerintr,
  input  [63:0] io_trap_pc,
  output [31:0] io_trap_intr,
  output        io_trap_jump_valid,
  output [63:0] io_trap_jump_pc
);
  wire  csrs_0_clock; // @[CSR.scala 142:23]
  wire  csrs_0_reset; // @[CSR.scala 142:23]
  wire [63:0] csrs_0_io_value; // @[CSR.scala 142:23]
  wire  csrs_0_io_wen; // @[CSR.scala 142:23]
  wire [63:0] csrs_0_io_wdata; // @[CSR.scala 142:23]
  wire  csrs_1_clock; // @[CSR.scala 144:19]
  wire  csrs_1_reset; // @[CSR.scala 144:19]
  wire [63:0] csrs_1_io_value; // @[CSR.scala 144:19]
  wire  csrs_1_io_wen; // @[CSR.scala 144:19]
  wire [63:0] csrs_1_io_wdata; // @[CSR.scala 144:19]
  wire  csrs_2_clock; // @[CSR.scala 146:21]
  wire  csrs_2_reset; // @[CSR.scala 146:21]
  wire [63:0] csrs_2_io_value; // @[CSR.scala 146:21]
  wire  csrs_2_io_wen; // @[CSR.scala 146:21]
  wire [63:0] csrs_2_io_wdata; // @[CSR.scala 146:21]
  wire  csrs_3_clock; // @[CSR.scala 147:24]
  wire  csrs_3_reset; // @[CSR.scala 147:24]
  wire [63:0] csrs_3_io_value; // @[CSR.scala 147:24]
  wire  csrs_3_io_wen; // @[CSR.scala 147:24]
  wire [63:0] csrs_3_io_wdata; // @[CSR.scala 147:24]
  wire  csrs_4_clock; // @[CSR.scala 148:20]
  wire  csrs_4_reset; // @[CSR.scala 148:20]
  wire [63:0] csrs_4_io_value; // @[CSR.scala 148:20]
  wire  csrs_4_io_wen; // @[CSR.scala 148:20]
  wire [63:0] csrs_4_io_wdata; // @[CSR.scala 148:20]
  wire  csrs_5_clock; // @[CSR.scala 149:22]
  wire  csrs_5_reset; // @[CSR.scala 149:22]
  wire [63:0] csrs_5_io_value; // @[CSR.scala 149:22]
  wire  csrs_5_io_wen; // @[CSR.scala 149:22]
  wire [63:0] csrs_5_io_wdata; // @[CSR.scala 149:22]
  wire  csrs_6_clock; // @[CSR.scala 151:22]
  wire  csrs_6_reset; // @[CSR.scala 151:22]
  wire [63:0] csrs_6_io_value; // @[CSR.scala 151:22]
  wire [63:0] _csr_value_T_1 = 12'h300 == io_csr_number ? csrs_0_io_value : 64'h0; // @[Mux.scala 80:57]
  wire [63:0] _csr_value_T_3 = 12'h304 == io_csr_number ? csrs_1_io_value : _csr_value_T_1; // @[Mux.scala 80:57]
  wire [63:0] _csr_value_T_5 = 12'h305 == io_csr_number ? csrs_2_io_value : _csr_value_T_3; // @[Mux.scala 80:57]
  wire [63:0] _csr_value_T_7 = 12'h340 == io_csr_number ? csrs_3_io_value : _csr_value_T_5; // @[Mux.scala 80:57]
  wire [63:0] _csr_value_T_9 = 12'h341 == io_csr_number ? csrs_4_io_value : _csr_value_T_7; // @[Mux.scala 80:57]
  wire [63:0] _csr_value_T_11 = 12'h342 == io_csr_number ? csrs_5_io_value : _csr_value_T_9; // @[Mux.scala 80:57]
  wire [63:0] csr_value = 12'hb00 == io_csr_number ? csrs_6_io_value : _csr_value_T_11; // @[Mux.scala 80:57]
  wire [63:0] _res_T = csr_value | io_op; // @[CSR.scala 137:33]
  wire [63:0] _res_T_1 = ~io_op; // @[CSR.scala 138:35]
  wire [63:0] _res_T_2 = csr_value & _res_T_1; // @[CSR.scala 138:33]
  wire [63:0] _res_T_4 = 2'h1 == io_csrfn ? io_op : 64'h0; // @[Mux.scala 80:57]
  wire [63:0] _res_T_6 = 2'h2 == io_csrfn ? _res_T : _res_T_4; // @[Mux.scala 80:57]
  wire [63:0] res = 2'h3 == io_csrfn ? _res_T_2 : _res_T_6; // @[Mux.scala 80:57]
  wire [63:0] _mstatusB_WIRE_1 = csrs_0_io_value;
  wire  mstatusB_uie = _mstatusB_WIRE_1[0]; // @[CSR.scala 143:52]
  wire  mstatusB_sie = _mstatusB_WIRE_1[1]; // @[CSR.scala 143:52]
  wire  mstatusB_wpri_2 = _mstatusB_WIRE_1[2]; // @[CSR.scala 143:52]
  wire  mstatusB_mie = _mstatusB_WIRE_1[3]; // @[CSR.scala 143:52]
  wire  mstatusB_upie = _mstatusB_WIRE_1[4]; // @[CSR.scala 143:52]
  wire  mstatusB_spie = _mstatusB_WIRE_1[5]; // @[CSR.scala 143:52]
  wire  mstatusB_wpri_6 = _mstatusB_WIRE_1[6]; // @[CSR.scala 143:52]
  wire  mstatusB_mpie = _mstatusB_WIRE_1[7]; // @[CSR.scala 143:52]
  wire  mstatusB_spp = _mstatusB_WIRE_1[8]; // @[CSR.scala 143:52]
  wire [1:0] mstatusB_wpri_10_9 = _mstatusB_WIRE_1[10:9]; // @[CSR.scala 143:52]
  wire [1:0] mstatusB_fs = _mstatusB_WIRE_1[14:13]; // @[CSR.scala 143:52]
  wire [1:0] mstatusB_xs = _mstatusB_WIRE_1[16:15]; // @[CSR.scala 143:52]
  wire [45:0] mstatusB_dontcare = _mstatusB_WIRE_1[62:17]; // @[CSR.scala 143:52]
  wire  mstatusB_sd = _mstatusB_WIRE_1[63]; // @[CSR.scala 143:52]
  wire [63:0] _mieB_WIRE_1 = csrs_1_io_value;
  wire  mieB_mtie = _mieB_WIRE_1[7]; // @[CSR.scala 145:44]
  wire  intr_valid = io_trap_is_timerintr & mstatusB_mie & mieB_mtie | io_trap_is_ecall; // @[CSR.scala 182:59 CSR.scala 183:16]
  wire [63:0] intr_cause = io_trap_is_timerintr & mstatusB_mie & mieB_mtie ? 64'h8000000000000007 : 64'hb; // @[CSR.scala 182:59 CSR.scala 184:16]
  wire [2:0] _GEN_4 = io_trap_is_timerintr & mstatusB_mie & mieB_mtie ? 3'h7 : 3'h0; // @[CSR.scala 182:59 CSR.scala 185:18 CSR.scala 173:16]
  wire [6:0] mstatus_io_wdata_lo = {mstatusB_wpri_6,mstatusB_spie,mstatusB_upie,1'h0,mstatusB_wpri_2,mstatusB_sie,
    mstatusB_uie}; // @[CSR.scala 198:36]
  wire [63:0] _mstatus_io_wdata_T = {mstatusB_sd,mstatusB_dontcare,mstatusB_xs,mstatusB_fs,2'h3,mstatusB_wpri_10_9,
    mstatusB_spp,mstatusB_mie,mstatus_io_wdata_lo}; // @[CSR.scala 198:36]
  wire  _GEN_7 = intr_valid | io_en & io_csr_number == 12'h300; // @[CSR.scala 190:20 CSR.scala 197:20 CSR.scala 162:14]
  wire [63:0] _GEN_8 = intr_valid ? _mstatus_io_wdata_T : res; // @[CSR.scala 190:20 CSR.scala 198:22 CSR.scala 163:16]
  wire [63:0] _GEN_12 = csrs_2_io_value; // @[CSR.scala 190:20 CSR.scala 202:21]
  wire [6:0] mstatus_io_wdata_lo_1 = {mstatusB_wpri_6,mstatusB_spie,mstatusB_upie,mstatusB_mpie,mstatusB_wpri_2,
    mstatusB_sie,mstatusB_uie}; // @[CSR.scala 210:36]
  wire [63:0] _mstatus_io_wdata_T_1 = {mstatusB_sd,mstatusB_dontcare,mstatusB_xs,mstatusB_fs,2'h0,mstatusB_wpri_10_9,
    mstatusB_spp,1'h1,mstatus_io_wdata_lo_1}; // @[CSR.scala 210:36]
  ysyx_210285_MStatus csrs_0 ( // @[CSR.scala 142:23]
    .clock(csrs_0_clock),
    .reset(csrs_0_reset),
    .io_value(csrs_0_io_value),
    .io_wen(csrs_0_io_wen),
    .io_wdata(csrs_0_io_wdata)
  );
  ysyx_210285_Csr_Anon csrs_1 ( // @[CSR.scala 144:19]
    .clock(csrs_1_clock),
    .reset(csrs_1_reset),
    .io_value(csrs_1_io_value),
    .io_wen(csrs_1_io_wen),
    .io_wdata(csrs_1_io_wdata)
  );
  ysyx_210285_Csr_Anon csrs_2 ( // @[CSR.scala 146:21]
    .clock(csrs_2_clock),
    .reset(csrs_2_reset),
    .io_value(csrs_2_io_value),
    .io_wen(csrs_2_io_wen),
    .io_wdata(csrs_2_io_wdata)
  );
  ysyx_210285_Csr_Anon csrs_3 ( // @[CSR.scala 147:24]
    .clock(csrs_3_clock),
    .reset(csrs_3_reset),
    .io_value(csrs_3_io_value),
    .io_wen(csrs_3_io_wen),
    .io_wdata(csrs_3_io_wdata)
  );
  ysyx_210285_Csr_Anon csrs_4 ( // @[CSR.scala 148:20]
    .clock(csrs_4_clock),
    .reset(csrs_4_reset),
    .io_value(csrs_4_io_value),
    .io_wen(csrs_4_io_wen),
    .io_wdata(csrs_4_io_wdata)
  );
  ysyx_210285_Csr_Anon csrs_5 ( // @[CSR.scala 149:22]
    .clock(csrs_5_clock),
    .reset(csrs_5_reset),
    .io_value(csrs_5_io_value),
    .io_wen(csrs_5_io_wen),
    .io_wdata(csrs_5_io_wdata)
  );
  ysyx_210285_Mcycle csrs_6 ( // @[CSR.scala 151:22]
    .clock(csrs_6_clock),
    .reset(csrs_6_reset),
    .io_value(csrs_6_io_value)
  );
  assign io_res = 12'hb00 == io_csr_number ? csrs_6_io_value : _csr_value_T_11; // @[Mux.scala 80:57]
  assign io_trap_intr = {{29'd0}, _GEN_4}; // @[CSR.scala 182:59 CSR.scala 185:18 CSR.scala 173:16]
  assign io_trap_jump_valid = io_trap_is_mret | intr_valid; // @[CSR.scala 204:25 CSR.scala 211:24]
  assign io_trap_jump_pc = io_trap_is_mret ? csrs_4_io_value : _GEN_12; // @[CSR.scala 204:25 CSR.scala 212:21]
  assign csrs_0_clock = clock;
  assign csrs_0_reset = reset;
  assign csrs_0_io_wen = io_trap_is_mret | _GEN_7; // @[CSR.scala 204:25 CSR.scala 209:20]
  assign csrs_0_io_wdata = io_trap_is_mret ? _mstatus_io_wdata_T_1 : _GEN_8; // @[CSR.scala 204:25 CSR.scala 210:22]
  assign csrs_1_clock = clock;
  assign csrs_1_reset = reset;
  assign csrs_1_io_wen = io_en & io_csr_number == 12'h304; // @[CSR.scala 162:23]
  assign csrs_1_io_wdata = 2'h3 == io_csrfn ? _res_T_2 : _res_T_6; // @[Mux.scala 80:57]
  assign csrs_2_clock = clock;
  assign csrs_2_reset = reset;
  assign csrs_2_io_wen = io_en & io_csr_number == 12'h305; // @[CSR.scala 162:23]
  assign csrs_2_io_wdata = 2'h3 == io_csrfn ? _res_T_2 : _res_T_6; // @[Mux.scala 80:57]
  assign csrs_3_clock = clock;
  assign csrs_3_reset = reset;
  assign csrs_3_io_wen = io_en & io_csr_number == 12'h340; // @[CSR.scala 162:23]
  assign csrs_3_io_wdata = 2'h3 == io_csrfn ? _res_T_2 : _res_T_6; // @[Mux.scala 80:57]
  assign csrs_4_clock = clock;
  assign csrs_4_reset = reset;
  assign csrs_4_io_wen = intr_valid | io_en & io_csr_number == 12'h341; // @[CSR.scala 190:20 CSR.scala 191:17 CSR.scala 162:14]
  assign csrs_4_io_wdata = intr_valid ? io_trap_pc : res; // @[CSR.scala 190:20 CSR.scala 192:19 CSR.scala 163:16]
  assign csrs_5_clock = clock;
  assign csrs_5_reset = reset;
  assign csrs_5_io_wen = intr_valid | io_en & io_csr_number == 12'h342; // @[CSR.scala 190:20 CSR.scala 199:19 CSR.scala 162:14]
  assign csrs_5_io_wdata = intr_valid ? intr_cause : res; // @[CSR.scala 190:20 CSR.scala 200:21 CSR.scala 163:16]
  assign csrs_6_clock = clock;
  assign csrs_6_reset = reset;
endmodule
module ysyx_210285_EX(
  input         clock,
  input         reset,
  input         io_in_valid,
  input  [63:0] io_in_predicted_pc,
  input  [63:0] io_in_commit_pc,
  input         io_in_ex_is_op32,
  input         io_in_ex_is_jump,
  input         io_in_ex_is_branch,
  input         io_in_ex_is_csr,
  input         io_in_ex_is_trap,
  input  [3:0]  io_in_ex_fn,
  input  [4:0]  io_in_ex_rs1,
  input  [4:0]  io_in_ex_rs2,
  input  [63:0] io_in_ex_op1,
  input  [63:0] io_in_ex_op2,
  input         io_in_ex_use_imm,
  input  [63:0] io_in_ex_imm,
  input  [1:0]  io_in_ex_csrfn,
  input         io_in_mem_en,
  input         io_in_mem_rw,
  input         io_in_mem_unsigned,
  input  [2:0]  io_in_mem_wWidth,
  input  [4:0]  io_in_wb_rd,
  input  [4:0]  io_forward_0_rd,
  input  [63:0] io_forward_0_data,
  input         io_timer_intr,
  input         io_stall,
  output        io_out_valid,
  output        io_out_jump_valid,
  output [63:0] io_out_jump_pc,
  output        io_out_mem_en,
  output        io_out_mem_rw,
  output        io_out_mem_unsigned,
  output [2:0]  io_out_mem_wWidth,
  output [31:0] io_out_mem_addr,
  output [63:0] io_out_mem_wdata,
  output [4:0]  io_out_wb_rd,
  output [63:0] io_out_wb_data
);
  wire [3:0] alu_io_in_fn; // @[EX.scala 44:19]
  wire  alu_io_in_is_op32; // @[EX.scala 44:19]
  wire [63:0] alu_io_in_op1; // @[EX.scala 44:19]
  wire [63:0] alu_io_in_op2; // @[EX.scala 44:19]
  wire [63:0] alu_io_out; // @[EX.scala 44:19]
  wire  csr_clock; // @[EX.scala 81:19]
  wire  csr_reset; // @[EX.scala 81:19]
  wire  csr_io_en; // @[EX.scala 81:19]
  wire [1:0] csr_io_csrfn; // @[EX.scala 81:19]
  wire [11:0] csr_io_csr_number; // @[EX.scala 81:19]
  wire [63:0] csr_io_op; // @[EX.scala 81:19]
  wire [63:0] csr_io_res; // @[EX.scala 81:19]
  wire  csr_io_trap_is_ecall; // @[EX.scala 81:19]
  wire  csr_io_trap_is_mret; // @[EX.scala 81:19]
  wire  csr_io_trap_is_timerintr; // @[EX.scala 81:19]
  wire [63:0] csr_io_trap_pc; // @[EX.scala 81:19]
  wire [31:0] csr_io_trap_intr; // @[EX.scala 81:19]
  wire  csr_io_trap_jump_valid; // @[EX.scala 81:19]
  wire [63:0] csr_io_trap_jump_pc; // @[EX.scala 81:19]
  wire [63:0] _GEN_0 = io_in_ex_rs1 == io_forward_0_rd ? io_forward_0_data : io_in_ex_op1; // @[EX.scala 37:38 EX.scala 38:13]
  wire [63:0] rop1 = io_in_ex_rs1 != 5'h0 ? _GEN_0 : io_in_ex_op1; // @[EX.scala 36:23]
  wire [63:0] _GEN_2 = io_in_ex_rs2 == io_forward_0_rd ? io_forward_0_data : io_in_ex_op2; // @[EX.scala 37:38 EX.scala 38:13]
  wire [63:0] rop2 = io_in_ex_rs2 != 5'h0 ? _GEN_2 : io_in_ex_op2; // @[EX.scala 36:23]
  wire  _io_out_jump_valid_T = io_in_predicted_pc != io_out_jump_pc; // @[EX.scala 69:45]
  wire [63:0] _GEN_4 = alu_io_out; // @[EX.scala 67:41 EX.scala 68:20]
  wire  _GEN_5 = io_in_valid & io_in_ex_is_jump & io_in_predicted_pc != io_out_jump_pc; // @[EX.scala 67:41 EX.scala 69:23 EX.scala 65:21]
  wire [63:0] _GEN_6 = io_in_valid & io_in_ex_is_jump ? io_in_ex_imm : alu_io_out; // @[EX.scala 67:41 EX.scala 70:20 EX.scala 61:18]
  wire [63:0] _io_out_jump_pc_T_3 = io_in_commit_pc + 64'h4; // @[EX.scala 76:23]
  wire [63:0] _io_out_jump_pc_T_4 = alu_io_out[0] ? io_in_ex_imm : _io_out_jump_pc_T_3; // @[EX.scala 73:26]
  wire [63:0] _GEN_7 = io_in_valid & io_in_ex_is_branch ? _io_out_jump_pc_T_4 : _GEN_4; // @[EX.scala 72:43 EX.scala 73:20]
  wire  _GEN_8 = io_in_valid & io_in_ex_is_branch ? _io_out_jump_valid_T : _GEN_5; // @[EX.scala 72:43 EX.scala 78:23]
  wire  _csr_en_T_1 = io_in_valid & ~io_stall; // @[EX.scala 82:28]
  wire  csr_en = io_in_valid & ~io_stall & io_in_ex_is_csr; // @[EX.scala 82:41]
  wire [63:0] _GEN_13 = csr_io_trap_intr != 32'h0 ? csr_io_trap_jump_pc : _GEN_7; // @[EX.scala 94:34 EX.scala 98:17]
  wire  _GEN_14 = csr_io_trap_intr != 32'h0 ? csr_io_trap_jump_valid : _GEN_8; // @[EX.scala 94:34 EX.scala 98:17]
  wire  trap_en = io_in_valid & io_in_ex_is_trap; // @[EX.scala 101:29]
  wire  _T_3 = 5'h0 == io_in_ex_rs2; // @[Conditional.scala 37:30]
  wire  _T_4 = 5'h2 == io_in_ex_rs2; // @[Conditional.scala 37:30]
  wire [63:0] _GEN_16 = _T_4 ? csr_io_trap_jump_pc : _GEN_13; // @[Conditional.scala 39:67 EX.scala 113:21]
  wire  _GEN_17 = _T_4 ? csr_io_trap_jump_valid : _GEN_14; // @[Conditional.scala 39:67 EX.scala 113:21]
  wire [63:0] _GEN_19 = _T_3 ? csr_io_trap_jump_pc : _GEN_16; // @[Conditional.scala 40:58 EX.scala 109:21]
  wire  _GEN_20 = _T_3 ? csr_io_trap_jump_valid : _GEN_17; // @[Conditional.scala 40:58 EX.scala 109:21]
  wire  _GEN_21 = _T_3 ? 1'h0 : _T_4; // @[Conditional.scala 40:58 EX.scala 103:23]
  ysyx_210285_Alu alu ( // @[EX.scala 44:19]
    .io_in_fn(alu_io_in_fn),
    .io_in_is_op32(alu_io_in_is_op32),
    .io_in_op1(alu_io_in_op1),
    .io_in_op2(alu_io_in_op2),
    .io_out(alu_io_out)
  );
  ysyx_210285_Csr csr ( // @[EX.scala 81:19]
    .clock(csr_clock),
    .reset(csr_reset),
    .io_en(csr_io_en),
    .io_csrfn(csr_io_csrfn),
    .io_csr_number(csr_io_csr_number),
    .io_op(csr_io_op),
    .io_res(csr_io_res),
    .io_trap_is_ecall(csr_io_trap_is_ecall),
    .io_trap_is_mret(csr_io_trap_is_mret),
    .io_trap_is_timerintr(csr_io_trap_is_timerintr),
    .io_trap_pc(csr_io_trap_pc),
    .io_trap_intr(csr_io_trap_intr),
    .io_trap_jump_valid(csr_io_trap_jump_valid),
    .io_trap_jump_pc(csr_io_trap_jump_pc)
  );
  assign io_out_valid = csr_io_trap_intr != 32'h0 ? 1'h0 : io_in_valid; // @[EX.scala 94:34 EX.scala 95:18 EX.scala 52:16]
  assign io_out_jump_valid = trap_en ? _GEN_20 : _GEN_14; // @[EX.scala 105:17]
  assign io_out_jump_pc = trap_en ? _GEN_19 : _GEN_13; // @[EX.scala 105:17]
  assign io_out_mem_en = io_in_mem_en; // @[EX.scala 53:17]
  assign io_out_mem_rw = io_in_mem_rw; // @[EX.scala 54:17]
  assign io_out_mem_unsigned = io_in_mem_unsigned; // @[EX.scala 55:23]
  assign io_out_mem_wWidth = io_in_mem_wWidth; // @[EX.scala 56:21]
  assign io_out_mem_addr = alu_io_out[31:0]; // @[EX.scala 57:19]
  assign io_out_mem_wdata = io_in_ex_rs2 != 5'h0 ? _GEN_2 : io_in_ex_op2; // @[EX.scala 36:23]
  assign io_out_wb_rd = io_in_wb_rd; // @[EX.scala 60:16]
  assign io_out_wb_data = csr_en ? csr_io_res : _GEN_6; // @[EX.scala 87:16 EX.scala 88:20]
  assign alu_io_in_fn = io_in_ex_fn; // @[EX.scala 45:16]
  assign alu_io_in_is_op32 = io_in_ex_is_op32; // @[EX.scala 46:21]
  assign alu_io_in_op1 = io_in_ex_rs1 != 5'h0 ? _GEN_0 : io_in_ex_op1; // @[EX.scala 36:23]
  assign alu_io_in_op2 = io_in_ex_use_imm ? io_in_ex_imm : rop2; // @[EX.scala 50:23]
  assign csr_clock = clock;
  assign csr_reset = reset;
  assign csr_io_en = io_in_valid & ~io_stall & io_in_ex_is_csr; // @[EX.scala 82:41]
  assign csr_io_csrfn = io_in_ex_csrfn; // @[EX.scala 84:16]
  assign csr_io_csr_number = io_in_ex_imm[11:0]; // @[EX.scala 85:21]
  assign csr_io_op = io_in_ex_use_imm ? {{59'd0}, io_in_ex_rs1} : rop1; // @[EX.scala 86:19]
  assign csr_io_trap_is_ecall = trap_en & _T_3; // @[EX.scala 105:17 EX.scala 102:24]
  assign csr_io_trap_is_mret = trap_en & _GEN_21; // @[EX.scala 105:17 EX.scala 103:23]
  assign csr_io_trap_is_timerintr = io_timer_intr & _csr_en_T_1; // @[EX.scala 93:45]
  assign csr_io_trap_pc = io_in_commit_pc; // @[EX.scala 104:18]
endmodule
module ysyx_210285_EX_WB(
  input         clock,
  input         reset,
  output        io_stall,
  input         io_in_valid,
  input         io_in_mem_en,
  input         io_in_mem_rw,
  input         io_in_mem_unsigned,
  input  [2:0]  io_in_mem_wWidth,
  input  [31:0] io_in_mem_addr,
  input  [63:0] io_in_mem_wdata,
  input  [4:0]  io_in_wb_rd,
  input  [63:0] io_in_wb_data,
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
  input         io_axi_ar_ready,
  output        io_axi_ar_valid,
  output [31:0] io_axi_ar_bits_addr,
  output [2:0]  io_axi_ar_bits_size,
  output        io_axi_r_ready,
  input         io_axi_r_valid,
  input  [63:0] io_axi_r_bits_data,
  output        io_out_valid,
  output [4:0]  io_out_wb_rd,
  output [63:0] io_out_wb_data
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [63:0] _RAND_8;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] state; // @[EX_WB.scala 30:22]
  wire  _io_out_valid_T = ~io_stall; // @[EX_WB.scala 33:51]
  reg  io_out_valid_r; // @[Reg.scala 27:20]
  reg [4:0] wb_rd; // @[Reg.scala 15:16]
  reg [63:0] wb_data; // @[Reg.scala 15:16]
  wire [63:0] _GEN_10 = _io_out_valid_T ? io_in_wb_data : wb_data; // @[Reg.scala 16:19 Reg.scala 16:23 Reg.scala 15:16]
  reg  mem_rw; // @[EX_WB.scala 43:16]
  reg  mem_unsigned; // @[EX_WB.scala 43:16]
  reg [2:0] mem_wWidth; // @[EX_WB.scala 43:16]
  reg [31:0] mem_addr; // @[EX_WB.scala 43:16]
  reg [63:0] mem_wdata; // @[EX_WB.scala 43:16]
  wire [2:0] subaddr = mem_addr[2:0]; // @[EX_WB.scala 47:25]
  wire [7:0] _GEN_14 = 2'h1 == mem_wWidth[1:0] ? 8'h3 : 8'h1; // @[EX_WB.scala 53:23 EX_WB.scala 53:23]
  wire [7:0] _GEN_15 = 2'h2 == mem_wWidth[1:0] ? 8'hf : _GEN_14; // @[EX_WB.scala 53:23 EX_WB.scala 53:23]
  wire [7:0] _GEN_16 = 2'h3 == mem_wWidth[1:0] ? 8'hff : _GEN_15; // @[EX_WB.scala 53:23 EX_WB.scala 53:23]
  wire [7:0] mask_hi_hi_hi = _GEN_16[7] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] mask_hi_hi_lo = _GEN_16[6] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] mask_hi_lo_hi = _GEN_16[5] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] mask_hi_lo_lo = _GEN_16[4] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] mask_lo_hi_hi = _GEN_16[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] mask_lo_hi_lo = _GEN_16[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] mask_lo_lo_hi = _GEN_16[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] mask_lo_lo_lo = _GEN_16[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [63:0] mask = {mask_hi_hi_hi,mask_hi_hi_lo,mask_hi_lo_hi,mask_hi_lo_lo,mask_lo_hi_hi,mask_lo_hi_lo,mask_lo_lo_hi,
    mask_lo_lo_lo}; // @[Cat.scala 30:58]
  wire  _T_1 = 3'h0 == state; // @[Conditional.scala 37:30]
  wire  _T_3 = 3'h1 == state; // @[Conditional.scala 37:30]
  wire [14:0] _GEN_120 = {{7'd0}, _GEN_16}; // @[EX_WB.scala 65:34]
  wire [14:0] _io_axi_w_bits_strb_T = _GEN_120 << subaddr; // @[EX_WB.scala 65:34]
  wire [6:0] _io_axi_w_bits_data_T = subaddr * 4'h8; // @[EX_WB.scala 66:51]
  wire [190:0] _GEN_121 = {{127'd0}, mem_wdata}; // @[EX_WB.scala 66:39]
  wire [190:0] _io_axi_w_bits_data_T_1 = _GEN_121 << _io_axi_w_bits_data_T; // @[EX_WB.scala 66:39]
  wire  _T_4 = 3'h2 == state; // @[Conditional.scala 37:30]
  wire [2:0] _GEN_19 = io_axi_b_valid ? 3'h0 : state; // @[EX_WB.scala 75:28 EX_WB.scala 76:15 EX_WB.scala 30:22]
  wire  _T_5 = 3'h3 == state; // @[Conditional.scala 37:30]
  wire [63:0] _axidata_T_1 = io_axi_r_bits_data >> _io_axi_w_bits_data_T; // @[EX_WB.scala 82:41]
  wire [63:0] axidata = _axidata_T_1 & mask; // @[EX_WB.scala 82:61]
  wire [7:0] data_lo = axidata[7:0]; // @[EX_WB.scala 87:26]
  wire [55:0] data_hi = data_lo[7] ? 56'hffffffffffffff : 56'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _data_T_2 = {data_hi,data_lo}; // @[Cat.scala 30:58]
  wire [15:0] data_lo_1 = axidata[15:0]; // @[EX_WB.scala 87:26]
  wire [47:0] data_hi_1 = data_lo_1[15] ? 48'hffffffffffff : 48'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _data_T_5 = {data_hi_1,data_lo_1}; // @[Cat.scala 30:58]
  wire [31:0] data_lo_2 = axidata[31:0]; // @[EX_WB.scala 87:26]
  wire [31:0] data_hi_2 = data_lo_2[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _data_T_8 = {data_hi_2,data_lo_2}; // @[Cat.scala 30:58]
  wire [63:0] _GEN_21 = 2'h1 == mem_wWidth[1:0] ? _data_T_5 : _data_T_2; // @[EX_WB.scala 83:21 EX_WB.scala 83:21]
  wire [63:0] _GEN_22 = 2'h2 == mem_wWidth[1:0] ? _data_T_8 : _GEN_21; // @[EX_WB.scala 83:21 EX_WB.scala 83:21]
  wire [63:0] _GEN_23 = 2'h3 == mem_wWidth[1:0] ? axidata : _GEN_22; // @[EX_WB.scala 83:21 EX_WB.scala 83:21]
  wire [63:0] data = mem_unsigned ? axidata : _GEN_23; // @[EX_WB.scala 83:21]
  wire [2:0] _GEN_24 = io_axi_r_valid ? 3'h0 : state; // @[EX_WB.scala 90:28 EX_WB.scala 91:15 EX_WB.scala 30:22]
  wire [63:0] _GEN_25 = io_axi_r_valid ? data : _GEN_10; // @[EX_WB.scala 90:28 EX_WB.scala 92:17]
  wire  _T_6 = 3'h4 == state; // @[Conditional.scala 37:30]
  wire [2:0] _GEN_26 = io_axi_aw_ready ? 3'h1 : state; // @[EX_WB.scala 104:31 EX_WB.scala 105:17 EX_WB.scala 30:22]
  wire [2:0] _GEN_27 = io_axi_w_ready ? 3'h2 : _GEN_26; // @[EX_WB.scala 111:30 EX_WB.scala 112:17]
  wire [2:0] _GEN_28 = io_axi_ar_ready ? 3'h3 : state; // @[EX_WB.scala 121:31 EX_WB.scala 122:17 EX_WB.scala 30:22]
  wire [2:0] _GEN_33 = mem_rw ? _GEN_27 : _GEN_28; // @[EX_WB.scala 97:20]
  wire  _GEN_37 = mem_rw ? 1'h0 : 1'h1; // @[EX_WB.scala 97:20 AXI4.scala 72:16 EX_WB.scala 115:25]
  wire [2:0] _GEN_45 = _T_6 ? _GEN_33 : state; // @[Conditional.scala 39:67 EX_WB.scala 30:22]
  wire [2:0] _GEN_54 = _T_5 ? _GEN_24 : _GEN_45; // @[Conditional.scala 39:67]
  wire  _GEN_56 = _T_5 ? 1'h0 : _T_6 & mem_rw; // @[Conditional.scala 39:67 AXI4.scala 67:16]
  wire  _GEN_63 = _T_5 ? 1'h0 : _T_6 & _GEN_37; // @[Conditional.scala 39:67 AXI4.scala 72:16]
  wire  _GEN_69 = _T_4 ? 1'h0 : _T_5; // @[Conditional.scala 39:67 AXI4.scala 74:15]
  wire  _GEN_71 = _T_4 ? 1'h0 : _GEN_56; // @[Conditional.scala 39:67 AXI4.scala 67:16]
  wire  _GEN_78 = _T_4 ? 1'h0 : _GEN_63; // @[Conditional.scala 39:67 AXI4.scala 72:16]
  wire  _GEN_82 = _T_3 | _GEN_71; // @[Conditional.scala 39:67 EX_WB.scala 64:22]
  wire [14:0] _GEN_83 = _T_3 ? _io_axi_w_bits_strb_T : _io_axi_w_bits_strb_T; // @[Conditional.scala 39:67 EX_WB.scala 65:26]
  wire [190:0] _GEN_84 = _T_3 ? _io_axi_w_bits_data_T_1 : _io_axi_w_bits_data_T_1; // @[Conditional.scala 39:67 EX_WB.scala 66:26]
  wire  _GEN_87 = _T_3 ? 1'h0 : _T_4; // @[Conditional.scala 39:67 AXI4.scala 71:15]
  wire  _GEN_88 = _T_3 ? 1'h0 : _GEN_69; // @[Conditional.scala 39:67 AXI4.scala 74:15]
  wire  _GEN_90 = _T_3 ? 1'h0 : _GEN_71; // @[Conditional.scala 39:67 AXI4.scala 67:16]
  wire  _GEN_94 = _T_3 ? 1'h0 : _GEN_78; // @[Conditional.scala 39:67 AXI4.scala 72:16]
  assign io_stall = state != 3'h0; // @[EX_WB.scala 31:21]
  assign io_axi_aw_valid = _T_1 ? 1'h0 : _GEN_90; // @[Conditional.scala 40:58 AXI4.scala 67:16]
  assign io_axi_aw_bits_addr = mem_addr; // @[EX_WB.scala 97:20 EX_WB.scala 100:29]
  assign io_axi_aw_bits_size = mem_wWidth; // @[EX_WB.scala 97:20 EX_WB.scala 102:29]
  assign io_axi_w_valid = _T_1 ? 1'h0 : _GEN_82; // @[Conditional.scala 40:58 AXI4.scala 69:15]
  assign io_axi_w_bits_data = _GEN_84[63:0];
  assign io_axi_w_bits_strb = _GEN_83[7:0];
  assign io_axi_b_ready = _T_1 ? 1'h0 : _GEN_87; // @[Conditional.scala 40:58 AXI4.scala 71:15]
  assign io_axi_ar_valid = _T_1 ? 1'h0 : _GEN_94; // @[Conditional.scala 40:58 AXI4.scala 72:16]
  assign io_axi_ar_bits_addr = mem_addr; // @[EX_WB.scala 97:20 EX_WB.scala 117:29]
  assign io_axi_ar_bits_size = mem_wWidth; // @[EX_WB.scala 97:20 EX_WB.scala 119:29]
  assign io_axi_r_ready = _T_1 ? 1'h0 : _GEN_88; // @[Conditional.scala 40:58 AXI4.scala 74:15]
  assign io_out_valid = io_out_valid_r & ~io_stall; // @[EX_WB.scala 33:62]
  assign io_out_wb_rd = ~io_out_valid ? 5'h0 : wb_rd; // @[Bundle.scala 43:18 Bundle.scala 44:15 EX_WB.scala 40:13]
  assign io_out_wb_data = wb_data; // @[EX_WB.scala 40:13]
  always @(posedge clock) begin
    if (reset) begin // @[EX_WB.scala 30:22]
      state <= 3'h0; // @[EX_WB.scala 30:22]
    end else if (_T_1) begin // @[Conditional.scala 40:58]
      if (io_in_valid & io_in_mem_en) begin // @[EX_WB.scala 58:41]
        state <= 3'h4; // @[EX_WB.scala 59:15]
      end
    end else if (_T_3) begin // @[Conditional.scala 39:67]
      if (io_axi_w_ready) begin // @[EX_WB.scala 68:28]
        state <= 3'h2; // @[EX_WB.scala 69:15]
      end
    end else if (_T_4) begin // @[Conditional.scala 39:67]
      state <= _GEN_19;
    end else begin
      state <= _GEN_54;
    end
    if (reset) begin // @[Reg.scala 27:20]
      io_out_valid_r <= 1'h0; // @[Reg.scala 27:20]
    end else if (_io_out_valid_T) begin // @[Reg.scala 28:19]
      io_out_valid_r <= io_in_valid; // @[Reg.scala 28:23]
    end
    if (_io_out_valid_T) begin // @[Reg.scala 16:19]
      wb_rd <= io_in_wb_rd; // @[Reg.scala 16:23]
    end
    if (_T_1) begin // @[Conditional.scala 40:58]
      wb_data <= _GEN_10;
    end else if (_T_3) begin // @[Conditional.scala 39:67]
      wb_data <= _GEN_10;
    end else if (_T_4) begin // @[Conditional.scala 39:67]
      wb_data <= _GEN_10;
    end else if (_T_5) begin // @[Conditional.scala 39:67]
      wb_data <= _GEN_25;
    end else begin
      wb_data <= _GEN_10;
    end
    if (_T_1) begin // @[Conditional.scala 40:58]
      mem_rw <= io_in_mem_rw; // @[EX_WB.scala 57:11]
    end
    if (_T_1) begin // @[Conditional.scala 40:58]
      mem_unsigned <= io_in_mem_unsigned; // @[EX_WB.scala 57:11]
    end
    if (_T_1) begin // @[Conditional.scala 40:58]
      mem_wWidth <= io_in_mem_wWidth; // @[EX_WB.scala 57:11]
    end
    if (_T_1) begin // @[Conditional.scala 40:58]
      mem_addr <= io_in_mem_addr; // @[EX_WB.scala 57:11]
    end
    if (_T_1) begin // @[Conditional.scala 40:58]
      mem_wdata <= io_in_mem_wdata; // @[EX_WB.scala 57:11]
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
  io_out_valid_r = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  wb_rd = _RAND_2[4:0];
  _RAND_3 = {2{`RANDOM}};
  wb_data = _RAND_3[63:0];
  _RAND_4 = {1{`RANDOM}};
  mem_rw = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  mem_unsigned = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  mem_wWidth = _RAND_6[2:0];
  _RAND_7 = {1{`RANDOM}};
  mem_addr = _RAND_7[31:0];
  _RAND_8 = {2{`RANDOM}};
  mem_wdata = _RAND_8[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210285_WB(
  input         io_in_valid,
  input  [4:0]  io_in_wb_rd,
  input  [63:0] io_in_wb_data,
  output [4:0]  io_reg_wb_rd,
  output [63:0] io_reg_wb_data
);
  assign io_reg_wb_rd = ~io_in_valid ? 5'h0 : io_in_wb_rd; // @[Bundle.scala 43:18 Bundle.scala 44:15 WB.scala 18:13]
  assign io_reg_wb_data = io_in_wb_data; // @[WB.scala 18:13]
endmodule
module ysyx_210285_Clint(
  input         clock,
  input         reset,
  output        io_axi_aw_ready,
  input         io_axi_aw_valid,
  input  [31:0] io_axi_aw_bits_addr,
  output        io_axi_w_ready,
  input         io_axi_w_valid,
  input  [63:0] io_axi_w_bits_data,
  input         io_axi_b_ready,
  output        io_axi_b_valid,
  output        io_axi_ar_ready,
  input         io_axi_ar_valid,
  input  [31:0] io_axi_ar_bits_addr,
  input         io_axi_r_ready,
  output        io_axi_r_valid,
  output [63:0] io_axi_r_bits_data,
  output        io_out_timer_intr
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [63:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] mtime; // @[Clint.scala 23:22]
  wire [63:0] _mtime_T_1 = mtime + 64'h1; // @[Clint.scala 24:18]
  reg [63:0] mtimecmp; // @[Clint.scala 25:25]
  reg  rState; // @[Clint.scala 29:23]
  reg [31:0] rAddr; // @[Clint.scala 30:22]
  wire  _T = ~rState; // @[Conditional.scala 37:30]
  wire  _GEN_2 = io_axi_ar_valid | rState; // @[Clint.scala 33:29 Clint.scala 36:16 Clint.scala 29:23]
  wire  _T_3 = 29'h17ff == rAddr[31:3]; // @[Conditional.scala 37:30]
  reg [1:0] wState; // @[Clint.scala 56:23]
  reg [31:0] wAddr; // @[Clint.scala 57:22]
  reg [63:0] wData; // @[Clint.scala 58:22]
  wire  _T_5 = 2'h0 == wState; // @[Conditional.scala 37:30]
  wire [63:0] _GEN_17 = io_axi_w_valid ? io_axi_w_bits_data : wData; // @[Clint.scala 65:30 Clint.scala 67:17 Clint.scala 58:22]
  wire  _GEN_22 = io_axi_aw_valid & io_axi_w_valid; // @[Clint.scala 61:29 AXI4.scala 77:15]
  wire  _T_6 = 2'h1 == wState; // @[Conditional.scala 37:30]
  wire  _T_7 = 2'h2 == wState; // @[Conditional.scala 37:30]
  wire  _T_9 = 29'h800 == wAddr[31:3]; // @[Conditional.scala 37:30]
  wire [63:0] _GEN_25 = _T_9 ? wData : mtimecmp; // @[Conditional.scala 40:58 Clint.scala 83:20 Clint.scala 25:25]
  wire [1:0] _GEN_26 = io_axi_b_ready ? 2'h0 : wState; // @[Clint.scala 86:28 Clint.scala 87:16 Clint.scala 56:23]
  wire  _GEN_30 = _T_6 & io_axi_w_valid; // @[Conditional.scala 39:67 AXI4.scala 77:15]
  wire  _GEN_33 = _T_6 ? 1'h0 : _T_7; // @[Conditional.scala 39:67 AXI4.scala 78:15]
  assign io_axi_aw_ready = _T_5 & io_axi_aw_valid; // @[Conditional.scala 40:58 AXI4.scala 76:16]
  assign io_axi_w_ready = _T_5 ? _GEN_22 : _GEN_30; // @[Conditional.scala 40:58]
  assign io_axi_b_valid = _T_5 ? 1'h0 : _GEN_33; // @[Conditional.scala 40:58 AXI4.scala 78:15]
  assign io_axi_ar_ready = _T & io_axi_ar_valid; // @[Conditional.scala 40:58 AXI4.scala 80:16]
  assign io_axi_r_valid = _T ? 1'h0 : rState; // @[Conditional.scala 40:58 AXI4.scala 81:15]
  assign io_axi_r_bits_data = _T_3 ? mtime : mtimecmp; // @[Conditional.scala 40:58 Clint.scala 44:30]
  assign io_out_timer_intr = mtime >= mtimecmp; // @[Clint.scala 92:30]
  always @(posedge clock) begin
    if (reset) begin // @[Clint.scala 23:22]
      mtime <= 64'h0; // @[Clint.scala 23:22]
    end else begin
      mtime <= _mtime_T_1; // @[Clint.scala 24:9]
    end
    if (reset) begin // @[Clint.scala 25:25]
      mtimecmp <= 64'h0; // @[Clint.scala 25:25]
    end else if (!(_T_5)) begin // @[Conditional.scala 40:58]
      if (!(_T_6)) begin // @[Conditional.scala 39:67]
        if (_T_7) begin // @[Conditional.scala 39:67]
          mtimecmp <= _GEN_25;
        end
      end
    end
    if (reset) begin // @[Clint.scala 29:23]
      rState <= 1'h0; // @[Clint.scala 29:23]
    end else if (_T) begin // @[Conditional.scala 40:58]
      rState <= _GEN_2;
    end else if (rState) begin // @[Conditional.scala 39:67]
      if (io_axi_r_ready) begin // @[Clint.scala 50:28]
        rState <= 1'h0; // @[Clint.scala 51:16]
      end
    end
    if (reset) begin // @[Clint.scala 30:22]
      rAddr <= 32'h0; // @[Clint.scala 30:22]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (io_axi_ar_valid) begin // @[Clint.scala 33:29]
        rAddr <= io_axi_ar_bits_addr; // @[Clint.scala 35:15]
      end
    end
    if (reset) begin // @[Clint.scala 56:23]
      wState <= 2'h0; // @[Clint.scala 56:23]
    end else if (_T_5) begin // @[Conditional.scala 40:58]
      if (io_axi_aw_valid) begin // @[Clint.scala 61:29]
        if (io_axi_w_valid) begin // @[Clint.scala 65:30]
          wState <= 2'h2; // @[Clint.scala 68:18]
        end else begin
          wState <= 2'h1; // @[Clint.scala 64:16]
        end
      end
    end else if (_T_6) begin // @[Conditional.scala 39:67]
      if (io_axi_w_valid) begin // @[Clint.scala 73:28]
        wState <= 2'h2; // @[Clint.scala 76:16]
      end
    end else if (_T_7) begin // @[Conditional.scala 39:67]
      wState <= _GEN_26;
    end
    if (reset) begin // @[Clint.scala 57:22]
      wAddr <= 32'h0; // @[Clint.scala 57:22]
    end else if (_T_5) begin // @[Conditional.scala 40:58]
      if (io_axi_aw_valid) begin // @[Clint.scala 61:29]
        wAddr <= io_axi_aw_bits_addr; // @[Clint.scala 63:15]
      end
    end
    if (reset) begin // @[Clint.scala 58:22]
      wData <= 64'h0; // @[Clint.scala 58:22]
    end else if (_T_5) begin // @[Conditional.scala 40:58]
      if (io_axi_aw_valid) begin // @[Clint.scala 61:29]
        wData <= _GEN_17;
      end
    end else if (_T_6) begin // @[Conditional.scala 39:67]
      wData <= _GEN_17;
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
  _RAND_2 = {1{`RANDOM}};
  rState = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  rAddr = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  wState = _RAND_4[1:0];
  _RAND_5 = {1{`RANDOM}};
  wAddr = _RAND_5[31:0];
  _RAND_6 = {2{`RANDOM}};
  wData = _RAND_6[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210285_AXI4Arbiter(
  input         clock,
  input         reset,
  output        io_masterPort_0_aw_ready,
  input         io_masterPort_0_aw_valid,
  input  [31:0] io_masterPort_0_aw_bits_addr,
  input  [2:0]  io_masterPort_0_aw_bits_size,
  output        io_masterPort_0_w_ready,
  input         io_masterPort_0_w_valid,
  input  [63:0] io_masterPort_0_w_bits_data,
  input  [7:0]  io_masterPort_0_w_bits_strb,
  input         io_masterPort_0_b_ready,
  output        io_masterPort_0_b_valid,
  output        io_masterPort_0_ar_ready,
  input         io_masterPort_0_ar_valid,
  input  [31:0] io_masterPort_0_ar_bits_addr,
  input  [2:0]  io_masterPort_0_ar_bits_size,
  input         io_masterPort_0_r_ready,
  output        io_masterPort_0_r_valid,
  output [63:0] io_masterPort_0_r_bits_data,
  output        io_masterPort_1_ar_ready,
  input         io_masterPort_1_ar_valid,
  input  [31:0] io_masterPort_1_ar_bits_addr,
  input         io_masterPort_1_r_ready,
  output        io_masterPort_1_r_valid,
  output [63:0] io_masterPort_1_r_bits_data,
  input         io_slavePort_0_aw_ready,
  output        io_slavePort_0_aw_valid,
  output [31:0] io_slavePort_0_aw_bits_addr,
  output [2:0]  io_slavePort_0_aw_bits_size,
  input         io_slavePort_0_w_ready,
  output        io_slavePort_0_w_valid,
  output [63:0] io_slavePort_0_w_bits_data,
  output [7:0]  io_slavePort_0_w_bits_strb,
  output        io_slavePort_0_b_ready,
  input         io_slavePort_0_b_valid,
  input         io_slavePort_0_ar_ready,
  output        io_slavePort_0_ar_valid,
  output [31:0] io_slavePort_0_ar_bits_addr,
  output [2:0]  io_slavePort_0_ar_bits_size,
  output [1:0]  io_slavePort_0_ar_bits_burst,
  output        io_slavePort_0_r_ready,
  input         io_slavePort_0_r_valid,
  input  [63:0] io_slavePort_0_r_bits_data,
  input         io_slavePort_0_r_bits_last,
  input         io_slavePort_1_aw_ready,
  output        io_slavePort_1_aw_valid,
  output [31:0] io_slavePort_1_aw_bits_addr,
  input         io_slavePort_1_w_ready,
  output        io_slavePort_1_w_valid,
  output [63:0] io_slavePort_1_w_bits_data,
  output        io_slavePort_1_b_ready,
  input         io_slavePort_1_b_valid,
  input         io_slavePort_1_ar_ready,
  output        io_slavePort_1_ar_valid,
  output [31:0] io_slavePort_1_ar_bits_addr,
  output        io_slavePort_1_r_ready,
  input         io_slavePort_1_r_valid,
  input  [63:0] io_slavePort_1_r_bits_data
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg  rTrans_valid; // @[AXI4Arbiter.scala 43:23]
  reg  rTrans_bits_src; // @[AXI4Arbiter.scala 43:23]
  reg  rTrans_bits_dst; // @[AXI4Arbiter.scala 43:23]
  wire  rTrans_bits_dst_qual1__1 = 32'h2000000 <= io_masterPort_0_ar_bits_addr & io_masterPort_0_ar_bits_addr <= 32'h200ffff
    ; // @[AXI4Arbiter.scala 30:26]
  wire  rTrans_bits_dst_qual1_1_1 = 32'h2000000 <= io_masterPort_1_ar_bits_addr & io_masterPort_1_ar_bits_addr <= 32'h200ffff
    ; // @[AXI4Arbiter.scala 30:26]
  wire  _GEN_0 = io_masterPort_1_ar_valid | rTrans_valid; // @[AXI4Arbiter.scala 49:43 AXI4Arbiter.scala 50:20 AXI4Arbiter.scala 43:23]
  wire  _GEN_1 = io_masterPort_1_ar_valid | rTrans_bits_src; // @[AXI4Arbiter.scala 49:43 AXI4Arbiter.scala 51:23 AXI4Arbiter.scala 43:23]
  wire  _GEN_3 = io_masterPort_0_ar_valid | _GEN_0; // @[AXI4Arbiter.scala 45:37 AXI4Arbiter.scala 46:20]
  wire [31:0] out_ar_bits_addr = rTrans_bits_src ? io_masterPort_1_ar_bits_addr : io_masterPort_0_ar_bits_addr; // @[AXI4Arbiter.scala 55:12 AXI4Arbiter.scala 55:12]
  wire  _GEN_17 = rTrans_bits_src ? io_masterPort_1_ar_valid : io_masterPort_0_ar_valid; // @[AXI4Arbiter.scala 55:12 AXI4Arbiter.scala 55:12]
  wire  out_ar_ready = rTrans_bits_dst ? io_slavePort_1_ar_ready : io_slavePort_0_ar_ready; // @[AXI4Arbiter.scala 61:36 AXI4Arbiter.scala 61:36]
  wire  _GEN_182 = ~rTrans_bits_src; // @[AXI4Arbiter.scala 55:12 AXI4Arbiter.scala 55:12 AXI4.scala 80:16]
  wire  _GEN_18 = ~rTrans_bits_src & out_ar_ready; // @[AXI4Arbiter.scala 55:12 AXI4Arbiter.scala 55:12 AXI4.scala 80:16]
  wire  _GEN_19 = rTrans_bits_src & out_ar_ready; // @[AXI4Arbiter.scala 55:12 AXI4Arbiter.scala 55:12 AXI4.scala 80:16]
  wire  out_r_bits_last = rTrans_bits_dst | io_slavePort_0_r_bits_last; // @[AXI4Arbiter.scala 64:35 AXI4Arbiter.scala 64:35]
  wire  out_r_valid = rTrans_bits_dst ? io_slavePort_1_r_valid : io_slavePort_0_r_valid; // @[AXI4Arbiter.scala 64:35 AXI4Arbiter.scala 64:35]
  wire  _GEN_28 = _GEN_182 & out_r_valid; // @[AXI4Arbiter.scala 56:11 AXI4Arbiter.scala 56:11 AXI4.scala 81:15]
  wire  _GEN_29 = rTrans_bits_src & out_r_valid; // @[AXI4Arbiter.scala 56:11 AXI4Arbiter.scala 56:11 AXI4.scala 81:15]
  wire  _GEN_31 = rTrans_bits_src ? io_masterPort_1_r_ready : io_masterPort_0_r_ready; // @[AXI4Arbiter.scala 56:11 AXI4Arbiter.scala 56:11]
  wire  out_r_ready = ~rTrans_valid ? 1'h0 : _GEN_31; // @[AXI4Arbiter.scala 44:23 AXI4.scala 74:15 AXI4Arbiter.scala 56:11]
  wire  out_ar_valid = ~rTrans_valid ? 1'h0 : _GEN_17; // @[AXI4Arbiter.scala 44:23 AXI4.scala 72:16 AXI4Arbiter.scala 55:12]
  wire  _GEN_184 = ~rTrans_bits_dst; // @[AXI4Arbiter.scala 61:36 AXI4Arbiter.scala 61:36 AXI4.scala 72:16]
  wire [31:0] _GEN_70 = rTrans_bits_dst ? 32'h2000000 : 32'h0; // @[AXI4Arbiter.scala 63:22 AXI4Arbiter.scala 63:22]
  wire [31:0] _io_slavePort_ar_bits_addr_T_1 = out_ar_bits_addr - _GEN_70; // @[AXI4Arbiter.scala 63:22]
  reg  wTrans_valid; // @[AXI4Arbiter.scala 66:23]
  reg  wTrans_bits_dst; // @[AXI4Arbiter.scala 66:23]
  wire  _GEN_87 = io_masterPort_0_aw_valid | wTrans_valid; // @[AXI4Arbiter.scala 68:37 AXI4Arbiter.scala 69:20]
  wire  wTrans_bits_dst_qual1_1 = 32'h2000000 <= io_masterPort_0_aw_bits_addr & io_masterPort_0_aw_bits_addr <= 32'h200ffff
    ; // @[AXI4Arbiter.scala 78:38]
  wire  out_aw_ready = wTrans_bits_dst ? io_slavePort_1_aw_ready : io_slavePort_0_aw_ready; // @[AXI4Arbiter.scala 91:36 AXI4Arbiter.scala 91:36]
  wire  out_w_ready = wTrans_bits_dst ? io_slavePort_1_w_ready : io_slavePort_0_w_ready; // @[AXI4Arbiter.scala 94:35 AXI4Arbiter.scala 94:35]
  wire  out_b_valid = wTrans_bits_dst ? io_slavePort_1_b_valid : io_slavePort_0_b_valid; // @[AXI4Arbiter.scala 95:35 AXI4Arbiter.scala 95:35]
  wire  out_b_ready = ~wTrans_valid ? 1'h0 : io_masterPort_0_b_ready; // @[AXI4Arbiter.scala 67:23 AXI4.scala 71:15 AXI4Arbiter.scala 86:11]
  wire  out_aw_valid = ~wTrans_valid ? 1'h0 : io_masterPort_0_aw_valid; // @[AXI4Arbiter.scala 67:23 AXI4.scala 67:16 AXI4Arbiter.scala 84:12]
  wire  out_w_valid = ~wTrans_valid ? 1'h0 : io_masterPort_0_w_valid; // @[AXI4Arbiter.scala 67:23 AXI4.scala 69:15 AXI4Arbiter.scala 85:11]
  wire  _GEN_186 = ~wTrans_bits_dst; // @[AXI4Arbiter.scala 91:36 AXI4Arbiter.scala 91:36 AXI4.scala 67:16]
  wire [31:0] _GEN_161 = wTrans_bits_dst ? 32'h2000000 : 32'h0; // @[AXI4Arbiter.scala 93:22 AXI4Arbiter.scala 93:22]
  wire [31:0] _io_slavePort_aw_bits_addr_T_1 = io_masterPort_0_aw_bits_addr - _GEN_161; // @[AXI4Arbiter.scala 93:22]
  assign io_masterPort_0_aw_ready = ~wTrans_valid ? 1'h0 : out_aw_ready; // @[AXI4Arbiter.scala 67:23 AXI4.scala 76:16]
  assign io_masterPort_0_w_ready = ~wTrans_valid ? 1'h0 : out_w_ready; // @[AXI4Arbiter.scala 67:23 AXI4.scala 77:15]
  assign io_masterPort_0_b_valid = ~wTrans_valid ? 1'h0 : out_b_valid; // @[AXI4Arbiter.scala 67:23 AXI4.scala 78:15]
  assign io_masterPort_0_ar_ready = ~rTrans_valid ? 1'h0 : _GEN_18; // @[AXI4Arbiter.scala 44:23 AXI4.scala 80:16]
  assign io_masterPort_0_r_valid = ~rTrans_valid ? 1'h0 : _GEN_28; // @[AXI4Arbiter.scala 44:23 AXI4.scala 81:15]
  assign io_masterPort_0_r_bits_data = rTrans_bits_dst ? io_slavePort_1_r_bits_data : io_slavePort_0_r_bits_data; // @[AXI4Arbiter.scala 64:35 AXI4Arbiter.scala 64:35]
  assign io_masterPort_1_ar_ready = ~rTrans_valid ? 1'h0 : _GEN_19; // @[AXI4Arbiter.scala 44:23 AXI4.scala 80:16]
  assign io_masterPort_1_r_valid = ~rTrans_valid ? 1'h0 : _GEN_29; // @[AXI4Arbiter.scala 44:23 AXI4.scala 81:15]
  assign io_masterPort_1_r_bits_data = rTrans_bits_dst ? io_slavePort_1_r_bits_data : io_slavePort_0_r_bits_data; // @[AXI4Arbiter.scala 64:35 AXI4Arbiter.scala 64:35]
  assign io_slavePort_0_aw_valid = ~wTrans_bits_dst & out_aw_valid; // @[AXI4Arbiter.scala 91:36 AXI4Arbiter.scala 91:36 AXI4.scala 67:16]
  assign io_slavePort_0_aw_bits_addr = ~wTrans_bits_dst ? _io_slavePort_aw_bits_addr_T_1 : io_masterPort_0_aw_bits_addr; // @[AXI4Arbiter.scala 92:46 AXI4Arbiter.scala 92:46]
  assign io_slavePort_0_aw_bits_size = io_masterPort_0_aw_bits_size; // @[AXI4Arbiter.scala 84:12 AXI4Arbiter.scala 84:12]
  assign io_slavePort_0_w_valid = _GEN_186 & out_w_valid; // @[AXI4Arbiter.scala 94:35 AXI4Arbiter.scala 94:35 AXI4.scala 69:15]
  assign io_slavePort_0_w_bits_data = io_masterPort_0_w_bits_data; // @[AXI4Arbiter.scala 85:11 AXI4Arbiter.scala 85:11]
  assign io_slavePort_0_w_bits_strb = io_masterPort_0_w_bits_strb; // @[AXI4Arbiter.scala 85:11 AXI4Arbiter.scala 85:11]
  assign io_slavePort_0_b_ready = _GEN_186 & out_b_ready; // @[AXI4Arbiter.scala 95:35 AXI4Arbiter.scala 95:35 AXI4.scala 71:15]
  assign io_slavePort_0_ar_valid = ~rTrans_bits_dst & out_ar_valid; // @[AXI4Arbiter.scala 61:36 AXI4Arbiter.scala 61:36 AXI4.scala 72:16]
  assign io_slavePort_0_ar_bits_addr = ~rTrans_bits_dst ? _io_slavePort_ar_bits_addr_T_1 : out_ar_bits_addr; // @[AXI4Arbiter.scala 62:46 AXI4Arbiter.scala 62:46]
  assign io_slavePort_0_ar_bits_size = rTrans_bits_src ? 3'h2 : io_masterPort_0_ar_bits_size; // @[AXI4Arbiter.scala 55:12 AXI4Arbiter.scala 55:12]
  assign io_slavePort_0_ar_bits_burst = rTrans_bits_src ? 2'h1 : 2'h0; // @[AXI4Arbiter.scala 55:12 AXI4Arbiter.scala 55:12]
  assign io_slavePort_0_r_ready = _GEN_184 & out_r_ready; // @[AXI4Arbiter.scala 64:35 AXI4Arbiter.scala 64:35 AXI4.scala 74:15]
  assign io_slavePort_1_aw_valid = wTrans_bits_dst & out_aw_valid; // @[AXI4Arbiter.scala 91:36 AXI4Arbiter.scala 91:36 AXI4.scala 67:16]
  assign io_slavePort_1_aw_bits_addr = wTrans_bits_dst ? _io_slavePort_aw_bits_addr_T_1 : io_masterPort_0_aw_bits_addr; // @[AXI4Arbiter.scala 92:46 AXI4Arbiter.scala 92:46]
  assign io_slavePort_1_w_valid = wTrans_bits_dst & out_w_valid; // @[AXI4Arbiter.scala 94:35 AXI4Arbiter.scala 94:35 AXI4.scala 69:15]
  assign io_slavePort_1_w_bits_data = io_masterPort_0_w_bits_data; // @[AXI4Arbiter.scala 85:11 AXI4Arbiter.scala 85:11]
  assign io_slavePort_1_b_ready = wTrans_bits_dst & out_b_ready; // @[AXI4Arbiter.scala 95:35 AXI4Arbiter.scala 95:35 AXI4.scala 71:15]
  assign io_slavePort_1_ar_valid = rTrans_bits_dst & out_ar_valid; // @[AXI4Arbiter.scala 61:36 AXI4Arbiter.scala 61:36 AXI4.scala 72:16]
  assign io_slavePort_1_ar_bits_addr = rTrans_bits_dst ? _io_slavePort_ar_bits_addr_T_1 : out_ar_bits_addr; // @[AXI4Arbiter.scala 62:46 AXI4Arbiter.scala 62:46]
  assign io_slavePort_1_r_ready = rTrans_bits_dst & out_r_ready; // @[AXI4Arbiter.scala 64:35 AXI4Arbiter.scala 64:35 AXI4.scala 74:15]
  always @(posedge clock) begin
    if (reset) begin // @[AXI4Arbiter.scala 43:23]
      rTrans_valid <= 1'h0; // @[AXI4Arbiter.scala 43:23]
    end else if (~rTrans_valid) begin // @[AXI4Arbiter.scala 44:23]
      rTrans_valid <= _GEN_3;
    end else if (out_r_valid & out_r_ready & out_r_bits_last) begin // @[AXI4Arbiter.scala 57:57]
      rTrans_valid <= 1'h0; // @[AXI4Arbiter.scala 58:20]
    end
    if (reset) begin // @[AXI4Arbiter.scala 43:23]
      rTrans_bits_src <= 1'h0; // @[AXI4Arbiter.scala 43:23]
    end else if (~rTrans_valid) begin // @[AXI4Arbiter.scala 44:23]
      if (io_masterPort_0_ar_valid) begin // @[AXI4Arbiter.scala 45:37]
        rTrans_bits_src <= 1'h0; // @[AXI4Arbiter.scala 47:23]
      end else begin
        rTrans_bits_src <= _GEN_1;
      end
    end
    if (reset) begin // @[AXI4Arbiter.scala 43:23]
      rTrans_bits_dst <= 1'h0; // @[AXI4Arbiter.scala 43:23]
    end else if (~rTrans_valid) begin // @[AXI4Arbiter.scala 44:23]
      if (io_masterPort_0_ar_valid) begin // @[AXI4Arbiter.scala 45:37]
        rTrans_bits_dst <= rTrans_bits_dst_qual1__1; // @[AXI4Arbiter.scala 48:23]
      end else if (io_masterPort_1_ar_valid) begin // @[AXI4Arbiter.scala 49:43]
        rTrans_bits_dst <= rTrans_bits_dst_qual1_1_1; // @[AXI4Arbiter.scala 52:23]
      end
    end
    if (reset) begin // @[AXI4Arbiter.scala 66:23]
      wTrans_valid <= 1'h0; // @[AXI4Arbiter.scala 66:23]
    end else if (~wTrans_valid) begin // @[AXI4Arbiter.scala 67:23]
      wTrans_valid <= _GEN_87;
    end else if (out_b_valid & out_b_ready) begin // @[AXI4Arbiter.scala 87:38]
      wTrans_valid <= 1'h0; // @[AXI4Arbiter.scala 88:20]
    end
    if (reset) begin // @[AXI4Arbiter.scala 66:23]
      wTrans_bits_dst <= 1'h0; // @[AXI4Arbiter.scala 66:23]
    end else if (~wTrans_valid) begin // @[AXI4Arbiter.scala 67:23]
      wTrans_bits_dst <= wTrans_bits_dst_qual1_1; // @[AXI4Arbiter.scala 75:21]
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
  rTrans_valid = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  rTrans_bits_src = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  rTrans_bits_dst = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  wTrans_valid = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  wTrans_bits_dst = _RAND_4[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210285_RvCore(
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
  input         io_axi_ar_ready,
  output        io_axi_ar_valid,
  output [31:0] io_axi_ar_bits_addr,
  output [2:0]  io_axi_ar_bits_size,
  output [1:0]  io_axi_ar_bits_burst,
  output        io_axi_r_ready,
  input         io_axi_r_valid,
  input  [63:0] io_axi_r_bits_data,
  input         io_axi_r_bits_last
);
  wire  regs_clock; // @[core.scala 15:20]
  wire  regs_reset; // @[core.scala 15:20]
  wire [4:0] regs_io_rport_raddr_0; // @[core.scala 15:20]
  wire [4:0] regs_io_rport_raddr_1; // @[core.scala 15:20]
  wire [63:0] regs_io_rport_rdata_0; // @[core.scala 15:20]
  wire [63:0] regs_io_rport_rdata_1; // @[core.scala 15:20]
  wire [4:0] regs_io_wb_rd; // @[core.scala 15:20]
  wire [63:0] regs_io_wb_data; // @[core.scala 15:20]
  wire  ifu_clock; // @[core.scala 17:19]
  wire  ifu_reset; // @[core.scala 17:19]
  wire  ifu_io_stall; // @[core.scala 17:19]
  wire  ifu_io_flush; // @[core.scala 17:19]
  wire  ifu_io_in_next_pc_valid; // @[core.scala 17:19]
  wire [63:0] ifu_io_in_next_pc_bits; // @[core.scala 17:19]
  wire  ifu_io_axi_ar_ready; // @[core.scala 17:19]
  wire  ifu_io_axi_ar_valid; // @[core.scala 17:19]
  wire [31:0] ifu_io_axi_ar_bits_addr; // @[core.scala 17:19]
  wire  ifu_io_axi_r_ready; // @[core.scala 17:19]
  wire  ifu_io_axi_r_valid; // @[core.scala 17:19]
  wire [63:0] ifu_io_axi_r_bits_data; // @[core.scala 17:19]
  wire  ifu_io_out_valid; // @[core.scala 17:19]
  wire [63:0] ifu_io_out_pc; // @[core.scala 17:19]
  wire [31:0] ifu_io_out_instr; // @[core.scala 17:19]
  wire [63:0] idu_io_in_pc; // @[core.scala 18:19]
  wire [31:0] idu_io_in_instr; // @[core.scala 18:19]
  wire [4:0] idu_io_reg_io_raddr_0; // @[core.scala 18:19]
  wire [4:0] idu_io_reg_io_raddr_1; // @[core.scala 18:19]
  wire [63:0] idu_io_reg_io_rdata_0; // @[core.scala 18:19]
  wire [63:0] idu_io_reg_io_rdata_1; // @[core.scala 18:19]
  wire  idu_io_out_has_error; // @[core.scala 18:19]
  wire [63:0] idu_io_out_predicted_pc; // @[core.scala 18:19]
  wire [63:0] idu_io_out_commit_pc; // @[core.scala 18:19]
  wire  idu_io_out_ex_is_op32; // @[core.scala 18:19]
  wire  idu_io_out_ex_is_jump; // @[core.scala 18:19]
  wire  idu_io_out_ex_is_branch; // @[core.scala 18:19]
  wire  idu_io_out_ex_is_csr; // @[core.scala 18:19]
  wire  idu_io_out_ex_is_trap; // @[core.scala 18:19]
  wire [3:0] idu_io_out_ex_fn; // @[core.scala 18:19]
  wire [4:0] idu_io_out_ex_rs1; // @[core.scala 18:19]
  wire [4:0] idu_io_out_ex_rs2; // @[core.scala 18:19]
  wire [63:0] idu_io_out_ex_op1; // @[core.scala 18:19]
  wire [63:0] idu_io_out_ex_op2; // @[core.scala 18:19]
  wire  idu_io_out_ex_use_imm; // @[core.scala 18:19]
  wire [63:0] idu_io_out_ex_imm; // @[core.scala 18:19]
  wire [1:0] idu_io_out_ex_csrfn; // @[core.scala 18:19]
  wire  idu_io_out_mem_en; // @[core.scala 18:19]
  wire  idu_io_out_mem_rw; // @[core.scala 18:19]
  wire  idu_io_out_mem_unsigned; // @[core.scala 18:19]
  wire [2:0] idu_io_out_mem_wWidth; // @[core.scala 18:19]
  wire [4:0] idu_io_out_wb_rd; // @[core.scala 18:19]
  wire  id_ex_clock; // @[core.scala 19:21]
  wire  id_ex_reset; // @[core.scala 19:21]
  wire  id_ex_io_stall; // @[core.scala 19:21]
  wire  id_ex_io_in_valid; // @[core.scala 19:21]
  wire [63:0] id_ex_io_in_predicted_pc; // @[core.scala 19:21]
  wire [63:0] id_ex_io_in_commit_pc; // @[core.scala 19:21]
  wire  id_ex_io_in_ex_is_op32; // @[core.scala 19:21]
  wire  id_ex_io_in_ex_is_jump; // @[core.scala 19:21]
  wire  id_ex_io_in_ex_is_branch; // @[core.scala 19:21]
  wire  id_ex_io_in_ex_is_csr; // @[core.scala 19:21]
  wire  id_ex_io_in_ex_is_trap; // @[core.scala 19:21]
  wire [3:0] id_ex_io_in_ex_fn; // @[core.scala 19:21]
  wire [4:0] id_ex_io_in_ex_rs1; // @[core.scala 19:21]
  wire [4:0] id_ex_io_in_ex_rs2; // @[core.scala 19:21]
  wire [63:0] id_ex_io_in_ex_op1; // @[core.scala 19:21]
  wire [63:0] id_ex_io_in_ex_op2; // @[core.scala 19:21]
  wire  id_ex_io_in_ex_use_imm; // @[core.scala 19:21]
  wire [63:0] id_ex_io_in_ex_imm; // @[core.scala 19:21]
  wire [1:0] id_ex_io_in_ex_csrfn; // @[core.scala 19:21]
  wire  id_ex_io_in_mem_en; // @[core.scala 19:21]
  wire  id_ex_io_in_mem_rw; // @[core.scala 19:21]
  wire  id_ex_io_in_mem_unsigned; // @[core.scala 19:21]
  wire [2:0] id_ex_io_in_mem_wWidth; // @[core.scala 19:21]
  wire [4:0] id_ex_io_in_wb_rd; // @[core.scala 19:21]
  wire  id_ex_io_out_valid; // @[core.scala 19:21]
  wire [63:0] id_ex_io_out_predicted_pc; // @[core.scala 19:21]
  wire [63:0] id_ex_io_out_commit_pc; // @[core.scala 19:21]
  wire  id_ex_io_out_ex_is_op32; // @[core.scala 19:21]
  wire  id_ex_io_out_ex_is_jump; // @[core.scala 19:21]
  wire  id_ex_io_out_ex_is_branch; // @[core.scala 19:21]
  wire  id_ex_io_out_ex_is_csr; // @[core.scala 19:21]
  wire  id_ex_io_out_ex_is_trap; // @[core.scala 19:21]
  wire [3:0] id_ex_io_out_ex_fn; // @[core.scala 19:21]
  wire [4:0] id_ex_io_out_ex_rs1; // @[core.scala 19:21]
  wire [4:0] id_ex_io_out_ex_rs2; // @[core.scala 19:21]
  wire [63:0] id_ex_io_out_ex_op1; // @[core.scala 19:21]
  wire [63:0] id_ex_io_out_ex_op2; // @[core.scala 19:21]
  wire  id_ex_io_out_ex_use_imm; // @[core.scala 19:21]
  wire [63:0] id_ex_io_out_ex_imm; // @[core.scala 19:21]
  wire [1:0] id_ex_io_out_ex_csrfn; // @[core.scala 19:21]
  wire  id_ex_io_out_mem_en; // @[core.scala 19:21]
  wire  id_ex_io_out_mem_rw; // @[core.scala 19:21]
  wire  id_ex_io_out_mem_unsigned; // @[core.scala 19:21]
  wire [2:0] id_ex_io_out_mem_wWidth; // @[core.scala 19:21]
  wire [4:0] id_ex_io_out_wb_rd; // @[core.scala 19:21]
  wire  exu_clock; // @[core.scala 20:19]
  wire  exu_reset; // @[core.scala 20:19]
  wire  exu_io_in_valid; // @[core.scala 20:19]
  wire [63:0] exu_io_in_predicted_pc; // @[core.scala 20:19]
  wire [63:0] exu_io_in_commit_pc; // @[core.scala 20:19]
  wire  exu_io_in_ex_is_op32; // @[core.scala 20:19]
  wire  exu_io_in_ex_is_jump; // @[core.scala 20:19]
  wire  exu_io_in_ex_is_branch; // @[core.scala 20:19]
  wire  exu_io_in_ex_is_csr; // @[core.scala 20:19]
  wire  exu_io_in_ex_is_trap; // @[core.scala 20:19]
  wire [3:0] exu_io_in_ex_fn; // @[core.scala 20:19]
  wire [4:0] exu_io_in_ex_rs1; // @[core.scala 20:19]
  wire [4:0] exu_io_in_ex_rs2; // @[core.scala 20:19]
  wire [63:0] exu_io_in_ex_op1; // @[core.scala 20:19]
  wire [63:0] exu_io_in_ex_op2; // @[core.scala 20:19]
  wire  exu_io_in_ex_use_imm; // @[core.scala 20:19]
  wire [63:0] exu_io_in_ex_imm; // @[core.scala 20:19]
  wire [1:0] exu_io_in_ex_csrfn; // @[core.scala 20:19]
  wire  exu_io_in_mem_en; // @[core.scala 20:19]
  wire  exu_io_in_mem_rw; // @[core.scala 20:19]
  wire  exu_io_in_mem_unsigned; // @[core.scala 20:19]
  wire [2:0] exu_io_in_mem_wWidth; // @[core.scala 20:19]
  wire [4:0] exu_io_in_wb_rd; // @[core.scala 20:19]
  wire [4:0] exu_io_forward_0_rd; // @[core.scala 20:19]
  wire [63:0] exu_io_forward_0_data; // @[core.scala 20:19]
  wire  exu_io_timer_intr; // @[core.scala 20:19]
  wire  exu_io_stall; // @[core.scala 20:19]
  wire  exu_io_out_valid; // @[core.scala 20:19]
  wire  exu_io_out_jump_valid; // @[core.scala 20:19]
  wire [63:0] exu_io_out_jump_pc; // @[core.scala 20:19]
  wire  exu_io_out_mem_en; // @[core.scala 20:19]
  wire  exu_io_out_mem_rw; // @[core.scala 20:19]
  wire  exu_io_out_mem_unsigned; // @[core.scala 20:19]
  wire [2:0] exu_io_out_mem_wWidth; // @[core.scala 20:19]
  wire [31:0] exu_io_out_mem_addr; // @[core.scala 20:19]
  wire [63:0] exu_io_out_mem_wdata; // @[core.scala 20:19]
  wire [4:0] exu_io_out_wb_rd; // @[core.scala 20:19]
  wire [63:0] exu_io_out_wb_data; // @[core.scala 20:19]
  wire  ex_wb_clock; // @[core.scala 21:21]
  wire  ex_wb_reset; // @[core.scala 21:21]
  wire  ex_wb_io_stall; // @[core.scala 21:21]
  wire  ex_wb_io_in_valid; // @[core.scala 21:21]
  wire  ex_wb_io_in_mem_en; // @[core.scala 21:21]
  wire  ex_wb_io_in_mem_rw; // @[core.scala 21:21]
  wire  ex_wb_io_in_mem_unsigned; // @[core.scala 21:21]
  wire [2:0] ex_wb_io_in_mem_wWidth; // @[core.scala 21:21]
  wire [31:0] ex_wb_io_in_mem_addr; // @[core.scala 21:21]
  wire [63:0] ex_wb_io_in_mem_wdata; // @[core.scala 21:21]
  wire [4:0] ex_wb_io_in_wb_rd; // @[core.scala 21:21]
  wire [63:0] ex_wb_io_in_wb_data; // @[core.scala 21:21]
  wire  ex_wb_io_axi_aw_ready; // @[core.scala 21:21]
  wire  ex_wb_io_axi_aw_valid; // @[core.scala 21:21]
  wire [31:0] ex_wb_io_axi_aw_bits_addr; // @[core.scala 21:21]
  wire [2:0] ex_wb_io_axi_aw_bits_size; // @[core.scala 21:21]
  wire  ex_wb_io_axi_w_ready; // @[core.scala 21:21]
  wire  ex_wb_io_axi_w_valid; // @[core.scala 21:21]
  wire [63:0] ex_wb_io_axi_w_bits_data; // @[core.scala 21:21]
  wire [7:0] ex_wb_io_axi_w_bits_strb; // @[core.scala 21:21]
  wire  ex_wb_io_axi_b_ready; // @[core.scala 21:21]
  wire  ex_wb_io_axi_b_valid; // @[core.scala 21:21]
  wire  ex_wb_io_axi_ar_ready; // @[core.scala 21:21]
  wire  ex_wb_io_axi_ar_valid; // @[core.scala 21:21]
  wire [31:0] ex_wb_io_axi_ar_bits_addr; // @[core.scala 21:21]
  wire [2:0] ex_wb_io_axi_ar_bits_size; // @[core.scala 21:21]
  wire  ex_wb_io_axi_r_ready; // @[core.scala 21:21]
  wire  ex_wb_io_axi_r_valid; // @[core.scala 21:21]
  wire [63:0] ex_wb_io_axi_r_bits_data; // @[core.scala 21:21]
  wire  ex_wb_io_out_valid; // @[core.scala 21:21]
  wire [4:0] ex_wb_io_out_wb_rd; // @[core.scala 21:21]
  wire [63:0] ex_wb_io_out_wb_data; // @[core.scala 21:21]
  wire  wbu_io_in_valid; // @[core.scala 22:19]
  wire [4:0] wbu_io_in_wb_rd; // @[core.scala 22:19]
  wire [63:0] wbu_io_in_wb_data; // @[core.scala 22:19]
  wire [4:0] wbu_io_reg_wb_rd; // @[core.scala 22:19]
  wire [63:0] wbu_io_reg_wb_data; // @[core.scala 22:19]
  wire  clint_clock; // @[core.scala 24:21]
  wire  clint_reset; // @[core.scala 24:21]
  wire  clint_io_axi_aw_ready; // @[core.scala 24:21]
  wire  clint_io_axi_aw_valid; // @[core.scala 24:21]
  wire [31:0] clint_io_axi_aw_bits_addr; // @[core.scala 24:21]
  wire  clint_io_axi_w_ready; // @[core.scala 24:21]
  wire  clint_io_axi_w_valid; // @[core.scala 24:21]
  wire [63:0] clint_io_axi_w_bits_data; // @[core.scala 24:21]
  wire  clint_io_axi_b_ready; // @[core.scala 24:21]
  wire  clint_io_axi_b_valid; // @[core.scala 24:21]
  wire  clint_io_axi_ar_ready; // @[core.scala 24:21]
  wire  clint_io_axi_ar_valid; // @[core.scala 24:21]
  wire [31:0] clint_io_axi_ar_bits_addr; // @[core.scala 24:21]
  wire  clint_io_axi_r_ready; // @[core.scala 24:21]
  wire  clint_io_axi_r_valid; // @[core.scala 24:21]
  wire [63:0] clint_io_axi_r_bits_data; // @[core.scala 24:21]
  wire  clint_io_out_timer_intr; // @[core.scala 24:21]
  wire  axi_arbiter_clock; // @[core.scala 26:27]
  wire  axi_arbiter_reset; // @[core.scala 26:27]
  wire  axi_arbiter_io_masterPort_0_aw_ready; // @[core.scala 26:27]
  wire  axi_arbiter_io_masterPort_0_aw_valid; // @[core.scala 26:27]
  wire [31:0] axi_arbiter_io_masterPort_0_aw_bits_addr; // @[core.scala 26:27]
  wire [2:0] axi_arbiter_io_masterPort_0_aw_bits_size; // @[core.scala 26:27]
  wire  axi_arbiter_io_masterPort_0_w_ready; // @[core.scala 26:27]
  wire  axi_arbiter_io_masterPort_0_w_valid; // @[core.scala 26:27]
  wire [63:0] axi_arbiter_io_masterPort_0_w_bits_data; // @[core.scala 26:27]
  wire [7:0] axi_arbiter_io_masterPort_0_w_bits_strb; // @[core.scala 26:27]
  wire  axi_arbiter_io_masterPort_0_b_ready; // @[core.scala 26:27]
  wire  axi_arbiter_io_masterPort_0_b_valid; // @[core.scala 26:27]
  wire  axi_arbiter_io_masterPort_0_ar_ready; // @[core.scala 26:27]
  wire  axi_arbiter_io_masterPort_0_ar_valid; // @[core.scala 26:27]
  wire [31:0] axi_arbiter_io_masterPort_0_ar_bits_addr; // @[core.scala 26:27]
  wire [2:0] axi_arbiter_io_masterPort_0_ar_bits_size; // @[core.scala 26:27]
  wire  axi_arbiter_io_masterPort_0_r_ready; // @[core.scala 26:27]
  wire  axi_arbiter_io_masterPort_0_r_valid; // @[core.scala 26:27]
  wire [63:0] axi_arbiter_io_masterPort_0_r_bits_data; // @[core.scala 26:27]
  wire  axi_arbiter_io_masterPort_1_ar_ready; // @[core.scala 26:27]
  wire  axi_arbiter_io_masterPort_1_ar_valid; // @[core.scala 26:27]
  wire [31:0] axi_arbiter_io_masterPort_1_ar_bits_addr; // @[core.scala 26:27]
  wire  axi_arbiter_io_masterPort_1_r_ready; // @[core.scala 26:27]
  wire  axi_arbiter_io_masterPort_1_r_valid; // @[core.scala 26:27]
  wire [63:0] axi_arbiter_io_masterPort_1_r_bits_data; // @[core.scala 26:27]
  wire  axi_arbiter_io_slavePort_0_aw_ready; // @[core.scala 26:27]
  wire  axi_arbiter_io_slavePort_0_aw_valid; // @[core.scala 26:27]
  wire [31:0] axi_arbiter_io_slavePort_0_aw_bits_addr; // @[core.scala 26:27]
  wire [2:0] axi_arbiter_io_slavePort_0_aw_bits_size; // @[core.scala 26:27]
  wire  axi_arbiter_io_slavePort_0_w_ready; // @[core.scala 26:27]
  wire  axi_arbiter_io_slavePort_0_w_valid; // @[core.scala 26:27]
  wire [63:0] axi_arbiter_io_slavePort_0_w_bits_data; // @[core.scala 26:27]
  wire [7:0] axi_arbiter_io_slavePort_0_w_bits_strb; // @[core.scala 26:27]
  wire  axi_arbiter_io_slavePort_0_b_ready; // @[core.scala 26:27]
  wire  axi_arbiter_io_slavePort_0_b_valid; // @[core.scala 26:27]
  wire  axi_arbiter_io_slavePort_0_ar_ready; // @[core.scala 26:27]
  wire  axi_arbiter_io_slavePort_0_ar_valid; // @[core.scala 26:27]
  wire [31:0] axi_arbiter_io_slavePort_0_ar_bits_addr; // @[core.scala 26:27]
  wire [2:0] axi_arbiter_io_slavePort_0_ar_bits_size; // @[core.scala 26:27]
  wire [1:0] axi_arbiter_io_slavePort_0_ar_bits_burst; // @[core.scala 26:27]
  wire  axi_arbiter_io_slavePort_0_r_ready; // @[core.scala 26:27]
  wire  axi_arbiter_io_slavePort_0_r_valid; // @[core.scala 26:27]
  wire [63:0] axi_arbiter_io_slavePort_0_r_bits_data; // @[core.scala 26:27]
  wire  axi_arbiter_io_slavePort_0_r_bits_last; // @[core.scala 26:27]
  wire  axi_arbiter_io_slavePort_1_aw_ready; // @[core.scala 26:27]
  wire  axi_arbiter_io_slavePort_1_aw_valid; // @[core.scala 26:27]
  wire [31:0] axi_arbiter_io_slavePort_1_aw_bits_addr; // @[core.scala 26:27]
  wire  axi_arbiter_io_slavePort_1_w_ready; // @[core.scala 26:27]
  wire  axi_arbiter_io_slavePort_1_w_valid; // @[core.scala 26:27]
  wire [63:0] axi_arbiter_io_slavePort_1_w_bits_data; // @[core.scala 26:27]
  wire  axi_arbiter_io_slavePort_1_b_ready; // @[core.scala 26:27]
  wire  axi_arbiter_io_slavePort_1_b_valid; // @[core.scala 26:27]
  wire  axi_arbiter_io_slavePort_1_ar_ready; // @[core.scala 26:27]
  wire  axi_arbiter_io_slavePort_1_ar_valid; // @[core.scala 26:27]
  wire [31:0] axi_arbiter_io_slavePort_1_ar_bits_addr; // @[core.scala 26:27]
  wire  axi_arbiter_io_slavePort_1_r_ready; // @[core.scala 26:27]
  wire  axi_arbiter_io_slavePort_1_r_valid; // @[core.scala 26:27]
  wire [63:0] axi_arbiter_io_slavePort_1_r_bits_data; // @[core.scala 26:27]
  wire  stall = ex_wb_io_stall; // @[core.scala 30:19 core.scala 33:9]
  wire  _GEN_0 = ifu_io_out_valid; // @[core.scala 40:28 core.scala 41:21 core.scala 37:17]
  wire [63:0] _GEN_1 = idu_io_out_predicted_pc; // @[core.scala 40:28 core.scala 42:20]
  wire  _GEN_2 = exu_io_out_jump_valid | _GEN_0; // @[core.scala 44:33 core.scala 45:21]
  wire  _T_1 = ifu_io_out_valid & idu_io_out_has_error; // @[core.scala 79:22]
  ysyx_210285_RegFile regs ( // @[core.scala 15:20]
    .clock(regs_clock),
    .reset(regs_reset),
    .io_rport_raddr_0(regs_io_rport_raddr_0),
    .io_rport_raddr_1(regs_io_rport_raddr_1),
    .io_rport_rdata_0(regs_io_rport_rdata_0),
    .io_rport_rdata_1(regs_io_rport_rdata_1),
    .io_wb_rd(regs_io_wb_rd),
    .io_wb_data(regs_io_wb_data)
  );
  ysyx_210285_IF ifu ( // @[core.scala 17:19]
    .clock(ifu_clock),
    .reset(ifu_reset),
    .io_stall(ifu_io_stall),
    .io_flush(ifu_io_flush),
    .io_in_next_pc_valid(ifu_io_in_next_pc_valid),
    .io_in_next_pc_bits(ifu_io_in_next_pc_bits),
    .io_axi_ar_ready(ifu_io_axi_ar_ready),
    .io_axi_ar_valid(ifu_io_axi_ar_valid),
    .io_axi_ar_bits_addr(ifu_io_axi_ar_bits_addr),
    .io_axi_r_ready(ifu_io_axi_r_ready),
    .io_axi_r_valid(ifu_io_axi_r_valid),
    .io_axi_r_bits_data(ifu_io_axi_r_bits_data),
    .io_out_valid(ifu_io_out_valid),
    .io_out_pc(ifu_io_out_pc),
    .io_out_instr(ifu_io_out_instr)
  );
  ysyx_210285_ID idu ( // @[core.scala 18:19]
    .io_in_pc(idu_io_in_pc),
    .io_in_instr(idu_io_in_instr),
    .io_reg_io_raddr_0(idu_io_reg_io_raddr_0),
    .io_reg_io_raddr_1(idu_io_reg_io_raddr_1),
    .io_reg_io_rdata_0(idu_io_reg_io_rdata_0),
    .io_reg_io_rdata_1(idu_io_reg_io_rdata_1),
    .io_out_has_error(idu_io_out_has_error),
    .io_out_predicted_pc(idu_io_out_predicted_pc),
    .io_out_commit_pc(idu_io_out_commit_pc),
    .io_out_ex_is_op32(idu_io_out_ex_is_op32),
    .io_out_ex_is_jump(idu_io_out_ex_is_jump),
    .io_out_ex_is_branch(idu_io_out_ex_is_branch),
    .io_out_ex_is_csr(idu_io_out_ex_is_csr),
    .io_out_ex_is_trap(idu_io_out_ex_is_trap),
    .io_out_ex_fn(idu_io_out_ex_fn),
    .io_out_ex_rs1(idu_io_out_ex_rs1),
    .io_out_ex_rs2(idu_io_out_ex_rs2),
    .io_out_ex_op1(idu_io_out_ex_op1),
    .io_out_ex_op2(idu_io_out_ex_op2),
    .io_out_ex_use_imm(idu_io_out_ex_use_imm),
    .io_out_ex_imm(idu_io_out_ex_imm),
    .io_out_ex_csrfn(idu_io_out_ex_csrfn),
    .io_out_mem_en(idu_io_out_mem_en),
    .io_out_mem_rw(idu_io_out_mem_rw),
    .io_out_mem_unsigned(idu_io_out_mem_unsigned),
    .io_out_mem_wWidth(idu_io_out_mem_wWidth),
    .io_out_wb_rd(idu_io_out_wb_rd)
  );
  ysyx_210285_ID_EX id_ex ( // @[core.scala 19:21]
    .clock(id_ex_clock),
    .reset(id_ex_reset),
    .io_stall(id_ex_io_stall),
    .io_in_valid(id_ex_io_in_valid),
    .io_in_predicted_pc(id_ex_io_in_predicted_pc),
    .io_in_commit_pc(id_ex_io_in_commit_pc),
    .io_in_ex_is_op32(id_ex_io_in_ex_is_op32),
    .io_in_ex_is_jump(id_ex_io_in_ex_is_jump),
    .io_in_ex_is_branch(id_ex_io_in_ex_is_branch),
    .io_in_ex_is_csr(id_ex_io_in_ex_is_csr),
    .io_in_ex_is_trap(id_ex_io_in_ex_is_trap),
    .io_in_ex_fn(id_ex_io_in_ex_fn),
    .io_in_ex_rs1(id_ex_io_in_ex_rs1),
    .io_in_ex_rs2(id_ex_io_in_ex_rs2),
    .io_in_ex_op1(id_ex_io_in_ex_op1),
    .io_in_ex_op2(id_ex_io_in_ex_op2),
    .io_in_ex_use_imm(id_ex_io_in_ex_use_imm),
    .io_in_ex_imm(id_ex_io_in_ex_imm),
    .io_in_ex_csrfn(id_ex_io_in_ex_csrfn),
    .io_in_mem_en(id_ex_io_in_mem_en),
    .io_in_mem_rw(id_ex_io_in_mem_rw),
    .io_in_mem_unsigned(id_ex_io_in_mem_unsigned),
    .io_in_mem_wWidth(id_ex_io_in_mem_wWidth),
    .io_in_wb_rd(id_ex_io_in_wb_rd),
    .io_out_valid(id_ex_io_out_valid),
    .io_out_predicted_pc(id_ex_io_out_predicted_pc),
    .io_out_commit_pc(id_ex_io_out_commit_pc),
    .io_out_ex_is_op32(id_ex_io_out_ex_is_op32),
    .io_out_ex_is_jump(id_ex_io_out_ex_is_jump),
    .io_out_ex_is_branch(id_ex_io_out_ex_is_branch),
    .io_out_ex_is_csr(id_ex_io_out_ex_is_csr),
    .io_out_ex_is_trap(id_ex_io_out_ex_is_trap),
    .io_out_ex_fn(id_ex_io_out_ex_fn),
    .io_out_ex_rs1(id_ex_io_out_ex_rs1),
    .io_out_ex_rs2(id_ex_io_out_ex_rs2),
    .io_out_ex_op1(id_ex_io_out_ex_op1),
    .io_out_ex_op2(id_ex_io_out_ex_op2),
    .io_out_ex_use_imm(id_ex_io_out_ex_use_imm),
    .io_out_ex_imm(id_ex_io_out_ex_imm),
    .io_out_ex_csrfn(id_ex_io_out_ex_csrfn),
    .io_out_mem_en(id_ex_io_out_mem_en),
    .io_out_mem_rw(id_ex_io_out_mem_rw),
    .io_out_mem_unsigned(id_ex_io_out_mem_unsigned),
    .io_out_mem_wWidth(id_ex_io_out_mem_wWidth),
    .io_out_wb_rd(id_ex_io_out_wb_rd)
  );
  ysyx_210285_EX exu ( // @[core.scala 20:19]
    .clock(exu_clock),
    .reset(exu_reset),
    .io_in_valid(exu_io_in_valid),
    .io_in_predicted_pc(exu_io_in_predicted_pc),
    .io_in_commit_pc(exu_io_in_commit_pc),
    .io_in_ex_is_op32(exu_io_in_ex_is_op32),
    .io_in_ex_is_jump(exu_io_in_ex_is_jump),
    .io_in_ex_is_branch(exu_io_in_ex_is_branch),
    .io_in_ex_is_csr(exu_io_in_ex_is_csr),
    .io_in_ex_is_trap(exu_io_in_ex_is_trap),
    .io_in_ex_fn(exu_io_in_ex_fn),
    .io_in_ex_rs1(exu_io_in_ex_rs1),
    .io_in_ex_rs2(exu_io_in_ex_rs2),
    .io_in_ex_op1(exu_io_in_ex_op1),
    .io_in_ex_op2(exu_io_in_ex_op2),
    .io_in_ex_use_imm(exu_io_in_ex_use_imm),
    .io_in_ex_imm(exu_io_in_ex_imm),
    .io_in_ex_csrfn(exu_io_in_ex_csrfn),
    .io_in_mem_en(exu_io_in_mem_en),
    .io_in_mem_rw(exu_io_in_mem_rw),
    .io_in_mem_unsigned(exu_io_in_mem_unsigned),
    .io_in_mem_wWidth(exu_io_in_mem_wWidth),
    .io_in_wb_rd(exu_io_in_wb_rd),
    .io_forward_0_rd(exu_io_forward_0_rd),
    .io_forward_0_data(exu_io_forward_0_data),
    .io_timer_intr(exu_io_timer_intr),
    .io_stall(exu_io_stall),
    .io_out_valid(exu_io_out_valid),
    .io_out_jump_valid(exu_io_out_jump_valid),
    .io_out_jump_pc(exu_io_out_jump_pc),
    .io_out_mem_en(exu_io_out_mem_en),
    .io_out_mem_rw(exu_io_out_mem_rw),
    .io_out_mem_unsigned(exu_io_out_mem_unsigned),
    .io_out_mem_wWidth(exu_io_out_mem_wWidth),
    .io_out_mem_addr(exu_io_out_mem_addr),
    .io_out_mem_wdata(exu_io_out_mem_wdata),
    .io_out_wb_rd(exu_io_out_wb_rd),
    .io_out_wb_data(exu_io_out_wb_data)
  );
  ysyx_210285_EX_WB ex_wb ( // @[core.scala 21:21]
    .clock(ex_wb_clock),
    .reset(ex_wb_reset),
    .io_stall(ex_wb_io_stall),
    .io_in_valid(ex_wb_io_in_valid),
    .io_in_mem_en(ex_wb_io_in_mem_en),
    .io_in_mem_rw(ex_wb_io_in_mem_rw),
    .io_in_mem_unsigned(ex_wb_io_in_mem_unsigned),
    .io_in_mem_wWidth(ex_wb_io_in_mem_wWidth),
    .io_in_mem_addr(ex_wb_io_in_mem_addr),
    .io_in_mem_wdata(ex_wb_io_in_mem_wdata),
    .io_in_wb_rd(ex_wb_io_in_wb_rd),
    .io_in_wb_data(ex_wb_io_in_wb_data),
    .io_axi_aw_ready(ex_wb_io_axi_aw_ready),
    .io_axi_aw_valid(ex_wb_io_axi_aw_valid),
    .io_axi_aw_bits_addr(ex_wb_io_axi_aw_bits_addr),
    .io_axi_aw_bits_size(ex_wb_io_axi_aw_bits_size),
    .io_axi_w_ready(ex_wb_io_axi_w_ready),
    .io_axi_w_valid(ex_wb_io_axi_w_valid),
    .io_axi_w_bits_data(ex_wb_io_axi_w_bits_data),
    .io_axi_w_bits_strb(ex_wb_io_axi_w_bits_strb),
    .io_axi_b_ready(ex_wb_io_axi_b_ready),
    .io_axi_b_valid(ex_wb_io_axi_b_valid),
    .io_axi_ar_ready(ex_wb_io_axi_ar_ready),
    .io_axi_ar_valid(ex_wb_io_axi_ar_valid),
    .io_axi_ar_bits_addr(ex_wb_io_axi_ar_bits_addr),
    .io_axi_ar_bits_size(ex_wb_io_axi_ar_bits_size),
    .io_axi_r_ready(ex_wb_io_axi_r_ready),
    .io_axi_r_valid(ex_wb_io_axi_r_valid),
    .io_axi_r_bits_data(ex_wb_io_axi_r_bits_data),
    .io_out_valid(ex_wb_io_out_valid),
    .io_out_wb_rd(ex_wb_io_out_wb_rd),
    .io_out_wb_data(ex_wb_io_out_wb_data)
  );
  ysyx_210285_WB wbu ( // @[core.scala 22:19]
    .io_in_valid(wbu_io_in_valid),
    .io_in_wb_rd(wbu_io_in_wb_rd),
    .io_in_wb_data(wbu_io_in_wb_data),
    .io_reg_wb_rd(wbu_io_reg_wb_rd),
    .io_reg_wb_data(wbu_io_reg_wb_data)
  );
  ysyx_210285_Clint clint ( // @[core.scala 24:21]
    .clock(clint_clock),
    .reset(clint_reset),
    .io_axi_aw_ready(clint_io_axi_aw_ready),
    .io_axi_aw_valid(clint_io_axi_aw_valid),
    .io_axi_aw_bits_addr(clint_io_axi_aw_bits_addr),
    .io_axi_w_ready(clint_io_axi_w_ready),
    .io_axi_w_valid(clint_io_axi_w_valid),
    .io_axi_w_bits_data(clint_io_axi_w_bits_data),
    .io_axi_b_ready(clint_io_axi_b_ready),
    .io_axi_b_valid(clint_io_axi_b_valid),
    .io_axi_ar_ready(clint_io_axi_ar_ready),
    .io_axi_ar_valid(clint_io_axi_ar_valid),
    .io_axi_ar_bits_addr(clint_io_axi_ar_bits_addr),
    .io_axi_r_ready(clint_io_axi_r_ready),
    .io_axi_r_valid(clint_io_axi_r_valid),
    .io_axi_r_bits_data(clint_io_axi_r_bits_data),
    .io_out_timer_intr(clint_io_out_timer_intr)
  );
  ysyx_210285_AXI4Arbiter axi_arbiter ( // @[core.scala 26:27]
    .clock(axi_arbiter_clock),
    .reset(axi_arbiter_reset),
    .io_masterPort_0_aw_ready(axi_arbiter_io_masterPort_0_aw_ready),
    .io_masterPort_0_aw_valid(axi_arbiter_io_masterPort_0_aw_valid),
    .io_masterPort_0_aw_bits_addr(axi_arbiter_io_masterPort_0_aw_bits_addr),
    .io_masterPort_0_aw_bits_size(axi_arbiter_io_masterPort_0_aw_bits_size),
    .io_masterPort_0_w_ready(axi_arbiter_io_masterPort_0_w_ready),
    .io_masterPort_0_w_valid(axi_arbiter_io_masterPort_0_w_valid),
    .io_masterPort_0_w_bits_data(axi_arbiter_io_masterPort_0_w_bits_data),
    .io_masterPort_0_w_bits_strb(axi_arbiter_io_masterPort_0_w_bits_strb),
    .io_masterPort_0_b_ready(axi_arbiter_io_masterPort_0_b_ready),
    .io_masterPort_0_b_valid(axi_arbiter_io_masterPort_0_b_valid),
    .io_masterPort_0_ar_ready(axi_arbiter_io_masterPort_0_ar_ready),
    .io_masterPort_0_ar_valid(axi_arbiter_io_masterPort_0_ar_valid),
    .io_masterPort_0_ar_bits_addr(axi_arbiter_io_masterPort_0_ar_bits_addr),
    .io_masterPort_0_ar_bits_size(axi_arbiter_io_masterPort_0_ar_bits_size),
    .io_masterPort_0_r_ready(axi_arbiter_io_masterPort_0_r_ready),
    .io_masterPort_0_r_valid(axi_arbiter_io_masterPort_0_r_valid),
    .io_masterPort_0_r_bits_data(axi_arbiter_io_masterPort_0_r_bits_data),
    .io_masterPort_1_ar_ready(axi_arbiter_io_masterPort_1_ar_ready),
    .io_masterPort_1_ar_valid(axi_arbiter_io_masterPort_1_ar_valid),
    .io_masterPort_1_ar_bits_addr(axi_arbiter_io_masterPort_1_ar_bits_addr),
    .io_masterPort_1_r_ready(axi_arbiter_io_masterPort_1_r_ready),
    .io_masterPort_1_r_valid(axi_arbiter_io_masterPort_1_r_valid),
    .io_masterPort_1_r_bits_data(axi_arbiter_io_masterPort_1_r_bits_data),
    .io_slavePort_0_aw_ready(axi_arbiter_io_slavePort_0_aw_ready),
    .io_slavePort_0_aw_valid(axi_arbiter_io_slavePort_0_aw_valid),
    .io_slavePort_0_aw_bits_addr(axi_arbiter_io_slavePort_0_aw_bits_addr),
    .io_slavePort_0_aw_bits_size(axi_arbiter_io_slavePort_0_aw_bits_size),
    .io_slavePort_0_w_ready(axi_arbiter_io_slavePort_0_w_ready),
    .io_slavePort_0_w_valid(axi_arbiter_io_slavePort_0_w_valid),
    .io_slavePort_0_w_bits_data(axi_arbiter_io_slavePort_0_w_bits_data),
    .io_slavePort_0_w_bits_strb(axi_arbiter_io_slavePort_0_w_bits_strb),
    .io_slavePort_0_b_ready(axi_arbiter_io_slavePort_0_b_ready),
    .io_slavePort_0_b_valid(axi_arbiter_io_slavePort_0_b_valid),
    .io_slavePort_0_ar_ready(axi_arbiter_io_slavePort_0_ar_ready),
    .io_slavePort_0_ar_valid(axi_arbiter_io_slavePort_0_ar_valid),
    .io_slavePort_0_ar_bits_addr(axi_arbiter_io_slavePort_0_ar_bits_addr),
    .io_slavePort_0_ar_bits_size(axi_arbiter_io_slavePort_0_ar_bits_size),
    .io_slavePort_0_ar_bits_burst(axi_arbiter_io_slavePort_0_ar_bits_burst),
    .io_slavePort_0_r_ready(axi_arbiter_io_slavePort_0_r_ready),
    .io_slavePort_0_r_valid(axi_arbiter_io_slavePort_0_r_valid),
    .io_slavePort_0_r_bits_data(axi_arbiter_io_slavePort_0_r_bits_data),
    .io_slavePort_0_r_bits_last(axi_arbiter_io_slavePort_0_r_bits_last),
    .io_slavePort_1_aw_ready(axi_arbiter_io_slavePort_1_aw_ready),
    .io_slavePort_1_aw_valid(axi_arbiter_io_slavePort_1_aw_valid),
    .io_slavePort_1_aw_bits_addr(axi_arbiter_io_slavePort_1_aw_bits_addr),
    .io_slavePort_1_w_ready(axi_arbiter_io_slavePort_1_w_ready),
    .io_slavePort_1_w_valid(axi_arbiter_io_slavePort_1_w_valid),
    .io_slavePort_1_w_bits_data(axi_arbiter_io_slavePort_1_w_bits_data),
    .io_slavePort_1_b_ready(axi_arbiter_io_slavePort_1_b_ready),
    .io_slavePort_1_b_valid(axi_arbiter_io_slavePort_1_b_valid),
    .io_slavePort_1_ar_ready(axi_arbiter_io_slavePort_1_ar_ready),
    .io_slavePort_1_ar_valid(axi_arbiter_io_slavePort_1_ar_valid),
    .io_slavePort_1_ar_bits_addr(axi_arbiter_io_slavePort_1_ar_bits_addr),
    .io_slavePort_1_r_ready(axi_arbiter_io_slavePort_1_r_ready),
    .io_slavePort_1_r_valid(axi_arbiter_io_slavePort_1_r_valid),
    .io_slavePort_1_r_bits_data(axi_arbiter_io_slavePort_1_r_bits_data)
  );
  assign io_axi_aw_valid = axi_arbiter_io_slavePort_0_aw_valid; // @[core.scala 27:31]
  assign io_axi_aw_bits_addr = axi_arbiter_io_slavePort_0_aw_bits_addr; // @[core.scala 27:31]
  assign io_axi_aw_bits_size = axi_arbiter_io_slavePort_0_aw_bits_size; // @[core.scala 27:31]
  assign io_axi_w_valid = axi_arbiter_io_slavePort_0_w_valid; // @[core.scala 27:31]
  assign io_axi_w_bits_data = axi_arbiter_io_slavePort_0_w_bits_data; // @[core.scala 27:31]
  assign io_axi_w_bits_strb = axi_arbiter_io_slavePort_0_w_bits_strb; // @[core.scala 27:31]
  assign io_axi_b_ready = axi_arbiter_io_slavePort_0_b_ready; // @[core.scala 27:31]
  assign io_axi_ar_valid = axi_arbiter_io_slavePort_0_ar_valid; // @[core.scala 27:31]
  assign io_axi_ar_bits_addr = axi_arbiter_io_slavePort_0_ar_bits_addr; // @[core.scala 27:31]
  assign io_axi_ar_bits_size = axi_arbiter_io_slavePort_0_ar_bits_size; // @[core.scala 27:31]
  assign io_axi_ar_bits_burst = axi_arbiter_io_slavePort_0_ar_bits_burst; // @[core.scala 27:31]
  assign io_axi_r_ready = axi_arbiter_io_slavePort_0_r_ready; // @[core.scala 27:31]
  assign regs_clock = clock;
  assign regs_reset = reset;
  assign regs_io_rport_raddr_0 = idu_io_reg_io_raddr_0; // @[core.scala 60:17]
  assign regs_io_rport_raddr_1 = idu_io_reg_io_raddr_1; // @[core.scala 60:17]
  assign regs_io_wb_rd = wbu_io_reg_wb_rd; // @[core.scala 120:14]
  assign regs_io_wb_data = wbu_io_reg_wb_data; // @[core.scala 120:14]
  assign ifu_clock = clock;
  assign ifu_reset = reset;
  assign ifu_io_stall = ex_wb_io_stall; // @[core.scala 30:19 core.scala 33:9]
  assign ifu_io_flush = exu_io_out_jump_valid; // @[core.scala 31:19 core.scala 34:9]
  assign ifu_io_in_next_pc_valid = ~stall & _GEN_2; // @[core.scala 39:16 core.scala 37:17]
  assign ifu_io_in_next_pc_bits = exu_io_out_jump_valid ? exu_io_out_jump_pc : _GEN_1; // @[core.scala 44:33 core.scala 46:20]
  assign ifu_io_axi_ar_ready = axi_arbiter_io_masterPort_1_ar_ready; // @[core.scala 56:32]
  assign ifu_io_axi_r_valid = axi_arbiter_io_masterPort_1_r_valid; // @[core.scala 56:32]
  assign ifu_io_axi_r_bits_data = axi_arbiter_io_masterPort_1_r_bits_data; // @[core.scala 56:32]
  assign idu_io_in_pc = ifu_io_out_pc; // @[core.scala 58:16]
  assign idu_io_in_instr = ifu_io_out_instr; // @[core.scala 59:19]
  assign idu_io_reg_io_rdata_0 = regs_io_rport_rdata_0; // @[core.scala 60:17]
  assign idu_io_reg_io_rdata_1 = regs_io_rport_rdata_1; // @[core.scala 60:17]
  assign id_ex_clock = clock;
  assign id_ex_reset = reset;
  assign id_ex_io_stall = ex_wb_io_stall; // @[core.scala 30:19 core.scala 33:9]
  assign id_ex_io_in_valid = ifu_io_out_valid; // @[core.scala 86:21]
  assign id_ex_io_in_predicted_pc = idu_io_out_predicted_pc; // @[core.scala 87:15]
  assign id_ex_io_in_commit_pc = idu_io_out_commit_pc; // @[core.scala 87:15]
  assign id_ex_io_in_ex_is_op32 = idu_io_out_ex_is_op32; // @[core.scala 87:15]
  assign id_ex_io_in_ex_is_jump = idu_io_out_ex_is_jump; // @[core.scala 87:15]
  assign id_ex_io_in_ex_is_branch = idu_io_out_ex_is_branch; // @[core.scala 87:15]
  assign id_ex_io_in_ex_is_csr = idu_io_out_ex_is_csr; // @[core.scala 87:15]
  assign id_ex_io_in_ex_is_trap = idu_io_out_ex_is_trap; // @[core.scala 87:15]
  assign id_ex_io_in_ex_fn = idu_io_out_ex_fn; // @[core.scala 87:15]
  assign id_ex_io_in_ex_rs1 = idu_io_out_ex_rs1; // @[core.scala 87:15]
  assign id_ex_io_in_ex_rs2 = idu_io_out_ex_rs2; // @[core.scala 87:15]
  assign id_ex_io_in_ex_op1 = idu_io_out_ex_op1; // @[core.scala 87:15]
  assign id_ex_io_in_ex_op2 = idu_io_out_ex_op2; // @[core.scala 87:15]
  assign id_ex_io_in_ex_use_imm = idu_io_out_ex_use_imm; // @[core.scala 87:15]
  assign id_ex_io_in_ex_imm = idu_io_out_ex_imm; // @[core.scala 87:15]
  assign id_ex_io_in_ex_csrfn = idu_io_out_ex_csrfn; // @[core.scala 87:15]
  assign id_ex_io_in_mem_en = idu_io_out_mem_en; // @[core.scala 87:15]
  assign id_ex_io_in_mem_rw = idu_io_out_mem_rw; // @[core.scala 87:15]
  assign id_ex_io_in_mem_unsigned = idu_io_out_mem_unsigned; // @[core.scala 87:15]
  assign id_ex_io_in_mem_wWidth = idu_io_out_mem_wWidth; // @[core.scala 87:15]
  assign id_ex_io_in_wb_rd = idu_io_out_wb_rd; // @[core.scala 87:15]
  assign exu_clock = clock;
  assign exu_reset = reset;
  assign exu_io_in_valid = id_ex_io_out_valid; // @[core.scala 89:19]
  assign exu_io_in_predicted_pc = id_ex_io_out_predicted_pc; // @[core.scala 90:13]
  assign exu_io_in_commit_pc = id_ex_io_out_commit_pc; // @[core.scala 90:13]
  assign exu_io_in_ex_is_op32 = id_ex_io_out_ex_is_op32; // @[core.scala 90:13]
  assign exu_io_in_ex_is_jump = id_ex_io_out_ex_is_jump; // @[core.scala 90:13]
  assign exu_io_in_ex_is_branch = id_ex_io_out_ex_is_branch; // @[core.scala 90:13]
  assign exu_io_in_ex_is_csr = id_ex_io_out_ex_is_csr; // @[core.scala 90:13]
  assign exu_io_in_ex_is_trap = id_ex_io_out_ex_is_trap; // @[core.scala 90:13]
  assign exu_io_in_ex_fn = id_ex_io_out_ex_fn; // @[core.scala 90:13]
  assign exu_io_in_ex_rs1 = id_ex_io_out_ex_rs1; // @[core.scala 90:13]
  assign exu_io_in_ex_rs2 = id_ex_io_out_ex_rs2; // @[core.scala 90:13]
  assign exu_io_in_ex_op1 = id_ex_io_out_ex_op1; // @[core.scala 90:13]
  assign exu_io_in_ex_op2 = id_ex_io_out_ex_op2; // @[core.scala 90:13]
  assign exu_io_in_ex_use_imm = id_ex_io_out_ex_use_imm; // @[core.scala 90:13]
  assign exu_io_in_ex_imm = id_ex_io_out_ex_imm; // @[core.scala 90:13]
  assign exu_io_in_ex_csrfn = id_ex_io_out_ex_csrfn; // @[core.scala 90:13]
  assign exu_io_in_mem_en = id_ex_io_out_mem_en; // @[core.scala 90:13]
  assign exu_io_in_mem_rw = id_ex_io_out_mem_rw; // @[core.scala 90:13]
  assign exu_io_in_mem_unsigned = id_ex_io_out_mem_unsigned; // @[core.scala 90:13]
  assign exu_io_in_mem_wWidth = id_ex_io_out_mem_wWidth; // @[core.scala 90:13]
  assign exu_io_in_wb_rd = id_ex_io_out_wb_rd; // @[core.scala 90:13]
  assign exu_io_forward_0_rd = ex_wb_io_out_wb_rd; // @[core.scala 91:21]
  assign exu_io_forward_0_data = ex_wb_io_out_wb_data; // @[core.scala 91:21]
  assign exu_io_timer_intr = clint_io_out_timer_intr; // @[core.scala 92:21]
  assign exu_io_stall = ex_wb_io_stall; // @[core.scala 30:19 core.scala 33:9]
  assign ex_wb_clock = clock;
  assign ex_wb_reset = reset;
  assign ex_wb_io_in_valid = exu_io_out_valid; // @[core.scala 112:21]
  assign ex_wb_io_in_mem_en = exu_io_out_mem_en; // @[core.scala 113:15]
  assign ex_wb_io_in_mem_rw = exu_io_out_mem_rw; // @[core.scala 113:15]
  assign ex_wb_io_in_mem_unsigned = exu_io_out_mem_unsigned; // @[core.scala 113:15]
  assign ex_wb_io_in_mem_wWidth = exu_io_out_mem_wWidth; // @[core.scala 113:15]
  assign ex_wb_io_in_mem_addr = exu_io_out_mem_addr; // @[core.scala 113:15]
  assign ex_wb_io_in_mem_wdata = exu_io_out_mem_wdata; // @[core.scala 113:15]
  assign ex_wb_io_in_wb_rd = exu_io_out_wb_rd; // @[core.scala 113:15]
  assign ex_wb_io_in_wb_data = exu_io_out_wb_data; // @[core.scala 113:15]
  assign ex_wb_io_axi_aw_ready = axi_arbiter_io_masterPort_0_aw_ready; // @[core.scala 114:32]
  assign ex_wb_io_axi_w_ready = axi_arbiter_io_masterPort_0_w_ready; // @[core.scala 114:32]
  assign ex_wb_io_axi_b_valid = axi_arbiter_io_masterPort_0_b_valid; // @[core.scala 114:32]
  assign ex_wb_io_axi_ar_ready = axi_arbiter_io_masterPort_0_ar_ready; // @[core.scala 114:32]
  assign ex_wb_io_axi_r_valid = axi_arbiter_io_masterPort_0_r_valid; // @[core.scala 114:32]
  assign ex_wb_io_axi_r_bits_data = axi_arbiter_io_masterPort_0_r_bits_data; // @[core.scala 114:32]
  assign wbu_io_in_valid = ex_wb_io_out_valid; // @[core.scala 118:19]
  assign wbu_io_in_wb_rd = ex_wb_io_out_wb_rd; // @[core.scala 119:13]
  assign wbu_io_in_wb_data = ex_wb_io_out_wb_data; // @[core.scala 119:13]
  assign clint_clock = clock;
  assign clint_reset = reset;
  assign clint_io_axi_aw_valid = axi_arbiter_io_slavePort_1_aw_valid; // @[core.scala 28:31]
  assign clint_io_axi_aw_bits_addr = axi_arbiter_io_slavePort_1_aw_bits_addr; // @[core.scala 28:31]
  assign clint_io_axi_w_valid = axi_arbiter_io_slavePort_1_w_valid; // @[core.scala 28:31]
  assign clint_io_axi_w_bits_data = axi_arbiter_io_slavePort_1_w_bits_data; // @[core.scala 28:31]
  assign clint_io_axi_b_ready = axi_arbiter_io_slavePort_1_b_ready; // @[core.scala 28:31]
  assign clint_io_axi_ar_valid = axi_arbiter_io_slavePort_1_ar_valid; // @[core.scala 28:31]
  assign clint_io_axi_ar_bits_addr = axi_arbiter_io_slavePort_1_ar_bits_addr; // @[core.scala 28:31]
  assign clint_io_axi_r_ready = axi_arbiter_io_slavePort_1_r_ready; // @[core.scala 28:31]
  assign axi_arbiter_clock = clock;
  assign axi_arbiter_reset = reset;
  assign axi_arbiter_io_masterPort_0_aw_valid = ex_wb_io_axi_aw_valid; // @[core.scala 114:32]
  assign axi_arbiter_io_masterPort_0_aw_bits_addr = ex_wb_io_axi_aw_bits_addr; // @[core.scala 114:32]
  assign axi_arbiter_io_masterPort_0_aw_bits_size = ex_wb_io_axi_aw_bits_size; // @[core.scala 114:32]
  assign axi_arbiter_io_masterPort_0_w_valid = ex_wb_io_axi_w_valid; // @[core.scala 114:32]
  assign axi_arbiter_io_masterPort_0_w_bits_data = ex_wb_io_axi_w_bits_data; // @[core.scala 114:32]
  assign axi_arbiter_io_masterPort_0_w_bits_strb = ex_wb_io_axi_w_bits_strb; // @[core.scala 114:32]
  assign axi_arbiter_io_masterPort_0_b_ready = ex_wb_io_axi_b_ready; // @[core.scala 114:32]
  assign axi_arbiter_io_masterPort_0_ar_valid = ex_wb_io_axi_ar_valid; // @[core.scala 114:32]
  assign axi_arbiter_io_masterPort_0_ar_bits_addr = ex_wb_io_axi_ar_bits_addr; // @[core.scala 114:32]
  assign axi_arbiter_io_masterPort_0_ar_bits_size = ex_wb_io_axi_ar_bits_size; // @[core.scala 114:32]
  assign axi_arbiter_io_masterPort_0_r_ready = ex_wb_io_axi_r_ready; // @[core.scala 114:32]
  assign axi_arbiter_io_masterPort_1_ar_valid = ifu_io_axi_ar_valid; // @[core.scala 56:32]
  assign axi_arbiter_io_masterPort_1_ar_bits_addr = ifu_io_axi_ar_bits_addr; // @[core.scala 56:32]
  assign axi_arbiter_io_masterPort_1_r_ready = ifu_io_axi_r_ready; // @[core.scala 56:32]
  assign axi_arbiter_io_slavePort_0_aw_ready = io_axi_aw_ready; // @[core.scala 27:31]
  assign axi_arbiter_io_slavePort_0_w_ready = io_axi_w_ready; // @[core.scala 27:31]
  assign axi_arbiter_io_slavePort_0_b_valid = io_axi_b_valid; // @[core.scala 27:31]
  assign axi_arbiter_io_slavePort_0_ar_ready = io_axi_ar_ready; // @[core.scala 27:31]
  assign axi_arbiter_io_slavePort_0_r_valid = io_axi_r_valid; // @[core.scala 27:31]
  assign axi_arbiter_io_slavePort_0_r_bits_data = io_axi_r_bits_data; // @[core.scala 27:31]
  assign axi_arbiter_io_slavePort_0_r_bits_last = io_axi_r_bits_last; // @[core.scala 27:31]
  assign axi_arbiter_io_slavePort_1_aw_ready = clint_io_axi_aw_ready; // @[core.scala 28:31]
  assign axi_arbiter_io_slavePort_1_w_ready = clint_io_axi_w_ready; // @[core.scala 28:31]
  assign axi_arbiter_io_slavePort_1_b_valid = clint_io_axi_b_valid; // @[core.scala 28:31]
  assign axi_arbiter_io_slavePort_1_ar_ready = clint_io_axi_ar_ready; // @[core.scala 28:31]
  assign axi_arbiter_io_slavePort_1_r_valid = clint_io_axi_r_valid; // @[core.scala 28:31]
  assign axi_arbiter_io_slavePort_1_r_bits_data = clint_io_axi_r_bits_data; // @[core.scala 28:31]
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1 & ~reset) begin
          $fwrite(32'h80000002,"!!! DECODE ERROR !!!  pc=%x instr=%x\n",idu_io_in_pc,idu_io_in_instr); // @[logger.scala 21:17]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module ysyx_210285(
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
  wire  rvcore_clock; // @[YsyxTop.scala 15:22]
  wire  rvcore_reset; // @[YsyxTop.scala 15:22]
  wire  rvcore_io_axi_aw_ready; // @[YsyxTop.scala 15:22]
  wire  rvcore_io_axi_aw_valid; // @[YsyxTop.scala 15:22]
  wire [31:0] rvcore_io_axi_aw_bits_addr; // @[YsyxTop.scala 15:22]
  wire [2:0] rvcore_io_axi_aw_bits_size; // @[YsyxTop.scala 15:22]
  wire  rvcore_io_axi_w_ready; // @[YsyxTop.scala 15:22]
  wire  rvcore_io_axi_w_valid; // @[YsyxTop.scala 15:22]
  wire [63:0] rvcore_io_axi_w_bits_data; // @[YsyxTop.scala 15:22]
  wire [7:0] rvcore_io_axi_w_bits_strb; // @[YsyxTop.scala 15:22]
  wire  rvcore_io_axi_b_ready; // @[YsyxTop.scala 15:22]
  wire  rvcore_io_axi_b_valid; // @[YsyxTop.scala 15:22]
  wire  rvcore_io_axi_ar_ready; // @[YsyxTop.scala 15:22]
  wire  rvcore_io_axi_ar_valid; // @[YsyxTop.scala 15:22]
  wire [31:0] rvcore_io_axi_ar_bits_addr; // @[YsyxTop.scala 15:22]
  wire [2:0] rvcore_io_axi_ar_bits_size; // @[YsyxTop.scala 15:22]
  wire [1:0] rvcore_io_axi_ar_bits_burst; // @[YsyxTop.scala 15:22]
  wire  rvcore_io_axi_r_ready; // @[YsyxTop.scala 15:22]
  wire  rvcore_io_axi_r_valid; // @[YsyxTop.scala 15:22]
  wire [63:0] rvcore_io_axi_r_bits_data; // @[YsyxTop.scala 15:22]
  wire  rvcore_io_axi_r_bits_last; // @[YsyxTop.scala 15:22]
  ysyx_210285_RvCore rvcore ( // @[YsyxTop.scala 15:22]
    .clock(rvcore_clock),
    .reset(rvcore_reset),
    .io_axi_aw_ready(rvcore_io_axi_aw_ready),
    .io_axi_aw_valid(rvcore_io_axi_aw_valid),
    .io_axi_aw_bits_addr(rvcore_io_axi_aw_bits_addr),
    .io_axi_aw_bits_size(rvcore_io_axi_aw_bits_size),
    .io_axi_w_ready(rvcore_io_axi_w_ready),
    .io_axi_w_valid(rvcore_io_axi_w_valid),
    .io_axi_w_bits_data(rvcore_io_axi_w_bits_data),
    .io_axi_w_bits_strb(rvcore_io_axi_w_bits_strb),
    .io_axi_b_ready(rvcore_io_axi_b_ready),
    .io_axi_b_valid(rvcore_io_axi_b_valid),
    .io_axi_ar_ready(rvcore_io_axi_ar_ready),
    .io_axi_ar_valid(rvcore_io_axi_ar_valid),
    .io_axi_ar_bits_addr(rvcore_io_axi_ar_bits_addr),
    .io_axi_ar_bits_size(rvcore_io_axi_ar_bits_size),
    .io_axi_ar_bits_burst(rvcore_io_axi_ar_bits_burst),
    .io_axi_r_ready(rvcore_io_axi_r_ready),
    .io_axi_r_valid(rvcore_io_axi_r_valid),
    .io_axi_r_bits_data(rvcore_io_axi_r_bits_data),
    .io_axi_r_bits_last(rvcore_io_axi_r_bits_last)
  );
  assign io_master_awvalid = rvcore_io_axi_aw_valid; // @[AXI4.scala 90:19 AXI4.scala 93:17]
  assign io_master_awaddr = rvcore_io_axi_aw_bits_addr; // @[AXI4.scala 90:19 AXI4.scala 94:16]
  assign io_master_awid = 4'h0; // @[AXI4.scala 90:19 AXI4.scala 95:14]
  assign io_master_awlen = 8'h0; // @[AXI4.scala 90:19 AXI4.scala 96:15]
  assign io_master_awsize = rvcore_io_axi_aw_bits_size; // @[AXI4.scala 90:19 AXI4.scala 97:16]
  assign io_master_awburst = 2'h0; // @[AXI4.scala 90:19 AXI4.scala 98:17]
  assign io_master_wvalid = rvcore_io_axi_w_valid; // @[AXI4.scala 90:19 AXI4.scala 101:16]
  assign io_master_wdata = rvcore_io_axi_w_bits_data; // @[AXI4.scala 90:19 AXI4.scala 102:15]
  assign io_master_wstrb = rvcore_io_axi_w_bits_strb; // @[AXI4.scala 90:19 AXI4.scala 103:15]
  assign io_master_wlast = 1'h1; // @[AXI4.scala 90:19 AXI4.scala 104:15]
  assign io_master_bready = rvcore_io_axi_b_ready; // @[AXI4.scala 90:19 AXI4.scala 107:16]
  assign io_master_arvalid = rvcore_io_axi_ar_valid; // @[AXI4.scala 90:19 AXI4.scala 112:17]
  assign io_master_araddr = rvcore_io_axi_ar_bits_addr; // @[AXI4.scala 90:19 AXI4.scala 113:16]
  assign io_master_arid = 4'h0; // @[AXI4.scala 90:19 AXI4.scala 114:14]
  assign io_master_arlen = 8'h0; // @[AXI4.scala 90:19 AXI4.scala 115:15]
  assign io_master_arsize = rvcore_io_axi_ar_bits_size; // @[AXI4.scala 90:19 AXI4.scala 116:16]
  assign io_master_arburst = rvcore_io_axi_ar_bits_burst; // @[AXI4.scala 90:19 AXI4.scala 117:17]
  assign io_master_rready = rvcore_io_axi_r_ready; // @[AXI4.scala 90:19 AXI4.scala 119:16]
  assign io_slave_awready = 1'h0; // @[YsyxTop.scala 25:19 AXI4.scala 76:16]
  assign io_slave_wready = 1'h0; // @[YsyxTop.scala 25:19 AXI4.scala 77:15]
  assign io_slave_bvalid = 1'h0; // @[YsyxTop.scala 25:19 AXI4.scala 78:15]
  assign io_slave_bresp = 2'h0; // @[AXI4.scala 128:19 AXI4.scala 146:15]
  assign io_slave_bid = 4'h0; // @[AXI4.scala 128:19 AXI4.scala 147:13]
  assign io_slave_arready = 1'h0; // @[YsyxTop.scala 25:19 AXI4.scala 80:16]
  assign io_slave_rvalid = 1'h0; // @[YsyxTop.scala 25:19 AXI4.scala 81:15]
  assign io_slave_rresp = 2'h0; // @[AXI4.scala 128:19 AXI4.scala 159:15]
  assign io_slave_rdata = 64'h0; // @[AXI4.scala 128:19 AXI4.scala 160:15]
  assign io_slave_rlast = 1'h0; // @[AXI4.scala 128:19 AXI4.scala 161:15]
  assign io_slave_rid = 4'h0; // @[AXI4.scala 128:19 AXI4.scala 162:13]
  assign rvcore_clock = clock;
  assign rvcore_reset = reset;
  assign rvcore_io_axi_aw_ready = io_master_awready; // @[AXI4.scala 90:19 YsyxTop.scala 24:13]
  assign rvcore_io_axi_w_ready = io_master_wready; // @[AXI4.scala 90:19 YsyxTop.scala 24:13]
  assign rvcore_io_axi_b_valid = io_master_bvalid; // @[AXI4.scala 90:19 YsyxTop.scala 24:13]
  assign rvcore_io_axi_ar_ready = io_master_arready; // @[AXI4.scala 90:19 YsyxTop.scala 24:13]
  assign rvcore_io_axi_r_valid = io_master_rvalid; // @[AXI4.scala 90:19 YsyxTop.scala 24:13]
  assign rvcore_io_axi_r_bits_data = io_master_rdata; // @[AXI4.scala 90:19 YsyxTop.scala 24:13]
  assign rvcore_io_axi_r_bits_last = io_master_rlast; // @[AXI4.scala 90:19 YsyxTop.scala 24:13]
endmodule
