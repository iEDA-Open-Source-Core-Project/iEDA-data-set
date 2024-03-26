module ysyx_040318_ICache_Stage0(
  input          clock,
  input          reset,
  input          io_flush,
  output         io_cpu_addr_ready,
  input          io_cpu_addr_valid,
  input  [63:0]  io_cpu_addr_bits_addr,
  output [5:0]   io_sram_sram_addr,
  input  [127:0] io_sram_sram_data_0,
  input  [127:0] io_sram_sram_data_1,
  input  [127:0] io_sram_sram_tag_0,
  input  [127:0] io_sram_sram_tag_1,
  input          io_sram_ready,
  input          io_cache_stage1_ready,
  output         io_cache_stage1_valid,
  output [63:0]  io_cache_stage1_bits_cpu_addr,
  output         io_cache_stage1_bits_is_mmio,
  output         io_cache_stage1_bits_is_dram,
  output         io_cache_stage1_bits_sram_0_hit,
  output [127:0] io_cache_stage1_bits_sram_0_rdata,
  output         io_cache_stage1_bits_sram_1_hit,
  output [127:0] io_cache_stage1_bits_sram_1_rdata
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] reg_cpu_addr; // @[icache.scala 52:42]
  reg  reg_valid; // @[icache.scala 53:42]
  reg  reg_is_mmio; // @[icache.scala 54:42]
  reg  reg_is_dram; // @[icache.scala 56:42]
  wire [53:0] reg_tag = reg_cpu_addr[63:10]; // @[icache.scala 57:39]
  wire [5:0] reg_index = reg_cpu_addr[9:4]; // @[icache.scala 58:39]
  wire  valid = io_cpu_addr_valid & ~io_flush; // @[icache.scala 61:39]
  wire  ready = io_sram_ready & io_cache_stage1_ready | ~reg_valid; // @[icache.scala 62:60]
  wire  is_not_dram = io_cpu_addr_bits_addr < 64'h80000000; // @[icache.scala 69:50]
  wire  is_reserve = io_cpu_addr_bits_addr < 64'h2000000; // @[icache.scala 70:50]
  wire [53:0] tag_0 = io_sram_sram_tag_0[53:0]; // @[icache.scala 78:46]
  wire [53:0] tag_1 = io_sram_sram_tag_1[53:0]; // @[icache.scala 79:46]
  assign io_cpu_addr_ready = io_sram_ready & io_cache_stage1_ready | ~reg_valid; // @[icache.scala 62:60]
  assign io_sram_sram_addr = ready ? io_cpu_addr_bits_addr[9:4] : reg_index; // @[icache.scala 63:24]
  assign io_cache_stage1_valid = reg_valid & io_sram_ready; // @[icache.scala 89:46]
  assign io_cache_stage1_bits_cpu_addr = reg_cpu_addr; // @[icache.scala 90:41]
  assign io_cache_stage1_bits_is_mmio = reg_is_mmio; // @[icache.scala 91:41]
  assign io_cache_stage1_bits_is_dram = reg_is_dram; // @[icache.scala 93:41]
  assign io_cache_stage1_bits_sram_0_hit = reg_tag == tag_0; // @[icache.scala 80:36]
  assign io_cache_stage1_bits_sram_0_rdata = io_sram_sram_data_0; // @[icache.scala 82:55]
  assign io_cache_stage1_bits_sram_1_hit = reg_tag == tag_1; // @[icache.scala 81:36]
  assign io_cache_stage1_bits_sram_1_rdata = io_sram_sram_data_1; // @[icache.scala 83:55]
  always @(posedge clock) begin
    if (reset) begin // @[icache.scala 52:42]
      reg_cpu_addr <= 64'h0; // @[icache.scala 52:42]
    end else if (ready) begin // @[icache.scala 71:20]
      reg_cpu_addr <= io_cpu_addr_bits_addr; // @[icache.scala 72:33]
    end
    if (reset) begin // @[icache.scala 53:42]
      reg_valid <= 1'h0; // @[icache.scala 53:42]
    end else if (io_flush) begin // @[icache.scala 64:23]
      reg_valid <= 1'h0; // @[icache.scala 65:27]
    end else if (ready) begin // @[icache.scala 66:26]
      reg_valid <= valid; // @[icache.scala 67:27]
    end
    if (reset) begin // @[icache.scala 54:42]
      reg_is_mmio <= 1'h0; // @[icache.scala 54:42]
    end else if (ready) begin // @[icache.scala 71:20]
      reg_is_mmio <= is_not_dram & ~is_reserve; // @[icache.scala 73:41]
    end
    if (reset) begin // @[icache.scala 56:42]
      reg_is_dram <= 1'h0; // @[icache.scala 56:42]
    end else if (ready) begin // @[icache.scala 71:20]
      reg_is_dram <= ~is_not_dram; // @[icache.scala 74:41]
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
  reg_cpu_addr = _RAND_0[63:0];
  _RAND_1 = {1{`RANDOM}};
  reg_valid = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  reg_is_mmio = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  reg_is_dram = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_040318_ICache_Stage1(
  input          clock,
  input          reset,
  input          io_flush,
  input          io_fence_i,
  output         io_cache_stage1_ready,
  input          io_cache_stage1_valid,
  input  [63:0]  io_cache_stage1_bits_cpu_addr,
  input          io_cache_stage1_bits_is_mmio,
  input          io_cache_stage1_bits_is_dram,
  input          io_cache_stage1_bits_sram_0_hit,
  input  [127:0] io_cache_stage1_bits_sram_0_rdata,
  input          io_cache_stage1_bits_sram_1_hit,
  input  [127:0] io_cache_stage1_bits_sram_1_rdata,
  output         io_cache_bus_r_valid,
  output [63:0]  io_cache_bus_r_bits_raddr,
  output [1:0]   io_cache_bus_r_bits_rlen,
  output [1:0]   io_cache_bus_r_bits_rsize,
  input  [63:0]  io_cache_bus_r_bits_rdata,
  input          io_cache_bus_r_bits_rlast,
  input          io_cache_bus_r_ready,
  output         io_sram_w_valid,
  output [5:0]   io_sram_w_sram_addr,
  output [127:0] io_sram_w_sram_data,
  output [127:0] io_sram_w_sram_tag,
  output         io_sram_w_chose_tag,
  input          io_rdata_ready,
  output         io_rdata_valid,
  output [63:0]  io_rdata_bits_data,
  output [63:0]  io_rdata_bits_pc
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [63:0] _RAND_5;
  reg [127:0] _RAND_6;
  reg [63:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [63:0] _RAND_11;
  reg [63:0] _RAND_12;
  reg [63:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
`endif // RANDOMIZE_REG_INIT
  reg  reg_chosen_tag; // @[icache.scala 121:42]
  reg [63:0] reg_rdata; // @[icache.scala 122:42]
  reg  reg_valid; // @[icache.scala 124:34]
  reg  reg_ready; // @[icache.scala 125:34]
  wire  ready = io_rdata_ready & reg_ready; // @[icache.scala 127:42]
  reg  reg_cache_write; // @[icache.scala 143:42]
  wire [5:0] index = io_cache_stage1_bits_cpu_addr[9:4]; // @[icache.scala 131:56]
  reg [63:0] reg_cpu_addr; // @[icache.scala 144:42]
  wire [5:0] reg_index = reg_cpu_addr[9:4]; // @[icache.scala 146:39]
  wire  _T_2 = ~reg_chosen_tag; // @[icache.scala 190:37]
  reg [127:0] reg_cache_wdata; // @[icache.scala 142:38]
  wire [127:0] _GEN_5 = ~reg_chosen_tag ? reg_cache_wdata : io_cache_stage1_bits_sram_0_rdata; // @[icache.scala 184:25 190:45 192:33]
  wire [127:0] rdata_0 = reg_cache_write & index == reg_index ? _GEN_5 : io_cache_stage1_bits_sram_0_rdata; // @[icache.scala 184:25 189:52]
  wire [63:0] rdata0 = io_cache_stage1_bits_cpu_addr[3] ? rdata_0[127:64] : rdata_0[63:0]; // @[icache.scala 129:38]
  wire [127:0] _GEN_9 = ~reg_chosen_tag ? io_cache_stage1_bits_sram_1_rdata : reg_cache_wdata; // @[icache.scala 185:25 190:45 197:33]
  wire [127:0] rdata_1 = reg_cache_write & index == reg_index ? _GEN_9 : io_cache_stage1_bits_sram_1_rdata; // @[icache.scala 185:25 189:52]
  wire [63:0] rdata1 = io_cache_stage1_bits_cpu_addr[3] ? rdata_1[127:64] : rdata_1[63:0]; // @[icache.scala 130:38]
  wire  _cache_valid_T_2 = io_cache_stage1_valid & ~io_flush & ready; // @[icache.scala 132:63]
  wire  cache_valid = io_cache_stage1_valid & ~io_flush & ready & io_cache_stage1_bits_is_dram; // @[icache.scala 132:71]
  wire  mmio_valid = _cache_valid_T_2 & io_cache_stage1_bits_is_mmio; // @[icache.scala 133:71]
  wire [63:0] temp_addr = {io_cache_stage1_bits_cpu_addr[63:4],4'h0}; // @[Cat.scala 33:92]
  reg [63:0] reg_r_raddr; // @[icache.scala 137:34]
  reg  reg_r_valid; // @[icache.scala 138:34]
  reg [1:0] reg_r_len; // @[icache.scala 139:34]
  reg [1:0] reg_r_size; // @[icache.scala 140:34]
  wire [53:0] reg_tag = reg_cpu_addr[63:10]; // @[icache.scala 145:39]
  wire [3:0] reg_offset = reg_cpu_addr[3:0]; // @[icache.scala 147:39]
  wire  is_sram0_write = reg_cache_write & _T_2; // @[icache.scala 149:51]
  wire  is_sram1_write = reg_cache_write & reg_chosen_tag; // @[icache.scala 150:51]
  reg [63:0] reg_sram0_valid; // @[icache.scala 151:42]
  reg [63:0] reg_sram1_valid; // @[icache.scala 152:42]
  wire [63:0] chose_bit = 64'h1 << index; // @[icache.scala 155:29]
  wire [63:0] neg_chose_bit = ~chose_bit; // @[icache.scala 156:29]
  wire [63:0] reg_chose_bit = 64'h1 << reg_index; // @[icache.scala 158:33]
  wire [63:0] _reg_sram0_valid_T = reg_sram0_valid | reg_chose_bit; // @[icache.scala 163:52]
  wire [63:0] _reg_sram1_valid_T = reg_sram1_valid | reg_chose_bit; // @[icache.scala 171:60]
  wire [63:0] _tag_valid_0_T = reg_sram0_valid >> index; // @[icache.scala 179:51]
  wire [63:0] _tag_valid_1_T = reg_sram1_valid >> index; // @[icache.scala 180:51]
  wire  _tag_valid_0_T_3 = reg_tag == io_cache_stage1_bits_cpu_addr[63:10]; // @[icache.scala 194:49]
  wire  _GEN_7 = ~reg_chosen_tag ? reg_tag == io_cache_stage1_bits_cpu_addr[63:10] | _tag_valid_0_T[0] : _tag_valid_0_T[
    0]; // @[icache.scala 179:33 190:45 194:37]
  wire  tag_valid_0 = reg_cache_write & index == reg_index ? _GEN_7 : _tag_valid_0_T[0]; // @[icache.scala 179:33 189:52]
  wire  _GEN_11 = ~reg_chosen_tag ? _tag_valid_1_T[0] : _tag_valid_0_T_3 | _tag_valid_1_T[0]; // @[icache.scala 180:33 190:45 199:37]
  wire  tag_valid_1 = reg_cache_write & index == reg_index ? _GEN_11 : _tag_valid_1_T[0]; // @[icache.scala 180:33 189:52]
  wire  _GEN_4 = ~reg_chosen_tag ? _tag_valid_0_T_3 : tag_valid_0 & io_cache_stage1_bits_sram_0_hit; // @[icache.scala 182:25 190:45 191:33]
  wire  _GEN_8 = ~reg_chosen_tag ? tag_valid_1 & io_cache_stage1_bits_sram_1_hit : _tag_valid_0_T_3; // @[icache.scala 183:25 190:45 196:33]
  wire  hit_0 = reg_cache_write & index == reg_index ? _GEN_4 : tag_valid_0 & io_cache_stage1_bits_sram_0_hit; // @[icache.scala 182:25 189:52]
  wire  hit_1 = reg_cache_write & index == reg_index ? _GEN_8 : tag_valid_1 & io_cache_stage1_bits_sram_1_hit; // @[icache.scala 183:25 189:52]
  reg [63:0] reg_lru_1; // @[icache.scala 205:58]
  wire [63:0] _LRU_1_T = reg_lru_1 >> index; // @[icache.scala 207:36]
  wire  LRU_1 = _LRU_1_T[0]; // @[icache.scala 207:36]
  reg [1:0] reg_bus_state; // @[icache.scala 210:36]
  wire [63:0] lru_1_and_neg_chose = reg_lru_1 & neg_chose_bit; // @[icache.scala 214:45]
  wire [63:0] lru_1_or_chose = reg_lru_1 | chose_bit; // @[icache.scala 215:40]
  wire  _T_3 = reg_bus_state == 2'h0; // @[icache.scala 220:37]
  wire  _T_5 = tag_valid_0 & tag_valid_1; // @[icache.scala 228:50]
  wire [63:0] _reg_lru_1_T = LRU_1 ? lru_1_and_neg_chose : lru_1_or_chose; // @[icache.scala 230:57]
  wire [63:0] _reg_lru_1_T_1 = tag_valid_0 ? lru_1_and_neg_chose : lru_1_or_chose; // @[icache.scala 233:57]
  wire [63:0] _GEN_21 = tag_valid_0 & tag_valid_1 ? _reg_lru_1_T : _reg_lru_1_T_1; // @[icache.scala 228:64 230:51 233:51]
  wire [63:0] _GEN_23 = hit_1 ? lru_1_and_neg_chose : _GEN_21; // @[icache.scala 224:42 226:43]
  wire  hit_0_and_valid_0 = hit_0 & tag_valid_0; // @[icache.scala 239:40]
  wire  hit_1_and_valid_1 = hit_1 & tag_valid_1; // @[icache.scala 240:40]
  wire  hit_valid = hit_0_and_valid_0 | hit_1_and_valid_1; // @[icache.scala 241:43]
  wire  is_hit = hit_0 | hit_1; // @[icache.scala 242:28]
  reg  reg_flush; // @[icache.scala 243:34]
  wire  _GEN_30 = io_flush | reg_flush; // @[icache.scala 248:31 243:34 249:41]
  wire  _GEN_33 = ready | io_flush ? 1'h0 : reg_valid; // @[icache.scala 124:34 257:47 259:57]
  wire  _reg_chosen_tag_T = hit_0 ? 1'h0 : 1'h1; // @[icache.scala 270:63]
  wire [63:0] _reg_rdata_T = hit_0 ? rdata0 : rdata1; // @[icache.scala 274:87]
  wire [63:0] _GEN_35 = hit_valid ? _reg_rdata_T : reg_rdata; // @[icache.scala 122:42 271:56 274:81]
  wire [1:0] _GEN_37 = hit_valid ? 2'h0 : 2'h1; // @[icache.scala 271:56 277:73 286:73]
  wire [63:0] _GEN_38 = hit_valid ? reg_r_raddr : temp_addr; // @[icache.scala 137:34 271:56 282:73]
  wire  _GEN_39 = hit_valid ? 1'h0 : 1'h1; // @[icache.scala 265:49 271:56 283:73]
  wire [1:0] _GEN_40 = hit_valid ? reg_r_len : 2'h1; // @[icache.scala 139:34 271:56 284:81]
  wire [1:0] _GEN_41 = hit_valid ? reg_r_size : 2'h3; // @[icache.scala 140:34 271:56 285:81]
  wire  _GEN_42 = _T_5 ? LRU_1 : tag_valid_0; // @[icache.scala 291:72 292:73 300:73]
  wire  _GEN_47 = is_hit ? _reg_chosen_tag_T : _GEN_42; // @[icache.scala 267:45 270:57]
  wire  _GEN_49 = is_hit & hit_valid; // @[icache.scala 267:45 289:73]
  wire  _GEN_56 = mmio_valid ? 1'h0 : 1'h1; // @[icache.scala 309:47 263:49 311:65]
  wire  _GEN_63 = cache_valid & _GEN_47; // @[icache.scala 255:41 266:42]
  wire  _GEN_66 = cache_valid ? _GEN_49 : _GEN_56; // @[icache.scala 266:42]
  wire  _T_11 = io_cache_bus_r_valid & io_cache_bus_r_ready; // @[simplebus.scala 33:40]
  wire [63:0] _reg_rdata_T_3 = reg_offset[3] ? io_cache_bus_r_bits_rdata : reg_cache_wdata[63:0]; // @[icache.scala 327:79]
  wire [127:0] _reg_cache_wdata_T_1 = {io_cache_bus_r_bits_rdata,reg_cache_wdata[63:0]}; // @[Cat.scala 33:92]
  wire  _GEN_73 = io_cache_bus_r_bits_rlast ? 1'h0 : reg_r_valid; // @[icache.scala 138:34 323:64 324:57]
  wire  _GEN_74 = io_cache_bus_r_bits_rlast | reg_valid; // @[icache.scala 124:34 323:64 326:73]
  wire [63:0] _GEN_75 = io_cache_bus_r_bits_rlast ? _reg_rdata_T_3 : reg_rdata; // @[icache.scala 122:42 323:64 327:73]
  wire [127:0] _GEN_76 = io_cache_bus_r_bits_rlast ? _reg_cache_wdata_T_1 : {{64'd0}, io_cache_bus_r_bits_rdata}; // @[icache.scala 323:64 328:65 330:65]
  wire  _GEN_77 = _T_11 ? _GEN_73 : reg_r_valid; // @[icache.scala 138:34 322:50]
  wire  _GEN_78 = _T_11 ? _GEN_74 : reg_valid; // @[icache.scala 124:34 322:50]
  wire  _GEN_81 = _T_11 & io_cache_bus_r_bits_rlast | reg_cache_write; // @[icache.scala 143:42 333:78 334:57]
  wire  _GEN_83 = _T_11 & io_cache_bus_r_bits_rlast | reg_ready; // @[icache.scala 125:34 333:78 336:65]
  wire [63:0] _GEN_84 = io_cache_bus_r_bits_rlast ? io_cache_bus_r_bits_rdata : reg_rdata; // @[icache.scala 122:42 341:64 345:65]
  wire [1:0] _GEN_85 = io_cache_bus_r_bits_rlast ? 2'h0 : reg_bus_state; // @[icache.scala 210:36 341:64 347:65]
  wire  _GEN_86 = io_cache_bus_r_bits_rlast | reg_ready; // @[icache.scala 125:34 341:64 348:73]
  wire [63:0] _GEN_89 = _T_11 ? _GEN_84 : reg_rdata; // @[icache.scala 122:42 340:50]
  wire [1:0] _GEN_90 = _T_11 ? _GEN_85 : reg_bus_state; // @[icache.scala 210:36 340:50]
  wire  _GEN_91 = _T_11 ? _GEN_86 : reg_ready; // @[icache.scala 125:34 340:50]
  wire  _GEN_96 = 2'h2 == reg_bus_state ? _GEN_91 : reg_ready; // @[icache.scala 252:30 125:34]
  wire  _GEN_103 = 2'h1 == reg_bus_state ? _GEN_83 : _GEN_96; // @[icache.scala 252:30]
  wire  _GEN_109 = 2'h0 == reg_bus_state ? _GEN_66 : _GEN_103; // @[icache.scala 252:30]
  assign io_cache_stage1_ready = io_rdata_ready & reg_ready; // @[icache.scala 127:42]
  assign io_cache_bus_r_valid = reg_r_valid; // @[icache.scala 381:41]
  assign io_cache_bus_r_bits_raddr = reg_r_raddr; // @[icache.scala 378:41]
  assign io_cache_bus_r_bits_rlen = reg_r_len; // @[icache.scala 379:41]
  assign io_cache_bus_r_bits_rsize = reg_r_size; // @[icache.scala 380:41]
  assign io_sram_w_valid = reg_cache_write; // @[icache.scala 357:33]
  assign io_sram_w_sram_addr = reg_cpu_addr[9:4]; // @[icache.scala 146:39]
  assign io_sram_w_sram_data = reg_cache_wdata; // @[icache.scala 359:33]
  assign io_sram_w_sram_tag = {{74'd0}, reg_tag}; // @[icache.scala 360:33]
  assign io_sram_w_chose_tag = reg_chosen_tag; // @[icache.scala 361:33]
  assign io_rdata_valid = reg_valid & ~reg_flush; // @[icache.scala 363:46]
  assign io_rdata_bits_data = reg_rdata; // @[icache.scala 364:33]
  assign io_rdata_bits_pc = reg_cpu_addr; // @[icache.scala 365:41]
  always @(posedge clock) begin
    if (reset) begin // @[icache.scala 121:42]
      reg_chosen_tag <= 1'h0; // @[icache.scala 121:42]
    end else if (2'h0 == reg_bus_state) begin // @[icache.scala 252:30]
      reg_chosen_tag <= _GEN_63;
    end
    if (reset) begin // @[icache.scala 122:42]
      reg_rdata <= 64'h0; // @[icache.scala 122:42]
    end else if (2'h0 == reg_bus_state) begin // @[icache.scala 252:30]
      if (cache_valid) begin // @[icache.scala 266:42]
        if (is_hit) begin // @[icache.scala 267:45]
          reg_rdata <= _GEN_35;
        end
      end
    end else if (2'h1 == reg_bus_state) begin // @[icache.scala 252:30]
      if (_T_11) begin // @[icache.scala 322:50]
        reg_rdata <= _GEN_75;
      end
    end else if (2'h2 == reg_bus_state) begin // @[icache.scala 252:30]
      reg_rdata <= _GEN_89;
    end
    if (reset) begin // @[icache.scala 124:34]
      reg_valid <= 1'h0; // @[icache.scala 124:34]
    end else if (2'h0 == reg_bus_state) begin // @[icache.scala 252:30]
      if (cache_valid) begin // @[icache.scala 266:42]
        reg_valid <= _GEN_49;
      end else if (mmio_valid) begin // @[icache.scala 309:47]
        reg_valid <= 1'h0; // @[icache.scala 310:65]
      end else begin
        reg_valid <= _GEN_33;
      end
    end else if (2'h1 == reg_bus_state) begin // @[icache.scala 252:30]
      reg_valid <= _GEN_78;
    end else if (2'h2 == reg_bus_state) begin // @[icache.scala 252:30]
      reg_valid <= _GEN_78;
    end
    reg_ready <= reset | _GEN_109; // @[icache.scala 125:{34,34}]
    if (reset) begin // @[icache.scala 143:42]
      reg_cache_write <= 1'h0; // @[icache.scala 143:42]
    end else if (2'h0 == reg_bus_state) begin // @[icache.scala 252:30]
      reg_cache_write <= 1'h0; // @[icache.scala 254:41]
    end else if (2'h1 == reg_bus_state) begin // @[icache.scala 252:30]
      reg_cache_write <= _GEN_81;
    end
    if (reset) begin // @[icache.scala 144:42]
      reg_cpu_addr <= 64'h0; // @[icache.scala 144:42]
    end else if (2'h0 == reg_bus_state) begin // @[icache.scala 252:30]
      if (ready | io_flush) begin // @[icache.scala 257:47]
        reg_cpu_addr <= io_cache_stage1_bits_cpu_addr; // @[icache.scala 260:49]
      end
    end
    if (reset) begin // @[icache.scala 142:38]
      reg_cache_wdata <= 128'h0; // @[icache.scala 142:38]
    end else if (!(2'h0 == reg_bus_state)) begin // @[icache.scala 252:30]
      if (2'h1 == reg_bus_state) begin // @[icache.scala 252:30]
        if (_T_11) begin // @[icache.scala 322:50]
          reg_cache_wdata <= _GEN_76;
        end
      end
    end
    if (reset) begin // @[icache.scala 137:34]
      reg_r_raddr <= 64'h0; // @[icache.scala 137:34]
    end else if (2'h0 == reg_bus_state) begin // @[icache.scala 252:30]
      if (cache_valid) begin // @[icache.scala 266:42]
        if (is_hit) begin // @[icache.scala 267:45]
          reg_r_raddr <= _GEN_38;
        end else begin
          reg_r_raddr <= temp_addr;
        end
      end else if (mmio_valid) begin // @[icache.scala 309:47]
        reg_r_raddr <= io_cache_stage1_bits_cpu_addr; // @[icache.scala 314:57]
      end
    end
    if (reset) begin // @[icache.scala 138:34]
      reg_r_valid <= 1'h0; // @[icache.scala 138:34]
    end else if (2'h0 == reg_bus_state) begin // @[icache.scala 252:30]
      if (cache_valid) begin // @[icache.scala 266:42]
        if (is_hit) begin // @[icache.scala 267:45]
          reg_r_valid <= _GEN_39;
        end else begin
          reg_r_valid <= 1'h1;
        end
      end else begin
        reg_r_valid <= mmio_valid;
      end
    end else if (2'h1 == reg_bus_state) begin // @[icache.scala 252:30]
      reg_r_valid <= _GEN_77;
    end else if (2'h2 == reg_bus_state) begin // @[icache.scala 252:30]
      reg_r_valid <= _GEN_77;
    end
    if (reset) begin // @[icache.scala 139:34]
      reg_r_len <= 2'h0; // @[icache.scala 139:34]
    end else if (2'h0 == reg_bus_state) begin // @[icache.scala 252:30]
      if (cache_valid) begin // @[icache.scala 266:42]
        if (is_hit) begin // @[icache.scala 267:45]
          reg_r_len <= _GEN_40;
        end else begin
          reg_r_len <= 2'h1;
        end
      end else if (mmio_valid) begin // @[icache.scala 309:47]
        reg_r_len <= 2'h0; // @[icache.scala 316:65]
      end
    end
    if (reset) begin // @[icache.scala 140:34]
      reg_r_size <= 2'h0; // @[icache.scala 140:34]
    end else if (2'h0 == reg_bus_state) begin // @[icache.scala 252:30]
      if (cache_valid) begin // @[icache.scala 266:42]
        if (is_hit) begin // @[icache.scala 267:45]
          reg_r_size <= _GEN_41;
        end else begin
          reg_r_size <= 2'h3;
        end
      end else if (mmio_valid) begin // @[icache.scala 309:47]
        reg_r_size <= 2'h2; // @[icache.scala 317:65]
      end
    end
    if (reset) begin // @[icache.scala 151:42]
      reg_sram0_valid <= 64'h0; // @[icache.scala 151:42]
    end else if (io_fence_i) begin // @[icache.scala 160:26]
      reg_sram0_valid <= 64'h0; // @[icache.scala 161:33]
    end else if (is_sram0_write) begin // @[icache.scala 162:35]
      reg_sram0_valid <= _reg_sram0_valid_T; // @[icache.scala 163:33]
    end
    if (reset) begin // @[icache.scala 152:42]
      reg_sram1_valid <= 64'h0; // @[icache.scala 152:42]
    end else if (io_fence_i) begin // @[icache.scala 168:26]
      reg_sram1_valid <= 64'h0; // @[icache.scala 169:41]
    end else if (is_sram1_write) begin // @[icache.scala 170:35]
      reg_sram1_valid <= _reg_sram1_valid_T; // @[icache.scala 171:41]
    end
    if (reset) begin // @[icache.scala 205:58]
      reg_lru_1 <= 64'h0; // @[icache.scala 205:58]
    end else if (io_fence_i) begin // @[icache.scala 216:26]
      reg_lru_1 <= 64'h0; // @[icache.scala 218:33]
    end else if (reg_bus_state == 2'h0 & cache_valid) begin // @[icache.scala 220:63]
      if (hit_0) begin // @[icache.scala 221:36]
        reg_lru_1 <= lru_1_or_chose; // @[icache.scala 223:43]
      end else begin
        reg_lru_1 <= _GEN_23;
      end
    end
    if (reset) begin // @[icache.scala 210:36]
      reg_bus_state <= 2'h0; // @[icache.scala 210:36]
    end else if (2'h0 == reg_bus_state) begin // @[icache.scala 252:30]
      if (cache_valid) begin // @[icache.scala 266:42]
        if (is_hit) begin // @[icache.scala 267:45]
          reg_bus_state <= _GEN_37;
        end else begin
          reg_bus_state <= 2'h1;
        end
      end else if (mmio_valid) begin // @[icache.scala 309:47]
        reg_bus_state <= 2'h2; // @[icache.scala 318:57]
      end else begin
        reg_bus_state <= 2'h0; // @[icache.scala 264:41]
      end
    end else if (2'h1 == reg_bus_state) begin // @[icache.scala 252:30]
      if (_T_11 & io_cache_bus_r_bits_rlast) begin // @[icache.scala 333:78]
        reg_bus_state <= 2'h0; // @[icache.scala 335:57]
      end
    end else if (2'h2 == reg_bus_state) begin // @[icache.scala 252:30]
      reg_bus_state <= _GEN_90;
    end
    if (reset) begin // @[icache.scala 243:34]
      reg_flush <= 1'h0; // @[icache.scala 243:34]
    end else if (_T_3) begin // @[icache.scala 245:41]
      reg_flush <= 1'h0; // @[icache.scala 246:33]
    end else begin
      reg_flush <= _GEN_30;
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
  reg_chosen_tag = _RAND_0[0:0];
  _RAND_1 = {2{`RANDOM}};
  reg_rdata = _RAND_1[63:0];
  _RAND_2 = {1{`RANDOM}};
  reg_valid = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  reg_ready = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  reg_cache_write = _RAND_4[0:0];
  _RAND_5 = {2{`RANDOM}};
  reg_cpu_addr = _RAND_5[63:0];
  _RAND_6 = {4{`RANDOM}};
  reg_cache_wdata = _RAND_6[127:0];
  _RAND_7 = {2{`RANDOM}};
  reg_r_raddr = _RAND_7[63:0];
  _RAND_8 = {1{`RANDOM}};
  reg_r_valid = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  reg_r_len = _RAND_9[1:0];
  _RAND_10 = {1{`RANDOM}};
  reg_r_size = _RAND_10[1:0];
  _RAND_11 = {2{`RANDOM}};
  reg_sram0_valid = _RAND_11[63:0];
  _RAND_12 = {2{`RANDOM}};
  reg_sram1_valid = _RAND_12[63:0];
  _RAND_13 = {2{`RANDOM}};
  reg_lru_1 = _RAND_13[63:0];
  _RAND_14 = {1{`RANDOM}};
  reg_bus_state = _RAND_14[1:0];
  _RAND_15 = {1{`RANDOM}};
  reg_flush = _RAND_15[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_040318_ICache(
  input          clock,
  input          reset,
  input          io_flush,
  input          io_fence_i,
  output         io_cpu_addr_ready,
  input          io_cpu_addr_valid,
  input  [63:0]  io_cpu_addr_bits_addr,
  input          io_cpu_rdata_ready,
  output         io_cpu_rdata_valid,
  output [63:0]  io_cpu_rdata_bits_data,
  output [63:0]  io_cpu_rdata_bits_pc,
  output [5:0]   io_sram_addr,
  output         io_sram_wen_0,
  output         io_sram_wen_1,
  output [127:0] io_sram_tag_wdata,
  output [127:0] io_sram_data_wdata,
  input  [127:0] io_sram_rdata_0,
  input  [127:0] io_sram_rdata_1,
  input  [127:0] io_sram_rdata_2,
  input  [127:0] io_sram_rdata_3,
  output         io_cache_bus_r_valid,
  output [63:0]  io_cache_bus_r_bits_raddr,
  output [1:0]   io_cache_bus_r_bits_rlen,
  output [1:0]   io_cache_bus_r_bits_rsize,
  input  [63:0]  io_cache_bus_r_bits_rdata,
  input          io_cache_bus_r_bits_rlast,
  input          io_cache_bus_r_ready
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire  icache_stage0_clock; // @[icache.scala 395:41]
  wire  icache_stage0_reset; // @[icache.scala 395:41]
  wire  icache_stage0_io_flush; // @[icache.scala 395:41]
  wire  icache_stage0_io_cpu_addr_ready; // @[icache.scala 395:41]
  wire  icache_stage0_io_cpu_addr_valid; // @[icache.scala 395:41]
  wire [63:0] icache_stage0_io_cpu_addr_bits_addr; // @[icache.scala 395:41]
  wire [5:0] icache_stage0_io_sram_sram_addr; // @[icache.scala 395:41]
  wire [127:0] icache_stage0_io_sram_sram_data_0; // @[icache.scala 395:41]
  wire [127:0] icache_stage0_io_sram_sram_data_1; // @[icache.scala 395:41]
  wire [127:0] icache_stage0_io_sram_sram_tag_0; // @[icache.scala 395:41]
  wire [127:0] icache_stage0_io_sram_sram_tag_1; // @[icache.scala 395:41]
  wire  icache_stage0_io_sram_ready; // @[icache.scala 395:41]
  wire  icache_stage0_io_cache_stage1_ready; // @[icache.scala 395:41]
  wire  icache_stage0_io_cache_stage1_valid; // @[icache.scala 395:41]
  wire [63:0] icache_stage0_io_cache_stage1_bits_cpu_addr; // @[icache.scala 395:41]
  wire  icache_stage0_io_cache_stage1_bits_is_mmio; // @[icache.scala 395:41]
  wire  icache_stage0_io_cache_stage1_bits_is_dram; // @[icache.scala 395:41]
  wire  icache_stage0_io_cache_stage1_bits_sram_0_hit; // @[icache.scala 395:41]
  wire [127:0] icache_stage0_io_cache_stage1_bits_sram_0_rdata; // @[icache.scala 395:41]
  wire  icache_stage0_io_cache_stage1_bits_sram_1_hit; // @[icache.scala 395:41]
  wire [127:0] icache_stage0_io_cache_stage1_bits_sram_1_rdata; // @[icache.scala 395:41]
  wire  icache_stage1_clock; // @[icache.scala 396:41]
  wire  icache_stage1_reset; // @[icache.scala 396:41]
  wire  icache_stage1_io_flush; // @[icache.scala 396:41]
  wire  icache_stage1_io_fence_i; // @[icache.scala 396:41]
  wire  icache_stage1_io_cache_stage1_ready; // @[icache.scala 396:41]
  wire  icache_stage1_io_cache_stage1_valid; // @[icache.scala 396:41]
  wire [63:0] icache_stage1_io_cache_stage1_bits_cpu_addr; // @[icache.scala 396:41]
  wire  icache_stage1_io_cache_stage1_bits_is_mmio; // @[icache.scala 396:41]
  wire  icache_stage1_io_cache_stage1_bits_is_dram; // @[icache.scala 396:41]
  wire  icache_stage1_io_cache_stage1_bits_sram_0_hit; // @[icache.scala 396:41]
  wire [127:0] icache_stage1_io_cache_stage1_bits_sram_0_rdata; // @[icache.scala 396:41]
  wire  icache_stage1_io_cache_stage1_bits_sram_1_hit; // @[icache.scala 396:41]
  wire [127:0] icache_stage1_io_cache_stage1_bits_sram_1_rdata; // @[icache.scala 396:41]
  wire  icache_stage1_io_cache_bus_r_valid; // @[icache.scala 396:41]
  wire [63:0] icache_stage1_io_cache_bus_r_bits_raddr; // @[icache.scala 396:41]
  wire [1:0] icache_stage1_io_cache_bus_r_bits_rlen; // @[icache.scala 396:41]
  wire [1:0] icache_stage1_io_cache_bus_r_bits_rsize; // @[icache.scala 396:41]
  wire [63:0] icache_stage1_io_cache_bus_r_bits_rdata; // @[icache.scala 396:41]
  wire  icache_stage1_io_cache_bus_r_bits_rlast; // @[icache.scala 396:41]
  wire  icache_stage1_io_cache_bus_r_ready; // @[icache.scala 396:41]
  wire  icache_stage1_io_sram_w_valid; // @[icache.scala 396:41]
  wire [5:0] icache_stage1_io_sram_w_sram_addr; // @[icache.scala 396:41]
  wire [127:0] icache_stage1_io_sram_w_sram_data; // @[icache.scala 396:41]
  wire [127:0] icache_stage1_io_sram_w_sram_tag; // @[icache.scala 396:41]
  wire  icache_stage1_io_sram_w_chose_tag; // @[icache.scala 396:41]
  wire  icache_stage1_io_rdata_ready; // @[icache.scala 396:41]
  wire  icache_stage1_io_rdata_valid; // @[icache.scala 396:41]
  wire [63:0] icache_stage1_io_rdata_bits_data; // @[icache.scala 396:41]
  wire [63:0] icache_stage1_io_rdata_bits_pc; // @[icache.scala 396:41]
  wire  is_sram0_write = icache_stage1_io_sram_w_valid & ~icache_stage1_io_sram_w_chose_tag; // @[icache.scala 408:46]
  wire  is_sram1_write = icache_stage1_io_sram_w_valid & icache_stage1_io_sram_w_chose_tag; // @[icache.scala 409:46]
  reg [5:0] reg_temp_r_index; // @[icache.scala 426:42]
  wire  _w_r_pass0_val_T = reg_temp_r_index == icache_stage1_io_sram_w_sram_addr; // @[icache.scala 428:63]
  wire  w_r_pass0_val = is_sram0_write & reg_temp_r_index == icache_stage1_io_sram_w_sram_addr; // @[icache.scala 428:44]
  wire  w_r_pass1_val = is_sram1_write & _w_r_pass0_val_T; // @[icache.scala 429:44]
  reg  reg_sram_r_ready; // @[icache.scala 431:39]
  wire  _reg_sram_r_ready_T = icache_stage1_io_sram_w_valid ? 1'h0 : 1'h1; // @[icache.scala 432:32]
  ysyx_040318_ICache_Stage0 icache_stage0 ( // @[icache.scala 395:41]
    .clock(icache_stage0_clock),
    .reset(icache_stage0_reset),
    .io_flush(icache_stage0_io_flush),
    .io_cpu_addr_ready(icache_stage0_io_cpu_addr_ready),
    .io_cpu_addr_valid(icache_stage0_io_cpu_addr_valid),
    .io_cpu_addr_bits_addr(icache_stage0_io_cpu_addr_bits_addr),
    .io_sram_sram_addr(icache_stage0_io_sram_sram_addr),
    .io_sram_sram_data_0(icache_stage0_io_sram_sram_data_0),
    .io_sram_sram_data_1(icache_stage0_io_sram_sram_data_1),
    .io_sram_sram_tag_0(icache_stage0_io_sram_sram_tag_0),
    .io_sram_sram_tag_1(icache_stage0_io_sram_sram_tag_1),
    .io_sram_ready(icache_stage0_io_sram_ready),
    .io_cache_stage1_ready(icache_stage0_io_cache_stage1_ready),
    .io_cache_stage1_valid(icache_stage0_io_cache_stage1_valid),
    .io_cache_stage1_bits_cpu_addr(icache_stage0_io_cache_stage1_bits_cpu_addr),
    .io_cache_stage1_bits_is_mmio(icache_stage0_io_cache_stage1_bits_is_mmio),
    .io_cache_stage1_bits_is_dram(icache_stage0_io_cache_stage1_bits_is_dram),
    .io_cache_stage1_bits_sram_0_hit(icache_stage0_io_cache_stage1_bits_sram_0_hit),
    .io_cache_stage1_bits_sram_0_rdata(icache_stage0_io_cache_stage1_bits_sram_0_rdata),
    .io_cache_stage1_bits_sram_1_hit(icache_stage0_io_cache_stage1_bits_sram_1_hit),
    .io_cache_stage1_bits_sram_1_rdata(icache_stage0_io_cache_stage1_bits_sram_1_rdata)
  );
  ysyx_040318_ICache_Stage1 icache_stage1 ( // @[icache.scala 396:41]
    .clock(icache_stage1_clock),
    .reset(icache_stage1_reset),
    .io_flush(icache_stage1_io_flush),
    .io_fence_i(icache_stage1_io_fence_i),
    .io_cache_stage1_ready(icache_stage1_io_cache_stage1_ready),
    .io_cache_stage1_valid(icache_stage1_io_cache_stage1_valid),
    .io_cache_stage1_bits_cpu_addr(icache_stage1_io_cache_stage1_bits_cpu_addr),
    .io_cache_stage1_bits_is_mmio(icache_stage1_io_cache_stage1_bits_is_mmio),
    .io_cache_stage1_bits_is_dram(icache_stage1_io_cache_stage1_bits_is_dram),
    .io_cache_stage1_bits_sram_0_hit(icache_stage1_io_cache_stage1_bits_sram_0_hit),
    .io_cache_stage1_bits_sram_0_rdata(icache_stage1_io_cache_stage1_bits_sram_0_rdata),
    .io_cache_stage1_bits_sram_1_hit(icache_stage1_io_cache_stage1_bits_sram_1_hit),
    .io_cache_stage1_bits_sram_1_rdata(icache_stage1_io_cache_stage1_bits_sram_1_rdata),
    .io_cache_bus_r_valid(icache_stage1_io_cache_bus_r_valid),
    .io_cache_bus_r_bits_raddr(icache_stage1_io_cache_bus_r_bits_raddr),
    .io_cache_bus_r_bits_rlen(icache_stage1_io_cache_bus_r_bits_rlen),
    .io_cache_bus_r_bits_rsize(icache_stage1_io_cache_bus_r_bits_rsize),
    .io_cache_bus_r_bits_rdata(icache_stage1_io_cache_bus_r_bits_rdata),
    .io_cache_bus_r_bits_rlast(icache_stage1_io_cache_bus_r_bits_rlast),
    .io_cache_bus_r_ready(icache_stage1_io_cache_bus_r_ready),
    .io_sram_w_valid(icache_stage1_io_sram_w_valid),
    .io_sram_w_sram_addr(icache_stage1_io_sram_w_sram_addr),
    .io_sram_w_sram_data(icache_stage1_io_sram_w_sram_data),
    .io_sram_w_sram_tag(icache_stage1_io_sram_w_sram_tag),
    .io_sram_w_chose_tag(icache_stage1_io_sram_w_chose_tag),
    .io_rdata_ready(icache_stage1_io_rdata_ready),
    .io_rdata_valid(icache_stage1_io_rdata_valid),
    .io_rdata_bits_data(icache_stage1_io_rdata_bits_data),
    .io_rdata_bits_pc(icache_stage1_io_rdata_bits_pc)
  );
  assign io_cpu_addr_ready = icache_stage0_io_cpu_addr_ready; // @[icache.scala 411:35]
  assign io_cpu_rdata_valid = icache_stage1_io_rdata_valid; // @[icache.scala 445:22]
  assign io_cpu_rdata_bits_data = icache_stage1_io_rdata_bits_data; // @[icache.scala 445:22]
  assign io_cpu_rdata_bits_pc = icache_stage1_io_rdata_bits_pc; // @[icache.scala 445:22]
  assign io_sram_addr = icache_stage1_io_sram_w_valid ? icache_stage1_io_sram_w_sram_addr :
    icache_stage0_io_sram_sram_addr; // @[icache.scala 418:25]
  assign io_sram_wen_0 = ~is_sram0_write; // @[icache.scala 419:28]
  assign io_sram_wen_1 = ~is_sram1_write; // @[icache.scala 420:24]
  assign io_sram_tag_wdata = icache_stage1_io_sram_w_sram_tag; // @[icache.scala 423:25]
  assign io_sram_data_wdata = icache_stage1_io_sram_w_sram_data; // @[icache.scala 424:25]
  assign io_cache_bus_r_valid = icache_stage1_io_cache_bus_r_valid; // @[icache.scala 444:22]
  assign io_cache_bus_r_bits_raddr = icache_stage1_io_cache_bus_r_bits_raddr; // @[icache.scala 444:22]
  assign io_cache_bus_r_bits_rlen = icache_stage1_io_cache_bus_r_bits_rlen; // @[icache.scala 444:22]
  assign io_cache_bus_r_bits_rsize = icache_stage1_io_cache_bus_r_bits_rsize; // @[icache.scala 444:22]
  assign icache_stage0_clock = clock;
  assign icache_stage0_reset = reset;
  assign icache_stage0_io_flush = io_flush; // @[icache.scala 398:33]
  assign icache_stage0_io_cpu_addr_valid = io_cpu_addr_valid; // @[icache.scala 411:35]
  assign icache_stage0_io_cpu_addr_bits_addr = io_cpu_addr_bits_addr; // @[icache.scala 411:35]
  assign icache_stage0_io_sram_sram_data_0 = w_r_pass0_val ? icache_stage1_io_sram_w_sram_data : io_sram_rdata_0; // @[icache.scala 434:34]
  assign icache_stage0_io_sram_sram_data_1 = w_r_pass1_val ? icache_stage1_io_sram_w_sram_data : io_sram_rdata_2; // @[icache.scala 436:34]
  assign icache_stage0_io_sram_sram_tag_0 = w_r_pass0_val ? icache_stage1_io_sram_w_sram_tag : {{74'd0}, io_sram_rdata_1
    [53:0]}; // @[icache.scala 433:38]
  assign icache_stage0_io_sram_sram_tag_1 = w_r_pass1_val ? icache_stage1_io_sram_w_sram_tag : {{74'd0}, io_sram_rdata_3
    [53:0]}; // @[icache.scala 435:38]
  assign icache_stage0_io_sram_ready = reg_sram_r_ready; // @[icache.scala 442:49]
  assign icache_stage0_io_cache_stage1_ready = icache_stage1_io_cache_stage1_ready; // @[icache.scala 412:39]
  assign icache_stage1_clock = clock;
  assign icache_stage1_reset = reset;
  assign icache_stage1_io_flush = io_flush; // @[icache.scala 399:33]
  assign icache_stage1_io_fence_i = io_fence_i; // @[icache.scala 400:34]
  assign icache_stage1_io_cache_stage1_valid = icache_stage0_io_cache_stage1_valid; // @[icache.scala 412:39]
  assign icache_stage1_io_cache_stage1_bits_cpu_addr = icache_stage0_io_cache_stage1_bits_cpu_addr; // @[icache.scala 412:39]
  assign icache_stage1_io_cache_stage1_bits_is_mmio = icache_stage0_io_cache_stage1_bits_is_mmio; // @[icache.scala 412:39]
  assign icache_stage1_io_cache_stage1_bits_is_dram = icache_stage0_io_cache_stage1_bits_is_dram; // @[icache.scala 412:39]
  assign icache_stage1_io_cache_stage1_bits_sram_0_hit = icache_stage0_io_cache_stage1_bits_sram_0_hit; // @[icache.scala 412:39]
  assign icache_stage1_io_cache_stage1_bits_sram_0_rdata = icache_stage0_io_cache_stage1_bits_sram_0_rdata; // @[icache.scala 412:39]
  assign icache_stage1_io_cache_stage1_bits_sram_1_hit = icache_stage0_io_cache_stage1_bits_sram_1_hit; // @[icache.scala 412:39]
  assign icache_stage1_io_cache_stage1_bits_sram_1_rdata = icache_stage0_io_cache_stage1_bits_sram_1_rdata; // @[icache.scala 412:39]
  assign icache_stage1_io_cache_bus_r_bits_rdata = io_cache_bus_r_bits_rdata; // @[icache.scala 444:22]
  assign icache_stage1_io_cache_bus_r_bits_rlast = io_cache_bus_r_bits_rlast; // @[icache.scala 444:22]
  assign icache_stage1_io_cache_bus_r_ready = io_cache_bus_r_ready; // @[icache.scala 444:22]
  assign icache_stage1_io_rdata_ready = io_cpu_rdata_ready; // @[icache.scala 445:22]
  always @(posedge clock) begin
    if (reset) begin // @[icache.scala 426:42]
      reg_temp_r_index <= 6'h0; // @[icache.scala 426:42]
    end else begin
      reg_temp_r_index <= icache_stage0_io_sram_sram_addr; // @[icache.scala 427:41]
    end
    reg_sram_r_ready <= reset | _reg_sram_r_ready_T; // @[icache.scala 431:{39,39} 432:26]
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
  reg_temp_r_index = _RAND_0[5:0];
  _RAND_1 = {1{`RANDOM}};
  reg_sram_r_ready = _RAND_1[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_040318_DCache(
  input          clock,
  input          reset,
  output         io_dcache_cmd_ready,
  input          io_dcache_cmd_valid,
  input  [63:0]  io_dcache_cmd_bits_addr,
  input  [63:0]  io_dcache_cmd_bits_wdata,
  input  [7:0]   io_dcache_cmd_bits_wstrb,
  input          io_dcache_cmd_bits_is_w,
  input  [1:0]   io_dcache_cmd_bits_size,
  input          io_dcache_cmd_bits_is_fence,
  input          io_dcache_cmd_bits_is_mmio,
  output         io_dcahce_resp_valid,
  output [63:0]  io_dcahce_resp_bits_rdata,
  output [2:0]   io_dcahce_resp_bits_resp_info,
  output [5:0]   io_sram_addr,
  output         io_sram_wen_0,
  output         io_sram_wen_1,
  output [127:0] io_sram_data_wmask,
  output [127:0] io_sram_tag_wdata,
  output [127:0] io_sram_data_wdata,
  input  [127:0] io_sram_rdata_0,
  input  [127:0] io_sram_rdata_1,
  input  [127:0] io_sram_rdata_2,
  input  [127:0] io_sram_rdata_3,
  output         io_clint_valid,
  output [63:0]  io_clint_bits_addr,
  output [63:0]  io_clint_bits_wdata,
  input  [63:0]  io_clint_bits_rdata,
  output         io_clint_bits_is_w,
  input          io_clint_ready,
  input          io_cache_bus_w_ready,
  output         io_cache_bus_w_valid,
  output [63:0]  io_cache_bus_w_bits_waddr,
  output [63:0]  io_cache_bus_w_bits_wdata,
  output         io_cache_bus_w_bits_wlast,
  output [1:0]   io_cache_bus_w_bits_wlen,
  output [1:0]   io_cache_bus_w_bits_wsize,
  output [7:0]   io_cache_bus_w_bits_wstrb,
  output         io_cache_bus_b_ready,
  input          io_cache_bus_b_valid,
  output         io_cache_bus_r_valid,
  output [63:0]  io_cache_bus_r_bits_raddr,
  output [1:0]   io_cache_bus_r_bits_rlen,
  output [1:0]   io_cache_bus_r_bits_rsize,
  input  [63:0]  io_cache_bus_r_bits_rdata,
  input          io_cache_bus_r_bits_rlast,
  input          io_cache_bus_r_ready
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
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
  reg [63:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [127:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [63:0] _RAND_27;
  reg [63:0] _RAND_28;
  reg [63:0] _RAND_29;
  reg [63:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [63:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [63:0] _RAND_35;
  reg [63:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [127:0] _RAND_38;
  reg [127:0] _RAND_39;
  reg [63:0] _RAND_40;
  reg [31:0] _RAND_41;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] reg_bus_state; // @[dcache.scala 12:36]
  reg  reg_chosen_tag; // @[dcache.scala 14:42]
  reg [63:0] reg_rdata; // @[dcache.scala 15:42]
  reg  reg_valid; // @[dcache.scala 16:42]
  reg  reg_ready; // @[dcache.scala 17:42]
  reg [2:0] reg_resp_info; // @[dcache.scala 18:42]
  wire  cache_valid = io_dcache_cmd_valid & ~io_dcache_cmd_bits_is_mmio & ~io_dcache_cmd_bits_is_fence & reg_ready; // @[dcache.scala 22:112]
  wire  mmio_valid = io_dcache_cmd_valid & io_dcache_cmd_bits_is_mmio & reg_ready; // @[dcache.scala 23:76]
  wire  fence_valid = io_dcache_cmd_valid & io_dcache_cmd_bits_is_fence & reg_ready; // @[dcache.scala 24:77]
  wire  clint_valid = ~(io_dcache_cmd_bits_addr[30:0] < 31'h2000000 | io_dcache_cmd_bits_addr[30:0] > 31'h200ffff); // @[dcache.scala 25:27]
  reg [63:0] reg_r_raddr; // @[dcache.scala 27:34]
  reg  reg_r_valid; // @[dcache.scala 28:34]
  reg [1:0] reg_r_len; // @[dcache.scala 29:34]
  reg [1:0] reg_r_size; // @[dcache.scala 30:34]
  reg  reg_w_valid; // @[dcache.scala 32:34]
  reg [63:0] reg_w_waddr; // @[dcache.scala 33:34]
  reg [63:0] reg_w_wdata; // @[dcache.scala 34:34]
  reg  reg_w_wlast; // @[dcache.scala 35:34]
  reg [1:0] reg_w_len; // @[dcache.scala 36:34]
  reg [1:0] reg_w_size; // @[dcache.scala 37:34]
  reg [7:0] reg_w_strb; // @[dcache.scala 38:34]
  reg [1:0] reg_cnt; // @[dcache.scala 39:34]
  reg [6:0] reg_fence_cnt; // @[dcache.scala 40:36]
  reg  reg_wbus_finish; // @[dcache.scala 41:38]
  reg  reg_rbus_finish; // @[dcache.scala 42:38]
  reg [63:0] reg_cpu_addr; // @[dcache.scala 45:42]
  wire [53:0] reg_tag = reg_cpu_addr[63:10]; // @[dcache.scala 46:47]
  wire [3:0] reg_offset = reg_cpu_addr[3:0]; // @[dcache.scala 48:47]
  reg  reg_is_w; // @[dcache.scala 49:42]
  reg [5:0] reg_index; // @[dcache.scala 50:42]
  reg [127:0] reg_cache_wdata; // @[dcache.scala 52:38]
  reg  reg_cache_write; // @[dcache.scala 53:42]
  reg [15:0] reg_cache_wstrb; // @[dcache.scala 54:38]
  wire [7:0] _cache_mask_T_17 = reg_cache_wstrb[0] ? 8'hff : 8'h0; // @[Bitwise.scala 77:12]
  wire [7:0] _cache_mask_T_19 = reg_cache_wstrb[1] ? 8'hff : 8'h0; // @[Bitwise.scala 77:12]
  wire [7:0] _cache_mask_T_21 = reg_cache_wstrb[2] ? 8'hff : 8'h0; // @[Bitwise.scala 77:12]
  wire [7:0] _cache_mask_T_23 = reg_cache_wstrb[3] ? 8'hff : 8'h0; // @[Bitwise.scala 77:12]
  wire [7:0] _cache_mask_T_25 = reg_cache_wstrb[4] ? 8'hff : 8'h0; // @[Bitwise.scala 77:12]
  wire [7:0] _cache_mask_T_27 = reg_cache_wstrb[5] ? 8'hff : 8'h0; // @[Bitwise.scala 77:12]
  wire [7:0] _cache_mask_T_29 = reg_cache_wstrb[6] ? 8'hff : 8'h0; // @[Bitwise.scala 77:12]
  wire [7:0] _cache_mask_T_31 = reg_cache_wstrb[7] ? 8'hff : 8'h0; // @[Bitwise.scala 77:12]
  wire [7:0] _cache_mask_T_33 = reg_cache_wstrb[8] ? 8'hff : 8'h0; // @[Bitwise.scala 77:12]
  wire [7:0] _cache_mask_T_35 = reg_cache_wstrb[9] ? 8'hff : 8'h0; // @[Bitwise.scala 77:12]
  wire [7:0] _cache_mask_T_37 = reg_cache_wstrb[10] ? 8'hff : 8'h0; // @[Bitwise.scala 77:12]
  wire [7:0] _cache_mask_T_39 = reg_cache_wstrb[11] ? 8'hff : 8'h0; // @[Bitwise.scala 77:12]
  wire [7:0] _cache_mask_T_41 = reg_cache_wstrb[12] ? 8'hff : 8'h0; // @[Bitwise.scala 77:12]
  wire [7:0] _cache_mask_T_43 = reg_cache_wstrb[13] ? 8'hff : 8'h0; // @[Bitwise.scala 77:12]
  wire [7:0] _cache_mask_T_45 = reg_cache_wstrb[14] ? 8'hff : 8'h0; // @[Bitwise.scala 77:12]
  wire [7:0] _cache_mask_T_47 = reg_cache_wstrb[15] ? 8'hff : 8'h0; // @[Bitwise.scala 77:12]
  wire [63:0] cache_mask_lo = {_cache_mask_T_31,_cache_mask_T_29,_cache_mask_T_27,_cache_mask_T_25,_cache_mask_T_23,
    _cache_mask_T_21,_cache_mask_T_19,_cache_mask_T_17}; // @[Cat.scala 33:92]
  wire [127:0] cache_mask = {_cache_mask_T_47,_cache_mask_T_45,_cache_mask_T_43,_cache_mask_T_41,_cache_mask_T_39,
    _cache_mask_T_37,_cache_mask_T_35,_cache_mask_T_33,cache_mask_lo}; // @[Cat.scala 33:92]
  wire  is_sram0_write = reg_cache_write & ~reg_chosen_tag; // @[dcache.scala 58:59]
  wire  is_sram1_write = reg_cache_write & reg_chosen_tag; // @[dcache.scala 59:59]
  wire [5:0] index = io_dcache_cmd_bits_addr[9:4]; // @[dcache.scala 62:50]
  wire [127:0] _io_sram_data_wmask_T = ~cache_mask; // @[dcache.scala 67:28]
  wire [53:0] tag_0 = io_sram_rdata_1[53:0]; // @[dcache.scala 71:40]
  wire [53:0] tag_1 = io_sram_rdata_3[53:0]; // @[dcache.scala 72:40]
  wire [63:0] rdata0 = reg_cpu_addr[3] ? io_sram_rdata_0[127:64] : io_sram_rdata_0[63:0]; // @[dcache.scala 76:38]
  wire [63:0] rdata1 = reg_cpu_addr[3] ? io_sram_rdata_2[127:64] : io_sram_rdata_2[63:0]; // @[dcache.scala 77:38]
  reg [63:0] reg_sram0_valid; // @[dcache.scala 79:42]
  reg [63:0] reg_sram1_valid; // @[dcache.scala 80:42]
  reg [63:0] reg_sram0_dirty; // @[dcache.scala 81:42]
  reg [63:0] reg_sram1_dirty; // @[dcache.scala 82:42]
  wire [63:0] reg_chose_bit = 64'h1 << reg_index; // @[dcache.scala 84:33]
  wire [63:0] reg_neg_chose_bit = ~reg_chose_bit; // @[dcache.scala 85:33]
  reg  flush_cache; // @[dcache.scala 87:42]
  wire [63:0] _reg_sram0_valid_T = reg_sram0_valid | reg_chose_bit; // @[dcache.scala 92:52]
  wire [63:0] _reg_sram0_dirty_T = reg_sram0_dirty | reg_chose_bit; // @[dcache.scala 93:65]
  wire [63:0] _reg_sram0_dirty_T_1 = reg_sram0_dirty & reg_neg_chose_bit; // @[dcache.scala 93:98]
  wire [63:0] _reg_sram1_valid_T = reg_sram1_valid | reg_chose_bit; // @[dcache.scala 102:60]
  wire [63:0] _reg_sram1_dirty_T = reg_sram1_dirty | reg_chose_bit; // @[dcache.scala 103:73]
  wire [63:0] _reg_sram1_dirty_T_1 = reg_sram1_dirty & reg_neg_chose_bit; // @[dcache.scala 103:106]
  wire [63:0] _tag_valid_0_T = reg_sram0_valid >> reg_index; // @[dcache.scala 114:51]
  wire  tag_valid_0 = _tag_valid_0_T[0]; // @[dcache.scala 114:51]
  wire [63:0] _tag_valid_1_T = reg_sram1_valid >> reg_index; // @[dcache.scala 115:51]
  wire  tag_valid_1 = _tag_valid_1_T[0]; // @[dcache.scala 115:51]
  wire [63:0] _tag_dirty_0_T = reg_sram0_dirty >> reg_index; // @[dcache.scala 116:51]
  wire  tag_dirty_0 = _tag_dirty_0_T[0]; // @[dcache.scala 116:51]
  wire [63:0] _tag_dirty_1_T = reg_sram1_dirty >> reg_index; // @[dcache.scala 117:51]
  wire  tag_dirty_1 = _tag_dirty_1_T[0]; // @[dcache.scala 117:51]
  wire  hit_0 = tag_valid_0 & reg_tag == tag_0; // @[dcache.scala 119:39]
  wire  hit_1 = tag_valid_1 & reg_tag == tag_1; // @[dcache.scala 120:39]
  wire [63:0] _LRU_1_T = 64'h0 >> reg_index; // @[dcache.scala 126:36]
  wire  LRU_1 = _LRU_1_T[0]; // @[dcache.scala 126:36]
  wire  _T_2 = tag_valid_0 & tag_valid_1; // @[dcache.scala 141:42]
  wire  hit_0_and_valid_0 = hit_0 & tag_valid_0; // @[dcache.scala 151:40]
  wire  hit_1_and_valid_1 = hit_1 & tag_valid_1; // @[dcache.scala 152:40]
  wire  hit_valid = hit_0_and_valid_0 | hit_1_and_valid_1; // @[dcache.scala 153:43]
  wire  is_hit = hit_0 | hit_1; // @[dcache.scala 154:28]
  reg [63:0] reg_wdata; // @[dcache.scala 156:34]
  reg [7:0] reg_wstrb; // @[dcache.scala 157:34]
  reg  reg_clint_valid; // @[dcache.scala 159:38]
  reg [63:0] reg_clint_addr; // @[dcache.scala 160:38]
  reg [63:0] reg_clint_wdata; // @[dcache.scala 161:38]
  reg  reg_clint_is_w; // @[dcache.scala 162:38]
  reg [127:0] reg_fence_data0; // @[dcache.scala 164:42]
  reg [127:0] reg_fence_data1; // @[dcache.scala 166:42]
  reg [63:0] reg_fence_addr1; // @[dcache.scala 168:38]
  wire [63:0] fence_addr0 = {tag_0,reg_index,4'h0}; // @[Cat.scala 33:92]
  wire [63:0] fence_addr1 = {tag_1,reg_index,4'h0}; // @[Cat.scala 33:92]
  reg  need_two; // @[dcache.scala 173:42]
  wire [127:0] _cache_wdata_T_1 = {reg_wdata,64'h0}; // @[Cat.scala 33:92]
  wire [127:0] _cache_wdata_T_2 = {64'h0,reg_wdata}; // @[Cat.scala 33:92]
  wire [127:0] cache_wdata = reg_offset[3] ? _cache_wdata_T_1 : _cache_wdata_T_2; // @[dcache.scala 175:38]
  wire [15:0] _cache_wstrb_T_1 = {reg_wstrb,8'h0}; // @[Cat.scala 33:92]
  wire [15:0] _cache_wstrb_T_2 = {8'h0,reg_wstrb}; // @[Cat.scala 33:92]
  wire [63:0] _GEN_17 = io_dcache_cmd_bits_is_w ? io_dcache_cmd_bits_addr : reg_w_waddr; // @[dcache.scala 210:70 212:81 33:34]
  wire [63:0] _GEN_18 = io_dcache_cmd_bits_is_w ? io_dcache_cmd_bits_wdata : reg_w_wdata; // @[dcache.scala 210:70 213:81 34:34]
  wire  _GEN_19 = io_dcache_cmd_bits_is_w | reg_w_wlast; // @[dcache.scala 210:70 214:81 35:34]
  wire [1:0] _GEN_20 = io_dcache_cmd_bits_is_w ? 2'h0 : reg_w_len; // @[dcache.scala 210:70 215:81 36:34]
  wire [1:0] _GEN_21 = io_dcache_cmd_bits_is_w ? io_dcache_cmd_bits_size : reg_w_size; // @[dcache.scala 210:70 216:81 37:34]
  wire [7:0] _GEN_22 = io_dcache_cmd_bits_is_w ? io_dcache_cmd_bits_wstrb : reg_w_strb; // @[dcache.scala 210:70 217:81 38:34]
  wire  _GEN_23 = io_dcache_cmd_bits_is_w ? 1'h0 : reg_wbus_finish; // @[dcache.scala 210:70 218:65 41:38]
  wire [63:0] _GEN_24 = io_dcache_cmd_bits_is_w ? reg_r_raddr : io_dcache_cmd_bits_addr; // @[dcache.scala 210:70 27:34 220:81]
  wire  _GEN_25 = io_dcache_cmd_bits_is_w ? 1'h0 : 1'h1; // @[dcache.scala 192:49 210:70 221:81]
  wire [1:0] _GEN_26 = io_dcache_cmd_bits_is_w ? reg_r_len : 2'h0; // @[dcache.scala 210:70 29:34 222:81]
  wire [1:0] _GEN_27 = io_dcache_cmd_bits_is_w ? reg_r_size : io_dcache_cmd_bits_size; // @[dcache.scala 210:70 30:34 223:81]
  wire  _GEN_28 = io_dcache_cmd_bits_is_w & reg_rbus_finish; // @[dcache.scala 210:70 42:38 224:73]
  wire [63:0] _GEN_29 = clint_valid ? io_dcache_cmd_bits_addr : reg_clint_addr; // @[dcache.scala 160:38 205:50 206:57]
  wire [63:0] _GEN_30 = clint_valid ? io_dcache_cmd_bits_wdata : reg_clint_wdata; // @[dcache.scala 161:38 205:50 207:57]
  wire  _GEN_31 = clint_valid ? io_dcache_cmd_bits_is_w : reg_clint_is_w; // @[dcache.scala 162:38 205:50 208:57]
  wire  _GEN_32 = clint_valid ? 1'h0 : io_dcache_cmd_bits_is_w; // @[dcache.scala 191:49 205:50]
  wire [63:0] _GEN_33 = clint_valid ? reg_w_waddr : _GEN_17; // @[dcache.scala 205:50 33:34]
  wire [63:0] _GEN_34 = clint_valid ? reg_w_wdata : _GEN_18; // @[dcache.scala 205:50 34:34]
  wire  _GEN_35 = clint_valid ? reg_w_wlast : _GEN_19; // @[dcache.scala 205:50 35:34]
  wire [1:0] _GEN_36 = clint_valid ? reg_w_len : _GEN_20; // @[dcache.scala 205:50 36:34]
  wire [1:0] _GEN_37 = clint_valid ? reg_w_size : _GEN_21; // @[dcache.scala 205:50 37:34]
  wire [7:0] _GEN_38 = clint_valid ? reg_w_strb : _GEN_22; // @[dcache.scala 205:50 38:34]
  wire  _GEN_39 = clint_valid ? reg_wbus_finish : _GEN_23; // @[dcache.scala 205:50 41:38]
  wire [63:0] _GEN_40 = clint_valid ? reg_r_raddr : _GEN_24; // @[dcache.scala 205:50 27:34]
  wire  _GEN_41 = clint_valid ? 1'h0 : _GEN_25; // @[dcache.scala 192:49 205:50]
  wire [1:0] _GEN_42 = clint_valid ? reg_r_len : _GEN_26; // @[dcache.scala 205:50 29:34]
  wire [1:0] _GEN_43 = clint_valid ? reg_r_size : _GEN_27; // @[dcache.scala 205:50 30:34]
  wire  _GEN_44 = clint_valid ? reg_rbus_finish : _GEN_28; // @[dcache.scala 205:50 42:38]
  wire [2:0] _GEN_45 = fence_valid ? 3'h4 : 3'h0; // @[dcache.scala 227:48 228:49 232:49]
  wire  _GEN_46 = fence_valid ? 1'h0 : 1'h1; // @[dcache.scala 227:48 181:49 229:57]
  wire [5:0] _GEN_47 = fence_valid ? 6'h0 : index; // @[dcache.scala 227:48 193:49 230:57]
  wire  _GEN_49 = mmio_valid ? 1'h0 : _GEN_46; // @[dcache.scala 200:47 202:57]
  wire  _GEN_55 = mmio_valid & _GEN_32; // @[dcache.scala 200:47 191:49]
  wire  _GEN_62 = mmio_valid ? _GEN_39 : reg_wbus_finish; // @[dcache.scala 200:47 41:38]
  wire  _GEN_64 = mmio_valid & _GEN_41; // @[dcache.scala 200:47 192:49]
  wire  _GEN_67 = mmio_valid ? _GEN_44 : reg_rbus_finish; // @[dcache.scala 200:47 42:38]
  wire  _GEN_70 = cache_valid ? 1'h0 : _GEN_49; // @[dcache.scala 195:42 197:57]
  wire  _GEN_72 = cache_valid & io_dcache_cmd_bits_is_w; // @[dcache.scala 195:42 180:49 199:57]
  wire  _GEN_84 = cache_valid ? reg_wbus_finish : _GEN_62; // @[dcache.scala 195:42 41:38]
  wire  _GEN_89 = cache_valid ? reg_rbus_finish : _GEN_67; // @[dcache.scala 195:42 42:38]
  wire [127:0] _reg_temp_h_rdata01_T_2 = {io_sram_rdata_2[127:64],io_sram_rdata_0[127:64]}; // @[Cat.scala 33:92]
  wire  _reg_chosen_tag_T = hit_0 ? 1'h0 : 1'h1; // @[dcache.scala 241:55]
  wire [63:0] _reg_rdata_T = hit_0 ? rdata0 : rdata1; // @[dcache.scala 256:87]
  wire  _GEN_91 = reg_is_w | reg_cache_write; // @[dcache.scala 244:55 246:73 53:42]
  wire [127:0] _GEN_92 = reg_is_w ? cache_wdata : reg_cache_wdata; // @[dcache.scala 244:55 247:73 52:38]
  wire [1:0] _GEN_95 = reg_is_w ? 2'h2 : 2'h0; // @[dcache.scala 244:55 252:73 259:73]
  wire [63:0] _GEN_96 = reg_is_w ? reg_rdata : _reg_rdata_T; // @[dcache.scala 15:42 244:55 256:81]
  wire [63:0] _reg_r_raddr_T_1 = {reg_cpu_addr[63:4],4'h0}; // @[Cat.scala 33:92]
  wire  _GEN_97 = hit_valid ? _GEN_91 : reg_cache_write; // @[dcache.scala 243:48 53:42]
  wire [127:0] _GEN_98 = hit_valid ? _GEN_92 : reg_cache_wdata; // @[dcache.scala 243:48 52:38]
  wire [2:0] _GEN_99 = hit_valid ? 3'h0 : 3'h2; // @[dcache.scala 243:48 272:57]
  wire [2:0] _GEN_101 = hit_valid ? {{1'd0}, _GEN_95} : reg_resp_info; // @[dcache.scala 18:42 243:48]
  wire [63:0] _GEN_102 = hit_valid ? _GEN_96 : reg_rdata; // @[dcache.scala 15:42 243:48]
  wire  _GEN_103 = hit_valid & reg_rbus_finish; // @[dcache.scala 243:48 42:38 267:57]
  wire [63:0] _GEN_104 = hit_valid ? reg_r_raddr : _reg_r_raddr_T_1; // @[dcache.scala 243:48 27:34 268:65]
  wire  _GEN_105 = hit_valid ? reg_r_valid : 1'h1; // @[dcache.scala 243:48 28:34 269:65]
  wire [1:0] _GEN_106 = hit_valid ? reg_r_len : 2'h1; // @[dcache.scala 243:48 29:34 270:65]
  wire [1:0] _GEN_107 = hit_valid ? reg_r_size : 2'h3; // @[dcache.scala 243:48 30:34 271:65]
  wire [53:0] _reg_w_waddr_T = LRU_1 ? tag_1 : tag_0; // @[dcache.scala 289:79]
  wire [63:0] _reg_w_waddr_T_2 = {_reg_w_waddr_T,reg_index,4'h0}; // @[Cat.scala 33:92]
  wire [63:0] _reg_w_wdata_T_2 = LRU_1 ? io_sram_rdata_2[63:0] : io_sram_rdata_0[63:0]; // @[dcache.scala 290:71]
  wire  _GEN_108 = tag_dirty_0 & ~LRU_1 | tag_dirty_1 & LRU_1 | reg_w_valid; // @[dcache.scala 287:93 288:65 32:34]
  wire [63:0] _GEN_109 = tag_dirty_0 & ~LRU_1 | tag_dirty_1 & LRU_1 ? _reg_w_waddr_T_2 : reg_w_waddr; // @[dcache.scala 287:93 289:65 33:34]
  wire [63:0] _GEN_110 = tag_dirty_0 & ~LRU_1 | tag_dirty_1 & LRU_1 ? _reg_w_wdata_T_2 : reg_w_wdata; // @[dcache.scala 287:93 290:65 34:34]
  wire  _GEN_111 = tag_dirty_0 & ~LRU_1 | tag_dirty_1 & LRU_1 ? 1'h0 : reg_w_wlast; // @[dcache.scala 287:93 291:65 35:34]
  wire [1:0] _GEN_112 = tag_dirty_0 & ~LRU_1 | tag_dirty_1 & LRU_1 ? 2'h1 : reg_w_len; // @[dcache.scala 287:93 292:73 36:34]
  wire [1:0] _GEN_113 = tag_dirty_0 & ~LRU_1 | tag_dirty_1 & LRU_1 ? 2'h3 : reg_w_size; // @[dcache.scala 287:93 293:73 37:34]
  wire [7:0] _GEN_114 = tag_dirty_0 & ~LRU_1 | tag_dirty_1 & LRU_1 ? 8'hff : reg_w_strb; // @[dcache.scala 287:93 294:73 38:34]
  wire  _GEN_115 = tag_dirty_0 & ~LRU_1 | tag_dirty_1 & LRU_1 ? 1'h0 : reg_wbus_finish; // @[dcache.scala 287:93 296:65 41:38]
  wire [1:0] _GEN_116 = tag_dirty_0 & ~LRU_1 | tag_dirty_1 & LRU_1 ? 2'h1 : reg_cnt; // @[dcache.scala 287:93 297:73 39:34]
  wire  _GEN_117 = _T_2 ? LRU_1 : tag_valid_0; // @[dcache.scala 277:64 278:65 300:65]
  wire [63:0] _GEN_118 = _T_2 ? _reg_r_raddr_T_1 : _reg_r_raddr_T_1; // @[dcache.scala 277:64 279:65 302:73]
  wire  _GEN_123 = _T_2 ? _GEN_108 : reg_w_valid; // @[dcache.scala 277:64 32:34]
  wire [63:0] _GEN_124 = _T_2 ? _GEN_109 : reg_w_waddr; // @[dcache.scala 277:64 33:34]
  wire [63:0] _GEN_125 = _T_2 ? _GEN_110 : reg_w_wdata; // @[dcache.scala 277:64 34:34]
  wire  _GEN_126 = _T_2 ? _GEN_111 : reg_w_wlast; // @[dcache.scala 277:64 35:34]
  wire [1:0] _GEN_127 = _T_2 ? _GEN_112 : reg_w_len; // @[dcache.scala 277:64 36:34]
  wire [1:0] _GEN_128 = _T_2 ? _GEN_113 : reg_w_size; // @[dcache.scala 277:64 37:34]
  wire [7:0] _GEN_129 = _T_2 ? _GEN_114 : reg_w_strb; // @[dcache.scala 277:64 38:34]
  wire  _GEN_130 = _T_2 ? _GEN_115 : reg_wbus_finish; // @[dcache.scala 277:64 41:38]
  wire [1:0] _GEN_131 = _T_2 ? _GEN_116 : reg_cnt; // @[dcache.scala 277:64 39:34]
  wire  _GEN_136 = is_hit & hit_valid; // @[dcache.scala 238:37 275:65]
  wire  _GEN_139 = is_hit & _GEN_103; // @[dcache.scala 238:37]
  wire  _GEN_151 = is_hit ? reg_wbus_finish : _GEN_130; // @[dcache.scala 238:37 41:38]
  wire  _T_11 = io_cache_bus_r_valid & io_cache_bus_r_ready; // @[simplebus.scala 33:40]
  wire [127:0] _reg_cache_wdata_T = cache_wdata & cache_mask; // @[dcache.scala 319:85]
  wire [127:0] _reg_cache_wdata_T_2 = {io_cache_bus_r_bits_rdata,reg_cache_wdata[63:0]}; // @[Cat.scala 33:92]
  wire [127:0] _reg_cache_wdata_T_4 = _reg_cache_wdata_T_2 & _io_sram_data_wmask_T; // @[dcache.scala 319:155]
  wire [127:0] _reg_cache_wdata_T_5 = _reg_cache_wdata_T | _reg_cache_wdata_T_4; // @[dcache.scala 319:99]
  wire [63:0] _reg_rdata_T_3 = reg_offset[3] ? io_cache_bus_r_bits_rdata : reg_cache_wdata[63:0]; // @[dcache.scala 322:87]
  wire [127:0] _GEN_153 = reg_is_w ? _reg_cache_wdata_T_5 : _reg_cache_wdata_T_2; // @[dcache.scala 318:55 319:69 323:73]
  wire [63:0] _GEN_154 = reg_is_w ? reg_rdata : _reg_rdata_T_3; // @[dcache.scala 15:42 318:55 322:81]
  wire  _GEN_155 = io_cache_bus_r_bits_rlast ? 1'h0 : reg_r_valid; // @[dcache.scala 28:34 313:64 314:65]
  wire [15:0] _GEN_156 = io_cache_bus_r_bits_rlast ? 16'hffff : reg_cache_wstrb; // @[dcache.scala 313:64 316:57 54:38]
  wire  _GEN_157 = io_cache_bus_r_bits_rlast | reg_rbus_finish; // @[dcache.scala 313:64 317:57 42:38]
  wire [127:0] _GEN_158 = io_cache_bus_r_bits_rlast ? _GEN_153 : {{64'd0}, io_cache_bus_r_bits_rdata}; // @[dcache.scala 313:64 326:73]
  wire [63:0] _GEN_159 = io_cache_bus_r_bits_rlast ? _GEN_154 : reg_rdata; // @[dcache.scala 15:42 313:64]
  wire  _GEN_160 = _T_11 ? _GEN_155 : reg_r_valid; // @[dcache.scala 28:34 312:50]
  wire [15:0] _GEN_161 = _T_11 ? _GEN_156 : reg_cache_wstrb; // @[dcache.scala 312:50 54:38]
  wire  _GEN_162 = _T_11 ? _GEN_157 : reg_rbus_finish; // @[dcache.scala 312:50 42:38]
  wire [127:0] _GEN_163 = _T_11 ? _GEN_158 : reg_cache_wdata; // @[dcache.scala 312:50 52:38]
  wire [63:0] _GEN_164 = _T_11 ? _GEN_159 : reg_rdata; // @[dcache.scala 15:42 312:50]
  wire  _T_12 = io_cache_bus_w_ready & io_cache_bus_w_valid; // @[Decoupled.scala 52:35]
  wire  _T_13 = reg_cnt == 2'h0; // @[dcache.scala 331:46]
  wire  _T_14 = reg_cnt == 2'h1; // @[dcache.scala 334:52]
  wire [1:0] _reg_cnt_T_1 = reg_cnt - 2'h1; // @[dcache.scala 335:76]
  wire [63:0] _reg_w_wdata_T_6 = reg_chosen_tag ? reg_fence_data0[127:64] : reg_fence_data0[63:0]; // @[dcache.scala 337:71]
  wire [1:0] _GEN_165 = reg_cnt == 2'h1 ? _reg_cnt_T_1 : reg_cnt; // @[dcache.scala 334:60 335:65 39:34]
  wire  _GEN_166 = reg_cnt == 2'h1 | reg_w_wlast; // @[dcache.scala 334:60 336:65 35:34]
  wire [63:0] _GEN_167 = reg_cnt == 2'h1 ? _reg_w_wdata_T_6 : reg_w_wdata; // @[dcache.scala 334:60 337:65 34:34]
  wire  _GEN_168 = reg_cnt == 2'h0 ? 1'h0 : _GEN_166; // @[dcache.scala 331:54 332:65]
  wire  _GEN_169 = reg_cnt == 2'h0 ? 1'h0 : reg_w_valid; // @[dcache.scala 32:34 331:54 333:65]
  wire [1:0] _GEN_170 = reg_cnt == 2'h0 ? reg_cnt : _GEN_165; // @[dcache.scala 331:54 39:34]
  wire [63:0] _GEN_171 = reg_cnt == 2'h0 ? reg_w_wdata : _GEN_167; // @[dcache.scala 331:54 34:34]
  wire  _GEN_172 = _T_12 ? _GEN_168 : reg_w_wlast; // @[dcache.scala 330:50 35:34]
  wire  _GEN_173 = _T_12 ? _GEN_169 : reg_w_valid; // @[dcache.scala 32:34 330:50]
  wire [1:0] _GEN_174 = _T_12 ? _GEN_170 : reg_cnt; // @[dcache.scala 330:50 39:34]
  wire [63:0] _GEN_175 = _T_12 ? _GEN_171 : reg_w_wdata; // @[dcache.scala 330:50 34:34]
  wire  _T_15 = io_cache_bus_b_ready & io_cache_bus_b_valid; // @[Decoupled.scala 52:35]
  wire  _GEN_176 = _T_15 | reg_wbus_finish; // @[dcache.scala 341:50 342:49 41:38]
  wire  _T_19 = _GEN_157 & _GEN_176; // @[dcache.scala 344:75]
  wire  _GEN_177 = _GEN_157 & _GEN_176 | reg_cache_write; // @[dcache.scala 344:119 345:57 53:42]
  wire [2:0] _GEN_178 = _GEN_157 & _GEN_176 ? 3'h0 : reg_bus_state; // @[dcache.scala 344:119 12:36 346:57]
  wire  _GEN_179 = _GEN_157 & _GEN_176 | reg_ready; // @[dcache.scala 344:119 17:42 347:65]
  wire  _GEN_180 = _GEN_157 & _GEN_176 | reg_valid; // @[dcache.scala 344:119 16:42 348:65]
  wire [2:0] _GEN_181 = _GEN_157 & _GEN_176 ? {{1'd0}, _GEN_95} : reg_resp_info; // @[dcache.scala 344:119 18:42 349:57]
  wire [1:0] _reg_resp_info_T_1 = reg_clint_is_w ? 2'h2 : 2'h0; // @[dcache.scala 359:71]
  wire [63:0] _GEN_182 = io_clint_ready ? io_clint_bits_rdata : reg_rdata; // @[dcache.scala 15:42 354:53 355:57]
  wire [2:0] _GEN_183 = io_clint_ready ? 3'h0 : reg_bus_state; // @[dcache.scala 12:36 354:53 356:57]
  wire  _GEN_184 = io_clint_ready | reg_ready; // @[dcache.scala 17:42 354:53 357:65]
  wire  _GEN_185 = io_clint_ready | reg_valid; // @[dcache.scala 16:42 354:53 358:65]
  wire [2:0] _GEN_186 = io_clint_ready ? {{1'd0}, _reg_resp_info_T_1} : reg_resp_info; // @[dcache.scala 18:42 354:53 359:65]
  wire  _GEN_187 = io_clint_ready ? 1'h0 : reg_clint_valid; // @[dcache.scala 159:38 354:53 361:57]
  wire  _GEN_188 = io_clint_ready ? 1'h0 : reg_clint_is_w; // @[dcache.scala 162:38 354:53 362:57]
  wire  _GEN_189 = _T_12 ? 1'h0 : reg_w_valid; // @[dcache.scala 32:34 365:58 366:65]
  wire  _GEN_190 = _T_12 ? 1'h0 : reg_w_wlast; // @[dcache.scala 35:34 365:58 367:65]
  wire [63:0] _GEN_191 = _T_11 ? io_cache_bus_r_bits_rdata : reg_rdata; // @[dcache.scala 15:42 369:58 370:65]
  wire  _GEN_192 = _T_11 ? 1'h0 : reg_r_valid; // @[dcache.scala 28:34 369:58 371:57]
  wire [1:0] _reg_resp_info_T_2 = reg_w_valid ? 2'h2 : 2'h0; // @[dcache.scala 377:63]
  wire [2:0] _GEN_196 = _T_19 ? {{1'd0}, _reg_resp_info_T_2} : reg_resp_info; // @[dcache.scala 373:127 18:42 377:57]
  wire  _GEN_197 = _T_19 | reg_rbus_finish; // @[dcache.scala 373:127 379:57 42:38]
  wire  _GEN_198 = _T_19 | reg_wbus_finish; // @[dcache.scala 373:127 380:57 41:38]
  wire [63:0] _GEN_199 = reg_clint_valid ? _GEN_182 : _GEN_191; // @[dcache.scala 353:46]
  wire [2:0] _GEN_200 = reg_clint_valid ? _GEN_183 : _GEN_178; // @[dcache.scala 353:46]
  wire  _GEN_201 = reg_clint_valid ? _GEN_184 : _GEN_179; // @[dcache.scala 353:46]
  wire  _GEN_202 = reg_clint_valid ? _GEN_185 : _GEN_180; // @[dcache.scala 353:46]
  wire [2:0] _GEN_203 = reg_clint_valid ? _GEN_186 : _GEN_196; // @[dcache.scala 353:46]
  wire  _GEN_204 = reg_clint_valid ? _GEN_187 : reg_clint_valid; // @[dcache.scala 159:38 353:46]
  wire  _GEN_205 = reg_clint_valid ? _GEN_188 : reg_clint_is_w; // @[dcache.scala 162:38 353:46]
  wire  _GEN_206 = reg_clint_valid ? reg_w_valid : _GEN_189; // @[dcache.scala 32:34 353:46]
  wire  _GEN_207 = reg_clint_valid ? reg_w_wlast : _GEN_190; // @[dcache.scala 35:34 353:46]
  wire  _GEN_208 = reg_clint_valid ? reg_r_valid : _GEN_192; // @[dcache.scala 28:34 353:46]
  wire  _GEN_209 = reg_clint_valid ? reg_rbus_finish : _GEN_197; // @[dcache.scala 353:46 42:38]
  wire  _GEN_210 = reg_clint_valid ? reg_wbus_finish : _GEN_198; // @[dcache.scala 353:46 41:38]
  wire [6:0] _reg_fence_cnt_T_1 = reg_fence_cnt + 7'h1; // @[dcache.scala 390:64]
  wire [5:0] _reg_index_T_2 = reg_index + 6'h1; // @[dcache.scala 391:56]
  wire [127:0] _reg_fence_data1_T = tag_dirty_0 ? io_sram_rdata_0 : io_sram_rdata_2; // @[dcache.scala 410:63]
  wire [63:0] _reg_fence_addr1_T = tag_dirty_0 ? fence_addr0 : fence_addr1; // @[dcache.scala 411:63]
  wire [63:0] _reg_w_wdata_T_10 = tag_dirty_0 ? io_sram_rdata_0[63:0] : io_sram_rdata_2[63:0]; // @[dcache.scala 415:71]
  wire [127:0] _GEN_211 = tag_dirty_0 | tag_dirty_1 ? _reg_fence_data1_T : reg_fence_data1; // @[dcache.scala 166:42 409:70 410:57]
  wire [63:0] _GEN_212 = tag_dirty_0 | tag_dirty_1 ? _reg_fence_addr1_T : reg_fence_addr1; // @[dcache.scala 168:38 409:70 411:57]
  wire  _GEN_213 = tag_dirty_0 | tag_dirty_1 | reg_w_valid; // @[dcache.scala 32:34 409:70 413:57]
  wire [63:0] _GEN_214 = tag_dirty_0 | tag_dirty_1 ? _reg_fence_addr1_T : reg_w_waddr; // @[dcache.scala 33:34 409:70 414:57]
  wire [63:0] _GEN_215 = tag_dirty_0 | tag_dirty_1 ? _reg_w_wdata_T_10 : reg_w_wdata; // @[dcache.scala 34:34 409:70 415:65]
  wire  _GEN_216 = tag_dirty_0 | tag_dirty_1 ? 1'h0 : reg_w_wlast; // @[dcache.scala 35:34 409:70 416:65]
  wire [1:0] _GEN_217 = tag_dirty_0 | tag_dirty_1 ? 2'h1 : reg_w_len; // @[dcache.scala 36:34 409:70 417:65]
  wire [1:0] _GEN_218 = tag_dirty_0 | tag_dirty_1 ? 2'h3 : reg_w_size; // @[dcache.scala 37:34 409:70 418:65]
  wire [7:0] _GEN_219 = tag_dirty_0 | tag_dirty_1 ? 8'hff : reg_w_strb; // @[dcache.scala 38:34 409:70 419:65]
  wire [1:0] _GEN_220 = tag_dirty_0 | tag_dirty_1 ? 2'h1 : reg_cnt; // @[dcache.scala 39:34 409:70 421:65]
  wire  _GEN_221 = tag_dirty_0 | tag_dirty_1 ? 1'h0 : need_two; // @[dcache.scala 173:42 409:70 422:65]
  wire [2:0] _GEN_222 = tag_dirty_0 | tag_dirty_1 ? 3'h6 : 3'h4; // @[dcache.scala 409:70 423:57 425:57]
  wire [127:0] _GEN_223 = tag_dirty_0 & tag_dirty_1 ? io_sram_rdata_0 : reg_fence_data0; // @[dcache.scala 164:42 392:64 393:57]
  wire [127:0] _GEN_224 = tag_dirty_0 & tag_dirty_1 ? io_sram_rdata_2 : _GEN_211; // @[dcache.scala 392:64 394:57]
  wire [63:0] _GEN_225 = tag_dirty_0 & tag_dirty_1 ? fence_addr0 : reg_cpu_addr; // @[dcache.scala 392:64 395:57 45:42]
  wire [63:0] _GEN_226 = tag_dirty_0 & tag_dirty_1 ? fence_addr1 : _GEN_212; // @[dcache.scala 392:64 396:57]
  wire  _GEN_227 = tag_dirty_0 & tag_dirty_1 | _GEN_213; // @[dcache.scala 392:64 398:57]
  wire [63:0] _GEN_228 = tag_dirty_0 & tag_dirty_1 ? fence_addr0 : _GEN_214; // @[dcache.scala 392:64 399:57]
  wire [63:0] _GEN_229 = tag_dirty_0 & tag_dirty_1 ? io_sram_rdata_0[63:0] : _GEN_215; // @[dcache.scala 392:64 400:65]
  wire  _GEN_230 = tag_dirty_0 & tag_dirty_1 ? 1'h0 : _GEN_216; // @[dcache.scala 392:64 401:65]
  wire [1:0] _GEN_231 = tag_dirty_0 & tag_dirty_1 ? 2'h1 : _GEN_217; // @[dcache.scala 392:64 402:65]
  wire [1:0] _GEN_232 = tag_dirty_0 & tag_dirty_1 ? 2'h3 : _GEN_218; // @[dcache.scala 392:64 403:65]
  wire [7:0] _GEN_233 = tag_dirty_0 & tag_dirty_1 ? 8'hff : _GEN_219; // @[dcache.scala 392:64 404:65]
  wire [1:0] _GEN_234 = tag_dirty_0 & tag_dirty_1 ? 2'h1 : _GEN_220; // @[dcache.scala 392:64 406:65]
  wire  _GEN_235 = tag_dirty_0 & tag_dirty_1 | _GEN_221; // @[dcache.scala 392:64 407:65]
  wire [2:0] _GEN_236 = tag_dirty_0 & tag_dirty_1 ? 3'h6 : _GEN_222; // @[dcache.scala 392:64 408:57]
  wire [6:0] _GEN_237 = reg_fence_cnt != 7'h40 ? _reg_fence_cnt_T_1 : 7'h0; // @[dcache.scala 389:53 390:47 428:49]
  wire [5:0] _GEN_238 = reg_fence_cnt != 7'h40 ? _reg_index_T_2 : reg_index; // @[dcache.scala 389:53 391:43 50:42]
  wire [127:0] _GEN_239 = reg_fence_cnt != 7'h40 ? _GEN_223 : reg_fence_data0; // @[dcache.scala 164:42 389:53]
  wire [127:0] _GEN_240 = reg_fence_cnt != 7'h40 ? _GEN_224 : reg_fence_data1; // @[dcache.scala 166:42 389:53]
  wire [63:0] _GEN_241 = reg_fence_cnt != 7'h40 ? _GEN_225 : reg_cpu_addr; // @[dcache.scala 389:53 45:42]
  wire [63:0] _GEN_242 = reg_fence_cnt != 7'h40 ? _GEN_226 : reg_fence_addr1; // @[dcache.scala 168:38 389:53]
  wire  _GEN_243 = reg_fence_cnt != 7'h40 ? _GEN_227 : reg_w_valid; // @[dcache.scala 32:34 389:53]
  wire [63:0] _GEN_244 = reg_fence_cnt != 7'h40 ? _GEN_228 : reg_w_waddr; // @[dcache.scala 33:34 389:53]
  wire [63:0] _GEN_245 = reg_fence_cnt != 7'h40 ? _GEN_229 : reg_w_wdata; // @[dcache.scala 34:34 389:53]
  wire  _GEN_246 = reg_fence_cnt != 7'h40 ? _GEN_230 : reg_w_wlast; // @[dcache.scala 35:34 389:53]
  wire [1:0] _GEN_247 = reg_fence_cnt != 7'h40 ? _GEN_231 : reg_w_len; // @[dcache.scala 36:34 389:53]
  wire [1:0] _GEN_248 = reg_fence_cnt != 7'h40 ? _GEN_232 : reg_w_size; // @[dcache.scala 37:34 389:53]
  wire [7:0] _GEN_249 = reg_fence_cnt != 7'h40 ? _GEN_233 : reg_w_strb; // @[dcache.scala 38:34 389:53]
  wire [1:0] _GEN_250 = reg_fence_cnt != 7'h40 ? _GEN_234 : reg_cnt; // @[dcache.scala 389:53 39:34]
  wire  _GEN_251 = reg_fence_cnt != 7'h40 ? _GEN_235 : need_two; // @[dcache.scala 173:42 389:53]
  wire [2:0] _GEN_252 = reg_fence_cnt != 7'h40 ? _GEN_236 : 3'h0; // @[dcache.scala 389:53 429:49]
  wire  _GEN_253 = reg_fence_cnt != 7'h40 ? reg_ready : 1'h1; // @[dcache.scala 17:42 389:53 430:57]
  wire  _GEN_254 = reg_fence_cnt != 7'h40 ? reg_valid : 1'h1; // @[dcache.scala 16:42 389:53 431:57]
  wire [2:0] _GEN_255 = reg_fence_cnt != 7'h40 ? reg_resp_info : 3'h4; // @[dcache.scala 18:42 389:53 432:49]
  wire  _GEN_256 = reg_fence_cnt != 7'h40 ? flush_cache : 1'h1; // @[dcache.scala 389:53 87:42 433:49]
  wire [63:0] _reg_w_wdata_T_13 = need_two ? reg_fence_data0[127:64] : reg_fence_data1[127:64]; // @[dcache.scala 444:63]
  wire [63:0] _GEN_259 = _T_14 ? _reg_w_wdata_T_13 : reg_w_wdata; // @[dcache.scala 34:34 441:60 444:57]
  wire [63:0] _GEN_263 = _T_13 ? reg_w_wdata : _GEN_259; // @[dcache.scala 34:34 438:54]
  wire [63:0] _GEN_267 = _T_12 ? _GEN_263 : reg_w_wdata; // @[dcache.scala 34:34 437:50]
  wire  _GEN_268 = need_two ? 1'h0 : need_two; // @[dcache.scala 173:42 448:47 449:57]
  wire [63:0] _GEN_270 = need_two ? reg_fence_addr1 : reg_w_waddr; // @[dcache.scala 33:34 448:47 451:57]
  wire [63:0] _GEN_271 = need_two ? reg_fence_data1[63:0] : _GEN_267; // @[dcache.scala 448:47 452:65]
  wire [1:0] _GEN_273 = need_two ? 2'h1 : reg_w_len; // @[dcache.scala 36:34 448:47 454:65]
  wire [1:0] _GEN_274 = need_two ? 2'h3 : reg_w_size; // @[dcache.scala 37:34 448:47 455:65]
  wire [7:0] _GEN_275 = need_two ? 8'hff : reg_w_strb; // @[dcache.scala 38:34 448:47 456:65]
  wire [1:0] _GEN_276 = need_two ? 2'h1 : _GEN_174; // @[dcache.scala 448:47 457:65]
  wire [2:0] _GEN_277 = need_two ? reg_bus_state : 3'h5; // @[dcache.scala 12:36 448:47 461:57]
  wire  _GEN_278 = _T_15 ? _GEN_268 : need_two; // @[dcache.scala 173:42 447:50]
  wire  _GEN_279 = _T_15 ? need_two : _GEN_173; // @[dcache.scala 447:50]
  wire [63:0] _GEN_280 = _T_15 ? _GEN_270 : reg_w_waddr; // @[dcache.scala 33:34 447:50]
  wire [63:0] _GEN_281 = _T_15 ? _GEN_271 : _GEN_267; // @[dcache.scala 447:50]
  wire  _GEN_282 = _T_15 ? 1'h0 : _GEN_172; // @[dcache.scala 447:50]
  wire [1:0] _GEN_283 = _T_15 ? _GEN_273 : reg_w_len; // @[dcache.scala 36:34 447:50]
  wire [1:0] _GEN_284 = _T_15 ? _GEN_274 : reg_w_size; // @[dcache.scala 37:34 447:50]
  wire [7:0] _GEN_285 = _T_15 ? _GEN_275 : reg_w_strb; // @[dcache.scala 38:34 447:50]
  wire [1:0] _GEN_286 = _T_15 ? _GEN_276 : _GEN_174; // @[dcache.scala 447:50]
  wire [2:0] _GEN_287 = _T_15 ? _GEN_277 : reg_bus_state; // @[dcache.scala 12:36 447:50]
  wire  _GEN_288 = 3'h6 == reg_bus_state ? _GEN_282 : reg_w_wlast; // @[dcache.scala 177:30 35:34]
  wire  _GEN_289 = 3'h6 == reg_bus_state ? _GEN_279 : reg_w_valid; // @[dcache.scala 177:30 32:34]
  wire [1:0] _GEN_290 = 3'h6 == reg_bus_state ? _GEN_286 : reg_cnt; // @[dcache.scala 177:30 39:34]
  wire [63:0] _GEN_291 = 3'h6 == reg_bus_state ? _GEN_281 : reg_w_wdata; // @[dcache.scala 177:30 34:34]
  wire  _GEN_292 = 3'h6 == reg_bus_state ? _GEN_278 : need_two; // @[dcache.scala 177:30 173:42]
  wire [63:0] _GEN_293 = 3'h6 == reg_bus_state ? _GEN_280 : reg_w_waddr; // @[dcache.scala 177:30 33:34]
  wire [1:0] _GEN_294 = 3'h6 == reg_bus_state ? _GEN_283 : reg_w_len; // @[dcache.scala 177:30 36:34]
  wire [1:0] _GEN_295 = 3'h6 == reg_bus_state ? _GEN_284 : reg_w_size; // @[dcache.scala 177:30 37:34]
  wire [7:0] _GEN_296 = 3'h6 == reg_bus_state ? _GEN_285 : reg_w_strb; // @[dcache.scala 177:30 38:34]
  wire [2:0] _GEN_297 = 3'h6 == reg_bus_state ? _GEN_287 : reg_bus_state; // @[dcache.scala 177:30 12:36]
  wire [6:0] _GEN_298 = 3'h5 == reg_bus_state ? _GEN_237 : reg_fence_cnt; // @[dcache.scala 177:30 40:36]
  wire [5:0] _GEN_299 = 3'h5 == reg_bus_state ? _GEN_238 : reg_index; // @[dcache.scala 177:30 50:42]
  wire [127:0] _GEN_300 = 3'h5 == reg_bus_state ? _GEN_239 : reg_fence_data0; // @[dcache.scala 177:30 164:42]
  wire [127:0] _GEN_301 = 3'h5 == reg_bus_state ? _GEN_240 : reg_fence_data1; // @[dcache.scala 177:30 166:42]
  wire [63:0] _GEN_302 = 3'h5 == reg_bus_state ? _GEN_241 : reg_cpu_addr; // @[dcache.scala 177:30 45:42]
  wire [63:0] _GEN_303 = 3'h5 == reg_bus_state ? _GEN_242 : reg_fence_addr1; // @[dcache.scala 177:30 168:38]
  wire  _GEN_304 = 3'h5 == reg_bus_state ? _GEN_243 : _GEN_289; // @[dcache.scala 177:30]
  wire [63:0] _GEN_305 = 3'h5 == reg_bus_state ? _GEN_244 : _GEN_293; // @[dcache.scala 177:30]
  wire [63:0] _GEN_306 = 3'h5 == reg_bus_state ? _GEN_245 : _GEN_291; // @[dcache.scala 177:30]
  wire  _GEN_307 = 3'h5 == reg_bus_state ? _GEN_246 : _GEN_288; // @[dcache.scala 177:30]
  wire [1:0] _GEN_308 = 3'h5 == reg_bus_state ? _GEN_247 : _GEN_294; // @[dcache.scala 177:30]
  wire [1:0] _GEN_309 = 3'h5 == reg_bus_state ? _GEN_248 : _GEN_295; // @[dcache.scala 177:30]
  wire [7:0] _GEN_310 = 3'h5 == reg_bus_state ? _GEN_249 : _GEN_296; // @[dcache.scala 177:30]
  wire [1:0] _GEN_311 = 3'h5 == reg_bus_state ? _GEN_250 : _GEN_290; // @[dcache.scala 177:30]
  wire  _GEN_312 = 3'h5 == reg_bus_state ? _GEN_251 : _GEN_292; // @[dcache.scala 177:30]
  wire [2:0] _GEN_313 = 3'h5 == reg_bus_state ? _GEN_252 : _GEN_297; // @[dcache.scala 177:30]
  wire  _GEN_314 = 3'h5 == reg_bus_state ? _GEN_253 : reg_ready; // @[dcache.scala 177:30 17:42]
  wire  _GEN_315 = 3'h5 == reg_bus_state ? _GEN_254 : reg_valid; // @[dcache.scala 177:30 16:42]
  wire [2:0] _GEN_316 = 3'h5 == reg_bus_state ? _GEN_255 : reg_resp_info; // @[dcache.scala 177:30 18:42]
  wire  _GEN_317 = 3'h5 == reg_bus_state ? _GEN_256 : flush_cache; // @[dcache.scala 177:30 87:42]
  wire [2:0] _GEN_318 = 3'h4 == reg_bus_state ? 3'h5 : _GEN_313; // @[dcache.scala 177:30 385:41]
  wire [6:0] _GEN_319 = 3'h4 == reg_bus_state ? reg_fence_cnt : _GEN_298; // @[dcache.scala 177:30 40:36]
  wire [5:0] _GEN_320 = 3'h4 == reg_bus_state ? reg_index : _GEN_299; // @[dcache.scala 177:30 50:42]
  wire [127:0] _GEN_321 = 3'h4 == reg_bus_state ? reg_fence_data0 : _GEN_300; // @[dcache.scala 177:30 164:42]
  wire [127:0] _GEN_322 = 3'h4 == reg_bus_state ? reg_fence_data1 : _GEN_301; // @[dcache.scala 177:30 166:42]
  wire [63:0] _GEN_323 = 3'h4 == reg_bus_state ? reg_cpu_addr : _GEN_302; // @[dcache.scala 177:30 45:42]
  wire [63:0] _GEN_324 = 3'h4 == reg_bus_state ? reg_fence_addr1 : _GEN_303; // @[dcache.scala 177:30 168:38]
  wire  _GEN_325 = 3'h4 == reg_bus_state ? reg_w_valid : _GEN_304; // @[dcache.scala 177:30 32:34]
  wire [63:0] _GEN_326 = 3'h4 == reg_bus_state ? reg_w_waddr : _GEN_305; // @[dcache.scala 177:30 33:34]
  wire [63:0] _GEN_327 = 3'h4 == reg_bus_state ? reg_w_wdata : _GEN_306; // @[dcache.scala 177:30 34:34]
  wire  _GEN_328 = 3'h4 == reg_bus_state ? reg_w_wlast : _GEN_307; // @[dcache.scala 177:30 35:34]
  wire [1:0] _GEN_329 = 3'h4 == reg_bus_state ? reg_w_len : _GEN_308; // @[dcache.scala 177:30 36:34]
  wire [1:0] _GEN_330 = 3'h4 == reg_bus_state ? reg_w_size : _GEN_309; // @[dcache.scala 177:30 37:34]
  wire [7:0] _GEN_331 = 3'h4 == reg_bus_state ? reg_w_strb : _GEN_310; // @[dcache.scala 177:30 38:34]
  wire [1:0] _GEN_332 = 3'h4 == reg_bus_state ? reg_cnt : _GEN_311; // @[dcache.scala 177:30 39:34]
  wire  _GEN_333 = 3'h4 == reg_bus_state ? need_two : _GEN_312; // @[dcache.scala 177:30 173:42]
  wire  _GEN_334 = 3'h4 == reg_bus_state ? reg_ready : _GEN_314; // @[dcache.scala 177:30 17:42]
  wire  _GEN_335 = 3'h4 == reg_bus_state ? reg_valid : _GEN_315; // @[dcache.scala 177:30 16:42]
  wire [2:0] _GEN_336 = 3'h4 == reg_bus_state ? reg_resp_info : _GEN_316; // @[dcache.scala 177:30 18:42]
  wire  _GEN_337 = 3'h4 == reg_bus_state ? flush_cache : _GEN_317; // @[dcache.scala 177:30 87:42]
  wire [63:0] _GEN_338 = 3'h3 == reg_bus_state ? _GEN_199 : reg_rdata; // @[dcache.scala 177:30 15:42]
  wire [2:0] _GEN_339 = 3'h3 == reg_bus_state ? _GEN_200 : _GEN_318; // @[dcache.scala 177:30]
  wire  _GEN_340 = 3'h3 == reg_bus_state ? _GEN_201 : _GEN_334; // @[dcache.scala 177:30]
  wire  _GEN_341 = 3'h3 == reg_bus_state ? _GEN_202 : _GEN_335; // @[dcache.scala 177:30]
  wire [2:0] _GEN_342 = 3'h3 == reg_bus_state ? _GEN_203 : _GEN_336; // @[dcache.scala 177:30]
  wire  _GEN_343 = 3'h3 == reg_bus_state ? _GEN_204 : reg_clint_valid; // @[dcache.scala 177:30 159:38]
  wire  _GEN_344 = 3'h3 == reg_bus_state ? _GEN_205 : reg_clint_is_w; // @[dcache.scala 177:30 162:38]
  wire  _GEN_345 = 3'h3 == reg_bus_state ? _GEN_206 : _GEN_325; // @[dcache.scala 177:30]
  wire  _GEN_346 = 3'h3 == reg_bus_state ? _GEN_207 : _GEN_328; // @[dcache.scala 177:30]
  wire  _GEN_347 = 3'h3 == reg_bus_state ? _GEN_208 : reg_r_valid; // @[dcache.scala 177:30 28:34]
  wire  _GEN_348 = 3'h3 == reg_bus_state ? _GEN_209 : reg_rbus_finish; // @[dcache.scala 177:30 42:38]
  wire  _GEN_349 = 3'h3 == reg_bus_state ? _GEN_210 : reg_wbus_finish; // @[dcache.scala 177:30 41:38]
  wire [6:0] _GEN_350 = 3'h3 == reg_bus_state ? reg_fence_cnt : _GEN_319; // @[dcache.scala 177:30 40:36]
  wire [5:0] _GEN_351 = 3'h3 == reg_bus_state ? reg_index : _GEN_320; // @[dcache.scala 177:30 50:42]
  wire [127:0] _GEN_352 = 3'h3 == reg_bus_state ? reg_fence_data0 : _GEN_321; // @[dcache.scala 177:30 164:42]
  wire [127:0] _GEN_353 = 3'h3 == reg_bus_state ? reg_fence_data1 : _GEN_322; // @[dcache.scala 177:30 166:42]
  wire [63:0] _GEN_354 = 3'h3 == reg_bus_state ? reg_cpu_addr : _GEN_323; // @[dcache.scala 177:30 45:42]
  wire [63:0] _GEN_355 = 3'h3 == reg_bus_state ? reg_fence_addr1 : _GEN_324; // @[dcache.scala 177:30 168:38]
  wire [63:0] _GEN_356 = 3'h3 == reg_bus_state ? reg_w_waddr : _GEN_326; // @[dcache.scala 177:30 33:34]
  wire [63:0] _GEN_357 = 3'h3 == reg_bus_state ? reg_w_wdata : _GEN_327; // @[dcache.scala 177:30 34:34]
  wire [1:0] _GEN_358 = 3'h3 == reg_bus_state ? reg_w_len : _GEN_329; // @[dcache.scala 177:30 36:34]
  wire [1:0] _GEN_359 = 3'h3 == reg_bus_state ? reg_w_size : _GEN_330; // @[dcache.scala 177:30 37:34]
  wire [7:0] _GEN_360 = 3'h3 == reg_bus_state ? reg_w_strb : _GEN_331; // @[dcache.scala 177:30 38:34]
  wire [1:0] _GEN_361 = 3'h3 == reg_bus_state ? reg_cnt : _GEN_332; // @[dcache.scala 177:30 39:34]
  wire  _GEN_362 = 3'h3 == reg_bus_state ? need_two : _GEN_333; // @[dcache.scala 177:30 173:42]
  wire  _GEN_363 = 3'h3 == reg_bus_state ? flush_cache : _GEN_337; // @[dcache.scala 177:30 87:42]
  wire  _GEN_366 = 3'h2 == reg_bus_state ? _GEN_162 : _GEN_348; // @[dcache.scala 177:30]
  wire  _GEN_373 = 3'h2 == reg_bus_state ? _GEN_176 : _GEN_349; // @[dcache.scala 177:30]
  wire  _GEN_376 = 3'h2 == reg_bus_state ? _GEN_179 : _GEN_340; // @[dcache.scala 177:30]
  wire  _GEN_400 = 3'h1 == reg_bus_state ? _GEN_136 : _GEN_376; // @[dcache.scala 177:30]
  wire  _GEN_403 = 3'h1 == reg_bus_state ? _GEN_139 : _GEN_366; // @[dcache.scala 177:30]
  wire  _GEN_415 = 3'h1 == reg_bus_state ? _GEN_151 : _GEN_373; // @[dcache.scala 177:30]
  wire  _GEN_428 = 3'h0 == reg_bus_state ? _GEN_70 : _GEN_400; // @[dcache.scala 177:30]
  wire  _GEN_449 = 3'h0 == reg_bus_state ? _GEN_84 : _GEN_415; // @[dcache.scala 177:30]
  wire  _GEN_453 = 3'h0 == reg_bus_state ? _GEN_89 : _GEN_403; // @[dcache.scala 177:30]
  assign io_dcache_cmd_ready = reg_ready; // @[dcache.scala 481:49]
  assign io_dcahce_resp_valid = reg_valid; // @[dcache.scala 482:49]
  assign io_dcahce_resp_bits_rdata = reg_rdata; // @[dcache.scala 483:49]
  assign io_dcahce_resp_bits_resp_info = reg_resp_info; // @[dcache.scala 484:41]
  assign io_sram_addr = reg_bus_state != 3'h0 ? reg_index : index; // @[dcache.scala 63:39]
  assign io_sram_wen_0 = ~is_sram0_write; // @[dcache.scala 64:28]
  assign io_sram_wen_1 = ~is_sram1_write; // @[dcache.scala 65:28]
  assign io_sram_data_wmask = ~cache_mask; // @[dcache.scala 67:28]
  assign io_sram_tag_wdata = {{74'd0}, reg_tag}; // @[dcache.scala 68:25]
  assign io_sram_data_wdata = reg_cache_wdata; // @[dcache.scala 69:25]
  assign io_clint_valid = reg_clint_valid; // @[dcache.scala 486:33]
  assign io_clint_bits_addr = reg_clint_addr; // @[dcache.scala 487:33]
  assign io_clint_bits_wdata = reg_clint_wdata; // @[dcache.scala 488:33]
  assign io_clint_bits_is_w = reg_clint_is_w; // @[dcache.scala 489:33]
  assign io_cache_bus_w_valid = reg_w_valid; // @[dcache.scala 466:41]
  assign io_cache_bus_w_bits_waddr = reg_w_waddr; // @[dcache.scala 467:41]
  assign io_cache_bus_w_bits_wdata = reg_w_wdata; // @[dcache.scala 468:41]
  assign io_cache_bus_w_bits_wlast = reg_w_wlast; // @[dcache.scala 469:41]
  assign io_cache_bus_w_bits_wlen = reg_w_len; // @[dcache.scala 470:41]
  assign io_cache_bus_w_bits_wsize = reg_w_size; // @[dcache.scala 471:41]
  assign io_cache_bus_w_bits_wstrb = reg_w_strb; // @[dcache.scala 472:41]
  assign io_cache_bus_b_ready = 1'h1; // @[dcache.scala 474:41]
  assign io_cache_bus_r_valid = reg_r_valid; // @[dcache.scala 479:41]
  assign io_cache_bus_r_bits_raddr = reg_r_raddr; // @[dcache.scala 476:41]
  assign io_cache_bus_r_bits_rlen = reg_r_len; // @[dcache.scala 477:41]
  assign io_cache_bus_r_bits_rsize = reg_r_size; // @[dcache.scala 478:41]
  always @(posedge clock) begin
    if (reset) begin // @[dcache.scala 12:36]
      reg_bus_state <= 3'h0; // @[dcache.scala 12:36]
    end else if (3'h0 == reg_bus_state) begin // @[dcache.scala 177:30]
      if (cache_valid) begin // @[dcache.scala 195:42]
        reg_bus_state <= 3'h1; // @[dcache.scala 198:49]
      end else if (mmio_valid) begin // @[dcache.scala 200:47]
        reg_bus_state <= 3'h3; // @[dcache.scala 203:49]
      end else begin
        reg_bus_state <= _GEN_45;
      end
    end else if (3'h1 == reg_bus_state) begin // @[dcache.scala 177:30]
      if (is_hit) begin // @[dcache.scala 238:37]
        reg_bus_state <= _GEN_99;
      end else begin
        reg_bus_state <= 3'h2;
      end
    end else if (3'h2 == reg_bus_state) begin // @[dcache.scala 177:30]
      reg_bus_state <= _GEN_178;
    end else begin
      reg_bus_state <= _GEN_339;
    end
    if (reset) begin // @[dcache.scala 14:42]
      reg_chosen_tag <= 1'h0; // @[dcache.scala 14:42]
    end else if (!(3'h0 == reg_bus_state)) begin // @[dcache.scala 177:30]
      if (3'h1 == reg_bus_state) begin // @[dcache.scala 177:30]
        if (is_hit) begin // @[dcache.scala 238:37]
          reg_chosen_tag <= _reg_chosen_tag_T; // @[dcache.scala 241:49]
        end else begin
          reg_chosen_tag <= _GEN_117;
        end
      end
    end
    if (reset) begin // @[dcache.scala 15:42]
      reg_rdata <= 64'h0; // @[dcache.scala 15:42]
    end else if (!(3'h0 == reg_bus_state)) begin // @[dcache.scala 177:30]
      if (3'h1 == reg_bus_state) begin // @[dcache.scala 177:30]
        if (is_hit) begin // @[dcache.scala 238:37]
          reg_rdata <= _GEN_102;
        end
      end else if (3'h2 == reg_bus_state) begin // @[dcache.scala 177:30]
        reg_rdata <= _GEN_164;
      end else begin
        reg_rdata <= _GEN_338;
      end
    end
    if (reset) begin // @[dcache.scala 16:42]
      reg_valid <= 1'h0; // @[dcache.scala 16:42]
    end else if (3'h0 == reg_bus_state) begin // @[dcache.scala 177:30]
      reg_valid <= 1'h0;
    end else if (3'h1 == reg_bus_state) begin // @[dcache.scala 177:30]
      reg_valid <= _GEN_136;
    end else if (3'h2 == reg_bus_state) begin // @[dcache.scala 177:30]
      reg_valid <= _GEN_180;
    end else begin
      reg_valid <= _GEN_341;
    end
    reg_ready <= reset | _GEN_428; // @[dcache.scala 17:{42,42}]
    if (reset) begin // @[dcache.scala 18:42]
      reg_resp_info <= 3'h0; // @[dcache.scala 18:42]
    end else if (3'h0 == reg_bus_state) begin // @[dcache.scala 177:30]
      reg_resp_info <= 3'h0; // @[dcache.scala 187:41]
    end else if (3'h1 == reg_bus_state) begin // @[dcache.scala 177:30]
      if (is_hit) begin // @[dcache.scala 238:37]
        reg_resp_info <= _GEN_101;
      end
    end else if (3'h2 == reg_bus_state) begin // @[dcache.scala 177:30]
      reg_resp_info <= _GEN_181;
    end else begin
      reg_resp_info <= _GEN_342;
    end
    if (reset) begin // @[dcache.scala 27:34]
      reg_r_raddr <= 64'h0; // @[dcache.scala 27:34]
    end else if (3'h0 == reg_bus_state) begin // @[dcache.scala 177:30]
      if (!(cache_valid)) begin // @[dcache.scala 195:42]
        if (mmio_valid) begin // @[dcache.scala 200:47]
          reg_r_raddr <= _GEN_40;
        end
      end
    end else if (3'h1 == reg_bus_state) begin // @[dcache.scala 177:30]
      if (is_hit) begin // @[dcache.scala 238:37]
        reg_r_raddr <= _GEN_104;
      end else begin
        reg_r_raddr <= _GEN_118;
      end
    end
    if (reset) begin // @[dcache.scala 28:34]
      reg_r_valid <= 1'h0; // @[dcache.scala 28:34]
    end else if (3'h0 == reg_bus_state) begin // @[dcache.scala 177:30]
      if (cache_valid) begin // @[dcache.scala 195:42]
        reg_r_valid <= 1'h0; // @[dcache.scala 192:49]
      end else begin
        reg_r_valid <= _GEN_64;
      end
    end else if (3'h1 == reg_bus_state) begin // @[dcache.scala 177:30]
      if (is_hit) begin // @[dcache.scala 238:37]
        reg_r_valid <= _GEN_105;
      end else begin
        reg_r_valid <= 1'h1;
      end
    end else if (3'h2 == reg_bus_state) begin // @[dcache.scala 177:30]
      reg_r_valid <= _GEN_160;
    end else begin
      reg_r_valid <= _GEN_347;
    end
    if (reset) begin // @[dcache.scala 29:34]
      reg_r_len <= 2'h0; // @[dcache.scala 29:34]
    end else if (3'h0 == reg_bus_state) begin // @[dcache.scala 177:30]
      if (!(cache_valid)) begin // @[dcache.scala 195:42]
        if (mmio_valid) begin // @[dcache.scala 200:47]
          reg_r_len <= _GEN_42;
        end
      end
    end else if (3'h1 == reg_bus_state) begin // @[dcache.scala 177:30]
      if (is_hit) begin // @[dcache.scala 238:37]
        reg_r_len <= _GEN_106;
      end else begin
        reg_r_len <= 2'h1;
      end
    end
    if (reset) begin // @[dcache.scala 30:34]
      reg_r_size <= 2'h0; // @[dcache.scala 30:34]
    end else if (3'h0 == reg_bus_state) begin // @[dcache.scala 177:30]
      if (!(cache_valid)) begin // @[dcache.scala 195:42]
        if (mmio_valid) begin // @[dcache.scala 200:47]
          reg_r_size <= _GEN_43;
        end
      end
    end else if (3'h1 == reg_bus_state) begin // @[dcache.scala 177:30]
      if (is_hit) begin // @[dcache.scala 238:37]
        reg_r_size <= _GEN_107;
      end else begin
        reg_r_size <= 2'h3;
      end
    end
    if (reset) begin // @[dcache.scala 32:34]
      reg_w_valid <= 1'h0; // @[dcache.scala 32:34]
    end else if (3'h0 == reg_bus_state) begin // @[dcache.scala 177:30]
      if (cache_valid) begin // @[dcache.scala 195:42]
        reg_w_valid <= 1'h0; // @[dcache.scala 191:49]
      end else begin
        reg_w_valid <= _GEN_55;
      end
    end else if (3'h1 == reg_bus_state) begin // @[dcache.scala 177:30]
      if (!(is_hit)) begin // @[dcache.scala 238:37]
        reg_w_valid <= _GEN_123;
      end
    end else if (3'h2 == reg_bus_state) begin // @[dcache.scala 177:30]
      reg_w_valid <= _GEN_173;
    end else begin
      reg_w_valid <= _GEN_345;
    end
    if (reset) begin // @[dcache.scala 33:34]
      reg_w_waddr <= 64'h0; // @[dcache.scala 33:34]
    end else if (3'h0 == reg_bus_state) begin // @[dcache.scala 177:30]
      if (!(cache_valid)) begin // @[dcache.scala 195:42]
        if (mmio_valid) begin // @[dcache.scala 200:47]
          reg_w_waddr <= _GEN_33;
        end
      end
    end else if (3'h1 == reg_bus_state) begin // @[dcache.scala 177:30]
      if (!(is_hit)) begin // @[dcache.scala 238:37]
        reg_w_waddr <= _GEN_124;
      end
    end else if (!(3'h2 == reg_bus_state)) begin // @[dcache.scala 177:30]
      reg_w_waddr <= _GEN_356;
    end
    if (reset) begin // @[dcache.scala 34:34]
      reg_w_wdata <= 64'h0; // @[dcache.scala 34:34]
    end else if (3'h0 == reg_bus_state) begin // @[dcache.scala 177:30]
      if (!(cache_valid)) begin // @[dcache.scala 195:42]
        if (mmio_valid) begin // @[dcache.scala 200:47]
          reg_w_wdata <= _GEN_34;
        end
      end
    end else if (3'h1 == reg_bus_state) begin // @[dcache.scala 177:30]
      if (!(is_hit)) begin // @[dcache.scala 238:37]
        reg_w_wdata <= _GEN_125;
      end
    end else if (3'h2 == reg_bus_state) begin // @[dcache.scala 177:30]
      reg_w_wdata <= _GEN_175;
    end else begin
      reg_w_wdata <= _GEN_357;
    end
    if (reset) begin // @[dcache.scala 35:34]
      reg_w_wlast <= 1'h0; // @[dcache.scala 35:34]
    end else if (3'h0 == reg_bus_state) begin // @[dcache.scala 177:30]
      if (!(cache_valid)) begin // @[dcache.scala 195:42]
        if (mmio_valid) begin // @[dcache.scala 200:47]
          reg_w_wlast <= _GEN_35;
        end
      end
    end else if (3'h1 == reg_bus_state) begin // @[dcache.scala 177:30]
      if (!(is_hit)) begin // @[dcache.scala 238:37]
        reg_w_wlast <= _GEN_126;
      end
    end else if (3'h2 == reg_bus_state) begin // @[dcache.scala 177:30]
      reg_w_wlast <= _GEN_172;
    end else begin
      reg_w_wlast <= _GEN_346;
    end
    if (reset) begin // @[dcache.scala 36:34]
      reg_w_len <= 2'h0; // @[dcache.scala 36:34]
    end else if (3'h0 == reg_bus_state) begin // @[dcache.scala 177:30]
      if (!(cache_valid)) begin // @[dcache.scala 195:42]
        if (mmio_valid) begin // @[dcache.scala 200:47]
          reg_w_len <= _GEN_36;
        end
      end
    end else if (3'h1 == reg_bus_state) begin // @[dcache.scala 177:30]
      if (!(is_hit)) begin // @[dcache.scala 238:37]
        reg_w_len <= _GEN_127;
      end
    end else if (!(3'h2 == reg_bus_state)) begin // @[dcache.scala 177:30]
      reg_w_len <= _GEN_358;
    end
    if (reset) begin // @[dcache.scala 37:34]
      reg_w_size <= 2'h0; // @[dcache.scala 37:34]
    end else if (3'h0 == reg_bus_state) begin // @[dcache.scala 177:30]
      if (!(cache_valid)) begin // @[dcache.scala 195:42]
        if (mmio_valid) begin // @[dcache.scala 200:47]
          reg_w_size <= _GEN_37;
        end
      end
    end else if (3'h1 == reg_bus_state) begin // @[dcache.scala 177:30]
      if (!(is_hit)) begin // @[dcache.scala 238:37]
        reg_w_size <= _GEN_128;
      end
    end else if (!(3'h2 == reg_bus_state)) begin // @[dcache.scala 177:30]
      reg_w_size <= _GEN_359;
    end
    if (reset) begin // @[dcache.scala 38:34]
      reg_w_strb <= 8'h0; // @[dcache.scala 38:34]
    end else if (3'h0 == reg_bus_state) begin // @[dcache.scala 177:30]
      if (!(cache_valid)) begin // @[dcache.scala 195:42]
        if (mmio_valid) begin // @[dcache.scala 200:47]
          reg_w_strb <= _GEN_38;
        end
      end
    end else if (3'h1 == reg_bus_state) begin // @[dcache.scala 177:30]
      if (!(is_hit)) begin // @[dcache.scala 238:37]
        reg_w_strb <= _GEN_129;
      end
    end else if (!(3'h2 == reg_bus_state)) begin // @[dcache.scala 177:30]
      reg_w_strb <= _GEN_360;
    end
    if (reset) begin // @[dcache.scala 39:34]
      reg_cnt <= 2'h0; // @[dcache.scala 39:34]
    end else if (!(3'h0 == reg_bus_state)) begin // @[dcache.scala 177:30]
      if (3'h1 == reg_bus_state) begin // @[dcache.scala 177:30]
        if (!(is_hit)) begin // @[dcache.scala 238:37]
          reg_cnt <= _GEN_131;
        end
      end else if (3'h2 == reg_bus_state) begin // @[dcache.scala 177:30]
        reg_cnt <= _GEN_174;
      end else begin
        reg_cnt <= _GEN_361;
      end
    end
    if (reset) begin // @[dcache.scala 40:36]
      reg_fence_cnt <= 7'h0; // @[dcache.scala 40:36]
    end else if (!(3'h0 == reg_bus_state)) begin // @[dcache.scala 177:30]
      if (!(3'h1 == reg_bus_state)) begin // @[dcache.scala 177:30]
        if (!(3'h2 == reg_bus_state)) begin // @[dcache.scala 177:30]
          reg_fence_cnt <= _GEN_350;
        end
      end
    end
    reg_wbus_finish <= reset | _GEN_449; // @[dcache.scala 41:{38,38}]
    reg_rbus_finish <= reset | _GEN_453; // @[dcache.scala 42:{38,38}]
    if (reset) begin // @[dcache.scala 45:42]
      reg_cpu_addr <= 64'h0; // @[dcache.scala 45:42]
    end else if (3'h0 == reg_bus_state) begin // @[dcache.scala 177:30]
      reg_cpu_addr <= io_dcache_cmd_bits_addr; // @[dcache.scala 185:41]
    end else if (!(3'h1 == reg_bus_state)) begin // @[dcache.scala 177:30]
      if (!(3'h2 == reg_bus_state)) begin // @[dcache.scala 177:30]
        reg_cpu_addr <= _GEN_354;
      end
    end
    if (reset) begin // @[dcache.scala 49:42]
      reg_is_w <= 1'h0; // @[dcache.scala 49:42]
    end else if (3'h0 == reg_bus_state) begin // @[dcache.scala 177:30]
      reg_is_w <= _GEN_72;
    end
    if (reset) begin // @[dcache.scala 50:42]
      reg_index <= 6'h0; // @[dcache.scala 50:42]
    end else if (3'h0 == reg_bus_state) begin // @[dcache.scala 177:30]
      if (cache_valid) begin // @[dcache.scala 195:42]
        reg_index <= index; // @[dcache.scala 193:49]
      end else if (mmio_valid) begin // @[dcache.scala 200:47]
        reg_index <= index; // @[dcache.scala 193:49]
      end else begin
        reg_index <= _GEN_47;
      end
    end else if (!(3'h1 == reg_bus_state)) begin // @[dcache.scala 177:30]
      if (!(3'h2 == reg_bus_state)) begin // @[dcache.scala 177:30]
        reg_index <= _GEN_351;
      end
    end
    if (reset) begin // @[dcache.scala 52:38]
      reg_cache_wdata <= 128'h0; // @[dcache.scala 52:38]
    end else if (!(3'h0 == reg_bus_state)) begin // @[dcache.scala 177:30]
      if (3'h1 == reg_bus_state) begin // @[dcache.scala 177:30]
        if (is_hit) begin // @[dcache.scala 238:37]
          reg_cache_wdata <= _GEN_98;
        end
      end else if (3'h2 == reg_bus_state) begin // @[dcache.scala 177:30]
        reg_cache_wdata <= _GEN_163;
      end
    end
    if (reset) begin // @[dcache.scala 53:42]
      reg_cache_write <= 1'h0; // @[dcache.scala 53:42]
    end else if (3'h0 == reg_bus_state) begin // @[dcache.scala 177:30]
      reg_cache_write <= 1'h0; // @[dcache.scala 179:41]
    end else if (3'h1 == reg_bus_state) begin // @[dcache.scala 177:30]
      if (is_hit) begin // @[dcache.scala 238:37]
        reg_cache_write <= _GEN_97;
      end
    end else if (3'h2 == reg_bus_state) begin // @[dcache.scala 177:30]
      reg_cache_write <= _GEN_177;
    end
    if (reset) begin // @[dcache.scala 54:38]
      reg_cache_wstrb <= 16'h0; // @[dcache.scala 54:38]
    end else if (!(3'h0 == reg_bus_state)) begin // @[dcache.scala 177:30]
      if (3'h1 == reg_bus_state) begin // @[dcache.scala 177:30]
        if (reg_offset[3]) begin // @[dcache.scala 176:38]
          reg_cache_wstrb <= _cache_wstrb_T_1;
        end else begin
          reg_cache_wstrb <= _cache_wstrb_T_2;
        end
      end else if (3'h2 == reg_bus_state) begin // @[dcache.scala 177:30]
        reg_cache_wstrb <= _GEN_161;
      end
    end
    if (reset) begin // @[dcache.scala 79:42]
      reg_sram0_valid <= 64'h0; // @[dcache.scala 79:42]
    end else if (!(flush_cache)) begin // @[dcache.scala 89:26]
      if (is_sram0_write) begin // @[dcache.scala 91:35]
        reg_sram0_valid <= _reg_sram0_valid_T; // @[dcache.scala 92:33]
      end
    end
    if (reset) begin // @[dcache.scala 80:42]
      reg_sram1_valid <= 64'h0; // @[dcache.scala 80:42]
    end else if (!(flush_cache)) begin // @[dcache.scala 99:26]
      if (is_sram1_write) begin // @[dcache.scala 101:35]
        reg_sram1_valid <= _reg_sram1_valid_T; // @[dcache.scala 102:41]
      end
    end
    if (reset) begin // @[dcache.scala 81:42]
      reg_sram0_dirty <= 64'h0; // @[dcache.scala 81:42]
    end else if (flush_cache) begin // @[dcache.scala 89:26]
      reg_sram0_dirty <= 64'h0; // @[dcache.scala 90:33]
    end else if (is_sram0_write) begin // @[dcache.scala 91:35]
      if (reg_is_w) begin // @[dcache.scala 93:39]
        reg_sram0_dirty <= _reg_sram0_dirty_T;
      end else begin
        reg_sram0_dirty <= _reg_sram0_dirty_T_1;
      end
    end
    if (reset) begin // @[dcache.scala 82:42]
      reg_sram1_dirty <= 64'h0; // @[dcache.scala 82:42]
    end else if (flush_cache) begin // @[dcache.scala 99:26]
      reg_sram1_dirty <= 64'h0; // @[dcache.scala 100:41]
    end else if (is_sram1_write) begin // @[dcache.scala 101:35]
      if (reg_is_w) begin // @[dcache.scala 103:47]
        reg_sram1_dirty <= _reg_sram1_dirty_T;
      end else begin
        reg_sram1_dirty <= _reg_sram1_dirty_T_1;
      end
    end
    if (reset) begin // @[dcache.scala 87:42]
      flush_cache <= 1'h0; // @[dcache.scala 87:42]
    end else if (3'h0 == reg_bus_state) begin // @[dcache.scala 177:30]
      flush_cache <= 1'h0; // @[dcache.scala 194:41]
    end else if (!(3'h1 == reg_bus_state)) begin // @[dcache.scala 177:30]
      if (!(3'h2 == reg_bus_state)) begin // @[dcache.scala 177:30]
        flush_cache <= _GEN_363;
      end
    end
    if (reset) begin // @[dcache.scala 156:34]
      reg_wdata <= 64'h0; // @[dcache.scala 156:34]
    end else if (3'h0 == reg_bus_state) begin // @[dcache.scala 177:30]
      reg_wdata <= io_dcache_cmd_bits_wdata; // @[dcache.scala 183:49]
    end
    if (reset) begin // @[dcache.scala 157:34]
      reg_wstrb <= 8'h0; // @[dcache.scala 157:34]
    end else if (3'h0 == reg_bus_state) begin // @[dcache.scala 177:30]
      reg_wstrb <= io_dcache_cmd_bits_wstrb; // @[dcache.scala 184:49]
    end
    if (reset) begin // @[dcache.scala 159:38]
      reg_clint_valid <= 1'h0; // @[dcache.scala 159:38]
    end else if (3'h0 == reg_bus_state) begin // @[dcache.scala 177:30]
      if (!(cache_valid)) begin // @[dcache.scala 195:42]
        if (mmio_valid) begin // @[dcache.scala 200:47]
          reg_clint_valid <= clint_valid; // @[dcache.scala 204:49]
        end
      end
    end else if (!(3'h1 == reg_bus_state)) begin // @[dcache.scala 177:30]
      if (!(3'h2 == reg_bus_state)) begin // @[dcache.scala 177:30]
        reg_clint_valid <= _GEN_343;
      end
    end
    if (reset) begin // @[dcache.scala 160:38]
      reg_clint_addr <= 64'h0; // @[dcache.scala 160:38]
    end else if (3'h0 == reg_bus_state) begin // @[dcache.scala 177:30]
      if (!(cache_valid)) begin // @[dcache.scala 195:42]
        if (mmio_valid) begin // @[dcache.scala 200:47]
          reg_clint_addr <= _GEN_29;
        end
      end
    end
    if (reset) begin // @[dcache.scala 161:38]
      reg_clint_wdata <= 64'h0; // @[dcache.scala 161:38]
    end else if (3'h0 == reg_bus_state) begin // @[dcache.scala 177:30]
      if (!(cache_valid)) begin // @[dcache.scala 195:42]
        if (mmio_valid) begin // @[dcache.scala 200:47]
          reg_clint_wdata <= _GEN_30;
        end
      end
    end
    if (reset) begin // @[dcache.scala 162:38]
      reg_clint_is_w <= 1'h0; // @[dcache.scala 162:38]
    end else if (3'h0 == reg_bus_state) begin // @[dcache.scala 177:30]
      if (!(cache_valid)) begin // @[dcache.scala 195:42]
        if (mmio_valid) begin // @[dcache.scala 200:47]
          reg_clint_is_w <= _GEN_31;
        end
      end
    end else if (!(3'h1 == reg_bus_state)) begin // @[dcache.scala 177:30]
      if (!(3'h2 == reg_bus_state)) begin // @[dcache.scala 177:30]
        reg_clint_is_w <= _GEN_344;
      end
    end
    if (reset) begin // @[dcache.scala 164:42]
      reg_fence_data0 <= 128'h0; // @[dcache.scala 164:42]
    end else if (!(3'h0 == reg_bus_state)) begin // @[dcache.scala 177:30]
      if (3'h1 == reg_bus_state) begin // @[dcache.scala 177:30]
        reg_fence_data0 <= _reg_temp_h_rdata01_T_2; // @[dcache.scala 237:49]
      end else if (!(3'h2 == reg_bus_state)) begin // @[dcache.scala 177:30]
        reg_fence_data0 <= _GEN_352;
      end
    end
    if (reset) begin // @[dcache.scala 166:42]
      reg_fence_data1 <= 128'h0; // @[dcache.scala 166:42]
    end else if (!(3'h0 == reg_bus_state)) begin // @[dcache.scala 177:30]
      if (!(3'h1 == reg_bus_state)) begin // @[dcache.scala 177:30]
        if (!(3'h2 == reg_bus_state)) begin // @[dcache.scala 177:30]
          reg_fence_data1 <= _GEN_353;
        end
      end
    end
    if (reset) begin // @[dcache.scala 168:38]
      reg_fence_addr1 <= 64'h0; // @[dcache.scala 168:38]
    end else if (!(3'h0 == reg_bus_state)) begin // @[dcache.scala 177:30]
      if (!(3'h1 == reg_bus_state)) begin // @[dcache.scala 177:30]
        if (!(3'h2 == reg_bus_state)) begin // @[dcache.scala 177:30]
          reg_fence_addr1 <= _GEN_355;
        end
      end
    end
    if (reset) begin // @[dcache.scala 173:42]
      need_two <= 1'h0; // @[dcache.scala 173:42]
    end else if (!(3'h0 == reg_bus_state)) begin // @[dcache.scala 177:30]
      if (!(3'h1 == reg_bus_state)) begin // @[dcache.scala 177:30]
        if (!(3'h2 == reg_bus_state)) begin // @[dcache.scala 177:30]
          need_two <= _GEN_362;
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
  reg_bus_state = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  reg_chosen_tag = _RAND_1[0:0];
  _RAND_2 = {2{`RANDOM}};
  reg_rdata = _RAND_2[63:0];
  _RAND_3 = {1{`RANDOM}};
  reg_valid = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  reg_ready = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  reg_resp_info = _RAND_5[2:0];
  _RAND_6 = {2{`RANDOM}};
  reg_r_raddr = _RAND_6[63:0];
  _RAND_7 = {1{`RANDOM}};
  reg_r_valid = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  reg_r_len = _RAND_8[1:0];
  _RAND_9 = {1{`RANDOM}};
  reg_r_size = _RAND_9[1:0];
  _RAND_10 = {1{`RANDOM}};
  reg_w_valid = _RAND_10[0:0];
  _RAND_11 = {2{`RANDOM}};
  reg_w_waddr = _RAND_11[63:0];
  _RAND_12 = {2{`RANDOM}};
  reg_w_wdata = _RAND_12[63:0];
  _RAND_13 = {1{`RANDOM}};
  reg_w_wlast = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  reg_w_len = _RAND_14[1:0];
  _RAND_15 = {1{`RANDOM}};
  reg_w_size = _RAND_15[1:0];
  _RAND_16 = {1{`RANDOM}};
  reg_w_strb = _RAND_16[7:0];
  _RAND_17 = {1{`RANDOM}};
  reg_cnt = _RAND_17[1:0];
  _RAND_18 = {1{`RANDOM}};
  reg_fence_cnt = _RAND_18[6:0];
  _RAND_19 = {1{`RANDOM}};
  reg_wbus_finish = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  reg_rbus_finish = _RAND_20[0:0];
  _RAND_21 = {2{`RANDOM}};
  reg_cpu_addr = _RAND_21[63:0];
  _RAND_22 = {1{`RANDOM}};
  reg_is_w = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  reg_index = _RAND_23[5:0];
  _RAND_24 = {4{`RANDOM}};
  reg_cache_wdata = _RAND_24[127:0];
  _RAND_25 = {1{`RANDOM}};
  reg_cache_write = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  reg_cache_wstrb = _RAND_26[15:0];
  _RAND_27 = {2{`RANDOM}};
  reg_sram0_valid = _RAND_27[63:0];
  _RAND_28 = {2{`RANDOM}};
  reg_sram1_valid = _RAND_28[63:0];
  _RAND_29 = {2{`RANDOM}};
  reg_sram0_dirty = _RAND_29[63:0];
  _RAND_30 = {2{`RANDOM}};
  reg_sram1_dirty = _RAND_30[63:0];
  _RAND_31 = {1{`RANDOM}};
  flush_cache = _RAND_31[0:0];
  _RAND_32 = {2{`RANDOM}};
  reg_wdata = _RAND_32[63:0];
  _RAND_33 = {1{`RANDOM}};
  reg_wstrb = _RAND_33[7:0];
  _RAND_34 = {1{`RANDOM}};
  reg_clint_valid = _RAND_34[0:0];
  _RAND_35 = {2{`RANDOM}};
  reg_clint_addr = _RAND_35[63:0];
  _RAND_36 = {2{`RANDOM}};
  reg_clint_wdata = _RAND_36[63:0];
  _RAND_37 = {1{`RANDOM}};
  reg_clint_is_w = _RAND_37[0:0];
  _RAND_38 = {4{`RANDOM}};
  reg_fence_data0 = _RAND_38[127:0];
  _RAND_39 = {4{`RANDOM}};
  reg_fence_data1 = _RAND_39[127:0];
  _RAND_40 = {2{`RANDOM}};
  reg_fence_addr1 = _RAND_40[63:0];
  _RAND_41 = {1{`RANDOM}};
  need_two = _RAND_41[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_040318_Crossbar(
  input         clock,
  input         reset,
  input         io_ICache_bus_r_valid,
  input  [63:0] io_ICache_bus_r_bits_raddr,
  input  [1:0]  io_ICache_bus_r_bits_rlen,
  input  [1:0]  io_ICache_bus_r_bits_rsize,
  output [63:0] io_ICache_bus_r_bits_rdata,
  output        io_ICache_bus_r_bits_rlast,
  output        io_ICache_bus_r_ready,
  output        io_DCache_bus_w_ready,
  input         io_DCache_bus_w_valid,
  input  [63:0] io_DCache_bus_w_bits_waddr,
  input  [63:0] io_DCache_bus_w_bits_wdata,
  input         io_DCache_bus_w_bits_wlast,
  input  [1:0]  io_DCache_bus_w_bits_wlen,
  input  [1:0]  io_DCache_bus_w_bits_wsize,
  input  [7:0]  io_DCache_bus_w_bits_wstrb,
  output        io_DCache_bus_b_valid,
  input         io_DCache_bus_r_valid,
  input  [63:0] io_DCache_bus_r_bits_raddr,
  input  [1:0]  io_DCache_bus_r_bits_rlen,
  input  [1:0]  io_DCache_bus_r_bits_rsize,
  output [63:0] io_DCache_bus_r_bits_rdata,
  output        io_DCache_bus_r_bits_rlast,
  output        io_DCache_bus_r_ready,
  input         io_AXI_Bus_aw_ready,
  output        io_AXI_Bus_aw_valid,
  output [63:0] io_AXI_Bus_aw_bits_awaddr,
  output [7:0]  io_AXI_Bus_aw_bits_awlen,
  output [2:0]  io_AXI_Bus_aw_bits_awsize,
  input         io_AXI_Bus_w_ready,
  output        io_AXI_Bus_w_valid,
  output [63:0] io_AXI_Bus_w_bits_wdata,
  output [7:0]  io_AXI_Bus_w_bits_wstrb,
  output        io_AXI_Bus_w_bits_wlast,
  output        io_AXI_Bus_b_ready,
  input         io_AXI_Bus_b_valid,
  input  [3:0]  io_AXI_Bus_b_bits_bid,
  input         io_AXI_Bus_ar_ready,
  output        io_AXI_Bus_ar_valid,
  output [63:0] io_AXI_Bus_ar_bits_araddr,
  output [7:0]  io_AXI_Bus_ar_bits_arlen,
  output [2:0]  io_AXI_Bus_ar_bits_arsize,
  input         io_AXI_Bus_r_valid,
  input  [3:0]  io_AXI_Bus_r_bits_rid,
  input  [63:0] io_AXI_Bus_r_bits_rdata,
  input         io_AXI_Bus_r_bits_rlast
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] reg_r_cnt; // @[simplebus.scala 46:34]
  wire  r_locked = reg_r_cnt != 2'h0; // @[simplebus.scala 47:38]
  reg  r_lockId; // @[simplebus.scala 48:34]
  wire  _T = ~r_locked; // @[simplebus.scala 51:14]
  wire  _GEN_1 = io_ICache_bus_r_valid ? 1'h0 : io_DCache_bus_r_valid; // @[simplebus.scala 52:44 53:41]
  wire  r_chosen = ~r_locked ? _GEN_1 : r_lockId; // @[simplebus.scala 51:24 60:33]
  wire [1:0] _reg_r_cnt_T_1 = io_ICache_bus_r_bits_rlen + 2'h1; // @[simplebus.scala 65:121]
  wire [1:0] _reg_r_cnt_T_4 = io_DCache_bus_r_bits_rlen + 2'h1; // @[simplebus.scala 68:121]
  wire [1:0] _reg_r_cnt_T_5 = io_DCache_bus_r_ready ? io_DCache_bus_r_bits_rlen : _reg_r_cnt_T_4; // @[simplebus.scala 68:47]
  wire  _T_3 = io_ICache_bus_r_valid & io_ICache_bus_r_ready; // @[simplebus.scala 33:40]
  wire [1:0] _reg_r_cnt_T_7 = reg_r_cnt - 2'h1; // @[simplebus.scala 76:54]
  wire  _T_6 = io_DCache_bus_r_valid & io_DCache_bus_r_ready; // @[simplebus.scala 33:40]
  wire  _io_ICache_bus_r_ready_T = ~r_chosen; // @[simplebus.scala 89:54]
  wire  _io_ICache_bus_r_ready_T_2 = io_AXI_Bus_r_bits_rid == 4'h0; // @[simplebus.scala 89:108]
  reg  reg_aw_ok; // @[simplebus.scala 102:32]
  wire  _reg_aw_ok_T = io_AXI_Bus_b_ready & io_AXI_Bus_b_valid; // @[Decoupled.scala 52:35]
  wire  _reg_aw_ok_T_1 = io_AXI_Bus_aw_ready & io_AXI_Bus_aw_valid; // @[Decoupled.scala 52:35]
  reg  reg_ar_ok; // @[simplebus.scala 120:32]
  wire  _reg_ar_ok_T_1 = io_AXI_Bus_ar_ready & io_AXI_Bus_ar_valid; // @[Decoupled.scala 52:35]
  wire  _io_AXI_Bus_ar_valid_T = ~reg_ar_ok; // @[simplebus.scala 130:76]
  wire  _GEN_9 = r_chosen & (io_DCache_bus_r_valid & _io_AXI_Bus_ar_valid_T); // @[simplebus.scala 134:37 135:49 140:49]
  wire [63:0] _GEN_10 = r_chosen ? io_DCache_bus_r_bits_raddr : 64'h0; // @[simplebus.scala 134:37 136:49 141:49]
  wire [1:0] _GEN_11 = r_chosen ? io_DCache_bus_r_bits_rlen : 2'h0; // @[simplebus.scala 134:37 137:49 142:49]
  wire [1:0] _GEN_12 = r_chosen ? io_DCache_bus_r_bits_rsize : 2'h0; // @[simplebus.scala 134:37 138:49 143:49]
  wire [1:0] _GEN_15 = _io_ICache_bus_r_ready_T ? io_ICache_bus_r_bits_rlen : _GEN_11; // @[simplebus.scala 129:31 132:49]
  wire [1:0] _GEN_16 = _io_ICache_bus_r_ready_T ? io_ICache_bus_r_bits_rsize : _GEN_12; // @[simplebus.scala 129:31 133:49]
  assign io_ICache_bus_r_bits_rdata = io_AXI_Bus_r_bits_rdata; // @[simplebus.scala 88:41]
  assign io_ICache_bus_r_bits_rlast = _io_ICache_bus_r_ready_T & io_AXI_Bus_r_bits_rlast; // @[simplebus.scala 90:63]
  assign io_ICache_bus_r_ready = ~r_chosen & io_AXI_Bus_r_valid & io_AXI_Bus_r_bits_rid == 4'h0; // @[simplebus.scala 89:84]
  assign io_DCache_bus_w_ready = io_AXI_Bus_w_ready; // @[simplebus.scala 93:33]
  assign io_DCache_bus_b_valid = io_AXI_Bus_b_valid & io_AXI_Bus_b_bits_bid == 4'h0; // @[simplebus.scala 94:55]
  assign io_DCache_bus_r_bits_rdata = io_AXI_Bus_r_bits_rdata; // @[simplebus.scala 97:41]
  assign io_DCache_bus_r_bits_rlast = r_chosen & io_AXI_Bus_r_bits_rlast; // @[simplebus.scala 98:63]
  assign io_DCache_bus_r_ready = r_chosen & io_AXI_Bus_r_valid & _io_ICache_bus_r_ready_T_2; // @[simplebus.scala 100:84]
  assign io_AXI_Bus_aw_valid = io_DCache_bus_w_valid & ~reg_aw_ok; // @[simplebus.scala 105:66]
  assign io_AXI_Bus_aw_bits_awaddr = io_DCache_bus_w_bits_waddr; // @[simplebus.scala 107:41]
  assign io_AXI_Bus_aw_bits_awlen = {{6'd0}, io_DCache_bus_w_bits_wlen}; // @[simplebus.scala 108:41]
  assign io_AXI_Bus_aw_bits_awsize = {{1'd0}, io_DCache_bus_w_bits_wsize}; // @[simplebus.scala 109:37]
  assign io_AXI_Bus_w_valid = io_DCache_bus_w_valid; // @[simplebus.scala 112:41]
  assign io_AXI_Bus_w_bits_wdata = io_DCache_bus_w_bits_wdata; // @[simplebus.scala 114:33]
  assign io_AXI_Bus_w_bits_wstrb = io_DCache_bus_w_bits_wstrb; // @[simplebus.scala 115:33]
  assign io_AXI_Bus_w_bits_wlast = io_DCache_bus_w_bits_wlast; // @[simplebus.scala 116:33]
  assign io_AXI_Bus_b_ready = 1'h1; // @[simplebus.scala 118:49]
  assign io_AXI_Bus_ar_valid = _io_ICache_bus_r_ready_T ? io_ICache_bus_r_valid & ~reg_ar_ok : _GEN_9; // @[simplebus.scala 129:31 130:49]
  assign io_AXI_Bus_ar_bits_araddr = _io_ICache_bus_r_ready_T ? io_ICache_bus_r_bits_raddr : _GEN_10; // @[simplebus.scala 129:31 131:49]
  assign io_AXI_Bus_ar_bits_arlen = {{6'd0}, _GEN_15};
  assign io_AXI_Bus_ar_bits_arsize = {{1'd0}, _GEN_16};
  always @(posedge clock) begin
    if (reset) begin // @[simplebus.scala 46:34]
      reg_r_cnt <= 2'h0; // @[simplebus.scala 46:34]
    end else if (_T) begin // @[simplebus.scala 63:24]
      if (io_ICache_bus_r_valid) begin // @[simplebus.scala 64:44]
        if (io_ICache_bus_r_ready) begin // @[simplebus.scala 65:47]
          reg_r_cnt <= io_ICache_bus_r_bits_rlen;
        end else begin
          reg_r_cnt <= _reg_r_cnt_T_1;
        end
      end else if (io_DCache_bus_r_valid) begin // @[simplebus.scala 67:50]
        reg_r_cnt <= _reg_r_cnt_T_5; // @[simplebus.scala 68:41]
      end else begin
        reg_r_cnt <= 2'h0; // @[simplebus.scala 71:41]
      end
    end else if (~r_lockId & _T_3) begin // @[simplebus.scala 75:64]
      reg_r_cnt <= _reg_r_cnt_T_7; // @[simplebus.scala 76:41]
    end else if (r_lockId & _T_6) begin // @[simplebus.scala 77:70]
      reg_r_cnt <= _reg_r_cnt_T_7; // @[simplebus.scala 78:41]
    end
    if (reset) begin // @[simplebus.scala 48:34]
      r_lockId <= 1'h0; // @[simplebus.scala 48:34]
    end else if (~r_locked) begin // @[simplebus.scala 51:24]
      if (io_ICache_bus_r_valid) begin // @[simplebus.scala 52:44]
        r_lockId <= 1'h0; // @[simplebus.scala 53:41]
      end else begin
        r_lockId <= io_DCache_bus_r_valid;
      end
    end
    if (reset) begin // @[simplebus.scala 102:32]
      reg_aw_ok <= 1'h0; // @[simplebus.scala 102:32]
    end else if (_reg_aw_ok_T) begin // @[simplebus.scala 103:25]
      reg_aw_ok <= 1'h0;
    end else begin
      reg_aw_ok <= _reg_aw_ok_T_1 | reg_aw_ok;
    end
    if (reset) begin // @[simplebus.scala 120:32]
      reg_ar_ok <= 1'h0; // @[simplebus.scala 120:32]
    end else if (io_AXI_Bus_r_bits_rlast) begin // @[simplebus.scala 121:25]
      reg_ar_ok <= 1'h0;
    end else begin
      reg_ar_ok <= _reg_ar_ok_T_1 | reg_ar_ok;
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
  reg_r_cnt = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  r_lockId = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  reg_aw_ok = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  reg_ar_ok = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_040318_IBuf(
  input         clock,
  input         reset,
  input         io_flush,
  output        io_cache_buf_ready,
  input         io_cache_buf_valid,
  input  [63:0] io_cache_buf_bits_pc,
  input  [31:0] io_cache_buf_bits_inst,
  input         io_cache_buf_bits_is_pre,
  input         io_put_pc_ready,
  output        io_put_pc_valid,
  output [31:0] io_put_pc_bits_inst,
  output [63:0] io_put_pc_bits_pc,
  output        io_put_pc_bits_is_pre
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
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
`endif // RANDOMIZE_REG_INIT
  reg [63:0] ibuf_pc_0; // @[fetch.scala 26:34]
  reg [63:0] ibuf_pc_1; // @[fetch.scala 26:34]
  reg [63:0] ibuf_pc_2; // @[fetch.scala 26:34]
  reg [63:0] ibuf_pc_3; // @[fetch.scala 26:34]
  reg [31:0] ibuf_inst_0; // @[fetch.scala 27:34]
  reg [31:0] ibuf_inst_1; // @[fetch.scala 27:34]
  reg [31:0] ibuf_inst_2; // @[fetch.scala 27:34]
  reg [31:0] ibuf_inst_3; // @[fetch.scala 27:34]
  reg  ibuf_is_pre_0; // @[fetch.scala 28:34]
  reg  ibuf_is_pre_1; // @[fetch.scala 28:34]
  reg  ibuf_is_pre_2; // @[fetch.scala 28:34]
  reg  ibuf_is_pre_3; // @[fetch.scala 28:34]
  reg  ibuf_valid_0; // @[fetch.scala 30:34]
  reg  ibuf_valid_1; // @[fetch.scala 30:34]
  reg  ibuf_valid_2; // @[fetch.scala 30:34]
  reg  ibuf_valid_3; // @[fetch.scala 30:34]
  reg [1:0] reg_head; // @[fetch.scala 31:34]
  reg [1:0] reg_tail; // @[fetch.scala 32:34]
  reg [2:0] reg_ibuf_size; // @[fetch.scala 33:36]
  reg  reg_ready; // @[fetch.scala 34:34]
  wire  enq_size = io_cache_buf_ready & io_cache_buf_valid; // @[Decoupled.scala 52:35]
  wire  _GEN_1 = 2'h1 == reg_tail ? ibuf_valid_1 : ibuf_valid_0; // @[fetch.scala 41:{40,40}]
  wire  _GEN_2 = 2'h2 == reg_tail ? ibuf_valid_2 : _GEN_1; // @[fetch.scala 41:{40,40}]
  wire  _GEN_3 = 2'h3 == reg_tail ? ibuf_valid_3 : _GEN_2; // @[fetch.scala 41:{40,40}]
  wire  can_deq = io_put_pc_ready & _GEN_3; // @[fetch.scala 41:40]
  wire [2:0] _GEN_79 = {{2'd0}, enq_size}; // @[fetch.scala 45:42]
  wire [2:0] _result_size_T_1 = reg_ibuf_size + _GEN_79; // @[fetch.scala 45:42]
  wire [2:0] _GEN_80 = {{2'd0}, can_deq}; // @[fetch.scala 45:53]
  wire [2:0] result_size = _result_size_T_1 - _GEN_80; // @[fetch.scala 45:53]
  wire [1:0] _reg_tail_T_1 = reg_tail + 2'h1; // @[fetch.scala 61:53]
  wire  _GEN_4 = 2'h0 == reg_tail ? 1'h0 : ibuf_valid_0; // @[fetch.scala 30:34 62:{49,49}]
  wire  _GEN_5 = 2'h1 == reg_tail ? 1'h0 : ibuf_valid_1; // @[fetch.scala 30:34 62:{49,49}]
  wire  _GEN_6 = 2'h2 == reg_tail ? 1'h0 : ibuf_valid_2; // @[fetch.scala 30:34 62:{49,49}]
  wire  _GEN_7 = 2'h3 == reg_tail ? 1'h0 : ibuf_valid_3; // @[fetch.scala 30:34 62:{49,49}]
  wire  _GEN_9 = can_deq ? _GEN_4 : ibuf_valid_0; // @[fetch.scala 60:30 30:34]
  wire  _GEN_10 = can_deq ? _GEN_5 : ibuf_valid_1; // @[fetch.scala 60:30 30:34]
  wire  _GEN_11 = can_deq ? _GEN_6 : ibuf_valid_2; // @[fetch.scala 60:30 30:34]
  wire  _GEN_12 = can_deq ? _GEN_7 : ibuf_valid_3; // @[fetch.scala 60:30 30:34]
  wire [1:0] _reg_head_T_1 = reg_head + 2'h1; // @[fetch.scala 65:53]
  wire  _GEN_25 = 2'h0 == reg_head | _GEN_9; // @[fetch.scala 69:{49,49}]
  wire  _GEN_26 = 2'h1 == reg_head | _GEN_10; // @[fetch.scala 69:{49,49}]
  wire  _GEN_27 = 2'h2 == reg_head | _GEN_11; // @[fetch.scala 69:{49,49}]
  wire  _GEN_28 = 2'h3 == reg_head | _GEN_12; // @[fetch.scala 69:{49,49}]
  wire  _GEN_46 = result_size > 3'h3 ? 1'h0 : 1'h1; // @[fetch.scala 72:38 73:41 75:41]
  wire  _GEN_54 = io_flush | _GEN_46; // @[fetch.scala 51:20 58:33]
  wire [63:0] _GEN_68 = 2'h1 == reg_tail ? ibuf_pc_1 : ibuf_pc_0; // @[fetch.scala 82:{33,33}]
  wire [63:0] _GEN_69 = 2'h2 == reg_tail ? ibuf_pc_2 : _GEN_68; // @[fetch.scala 82:{33,33}]
  wire [31:0] _GEN_72 = 2'h1 == reg_tail ? ibuf_inst_1 : ibuf_inst_0; // @[fetch.scala 83:{33,33}]
  wire [31:0] _GEN_73 = 2'h2 == reg_tail ? ibuf_inst_2 : _GEN_72; // @[fetch.scala 83:{33,33}]
  wire  _GEN_76 = 2'h1 == reg_tail ? ibuf_is_pre_1 : ibuf_is_pre_0; // @[fetch.scala 84:{31,31}]
  wire  _GEN_77 = 2'h2 == reg_tail ? ibuf_is_pre_2 : _GEN_76; // @[fetch.scala 84:{31,31}]
  assign io_cache_buf_ready = reg_ready; // @[fetch.scala 79:28]
  assign io_put_pc_valid = 2'h3 == reg_tail ? ibuf_valid_3 : _GEN_2; // @[fetch.scala 41:{40,40}]
  assign io_put_pc_bits_inst = 2'h3 == reg_tail ? ibuf_inst_3 : _GEN_73; // @[fetch.scala 83:{33,33}]
  assign io_put_pc_bits_pc = 2'h3 == reg_tail ? ibuf_pc_3 : _GEN_69; // @[fetch.scala 82:{33,33}]
  assign io_put_pc_bits_is_pre = 2'h3 == reg_tail ? ibuf_is_pre_3 : _GEN_77; // @[fetch.scala 84:{31,31}]
  always @(posedge clock) begin
    if (reset) begin // @[fetch.scala 26:34]
      ibuf_pc_0 <= 64'h0; // @[fetch.scala 26:34]
    end else if (!(io_flush)) begin // @[fetch.scala 51:20]
      if (enq_size) begin // @[fetch.scala 64:28]
        if (2'h0 == reg_head) begin // @[fetch.scala 66:57]
          ibuf_pc_0 <= io_cache_buf_bits_pc; // @[fetch.scala 66:57]
        end
      end
    end
    if (reset) begin // @[fetch.scala 26:34]
      ibuf_pc_1 <= 64'h0; // @[fetch.scala 26:34]
    end else if (!(io_flush)) begin // @[fetch.scala 51:20]
      if (enq_size) begin // @[fetch.scala 64:28]
        if (2'h1 == reg_head) begin // @[fetch.scala 66:57]
          ibuf_pc_1 <= io_cache_buf_bits_pc; // @[fetch.scala 66:57]
        end
      end
    end
    if (reset) begin // @[fetch.scala 26:34]
      ibuf_pc_2 <= 64'h0; // @[fetch.scala 26:34]
    end else if (!(io_flush)) begin // @[fetch.scala 51:20]
      if (enq_size) begin // @[fetch.scala 64:28]
        if (2'h2 == reg_head) begin // @[fetch.scala 66:57]
          ibuf_pc_2 <= io_cache_buf_bits_pc; // @[fetch.scala 66:57]
        end
      end
    end
    if (reset) begin // @[fetch.scala 26:34]
      ibuf_pc_3 <= 64'h0; // @[fetch.scala 26:34]
    end else if (!(io_flush)) begin // @[fetch.scala 51:20]
      if (enq_size) begin // @[fetch.scala 64:28]
        if (2'h3 == reg_head) begin // @[fetch.scala 66:57]
          ibuf_pc_3 <= io_cache_buf_bits_pc; // @[fetch.scala 66:57]
        end
      end
    end
    if (reset) begin // @[fetch.scala 27:34]
      ibuf_inst_0 <= 32'h0; // @[fetch.scala 27:34]
    end else if (!(io_flush)) begin // @[fetch.scala 51:20]
      if (enq_size) begin // @[fetch.scala 64:28]
        if (2'h0 == reg_head) begin // @[fetch.scala 67:57]
          ibuf_inst_0 <= io_cache_buf_bits_inst; // @[fetch.scala 67:57]
        end
      end
    end
    if (reset) begin // @[fetch.scala 27:34]
      ibuf_inst_1 <= 32'h0; // @[fetch.scala 27:34]
    end else if (!(io_flush)) begin // @[fetch.scala 51:20]
      if (enq_size) begin // @[fetch.scala 64:28]
        if (2'h1 == reg_head) begin // @[fetch.scala 67:57]
          ibuf_inst_1 <= io_cache_buf_bits_inst; // @[fetch.scala 67:57]
        end
      end
    end
    if (reset) begin // @[fetch.scala 27:34]
      ibuf_inst_2 <= 32'h0; // @[fetch.scala 27:34]
    end else if (!(io_flush)) begin // @[fetch.scala 51:20]
      if (enq_size) begin // @[fetch.scala 64:28]
        if (2'h2 == reg_head) begin // @[fetch.scala 67:57]
          ibuf_inst_2 <= io_cache_buf_bits_inst; // @[fetch.scala 67:57]
        end
      end
    end
    if (reset) begin // @[fetch.scala 27:34]
      ibuf_inst_3 <= 32'h0; // @[fetch.scala 27:34]
    end else if (!(io_flush)) begin // @[fetch.scala 51:20]
      if (enq_size) begin // @[fetch.scala 64:28]
        if (2'h3 == reg_head) begin // @[fetch.scala 67:57]
          ibuf_inst_3 <= io_cache_buf_bits_inst; // @[fetch.scala 67:57]
        end
      end
    end
    if (reset) begin // @[fetch.scala 28:34]
      ibuf_is_pre_0 <= 1'h0; // @[fetch.scala 28:34]
    end else if (!(io_flush)) begin // @[fetch.scala 51:20]
      if (enq_size) begin // @[fetch.scala 64:28]
        if (2'h0 == reg_head) begin // @[fetch.scala 68:49]
          ibuf_is_pre_0 <= io_cache_buf_bits_is_pre; // @[fetch.scala 68:49]
        end
      end
    end
    if (reset) begin // @[fetch.scala 28:34]
      ibuf_is_pre_1 <= 1'h0; // @[fetch.scala 28:34]
    end else if (!(io_flush)) begin // @[fetch.scala 51:20]
      if (enq_size) begin // @[fetch.scala 64:28]
        if (2'h1 == reg_head) begin // @[fetch.scala 68:49]
          ibuf_is_pre_1 <= io_cache_buf_bits_is_pre; // @[fetch.scala 68:49]
        end
      end
    end
    if (reset) begin // @[fetch.scala 28:34]
      ibuf_is_pre_2 <= 1'h0; // @[fetch.scala 28:34]
    end else if (!(io_flush)) begin // @[fetch.scala 51:20]
      if (enq_size) begin // @[fetch.scala 64:28]
        if (2'h2 == reg_head) begin // @[fetch.scala 68:49]
          ibuf_is_pre_2 <= io_cache_buf_bits_is_pre; // @[fetch.scala 68:49]
        end
      end
    end
    if (reset) begin // @[fetch.scala 28:34]
      ibuf_is_pre_3 <= 1'h0; // @[fetch.scala 28:34]
    end else if (!(io_flush)) begin // @[fetch.scala 51:20]
      if (enq_size) begin // @[fetch.scala 64:28]
        if (2'h3 == reg_head) begin // @[fetch.scala 68:49]
          ibuf_is_pre_3 <= io_cache_buf_bits_is_pre; // @[fetch.scala 68:49]
        end
      end
    end
    if (reset) begin // @[fetch.scala 30:34]
      ibuf_valid_0 <= 1'h0; // @[fetch.scala 30:34]
    end else if (io_flush) begin // @[fetch.scala 51:20]
      ibuf_valid_0 <= 1'h0; // @[fetch.scala 56:39]
    end else if (enq_size) begin // @[fetch.scala 64:28]
      ibuf_valid_0 <= _GEN_25;
    end else if (can_deq) begin // @[fetch.scala 60:30]
      ibuf_valid_0 <= _GEN_4;
    end
    if (reset) begin // @[fetch.scala 30:34]
      ibuf_valid_1 <= 1'h0; // @[fetch.scala 30:34]
    end else if (io_flush) begin // @[fetch.scala 51:20]
      ibuf_valid_1 <= 1'h0; // @[fetch.scala 56:39]
    end else if (enq_size) begin // @[fetch.scala 64:28]
      ibuf_valid_1 <= _GEN_26;
    end else if (can_deq) begin // @[fetch.scala 60:30]
      ibuf_valid_1 <= _GEN_5;
    end
    if (reset) begin // @[fetch.scala 30:34]
      ibuf_valid_2 <= 1'h0; // @[fetch.scala 30:34]
    end else if (io_flush) begin // @[fetch.scala 51:20]
      ibuf_valid_2 <= 1'h0; // @[fetch.scala 56:39]
    end else if (enq_size) begin // @[fetch.scala 64:28]
      ibuf_valid_2 <= _GEN_27;
    end else if (can_deq) begin // @[fetch.scala 60:30]
      ibuf_valid_2 <= _GEN_6;
    end
    if (reset) begin // @[fetch.scala 30:34]
      ibuf_valid_3 <= 1'h0; // @[fetch.scala 30:34]
    end else if (io_flush) begin // @[fetch.scala 51:20]
      ibuf_valid_3 <= 1'h0; // @[fetch.scala 56:39]
    end else if (enq_size) begin // @[fetch.scala 64:28]
      ibuf_valid_3 <= _GEN_28;
    end else if (can_deq) begin // @[fetch.scala 60:30]
      ibuf_valid_3 <= _GEN_7;
    end
    if (reset) begin // @[fetch.scala 31:34]
      reg_head <= 2'h0; // @[fetch.scala 31:34]
    end else if (io_flush) begin // @[fetch.scala 51:20]
      reg_head <= 2'h0; // @[fetch.scala 52:33]
    end else if (enq_size) begin // @[fetch.scala 64:28]
      reg_head <= _reg_head_T_1; // @[fetch.scala 65:41]
    end
    if (reset) begin // @[fetch.scala 32:34]
      reg_tail <= 2'h0; // @[fetch.scala 32:34]
    end else if (io_flush) begin // @[fetch.scala 51:20]
      reg_tail <= 2'h0; // @[fetch.scala 53:33]
    end else if (can_deq) begin // @[fetch.scala 60:30]
      reg_tail <= _reg_tail_T_1; // @[fetch.scala 61:41]
    end
    if (reset) begin // @[fetch.scala 33:36]
      reg_ibuf_size <= 3'h0; // @[fetch.scala 33:36]
    end else if (io_flush) begin // @[fetch.scala 51:20]
      reg_ibuf_size <= 3'h0; // @[fetch.scala 54:31]
    end else begin
      reg_ibuf_size <= result_size; // @[fetch.scala 71:33]
    end
    reg_ready <= reset | _GEN_54; // @[fetch.scala 34:{34,34}]
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
  ibuf_pc_0 = _RAND_0[63:0];
  _RAND_1 = {2{`RANDOM}};
  ibuf_pc_1 = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  ibuf_pc_2 = _RAND_2[63:0];
  _RAND_3 = {2{`RANDOM}};
  ibuf_pc_3 = _RAND_3[63:0];
  _RAND_4 = {1{`RANDOM}};
  ibuf_inst_0 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  ibuf_inst_1 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  ibuf_inst_2 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  ibuf_inst_3 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  ibuf_is_pre_0 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  ibuf_is_pre_1 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  ibuf_is_pre_2 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  ibuf_is_pre_3 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  ibuf_valid_0 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  ibuf_valid_1 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  ibuf_valid_2 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  ibuf_valid_3 = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  reg_head = _RAND_16[1:0];
  _RAND_17 = {1{`RANDOM}};
  reg_tail = _RAND_17[1:0];
  _RAND_18 = {1{`RANDOM}};
  reg_ibuf_size = _RAND_18[2:0];
  _RAND_19 = {1{`RANDOM}};
  reg_ready = _RAND_19[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_040318_Br_predictor(
  input         clock,
  input         reset,
  input         io_br_info_valid,
  input         io_br_info_mispredict,
  input  [63:0] io_br_info_br_pc,
  input         io_br_info_taken,
  input  [63:0] io_br_info_target_next_pc,
  input  [1:0]  io_br_info_br_type,
  input  [63:0] io_pc,
  output [63:0] io_pre_next_pc,
  output        io_pre_valid
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
  reg [63:0] _RAND_32;
  reg [63:0] _RAND_33;
  reg [63:0] _RAND_34;
  reg [63:0] _RAND_35;
  reg [63:0] _RAND_36;
  reg [63:0] _RAND_37;
  reg [63:0] _RAND_38;
  reg [63:0] _RAND_39;
  reg [63:0] _RAND_40;
  reg [63:0] _RAND_41;
  reg [63:0] _RAND_42;
  reg [63:0] _RAND_43;
  reg [63:0] _RAND_44;
  reg [63:0] _RAND_45;
  reg [63:0] _RAND_46;
  reg [63:0] _RAND_47;
  reg [63:0] _RAND_48;
  reg [63:0] _RAND_49;
  reg [63:0] _RAND_50;
  reg [63:0] _RAND_51;
  reg [63:0] _RAND_52;
  reg [63:0] _RAND_53;
  reg [63:0] _RAND_54;
  reg [63:0] _RAND_55;
  reg [63:0] _RAND_56;
  reg [63:0] _RAND_57;
  reg [63:0] _RAND_58;
  reg [63:0] _RAND_59;
  reg [63:0] _RAND_60;
  reg [63:0] _RAND_61;
  reg [63:0] _RAND_62;
  reg [63:0] _RAND_63;
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
`endif // RANDOMIZE_REG_INIT
  reg [59:0] BTB_0; // @[br_predictor.scala 33:26]
  reg [59:0] BTB_1; // @[br_predictor.scala 33:26]
  reg [59:0] BTB_2; // @[br_predictor.scala 33:26]
  reg [59:0] BTB_3; // @[br_predictor.scala 33:26]
  reg [59:0] BTB_4; // @[br_predictor.scala 33:26]
  reg [59:0] BTB_5; // @[br_predictor.scala 33:26]
  reg [59:0] BTB_6; // @[br_predictor.scala 33:26]
  reg [59:0] BTB_7; // @[br_predictor.scala 33:26]
  reg [59:0] BTB_8; // @[br_predictor.scala 33:26]
  reg [59:0] BTB_9; // @[br_predictor.scala 33:26]
  reg [59:0] BTB_10; // @[br_predictor.scala 33:26]
  reg [59:0] BTB_11; // @[br_predictor.scala 33:26]
  reg [59:0] BTB_12; // @[br_predictor.scala 33:26]
  reg [59:0] BTB_13; // @[br_predictor.scala 33:26]
  reg [59:0] BTB_14; // @[br_predictor.scala 33:26]
  reg [59:0] BTB_15; // @[br_predictor.scala 33:26]
  reg [59:0] BTB_16; // @[br_predictor.scala 33:26]
  reg [59:0] BTB_17; // @[br_predictor.scala 33:26]
  reg [59:0] BTB_18; // @[br_predictor.scala 33:26]
  reg [59:0] BTB_19; // @[br_predictor.scala 33:26]
  reg [59:0] BTB_20; // @[br_predictor.scala 33:26]
  reg [59:0] BTB_21; // @[br_predictor.scala 33:26]
  reg [59:0] BTB_22; // @[br_predictor.scala 33:26]
  reg [59:0] BTB_23; // @[br_predictor.scala 33:26]
  reg [59:0] BTB_24; // @[br_predictor.scala 33:26]
  reg [59:0] BTB_25; // @[br_predictor.scala 33:26]
  reg [59:0] BTB_26; // @[br_predictor.scala 33:26]
  reg [59:0] BTB_27; // @[br_predictor.scala 33:26]
  reg [59:0] BTB_28; // @[br_predictor.scala 33:26]
  reg [59:0] BTB_29; // @[br_predictor.scala 33:26]
  reg [59:0] BTB_30; // @[br_predictor.scala 33:26]
  reg [59:0] BTB_31; // @[br_predictor.scala 33:26]
  reg [59:0] BTB_32; // @[br_predictor.scala 33:26]
  reg [59:0] BTB_33; // @[br_predictor.scala 33:26]
  reg [59:0] BTB_34; // @[br_predictor.scala 33:26]
  reg [59:0] BTB_35; // @[br_predictor.scala 33:26]
  reg [59:0] BTB_36; // @[br_predictor.scala 33:26]
  reg [59:0] BTB_37; // @[br_predictor.scala 33:26]
  reg [59:0] BTB_38; // @[br_predictor.scala 33:26]
  reg [59:0] BTB_39; // @[br_predictor.scala 33:26]
  reg [59:0] BTB_40; // @[br_predictor.scala 33:26]
  reg [59:0] BTB_41; // @[br_predictor.scala 33:26]
  reg [59:0] BTB_42; // @[br_predictor.scala 33:26]
  reg [59:0] BTB_43; // @[br_predictor.scala 33:26]
  reg [59:0] BTB_44; // @[br_predictor.scala 33:26]
  reg [59:0] BTB_45; // @[br_predictor.scala 33:26]
  reg [59:0] BTB_46; // @[br_predictor.scala 33:26]
  reg [59:0] BTB_47; // @[br_predictor.scala 33:26]
  reg [59:0] BTB_48; // @[br_predictor.scala 33:26]
  reg [59:0] BTB_49; // @[br_predictor.scala 33:26]
  reg [59:0] BTB_50; // @[br_predictor.scala 33:26]
  reg [59:0] BTB_51; // @[br_predictor.scala 33:26]
  reg [59:0] BTB_52; // @[br_predictor.scala 33:26]
  reg [59:0] BTB_53; // @[br_predictor.scala 33:26]
  reg [59:0] BTB_54; // @[br_predictor.scala 33:26]
  reg [59:0] BTB_55; // @[br_predictor.scala 33:26]
  reg [59:0] BTB_56; // @[br_predictor.scala 33:26]
  reg [59:0] BTB_57; // @[br_predictor.scala 33:26]
  reg [59:0] BTB_58; // @[br_predictor.scala 33:26]
  reg [59:0] BTB_59; // @[br_predictor.scala 33:26]
  reg [59:0] BTB_60; // @[br_predictor.scala 33:26]
  reg [59:0] BTB_61; // @[br_predictor.scala 33:26]
  reg [59:0] BTB_62; // @[br_predictor.scala 33:26]
  reg [59:0] BTB_63; // @[br_predictor.scala 33:26]
  reg [31:0] RAS_0; // @[br_predictor.scala 34:26]
  reg [31:0] RAS_1; // @[br_predictor.scala 34:26]
  reg [31:0] RAS_2; // @[br_predictor.scala 34:26]
  reg [31:0] RAS_3; // @[br_predictor.scala 34:26]
  reg [31:0] RAS_4; // @[br_predictor.scala 34:26]
  reg [31:0] RAS_5; // @[br_predictor.scala 34:26]
  reg [31:0] RAS_6; // @[br_predictor.scala 34:26]
  reg [31:0] RAS_7; // @[br_predictor.scala 34:26]
  reg [1:0] PHT_0; // @[br_predictor.scala 35:26]
  reg [1:0] PHT_1; // @[br_predictor.scala 35:26]
  reg [1:0] PHT_2; // @[br_predictor.scala 35:26]
  reg [1:0] PHT_3; // @[br_predictor.scala 35:26]
  reg [1:0] PHT_4; // @[br_predictor.scala 35:26]
  reg [1:0] PHT_5; // @[br_predictor.scala 35:26]
  reg [1:0] PHT_6; // @[br_predictor.scala 35:26]
  reg [1:0] PHT_7; // @[br_predictor.scala 35:26]
  reg [1:0] PHT_8; // @[br_predictor.scala 35:26]
  reg [1:0] PHT_9; // @[br_predictor.scala 35:26]
  reg [1:0] PHT_10; // @[br_predictor.scala 35:26]
  reg [1:0] PHT_11; // @[br_predictor.scala 35:26]
  reg [1:0] PHT_12; // @[br_predictor.scala 35:26]
  reg [1:0] PHT_13; // @[br_predictor.scala 35:26]
  reg [1:0] PHT_14; // @[br_predictor.scala 35:26]
  reg [1:0] PHT_15; // @[br_predictor.scala 35:26]
  reg [1:0] PHT_16; // @[br_predictor.scala 35:26]
  reg [1:0] PHT_17; // @[br_predictor.scala 35:26]
  reg [1:0] PHT_18; // @[br_predictor.scala 35:26]
  reg [1:0] PHT_19; // @[br_predictor.scala 35:26]
  reg [1:0] PHT_20; // @[br_predictor.scala 35:26]
  reg [1:0] PHT_21; // @[br_predictor.scala 35:26]
  reg [1:0] PHT_22; // @[br_predictor.scala 35:26]
  reg [1:0] PHT_23; // @[br_predictor.scala 35:26]
  reg [1:0] PHT_24; // @[br_predictor.scala 35:26]
  reg [1:0] PHT_25; // @[br_predictor.scala 35:26]
  reg [1:0] PHT_26; // @[br_predictor.scala 35:26]
  reg [1:0] PHT_27; // @[br_predictor.scala 35:26]
  reg [1:0] PHT_28; // @[br_predictor.scala 35:26]
  reg [1:0] PHT_29; // @[br_predictor.scala 35:26]
  reg [1:0] PHT_30; // @[br_predictor.scala 35:26]
  reg [1:0] PHT_31; // @[br_predictor.scala 35:26]
  reg [1:0] PHT_32; // @[br_predictor.scala 35:26]
  reg [1:0] PHT_33; // @[br_predictor.scala 35:26]
  reg [1:0] PHT_34; // @[br_predictor.scala 35:26]
  reg [1:0] PHT_35; // @[br_predictor.scala 35:26]
  reg [1:0] PHT_36; // @[br_predictor.scala 35:26]
  reg [1:0] PHT_37; // @[br_predictor.scala 35:26]
  reg [1:0] PHT_38; // @[br_predictor.scala 35:26]
  reg [1:0] PHT_39; // @[br_predictor.scala 35:26]
  reg [1:0] PHT_40; // @[br_predictor.scala 35:26]
  reg [1:0] PHT_41; // @[br_predictor.scala 35:26]
  reg [1:0] PHT_42; // @[br_predictor.scala 35:26]
  reg [1:0] PHT_43; // @[br_predictor.scala 35:26]
  reg [1:0] PHT_44; // @[br_predictor.scala 35:26]
  reg [1:0] PHT_45; // @[br_predictor.scala 35:26]
  reg [1:0] PHT_46; // @[br_predictor.scala 35:26]
  reg [1:0] PHT_47; // @[br_predictor.scala 35:26]
  reg [1:0] PHT_48; // @[br_predictor.scala 35:26]
  reg [1:0] PHT_49; // @[br_predictor.scala 35:26]
  reg [1:0] PHT_50; // @[br_predictor.scala 35:26]
  reg [1:0] PHT_51; // @[br_predictor.scala 35:26]
  reg [1:0] PHT_52; // @[br_predictor.scala 35:26]
  reg [1:0] PHT_53; // @[br_predictor.scala 35:26]
  reg [1:0] PHT_54; // @[br_predictor.scala 35:26]
  reg [1:0] PHT_55; // @[br_predictor.scala 35:26]
  reg [1:0] PHT_56; // @[br_predictor.scala 35:26]
  reg [1:0] PHT_57; // @[br_predictor.scala 35:26]
  reg [1:0] PHT_58; // @[br_predictor.scala 35:26]
  reg [1:0] PHT_59; // @[br_predictor.scala 35:26]
  reg [1:0] PHT_60; // @[br_predictor.scala 35:26]
  reg [1:0] PHT_61; // @[br_predictor.scala 35:26]
  reg [1:0] PHT_62; // @[br_predictor.scala 35:26]
  reg [1:0] PHT_63; // @[br_predictor.scala 35:26]
  reg [2:0] reg_head; // @[br_predictor.scala 36:31]
  wire [31:0] update_target_pc = io_br_info_target_next_pc[31:0]; // @[br_predictor.scala 44:57]
  wire [5:0] update_index = io_br_info_br_pc[8:3]; // @[br_predictor.scala 45:40]
  wire [58:0] update_btb_data = {1'h1,io_br_info_br_pc[31:9],io_br_info_br_pc[2],update_target_pc,io_br_info_br_type}; // @[Cat.scala 33:92]
  wire [1:0] _GEN_1 = 6'h1 == update_index ? PHT_1 : PHT_0; // @[br_predictor.scala 52:{70,70}]
  wire [1:0] _GEN_2 = 6'h2 == update_index ? PHT_2 : _GEN_1; // @[br_predictor.scala 52:{70,70}]
  wire [1:0] _GEN_3 = 6'h3 == update_index ? PHT_3 : _GEN_2; // @[br_predictor.scala 52:{70,70}]
  wire [1:0] _GEN_4 = 6'h4 == update_index ? PHT_4 : _GEN_3; // @[br_predictor.scala 52:{70,70}]
  wire [1:0] _GEN_5 = 6'h5 == update_index ? PHT_5 : _GEN_4; // @[br_predictor.scala 52:{70,70}]
  wire [1:0] _GEN_6 = 6'h6 == update_index ? PHT_6 : _GEN_5; // @[br_predictor.scala 52:{70,70}]
  wire [1:0] _GEN_7 = 6'h7 == update_index ? PHT_7 : _GEN_6; // @[br_predictor.scala 52:{70,70}]
  wire [1:0] _GEN_8 = 6'h8 == update_index ? PHT_8 : _GEN_7; // @[br_predictor.scala 52:{70,70}]
  wire [1:0] _GEN_9 = 6'h9 == update_index ? PHT_9 : _GEN_8; // @[br_predictor.scala 52:{70,70}]
  wire [1:0] _GEN_10 = 6'ha == update_index ? PHT_10 : _GEN_9; // @[br_predictor.scala 52:{70,70}]
  wire [1:0] _GEN_11 = 6'hb == update_index ? PHT_11 : _GEN_10; // @[br_predictor.scala 52:{70,70}]
  wire [1:0] _GEN_12 = 6'hc == update_index ? PHT_12 : _GEN_11; // @[br_predictor.scala 52:{70,70}]
  wire [1:0] _GEN_13 = 6'hd == update_index ? PHT_13 : _GEN_12; // @[br_predictor.scala 52:{70,70}]
  wire [1:0] _GEN_14 = 6'he == update_index ? PHT_14 : _GEN_13; // @[br_predictor.scala 52:{70,70}]
  wire [1:0] _GEN_15 = 6'hf == update_index ? PHT_15 : _GEN_14; // @[br_predictor.scala 52:{70,70}]
  wire [1:0] _GEN_16 = 6'h10 == update_index ? PHT_16 : _GEN_15; // @[br_predictor.scala 52:{70,70}]
  wire [1:0] _GEN_17 = 6'h11 == update_index ? PHT_17 : _GEN_16; // @[br_predictor.scala 52:{70,70}]
  wire [1:0] _GEN_18 = 6'h12 == update_index ? PHT_18 : _GEN_17; // @[br_predictor.scala 52:{70,70}]
  wire [1:0] _GEN_19 = 6'h13 == update_index ? PHT_19 : _GEN_18; // @[br_predictor.scala 52:{70,70}]
  wire [1:0] _GEN_20 = 6'h14 == update_index ? PHT_20 : _GEN_19; // @[br_predictor.scala 52:{70,70}]
  wire [1:0] _GEN_21 = 6'h15 == update_index ? PHT_21 : _GEN_20; // @[br_predictor.scala 52:{70,70}]
  wire [1:0] _GEN_22 = 6'h16 == update_index ? PHT_22 : _GEN_21; // @[br_predictor.scala 52:{70,70}]
  wire [1:0] _GEN_23 = 6'h17 == update_index ? PHT_23 : _GEN_22; // @[br_predictor.scala 52:{70,70}]
  wire [1:0] _GEN_24 = 6'h18 == update_index ? PHT_24 : _GEN_23; // @[br_predictor.scala 52:{70,70}]
  wire [1:0] _GEN_25 = 6'h19 == update_index ? PHT_25 : _GEN_24; // @[br_predictor.scala 52:{70,70}]
  wire [1:0] _GEN_26 = 6'h1a == update_index ? PHT_26 : _GEN_25; // @[br_predictor.scala 52:{70,70}]
  wire [1:0] _GEN_27 = 6'h1b == update_index ? PHT_27 : _GEN_26; // @[br_predictor.scala 52:{70,70}]
  wire [1:0] _GEN_28 = 6'h1c == update_index ? PHT_28 : _GEN_27; // @[br_predictor.scala 52:{70,70}]
  wire [1:0] _GEN_29 = 6'h1d == update_index ? PHT_29 : _GEN_28; // @[br_predictor.scala 52:{70,70}]
  wire [1:0] _GEN_30 = 6'h1e == update_index ? PHT_30 : _GEN_29; // @[br_predictor.scala 52:{70,70}]
  wire [1:0] _GEN_31 = 6'h1f == update_index ? PHT_31 : _GEN_30; // @[br_predictor.scala 52:{70,70}]
  wire [1:0] _GEN_32 = 6'h20 == update_index ? PHT_32 : _GEN_31; // @[br_predictor.scala 52:{70,70}]
  wire [1:0] _GEN_33 = 6'h21 == update_index ? PHT_33 : _GEN_32; // @[br_predictor.scala 52:{70,70}]
  wire [1:0] _GEN_34 = 6'h22 == update_index ? PHT_34 : _GEN_33; // @[br_predictor.scala 52:{70,70}]
  wire [1:0] _GEN_35 = 6'h23 == update_index ? PHT_35 : _GEN_34; // @[br_predictor.scala 52:{70,70}]
  wire [1:0] _GEN_36 = 6'h24 == update_index ? PHT_36 : _GEN_35; // @[br_predictor.scala 52:{70,70}]
  wire [1:0] _GEN_37 = 6'h25 == update_index ? PHT_37 : _GEN_36; // @[br_predictor.scala 52:{70,70}]
  wire [1:0] _GEN_38 = 6'h26 == update_index ? PHT_38 : _GEN_37; // @[br_predictor.scala 52:{70,70}]
  wire [1:0] _GEN_39 = 6'h27 == update_index ? PHT_39 : _GEN_38; // @[br_predictor.scala 52:{70,70}]
  wire [1:0] _GEN_40 = 6'h28 == update_index ? PHT_40 : _GEN_39; // @[br_predictor.scala 52:{70,70}]
  wire [1:0] _GEN_41 = 6'h29 == update_index ? PHT_41 : _GEN_40; // @[br_predictor.scala 52:{70,70}]
  wire [1:0] _GEN_42 = 6'h2a == update_index ? PHT_42 : _GEN_41; // @[br_predictor.scala 52:{70,70}]
  wire [1:0] _GEN_43 = 6'h2b == update_index ? PHT_43 : _GEN_42; // @[br_predictor.scala 52:{70,70}]
  wire [1:0] _GEN_44 = 6'h2c == update_index ? PHT_44 : _GEN_43; // @[br_predictor.scala 52:{70,70}]
  wire [1:0] _GEN_45 = 6'h2d == update_index ? PHT_45 : _GEN_44; // @[br_predictor.scala 52:{70,70}]
  wire [1:0] _GEN_46 = 6'h2e == update_index ? PHT_46 : _GEN_45; // @[br_predictor.scala 52:{70,70}]
  wire [1:0] _GEN_47 = 6'h2f == update_index ? PHT_47 : _GEN_46; // @[br_predictor.scala 52:{70,70}]
  wire [1:0] _GEN_48 = 6'h30 == update_index ? PHT_48 : _GEN_47; // @[br_predictor.scala 52:{70,70}]
  wire [1:0] _GEN_49 = 6'h31 == update_index ? PHT_49 : _GEN_48; // @[br_predictor.scala 52:{70,70}]
  wire [1:0] _GEN_50 = 6'h32 == update_index ? PHT_50 : _GEN_49; // @[br_predictor.scala 52:{70,70}]
  wire [1:0] _GEN_51 = 6'h33 == update_index ? PHT_51 : _GEN_50; // @[br_predictor.scala 52:{70,70}]
  wire [1:0] _GEN_52 = 6'h34 == update_index ? PHT_52 : _GEN_51; // @[br_predictor.scala 52:{70,70}]
  wire [1:0] _GEN_53 = 6'h35 == update_index ? PHT_53 : _GEN_52; // @[br_predictor.scala 52:{70,70}]
  wire [1:0] _GEN_54 = 6'h36 == update_index ? PHT_54 : _GEN_53; // @[br_predictor.scala 52:{70,70}]
  wire [1:0] _GEN_55 = 6'h37 == update_index ? PHT_55 : _GEN_54; // @[br_predictor.scala 52:{70,70}]
  wire [1:0] _GEN_56 = 6'h38 == update_index ? PHT_56 : _GEN_55; // @[br_predictor.scala 52:{70,70}]
  wire [1:0] _GEN_57 = 6'h39 == update_index ? PHT_57 : _GEN_56; // @[br_predictor.scala 52:{70,70}]
  wire [1:0] _GEN_58 = 6'h3a == update_index ? PHT_58 : _GEN_57; // @[br_predictor.scala 52:{70,70}]
  wire [1:0] _GEN_59 = 6'h3b == update_index ? PHT_59 : _GEN_58; // @[br_predictor.scala 52:{70,70}]
  wire [1:0] _GEN_60 = 6'h3c == update_index ? PHT_60 : _GEN_59; // @[br_predictor.scala 52:{70,70}]
  wire [1:0] _GEN_61 = 6'h3d == update_index ? PHT_61 : _GEN_60; // @[br_predictor.scala 52:{70,70}]
  wire [1:0] _GEN_62 = 6'h3e == update_index ? PHT_62 : _GEN_61; // @[br_predictor.scala 52:{70,70}]
  wire [1:0] _GEN_63 = 6'h3f == update_index ? PHT_63 : _GEN_62; // @[br_predictor.scala 52:{70,70}]
  wire [1:0] _chage_pht_counter_T_2 = _GEN_63 + 2'h1; // @[br_predictor.scala 52:114]
  wire [1:0] _chage_pht_counter_T_3 = _GEN_63 == 2'h3 ? _GEN_63 : _chage_pht_counter_T_2; // @[br_predictor.scala 52:53]
  wire [1:0] _chage_pht_counter_T_6 = _GEN_63 - 2'h1; // @[br_predictor.scala 52:185]
  wire [1:0] _chage_pht_counter_T_7 = _GEN_63 == 2'h0 ? _GEN_63 : _chage_pht_counter_T_6; // @[br_predictor.scala 52:124]
  wire [59:0] _BTB_update_index = {{1'd0}, update_btb_data}; // @[br_predictor.scala 56:{43,43}]
  wire [5:0] index = io_pc[8:3]; // @[br_predictor.scala 62:29]
  wire [23:0] tag = {io_pc[31:9],io_pc[2]}; // @[Cat.scala 33:92]
  wire [1:0] _GEN_385 = 6'h1 == index ? PHT_1 : PHT_0; // @[br_predictor.scala 67:{35,35}]
  wire [1:0] _GEN_386 = 6'h2 == index ? PHT_2 : _GEN_385; // @[br_predictor.scala 67:{35,35}]
  wire [1:0] _GEN_387 = 6'h3 == index ? PHT_3 : _GEN_386; // @[br_predictor.scala 67:{35,35}]
  wire [1:0] _GEN_388 = 6'h4 == index ? PHT_4 : _GEN_387; // @[br_predictor.scala 67:{35,35}]
  wire [1:0] _GEN_389 = 6'h5 == index ? PHT_5 : _GEN_388; // @[br_predictor.scala 67:{35,35}]
  wire [1:0] _GEN_390 = 6'h6 == index ? PHT_6 : _GEN_389; // @[br_predictor.scala 67:{35,35}]
  wire [1:0] _GEN_391 = 6'h7 == index ? PHT_7 : _GEN_390; // @[br_predictor.scala 67:{35,35}]
  wire [1:0] _GEN_392 = 6'h8 == index ? PHT_8 : _GEN_391; // @[br_predictor.scala 67:{35,35}]
  wire [1:0] _GEN_393 = 6'h9 == index ? PHT_9 : _GEN_392; // @[br_predictor.scala 67:{35,35}]
  wire [1:0] _GEN_394 = 6'ha == index ? PHT_10 : _GEN_393; // @[br_predictor.scala 67:{35,35}]
  wire [1:0] _GEN_395 = 6'hb == index ? PHT_11 : _GEN_394; // @[br_predictor.scala 67:{35,35}]
  wire [1:0] _GEN_396 = 6'hc == index ? PHT_12 : _GEN_395; // @[br_predictor.scala 67:{35,35}]
  wire [1:0] _GEN_397 = 6'hd == index ? PHT_13 : _GEN_396; // @[br_predictor.scala 67:{35,35}]
  wire [1:0] _GEN_398 = 6'he == index ? PHT_14 : _GEN_397; // @[br_predictor.scala 67:{35,35}]
  wire [1:0] _GEN_399 = 6'hf == index ? PHT_15 : _GEN_398; // @[br_predictor.scala 67:{35,35}]
  wire [1:0] _GEN_400 = 6'h10 == index ? PHT_16 : _GEN_399; // @[br_predictor.scala 67:{35,35}]
  wire [1:0] _GEN_401 = 6'h11 == index ? PHT_17 : _GEN_400; // @[br_predictor.scala 67:{35,35}]
  wire [1:0] _GEN_402 = 6'h12 == index ? PHT_18 : _GEN_401; // @[br_predictor.scala 67:{35,35}]
  wire [1:0] _GEN_403 = 6'h13 == index ? PHT_19 : _GEN_402; // @[br_predictor.scala 67:{35,35}]
  wire [1:0] _GEN_404 = 6'h14 == index ? PHT_20 : _GEN_403; // @[br_predictor.scala 67:{35,35}]
  wire [1:0] _GEN_405 = 6'h15 == index ? PHT_21 : _GEN_404; // @[br_predictor.scala 67:{35,35}]
  wire [1:0] _GEN_406 = 6'h16 == index ? PHT_22 : _GEN_405; // @[br_predictor.scala 67:{35,35}]
  wire [1:0] _GEN_407 = 6'h17 == index ? PHT_23 : _GEN_406; // @[br_predictor.scala 67:{35,35}]
  wire [1:0] _GEN_408 = 6'h18 == index ? PHT_24 : _GEN_407; // @[br_predictor.scala 67:{35,35}]
  wire [1:0] _GEN_409 = 6'h19 == index ? PHT_25 : _GEN_408; // @[br_predictor.scala 67:{35,35}]
  wire [1:0] _GEN_410 = 6'h1a == index ? PHT_26 : _GEN_409; // @[br_predictor.scala 67:{35,35}]
  wire [1:0] _GEN_411 = 6'h1b == index ? PHT_27 : _GEN_410; // @[br_predictor.scala 67:{35,35}]
  wire [1:0] _GEN_412 = 6'h1c == index ? PHT_28 : _GEN_411; // @[br_predictor.scala 67:{35,35}]
  wire [1:0] _GEN_413 = 6'h1d == index ? PHT_29 : _GEN_412; // @[br_predictor.scala 67:{35,35}]
  wire [1:0] _GEN_414 = 6'h1e == index ? PHT_30 : _GEN_413; // @[br_predictor.scala 67:{35,35}]
  wire [1:0] _GEN_415 = 6'h1f == index ? PHT_31 : _GEN_414; // @[br_predictor.scala 67:{35,35}]
  wire [1:0] _GEN_416 = 6'h20 == index ? PHT_32 : _GEN_415; // @[br_predictor.scala 67:{35,35}]
  wire [1:0] _GEN_417 = 6'h21 == index ? PHT_33 : _GEN_416; // @[br_predictor.scala 67:{35,35}]
  wire [1:0] _GEN_418 = 6'h22 == index ? PHT_34 : _GEN_417; // @[br_predictor.scala 67:{35,35}]
  wire [1:0] _GEN_419 = 6'h23 == index ? PHT_35 : _GEN_418; // @[br_predictor.scala 67:{35,35}]
  wire [1:0] _GEN_420 = 6'h24 == index ? PHT_36 : _GEN_419; // @[br_predictor.scala 67:{35,35}]
  wire [1:0] _GEN_421 = 6'h25 == index ? PHT_37 : _GEN_420; // @[br_predictor.scala 67:{35,35}]
  wire [1:0] _GEN_422 = 6'h26 == index ? PHT_38 : _GEN_421; // @[br_predictor.scala 67:{35,35}]
  wire [1:0] _GEN_423 = 6'h27 == index ? PHT_39 : _GEN_422; // @[br_predictor.scala 67:{35,35}]
  wire [1:0] _GEN_424 = 6'h28 == index ? PHT_40 : _GEN_423; // @[br_predictor.scala 67:{35,35}]
  wire [1:0] _GEN_425 = 6'h29 == index ? PHT_41 : _GEN_424; // @[br_predictor.scala 67:{35,35}]
  wire [1:0] _GEN_426 = 6'h2a == index ? PHT_42 : _GEN_425; // @[br_predictor.scala 67:{35,35}]
  wire [1:0] _GEN_427 = 6'h2b == index ? PHT_43 : _GEN_426; // @[br_predictor.scala 67:{35,35}]
  wire [1:0] _GEN_428 = 6'h2c == index ? PHT_44 : _GEN_427; // @[br_predictor.scala 67:{35,35}]
  wire [1:0] _GEN_429 = 6'h2d == index ? PHT_45 : _GEN_428; // @[br_predictor.scala 67:{35,35}]
  wire [1:0] _GEN_430 = 6'h2e == index ? PHT_46 : _GEN_429; // @[br_predictor.scala 67:{35,35}]
  wire [1:0] _GEN_431 = 6'h2f == index ? PHT_47 : _GEN_430; // @[br_predictor.scala 67:{35,35}]
  wire [1:0] _GEN_432 = 6'h30 == index ? PHT_48 : _GEN_431; // @[br_predictor.scala 67:{35,35}]
  wire [1:0] _GEN_433 = 6'h31 == index ? PHT_49 : _GEN_432; // @[br_predictor.scala 67:{35,35}]
  wire [1:0] _GEN_434 = 6'h32 == index ? PHT_50 : _GEN_433; // @[br_predictor.scala 67:{35,35}]
  wire [1:0] _GEN_435 = 6'h33 == index ? PHT_51 : _GEN_434; // @[br_predictor.scala 67:{35,35}]
  wire [1:0] _GEN_436 = 6'h34 == index ? PHT_52 : _GEN_435; // @[br_predictor.scala 67:{35,35}]
  wire [1:0] _GEN_437 = 6'h35 == index ? PHT_53 : _GEN_436; // @[br_predictor.scala 67:{35,35}]
  wire [1:0] _GEN_438 = 6'h36 == index ? PHT_54 : _GEN_437; // @[br_predictor.scala 67:{35,35}]
  wire [1:0] _GEN_439 = 6'h37 == index ? PHT_55 : _GEN_438; // @[br_predictor.scala 67:{35,35}]
  wire [1:0] _GEN_440 = 6'h38 == index ? PHT_56 : _GEN_439; // @[br_predictor.scala 67:{35,35}]
  wire [1:0] _GEN_441 = 6'h39 == index ? PHT_57 : _GEN_440; // @[br_predictor.scala 67:{35,35}]
  wire [1:0] _GEN_442 = 6'h3a == index ? PHT_58 : _GEN_441; // @[br_predictor.scala 67:{35,35}]
  wire [1:0] _GEN_443 = 6'h3b == index ? PHT_59 : _GEN_442; // @[br_predictor.scala 67:{35,35}]
  wire [1:0] _GEN_444 = 6'h3c == index ? PHT_60 : _GEN_443; // @[br_predictor.scala 67:{35,35}]
  wire [1:0] _GEN_445 = 6'h3d == index ? PHT_61 : _GEN_444; // @[br_predictor.scala 67:{35,35}]
  wire [1:0] _GEN_446 = 6'h3e == index ? PHT_62 : _GEN_445; // @[br_predictor.scala 67:{35,35}]
  wire [1:0] _GEN_447 = 6'h3f == index ? PHT_63 : _GEN_446; // @[br_predictor.scala 67:{35,35}]
  wire  pht_taken = _GEN_447[1]; // @[br_predictor.scala 67:35]
  wire [59:0] _GEN_449 = 6'h1 == index ? BTB_1 : BTB_0; // @[br_predictor.scala 68:{35,35}]
  wire [59:0] _GEN_450 = 6'h2 == index ? BTB_2 : _GEN_449; // @[br_predictor.scala 68:{35,35}]
  wire [59:0] _GEN_451 = 6'h3 == index ? BTB_3 : _GEN_450; // @[br_predictor.scala 68:{35,35}]
  wire [59:0] _GEN_452 = 6'h4 == index ? BTB_4 : _GEN_451; // @[br_predictor.scala 68:{35,35}]
  wire [59:0] _GEN_453 = 6'h5 == index ? BTB_5 : _GEN_452; // @[br_predictor.scala 68:{35,35}]
  wire [59:0] _GEN_454 = 6'h6 == index ? BTB_6 : _GEN_453; // @[br_predictor.scala 68:{35,35}]
  wire [59:0] _GEN_455 = 6'h7 == index ? BTB_7 : _GEN_454; // @[br_predictor.scala 68:{35,35}]
  wire [59:0] _GEN_456 = 6'h8 == index ? BTB_8 : _GEN_455; // @[br_predictor.scala 68:{35,35}]
  wire [59:0] _GEN_457 = 6'h9 == index ? BTB_9 : _GEN_456; // @[br_predictor.scala 68:{35,35}]
  wire [59:0] _GEN_458 = 6'ha == index ? BTB_10 : _GEN_457; // @[br_predictor.scala 68:{35,35}]
  wire [59:0] _GEN_459 = 6'hb == index ? BTB_11 : _GEN_458; // @[br_predictor.scala 68:{35,35}]
  wire [59:0] _GEN_460 = 6'hc == index ? BTB_12 : _GEN_459; // @[br_predictor.scala 68:{35,35}]
  wire [59:0] _GEN_461 = 6'hd == index ? BTB_13 : _GEN_460; // @[br_predictor.scala 68:{35,35}]
  wire [59:0] _GEN_462 = 6'he == index ? BTB_14 : _GEN_461; // @[br_predictor.scala 68:{35,35}]
  wire [59:0] _GEN_463 = 6'hf == index ? BTB_15 : _GEN_462; // @[br_predictor.scala 68:{35,35}]
  wire [59:0] _GEN_464 = 6'h10 == index ? BTB_16 : _GEN_463; // @[br_predictor.scala 68:{35,35}]
  wire [59:0] _GEN_465 = 6'h11 == index ? BTB_17 : _GEN_464; // @[br_predictor.scala 68:{35,35}]
  wire [59:0] _GEN_466 = 6'h12 == index ? BTB_18 : _GEN_465; // @[br_predictor.scala 68:{35,35}]
  wire [59:0] _GEN_467 = 6'h13 == index ? BTB_19 : _GEN_466; // @[br_predictor.scala 68:{35,35}]
  wire [59:0] _GEN_468 = 6'h14 == index ? BTB_20 : _GEN_467; // @[br_predictor.scala 68:{35,35}]
  wire [59:0] _GEN_469 = 6'h15 == index ? BTB_21 : _GEN_468; // @[br_predictor.scala 68:{35,35}]
  wire [59:0] _GEN_470 = 6'h16 == index ? BTB_22 : _GEN_469; // @[br_predictor.scala 68:{35,35}]
  wire [59:0] _GEN_471 = 6'h17 == index ? BTB_23 : _GEN_470; // @[br_predictor.scala 68:{35,35}]
  wire [59:0] _GEN_472 = 6'h18 == index ? BTB_24 : _GEN_471; // @[br_predictor.scala 68:{35,35}]
  wire [59:0] _GEN_473 = 6'h19 == index ? BTB_25 : _GEN_472; // @[br_predictor.scala 68:{35,35}]
  wire [59:0] _GEN_474 = 6'h1a == index ? BTB_26 : _GEN_473; // @[br_predictor.scala 68:{35,35}]
  wire [59:0] _GEN_475 = 6'h1b == index ? BTB_27 : _GEN_474; // @[br_predictor.scala 68:{35,35}]
  wire [59:0] _GEN_476 = 6'h1c == index ? BTB_28 : _GEN_475; // @[br_predictor.scala 68:{35,35}]
  wire [59:0] _GEN_477 = 6'h1d == index ? BTB_29 : _GEN_476; // @[br_predictor.scala 68:{35,35}]
  wire [59:0] _GEN_478 = 6'h1e == index ? BTB_30 : _GEN_477; // @[br_predictor.scala 68:{35,35}]
  wire [59:0] _GEN_479 = 6'h1f == index ? BTB_31 : _GEN_478; // @[br_predictor.scala 68:{35,35}]
  wire [59:0] _GEN_480 = 6'h20 == index ? BTB_32 : _GEN_479; // @[br_predictor.scala 68:{35,35}]
  wire [59:0] _GEN_481 = 6'h21 == index ? BTB_33 : _GEN_480; // @[br_predictor.scala 68:{35,35}]
  wire [59:0] _GEN_482 = 6'h22 == index ? BTB_34 : _GEN_481; // @[br_predictor.scala 68:{35,35}]
  wire [59:0] _GEN_483 = 6'h23 == index ? BTB_35 : _GEN_482; // @[br_predictor.scala 68:{35,35}]
  wire [59:0] _GEN_484 = 6'h24 == index ? BTB_36 : _GEN_483; // @[br_predictor.scala 68:{35,35}]
  wire [59:0] _GEN_485 = 6'h25 == index ? BTB_37 : _GEN_484; // @[br_predictor.scala 68:{35,35}]
  wire [59:0] _GEN_486 = 6'h26 == index ? BTB_38 : _GEN_485; // @[br_predictor.scala 68:{35,35}]
  wire [59:0] _GEN_487 = 6'h27 == index ? BTB_39 : _GEN_486; // @[br_predictor.scala 68:{35,35}]
  wire [59:0] _GEN_488 = 6'h28 == index ? BTB_40 : _GEN_487; // @[br_predictor.scala 68:{35,35}]
  wire [59:0] _GEN_489 = 6'h29 == index ? BTB_41 : _GEN_488; // @[br_predictor.scala 68:{35,35}]
  wire [59:0] _GEN_490 = 6'h2a == index ? BTB_42 : _GEN_489; // @[br_predictor.scala 68:{35,35}]
  wire [59:0] _GEN_491 = 6'h2b == index ? BTB_43 : _GEN_490; // @[br_predictor.scala 68:{35,35}]
  wire [59:0] _GEN_492 = 6'h2c == index ? BTB_44 : _GEN_491; // @[br_predictor.scala 68:{35,35}]
  wire [59:0] _GEN_493 = 6'h2d == index ? BTB_45 : _GEN_492; // @[br_predictor.scala 68:{35,35}]
  wire [59:0] _GEN_494 = 6'h2e == index ? BTB_46 : _GEN_493; // @[br_predictor.scala 68:{35,35}]
  wire [59:0] _GEN_495 = 6'h2f == index ? BTB_47 : _GEN_494; // @[br_predictor.scala 68:{35,35}]
  wire [59:0] _GEN_496 = 6'h30 == index ? BTB_48 : _GEN_495; // @[br_predictor.scala 68:{35,35}]
  wire [59:0] _GEN_497 = 6'h31 == index ? BTB_49 : _GEN_496; // @[br_predictor.scala 68:{35,35}]
  wire [59:0] _GEN_498 = 6'h32 == index ? BTB_50 : _GEN_497; // @[br_predictor.scala 68:{35,35}]
  wire [59:0] _GEN_499 = 6'h33 == index ? BTB_51 : _GEN_498; // @[br_predictor.scala 68:{35,35}]
  wire [59:0] _GEN_500 = 6'h34 == index ? BTB_52 : _GEN_499; // @[br_predictor.scala 68:{35,35}]
  wire [59:0] _GEN_501 = 6'h35 == index ? BTB_53 : _GEN_500; // @[br_predictor.scala 68:{35,35}]
  wire [59:0] _GEN_502 = 6'h36 == index ? BTB_54 : _GEN_501; // @[br_predictor.scala 68:{35,35}]
  wire [59:0] _GEN_503 = 6'h37 == index ? BTB_55 : _GEN_502; // @[br_predictor.scala 68:{35,35}]
  wire [59:0] _GEN_504 = 6'h38 == index ? BTB_56 : _GEN_503; // @[br_predictor.scala 68:{35,35}]
  wire [59:0] _GEN_505 = 6'h39 == index ? BTB_57 : _GEN_504; // @[br_predictor.scala 68:{35,35}]
  wire [59:0] _GEN_506 = 6'h3a == index ? BTB_58 : _GEN_505; // @[br_predictor.scala 68:{35,35}]
  wire [59:0] _GEN_507 = 6'h3b == index ? BTB_59 : _GEN_506; // @[br_predictor.scala 68:{35,35}]
  wire [59:0] _GEN_508 = 6'h3c == index ? BTB_60 : _GEN_507; // @[br_predictor.scala 68:{35,35}]
  wire [59:0] _GEN_509 = 6'h3d == index ? BTB_61 : _GEN_508; // @[br_predictor.scala 68:{35,35}]
  wire [59:0] _GEN_510 = 6'h3e == index ? BTB_62 : _GEN_509; // @[br_predictor.scala 68:{35,35}]
  wire [59:0] _GEN_511 = 6'h3f == index ? BTB_63 : _GEN_510; // @[br_predictor.scala 68:{35,35}]
  wire  btb_valid = _GEN_511[58]; // @[br_predictor.scala 68:35]
  wire [23:0] btb_tag = _GEN_511[57:34]; // @[br_predictor.scala 69:35]
  wire [31:0] btb_target_next_pc = _GEN_511[33:2]; // @[br_predictor.scala 70:42]
  wire [1:0] btb_br_type = _GEN_511[1:0]; // @[br_predictor.scala 71:35]
  wire  pre_valid = btb_valid & btb_tag == tag & pht_taken; // @[br_predictor.scala 73:54]
  wire [2:0] _ras_ready_T_1 = reg_head - 3'h1; // @[br_predictor.scala 75:38]
  wire  _T = btb_br_type == 2'h2; // @[br_predictor.scala 77:34]
  wire [31:0] _GEN_513 = 3'h1 == _ras_ready_T_1 ? RAS_1 : RAS_0; // @[br_predictor.scala 79:{37,37}]
  wire [31:0] _GEN_514 = 3'h2 == _ras_ready_T_1 ? RAS_2 : _GEN_513; // @[br_predictor.scala 79:{37,37}]
  wire [31:0] _GEN_515 = 3'h3 == _ras_ready_T_1 ? RAS_3 : _GEN_514; // @[br_predictor.scala 79:{37,37}]
  wire [31:0] _GEN_516 = 3'h4 == _ras_ready_T_1 ? RAS_4 : _GEN_515; // @[br_predictor.scala 79:{37,37}]
  wire [31:0] _GEN_517 = 3'h5 == _ras_ready_T_1 ? RAS_5 : _GEN_516; // @[br_predictor.scala 79:{37,37}]
  wire [31:0] _GEN_518 = 3'h6 == _ras_ready_T_1 ? RAS_6 : _GEN_517; // @[br_predictor.scala 79:{37,37}]
  wire [31:0] _GEN_519 = 3'h7 == _ras_ready_T_1 ? RAS_7 : _GEN_518; // @[br_predictor.scala 79:{37,37}]
  wire  _T_1 = btb_br_type == 2'h1; // @[br_predictor.scala 81:40]
  wire [63:0] _RAS_T_1 = io_pc + 64'h4; // @[br_predictor.scala 84:45]
  wire [31:0] _GEN_520 = 3'h0 == reg_head ? _RAS_T_1[31:0] : RAS_0; // @[br_predictor.scala 34:26 84:{39,39}]
  wire [31:0] _GEN_521 = 3'h1 == reg_head ? _RAS_T_1[31:0] : RAS_1; // @[br_predictor.scala 34:26 84:{39,39}]
  wire [31:0] _GEN_522 = 3'h2 == reg_head ? _RAS_T_1[31:0] : RAS_2; // @[br_predictor.scala 34:26 84:{39,39}]
  wire [31:0] _GEN_523 = 3'h3 == reg_head ? _RAS_T_1[31:0] : RAS_3; // @[br_predictor.scala 34:26 84:{39,39}]
  wire [31:0] _GEN_524 = 3'h4 == reg_head ? _RAS_T_1[31:0] : RAS_4; // @[br_predictor.scala 34:26 84:{39,39}]
  wire [31:0] _GEN_525 = 3'h5 == reg_head ? _RAS_T_1[31:0] : RAS_5; // @[br_predictor.scala 34:26 84:{39,39}]
  wire [31:0] _GEN_526 = 3'h6 == reg_head ? _RAS_T_1[31:0] : RAS_6; // @[br_predictor.scala 34:26 84:{39,39}]
  wire [31:0] _GEN_527 = 3'h7 == reg_head ? _RAS_T_1[31:0] : RAS_7; // @[br_predictor.scala 34:26 84:{39,39}]
  wire [2:0] _reg_head_T_3 = reg_head + 3'h1; // @[br_predictor.scala 85:55]
  wire [31:0] _GEN_538 = _T ? _GEN_519 : btb_target_next_pc; // @[br_predictor.scala 78:17 79:37]
  wire [31:0] pre_next_pc = pre_valid ? _GEN_538 : 32'h0; // @[br_predictor.scala 76:24]
  assign io_pre_next_pc = {{32'd0}, pre_next_pc}; // @[br_predictor.scala 91:25]
  assign io_pre_valid = btb_valid & btb_tag == tag & pht_taken; // @[br_predictor.scala 73:54]
  always @(posedge clock) begin
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_0 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'h0 == update_index) begin // @[br_predictor.scala 56:43]
          BTB_0 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_1 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'h1 == update_index) begin // @[br_predictor.scala 56:43]
          BTB_1 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_2 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'h2 == update_index) begin // @[br_predictor.scala 56:43]
          BTB_2 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_3 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'h3 == update_index) begin // @[br_predictor.scala 56:43]
          BTB_3 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_4 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'h4 == update_index) begin // @[br_predictor.scala 56:43]
          BTB_4 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_5 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'h5 == update_index) begin // @[br_predictor.scala 56:43]
          BTB_5 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_6 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'h6 == update_index) begin // @[br_predictor.scala 56:43]
          BTB_6 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_7 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'h7 == update_index) begin // @[br_predictor.scala 56:43]
          BTB_7 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_8 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'h8 == update_index) begin // @[br_predictor.scala 56:43]
          BTB_8 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_9 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'h9 == update_index) begin // @[br_predictor.scala 56:43]
          BTB_9 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_10 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'ha == update_index) begin // @[br_predictor.scala 56:43]
          BTB_10 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_11 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'hb == update_index) begin // @[br_predictor.scala 56:43]
          BTB_11 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_12 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'hc == update_index) begin // @[br_predictor.scala 56:43]
          BTB_12 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_13 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'hd == update_index) begin // @[br_predictor.scala 56:43]
          BTB_13 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_14 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'he == update_index) begin // @[br_predictor.scala 56:43]
          BTB_14 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_15 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'hf == update_index) begin // @[br_predictor.scala 56:43]
          BTB_15 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_16 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'h10 == update_index) begin // @[br_predictor.scala 56:43]
          BTB_16 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_17 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'h11 == update_index) begin // @[br_predictor.scala 56:43]
          BTB_17 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_18 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'h12 == update_index) begin // @[br_predictor.scala 56:43]
          BTB_18 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_19 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'h13 == update_index) begin // @[br_predictor.scala 56:43]
          BTB_19 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_20 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'h14 == update_index) begin // @[br_predictor.scala 56:43]
          BTB_20 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_21 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'h15 == update_index) begin // @[br_predictor.scala 56:43]
          BTB_21 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_22 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'h16 == update_index) begin // @[br_predictor.scala 56:43]
          BTB_22 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_23 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'h17 == update_index) begin // @[br_predictor.scala 56:43]
          BTB_23 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_24 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'h18 == update_index) begin // @[br_predictor.scala 56:43]
          BTB_24 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_25 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'h19 == update_index) begin // @[br_predictor.scala 56:43]
          BTB_25 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_26 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'h1a == update_index) begin // @[br_predictor.scala 56:43]
          BTB_26 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_27 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'h1b == update_index) begin // @[br_predictor.scala 56:43]
          BTB_27 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_28 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'h1c == update_index) begin // @[br_predictor.scala 56:43]
          BTB_28 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_29 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'h1d == update_index) begin // @[br_predictor.scala 56:43]
          BTB_29 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_30 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'h1e == update_index) begin // @[br_predictor.scala 56:43]
          BTB_30 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_31 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'h1f == update_index) begin // @[br_predictor.scala 56:43]
          BTB_31 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_32 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'h20 == update_index) begin // @[br_predictor.scala 56:43]
          BTB_32 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_33 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'h21 == update_index) begin // @[br_predictor.scala 56:43]
          BTB_33 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_34 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'h22 == update_index) begin // @[br_predictor.scala 56:43]
          BTB_34 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_35 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'h23 == update_index) begin // @[br_predictor.scala 56:43]
          BTB_35 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_36 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'h24 == update_index) begin // @[br_predictor.scala 56:43]
          BTB_36 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_37 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'h25 == update_index) begin // @[br_predictor.scala 56:43]
          BTB_37 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_38 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'h26 == update_index) begin // @[br_predictor.scala 56:43]
          BTB_38 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_39 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'h27 == update_index) begin // @[br_predictor.scala 56:43]
          BTB_39 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_40 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'h28 == update_index) begin // @[br_predictor.scala 56:43]
          BTB_40 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_41 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'h29 == update_index) begin // @[br_predictor.scala 56:43]
          BTB_41 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_42 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'h2a == update_index) begin // @[br_predictor.scala 56:43]
          BTB_42 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_43 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'h2b == update_index) begin // @[br_predictor.scala 56:43]
          BTB_43 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_44 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'h2c == update_index) begin // @[br_predictor.scala 56:43]
          BTB_44 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_45 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'h2d == update_index) begin // @[br_predictor.scala 56:43]
          BTB_45 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_46 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'h2e == update_index) begin // @[br_predictor.scala 56:43]
          BTB_46 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_47 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'h2f == update_index) begin // @[br_predictor.scala 56:43]
          BTB_47 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_48 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'h30 == update_index) begin // @[br_predictor.scala 56:43]
          BTB_48 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_49 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'h31 == update_index) begin // @[br_predictor.scala 56:43]
          BTB_49 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_50 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'h32 == update_index) begin // @[br_predictor.scala 56:43]
          BTB_50 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_51 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'h33 == update_index) begin // @[br_predictor.scala 56:43]
          BTB_51 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_52 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'h34 == update_index) begin // @[br_predictor.scala 56:43]
          BTB_52 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_53 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'h35 == update_index) begin // @[br_predictor.scala 56:43]
          BTB_53 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_54 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'h36 == update_index) begin // @[br_predictor.scala 56:43]
          BTB_54 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_55 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'h37 == update_index) begin // @[br_predictor.scala 56:43]
          BTB_55 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_56 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'h38 == update_index) begin // @[br_predictor.scala 56:43]
          BTB_56 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_57 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'h39 == update_index) begin // @[br_predictor.scala 56:43]
          BTB_57 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_58 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'h3a == update_index) begin // @[br_predictor.scala 56:43]
          BTB_58 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_59 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'h3b == update_index) begin // @[br_predictor.scala 56:43]
          BTB_59 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_60 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'h3c == update_index) begin // @[br_predictor.scala 56:43]
          BTB_60 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_61 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'h3d == update_index) begin // @[br_predictor.scala 56:43]
          BTB_61 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_62 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'h3e == update_index) begin // @[br_predictor.scala 56:43]
          BTB_62 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 33:26]
      BTB_63 <= 60'h0; // @[br_predictor.scala 33:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (io_br_info_mispredict) begin // @[br_predictor.scala 55:33]
        if (6'h3f == update_index) begin // @[br_predictor.scala 56:43]
          BTB_63 <= _BTB_update_index; // @[br_predictor.scala 56:43]
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 34:26]
      RAS_0 <= 32'h0; // @[br_predictor.scala 34:26]
    end else if (pre_valid) begin // @[br_predictor.scala 76:24]
      if (!(_T)) begin // @[br_predictor.scala 78:17]
        if (_T_1) begin // @[br_predictor.scala 82:17]
          RAS_0 <= _GEN_520;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 34:26]
      RAS_1 <= 32'h0; // @[br_predictor.scala 34:26]
    end else if (pre_valid) begin // @[br_predictor.scala 76:24]
      if (!(_T)) begin // @[br_predictor.scala 78:17]
        if (_T_1) begin // @[br_predictor.scala 82:17]
          RAS_1 <= _GEN_521;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 34:26]
      RAS_2 <= 32'h0; // @[br_predictor.scala 34:26]
    end else if (pre_valid) begin // @[br_predictor.scala 76:24]
      if (!(_T)) begin // @[br_predictor.scala 78:17]
        if (_T_1) begin // @[br_predictor.scala 82:17]
          RAS_2 <= _GEN_522;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 34:26]
      RAS_3 <= 32'h0; // @[br_predictor.scala 34:26]
    end else if (pre_valid) begin // @[br_predictor.scala 76:24]
      if (!(_T)) begin // @[br_predictor.scala 78:17]
        if (_T_1) begin // @[br_predictor.scala 82:17]
          RAS_3 <= _GEN_523;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 34:26]
      RAS_4 <= 32'h0; // @[br_predictor.scala 34:26]
    end else if (pre_valid) begin // @[br_predictor.scala 76:24]
      if (!(_T)) begin // @[br_predictor.scala 78:17]
        if (_T_1) begin // @[br_predictor.scala 82:17]
          RAS_4 <= _GEN_524;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 34:26]
      RAS_5 <= 32'h0; // @[br_predictor.scala 34:26]
    end else if (pre_valid) begin // @[br_predictor.scala 76:24]
      if (!(_T)) begin // @[br_predictor.scala 78:17]
        if (_T_1) begin // @[br_predictor.scala 82:17]
          RAS_5 <= _GEN_525;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 34:26]
      RAS_6 <= 32'h0; // @[br_predictor.scala 34:26]
    end else if (pre_valid) begin // @[br_predictor.scala 76:24]
      if (!(_T)) begin // @[br_predictor.scala 78:17]
        if (_T_1) begin // @[br_predictor.scala 82:17]
          RAS_6 <= _GEN_526;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 34:26]
      RAS_7 <= 32'h0; // @[br_predictor.scala 34:26]
    end else if (pre_valid) begin // @[br_predictor.scala 76:24]
      if (!(_T)) begin // @[br_predictor.scala 78:17]
        if (_T_1) begin // @[br_predictor.scala 82:17]
          RAS_7 <= _GEN_527;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_0 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'h0 == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_0 <= _chage_pht_counter_T_3;
        end else begin
          PHT_0 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_1 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'h1 == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_1 <= _chage_pht_counter_T_3;
        end else begin
          PHT_1 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_2 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'h2 == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_2 <= _chage_pht_counter_T_3;
        end else begin
          PHT_2 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_3 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'h3 == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_3 <= _chage_pht_counter_T_3;
        end else begin
          PHT_3 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_4 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'h4 == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_4 <= _chage_pht_counter_T_3;
        end else begin
          PHT_4 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_5 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'h5 == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_5 <= _chage_pht_counter_T_3;
        end else begin
          PHT_5 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_6 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'h6 == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_6 <= _chage_pht_counter_T_3;
        end else begin
          PHT_6 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_7 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'h7 == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_7 <= _chage_pht_counter_T_3;
        end else begin
          PHT_7 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_8 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'h8 == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_8 <= _chage_pht_counter_T_3;
        end else begin
          PHT_8 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_9 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'h9 == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_9 <= _chage_pht_counter_T_3;
        end else begin
          PHT_9 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_10 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'ha == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_10 <= _chage_pht_counter_T_3;
        end else begin
          PHT_10 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_11 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'hb == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_11 <= _chage_pht_counter_T_3;
        end else begin
          PHT_11 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_12 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'hc == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_12 <= _chage_pht_counter_T_3;
        end else begin
          PHT_12 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_13 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'hd == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_13 <= _chage_pht_counter_T_3;
        end else begin
          PHT_13 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_14 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'he == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_14 <= _chage_pht_counter_T_3;
        end else begin
          PHT_14 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_15 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'hf == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_15 <= _chage_pht_counter_T_3;
        end else begin
          PHT_15 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_16 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'h10 == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_16 <= _chage_pht_counter_T_3;
        end else begin
          PHT_16 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_17 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'h11 == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_17 <= _chage_pht_counter_T_3;
        end else begin
          PHT_17 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_18 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'h12 == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_18 <= _chage_pht_counter_T_3;
        end else begin
          PHT_18 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_19 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'h13 == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_19 <= _chage_pht_counter_T_3;
        end else begin
          PHT_19 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_20 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'h14 == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_20 <= _chage_pht_counter_T_3;
        end else begin
          PHT_20 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_21 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'h15 == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_21 <= _chage_pht_counter_T_3;
        end else begin
          PHT_21 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_22 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'h16 == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_22 <= _chage_pht_counter_T_3;
        end else begin
          PHT_22 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_23 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'h17 == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_23 <= _chage_pht_counter_T_3;
        end else begin
          PHT_23 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_24 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'h18 == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_24 <= _chage_pht_counter_T_3;
        end else begin
          PHT_24 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_25 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'h19 == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_25 <= _chage_pht_counter_T_3;
        end else begin
          PHT_25 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_26 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'h1a == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_26 <= _chage_pht_counter_T_3;
        end else begin
          PHT_26 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_27 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'h1b == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_27 <= _chage_pht_counter_T_3;
        end else begin
          PHT_27 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_28 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'h1c == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_28 <= _chage_pht_counter_T_3;
        end else begin
          PHT_28 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_29 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'h1d == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_29 <= _chage_pht_counter_T_3;
        end else begin
          PHT_29 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_30 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'h1e == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_30 <= _chage_pht_counter_T_3;
        end else begin
          PHT_30 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_31 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'h1f == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_31 <= _chage_pht_counter_T_3;
        end else begin
          PHT_31 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_32 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'h20 == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_32 <= _chage_pht_counter_T_3;
        end else begin
          PHT_32 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_33 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'h21 == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_33 <= _chage_pht_counter_T_3;
        end else begin
          PHT_33 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_34 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'h22 == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_34 <= _chage_pht_counter_T_3;
        end else begin
          PHT_34 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_35 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'h23 == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_35 <= _chage_pht_counter_T_3;
        end else begin
          PHT_35 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_36 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'h24 == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_36 <= _chage_pht_counter_T_3;
        end else begin
          PHT_36 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_37 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'h25 == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_37 <= _chage_pht_counter_T_3;
        end else begin
          PHT_37 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_38 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'h26 == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_38 <= _chage_pht_counter_T_3;
        end else begin
          PHT_38 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_39 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'h27 == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_39 <= _chage_pht_counter_T_3;
        end else begin
          PHT_39 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_40 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'h28 == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_40 <= _chage_pht_counter_T_3;
        end else begin
          PHT_40 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_41 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'h29 == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_41 <= _chage_pht_counter_T_3;
        end else begin
          PHT_41 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_42 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'h2a == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_42 <= _chage_pht_counter_T_3;
        end else begin
          PHT_42 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_43 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'h2b == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_43 <= _chage_pht_counter_T_3;
        end else begin
          PHT_43 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_44 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'h2c == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_44 <= _chage_pht_counter_T_3;
        end else begin
          PHT_44 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_45 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'h2d == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_45 <= _chage_pht_counter_T_3;
        end else begin
          PHT_45 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_46 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'h2e == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_46 <= _chage_pht_counter_T_3;
        end else begin
          PHT_46 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_47 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'h2f == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_47 <= _chage_pht_counter_T_3;
        end else begin
          PHT_47 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_48 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'h30 == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_48 <= _chage_pht_counter_T_3;
        end else begin
          PHT_48 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_49 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'h31 == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_49 <= _chage_pht_counter_T_3;
        end else begin
          PHT_49 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_50 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'h32 == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_50 <= _chage_pht_counter_T_3;
        end else begin
          PHT_50 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_51 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'h33 == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_51 <= _chage_pht_counter_T_3;
        end else begin
          PHT_51 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_52 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'h34 == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_52 <= _chage_pht_counter_T_3;
        end else begin
          PHT_52 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_53 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'h35 == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_53 <= _chage_pht_counter_T_3;
        end else begin
          PHT_53 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_54 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'h36 == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_54 <= _chage_pht_counter_T_3;
        end else begin
          PHT_54 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_55 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'h37 == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_55 <= _chage_pht_counter_T_3;
        end else begin
          PHT_55 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_56 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'h38 == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_56 <= _chage_pht_counter_T_3;
        end else begin
          PHT_56 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_57 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'h39 == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_57 <= _chage_pht_counter_T_3;
        end else begin
          PHT_57 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_58 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'h3a == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_58 <= _chage_pht_counter_T_3;
        end else begin
          PHT_58 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_59 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'h3b == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_59 <= _chage_pht_counter_T_3;
        end else begin
          PHT_59 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_60 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'h3c == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_60 <= _chage_pht_counter_T_3;
        end else begin
          PHT_60 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_61 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'h3d == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_61 <= _chage_pht_counter_T_3;
        end else begin
          PHT_61 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_62 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'h3e == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_62 <= _chage_pht_counter_T_3;
        end else begin
          PHT_62 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 35:26]
      PHT_63 <= 2'h2; // @[br_predictor.scala 35:26]
    end else if (io_br_info_valid) begin // @[br_predictor.scala 53:31]
      if (6'h3f == update_index) begin // @[br_predictor.scala 54:43]
        if (io_br_info_taken) begin // @[br_predictor.scala 52:36]
          PHT_63 <= _chage_pht_counter_T_3;
        end else begin
          PHT_63 <= _chage_pht_counter_T_7;
        end
      end
    end
    if (reset) begin // @[br_predictor.scala 36:31]
      reg_head <= 3'h0; // @[br_predictor.scala 36:31]
    end else if (pre_valid) begin // @[br_predictor.scala 76:24]
      if (_T) begin // @[br_predictor.scala 78:17]
        reg_head <= _ras_ready_T_1; // @[br_predictor.scala 80:41]
      end else if (_T_1) begin // @[br_predictor.scala 82:17]
        reg_head <= _reg_head_T_3; // @[br_predictor.scala 85:43]
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
  BTB_0 = _RAND_0[59:0];
  _RAND_1 = {2{`RANDOM}};
  BTB_1 = _RAND_1[59:0];
  _RAND_2 = {2{`RANDOM}};
  BTB_2 = _RAND_2[59:0];
  _RAND_3 = {2{`RANDOM}};
  BTB_3 = _RAND_3[59:0];
  _RAND_4 = {2{`RANDOM}};
  BTB_4 = _RAND_4[59:0];
  _RAND_5 = {2{`RANDOM}};
  BTB_5 = _RAND_5[59:0];
  _RAND_6 = {2{`RANDOM}};
  BTB_6 = _RAND_6[59:0];
  _RAND_7 = {2{`RANDOM}};
  BTB_7 = _RAND_7[59:0];
  _RAND_8 = {2{`RANDOM}};
  BTB_8 = _RAND_8[59:0];
  _RAND_9 = {2{`RANDOM}};
  BTB_9 = _RAND_9[59:0];
  _RAND_10 = {2{`RANDOM}};
  BTB_10 = _RAND_10[59:0];
  _RAND_11 = {2{`RANDOM}};
  BTB_11 = _RAND_11[59:0];
  _RAND_12 = {2{`RANDOM}};
  BTB_12 = _RAND_12[59:0];
  _RAND_13 = {2{`RANDOM}};
  BTB_13 = _RAND_13[59:0];
  _RAND_14 = {2{`RANDOM}};
  BTB_14 = _RAND_14[59:0];
  _RAND_15 = {2{`RANDOM}};
  BTB_15 = _RAND_15[59:0];
  _RAND_16 = {2{`RANDOM}};
  BTB_16 = _RAND_16[59:0];
  _RAND_17 = {2{`RANDOM}};
  BTB_17 = _RAND_17[59:0];
  _RAND_18 = {2{`RANDOM}};
  BTB_18 = _RAND_18[59:0];
  _RAND_19 = {2{`RANDOM}};
  BTB_19 = _RAND_19[59:0];
  _RAND_20 = {2{`RANDOM}};
  BTB_20 = _RAND_20[59:0];
  _RAND_21 = {2{`RANDOM}};
  BTB_21 = _RAND_21[59:0];
  _RAND_22 = {2{`RANDOM}};
  BTB_22 = _RAND_22[59:0];
  _RAND_23 = {2{`RANDOM}};
  BTB_23 = _RAND_23[59:0];
  _RAND_24 = {2{`RANDOM}};
  BTB_24 = _RAND_24[59:0];
  _RAND_25 = {2{`RANDOM}};
  BTB_25 = _RAND_25[59:0];
  _RAND_26 = {2{`RANDOM}};
  BTB_26 = _RAND_26[59:0];
  _RAND_27 = {2{`RANDOM}};
  BTB_27 = _RAND_27[59:0];
  _RAND_28 = {2{`RANDOM}};
  BTB_28 = _RAND_28[59:0];
  _RAND_29 = {2{`RANDOM}};
  BTB_29 = _RAND_29[59:0];
  _RAND_30 = {2{`RANDOM}};
  BTB_30 = _RAND_30[59:0];
  _RAND_31 = {2{`RANDOM}};
  BTB_31 = _RAND_31[59:0];
  _RAND_32 = {2{`RANDOM}};
  BTB_32 = _RAND_32[59:0];
  _RAND_33 = {2{`RANDOM}};
  BTB_33 = _RAND_33[59:0];
  _RAND_34 = {2{`RANDOM}};
  BTB_34 = _RAND_34[59:0];
  _RAND_35 = {2{`RANDOM}};
  BTB_35 = _RAND_35[59:0];
  _RAND_36 = {2{`RANDOM}};
  BTB_36 = _RAND_36[59:0];
  _RAND_37 = {2{`RANDOM}};
  BTB_37 = _RAND_37[59:0];
  _RAND_38 = {2{`RANDOM}};
  BTB_38 = _RAND_38[59:0];
  _RAND_39 = {2{`RANDOM}};
  BTB_39 = _RAND_39[59:0];
  _RAND_40 = {2{`RANDOM}};
  BTB_40 = _RAND_40[59:0];
  _RAND_41 = {2{`RANDOM}};
  BTB_41 = _RAND_41[59:0];
  _RAND_42 = {2{`RANDOM}};
  BTB_42 = _RAND_42[59:0];
  _RAND_43 = {2{`RANDOM}};
  BTB_43 = _RAND_43[59:0];
  _RAND_44 = {2{`RANDOM}};
  BTB_44 = _RAND_44[59:0];
  _RAND_45 = {2{`RANDOM}};
  BTB_45 = _RAND_45[59:0];
  _RAND_46 = {2{`RANDOM}};
  BTB_46 = _RAND_46[59:0];
  _RAND_47 = {2{`RANDOM}};
  BTB_47 = _RAND_47[59:0];
  _RAND_48 = {2{`RANDOM}};
  BTB_48 = _RAND_48[59:0];
  _RAND_49 = {2{`RANDOM}};
  BTB_49 = _RAND_49[59:0];
  _RAND_50 = {2{`RANDOM}};
  BTB_50 = _RAND_50[59:0];
  _RAND_51 = {2{`RANDOM}};
  BTB_51 = _RAND_51[59:0];
  _RAND_52 = {2{`RANDOM}};
  BTB_52 = _RAND_52[59:0];
  _RAND_53 = {2{`RANDOM}};
  BTB_53 = _RAND_53[59:0];
  _RAND_54 = {2{`RANDOM}};
  BTB_54 = _RAND_54[59:0];
  _RAND_55 = {2{`RANDOM}};
  BTB_55 = _RAND_55[59:0];
  _RAND_56 = {2{`RANDOM}};
  BTB_56 = _RAND_56[59:0];
  _RAND_57 = {2{`RANDOM}};
  BTB_57 = _RAND_57[59:0];
  _RAND_58 = {2{`RANDOM}};
  BTB_58 = _RAND_58[59:0];
  _RAND_59 = {2{`RANDOM}};
  BTB_59 = _RAND_59[59:0];
  _RAND_60 = {2{`RANDOM}};
  BTB_60 = _RAND_60[59:0];
  _RAND_61 = {2{`RANDOM}};
  BTB_61 = _RAND_61[59:0];
  _RAND_62 = {2{`RANDOM}};
  BTB_62 = _RAND_62[59:0];
  _RAND_63 = {2{`RANDOM}};
  BTB_63 = _RAND_63[59:0];
  _RAND_64 = {1{`RANDOM}};
  RAS_0 = _RAND_64[31:0];
  _RAND_65 = {1{`RANDOM}};
  RAS_1 = _RAND_65[31:0];
  _RAND_66 = {1{`RANDOM}};
  RAS_2 = _RAND_66[31:0];
  _RAND_67 = {1{`RANDOM}};
  RAS_3 = _RAND_67[31:0];
  _RAND_68 = {1{`RANDOM}};
  RAS_4 = _RAND_68[31:0];
  _RAND_69 = {1{`RANDOM}};
  RAS_5 = _RAND_69[31:0];
  _RAND_70 = {1{`RANDOM}};
  RAS_6 = _RAND_70[31:0];
  _RAND_71 = {1{`RANDOM}};
  RAS_7 = _RAND_71[31:0];
  _RAND_72 = {1{`RANDOM}};
  PHT_0 = _RAND_72[1:0];
  _RAND_73 = {1{`RANDOM}};
  PHT_1 = _RAND_73[1:0];
  _RAND_74 = {1{`RANDOM}};
  PHT_2 = _RAND_74[1:0];
  _RAND_75 = {1{`RANDOM}};
  PHT_3 = _RAND_75[1:0];
  _RAND_76 = {1{`RANDOM}};
  PHT_4 = _RAND_76[1:0];
  _RAND_77 = {1{`RANDOM}};
  PHT_5 = _RAND_77[1:0];
  _RAND_78 = {1{`RANDOM}};
  PHT_6 = _RAND_78[1:0];
  _RAND_79 = {1{`RANDOM}};
  PHT_7 = _RAND_79[1:0];
  _RAND_80 = {1{`RANDOM}};
  PHT_8 = _RAND_80[1:0];
  _RAND_81 = {1{`RANDOM}};
  PHT_9 = _RAND_81[1:0];
  _RAND_82 = {1{`RANDOM}};
  PHT_10 = _RAND_82[1:0];
  _RAND_83 = {1{`RANDOM}};
  PHT_11 = _RAND_83[1:0];
  _RAND_84 = {1{`RANDOM}};
  PHT_12 = _RAND_84[1:0];
  _RAND_85 = {1{`RANDOM}};
  PHT_13 = _RAND_85[1:0];
  _RAND_86 = {1{`RANDOM}};
  PHT_14 = _RAND_86[1:0];
  _RAND_87 = {1{`RANDOM}};
  PHT_15 = _RAND_87[1:0];
  _RAND_88 = {1{`RANDOM}};
  PHT_16 = _RAND_88[1:0];
  _RAND_89 = {1{`RANDOM}};
  PHT_17 = _RAND_89[1:0];
  _RAND_90 = {1{`RANDOM}};
  PHT_18 = _RAND_90[1:0];
  _RAND_91 = {1{`RANDOM}};
  PHT_19 = _RAND_91[1:0];
  _RAND_92 = {1{`RANDOM}};
  PHT_20 = _RAND_92[1:0];
  _RAND_93 = {1{`RANDOM}};
  PHT_21 = _RAND_93[1:0];
  _RAND_94 = {1{`RANDOM}};
  PHT_22 = _RAND_94[1:0];
  _RAND_95 = {1{`RANDOM}};
  PHT_23 = _RAND_95[1:0];
  _RAND_96 = {1{`RANDOM}};
  PHT_24 = _RAND_96[1:0];
  _RAND_97 = {1{`RANDOM}};
  PHT_25 = _RAND_97[1:0];
  _RAND_98 = {1{`RANDOM}};
  PHT_26 = _RAND_98[1:0];
  _RAND_99 = {1{`RANDOM}};
  PHT_27 = _RAND_99[1:0];
  _RAND_100 = {1{`RANDOM}};
  PHT_28 = _RAND_100[1:0];
  _RAND_101 = {1{`RANDOM}};
  PHT_29 = _RAND_101[1:0];
  _RAND_102 = {1{`RANDOM}};
  PHT_30 = _RAND_102[1:0];
  _RAND_103 = {1{`RANDOM}};
  PHT_31 = _RAND_103[1:0];
  _RAND_104 = {1{`RANDOM}};
  PHT_32 = _RAND_104[1:0];
  _RAND_105 = {1{`RANDOM}};
  PHT_33 = _RAND_105[1:0];
  _RAND_106 = {1{`RANDOM}};
  PHT_34 = _RAND_106[1:0];
  _RAND_107 = {1{`RANDOM}};
  PHT_35 = _RAND_107[1:0];
  _RAND_108 = {1{`RANDOM}};
  PHT_36 = _RAND_108[1:0];
  _RAND_109 = {1{`RANDOM}};
  PHT_37 = _RAND_109[1:0];
  _RAND_110 = {1{`RANDOM}};
  PHT_38 = _RAND_110[1:0];
  _RAND_111 = {1{`RANDOM}};
  PHT_39 = _RAND_111[1:0];
  _RAND_112 = {1{`RANDOM}};
  PHT_40 = _RAND_112[1:0];
  _RAND_113 = {1{`RANDOM}};
  PHT_41 = _RAND_113[1:0];
  _RAND_114 = {1{`RANDOM}};
  PHT_42 = _RAND_114[1:0];
  _RAND_115 = {1{`RANDOM}};
  PHT_43 = _RAND_115[1:0];
  _RAND_116 = {1{`RANDOM}};
  PHT_44 = _RAND_116[1:0];
  _RAND_117 = {1{`RANDOM}};
  PHT_45 = _RAND_117[1:0];
  _RAND_118 = {1{`RANDOM}};
  PHT_46 = _RAND_118[1:0];
  _RAND_119 = {1{`RANDOM}};
  PHT_47 = _RAND_119[1:0];
  _RAND_120 = {1{`RANDOM}};
  PHT_48 = _RAND_120[1:0];
  _RAND_121 = {1{`RANDOM}};
  PHT_49 = _RAND_121[1:0];
  _RAND_122 = {1{`RANDOM}};
  PHT_50 = _RAND_122[1:0];
  _RAND_123 = {1{`RANDOM}};
  PHT_51 = _RAND_123[1:0];
  _RAND_124 = {1{`RANDOM}};
  PHT_52 = _RAND_124[1:0];
  _RAND_125 = {1{`RANDOM}};
  PHT_53 = _RAND_125[1:0];
  _RAND_126 = {1{`RANDOM}};
  PHT_54 = _RAND_126[1:0];
  _RAND_127 = {1{`RANDOM}};
  PHT_55 = _RAND_127[1:0];
  _RAND_128 = {1{`RANDOM}};
  PHT_56 = _RAND_128[1:0];
  _RAND_129 = {1{`RANDOM}};
  PHT_57 = _RAND_129[1:0];
  _RAND_130 = {1{`RANDOM}};
  PHT_58 = _RAND_130[1:0];
  _RAND_131 = {1{`RANDOM}};
  PHT_59 = _RAND_131[1:0];
  _RAND_132 = {1{`RANDOM}};
  PHT_60 = _RAND_132[1:0];
  _RAND_133 = {1{`RANDOM}};
  PHT_61 = _RAND_133[1:0];
  _RAND_134 = {1{`RANDOM}};
  PHT_62 = _RAND_134[1:0];
  _RAND_135 = {1{`RANDOM}};
  PHT_63 = _RAND_135[1:0];
  _RAND_136 = {1{`RANDOM}};
  reg_head = _RAND_136[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_040318_Fetch(
  input         clock,
  input         reset,
  input         io_br_info_valid,
  input         io_br_info_mispredict,
  input  [63:0] io_br_info_br_pc,
  input         io_br_info_taken,
  input  [63:0] io_br_info_target_next_pc,
  input  [1:0]  io_br_info_br_type,
  input         io_get_pre_info_valid,
  output [63:0] io_get_pre_info_pre_next_pc,
  input  [63:0] io_next_pc,
  input         io_flush,
  input         io_cpu_addr_ready,
  output        io_cpu_addr_valid,
  output [63:0] io_cpu_addr_bits_addr,
  output        io_cpu_data_ready,
  input         io_cpu_data_valid,
  input  [63:0] io_cpu_data_bits_data,
  input  [63:0] io_cpu_data_bits_pc,
  input         io_put_pc_ready,
  output        io_put_pc_valid,
  output [31:0] io_put_pc_bits_inst,
  output [63:0] io_put_pc_bits_pc,
  output        io_put_pc_bits_is_pre
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [63:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [63:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
`endif // RANDOMIZE_REG_INIT
  wire  ibuf_clock; // @[fetch.scala 101:41]
  wire  ibuf_reset; // @[fetch.scala 101:41]
  wire  ibuf_io_flush; // @[fetch.scala 101:41]
  wire  ibuf_io_cache_buf_ready; // @[fetch.scala 101:41]
  wire  ibuf_io_cache_buf_valid; // @[fetch.scala 101:41]
  wire [63:0] ibuf_io_cache_buf_bits_pc; // @[fetch.scala 101:41]
  wire [31:0] ibuf_io_cache_buf_bits_inst; // @[fetch.scala 101:41]
  wire  ibuf_io_cache_buf_bits_is_pre; // @[fetch.scala 101:41]
  wire  ibuf_io_put_pc_ready; // @[fetch.scala 101:41]
  wire  ibuf_io_put_pc_valid; // @[fetch.scala 101:41]
  wire [31:0] ibuf_io_put_pc_bits_inst; // @[fetch.scala 101:41]
  wire [63:0] ibuf_io_put_pc_bits_pc; // @[fetch.scala 101:41]
  wire  ibuf_io_put_pc_bits_is_pre; // @[fetch.scala 101:41]
  wire  br_predictor_clock; // @[fetch.scala 109:34]
  wire  br_predictor_reset; // @[fetch.scala 109:34]
  wire  br_predictor_io_br_info_valid; // @[fetch.scala 109:34]
  wire  br_predictor_io_br_info_mispredict; // @[fetch.scala 109:34]
  wire [63:0] br_predictor_io_br_info_br_pc; // @[fetch.scala 109:34]
  wire  br_predictor_io_br_info_taken; // @[fetch.scala 109:34]
  wire [63:0] br_predictor_io_br_info_target_next_pc; // @[fetch.scala 109:34]
  wire [1:0] br_predictor_io_br_info_br_type; // @[fetch.scala 109:34]
  wire [63:0] br_predictor_io_pc; // @[fetch.scala 109:34]
  wire [63:0] br_predictor_io_pre_next_pc; // @[fetch.scala 109:34]
  wire  br_predictor_io_pre_valid; // @[fetch.scala 109:34]
  reg [63:0] reg_pc; // @[fetch.scala 103:42]
  reg  reg_bus_valid; // @[fetch.scala 105:42]
  reg [1:0] pre_info_head; // @[fetch.scala 115:42]
  reg [1:0] pre_info_tail; // @[fetch.scala 116:42]
  reg [63:0] pre_info_fifo_0; // @[fetch.scala 119:42]
  reg [63:0] pre_info_fifo_1; // @[fetch.scala 119:42]
  reg [63:0] pre_info_fifo_2; // @[fetch.scala 119:42]
  reg [63:0] pre_info_fifo_3; // @[fetch.scala 119:42]
  wire  _pre_enq_T = io_cpu_addr_ready & io_cpu_addr_valid; // @[Decoupled.scala 52:35]
  wire  pre_enq = _pre_enq_T & br_predictor_io_pre_valid; // @[fetch.scala 120:40]
  wire [63:0] _pre_info_fifo_pre_info_head = br_predictor_io_pre_next_pc; // @[fetch.scala 135:{54,54}]
  wire [1:0] _pre_info_head_T_1 = pre_info_head + 2'h1; // @[fetch.scala 136:58]
  wire [1:0] _pre_info_tail_T_1 = pre_info_tail + 2'h1; // @[fetch.scala 139:58]
  wire [63:0] _GEN_18 = 2'h1 == pre_info_tail ? pre_info_fifo_1 : pre_info_fifo_0; // @[fetch.scala 144:{43,43}]
  wire [63:0] _GEN_19 = 2'h2 == pre_info_tail ? pre_info_fifo_2 : _GEN_18; // @[fetch.scala 144:{43,43}]
  wire [63:0] _GEN_20 = 2'h3 == pre_info_tail ? pre_info_fifo_3 : _GEN_19; // @[fetch.scala 144:{43,43}]
  reg [1:0] is_pre_head; // @[fetch.scala 146:34]
  reg [1:0] is_pre_tail; // @[fetch.scala 147:34]
  reg  is_pre_fifo_0; // @[fetch.scala 148:34]
  reg  is_pre_fifo_1; // @[fetch.scala 148:34]
  reg  is_pre_fifo_2; // @[fetch.scala 148:34]
  reg  is_pre_fifo_3; // @[fetch.scala 148:34]
  wire [1:0] _is_pre_head_T_1 = is_pre_head + 2'h1; // @[fetch.scala 158:52]
  wire  _T_2 = io_cpu_data_ready & io_cpu_data_valid; // @[Decoupled.scala 52:35]
  wire [1:0] _is_pre_tail_T_1 = is_pre_tail + 2'h1; // @[fetch.scala 162:52]
  wire [63:0] _reg_pc_T_1 = reg_pc + 64'h4; // @[fetch.scala 173:66]
  wire  _GEN_37 = ~ibuf_io_cache_buf_ready ? 1'h0 : reg_bus_valid; // @[fetch.scala 174:37 105:42 175:47]
  wire  _GEN_38 = ibuf_io_cache_buf_ready | reg_bus_valid; // @[fetch.scala 179:36 105:42 180:47]
  wire  _GEN_40 = _pre_enq_T ? _GEN_37 : _GEN_38; // @[fetch.scala 172:39]
  wire  _GEN_42 = io_flush | _GEN_40; // @[fetch.scala 168:23 170:31]
  wire  _GEN_44 = 2'h1 == is_pre_tail ? is_pre_fifo_1 : is_pre_fifo_0; // @[fetch.scala 188:{39,39}]
  wire  _GEN_45 = 2'h2 == is_pre_tail ? is_pre_fifo_2 : _GEN_44; // @[fetch.scala 188:{39,39}]
  ysyx_040318_IBuf ibuf ( // @[fetch.scala 101:41]
    .clock(ibuf_clock),
    .reset(ibuf_reset),
    .io_flush(ibuf_io_flush),
    .io_cache_buf_ready(ibuf_io_cache_buf_ready),
    .io_cache_buf_valid(ibuf_io_cache_buf_valid),
    .io_cache_buf_bits_pc(ibuf_io_cache_buf_bits_pc),
    .io_cache_buf_bits_inst(ibuf_io_cache_buf_bits_inst),
    .io_cache_buf_bits_is_pre(ibuf_io_cache_buf_bits_is_pre),
    .io_put_pc_ready(ibuf_io_put_pc_ready),
    .io_put_pc_valid(ibuf_io_put_pc_valid),
    .io_put_pc_bits_inst(ibuf_io_put_pc_bits_inst),
    .io_put_pc_bits_pc(ibuf_io_put_pc_bits_pc),
    .io_put_pc_bits_is_pre(ibuf_io_put_pc_bits_is_pre)
  );
  ysyx_040318_Br_predictor br_predictor ( // @[fetch.scala 109:34]
    .clock(br_predictor_clock),
    .reset(br_predictor_reset),
    .io_br_info_valid(br_predictor_io_br_info_valid),
    .io_br_info_mispredict(br_predictor_io_br_info_mispredict),
    .io_br_info_br_pc(br_predictor_io_br_info_br_pc),
    .io_br_info_taken(br_predictor_io_br_info_taken),
    .io_br_info_target_next_pc(br_predictor_io_br_info_target_next_pc),
    .io_br_info_br_type(br_predictor_io_br_info_br_type),
    .io_pc(br_predictor_io_pc),
    .io_pre_next_pc(br_predictor_io_pre_next_pc),
    .io_pre_valid(br_predictor_io_pre_valid)
  );
  assign io_get_pre_info_pre_next_pc = io_get_pre_info_valid ? _GEN_20 : 64'h0; // @[fetch.scala 144:43]
  assign io_cpu_addr_valid = reg_bus_valid; // @[fetch.scala 191:41]
  assign io_cpu_addr_bits_addr = reg_pc; // @[fetch.scala 192:33]
  assign io_cpu_data_ready = ibuf_io_cache_buf_ready; // @[fetch.scala 193:41]
  assign io_put_pc_valid = ibuf_io_put_pc_valid; // @[fetch.scala 194:19]
  assign io_put_pc_bits_inst = ibuf_io_put_pc_bits_inst; // @[fetch.scala 194:19]
  assign io_put_pc_bits_pc = ibuf_io_put_pc_bits_pc; // @[fetch.scala 194:19]
  assign io_put_pc_bits_is_pre = ibuf_io_put_pc_bits_is_pre; // @[fetch.scala 194:19]
  assign ibuf_clock = clock;
  assign ibuf_reset = reset;
  assign ibuf_io_flush = io_flush; // @[fetch.scala 185:49]
  assign ibuf_io_cache_buf_valid = io_cpu_data_valid & ~io_flush; // @[fetch.scala 189:62]
  assign ibuf_io_cache_buf_bits_pc = io_cpu_data_bits_pc; // @[fetch.scala 186:41]
  assign ibuf_io_cache_buf_bits_inst = io_cpu_data_bits_pc[2] ? io_cpu_data_bits_data[63:32] : io_cpu_data_bits_data[31:
    0]; // @[fetch.scala 107:23]
  assign ibuf_io_cache_buf_bits_is_pre = 2'h3 == is_pre_tail ? is_pre_fifo_3 : _GEN_45; // @[fetch.scala 188:{39,39}]
  assign ibuf_io_put_pc_ready = io_put_pc_ready; // @[fetch.scala 194:19]
  assign br_predictor_clock = clock;
  assign br_predictor_reset = reset;
  assign br_predictor_io_br_info_valid = io_br_info_valid; // @[fetch.scala 110:33]
  assign br_predictor_io_br_info_mispredict = io_br_info_mispredict; // @[fetch.scala 110:33]
  assign br_predictor_io_br_info_br_pc = io_br_info_br_pc; // @[fetch.scala 110:33]
  assign br_predictor_io_br_info_taken = io_br_info_taken; // @[fetch.scala 110:33]
  assign br_predictor_io_br_info_target_next_pc = io_br_info_target_next_pc; // @[fetch.scala 110:33]
  assign br_predictor_io_br_info_br_type = io_br_info_br_type; // @[fetch.scala 110:33]
  assign br_predictor_io_pc = reg_pc; // @[fetch.scala 111:33]
  always @(posedge clock) begin
    if (reset) begin // @[fetch.scala 103:42]
      reg_pc <= 64'h30000000; // @[fetch.scala 103:42]
    end else if (io_flush) begin // @[fetch.scala 168:23]
      reg_pc <= io_next_pc; // @[fetch.scala 169:27]
    end else if (_pre_enq_T) begin // @[fetch.scala 172:39]
      if (br_predictor_io_pre_valid) begin // @[fetch.scala 173:39]
        reg_pc <= br_predictor_io_pre_next_pc;
      end else begin
        reg_pc <= _reg_pc_T_1;
      end
    end
    reg_bus_valid <= reset | _GEN_42; // @[fetch.scala 105:{42,42}]
    if (reset) begin // @[fetch.scala 115:42]
      pre_info_head <= 2'h0; // @[fetch.scala 115:42]
    end else if (io_flush) begin // @[fetch.scala 124:23]
      pre_info_head <= 2'h0; // @[fetch.scala 129:35]
    end else if (pre_enq) begin // @[fetch.scala 134:37]
      pre_info_head <= _pre_info_head_T_1; // @[fetch.scala 136:41]
    end
    if (reset) begin // @[fetch.scala 116:42]
      pre_info_tail <= 2'h0; // @[fetch.scala 116:42]
    end else if (io_flush) begin // @[fetch.scala 124:23]
      pre_info_tail <= 2'h0; // @[fetch.scala 130:35]
    end else if (io_get_pre_info_valid) begin // @[fetch.scala 138:30]
      pre_info_tail <= _pre_info_tail_T_1; // @[fetch.scala 139:41]
    end
    if (reset) begin // @[fetch.scala 119:42]
      pre_info_fifo_0 <= 64'h0; // @[fetch.scala 119:42]
    end else if (io_flush) begin // @[fetch.scala 124:23]
      pre_info_fifo_0 <= 64'h0; // @[fetch.scala 125:34]
    end else if (pre_enq) begin // @[fetch.scala 134:37]
      if (2'h0 == pre_info_head) begin // @[fetch.scala 135:54]
        pre_info_fifo_0 <= _pre_info_fifo_pre_info_head; // @[fetch.scala 135:54]
      end
    end
    if (reset) begin // @[fetch.scala 119:42]
      pre_info_fifo_1 <= 64'h0; // @[fetch.scala 119:42]
    end else if (io_flush) begin // @[fetch.scala 124:23]
      pre_info_fifo_1 <= 64'h0; // @[fetch.scala 126:34]
    end else if (pre_enq) begin // @[fetch.scala 134:37]
      if (2'h1 == pre_info_head) begin // @[fetch.scala 135:54]
        pre_info_fifo_1 <= _pre_info_fifo_pre_info_head; // @[fetch.scala 135:54]
      end
    end
    if (reset) begin // @[fetch.scala 119:42]
      pre_info_fifo_2 <= 64'h0; // @[fetch.scala 119:42]
    end else if (io_flush) begin // @[fetch.scala 124:23]
      pre_info_fifo_2 <= 64'h0; // @[fetch.scala 127:34]
    end else if (pre_enq) begin // @[fetch.scala 134:37]
      if (2'h2 == pre_info_head) begin // @[fetch.scala 135:54]
        pre_info_fifo_2 <= _pre_info_fifo_pre_info_head; // @[fetch.scala 135:54]
      end
    end
    if (reset) begin // @[fetch.scala 119:42]
      pre_info_fifo_3 <= 64'h0; // @[fetch.scala 119:42]
    end else if (io_flush) begin // @[fetch.scala 124:23]
      pre_info_fifo_3 <= 64'h0; // @[fetch.scala 128:34]
    end else if (pre_enq) begin // @[fetch.scala 134:37]
      if (2'h3 == pre_info_head) begin // @[fetch.scala 135:54]
        pre_info_fifo_3 <= _pre_info_fifo_pre_info_head; // @[fetch.scala 135:54]
      end
    end
    if (reset) begin // @[fetch.scala 146:34]
      is_pre_head <= 2'h0; // @[fetch.scala 146:34]
    end else if (io_flush) begin // @[fetch.scala 149:23]
      is_pre_head <= 2'h0; // @[fetch.scala 154:33]
    end else if (_pre_enq_T) begin // @[fetch.scala 157:39]
      is_pre_head <= _is_pre_head_T_1; // @[fetch.scala 158:37]
    end
    if (reset) begin // @[fetch.scala 147:34]
      is_pre_tail <= 2'h0; // @[fetch.scala 147:34]
    end else if (io_flush) begin // @[fetch.scala 149:23]
      is_pre_tail <= 2'h0; // @[fetch.scala 155:33]
    end else if (_T_2) begin // @[fetch.scala 161:39]
      is_pre_tail <= _is_pre_tail_T_1; // @[fetch.scala 162:37]
    end
    if (reset) begin // @[fetch.scala 148:34]
      is_pre_fifo_0 <= 1'h0; // @[fetch.scala 148:34]
    end else if (io_flush) begin // @[fetch.scala 149:23]
      is_pre_fifo_0 <= 1'h0; // @[fetch.scala 150:33]
    end else if (_pre_enq_T) begin // @[fetch.scala 157:39]
      if (2'h0 == is_pre_head) begin // @[fetch.scala 159:50]
        is_pre_fifo_0 <= br_predictor_io_pre_valid; // @[fetch.scala 159:50]
      end
    end
    if (reset) begin // @[fetch.scala 148:34]
      is_pre_fifo_1 <= 1'h0; // @[fetch.scala 148:34]
    end else if (io_flush) begin // @[fetch.scala 149:23]
      is_pre_fifo_1 <= 1'h0; // @[fetch.scala 151:33]
    end else if (_pre_enq_T) begin // @[fetch.scala 157:39]
      if (2'h1 == is_pre_head) begin // @[fetch.scala 159:50]
        is_pre_fifo_1 <= br_predictor_io_pre_valid; // @[fetch.scala 159:50]
      end
    end
    if (reset) begin // @[fetch.scala 148:34]
      is_pre_fifo_2 <= 1'h0; // @[fetch.scala 148:34]
    end else if (io_flush) begin // @[fetch.scala 149:23]
      is_pre_fifo_2 <= 1'h0; // @[fetch.scala 152:33]
    end else if (_pre_enq_T) begin // @[fetch.scala 157:39]
      if (2'h2 == is_pre_head) begin // @[fetch.scala 159:50]
        is_pre_fifo_2 <= br_predictor_io_pre_valid; // @[fetch.scala 159:50]
      end
    end
    if (reset) begin // @[fetch.scala 148:34]
      is_pre_fifo_3 <= 1'h0; // @[fetch.scala 148:34]
    end else if (io_flush) begin // @[fetch.scala 149:23]
      is_pre_fifo_3 <= 1'h0; // @[fetch.scala 153:33]
    end else if (_pre_enq_T) begin // @[fetch.scala 157:39]
      if (2'h3 == is_pre_head) begin // @[fetch.scala 159:50]
        is_pre_fifo_3 <= br_predictor_io_pre_valid; // @[fetch.scala 159:50]
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
  reg_pc = _RAND_0[63:0];
  _RAND_1 = {1{`RANDOM}};
  reg_bus_valid = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  pre_info_head = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  pre_info_tail = _RAND_3[1:0];
  _RAND_4 = {2{`RANDOM}};
  pre_info_fifo_0 = _RAND_4[63:0];
  _RAND_5 = {2{`RANDOM}};
  pre_info_fifo_1 = _RAND_5[63:0];
  _RAND_6 = {2{`RANDOM}};
  pre_info_fifo_2 = _RAND_6[63:0];
  _RAND_7 = {2{`RANDOM}};
  pre_info_fifo_3 = _RAND_7[63:0];
  _RAND_8 = {1{`RANDOM}};
  is_pre_head = _RAND_8[1:0];
  _RAND_9 = {1{`RANDOM}};
  is_pre_tail = _RAND_9[1:0];
  _RAND_10 = {1{`RANDOM}};
  is_pre_fifo_0 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  is_pre_fifo_1 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  is_pre_fifo_2 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  is_pre_fifo_3 = _RAND_13[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_040318_ALU_EXU(
  input         clock,
  input         reset,
  input         io_valid,
  input         io_is_pre,
  output        io_br_info_valid,
  output        io_br_info_mispredict,
  output [63:0] io_br_info_br_pc,
  output        io_br_info_taken,
  output [63:0] io_br_info_target_next_pc,
  output [1:0]  io_br_info_br_type,
  output        io_get_pre_info_valid,
  input  [63:0] io_get_pre_info_pre_next_pc,
  input  [2:0]  io_opType,
  input  [6:0]  io_exuType,
  input  [63:0] io_op_data1,
  input  [63:0] io_op_data2,
  input  [31:0] io_op_imm,
  input  [63:0] io_op_pc,
  input  [4:0]  io_rs1_addr,
  input  [4:0]  io_dest_addr,
  output [63:0] io_result_wdata,
  output        io_valid_next_pc,
  output [63:0] io_next_pc
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [63:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  is_32 = io_exuType[0]; // @[alu_exu.scala 93:31]
  wire [31:0] _op_data1_T_2 = io_op_data1[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 77:12]
  wire [63:0] _op_data1_T_4 = {_op_data1_T_2,io_op_data1[31:0]}; // @[Cat.scala 33:92]
  wire [63:0] op_data1 = is_32 ? _op_data1_T_4 : io_op_data1; // @[alu_exu.scala 94:27]
  wire [31:0] _op_data2_T_2 = io_op_data2[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 77:12]
  wire [63:0] _op_data2_T_4 = {_op_data2_T_2,io_op_data2[31:0]}; // @[Cat.scala 33:92]
  wire [63:0] op_data2 = is_32 ? _op_data2_T_4 : io_op_data2; // @[alu_exu.scala 95:27]
  wire [31:0] _op_imm_T_2 = io_op_imm[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 77:12]
  wire [63:0] op_imm = {_op_imm_T_2,io_op_imm}; // @[Cat.scala 33:92]
  wire  rs2_is_imm = ~io_exuType[1]; // @[alu_exu.scala 99:27]
  wire [63:0] rs2_data = rs2_is_imm ? op_imm : op_data2; // @[alu_exu.scala 100:27]
  wire  rs1_is_pc = io_exuType[6]; // @[alu_exu.scala 101:36]
  wire  _is_sub_T_2 = io_exuType[4:2] == 3'h2; // @[alu_exu.scala 102:58]
  wire  is_sra = io_exuType[5] | io_exuType[4:2] == 3'h2 | io_exuType[4:2] == 3'h3; // @[alu_exu.scala 102:71]
  wire [63:0] rs1_data = rs1_is_pc ? io_op_pc : op_data1; // @[alu_exu.scala 104:27]
  wire [63:0] _temp_rs2_data_T = rs2_data ^ 64'hffffffffffffffff; // @[alu_exu.scala 105:50]
  wire [63:0] temp_rs2_data = is_sra ? _temp_rs2_data_T : rs2_data; // @[alu_exu.scala 105:32]
  wire [64:0] _add_sub_result_T = {1'h0,rs1_data}; // @[Cat.scala 33:92]
  wire [64:0] _GEN_1 = {{1'd0}, temp_rs2_data}; // @[alu_exu.scala 106:53]
  wire [64:0] _add_sub_result_T_2 = _add_sub_result_T + _GEN_1; // @[alu_exu.scala 106:53]
  wire [64:0] _GEN_2 = {{64'd0}, is_sra}; // @[alu_exu.scala 106:69]
  wire [64:0] add_sub_result = _add_sub_result_T_2 + _GEN_2; // @[alu_exu.scala 106:69]
  wire  u_rs1_l_rs2 = ~add_sub_result[64]; // @[alu_exu.scala 109:23]
  wire  s_rs1_l_rs2 = rs1_data[63] ^ rs2_data[63] ? rs1_data[63] : add_sub_result[63]; // @[alu_exu.scala 111:26]
  wire [5:0] shift_rs2_data = is_32 ? {{1'd0}, rs2_data[4:0]} : rs2_data[5:0]; // @[alu_exu.scala 114:33]
  wire [126:0] _GEN_0 = {{63'd0}, op_data1}; // @[alu_exu.scala 115:33]
  wire [126:0] sll_temp = _GEN_0 << shift_rs2_data; // @[alu_exu.scala 115:33]
  wire [63:0] _srl_temp_T_2 = {32'h0,op_data1[31:0]}; // @[Cat.scala 33:92]
  wire [63:0] _srl_temp_T_3 = is_32 ? _srl_temp_T_2 : op_data1; // @[alu_exu.scala 116:27]
  wire [63:0] srl_temp = _srl_temp_T_3 >> shift_rs2_data; // @[alu_exu.scala 116:82]
  wire [63:0] _sra_temp_T = is_32 ? _op_data1_T_4 : io_op_data1; // @[alu_exu.scala 117:34]
  wire [63:0] sra_temp = $signed(_sra_temp_T) >>> shift_rs2_data; // @[alu_exu.scala 117:60]
  wire [63:0] sr_temp = is_sra ? sra_temp : srl_temp; // @[alu_exu.scala 119:27]
  wire [63:0] _result_data_T_1 = {63'h0,s_rs1_l_rs2}; // @[Cat.scala 33:92]
  wire [63:0] _result_data_T_2 = {63'h0,u_rs1_l_rs2}; // @[Cat.scala 33:92]
  wire [63:0] _result_data_T_3 = op_data1 & rs2_data; // @[alu_exu.scala 126:54]
  wire [63:0] _result_data_T_4 = op_data1 | rs2_data; // @[alu_exu.scala 127:62]
  wire [63:0] _result_data_T_5 = op_data1 ^ rs2_data; // @[alu_exu.scala 128:54]
  wire [63:0] _result_data_T_9 = 3'h2 == io_exuType[4:2] ? _result_data_T_1 : add_sub_result[63:0]; // @[Mux.scala 81:58]
  wire [63:0] _result_data_T_11 = 3'h3 == io_exuType[4:2] ? _result_data_T_2 : _result_data_T_9; // @[Mux.scala 81:58]
  wire [63:0] _result_data_T_13 = 3'h7 == io_exuType[4:2] ? _result_data_T_3 : _result_data_T_11; // @[Mux.scala 81:58]
  wire [63:0] _result_data_T_15 = 3'h6 == io_exuType[4:2] ? _result_data_T_4 : _result_data_T_13; // @[Mux.scala 81:58]
  wire [63:0] _result_data_T_17 = 3'h4 == io_exuType[4:2] ? _result_data_T_5 : _result_data_T_15; // @[Mux.scala 81:58]
  wire [63:0] _result_data_T_19 = 3'h1 == io_exuType[4:2] ? sll_temp[63:0] : _result_data_T_17; // @[Mux.scala 81:58]
  wire [63:0] result_data = 3'h5 == io_exuType[4:2] ? sr_temp : _result_data_T_19; // @[Mux.scala 81:58]
  wire  is_pre = io_is_pre & io_valid; // @[alu_exu.scala 134:45]
  wire  is_br = io_opType == 3'h1; // @[alu_exu.scala 141:52]
  wire  is_eq = op_data1 == op_data2; // @[alu_exu.scala 149:45]
  wire [63:0] temp_1 = _is_sub_T_2 ? io_op_data1 : io_op_pc; // @[alu_exu.scala 150:34]
  wire [63:0] _add_pc_T_1 = temp_1 + op_imm; // @[alu_exu.scala 151:50]
  wire [64:0] add_pc = {1'h1,_add_pc_T_1}; // @[Cat.scala 33:92]
  wire [63:0] op_pc_4 = io_op_pc + 64'h4; // @[alu_exu.scala 152:37]
  wire [64:0] _temp_result_pc_T = is_eq ? add_pc : {{1'd0}, op_pc_4}; // @[alu_exu.scala 155:63]
  wire [64:0] _temp_result_pc_T_1 = is_eq ? {{1'd0}, op_pc_4} : add_pc; // @[alu_exu.scala 156:63]
  wire [64:0] _temp_result_pc_T_2 = s_rs1_l_rs2 ? add_pc : {{1'd0}, op_pc_4}; // @[alu_exu.scala 157:63]
  wire [64:0] _temp_result_pc_T_3 = u_rs1_l_rs2 ? add_pc : {{1'd0}, op_pc_4}; // @[alu_exu.scala 158:63]
  wire [64:0] _temp_result_pc_T_4 = s_rs1_l_rs2 ? {{1'd0}, op_pc_4} : add_pc; // @[alu_exu.scala 159:63]
  wire [64:0] _temp_result_pc_T_5 = u_rs1_l_rs2 ? {{1'd0}, op_pc_4} : add_pc; // @[alu_exu.scala 160:63]
  wire [64:0] _temp_result_pc_T_7 = {add_pc[64:1],1'h0}; // @[Cat.scala 33:92]
  wire [64:0] _temp_result_pc_T_9 = 3'h1 == io_exuType[4:2] ? _temp_result_pc_T_1 : _temp_result_pc_T; // @[Mux.scala 81:58]
  wire [64:0] _temp_result_pc_T_11 = 3'h4 == io_exuType[4:2] ? _temp_result_pc_T_2 : _temp_result_pc_T_9; // @[Mux.scala 81:58]
  wire [64:0] _temp_result_pc_T_13 = 3'h6 == io_exuType[4:2] ? _temp_result_pc_T_3 : _temp_result_pc_T_11; // @[Mux.scala 81:58]
  wire [64:0] _temp_result_pc_T_15 = 3'h5 == io_exuType[4:2] ? _temp_result_pc_T_4 : _temp_result_pc_T_13; // @[Mux.scala 81:58]
  wire [64:0] _temp_result_pc_T_17 = 3'h7 == io_exuType[4:2] ? _temp_result_pc_T_5 : _temp_result_pc_T_15; // @[Mux.scala 81:58]
  wire [64:0] _temp_result_pc_T_19 = 3'h3 == io_exuType[4:2] ? add_pc : _temp_result_pc_T_17; // @[Mux.scala 81:58]
  wire [64:0] _temp_result_pc_T_21 = 3'h2 == io_exuType[4:2] ? _temp_result_pc_T_7 : _temp_result_pc_T_19; // @[Mux.scala 81:58]
  wire [64:0] temp_result_pc = is_br ? _temp_result_pc_T_21 : 65'h0; // @[alu_exu.scala 153:28 154:40]
  wire [63:0] dst_data = is_br ? op_pc_4 : result_data; // @[alu_exu.scala 167:38]
  wire [63:0] next_pc = temp_result_pc[63:0]; // @[alu_exu.scala 168:49]
  wire  valid_next_pc = temp_result_pc[64]; // @[alu_exu.scala 169:49]
  wire  br_valid = is_br & io_valid; // @[alu_exu.scala 171:41]
  wire  flush = is_pre & valid_next_pc & next_pc != io_get_pre_info_pre_next_pc | valid_next_pc & ~is_pre | is_pre & ~
    valid_next_pc; // @[alu_exu.scala 172:109]
  wire  is_jal = 7'h4e == io_exuType; // @[alu_exu.scala 174:40]
  wire  is_jalr = 7'h4a == io_exuType; // @[alu_exu.scala 175:41]
  wire  is_rs1_ra = io_rs1_addr == 5'h1; // @[alu_exu.scala 176:38]
  wire  is_dest_ra = io_dest_addr == 5'h1; // @[alu_exu.scala 177:40]
  wire  is_dest_x0 = io_dest_addr == 5'h0; // @[alu_exu.scala 178:40]
  wire  is_return = is_jalr & is_dest_x0 & is_rs1_ra; // @[alu_exu.scala 179:46]
  wire  is_call = (is_jalr | is_jal) & is_dest_ra; // @[alu_exu.scala 180:39]
  reg [63:0] reg_wdata; // @[alu_exu.scala 182:50]
  reg  reg_br_valid; // @[alu_exu.scala 185:50]
  reg  reg_br_mispredict; // @[alu_exu.scala 186:42]
  reg [63:0] reg_br_pc; // @[alu_exu.scala 187:50]
  reg  reg_taken; // @[alu_exu.scala 188:50]
  reg [63:0] reg_br_target_next_pc; // @[alu_exu.scala 189:50]
  reg [1:0] reg_br_type; // @[alu_exu.scala 190:50]
  wire [31:0] _reg_wdata_T_2 = dst_data[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 77:12]
  wire [63:0] _reg_wdata_T_4 = {_reg_wdata_T_2,dst_data[31:0]}; // @[Cat.scala 33:92]
  assign io_br_info_valid = reg_br_valid; // @[alu_exu.scala 206:49]
  assign io_br_info_mispredict = reg_br_mispredict; // @[alu_exu.scala 207:41]
  assign io_br_info_br_pc = reg_br_pc; // @[alu_exu.scala 208:49]
  assign io_br_info_taken = reg_taken; // @[alu_exu.scala 209:49]
  assign io_br_info_target_next_pc = reg_br_target_next_pc; // @[alu_exu.scala 210:41]
  assign io_br_info_br_type = reg_br_type; // @[alu_exu.scala 211:49]
  assign io_get_pre_info_valid = io_is_pre & io_valid; // @[alu_exu.scala 134:45]
  assign io_result_wdata = reg_wdata; // @[alu_exu.scala 201:33]
  assign io_valid_next_pc = reg_br_mispredict; // @[alu_exu.scala 203:33]
  assign io_next_pc = reg_br_target_next_pc; // @[alu_exu.scala 204:41]
  always @(posedge clock) begin
    if (reset) begin // @[alu_exu.scala 182:50]
      reg_wdata <= 64'h0; // @[alu_exu.scala 182:50]
    end else if (io_valid) begin // @[alu_exu.scala 191:31]
      if (is_32) begin // @[alu_exu.scala 191:44]
        reg_wdata <= _reg_wdata_T_4;
      end else if (is_br) begin // @[alu_exu.scala 167:38]
        reg_wdata <= op_pc_4;
      end else begin
        reg_wdata <= result_data;
      end
    end else begin
      reg_wdata <= 64'h0;
    end
    if (reset) begin // @[alu_exu.scala 185:50]
      reg_br_valid <= 1'h0; // @[alu_exu.scala 185:50]
    end else begin
      reg_br_valid <= br_valid; // @[alu_exu.scala 194:33]
    end
    if (reset) begin // @[alu_exu.scala 186:42]
      reg_br_mispredict <= 1'h0; // @[alu_exu.scala 186:42]
    end else begin
      reg_br_mispredict <= br_valid & flush; // @[alu_exu.scala 195:33]
    end
    if (reset) begin // @[alu_exu.scala 187:50]
      reg_br_pc <= 64'h0; // @[alu_exu.scala 187:50]
    end else if (br_valid) begin // @[alu_exu.scala 196:47]
      reg_br_pc <= io_op_pc;
    end else begin
      reg_br_pc <= 64'h0;
    end
    if (reset) begin // @[alu_exu.scala 188:50]
      reg_taken <= 1'h0; // @[alu_exu.scala 188:50]
    end else begin
      reg_taken <= br_valid & valid_next_pc; // @[alu_exu.scala 197:41]
    end
    if (reset) begin // @[alu_exu.scala 189:50]
      reg_br_target_next_pc <= 64'h0; // @[alu_exu.scala 189:50]
    end else if (br_valid) begin // @[alu_exu.scala 198:39]
      reg_br_target_next_pc <= next_pc;
    end else begin
      reg_br_target_next_pc <= op_pc_4;
    end
    if (reset) begin // @[alu_exu.scala 190:50]
      reg_br_type <= 2'h0; // @[alu_exu.scala 190:50]
    end else if (is_call) begin // @[alu_exu.scala 199:55]
      reg_br_type <= 2'h1;
    end else if (is_return) begin // @[alu_exu.scala 199:82]
      reg_br_type <= 2'h2;
    end else begin
      reg_br_type <= 2'h0;
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
  reg_wdata = _RAND_0[63:0];
  _RAND_1 = {1{`RANDOM}};
  reg_br_valid = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  reg_br_mispredict = _RAND_2[0:0];
  _RAND_3 = {2{`RANDOM}};
  reg_br_pc = _RAND_3[63:0];
  _RAND_4 = {1{`RANDOM}};
  reg_taken = _RAND_4[0:0];
  _RAND_5 = {2{`RANDOM}};
  reg_br_target_next_pc = _RAND_5[63:0];
  _RAND_6 = {1{`RANDOM}};
  reg_br_type = _RAND_6[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_040318_MEM_EXU(
  input         clock,
  input         reset,
  input         io_valid,
  input  [2:0]  io_opType,
  input  [6:0]  io_exuType,
  input  [63:0] io_rs1_data,
  input  [63:0] io_rs2_data,
  input  [31:0] io_imm,
  output [63:0] io_result_wdata,
  output        io_ready,
  output        io_fence_i,
  output        io_is_except,
  output [4:0]  io_exception,
  input         io_dcache_cmd_ready,
  output        io_dcache_cmd_valid,
  output [63:0] io_dcache_cmd_bits_addr,
  output [63:0] io_dcache_cmd_bits_wdata,
  output [7:0]  io_dcache_cmd_bits_wstrb,
  output        io_dcache_cmd_bits_is_w,
  output [1:0]  io_dcache_cmd_bits_size,
  output        io_dcache_cmd_bits_is_fence,
  output        io_dcache_cmd_bits_is_mmio,
  output        io_dcahce_resp_ready,
  input         io_dcahce_resp_valid,
  input  [63:0] io_dcahce_resp_bits_rdata,
  input  [2:0]  io_dcahce_resp_bits_resp_info
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [63:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
`endif // RANDOMIZE_REG_INIT
  wire [31:0] _imm_T_2 = io_imm[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 77:12]
  wire [63:0] imm = {_imm_T_2,io_imm}; // @[Cat.scala 33:92]
  reg  reg_ready; // @[mem_exu.scala 79:34]
  reg [63:0] reg_bus_addr; // @[mem_exu.scala 81:50]
  reg [63:0] reg_bus_wdata; // @[mem_exu.scala 83:50]
  reg [7:0] reg_bus_wstrb; // @[mem_exu.scala 84:50]
  reg  reg_bus_is_w; // @[mem_exu.scala 85:50]
  reg [1:0] reg_bus_size; // @[mem_exu.scala 86:50]
  reg  reg_bus_valid; // @[mem_exu.scala 87:50]
  reg [63:0] reg_result_data; // @[mem_exu.scala 90:42]
  reg [6:0] reg_exuType; // @[mem_exu.scala 93:50]
  reg  reg_fence_i; // @[mem_exu.scala 95:50]
  reg  reg_fence; // @[mem_exu.scala 96:50]
  reg [4:0] reg_except; // @[mem_exu.scala 97:50]
  reg  reg_is_except; // @[mem_exu.scala 98:50]
  reg  reg_is_mmio; // @[mem_exu.scala 99:50]
  reg  reg_ls_state; // @[mem_exu.scala 103:66]
  wire [63:0] _mem_r_data_T_9 = 3'h1 == reg_bus_addr[2:0] ? {{8'd0}, io_dcahce_resp_bits_rdata[63:8]} :
    io_dcahce_resp_bits_rdata; // @[Mux.scala 81:58]
  wire [63:0] _mem_r_data_T_11 = 3'h2 == reg_bus_addr[2:0] ? {{16'd0}, io_dcahce_resp_bits_rdata[63:16]} :
    _mem_r_data_T_9; // @[Mux.scala 81:58]
  wire [63:0] _mem_r_data_T_13 = 3'h3 == reg_bus_addr[2:0] ? {{24'd0}, io_dcahce_resp_bits_rdata[63:24]} :
    _mem_r_data_T_11; // @[Mux.scala 81:58]
  wire [63:0] _mem_r_data_T_15 = 3'h4 == reg_bus_addr[2:0] ? {{32'd0}, io_dcahce_resp_bits_rdata[63:32]} :
    _mem_r_data_T_13; // @[Mux.scala 81:58]
  wire [63:0] _mem_r_data_T_17 = 3'h5 == reg_bus_addr[2:0] ? {{40'd0}, io_dcahce_resp_bits_rdata[63:40]} :
    _mem_r_data_T_15; // @[Mux.scala 81:58]
  wire [63:0] _mem_r_data_T_19 = 3'h6 == reg_bus_addr[2:0] ? {{48'd0}, io_dcahce_resp_bits_rdata[63:48]} :
    _mem_r_data_T_17; // @[Mux.scala 81:58]
  wire [63:0] mem_r_data = 3'h7 == reg_bus_addr[2:0] ? {{56'd0}, io_dcahce_resp_bits_rdata[63:56]} : _mem_r_data_T_19; // @[Mux.scala 81:58]
  wire [55:0] _mem_data_result_T_2 = mem_r_data[7] ? 56'hffffffffffffff : 56'h0; // @[Bitwise.scala 77:12]
  wire [63:0] _mem_data_result_T_4 = {_mem_data_result_T_2,mem_r_data[7:0]}; // @[Cat.scala 33:92]
  wire [63:0] _mem_data_result_T_7 = {56'h0,mem_r_data[7:0]}; // @[Cat.scala 33:92]
  wire [47:0] _mem_data_result_T_10 = mem_r_data[15] ? 48'hffffffffffff : 48'h0; // @[Bitwise.scala 77:12]
  wire [63:0] _mem_data_result_T_12 = {_mem_data_result_T_10,mem_r_data[15:0]}; // @[Cat.scala 33:92]
  wire [63:0] _mem_data_result_T_15 = {48'h0,mem_r_data[15:0]}; // @[Cat.scala 33:92]
  wire [31:0] _mem_data_result_T_18 = mem_r_data[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 77:12]
  wire [63:0] _mem_data_result_T_20 = {_mem_data_result_T_18,mem_r_data[31:0]}; // @[Cat.scala 33:92]
  wire [63:0] _mem_data_result_T_23 = {32'h0,mem_r_data[31:0]}; // @[Cat.scala 33:92]
  wire [63:0] _mem_data_result_T_25 = 7'hc == reg_exuType ? mem_r_data : 64'h0; // @[Mux.scala 81:58]
  wire [63:0] _mem_data_result_T_27 = 7'h0 == reg_exuType ? _mem_data_result_T_4 : _mem_data_result_T_25; // @[Mux.scala 81:58]
  wire [63:0] _mem_data_result_T_29 = 7'h10 == reg_exuType ? _mem_data_result_T_7 : _mem_data_result_T_27; // @[Mux.scala 81:58]
  wire [63:0] _mem_data_result_T_31 = 7'h4 == reg_exuType ? _mem_data_result_T_12 : _mem_data_result_T_29; // @[Mux.scala 81:58]
  wire [63:0] _mem_data_result_T_33 = 7'h14 == reg_exuType ? _mem_data_result_T_15 : _mem_data_result_T_31; // @[Mux.scala 81:58]
  wire [63:0] _mem_data_result_T_35 = 7'h8 == reg_exuType ? _mem_data_result_T_20 : _mem_data_result_T_33; // @[Mux.scala 81:58]
  wire [63:0] mem_data_result = 7'h18 == reg_exuType ? _mem_data_result_T_23 : _mem_data_result_T_35; // @[Mux.scala 81:58]
  wire [63:0] mem_addr = io_rs1_data + imm; // @[mem_exu.scala 127:36]
  wire  w_mem_en = io_valid & io_exuType[1]; // @[mem_exu.scala 128:33]
  wire [1:0] bus_size = io_exuType[3:2]; // @[mem_exu.scala 129:34]
  wire [7:0] _mem_wstrb_T_1 = 8'h1 << mem_addr[2:0]; // @[mem_exu.scala 132:62]
  wire [14:0] _mem_wstrb_T_3 = 15'hff << mem_addr[2:0]; // @[mem_exu.scala 133:61]
  wire [8:0] _mem_wstrb_T_5 = 9'h3 << mem_addr[2:0]; // @[mem_exu.scala 134:61]
  wire [10:0] _mem_wstrb_T_7 = 11'hf << mem_addr[2:0]; // @[mem_exu.scala 135:61]
  wire [63:0] _mem_wstrb_T_9 = 7'h2 == io_exuType ? {{56'd0}, _mem_wstrb_T_1} : 64'h0; // @[Mux.scala 81:58]
  wire [63:0] _mem_wstrb_T_11 = 7'he == io_exuType ? {{49'd0}, _mem_wstrb_T_3} : _mem_wstrb_T_9; // @[Mux.scala 81:58]
  wire [63:0] _mem_wstrb_T_13 = 7'h6 == io_exuType ? {{55'd0}, _mem_wstrb_T_5} : _mem_wstrb_T_11; // @[Mux.scala 81:58]
  wire [63:0] mem_wstrb = 7'ha == io_exuType ? {{53'd0}, _mem_wstrb_T_7} : _mem_wstrb_T_13; // @[Mux.scala 81:58]
  wire [5:0] _mem_w_data_T_1 = {mem_addr[2:0],3'h0}; // @[Cat.scala 33:92]
  wire [126:0] _GEN_0 = {{63'd0}, io_rs2_data}; // @[mem_exu.scala 139:44]
  wire [126:0] mem_w_data = _GEN_0 << _mem_w_data_T_1; // @[mem_exu.scala 139:44]
  wire  _reg_fence_T = io_opType == 3'h6; // @[mem_exu.scala 171:71]
  wire  _reg_difftest_peripheral_T_4 = ~_reg_fence_T; // @[mem_exu.scala 172:106]
  wire [126:0] _GEN_3 = io_valid ? mem_w_data : 127'h0; // @[mem_exu.scala 161:36 144:41 165:49]
  wire [63:0] _GEN_4 = io_valid ? mem_wstrb : 64'h0; // @[mem_exu.scala 161:36 145:41 166:49]
  wire  _GEN_5 = io_valid & w_mem_en; // @[mem_exu.scala 161:36 146:41 167:49]
  wire  _GEN_7 = io_valid ? 1'h0 : 1'h1; // @[mem_exu.scala 161:36 155:49 170:57]
  wire  _GEN_8 = io_valid & io_opType == 3'h6; // @[mem_exu.scala 161:36 159:49 171:57]
  wire  _GEN_10 = io_valid & (mem_addr < 64'h80000000 & _reg_difftest_peripheral_T_4); // @[mem_exu.scala 161:36 160:49 173:49]
  wire  _T_2 = io_dcahce_resp_ready & io_dcahce_resp_valid; // @[Decoupled.scala 52:35]
  wire [2:0] _reg_except_T_1 = io_dcahce_resp_bits_resp_info[1] ? 3'h7 : 3'h5; // @[mem_exu.scala 189:63]
  wire  _GEN_21 = _T_2 | reg_ready; // @[mem_exu.scala 183:50 190:57 79:34]
  wire  _GEN_32 = reg_ls_state ? _GEN_21 : reg_ready; // @[mem_exu.scala 140:29 79:34]
  wire [126:0] _GEN_35 = ~reg_ls_state ? _GEN_3 : {{63'd0}, reg_bus_wdata}; // @[mem_exu.scala 140:29 83:50]
  wire [63:0] _GEN_36 = ~reg_ls_state ? _GEN_4 : {{56'd0}, reg_bus_wstrb}; // @[mem_exu.scala 140:29 84:50]
  wire  _GEN_44 = ~reg_ls_state ? _GEN_7 : _GEN_32; // @[mem_exu.scala 140:29]
  wire [126:0] _GEN_51 = reset ? 127'h0 : _GEN_35; // @[mem_exu.scala 83:{50,50}]
  wire [63:0] _GEN_52 = reset ? 64'h0 : _GEN_36; // @[mem_exu.scala 84:{50,50}]
  assign io_result_wdata = reg_result_data; // @[mem_exu.scala 195:33]
  assign io_ready = reg_ready; // @[mem_exu.scala 197:41]
  assign io_fence_i = reg_fence_i; // @[mem_exu.scala 198:41]
  assign io_is_except = reg_is_except; // @[mem_exu.scala 200:33]
  assign io_exception = reg_except; // @[mem_exu.scala 201:33]
  assign io_dcache_cmd_valid = reg_bus_valid; // @[mem_exu.scala 203:49]
  assign io_dcache_cmd_bits_addr = reg_bus_addr; // @[mem_exu.scala 204:41]
  assign io_dcache_cmd_bits_wdata = reg_bus_wdata; // @[mem_exu.scala 205:41]
  assign io_dcache_cmd_bits_wstrb = reg_bus_wstrb; // @[mem_exu.scala 206:41]
  assign io_dcache_cmd_bits_is_w = reg_bus_is_w; // @[mem_exu.scala 207:41]
  assign io_dcache_cmd_bits_size = reg_bus_size; // @[mem_exu.scala 208:41]
  assign io_dcache_cmd_bits_is_fence = reg_fence; // @[mem_exu.scala 209:41]
  assign io_dcache_cmd_bits_is_mmio = reg_is_mmio; // @[mem_exu.scala 210:41]
  assign io_dcahce_resp_ready = 1'h1; // @[mem_exu.scala 212:33]
  always @(posedge clock) begin
    reg_ready <= reset | _GEN_44; // @[mem_exu.scala 79:{34,34}]
    if (reset) begin // @[mem_exu.scala 81:50]
      reg_bus_addr <= 64'h0; // @[mem_exu.scala 81:50]
    end else if (~reg_ls_state) begin // @[mem_exu.scala 140:29]
      if (io_valid) begin // @[mem_exu.scala 161:36]
        reg_bus_addr <= mem_addr; // @[mem_exu.scala 164:49]
      end else begin
        reg_bus_addr <= 64'h0; // @[mem_exu.scala 143:41]
      end
    end
    reg_bus_wdata <= _GEN_51[63:0]; // @[mem_exu.scala 83:{50,50}]
    reg_bus_wstrb <= _GEN_52[7:0]; // @[mem_exu.scala 84:{50,50}]
    if (reset) begin // @[mem_exu.scala 85:50]
      reg_bus_is_w <= 1'h0; // @[mem_exu.scala 85:50]
    end else if (~reg_ls_state) begin // @[mem_exu.scala 140:29]
      reg_bus_is_w <= _GEN_5;
    end else if (reg_ls_state) begin // @[mem_exu.scala 140:29]
      if (io_dcache_cmd_ready) begin // @[mem_exu.scala 177:50]
        reg_bus_is_w <= 1'h0; // @[mem_exu.scala 179:49]
      end
    end
    if (reset) begin // @[mem_exu.scala 86:50]
      reg_bus_size <= 2'h3; // @[mem_exu.scala 86:50]
    end else if (~reg_ls_state) begin // @[mem_exu.scala 140:29]
      if (io_valid) begin // @[mem_exu.scala 161:36]
        reg_bus_size <= bus_size; // @[mem_exu.scala 169:49]
      end else begin
        reg_bus_size <= 2'h0; // @[mem_exu.scala 148:41]
      end
    end
    if (reset) begin // @[mem_exu.scala 87:50]
      reg_bus_valid <= 1'h0; // @[mem_exu.scala 87:50]
    end else if (~reg_ls_state) begin // @[mem_exu.scala 140:29]
      reg_bus_valid <= io_valid;
    end else if (reg_ls_state) begin // @[mem_exu.scala 140:29]
      if (io_dcache_cmd_ready) begin // @[mem_exu.scala 177:50]
        reg_bus_valid <= 1'h0; // @[mem_exu.scala 178:49]
      end
    end
    if (reset) begin // @[mem_exu.scala 90:42]
      reg_result_data <= 64'h0; // @[mem_exu.scala 90:42]
    end else if (~reg_ls_state) begin // @[mem_exu.scala 140:29]
      reg_result_data <= 64'h0; // @[mem_exu.scala 153:41]
    end else if (reg_ls_state) begin // @[mem_exu.scala 140:29]
      if (_T_2) begin // @[mem_exu.scala 183:50]
        reg_result_data <= mem_data_result; // @[mem_exu.scala 185:49]
      end
    end
    if (reset) begin // @[mem_exu.scala 93:50]
      reg_exuType <= 7'h0; // @[mem_exu.scala 93:50]
    end else if (~reg_ls_state) begin // @[mem_exu.scala 140:29]
      if (io_valid) begin // @[mem_exu.scala 161:36]
        reg_exuType <= io_exuType; // @[mem_exu.scala 163:57]
      end else begin
        reg_exuType <= 7'h0; // @[mem_exu.scala 150:49]
      end
    end
    if (reset) begin // @[mem_exu.scala 95:50]
      reg_fence_i <= 1'h0; // @[mem_exu.scala 95:50]
    end else if (~reg_ls_state) begin // @[mem_exu.scala 140:29]
      reg_fence_i <= 1'h0; // @[mem_exu.scala 157:49]
    end else if (reg_ls_state) begin // @[mem_exu.scala 140:29]
      if (_T_2) begin // @[mem_exu.scala 183:50]
        reg_fence_i <= io_dcahce_resp_bits_resp_info == 3'h4; // @[mem_exu.scala 187:57]
      end
    end
    if (reset) begin // @[mem_exu.scala 96:50]
      reg_fence <= 1'h0; // @[mem_exu.scala 96:50]
    end else if (~reg_ls_state) begin // @[mem_exu.scala 140:29]
      reg_fence <= _GEN_8;
    end else if (reg_ls_state) begin // @[mem_exu.scala 140:29]
      if (io_dcache_cmd_ready) begin // @[mem_exu.scala 177:50]
        reg_fence <= 1'h0; // @[mem_exu.scala 180:57]
      end
    end
    if (reset) begin // @[mem_exu.scala 97:50]
      reg_except <= 5'h0; // @[mem_exu.scala 97:50]
    end else if (!(~reg_ls_state)) begin // @[mem_exu.scala 140:29]
      if (reg_ls_state) begin // @[mem_exu.scala 140:29]
        if (_T_2) begin // @[mem_exu.scala 183:50]
          reg_except <= {{2'd0}, _reg_except_T_1}; // @[mem_exu.scala 189:57]
        end
      end
    end
    if (reset) begin // @[mem_exu.scala 98:50]
      reg_is_except <= 1'h0; // @[mem_exu.scala 98:50]
    end else if (~reg_ls_state) begin // @[mem_exu.scala 140:29]
      reg_is_except <= 1'h0; // @[mem_exu.scala 158:41]
    end else if (reg_ls_state) begin // @[mem_exu.scala 140:29]
      if (_T_2) begin // @[mem_exu.scala 183:50]
        reg_is_except <= io_dcahce_resp_bits_resp_info[0]; // @[mem_exu.scala 188:49]
      end
    end
    if (reset) begin // @[mem_exu.scala 99:50]
      reg_is_mmio <= 1'h0; // @[mem_exu.scala 99:50]
    end else if (~reg_ls_state) begin // @[mem_exu.scala 140:29]
      reg_is_mmio <= _GEN_10;
    end else if (reg_ls_state) begin // @[mem_exu.scala 140:29]
      if (io_dcache_cmd_ready) begin // @[mem_exu.scala 177:50]
        reg_is_mmio <= 1'h0; // @[mem_exu.scala 181:57]
      end
    end
    if (reset) begin // @[mem_exu.scala 103:66]
      reg_ls_state <= 1'h0; // @[mem_exu.scala 103:66]
    end else if (~reg_ls_state) begin // @[mem_exu.scala 140:29]
      reg_ls_state <= io_valid;
    end else if (reg_ls_state) begin // @[mem_exu.scala 140:29]
      if (_T_2) begin // @[mem_exu.scala 183:50]
        reg_ls_state <= 1'h0; // @[mem_exu.scala 184:49]
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
  reg_ready = _RAND_0[0:0];
  _RAND_1 = {2{`RANDOM}};
  reg_bus_addr = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  reg_bus_wdata = _RAND_2[63:0];
  _RAND_3 = {1{`RANDOM}};
  reg_bus_wstrb = _RAND_3[7:0];
  _RAND_4 = {1{`RANDOM}};
  reg_bus_is_w = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  reg_bus_size = _RAND_5[1:0];
  _RAND_6 = {1{`RANDOM}};
  reg_bus_valid = _RAND_6[0:0];
  _RAND_7 = {2{`RANDOM}};
  reg_result_data = _RAND_7[63:0];
  _RAND_8 = {1{`RANDOM}};
  reg_exuType = _RAND_8[6:0];
  _RAND_9 = {1{`RANDOM}};
  reg_fence_i = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  reg_fence = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  reg_except = _RAND_11[4:0];
  _RAND_12 = {1{`RANDOM}};
  reg_is_except = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  reg_is_mmio = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  reg_ls_state = _RAND_14[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_040318_DIV(
  input         clock,
  input         reset,
  input         io_valid,
  input  [63:0] io_rs1_data,
  input  [63:0] io_rs2_data,
  input  [6:0]  io_exuType,
  output [63:0] io_dest_data,
  output        io_dest_is_w,
  output        io_ready
);
`ifdef RANDOMIZE_REG_INIT
  reg [95:0] _RAND_0;
  reg [95:0] _RAND_1;
  reg [95:0] _RAND_2;
  reg [95:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
`endif // RANDOMIZE_REG_INIT
  wire  is_32 = io_exuType[0]; // @[mu_exu.scala 140:53]
  wire  is_signed = ~io_exuType[2]; // @[mu_exu.scala 141:35]
  wire [32:0] _dividend_T_2 = io_rs1_data[31] ? 33'h1ffffffff : 33'h0; // @[Bitwise.scala 77:12]
  wire [64:0] _dividend_T_4 = {_dividend_T_2,io_rs1_data[31:0]}; // @[Cat.scala 33:92]
  wire [64:0] _dividend_T_7 = {33'h0,io_rs1_data[31:0]}; // @[Cat.scala 33:92]
  wire [64:0] _dividend_T_8 = is_signed ? _dividend_T_4 : _dividend_T_7; // @[mu_exu.scala 143:58]
  wire [64:0] _dividend_T_11 = {io_rs1_data[63],io_rs1_data}; // @[Cat.scala 33:92]
  wire [64:0] _dividend_T_13 = {1'h0,io_rs1_data}; // @[Cat.scala 33:92]
  wire [64:0] _dividend_T_14 = is_signed ? _dividend_T_11 : _dividend_T_13; // @[mu_exu.scala 144:52]
  wire [64:0] _dividend_T_15 = is_32 ? _dividend_T_8 : _dividend_T_14; // @[mu_exu.scala 143:48]
  wire [64:0] dividend = io_valid ? _dividend_T_15 : 65'h0; // @[mu_exu.scala 143:38]
  wire [32:0] _divisor_T_2 = io_rs2_data[31] ? 33'h1ffffffff : 33'h0; // @[Bitwise.scala 77:12]
  wire [64:0] _divisor_T_4 = {_divisor_T_2,io_rs2_data[31:0]}; // @[Cat.scala 33:92]
  wire [64:0] _divisor_T_7 = {33'h0,io_rs2_data[31:0]}; // @[Cat.scala 33:92]
  wire [64:0] _divisor_T_8 = is_signed ? _divisor_T_4 : _divisor_T_7; // @[mu_exu.scala 146:66]
  wire [64:0] _divisor_T_11 = {io_rs2_data[63],io_rs2_data}; // @[Cat.scala 33:92]
  wire [64:0] _divisor_T_13 = {1'h0,io_rs2_data}; // @[Cat.scala 33:92]
  wire [64:0] _divisor_T_14 = is_signed ? _divisor_T_11 : _divisor_T_13; // @[mu_exu.scala 147:52]
  wire [64:0] _divisor_T_15 = is_32 ? _divisor_T_8 : _divisor_T_14; // @[mu_exu.scala 146:56]
  wire [64:0] divisor = io_valid ? _divisor_T_15 : 65'h0; // @[mu_exu.scala 146:46]
  wire [64:0] _rem_T_2 = io_rs1_data[31] ? 65'h1ffffffffffffffff : 65'h0; // @[Bitwise.scala 77:12]
  wire [64:0] _rem_T_3 = is_signed ? _rem_T_2 : 65'h0; // @[mu_exu.scala 149:66]
  wire [64:0] _rem_T_6 = io_rs1_data[63] ? 65'h1ffffffffffffffff : 65'h0; // @[Bitwise.scala 77:12]
  wire [64:0] _rem_T_7 = is_signed ? _rem_T_6 : 65'h0; // @[mu_exu.scala 149:107]
  wire [64:0] _rem_T_8 = is_32 ? _rem_T_3 : _rem_T_7; // @[mu_exu.scala 149:56]
  wire [64:0] rem = io_valid ? _rem_T_8 : 65'h0; // @[mu_exu.scala 149:46]
  reg [64:0] reg_divisor; // @[mu_exu.scala 151:42]
  reg [65:0] reg_dividend; // @[mu_exu.scala 152:42]
  reg [64:0] reg_rem; // @[mu_exu.scala 153:42]
  reg [65:0] reg_q; // @[mu_exu.scala 154:50]
  wire [64:0] _neg_divisor_T = ~reg_divisor; // @[mu_exu.scala 157:36]
  wire [64:0] neg_divisor = _neg_divisor_T + 65'h1; // @[mu_exu.scala 157:50]
  reg [1:0] reg_state; // @[mu_exu.scala 159:42]
  reg [6:0] reg_cnt; // @[mu_exu.scala 160:50]
  reg [6:0] reg_exuType; // @[mu_exu.scala 161:42]
  reg  reg_ready; // @[mu_exu.scala 162:42]
  wire  _temp_result_T = ~reg_ready; // @[mu_exu.scala 163:39]
  wire [130:0] _temp_result_T_1 = {reg_rem,reg_q}; // @[Cat.scala 33:92]
  wire [131:0] _temp_result_T_2 = {_temp_result_T_1, 1'h0}; // @[mu_exu.scala 163:69]
  wire  _temp_result_T_5 = reg_rem[64] ^ reg_divisor[64]; // @[mu_exu.scala 163:91]
  wire [130:0] _temp_result_T_6 = {reg_divisor,66'h0}; // @[Cat.scala 33:92]
  wire [130:0] _temp_result_T_7 = {neg_divisor,66'h1}; // @[Cat.scala 33:92]
  wire [130:0] _temp_result_T_8 = reg_rem[64] ^ reg_divisor[64] ? _temp_result_T_6 : _temp_result_T_7; // @[mu_exu.scala 163:79]
  wire [131:0] _GEN_44 = {{1'd0}, _temp_result_T_8}; // @[mu_exu.scala 163:75]
  wire [131:0] _temp_result_T_10 = _temp_result_T_2 + _GEN_44; // @[mu_exu.scala 163:75]
  wire [131:0] temp_result = ~reg_ready ? _temp_result_T_10 : 132'h0; // @[mu_exu.scala 163:38]
  wire  rem_is_0 = reg_rem == 65'h0; // @[mu_exu.scala 166:33]
  wire  rem_is_neg_div = reg_rem == neg_divisor; // @[mu_exu.scala 167:39]
  wire  rem_is_div = reg_rem == reg_divisor; // @[mu_exu.scala 168:39]
  wire  is_need_correct = _temp_result_T & ((reg_rem[64] ^ reg_dividend[65]) & ~rem_is_0 | rem_is_neg_div | rem_is_div); // @[mu_exu.scala 169:34]
  reg  reg_dest_is_w; // @[mu_exu.scala 172:42]
  wire [65:0] _reg_dividend_T = {dividend,1'h0}; // @[Cat.scala 33:92]
  wire [64:0] _reg_rem_T_4 = rem + divisor; // @[mu_exu.scala 189:92]
  wire [64:0] _reg_rem_T_5 = ~divisor; // @[mu_exu.scala 189:106]
  wire [64:0] _reg_rem_T_7 = rem + _reg_rem_T_5; // @[mu_exu.scala 189:104]
  wire [64:0] _reg_rem_T_9 = _reg_rem_T_7 + 65'h1; // @[mu_exu.scala 189:115]
  wire [65:0] _GEN_1 = io_valid ? _reg_dividend_T : 66'h0; // @[mu_exu.scala 186:36 177:41 188:49]
  wire  _GEN_4 = io_valid ? 1'h0 : 1'h1; // @[mu_exu.scala 186:36 180:49 191:57]
  wire [6:0] _reg_cnt_T_1 = reg_cnt + 7'h1; // @[mu_exu.scala 197:68]
  wire [66:0] _reg_q_T_5 = {reg_q, 1'h0}; // @[mu_exu.scala 204:82]
  wire [66:0] _reg_q_T_7 = _reg_q_T_5 + 67'h1; // @[mu_exu.scala 204:88]
  wire [66:0] _reg_q_T_11 = _temp_result_T_5 ? _reg_q_T_7 : _reg_q_T_7; // @[mu_exu.scala 204:47]
  wire [64:0] _reg_rem_T_13 = reg_rem + reg_divisor; // @[mu_exu.scala 220:68]
  wire [65:0] _reg_q_T_13 = reg_q - 66'h1; // @[mu_exu.scala 221:66]
  wire [64:0] _reg_rem_T_15 = reg_rem + neg_divisor; // @[mu_exu.scala 223:68]
  wire [65:0] _reg_q_T_15 = reg_q + 66'h1; // @[mu_exu.scala 224:66]
  wire [64:0] _GEN_7 = _temp_result_T_5 ? _reg_rem_T_13 : _reg_rem_T_15; // @[mu_exu.scala 219:74 220:57 223:57]
  wire [65:0] _GEN_8 = _temp_result_T_5 ? _reg_q_T_13 : _reg_q_T_15; // @[mu_exu.scala 219:74 221:57 224:57]
  wire [64:0] _GEN_9 = is_need_correct ? _GEN_7 : reg_rem; // @[mu_exu.scala 153:42 218:54]
  wire [65:0] _GEN_10 = is_need_correct ? _GEN_8 : reg_q; // @[mu_exu.scala 154:50 218:54]
  wire [65:0] _GEN_17 = 2'h3 == reg_state ? _GEN_10 : reg_q; // @[mu_exu.scala 174:26 154:50]
  wire [64:0] _GEN_18 = 2'h3 == reg_state ? _GEN_9 : reg_rem; // @[mu_exu.scala 174:26 153:42]
  wire  _GEN_19 = 2'h3 == reg_state | reg_ready; // @[mu_exu.scala 174:26 162:42]
  wire [1:0] _GEN_21 = 2'h3 == reg_state ? 2'h0 : reg_state; // @[mu_exu.scala 174:26 159:42]
  wire [6:0] _GEN_22 = 2'h3 == reg_state ? 7'h0 : reg_cnt; // @[mu_exu.scala 174:26 160:50]
  wire [66:0] _GEN_23 = 2'h2 == reg_state ? _reg_q_T_11 : {{1'd0}, _GEN_17}; // @[mu_exu.scala 174:26 204:41]
  wire  _GEN_25 = 2'h2 == reg_state ? reg_ready : _GEN_19; // @[mu_exu.scala 174:26 206:41]
  wire [66:0] _GEN_30 = 2'h1 == reg_state ? {{1'd0}, temp_result[65:0]} : _GEN_23; // @[mu_exu.scala 174:26 198:41]
  wire  _GEN_33 = 2'h1 == reg_state ? reg_ready : _GEN_25; // @[mu_exu.scala 174:26 201:41]
  wire  _GEN_39 = 2'h0 == reg_state ? _GEN_4 : _GEN_33; // @[mu_exu.scala 174:26]
  wire [66:0] _GEN_41 = 2'h0 == reg_state ? {{1'd0}, _GEN_1} : _GEN_30; // @[mu_exu.scala 174:26]
  wire  reg_is_32 = reg_exuType[0]; // @[mu_exu.scala 234:46]
  wire  reg_is_rem = reg_exuType[3]; // @[mu_exu.scala 235:46]
  wire [31:0] _rem_adjust_T_2 = reg_rem[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 77:12]
  wire [63:0] _rem_adjust_T_4 = {_rem_adjust_T_2,reg_rem[31:0]}; // @[Cat.scala 33:92]
  wire [63:0] rem_adjust = reg_is_32 ? _rem_adjust_T_4 : reg_rem[63:0]; // @[mu_exu.scala 236:38]
  wire [31:0] _q_adjust_T_2 = reg_q[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 77:12]
  wire [63:0] _q_adjust_T_4 = {_q_adjust_T_2,reg_q[31:0]}; // @[Cat.scala 33:92]
  wire [63:0] q_adjust = reg_is_32 ? _q_adjust_T_4 : reg_q[63:0]; // @[mu_exu.scala 237:38]
  wire [66:0] _GEN_45 = reset ? 67'h0 : _GEN_41; // @[mu_exu.scala 154:{50,50}]
  assign io_dest_data = reg_is_rem ? rem_adjust : q_adjust; // @[mu_exu.scala 238:39]
  assign io_dest_is_w = reg_dest_is_w; // @[mu_exu.scala 239:33]
  assign io_ready = reg_ready; // @[mu_exu.scala 240:41]
  always @(posedge clock) begin
    if (reset) begin // @[mu_exu.scala 151:42]
      reg_divisor <= 65'h0; // @[mu_exu.scala 151:42]
    end else if (2'h0 == reg_state) begin // @[mu_exu.scala 174:26]
      if (io_valid) begin // @[mu_exu.scala 186:36]
        if (io_valid) begin // @[mu_exu.scala 146:46]
          reg_divisor <= _divisor_T_15;
        end else begin
          reg_divisor <= 65'h0;
        end
      end else begin
        reg_divisor <= 65'h0; // @[mu_exu.scala 176:41]
      end
    end
    if (reset) begin // @[mu_exu.scala 152:42]
      reg_dividend <= 66'h0; // @[mu_exu.scala 152:42]
    end else if (2'h0 == reg_state) begin // @[mu_exu.scala 174:26]
      if (io_valid) begin // @[mu_exu.scala 186:36]
        reg_dividend <= _reg_dividend_T; // @[mu_exu.scala 188:49]
      end else begin
        reg_dividend <= 66'h0; // @[mu_exu.scala 177:41]
      end
    end
    if (reset) begin // @[mu_exu.scala 153:42]
      reg_rem <= 65'h0; // @[mu_exu.scala 153:42]
    end else if (2'h0 == reg_state) begin // @[mu_exu.scala 174:26]
      if (io_valid) begin // @[mu_exu.scala 186:36]
        if (divisor[64] ^ dividend[64]) begin // @[mu_exu.scala 189:63]
          reg_rem <= _reg_rem_T_4;
        end else begin
          reg_rem <= _reg_rem_T_9;
        end
      end else begin
        reg_rem <= 65'h0; // @[mu_exu.scala 178:49]
      end
    end else if (2'h1 == reg_state) begin // @[mu_exu.scala 174:26]
      reg_rem <= temp_result[130:66]; // @[mu_exu.scala 199:41]
    end else if (!(2'h2 == reg_state)) begin // @[mu_exu.scala 174:26]
      reg_rem <= _GEN_18;
    end
    reg_q <= _GEN_45[65:0]; // @[mu_exu.scala 154:{50,50}]
    if (reset) begin // @[mu_exu.scala 159:42]
      reg_state <= 2'h0; // @[mu_exu.scala 159:42]
    end else if (2'h0 == reg_state) begin // @[mu_exu.scala 174:26]
      if (io_valid) begin // @[mu_exu.scala 186:36]
        reg_state <= 2'h1; // @[mu_exu.scala 190:57]
      end else begin
        reg_state <= 2'h0; // @[mu_exu.scala 179:49]
      end
    end else if (2'h1 == reg_state) begin // @[mu_exu.scala 174:26]
      if (reg_cnt == 7'h40) begin // @[mu_exu.scala 200:69]
        reg_state <= 2'h2;
      end
    end else if (2'h2 == reg_state) begin // @[mu_exu.scala 174:26]
      reg_state <= 2'h3; // @[mu_exu.scala 205:41]
    end else begin
      reg_state <= _GEN_21;
    end
    if (reset) begin // @[mu_exu.scala 160:50]
      reg_cnt <= 7'h0; // @[mu_exu.scala 160:50]
    end else if (2'h0 == reg_state) begin // @[mu_exu.scala 174:26]
      reg_cnt <= 7'h0; // @[mu_exu.scala 184:49]
    end else if (2'h1 == reg_state) begin // @[mu_exu.scala 174:26]
      reg_cnt <= _reg_cnt_T_1; // @[mu_exu.scala 197:41]
    end else if (!(2'h2 == reg_state)) begin // @[mu_exu.scala 174:26]
      reg_cnt <= _GEN_22;
    end
    if (reset) begin // @[mu_exu.scala 161:42]
      reg_exuType <= 7'h0; // @[mu_exu.scala 161:42]
    end else if (2'h0 == reg_state) begin // @[mu_exu.scala 174:26]
      if (io_valid) begin // @[mu_exu.scala 186:36]
        reg_exuType <= io_exuType; // @[mu_exu.scala 192:57]
      end else begin
        reg_exuType <= 7'h0; // @[mu_exu.scala 181:49]
      end
    end
    reg_ready <= reset | _GEN_39; // @[mu_exu.scala 162:{42,42}]
    if (reset) begin // @[mu_exu.scala 172:42]
      reg_dest_is_w <= 1'h0; // @[mu_exu.scala 172:42]
    end else if (2'h0 == reg_state) begin // @[mu_exu.scala 174:26]
      reg_dest_is_w <= 1'h0; // @[mu_exu.scala 185:41]
    end else if (!(2'h1 == reg_state)) begin // @[mu_exu.scala 174:26]
      if (!(2'h2 == reg_state)) begin // @[mu_exu.scala 174:26]
        reg_dest_is_w <= 2'h3 == reg_state | reg_dest_is_w;
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
  _RAND_0 = {3{`RANDOM}};
  reg_divisor = _RAND_0[64:0];
  _RAND_1 = {3{`RANDOM}};
  reg_dividend = _RAND_1[65:0];
  _RAND_2 = {3{`RANDOM}};
  reg_rem = _RAND_2[64:0];
  _RAND_3 = {3{`RANDOM}};
  reg_q = _RAND_3[65:0];
  _RAND_4 = {1{`RANDOM}};
  reg_state = _RAND_4[1:0];
  _RAND_5 = {1{`RANDOM}};
  reg_cnt = _RAND_5[6:0];
  _RAND_6 = {1{`RANDOM}};
  reg_exuType = _RAND_6[6:0];
  _RAND_7 = {1{`RANDOM}};
  reg_ready = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  reg_dest_is_w = _RAND_8[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_040318_MUL(
  input         clock,
  input         reset,
  input         io_valid,
  input  [63:0] io_rs1_data,
  input  [63:0] io_rs2_data,
  input  [6:0]  io_exuType,
  output [63:0] io_dest_data,
  output        io_ready
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [95:0] _RAND_2;
  reg [159:0] _RAND_3;
  reg [159:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  is_32 = io_exuType[2]; // @[mu_exu.scala 39:53]
  wire  is_rs1_signed = io_exuType[1]; // @[mu_exu.scala 40:45]
  wire  is_rs2_signed = io_exuType[0]; // @[mu_exu.scala 41:45]
  wire [97:0] _mul_data1_T_2 = io_rs1_data[31] ? 98'h3ffffffffffffffffffffffff : 98'h0; // @[Bitwise.scala 77:12]
  wire [129:0] _mul_data1_T_4 = {_mul_data1_T_2,io_rs1_data[31:0]}; // @[Cat.scala 33:92]
  wire [65:0] _mul_data1_T_7 = io_rs1_data[63] ? 66'h3ffffffffffffffff : 66'h0; // @[Bitwise.scala 77:12]
  wire [129:0] _mul_data1_T_8 = {_mul_data1_T_7,io_rs1_data}; // @[Cat.scala 33:92]
  wire [129:0] _mul_data1_T_9 = {66'h0,io_rs1_data}; // @[Cat.scala 33:92]
  wire [129:0] _mul_data1_T_10 = is_rs1_signed ? _mul_data1_T_8 : _mul_data1_T_9; // @[mu_exu.scala 44:90]
  wire [129:0] _mul_data1_T_11 = is_32 ? _mul_data1_T_4 : _mul_data1_T_10; // @[mu_exu.scala 44:38]
  wire [129:0] mul_data1 = io_valid ? _mul_data1_T_11 : 130'h0; // @[mu_exu.scala 44:28]
  wire [32:0] _mul_data2_T_2 = io_rs2_data[31] ? 33'h1ffffffff : 33'h0; // @[Bitwise.scala 77:12]
  wire [64:0] _mul_data2_T_4 = {_mul_data2_T_2,io_rs2_data[31:0]}; // @[Cat.scala 33:92]
  wire [64:0] _mul_data2_T_6 = {io_rs2_data[63],io_rs2_data}; // @[Cat.scala 33:92]
  wire [64:0] _mul_data2_T_7 = {1'h0,io_rs2_data}; // @[Cat.scala 33:92]
  wire [64:0] _mul_data2_T_8 = is_rs2_signed ? _mul_data2_T_6 : _mul_data2_T_7; // @[mu_exu.scala 45:90]
  wire [64:0] _mul_data2_T_9 = is_32 ? _mul_data2_T_4 : _mul_data2_T_8; // @[mu_exu.scala 45:38]
  wire [64:0] mul_data2 = io_valid ? _mul_data2_T_9 : 65'h0; // @[mu_exu.scala 45:28]
  wire [66:0] temp_mul2 = {mul_data2[64],mul_data2,1'h0}; // @[Cat.scala 33:92]
  reg  reg_ready; // @[mu_exu.scala 48:32]
  reg [1:0] reg_state; // @[mu_exu.scala 50:42]
  reg [66:0] reg_temp_mul2; // @[mu_exu.scala 51:38]
  reg [129:0] reg_mul1; // @[mu_exu.scala 52:42]
  reg [129:0] reg_result; // @[mu_exu.scala 53:42]
  reg [6:0] reg_exuType; // @[mu_exu.scala 54:42]
  wire [130:0] _pp_T_1 = {reg_mul1, 1'h0}; // @[mu_exu.scala 60:51]
  wire [129:0] _pp_T_2 = ~reg_mul1; // @[mu_exu.scala 61:43]
  wire [129:0] _pp_T_4 = _pp_T_2 + 130'h1; // @[mu_exu.scala 61:53]
  wire [130:0] _pp_T_5 = {_pp_T_4, 1'h0}; // @[mu_exu.scala 61:59]
  wire [129:0] _pp_T_15 = 3'h1 == reg_temp_mul2[2:0] ? reg_mul1 : 130'h0; // @[Mux.scala 81:58]
  wire [129:0] _pp_T_17 = 3'h2 == reg_temp_mul2[2:0] ? reg_mul1 : _pp_T_15; // @[Mux.scala 81:58]
  wire [130:0] _pp_T_19 = 3'h3 == reg_temp_mul2[2:0] ? _pp_T_1 : {{1'd0}, _pp_T_17}; // @[Mux.scala 81:58]
  wire [130:0] _pp_T_21 = 3'h4 == reg_temp_mul2[2:0] ? _pp_T_5 : _pp_T_19; // @[Mux.scala 81:58]
  wire [130:0] _pp_T_23 = 3'h5 == reg_temp_mul2[2:0] ? {{1'd0}, _pp_T_4} : _pp_T_21; // @[Mux.scala 81:58]
  wire [130:0] pp = 3'h6 == reg_temp_mul2[2:0] ? {{1'd0}, _pp_T_4} : _pp_T_23; // @[Mux.scala 81:58]
  reg [6:0] reg_cnt; // @[mu_exu.scala 65:50]
  wire  _GEN_0 = io_valid ? 1'h0 : 1'h1; // @[mu_exu.scala 76:36 68:49 77:49]
  wire [129:0] _GEN_3 = io_valid ? mul_data1 : 130'h0; // @[mu_exu.scala 76:36 71:49 80:49]
  wire [130:0] _GEN_30 = {{1'd0}, reg_result}; // @[mu_exu.scala 85:63]
  wire [130:0] _reg_result_T_27 = _GEN_30 + pp; // @[mu_exu.scala 85:63]
  wire [131:0] _GEN_31 = {reg_mul1, 2'h0}; // @[mu_exu.scala 94:61]
  wire [132:0] _reg_mul1_T = {{1'd0}, _GEN_31}; // @[mu_exu.scala 94:61]
  wire [66:0] _reg_temp_mul2_T = {{2'd0}, reg_temp_mul2[66:2]}; // @[mu_exu.scala 95:58]
  wire [6:0] _reg_cnt_T_1 = reg_cnt + 7'h1; // @[mu_exu.scala 96:76]
  wire  _GEN_10 = 2'h2 == reg_state | reg_ready; // @[mu_exu.scala 66:26 48:32]
  wire [130:0] _GEN_14 = 2'h2 == reg_state ? _reg_result_T_27 : {{1'd0}, reg_result}; // @[mu_exu.scala 66:26 53:42]
  wire [130:0] _GEN_15 = 2'h1 == reg_state ? _reg_result_T_27 : _GEN_14; // @[mu_exu.scala 66:26 85:49]
  wire [132:0] _GEN_16 = 2'h1 == reg_state ? _reg_mul1_T : {{3'd0}, reg_mul1}; // @[mu_exu.scala 66:26 52:42 94:49]
  wire  _GEN_20 = 2'h1 == reg_state ? reg_ready : _GEN_10; // @[mu_exu.scala 66:26 98:49]
  wire  _GEN_22 = 2'h0 == reg_state ? _GEN_0 : _GEN_20; // @[mu_exu.scala 66:26]
  wire [132:0] _GEN_25 = 2'h0 == reg_state ? {{3'd0}, _GEN_3} : _GEN_16; // @[mu_exu.scala 66:26]
  wire [130:0] _GEN_26 = 2'h0 == reg_state ? 131'h0 : _GEN_15; // @[mu_exu.scala 66:26 72:49]
  wire  reg_not_h = reg_exuType[3:2] == 2'h0; // @[mu_exu.scala 116:45]
  wire  reg_is_32 = reg_exuType[0]; // @[mu_exu.scala 117:38]
  wire [31:0] _io_dest_data_T_2 = reg_result[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 77:12]
  wire [63:0] _io_dest_data_T_4 = {_io_dest_data_T_2,reg_result[31:0]}; // @[Cat.scala 33:92]
  wire [63:0] _io_dest_data_T_7 = reg_not_h ? reg_result[63:0] : reg_result[127:64]; // @[mu_exu.scala 118:91]
  wire [132:0] _GEN_34 = reset ? 133'h0 : _GEN_25; // @[mu_exu.scala 52:{42,42}]
  wire [130:0] _GEN_35 = reset ? 131'h0 : _GEN_26; // @[mu_exu.scala 53:{42,42}]
  assign io_dest_data = reg_is_32 ? _io_dest_data_T_4 : _io_dest_data_T_7; // @[mu_exu.scala 118:31]
  assign io_ready = reg_ready; // @[mu_exu.scala 120:33]
  always @(posedge clock) begin
    reg_ready <= reset | _GEN_22; // @[mu_exu.scala 48:{32,32}]
    if (reset) begin // @[mu_exu.scala 50:42]
      reg_state <= 2'h0; // @[mu_exu.scala 50:42]
    end else if (2'h0 == reg_state) begin // @[mu_exu.scala 66:26]
      if (io_valid) begin // @[mu_exu.scala 76:36]
        reg_state <= 2'h1; // @[mu_exu.scala 78:49]
      end else begin
        reg_state <= 2'h0; // @[mu_exu.scala 69:49]
      end
    end else if (2'h1 == reg_state) begin // @[mu_exu.scala 66:26]
      if (reg_cnt == 7'h20) begin // @[mu_exu.scala 97:77]
        reg_state <= 2'h2;
      end
    end else if (2'h2 == reg_state) begin // @[mu_exu.scala 66:26]
      reg_state <= 2'h0;
    end
    if (reset) begin // @[mu_exu.scala 51:38]
      reg_temp_mul2 <= 67'h0; // @[mu_exu.scala 51:38]
    end else if (2'h0 == reg_state) begin // @[mu_exu.scala 66:26]
      if (io_valid) begin // @[mu_exu.scala 76:36]
        reg_temp_mul2 <= temp_mul2; // @[mu_exu.scala 79:47]
      end else begin
        reg_temp_mul2 <= 67'h0; // @[mu_exu.scala 70:41]
      end
    end else if (2'h1 == reg_state) begin // @[mu_exu.scala 66:26]
      reg_temp_mul2 <= _reg_temp_mul2_T; // @[mu_exu.scala 95:41]
    end
    reg_mul1 <= _GEN_34[129:0]; // @[mu_exu.scala 52:{42,42}]
    reg_result <= _GEN_35[129:0]; // @[mu_exu.scala 53:{42,42}]
    if (reset) begin // @[mu_exu.scala 54:42]
      reg_exuType <= 7'h0; // @[mu_exu.scala 54:42]
    end else if (2'h0 == reg_state) begin // @[mu_exu.scala 66:26]
      if (io_valid) begin // @[mu_exu.scala 76:36]
        reg_exuType <= io_exuType; // @[mu_exu.scala 81:49]
      end else begin
        reg_exuType <= 7'h0; // @[mu_exu.scala 73:49]
      end
    end
    if (reset) begin // @[mu_exu.scala 65:50]
      reg_cnt <= 7'h0; // @[mu_exu.scala 65:50]
    end else if (2'h0 == reg_state) begin // @[mu_exu.scala 66:26]
      reg_cnt <= 7'h0; // @[mu_exu.scala 75:49]
    end else if (2'h1 == reg_state) begin // @[mu_exu.scala 66:26]
      reg_cnt <= _reg_cnt_T_1; // @[mu_exu.scala 96:49]
    end else if (2'h2 == reg_state) begin // @[mu_exu.scala 66:26]
      reg_cnt <= 7'h0;
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
  reg_ready = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  reg_state = _RAND_1[1:0];
  _RAND_2 = {3{`RANDOM}};
  reg_temp_mul2 = _RAND_2[66:0];
  _RAND_3 = {5{`RANDOM}};
  reg_mul1 = _RAND_3[129:0];
  _RAND_4 = {5{`RANDOM}};
  reg_result = _RAND_4[129:0];
  _RAND_5 = {1{`RANDOM}};
  reg_exuType = _RAND_5[6:0];
  _RAND_6 = {1{`RANDOM}};
  reg_cnt = _RAND_6[6:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_040318_MU_EXU(
  input         clock,
  input         reset,
  input         io_valid,
  input  [6:0]  io_exu_type,
  input  [63:0] io_rs1_data,
  input  [63:0] io_rs2_data,
  output [63:0] io_dest_data,
  output        io_ready
);
  wire  div_clock; // @[mu_exu.scala 256:25]
  wire  div_reset; // @[mu_exu.scala 256:25]
  wire  div_io_valid; // @[mu_exu.scala 256:25]
  wire [63:0] div_io_rs1_data; // @[mu_exu.scala 256:25]
  wire [63:0] div_io_rs2_data; // @[mu_exu.scala 256:25]
  wire [6:0] div_io_exuType; // @[mu_exu.scala 256:25]
  wire [63:0] div_io_dest_data; // @[mu_exu.scala 256:25]
  wire  div_io_dest_is_w; // @[mu_exu.scala 256:25]
  wire  div_io_ready; // @[mu_exu.scala 256:25]
  wire  mul_clock; // @[mu_exu.scala 257:25]
  wire  mul_reset; // @[mu_exu.scala 257:25]
  wire  mul_io_valid; // @[mu_exu.scala 257:25]
  wire [63:0] mul_io_rs1_data; // @[mu_exu.scala 257:25]
  wire [63:0] mul_io_rs2_data; // @[mu_exu.scala 257:25]
  wire [6:0] mul_io_exuType; // @[mu_exu.scala 257:25]
  wire [63:0] mul_io_dest_data; // @[mu_exu.scala 257:25]
  wire  mul_io_ready; // @[mu_exu.scala 257:25]
  ysyx_040318_DIV div ( // @[mu_exu.scala 256:25]
    .clock(div_clock),
    .reset(div_reset),
    .io_valid(div_io_valid),
    .io_rs1_data(div_io_rs1_data),
    .io_rs2_data(div_io_rs2_data),
    .io_exuType(div_io_exuType),
    .io_dest_data(div_io_dest_data),
    .io_dest_is_w(div_io_dest_is_w),
    .io_ready(div_io_ready)
  );
  ysyx_040318_MUL mul ( // @[mu_exu.scala 257:25]
    .clock(mul_clock),
    .reset(mul_reset),
    .io_valid(mul_io_valid),
    .io_rs1_data(mul_io_rs1_data),
    .io_rs2_data(mul_io_rs2_data),
    .io_exuType(mul_io_exuType),
    .io_dest_data(mul_io_dest_data),
    .io_ready(mul_io_ready)
  );
  assign io_dest_data = div_io_dest_is_w ? div_io_dest_data : mul_io_dest_data; // @[mu_exu.scala 271:31]
  assign io_ready = div_io_ready & mul_io_ready; // @[mu_exu.scala 273:49]
  assign div_clock = clock;
  assign div_reset = reset;
  assign div_io_valid = io_valid & io_exu_type[4]; // @[mu_exu.scala 258:45]
  assign div_io_rs1_data = io_rs1_data; // @[mu_exu.scala 260:33]
  assign div_io_rs2_data = io_rs2_data; // @[mu_exu.scala 261:33]
  assign div_io_exuType = io_exu_type; // @[mu_exu.scala 262:33]
  assign mul_clock = clock;
  assign mul_reset = reset;
  assign mul_io_valid = io_valid & ~io_exu_type[4]; // @[mu_exu.scala 264:45]
  assign mul_io_rs1_data = io_rs1_data; // @[mu_exu.scala 266:33]
  assign mul_io_rs2_data = io_rs2_data; // @[mu_exu.scala 267:33]
  assign mul_io_exuType = io_exu_type; // @[mu_exu.scala 268:33]
endmodule
module ysyx_040318_SYSTEM_EXU(
  input         clock,
  input         reset,
  input         io_valid,
  input  [6:0]  io_exuType,
  input  [63:0] io_csr_data,
  input  [11:0] io_csr_addr,
  input  [31:0] io_imm,
  input  [63:0] io_rs1_data,
  input  [63:0] io_mepc,
  input  [63:0] io_mstatus,
  output [63:0] io_result_wdata,
  output        io_result_csr_is_w,
  output [63:0] io_result_csr_data,
  output [11:0] io_result_csr_addr,
  output        io_is_except,
  output [4:0]  io_exception,
  output        io_valid_next_pc,
  output [63:0] io_next_pc
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [63:0] _RAND_7;
`endif // RANDOMIZE_REG_INIT
  wire [31:0] _imm_T_2 = io_imm[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 77:12]
  wire [63:0] imm = {_imm_T_2,io_imm}; // @[Cat.scala 33:92]
  wire  is_imm = io_exuType[4]; // @[system.scala 67:32]
  wire [63:0] op_data = is_imm ? imm : io_rs1_data; // @[system.scala 69:30]
  wire [63:0] or_result = io_csr_data | op_data; // @[system.scala 70:36]
  wire [63:0] _and_result_T = ~op_data; // @[system.scala 71:28]
  wire [63:0] and_result = _and_result_T & io_csr_data; // @[system.scala 71:38]
  wire [63:0] _temp_csr_result_data_T_3 = {io_csr_data[63:5],imm[4:0]}; // @[Cat.scala 33:92]
  wire [63:0] _temp_csr_result_data_T_5 = 3'h2 == io_exuType[4:2] ? or_result : 64'h0; // @[Mux.scala 81:58]
  wire [63:0] _temp_csr_result_data_T_7 = 3'h6 == io_exuType[4:2] ? or_result : _temp_csr_result_data_T_5; // @[Mux.scala 81:58]
  wire [63:0] _temp_csr_result_data_T_9 = 3'h1 == io_exuType[4:2] ? op_data : _temp_csr_result_data_T_7; // @[Mux.scala 81:58]
  wire [63:0] _temp_csr_result_data_T_11 = 3'h5 == io_exuType[4:2] ? _temp_csr_result_data_T_3 :
    _temp_csr_result_data_T_9; // @[Mux.scala 81:58]
  wire  is_mret = io_exuType[6:2] == 5'h10; // @[system.scala 80:44]
  wire  is_sret = io_exuType[6:2] == 5'h18; // @[system.scala 81:44]
  wire  is_ecall = io_exuType[6:2] == 5'h0; // @[system.scala 82:44]
  wire  is_ebreak = io_exuType[6:2] == 5'h8; // @[system.scala 83:44]
  wire  is_except = is_ecall | is_ebreak; // @[system.scala 84:37]
  wire [1:0] _exception_T = is_ebreak ? 2'h3 : 2'h0; // @[system.scala 85:48]
  wire [3:0] exception = is_ecall ? 4'hb : {{2'd0}, _exception_T}; // @[system.scala 85:30]
  wire  is_ret = is_mret | is_sret; // @[system.scala 86:43]
  wire [63:0] _result_status_T = io_mstatus & 64'hffffffffffffff77; // @[system.scala 88:37]
  wire [7:0] _result_status_T_2 = io_mstatus[7] ? 8'h88 : 8'h80; // @[system.scala 88:69]
  wire [63:0] _GEN_0 = {{56'd0}, _result_status_T_2}; // @[system.scala 88:64]
  wire [63:0] result_status = _result_status_T | _GEN_0; // @[system.scala 88:64]
  reg [63:0] reg_csr_data; // @[system.scala 91:42]
  reg [11:0] reg_csr_addr; // @[system.scala 92:42]
  reg  reg_csr_is_w; // @[system.scala 93:42]
  reg [63:0] reg_wdata; // @[system.scala 95:42]
  reg  reg_is_except; // @[system.scala 97:42]
  reg [4:0] reg_exception; // @[system.scala 98:42]
  reg  reg_valid_next_pc; // @[system.scala 100:42]
  reg [63:0] reg_next_pc; // @[system.scala 101:50]
  assign io_result_wdata = reg_wdata; // @[system.scala 116:33]
  assign io_result_csr_is_w = reg_csr_is_w; // @[system.scala 120:33]
  assign io_result_csr_data = reg_csr_data; // @[system.scala 119:33]
  assign io_result_csr_addr = reg_csr_addr; // @[system.scala 121:33]
  assign io_is_except = reg_is_except; // @[system.scala 123:33]
  assign io_exception = reg_exception; // @[system.scala 124:33]
  assign io_valid_next_pc = reg_valid_next_pc; // @[system.scala 126:33]
  assign io_next_pc = reg_next_pc; // @[system.scala 127:41]
  always @(posedge clock) begin
    if (reset) begin // @[system.scala 91:42]
      reg_csr_data <= 64'h0; // @[system.scala 91:42]
    end else if (is_ret) begin // @[system.scala 103:31]
      reg_csr_data <= result_status;
    end else if (3'h7 == io_exuType[4:2]) begin // @[Mux.scala 81:58]
      reg_csr_data <= and_result;
    end else if (3'h3 == io_exuType[4:2]) begin // @[Mux.scala 81:58]
      reg_csr_data <= and_result;
    end else begin
      reg_csr_data <= _temp_csr_result_data_T_11;
    end
    if (reset) begin // @[system.scala 92:42]
      reg_csr_addr <= 12'h0; // @[system.scala 92:42]
    end else if (is_ret) begin // @[system.scala 104:31]
      reg_csr_addr <= 12'h300;
    end else begin
      reg_csr_addr <= io_csr_addr;
    end
    if (reset) begin // @[system.scala 93:42]
      reg_csr_is_w <= 1'h0; // @[system.scala 93:42]
    end else begin
      reg_csr_is_w <= io_valid & (io_exuType[4:2] != 3'h0 | is_ret); // @[system.scala 105:25]
    end
    if (reset) begin // @[system.scala 95:42]
      reg_wdata <= 64'h0; // @[system.scala 95:42]
    end else begin
      reg_wdata <= io_csr_data; // @[system.scala 107:33]
    end
    if (reset) begin // @[system.scala 97:42]
      reg_is_except <= 1'h0; // @[system.scala 97:42]
    end else begin
      reg_is_except <= is_except & io_valid; // @[system.scala 110:25]
    end
    if (reset) begin // @[system.scala 98:42]
      reg_exception <= 5'h0; // @[system.scala 98:42]
    end else begin
      reg_exception <= {{1'd0}, exception}; // @[system.scala 111:25]
    end
    if (reset) begin // @[system.scala 100:42]
      reg_valid_next_pc <= 1'h0; // @[system.scala 100:42]
    end else begin
      reg_valid_next_pc <= is_ret & io_valid; // @[system.scala 113:33]
    end
    if (reset) begin // @[system.scala 101:50]
      reg_next_pc <= 64'h0; // @[system.scala 101:50]
    end else begin
      reg_next_pc <= io_mepc; // @[system.scala 114:41]
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
  reg_csr_data = _RAND_0[63:0];
  _RAND_1 = {1{`RANDOM}};
  reg_csr_addr = _RAND_1[11:0];
  _RAND_2 = {1{`RANDOM}};
  reg_csr_is_w = _RAND_2[0:0];
  _RAND_3 = {2{`RANDOM}};
  reg_wdata = _RAND_3[63:0];
  _RAND_4 = {1{`RANDOM}};
  reg_is_except = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  reg_exception = _RAND_5[4:0];
  _RAND_6 = {1{`RANDOM}};
  reg_valid_next_pc = _RAND_6[0:0];
  _RAND_7 = {2{`RANDOM}};
  reg_next_pc = _RAND_7[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_040318_Exu(
  input         clock,
  input         reset,
  output        io_op_datas_ready,
  input         io_op_datas_valid,
  input  [2:0]  io_op_datas_bits_opType,
  input  [6:0]  io_op_datas_bits_exuType,
  input  [4:0]  io_op_datas_bits_rs1_addr,
  input  [63:0] io_op_datas_bits_rs1_data,
  input  [4:0]  io_op_datas_bits_rs2_addr,
  input  [63:0] io_op_datas_bits_rs2_data,
  input  [31:0] io_op_datas_bits_imm,
  input  [63:0] io_op_datas_bits_pc,
  input  [4:0]  io_op_datas_bits_dest_addr,
  input         io_op_datas_bits_dest_is_reg,
  input         io_op_datas_bits_is_pre,
  input  [11:0] io_op_datas_bits_csr_addr,
  input  [63:0] io_op_datas_bits_csr_data,
  input         io_irq_time_irq,
  input         io_irq_soft_irq,
  input  [63:0] io_mstatus,
  input  [63:0] io_mie,
  input  [63:0] io_mepc,
  input  [63:0] io_mtvec,
  output        io_wb_valid,
  output [4:0]  io_wb_dest_addr,
  output [63:0] io_wb_dest_data,
  output        io_csr_valid,
  output [11:0] io_csr_csr_addr,
  output [63:0] io_csr_csr_data,
  output        io_csr_except_is_except,
  output        io_csr_except_is_time_irq,
  output        io_csr_except_is_soft_irq,
  output [4:0]  io_csr_except_exception,
  output [63:0] io_csr_except_next_pc,
  output [63:0] io_csr_except_pc,
  output        io_commit,
  output [63:0] io_next_pc,
  output        io_flush,
  output        io_fence_i,
  output        io_br_info_valid,
  output        io_br_info_mispredict,
  output [63:0] io_br_info_br_pc,
  output        io_br_info_taken,
  output [63:0] io_br_info_target_next_pc,
  output [1:0]  io_br_info_br_type,
  output        io_get_pre_info_valid,
  input  [63:0] io_get_pre_info_pre_next_pc,
  input         io_dcache_cmd_ready,
  output        io_dcache_cmd_valid,
  output [63:0] io_dcache_cmd_bits_addr,
  output [63:0] io_dcache_cmd_bits_wdata,
  output [7:0]  io_dcache_cmd_bits_wstrb,
  output        io_dcache_cmd_bits_is_w,
  output [1:0]  io_dcache_cmd_bits_size,
  output        io_dcache_cmd_bits_is_fence,
  output        io_dcache_cmd_bits_is_mmio,
  input         io_dcahce_resp_valid,
  input  [63:0] io_dcahce_resp_bits_rdata,
  input  [2:0]  io_dcahce_resp_bits_resp_info
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  alu_exu_clock; // @[execute.scala 87:29]
  wire  alu_exu_reset; // @[execute.scala 87:29]
  wire  alu_exu_io_valid; // @[execute.scala 87:29]
  wire  alu_exu_io_is_pre; // @[execute.scala 87:29]
  wire  alu_exu_io_br_info_valid; // @[execute.scala 87:29]
  wire  alu_exu_io_br_info_mispredict; // @[execute.scala 87:29]
  wire [63:0] alu_exu_io_br_info_br_pc; // @[execute.scala 87:29]
  wire  alu_exu_io_br_info_taken; // @[execute.scala 87:29]
  wire [63:0] alu_exu_io_br_info_target_next_pc; // @[execute.scala 87:29]
  wire [1:0] alu_exu_io_br_info_br_type; // @[execute.scala 87:29]
  wire  alu_exu_io_get_pre_info_valid; // @[execute.scala 87:29]
  wire [63:0] alu_exu_io_get_pre_info_pre_next_pc; // @[execute.scala 87:29]
  wire [2:0] alu_exu_io_opType; // @[execute.scala 87:29]
  wire [6:0] alu_exu_io_exuType; // @[execute.scala 87:29]
  wire [63:0] alu_exu_io_op_data1; // @[execute.scala 87:29]
  wire [63:0] alu_exu_io_op_data2; // @[execute.scala 87:29]
  wire [31:0] alu_exu_io_op_imm; // @[execute.scala 87:29]
  wire [63:0] alu_exu_io_op_pc; // @[execute.scala 87:29]
  wire [4:0] alu_exu_io_rs1_addr; // @[execute.scala 87:29]
  wire [4:0] alu_exu_io_dest_addr; // @[execute.scala 87:29]
  wire [63:0] alu_exu_io_result_wdata; // @[execute.scala 87:29]
  wire  alu_exu_io_valid_next_pc; // @[execute.scala 87:29]
  wire [63:0] alu_exu_io_next_pc; // @[execute.scala 87:29]
  wire  mem_exu_clock; // @[execute.scala 88:29]
  wire  mem_exu_reset; // @[execute.scala 88:29]
  wire  mem_exu_io_valid; // @[execute.scala 88:29]
  wire [2:0] mem_exu_io_opType; // @[execute.scala 88:29]
  wire [6:0] mem_exu_io_exuType; // @[execute.scala 88:29]
  wire [63:0] mem_exu_io_rs1_data; // @[execute.scala 88:29]
  wire [63:0] mem_exu_io_rs2_data; // @[execute.scala 88:29]
  wire [31:0] mem_exu_io_imm; // @[execute.scala 88:29]
  wire [63:0] mem_exu_io_result_wdata; // @[execute.scala 88:29]
  wire  mem_exu_io_ready; // @[execute.scala 88:29]
  wire  mem_exu_io_fence_i; // @[execute.scala 88:29]
  wire  mem_exu_io_is_except; // @[execute.scala 88:29]
  wire [4:0] mem_exu_io_exception; // @[execute.scala 88:29]
  wire  mem_exu_io_dcache_cmd_ready; // @[execute.scala 88:29]
  wire  mem_exu_io_dcache_cmd_valid; // @[execute.scala 88:29]
  wire [63:0] mem_exu_io_dcache_cmd_bits_addr; // @[execute.scala 88:29]
  wire [63:0] mem_exu_io_dcache_cmd_bits_wdata; // @[execute.scala 88:29]
  wire [7:0] mem_exu_io_dcache_cmd_bits_wstrb; // @[execute.scala 88:29]
  wire  mem_exu_io_dcache_cmd_bits_is_w; // @[execute.scala 88:29]
  wire [1:0] mem_exu_io_dcache_cmd_bits_size; // @[execute.scala 88:29]
  wire  mem_exu_io_dcache_cmd_bits_is_fence; // @[execute.scala 88:29]
  wire  mem_exu_io_dcache_cmd_bits_is_mmio; // @[execute.scala 88:29]
  wire  mem_exu_io_dcahce_resp_ready; // @[execute.scala 88:29]
  wire  mem_exu_io_dcahce_resp_valid; // @[execute.scala 88:29]
  wire [63:0] mem_exu_io_dcahce_resp_bits_rdata; // @[execute.scala 88:29]
  wire [2:0] mem_exu_io_dcahce_resp_bits_resp_info; // @[execute.scala 88:29]
  wire  mu_exu_clock; // @[execute.scala 89:29]
  wire  mu_exu_reset; // @[execute.scala 89:29]
  wire  mu_exu_io_valid; // @[execute.scala 89:29]
  wire [6:0] mu_exu_io_exu_type; // @[execute.scala 89:29]
  wire [63:0] mu_exu_io_rs1_data; // @[execute.scala 89:29]
  wire [63:0] mu_exu_io_rs2_data; // @[execute.scala 89:29]
  wire [63:0] mu_exu_io_dest_data; // @[execute.scala 89:29]
  wire  mu_exu_io_ready; // @[execute.scala 89:29]
  wire  system_exu_clock; // @[execute.scala 90:32]
  wire  system_exu_reset; // @[execute.scala 90:32]
  wire  system_exu_io_valid; // @[execute.scala 90:32]
  wire [6:0] system_exu_io_exuType; // @[execute.scala 90:32]
  wire [63:0] system_exu_io_csr_data; // @[execute.scala 90:32]
  wire [11:0] system_exu_io_csr_addr; // @[execute.scala 90:32]
  wire [31:0] system_exu_io_imm; // @[execute.scala 90:32]
  wire [63:0] system_exu_io_rs1_data; // @[execute.scala 90:32]
  wire [63:0] system_exu_io_mepc; // @[execute.scala 90:32]
  wire [63:0] system_exu_io_mstatus; // @[execute.scala 90:32]
  wire [63:0] system_exu_io_result_wdata; // @[execute.scala 90:32]
  wire  system_exu_io_result_csr_is_w; // @[execute.scala 90:32]
  wire [63:0] system_exu_io_result_csr_data; // @[execute.scala 90:32]
  wire [11:0] system_exu_io_result_csr_addr; // @[execute.scala 90:32]
  wire  system_exu_io_is_except; // @[execute.scala 90:32]
  wire [4:0] system_exu_io_exception; // @[execute.scala 90:32]
  wire  system_exu_io_valid_next_pc; // @[execute.scala 90:32]
  wire [63:0] system_exu_io_next_pc; // @[execute.scala 90:32]
  wire  in_data_valid = io_op_datas_valid & ~io_flush; // @[execute.scala 74:47]
  wire  ready = mu_exu_io_ready & mem_exu_io_ready; // @[execute.scala 91:37]
  reg  reg_is_time_irq; // @[execute.scala 93:42]
  reg  reg_is_soft_irq; // @[execute.scala 94:42]
  reg [63:0] reg_curr_pc; // @[execute.scala 95:50]
  reg [4:0] reg_dest_addr; // @[execute.scala 96:50]
  reg  reg_dest_is_w; // @[execute.scala 97:50]
  reg [3:0] reg_valid; // @[execute.scala 99:34]
  wire  reg_alu_valid = reg_valid[0]; // @[execute.scala 100:38]
  wire  reg_mem_valid = reg_valid[1]; // @[execute.scala 101:38]
  wire  reg_mu_valid = reg_valid[2]; // @[execute.scala 102:38]
  wire  reg_system_valid = reg_valid[3]; // @[execute.scala 103:41]
  wire  _valid_T_3 = 3'h1 == io_op_datas_bits_opType | 3'h2 == io_op_datas_bits_opType; // @[Mux.scala 81:58]
  wire [1:0] _valid_T_5 = 3'h5 == io_op_datas_bits_opType ? 2'h2 : {{1'd0}, _valid_T_3}; // @[Mux.scala 81:58]
  wire [1:0] _valid_T_7 = 3'h6 == io_op_datas_bits_opType ? 2'h2 : _valid_T_5; // @[Mux.scala 81:58]
  wire [2:0] _valid_T_9 = 3'h3 == io_op_datas_bits_opType ? 3'h4 : {{1'd0}, _valid_T_7}; // @[Mux.scala 81:58]
  wire [3:0] valid = 3'h4 == io_op_datas_bits_opType ? 4'h8 : {{1'd0}, _valid_T_9}; // @[Mux.scala 81:58]
  wire  time_irq = io_irq_time_irq & io_mstatus[3] & io_mie[7]; // @[execute.scala 169:59]
  wire  soft_irq = io_irq_soft_irq & io_mstatus[3] & io_mie[3]; // @[execute.scala 170:59]
  reg  reg_commit; // @[execute.scala 177:50]
  wire [63:0] _io_wb_dest_data_T = reg_mem_valid ? mem_exu_io_result_wdata : 64'h0; // @[execute.scala 189:12]
  wire [63:0] _io_wb_dest_data_T_1 = reg_system_valid ? system_exu_io_result_wdata : _io_wb_dest_data_T; // @[execute.scala 188:12]
  wire [63:0] _io_wb_dest_data_T_2 = reg_mu_valid ? mu_exu_io_dest_data : _io_wb_dest_data_T_1; // @[execute.scala 187:12]
  wire  is_except = mem_exu_io_is_except & reg_mem_valid | system_exu_io_is_except & reg_system_valid; // @[execute.scala 195:64]
  wire  is_irq = reg_commit & ready & (reg_is_time_irq | reg_is_soft_irq); // @[execute.scala 196:47]
  wire  is_br_j = alu_exu_io_valid_next_pc & reg_alu_valid; // @[execute.scala 197:51]
  wire  is_system_ret = system_exu_io_valid_next_pc & reg_system_valid; // @[execute.scala 198:58]
  wire  is_fence = mem_exu_io_fence_i & reg_mem_valid; // @[execute.scala 199:49]
  wire [63:0] _io_csr_except_next_pc_T_1 = reg_curr_pc + 64'h4; // @[execute.scala 204:93]
  wire  _io_flush_T = is_except | is_irq; // @[execute.scala 217:38]
  wire [63:0] _io_next_pc_T_2 = {io_mtvec[63:2],2'h0}; // @[Cat.scala 33:92]
  wire [63:0] _io_next_pc_T_5 = is_br_j ? alu_exu_io_next_pc : _io_csr_except_next_pc_T_1; // @[execute.scala 219:12]
  wire [63:0] _io_next_pc_T_6 = is_system_ret ? system_exu_io_next_pc : _io_next_pc_T_5; // @[execute.scala 218:83]
  ysyx_040318_ALU_EXU alu_exu ( // @[execute.scala 87:29]
    .clock(alu_exu_clock),
    .reset(alu_exu_reset),
    .io_valid(alu_exu_io_valid),
    .io_is_pre(alu_exu_io_is_pre),
    .io_br_info_valid(alu_exu_io_br_info_valid),
    .io_br_info_mispredict(alu_exu_io_br_info_mispredict),
    .io_br_info_br_pc(alu_exu_io_br_info_br_pc),
    .io_br_info_taken(alu_exu_io_br_info_taken),
    .io_br_info_target_next_pc(alu_exu_io_br_info_target_next_pc),
    .io_br_info_br_type(alu_exu_io_br_info_br_type),
    .io_get_pre_info_valid(alu_exu_io_get_pre_info_valid),
    .io_get_pre_info_pre_next_pc(alu_exu_io_get_pre_info_pre_next_pc),
    .io_opType(alu_exu_io_opType),
    .io_exuType(alu_exu_io_exuType),
    .io_op_data1(alu_exu_io_op_data1),
    .io_op_data2(alu_exu_io_op_data2),
    .io_op_imm(alu_exu_io_op_imm),
    .io_op_pc(alu_exu_io_op_pc),
    .io_rs1_addr(alu_exu_io_rs1_addr),
    .io_dest_addr(alu_exu_io_dest_addr),
    .io_result_wdata(alu_exu_io_result_wdata),
    .io_valid_next_pc(alu_exu_io_valid_next_pc),
    .io_next_pc(alu_exu_io_next_pc)
  );
  ysyx_040318_MEM_EXU mem_exu ( // @[execute.scala 88:29]
    .clock(mem_exu_clock),
    .reset(mem_exu_reset),
    .io_valid(mem_exu_io_valid),
    .io_opType(mem_exu_io_opType),
    .io_exuType(mem_exu_io_exuType),
    .io_rs1_data(mem_exu_io_rs1_data),
    .io_rs2_data(mem_exu_io_rs2_data),
    .io_imm(mem_exu_io_imm),
    .io_result_wdata(mem_exu_io_result_wdata),
    .io_ready(mem_exu_io_ready),
    .io_fence_i(mem_exu_io_fence_i),
    .io_is_except(mem_exu_io_is_except),
    .io_exception(mem_exu_io_exception),
    .io_dcache_cmd_ready(mem_exu_io_dcache_cmd_ready),
    .io_dcache_cmd_valid(mem_exu_io_dcache_cmd_valid),
    .io_dcache_cmd_bits_addr(mem_exu_io_dcache_cmd_bits_addr),
    .io_dcache_cmd_bits_wdata(mem_exu_io_dcache_cmd_bits_wdata),
    .io_dcache_cmd_bits_wstrb(mem_exu_io_dcache_cmd_bits_wstrb),
    .io_dcache_cmd_bits_is_w(mem_exu_io_dcache_cmd_bits_is_w),
    .io_dcache_cmd_bits_size(mem_exu_io_dcache_cmd_bits_size),
    .io_dcache_cmd_bits_is_fence(mem_exu_io_dcache_cmd_bits_is_fence),
    .io_dcache_cmd_bits_is_mmio(mem_exu_io_dcache_cmd_bits_is_mmio),
    .io_dcahce_resp_ready(mem_exu_io_dcahce_resp_ready),
    .io_dcahce_resp_valid(mem_exu_io_dcahce_resp_valid),
    .io_dcahce_resp_bits_rdata(mem_exu_io_dcahce_resp_bits_rdata),
    .io_dcahce_resp_bits_resp_info(mem_exu_io_dcahce_resp_bits_resp_info)
  );
  ysyx_040318_MU_EXU mu_exu ( // @[execute.scala 89:29]
    .clock(mu_exu_clock),
    .reset(mu_exu_reset),
    .io_valid(mu_exu_io_valid),
    .io_exu_type(mu_exu_io_exu_type),
    .io_rs1_data(mu_exu_io_rs1_data),
    .io_rs2_data(mu_exu_io_rs2_data),
    .io_dest_data(mu_exu_io_dest_data),
    .io_ready(mu_exu_io_ready)
  );
  ysyx_040318_SYSTEM_EXU system_exu ( // @[execute.scala 90:32]
    .clock(system_exu_clock),
    .reset(system_exu_reset),
    .io_valid(system_exu_io_valid),
    .io_exuType(system_exu_io_exuType),
    .io_csr_data(system_exu_io_csr_data),
    .io_csr_addr(system_exu_io_csr_addr),
    .io_imm(system_exu_io_imm),
    .io_rs1_data(system_exu_io_rs1_data),
    .io_mepc(system_exu_io_mepc),
    .io_mstatus(system_exu_io_mstatus),
    .io_result_wdata(system_exu_io_result_wdata),
    .io_result_csr_is_w(system_exu_io_result_csr_is_w),
    .io_result_csr_data(system_exu_io_result_csr_data),
    .io_result_csr_addr(system_exu_io_result_csr_addr),
    .io_is_except(system_exu_io_is_except),
    .io_exception(system_exu_io_exception),
    .io_valid_next_pc(system_exu_io_valid_next_pc),
    .io_next_pc(system_exu_io_next_pc)
  );
  assign io_op_datas_ready = mu_exu_io_ready & mem_exu_io_ready; // @[execute.scala 91:37]
  assign io_wb_valid = reg_dest_is_w & ready; // @[execute.scala 184:58]
  assign io_wb_dest_addr = reg_dest_addr; // @[execute.scala 185:33]
  assign io_wb_dest_data = reg_alu_valid ? alu_exu_io_result_wdata : _io_wb_dest_data_T_2; // @[execute.scala 186:39]
  assign io_csr_valid = system_exu_io_result_csr_is_w & reg_system_valid; // @[execute.scala 191:66]
  assign io_csr_csr_addr = system_exu_io_result_csr_addr; // @[execute.scala 192:33]
  assign io_csr_csr_data = system_exu_io_result_csr_data; // @[execute.scala 193:33]
  assign io_csr_except_is_except = mem_exu_io_is_except & reg_mem_valid | system_exu_io_is_except & reg_system_valid; // @[execute.scala 195:64]
  assign io_csr_except_is_time_irq = reg_is_time_irq & reg_commit & ready; // @[execute.scala 201:73]
  assign io_csr_except_is_soft_irq = reg_is_soft_irq & reg_commit & ready; // @[execute.scala 202:73]
  assign io_csr_except_exception = reg_mem_valid ? mem_exu_io_exception : system_exu_io_exception; // @[execute.scala 203:47]
  assign io_csr_except_next_pc = reg_alu_valid ? alu_exu_io_next_pc : _io_csr_except_next_pc_T_1; // @[execute.scala 204:47]
  assign io_csr_except_pc = reg_curr_pc; // @[execute.scala 205:49]
  assign io_commit = reg_commit & ready; // @[execute.scala 207:63]
  assign io_next_pc = _io_flush_T ? _io_next_pc_T_2 : _io_next_pc_T_6; // @[execute.scala 218:31]
  assign io_flush = is_except | is_irq | is_br_j | is_fence | is_system_ret; // @[execute.scala 217:68]
  assign io_fence_i = mem_exu_io_fence_i & reg_mem_valid; // @[execute.scala 214:64]
  assign io_br_info_valid = alu_exu_io_br_info_valid; // @[execute.scala 136:20]
  assign io_br_info_mispredict = alu_exu_io_br_info_mispredict; // @[execute.scala 136:20]
  assign io_br_info_br_pc = alu_exu_io_br_info_br_pc; // @[execute.scala 136:20]
  assign io_br_info_taken = alu_exu_io_br_info_taken; // @[execute.scala 136:20]
  assign io_br_info_target_next_pc = alu_exu_io_br_info_target_next_pc; // @[execute.scala 136:20]
  assign io_br_info_br_type = alu_exu_io_br_info_br_type; // @[execute.scala 136:20]
  assign io_get_pre_info_valid = alu_exu_io_get_pre_info_valid; // @[execute.scala 135:33]
  assign io_dcache_cmd_valid = mem_exu_io_dcache_cmd_valid; // @[execute.scala 145:23]
  assign io_dcache_cmd_bits_addr = mem_exu_io_dcache_cmd_bits_addr; // @[execute.scala 145:23]
  assign io_dcache_cmd_bits_wdata = mem_exu_io_dcache_cmd_bits_wdata; // @[execute.scala 145:23]
  assign io_dcache_cmd_bits_wstrb = mem_exu_io_dcache_cmd_bits_wstrb; // @[execute.scala 145:23]
  assign io_dcache_cmd_bits_is_w = mem_exu_io_dcache_cmd_bits_is_w; // @[execute.scala 145:23]
  assign io_dcache_cmd_bits_size = mem_exu_io_dcache_cmd_bits_size; // @[execute.scala 145:23]
  assign io_dcache_cmd_bits_is_fence = mem_exu_io_dcache_cmd_bits_is_fence; // @[execute.scala 145:23]
  assign io_dcache_cmd_bits_is_mmio = mem_exu_io_dcache_cmd_bits_is_mmio; // @[execute.scala 145:23]
  assign alu_exu_clock = clock;
  assign alu_exu_reset = reset;
  assign alu_exu_io_valid = valid[0] & in_data_valid & ready; // @[execute.scala 124:61]
  assign alu_exu_io_is_pre = io_op_datas_bits_is_pre; // @[execute.scala 125:33]
  assign alu_exu_io_get_pre_info_pre_next_pc = io_get_pre_info_pre_next_pc; // @[execute.scala 135:33]
  assign alu_exu_io_opType = io_op_datas_bits_opType; // @[execute.scala 126:33]
  assign alu_exu_io_exuType = io_op_datas_bits_exuType; // @[execute.scala 127:33]
  assign alu_exu_io_op_data1 = io_wb_valid & io_wb_dest_addr == io_op_datas_bits_rs1_addr ? io_wb_dest_data :
    io_op_datas_bits_rs1_data; // @[execute.scala 79:30]
  assign alu_exu_io_op_data2 = io_wb_valid & io_wb_dest_addr == io_op_datas_bits_rs2_addr ? io_wb_dest_data :
    io_op_datas_bits_rs2_data; // @[execute.scala 80:30]
  assign alu_exu_io_op_imm = io_op_datas_bits_imm; // @[execute.scala 130:33]
  assign alu_exu_io_op_pc = io_op_datas_bits_pc; // @[execute.scala 131:33]
  assign alu_exu_io_rs1_addr = io_op_datas_bits_rs1_addr; // @[execute.scala 132:41]
  assign alu_exu_io_dest_addr = io_op_datas_bits_dest_addr; // @[execute.scala 133:33]
  assign mem_exu_clock = clock;
  assign mem_exu_reset = reset;
  assign mem_exu_io_valid = valid[1] & in_data_valid & ready; // @[execute.scala 139:69]
  assign mem_exu_io_opType = io_op_datas_bits_opType; // @[execute.scala 141:41]
  assign mem_exu_io_exuType = io_op_datas_bits_exuType; // @[execute.scala 140:41]
  assign mem_exu_io_rs1_data = io_wb_valid & io_wb_dest_addr == io_op_datas_bits_rs1_addr ? io_wb_dest_data :
    io_op_datas_bits_rs1_data; // @[execute.scala 79:30]
  assign mem_exu_io_rs2_data = io_wb_valid & io_wb_dest_addr == io_op_datas_bits_rs2_addr ? io_wb_dest_data :
    io_op_datas_bits_rs2_data; // @[execute.scala 80:30]
  assign mem_exu_io_imm = io_op_datas_bits_imm; // @[execute.scala 144:41]
  assign mem_exu_io_dcache_cmd_ready = io_dcache_cmd_ready; // @[execute.scala 145:23]
  assign mem_exu_io_dcahce_resp_valid = io_dcahce_resp_valid; // @[execute.scala 146:24]
  assign mem_exu_io_dcahce_resp_bits_rdata = io_dcahce_resp_bits_rdata; // @[execute.scala 146:24]
  assign mem_exu_io_dcahce_resp_bits_resp_info = io_dcahce_resp_bits_resp_info; // @[execute.scala 146:24]
  assign mu_exu_clock = clock;
  assign mu_exu_reset = reset;
  assign mu_exu_io_valid = valid[2] & in_data_valid & ready; // @[execute.scala 149:69]
  assign mu_exu_io_exu_type = io_op_datas_bits_exuType; // @[execute.scala 151:41]
  assign mu_exu_io_rs1_data = io_wb_valid & io_wb_dest_addr == io_op_datas_bits_rs1_addr ? io_wb_dest_data :
    io_op_datas_bits_rs1_data; // @[execute.scala 79:30]
  assign mu_exu_io_rs2_data = io_wb_valid & io_wb_dest_addr == io_op_datas_bits_rs2_addr ? io_wb_dest_data :
    io_op_datas_bits_rs2_data; // @[execute.scala 80:30]
  assign system_exu_clock = clock;
  assign system_exu_reset = reset;
  assign system_exu_io_valid = valid[3] & in_data_valid & ready; // @[execute.scala 156:69]
  assign system_exu_io_exuType = io_op_datas_bits_exuType; // @[execute.scala 157:33]
  assign system_exu_io_csr_data = io_csr_valid & io_csr_csr_addr == io_op_datas_bits_csr_addr ? io_csr_csr_data :
    io_op_datas_bits_csr_data; // @[execute.scala 85:30]
  assign system_exu_io_csr_addr = io_op_datas_bits_csr_addr; // @[execute.scala 159:33]
  assign system_exu_io_imm = io_op_datas_bits_imm; // @[execute.scala 162:41]
  assign system_exu_io_rs1_data = io_wb_valid & io_wb_dest_addr == io_op_datas_bits_rs1_addr ? io_wb_dest_data :
    io_op_datas_bits_rs1_data; // @[execute.scala 79:30]
  assign system_exu_io_mepc = io_mepc; // @[execute.scala 164:41]
  assign system_exu_io_mstatus = io_mstatus; // @[execute.scala 165:33]
  always @(posedge clock) begin
    if (reset) begin // @[execute.scala 93:42]
      reg_is_time_irq <= 1'h0; // @[execute.scala 93:42]
    end else if (ready) begin // @[execute.scala 172:20]
      if (reg_system_valid) begin // @[execute.scala 173:39]
        reg_is_time_irq <= 1'h0;
      end else begin
        reg_is_time_irq <= time_irq;
      end
    end
    if (reset) begin // @[execute.scala 94:42]
      reg_is_soft_irq <= 1'h0; // @[execute.scala 94:42]
    end else if (ready) begin // @[execute.scala 172:20]
      if (reg_system_valid) begin // @[execute.scala 174:39]
        reg_is_soft_irq <= 1'h0;
      end else begin
        reg_is_soft_irq <= soft_irq;
      end
    end
    if (reset) begin // @[execute.scala 95:50]
      reg_curr_pc <= 64'h0; // @[execute.scala 95:50]
    end else if (ready) begin // @[execute.scala 116:20]
      reg_curr_pc <= io_op_datas_bits_pc; // @[execute.scala 118:29]
    end
    if (reset) begin // @[execute.scala 96:50]
      reg_dest_addr <= 5'h0; // @[execute.scala 96:50]
    end else if (ready) begin // @[execute.scala 116:20]
      reg_dest_addr <= io_op_datas_bits_dest_addr; // @[execute.scala 119:31]
    end
    if (reset) begin // @[execute.scala 97:50]
      reg_dest_is_w <= 1'h0; // @[execute.scala 97:50]
    end else if (ready) begin // @[execute.scala 116:20]
      reg_dest_is_w <= io_op_datas_bits_dest_is_reg & in_data_valid; // @[execute.scala 120:31]
    end
    if (reset) begin // @[execute.scala 99:34]
      reg_valid <= 4'h0; // @[execute.scala 99:34]
    end else if (ready) begin // @[execute.scala 116:20]
      if (in_data_valid) begin // @[execute.scala 117:33]
        if (3'h4 == io_op_datas_bits_opType) begin // @[Mux.scala 81:58]
          reg_valid <= 4'h8;
        end else begin
          reg_valid <= {{1'd0}, _valid_T_9};
        end
      end else begin
        reg_valid <= 4'h0;
      end
    end
    if (reset) begin // @[execute.scala 177:50]
      reg_commit <= 1'h0; // @[execute.scala 177:50]
    end else if (ready) begin // @[execute.scala 179:20]
      reg_commit <= in_data_valid; // @[execute.scala 180:49]
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
  reg_is_time_irq = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  reg_is_soft_irq = _RAND_1[0:0];
  _RAND_2 = {2{`RANDOM}};
  reg_curr_pc = _RAND_2[63:0];
  _RAND_3 = {1{`RANDOM}};
  reg_dest_addr = _RAND_3[4:0];
  _RAND_4 = {1{`RANDOM}};
  reg_dest_is_w = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  reg_valid = _RAND_5[3:0];
  _RAND_6 = {1{`RANDOM}};
  reg_commit = _RAND_6[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_040318_Decode(
  input         clock,
  input         reset,
  output        io_get_inst_ready,
  input         io_get_inst_valid,
  input  [31:0] io_get_inst_bits_inst,
  input  [63:0] io_get_inst_bits_pc,
  input         io_get_inst_bits_is_pre,
  output [4:0]  io_normal_rd_rs1_addr,
  input  [63:0] io_normal_rd_rs1_data,
  output [4:0]  io_normal_rd_rs2_addr,
  input  [63:0] io_normal_rd_rs2_data,
  output [11:0] io_csr_rd_csr_addr,
  input  [63:0] io_csr_rd_csr_data,
  input         io_op_datas_ready,
  output        io_op_datas_valid,
  output [2:0]  io_op_datas_bits_opType,
  output [6:0]  io_op_datas_bits_exuType,
  output [4:0]  io_op_datas_bits_rs1_addr,
  output [63:0] io_op_datas_bits_rs1_data,
  output [4:0]  io_op_datas_bits_rs2_addr,
  output [63:0] io_op_datas_bits_rs2_data,
  output [31:0] io_op_datas_bits_imm,
  output [63:0] io_op_datas_bits_pc,
  output [4:0]  io_op_datas_bits_dest_addr,
  output        io_op_datas_bits_dest_is_reg,
  output        io_op_datas_bits_is_pre,
  output [11:0] io_op_datas_bits_csr_addr,
  output [63:0] io_op_datas_bits_csr_data,
  input         io_flush
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [63:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [63:0] _RAND_12;
  reg [31:0] _RAND_13;
`endif // RANDOMIZE_REG_INIT
  reg  reg_valid; // @[decode.scala 17:42]
  wire  ready = ~reg_valid | io_op_datas_ready; // @[decode.scala 18:34]
  reg [2:0] reg_opType; // @[decode.scala 27:42]
  reg [6:0] reg_exuType; // @[decode.scala 28:42]
  reg [4:0] reg_rs1_addr; // @[decode.scala 29:42]
  reg [63:0] reg_rs1_data; // @[decode.scala 30:42]
  reg [4:0] reg_rs2_addr; // @[decode.scala 32:42]
  reg [63:0] reg_rs2_data; // @[decode.scala 33:42]
  reg [31:0] reg_imm; // @[decode.scala 34:42]
  reg [63:0] reg_pc; // @[decode.scala 35:50]
  reg [4:0] reg_dest_addr; // @[decode.scala 38:42]
  reg  reg_dest_is_reg; // @[decode.scala 39:38]
  reg [11:0] reg_csr_addr; // @[decode.scala 41:42]
  reg [63:0] reg_csr_data; // @[decode.scala 42:42]
  reg  reg_is_pre; // @[decode.scala 43:42]
  wire [4:0] rs2_addr = io_get_inst_bits_inst[24:20]; // @[decode.scala 50:35]
  wire [4:0] rs1_addr = io_get_inst_bits_inst[19:15]; // @[decode.scala 51:35]
  wire [11:0] csr_addr = io_get_inst_bits_inst[31:20]; // @[decode.scala 52:35]
  wire [4:0] dest_addr = io_get_inst_bits_inst[11:7]; // @[decode.scala 53:39]
  wire [31:0] _T = io_get_inst_bits_inst & 32'hfe00707f; // @[Lookup.scala 31:38]
  wire  _T_1 = 32'h33 == _T; // @[Lookup.scala 31:38]
  wire [31:0] _T_2 = io_get_inst_bits_inst & 32'h707f; // @[Lookup.scala 31:38]
  wire  _T_3 = 32'h13 == _T_2; // @[Lookup.scala 31:38]
  wire  _T_5 = 32'h1b == _T_2; // @[Lookup.scala 31:38]
  wire  _T_7 = 32'h3b == _T; // @[Lookup.scala 31:38]
  wire  _T_9 = 32'h7033 == _T; // @[Lookup.scala 31:38]
  wire  _T_11 = 32'h7013 == _T_2; // @[Lookup.scala 31:38]
  wire [31:0] _T_12 = io_get_inst_bits_inst & 32'h7f; // @[Lookup.scala 31:38]
  wire  _T_13 = 32'h17 == _T_12; // @[Lookup.scala 31:38]
  wire  _T_15 = 32'h63 == _T_2; // @[Lookup.scala 31:38]
  wire  _T_17 = 32'h5063 == _T_2; // @[Lookup.scala 31:38]
  wire  _T_19 = 32'h7063 == _T_2; // @[Lookup.scala 31:38]
  wire  _T_21 = 32'h4063 == _T_2; // @[Lookup.scala 31:38]
  wire  _T_23 = 32'h6063 == _T_2; // @[Lookup.scala 31:38]
  wire  _T_25 = 32'h1063 == _T_2; // @[Lookup.scala 31:38]
  wire  _T_27 = 32'h3073 == _T_2; // @[Lookup.scala 31:38]
  wire  _T_29 = 32'h7073 == _T_2; // @[Lookup.scala 31:38]
  wire  _T_31 = 32'h2073 == _T_2; // @[Lookup.scala 31:38]
  wire  _T_33 = 32'h6073 == _T_2; // @[Lookup.scala 31:38]
  wire  _T_35 = 32'h1073 == _T_2; // @[Lookup.scala 31:38]
  wire  _T_37 = 32'h5073 == _T_2; // @[Lookup.scala 31:38]
  wire  _T_39 = 32'h3003 == _T_2; // @[Lookup.scala 31:38]
  wire  _T_41 = 32'h3 == _T_2; // @[Lookup.scala 31:38]
  wire  _T_43 = 32'h4003 == _T_2; // @[Lookup.scala 31:38]
  wire  _T_45 = 32'h1003 == _T_2; // @[Lookup.scala 31:38]
  wire  _T_47 = 32'h5003 == _T_2; // @[Lookup.scala 31:38]
  wire  _T_49 = 32'h37 == _T_12; // @[Lookup.scala 31:38]
  wire  _T_51 = 32'h2003 == _T_2; // @[Lookup.scala 31:38]
  wire  _T_53 = 32'h6003 == _T_2; // @[Lookup.scala 31:38]
  wire  _T_55 = 32'h3023 == _T_2; // @[Lookup.scala 31:38]
  wire  _T_57 = 32'h23 == _T_2; // @[Lookup.scala 31:38]
  wire  _T_59 = 32'h1023 == _T_2; // @[Lookup.scala 31:38]
  wire  _T_61 = 32'h1033 == _T; // @[Lookup.scala 31:38]
  wire [31:0] _T_62 = io_get_inst_bits_inst & 32'hfc00707f; // @[Lookup.scala 31:38]
  wire  _T_63 = 32'h1013 == _T_62; // @[Lookup.scala 31:38]
  wire  _T_65 = 32'h101b == _T; // @[Lookup.scala 31:38]
  wire  _T_67 = 32'h103b == _T; // @[Lookup.scala 31:38]
  wire  _T_69 = 32'h2033 == _T; // @[Lookup.scala 31:38]
  wire  _T_71 = 32'h2013 == _T_2; // @[Lookup.scala 31:38]
  wire  _T_73 = 32'h3013 == _T_2; // @[Lookup.scala 31:38]
  wire  _T_75 = 32'h3033 == _T; // @[Lookup.scala 31:38]
  wire  _T_77 = 32'h40005033 == _T; // @[Lookup.scala 31:38]
  wire  _T_79 = 32'h40005013 == _T_62; // @[Lookup.scala 31:38]
  wire  _T_81 = 32'h4000501b == _T; // @[Lookup.scala 31:38]
  wire  _T_83 = 32'h4000503b == _T; // @[Lookup.scala 31:38]
  wire  _T_85 = 32'h5033 == _T; // @[Lookup.scala 31:38]
  wire  _T_87 = 32'h5013 == _T_62; // @[Lookup.scala 31:38]
  wire  _T_89 = 32'h501b == _T; // @[Lookup.scala 31:38]
  wire  _T_91 = 32'h503b == _T; // @[Lookup.scala 31:38]
  wire  _T_93 = 32'h40000033 == _T; // @[Lookup.scala 31:38]
  wire  _T_95 = 32'h4000003b == _T; // @[Lookup.scala 31:38]
  wire  _T_97 = 32'h2023 == _T_2; // @[Lookup.scala 31:38]
  wire  _T_99 = 32'h6033 == _T; // @[Lookup.scala 31:38]
  wire  _T_101 = 32'h6013 == _T_2; // @[Lookup.scala 31:38]
  wire  _T_103 = 32'h4033 == _T; // @[Lookup.scala 31:38]
  wire  _T_105 = 32'h4013 == _T_2; // @[Lookup.scala 31:38]
  wire  _T_107 = 32'h2004033 == _T; // @[Lookup.scala 31:38]
  wire  _T_109 = 32'h2005033 == _T; // @[Lookup.scala 31:38]
  wire  _T_111 = 32'h200503b == _T; // @[Lookup.scala 31:38]
  wire  _T_113 = 32'h200403b == _T; // @[Lookup.scala 31:38]
  wire  _T_115 = 32'h2000033 == _T; // @[Lookup.scala 31:38]
  wire  _T_117 = 32'h2001033 == _T; // @[Lookup.scala 31:38]
  wire  _T_119 = 32'h2002033 == _T; // @[Lookup.scala 31:38]
  wire  _T_121 = 32'h2003033 == _T; // @[Lookup.scala 31:38]
  wire  _T_123 = 32'h200003b == _T; // @[Lookup.scala 31:38]
  wire  _T_125 = 32'h2006033 == _T; // @[Lookup.scala 31:38]
  wire  _T_127 = 32'h2007033 == _T; // @[Lookup.scala 31:38]
  wire  _T_129 = 32'h200703b == _T; // @[Lookup.scala 31:38]
  wire  _T_131 = 32'h200603b == _T; // @[Lookup.scala 31:38]
  wire  _T_133 = 32'h6f == _T_12; // @[Lookup.scala 31:38]
  wire  _T_135 = 32'h67 == _T_2; // @[Lookup.scala 31:38]
  wire  _T_137 = 32'h100073 == io_get_inst_bits_inst; // @[Lookup.scala 31:38]
  wire  _T_139 = 32'h30200073 == io_get_inst_bits_inst; // @[Lookup.scala 31:38]
  wire  _T_141 = 32'h73 == io_get_inst_bits_inst; // @[Lookup.scala 31:38]
  wire  _T_143 = 32'h10200073 == io_get_inst_bits_inst; // @[Lookup.scala 31:38]
  wire [31:0] _T_144 = io_get_inst_bits_inst & 32'hf00fffff; // @[Lookup.scala 31:38]
  wire  _T_145 = 32'hf == _T_144; // @[Lookup.scala 31:38]
  wire  _T_147 = 32'h100f == io_get_inst_bits_inst; // @[Lookup.scala 31:38]
  wire [31:0] _T_148 = io_get_inst_bits_inst & 32'hfe007fff; // @[Lookup.scala 31:38]
  wire  _T_149 = 32'h12000073 == _T_148; // @[Lookup.scala 31:38]
  wire [2:0] _T_150 = _T_149 ? 3'h6 : 3'h0; // @[Lookup.scala 34:39]
  wire [2:0] _T_151 = _T_147 ? 3'h6 : _T_150; // @[Lookup.scala 34:39]
  wire [2:0] _T_152 = _T_145 ? 3'h6 : _T_151; // @[Lookup.scala 34:39]
  wire [2:0] _T_153 = _T_143 ? 3'h4 : _T_152; // @[Lookup.scala 34:39]
  wire [2:0] _T_154 = _T_141 ? 3'h4 : _T_153; // @[Lookup.scala 34:39]
  wire [2:0] _T_155 = _T_139 ? 3'h4 : _T_154; // @[Lookup.scala 34:39]
  wire [2:0] _T_156 = _T_137 ? 3'h4 : _T_155; // @[Lookup.scala 34:39]
  wire [2:0] _T_157 = _T_135 ? 3'h1 : _T_156; // @[Lookup.scala 34:39]
  wire [2:0] _T_158 = _T_133 ? 3'h1 : _T_157; // @[Lookup.scala 34:39]
  wire [2:0] _T_159 = _T_131 ? 3'h3 : _T_158; // @[Lookup.scala 34:39]
  wire [2:0] _T_160 = _T_129 ? 3'h3 : _T_159; // @[Lookup.scala 34:39]
  wire [2:0] _T_161 = _T_127 ? 3'h3 : _T_160; // @[Lookup.scala 34:39]
  wire [2:0] _T_162 = _T_125 ? 3'h3 : _T_161; // @[Lookup.scala 34:39]
  wire [2:0] _T_163 = _T_123 ? 3'h3 : _T_162; // @[Lookup.scala 34:39]
  wire [2:0] _T_164 = _T_121 ? 3'h3 : _T_163; // @[Lookup.scala 34:39]
  wire [2:0] _T_165 = _T_119 ? 3'h3 : _T_164; // @[Lookup.scala 34:39]
  wire [2:0] _T_166 = _T_117 ? 3'h3 : _T_165; // @[Lookup.scala 34:39]
  wire [2:0] _T_167 = _T_115 ? 3'h3 : _T_166; // @[Lookup.scala 34:39]
  wire [2:0] _T_168 = _T_113 ? 3'h3 : _T_167; // @[Lookup.scala 34:39]
  wire [2:0] _T_169 = _T_111 ? 3'h3 : _T_168; // @[Lookup.scala 34:39]
  wire [2:0] _T_170 = _T_109 ? 3'h3 : _T_169; // @[Lookup.scala 34:39]
  wire [2:0] _T_171 = _T_107 ? 3'h3 : _T_170; // @[Lookup.scala 34:39]
  wire [2:0] _T_172 = _T_105 ? 3'h2 : _T_171; // @[Lookup.scala 34:39]
  wire [2:0] _T_173 = _T_103 ? 3'h2 : _T_172; // @[Lookup.scala 34:39]
  wire [2:0] _T_174 = _T_101 ? 3'h2 : _T_173; // @[Lookup.scala 34:39]
  wire [2:0] _T_175 = _T_99 ? 3'h2 : _T_174; // @[Lookup.scala 34:39]
  wire [2:0] _T_176 = _T_97 ? 3'h5 : _T_175; // @[Lookup.scala 34:39]
  wire [2:0] _T_177 = _T_95 ? 3'h2 : _T_176; // @[Lookup.scala 34:39]
  wire [2:0] _T_178 = _T_93 ? 3'h2 : _T_177; // @[Lookup.scala 34:39]
  wire [2:0] _T_179 = _T_91 ? 3'h2 : _T_178; // @[Lookup.scala 34:39]
  wire [2:0] _T_180 = _T_89 ? 3'h2 : _T_179; // @[Lookup.scala 34:39]
  wire [2:0] _T_181 = _T_87 ? 3'h2 : _T_180; // @[Lookup.scala 34:39]
  wire [2:0] _T_182 = _T_85 ? 3'h2 : _T_181; // @[Lookup.scala 34:39]
  wire [2:0] _T_183 = _T_83 ? 3'h2 : _T_182; // @[Lookup.scala 34:39]
  wire [2:0] _T_184 = _T_81 ? 3'h2 : _T_183; // @[Lookup.scala 34:39]
  wire [2:0] _T_185 = _T_79 ? 3'h2 : _T_184; // @[Lookup.scala 34:39]
  wire [2:0] _T_186 = _T_77 ? 3'h2 : _T_185; // @[Lookup.scala 34:39]
  wire [2:0] _T_187 = _T_75 ? 3'h2 : _T_186; // @[Lookup.scala 34:39]
  wire [2:0] _T_188 = _T_73 ? 3'h2 : _T_187; // @[Lookup.scala 34:39]
  wire [2:0] _T_189 = _T_71 ? 3'h2 : _T_188; // @[Lookup.scala 34:39]
  wire [2:0] _T_190 = _T_69 ? 3'h2 : _T_189; // @[Lookup.scala 34:39]
  wire [2:0] _T_191 = _T_67 ? 3'h2 : _T_190; // @[Lookup.scala 34:39]
  wire [2:0] _T_192 = _T_65 ? 3'h2 : _T_191; // @[Lookup.scala 34:39]
  wire [2:0] _T_193 = _T_63 ? 3'h2 : _T_192; // @[Lookup.scala 34:39]
  wire [2:0] _T_194 = _T_61 ? 3'h2 : _T_193; // @[Lookup.scala 34:39]
  wire [2:0] _T_195 = _T_59 ? 3'h5 : _T_194; // @[Lookup.scala 34:39]
  wire [2:0] _T_196 = _T_57 ? 3'h5 : _T_195; // @[Lookup.scala 34:39]
  wire [2:0] _T_197 = _T_55 ? 3'h5 : _T_196; // @[Lookup.scala 34:39]
  wire [2:0] _T_198 = _T_53 ? 3'h5 : _T_197; // @[Lookup.scala 34:39]
  wire [2:0] _T_199 = _T_51 ? 3'h5 : _T_198; // @[Lookup.scala 34:39]
  wire [2:0] _T_200 = _T_49 ? 3'h2 : _T_199; // @[Lookup.scala 34:39]
  wire [2:0] _T_201 = _T_47 ? 3'h5 : _T_200; // @[Lookup.scala 34:39]
  wire [2:0] _T_202 = _T_45 ? 3'h5 : _T_201; // @[Lookup.scala 34:39]
  wire [2:0] _T_203 = _T_43 ? 3'h5 : _T_202; // @[Lookup.scala 34:39]
  wire [2:0] _T_204 = _T_41 ? 3'h5 : _T_203; // @[Lookup.scala 34:39]
  wire [2:0] _T_205 = _T_39 ? 3'h5 : _T_204; // @[Lookup.scala 34:39]
  wire [2:0] _T_206 = _T_37 ? 3'h4 : _T_205; // @[Lookup.scala 34:39]
  wire [2:0] _T_207 = _T_35 ? 3'h4 : _T_206; // @[Lookup.scala 34:39]
  wire [2:0] _T_208 = _T_33 ? 3'h4 : _T_207; // @[Lookup.scala 34:39]
  wire [2:0] _T_209 = _T_31 ? 3'h4 : _T_208; // @[Lookup.scala 34:39]
  wire [2:0] _T_210 = _T_29 ? 3'h4 : _T_209; // @[Lookup.scala 34:39]
  wire [2:0] _T_211 = _T_27 ? 3'h4 : _T_210; // @[Lookup.scala 34:39]
  wire [2:0] _T_212 = _T_25 ? 3'h1 : _T_211; // @[Lookup.scala 34:39]
  wire [2:0] _T_213 = _T_23 ? 3'h1 : _T_212; // @[Lookup.scala 34:39]
  wire [2:0] _T_214 = _T_21 ? 3'h1 : _T_213; // @[Lookup.scala 34:39]
  wire [2:0] _T_215 = _T_19 ? 3'h1 : _T_214; // @[Lookup.scala 34:39]
  wire [2:0] _T_216 = _T_17 ? 3'h1 : _T_215; // @[Lookup.scala 34:39]
  wire [2:0] _T_217 = _T_15 ? 3'h1 : _T_216; // @[Lookup.scala 34:39]
  wire [2:0] _T_218 = _T_13 ? 3'h2 : _T_217; // @[Lookup.scala 34:39]
  wire [2:0] _T_219 = _T_11 ? 3'h2 : _T_218; // @[Lookup.scala 34:39]
  wire [2:0] _T_220 = _T_9 ? 3'h2 : _T_219; // @[Lookup.scala 34:39]
  wire [2:0] _T_221 = _T_7 ? 3'h2 : _T_220; // @[Lookup.scala 34:39]
  wire [2:0] _T_222 = _T_5 ? 3'h2 : _T_221; // @[Lookup.scala 34:39]
  wire [6:0] _T_224 = _T_149 ? 7'h42 : 7'h0; // @[Lookup.scala 34:39]
  wire [6:0] _T_225 = _T_147 ? 7'h45 : _T_224; // @[Lookup.scala 34:39]
  wire [6:0] _T_226 = _T_145 ? 7'h41 : _T_225; // @[Lookup.scala 34:39]
  wire [6:0] _T_227 = _T_143 ? 7'h62 : _T_226; // @[Lookup.scala 34:39]
  wire [6:0] _T_228 = _T_141 ? 7'h2 : _T_227; // @[Lookup.scala 34:39]
  wire [6:0] _T_229 = _T_139 ? 7'h42 : _T_228; // @[Lookup.scala 34:39]
  wire [6:0] _T_230 = _T_137 ? 7'h22 : _T_229; // @[Lookup.scala 34:39]
  wire [6:0] _T_231 = _T_135 ? 7'h4a : _T_230; // @[Lookup.scala 34:39]
  wire [6:0] _T_232 = _T_133 ? 7'h4e : _T_231; // @[Lookup.scala 34:39]
  wire [6:0] _T_233 = _T_131 ? 7'h1b : _T_232; // @[Lookup.scala 34:39]
  wire [6:0] _T_234 = _T_129 ? 7'h1f : _T_233; // @[Lookup.scala 34:39]
  wire [6:0] _T_235 = _T_127 ? 7'h1e : _T_234; // @[Lookup.scala 34:39]
  wire [6:0] _T_236 = _T_125 ? 7'h1a : _T_235; // @[Lookup.scala 34:39]
  wire [6:0] _T_237 = _T_123 ? 7'h3 : _T_236; // @[Lookup.scala 34:39]
  wire [6:0] _T_238 = _T_121 ? 7'he : _T_237; // @[Lookup.scala 34:39]
  wire [6:0] _T_239 = _T_119 ? 7'ha : _T_238; // @[Lookup.scala 34:39]
  wire [6:0] _T_240 = _T_117 ? 7'h6 : _T_239; // @[Lookup.scala 34:39]
  wire [6:0] _T_241 = _T_115 ? 7'h2 : _T_240; // @[Lookup.scala 34:39]
  wire [6:0] _T_242 = _T_113 ? 7'h13 : _T_241; // @[Lookup.scala 34:39]
  wire [6:0] _T_243 = _T_111 ? 7'h17 : _T_242; // @[Lookup.scala 34:39]
  wire [6:0] _T_244 = _T_109 ? 7'h16 : _T_243; // @[Lookup.scala 34:39]
  wire [6:0] _T_245 = _T_107 ? 7'h12 : _T_244; // @[Lookup.scala 34:39]
  wire [6:0] _T_246 = _T_105 ? 7'h10 : _T_245; // @[Lookup.scala 34:39]
  wire [6:0] _T_247 = _T_103 ? 7'h12 : _T_246; // @[Lookup.scala 34:39]
  wire [6:0] _T_248 = _T_101 ? 7'h18 : _T_247; // @[Lookup.scala 34:39]
  wire [6:0] _T_249 = _T_99 ? 7'h1a : _T_248; // @[Lookup.scala 34:39]
  wire [6:0] _T_250 = _T_97 ? 7'ha : _T_249; // @[Lookup.scala 34:39]
  wire [6:0] _T_251 = _T_95 ? 7'h23 : _T_250; // @[Lookup.scala 34:39]
  wire [6:0] _T_252 = _T_93 ? 7'h22 : _T_251; // @[Lookup.scala 34:39]
  wire [6:0] _T_253 = _T_91 ? 7'h17 : _T_252; // @[Lookup.scala 34:39]
  wire [6:0] _T_254 = _T_89 ? 7'h15 : _T_253; // @[Lookup.scala 34:39]
  wire [6:0] _T_255 = _T_87 ? 7'h14 : _T_254; // @[Lookup.scala 34:39]
  wire [6:0] _T_256 = _T_85 ? 7'h16 : _T_255; // @[Lookup.scala 34:39]
  wire [6:0] _T_257 = _T_83 ? 7'h37 : _T_256; // @[Lookup.scala 34:39]
  wire [6:0] _T_258 = _T_81 ? 7'h35 : _T_257; // @[Lookup.scala 34:39]
  wire [6:0] _T_259 = _T_79 ? 7'h34 : _T_258; // @[Lookup.scala 34:39]
  wire [6:0] _T_260 = _T_77 ? 7'h36 : _T_259; // @[Lookup.scala 34:39]
  wire [6:0] _T_261 = _T_75 ? 7'he : _T_260; // @[Lookup.scala 34:39]
  wire [6:0] _T_262 = _T_73 ? 7'hc : _T_261; // @[Lookup.scala 34:39]
  wire [6:0] _T_263 = _T_71 ? 7'h8 : _T_262; // @[Lookup.scala 34:39]
  wire [6:0] _T_264 = _T_69 ? 7'ha : _T_263; // @[Lookup.scala 34:39]
  wire [6:0] _T_265 = _T_67 ? 7'h7 : _T_264; // @[Lookup.scala 34:39]
  wire [6:0] _T_266 = _T_65 ? 7'h5 : _T_265; // @[Lookup.scala 34:39]
  wire [6:0] _T_267 = _T_63 ? 7'h4 : _T_266; // @[Lookup.scala 34:39]
  wire [6:0] _T_268 = _T_61 ? 7'h6 : _T_267; // @[Lookup.scala 34:39]
  wire [6:0] _T_269 = _T_59 ? 7'h6 : _T_268; // @[Lookup.scala 34:39]
  wire [6:0] _T_270 = _T_57 ? 7'h2 : _T_269; // @[Lookup.scala 34:39]
  wire [6:0] _T_271 = _T_55 ? 7'he : _T_270; // @[Lookup.scala 34:39]
  wire [6:0] _T_272 = _T_53 ? 7'h18 : _T_271; // @[Lookup.scala 34:39]
  wire [6:0] _T_273 = _T_51 ? 7'h8 : _T_272; // @[Lookup.scala 34:39]
  wire [6:0] _T_274 = _T_49 ? 7'h0 : _T_273; // @[Lookup.scala 34:39]
  wire [6:0] _T_275 = _T_47 ? 7'h14 : _T_274; // @[Lookup.scala 34:39]
  wire [6:0] _T_276 = _T_45 ? 7'h4 : _T_275; // @[Lookup.scala 34:39]
  wire [6:0] _T_277 = _T_43 ? 7'h10 : _T_276; // @[Lookup.scala 34:39]
  wire [6:0] _T_278 = _T_41 ? 7'h0 : _T_277; // @[Lookup.scala 34:39]
  wire [6:0] _T_279 = _T_39 ? 7'hc : _T_278; // @[Lookup.scala 34:39]
  wire [6:0] _T_280 = _T_37 ? 7'h16 : _T_279; // @[Lookup.scala 34:39]
  wire [6:0] _T_281 = _T_35 ? 7'h6 : _T_280; // @[Lookup.scala 34:39]
  wire [6:0] _T_282 = _T_33 ? 7'h1a : _T_281; // @[Lookup.scala 34:39]
  wire [6:0] _T_283 = _T_31 ? 7'ha : _T_282; // @[Lookup.scala 34:39]
  wire [6:0] _T_284 = _T_29 ? 7'h1e : _T_283; // @[Lookup.scala 34:39]
  wire [6:0] _T_285 = _T_27 ? 7'he : _T_284; // @[Lookup.scala 34:39]
  wire [6:0] _T_286 = _T_25 ? 7'h26 : _T_285; // @[Lookup.scala 34:39]
  wire [6:0] _T_287 = _T_23 ? 7'h3a : _T_286; // @[Lookup.scala 34:39]
  wire [6:0] _T_288 = _T_21 ? 7'h32 : _T_287; // @[Lookup.scala 34:39]
  wire [6:0] _T_289 = _T_19 ? 7'h3e : _T_288; // @[Lookup.scala 34:39]
  wire [6:0] _T_290 = _T_17 ? 7'h36 : _T_289; // @[Lookup.scala 34:39]
  wire [6:0] _T_291 = _T_15 ? 7'h22 : _T_290; // @[Lookup.scala 34:39]
  wire [6:0] _T_292 = _T_13 ? 7'h40 : _T_291; // @[Lookup.scala 34:39]
  wire [6:0] _T_293 = _T_11 ? 7'h1c : _T_292; // @[Lookup.scala 34:39]
  wire [6:0] _T_294 = _T_9 ? 7'h1e : _T_293; // @[Lookup.scala 34:39]
  wire [6:0] _T_295 = _T_7 ? 7'h3 : _T_294; // @[Lookup.scala 34:39]
  wire [6:0] _T_296 = _T_5 ? 7'h1 : _T_295; // @[Lookup.scala 34:39]
  wire [3:0] _T_305 = _T_135 ? 4'hc : 4'h0; // @[Lookup.scala 34:39]
  wire [3:0] _T_306 = _T_133 ? 4'h2 : _T_305; // @[Lookup.scala 34:39]
  wire [3:0] _T_307 = _T_131 ? 4'h6 : _T_306; // @[Lookup.scala 34:39]
  wire [3:0] _T_308 = _T_129 ? 4'h6 : _T_307; // @[Lookup.scala 34:39]
  wire [3:0] _T_309 = _T_127 ? 4'h6 : _T_308; // @[Lookup.scala 34:39]
  wire [3:0] _T_310 = _T_125 ? 4'h6 : _T_309; // @[Lookup.scala 34:39]
  wire [3:0] _T_311 = _T_123 ? 4'h6 : _T_310; // @[Lookup.scala 34:39]
  wire [3:0] _T_312 = _T_121 ? 4'h6 : _T_311; // @[Lookup.scala 34:39]
  wire [3:0] _T_313 = _T_119 ? 4'h6 : _T_312; // @[Lookup.scala 34:39]
  wire [3:0] _T_314 = _T_117 ? 4'h6 : _T_313; // @[Lookup.scala 34:39]
  wire [3:0] _T_315 = _T_115 ? 4'h6 : _T_314; // @[Lookup.scala 34:39]
  wire [3:0] _T_316 = _T_113 ? 4'h6 : _T_315; // @[Lookup.scala 34:39]
  wire [3:0] _T_317 = _T_111 ? 4'h6 : _T_316; // @[Lookup.scala 34:39]
  wire [3:0] _T_318 = _T_109 ? 4'h6 : _T_317; // @[Lookup.scala 34:39]
  wire [3:0] _T_319 = _T_107 ? 4'h6 : _T_318; // @[Lookup.scala 34:39]
  wire [3:0] _T_320 = _T_105 ? 4'hc : _T_319; // @[Lookup.scala 34:39]
  wire [3:0] _T_321 = _T_103 ? 4'h6 : _T_320; // @[Lookup.scala 34:39]
  wire [3:0] _T_322 = _T_101 ? 4'hc : _T_321; // @[Lookup.scala 34:39]
  wire [3:0] _T_323 = _T_99 ? 4'h6 : _T_322; // @[Lookup.scala 34:39]
  wire [3:0] _T_324 = _T_97 ? 4'h3 : _T_323; // @[Lookup.scala 34:39]
  wire [3:0] _T_325 = _T_95 ? 4'h6 : _T_324; // @[Lookup.scala 34:39]
  wire [3:0] _T_326 = _T_93 ? 4'h6 : _T_325; // @[Lookup.scala 34:39]
  wire [3:0] _T_327 = _T_91 ? 4'h6 : _T_326; // @[Lookup.scala 34:39]
  wire [3:0] _T_328 = _T_89 ? 4'h4 : _T_327; // @[Lookup.scala 34:39]
  wire [3:0] _T_329 = _T_87 ? 4'h4 : _T_328; // @[Lookup.scala 34:39]
  wire [3:0] _T_330 = _T_85 ? 4'h6 : _T_329; // @[Lookup.scala 34:39]
  wire [3:0] _T_331 = _T_83 ? 4'h6 : _T_330; // @[Lookup.scala 34:39]
  wire [3:0] _T_332 = _T_81 ? 4'h4 : _T_331; // @[Lookup.scala 34:39]
  wire [3:0] _T_333 = _T_79 ? 4'h4 : _T_332; // @[Lookup.scala 34:39]
  wire [3:0] _T_334 = _T_77 ? 4'h6 : _T_333; // @[Lookup.scala 34:39]
  wire [3:0] _T_335 = _T_75 ? 4'h6 : _T_334; // @[Lookup.scala 34:39]
  wire [3:0] _T_336 = _T_73 ? 4'hc : _T_335; // @[Lookup.scala 34:39]
  wire [3:0] _T_337 = _T_71 ? 4'hc : _T_336; // @[Lookup.scala 34:39]
  wire [3:0] _T_338 = _T_69 ? 4'h6 : _T_337; // @[Lookup.scala 34:39]
  wire [3:0] _T_339 = _T_67 ? 4'h6 : _T_338; // @[Lookup.scala 34:39]
  wire [3:0] _T_340 = _T_65 ? 4'h4 : _T_339; // @[Lookup.scala 34:39]
  wire [3:0] _T_341 = _T_63 ? 4'h4 : _T_340; // @[Lookup.scala 34:39]
  wire [3:0] _T_342 = _T_61 ? 4'h6 : _T_341; // @[Lookup.scala 34:39]
  wire [3:0] _T_343 = _T_59 ? 4'h3 : _T_342; // @[Lookup.scala 34:39]
  wire [3:0] _T_344 = _T_57 ? 4'h3 : _T_343; // @[Lookup.scala 34:39]
  wire [3:0] _T_345 = _T_55 ? 4'h3 : _T_344; // @[Lookup.scala 34:39]
  wire [3:0] _T_346 = _T_53 ? 4'hc : _T_345; // @[Lookup.scala 34:39]
  wire [3:0] _T_347 = _T_51 ? 4'hc : _T_346; // @[Lookup.scala 34:39]
  wire [3:0] _T_348 = _T_49 ? 4'h1 : _T_347; // @[Lookup.scala 34:39]
  wire [3:0] _T_349 = _T_47 ? 4'hc : _T_348; // @[Lookup.scala 34:39]
  wire [3:0] _T_350 = _T_45 ? 4'hc : _T_349; // @[Lookup.scala 34:39]
  wire [3:0] _T_351 = _T_43 ? 4'hc : _T_350; // @[Lookup.scala 34:39]
  wire [3:0] _T_352 = _T_41 ? 4'hc : _T_351; // @[Lookup.scala 34:39]
  wire [3:0] _T_353 = _T_39 ? 4'hc : _T_352; // @[Lookup.scala 34:39]
  wire [3:0] _T_354 = _T_37 ? 4'h5 : _T_353; // @[Lookup.scala 34:39]
  wire [3:0] _T_355 = _T_35 ? 4'h5 : _T_354; // @[Lookup.scala 34:39]
  wire [3:0] _T_356 = _T_33 ? 4'h5 : _T_355; // @[Lookup.scala 34:39]
  wire [3:0] _T_357 = _T_31 ? 4'h5 : _T_356; // @[Lookup.scala 34:39]
  wire [3:0] _T_358 = _T_29 ? 4'h5 : _T_357; // @[Lookup.scala 34:39]
  wire [3:0] _T_359 = _T_27 ? 4'h5 : _T_358; // @[Lookup.scala 34:39]
  wire [3:0] _T_360 = _T_25 ? 4'h7 : _T_359; // @[Lookup.scala 34:39]
  wire [3:0] _T_361 = _T_23 ? 4'h7 : _T_360; // @[Lookup.scala 34:39]
  wire [3:0] _T_362 = _T_21 ? 4'h7 : _T_361; // @[Lookup.scala 34:39]
  wire [3:0] _T_363 = _T_19 ? 4'h7 : _T_362; // @[Lookup.scala 34:39]
  wire [3:0] _T_364 = _T_17 ? 4'h7 : _T_363; // @[Lookup.scala 34:39]
  wire [3:0] _T_365 = _T_15 ? 4'h7 : _T_364; // @[Lookup.scala 34:39]
  wire [3:0] _T_366 = _T_13 ? 4'h1 : _T_365; // @[Lookup.scala 34:39]
  wire [3:0] _T_367 = _T_11 ? 4'hc : _T_366; // @[Lookup.scala 34:39]
  wire [3:0] _T_368 = _T_9 ? 4'h6 : _T_367; // @[Lookup.scala 34:39]
  wire [3:0] _T_369 = _T_7 ? 4'h6 : _T_368; // @[Lookup.scala 34:39]
  wire [3:0] _T_370 = _T_5 ? 4'hc : _T_369; // @[Lookup.scala 34:39]
  wire [3:0] _T_371 = _T_3 ? 4'hc : _T_370; // @[Lookup.scala 34:39]
  wire [3:0] instType = _T_1 ? 4'h6 : _T_371; // @[Lookup.scala 34:39]
  wire  _T_398 = _T_97 ? 1'h0 : _T_99 | (_T_101 | (_T_103 | (_T_105 | (_T_107 | (_T_109 | (_T_111 | (_T_113 | (_T_115 |
    (_T_117 | (_T_119 | (_T_121 | (_T_123 | (_T_125 | (_T_127 | (_T_129 | (_T_131 | (_T_133 | _T_135))))))))))))))))); // @[Lookup.scala 34:39]
  wire  _T_417 = _T_59 ? 1'h0 : _T_61 | (_T_63 | (_T_65 | (_T_67 | (_T_69 | (_T_71 | (_T_73 | (_T_75 | (_T_77 | (_T_79
     | (_T_81 | (_T_83 | (_T_85 | (_T_87 | (_T_89 | (_T_91 | (_T_93 | (_T_95 | _T_398))))))))))))))))); // @[Lookup.scala 34:39]
  wire  _T_418 = _T_57 ? 1'h0 : _T_417; // @[Lookup.scala 34:39]
  wire  _T_419 = _T_55 ? 1'h0 : _T_418; // @[Lookup.scala 34:39]
  wire  _T_434 = _T_25 ? 1'h0 : _T_27 | (_T_29 | (_T_31 | (_T_33 | (_T_35 | (_T_37 | (_T_39 | (_T_41 | (_T_43 | (_T_45
     | (_T_47 | (_T_49 | (_T_51 | (_T_53 | _T_419))))))))))))); // @[Lookup.scala 34:39]
  wire  _T_435 = _T_23 ? 1'h0 : _T_434; // @[Lookup.scala 34:39]
  wire  _T_436 = _T_21 ? 1'h0 : _T_435; // @[Lookup.scala 34:39]
  wire  _T_437 = _T_19 ? 1'h0 : _T_436; // @[Lookup.scala 34:39]
  wire  _T_438 = _T_17 ? 1'h0 : _T_437; // @[Lookup.scala 34:39]
  wire  _T_439 = _T_15 ? 1'h0 : _T_438; // @[Lookup.scala 34:39]
  wire  dest_is_reg = _T_1 | (_T_3 | (_T_5 | (_T_7 | (_T_9 | (_T_11 | (_T_13 | _T_439)))))); // @[Lookup.scala 34:39]
  wire  _T_454 = _T_133 ? 1'h0 : _T_135; // @[Lookup.scala 34:39]
  wire  _T_484 = _T_73 | (_T_75 | (_T_77 | (_T_79 | (_T_81 | (_T_83 | (_T_85 | (_T_87 | (_T_89 | (_T_91 | (_T_93 | (
    _T_95 | (_T_97 | (_T_99 | (_T_101 | (_T_103 | (_T_105 | (_T_107 | (_T_109 | (_T_111 | (_T_113 | (_T_115 | (_T_117 |
    (_T_119 | (_T_121 | (_T_123 | (_T_125 | (_T_127 | (_T_129 | (_T_131 | _T_454))))))))))))))))))))))))))))); // @[Lookup.scala 34:39]
  wire  _T_496 = _T_49 ? 1'h0 : _T_51 | (_T_53 | (_T_55 | (_T_57 | (_T_59 | (_T_61 | (_T_63 | (_T_65 | (_T_67 | (_T_69
     | (_T_71 | _T_484)))))))))); // @[Lookup.scala 34:39]
  wire  _T_502 = _T_37 ? 1'h0 : _T_39 | (_T_41 | (_T_43 | (_T_45 | (_T_47 | _T_496)))); // @[Lookup.scala 34:39]
  wire  _T_504 = _T_33 ? 1'h0 : _T_35 | _T_502; // @[Lookup.scala 34:39]
  wire  _T_506 = _T_29 ? 1'h0 : _T_31 | _T_504; // @[Lookup.scala 34:39]
  wire  _T_514 = _T_13 ? 1'h0 : _T_15 | (_T_17 | (_T_19 | (_T_21 | (_T_23 | (_T_25 | (_T_27 | _T_506)))))); // @[Lookup.scala 34:39]
  wire  rs1_is_reg = _T_1 | (_T_3 | (_T_5 | (_T_7 | (_T_9 | (_T_11 | _T_514))))); // @[Lookup.scala 34:39]
  wire  _T_542 = _T_105 ? 1'h0 : _T_107 | (_T_109 | (_T_111 | (_T_113 | (_T_115 | (_T_117 | (_T_119 | (_T_121 | (_T_123
     | (_T_125 | (_T_127 | (_T_129 | _T_131))))))))))); // @[Lookup.scala 34:39]
  wire  _T_544 = _T_101 ? 1'h0 : _T_103 | _T_542; // @[Lookup.scala 34:39]
  wire  _T_550 = _T_89 ? 1'h0 : _T_91 | (_T_93 | (_T_95 | (_T_97 | (_T_99 | _T_544)))); // @[Lookup.scala 34:39]
  wire  _T_551 = _T_87 ? 1'h0 : _T_550; // @[Lookup.scala 34:39]
  wire  _T_554 = _T_81 ? 1'h0 : _T_83 | (_T_85 | _T_551); // @[Lookup.scala 34:39]
  wire  _T_555 = _T_79 ? 1'h0 : _T_554; // @[Lookup.scala 34:39]
  wire  _T_558 = _T_73 ? 1'h0 : _T_75 | (_T_77 | _T_555); // @[Lookup.scala 34:39]
  wire  _T_559 = _T_71 ? 1'h0 : _T_558; // @[Lookup.scala 34:39]
  wire  _T_562 = _T_65 ? 1'h0 : _T_67 | (_T_69 | _T_559); // @[Lookup.scala 34:39]
  wire  _T_563 = _T_63 ? 1'h0 : _T_562; // @[Lookup.scala 34:39]
  wire  _T_568 = _T_53 ? 1'h0 : _T_55 | (_T_57 | (_T_59 | (_T_61 | _T_563))); // @[Lookup.scala 34:39]
  wire  _T_569 = _T_51 ? 1'h0 : _T_568; // @[Lookup.scala 34:39]
  wire  _T_570 = _T_49 ? 1'h0 : _T_569; // @[Lookup.scala 34:39]
  wire  _T_571 = _T_47 ? 1'h0 : _T_570; // @[Lookup.scala 34:39]
  wire  _T_572 = _T_45 ? 1'h0 : _T_571; // @[Lookup.scala 34:39]
  wire  _T_573 = _T_43 ? 1'h0 : _T_572; // @[Lookup.scala 34:39]
  wire  _T_574 = _T_41 ? 1'h0 : _T_573; // @[Lookup.scala 34:39]
  wire  _T_575 = _T_39 ? 1'h0 : _T_574; // @[Lookup.scala 34:39]
  wire  _T_576 = _T_37 ? 1'h0 : _T_575; // @[Lookup.scala 34:39]
  wire  _T_577 = _T_35 ? 1'h0 : _T_576; // @[Lookup.scala 34:39]
  wire  _T_578 = _T_33 ? 1'h0 : _T_577; // @[Lookup.scala 34:39]
  wire  _T_579 = _T_31 ? 1'h0 : _T_578; // @[Lookup.scala 34:39]
  wire  _T_580 = _T_29 ? 1'h0 : _T_579; // @[Lookup.scala 34:39]
  wire  _T_581 = _T_27 ? 1'h0 : _T_580; // @[Lookup.scala 34:39]
  wire  _T_588 = _T_13 ? 1'h0 : _T_15 | (_T_17 | (_T_19 | (_T_21 | (_T_23 | (_T_25 | _T_581))))); // @[Lookup.scala 34:39]
  wire  _T_589 = _T_11 ? 1'h0 : _T_588; // @[Lookup.scala 34:39]
  wire  _T_592 = _T_5 ? 1'h0 : _T_7 | (_T_9 | _T_589); // @[Lookup.scala 34:39]
  wire  _T_593 = _T_3 ? 1'h0 : _T_592; // @[Lookup.scala 34:39]
  wire  rs2_is_reg = _T_1 | _T_593; // @[Lookup.scala 34:39]
  wire [19:0] _imm_data_T_2 = io_get_inst_bits_inst[31] ? 20'hfffff : 20'h0; // @[Bitwise.scala 77:12]
  wire [31:0] _imm_data_T_4 = {_imm_data_T_2,csr_addr}; // @[Cat.scala 33:92]
  wire [31:0] _imm_data_T_6 = {io_get_inst_bits_inst[31:12],12'h0}; // @[Cat.scala 33:92]
  wire [31:0] _imm_data_T_13 = {_imm_data_T_2,io_get_inst_bits_inst[31:25],dest_addr}; // @[Cat.scala 33:92]
  wire [11:0] _imm_data_T_16 = io_get_inst_bits_inst[31] ? 12'hfff : 12'h0; // @[Bitwise.scala 77:12]
  wire [31:0] _imm_data_T_23 = {_imm_data_T_16,io_get_inst_bits_inst[19:12],io_get_inst_bits_inst[20],
    io_get_inst_bits_inst[30:21],1'h0}; // @[Cat.scala 33:92]
  wire [31:0] _imm_data_T_33 = {_imm_data_T_2,io_get_inst_bits_inst[7],io_get_inst_bits_inst[30:25],
    io_get_inst_bits_inst[11:8],1'h0}; // @[Cat.scala 33:92]
  wire [31:0] _imm_data_T_35 = {27'h0,rs1_addr}; // @[Cat.scala 33:92]
  wire [31:0] _imm_data_T_37 = {26'h0,io_get_inst_bits_inst[25:20]}; // @[Cat.scala 33:92]
  wire [31:0] _imm_data_T_39 = 4'hc == instType ? _imm_data_T_4 : 32'h0; // @[Mux.scala 81:58]
  wire [31:0] _imm_data_T_41 = 4'h1 == instType ? _imm_data_T_6 : _imm_data_T_39; // @[Mux.scala 81:58]
  wire [31:0] _imm_data_T_43 = 4'h3 == instType ? _imm_data_T_13 : _imm_data_T_41; // @[Mux.scala 81:58]
  wire [31:0] _imm_data_T_45 = 4'h2 == instType ? _imm_data_T_23 : _imm_data_T_43; // @[Mux.scala 81:58]
  wire [31:0] _imm_data_T_47 = 4'h7 == instType ? _imm_data_T_33 : _imm_data_T_45; // @[Mux.scala 81:58]
  assign io_get_inst_ready = ~reg_valid | io_op_datas_ready; // @[decode.scala 18:34]
  assign io_normal_rd_rs1_addr = io_get_inst_bits_inst[19:15]; // @[decode.scala 51:35]
  assign io_normal_rd_rs2_addr = io_get_inst_bits_inst[24:20]; // @[decode.scala 50:35]
  assign io_csr_rd_csr_addr = io_get_inst_bits_inst[31:20]; // @[decode.scala 52:35]
  assign io_op_datas_valid = reg_valid; // @[decode.scala 115:57]
  assign io_op_datas_bits_opType = reg_opType; // @[decode.scala 100:49]
  assign io_op_datas_bits_exuType = reg_exuType; // @[decode.scala 101:49]
  assign io_op_datas_bits_rs1_addr = reg_rs1_addr; // @[decode.scala 102:49]
  assign io_op_datas_bits_rs1_data = reg_rs1_data; // @[decode.scala 103:49]
  assign io_op_datas_bits_rs2_addr = reg_rs2_addr; // @[decode.scala 104:49]
  assign io_op_datas_bits_rs2_data = reg_rs2_data; // @[decode.scala 105:49]
  assign io_op_datas_bits_imm = reg_imm; // @[decode.scala 106:49]
  assign io_op_datas_bits_pc = reg_pc; // @[decode.scala 107:57]
  assign io_op_datas_bits_dest_addr = reg_dest_addr; // @[decode.scala 109:49]
  assign io_op_datas_bits_dest_is_reg = reg_dest_is_reg; // @[decode.scala 110:41]
  assign io_op_datas_bits_is_pre = reg_is_pre; // @[decode.scala 114:49]
  assign io_op_datas_bits_csr_addr = reg_csr_addr; // @[decode.scala 112:49]
  assign io_op_datas_bits_csr_data = reg_csr_data; // @[decode.scala 113:49]
  always @(posedge clock) begin
    if (reset) begin // @[decode.scala 17:42]
      reg_valid <= 1'h0; // @[decode.scala 17:42]
    end else if (io_flush) begin // @[decode.scala 19:20]
      reg_valid <= 1'h0; // @[decode.scala 20:33]
    end else if (ready) begin // @[decode.scala 22:28]
      reg_valid <= io_get_inst_valid; // @[decode.scala 23:41]
    end
    if (reset) begin // @[decode.scala 27:42]
      reg_opType <= 3'h0; // @[decode.scala 27:42]
    end else if (ready) begin // @[decode.scala 77:20]
      if (_T_1) begin // @[Lookup.scala 34:39]
        reg_opType <= 3'h2;
      end else if (_T_3) begin // @[Lookup.scala 34:39]
        reg_opType <= 3'h2;
      end else begin
        reg_opType <= _T_222;
      end
    end
    if (reset) begin // @[decode.scala 28:42]
      reg_exuType <= 7'h0; // @[decode.scala 28:42]
    end else if (ready) begin // @[decode.scala 77:20]
      if (_T_1) begin // @[Lookup.scala 34:39]
        reg_exuType <= 7'h2;
      end else if (_T_3) begin // @[Lookup.scala 34:39]
        reg_exuType <= 7'h0;
      end else begin
        reg_exuType <= _T_296;
      end
    end
    if (reset) begin // @[decode.scala 29:42]
      reg_rs1_addr <= 5'h0; // @[decode.scala 29:42]
    end else if (ready) begin // @[decode.scala 77:20]
      if (rs1_is_reg) begin // @[decode.scala 72:34]
        reg_rs1_addr <= rs1_addr;
      end else begin
        reg_rs1_addr <= 5'h0;
      end
    end
    if (reset) begin // @[decode.scala 30:42]
      reg_rs1_data <= 64'h0; // @[decode.scala 30:42]
    end else if (ready) begin // @[decode.scala 77:20]
      if (rs1_is_reg) begin // @[decode.scala 73:34]
        reg_rs1_data <= io_normal_rd_rs1_data;
      end else begin
        reg_rs1_data <= 64'h0;
      end
    end
    if (reset) begin // @[decode.scala 32:42]
      reg_rs2_addr <= 5'h0; // @[decode.scala 32:42]
    end else if (ready) begin // @[decode.scala 77:20]
      if (rs2_is_reg) begin // @[decode.scala 74:34]
        reg_rs2_addr <= rs2_addr;
      end else begin
        reg_rs2_addr <= 5'h0;
      end
    end
    if (reset) begin // @[decode.scala 33:42]
      reg_rs2_data <= 64'h0; // @[decode.scala 33:42]
    end else if (ready) begin // @[decode.scala 77:20]
      if (rs2_is_reg) begin // @[decode.scala 75:34]
        reg_rs2_data <= io_normal_rd_rs2_data;
      end else begin
        reg_rs2_data <= 64'h0;
      end
    end
    if (reset) begin // @[decode.scala 34:42]
      reg_imm <= 32'h0; // @[decode.scala 34:42]
    end else if (ready) begin // @[decode.scala 77:20]
      if (4'h4 == instType) begin // @[Mux.scala 81:58]
        reg_imm <= _imm_data_T_37;
      end else if (4'h5 == instType) begin // @[Mux.scala 81:58]
        reg_imm <= _imm_data_T_35;
      end else begin
        reg_imm <= _imm_data_T_47;
      end
    end
    if (reset) begin // @[decode.scala 35:50]
      reg_pc <= 64'h0; // @[decode.scala 35:50]
    end else if (ready) begin // @[decode.scala 77:20]
      reg_pc <= io_get_inst_bits_pc; // @[decode.scala 86:41]
    end
    if (reset) begin // @[decode.scala 38:42]
      reg_dest_addr <= 5'h0; // @[decode.scala 38:42]
    end else if (ready) begin // @[decode.scala 77:20]
      reg_dest_addr <= dest_addr; // @[decode.scala 89:33]
    end
    if (reset) begin // @[decode.scala 39:38]
      reg_dest_is_reg <= 1'h0; // @[decode.scala 39:38]
    end else if (ready) begin // @[decode.scala 77:20]
      reg_dest_is_reg <= dest_is_reg & dest_addr != 5'h0; // @[decode.scala 90:33]
    end
    if (reset) begin // @[decode.scala 41:42]
      reg_csr_addr <= 12'h0; // @[decode.scala 41:42]
    end else if (ready) begin // @[decode.scala 77:20]
      reg_csr_addr <= csr_addr; // @[decode.scala 92:33]
    end
    if (reset) begin // @[decode.scala 42:42]
      reg_csr_data <= 64'h0; // @[decode.scala 42:42]
    end else if (ready) begin // @[decode.scala 77:20]
      reg_csr_data <= io_csr_rd_csr_data; // @[decode.scala 93:33]
    end
    if (reset) begin // @[decode.scala 43:42]
      reg_is_pre <= 1'h0; // @[decode.scala 43:42]
    end else if (ready) begin // @[decode.scala 77:20]
      reg_is_pre <= io_get_inst_bits_is_pre; // @[decode.scala 94:41]
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
  reg_opType = _RAND_1[2:0];
  _RAND_2 = {1{`RANDOM}};
  reg_exuType = _RAND_2[6:0];
  _RAND_3 = {1{`RANDOM}};
  reg_rs1_addr = _RAND_3[4:0];
  _RAND_4 = {2{`RANDOM}};
  reg_rs1_data = _RAND_4[63:0];
  _RAND_5 = {1{`RANDOM}};
  reg_rs2_addr = _RAND_5[4:0];
  _RAND_6 = {2{`RANDOM}};
  reg_rs2_data = _RAND_6[63:0];
  _RAND_7 = {1{`RANDOM}};
  reg_imm = _RAND_7[31:0];
  _RAND_8 = {2{`RANDOM}};
  reg_pc = _RAND_8[63:0];
  _RAND_9 = {1{`RANDOM}};
  reg_dest_addr = _RAND_9[4:0];
  _RAND_10 = {1{`RANDOM}};
  reg_dest_is_reg = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  reg_csr_addr = _RAND_11[11:0];
  _RAND_12 = {2{`RANDOM}};
  reg_csr_data = _RAND_12[63:0];
  _RAND_13 = {1{`RANDOM}};
  reg_is_pre = _RAND_13[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_040318_CsrRegCtrl(
  input         clock,
  input         reset,
  input  [11:0] io_in_csr_addr,
  input  [63:0] io_in_csr_data,
  input         io_in_w_csr_en,
  input  [63:0] io_in_pc,
  input  [63:0] io_in_next_pc,
  input         io_in_time_irq,
  input         io_in_soft_irq,
  input  [4:0]  io_in_exception,
  input         io_in_is_exception,
  input         io_in_commit,
  input  [11:0] io_r_csr_raddr,
  output [63:0] io_r_csr_rdata,
  output [63:0] io_r_csr_mtvec,
  output [63:0] io_r_csr_mepc,
  output [63:0] io_r_csr_mstatus,
  output [63:0] io_r_csr_mie
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
`endif // RANDOMIZE_REG_INIT
  wire  irq = io_in_time_irq | io_in_soft_irq; // @[regsfile.scala 64:34]
  reg [63:0] reg_mstatus; // @[regsfile.scala 66:34]
  reg [63:0] reg_mie; // @[regsfile.scala 67:34]
  reg [63:0] reg_mtvec; // @[regsfile.scala 68:34]
  reg [63:0] reg_mscratch; // @[regsfile.scala 69:35]
  reg [63:0] reg_mepc; // @[regsfile.scala 70:34]
  reg [63:0] reg_mcause; // @[regsfile.scala 71:34]
  reg [63:0] reg_mtval; // @[regsfile.scala 72:34]
  reg [63:0] reg_mcycle; // @[regsfile.scala 74:34]
  reg [63:0] reg_minstret; // @[regsfile.scala 75:35]
  wire [63:0] _reg_mstatus_T = reg_mstatus & 64'hffffffffffffff77; // @[regsfile.scala 87:45]
  wire [63:0] _reg_mstatus_T_2 = reg_mstatus[3] ? 64'h1880 : 64'h1800; // @[regsfile.scala 87:78]
  wire [63:0] _reg_mstatus_T_3 = _reg_mstatus_T | _reg_mstatus_T_2; // @[regsfile.scala 87:72]
  wire [4:0] _reg_mcause_T = io_in_time_irq ? 5'h7 : 5'h3; // @[regsfile.scala 90:73]
  wire [63:0] _reg_mcause_T_1 = {59'h400000000000000,_reg_mcause_T}; // @[Cat.scala 33:92]
  wire  _reg_mepc_T_1 = io_in_csr_addr == 12'h341; // @[regsfile.scala 95:63]
  wire [63:0] _reg_mepc_T_2 = io_in_csr_addr == 12'h341 ? io_in_csr_data : reg_mepc; // @[regsfile.scala 95:47]
  wire [63:0] _reg_mcause_T_3 = io_in_csr_addr == 12'h342 ? io_in_csr_data : reg_mcause; // @[regsfile.scala 96:47]
  wire [63:0] _reg_mtval_T_1 = io_in_csr_addr == 12'h343 ? io_in_csr_data : reg_mtval; // @[regsfile.scala 97:47]
  wire  _reg_mstatus_T_8 = io_in_csr_addr == 12'h300; // @[regsfile.scala 98:59]
  wire [63:0] _reg_mstatus_T_9 = io_in_csr_addr == 12'h300 ? io_in_csr_data : reg_mstatus; // @[regsfile.scala 98:43]
  wire  _reg_mie_T = io_in_csr_addr == 12'h304; // @[regsfile.scala 104:63]
  wire  _reg_mtvec_T = io_in_csr_addr == 12'h305; // @[regsfile.scala 105:63]
  wire [63:0] _reg_mcycle_T_2 = reg_mcycle + 64'h1; // @[regsfile.scala 115:112]
  wire [63:0] _reg_minstret_T_2 = reg_minstret + 64'h1; // @[regsfile.scala 116:125]
  wire [63:0] _reg_minstret_T_3 = io_in_commit ? _reg_minstret_T_2 : reg_minstret; // @[regsfile.scala 116:98]
  wire [63:0] _csr_rdata_T_9 = 12'h300 == io_r_csr_raddr ? reg_mstatus : 64'h0; // @[Mux.scala 81:58]
  wire [63:0] _csr_rdata_T_11 = 12'h301 == io_r_csr_raddr ? 64'h0 : _csr_rdata_T_9; // @[Mux.scala 81:58]
  wire [63:0] _csr_rdata_T_13 = 12'h302 == io_r_csr_raddr ? 64'h0 : _csr_rdata_T_11; // @[Mux.scala 81:58]
  wire [63:0] _csr_rdata_T_15 = 12'h303 == io_r_csr_raddr ? 64'h0 : _csr_rdata_T_13; // @[Mux.scala 81:58]
  wire [63:0] _csr_rdata_T_17 = 12'h304 == io_r_csr_raddr ? reg_mie : _csr_rdata_T_15; // @[Mux.scala 81:58]
  wire [63:0] _csr_rdata_T_19 = 12'h305 == io_r_csr_raddr ? reg_mtvec : _csr_rdata_T_17; // @[Mux.scala 81:58]
  wire [63:0] _csr_rdata_T_21 = 12'h306 == io_r_csr_raddr ? 64'h0 : _csr_rdata_T_19; // @[Mux.scala 81:58]
  wire [63:0] _csr_rdata_T_23 = 12'h340 == io_r_csr_raddr ? reg_mscratch : _csr_rdata_T_21; // @[Mux.scala 81:58]
  wire [63:0] _csr_rdata_T_25 = 12'h341 == io_r_csr_raddr ? reg_mepc : _csr_rdata_T_23; // @[Mux.scala 81:58]
  wire [63:0] _csr_rdata_T_27 = 12'h342 == io_r_csr_raddr ? reg_mcause : _csr_rdata_T_25; // @[Mux.scala 81:58]
  wire [63:0] _csr_rdata_T_29 = 12'h343 == io_r_csr_raddr ? reg_mtval : _csr_rdata_T_27; // @[Mux.scala 81:58]
  wire [63:0] _csr_rdata_T_31 = 12'h344 == io_r_csr_raddr ? 64'h0 : _csr_rdata_T_29; // @[Mux.scala 81:58]
  wire [63:0] _csr_rdata_T_33 = 12'hb00 == io_r_csr_raddr ? reg_mcycle : _csr_rdata_T_31; // @[Mux.scala 81:58]
  wire [63:0] csr_rdata = 12'hb02 == io_r_csr_raddr ? reg_minstret : _csr_rdata_T_33; // @[Mux.scala 81:58]
  assign io_r_csr_rdata = io_r_csr_raddr == io_in_csr_addr & io_in_w_csr_en ? io_in_csr_data : csr_rdata; // @[regsfile.scala 145:31]
  assign io_r_csr_mtvec = _reg_mtvec_T & io_in_w_csr_en ? io_in_csr_data : reg_mtvec; // @[regsfile.scala 146:31]
  assign io_r_csr_mepc = _reg_mepc_T_1 & io_in_w_csr_en ? io_in_csr_data : reg_mepc; // @[regsfile.scala 147:31]
  assign io_r_csr_mstatus = _reg_mstatus_T_8 & io_in_w_csr_en ? io_in_csr_data : reg_mstatus; // @[regsfile.scala 148:32]
  assign io_r_csr_mie = _reg_mie_T & io_in_w_csr_en ? io_in_csr_data : reg_mie; // @[regsfile.scala 149:31]
  always @(posedge clock) begin
    if (reset) begin // @[regsfile.scala 66:34]
      reg_mstatus <= 64'h0; // @[regsfile.scala 66:34]
    end else if (io_in_is_exception) begin // @[regsfile.scala 83:33]
      reg_mstatus <= _reg_mstatus_T_3; // @[regsfile.scala 87:29]
    end else if (irq) begin // @[regsfile.scala 88:24]
      reg_mstatus <= _reg_mstatus_T_3; // @[regsfile.scala 92:29]
    end else if (io_in_w_csr_en) begin // @[regsfile.scala 94:37]
      reg_mstatus <= _reg_mstatus_T_9; // @[regsfile.scala 98:37]
    end
    if (reset) begin // @[regsfile.scala 67:34]
      reg_mie <= 64'h0; // @[regsfile.scala 67:34]
    end else if (io_in_w_csr_en) begin // @[regsfile.scala 102:29]
      if (~irq & ~io_in_is_exception) begin // @[regsfile.scala 103:49]
        if (io_in_csr_addr == 12'h304) begin // @[regsfile.scala 104:47]
          reg_mie <= io_in_csr_data;
        end
      end
    end
    if (reset) begin // @[regsfile.scala 68:34]
      reg_mtvec <= 64'h0; // @[regsfile.scala 68:34]
    end else if (io_in_w_csr_en) begin // @[regsfile.scala 102:29]
      if (~irq & ~io_in_is_exception) begin // @[regsfile.scala 103:49]
        if (io_in_csr_addr == 12'h305) begin // @[regsfile.scala 105:47]
          reg_mtvec <= io_in_csr_data;
        end
      end
    end
    if (reset) begin // @[regsfile.scala 69:35]
      reg_mscratch <= 64'h0; // @[regsfile.scala 69:35]
    end else if (io_in_w_csr_en) begin // @[regsfile.scala 102:29]
      if (~irq & ~io_in_is_exception) begin // @[regsfile.scala 103:49]
        if (io_in_csr_addr == 12'h340) begin // @[regsfile.scala 106:47]
          reg_mscratch <= io_in_csr_data;
        end
      end
    end
    if (reset) begin // @[regsfile.scala 70:34]
      reg_mepc <= 64'h0; // @[regsfile.scala 70:34]
    end else if (io_in_is_exception) begin // @[regsfile.scala 83:33]
      reg_mepc <= io_in_pc; // @[regsfile.scala 84:33]
    end else if (irq) begin // @[regsfile.scala 88:24]
      if (io_in_is_exception) begin // @[regsfile.scala 89:39]
        reg_mepc <= io_in_pc;
      end else begin
        reg_mepc <= io_in_next_pc;
      end
    end else if (io_in_w_csr_en) begin // @[regsfile.scala 94:37]
      reg_mepc <= _reg_mepc_T_2; // @[regsfile.scala 95:41]
    end
    if (reset) begin // @[regsfile.scala 71:34]
      reg_mcause <= 64'h0; // @[regsfile.scala 71:34]
    end else if (io_in_is_exception) begin // @[regsfile.scala 83:33]
      reg_mcause <= {{59'd0}, io_in_exception}; // @[regsfile.scala 85:33]
    end else if (irq) begin // @[regsfile.scala 88:24]
      reg_mcause <= _reg_mcause_T_1; // @[regsfile.scala 90:33]
    end else if (io_in_w_csr_en) begin // @[regsfile.scala 94:37]
      reg_mcause <= _reg_mcause_T_3; // @[regsfile.scala 96:41]
    end
    if (reset) begin // @[regsfile.scala 72:34]
      reg_mtval <= 64'h0; // @[regsfile.scala 72:34]
    end else if (io_in_is_exception) begin // @[regsfile.scala 83:33]
      reg_mtval <= 64'h0; // @[regsfile.scala 86:33]
    end else if (irq) begin // @[regsfile.scala 88:24]
      reg_mtval <= 64'h0; // @[regsfile.scala 91:33]
    end else if (io_in_w_csr_en) begin // @[regsfile.scala 94:37]
      reg_mtval <= _reg_mtval_T_1; // @[regsfile.scala 97:41]
    end
    if (reset) begin // @[regsfile.scala 74:34]
      reg_mcycle <= 64'h0; // @[regsfile.scala 74:34]
    end else if (io_in_w_csr_en) begin // @[regsfile.scala 114:29]
      if (io_in_csr_addr == 12'hb00) begin // @[regsfile.scala 115:47]
        reg_mcycle <= io_in_csr_data;
      end else begin
        reg_mcycle <= _reg_mcycle_T_2;
      end
    end else begin
      reg_mcycle <= _reg_mcycle_T_2; // @[regsfile.scala 118:41]
    end
    if (reset) begin // @[regsfile.scala 75:35]
      reg_minstret <= 64'h0; // @[regsfile.scala 75:35]
    end else if (io_in_w_csr_en) begin // @[regsfile.scala 114:29]
      if (io_in_csr_addr == 12'hb02) begin // @[regsfile.scala 116:39]
        reg_minstret <= io_in_csr_data;
      end else begin
        reg_minstret <= _reg_minstret_T_3;
      end
    end else begin
      reg_minstret <= _reg_minstret_T_3; // @[regsfile.scala 119:33]
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
  reg_mstatus = _RAND_0[63:0];
  _RAND_1 = {2{`RANDOM}};
  reg_mie = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  reg_mtvec = _RAND_2[63:0];
  _RAND_3 = {2{`RANDOM}};
  reg_mscratch = _RAND_3[63:0];
  _RAND_4 = {2{`RANDOM}};
  reg_mepc = _RAND_4[63:0];
  _RAND_5 = {2{`RANDOM}};
  reg_mcause = _RAND_5[63:0];
  _RAND_6 = {2{`RANDOM}};
  reg_mtval = _RAND_6[63:0];
  _RAND_7 = {2{`RANDOM}};
  reg_mcycle = _RAND_7[63:0];
  _RAND_8 = {2{`RANDOM}};
  reg_minstret = _RAND_8[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_040318_Commit(
  input         clock,
  input         reset,
  input  [4:0]  io_normal_rd_rs1_addr,
  output [63:0] io_normal_rd_rs1_data,
  input  [4:0]  io_normal_rd_rs2_addr,
  output [63:0] io_normal_rd_rs2_data,
  input         io_normal_wb_valid,
  input  [4:0]  io_normal_wb_dest_addr,
  input  [63:0] io_normal_wb_dest_data,
  input  [11:0] io_csr_rd_csr_addr,
  output [63:0] io_csr_rd_csr_data,
  input         io_csr_wb_valid,
  input  [11:0] io_csr_wb_csr_addr,
  input  [63:0] io_csr_wb_csr_data,
  input         io_csr_except_is_except,
  input         io_csr_except_is_time_irq,
  input         io_csr_except_is_soft_irq,
  input  [4:0]  io_csr_except_exception,
  input  [63:0] io_csr_except_next_pc,
  input  [63:0] io_csr_except_pc,
  output [63:0] io_csr_pass_csr_mtvec,
  output [63:0] io_csr_pass_csr_mepc,
  output [63:0] io_csr_pass_csr_mstatus,
  output [63:0] io_csr_pass_csr_mie,
  input         io_commit
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
  wire  csr_reg_clock; // @[commit.scala 35:29]
  wire  csr_reg_reset; // @[commit.scala 35:29]
  wire [11:0] csr_reg_io_in_csr_addr; // @[commit.scala 35:29]
  wire [63:0] csr_reg_io_in_csr_data; // @[commit.scala 35:29]
  wire  csr_reg_io_in_w_csr_en; // @[commit.scala 35:29]
  wire [63:0] csr_reg_io_in_pc; // @[commit.scala 35:29]
  wire [63:0] csr_reg_io_in_next_pc; // @[commit.scala 35:29]
  wire  csr_reg_io_in_time_irq; // @[commit.scala 35:29]
  wire  csr_reg_io_in_soft_irq; // @[commit.scala 35:29]
  wire [4:0] csr_reg_io_in_exception; // @[commit.scala 35:29]
  wire  csr_reg_io_in_is_exception; // @[commit.scala 35:29]
  wire  csr_reg_io_in_commit; // @[commit.scala 35:29]
  wire [11:0] csr_reg_io_r_csr_raddr; // @[commit.scala 35:29]
  wire [63:0] csr_reg_io_r_csr_rdata; // @[commit.scala 35:29]
  wire [63:0] csr_reg_io_r_csr_mtvec; // @[commit.scala 35:29]
  wire [63:0] csr_reg_io_r_csr_mepc; // @[commit.scala 35:29]
  wire [63:0] csr_reg_io_r_csr_mstatus; // @[commit.scala 35:29]
  wire [63:0] csr_reg_io_r_csr_mie; // @[commit.scala 35:29]
  reg [63:0] reg_file_0; // @[commit.scala 36:31]
  reg [63:0] reg_file_1; // @[commit.scala 36:31]
  reg [63:0] reg_file_2; // @[commit.scala 36:31]
  reg [63:0] reg_file_3; // @[commit.scala 36:31]
  reg [63:0] reg_file_4; // @[commit.scala 36:31]
  reg [63:0] reg_file_5; // @[commit.scala 36:31]
  reg [63:0] reg_file_6; // @[commit.scala 36:31]
  reg [63:0] reg_file_7; // @[commit.scala 36:31]
  reg [63:0] reg_file_8; // @[commit.scala 36:31]
  reg [63:0] reg_file_9; // @[commit.scala 36:31]
  reg [63:0] reg_file_10; // @[commit.scala 36:31]
  reg [63:0] reg_file_11; // @[commit.scala 36:31]
  reg [63:0] reg_file_12; // @[commit.scala 36:31]
  reg [63:0] reg_file_13; // @[commit.scala 36:31]
  reg [63:0] reg_file_14; // @[commit.scala 36:31]
  reg [63:0] reg_file_15; // @[commit.scala 36:31]
  reg [63:0] reg_file_16; // @[commit.scala 36:31]
  reg [63:0] reg_file_17; // @[commit.scala 36:31]
  reg [63:0] reg_file_18; // @[commit.scala 36:31]
  reg [63:0] reg_file_19; // @[commit.scala 36:31]
  reg [63:0] reg_file_20; // @[commit.scala 36:31]
  reg [63:0] reg_file_21; // @[commit.scala 36:31]
  reg [63:0] reg_file_22; // @[commit.scala 36:31]
  reg [63:0] reg_file_23; // @[commit.scala 36:31]
  reg [63:0] reg_file_24; // @[commit.scala 36:31]
  reg [63:0] reg_file_25; // @[commit.scala 36:31]
  reg [63:0] reg_file_26; // @[commit.scala 36:31]
  reg [63:0] reg_file_27; // @[commit.scala 36:31]
  reg [63:0] reg_file_28; // @[commit.scala 36:31]
  reg [63:0] reg_file_29; // @[commit.scala 36:31]
  reg [63:0] reg_file_30; // @[commit.scala 36:31]
  reg [63:0] reg_file_31; // @[commit.scala 36:31]
  wire [63:0] _GEN_1 = 5'h1 == io_normal_rd_rs1_addr ? reg_file_1 : reg_file_0; // @[commit.scala 43:{30,30}]
  wire [63:0] _GEN_2 = 5'h2 == io_normal_rd_rs1_addr ? reg_file_2 : _GEN_1; // @[commit.scala 43:{30,30}]
  wire [63:0] _GEN_3 = 5'h3 == io_normal_rd_rs1_addr ? reg_file_3 : _GEN_2; // @[commit.scala 43:{30,30}]
  wire [63:0] _GEN_4 = 5'h4 == io_normal_rd_rs1_addr ? reg_file_4 : _GEN_3; // @[commit.scala 43:{30,30}]
  wire [63:0] _GEN_5 = 5'h5 == io_normal_rd_rs1_addr ? reg_file_5 : _GEN_4; // @[commit.scala 43:{30,30}]
  wire [63:0] _GEN_6 = 5'h6 == io_normal_rd_rs1_addr ? reg_file_6 : _GEN_5; // @[commit.scala 43:{30,30}]
  wire [63:0] _GEN_7 = 5'h7 == io_normal_rd_rs1_addr ? reg_file_7 : _GEN_6; // @[commit.scala 43:{30,30}]
  wire [63:0] _GEN_8 = 5'h8 == io_normal_rd_rs1_addr ? reg_file_8 : _GEN_7; // @[commit.scala 43:{30,30}]
  wire [63:0] _GEN_9 = 5'h9 == io_normal_rd_rs1_addr ? reg_file_9 : _GEN_8; // @[commit.scala 43:{30,30}]
  wire [63:0] _GEN_10 = 5'ha == io_normal_rd_rs1_addr ? reg_file_10 : _GEN_9; // @[commit.scala 43:{30,30}]
  wire [63:0] _GEN_11 = 5'hb == io_normal_rd_rs1_addr ? reg_file_11 : _GEN_10; // @[commit.scala 43:{30,30}]
  wire [63:0] _GEN_12 = 5'hc == io_normal_rd_rs1_addr ? reg_file_12 : _GEN_11; // @[commit.scala 43:{30,30}]
  wire [63:0] _GEN_13 = 5'hd == io_normal_rd_rs1_addr ? reg_file_13 : _GEN_12; // @[commit.scala 43:{30,30}]
  wire [63:0] _GEN_14 = 5'he == io_normal_rd_rs1_addr ? reg_file_14 : _GEN_13; // @[commit.scala 43:{30,30}]
  wire [63:0] _GEN_15 = 5'hf == io_normal_rd_rs1_addr ? reg_file_15 : _GEN_14; // @[commit.scala 43:{30,30}]
  wire [63:0] _GEN_16 = 5'h10 == io_normal_rd_rs1_addr ? reg_file_16 : _GEN_15; // @[commit.scala 43:{30,30}]
  wire [63:0] _GEN_17 = 5'h11 == io_normal_rd_rs1_addr ? reg_file_17 : _GEN_16; // @[commit.scala 43:{30,30}]
  wire [63:0] _GEN_18 = 5'h12 == io_normal_rd_rs1_addr ? reg_file_18 : _GEN_17; // @[commit.scala 43:{30,30}]
  wire [63:0] _GEN_19 = 5'h13 == io_normal_rd_rs1_addr ? reg_file_19 : _GEN_18; // @[commit.scala 43:{30,30}]
  wire [63:0] _GEN_20 = 5'h14 == io_normal_rd_rs1_addr ? reg_file_20 : _GEN_19; // @[commit.scala 43:{30,30}]
  wire [63:0] _GEN_21 = 5'h15 == io_normal_rd_rs1_addr ? reg_file_21 : _GEN_20; // @[commit.scala 43:{30,30}]
  wire [63:0] _GEN_22 = 5'h16 == io_normal_rd_rs1_addr ? reg_file_22 : _GEN_21; // @[commit.scala 43:{30,30}]
  wire [63:0] _GEN_23 = 5'h17 == io_normal_rd_rs1_addr ? reg_file_23 : _GEN_22; // @[commit.scala 43:{30,30}]
  wire [63:0] _GEN_24 = 5'h18 == io_normal_rd_rs1_addr ? reg_file_24 : _GEN_23; // @[commit.scala 43:{30,30}]
  wire [63:0] _GEN_25 = 5'h19 == io_normal_rd_rs1_addr ? reg_file_25 : _GEN_24; // @[commit.scala 43:{30,30}]
  wire [63:0] _GEN_26 = 5'h1a == io_normal_rd_rs1_addr ? reg_file_26 : _GEN_25; // @[commit.scala 43:{30,30}]
  wire [63:0] _GEN_27 = 5'h1b == io_normal_rd_rs1_addr ? reg_file_27 : _GEN_26; // @[commit.scala 43:{30,30}]
  wire [63:0] _GEN_28 = 5'h1c == io_normal_rd_rs1_addr ? reg_file_28 : _GEN_27; // @[commit.scala 43:{30,30}]
  wire [63:0] _GEN_29 = 5'h1d == io_normal_rd_rs1_addr ? reg_file_29 : _GEN_28; // @[commit.scala 43:{30,30}]
  wire [63:0] _GEN_30 = 5'h1e == io_normal_rd_rs1_addr ? reg_file_30 : _GEN_29; // @[commit.scala 43:{30,30}]
  wire [63:0] _GEN_31 = 5'h1f == io_normal_rd_rs1_addr ? reg_file_31 : _GEN_30; // @[commit.scala 43:{30,30}]
  wire [63:0] _GEN_33 = 5'h1 == io_normal_rd_rs2_addr ? reg_file_1 : reg_file_0; // @[commit.scala 44:{30,30}]
  wire [63:0] _GEN_34 = 5'h2 == io_normal_rd_rs2_addr ? reg_file_2 : _GEN_33; // @[commit.scala 44:{30,30}]
  wire [63:0] _GEN_35 = 5'h3 == io_normal_rd_rs2_addr ? reg_file_3 : _GEN_34; // @[commit.scala 44:{30,30}]
  wire [63:0] _GEN_36 = 5'h4 == io_normal_rd_rs2_addr ? reg_file_4 : _GEN_35; // @[commit.scala 44:{30,30}]
  wire [63:0] _GEN_37 = 5'h5 == io_normal_rd_rs2_addr ? reg_file_5 : _GEN_36; // @[commit.scala 44:{30,30}]
  wire [63:0] _GEN_38 = 5'h6 == io_normal_rd_rs2_addr ? reg_file_6 : _GEN_37; // @[commit.scala 44:{30,30}]
  wire [63:0] _GEN_39 = 5'h7 == io_normal_rd_rs2_addr ? reg_file_7 : _GEN_38; // @[commit.scala 44:{30,30}]
  wire [63:0] _GEN_40 = 5'h8 == io_normal_rd_rs2_addr ? reg_file_8 : _GEN_39; // @[commit.scala 44:{30,30}]
  wire [63:0] _GEN_41 = 5'h9 == io_normal_rd_rs2_addr ? reg_file_9 : _GEN_40; // @[commit.scala 44:{30,30}]
  wire [63:0] _GEN_42 = 5'ha == io_normal_rd_rs2_addr ? reg_file_10 : _GEN_41; // @[commit.scala 44:{30,30}]
  wire [63:0] _GEN_43 = 5'hb == io_normal_rd_rs2_addr ? reg_file_11 : _GEN_42; // @[commit.scala 44:{30,30}]
  wire [63:0] _GEN_44 = 5'hc == io_normal_rd_rs2_addr ? reg_file_12 : _GEN_43; // @[commit.scala 44:{30,30}]
  wire [63:0] _GEN_45 = 5'hd == io_normal_rd_rs2_addr ? reg_file_13 : _GEN_44; // @[commit.scala 44:{30,30}]
  wire [63:0] _GEN_46 = 5'he == io_normal_rd_rs2_addr ? reg_file_14 : _GEN_45; // @[commit.scala 44:{30,30}]
  wire [63:0] _GEN_47 = 5'hf == io_normal_rd_rs2_addr ? reg_file_15 : _GEN_46; // @[commit.scala 44:{30,30}]
  wire [63:0] _GEN_48 = 5'h10 == io_normal_rd_rs2_addr ? reg_file_16 : _GEN_47; // @[commit.scala 44:{30,30}]
  wire [63:0] _GEN_49 = 5'h11 == io_normal_rd_rs2_addr ? reg_file_17 : _GEN_48; // @[commit.scala 44:{30,30}]
  wire [63:0] _GEN_50 = 5'h12 == io_normal_rd_rs2_addr ? reg_file_18 : _GEN_49; // @[commit.scala 44:{30,30}]
  wire [63:0] _GEN_51 = 5'h13 == io_normal_rd_rs2_addr ? reg_file_19 : _GEN_50; // @[commit.scala 44:{30,30}]
  wire [63:0] _GEN_52 = 5'h14 == io_normal_rd_rs2_addr ? reg_file_20 : _GEN_51; // @[commit.scala 44:{30,30}]
  wire [63:0] _GEN_53 = 5'h15 == io_normal_rd_rs2_addr ? reg_file_21 : _GEN_52; // @[commit.scala 44:{30,30}]
  wire [63:0] _GEN_54 = 5'h16 == io_normal_rd_rs2_addr ? reg_file_22 : _GEN_53; // @[commit.scala 44:{30,30}]
  wire [63:0] _GEN_55 = 5'h17 == io_normal_rd_rs2_addr ? reg_file_23 : _GEN_54; // @[commit.scala 44:{30,30}]
  wire [63:0] _GEN_56 = 5'h18 == io_normal_rd_rs2_addr ? reg_file_24 : _GEN_55; // @[commit.scala 44:{30,30}]
  wire [63:0] _GEN_57 = 5'h19 == io_normal_rd_rs2_addr ? reg_file_25 : _GEN_56; // @[commit.scala 44:{30,30}]
  wire [63:0] _GEN_58 = 5'h1a == io_normal_rd_rs2_addr ? reg_file_26 : _GEN_57; // @[commit.scala 44:{30,30}]
  wire [63:0] _GEN_59 = 5'h1b == io_normal_rd_rs2_addr ? reg_file_27 : _GEN_58; // @[commit.scala 44:{30,30}]
  wire [63:0] _GEN_60 = 5'h1c == io_normal_rd_rs2_addr ? reg_file_28 : _GEN_59; // @[commit.scala 44:{30,30}]
  wire [63:0] _GEN_61 = 5'h1d == io_normal_rd_rs2_addr ? reg_file_29 : _GEN_60; // @[commit.scala 44:{30,30}]
  wire [63:0] _GEN_62 = 5'h1e == io_normal_rd_rs2_addr ? reg_file_30 : _GEN_61; // @[commit.scala 44:{30,30}]
  wire [63:0] _GEN_63 = 5'h1f == io_normal_rd_rs2_addr ? reg_file_31 : _GEN_62; // @[commit.scala 44:{30,30}]
  ysyx_040318_CsrRegCtrl csr_reg ( // @[commit.scala 35:29]
    .clock(csr_reg_clock),
    .reset(csr_reg_reset),
    .io_in_csr_addr(csr_reg_io_in_csr_addr),
    .io_in_csr_data(csr_reg_io_in_csr_data),
    .io_in_w_csr_en(csr_reg_io_in_w_csr_en),
    .io_in_pc(csr_reg_io_in_pc),
    .io_in_next_pc(csr_reg_io_in_next_pc),
    .io_in_time_irq(csr_reg_io_in_time_irq),
    .io_in_soft_irq(csr_reg_io_in_soft_irq),
    .io_in_exception(csr_reg_io_in_exception),
    .io_in_is_exception(csr_reg_io_in_is_exception),
    .io_in_commit(csr_reg_io_in_commit),
    .io_r_csr_raddr(csr_reg_io_r_csr_raddr),
    .io_r_csr_rdata(csr_reg_io_r_csr_rdata),
    .io_r_csr_mtvec(csr_reg_io_r_csr_mtvec),
    .io_r_csr_mepc(csr_reg_io_r_csr_mepc),
    .io_r_csr_mstatus(csr_reg_io_r_csr_mstatus),
    .io_r_csr_mie(csr_reg_io_r_csr_mie)
  );
  assign io_normal_rd_rs1_data = io_normal_wb_dest_addr == io_normal_rd_rs1_addr & io_normal_wb_valid ?
    io_normal_wb_dest_data : _GEN_31; // @[commit.scala 43:30]
  assign io_normal_rd_rs2_data = io_normal_wb_dest_addr == io_normal_rd_rs2_addr & io_normal_wb_valid ?
    io_normal_wb_dest_data : _GEN_63; // @[commit.scala 44:30]
  assign io_csr_rd_csr_data = csr_reg_io_r_csr_rdata; // @[commit.scala 66:49]
  assign io_csr_pass_csr_mtvec = csr_reg_io_r_csr_mtvec; // @[commit.scala 67:41]
  assign io_csr_pass_csr_mepc = csr_reg_io_r_csr_mepc; // @[commit.scala 68:41]
  assign io_csr_pass_csr_mstatus = csr_reg_io_r_csr_mstatus; // @[commit.scala 69:41]
  assign io_csr_pass_csr_mie = csr_reg_io_r_csr_mie; // @[commit.scala 70:49]
  assign csr_reg_clock = clock;
  assign csr_reg_reset = reset;
  assign csr_reg_io_in_csr_addr = io_csr_wb_csr_addr; // @[commit.scala 52:33]
  assign csr_reg_io_in_csr_data = io_csr_wb_csr_data; // @[commit.scala 53:33]
  assign csr_reg_io_in_w_csr_en = io_csr_wb_valid; // @[commit.scala 54:33]
  assign csr_reg_io_in_pc = io_csr_except_pc; // @[commit.scala 55:41]
  assign csr_reg_io_in_next_pc = io_csr_except_next_pc; // @[commit.scala 56:33]
  assign csr_reg_io_in_time_irq = io_csr_except_is_time_irq; // @[commit.scala 58:33]
  assign csr_reg_io_in_soft_irq = io_csr_except_is_soft_irq; // @[commit.scala 59:33]
  assign csr_reg_io_in_exception = io_csr_except_exception; // @[commit.scala 61:33]
  assign csr_reg_io_in_is_exception = io_csr_except_is_except; // @[commit.scala 62:41]
  assign csr_reg_io_in_commit = io_commit; // @[commit.scala 63:33]
  assign csr_reg_io_r_csr_raddr = io_csr_rd_csr_addr; // @[commit.scala 65:41]
  always @(posedge clock) begin
    if (reset) begin // @[commit.scala 36:31]
      reg_file_0 <= 64'h0; // @[commit.scala 36:31]
    end else if (io_normal_wb_valid) begin // @[commit.scala 45:29]
      if (5'h0 == io_normal_wb_dest_addr) begin // @[commit.scala 46:42]
        reg_file_0 <= io_normal_wb_dest_data; // @[commit.scala 46:42]
      end
    end
    if (reset) begin // @[commit.scala 36:31]
      reg_file_1 <= 64'h0; // @[commit.scala 36:31]
    end else if (io_normal_wb_valid) begin // @[commit.scala 45:29]
      if (5'h1 == io_normal_wb_dest_addr) begin // @[commit.scala 46:42]
        reg_file_1 <= io_normal_wb_dest_data; // @[commit.scala 46:42]
      end
    end
    if (reset) begin // @[commit.scala 36:31]
      reg_file_2 <= 64'h0; // @[commit.scala 36:31]
    end else if (io_normal_wb_valid) begin // @[commit.scala 45:29]
      if (5'h2 == io_normal_wb_dest_addr) begin // @[commit.scala 46:42]
        reg_file_2 <= io_normal_wb_dest_data; // @[commit.scala 46:42]
      end
    end
    if (reset) begin // @[commit.scala 36:31]
      reg_file_3 <= 64'h0; // @[commit.scala 36:31]
    end else if (io_normal_wb_valid) begin // @[commit.scala 45:29]
      if (5'h3 == io_normal_wb_dest_addr) begin // @[commit.scala 46:42]
        reg_file_3 <= io_normal_wb_dest_data; // @[commit.scala 46:42]
      end
    end
    if (reset) begin // @[commit.scala 36:31]
      reg_file_4 <= 64'h0; // @[commit.scala 36:31]
    end else if (io_normal_wb_valid) begin // @[commit.scala 45:29]
      if (5'h4 == io_normal_wb_dest_addr) begin // @[commit.scala 46:42]
        reg_file_4 <= io_normal_wb_dest_data; // @[commit.scala 46:42]
      end
    end
    if (reset) begin // @[commit.scala 36:31]
      reg_file_5 <= 64'h0; // @[commit.scala 36:31]
    end else if (io_normal_wb_valid) begin // @[commit.scala 45:29]
      if (5'h5 == io_normal_wb_dest_addr) begin // @[commit.scala 46:42]
        reg_file_5 <= io_normal_wb_dest_data; // @[commit.scala 46:42]
      end
    end
    if (reset) begin // @[commit.scala 36:31]
      reg_file_6 <= 64'h0; // @[commit.scala 36:31]
    end else if (io_normal_wb_valid) begin // @[commit.scala 45:29]
      if (5'h6 == io_normal_wb_dest_addr) begin // @[commit.scala 46:42]
        reg_file_6 <= io_normal_wb_dest_data; // @[commit.scala 46:42]
      end
    end
    if (reset) begin // @[commit.scala 36:31]
      reg_file_7 <= 64'h0; // @[commit.scala 36:31]
    end else if (io_normal_wb_valid) begin // @[commit.scala 45:29]
      if (5'h7 == io_normal_wb_dest_addr) begin // @[commit.scala 46:42]
        reg_file_7 <= io_normal_wb_dest_data; // @[commit.scala 46:42]
      end
    end
    if (reset) begin // @[commit.scala 36:31]
      reg_file_8 <= 64'h0; // @[commit.scala 36:31]
    end else if (io_normal_wb_valid) begin // @[commit.scala 45:29]
      if (5'h8 == io_normal_wb_dest_addr) begin // @[commit.scala 46:42]
        reg_file_8 <= io_normal_wb_dest_data; // @[commit.scala 46:42]
      end
    end
    if (reset) begin // @[commit.scala 36:31]
      reg_file_9 <= 64'h0; // @[commit.scala 36:31]
    end else if (io_normal_wb_valid) begin // @[commit.scala 45:29]
      if (5'h9 == io_normal_wb_dest_addr) begin // @[commit.scala 46:42]
        reg_file_9 <= io_normal_wb_dest_data; // @[commit.scala 46:42]
      end
    end
    if (reset) begin // @[commit.scala 36:31]
      reg_file_10 <= 64'h0; // @[commit.scala 36:31]
    end else if (io_normal_wb_valid) begin // @[commit.scala 45:29]
      if (5'ha == io_normal_wb_dest_addr) begin // @[commit.scala 46:42]
        reg_file_10 <= io_normal_wb_dest_data; // @[commit.scala 46:42]
      end
    end
    if (reset) begin // @[commit.scala 36:31]
      reg_file_11 <= 64'h0; // @[commit.scala 36:31]
    end else if (io_normal_wb_valid) begin // @[commit.scala 45:29]
      if (5'hb == io_normal_wb_dest_addr) begin // @[commit.scala 46:42]
        reg_file_11 <= io_normal_wb_dest_data; // @[commit.scala 46:42]
      end
    end
    if (reset) begin // @[commit.scala 36:31]
      reg_file_12 <= 64'h0; // @[commit.scala 36:31]
    end else if (io_normal_wb_valid) begin // @[commit.scala 45:29]
      if (5'hc == io_normal_wb_dest_addr) begin // @[commit.scala 46:42]
        reg_file_12 <= io_normal_wb_dest_data; // @[commit.scala 46:42]
      end
    end
    if (reset) begin // @[commit.scala 36:31]
      reg_file_13 <= 64'h0; // @[commit.scala 36:31]
    end else if (io_normal_wb_valid) begin // @[commit.scala 45:29]
      if (5'hd == io_normal_wb_dest_addr) begin // @[commit.scala 46:42]
        reg_file_13 <= io_normal_wb_dest_data; // @[commit.scala 46:42]
      end
    end
    if (reset) begin // @[commit.scala 36:31]
      reg_file_14 <= 64'h0; // @[commit.scala 36:31]
    end else if (io_normal_wb_valid) begin // @[commit.scala 45:29]
      if (5'he == io_normal_wb_dest_addr) begin // @[commit.scala 46:42]
        reg_file_14 <= io_normal_wb_dest_data; // @[commit.scala 46:42]
      end
    end
    if (reset) begin // @[commit.scala 36:31]
      reg_file_15 <= 64'h0; // @[commit.scala 36:31]
    end else if (io_normal_wb_valid) begin // @[commit.scala 45:29]
      if (5'hf == io_normal_wb_dest_addr) begin // @[commit.scala 46:42]
        reg_file_15 <= io_normal_wb_dest_data; // @[commit.scala 46:42]
      end
    end
    if (reset) begin // @[commit.scala 36:31]
      reg_file_16 <= 64'h0; // @[commit.scala 36:31]
    end else if (io_normal_wb_valid) begin // @[commit.scala 45:29]
      if (5'h10 == io_normal_wb_dest_addr) begin // @[commit.scala 46:42]
        reg_file_16 <= io_normal_wb_dest_data; // @[commit.scala 46:42]
      end
    end
    if (reset) begin // @[commit.scala 36:31]
      reg_file_17 <= 64'h0; // @[commit.scala 36:31]
    end else if (io_normal_wb_valid) begin // @[commit.scala 45:29]
      if (5'h11 == io_normal_wb_dest_addr) begin // @[commit.scala 46:42]
        reg_file_17 <= io_normal_wb_dest_data; // @[commit.scala 46:42]
      end
    end
    if (reset) begin // @[commit.scala 36:31]
      reg_file_18 <= 64'h0; // @[commit.scala 36:31]
    end else if (io_normal_wb_valid) begin // @[commit.scala 45:29]
      if (5'h12 == io_normal_wb_dest_addr) begin // @[commit.scala 46:42]
        reg_file_18 <= io_normal_wb_dest_data; // @[commit.scala 46:42]
      end
    end
    if (reset) begin // @[commit.scala 36:31]
      reg_file_19 <= 64'h0; // @[commit.scala 36:31]
    end else if (io_normal_wb_valid) begin // @[commit.scala 45:29]
      if (5'h13 == io_normal_wb_dest_addr) begin // @[commit.scala 46:42]
        reg_file_19 <= io_normal_wb_dest_data; // @[commit.scala 46:42]
      end
    end
    if (reset) begin // @[commit.scala 36:31]
      reg_file_20 <= 64'h0; // @[commit.scala 36:31]
    end else if (io_normal_wb_valid) begin // @[commit.scala 45:29]
      if (5'h14 == io_normal_wb_dest_addr) begin // @[commit.scala 46:42]
        reg_file_20 <= io_normal_wb_dest_data; // @[commit.scala 46:42]
      end
    end
    if (reset) begin // @[commit.scala 36:31]
      reg_file_21 <= 64'h0; // @[commit.scala 36:31]
    end else if (io_normal_wb_valid) begin // @[commit.scala 45:29]
      if (5'h15 == io_normal_wb_dest_addr) begin // @[commit.scala 46:42]
        reg_file_21 <= io_normal_wb_dest_data; // @[commit.scala 46:42]
      end
    end
    if (reset) begin // @[commit.scala 36:31]
      reg_file_22 <= 64'h0; // @[commit.scala 36:31]
    end else if (io_normal_wb_valid) begin // @[commit.scala 45:29]
      if (5'h16 == io_normal_wb_dest_addr) begin // @[commit.scala 46:42]
        reg_file_22 <= io_normal_wb_dest_data; // @[commit.scala 46:42]
      end
    end
    if (reset) begin // @[commit.scala 36:31]
      reg_file_23 <= 64'h0; // @[commit.scala 36:31]
    end else if (io_normal_wb_valid) begin // @[commit.scala 45:29]
      if (5'h17 == io_normal_wb_dest_addr) begin // @[commit.scala 46:42]
        reg_file_23 <= io_normal_wb_dest_data; // @[commit.scala 46:42]
      end
    end
    if (reset) begin // @[commit.scala 36:31]
      reg_file_24 <= 64'h0; // @[commit.scala 36:31]
    end else if (io_normal_wb_valid) begin // @[commit.scala 45:29]
      if (5'h18 == io_normal_wb_dest_addr) begin // @[commit.scala 46:42]
        reg_file_24 <= io_normal_wb_dest_data; // @[commit.scala 46:42]
      end
    end
    if (reset) begin // @[commit.scala 36:31]
      reg_file_25 <= 64'h0; // @[commit.scala 36:31]
    end else if (io_normal_wb_valid) begin // @[commit.scala 45:29]
      if (5'h19 == io_normal_wb_dest_addr) begin // @[commit.scala 46:42]
        reg_file_25 <= io_normal_wb_dest_data; // @[commit.scala 46:42]
      end
    end
    if (reset) begin // @[commit.scala 36:31]
      reg_file_26 <= 64'h0; // @[commit.scala 36:31]
    end else if (io_normal_wb_valid) begin // @[commit.scala 45:29]
      if (5'h1a == io_normal_wb_dest_addr) begin // @[commit.scala 46:42]
        reg_file_26 <= io_normal_wb_dest_data; // @[commit.scala 46:42]
      end
    end
    if (reset) begin // @[commit.scala 36:31]
      reg_file_27 <= 64'h0; // @[commit.scala 36:31]
    end else if (io_normal_wb_valid) begin // @[commit.scala 45:29]
      if (5'h1b == io_normal_wb_dest_addr) begin // @[commit.scala 46:42]
        reg_file_27 <= io_normal_wb_dest_data; // @[commit.scala 46:42]
      end
    end
    if (reset) begin // @[commit.scala 36:31]
      reg_file_28 <= 64'h0; // @[commit.scala 36:31]
    end else if (io_normal_wb_valid) begin // @[commit.scala 45:29]
      if (5'h1c == io_normal_wb_dest_addr) begin // @[commit.scala 46:42]
        reg_file_28 <= io_normal_wb_dest_data; // @[commit.scala 46:42]
      end
    end
    if (reset) begin // @[commit.scala 36:31]
      reg_file_29 <= 64'h0; // @[commit.scala 36:31]
    end else if (io_normal_wb_valid) begin // @[commit.scala 45:29]
      if (5'h1d == io_normal_wb_dest_addr) begin // @[commit.scala 46:42]
        reg_file_29 <= io_normal_wb_dest_data; // @[commit.scala 46:42]
      end
    end
    if (reset) begin // @[commit.scala 36:31]
      reg_file_30 <= 64'h0; // @[commit.scala 36:31]
    end else if (io_normal_wb_valid) begin // @[commit.scala 45:29]
      if (5'h1e == io_normal_wb_dest_addr) begin // @[commit.scala 46:42]
        reg_file_30 <= io_normal_wb_dest_data; // @[commit.scala 46:42]
      end
    end
    if (reset) begin // @[commit.scala 36:31]
      reg_file_31 <= 64'h0; // @[commit.scala 36:31]
    end else if (io_normal_wb_valid) begin // @[commit.scala 45:29]
      if (5'h1f == io_normal_wb_dest_addr) begin // @[commit.scala 46:42]
        reg_file_31 <= io_normal_wb_dest_data; // @[commit.scala 46:42]
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
  reg_file_0 = _RAND_0[63:0];
  _RAND_1 = {2{`RANDOM}};
  reg_file_1 = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  reg_file_2 = _RAND_2[63:0];
  _RAND_3 = {2{`RANDOM}};
  reg_file_3 = _RAND_3[63:0];
  _RAND_4 = {2{`RANDOM}};
  reg_file_4 = _RAND_4[63:0];
  _RAND_5 = {2{`RANDOM}};
  reg_file_5 = _RAND_5[63:0];
  _RAND_6 = {2{`RANDOM}};
  reg_file_6 = _RAND_6[63:0];
  _RAND_7 = {2{`RANDOM}};
  reg_file_7 = _RAND_7[63:0];
  _RAND_8 = {2{`RANDOM}};
  reg_file_8 = _RAND_8[63:0];
  _RAND_9 = {2{`RANDOM}};
  reg_file_9 = _RAND_9[63:0];
  _RAND_10 = {2{`RANDOM}};
  reg_file_10 = _RAND_10[63:0];
  _RAND_11 = {2{`RANDOM}};
  reg_file_11 = _RAND_11[63:0];
  _RAND_12 = {2{`RANDOM}};
  reg_file_12 = _RAND_12[63:0];
  _RAND_13 = {2{`RANDOM}};
  reg_file_13 = _RAND_13[63:0];
  _RAND_14 = {2{`RANDOM}};
  reg_file_14 = _RAND_14[63:0];
  _RAND_15 = {2{`RANDOM}};
  reg_file_15 = _RAND_15[63:0];
  _RAND_16 = {2{`RANDOM}};
  reg_file_16 = _RAND_16[63:0];
  _RAND_17 = {2{`RANDOM}};
  reg_file_17 = _RAND_17[63:0];
  _RAND_18 = {2{`RANDOM}};
  reg_file_18 = _RAND_18[63:0];
  _RAND_19 = {2{`RANDOM}};
  reg_file_19 = _RAND_19[63:0];
  _RAND_20 = {2{`RANDOM}};
  reg_file_20 = _RAND_20[63:0];
  _RAND_21 = {2{`RANDOM}};
  reg_file_21 = _RAND_21[63:0];
  _RAND_22 = {2{`RANDOM}};
  reg_file_22 = _RAND_22[63:0];
  _RAND_23 = {2{`RANDOM}};
  reg_file_23 = _RAND_23[63:0];
  _RAND_24 = {2{`RANDOM}};
  reg_file_24 = _RAND_24[63:0];
  _RAND_25 = {2{`RANDOM}};
  reg_file_25 = _RAND_25[63:0];
  _RAND_26 = {2{`RANDOM}};
  reg_file_26 = _RAND_26[63:0];
  _RAND_27 = {2{`RANDOM}};
  reg_file_27 = _RAND_27[63:0];
  _RAND_28 = {2{`RANDOM}};
  reg_file_28 = _RAND_28[63:0];
  _RAND_29 = {2{`RANDOM}};
  reg_file_29 = _RAND_29[63:0];
  _RAND_30 = {2{`RANDOM}};
  reg_file_30 = _RAND_30[63:0];
  _RAND_31 = {2{`RANDOM}};
  reg_file_31 = _RAND_31[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_040318_Clint(
  input         clock,
  input         reset,
  input         io_bus_valid,
  input  [63:0] io_bus_bits_addr,
  input  [63:0] io_bus_bits_wdata,
  output [63:0] io_bus_bits_rdata,
  input         io_bus_bits_is_w,
  output        io_bus_ready,
  output        io_soft_irq,
  output        io_time_irq
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [31:0] _RAND_5;
`endif // RANDOMIZE_REG_INIT
  reg  reg_msip; // @[clint.scala 25:42]
  reg [63:0] reg_mtime; // @[clint.scala 26:42]
  reg [63:0] reg_mtimecmp; // @[clint.scala 27:42]
  reg  reg_ready; // @[clint.scala 28:42]
  reg [63:0] red_rdata; // @[clint.scala 29:42]
  wire [63:0] _reg_mtime_T_1 = reg_mtime + 64'h1; // @[clint.scala 30:32]
  reg  reg_state; // @[clint.scala 32:32]
  wire [63:0] _temp_data_T_2 = 16'h0 == io_bus_bits_addr[15:0] ? {{63'd0}, reg_msip} : 64'h0; // @[Mux.scala 81:58]
  wire [63:0] _temp_data_T_4 = 16'h4000 == io_bus_bits_addr[15:0] ? reg_mtimecmp : _temp_data_T_2; // @[Mux.scala 81:58]
  wire  is_misp = io_bus_bits_addr[15:0] == 16'h0; // @[clint.scala 42:35]
  wire  is_mtimecmp = io_bus_bits_addr[15:0] == 16'h4000; // @[clint.scala 43:39]
  wire  _reg_msip_T_1 = is_misp ? io_bus_bits_wdata[0] : reg_msip; // @[clint.scala 50:71]
  wire [63:0] _reg_mtimecmp_T = is_mtimecmp ? io_bus_bits_wdata : reg_mtimecmp; // @[clint.scala 51:63]
  wire  _GEN_5 = io_bus_valid | reg_state; // @[clint.scala 32:32 48:43 54:43]
  wire  _GEN_6 = io_bus_valid | reg_ready; // @[clint.scala 28:42 48:43 55:43]
  wire  _T_2 = io_bus_valid & io_bus_ready; // @[clint.scala 12:32]
  assign io_bus_bits_rdata = red_rdata; // @[clint.scala 67:33]
  assign io_bus_ready = reg_ready; // @[clint.scala 66:33]
  assign io_soft_irq = reg_msip; // @[clint.scala 69:25]
  assign io_time_irq = reg_mtimecmp <= reg_mtime; // @[clint.scala 68:41]
  always @(posedge clock) begin
    if (reset) begin // @[clint.scala 25:42]
      reg_msip <= 1'h0; // @[clint.scala 25:42]
    end else if (~reg_state) begin // @[clint.scala 46:26]
      if (io_bus_valid) begin // @[clint.scala 48:43]
        if (io_bus_bits_is_w) begin // @[clint.scala 49:43]
          reg_msip <= _reg_msip_T_1; // @[clint.scala 50:65]
        end
      end
    end
    if (reset) begin // @[clint.scala 26:42]
      reg_mtime <= 64'h0; // @[clint.scala 26:42]
    end else begin
      reg_mtime <= _reg_mtime_T_1; // @[clint.scala 30:19]
    end
    if (reset) begin // @[clint.scala 27:42]
      reg_mtimecmp <= 64'hffffffffffffffff; // @[clint.scala 27:42]
    end else if (~reg_state) begin // @[clint.scala 46:26]
      if (io_bus_valid) begin // @[clint.scala 48:43]
        if (io_bus_bits_is_w) begin // @[clint.scala 49:43]
          reg_mtimecmp <= _reg_mtimecmp_T; // @[clint.scala 51:57]
        end
      end
    end
    if (reset) begin // @[clint.scala 28:42]
      reg_ready <= 1'h0; // @[clint.scala 28:42]
    end else if (~reg_state) begin // @[clint.scala 46:26]
      reg_ready <= _GEN_6;
    end else if (reg_state) begin // @[clint.scala 46:26]
      if (_T_2) begin // @[clint.scala 59:42]
        reg_ready <= 1'h0; // @[clint.scala 61:43]
      end
    end
    if (reset) begin // @[clint.scala 29:42]
      red_rdata <= 64'h0; // @[clint.scala 29:42]
    end else if (~reg_state) begin // @[clint.scala 46:26]
      if (io_bus_valid) begin // @[clint.scala 48:43]
        if (16'hbff8 == io_bus_bits_addr[15:0]) begin // @[Mux.scala 81:58]
          red_rdata <= reg_mtime;
        end else begin
          red_rdata <= _temp_data_T_4;
        end
      end
    end
    if (reset) begin // @[clint.scala 32:32]
      reg_state <= 1'h0; // @[clint.scala 32:32]
    end else if (~reg_state) begin // @[clint.scala 46:26]
      reg_state <= _GEN_5;
    end else if (reg_state) begin // @[clint.scala 46:26]
      if (_T_2) begin // @[clint.scala 59:42]
        reg_state <= 1'h0; // @[clint.scala 60:43]
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
  reg_msip = _RAND_0[0:0];
  _RAND_1 = {2{`RANDOM}};
  reg_mtime = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  reg_mtimecmp = _RAND_2[63:0];
  _RAND_3 = {1{`RANDOM}};
  reg_ready = _RAND_3[0:0];
  _RAND_4 = {2{`RANDOM}};
  red_rdata = _RAND_4[63:0];
  _RAND_5 = {1{`RANDOM}};
  reg_state = _RAND_5[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_040318_Core(
  input          clock,
  input          reset,
  input          io_axi_bus_aw_ready,
  output         io_axi_bus_aw_valid,
  output [63:0]  io_axi_bus_aw_bits_awaddr,
  output [7:0]   io_axi_bus_aw_bits_awlen,
  output [2:0]   io_axi_bus_aw_bits_awsize,
  input          io_axi_bus_w_ready,
  output         io_axi_bus_w_valid,
  output [63:0]  io_axi_bus_w_bits_wdata,
  output [7:0]   io_axi_bus_w_bits_wstrb,
  output         io_axi_bus_w_bits_wlast,
  input          io_axi_bus_b_valid,
  input  [3:0]   io_axi_bus_b_bits_bid,
  input          io_axi_bus_ar_ready,
  output         io_axi_bus_ar_valid,
  output [63:0]  io_axi_bus_ar_bits_araddr,
  output [7:0]   io_axi_bus_ar_bits_arlen,
  output [2:0]   io_axi_bus_ar_bits_arsize,
  input          io_axi_bus_r_valid,
  input  [3:0]   io_axi_bus_r_bits_rid,
  input  [63:0]  io_axi_bus_r_bits_rdata,
  input          io_axi_bus_r_bits_rlast,
  output [5:0]   io_isram_addr,
  output         io_isram_wen_0,
  output         io_isram_wen_1,
  output [127:0] io_isram_tag_wdata,
  output [127:0] io_isram_data_wdata,
  input  [127:0] io_isram_rdata_0,
  input  [127:0] io_isram_rdata_1,
  input  [127:0] io_isram_rdata_2,
  input  [127:0] io_isram_rdata_3,
  output [5:0]   io_dsram_addr,
  output         io_dsram_wen_0,
  output         io_dsram_wen_1,
  output [127:0] io_dsram_data_wmask,
  output [127:0] io_dsram_tag_wdata,
  output [127:0] io_dsram_data_wdata,
  input  [127:0] io_dsram_rdata_0,
  input  [127:0] io_dsram_rdata_1,
  input  [127:0] io_dsram_rdata_2,
  input  [127:0] io_dsram_rdata_3
);
  wire  i_cache_clock; // @[core.scala 20:33]
  wire  i_cache_reset; // @[core.scala 20:33]
  wire  i_cache_io_flush; // @[core.scala 20:33]
  wire  i_cache_io_fence_i; // @[core.scala 20:33]
  wire  i_cache_io_cpu_addr_ready; // @[core.scala 20:33]
  wire  i_cache_io_cpu_addr_valid; // @[core.scala 20:33]
  wire [63:0] i_cache_io_cpu_addr_bits_addr; // @[core.scala 20:33]
  wire  i_cache_io_cpu_rdata_ready; // @[core.scala 20:33]
  wire  i_cache_io_cpu_rdata_valid; // @[core.scala 20:33]
  wire [63:0] i_cache_io_cpu_rdata_bits_data; // @[core.scala 20:33]
  wire [63:0] i_cache_io_cpu_rdata_bits_pc; // @[core.scala 20:33]
  wire [5:0] i_cache_io_sram_addr; // @[core.scala 20:33]
  wire  i_cache_io_sram_wen_0; // @[core.scala 20:33]
  wire  i_cache_io_sram_wen_1; // @[core.scala 20:33]
  wire [127:0] i_cache_io_sram_tag_wdata; // @[core.scala 20:33]
  wire [127:0] i_cache_io_sram_data_wdata; // @[core.scala 20:33]
  wire [127:0] i_cache_io_sram_rdata_0; // @[core.scala 20:33]
  wire [127:0] i_cache_io_sram_rdata_1; // @[core.scala 20:33]
  wire [127:0] i_cache_io_sram_rdata_2; // @[core.scala 20:33]
  wire [127:0] i_cache_io_sram_rdata_3; // @[core.scala 20:33]
  wire  i_cache_io_cache_bus_r_valid; // @[core.scala 20:33]
  wire [63:0] i_cache_io_cache_bus_r_bits_raddr; // @[core.scala 20:33]
  wire [1:0] i_cache_io_cache_bus_r_bits_rlen; // @[core.scala 20:33]
  wire [1:0] i_cache_io_cache_bus_r_bits_rsize; // @[core.scala 20:33]
  wire [63:0] i_cache_io_cache_bus_r_bits_rdata; // @[core.scala 20:33]
  wire  i_cache_io_cache_bus_r_bits_rlast; // @[core.scala 20:33]
  wire  i_cache_io_cache_bus_r_ready; // @[core.scala 20:33]
  wire  d_cache_clock; // @[core.scala 21:33]
  wire  d_cache_reset; // @[core.scala 21:33]
  wire  d_cache_io_dcache_cmd_ready; // @[core.scala 21:33]
  wire  d_cache_io_dcache_cmd_valid; // @[core.scala 21:33]
  wire [63:0] d_cache_io_dcache_cmd_bits_addr; // @[core.scala 21:33]
  wire [63:0] d_cache_io_dcache_cmd_bits_wdata; // @[core.scala 21:33]
  wire [7:0] d_cache_io_dcache_cmd_bits_wstrb; // @[core.scala 21:33]
  wire  d_cache_io_dcache_cmd_bits_is_w; // @[core.scala 21:33]
  wire [1:0] d_cache_io_dcache_cmd_bits_size; // @[core.scala 21:33]
  wire  d_cache_io_dcache_cmd_bits_is_fence; // @[core.scala 21:33]
  wire  d_cache_io_dcache_cmd_bits_is_mmio; // @[core.scala 21:33]
  wire  d_cache_io_dcahce_resp_valid; // @[core.scala 21:33]
  wire [63:0] d_cache_io_dcahce_resp_bits_rdata; // @[core.scala 21:33]
  wire [2:0] d_cache_io_dcahce_resp_bits_resp_info; // @[core.scala 21:33]
  wire [5:0] d_cache_io_sram_addr; // @[core.scala 21:33]
  wire  d_cache_io_sram_wen_0; // @[core.scala 21:33]
  wire  d_cache_io_sram_wen_1; // @[core.scala 21:33]
  wire [127:0] d_cache_io_sram_data_wmask; // @[core.scala 21:33]
  wire [127:0] d_cache_io_sram_tag_wdata; // @[core.scala 21:33]
  wire [127:0] d_cache_io_sram_data_wdata; // @[core.scala 21:33]
  wire [127:0] d_cache_io_sram_rdata_0; // @[core.scala 21:33]
  wire [127:0] d_cache_io_sram_rdata_1; // @[core.scala 21:33]
  wire [127:0] d_cache_io_sram_rdata_2; // @[core.scala 21:33]
  wire [127:0] d_cache_io_sram_rdata_3; // @[core.scala 21:33]
  wire  d_cache_io_clint_valid; // @[core.scala 21:33]
  wire [63:0] d_cache_io_clint_bits_addr; // @[core.scala 21:33]
  wire [63:0] d_cache_io_clint_bits_wdata; // @[core.scala 21:33]
  wire [63:0] d_cache_io_clint_bits_rdata; // @[core.scala 21:33]
  wire  d_cache_io_clint_bits_is_w; // @[core.scala 21:33]
  wire  d_cache_io_clint_ready; // @[core.scala 21:33]
  wire  d_cache_io_cache_bus_w_ready; // @[core.scala 21:33]
  wire  d_cache_io_cache_bus_w_valid; // @[core.scala 21:33]
  wire [63:0] d_cache_io_cache_bus_w_bits_waddr; // @[core.scala 21:33]
  wire [63:0] d_cache_io_cache_bus_w_bits_wdata; // @[core.scala 21:33]
  wire  d_cache_io_cache_bus_w_bits_wlast; // @[core.scala 21:33]
  wire [1:0] d_cache_io_cache_bus_w_bits_wlen; // @[core.scala 21:33]
  wire [1:0] d_cache_io_cache_bus_w_bits_wsize; // @[core.scala 21:33]
  wire [7:0] d_cache_io_cache_bus_w_bits_wstrb; // @[core.scala 21:33]
  wire  d_cache_io_cache_bus_b_ready; // @[core.scala 21:33]
  wire  d_cache_io_cache_bus_b_valid; // @[core.scala 21:33]
  wire  d_cache_io_cache_bus_r_valid; // @[core.scala 21:33]
  wire [63:0] d_cache_io_cache_bus_r_bits_raddr; // @[core.scala 21:33]
  wire [1:0] d_cache_io_cache_bus_r_bits_rlen; // @[core.scala 21:33]
  wire [1:0] d_cache_io_cache_bus_r_bits_rsize; // @[core.scala 21:33]
  wire [63:0] d_cache_io_cache_bus_r_bits_rdata; // @[core.scala 21:33]
  wire  d_cache_io_cache_bus_r_bits_rlast; // @[core.scala 21:33]
  wire  d_cache_io_cache_bus_r_ready; // @[core.scala 21:33]
  wire  cross_bar_clock; // @[core.scala 22:33]
  wire  cross_bar_reset; // @[core.scala 22:33]
  wire  cross_bar_io_ICache_bus_r_valid; // @[core.scala 22:33]
  wire [63:0] cross_bar_io_ICache_bus_r_bits_raddr; // @[core.scala 22:33]
  wire [1:0] cross_bar_io_ICache_bus_r_bits_rlen; // @[core.scala 22:33]
  wire [1:0] cross_bar_io_ICache_bus_r_bits_rsize; // @[core.scala 22:33]
  wire [63:0] cross_bar_io_ICache_bus_r_bits_rdata; // @[core.scala 22:33]
  wire  cross_bar_io_ICache_bus_r_bits_rlast; // @[core.scala 22:33]
  wire  cross_bar_io_ICache_bus_r_ready; // @[core.scala 22:33]
  wire  cross_bar_io_DCache_bus_w_ready; // @[core.scala 22:33]
  wire  cross_bar_io_DCache_bus_w_valid; // @[core.scala 22:33]
  wire [63:0] cross_bar_io_DCache_bus_w_bits_waddr; // @[core.scala 22:33]
  wire [63:0] cross_bar_io_DCache_bus_w_bits_wdata; // @[core.scala 22:33]
  wire  cross_bar_io_DCache_bus_w_bits_wlast; // @[core.scala 22:33]
  wire [1:0] cross_bar_io_DCache_bus_w_bits_wlen; // @[core.scala 22:33]
  wire [1:0] cross_bar_io_DCache_bus_w_bits_wsize; // @[core.scala 22:33]
  wire [7:0] cross_bar_io_DCache_bus_w_bits_wstrb; // @[core.scala 22:33]
  wire  cross_bar_io_DCache_bus_b_valid; // @[core.scala 22:33]
  wire  cross_bar_io_DCache_bus_r_valid; // @[core.scala 22:33]
  wire [63:0] cross_bar_io_DCache_bus_r_bits_raddr; // @[core.scala 22:33]
  wire [1:0] cross_bar_io_DCache_bus_r_bits_rlen; // @[core.scala 22:33]
  wire [1:0] cross_bar_io_DCache_bus_r_bits_rsize; // @[core.scala 22:33]
  wire [63:0] cross_bar_io_DCache_bus_r_bits_rdata; // @[core.scala 22:33]
  wire  cross_bar_io_DCache_bus_r_bits_rlast; // @[core.scala 22:33]
  wire  cross_bar_io_DCache_bus_r_ready; // @[core.scala 22:33]
  wire  cross_bar_io_AXI_Bus_aw_ready; // @[core.scala 22:33]
  wire  cross_bar_io_AXI_Bus_aw_valid; // @[core.scala 22:33]
  wire [63:0] cross_bar_io_AXI_Bus_aw_bits_awaddr; // @[core.scala 22:33]
  wire [7:0] cross_bar_io_AXI_Bus_aw_bits_awlen; // @[core.scala 22:33]
  wire [2:0] cross_bar_io_AXI_Bus_aw_bits_awsize; // @[core.scala 22:33]
  wire  cross_bar_io_AXI_Bus_w_ready; // @[core.scala 22:33]
  wire  cross_bar_io_AXI_Bus_w_valid; // @[core.scala 22:33]
  wire [63:0] cross_bar_io_AXI_Bus_w_bits_wdata; // @[core.scala 22:33]
  wire [7:0] cross_bar_io_AXI_Bus_w_bits_wstrb; // @[core.scala 22:33]
  wire  cross_bar_io_AXI_Bus_w_bits_wlast; // @[core.scala 22:33]
  wire  cross_bar_io_AXI_Bus_b_ready; // @[core.scala 22:33]
  wire  cross_bar_io_AXI_Bus_b_valid; // @[core.scala 22:33]
  wire [3:0] cross_bar_io_AXI_Bus_b_bits_bid; // @[core.scala 22:33]
  wire  cross_bar_io_AXI_Bus_ar_ready; // @[core.scala 22:33]
  wire  cross_bar_io_AXI_Bus_ar_valid; // @[core.scala 22:33]
  wire [63:0] cross_bar_io_AXI_Bus_ar_bits_araddr; // @[core.scala 22:33]
  wire [7:0] cross_bar_io_AXI_Bus_ar_bits_arlen; // @[core.scala 22:33]
  wire [2:0] cross_bar_io_AXI_Bus_ar_bits_arsize; // @[core.scala 22:33]
  wire  cross_bar_io_AXI_Bus_r_valid; // @[core.scala 22:33]
  wire [3:0] cross_bar_io_AXI_Bus_r_bits_rid; // @[core.scala 22:33]
  wire [63:0] cross_bar_io_AXI_Bus_r_bits_rdata; // @[core.scala 22:33]
  wire  cross_bar_io_AXI_Bus_r_bits_rlast; // @[core.scala 22:33]
  wire  fetch_clock; // @[core.scala 24:41]
  wire  fetch_reset; // @[core.scala 24:41]
  wire  fetch_io_br_info_valid; // @[core.scala 24:41]
  wire  fetch_io_br_info_mispredict; // @[core.scala 24:41]
  wire [63:0] fetch_io_br_info_br_pc; // @[core.scala 24:41]
  wire  fetch_io_br_info_taken; // @[core.scala 24:41]
  wire [63:0] fetch_io_br_info_target_next_pc; // @[core.scala 24:41]
  wire [1:0] fetch_io_br_info_br_type; // @[core.scala 24:41]
  wire  fetch_io_get_pre_info_valid; // @[core.scala 24:41]
  wire [63:0] fetch_io_get_pre_info_pre_next_pc; // @[core.scala 24:41]
  wire [63:0] fetch_io_next_pc; // @[core.scala 24:41]
  wire  fetch_io_flush; // @[core.scala 24:41]
  wire  fetch_io_cpu_addr_ready; // @[core.scala 24:41]
  wire  fetch_io_cpu_addr_valid; // @[core.scala 24:41]
  wire [63:0] fetch_io_cpu_addr_bits_addr; // @[core.scala 24:41]
  wire  fetch_io_cpu_data_ready; // @[core.scala 24:41]
  wire  fetch_io_cpu_data_valid; // @[core.scala 24:41]
  wire [63:0] fetch_io_cpu_data_bits_data; // @[core.scala 24:41]
  wire [63:0] fetch_io_cpu_data_bits_pc; // @[core.scala 24:41]
  wire  fetch_io_put_pc_ready; // @[core.scala 24:41]
  wire  fetch_io_put_pc_valid; // @[core.scala 24:41]
  wire [31:0] fetch_io_put_pc_bits_inst; // @[core.scala 24:41]
  wire [63:0] fetch_io_put_pc_bits_pc; // @[core.scala 24:41]
  wire  fetch_io_put_pc_bits_is_pre; // @[core.scala 24:41]
  wire  execute_clock; // @[core.scala 25:33]
  wire  execute_reset; // @[core.scala 25:33]
  wire  execute_io_op_datas_ready; // @[core.scala 25:33]
  wire  execute_io_op_datas_valid; // @[core.scala 25:33]
  wire [2:0] execute_io_op_datas_bits_opType; // @[core.scala 25:33]
  wire [6:0] execute_io_op_datas_bits_exuType; // @[core.scala 25:33]
  wire [4:0] execute_io_op_datas_bits_rs1_addr; // @[core.scala 25:33]
  wire [63:0] execute_io_op_datas_bits_rs1_data; // @[core.scala 25:33]
  wire [4:0] execute_io_op_datas_bits_rs2_addr; // @[core.scala 25:33]
  wire [63:0] execute_io_op_datas_bits_rs2_data; // @[core.scala 25:33]
  wire [31:0] execute_io_op_datas_bits_imm; // @[core.scala 25:33]
  wire [63:0] execute_io_op_datas_bits_pc; // @[core.scala 25:33]
  wire [4:0] execute_io_op_datas_bits_dest_addr; // @[core.scala 25:33]
  wire  execute_io_op_datas_bits_dest_is_reg; // @[core.scala 25:33]
  wire  execute_io_op_datas_bits_is_pre; // @[core.scala 25:33]
  wire [11:0] execute_io_op_datas_bits_csr_addr; // @[core.scala 25:33]
  wire [63:0] execute_io_op_datas_bits_csr_data; // @[core.scala 25:33]
  wire  execute_io_irq_time_irq; // @[core.scala 25:33]
  wire  execute_io_irq_soft_irq; // @[core.scala 25:33]
  wire [63:0] execute_io_mstatus; // @[core.scala 25:33]
  wire [63:0] execute_io_mie; // @[core.scala 25:33]
  wire [63:0] execute_io_mepc; // @[core.scala 25:33]
  wire [63:0] execute_io_mtvec; // @[core.scala 25:33]
  wire  execute_io_wb_valid; // @[core.scala 25:33]
  wire [4:0] execute_io_wb_dest_addr; // @[core.scala 25:33]
  wire [63:0] execute_io_wb_dest_data; // @[core.scala 25:33]
  wire  execute_io_csr_valid; // @[core.scala 25:33]
  wire [11:0] execute_io_csr_csr_addr; // @[core.scala 25:33]
  wire [63:0] execute_io_csr_csr_data; // @[core.scala 25:33]
  wire  execute_io_csr_except_is_except; // @[core.scala 25:33]
  wire  execute_io_csr_except_is_time_irq; // @[core.scala 25:33]
  wire  execute_io_csr_except_is_soft_irq; // @[core.scala 25:33]
  wire [4:0] execute_io_csr_except_exception; // @[core.scala 25:33]
  wire [63:0] execute_io_csr_except_next_pc; // @[core.scala 25:33]
  wire [63:0] execute_io_csr_except_pc; // @[core.scala 25:33]
  wire  execute_io_commit; // @[core.scala 25:33]
  wire [63:0] execute_io_next_pc; // @[core.scala 25:33]
  wire  execute_io_flush; // @[core.scala 25:33]
  wire  execute_io_fence_i; // @[core.scala 25:33]
  wire  execute_io_br_info_valid; // @[core.scala 25:33]
  wire  execute_io_br_info_mispredict; // @[core.scala 25:33]
  wire [63:0] execute_io_br_info_br_pc; // @[core.scala 25:33]
  wire  execute_io_br_info_taken; // @[core.scala 25:33]
  wire [63:0] execute_io_br_info_target_next_pc; // @[core.scala 25:33]
  wire [1:0] execute_io_br_info_br_type; // @[core.scala 25:33]
  wire  execute_io_get_pre_info_valid; // @[core.scala 25:33]
  wire [63:0] execute_io_get_pre_info_pre_next_pc; // @[core.scala 25:33]
  wire  execute_io_dcache_cmd_ready; // @[core.scala 25:33]
  wire  execute_io_dcache_cmd_valid; // @[core.scala 25:33]
  wire [63:0] execute_io_dcache_cmd_bits_addr; // @[core.scala 25:33]
  wire [63:0] execute_io_dcache_cmd_bits_wdata; // @[core.scala 25:33]
  wire [7:0] execute_io_dcache_cmd_bits_wstrb; // @[core.scala 25:33]
  wire  execute_io_dcache_cmd_bits_is_w; // @[core.scala 25:33]
  wire [1:0] execute_io_dcache_cmd_bits_size; // @[core.scala 25:33]
  wire  execute_io_dcache_cmd_bits_is_fence; // @[core.scala 25:33]
  wire  execute_io_dcache_cmd_bits_is_mmio; // @[core.scala 25:33]
  wire  execute_io_dcahce_resp_valid; // @[core.scala 25:33]
  wire [63:0] execute_io_dcahce_resp_bits_rdata; // @[core.scala 25:33]
  wire [2:0] execute_io_dcahce_resp_bits_resp_info; // @[core.scala 25:33]
  wire  decode_clock; // @[core.scala 26:41]
  wire  decode_reset; // @[core.scala 26:41]
  wire  decode_io_get_inst_ready; // @[core.scala 26:41]
  wire  decode_io_get_inst_valid; // @[core.scala 26:41]
  wire [31:0] decode_io_get_inst_bits_inst; // @[core.scala 26:41]
  wire [63:0] decode_io_get_inst_bits_pc; // @[core.scala 26:41]
  wire  decode_io_get_inst_bits_is_pre; // @[core.scala 26:41]
  wire [4:0] decode_io_normal_rd_rs1_addr; // @[core.scala 26:41]
  wire [63:0] decode_io_normal_rd_rs1_data; // @[core.scala 26:41]
  wire [4:0] decode_io_normal_rd_rs2_addr; // @[core.scala 26:41]
  wire [63:0] decode_io_normal_rd_rs2_data; // @[core.scala 26:41]
  wire [11:0] decode_io_csr_rd_csr_addr; // @[core.scala 26:41]
  wire [63:0] decode_io_csr_rd_csr_data; // @[core.scala 26:41]
  wire  decode_io_op_datas_ready; // @[core.scala 26:41]
  wire  decode_io_op_datas_valid; // @[core.scala 26:41]
  wire [2:0] decode_io_op_datas_bits_opType; // @[core.scala 26:41]
  wire [6:0] decode_io_op_datas_bits_exuType; // @[core.scala 26:41]
  wire [4:0] decode_io_op_datas_bits_rs1_addr; // @[core.scala 26:41]
  wire [63:0] decode_io_op_datas_bits_rs1_data; // @[core.scala 26:41]
  wire [4:0] decode_io_op_datas_bits_rs2_addr; // @[core.scala 26:41]
  wire [63:0] decode_io_op_datas_bits_rs2_data; // @[core.scala 26:41]
  wire [31:0] decode_io_op_datas_bits_imm; // @[core.scala 26:41]
  wire [63:0] decode_io_op_datas_bits_pc; // @[core.scala 26:41]
  wire [4:0] decode_io_op_datas_bits_dest_addr; // @[core.scala 26:41]
  wire  decode_io_op_datas_bits_dest_is_reg; // @[core.scala 26:41]
  wire  decode_io_op_datas_bits_is_pre; // @[core.scala 26:41]
  wire [11:0] decode_io_op_datas_bits_csr_addr; // @[core.scala 26:41]
  wire [63:0] decode_io_op_datas_bits_csr_data; // @[core.scala 26:41]
  wire  decode_io_flush; // @[core.scala 26:41]
  wire  commit_clock; // @[core.scala 27:41]
  wire  commit_reset; // @[core.scala 27:41]
  wire [4:0] commit_io_normal_rd_rs1_addr; // @[core.scala 27:41]
  wire [63:0] commit_io_normal_rd_rs1_data; // @[core.scala 27:41]
  wire [4:0] commit_io_normal_rd_rs2_addr; // @[core.scala 27:41]
  wire [63:0] commit_io_normal_rd_rs2_data; // @[core.scala 27:41]
  wire  commit_io_normal_wb_valid; // @[core.scala 27:41]
  wire [4:0] commit_io_normal_wb_dest_addr; // @[core.scala 27:41]
  wire [63:0] commit_io_normal_wb_dest_data; // @[core.scala 27:41]
  wire [11:0] commit_io_csr_rd_csr_addr; // @[core.scala 27:41]
  wire [63:0] commit_io_csr_rd_csr_data; // @[core.scala 27:41]
  wire  commit_io_csr_wb_valid; // @[core.scala 27:41]
  wire [11:0] commit_io_csr_wb_csr_addr; // @[core.scala 27:41]
  wire [63:0] commit_io_csr_wb_csr_data; // @[core.scala 27:41]
  wire  commit_io_csr_except_is_except; // @[core.scala 27:41]
  wire  commit_io_csr_except_is_time_irq; // @[core.scala 27:41]
  wire  commit_io_csr_except_is_soft_irq; // @[core.scala 27:41]
  wire [4:0] commit_io_csr_except_exception; // @[core.scala 27:41]
  wire [63:0] commit_io_csr_except_next_pc; // @[core.scala 27:41]
  wire [63:0] commit_io_csr_except_pc; // @[core.scala 27:41]
  wire [63:0] commit_io_csr_pass_csr_mtvec; // @[core.scala 27:41]
  wire [63:0] commit_io_csr_pass_csr_mepc; // @[core.scala 27:41]
  wire [63:0] commit_io_csr_pass_csr_mstatus; // @[core.scala 27:41]
  wire [63:0] commit_io_csr_pass_csr_mie; // @[core.scala 27:41]
  wire  commit_io_commit; // @[core.scala 27:41]
  wire  clint_de_clock; // @[core.scala 29:33]
  wire  clint_de_reset; // @[core.scala 29:33]
  wire  clint_de_io_bus_valid; // @[core.scala 29:33]
  wire [63:0] clint_de_io_bus_bits_addr; // @[core.scala 29:33]
  wire [63:0] clint_de_io_bus_bits_wdata; // @[core.scala 29:33]
  wire [63:0] clint_de_io_bus_bits_rdata; // @[core.scala 29:33]
  wire  clint_de_io_bus_bits_is_w; // @[core.scala 29:33]
  wire  clint_de_io_bus_ready; // @[core.scala 29:33]
  wire  clint_de_io_soft_irq; // @[core.scala 29:33]
  wire  clint_de_io_time_irq; // @[core.scala 29:33]
  ysyx_040318_ICache i_cache ( // @[core.scala 20:33]
    .clock(i_cache_clock),
    .reset(i_cache_reset),
    .io_flush(i_cache_io_flush),
    .io_fence_i(i_cache_io_fence_i),
    .io_cpu_addr_ready(i_cache_io_cpu_addr_ready),
    .io_cpu_addr_valid(i_cache_io_cpu_addr_valid),
    .io_cpu_addr_bits_addr(i_cache_io_cpu_addr_bits_addr),
    .io_cpu_rdata_ready(i_cache_io_cpu_rdata_ready),
    .io_cpu_rdata_valid(i_cache_io_cpu_rdata_valid),
    .io_cpu_rdata_bits_data(i_cache_io_cpu_rdata_bits_data),
    .io_cpu_rdata_bits_pc(i_cache_io_cpu_rdata_bits_pc),
    .io_sram_addr(i_cache_io_sram_addr),
    .io_sram_wen_0(i_cache_io_sram_wen_0),
    .io_sram_wen_1(i_cache_io_sram_wen_1),
    .io_sram_tag_wdata(i_cache_io_sram_tag_wdata),
    .io_sram_data_wdata(i_cache_io_sram_data_wdata),
    .io_sram_rdata_0(i_cache_io_sram_rdata_0),
    .io_sram_rdata_1(i_cache_io_sram_rdata_1),
    .io_sram_rdata_2(i_cache_io_sram_rdata_2),
    .io_sram_rdata_3(i_cache_io_sram_rdata_3),
    .io_cache_bus_r_valid(i_cache_io_cache_bus_r_valid),
    .io_cache_bus_r_bits_raddr(i_cache_io_cache_bus_r_bits_raddr),
    .io_cache_bus_r_bits_rlen(i_cache_io_cache_bus_r_bits_rlen),
    .io_cache_bus_r_bits_rsize(i_cache_io_cache_bus_r_bits_rsize),
    .io_cache_bus_r_bits_rdata(i_cache_io_cache_bus_r_bits_rdata),
    .io_cache_bus_r_bits_rlast(i_cache_io_cache_bus_r_bits_rlast),
    .io_cache_bus_r_ready(i_cache_io_cache_bus_r_ready)
  );
  ysyx_040318_DCache d_cache ( // @[core.scala 21:33]
    .clock(d_cache_clock),
    .reset(d_cache_reset),
    .io_dcache_cmd_ready(d_cache_io_dcache_cmd_ready),
    .io_dcache_cmd_valid(d_cache_io_dcache_cmd_valid),
    .io_dcache_cmd_bits_addr(d_cache_io_dcache_cmd_bits_addr),
    .io_dcache_cmd_bits_wdata(d_cache_io_dcache_cmd_bits_wdata),
    .io_dcache_cmd_bits_wstrb(d_cache_io_dcache_cmd_bits_wstrb),
    .io_dcache_cmd_bits_is_w(d_cache_io_dcache_cmd_bits_is_w),
    .io_dcache_cmd_bits_size(d_cache_io_dcache_cmd_bits_size),
    .io_dcache_cmd_bits_is_fence(d_cache_io_dcache_cmd_bits_is_fence),
    .io_dcache_cmd_bits_is_mmio(d_cache_io_dcache_cmd_bits_is_mmio),
    .io_dcahce_resp_valid(d_cache_io_dcahce_resp_valid),
    .io_dcahce_resp_bits_rdata(d_cache_io_dcahce_resp_bits_rdata),
    .io_dcahce_resp_bits_resp_info(d_cache_io_dcahce_resp_bits_resp_info),
    .io_sram_addr(d_cache_io_sram_addr),
    .io_sram_wen_0(d_cache_io_sram_wen_0),
    .io_sram_wen_1(d_cache_io_sram_wen_1),
    .io_sram_data_wmask(d_cache_io_sram_data_wmask),
    .io_sram_tag_wdata(d_cache_io_sram_tag_wdata),
    .io_sram_data_wdata(d_cache_io_sram_data_wdata),
    .io_sram_rdata_0(d_cache_io_sram_rdata_0),
    .io_sram_rdata_1(d_cache_io_sram_rdata_1),
    .io_sram_rdata_2(d_cache_io_sram_rdata_2),
    .io_sram_rdata_3(d_cache_io_sram_rdata_3),
    .io_clint_valid(d_cache_io_clint_valid),
    .io_clint_bits_addr(d_cache_io_clint_bits_addr),
    .io_clint_bits_wdata(d_cache_io_clint_bits_wdata),
    .io_clint_bits_rdata(d_cache_io_clint_bits_rdata),
    .io_clint_bits_is_w(d_cache_io_clint_bits_is_w),
    .io_clint_ready(d_cache_io_clint_ready),
    .io_cache_bus_w_ready(d_cache_io_cache_bus_w_ready),
    .io_cache_bus_w_valid(d_cache_io_cache_bus_w_valid),
    .io_cache_bus_w_bits_waddr(d_cache_io_cache_bus_w_bits_waddr),
    .io_cache_bus_w_bits_wdata(d_cache_io_cache_bus_w_bits_wdata),
    .io_cache_bus_w_bits_wlast(d_cache_io_cache_bus_w_bits_wlast),
    .io_cache_bus_w_bits_wlen(d_cache_io_cache_bus_w_bits_wlen),
    .io_cache_bus_w_bits_wsize(d_cache_io_cache_bus_w_bits_wsize),
    .io_cache_bus_w_bits_wstrb(d_cache_io_cache_bus_w_bits_wstrb),
    .io_cache_bus_b_ready(d_cache_io_cache_bus_b_ready),
    .io_cache_bus_b_valid(d_cache_io_cache_bus_b_valid),
    .io_cache_bus_r_valid(d_cache_io_cache_bus_r_valid),
    .io_cache_bus_r_bits_raddr(d_cache_io_cache_bus_r_bits_raddr),
    .io_cache_bus_r_bits_rlen(d_cache_io_cache_bus_r_bits_rlen),
    .io_cache_bus_r_bits_rsize(d_cache_io_cache_bus_r_bits_rsize),
    .io_cache_bus_r_bits_rdata(d_cache_io_cache_bus_r_bits_rdata),
    .io_cache_bus_r_bits_rlast(d_cache_io_cache_bus_r_bits_rlast),
    .io_cache_bus_r_ready(d_cache_io_cache_bus_r_ready)
  );
  ysyx_040318_Crossbar cross_bar ( // @[core.scala 22:33]
    .clock(cross_bar_clock),
    .reset(cross_bar_reset),
    .io_ICache_bus_r_valid(cross_bar_io_ICache_bus_r_valid),
    .io_ICache_bus_r_bits_raddr(cross_bar_io_ICache_bus_r_bits_raddr),
    .io_ICache_bus_r_bits_rlen(cross_bar_io_ICache_bus_r_bits_rlen),
    .io_ICache_bus_r_bits_rsize(cross_bar_io_ICache_bus_r_bits_rsize),
    .io_ICache_bus_r_bits_rdata(cross_bar_io_ICache_bus_r_bits_rdata),
    .io_ICache_bus_r_bits_rlast(cross_bar_io_ICache_bus_r_bits_rlast),
    .io_ICache_bus_r_ready(cross_bar_io_ICache_bus_r_ready),
    .io_DCache_bus_w_ready(cross_bar_io_DCache_bus_w_ready),
    .io_DCache_bus_w_valid(cross_bar_io_DCache_bus_w_valid),
    .io_DCache_bus_w_bits_waddr(cross_bar_io_DCache_bus_w_bits_waddr),
    .io_DCache_bus_w_bits_wdata(cross_bar_io_DCache_bus_w_bits_wdata),
    .io_DCache_bus_w_bits_wlast(cross_bar_io_DCache_bus_w_bits_wlast),
    .io_DCache_bus_w_bits_wlen(cross_bar_io_DCache_bus_w_bits_wlen),
    .io_DCache_bus_w_bits_wsize(cross_bar_io_DCache_bus_w_bits_wsize),
    .io_DCache_bus_w_bits_wstrb(cross_bar_io_DCache_bus_w_bits_wstrb),
    .io_DCache_bus_b_valid(cross_bar_io_DCache_bus_b_valid),
    .io_DCache_bus_r_valid(cross_bar_io_DCache_bus_r_valid),
    .io_DCache_bus_r_bits_raddr(cross_bar_io_DCache_bus_r_bits_raddr),
    .io_DCache_bus_r_bits_rlen(cross_bar_io_DCache_bus_r_bits_rlen),
    .io_DCache_bus_r_bits_rsize(cross_bar_io_DCache_bus_r_bits_rsize),
    .io_DCache_bus_r_bits_rdata(cross_bar_io_DCache_bus_r_bits_rdata),
    .io_DCache_bus_r_bits_rlast(cross_bar_io_DCache_bus_r_bits_rlast),
    .io_DCache_bus_r_ready(cross_bar_io_DCache_bus_r_ready),
    .io_AXI_Bus_aw_ready(cross_bar_io_AXI_Bus_aw_ready),
    .io_AXI_Bus_aw_valid(cross_bar_io_AXI_Bus_aw_valid),
    .io_AXI_Bus_aw_bits_awaddr(cross_bar_io_AXI_Bus_aw_bits_awaddr),
    .io_AXI_Bus_aw_bits_awlen(cross_bar_io_AXI_Bus_aw_bits_awlen),
    .io_AXI_Bus_aw_bits_awsize(cross_bar_io_AXI_Bus_aw_bits_awsize),
    .io_AXI_Bus_w_ready(cross_bar_io_AXI_Bus_w_ready),
    .io_AXI_Bus_w_valid(cross_bar_io_AXI_Bus_w_valid),
    .io_AXI_Bus_w_bits_wdata(cross_bar_io_AXI_Bus_w_bits_wdata),
    .io_AXI_Bus_w_bits_wstrb(cross_bar_io_AXI_Bus_w_bits_wstrb),
    .io_AXI_Bus_w_bits_wlast(cross_bar_io_AXI_Bus_w_bits_wlast),
    .io_AXI_Bus_b_ready(cross_bar_io_AXI_Bus_b_ready),
    .io_AXI_Bus_b_valid(cross_bar_io_AXI_Bus_b_valid),
    .io_AXI_Bus_b_bits_bid(cross_bar_io_AXI_Bus_b_bits_bid),
    .io_AXI_Bus_ar_ready(cross_bar_io_AXI_Bus_ar_ready),
    .io_AXI_Bus_ar_valid(cross_bar_io_AXI_Bus_ar_valid),
    .io_AXI_Bus_ar_bits_araddr(cross_bar_io_AXI_Bus_ar_bits_araddr),
    .io_AXI_Bus_ar_bits_arlen(cross_bar_io_AXI_Bus_ar_bits_arlen),
    .io_AXI_Bus_ar_bits_arsize(cross_bar_io_AXI_Bus_ar_bits_arsize),
    .io_AXI_Bus_r_valid(cross_bar_io_AXI_Bus_r_valid),
    .io_AXI_Bus_r_bits_rid(cross_bar_io_AXI_Bus_r_bits_rid),
    .io_AXI_Bus_r_bits_rdata(cross_bar_io_AXI_Bus_r_bits_rdata),
    .io_AXI_Bus_r_bits_rlast(cross_bar_io_AXI_Bus_r_bits_rlast)
  );
  ysyx_040318_Fetch fetch ( // @[core.scala 24:41]
    .clock(fetch_clock),
    .reset(fetch_reset),
    .io_br_info_valid(fetch_io_br_info_valid),
    .io_br_info_mispredict(fetch_io_br_info_mispredict),
    .io_br_info_br_pc(fetch_io_br_info_br_pc),
    .io_br_info_taken(fetch_io_br_info_taken),
    .io_br_info_target_next_pc(fetch_io_br_info_target_next_pc),
    .io_br_info_br_type(fetch_io_br_info_br_type),
    .io_get_pre_info_valid(fetch_io_get_pre_info_valid),
    .io_get_pre_info_pre_next_pc(fetch_io_get_pre_info_pre_next_pc),
    .io_next_pc(fetch_io_next_pc),
    .io_flush(fetch_io_flush),
    .io_cpu_addr_ready(fetch_io_cpu_addr_ready),
    .io_cpu_addr_valid(fetch_io_cpu_addr_valid),
    .io_cpu_addr_bits_addr(fetch_io_cpu_addr_bits_addr),
    .io_cpu_data_ready(fetch_io_cpu_data_ready),
    .io_cpu_data_valid(fetch_io_cpu_data_valid),
    .io_cpu_data_bits_data(fetch_io_cpu_data_bits_data),
    .io_cpu_data_bits_pc(fetch_io_cpu_data_bits_pc),
    .io_put_pc_ready(fetch_io_put_pc_ready),
    .io_put_pc_valid(fetch_io_put_pc_valid),
    .io_put_pc_bits_inst(fetch_io_put_pc_bits_inst),
    .io_put_pc_bits_pc(fetch_io_put_pc_bits_pc),
    .io_put_pc_bits_is_pre(fetch_io_put_pc_bits_is_pre)
  );
  ysyx_040318_Exu execute ( // @[core.scala 25:33]
    .clock(execute_clock),
    .reset(execute_reset),
    .io_op_datas_ready(execute_io_op_datas_ready),
    .io_op_datas_valid(execute_io_op_datas_valid),
    .io_op_datas_bits_opType(execute_io_op_datas_bits_opType),
    .io_op_datas_bits_exuType(execute_io_op_datas_bits_exuType),
    .io_op_datas_bits_rs1_addr(execute_io_op_datas_bits_rs1_addr),
    .io_op_datas_bits_rs1_data(execute_io_op_datas_bits_rs1_data),
    .io_op_datas_bits_rs2_addr(execute_io_op_datas_bits_rs2_addr),
    .io_op_datas_bits_rs2_data(execute_io_op_datas_bits_rs2_data),
    .io_op_datas_bits_imm(execute_io_op_datas_bits_imm),
    .io_op_datas_bits_pc(execute_io_op_datas_bits_pc),
    .io_op_datas_bits_dest_addr(execute_io_op_datas_bits_dest_addr),
    .io_op_datas_bits_dest_is_reg(execute_io_op_datas_bits_dest_is_reg),
    .io_op_datas_bits_is_pre(execute_io_op_datas_bits_is_pre),
    .io_op_datas_bits_csr_addr(execute_io_op_datas_bits_csr_addr),
    .io_op_datas_bits_csr_data(execute_io_op_datas_bits_csr_data),
    .io_irq_time_irq(execute_io_irq_time_irq),
    .io_irq_soft_irq(execute_io_irq_soft_irq),
    .io_mstatus(execute_io_mstatus),
    .io_mie(execute_io_mie),
    .io_mepc(execute_io_mepc),
    .io_mtvec(execute_io_mtvec),
    .io_wb_valid(execute_io_wb_valid),
    .io_wb_dest_addr(execute_io_wb_dest_addr),
    .io_wb_dest_data(execute_io_wb_dest_data),
    .io_csr_valid(execute_io_csr_valid),
    .io_csr_csr_addr(execute_io_csr_csr_addr),
    .io_csr_csr_data(execute_io_csr_csr_data),
    .io_csr_except_is_except(execute_io_csr_except_is_except),
    .io_csr_except_is_time_irq(execute_io_csr_except_is_time_irq),
    .io_csr_except_is_soft_irq(execute_io_csr_except_is_soft_irq),
    .io_csr_except_exception(execute_io_csr_except_exception),
    .io_csr_except_next_pc(execute_io_csr_except_next_pc),
    .io_csr_except_pc(execute_io_csr_except_pc),
    .io_commit(execute_io_commit),
    .io_next_pc(execute_io_next_pc),
    .io_flush(execute_io_flush),
    .io_fence_i(execute_io_fence_i),
    .io_br_info_valid(execute_io_br_info_valid),
    .io_br_info_mispredict(execute_io_br_info_mispredict),
    .io_br_info_br_pc(execute_io_br_info_br_pc),
    .io_br_info_taken(execute_io_br_info_taken),
    .io_br_info_target_next_pc(execute_io_br_info_target_next_pc),
    .io_br_info_br_type(execute_io_br_info_br_type),
    .io_get_pre_info_valid(execute_io_get_pre_info_valid),
    .io_get_pre_info_pre_next_pc(execute_io_get_pre_info_pre_next_pc),
    .io_dcache_cmd_ready(execute_io_dcache_cmd_ready),
    .io_dcache_cmd_valid(execute_io_dcache_cmd_valid),
    .io_dcache_cmd_bits_addr(execute_io_dcache_cmd_bits_addr),
    .io_dcache_cmd_bits_wdata(execute_io_dcache_cmd_bits_wdata),
    .io_dcache_cmd_bits_wstrb(execute_io_dcache_cmd_bits_wstrb),
    .io_dcache_cmd_bits_is_w(execute_io_dcache_cmd_bits_is_w),
    .io_dcache_cmd_bits_size(execute_io_dcache_cmd_bits_size),
    .io_dcache_cmd_bits_is_fence(execute_io_dcache_cmd_bits_is_fence),
    .io_dcache_cmd_bits_is_mmio(execute_io_dcache_cmd_bits_is_mmio),
    .io_dcahce_resp_valid(execute_io_dcahce_resp_valid),
    .io_dcahce_resp_bits_rdata(execute_io_dcahce_resp_bits_rdata),
    .io_dcahce_resp_bits_resp_info(execute_io_dcahce_resp_bits_resp_info)
  );
  ysyx_040318_Decode decode ( // @[core.scala 26:41]
    .clock(decode_clock),
    .reset(decode_reset),
    .io_get_inst_ready(decode_io_get_inst_ready),
    .io_get_inst_valid(decode_io_get_inst_valid),
    .io_get_inst_bits_inst(decode_io_get_inst_bits_inst),
    .io_get_inst_bits_pc(decode_io_get_inst_bits_pc),
    .io_get_inst_bits_is_pre(decode_io_get_inst_bits_is_pre),
    .io_normal_rd_rs1_addr(decode_io_normal_rd_rs1_addr),
    .io_normal_rd_rs1_data(decode_io_normal_rd_rs1_data),
    .io_normal_rd_rs2_addr(decode_io_normal_rd_rs2_addr),
    .io_normal_rd_rs2_data(decode_io_normal_rd_rs2_data),
    .io_csr_rd_csr_addr(decode_io_csr_rd_csr_addr),
    .io_csr_rd_csr_data(decode_io_csr_rd_csr_data),
    .io_op_datas_ready(decode_io_op_datas_ready),
    .io_op_datas_valid(decode_io_op_datas_valid),
    .io_op_datas_bits_opType(decode_io_op_datas_bits_opType),
    .io_op_datas_bits_exuType(decode_io_op_datas_bits_exuType),
    .io_op_datas_bits_rs1_addr(decode_io_op_datas_bits_rs1_addr),
    .io_op_datas_bits_rs1_data(decode_io_op_datas_bits_rs1_data),
    .io_op_datas_bits_rs2_addr(decode_io_op_datas_bits_rs2_addr),
    .io_op_datas_bits_rs2_data(decode_io_op_datas_bits_rs2_data),
    .io_op_datas_bits_imm(decode_io_op_datas_bits_imm),
    .io_op_datas_bits_pc(decode_io_op_datas_bits_pc),
    .io_op_datas_bits_dest_addr(decode_io_op_datas_bits_dest_addr),
    .io_op_datas_bits_dest_is_reg(decode_io_op_datas_bits_dest_is_reg),
    .io_op_datas_bits_is_pre(decode_io_op_datas_bits_is_pre),
    .io_op_datas_bits_csr_addr(decode_io_op_datas_bits_csr_addr),
    .io_op_datas_bits_csr_data(decode_io_op_datas_bits_csr_data),
    .io_flush(decode_io_flush)
  );
  ysyx_040318_Commit commit ( // @[core.scala 27:41]
    .clock(commit_clock),
    .reset(commit_reset),
    .io_normal_rd_rs1_addr(commit_io_normal_rd_rs1_addr),
    .io_normal_rd_rs1_data(commit_io_normal_rd_rs1_data),
    .io_normal_rd_rs2_addr(commit_io_normal_rd_rs2_addr),
    .io_normal_rd_rs2_data(commit_io_normal_rd_rs2_data),
    .io_normal_wb_valid(commit_io_normal_wb_valid),
    .io_normal_wb_dest_addr(commit_io_normal_wb_dest_addr),
    .io_normal_wb_dest_data(commit_io_normal_wb_dest_data),
    .io_csr_rd_csr_addr(commit_io_csr_rd_csr_addr),
    .io_csr_rd_csr_data(commit_io_csr_rd_csr_data),
    .io_csr_wb_valid(commit_io_csr_wb_valid),
    .io_csr_wb_csr_addr(commit_io_csr_wb_csr_addr),
    .io_csr_wb_csr_data(commit_io_csr_wb_csr_data),
    .io_csr_except_is_except(commit_io_csr_except_is_except),
    .io_csr_except_is_time_irq(commit_io_csr_except_is_time_irq),
    .io_csr_except_is_soft_irq(commit_io_csr_except_is_soft_irq),
    .io_csr_except_exception(commit_io_csr_except_exception),
    .io_csr_except_next_pc(commit_io_csr_except_next_pc),
    .io_csr_except_pc(commit_io_csr_except_pc),
    .io_csr_pass_csr_mtvec(commit_io_csr_pass_csr_mtvec),
    .io_csr_pass_csr_mepc(commit_io_csr_pass_csr_mepc),
    .io_csr_pass_csr_mstatus(commit_io_csr_pass_csr_mstatus),
    .io_csr_pass_csr_mie(commit_io_csr_pass_csr_mie),
    .io_commit(commit_io_commit)
  );
  ysyx_040318_Clint clint_de ( // @[core.scala 29:33]
    .clock(clint_de_clock),
    .reset(clint_de_reset),
    .io_bus_valid(clint_de_io_bus_valid),
    .io_bus_bits_addr(clint_de_io_bus_bits_addr),
    .io_bus_bits_wdata(clint_de_io_bus_bits_wdata),
    .io_bus_bits_rdata(clint_de_io_bus_bits_rdata),
    .io_bus_bits_is_w(clint_de_io_bus_bits_is_w),
    .io_bus_ready(clint_de_io_bus_ready),
    .io_soft_irq(clint_de_io_soft_irq),
    .io_time_irq(clint_de_io_time_irq)
  );
  assign io_axi_bus_aw_valid = cross_bar_io_AXI_Bus_aw_valid; // @[core.scala 72:25]
  assign io_axi_bus_aw_bits_awaddr = cross_bar_io_AXI_Bus_aw_bits_awaddr; // @[core.scala 72:25]
  assign io_axi_bus_aw_bits_awlen = cross_bar_io_AXI_Bus_aw_bits_awlen; // @[core.scala 72:25]
  assign io_axi_bus_aw_bits_awsize = cross_bar_io_AXI_Bus_aw_bits_awsize; // @[core.scala 72:25]
  assign io_axi_bus_w_valid = cross_bar_io_AXI_Bus_w_valid; // @[core.scala 72:25]
  assign io_axi_bus_w_bits_wdata = cross_bar_io_AXI_Bus_w_bits_wdata; // @[core.scala 72:25]
  assign io_axi_bus_w_bits_wstrb = cross_bar_io_AXI_Bus_w_bits_wstrb; // @[core.scala 72:25]
  assign io_axi_bus_w_bits_wlast = cross_bar_io_AXI_Bus_w_bits_wlast; // @[core.scala 72:25]
  assign io_axi_bus_ar_valid = cross_bar_io_AXI_Bus_ar_valid; // @[core.scala 72:25]
  assign io_axi_bus_ar_bits_araddr = cross_bar_io_AXI_Bus_ar_bits_araddr; // @[core.scala 72:25]
  assign io_axi_bus_ar_bits_arlen = cross_bar_io_AXI_Bus_ar_bits_arlen; // @[core.scala 72:25]
  assign io_axi_bus_ar_bits_arsize = cross_bar_io_AXI_Bus_ar_bits_arsize; // @[core.scala 72:25]
  assign io_isram_addr = i_cache_io_sram_addr; // @[core.scala 73:18]
  assign io_isram_wen_0 = i_cache_io_sram_wen_0; // @[core.scala 73:18]
  assign io_isram_wen_1 = i_cache_io_sram_wen_1; // @[core.scala 73:18]
  assign io_isram_tag_wdata = i_cache_io_sram_tag_wdata; // @[core.scala 73:18]
  assign io_isram_data_wdata = i_cache_io_sram_data_wdata; // @[core.scala 73:18]
  assign io_dsram_addr = d_cache_io_sram_addr; // @[core.scala 74:18]
  assign io_dsram_wen_0 = d_cache_io_sram_wen_0; // @[core.scala 74:18]
  assign io_dsram_wen_1 = d_cache_io_sram_wen_1; // @[core.scala 74:18]
  assign io_dsram_data_wmask = d_cache_io_sram_data_wmask; // @[core.scala 74:18]
  assign io_dsram_tag_wdata = d_cache_io_sram_tag_wdata; // @[core.scala 74:18]
  assign io_dsram_data_wdata = d_cache_io_sram_data_wdata; // @[core.scala 74:18]
  assign i_cache_clock = clock;
  assign i_cache_reset = reset;
  assign i_cache_io_flush = execute_io_flush; // @[core.scala 60:35]
  assign i_cache_io_fence_i = execute_io_fence_i; // @[core.scala 59:28]
  assign i_cache_io_cpu_addr_valid = fetch_io_cpu_addr_valid; // @[core.scala 61:29]
  assign i_cache_io_cpu_addr_bits_addr = fetch_io_cpu_addr_bits_addr; // @[core.scala 61:29]
  assign i_cache_io_cpu_rdata_ready = fetch_io_cpu_data_ready; // @[core.scala 62:30]
  assign i_cache_io_sram_rdata_0 = io_isram_rdata_0; // @[core.scala 73:18]
  assign i_cache_io_sram_rdata_1 = io_isram_rdata_1; // @[core.scala 73:18]
  assign i_cache_io_sram_rdata_2 = io_isram_rdata_2; // @[core.scala 73:18]
  assign i_cache_io_sram_rdata_3 = io_isram_rdata_3; // @[core.scala 73:18]
  assign i_cache_io_cache_bus_r_bits_rdata = cross_bar_io_ICache_bus_r_bits_rdata; // @[core.scala 70:33]
  assign i_cache_io_cache_bus_r_bits_rlast = cross_bar_io_ICache_bus_r_bits_rlast; // @[core.scala 70:33]
  assign i_cache_io_cache_bus_r_ready = cross_bar_io_ICache_bus_r_ready; // @[core.scala 70:33]
  assign d_cache_clock = clock;
  assign d_cache_reset = reset;
  assign d_cache_io_dcache_cmd_valid = execute_io_dcache_cmd_valid; // @[core.scala 64:31]
  assign d_cache_io_dcache_cmd_bits_addr = execute_io_dcache_cmd_bits_addr; // @[core.scala 64:31]
  assign d_cache_io_dcache_cmd_bits_wdata = execute_io_dcache_cmd_bits_wdata; // @[core.scala 64:31]
  assign d_cache_io_dcache_cmd_bits_wstrb = execute_io_dcache_cmd_bits_wstrb; // @[core.scala 64:31]
  assign d_cache_io_dcache_cmd_bits_is_w = execute_io_dcache_cmd_bits_is_w; // @[core.scala 64:31]
  assign d_cache_io_dcache_cmd_bits_size = execute_io_dcache_cmd_bits_size; // @[core.scala 64:31]
  assign d_cache_io_dcache_cmd_bits_is_fence = execute_io_dcache_cmd_bits_is_fence; // @[core.scala 64:31]
  assign d_cache_io_dcache_cmd_bits_is_mmio = execute_io_dcache_cmd_bits_is_mmio; // @[core.scala 64:31]
  assign d_cache_io_sram_rdata_0 = io_dsram_rdata_0; // @[core.scala 74:18]
  assign d_cache_io_sram_rdata_1 = io_dsram_rdata_1; // @[core.scala 74:18]
  assign d_cache_io_sram_rdata_2 = io_dsram_rdata_2; // @[core.scala 74:18]
  assign d_cache_io_sram_rdata_3 = io_dsram_rdata_3; // @[core.scala 74:18]
  assign d_cache_io_clint_bits_rdata = clint_de_io_bus_bits_rdata; // @[core.scala 67:25]
  assign d_cache_io_clint_ready = clint_de_io_bus_ready; // @[core.scala 67:25]
  assign d_cache_io_cache_bus_w_ready = cross_bar_io_DCache_bus_w_ready; // @[core.scala 71:33]
  assign d_cache_io_cache_bus_b_valid = cross_bar_io_DCache_bus_b_valid; // @[core.scala 71:33]
  assign d_cache_io_cache_bus_r_bits_rdata = cross_bar_io_DCache_bus_r_bits_rdata; // @[core.scala 71:33]
  assign d_cache_io_cache_bus_r_bits_rlast = cross_bar_io_DCache_bus_r_bits_rlast; // @[core.scala 71:33]
  assign d_cache_io_cache_bus_r_ready = cross_bar_io_DCache_bus_r_ready; // @[core.scala 71:33]
  assign cross_bar_clock = clock;
  assign cross_bar_reset = reset;
  assign cross_bar_io_ICache_bus_r_valid = i_cache_io_cache_bus_r_valid; // @[core.scala 70:33]
  assign cross_bar_io_ICache_bus_r_bits_raddr = i_cache_io_cache_bus_r_bits_raddr; // @[core.scala 70:33]
  assign cross_bar_io_ICache_bus_r_bits_rlen = i_cache_io_cache_bus_r_bits_rlen; // @[core.scala 70:33]
  assign cross_bar_io_ICache_bus_r_bits_rsize = i_cache_io_cache_bus_r_bits_rsize; // @[core.scala 70:33]
  assign cross_bar_io_DCache_bus_w_valid = d_cache_io_cache_bus_w_valid; // @[core.scala 71:33]
  assign cross_bar_io_DCache_bus_w_bits_waddr = d_cache_io_cache_bus_w_bits_waddr; // @[core.scala 71:33]
  assign cross_bar_io_DCache_bus_w_bits_wdata = d_cache_io_cache_bus_w_bits_wdata; // @[core.scala 71:33]
  assign cross_bar_io_DCache_bus_w_bits_wlast = d_cache_io_cache_bus_w_bits_wlast; // @[core.scala 71:33]
  assign cross_bar_io_DCache_bus_w_bits_wlen = d_cache_io_cache_bus_w_bits_wlen; // @[core.scala 71:33]
  assign cross_bar_io_DCache_bus_w_bits_wsize = d_cache_io_cache_bus_w_bits_wsize; // @[core.scala 71:33]
  assign cross_bar_io_DCache_bus_w_bits_wstrb = d_cache_io_cache_bus_w_bits_wstrb; // @[core.scala 71:33]
  assign cross_bar_io_DCache_bus_r_valid = d_cache_io_cache_bus_r_valid; // @[core.scala 71:33]
  assign cross_bar_io_DCache_bus_r_bits_raddr = d_cache_io_cache_bus_r_bits_raddr; // @[core.scala 71:33]
  assign cross_bar_io_DCache_bus_r_bits_rlen = d_cache_io_cache_bus_r_bits_rlen; // @[core.scala 71:33]
  assign cross_bar_io_DCache_bus_r_bits_rsize = d_cache_io_cache_bus_r_bits_rsize; // @[core.scala 71:33]
  assign cross_bar_io_AXI_Bus_aw_ready = io_axi_bus_aw_ready; // @[core.scala 72:25]
  assign cross_bar_io_AXI_Bus_w_ready = io_axi_bus_w_ready; // @[core.scala 72:25]
  assign cross_bar_io_AXI_Bus_b_valid = io_axi_bus_b_valid; // @[core.scala 72:25]
  assign cross_bar_io_AXI_Bus_b_bits_bid = io_axi_bus_b_bits_bid; // @[core.scala 72:25]
  assign cross_bar_io_AXI_Bus_ar_ready = io_axi_bus_ar_ready; // @[core.scala 72:25]
  assign cross_bar_io_AXI_Bus_r_valid = io_axi_bus_r_valid; // @[core.scala 72:25]
  assign cross_bar_io_AXI_Bus_r_bits_rid = io_axi_bus_r_bits_rid; // @[core.scala 72:25]
  assign cross_bar_io_AXI_Bus_r_bits_rdata = io_axi_bus_r_bits_rdata; // @[core.scala 72:25]
  assign cross_bar_io_AXI_Bus_r_bits_rlast = io_axi_bus_r_bits_rlast; // @[core.scala 72:25]
  assign fetch_clock = clock;
  assign fetch_reset = reset;
  assign fetch_io_br_info_valid = execute_io_br_info_valid; // @[core.scala 34:26]
  assign fetch_io_br_info_mispredict = execute_io_br_info_mispredict; // @[core.scala 34:26]
  assign fetch_io_br_info_br_pc = execute_io_br_info_br_pc; // @[core.scala 34:26]
  assign fetch_io_br_info_taken = execute_io_br_info_taken; // @[core.scala 34:26]
  assign fetch_io_br_info_target_next_pc = execute_io_br_info_target_next_pc; // @[core.scala 34:26]
  assign fetch_io_br_info_br_type = execute_io_br_info_br_type; // @[core.scala 34:26]
  assign fetch_io_get_pre_info_valid = execute_io_get_pre_info_valid; // @[core.scala 33:31]
  assign fetch_io_next_pc = execute_io_next_pc; // @[core.scala 31:49]
  assign fetch_io_flush = execute_io_flush; // @[core.scala 32:49]
  assign fetch_io_cpu_addr_ready = i_cache_io_cpu_addr_ready; // @[core.scala 61:29]
  assign fetch_io_cpu_data_valid = i_cache_io_cpu_rdata_valid; // @[core.scala 62:30]
  assign fetch_io_cpu_data_bits_data = i_cache_io_cpu_rdata_bits_data; // @[core.scala 62:30]
  assign fetch_io_cpu_data_bits_pc = i_cache_io_cpu_rdata_bits_pc; // @[core.scala 62:30]
  assign fetch_io_put_pc_ready = decode_io_get_inst_ready; // @[core.scala 35:25]
  assign execute_clock = clock;
  assign execute_reset = reset;
  assign execute_io_op_datas_valid = decode_io_op_datas_valid; // @[core.scala 41:29]
  assign execute_io_op_datas_bits_opType = decode_io_op_datas_bits_opType; // @[core.scala 41:29]
  assign execute_io_op_datas_bits_exuType = decode_io_op_datas_bits_exuType; // @[core.scala 41:29]
  assign execute_io_op_datas_bits_rs1_addr = decode_io_op_datas_bits_rs1_addr; // @[core.scala 41:29]
  assign execute_io_op_datas_bits_rs1_data = decode_io_op_datas_bits_rs1_data; // @[core.scala 41:29]
  assign execute_io_op_datas_bits_rs2_addr = decode_io_op_datas_bits_rs2_addr; // @[core.scala 41:29]
  assign execute_io_op_datas_bits_rs2_data = decode_io_op_datas_bits_rs2_data; // @[core.scala 41:29]
  assign execute_io_op_datas_bits_imm = decode_io_op_datas_bits_imm; // @[core.scala 41:29]
  assign execute_io_op_datas_bits_pc = decode_io_op_datas_bits_pc; // @[core.scala 41:29]
  assign execute_io_op_datas_bits_dest_addr = decode_io_op_datas_bits_dest_addr; // @[core.scala 41:29]
  assign execute_io_op_datas_bits_dest_is_reg = decode_io_op_datas_bits_dest_is_reg; // @[core.scala 41:29]
  assign execute_io_op_datas_bits_is_pre = decode_io_op_datas_bits_is_pre; // @[core.scala 41:29]
  assign execute_io_op_datas_bits_csr_addr = decode_io_op_datas_bits_csr_addr; // @[core.scala 41:29]
  assign execute_io_op_datas_bits_csr_data = decode_io_op_datas_bits_csr_data; // @[core.scala 41:29]
  assign execute_io_irq_time_irq = clint_de_io_time_irq; // @[core.scala 43:41]
  assign execute_io_irq_soft_irq = clint_de_io_soft_irq; // @[core.scala 44:41]
  assign execute_io_mstatus = commit_io_csr_pass_csr_mstatus; // @[core.scala 45:49]
  assign execute_io_mie = commit_io_csr_pass_csr_mie; // @[core.scala 46:49]
  assign execute_io_mepc = commit_io_csr_pass_csr_mepc; // @[core.scala 47:49]
  assign execute_io_mtvec = commit_io_csr_pass_csr_mtvec; // @[core.scala 48:49]
  assign execute_io_get_pre_info_pre_next_pc = fetch_io_get_pre_info_pre_next_pc; // @[core.scala 33:31]
  assign execute_io_dcache_cmd_ready = d_cache_io_dcache_cmd_ready; // @[core.scala 64:31]
  assign execute_io_dcahce_resp_valid = d_cache_io_dcahce_resp_valid; // @[core.scala 65:32]
  assign execute_io_dcahce_resp_bits_rdata = d_cache_io_dcahce_resp_bits_rdata; // @[core.scala 65:32]
  assign execute_io_dcahce_resp_bits_resp_info = d_cache_io_dcahce_resp_bits_resp_info; // @[core.scala 65:32]
  assign decode_clock = clock;
  assign decode_reset = reset;
  assign decode_io_get_inst_valid = fetch_io_put_pc_valid; // @[core.scala 35:25]
  assign decode_io_get_inst_bits_inst = fetch_io_put_pc_bits_inst; // @[core.scala 35:25]
  assign decode_io_get_inst_bits_pc = fetch_io_put_pc_bits_pc; // @[core.scala 35:25]
  assign decode_io_get_inst_bits_is_pre = fetch_io_put_pc_bits_is_pre; // @[core.scala 35:25]
  assign decode_io_normal_rd_rs1_data = commit_io_normal_rd_rs1_data; // @[core.scala 38:29]
  assign decode_io_normal_rd_rs2_data = commit_io_normal_rd_rs2_data; // @[core.scala 38:29]
  assign decode_io_csr_rd_csr_data = commit_io_csr_rd_csr_data; // @[core.scala 39:33]
  assign decode_io_op_datas_ready = execute_io_op_datas_ready; // @[core.scala 41:29]
  assign decode_io_flush = execute_io_flush; // @[core.scala 37:49]
  assign commit_clock = clock;
  assign commit_reset = reset;
  assign commit_io_normal_rd_rs1_addr = decode_io_normal_rd_rs1_addr; // @[core.scala 38:29]
  assign commit_io_normal_rd_rs2_addr = decode_io_normal_rd_rs2_addr; // @[core.scala 38:29]
  assign commit_io_normal_wb_valid = execute_io_wb_valid; // @[core.scala 50:57]
  assign commit_io_normal_wb_dest_addr = execute_io_wb_dest_addr; // @[core.scala 50:57]
  assign commit_io_normal_wb_dest_data = execute_io_wb_dest_data; // @[core.scala 50:57]
  assign commit_io_csr_rd_csr_addr = decode_io_csr_rd_csr_addr; // @[core.scala 39:33]
  assign commit_io_csr_wb_valid = execute_io_csr_valid; // @[core.scala 51:57]
  assign commit_io_csr_wb_csr_addr = execute_io_csr_csr_addr; // @[core.scala 51:57]
  assign commit_io_csr_wb_csr_data = execute_io_csr_csr_data; // @[core.scala 51:57]
  assign commit_io_csr_except_is_except = execute_io_csr_except_is_except; // @[core.scala 52:49]
  assign commit_io_csr_except_is_time_irq = execute_io_csr_except_is_time_irq; // @[core.scala 52:49]
  assign commit_io_csr_except_is_soft_irq = execute_io_csr_except_is_soft_irq; // @[core.scala 52:49]
  assign commit_io_csr_except_exception = execute_io_csr_except_exception; // @[core.scala 52:49]
  assign commit_io_csr_except_next_pc = execute_io_csr_except_next_pc; // @[core.scala 52:49]
  assign commit_io_csr_except_pc = execute_io_csr_except_pc; // @[core.scala 52:49]
  assign commit_io_commit = execute_io_commit; // @[core.scala 53:57]
  assign clint_de_clock = clock;
  assign clint_de_reset = reset;
  assign clint_de_io_bus_valid = d_cache_io_clint_valid; // @[core.scala 67:25]
  assign clint_de_io_bus_bits_addr = d_cache_io_clint_bits_addr; // @[core.scala 67:25]
  assign clint_de_io_bus_bits_wdata = d_cache_io_clint_bits_wdata; // @[core.scala 67:25]
  assign clint_de_io_bus_bits_is_w = d_cache_io_clint_bits_is_w; // @[core.scala 67:25]
endmodule
module ysyx_040318(
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
  wire  core_clock; // @[ysyx_040318.scala 64:26]
  wire  core_reset; // @[ysyx_040318.scala 64:26]
  wire  core_io_axi_bus_aw_ready; // @[ysyx_040318.scala 64:26]
  wire  core_io_axi_bus_aw_valid; // @[ysyx_040318.scala 64:26]
  wire [63:0] core_io_axi_bus_aw_bits_awaddr; // @[ysyx_040318.scala 64:26]
  wire [7:0] core_io_axi_bus_aw_bits_awlen; // @[ysyx_040318.scala 64:26]
  wire [2:0] core_io_axi_bus_aw_bits_awsize; // @[ysyx_040318.scala 64:26]
  wire  core_io_axi_bus_w_ready; // @[ysyx_040318.scala 64:26]
  wire  core_io_axi_bus_w_valid; // @[ysyx_040318.scala 64:26]
  wire [63:0] core_io_axi_bus_w_bits_wdata; // @[ysyx_040318.scala 64:26]
  wire [7:0] core_io_axi_bus_w_bits_wstrb; // @[ysyx_040318.scala 64:26]
  wire  core_io_axi_bus_w_bits_wlast; // @[ysyx_040318.scala 64:26]
  wire  core_io_axi_bus_b_valid; // @[ysyx_040318.scala 64:26]
  wire [3:0] core_io_axi_bus_b_bits_bid; // @[ysyx_040318.scala 64:26]
  wire  core_io_axi_bus_ar_ready; // @[ysyx_040318.scala 64:26]
  wire  core_io_axi_bus_ar_valid; // @[ysyx_040318.scala 64:26]
  wire [63:0] core_io_axi_bus_ar_bits_araddr; // @[ysyx_040318.scala 64:26]
  wire [7:0] core_io_axi_bus_ar_bits_arlen; // @[ysyx_040318.scala 64:26]
  wire [2:0] core_io_axi_bus_ar_bits_arsize; // @[ysyx_040318.scala 64:26]
  wire  core_io_axi_bus_r_valid; // @[ysyx_040318.scala 64:26]
  wire [3:0] core_io_axi_bus_r_bits_rid; // @[ysyx_040318.scala 64:26]
  wire [63:0] core_io_axi_bus_r_bits_rdata; // @[ysyx_040318.scala 64:26]
  wire  core_io_axi_bus_r_bits_rlast; // @[ysyx_040318.scala 64:26]
  wire [5:0] core_io_isram_addr; // @[ysyx_040318.scala 64:26]
  wire  core_io_isram_wen_0; // @[ysyx_040318.scala 64:26]
  wire  core_io_isram_wen_1; // @[ysyx_040318.scala 64:26]
  wire [127:0] core_io_isram_tag_wdata; // @[ysyx_040318.scala 64:26]
  wire [127:0] core_io_isram_data_wdata; // @[ysyx_040318.scala 64:26]
  wire [127:0] core_io_isram_rdata_0; // @[ysyx_040318.scala 64:26]
  wire [127:0] core_io_isram_rdata_1; // @[ysyx_040318.scala 64:26]
  wire [127:0] core_io_isram_rdata_2; // @[ysyx_040318.scala 64:26]
  wire [127:0] core_io_isram_rdata_3; // @[ysyx_040318.scala 64:26]
  wire [5:0] core_io_dsram_addr; // @[ysyx_040318.scala 64:26]
  wire  core_io_dsram_wen_0; // @[ysyx_040318.scala 64:26]
  wire  core_io_dsram_wen_1; // @[ysyx_040318.scala 64:26]
  wire [127:0] core_io_dsram_data_wmask; // @[ysyx_040318.scala 64:26]
  wire [127:0] core_io_dsram_tag_wdata; // @[ysyx_040318.scala 64:26]
  wire [127:0] core_io_dsram_data_wdata; // @[ysyx_040318.scala 64:26]
  wire [127:0] core_io_dsram_rdata_0; // @[ysyx_040318.scala 64:26]
  wire [127:0] core_io_dsram_rdata_1; // @[ysyx_040318.scala 64:26]
  wire [127:0] core_io_dsram_rdata_2; // @[ysyx_040318.scala 64:26]
  wire [127:0] core_io_dsram_rdata_3; // @[ysyx_040318.scala 64:26]
  ysyx_040318_Core core ( // @[ysyx_040318.scala 64:26]
    .clock(core_clock),
    .reset(core_reset),
    .io_axi_bus_aw_ready(core_io_axi_bus_aw_ready),
    .io_axi_bus_aw_valid(core_io_axi_bus_aw_valid),
    .io_axi_bus_aw_bits_awaddr(core_io_axi_bus_aw_bits_awaddr),
    .io_axi_bus_aw_bits_awlen(core_io_axi_bus_aw_bits_awlen),
    .io_axi_bus_aw_bits_awsize(core_io_axi_bus_aw_bits_awsize),
    .io_axi_bus_w_ready(core_io_axi_bus_w_ready),
    .io_axi_bus_w_valid(core_io_axi_bus_w_valid),
    .io_axi_bus_w_bits_wdata(core_io_axi_bus_w_bits_wdata),
    .io_axi_bus_w_bits_wstrb(core_io_axi_bus_w_bits_wstrb),
    .io_axi_bus_w_bits_wlast(core_io_axi_bus_w_bits_wlast),
    .io_axi_bus_b_valid(core_io_axi_bus_b_valid),
    .io_axi_bus_b_bits_bid(core_io_axi_bus_b_bits_bid),
    .io_axi_bus_ar_ready(core_io_axi_bus_ar_ready),
    .io_axi_bus_ar_valid(core_io_axi_bus_ar_valid),
    .io_axi_bus_ar_bits_araddr(core_io_axi_bus_ar_bits_araddr),
    .io_axi_bus_ar_bits_arlen(core_io_axi_bus_ar_bits_arlen),
    .io_axi_bus_ar_bits_arsize(core_io_axi_bus_ar_bits_arsize),
    .io_axi_bus_r_valid(core_io_axi_bus_r_valid),
    .io_axi_bus_r_bits_rid(core_io_axi_bus_r_bits_rid),
    .io_axi_bus_r_bits_rdata(core_io_axi_bus_r_bits_rdata),
    .io_axi_bus_r_bits_rlast(core_io_axi_bus_r_bits_rlast),
    .io_isram_addr(core_io_isram_addr),
    .io_isram_wen_0(core_io_isram_wen_0),
    .io_isram_wen_1(core_io_isram_wen_1),
    .io_isram_tag_wdata(core_io_isram_tag_wdata),
    .io_isram_data_wdata(core_io_isram_data_wdata),
    .io_isram_rdata_0(core_io_isram_rdata_0),
    .io_isram_rdata_1(core_io_isram_rdata_1),
    .io_isram_rdata_2(core_io_isram_rdata_2),
    .io_isram_rdata_3(core_io_isram_rdata_3),
    .io_dsram_addr(core_io_dsram_addr),
    .io_dsram_wen_0(core_io_dsram_wen_0),
    .io_dsram_wen_1(core_io_dsram_wen_1),
    .io_dsram_data_wmask(core_io_dsram_data_wmask),
    .io_dsram_tag_wdata(core_io_dsram_tag_wdata),
    .io_dsram_data_wdata(core_io_dsram_data_wdata),
    .io_dsram_rdata_0(core_io_dsram_rdata_0),
    .io_dsram_rdata_1(core_io_dsram_rdata_1),
    .io_dsram_rdata_2(core_io_dsram_rdata_2),
    .io_dsram_rdata_3(core_io_dsram_rdata_3)
  );
  assign io_master_awvalid = core_io_axi_bus_aw_valid; // @[ysyx_040318.scala 66:33]
  assign io_master_awid = 4'h0; // @[ysyx_040318.scala 67:33]
  assign io_master_awaddr = core_io_axi_bus_aw_bits_awaddr[31:0]; // @[ysyx_040318.scala 68:33]
  assign io_master_awlen = core_io_axi_bus_aw_bits_awlen; // @[ysyx_040318.scala 69:33]
  assign io_master_awsize = core_io_axi_bus_aw_bits_awsize; // @[ysyx_040318.scala 70:33]
  assign io_master_awburst = 2'h1; // @[ysyx_040318.scala 71:33]
  assign io_master_wvalid = core_io_axi_bus_w_valid; // @[ysyx_040318.scala 74:33]
  assign io_master_wdata = core_io_axi_bus_w_bits_wdata; // @[ysyx_040318.scala 75:33]
  assign io_master_wstrb = core_io_axi_bus_w_bits_wstrb; // @[ysyx_040318.scala 76:33]
  assign io_master_wlast = core_io_axi_bus_w_bits_wlast; // @[ysyx_040318.scala 77:33]
  assign io_master_bready = 1'h1; // @[ysyx_040318.scala 79:33]
  assign io_master_arvalid = core_io_axi_bus_ar_valid; // @[ysyx_040318.scala 85:33]
  assign io_master_arid = 4'h0; // @[ysyx_040318.scala 86:33]
  assign io_master_araddr = core_io_axi_bus_ar_bits_araddr[31:0]; // @[ysyx_040318.scala 87:33]
  assign io_master_arlen = core_io_axi_bus_ar_bits_arlen; // @[ysyx_040318.scala 88:33]
  assign io_master_arsize = core_io_axi_bus_ar_bits_arsize; // @[ysyx_040318.scala 89:33]
  assign io_master_arburst = 2'h1; // @[ysyx_040318.scala 90:33]
  assign io_master_rready = 1'h1; // @[ysyx_040318.scala 92:33]
  assign io_slave_awready = 1'h0; // @[ysyx_040318.scala 99:26]
  assign io_slave_wready = 1'h0; // @[ysyx_040318.scala 107:25]
  assign io_slave_bvalid = 1'h0; // @[ysyx_040318.scala 114:25]
  assign io_slave_bid = 4'h0; // @[ysyx_040318.scala 115:25]
  assign io_slave_bresp = 2'h0; // @[ysyx_040318.scala 116:25]
  assign io_slave_arready = 1'h0; // @[ysyx_040318.scala 118:26]
  assign io_slave_rvalid = 1'h0; // @[ysyx_040318.scala 127:25]
  assign io_slave_rid = 4'h0; // @[ysyx_040318.scala 128:25]
  assign io_slave_rresp = 2'h0; // @[ysyx_040318.scala 129:25]
  assign io_slave_rdata = 64'h0; // @[ysyx_040318.scala 130:25]
  assign io_slave_rlast = 1'h0; // @[ysyx_040318.scala 131:25]
  assign io_sram0_addr = core_io_isram_addr; // @[ysyx_040318.scala 139:23]
  assign io_sram0_cen = 1'h0; // @[ysyx_040318.scala 140:23]
  assign io_sram0_wen = core_io_isram_wen_0; // @[ysyx_040318.scala 148:23]
  assign io_sram0_wmask = 128'h0; // @[ysyx_040318.scala 149:24]
  assign io_sram0_wdata = core_io_isram_data_wdata; // @[ysyx_040318.scala 150:24]
  assign io_sram1_addr = core_io_isram_addr; // @[ysyx_040318.scala 141:23]
  assign io_sram1_cen = 1'h0; // @[ysyx_040318.scala 142:23]
  assign io_sram1_wen = core_io_isram_wen_0; // @[ysyx_040318.scala 151:23]
  assign io_sram1_wmask = 128'h0; // @[ysyx_040318.scala 152:24]
  assign io_sram1_wdata = core_io_isram_tag_wdata; // @[ysyx_040318.scala 153:24]
  assign io_sram2_addr = core_io_isram_addr; // @[ysyx_040318.scala 143:23]
  assign io_sram2_cen = 1'h0; // @[ysyx_040318.scala 144:23]
  assign io_sram2_wen = core_io_isram_wen_1; // @[ysyx_040318.scala 155:23]
  assign io_sram2_wmask = 128'h0; // @[ysyx_040318.scala 156:24]
  assign io_sram2_wdata = core_io_isram_data_wdata; // @[ysyx_040318.scala 157:24]
  assign io_sram3_addr = core_io_isram_addr; // @[ysyx_040318.scala 145:23]
  assign io_sram3_cen = 1'h0; // @[ysyx_040318.scala 146:23]
  assign io_sram3_wen = core_io_isram_wen_1; // @[ysyx_040318.scala 158:23]
  assign io_sram3_wmask = 128'h0; // @[ysyx_040318.scala 159:24]
  assign io_sram3_wdata = core_io_isram_tag_wdata; // @[ysyx_040318.scala 160:24]
  assign io_sram4_addr = core_io_dsram_addr; // @[ysyx_040318.scala 168:23]
  assign io_sram4_cen = 1'h0; // @[ysyx_040318.scala 169:23]
  assign io_sram4_wen = core_io_dsram_wen_0; // @[ysyx_040318.scala 177:25]
  assign io_sram4_wmask = core_io_dsram_data_wmask; // @[ysyx_040318.scala 178:25]
  assign io_sram4_wdata = core_io_dsram_data_wdata; // @[ysyx_040318.scala 179:25]
  assign io_sram5_addr = core_io_dsram_addr; // @[ysyx_040318.scala 170:23]
  assign io_sram5_cen = 1'h0; // @[ysyx_040318.scala 171:23]
  assign io_sram5_wen = core_io_dsram_wen_0; // @[ysyx_040318.scala 180:25]
  assign io_sram5_wmask = 128'h0; // @[ysyx_040318.scala 181:25]
  assign io_sram5_wdata = core_io_dsram_tag_wdata; // @[ysyx_040318.scala 182:25]
  assign io_sram6_addr = core_io_dsram_addr; // @[ysyx_040318.scala 172:23]
  assign io_sram6_cen = 1'h0; // @[ysyx_040318.scala 173:23]
  assign io_sram6_wen = core_io_dsram_wen_1; // @[ysyx_040318.scala 184:23]
  assign io_sram6_wmask = core_io_dsram_data_wmask; // @[ysyx_040318.scala 185:24]
  assign io_sram6_wdata = core_io_dsram_data_wdata; // @[ysyx_040318.scala 186:24]
  assign io_sram7_addr = core_io_dsram_addr; // @[ysyx_040318.scala 174:23]
  assign io_sram7_cen = 1'h0; // @[ysyx_040318.scala 175:23]
  assign io_sram7_wen = core_io_dsram_wen_1; // @[ysyx_040318.scala 187:23]
  assign io_sram7_wmask = 128'h0; // @[ysyx_040318.scala 188:24]
  assign io_sram7_wdata = core_io_dsram_tag_wdata; // @[ysyx_040318.scala 189:24]
  assign core_clock = clock;
  assign core_reset = reset;
  assign core_io_axi_bus_aw_ready = io_master_awready; // @[ysyx_040318.scala 65:41]
  assign core_io_axi_bus_w_ready = io_master_wready; // @[ysyx_040318.scala 73:33]
  assign core_io_axi_bus_b_valid = io_master_bvalid; // @[ysyx_040318.scala 80:49]
  assign core_io_axi_bus_b_bits_bid = io_master_bid; // @[ysyx_040318.scala 81:49]
  assign core_io_axi_bus_ar_ready = io_master_arready; // @[ysyx_040318.scala 84:41]
  assign core_io_axi_bus_r_valid = io_master_rvalid; // @[ysyx_040318.scala 93:41]
  assign core_io_axi_bus_r_bits_rid = io_master_rid; // @[ysyx_040318.scala 94:41]
  assign core_io_axi_bus_r_bits_rdata = io_master_rdata; // @[ysyx_040318.scala 96:41]
  assign core_io_axi_bus_r_bits_rlast = io_master_rlast; // @[ysyx_040318.scala 97:41]
  assign core_io_isram_rdata_0 = io_sram0_rdata; // @[ysyx_040318.scala 134:32]
  assign core_io_isram_rdata_1 = io_sram1_rdata; // @[ysyx_040318.scala 135:32]
  assign core_io_isram_rdata_2 = io_sram2_rdata; // @[ysyx_040318.scala 136:32]
  assign core_io_isram_rdata_3 = io_sram3_rdata; // @[ysyx_040318.scala 137:32]
  assign core_io_dsram_rdata_0 = io_sram4_rdata; // @[ysyx_040318.scala 163:32]
  assign core_io_dsram_rdata_1 = io_sram5_rdata; // @[ysyx_040318.scala 164:32]
  assign core_io_dsram_rdata_2 = io_sram6_rdata; // @[ysyx_040318.scala 165:32]
  assign core_io_dsram_rdata_3 = io_sram7_rdata; // @[ysyx_040318.scala 166:32]
endmodule
