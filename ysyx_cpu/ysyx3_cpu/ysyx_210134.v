module ysyx_210134_SimDualPortBRAM(
  input          clock,
  input          reset,
  input          io_wea,
  input          io_addra,
  input          io_addrb,
  input  [255:0] io_dina,
  output [255:0] io_douta,
  output [255:0] io_doutb
);
`ifdef RANDOMIZE_REG_INIT
  reg [255:0] _RAND_0;
  reg [255:0] _RAND_1;
  reg [255:0] _RAND_2;
  reg [255:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [255:0] mem_0; // @[RAMWrapper.scala 41:20]
  reg [255:0] mem_1; // @[RAMWrapper.scala 41:20]
  reg [255:0] io_douta_REG; // @[RAMWrapper.scala 43:22]
  reg [255:0] io_doutb_REG; // @[RAMWrapper.scala 44:22]
  assign io_douta = io_douta_REG; // @[RAMWrapper.scala 43:12]
  assign io_doutb = io_doutb_REG; // @[RAMWrapper.scala 44:12]
  always @(posedge clock) begin
    if (reset) begin // @[RAMWrapper.scala 41:20]
      mem_0 <= 256'h0; // @[RAMWrapper.scala 41:20]
    end else if (io_wea) begin // @[RAMWrapper.scala 46:16]
      if (~io_addra) begin // @[RAMWrapper.scala 47:19]
        mem_0 <= io_dina; // @[RAMWrapper.scala 47:19]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 41:20]
      mem_1 <= 256'h0; // @[RAMWrapper.scala 41:20]
    end else if (io_wea) begin // @[RAMWrapper.scala 46:16]
      if (io_addra) begin // @[RAMWrapper.scala 47:19]
        mem_1 <= io_dina; // @[RAMWrapper.scala 47:19]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 43:22]
      io_douta_REG <= 256'h0; // @[RAMWrapper.scala 43:22]
    end else if (io_addra) begin // @[RAMWrapper.scala 43:22]
      io_douta_REG <= mem_1; // @[RAMWrapper.scala 43:22]
    end else begin
      io_douta_REG <= mem_0;
    end
    if (reset) begin // @[RAMWrapper.scala 44:22]
      io_doutb_REG <= 256'h0; // @[RAMWrapper.scala 44:22]
    end else if (io_addrb) begin // @[RAMWrapper.scala 44:22]
      io_doutb_REG <= mem_1; // @[RAMWrapper.scala 44:22]
    end else begin
      io_doutb_REG <= mem_0;
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
  _RAND_0 = {8{`RANDOM}};
  mem_0 = _RAND_0[255:0];
  _RAND_1 = {8{`RANDOM}};
  mem_1 = _RAND_1[255:0];
  _RAND_2 = {8{`RANDOM}};
  io_douta_REG = _RAND_2[255:0];
  _RAND_3 = {8{`RANDOM}};
  io_doutb_REG = _RAND_3[255:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210134_DualPortBRAM(
  input          clock,
  input          reset,
  input          io_wea,
  input          io_addra,
  input          io_addrb,
  input  [255:0] io_dina,
  output [255:0] io_douta,
  output [255:0] io_doutb
);
  wire  sim_dual_port_bram_clock; // @[RAMWrapper.scala 30:36]
  wire  sim_dual_port_bram_reset; // @[RAMWrapper.scala 30:36]
  wire  sim_dual_port_bram_io_wea; // @[RAMWrapper.scala 30:36]
  wire  sim_dual_port_bram_io_addra; // @[RAMWrapper.scala 30:36]
  wire  sim_dual_port_bram_io_addrb; // @[RAMWrapper.scala 30:36]
  wire [255:0] sim_dual_port_bram_io_dina; // @[RAMWrapper.scala 30:36]
  wire [255:0] sim_dual_port_bram_io_douta; // @[RAMWrapper.scala 30:36]
  wire [255:0] sim_dual_port_bram_io_doutb; // @[RAMWrapper.scala 30:36]
  ysyx_210134_SimDualPortBRAM sim_dual_port_bram ( // @[RAMWrapper.scala 30:36]
    .clock(sim_dual_port_bram_clock),
    .reset(sim_dual_port_bram_reset),
    .io_wea(sim_dual_port_bram_io_wea),
    .io_addra(sim_dual_port_bram_io_addra),
    .io_addrb(sim_dual_port_bram_io_addrb),
    .io_dina(sim_dual_port_bram_io_dina),
    .io_douta(sim_dual_port_bram_io_douta),
    .io_doutb(sim_dual_port_bram_io_doutb)
  );
  assign io_douta = sim_dual_port_bram_io_douta; // @[RAMWrapper.scala 31:27]
  assign io_doutb = sim_dual_port_bram_io_doutb; // @[RAMWrapper.scala 31:27]
  assign sim_dual_port_bram_clock = clock;
  assign sim_dual_port_bram_reset = reset;
  assign sim_dual_port_bram_io_wea = io_wea; // @[RAMWrapper.scala 31:27]
  assign sim_dual_port_bram_io_addra = io_addra; // @[RAMWrapper.scala 31:27]
  assign sim_dual_port_bram_io_addrb = io_addrb; // @[RAMWrapper.scala 31:27]
  assign sim_dual_port_bram_io_dina = io_dina; // @[RAMWrapper.scala 31:27]
endmodule
module ysyx_210134_SimSinglePortBRAM(
  input          clock,
  input          reset,
  input          io_we,
  input  [5:0]   io_addr,
  input  [255:0] io_din,
  output [255:0] io_dout
);
`ifdef RANDOMIZE_REG_INIT
  reg [255:0] _RAND_0;
  reg [255:0] _RAND_1;
  reg [255:0] _RAND_2;
  reg [255:0] _RAND_3;
  reg [255:0] _RAND_4;
  reg [255:0] _RAND_5;
  reg [255:0] _RAND_6;
  reg [255:0] _RAND_7;
  reg [255:0] _RAND_8;
  reg [255:0] _RAND_9;
  reg [255:0] _RAND_10;
  reg [255:0] _RAND_11;
  reg [255:0] _RAND_12;
  reg [255:0] _RAND_13;
  reg [255:0] _RAND_14;
  reg [255:0] _RAND_15;
  reg [255:0] _RAND_16;
  reg [255:0] _RAND_17;
  reg [255:0] _RAND_18;
  reg [255:0] _RAND_19;
  reg [255:0] _RAND_20;
  reg [255:0] _RAND_21;
  reg [255:0] _RAND_22;
  reg [255:0] _RAND_23;
  reg [255:0] _RAND_24;
  reg [255:0] _RAND_25;
  reg [255:0] _RAND_26;
  reg [255:0] _RAND_27;
  reg [255:0] _RAND_28;
  reg [255:0] _RAND_29;
  reg [255:0] _RAND_30;
  reg [255:0] _RAND_31;
  reg [255:0] _RAND_32;
  reg [255:0] _RAND_33;
  reg [255:0] _RAND_34;
  reg [255:0] _RAND_35;
  reg [255:0] _RAND_36;
  reg [255:0] _RAND_37;
  reg [255:0] _RAND_38;
  reg [255:0] _RAND_39;
  reg [255:0] _RAND_40;
  reg [255:0] _RAND_41;
  reg [255:0] _RAND_42;
  reg [255:0] _RAND_43;
  reg [255:0] _RAND_44;
  reg [255:0] _RAND_45;
  reg [255:0] _RAND_46;
  reg [255:0] _RAND_47;
  reg [255:0] _RAND_48;
  reg [255:0] _RAND_49;
  reg [255:0] _RAND_50;
  reg [255:0] _RAND_51;
  reg [255:0] _RAND_52;
  reg [255:0] _RAND_53;
  reg [255:0] _RAND_54;
  reg [255:0] _RAND_55;
  reg [255:0] _RAND_56;
  reg [255:0] _RAND_57;
  reg [255:0] _RAND_58;
  reg [255:0] _RAND_59;
  reg [255:0] _RAND_60;
  reg [255:0] _RAND_61;
  reg [255:0] _RAND_62;
`endif // RANDOMIZE_REG_INIT
  reg [255:0] mem_0; // @[RAMWrapper.scala 286:20]
  reg [255:0] mem_1; // @[RAMWrapper.scala 286:20]
  reg [255:0] mem_2; // @[RAMWrapper.scala 286:20]
  reg [255:0] mem_3; // @[RAMWrapper.scala 286:20]
  reg [255:0] mem_4; // @[RAMWrapper.scala 286:20]
  reg [255:0] mem_5; // @[RAMWrapper.scala 286:20]
  reg [255:0] mem_6; // @[RAMWrapper.scala 286:20]
  reg [255:0] mem_7; // @[RAMWrapper.scala 286:20]
  reg [255:0] mem_8; // @[RAMWrapper.scala 286:20]
  reg [255:0] mem_9; // @[RAMWrapper.scala 286:20]
  reg [255:0] mem_10; // @[RAMWrapper.scala 286:20]
  reg [255:0] mem_11; // @[RAMWrapper.scala 286:20]
  reg [255:0] mem_12; // @[RAMWrapper.scala 286:20]
  reg [255:0] mem_13; // @[RAMWrapper.scala 286:20]
  reg [255:0] mem_14; // @[RAMWrapper.scala 286:20]
  reg [255:0] mem_15; // @[RAMWrapper.scala 286:20]
  reg [255:0] mem_16; // @[RAMWrapper.scala 286:20]
  reg [255:0] mem_17; // @[RAMWrapper.scala 286:20]
  reg [255:0] mem_18; // @[RAMWrapper.scala 286:20]
  reg [255:0] mem_19; // @[RAMWrapper.scala 286:20]
  reg [255:0] mem_20; // @[RAMWrapper.scala 286:20]
  reg [255:0] mem_21; // @[RAMWrapper.scala 286:20]
  reg [255:0] mem_22; // @[RAMWrapper.scala 286:20]
  reg [255:0] mem_23; // @[RAMWrapper.scala 286:20]
  reg [255:0] mem_24; // @[RAMWrapper.scala 286:20]
  reg [255:0] mem_25; // @[RAMWrapper.scala 286:20]
  reg [255:0] mem_26; // @[RAMWrapper.scala 286:20]
  reg [255:0] mem_27; // @[RAMWrapper.scala 286:20]
  reg [255:0] mem_28; // @[RAMWrapper.scala 286:20]
  reg [255:0] mem_29; // @[RAMWrapper.scala 286:20]
  reg [255:0] mem_30; // @[RAMWrapper.scala 286:20]
  reg [255:0] mem_31; // @[RAMWrapper.scala 286:20]
  reg [255:0] mem_32; // @[RAMWrapper.scala 286:20]
  reg [255:0] mem_33; // @[RAMWrapper.scala 286:20]
  reg [255:0] mem_34; // @[RAMWrapper.scala 286:20]
  reg [255:0] mem_35; // @[RAMWrapper.scala 286:20]
  reg [255:0] mem_36; // @[RAMWrapper.scala 286:20]
  reg [255:0] mem_37; // @[RAMWrapper.scala 286:20]
  reg [255:0] mem_38; // @[RAMWrapper.scala 286:20]
  reg [255:0] mem_39; // @[RAMWrapper.scala 286:20]
  reg [255:0] mem_40; // @[RAMWrapper.scala 286:20]
  reg [255:0] mem_41; // @[RAMWrapper.scala 286:20]
  reg [255:0] mem_42; // @[RAMWrapper.scala 286:20]
  reg [255:0] mem_43; // @[RAMWrapper.scala 286:20]
  reg [255:0] mem_44; // @[RAMWrapper.scala 286:20]
  reg [255:0] mem_45; // @[RAMWrapper.scala 286:20]
  reg [255:0] mem_46; // @[RAMWrapper.scala 286:20]
  reg [255:0] mem_47; // @[RAMWrapper.scala 286:20]
  reg [255:0] mem_48; // @[RAMWrapper.scala 286:20]
  reg [255:0] mem_49; // @[RAMWrapper.scala 286:20]
  reg [255:0] mem_50; // @[RAMWrapper.scala 286:20]
  reg [255:0] mem_51; // @[RAMWrapper.scala 286:20]
  reg [255:0] mem_52; // @[RAMWrapper.scala 286:20]
  reg [255:0] mem_53; // @[RAMWrapper.scala 286:20]
  reg [255:0] mem_54; // @[RAMWrapper.scala 286:20]
  reg [255:0] mem_55; // @[RAMWrapper.scala 286:20]
  reg [255:0] mem_56; // @[RAMWrapper.scala 286:20]
  reg [255:0] mem_57; // @[RAMWrapper.scala 286:20]
  reg [255:0] mem_58; // @[RAMWrapper.scala 286:20]
  reg [255:0] mem_59; // @[RAMWrapper.scala 286:20]
  reg [255:0] mem_60; // @[RAMWrapper.scala 286:20]
  reg [255:0] mem_61; // @[RAMWrapper.scala 286:20]
  reg [255:0] io_dout_REG; // @[RAMWrapper.scala 288:21]
  wire [255:0] _GEN_1 = 6'h1 == io_addr ? mem_1 : mem_0; // @[RAMWrapper.scala 288:21 RAMWrapper.scala 288:21]
  wire [255:0] _GEN_2 = 6'h2 == io_addr ? mem_2 : _GEN_1; // @[RAMWrapper.scala 288:21 RAMWrapper.scala 288:21]
  wire [255:0] _GEN_3 = 6'h3 == io_addr ? mem_3 : _GEN_2; // @[RAMWrapper.scala 288:21 RAMWrapper.scala 288:21]
  wire [255:0] _GEN_4 = 6'h4 == io_addr ? mem_4 : _GEN_3; // @[RAMWrapper.scala 288:21 RAMWrapper.scala 288:21]
  wire [255:0] _GEN_5 = 6'h5 == io_addr ? mem_5 : _GEN_4; // @[RAMWrapper.scala 288:21 RAMWrapper.scala 288:21]
  wire [255:0] _GEN_6 = 6'h6 == io_addr ? mem_6 : _GEN_5; // @[RAMWrapper.scala 288:21 RAMWrapper.scala 288:21]
  wire [255:0] _GEN_7 = 6'h7 == io_addr ? mem_7 : _GEN_6; // @[RAMWrapper.scala 288:21 RAMWrapper.scala 288:21]
  wire [255:0] _GEN_8 = 6'h8 == io_addr ? mem_8 : _GEN_7; // @[RAMWrapper.scala 288:21 RAMWrapper.scala 288:21]
  wire [255:0] _GEN_9 = 6'h9 == io_addr ? mem_9 : _GEN_8; // @[RAMWrapper.scala 288:21 RAMWrapper.scala 288:21]
  wire [255:0] _GEN_10 = 6'ha == io_addr ? mem_10 : _GEN_9; // @[RAMWrapper.scala 288:21 RAMWrapper.scala 288:21]
  wire [255:0] _GEN_11 = 6'hb == io_addr ? mem_11 : _GEN_10; // @[RAMWrapper.scala 288:21 RAMWrapper.scala 288:21]
  wire [255:0] _GEN_12 = 6'hc == io_addr ? mem_12 : _GEN_11; // @[RAMWrapper.scala 288:21 RAMWrapper.scala 288:21]
  wire [255:0] _GEN_13 = 6'hd == io_addr ? mem_13 : _GEN_12; // @[RAMWrapper.scala 288:21 RAMWrapper.scala 288:21]
  wire [255:0] _GEN_14 = 6'he == io_addr ? mem_14 : _GEN_13; // @[RAMWrapper.scala 288:21 RAMWrapper.scala 288:21]
  wire [255:0] _GEN_15 = 6'hf == io_addr ? mem_15 : _GEN_14; // @[RAMWrapper.scala 288:21 RAMWrapper.scala 288:21]
  wire [255:0] _GEN_16 = 6'h10 == io_addr ? mem_16 : _GEN_15; // @[RAMWrapper.scala 288:21 RAMWrapper.scala 288:21]
  wire [255:0] _GEN_17 = 6'h11 == io_addr ? mem_17 : _GEN_16; // @[RAMWrapper.scala 288:21 RAMWrapper.scala 288:21]
  wire [255:0] _GEN_18 = 6'h12 == io_addr ? mem_18 : _GEN_17; // @[RAMWrapper.scala 288:21 RAMWrapper.scala 288:21]
  wire [255:0] _GEN_19 = 6'h13 == io_addr ? mem_19 : _GEN_18; // @[RAMWrapper.scala 288:21 RAMWrapper.scala 288:21]
  wire [255:0] _GEN_20 = 6'h14 == io_addr ? mem_20 : _GEN_19; // @[RAMWrapper.scala 288:21 RAMWrapper.scala 288:21]
  wire [255:0] _GEN_21 = 6'h15 == io_addr ? mem_21 : _GEN_20; // @[RAMWrapper.scala 288:21 RAMWrapper.scala 288:21]
  wire [255:0] _GEN_22 = 6'h16 == io_addr ? mem_22 : _GEN_21; // @[RAMWrapper.scala 288:21 RAMWrapper.scala 288:21]
  wire [255:0] _GEN_23 = 6'h17 == io_addr ? mem_23 : _GEN_22; // @[RAMWrapper.scala 288:21 RAMWrapper.scala 288:21]
  wire [255:0] _GEN_24 = 6'h18 == io_addr ? mem_24 : _GEN_23; // @[RAMWrapper.scala 288:21 RAMWrapper.scala 288:21]
  wire [255:0] _GEN_25 = 6'h19 == io_addr ? mem_25 : _GEN_24; // @[RAMWrapper.scala 288:21 RAMWrapper.scala 288:21]
  wire [255:0] _GEN_26 = 6'h1a == io_addr ? mem_26 : _GEN_25; // @[RAMWrapper.scala 288:21 RAMWrapper.scala 288:21]
  wire [255:0] _GEN_27 = 6'h1b == io_addr ? mem_27 : _GEN_26; // @[RAMWrapper.scala 288:21 RAMWrapper.scala 288:21]
  wire [255:0] _GEN_28 = 6'h1c == io_addr ? mem_28 : _GEN_27; // @[RAMWrapper.scala 288:21 RAMWrapper.scala 288:21]
  wire [255:0] _GEN_29 = 6'h1d == io_addr ? mem_29 : _GEN_28; // @[RAMWrapper.scala 288:21 RAMWrapper.scala 288:21]
  wire [255:0] _GEN_30 = 6'h1e == io_addr ? mem_30 : _GEN_29; // @[RAMWrapper.scala 288:21 RAMWrapper.scala 288:21]
  wire [255:0] _GEN_31 = 6'h1f == io_addr ? mem_31 : _GEN_30; // @[RAMWrapper.scala 288:21 RAMWrapper.scala 288:21]
  wire [255:0] _GEN_32 = 6'h20 == io_addr ? mem_32 : _GEN_31; // @[RAMWrapper.scala 288:21 RAMWrapper.scala 288:21]
  wire [255:0] _GEN_33 = 6'h21 == io_addr ? mem_33 : _GEN_32; // @[RAMWrapper.scala 288:21 RAMWrapper.scala 288:21]
  wire [255:0] _GEN_34 = 6'h22 == io_addr ? mem_34 : _GEN_33; // @[RAMWrapper.scala 288:21 RAMWrapper.scala 288:21]
  wire [255:0] _GEN_35 = 6'h23 == io_addr ? mem_35 : _GEN_34; // @[RAMWrapper.scala 288:21 RAMWrapper.scala 288:21]
  wire [255:0] _GEN_36 = 6'h24 == io_addr ? mem_36 : _GEN_35; // @[RAMWrapper.scala 288:21 RAMWrapper.scala 288:21]
  wire [255:0] _GEN_37 = 6'h25 == io_addr ? mem_37 : _GEN_36; // @[RAMWrapper.scala 288:21 RAMWrapper.scala 288:21]
  wire [255:0] _GEN_38 = 6'h26 == io_addr ? mem_38 : _GEN_37; // @[RAMWrapper.scala 288:21 RAMWrapper.scala 288:21]
  wire [255:0] _GEN_39 = 6'h27 == io_addr ? mem_39 : _GEN_38; // @[RAMWrapper.scala 288:21 RAMWrapper.scala 288:21]
  wire [255:0] _GEN_40 = 6'h28 == io_addr ? mem_40 : _GEN_39; // @[RAMWrapper.scala 288:21 RAMWrapper.scala 288:21]
  wire [255:0] _GEN_41 = 6'h29 == io_addr ? mem_41 : _GEN_40; // @[RAMWrapper.scala 288:21 RAMWrapper.scala 288:21]
  wire [255:0] _GEN_42 = 6'h2a == io_addr ? mem_42 : _GEN_41; // @[RAMWrapper.scala 288:21 RAMWrapper.scala 288:21]
  wire [255:0] _GEN_43 = 6'h2b == io_addr ? mem_43 : _GEN_42; // @[RAMWrapper.scala 288:21 RAMWrapper.scala 288:21]
  wire [255:0] _GEN_44 = 6'h2c == io_addr ? mem_44 : _GEN_43; // @[RAMWrapper.scala 288:21 RAMWrapper.scala 288:21]
  wire [255:0] _GEN_45 = 6'h2d == io_addr ? mem_45 : _GEN_44; // @[RAMWrapper.scala 288:21 RAMWrapper.scala 288:21]
  wire [255:0] _GEN_46 = 6'h2e == io_addr ? mem_46 : _GEN_45; // @[RAMWrapper.scala 288:21 RAMWrapper.scala 288:21]
  wire [255:0] _GEN_47 = 6'h2f == io_addr ? mem_47 : _GEN_46; // @[RAMWrapper.scala 288:21 RAMWrapper.scala 288:21]
  wire [255:0] _GEN_48 = 6'h30 == io_addr ? mem_48 : _GEN_47; // @[RAMWrapper.scala 288:21 RAMWrapper.scala 288:21]
  wire [255:0] _GEN_49 = 6'h31 == io_addr ? mem_49 : _GEN_48; // @[RAMWrapper.scala 288:21 RAMWrapper.scala 288:21]
  wire [255:0] _GEN_50 = 6'h32 == io_addr ? mem_50 : _GEN_49; // @[RAMWrapper.scala 288:21 RAMWrapper.scala 288:21]
  wire [255:0] _GEN_51 = 6'h33 == io_addr ? mem_51 : _GEN_50; // @[RAMWrapper.scala 288:21 RAMWrapper.scala 288:21]
  wire [255:0] _GEN_52 = 6'h34 == io_addr ? mem_52 : _GEN_51; // @[RAMWrapper.scala 288:21 RAMWrapper.scala 288:21]
  wire [255:0] _GEN_53 = 6'h35 == io_addr ? mem_53 : _GEN_52; // @[RAMWrapper.scala 288:21 RAMWrapper.scala 288:21]
  wire [255:0] _GEN_54 = 6'h36 == io_addr ? mem_54 : _GEN_53; // @[RAMWrapper.scala 288:21 RAMWrapper.scala 288:21]
  wire [255:0] _GEN_55 = 6'h37 == io_addr ? mem_55 : _GEN_54; // @[RAMWrapper.scala 288:21 RAMWrapper.scala 288:21]
  wire [255:0] _GEN_56 = 6'h38 == io_addr ? mem_56 : _GEN_55; // @[RAMWrapper.scala 288:21 RAMWrapper.scala 288:21]
  wire [255:0] _GEN_57 = 6'h39 == io_addr ? mem_57 : _GEN_56; // @[RAMWrapper.scala 288:21 RAMWrapper.scala 288:21]
  wire [255:0] _GEN_58 = 6'h3a == io_addr ? mem_58 : _GEN_57; // @[RAMWrapper.scala 288:21 RAMWrapper.scala 288:21]
  assign io_dout = io_dout_REG; // @[RAMWrapper.scala 288:11]
  always @(posedge clock) begin
    if (reset) begin // @[RAMWrapper.scala 286:20]
      mem_0 <= 256'h0; // @[RAMWrapper.scala 286:20]
    end else if (io_we) begin // @[RAMWrapper.scala 290:15]
      if (6'h0 == io_addr) begin // @[RAMWrapper.scala 291:18]
        mem_0 <= io_din; // @[RAMWrapper.scala 291:18]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 286:20]
      mem_1 <= 256'h0; // @[RAMWrapper.scala 286:20]
    end else if (io_we) begin // @[RAMWrapper.scala 290:15]
      if (6'h1 == io_addr) begin // @[RAMWrapper.scala 291:18]
        mem_1 <= io_din; // @[RAMWrapper.scala 291:18]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 286:20]
      mem_2 <= 256'h0; // @[RAMWrapper.scala 286:20]
    end else if (io_we) begin // @[RAMWrapper.scala 290:15]
      if (6'h2 == io_addr) begin // @[RAMWrapper.scala 291:18]
        mem_2 <= io_din; // @[RAMWrapper.scala 291:18]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 286:20]
      mem_3 <= 256'h0; // @[RAMWrapper.scala 286:20]
    end else if (io_we) begin // @[RAMWrapper.scala 290:15]
      if (6'h3 == io_addr) begin // @[RAMWrapper.scala 291:18]
        mem_3 <= io_din; // @[RAMWrapper.scala 291:18]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 286:20]
      mem_4 <= 256'h0; // @[RAMWrapper.scala 286:20]
    end else if (io_we) begin // @[RAMWrapper.scala 290:15]
      if (6'h4 == io_addr) begin // @[RAMWrapper.scala 291:18]
        mem_4 <= io_din; // @[RAMWrapper.scala 291:18]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 286:20]
      mem_5 <= 256'h0; // @[RAMWrapper.scala 286:20]
    end else if (io_we) begin // @[RAMWrapper.scala 290:15]
      if (6'h5 == io_addr) begin // @[RAMWrapper.scala 291:18]
        mem_5 <= io_din; // @[RAMWrapper.scala 291:18]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 286:20]
      mem_6 <= 256'h0; // @[RAMWrapper.scala 286:20]
    end else if (io_we) begin // @[RAMWrapper.scala 290:15]
      if (6'h6 == io_addr) begin // @[RAMWrapper.scala 291:18]
        mem_6 <= io_din; // @[RAMWrapper.scala 291:18]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 286:20]
      mem_7 <= 256'h0; // @[RAMWrapper.scala 286:20]
    end else if (io_we) begin // @[RAMWrapper.scala 290:15]
      if (6'h7 == io_addr) begin // @[RAMWrapper.scala 291:18]
        mem_7 <= io_din; // @[RAMWrapper.scala 291:18]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 286:20]
      mem_8 <= 256'h0; // @[RAMWrapper.scala 286:20]
    end else if (io_we) begin // @[RAMWrapper.scala 290:15]
      if (6'h8 == io_addr) begin // @[RAMWrapper.scala 291:18]
        mem_8 <= io_din; // @[RAMWrapper.scala 291:18]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 286:20]
      mem_9 <= 256'h0; // @[RAMWrapper.scala 286:20]
    end else if (io_we) begin // @[RAMWrapper.scala 290:15]
      if (6'h9 == io_addr) begin // @[RAMWrapper.scala 291:18]
        mem_9 <= io_din; // @[RAMWrapper.scala 291:18]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 286:20]
      mem_10 <= 256'h0; // @[RAMWrapper.scala 286:20]
    end else if (io_we) begin // @[RAMWrapper.scala 290:15]
      if (6'ha == io_addr) begin // @[RAMWrapper.scala 291:18]
        mem_10 <= io_din; // @[RAMWrapper.scala 291:18]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 286:20]
      mem_11 <= 256'h0; // @[RAMWrapper.scala 286:20]
    end else if (io_we) begin // @[RAMWrapper.scala 290:15]
      if (6'hb == io_addr) begin // @[RAMWrapper.scala 291:18]
        mem_11 <= io_din; // @[RAMWrapper.scala 291:18]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 286:20]
      mem_12 <= 256'h0; // @[RAMWrapper.scala 286:20]
    end else if (io_we) begin // @[RAMWrapper.scala 290:15]
      if (6'hc == io_addr) begin // @[RAMWrapper.scala 291:18]
        mem_12 <= io_din; // @[RAMWrapper.scala 291:18]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 286:20]
      mem_13 <= 256'h0; // @[RAMWrapper.scala 286:20]
    end else if (io_we) begin // @[RAMWrapper.scala 290:15]
      if (6'hd == io_addr) begin // @[RAMWrapper.scala 291:18]
        mem_13 <= io_din; // @[RAMWrapper.scala 291:18]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 286:20]
      mem_14 <= 256'h0; // @[RAMWrapper.scala 286:20]
    end else if (io_we) begin // @[RAMWrapper.scala 290:15]
      if (6'he == io_addr) begin // @[RAMWrapper.scala 291:18]
        mem_14 <= io_din; // @[RAMWrapper.scala 291:18]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 286:20]
      mem_15 <= 256'h0; // @[RAMWrapper.scala 286:20]
    end else if (io_we) begin // @[RAMWrapper.scala 290:15]
      if (6'hf == io_addr) begin // @[RAMWrapper.scala 291:18]
        mem_15 <= io_din; // @[RAMWrapper.scala 291:18]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 286:20]
      mem_16 <= 256'h0; // @[RAMWrapper.scala 286:20]
    end else if (io_we) begin // @[RAMWrapper.scala 290:15]
      if (6'h10 == io_addr) begin // @[RAMWrapper.scala 291:18]
        mem_16 <= io_din; // @[RAMWrapper.scala 291:18]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 286:20]
      mem_17 <= 256'h0; // @[RAMWrapper.scala 286:20]
    end else if (io_we) begin // @[RAMWrapper.scala 290:15]
      if (6'h11 == io_addr) begin // @[RAMWrapper.scala 291:18]
        mem_17 <= io_din; // @[RAMWrapper.scala 291:18]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 286:20]
      mem_18 <= 256'h0; // @[RAMWrapper.scala 286:20]
    end else if (io_we) begin // @[RAMWrapper.scala 290:15]
      if (6'h12 == io_addr) begin // @[RAMWrapper.scala 291:18]
        mem_18 <= io_din; // @[RAMWrapper.scala 291:18]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 286:20]
      mem_19 <= 256'h0; // @[RAMWrapper.scala 286:20]
    end else if (io_we) begin // @[RAMWrapper.scala 290:15]
      if (6'h13 == io_addr) begin // @[RAMWrapper.scala 291:18]
        mem_19 <= io_din; // @[RAMWrapper.scala 291:18]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 286:20]
      mem_20 <= 256'h0; // @[RAMWrapper.scala 286:20]
    end else if (io_we) begin // @[RAMWrapper.scala 290:15]
      if (6'h14 == io_addr) begin // @[RAMWrapper.scala 291:18]
        mem_20 <= io_din; // @[RAMWrapper.scala 291:18]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 286:20]
      mem_21 <= 256'h0; // @[RAMWrapper.scala 286:20]
    end else if (io_we) begin // @[RAMWrapper.scala 290:15]
      if (6'h15 == io_addr) begin // @[RAMWrapper.scala 291:18]
        mem_21 <= io_din; // @[RAMWrapper.scala 291:18]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 286:20]
      mem_22 <= 256'h0; // @[RAMWrapper.scala 286:20]
    end else if (io_we) begin // @[RAMWrapper.scala 290:15]
      if (6'h16 == io_addr) begin // @[RAMWrapper.scala 291:18]
        mem_22 <= io_din; // @[RAMWrapper.scala 291:18]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 286:20]
      mem_23 <= 256'h0; // @[RAMWrapper.scala 286:20]
    end else if (io_we) begin // @[RAMWrapper.scala 290:15]
      if (6'h17 == io_addr) begin // @[RAMWrapper.scala 291:18]
        mem_23 <= io_din; // @[RAMWrapper.scala 291:18]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 286:20]
      mem_24 <= 256'h0; // @[RAMWrapper.scala 286:20]
    end else if (io_we) begin // @[RAMWrapper.scala 290:15]
      if (6'h18 == io_addr) begin // @[RAMWrapper.scala 291:18]
        mem_24 <= io_din; // @[RAMWrapper.scala 291:18]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 286:20]
      mem_25 <= 256'h0; // @[RAMWrapper.scala 286:20]
    end else if (io_we) begin // @[RAMWrapper.scala 290:15]
      if (6'h19 == io_addr) begin // @[RAMWrapper.scala 291:18]
        mem_25 <= io_din; // @[RAMWrapper.scala 291:18]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 286:20]
      mem_26 <= 256'h0; // @[RAMWrapper.scala 286:20]
    end else if (io_we) begin // @[RAMWrapper.scala 290:15]
      if (6'h1a == io_addr) begin // @[RAMWrapper.scala 291:18]
        mem_26 <= io_din; // @[RAMWrapper.scala 291:18]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 286:20]
      mem_27 <= 256'h0; // @[RAMWrapper.scala 286:20]
    end else if (io_we) begin // @[RAMWrapper.scala 290:15]
      if (6'h1b == io_addr) begin // @[RAMWrapper.scala 291:18]
        mem_27 <= io_din; // @[RAMWrapper.scala 291:18]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 286:20]
      mem_28 <= 256'h0; // @[RAMWrapper.scala 286:20]
    end else if (io_we) begin // @[RAMWrapper.scala 290:15]
      if (6'h1c == io_addr) begin // @[RAMWrapper.scala 291:18]
        mem_28 <= io_din; // @[RAMWrapper.scala 291:18]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 286:20]
      mem_29 <= 256'h0; // @[RAMWrapper.scala 286:20]
    end else if (io_we) begin // @[RAMWrapper.scala 290:15]
      if (6'h1d == io_addr) begin // @[RAMWrapper.scala 291:18]
        mem_29 <= io_din; // @[RAMWrapper.scala 291:18]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 286:20]
      mem_30 <= 256'h0; // @[RAMWrapper.scala 286:20]
    end else if (io_we) begin // @[RAMWrapper.scala 290:15]
      if (6'h1e == io_addr) begin // @[RAMWrapper.scala 291:18]
        mem_30 <= io_din; // @[RAMWrapper.scala 291:18]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 286:20]
      mem_31 <= 256'h0; // @[RAMWrapper.scala 286:20]
    end else if (io_we) begin // @[RAMWrapper.scala 290:15]
      if (6'h1f == io_addr) begin // @[RAMWrapper.scala 291:18]
        mem_31 <= io_din; // @[RAMWrapper.scala 291:18]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 286:20]
      mem_32 <= 256'h0; // @[RAMWrapper.scala 286:20]
    end else if (io_we) begin // @[RAMWrapper.scala 290:15]
      if (6'h20 == io_addr) begin // @[RAMWrapper.scala 291:18]
        mem_32 <= io_din; // @[RAMWrapper.scala 291:18]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 286:20]
      mem_33 <= 256'h0; // @[RAMWrapper.scala 286:20]
    end else if (io_we) begin // @[RAMWrapper.scala 290:15]
      if (6'h21 == io_addr) begin // @[RAMWrapper.scala 291:18]
        mem_33 <= io_din; // @[RAMWrapper.scala 291:18]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 286:20]
      mem_34 <= 256'h0; // @[RAMWrapper.scala 286:20]
    end else if (io_we) begin // @[RAMWrapper.scala 290:15]
      if (6'h22 == io_addr) begin // @[RAMWrapper.scala 291:18]
        mem_34 <= io_din; // @[RAMWrapper.scala 291:18]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 286:20]
      mem_35 <= 256'h0; // @[RAMWrapper.scala 286:20]
    end else if (io_we) begin // @[RAMWrapper.scala 290:15]
      if (6'h23 == io_addr) begin // @[RAMWrapper.scala 291:18]
        mem_35 <= io_din; // @[RAMWrapper.scala 291:18]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 286:20]
      mem_36 <= 256'h0; // @[RAMWrapper.scala 286:20]
    end else if (io_we) begin // @[RAMWrapper.scala 290:15]
      if (6'h24 == io_addr) begin // @[RAMWrapper.scala 291:18]
        mem_36 <= io_din; // @[RAMWrapper.scala 291:18]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 286:20]
      mem_37 <= 256'h0; // @[RAMWrapper.scala 286:20]
    end else if (io_we) begin // @[RAMWrapper.scala 290:15]
      if (6'h25 == io_addr) begin // @[RAMWrapper.scala 291:18]
        mem_37 <= io_din; // @[RAMWrapper.scala 291:18]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 286:20]
      mem_38 <= 256'h0; // @[RAMWrapper.scala 286:20]
    end else if (io_we) begin // @[RAMWrapper.scala 290:15]
      if (6'h26 == io_addr) begin // @[RAMWrapper.scala 291:18]
        mem_38 <= io_din; // @[RAMWrapper.scala 291:18]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 286:20]
      mem_39 <= 256'h0; // @[RAMWrapper.scala 286:20]
    end else if (io_we) begin // @[RAMWrapper.scala 290:15]
      if (6'h27 == io_addr) begin // @[RAMWrapper.scala 291:18]
        mem_39 <= io_din; // @[RAMWrapper.scala 291:18]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 286:20]
      mem_40 <= 256'h0; // @[RAMWrapper.scala 286:20]
    end else if (io_we) begin // @[RAMWrapper.scala 290:15]
      if (6'h28 == io_addr) begin // @[RAMWrapper.scala 291:18]
        mem_40 <= io_din; // @[RAMWrapper.scala 291:18]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 286:20]
      mem_41 <= 256'h0; // @[RAMWrapper.scala 286:20]
    end else if (io_we) begin // @[RAMWrapper.scala 290:15]
      if (6'h29 == io_addr) begin // @[RAMWrapper.scala 291:18]
        mem_41 <= io_din; // @[RAMWrapper.scala 291:18]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 286:20]
      mem_42 <= 256'h0; // @[RAMWrapper.scala 286:20]
    end else if (io_we) begin // @[RAMWrapper.scala 290:15]
      if (6'h2a == io_addr) begin // @[RAMWrapper.scala 291:18]
        mem_42 <= io_din; // @[RAMWrapper.scala 291:18]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 286:20]
      mem_43 <= 256'h0; // @[RAMWrapper.scala 286:20]
    end else if (io_we) begin // @[RAMWrapper.scala 290:15]
      if (6'h2b == io_addr) begin // @[RAMWrapper.scala 291:18]
        mem_43 <= io_din; // @[RAMWrapper.scala 291:18]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 286:20]
      mem_44 <= 256'h0; // @[RAMWrapper.scala 286:20]
    end else if (io_we) begin // @[RAMWrapper.scala 290:15]
      if (6'h2c == io_addr) begin // @[RAMWrapper.scala 291:18]
        mem_44 <= io_din; // @[RAMWrapper.scala 291:18]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 286:20]
      mem_45 <= 256'h0; // @[RAMWrapper.scala 286:20]
    end else if (io_we) begin // @[RAMWrapper.scala 290:15]
      if (6'h2d == io_addr) begin // @[RAMWrapper.scala 291:18]
        mem_45 <= io_din; // @[RAMWrapper.scala 291:18]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 286:20]
      mem_46 <= 256'h0; // @[RAMWrapper.scala 286:20]
    end else if (io_we) begin // @[RAMWrapper.scala 290:15]
      if (6'h2e == io_addr) begin // @[RAMWrapper.scala 291:18]
        mem_46 <= io_din; // @[RAMWrapper.scala 291:18]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 286:20]
      mem_47 <= 256'h0; // @[RAMWrapper.scala 286:20]
    end else if (io_we) begin // @[RAMWrapper.scala 290:15]
      if (6'h2f == io_addr) begin // @[RAMWrapper.scala 291:18]
        mem_47 <= io_din; // @[RAMWrapper.scala 291:18]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 286:20]
      mem_48 <= 256'h0; // @[RAMWrapper.scala 286:20]
    end else if (io_we) begin // @[RAMWrapper.scala 290:15]
      if (6'h30 == io_addr) begin // @[RAMWrapper.scala 291:18]
        mem_48 <= io_din; // @[RAMWrapper.scala 291:18]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 286:20]
      mem_49 <= 256'h0; // @[RAMWrapper.scala 286:20]
    end else if (io_we) begin // @[RAMWrapper.scala 290:15]
      if (6'h31 == io_addr) begin // @[RAMWrapper.scala 291:18]
        mem_49 <= io_din; // @[RAMWrapper.scala 291:18]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 286:20]
      mem_50 <= 256'h0; // @[RAMWrapper.scala 286:20]
    end else if (io_we) begin // @[RAMWrapper.scala 290:15]
      if (6'h32 == io_addr) begin // @[RAMWrapper.scala 291:18]
        mem_50 <= io_din; // @[RAMWrapper.scala 291:18]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 286:20]
      mem_51 <= 256'h0; // @[RAMWrapper.scala 286:20]
    end else if (io_we) begin // @[RAMWrapper.scala 290:15]
      if (6'h33 == io_addr) begin // @[RAMWrapper.scala 291:18]
        mem_51 <= io_din; // @[RAMWrapper.scala 291:18]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 286:20]
      mem_52 <= 256'h0; // @[RAMWrapper.scala 286:20]
    end else if (io_we) begin // @[RAMWrapper.scala 290:15]
      if (6'h34 == io_addr) begin // @[RAMWrapper.scala 291:18]
        mem_52 <= io_din; // @[RAMWrapper.scala 291:18]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 286:20]
      mem_53 <= 256'h0; // @[RAMWrapper.scala 286:20]
    end else if (io_we) begin // @[RAMWrapper.scala 290:15]
      if (6'h35 == io_addr) begin // @[RAMWrapper.scala 291:18]
        mem_53 <= io_din; // @[RAMWrapper.scala 291:18]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 286:20]
      mem_54 <= 256'h0; // @[RAMWrapper.scala 286:20]
    end else if (io_we) begin // @[RAMWrapper.scala 290:15]
      if (6'h36 == io_addr) begin // @[RAMWrapper.scala 291:18]
        mem_54 <= io_din; // @[RAMWrapper.scala 291:18]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 286:20]
      mem_55 <= 256'h0; // @[RAMWrapper.scala 286:20]
    end else if (io_we) begin // @[RAMWrapper.scala 290:15]
      if (6'h37 == io_addr) begin // @[RAMWrapper.scala 291:18]
        mem_55 <= io_din; // @[RAMWrapper.scala 291:18]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 286:20]
      mem_56 <= 256'h0; // @[RAMWrapper.scala 286:20]
    end else if (io_we) begin // @[RAMWrapper.scala 290:15]
      if (6'h38 == io_addr) begin // @[RAMWrapper.scala 291:18]
        mem_56 <= io_din; // @[RAMWrapper.scala 291:18]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 286:20]
      mem_57 <= 256'h0; // @[RAMWrapper.scala 286:20]
    end else if (io_we) begin // @[RAMWrapper.scala 290:15]
      if (6'h39 == io_addr) begin // @[RAMWrapper.scala 291:18]
        mem_57 <= io_din; // @[RAMWrapper.scala 291:18]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 286:20]
      mem_58 <= 256'h0; // @[RAMWrapper.scala 286:20]
    end else if (io_we) begin // @[RAMWrapper.scala 290:15]
      if (6'h3a == io_addr) begin // @[RAMWrapper.scala 291:18]
        mem_58 <= io_din; // @[RAMWrapper.scala 291:18]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 286:20]
      mem_59 <= 256'h0; // @[RAMWrapper.scala 286:20]
    end else if (io_we) begin // @[RAMWrapper.scala 290:15]
      if (6'h3b == io_addr) begin // @[RAMWrapper.scala 291:18]
        mem_59 <= io_din; // @[RAMWrapper.scala 291:18]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 286:20]
      mem_60 <= 256'h0; // @[RAMWrapper.scala 286:20]
    end else if (io_we) begin // @[RAMWrapper.scala 290:15]
      if (6'h3c == io_addr) begin // @[RAMWrapper.scala 291:18]
        mem_60 <= io_din; // @[RAMWrapper.scala 291:18]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 286:20]
      mem_61 <= 256'h0; // @[RAMWrapper.scala 286:20]
    end else if (io_we) begin // @[RAMWrapper.scala 290:15]
      if (6'h3d == io_addr) begin // @[RAMWrapper.scala 291:18]
        mem_61 <= io_din; // @[RAMWrapper.scala 291:18]
      end
    end
    if (reset) begin // @[RAMWrapper.scala 288:21]
      io_dout_REG <= 256'h0; // @[RAMWrapper.scala 288:21]
    end else if (6'h3d == io_addr) begin // @[RAMWrapper.scala 288:21]
      io_dout_REG <= mem_61; // @[RAMWrapper.scala 288:21]
    end else if (6'h3c == io_addr) begin // @[RAMWrapper.scala 288:21]
      io_dout_REG <= mem_60; // @[RAMWrapper.scala 288:21]
    end else if (6'h3b == io_addr) begin // @[RAMWrapper.scala 288:21]
      io_dout_REG <= mem_59; // @[RAMWrapper.scala 288:21]
    end else begin
      io_dout_REG <= _GEN_58;
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
  _RAND_0 = {8{`RANDOM}};
  mem_0 = _RAND_0[255:0];
  _RAND_1 = {8{`RANDOM}};
  mem_1 = _RAND_1[255:0];
  _RAND_2 = {8{`RANDOM}};
  mem_2 = _RAND_2[255:0];
  _RAND_3 = {8{`RANDOM}};
  mem_3 = _RAND_3[255:0];
  _RAND_4 = {8{`RANDOM}};
  mem_4 = _RAND_4[255:0];
  _RAND_5 = {8{`RANDOM}};
  mem_5 = _RAND_5[255:0];
  _RAND_6 = {8{`RANDOM}};
  mem_6 = _RAND_6[255:0];
  _RAND_7 = {8{`RANDOM}};
  mem_7 = _RAND_7[255:0];
  _RAND_8 = {8{`RANDOM}};
  mem_8 = _RAND_8[255:0];
  _RAND_9 = {8{`RANDOM}};
  mem_9 = _RAND_9[255:0];
  _RAND_10 = {8{`RANDOM}};
  mem_10 = _RAND_10[255:0];
  _RAND_11 = {8{`RANDOM}};
  mem_11 = _RAND_11[255:0];
  _RAND_12 = {8{`RANDOM}};
  mem_12 = _RAND_12[255:0];
  _RAND_13 = {8{`RANDOM}};
  mem_13 = _RAND_13[255:0];
  _RAND_14 = {8{`RANDOM}};
  mem_14 = _RAND_14[255:0];
  _RAND_15 = {8{`RANDOM}};
  mem_15 = _RAND_15[255:0];
  _RAND_16 = {8{`RANDOM}};
  mem_16 = _RAND_16[255:0];
  _RAND_17 = {8{`RANDOM}};
  mem_17 = _RAND_17[255:0];
  _RAND_18 = {8{`RANDOM}};
  mem_18 = _RAND_18[255:0];
  _RAND_19 = {8{`RANDOM}};
  mem_19 = _RAND_19[255:0];
  _RAND_20 = {8{`RANDOM}};
  mem_20 = _RAND_20[255:0];
  _RAND_21 = {8{`RANDOM}};
  mem_21 = _RAND_21[255:0];
  _RAND_22 = {8{`RANDOM}};
  mem_22 = _RAND_22[255:0];
  _RAND_23 = {8{`RANDOM}};
  mem_23 = _RAND_23[255:0];
  _RAND_24 = {8{`RANDOM}};
  mem_24 = _RAND_24[255:0];
  _RAND_25 = {8{`RANDOM}};
  mem_25 = _RAND_25[255:0];
  _RAND_26 = {8{`RANDOM}};
  mem_26 = _RAND_26[255:0];
  _RAND_27 = {8{`RANDOM}};
  mem_27 = _RAND_27[255:0];
  _RAND_28 = {8{`RANDOM}};
  mem_28 = _RAND_28[255:0];
  _RAND_29 = {8{`RANDOM}};
  mem_29 = _RAND_29[255:0];
  _RAND_30 = {8{`RANDOM}};
  mem_30 = _RAND_30[255:0];
  _RAND_31 = {8{`RANDOM}};
  mem_31 = _RAND_31[255:0];
  _RAND_32 = {8{`RANDOM}};
  mem_32 = _RAND_32[255:0];
  _RAND_33 = {8{`RANDOM}};
  mem_33 = _RAND_33[255:0];
  _RAND_34 = {8{`RANDOM}};
  mem_34 = _RAND_34[255:0];
  _RAND_35 = {8{`RANDOM}};
  mem_35 = _RAND_35[255:0];
  _RAND_36 = {8{`RANDOM}};
  mem_36 = _RAND_36[255:0];
  _RAND_37 = {8{`RANDOM}};
  mem_37 = _RAND_37[255:0];
  _RAND_38 = {8{`RANDOM}};
  mem_38 = _RAND_38[255:0];
  _RAND_39 = {8{`RANDOM}};
  mem_39 = _RAND_39[255:0];
  _RAND_40 = {8{`RANDOM}};
  mem_40 = _RAND_40[255:0];
  _RAND_41 = {8{`RANDOM}};
  mem_41 = _RAND_41[255:0];
  _RAND_42 = {8{`RANDOM}};
  mem_42 = _RAND_42[255:0];
  _RAND_43 = {8{`RANDOM}};
  mem_43 = _RAND_43[255:0];
  _RAND_44 = {8{`RANDOM}};
  mem_44 = _RAND_44[255:0];
  _RAND_45 = {8{`RANDOM}};
  mem_45 = _RAND_45[255:0];
  _RAND_46 = {8{`RANDOM}};
  mem_46 = _RAND_46[255:0];
  _RAND_47 = {8{`RANDOM}};
  mem_47 = _RAND_47[255:0];
  _RAND_48 = {8{`RANDOM}};
  mem_48 = _RAND_48[255:0];
  _RAND_49 = {8{`RANDOM}};
  mem_49 = _RAND_49[255:0];
  _RAND_50 = {8{`RANDOM}};
  mem_50 = _RAND_50[255:0];
  _RAND_51 = {8{`RANDOM}};
  mem_51 = _RAND_51[255:0];
  _RAND_52 = {8{`RANDOM}};
  mem_52 = _RAND_52[255:0];
  _RAND_53 = {8{`RANDOM}};
  mem_53 = _RAND_53[255:0];
  _RAND_54 = {8{`RANDOM}};
  mem_54 = _RAND_54[255:0];
  _RAND_55 = {8{`RANDOM}};
  mem_55 = _RAND_55[255:0];
  _RAND_56 = {8{`RANDOM}};
  mem_56 = _RAND_56[255:0];
  _RAND_57 = {8{`RANDOM}};
  mem_57 = _RAND_57[255:0];
  _RAND_58 = {8{`RANDOM}};
  mem_58 = _RAND_58[255:0];
  _RAND_59 = {8{`RANDOM}};
  mem_59 = _RAND_59[255:0];
  _RAND_60 = {8{`RANDOM}};
  mem_60 = _RAND_60[255:0];
  _RAND_61 = {8{`RANDOM}};
  mem_61 = _RAND_61[255:0];
  _RAND_62 = {8{`RANDOM}};
  io_dout_REG = _RAND_62[255:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210134_SinglePortBRAM(
  input          clock,
  input          reset,
  input          io_we,
  input  [5:0]   io_addr,
  input  [255:0] io_din,
  output [255:0] io_dout
);
  wire  sim_single_port_bram_clock; // @[RAMWrapper.scala 275:38]
  wire  sim_single_port_bram_reset; // @[RAMWrapper.scala 275:38]
  wire  sim_single_port_bram_io_we; // @[RAMWrapper.scala 275:38]
  wire [5:0] sim_single_port_bram_io_addr; // @[RAMWrapper.scala 275:38]
  wire [255:0] sim_single_port_bram_io_din; // @[RAMWrapper.scala 275:38]
  wire [255:0] sim_single_port_bram_io_dout; // @[RAMWrapper.scala 275:38]
  ysyx_210134_SimSinglePortBRAM sim_single_port_bram ( // @[RAMWrapper.scala 275:38]
    .clock(sim_single_port_bram_clock),
    .reset(sim_single_port_bram_reset),
    .io_we(sim_single_port_bram_io_we),
    .io_addr(sim_single_port_bram_io_addr),
    .io_din(sim_single_port_bram_io_din),
    .io_dout(sim_single_port_bram_io_dout)
  );
  assign io_dout = sim_single_port_bram_io_dout; // @[RAMWrapper.scala 276:29]
  assign sim_single_port_bram_clock = clock;
  assign sim_single_port_bram_reset = reset;
  assign sim_single_port_bram_io_we = io_we; // @[RAMWrapper.scala 276:29]
  assign sim_single_port_bram_io_addr = io_addr; // @[RAMWrapper.scala 276:29]
  assign sim_single_port_bram_io_din = io_din; // @[RAMWrapper.scala 276:29]
endmodule
module ysyx_210134_BPU(
  input         clock,
  input         reset,
  input  [63:0] io_req_next_line,
  output        io_resp_taken_vec_0,
  output        io_resp_taken_vec_1,
  output [63:0] io_resp_target_first,
  output [1:0]  io_resp_state_second,
  input         io_update_dec_v,
  input  [63:0] io_update_dec_pc_br,
  input         io_update_exe_v,
  input         io_update_exe_errpr,
  input  [63:0] io_update_exe_pc_br,
  input  [63:0] io_update_exe_target,
  input         io_update_exe_taken
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [255:0] _RAND_6;
  reg [31:0] _RAND_7;
`endif // RANDOMIZE_REG_INIT
  wire  history_clock; // @[BPU.scala 86:23]
  wire  history_reset; // @[BPU.scala 86:23]
  wire  history_io_wea; // @[BPU.scala 86:23]
  wire  history_io_addra; // @[BPU.scala 86:23]
  wire  history_io_addrb; // @[BPU.scala 86:23]
  wire [255:0] history_io_dina; // @[BPU.scala 86:23]
  wire [255:0] history_io_douta; // @[BPU.scala 86:23]
  wire [255:0] history_io_doutb; // @[BPU.scala 86:23]
  wire  buffer_clock; // @[BPU.scala 87:23]
  wire  buffer_reset; // @[BPU.scala 87:23]
  wire  buffer_io_we; // @[BPU.scala 87:23]
  wire [5:0] buffer_io_addr; // @[BPU.scala 87:23]
  wire [255:0] buffer_io_din; // @[BPU.scala 87:23]
  wire [255:0] buffer_io_dout; // @[BPU.scala 87:23]
  reg [7:0] bht_cache_tag_0; // @[BPU.scala 77:31]
  reg [1:0] bht_cache_stat_0; // @[BPU.scala 78:31]
  reg  cache_or_update_hit; // @[BPU.scala 82:36]
  reg [1:0] chosen_result; // @[BPU.scala 83:30]
  wire  _waddr_T = ~io_update_dec_v; // @[BPU.scala 90:24]
  wire [63:0] waddr = ~io_update_dec_v ? io_update_exe_pc_br : io_update_dec_pc_br; // @[BPU.scala 90:23]
  wire  _update_T_6 = io_update_exe_taken ? ~(&io_update_exe_pc_br[1:0]) : |io_update_exe_pc_br[1:0]; // @[BPU.scala 92:45]
  wire  update = _waddr_T ? _update_T_6 : 1'h1; // @[BPU.scala 92:23]
  wire [1:0] _wdata_T_3 = io_update_exe_pc_br[1:0] + 2'h1; // @[BPU.scala 93:93]
  wire [1:0] _wdata_T_6 = io_update_exe_pc_br[1:0] - 2'h1; // @[BPU.scala 93:126]
  wire [1:0] _wdata_T_7 = io_update_exe_taken ? _wdata_T_3 : _wdata_T_6; // @[BPU.scala 93:45]
  wire [1:0] _wdata_T_10 = io_update_dec_pc_br[1:0] - 2'h1; // @[BPU.scala 93:160]
  wire [1:0] wdata = _waddr_T ? _wdata_T_7 : _wdata_T_10; // @[BPU.scala 93:23]
  wire  history_io_addra_higher_hi_hi_hi = waddr[16] ^ waddr[15] ^ waddr[9]; // @[BPU.scala 60:56]
  wire  history_io_addra_higher_hi_hi_lo = waddr[15] ^ waddr[14] ^ waddr[8]; // @[BPU.scala 60:105]
  wire  history_io_addra_higher_hi_lo = waddr[14] ^ waddr[13] ^ waddr[7]; // @[BPU.scala 60:154]
  wire  history_io_addra_higher_lo_hi_hi = waddr[13] ^ waddr[12] ^ waddr[6]; // @[BPU.scala 60:203]
  wire  history_io_addra_higher_lo_hi_lo = waddr[12] ^ waddr[11] ^ waddr[5]; // @[BPU.scala 60:252]
  wire  history_io_addra_higher_lo_lo = waddr[11] ^ waddr[10] ^ waddr[4]; // @[BPU.scala 60:300]
  wire  history_io_addra_lo = waddr[10] ^ waddr[9] ^ waddr[3]; // @[BPU.scala 64:40]
  wire  history_io_addra_lo_1 = waddr[2]; // @[BPU.scala 74:35]
  wire [7:0] _history_io_addra_T_4 = {history_io_addra_higher_hi_hi_hi,history_io_addra_higher_hi_hi_lo,
    history_io_addra_higher_hi_lo,history_io_addra_higher_lo_hi_hi,history_io_addra_higher_lo_hi_lo,
    history_io_addra_higher_lo_lo,history_io_addra_lo,history_io_addra_lo_1}; // @[Cat.scala 30:58]
  wire  history_io_addra_higher_hi_hi_hi_1 = io_req_next_line[16] ^ io_req_next_line[15] ^ io_req_next_line[9]; // @[BPU.scala 60:56]
  wire  history_io_addra_higher_hi_hi_lo_1 = io_req_next_line[15] ^ io_req_next_line[14] ^ io_req_next_line[8]; // @[BPU.scala 60:105]
  wire  history_io_addra_higher_hi_lo_1 = io_req_next_line[14] ^ io_req_next_line[13] ^ io_req_next_line[7]; // @[BPU.scala 60:154]
  wire  history_io_addra_higher_lo_hi_hi_1 = io_req_next_line[13] ^ io_req_next_line[12] ^ io_req_next_line[6]; // @[BPU.scala 60:203]
  wire  history_io_addra_higher_lo_hi_lo_1 = io_req_next_line[12] ^ io_req_next_line[11] ^ io_req_next_line[5]; // @[BPU.scala 60:252]
  wire  history_io_addra_higher_lo_lo_1 = io_req_next_line[11] ^ io_req_next_line[10] ^ io_req_next_line[4]; // @[BPU.scala 60:300]
  wire  history_io_addra_lo_2 = io_req_next_line[10] ^ io_req_next_line[9] ^ io_req_next_line[3]; // @[BPU.scala 64:40]
  wire  history_io_addra_lo_3 = io_req_next_line[2]; // @[BPU.scala 74:35]
  wire [7:0] _history_io_addra_T_9 = {history_io_addra_higher_hi_hi_hi_1,history_io_addra_higher_hi_hi_lo_1,
    history_io_addra_higher_hi_lo_1,history_io_addra_higher_lo_hi_hi_1,history_io_addra_higher_lo_hi_lo_1,
    history_io_addra_higher_lo_lo_1,history_io_addra_lo_2,history_io_addra_lo_3}; // @[Cat.scala 30:58]
  wire [7:0] _history_io_addra_T_10 = update ? _history_io_addra_T_4 : _history_io_addra_T_9; // @[BPU.scala 97:26]
  wire [63:0] _history_io_addrb_T_1 = io_req_next_line + 64'h4; // @[BPU.scala 98:60]
  wire  history_io_addrb_higher_hi_hi_hi = _history_io_addrb_T_1[16] ^ _history_io_addrb_T_1[15] ^ _history_io_addrb_T_1
    [9]; // @[BPU.scala 60:56]
  wire  history_io_addrb_higher_hi_hi_lo = _history_io_addrb_T_1[15] ^ _history_io_addrb_T_1[14] ^ _history_io_addrb_T_1
    [8]; // @[BPU.scala 60:105]
  wire  history_io_addrb_higher_hi_lo = _history_io_addrb_T_1[14] ^ _history_io_addrb_T_1[13] ^ _history_io_addrb_T_1[7]
    ; // @[BPU.scala 60:154]
  wire  history_io_addrb_higher_lo_hi_hi = _history_io_addrb_T_1[13] ^ _history_io_addrb_T_1[12] ^ _history_io_addrb_T_1
    [6]; // @[BPU.scala 60:203]
  wire  history_io_addrb_higher_lo_hi_lo = _history_io_addrb_T_1[12] ^ _history_io_addrb_T_1[11] ^ _history_io_addrb_T_1
    [5]; // @[BPU.scala 60:252]
  wire  history_io_addrb_higher_lo_lo = _history_io_addrb_T_1[11] ^ _history_io_addrb_T_1[10] ^ _history_io_addrb_T_1[4]
    ; // @[BPU.scala 60:300]
  wire  history_io_addrb_lo = _history_io_addrb_T_1[10] ^ _history_io_addrb_T_1[9] ^ _history_io_addrb_T_1[3]; // @[BPU.scala 64:40]
  wire  history_io_addrb_lo_1 = _history_io_addrb_T_1[2]; // @[BPU.scala 74:35]
  wire [7:0] _history_io_addrb_T_6 = {history_io_addrb_higher_hi_hi_hi,history_io_addrb_higher_hi_hi_lo,
    history_io_addrb_higher_hi_lo,history_io_addrb_higher_lo_hi_hi,history_io_addrb_higher_lo_hi_lo,
    history_io_addrb_higher_lo_lo,history_io_addrb_lo,history_io_addrb_lo_1}; // @[Cat.scala 30:58]
  reg  last_update; // @[BPU.scala 104:28]
  wire [1:0] _bht_first_T_1 = cache_or_update_hit ? chosen_result : 2'h0; // @[BPU.scala 105:41]
  wire [255:0] bht_first = last_update ? {{254'd0}, _bht_first_T_1} : history_io_douta; // @[BPU.scala 105:24]
  wire [63:0] _buffer_io_addr_T = io_update_exe_errpr ? io_update_exe_pc_br : io_req_next_line; // @[BPU.scala 114:44]
  wire  buffer_io_addr_higher_hi_hi_hi = _buffer_io_addr_T[16] ^ _buffer_io_addr_T[15] ^ _buffer_io_addr_T[9]; // @[BPU.scala 60:56]
  wire  buffer_io_addr_higher_hi_hi_lo = _buffer_io_addr_T[15] ^ _buffer_io_addr_T[14] ^ _buffer_io_addr_T[8]; // @[BPU.scala 60:105]
  wire  buffer_io_addr_higher_hi_lo = _buffer_io_addr_T[14] ^ _buffer_io_addr_T[13] ^ _buffer_io_addr_T[7]; // @[BPU.scala 60:154]
  wire  buffer_io_addr_higher_lo_hi_hi = _buffer_io_addr_T[13] ^ _buffer_io_addr_T[12] ^ _buffer_io_addr_T[6]; // @[BPU.scala 60:203]
  wire  buffer_io_addr_higher_lo_hi_lo = _buffer_io_addr_T[12] ^ _buffer_io_addr_T[11] ^ _buffer_io_addr_T[5]; // @[BPU.scala 60:252]
  wire  buffer_io_addr_higher_lo_lo = _buffer_io_addr_T[11] ^ _buffer_io_addr_T[10] ^ _buffer_io_addr_T[4]; // @[BPU.scala 60:300]
  wire  buffer_io_addr_lo = _buffer_io_addr_T[10] ^ _buffer_io_addr_T[9] ^ _buffer_io_addr_T[3]; // @[BPU.scala 64:40]
  wire  buffer_io_addr_lo_1 = _buffer_io_addr_T[2]; // @[BPU.scala 74:35]
  wire [7:0] _buffer_io_addr_T_5 = {buffer_io_addr_higher_hi_hi_hi,buffer_io_addr_higher_hi_hi_lo,
    buffer_io_addr_higher_hi_lo,buffer_io_addr_higher_lo_hi_hi,buffer_io_addr_higher_lo_hi_lo,
    buffer_io_addr_higher_lo_lo,buffer_io_addr_lo,buffer_io_addr_lo_1}; // @[Cat.scala 30:58]
  reg  io_resp_target_first_REG; // @[BPU.scala 116:42]
  reg [255:0] io_resp_target_first_REG_1; // @[BPU.scala 116:70]
  wire [255:0] io_resp_target_first_hi = io_resp_target_first_REG ? io_resp_target_first_REG_1 : buffer_io_dout; // @[BPU.scala 116:34]
  wire [511:0] _io_resp_target_first_T = {io_resp_target_first_hi,bht_first}; // @[Cat.scala 30:58]
  wire  hit_in_bht_cache = bht_cache_tag_0 == _history_io_addra_T_9; // @[BPU.scala 123:28]
  reg [7:0] bht_cache_tag_0_REG; // @[BPU.scala 139:49]
  wire [255:0] _GEN_2 = io_resp_taken_vec_0 & ~hit_in_bht_cache ? bht_first : {{254'd0}, bht_cache_stat_0}; // @[BPU.scala 135:57 BPU.scala 140:40 BPU.scala 78:31]
  wire [255:0] _GEN_3 = update & hit_in_bht_cache ? 256'h0 : _GEN_2; // @[BPU.scala 131:36 BPU.scala 133:25]
  wire  update_query_hit = _history_io_addra_T_9 == _history_io_addra_T_4; // @[BPU.scala 144:64]
  ysyx_210134_DualPortBRAM history ( // @[BPU.scala 86:23]
    .clock(history_clock),
    .reset(history_reset),
    .io_wea(history_io_wea),
    .io_addra(history_io_addra),
    .io_addrb(history_io_addrb),
    .io_dina(history_io_dina),
    .io_douta(history_io_douta),
    .io_doutb(history_io_doutb)
  );
  ysyx_210134_SinglePortBRAM buffer ( // @[BPU.scala 87:23]
    .clock(buffer_clock),
    .reset(buffer_reset),
    .io_we(buffer_io_we),
    .io_addr(buffer_io_addr),
    .io_din(buffer_io_din),
    .io_dout(buffer_io_dout)
  );
  assign io_resp_taken_vec_0 = ~io_resp_target_first[31] ? 1'h0 : bht_first[1]; // @[BPU.scala 107:30]
  assign io_resp_taken_vec_1 = history_io_doutb[1]; // @[BPU.scala 108:45]
  assign io_resp_target_first = _io_resp_target_first_T[63:0]; // @[BPU.scala 116:24]
  assign io_resp_state_second = history_io_doutb[1:0]; // @[BPU.scala 117:24]
  assign history_clock = clock;
  assign history_reset = reset;
  assign history_io_wea = _waddr_T ? _update_T_6 : 1'h1; // @[BPU.scala 92:23]
  assign history_io_addra = _history_io_addra_T_10[0]; // @[BPU.scala 97:20]
  assign history_io_addrb = _history_io_addrb_T_6[0]; // @[BPU.scala 98:20]
  assign history_io_dina = {{254'd0}, wdata}; // @[BPU.scala 93:23]
  assign buffer_clock = clock;
  assign buffer_reset = reset;
  assign buffer_io_we = io_update_exe_errpr & io_update_exe_v; // @[BPU.scala 113:39]
  assign buffer_io_addr = _buffer_io_addr_T_5[5:0]; // @[BPU.scala 114:18]
  assign buffer_io_din = {{194'd0}, io_update_exe_target[63:2]}; // @[BPU.scala 115:40]
  always @(posedge clock) begin
    if (reset) begin // @[BPU.scala 77:31]
      bht_cache_tag_0 <= 8'h0; // @[BPU.scala 77:31]
    end else if (!(update & hit_in_bht_cache)) begin // @[BPU.scala 131:36]
      if (io_resp_taken_vec_0 & ~hit_in_bht_cache) begin // @[BPU.scala 135:57]
        bht_cache_tag_0 <= bht_cache_tag_0_REG; // @[BPU.scala 139:39]
      end
    end
    if (reset) begin // @[BPU.scala 78:31]
      bht_cache_stat_0 <= 2'h0; // @[BPU.scala 78:31]
    end else begin
      bht_cache_stat_0 <= _GEN_3[1:0];
    end
    if (reset) begin // @[BPU.scala 82:36]
      cache_or_update_hit <= 1'h0; // @[BPU.scala 82:36]
    end else begin
      cache_or_update_hit <= hit_in_bht_cache | update_query_hit; // @[BPU.scala 145:23]
    end
    if (reset) begin // @[BPU.scala 83:30]
      chosen_result <= 2'h0; // @[BPU.scala 83:30]
    end else if (update_query_hit) begin // @[BPU.scala 146:23]
      if (_waddr_T) begin // @[BPU.scala 93:23]
        if (io_update_exe_taken) begin // @[BPU.scala 93:45]
          chosen_result <= _wdata_T_3;
        end else begin
          chosen_result <= _wdata_T_6;
        end
      end else begin
        chosen_result <= _wdata_T_10;
      end
    end else begin
      chosen_result <= bht_cache_stat_0;
    end
    if (reset) begin // @[BPU.scala 104:28]
      last_update <= 1'h0; // @[BPU.scala 104:28]
    end else if (_waddr_T) begin // @[BPU.scala 92:23]
      if (io_update_exe_taken) begin // @[BPU.scala 92:45]
        last_update <= ~(&io_update_exe_pc_br[1:0]);
      end else begin
        last_update <= |io_update_exe_pc_br[1:0];
      end
    end else begin
      last_update <= 1'h1;
    end
    if (reset) begin // @[BPU.scala 116:42]
      io_resp_target_first_REG <= 1'h0; // @[BPU.scala 116:42]
    end else begin
      io_resp_target_first_REG <= buffer_io_we; // @[BPU.scala 116:42]
    end
    if (reset) begin // @[BPU.scala 116:70]
      io_resp_target_first_REG_1 <= 256'h0; // @[BPU.scala 116:70]
    end else begin
      io_resp_target_first_REG_1 <= buffer_io_din; // @[BPU.scala 116:70]
    end
    if (reset) begin // @[BPU.scala 139:49]
      bht_cache_tag_0_REG <= 8'h0; // @[BPU.scala 139:49]
    end else begin
      bht_cache_tag_0_REG <= _history_io_addra_T_9; // @[BPU.scala 139:49]
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
  bht_cache_tag_0 = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  bht_cache_stat_0 = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  cache_or_update_hit = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  chosen_result = _RAND_3[1:0];
  _RAND_4 = {1{`RANDOM}};
  last_update = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  io_resp_target_first_REG = _RAND_5[0:0];
  _RAND_6 = {8{`RANDOM}};
  io_resp_target_first_REG_1 = _RAND_6[255:0];
  _RAND_7 = {1{`RANDOM}};
  bht_cache_tag_0_REG = _RAND_7[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210134_PCGen(
  input         clock,
  input         reset,
  input         io_please_wait,
  input         io_redirect,
  input  [63:0] io_redirect_pc,
  output [63:0] io_pc_o,
  output [1:0]  io_predict_sstat_o,
  output        io_predict_taken_o,
  output [63:0] io_predict_target_o,
  output        io_narrow_o,
  input         io_bpu_update_dec_v,
  input  [63:0] io_bpu_update_dec_pc_br,
  input         io_bpu_update_exe_v,
  input         io_bpu_update_exe_errpr,
  input  [63:0] io_bpu_update_exe_pc_br,
  input  [63:0] io_bpu_update_exe_target,
  input         io_bpu_update_exe_taken
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [63:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire  bpu_clock; // @[Frontend.scala 29:19]
  wire  bpu_reset; // @[Frontend.scala 29:19]
  wire [63:0] bpu_io_req_next_line; // @[Frontend.scala 29:19]
  wire  bpu_io_resp_taken_vec_0; // @[Frontend.scala 29:19]
  wire  bpu_io_resp_taken_vec_1; // @[Frontend.scala 29:19]
  wire [63:0] bpu_io_resp_target_first; // @[Frontend.scala 29:19]
  wire [1:0] bpu_io_resp_state_second; // @[Frontend.scala 29:19]
  wire  bpu_io_update_dec_v; // @[Frontend.scala 29:19]
  wire [63:0] bpu_io_update_dec_pc_br; // @[Frontend.scala 29:19]
  wire  bpu_io_update_exe_v; // @[Frontend.scala 29:19]
  wire  bpu_io_update_exe_errpr; // @[Frontend.scala 29:19]
  wire [63:0] bpu_io_update_exe_pc_br; // @[Frontend.scala 29:19]
  wire [63:0] bpu_io_update_exe_target; // @[Frontend.scala 29:19]
  wire  bpu_io_update_exe_taken; // @[Frontend.scala 29:19]
  reg [63:0] pc; // @[Frontend.scala 28:20]
  wire [61:0] legal_target_hi = bpu_io_resp_target_first[63:2]; // @[Frontend.scala 31:50]
  wire [63:0] legal_target = {legal_target_hi,2'h0}; // @[Cat.scala 30:58]
  wire  cross_line = pc[4:2] == 3'h7; // @[Frontend.scala 32:42]
  wire  fetch_one_word = io_narrow_o | cross_line; // @[Frontend.scala 33:36]
  reg  last_inst_in_line_predict_taken; // @[Frontend.scala 34:48]
  reg [63:0] last_inst_target; // @[Frontend.scala 35:33]
  wire  _reset_last_inst_pred_T = ~io_please_wait; // @[Frontend.scala 36:65]
  wire  reset_last_inst_pred = last_inst_in_line_predict_taken & ~io_please_wait; // @[Frontend.scala 36:62]
  wire [63:0] _npc_T_1 = pc + 64'h4; // @[Frontend.scala 38:148]
  wire [63:0] _npc_T_2 = last_inst_in_line_predict_taken ? last_inst_target : _npc_T_1; // @[Frontend.scala 38:93]
  wire [63:0] _npc_T_4 = pc + 64'h8; // @[Frontend.scala 38:203]
  wire [63:0] _npc_T_5 = bpu_io_resp_taken_vec_0 ? legal_target : _npc_T_4; // @[Frontend.scala 38:159]
  wire [63:0] _npc_T_6 = fetch_one_word ? _npc_T_2 : _npc_T_5; // @[Frontend.scala 38:73]
  wire [63:0] _npc_T_7 = io_please_wait ? pc : _npc_T_6; // @[Frontend.scala 38:49]
  wire  _GEN_0 = cross_line & bpu_io_resp_taken_vec_0 & _reset_last_inst_pred_T | last_inst_in_line_predict_taken; // @[Frontend.scala 43:74 Frontend.scala 44:37 Frontend.scala 34:48]
  ysyx_210134_BPU bpu ( // @[Frontend.scala 29:19]
    .clock(bpu_clock),
    .reset(bpu_reset),
    .io_req_next_line(bpu_io_req_next_line),
    .io_resp_taken_vec_0(bpu_io_resp_taken_vec_0),
    .io_resp_taken_vec_1(bpu_io_resp_taken_vec_1),
    .io_resp_target_first(bpu_io_resp_target_first),
    .io_resp_state_second(bpu_io_resp_state_second),
    .io_update_dec_v(bpu_io_update_dec_v),
    .io_update_dec_pc_br(bpu_io_update_dec_pc_br),
    .io_update_exe_v(bpu_io_update_exe_v),
    .io_update_exe_errpr(bpu_io_update_exe_errpr),
    .io_update_exe_pc_br(bpu_io_update_exe_pc_br),
    .io_update_exe_target(bpu_io_update_exe_target),
    .io_update_exe_taken(bpu_io_update_exe_taken)
  );
  assign io_pc_o = pc; // @[Frontend.scala 55:11]
  assign io_predict_sstat_o = bpu_io_resp_state_second; // @[Frontend.scala 56:22]
  assign io_predict_taken_o = bpu_io_resp_taken_vec_0; // @[Frontend.scala 53:23]
  assign io_predict_target_o = bpu_io_resp_target_first; // @[Frontend.scala 54:23]
  assign io_narrow_o = ~bpu_io_resp_taken_vec_0 & bpu_io_resp_taken_vec_1 | last_inst_in_line_predict_taken; // @[Frontend.scala 58:74]
  assign bpu_clock = clock;
  assign bpu_reset = reset;
  assign bpu_io_req_next_line = io_redirect ? io_redirect_pc : _npc_T_7; // @[Frontend.scala 38:16]
  assign bpu_io_update_dec_v = io_bpu_update_dec_v; // @[Frontend.scala 50:24]
  assign bpu_io_update_dec_pc_br = io_bpu_update_dec_pc_br; // @[Frontend.scala 50:24]
  assign bpu_io_update_exe_v = io_bpu_update_exe_v; // @[Frontend.scala 50:24]
  assign bpu_io_update_exe_errpr = io_bpu_update_exe_errpr; // @[Frontend.scala 50:24]
  assign bpu_io_update_exe_pc_br = io_bpu_update_exe_pc_br; // @[Frontend.scala 50:24]
  assign bpu_io_update_exe_target = io_bpu_update_exe_target; // @[Frontend.scala 50:24]
  assign bpu_io_update_exe_taken = io_bpu_update_exe_taken; // @[Frontend.scala 50:24]
  always @(posedge clock) begin
    if (reset) begin // @[Frontend.scala 28:20]
      pc <= 64'h30000000; // @[Frontend.scala 28:20]
    end else if (io_redirect) begin // @[Frontend.scala 38:16]
      pc <= io_redirect_pc;
    end else if (!(io_please_wait)) begin // @[Frontend.scala 38:49]
      if (fetch_one_word) begin // @[Frontend.scala 38:73]
        pc <= _npc_T_2;
      end else begin
        pc <= _npc_T_5;
      end
    end
    if (reset) begin // @[Frontend.scala 34:48]
      last_inst_in_line_predict_taken <= 1'h0; // @[Frontend.scala 34:48]
    end else if (io_redirect | reset_last_inst_pred) begin // @[Frontend.scala 41:46]
      last_inst_in_line_predict_taken <= 1'h0; // @[Frontend.scala 42:37]
    end else begin
      last_inst_in_line_predict_taken <= _GEN_0;
    end
    if (reset) begin // @[Frontend.scala 35:33]
      last_inst_target <= 64'h0; // @[Frontend.scala 35:33]
    end else if (cross_line) begin // @[Frontend.scala 46:26]
      last_inst_target <= legal_target;
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
  pc = _RAND_0[63:0];
  _RAND_1 = {1{`RANDOM}};
  last_inst_in_line_predict_taken = _RAND_1[0:0];
  _RAND_2 = {2{`RANDOM}};
  last_inst_target = _RAND_2[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210134_Dec(
  input  [63:0] io_pc,
  input  [31:0] io_inst,
  input         io_bht_predict_taken,
  input  [63:0] io_target_pc,
  output        io_mops_illegal,
  output [2:0]  io_mops_next_pc,
  output [1:0]  io_mops_alu_mdu_lsu,
  output [3:0]  io_mops_branch_type,
  output [1:0]  io_mops_src_a,
  output [1:0]  io_mops_src_b,
  output        io_mops_write_dest,
  output [3:0]  io_mops_alu_op,
  output        io_mops_alu_expand,
  output [2:0]  io_mops_mem_width,
  output [1:0]  io_mops_write_src,
  output [4:0]  io_mops_rs1,
  output [4:0]  io_mops_rs2,
  output [4:0]  io_mops_rd,
  output [63:0] io_mops_imm,
  output [63:0] io_mops_pc,
  output        io_mops_predict_taken,
  output [63:0] io_mops_target_pc
);
  wire [4:0] IRD = io_inst[11:7]; // @[Decode.scala 47:22]
  wire [11:0] CSR = io_inst[31:20]; // @[Decode.scala 48:22]
  wire [51:0] aluIIMM_hi = io_inst[31] ? 52'hfffffffffffff : 52'h0; // @[Bitwise.scala 72:12]
  wire [63:0] aluIIMM = {aluIIMM_hi,CSR}; // @[Cat.scala 30:58]
  wire [31:0] aluUIMM_hi_hi = io_inst[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [19:0] aluUIMM_hi_lo = io_inst[31:12]; // @[Decode.scala 52:59]
  wire [63:0] aluUIMM = {aluUIMM_hi_hi,aluUIMM_hi_lo,12'h0}; // @[Cat.scala 30:58]
  wire [5:0] shamtIMM_lo = io_inst[25:20]; // @[Decode.scala 53:48]
  wire [63:0] shamtIMM = {58'h0,shamtIMM_lo}; // @[Cat.scala 30:58]
  wire [6:0] lsuSIMM_hi_lo = io_inst[31:25]; // @[Decode.scala 55:59]
  wire [63:0] lsuSIMM = {aluIIMM_hi,lsuSIMM_hi_lo,IRD}; // @[Cat.scala 30:58]
  wire [42:0] JIMM_hi_hi_hi = io_inst[31] ? 43'h7ffffffffff : 43'h0; // @[Bitwise.scala 72:12]
  wire [7:0] JIMM_hi_lo = io_inst[19:12]; // @[Decode.scala 56:72]
  wire  JIMM_lo_hi_hi = io_inst[20]; // @[Decode.scala 56:89]
  wire [9:0] JIMM_lo_hi_lo = io_inst[30:21]; // @[Decode.scala 56:102]
  wire [63:0] JIMM = {JIMM_hi_hi_hi,io_inst[31],JIMM_hi_lo,JIMM_lo_hi_hi,JIMM_lo_hi_lo,1'h0}; // @[Cat.scala 30:58]
  wire [50:0] BIMM_hi_hi_hi = io_inst[31] ? 51'h7ffffffffffff : 51'h0; // @[Bitwise.scala 72:12]
  wire  BIMM_hi_lo = io_inst[7]; // @[Decode.scala 58:72]
  wire [5:0] BIMM_lo_hi_hi = io_inst[30:25]; // @[Decode.scala 58:84]
  wire [3:0] BIMM_lo_hi_lo = io_inst[11:8]; // @[Decode.scala 58:101]
  wire [63:0] BIMM = {BIMM_hi_hi_hi,io_inst[31],BIMM_hi_lo,BIMM_lo_hi_hi,BIMM_lo_hi_lo,1'h0}; // @[Cat.scala 30:58]
  wire [63:0] CSRIMM = {52'h0,CSR}; // @[Cat.scala 30:58]
  wire [31:0] _control_signal_T = io_inst & 32'h7f; // @[Lookup.scala 31:38]
  wire  _control_signal_T_1 = 32'h37 == _control_signal_T; // @[Lookup.scala 31:38]
  wire  _control_signal_T_3 = 32'h17 == _control_signal_T; // @[Lookup.scala 31:38]
  wire  _control_signal_T_5 = 32'h6f == _control_signal_T; // @[Lookup.scala 31:38]
  wire [31:0] _control_signal_T_6 = io_inst & 32'h707f; // @[Lookup.scala 31:38]
  wire  _control_signal_T_7 = 32'h67 == _control_signal_T_6; // @[Lookup.scala 31:38]
  wire  _control_signal_T_9 = 32'h63 == _control_signal_T_6; // @[Lookup.scala 31:38]
  wire  _control_signal_T_11 = 32'h1063 == _control_signal_T_6; // @[Lookup.scala 31:38]
  wire  _control_signal_T_13 = 32'h4063 == _control_signal_T_6; // @[Lookup.scala 31:38]
  wire  _control_signal_T_15 = 32'h5063 == _control_signal_T_6; // @[Lookup.scala 31:38]
  wire  _control_signal_T_17 = 32'h6063 == _control_signal_T_6; // @[Lookup.scala 31:38]
  wire  _control_signal_T_19 = 32'h7063 == _control_signal_T_6; // @[Lookup.scala 31:38]
  wire  _control_signal_T_21 = 32'h73 == io_inst; // @[Lookup.scala 31:38]
  wire  _control_signal_T_23 = 32'h3 == _control_signal_T_6; // @[Lookup.scala 31:38]
  wire  _control_signal_T_25 = 32'h1003 == _control_signal_T_6; // @[Lookup.scala 31:38]
  wire  _control_signal_T_27 = 32'h2003 == _control_signal_T_6; // @[Lookup.scala 31:38]
  wire  _control_signal_T_29 = 32'h4003 == _control_signal_T_6; // @[Lookup.scala 31:38]
  wire  _control_signal_T_31 = 32'h5003 == _control_signal_T_6; // @[Lookup.scala 31:38]
  wire  _control_signal_T_33 = 32'h23 == _control_signal_T_6; // @[Lookup.scala 31:38]
  wire  _control_signal_T_35 = 32'h1023 == _control_signal_T_6; // @[Lookup.scala 31:38]
  wire  _control_signal_T_37 = 32'h2023 == _control_signal_T_6; // @[Lookup.scala 31:38]
  wire  _control_signal_T_39 = 32'h13 == _control_signal_T_6; // @[Lookup.scala 31:38]
  wire  _control_signal_T_41 = 32'h2013 == _control_signal_T_6; // @[Lookup.scala 31:38]
  wire  _control_signal_T_43 = 32'h3013 == _control_signal_T_6; // @[Lookup.scala 31:38]
  wire  _control_signal_T_45 = 32'h4013 == _control_signal_T_6; // @[Lookup.scala 31:38]
  wire  _control_signal_T_47 = 32'h6013 == _control_signal_T_6; // @[Lookup.scala 31:38]
  wire  _control_signal_T_49 = 32'h7013 == _control_signal_T_6; // @[Lookup.scala 31:38]
  wire  _control_signal_T_51 = 32'h30200073 == io_inst; // @[Lookup.scala 31:38]
  wire  _control_signal_T_53 = 32'h10200073 == io_inst; // @[Lookup.scala 31:38]
  wire  _control_signal_T_55 = 32'h200073 == io_inst; // @[Lookup.scala 31:38]
  wire [31:0] _control_signal_T_56 = io_inst & 32'hfe00707f; // @[Lookup.scala 31:38]
  wire  _control_signal_T_57 = 32'h33 == _control_signal_T_56; // @[Lookup.scala 31:38]
  wire  _control_signal_T_59 = 32'h40000033 == _control_signal_T_56; // @[Lookup.scala 31:38]
  wire  _control_signal_T_61 = 32'h1033 == _control_signal_T_56; // @[Lookup.scala 31:38]
  wire  _control_signal_T_63 = 32'h2033 == _control_signal_T_56; // @[Lookup.scala 31:38]
  wire  _control_signal_T_65 = 32'h3033 == _control_signal_T_56; // @[Lookup.scala 31:38]
  wire  _control_signal_T_67 = 32'h4033 == _control_signal_T_56; // @[Lookup.scala 31:38]
  wire  _control_signal_T_69 = 32'h5033 == _control_signal_T_56; // @[Lookup.scala 31:38]
  wire  _control_signal_T_71 = 32'h40005033 == _control_signal_T_56; // @[Lookup.scala 31:38]
  wire  _control_signal_T_73 = 32'h6033 == _control_signal_T_56; // @[Lookup.scala 31:38]
  wire  _control_signal_T_75 = 32'h7033 == _control_signal_T_56; // @[Lookup.scala 31:38]
  wire [31:0] _control_signal_T_76 = io_inst & 32'hfc00707f; // @[Lookup.scala 31:38]
  wire  _control_signal_T_77 = 32'h1013 == _control_signal_T_76; // @[Lookup.scala 31:38]
  wire  _control_signal_T_79 = 32'h5013 == _control_signal_T_76; // @[Lookup.scala 31:38]
  wire  _control_signal_T_81 = 32'h40005013 == _control_signal_T_76; // @[Lookup.scala 31:38]
  wire  _control_signal_T_83 = 32'h1b == _control_signal_T_6; // @[Lookup.scala 31:38]
  wire  _control_signal_T_85 = 32'h101b == _control_signal_T_56; // @[Lookup.scala 31:38]
  wire  _control_signal_T_87 = 32'h501b == _control_signal_T_56; // @[Lookup.scala 31:38]
  wire  _control_signal_T_89 = 32'h4000501b == _control_signal_T_56; // @[Lookup.scala 31:38]
  wire  _control_signal_T_91 = 32'h3b == _control_signal_T_56; // @[Lookup.scala 31:38]
  wire  _control_signal_T_93 = 32'h4000003b == _control_signal_T_56; // @[Lookup.scala 31:38]
  wire  _control_signal_T_95 = 32'h103b == _control_signal_T_56; // @[Lookup.scala 31:38]
  wire  _control_signal_T_97 = 32'h503b == _control_signal_T_56; // @[Lookup.scala 31:38]
  wire  _control_signal_T_99 = 32'h4000503b == _control_signal_T_56; // @[Lookup.scala 31:38]
  wire  _control_signal_T_101 = 32'h3003 == _control_signal_T_6; // @[Lookup.scala 31:38]
  wire  _control_signal_T_103 = 32'h6003 == _control_signal_T_6; // @[Lookup.scala 31:38]
  wire  _control_signal_T_105 = 32'h3023 == _control_signal_T_6; // @[Lookup.scala 31:38]
  wire  _control_signal_T_107 = 32'h2000033 == _control_signal_T_56; // @[Lookup.scala 31:38]
  wire  _control_signal_T_109 = 32'h2001033 == _control_signal_T_56; // @[Lookup.scala 31:38]
  wire  _control_signal_T_111 = 32'h2002033 == _control_signal_T_56; // @[Lookup.scala 31:38]
  wire  _control_signal_T_113 = 32'h2003033 == _control_signal_T_56; // @[Lookup.scala 31:38]
  wire  _control_signal_T_115 = 32'h2004033 == _control_signal_T_56; // @[Lookup.scala 31:38]
  wire  _control_signal_T_117 = 32'h2005033 == _control_signal_T_56; // @[Lookup.scala 31:38]
  wire  _control_signal_T_119 = 32'h2006033 == _control_signal_T_56; // @[Lookup.scala 31:38]
  wire  _control_signal_T_121 = 32'h2007033 == _control_signal_T_56; // @[Lookup.scala 31:38]
  wire  _control_signal_T_123 = 32'h200003b == _control_signal_T_56; // @[Lookup.scala 31:38]
  wire  _control_signal_T_125 = 32'h200403b == _control_signal_T_56; // @[Lookup.scala 31:38]
  wire  _control_signal_T_127 = 32'h200503b == _control_signal_T_56; // @[Lookup.scala 31:38]
  wire  _control_signal_T_129 = 32'h200603b == _control_signal_T_56; // @[Lookup.scala 31:38]
  wire  _control_signal_T_131 = 32'h200703b == _control_signal_T_56; // @[Lookup.scala 31:38]
  wire  _control_signal_T_133 = 32'h1073 == _control_signal_T_6; // @[Lookup.scala 31:38]
  wire  _control_signal_T_135 = 32'h2073 == _control_signal_T_6; // @[Lookup.scala 31:38]
  wire  _control_signal_T_137 = 32'h3073 == _control_signal_T_6; // @[Lookup.scala 31:38]
  wire  _control_signal_T_139 = 32'h5073 == _control_signal_T_6; // @[Lookup.scala 31:38]
  wire  _control_signal_T_141 = 32'h6073 == _control_signal_T_6; // @[Lookup.scala 31:38]
  wire  _control_signal_T_143 = 32'h7073 == _control_signal_T_6; // @[Lookup.scala 31:38]
  wire  _control_signal_T_145 = 32'h100f == _control_signal_T_6; // @[Lookup.scala 31:38]
  wire  _control_signal_T_147 = 32'h6b == io_inst; // @[Lookup.scala 31:38]
  wire  _control_signal_T_149 = 32'h7b == io_inst; // @[Lookup.scala 31:38]
  wire  _control_signal_T_150 = _control_signal_T_149 ? 1'h0 : 1'h1; // @[Lookup.scala 33:37]
  wire  _control_signal_T_151 = _control_signal_T_147 ? 1'h0 : _control_signal_T_150; // @[Lookup.scala 33:37]
  wire  _control_signal_T_152 = _control_signal_T_145 ? 1'h0 : _control_signal_T_151; // @[Lookup.scala 33:37]
  wire  _control_signal_T_153 = _control_signal_T_143 ? 1'h0 : _control_signal_T_152; // @[Lookup.scala 33:37]
  wire  _control_signal_T_154 = _control_signal_T_141 ? 1'h0 : _control_signal_T_153; // @[Lookup.scala 33:37]
  wire  _control_signal_T_155 = _control_signal_T_139 ? 1'h0 : _control_signal_T_154; // @[Lookup.scala 33:37]
  wire  _control_signal_T_156 = _control_signal_T_137 ? 1'h0 : _control_signal_T_155; // @[Lookup.scala 33:37]
  wire  _control_signal_T_157 = _control_signal_T_135 ? 1'h0 : _control_signal_T_156; // @[Lookup.scala 33:37]
  wire  _control_signal_T_158 = _control_signal_T_133 ? 1'h0 : _control_signal_T_157; // @[Lookup.scala 33:37]
  wire  _control_signal_T_159 = _control_signal_T_131 ? 1'h0 : _control_signal_T_158; // @[Lookup.scala 33:37]
  wire  _control_signal_T_160 = _control_signal_T_129 ? 1'h0 : _control_signal_T_159; // @[Lookup.scala 33:37]
  wire  _control_signal_T_161 = _control_signal_T_127 ? 1'h0 : _control_signal_T_160; // @[Lookup.scala 33:37]
  wire  _control_signal_T_162 = _control_signal_T_125 ? 1'h0 : _control_signal_T_161; // @[Lookup.scala 33:37]
  wire  _control_signal_T_163 = _control_signal_T_123 ? 1'h0 : _control_signal_T_162; // @[Lookup.scala 33:37]
  wire  _control_signal_T_164 = _control_signal_T_121 ? 1'h0 : _control_signal_T_163; // @[Lookup.scala 33:37]
  wire  _control_signal_T_165 = _control_signal_T_119 ? 1'h0 : _control_signal_T_164; // @[Lookup.scala 33:37]
  wire  _control_signal_T_166 = _control_signal_T_117 ? 1'h0 : _control_signal_T_165; // @[Lookup.scala 33:37]
  wire  _control_signal_T_167 = _control_signal_T_115 ? 1'h0 : _control_signal_T_166; // @[Lookup.scala 33:37]
  wire  _control_signal_T_168 = _control_signal_T_113 ? 1'h0 : _control_signal_T_167; // @[Lookup.scala 33:37]
  wire  _control_signal_T_169 = _control_signal_T_111 ? 1'h0 : _control_signal_T_168; // @[Lookup.scala 33:37]
  wire  _control_signal_T_170 = _control_signal_T_109 ? 1'h0 : _control_signal_T_169; // @[Lookup.scala 33:37]
  wire  _control_signal_T_171 = _control_signal_T_107 ? 1'h0 : _control_signal_T_170; // @[Lookup.scala 33:37]
  wire  _control_signal_T_172 = _control_signal_T_105 ? 1'h0 : _control_signal_T_171; // @[Lookup.scala 33:37]
  wire  _control_signal_T_173 = _control_signal_T_103 ? 1'h0 : _control_signal_T_172; // @[Lookup.scala 33:37]
  wire  _control_signal_T_174 = _control_signal_T_101 ? 1'h0 : _control_signal_T_173; // @[Lookup.scala 33:37]
  wire  _control_signal_T_175 = _control_signal_T_99 ? 1'h0 : _control_signal_T_174; // @[Lookup.scala 33:37]
  wire  _control_signal_T_176 = _control_signal_T_97 ? 1'h0 : _control_signal_T_175; // @[Lookup.scala 33:37]
  wire  _control_signal_T_177 = _control_signal_T_95 ? 1'h0 : _control_signal_T_176; // @[Lookup.scala 33:37]
  wire  _control_signal_T_178 = _control_signal_T_93 ? 1'h0 : _control_signal_T_177; // @[Lookup.scala 33:37]
  wire  _control_signal_T_179 = _control_signal_T_91 ? 1'h0 : _control_signal_T_178; // @[Lookup.scala 33:37]
  wire  _control_signal_T_180 = _control_signal_T_89 ? 1'h0 : _control_signal_T_179; // @[Lookup.scala 33:37]
  wire  _control_signal_T_181 = _control_signal_T_87 ? 1'h0 : _control_signal_T_180; // @[Lookup.scala 33:37]
  wire  _control_signal_T_182 = _control_signal_T_85 ? 1'h0 : _control_signal_T_181; // @[Lookup.scala 33:37]
  wire  _control_signal_T_183 = _control_signal_T_83 ? 1'h0 : _control_signal_T_182; // @[Lookup.scala 33:37]
  wire  _control_signal_T_184 = _control_signal_T_81 ? 1'h0 : _control_signal_T_183; // @[Lookup.scala 33:37]
  wire  _control_signal_T_185 = _control_signal_T_79 ? 1'h0 : _control_signal_T_184; // @[Lookup.scala 33:37]
  wire  _control_signal_T_186 = _control_signal_T_77 ? 1'h0 : _control_signal_T_185; // @[Lookup.scala 33:37]
  wire  _control_signal_T_187 = _control_signal_T_75 ? 1'h0 : _control_signal_T_186; // @[Lookup.scala 33:37]
  wire  _control_signal_T_188 = _control_signal_T_73 ? 1'h0 : _control_signal_T_187; // @[Lookup.scala 33:37]
  wire  _control_signal_T_189 = _control_signal_T_71 ? 1'h0 : _control_signal_T_188; // @[Lookup.scala 33:37]
  wire  _control_signal_T_190 = _control_signal_T_69 ? 1'h0 : _control_signal_T_189; // @[Lookup.scala 33:37]
  wire  _control_signal_T_191 = _control_signal_T_67 ? 1'h0 : _control_signal_T_190; // @[Lookup.scala 33:37]
  wire  _control_signal_T_192 = _control_signal_T_65 ? 1'h0 : _control_signal_T_191; // @[Lookup.scala 33:37]
  wire  _control_signal_T_193 = _control_signal_T_63 ? 1'h0 : _control_signal_T_192; // @[Lookup.scala 33:37]
  wire  _control_signal_T_194 = _control_signal_T_61 ? 1'h0 : _control_signal_T_193; // @[Lookup.scala 33:37]
  wire  _control_signal_T_195 = _control_signal_T_59 ? 1'h0 : _control_signal_T_194; // @[Lookup.scala 33:37]
  wire  _control_signal_T_196 = _control_signal_T_57 ? 1'h0 : _control_signal_T_195; // @[Lookup.scala 33:37]
  wire  _control_signal_T_197 = _control_signal_T_55 ? 1'h0 : _control_signal_T_196; // @[Lookup.scala 33:37]
  wire  _control_signal_T_198 = _control_signal_T_53 ? 1'h0 : _control_signal_T_197; // @[Lookup.scala 33:37]
  wire  _control_signal_T_199 = _control_signal_T_51 ? 1'h0 : _control_signal_T_198; // @[Lookup.scala 33:37]
  wire  _control_signal_T_200 = _control_signal_T_49 ? 1'h0 : _control_signal_T_199; // @[Lookup.scala 33:37]
  wire  _control_signal_T_201 = _control_signal_T_47 ? 1'h0 : _control_signal_T_200; // @[Lookup.scala 33:37]
  wire  _control_signal_T_202 = _control_signal_T_45 ? 1'h0 : _control_signal_T_201; // @[Lookup.scala 33:37]
  wire  _control_signal_T_203 = _control_signal_T_43 ? 1'h0 : _control_signal_T_202; // @[Lookup.scala 33:37]
  wire  _control_signal_T_204 = _control_signal_T_41 ? 1'h0 : _control_signal_T_203; // @[Lookup.scala 33:37]
  wire  _control_signal_T_205 = _control_signal_T_39 ? 1'h0 : _control_signal_T_204; // @[Lookup.scala 33:37]
  wire  _control_signal_T_206 = _control_signal_T_37 ? 1'h0 : _control_signal_T_205; // @[Lookup.scala 33:37]
  wire  _control_signal_T_207 = _control_signal_T_35 ? 1'h0 : _control_signal_T_206; // @[Lookup.scala 33:37]
  wire  _control_signal_T_208 = _control_signal_T_33 ? 1'h0 : _control_signal_T_207; // @[Lookup.scala 33:37]
  wire  _control_signal_T_209 = _control_signal_T_31 ? 1'h0 : _control_signal_T_208; // @[Lookup.scala 33:37]
  wire  _control_signal_T_210 = _control_signal_T_29 ? 1'h0 : _control_signal_T_209; // @[Lookup.scala 33:37]
  wire  _control_signal_T_211 = _control_signal_T_27 ? 1'h0 : _control_signal_T_210; // @[Lookup.scala 33:37]
  wire  _control_signal_T_212 = _control_signal_T_25 ? 1'h0 : _control_signal_T_211; // @[Lookup.scala 33:37]
  wire  _control_signal_T_213 = _control_signal_T_23 ? 1'h0 : _control_signal_T_212; // @[Lookup.scala 33:37]
  wire  _control_signal_T_214 = _control_signal_T_21 ? 1'h0 : _control_signal_T_213; // @[Lookup.scala 33:37]
  wire  _control_signal_T_215 = _control_signal_T_19 ? 1'h0 : _control_signal_T_214; // @[Lookup.scala 33:37]
  wire  _control_signal_T_216 = _control_signal_T_17 ? 1'h0 : _control_signal_T_215; // @[Lookup.scala 33:37]
  wire  _control_signal_T_217 = _control_signal_T_15 ? 1'h0 : _control_signal_T_216; // @[Lookup.scala 33:37]
  wire  _control_signal_T_218 = _control_signal_T_13 ? 1'h0 : _control_signal_T_217; // @[Lookup.scala 33:37]
  wire  _control_signal_T_219 = _control_signal_T_11 ? 1'h0 : _control_signal_T_218; // @[Lookup.scala 33:37]
  wire  _control_signal_T_220 = _control_signal_T_9 ? 1'h0 : _control_signal_T_219; // @[Lookup.scala 33:37]
  wire  _control_signal_T_221 = _control_signal_T_7 ? 1'h0 : _control_signal_T_220; // @[Lookup.scala 33:37]
  wire  _control_signal_T_222 = _control_signal_T_5 ? 1'h0 : _control_signal_T_221; // @[Lookup.scala 33:37]
  wire  _control_signal_T_223 = _control_signal_T_3 ? 1'h0 : _control_signal_T_222; // @[Lookup.scala 33:37]
  wire  control_signal_0 = _control_signal_T_1 ? 1'h0 : _control_signal_T_223; // @[Lookup.scala 33:37]
  wire  _control_signal_T_245 = _control_signal_T_107 | (_control_signal_T_109 | (_control_signal_T_111 | (
    _control_signal_T_113 | (_control_signal_T_115 | (_control_signal_T_117 | (_control_signal_T_119 | (
    _control_signal_T_121 | (_control_signal_T_123 | (_control_signal_T_125 | (_control_signal_T_127 | (
    _control_signal_T_129 | _control_signal_T_131))))))))))); // @[Lookup.scala 33:37]
  wire [1:0] _control_signal_T_246 = _control_signal_T_105 ? 2'h2 : {{1'd0}, _control_signal_T_245}; // @[Lookup.scala 33:37]
  wire [1:0] _control_signal_T_247 = _control_signal_T_103 ? 2'h2 : _control_signal_T_246; // @[Lookup.scala 33:37]
  wire [1:0] _control_signal_T_248 = _control_signal_T_101 ? 2'h2 : _control_signal_T_247; // @[Lookup.scala 33:37]
  wire [1:0] _control_signal_T_249 = _control_signal_T_99 ? 2'h3 : _control_signal_T_248; // @[Lookup.scala 33:37]
  wire [1:0] _control_signal_T_250 = _control_signal_T_97 ? 2'h3 : _control_signal_T_249; // @[Lookup.scala 33:37]
  wire [1:0] _control_signal_T_251 = _control_signal_T_95 ? 2'h3 : _control_signal_T_250; // @[Lookup.scala 33:37]
  wire [1:0] _control_signal_T_252 = _control_signal_T_93 ? 2'h3 : _control_signal_T_251; // @[Lookup.scala 33:37]
  wire [1:0] _control_signal_T_253 = _control_signal_T_91 ? 2'h3 : _control_signal_T_252; // @[Lookup.scala 33:37]
  wire [1:0] _control_signal_T_254 = _control_signal_T_89 ? 2'h3 : _control_signal_T_253; // @[Lookup.scala 33:37]
  wire [1:0] _control_signal_T_255 = _control_signal_T_87 ? 2'h3 : _control_signal_T_254; // @[Lookup.scala 33:37]
  wire [1:0] _control_signal_T_256 = _control_signal_T_85 ? 2'h3 : _control_signal_T_255; // @[Lookup.scala 33:37]
  wire [1:0] _control_signal_T_257 = _control_signal_T_83 ? 2'h3 : _control_signal_T_256; // @[Lookup.scala 33:37]
  wire [1:0] _control_signal_T_258 = _control_signal_T_81 ? 2'h3 : _control_signal_T_257; // @[Lookup.scala 33:37]
  wire [1:0] _control_signal_T_259 = _control_signal_T_79 ? 2'h3 : _control_signal_T_258; // @[Lookup.scala 33:37]
  wire [1:0] _control_signal_T_260 = _control_signal_T_77 ? 2'h3 : _control_signal_T_259; // @[Lookup.scala 33:37]
  wire [1:0] _control_signal_T_261 = _control_signal_T_75 ? 2'h3 : _control_signal_T_260; // @[Lookup.scala 33:37]
  wire [1:0] _control_signal_T_262 = _control_signal_T_73 ? 2'h3 : _control_signal_T_261; // @[Lookup.scala 33:37]
  wire [1:0] _control_signal_T_263 = _control_signal_T_71 ? 2'h3 : _control_signal_T_262; // @[Lookup.scala 33:37]
  wire [1:0] _control_signal_T_264 = _control_signal_T_69 ? 2'h3 : _control_signal_T_263; // @[Lookup.scala 33:37]
  wire [1:0] _control_signal_T_265 = _control_signal_T_67 ? 2'h3 : _control_signal_T_264; // @[Lookup.scala 33:37]
  wire [1:0] _control_signal_T_266 = _control_signal_T_65 ? 2'h3 : _control_signal_T_265; // @[Lookup.scala 33:37]
  wire [1:0] _control_signal_T_267 = _control_signal_T_63 ? 2'h3 : _control_signal_T_266; // @[Lookup.scala 33:37]
  wire [1:0] _control_signal_T_268 = _control_signal_T_61 ? 2'h3 : _control_signal_T_267; // @[Lookup.scala 33:37]
  wire [1:0] _control_signal_T_269 = _control_signal_T_59 ? 2'h3 : _control_signal_T_268; // @[Lookup.scala 33:37]
  wire [1:0] _control_signal_T_270 = _control_signal_T_57 ? 2'h3 : _control_signal_T_269; // @[Lookup.scala 33:37]
  wire [1:0] _control_signal_T_271 = _control_signal_T_55 ? 2'h0 : _control_signal_T_270; // @[Lookup.scala 33:37]
  wire [1:0] _control_signal_T_272 = _control_signal_T_53 ? 2'h0 : _control_signal_T_271; // @[Lookup.scala 33:37]
  wire [1:0] _control_signal_T_273 = _control_signal_T_51 ? 2'h0 : _control_signal_T_272; // @[Lookup.scala 33:37]
  wire [1:0] _control_signal_T_274 = _control_signal_T_49 ? 2'h3 : _control_signal_T_273; // @[Lookup.scala 33:37]
  wire [1:0] _control_signal_T_275 = _control_signal_T_47 ? 2'h3 : _control_signal_T_274; // @[Lookup.scala 33:37]
  wire [1:0] _control_signal_T_276 = _control_signal_T_45 ? 2'h3 : _control_signal_T_275; // @[Lookup.scala 33:37]
  wire [1:0] _control_signal_T_277 = _control_signal_T_43 ? 2'h3 : _control_signal_T_276; // @[Lookup.scala 33:37]
  wire [1:0] _control_signal_T_278 = _control_signal_T_41 ? 2'h3 : _control_signal_T_277; // @[Lookup.scala 33:37]
  wire [1:0] _control_signal_T_279 = _control_signal_T_39 ? 2'h3 : _control_signal_T_278; // @[Lookup.scala 33:37]
  wire [1:0] _control_signal_T_280 = _control_signal_T_37 ? 2'h2 : _control_signal_T_279; // @[Lookup.scala 33:37]
  wire [1:0] _control_signal_T_281 = _control_signal_T_35 ? 2'h2 : _control_signal_T_280; // @[Lookup.scala 33:37]
  wire [1:0] _control_signal_T_282 = _control_signal_T_33 ? 2'h2 : _control_signal_T_281; // @[Lookup.scala 33:37]
  wire [1:0] _control_signal_T_283 = _control_signal_T_31 ? 2'h2 : _control_signal_T_282; // @[Lookup.scala 33:37]
  wire [1:0] _control_signal_T_284 = _control_signal_T_29 ? 2'h2 : _control_signal_T_283; // @[Lookup.scala 33:37]
  wire [1:0] _control_signal_T_285 = _control_signal_T_27 ? 2'h2 : _control_signal_T_284; // @[Lookup.scala 33:37]
  wire [1:0] _control_signal_T_286 = _control_signal_T_25 ? 2'h2 : _control_signal_T_285; // @[Lookup.scala 33:37]
  wire [1:0] _control_signal_T_287 = _control_signal_T_23 ? 2'h2 : _control_signal_T_286; // @[Lookup.scala 33:37]
  wire [1:0] _control_signal_T_288 = _control_signal_T_21 ? 2'h0 : _control_signal_T_287; // @[Lookup.scala 33:37]
  wire [1:0] _control_signal_T_289 = _control_signal_T_19 ? 2'h0 : _control_signal_T_288; // @[Lookup.scala 33:37]
  wire [1:0] _control_signal_T_290 = _control_signal_T_17 ? 2'h0 : _control_signal_T_289; // @[Lookup.scala 33:37]
  wire [1:0] _control_signal_T_291 = _control_signal_T_15 ? 2'h0 : _control_signal_T_290; // @[Lookup.scala 33:37]
  wire [1:0] _control_signal_T_292 = _control_signal_T_13 ? 2'h0 : _control_signal_T_291; // @[Lookup.scala 33:37]
  wire [1:0] _control_signal_T_293 = _control_signal_T_11 ? 2'h0 : _control_signal_T_292; // @[Lookup.scala 33:37]
  wire [1:0] _control_signal_T_294 = _control_signal_T_9 ? 2'h0 : _control_signal_T_293; // @[Lookup.scala 33:37]
  wire [1:0] _control_signal_T_295 = _control_signal_T_7 ? 2'h0 : _control_signal_T_294; // @[Lookup.scala 33:37]
  wire [1:0] _control_signal_T_296 = _control_signal_T_5 ? 2'h0 : _control_signal_T_295; // @[Lookup.scala 33:37]
  wire [1:0] _control_signal_T_297 = _control_signal_T_3 ? 2'h3 : _control_signal_T_296; // @[Lookup.scala 33:37]
  wire [1:0] control_signal_1 = _control_signal_T_1 ? 2'h3 : _control_signal_T_297; // @[Lookup.scala 33:37]
  wire [1:0] _alu_signal_T_85 = _control_signal_T_3 ? 2'h2 : 2'h0; // @[Lookup.scala 33:37]
  wire [1:0] alu_signal_0 = _control_signal_T_1 ? 2'h0 : _alu_signal_T_85; // @[Lookup.scala 33:37]
  wire [1:0] _alu_signal_T_91 = _control_signal_T_89 ? 2'h1 : 2'h0; // @[Lookup.scala 33:37]
  wire [1:0] _alu_signal_T_92 = _control_signal_T_87 ? 2'h1 : _alu_signal_T_91; // @[Lookup.scala 33:37]
  wire [1:0] _alu_signal_T_93 = _control_signal_T_85 ? 2'h1 : _alu_signal_T_92; // @[Lookup.scala 33:37]
  wire [1:0] _alu_signal_T_94 = _control_signal_T_83 ? 2'h1 : _alu_signal_T_93; // @[Lookup.scala 33:37]
  wire [1:0] _alu_signal_T_95 = _control_signal_T_81 ? 2'h1 : _alu_signal_T_94; // @[Lookup.scala 33:37]
  wire [1:0] _alu_signal_T_96 = _control_signal_T_79 ? 2'h1 : _alu_signal_T_95; // @[Lookup.scala 33:37]
  wire [1:0] _alu_signal_T_97 = _control_signal_T_77 ? 2'h1 : _alu_signal_T_96; // @[Lookup.scala 33:37]
  wire [1:0] _alu_signal_T_98 = _control_signal_T_49 ? 2'h1 : _alu_signal_T_97; // @[Lookup.scala 33:37]
  wire [1:0] _alu_signal_T_99 = _control_signal_T_47 ? 2'h1 : _alu_signal_T_98; // @[Lookup.scala 33:37]
  wire [1:0] _alu_signal_T_100 = _control_signal_T_45 ? 2'h1 : _alu_signal_T_99; // @[Lookup.scala 33:37]
  wire [1:0] _alu_signal_T_101 = _control_signal_T_43 ? 2'h1 : _alu_signal_T_100; // @[Lookup.scala 33:37]
  wire [1:0] _alu_signal_T_102 = _control_signal_T_41 ? 2'h1 : _alu_signal_T_101; // @[Lookup.scala 33:37]
  wire [1:0] _alu_signal_T_103 = _control_signal_T_39 ? 2'h1 : _alu_signal_T_102; // @[Lookup.scala 33:37]
  wire [1:0] _alu_signal_T_104 = _control_signal_T_75 ? 2'h0 : _alu_signal_T_103; // @[Lookup.scala 33:37]
  wire [1:0] _alu_signal_T_105 = _control_signal_T_73 ? 2'h0 : _alu_signal_T_104; // @[Lookup.scala 33:37]
  wire [1:0] _alu_signal_T_106 = _control_signal_T_71 ? 2'h0 : _alu_signal_T_105; // @[Lookup.scala 33:37]
  wire [1:0] _alu_signal_T_107 = _control_signal_T_69 ? 2'h0 : _alu_signal_T_106; // @[Lookup.scala 33:37]
  wire [1:0] _alu_signal_T_108 = _control_signal_T_67 ? 2'h0 : _alu_signal_T_107; // @[Lookup.scala 33:37]
  wire [1:0] _alu_signal_T_109 = _control_signal_T_65 ? 2'h0 : _alu_signal_T_108; // @[Lookup.scala 33:37]
  wire [1:0] _alu_signal_T_110 = _control_signal_T_63 ? 2'h0 : _alu_signal_T_109; // @[Lookup.scala 33:37]
  wire [1:0] _alu_signal_T_111 = _control_signal_T_61 ? 2'h0 : _alu_signal_T_110; // @[Lookup.scala 33:37]
  wire [1:0] _alu_signal_T_112 = _control_signal_T_59 ? 2'h0 : _alu_signal_T_111; // @[Lookup.scala 33:37]
  wire [1:0] _alu_signal_T_113 = _control_signal_T_3 ? 2'h1 : _alu_signal_T_112; // @[Lookup.scala 33:37]
  wire [1:0] alu_signal_1 = _control_signal_T_1 ? 2'h1 : _alu_signal_T_113; // @[Lookup.scala 33:37]
  wire [3:0] _alu_signal_T_114 = _control_signal_T_99 ? 4'h9 : 4'h0; // @[Lookup.scala 33:37]
  wire [3:0] _alu_signal_T_115 = _control_signal_T_97 ? 4'h8 : _alu_signal_T_114; // @[Lookup.scala 33:37]
  wire [3:0] _alu_signal_T_116 = _control_signal_T_95 ? 4'h7 : _alu_signal_T_115; // @[Lookup.scala 33:37]
  wire [3:0] _alu_signal_T_117 = _control_signal_T_93 ? 4'h1 : _alu_signal_T_116; // @[Lookup.scala 33:37]
  wire [3:0] _alu_signal_T_118 = _control_signal_T_91 ? 4'h0 : _alu_signal_T_117; // @[Lookup.scala 33:37]
  wire [3:0] _alu_signal_T_119 = _control_signal_T_89 ? 4'h9 : _alu_signal_T_118; // @[Lookup.scala 33:37]
  wire [3:0] _alu_signal_T_120 = _control_signal_T_87 ? 4'h8 : _alu_signal_T_119; // @[Lookup.scala 33:37]
  wire [3:0] _alu_signal_T_121 = _control_signal_T_85 ? 4'h7 : _alu_signal_T_120; // @[Lookup.scala 33:37]
  wire [3:0] _alu_signal_T_122 = _control_signal_T_83 ? 4'h0 : _alu_signal_T_121; // @[Lookup.scala 33:37]
  wire [3:0] _alu_signal_T_123 = _control_signal_T_81 ? 4'h9 : _alu_signal_T_122; // @[Lookup.scala 33:37]
  wire [3:0] _alu_signal_T_124 = _control_signal_T_79 ? 4'h8 : _alu_signal_T_123; // @[Lookup.scala 33:37]
  wire [3:0] _alu_signal_T_125 = _control_signal_T_77 ? 4'h7 : _alu_signal_T_124; // @[Lookup.scala 33:37]
  wire [3:0] _alu_signal_T_126 = _control_signal_T_49 ? 4'h5 : _alu_signal_T_125; // @[Lookup.scala 33:37]
  wire [3:0] _alu_signal_T_127 = _control_signal_T_47 ? 4'h6 : _alu_signal_T_126; // @[Lookup.scala 33:37]
  wire [3:0] _alu_signal_T_128 = _control_signal_T_45 ? 4'h4 : _alu_signal_T_127; // @[Lookup.scala 33:37]
  wire [3:0] _alu_signal_T_129 = _control_signal_T_43 ? 4'h3 : _alu_signal_T_128; // @[Lookup.scala 33:37]
  wire [3:0] _alu_signal_T_130 = _control_signal_T_41 ? 4'h2 : _alu_signal_T_129; // @[Lookup.scala 33:37]
  wire [3:0] _alu_signal_T_131 = _control_signal_T_39 ? 4'h0 : _alu_signal_T_130; // @[Lookup.scala 33:37]
  wire [3:0] _alu_signal_T_132 = _control_signal_T_75 ? 4'h5 : _alu_signal_T_131; // @[Lookup.scala 33:37]
  wire [3:0] _alu_signal_T_133 = _control_signal_T_73 ? 4'h6 : _alu_signal_T_132; // @[Lookup.scala 33:37]
  wire [3:0] _alu_signal_T_134 = _control_signal_T_71 ? 4'h9 : _alu_signal_T_133; // @[Lookup.scala 33:37]
  wire [3:0] _alu_signal_T_135 = _control_signal_T_69 ? 4'h8 : _alu_signal_T_134; // @[Lookup.scala 33:37]
  wire [3:0] _alu_signal_T_136 = _control_signal_T_67 ? 4'h4 : _alu_signal_T_135; // @[Lookup.scala 33:37]
  wire [3:0] _alu_signal_T_137 = _control_signal_T_65 ? 4'h3 : _alu_signal_T_136; // @[Lookup.scala 33:37]
  wire [3:0] _alu_signal_T_138 = _control_signal_T_63 ? 4'h2 : _alu_signal_T_137; // @[Lookup.scala 33:37]
  wire [3:0] _alu_signal_T_139 = _control_signal_T_61 ? 4'h7 : _alu_signal_T_138; // @[Lookup.scala 33:37]
  wire [3:0] _alu_signal_T_140 = _control_signal_T_59 ? 4'h1 : _alu_signal_T_139; // @[Lookup.scala 33:37]
  wire [3:0] _alu_signal_T_141 = _control_signal_T_3 ? 4'h0 : _alu_signal_T_140; // @[Lookup.scala 33:37]
  wire [3:0] alu_signal_2 = _control_signal_T_1 ? 4'ha : _alu_signal_T_141; // @[Lookup.scala 33:37]
  wire [63:0] _alu_signal_T_147 = _control_signal_T_89 ? shamtIMM : 64'h0; // @[Lookup.scala 33:37]
  wire [63:0] _alu_signal_T_148 = _control_signal_T_87 ? shamtIMM : _alu_signal_T_147; // @[Lookup.scala 33:37]
  wire [63:0] _alu_signal_T_149 = _control_signal_T_85 ? shamtIMM : _alu_signal_T_148; // @[Lookup.scala 33:37]
  wire [63:0] _alu_signal_T_150 = _control_signal_T_83 ? aluIIMM : _alu_signal_T_149; // @[Lookup.scala 33:37]
  wire [63:0] _alu_signal_T_151 = _control_signal_T_81 ? shamtIMM : _alu_signal_T_150; // @[Lookup.scala 33:37]
  wire [63:0] _alu_signal_T_152 = _control_signal_T_79 ? shamtIMM : _alu_signal_T_151; // @[Lookup.scala 33:37]
  wire [63:0] _alu_signal_T_153 = _control_signal_T_77 ? shamtIMM : _alu_signal_T_152; // @[Lookup.scala 33:37]
  wire [63:0] _alu_signal_T_154 = _control_signal_T_49 ? aluIIMM : _alu_signal_T_153; // @[Lookup.scala 33:37]
  wire [63:0] _alu_signal_T_155 = _control_signal_T_47 ? aluIIMM : _alu_signal_T_154; // @[Lookup.scala 33:37]
  wire [63:0] _alu_signal_T_156 = _control_signal_T_45 ? aluIIMM : _alu_signal_T_155; // @[Lookup.scala 33:37]
  wire [63:0] _alu_signal_T_157 = _control_signal_T_43 ? aluIIMM : _alu_signal_T_156; // @[Lookup.scala 33:37]
  wire [63:0] _alu_signal_T_158 = _control_signal_T_41 ? aluIIMM : _alu_signal_T_157; // @[Lookup.scala 33:37]
  wire [63:0] _alu_signal_T_159 = _control_signal_T_39 ? aluIIMM : _alu_signal_T_158; // @[Lookup.scala 33:37]
  wire [63:0] _alu_signal_T_160 = _control_signal_T_75 ? 64'h0 : _alu_signal_T_159; // @[Lookup.scala 33:37]
  wire [63:0] _alu_signal_T_161 = _control_signal_T_73 ? 64'h0 : _alu_signal_T_160; // @[Lookup.scala 33:37]
  wire [63:0] _alu_signal_T_162 = _control_signal_T_71 ? 64'h0 : _alu_signal_T_161; // @[Lookup.scala 33:37]
  wire [63:0] _alu_signal_T_163 = _control_signal_T_69 ? 64'h0 : _alu_signal_T_162; // @[Lookup.scala 33:37]
  wire [63:0] _alu_signal_T_164 = _control_signal_T_67 ? 64'h0 : _alu_signal_T_163; // @[Lookup.scala 33:37]
  wire [63:0] _alu_signal_T_165 = _control_signal_T_65 ? 64'h0 : _alu_signal_T_164; // @[Lookup.scala 33:37]
  wire [63:0] _alu_signal_T_166 = _control_signal_T_63 ? 64'h0 : _alu_signal_T_165; // @[Lookup.scala 33:37]
  wire [63:0] _alu_signal_T_167 = _control_signal_T_61 ? 64'h0 : _alu_signal_T_166; // @[Lookup.scala 33:37]
  wire [63:0] _alu_signal_T_168 = _control_signal_T_59 ? 64'h0 : _alu_signal_T_167; // @[Lookup.scala 33:37]
  wire [63:0] _alu_signal_T_169 = _control_signal_T_3 ? aluUIMM : _alu_signal_T_168; // @[Lookup.scala 33:37]
  wire [63:0] alu_signal_3 = _control_signal_T_1 ? aluUIMM : _alu_signal_T_169; // @[Lookup.scala 33:37]
  wire  _alu_signal_T_179 = _control_signal_T_81 ? 1'h0 : _control_signal_T_83 | (_control_signal_T_85 | (
    _control_signal_T_87 | (_control_signal_T_89 | (_control_signal_T_91 | (_control_signal_T_93 | (_control_signal_T_95
     | (_control_signal_T_97 | _control_signal_T_99))))))); // @[Lookup.scala 33:37]
  wire  _alu_signal_T_180 = _control_signal_T_79 ? 1'h0 : _alu_signal_T_179; // @[Lookup.scala 33:37]
  wire  _alu_signal_T_181 = _control_signal_T_77 ? 1'h0 : _alu_signal_T_180; // @[Lookup.scala 33:37]
  wire  _alu_signal_T_182 = _control_signal_T_49 ? 1'h0 : _alu_signal_T_181; // @[Lookup.scala 33:37]
  wire  _alu_signal_T_183 = _control_signal_T_47 ? 1'h0 : _alu_signal_T_182; // @[Lookup.scala 33:37]
  wire  _alu_signal_T_184 = _control_signal_T_45 ? 1'h0 : _alu_signal_T_183; // @[Lookup.scala 33:37]
  wire  _alu_signal_T_185 = _control_signal_T_43 ? 1'h0 : _alu_signal_T_184; // @[Lookup.scala 33:37]
  wire  _alu_signal_T_186 = _control_signal_T_41 ? 1'h0 : _alu_signal_T_185; // @[Lookup.scala 33:37]
  wire  _alu_signal_T_187 = _control_signal_T_39 ? 1'h0 : _alu_signal_T_186; // @[Lookup.scala 33:37]
  wire  _alu_signal_T_188 = _control_signal_T_75 ? 1'h0 : _alu_signal_T_187; // @[Lookup.scala 33:37]
  wire  _alu_signal_T_189 = _control_signal_T_73 ? 1'h0 : _alu_signal_T_188; // @[Lookup.scala 33:37]
  wire  _alu_signal_T_190 = _control_signal_T_71 ? 1'h0 : _alu_signal_T_189; // @[Lookup.scala 33:37]
  wire  _alu_signal_T_191 = _control_signal_T_69 ? 1'h0 : _alu_signal_T_190; // @[Lookup.scala 33:37]
  wire  _alu_signal_T_192 = _control_signal_T_67 ? 1'h0 : _alu_signal_T_191; // @[Lookup.scala 33:37]
  wire  _alu_signal_T_193 = _control_signal_T_65 ? 1'h0 : _alu_signal_T_192; // @[Lookup.scala 33:37]
  wire  _alu_signal_T_194 = _control_signal_T_63 ? 1'h0 : _alu_signal_T_193; // @[Lookup.scala 33:37]
  wire  _alu_signal_T_195 = _control_signal_T_61 ? 1'h0 : _alu_signal_T_194; // @[Lookup.scala 33:37]
  wire  _alu_signal_T_196 = _control_signal_T_59 ? 1'h0 : _alu_signal_T_195; // @[Lookup.scala 33:37]
  wire  _alu_signal_T_197 = _control_signal_T_3 ? 1'h0 : _alu_signal_T_196; // @[Lookup.scala 33:37]
  wire  _lsu_signal_T_23 = _control_signal_T_105 ? 1'h0 : 1'h1; // @[Lookup.scala 33:37]
  wire  _lsu_signal_T_25 = _control_signal_T_37 ? 1'h0 : _control_signal_T_101 | _lsu_signal_T_23; // @[Lookup.scala 33:37]
  wire  _lsu_signal_T_26 = _control_signal_T_35 ? 1'h0 : _lsu_signal_T_25; // @[Lookup.scala 33:37]
  wire  _lsu_signal_T_27 = _control_signal_T_33 ? 1'h0 : _lsu_signal_T_26; // @[Lookup.scala 33:37]
  wire  lsu_signal_0 = _control_signal_T_23 | (_control_signal_T_25 | (_control_signal_T_27 | (_control_signal_T_29 | (
    _control_signal_T_31 | _lsu_signal_T_27)))); // @[Lookup.scala 33:37]
  wire [2:0] _lsu_signal_T_32 = _control_signal_T_103 ? 3'h6 : 3'h0; // @[Lookup.scala 33:37]
  wire [2:0] _lsu_signal_T_33 = _control_signal_T_105 ? 3'h5 : _lsu_signal_T_32; // @[Lookup.scala 33:37]
  wire [2:0] _lsu_signal_T_34 = _control_signal_T_101 ? 3'h5 : _lsu_signal_T_33; // @[Lookup.scala 33:37]
  wire [2:0] _lsu_signal_T_35 = _control_signal_T_37 ? 3'h4 : _lsu_signal_T_34; // @[Lookup.scala 33:37]
  wire [2:0] _lsu_signal_T_36 = _control_signal_T_35 ? 3'h2 : _lsu_signal_T_35; // @[Lookup.scala 33:37]
  wire [2:0] _lsu_signal_T_37 = _control_signal_T_33 ? 3'h0 : _lsu_signal_T_36; // @[Lookup.scala 33:37]
  wire [2:0] _lsu_signal_T_38 = _control_signal_T_31 ? 3'h3 : _lsu_signal_T_37; // @[Lookup.scala 33:37]
  wire [2:0] _lsu_signal_T_39 = _control_signal_T_29 ? 3'h1 : _lsu_signal_T_38; // @[Lookup.scala 33:37]
  wire [2:0] _lsu_signal_T_40 = _control_signal_T_27 ? 3'h4 : _lsu_signal_T_39; // @[Lookup.scala 33:37]
  wire [2:0] _lsu_signal_T_41 = _control_signal_T_25 ? 3'h2 : _lsu_signal_T_40; // @[Lookup.scala 33:37]
  wire [2:0] lsu_signal_1 = _control_signal_T_23 ? 3'h0 : _lsu_signal_T_41; // @[Lookup.scala 33:37]
  wire [2:0] _bju_signal_T_40 = _control_signal_T_149 ? 3'h2 : 3'h0; // @[Lookup.scala 33:37]
  wire [2:0] _bju_signal_T_41 = _control_signal_T_147 ? 3'h2 : _bju_signal_T_40; // @[Lookup.scala 33:37]
  wire [2:0] _bju_signal_T_42 = _control_signal_T_145 ? 3'h2 : _bju_signal_T_41; // @[Lookup.scala 33:37]
  wire [2:0] _bju_signal_T_43 = _control_signal_T_143 ? 3'h0 : _bju_signal_T_42; // @[Lookup.scala 33:37]
  wire [2:0] _bju_signal_T_44 = _control_signal_T_141 ? 3'h0 : _bju_signal_T_43; // @[Lookup.scala 33:37]
  wire [2:0] _bju_signal_T_45 = _control_signal_T_139 ? 3'h0 : _bju_signal_T_44; // @[Lookup.scala 33:37]
  wire [2:0] _bju_signal_T_46 = _control_signal_T_137 ? 3'h0 : _bju_signal_T_45; // @[Lookup.scala 33:37]
  wire [2:0] _bju_signal_T_47 = _control_signal_T_135 ? 3'h0 : _bju_signal_T_46; // @[Lookup.scala 33:37]
  wire [2:0] _bju_signal_T_48 = _control_signal_T_133 ? 3'h0 : _bju_signal_T_47; // @[Lookup.scala 33:37]
  wire [2:0] _bju_signal_T_49 = _control_signal_T_53 ? 3'h6 : _bju_signal_T_48; // @[Lookup.scala 33:37]
  wire [2:0] _bju_signal_T_50 = _control_signal_T_51 ? 3'h5 : _bju_signal_T_49; // @[Lookup.scala 33:37]
  wire [2:0] _bju_signal_T_51 = _control_signal_T_21 ? 3'h4 : _bju_signal_T_50; // @[Lookup.scala 33:37]
  wire [2:0] _bju_signal_T_52 = _control_signal_T_7 ? 3'h3 : _bju_signal_T_51; // @[Lookup.scala 33:37]
  wire [2:0] _bju_signal_T_53 = _control_signal_T_5 ? 3'h2 : _bju_signal_T_52; // @[Lookup.scala 33:37]
  wire [2:0] _bju_signal_T_54 = _control_signal_T_19 ? 3'h1 : _bju_signal_T_53; // @[Lookup.scala 33:37]
  wire [2:0] _bju_signal_T_55 = _control_signal_T_17 ? 3'h1 : _bju_signal_T_54; // @[Lookup.scala 33:37]
  wire [2:0] _bju_signal_T_56 = _control_signal_T_15 ? 3'h1 : _bju_signal_T_55; // @[Lookup.scala 33:37]
  wire [2:0] _bju_signal_T_57 = _control_signal_T_13 ? 3'h1 : _bju_signal_T_56; // @[Lookup.scala 33:37]
  wire [2:0] _bju_signal_T_58 = _control_signal_T_11 ? 3'h1 : _bju_signal_T_57; // @[Lookup.scala 33:37]
  wire [2:0] bju_signal_0 = _control_signal_T_9 ? 3'h1 : _bju_signal_T_58; // @[Lookup.scala 33:37]
  wire [1:0] _bju_signal_T_62 = _control_signal_T_143 ? 2'h1 : 2'h0; // @[Lookup.scala 33:37]
  wire [1:0] _bju_signal_T_63 = _control_signal_T_141 ? 2'h1 : _bju_signal_T_62; // @[Lookup.scala 33:37]
  wire [1:0] _bju_signal_T_64 = _control_signal_T_139 ? 2'h1 : _bju_signal_T_63; // @[Lookup.scala 33:37]
  wire [1:0] _bju_signal_T_65 = _control_signal_T_137 ? 2'h0 : _bju_signal_T_64; // @[Lookup.scala 33:37]
  wire [1:0] _bju_signal_T_66 = _control_signal_T_135 ? 2'h0 : _bju_signal_T_65; // @[Lookup.scala 33:37]
  wire [1:0] _bju_signal_T_67 = _control_signal_T_133 ? 2'h0 : _bju_signal_T_66; // @[Lookup.scala 33:37]
  wire [1:0] _bju_signal_T_68 = _control_signal_T_53 ? 2'h0 : _bju_signal_T_67; // @[Lookup.scala 33:37]
  wire [1:0] _bju_signal_T_69 = _control_signal_T_51 ? 2'h0 : _bju_signal_T_68; // @[Lookup.scala 33:37]
  wire [1:0] _bju_signal_T_70 = _control_signal_T_21 ? 2'h0 : _bju_signal_T_69; // @[Lookup.scala 33:37]
  wire [1:0] _bju_signal_T_71 = _control_signal_T_7 ? 2'h0 : _bju_signal_T_70; // @[Lookup.scala 33:37]
  wire [1:0] _bju_signal_T_72 = _control_signal_T_5 ? 2'h0 : _bju_signal_T_71; // @[Lookup.scala 33:37]
  wire [1:0] _bju_signal_T_73 = _control_signal_T_19 ? 2'h0 : _bju_signal_T_72; // @[Lookup.scala 33:37]
  wire [1:0] _bju_signal_T_74 = _control_signal_T_17 ? 2'h0 : _bju_signal_T_73; // @[Lookup.scala 33:37]
  wire [1:0] _bju_signal_T_75 = _control_signal_T_15 ? 2'h0 : _bju_signal_T_74; // @[Lookup.scala 33:37]
  wire [1:0] _bju_signal_T_76 = _control_signal_T_13 ? 2'h0 : _bju_signal_T_75; // @[Lookup.scala 33:37]
  wire [1:0] _bju_signal_T_77 = _control_signal_T_11 ? 2'h0 : _bju_signal_T_76; // @[Lookup.scala 33:37]
  wire [1:0] bju_signal_1 = _control_signal_T_9 ? 2'h0 : _bju_signal_T_77; // @[Lookup.scala 33:37]
  wire [1:0] _bju_signal_T_78 = _control_signal_T_149 ? 2'h1 : 2'h0; // @[Lookup.scala 33:37]
  wire [1:0] _bju_signal_T_79 = _control_signal_T_147 ? 2'h1 : _bju_signal_T_78; // @[Lookup.scala 33:37]
  wire [1:0] _bju_signal_T_80 = _control_signal_T_145 ? 2'h0 : _bju_signal_T_79; // @[Lookup.scala 33:37]
  wire [1:0] _bju_signal_T_81 = _control_signal_T_143 ? 2'h2 : _bju_signal_T_80; // @[Lookup.scala 33:37]
  wire [1:0] _bju_signal_T_82 = _control_signal_T_141 ? 2'h2 : _bju_signal_T_81; // @[Lookup.scala 33:37]
  wire [1:0] _bju_signal_T_83 = _control_signal_T_139 ? 2'h2 : _bju_signal_T_82; // @[Lookup.scala 33:37]
  wire [1:0] _bju_signal_T_84 = _control_signal_T_137 ? 2'h2 : _bju_signal_T_83; // @[Lookup.scala 33:37]
  wire [1:0] _bju_signal_T_85 = _control_signal_T_135 ? 2'h2 : _bju_signal_T_84; // @[Lookup.scala 33:37]
  wire [1:0] _bju_signal_T_86 = _control_signal_T_133 ? 2'h2 : _bju_signal_T_85; // @[Lookup.scala 33:37]
  wire [1:0] _bju_signal_T_87 = _control_signal_T_53 ? 2'h0 : _bju_signal_T_86; // @[Lookup.scala 33:37]
  wire [1:0] _bju_signal_T_88 = _control_signal_T_51 ? 2'h0 : _bju_signal_T_87; // @[Lookup.scala 33:37]
  wire [1:0] _bju_signal_T_89 = _control_signal_T_21 ? 2'h0 : _bju_signal_T_88; // @[Lookup.scala 33:37]
  wire [1:0] _bju_signal_T_90 = _control_signal_T_7 ? 2'h1 : _bju_signal_T_89; // @[Lookup.scala 33:37]
  wire [1:0] _bju_signal_T_91 = _control_signal_T_5 ? 2'h1 : _bju_signal_T_90; // @[Lookup.scala 33:37]
  wire [1:0] _bju_signal_T_92 = _control_signal_T_19 ? 2'h0 : _bju_signal_T_91; // @[Lookup.scala 33:37]
  wire [1:0] _bju_signal_T_93 = _control_signal_T_17 ? 2'h0 : _bju_signal_T_92; // @[Lookup.scala 33:37]
  wire [1:0] _bju_signal_T_94 = _control_signal_T_15 ? 2'h0 : _bju_signal_T_93; // @[Lookup.scala 33:37]
  wire [1:0] _bju_signal_T_95 = _control_signal_T_13 ? 2'h0 : _bju_signal_T_94; // @[Lookup.scala 33:37]
  wire [1:0] _bju_signal_T_96 = _control_signal_T_11 ? 2'h0 : _bju_signal_T_95; // @[Lookup.scala 33:37]
  wire [1:0] bju_signal_2 = _control_signal_T_9 ? 2'h0 : _bju_signal_T_96; // @[Lookup.scala 33:37]
  wire  _bju_signal_T_99 = _control_signal_T_145 ? 1'h0 : _control_signal_T_147 | _control_signal_T_149; // @[Lookup.scala 33:37]
  wire  _bju_signal_T_106 = _control_signal_T_53 ? 1'h0 : _control_signal_T_133 | (_control_signal_T_135 | (
    _control_signal_T_137 | (_control_signal_T_139 | (_control_signal_T_141 | (_control_signal_T_143 | _bju_signal_T_99)
    )))); // @[Lookup.scala 33:37]
  wire  _bju_signal_T_107 = _control_signal_T_51 ? 1'h0 : _bju_signal_T_106; // @[Lookup.scala 33:37]
  wire  _bju_signal_T_108 = _control_signal_T_21 ? 1'h0 : _bju_signal_T_107; // @[Lookup.scala 33:37]
  wire  _bju_signal_T_111 = _control_signal_T_19 ? 1'h0 : _control_signal_T_5 | (_control_signal_T_7 | _bju_signal_T_108
    ); // @[Lookup.scala 33:37]
  wire  _bju_signal_T_112 = _control_signal_T_17 ? 1'h0 : _bju_signal_T_111; // @[Lookup.scala 33:37]
  wire  _bju_signal_T_113 = _control_signal_T_15 ? 1'h0 : _bju_signal_T_112; // @[Lookup.scala 33:37]
  wire  _bju_signal_T_114 = _control_signal_T_13 ? 1'h0 : _bju_signal_T_113; // @[Lookup.scala 33:37]
  wire  _bju_signal_T_115 = _control_signal_T_11 ? 1'h0 : _bju_signal_T_114; // @[Lookup.scala 33:37]
  wire  bju_signal_3 = _control_signal_T_9 ? 1'h0 : _bju_signal_T_115; // @[Lookup.scala 33:37]
  wire [2:0] _bju_signal_T_119 = _control_signal_T_143 ? 3'h5 : 3'h0; // @[Lookup.scala 33:37]
  wire [2:0] _bju_signal_T_120 = _control_signal_T_141 ? 3'h6 : _bju_signal_T_119; // @[Lookup.scala 33:37]
  wire [2:0] _bju_signal_T_121 = _control_signal_T_139 ? 3'h0 : _bju_signal_T_120; // @[Lookup.scala 33:37]
  wire [2:0] _bju_signal_T_122 = _control_signal_T_137 ? 3'h5 : _bju_signal_T_121; // @[Lookup.scala 33:37]
  wire [2:0] _bju_signal_T_123 = _control_signal_T_135 ? 3'h6 : _bju_signal_T_122; // @[Lookup.scala 33:37]
  wire [2:0] _bju_signal_T_124 = _control_signal_T_133 ? 3'h0 : _bju_signal_T_123; // @[Lookup.scala 33:37]
  wire [2:0] _bju_signal_T_125 = _control_signal_T_53 ? 3'h0 : _bju_signal_T_124; // @[Lookup.scala 33:37]
  wire [2:0] _bju_signal_T_126 = _control_signal_T_51 ? 3'h0 : _bju_signal_T_125; // @[Lookup.scala 33:37]
  wire [2:0] _bju_signal_T_127 = _control_signal_T_21 ? 3'h0 : _bju_signal_T_126; // @[Lookup.scala 33:37]
  wire [2:0] _bju_signal_T_128 = _control_signal_T_7 ? 3'h0 : _bju_signal_T_127; // @[Lookup.scala 33:37]
  wire [2:0] _bju_signal_T_129 = _control_signal_T_5 ? 3'h0 : _bju_signal_T_128; // @[Lookup.scala 33:37]
  wire [2:0] _bju_signal_T_130 = _control_signal_T_19 ? 3'h3 : _bju_signal_T_129; // @[Lookup.scala 33:37]
  wire [2:0] _bju_signal_T_131 = _control_signal_T_17 ? 3'h3 : _bju_signal_T_130; // @[Lookup.scala 33:37]
  wire [2:0] _bju_signal_T_132 = _control_signal_T_15 ? 3'h1 : _bju_signal_T_131; // @[Lookup.scala 33:37]
  wire [2:0] _bju_signal_T_133 = _control_signal_T_13 ? 3'h1 : _bju_signal_T_132; // @[Lookup.scala 33:37]
  wire [2:0] _bju_signal_T_134 = _control_signal_T_11 ? 3'h1 : _bju_signal_T_133; // @[Lookup.scala 33:37]
  wire [2:0] bju_signal_4 = _control_signal_T_9 ? 3'h1 : _bju_signal_T_134; // @[Lookup.scala 33:37]
  wire [63:0] _bju_signal_T_135 = _control_signal_T_149 ? 64'h4 : 64'h0; // @[Lookup.scala 33:37]
  wire [63:0] _bju_signal_T_136 = _control_signal_T_147 ? 64'h0 : _bju_signal_T_135; // @[Lookup.scala 33:37]
  wire [63:0] _bju_signal_T_137 = _control_signal_T_145 ? 64'h4 : _bju_signal_T_136; // @[Lookup.scala 33:37]
  wire [63:0] _bju_signal_T_138 = _control_signal_T_143 ? CSRIMM : _bju_signal_T_137; // @[Lookup.scala 33:37]
  wire [63:0] _bju_signal_T_139 = _control_signal_T_141 ? CSRIMM : _bju_signal_T_138; // @[Lookup.scala 33:37]
  wire [63:0] _bju_signal_T_140 = _control_signal_T_139 ? CSRIMM : _bju_signal_T_139; // @[Lookup.scala 33:37]
  wire [63:0] _bju_signal_T_141 = _control_signal_T_137 ? CSRIMM : _bju_signal_T_140; // @[Lookup.scala 33:37]
  wire [63:0] _bju_signal_T_142 = _control_signal_T_135 ? CSRIMM : _bju_signal_T_141; // @[Lookup.scala 33:37]
  wire [63:0] _bju_signal_T_143 = _control_signal_T_133 ? CSRIMM : _bju_signal_T_142; // @[Lookup.scala 33:37]
  wire [63:0] _bju_signal_T_144 = _control_signal_T_53 ? 64'h0 : _bju_signal_T_143; // @[Lookup.scala 33:37]
  wire [63:0] _bju_signal_T_145 = _control_signal_T_51 ? 64'h0 : _bju_signal_T_144; // @[Lookup.scala 33:37]
  wire [63:0] _bju_signal_T_146 = _control_signal_T_21 ? 64'h0 : _bju_signal_T_145; // @[Lookup.scala 33:37]
  wire [63:0] _bju_signal_T_147 = _control_signal_T_7 ? aluIIMM : _bju_signal_T_146; // @[Lookup.scala 33:37]
  wire [63:0] _bju_signal_T_148 = _control_signal_T_5 ? JIMM : _bju_signal_T_147; // @[Lookup.scala 33:37]
  wire [63:0] _bju_signal_T_149 = _control_signal_T_19 ? BIMM : _bju_signal_T_148; // @[Lookup.scala 33:37]
  wire [63:0] _bju_signal_T_150 = _control_signal_T_17 ? BIMM : _bju_signal_T_149; // @[Lookup.scala 33:37]
  wire [63:0] _bju_signal_T_151 = _control_signal_T_15 ? BIMM : _bju_signal_T_150; // @[Lookup.scala 33:37]
  wire [63:0] _bju_signal_T_152 = _control_signal_T_13 ? BIMM : _bju_signal_T_151; // @[Lookup.scala 33:37]
  wire [63:0] _bju_signal_T_153 = _control_signal_T_11 ? BIMM : _bju_signal_T_152; // @[Lookup.scala 33:37]
  wire [63:0] bju_signal_5 = _control_signal_T_9 ? BIMM : _bju_signal_T_153; // @[Lookup.scala 33:37]
  wire [3:0] _branch_signal_T_12 = _control_signal_T_19 ? 4'h5 : 4'h1; // @[Lookup.scala 33:37]
  wire [3:0] _branch_signal_T_13 = _control_signal_T_17 ? 4'h4 : _branch_signal_T_12; // @[Lookup.scala 33:37]
  wire [3:0] _branch_signal_T_14 = _control_signal_T_15 ? 4'h3 : _branch_signal_T_13; // @[Lookup.scala 33:37]
  wire [3:0] _branch_signal_T_15 = _control_signal_T_13 ? 4'h6 : _branch_signal_T_14; // @[Lookup.scala 33:37]
  wire [3:0] _branch_signal_T_16 = _control_signal_T_11 ? 4'h2 : _branch_signal_T_15; // @[Lookup.scala 33:37]
  wire [3:0] branch_signal_0 = _control_signal_T_9 ? 4'h1 : _branch_signal_T_16; // @[Lookup.scala 33:37]
  wire  _io_mops_branch_type_T = control_signal_1 == 2'h0; // @[Decode.scala 289:50]
  wire [1:0] _io_mops_src_a_T_1 = 2'h3 == control_signal_1 ? alu_signal_0 : 2'h0; // @[Mux.scala 80:57]
  wire [1:0] _io_mops_src_b_T_1 = 2'h3 == control_signal_1 ? alu_signal_1 : 2'h0; // @[Mux.scala 80:57]
  wire [1:0] _io_mops_src_b_T_3 = 2'h0 == control_signal_1 ? bju_signal_2 : _io_mops_src_b_T_1; // @[Mux.scala 80:57]
  wire  _io_mops_write_dest_T_1 = 2'h2 == control_signal_1 ? lsu_signal_0 : 1'h1; // @[Mux.scala 80:57]
  wire [3:0] _io_mops_alu_op_T_1 = 2'h3 == control_signal_1 ? alu_signal_2 : 4'h0; // @[Mux.scala 80:57]
  wire [1:0] _io_mops_write_src_T_3 = bju_signal_0 == 3'h2 | bju_signal_0 == 3'h3 ? 2'h3 : 2'h0; // @[Decode.scala 322:46]
  wire [1:0] _io_mops_write_src_T_5 = 2'h2 == control_signal_1 ? 2'h2 : 2'h1; // @[Mux.scala 80:57]
  wire [63:0] _io_mops_imm_T_1 = ~lsu_signal_0 ? lsuSIMM : aluIIMM; // @[Mux.scala 80:57]
  wire [63:0] _io_mops_imm_T_3 = 2'h3 == control_signal_1 ? alu_signal_3 : _io_mops_imm_T_1; // @[Mux.scala 80:57]
  assign io_mops_illegal = control_signal_0 | (|io_pc[1:0]); // @[Decode.scala 288:53]
  assign io_mops_next_pc = _io_mops_branch_type_T ? bju_signal_0 : 3'h0; // @[Decode.scala 291:31]
  assign io_mops_alu_mdu_lsu = _control_signal_T_1 ? 2'h3 : _control_signal_T_297; // @[Lookup.scala 33:37]
  assign io_mops_branch_type = control_signal_1 == 2'h0 & bju_signal_0 == 3'h1 ? branch_signal_0 : 4'h0; // @[Decode.scala 289:31]
  assign io_mops_src_a = 2'h0 == control_signal_1 ? bju_signal_1 : _io_mops_src_a_T_1; // @[Mux.scala 80:57]
  assign io_mops_src_b = 2'h2 == control_signal_1 ? 2'h1 : _io_mops_src_b_T_3; // @[Mux.scala 80:57]
  assign io_mops_write_dest = 2'h0 == control_signal_1 ? bju_signal_3 : _io_mops_write_dest_T_1; // @[Mux.scala 80:57]
  assign io_mops_alu_op = 2'h0 == control_signal_1 ? {{1'd0}, bju_signal_4} : _io_mops_alu_op_T_1; // @[Mux.scala 80:57]
  assign io_mops_alu_expand = _control_signal_T_1 ? 1'h0 : _alu_signal_T_197; // @[Lookup.scala 33:37]
  assign io_mops_mem_width = control_signal_1 == 2'h2 ? lsu_signal_1 : 3'h0; // @[Decode.scala 318:31]
  assign io_mops_write_src = 2'h0 == control_signal_1 ? _io_mops_write_src_T_3 : _io_mops_write_src_T_5; // @[Mux.scala 80:57]
  assign io_mops_rs1 = io_inst[19:15]; // @[Decode.scala 46:22]
  assign io_mops_rs2 = io_inst[24:20]; // @[Decode.scala 45:22]
  assign io_mops_rd = io_inst[11:7]; // @[Decode.scala 47:22]
  assign io_mops_imm = 2'h0 == control_signal_1 ? bju_signal_5 : _io_mops_imm_T_3; // @[Mux.scala 80:57]
  assign io_mops_pc = io_pc; // @[Decode.scala 335:25]
  assign io_mops_predict_taken = io_bht_predict_taken; // @[Decode.scala 336:25]
  assign io_mops_target_pc = io_target_pc; // @[Decode.scala 337:25]
endmodule
module ysyx_210134_Frontend(
  input          clock,
  input          reset,
  input          io_fb_bmfs_redirect_kill,
  input  [63:0]  io_fb_bmfs_redirect_pc,
  input          io_fb_bmfs_bpu_v,
  input          io_fb_bmfs_bpu_errpr,
  input  [63:0]  io_fb_bmfs_bpu_pc_br,
  input  [63:0]  io_fb_bmfs_bpu_target,
  input          io_fb_bmfs_bpu_taken,
  output [1:0]   io_fb_fmbs_instn,
  output [232:0] io_fb_fmbs_inst_ops_0,
  output [232:0] io_fb_fmbs_inst_ops_1,
  input          io_fb_fmbs_please_wait,
  output         io_icache_req_valid,
  output [31:0]  io_icache_req_bits_addr,
  output [2:0]   io_icache_req_bits_mtype,
  input          io_icache_resp_valid,
  input  [31:0]  io_icache_resp_bits_rdata_0,
  input  [31:0]  io_icache_resp_bits_rdata_1,
  input          io_icache_resp_bits_respn
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [63:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [63:0] _RAND_13;
  reg [63:0] _RAND_14;
`endif // RANDOMIZE_REG_INIT
  wire  pc_gen_clock; // @[Frontend.scala 66:30]
  wire  pc_gen_reset; // @[Frontend.scala 66:30]
  wire  pc_gen_io_please_wait; // @[Frontend.scala 66:30]
  wire  pc_gen_io_redirect; // @[Frontend.scala 66:30]
  wire [63:0] pc_gen_io_redirect_pc; // @[Frontend.scala 66:30]
  wire [63:0] pc_gen_io_pc_o; // @[Frontend.scala 66:30]
  wire [1:0] pc_gen_io_predict_sstat_o; // @[Frontend.scala 66:30]
  wire  pc_gen_io_predict_taken_o; // @[Frontend.scala 66:30]
  wire [63:0] pc_gen_io_predict_target_o; // @[Frontend.scala 66:30]
  wire  pc_gen_io_narrow_o; // @[Frontend.scala 66:30]
  wire  pc_gen_io_bpu_update_dec_v; // @[Frontend.scala 66:30]
  wire [63:0] pc_gen_io_bpu_update_dec_pc_br; // @[Frontend.scala 66:30]
  wire  pc_gen_io_bpu_update_exe_v; // @[Frontend.scala 66:30]
  wire  pc_gen_io_bpu_update_exe_errpr; // @[Frontend.scala 66:30]
  wire [63:0] pc_gen_io_bpu_update_exe_pc_br; // @[Frontend.scala 66:30]
  wire [63:0] pc_gen_io_bpu_update_exe_target; // @[Frontend.scala 66:30]
  wire  pc_gen_io_bpu_update_exe_taken; // @[Frontend.scala 66:30]
  wire [63:0] Dec_io_pc; // @[Frontend.scala 84:60]
  wire [31:0] Dec_io_inst; // @[Frontend.scala 84:60]
  wire  Dec_io_bht_predict_taken; // @[Frontend.scala 84:60]
  wire [63:0] Dec_io_target_pc; // @[Frontend.scala 84:60]
  wire  Dec_io_mops_illegal; // @[Frontend.scala 84:60]
  wire [2:0] Dec_io_mops_next_pc; // @[Frontend.scala 84:60]
  wire [1:0] Dec_io_mops_alu_mdu_lsu; // @[Frontend.scala 84:60]
  wire [3:0] Dec_io_mops_branch_type; // @[Frontend.scala 84:60]
  wire [1:0] Dec_io_mops_src_a; // @[Frontend.scala 84:60]
  wire [1:0] Dec_io_mops_src_b; // @[Frontend.scala 84:60]
  wire  Dec_io_mops_write_dest; // @[Frontend.scala 84:60]
  wire [3:0] Dec_io_mops_alu_op; // @[Frontend.scala 84:60]
  wire  Dec_io_mops_alu_expand; // @[Frontend.scala 84:60]
  wire [2:0] Dec_io_mops_mem_width; // @[Frontend.scala 84:60]
  wire [1:0] Dec_io_mops_write_src; // @[Frontend.scala 84:60]
  wire [4:0] Dec_io_mops_rs1; // @[Frontend.scala 84:60]
  wire [4:0] Dec_io_mops_rs2; // @[Frontend.scala 84:60]
  wire [4:0] Dec_io_mops_rd; // @[Frontend.scala 84:60]
  wire [63:0] Dec_io_mops_imm; // @[Frontend.scala 84:60]
  wire [63:0] Dec_io_mops_pc; // @[Frontend.scala 84:60]
  wire  Dec_io_mops_predict_taken; // @[Frontend.scala 84:60]
  wire [63:0] Dec_io_mops_target_pc; // @[Frontend.scala 84:60]
  wire [63:0] Dec_1_io_pc; // @[Frontend.scala 84:60]
  wire [31:0] Dec_1_io_inst; // @[Frontend.scala 84:60]
  wire  Dec_1_io_bht_predict_taken; // @[Frontend.scala 84:60]
  wire [63:0] Dec_1_io_target_pc; // @[Frontend.scala 84:60]
  wire  Dec_1_io_mops_illegal; // @[Frontend.scala 84:60]
  wire [2:0] Dec_1_io_mops_next_pc; // @[Frontend.scala 84:60]
  wire [1:0] Dec_1_io_mops_alu_mdu_lsu; // @[Frontend.scala 84:60]
  wire [3:0] Dec_1_io_mops_branch_type; // @[Frontend.scala 84:60]
  wire [1:0] Dec_1_io_mops_src_a; // @[Frontend.scala 84:60]
  wire [1:0] Dec_1_io_mops_src_b; // @[Frontend.scala 84:60]
  wire  Dec_1_io_mops_write_dest; // @[Frontend.scala 84:60]
  wire [3:0] Dec_1_io_mops_alu_op; // @[Frontend.scala 84:60]
  wire  Dec_1_io_mops_alu_expand; // @[Frontend.scala 84:60]
  wire [2:0] Dec_1_io_mops_mem_width; // @[Frontend.scala 84:60]
  wire [1:0] Dec_1_io_mops_write_src; // @[Frontend.scala 84:60]
  wire [4:0] Dec_1_io_mops_rs1; // @[Frontend.scala 84:60]
  wire [4:0] Dec_1_io_mops_rs2; // @[Frontend.scala 84:60]
  wire [4:0] Dec_1_io_mops_rd; // @[Frontend.scala 84:60]
  wire [63:0] Dec_1_io_mops_imm; // @[Frontend.scala 84:60]
  wire [63:0] Dec_1_io_mops_pc; // @[Frontend.scala 84:60]
  wire  Dec_1_io_mops_predict_taken; // @[Frontend.scala 84:60]
  wire [63:0] Dec_1_io_mops_target_pc; // @[Frontend.scala 84:60]
  reg  last_req_valid; // @[Frontend.scala 69:31]
  reg [63:0] repc; // @[Frontend.scala 70:31]
  reg [63:0] reptar; // @[Frontend.scala 71:31]
  reg [1:0] repstat; // @[Frontend.scala 72:31]
  reg  repred; // @[Frontend.scala 73:31]
  reg  renarrow; // @[Frontend.scala 74:56]
  wire  cache_stall = ~io_icache_resp_valid & last_req_valid; // @[Frontend.scala 115:43]
  wire  stall_f = io_fb_fmbs_please_wait | cache_stall; // @[Frontend.scala 108:29]
  wire [63:0] may_illegal_req_addr = stall_f ? repc : pc_gen_io_pc_o; // @[Frontend.scala 79:33]
  reg [63:0] decode_pc_low_reg; // @[Frontend.scala 82:34]
  reg  decode_valid_reg; // @[Frontend.scala 83:34]
  reg  next_respn; // @[Frontend.scala 88:34]
  wire [1:0] _fire_number_respn_T = {1'h0,next_respn}; // @[Cat.scala 30:58]
  wire [1:0] fire_number_respn = _fire_number_respn_T + 2'h1; // @[Frontend.scala 89:48]
  reg [63:0] decode_pc_predict_target; // @[Frontend.scala 92:41]
  reg [1:0] decode_pc_second_state; // @[Frontend.scala 93:41]
  reg  decode_pc_predict_taken; // @[Frontend.scala 94:41]
  reg  delayed_early_update; // @[Frontend.scala 95:37]
  reg [63:0] dec_kill_redirect_pc_REG; // @[Frontend.scala 126:35]
  wire [61:0] pc_gen_io_bpu_update_dec_pc_br_hi = decode_pc_low_reg[63:2]; // @[Frontend.scala 123:66]
  wire [1:0] pc_gen_io_bpu_update_dec_pc_br_lo = decode_pc_predict_target[1:0]; // @[Frontend.scala 123:105]
  wire [63:0] _pc_gen_io_bpu_update_dec_pc_br_T = {pc_gen_io_bpu_update_dec_pc_br_hi,pc_gen_io_bpu_update_dec_pc_br_lo}; // @[Cat.scala 30:58]
  reg [63:0] pc_gen_io_bpu_update_dec_pc_br_REG; // @[Frontend.scala 123:44]
  wire [63:0] _dec_kill_redirect_pc_T_2 = decode_pc_low_reg + 64'h8; // @[Frontend.scala 126:106]
  wire [63:0] _dec_kill_redirect_pc_T_4 = decode_pc_low_reg + 64'h4; // @[Frontend.scala 126:131]
  wire [29:0] io_icache_req_bits_addr_hi = may_illegal_req_addr[31:2]; // @[Frontend.scala 144:55]
  wire [1:0] _io_icache_req_bits_mtype_T = renarrow ? 2'h2 : 2'h3; // @[Frontend.scala 150:49]
  wire [1:0] _io_icache_req_bits_mtype_T_1 = pc_gen_io_narrow_o ? 2'h2 : 2'h3; // @[Frontend.scala 150:89]
  wire [1:0] _io_icache_req_bits_mtype_T_2 = stall_f ? _io_icache_req_bits_mtype_T : _io_icache_req_bits_mtype_T_1; // @[Frontend.scala 150:36]
  wire  kill_d = io_fb_bmfs_redirect_kill | delayed_early_update; // @[Frontend.scala 157:39]
  wire  _T_1 = ~cache_stall; // @[Frontend.scala 161:27]
  wire  frontend_fire = _T_1 & decode_valid_reg & ~delayed_early_update; // @[Frontend.scala 169:53]
  wire [1:0] _io_fb_fmbs_instn_T = frontend_fire ? fire_number_respn : 2'h0; // @[Frontend.scala 170:44]
  wire [64:0] _T_4 = {{1'd0}, decode_pc_low_reg}; // @[Frontend.scala 173:39]
  wire [212:0] io_fb_fmbs_inst_ops_0_lo = {Dec_io_mops_mem_width,Dec_io_mops_write_src,Dec_io_mops_rs1,Dec_io_mops_rs2,
    Dec_io_mops_rd,Dec_io_mops_imm,Dec_io_mops_pc,Dec_io_mops_predict_taken,Dec_io_mops_target_pc}; // @[Frontend.scala 182:44]
  wire [19:0] io_fb_fmbs_inst_ops_0_hi = {Dec_io_mops_illegal,Dec_io_mops_next_pc,Dec_io_mops_alu_mdu_lsu,
    Dec_io_mops_branch_type,Dec_io_mops_src_a,Dec_io_mops_src_b,Dec_io_mops_write_dest,Dec_io_mops_alu_op,
    Dec_io_mops_alu_expand}; // @[Frontend.scala 182:44]
  wire [31:0] _T_14 = {30'h0,decode_pc_second_state}; // @[Cat.scala 30:58]
  wire [212:0] io_fb_fmbs_inst_ops_1_lo = {Dec_1_io_mops_mem_width,Dec_1_io_mops_write_src,Dec_1_io_mops_rs1,
    Dec_1_io_mops_rs2,Dec_1_io_mops_rd,Dec_1_io_mops_imm,Dec_1_io_mops_pc,Dec_1_io_mops_predict_taken,
    Dec_1_io_mops_target_pc}; // @[Frontend.scala 182:44]
  wire [19:0] io_fb_fmbs_inst_ops_1_hi = {Dec_1_io_mops_illegal,Dec_1_io_mops_next_pc,Dec_1_io_mops_alu_mdu_lsu,
    Dec_1_io_mops_branch_type,Dec_1_io_mops_src_a,Dec_1_io_mops_src_b,Dec_1_io_mops_write_dest,Dec_1_io_mops_alu_op,
    Dec_1_io_mops_alu_expand}; // @[Frontend.scala 182:44]
  wire  _predict_taken_but_not_br_T_4 = Dec_io_mops_next_pc == 3'h1 | Dec_io_mops_next_pc == 3'h2 | Dec_io_mops_next_pc
     == 3'h3; // @[Frontend.scala 104:54]
  wire  predict_taken_but_not_br = Dec_io_bht_predict_taken & ~_predict_taken_but_not_br_T_4; // @[Frontend.scala 184:57]
  ysyx_210134_PCGen pc_gen ( // @[Frontend.scala 66:30]
    .clock(pc_gen_clock),
    .reset(pc_gen_reset),
    .io_please_wait(pc_gen_io_please_wait),
    .io_redirect(pc_gen_io_redirect),
    .io_redirect_pc(pc_gen_io_redirect_pc),
    .io_pc_o(pc_gen_io_pc_o),
    .io_predict_sstat_o(pc_gen_io_predict_sstat_o),
    .io_predict_taken_o(pc_gen_io_predict_taken_o),
    .io_predict_target_o(pc_gen_io_predict_target_o),
    .io_narrow_o(pc_gen_io_narrow_o),
    .io_bpu_update_dec_v(pc_gen_io_bpu_update_dec_v),
    .io_bpu_update_dec_pc_br(pc_gen_io_bpu_update_dec_pc_br),
    .io_bpu_update_exe_v(pc_gen_io_bpu_update_exe_v),
    .io_bpu_update_exe_errpr(pc_gen_io_bpu_update_exe_errpr),
    .io_bpu_update_exe_pc_br(pc_gen_io_bpu_update_exe_pc_br),
    .io_bpu_update_exe_target(pc_gen_io_bpu_update_exe_target),
    .io_bpu_update_exe_taken(pc_gen_io_bpu_update_exe_taken)
  );
  ysyx_210134_Dec Dec ( // @[Frontend.scala 84:60]
    .io_pc(Dec_io_pc),
    .io_inst(Dec_io_inst),
    .io_bht_predict_taken(Dec_io_bht_predict_taken),
    .io_target_pc(Dec_io_target_pc),
    .io_mops_illegal(Dec_io_mops_illegal),
    .io_mops_next_pc(Dec_io_mops_next_pc),
    .io_mops_alu_mdu_lsu(Dec_io_mops_alu_mdu_lsu),
    .io_mops_branch_type(Dec_io_mops_branch_type),
    .io_mops_src_a(Dec_io_mops_src_a),
    .io_mops_src_b(Dec_io_mops_src_b),
    .io_mops_write_dest(Dec_io_mops_write_dest),
    .io_mops_alu_op(Dec_io_mops_alu_op),
    .io_mops_alu_expand(Dec_io_mops_alu_expand),
    .io_mops_mem_width(Dec_io_mops_mem_width),
    .io_mops_write_src(Dec_io_mops_write_src),
    .io_mops_rs1(Dec_io_mops_rs1),
    .io_mops_rs2(Dec_io_mops_rs2),
    .io_mops_rd(Dec_io_mops_rd),
    .io_mops_imm(Dec_io_mops_imm),
    .io_mops_pc(Dec_io_mops_pc),
    .io_mops_predict_taken(Dec_io_mops_predict_taken),
    .io_mops_target_pc(Dec_io_mops_target_pc)
  );
  ysyx_210134_Dec Dec_1 ( // @[Frontend.scala 84:60]
    .io_pc(Dec_1_io_pc),
    .io_inst(Dec_1_io_inst),
    .io_bht_predict_taken(Dec_1_io_bht_predict_taken),
    .io_target_pc(Dec_1_io_target_pc),
    .io_mops_illegal(Dec_1_io_mops_illegal),
    .io_mops_next_pc(Dec_1_io_mops_next_pc),
    .io_mops_alu_mdu_lsu(Dec_1_io_mops_alu_mdu_lsu),
    .io_mops_branch_type(Dec_1_io_mops_branch_type),
    .io_mops_src_a(Dec_1_io_mops_src_a),
    .io_mops_src_b(Dec_1_io_mops_src_b),
    .io_mops_write_dest(Dec_1_io_mops_write_dest),
    .io_mops_alu_op(Dec_1_io_mops_alu_op),
    .io_mops_alu_expand(Dec_1_io_mops_alu_expand),
    .io_mops_mem_width(Dec_1_io_mops_mem_width),
    .io_mops_write_src(Dec_1_io_mops_write_src),
    .io_mops_rs1(Dec_1_io_mops_rs1),
    .io_mops_rs2(Dec_1_io_mops_rs2),
    .io_mops_rd(Dec_1_io_mops_rd),
    .io_mops_imm(Dec_1_io_mops_imm),
    .io_mops_pc(Dec_1_io_mops_pc),
    .io_mops_predict_taken(Dec_1_io_mops_predict_taken),
    .io_mops_target_pc(Dec_1_io_mops_target_pc)
  );
  assign io_fb_fmbs_instn = io_fb_fmbs_please_wait ? 2'h0 : _io_fb_fmbs_instn_T; // @[Frontend.scala 170:26]
  assign io_fb_fmbs_inst_ops_0 = {io_fb_fmbs_inst_ops_0_hi,io_fb_fmbs_inst_ops_0_lo}; // @[Frontend.scala 182:44]
  assign io_fb_fmbs_inst_ops_1 = {io_fb_fmbs_inst_ops_1_hi,io_fb_fmbs_inst_ops_1_lo}; // @[Frontend.scala 182:44]
  assign io_icache_req_valid = 1'h1; // @[Frontend.scala 142:28]
  assign io_icache_req_bits_addr = {io_icache_req_bits_addr_hi,2'h0}; // @[Cat.scala 30:58]
  assign io_icache_req_bits_mtype = {{1'd0}, _io_icache_req_bits_mtype_T_2}; // @[Frontend.scala 150:36]
  assign pc_gen_clock = clock;
  assign pc_gen_reset = reset;
  assign pc_gen_io_please_wait = io_fb_fmbs_please_wait | cache_stall; // @[Frontend.scala 108:29]
  assign pc_gen_io_redirect = io_fb_bmfs_redirect_kill | delayed_early_update; // @[Frontend.scala 157:39]
  assign pc_gen_io_redirect_pc = io_fb_bmfs_redirect_kill ? io_fb_bmfs_redirect_pc : dec_kill_redirect_pc_REG; // @[Frontend.scala 121:31]
  assign pc_gen_io_bpu_update_dec_v = delayed_early_update; // @[Frontend.scala 124:30]
  assign pc_gen_io_bpu_update_dec_pc_br = pc_gen_io_bpu_update_dec_pc_br_REG; // @[Frontend.scala 123:34]
  assign pc_gen_io_bpu_update_exe_v = io_fb_bmfs_bpu_v; // @[Frontend.scala 125:28]
  assign pc_gen_io_bpu_update_exe_errpr = io_fb_bmfs_bpu_errpr; // @[Frontend.scala 125:28]
  assign pc_gen_io_bpu_update_exe_pc_br = io_fb_bmfs_bpu_pc_br; // @[Frontend.scala 125:28]
  assign pc_gen_io_bpu_update_exe_target = io_fb_bmfs_bpu_target; // @[Frontend.scala 125:28]
  assign pc_gen_io_bpu_update_exe_taken = io_fb_bmfs_bpu_taken; // @[Frontend.scala 125:28]
  assign Dec_io_pc = _T_4[63:0]; // @[Frontend.scala 173:39]
  assign Dec_io_inst = io_icache_resp_bits_rdata_0; // @[Frontend.scala 174:18]
  assign Dec_io_bht_predict_taken = decode_pc_low_reg[4:2] == 3'h0 & ~next_respn ? 1'h0 : decode_pc_predict_taken; // @[Frontend.scala 176:39]
  assign Dec_io_target_pc = decode_pc_predict_target; // @[Frontend.scala 177:25]
  assign Dec_1_io_pc = decode_pc_low_reg + 64'h4; // @[Frontend.scala 173:39]
  assign Dec_1_io_inst = io_icache_resp_bits_rdata_1; // @[Frontend.scala 174:18]
  assign Dec_1_io_bht_predict_taken = 1'h0; // @[Frontend.scala 179:33]
  assign Dec_1_io_target_pc = {{32'd0}, _T_14}; // @[Cat.scala 30:58]
  always @(posedge clock) begin
    if (reset) begin // @[Frontend.scala 69:31]
      last_req_valid <= 1'h0; // @[Frontend.scala 69:31]
    end else begin
      last_req_valid <= io_icache_req_valid; // @[Frontend.scala 116:18]
    end
    if (reset) begin // @[Frontend.scala 70:31]
      repc <= 64'h0; // @[Frontend.scala 70:31]
    end else if (!(stall_f)) begin // @[Frontend.scala 79:33]
      repc <= pc_gen_io_pc_o;
    end
    if (reset) begin // @[Frontend.scala 71:31]
      reptar <= 64'h0; // @[Frontend.scala 71:31]
    end else if (!(stall_f)) begin // @[Frontend.scala 129:16]
      reptar <= pc_gen_io_predict_target_o;
    end
    if (reset) begin // @[Frontend.scala 72:31]
      repstat <= 2'h0; // @[Frontend.scala 72:31]
    end else if (!(stall_f)) begin // @[Frontend.scala 130:17]
      repstat <= pc_gen_io_predict_sstat_o;
    end
    if (reset) begin // @[Frontend.scala 73:31]
      repred <= 1'h0; // @[Frontend.scala 73:31]
    end else if (!(stall_f)) begin // @[Frontend.scala 131:16]
      repred <= pc_gen_io_predict_taken_o;
    end
    if (reset) begin // @[Frontend.scala 74:56]
      renarrow <= 1'h0; // @[Frontend.scala 74:56]
    end else if (!(stall_f)) begin // @[Frontend.scala 133:20]
      renarrow <= pc_gen_io_narrow_o;
    end
    if (reset) begin // @[Frontend.scala 82:34]
      decode_pc_low_reg <= 64'h30000000; // @[Frontend.scala 82:34]
    end else if (!(kill_d)) begin // @[Frontend.scala 159:17]
      if (~io_fb_fmbs_please_wait & ~cache_stall) begin // @[Frontend.scala 161:41]
        if (stall_f) begin // @[Frontend.scala 79:33]
          decode_pc_low_reg <= repc;
        end else begin
          decode_pc_low_reg <= pc_gen_io_pc_o;
        end
      end
    end
    if (reset) begin // @[Frontend.scala 83:34]
      decode_valid_reg <= 1'h0; // @[Frontend.scala 83:34]
    end else if (kill_d) begin // @[Frontend.scala 159:17]
      decode_valid_reg <= 1'h0; // @[Frontend.scala 160:23]
    end else if (~io_fb_fmbs_please_wait & ~cache_stall) begin // @[Frontend.scala 161:41]
      decode_valid_reg <= io_icache_req_valid; // @[Frontend.scala 166:23]
    end
    if (reset) begin // @[Frontend.scala 88:34]
      next_respn <= 1'h0; // @[Frontend.scala 88:34]
    end else begin
      next_respn <= io_icache_resp_bits_respn; // @[Frontend.scala 88:34]
    end
    if (reset) begin // @[Frontend.scala 92:41]
      decode_pc_predict_target <= 64'h0; // @[Frontend.scala 92:41]
    end else if (!(kill_d)) begin // @[Frontend.scala 159:17]
      if (~io_fb_fmbs_please_wait & ~cache_stall) begin // @[Frontend.scala 161:41]
        if (stall_f) begin // @[Frontend.scala 129:16]
          decode_pc_predict_target <= reptar;
        end else begin
          decode_pc_predict_target <= pc_gen_io_predict_target_o;
        end
      end
    end
    if (reset) begin // @[Frontend.scala 93:41]
      decode_pc_second_state <= 2'h0; // @[Frontend.scala 93:41]
    end else if (!(kill_d)) begin // @[Frontend.scala 159:17]
      if (~io_fb_fmbs_please_wait & ~cache_stall) begin // @[Frontend.scala 161:41]
        if (stall_f) begin // @[Frontend.scala 130:17]
          decode_pc_second_state <= repstat;
        end else begin
          decode_pc_second_state <= pc_gen_io_predict_sstat_o;
        end
      end
    end
    if (reset) begin // @[Frontend.scala 94:41]
      decode_pc_predict_taken <= 1'h0; // @[Frontend.scala 94:41]
    end else if (!(kill_d)) begin // @[Frontend.scala 159:17]
      if (~io_fb_fmbs_please_wait & ~cache_stall) begin // @[Frontend.scala 161:41]
        if (stall_f) begin // @[Frontend.scala 131:16]
          decode_pc_predict_taken <= repred;
        end else begin
          decode_pc_predict_taken <= pc_gen_io_predict_taken_o;
        end
      end
    end
    if (reset) begin // @[Frontend.scala 95:37]
      delayed_early_update <= 1'h0; // @[Frontend.scala 95:37]
    end else if (io_fb_bmfs_redirect_kill) begin // @[Frontend.scala 194:30]
      delayed_early_update <= 1'h0;
    end else begin
      delayed_early_update <= predict_taken_but_not_br & frontend_fire;
    end
    if (reset) begin // @[Frontend.scala 126:35]
      dec_kill_redirect_pc_REG <= 64'h0; // @[Frontend.scala 126:35]
    end else if (io_fb_fmbs_please_wait) begin // @[Frontend.scala 126:39]
      dec_kill_redirect_pc_REG <= decode_pc_low_reg;
    end else if (|next_respn) begin // @[Frontend.scala 126:71]
      dec_kill_redirect_pc_REG <= _dec_kill_redirect_pc_T_2;
    end else begin
      dec_kill_redirect_pc_REG <= _dec_kill_redirect_pc_T_4;
    end
    if (reset) begin // @[Frontend.scala 123:44]
      pc_gen_io_bpu_update_dec_pc_br_REG <= 64'h0; // @[Frontend.scala 123:44]
    end else begin
      pc_gen_io_bpu_update_dec_pc_br_REG <= _pc_gen_io_bpu_update_dec_pc_br_T; // @[Frontend.scala 123:44]
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
  last_req_valid = _RAND_0[0:0];
  _RAND_1 = {2{`RANDOM}};
  repc = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  reptar = _RAND_2[63:0];
  _RAND_3 = {1{`RANDOM}};
  repstat = _RAND_3[1:0];
  _RAND_4 = {1{`RANDOM}};
  repred = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  renarrow = _RAND_5[0:0];
  _RAND_6 = {2{`RANDOM}};
  decode_pc_low_reg = _RAND_6[63:0];
  _RAND_7 = {1{`RANDOM}};
  decode_valid_reg = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  next_respn = _RAND_8[0:0];
  _RAND_9 = {2{`RANDOM}};
  decode_pc_predict_target = _RAND_9[63:0];
  _RAND_10 = {1{`RANDOM}};
  decode_pc_second_state = _RAND_10[1:0];
  _RAND_11 = {1{`RANDOM}};
  decode_pc_predict_taken = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  delayed_early_update = _RAND_12[0:0];
  _RAND_13 = {2{`RANDOM}};
  dec_kill_redirect_pc_REG = _RAND_13[63:0];
  _RAND_14 = {2{`RANDOM}};
  pc_gen_io_bpu_update_dec_pc_br_REG = _RAND_14[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210134_ALU(
  input  [63:0] io_a,
  input  [63:0] io_b,
  input  [3:0]  io_aluOp,
  input         io_aluExpand,
  output [63:0] io_r,
  output        io_zero
);
  wire [63:0] addResult = io_a + io_b; // @[ALU.scala 33:25]
  wire [63:0] subResult = io_a - io_b; // @[ALU.scala 34:25]
  wire [62:0] _GEN_0 = {{31'd0}, io_a[31:0]}; // @[ALU.scala 36:33]
  wire [62:0] _sllwResult_T_2 = _GEN_0 << io_b[4:0]; // @[ALU.scala 36:33]
  wire [31:0] sllwResult = _sllwResult_T_2[31:0]; // @[ALU.scala 36:47]
  wire [31:0] srlwResult = io_a[31:0] >> io_b[4:0]; // @[ALU.scala 37:32]
  wire  _T_2 = $signed(io_a) < $signed(io_b); // @[ALU.scala 41:50]
  wire  _T_4 = io_a < io_b; // @[ALU.scala 42:41]
  wire [63:0] _T_6 = io_a ^ io_b; // @[ALU.scala 43:38]
  wire [63:0] _T_7 = io_a & io_b; // @[ALU.scala 44:38]
  wire [63:0] _T_8 = io_a | io_b; // @[ALU.scala 45:38]
  wire [31:0] hi = sllwResult[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _T_12 = {hi,sllwResult}; // @[Cat.scala 30:58]
  wire [126:0] _GEN_1 = {{63'd0}, io_a}; // @[ALU.scala 46:107]
  wire [126:0] _T_14 = _GEN_1 << io_b[5:0]; // @[ALU.scala 46:107]
  wire [126:0] _T_15 = io_aluExpand ? {{63'd0}, _T_12} : _T_14; // @[ALU.scala 46:35]
  wire [31:0] hi_1 = srlwResult[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _T_19 = {hi_1,srlwResult}; // @[Cat.scala 30:58]
  wire [63:0] _T_21 = io_a >> io_b[5:0]; // @[ALU.scala 47:107]
  wire [63:0] _T_22 = io_aluExpand ? _T_19 : _T_21; // @[ALU.scala 47:35]
  wire [31:0] hi_2 = io_a[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_27 = io_a[31:0]; // @[ALU.scala 48:101]
  wire [31:0] lo = $signed(_T_27) >>> io_b[4:0]; // @[Cat.scala 30:58]
  wire [63:0] _T_30 = {hi_2,lo}; // @[Cat.scala 30:58]
  wire [63:0] _T_34 = $signed(io_a) >>> io_b[5:0]; // @[ALU.scala 48:165]
  wire [63:0] _T_35 = io_aluExpand ? _T_30 : _T_34; // @[ALU.scala 48:35]
  wire [63:0] _result_T_2 = 4'h1 == io_aluOp ? subResult : addResult; // @[Mux.scala 80:57]
  wire [63:0] _result_T_4 = 4'h2 == io_aluOp ? {{63'd0}, _T_2} : _result_T_2; // @[Mux.scala 80:57]
  wire [63:0] _result_T_6 = 4'h3 == io_aluOp ? {{63'd0}, _T_4} : _result_T_4; // @[Mux.scala 80:57]
  wire [63:0] _result_T_8 = 4'h4 == io_aluOp ? _T_6 : _result_T_6; // @[Mux.scala 80:57]
  wire [63:0] _result_T_10 = 4'h5 == io_aluOp ? _T_7 : _result_T_8; // @[Mux.scala 80:57]
  wire [63:0] _result_T_12 = 4'h6 == io_aluOp ? _T_8 : _result_T_10; // @[Mux.scala 80:57]
  wire [126:0] _result_T_14 = 4'h7 == io_aluOp ? _T_15 : {{63'd0}, _result_T_12}; // @[Mux.scala 80:57]
  wire [126:0] _result_T_16 = 4'h8 == io_aluOp ? {{63'd0}, _T_22} : _result_T_14; // @[Mux.scala 80:57]
  wire [126:0] _result_T_18 = 4'h9 == io_aluOp ? {{63'd0}, _T_35} : _result_T_16; // @[Mux.scala 80:57]
  wire [126:0] result = 4'ha == io_aluOp ? {{63'd0}, io_b} : _result_T_18; // @[Mux.scala 80:57]
  wire [31:0] io_r_hi = result[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] io_r_lo = result[31:0]; // @[ALU.scala 53:70]
  wire [63:0] _io_r_T_3 = {io_r_hi,io_r_lo}; // @[Cat.scala 30:58]
  wire [126:0] _io_r_T_4 = io_aluExpand ? {{63'd0}, _io_r_T_3} : result; // @[ALU.scala 53:14]
  assign io_r = _io_r_T_4[63:0]; // @[ALU.scala 53:8]
  assign io_zero = ~(|io_r); // @[ALU.scala 54:14]
endmodule
module ysyx_210134_FIFO(
  input         clock,
  input         reset,
  output        io_dout_0_illegal,
  output [2:0]  io_dout_0_next_pc,
  output [1:0]  io_dout_0_alu_mdu_lsu,
  output [3:0]  io_dout_0_branch_type,
  output [1:0]  io_dout_0_src_a,
  output [1:0]  io_dout_0_src_b,
  output        io_dout_0_write_dest,
  output [3:0]  io_dout_0_alu_op,
  output        io_dout_0_alu_expand,
  output [2:0]  io_dout_0_mem_width,
  output [1:0]  io_dout_0_write_src,
  output [4:0]  io_dout_0_rs1,
  output [4:0]  io_dout_0_rs2,
  output [4:0]  io_dout_0_rd,
  output [63:0] io_dout_0_imm,
  output [63:0] io_dout_0_pc,
  output        io_dout_0_predict_taken,
  output [63:0] io_dout_0_target_pc,
  output        io_dout_1_illegal,
  output [2:0]  io_dout_1_next_pc,
  output [1:0]  io_dout_1_alu_mdu_lsu,
  output [3:0]  io_dout_1_branch_type,
  output [1:0]  io_dout_1_src_a,
  output [1:0]  io_dout_1_src_b,
  output        io_dout_1_write_dest,
  output [3:0]  io_dout_1_alu_op,
  output        io_dout_1_alu_expand,
  output [2:0]  io_dout_1_mem_width,
  output [1:0]  io_dout_1_write_src,
  output [4:0]  io_dout_1_rs1,
  output [4:0]  io_dout_1_rs2,
  output [4:0]  io_dout_1_rd,
  output [63:0] io_dout_1_imm,
  output [63:0] io_dout_1_pc,
  output        io_dout_1_predict_taken,
  output [63:0] io_dout_1_target_pc,
  input  [3:0]  io_enqStep,
  input         io_enqReq,
  input  [3:0]  io_deqStep,
  input         io_deqReq,
  input         io_din_0_illegal,
  input  [2:0]  io_din_0_next_pc,
  input  [1:0]  io_din_0_alu_mdu_lsu,
  input  [3:0]  io_din_0_branch_type,
  input  [1:0]  io_din_0_src_a,
  input  [1:0]  io_din_0_src_b,
  input         io_din_0_write_dest,
  input  [3:0]  io_din_0_alu_op,
  input         io_din_0_alu_expand,
  input  [2:0]  io_din_0_mem_width,
  input  [1:0]  io_din_0_write_src,
  input  [4:0]  io_din_0_rs1,
  input  [4:0]  io_din_0_rs2,
  input  [4:0]  io_din_0_rd,
  input  [63:0] io_din_0_imm,
  input  [63:0] io_din_0_pc,
  input         io_din_0_predict_taken,
  input  [63:0] io_din_0_target_pc,
  input         io_din_1_illegal,
  input  [2:0]  io_din_1_next_pc,
  input  [1:0]  io_din_1_alu_mdu_lsu,
  input  [3:0]  io_din_1_branch_type,
  input  [1:0]  io_din_1_src_a,
  input  [1:0]  io_din_1_src_b,
  input         io_din_1_write_dest,
  input  [3:0]  io_din_1_alu_op,
  input         io_din_1_alu_expand,
  input  [2:0]  io_din_1_mem_width,
  input  [1:0]  io_din_1_write_src,
  input  [4:0]  io_din_1_rs1,
  input  [4:0]  io_din_1_rs2,
  input  [4:0]  io_din_1_rd,
  input  [63:0] io_din_1_imm,
  input  [63:0] io_din_1_pc,
  input         io_din_1_predict_taken,
  input  [63:0] io_din_1_target_pc,
  input         io_flush,
  output        io_sufficient,
  output [3:0]  io_items
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
  reg [63:0] _RAND_14;
  reg [63:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [63:0] _RAND_17;
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
  reg [63:0] _RAND_32;
  reg [63:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [63:0] _RAND_35;
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
  reg [63:0] _RAND_50;
  reg [63:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [63:0] _RAND_53;
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
  reg [63:0] _RAND_68;
  reg [63:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [63:0] _RAND_71;
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
  reg [63:0] _RAND_86;
  reg [63:0] _RAND_87;
  reg [31:0] _RAND_88;
  reg [63:0] _RAND_89;
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
  reg [63:0] _RAND_104;
  reg [63:0] _RAND_105;
  reg [31:0] _RAND_106;
  reg [63:0] _RAND_107;
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
  reg [63:0] _RAND_122;
  reg [63:0] _RAND_123;
  reg [31:0] _RAND_124;
  reg [63:0] _RAND_125;
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
  reg [63:0] _RAND_140;
  reg [63:0] _RAND_141;
  reg [31:0] _RAND_142;
  reg [63:0] _RAND_143;
  reg [31:0] _RAND_144;
  reg [31:0] _RAND_145;
  reg [31:0] _RAND_146;
`endif // RANDOMIZE_REG_INIT
  reg  mem_0_illegal; // @[FIFO.scala 21:20]
  reg [2:0] mem_0_next_pc; // @[FIFO.scala 21:20]
  reg [1:0] mem_0_alu_mdu_lsu; // @[FIFO.scala 21:20]
  reg [3:0] mem_0_branch_type; // @[FIFO.scala 21:20]
  reg [1:0] mem_0_src_a; // @[FIFO.scala 21:20]
  reg [1:0] mem_0_src_b; // @[FIFO.scala 21:20]
  reg  mem_0_write_dest; // @[FIFO.scala 21:20]
  reg [3:0] mem_0_alu_op; // @[FIFO.scala 21:20]
  reg  mem_0_alu_expand; // @[FIFO.scala 21:20]
  reg [2:0] mem_0_mem_width; // @[FIFO.scala 21:20]
  reg [1:0] mem_0_write_src; // @[FIFO.scala 21:20]
  reg [4:0] mem_0_rs1; // @[FIFO.scala 21:20]
  reg [4:0] mem_0_rs2; // @[FIFO.scala 21:20]
  reg [4:0] mem_0_rd; // @[FIFO.scala 21:20]
  reg [63:0] mem_0_imm; // @[FIFO.scala 21:20]
  reg [63:0] mem_0_pc; // @[FIFO.scala 21:20]
  reg  mem_0_predict_taken; // @[FIFO.scala 21:20]
  reg [63:0] mem_0_target_pc; // @[FIFO.scala 21:20]
  reg  mem_1_illegal; // @[FIFO.scala 21:20]
  reg [2:0] mem_1_next_pc; // @[FIFO.scala 21:20]
  reg [1:0] mem_1_alu_mdu_lsu; // @[FIFO.scala 21:20]
  reg [3:0] mem_1_branch_type; // @[FIFO.scala 21:20]
  reg [1:0] mem_1_src_a; // @[FIFO.scala 21:20]
  reg [1:0] mem_1_src_b; // @[FIFO.scala 21:20]
  reg  mem_1_write_dest; // @[FIFO.scala 21:20]
  reg [3:0] mem_1_alu_op; // @[FIFO.scala 21:20]
  reg  mem_1_alu_expand; // @[FIFO.scala 21:20]
  reg [2:0] mem_1_mem_width; // @[FIFO.scala 21:20]
  reg [1:0] mem_1_write_src; // @[FIFO.scala 21:20]
  reg [4:0] mem_1_rs1; // @[FIFO.scala 21:20]
  reg [4:0] mem_1_rs2; // @[FIFO.scala 21:20]
  reg [4:0] mem_1_rd; // @[FIFO.scala 21:20]
  reg [63:0] mem_1_imm; // @[FIFO.scala 21:20]
  reg [63:0] mem_1_pc; // @[FIFO.scala 21:20]
  reg  mem_1_predict_taken; // @[FIFO.scala 21:20]
  reg [63:0] mem_1_target_pc; // @[FIFO.scala 21:20]
  reg  mem_2_illegal; // @[FIFO.scala 21:20]
  reg [2:0] mem_2_next_pc; // @[FIFO.scala 21:20]
  reg [1:0] mem_2_alu_mdu_lsu; // @[FIFO.scala 21:20]
  reg [3:0] mem_2_branch_type; // @[FIFO.scala 21:20]
  reg [1:0] mem_2_src_a; // @[FIFO.scala 21:20]
  reg [1:0] mem_2_src_b; // @[FIFO.scala 21:20]
  reg  mem_2_write_dest; // @[FIFO.scala 21:20]
  reg [3:0] mem_2_alu_op; // @[FIFO.scala 21:20]
  reg  mem_2_alu_expand; // @[FIFO.scala 21:20]
  reg [2:0] mem_2_mem_width; // @[FIFO.scala 21:20]
  reg [1:0] mem_2_write_src; // @[FIFO.scala 21:20]
  reg [4:0] mem_2_rs1; // @[FIFO.scala 21:20]
  reg [4:0] mem_2_rs2; // @[FIFO.scala 21:20]
  reg [4:0] mem_2_rd; // @[FIFO.scala 21:20]
  reg [63:0] mem_2_imm; // @[FIFO.scala 21:20]
  reg [63:0] mem_2_pc; // @[FIFO.scala 21:20]
  reg  mem_2_predict_taken; // @[FIFO.scala 21:20]
  reg [63:0] mem_2_target_pc; // @[FIFO.scala 21:20]
  reg  mem_3_illegal; // @[FIFO.scala 21:20]
  reg [2:0] mem_3_next_pc; // @[FIFO.scala 21:20]
  reg [1:0] mem_3_alu_mdu_lsu; // @[FIFO.scala 21:20]
  reg [3:0] mem_3_branch_type; // @[FIFO.scala 21:20]
  reg [1:0] mem_3_src_a; // @[FIFO.scala 21:20]
  reg [1:0] mem_3_src_b; // @[FIFO.scala 21:20]
  reg  mem_3_write_dest; // @[FIFO.scala 21:20]
  reg [3:0] mem_3_alu_op; // @[FIFO.scala 21:20]
  reg  mem_3_alu_expand; // @[FIFO.scala 21:20]
  reg [2:0] mem_3_mem_width; // @[FIFO.scala 21:20]
  reg [1:0] mem_3_write_src; // @[FIFO.scala 21:20]
  reg [4:0] mem_3_rs1; // @[FIFO.scala 21:20]
  reg [4:0] mem_3_rs2; // @[FIFO.scala 21:20]
  reg [4:0] mem_3_rd; // @[FIFO.scala 21:20]
  reg [63:0] mem_3_imm; // @[FIFO.scala 21:20]
  reg [63:0] mem_3_pc; // @[FIFO.scala 21:20]
  reg  mem_3_predict_taken; // @[FIFO.scala 21:20]
  reg [63:0] mem_3_target_pc; // @[FIFO.scala 21:20]
  reg  mem_4_illegal; // @[FIFO.scala 21:20]
  reg [2:0] mem_4_next_pc; // @[FIFO.scala 21:20]
  reg [1:0] mem_4_alu_mdu_lsu; // @[FIFO.scala 21:20]
  reg [3:0] mem_4_branch_type; // @[FIFO.scala 21:20]
  reg [1:0] mem_4_src_a; // @[FIFO.scala 21:20]
  reg [1:0] mem_4_src_b; // @[FIFO.scala 21:20]
  reg  mem_4_write_dest; // @[FIFO.scala 21:20]
  reg [3:0] mem_4_alu_op; // @[FIFO.scala 21:20]
  reg  mem_4_alu_expand; // @[FIFO.scala 21:20]
  reg [2:0] mem_4_mem_width; // @[FIFO.scala 21:20]
  reg [1:0] mem_4_write_src; // @[FIFO.scala 21:20]
  reg [4:0] mem_4_rs1; // @[FIFO.scala 21:20]
  reg [4:0] mem_4_rs2; // @[FIFO.scala 21:20]
  reg [4:0] mem_4_rd; // @[FIFO.scala 21:20]
  reg [63:0] mem_4_imm; // @[FIFO.scala 21:20]
  reg [63:0] mem_4_pc; // @[FIFO.scala 21:20]
  reg  mem_4_predict_taken; // @[FIFO.scala 21:20]
  reg [63:0] mem_4_target_pc; // @[FIFO.scala 21:20]
  reg  mem_5_illegal; // @[FIFO.scala 21:20]
  reg [2:0] mem_5_next_pc; // @[FIFO.scala 21:20]
  reg [1:0] mem_5_alu_mdu_lsu; // @[FIFO.scala 21:20]
  reg [3:0] mem_5_branch_type; // @[FIFO.scala 21:20]
  reg [1:0] mem_5_src_a; // @[FIFO.scala 21:20]
  reg [1:0] mem_5_src_b; // @[FIFO.scala 21:20]
  reg  mem_5_write_dest; // @[FIFO.scala 21:20]
  reg [3:0] mem_5_alu_op; // @[FIFO.scala 21:20]
  reg  mem_5_alu_expand; // @[FIFO.scala 21:20]
  reg [2:0] mem_5_mem_width; // @[FIFO.scala 21:20]
  reg [1:0] mem_5_write_src; // @[FIFO.scala 21:20]
  reg [4:0] mem_5_rs1; // @[FIFO.scala 21:20]
  reg [4:0] mem_5_rs2; // @[FIFO.scala 21:20]
  reg [4:0] mem_5_rd; // @[FIFO.scala 21:20]
  reg [63:0] mem_5_imm; // @[FIFO.scala 21:20]
  reg [63:0] mem_5_pc; // @[FIFO.scala 21:20]
  reg  mem_5_predict_taken; // @[FIFO.scala 21:20]
  reg [63:0] mem_5_target_pc; // @[FIFO.scala 21:20]
  reg  mem_6_illegal; // @[FIFO.scala 21:20]
  reg [2:0] mem_6_next_pc; // @[FIFO.scala 21:20]
  reg [1:0] mem_6_alu_mdu_lsu; // @[FIFO.scala 21:20]
  reg [3:0] mem_6_branch_type; // @[FIFO.scala 21:20]
  reg [1:0] mem_6_src_a; // @[FIFO.scala 21:20]
  reg [1:0] mem_6_src_b; // @[FIFO.scala 21:20]
  reg  mem_6_write_dest; // @[FIFO.scala 21:20]
  reg [3:0] mem_6_alu_op; // @[FIFO.scala 21:20]
  reg  mem_6_alu_expand; // @[FIFO.scala 21:20]
  reg [2:0] mem_6_mem_width; // @[FIFO.scala 21:20]
  reg [1:0] mem_6_write_src; // @[FIFO.scala 21:20]
  reg [4:0] mem_6_rs1; // @[FIFO.scala 21:20]
  reg [4:0] mem_6_rs2; // @[FIFO.scala 21:20]
  reg [4:0] mem_6_rd; // @[FIFO.scala 21:20]
  reg [63:0] mem_6_imm; // @[FIFO.scala 21:20]
  reg [63:0] mem_6_pc; // @[FIFO.scala 21:20]
  reg  mem_6_predict_taken; // @[FIFO.scala 21:20]
  reg [63:0] mem_6_target_pc; // @[FIFO.scala 21:20]
  reg  mem_7_illegal; // @[FIFO.scala 21:20]
  reg [2:0] mem_7_next_pc; // @[FIFO.scala 21:20]
  reg [1:0] mem_7_alu_mdu_lsu; // @[FIFO.scala 21:20]
  reg [3:0] mem_7_branch_type; // @[FIFO.scala 21:20]
  reg [1:0] mem_7_src_a; // @[FIFO.scala 21:20]
  reg [1:0] mem_7_src_b; // @[FIFO.scala 21:20]
  reg  mem_7_write_dest; // @[FIFO.scala 21:20]
  reg [3:0] mem_7_alu_op; // @[FIFO.scala 21:20]
  reg  mem_7_alu_expand; // @[FIFO.scala 21:20]
  reg [2:0] mem_7_mem_width; // @[FIFO.scala 21:20]
  reg [1:0] mem_7_write_src; // @[FIFO.scala 21:20]
  reg [4:0] mem_7_rs1; // @[FIFO.scala 21:20]
  reg [4:0] mem_7_rs2; // @[FIFO.scala 21:20]
  reg [4:0] mem_7_rd; // @[FIFO.scala 21:20]
  reg [63:0] mem_7_imm; // @[FIFO.scala 21:20]
  reg [63:0] mem_7_pc; // @[FIFO.scala 21:20]
  reg  mem_7_predict_taken; // @[FIFO.scala 21:20]
  reg [63:0] mem_7_target_pc; // @[FIFO.scala 21:20]
  reg  maybe_full; // @[FIFO.scala 31:27]
  reg [3:0] enqPtr; // @[FIFO.scala 24:25]
  wire [3:0] enqPtr_cntNext = enqPtr + io_enqStep; // @[FIFO.scala 25:26]
  wire [3:0] _enqPtr_cntReg_T_2 = enqPtr_cntNext - 4'h8; // @[FIFO.scala 27:48]
  wire  do_enq = io_enqReq & io_sufficient; // @[FIFO.scala 40:23]
  reg [3:0] deqPtr; // @[FIFO.scala 24:25]
  wire [3:0] deqPtr_cntNext = deqPtr + io_deqStep; // @[FIFO.scala 25:26]
  wire [3:0] _deqPtr_cntReg_T_2 = deqPtr_cntNext - 4'h8; // @[FIFO.scala 27:48]
  wire  ptr_match = enqPtr == deqPtr; // @[FIFO.scala 37:26]
  wire  empty = ptr_match & ~maybe_full | io_flush; // @[FIFO.scala 38:40]
  wire  do_deq = io_deqReq & ~empty; // @[FIFO.scala 41:23]
  wire  full = ptr_match & maybe_full; // @[FIFO.scala 39:24]
  wire [3:0] ptr_diff = enqPtr - deqPtr; // @[FIFO.scala 42:25]
  wire [3:0] _io_sufficient_T_2 = 4'h8 - io_items; // @[FIFO.scala 43:47]
  wire [3:0] _io_items_T = maybe_full ? 4'h8 : 4'h0; // @[FIFO.scala 44:33]
  wire [3:0] _io_items_T_3 = 4'h8 + ptr_diff; // @[FIFO.scala 44:88]
  wire [3:0] _io_items_T_4 = deqPtr > enqPtr ? _io_items_T_3 : ptr_diff; // @[FIFO.scala 44:63]
  wire [4:0] _T = {{1'd0}, enqPtr}; // @[FIFO.scala 48:19]
  wire [3:0] _GEN_0 = _T[3:0] % 4'h8; // @[FIFO.scala 48:26]
  wire [3:0] _T_2 = _GEN_0[3:0]; // @[FIFO.scala 48:26]
  wire [3:0] _T_5 = enqPtr + 4'h1; // @[FIFO.scala 48:19]
  wire [3:0] _GEN_1 = _T_5 % 4'h8; // @[FIFO.scala 48:26]
  wire [3:0] _T_6 = _GEN_1[3:0]; // @[FIFO.scala 48:26]
  wire [4:0] _io_dout_0_T = {{1'd0}, deqPtr}; // @[FIFO.scala 57:31]
  wire [3:0] _GEN_2 = _io_dout_0_T[3:0] % 4'h8; // @[FIFO.scala 57:38]
  wire [3:0] _io_dout_0_T_2 = _GEN_2[3:0]; // @[FIFO.scala 57:38]
  wire [63:0] _GEN_436 = 3'h1 == _io_dout_0_T_2[2:0] ? mem_1_target_pc : mem_0_target_pc; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [63:0] _GEN_437 = 3'h2 == _io_dout_0_T_2[2:0] ? mem_2_target_pc : _GEN_436; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [63:0] _GEN_438 = 3'h3 == _io_dout_0_T_2[2:0] ? mem_3_target_pc : _GEN_437; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [63:0] _GEN_439 = 3'h4 == _io_dout_0_T_2[2:0] ? mem_4_target_pc : _GEN_438; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [63:0] _GEN_440 = 3'h5 == _io_dout_0_T_2[2:0] ? mem_5_target_pc : _GEN_439; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [63:0] _GEN_441 = 3'h6 == _io_dout_0_T_2[2:0] ? mem_6_target_pc : _GEN_440; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire  _GEN_444 = 3'h1 == _io_dout_0_T_2[2:0] ? mem_1_predict_taken : mem_0_predict_taken; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire  _GEN_445 = 3'h2 == _io_dout_0_T_2[2:0] ? mem_2_predict_taken : _GEN_444; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire  _GEN_446 = 3'h3 == _io_dout_0_T_2[2:0] ? mem_3_predict_taken : _GEN_445; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire  _GEN_447 = 3'h4 == _io_dout_0_T_2[2:0] ? mem_4_predict_taken : _GEN_446; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire  _GEN_448 = 3'h5 == _io_dout_0_T_2[2:0] ? mem_5_predict_taken : _GEN_447; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire  _GEN_449 = 3'h6 == _io_dout_0_T_2[2:0] ? mem_6_predict_taken : _GEN_448; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [63:0] _GEN_452 = 3'h1 == _io_dout_0_T_2[2:0] ? mem_1_pc : mem_0_pc; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [63:0] _GEN_453 = 3'h2 == _io_dout_0_T_2[2:0] ? mem_2_pc : _GEN_452; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [63:0] _GEN_454 = 3'h3 == _io_dout_0_T_2[2:0] ? mem_3_pc : _GEN_453; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [63:0] _GEN_455 = 3'h4 == _io_dout_0_T_2[2:0] ? mem_4_pc : _GEN_454; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [63:0] _GEN_456 = 3'h5 == _io_dout_0_T_2[2:0] ? mem_5_pc : _GEN_455; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [63:0] _GEN_457 = 3'h6 == _io_dout_0_T_2[2:0] ? mem_6_pc : _GEN_456; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [63:0] _GEN_460 = 3'h1 == _io_dout_0_T_2[2:0] ? mem_1_imm : mem_0_imm; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [63:0] _GEN_461 = 3'h2 == _io_dout_0_T_2[2:0] ? mem_2_imm : _GEN_460; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [63:0] _GEN_462 = 3'h3 == _io_dout_0_T_2[2:0] ? mem_3_imm : _GEN_461; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [63:0] _GEN_463 = 3'h4 == _io_dout_0_T_2[2:0] ? mem_4_imm : _GEN_462; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [63:0] _GEN_464 = 3'h5 == _io_dout_0_T_2[2:0] ? mem_5_imm : _GEN_463; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [63:0] _GEN_465 = 3'h6 == _io_dout_0_T_2[2:0] ? mem_6_imm : _GEN_464; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [4:0] _GEN_468 = 3'h1 == _io_dout_0_T_2[2:0] ? mem_1_rd : mem_0_rd; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [4:0] _GEN_469 = 3'h2 == _io_dout_0_T_2[2:0] ? mem_2_rd : _GEN_468; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [4:0] _GEN_470 = 3'h3 == _io_dout_0_T_2[2:0] ? mem_3_rd : _GEN_469; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [4:0] _GEN_471 = 3'h4 == _io_dout_0_T_2[2:0] ? mem_4_rd : _GEN_470; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [4:0] _GEN_472 = 3'h5 == _io_dout_0_T_2[2:0] ? mem_5_rd : _GEN_471; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [4:0] _GEN_473 = 3'h6 == _io_dout_0_T_2[2:0] ? mem_6_rd : _GEN_472; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [4:0] _GEN_476 = 3'h1 == _io_dout_0_T_2[2:0] ? mem_1_rs2 : mem_0_rs2; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [4:0] _GEN_477 = 3'h2 == _io_dout_0_T_2[2:0] ? mem_2_rs2 : _GEN_476; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [4:0] _GEN_478 = 3'h3 == _io_dout_0_T_2[2:0] ? mem_3_rs2 : _GEN_477; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [4:0] _GEN_479 = 3'h4 == _io_dout_0_T_2[2:0] ? mem_4_rs2 : _GEN_478; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [4:0] _GEN_480 = 3'h5 == _io_dout_0_T_2[2:0] ? mem_5_rs2 : _GEN_479; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [4:0] _GEN_481 = 3'h6 == _io_dout_0_T_2[2:0] ? mem_6_rs2 : _GEN_480; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [4:0] _GEN_484 = 3'h1 == _io_dout_0_T_2[2:0] ? mem_1_rs1 : mem_0_rs1; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [4:0] _GEN_485 = 3'h2 == _io_dout_0_T_2[2:0] ? mem_2_rs1 : _GEN_484; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [4:0] _GEN_486 = 3'h3 == _io_dout_0_T_2[2:0] ? mem_3_rs1 : _GEN_485; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [4:0] _GEN_487 = 3'h4 == _io_dout_0_T_2[2:0] ? mem_4_rs1 : _GEN_486; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [4:0] _GEN_488 = 3'h5 == _io_dout_0_T_2[2:0] ? mem_5_rs1 : _GEN_487; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [4:0] _GEN_489 = 3'h6 == _io_dout_0_T_2[2:0] ? mem_6_rs1 : _GEN_488; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [1:0] _GEN_492 = 3'h1 == _io_dout_0_T_2[2:0] ? mem_1_write_src : mem_0_write_src; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [1:0] _GEN_493 = 3'h2 == _io_dout_0_T_2[2:0] ? mem_2_write_src : _GEN_492; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [1:0] _GEN_494 = 3'h3 == _io_dout_0_T_2[2:0] ? mem_3_write_src : _GEN_493; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [1:0] _GEN_495 = 3'h4 == _io_dout_0_T_2[2:0] ? mem_4_write_src : _GEN_494; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [1:0] _GEN_496 = 3'h5 == _io_dout_0_T_2[2:0] ? mem_5_write_src : _GEN_495; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [1:0] _GEN_497 = 3'h6 == _io_dout_0_T_2[2:0] ? mem_6_write_src : _GEN_496; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [2:0] _GEN_500 = 3'h1 == _io_dout_0_T_2[2:0] ? mem_1_mem_width : mem_0_mem_width; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [2:0] _GEN_501 = 3'h2 == _io_dout_0_T_2[2:0] ? mem_2_mem_width : _GEN_500; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [2:0] _GEN_502 = 3'h3 == _io_dout_0_T_2[2:0] ? mem_3_mem_width : _GEN_501; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [2:0] _GEN_503 = 3'h4 == _io_dout_0_T_2[2:0] ? mem_4_mem_width : _GEN_502; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [2:0] _GEN_504 = 3'h5 == _io_dout_0_T_2[2:0] ? mem_5_mem_width : _GEN_503; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [2:0] _GEN_505 = 3'h6 == _io_dout_0_T_2[2:0] ? mem_6_mem_width : _GEN_504; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire  _GEN_508 = 3'h1 == _io_dout_0_T_2[2:0] ? mem_1_alu_expand : mem_0_alu_expand; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire  _GEN_509 = 3'h2 == _io_dout_0_T_2[2:0] ? mem_2_alu_expand : _GEN_508; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire  _GEN_510 = 3'h3 == _io_dout_0_T_2[2:0] ? mem_3_alu_expand : _GEN_509; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire  _GEN_511 = 3'h4 == _io_dout_0_T_2[2:0] ? mem_4_alu_expand : _GEN_510; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire  _GEN_512 = 3'h5 == _io_dout_0_T_2[2:0] ? mem_5_alu_expand : _GEN_511; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire  _GEN_513 = 3'h6 == _io_dout_0_T_2[2:0] ? mem_6_alu_expand : _GEN_512; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [3:0] _GEN_516 = 3'h1 == _io_dout_0_T_2[2:0] ? mem_1_alu_op : mem_0_alu_op; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [3:0] _GEN_517 = 3'h2 == _io_dout_0_T_2[2:0] ? mem_2_alu_op : _GEN_516; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [3:0] _GEN_518 = 3'h3 == _io_dout_0_T_2[2:0] ? mem_3_alu_op : _GEN_517; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [3:0] _GEN_519 = 3'h4 == _io_dout_0_T_2[2:0] ? mem_4_alu_op : _GEN_518; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [3:0] _GEN_520 = 3'h5 == _io_dout_0_T_2[2:0] ? mem_5_alu_op : _GEN_519; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [3:0] _GEN_521 = 3'h6 == _io_dout_0_T_2[2:0] ? mem_6_alu_op : _GEN_520; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire  _GEN_524 = 3'h1 == _io_dout_0_T_2[2:0] ? mem_1_write_dest : mem_0_write_dest; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire  _GEN_525 = 3'h2 == _io_dout_0_T_2[2:0] ? mem_2_write_dest : _GEN_524; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire  _GEN_526 = 3'h3 == _io_dout_0_T_2[2:0] ? mem_3_write_dest : _GEN_525; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire  _GEN_527 = 3'h4 == _io_dout_0_T_2[2:0] ? mem_4_write_dest : _GEN_526; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire  _GEN_528 = 3'h5 == _io_dout_0_T_2[2:0] ? mem_5_write_dest : _GEN_527; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire  _GEN_529 = 3'h6 == _io_dout_0_T_2[2:0] ? mem_6_write_dest : _GEN_528; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [1:0] _GEN_532 = 3'h1 == _io_dout_0_T_2[2:0] ? mem_1_src_b : mem_0_src_b; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [1:0] _GEN_533 = 3'h2 == _io_dout_0_T_2[2:0] ? mem_2_src_b : _GEN_532; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [1:0] _GEN_534 = 3'h3 == _io_dout_0_T_2[2:0] ? mem_3_src_b : _GEN_533; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [1:0] _GEN_535 = 3'h4 == _io_dout_0_T_2[2:0] ? mem_4_src_b : _GEN_534; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [1:0] _GEN_536 = 3'h5 == _io_dout_0_T_2[2:0] ? mem_5_src_b : _GEN_535; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [1:0] _GEN_537 = 3'h6 == _io_dout_0_T_2[2:0] ? mem_6_src_b : _GEN_536; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [1:0] _GEN_540 = 3'h1 == _io_dout_0_T_2[2:0] ? mem_1_src_a : mem_0_src_a; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [1:0] _GEN_541 = 3'h2 == _io_dout_0_T_2[2:0] ? mem_2_src_a : _GEN_540; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [1:0] _GEN_542 = 3'h3 == _io_dout_0_T_2[2:0] ? mem_3_src_a : _GEN_541; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [1:0] _GEN_543 = 3'h4 == _io_dout_0_T_2[2:0] ? mem_4_src_a : _GEN_542; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [1:0] _GEN_544 = 3'h5 == _io_dout_0_T_2[2:0] ? mem_5_src_a : _GEN_543; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [1:0] _GEN_545 = 3'h6 == _io_dout_0_T_2[2:0] ? mem_6_src_a : _GEN_544; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [3:0] _GEN_548 = 3'h1 == _io_dout_0_T_2[2:0] ? mem_1_branch_type : mem_0_branch_type; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [3:0] _GEN_549 = 3'h2 == _io_dout_0_T_2[2:0] ? mem_2_branch_type : _GEN_548; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [3:0] _GEN_550 = 3'h3 == _io_dout_0_T_2[2:0] ? mem_3_branch_type : _GEN_549; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [3:0] _GEN_551 = 3'h4 == _io_dout_0_T_2[2:0] ? mem_4_branch_type : _GEN_550; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [3:0] _GEN_552 = 3'h5 == _io_dout_0_T_2[2:0] ? mem_5_branch_type : _GEN_551; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [3:0] _GEN_553 = 3'h6 == _io_dout_0_T_2[2:0] ? mem_6_branch_type : _GEN_552; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [1:0] _GEN_556 = 3'h1 == _io_dout_0_T_2[2:0] ? mem_1_alu_mdu_lsu : mem_0_alu_mdu_lsu; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [1:0] _GEN_557 = 3'h2 == _io_dout_0_T_2[2:0] ? mem_2_alu_mdu_lsu : _GEN_556; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [1:0] _GEN_558 = 3'h3 == _io_dout_0_T_2[2:0] ? mem_3_alu_mdu_lsu : _GEN_557; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [1:0] _GEN_559 = 3'h4 == _io_dout_0_T_2[2:0] ? mem_4_alu_mdu_lsu : _GEN_558; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [1:0] _GEN_560 = 3'h5 == _io_dout_0_T_2[2:0] ? mem_5_alu_mdu_lsu : _GEN_559; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [1:0] _GEN_561 = 3'h6 == _io_dout_0_T_2[2:0] ? mem_6_alu_mdu_lsu : _GEN_560; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [2:0] _GEN_564 = 3'h1 == _io_dout_0_T_2[2:0] ? mem_1_next_pc : mem_0_next_pc; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [2:0] _GEN_565 = 3'h2 == _io_dout_0_T_2[2:0] ? mem_2_next_pc : _GEN_564; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [2:0] _GEN_566 = 3'h3 == _io_dout_0_T_2[2:0] ? mem_3_next_pc : _GEN_565; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [2:0] _GEN_567 = 3'h4 == _io_dout_0_T_2[2:0] ? mem_4_next_pc : _GEN_566; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [2:0] _GEN_568 = 3'h5 == _io_dout_0_T_2[2:0] ? mem_5_next_pc : _GEN_567; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [2:0] _GEN_569 = 3'h6 == _io_dout_0_T_2[2:0] ? mem_6_next_pc : _GEN_568; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire  _GEN_572 = 3'h1 == _io_dout_0_T_2[2:0] ? mem_1_illegal : mem_0_illegal; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire  _GEN_573 = 3'h2 == _io_dout_0_T_2[2:0] ? mem_2_illegal : _GEN_572; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire  _GEN_574 = 3'h3 == _io_dout_0_T_2[2:0] ? mem_3_illegal : _GEN_573; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire  _GEN_575 = 3'h4 == _io_dout_0_T_2[2:0] ? mem_4_illegal : _GEN_574; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire  _GEN_576 = 3'h5 == _io_dout_0_T_2[2:0] ? mem_5_illegal : _GEN_575; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire  _GEN_577 = 3'h6 == _io_dout_0_T_2[2:0] ? mem_6_illegal : _GEN_576; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [3:0] _io_dout_1_T_1 = deqPtr + 4'h1; // @[FIFO.scala 57:31]
  wire [3:0] _GEN_3 = _io_dout_1_T_1 % 4'h8; // @[FIFO.scala 57:38]
  wire [3:0] _io_dout_1_T_2 = _GEN_3[3:0]; // @[FIFO.scala 57:38]
  wire [63:0] _GEN_580 = 3'h1 == _io_dout_1_T_2[2:0] ? mem_1_target_pc : mem_0_target_pc; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [63:0] _GEN_581 = 3'h2 == _io_dout_1_T_2[2:0] ? mem_2_target_pc : _GEN_580; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [63:0] _GEN_582 = 3'h3 == _io_dout_1_T_2[2:0] ? mem_3_target_pc : _GEN_581; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [63:0] _GEN_583 = 3'h4 == _io_dout_1_T_2[2:0] ? mem_4_target_pc : _GEN_582; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [63:0] _GEN_584 = 3'h5 == _io_dout_1_T_2[2:0] ? mem_5_target_pc : _GEN_583; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [63:0] _GEN_585 = 3'h6 == _io_dout_1_T_2[2:0] ? mem_6_target_pc : _GEN_584; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire  _GEN_588 = 3'h1 == _io_dout_1_T_2[2:0] ? mem_1_predict_taken : mem_0_predict_taken; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire  _GEN_589 = 3'h2 == _io_dout_1_T_2[2:0] ? mem_2_predict_taken : _GEN_588; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire  _GEN_590 = 3'h3 == _io_dout_1_T_2[2:0] ? mem_3_predict_taken : _GEN_589; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire  _GEN_591 = 3'h4 == _io_dout_1_T_2[2:0] ? mem_4_predict_taken : _GEN_590; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire  _GEN_592 = 3'h5 == _io_dout_1_T_2[2:0] ? mem_5_predict_taken : _GEN_591; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire  _GEN_593 = 3'h6 == _io_dout_1_T_2[2:0] ? mem_6_predict_taken : _GEN_592; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [63:0] _GEN_596 = 3'h1 == _io_dout_1_T_2[2:0] ? mem_1_pc : mem_0_pc; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [63:0] _GEN_597 = 3'h2 == _io_dout_1_T_2[2:0] ? mem_2_pc : _GEN_596; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [63:0] _GEN_598 = 3'h3 == _io_dout_1_T_2[2:0] ? mem_3_pc : _GEN_597; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [63:0] _GEN_599 = 3'h4 == _io_dout_1_T_2[2:0] ? mem_4_pc : _GEN_598; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [63:0] _GEN_600 = 3'h5 == _io_dout_1_T_2[2:0] ? mem_5_pc : _GEN_599; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [63:0] _GEN_601 = 3'h6 == _io_dout_1_T_2[2:0] ? mem_6_pc : _GEN_600; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [63:0] _GEN_604 = 3'h1 == _io_dout_1_T_2[2:0] ? mem_1_imm : mem_0_imm; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [63:0] _GEN_605 = 3'h2 == _io_dout_1_T_2[2:0] ? mem_2_imm : _GEN_604; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [63:0] _GEN_606 = 3'h3 == _io_dout_1_T_2[2:0] ? mem_3_imm : _GEN_605; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [63:0] _GEN_607 = 3'h4 == _io_dout_1_T_2[2:0] ? mem_4_imm : _GEN_606; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [63:0] _GEN_608 = 3'h5 == _io_dout_1_T_2[2:0] ? mem_5_imm : _GEN_607; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [63:0] _GEN_609 = 3'h6 == _io_dout_1_T_2[2:0] ? mem_6_imm : _GEN_608; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [4:0] _GEN_612 = 3'h1 == _io_dout_1_T_2[2:0] ? mem_1_rd : mem_0_rd; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [4:0] _GEN_613 = 3'h2 == _io_dout_1_T_2[2:0] ? mem_2_rd : _GEN_612; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [4:0] _GEN_614 = 3'h3 == _io_dout_1_T_2[2:0] ? mem_3_rd : _GEN_613; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [4:0] _GEN_615 = 3'h4 == _io_dout_1_T_2[2:0] ? mem_4_rd : _GEN_614; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [4:0] _GEN_616 = 3'h5 == _io_dout_1_T_2[2:0] ? mem_5_rd : _GEN_615; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [4:0] _GEN_617 = 3'h6 == _io_dout_1_T_2[2:0] ? mem_6_rd : _GEN_616; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [4:0] _GEN_620 = 3'h1 == _io_dout_1_T_2[2:0] ? mem_1_rs2 : mem_0_rs2; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [4:0] _GEN_621 = 3'h2 == _io_dout_1_T_2[2:0] ? mem_2_rs2 : _GEN_620; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [4:0] _GEN_622 = 3'h3 == _io_dout_1_T_2[2:0] ? mem_3_rs2 : _GEN_621; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [4:0] _GEN_623 = 3'h4 == _io_dout_1_T_2[2:0] ? mem_4_rs2 : _GEN_622; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [4:0] _GEN_624 = 3'h5 == _io_dout_1_T_2[2:0] ? mem_5_rs2 : _GEN_623; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [4:0] _GEN_625 = 3'h6 == _io_dout_1_T_2[2:0] ? mem_6_rs2 : _GEN_624; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [4:0] _GEN_628 = 3'h1 == _io_dout_1_T_2[2:0] ? mem_1_rs1 : mem_0_rs1; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [4:0] _GEN_629 = 3'h2 == _io_dout_1_T_2[2:0] ? mem_2_rs1 : _GEN_628; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [4:0] _GEN_630 = 3'h3 == _io_dout_1_T_2[2:0] ? mem_3_rs1 : _GEN_629; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [4:0] _GEN_631 = 3'h4 == _io_dout_1_T_2[2:0] ? mem_4_rs1 : _GEN_630; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [4:0] _GEN_632 = 3'h5 == _io_dout_1_T_2[2:0] ? mem_5_rs1 : _GEN_631; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [4:0] _GEN_633 = 3'h6 == _io_dout_1_T_2[2:0] ? mem_6_rs1 : _GEN_632; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [1:0] _GEN_636 = 3'h1 == _io_dout_1_T_2[2:0] ? mem_1_write_src : mem_0_write_src; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [1:0] _GEN_637 = 3'h2 == _io_dout_1_T_2[2:0] ? mem_2_write_src : _GEN_636; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [1:0] _GEN_638 = 3'h3 == _io_dout_1_T_2[2:0] ? mem_3_write_src : _GEN_637; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [1:0] _GEN_639 = 3'h4 == _io_dout_1_T_2[2:0] ? mem_4_write_src : _GEN_638; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [1:0] _GEN_640 = 3'h5 == _io_dout_1_T_2[2:0] ? mem_5_write_src : _GEN_639; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [1:0] _GEN_641 = 3'h6 == _io_dout_1_T_2[2:0] ? mem_6_write_src : _GEN_640; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [2:0] _GEN_644 = 3'h1 == _io_dout_1_T_2[2:0] ? mem_1_mem_width : mem_0_mem_width; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [2:0] _GEN_645 = 3'h2 == _io_dout_1_T_2[2:0] ? mem_2_mem_width : _GEN_644; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [2:0] _GEN_646 = 3'h3 == _io_dout_1_T_2[2:0] ? mem_3_mem_width : _GEN_645; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [2:0] _GEN_647 = 3'h4 == _io_dout_1_T_2[2:0] ? mem_4_mem_width : _GEN_646; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [2:0] _GEN_648 = 3'h5 == _io_dout_1_T_2[2:0] ? mem_5_mem_width : _GEN_647; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [2:0] _GEN_649 = 3'h6 == _io_dout_1_T_2[2:0] ? mem_6_mem_width : _GEN_648; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire  _GEN_652 = 3'h1 == _io_dout_1_T_2[2:0] ? mem_1_alu_expand : mem_0_alu_expand; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire  _GEN_653 = 3'h2 == _io_dout_1_T_2[2:0] ? mem_2_alu_expand : _GEN_652; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire  _GEN_654 = 3'h3 == _io_dout_1_T_2[2:0] ? mem_3_alu_expand : _GEN_653; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire  _GEN_655 = 3'h4 == _io_dout_1_T_2[2:0] ? mem_4_alu_expand : _GEN_654; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire  _GEN_656 = 3'h5 == _io_dout_1_T_2[2:0] ? mem_5_alu_expand : _GEN_655; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire  _GEN_657 = 3'h6 == _io_dout_1_T_2[2:0] ? mem_6_alu_expand : _GEN_656; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [3:0] _GEN_660 = 3'h1 == _io_dout_1_T_2[2:0] ? mem_1_alu_op : mem_0_alu_op; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [3:0] _GEN_661 = 3'h2 == _io_dout_1_T_2[2:0] ? mem_2_alu_op : _GEN_660; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [3:0] _GEN_662 = 3'h3 == _io_dout_1_T_2[2:0] ? mem_3_alu_op : _GEN_661; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [3:0] _GEN_663 = 3'h4 == _io_dout_1_T_2[2:0] ? mem_4_alu_op : _GEN_662; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [3:0] _GEN_664 = 3'h5 == _io_dout_1_T_2[2:0] ? mem_5_alu_op : _GEN_663; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [3:0] _GEN_665 = 3'h6 == _io_dout_1_T_2[2:0] ? mem_6_alu_op : _GEN_664; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire  _GEN_668 = 3'h1 == _io_dout_1_T_2[2:0] ? mem_1_write_dest : mem_0_write_dest; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire  _GEN_669 = 3'h2 == _io_dout_1_T_2[2:0] ? mem_2_write_dest : _GEN_668; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire  _GEN_670 = 3'h3 == _io_dout_1_T_2[2:0] ? mem_3_write_dest : _GEN_669; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire  _GEN_671 = 3'h4 == _io_dout_1_T_2[2:0] ? mem_4_write_dest : _GEN_670; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire  _GEN_672 = 3'h5 == _io_dout_1_T_2[2:0] ? mem_5_write_dest : _GEN_671; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire  _GEN_673 = 3'h6 == _io_dout_1_T_2[2:0] ? mem_6_write_dest : _GEN_672; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [1:0] _GEN_676 = 3'h1 == _io_dout_1_T_2[2:0] ? mem_1_src_b : mem_0_src_b; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [1:0] _GEN_677 = 3'h2 == _io_dout_1_T_2[2:0] ? mem_2_src_b : _GEN_676; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [1:0] _GEN_678 = 3'h3 == _io_dout_1_T_2[2:0] ? mem_3_src_b : _GEN_677; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [1:0] _GEN_679 = 3'h4 == _io_dout_1_T_2[2:0] ? mem_4_src_b : _GEN_678; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [1:0] _GEN_680 = 3'h5 == _io_dout_1_T_2[2:0] ? mem_5_src_b : _GEN_679; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [1:0] _GEN_681 = 3'h6 == _io_dout_1_T_2[2:0] ? mem_6_src_b : _GEN_680; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [1:0] _GEN_684 = 3'h1 == _io_dout_1_T_2[2:0] ? mem_1_src_a : mem_0_src_a; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [1:0] _GEN_685 = 3'h2 == _io_dout_1_T_2[2:0] ? mem_2_src_a : _GEN_684; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [1:0] _GEN_686 = 3'h3 == _io_dout_1_T_2[2:0] ? mem_3_src_a : _GEN_685; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [1:0] _GEN_687 = 3'h4 == _io_dout_1_T_2[2:0] ? mem_4_src_a : _GEN_686; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [1:0] _GEN_688 = 3'h5 == _io_dout_1_T_2[2:0] ? mem_5_src_a : _GEN_687; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [1:0] _GEN_689 = 3'h6 == _io_dout_1_T_2[2:0] ? mem_6_src_a : _GEN_688; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [3:0] _GEN_692 = 3'h1 == _io_dout_1_T_2[2:0] ? mem_1_branch_type : mem_0_branch_type; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [3:0] _GEN_693 = 3'h2 == _io_dout_1_T_2[2:0] ? mem_2_branch_type : _GEN_692; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [3:0] _GEN_694 = 3'h3 == _io_dout_1_T_2[2:0] ? mem_3_branch_type : _GEN_693; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [3:0] _GEN_695 = 3'h4 == _io_dout_1_T_2[2:0] ? mem_4_branch_type : _GEN_694; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [3:0] _GEN_696 = 3'h5 == _io_dout_1_T_2[2:0] ? mem_5_branch_type : _GEN_695; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [3:0] _GEN_697 = 3'h6 == _io_dout_1_T_2[2:0] ? mem_6_branch_type : _GEN_696; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [1:0] _GEN_700 = 3'h1 == _io_dout_1_T_2[2:0] ? mem_1_alu_mdu_lsu : mem_0_alu_mdu_lsu; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [1:0] _GEN_701 = 3'h2 == _io_dout_1_T_2[2:0] ? mem_2_alu_mdu_lsu : _GEN_700; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [1:0] _GEN_702 = 3'h3 == _io_dout_1_T_2[2:0] ? mem_3_alu_mdu_lsu : _GEN_701; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [1:0] _GEN_703 = 3'h4 == _io_dout_1_T_2[2:0] ? mem_4_alu_mdu_lsu : _GEN_702; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [1:0] _GEN_704 = 3'h5 == _io_dout_1_T_2[2:0] ? mem_5_alu_mdu_lsu : _GEN_703; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [1:0] _GEN_705 = 3'h6 == _io_dout_1_T_2[2:0] ? mem_6_alu_mdu_lsu : _GEN_704; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [2:0] _GEN_708 = 3'h1 == _io_dout_1_T_2[2:0] ? mem_1_next_pc : mem_0_next_pc; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [2:0] _GEN_709 = 3'h2 == _io_dout_1_T_2[2:0] ? mem_2_next_pc : _GEN_708; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [2:0] _GEN_710 = 3'h3 == _io_dout_1_T_2[2:0] ? mem_3_next_pc : _GEN_709; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [2:0] _GEN_711 = 3'h4 == _io_dout_1_T_2[2:0] ? mem_4_next_pc : _GEN_710; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [2:0] _GEN_712 = 3'h5 == _io_dout_1_T_2[2:0] ? mem_5_next_pc : _GEN_711; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire [2:0] _GEN_713 = 3'h6 == _io_dout_1_T_2[2:0] ? mem_6_next_pc : _GEN_712; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire  _GEN_716 = 3'h1 == _io_dout_1_T_2[2:0] ? mem_1_illegal : mem_0_illegal; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire  _GEN_717 = 3'h2 == _io_dout_1_T_2[2:0] ? mem_2_illegal : _GEN_716; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire  _GEN_718 = 3'h3 == _io_dout_1_T_2[2:0] ? mem_3_illegal : _GEN_717; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire  _GEN_719 = 3'h4 == _io_dout_1_T_2[2:0] ? mem_4_illegal : _GEN_718; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire  _GEN_720 = 3'h5 == _io_dout_1_T_2[2:0] ? mem_5_illegal : _GEN_719; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  wire  _GEN_721 = 3'h6 == _io_dout_1_T_2[2:0] ? mem_6_illegal : _GEN_720; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  assign io_dout_0_illegal = 3'h7 == _io_dout_0_T_2[2:0] ? mem_7_illegal : _GEN_577; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  assign io_dout_0_next_pc = 3'h7 == _io_dout_0_T_2[2:0] ? mem_7_next_pc : _GEN_569; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  assign io_dout_0_alu_mdu_lsu = 3'h7 == _io_dout_0_T_2[2:0] ? mem_7_alu_mdu_lsu : _GEN_561; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  assign io_dout_0_branch_type = 3'h7 == _io_dout_0_T_2[2:0] ? mem_7_branch_type : _GEN_553; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  assign io_dout_0_src_a = 3'h7 == _io_dout_0_T_2[2:0] ? mem_7_src_a : _GEN_545; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  assign io_dout_0_src_b = 3'h7 == _io_dout_0_T_2[2:0] ? mem_7_src_b : _GEN_537; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  assign io_dout_0_write_dest = 3'h7 == _io_dout_0_T_2[2:0] ? mem_7_write_dest : _GEN_529; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  assign io_dout_0_alu_op = 3'h7 == _io_dout_0_T_2[2:0] ? mem_7_alu_op : _GEN_521; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  assign io_dout_0_alu_expand = 3'h7 == _io_dout_0_T_2[2:0] ? mem_7_alu_expand : _GEN_513; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  assign io_dout_0_mem_width = 3'h7 == _io_dout_0_T_2[2:0] ? mem_7_mem_width : _GEN_505; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  assign io_dout_0_write_src = 3'h7 == _io_dout_0_T_2[2:0] ? mem_7_write_src : _GEN_497; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  assign io_dout_0_rs1 = 3'h7 == _io_dout_0_T_2[2:0] ? mem_7_rs1 : _GEN_489; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  assign io_dout_0_rs2 = 3'h7 == _io_dout_0_T_2[2:0] ? mem_7_rs2 : _GEN_481; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  assign io_dout_0_rd = 3'h7 == _io_dout_0_T_2[2:0] ? mem_7_rd : _GEN_473; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  assign io_dout_0_imm = 3'h7 == _io_dout_0_T_2[2:0] ? mem_7_imm : _GEN_465; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  assign io_dout_0_pc = 3'h7 == _io_dout_0_T_2[2:0] ? mem_7_pc : _GEN_457; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  assign io_dout_0_predict_taken = 3'h7 == _io_dout_0_T_2[2:0] ? mem_7_predict_taken : _GEN_449; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  assign io_dout_0_target_pc = 3'h7 == _io_dout_0_T_2[2:0] ? mem_7_target_pc : _GEN_441; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  assign io_dout_1_illegal = 3'h7 == _io_dout_1_T_2[2:0] ? mem_7_illegal : _GEN_721; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  assign io_dout_1_next_pc = 3'h7 == _io_dout_1_T_2[2:0] ? mem_7_next_pc : _GEN_713; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  assign io_dout_1_alu_mdu_lsu = 3'h7 == _io_dout_1_T_2[2:0] ? mem_7_alu_mdu_lsu : _GEN_705; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  assign io_dout_1_branch_type = 3'h7 == _io_dout_1_T_2[2:0] ? mem_7_branch_type : _GEN_697; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  assign io_dout_1_src_a = 3'h7 == _io_dout_1_T_2[2:0] ? mem_7_src_a : _GEN_689; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  assign io_dout_1_src_b = 3'h7 == _io_dout_1_T_2[2:0] ? mem_7_src_b : _GEN_681; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  assign io_dout_1_write_dest = 3'h7 == _io_dout_1_T_2[2:0] ? mem_7_write_dest : _GEN_673; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  assign io_dout_1_alu_op = 3'h7 == _io_dout_1_T_2[2:0] ? mem_7_alu_op : _GEN_665; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  assign io_dout_1_alu_expand = 3'h7 == _io_dout_1_T_2[2:0] ? mem_7_alu_expand : _GEN_657; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  assign io_dout_1_mem_width = 3'h7 == _io_dout_1_T_2[2:0] ? mem_7_mem_width : _GEN_649; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  assign io_dout_1_write_src = 3'h7 == _io_dout_1_T_2[2:0] ? mem_7_write_src : _GEN_641; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  assign io_dout_1_rs1 = 3'h7 == _io_dout_1_T_2[2:0] ? mem_7_rs1 : _GEN_633; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  assign io_dout_1_rs2 = 3'h7 == _io_dout_1_T_2[2:0] ? mem_7_rs2 : _GEN_625; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  assign io_dout_1_rd = 3'h7 == _io_dout_1_T_2[2:0] ? mem_7_rd : _GEN_617; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  assign io_dout_1_imm = 3'h7 == _io_dout_1_T_2[2:0] ? mem_7_imm : _GEN_609; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  assign io_dout_1_pc = 3'h7 == _io_dout_1_T_2[2:0] ? mem_7_pc : _GEN_601; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  assign io_dout_1_predict_taken = 3'h7 == _io_dout_1_T_2[2:0] ? mem_7_predict_taken : _GEN_593; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  assign io_dout_1_target_pc = 3'h7 == _io_dout_1_T_2[2:0] ? mem_7_target_pc : _GEN_585; // @[FIFO.scala 57:16 FIFO.scala 57:16]
  assign io_sufficient = ~full & 4'h2 <= _io_sufficient_T_2; // @[FIFO.scala 43:26]
  assign io_items = ptr_match ? _io_items_T : _io_items_T_4; // @[FIFO.scala 44:18]
  always @(posedge clock) begin
    if (reset) begin // @[FIFO.scala 21:20]
      mem_0_illegal <= 1'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h0 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_0_illegal <= io_din_1_illegal; // @[FIFO.scala 48:36]
      end else if (3'h0 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_0_illegal <= io_din_0_illegal; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_0_next_pc <= 3'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h0 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_0_next_pc <= io_din_1_next_pc; // @[FIFO.scala 48:36]
      end else if (3'h0 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_0_next_pc <= io_din_0_next_pc; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_0_alu_mdu_lsu <= 2'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h0 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_0_alu_mdu_lsu <= io_din_1_alu_mdu_lsu; // @[FIFO.scala 48:36]
      end else if (3'h0 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_0_alu_mdu_lsu <= io_din_0_alu_mdu_lsu; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_0_branch_type <= 4'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h0 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_0_branch_type <= io_din_1_branch_type; // @[FIFO.scala 48:36]
      end else if (3'h0 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_0_branch_type <= io_din_0_branch_type; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_0_src_a <= 2'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h0 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_0_src_a <= io_din_1_src_a; // @[FIFO.scala 48:36]
      end else if (3'h0 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_0_src_a <= io_din_0_src_a; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_0_src_b <= 2'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h0 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_0_src_b <= io_din_1_src_b; // @[FIFO.scala 48:36]
      end else if (3'h0 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_0_src_b <= io_din_0_src_b; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_0_write_dest <= 1'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h0 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_0_write_dest <= io_din_1_write_dest; // @[FIFO.scala 48:36]
      end else if (3'h0 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_0_write_dest <= io_din_0_write_dest; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_0_alu_op <= 4'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h0 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_0_alu_op <= io_din_1_alu_op; // @[FIFO.scala 48:36]
      end else if (3'h0 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_0_alu_op <= io_din_0_alu_op; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_0_alu_expand <= 1'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h0 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_0_alu_expand <= io_din_1_alu_expand; // @[FIFO.scala 48:36]
      end else if (3'h0 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_0_alu_expand <= io_din_0_alu_expand; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_0_mem_width <= 3'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h0 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_0_mem_width <= io_din_1_mem_width; // @[FIFO.scala 48:36]
      end else if (3'h0 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_0_mem_width <= io_din_0_mem_width; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_0_write_src <= 2'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h0 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_0_write_src <= io_din_1_write_src; // @[FIFO.scala 48:36]
      end else if (3'h0 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_0_write_src <= io_din_0_write_src; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_0_rs1 <= 5'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h0 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_0_rs1 <= io_din_1_rs1; // @[FIFO.scala 48:36]
      end else if (3'h0 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_0_rs1 <= io_din_0_rs1; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_0_rs2 <= 5'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h0 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_0_rs2 <= io_din_1_rs2; // @[FIFO.scala 48:36]
      end else if (3'h0 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_0_rs2 <= io_din_0_rs2; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_0_rd <= 5'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h0 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_0_rd <= io_din_1_rd; // @[FIFO.scala 48:36]
      end else if (3'h0 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_0_rd <= io_din_0_rd; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_0_imm <= 64'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h0 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_0_imm <= io_din_1_imm; // @[FIFO.scala 48:36]
      end else if (3'h0 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_0_imm <= io_din_0_imm; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_0_pc <= 64'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h0 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_0_pc <= io_din_1_pc; // @[FIFO.scala 48:36]
      end else if (3'h0 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_0_pc <= io_din_0_pc; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_0_predict_taken <= 1'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h0 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_0_predict_taken <= io_din_1_predict_taken; // @[FIFO.scala 48:36]
      end else if (3'h0 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_0_predict_taken <= io_din_0_predict_taken; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_0_target_pc <= 64'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h0 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_0_target_pc <= io_din_1_target_pc; // @[FIFO.scala 48:36]
      end else if (3'h0 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_0_target_pc <= io_din_0_target_pc; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_1_illegal <= 1'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h1 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_1_illegal <= io_din_1_illegal; // @[FIFO.scala 48:36]
      end else if (3'h1 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_1_illegal <= io_din_0_illegal; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_1_next_pc <= 3'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h1 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_1_next_pc <= io_din_1_next_pc; // @[FIFO.scala 48:36]
      end else if (3'h1 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_1_next_pc <= io_din_0_next_pc; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_1_alu_mdu_lsu <= 2'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h1 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_1_alu_mdu_lsu <= io_din_1_alu_mdu_lsu; // @[FIFO.scala 48:36]
      end else if (3'h1 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_1_alu_mdu_lsu <= io_din_0_alu_mdu_lsu; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_1_branch_type <= 4'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h1 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_1_branch_type <= io_din_1_branch_type; // @[FIFO.scala 48:36]
      end else if (3'h1 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_1_branch_type <= io_din_0_branch_type; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_1_src_a <= 2'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h1 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_1_src_a <= io_din_1_src_a; // @[FIFO.scala 48:36]
      end else if (3'h1 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_1_src_a <= io_din_0_src_a; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_1_src_b <= 2'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h1 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_1_src_b <= io_din_1_src_b; // @[FIFO.scala 48:36]
      end else if (3'h1 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_1_src_b <= io_din_0_src_b; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_1_write_dest <= 1'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h1 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_1_write_dest <= io_din_1_write_dest; // @[FIFO.scala 48:36]
      end else if (3'h1 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_1_write_dest <= io_din_0_write_dest; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_1_alu_op <= 4'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h1 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_1_alu_op <= io_din_1_alu_op; // @[FIFO.scala 48:36]
      end else if (3'h1 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_1_alu_op <= io_din_0_alu_op; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_1_alu_expand <= 1'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h1 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_1_alu_expand <= io_din_1_alu_expand; // @[FIFO.scala 48:36]
      end else if (3'h1 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_1_alu_expand <= io_din_0_alu_expand; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_1_mem_width <= 3'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h1 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_1_mem_width <= io_din_1_mem_width; // @[FIFO.scala 48:36]
      end else if (3'h1 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_1_mem_width <= io_din_0_mem_width; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_1_write_src <= 2'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h1 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_1_write_src <= io_din_1_write_src; // @[FIFO.scala 48:36]
      end else if (3'h1 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_1_write_src <= io_din_0_write_src; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_1_rs1 <= 5'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h1 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_1_rs1 <= io_din_1_rs1; // @[FIFO.scala 48:36]
      end else if (3'h1 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_1_rs1 <= io_din_0_rs1; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_1_rs2 <= 5'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h1 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_1_rs2 <= io_din_1_rs2; // @[FIFO.scala 48:36]
      end else if (3'h1 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_1_rs2 <= io_din_0_rs2; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_1_rd <= 5'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h1 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_1_rd <= io_din_1_rd; // @[FIFO.scala 48:36]
      end else if (3'h1 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_1_rd <= io_din_0_rd; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_1_imm <= 64'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h1 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_1_imm <= io_din_1_imm; // @[FIFO.scala 48:36]
      end else if (3'h1 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_1_imm <= io_din_0_imm; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_1_pc <= 64'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h1 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_1_pc <= io_din_1_pc; // @[FIFO.scala 48:36]
      end else if (3'h1 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_1_pc <= io_din_0_pc; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_1_predict_taken <= 1'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h1 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_1_predict_taken <= io_din_1_predict_taken; // @[FIFO.scala 48:36]
      end else if (3'h1 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_1_predict_taken <= io_din_0_predict_taken; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_1_target_pc <= 64'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h1 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_1_target_pc <= io_din_1_target_pc; // @[FIFO.scala 48:36]
      end else if (3'h1 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_1_target_pc <= io_din_0_target_pc; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_2_illegal <= 1'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h2 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_2_illegal <= io_din_1_illegal; // @[FIFO.scala 48:36]
      end else if (3'h2 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_2_illegal <= io_din_0_illegal; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_2_next_pc <= 3'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h2 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_2_next_pc <= io_din_1_next_pc; // @[FIFO.scala 48:36]
      end else if (3'h2 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_2_next_pc <= io_din_0_next_pc; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_2_alu_mdu_lsu <= 2'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h2 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_2_alu_mdu_lsu <= io_din_1_alu_mdu_lsu; // @[FIFO.scala 48:36]
      end else if (3'h2 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_2_alu_mdu_lsu <= io_din_0_alu_mdu_lsu; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_2_branch_type <= 4'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h2 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_2_branch_type <= io_din_1_branch_type; // @[FIFO.scala 48:36]
      end else if (3'h2 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_2_branch_type <= io_din_0_branch_type; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_2_src_a <= 2'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h2 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_2_src_a <= io_din_1_src_a; // @[FIFO.scala 48:36]
      end else if (3'h2 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_2_src_a <= io_din_0_src_a; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_2_src_b <= 2'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h2 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_2_src_b <= io_din_1_src_b; // @[FIFO.scala 48:36]
      end else if (3'h2 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_2_src_b <= io_din_0_src_b; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_2_write_dest <= 1'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h2 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_2_write_dest <= io_din_1_write_dest; // @[FIFO.scala 48:36]
      end else if (3'h2 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_2_write_dest <= io_din_0_write_dest; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_2_alu_op <= 4'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h2 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_2_alu_op <= io_din_1_alu_op; // @[FIFO.scala 48:36]
      end else if (3'h2 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_2_alu_op <= io_din_0_alu_op; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_2_alu_expand <= 1'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h2 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_2_alu_expand <= io_din_1_alu_expand; // @[FIFO.scala 48:36]
      end else if (3'h2 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_2_alu_expand <= io_din_0_alu_expand; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_2_mem_width <= 3'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h2 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_2_mem_width <= io_din_1_mem_width; // @[FIFO.scala 48:36]
      end else if (3'h2 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_2_mem_width <= io_din_0_mem_width; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_2_write_src <= 2'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h2 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_2_write_src <= io_din_1_write_src; // @[FIFO.scala 48:36]
      end else if (3'h2 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_2_write_src <= io_din_0_write_src; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_2_rs1 <= 5'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h2 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_2_rs1 <= io_din_1_rs1; // @[FIFO.scala 48:36]
      end else if (3'h2 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_2_rs1 <= io_din_0_rs1; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_2_rs2 <= 5'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h2 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_2_rs2 <= io_din_1_rs2; // @[FIFO.scala 48:36]
      end else if (3'h2 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_2_rs2 <= io_din_0_rs2; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_2_rd <= 5'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h2 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_2_rd <= io_din_1_rd; // @[FIFO.scala 48:36]
      end else if (3'h2 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_2_rd <= io_din_0_rd; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_2_imm <= 64'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h2 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_2_imm <= io_din_1_imm; // @[FIFO.scala 48:36]
      end else if (3'h2 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_2_imm <= io_din_0_imm; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_2_pc <= 64'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h2 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_2_pc <= io_din_1_pc; // @[FIFO.scala 48:36]
      end else if (3'h2 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_2_pc <= io_din_0_pc; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_2_predict_taken <= 1'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h2 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_2_predict_taken <= io_din_1_predict_taken; // @[FIFO.scala 48:36]
      end else if (3'h2 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_2_predict_taken <= io_din_0_predict_taken; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_2_target_pc <= 64'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h2 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_2_target_pc <= io_din_1_target_pc; // @[FIFO.scala 48:36]
      end else if (3'h2 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_2_target_pc <= io_din_0_target_pc; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_3_illegal <= 1'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h3 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_3_illegal <= io_din_1_illegal; // @[FIFO.scala 48:36]
      end else if (3'h3 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_3_illegal <= io_din_0_illegal; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_3_next_pc <= 3'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h3 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_3_next_pc <= io_din_1_next_pc; // @[FIFO.scala 48:36]
      end else if (3'h3 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_3_next_pc <= io_din_0_next_pc; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_3_alu_mdu_lsu <= 2'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h3 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_3_alu_mdu_lsu <= io_din_1_alu_mdu_lsu; // @[FIFO.scala 48:36]
      end else if (3'h3 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_3_alu_mdu_lsu <= io_din_0_alu_mdu_lsu; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_3_branch_type <= 4'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h3 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_3_branch_type <= io_din_1_branch_type; // @[FIFO.scala 48:36]
      end else if (3'h3 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_3_branch_type <= io_din_0_branch_type; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_3_src_a <= 2'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h3 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_3_src_a <= io_din_1_src_a; // @[FIFO.scala 48:36]
      end else if (3'h3 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_3_src_a <= io_din_0_src_a; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_3_src_b <= 2'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h3 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_3_src_b <= io_din_1_src_b; // @[FIFO.scala 48:36]
      end else if (3'h3 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_3_src_b <= io_din_0_src_b; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_3_write_dest <= 1'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h3 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_3_write_dest <= io_din_1_write_dest; // @[FIFO.scala 48:36]
      end else if (3'h3 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_3_write_dest <= io_din_0_write_dest; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_3_alu_op <= 4'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h3 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_3_alu_op <= io_din_1_alu_op; // @[FIFO.scala 48:36]
      end else if (3'h3 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_3_alu_op <= io_din_0_alu_op; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_3_alu_expand <= 1'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h3 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_3_alu_expand <= io_din_1_alu_expand; // @[FIFO.scala 48:36]
      end else if (3'h3 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_3_alu_expand <= io_din_0_alu_expand; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_3_mem_width <= 3'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h3 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_3_mem_width <= io_din_1_mem_width; // @[FIFO.scala 48:36]
      end else if (3'h3 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_3_mem_width <= io_din_0_mem_width; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_3_write_src <= 2'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h3 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_3_write_src <= io_din_1_write_src; // @[FIFO.scala 48:36]
      end else if (3'h3 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_3_write_src <= io_din_0_write_src; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_3_rs1 <= 5'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h3 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_3_rs1 <= io_din_1_rs1; // @[FIFO.scala 48:36]
      end else if (3'h3 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_3_rs1 <= io_din_0_rs1; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_3_rs2 <= 5'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h3 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_3_rs2 <= io_din_1_rs2; // @[FIFO.scala 48:36]
      end else if (3'h3 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_3_rs2 <= io_din_0_rs2; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_3_rd <= 5'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h3 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_3_rd <= io_din_1_rd; // @[FIFO.scala 48:36]
      end else if (3'h3 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_3_rd <= io_din_0_rd; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_3_imm <= 64'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h3 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_3_imm <= io_din_1_imm; // @[FIFO.scala 48:36]
      end else if (3'h3 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_3_imm <= io_din_0_imm; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_3_pc <= 64'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h3 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_3_pc <= io_din_1_pc; // @[FIFO.scala 48:36]
      end else if (3'h3 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_3_pc <= io_din_0_pc; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_3_predict_taken <= 1'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h3 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_3_predict_taken <= io_din_1_predict_taken; // @[FIFO.scala 48:36]
      end else if (3'h3 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_3_predict_taken <= io_din_0_predict_taken; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_3_target_pc <= 64'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h3 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_3_target_pc <= io_din_1_target_pc; // @[FIFO.scala 48:36]
      end else if (3'h3 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_3_target_pc <= io_din_0_target_pc; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_4_illegal <= 1'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h4 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_4_illegal <= io_din_1_illegal; // @[FIFO.scala 48:36]
      end else if (3'h4 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_4_illegal <= io_din_0_illegal; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_4_next_pc <= 3'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h4 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_4_next_pc <= io_din_1_next_pc; // @[FIFO.scala 48:36]
      end else if (3'h4 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_4_next_pc <= io_din_0_next_pc; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_4_alu_mdu_lsu <= 2'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h4 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_4_alu_mdu_lsu <= io_din_1_alu_mdu_lsu; // @[FIFO.scala 48:36]
      end else if (3'h4 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_4_alu_mdu_lsu <= io_din_0_alu_mdu_lsu; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_4_branch_type <= 4'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h4 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_4_branch_type <= io_din_1_branch_type; // @[FIFO.scala 48:36]
      end else if (3'h4 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_4_branch_type <= io_din_0_branch_type; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_4_src_a <= 2'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h4 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_4_src_a <= io_din_1_src_a; // @[FIFO.scala 48:36]
      end else if (3'h4 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_4_src_a <= io_din_0_src_a; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_4_src_b <= 2'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h4 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_4_src_b <= io_din_1_src_b; // @[FIFO.scala 48:36]
      end else if (3'h4 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_4_src_b <= io_din_0_src_b; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_4_write_dest <= 1'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h4 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_4_write_dest <= io_din_1_write_dest; // @[FIFO.scala 48:36]
      end else if (3'h4 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_4_write_dest <= io_din_0_write_dest; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_4_alu_op <= 4'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h4 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_4_alu_op <= io_din_1_alu_op; // @[FIFO.scala 48:36]
      end else if (3'h4 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_4_alu_op <= io_din_0_alu_op; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_4_alu_expand <= 1'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h4 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_4_alu_expand <= io_din_1_alu_expand; // @[FIFO.scala 48:36]
      end else if (3'h4 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_4_alu_expand <= io_din_0_alu_expand; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_4_mem_width <= 3'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h4 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_4_mem_width <= io_din_1_mem_width; // @[FIFO.scala 48:36]
      end else if (3'h4 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_4_mem_width <= io_din_0_mem_width; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_4_write_src <= 2'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h4 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_4_write_src <= io_din_1_write_src; // @[FIFO.scala 48:36]
      end else if (3'h4 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_4_write_src <= io_din_0_write_src; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_4_rs1 <= 5'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h4 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_4_rs1 <= io_din_1_rs1; // @[FIFO.scala 48:36]
      end else if (3'h4 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_4_rs1 <= io_din_0_rs1; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_4_rs2 <= 5'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h4 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_4_rs2 <= io_din_1_rs2; // @[FIFO.scala 48:36]
      end else if (3'h4 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_4_rs2 <= io_din_0_rs2; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_4_rd <= 5'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h4 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_4_rd <= io_din_1_rd; // @[FIFO.scala 48:36]
      end else if (3'h4 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_4_rd <= io_din_0_rd; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_4_imm <= 64'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h4 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_4_imm <= io_din_1_imm; // @[FIFO.scala 48:36]
      end else if (3'h4 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_4_imm <= io_din_0_imm; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_4_pc <= 64'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h4 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_4_pc <= io_din_1_pc; // @[FIFO.scala 48:36]
      end else if (3'h4 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_4_pc <= io_din_0_pc; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_4_predict_taken <= 1'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h4 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_4_predict_taken <= io_din_1_predict_taken; // @[FIFO.scala 48:36]
      end else if (3'h4 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_4_predict_taken <= io_din_0_predict_taken; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_4_target_pc <= 64'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h4 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_4_target_pc <= io_din_1_target_pc; // @[FIFO.scala 48:36]
      end else if (3'h4 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_4_target_pc <= io_din_0_target_pc; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_5_illegal <= 1'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h5 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_5_illegal <= io_din_1_illegal; // @[FIFO.scala 48:36]
      end else if (3'h5 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_5_illegal <= io_din_0_illegal; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_5_next_pc <= 3'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h5 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_5_next_pc <= io_din_1_next_pc; // @[FIFO.scala 48:36]
      end else if (3'h5 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_5_next_pc <= io_din_0_next_pc; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_5_alu_mdu_lsu <= 2'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h5 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_5_alu_mdu_lsu <= io_din_1_alu_mdu_lsu; // @[FIFO.scala 48:36]
      end else if (3'h5 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_5_alu_mdu_lsu <= io_din_0_alu_mdu_lsu; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_5_branch_type <= 4'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h5 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_5_branch_type <= io_din_1_branch_type; // @[FIFO.scala 48:36]
      end else if (3'h5 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_5_branch_type <= io_din_0_branch_type; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_5_src_a <= 2'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h5 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_5_src_a <= io_din_1_src_a; // @[FIFO.scala 48:36]
      end else if (3'h5 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_5_src_a <= io_din_0_src_a; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_5_src_b <= 2'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h5 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_5_src_b <= io_din_1_src_b; // @[FIFO.scala 48:36]
      end else if (3'h5 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_5_src_b <= io_din_0_src_b; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_5_write_dest <= 1'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h5 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_5_write_dest <= io_din_1_write_dest; // @[FIFO.scala 48:36]
      end else if (3'h5 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_5_write_dest <= io_din_0_write_dest; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_5_alu_op <= 4'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h5 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_5_alu_op <= io_din_1_alu_op; // @[FIFO.scala 48:36]
      end else if (3'h5 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_5_alu_op <= io_din_0_alu_op; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_5_alu_expand <= 1'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h5 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_5_alu_expand <= io_din_1_alu_expand; // @[FIFO.scala 48:36]
      end else if (3'h5 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_5_alu_expand <= io_din_0_alu_expand; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_5_mem_width <= 3'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h5 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_5_mem_width <= io_din_1_mem_width; // @[FIFO.scala 48:36]
      end else if (3'h5 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_5_mem_width <= io_din_0_mem_width; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_5_write_src <= 2'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h5 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_5_write_src <= io_din_1_write_src; // @[FIFO.scala 48:36]
      end else if (3'h5 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_5_write_src <= io_din_0_write_src; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_5_rs1 <= 5'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h5 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_5_rs1 <= io_din_1_rs1; // @[FIFO.scala 48:36]
      end else if (3'h5 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_5_rs1 <= io_din_0_rs1; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_5_rs2 <= 5'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h5 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_5_rs2 <= io_din_1_rs2; // @[FIFO.scala 48:36]
      end else if (3'h5 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_5_rs2 <= io_din_0_rs2; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_5_rd <= 5'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h5 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_5_rd <= io_din_1_rd; // @[FIFO.scala 48:36]
      end else if (3'h5 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_5_rd <= io_din_0_rd; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_5_imm <= 64'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h5 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_5_imm <= io_din_1_imm; // @[FIFO.scala 48:36]
      end else if (3'h5 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_5_imm <= io_din_0_imm; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_5_pc <= 64'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h5 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_5_pc <= io_din_1_pc; // @[FIFO.scala 48:36]
      end else if (3'h5 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_5_pc <= io_din_0_pc; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_5_predict_taken <= 1'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h5 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_5_predict_taken <= io_din_1_predict_taken; // @[FIFO.scala 48:36]
      end else if (3'h5 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_5_predict_taken <= io_din_0_predict_taken; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_5_target_pc <= 64'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h5 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_5_target_pc <= io_din_1_target_pc; // @[FIFO.scala 48:36]
      end else if (3'h5 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_5_target_pc <= io_din_0_target_pc; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_6_illegal <= 1'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h6 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_6_illegal <= io_din_1_illegal; // @[FIFO.scala 48:36]
      end else if (3'h6 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_6_illegal <= io_din_0_illegal; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_6_next_pc <= 3'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h6 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_6_next_pc <= io_din_1_next_pc; // @[FIFO.scala 48:36]
      end else if (3'h6 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_6_next_pc <= io_din_0_next_pc; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_6_alu_mdu_lsu <= 2'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h6 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_6_alu_mdu_lsu <= io_din_1_alu_mdu_lsu; // @[FIFO.scala 48:36]
      end else if (3'h6 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_6_alu_mdu_lsu <= io_din_0_alu_mdu_lsu; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_6_branch_type <= 4'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h6 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_6_branch_type <= io_din_1_branch_type; // @[FIFO.scala 48:36]
      end else if (3'h6 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_6_branch_type <= io_din_0_branch_type; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_6_src_a <= 2'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h6 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_6_src_a <= io_din_1_src_a; // @[FIFO.scala 48:36]
      end else if (3'h6 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_6_src_a <= io_din_0_src_a; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_6_src_b <= 2'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h6 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_6_src_b <= io_din_1_src_b; // @[FIFO.scala 48:36]
      end else if (3'h6 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_6_src_b <= io_din_0_src_b; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_6_write_dest <= 1'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h6 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_6_write_dest <= io_din_1_write_dest; // @[FIFO.scala 48:36]
      end else if (3'h6 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_6_write_dest <= io_din_0_write_dest; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_6_alu_op <= 4'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h6 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_6_alu_op <= io_din_1_alu_op; // @[FIFO.scala 48:36]
      end else if (3'h6 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_6_alu_op <= io_din_0_alu_op; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_6_alu_expand <= 1'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h6 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_6_alu_expand <= io_din_1_alu_expand; // @[FIFO.scala 48:36]
      end else if (3'h6 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_6_alu_expand <= io_din_0_alu_expand; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_6_mem_width <= 3'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h6 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_6_mem_width <= io_din_1_mem_width; // @[FIFO.scala 48:36]
      end else if (3'h6 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_6_mem_width <= io_din_0_mem_width; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_6_write_src <= 2'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h6 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_6_write_src <= io_din_1_write_src; // @[FIFO.scala 48:36]
      end else if (3'h6 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_6_write_src <= io_din_0_write_src; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_6_rs1 <= 5'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h6 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_6_rs1 <= io_din_1_rs1; // @[FIFO.scala 48:36]
      end else if (3'h6 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_6_rs1 <= io_din_0_rs1; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_6_rs2 <= 5'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h6 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_6_rs2 <= io_din_1_rs2; // @[FIFO.scala 48:36]
      end else if (3'h6 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_6_rs2 <= io_din_0_rs2; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_6_rd <= 5'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h6 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_6_rd <= io_din_1_rd; // @[FIFO.scala 48:36]
      end else if (3'h6 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_6_rd <= io_din_0_rd; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_6_imm <= 64'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h6 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_6_imm <= io_din_1_imm; // @[FIFO.scala 48:36]
      end else if (3'h6 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_6_imm <= io_din_0_imm; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_6_pc <= 64'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h6 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_6_pc <= io_din_1_pc; // @[FIFO.scala 48:36]
      end else if (3'h6 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_6_pc <= io_din_0_pc; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_6_predict_taken <= 1'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h6 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_6_predict_taken <= io_din_1_predict_taken; // @[FIFO.scala 48:36]
      end else if (3'h6 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_6_predict_taken <= io_din_0_predict_taken; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_6_target_pc <= 64'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h6 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_6_target_pc <= io_din_1_target_pc; // @[FIFO.scala 48:36]
      end else if (3'h6 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_6_target_pc <= io_din_0_target_pc; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_7_illegal <= 1'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h7 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_7_illegal <= io_din_1_illegal; // @[FIFO.scala 48:36]
      end else if (3'h7 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_7_illegal <= io_din_0_illegal; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_7_next_pc <= 3'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h7 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_7_next_pc <= io_din_1_next_pc; // @[FIFO.scala 48:36]
      end else if (3'h7 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_7_next_pc <= io_din_0_next_pc; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_7_alu_mdu_lsu <= 2'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h7 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_7_alu_mdu_lsu <= io_din_1_alu_mdu_lsu; // @[FIFO.scala 48:36]
      end else if (3'h7 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_7_alu_mdu_lsu <= io_din_0_alu_mdu_lsu; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_7_branch_type <= 4'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h7 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_7_branch_type <= io_din_1_branch_type; // @[FIFO.scala 48:36]
      end else if (3'h7 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_7_branch_type <= io_din_0_branch_type; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_7_src_a <= 2'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h7 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_7_src_a <= io_din_1_src_a; // @[FIFO.scala 48:36]
      end else if (3'h7 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_7_src_a <= io_din_0_src_a; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_7_src_b <= 2'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h7 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_7_src_b <= io_din_1_src_b; // @[FIFO.scala 48:36]
      end else if (3'h7 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_7_src_b <= io_din_0_src_b; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_7_write_dest <= 1'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h7 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_7_write_dest <= io_din_1_write_dest; // @[FIFO.scala 48:36]
      end else if (3'h7 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_7_write_dest <= io_din_0_write_dest; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_7_alu_op <= 4'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h7 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_7_alu_op <= io_din_1_alu_op; // @[FIFO.scala 48:36]
      end else if (3'h7 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_7_alu_op <= io_din_0_alu_op; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_7_alu_expand <= 1'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h7 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_7_alu_expand <= io_din_1_alu_expand; // @[FIFO.scala 48:36]
      end else if (3'h7 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_7_alu_expand <= io_din_0_alu_expand; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_7_mem_width <= 3'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h7 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_7_mem_width <= io_din_1_mem_width; // @[FIFO.scala 48:36]
      end else if (3'h7 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_7_mem_width <= io_din_0_mem_width; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_7_write_src <= 2'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h7 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_7_write_src <= io_din_1_write_src; // @[FIFO.scala 48:36]
      end else if (3'h7 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_7_write_src <= io_din_0_write_src; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_7_rs1 <= 5'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h7 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_7_rs1 <= io_din_1_rs1; // @[FIFO.scala 48:36]
      end else if (3'h7 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_7_rs1 <= io_din_0_rs1; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_7_rs2 <= 5'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h7 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_7_rs2 <= io_din_1_rs2; // @[FIFO.scala 48:36]
      end else if (3'h7 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_7_rs2 <= io_din_0_rs2; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_7_rd <= 5'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h7 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_7_rd <= io_din_1_rd; // @[FIFO.scala 48:36]
      end else if (3'h7 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_7_rd <= io_din_0_rd; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_7_imm <= 64'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h7 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_7_imm <= io_din_1_imm; // @[FIFO.scala 48:36]
      end else if (3'h7 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_7_imm <= io_din_0_imm; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_7_pc <= 64'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h7 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_7_pc <= io_din_1_pc; // @[FIFO.scala 48:36]
      end else if (3'h7 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_7_pc <= io_din_0_pc; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_7_predict_taken <= 1'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h7 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_7_predict_taken <= io_din_1_predict_taken; // @[FIFO.scala 48:36]
      end else if (3'h7 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_7_predict_taken <= io_din_0_predict_taken; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 21:20]
      mem_7_target_pc <= 64'h0; // @[FIFO.scala 21:20]
    end else if (do_enq) begin // @[FIFO.scala 46:16]
      if (3'h7 == _T_6[2:0]) begin // @[FIFO.scala 48:36]
        mem_7_target_pc <= io_din_1_target_pc; // @[FIFO.scala 48:36]
      end else if (3'h7 == _T_2[2:0]) begin // @[FIFO.scala 48:36]
        mem_7_target_pc <= io_din_0_target_pc; // @[FIFO.scala 48:36]
      end
    end
    if (reset) begin // @[FIFO.scala 31:27]
      maybe_full <= 1'h0; // @[FIFO.scala 31:27]
    end else if (io_flush) begin // @[FIFO.scala 60:18]
      maybe_full <= 1'h0; // @[FIFO.scala 63:16]
    end else if (do_enq != do_deq) begin // @[FIFO.scala 52:27]
      maybe_full <= do_enq; // @[FIFO.scala 53:16]
    end
    if (reset) begin // @[FIFO.scala 24:25]
      enqPtr <= 4'h0; // @[FIFO.scala 24:25]
    end else if (io_flush) begin // @[FIFO.scala 60:18]
      enqPtr <= 4'h0; // @[FIFO.scala 61:12]
    end else if (do_enq) begin // @[FIFO.scala 26:16]
      if (enqPtr_cntNext >= 4'h8) begin // @[FIFO.scala 27:20]
        enqPtr <= _enqPtr_cntReg_T_2;
      end else begin
        enqPtr <= enqPtr_cntNext;
      end
    end
    if (reset) begin // @[FIFO.scala 24:25]
      deqPtr <= 4'h0; // @[FIFO.scala 24:25]
    end else if (io_flush) begin // @[FIFO.scala 60:18]
      deqPtr <= 4'h0; // @[FIFO.scala 62:12]
    end else if (do_deq) begin // @[FIFO.scala 26:16]
      if (deqPtr_cntNext >= 4'h8) begin // @[FIFO.scala 27:20]
        deqPtr <= _deqPtr_cntReg_T_2;
      end else begin
        deqPtr <= deqPtr_cntNext;
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
  mem_0_illegal = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  mem_0_next_pc = _RAND_1[2:0];
  _RAND_2 = {1{`RANDOM}};
  mem_0_alu_mdu_lsu = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  mem_0_branch_type = _RAND_3[3:0];
  _RAND_4 = {1{`RANDOM}};
  mem_0_src_a = _RAND_4[1:0];
  _RAND_5 = {1{`RANDOM}};
  mem_0_src_b = _RAND_5[1:0];
  _RAND_6 = {1{`RANDOM}};
  mem_0_write_dest = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  mem_0_alu_op = _RAND_7[3:0];
  _RAND_8 = {1{`RANDOM}};
  mem_0_alu_expand = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  mem_0_mem_width = _RAND_9[2:0];
  _RAND_10 = {1{`RANDOM}};
  mem_0_write_src = _RAND_10[1:0];
  _RAND_11 = {1{`RANDOM}};
  mem_0_rs1 = _RAND_11[4:0];
  _RAND_12 = {1{`RANDOM}};
  mem_0_rs2 = _RAND_12[4:0];
  _RAND_13 = {1{`RANDOM}};
  mem_0_rd = _RAND_13[4:0];
  _RAND_14 = {2{`RANDOM}};
  mem_0_imm = _RAND_14[63:0];
  _RAND_15 = {2{`RANDOM}};
  mem_0_pc = _RAND_15[63:0];
  _RAND_16 = {1{`RANDOM}};
  mem_0_predict_taken = _RAND_16[0:0];
  _RAND_17 = {2{`RANDOM}};
  mem_0_target_pc = _RAND_17[63:0];
  _RAND_18 = {1{`RANDOM}};
  mem_1_illegal = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  mem_1_next_pc = _RAND_19[2:0];
  _RAND_20 = {1{`RANDOM}};
  mem_1_alu_mdu_lsu = _RAND_20[1:0];
  _RAND_21 = {1{`RANDOM}};
  mem_1_branch_type = _RAND_21[3:0];
  _RAND_22 = {1{`RANDOM}};
  mem_1_src_a = _RAND_22[1:0];
  _RAND_23 = {1{`RANDOM}};
  mem_1_src_b = _RAND_23[1:0];
  _RAND_24 = {1{`RANDOM}};
  mem_1_write_dest = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  mem_1_alu_op = _RAND_25[3:0];
  _RAND_26 = {1{`RANDOM}};
  mem_1_alu_expand = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  mem_1_mem_width = _RAND_27[2:0];
  _RAND_28 = {1{`RANDOM}};
  mem_1_write_src = _RAND_28[1:0];
  _RAND_29 = {1{`RANDOM}};
  mem_1_rs1 = _RAND_29[4:0];
  _RAND_30 = {1{`RANDOM}};
  mem_1_rs2 = _RAND_30[4:0];
  _RAND_31 = {1{`RANDOM}};
  mem_1_rd = _RAND_31[4:0];
  _RAND_32 = {2{`RANDOM}};
  mem_1_imm = _RAND_32[63:0];
  _RAND_33 = {2{`RANDOM}};
  mem_1_pc = _RAND_33[63:0];
  _RAND_34 = {1{`RANDOM}};
  mem_1_predict_taken = _RAND_34[0:0];
  _RAND_35 = {2{`RANDOM}};
  mem_1_target_pc = _RAND_35[63:0];
  _RAND_36 = {1{`RANDOM}};
  mem_2_illegal = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  mem_2_next_pc = _RAND_37[2:0];
  _RAND_38 = {1{`RANDOM}};
  mem_2_alu_mdu_lsu = _RAND_38[1:0];
  _RAND_39 = {1{`RANDOM}};
  mem_2_branch_type = _RAND_39[3:0];
  _RAND_40 = {1{`RANDOM}};
  mem_2_src_a = _RAND_40[1:0];
  _RAND_41 = {1{`RANDOM}};
  mem_2_src_b = _RAND_41[1:0];
  _RAND_42 = {1{`RANDOM}};
  mem_2_write_dest = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  mem_2_alu_op = _RAND_43[3:0];
  _RAND_44 = {1{`RANDOM}};
  mem_2_alu_expand = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  mem_2_mem_width = _RAND_45[2:0];
  _RAND_46 = {1{`RANDOM}};
  mem_2_write_src = _RAND_46[1:0];
  _RAND_47 = {1{`RANDOM}};
  mem_2_rs1 = _RAND_47[4:0];
  _RAND_48 = {1{`RANDOM}};
  mem_2_rs2 = _RAND_48[4:0];
  _RAND_49 = {1{`RANDOM}};
  mem_2_rd = _RAND_49[4:0];
  _RAND_50 = {2{`RANDOM}};
  mem_2_imm = _RAND_50[63:0];
  _RAND_51 = {2{`RANDOM}};
  mem_2_pc = _RAND_51[63:0];
  _RAND_52 = {1{`RANDOM}};
  mem_2_predict_taken = _RAND_52[0:0];
  _RAND_53 = {2{`RANDOM}};
  mem_2_target_pc = _RAND_53[63:0];
  _RAND_54 = {1{`RANDOM}};
  mem_3_illegal = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  mem_3_next_pc = _RAND_55[2:0];
  _RAND_56 = {1{`RANDOM}};
  mem_3_alu_mdu_lsu = _RAND_56[1:0];
  _RAND_57 = {1{`RANDOM}};
  mem_3_branch_type = _RAND_57[3:0];
  _RAND_58 = {1{`RANDOM}};
  mem_3_src_a = _RAND_58[1:0];
  _RAND_59 = {1{`RANDOM}};
  mem_3_src_b = _RAND_59[1:0];
  _RAND_60 = {1{`RANDOM}};
  mem_3_write_dest = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  mem_3_alu_op = _RAND_61[3:0];
  _RAND_62 = {1{`RANDOM}};
  mem_3_alu_expand = _RAND_62[0:0];
  _RAND_63 = {1{`RANDOM}};
  mem_3_mem_width = _RAND_63[2:0];
  _RAND_64 = {1{`RANDOM}};
  mem_3_write_src = _RAND_64[1:0];
  _RAND_65 = {1{`RANDOM}};
  mem_3_rs1 = _RAND_65[4:0];
  _RAND_66 = {1{`RANDOM}};
  mem_3_rs2 = _RAND_66[4:0];
  _RAND_67 = {1{`RANDOM}};
  mem_3_rd = _RAND_67[4:0];
  _RAND_68 = {2{`RANDOM}};
  mem_3_imm = _RAND_68[63:0];
  _RAND_69 = {2{`RANDOM}};
  mem_3_pc = _RAND_69[63:0];
  _RAND_70 = {1{`RANDOM}};
  mem_3_predict_taken = _RAND_70[0:0];
  _RAND_71 = {2{`RANDOM}};
  mem_3_target_pc = _RAND_71[63:0];
  _RAND_72 = {1{`RANDOM}};
  mem_4_illegal = _RAND_72[0:0];
  _RAND_73 = {1{`RANDOM}};
  mem_4_next_pc = _RAND_73[2:0];
  _RAND_74 = {1{`RANDOM}};
  mem_4_alu_mdu_lsu = _RAND_74[1:0];
  _RAND_75 = {1{`RANDOM}};
  mem_4_branch_type = _RAND_75[3:0];
  _RAND_76 = {1{`RANDOM}};
  mem_4_src_a = _RAND_76[1:0];
  _RAND_77 = {1{`RANDOM}};
  mem_4_src_b = _RAND_77[1:0];
  _RAND_78 = {1{`RANDOM}};
  mem_4_write_dest = _RAND_78[0:0];
  _RAND_79 = {1{`RANDOM}};
  mem_4_alu_op = _RAND_79[3:0];
  _RAND_80 = {1{`RANDOM}};
  mem_4_alu_expand = _RAND_80[0:0];
  _RAND_81 = {1{`RANDOM}};
  mem_4_mem_width = _RAND_81[2:0];
  _RAND_82 = {1{`RANDOM}};
  mem_4_write_src = _RAND_82[1:0];
  _RAND_83 = {1{`RANDOM}};
  mem_4_rs1 = _RAND_83[4:0];
  _RAND_84 = {1{`RANDOM}};
  mem_4_rs2 = _RAND_84[4:0];
  _RAND_85 = {1{`RANDOM}};
  mem_4_rd = _RAND_85[4:0];
  _RAND_86 = {2{`RANDOM}};
  mem_4_imm = _RAND_86[63:0];
  _RAND_87 = {2{`RANDOM}};
  mem_4_pc = _RAND_87[63:0];
  _RAND_88 = {1{`RANDOM}};
  mem_4_predict_taken = _RAND_88[0:0];
  _RAND_89 = {2{`RANDOM}};
  mem_4_target_pc = _RAND_89[63:0];
  _RAND_90 = {1{`RANDOM}};
  mem_5_illegal = _RAND_90[0:0];
  _RAND_91 = {1{`RANDOM}};
  mem_5_next_pc = _RAND_91[2:0];
  _RAND_92 = {1{`RANDOM}};
  mem_5_alu_mdu_lsu = _RAND_92[1:0];
  _RAND_93 = {1{`RANDOM}};
  mem_5_branch_type = _RAND_93[3:0];
  _RAND_94 = {1{`RANDOM}};
  mem_5_src_a = _RAND_94[1:0];
  _RAND_95 = {1{`RANDOM}};
  mem_5_src_b = _RAND_95[1:0];
  _RAND_96 = {1{`RANDOM}};
  mem_5_write_dest = _RAND_96[0:0];
  _RAND_97 = {1{`RANDOM}};
  mem_5_alu_op = _RAND_97[3:0];
  _RAND_98 = {1{`RANDOM}};
  mem_5_alu_expand = _RAND_98[0:0];
  _RAND_99 = {1{`RANDOM}};
  mem_5_mem_width = _RAND_99[2:0];
  _RAND_100 = {1{`RANDOM}};
  mem_5_write_src = _RAND_100[1:0];
  _RAND_101 = {1{`RANDOM}};
  mem_5_rs1 = _RAND_101[4:0];
  _RAND_102 = {1{`RANDOM}};
  mem_5_rs2 = _RAND_102[4:0];
  _RAND_103 = {1{`RANDOM}};
  mem_5_rd = _RAND_103[4:0];
  _RAND_104 = {2{`RANDOM}};
  mem_5_imm = _RAND_104[63:0];
  _RAND_105 = {2{`RANDOM}};
  mem_5_pc = _RAND_105[63:0];
  _RAND_106 = {1{`RANDOM}};
  mem_5_predict_taken = _RAND_106[0:0];
  _RAND_107 = {2{`RANDOM}};
  mem_5_target_pc = _RAND_107[63:0];
  _RAND_108 = {1{`RANDOM}};
  mem_6_illegal = _RAND_108[0:0];
  _RAND_109 = {1{`RANDOM}};
  mem_6_next_pc = _RAND_109[2:0];
  _RAND_110 = {1{`RANDOM}};
  mem_6_alu_mdu_lsu = _RAND_110[1:0];
  _RAND_111 = {1{`RANDOM}};
  mem_6_branch_type = _RAND_111[3:0];
  _RAND_112 = {1{`RANDOM}};
  mem_6_src_a = _RAND_112[1:0];
  _RAND_113 = {1{`RANDOM}};
  mem_6_src_b = _RAND_113[1:0];
  _RAND_114 = {1{`RANDOM}};
  mem_6_write_dest = _RAND_114[0:0];
  _RAND_115 = {1{`RANDOM}};
  mem_6_alu_op = _RAND_115[3:0];
  _RAND_116 = {1{`RANDOM}};
  mem_6_alu_expand = _RAND_116[0:0];
  _RAND_117 = {1{`RANDOM}};
  mem_6_mem_width = _RAND_117[2:0];
  _RAND_118 = {1{`RANDOM}};
  mem_6_write_src = _RAND_118[1:0];
  _RAND_119 = {1{`RANDOM}};
  mem_6_rs1 = _RAND_119[4:0];
  _RAND_120 = {1{`RANDOM}};
  mem_6_rs2 = _RAND_120[4:0];
  _RAND_121 = {1{`RANDOM}};
  mem_6_rd = _RAND_121[4:0];
  _RAND_122 = {2{`RANDOM}};
  mem_6_imm = _RAND_122[63:0];
  _RAND_123 = {2{`RANDOM}};
  mem_6_pc = _RAND_123[63:0];
  _RAND_124 = {1{`RANDOM}};
  mem_6_predict_taken = _RAND_124[0:0];
  _RAND_125 = {2{`RANDOM}};
  mem_6_target_pc = _RAND_125[63:0];
  _RAND_126 = {1{`RANDOM}};
  mem_7_illegal = _RAND_126[0:0];
  _RAND_127 = {1{`RANDOM}};
  mem_7_next_pc = _RAND_127[2:0];
  _RAND_128 = {1{`RANDOM}};
  mem_7_alu_mdu_lsu = _RAND_128[1:0];
  _RAND_129 = {1{`RANDOM}};
  mem_7_branch_type = _RAND_129[3:0];
  _RAND_130 = {1{`RANDOM}};
  mem_7_src_a = _RAND_130[1:0];
  _RAND_131 = {1{`RANDOM}};
  mem_7_src_b = _RAND_131[1:0];
  _RAND_132 = {1{`RANDOM}};
  mem_7_write_dest = _RAND_132[0:0];
  _RAND_133 = {1{`RANDOM}};
  mem_7_alu_op = _RAND_133[3:0];
  _RAND_134 = {1{`RANDOM}};
  mem_7_alu_expand = _RAND_134[0:0];
  _RAND_135 = {1{`RANDOM}};
  mem_7_mem_width = _RAND_135[2:0];
  _RAND_136 = {1{`RANDOM}};
  mem_7_write_src = _RAND_136[1:0];
  _RAND_137 = {1{`RANDOM}};
  mem_7_rs1 = _RAND_137[4:0];
  _RAND_138 = {1{`RANDOM}};
  mem_7_rs2 = _RAND_138[4:0];
  _RAND_139 = {1{`RANDOM}};
  mem_7_rd = _RAND_139[4:0];
  _RAND_140 = {2{`RANDOM}};
  mem_7_imm = _RAND_140[63:0];
  _RAND_141 = {2{`RANDOM}};
  mem_7_pc = _RAND_141[63:0];
  _RAND_142 = {1{`RANDOM}};
  mem_7_predict_taken = _RAND_142[0:0];
  _RAND_143 = {2{`RANDOM}};
  mem_7_target_pc = _RAND_143[63:0];
  _RAND_144 = {1{`RANDOM}};
  maybe_full = _RAND_144[0:0];
  _RAND_145 = {1{`RANDOM}};
  enqPtr = _RAND_145[3:0];
  _RAND_146 = {1{`RANDOM}};
  deqPtr = _RAND_146[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210134_IssueArbiter(
  input         io_insts_in_0_illegal,
  input  [2:0]  io_insts_in_0_next_pc,
  input  [1:0]  io_insts_in_0_alu_mdu_lsu,
  input  [3:0]  io_insts_in_0_branch_type,
  input  [1:0]  io_insts_in_0_src_a,
  input  [1:0]  io_insts_in_0_src_b,
  input         io_insts_in_0_write_dest,
  input  [3:0]  io_insts_in_0_alu_op,
  input         io_insts_in_0_alu_expand,
  input  [2:0]  io_insts_in_0_mem_width,
  input  [1:0]  io_insts_in_0_write_src,
  input  [4:0]  io_insts_in_0_rs1,
  input  [4:0]  io_insts_in_0_rs2,
  input  [4:0]  io_insts_in_0_rd,
  input  [63:0] io_insts_in_0_imm,
  input  [63:0] io_insts_in_0_pc,
  input         io_insts_in_0_predict_taken,
  input  [63:0] io_insts_in_0_target_pc,
  input         io_insts_in_1_illegal,
  input  [2:0]  io_insts_in_1_next_pc,
  input  [1:0]  io_insts_in_1_alu_mdu_lsu,
  input  [3:0]  io_insts_in_1_branch_type,
  input  [1:0]  io_insts_in_1_src_a,
  input  [1:0]  io_insts_in_1_src_b,
  input         io_insts_in_1_write_dest,
  input  [3:0]  io_insts_in_1_alu_op,
  input         io_insts_in_1_alu_expand,
  input  [2:0]  io_insts_in_1_mem_width,
  input  [1:0]  io_insts_in_1_write_src,
  input  [4:0]  io_insts_in_1_rs1,
  input  [4:0]  io_insts_in_1_rs2,
  input  [4:0]  io_insts_in_1_rd,
  input  [63:0] io_insts_in_1_imm,
  input  [63:0] io_insts_in_1_pc,
  input         io_insts_in_1_predict_taken,
  input  [63:0] io_insts_in_1_target_pc,
  input  [3:0]  io_queue_items,
  input  [4:0]  io_ld_dest_ex,
  input  [63:0] io_rss_in_0,
  input  [63:0] io_rss_in_1,
  input  [63:0] io_rts_in_0,
  input  [63:0] io_rts_in_1,
  output [63:0] io_rss_out_0,
  output [63:0] io_rss_out_1,
  output [63:0] io_rss_out_2,
  output [63:0] io_rts_out_0,
  output [63:0] io_rts_out_1,
  output [63:0] io_rts_out_2,
  input         io_csr_ex,
  input         io_mmio_ex,
  output        io_insts_out_0_illegal,
  output [2:0]  io_insts_out_0_next_pc,
  output [1:0]  io_insts_out_0_alu_mdu_lsu,
  output [3:0]  io_insts_out_0_branch_type,
  output [1:0]  io_insts_out_0_src_a,
  output [1:0]  io_insts_out_0_src_b,
  output        io_insts_out_0_write_dest,
  output [3:0]  io_insts_out_0_alu_op,
  output        io_insts_out_0_alu_expand,
  output [1:0]  io_insts_out_0_write_src,
  output [4:0]  io_insts_out_0_rs1,
  output [4:0]  io_insts_out_0_rd,
  output [63:0] io_insts_out_0_imm,
  output [63:0] io_insts_out_0_pc,
  output        io_insts_out_0_predict_taken,
  output [63:0] io_insts_out_0_target_pc,
  output [1:0]  io_insts_out_1_src_a,
  output [1:0]  io_insts_out_1_src_b,
  output        io_insts_out_1_write_dest,
  output [3:0]  io_insts_out_1_alu_op,
  output        io_insts_out_1_alu_expand,
  output [4:0]  io_insts_out_1_rd,
  output [63:0] io_insts_out_1_imm,
  output [63:0] io_insts_out_1_pc,
  output        io_insts_out_2_write_dest,
  output [2:0]  io_insts_out_2_mem_width,
  output [4:0]  io_insts_out_2_rd,
  output [63:0] io_insts_out_2_imm,
  output [63:0] io_insts_out_2_pc,
  output [1:0]  io_issue_num,
  output        io_issue_fu_valid_0,
  output        io_issue_fu_valid_1,
  output        io_issue_fu_valid_2,
  output [1:0]  io_insts_order_0,
  output [1:0]  io_insts_order_1,
  output [1:0]  io_insts_order_2
);
  wire  _T_1 = io_csr_ex | io_mmio_ex; // @[IssueArbiter.scala 75:92]
  wire  _T_12 = (io_ld_dest_ex == 5'h0 | io_insts_in_0_rs1 != io_ld_dest_ex & io_insts_in_0_rs2 != io_ld_dest_ex) & (~
    _T_1 | io_insts_in_0_src_b != 2'h2 & io_insts_in_0_alu_mdu_lsu != 2'h2); // @[IssueArbiter.scala 40:66]
  wire  issue_valid_0 = io_queue_items > 4'h0 & _T_12; // @[IssueArbiter.scala 75:29]
  wire  _T_15 = io_insts_in_0_rd != 5'h0; // @[IssueArbiter.scala 32:14]
  wire  _T_19 = io_insts_in_0_rd != 5'h0 & (io_insts_in_0_rd == io_insts_in_1_rs1 | io_insts_in_0_rd ==
    io_insts_in_1_rs2); // @[IssueArbiter.scala 32:22]
  wire  _T_22 = _T_15 & io_insts_in_0_rd == io_insts_in_1_rd; // @[IssueArbiter.scala 28:22]
  wire  _T_23 = _T_19 | _T_22; // @[IssueArbiter.scala 36:25]
  wire  _T_26 = io_insts_in_0_alu_mdu_lsu == 2'h3; // @[IssueArbiter.scala 47:29]
  wire  _T_27 = io_insts_in_1_alu_mdu_lsu == 2'h3; // @[IssueArbiter.scala 47:62]
  wire  _T_28 = io_insts_in_0_alu_mdu_lsu == 2'h3 & io_insts_in_1_alu_mdu_lsu == 2'h3; // @[IssueArbiter.scala 47:41]
  wire  _T_29 = io_insts_in_0_alu_mdu_lsu != io_insts_in_1_alu_mdu_lsu | _T_28; // @[IssueArbiter.scala 46:48]
  wire  _T_30 = ~_T_23 & _T_29; // @[IssueArbiter.scala 45:33]
  wire  _T_31 = io_insts_in_0_alu_mdu_lsu != 2'h0; // @[IssueArbiter.scala 48:25]
  wire  _T_32 = _T_30 & _T_31; // @[IssueArbiter.scala 47:75]
  wire  _T_36 = ~(io_insts_in_0_alu_mdu_lsu == 2'h2 & io_insts_in_1_alu_mdu_lsu == 2'h0); // @[IssueArbiter.scala 50:7]
  wire  _T_37 = _T_32 & _T_36; // @[IssueArbiter.scala 48:37]
  wire  _T_50 = (io_ld_dest_ex == 5'h0 | io_insts_in_1_rs1 != io_ld_dest_ex & io_insts_in_1_rs2 != io_ld_dest_ex) & (~
    _T_1 | io_insts_in_1_src_b != 2'h2 & io_insts_in_1_alu_mdu_lsu != 2'h2); // @[IssueArbiter.scala 40:66]
  wire  _T_51 = io_queue_items > 4'h1 & _T_37 & _T_50; // @[IssueArbiter.scala 78:79]
  wire [1:0] _GEN_1 = _T_51 ? 2'h2 : 2'h1; // @[IssueArbiter.scala 79:83 IssueArbiter.scala 82:20 IssueArbiter.scala 77:18]
  wire  issue_valid_1 = issue_valid_0 & _T_51; // @[IssueArbiter.scala 75:108]
  wire  _T_52 = 2'h0 == io_insts_in_0_alu_mdu_lsu; // @[Conditional.scala 37:30]
  wire  _T_53 = 2'h1 == io_insts_in_0_alu_mdu_lsu; // @[Conditional.scala 37:30]
  wire  _T_54 = 2'h2 == io_insts_in_0_alu_mdu_lsu; // @[Conditional.scala 37:30]
  wire [63:0] _GEN_7 = _T_54 ? io_insts_in_0_pc : 64'h0; // @[Conditional.scala 39:67 IssueArbiter.scala 126:27 IssueArbiter.scala 100:21]
  wire [63:0] _GEN_8 = _T_54 ? io_insts_in_0_imm : 64'h0; // @[Conditional.scala 39:67 IssueArbiter.scala 126:27 IssueArbiter.scala 100:21]
  wire [4:0] _GEN_9 = _T_54 ? io_insts_in_0_rd : 5'h0; // @[Conditional.scala 39:67 IssueArbiter.scala 126:27 IssueArbiter.scala 100:21]
  wire [2:0] _GEN_13 = _T_54 ? io_insts_in_0_mem_width : 3'h0; // @[Conditional.scala 39:67 IssueArbiter.scala 126:27 IssueArbiter.scala 100:21]
  wire  _GEN_16 = _T_54 & io_insts_in_0_write_dest; // @[Conditional.scala 39:67 IssueArbiter.scala 126:27 IssueArbiter.scala 100:21]
  wire [63:0] _GEN_23 = _T_54 ? io_rss_in_0 : 64'h0; // @[Conditional.scala 39:67 IssueArbiter.scala 127:25 IssueArbiter.scala 101:19]
  wire [63:0] _GEN_24 = _T_54 ? io_rts_in_0 : 64'h0; // @[Conditional.scala 39:67 IssueArbiter.scala 128:25 IssueArbiter.scala 102:19]
  wire [63:0] _GEN_29 = _T_53 ? io_insts_in_0_pc : 64'h0; // @[Conditional.scala 39:67 IssueArbiter.scala 118:27 IssueArbiter.scala 100:21]
  wire [63:0] _GEN_30 = _T_53 ? io_insts_in_0_imm : 64'h0; // @[Conditional.scala 39:67 IssueArbiter.scala 118:27 IssueArbiter.scala 100:21]
  wire [4:0] _GEN_31 = _T_53 ? io_insts_in_0_rd : 5'h0; // @[Conditional.scala 39:67 IssueArbiter.scala 118:27 IssueArbiter.scala 100:21]
  wire  _GEN_36 = _T_53 & io_insts_in_0_alu_expand; // @[Conditional.scala 39:67 IssueArbiter.scala 118:27 IssueArbiter.scala 100:21]
  wire [3:0] _GEN_37 = _T_53 ? io_insts_in_0_alu_op : 4'h0; // @[Conditional.scala 39:67 IssueArbiter.scala 118:27 IssueArbiter.scala 100:21]
  wire  _GEN_38 = _T_53 & io_insts_in_0_write_dest; // @[Conditional.scala 39:67 IssueArbiter.scala 118:27 IssueArbiter.scala 100:21]
  wire [1:0] _GEN_39 = _T_53 ? io_insts_in_0_src_b : 2'h0; // @[Conditional.scala 39:67 IssueArbiter.scala 118:27 IssueArbiter.scala 100:21]
  wire [1:0] _GEN_40 = _T_53 ? io_insts_in_0_src_a : 2'h0; // @[Conditional.scala 39:67 IssueArbiter.scala 118:27 IssueArbiter.scala 100:21]
  wire [63:0] _GEN_45 = _T_53 ? io_rss_in_0 : 64'h0; // @[Conditional.scala 39:67 IssueArbiter.scala 119:25 IssueArbiter.scala 101:19]
  wire [63:0] _GEN_46 = _T_53 ? io_rts_in_0 : 64'h0; // @[Conditional.scala 39:67 IssueArbiter.scala 120:25 IssueArbiter.scala 102:19]
  wire [63:0] _GEN_51 = _T_53 ? 64'h0 : _GEN_7; // @[Conditional.scala 39:67 IssueArbiter.scala 100:21]
  wire [63:0] _GEN_52 = _T_53 ? 64'h0 : _GEN_8; // @[Conditional.scala 39:67 IssueArbiter.scala 100:21]
  wire [4:0] _GEN_53 = _T_53 ? 5'h0 : _GEN_9; // @[Conditional.scala 39:67 IssueArbiter.scala 100:21]
  wire [2:0] _GEN_57 = _T_53 ? 3'h0 : _GEN_13; // @[Conditional.scala 39:67 IssueArbiter.scala 100:21]
  wire  _GEN_60 = _T_53 ? 1'h0 : _GEN_16; // @[Conditional.scala 39:67 IssueArbiter.scala 100:21]
  wire [63:0] _GEN_67 = _T_53 ? 64'h0 : _GEN_23; // @[Conditional.scala 39:67 IssueArbiter.scala 101:19]
  wire [63:0] _GEN_68 = _T_53 ? 64'h0 : _GEN_24; // @[Conditional.scala 39:67 IssueArbiter.scala 102:19]
  wire  _GEN_70 = _T_53 ? 1'h0 : _T_54; // @[Conditional.scala 39:67 IssueArbiter.scala 104:26]
  wire [63:0] _GEN_71 = _T_52 ? io_insts_in_0_target_pc : 64'h0; // @[Conditional.scala 40:58 IssueArbiter.scala 110:27 IssueArbiter.scala 100:21]
  wire  _GEN_72 = _T_52 & io_insts_in_0_predict_taken; // @[Conditional.scala 40:58 IssueArbiter.scala 110:27 IssueArbiter.scala 100:21]
  wire [63:0] _GEN_73 = _T_52 ? io_insts_in_0_pc : 64'h0; // @[Conditional.scala 40:58 IssueArbiter.scala 110:27 IssueArbiter.scala 100:21]
  wire [63:0] _GEN_74 = _T_52 ? io_insts_in_0_imm : 64'h0; // @[Conditional.scala 40:58 IssueArbiter.scala 110:27 IssueArbiter.scala 100:21]
  wire [4:0] _GEN_75 = _T_52 ? io_insts_in_0_rd : 5'h0; // @[Conditional.scala 40:58 IssueArbiter.scala 110:27 IssueArbiter.scala 100:21]
  wire [4:0] _GEN_77 = _T_52 ? io_insts_in_0_rs1 : 5'h0; // @[Conditional.scala 40:58 IssueArbiter.scala 110:27 IssueArbiter.scala 100:21]
  wire [1:0] _GEN_78 = _T_52 ? io_insts_in_0_write_src : 2'h0; // @[Conditional.scala 40:58 IssueArbiter.scala 110:27 IssueArbiter.scala 100:21]
  wire  _GEN_80 = _T_52 & io_insts_in_0_alu_expand; // @[Conditional.scala 40:58 IssueArbiter.scala 110:27 IssueArbiter.scala 100:21]
  wire [3:0] _GEN_81 = _T_52 ? io_insts_in_0_alu_op : 4'h0; // @[Conditional.scala 40:58 IssueArbiter.scala 110:27 IssueArbiter.scala 100:21]
  wire  _GEN_82 = _T_52 & io_insts_in_0_write_dest; // @[Conditional.scala 40:58 IssueArbiter.scala 110:27 IssueArbiter.scala 100:21]
  wire [1:0] _GEN_83 = _T_52 ? io_insts_in_0_src_b : 2'h0; // @[Conditional.scala 40:58 IssueArbiter.scala 110:27 IssueArbiter.scala 100:21]
  wire [1:0] _GEN_84 = _T_52 ? io_insts_in_0_src_a : 2'h0; // @[Conditional.scala 40:58 IssueArbiter.scala 110:27 IssueArbiter.scala 100:21]
  wire [3:0] _GEN_85 = _T_52 ? io_insts_in_0_branch_type : 4'h0; // @[Conditional.scala 40:58 IssueArbiter.scala 110:27 IssueArbiter.scala 100:21]
  wire [1:0] _GEN_86 = _T_52 ? io_insts_in_0_alu_mdu_lsu : 2'h0; // @[Conditional.scala 40:58 IssueArbiter.scala 110:27 IssueArbiter.scala 100:21]
  wire [2:0] _GEN_87 = _T_52 ? io_insts_in_0_next_pc : 3'h0; // @[Conditional.scala 40:58 IssueArbiter.scala 110:27 IssueArbiter.scala 100:21]
  wire  _GEN_88 = _T_52 & io_insts_in_0_illegal; // @[Conditional.scala 40:58 IssueArbiter.scala 110:27 IssueArbiter.scala 100:21]
  wire [63:0] _GEN_89 = _T_52 ? io_rss_in_0 : 64'h0; // @[Conditional.scala 40:58 IssueArbiter.scala 111:25 IssueArbiter.scala 101:19]
  wire [63:0] _GEN_90 = _T_52 ? io_rts_in_0 : 64'h0; // @[Conditional.scala 40:58 IssueArbiter.scala 112:25 IssueArbiter.scala 102:19]
  wire [63:0] _GEN_95 = _T_52 ? 64'h0 : _GEN_29; // @[Conditional.scala 40:58 IssueArbiter.scala 100:21]
  wire [63:0] _GEN_96 = _T_52 ? 64'h0 : _GEN_30; // @[Conditional.scala 40:58 IssueArbiter.scala 100:21]
  wire [4:0] _GEN_97 = _T_52 ? 5'h0 : _GEN_31; // @[Conditional.scala 40:58 IssueArbiter.scala 100:21]
  wire  _GEN_102 = _T_52 ? 1'h0 : _GEN_36; // @[Conditional.scala 40:58 IssueArbiter.scala 100:21]
  wire [3:0] _GEN_103 = _T_52 ? 4'h0 : _GEN_37; // @[Conditional.scala 40:58 IssueArbiter.scala 100:21]
  wire  _GEN_104 = _T_52 ? 1'h0 : _GEN_38; // @[Conditional.scala 40:58 IssueArbiter.scala 100:21]
  wire [1:0] _GEN_105 = _T_52 ? 2'h0 : _GEN_39; // @[Conditional.scala 40:58 IssueArbiter.scala 100:21]
  wire [1:0] _GEN_106 = _T_52 ? 2'h0 : _GEN_40; // @[Conditional.scala 40:58 IssueArbiter.scala 100:21]
  wire [63:0] _GEN_111 = _T_52 ? 64'h0 : _GEN_45; // @[Conditional.scala 40:58 IssueArbiter.scala 101:19]
  wire [63:0] _GEN_112 = _T_52 ? 64'h0 : _GEN_46; // @[Conditional.scala 40:58 IssueArbiter.scala 102:19]
  wire  _GEN_114 = _T_52 ? 1'h0 : _T_53; // @[Conditional.scala 40:58 IssueArbiter.scala 104:26]
  wire [63:0] _GEN_117 = _T_52 ? 64'h0 : _GEN_51; // @[Conditional.scala 40:58 IssueArbiter.scala 100:21]
  wire [63:0] _GEN_118 = _T_52 ? 64'h0 : _GEN_52; // @[Conditional.scala 40:58 IssueArbiter.scala 100:21]
  wire [4:0] _GEN_119 = _T_52 ? 5'h0 : _GEN_53; // @[Conditional.scala 40:58 IssueArbiter.scala 100:21]
  wire [2:0] _GEN_123 = _T_52 ? 3'h0 : _GEN_57; // @[Conditional.scala 40:58 IssueArbiter.scala 100:21]
  wire  _GEN_126 = _T_52 ? 1'h0 : _GEN_60; // @[Conditional.scala 40:58 IssueArbiter.scala 100:21]
  wire [63:0] _GEN_133 = _T_52 ? 64'h0 : _GEN_67; // @[Conditional.scala 40:58 IssueArbiter.scala 101:19]
  wire [63:0] _GEN_134 = _T_52 ? 64'h0 : _GEN_68; // @[Conditional.scala 40:58 IssueArbiter.scala 102:19]
  wire  _GEN_136 = _T_52 ? 1'h0 : _GEN_70; // @[Conditional.scala 40:58 IssueArbiter.scala 104:26]
  wire [63:0] _GEN_137 = issue_valid_0 ? _GEN_71 : 64'h0; // @[IssueArbiter.scala 107:26 IssueArbiter.scala 100:21]
  wire  _GEN_138 = issue_valid_0 & _GEN_72; // @[IssueArbiter.scala 107:26 IssueArbiter.scala 100:21]
  wire [63:0] _GEN_139 = issue_valid_0 ? _GEN_73 : 64'h0; // @[IssueArbiter.scala 107:26 IssueArbiter.scala 100:21]
  wire [63:0] _GEN_140 = issue_valid_0 ? _GEN_74 : 64'h0; // @[IssueArbiter.scala 107:26 IssueArbiter.scala 100:21]
  wire [4:0] _GEN_141 = issue_valid_0 ? _GEN_75 : 5'h0; // @[IssueArbiter.scala 107:26 IssueArbiter.scala 100:21]
  wire [4:0] _GEN_143 = issue_valid_0 ? _GEN_77 : 5'h0; // @[IssueArbiter.scala 107:26 IssueArbiter.scala 100:21]
  wire [1:0] _GEN_144 = issue_valid_0 ? _GEN_78 : 2'h0; // @[IssueArbiter.scala 107:26 IssueArbiter.scala 100:21]
  wire  _GEN_146 = issue_valid_0 & _GEN_80; // @[IssueArbiter.scala 107:26 IssueArbiter.scala 100:21]
  wire [3:0] _GEN_147 = issue_valid_0 ? _GEN_81 : 4'h0; // @[IssueArbiter.scala 107:26 IssueArbiter.scala 100:21]
  wire  _GEN_148 = issue_valid_0 & _GEN_82; // @[IssueArbiter.scala 107:26 IssueArbiter.scala 100:21]
  wire [1:0] _GEN_149 = issue_valid_0 ? _GEN_83 : 2'h0; // @[IssueArbiter.scala 107:26 IssueArbiter.scala 100:21]
  wire [1:0] _GEN_150 = issue_valid_0 ? _GEN_84 : 2'h0; // @[IssueArbiter.scala 107:26 IssueArbiter.scala 100:21]
  wire [3:0] _GEN_151 = issue_valid_0 ? _GEN_85 : 4'h0; // @[IssueArbiter.scala 107:26 IssueArbiter.scala 100:21]
  wire [1:0] _GEN_152 = issue_valid_0 ? _GEN_86 : 2'h0; // @[IssueArbiter.scala 107:26 IssueArbiter.scala 100:21]
  wire [2:0] _GEN_153 = issue_valid_0 ? _GEN_87 : 3'h0; // @[IssueArbiter.scala 107:26 IssueArbiter.scala 100:21]
  wire  _GEN_154 = issue_valid_0 & _GEN_88; // @[IssueArbiter.scala 107:26 IssueArbiter.scala 100:21]
  wire [63:0] _GEN_155 = issue_valid_0 ? _GEN_89 : 64'h0; // @[IssueArbiter.scala 107:26 IssueArbiter.scala 101:19]
  wire [63:0] _GEN_156 = issue_valid_0 ? _GEN_90 : 64'h0; // @[IssueArbiter.scala 107:26 IssueArbiter.scala 102:19]
  wire  _GEN_158 = issue_valid_0 & _T_52; // @[IssueArbiter.scala 107:26 IssueArbiter.scala 104:26]
  wire [63:0] _GEN_161 = issue_valid_0 ? _GEN_95 : 64'h0; // @[IssueArbiter.scala 107:26 IssueArbiter.scala 100:21]
  wire [63:0] _GEN_162 = issue_valid_0 ? _GEN_96 : 64'h0; // @[IssueArbiter.scala 107:26 IssueArbiter.scala 100:21]
  wire [4:0] _GEN_163 = issue_valid_0 ? _GEN_97 : 5'h0; // @[IssueArbiter.scala 107:26 IssueArbiter.scala 100:21]
  wire  _GEN_168 = issue_valid_0 & _GEN_102; // @[IssueArbiter.scala 107:26 IssueArbiter.scala 100:21]
  wire [3:0] _GEN_169 = issue_valid_0 ? _GEN_103 : 4'h0; // @[IssueArbiter.scala 107:26 IssueArbiter.scala 100:21]
  wire  _GEN_170 = issue_valid_0 & _GEN_104; // @[IssueArbiter.scala 107:26 IssueArbiter.scala 100:21]
  wire [1:0] _GEN_171 = issue_valid_0 ? _GEN_105 : 2'h0; // @[IssueArbiter.scala 107:26 IssueArbiter.scala 100:21]
  wire [1:0] _GEN_172 = issue_valid_0 ? _GEN_106 : 2'h0; // @[IssueArbiter.scala 107:26 IssueArbiter.scala 100:21]
  wire [63:0] _GEN_177 = issue_valid_0 ? _GEN_111 : 64'h0; // @[IssueArbiter.scala 107:26 IssueArbiter.scala 101:19]
  wire [63:0] _GEN_178 = issue_valid_0 ? _GEN_112 : 64'h0; // @[IssueArbiter.scala 107:26 IssueArbiter.scala 102:19]
  wire  _GEN_180 = issue_valid_0 & _GEN_114; // @[IssueArbiter.scala 107:26 IssueArbiter.scala 104:26]
  wire [63:0] _GEN_183 = issue_valid_0 ? _GEN_117 : 64'h0; // @[IssueArbiter.scala 107:26 IssueArbiter.scala 100:21]
  wire [63:0] _GEN_184 = issue_valid_0 ? _GEN_118 : 64'h0; // @[IssueArbiter.scala 107:26 IssueArbiter.scala 100:21]
  wire [4:0] _GEN_185 = issue_valid_0 ? _GEN_119 : 5'h0; // @[IssueArbiter.scala 107:26 IssueArbiter.scala 100:21]
  wire [2:0] _GEN_189 = issue_valid_0 ? _GEN_123 : 3'h0; // @[IssueArbiter.scala 107:26 IssueArbiter.scala 100:21]
  wire  _GEN_192 = issue_valid_0 & _GEN_126; // @[IssueArbiter.scala 107:26 IssueArbiter.scala 100:21]
  wire [63:0] _GEN_199 = issue_valid_0 ? _GEN_133 : 64'h0; // @[IssueArbiter.scala 107:26 IssueArbiter.scala 101:19]
  wire [63:0] _GEN_200 = issue_valid_0 ? _GEN_134 : 64'h0; // @[IssueArbiter.scala 107:26 IssueArbiter.scala 102:19]
  wire  _GEN_202 = issue_valid_0 & _GEN_136; // @[IssueArbiter.scala 107:26 IssueArbiter.scala 104:26]
  wire  _T_63 = 2'h0 == io_insts_in_1_alu_mdu_lsu; // @[Conditional.scala 37:30]
  wire  _GEN_512 = _T_63 | _GEN_158; // @[Conditional.scala 40:58 IssueArbiter.scala 115:22]
  wire  alu_occupy = issue_valid_1 ? _GEN_512 : _GEN_158; // @[IssueArbiter.scala 107:26]
  wire  _T_57 = ~alu_occupy; // @[IssueArbiter.scala 137:14]
  wire  _T_64 = 2'h1 == io_insts_in_1_alu_mdu_lsu; // @[Conditional.scala 37:30]
  wire  _GEN_467 = _T_64 | _GEN_180; // @[Conditional.scala 39:67 IssueArbiter.scala 123:22]
  wire  _GEN_535 = _T_63 ? _GEN_180 : _GEN_467; // @[Conditional.scala 40:58]
  wire  mdu_occupy = issue_valid_1 ? _GEN_535 : _GEN_180; // @[IssueArbiter.scala 107:26]
  wire  _T_58 = ~mdu_occupy; // @[IssueArbiter.scala 143:21]
  wire [63:0] _GEN_205 = ~mdu_occupy ? io_insts_in_0_pc : _GEN_161; // @[IssueArbiter.scala 143:34 IssueArbiter.scala 144:27]
  wire [63:0] _GEN_206 = ~mdu_occupy ? io_insts_in_0_imm : _GEN_162; // @[IssueArbiter.scala 143:34 IssueArbiter.scala 144:27]
  wire [4:0] _GEN_207 = ~mdu_occupy ? io_insts_in_0_rd : _GEN_163; // @[IssueArbiter.scala 143:34 IssueArbiter.scala 144:27]
  wire  _GEN_212 = ~mdu_occupy ? io_insts_in_0_alu_expand : _GEN_168; // @[IssueArbiter.scala 143:34 IssueArbiter.scala 144:27]
  wire [3:0] _GEN_213 = ~mdu_occupy ? io_insts_in_0_alu_op : _GEN_169; // @[IssueArbiter.scala 143:34 IssueArbiter.scala 144:27]
  wire  _GEN_214 = ~mdu_occupy ? io_insts_in_0_write_dest : _GEN_170; // @[IssueArbiter.scala 143:34 IssueArbiter.scala 144:27]
  wire [1:0] _GEN_215 = ~mdu_occupy ? io_insts_in_0_src_b : _GEN_171; // @[IssueArbiter.scala 143:34 IssueArbiter.scala 144:27]
  wire [1:0] _GEN_216 = ~mdu_occupy ? io_insts_in_0_src_a : _GEN_172; // @[IssueArbiter.scala 143:34 IssueArbiter.scala 144:27]
  wire [63:0] _GEN_221 = ~mdu_occupy ? io_rss_in_0 : _GEN_177; // @[IssueArbiter.scala 143:34 IssueArbiter.scala 145:25]
  wire [63:0] _GEN_222 = ~mdu_occupy ? io_rts_in_0 : _GEN_178; // @[IssueArbiter.scala 143:34 IssueArbiter.scala 146:25]
  wire  _GEN_224 = ~mdu_occupy | _GEN_180; // @[IssueArbiter.scala 143:34 IssueArbiter.scala 148:32]
  wire [63:0] _GEN_225 = ~alu_occupy ? io_insts_in_0_target_pc : _GEN_137; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire  _GEN_226 = ~alu_occupy ? io_insts_in_0_predict_taken : _GEN_138; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire [63:0] _GEN_227 = ~alu_occupy ? io_insts_in_0_pc : _GEN_139; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire [63:0] _GEN_228 = ~alu_occupy ? io_insts_in_0_imm : _GEN_140; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire [4:0] _GEN_229 = ~alu_occupy ? io_insts_in_0_rd : _GEN_141; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire [4:0] _GEN_231 = ~alu_occupy ? io_insts_in_0_rs1 : _GEN_143; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire [1:0] _GEN_232 = ~alu_occupy ? io_insts_in_0_write_src : _GEN_144; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire  _GEN_234 = ~alu_occupy ? io_insts_in_0_alu_expand : _GEN_146; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire [3:0] _GEN_235 = ~alu_occupy ? io_insts_in_0_alu_op : _GEN_147; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire  _GEN_236 = ~alu_occupy ? io_insts_in_0_write_dest : _GEN_148; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire [1:0] _GEN_237 = ~alu_occupy ? io_insts_in_0_src_b : _GEN_149; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire [1:0] _GEN_238 = ~alu_occupy ? io_insts_in_0_src_a : _GEN_150; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire [3:0] _GEN_239 = ~alu_occupy ? io_insts_in_0_branch_type : _GEN_151; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire [1:0] _GEN_240 = ~alu_occupy ? io_insts_in_0_alu_mdu_lsu : _GEN_152; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire [2:0] _GEN_241 = ~alu_occupy ? io_insts_in_0_next_pc : _GEN_153; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire  _GEN_242 = ~alu_occupy ? io_insts_in_0_illegal : _GEN_154; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire [63:0] _GEN_243 = ~alu_occupy ? io_rss_in_0 : _GEN_155; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 139:25]
  wire [63:0] _GEN_244 = ~alu_occupy ? io_rts_in_0 : _GEN_156; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 140:25]
  wire  _GEN_246 = ~alu_occupy | _GEN_158; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 142:32]
  wire [63:0] _GEN_249 = ~alu_occupy ? _GEN_161 : _GEN_205; // @[IssueArbiter.scala 137:27]
  wire [63:0] _GEN_250 = ~alu_occupy ? _GEN_162 : _GEN_206; // @[IssueArbiter.scala 137:27]
  wire [4:0] _GEN_251 = ~alu_occupy ? _GEN_163 : _GEN_207; // @[IssueArbiter.scala 137:27]
  wire  _GEN_256 = ~alu_occupy ? _GEN_168 : _GEN_212; // @[IssueArbiter.scala 137:27]
  wire [3:0] _GEN_257 = ~alu_occupy ? _GEN_169 : _GEN_213; // @[IssueArbiter.scala 137:27]
  wire  _GEN_258 = ~alu_occupy ? _GEN_170 : _GEN_214; // @[IssueArbiter.scala 137:27]
  wire [1:0] _GEN_259 = ~alu_occupy ? _GEN_171 : _GEN_215; // @[IssueArbiter.scala 137:27]
  wire [1:0] _GEN_260 = ~alu_occupy ? _GEN_172 : _GEN_216; // @[IssueArbiter.scala 137:27]
  wire [63:0] _GEN_265 = ~alu_occupy ? _GEN_177 : _GEN_221; // @[IssueArbiter.scala 137:27]
  wire [63:0] _GEN_266 = ~alu_occupy ? _GEN_178 : _GEN_222; // @[IssueArbiter.scala 137:27]
  wire  _GEN_268 = ~alu_occupy ? _GEN_180 : _GEN_224; // @[IssueArbiter.scala 137:27]
  wire [63:0] _GEN_269 = issue_valid_0 & _T_26 ? _GEN_225 : _GEN_137; // @[IssueArbiter.scala 136:70]
  wire  _GEN_270 = issue_valid_0 & _T_26 ? _GEN_226 : _GEN_138; // @[IssueArbiter.scala 136:70]
  wire [63:0] _GEN_271 = issue_valid_0 & _T_26 ? _GEN_227 : _GEN_139; // @[IssueArbiter.scala 136:70]
  wire [63:0] _GEN_272 = issue_valid_0 & _T_26 ? _GEN_228 : _GEN_140; // @[IssueArbiter.scala 136:70]
  wire [4:0] _GEN_273 = issue_valid_0 & _T_26 ? _GEN_229 : _GEN_141; // @[IssueArbiter.scala 136:70]
  wire [4:0] _GEN_275 = issue_valid_0 & _T_26 ? _GEN_231 : _GEN_143; // @[IssueArbiter.scala 136:70]
  wire [1:0] _GEN_276 = issue_valid_0 & _T_26 ? _GEN_232 : _GEN_144; // @[IssueArbiter.scala 136:70]
  wire  _GEN_278 = issue_valid_0 & _T_26 ? _GEN_234 : _GEN_146; // @[IssueArbiter.scala 136:70]
  wire [3:0] _GEN_279 = issue_valid_0 & _T_26 ? _GEN_235 : _GEN_147; // @[IssueArbiter.scala 136:70]
  wire  _GEN_280 = issue_valid_0 & _T_26 ? _GEN_236 : _GEN_148; // @[IssueArbiter.scala 136:70]
  wire [1:0] _GEN_281 = issue_valid_0 & _T_26 ? _GEN_237 : _GEN_149; // @[IssueArbiter.scala 136:70]
  wire [1:0] _GEN_282 = issue_valid_0 & _T_26 ? _GEN_238 : _GEN_150; // @[IssueArbiter.scala 136:70]
  wire [3:0] _GEN_283 = issue_valid_0 & _T_26 ? _GEN_239 : _GEN_151; // @[IssueArbiter.scala 136:70]
  wire [1:0] _GEN_284 = issue_valid_0 & _T_26 ? _GEN_240 : _GEN_152; // @[IssueArbiter.scala 136:70]
  wire [2:0] _GEN_285 = issue_valid_0 & _T_26 ? _GEN_241 : _GEN_153; // @[IssueArbiter.scala 136:70]
  wire  _GEN_286 = issue_valid_0 & _T_26 ? _GEN_242 : _GEN_154; // @[IssueArbiter.scala 136:70]
  wire [63:0] _GEN_287 = issue_valid_0 & _T_26 ? _GEN_243 : _GEN_155; // @[IssueArbiter.scala 136:70]
  wire [63:0] _GEN_288 = issue_valid_0 & _T_26 ? _GEN_244 : _GEN_156; // @[IssueArbiter.scala 136:70]
  wire  _GEN_290 = issue_valid_0 & _T_26 ? _GEN_246 : _GEN_158; // @[IssueArbiter.scala 136:70]
  wire [63:0] _GEN_293 = issue_valid_0 & _T_26 ? _GEN_249 : _GEN_161; // @[IssueArbiter.scala 136:70]
  wire [63:0] _GEN_294 = issue_valid_0 & _T_26 ? _GEN_250 : _GEN_162; // @[IssueArbiter.scala 136:70]
  wire [4:0] _GEN_295 = issue_valid_0 & _T_26 ? _GEN_251 : _GEN_163; // @[IssueArbiter.scala 136:70]
  wire  _GEN_300 = issue_valid_0 & _T_26 ? _GEN_256 : _GEN_168; // @[IssueArbiter.scala 136:70]
  wire [3:0] _GEN_301 = issue_valid_0 & _T_26 ? _GEN_257 : _GEN_169; // @[IssueArbiter.scala 136:70]
  wire  _GEN_302 = issue_valid_0 & _T_26 ? _GEN_258 : _GEN_170; // @[IssueArbiter.scala 136:70]
  wire [1:0] _GEN_303 = issue_valid_0 & _T_26 ? _GEN_259 : _GEN_171; // @[IssueArbiter.scala 136:70]
  wire [1:0] _GEN_304 = issue_valid_0 & _T_26 ? _GEN_260 : _GEN_172; // @[IssueArbiter.scala 136:70]
  wire [63:0] _GEN_309 = issue_valid_0 & _T_26 ? _GEN_265 : _GEN_177; // @[IssueArbiter.scala 136:70]
  wire [63:0] _GEN_310 = issue_valid_0 & _T_26 ? _GEN_266 : _GEN_178; // @[IssueArbiter.scala 136:70]
  wire  _GEN_312 = issue_valid_0 & _T_26 ? _GEN_268 : _GEN_180; // @[IssueArbiter.scala 136:70]
  wire [63:0] _GEN_315 = ~mdu_occupy ? io_insts_in_1_pc : _GEN_293; // @[IssueArbiter.scala 143:34 IssueArbiter.scala 144:27]
  wire [63:0] _GEN_316 = ~mdu_occupy ? io_insts_in_1_imm : _GEN_294; // @[IssueArbiter.scala 143:34 IssueArbiter.scala 144:27]
  wire [4:0] _GEN_317 = ~mdu_occupy ? io_insts_in_1_rd : _GEN_295; // @[IssueArbiter.scala 143:34 IssueArbiter.scala 144:27]
  wire  _GEN_322 = ~mdu_occupy ? io_insts_in_1_alu_expand : _GEN_300; // @[IssueArbiter.scala 143:34 IssueArbiter.scala 144:27]
  wire [3:0] _GEN_323 = ~mdu_occupy ? io_insts_in_1_alu_op : _GEN_301; // @[IssueArbiter.scala 143:34 IssueArbiter.scala 144:27]
  wire  _GEN_324 = ~mdu_occupy ? io_insts_in_1_write_dest : _GEN_302; // @[IssueArbiter.scala 143:34 IssueArbiter.scala 144:27]
  wire [1:0] _GEN_325 = ~mdu_occupy ? io_insts_in_1_src_b : _GEN_303; // @[IssueArbiter.scala 143:34 IssueArbiter.scala 144:27]
  wire [1:0] _GEN_326 = ~mdu_occupy ? io_insts_in_1_src_a : _GEN_304; // @[IssueArbiter.scala 143:34 IssueArbiter.scala 144:27]
  wire [63:0] _GEN_331 = ~mdu_occupy ? io_rss_in_1 : _GEN_309; // @[IssueArbiter.scala 143:34 IssueArbiter.scala 145:25]
  wire [63:0] _GEN_332 = ~mdu_occupy ? io_rts_in_1 : _GEN_310; // @[IssueArbiter.scala 143:34 IssueArbiter.scala 146:25]
  wire  _GEN_334 = ~mdu_occupy | _GEN_312; // @[IssueArbiter.scala 143:34 IssueArbiter.scala 148:32]
  wire [63:0] _GEN_335 = ~alu_occupy ? io_insts_in_1_target_pc : _GEN_269; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire  _GEN_336 = ~alu_occupy ? io_insts_in_1_predict_taken : _GEN_270; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire [63:0] _GEN_337 = ~alu_occupy ? io_insts_in_1_pc : _GEN_271; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire [63:0] _GEN_338 = ~alu_occupy ? io_insts_in_1_imm : _GEN_272; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire [4:0] _GEN_339 = ~alu_occupy ? io_insts_in_1_rd : _GEN_273; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire [4:0] _GEN_341 = ~alu_occupy ? io_insts_in_1_rs1 : _GEN_275; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire [1:0] _GEN_342 = ~alu_occupy ? io_insts_in_1_write_src : _GEN_276; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire  _GEN_344 = ~alu_occupy ? io_insts_in_1_alu_expand : _GEN_278; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire [3:0] _GEN_345 = ~alu_occupy ? io_insts_in_1_alu_op : _GEN_279; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire  _GEN_346 = ~alu_occupy ? io_insts_in_1_write_dest : _GEN_280; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire [1:0] _GEN_347 = ~alu_occupy ? io_insts_in_1_src_b : _GEN_281; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire [1:0] _GEN_348 = ~alu_occupy ? io_insts_in_1_src_a : _GEN_282; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire [3:0] _GEN_349 = ~alu_occupy ? io_insts_in_1_branch_type : _GEN_283; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire [1:0] _GEN_350 = ~alu_occupy ? io_insts_in_1_alu_mdu_lsu : _GEN_284; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire [2:0] _GEN_351 = ~alu_occupy ? io_insts_in_1_next_pc : _GEN_285; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire  _GEN_352 = ~alu_occupy ? io_insts_in_1_illegal : _GEN_286; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire [63:0] _GEN_353 = ~alu_occupy ? io_rss_in_1 : _GEN_287; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 139:25]
  wire [63:0] _GEN_354 = ~alu_occupy ? io_rts_in_1 : _GEN_288; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 140:25]
  wire  _GEN_356 = ~alu_occupy | _GEN_290; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 142:32]
  wire [63:0] _GEN_359 = ~alu_occupy ? _GEN_293 : _GEN_315; // @[IssueArbiter.scala 137:27]
  wire [63:0] _GEN_360 = ~alu_occupy ? _GEN_294 : _GEN_316; // @[IssueArbiter.scala 137:27]
  wire [4:0] _GEN_361 = ~alu_occupy ? _GEN_295 : _GEN_317; // @[IssueArbiter.scala 137:27]
  wire  _GEN_366 = ~alu_occupy ? _GEN_300 : _GEN_322; // @[IssueArbiter.scala 137:27]
  wire [3:0] _GEN_367 = ~alu_occupy ? _GEN_301 : _GEN_323; // @[IssueArbiter.scala 137:27]
  wire  _GEN_368 = ~alu_occupy ? _GEN_302 : _GEN_324; // @[IssueArbiter.scala 137:27]
  wire [1:0] _GEN_369 = ~alu_occupy ? _GEN_303 : _GEN_325; // @[IssueArbiter.scala 137:27]
  wire [1:0] _GEN_370 = ~alu_occupy ? _GEN_304 : _GEN_326; // @[IssueArbiter.scala 137:27]
  wire [63:0] _GEN_375 = ~alu_occupy ? _GEN_309 : _GEN_331; // @[IssueArbiter.scala 137:27]
  wire [63:0] _GEN_376 = ~alu_occupy ? _GEN_310 : _GEN_332; // @[IssueArbiter.scala 137:27]
  wire  _GEN_377 = ~alu_occupy ? 1'h0 : _T_58; // @[IssueArbiter.scala 137:27]
  wire  _GEN_378 = ~alu_occupy ? _GEN_312 : _GEN_334; // @[IssueArbiter.scala 137:27]
  wire [63:0] _GEN_379 = issue_valid_1 & _T_27 ? _GEN_335 : _GEN_269; // @[IssueArbiter.scala 136:70]
  wire  _GEN_380 = issue_valid_1 & _T_27 ? _GEN_336 : _GEN_270; // @[IssueArbiter.scala 136:70]
  wire [63:0] _GEN_381 = issue_valid_1 & _T_27 ? _GEN_337 : _GEN_271; // @[IssueArbiter.scala 136:70]
  wire [63:0] _GEN_382 = issue_valid_1 & _T_27 ? _GEN_338 : _GEN_272; // @[IssueArbiter.scala 136:70]
  wire [4:0] _GEN_383 = issue_valid_1 & _T_27 ? _GEN_339 : _GEN_273; // @[IssueArbiter.scala 136:70]
  wire [4:0] _GEN_385 = issue_valid_1 & _T_27 ? _GEN_341 : _GEN_275; // @[IssueArbiter.scala 136:70]
  wire [1:0] _GEN_386 = issue_valid_1 & _T_27 ? _GEN_342 : _GEN_276; // @[IssueArbiter.scala 136:70]
  wire  _GEN_388 = issue_valid_1 & _T_27 ? _GEN_344 : _GEN_278; // @[IssueArbiter.scala 136:70]
  wire [3:0] _GEN_389 = issue_valid_1 & _T_27 ? _GEN_345 : _GEN_279; // @[IssueArbiter.scala 136:70]
  wire  _GEN_390 = issue_valid_1 & _T_27 ? _GEN_346 : _GEN_280; // @[IssueArbiter.scala 136:70]
  wire [1:0] _GEN_391 = issue_valid_1 & _T_27 ? _GEN_347 : _GEN_281; // @[IssueArbiter.scala 136:70]
  wire [1:0] _GEN_392 = issue_valid_1 & _T_27 ? _GEN_348 : _GEN_282; // @[IssueArbiter.scala 136:70]
  wire [3:0] _GEN_393 = issue_valid_1 & _T_27 ? _GEN_349 : _GEN_283; // @[IssueArbiter.scala 136:70]
  wire [1:0] _GEN_394 = issue_valid_1 & _T_27 ? _GEN_350 : _GEN_284; // @[IssueArbiter.scala 136:70]
  wire [2:0] _GEN_395 = issue_valid_1 & _T_27 ? _GEN_351 : _GEN_285; // @[IssueArbiter.scala 136:70]
  wire  _GEN_396 = issue_valid_1 & _T_27 ? _GEN_352 : _GEN_286; // @[IssueArbiter.scala 136:70]
  wire [63:0] _GEN_397 = issue_valid_1 & _T_27 ? _GEN_353 : _GEN_287; // @[IssueArbiter.scala 136:70]
  wire [63:0] _GEN_398 = issue_valid_1 & _T_27 ? _GEN_354 : _GEN_288; // @[IssueArbiter.scala 136:70]
  wire  _GEN_399 = issue_valid_1 & _T_27 & _T_57; // @[IssueArbiter.scala 136:70]
  wire  _GEN_400 = issue_valid_1 & _T_27 ? _GEN_356 : _GEN_290; // @[IssueArbiter.scala 136:70]
  wire [63:0] _GEN_403 = issue_valid_1 & _T_27 ? _GEN_359 : _GEN_293; // @[IssueArbiter.scala 136:70]
  wire [63:0] _GEN_404 = issue_valid_1 & _T_27 ? _GEN_360 : _GEN_294; // @[IssueArbiter.scala 136:70]
  wire [4:0] _GEN_405 = issue_valid_1 & _T_27 ? _GEN_361 : _GEN_295; // @[IssueArbiter.scala 136:70]
  wire  _GEN_410 = issue_valid_1 & _T_27 ? _GEN_366 : _GEN_300; // @[IssueArbiter.scala 136:70]
  wire [3:0] _GEN_411 = issue_valid_1 & _T_27 ? _GEN_367 : _GEN_301; // @[IssueArbiter.scala 136:70]
  wire  _GEN_412 = issue_valid_1 & _T_27 ? _GEN_368 : _GEN_302; // @[IssueArbiter.scala 136:70]
  wire [1:0] _GEN_413 = issue_valid_1 & _T_27 ? _GEN_369 : _GEN_303; // @[IssueArbiter.scala 136:70]
  wire [1:0] _GEN_414 = issue_valid_1 & _T_27 ? _GEN_370 : _GEN_304; // @[IssueArbiter.scala 136:70]
  wire [63:0] _GEN_419 = issue_valid_1 & _T_27 ? _GEN_375 : _GEN_309; // @[IssueArbiter.scala 136:70]
  wire [63:0] _GEN_420 = issue_valid_1 & _T_27 ? _GEN_376 : _GEN_310; // @[IssueArbiter.scala 136:70]
  wire  _GEN_421 = issue_valid_1 & _T_27 & _GEN_377; // @[IssueArbiter.scala 136:70]
  wire  _GEN_422 = issue_valid_1 & _T_27 ? _GEN_378 : _GEN_312; // @[IssueArbiter.scala 136:70]
  wire  _T_65 = 2'h2 == io_insts_in_1_alu_mdu_lsu; // @[Conditional.scala 37:30]
  wire [63:0] _GEN_425 = _T_65 ? io_insts_in_1_pc : _GEN_183; // @[Conditional.scala 39:67 IssueArbiter.scala 126:27]
  wire [63:0] _GEN_426 = _T_65 ? io_insts_in_1_imm : _GEN_184; // @[Conditional.scala 39:67 IssueArbiter.scala 126:27]
  wire [4:0] _GEN_427 = _T_65 ? io_insts_in_1_rd : _GEN_185; // @[Conditional.scala 39:67 IssueArbiter.scala 126:27]
  wire [2:0] _GEN_431 = _T_65 ? io_insts_in_1_mem_width : _GEN_189; // @[Conditional.scala 39:67 IssueArbiter.scala 126:27]
  wire  _GEN_434 = _T_65 ? io_insts_in_1_write_dest : _GEN_192; // @[Conditional.scala 39:67 IssueArbiter.scala 126:27]
  wire [63:0] _GEN_441 = _T_65 ? io_rss_in_1 : _GEN_199; // @[Conditional.scala 39:67 IssueArbiter.scala 127:25]
  wire [63:0] _GEN_442 = _T_65 ? io_rts_in_1 : _GEN_200; // @[Conditional.scala 39:67 IssueArbiter.scala 128:25]
  wire  _GEN_444 = _T_65 | _GEN_202; // @[Conditional.scala 39:67 IssueArbiter.scala 130:32]
  wire [63:0] _GEN_447 = _T_64 ? io_insts_in_1_pc : _GEN_403; // @[Conditional.scala 39:67 IssueArbiter.scala 118:27]
  wire [63:0] _GEN_448 = _T_64 ? io_insts_in_1_imm : _GEN_404; // @[Conditional.scala 39:67 IssueArbiter.scala 118:27]
  wire [4:0] _GEN_449 = _T_64 ? io_insts_in_1_rd : _GEN_405; // @[Conditional.scala 39:67 IssueArbiter.scala 118:27]
  wire  _GEN_454 = _T_64 ? io_insts_in_1_alu_expand : _GEN_410; // @[Conditional.scala 39:67 IssueArbiter.scala 118:27]
  wire [3:0] _GEN_455 = _T_64 ? io_insts_in_1_alu_op : _GEN_411; // @[Conditional.scala 39:67 IssueArbiter.scala 118:27]
  wire  _GEN_456 = _T_64 ? io_insts_in_1_write_dest : _GEN_412; // @[Conditional.scala 39:67 IssueArbiter.scala 118:27]
  wire [1:0] _GEN_457 = _T_64 ? io_insts_in_1_src_b : _GEN_413; // @[Conditional.scala 39:67 IssueArbiter.scala 118:27]
  wire [1:0] _GEN_458 = _T_64 ? io_insts_in_1_src_a : _GEN_414; // @[Conditional.scala 39:67 IssueArbiter.scala 118:27]
  wire [63:0] _GEN_463 = _T_64 ? io_rss_in_1 : _GEN_419; // @[Conditional.scala 39:67 IssueArbiter.scala 119:25]
  wire [63:0] _GEN_464 = _T_64 ? io_rts_in_1 : _GEN_420; // @[Conditional.scala 39:67 IssueArbiter.scala 120:25]
  wire  _GEN_465 = _T_64 | _GEN_421; // @[Conditional.scala 39:67 IssueArbiter.scala 121:29]
  wire  _GEN_466 = _T_64 | _GEN_422; // @[Conditional.scala 39:67 IssueArbiter.scala 122:32]
  wire [63:0] _GEN_470 = _T_64 ? _GEN_183 : _GEN_425; // @[Conditional.scala 39:67]
  wire [63:0] _GEN_471 = _T_64 ? _GEN_184 : _GEN_426; // @[Conditional.scala 39:67]
  wire [4:0] _GEN_472 = _T_64 ? _GEN_185 : _GEN_427; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_476 = _T_64 ? _GEN_189 : _GEN_431; // @[Conditional.scala 39:67]
  wire  _GEN_479 = _T_64 ? _GEN_192 : _GEN_434; // @[Conditional.scala 39:67]
  wire [63:0] _GEN_486 = _T_64 ? _GEN_199 : _GEN_441; // @[Conditional.scala 39:67]
  wire [63:0] _GEN_487 = _T_64 ? _GEN_200 : _GEN_442; // @[Conditional.scala 39:67]
  wire  _GEN_488 = _T_64 ? 1'h0 : _T_65; // @[Conditional.scala 39:67]
  wire  _GEN_489 = _T_64 ? _GEN_202 : _GEN_444; // @[Conditional.scala 39:67]
  wire [63:0] _GEN_490 = _T_63 ? io_insts_in_1_target_pc : _GEN_379; // @[Conditional.scala 40:58 IssueArbiter.scala 110:27]
  wire  _GEN_491 = _T_63 ? io_insts_in_1_predict_taken : _GEN_380; // @[Conditional.scala 40:58 IssueArbiter.scala 110:27]
  wire [63:0] _GEN_492 = _T_63 ? io_insts_in_1_pc : _GEN_381; // @[Conditional.scala 40:58 IssueArbiter.scala 110:27]
  wire [63:0] _GEN_493 = _T_63 ? io_insts_in_1_imm : _GEN_382; // @[Conditional.scala 40:58 IssueArbiter.scala 110:27]
  wire [4:0] _GEN_494 = _T_63 ? io_insts_in_1_rd : _GEN_383; // @[Conditional.scala 40:58 IssueArbiter.scala 110:27]
  wire [4:0] _GEN_496 = _T_63 ? io_insts_in_1_rs1 : _GEN_385; // @[Conditional.scala 40:58 IssueArbiter.scala 110:27]
  wire [1:0] _GEN_497 = _T_63 ? io_insts_in_1_write_src : _GEN_386; // @[Conditional.scala 40:58 IssueArbiter.scala 110:27]
  wire  _GEN_499 = _T_63 ? io_insts_in_1_alu_expand : _GEN_388; // @[Conditional.scala 40:58 IssueArbiter.scala 110:27]
  wire [3:0] _GEN_500 = _T_63 ? io_insts_in_1_alu_op : _GEN_389; // @[Conditional.scala 40:58 IssueArbiter.scala 110:27]
  wire  _GEN_501 = _T_63 ? io_insts_in_1_write_dest : _GEN_390; // @[Conditional.scala 40:58 IssueArbiter.scala 110:27]
  wire [1:0] _GEN_502 = _T_63 ? io_insts_in_1_src_b : _GEN_391; // @[Conditional.scala 40:58 IssueArbiter.scala 110:27]
  wire [1:0] _GEN_503 = _T_63 ? io_insts_in_1_src_a : _GEN_392; // @[Conditional.scala 40:58 IssueArbiter.scala 110:27]
  wire [3:0] _GEN_504 = _T_63 ? io_insts_in_1_branch_type : _GEN_393; // @[Conditional.scala 40:58 IssueArbiter.scala 110:27]
  wire [1:0] _GEN_505 = _T_63 ? io_insts_in_1_alu_mdu_lsu : _GEN_394; // @[Conditional.scala 40:58 IssueArbiter.scala 110:27]
  wire [2:0] _GEN_506 = _T_63 ? io_insts_in_1_next_pc : _GEN_395; // @[Conditional.scala 40:58 IssueArbiter.scala 110:27]
  wire  _GEN_507 = _T_63 ? io_insts_in_1_illegal : _GEN_396; // @[Conditional.scala 40:58 IssueArbiter.scala 110:27]
  wire [63:0] _GEN_508 = _T_63 ? io_rss_in_1 : _GEN_397; // @[Conditional.scala 40:58 IssueArbiter.scala 111:25]
  wire [63:0] _GEN_509 = _T_63 ? io_rts_in_1 : _GEN_398; // @[Conditional.scala 40:58 IssueArbiter.scala 112:25]
  wire  _GEN_510 = _T_63 | _GEN_399; // @[Conditional.scala 40:58 IssueArbiter.scala 113:29]
  wire  _GEN_511 = _T_63 | _GEN_400; // @[Conditional.scala 40:58 IssueArbiter.scala 114:32]
  wire [63:0] _GEN_515 = _T_63 ? _GEN_403 : _GEN_447; // @[Conditional.scala 40:58]
  wire [63:0] _GEN_516 = _T_63 ? _GEN_404 : _GEN_448; // @[Conditional.scala 40:58]
  wire [4:0] _GEN_517 = _T_63 ? _GEN_405 : _GEN_449; // @[Conditional.scala 40:58]
  wire  _GEN_522 = _T_63 ? _GEN_410 : _GEN_454; // @[Conditional.scala 40:58]
  wire [3:0] _GEN_523 = _T_63 ? _GEN_411 : _GEN_455; // @[Conditional.scala 40:58]
  wire  _GEN_524 = _T_63 ? _GEN_412 : _GEN_456; // @[Conditional.scala 40:58]
  wire [1:0] _GEN_525 = _T_63 ? _GEN_413 : _GEN_457; // @[Conditional.scala 40:58]
  wire [1:0] _GEN_526 = _T_63 ? _GEN_414 : _GEN_458; // @[Conditional.scala 40:58]
  wire [63:0] _GEN_531 = _T_63 ? _GEN_419 : _GEN_463; // @[Conditional.scala 40:58]
  wire [63:0] _GEN_532 = _T_63 ? _GEN_420 : _GEN_464; // @[Conditional.scala 40:58]
  wire  _GEN_533 = _T_63 ? _GEN_421 : _GEN_465; // @[Conditional.scala 40:58]
  wire  _GEN_534 = _T_63 ? _GEN_422 : _GEN_466; // @[Conditional.scala 40:58]
  wire [63:0] _GEN_538 = _T_63 ? _GEN_183 : _GEN_470; // @[Conditional.scala 40:58]
  wire [63:0] _GEN_539 = _T_63 ? _GEN_184 : _GEN_471; // @[Conditional.scala 40:58]
  wire [4:0] _GEN_540 = _T_63 ? _GEN_185 : _GEN_472; // @[Conditional.scala 40:58]
  wire [2:0] _GEN_544 = _T_63 ? _GEN_189 : _GEN_476; // @[Conditional.scala 40:58]
  wire  _GEN_547 = _T_63 ? _GEN_192 : _GEN_479; // @[Conditional.scala 40:58]
  wire [63:0] _GEN_554 = _T_63 ? _GEN_199 : _GEN_486; // @[Conditional.scala 40:58]
  wire [63:0] _GEN_555 = _T_63 ? _GEN_200 : _GEN_487; // @[Conditional.scala 40:58]
  wire  _GEN_556 = _T_63 ? 1'h0 : _GEN_488; // @[Conditional.scala 40:58]
  wire  _GEN_557 = _T_63 ? _GEN_202 : _GEN_489; // @[Conditional.scala 40:58]
  wire [63:0] _GEN_558 = issue_valid_1 ? _GEN_490 : _GEN_379; // @[IssueArbiter.scala 107:26]
  wire  _GEN_559 = issue_valid_1 ? _GEN_491 : _GEN_380; // @[IssueArbiter.scala 107:26]
  wire [63:0] _GEN_560 = issue_valid_1 ? _GEN_492 : _GEN_381; // @[IssueArbiter.scala 107:26]
  wire [63:0] _GEN_561 = issue_valid_1 ? _GEN_493 : _GEN_382; // @[IssueArbiter.scala 107:26]
  wire [4:0] _GEN_562 = issue_valid_1 ? _GEN_494 : _GEN_383; // @[IssueArbiter.scala 107:26]
  wire [4:0] _GEN_564 = issue_valid_1 ? _GEN_496 : _GEN_385; // @[IssueArbiter.scala 107:26]
  wire [1:0] _GEN_565 = issue_valid_1 ? _GEN_497 : _GEN_386; // @[IssueArbiter.scala 107:26]
  wire  _GEN_567 = issue_valid_1 ? _GEN_499 : _GEN_388; // @[IssueArbiter.scala 107:26]
  wire [3:0] _GEN_568 = issue_valid_1 ? _GEN_500 : _GEN_389; // @[IssueArbiter.scala 107:26]
  wire  _GEN_569 = issue_valid_1 ? _GEN_501 : _GEN_390; // @[IssueArbiter.scala 107:26]
  wire [1:0] _GEN_570 = issue_valid_1 ? _GEN_502 : _GEN_391; // @[IssueArbiter.scala 107:26]
  wire [1:0] _GEN_571 = issue_valid_1 ? _GEN_503 : _GEN_392; // @[IssueArbiter.scala 107:26]
  wire [3:0] _GEN_572 = issue_valid_1 ? _GEN_504 : _GEN_393; // @[IssueArbiter.scala 107:26]
  wire [1:0] _GEN_573 = issue_valid_1 ? _GEN_505 : _GEN_394; // @[IssueArbiter.scala 107:26]
  wire [2:0] _GEN_574 = issue_valid_1 ? _GEN_506 : _GEN_395; // @[IssueArbiter.scala 107:26]
  wire  _GEN_575 = issue_valid_1 ? _GEN_507 : _GEN_396; // @[IssueArbiter.scala 107:26]
  wire [63:0] _GEN_576 = issue_valid_1 ? _GEN_508 : _GEN_397; // @[IssueArbiter.scala 107:26]
  wire [63:0] _GEN_577 = issue_valid_1 ? _GEN_509 : _GEN_398; // @[IssueArbiter.scala 107:26]
  wire  _GEN_578 = issue_valid_1 ? _GEN_510 : _GEN_399; // @[IssueArbiter.scala 107:26]
  wire  _GEN_579 = issue_valid_1 ? _GEN_511 : _GEN_400; // @[IssueArbiter.scala 107:26]
  wire [63:0] _GEN_583 = issue_valid_1 ? _GEN_515 : _GEN_403; // @[IssueArbiter.scala 107:26]
  wire [63:0] _GEN_584 = issue_valid_1 ? _GEN_516 : _GEN_404; // @[IssueArbiter.scala 107:26]
  wire [4:0] _GEN_585 = issue_valid_1 ? _GEN_517 : _GEN_405; // @[IssueArbiter.scala 107:26]
  wire  _GEN_590 = issue_valid_1 ? _GEN_522 : _GEN_410; // @[IssueArbiter.scala 107:26]
  wire [3:0] _GEN_591 = issue_valid_1 ? _GEN_523 : _GEN_411; // @[IssueArbiter.scala 107:26]
  wire  _GEN_592 = issue_valid_1 ? _GEN_524 : _GEN_412; // @[IssueArbiter.scala 107:26]
  wire [1:0] _GEN_593 = issue_valid_1 ? _GEN_525 : _GEN_413; // @[IssueArbiter.scala 107:26]
  wire [1:0] _GEN_594 = issue_valid_1 ? _GEN_526 : _GEN_414; // @[IssueArbiter.scala 107:26]
  wire [63:0] _GEN_599 = issue_valid_1 ? _GEN_531 : _GEN_419; // @[IssueArbiter.scala 107:26]
  wire [63:0] _GEN_600 = issue_valid_1 ? _GEN_532 : _GEN_420; // @[IssueArbiter.scala 107:26]
  wire  _GEN_601 = issue_valid_1 ? _GEN_533 : _GEN_421; // @[IssueArbiter.scala 107:26]
  wire  _GEN_602 = issue_valid_1 ? _GEN_534 : _GEN_422; // @[IssueArbiter.scala 107:26]
  wire  _GEN_624 = issue_valid_1 & _GEN_556; // @[IssueArbiter.scala 107:26]
  wire [63:0] _GEN_628 = ~mdu_occupy ? io_insts_in_0_pc : _GEN_583; // @[IssueArbiter.scala 143:34 IssueArbiter.scala 144:27]
  wire [63:0] _GEN_629 = ~mdu_occupy ? io_insts_in_0_imm : _GEN_584; // @[IssueArbiter.scala 143:34 IssueArbiter.scala 144:27]
  wire [4:0] _GEN_630 = ~mdu_occupy ? io_insts_in_0_rd : _GEN_585; // @[IssueArbiter.scala 143:34 IssueArbiter.scala 144:27]
  wire  _GEN_635 = ~mdu_occupy ? io_insts_in_0_alu_expand : _GEN_590; // @[IssueArbiter.scala 143:34 IssueArbiter.scala 144:27]
  wire [3:0] _GEN_636 = ~mdu_occupy ? io_insts_in_0_alu_op : _GEN_591; // @[IssueArbiter.scala 143:34 IssueArbiter.scala 144:27]
  wire  _GEN_637 = ~mdu_occupy ? io_insts_in_0_write_dest : _GEN_592; // @[IssueArbiter.scala 143:34 IssueArbiter.scala 144:27]
  wire [1:0] _GEN_638 = ~mdu_occupy ? io_insts_in_0_src_b : _GEN_593; // @[IssueArbiter.scala 143:34 IssueArbiter.scala 144:27]
  wire [1:0] _GEN_639 = ~mdu_occupy ? io_insts_in_0_src_a : _GEN_594; // @[IssueArbiter.scala 143:34 IssueArbiter.scala 144:27]
  wire [63:0] _GEN_644 = ~mdu_occupy ? io_rss_in_0 : _GEN_599; // @[IssueArbiter.scala 143:34 IssueArbiter.scala 145:25]
  wire [63:0] _GEN_645 = ~mdu_occupy ? io_rts_in_0 : _GEN_600; // @[IssueArbiter.scala 143:34 IssueArbiter.scala 146:25]
  wire  _GEN_646 = ~mdu_occupy ? 1'h0 : _GEN_601; // @[IssueArbiter.scala 143:34 IssueArbiter.scala 147:29]
  wire  _GEN_647 = ~mdu_occupy | _GEN_602; // @[IssueArbiter.scala 143:34 IssueArbiter.scala 148:32]
  wire [63:0] _GEN_648 = ~alu_occupy ? io_insts_in_0_target_pc : _GEN_558; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire  _GEN_649 = ~alu_occupy ? io_insts_in_0_predict_taken : _GEN_559; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire [63:0] _GEN_650 = ~alu_occupy ? io_insts_in_0_pc : _GEN_560; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire [63:0] _GEN_651 = ~alu_occupy ? io_insts_in_0_imm : _GEN_561; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire [4:0] _GEN_652 = ~alu_occupy ? io_insts_in_0_rd : _GEN_562; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire [4:0] _GEN_654 = ~alu_occupy ? io_insts_in_0_rs1 : _GEN_564; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire [1:0] _GEN_655 = ~alu_occupy ? io_insts_in_0_write_src : _GEN_565; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire  _GEN_657 = ~alu_occupy ? io_insts_in_0_alu_expand : _GEN_567; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire [3:0] _GEN_658 = ~alu_occupy ? io_insts_in_0_alu_op : _GEN_568; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire  _GEN_659 = ~alu_occupy ? io_insts_in_0_write_dest : _GEN_569; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire [1:0] _GEN_660 = ~alu_occupy ? io_insts_in_0_src_b : _GEN_570; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire [1:0] _GEN_661 = ~alu_occupy ? io_insts_in_0_src_a : _GEN_571; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire [3:0] _GEN_662 = ~alu_occupy ? io_insts_in_0_branch_type : _GEN_572; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire [1:0] _GEN_663 = ~alu_occupy ? io_insts_in_0_alu_mdu_lsu : _GEN_573; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire [2:0] _GEN_664 = ~alu_occupy ? io_insts_in_0_next_pc : _GEN_574; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire  _GEN_665 = ~alu_occupy ? io_insts_in_0_illegal : _GEN_575; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire [63:0] _GEN_666 = ~alu_occupy ? io_rss_in_0 : _GEN_576; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 139:25]
  wire [63:0] _GEN_667 = ~alu_occupy ? io_rts_in_0 : _GEN_577; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 140:25]
  wire  _GEN_668 = ~alu_occupy ? 1'h0 : _GEN_578; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 141:29]
  wire  _GEN_669 = ~alu_occupy | _GEN_579; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 142:32]
  wire [63:0] _GEN_672 = ~alu_occupy ? _GEN_583 : _GEN_628; // @[IssueArbiter.scala 137:27]
  wire [63:0] _GEN_673 = ~alu_occupy ? _GEN_584 : _GEN_629; // @[IssueArbiter.scala 137:27]
  wire [4:0] _GEN_674 = ~alu_occupy ? _GEN_585 : _GEN_630; // @[IssueArbiter.scala 137:27]
  wire  _GEN_679 = ~alu_occupy ? _GEN_590 : _GEN_635; // @[IssueArbiter.scala 137:27]
  wire [3:0] _GEN_680 = ~alu_occupy ? _GEN_591 : _GEN_636; // @[IssueArbiter.scala 137:27]
  wire  _GEN_681 = ~alu_occupy ? _GEN_592 : _GEN_637; // @[IssueArbiter.scala 137:27]
  wire [1:0] _GEN_682 = ~alu_occupy ? _GEN_593 : _GEN_638; // @[IssueArbiter.scala 137:27]
  wire [1:0] _GEN_683 = ~alu_occupy ? _GEN_594 : _GEN_639; // @[IssueArbiter.scala 137:27]
  wire [63:0] _GEN_688 = ~alu_occupy ? _GEN_599 : _GEN_644; // @[IssueArbiter.scala 137:27]
  wire [63:0] _GEN_689 = ~alu_occupy ? _GEN_600 : _GEN_645; // @[IssueArbiter.scala 137:27]
  wire  _GEN_690 = ~alu_occupy ? _GEN_601 : _GEN_646; // @[IssueArbiter.scala 137:27]
  wire  _GEN_691 = ~alu_occupy ? _GEN_602 : _GEN_647; // @[IssueArbiter.scala 137:27]
  wire [63:0] _GEN_692 = issue_valid_0 & _T_26 ? _GEN_648 : _GEN_558; // @[IssueArbiter.scala 136:70]
  wire  _GEN_693 = issue_valid_0 & _T_26 ? _GEN_649 : _GEN_559; // @[IssueArbiter.scala 136:70]
  wire [63:0] _GEN_694 = issue_valid_0 & _T_26 ? _GEN_650 : _GEN_560; // @[IssueArbiter.scala 136:70]
  wire [63:0] _GEN_695 = issue_valid_0 & _T_26 ? _GEN_651 : _GEN_561; // @[IssueArbiter.scala 136:70]
  wire [4:0] _GEN_696 = issue_valid_0 & _T_26 ? _GEN_652 : _GEN_562; // @[IssueArbiter.scala 136:70]
  wire [4:0] _GEN_698 = issue_valid_0 & _T_26 ? _GEN_654 : _GEN_564; // @[IssueArbiter.scala 136:70]
  wire [1:0] _GEN_699 = issue_valid_0 & _T_26 ? _GEN_655 : _GEN_565; // @[IssueArbiter.scala 136:70]
  wire  _GEN_701 = issue_valid_0 & _T_26 ? _GEN_657 : _GEN_567; // @[IssueArbiter.scala 136:70]
  wire [3:0] _GEN_702 = issue_valid_0 & _T_26 ? _GEN_658 : _GEN_568; // @[IssueArbiter.scala 136:70]
  wire  _GEN_703 = issue_valid_0 & _T_26 ? _GEN_659 : _GEN_569; // @[IssueArbiter.scala 136:70]
  wire [1:0] _GEN_704 = issue_valid_0 & _T_26 ? _GEN_660 : _GEN_570; // @[IssueArbiter.scala 136:70]
  wire [1:0] _GEN_705 = issue_valid_0 & _T_26 ? _GEN_661 : _GEN_571; // @[IssueArbiter.scala 136:70]
  wire [3:0] _GEN_706 = issue_valid_0 & _T_26 ? _GEN_662 : _GEN_572; // @[IssueArbiter.scala 136:70]
  wire [1:0] _GEN_707 = issue_valid_0 & _T_26 ? _GEN_663 : _GEN_573; // @[IssueArbiter.scala 136:70]
  wire [2:0] _GEN_708 = issue_valid_0 & _T_26 ? _GEN_664 : _GEN_574; // @[IssueArbiter.scala 136:70]
  wire  _GEN_709 = issue_valid_0 & _T_26 ? _GEN_665 : _GEN_575; // @[IssueArbiter.scala 136:70]
  wire [63:0] _GEN_710 = issue_valid_0 & _T_26 ? _GEN_666 : _GEN_576; // @[IssueArbiter.scala 136:70]
  wire [63:0] _GEN_711 = issue_valid_0 & _T_26 ? _GEN_667 : _GEN_577; // @[IssueArbiter.scala 136:70]
  wire  _GEN_712 = issue_valid_0 & _T_26 ? _GEN_668 : _GEN_578; // @[IssueArbiter.scala 136:70]
  wire  _GEN_713 = issue_valid_0 & _T_26 ? _GEN_669 : _GEN_579; // @[IssueArbiter.scala 136:70]
  wire [63:0] _GEN_716 = issue_valid_0 & _T_26 ? _GEN_672 : _GEN_583; // @[IssueArbiter.scala 136:70]
  wire [63:0] _GEN_717 = issue_valid_0 & _T_26 ? _GEN_673 : _GEN_584; // @[IssueArbiter.scala 136:70]
  wire [4:0] _GEN_718 = issue_valid_0 & _T_26 ? _GEN_674 : _GEN_585; // @[IssueArbiter.scala 136:70]
  wire  _GEN_723 = issue_valid_0 & _T_26 ? _GEN_679 : _GEN_590; // @[IssueArbiter.scala 136:70]
  wire [3:0] _GEN_724 = issue_valid_0 & _T_26 ? _GEN_680 : _GEN_591; // @[IssueArbiter.scala 136:70]
  wire  _GEN_725 = issue_valid_0 & _T_26 ? _GEN_681 : _GEN_592; // @[IssueArbiter.scala 136:70]
  wire [1:0] _GEN_726 = issue_valid_0 & _T_26 ? _GEN_682 : _GEN_593; // @[IssueArbiter.scala 136:70]
  wire [1:0] _GEN_727 = issue_valid_0 & _T_26 ? _GEN_683 : _GEN_594; // @[IssueArbiter.scala 136:70]
  wire [63:0] _GEN_732 = issue_valid_0 & _T_26 ? _GEN_688 : _GEN_599; // @[IssueArbiter.scala 136:70]
  wire [63:0] _GEN_733 = issue_valid_0 & _T_26 ? _GEN_689 : _GEN_600; // @[IssueArbiter.scala 136:70]
  wire  _GEN_734 = issue_valid_0 & _T_26 ? _GEN_690 : _GEN_601; // @[IssueArbiter.scala 136:70]
  wire  _GEN_735 = issue_valid_0 & _T_26 ? _GEN_691 : _GEN_602; // @[IssueArbiter.scala 136:70]
  wire [63:0] _GEN_738 = ~mdu_occupy ? io_insts_in_1_pc : _GEN_716; // @[IssueArbiter.scala 143:34 IssueArbiter.scala 144:27]
  wire [63:0] _GEN_739 = ~mdu_occupy ? io_insts_in_1_imm : _GEN_717; // @[IssueArbiter.scala 143:34 IssueArbiter.scala 144:27]
  wire [4:0] _GEN_740 = ~mdu_occupy ? io_insts_in_1_rd : _GEN_718; // @[IssueArbiter.scala 143:34 IssueArbiter.scala 144:27]
  wire  _GEN_745 = ~mdu_occupy ? io_insts_in_1_alu_expand : _GEN_723; // @[IssueArbiter.scala 143:34 IssueArbiter.scala 144:27]
  wire [3:0] _GEN_746 = ~mdu_occupy ? io_insts_in_1_alu_op : _GEN_724; // @[IssueArbiter.scala 143:34 IssueArbiter.scala 144:27]
  wire  _GEN_747 = ~mdu_occupy ? io_insts_in_1_write_dest : _GEN_725; // @[IssueArbiter.scala 143:34 IssueArbiter.scala 144:27]
  wire [1:0] _GEN_748 = ~mdu_occupy ? io_insts_in_1_src_b : _GEN_726; // @[IssueArbiter.scala 143:34 IssueArbiter.scala 144:27]
  wire [1:0] _GEN_749 = ~mdu_occupy ? io_insts_in_1_src_a : _GEN_727; // @[IssueArbiter.scala 143:34 IssueArbiter.scala 144:27]
  wire [63:0] _GEN_754 = ~mdu_occupy ? io_rss_in_1 : _GEN_732; // @[IssueArbiter.scala 143:34 IssueArbiter.scala 145:25]
  wire [63:0] _GEN_755 = ~mdu_occupy ? io_rts_in_1 : _GEN_733; // @[IssueArbiter.scala 143:34 IssueArbiter.scala 146:25]
  wire  _GEN_756 = ~mdu_occupy | _GEN_734; // @[IssueArbiter.scala 143:34 IssueArbiter.scala 147:29]
  wire  _GEN_757 = ~mdu_occupy | _GEN_735; // @[IssueArbiter.scala 143:34 IssueArbiter.scala 148:32]
  wire [63:0] _GEN_758 = ~alu_occupy ? io_insts_in_1_target_pc : _GEN_692; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire  _GEN_759 = ~alu_occupy ? io_insts_in_1_predict_taken : _GEN_693; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire [63:0] _GEN_760 = ~alu_occupy ? io_insts_in_1_pc : _GEN_694; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire [63:0] _GEN_761 = ~alu_occupy ? io_insts_in_1_imm : _GEN_695; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire [4:0] _GEN_762 = ~alu_occupy ? io_insts_in_1_rd : _GEN_696; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire [4:0] _GEN_764 = ~alu_occupy ? io_insts_in_1_rs1 : _GEN_698; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire [1:0] _GEN_765 = ~alu_occupy ? io_insts_in_1_write_src : _GEN_699; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire  _GEN_767 = ~alu_occupy ? io_insts_in_1_alu_expand : _GEN_701; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire [3:0] _GEN_768 = ~alu_occupy ? io_insts_in_1_alu_op : _GEN_702; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire  _GEN_769 = ~alu_occupy ? io_insts_in_1_write_dest : _GEN_703; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire [1:0] _GEN_770 = ~alu_occupy ? io_insts_in_1_src_b : _GEN_704; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire [1:0] _GEN_771 = ~alu_occupy ? io_insts_in_1_src_a : _GEN_705; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire [3:0] _GEN_772 = ~alu_occupy ? io_insts_in_1_branch_type : _GEN_706; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire [1:0] _GEN_773 = ~alu_occupy ? io_insts_in_1_alu_mdu_lsu : _GEN_707; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire [2:0] _GEN_774 = ~alu_occupy ? io_insts_in_1_next_pc : _GEN_708; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire  _GEN_775 = ~alu_occupy ? io_insts_in_1_illegal : _GEN_709; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 138:27]
  wire [63:0] _GEN_776 = ~alu_occupy ? io_rss_in_1 : _GEN_710; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 139:25]
  wire [63:0] _GEN_777 = ~alu_occupy ? io_rts_in_1 : _GEN_711; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 140:25]
  wire  _GEN_778 = ~alu_occupy | _GEN_712; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 141:29]
  wire  _GEN_779 = ~alu_occupy | _GEN_713; // @[IssueArbiter.scala 137:27 IssueArbiter.scala 142:32]
  wire [63:0] _GEN_782 = ~alu_occupy ? _GEN_716 : _GEN_738; // @[IssueArbiter.scala 137:27]
  wire [63:0] _GEN_783 = ~alu_occupy ? _GEN_717 : _GEN_739; // @[IssueArbiter.scala 137:27]
  wire [4:0] _GEN_784 = ~alu_occupy ? _GEN_718 : _GEN_740; // @[IssueArbiter.scala 137:27]
  wire  _GEN_789 = ~alu_occupy ? _GEN_723 : _GEN_745; // @[IssueArbiter.scala 137:27]
  wire [3:0] _GEN_790 = ~alu_occupy ? _GEN_724 : _GEN_746; // @[IssueArbiter.scala 137:27]
  wire  _GEN_791 = ~alu_occupy ? _GEN_725 : _GEN_747; // @[IssueArbiter.scala 137:27]
  wire [1:0] _GEN_792 = ~alu_occupy ? _GEN_726 : _GEN_748; // @[IssueArbiter.scala 137:27]
  wire [1:0] _GEN_793 = ~alu_occupy ? _GEN_727 : _GEN_749; // @[IssueArbiter.scala 137:27]
  wire [63:0] _GEN_798 = ~alu_occupy ? _GEN_732 : _GEN_754; // @[IssueArbiter.scala 137:27]
  wire [63:0] _GEN_799 = ~alu_occupy ? _GEN_733 : _GEN_755; // @[IssueArbiter.scala 137:27]
  wire  _GEN_800 = ~alu_occupy ? _GEN_734 : _GEN_756; // @[IssueArbiter.scala 137:27]
  wire  _GEN_801 = ~alu_occupy ? _GEN_735 : _GEN_757; // @[IssueArbiter.scala 137:27]
  wire [63:0] _GEN_802 = issue_valid_1 & _T_27 ? _GEN_758 : _GEN_692; // @[IssueArbiter.scala 136:70]
  wire  _GEN_803 = issue_valid_1 & _T_27 ? _GEN_759 : _GEN_693; // @[IssueArbiter.scala 136:70]
  wire [63:0] _GEN_804 = issue_valid_1 & _T_27 ? _GEN_760 : _GEN_694; // @[IssueArbiter.scala 136:70]
  wire [63:0] _GEN_805 = issue_valid_1 & _T_27 ? _GEN_761 : _GEN_695; // @[IssueArbiter.scala 136:70]
  wire [4:0] _GEN_806 = issue_valid_1 & _T_27 ? _GEN_762 : _GEN_696; // @[IssueArbiter.scala 136:70]
  wire [4:0] _GEN_808 = issue_valid_1 & _T_27 ? _GEN_764 : _GEN_698; // @[IssueArbiter.scala 136:70]
  wire [1:0] _GEN_809 = issue_valid_1 & _T_27 ? _GEN_765 : _GEN_699; // @[IssueArbiter.scala 136:70]
  wire  _GEN_811 = issue_valid_1 & _T_27 ? _GEN_767 : _GEN_701; // @[IssueArbiter.scala 136:70]
  wire [3:0] _GEN_812 = issue_valid_1 & _T_27 ? _GEN_768 : _GEN_702; // @[IssueArbiter.scala 136:70]
  wire  _GEN_813 = issue_valid_1 & _T_27 ? _GEN_769 : _GEN_703; // @[IssueArbiter.scala 136:70]
  wire [1:0] _GEN_814 = issue_valid_1 & _T_27 ? _GEN_770 : _GEN_704; // @[IssueArbiter.scala 136:70]
  wire [1:0] _GEN_815 = issue_valid_1 & _T_27 ? _GEN_771 : _GEN_705; // @[IssueArbiter.scala 136:70]
  wire [3:0] _GEN_816 = issue_valid_1 & _T_27 ? _GEN_772 : _GEN_706; // @[IssueArbiter.scala 136:70]
  wire [1:0] _GEN_817 = issue_valid_1 & _T_27 ? _GEN_773 : _GEN_707; // @[IssueArbiter.scala 136:70]
  wire [2:0] _GEN_818 = issue_valid_1 & _T_27 ? _GEN_774 : _GEN_708; // @[IssueArbiter.scala 136:70]
  wire  _GEN_819 = issue_valid_1 & _T_27 ? _GEN_775 : _GEN_709; // @[IssueArbiter.scala 136:70]
  wire [63:0] _GEN_820 = issue_valid_1 & _T_27 ? _GEN_776 : _GEN_710; // @[IssueArbiter.scala 136:70]
  wire [63:0] _GEN_821 = issue_valid_1 & _T_27 ? _GEN_777 : _GEN_711; // @[IssueArbiter.scala 136:70]
  wire  _GEN_822 = issue_valid_1 & _T_27 ? _GEN_778 : _GEN_712; // @[IssueArbiter.scala 136:70]
  wire  _GEN_823 = issue_valid_1 & _T_27 ? _GEN_779 : _GEN_713; // @[IssueArbiter.scala 136:70]
  wire [63:0] _GEN_826 = issue_valid_1 & _T_27 ? _GEN_782 : _GEN_716; // @[IssueArbiter.scala 136:70]
  wire [63:0] _GEN_827 = issue_valid_1 & _T_27 ? _GEN_783 : _GEN_717; // @[IssueArbiter.scala 136:70]
  wire [4:0] _GEN_828 = issue_valid_1 & _T_27 ? _GEN_784 : _GEN_718; // @[IssueArbiter.scala 136:70]
  wire  _GEN_833 = issue_valid_1 & _T_27 ? _GEN_789 : _GEN_723; // @[IssueArbiter.scala 136:70]
  wire [3:0] _GEN_834 = issue_valid_1 & _T_27 ? _GEN_790 : _GEN_724; // @[IssueArbiter.scala 136:70]
  wire  _GEN_835 = issue_valid_1 & _T_27 ? _GEN_791 : _GEN_725; // @[IssueArbiter.scala 136:70]
  wire [1:0] _GEN_836 = issue_valid_1 & _T_27 ? _GEN_792 : _GEN_726; // @[IssueArbiter.scala 136:70]
  wire [1:0] _GEN_837 = issue_valid_1 & _T_27 ? _GEN_793 : _GEN_727; // @[IssueArbiter.scala 136:70]
  wire [63:0] _GEN_842 = issue_valid_1 & _T_27 ? _GEN_798 : _GEN_732; // @[IssueArbiter.scala 136:70]
  wire [63:0] _GEN_843 = issue_valid_1 & _T_27 ? _GEN_799 : _GEN_733; // @[IssueArbiter.scala 136:70]
  wire  _GEN_844 = issue_valid_1 & _T_27 ? _GEN_800 : _GEN_734; // @[IssueArbiter.scala 136:70]
  wire  _GEN_845 = issue_valid_1 & _T_27 ? _GEN_801 : _GEN_735; // @[IssueArbiter.scala 136:70]
  wire  _GEN_866 = issue_valid_0 & issue_valid_1 & io_insts_in_0_alu_mdu_lsu == io_insts_in_1_alu_mdu_lsu ? 1'h0 :
    _GEN_822; // @[IssueArbiter.scala 191:105 IssueArbiter.scala 195:25]
  wire  _GEN_888 = issue_valid_0 & issue_valid_1 & io_insts_in_0_alu_mdu_lsu == io_insts_in_1_alu_mdu_lsu | _GEN_844; // @[IssueArbiter.scala 191:105 IssueArbiter.scala 200:25]
  assign io_rss_out_0 = issue_valid_0 & issue_valid_1 & io_insts_in_0_alu_mdu_lsu == io_insts_in_1_alu_mdu_lsu ?
    io_rss_in_0 : _GEN_820; // @[IssueArbiter.scala 191:105 IssueArbiter.scala 193:21]
  assign io_rss_out_1 = issue_valid_0 & issue_valid_1 & io_insts_in_0_alu_mdu_lsu == io_insts_in_1_alu_mdu_lsu ?
    io_rss_in_1 : _GEN_842; // @[IssueArbiter.scala 191:105 IssueArbiter.scala 198:21]
  assign io_rss_out_2 = issue_valid_1 ? _GEN_554 : _GEN_199; // @[IssueArbiter.scala 107:26]
  assign io_rts_out_0 = issue_valid_0 & issue_valid_1 & io_insts_in_0_alu_mdu_lsu == io_insts_in_1_alu_mdu_lsu ?
    io_rts_in_0 : _GEN_821; // @[IssueArbiter.scala 191:105 IssueArbiter.scala 194:21]
  assign io_rts_out_1 = issue_valid_0 & issue_valid_1 & io_insts_in_0_alu_mdu_lsu == io_insts_in_1_alu_mdu_lsu ?
    io_rts_in_1 : _GEN_843; // @[IssueArbiter.scala 191:105 IssueArbiter.scala 199:21]
  assign io_rts_out_2 = issue_valid_1 ? _GEN_555 : _GEN_200; // @[IssueArbiter.scala 107:26]
  assign io_insts_out_0_illegal = issue_valid_0 & issue_valid_1 & io_insts_in_0_alu_mdu_lsu == io_insts_in_1_alu_mdu_lsu
     ? io_insts_in_0_illegal : _GEN_819; // @[IssueArbiter.scala 191:105 IssueArbiter.scala 192:23]
  assign io_insts_out_0_next_pc = issue_valid_0 & issue_valid_1 & io_insts_in_0_alu_mdu_lsu == io_insts_in_1_alu_mdu_lsu
     ? io_insts_in_0_next_pc : _GEN_818; // @[IssueArbiter.scala 191:105 IssueArbiter.scala 192:23]
  assign io_insts_out_0_alu_mdu_lsu = issue_valid_0 & issue_valid_1 & io_insts_in_0_alu_mdu_lsu ==
    io_insts_in_1_alu_mdu_lsu ? io_insts_in_0_alu_mdu_lsu : _GEN_817; // @[IssueArbiter.scala 191:105 IssueArbiter.scala 192:23]
  assign io_insts_out_0_branch_type = issue_valid_0 & issue_valid_1 & io_insts_in_0_alu_mdu_lsu ==
    io_insts_in_1_alu_mdu_lsu ? io_insts_in_0_branch_type : _GEN_816; // @[IssueArbiter.scala 191:105 IssueArbiter.scala 192:23]
  assign io_insts_out_0_src_a = issue_valid_0 & issue_valid_1 & io_insts_in_0_alu_mdu_lsu == io_insts_in_1_alu_mdu_lsu
     ? io_insts_in_0_src_a : _GEN_815; // @[IssueArbiter.scala 191:105 IssueArbiter.scala 192:23]
  assign io_insts_out_0_src_b = issue_valid_0 & issue_valid_1 & io_insts_in_0_alu_mdu_lsu == io_insts_in_1_alu_mdu_lsu
     ? io_insts_in_0_src_b : _GEN_814; // @[IssueArbiter.scala 191:105 IssueArbiter.scala 192:23]
  assign io_insts_out_0_write_dest = issue_valid_0 & issue_valid_1 & io_insts_in_0_alu_mdu_lsu ==
    io_insts_in_1_alu_mdu_lsu ? io_insts_in_0_write_dest : _GEN_813; // @[IssueArbiter.scala 191:105 IssueArbiter.scala 192:23]
  assign io_insts_out_0_alu_op = issue_valid_0 & issue_valid_1 & io_insts_in_0_alu_mdu_lsu == io_insts_in_1_alu_mdu_lsu
     ? io_insts_in_0_alu_op : _GEN_812; // @[IssueArbiter.scala 191:105 IssueArbiter.scala 192:23]
  assign io_insts_out_0_alu_expand = issue_valid_0 & issue_valid_1 & io_insts_in_0_alu_mdu_lsu ==
    io_insts_in_1_alu_mdu_lsu ? io_insts_in_0_alu_expand : _GEN_811; // @[IssueArbiter.scala 191:105 IssueArbiter.scala 192:23]
  assign io_insts_out_0_write_src = issue_valid_0 & issue_valid_1 & io_insts_in_0_alu_mdu_lsu ==
    io_insts_in_1_alu_mdu_lsu ? io_insts_in_0_write_src : _GEN_809; // @[IssueArbiter.scala 191:105 IssueArbiter.scala 192:23]
  assign io_insts_out_0_rs1 = issue_valid_0 & issue_valid_1 & io_insts_in_0_alu_mdu_lsu == io_insts_in_1_alu_mdu_lsu ?
    io_insts_in_0_rs1 : _GEN_808; // @[IssueArbiter.scala 191:105 IssueArbiter.scala 192:23]
  assign io_insts_out_0_rd = issue_valid_0 & issue_valid_1 & io_insts_in_0_alu_mdu_lsu == io_insts_in_1_alu_mdu_lsu ?
    io_insts_in_0_rd : _GEN_806; // @[IssueArbiter.scala 191:105 IssueArbiter.scala 192:23]
  assign io_insts_out_0_imm = issue_valid_0 & issue_valid_1 & io_insts_in_0_alu_mdu_lsu == io_insts_in_1_alu_mdu_lsu ?
    io_insts_in_0_imm : _GEN_805; // @[IssueArbiter.scala 191:105 IssueArbiter.scala 192:23]
  assign io_insts_out_0_pc = issue_valid_0 & issue_valid_1 & io_insts_in_0_alu_mdu_lsu == io_insts_in_1_alu_mdu_lsu ?
    io_insts_in_0_pc : _GEN_804; // @[IssueArbiter.scala 191:105 IssueArbiter.scala 192:23]
  assign io_insts_out_0_predict_taken = issue_valid_0 & issue_valid_1 & io_insts_in_0_alu_mdu_lsu ==
    io_insts_in_1_alu_mdu_lsu ? io_insts_in_0_predict_taken : _GEN_803; // @[IssueArbiter.scala 191:105 IssueArbiter.scala 192:23]
  assign io_insts_out_0_target_pc = issue_valid_0 & issue_valid_1 & io_insts_in_0_alu_mdu_lsu ==
    io_insts_in_1_alu_mdu_lsu ? io_insts_in_0_target_pc : _GEN_802; // @[IssueArbiter.scala 191:105 IssueArbiter.scala 192:23]
  assign io_insts_out_1_src_a = issue_valid_0 & issue_valid_1 & io_insts_in_0_alu_mdu_lsu == io_insts_in_1_alu_mdu_lsu
     ? io_insts_in_1_src_a : _GEN_837; // @[IssueArbiter.scala 191:105 IssueArbiter.scala 197:23]
  assign io_insts_out_1_src_b = issue_valid_0 & issue_valid_1 & io_insts_in_0_alu_mdu_lsu == io_insts_in_1_alu_mdu_lsu
     ? io_insts_in_1_src_b : _GEN_836; // @[IssueArbiter.scala 191:105 IssueArbiter.scala 197:23]
  assign io_insts_out_1_write_dest = issue_valid_0 & issue_valid_1 & io_insts_in_0_alu_mdu_lsu ==
    io_insts_in_1_alu_mdu_lsu ? io_insts_in_1_write_dest : _GEN_835; // @[IssueArbiter.scala 191:105 IssueArbiter.scala 197:23]
  assign io_insts_out_1_alu_op = issue_valid_0 & issue_valid_1 & io_insts_in_0_alu_mdu_lsu == io_insts_in_1_alu_mdu_lsu
     ? io_insts_in_1_alu_op : _GEN_834; // @[IssueArbiter.scala 191:105 IssueArbiter.scala 197:23]
  assign io_insts_out_1_alu_expand = issue_valid_0 & issue_valid_1 & io_insts_in_0_alu_mdu_lsu ==
    io_insts_in_1_alu_mdu_lsu ? io_insts_in_1_alu_expand : _GEN_833; // @[IssueArbiter.scala 191:105 IssueArbiter.scala 197:23]
  assign io_insts_out_1_rd = issue_valid_0 & issue_valid_1 & io_insts_in_0_alu_mdu_lsu == io_insts_in_1_alu_mdu_lsu ?
    io_insts_in_1_rd : _GEN_828; // @[IssueArbiter.scala 191:105 IssueArbiter.scala 197:23]
  assign io_insts_out_1_imm = issue_valid_0 & issue_valid_1 & io_insts_in_0_alu_mdu_lsu == io_insts_in_1_alu_mdu_lsu ?
    io_insts_in_1_imm : _GEN_827; // @[IssueArbiter.scala 191:105 IssueArbiter.scala 197:23]
  assign io_insts_out_1_pc = issue_valid_0 & issue_valid_1 & io_insts_in_0_alu_mdu_lsu == io_insts_in_1_alu_mdu_lsu ?
    io_insts_in_1_pc : _GEN_826; // @[IssueArbiter.scala 191:105 IssueArbiter.scala 197:23]
  assign io_insts_out_2_write_dest = issue_valid_1 ? _GEN_547 : _GEN_192; // @[IssueArbiter.scala 107:26]
  assign io_insts_out_2_mem_width = issue_valid_1 ? _GEN_544 : _GEN_189; // @[IssueArbiter.scala 107:26]
  assign io_insts_out_2_rd = issue_valid_1 ? _GEN_540 : _GEN_185; // @[IssueArbiter.scala 107:26]
  assign io_insts_out_2_imm = issue_valid_1 ? _GEN_539 : _GEN_184; // @[IssueArbiter.scala 107:26]
  assign io_insts_out_2_pc = issue_valid_1 ? _GEN_538 : _GEN_183; // @[IssueArbiter.scala 107:26]
  assign io_issue_num = issue_valid_0 ? _GEN_1 : 2'h0; // @[IssueArbiter.scala 75:108 IssueArbiter.scala 74:16]
  assign io_issue_fu_valid_0 = issue_valid_0 & issue_valid_1 & io_insts_in_0_alu_mdu_lsu == io_insts_in_1_alu_mdu_lsu |
    _GEN_823; // @[IssueArbiter.scala 191:105 IssueArbiter.scala 196:28]
  assign io_issue_fu_valid_1 = issue_valid_0 & issue_valid_1 & io_insts_in_0_alu_mdu_lsu == io_insts_in_1_alu_mdu_lsu |
    _GEN_845; // @[IssueArbiter.scala 191:105 IssueArbiter.scala 201:28]
  assign io_issue_fu_valid_2 = issue_valid_1 ? _GEN_557 : _GEN_202; // @[IssueArbiter.scala 107:26]
  assign io_insts_order_0 = {{1'd0}, _GEN_866}; // @[IssueArbiter.scala 191:105 IssueArbiter.scala 195:25]
  assign io_insts_order_1 = {{1'd0}, _GEN_888}; // @[IssueArbiter.scala 191:105 IssueArbiter.scala 200:25]
  assign io_insts_order_2 = {{1'd0}, _GEN_624}; // @[IssueArbiter.scala 107:26]
endmodule
module ysyx_210134_RegFile(
  input         clock,
  input         reset,
  input  [4:0]  io_rs_addr_vec_0,
  input  [4:0]  io_rs_addr_vec_1,
  input  [4:0]  io_rs_addr_vec_2,
  input  [4:0]  io_rs_addr_vec_3,
  output [63:0] io_rs_data_vec_0,
  output [63:0] io_rs_data_vec_1,
  output [63:0] io_rs_data_vec_2,
  output [63:0] io_rs_data_vec_3,
  input         io_wen_vec_0,
  input         io_wen_vec_1,
  input  [4:0]  io_rd_addr_vec_0,
  input  [4:0]  io_rd_addr_vec_1,
  input  [63:0] io_rd_data_vec_0,
  input  [63:0] io_rd_data_vec_1
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
  reg [63:0] regs_0; // @[RegFile.scala 20:21]
  reg [63:0] regs_1; // @[RegFile.scala 20:21]
  reg [63:0] regs_2; // @[RegFile.scala 20:21]
  reg [63:0] regs_3; // @[RegFile.scala 20:21]
  reg [63:0] regs_4; // @[RegFile.scala 20:21]
  reg [63:0] regs_5; // @[RegFile.scala 20:21]
  reg [63:0] regs_6; // @[RegFile.scala 20:21]
  reg [63:0] regs_7; // @[RegFile.scala 20:21]
  reg [63:0] regs_8; // @[RegFile.scala 20:21]
  reg [63:0] regs_9; // @[RegFile.scala 20:21]
  reg [63:0] regs_10; // @[RegFile.scala 20:21]
  reg [63:0] regs_11; // @[RegFile.scala 20:21]
  reg [63:0] regs_12; // @[RegFile.scala 20:21]
  reg [63:0] regs_13; // @[RegFile.scala 20:21]
  reg [63:0] regs_14; // @[RegFile.scala 20:21]
  reg [63:0] regs_15; // @[RegFile.scala 20:21]
  reg [63:0] regs_16; // @[RegFile.scala 20:21]
  reg [63:0] regs_17; // @[RegFile.scala 20:21]
  reg [63:0] regs_18; // @[RegFile.scala 20:21]
  reg [63:0] regs_19; // @[RegFile.scala 20:21]
  reg [63:0] regs_20; // @[RegFile.scala 20:21]
  reg [63:0] regs_21; // @[RegFile.scala 20:21]
  reg [63:0] regs_22; // @[RegFile.scala 20:21]
  reg [63:0] regs_23; // @[RegFile.scala 20:21]
  reg [63:0] regs_24; // @[RegFile.scala 20:21]
  reg [63:0] regs_25; // @[RegFile.scala 20:21]
  reg [63:0] regs_26; // @[RegFile.scala 20:21]
  reg [63:0] regs_27; // @[RegFile.scala 20:21]
  reg [63:0] regs_28; // @[RegFile.scala 20:21]
  reg [63:0] regs_29; // @[RegFile.scala 20:21]
  reg [63:0] regs_30; // @[RegFile.scala 20:21]
  reg [63:0] regs_31; // @[RegFile.scala 20:21]
  wire [63:0] _GEN_1 = 5'h1 == io_rs_addr_vec_0 ? regs_1 : regs_0; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_2 = 5'h2 == io_rs_addr_vec_0 ? regs_2 : _GEN_1; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_3 = 5'h3 == io_rs_addr_vec_0 ? regs_3 : _GEN_2; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_4 = 5'h4 == io_rs_addr_vec_0 ? regs_4 : _GEN_3; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_5 = 5'h5 == io_rs_addr_vec_0 ? regs_5 : _GEN_4; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_6 = 5'h6 == io_rs_addr_vec_0 ? regs_6 : _GEN_5; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_7 = 5'h7 == io_rs_addr_vec_0 ? regs_7 : _GEN_6; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_8 = 5'h8 == io_rs_addr_vec_0 ? regs_8 : _GEN_7; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_9 = 5'h9 == io_rs_addr_vec_0 ? regs_9 : _GEN_8; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_10 = 5'ha == io_rs_addr_vec_0 ? regs_10 : _GEN_9; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_11 = 5'hb == io_rs_addr_vec_0 ? regs_11 : _GEN_10; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_12 = 5'hc == io_rs_addr_vec_0 ? regs_12 : _GEN_11; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_13 = 5'hd == io_rs_addr_vec_0 ? regs_13 : _GEN_12; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_14 = 5'he == io_rs_addr_vec_0 ? regs_14 : _GEN_13; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_15 = 5'hf == io_rs_addr_vec_0 ? regs_15 : _GEN_14; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_16 = 5'h10 == io_rs_addr_vec_0 ? regs_16 : _GEN_15; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_17 = 5'h11 == io_rs_addr_vec_0 ? regs_17 : _GEN_16; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_18 = 5'h12 == io_rs_addr_vec_0 ? regs_18 : _GEN_17; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_19 = 5'h13 == io_rs_addr_vec_0 ? regs_19 : _GEN_18; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_20 = 5'h14 == io_rs_addr_vec_0 ? regs_20 : _GEN_19; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_21 = 5'h15 == io_rs_addr_vec_0 ? regs_21 : _GEN_20; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_22 = 5'h16 == io_rs_addr_vec_0 ? regs_22 : _GEN_21; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_23 = 5'h17 == io_rs_addr_vec_0 ? regs_23 : _GEN_22; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_24 = 5'h18 == io_rs_addr_vec_0 ? regs_24 : _GEN_23; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_25 = 5'h19 == io_rs_addr_vec_0 ? regs_25 : _GEN_24; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_26 = 5'h1a == io_rs_addr_vec_0 ? regs_26 : _GEN_25; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_27 = 5'h1b == io_rs_addr_vec_0 ? regs_27 : _GEN_26; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_28 = 5'h1c == io_rs_addr_vec_0 ? regs_28 : _GEN_27; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_29 = 5'h1d == io_rs_addr_vec_0 ? regs_29 : _GEN_28; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_30 = 5'h1e == io_rs_addr_vec_0 ? regs_30 : _GEN_29; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_33 = 5'h1 == io_rs_addr_vec_1 ? regs_1 : regs_0; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_34 = 5'h2 == io_rs_addr_vec_1 ? regs_2 : _GEN_33; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_35 = 5'h3 == io_rs_addr_vec_1 ? regs_3 : _GEN_34; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_36 = 5'h4 == io_rs_addr_vec_1 ? regs_4 : _GEN_35; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_37 = 5'h5 == io_rs_addr_vec_1 ? regs_5 : _GEN_36; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_38 = 5'h6 == io_rs_addr_vec_1 ? regs_6 : _GEN_37; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_39 = 5'h7 == io_rs_addr_vec_1 ? regs_7 : _GEN_38; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_40 = 5'h8 == io_rs_addr_vec_1 ? regs_8 : _GEN_39; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_41 = 5'h9 == io_rs_addr_vec_1 ? regs_9 : _GEN_40; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_42 = 5'ha == io_rs_addr_vec_1 ? regs_10 : _GEN_41; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_43 = 5'hb == io_rs_addr_vec_1 ? regs_11 : _GEN_42; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_44 = 5'hc == io_rs_addr_vec_1 ? regs_12 : _GEN_43; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_45 = 5'hd == io_rs_addr_vec_1 ? regs_13 : _GEN_44; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_46 = 5'he == io_rs_addr_vec_1 ? regs_14 : _GEN_45; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_47 = 5'hf == io_rs_addr_vec_1 ? regs_15 : _GEN_46; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_48 = 5'h10 == io_rs_addr_vec_1 ? regs_16 : _GEN_47; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_49 = 5'h11 == io_rs_addr_vec_1 ? regs_17 : _GEN_48; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_50 = 5'h12 == io_rs_addr_vec_1 ? regs_18 : _GEN_49; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_51 = 5'h13 == io_rs_addr_vec_1 ? regs_19 : _GEN_50; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_52 = 5'h14 == io_rs_addr_vec_1 ? regs_20 : _GEN_51; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_53 = 5'h15 == io_rs_addr_vec_1 ? regs_21 : _GEN_52; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_54 = 5'h16 == io_rs_addr_vec_1 ? regs_22 : _GEN_53; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_55 = 5'h17 == io_rs_addr_vec_1 ? regs_23 : _GEN_54; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_56 = 5'h18 == io_rs_addr_vec_1 ? regs_24 : _GEN_55; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_57 = 5'h19 == io_rs_addr_vec_1 ? regs_25 : _GEN_56; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_58 = 5'h1a == io_rs_addr_vec_1 ? regs_26 : _GEN_57; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_59 = 5'h1b == io_rs_addr_vec_1 ? regs_27 : _GEN_58; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_60 = 5'h1c == io_rs_addr_vec_1 ? regs_28 : _GEN_59; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_61 = 5'h1d == io_rs_addr_vec_1 ? regs_29 : _GEN_60; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_62 = 5'h1e == io_rs_addr_vec_1 ? regs_30 : _GEN_61; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_65 = 5'h1 == io_rs_addr_vec_2 ? regs_1 : regs_0; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_66 = 5'h2 == io_rs_addr_vec_2 ? regs_2 : _GEN_65; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_67 = 5'h3 == io_rs_addr_vec_2 ? regs_3 : _GEN_66; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_68 = 5'h4 == io_rs_addr_vec_2 ? regs_4 : _GEN_67; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_69 = 5'h5 == io_rs_addr_vec_2 ? regs_5 : _GEN_68; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_70 = 5'h6 == io_rs_addr_vec_2 ? regs_6 : _GEN_69; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_71 = 5'h7 == io_rs_addr_vec_2 ? regs_7 : _GEN_70; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_72 = 5'h8 == io_rs_addr_vec_2 ? regs_8 : _GEN_71; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_73 = 5'h9 == io_rs_addr_vec_2 ? regs_9 : _GEN_72; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_74 = 5'ha == io_rs_addr_vec_2 ? regs_10 : _GEN_73; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_75 = 5'hb == io_rs_addr_vec_2 ? regs_11 : _GEN_74; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_76 = 5'hc == io_rs_addr_vec_2 ? regs_12 : _GEN_75; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_77 = 5'hd == io_rs_addr_vec_2 ? regs_13 : _GEN_76; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_78 = 5'he == io_rs_addr_vec_2 ? regs_14 : _GEN_77; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_79 = 5'hf == io_rs_addr_vec_2 ? regs_15 : _GEN_78; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_80 = 5'h10 == io_rs_addr_vec_2 ? regs_16 : _GEN_79; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_81 = 5'h11 == io_rs_addr_vec_2 ? regs_17 : _GEN_80; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_82 = 5'h12 == io_rs_addr_vec_2 ? regs_18 : _GEN_81; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_83 = 5'h13 == io_rs_addr_vec_2 ? regs_19 : _GEN_82; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_84 = 5'h14 == io_rs_addr_vec_2 ? regs_20 : _GEN_83; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_85 = 5'h15 == io_rs_addr_vec_2 ? regs_21 : _GEN_84; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_86 = 5'h16 == io_rs_addr_vec_2 ? regs_22 : _GEN_85; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_87 = 5'h17 == io_rs_addr_vec_2 ? regs_23 : _GEN_86; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_88 = 5'h18 == io_rs_addr_vec_2 ? regs_24 : _GEN_87; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_89 = 5'h19 == io_rs_addr_vec_2 ? regs_25 : _GEN_88; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_90 = 5'h1a == io_rs_addr_vec_2 ? regs_26 : _GEN_89; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_91 = 5'h1b == io_rs_addr_vec_2 ? regs_27 : _GEN_90; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_92 = 5'h1c == io_rs_addr_vec_2 ? regs_28 : _GEN_91; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_93 = 5'h1d == io_rs_addr_vec_2 ? regs_29 : _GEN_92; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_94 = 5'h1e == io_rs_addr_vec_2 ? regs_30 : _GEN_93; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_97 = 5'h1 == io_rs_addr_vec_3 ? regs_1 : regs_0; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_98 = 5'h2 == io_rs_addr_vec_3 ? regs_2 : _GEN_97; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_99 = 5'h3 == io_rs_addr_vec_3 ? regs_3 : _GEN_98; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_100 = 5'h4 == io_rs_addr_vec_3 ? regs_4 : _GEN_99; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_101 = 5'h5 == io_rs_addr_vec_3 ? regs_5 : _GEN_100; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_102 = 5'h6 == io_rs_addr_vec_3 ? regs_6 : _GEN_101; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_103 = 5'h7 == io_rs_addr_vec_3 ? regs_7 : _GEN_102; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_104 = 5'h8 == io_rs_addr_vec_3 ? regs_8 : _GEN_103; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_105 = 5'h9 == io_rs_addr_vec_3 ? regs_9 : _GEN_104; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_106 = 5'ha == io_rs_addr_vec_3 ? regs_10 : _GEN_105; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_107 = 5'hb == io_rs_addr_vec_3 ? regs_11 : _GEN_106; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_108 = 5'hc == io_rs_addr_vec_3 ? regs_12 : _GEN_107; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_109 = 5'hd == io_rs_addr_vec_3 ? regs_13 : _GEN_108; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_110 = 5'he == io_rs_addr_vec_3 ? regs_14 : _GEN_109; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_111 = 5'hf == io_rs_addr_vec_3 ? regs_15 : _GEN_110; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_112 = 5'h10 == io_rs_addr_vec_3 ? regs_16 : _GEN_111; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_113 = 5'h11 == io_rs_addr_vec_3 ? regs_17 : _GEN_112; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_114 = 5'h12 == io_rs_addr_vec_3 ? regs_18 : _GEN_113; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_115 = 5'h13 == io_rs_addr_vec_3 ? regs_19 : _GEN_114; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_116 = 5'h14 == io_rs_addr_vec_3 ? regs_20 : _GEN_115; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_117 = 5'h15 == io_rs_addr_vec_3 ? regs_21 : _GEN_116; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_118 = 5'h16 == io_rs_addr_vec_3 ? regs_22 : _GEN_117; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_119 = 5'h17 == io_rs_addr_vec_3 ? regs_23 : _GEN_118; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_120 = 5'h18 == io_rs_addr_vec_3 ? regs_24 : _GEN_119; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_121 = 5'h19 == io_rs_addr_vec_3 ? regs_25 : _GEN_120; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_122 = 5'h1a == io_rs_addr_vec_3 ? regs_26 : _GEN_121; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_123 = 5'h1b == io_rs_addr_vec_3 ? regs_27 : _GEN_122; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_124 = 5'h1c == io_rs_addr_vec_3 ? regs_28 : _GEN_123; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_125 = 5'h1d == io_rs_addr_vec_3 ? regs_29 : _GEN_124; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_126 = 5'h1e == io_rs_addr_vec_3 ? regs_30 : _GEN_125; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  wire [63:0] _GEN_128 = 5'h0 == io_rd_addr_vec_0 ? io_rd_data_vec_0 : regs_0; // @[RegFile.scala 26:31 RegFile.scala 26:31 RegFile.scala 20:21]
  wire [63:0] _GEN_129 = 5'h1 == io_rd_addr_vec_0 ? io_rd_data_vec_0 : regs_1; // @[RegFile.scala 26:31 RegFile.scala 26:31 RegFile.scala 20:21]
  wire [63:0] _GEN_130 = 5'h2 == io_rd_addr_vec_0 ? io_rd_data_vec_0 : regs_2; // @[RegFile.scala 26:31 RegFile.scala 26:31 RegFile.scala 20:21]
  wire [63:0] _GEN_131 = 5'h3 == io_rd_addr_vec_0 ? io_rd_data_vec_0 : regs_3; // @[RegFile.scala 26:31 RegFile.scala 26:31 RegFile.scala 20:21]
  wire [63:0] _GEN_132 = 5'h4 == io_rd_addr_vec_0 ? io_rd_data_vec_0 : regs_4; // @[RegFile.scala 26:31 RegFile.scala 26:31 RegFile.scala 20:21]
  wire [63:0] _GEN_133 = 5'h5 == io_rd_addr_vec_0 ? io_rd_data_vec_0 : regs_5; // @[RegFile.scala 26:31 RegFile.scala 26:31 RegFile.scala 20:21]
  wire [63:0] _GEN_134 = 5'h6 == io_rd_addr_vec_0 ? io_rd_data_vec_0 : regs_6; // @[RegFile.scala 26:31 RegFile.scala 26:31 RegFile.scala 20:21]
  wire [63:0] _GEN_135 = 5'h7 == io_rd_addr_vec_0 ? io_rd_data_vec_0 : regs_7; // @[RegFile.scala 26:31 RegFile.scala 26:31 RegFile.scala 20:21]
  wire [63:0] _GEN_136 = 5'h8 == io_rd_addr_vec_0 ? io_rd_data_vec_0 : regs_8; // @[RegFile.scala 26:31 RegFile.scala 26:31 RegFile.scala 20:21]
  wire [63:0] _GEN_137 = 5'h9 == io_rd_addr_vec_0 ? io_rd_data_vec_0 : regs_9; // @[RegFile.scala 26:31 RegFile.scala 26:31 RegFile.scala 20:21]
  wire [63:0] _GEN_138 = 5'ha == io_rd_addr_vec_0 ? io_rd_data_vec_0 : regs_10; // @[RegFile.scala 26:31 RegFile.scala 26:31 RegFile.scala 20:21]
  wire [63:0] _GEN_139 = 5'hb == io_rd_addr_vec_0 ? io_rd_data_vec_0 : regs_11; // @[RegFile.scala 26:31 RegFile.scala 26:31 RegFile.scala 20:21]
  wire [63:0] _GEN_140 = 5'hc == io_rd_addr_vec_0 ? io_rd_data_vec_0 : regs_12; // @[RegFile.scala 26:31 RegFile.scala 26:31 RegFile.scala 20:21]
  wire [63:0] _GEN_141 = 5'hd == io_rd_addr_vec_0 ? io_rd_data_vec_0 : regs_13; // @[RegFile.scala 26:31 RegFile.scala 26:31 RegFile.scala 20:21]
  wire [63:0] _GEN_142 = 5'he == io_rd_addr_vec_0 ? io_rd_data_vec_0 : regs_14; // @[RegFile.scala 26:31 RegFile.scala 26:31 RegFile.scala 20:21]
  wire [63:0] _GEN_143 = 5'hf == io_rd_addr_vec_0 ? io_rd_data_vec_0 : regs_15; // @[RegFile.scala 26:31 RegFile.scala 26:31 RegFile.scala 20:21]
  wire [63:0] _GEN_144 = 5'h10 == io_rd_addr_vec_0 ? io_rd_data_vec_0 : regs_16; // @[RegFile.scala 26:31 RegFile.scala 26:31 RegFile.scala 20:21]
  wire [63:0] _GEN_145 = 5'h11 == io_rd_addr_vec_0 ? io_rd_data_vec_0 : regs_17; // @[RegFile.scala 26:31 RegFile.scala 26:31 RegFile.scala 20:21]
  wire [63:0] _GEN_146 = 5'h12 == io_rd_addr_vec_0 ? io_rd_data_vec_0 : regs_18; // @[RegFile.scala 26:31 RegFile.scala 26:31 RegFile.scala 20:21]
  wire [63:0] _GEN_147 = 5'h13 == io_rd_addr_vec_0 ? io_rd_data_vec_0 : regs_19; // @[RegFile.scala 26:31 RegFile.scala 26:31 RegFile.scala 20:21]
  wire [63:0] _GEN_148 = 5'h14 == io_rd_addr_vec_0 ? io_rd_data_vec_0 : regs_20; // @[RegFile.scala 26:31 RegFile.scala 26:31 RegFile.scala 20:21]
  wire [63:0] _GEN_149 = 5'h15 == io_rd_addr_vec_0 ? io_rd_data_vec_0 : regs_21; // @[RegFile.scala 26:31 RegFile.scala 26:31 RegFile.scala 20:21]
  wire [63:0] _GEN_150 = 5'h16 == io_rd_addr_vec_0 ? io_rd_data_vec_0 : regs_22; // @[RegFile.scala 26:31 RegFile.scala 26:31 RegFile.scala 20:21]
  wire [63:0] _GEN_151 = 5'h17 == io_rd_addr_vec_0 ? io_rd_data_vec_0 : regs_23; // @[RegFile.scala 26:31 RegFile.scala 26:31 RegFile.scala 20:21]
  wire [63:0] _GEN_152 = 5'h18 == io_rd_addr_vec_0 ? io_rd_data_vec_0 : regs_24; // @[RegFile.scala 26:31 RegFile.scala 26:31 RegFile.scala 20:21]
  wire [63:0] _GEN_153 = 5'h19 == io_rd_addr_vec_0 ? io_rd_data_vec_0 : regs_25; // @[RegFile.scala 26:31 RegFile.scala 26:31 RegFile.scala 20:21]
  wire [63:0] _GEN_154 = 5'h1a == io_rd_addr_vec_0 ? io_rd_data_vec_0 : regs_26; // @[RegFile.scala 26:31 RegFile.scala 26:31 RegFile.scala 20:21]
  wire [63:0] _GEN_155 = 5'h1b == io_rd_addr_vec_0 ? io_rd_data_vec_0 : regs_27; // @[RegFile.scala 26:31 RegFile.scala 26:31 RegFile.scala 20:21]
  wire [63:0] _GEN_156 = 5'h1c == io_rd_addr_vec_0 ? io_rd_data_vec_0 : regs_28; // @[RegFile.scala 26:31 RegFile.scala 26:31 RegFile.scala 20:21]
  wire [63:0] _GEN_157 = 5'h1d == io_rd_addr_vec_0 ? io_rd_data_vec_0 : regs_29; // @[RegFile.scala 26:31 RegFile.scala 26:31 RegFile.scala 20:21]
  wire [63:0] _GEN_158 = 5'h1e == io_rd_addr_vec_0 ? io_rd_data_vec_0 : regs_30; // @[RegFile.scala 26:31 RegFile.scala 26:31 RegFile.scala 20:21]
  wire [63:0] _GEN_159 = 5'h1f == io_rd_addr_vec_0 ? io_rd_data_vec_0 : regs_31; // @[RegFile.scala 26:31 RegFile.scala 26:31 RegFile.scala 20:21]
  wire [63:0] _GEN_160 = io_wen_vec_0 & |io_rd_addr_vec_0 ? _GEN_128 : regs_0; // @[RegFile.scala 25:50 RegFile.scala 20:21]
  wire [63:0] _GEN_161 = io_wen_vec_0 & |io_rd_addr_vec_0 ? _GEN_129 : regs_1; // @[RegFile.scala 25:50 RegFile.scala 20:21]
  wire [63:0] _GEN_162 = io_wen_vec_0 & |io_rd_addr_vec_0 ? _GEN_130 : regs_2; // @[RegFile.scala 25:50 RegFile.scala 20:21]
  wire [63:0] _GEN_163 = io_wen_vec_0 & |io_rd_addr_vec_0 ? _GEN_131 : regs_3; // @[RegFile.scala 25:50 RegFile.scala 20:21]
  wire [63:0] _GEN_164 = io_wen_vec_0 & |io_rd_addr_vec_0 ? _GEN_132 : regs_4; // @[RegFile.scala 25:50 RegFile.scala 20:21]
  wire [63:0] _GEN_165 = io_wen_vec_0 & |io_rd_addr_vec_0 ? _GEN_133 : regs_5; // @[RegFile.scala 25:50 RegFile.scala 20:21]
  wire [63:0] _GEN_166 = io_wen_vec_0 & |io_rd_addr_vec_0 ? _GEN_134 : regs_6; // @[RegFile.scala 25:50 RegFile.scala 20:21]
  wire [63:0] _GEN_167 = io_wen_vec_0 & |io_rd_addr_vec_0 ? _GEN_135 : regs_7; // @[RegFile.scala 25:50 RegFile.scala 20:21]
  wire [63:0] _GEN_168 = io_wen_vec_0 & |io_rd_addr_vec_0 ? _GEN_136 : regs_8; // @[RegFile.scala 25:50 RegFile.scala 20:21]
  wire [63:0] _GEN_169 = io_wen_vec_0 & |io_rd_addr_vec_0 ? _GEN_137 : regs_9; // @[RegFile.scala 25:50 RegFile.scala 20:21]
  wire [63:0] _GEN_170 = io_wen_vec_0 & |io_rd_addr_vec_0 ? _GEN_138 : regs_10; // @[RegFile.scala 25:50 RegFile.scala 20:21]
  wire [63:0] _GEN_171 = io_wen_vec_0 & |io_rd_addr_vec_0 ? _GEN_139 : regs_11; // @[RegFile.scala 25:50 RegFile.scala 20:21]
  wire [63:0] _GEN_172 = io_wen_vec_0 & |io_rd_addr_vec_0 ? _GEN_140 : regs_12; // @[RegFile.scala 25:50 RegFile.scala 20:21]
  wire [63:0] _GEN_173 = io_wen_vec_0 & |io_rd_addr_vec_0 ? _GEN_141 : regs_13; // @[RegFile.scala 25:50 RegFile.scala 20:21]
  wire [63:0] _GEN_174 = io_wen_vec_0 & |io_rd_addr_vec_0 ? _GEN_142 : regs_14; // @[RegFile.scala 25:50 RegFile.scala 20:21]
  wire [63:0] _GEN_175 = io_wen_vec_0 & |io_rd_addr_vec_0 ? _GEN_143 : regs_15; // @[RegFile.scala 25:50 RegFile.scala 20:21]
  wire [63:0] _GEN_176 = io_wen_vec_0 & |io_rd_addr_vec_0 ? _GEN_144 : regs_16; // @[RegFile.scala 25:50 RegFile.scala 20:21]
  wire [63:0] _GEN_177 = io_wen_vec_0 & |io_rd_addr_vec_0 ? _GEN_145 : regs_17; // @[RegFile.scala 25:50 RegFile.scala 20:21]
  wire [63:0] _GEN_178 = io_wen_vec_0 & |io_rd_addr_vec_0 ? _GEN_146 : regs_18; // @[RegFile.scala 25:50 RegFile.scala 20:21]
  wire [63:0] _GEN_179 = io_wen_vec_0 & |io_rd_addr_vec_0 ? _GEN_147 : regs_19; // @[RegFile.scala 25:50 RegFile.scala 20:21]
  wire [63:0] _GEN_180 = io_wen_vec_0 & |io_rd_addr_vec_0 ? _GEN_148 : regs_20; // @[RegFile.scala 25:50 RegFile.scala 20:21]
  wire [63:0] _GEN_181 = io_wen_vec_0 & |io_rd_addr_vec_0 ? _GEN_149 : regs_21; // @[RegFile.scala 25:50 RegFile.scala 20:21]
  wire [63:0] _GEN_182 = io_wen_vec_0 & |io_rd_addr_vec_0 ? _GEN_150 : regs_22; // @[RegFile.scala 25:50 RegFile.scala 20:21]
  wire [63:0] _GEN_183 = io_wen_vec_0 & |io_rd_addr_vec_0 ? _GEN_151 : regs_23; // @[RegFile.scala 25:50 RegFile.scala 20:21]
  wire [63:0] _GEN_184 = io_wen_vec_0 & |io_rd_addr_vec_0 ? _GEN_152 : regs_24; // @[RegFile.scala 25:50 RegFile.scala 20:21]
  wire [63:0] _GEN_185 = io_wen_vec_0 & |io_rd_addr_vec_0 ? _GEN_153 : regs_25; // @[RegFile.scala 25:50 RegFile.scala 20:21]
  wire [63:0] _GEN_186 = io_wen_vec_0 & |io_rd_addr_vec_0 ? _GEN_154 : regs_26; // @[RegFile.scala 25:50 RegFile.scala 20:21]
  wire [63:0] _GEN_187 = io_wen_vec_0 & |io_rd_addr_vec_0 ? _GEN_155 : regs_27; // @[RegFile.scala 25:50 RegFile.scala 20:21]
  wire [63:0] _GEN_188 = io_wen_vec_0 & |io_rd_addr_vec_0 ? _GEN_156 : regs_28; // @[RegFile.scala 25:50 RegFile.scala 20:21]
  wire [63:0] _GEN_189 = io_wen_vec_0 & |io_rd_addr_vec_0 ? _GEN_157 : regs_29; // @[RegFile.scala 25:50 RegFile.scala 20:21]
  wire [63:0] _GEN_190 = io_wen_vec_0 & |io_rd_addr_vec_0 ? _GEN_158 : regs_30; // @[RegFile.scala 25:50 RegFile.scala 20:21]
  wire [63:0] _GEN_191 = io_wen_vec_0 & |io_rd_addr_vec_0 ? _GEN_159 : regs_31; // @[RegFile.scala 25:50 RegFile.scala 20:21]
  assign io_rs_data_vec_0 = 5'h1f == io_rs_addr_vec_0 ? regs_31 : _GEN_30; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  assign io_rs_data_vec_1 = 5'h1f == io_rs_addr_vec_1 ? regs_31 : _GEN_62; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  assign io_rs_data_vec_2 = 5'h1f == io_rs_addr_vec_2 ? regs_31 : _GEN_94; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  assign io_rs_data_vec_3 = 5'h1f == io_rs_addr_vec_3 ? regs_31 : _GEN_126; // @[RegFile.scala 22:23 RegFile.scala 22:23]
  always @(posedge clock) begin
    if (reset) begin // @[RegFile.scala 20:21]
      regs_0 <= 64'h0; // @[RegFile.scala 20:21]
    end else if (io_wen_vec_1 & |io_rd_addr_vec_1) begin // @[RegFile.scala 25:50]
      if (5'h0 == io_rd_addr_vec_1) begin // @[RegFile.scala 26:31]
        regs_0 <= io_rd_data_vec_1; // @[RegFile.scala 26:31]
      end else begin
        regs_0 <= _GEN_160;
      end
    end else begin
      regs_0 <= _GEN_160;
    end
    if (reset) begin // @[RegFile.scala 20:21]
      regs_1 <= 64'h0; // @[RegFile.scala 20:21]
    end else if (io_wen_vec_1 & |io_rd_addr_vec_1) begin // @[RegFile.scala 25:50]
      if (5'h1 == io_rd_addr_vec_1) begin // @[RegFile.scala 26:31]
        regs_1 <= io_rd_data_vec_1; // @[RegFile.scala 26:31]
      end else begin
        regs_1 <= _GEN_161;
      end
    end else begin
      regs_1 <= _GEN_161;
    end
    if (reset) begin // @[RegFile.scala 20:21]
      regs_2 <= 64'h0; // @[RegFile.scala 20:21]
    end else if (io_wen_vec_1 & |io_rd_addr_vec_1) begin // @[RegFile.scala 25:50]
      if (5'h2 == io_rd_addr_vec_1) begin // @[RegFile.scala 26:31]
        regs_2 <= io_rd_data_vec_1; // @[RegFile.scala 26:31]
      end else begin
        regs_2 <= _GEN_162;
      end
    end else begin
      regs_2 <= _GEN_162;
    end
    if (reset) begin // @[RegFile.scala 20:21]
      regs_3 <= 64'h0; // @[RegFile.scala 20:21]
    end else if (io_wen_vec_1 & |io_rd_addr_vec_1) begin // @[RegFile.scala 25:50]
      if (5'h3 == io_rd_addr_vec_1) begin // @[RegFile.scala 26:31]
        regs_3 <= io_rd_data_vec_1; // @[RegFile.scala 26:31]
      end else begin
        regs_3 <= _GEN_163;
      end
    end else begin
      regs_3 <= _GEN_163;
    end
    if (reset) begin // @[RegFile.scala 20:21]
      regs_4 <= 64'h0; // @[RegFile.scala 20:21]
    end else if (io_wen_vec_1 & |io_rd_addr_vec_1) begin // @[RegFile.scala 25:50]
      if (5'h4 == io_rd_addr_vec_1) begin // @[RegFile.scala 26:31]
        regs_4 <= io_rd_data_vec_1; // @[RegFile.scala 26:31]
      end else begin
        regs_4 <= _GEN_164;
      end
    end else begin
      regs_4 <= _GEN_164;
    end
    if (reset) begin // @[RegFile.scala 20:21]
      regs_5 <= 64'h0; // @[RegFile.scala 20:21]
    end else if (io_wen_vec_1 & |io_rd_addr_vec_1) begin // @[RegFile.scala 25:50]
      if (5'h5 == io_rd_addr_vec_1) begin // @[RegFile.scala 26:31]
        regs_5 <= io_rd_data_vec_1; // @[RegFile.scala 26:31]
      end else begin
        regs_5 <= _GEN_165;
      end
    end else begin
      regs_5 <= _GEN_165;
    end
    if (reset) begin // @[RegFile.scala 20:21]
      regs_6 <= 64'h0; // @[RegFile.scala 20:21]
    end else if (io_wen_vec_1 & |io_rd_addr_vec_1) begin // @[RegFile.scala 25:50]
      if (5'h6 == io_rd_addr_vec_1) begin // @[RegFile.scala 26:31]
        regs_6 <= io_rd_data_vec_1; // @[RegFile.scala 26:31]
      end else begin
        regs_6 <= _GEN_166;
      end
    end else begin
      regs_6 <= _GEN_166;
    end
    if (reset) begin // @[RegFile.scala 20:21]
      regs_7 <= 64'h0; // @[RegFile.scala 20:21]
    end else if (io_wen_vec_1 & |io_rd_addr_vec_1) begin // @[RegFile.scala 25:50]
      if (5'h7 == io_rd_addr_vec_1) begin // @[RegFile.scala 26:31]
        regs_7 <= io_rd_data_vec_1; // @[RegFile.scala 26:31]
      end else begin
        regs_7 <= _GEN_167;
      end
    end else begin
      regs_7 <= _GEN_167;
    end
    if (reset) begin // @[RegFile.scala 20:21]
      regs_8 <= 64'h0; // @[RegFile.scala 20:21]
    end else if (io_wen_vec_1 & |io_rd_addr_vec_1) begin // @[RegFile.scala 25:50]
      if (5'h8 == io_rd_addr_vec_1) begin // @[RegFile.scala 26:31]
        regs_8 <= io_rd_data_vec_1; // @[RegFile.scala 26:31]
      end else begin
        regs_8 <= _GEN_168;
      end
    end else begin
      regs_8 <= _GEN_168;
    end
    if (reset) begin // @[RegFile.scala 20:21]
      regs_9 <= 64'h0; // @[RegFile.scala 20:21]
    end else if (io_wen_vec_1 & |io_rd_addr_vec_1) begin // @[RegFile.scala 25:50]
      if (5'h9 == io_rd_addr_vec_1) begin // @[RegFile.scala 26:31]
        regs_9 <= io_rd_data_vec_1; // @[RegFile.scala 26:31]
      end else begin
        regs_9 <= _GEN_169;
      end
    end else begin
      regs_9 <= _GEN_169;
    end
    if (reset) begin // @[RegFile.scala 20:21]
      regs_10 <= 64'h0; // @[RegFile.scala 20:21]
    end else if (io_wen_vec_1 & |io_rd_addr_vec_1) begin // @[RegFile.scala 25:50]
      if (5'ha == io_rd_addr_vec_1) begin // @[RegFile.scala 26:31]
        regs_10 <= io_rd_data_vec_1; // @[RegFile.scala 26:31]
      end else begin
        regs_10 <= _GEN_170;
      end
    end else begin
      regs_10 <= _GEN_170;
    end
    if (reset) begin // @[RegFile.scala 20:21]
      regs_11 <= 64'h0; // @[RegFile.scala 20:21]
    end else if (io_wen_vec_1 & |io_rd_addr_vec_1) begin // @[RegFile.scala 25:50]
      if (5'hb == io_rd_addr_vec_1) begin // @[RegFile.scala 26:31]
        regs_11 <= io_rd_data_vec_1; // @[RegFile.scala 26:31]
      end else begin
        regs_11 <= _GEN_171;
      end
    end else begin
      regs_11 <= _GEN_171;
    end
    if (reset) begin // @[RegFile.scala 20:21]
      regs_12 <= 64'h0; // @[RegFile.scala 20:21]
    end else if (io_wen_vec_1 & |io_rd_addr_vec_1) begin // @[RegFile.scala 25:50]
      if (5'hc == io_rd_addr_vec_1) begin // @[RegFile.scala 26:31]
        regs_12 <= io_rd_data_vec_1; // @[RegFile.scala 26:31]
      end else begin
        regs_12 <= _GEN_172;
      end
    end else begin
      regs_12 <= _GEN_172;
    end
    if (reset) begin // @[RegFile.scala 20:21]
      regs_13 <= 64'h0; // @[RegFile.scala 20:21]
    end else if (io_wen_vec_1 & |io_rd_addr_vec_1) begin // @[RegFile.scala 25:50]
      if (5'hd == io_rd_addr_vec_1) begin // @[RegFile.scala 26:31]
        regs_13 <= io_rd_data_vec_1; // @[RegFile.scala 26:31]
      end else begin
        regs_13 <= _GEN_173;
      end
    end else begin
      regs_13 <= _GEN_173;
    end
    if (reset) begin // @[RegFile.scala 20:21]
      regs_14 <= 64'h0; // @[RegFile.scala 20:21]
    end else if (io_wen_vec_1 & |io_rd_addr_vec_1) begin // @[RegFile.scala 25:50]
      if (5'he == io_rd_addr_vec_1) begin // @[RegFile.scala 26:31]
        regs_14 <= io_rd_data_vec_1; // @[RegFile.scala 26:31]
      end else begin
        regs_14 <= _GEN_174;
      end
    end else begin
      regs_14 <= _GEN_174;
    end
    if (reset) begin // @[RegFile.scala 20:21]
      regs_15 <= 64'h0; // @[RegFile.scala 20:21]
    end else if (io_wen_vec_1 & |io_rd_addr_vec_1) begin // @[RegFile.scala 25:50]
      if (5'hf == io_rd_addr_vec_1) begin // @[RegFile.scala 26:31]
        regs_15 <= io_rd_data_vec_1; // @[RegFile.scala 26:31]
      end else begin
        regs_15 <= _GEN_175;
      end
    end else begin
      regs_15 <= _GEN_175;
    end
    if (reset) begin // @[RegFile.scala 20:21]
      regs_16 <= 64'h0; // @[RegFile.scala 20:21]
    end else if (io_wen_vec_1 & |io_rd_addr_vec_1) begin // @[RegFile.scala 25:50]
      if (5'h10 == io_rd_addr_vec_1) begin // @[RegFile.scala 26:31]
        regs_16 <= io_rd_data_vec_1; // @[RegFile.scala 26:31]
      end else begin
        regs_16 <= _GEN_176;
      end
    end else begin
      regs_16 <= _GEN_176;
    end
    if (reset) begin // @[RegFile.scala 20:21]
      regs_17 <= 64'h0; // @[RegFile.scala 20:21]
    end else if (io_wen_vec_1 & |io_rd_addr_vec_1) begin // @[RegFile.scala 25:50]
      if (5'h11 == io_rd_addr_vec_1) begin // @[RegFile.scala 26:31]
        regs_17 <= io_rd_data_vec_1; // @[RegFile.scala 26:31]
      end else begin
        regs_17 <= _GEN_177;
      end
    end else begin
      regs_17 <= _GEN_177;
    end
    if (reset) begin // @[RegFile.scala 20:21]
      regs_18 <= 64'h0; // @[RegFile.scala 20:21]
    end else if (io_wen_vec_1 & |io_rd_addr_vec_1) begin // @[RegFile.scala 25:50]
      if (5'h12 == io_rd_addr_vec_1) begin // @[RegFile.scala 26:31]
        regs_18 <= io_rd_data_vec_1; // @[RegFile.scala 26:31]
      end else begin
        regs_18 <= _GEN_178;
      end
    end else begin
      regs_18 <= _GEN_178;
    end
    if (reset) begin // @[RegFile.scala 20:21]
      regs_19 <= 64'h0; // @[RegFile.scala 20:21]
    end else if (io_wen_vec_1 & |io_rd_addr_vec_1) begin // @[RegFile.scala 25:50]
      if (5'h13 == io_rd_addr_vec_1) begin // @[RegFile.scala 26:31]
        regs_19 <= io_rd_data_vec_1; // @[RegFile.scala 26:31]
      end else begin
        regs_19 <= _GEN_179;
      end
    end else begin
      regs_19 <= _GEN_179;
    end
    if (reset) begin // @[RegFile.scala 20:21]
      regs_20 <= 64'h0; // @[RegFile.scala 20:21]
    end else if (io_wen_vec_1 & |io_rd_addr_vec_1) begin // @[RegFile.scala 25:50]
      if (5'h14 == io_rd_addr_vec_1) begin // @[RegFile.scala 26:31]
        regs_20 <= io_rd_data_vec_1; // @[RegFile.scala 26:31]
      end else begin
        regs_20 <= _GEN_180;
      end
    end else begin
      regs_20 <= _GEN_180;
    end
    if (reset) begin // @[RegFile.scala 20:21]
      regs_21 <= 64'h0; // @[RegFile.scala 20:21]
    end else if (io_wen_vec_1 & |io_rd_addr_vec_1) begin // @[RegFile.scala 25:50]
      if (5'h15 == io_rd_addr_vec_1) begin // @[RegFile.scala 26:31]
        regs_21 <= io_rd_data_vec_1; // @[RegFile.scala 26:31]
      end else begin
        regs_21 <= _GEN_181;
      end
    end else begin
      regs_21 <= _GEN_181;
    end
    if (reset) begin // @[RegFile.scala 20:21]
      regs_22 <= 64'h0; // @[RegFile.scala 20:21]
    end else if (io_wen_vec_1 & |io_rd_addr_vec_1) begin // @[RegFile.scala 25:50]
      if (5'h16 == io_rd_addr_vec_1) begin // @[RegFile.scala 26:31]
        regs_22 <= io_rd_data_vec_1; // @[RegFile.scala 26:31]
      end else begin
        regs_22 <= _GEN_182;
      end
    end else begin
      regs_22 <= _GEN_182;
    end
    if (reset) begin // @[RegFile.scala 20:21]
      regs_23 <= 64'h0; // @[RegFile.scala 20:21]
    end else if (io_wen_vec_1 & |io_rd_addr_vec_1) begin // @[RegFile.scala 25:50]
      if (5'h17 == io_rd_addr_vec_1) begin // @[RegFile.scala 26:31]
        regs_23 <= io_rd_data_vec_1; // @[RegFile.scala 26:31]
      end else begin
        regs_23 <= _GEN_183;
      end
    end else begin
      regs_23 <= _GEN_183;
    end
    if (reset) begin // @[RegFile.scala 20:21]
      regs_24 <= 64'h0; // @[RegFile.scala 20:21]
    end else if (io_wen_vec_1 & |io_rd_addr_vec_1) begin // @[RegFile.scala 25:50]
      if (5'h18 == io_rd_addr_vec_1) begin // @[RegFile.scala 26:31]
        regs_24 <= io_rd_data_vec_1; // @[RegFile.scala 26:31]
      end else begin
        regs_24 <= _GEN_184;
      end
    end else begin
      regs_24 <= _GEN_184;
    end
    if (reset) begin // @[RegFile.scala 20:21]
      regs_25 <= 64'h0; // @[RegFile.scala 20:21]
    end else if (io_wen_vec_1 & |io_rd_addr_vec_1) begin // @[RegFile.scala 25:50]
      if (5'h19 == io_rd_addr_vec_1) begin // @[RegFile.scala 26:31]
        regs_25 <= io_rd_data_vec_1; // @[RegFile.scala 26:31]
      end else begin
        regs_25 <= _GEN_185;
      end
    end else begin
      regs_25 <= _GEN_185;
    end
    if (reset) begin // @[RegFile.scala 20:21]
      regs_26 <= 64'h0; // @[RegFile.scala 20:21]
    end else if (io_wen_vec_1 & |io_rd_addr_vec_1) begin // @[RegFile.scala 25:50]
      if (5'h1a == io_rd_addr_vec_1) begin // @[RegFile.scala 26:31]
        regs_26 <= io_rd_data_vec_1; // @[RegFile.scala 26:31]
      end else begin
        regs_26 <= _GEN_186;
      end
    end else begin
      regs_26 <= _GEN_186;
    end
    if (reset) begin // @[RegFile.scala 20:21]
      regs_27 <= 64'h0; // @[RegFile.scala 20:21]
    end else if (io_wen_vec_1 & |io_rd_addr_vec_1) begin // @[RegFile.scala 25:50]
      if (5'h1b == io_rd_addr_vec_1) begin // @[RegFile.scala 26:31]
        regs_27 <= io_rd_data_vec_1; // @[RegFile.scala 26:31]
      end else begin
        regs_27 <= _GEN_187;
      end
    end else begin
      regs_27 <= _GEN_187;
    end
    if (reset) begin // @[RegFile.scala 20:21]
      regs_28 <= 64'h0; // @[RegFile.scala 20:21]
    end else if (io_wen_vec_1 & |io_rd_addr_vec_1) begin // @[RegFile.scala 25:50]
      if (5'h1c == io_rd_addr_vec_1) begin // @[RegFile.scala 26:31]
        regs_28 <= io_rd_data_vec_1; // @[RegFile.scala 26:31]
      end else begin
        regs_28 <= _GEN_188;
      end
    end else begin
      regs_28 <= _GEN_188;
    end
    if (reset) begin // @[RegFile.scala 20:21]
      regs_29 <= 64'h0; // @[RegFile.scala 20:21]
    end else if (io_wen_vec_1 & |io_rd_addr_vec_1) begin // @[RegFile.scala 25:50]
      if (5'h1d == io_rd_addr_vec_1) begin // @[RegFile.scala 26:31]
        regs_29 <= io_rd_data_vec_1; // @[RegFile.scala 26:31]
      end else begin
        regs_29 <= _GEN_189;
      end
    end else begin
      regs_29 <= _GEN_189;
    end
    if (reset) begin // @[RegFile.scala 20:21]
      regs_30 <= 64'h0; // @[RegFile.scala 20:21]
    end else if (io_wen_vec_1 & |io_rd_addr_vec_1) begin // @[RegFile.scala 25:50]
      if (5'h1e == io_rd_addr_vec_1) begin // @[RegFile.scala 26:31]
        regs_30 <= io_rd_data_vec_1; // @[RegFile.scala 26:31]
      end else begin
        regs_30 <= _GEN_190;
      end
    end else begin
      regs_30 <= _GEN_190;
    end
    if (reset) begin // @[RegFile.scala 20:21]
      regs_31 <= 64'h0; // @[RegFile.scala 20:21]
    end else if (io_wen_vec_1 & |io_rd_addr_vec_1) begin // @[RegFile.scala 25:50]
      if (5'h1f == io_rd_addr_vec_1) begin // @[RegFile.scala 26:31]
        regs_31 <= io_rd_data_vec_1; // @[RegFile.scala 26:31]
      end else begin
        regs_31 <= _GEN_191;
      end
    end else begin
      regs_31 <= _GEN_191;
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
module ysyx_210134_CSR(
  input         clock,
  input         reset,
  input  [63:0] io_common_io_in,
  input         io_common_io_wen,
  input  [11:0] io_common_io_num,
  output [63:0] io_common_io_out,
  input         io_event_io_exception_vec_2,
  input         io_event_io_exception_vec_3,
  input         io_event_io_exception_vec_4,
  input         io_event_io_exception_vec_6,
  input         io_event_io_deal_with_int,
  input         io_event_io_is_mret,
  input         io_event_io_is_sret,
  input         io_event_io_is_ecall,
  input  [63:0] io_event_io_bad_address,
  input  [63:0] io_event_io_epc,
  output        io_event_io_call_for_int,
  output        io_event_io_except_kill,
  output [63:0] io_event_io_redirect_pc
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
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
  reg [31:0] _RAND_24;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] current_mode; // @[CSR.scala 99:29]
  wire  true_deal_with_int = io_event_io_deal_with_int & io_event_io_call_for_int; // @[CSR.scala 100:54]
  reg [63:0] mstatus; // @[CSR.scala 114:27]
  reg [63:0] medeleg; // @[CSR.scala 115:27]
  reg [63:0] mideleg; // @[CSR.scala 116:27]
  reg [63:0] mie; // @[CSR.scala 117:27]
  reg [63:0] mtvec; // @[CSR.scala 118:27]
  reg [63:0] mcounteren; // @[CSR.scala 119:27]
  reg [63:0] mscratch; // @[CSR.scala 121:25]
  reg [63:0] mepc; // @[CSR.scala 122:25]
  reg [63:0] mcause; // @[CSR.scala 123:25]
  reg [63:0] mtval; // @[CSR.scala 124:25]
  reg [63:0] mipReg; // @[CSR.scala 126:24]
  reg [63:0] mip; // @[CSR.scala 130:24]
  reg [63:0] mcycle; // @[CSR.scala 133:30]
  reg [63:0] mtime; // @[CSR.scala 134:30]
  reg [63:0] mtimecmp; // @[CSR.scala 135:30]
  reg [63:0] mcountinhibit; // @[CSR.scala 136:30]
  reg [63:0] stvec; // @[CSR.scala 143:27]
  reg [63:0] scounteren; // @[CSR.scala 144:27]
  reg [63:0] sscratch; // @[CSR.scala 146:25]
  reg [63:0] sepc; // @[CSR.scala 147:25]
  reg [63:0] scause; // @[CSR.scala 148:25]
  reg [63:0] stval; // @[CSR.scala 149:25]
  reg [63:0] satp; // @[CSR.scala 152:21]
  wire [63:0] _T_38 = 64'h222 & mideleg; // @[CSR.scala 204:50]
  wire [63:0] _mcycle_T_1 = mcycle + 64'h1; // @[CSR.scala 222:20]
  wire  _wen_T_3 = io_common_io_in[63:60] == 4'h0 | io_common_io_in[63:60] == 4'h8; // @[CSRSpec.scala 328:18]
  wire  wen = io_common_io_wen & (io_common_io_num != 12'h180 | _wen_T_3); // @[CSR.scala 229:32]
  wire [63:0] _rdata_T_10 = mie & _T_38; // @[CSRRegMap.scala 39:84]
  wire [63:0] _rdata_T_11 = mipReg & _T_38; // @[CSRRegMap.scala 39:84]
  wire [63:0] _rdata_T_13 = mstatus & 64'h80000003000de122; // @[CSRRegMap.scala 39:84]
  wire  _rdata_T_30 = 12'hffe == io_common_io_num; // @[LookupTree.scala 8:34]
  wire  _rdata_T_31 = 12'hf12 == io_common_io_num; // @[LookupTree.scala 8:34]
  wire  _rdata_T_32 = 12'h180 == io_common_io_num; // @[LookupTree.scala 8:34]
  wire  _rdata_T_33 = 12'h140 == io_common_io_num; // @[LookupTree.scala 8:34]
  wire  _rdata_T_34 = 12'h302 == io_common_io_num; // @[LookupTree.scala 8:34]
  wire  _rdata_T_35 = 12'h105 == io_common_io_num; // @[LookupTree.scala 8:34]
  wire  _rdata_T_36 = 12'h141 == io_common_io_num; // @[LookupTree.scala 8:34]
  wire  _rdata_T_37 = 12'h342 == io_common_io_num; // @[LookupTree.scala 8:34]
  wire  _rdata_T_38 = 12'h306 == io_common_io_num; // @[LookupTree.scala 8:34]
  wire  _rdata_T_39 = 12'hf11 == io_common_io_num; // @[LookupTree.scala 8:34]
  wire  _rdata_T_40 = 12'h104 == io_common_io_num; // @[LookupTree.scala 8:34]
  wire  _rdata_T_41 = 12'h144 == io_common_io_num; // @[LookupTree.scala 8:34]
  wire  _rdata_T_42 = 12'hfff == io_common_io_num; // @[LookupTree.scala 8:34]
  wire  _rdata_T_43 = 12'h100 == io_common_io_num; // @[LookupTree.scala 8:34]
  wire  _rdata_T_44 = 12'h305 == io_common_io_num; // @[LookupTree.scala 8:34]
  wire  _rdata_T_45 = 12'h304 == io_common_io_num; // @[LookupTree.scala 8:34]
  wire  _rdata_T_46 = 12'h143 == io_common_io_num; // @[LookupTree.scala 8:34]
  wire  _rdata_T_47 = 12'h301 == io_common_io_num; // @[LookupTree.scala 8:34]
  wire  _rdata_T_48 = 12'h300 == io_common_io_num; // @[LookupTree.scala 8:34]
  wire  _rdata_T_49 = 12'hb00 == io_common_io_num; // @[LookupTree.scala 8:34]
  wire  _rdata_T_50 = 12'h344 == io_common_io_num; // @[LookupTree.scala 8:34]
  wire  _rdata_T_51 = 12'h303 == io_common_io_num; // @[LookupTree.scala 8:34]
  wire  _rdata_T_52 = 12'hf13 == io_common_io_num; // @[LookupTree.scala 8:34]
  wire  _rdata_T_53 = 12'h340 == io_common_io_num; // @[LookupTree.scala 8:34]
  wire  _rdata_T_54 = 12'h320 == io_common_io_num; // @[LookupTree.scala 8:34]
  wire  _rdata_T_55 = 12'hf14 == io_common_io_num; // @[LookupTree.scala 8:34]
  wire  _rdata_T_56 = 12'h341 == io_common_io_num; // @[LookupTree.scala 8:34]
  wire  _rdata_T_57 = 12'h343 == io_common_io_num; // @[LookupTree.scala 8:34]
  wire  _rdata_T_58 = 12'h106 == io_common_io_num; // @[LookupTree.scala 8:34]
  wire  _rdata_T_59 = 12'h142 == io_common_io_num; // @[LookupTree.scala 8:34]
  wire [63:0] _rdata_T_60 = _rdata_T_30 ? mtimecmp : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _rdata_T_62 = _rdata_T_32 ? satp : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _rdata_T_63 = _rdata_T_33 ? sscratch : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _rdata_T_64 = _rdata_T_34 ? medeleg : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _rdata_T_65 = _rdata_T_35 ? stvec : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _rdata_T_66 = _rdata_T_36 ? sepc : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _rdata_T_67 = _rdata_T_37 ? mcause : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _rdata_T_68 = _rdata_T_38 ? mcounteren : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _rdata_T_70 = _rdata_T_40 ? _rdata_T_10 : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _rdata_T_71 = _rdata_T_41 ? _rdata_T_11 : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _rdata_T_72 = _rdata_T_42 ? mtime : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _rdata_T_73 = _rdata_T_43 ? _rdata_T_13 : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _rdata_T_74 = _rdata_T_44 ? mtvec : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _rdata_T_75 = _rdata_T_45 ? mie : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _rdata_T_76 = _rdata_T_46 ? stval : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _rdata_T_78 = _rdata_T_48 ? mstatus : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _rdata_T_79 = _rdata_T_49 ? mcycle : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _rdata_T_80 = _rdata_T_50 ? mipReg : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _rdata_T_81 = _rdata_T_51 ? mideleg : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _rdata_T_83 = _rdata_T_53 ? mscratch : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _rdata_T_84 = _rdata_T_54 ? mcountinhibit : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _rdata_T_86 = _rdata_T_56 ? mepc : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _rdata_T_87 = _rdata_T_57 ? mtval : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _rdata_T_88 = _rdata_T_58 ? scounteren : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _rdata_T_89 = _rdata_T_59 ? scause : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _rdata_T_91 = _rdata_T_60 | _rdata_T_62; // @[Mux.scala 27:72]
  wire [63:0] _rdata_T_92 = _rdata_T_91 | _rdata_T_63; // @[Mux.scala 27:72]
  wire [63:0] _rdata_T_93 = _rdata_T_92 | _rdata_T_64; // @[Mux.scala 27:72]
  wire [63:0] _rdata_T_94 = _rdata_T_93 | _rdata_T_65; // @[Mux.scala 27:72]
  wire [63:0] _rdata_T_95 = _rdata_T_94 | _rdata_T_66; // @[Mux.scala 27:72]
  wire [63:0] _rdata_T_96 = _rdata_T_95 | _rdata_T_67; // @[Mux.scala 27:72]
  wire [63:0] _rdata_T_97 = _rdata_T_96 | _rdata_T_68; // @[Mux.scala 27:72]
  wire [63:0] _rdata_T_99 = _rdata_T_97 | _rdata_T_70; // @[Mux.scala 27:72]
  wire [63:0] _rdata_T_100 = _rdata_T_99 | _rdata_T_71; // @[Mux.scala 27:72]
  wire [63:0] _rdata_T_101 = _rdata_T_100 | _rdata_T_72; // @[Mux.scala 27:72]
  wire [63:0] _rdata_T_102 = _rdata_T_101 | _rdata_T_73; // @[Mux.scala 27:72]
  wire [63:0] _rdata_T_103 = _rdata_T_102 | _rdata_T_74; // @[Mux.scala 27:72]
  wire [63:0] _rdata_T_104 = _rdata_T_103 | _rdata_T_75; // @[Mux.scala 27:72]
  wire [63:0] _rdata_T_105 = _rdata_T_104 | _rdata_T_76; // @[Mux.scala 27:72]
  wire [63:0] _rdata_T_107 = _rdata_T_105 | _rdata_T_78; // @[Mux.scala 27:72]
  wire [63:0] _rdata_T_108 = _rdata_T_107 | _rdata_T_79; // @[Mux.scala 27:72]
  wire [63:0] _rdata_T_109 = _rdata_T_108 | _rdata_T_80; // @[Mux.scala 27:72]
  wire [63:0] _rdata_T_110 = _rdata_T_109 | _rdata_T_81; // @[Mux.scala 27:72]
  wire [63:0] _rdata_T_112 = _rdata_T_110 | _rdata_T_83; // @[Mux.scala 27:72]
  wire [63:0] _rdata_T_113 = _rdata_T_112 | _rdata_T_84; // @[Mux.scala 27:72]
  wire [63:0] _rdata_T_115 = _rdata_T_113 | _rdata_T_86; // @[Mux.scala 27:72]
  wire [63:0] _rdata_T_116 = _rdata_T_115 | _rdata_T_87; // @[Mux.scala 27:72]
  wire [63:0] _rdata_T_117 = _rdata_T_116 | _rdata_T_88; // @[Mux.scala 27:72]
  wire [63:0] rdata = _rdata_T_117 | _rdata_T_89; // @[Mux.scala 27:72]
  wire [63:0] _medeleg_T = io_common_io_in & 64'hbbff; // @[CSRRegMap.scala 8:14]
  wire [63:0] _medeleg_T_2 = medeleg & 64'h4400; // @[CSRRegMap.scala 8:37]
  wire [63:0] _medeleg_T_3 = _medeleg_T | _medeleg_T_2; // @[CSRRegMap.scala 8:26]
  wire [63:0] _GEN_5 = wen & io_common_io_num == 12'h141 ? io_common_io_in : sepc; // @[CSRRegMap.scala 41:71 CSRRegMap.scala 42:11 CSR.scala 147:25]
  wire [63:0] _GEN_6 = wen & io_common_io_num == 12'h342 ? io_common_io_in : mcause; // @[CSRRegMap.scala 41:71 CSRRegMap.scala 42:11 CSR.scala 123:25]
  wire [63:0] _mie_T_1 = io_common_io_in & _T_38; // @[CSRRegMap.scala 8:14]
  wire [63:0] _mie_T_2 = ~_T_38; // @[CSRRegMap.scala 8:40]
  wire [63:0] _mie_T_3 = mie & _mie_T_2; // @[CSRRegMap.scala 8:37]
  wire [63:0] _mie_T_4 = _mie_T_1 | _mie_T_3; // @[CSRRegMap.scala 8:26]
  wire [63:0] _mipReg_T_3 = mipReg & _mie_T_2; // @[CSRRegMap.scala 8:37]
  wire [63:0] _mipReg_T_4 = _mie_T_1 | _mipReg_T_3; // @[CSRRegMap.scala 8:26]
  wire [63:0] _mstatus_T_1 = io_common_io_in & 64'hc6122; // @[CSRRegMap.scala 8:14]
  wire [63:0] _mstatus_T_3 = mstatus & 64'h39edd; // @[CSRRegMap.scala 8:37]
  wire [63:0] _mstatus_T_4 = _mstatus_T_1 | _mstatus_T_3; // @[CSRRegMap.scala 8:26]
  wire [1:0] mstatus_mstatus_old_FS = _mstatus_T_4[14:13]; // @[CSRSpec.scala 201:48]
  wire  mstatus_mstatus_new_hi = mstatus_mstatus_old_FS == 2'h3; // @[CSRSpec.scala 202:42]
  wire [62:0] mstatus_mstatus_new_lo = _mstatus_T_4[62:0]; // @[CSRSpec.scala 202:62]
  wire [63:0] mstatus_mstatus_new = {mstatus_mstatus_new_hi,mstatus_mstatus_new_lo}; // @[Cat.scala 30:58]
  wire [63:0] _GEN_11 = wen & io_common_io_num == 12'h100 ? mstatus_mstatus_new : mstatus; // @[CSRRegMap.scala 41:71 CSRRegMap.scala 42:11 CSR.scala 114:27]
  wire [63:0] _GEN_14 = wen & io_common_io_num == 12'h143 ? io_common_io_in : stval; // @[CSRRegMap.scala 41:71 CSRRegMap.scala 42:11 CSR.scala 149:25]
  wire [1:0] mstatus_mstatus_old_1_FS = io_common_io_in[14:13]; // @[CSRSpec.scala 201:48]
  wire  mstatus_mstatus_new_hi_1 = mstatus_mstatus_old_1_FS == 2'h3; // @[CSRSpec.scala 202:42]
  wire [62:0] mstatus_mstatus_new_lo_1 = io_common_io_in[62:0]; // @[CSRSpec.scala 202:62]
  wire [63:0] mstatus_mstatus_new_1 = {mstatus_mstatus_new_hi_1,mstatus_mstatus_new_lo_1}; // @[Cat.scala 30:58]
  wire [63:0] _GEN_15 = wen & io_common_io_num == 12'h300 ? mstatus_mstatus_new_1 : _GEN_11; // @[CSRRegMap.scala 41:71 CSRRegMap.scala 42:11]
  wire [63:0] _mipReg_T_5 = io_common_io_in & 64'h77f; // @[CSRRegMap.scala 8:14]
  wire [63:0] _mipReg_T_7 = mipReg & 64'h80; // @[CSRRegMap.scala 8:37]
  wire [63:0] _mipReg_T_8 = _mipReg_T_5 | _mipReg_T_7; // @[CSRRegMap.scala 8:26]
  wire [63:0] _mideleg_T = io_common_io_in & 64'h222; // @[CSRRegMap.scala 8:14]
  wire [63:0] _mideleg_T_2 = mideleg & 64'h1dd; // @[CSRRegMap.scala 8:37]
  wire [63:0] _mideleg_T_3 = _mideleg_T | _mideleg_T_2; // @[CSRRegMap.scala 8:26]
  wire [63:0] _GEN_20 = wen & io_common_io_num == 12'h341 ? io_common_io_in : mepc; // @[CSRRegMap.scala 41:71 CSRRegMap.scala 42:11 CSR.scala 122:25]
  wire [63:0] _GEN_21 = wen & io_common_io_num == 12'h343 ? io_common_io_in : mtval; // @[CSRRegMap.scala 41:71 CSRRegMap.scala 42:11 CSR.scala 124:25]
  wire [63:0] _GEN_23 = wen & io_common_io_num == 12'h142 ? io_common_io_in : scause; // @[CSRRegMap.scala 41:71 CSRRegMap.scala 42:11 CSR.scala 148:25]
  reg [11:0] int_cause; // @[CSR.scala 302:27]
  wire [11:0] _mip_old_MEIP_T = {{11'd0}, int_cause[11]}; // @[CSR.scala 311:50]
  wire  mip_old_MEIP = true_deal_with_int & _mip_old_MEIP_T[0]; // @[CSR.scala 311:38]
  wire [11:0] _mip_old_SEIP_T = {{9'd0}, int_cause[11:9]}; // @[CSR.scala 312:50]
  wire  mip_old_SEIP = true_deal_with_int & _mip_old_SEIP_T[0]; // @[CSR.scala 312:38]
  wire [11:0] _mip_old_MTIP_T = {{7'd0}, int_cause[11:7]}; // @[CSR.scala 314:50]
  wire  mip_old_MTIP = true_deal_with_int & _mip_old_MTIP_T[0]; // @[CSR.scala 314:38]
  wire [11:0] _mip_old_STIP_T = {{5'd0}, int_cause[11:5]}; // @[CSR.scala 315:50]
  wire  mip_old_STIP = true_deal_with_int & _mip_old_STIP_T[0]; // @[CSR.scala 315:38]
  wire [11:0] _mip_old_MSIP_T = {{3'd0}, int_cause[11:3]}; // @[CSR.scala 313:50]
  wire  mip_old_MSIP = true_deal_with_int & _mip_old_MSIP_T[0]; // @[CSR.scala 313:38]
  wire [5:0] mip_new_lo = {mip_old_STIP,1'h0,mip_old_MSIP,3'h0}; // @[CSR.scala 336:28]
  wire [63:0] _mip_new_T = {52'h0,mip_old_MEIP,1'h0,mip_old_SEIP,1'h0,mip_old_MTIP,1'h0,mip_new_lo}; // @[CSR.scala 336:28]
  wire [63:0] interrupt_deleg = mideleg & mip; // @[CSR.scala 318:33]
  wire  mip_mask_11 = ~interrupt_deleg[9]; // @[CSR.scala 329:22]
  wire  mip_mask_9 = ~mip_mask_11; // @[CSR.scala 331:22]
  wire  mip_mask_7 = ~interrupt_deleg[5]; // @[CSR.scala 329:22]
  wire  mip_mask_5 = ~mip_mask_7; // @[CSR.scala 331:22]
  wire  mip_mask_3 = ~interrupt_deleg[1]; // @[CSR.scala 329:22]
  wire  mip_mask_1 = ~mip_mask_3; // @[CSR.scala 331:22]
  wire [5:0] mip_new_lo_1 = {mip_mask_5,1'h0,mip_mask_3,1'h0,mip_mask_1,1'h0}; // @[CSR.scala 336:48]
  wire [11:0] _mip_new_T_1 = {mip_mask_11,1'h0,mip_mask_9,1'h0,mip_mask_7,1'h0,mip_new_lo_1}; // @[CSR.scala 336:48]
  wire [63:0] _GEN_56 = {{52'd0}, _mip_new_T_1}; // @[CSR.scala 336:31]
  wire [63:0] _mip_new_T_2 = _mip_new_T & _GEN_56; // @[CSR.scala 336:31]
  wire [63:0] mip_new = _mip_new_T_2 & mie; // @[CSR.scala 336:51]
  wire [63:0] mipOut = mip_new | mip; // @[CSR.scala 337:21]
  wire [63:0] _io_common_io_out_T = mipOut & 64'h222; // @[CSR.scala 236:41]
  wire [63:0] _io_common_io_out_T_2 = _rdata_T_50 ? mipOut : rdata; // @[Mux.scala 80:57]
  wire [63:0] _io_common_io_out_T_4 = _rdata_T_41 ? _io_common_io_out_T : _io_common_io_out_T_2; // @[Mux.scala 80:57]
  wire  old_mstatus_UIE = mstatus[0]; // @[CSR.scala 246:51]
  wire  old_mstatus_SIE = mstatus[1]; // @[CSR.scala 246:51]
  wire  old_mstatus_WPRI2 = mstatus[2]; // @[CSR.scala 246:51]
  wire  old_mstatus_MIE = mstatus[3]; // @[CSR.scala 246:51]
  wire  old_mstatus_UPIE = mstatus[4]; // @[CSR.scala 246:51]
  wire  old_mstatus_SPIE = mstatus[5]; // @[CSR.scala 246:51]
  wire  old_mstatus_WPRI6 = mstatus[6]; // @[CSR.scala 246:51]
  wire  old_mstatus_MPIE = mstatus[7]; // @[CSR.scala 246:51]
  wire  old_mstatus_SPP = mstatus[8]; // @[CSR.scala 246:51]
  wire [1:0] old_mstatus_WPRI9 = mstatus[10:9]; // @[CSR.scala 246:51]
  wire [1:0] old_mstatus_MPP = mstatus[12:11]; // @[CSR.scala 246:51]
  wire [1:0] old_mstatus_FS = mstatus[14:13]; // @[CSR.scala 246:51]
  wire [1:0] old_mstatus_XS = mstatus[16:15]; // @[CSR.scala 246:51]
  wire  old_mstatus_MPRV = mstatus[17]; // @[CSR.scala 246:51]
  wire  old_mstatus_SUM = mstatus[18]; // @[CSR.scala 246:51]
  wire  old_mstatus_MXR = mstatus[19]; // @[CSR.scala 246:51]
  wire  old_mstatus_TVM = mstatus[20]; // @[CSR.scala 246:51]
  wire  old_mstatus_TW = mstatus[21]; // @[CSR.scala 246:51]
  wire  old_mstatus_TSR = mstatus[22]; // @[CSR.scala 246:51]
  wire [8:0] old_mstatus_WPRI23 = mstatus[31:23]; // @[CSR.scala 246:51]
  wire [1:0] old_mstatus_UXL = mstatus[33:32]; // @[CSR.scala 246:51]
  wire [1:0] old_mstatus_SXL = mstatus[35:34]; // @[CSR.scala 246:51]
  wire [26:0] old_mstatus_WPRI36 = mstatus[62:36]; // @[CSR.scala 246:51]
  wire  old_mstatus_SD = mstatus[63]; // @[CSR.scala 246:51]
  wire [5:0] mstatus_lo_lo_1 = {old_mstatus_SPIE,old_mstatus_UPIE,old_mstatus_MPIE,old_mstatus_WPRI2,old_mstatus_SIE,
    old_mstatus_UIE}; // @[CSR.scala 252:34]
  wire [14:0] mstatus_lo_1 = {old_mstatus_FS,2'h0,old_mstatus_WPRI9,old_mstatus_SPP,1'h1,old_mstatus_WPRI6,
    mstatus_lo_lo_1}; // @[CSR.scala 252:34]
  wire [6:0] mstatus_hi_lo_1 = {old_mstatus_TW,old_mstatus_TVM,old_mstatus_MXR,old_mstatus_SUM,old_mstatus_MPRV,
    old_mstatus_XS}; // @[CSR.scala 252:34]
  wire [63:0] _mstatus_T_9 = {old_mstatus_SD,old_mstatus_WPRI36,old_mstatus_SXL,old_mstatus_UXL,old_mstatus_WPRI23,
    old_mstatus_TSR,mstatus_hi_lo_1,mstatus_lo_1}; // @[CSR.scala 252:34]
  wire [63:0] _GEN_26 = io_event_io_is_mret ? mepc : 64'h0; // @[CSR.scala 245:29 CSR.scala 253:16]
  wire [1:0] _current_mode_T = {1'h0,old_mstatus_SPP}; // @[Cat.scala 30:58]
  wire [5:0] mstatus_lo_lo_2 = {1'h1,old_mstatus_UPIE,old_mstatus_MIE,old_mstatus_WPRI2,old_mstatus_SPIE,old_mstatus_UIE
    }; // @[CSR.scala 263:34]
  wire [14:0] mstatus_lo_2 = {old_mstatus_FS,old_mstatus_MPP,old_mstatus_WPRI9,1'h0,old_mstatus_MPIE,old_mstatus_WPRI6,
    mstatus_lo_lo_2}; // @[CSR.scala 263:34]
  wire [63:0] _mstatus_T_10 = {old_mstatus_SD,old_mstatus_WPRI36,old_mstatus_SXL,old_mstatus_UXL,old_mstatus_WPRI23,
    old_mstatus_TSR,mstatus_hi_lo_1,mstatus_lo_2}; // @[CSR.scala 263:34]
  wire [63:0] ret_target = io_event_io_is_sret ? sepc : _GEN_26; // @[CSR.scala 256:29 CSR.scala 264:16]
  wire  _illegal_csr_num_illegalAddr_T_1 = _rdata_T_30 ? 1'h0 : 1'h1; // @[Mux.scala 80:57]
  wire  _illegal_csr_num_illegalAddr_T_3 = _rdata_T_31 ? 1'h0 : _illegal_csr_num_illegalAddr_T_1; // @[Mux.scala 80:57]
  wire  _illegal_csr_num_illegalAddr_T_5 = _rdata_T_32 ? 1'h0 : _illegal_csr_num_illegalAddr_T_3; // @[Mux.scala 80:57]
  wire  _illegal_csr_num_illegalAddr_T_7 = _rdata_T_33 ? 1'h0 : _illegal_csr_num_illegalAddr_T_5; // @[Mux.scala 80:57]
  wire  _illegal_csr_num_illegalAddr_T_9 = _rdata_T_34 ? 1'h0 : _illegal_csr_num_illegalAddr_T_7; // @[Mux.scala 80:57]
  wire  _illegal_csr_num_illegalAddr_T_11 = _rdata_T_35 ? 1'h0 : _illegal_csr_num_illegalAddr_T_9; // @[Mux.scala 80:57]
  wire  _illegal_csr_num_illegalAddr_T_13 = _rdata_T_36 ? 1'h0 : _illegal_csr_num_illegalAddr_T_11; // @[Mux.scala 80:57]
  wire  _illegal_csr_num_illegalAddr_T_15 = _rdata_T_37 ? 1'h0 : _illegal_csr_num_illegalAddr_T_13; // @[Mux.scala 80:57]
  wire  _illegal_csr_num_illegalAddr_T_17 = _rdata_T_38 ? 1'h0 : _illegal_csr_num_illegalAddr_T_15; // @[Mux.scala 80:57]
  wire  _illegal_csr_num_illegalAddr_T_19 = _rdata_T_39 ? 1'h0 : _illegal_csr_num_illegalAddr_T_17; // @[Mux.scala 80:57]
  wire  _illegal_csr_num_illegalAddr_T_21 = _rdata_T_40 ? 1'h0 : _illegal_csr_num_illegalAddr_T_19; // @[Mux.scala 80:57]
  wire  _illegal_csr_num_illegalAddr_T_23 = _rdata_T_41 ? 1'h0 : _illegal_csr_num_illegalAddr_T_21; // @[Mux.scala 80:57]
  wire  _illegal_csr_num_illegalAddr_T_25 = _rdata_T_42 ? 1'h0 : _illegal_csr_num_illegalAddr_T_23; // @[Mux.scala 80:57]
  wire  _illegal_csr_num_illegalAddr_T_27 = _rdata_T_43 ? 1'h0 : _illegal_csr_num_illegalAddr_T_25; // @[Mux.scala 80:57]
  wire  _illegal_csr_num_illegalAddr_T_29 = _rdata_T_44 ? 1'h0 : _illegal_csr_num_illegalAddr_T_27; // @[Mux.scala 80:57]
  wire  _illegal_csr_num_illegalAddr_T_31 = _rdata_T_45 ? 1'h0 : _illegal_csr_num_illegalAddr_T_29; // @[Mux.scala 80:57]
  wire  _illegal_csr_num_illegalAddr_T_33 = _rdata_T_46 ? 1'h0 : _illegal_csr_num_illegalAddr_T_31; // @[Mux.scala 80:57]
  wire  _illegal_csr_num_illegalAddr_T_35 = _rdata_T_47 ? 1'h0 : _illegal_csr_num_illegalAddr_T_33; // @[Mux.scala 80:57]
  wire  _illegal_csr_num_illegalAddr_T_37 = _rdata_T_48 ? 1'h0 : _illegal_csr_num_illegalAddr_T_35; // @[Mux.scala 80:57]
  wire  _illegal_csr_num_illegalAddr_T_39 = _rdata_T_49 ? 1'h0 : _illegal_csr_num_illegalAddr_T_37; // @[Mux.scala 80:57]
  wire  _illegal_csr_num_illegalAddr_T_41 = _rdata_T_50 ? 1'h0 : _illegal_csr_num_illegalAddr_T_39; // @[Mux.scala 80:57]
  wire  _illegal_csr_num_illegalAddr_T_43 = _rdata_T_51 ? 1'h0 : _illegal_csr_num_illegalAddr_T_41; // @[Mux.scala 80:57]
  wire  _illegal_csr_num_illegalAddr_T_45 = _rdata_T_52 ? 1'h0 : _illegal_csr_num_illegalAddr_T_43; // @[Mux.scala 80:57]
  wire  _illegal_csr_num_illegalAddr_T_47 = _rdata_T_53 ? 1'h0 : _illegal_csr_num_illegalAddr_T_45; // @[Mux.scala 80:57]
  wire  _illegal_csr_num_illegalAddr_T_49 = _rdata_T_54 ? 1'h0 : _illegal_csr_num_illegalAddr_T_47; // @[Mux.scala 80:57]
  wire  _illegal_csr_num_illegalAddr_T_51 = _rdata_T_55 ? 1'h0 : _illegal_csr_num_illegalAddr_T_49; // @[Mux.scala 80:57]
  wire  _illegal_csr_num_illegalAddr_T_53 = _rdata_T_56 ? 1'h0 : _illegal_csr_num_illegalAddr_T_51; // @[Mux.scala 80:57]
  wire  _illegal_csr_num_illegalAddr_T_55 = _rdata_T_57 ? 1'h0 : _illegal_csr_num_illegalAddr_T_53; // @[Mux.scala 80:57]
  wire  _illegal_csr_num_illegalAddr_T_57 = _rdata_T_58 ? 1'h0 : _illegal_csr_num_illegalAddr_T_55; // @[Mux.scala 80:57]
  wire  illegal_csr_num_illegalAddr = _rdata_T_59 ? 1'h0 : _illegal_csr_num_illegalAddr_T_57; // @[Mux.scala 80:57]
  wire  illegal_csr_num = illegal_csr_num_illegalAddr & io_common_io_wen; // @[CSR.scala 282:76]
  wire  _csrExcpVec_11_T = current_mode == 2'h3; // @[CSR.scala 290:53]
  wire  csrExcpVec_11 = current_mode == 2'h3 & io_event_io_is_ecall; // @[CSR.scala 290:69]
  wire  _csrExcpVec_9_T = current_mode == 2'h1; // @[CSR.scala 291:53]
  wire  csrExcpVec_9 = current_mode == 2'h1 & io_event_io_is_ecall; // @[CSR.scala 291:69]
  wire  csrExcpVec_8 = current_mode == 2'h0 & io_event_io_is_ecall; // @[CSR.scala 292:69]
  wire [15:0] _allExcpVec_T = {4'h0,csrExcpVec_11,1'h0,csrExcpVec_9,csrExcpVec_8,4'h0,1'h0,illegal_csr_num,2'h0}; // @[CSR.scala 296:42]
  wire [15:0] _allExcpVec_T_1 = {8'h0,1'h0,io_event_io_exception_vec_6,1'h0,io_event_io_exception_vec_4,
    io_event_io_exception_vec_3,io_event_io_exception_vec_2,2'h0}; // @[CSR.scala 296:69]
  wire [15:0] allExcpVec = _allExcpVec_T | _allExcpVec_T_1; // @[CSR.scala 296:45]
  wire  has_excp = |allExcpVec; // @[CSR.scala 297:39]
  wire [2:0] _excp_no_T_1 = allExcpVec[5] ? 3'h5 : 3'h0; // @[CSR.scala 298:93]
  wire [2:0] _excp_no_T_3 = allExcpVec[7] ? 3'h7 : _excp_no_T_1; // @[CSR.scala 298:93]
  wire [3:0] _excp_no_T_5 = allExcpVec[13] ? 4'hd : {{1'd0}, _excp_no_T_3}; // @[CSR.scala 298:93]
  wire [3:0] _excp_no_T_7 = allExcpVec[15] ? 4'hf : _excp_no_T_5; // @[CSR.scala 298:93]
  wire [3:0] _excp_no_T_9 = allExcpVec[4] ? 4'h4 : _excp_no_T_7; // @[CSR.scala 298:93]
  wire [3:0] _excp_no_T_11 = allExcpVec[6] ? 4'h6 : _excp_no_T_9; // @[CSR.scala 298:93]
  wire [3:0] _excp_no_T_13 = allExcpVec[11] ? 4'hb : _excp_no_T_11; // @[CSR.scala 298:93]
  wire [3:0] _excp_no_T_15 = allExcpVec[9] ? 4'h9 : _excp_no_T_13; // @[CSR.scala 298:93]
  wire [3:0] _excp_no_T_17 = allExcpVec[8] ? 4'h8 : _excp_no_T_15; // @[CSR.scala 298:93]
  wire [3:0] _excp_no_T_19 = allExcpVec[0] ? 4'h0 : _excp_no_T_17; // @[CSR.scala 298:93]
  wire [3:0] _excp_no_T_21 = allExcpVec[2] ? 4'h2 : _excp_no_T_19; // @[CSR.scala 298:93]
  wire [3:0] _excp_no_T_23 = allExcpVec[1] ? 4'h1 : _excp_no_T_21; // @[CSR.scala 298:93]
  wire [3:0] _excp_no_T_25 = allExcpVec[12] ? 4'hc : _excp_no_T_23; // @[CSR.scala 298:93]
  wire [3:0] excp_no = allExcpVec[3] ? 4'h3 : _excp_no_T_25; // @[CSR.scala 298:93]
  wire  detect_int_5 = mtime > mtimecmp; // @[CSR.scala 307:45]
  wire [11:0] _int_cause_T = {3'h0,1'h0,detect_int_5,1'h0,detect_int_5,1'h0,1'h0,3'h0}; // @[CSR.scala 302:39]
  wire [63:0] _mtime_T_5 = mtime + 64'h2; // @[CSR.scala 304:18]
  wire [63:0] mipWire = mip_new & 64'hfffffffffffffdff; // @[CSR.scala 338:22]
  wire [63:0] _mip_T = mipWire | mipReg; // @[CSR.scala 340:19]
  wire [5:0] mip_lo = {_mip_T[5],_mip_T[4],_mip_T[3],_mip_T[2],_mip_T[1],_mip_T[0]}; // @[CSR.scala 340:59]
  wire [63:0] _mip_T_14 = {_mip_T[63:12],_mip_T[11],_mip_T[10],_mip_T[9],_mip_T[8],_mip_T[7],_mip_T[6],mip_lo}; // @[CSR.scala 340:59]
  wire  _intrVecEnable_0_T_56 = current_mode < 2'h3; // @[CSR.scala 343:107]
  wire  _intrVecEnable_0_T_57 = _csrExcpVec_11_T & old_mstatus_MIE | current_mode < 2'h3; // @[CSR.scala 343:90]
  wire  intrVecEnable_0 = interrupt_deleg[0] ? _csrExcpVec_9_T & old_mstatus_SIE | current_mode < 2'h1 :
    _intrVecEnable_0_T_57; // @[CSR.scala 342:40]
  wire  intrVecEnable_1 = interrupt_deleg[1] ? _csrExcpVec_9_T & old_mstatus_SIE | current_mode < 2'h1 :
    _intrVecEnable_0_T_57; // @[CSR.scala 342:40]
  wire  intrVecEnable_2 = interrupt_deleg[2] ? _csrExcpVec_9_T & old_mstatus_SIE | current_mode < 2'h1 :
    _intrVecEnable_0_T_57; // @[CSR.scala 342:40]
  wire  intrVecEnable_3 = interrupt_deleg[3] ? _csrExcpVec_9_T & old_mstatus_SIE | current_mode < 2'h1 :
    _intrVecEnable_0_T_57; // @[CSR.scala 342:40]
  wire  intrVecEnable_4 = interrupt_deleg[4] ? _csrExcpVec_9_T & old_mstatus_SIE | current_mode < 2'h1 :
    _intrVecEnable_0_T_57; // @[CSR.scala 342:40]
  wire  intrVecEnable_5 = interrupt_deleg[5] ? _csrExcpVec_9_T & old_mstatus_SIE | current_mode < 2'h1 :
    _intrVecEnable_0_T_57; // @[CSR.scala 342:40]
  wire  intrVecEnable_6 = interrupt_deleg[6] ? _csrExcpVec_9_T & old_mstatus_SIE | current_mode < 2'h1 :
    _intrVecEnable_0_T_57; // @[CSR.scala 342:40]
  wire  intrVecEnable_7 = interrupt_deleg[7] ? _csrExcpVec_9_T & old_mstatus_SIE | current_mode < 2'h1 :
    _intrVecEnable_0_T_57; // @[CSR.scala 342:40]
  wire  intrVecEnable_8 = interrupt_deleg[8] ? _csrExcpVec_9_T & old_mstatus_SIE | current_mode < 2'h1 :
    _intrVecEnable_0_T_57; // @[CSR.scala 342:40]
  wire  intrVecEnable_9 = interrupt_deleg[9] ? _csrExcpVec_9_T & old_mstatus_SIE | current_mode < 2'h1 :
    _intrVecEnable_0_T_57; // @[CSR.scala 342:40]
  wire  intrVecEnable_10 = interrupt_deleg[10] ? _csrExcpVec_9_T & old_mstatus_SIE | current_mode < 2'h1 :
    _intrVecEnable_0_T_57; // @[CSR.scala 342:40]
  wire  intrVecEnable_11 = interrupt_deleg[11] ? _csrExcpVec_9_T & old_mstatus_SIE | current_mode < 2'h1 :
    _intrVecEnable_0_T_57; // @[CSR.scala 342:40]
  wire [11:0] _intrVec_T_2 = mie[11:0] & _int_cause_T; // @[CSR.scala 347:28]
  wire [5:0] intrVec_lo_1 = {intrVecEnable_5,intrVecEnable_4,intrVecEnable_3,intrVecEnable_2,intrVecEnable_1,
    intrVecEnable_0}; // @[CSR.scala 347:70]
  wire [11:0] _intrVec_T_3 = {intrVecEnable_11,intrVecEnable_10,intrVecEnable_9,intrVecEnable_8,intrVecEnable_7,
    intrVecEnable_6,intrVec_lo_1}; // @[CSR.scala 347:70]
  wire [11:0] intrVec = _intrVec_T_2 & _intrVec_T_3; // @[CSR.scala 347:48]
  wire  has_intr = |intrVec; // @[CSR.scala 349:38]
  wire [11:0] _intr_no_T = {{5'd0}, intrVec[11:5]}; // @[CSR.scala 350:100]
  wire [3:0] _intr_no_T_2 = _intr_no_T[0] ? 4'h5 : 4'h0; // @[CSR.scala 350:92]
  wire [11:0] _intr_no_T_3 = {{1'd0}, intrVec[11:1]}; // @[CSR.scala 350:100]
  wire [3:0] _intr_no_T_5 = _intr_no_T_3[0] ? 4'h1 : _intr_no_T_2; // @[CSR.scala 350:92]
  wire [11:0] _intr_no_T_6 = {{9'd0}, intrVec[11:9]}; // @[CSR.scala 350:100]
  wire [3:0] _intr_no_T_8 = _intr_no_T_6[0] ? 4'h9 : _intr_no_T_5; // @[CSR.scala 350:92]
  wire [11:0] _intr_no_T_9 = {{7'd0}, intrVec[11:7]}; // @[CSR.scala 350:100]
  wire [3:0] _intr_no_T_11 = _intr_no_T_9[0] ? 4'h7 : _intr_no_T_8; // @[CSR.scala 350:92]
  wire [11:0] _intr_no_T_12 = {{3'd0}, intrVec[11:3]}; // @[CSR.scala 350:100]
  wire [3:0] _intr_no_T_14 = _intr_no_T_12[0] ? 4'h3 : _intr_no_T_11; // @[CSR.scala 350:92]
  wire [11:0] _intr_no_T_15 = {{11'd0}, intrVec[11]}; // @[CSR.scala 350:100]
  wire [3:0] intr_no = _intr_no_T_15[0] ? 4'hb : _intr_no_T_14; // @[CSR.scala 350:92]
  wire  has_excp_intr = has_excp | has_intr; // @[CSR.scala 354:32]
  wire [3:0] _cause_no_T = has_intr ? intr_no : excp_no; // @[CSR.scala 356:18]
  wire [63:0] _deleg_to_s_T = has_intr ? mideleg : medeleg; // @[CSR.scala 357:23]
  wire [63:0] cause_no = {{60'd0}, _cause_no_T}; // @[CSR.scala 355:27 CSR.scala 356:12]
  wire [63:0] _deleg_to_s_T_2 = _deleg_to_s_T >> cause_no[3:0]; // @[CSR.scala 357:51]
  wire  deleg_to_s = _deleg_to_s_T_2[0] & _intrVecEnable_0_T_56; // @[CSR.scala 357:68]
  wire  _T_113 = true_deal_with_int | has_excp; // @[CSR.scala 359:27]
  wire [63:0] _tval_T_1 = 64'hc == cause_no ? io_event_io_bad_address : 64'h0; // @[Mux.scala 80:57]
  wire [63:0] _tval_T_3 = 64'hd == cause_no ? io_event_io_bad_address : _tval_T_1; // @[Mux.scala 80:57]
  wire [63:0] _tval_T_5 = 64'hf == cause_no ? io_event_io_bad_address : _tval_T_3; // @[Mux.scala 80:57]
  wire [63:0] _tval_T_7 = 64'h0 == cause_no ? io_event_io_bad_address : _tval_T_5; // @[Mux.scala 80:57]
  wire [63:0] _tval_T_9 = 64'h4 == cause_no ? io_event_io_bad_address : _tval_T_7; // @[Mux.scala 80:57]
  wire [63:0] _tval_T_11 = 64'h6 == cause_no ? io_event_io_bad_address : _tval_T_9; // @[Mux.scala 80:57]
  wire [63:0] _tval_T_13 = 64'h1 == cause_no ? io_event_io_bad_address : _tval_T_11; // @[Mux.scala 80:57]
  wire [63:0] _tval_T_15 = 64'h5 == cause_no ? io_event_io_bad_address : _tval_T_13; // @[Mux.scala 80:57]
  wire [63:0] _tval_T_17 = 64'h7 == cause_no ? io_event_io_bad_address : _tval_T_15; // @[Mux.scala 80:57]
  wire [63:0] _tval_T_19 = 64'h3 == cause_no ? io_event_io_bad_address : _tval_T_17; // @[Mux.scala 80:57]
  wire [63:0] tval = 64'h2 == cause_no ? 64'h0 : _tval_T_19; // @[Mux.scala 80:57]
  wire [62:0] scause_lo = cause_no[62:0]; // @[CSR.scala 386:39]
  wire [63:0] _scause_T_5 = {has_intr,scause_lo}; // @[Cat.scala 30:58]
  wire [1:0] _GEN_31 = deleg_to_s ? current_mode : {{1'd0}, old_mstatus_SPP}; // @[CSR.scala 385:22 CSR.scala 387:23]
  wire  new_mstatus_2_SPIE = deleg_to_s ? old_mstatus_SIE : old_mstatus_SPIE; // @[CSR.scala 385:22 CSR.scala 388:24]
  wire  new_mstatus_2_SIE = deleg_to_s ? 1'h0 : old_mstatus_SIE; // @[CSR.scala 385:22 CSR.scala 389:23]
  wire [1:0] new_mstatus_2_MPP = deleg_to_s ? old_mstatus_MPP : current_mode; // @[CSR.scala 385:22 CSR.scala 395:23]
  wire  new_mstatus_2_MPIE = deleg_to_s ? old_mstatus_MPIE : old_mstatus_MIE; // @[CSR.scala 385:22 CSR.scala 396:24]
  wire  new_mstatus_2_MIE = deleg_to_s & old_mstatus_MIE; // @[CSR.scala 385:22 CSR.scala 397:23]
  wire [5:0] mstatus_lo_lo_3 = {new_mstatus_2_SPIE,old_mstatus_UPIE,new_mstatus_2_MIE,old_mstatus_WPRI2,
    new_mstatus_2_SIE,old_mstatus_UIE}; // @[CSR.scala 402:34]
  wire  new_mstatus_2_SPP = _GEN_31[0];
  wire [14:0] mstatus_lo_3 = {old_mstatus_FS,new_mstatus_2_MPP,old_mstatus_WPRI9,new_mstatus_2_SPP,new_mstatus_2_MPIE,
    old_mstatus_WPRI6,mstatus_lo_lo_3}; // @[CSR.scala 402:34]
  wire [63:0] _mstatus_T_11 = {old_mstatus_SD,old_mstatus_WPRI36,old_mstatus_SXL,old_mstatus_UXL,old_mstatus_WPRI23,
    old_mstatus_TSR,mstatus_hi_lo_1,mstatus_lo_3}; // @[CSR.scala 402:34]
  wire [63:0] tvec = deleg_to_s ? stvec : mtvec; // @[CSR.scala 406:24]
  wire [2:0] _trap_target_T_2 = {tvec[0], 2'h0}; // @[CSR.scala 407:61]
  wire [66:0] _trap_target_T_3 = _trap_target_T_2 * cause_no; // @[CSR.scala 407:67]
  wire [66:0] _trap_target_T_5 = 67'hfffffffffffffffc + _trap_target_T_3; // @[CSR.scala 407:41]
  wire [66:0] _GEN_63 = {{3'd0}, tvec}; // @[CSR.scala 407:26]
  wire [66:0] trap_target = _GEN_63 & _trap_target_T_5; // @[CSR.scala 407:26]
  wire [66:0] _io_event_io_redirect_pc_T = has_excp_intr ? trap_target : {{3'd0}, ret_target}; // @[CSR.scala 408:33]
  assign io_common_io_out = _rdata_T_49 ? rdata : _io_common_io_out_T_4; // @[Mux.scala 80:57]
  assign io_event_io_call_for_int = |intrVec; // @[CSR.scala 349:38]
  assign io_event_io_except_kill = _T_113 | io_event_io_is_mret | io_event_io_is_sret; // @[CSR.scala 409:84]
  assign io_event_io_redirect_pc = _io_event_io_redirect_pc_T[63:0]; // @[CSR.scala 408:27]
  always @(posedge clock) begin
    if (reset) begin // @[CSR.scala 99:29]
      current_mode <= 2'h3; // @[CSR.scala 99:29]
    end else if (true_deal_with_int | has_excp) begin // @[CSR.scala 359:40]
      if (deleg_to_s) begin // @[CSR.scala 385:22]
        current_mode <= 2'h1; // @[CSR.scala 391:20]
      end else begin
        current_mode <= 2'h3; // @[CSR.scala 399:20]
      end
    end else if (io_event_io_is_sret) begin // @[CSR.scala 256:29]
      current_mode <= _current_mode_T; // @[CSR.scala 262:18]
    end else if (io_event_io_is_mret) begin // @[CSR.scala 245:29]
      current_mode <= old_mstatus_MPP; // @[CSR.scala 251:18]
    end
    if (reset) begin // @[CSR.scala 114:27]
      mstatus <= 64'h1800; // @[CSR.scala 114:27]
    end else if (true_deal_with_int | has_excp) begin // @[CSR.scala 359:40]
      mstatus <= _mstatus_T_11; // @[CSR.scala 402:13]
    end else if (io_event_io_is_sret) begin // @[CSR.scala 256:29]
      mstatus <= _mstatus_T_10; // @[CSR.scala 263:13]
    end else if (io_event_io_is_mret) begin // @[CSR.scala 245:29]
      mstatus <= _mstatus_T_9; // @[CSR.scala 252:13]
    end else begin
      mstatus <= _GEN_15;
    end
    if (reset) begin // @[CSR.scala 115:27]
      medeleg <= 64'h0; // @[CSR.scala 115:27]
    end else if (wen & io_common_io_num == 12'h302) begin // @[CSRRegMap.scala 41:71]
      medeleg <= _medeleg_T_3; // @[CSRRegMap.scala 42:11]
    end
    if (reset) begin // @[CSR.scala 116:27]
      mideleg <= 64'h0; // @[CSR.scala 116:27]
    end else if (wen & io_common_io_num == 12'h303) begin // @[CSRRegMap.scala 41:71]
      mideleg <= _mideleg_T_3; // @[CSRRegMap.scala 42:11]
    end
    if (reset) begin // @[CSR.scala 117:27]
      mie <= 64'h0; // @[CSR.scala 117:27]
    end else if (wen & io_common_io_num == 12'h304) begin // @[CSRRegMap.scala 41:71]
      mie <= io_common_io_in; // @[CSRRegMap.scala 42:11]
    end else if (wen & io_common_io_num == 12'h104) begin // @[CSRRegMap.scala 41:71]
      mie <= _mie_T_4; // @[CSRRegMap.scala 42:11]
    end
    if (reset) begin // @[CSR.scala 118:27]
      mtvec <= 64'h0; // @[CSR.scala 118:27]
    end else if (wen & io_common_io_num == 12'h305) begin // @[CSRRegMap.scala 41:71]
      mtvec <= io_common_io_in; // @[CSRRegMap.scala 42:11]
    end
    if (reset) begin // @[CSR.scala 119:27]
      mcounteren <= 64'h0; // @[CSR.scala 119:27]
    end else if (wen & io_common_io_num == 12'h306) begin // @[CSRRegMap.scala 41:71]
      mcounteren <= io_common_io_in; // @[CSRRegMap.scala 42:11]
    end
    if (reset) begin // @[CSR.scala 121:25]
      mscratch <= 64'h0; // @[CSR.scala 121:25]
    end else if (wen & io_common_io_num == 12'h340) begin // @[CSRRegMap.scala 41:71]
      mscratch <= io_common_io_in; // @[CSRRegMap.scala 42:11]
    end
    if (reset) begin // @[CSR.scala 122:25]
      mepc <= 64'h0; // @[CSR.scala 122:25]
    end else if (true_deal_with_int | has_excp) begin // @[CSR.scala 359:40]
      if (deleg_to_s) begin // @[CSR.scala 385:22]
        mepc <= _GEN_20;
      end else begin
        mepc <= io_event_io_epc; // @[CSR.scala 398:12]
      end
    end else begin
      mepc <= _GEN_20;
    end
    if (reset) begin // @[CSR.scala 123:25]
      mcause <= 64'h0; // @[CSR.scala 123:25]
    end else if (true_deal_with_int | has_excp) begin // @[CSR.scala 359:40]
      if (deleg_to_s) begin // @[CSR.scala 385:22]
        mcause <= _GEN_6;
      end else begin
        mcause <= _scause_T_5; // @[CSR.scala 394:14]
      end
    end else begin
      mcause <= _GEN_6;
    end
    if (reset) begin // @[CSR.scala 124:25]
      mtval <= 64'h0; // @[CSR.scala 124:25]
    end else if (true_deal_with_int | has_excp) begin // @[CSR.scala 359:40]
      if (deleg_to_s) begin // @[CSR.scala 385:22]
        mtval <= _GEN_21;
      end else if (true_deal_with_int) begin // @[CSR.scala 392:19]
        mtval <= 64'h0;
      end else begin
        mtval <= tval;
      end
    end else begin
      mtval <= _GEN_21;
    end
    if (reset) begin // @[CSR.scala 126:24]
      mipReg <= 64'h0; // @[CSR.scala 126:24]
    end else if (wen & io_common_io_num == 12'h344) begin // @[CSRRegMap.scala 41:71]
      mipReg <= _mipReg_T_8; // @[CSRRegMap.scala 42:11]
    end else if (wen & io_common_io_num == 12'h144) begin // @[CSRRegMap.scala 41:71]
      mipReg <= _mipReg_T_4; // @[CSRRegMap.scala 42:11]
    end
    if (reset) begin // @[CSR.scala 130:24]
      mip <= 64'h0; // @[CSR.scala 130:24]
    end else begin
      mip <= _mip_T_14; // @[CSR.scala 340:7]
    end
    if (reset) begin // @[CSR.scala 133:30]
      mcycle <= 64'h0; // @[CSR.scala 133:30]
    end else begin
      mcycle <= _mcycle_T_1; // @[CSR.scala 222:10]
    end
    if (reset) begin // @[CSR.scala 134:30]
      mtime <= 64'h0; // @[CSR.scala 134:30]
    end else begin
      mtime <= _mtime_T_5; // @[CSR.scala 304:9]
    end
    if (reset) begin // @[CSR.scala 135:30]
      mtimecmp <= 64'h0; // @[CSR.scala 135:30]
    end else if (wen & io_common_io_num == 12'hffe) begin // @[CSRRegMap.scala 41:71]
      mtimecmp <= io_common_io_in; // @[CSRRegMap.scala 42:11]
    end
    if (reset) begin // @[CSR.scala 136:30]
      mcountinhibit <= 64'h0; // @[CSR.scala 136:30]
    end else if (wen & io_common_io_num == 12'h320) begin // @[CSRRegMap.scala 41:71]
      mcountinhibit <= io_common_io_in; // @[CSRRegMap.scala 42:11]
    end
    if (reset) begin // @[CSR.scala 143:27]
      stvec <= 64'h0; // @[CSR.scala 143:27]
    end else if (wen & io_common_io_num == 12'h105) begin // @[CSRRegMap.scala 41:71]
      stvec <= io_common_io_in; // @[CSRRegMap.scala 42:11]
    end
    if (reset) begin // @[CSR.scala 144:27]
      scounteren <= 64'h0; // @[CSR.scala 144:27]
    end else if (wen & io_common_io_num == 12'h106) begin // @[CSRRegMap.scala 41:71]
      scounteren <= io_common_io_in; // @[CSRRegMap.scala 42:11]
    end
    if (reset) begin // @[CSR.scala 146:25]
      sscratch <= 64'h0; // @[CSR.scala 146:25]
    end else if (wen & io_common_io_num == 12'h140) begin // @[CSRRegMap.scala 41:71]
      sscratch <= io_common_io_in; // @[CSRRegMap.scala 42:11]
    end
    if (reset) begin // @[CSR.scala 147:25]
      sepc <= 64'h0; // @[CSR.scala 147:25]
    end else if (true_deal_with_int | has_excp) begin // @[CSR.scala 359:40]
      if (deleg_to_s) begin // @[CSR.scala 385:22]
        sepc <= io_event_io_epc; // @[CSR.scala 390:12]
      end else begin
        sepc <= _GEN_5;
      end
    end else begin
      sepc <= _GEN_5;
    end
    if (reset) begin // @[CSR.scala 148:25]
      scause <= 64'h0; // @[CSR.scala 148:25]
    end else if (true_deal_with_int | has_excp) begin // @[CSR.scala 359:40]
      if (deleg_to_s) begin // @[CSR.scala 385:22]
        scause <= _scause_T_5; // @[CSR.scala 386:14]
      end else begin
        scause <= _GEN_23;
      end
    end else begin
      scause <= _GEN_23;
    end
    if (reset) begin // @[CSR.scala 149:25]
      stval <= 64'h0; // @[CSR.scala 149:25]
    end else if (true_deal_with_int | has_excp) begin // @[CSR.scala 359:40]
      if (deleg_to_s) begin // @[CSR.scala 385:22]
        if (true_deal_with_int) begin // @[CSR.scala 392:19]
          stval <= 64'h0;
        end else begin
          stval <= tval;
        end
      end else begin
        stval <= _GEN_14;
      end
    end else begin
      stval <= _GEN_14;
    end
    if (reset) begin // @[CSR.scala 152:21]
      satp <= 64'h0; // @[CSR.scala 152:21]
    end else if (wen & io_common_io_num == 12'h180) begin // @[CSRRegMap.scala 41:71]
      satp <= io_common_io_in; // @[CSRRegMap.scala 42:11]
    end
    if (reset) begin // @[CSR.scala 302:27]
      int_cause <= 12'h0; // @[CSR.scala 302:27]
    end else begin
      int_cause <= _int_cause_T; // @[CSR.scala 302:27]
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
  current_mode = _RAND_0[1:0];
  _RAND_1 = {2{`RANDOM}};
  mstatus = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  medeleg = _RAND_2[63:0];
  _RAND_3 = {2{`RANDOM}};
  mideleg = _RAND_3[63:0];
  _RAND_4 = {2{`RANDOM}};
  mie = _RAND_4[63:0];
  _RAND_5 = {2{`RANDOM}};
  mtvec = _RAND_5[63:0];
  _RAND_6 = {2{`RANDOM}};
  mcounteren = _RAND_6[63:0];
  _RAND_7 = {2{`RANDOM}};
  mscratch = _RAND_7[63:0];
  _RAND_8 = {2{`RANDOM}};
  mepc = _RAND_8[63:0];
  _RAND_9 = {2{`RANDOM}};
  mcause = _RAND_9[63:0];
  _RAND_10 = {2{`RANDOM}};
  mtval = _RAND_10[63:0];
  _RAND_11 = {2{`RANDOM}};
  mipReg = _RAND_11[63:0];
  _RAND_12 = {2{`RANDOM}};
  mip = _RAND_12[63:0];
  _RAND_13 = {2{`RANDOM}};
  mcycle = _RAND_13[63:0];
  _RAND_14 = {2{`RANDOM}};
  mtime = _RAND_14[63:0];
  _RAND_15 = {2{`RANDOM}};
  mtimecmp = _RAND_15[63:0];
  _RAND_16 = {2{`RANDOM}};
  mcountinhibit = _RAND_16[63:0];
  _RAND_17 = {2{`RANDOM}};
  stvec = _RAND_17[63:0];
  _RAND_18 = {2{`RANDOM}};
  scounteren = _RAND_18[63:0];
  _RAND_19 = {2{`RANDOM}};
  sscratch = _RAND_19[63:0];
  _RAND_20 = {2{`RANDOM}};
  sepc = _RAND_20[63:0];
  _RAND_21 = {2{`RANDOM}};
  scause = _RAND_21[63:0];
  _RAND_22 = {2{`RANDOM}};
  stval = _RAND_22[63:0];
  _RAND_23 = {2{`RANDOM}};
  satp = _RAND_23[63:0];
  _RAND_24 = {1{`RANDOM}};
  int_cause = _RAND_24[11:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210134_Backend(
  input          clock,
  input          reset,
  output         io_fb_bmfs_redirect_kill,
  output [63:0]  io_fb_bmfs_redirect_pc,
  output         io_fb_bmfs_bpu_v,
  output         io_fb_bmfs_bpu_errpr,
  output [63:0]  io_fb_bmfs_bpu_pc_br,
  output [63:0]  io_fb_bmfs_bpu_target,
  output         io_fb_bmfs_bpu_taken,
  input  [1:0]   io_fb_fmbs_instn,
  input  [232:0] io_fb_fmbs_inst_ops_0,
  input  [232:0] io_fb_fmbs_inst_ops_1,
  output         io_fb_fmbs_please_wait,
  output         io_dcache_req_valid,
  output [31:0]  io_dcache_req_bits_addr,
  output [63:0]  io_dcache_req_bits_wdata,
  output         io_dcache_req_bits_wen,
  output [2:0]   io_dcache_req_bits_mtype,
  input          io_dcache_resp_valid,
  input  [31:0]  io_dcache_resp_bits_rdata_0,
  input  [31:0]  io_dcache_resp_bits_rdata_1
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
  reg [63:0] _RAND_13;
  reg [63:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [63:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [63:0] _RAND_23;
  reg [63:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [63:0] _RAND_28;
  reg [63:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [63:0] _RAND_36;
  reg [63:0] _RAND_37;
  reg [63:0] _RAND_38;
  reg [63:0] _RAND_39;
  reg [63:0] _RAND_40;
  reg [63:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [63:0] _RAND_43;
  reg [63:0] _RAND_44;
  reg [63:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [63:0] _RAND_54;
  reg [63:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [63:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [63:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_66;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_69;
  reg [63:0] _RAND_70;
  reg [63:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [63:0] _RAND_73;
  reg [31:0] _RAND_74;
  reg [31:0] _RAND_75;
  reg [63:0] _RAND_76;
  reg [31:0] _RAND_77;
  reg [63:0] _RAND_78;
  reg [31:0] _RAND_79;
  reg [31:0] _RAND_80;
  reg [63:0] _RAND_81;
  reg [31:0] _RAND_82;
`endif // RANDOMIZE_REG_INIT
  wire [63:0] alu_io_a; // @[Backend.scala 51:28]
  wire [63:0] alu_io_b; // @[Backend.scala 51:28]
  wire [3:0] alu_io_aluOp; // @[Backend.scala 51:28]
  wire  alu_io_aluExpand; // @[Backend.scala 51:28]
  wire [63:0] alu_io_r; // @[Backend.scala 51:28]
  wire  alu_io_zero; // @[Backend.scala 51:28]
  wire [63:0] mdu_io_a; // @[Backend.scala 52:28]
  wire [63:0] mdu_io_b; // @[Backend.scala 52:28]
  wire [3:0] mdu_io_aluOp; // @[Backend.scala 52:28]
  wire  mdu_io_aluExpand; // @[Backend.scala 52:28]
  wire [63:0] mdu_io_r; // @[Backend.scala 52:28]
  wire  mdu_io_zero; // @[Backend.scala 52:28]
  wire  issueQueue_clock; // @[Backend.scala 60:28]
  wire  issueQueue_reset; // @[Backend.scala 60:28]
  wire  issueQueue_io_dout_0_illegal; // @[Backend.scala 60:28]
  wire [2:0] issueQueue_io_dout_0_next_pc; // @[Backend.scala 60:28]
  wire [1:0] issueQueue_io_dout_0_alu_mdu_lsu; // @[Backend.scala 60:28]
  wire [3:0] issueQueue_io_dout_0_branch_type; // @[Backend.scala 60:28]
  wire [1:0] issueQueue_io_dout_0_src_a; // @[Backend.scala 60:28]
  wire [1:0] issueQueue_io_dout_0_src_b; // @[Backend.scala 60:28]
  wire  issueQueue_io_dout_0_write_dest; // @[Backend.scala 60:28]
  wire [3:0] issueQueue_io_dout_0_alu_op; // @[Backend.scala 60:28]
  wire  issueQueue_io_dout_0_alu_expand; // @[Backend.scala 60:28]
  wire [2:0] issueQueue_io_dout_0_mem_width; // @[Backend.scala 60:28]
  wire [1:0] issueQueue_io_dout_0_write_src; // @[Backend.scala 60:28]
  wire [4:0] issueQueue_io_dout_0_rs1; // @[Backend.scala 60:28]
  wire [4:0] issueQueue_io_dout_0_rs2; // @[Backend.scala 60:28]
  wire [4:0] issueQueue_io_dout_0_rd; // @[Backend.scala 60:28]
  wire [63:0] issueQueue_io_dout_0_imm; // @[Backend.scala 60:28]
  wire [63:0] issueQueue_io_dout_0_pc; // @[Backend.scala 60:28]
  wire  issueQueue_io_dout_0_predict_taken; // @[Backend.scala 60:28]
  wire [63:0] issueQueue_io_dout_0_target_pc; // @[Backend.scala 60:28]
  wire  issueQueue_io_dout_1_illegal; // @[Backend.scala 60:28]
  wire [2:0] issueQueue_io_dout_1_next_pc; // @[Backend.scala 60:28]
  wire [1:0] issueQueue_io_dout_1_alu_mdu_lsu; // @[Backend.scala 60:28]
  wire [3:0] issueQueue_io_dout_1_branch_type; // @[Backend.scala 60:28]
  wire [1:0] issueQueue_io_dout_1_src_a; // @[Backend.scala 60:28]
  wire [1:0] issueQueue_io_dout_1_src_b; // @[Backend.scala 60:28]
  wire  issueQueue_io_dout_1_write_dest; // @[Backend.scala 60:28]
  wire [3:0] issueQueue_io_dout_1_alu_op; // @[Backend.scala 60:28]
  wire  issueQueue_io_dout_1_alu_expand; // @[Backend.scala 60:28]
  wire [2:0] issueQueue_io_dout_1_mem_width; // @[Backend.scala 60:28]
  wire [1:0] issueQueue_io_dout_1_write_src; // @[Backend.scala 60:28]
  wire [4:0] issueQueue_io_dout_1_rs1; // @[Backend.scala 60:28]
  wire [4:0] issueQueue_io_dout_1_rs2; // @[Backend.scala 60:28]
  wire [4:0] issueQueue_io_dout_1_rd; // @[Backend.scala 60:28]
  wire [63:0] issueQueue_io_dout_1_imm; // @[Backend.scala 60:28]
  wire [63:0] issueQueue_io_dout_1_pc; // @[Backend.scala 60:28]
  wire  issueQueue_io_dout_1_predict_taken; // @[Backend.scala 60:28]
  wire [63:0] issueQueue_io_dout_1_target_pc; // @[Backend.scala 60:28]
  wire [3:0] issueQueue_io_enqStep; // @[Backend.scala 60:28]
  wire  issueQueue_io_enqReq; // @[Backend.scala 60:28]
  wire [3:0] issueQueue_io_deqStep; // @[Backend.scala 60:28]
  wire  issueQueue_io_deqReq; // @[Backend.scala 60:28]
  wire  issueQueue_io_din_0_illegal; // @[Backend.scala 60:28]
  wire [2:0] issueQueue_io_din_0_next_pc; // @[Backend.scala 60:28]
  wire [1:0] issueQueue_io_din_0_alu_mdu_lsu; // @[Backend.scala 60:28]
  wire [3:0] issueQueue_io_din_0_branch_type; // @[Backend.scala 60:28]
  wire [1:0] issueQueue_io_din_0_src_a; // @[Backend.scala 60:28]
  wire [1:0] issueQueue_io_din_0_src_b; // @[Backend.scala 60:28]
  wire  issueQueue_io_din_0_write_dest; // @[Backend.scala 60:28]
  wire [3:0] issueQueue_io_din_0_alu_op; // @[Backend.scala 60:28]
  wire  issueQueue_io_din_0_alu_expand; // @[Backend.scala 60:28]
  wire [2:0] issueQueue_io_din_0_mem_width; // @[Backend.scala 60:28]
  wire [1:0] issueQueue_io_din_0_write_src; // @[Backend.scala 60:28]
  wire [4:0] issueQueue_io_din_0_rs1; // @[Backend.scala 60:28]
  wire [4:0] issueQueue_io_din_0_rs2; // @[Backend.scala 60:28]
  wire [4:0] issueQueue_io_din_0_rd; // @[Backend.scala 60:28]
  wire [63:0] issueQueue_io_din_0_imm; // @[Backend.scala 60:28]
  wire [63:0] issueQueue_io_din_0_pc; // @[Backend.scala 60:28]
  wire  issueQueue_io_din_0_predict_taken; // @[Backend.scala 60:28]
  wire [63:0] issueQueue_io_din_0_target_pc; // @[Backend.scala 60:28]
  wire  issueQueue_io_din_1_illegal; // @[Backend.scala 60:28]
  wire [2:0] issueQueue_io_din_1_next_pc; // @[Backend.scala 60:28]
  wire [1:0] issueQueue_io_din_1_alu_mdu_lsu; // @[Backend.scala 60:28]
  wire [3:0] issueQueue_io_din_1_branch_type; // @[Backend.scala 60:28]
  wire [1:0] issueQueue_io_din_1_src_a; // @[Backend.scala 60:28]
  wire [1:0] issueQueue_io_din_1_src_b; // @[Backend.scala 60:28]
  wire  issueQueue_io_din_1_write_dest; // @[Backend.scala 60:28]
  wire [3:0] issueQueue_io_din_1_alu_op; // @[Backend.scala 60:28]
  wire  issueQueue_io_din_1_alu_expand; // @[Backend.scala 60:28]
  wire [2:0] issueQueue_io_din_1_mem_width; // @[Backend.scala 60:28]
  wire [1:0] issueQueue_io_din_1_write_src; // @[Backend.scala 60:28]
  wire [4:0] issueQueue_io_din_1_rs1; // @[Backend.scala 60:28]
  wire [4:0] issueQueue_io_din_1_rs2; // @[Backend.scala 60:28]
  wire [4:0] issueQueue_io_din_1_rd; // @[Backend.scala 60:28]
  wire [63:0] issueQueue_io_din_1_imm; // @[Backend.scala 60:28]
  wire [63:0] issueQueue_io_din_1_pc; // @[Backend.scala 60:28]
  wire  issueQueue_io_din_1_predict_taken; // @[Backend.scala 60:28]
  wire [63:0] issueQueue_io_din_1_target_pc; // @[Backend.scala 60:28]
  wire  issueQueue_io_flush; // @[Backend.scala 60:28]
  wire  issueQueue_io_sufficient; // @[Backend.scala 60:28]
  wire [3:0] issueQueue_io_items; // @[Backend.scala 60:28]
  wire  issueArbiter_io_insts_in_0_illegal; // @[Backend.scala 61:28]
  wire [2:0] issueArbiter_io_insts_in_0_next_pc; // @[Backend.scala 61:28]
  wire [1:0] issueArbiter_io_insts_in_0_alu_mdu_lsu; // @[Backend.scala 61:28]
  wire [3:0] issueArbiter_io_insts_in_0_branch_type; // @[Backend.scala 61:28]
  wire [1:0] issueArbiter_io_insts_in_0_src_a; // @[Backend.scala 61:28]
  wire [1:0] issueArbiter_io_insts_in_0_src_b; // @[Backend.scala 61:28]
  wire  issueArbiter_io_insts_in_0_write_dest; // @[Backend.scala 61:28]
  wire [3:0] issueArbiter_io_insts_in_0_alu_op; // @[Backend.scala 61:28]
  wire  issueArbiter_io_insts_in_0_alu_expand; // @[Backend.scala 61:28]
  wire [2:0] issueArbiter_io_insts_in_0_mem_width; // @[Backend.scala 61:28]
  wire [1:0] issueArbiter_io_insts_in_0_write_src; // @[Backend.scala 61:28]
  wire [4:0] issueArbiter_io_insts_in_0_rs1; // @[Backend.scala 61:28]
  wire [4:0] issueArbiter_io_insts_in_0_rs2; // @[Backend.scala 61:28]
  wire [4:0] issueArbiter_io_insts_in_0_rd; // @[Backend.scala 61:28]
  wire [63:0] issueArbiter_io_insts_in_0_imm; // @[Backend.scala 61:28]
  wire [63:0] issueArbiter_io_insts_in_0_pc; // @[Backend.scala 61:28]
  wire  issueArbiter_io_insts_in_0_predict_taken; // @[Backend.scala 61:28]
  wire [63:0] issueArbiter_io_insts_in_0_target_pc; // @[Backend.scala 61:28]
  wire  issueArbiter_io_insts_in_1_illegal; // @[Backend.scala 61:28]
  wire [2:0] issueArbiter_io_insts_in_1_next_pc; // @[Backend.scala 61:28]
  wire [1:0] issueArbiter_io_insts_in_1_alu_mdu_lsu; // @[Backend.scala 61:28]
  wire [3:0] issueArbiter_io_insts_in_1_branch_type; // @[Backend.scala 61:28]
  wire [1:0] issueArbiter_io_insts_in_1_src_a; // @[Backend.scala 61:28]
  wire [1:0] issueArbiter_io_insts_in_1_src_b; // @[Backend.scala 61:28]
  wire  issueArbiter_io_insts_in_1_write_dest; // @[Backend.scala 61:28]
  wire [3:0] issueArbiter_io_insts_in_1_alu_op; // @[Backend.scala 61:28]
  wire  issueArbiter_io_insts_in_1_alu_expand; // @[Backend.scala 61:28]
  wire [2:0] issueArbiter_io_insts_in_1_mem_width; // @[Backend.scala 61:28]
  wire [1:0] issueArbiter_io_insts_in_1_write_src; // @[Backend.scala 61:28]
  wire [4:0] issueArbiter_io_insts_in_1_rs1; // @[Backend.scala 61:28]
  wire [4:0] issueArbiter_io_insts_in_1_rs2; // @[Backend.scala 61:28]
  wire [4:0] issueArbiter_io_insts_in_1_rd; // @[Backend.scala 61:28]
  wire [63:0] issueArbiter_io_insts_in_1_imm; // @[Backend.scala 61:28]
  wire [63:0] issueArbiter_io_insts_in_1_pc; // @[Backend.scala 61:28]
  wire  issueArbiter_io_insts_in_1_predict_taken; // @[Backend.scala 61:28]
  wire [63:0] issueArbiter_io_insts_in_1_target_pc; // @[Backend.scala 61:28]
  wire [3:0] issueArbiter_io_queue_items; // @[Backend.scala 61:28]
  wire [4:0] issueArbiter_io_ld_dest_ex; // @[Backend.scala 61:28]
  wire [63:0] issueArbiter_io_rss_in_0; // @[Backend.scala 61:28]
  wire [63:0] issueArbiter_io_rss_in_1; // @[Backend.scala 61:28]
  wire [63:0] issueArbiter_io_rts_in_0; // @[Backend.scala 61:28]
  wire [63:0] issueArbiter_io_rts_in_1; // @[Backend.scala 61:28]
  wire [63:0] issueArbiter_io_rss_out_0; // @[Backend.scala 61:28]
  wire [63:0] issueArbiter_io_rss_out_1; // @[Backend.scala 61:28]
  wire [63:0] issueArbiter_io_rss_out_2; // @[Backend.scala 61:28]
  wire [63:0] issueArbiter_io_rts_out_0; // @[Backend.scala 61:28]
  wire [63:0] issueArbiter_io_rts_out_1; // @[Backend.scala 61:28]
  wire [63:0] issueArbiter_io_rts_out_2; // @[Backend.scala 61:28]
  wire  issueArbiter_io_csr_ex; // @[Backend.scala 61:28]
  wire  issueArbiter_io_mmio_ex; // @[Backend.scala 61:28]
  wire  issueArbiter_io_insts_out_0_illegal; // @[Backend.scala 61:28]
  wire [2:0] issueArbiter_io_insts_out_0_next_pc; // @[Backend.scala 61:28]
  wire [1:0] issueArbiter_io_insts_out_0_alu_mdu_lsu; // @[Backend.scala 61:28]
  wire [3:0] issueArbiter_io_insts_out_0_branch_type; // @[Backend.scala 61:28]
  wire [1:0] issueArbiter_io_insts_out_0_src_a; // @[Backend.scala 61:28]
  wire [1:0] issueArbiter_io_insts_out_0_src_b; // @[Backend.scala 61:28]
  wire  issueArbiter_io_insts_out_0_write_dest; // @[Backend.scala 61:28]
  wire [3:0] issueArbiter_io_insts_out_0_alu_op; // @[Backend.scala 61:28]
  wire  issueArbiter_io_insts_out_0_alu_expand; // @[Backend.scala 61:28]
  wire [1:0] issueArbiter_io_insts_out_0_write_src; // @[Backend.scala 61:28]
  wire [4:0] issueArbiter_io_insts_out_0_rs1; // @[Backend.scala 61:28]
  wire [4:0] issueArbiter_io_insts_out_0_rd; // @[Backend.scala 61:28]
  wire [63:0] issueArbiter_io_insts_out_0_imm; // @[Backend.scala 61:28]
  wire [63:0] issueArbiter_io_insts_out_0_pc; // @[Backend.scala 61:28]
  wire  issueArbiter_io_insts_out_0_predict_taken; // @[Backend.scala 61:28]
  wire [63:0] issueArbiter_io_insts_out_0_target_pc; // @[Backend.scala 61:28]
  wire [1:0] issueArbiter_io_insts_out_1_src_a; // @[Backend.scala 61:28]
  wire [1:0] issueArbiter_io_insts_out_1_src_b; // @[Backend.scala 61:28]
  wire  issueArbiter_io_insts_out_1_write_dest; // @[Backend.scala 61:28]
  wire [3:0] issueArbiter_io_insts_out_1_alu_op; // @[Backend.scala 61:28]
  wire  issueArbiter_io_insts_out_1_alu_expand; // @[Backend.scala 61:28]
  wire [4:0] issueArbiter_io_insts_out_1_rd; // @[Backend.scala 61:28]
  wire [63:0] issueArbiter_io_insts_out_1_imm; // @[Backend.scala 61:28]
  wire [63:0] issueArbiter_io_insts_out_1_pc; // @[Backend.scala 61:28]
  wire  issueArbiter_io_insts_out_2_write_dest; // @[Backend.scala 61:28]
  wire [2:0] issueArbiter_io_insts_out_2_mem_width; // @[Backend.scala 61:28]
  wire [4:0] issueArbiter_io_insts_out_2_rd; // @[Backend.scala 61:28]
  wire [63:0] issueArbiter_io_insts_out_2_imm; // @[Backend.scala 61:28]
  wire [63:0] issueArbiter_io_insts_out_2_pc; // @[Backend.scala 61:28]
  wire [1:0] issueArbiter_io_issue_num; // @[Backend.scala 61:28]
  wire  issueArbiter_io_issue_fu_valid_0; // @[Backend.scala 61:28]
  wire  issueArbiter_io_issue_fu_valid_1; // @[Backend.scala 61:28]
  wire  issueArbiter_io_issue_fu_valid_2; // @[Backend.scala 61:28]
  wire [1:0] issueArbiter_io_insts_order_0; // @[Backend.scala 61:28]
  wire [1:0] issueArbiter_io_insts_order_1; // @[Backend.scala 61:28]
  wire [1:0] issueArbiter_io_insts_order_2; // @[Backend.scala 61:28]
  wire  regFile_clock; // @[Backend.scala 123:32]
  wire  regFile_reset; // @[Backend.scala 123:32]
  wire [4:0] regFile_io_rs_addr_vec_0; // @[Backend.scala 123:32]
  wire [4:0] regFile_io_rs_addr_vec_1; // @[Backend.scala 123:32]
  wire [4:0] regFile_io_rs_addr_vec_2; // @[Backend.scala 123:32]
  wire [4:0] regFile_io_rs_addr_vec_3; // @[Backend.scala 123:32]
  wire [63:0] regFile_io_rs_data_vec_0; // @[Backend.scala 123:32]
  wire [63:0] regFile_io_rs_data_vec_1; // @[Backend.scala 123:32]
  wire [63:0] regFile_io_rs_data_vec_2; // @[Backend.scala 123:32]
  wire [63:0] regFile_io_rs_data_vec_3; // @[Backend.scala 123:32]
  wire  regFile_io_wen_vec_0; // @[Backend.scala 123:32]
  wire  regFile_io_wen_vec_1; // @[Backend.scala 123:32]
  wire [4:0] regFile_io_rd_addr_vec_0; // @[Backend.scala 123:32]
  wire [4:0] regFile_io_rd_addr_vec_1; // @[Backend.scala 123:32]
  wire [63:0] regFile_io_rd_data_vec_0; // @[Backend.scala 123:32]
  wire [63:0] regFile_io_rd_data_vec_1; // @[Backend.scala 123:32]
  wire  csr_clock; // @[Backend.scala 124:32]
  wire  csr_reset; // @[Backend.scala 124:32]
  wire [63:0] csr_io_common_io_in; // @[Backend.scala 124:32]
  wire  csr_io_common_io_wen; // @[Backend.scala 124:32]
  wire [11:0] csr_io_common_io_num; // @[Backend.scala 124:32]
  wire [63:0] csr_io_common_io_out; // @[Backend.scala 124:32]
  wire  csr_io_event_io_exception_vec_2; // @[Backend.scala 124:32]
  wire  csr_io_event_io_exception_vec_3; // @[Backend.scala 124:32]
  wire  csr_io_event_io_exception_vec_4; // @[Backend.scala 124:32]
  wire  csr_io_event_io_exception_vec_6; // @[Backend.scala 124:32]
  wire  csr_io_event_io_deal_with_int; // @[Backend.scala 124:32]
  wire  csr_io_event_io_is_mret; // @[Backend.scala 124:32]
  wire  csr_io_event_io_is_sret; // @[Backend.scala 124:32]
  wire  csr_io_event_io_is_ecall; // @[Backend.scala 124:32]
  wire [63:0] csr_io_event_io_bad_address; // @[Backend.scala 124:32]
  wire [63:0] csr_io_event_io_epc; // @[Backend.scala 124:32]
  wire  csr_io_event_io_call_for_int; // @[Backend.scala 124:32]
  wire  csr_io_event_io_except_kill; // @[Backend.scala 124:32]
  wire [63:0] csr_io_event_io_redirect_pc; // @[Backend.scala 124:32]
  reg  exLastMemReqValid; // @[Backend.scala 320:34]
  wire  dcacheStall = exLastMemReqValid & ~io_dcache_resp_valid; // @[Backend.scala 321:36]
  wire  _kill_x_T = ~dcacheStall; // @[Backend.scala 71:22]
  wire  kill_x = ~dcacheStall & io_fb_bmfs_redirect_kill; // @[Backend.scala 71:35]
  reg  exInsts_0_illegal; // @[Backend.scala 73:29]
  reg [2:0] exInsts_0_next_pc; // @[Backend.scala 73:29]
  reg [1:0] exInsts_0_alu_mdu_lsu; // @[Backend.scala 73:29]
  reg [3:0] exInsts_0_branch_type; // @[Backend.scala 73:29]
  reg [1:0] exInsts_0_src_a; // @[Backend.scala 73:29]
  reg [1:0] exInsts_0_src_b; // @[Backend.scala 73:29]
  reg  exInsts_0_write_dest; // @[Backend.scala 73:29]
  reg [3:0] exInsts_0_alu_op; // @[Backend.scala 73:29]
  reg  exInsts_0_alu_expand; // @[Backend.scala 73:29]
  reg [1:0] exInsts_0_write_src; // @[Backend.scala 73:29]
  reg [4:0] exInsts_0_rs1; // @[Backend.scala 73:29]
  reg [4:0] exInsts_0_rd; // @[Backend.scala 73:29]
  reg [63:0] exInsts_0_imm; // @[Backend.scala 73:29]
  reg [63:0] exInsts_0_pc; // @[Backend.scala 73:29]
  reg  exInsts_0_predict_taken; // @[Backend.scala 73:29]
  reg [63:0] exInsts_0_target_pc; // @[Backend.scala 73:29]
  reg [1:0] exInsts_1_src_a; // @[Backend.scala 73:29]
  reg [1:0] exInsts_1_src_b; // @[Backend.scala 73:29]
  reg  exInsts_1_write_dest; // @[Backend.scala 73:29]
  reg [3:0] exInsts_1_alu_op; // @[Backend.scala 73:29]
  reg  exInsts_1_alu_expand; // @[Backend.scala 73:29]
  reg [4:0] exInsts_1_rd; // @[Backend.scala 73:29]
  reg [63:0] exInsts_1_imm; // @[Backend.scala 73:29]
  reg [63:0] exInsts_1_pc; // @[Backend.scala 73:29]
  reg  exInsts_2_write_dest; // @[Backend.scala 73:29]
  reg [2:0] exInsts_2_mem_width; // @[Backend.scala 73:29]
  reg [4:0] exInsts_2_rd; // @[Backend.scala 73:29]
  reg [63:0] exInsts_2_imm; // @[Backend.scala 73:29]
  reg [63:0] exInsts_2_pc; // @[Backend.scala 73:29]
  reg [1:0] exInstsOrder_0; // @[Backend.scala 74:97]
  reg [1:0] exInstsOrder_1; // @[Backend.scala 74:97]
  reg [1:0] exInstsOrder_2; // @[Backend.scala 74:97]
  reg  exInstsValid_0; // @[Backend.scala 75:29]
  reg  exInstsValid_1; // @[Backend.scala 75:29]
  reg  exInstsValid_2; // @[Backend.scala 75:29]
  reg [63:0] exFwdRsData_0; // @[Backend.scala 76:29]
  reg [63:0] exFwdRsData_1; // @[Backend.scala 76:29]
  reg [63:0] exFwdRsData_2; // @[Backend.scala 76:29]
  reg [63:0] exFwdRtData_0; // @[Backend.scala 77:29]
  reg [63:0] exFwdRtData_1; // @[Backend.scala 77:29]
  reg [63:0] exFwdRtData_2; // @[Backend.scala 77:29]
  wire  isExPCBr = exInsts_0_next_pc == 3'h1; // @[Backend.scala 78:41]
  wire  _isExPCJump_T_1 = exInsts_0_next_pc == 3'h2; // @[Backend.scala 79:87]
  wire  isExPCJump = exInsts_0_next_pc == 3'h3 | exInsts_0_next_pc == 3'h2; // @[Backend.scala 79:65]
  wire [63:0] brPC = exInsts_0_pc + exInsts_0_imm; // @[Backend.scala 83:36]
  wire [63:0] _exReBranchPC_T_1 = exInsts_0_pc + 64'h4; // @[Backend.scala 84:77]
  wire  _aluValid_T = ~kill_x; // @[Backend.scala 288:36]
  wire  aluValid = exInstsValid_0 & ~kill_x; // @[Backend.scala 288:33]
  wire [63:0] ldstAddr = exFwdRsData_2 + exInsts_2_imm; // @[Backend.scala 88:37]
  wire  _memMisaligned_T_9 = |ldstAddr[2:0]; // @[Backend.scala 98:46]
  wire  _memMisaligned_T_7 = |ldstAddr[1:0]; // @[Backend.scala 97:46]
  wire  _memMisaligned_T_13 = 3'h3 == exInsts_2_mem_width ? ldstAddr[0] : 3'h2 == exInsts_2_mem_width & ldstAddr[0]; // @[Mux.scala 80:57]
  wire  _memMisaligned_T_15 = 3'h4 == exInsts_2_mem_width ? _memMisaligned_T_7 : _memMisaligned_T_13; // @[Mux.scala 80:57]
  wire  _memMisaligned_T_17 = 3'h6 == exInsts_2_mem_width ? _memMisaligned_T_7 : _memMisaligned_T_15; // @[Mux.scala 80:57]
  wire  memMisaligned = 3'h5 == exInsts_2_mem_width ? _memMisaligned_T_9 : _memMisaligned_T_17; // @[Mux.scala 80:57]
  wire  _aluExptMask_T = exInstsValid_2 & memMisaligned; // @[Backend.scala 105:42]
  wire  aluExptMask = exInstsValid_2 & memMisaligned & exInstsOrder_2 < exInstsOrder_0; // @[Backend.scala 105:59]
  wire  exInstsTrueValid_0 = aluValid & ~aluExptMask; // @[Backend.scala 425:35]
  wire  _reBranchBrTaken_T_9 = ~alu_io_r[0]; // @[Backend.scala 391:44]
  wire  _reBranchBrTaken_T_5 = $signed(alu_io_r) < 64'sh0; // @[Backend.scala 389:48]
  wire  _reBranchBrTaken_T_3 = $signed(alu_io_r) >= 64'sh0; // @[Backend.scala 388:48]
  wire  _reBranchBrTaken_T_1 = ~alu_io_zero; // @[Backend.scala 387:44]
  wire  _reBranchBrTaken_T = alu_io_zero; // @[Backend.scala 385:72]
  wire  _reBranchBrTaken_T_11 = 4'h2 == exInsts_0_branch_type ? _reBranchBrTaken_T_1 : _reBranchBrTaken_T; // @[Mux.scala 80:57]
  wire  _reBranchBrTaken_T_13 = 4'h3 == exInsts_0_branch_type ? _reBranchBrTaken_T_3 : _reBranchBrTaken_T_11; // @[Mux.scala 80:57]
  wire  _reBranchBrTaken_T_15 = 4'h6 == exInsts_0_branch_type ? _reBranchBrTaken_T_5 : _reBranchBrTaken_T_13; // @[Mux.scala 80:57]
  wire  _reBranchBrTaken_T_17 = 4'h4 == exInsts_0_branch_type ? alu_io_r[0] : _reBranchBrTaken_T_15; // @[Mux.scala 80:57]
  wire  _reBranchBrTaken_T_19 = 4'h5 == exInsts_0_branch_type ? _reBranchBrTaken_T_9 : _reBranchBrTaken_T_17; // @[Mux.scala 80:57]
  wire  _GEN_197 = isExPCBr & _reBranchBrTaken_T_19; // @[Backend.scala 384:21 Backend.scala 385:23 Backend.scala 377:19]
  wire  reBranchBrTaken = exInstsTrueValid_0 & _GEN_197; // @[Backend.scala 383:29 Backend.scala 377:19]
  wire [63:0] _exReBranchPC_T_2 = reBranchBrTaken ? brPC : _exReBranchPC_T_1; // @[Backend.scala 84:39]
  wire [63:0] _jumpPc_T_4 = exFwdRsData_0 + exInsts_0_imm; // @[Backend.scala 381:20]
  wire [63:0] jumpPc = _isExPCJump_T_1 ? brPC : _jumpPc_T_4; // @[Backend.scala 378:16]
  reg  exInterruptd; // @[Backend.scala 90:29]
  wire  mduExptMask = _aluExptMask_T & exInstsOrder_2 < exInstsOrder_1; // @[Backend.scala 106:59]
  wire  ldstValid = exInstsValid_2 & _aluValid_T; // @[Backend.scala 290:33]
  wire  exMemRealValid = ldstValid & ~memMisaligned; // @[Backend.scala 107:44]
  wire  bpuV = (isExPCBr | isExPCJump) & exInstsValid_0; // @[Backend.scala 108:44]
  wire  _bpuErrpr_T_2 = exInsts_0_target_pc[63:2] != brPC[63:2]; // @[Backend.scala 110:65]
  wire  _bpuErrpr_T_7 = exInsts_0_target_pc[63:2] != jumpPc[63:2]; // @[Backend.scala 110:157]
  wire  bpuErrpr = isExPCBr & exInsts_0_target_pc[63:2] != brPC[63:2] & reBranchBrTaken | isExPCJump &
    exInsts_0_target_pc[63:2] != jumpPc[63:2]; // @[Backend.scala 110:106]
  wire  bpuTaken = reBranchBrTaken | isExPCJump; // @[Backend.scala 113:35]
  reg [63:0] reBranchPC; // @[Backend.scala 116:33]
  reg [63:0] wbResult_0; // @[Backend.scala 117:33]
  reg [63:0] wbResult_1; // @[Backend.scala 117:33]
  reg  wbInstsValid_0; // @[Backend.scala 118:33]
  reg  wbInstsValid_1; // @[Backend.scala 118:33]
  reg  wbInstsValid_2; // @[Backend.scala 118:33]
  reg  wbInsts_0_illegal; // @[Backend.scala 120:33]
  reg [2:0] wbInsts_0_next_pc; // @[Backend.scala 120:33]
  reg [1:0] wbInsts_0_alu_mdu_lsu; // @[Backend.scala 120:33]
  reg  wbInsts_0_write_dest; // @[Backend.scala 120:33]
  reg [4:0] wbInsts_0_rd; // @[Backend.scala 120:33]
  reg [63:0] wbInsts_0_imm; // @[Backend.scala 120:33]
  reg [63:0] wbInsts_0_pc; // @[Backend.scala 120:33]
  reg  wbInsts_1_write_dest; // @[Backend.scala 120:33]
  reg [4:0] wbInsts_1_rd; // @[Backend.scala 120:33]
  reg [63:0] wbInsts_1_pc; // @[Backend.scala 120:33]
  reg  wbInsts_2_write_dest; // @[Backend.scala 120:33]
  reg [2:0] wbInsts_2_mem_width; // @[Backend.scala 120:33]
  reg [4:0] wbInsts_2_rd; // @[Backend.scala 120:33]
  reg [63:0] wbInsts_2_pc; // @[Backend.scala 120:33]
  reg  wbReBranch; // @[Backend.scala 126:33]
  reg [31:0] wbMisalignedAddr; // @[Backend.scala 129:33]
  reg  wbInterruptd; // @[Backend.scala 130:33]
  reg  wbLdMa; // @[Backend.scala 131:33]
  reg  wbStMa; // @[Backend.scala 132:33]
  reg  wbBpuV; // @[Backend.scala 133:33]
  reg  wbBpuErrpr; // @[Backend.scala 134:33]
  wire [61:0] wbBpuPCBr_hi = exInsts_0_pc[63:2]; // @[Backend.scala 136:45]
  wire [1:0] wbBpuPCBr_lo = exInsts_0_target_pc[1:0]; // @[Backend.scala 136:80]
  wire [63:0] _wbBpuPCBr_T = {wbBpuPCBr_hi,wbBpuPCBr_lo}; // @[Cat.scala 30:58]
  reg [63:0] wbBpuPCBr; // @[Backend.scala 136:33]
  reg [63:0] wbBpuTarget; // @[Backend.scala 137:33]
  reg  wbBpuTaken; // @[Backend.scala 138:33]
  reg [63:0] wbCsrData; // @[Backend.scala 140:33]
  wire [1:0] issueNum = issueArbiter_io_issue_num; // @[Backend.scala 56:26 Backend.scala 181:31]
  wire [1:0] _issueQueue_io_deqStep_T = csr_io_event_io_call_for_int ? 2'h0 : issueNum; // @[Backend.scala 147:31]
  wire  trap_ret_items0 = issueQueue_io_items >= 4'h1; // @[Backend.scala 163:49]
  wire [2:0] issueInsts_0_next_pc = issueQueue_io_dout_0_next_pc; // @[Backend.scala 57:26 Backend.scala 152:19]
  wire  issueInsts_0_illegal = issueQueue_io_dout_0_illegal; // @[Backend.scala 57:26 Backend.scala 152:19]
  wire  blockSecondItem = issueInsts_0_next_pc[2] | issueInsts_0_illegal; // @[Backend.scala 164:68]
  wire  exCsrValid = exInsts_0_next_pc == 3'h0 & exInsts_0_alu_mdu_lsu == 2'h0; // @[Backend.scala 166:59]
  wire [11:0] _ex_mmio_num_T_1 = 64'h200bff8 == ldstAddr ? 12'hfff : 12'h0; // @[Mux.scala 80:57]
  wire [11:0] ex_mmio_num = 64'h2004000 == ldstAddr ? 12'hffe : _ex_mmio_num_T_1; // @[Mux.scala 80:57]
  wire  exMMIOValid = exInstsValid_2 & |ex_mmio_num; // @[Backend.scala 172:37]
  wire [4:0] _issueArbiter_io_ld_dest_ex_T_1 = exInstsValid_2 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] issueInsts_0_rs1 = issueQueue_io_dout_0_rs1; // @[Backend.scala 57:26 Backend.scala 152:19]
  wire [63:0] rsData_0 = regFile_io_rs_data_vec_0; // @[Backend.scala 66:26 Backend.scala 237:15]
  wire [63:0] _GEN_0 = wbInsts_0_rd == issueInsts_0_rs1 ? wbResult_0 : rsData_0; // @[Backend.scala 195:51 Backend.scala 196:24 Backend.scala 188:18]
  wire [4:0] issueInsts_0_rs2 = issueQueue_io_dout_0_rs2; // @[Backend.scala 57:26 Backend.scala 152:19]
  wire [63:0] rtData_0 = regFile_io_rs_data_vec_1; // @[Backend.scala 67:26 Backend.scala 238:15]
  wire [63:0] _GEN_1 = wbInsts_0_rd == issueInsts_0_rs2 ? wbResult_0 : rtData_0; // @[Backend.scala 198:51 Backend.scala 199:24 Backend.scala 189:18]
  wire [4:0] issueInsts_1_rs1 = issueQueue_io_dout_1_rs1; // @[Backend.scala 57:26 Backend.scala 152:19]
  wire [63:0] rsData_1 = regFile_io_rs_data_vec_2; // @[Backend.scala 66:26 Backend.scala 237:15]
  wire [63:0] _GEN_2 = wbInsts_0_rd == issueInsts_1_rs1 ? wbResult_0 : rsData_1; // @[Backend.scala 195:51 Backend.scala 196:24 Backend.scala 188:18]
  wire [4:0] issueInsts_1_rs2 = issueQueue_io_dout_1_rs2; // @[Backend.scala 57:26 Backend.scala 152:19]
  wire [63:0] rtData_1 = regFile_io_rs_data_vec_3; // @[Backend.scala 67:26 Backend.scala 238:15]
  wire [63:0] _GEN_3 = wbInsts_0_rd == issueInsts_1_rs2 ? wbResult_0 : rtData_1; // @[Backend.scala 198:51 Backend.scala 199:24 Backend.scala 189:18]
  wire [63:0] _GEN_4 = wbInstsValid_0 & wbInsts_0_write_dest & wbInsts_0_rd != 5'h0 ? _GEN_0 : rsData_0; // @[Backend.scala 193:98 Backend.scala 188:18]
  wire [63:0] _GEN_5 = wbInstsValid_0 & wbInsts_0_write_dest & wbInsts_0_rd != 5'h0 ? _GEN_1 : rtData_0; // @[Backend.scala 193:98 Backend.scala 189:18]
  wire [63:0] _GEN_6 = wbInstsValid_0 & wbInsts_0_write_dest & wbInsts_0_rd != 5'h0 ? _GEN_2 : rsData_1; // @[Backend.scala 193:98 Backend.scala 188:18]
  wire [63:0] _GEN_7 = wbInstsValid_0 & wbInsts_0_write_dest & wbInsts_0_rd != 5'h0 ? _GEN_3 : rtData_1; // @[Backend.scala 193:98 Backend.scala 189:18]
  wire  _T_9 = wbInstsValid_1 & wbInsts_1_write_dest; // @[Backend.scala 193:26]
  wire [63:0] _GEN_8 = wbInsts_1_rd == issueInsts_0_rs1 ? wbResult_1 : _GEN_4; // @[Backend.scala 195:51 Backend.scala 196:24]
  wire [63:0] _GEN_9 = wbInsts_1_rd == issueInsts_0_rs2 ? wbResult_1 : _GEN_5; // @[Backend.scala 198:51 Backend.scala 199:24]
  wire [63:0] _GEN_10 = wbInsts_1_rd == issueInsts_1_rs1 ? wbResult_1 : _GEN_6; // @[Backend.scala 195:51 Backend.scala 196:24]
  wire [63:0] _GEN_11 = wbInsts_1_rd == issueInsts_1_rs2 ? wbResult_1 : _GEN_7; // @[Backend.scala 198:51 Backend.scala 199:24]
  wire [63:0] _GEN_12 = wbInstsValid_1 & wbInsts_1_write_dest & wbInsts_1_rd != 5'h0 ? _GEN_8 : _GEN_4; // @[Backend.scala 193:98]
  wire [63:0] _GEN_13 = wbInstsValid_1 & wbInsts_1_write_dest & wbInsts_1_rd != 5'h0 ? _GEN_9 : _GEN_5; // @[Backend.scala 193:98]
  wire [63:0] _GEN_14 = wbInstsValid_1 & wbInsts_1_write_dest & wbInsts_1_rd != 5'h0 ? _GEN_10 : _GEN_6; // @[Backend.scala 193:98]
  wire [63:0] _GEN_15 = wbInstsValid_1 & wbInsts_1_write_dest & wbInsts_1_rd != 5'h0 ? _GEN_11 : _GEN_7; // @[Backend.scala 193:98]
  wire  _T_43 = 3'h0 == wbInsts_2_mem_width; // @[Conditional.scala 37:30]
  wire [63:0] _dataFromDcache_T = {io_dcache_resp_bits_rdata_1,io_dcache_resp_bits_rdata_0}; // @[Backend.scala 450:56]
  reg [5:0] delayed_req_bits; // @[Reg.scala 27:20]
  wire [63:0] dataFromDcache = _dataFromDcache_T >> delayed_req_bits; // @[Backend.scala 450:59]
  wire [55:0] wbLdData_hi = dataFromDcache[7] ? 56'hffffffffffffff : 56'h0; // @[Bitwise.scala 72:12]
  wire [7:0] wbLdData_lo = dataFromDcache[7:0]; // @[Backend.scala 462:97]
  wire [63:0] _wbLdData_T_5 = {wbLdData_hi,wbLdData_lo}; // @[Cat.scala 30:58]
  wire  _T_44 = 3'h1 == wbInsts_2_mem_width; // @[Conditional.scala 37:30]
  wire [63:0] _wbLdData_T_6 = {56'h0,wbLdData_lo}; // @[Cat.scala 30:58]
  wire  _T_45 = 3'h2 == wbInsts_2_mem_width; // @[Conditional.scala 37:30]
  wire [47:0] wbLdData_hi_2 = dataFromDcache[15] ? 48'hffffffffffff : 48'h0; // @[Bitwise.scala 72:12]
  wire [15:0] wbLdData_lo_2 = dataFromDcache[15:0]; // @[Backend.scala 464:99]
  wire [63:0] _wbLdData_T_9 = {wbLdData_hi_2,wbLdData_lo_2}; // @[Cat.scala 30:58]
  wire  _T_46 = 3'h3 == wbInsts_2_mem_width; // @[Conditional.scala 37:30]
  wire [63:0] _wbLdData_T_10 = {48'h0,wbLdData_lo_2}; // @[Cat.scala 30:58]
  wire  _T_47 = 3'h4 == wbInsts_2_mem_width; // @[Conditional.scala 37:30]
  wire [31:0] wbLdData_hi_4 = dataFromDcache[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] wbLdData_lo_4 = dataFromDcache[31:0]; // @[Backend.scala 466:99]
  wire [63:0] _wbLdData_T_13 = {wbLdData_hi_4,wbLdData_lo_4}; // @[Cat.scala 30:58]
  wire  _T_48 = 3'h6 == wbInsts_2_mem_width; // @[Conditional.scala 37:30]
  wire [63:0] _wbLdData_T_14 = {32'h0,wbLdData_lo_4}; // @[Cat.scala 30:58]
  reg  wbMMIOValid; // @[Backend.scala 457:28]
  reg [63:0] wb_mmio_ld_data; // @[Backend.scala 458:32]
  wire [63:0] _wbLdData_T_2 = wbMMIOValid & wbInsts_2_write_dest ? wb_mmio_ld_data : dataFromDcache; // @[Backend.scala 460:18]
  wire [63:0] _GEN_202 = _T_48 ? _wbLdData_T_14 : _wbLdData_T_2; // @[Conditional.scala 39:67 Backend.scala 467:41 Backend.scala 460:12]
  wire [63:0] _GEN_203 = _T_47 ? _wbLdData_T_13 : _GEN_202; // @[Conditional.scala 39:67 Backend.scala 466:41]
  wire [63:0] _GEN_204 = _T_46 ? _wbLdData_T_10 : _GEN_203; // @[Conditional.scala 39:67 Backend.scala 465:41]
  wire [63:0] _GEN_205 = _T_45 ? _wbLdData_T_9 : _GEN_204; // @[Conditional.scala 39:67 Backend.scala 464:41]
  wire [63:0] _GEN_206 = _T_44 ? _wbLdData_T_6 : _GEN_205; // @[Conditional.scala 39:67 Backend.scala 463:41]
  wire [63:0] wbLdData = _T_43 ? _wbLdData_T_5 : _GEN_206; // @[Conditional.scala 40:58 Backend.scala 462:41]
  wire [63:0] _GEN_16 = wbInsts_2_rd == issueInsts_0_rs1 ? wbLdData : _GEN_12; // @[Backend.scala 195:51 Backend.scala 196:24]
  wire [63:0] _GEN_17 = wbInsts_2_rd == issueInsts_0_rs2 ? wbLdData : _GEN_13; // @[Backend.scala 198:51 Backend.scala 199:24]
  wire [63:0] _GEN_18 = wbInsts_2_rd == issueInsts_1_rs1 ? wbLdData : _GEN_14; // @[Backend.scala 195:51 Backend.scala 196:24]
  wire [63:0] _GEN_19 = wbInsts_2_rd == issueInsts_1_rs2 ? wbLdData : _GEN_15; // @[Backend.scala 198:51 Backend.scala 199:24]
  wire [63:0] _GEN_20 = wbInstsValid_2 & wbInsts_2_write_dest & wbInsts_2_rd != 5'h0 ? _GEN_16 : _GEN_12; // @[Backend.scala 193:98]
  wire [63:0] _GEN_21 = wbInstsValid_2 & wbInsts_2_write_dest & wbInsts_2_rd != 5'h0 ? _GEN_17 : _GEN_13; // @[Backend.scala 193:98]
  wire [63:0] _GEN_22 = wbInstsValid_2 & wbInsts_2_write_dest & wbInsts_2_rd != 5'h0 ? _GEN_18 : _GEN_14; // @[Backend.scala 193:98]
  wire [63:0] _GEN_23 = wbInstsValid_2 & wbInsts_2_write_dest & wbInsts_2_rd != 5'h0 ? _GEN_19 : _GEN_15; // @[Backend.scala 193:98]
  wire [63:0] _aluWbData_T_6 = 2'h2 == exInsts_0_src_b ? csr_io_common_io_out : alu_io_r; // @[Mux.scala 80:57]
  wire [63:0] aluWbData = exInsts_0_write_src == 2'h3 | exInsts_0_next_pc != 3'h0 ? _exReBranchPC_T_1 : _aluWbData_T_6; // @[Backend.scala 434:19]
  wire [63:0] _GEN_24 = exInsts_0_rd == issueInsts_0_rs1 ? aluWbData : _GEN_20; // @[Backend.scala 207:49 Backend.scala 208:22]
  wire [63:0] _GEN_25 = exInsts_0_rd == issueInsts_0_rs2 ? aluWbData : _GEN_21; // @[Backend.scala 210:49 Backend.scala 211:22]
  wire [63:0] _GEN_26 = exInsts_0_rd == issueInsts_1_rs1 ? aluWbData : _GEN_22; // @[Backend.scala 207:49 Backend.scala 208:22]
  wire [63:0] _GEN_27 = exInsts_0_rd == issueInsts_1_rs2 ? aluWbData : _GEN_23; // @[Backend.scala 210:49 Backend.scala 211:22]
  wire [63:0] _GEN_28 = exInstsValid_0 & exInsts_0_write_dest & exInsts_0_rd != 5'h0 ? _GEN_24 : _GEN_20; // @[Backend.scala 205:96]
  wire [63:0] _GEN_29 = exInstsValid_0 & exInsts_0_write_dest & exInsts_0_rd != 5'h0 ? _GEN_25 : _GEN_21; // @[Backend.scala 205:96]
  wire [63:0] _GEN_30 = exInstsValid_0 & exInsts_0_write_dest & exInsts_0_rd != 5'h0 ? _GEN_26 : _GEN_22; // @[Backend.scala 205:96]
  wire [63:0] _GEN_31 = exInstsValid_0 & exInsts_0_write_dest & exInsts_0_rd != 5'h0 ? _GEN_27 : _GEN_23; // @[Backend.scala 205:96]
  wire [63:0] _GEN_32 = exInsts_1_rd == issueInsts_0_rs1 ? mdu_io_r : _GEN_28; // @[Backend.scala 217:49 Backend.scala 218:22]
  wire [63:0] _GEN_33 = exInsts_1_rd == issueInsts_0_rs2 ? mdu_io_r : _GEN_29; // @[Backend.scala 220:49 Backend.scala 221:22]
  wire [63:0] _GEN_34 = exInsts_1_rd == issueInsts_1_rs1 ? mdu_io_r : _GEN_30; // @[Backend.scala 217:49 Backend.scala 218:22]
  wire [63:0] _GEN_35 = exInsts_1_rd == issueInsts_1_rs2 ? mdu_io_r : _GEN_31; // @[Backend.scala 220:49 Backend.scala 221:22]
  wire [2:0] _exInstsValid_0_T = {issueArbiter_io_issue_fu_valid_2,issueArbiter_io_issue_fu_valid_1,
    issueArbiter_io_issue_fu_valid_0}; // @[Backend.scala 263:57]
  wire [63:0] issueInsts_0_pc = issueQueue_io_dout_0_pc; // @[Backend.scala 57:26 Backend.scala 152:19]
  wire [63:0] issueRss_0 = issueArbiter_io_rss_out_0; // @[Backend.scala 58:26 Backend.scala 182:31]
  wire [63:0] issueRts_0 = issueArbiter_io_rts_out_0; // @[Backend.scala 59:26 Backend.scala 183:31]
  wire [63:0] issueRss_1 = issueArbiter_io_rss_out_1; // @[Backend.scala 58:26 Backend.scala 182:31]
  wire [63:0] issueRts_1 = issueArbiter_io_rts_out_1; // @[Backend.scala 59:26 Backend.scala 183:31]
  wire [63:0] issueRss_2 = issueArbiter_io_rss_out_2; // @[Backend.scala 58:26 Backend.scala 182:31]
  wire [63:0] issueRts_2 = issueArbiter_io_rts_out_2; // @[Backend.scala 59:26 Backend.scala 183:31]
  wire  mduValid = exInstsValid_1 & _aluValid_T; // @[Backend.scala 289:33]
  wire  isCsrc = exInsts_0_alu_op == 4'h5 & exInsts_0_src_b == 2'h2; // @[Backend.scala 292:47]
  wire [63:0] _alu_io_a_T = ~exFwdRsData_0; // @[Backend.scala 295:55]
  wire [63:0] _alu_io_a_T_1 = isCsrc ? _alu_io_a_T : exFwdRsData_0; // @[Backend.scala 295:46]
  wire [4:0] alu_io_a_lo = ~exInsts_0_rs1; // @[Backend.scala 298:68]
  wire [63:0] _alu_io_a_T_2 = {59'h7ffffffffffffff,alu_io_a_lo}; // @[Cat.scala 30:58]
  wire [63:0] _alu_io_a_T_3 = {59'h0,exInsts_0_rs1}; // @[Cat.scala 30:58]
  wire [63:0] _alu_io_a_T_4 = isCsrc ? _alu_io_a_T_2 : _alu_io_a_T_3; // @[Backend.scala 298:29]
  wire [63:0] _alu_io_a_T_6 = 2'h2 == exInsts_0_src_a ? exInsts_0_pc : _alu_io_a_T_1; // @[Mux.scala 80:57]
  wire [63:0] _alu_io_b_T_1 = 4'h0 == exInsts_0_alu_op ? 64'h0 : csr_io_common_io_out; // @[Mux.scala 80:57]
  wire [63:0] _alu_io_b_T_3 = 2'h1 == exInsts_0_src_b ? exInsts_0_imm : exFwdRtData_0; // @[Mux.scala 80:57]
  wire  ldMisaligned = exInsts_2_write_dest & memMisaligned; // @[Backend.scala 323:62]
  wire  _stMisaligned_T = ~exInsts_2_write_dest; // @[Backend.scala 324:41]
  wire  stMisaligned = ~exInsts_2_write_dest & memMisaligned; // @[Backend.scala 324:62]
  wire  _io_dcache_req_valid_T_1 = exMemRealValid & ~exMMIOValid; // @[Backend.scala 326:41]
  reg [31:0] exLastMemReq_addr; // @[Backend.scala 329:29]
  reg [63:0] exLastMemReq_wdata; // @[Backend.scala 329:29]
  reg  exLastMemReq_wen; // @[Backend.scala 329:29]
  reg [2:0] exLastMemReq_mtype; // @[Backend.scala 329:29]
  wire [1:0] _exCurMemReq_memReq_mtype_T_1 = 3'h1 == exInsts_2_mem_width ? 2'h0 : 2'h2; // @[Mux.scala 80:57]
  wire [1:0] _exCurMemReq_memReq_mtype_T_3 = 3'h0 == exInsts_2_mem_width ? 2'h0 : _exCurMemReq_memReq_mtype_T_1; // @[Mux.scala 80:57]
  wire [1:0] _exCurMemReq_memReq_mtype_T_5 = 3'h2 == exInsts_2_mem_width ? 2'h1 : _exCurMemReq_memReq_mtype_T_3; // @[Mux.scala 80:57]
  wire [1:0] _exCurMemReq_memReq_mtype_T_7 = 3'h3 == exInsts_2_mem_width ? 2'h1 : _exCurMemReq_memReq_mtype_T_5; // @[Mux.scala 80:57]
  wire [1:0] _exCurMemReq_memReq_mtype_T_9 = 3'h4 == exInsts_2_mem_width ? 2'h2 : _exCurMemReq_memReq_mtype_T_7; // @[Mux.scala 80:57]
  wire [1:0] _exCurMemReq_memReq_mtype_T_11 = 3'h5 == exInsts_2_mem_width ? 2'h3 : _exCurMemReq_memReq_mtype_T_9; // @[Mux.scala 80:57]
  wire [1:0] _exCurMemReq_memReq_mtype_T_13 = 3'h6 == exInsts_2_mem_width ? 2'h2 : _exCurMemReq_memReq_mtype_T_11; // @[Mux.scala 80:57]
  wire [2:0] exCurMemReq_mtype = {{1'd0}, _exCurMemReq_memReq_mtype_T_13}; // @[Backend.scala 353:22 Backend.scala 356:18]
  wire [31:0] exCurMemReq_addr = ldstAddr[31:0]; // @[Backend.scala 353:22 Backend.scala 358:18]
  wire  _GEN_196 = isExPCJump & (_bpuErrpr_T_7 | ~exInsts_0_predict_taken | (|jumpPc[1:0])); // @[Backend.scala 407:29 Backend.scala 408:16 Backend.scala 376:12]
  wire  _GEN_198 = isExPCBr ? reBranchBrTaken ^ exInsts_0_predict_taken | reBranchBrTaken & (_bpuErrpr_T_2 | (|brPC[1:0]))
     : _GEN_196; // @[Backend.scala 384:21 Backend.scala 395:16]
  wire  reBranch = exInstsTrueValid_0 & _GEN_198; // @[Backend.scala 383:29 Backend.scala 376:12]
  wire  exInstsTrueValid_1 = mduValid & ~mduExptMask; // @[Backend.scala 426:35]
  wire [5:0] _delayed_req_bits_T_1 = {io_dcache_req_bits_addr[2:0], 3'h0}; // @[Backend.scala 449:81]
  wire  _GEN_210 = _kill_x_T & bpuV; // @[Backend.scala 479:26 Backend.scala 482:12 Backend.scala 503:12]
  wire  wbExcepts_0 = |wbInsts_0_pc[1:0]; // @[Backend.scala 540:39]
  wire  _regFile_io_wen_vec_0_T_2 = wbInsts_0_write_dest & ~wbExcepts_0; // @[Backend.scala 516:65]
  wire  wbExcepts_1 = |wbInsts_1_pc[1:0]; // @[Backend.scala 541:39]
  wire  _regFile_io_wen_vec_0_T_6 = _T_9 & ~wbExcepts_1; // @[Backend.scala 517:67]
  wire  wbLdMaReal = wbInstsValid_2 & wbLdMa; // @[Backend.scala 533:39]
  wire  _regFile_io_wen_vec_1_T_2 = wbInsts_2_write_dest & ~wbLdMaReal; // @[Backend.scala 523:65]
  wire  csrWbValid = wbInsts_0_next_pc == 3'h0 & wbInsts_0_alu_mdu_lsu == 2'h0; // @[Backend.scala 531:62]
  wire  wbALUSysReal = wbInsts_0_next_pc == 3'h4 & wbInstsValid_0; // @[Backend.scala 535:63]
  wire  wbALUBpReal = wbInsts_0_next_pc == 3'h7 & wbInstsValid_0; // @[Backend.scala 536:64]
  wire  illegal = wbInsts_0_illegal & wbInstsValid_0; // @[Backend.scala 537:42]
  wire  wbFetchMaReal = wbExcepts_0 & wbInstsValid_0; // @[Backend.scala 538:47]
  reg [63:0] wb_mmio_sd_data; // @[Backend.scala 560:33]
  reg [11:0] wb_mmio_num; // @[Backend.scala 561:30]
  wire [2:0] _wb_deal_with_int_T = {wbInstsValid_2,wbInstsValid_1,wbInstsValid_0}; // @[Backend.scala 562:61]
  wire  wb_deal_with_int = wbInterruptd & |_wb_deal_with_int_T & exInterruptd; // @[Backend.scala 562:89]
  wire [63:0] wb_pc_0 = wbInstsValid_0 ? wbInsts_0_pc : 64'hffffffffffffffff; // @[Backend.scala 565:20]
  wire [63:0] wb_pc_1 = wbInstsValid_1 ? wbInsts_1_pc : 64'hffffffffffffffff; // @[Backend.scala 565:20]
  wire [63:0] wb_pc_2 = wbInstsValid_2 ? wbInsts_2_pc : 64'hffffffffffffffff; // @[Backend.scala 565:20]
  wire [63:0] _wb_pc_min_T_2 = wb_pc_0 < wb_pc_2 ? wb_pc_0 : wb_pc_2; // @[Backend.scala 567:8]
  wire [63:0] _wb_pc_min_T_4 = wb_pc_1 < wb_pc_2 ? wb_pc_1 : wb_pc_2; // @[Backend.scala 568:8]
  wire [63:0] wb_pc_min = wb_pc_0 < wb_pc_1 ? _wb_pc_min_T_2 : _wb_pc_min_T_4; // @[Backend.scala 566:22]
  wire [63:0] _csr_io_event_io_epc_T_2 = wbALUSysReal | wbALUBpReal | illegal ? wbInsts_0_pc : wbInsts_1_pc; // @[Backend.scala 582:8]
  wire [11:0] _csr_io_common_io_num_T_1 = wbMMIOValid ? wb_mmio_num : wbInsts_0_imm[11:0]; // @[Backend.scala 588:8]
  wire [11:0] _csr_io_common_io_num_T_3 = exMMIOValid ? ex_mmio_num : exInsts_0_imm[11:0]; // @[Backend.scala 589:8]
  ysyx_210134_ALU alu ( // @[Backend.scala 51:28]
    .io_a(alu_io_a),
    .io_b(alu_io_b),
    .io_aluOp(alu_io_aluOp),
    .io_aluExpand(alu_io_aluExpand),
    .io_r(alu_io_r),
    .io_zero(alu_io_zero)
  );
  ysyx_210134_ALU mdu ( // @[Backend.scala 52:28]
    .io_a(mdu_io_a),
    .io_b(mdu_io_b),
    .io_aluOp(mdu_io_aluOp),
    .io_aluExpand(mdu_io_aluExpand),
    .io_r(mdu_io_r),
    .io_zero(mdu_io_zero)
  );
  ysyx_210134_FIFO issueQueue ( // @[Backend.scala 60:28]
    .clock(issueQueue_clock),
    .reset(issueQueue_reset),
    .io_dout_0_illegal(issueQueue_io_dout_0_illegal),
    .io_dout_0_next_pc(issueQueue_io_dout_0_next_pc),
    .io_dout_0_alu_mdu_lsu(issueQueue_io_dout_0_alu_mdu_lsu),
    .io_dout_0_branch_type(issueQueue_io_dout_0_branch_type),
    .io_dout_0_src_a(issueQueue_io_dout_0_src_a),
    .io_dout_0_src_b(issueQueue_io_dout_0_src_b),
    .io_dout_0_write_dest(issueQueue_io_dout_0_write_dest),
    .io_dout_0_alu_op(issueQueue_io_dout_0_alu_op),
    .io_dout_0_alu_expand(issueQueue_io_dout_0_alu_expand),
    .io_dout_0_mem_width(issueQueue_io_dout_0_mem_width),
    .io_dout_0_write_src(issueQueue_io_dout_0_write_src),
    .io_dout_0_rs1(issueQueue_io_dout_0_rs1),
    .io_dout_0_rs2(issueQueue_io_dout_0_rs2),
    .io_dout_0_rd(issueQueue_io_dout_0_rd),
    .io_dout_0_imm(issueQueue_io_dout_0_imm),
    .io_dout_0_pc(issueQueue_io_dout_0_pc),
    .io_dout_0_predict_taken(issueQueue_io_dout_0_predict_taken),
    .io_dout_0_target_pc(issueQueue_io_dout_0_target_pc),
    .io_dout_1_illegal(issueQueue_io_dout_1_illegal),
    .io_dout_1_next_pc(issueQueue_io_dout_1_next_pc),
    .io_dout_1_alu_mdu_lsu(issueQueue_io_dout_1_alu_mdu_lsu),
    .io_dout_1_branch_type(issueQueue_io_dout_1_branch_type),
    .io_dout_1_src_a(issueQueue_io_dout_1_src_a),
    .io_dout_1_src_b(issueQueue_io_dout_1_src_b),
    .io_dout_1_write_dest(issueQueue_io_dout_1_write_dest),
    .io_dout_1_alu_op(issueQueue_io_dout_1_alu_op),
    .io_dout_1_alu_expand(issueQueue_io_dout_1_alu_expand),
    .io_dout_1_mem_width(issueQueue_io_dout_1_mem_width),
    .io_dout_1_write_src(issueQueue_io_dout_1_write_src),
    .io_dout_1_rs1(issueQueue_io_dout_1_rs1),
    .io_dout_1_rs2(issueQueue_io_dout_1_rs2),
    .io_dout_1_rd(issueQueue_io_dout_1_rd),
    .io_dout_1_imm(issueQueue_io_dout_1_imm),
    .io_dout_1_pc(issueQueue_io_dout_1_pc),
    .io_dout_1_predict_taken(issueQueue_io_dout_1_predict_taken),
    .io_dout_1_target_pc(issueQueue_io_dout_1_target_pc),
    .io_enqStep(issueQueue_io_enqStep),
    .io_enqReq(issueQueue_io_enqReq),
    .io_deqStep(issueQueue_io_deqStep),
    .io_deqReq(issueQueue_io_deqReq),
    .io_din_0_illegal(issueQueue_io_din_0_illegal),
    .io_din_0_next_pc(issueQueue_io_din_0_next_pc),
    .io_din_0_alu_mdu_lsu(issueQueue_io_din_0_alu_mdu_lsu),
    .io_din_0_branch_type(issueQueue_io_din_0_branch_type),
    .io_din_0_src_a(issueQueue_io_din_0_src_a),
    .io_din_0_src_b(issueQueue_io_din_0_src_b),
    .io_din_0_write_dest(issueQueue_io_din_0_write_dest),
    .io_din_0_alu_op(issueQueue_io_din_0_alu_op),
    .io_din_0_alu_expand(issueQueue_io_din_0_alu_expand),
    .io_din_0_mem_width(issueQueue_io_din_0_mem_width),
    .io_din_0_write_src(issueQueue_io_din_0_write_src),
    .io_din_0_rs1(issueQueue_io_din_0_rs1),
    .io_din_0_rs2(issueQueue_io_din_0_rs2),
    .io_din_0_rd(issueQueue_io_din_0_rd),
    .io_din_0_imm(issueQueue_io_din_0_imm),
    .io_din_0_pc(issueQueue_io_din_0_pc),
    .io_din_0_predict_taken(issueQueue_io_din_0_predict_taken),
    .io_din_0_target_pc(issueQueue_io_din_0_target_pc),
    .io_din_1_illegal(issueQueue_io_din_1_illegal),
    .io_din_1_next_pc(issueQueue_io_din_1_next_pc),
    .io_din_1_alu_mdu_lsu(issueQueue_io_din_1_alu_mdu_lsu),
    .io_din_1_branch_type(issueQueue_io_din_1_branch_type),
    .io_din_1_src_a(issueQueue_io_din_1_src_a),
    .io_din_1_src_b(issueQueue_io_din_1_src_b),
    .io_din_1_write_dest(issueQueue_io_din_1_write_dest),
    .io_din_1_alu_op(issueQueue_io_din_1_alu_op),
    .io_din_1_alu_expand(issueQueue_io_din_1_alu_expand),
    .io_din_1_mem_width(issueQueue_io_din_1_mem_width),
    .io_din_1_write_src(issueQueue_io_din_1_write_src),
    .io_din_1_rs1(issueQueue_io_din_1_rs1),
    .io_din_1_rs2(issueQueue_io_din_1_rs2),
    .io_din_1_rd(issueQueue_io_din_1_rd),
    .io_din_1_imm(issueQueue_io_din_1_imm),
    .io_din_1_pc(issueQueue_io_din_1_pc),
    .io_din_1_predict_taken(issueQueue_io_din_1_predict_taken),
    .io_din_1_target_pc(issueQueue_io_din_1_target_pc),
    .io_flush(issueQueue_io_flush),
    .io_sufficient(issueQueue_io_sufficient),
    .io_items(issueQueue_io_items)
  );
  ysyx_210134_IssueArbiter issueArbiter ( // @[Backend.scala 61:28]
    .io_insts_in_0_illegal(issueArbiter_io_insts_in_0_illegal),
    .io_insts_in_0_next_pc(issueArbiter_io_insts_in_0_next_pc),
    .io_insts_in_0_alu_mdu_lsu(issueArbiter_io_insts_in_0_alu_mdu_lsu),
    .io_insts_in_0_branch_type(issueArbiter_io_insts_in_0_branch_type),
    .io_insts_in_0_src_a(issueArbiter_io_insts_in_0_src_a),
    .io_insts_in_0_src_b(issueArbiter_io_insts_in_0_src_b),
    .io_insts_in_0_write_dest(issueArbiter_io_insts_in_0_write_dest),
    .io_insts_in_0_alu_op(issueArbiter_io_insts_in_0_alu_op),
    .io_insts_in_0_alu_expand(issueArbiter_io_insts_in_0_alu_expand),
    .io_insts_in_0_mem_width(issueArbiter_io_insts_in_0_mem_width),
    .io_insts_in_0_write_src(issueArbiter_io_insts_in_0_write_src),
    .io_insts_in_0_rs1(issueArbiter_io_insts_in_0_rs1),
    .io_insts_in_0_rs2(issueArbiter_io_insts_in_0_rs2),
    .io_insts_in_0_rd(issueArbiter_io_insts_in_0_rd),
    .io_insts_in_0_imm(issueArbiter_io_insts_in_0_imm),
    .io_insts_in_0_pc(issueArbiter_io_insts_in_0_pc),
    .io_insts_in_0_predict_taken(issueArbiter_io_insts_in_0_predict_taken),
    .io_insts_in_0_target_pc(issueArbiter_io_insts_in_0_target_pc),
    .io_insts_in_1_illegal(issueArbiter_io_insts_in_1_illegal),
    .io_insts_in_1_next_pc(issueArbiter_io_insts_in_1_next_pc),
    .io_insts_in_1_alu_mdu_lsu(issueArbiter_io_insts_in_1_alu_mdu_lsu),
    .io_insts_in_1_branch_type(issueArbiter_io_insts_in_1_branch_type),
    .io_insts_in_1_src_a(issueArbiter_io_insts_in_1_src_a),
    .io_insts_in_1_src_b(issueArbiter_io_insts_in_1_src_b),
    .io_insts_in_1_write_dest(issueArbiter_io_insts_in_1_write_dest),
    .io_insts_in_1_alu_op(issueArbiter_io_insts_in_1_alu_op),
    .io_insts_in_1_alu_expand(issueArbiter_io_insts_in_1_alu_expand),
    .io_insts_in_1_mem_width(issueArbiter_io_insts_in_1_mem_width),
    .io_insts_in_1_write_src(issueArbiter_io_insts_in_1_write_src),
    .io_insts_in_1_rs1(issueArbiter_io_insts_in_1_rs1),
    .io_insts_in_1_rs2(issueArbiter_io_insts_in_1_rs2),
    .io_insts_in_1_rd(issueArbiter_io_insts_in_1_rd),
    .io_insts_in_1_imm(issueArbiter_io_insts_in_1_imm),
    .io_insts_in_1_pc(issueArbiter_io_insts_in_1_pc),
    .io_insts_in_1_predict_taken(issueArbiter_io_insts_in_1_predict_taken),
    .io_insts_in_1_target_pc(issueArbiter_io_insts_in_1_target_pc),
    .io_queue_items(issueArbiter_io_queue_items),
    .io_ld_dest_ex(issueArbiter_io_ld_dest_ex),
    .io_rss_in_0(issueArbiter_io_rss_in_0),
    .io_rss_in_1(issueArbiter_io_rss_in_1),
    .io_rts_in_0(issueArbiter_io_rts_in_0),
    .io_rts_in_1(issueArbiter_io_rts_in_1),
    .io_rss_out_0(issueArbiter_io_rss_out_0),
    .io_rss_out_1(issueArbiter_io_rss_out_1),
    .io_rss_out_2(issueArbiter_io_rss_out_2),
    .io_rts_out_0(issueArbiter_io_rts_out_0),
    .io_rts_out_1(issueArbiter_io_rts_out_1),
    .io_rts_out_2(issueArbiter_io_rts_out_2),
    .io_csr_ex(issueArbiter_io_csr_ex),
    .io_mmio_ex(issueArbiter_io_mmio_ex),
    .io_insts_out_0_illegal(issueArbiter_io_insts_out_0_illegal),
    .io_insts_out_0_next_pc(issueArbiter_io_insts_out_0_next_pc),
    .io_insts_out_0_alu_mdu_lsu(issueArbiter_io_insts_out_0_alu_mdu_lsu),
    .io_insts_out_0_branch_type(issueArbiter_io_insts_out_0_branch_type),
    .io_insts_out_0_src_a(issueArbiter_io_insts_out_0_src_a),
    .io_insts_out_0_src_b(issueArbiter_io_insts_out_0_src_b),
    .io_insts_out_0_write_dest(issueArbiter_io_insts_out_0_write_dest),
    .io_insts_out_0_alu_op(issueArbiter_io_insts_out_0_alu_op),
    .io_insts_out_0_alu_expand(issueArbiter_io_insts_out_0_alu_expand),
    .io_insts_out_0_write_src(issueArbiter_io_insts_out_0_write_src),
    .io_insts_out_0_rs1(issueArbiter_io_insts_out_0_rs1),
    .io_insts_out_0_rd(issueArbiter_io_insts_out_0_rd),
    .io_insts_out_0_imm(issueArbiter_io_insts_out_0_imm),
    .io_insts_out_0_pc(issueArbiter_io_insts_out_0_pc),
    .io_insts_out_0_predict_taken(issueArbiter_io_insts_out_0_predict_taken),
    .io_insts_out_0_target_pc(issueArbiter_io_insts_out_0_target_pc),
    .io_insts_out_1_src_a(issueArbiter_io_insts_out_1_src_a),
    .io_insts_out_1_src_b(issueArbiter_io_insts_out_1_src_b),
    .io_insts_out_1_write_dest(issueArbiter_io_insts_out_1_write_dest),
    .io_insts_out_1_alu_op(issueArbiter_io_insts_out_1_alu_op),
    .io_insts_out_1_alu_expand(issueArbiter_io_insts_out_1_alu_expand),
    .io_insts_out_1_rd(issueArbiter_io_insts_out_1_rd),
    .io_insts_out_1_imm(issueArbiter_io_insts_out_1_imm),
    .io_insts_out_1_pc(issueArbiter_io_insts_out_1_pc),
    .io_insts_out_2_write_dest(issueArbiter_io_insts_out_2_write_dest),
    .io_insts_out_2_mem_width(issueArbiter_io_insts_out_2_mem_width),
    .io_insts_out_2_rd(issueArbiter_io_insts_out_2_rd),
    .io_insts_out_2_imm(issueArbiter_io_insts_out_2_imm),
    .io_insts_out_2_pc(issueArbiter_io_insts_out_2_pc),
    .io_issue_num(issueArbiter_io_issue_num),
    .io_issue_fu_valid_0(issueArbiter_io_issue_fu_valid_0),
    .io_issue_fu_valid_1(issueArbiter_io_issue_fu_valid_1),
    .io_issue_fu_valid_2(issueArbiter_io_issue_fu_valid_2),
    .io_insts_order_0(issueArbiter_io_insts_order_0),
    .io_insts_order_1(issueArbiter_io_insts_order_1),
    .io_insts_order_2(issueArbiter_io_insts_order_2)
  );
  ysyx_210134_RegFile regFile ( // @[Backend.scala 123:32]
    .clock(regFile_clock),
    .reset(regFile_reset),
    .io_rs_addr_vec_0(regFile_io_rs_addr_vec_0),
    .io_rs_addr_vec_1(regFile_io_rs_addr_vec_1),
    .io_rs_addr_vec_2(regFile_io_rs_addr_vec_2),
    .io_rs_addr_vec_3(regFile_io_rs_addr_vec_3),
    .io_rs_data_vec_0(regFile_io_rs_data_vec_0),
    .io_rs_data_vec_1(regFile_io_rs_data_vec_1),
    .io_rs_data_vec_2(regFile_io_rs_data_vec_2),
    .io_rs_data_vec_3(regFile_io_rs_data_vec_3),
    .io_wen_vec_0(regFile_io_wen_vec_0),
    .io_wen_vec_1(regFile_io_wen_vec_1),
    .io_rd_addr_vec_0(regFile_io_rd_addr_vec_0),
    .io_rd_addr_vec_1(regFile_io_rd_addr_vec_1),
    .io_rd_data_vec_0(regFile_io_rd_data_vec_0),
    .io_rd_data_vec_1(regFile_io_rd_data_vec_1)
  );
  ysyx_210134_CSR csr ( // @[Backend.scala 124:32]
    .clock(csr_clock),
    .reset(csr_reset),
    .io_common_io_in(csr_io_common_io_in),
    .io_common_io_wen(csr_io_common_io_wen),
    .io_common_io_num(csr_io_common_io_num),
    .io_common_io_out(csr_io_common_io_out),
    .io_event_io_exception_vec_2(csr_io_event_io_exception_vec_2),
    .io_event_io_exception_vec_3(csr_io_event_io_exception_vec_3),
    .io_event_io_exception_vec_4(csr_io_event_io_exception_vec_4),
    .io_event_io_exception_vec_6(csr_io_event_io_exception_vec_6),
    .io_event_io_deal_with_int(csr_io_event_io_deal_with_int),
    .io_event_io_is_mret(csr_io_event_io_is_mret),
    .io_event_io_is_sret(csr_io_event_io_is_sret),
    .io_event_io_is_ecall(csr_io_event_io_is_ecall),
    .io_event_io_bad_address(csr_io_event_io_bad_address),
    .io_event_io_epc(csr_io_event_io_epc),
    .io_event_io_call_for_int(csr_io_event_io_call_for_int),
    .io_event_io_except_kill(csr_io_event_io_except_kill),
    .io_event_io_redirect_pc(csr_io_event_io_redirect_pc)
  );
  assign io_fb_bmfs_redirect_kill = wbReBranch | csr_io_event_io_except_kill; // @[Backend.scala 506:44]
  assign io_fb_bmfs_redirect_pc = csr_io_event_io_except_kill ? csr_io_event_io_redirect_pc : reBranchPC; // @[Backend.scala 507:36]
  assign io_fb_bmfs_bpu_v = wbBpuV; // @[Backend.scala 508:30]
  assign io_fb_bmfs_bpu_errpr = wbBpuErrpr; // @[Backend.scala 509:30]
  assign io_fb_bmfs_bpu_pc_br = wbBpuPCBr; // @[Backend.scala 510:30]
  assign io_fb_bmfs_bpu_target = wbBpuTarget; // @[Backend.scala 511:30]
  assign io_fb_bmfs_bpu_taken = wbBpuTaken; // @[Backend.scala 512:30]
  assign io_fb_fmbs_please_wait = ~issueQueue_io_sufficient; // @[Backend.scala 145:29]
  assign io_dcache_req_valid = exMemRealValid & ~exMMIOValid | dcacheStall; // @[Backend.scala 326:57]
  assign io_dcache_req_bits_addr = dcacheStall ? exLastMemReq_addr : exCurMemReq_addr; // @[Backend.scala 369:28]
  assign io_dcache_req_bits_wdata = dcacheStall ? exLastMemReq_wdata : exFwdRtData_2; // @[Backend.scala 369:28]
  assign io_dcache_req_bits_wen = dcacheStall ? exLastMemReq_wen : _stMisaligned_T; // @[Backend.scala 369:28]
  assign io_dcache_req_bits_mtype = dcacheStall ? exLastMemReq_mtype : exCurMemReq_mtype; // @[Backend.scala 369:28]
  assign alu_io_a = 2'h1 == exInsts_0_src_a ? _alu_io_a_T_4 : _alu_io_a_T_6; // @[Mux.scala 80:57]
  assign alu_io_b = 2'h2 == exInsts_0_src_b ? _alu_io_b_T_1 : _alu_io_b_T_3; // @[Mux.scala 80:57]
  assign alu_io_aluOp = exInsts_0_alu_op; // @[Backend.scala 308:16]
  assign alu_io_aluExpand = exInsts_0_alu_expand; // @[Backend.scala 309:20]
  assign mdu_io_a = exInsts_1_src_a == 2'h0 ? exFwdRsData_1 : exInsts_1_pc; // @[Backend.scala 314:18]
  assign mdu_io_b = exInsts_1_src_b == 2'h0 ? exFwdRtData_1 : exInsts_1_imm; // @[Backend.scala 315:18]
  assign mdu_io_aluOp = exInsts_1_alu_op; // @[Backend.scala 316:16]
  assign mdu_io_aluExpand = exInsts_1_alu_expand; // @[Backend.scala 317:20]
  assign issueQueue_clock = clock;
  assign issueQueue_reset = reset;
  assign issueQueue_io_enqStep = {{2'd0}, io_fb_fmbs_instn}; // @[Backend.scala 150:25]
  assign issueQueue_io_enqReq = io_fb_fmbs_instn != 2'h0; // @[Backend.scala 149:45]
  assign issueQueue_io_deqStep = {{2'd0}, _issueQueue_io_deqStep_T}; // @[Backend.scala 147:31]
  assign issueQueue_io_deqReq = _kill_x_T & ~(|issueQueue_io_items & issueNum == 2'h0) & ~csr_io_event_io_call_for_int; // @[Backend.scala 148:87]
  assign issueQueue_io_din_0_illegal = io_fb_fmbs_inst_ops_0[232]; // @[Backend.scala 155:60]
  assign issueQueue_io_din_0_next_pc = io_fb_fmbs_inst_ops_0[231:229]; // @[Backend.scala 155:60]
  assign issueQueue_io_din_0_alu_mdu_lsu = io_fb_fmbs_inst_ops_0[228:227]; // @[Backend.scala 155:60]
  assign issueQueue_io_din_0_branch_type = io_fb_fmbs_inst_ops_0[226:223]; // @[Backend.scala 155:60]
  assign issueQueue_io_din_0_src_a = io_fb_fmbs_inst_ops_0[222:221]; // @[Backend.scala 155:60]
  assign issueQueue_io_din_0_src_b = io_fb_fmbs_inst_ops_0[220:219]; // @[Backend.scala 155:60]
  assign issueQueue_io_din_0_write_dest = io_fb_fmbs_inst_ops_0[218]; // @[Backend.scala 155:60]
  assign issueQueue_io_din_0_alu_op = io_fb_fmbs_inst_ops_0[217:214]; // @[Backend.scala 155:60]
  assign issueQueue_io_din_0_alu_expand = io_fb_fmbs_inst_ops_0[213]; // @[Backend.scala 155:60]
  assign issueQueue_io_din_0_mem_width = io_fb_fmbs_inst_ops_0[212:210]; // @[Backend.scala 155:60]
  assign issueQueue_io_din_0_write_src = io_fb_fmbs_inst_ops_0[209:208]; // @[Backend.scala 155:60]
  assign issueQueue_io_din_0_rs1 = io_fb_fmbs_inst_ops_0[207:203]; // @[Backend.scala 155:60]
  assign issueQueue_io_din_0_rs2 = io_fb_fmbs_inst_ops_0[202:198]; // @[Backend.scala 155:60]
  assign issueQueue_io_din_0_rd = io_fb_fmbs_inst_ops_0[197:193]; // @[Backend.scala 155:60]
  assign issueQueue_io_din_0_imm = io_fb_fmbs_inst_ops_0[192:129]; // @[Backend.scala 155:60]
  assign issueQueue_io_din_0_pc = io_fb_fmbs_inst_ops_0[128:65]; // @[Backend.scala 155:60]
  assign issueQueue_io_din_0_predict_taken = io_fb_fmbs_inst_ops_0[64]; // @[Backend.scala 155:60]
  assign issueQueue_io_din_0_target_pc = io_fb_fmbs_inst_ops_0[63:0]; // @[Backend.scala 155:60]
  assign issueQueue_io_din_1_illegal = io_fb_fmbs_inst_ops_1[232]; // @[Backend.scala 155:60]
  assign issueQueue_io_din_1_next_pc = io_fb_fmbs_inst_ops_1[231:229]; // @[Backend.scala 155:60]
  assign issueQueue_io_din_1_alu_mdu_lsu = io_fb_fmbs_inst_ops_1[228:227]; // @[Backend.scala 155:60]
  assign issueQueue_io_din_1_branch_type = io_fb_fmbs_inst_ops_1[226:223]; // @[Backend.scala 155:60]
  assign issueQueue_io_din_1_src_a = io_fb_fmbs_inst_ops_1[222:221]; // @[Backend.scala 155:60]
  assign issueQueue_io_din_1_src_b = io_fb_fmbs_inst_ops_1[220:219]; // @[Backend.scala 155:60]
  assign issueQueue_io_din_1_write_dest = io_fb_fmbs_inst_ops_1[218]; // @[Backend.scala 155:60]
  assign issueQueue_io_din_1_alu_op = io_fb_fmbs_inst_ops_1[217:214]; // @[Backend.scala 155:60]
  assign issueQueue_io_din_1_alu_expand = io_fb_fmbs_inst_ops_1[213]; // @[Backend.scala 155:60]
  assign issueQueue_io_din_1_mem_width = io_fb_fmbs_inst_ops_1[212:210]; // @[Backend.scala 155:60]
  assign issueQueue_io_din_1_write_src = io_fb_fmbs_inst_ops_1[209:208]; // @[Backend.scala 155:60]
  assign issueQueue_io_din_1_rs1 = io_fb_fmbs_inst_ops_1[207:203]; // @[Backend.scala 155:60]
  assign issueQueue_io_din_1_rs2 = io_fb_fmbs_inst_ops_1[202:198]; // @[Backend.scala 155:60]
  assign issueQueue_io_din_1_rd = io_fb_fmbs_inst_ops_1[197:193]; // @[Backend.scala 155:60]
  assign issueQueue_io_din_1_imm = io_fb_fmbs_inst_ops_1[192:129]; // @[Backend.scala 155:60]
  assign issueQueue_io_din_1_pc = io_fb_fmbs_inst_ops_1[128:65]; // @[Backend.scala 155:60]
  assign issueQueue_io_din_1_predict_taken = io_fb_fmbs_inst_ops_1[64]; // @[Backend.scala 155:60]
  assign issueQueue_io_din_1_target_pc = io_fb_fmbs_inst_ops_1[63:0]; // @[Backend.scala 155:60]
  assign issueQueue_io_flush = io_fb_bmfs_redirect_kill; // @[Backend.scala 146:25]
  assign issueArbiter_io_insts_in_0_illegal = issueQueue_io_dout_0_illegal; // @[Backend.scala 57:26 Backend.scala 152:19]
  assign issueArbiter_io_insts_in_0_next_pc = issueQueue_io_dout_0_next_pc; // @[Backend.scala 57:26 Backend.scala 152:19]
  assign issueArbiter_io_insts_in_0_alu_mdu_lsu = issueQueue_io_dout_0_alu_mdu_lsu; // @[Backend.scala 57:26 Backend.scala 152:19]
  assign issueArbiter_io_insts_in_0_branch_type = issueQueue_io_dout_0_branch_type; // @[Backend.scala 57:26 Backend.scala 152:19]
  assign issueArbiter_io_insts_in_0_src_a = issueQueue_io_dout_0_src_a; // @[Backend.scala 57:26 Backend.scala 152:19]
  assign issueArbiter_io_insts_in_0_src_b = issueQueue_io_dout_0_src_b; // @[Backend.scala 57:26 Backend.scala 152:19]
  assign issueArbiter_io_insts_in_0_write_dest = issueQueue_io_dout_0_write_dest; // @[Backend.scala 57:26 Backend.scala 152:19]
  assign issueArbiter_io_insts_in_0_alu_op = issueQueue_io_dout_0_alu_op; // @[Backend.scala 57:26 Backend.scala 152:19]
  assign issueArbiter_io_insts_in_0_alu_expand = issueQueue_io_dout_0_alu_expand; // @[Backend.scala 57:26 Backend.scala 152:19]
  assign issueArbiter_io_insts_in_0_mem_width = issueQueue_io_dout_0_mem_width; // @[Backend.scala 57:26 Backend.scala 152:19]
  assign issueArbiter_io_insts_in_0_write_src = issueQueue_io_dout_0_write_src; // @[Backend.scala 57:26 Backend.scala 152:19]
  assign issueArbiter_io_insts_in_0_rs1 = issueQueue_io_dout_0_rs1; // @[Backend.scala 57:26 Backend.scala 152:19]
  assign issueArbiter_io_insts_in_0_rs2 = issueQueue_io_dout_0_rs2; // @[Backend.scala 57:26 Backend.scala 152:19]
  assign issueArbiter_io_insts_in_0_rd = issueQueue_io_dout_0_rd; // @[Backend.scala 57:26 Backend.scala 152:19]
  assign issueArbiter_io_insts_in_0_imm = issueQueue_io_dout_0_imm; // @[Backend.scala 57:26 Backend.scala 152:19]
  assign issueArbiter_io_insts_in_0_pc = issueQueue_io_dout_0_pc; // @[Backend.scala 57:26 Backend.scala 152:19]
  assign issueArbiter_io_insts_in_0_predict_taken = issueQueue_io_dout_0_predict_taken; // @[Backend.scala 57:26 Backend.scala 152:19]
  assign issueArbiter_io_insts_in_0_target_pc = issueQueue_io_dout_0_target_pc; // @[Backend.scala 57:26 Backend.scala 152:19]
  assign issueArbiter_io_insts_in_1_illegal = issueQueue_io_dout_1_illegal; // @[Backend.scala 57:26 Backend.scala 152:19]
  assign issueArbiter_io_insts_in_1_next_pc = issueQueue_io_dout_1_next_pc; // @[Backend.scala 57:26 Backend.scala 152:19]
  assign issueArbiter_io_insts_in_1_alu_mdu_lsu = issueQueue_io_dout_1_alu_mdu_lsu; // @[Backend.scala 57:26 Backend.scala 152:19]
  assign issueArbiter_io_insts_in_1_branch_type = issueQueue_io_dout_1_branch_type; // @[Backend.scala 57:26 Backend.scala 152:19]
  assign issueArbiter_io_insts_in_1_src_a = issueQueue_io_dout_1_src_a; // @[Backend.scala 57:26 Backend.scala 152:19]
  assign issueArbiter_io_insts_in_1_src_b = issueQueue_io_dout_1_src_b; // @[Backend.scala 57:26 Backend.scala 152:19]
  assign issueArbiter_io_insts_in_1_write_dest = issueQueue_io_dout_1_write_dest; // @[Backend.scala 57:26 Backend.scala 152:19]
  assign issueArbiter_io_insts_in_1_alu_op = issueQueue_io_dout_1_alu_op; // @[Backend.scala 57:26 Backend.scala 152:19]
  assign issueArbiter_io_insts_in_1_alu_expand = issueQueue_io_dout_1_alu_expand; // @[Backend.scala 57:26 Backend.scala 152:19]
  assign issueArbiter_io_insts_in_1_mem_width = issueQueue_io_dout_1_mem_width; // @[Backend.scala 57:26 Backend.scala 152:19]
  assign issueArbiter_io_insts_in_1_write_src = issueQueue_io_dout_1_write_src; // @[Backend.scala 57:26 Backend.scala 152:19]
  assign issueArbiter_io_insts_in_1_rs1 = issueQueue_io_dout_1_rs1; // @[Backend.scala 57:26 Backend.scala 152:19]
  assign issueArbiter_io_insts_in_1_rs2 = issueQueue_io_dout_1_rs2; // @[Backend.scala 57:26 Backend.scala 152:19]
  assign issueArbiter_io_insts_in_1_rd = issueQueue_io_dout_1_rd; // @[Backend.scala 57:26 Backend.scala 152:19]
  assign issueArbiter_io_insts_in_1_imm = issueQueue_io_dout_1_imm; // @[Backend.scala 57:26 Backend.scala 152:19]
  assign issueArbiter_io_insts_in_1_pc = issueQueue_io_dout_1_pc; // @[Backend.scala 57:26 Backend.scala 152:19]
  assign issueArbiter_io_insts_in_1_predict_taken = issueQueue_io_dout_1_predict_taken; // @[Backend.scala 57:26 Backend.scala 152:19]
  assign issueArbiter_io_insts_in_1_target_pc = issueQueue_io_dout_1_target_pc; // @[Backend.scala 57:26 Backend.scala 152:19]
  assign issueArbiter_io_queue_items = blockSecondItem ? {{3'd0}, trap_ret_items0} : issueQueue_io_items; // @[Backend.scala 173:37]
  assign issueArbiter_io_ld_dest_ex = _issueArbiter_io_ld_dest_ex_T_1 & exInsts_2_rd; // @[Backend.scala 177:71]
  assign issueArbiter_io_rss_in_0 = exInstsValid_1 & exInsts_1_write_dest & exInsts_1_rd != 5'h0 ? _GEN_32 : _GEN_28; // @[Backend.scala 215:96]
  assign issueArbiter_io_rss_in_1 = exInstsValid_1 & exInsts_1_write_dest & exInsts_1_rd != 5'h0 ? _GEN_34 : _GEN_30; // @[Backend.scala 215:96]
  assign issueArbiter_io_rts_in_0 = exInstsValid_1 & exInsts_1_write_dest & exInsts_1_rd != 5'h0 ? _GEN_33 : _GEN_29; // @[Backend.scala 215:96]
  assign issueArbiter_io_rts_in_1 = exInstsValid_1 & exInsts_1_write_dest & exInsts_1_rd != 5'h0 ? _GEN_35 : _GEN_31; // @[Backend.scala 215:96]
  assign issueArbiter_io_csr_ex = exInstsValid_0 & exCsrValid; // @[Backend.scala 176:50]
  assign issueArbiter_io_mmio_ex = exInstsValid_2 & |ex_mmio_num; // @[Backend.scala 172:37]
  assign regFile_clock = clock;
  assign regFile_reset = reset;
  assign regFile_io_rs_addr_vec_0 = issueQueue_io_dout_0_rs1; // @[Backend.scala 57:26 Backend.scala 152:19]
  assign regFile_io_rs_addr_vec_1 = issueQueue_io_dout_0_rs2; // @[Backend.scala 57:26 Backend.scala 152:19]
  assign regFile_io_rs_addr_vec_2 = issueQueue_io_dout_1_rs1; // @[Backend.scala 57:26 Backend.scala 152:19]
  assign regFile_io_rs_addr_vec_3 = issueQueue_io_dout_1_rs2; // @[Backend.scala 57:26 Backend.scala 152:19]
  assign regFile_io_wen_vec_0 = wbInstsValid_0 ? _regFile_io_wen_vec_0_T_2 : _regFile_io_wen_vec_0_T_6; // @[Backend.scala 515:31]
  assign regFile_io_wen_vec_1 = wbInstsValid_2 ? _regFile_io_wen_vec_1_T_2 : _regFile_io_wen_vec_0_T_6; // @[Backend.scala 522:31]
  assign regFile_io_rd_addr_vec_0 = wbInstsValid_0 ? wbInsts_0_rd : wbInsts_1_rd; // @[Backend.scala 519:35]
  assign regFile_io_rd_addr_vec_1 = wbInstsValid_2 ? wbInsts_2_rd : wbInsts_1_rd; // @[Backend.scala 527:35]
  assign regFile_io_rd_data_vec_0 = wbInstsValid_0 ? wbResult_0 : wbResult_1; // @[Backend.scala 520:35]
  assign regFile_io_rd_data_vec_1 = wbInstsValid_2 ? wbLdData : wbResult_1; // @[Backend.scala 526:35]
  assign csr_clock = clock;
  assign csr_reset = reset;
  assign csr_io_common_io_in = wbMMIOValid ? wb_mmio_sd_data : wbCsrData; // @[Backend.scala 590:37]
  assign csr_io_common_io_wen = csrWbValid & wbInstsValid_0 | wbMMIOValid & ~wbInsts_2_write_dest; // @[Backend.scala 586:66]
  assign csr_io_common_io_num = csr_io_common_io_wen ? _csr_io_common_io_num_T_1 : _csr_io_common_io_num_T_3; // @[Backend.scala 587:37]
  assign csr_io_event_io_exception_vec_2 = wbInsts_0_illegal & wbInstsValid_0; // @[Backend.scala 537:42]
  assign csr_io_event_io_exception_vec_3 = wbInsts_0_next_pc == 3'h7 & wbInstsValid_0; // @[Backend.scala 536:64]
  assign csr_io_event_io_exception_vec_4 = wbLdMaReal | wbFetchMaReal; // @[Backend.scala 553:59]
  assign csr_io_event_io_exception_vec_6 = wbInstsValid_2 & wbStMa; // @[Backend.scala 534:39]
  assign csr_io_event_io_deal_with_int = wbInterruptd & |_wb_deal_with_int_T & exInterruptd; // @[Backend.scala 562:89]
  assign csr_io_event_io_is_mret = wbInsts_0_next_pc == 3'h5 & wbInstsValid_0; // @[Backend.scala 577:74]
  assign csr_io_event_io_is_sret = wbInsts_0_next_pc == 3'h6 & wbInstsValid_0; // @[Backend.scala 578:74]
  assign csr_io_event_io_is_ecall = wbInsts_0_next_pc == 3'h4 & wbInstsValid_0; // @[Backend.scala 535:63]
  assign csr_io_event_io_bad_address = wbFetchMaReal ? wbInsts_0_pc : {{32'd0}, wbMisalignedAddr}; // @[Backend.scala 583:37]
  assign csr_io_event_io_epc = wb_deal_with_int ? wb_pc_min : _csr_io_event_io_epc_T_2; // @[Backend.scala 581:37]
  always @(posedge clock) begin
    if (reset) begin // @[Backend.scala 320:34]
      exLastMemReqValid <= 1'h0; // @[Backend.scala 320:34]
    end else if (_kill_x_T) begin // @[Backend.scala 363:23]
      exLastMemReqValid <= _io_dcache_req_valid_T_1; // @[Backend.scala 364:23]
    end
    if (reset) begin // @[Backend.scala 73:29]
      exInsts_0_illegal <= 1'h0; // @[Backend.scala 73:29]
    end else if (kill_x) begin // @[Backend.scala 254:17]
      exInsts_0_illegal <= 1'h0; // @[Backend.scala 257:18]
    end else if (_kill_x_T) begin // @[Backend.scala 260:24]
      if (csr_io_event_io_call_for_int) begin // @[Backend.scala 262:41]
        exInsts_0_illegal <= 1'h0; // @[Backend.scala 266:18]
      end else begin
        exInsts_0_illegal <= issueArbiter_io_insts_out_0_illegal; // @[Backend.scala 272:20]
      end
    end
    if (reset) begin // @[Backend.scala 73:29]
      exInsts_0_next_pc <= 3'h0; // @[Backend.scala 73:29]
    end else if (kill_x) begin // @[Backend.scala 254:17]
      exInsts_0_next_pc <= 3'h0; // @[Backend.scala 257:18]
    end else if (_kill_x_T) begin // @[Backend.scala 260:24]
      if (csr_io_event_io_call_for_int) begin // @[Backend.scala 262:41]
        exInsts_0_next_pc <= 3'h0; // @[Backend.scala 266:18]
      end else begin
        exInsts_0_next_pc <= issueArbiter_io_insts_out_0_next_pc; // @[Backend.scala 272:20]
      end
    end
    if (reset) begin // @[Backend.scala 73:29]
      exInsts_0_alu_mdu_lsu <= 2'h3; // @[Backend.scala 73:29]
    end else if (kill_x) begin // @[Backend.scala 254:17]
      exInsts_0_alu_mdu_lsu <= 2'h3; // @[Backend.scala 257:18]
    end else if (_kill_x_T) begin // @[Backend.scala 260:24]
      if (csr_io_event_io_call_for_int) begin // @[Backend.scala 262:41]
        exInsts_0_alu_mdu_lsu <= 2'h3; // @[Backend.scala 266:18]
      end else begin
        exInsts_0_alu_mdu_lsu <= issueArbiter_io_insts_out_0_alu_mdu_lsu; // @[Backend.scala 272:20]
      end
    end
    if (reset) begin // @[Backend.scala 73:29]
      exInsts_0_branch_type <= 4'h0; // @[Backend.scala 73:29]
    end else if (kill_x) begin // @[Backend.scala 254:17]
      exInsts_0_branch_type <= 4'h0; // @[Backend.scala 257:18]
    end else if (_kill_x_T) begin // @[Backend.scala 260:24]
      if (csr_io_event_io_call_for_int) begin // @[Backend.scala 262:41]
        exInsts_0_branch_type <= 4'h0; // @[Backend.scala 266:18]
      end else begin
        exInsts_0_branch_type <= issueArbiter_io_insts_out_0_branch_type; // @[Backend.scala 272:20]
      end
    end
    if (reset) begin // @[Backend.scala 73:29]
      exInsts_0_src_a <= 2'h0; // @[Backend.scala 73:29]
    end else if (kill_x) begin // @[Backend.scala 254:17]
      exInsts_0_src_a <= 2'h0; // @[Backend.scala 257:18]
    end else if (_kill_x_T) begin // @[Backend.scala 260:24]
      if (csr_io_event_io_call_for_int) begin // @[Backend.scala 262:41]
        exInsts_0_src_a <= 2'h0; // @[Backend.scala 266:18]
      end else begin
        exInsts_0_src_a <= issueArbiter_io_insts_out_0_src_a; // @[Backend.scala 272:20]
      end
    end
    if (reset) begin // @[Backend.scala 73:29]
      exInsts_0_src_b <= 2'h0; // @[Backend.scala 73:29]
    end else if (kill_x) begin // @[Backend.scala 254:17]
      exInsts_0_src_b <= 2'h0; // @[Backend.scala 257:18]
    end else if (_kill_x_T) begin // @[Backend.scala 260:24]
      if (csr_io_event_io_call_for_int) begin // @[Backend.scala 262:41]
        exInsts_0_src_b <= 2'h0; // @[Backend.scala 266:18]
      end else begin
        exInsts_0_src_b <= issueArbiter_io_insts_out_0_src_b; // @[Backend.scala 272:20]
      end
    end
    if (reset) begin // @[Backend.scala 73:29]
      exInsts_0_write_dest <= 1'h0; // @[Backend.scala 73:29]
    end else if (kill_x) begin // @[Backend.scala 254:17]
      exInsts_0_write_dest <= 1'h0; // @[Backend.scala 257:18]
    end else if (_kill_x_T) begin // @[Backend.scala 260:24]
      if (csr_io_event_io_call_for_int) begin // @[Backend.scala 262:41]
        exInsts_0_write_dest <= 1'h0; // @[Backend.scala 266:18]
      end else begin
        exInsts_0_write_dest <= issueArbiter_io_insts_out_0_write_dest; // @[Backend.scala 272:20]
      end
    end
    if (reset) begin // @[Backend.scala 73:29]
      exInsts_0_alu_op <= 4'h0; // @[Backend.scala 73:29]
    end else if (kill_x) begin // @[Backend.scala 254:17]
      exInsts_0_alu_op <= 4'h0; // @[Backend.scala 257:18]
    end else if (_kill_x_T) begin // @[Backend.scala 260:24]
      if (csr_io_event_io_call_for_int) begin // @[Backend.scala 262:41]
        exInsts_0_alu_op <= 4'h0; // @[Backend.scala 266:18]
      end else begin
        exInsts_0_alu_op <= issueArbiter_io_insts_out_0_alu_op; // @[Backend.scala 272:20]
      end
    end
    if (reset) begin // @[Backend.scala 73:29]
      exInsts_0_alu_expand <= 1'h0; // @[Backend.scala 73:29]
    end else if (kill_x) begin // @[Backend.scala 254:17]
      exInsts_0_alu_expand <= 1'h0; // @[Backend.scala 257:18]
    end else if (_kill_x_T) begin // @[Backend.scala 260:24]
      if (csr_io_event_io_call_for_int) begin // @[Backend.scala 262:41]
        exInsts_0_alu_expand <= 1'h0; // @[Backend.scala 266:18]
      end else begin
        exInsts_0_alu_expand <= issueArbiter_io_insts_out_0_alu_expand; // @[Backend.scala 272:20]
      end
    end
    if (reset) begin // @[Backend.scala 73:29]
      exInsts_0_write_src <= 2'h1; // @[Backend.scala 73:29]
    end else if (kill_x) begin // @[Backend.scala 254:17]
      exInsts_0_write_src <= 2'h1; // @[Backend.scala 257:18]
    end else if (_kill_x_T) begin // @[Backend.scala 260:24]
      if (csr_io_event_io_call_for_int) begin // @[Backend.scala 262:41]
        exInsts_0_write_src <= 2'h1; // @[Backend.scala 266:18]
      end else begin
        exInsts_0_write_src <= issueArbiter_io_insts_out_0_write_src; // @[Backend.scala 272:20]
      end
    end
    if (reset) begin // @[Backend.scala 73:29]
      exInsts_0_rs1 <= 5'h0; // @[Backend.scala 73:29]
    end else if (kill_x) begin // @[Backend.scala 254:17]
      exInsts_0_rs1 <= 5'h0; // @[Backend.scala 257:18]
    end else if (_kill_x_T) begin // @[Backend.scala 260:24]
      if (csr_io_event_io_call_for_int) begin // @[Backend.scala 262:41]
        exInsts_0_rs1 <= 5'h0; // @[Backend.scala 266:18]
      end else begin
        exInsts_0_rs1 <= issueArbiter_io_insts_out_0_rs1; // @[Backend.scala 272:20]
      end
    end
    if (reset) begin // @[Backend.scala 73:29]
      exInsts_0_rd <= 5'h0; // @[Backend.scala 73:29]
    end else if (kill_x) begin // @[Backend.scala 254:17]
      exInsts_0_rd <= 5'h0; // @[Backend.scala 257:18]
    end else if (_kill_x_T) begin // @[Backend.scala 260:24]
      if (csr_io_event_io_call_for_int) begin // @[Backend.scala 262:41]
        exInsts_0_rd <= 5'h0; // @[Backend.scala 266:18]
      end else begin
        exInsts_0_rd <= issueArbiter_io_insts_out_0_rd; // @[Backend.scala 272:20]
      end
    end
    if (reset) begin // @[Backend.scala 73:29]
      exInsts_0_imm <= 64'h0; // @[Backend.scala 73:29]
    end else if (kill_x) begin // @[Backend.scala 254:17]
      exInsts_0_imm <= 64'h0; // @[Backend.scala 257:18]
    end else if (_kill_x_T) begin // @[Backend.scala 260:24]
      if (csr_io_event_io_call_for_int) begin // @[Backend.scala 262:41]
        exInsts_0_imm <= 64'h0; // @[Backend.scala 266:18]
      end else begin
        exInsts_0_imm <= issueArbiter_io_insts_out_0_imm; // @[Backend.scala 272:20]
      end
    end
    if (reset) begin // @[Backend.scala 73:29]
      exInsts_0_pc <= 64'h0; // @[Backend.scala 73:29]
    end else if (kill_x) begin // @[Backend.scala 254:17]
      exInsts_0_pc <= 64'h0; // @[Backend.scala 257:18]
    end else if (_kill_x_T) begin // @[Backend.scala 260:24]
      if (csr_io_event_io_call_for_int) begin // @[Backend.scala 262:41]
        exInsts_0_pc <= issueInsts_0_pc; // @[Backend.scala 266:18]
      end else begin
        exInsts_0_pc <= issueArbiter_io_insts_out_0_pc; // @[Backend.scala 272:20]
      end
    end
    if (reset) begin // @[Backend.scala 73:29]
      exInsts_0_predict_taken <= 1'h0; // @[Backend.scala 73:29]
    end else if (kill_x) begin // @[Backend.scala 254:17]
      exInsts_0_predict_taken <= 1'h0; // @[Backend.scala 257:18]
    end else if (_kill_x_T) begin // @[Backend.scala 260:24]
      if (csr_io_event_io_call_for_int) begin // @[Backend.scala 262:41]
        exInsts_0_predict_taken <= 1'h0; // @[Backend.scala 266:18]
      end else begin
        exInsts_0_predict_taken <= issueArbiter_io_insts_out_0_predict_taken; // @[Backend.scala 272:20]
      end
    end
    if (reset) begin // @[Backend.scala 73:29]
      exInsts_0_target_pc <= 64'h0; // @[Backend.scala 73:29]
    end else if (kill_x) begin // @[Backend.scala 254:17]
      exInsts_0_target_pc <= 64'h0; // @[Backend.scala 257:18]
    end else if (_kill_x_T) begin // @[Backend.scala 260:24]
      if (csr_io_event_io_call_for_int) begin // @[Backend.scala 262:41]
        exInsts_0_target_pc <= 64'h0; // @[Backend.scala 266:18]
      end else begin
        exInsts_0_target_pc <= issueArbiter_io_insts_out_0_target_pc; // @[Backend.scala 272:20]
      end
    end
    if (reset) begin // @[Backend.scala 73:29]
      exInsts_1_src_a <= 2'h0; // @[Backend.scala 73:29]
    end else if (kill_x) begin // @[Backend.scala 254:17]
      exInsts_1_src_a <= 2'h0; // @[Backend.scala 257:18]
    end else if (_kill_x_T) begin // @[Backend.scala 260:24]
      exInsts_1_src_a <= issueArbiter_io_insts_out_1_src_a; // @[Backend.scala 275:18]
    end
    if (reset) begin // @[Backend.scala 73:29]
      exInsts_1_src_b <= 2'h0; // @[Backend.scala 73:29]
    end else if (kill_x) begin // @[Backend.scala 254:17]
      exInsts_1_src_b <= 2'h0; // @[Backend.scala 257:18]
    end else if (_kill_x_T) begin // @[Backend.scala 260:24]
      exInsts_1_src_b <= issueArbiter_io_insts_out_1_src_b; // @[Backend.scala 275:18]
    end
    if (reset) begin // @[Backend.scala 73:29]
      exInsts_1_write_dest <= 1'h0; // @[Backend.scala 73:29]
    end else if (kill_x) begin // @[Backend.scala 254:17]
      exInsts_1_write_dest <= 1'h0; // @[Backend.scala 257:18]
    end else if (_kill_x_T) begin // @[Backend.scala 260:24]
      exInsts_1_write_dest <= issueArbiter_io_insts_out_1_write_dest; // @[Backend.scala 275:18]
    end
    if (reset) begin // @[Backend.scala 73:29]
      exInsts_1_alu_op <= 4'h0; // @[Backend.scala 73:29]
    end else if (kill_x) begin // @[Backend.scala 254:17]
      exInsts_1_alu_op <= 4'h0; // @[Backend.scala 257:18]
    end else if (_kill_x_T) begin // @[Backend.scala 260:24]
      exInsts_1_alu_op <= issueArbiter_io_insts_out_1_alu_op; // @[Backend.scala 275:18]
    end
    if (reset) begin // @[Backend.scala 73:29]
      exInsts_1_alu_expand <= 1'h0; // @[Backend.scala 73:29]
    end else if (kill_x) begin // @[Backend.scala 254:17]
      exInsts_1_alu_expand <= 1'h0; // @[Backend.scala 257:18]
    end else if (_kill_x_T) begin // @[Backend.scala 260:24]
      exInsts_1_alu_expand <= issueArbiter_io_insts_out_1_alu_expand; // @[Backend.scala 275:18]
    end
    if (reset) begin // @[Backend.scala 73:29]
      exInsts_1_rd <= 5'h0; // @[Backend.scala 73:29]
    end else if (kill_x) begin // @[Backend.scala 254:17]
      exInsts_1_rd <= 5'h0; // @[Backend.scala 257:18]
    end else if (_kill_x_T) begin // @[Backend.scala 260:24]
      exInsts_1_rd <= issueArbiter_io_insts_out_1_rd; // @[Backend.scala 275:18]
    end
    if (reset) begin // @[Backend.scala 73:29]
      exInsts_1_imm <= 64'h0; // @[Backend.scala 73:29]
    end else if (kill_x) begin // @[Backend.scala 254:17]
      exInsts_1_imm <= 64'h0; // @[Backend.scala 257:18]
    end else if (_kill_x_T) begin // @[Backend.scala 260:24]
      exInsts_1_imm <= issueArbiter_io_insts_out_1_imm; // @[Backend.scala 275:18]
    end
    if (reset) begin // @[Backend.scala 73:29]
      exInsts_1_pc <= 64'h0; // @[Backend.scala 73:29]
    end else if (kill_x) begin // @[Backend.scala 254:17]
      exInsts_1_pc <= 64'h0; // @[Backend.scala 257:18]
    end else if (_kill_x_T) begin // @[Backend.scala 260:24]
      exInsts_1_pc <= issueArbiter_io_insts_out_1_pc; // @[Backend.scala 275:18]
    end
    if (reset) begin // @[Backend.scala 73:29]
      exInsts_2_write_dest <= 1'h0; // @[Backend.scala 73:29]
    end else if (kill_x) begin // @[Backend.scala 254:17]
      exInsts_2_write_dest <= 1'h0; // @[Backend.scala 257:18]
    end else if (_kill_x_T) begin // @[Backend.scala 260:24]
      exInsts_2_write_dest <= issueArbiter_io_insts_out_2_write_dest; // @[Backend.scala 275:18]
    end
    if (reset) begin // @[Backend.scala 73:29]
      exInsts_2_mem_width <= 3'h0; // @[Backend.scala 73:29]
    end else if (kill_x) begin // @[Backend.scala 254:17]
      exInsts_2_mem_width <= 3'h0; // @[Backend.scala 257:18]
    end else if (_kill_x_T) begin // @[Backend.scala 260:24]
      exInsts_2_mem_width <= issueArbiter_io_insts_out_2_mem_width; // @[Backend.scala 275:18]
    end
    if (reset) begin // @[Backend.scala 73:29]
      exInsts_2_rd <= 5'h0; // @[Backend.scala 73:29]
    end else if (kill_x) begin // @[Backend.scala 254:17]
      exInsts_2_rd <= 5'h0; // @[Backend.scala 257:18]
    end else if (_kill_x_T) begin // @[Backend.scala 260:24]
      exInsts_2_rd <= issueArbiter_io_insts_out_2_rd; // @[Backend.scala 275:18]
    end
    if (reset) begin // @[Backend.scala 73:29]
      exInsts_2_imm <= 64'h0; // @[Backend.scala 73:29]
    end else if (kill_x) begin // @[Backend.scala 254:17]
      exInsts_2_imm <= 64'h0; // @[Backend.scala 257:18]
    end else if (_kill_x_T) begin // @[Backend.scala 260:24]
      exInsts_2_imm <= issueArbiter_io_insts_out_2_imm; // @[Backend.scala 275:18]
    end
    if (reset) begin // @[Backend.scala 73:29]
      exInsts_2_pc <= 64'h0; // @[Backend.scala 73:29]
    end else if (kill_x) begin // @[Backend.scala 254:17]
      exInsts_2_pc <= 64'h0; // @[Backend.scala 257:18]
    end else if (_kill_x_T) begin // @[Backend.scala 260:24]
      exInsts_2_pc <= issueArbiter_io_insts_out_2_pc; // @[Backend.scala 275:18]
    end
    if (reset) begin // @[Backend.scala 74:97]
      exInstsOrder_0 <= 2'h0; // @[Backend.scala 74:97]
    end else if (!(kill_x)) begin // @[Backend.scala 254:17]
      if (_kill_x_T) begin // @[Backend.scala 260:24]
        exInstsOrder_0 <= issueArbiter_io_insts_order_0; // @[Backend.scala 261:18]
      end
    end
    if (reset) begin // @[Backend.scala 74:97]
      exInstsOrder_1 <= 2'h0; // @[Backend.scala 74:97]
    end else if (!(kill_x)) begin // @[Backend.scala 254:17]
      if (_kill_x_T) begin // @[Backend.scala 260:24]
        exInstsOrder_1 <= issueArbiter_io_insts_order_1; // @[Backend.scala 261:18]
      end
    end
    if (reset) begin // @[Backend.scala 74:97]
      exInstsOrder_2 <= 2'h0; // @[Backend.scala 74:97]
    end else if (!(kill_x)) begin // @[Backend.scala 254:17]
      if (_kill_x_T) begin // @[Backend.scala 260:24]
        exInstsOrder_2 <= issueArbiter_io_insts_order_2; // @[Backend.scala 261:18]
      end
    end
    if (reset) begin // @[Backend.scala 75:29]
      exInstsValid_0 <= 1'h0; // @[Backend.scala 75:29]
    end else if (kill_x) begin // @[Backend.scala 254:17]
      exInstsValid_0 <= 1'h0; // @[Backend.scala 258:23]
    end else if (_kill_x_T) begin // @[Backend.scala 260:24]
      if (csr_io_event_io_call_for_int) begin // @[Backend.scala 262:41]
        exInstsValid_0 <= |_exInstsValid_0_T; // @[Backend.scala 263:23]
      end else begin
        exInstsValid_0 <= issueArbiter_io_issue_fu_valid_0; // @[Backend.scala 271:20]
      end
    end
    if (reset) begin // @[Backend.scala 75:29]
      exInstsValid_1 <= 1'h0; // @[Backend.scala 75:29]
    end else if (kill_x) begin // @[Backend.scala 254:17]
      exInstsValid_1 <= 1'h0; // @[Backend.scala 258:23]
    end else if (_kill_x_T) begin // @[Backend.scala 260:24]
      if (csr_io_event_io_call_for_int) begin // @[Backend.scala 262:41]
        exInstsValid_1 <= 1'h0; // @[Backend.scala 268:25]
      end else begin
        exInstsValid_1 <= issueArbiter_io_issue_fu_valid_1; // @[Backend.scala 271:20]
      end
    end
    if (reset) begin // @[Backend.scala 75:29]
      exInstsValid_2 <= 1'h0; // @[Backend.scala 75:29]
    end else if (kill_x) begin // @[Backend.scala 254:17]
      exInstsValid_2 <= 1'h0; // @[Backend.scala 258:23]
    end else if (_kill_x_T) begin // @[Backend.scala 260:24]
      if (csr_io_event_io_call_for_int) begin // @[Backend.scala 262:41]
        exInstsValid_2 <= 1'h0; // @[Backend.scala 268:25]
      end else begin
        exInstsValid_2 <= issueArbiter_io_issue_fu_valid_2; // @[Backend.scala 271:20]
      end
    end
    if (reset) begin // @[Backend.scala 76:29]
      exFwdRsData_0 <= 64'h0; // @[Backend.scala 76:29]
    end else if (_kill_x_T) begin // @[Backend.scala 280:19]
      exFwdRsData_0 <= issueRss_0; // @[Backend.scala 282:22]
    end
    if (reset) begin // @[Backend.scala 76:29]
      exFwdRsData_1 <= 64'h0; // @[Backend.scala 76:29]
    end else if (_kill_x_T) begin // @[Backend.scala 280:19]
      exFwdRsData_1 <= issueRss_1; // @[Backend.scala 282:22]
    end
    if (reset) begin // @[Backend.scala 76:29]
      exFwdRsData_2 <= 64'h0; // @[Backend.scala 76:29]
    end else if (_kill_x_T) begin // @[Backend.scala 280:19]
      exFwdRsData_2 <= issueRss_2; // @[Backend.scala 282:22]
    end
    if (reset) begin // @[Backend.scala 77:29]
      exFwdRtData_0 <= 64'h0; // @[Backend.scala 77:29]
    end else if (_kill_x_T) begin // @[Backend.scala 280:19]
      exFwdRtData_0 <= issueRts_0; // @[Backend.scala 283:22]
    end
    if (reset) begin // @[Backend.scala 77:29]
      exFwdRtData_1 <= 64'h0; // @[Backend.scala 77:29]
    end else if (_kill_x_T) begin // @[Backend.scala 280:19]
      exFwdRtData_1 <= issueRts_1; // @[Backend.scala 283:22]
    end
    if (reset) begin // @[Backend.scala 77:29]
      exFwdRtData_2 <= 64'h0; // @[Backend.scala 77:29]
    end else if (_kill_x_T) begin // @[Backend.scala 280:19]
      exFwdRtData_2 <= issueRts_2; // @[Backend.scala 283:22]
    end
    if (reset) begin // @[Backend.scala 90:29]
      exInterruptd <= 1'h0; // @[Backend.scala 90:29]
    end else if (kill_x) begin // @[Backend.scala 254:17]
      exInterruptd <= 1'h0; // @[Backend.scala 255:18]
    end else if (_kill_x_T) begin // @[Backend.scala 260:24]
      exInterruptd <= csr_io_event_io_call_for_int; // @[Backend.scala 277:18]
    end
    if (reset) begin // @[Backend.scala 116:33]
      reBranchPC <= 64'h0; // @[Backend.scala 116:33]
    end else if (!(kill_x)) begin // @[Backend.scala 473:17]
      if (_kill_x_T) begin // @[Backend.scala 479:26]
        if (isExPCBr) begin // @[Backend.scala 84:25]
          reBranchPC <= _exReBranchPC_T_2;
        end else begin
          reBranchPC <= jumpPc;
        end
      end
    end
    if (reset) begin // @[Backend.scala 117:33]
      wbResult_0 <= 64'h0; // @[Backend.scala 117:33]
    end else if (!(kill_x)) begin // @[Backend.scala 473:17]
      if (_kill_x_T) begin // @[Backend.scala 479:26]
        if (exInsts_0_write_src == 2'h3 | exInsts_0_next_pc != 3'h0) begin // @[Backend.scala 434:19]
          wbResult_0 <= _exReBranchPC_T_1;
        end else begin
          wbResult_0 <= _aluWbData_T_6;
        end
      end
    end
    if (reset) begin // @[Backend.scala 117:33]
      wbResult_1 <= 64'h0; // @[Backend.scala 117:33]
    end else if (!(kill_x)) begin // @[Backend.scala 473:17]
      if (_kill_x_T) begin // @[Backend.scala 479:26]
        wbResult_1 <= mdu_io_r; // @[Backend.scala 492:17]
      end
    end
    if (reset) begin // @[Backend.scala 118:33]
      wbInstsValid_0 <= 1'h0; // @[Backend.scala 118:33]
    end else if (kill_x) begin // @[Backend.scala 473:17]
      wbInstsValid_0 <= 1'h0; // @[Backend.scala 475:23]
    end else if (_kill_x_T) begin // @[Backend.scala 479:26]
      wbInstsValid_0 <= exInstsTrueValid_0; // @[Backend.scala 487:23]
    end
    if (reset) begin // @[Backend.scala 118:33]
      wbInstsValid_1 <= 1'h0; // @[Backend.scala 118:33]
    end else if (kill_x) begin // @[Backend.scala 473:17]
      wbInstsValid_1 <= 1'h0; // @[Backend.scala 475:23]
    end else if (_kill_x_T) begin // @[Backend.scala 479:26]
      wbInstsValid_1 <= exInstsTrueValid_1; // @[Backend.scala 487:23]
    end
    if (reset) begin // @[Backend.scala 118:33]
      wbInstsValid_2 <= 1'h0; // @[Backend.scala 118:33]
    end else if (kill_x) begin // @[Backend.scala 473:17]
      wbInstsValid_2 <= 1'h0; // @[Backend.scala 475:23]
    end else if (_kill_x_T) begin // @[Backend.scala 479:26]
      wbInstsValid_2 <= ldstValid; // @[Backend.scala 487:23]
    end
    if (reset) begin // @[Backend.scala 120:33]
      wbInsts_0_illegal <= 1'h0; // @[Backend.scala 120:33]
    end else if (!(kill_x)) begin // @[Backend.scala 473:17]
      if (_kill_x_T) begin // @[Backend.scala 479:26]
        wbInsts_0_illegal <= exInsts_0_illegal; // @[Backend.scala 489:13]
      end
    end
    if (reset) begin // @[Backend.scala 120:33]
      wbInsts_0_next_pc <= 3'h0; // @[Backend.scala 120:33]
    end else if (!(kill_x)) begin // @[Backend.scala 473:17]
      if (_kill_x_T) begin // @[Backend.scala 479:26]
        wbInsts_0_next_pc <= exInsts_0_next_pc; // @[Backend.scala 489:13]
      end
    end
    if (reset) begin // @[Backend.scala 120:33]
      wbInsts_0_alu_mdu_lsu <= 2'h3; // @[Backend.scala 120:33]
    end else if (!(kill_x)) begin // @[Backend.scala 473:17]
      if (_kill_x_T) begin // @[Backend.scala 479:26]
        wbInsts_0_alu_mdu_lsu <= exInsts_0_alu_mdu_lsu; // @[Backend.scala 489:13]
      end
    end
    if (reset) begin // @[Backend.scala 120:33]
      wbInsts_0_write_dest <= 1'h0; // @[Backend.scala 120:33]
    end else if (!(kill_x)) begin // @[Backend.scala 473:17]
      if (_kill_x_T) begin // @[Backend.scala 479:26]
        wbInsts_0_write_dest <= exInsts_0_write_dest; // @[Backend.scala 489:13]
      end
    end
    if (reset) begin // @[Backend.scala 120:33]
      wbInsts_0_rd <= 5'h0; // @[Backend.scala 120:33]
    end else if (!(kill_x)) begin // @[Backend.scala 473:17]
      if (_kill_x_T) begin // @[Backend.scala 479:26]
        wbInsts_0_rd <= exInsts_0_rd; // @[Backend.scala 489:13]
      end
    end
    if (reset) begin // @[Backend.scala 120:33]
      wbInsts_0_imm <= 64'h0; // @[Backend.scala 120:33]
    end else if (!(kill_x)) begin // @[Backend.scala 473:17]
      if (_kill_x_T) begin // @[Backend.scala 479:26]
        wbInsts_0_imm <= exInsts_0_imm; // @[Backend.scala 489:13]
      end
    end
    if (reset) begin // @[Backend.scala 120:33]
      wbInsts_0_pc <= 64'h0; // @[Backend.scala 120:33]
    end else if (!(kill_x)) begin // @[Backend.scala 473:17]
      if (_kill_x_T) begin // @[Backend.scala 479:26]
        wbInsts_0_pc <= exInsts_0_pc; // @[Backend.scala 489:13]
      end
    end
    if (reset) begin // @[Backend.scala 120:33]
      wbInsts_1_write_dest <= 1'h0; // @[Backend.scala 120:33]
    end else if (!(kill_x)) begin // @[Backend.scala 473:17]
      if (_kill_x_T) begin // @[Backend.scala 479:26]
        wbInsts_1_write_dest <= exInsts_1_write_dest; // @[Backend.scala 489:13]
      end
    end
    if (reset) begin // @[Backend.scala 120:33]
      wbInsts_1_rd <= 5'h0; // @[Backend.scala 120:33]
    end else if (!(kill_x)) begin // @[Backend.scala 473:17]
      if (_kill_x_T) begin // @[Backend.scala 479:26]
        wbInsts_1_rd <= exInsts_1_rd; // @[Backend.scala 489:13]
      end
    end
    if (reset) begin // @[Backend.scala 120:33]
      wbInsts_1_pc <= 64'h0; // @[Backend.scala 120:33]
    end else if (!(kill_x)) begin // @[Backend.scala 473:17]
      if (_kill_x_T) begin // @[Backend.scala 479:26]
        wbInsts_1_pc <= exInsts_1_pc; // @[Backend.scala 489:13]
      end
    end
    if (reset) begin // @[Backend.scala 120:33]
      wbInsts_2_write_dest <= 1'h0; // @[Backend.scala 120:33]
    end else if (!(kill_x)) begin // @[Backend.scala 473:17]
      if (_kill_x_T) begin // @[Backend.scala 479:26]
        wbInsts_2_write_dest <= exInsts_2_write_dest; // @[Backend.scala 489:13]
      end
    end
    if (reset) begin // @[Backend.scala 120:33]
      wbInsts_2_mem_width <= 3'h0; // @[Backend.scala 120:33]
    end else if (!(kill_x)) begin // @[Backend.scala 473:17]
      if (_kill_x_T) begin // @[Backend.scala 479:26]
        wbInsts_2_mem_width <= exInsts_2_mem_width; // @[Backend.scala 489:13]
      end
    end
    if (reset) begin // @[Backend.scala 120:33]
      wbInsts_2_rd <= 5'h0; // @[Backend.scala 120:33]
    end else if (!(kill_x)) begin // @[Backend.scala 473:17]
      if (_kill_x_T) begin // @[Backend.scala 479:26]
        wbInsts_2_rd <= exInsts_2_rd; // @[Backend.scala 489:13]
      end
    end
    if (reset) begin // @[Backend.scala 120:33]
      wbInsts_2_pc <= 64'h0; // @[Backend.scala 120:33]
    end else if (!(kill_x)) begin // @[Backend.scala 473:17]
      if (_kill_x_T) begin // @[Backend.scala 479:26]
        wbInsts_2_pc <= exInsts_2_pc; // @[Backend.scala 489:13]
      end
    end
    if (reset) begin // @[Backend.scala 126:33]
      wbReBranch <= 1'h0; // @[Backend.scala 126:33]
    end else if (kill_x) begin // @[Backend.scala 473:17]
      wbReBranch <= 1'h0; // @[Backend.scala 477:16]
    end else if (_kill_x_T) begin // @[Backend.scala 479:26]
      wbReBranch <= reBranch; // @[Backend.scala 499:16]
    end
    if (reset) begin // @[Backend.scala 129:33]
      wbMisalignedAddr <= 32'h0; // @[Backend.scala 129:33]
    end else begin
      wbMisalignedAddr <= io_dcache_req_bits_addr; // @[Backend.scala 129:33]
    end
    if (reset) begin // @[Backend.scala 130:33]
      wbInterruptd <= 1'h0; // @[Backend.scala 130:33]
    end else if (!(kill_x)) begin // @[Backend.scala 473:17]
      if (_kill_x_T) begin // @[Backend.scala 479:26]
        wbInterruptd <= exInterruptd & ~io_fb_bmfs_redirect_kill; // @[Backend.scala 481:18]
      end
    end
    if (reset) begin // @[Backend.scala 131:33]
      wbLdMa <= 1'h0; // @[Backend.scala 131:33]
    end else if (!(kill_x)) begin // @[Backend.scala 473:17]
      if (_kill_x_T) begin // @[Backend.scala 479:26]
        wbLdMa <= ldMisaligned; // @[Backend.scala 493:12]
      end
    end
    if (reset) begin // @[Backend.scala 132:33]
      wbStMa <= 1'h0; // @[Backend.scala 132:33]
    end else if (!(kill_x)) begin // @[Backend.scala 473:17]
      if (_kill_x_T) begin // @[Backend.scala 479:26]
        wbStMa <= stMisaligned; // @[Backend.scala 494:12]
      end
    end
    if (reset) begin // @[Backend.scala 133:33]
      wbBpuV <= 1'h0; // @[Backend.scala 133:33]
    end else if (kill_x) begin // @[Backend.scala 473:17]
      wbBpuV <= 1'h0; // @[Backend.scala 478:12]
    end else begin
      wbBpuV <= _GEN_210;
    end
    if (reset) begin // @[Backend.scala 134:33]
      wbBpuErrpr <= 1'h0; // @[Backend.scala 134:33]
    end else begin
      wbBpuErrpr <= bpuErrpr; // @[Backend.scala 134:33]
    end
    if (reset) begin // @[Backend.scala 136:33]
      wbBpuPCBr <= 64'h0; // @[Backend.scala 136:33]
    end else begin
      wbBpuPCBr <= _wbBpuPCBr_T; // @[Backend.scala 136:33]
    end
    if (reset) begin // @[Backend.scala 137:33]
      wbBpuTarget <= 64'h0; // @[Backend.scala 137:33]
    end else if (isExPCBr) begin // @[Backend.scala 112:22]
      wbBpuTarget <= brPC;
    end else if (_isExPCJump_T_1) begin // @[Backend.scala 378:16]
      wbBpuTarget <= brPC;
    end else begin
      wbBpuTarget <= _jumpPc_T_4;
    end
    if (reset) begin // @[Backend.scala 138:33]
      wbBpuTaken <= 1'h0; // @[Backend.scala 138:33]
    end else begin
      wbBpuTaken <= bpuTaken; // @[Backend.scala 138:33]
    end
    if (reset) begin // @[Backend.scala 140:33]
      wbCsrData <= 64'h0; // @[Backend.scala 140:33]
    end else if (!(kill_x)) begin // @[Backend.scala 473:17]
      if (_kill_x_T) begin // @[Backend.scala 479:26]
        wbCsrData <= alu_io_r; // @[Backend.scala 496:15]
      end
    end
    if (reset) begin // @[Reg.scala 27:20]
      delayed_req_bits <= 6'h0; // @[Reg.scala 27:20]
    end else if (_kill_x_T) begin // @[Reg.scala 28:19]
      delayed_req_bits <= _delayed_req_bits_T_1; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Backend.scala 457:28]
      wbMMIOValid <= 1'h0; // @[Backend.scala 457:28]
    end else if (!(kill_x)) begin // @[Backend.scala 473:17]
      if (_kill_x_T) begin // @[Backend.scala 479:26]
        wbMMIOValid <= exMMIOValid; // @[Backend.scala 480:17]
      end
    end
    if (reset) begin // @[Backend.scala 458:32]
      wb_mmio_ld_data <= 64'h0; // @[Backend.scala 458:32]
    end else begin
      wb_mmio_ld_data <= csr_io_common_io_out; // @[Backend.scala 458:32]
    end
    if (reset) begin // @[Backend.scala 329:29]
      exLastMemReq_addr <= 32'h0; // @[Backend.scala 329:29]
    end else if (_kill_x_T) begin // @[Backend.scala 363:23]
      exLastMemReq_addr <= exCurMemReq_addr; // @[Backend.scala 365:18]
    end
    if (reset) begin // @[Backend.scala 329:29]
      exLastMemReq_wdata <= 64'h0; // @[Backend.scala 329:29]
    end else if (_kill_x_T) begin // @[Backend.scala 363:23]
      exLastMemReq_wdata <= exFwdRtData_2; // @[Backend.scala 365:18]
    end
    if (reset) begin // @[Backend.scala 329:29]
      exLastMemReq_wen <= 1'h0; // @[Backend.scala 329:29]
    end else if (_kill_x_T) begin // @[Backend.scala 363:23]
      exLastMemReq_wen <= _stMisaligned_T; // @[Backend.scala 365:18]
    end
    if (reset) begin // @[Backend.scala 329:29]
      exLastMemReq_mtype <= 3'h2; // @[Backend.scala 329:29]
    end else if (_kill_x_T) begin // @[Backend.scala 363:23]
      exLastMemReq_mtype <= exCurMemReq_mtype; // @[Backend.scala 365:18]
    end
    if (reset) begin // @[Backend.scala 560:33]
      wb_mmio_sd_data <= 64'h0; // @[Backend.scala 560:33]
    end else begin
      wb_mmio_sd_data <= exFwdRtData_2; // @[Backend.scala 560:33]
    end
    if (reset) begin // @[Backend.scala 561:30]
      wb_mmio_num <= 12'h0; // @[Backend.scala 561:30]
    end else if (64'h2004000 == ldstAddr) begin // @[Mux.scala 80:57]
      wb_mmio_num <= 12'hffe;
    end else if (64'h200bff8 == ldstAddr) begin // @[Mux.scala 80:57]
      wb_mmio_num <= 12'hfff;
    end else begin
      wb_mmio_num <= 12'h0;
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
  exLastMemReqValid = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  exInsts_0_illegal = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  exInsts_0_next_pc = _RAND_2[2:0];
  _RAND_3 = {1{`RANDOM}};
  exInsts_0_alu_mdu_lsu = _RAND_3[1:0];
  _RAND_4 = {1{`RANDOM}};
  exInsts_0_branch_type = _RAND_4[3:0];
  _RAND_5 = {1{`RANDOM}};
  exInsts_0_src_a = _RAND_5[1:0];
  _RAND_6 = {1{`RANDOM}};
  exInsts_0_src_b = _RAND_6[1:0];
  _RAND_7 = {1{`RANDOM}};
  exInsts_0_write_dest = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  exInsts_0_alu_op = _RAND_8[3:0];
  _RAND_9 = {1{`RANDOM}};
  exInsts_0_alu_expand = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  exInsts_0_write_src = _RAND_10[1:0];
  _RAND_11 = {1{`RANDOM}};
  exInsts_0_rs1 = _RAND_11[4:0];
  _RAND_12 = {1{`RANDOM}};
  exInsts_0_rd = _RAND_12[4:0];
  _RAND_13 = {2{`RANDOM}};
  exInsts_0_imm = _RAND_13[63:0];
  _RAND_14 = {2{`RANDOM}};
  exInsts_0_pc = _RAND_14[63:0];
  _RAND_15 = {1{`RANDOM}};
  exInsts_0_predict_taken = _RAND_15[0:0];
  _RAND_16 = {2{`RANDOM}};
  exInsts_0_target_pc = _RAND_16[63:0];
  _RAND_17 = {1{`RANDOM}};
  exInsts_1_src_a = _RAND_17[1:0];
  _RAND_18 = {1{`RANDOM}};
  exInsts_1_src_b = _RAND_18[1:0];
  _RAND_19 = {1{`RANDOM}};
  exInsts_1_write_dest = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  exInsts_1_alu_op = _RAND_20[3:0];
  _RAND_21 = {1{`RANDOM}};
  exInsts_1_alu_expand = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  exInsts_1_rd = _RAND_22[4:0];
  _RAND_23 = {2{`RANDOM}};
  exInsts_1_imm = _RAND_23[63:0];
  _RAND_24 = {2{`RANDOM}};
  exInsts_1_pc = _RAND_24[63:0];
  _RAND_25 = {1{`RANDOM}};
  exInsts_2_write_dest = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  exInsts_2_mem_width = _RAND_26[2:0];
  _RAND_27 = {1{`RANDOM}};
  exInsts_2_rd = _RAND_27[4:0];
  _RAND_28 = {2{`RANDOM}};
  exInsts_2_imm = _RAND_28[63:0];
  _RAND_29 = {2{`RANDOM}};
  exInsts_2_pc = _RAND_29[63:0];
  _RAND_30 = {1{`RANDOM}};
  exInstsOrder_0 = _RAND_30[1:0];
  _RAND_31 = {1{`RANDOM}};
  exInstsOrder_1 = _RAND_31[1:0];
  _RAND_32 = {1{`RANDOM}};
  exInstsOrder_2 = _RAND_32[1:0];
  _RAND_33 = {1{`RANDOM}};
  exInstsValid_0 = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  exInstsValid_1 = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  exInstsValid_2 = _RAND_35[0:0];
  _RAND_36 = {2{`RANDOM}};
  exFwdRsData_0 = _RAND_36[63:0];
  _RAND_37 = {2{`RANDOM}};
  exFwdRsData_1 = _RAND_37[63:0];
  _RAND_38 = {2{`RANDOM}};
  exFwdRsData_2 = _RAND_38[63:0];
  _RAND_39 = {2{`RANDOM}};
  exFwdRtData_0 = _RAND_39[63:0];
  _RAND_40 = {2{`RANDOM}};
  exFwdRtData_1 = _RAND_40[63:0];
  _RAND_41 = {2{`RANDOM}};
  exFwdRtData_2 = _RAND_41[63:0];
  _RAND_42 = {1{`RANDOM}};
  exInterruptd = _RAND_42[0:0];
  _RAND_43 = {2{`RANDOM}};
  reBranchPC = _RAND_43[63:0];
  _RAND_44 = {2{`RANDOM}};
  wbResult_0 = _RAND_44[63:0];
  _RAND_45 = {2{`RANDOM}};
  wbResult_1 = _RAND_45[63:0];
  _RAND_46 = {1{`RANDOM}};
  wbInstsValid_0 = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  wbInstsValid_1 = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  wbInstsValid_2 = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  wbInsts_0_illegal = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  wbInsts_0_next_pc = _RAND_50[2:0];
  _RAND_51 = {1{`RANDOM}};
  wbInsts_0_alu_mdu_lsu = _RAND_51[1:0];
  _RAND_52 = {1{`RANDOM}};
  wbInsts_0_write_dest = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  wbInsts_0_rd = _RAND_53[4:0];
  _RAND_54 = {2{`RANDOM}};
  wbInsts_0_imm = _RAND_54[63:0];
  _RAND_55 = {2{`RANDOM}};
  wbInsts_0_pc = _RAND_55[63:0];
  _RAND_56 = {1{`RANDOM}};
  wbInsts_1_write_dest = _RAND_56[0:0];
  _RAND_57 = {1{`RANDOM}};
  wbInsts_1_rd = _RAND_57[4:0];
  _RAND_58 = {2{`RANDOM}};
  wbInsts_1_pc = _RAND_58[63:0];
  _RAND_59 = {1{`RANDOM}};
  wbInsts_2_write_dest = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  wbInsts_2_mem_width = _RAND_60[2:0];
  _RAND_61 = {1{`RANDOM}};
  wbInsts_2_rd = _RAND_61[4:0];
  _RAND_62 = {2{`RANDOM}};
  wbInsts_2_pc = _RAND_62[63:0];
  _RAND_63 = {1{`RANDOM}};
  wbReBranch = _RAND_63[0:0];
  _RAND_64 = {1{`RANDOM}};
  wbMisalignedAddr = _RAND_64[31:0];
  _RAND_65 = {1{`RANDOM}};
  wbInterruptd = _RAND_65[0:0];
  _RAND_66 = {1{`RANDOM}};
  wbLdMa = _RAND_66[0:0];
  _RAND_67 = {1{`RANDOM}};
  wbStMa = _RAND_67[0:0];
  _RAND_68 = {1{`RANDOM}};
  wbBpuV = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  wbBpuErrpr = _RAND_69[0:0];
  _RAND_70 = {2{`RANDOM}};
  wbBpuPCBr = _RAND_70[63:0];
  _RAND_71 = {2{`RANDOM}};
  wbBpuTarget = _RAND_71[63:0];
  _RAND_72 = {1{`RANDOM}};
  wbBpuTaken = _RAND_72[0:0];
  _RAND_73 = {2{`RANDOM}};
  wbCsrData = _RAND_73[63:0];
  _RAND_74 = {1{`RANDOM}};
  delayed_req_bits = _RAND_74[5:0];
  _RAND_75 = {1{`RANDOM}};
  wbMMIOValid = _RAND_75[0:0];
  _RAND_76 = {2{`RANDOM}};
  wb_mmio_ld_data = _RAND_76[63:0];
  _RAND_77 = {1{`RANDOM}};
  exLastMemReq_addr = _RAND_77[31:0];
  _RAND_78 = {2{`RANDOM}};
  exLastMemReq_wdata = _RAND_78[63:0];
  _RAND_79 = {1{`RANDOM}};
  exLastMemReq_wen = _RAND_79[0:0];
  _RAND_80 = {1{`RANDOM}};
  exLastMemReq_mtype = _RAND_80[2:0];
  _RAND_81 = {2{`RANDOM}};
  wb_mmio_sd_data = _RAND_81[63:0];
  _RAND_82 = {1{`RANDOM}};
  wb_mmio_num = _RAND_82[11:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210134_Core(
  input         clock,
  input         reset,
  output [31:0] io_icache_req_bits_addr,
  output [2:0]  io_icache_req_bits_mtype,
  input         io_icache_resp_valid,
  input  [31:0] io_icache_resp_bits_rdata_0,
  input  [31:0] io_icache_resp_bits_rdata_1,
  input         io_icache_resp_bits_respn,
  output        io_dcache_req_valid,
  output [31:0] io_dcache_req_bits_addr,
  output [63:0] io_dcache_req_bits_wdata,
  output        io_dcache_req_bits_wen,
  output [2:0]  io_dcache_req_bits_mtype,
  input         io_dcache_resp_valid,
  input  [31:0] io_dcache_resp_bits_rdata_0,
  input  [31:0] io_dcache_resp_bits_rdata_1
);
  wire  fe_clock; // @[Core.scala 96:18]
  wire  fe_reset; // @[Core.scala 96:18]
  wire  fe_io_fb_bmfs_redirect_kill; // @[Core.scala 96:18]
  wire [63:0] fe_io_fb_bmfs_redirect_pc; // @[Core.scala 96:18]
  wire  fe_io_fb_bmfs_bpu_v; // @[Core.scala 96:18]
  wire  fe_io_fb_bmfs_bpu_errpr; // @[Core.scala 96:18]
  wire [63:0] fe_io_fb_bmfs_bpu_pc_br; // @[Core.scala 96:18]
  wire [63:0] fe_io_fb_bmfs_bpu_target; // @[Core.scala 96:18]
  wire  fe_io_fb_bmfs_bpu_taken; // @[Core.scala 96:18]
  wire [1:0] fe_io_fb_fmbs_instn; // @[Core.scala 96:18]
  wire [232:0] fe_io_fb_fmbs_inst_ops_0; // @[Core.scala 96:18]
  wire [232:0] fe_io_fb_fmbs_inst_ops_1; // @[Core.scala 96:18]
  wire  fe_io_fb_fmbs_please_wait; // @[Core.scala 96:18]
  wire  fe_io_icache_req_valid; // @[Core.scala 96:18]
  wire [31:0] fe_io_icache_req_bits_addr; // @[Core.scala 96:18]
  wire [2:0] fe_io_icache_req_bits_mtype; // @[Core.scala 96:18]
  wire  fe_io_icache_resp_valid; // @[Core.scala 96:18]
  wire [31:0] fe_io_icache_resp_bits_rdata_0; // @[Core.scala 96:18]
  wire [31:0] fe_io_icache_resp_bits_rdata_1; // @[Core.scala 96:18]
  wire  fe_io_icache_resp_bits_respn; // @[Core.scala 96:18]
  wire  be_clock; // @[Core.scala 97:18]
  wire  be_reset; // @[Core.scala 97:18]
  wire  be_io_fb_bmfs_redirect_kill; // @[Core.scala 97:18]
  wire [63:0] be_io_fb_bmfs_redirect_pc; // @[Core.scala 97:18]
  wire  be_io_fb_bmfs_bpu_v; // @[Core.scala 97:18]
  wire  be_io_fb_bmfs_bpu_errpr; // @[Core.scala 97:18]
  wire [63:0] be_io_fb_bmfs_bpu_pc_br; // @[Core.scala 97:18]
  wire [63:0] be_io_fb_bmfs_bpu_target; // @[Core.scala 97:18]
  wire  be_io_fb_bmfs_bpu_taken; // @[Core.scala 97:18]
  wire [1:0] be_io_fb_fmbs_instn; // @[Core.scala 97:18]
  wire [232:0] be_io_fb_fmbs_inst_ops_0; // @[Core.scala 97:18]
  wire [232:0] be_io_fb_fmbs_inst_ops_1; // @[Core.scala 97:18]
  wire  be_io_fb_fmbs_please_wait; // @[Core.scala 97:18]
  wire  be_io_dcache_req_valid; // @[Core.scala 97:18]
  wire [31:0] be_io_dcache_req_bits_addr; // @[Core.scala 97:18]
  wire [63:0] be_io_dcache_req_bits_wdata; // @[Core.scala 97:18]
  wire  be_io_dcache_req_bits_wen; // @[Core.scala 97:18]
  wire [2:0] be_io_dcache_req_bits_mtype; // @[Core.scala 97:18]
  wire  be_io_dcache_resp_valid; // @[Core.scala 97:18]
  wire [31:0] be_io_dcache_resp_bits_rdata_0; // @[Core.scala 97:18]
  wire [31:0] be_io_dcache_resp_bits_rdata_1; // @[Core.scala 97:18]
  ysyx_210134_Frontend fe ( // @[Core.scala 96:18]
    .clock(fe_clock),
    .reset(fe_reset),
    .io_fb_bmfs_redirect_kill(fe_io_fb_bmfs_redirect_kill),
    .io_fb_bmfs_redirect_pc(fe_io_fb_bmfs_redirect_pc),
    .io_fb_bmfs_bpu_v(fe_io_fb_bmfs_bpu_v),
    .io_fb_bmfs_bpu_errpr(fe_io_fb_bmfs_bpu_errpr),
    .io_fb_bmfs_bpu_pc_br(fe_io_fb_bmfs_bpu_pc_br),
    .io_fb_bmfs_bpu_target(fe_io_fb_bmfs_bpu_target),
    .io_fb_bmfs_bpu_taken(fe_io_fb_bmfs_bpu_taken),
    .io_fb_fmbs_instn(fe_io_fb_fmbs_instn),
    .io_fb_fmbs_inst_ops_0(fe_io_fb_fmbs_inst_ops_0),
    .io_fb_fmbs_inst_ops_1(fe_io_fb_fmbs_inst_ops_1),
    .io_fb_fmbs_please_wait(fe_io_fb_fmbs_please_wait),
    .io_icache_req_valid(fe_io_icache_req_valid),
    .io_icache_req_bits_addr(fe_io_icache_req_bits_addr),
    .io_icache_req_bits_mtype(fe_io_icache_req_bits_mtype),
    .io_icache_resp_valid(fe_io_icache_resp_valid),
    .io_icache_resp_bits_rdata_0(fe_io_icache_resp_bits_rdata_0),
    .io_icache_resp_bits_rdata_1(fe_io_icache_resp_bits_rdata_1),
    .io_icache_resp_bits_respn(fe_io_icache_resp_bits_respn)
  );
  ysyx_210134_Backend be ( // @[Core.scala 97:18]
    .clock(be_clock),
    .reset(be_reset),
    .io_fb_bmfs_redirect_kill(be_io_fb_bmfs_redirect_kill),
    .io_fb_bmfs_redirect_pc(be_io_fb_bmfs_redirect_pc),
    .io_fb_bmfs_bpu_v(be_io_fb_bmfs_bpu_v),
    .io_fb_bmfs_bpu_errpr(be_io_fb_bmfs_bpu_errpr),
    .io_fb_bmfs_bpu_pc_br(be_io_fb_bmfs_bpu_pc_br),
    .io_fb_bmfs_bpu_target(be_io_fb_bmfs_bpu_target),
    .io_fb_bmfs_bpu_taken(be_io_fb_bmfs_bpu_taken),
    .io_fb_fmbs_instn(be_io_fb_fmbs_instn),
    .io_fb_fmbs_inst_ops_0(be_io_fb_fmbs_inst_ops_0),
    .io_fb_fmbs_inst_ops_1(be_io_fb_fmbs_inst_ops_1),
    .io_fb_fmbs_please_wait(be_io_fb_fmbs_please_wait),
    .io_dcache_req_valid(be_io_dcache_req_valid),
    .io_dcache_req_bits_addr(be_io_dcache_req_bits_addr),
    .io_dcache_req_bits_wdata(be_io_dcache_req_bits_wdata),
    .io_dcache_req_bits_wen(be_io_dcache_req_bits_wen),
    .io_dcache_req_bits_mtype(be_io_dcache_req_bits_mtype),
    .io_dcache_resp_valid(be_io_dcache_resp_valid),
    .io_dcache_resp_bits_rdata_0(be_io_dcache_resp_bits_rdata_0),
    .io_dcache_resp_bits_rdata_1(be_io_dcache_resp_bits_rdata_1)
  );
  assign io_icache_req_bits_addr = fe_io_icache_req_bits_addr; // @[Core.scala 102:13]
  assign io_icache_req_bits_mtype = fe_io_icache_req_bits_mtype; // @[Core.scala 102:13]
  assign io_dcache_req_valid = be_io_dcache_req_valid; // @[Core.scala 103:13]
  assign io_dcache_req_bits_addr = be_io_dcache_req_bits_addr; // @[Core.scala 103:13]
  assign io_dcache_req_bits_wdata = be_io_dcache_req_bits_wdata; // @[Core.scala 103:13]
  assign io_dcache_req_bits_wen = be_io_dcache_req_bits_wen; // @[Core.scala 103:13]
  assign io_dcache_req_bits_mtype = be_io_dcache_req_bits_mtype; // @[Core.scala 103:13]
  assign fe_clock = clock;
  assign fe_reset = reset;
  assign fe_io_fb_bmfs_redirect_kill = be_io_fb_bmfs_redirect_kill; // @[Core.scala 99:12]
  assign fe_io_fb_bmfs_redirect_pc = be_io_fb_bmfs_redirect_pc; // @[Core.scala 99:12]
  assign fe_io_fb_bmfs_bpu_v = be_io_fb_bmfs_bpu_v; // @[Core.scala 99:12]
  assign fe_io_fb_bmfs_bpu_errpr = be_io_fb_bmfs_bpu_errpr; // @[Core.scala 99:12]
  assign fe_io_fb_bmfs_bpu_pc_br = be_io_fb_bmfs_bpu_pc_br; // @[Core.scala 99:12]
  assign fe_io_fb_bmfs_bpu_target = be_io_fb_bmfs_bpu_target; // @[Core.scala 99:12]
  assign fe_io_fb_bmfs_bpu_taken = be_io_fb_bmfs_bpu_taken; // @[Core.scala 99:12]
  assign fe_io_fb_fmbs_please_wait = be_io_fb_fmbs_please_wait; // @[Core.scala 99:12]
  assign fe_io_icache_resp_valid = io_icache_resp_valid; // @[Core.scala 102:13]
  assign fe_io_icache_resp_bits_rdata_0 = io_icache_resp_bits_rdata_0; // @[Core.scala 102:13]
  assign fe_io_icache_resp_bits_rdata_1 = io_icache_resp_bits_rdata_1; // @[Core.scala 102:13]
  assign fe_io_icache_resp_bits_respn = io_icache_resp_bits_respn; // @[Core.scala 102:13]
  assign be_clock = clock;
  assign be_reset = reset;
  assign be_io_fb_fmbs_instn = fe_io_fb_fmbs_instn; // @[Core.scala 99:12]
  assign be_io_fb_fmbs_inst_ops_0 = fe_io_fb_fmbs_inst_ops_0; // @[Core.scala 99:12]
  assign be_io_fb_fmbs_inst_ops_1 = fe_io_fb_fmbs_inst_ops_1; // @[Core.scala 99:12]
  assign be_io_dcache_resp_valid = io_dcache_resp_valid; // @[Core.scala 103:13]
  assign be_io_dcache_resp_bits_rdata_0 = io_dcache_resp_bits_rdata_0; // @[Core.scala 103:13]
  assign be_io_dcache_resp_bits_rdata_1 = io_dcache_resp_bits_rdata_1; // @[Core.scala 103:13]
endmodule
module ysyx_210134_ICache(
  input         clock,
  input         reset,
  input  [31:0] io_cpu_req_bits_addr,
  input  [2:0]  io_cpu_req_bits_mtype,
  output        io_cpu_resp_valid,
  output [31:0] io_cpu_resp_bits_rdata_0,
  output [31:0] io_cpu_resp_bits_rdata_1,
  output        io_cpu_resp_bits_respn,
  output        io_bar_req_valid,
  output [31:0] io_bar_req_addr,
  input         io_bar_resp_valid,
  input  [63:0] io_bar_resp_data
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] req_addr; // @[ICache.scala 43:25]
  reg [31:0] refill_data_0; // @[ICache.scala 54:28]
  reg [31:0] refill_data_1; // @[ICache.scala 54:28]
  reg [1:0] state; // @[ICache.scala 67:22]
  reg [31:0] first_word; // @[ICache.scala 71:42]
  wire [2:0] _io_cpu_resp_bits_respn_T_3 = io_cpu_req_bits_addr[4:2] + 3'h1; // @[ICache.scala 76:45]
  wire  _io_cpu_resp_bits_respn_T_4 = _io_cpu_resp_bits_respn_T_3 != 3'h0; // @[ICache.scala 76:51]
  reg  io_cpu_resp_bits_rdata_1_REG; // @[ICache.scala 83:45]
  wire [29:0] io_bar_req_addr_hi_1 = req_addr[31:2]; // @[ICache.scala 95:36]
  wire [31:0] _io_bar_req_addr_T_1 = {io_bar_req_addr_hi_1,2'h0}; // @[Cat.scala 30:58]
  wire [31:0] _io_bar_req_addr_T_4 = _io_bar_req_addr_T_1 + 32'h4; // @[ICache.scala 114:86]
  wire [31:0] _io_bar_req_addr_T_6 = io_bar_resp_valid ? _io_bar_req_addr_T_4 : _io_bar_req_addr_T_1; // @[ICache.scala 114:29]
  reg  first_word_REG; // @[ICache.scala 118:34]
  wire [31:0] _first_word_T_3 = first_word_REG ? io_bar_resp_data[63:32] : io_bar_resp_data[31:0]; // @[ICache.scala 118:26]
  wire [1:0] _nstate_T = io_bar_resp_valid ? 2'h3 : state; // @[ICache.scala 132:18]
  wire [31:0] _GEN_11 = state == 2'h2 ? _io_bar_req_addr_T_4 : _io_bar_req_addr_T_1; // @[ICache.scala 129:41 ICache.scala 130:21 ICache.scala 95:21]
  wire  _GEN_12 = state == 2'h2 & ~io_bar_resp_valid; // @[ICache.scala 129:41 ICache.scala 131:22 ICache.scala 86:20]
  wire  _GEN_14 = state == 2'h1 | _GEN_12; // @[ICache.scala 109:34 ICache.scala 113:24]
  wire [31:0] _GEN_15 = state == 2'h1 ? _io_bar_req_addr_T_6 : _GEN_11; // @[ICache.scala 109:34 ICache.scala 114:23]
  assign io_cpu_resp_valid = state == 2'h3; // @[ICache.scala 74:30]
  assign io_cpu_resp_bits_rdata_0 = first_word; // @[ICache.scala 82:31]
  assign io_cpu_resp_bits_rdata_1 = io_cpu_resp_bits_rdata_1_REG ? refill_data_1 : refill_data_0; // @[ICache.scala 83:37]
  assign io_cpu_resp_bits_respn = io_cpu_req_bits_mtype == 3'h3 & _io_cpu_resp_bits_respn_T_4; // @[ICache.scala 75:68]
  assign io_bar_req_valid = state == 2'h0 | _GEN_14; // @[ICache.scala 99:29 ICache.scala 102:24]
  assign io_bar_req_addr = state == 2'h0 ? _io_bar_req_addr_T_1 : _GEN_15; // @[ICache.scala 99:29 ICache.scala 95:21]
  always @(posedge clock) begin
    if (reset) begin // @[ICache.scala 43:25]
      req_addr <= 32'h0; // @[ICache.scala 43:25]
    end else begin
      req_addr <= io_cpu_req_bits_addr; // @[ICache.scala 43:25]
    end
    if (reset) begin // @[ICache.scala 54:28]
      refill_data_0 <= 32'h0; // @[ICache.scala 54:28]
    end else begin
      refill_data_0 <= io_bar_resp_data[31:0]; // @[ICache.scala 81:42]
    end
    if (reset) begin // @[ICache.scala 54:28]
      refill_data_1 <= 32'h0; // @[ICache.scala 54:28]
    end else begin
      refill_data_1 <= io_bar_resp_data[63:32]; // @[ICache.scala 81:42]
    end
    if (reset) begin // @[ICache.scala 67:22]
      state <= 2'h0; // @[ICache.scala 67:22]
    end else if (state == 2'h0) begin // @[ICache.scala 99:29]
      state <= 2'h1; // @[ICache.scala 101:14]
    end else if (state == 2'h1) begin // @[ICache.scala 109:34]
      if (io_bar_resp_valid) begin // @[ICache.scala 116:30]
        state <= 2'h2; // @[ICache.scala 119:16]
      end
    end else if (state == 2'h2) begin // @[ICache.scala 129:41]
      state <= _nstate_T; // @[ICache.scala 132:12]
    end else begin
      state <= 2'h0; // @[ICache.scala 134:12]
    end
    if (reset) begin // @[ICache.scala 71:42]
      first_word <= 32'h0; // @[ICache.scala 71:42]
    end else if (!(state == 2'h0)) begin // @[ICache.scala 99:29]
      if (state == 2'h1) begin // @[ICache.scala 109:34]
        if (io_bar_resp_valid) begin // @[ICache.scala 116:30]
          first_word <= _first_word_T_3; // @[ICache.scala 118:20]
        end
      end
    end
    if (reset) begin // @[ICache.scala 83:45]
      io_cpu_resp_bits_rdata_1_REG <= 1'h0; // @[ICache.scala 83:45]
    end else begin
      io_cpu_resp_bits_rdata_1_REG <= io_bar_req_addr[2]; // @[ICache.scala 83:45]
    end
    if (reset) begin // @[ICache.scala 118:34]
      first_word_REG <= 1'h0; // @[ICache.scala 118:34]
    end else begin
      first_word_REG <= io_bar_req_addr[2]; // @[ICache.scala 118:34]
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
  req_addr = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  refill_data_0 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  refill_data_1 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  state = _RAND_3[1:0];
  _RAND_4 = {1{`RANDOM}};
  first_word = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  io_cpu_resp_bits_rdata_1_REG = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  first_word_REG = _RAND_6[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210134_DcacheDP(
  input         clock,
  input         reset,
  input         io_cpu_req_valid,
  input  [31:0] io_cpu_req_bits_addr,
  input  [63:0] io_cpu_req_bits_wdata,
  input         io_cpu_req_bits_wen,
  input  [2:0]  io_cpu_req_bits_mtype,
  output        io_cpu_resp_valid,
  output [31:0] io_cpu_resp_bits_rdata_0,
  output [31:0] io_cpu_resp_bits_rdata_1,
  output        io_bar_req_valid,
  output        io_bar_req_wen,
  output [31:0] io_bar_req_addr,
  output [63:0] io_bar_req_data,
  output [2:0]  io_bar_req_mtype,
  input         io_bar_resp_valid,
  input  [63:0] io_bar_resp_data
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
`endif // RANDOMIZE_REG_INIT
  reg  mmio_state; // @[Dcache.scala 378:27]
  wire  _df_mmio_stall_T = ~io_bar_resp_valid; // @[Dcache.scala 380:40]
  wire  df_mmio_stall = mmio_state & ~io_bar_resp_valid; // @[Dcache.scala 380:37]
  wire  _df_mmio_req_T = ~df_mmio_stall; // @[Dcache.scala 330:82]
  reg [31:0] df_mmio_req_addr; // @[Reg.scala 27:20]
  reg [63:0] df_mmio_req_wdata; // @[Reg.scala 27:20]
  reg  df_mmio_req_wen; // @[Reg.scala 27:20]
  reg [2:0] df_mmio_req_mtype; // @[Reg.scala 27:20]
  reg  dp_mmio_is_csr_addr; // @[Dcache.scala 344:36]
  wire  df_mmio_is_csr_addr = io_cpu_req_bits_addr == 32'h200bff8 | io_cpu_req_bits_addr == 32'h2004000; // @[Dcache.scala 392:27]
  wire  _T = ~mmio_state; // @[Conditional.scala 37:30]
  wire  _GEN_7 = mmio_state & (io_bar_resp_valid | dp_mmio_is_csr_addr); // @[Conditional.scala 39:67 Dcache.scala 406:26 Dcache.scala 399:22]
  wire  df_mmio_resp_valid = _T ? 1'h0 : _GEN_7; // @[Conditional.scala 40:58 Dcache.scala 399:22]
  wire [63:0] _T_5 = dp_mmio_is_csr_addr ? 64'h0 : io_bar_resp_data; // @[Dcache.scala 455:35]
  assign io_cpu_resp_valid = _T ? 1'h0 : _GEN_7; // @[Conditional.scala 40:58 Dcache.scala 399:22]
  assign io_cpu_resp_bits_rdata_0 = _T_5[31:0]; // @[Dcache.scala 456:46]
  assign io_cpu_resp_bits_rdata_1 = _T_5[63:32]; // @[Dcache.scala 456:46]
  assign io_bar_req_valid = mmio_state ? ~dp_mmio_is_csr_addr & _df_mmio_stall_T : io_cpu_req_valid & ~
    df_mmio_is_csr_addr; // @[Dcache.scala 487:28]
  assign io_bar_req_wen = mmio_state ? df_mmio_req_wen : io_cpu_req_bits_wen; // @[Dcache.scala 488:28]
  assign io_bar_req_addr = mmio_state ? df_mmio_req_addr : io_cpu_req_bits_addr; // @[Dcache.scala 485:28]
  assign io_bar_req_data = mmio_state ? df_mmio_req_wdata : io_cpu_req_bits_wdata; // @[Dcache.scala 484:28]
  assign io_bar_req_mtype = mmio_state ? df_mmio_req_mtype : io_cpu_req_bits_mtype; // @[Dcache.scala 486:28]
  always @(posedge clock) begin
    if (reset) begin // @[Dcache.scala 378:27]
      mmio_state <= 1'h0; // @[Dcache.scala 378:27]
    end else if (_T) begin // @[Conditional.scala 40:58]
      mmio_state <= io_cpu_req_valid | mmio_state; // @[Dcache.scala 402:18]
    end else if (mmio_state) begin // @[Conditional.scala 39:67]
      if (df_mmio_resp_valid) begin // @[Dcache.scala 405:24]
        mmio_state <= 1'h0;
      end
    end
    if (reset) begin // @[Reg.scala 27:20]
      df_mmio_req_addr <= 32'h0; // @[Reg.scala 27:20]
    end else if (_df_mmio_req_T) begin // @[Reg.scala 28:19]
      df_mmio_req_addr <= io_cpu_req_bits_addr; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      df_mmio_req_wdata <= 64'h0; // @[Reg.scala 27:20]
    end else if (_df_mmio_req_T) begin // @[Reg.scala 28:19]
      df_mmio_req_wdata <= io_cpu_req_bits_wdata; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      df_mmio_req_wen <= 1'h0; // @[Reg.scala 27:20]
    end else if (_df_mmio_req_T) begin // @[Reg.scala 28:19]
      df_mmio_req_wen <= io_cpu_req_bits_wen; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      df_mmio_req_mtype <= 3'h0; // @[Reg.scala 27:20]
    end else if (_df_mmio_req_T) begin // @[Reg.scala 28:19]
      df_mmio_req_mtype <= io_cpu_req_bits_mtype; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Dcache.scala 344:36]
      dp_mmio_is_csr_addr <= 1'h0; // @[Dcache.scala 344:36]
    end else begin
      dp_mmio_is_csr_addr <= df_mmio_is_csr_addr; // @[Dcache.scala 344:36]
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
  mmio_state = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  df_mmio_req_addr = _RAND_1[31:0];
  _RAND_2 = {2{`RANDOM}};
  df_mmio_req_wdata = _RAND_2[63:0];
  _RAND_3 = {1{`RANDOM}};
  df_mmio_req_wen = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  df_mmio_req_mtype = _RAND_4[2:0];
  _RAND_5 = {1{`RANDOM}};
  dp_mmio_is_csr_addr = _RAND_5[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210134_CacheArbiter(
  input   clock,
  input   reset,
  output  io_chosen,
  output  io_en,
  input   io_valid_0,
  input   io_valid_1,
  input   io_lock
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg  chosen; // @[XBar.scala 106:23]
  wire  sel = io_valid_0 ? 1'h0 : 1'h1; // @[XBar.scala 111:24 XBar.scala 112:11]
  assign io_chosen = io_lock ? chosen : sel; // @[XBar.scala 117:19]
  assign io_en = io_valid_0 | io_valid_1; // @[XBar.scala 111:24 XBar.scala 113:14]
  always @(posedge clock) begin
    chosen <= reset | io_chosen; // @[XBar.scala 106:23 XBar.scala 106:23 XBar.scala 119:10]
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
  chosen = _RAND_0[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210134_AXI4Server(
  input         clock,
  input         reset,
  input         io_cache_0_req_valid,
  input         io_cache_0_req_wen,
  input  [31:0] io_cache_0_req_addr,
  input  [63:0] io_cache_0_req_data,
  input  [2:0]  io_cache_0_req_mtype,
  output        io_cache_0_resp_valid,
  output [63:0] io_cache_0_resp_data,
  input         io_cache_1_req_valid,
  input  [31:0] io_cache_1_req_addr,
  output        io_cache_1_resp_valid,
  output [63:0] io_cache_1_resp_data,
  input         io_axi4_aw_ready,
  output        io_axi4_aw_valid,
  output [31:0] io_axi4_aw_bits_addr,
  output [2:0]  io_axi4_aw_bits_size,
  input         io_axi4_w_ready,
  output        io_axi4_w_valid,
  output [63:0] io_axi4_w_bits_data,
  output [7:0]  io_axi4_w_bits_strb,
  output        io_axi4_w_bits_last,
  input         io_axi4_b_valid,
  input         io_axi4_ar_ready,
  output        io_axi4_ar_valid,
  output [31:0] io_axi4_ar_bits_addr,
  output [2:0]  io_axi4_ar_bits_size,
  output        io_axi4_r_ready,
  input         io_axi4_r_valid,
  input  [63:0] io_axi4_r_bits_data,
  input         io_axi4_r_bits_last
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [63:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [63:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
`endif // RANDOMIZE_REG_INIT
  wire  r_arbiter_clock; // @[XBar.scala 156:25]
  wire  r_arbiter_reset; // @[XBar.scala 156:25]
  wire  r_arbiter_io_chosen; // @[XBar.scala 156:25]
  wire  r_arbiter_io_en; // @[XBar.scala 156:25]
  wire  r_arbiter_io_valid_0; // @[XBar.scala 156:25]
  wire  r_arbiter_io_valid_1; // @[XBar.scala 156:25]
  wire  r_arbiter_io_lock; // @[XBar.scala 156:25]
  reg [1:0] rstate; // @[XBar.scala 150:23]
  reg [2:0] wstate; // @[XBar.scala 152:23]
  reg  cache_wen_0; // @[XBar.scala 157:26]
  reg  cache_valid_0; // @[XBar.scala 158:28]
  reg  cache_valid_1; // @[XBar.scala 158:28]
  reg [31:0] addr_0; // @[XBar.scala 159:21]
  reg [31:0] addr_1; // @[XBar.scala 159:21]
  reg [63:0] buffer_0; // @[XBar.scala 78:23]
  reg  wptr; // @[XBar.scala 178:21]
  reg [63:0] wbuff; // @[XBar.scala 179:22]
  wire  wen = io_cache_0_req_valid & io_cache_0_req_wen; // @[XBar.scala 185:78]
  reg [2:0] rtype; // @[Reg.scala 27:20]
  wire [1:0] _io_axi4_ar_bits_size_T_1 = 3'h0 == rtype ? 2'h0 : 2'h3; // @[Mux.scala 80:57]
  wire [1:0] _io_axi4_ar_bits_size_T_3 = 3'h1 == rtype ? 2'h1 : _io_axi4_ar_bits_size_T_1; // @[Mux.scala 80:57]
  wire [1:0] _io_axi4_ar_bits_size_T_5 = 3'h2 == rtype ? 2'h2 : _io_axi4_ar_bits_size_T_3; // @[Mux.scala 80:57]
  wire  _T = 2'h0 == rstate; // @[Conditional.scala 37:30]
  wire  _T_1 = 2'h1 == rstate; // @[Conditional.scala 37:30]
  wire  _T_2 = 2'h2 == rstate; // @[Conditional.scala 37:30]
  wire [63:0] _GEN_5 = io_axi4_r_valid ? io_axi4_r_bits_data : buffer_0; // @[XBar.scala 226:30 XBar.scala 89:18 XBar.scala 78:23]
  wire [1:0] _next_rstate_T_4 = io_axi4_r_valid & |io_axi4_r_bits_last ? 2'h3 : rstate; // @[XBar.scala 230:25]
  wire  _T_3 = 2'h3 == rstate; // @[Conditional.scala 37:30]
  wire [1:0] _GEN_7 = _T_3 ? 2'h0 : rstate; // @[Conditional.scala 39:67 XBar.scala 233:19]
  wire  _GEN_16 = _T_1 ? 1'h0 : _T_2; // @[Conditional.scala 39:67 XBar.scala 215:25]
  reg [2:0] wtype; // @[Reg.scala 27:20]
  wire  _io_axi4_aw_bits_len_T = wtype == 3'h4; // @[XBar.scala 242:38]
  wire [1:0] _io_axi4_aw_bits_size_T_1 = 3'h0 == wtype ? 2'h0 : 2'h3; // @[Mux.scala 80:57]
  wire [1:0] _io_axi4_aw_bits_size_T_3 = 3'h1 == wtype ? 2'h1 : _io_axi4_aw_bits_size_T_1; // @[Mux.scala 80:57]
  wire [1:0] _io_axi4_aw_bits_size_T_5 = 3'h2 == wtype ? 2'h2 : _io_axi4_aw_bits_size_T_3; // @[Mux.scala 80:57]
  wire [5:0] _wdata_T_1 = {addr_0[2:0], 3'h0}; // @[XBar.scala 260:39]
  wire [126:0] _GEN_36 = {{63'd0}, wbuff}; // @[XBar.scala 260:18]
  wire [126:0] _wdata_T_2 = _GEN_36 << _wdata_T_1; // @[XBar.scala 260:18]
  wire [63:0] wdata = _wdata_T_2[63:0]; // @[XBar.scala 259:19 XBar.scala 260:9]
  wire [63:0] _io_axi4_w_bits_data_T_2 = 3'h0 == wtype ? wdata : wbuff; // @[Mux.scala 80:57]
  wire [63:0] _io_axi4_w_bits_data_T_4 = 3'h1 == wtype ? wdata : _io_axi4_w_bits_data_T_2; // @[Mux.scala 80:57]
  wire [63:0] _io_axi4_w_bits_data_T_6 = 3'h2 == wtype ? wdata : _io_axi4_w_bits_data_T_4; // @[Mux.scala 80:57]
  wire [7:0] _io_axi4_w_bits_strb_T_1 = 8'h1 << addr_0[2:0]; // @[XBar.scala 273:32]
  wire [8:0] _io_axi4_w_bits_strb_T_3 = 9'h3 << addr_0[2:0]; // @[XBar.scala 274:32]
  wire [10:0] _io_axi4_w_bits_strb_T_5 = 11'hf << addr_0[2:0]; // @[XBar.scala 275:32]
  wire [7:0] _io_axi4_w_bits_strb_T_7 = 3'h0 == wtype ? _io_axi4_w_bits_strb_T_1 : 8'hff; // @[Mux.scala 80:57]
  wire [8:0] _io_axi4_w_bits_strb_T_9 = 3'h1 == wtype ? _io_axi4_w_bits_strb_T_3 : {{1'd0}, _io_axi4_w_bits_strb_T_7}; // @[Mux.scala 80:57]
  wire [10:0] _io_axi4_w_bits_strb_T_11 = 3'h2 == wtype ? _io_axi4_w_bits_strb_T_5 : {{2'd0}, _io_axi4_w_bits_strb_T_9}; // @[Mux.scala 80:57]
  wire  _io_axi4_w_bits_last_T_1 = wtype != 3'h4; // @[XBar.scala 278:60]
  wire  _io_axi4_w_bits_last_T_4 = ~wptr; // @[XBar.scala 279:34]
  wire  _T_4 = 3'h0 == wstate; // @[Conditional.scala 37:30]
  wire  _T_5 = 3'h1 == wstate; // @[Conditional.scala 37:30]
  wire  _T_6 = 3'h2 == wstate; // @[Conditional.scala 37:30]
  wire  _wptr_T_8 = io_axi4_w_ready & _io_axi4_aw_bits_len_T; // @[XBar.scala 296:42]
  wire [2:0] _next_wstate_T_4 = |io_axi4_w_bits_last & io_axi4_w_ready ? 3'h3 : wstate; // @[XBar.scala 297:25]
  wire  _T_7 = 3'h3 == wstate; // @[Conditional.scala 37:30]
  wire [2:0] _next_wstate_T_5 = io_axi4_b_valid ? 3'h4 : wstate; // @[XBar.scala 300:25]
  wire  _T_8 = 3'h4 == wstate; // @[Conditional.scala 37:30]
  wire [2:0] _GEN_23 = _T_8 ? 3'h0 : wstate; // @[Conditional.scala 39:67 XBar.scala 303:19]
  wire [2:0] _GEN_24 = _T_7 ? _next_wstate_T_5 : _GEN_23; // @[Conditional.scala 39:67 XBar.scala 300:19]
  wire  _GEN_31 = _T_5 ? 1'h0 : _T_6; // @[Conditional.scala 39:67 XBar.scala 282:25]
  ysyx_210134_CacheArbiter r_arbiter ( // @[XBar.scala 156:25]
    .clock(r_arbiter_clock),
    .reset(r_arbiter_reset),
    .io_chosen(r_arbiter_io_chosen),
    .io_en(r_arbiter_io_en),
    .io_valid_0(r_arbiter_io_valid_0),
    .io_valid_1(r_arbiter_io_valid_1),
    .io_lock(r_arbiter_io_lock)
  );
  assign io_cache_0_resp_valid = ~r_arbiter_io_chosen ? rstate == 2'h3 : wstate == 3'h4; // @[XBar.scala 188:34]
  assign io_cache_0_resp_data = buffer_0; // @[XBar.scala 189:28]
  assign io_cache_1_resp_valid = r_arbiter_io_chosen & rstate == 2'h3; // @[XBar.scala 188:34]
  assign io_cache_1_resp_data = buffer_0; // @[XBar.scala 189:28]
  assign io_axi4_aw_valid = _T_4 ? 1'h0 : _T_5; // @[Conditional.scala 40:58 XBar.scala 258:25]
  assign io_axi4_aw_bits_addr = addr_0; // @[XBar.scala 240:25]
  assign io_axi4_aw_bits_size = {{1'd0}, _io_axi4_aw_bits_size_T_5}; // @[Mux.scala 80:57]
  assign io_axi4_w_valid = _T_4 ? 1'h0 : _GEN_31; // @[Conditional.scala 40:58 XBar.scala 282:25]
  assign io_axi4_w_bits_data = 3'h3 == wtype ? wdata : _io_axi4_w_bits_data_T_6; // @[Mux.scala 80:57]
  assign io_axi4_w_bits_strb = _io_axi4_w_bits_strb_T_11[7:0]; // @[XBar.scala 270:25]
  assign io_axi4_w_bits_last = _io_axi4_w_bits_last_T_1 | _io_axi4_w_bits_last_T_4; // @[XBar.scala 281:47]
  assign io_axi4_ar_valid = _T ? 1'h0 : _T_1; // @[Conditional.scala 40:58 XBar.scala 214:25]
  assign io_axi4_ar_bits_addr = r_arbiter_io_chosen ? addr_1 : addr_0; // @[XBar.scala 196:25 XBar.scala 196:25]
  assign io_axi4_ar_bits_size = {{1'd0}, _io_axi4_ar_bits_size_T_5}; // @[Mux.scala 80:57]
  assign io_axi4_r_ready = _T ? 1'h0 : _GEN_16; // @[Conditional.scala 40:58 XBar.scala 215:25]
  assign r_arbiter_clock = clock;
  assign r_arbiter_reset = reset;
  assign r_arbiter_io_valid_0 = cache_valid_0 & ~cache_wen_0; // @[XBar.scala 167:45]
  assign r_arbiter_io_valid_1 = cache_valid_1; // @[XBar.scala 167:45]
  assign r_arbiter_io_lock = rstate != 2'h0; // @[XBar.scala 171:31]
  always @(posedge clock) begin
    if (reset) begin // @[XBar.scala 150:23]
      rstate <= 2'h0; // @[XBar.scala 150:23]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (r_arbiter_io_en) begin // @[XBar.scala 218:25]
        rstate <= 2'h1;
      end
    end else if (_T_1) begin // @[Conditional.scala 39:67]
      if (io_axi4_ar_ready) begin // @[XBar.scala 223:25]
        rstate <= 2'h2;
      end
    end else if (_T_2) begin // @[Conditional.scala 39:67]
      rstate <= _next_rstate_T_4; // @[XBar.scala 230:19]
    end else begin
      rstate <= _GEN_7;
    end
    if (reset) begin // @[XBar.scala 152:23]
      wstate <= 3'h0; // @[XBar.scala 152:23]
    end else if (_T_4) begin // @[Conditional.scala 40:58]
      if (wen) begin // @[XBar.scala 286:25]
        wstate <= 3'h1;
      end
    end else if (_T_5) begin // @[Conditional.scala 39:67]
      if (io_axi4_aw_ready) begin // @[XBar.scala 291:25]
        wstate <= 3'h2;
      end
    end else if (_T_6) begin // @[Conditional.scala 39:67]
      wstate <= _next_wstate_T_4; // @[XBar.scala 297:19]
    end else begin
      wstate <= _GEN_24;
    end
    if (reset) begin // @[XBar.scala 157:26]
      cache_wen_0 <= 1'h0; // @[XBar.scala 157:26]
    end else begin
      cache_wen_0 <= io_cache_0_req_wen; // @[XBar.scala 163:18]
    end
    if (reset) begin // @[XBar.scala 158:28]
      cache_valid_0 <= 1'h0; // @[XBar.scala 158:28]
    end else begin
      cache_valid_0 <= io_cache_0_req_valid; // @[XBar.scala 164:20]
    end
    if (reset) begin // @[XBar.scala 158:28]
      cache_valid_1 <= 1'h0; // @[XBar.scala 158:28]
    end else begin
      cache_valid_1 <= io_cache_1_req_valid; // @[XBar.scala 164:20]
    end
    if (reset) begin // @[XBar.scala 159:21]
      addr_0 <= 32'h0; // @[XBar.scala 159:21]
    end else begin
      addr_0 <= io_cache_0_req_addr; // @[XBar.scala 162:13]
    end
    if (reset) begin // @[XBar.scala 159:21]
      addr_1 <= 32'h0; // @[XBar.scala 159:21]
    end else begin
      addr_1 <= io_cache_1_req_addr; // @[XBar.scala 162:13]
    end
    if (reset) begin // @[XBar.scala 78:23]
      buffer_0 <= 64'h0; // @[XBar.scala 78:23]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (_T_1) begin // @[Conditional.scala 39:67]
        buffer_0 <= 64'h0; // @[XBar.scala 83:17]
      end else if (_T_2) begin // @[Conditional.scala 39:67]
        buffer_0 <= _GEN_5;
      end
    end
    if (reset) begin // @[XBar.scala 178:21]
      wptr <= 1'h0; // @[XBar.scala 178:21]
    end else if (!(_T_4)) begin // @[Conditional.scala 40:58]
      if (_T_5) begin // @[Conditional.scala 39:67]
        wptr <= 1'h0; // @[XBar.scala 289:12]
      end else if (_T_6) begin // @[Conditional.scala 39:67]
        wptr <= wptr + _wptr_T_8; // @[XBar.scala 296:12]
      end
    end
    if (reset) begin // @[XBar.scala 179:22]
      wbuff <= 64'h0; // @[XBar.scala 179:22]
    end else begin
      wbuff <= io_cache_0_req_data; // @[XBar.scala 179:22]
    end
    if (reset) begin // @[Reg.scala 27:20]
      rtype <= 3'h0; // @[Reg.scala 27:20]
    end else if (r_arbiter_io_en) begin // @[Reg.scala 28:19]
      if (r_arbiter_io_chosen) begin // @[Reg.scala 28:23]
        rtype <= 3'h2; // @[Reg.scala 28:23]
      end else begin
        rtype <= io_cache_0_req_mtype;
      end
    end
    if (reset) begin // @[Reg.scala 27:20]
      wtype <= 3'h0; // @[Reg.scala 27:20]
    end else if (wen) begin // @[Reg.scala 28:19]
      wtype <= io_cache_0_req_mtype; // @[Reg.scala 28:23]
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
  rstate = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  wstate = _RAND_1[2:0];
  _RAND_2 = {1{`RANDOM}};
  cache_wen_0 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  cache_valid_0 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  cache_valid_1 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  addr_0 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  addr_1 = _RAND_6[31:0];
  _RAND_7 = {2{`RANDOM}};
  buffer_0 = _RAND_7[63:0];
  _RAND_8 = {1{`RANDOM}};
  wptr = _RAND_8[0:0];
  _RAND_9 = {2{`RANDOM}};
  wbuff = _RAND_9[63:0];
  _RAND_10 = {1{`RANDOM}};
  rtype = _RAND_10[2:0];
  _RAND_11 = {1{`RANDOM}};
  wtype = _RAND_11[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210134_Tile(
  input         clock,
  input         reset,
  input         io_axi4_aw_ready,
  output        io_axi4_aw_valid,
  output [31:0] io_axi4_aw_bits_addr,
  output [2:0]  io_axi4_aw_bits_size,
  input         io_axi4_w_ready,
  output        io_axi4_w_valid,
  output [63:0] io_axi4_w_bits_data,
  output [7:0]  io_axi4_w_bits_strb,
  output        io_axi4_w_bits_last,
  input         io_axi4_b_valid,
  input         io_axi4_ar_ready,
  output        io_axi4_ar_valid,
  output [31:0] io_axi4_ar_bits_addr,
  output [2:0]  io_axi4_ar_bits_size,
  output        io_axi4_r_ready,
  input         io_axi4_r_valid,
  input  [63:0] io_axi4_r_bits_data,
  input         io_axi4_r_bits_last
);
  wire  core_clock; // @[Tile.scala 47:20]
  wire  core_reset; // @[Tile.scala 47:20]
  wire [31:0] core_io_icache_req_bits_addr; // @[Tile.scala 47:20]
  wire [2:0] core_io_icache_req_bits_mtype; // @[Tile.scala 47:20]
  wire  core_io_icache_resp_valid; // @[Tile.scala 47:20]
  wire [31:0] core_io_icache_resp_bits_rdata_0; // @[Tile.scala 47:20]
  wire [31:0] core_io_icache_resp_bits_rdata_1; // @[Tile.scala 47:20]
  wire  core_io_icache_resp_bits_respn; // @[Tile.scala 47:20]
  wire  core_io_dcache_req_valid; // @[Tile.scala 47:20]
  wire [31:0] core_io_dcache_req_bits_addr; // @[Tile.scala 47:20]
  wire [63:0] core_io_dcache_req_bits_wdata; // @[Tile.scala 47:20]
  wire  core_io_dcache_req_bits_wen; // @[Tile.scala 47:20]
  wire [2:0] core_io_dcache_req_bits_mtype; // @[Tile.scala 47:20]
  wire  core_io_dcache_resp_valid; // @[Tile.scala 47:20]
  wire [31:0] core_io_dcache_resp_bits_rdata_0; // @[Tile.scala 47:20]
  wire [31:0] core_io_dcache_resp_bits_rdata_1; // @[Tile.scala 47:20]
  wire  icache_clock; // @[Tile.scala 48:22]
  wire  icache_reset; // @[Tile.scala 48:22]
  wire [31:0] icache_io_cpu_req_bits_addr; // @[Tile.scala 48:22]
  wire [2:0] icache_io_cpu_req_bits_mtype; // @[Tile.scala 48:22]
  wire  icache_io_cpu_resp_valid; // @[Tile.scala 48:22]
  wire [31:0] icache_io_cpu_resp_bits_rdata_0; // @[Tile.scala 48:22]
  wire [31:0] icache_io_cpu_resp_bits_rdata_1; // @[Tile.scala 48:22]
  wire  icache_io_cpu_resp_bits_respn; // @[Tile.scala 48:22]
  wire  icache_io_bar_req_valid; // @[Tile.scala 48:22]
  wire [31:0] icache_io_bar_req_addr; // @[Tile.scala 48:22]
  wire  icache_io_bar_resp_valid; // @[Tile.scala 48:22]
  wire [63:0] icache_io_bar_resp_data; // @[Tile.scala 48:22]
  wire  dcache_clock; // @[Tile.scala 50:22]
  wire  dcache_reset; // @[Tile.scala 50:22]
  wire  dcache_io_cpu_req_valid; // @[Tile.scala 50:22]
  wire [31:0] dcache_io_cpu_req_bits_addr; // @[Tile.scala 50:22]
  wire [63:0] dcache_io_cpu_req_bits_wdata; // @[Tile.scala 50:22]
  wire  dcache_io_cpu_req_bits_wen; // @[Tile.scala 50:22]
  wire [2:0] dcache_io_cpu_req_bits_mtype; // @[Tile.scala 50:22]
  wire  dcache_io_cpu_resp_valid; // @[Tile.scala 50:22]
  wire [31:0] dcache_io_cpu_resp_bits_rdata_0; // @[Tile.scala 50:22]
  wire [31:0] dcache_io_cpu_resp_bits_rdata_1; // @[Tile.scala 50:22]
  wire  dcache_io_bar_req_valid; // @[Tile.scala 50:22]
  wire  dcache_io_bar_req_wen; // @[Tile.scala 50:22]
  wire [31:0] dcache_io_bar_req_addr; // @[Tile.scala 50:22]
  wire [63:0] dcache_io_bar_req_data; // @[Tile.scala 50:22]
  wire [2:0] dcache_io_bar_req_mtype; // @[Tile.scala 50:22]
  wire  dcache_io_bar_resp_valid; // @[Tile.scala 50:22]
  wire [63:0] dcache_io_bar_resp_data; // @[Tile.scala 50:22]
  wire  xbar_clock; // @[Tile.scala 51:20]
  wire  xbar_reset; // @[Tile.scala 51:20]
  wire  xbar_io_cache_0_req_valid; // @[Tile.scala 51:20]
  wire  xbar_io_cache_0_req_wen; // @[Tile.scala 51:20]
  wire [31:0] xbar_io_cache_0_req_addr; // @[Tile.scala 51:20]
  wire [63:0] xbar_io_cache_0_req_data; // @[Tile.scala 51:20]
  wire [2:0] xbar_io_cache_0_req_mtype; // @[Tile.scala 51:20]
  wire  xbar_io_cache_0_resp_valid; // @[Tile.scala 51:20]
  wire [63:0] xbar_io_cache_0_resp_data; // @[Tile.scala 51:20]
  wire  xbar_io_cache_1_req_valid; // @[Tile.scala 51:20]
  wire [31:0] xbar_io_cache_1_req_addr; // @[Tile.scala 51:20]
  wire  xbar_io_cache_1_resp_valid; // @[Tile.scala 51:20]
  wire [63:0] xbar_io_cache_1_resp_data; // @[Tile.scala 51:20]
  wire  xbar_io_axi4_aw_ready; // @[Tile.scala 51:20]
  wire  xbar_io_axi4_aw_valid; // @[Tile.scala 51:20]
  wire [31:0] xbar_io_axi4_aw_bits_addr; // @[Tile.scala 51:20]
  wire [2:0] xbar_io_axi4_aw_bits_size; // @[Tile.scala 51:20]
  wire  xbar_io_axi4_w_ready; // @[Tile.scala 51:20]
  wire  xbar_io_axi4_w_valid; // @[Tile.scala 51:20]
  wire [63:0] xbar_io_axi4_w_bits_data; // @[Tile.scala 51:20]
  wire [7:0] xbar_io_axi4_w_bits_strb; // @[Tile.scala 51:20]
  wire  xbar_io_axi4_w_bits_last; // @[Tile.scala 51:20]
  wire  xbar_io_axi4_b_valid; // @[Tile.scala 51:20]
  wire  xbar_io_axi4_ar_ready; // @[Tile.scala 51:20]
  wire  xbar_io_axi4_ar_valid; // @[Tile.scala 51:20]
  wire [31:0] xbar_io_axi4_ar_bits_addr; // @[Tile.scala 51:20]
  wire [2:0] xbar_io_axi4_ar_bits_size; // @[Tile.scala 51:20]
  wire  xbar_io_axi4_r_ready; // @[Tile.scala 51:20]
  wire  xbar_io_axi4_r_valid; // @[Tile.scala 51:20]
  wire [63:0] xbar_io_axi4_r_bits_data; // @[Tile.scala 51:20]
  wire  xbar_io_axi4_r_bits_last; // @[Tile.scala 51:20]
  ysyx_210134_Core core ( // @[Tile.scala 47:20]
    .clock(core_clock),
    .reset(core_reset),
    .io_icache_req_bits_addr(core_io_icache_req_bits_addr),
    .io_icache_req_bits_mtype(core_io_icache_req_bits_mtype),
    .io_icache_resp_valid(core_io_icache_resp_valid),
    .io_icache_resp_bits_rdata_0(core_io_icache_resp_bits_rdata_0),
    .io_icache_resp_bits_rdata_1(core_io_icache_resp_bits_rdata_1),
    .io_icache_resp_bits_respn(core_io_icache_resp_bits_respn),
    .io_dcache_req_valid(core_io_dcache_req_valid),
    .io_dcache_req_bits_addr(core_io_dcache_req_bits_addr),
    .io_dcache_req_bits_wdata(core_io_dcache_req_bits_wdata),
    .io_dcache_req_bits_wen(core_io_dcache_req_bits_wen),
    .io_dcache_req_bits_mtype(core_io_dcache_req_bits_mtype),
    .io_dcache_resp_valid(core_io_dcache_resp_valid),
    .io_dcache_resp_bits_rdata_0(core_io_dcache_resp_bits_rdata_0),
    .io_dcache_resp_bits_rdata_1(core_io_dcache_resp_bits_rdata_1)
  );
  ysyx_210134_ICache icache ( // @[Tile.scala 48:22]
    .clock(icache_clock),
    .reset(icache_reset),
    .io_cpu_req_bits_addr(icache_io_cpu_req_bits_addr),
    .io_cpu_req_bits_mtype(icache_io_cpu_req_bits_mtype),
    .io_cpu_resp_valid(icache_io_cpu_resp_valid),
    .io_cpu_resp_bits_rdata_0(icache_io_cpu_resp_bits_rdata_0),
    .io_cpu_resp_bits_rdata_1(icache_io_cpu_resp_bits_rdata_1),
    .io_cpu_resp_bits_respn(icache_io_cpu_resp_bits_respn),
    .io_bar_req_valid(icache_io_bar_req_valid),
    .io_bar_req_addr(icache_io_bar_req_addr),
    .io_bar_resp_valid(icache_io_bar_resp_valid),
    .io_bar_resp_data(icache_io_bar_resp_data)
  );
  ysyx_210134_DcacheDP dcache ( // @[Tile.scala 50:22]
    .clock(dcache_clock),
    .reset(dcache_reset),
    .io_cpu_req_valid(dcache_io_cpu_req_valid),
    .io_cpu_req_bits_addr(dcache_io_cpu_req_bits_addr),
    .io_cpu_req_bits_wdata(dcache_io_cpu_req_bits_wdata),
    .io_cpu_req_bits_wen(dcache_io_cpu_req_bits_wen),
    .io_cpu_req_bits_mtype(dcache_io_cpu_req_bits_mtype),
    .io_cpu_resp_valid(dcache_io_cpu_resp_valid),
    .io_cpu_resp_bits_rdata_0(dcache_io_cpu_resp_bits_rdata_0),
    .io_cpu_resp_bits_rdata_1(dcache_io_cpu_resp_bits_rdata_1),
    .io_bar_req_valid(dcache_io_bar_req_valid),
    .io_bar_req_wen(dcache_io_bar_req_wen),
    .io_bar_req_addr(dcache_io_bar_req_addr),
    .io_bar_req_data(dcache_io_bar_req_data),
    .io_bar_req_mtype(dcache_io_bar_req_mtype),
    .io_bar_resp_valid(dcache_io_bar_resp_valid),
    .io_bar_resp_data(dcache_io_bar_resp_data)
  );
  ysyx_210134_AXI4Server xbar ( // @[Tile.scala 51:20]
    .clock(xbar_clock),
    .reset(xbar_reset),
    .io_cache_0_req_valid(xbar_io_cache_0_req_valid),
    .io_cache_0_req_wen(xbar_io_cache_0_req_wen),
    .io_cache_0_req_addr(xbar_io_cache_0_req_addr),
    .io_cache_0_req_data(xbar_io_cache_0_req_data),
    .io_cache_0_req_mtype(xbar_io_cache_0_req_mtype),
    .io_cache_0_resp_valid(xbar_io_cache_0_resp_valid),
    .io_cache_0_resp_data(xbar_io_cache_0_resp_data),
    .io_cache_1_req_valid(xbar_io_cache_1_req_valid),
    .io_cache_1_req_addr(xbar_io_cache_1_req_addr),
    .io_cache_1_resp_valid(xbar_io_cache_1_resp_valid),
    .io_cache_1_resp_data(xbar_io_cache_1_resp_data),
    .io_axi4_aw_ready(xbar_io_axi4_aw_ready),
    .io_axi4_aw_valid(xbar_io_axi4_aw_valid),
    .io_axi4_aw_bits_addr(xbar_io_axi4_aw_bits_addr),
    .io_axi4_aw_bits_size(xbar_io_axi4_aw_bits_size),
    .io_axi4_w_ready(xbar_io_axi4_w_ready),
    .io_axi4_w_valid(xbar_io_axi4_w_valid),
    .io_axi4_w_bits_data(xbar_io_axi4_w_bits_data),
    .io_axi4_w_bits_strb(xbar_io_axi4_w_bits_strb),
    .io_axi4_w_bits_last(xbar_io_axi4_w_bits_last),
    .io_axi4_b_valid(xbar_io_axi4_b_valid),
    .io_axi4_ar_ready(xbar_io_axi4_ar_ready),
    .io_axi4_ar_valid(xbar_io_axi4_ar_valid),
    .io_axi4_ar_bits_addr(xbar_io_axi4_ar_bits_addr),
    .io_axi4_ar_bits_size(xbar_io_axi4_ar_bits_size),
    .io_axi4_r_ready(xbar_io_axi4_r_ready),
    .io_axi4_r_valid(xbar_io_axi4_r_valid),
    .io_axi4_r_bits_data(xbar_io_axi4_r_bits_data),
    .io_axi4_r_bits_last(xbar_io_axi4_r_bits_last)
  );
  assign io_axi4_aw_valid = xbar_io_axi4_aw_valid; // @[Tile.scala 61:11]
  assign io_axi4_aw_bits_addr = xbar_io_axi4_aw_bits_addr; // @[Tile.scala 61:11]
  assign io_axi4_aw_bits_size = xbar_io_axi4_aw_bits_size; // @[Tile.scala 61:11]
  assign io_axi4_w_valid = xbar_io_axi4_w_valid; // @[Tile.scala 61:11]
  assign io_axi4_w_bits_data = xbar_io_axi4_w_bits_data; // @[Tile.scala 61:11]
  assign io_axi4_w_bits_strb = xbar_io_axi4_w_bits_strb; // @[Tile.scala 61:11]
  assign io_axi4_w_bits_last = xbar_io_axi4_w_bits_last; // @[Tile.scala 61:11]
  assign io_axi4_ar_valid = xbar_io_axi4_ar_valid; // @[Tile.scala 61:11]
  assign io_axi4_ar_bits_addr = xbar_io_axi4_ar_bits_addr; // @[Tile.scala 61:11]
  assign io_axi4_ar_bits_size = xbar_io_axi4_ar_bits_size; // @[Tile.scala 61:11]
  assign io_axi4_r_ready = xbar_io_axi4_r_ready; // @[Tile.scala 61:11]
  assign core_clock = clock;
  assign core_reset = reset;
  assign core_io_icache_resp_valid = icache_io_cpu_resp_valid; // @[Tile.scala 54:18]
  assign core_io_icache_resp_bits_rdata_0 = icache_io_cpu_resp_bits_rdata_0; // @[Tile.scala 54:18]
  assign core_io_icache_resp_bits_rdata_1 = icache_io_cpu_resp_bits_rdata_1; // @[Tile.scala 54:18]
  assign core_io_icache_resp_bits_respn = icache_io_cpu_resp_bits_respn; // @[Tile.scala 54:18]
  assign core_io_dcache_resp_valid = dcache_io_cpu_resp_valid; // @[Tile.scala 55:18]
  assign core_io_dcache_resp_bits_rdata_0 = dcache_io_cpu_resp_bits_rdata_0; // @[Tile.scala 55:18]
  assign core_io_dcache_resp_bits_rdata_1 = dcache_io_cpu_resp_bits_rdata_1; // @[Tile.scala 55:18]
  assign icache_clock = clock;
  assign icache_reset = reset;
  assign icache_io_cpu_req_bits_addr = core_io_icache_req_bits_addr; // @[Tile.scala 54:18]
  assign icache_io_cpu_req_bits_mtype = core_io_icache_req_bits_mtype; // @[Tile.scala 54:18]
  assign icache_io_bar_resp_valid = xbar_io_cache_1_resp_valid; // @[Tile.scala 59:20]
  assign icache_io_bar_resp_data = xbar_io_cache_1_resp_data; // @[Tile.scala 59:20]
  assign dcache_clock = clock;
  assign dcache_reset = reset;
  assign dcache_io_cpu_req_valid = core_io_dcache_req_valid; // @[Tile.scala 55:18]
  assign dcache_io_cpu_req_bits_addr = core_io_dcache_req_bits_addr; // @[Tile.scala 55:18]
  assign dcache_io_cpu_req_bits_wdata = core_io_dcache_req_bits_wdata; // @[Tile.scala 55:18]
  assign dcache_io_cpu_req_bits_wen = core_io_dcache_req_bits_wen; // @[Tile.scala 55:18]
  assign dcache_io_cpu_req_bits_mtype = core_io_dcache_req_bits_mtype; // @[Tile.scala 55:18]
  assign dcache_io_bar_resp_valid = xbar_io_cache_0_resp_valid; // @[Tile.scala 58:20]
  assign dcache_io_bar_resp_data = xbar_io_cache_0_resp_data; // @[Tile.scala 58:20]
  assign xbar_clock = clock;
  assign xbar_reset = reset;
  assign xbar_io_cache_0_req_valid = dcache_io_bar_req_valid; // @[Tile.scala 58:20]
  assign xbar_io_cache_0_req_wen = dcache_io_bar_req_wen; // @[Tile.scala 58:20]
  assign xbar_io_cache_0_req_addr = dcache_io_bar_req_addr; // @[Tile.scala 58:20]
  assign xbar_io_cache_0_req_data = dcache_io_bar_req_data; // @[Tile.scala 58:20]
  assign xbar_io_cache_0_req_mtype = dcache_io_bar_req_mtype; // @[Tile.scala 58:20]
  assign xbar_io_cache_1_req_valid = icache_io_bar_req_valid; // @[Tile.scala 59:20]
  assign xbar_io_cache_1_req_addr = icache_io_bar_req_addr; // @[Tile.scala 59:20]
  assign xbar_io_axi4_aw_ready = io_axi4_aw_ready; // @[Tile.scala 61:11]
  assign xbar_io_axi4_w_ready = io_axi4_w_ready; // @[Tile.scala 61:11]
  assign xbar_io_axi4_b_valid = io_axi4_b_valid; // @[Tile.scala 61:11]
  assign xbar_io_axi4_ar_ready = io_axi4_ar_ready; // @[Tile.scala 61:11]
  assign xbar_io_axi4_r_valid = io_axi4_r_valid; // @[Tile.scala 61:11]
  assign xbar_io_axi4_r_bits_data = io_axi4_r_bits_data; // @[Tile.scala 61:11]
  assign xbar_io_axi4_r_bits_last = io_axi4_r_bits_last; // @[Tile.scala 61:11]
endmodule
module ysyx_210134(
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
  wire  tile_clock; // @[TileSoC.scala 50:20]
  wire  tile_reset; // @[TileSoC.scala 50:20]
  wire  tile_io_axi4_aw_ready; // @[TileSoC.scala 50:20]
  wire  tile_io_axi4_aw_valid; // @[TileSoC.scala 50:20]
  wire [31:0] tile_io_axi4_aw_bits_addr; // @[TileSoC.scala 50:20]
  wire [2:0] tile_io_axi4_aw_bits_size; // @[TileSoC.scala 50:20]
  wire  tile_io_axi4_w_ready; // @[TileSoC.scala 50:20]
  wire  tile_io_axi4_w_valid; // @[TileSoC.scala 50:20]
  wire [63:0] tile_io_axi4_w_bits_data; // @[TileSoC.scala 50:20]
  wire [7:0] tile_io_axi4_w_bits_strb; // @[TileSoC.scala 50:20]
  wire  tile_io_axi4_w_bits_last; // @[TileSoC.scala 50:20]
  wire  tile_io_axi4_b_valid; // @[TileSoC.scala 50:20]
  wire  tile_io_axi4_ar_ready; // @[TileSoC.scala 50:20]
  wire  tile_io_axi4_ar_valid; // @[TileSoC.scala 50:20]
  wire [31:0] tile_io_axi4_ar_bits_addr; // @[TileSoC.scala 50:20]
  wire [2:0] tile_io_axi4_ar_bits_size; // @[TileSoC.scala 50:20]
  wire  tile_io_axi4_r_ready; // @[TileSoC.scala 50:20]
  wire  tile_io_axi4_r_valid; // @[TileSoC.scala 50:20]
  wire [63:0] tile_io_axi4_r_bits_data; // @[TileSoC.scala 50:20]
  wire  tile_io_axi4_r_bits_last; // @[TileSoC.scala 50:20]
  ysyx_210134_Tile tile ( // @[TileSoC.scala 50:20]
    .clock(tile_clock),
    .reset(tile_reset),
    .io_axi4_aw_ready(tile_io_axi4_aw_ready),
    .io_axi4_aw_valid(tile_io_axi4_aw_valid),
    .io_axi4_aw_bits_addr(tile_io_axi4_aw_bits_addr),
    .io_axi4_aw_bits_size(tile_io_axi4_aw_bits_size),
    .io_axi4_w_ready(tile_io_axi4_w_ready),
    .io_axi4_w_valid(tile_io_axi4_w_valid),
    .io_axi4_w_bits_data(tile_io_axi4_w_bits_data),
    .io_axi4_w_bits_strb(tile_io_axi4_w_bits_strb),
    .io_axi4_w_bits_last(tile_io_axi4_w_bits_last),
    .io_axi4_b_valid(tile_io_axi4_b_valid),
    .io_axi4_ar_ready(tile_io_axi4_ar_ready),
    .io_axi4_ar_valid(tile_io_axi4_ar_valid),
    .io_axi4_ar_bits_addr(tile_io_axi4_ar_bits_addr),
    .io_axi4_ar_bits_size(tile_io_axi4_ar_bits_size),
    .io_axi4_r_ready(tile_io_axi4_r_ready),
    .io_axi4_r_valid(tile_io_axi4_r_valid),
    .io_axi4_r_bits_data(tile_io_axi4_r_bits_data),
    .io_axi4_r_bits_last(tile_io_axi4_r_bits_last)
  );
  assign io_master_awvalid = tile_io_axi4_aw_valid; // @[TileSoC.scala 54:21]
  assign io_master_awaddr = tile_io_axi4_aw_bits_addr; // @[TileSoC.scala 55:21]
  assign io_master_awid = 4'h0; // @[TileSoC.scala 56:21]
  assign io_master_awlen = 8'h0; // @[TileSoC.scala 57:21]
  assign io_master_awsize = tile_io_axi4_aw_bits_size; // @[TileSoC.scala 58:21]
  assign io_master_awburst = 2'h1; // @[TileSoC.scala 59:21]
  assign io_master_wvalid = tile_io_axi4_w_valid; // @[TileSoC.scala 62:21]
  assign io_master_wdata = tile_io_axi4_w_bits_data; // @[TileSoC.scala 63:21]
  assign io_master_wstrb = tile_io_axi4_w_bits_strb; // @[TileSoC.scala 64:21]
  assign io_master_wlast = tile_io_axi4_w_bits_last; // @[TileSoC.scala 65:21]
  assign io_master_bready = 1'h1; // @[TileSoC.scala 67:21]
  assign io_master_arvalid = tile_io_axi4_ar_valid; // @[TileSoC.scala 73:21]
  assign io_master_araddr = tile_io_axi4_ar_bits_addr; // @[TileSoC.scala 74:21]
  assign io_master_arid = 4'h0; // @[TileSoC.scala 75:21]
  assign io_master_arlen = 8'h0; // @[TileSoC.scala 76:21]
  assign io_master_arsize = tile_io_axi4_ar_bits_size; // @[TileSoC.scala 77:21]
  assign io_master_arburst = 2'h1; // @[TileSoC.scala 78:21]
  assign io_master_rready = tile_io_axi4_r_ready; // @[TileSoC.scala 80:21]
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
  assign tile_clock = clock;
  assign tile_reset = reset;
  assign tile_io_axi4_aw_ready = io_master_awready; // @[TileSoC.scala 53:21]
  assign tile_io_axi4_w_ready = io_master_wready; // @[TileSoC.scala 61:21]
  assign tile_io_axi4_b_valid = io_master_bvalid; // @[TileSoC.scala 68:21]
  assign tile_io_axi4_ar_ready = io_master_arready; // @[TileSoC.scala 72:21]
  assign tile_io_axi4_r_valid = io_master_rvalid; // @[TileSoC.scala 81:21]
  assign tile_io_axi4_r_bits_data = io_master_rdata; // @[TileSoC.scala 83:21]
  assign tile_io_axi4_r_bits_last = io_master_rlast; // @[TileSoC.scala 84:21]
endmodule
