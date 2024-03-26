module ysyx_040163 (
  input clock,
  input reset,
  input io_interrupt,

  input         io_master_awready,
  output        io_master_awvalid,
  output  [3:0] io_master_awid,
  output [31:0] io_master_awaddr,
  output  [7:0] io_master_awlen,
  output  [2:0] io_master_awsize,
  output  [1:0] io_master_awburst,

  input         io_master_wready,
  output        io_master_wvalid,
  output [63:0] io_master_wdata,
  output  [7:0] io_master_wstrb,
  output        io_master_wlast,

  output      io_master_bready,
  input       io_master_bvalid,
  input [3:0] io_master_bid,
  input [1:0] io_master_bresp,

  input         io_master_arready,
  output        io_master_arvalid,
  output  [3:0] io_master_arid,
  output [31:0] io_master_araddr,
  output  [7:0] io_master_arlen,
  output  [2:0] io_master_arsize,
  output  [1:0] io_master_arburst,

  output       io_master_rready,
  input        io_master_rvalid,
  input  [3:0] io_master_rid,
  input  [1:0] io_master_rresp,
  input [63:0] io_master_rdata,
  input        io_master_rlast,

  output       io_slave_awready,
  input        io_slave_awvalid,
  input [31:0] io_slave_awaddr,
  input  [3:0] io_slave_awid,
  input  [7:0] io_slave_awlen,
  input  [2:0] io_slave_awsize,
  input  [1:0] io_slave_awburst,

  output       io_slave_wready,
  input        io_slave_wvalid,
  input [63:0] io_slave_wdata,
  input  [7:0] io_slave_wstrb,
  input        io_slave_wlast,

  input        io_slave_bready,
  output       io_slave_bvalid,
  output [1:0] io_slave_bresp,
  output [3:0] io_slave_bid,

  output       io_slave_arready,
  input        io_slave_arvalid,
  input [31:0] io_slave_araddr,
  input  [3:0] io_slave_arid,
  input  [7:0] io_slave_arlen,
  input  [2:0] io_slave_arsize,
  input  [1:0] io_slave_arburst,

  input         io_slave_rready,
  output        io_slave_rvalid,
  output  [1:0] io_slave_rresp,
  output [63:0] io_slave_rdata,
  output        io_slave_rlast,
  output  [3:0] io_slave_rid,

  output   [5:0] io_sram0_addr,
  output         io_sram0_cen,
  output         io_sram0_wen,
  output [127:0] io_sram0_wmask,
  output [127:0] io_sram0_wdata,
  input  [127:0] io_sram0_rdata,
  output   [5:0] io_sram1_addr,
  output         io_sram1_cen,
  output         io_sram1_wen,
  output [127:0] io_sram1_wmask,
  output [127:0] io_sram1_wdata,
  input  [127:0] io_sram1_rdata,
  output   [5:0] io_sram2_addr,
  output         io_sram2_cen,
  output         io_sram2_wen,
  output [127:0] io_sram2_wmask,
  output [127:0] io_sram2_wdata,
  input  [127:0] io_sram2_rdata,
  output   [5:0] io_sram3_addr,
  output         io_sram3_cen,
  output         io_sram3_wen,
  output [127:0] io_sram3_wmask,
  output [127:0] io_sram3_wdata,
  input  [127:0] io_sram3_rdata,

  output   [5:0] io_sram4_addr,
  output         io_sram4_cen,
  output         io_sram4_wen,
  output [127:0] io_sram4_wmask,
  output [127:0] io_sram4_wdata,
  input  [127:0] io_sram4_rdata,
  output   [5:0] io_sram5_addr,
  output         io_sram5_cen,
  output         io_sram5_wen,
  output [127:0] io_sram5_wmask,
  output [127:0] io_sram5_wdata,
  input  [127:0] io_sram5_rdata,
  output   [5:0] io_sram6_addr,
  output         io_sram6_cen,
  output         io_sram6_wen,
  output [127:0] io_sram6_wmask,
  output [127:0] io_sram6_wdata,
  input  [127:0] io_sram6_rdata,
  output   [5:0] io_sram7_addr,
  output         io_sram7_cen,
  output         io_sram7_wen,
  output [127:0] io_sram7_wmask,
  output [127:0] io_sram7_wdata,
  input  [127:0] io_sram7_rdata
);

  `ifdef VERILATOR
  always @(posedge clock) begin
    $fflush();
  end
  `endif

  assign io_slave_awready = 0;
  assign io_slave_wready = 0;
  assign io_slave_bvalid = 0;
  assign io_slave_bresp = 0;
  assign io_slave_bid = 0;
  assign io_slave_arready = 0;
  assign io_slave_rvalid = 0;
  assign io_slave_rresp = 0;
  assign io_slave_rdata = 0;
  assign io_slave_rlast = 0;
  assign io_slave_rid = 0;

  parameter REG_DATA_WIDTH = 64;
  parameter REG_ADDR_WIDTH = 5;

  parameter RW_DATA_WIDTH     = 128;
  parameter RW_ADDR_WIDTH     = 32;
  parameter RW_STRB_WIDTH     = 16;
  parameter AXI_DATA_WIDTH    = 64;
  parameter AXI_ADDR_WIDTH    = 32;
  parameter AXI_ID_WIDTH      = 4;
  parameter AXI_STRB_WIDTH    = 8;
  //parameter AXI_USER_WIDTH    = 1;

  //wire [63:0] a0_data;

/* ==============================AXI4============================== */
  
  wire         rw_valid_w;  // 请求有效
	wire         rw_ready_w;  // 访存完成
  wire         rw_wen_w;    // 访存类型 0是读 1是写
  wire [127:0] rw_r_data_w; // 读数据
  wire [127:0] rw_w_data_w; // 写数据
  wire  [31:0] rw_addr_w;   // 读/写地址
  wire  [15:0] rw_wstrb_w;   // 写字节掩码
  wire   [1:0] rw_burst_w;
  wire   [2:0] rw_size_w;
  wire         i_rw_valid_w;
  wire         i_rw_ready_w;
  wire         i_rw_wen_w;
  wire [127:0] i_rw_r_data_w;
  wire [127:0] i_rw_w_data_w;
  wire  [31:0] i_rw_addr_w;
  wire  [15:0] i_rw_wstrb_w;
  wire   [1:0] i_rw_burst_w;
  wire   [2:0] i_rw_size_w;
  wire [31:0] inst_if;
  wire [31:0] inst;
  wire [63:0] pc_if;
  wire [63:0] pc;
  wire if_stall_req;
  wire icache_data_ok;
  wire [31:0] inst_id;
  wire [63:0] pc_id;
  wire  [3:0] ram_store_id;
  wire  [3:0] ram_load_id;
  wire  [4:0] alu_opcode_id;
  wire  [1:0] alu_out_type_id;
  wire        reg_wen_id;
  wire  [4:0] reg_waddr_id;
  wire  [1:0] reg_ren_id;
  wire  [4:0] reg_raddr_1_id;
  wire  [4:0] reg_raddr_2_id;
  wire        imm_shamt_id;
  wire        rs1_word_id;
  wire        rs2_word_id;
  wire        rs_signed_id;
  wire  [1:0] rs2_shamt_id;
  wire [63:0] imm_id;
  wire  [3:0] jmp_type_id;
  wire [63:0] jmp_offset_id;
  wire [63:0] reg_rdata_1_id;
  wire [63:0] reg_rdata_2_id;
  wire        csr_wen_id;
  wire  [3:0] csr_inst_type_id;
  wire dcache_invalidate_id;
  wire valid_id;
  wire [63:0] pc_ex;
  wire  [3:0] ram_store_ex;
  wire  [3:0] ram_load_ex;
  wire  [4:0] alu_opcode_ex;
  wire  [1:0] alu_out_type_ex;
  wire        reg_wen_ex;
  wire  [4:0] reg_waddr_ex;
  wire  [1:0] reg_ren_ex;
  wire  [4:0] reg_raddr_1_ex;
  wire  [4:0] reg_raddr_2_ex;
  wire        imm_shamt_ex;
  wire        rs1_word_ex;
  wire        rs2_word_ex;
  wire        rs_signed_ex;
  wire  [1:0] rs2_shamt_ex;
  wire [63:0] imm_ex;
  wire  [3:0] jmp_type_ex;
  wire [63:0] jmp_offset_ex;
  wire [63:0] reg_rdata_1_ex_d;
  wire [63:0] reg_rdata_2_ex_d;
  wire        csr_wen_ex;
  wire  [3:0] csr_inst_type_ex;
  wire dcache_invalidate_ex;
  wire got_interrupt_ex;
  wire valid_ex;
  wire [63:0] alu_out_ex;
  wire [63:0] alu_x_ex;
  wire [63:0] alu_y_ex;
  wire [63:0] reg_rdata_1_ex;
  wire [63:0] reg_rdata_2_ex;
  //assign jmp_flag_ex = (jmp_type_ex != 0); <-- this is wrong!!!
  wire jmp_flag_ex;
  wire alu_stall_req;
  wire csr_jmp_inst_ex;
  wire         d_rw_valid_w;
  wire         d_rw_ready_w;
  wire         d_rw_wen_w;
  wire [127:0] d_rw_r_data_w;
  wire [127:0] d_rw_w_data_w;
  wire  [31:0] d_rw_addr_w;
  wire  [15:0] d_rw_wstrb_w;
  wire   [1:0] d_rw_burst_w;
  wire   [2:0] d_rw_size_w;
  wire  [3:0] ram_store_mem;
  wire  [3:0] ram_load_mem;
  wire [63:0] alu_out_mem;
  wire        reg_wen_mem;
  wire  [4:0] reg_waddr_mem;
  wire [63:0] reg_rdata_1_mem;
  wire  [4:0] reg_raddr_1_mem;
  wire [63:0] reg_rdata_2_mem;
  wire  [4:0] reg_raddr_2_mem;
  wire        csr_wen_mem;
  wire  [3:0] csr_inst_type_mem;
  wire [11:0] imm_mem;
  wire got_interrupt_mem;
  wire valid_mem;
  wire [63:0] pc_mem;
  wire timer_irq, software_irq;
  wire dcache_data_ok, dcache_addr_ok;
  wire [63:0] ram_rdata_mem;
  wire [63:0] ram_raddr_mem;
  wire [63:0] ram_waddr_mem;
  wire [63:0] ram_wdata_mem;
  wire [63:0] ram_wdata_mem_d;
  wire dcache_invalidate_mem;
  wire ForwardC;
  wire csr_jmp_inst_mem;
  wire  [3:0] ram_load_wb;
  wire [63:0] alu_out_wb;
  wire [63:0] ram_rdata_wb;
  wire        reg_wen_wb;
  wire  [4:0] reg_waddr_wb;
  wire [63:0] reg_rdata_1_wb;
  wire  [4:0] reg_raddr_1_wb;
  wire        csr_wen_wb;
  wire  [3:0] csr_inst_type_wb;
  wire [11:0] imm_wb;
  wire got_interrupt_wb;
  wire valid_wb;
  wire [63:0] pc_wb;
  wire csr_jmp_req;
  wire [63:0] csr_jmp_addr;
  wire csr_jmp_inst_wb;
  wire [1:0] ForwardA;
  wire [1:0] ForwardB;
  wire pc_stall;
  wire if_id_stall;
  wire id_ex_stall;
  wire ex_mem_stall;
  wire mem_wb_stall;
  wire if_id_flush;
  wire id_ex_flush;
  wire ex_mem_flush;
  wire mem_wb_flush;
  wire [63:0] reg_wdata_wb;


  ysyx_040163_axi_arbitration arbit0(
    .clk(clock),
    .rst(reset),

    /* icache */
    .i_rw_valid_w(i_rw_valid_w),
    .i_rw_ready_w(i_rw_ready_w),
    .i_rw_wen_w(i_rw_wen_w),
    .i_rw_r_data_w(i_rw_r_data_w),
    .i_rw_w_data_w(i_rw_w_data_w),
    .i_rw_addr_w(i_rw_addr_w),
    .i_rw_wstrb_w(i_rw_wstrb_w),
    .i_rw_burst_w(i_rw_burst_w),
    .i_rw_size_w(i_rw_size_w),

    /* dcache */
    .d_rw_valid_w(d_rw_valid_w),
    .d_rw_ready_w(d_rw_ready_w),
    .d_rw_wen_w(d_rw_wen_w),
    .d_rw_r_data_w(d_rw_r_data_w),
    .d_rw_w_data_w(d_rw_w_data_w),
    .d_rw_addr_w(d_rw_addr_w),
    .d_rw_wstrb_w(d_rw_wstrb_w),
    .d_rw_burst_w(d_rw_burst_w),
    .d_rw_size_w(d_rw_size_w),

    /* to axi */
    .rw_valid_o(rw_valid_w),  // 请求有效
	  .rw_ready_i(rw_ready_w),  // 访存完成
    .rw_wen_o(rw_wen_w),    // 访存类型 0是读 1是写
    .rw_r_data_i(rw_r_data_w), // 读数据
    .rw_w_data_o(rw_w_data_w), // 写数据
    .rw_addr_o(rw_addr_w),   // 读/写地址
    .rw_wstrb_o(rw_wstrb_w),  // 写字节掩码
    .rw_burst_o(rw_burst_w),
    .rw_size_o(rw_size_w)
  );

  ysyx_040163_axi_rw #(
    RW_DATA_WIDTH,
    RW_ADDR_WIDTH,
    RW_STRB_WIDTH,
    AXI_DATA_WIDTH,
    AXI_ADDR_WIDTH,
    AXI_ID_WIDTH,
    AXI_STRB_WIDTH
  //AXI_USER_WIDTH
  ) axi_rw0(
    .clk(clock),
    .rst(reset),

    .rw_valid_i(rw_valid_w),
    .rw_ready_o(rw_ready_w),
    .rw_wen_i(rw_wen_w),
    .rw_r_data_o(rw_r_data_w),
    .rw_w_data_i(rw_w_data_w),
    .rw_addr_i(rw_addr_w),
    .rw_wstrb_i(rw_wstrb_w),
    .rw_burst_i(rw_burst_w),
    .rw_size_i(rw_size_w),

    // 写地址通道
    .axi_aw_ready_i(io_master_awready),  // 从设备已准备好接收地址和相关的控制信号
    .axi_aw_valid_o(io_master_awvalid),  // 主设备给出的地址和相关的控制信号有效
    .axi_aw_addr_o(io_master_awaddr),   // 写地址
    .axi_aw_id_o(io_master_awid),     // 写地址ID
    .axi_aw_len_o(io_master_awlen),    // 突发长度
    .axi_aw_size_o(io_master_awsize),   // 突发大小
    .axi_aw_burst_o(io_master_awburst),  // 突发类型

    // 写数据通道
    .axi_w_ready_i(io_master_wready), // 从设备已准备好接收数据和字节选通信号
    .axi_w_valid_o(io_master_wvalid), // 主设备给出的数据和字节选通信号有效
    .axi_w_data_o(io_master_wdata),  // 写出的数据
    .axi_w_strb_o(io_master_wstrb),  // 数据的字节选通信号
    .axi_w_last_o(io_master_wlast),  // 标识是否是最后一次突发传输

    // 写响应通道
    .axi_b_ready_o(io_master_bready), // 主设备已准备好接收写响应信号
    .axi_b_valid_i(io_master_bvalid), // 从设备给出的写响应信号有效
    .axi_b_resp_i(io_master_bresp),  // 写传输的状态
    .axi_b_id_i(io_master_bid),    // 写响应ID

    // 读地址通道
    .axi_ar_ready_i(io_master_arready),  // 从设备已经准备好接收地址和相关信息
    .axi_ar_valid_o(io_master_arvalid),  // 主设备给出的地址和相关信息有效
    .axi_ar_addr_o(io_master_araddr),   // 读地址
    .axi_ar_id_o(io_master_arid),     // 读地址ID
    .axi_ar_len_o(io_master_arlen),    // 突发长度
    .axi_ar_size_o(io_master_arsize),   // 突发大小（每次突发传输的大小）
    .axi_ar_burst_o(io_master_arburst),  // 突发类型

    // 读数据通道
    .axi_r_ready_o(io_master_rready), // 主设备已经准备好接收读取的数据和响应信息
    .axi_r_valid_i(io_master_rvalid), // 从设备给出的数据和响应信息有效
    .axi_r_resp_i(io_master_rresp),  // 读传输的状态
    .axi_r_data_i(io_master_rdata),  // 读出的数据
    .axi_r_last_i(io_master_rlast),  // 标识是否是最后一次突发传输
    .axi_r_id_i(io_master_rid)    // 读数据ID
  );

/* ===============================IF=============================== */

  ysyx_040163_fetch fetch0(
    .clk(clock),
    .rst(reset),

    .reg_rdata_1_ex(reg_rdata_1_ex),
    .reg_rdata_2_ex(reg_rdata_2_ex),

    .jmp_type_ex(jmp_type_ex),
    .jmp_offset_ex(jmp_offset_ex),
    .jmp_flag_ex(jmp_flag_ex),

    .pc_ex(pc_ex),
    .pc_stall(pc_stall),
    .pc(pc),

    .inst(inst),

    .csr_jmp_req(csr_jmp_req),
    .csr_jmp_addr(csr_jmp_addr),

    .csr_jmp_inst_ex(csr_jmp_inst_ex),
    .csr_jmp_inst_mem(csr_jmp_inst_mem),
    .csr_jmp_inst_wb(csr_jmp_inst_wb),

    .if_stall_req(if_stall_req),
    .icache_data_ok(icache_data_ok),

    /* icache */
    .rw_valid_o(i_rw_valid_w),
    .rw_ready_i(i_rw_ready_w),
    .rw_wen_o(i_rw_wen_w),
    .rw_r_data_i(i_rw_r_data_w),
    .rw_w_data_o(i_rw_w_data_w),
    .rw_addr_o(i_rw_addr_w),
    .rw_wstrb_o(i_rw_wstrb_w),
    .rw_burst_o(i_rw_burst_w),
    .rw_size_o(i_rw_size_w),

    /* sram 0-3 */
    .io_sram0_addr(io_sram0_addr),
    .io_sram0_cen(io_sram0_cen),
    .io_sram0_wen(io_sram0_wen),
    .io_sram0_wmask(io_sram0_wmask),
    .io_sram0_wdata(io_sram0_wdata),
    .io_sram0_rdata(io_sram0_rdata),
    .io_sram1_addr(io_sram1_addr),
    .io_sram1_cen(io_sram1_cen),
    .io_sram1_wen(io_sram1_wen),
    .io_sram1_wmask(io_sram1_wmask),
    .io_sram1_wdata(io_sram1_wdata),
    .io_sram1_rdata(io_sram1_rdata),
    .io_sram2_addr(io_sram2_addr),
    .io_sram2_cen(io_sram2_cen),
    .io_sram2_wen(io_sram2_wen),
    .io_sram2_wmask(io_sram2_wmask),
    .io_sram2_wdata(io_sram2_wdata),
    .io_sram2_rdata(io_sram2_rdata),
    .io_sram3_addr(io_sram3_addr),
    .io_sram3_cen(io_sram3_cen),
    .io_sram3_wen(io_sram3_wen),
    .io_sram3_wmask(io_sram3_wmask),
    .io_sram3_wdata(io_sram3_wdata),
    .io_sram3_rdata(io_sram3_rdata)
  );

  /* valid */
  wire valid_if;
  assign valid_if = ~if_stall_req;
  assign inst_if = inst;
  assign pc_if = pc;

/* ==============================IF/ID============================== */

  ysyx_040163_IF_ID IF_ID0(
    /* Input */
    .clk         (clock),
    .rst         (reset),

    .inst_if     (inst_if),
    .pc_if       (pc_if),

    /* Output */
    .inst_id     (inst_id),
    .pc_id       (pc_id),

    /* valid */
    .valid_if    (valid_if),
    .valid_id    (valid_id),

    /* control */
  //.pc_stall    (pc_stall),
    .if_id_flush (if_id_flush),
    .if_id_stall (if_id_stall),
    .id_ex_stall (id_ex_stall)
  );

/* ===============================ID=============================== */

  ysyx_040163_decode decode0(
    /* Input */
  //.pc_id (pc_id[31:0]),
    .inst         (inst_id),
  //.a0_data      (a0_data),

    /* Output */
    .ram_store    (ram_store_id),
    .ram_load     (ram_load_id),

    .alu_opcode   (alu_opcode_id),
    .alu_out_type (alu_out_type_id),

    .reg_wen      (reg_wen_id),
    .reg_waddr    (reg_waddr_id),
    .reg_ren      (reg_ren_id),
    .reg_raddr_1  (reg_raddr_1_id),
    .reg_raddr_2  (reg_raddr_2_id),

    .imm_shamt    (imm_shamt_id),
    .rs1_word     (rs1_word_id),
    .rs2_word     (rs2_word_id),
    .rs_signed    (rs_signed_id),
    .rs2_shamt    (rs2_shamt_id),
    .imm          (imm_id),

    .jmp_type     (jmp_type_id),
    .jmp_offset   (jmp_offset_id),
    
    .csr_wen      (csr_wen_id),
    .csr_inst_type (csr_inst_type_id),

    .dcache_invalidate(dcache_invalidate_id)
  );

  ysyx_040163_rf #(REG_ADDR_WIDTH, REG_DATA_WIDTH) rf0(
    /* Input */
    .clk     (clock),
    .rst     (reset),

    /* 写回stage再让寄存器存值 */
    .reg_wen (reg_wen_wb & (~got_interrupt_wb)),
    .waddr   (reg_waddr_wb),
    .wdata   (reg_wdata_wb),

    .raddr_1 (reg_raddr_1_id),
    .raddr_2 (reg_raddr_2_id),

    /* Onput */
    .rdata_1 (reg_rdata_1_id),
    .rdata_2 (reg_rdata_2_id)

  //.a0_data (a0_data),

    /* valid */
  //.valid_wb(valid_wb),
  //.pc_wb(pc_wb)
  //.mem_wb_stall(mem_wb_stall)
  );

  // id阶段捕获中断请求
  // 首先中断请求会给到csr，csr根据寄存器判断是否响应
  // 响应则从csr引出信号
  // id阶段捕获该信号并传递
  wire got_interrupt_id;
  wire has_irq;
  assign got_interrupt_id = has_irq;

/* ==============================ID/EX============================== */

  ysyx_040163_ID_EX ID_EX0(
    /* Input */
    .clk(clock),
    .rst(reset),
    
    .pc_id(pc_id),
    
    /* decode */
    .ram_store_id(ram_store_id),
    .ram_load_id(ram_load_id),
    .alu_opcode_id(alu_opcode_id),
    .alu_out_type_id(alu_out_type_id),
    .reg_wen_id(reg_wen_id),
    .reg_waddr_id(reg_waddr_id),
    .reg_ren_id(reg_ren_id),
    .reg_raddr_1_id(reg_raddr_1_id),
    .reg_raddr_2_id(reg_raddr_2_id),
    .imm_shamt_id(imm_shamt_id),
    .rs1_word_id(rs1_word_id),
    .rs2_word_id(rs2_word_id),
    .rs_signed_id(rs_signed_id),
    .rs2_shamt_id(rs2_shamt_id),
    .imm_id(imm_id),
    .jmp_type_id(jmp_type_id),
    .jmp_offset_id(jmp_offset_id),
    .csr_wen_id(csr_wen_id),
    .csr_inst_type_id(csr_inst_type_id),
    .dcache_invalidate_id(dcache_invalidate_id),
    .got_interrupt_id(got_interrupt_id),

    /* rf */
    .reg_rdata_1_id(reg_rdata_1_id),
    .reg_rdata_2_id(reg_rdata_2_id),

    /* Output */
    .pc_ex(pc_ex),

    .ram_store_ex(ram_store_ex),
    .ram_load_ex(ram_load_ex),
    .alu_opcode_ex(alu_opcode_ex),
    .alu_out_type_ex(alu_out_type_ex),
    .reg_wen_ex(reg_wen_ex),
    .reg_waddr_ex(reg_waddr_ex),
    .reg_ren_ex(reg_ren_ex),
    .reg_raddr_1_ex(reg_raddr_1_ex),
    .reg_raddr_2_ex(reg_raddr_2_ex),
    .imm_shamt_ex(imm_shamt_ex),
    .rs1_word_ex(rs1_word_ex),
    .rs2_word_ex(rs2_word_ex),
    .rs_signed_ex(rs_signed_ex),
    .rs2_shamt_ex(rs2_shamt_ex),
    .imm_ex(imm_ex),
    .jmp_type_ex(jmp_type_ex),
    .jmp_offset_ex(jmp_offset_ex),
    .csr_wen_ex(csr_wen_ex),
    .csr_inst_type_ex(csr_inst_type_ex),
    .dcache_invalidate_ex(dcache_invalidate_ex),
    .got_interrupt_ex(got_interrupt_ex),

    /* 这边需要考虑ForwardA和ForwardB */
    .reg_rdata_1_ex(reg_rdata_1_ex_d),
    .reg_rdata_2_ex(reg_rdata_2_ex_d),

    /* valid */
    .valid_id (valid_id),
    .valid_ex (valid_ex),

    /* control */
    .id_ex_flush (id_ex_flush),
    .id_ex_stall (id_ex_stall),
    .ex_mem_stall (ex_mem_stall)
  );

/* ===============================EX=============================== */

  ysyx_040163_alu alu0(
    .clk(clock),
    .rst(reset),

    /* Input */
    .alu_opcode   (alu_opcode_ex),
    .alu_out_type (alu_out_type_ex),
    .a            (alu_x_ex),
    .b            (alu_y_ex),

    .valid_ex     (valid_ex),

    .jmp_flag_ex  (jmp_flag_ex),
    .csr_jmp_req  (csr_jmp_inst_mem | csr_jmp_inst_wb | got_interrupt_ex),

    .pc_ex(pc_ex),

    /* Output */
    .alu_out      (alu_out_ex),
    .alu_stall_req(alu_stall_req)
  );

  /* 判断是否是ecall或mret并且是否valid */
  
  assign csr_jmp_inst_ex = valid_ex & ((csr_inst_type_ex == 4'b0111) | (csr_inst_type_ex == 4'b1000));

  // 根据forwardA forwardB信号选择是哪一个位置读到的寄存器的值
  ysyx_040163_mux #(3, 2, 64) mux31_alu_x_ex(
    reg_rdata_1_ex,
    ForwardA,
    64'b0,
    {
      2'b00, reg_rdata_1_ex_d,
      2'b10, alu_out_mem,
      2'b01, reg_wdata_wb
  }); // reg_rdata_1_ex
  ysyx_040163_mux #(3, 2, 64) mux31_alu_y_ex(
    reg_rdata_2_ex,
    ForwardB,
    64'b0,
    {
      2'b00, reg_rdata_2_ex_d,
      2'b10, alu_out_mem,
      2'b01, reg_wdata_wb
  }); // reg_rdata_2_ex

  // 下面两个操作数的赋值，根据指令的opcode来分析选择赋值reg或者imm
  // reg_ren[0]选pc或reg_rdata_1
  // reg_ren[1]选imm或reg_rdata_2
  ysyx_040163_mux #(4, 3, 64) mux41_alu_x_ex_d(
    alu_x_ex,
    {reg_ren_ex[0], rs1_word_ex, rs_signed_ex},
    64'b0,
    {
      3'b000, pc_ex,
      3'b100, reg_rdata_1_ex,
      3'b110, {32'b0, reg_rdata_1_ex[31:0]},
      3'b111, {{32{reg_rdata_1_ex[31]}}, reg_rdata_1_ex[31:0]}
  }); //alu_x_ex
  ysyx_040163_mux #(6, 5, 64) mux51_alu_y_ex_d(
    alu_y_ex,
    {reg_ren_ex[1], rs2_shamt_ex, rs2_word_ex, imm_shamt_ex},
    64'b0,
    {
      5'b11000, {59'b0, reg_rdata_2_ex[4:0]},
      5'b10100, {58'b0, reg_rdata_2_ex[5:0]},
      5'b10010, {32'b0, reg_rdata_2_ex[31:0]},
      5'b10000, reg_rdata_2_ex,
      5'b00001, {57'b0, imm_ex[6:0]},
      5'b00000, imm_ex
  }); // alu_y_ex

  /* EX段中，还有reg_rdata_2_ex reg_rdata_1_ex jmp_offset_ex jmp_type_ex pc_ex 回到了取值处 */

/* ==============================EX/MEM============================== */

  ysyx_040163_EX_MEM EX_MEM0(
    /* Input */
    .clk(clock),
    .rst(reset),

    .ram_store_ex(ram_store_ex),
    .ram_load_ex(ram_load_ex),

    .alu_out_ex(alu_out_ex),

    .reg_wen_ex(reg_wen_ex),
    .reg_waddr_ex(reg_waddr_ex),
    .reg_rdata_1_ex(reg_rdata_1_ex),
    .reg_raddr_1_ex(reg_raddr_1_ex),
    .reg_rdata_2_ex(reg_rdata_2_ex),
    .reg_raddr_2_ex(reg_raddr_2_ex),
    .imm_ex(imm_ex[11:0]),

    .csr_wen_ex(csr_wen_ex),
    .csr_inst_type_ex(csr_inst_type_ex),

    .dcache_invalidate_ex(dcache_invalidate_ex),
    .got_interrupt_ex(got_interrupt_ex),

    /* Output */
    .ram_store_mem(ram_store_mem),
    .ram_load_mem(ram_load_mem),

    .alu_out_mem(alu_out_mem),

    .reg_wen_mem(reg_wen_mem),
    .reg_waddr_mem(reg_waddr_mem),
    .reg_rdata_1_mem(reg_rdata_1_mem),
    .reg_raddr_1_mem(reg_raddr_1_mem),
    .reg_rdata_2_mem(reg_rdata_2_mem),
    .reg_raddr_2_mem(reg_raddr_2_mem),
    .imm_mem(imm_mem),

    .csr_wen_mem(csr_wen_mem),
    .csr_inst_type_mem(csr_inst_type_mem),

    .dcache_invalidate_mem(dcache_invalidate_mem),
    .got_interrupt_mem(got_interrupt_mem),

    /* valid */
    .valid_ex(valid_ex),
    .valid_mem(valid_mem),

    /* pc */
    .pc_ex(pc_ex),
    .pc_mem(pc_mem),

    /* control */
    .ex_mem_flush (ex_mem_flush),
    .ex_mem_stall (ex_mem_stall),
    .mem_wb_stall (mem_wb_stall)
  );

/* ===============================MEM=============================== */

  ysyx_040163_ram ram0(
    .clk(clock),
    .rst(reset),
    /* Input */
    .ram_store (ram_store_mem),
    .ram_load  (ram_load_mem),

    .ram_raddr (ram_raddr_mem),

    .ram_waddr (ram_waddr_mem),
    .ram_wdata (ram_wdata_mem),

    .valid_mem (valid_mem),
    .csr_jmp_req(csr_jmp_inst_wb | got_interrupt_mem),
  //.mem_wb_stall(mem_wb_stall),

    .pc_mem(pc_mem),

    .dcache_invalidate(dcache_invalidate_mem),

    /* Output */
    .ram_rdata (ram_rdata_mem),

    .data_ok(dcache_data_ok),
    .addr_ok(dcache_addr_ok),

    .timer_irq(timer_irq),
    .software_irq(software_irq),

    /* dcache */
    .rw_valid_o(d_rw_valid_w),
    .rw_ready_i(d_rw_ready_w),
    .rw_wen_o(d_rw_wen_w),
    .rw_r_data_i(d_rw_r_data_w),
    .rw_w_data_o(d_rw_w_data_w),
    .rw_addr_o(d_rw_addr_w),
    .rw_wstrb_o(d_rw_wstrb_w),
    .rw_burst_o(d_rw_burst_w),
    .rw_size_o(d_rw_size_w),

    /* sram 4-7 */
    .io_sram4_addr(io_sram4_addr),
    .io_sram4_cen(io_sram4_cen),
    .io_sram4_wen(io_sram4_wen),
    .io_sram4_wmask(io_sram4_wmask),
    .io_sram4_wdata(io_sram4_wdata),
    .io_sram4_rdata(io_sram4_rdata),
    .io_sram5_addr(io_sram5_addr),
    .io_sram5_cen(io_sram5_cen),
    .io_sram5_wen(io_sram5_wen),
    .io_sram5_wmask(io_sram5_wmask),
    .io_sram5_wdata(io_sram5_wdata),
    .io_sram5_rdata(io_sram5_rdata),
    .io_sram6_addr(io_sram6_addr),
    .io_sram6_cen(io_sram6_cen),
    .io_sram6_wen(io_sram6_wen),
    .io_sram6_wmask(io_sram6_wmask),
    .io_sram6_wdata(io_sram6_wdata),
    .io_sram6_rdata(io_sram6_rdata),
    .io_sram7_addr(io_sram7_addr),
    .io_sram7_cen(io_sram7_cen),
    .io_sram7_wen(io_sram7_wen),
    .io_sram7_wmask(io_sram7_wmask),
    .io_sram7_wdata(io_sram7_wdata),
    .io_sram7_rdata(io_sram7_rdata)
  );

  /* 判断是否是ecall或mret并且是否valid */
  assign csr_jmp_inst_mem = valid_mem & ((csr_inst_type_mem == 4'b0111) | (csr_inst_type_mem == 4'b1000));

  assign ram_wdata_mem_d = ram_store_mem[3] ? reg_rdata_2_mem : 0;
  assign ram_wdata_mem = ForwardC ? reg_wdata_wb : ram_wdata_mem_d; /* 进行ForwardC前递检测 */
  assign ram_waddr_mem = ram_store_mem[3] ? alu_out_mem : 0;
  assign ram_raddr_mem = ram_load_mem[3] ? alu_out_mem : 0;

/* ==============================MEM/WB============================== */

  ysyx_040163_MEM_WB MEM_WB0(
    /* Input */
    .clk(clock),
    .rst(reset),

    .ram_load_mem(ram_load_mem),
    .alu_out_mem(alu_out_mem),
    .ram_rdata_mem(ram_rdata_mem),
    .reg_wen_mem(reg_wen_mem),
    .reg_waddr_mem(reg_waddr_mem),
    .reg_rdata_1_mem(reg_rdata_1_mem),
    .reg_raddr_1_mem(reg_raddr_1_mem),
    .csr_wen_mem(csr_wen_mem),
    .csr_inst_type_mem(csr_inst_type_mem),
    .imm_mem(imm_mem[11:0]),
    .got_interrupt_mem(got_interrupt_mem),

    /* Output */
    .ram_load_wb(ram_load_wb),
    .alu_out_wb(alu_out_wb),
    .ram_rdata_wb(ram_rdata_wb),
    .reg_wen_wb(reg_wen_wb),
    .reg_waddr_wb(reg_waddr_wb),
    .reg_rdata_1_wb(reg_rdata_1_wb),
    .reg_raddr_1_wb(reg_raddr_1_wb),
    .csr_wen_wb(csr_wen_wb),
    .csr_inst_type_wb(csr_inst_type_wb),
    .imm_wb(imm_wb),
    .got_interrupt_wb(got_interrupt_wb),

    /* valid */
    .valid_mem(valid_mem),
    .valid_wb(valid_wb),

    /* pc */
    .pc_mem(pc_mem),
    .pc_wb(pc_wb),

    /* control */
    .mem_wb_flush (mem_wb_flush),
    .mem_wb_stall (mem_wb_stall)
  );

/* ===============================WB=============================== */
  /* 写回阶段将reg_waddr reg_wen reg_wdata传回给寄存器模块 */
  wire [63:0] csr_rdata_wb;
  assign reg_wdata_wb = ram_load_wb[3] ? ram_rdata_wb : (csr_wen_wb) ? csr_rdata_wb : alu_out_wb;

  /* 这里还需要处理csr，然后rf的低电平更新可能需要修改掉，虽然迟早都要修改掉 */
  wire [11:0] csr_addr = imm_wb[11:0];
  wire  [4:0] uimm = reg_raddr_1_wb;
  wire csr_flush_req;

  /* 需要等所有的多周期部件全部执行结束再进行csr的操作 */
  wire alldone;
  assign alldone = ~(alu_stall_req | if_stall_req | (~dcache_addr_ok) | (~icache_data_ok));

  /* 判断是否是ecall或mret并且是否valid */
  assign csr_jmp_inst_wb = valid_wb & ((csr_inst_type_wb == 4'b0111) | (csr_inst_type_wb == 4'b1000));

  ysyx_040163_csr csr0(
    .clk(clock),
    .rst(reset),

    /* input */
    .uimm(uimm),
    .csr_inst_type(csr_inst_type_wb),
    .reg_rdata_1_wb(reg_rdata_1_wb),
    .csr_addr(csr_addr),
    .csr_wen(csr_wen_wb),
    .pc_wb(pc_wb),
    .valid_wb(valid_wb),

    .software_irq(software_irq),
    .timer_irq(timer_irq),

    .alldone(alldone),

    .got_interrupt_wb(got_interrupt_wb),
    .has_irq(has_irq),

    /* output */
    .csr_rdata(csr_rdata_wb),
    .csr_flush_req(csr_flush_req),
    .csr_jmp_req(csr_jmp_req),
    .csr_jmp_addr(csr_jmp_addr)
  );


/* ===========================ForwardUnit========================== */
  /* 下面是前递模块 */
  ysyx_040163_forwardingUnit forwdUnit0(
    /* Input */
    .reg_raddr_1_ex(reg_raddr_1_ex),
    .reg_raddr_2_ex(reg_raddr_2_ex),
    .reg_waddr_mem(reg_waddr_mem),
    .reg_waddr_wb(reg_waddr_wb),
    .reg_wen_mem(reg_wen_mem),
    .reg_wen_wb(reg_wen_wb),

    /* 针对forwardC增加的信号 */
    .reg_raddr_2_mem(reg_raddr_2_mem),
    .ram_store_en_mem(ram_store_mem[3]),
    .ram_load_en_wb(ram_load_wb[3]),

    /* Output */
    .ForwardA(ForwardA),
    .ForwardB(ForwardB),
    .ForwardC(ForwardC)
  );

/* ===========================ControlUnit=========================== */
  /* 下面是冒险检测单元，用于处理无法直接前递解决+其它的冒险，输出stall和flush信号 */
  ysyx_040163_ControlUnit ControlUnit0(
    /* Input */
    .reg_raddr_1_id(reg_raddr_1_id),
    .reg_raddr_2_id(reg_raddr_2_id),
    .reg_raddr_1_ex(reg_raddr_1_ex),
    .reg_raddr_2_ex(reg_raddr_2_ex),
    .ram_load_en_ex(ram_load_ex[3]),
    .reg_waddr_ex(reg_waddr_ex),
    .reg_waddr_mem(reg_waddr_mem),
    .csr_wen_mem(csr_wen_mem),

    .jmp_flag_ex(jmp_flag_ex),

    .dcache_data_ok(dcache_data_ok),
    .dcache_addr_ok(dcache_addr_ok),

    .csr_flush_req(csr_flush_req),
    .alu_stall_req(alu_stall_req),
    .if_stall_req(if_stall_req),

    /* Output */
    .pc_stall(pc_stall),
    .if_id_stall(if_id_stall),
    .id_ex_stall(id_ex_stall),
    .ex_mem_stall(ex_mem_stall),
    .mem_wb_stall(mem_wb_stall),

    .if_id_flush(if_id_flush),
    .id_ex_flush(id_ex_flush),
    .ex_mem_flush(ex_mem_flush),
    .mem_wb_flush(mem_wb_flush)
  );

endmodule
module ysyx_040163_alu (
  input clk,
  input rst,
  input [4:0] alu_opcode,
  input [1:0] alu_out_type,
  input [63:0] a,
  input [63:0] b,
  input csr_jmp_req,
  input jmp_flag_ex,
  input valid_ex,
  input [63:0] pc_ex,
  /* 需要特别注意load_use csr_use，如果存在的话乘除法器是不能动的 */
  output [63:0] alu_out,
  output alu_stall_req
);

  parameter ADD  = 5'b00000;
  parameter SUB  = 5'b00001;
  parameter NOT  = 5'b00010;
  parameter AND  = 5'b00011;
  parameter OR   = 5'b00100;
  parameter XOR  = 5'b00101;
  parameter LOW  = 5'b00110; // 小于 有符号
  parameter LOWU = 5'b00111; // 小于 无符号
  parameter EQU  = 5'b01000;
  parameter SRA  = 5'b01001; // shift right arithmetic
  parameter SLL  = 5'b01010; // shift left logical
  parameter SRL  = 5'b01011; // shift right logical
  parameter GE   = 5'b01100; // 大于等于 无符号
  parameter GEU  = 5'b01101; // 大于等于 有符号
  parameter MUL  = 5'b01110; // 乘法
  parameter MULH = 5'b10011;
  parameter MULHSU = 5'b10100;
  parameter MULHU = 5'b10101;
  parameter MULW = 5'b10110;
  parameter DIV  = 5'b01111; // 除法 有符号
  parameter DIVU = 5'b10000; // 除法 无符号
  parameter DIVUW = 5'b10111;
  parameter DIVW = 5'b11000;
  parameter REMU = 5'b10001; // 取余数 无符号
  parameter REM  = 5'b10010; // 取余数 有符号
  parameter REMUW = 5'b11001;
  parameter REMW = 5'b11010;

  wire [63:0] alu_result;

  wire [63:0] mult_out, div_out;

  ysyx_040163_mux #(27, 5, 64) mux_alu_result(alu_result, alu_opcode, 64'b0, {
    ADD, (a + b),
    SUB, (a - b),
    NOT, (~ a),
    AND, (a & b),
    OR, (a | b),
    XOR, (a ^ b),
    LOW, {63'b0, {$signed(a) < $signed(b)}},
    LOWU, {63'b0, {a < b}},
    EQU, {63'b0, {a == b}},
    SRA, $signed($signed(a) >>> b),
    SLL, (a << b),
    SRL, (a >> b),
    GE, {63'b0, {$signed(a) >= $signed(b)}},
    GEU, {63'b0, {a >= b}},

    //MUL, (a * b),
    MUL, mult_out,
    MULH, mult_out,
    MULHSU, mult_out,
    MULHU, mult_out,
    MULW, mult_out,

    //DIV, $signed($signed(a) / $signed(b)),
    //DIVU, (a / b),
    //REM, $signed($signed(a) % $signed(b)),
    //REMU, (a % b)
    DIV, div_out,
    DIVU, div_out,
    DIVUW, div_out,
    DIVW, div_out,
    REM, div_out,
    REMU, div_out,
    REMUW, div_out,
    REMW, div_out
  });

  wire div_ready, mult_ready;

  reg [63:0] pc_ex_r;
  always @(posedge clk) begin
    pc_ex_r <= pc_ex;
  end
  wire pc_ex_changed;
  assign pc_ex_changed = (pc_ex_r != pc_ex);

  reg div_valid;
  always @(*) begin
    div_valid = alu_opcode inside {DIV, DIVU, DIVUW, DIVW, REM, REMU, REMUW, REMW} && ~jmp_flag_ex && valid_ex && pc_ex_changed && ~csr_jmp_req;
  end

  reg mult_valid;
  always @(*) begin
    mult_valid = alu_opcode inside {MUL, MULH, MULHSU, MULHU, MULW} && ~jmp_flag_ex && valid_ex && pc_ex_changed && ~csr_jmp_req;
  end

  assign alu_stall_req = ~div_ready | ~mult_ready;

  ysyx_040163_multiplier_easy mult0(
    .clk(clk),
    .rst(rst),
    .mult_valid(mult_valid),
    .mult_type(alu_opcode),
    .multiplicand_i(a),
    .multiplier_i(b),
    .mult_out(mult_out),
    .mult_ready(mult_ready)
  );

  ysyx_040163_divider div0(
    .clk(clk),
    .rst(rst),
    .div_valid(div_valid),
    .div_type(alu_opcode),
    .dividend_i(a),
    .divisor_i(b),
    .result_o(div_out),
    .div_ready(div_ready)
  );

  ysyx_040163_mux #(4, 2, 64) mux41_alu_out(alu_out, alu_out_type, 64'b0, {
    2'b00, {32'b0, alu_result[31:0]},
    2'b01, {{32{alu_result[31]}}, alu_result[31:0]},
    2'b10, alu_result,
    2'b11, alu_result
  }); // alu_out


endmodule
module ysyx_040163_axi_arbitration (
  input clk,
  input rst,

  // icache
  input i_rw_valid_w,
  output reg i_rw_ready_w,
  input i_rw_wen_w,
  output reg [127:0] i_rw_r_data_w,
  input [127:0] i_rw_w_data_w,
  input [31:0] i_rw_addr_w,
  input [15:0] i_rw_wstrb_w,
  input [1:0] i_rw_burst_w,
  input [2:0] i_rw_size_w,

  // dcache
  input d_rw_valid_w,
  output reg d_rw_ready_w,
  input d_rw_wen_w,
  output reg [127:0] d_rw_r_data_w,
  input [127:0] d_rw_w_data_w,
  input [31:0] d_rw_addr_w,
  input [15:0] d_rw_wstrb_w,
  input [1:0] d_rw_burst_w,
  input [2:0] d_rw_size_w,

  // axi
  output reg rw_valid_o,  // 请求有效
	input rw_ready_i,  // 访存完成
  output reg rw_wen_o,    // 访存类型 0是读 1是写
  input [127:0] rw_r_data_i, // 读数据
  output reg [127:0] rw_w_data_o, // 写数据
  output reg [31:0] rw_addr_o,   // 读/写地址
  output reg [15:0] rw_wstrb_o,  // 写字节掩码
  output reg [1:0] rw_burst_o,
  output reg [2:0] rw_size_o
);

  always @(posedge clk) begin
    if (rst) begin
      rw_valid_o <= 0;
      rw_wen_o <= 0;
      rw_w_data_o <= 0;
      rw_addr_o <= 0;
      rw_wstrb_o <= 0;
      rw_burst_o <= 0;
      rw_size_o <= 0;

      i_rw_ready_w <= 0;
      i_rw_r_data_w <= 0;

      d_rw_ready_w <= 0;
      d_rw_r_data_w <= 0;
    end
    else begin
    // icache
    if (i_rw_valid_w) begin
      if (~rw_ready_i) begin
        // icache访存未开始或未结束
        rw_valid_o <= i_rw_valid_w;
        i_rw_ready_w <= rw_ready_i;
        rw_wen_o <= i_rw_wen_w;
        i_rw_r_data_w <= rw_r_data_i;
        rw_w_data_o <= i_rw_w_data_w;
        rw_addr_o <= i_rw_addr_w;
        rw_wstrb_o <= i_rw_wstrb_w;
        rw_burst_o <= i_rw_burst_w;
        rw_size_o <= i_rw_size_w;

        d_rw_ready_w <= 0;
        d_rw_r_data_w <= 0;
      end
      else begin
        // icache访存结束，强制拉高拉低
        rw_valid_o <= 0;
        i_rw_ready_w <= 1;
        rw_wen_o <= i_rw_wen_w;
        i_rw_r_data_w <= rw_r_data_i;
        rw_w_data_o <= i_rw_w_data_w;
        rw_addr_o <= i_rw_addr_w;
        rw_wstrb_o <= i_rw_wstrb_w;
        rw_burst_o <= i_rw_burst_w;
        rw_size_o <= i_rw_size_w;

        d_rw_ready_w <= 0;
        d_rw_r_data_w <= 0;
      end
    end
    // dcache
    else if (d_rw_valid_w) begin
      if (~rw_ready_i) begin
        // dcache访存未开始或未结束
        rw_valid_o <= d_rw_valid_w;
        d_rw_ready_w <= rw_ready_i;
        rw_wen_o <= d_rw_wen_w;
        d_rw_r_data_w <= rw_r_data_i;
        rw_w_data_o <= d_rw_w_data_w;
        rw_addr_o <= d_rw_addr_w;
        rw_wstrb_o <= d_rw_wstrb_w;
        rw_burst_o <= d_rw_burst_w;
        rw_size_o <= d_rw_size_w;

        i_rw_ready_w <= 0;
        i_rw_r_data_w <= 0;
      end
      else begin
        // dcache访存结束，强制拉高拉低
        rw_valid_o <= 0;
        d_rw_ready_w <= 1;
        rw_wen_o <= d_rw_wen_w;
        d_rw_r_data_w <= rw_r_data_i;
        rw_w_data_o <= d_rw_w_data_w;
        rw_addr_o <= d_rw_addr_w;
        rw_wstrb_o <= d_rw_wstrb_w;
        rw_burst_o <= d_rw_burst_w;
        rw_size_o <= d_rw_size_w;

        i_rw_ready_w <= 0;
        i_rw_r_data_w <= 0;
      end
    end
    // idle
    else begin
      rw_valid_o <= 0;
      rw_wen_o <= 0;
      rw_w_data_o <= 0;
      rw_addr_o <= 0;
      rw_wstrb_o <= 0;
      rw_burst_o <= 0;
      rw_size_o <= 0;

      i_rw_ready_w <= 0;
      i_rw_r_data_w <= 0;

      d_rw_ready_w <= 0;
      d_rw_r_data_w <= 0;
    end
  end
  end
  
endmodule


// Burst types
`define ysyx_040163_AXI_BURST_TYPE_FIXED                                2'b00               // 突发类型  FIFO
`define ysyx_040163_AXI_BURST_TYPE_INCR                                 2'b01               // ram  
`define ysyx_040163_AXI_BURST_TYPE_WRAP                                 2'b10
// Access permissions
`define ysyx_040163_AXI_PROT_UNPRIVILEGED_ACCESS                        3'b000
`define ysyx_040163_AXI_PROT_PRIVILEGED_ACCESS                          3'b001
`define ysyx_040163_AXI_PROT_SECURE_ACCESS                              3'b000
`define ysyx_040163_AXI_PROT_NON_SECURE_ACCESS                          3'b010
`define ysyx_040163_AXI_PROT_DATA_ACCESS                                3'b000
`define ysyx_040163_AXI_PROT_INSTRUCTION_ACCESS                         3'b100
// Memory types (AR)
`define ysyx_040163_AXI_ARCACHE_DEVICE_NON_BUFFERABLE                   4'b0000
`define ysyx_040163_AXI_ARCACHE_DEVICE_BUFFERABLE                       4'b0001
`define ysyx_040163_AXI_ARCACHE_NORMAL_NON_CACHEABLE_NON_BUFFERABLE     4'b0010
`define ysyx_040163_AXI_ARCACHE_NORMAL_NON_CACHEABLE_BUFFERABLE         4'b0011
`define ysyx_040163_AXI_ARCACHE_WRITE_THROUGH_NO_ALLOCATE               4'b1010
`define ysyx_040163_AXI_ARCACHE_WRITE_THROUGH_READ_ALLOCATE             4'b1110
`define ysyx_040163_AXI_ARCACHE_WRITE_THROUGH_WRITE_ALLOCATE            4'b1010
`define ysyx_040163_AXI_ARCACHE_WRITE_THROUGH_READ_AND_WRITE_ALLOCATE   4'b1110
`define ysyx_040163_AXI_ARCACHE_WRITE_BACK_NO_ALLOCATE                  4'b1011
`define ysyx_040163_AXI_ARCACHE_WRITE_BACK_READ_ALLOCATE                4'b1111
`define ysyx_040163_AXI_ARCACHE_WRITE_BACK_WRITE_ALLOCATE               4'b1011
`define ysyx_040163_AXI_ARCACHE_WRITE_BACK_READ_AND_WRITE_ALLOCATE      4'b1111
// Memory types (AW)
`define ysyx_040163_AXI_AWCACHE_DEVICE_NON_BUFFERABLE                   4'b0000
`define ysyx_040163_AXI_AWCACHE_DEVICE_BUFFERABLE                       4'b0001
`define ysyx_040163_AXI_AWCACHE_NORMAL_NON_CACHEABLE_NON_BUFFERABLE     4'b0010
`define ysyx_040163_AXI_AWCACHE_NORMAL_NON_CACHEABLE_BUFFERABLE         4'b0011
`define ysyx_040163_AXI_AWCACHE_WRITE_THROUGH_NO_ALLOCATE               4'b0110
`define ysyx_040163_AXI_AWCACHE_WRITE_THROUGH_READ_ALLOCATE             4'b0110
`define ysyx_040163_AXI_AWCACHE_WRITE_THROUGH_WRITE_ALLOCATE            4'b1110
`define ysyx_040163_AXI_AWCACHE_WRITE_THROUGH_READ_AND_WRITE_ALLOCATE   4'b1110
`define ysyx_040163_AXI_AWCACHE_WRITE_BACK_NO_ALLOCATE                  4'b0111
`define ysyx_040163_AXI_AWCACHE_WRITE_BACK_READ_ALLOCATE                4'b0111
`define ysyx_040163_AXI_AWCACHE_WRITE_BACK_WRITE_ALLOCATE               4'b1111
`define ysyx_040163_AXI_AWCACHE_WRITE_BACK_READ_AND_WRITE_ALLOCATE      4'b1111

`define ysyx_040163_AXI_SIZE_BYTES_1                                    3'b000                // 突发宽度一个数据的宽度
`define ysyx_040163_AXI_SIZE_BYTES_2                                    3'b001
`define ysyx_040163_AXI_SIZE_BYTES_4                                    3'b010
`define ysyx_040163_AXI_SIZE_BYTES_8                                    3'b011
`define ysyx_040163_AXI_SIZE_BYTES_16                                   3'b100
`define ysyx_040163_AXI_SIZE_BYTES_32                                   3'b101
`define ysyx_040163_AXI_SIZE_BYTES_64                                   3'b110
`define ysyx_040163_AXI_SIZE_BYTES_128                                  3'b111


module ysyx_040163_axi_rw #(
  parameter RW_DATA_WIDTH     = 128,
  parameter RW_ADDR_WIDTH     = 32,
  parameter RW_STRB_WIDTH     = RW_DATA_WIDTH/8,
  parameter AXI_DATA_WIDTH    = 64,
  parameter AXI_ADDR_WIDTH    = 32,
  parameter AXI_ID_WIDTH      = 4,
  parameter AXI_STRB_WIDTH    = AXI_DATA_WIDTH/8
//parameter AXI_USER_WIDTH    = 1
)(
  input                               clk,
  input                               rst,


  // Cache访存接口
	input                               rw_valid_i,  // 请求有效
	output                              rw_ready_o,  // 访存完成
  input                               rw_wen_i,    // 访存类型 0是读 1是写
  output [RW_DATA_WIDTH-1:0]          rw_r_data_o, // 读数据
  input  [RW_DATA_WIDTH-1:0]          rw_w_data_i, // 写数据
  input  [RW_ADDR_WIDTH-1:0]          rw_addr_i,   // 读/写地址
  input  [RW_STRB_WIDTH-1:0]          rw_wstrb_i,  // 写字节掩码
  input  [1:0]                        rw_burst_i,
  input  [2:0]                        rw_size_i,


  // Advanced eXtensible Interface    AXI4总线接口
  // 写地址通道
  input                               axi_aw_ready_i,  // 从设备已准备好接收地址和相关的控制信号
  output                              axi_aw_valid_o,  // 主设备给出的地址和相关的控制信号有效
  output [AXI_ADDR_WIDTH-1:0]         axi_aw_addr_o,   // 写地址
  output [AXI_ID_WIDTH-1:0]           axi_aw_id_o,     // 写地址ID
  output [7:0]                        axi_aw_len_o,    // 突发长度
  output [2:0]                        axi_aw_size_o,   // 突发大小
  output [1:0]                        axi_aw_burst_o,  // 突发类型

  // 写数据通道
  input                               axi_w_ready_i, // 从设备已准备好接收数据和字节选通信号
  output                              axi_w_valid_o, // 主设备给出的数据和字节选通信号有效
  output [AXI_DATA_WIDTH-1:0]         axi_w_data_o,  // 写出的数据
  output [AXI_STRB_WIDTH-1:0]         axi_w_strb_o,  // 数据的字节选通信号
  output                              axi_w_last_o,  // 标识是否是最后一次突发传输

  // 写响应通道
  output                              axi_b_ready_o, // 主设备已准备好接收写响应信号
  input                               axi_b_valid_i, // 从设备给出的写响应信号有效
  input  [1:0]                        axi_b_resp_i,  // 写传输的状态
  input  [AXI_ID_WIDTH-1:0]           axi_b_id_i,    // 写响应ID

  // 读地址通道
  input                               axi_ar_ready_i,  // 从设备已经准备好接收地址和相关信息
  output                              axi_ar_valid_o,  // 主设备给出的地址和相关信息有效
  output [AXI_ADDR_WIDTH-1:0]         axi_ar_addr_o,   // 读地址
  output [AXI_ID_WIDTH-1:0]           axi_ar_id_o,     // 读地址ID
  output [7:0]                        axi_ar_len_o,    // 突发长度
  output [2:0]                        axi_ar_size_o,   // 突发大小（每次突发传输的大小）
  output [1:0]                        axi_ar_burst_o,  // 突发类型

  // 读数据通道
  output                              axi_r_ready_o, // 主设备已经准备好接收读取的数据和响应信息
  input                               axi_r_valid_i, // 从设备给出的数据和响应信息有效
  input  [1:0]                        axi_r_resp_i,  // 读传输的状态
  input  [AXI_DATA_WIDTH-1:0]         axi_r_data_i,  // 读出的数据
  input                               axi_r_last_i,  // 标识是否是最后一次突发传输
  input  [AXI_ID_WIDTH-1:0]           axi_r_id_i     // 读数据ID
);

//`define DEBUG_AXI4_LOG_WRITE
//`define DEBUG_AXI4_LOG_READ

//------------------------------------------------------------------------
// State Machine - Mem Request
//------------------------------------------------------------------------
  // 访存信号的ready切换
  reg rw_ready;
  assign rw_ready_o = rw_ready;

  reg axi_b_ready;
  reg axi_r_ready;
  
  always @(posedge clk) begin
    if (rst) begin
      rw_ready <= 1'b0;
    end
    // 如果是读请求
    else if (rw_valid_i && ~rw_wen_i) begin
      // 如果读数据通道握手且此时传输的数据是最后一个，则读存请求完成
      if (axi_r_valid_i && axi_r_ready && axi_r_last_i) begin
        rw_ready <= 1'b1;
      end
      else begin
        rw_ready <= 1'b0;
      end
    end
    // 如果是写请求
    else if (rw_valid_i && rw_wen_i) begin
      // 如果写响应通道ok了则拉高
      if (axi_b_ready) begin
        rw_ready <= 1'b1;
      end
      else begin
        rw_ready <= 1'b0;
      end
    end
    // 如果不是有效读写，就置0
    else begin
      rw_ready <= 1'b0;
    end
  end

  // rw_valid_i 上升沿检测
  reg rw_valid_r;
  wire rw_valid_rising;
  assign rw_valid_rising = !rw_valid_r && rw_valid_i;
  always @(posedge clk) begin
    if (rst) begin
      rw_valid_r <= 1'b0;
    end
    else begin
      rw_valid_r <= rw_valid_i;
    end
  end


//------------------------------------------------------------------------
// State Machine - Write Transaction
//------------------------------------------------------------------------
 /* =============================写地址通道=========================== */
  reg axi_aw_valid;

  always @(posedge clk) begin
    if (rst) begin
      axi_aw_valid <= 1'b0;
    end
    // awvalid为0、访存请求有效、访存请求为写请求、且是单次写请求脉冲，发出写地址握手请求
    else if (~axi_aw_valid && rw_valid_i && rw_wen_i && rw_valid_rising) begin
    `ifdef DEBUG_AXI4_LOG_WRITE
      $display("[axi] aw channel sent valid, axi_aw_len_o=%d, axi_w_last_o=%d", axi_aw_len_o, axi_w_last_o);
    `endif
      axi_aw_valid <= 1'b1;
    end
    // 写地址通道ready和valid均为高则握手后拉低
    else if (axi_aw_ready_i && axi_aw_valid) begin
    `ifdef DEBUG_AXI4_LOG_WRITE
      $display("[axi] aw channel shook hand, addr=%x, len=%d, size=%d", axi_aw_addr_o, axi_aw_len_o, axi_aw_size_o);
    `endif
      axi_aw_valid <= 1'b0;
    end
    else begin
      axi_aw_valid <= axi_aw_valid;
    end
  end

  `ifdef VERILATOR
  always @(axi_aw_ready_i) begin
    if (axi_aw_ready_i == 1) begin
      //$display("[axi] axi_aw_ready_i got high");
    end
  end
  `endif


 /* =============================写数据通道=========================== */
  reg axi_w_valid;

  reg axi_w_last;

  reg [7:0] burst_w_counter;

  always @(posedge clk) begin
    if (rst) begin
      axi_w_valid <= 1'b0;
    end
    // wvalid为0、访存请求有效、访存请求为写请求、且是单次写请求脉冲，发出写数据握手请求
    else if (~axi_w_valid && rw_valid_i && rw_wen_i && rw_valid_rising) begin
    //else if (axi_aw_valid_o && axi_aw_ready_i) begin
    `ifdef DEBUG_AXI4_LOG_WRITE
      $display("[axi] w channel sent valid");
    `endif
      axi_w_valid <= 1'b1;
    end
    // 如果正在输出数据（对面准备ok）并且是最后一组数据，则拉低
    // 这边有一点，wvalid一旦拉高，除非数据传输完了即wlast为高，否则不能拉低
    else if (axi_w_ready_i && axi_w_valid && axi_w_last) begin
    `ifdef DEBUG_AXI4_LOG_WRITE
      $display("[axi] w channel shook hand, wdata=%x, strb=%x", axi_w_data_o, axi_w_strb_o);
    `endif
      axi_w_valid <= 1'b0;
    end
    else begin
      axi_w_valid <= axi_w_valid;
    end
  end

  always @(posedge clk) begin
    if (rst) begin
      axi_w_last <= 1'b0;
    end
    /* 如果（握手且大于1的突发传输且满了）或（握手且为0的突发传输）则拉高last */
    else if (((burst_w_counter == axi_aw_len_o-1 && axi_aw_len_o >= 1) && axi_w_valid_o && axi_w_ready_i) || rw_valid_i && rw_wen_i && rw_valid_rising && (axi_aw_len_o == 0)) begin
      axi_w_last <= 1'b1;
    end
    /* 握手时清零 */
    else if (axi_w_last && axi_w_valid_o && axi_w_ready_i) begin
      axi_w_last <= 1'b0;
    end
    else begin
      axi_w_last <= axi_w_last;
    end
  end

  // 发送数据的突发计数器
  always @(posedge clk) begin
    if (rst) begin
      burst_w_counter <= 8'b0;
    end
    // 如果写数据通道处于握手状态且counter并没有超过突发长度
    else if (axi_w_valid && axi_w_ready_i && (burst_w_counter != axi_aw_len_o)) begin
      burst_w_counter <= burst_w_counter + 8'b1;
    end
    // 出现写请求则初始化为0准备计数
    //else if (rw_valid_i && rw_wen_i && ~rw_ready_o && rw_valid_rising) begin
    else if (axi_w_last && axi_w_valid_o && axi_w_ready_i) begin
      burst_w_counter <= 8'b0;
    end
    
    else begin
      burst_w_counter <= burst_w_counter;
    end
  end

  // 对于写数据，如果是实现burst，还需要根据burst_w_counter对写数据的值进行切换


 /* =============================写响应通道=========================== */
  always @(posedge clk) begin
    if (rst) begin
      axi_b_ready <= 1'b0;
    end
    else if (axi_b_valid_i && ~axi_b_ready) begin
    `ifdef DEBUG_AXI4_LOG_WRITE
      $display("[axi] b channel shook hand");
    `endif
      axi_b_ready <= 1'b1;
    end
    else if (axi_b_ready) begin
      axi_b_ready <= 1'b0;
    end
    else begin
      axi_b_ready <= axi_b_ready;
    end
  end


//------------------------------------------------------------------------
// State Machine - Read Transaction
//------------------------------------------------------------------------
 /* =============================读地址通道=========================== */
  reg axi_ar_valid;

  always @(posedge clk) begin
    if (rst) begin
      axi_ar_valid <= 1'b0;
    end
    // arvalid为0、访存请求有效、访存请求为读请求、且是单次读请求脉冲，发出读地址握手请求
    else if ((~axi_ar_valid) && rw_valid_i && (~rw_wen_i) && rw_valid_rising) begin
    `ifdef DEBUG_AXI4_LOG_READ
      $display("[axi] ar channel sent valid");
    `endif
      axi_ar_valid <= 1'b1;
    end
    // 读地址通道ready和valid均为高则握手后拉低
    else if (axi_ar_ready_i && axi_ar_valid) begin
    `ifdef DEBUG_AXI4_LOG_READ
      $display("[axi] ar channel shook hand, addr=%x, len=%d, size=%d", axi_ar_addr_o, axi_ar_len_o, axi_ar_size_o);
    `endif
      axi_ar_valid <= 1'b0;
    end
    else begin
      axi_ar_valid <= axi_ar_valid;
    end
  end


 /* =============================读数据通道=========================== */
  // master准备好接收数据
  always @(posedge clk) begin
    if (rst) begin
      axi_r_ready <= 1'b0;
    end
    // 从设备给出的数据有效即rvalid拉高
    else if (axi_r_valid_i) begin
      // 如果是最后一组数据且该模块正在接收数据，则拉低
      if (axi_r_last_i && axi_r_ready) begin
    `ifdef DEBUG_AXI4_LOG_READ
        $display("[axi] r channel got all the data, rdata=%x", axi_r_data_i);
    `endif
        axi_r_ready <= 1'b0;
      end
      // 否则就是正常接收数据，拉高
      else begin
        axi_r_ready <= 1'b1;
      end
    end
  end

  // 接收数据的突发计数器
  reg [7:0] burst_r_counter;
  always @(posedge clk) begin
    if (rst) begin
      burst_r_counter <= 8'b0;
    end
    // 如果读数据通道处于握手状态且counter并没有超过突发长度
    else if (axi_r_valid_i && axi_r_ready && (burst_r_counter != axi_ar_len_o)) begin
      burst_r_counter <= burst_r_counter + 8'b1;
    end
    // 出现读请求则初始化为0准备计数
    //else if (rw_valid_i && ~rw_wen_i && ~rw_ready_o && rw_valid_rising) begin
    else if (axi_r_last_i && axi_r_ready_o && axi_r_valid_i) begin
      burst_r_counter <= 8'b0;
    end
    else begin
      burst_r_counter <= burst_r_counter;
    end
  end

  // 接收数据
  reg [RW_DATA_WIDTH-1:0] rw_r_data;
  assign rw_r_data_o = rw_r_data;
  always @(posedge clk) begin
    if (rst) begin
      rw_r_data <= 0;
    end
    // 当读数据通道握手时接收数据
    // 如果为了burst，这里需要配合burst_r_counter
    // 原本还加上：是读请求且访存请求合法(rw_valid_i && ~rw_wen_i)，但总感觉是多余的
    else if (axi_r_valid_i && axi_r_ready) begin
      if (burst_r_counter == 0) begin
        rw_r_data[63:0] <= axi_r_data_i;
      end
      else begin
        rw_r_data[127:64] <= axi_r_data_i;
      end
    end
    else begin
      rw_r_data <= rw_r_data;
    end
  end


//------------------------------------------------------------------------
// Shared Constants
//------------------------------------------------------------------------
//parameter AXI_SIZE      = $clog2(AXI_DATA_WIDTH / 8);
  wire [AXI_ID_WIDTH-1:0] axi_id = {AXI_ID_WIDTH{1'b0}}; // 置0即可
  wire [7:0] axi_len      = {6'b0, rw_burst_i}; // 突发长度，有几个transfer
  wire [2:0] axi_size     = rw_size_i; // 突发大小，每个transfer多大数据，外设是4字节，其他的是8字节


//------------------------------------------------------------------------
// Write Transaction
//------------------------------------------------------------------------
  reg [63:0] axi_w_data;
  reg [7:0] axi_w_strb;
  
  // 写地址通道  以下没有备注初始化信号的都可能是你需要产生和用到的
  assign axi_aw_valid_o   = axi_aw_valid;
  assign axi_aw_addr_o    = rw_addr_i;
  assign axi_aw_id_o      = axi_id; // 初始化信号即可
  assign axi_aw_len_o     = axi_len;
  assign axi_aw_size_o    = axi_size;
  assign axi_aw_burst_o   = `ysyx_040163_AXI_BURST_TYPE_INCR;

  // 写数据通道
  assign axi_w_valid_o    = axi_w_valid;
  assign axi_w_data_o     = axi_w_data;
  assign axi_w_strb_o     = axi_w_strb;
  assign axi_w_last_o     = axi_w_last;

  always @(*) begin
    if (burst_w_counter == 0) begin
      axi_w_data = rw_w_data_i[63:0];
      axi_w_strb = rw_wstrb_i[7:0];
    end
    else if (burst_w_counter == 1) begin
      axi_w_data = rw_w_data_i[127:64];
      axi_w_strb = rw_wstrb_i[15:8];
    end
    else begin
      axi_w_data = 0;
      axi_w_strb = 0;
    end
  end

  // 写响应通道
  assign axi_b_ready_o    = axi_b_ready;


//------------------------------------------------------------------------
// Read Transaction
//------------------------------------------------------------------------
  // 读地址通道
  assign axi_ar_valid_o   = axi_ar_valid;
  assign axi_ar_addr_o    = rw_addr_i;
  assign axi_ar_id_o      = axi_id; // 初始化信号即可
  assign axi_ar_len_o     = axi_len;
  assign axi_ar_size_o    = axi_size;
  assign axi_ar_burst_o   = `ysyx_040163_AXI_BURST_TYPE_INCR;

  // 读数据通道
  assign axi_r_ready_o    = axi_r_ready;


endmodule
module ysyx_040163_booth_code #(DATA_WIDTH = 64) (
  input wire [DATA_WIDTH-1:0] multiplicand, // 被乘数
  input wire [2:0] code, // 乘数对应位
  output reg [DATA_WIDTH:0] out, // 部分积结果，相比被乘数又多了一位符号位，因为booth两位会涉及到1位位移操作
  output reg [1:0] c // “取反+1”的+1
);

  /* 获取被乘数符号 */
  wire sign = multiplicand[DATA_WIDTH-1];

  /* 部分积结果生成，根据乘数的三位 */
  always @(*) begin
    case(code[2:0])
      3'b000: out = { (DATA_WIDTH + 1){1'b0} }; // +0
      3'b001: out = { sign, multiplicand }; // +[X]补
      3'b010: out = { sign, multiplicand }; // +[X]补
      3'b011: out = { multiplicand, 1'b0 }; // +2[X]补
      3'b100: out = {~multiplicand, 1'b1 }; // -2[X]补，至于这么写是因为存在公式-2X={X,1}+1
      3'b101: out = {~sign, ~multiplicand }; // -[X]补
      3'b110: out = {~sign, ~multiplicand }; // -[X]补
      3'b111: out = { (DATA_WIDTH + 1){1'b0} }; // +0
      default: out = { (DATA_WIDTH + 1){1'b0} }; // never got here
    endcase
  end

  /* 部分积是否还需要取反+1，即取负数 */
  always @(*) begin
    case(code[2:0])
      3'b000: c = 2'b00;
      3'b001: c = 2'b00;
      3'b010: c = 2'b00;
      3'b011: c = 2'b00;
      3'b100: c = 2'b01;
      3'b101: c = 2'b01;
      3'b110: c = 2'b01;
      3'b111: c = 2'b00;
      default: c = 2'b00; // never got here
    endcase
  end

endmodule
module ysyx_040163_clint (
  input  wire        clk,
  input  wire        rst,
  input  wire        clint_op,
  input  wire        clint_valid,
  input  wire [63:0] clint_addr,
  input  wire [63:0] clint_wdata,
  input  wire  [7:0] clint_wstrb,
  output wire [63:0] clint_rdata,
//output wire        clint_data_ok,
//output wire        clint_addr_ok,
  output wire        timer_irq,
  output wire        soft_irq
);

//------------------------------------------------------------------------
// CLINT Register
//------------------------------------------------------------------------
  /* CLINT寄存器地址映射 */
//localparam msip_addr_begin     = 64'h2000000;
//localparam msip_addr_end       = 64'h2000003;
  localparam mtimecmp_addr_begin = 64'h2004000;
  localparam mtimecmp_addr_end   = 64'h2004007;
  localparam mtime_addr_begin    = 64'h200BFF8;
  localparam mtime_addr_end      = 64'h200BFFF;

  wire [63:0] mtime_d, mtime_wdata;
  wire [63:0] mtimecmp_d, mtimecmp_wdata;

  /* ==============================mtime============================= */
  // 机器模式计时器寄存器
  // Machine-Mode Timer Register
  reg [63:0] mtime;
  
  wire [63:0] mtime_inc;
  assign mtime_inc = mtime + 64'b1;

  always @(posedge clk) begin
    if (rst) begin
      mtime <= 0;
    end
    else begin
      mtime <= mtime_d;
    end
  end

  /* ============================mtimecmp============================ */
  // 机器模式计时器比较寄存器
  // Machine-Mode Timer Compare Register
  reg [63:0] mtimecmp;

  always @(posedge clk) begin
    if (rst) begin
      mtimecmp <= 0;
    end
    else begin
      mtimecmp <= mtimecmp_d;
    end
  end

//------------------------------------------------------------------------
// CLINT Write Port
//------------------------------------------------------------------------
  wire mtime_we;
  wire mtimecmp_we;

  assign mtime_we = clint_op & clint_valid & ((clint_addr >= mtime_addr_begin) && (clint_addr <= mtime_addr_end));
  assign mtimecmp_we = clint_op & clint_valid & ((clint_addr >= mtimecmp_addr_begin) && (clint_addr <= mtimecmp_addr_end));

  for (genvar i = 0; i < 8; i = i + 1) begin
    assign mtime_wdata[(i*8)+:8]     = clint_wstrb[i] ? clint_wdata[i*8+:8] : mtime[(i*8)+:8];
    assign mtimecmp_wdata[(i*8)+:8]  = clint_wstrb[i] ? clint_wdata[i*8+:8] : mtimecmp[(i*8)+:8];
  end

  assign mtime_d = mtime_we ? mtime_wdata : mtime_inc;
  assign mtimecmp_d = mtimecmp_we ? mtimecmp_wdata : mtimecmp;

//------------------------------------------------------------------------
// CLINT Read Port
//------------------------------------------------------------------------
  reg [63:0] rdata_d, rdata;

  always @(*) begin
    rdata_d = 0;
    if ((clint_addr >= mtimecmp_addr_begin) && (clint_addr <= mtimecmp_addr_end)) begin
      rdata_d = mtimecmp;
    end
    else if ((clint_addr >= mtime_addr_begin) && (clint_addr <= mtime_addr_end)) begin
      rdata_d = mtime;
    end
  end

  always @(*) begin
    rdata = 0;
    if ((~clint_op) && clint_valid) begin
      rdata = rdata_d;
    end
  end
  
  assign clint_rdata = rdata;

//------------------------------------------------------------------------
// CLINT Logic Control
//------------------------------------------------------------------------
  // timer中断生成逻辑
  // until mtimecmp is changed, timer_irq remains
  wire timer_irq_d;
  reg timer_irq_q;
  assign timer_irq_d = ((mtime >= mtimecmp) | timer_irq_q) & (~mtimecmp_we);
  assign timer_irq = timer_irq_q;
  always @(posedge clk) begin
    if (rst) begin
      timer_irq_q <= 0;
    end
    else begin
      timer_irq_q <= timer_irq_d;
    end
  end

  // software中断生成逻辑
  assign soft_irq = 0;

  /* clint必定能在一个周期完成读或者写，因此都是1 */
//assign clint_data_ok = 1;
//assign clint_addr_ok = 1;

endmodule
module ysyx_040163_ControlUnit (
  input  wire  [4:0] reg_raddr_1_id,
  input  wire  [4:0] reg_raddr_2_id,
  input  wire  [4:0] reg_raddr_1_ex,
  input  wire  [4:0] reg_raddr_2_ex,
  input  wire        ram_load_en_ex,
  input  wire  [4:0] reg_waddr_ex,
  input  wire  [4:0] reg_waddr_mem,
  input  wire        csr_wen_mem,
  input  wire        jmp_flag_ex,

  input dcache_data_ok,
  input dcache_addr_ok,

  input if_stall_req,
  input csr_flush_req,
  input alu_stall_req,

  output wire        pc_stall,
  output wire        if_id_stall,
  output wire        id_ex_stall,
  output wire        ex_mem_stall,
  output wire        mem_wb_stall,

  output wire        if_id_flush,
  output wire        id_ex_flush,
  output wire        ex_mem_flush,
  output wire        mem_wb_flush
);

  wire load_use_stall;
  assign load_use_stall = ram_load_en_ex && ((reg_waddr_ex == reg_raddr_1_id) | (reg_waddr_ex == reg_raddr_2_id));
  
  /* 专门解决csr-use的冒险，csr读取并更新寄存器是在wb，但如果后一条指令是在ex或者在mem执行的话，前一种情况需要stall再bypass */
  wire csr_use_stall;
  assign csr_use_stall = csr_wen_mem && ((reg_waddr_mem == reg_raddr_1_ex) | (reg_waddr_mem == reg_raddr_2_ex)) && (reg_waddr_mem != 0);

  assign pc_stall = if_id_stall;
  assign if_id_stall = id_ex_stall;
  assign id_ex_stall = ex_mem_stall | load_use_stall;
  assign ex_mem_stall = mem_wb_stall | (~dcache_addr_ok) | csr_use_stall | alu_stall_req;
  assign mem_wb_stall = (~dcache_data_ok) | if_stall_req;

  assign if_id_flush = jmp_flag_ex | csr_flush_req;
  assign id_ex_flush = load_use_stall | jmp_flag_ex | csr_flush_req;
  assign ex_mem_flush = csr_flush_req;
  assign mem_wb_flush = csr_flush_req;

endmodule
module ysyx_040163_csr (
  input wire clk,
  input wire rst,

  input wire  [4:0] uimm,
  input wire  [3:0] csr_inst_type,
  input wire [63:0] reg_rdata_1_wb,
  input wire [11:0] csr_addr,
  input wire        csr_wen,
  input wire [63:0] pc_wb,
  input wire        valid_wb,

  input wire        software_irq,
  input wire        timer_irq,
  input wire        alldone,
  input wire got_interrupt_wb,

  output wire has_irq,

  output wire [63:0] csr_rdata,
  output reg         csr_flush_req,
  output reg         csr_jmp_req,
  output reg  [63:0] csr_jmp_addr
);

  parameter INST_CSRRW  = 4'b0001;
  parameter INST_CSRRS  = 4'b0010;
  parameter INST_CSRRC  = 4'b0011;
  parameter INST_CSRRWI = 4'b0100;
  parameter INST_CSRRSI = 4'b0101;
  parameter INST_CSRRCI = 4'b0110;
  parameter INST_ECALL  = 4'b0111;
  parameter INST_MRET   = 4'b1000;
  
  // csr写入x[rd]，x[rs1]写入csr，
//wire csrrw_w  = csr_inst_type == INST_CSRRW;
  // csr写入x[rd]，csr与x[rs1]按位或，结果写入csr
//wire csrrs_w  = csr_inst_type == INST_CSRRS;
  // csr写入x[rd]，csr与~x[rs1]按位与，结果写入csr
//wire csrrc_w  = csr_inst_type == INST_CSRRC;
  // csr写入x[rd]，uimm写入csrf
//wire csrrwi_w = csr_inst_type == INST_CSRRWI;
  // csr写入x[rd]，csr与uimm按位或，结果写入csr
//wire csrrsi_w = csr_inst_type == INST_CSRRSI;
  // csr写入x[rd]，csr与~uimm按位与，结果写入csr
//wire csrrci_w = csr_inst_type == INST_CSRRCI;
  // 环境调用
  wire ecall_w  = csr_inst_type == INST_ECALL;
  // 从中断异常处理程序返回
  wire mret_w   = csr_inst_type == INST_MRET;

  reg [63:0] csr_wdata;
  always @(*) begin
    case (csr_inst_type)
      INST_CSRRW: begin
        csr_wdata = reg_rdata_1_wb;
      end
      INST_CSRRWI: begin
        csr_wdata = {59'b0, uimm};
      end
      INST_CSRRS: begin
        csr_wdata = csr_rdata | reg_rdata_1_wb;
      end
      INST_CSRRSI: begin
        csr_wdata = csr_rdata | {59'b0, uimm};
      end
      INST_CSRRC: begin
        csr_wdata = csr_rdata & (~reg_rdata_1_wb);
      end
      INST_CSRRCI: begin
        csr_wdata = csr_rdata & (~{59'b0, uimm});
      end
      default: begin
        csr_wdata = 64'b0;
      end
    endcase
  end
  
  wire meip, mtip, msip, has_ip;
  assign has_ip = meip | mtip | msip;

//------------------------------------------------------------------------
// CSR
//------------------------------------------------------------------------
  parameter CSR_MSTATUS = 12'h300;
  //parameter CSR_MISA = 12'h301;
  //parameter CSR_MEDELEG = 12'h302;
  //parameter CSR_MIDELEG = 12'h303;
  parameter CSR_MIE = 12'h304;
  parameter CSR_MTVEC = 12'h305;
  //parameter CSR_MSCRATCH = 12'h340;
  parameter CSR_MEPC = 12'h341;
  parameter CSR_MCAUSE = 12'h342;
  //parameter CSR_MTVAL = 12'h343;
  parameter CSR_MIP = 12'h344;

  /* =============================mstatus============================ */
  // 机器模式状态寄存器
  // {SD(1), WPRI(8), TSR(1), TW(1), TVM(1), MXR(1), SUM(1), MPRV(1), XS(2),
  //  FS(2), MPP(2), WPRI(2), SPP(1), MPIE(1), WPRI(1), SPIE(1), UPIE(1), MIE(1), WPRI(1), SIE(1), UIE(1)}
  reg [63:0] mstatus;
  //wire mstatus_mpie = mstatus[7];
  wire mstatus_mie = mstatus[3];
  
  //assign has_irq = alldone & has_ip & mstatus_mie;
  assign has_irq = has_ip & mstatus_mie;
  wire is_interrupt = has_ip & mstatus_mie & valid_wb & got_interrupt_wb;
  //wire is_interrupt = has_ip & mstatus_mie & got_interrupt_wb;
  wire is_exception = (ecall_w | mret_w) & valid_wb;

  reg set_mstatus, clr_mstatus;

  always @(posedge clk) begin
    if (rst) begin
      mstatus <= 64'hA00001800;
    end
    else if (set_mstatus) begin
      mstatus[7] <= mstatus[3];
      mstatus[3] <= 1'b0;
    end
    else if (clr_mstatus) begin
      mstatus[3] <= mstatus[7];
      mstatus[7] <= 1'b1;
    end
    else if (csr_wen && csr_addr == CSR_MSTATUS) begin
      mstatus <= csr_wdata;
    end

  end

  /* ===============================mie============================== */
  // 机器模式中断使能寄存器
  // Machine Interrupt-Enable Register
  // mie: {WPRI[63:12], MEIE(1), WPRI(1), SEIE(1), UEIE(1), MTIE(1), WPRI(1), STIE(1), UTIE(1), MSIE(1), WPRI(1), SSIE(1), USIE(1)}
  reg [63:0] mie;
  wire mie_ext = mie[11];
  wire mie_timer = mie[7];
  wire mie_soft = mie[3];

  always @(posedge clk) begin
    if (rst) begin
      mie <= {52'b0, 1'b1, 3'b0, 1'b1, 3'b0, 1'b1, 3'b0};
    end
    else if (csr_wen && csr_addr == CSR_MIE) begin
      mie <= csr_wdata;
    end
  end

  /* ==============================mtvec============================= */
  // 机器模式异常入口基地址寄存器
  reg [63:0] mtvec;
  wire [61:0] mtvec_base = mtvec[63:2];
  //wire [1:0] mtvec_mode = mtvec[1:0];

  always @(posedge clk) begin
    if (rst) begin
      mtvec <= 64'b0;
    end
    else if (csr_wen && csr_addr == CSR_MTVEC) begin
      mtvec <= csr_wdata;
    end
  end

  /* ==============================mepc============================== */
  // 机器模式异常PC寄存器
  reg [63:0] mepc;

  reg set_mepc;

  always @(posedge clk) begin
    if (rst) begin
      mepc <= 64'b0;
    end
    else if (set_mepc) begin
      mepc <= {pc_wb[63:2], 2'b0};
    end
    else if (csr_wen && csr_addr == CSR_MEPC) begin
      mepc <= {csr_wdata[63:2], 2'b0};
    end
  end

  /* =============================mcause============================= */
  // 机器模式异常原因寄存器
  reg [63:0] mcause;
  //wire mcause_int = mcause[63];
  //wire [62:0] mcause_cause = mcause[62:0];

  reg set_mcause;

  always @(posedge clk) begin
    if (rst) begin
      mcause <= 64'b0;
    end
    else if (set_mcause) begin
      if (is_interrupt) begin
        if (software_irq) begin
          mcause <= (1 << 63) + 64'd3;
        end
        else if (timer_irq) begin
          mcause <= (1 << 63) + 64'd7;
        end
      end
      else if (ecall_w) begin
        mcause <= 64'd11;
      end
      else begin
        mcause <= 64'b0;
      end
    end
    else if (csr_wen && csr_addr == CSR_MCAUSE) begin
      mcause <= csr_wdata;
    end
  end

  /* ===============================mip============================== */
  // 机器模式中断等待寄存器
  // mip: {WPRI[63:12], MEIP(1), WPRI(1), SEIP(1), UEIP(1), MTIP(1), WPRI(1), STIP(1), UTIP(1), MSIP(1), WPRI(1), SSIP(1), USIP(1)}
  reg [63:0] mip;
  wire mip_ext = mip[11];
  wire mip_timer = mip[7];
  wire mip_soft = mip[3];

  assign meip = mie_ext & mip_ext;
  assign mtip = mie_timer & mip_timer;
  assign msip = mie_soft & mip_soft;

  always @(posedge clk) begin
    if (rst) begin
      mip <= 64'b0;
    end
    else begin
      /* 这边就当作mip是read-only了，指令不能修改mip */
      //mip[11] <= ext_irq;
      mip[7] <= timer_irq;
      //mip[3] <= soft_irq;
    end
  end

//------------------------------------------------------------------------
// CSR Read Port
//------------------------------------------------------------------------
  reg [63:0] rdata;
  always @(*) begin
    rdata = 64'b0;
    case(csr_addr)
      CSR_MSTATUS: rdata = mstatus;
      CSR_MIE: rdata = mie;
      CSR_MTVEC: rdata = mtvec;
      CSR_MEPC: rdata = mepc;
      CSR_MCAUSE: rdata = mcause;
      CSR_MIP: rdata = mip;
      default: rdata = 64'b0;
    endcase
  end

  assign csr_rdata = rdata;

//------------------------------------------------------------------------
// CSR Logic Control
//------------------------------------------------------------------------
  always @(*) begin
    set_mepc = 1'b0;
    set_mcause = 1'b0;
    set_mstatus = 1'b0;
    clr_mstatus = 1'b0;
    csr_flush_req = 1'b0;
    csr_jmp_req = 1'b0;
    csr_jmp_addr = 64'b0;

    if (is_interrupt) begin
      if (alldone) begin
      set_mepc = 1'b1;
      set_mcause = 1'b1;
      set_mstatus = 1'b1;
      csr_flush_req = 1'b1;
      csr_jmp_req = 1'b1;
      csr_jmp_addr = {mtvec_base, 2'b0};
      end
    end
    /* ecall */
    else if (is_exception && ecall_w) begin
      set_mepc = 1'b1;
      set_mcause = 1'b1;
      set_mstatus = 1'b1;
      csr_flush_req = 1'b1;
      csr_jmp_req = 1'b1;
      csr_jmp_addr = {mtvec_base, 2'b0};
    end
    /* mret */
    else if (is_exception && mret_w) begin
      clr_mstatus = 1'b1;
      csr_flush_req = 1'b1;
      csr_jmp_req = 1'b1;
      csr_jmp_addr = mepc;
    end
  end

endmodule
module ysyx_040163_dcache (
  input wire         clk,
  input wire         rst,

  input wire         dcache_op,      /* 操作类型，1写，0读 */
  input wire         dcache_valid,   /* 请求有校 */
  input wire  [63:0] dcache_addr,    /* 请求地址 */
  input wire  [63:0] dcache_wdata,   /* 写数据 */
  input wire   [7:0] dcache_wstrb,   /* 写字节使能，1组有4个字 */
  output wire [63:0] dcache_rdata,   /* 读取的数据 */
  output reg         dcache_data_ok, /* 数据读取完成或者数据写入完成 */
  output wire        dcache_addr_ok, /* 本次请求接收完成 */

  input wire         dcache_invalidate,

  // Cache访存接口
	output         rw_valid_o,  // 请求有效
	input          rw_ready_i,  // 访存完成
  output         rw_wen_o,    // 访存类型 0是读 1是写
  input  [127:0] rw_r_data_i, // 读数据
  output [127:0] rw_w_data_o, // 写数据
  output  [31:0] rw_addr_o,   // 读/写地址
  output  [15:0] rw_wstrb_o,  // 写字节掩码
  output   [1:0] rw_burst_o,  // 突发长度 00是1，01是2，目前只可能是这两个值
  output   [2:0] rw_size_o,

  output   [5:0] io_sram4_addr,
  output         io_sram4_cen,
  output         io_sram4_wen,
  output [127:0] io_sram4_wmask,
  output [127:0] io_sram4_wdata,
  input  [127:0] io_sram4_rdata,

  output   [5:0] io_sram5_addr,
  output         io_sram5_cen,
  output         io_sram5_wen,
  output [127:0] io_sram5_wmask,
  output [127:0] io_sram5_wdata,
  input  [127:0] io_sram5_rdata,

  output   [5:0] io_sram6_addr,
  output         io_sram6_cen,
  output         io_sram6_wen,
  output [127:0] io_sram6_wmask,
  output [127:0] io_sram6_wdata,
  input  [127:0] io_sram6_rdata,

  output   [5:0] io_sram7_addr,
  output         io_sram7_cen,
  output         io_sram7_wen,
  output [127:0] io_sram7_wmask,
  output [127:0] io_sram7_wdata,
  input  [127:0] io_sram7_rdata
);

/* ===========================Pre-process========================== */
  /* Cache */
  localparam IDLE   = 3'b000;
  localparam LOOKUP = 3'b001;
  localparam WBACK  = 3'b010;
  localparam REFILL = 3'b011;
  localparam WRITE  = 3'b100;
  localparam INVAL  = 3'b101;
  localparam CLEAR  = 3'b110;
  localparam RVALID = 3'b111;

  wire [20:0] tag         = dcache_addr[31:11]; /* tag */
  wire  [6:0] index       = dcache_addr[10:4];  /* index */
  wire        word_offset = dcache_addr[3];     /* word_offset，1个cacheline共2字 */
  //wire  [2:0] byte_offset = dcache_addr[2:0];   /* byte_offset，1个字共8字节 */
  wire [1:0] way_hit;

  reg [2:0] state_d, state_q; // 次态 现态
  reg read_hit_ok, write_hit_ok, miss_ok, req_ok;
  //reg uncached_ok;
  reg [63:0] hit_count, miss_count, all_count;

  reg [8:0] inval_count;

  wire [63:0] load_word_way [0:1];

  reg inval_wb, inval_wb_r; // 需要写回、需要清valid位

  reg device_req;

  reg word_offset_miss;

  wire [127:0] refill_data, refill_data_store, refill_data_load;

  reg [31:0] addr_req;

  wire [127:0] rdata_data [0:1];

  reg rw_wen, rw_valid;

  reg [31:0] rw_addr, rw_addr_r;
  reg [127:0] rw_w_data, rw_w_data_r;

  wire cache_hit, cache_miss;

  reg op_req;

  reg invalidate_req;

  wire dirty;

  reg replace_way;

  wire [1:0] rdata_v;

  reg uncached_req;

  wire [20:0] rdata_tag [0:1];

  reg [6:0] index_req;
  reg [63:0] wdata_req;
  reg word_offset_req;

  wire [63:0] data_wstrb_miss;
  wire [127:0] data_wstrb_write;

  reg [20:0] tag_req;

  wire [1:0] rdata_dirty;

  reg [20:0] tag_miss;
  reg [6:0] index_miss;

  genvar i; /* 为后面的generate for准备的 */

  /* 由于是阻塞Cache，所以向前向后的阻塞是一致的 */
  //assign dcache_data_ok = read_hit_ok | write_hit_ok | miss_ok | uncached_ok; /* 读命中|写命中|miss处理完|uncached结束 */
  assign dcache_addr_ok = dcache_data_ok;

  wire IDLE_LOOKUP   = (state_q == IDLE   && state_d == LOOKUP); // 所有请求的必经之路
  wire LOOKUP_WBACK  = (state_q == LOOKUP && state_d == WBACK); // 发出总线写请求
  wire LOOKUP_REFILL = (state_q == LOOKUP && state_d == REFILL); // 发出总线读请求
  wire LOOKUP_IDLE   = (state_q == LOOKUP && state_d == IDLE); //
  wire LOOKUP_WRITE  = (state_q == LOOKUP && state_d == WRITE); //
  //wire WRITE_IDLE    = (state_q == WRITE  && state_d == IDLE); // 写hit回到idle
  //wire WBACK_REFILL  = (state_q == WBACK  && state_d == REFILL); // 发出总线读请求
  wire REFILL_IDLE   = (state_q == REFILL && state_d == IDLE); // 将总线读响应写回cache并回到idle
  //wire LOOKUP_RVALID = (state_q == LOOKUP && state_d == RVALID); // 启动invalidate流程
  wire RVALID_INVAL  = (state_q == RVALID && state_d == INVAL); //
  wire INVAL_CLEAR   = (state_q == INVAL  && state_d == CLEAR); //
  //wire CLEAR_CLEAR   = (state_q == CLEAR  && state_d == CLEAR); //
  wire RVALID_IDLE   = (state_q == RVALID && state_d == IDLE); //
  wire INVAL_RVALID  = (state_q == INVAL  && state_d == RVALID); //
  wire CLEAR_RVALID  = (state_q == CLEAR  && state_d == RVALID);

  /* rdata来源为DataSRAM或者总线读取值 */
  reg [63:0] load_res, load_res_last;
  always @(*) begin
    if (LOOKUP_IDLE) begin
      load_res = {64{way_hit[0]}} & load_word_way[0]
               | {64{way_hit[1]}} & load_word_way[1];
    end
    else if (REFILL_IDLE) begin
      if (~device_req) begin
        load_res = word_offset_miss ? refill_data[127:64] : refill_data[63:0];
      end
      else begin
        load_res[31:0] = addr_req[2] ? 32'b0 : refill_data[31:0];
        load_res[63:32] = addr_req[2] ? refill_data[31:0] : 32'b0;
      end
    end
    else begin
      load_res = load_res_last;
    end
  end
  // 考虑到整个核，会有更多的stall，因此需要维稳
  always @(posedge clk) begin
    if (rst) begin
      load_res_last <= 0;
    end
    else begin
      load_res_last <= load_res;
    end
  end

  assign dcache_rdata = load_res;

  assign load_word_way[0] = word_offset ? rdata_data[0][127:64] : rdata_data[0][63:0];
  assign load_word_way[1] = word_offset ? rdata_data[1][127:64] : rdata_data[1][63:0];

  wire uncached, device;
  assign uncached = (~(dcache_addr >= 64'h80000000 || dcache_invalidate));
  assign device = (dcache_addr < 64'h80000000 && ~dcache_invalidate);

/* ==========================Cache Control========================= */
  // 性能计数
  always @(posedge clk) begin
    if (rst) begin
      hit_count <= 0;
      miss_count <= 0;
      all_count <= 0;
    end
    else begin
      // hit计数
      if (read_hit_ok || write_hit_ok) begin
        hit_count <= hit_count + 1;
      end
      else begin
        hit_count <= hit_count;
      end

      // miss计数
      if (miss_ok) begin
        miss_count <= miss_count + 1;
      end
      else begin
        miss_count <= miss_count;
      end

      // 所有请求计数
      if (req_ok) begin
        all_count <= all_count + 1;
      end
      else begin
        all_count <= all_count;
      end
    end
  end

  always @(*) begin
    state_d = state_q;
    read_hit_ok = 0;
    write_hit_ok = 0;
    miss_ok = 0;
    req_ok = 0;
  //uncached_ok = 0;
    dcache_data_ok = 0;

    rw_wen = 0;
    rw_valid = 0;
    rw_addr = 0;
    rw_w_data = 0;

    inval_wb = 0;
  //inval_clear = 0;

    case (state_q)
      /* 空闲状态，等待接受到有效请求 */
      IDLE: begin
        /* 有写/读请求，且请求有效 */
        if (dcache_valid) begin
          //$display("[dcache] IDLE->LOOKUP");
          req_ok = 1;
          state_d = LOOKUP;
        end
        /* 没有写/读请求，或请求无效 */
        else begin
          dcache_data_ok = 1;
          state_d = IDLE;
        end
      end

      /* 接收到有效请求并缓存，读取tag和data */
      LOOKUP: begin
        /* cache_hit且是写请求 */
        if (cache_hit && op_req) begin
          //$display("[dcache] LOOKUP->WRITE");
          state_d = WRITE;
        end
        /* cache进入invalidate */
        else if (invalidate_req) begin
          state_d = RVALID;
        end
        /* cache_hit且是读请求 */
        else if (cache_hit && ~op_req) begin
          //$display("[dcache] LOOKUP->IDLE");
          dcache_data_ok = 1;
          read_hit_ok = 1;
          state_d = IDLE;
        end
        /* 如果(miss且dirty且valid)或(uncached且写) 则先写回 */
        else if ((cache_miss && dirty && rdata_v[replace_way] && ~uncached_req) || (uncached_req && op_req)) begin
          rw_wen = 1;
          rw_valid = 1;
          rw_addr = (uncached_req ? (device_req ? {addr_req[31:0]} : {addr_req[31:4], 4'b0}) : {rdata_tag[replace_way], index_req, 4'b0});
          rw_w_data = (uncached_req ? (device_req ? {64'b0, addr_req[2] ? {32'b0, wdata_req[63:32]} : {32'b0, wdata_req[31:0]}} : (word_offset_req ? {wdata_req, 64'b0} : {64'b0, wdata_req})) : (replace_way ? rdata_data[1] : rdata_data[0]));
          state_d = WBACK;
          //$display("[dcache] LOOKUP->WBACK, addr=%h", rw_addr);
        end
        /* 如果miss且(不dirty或不valid)或(uncached且读) 则发出读请求 */
        else if ((cache_miss && (~dirty || ~rdata_v[replace_way]) && ~uncached_req) || (uncached_req && ~op_req)) begin
          rw_wen = 0;
          rw_valid = 1;
          //rw_addr = (uncached_req ? (device_req ? {addr_req[31:2], 2'b0} : {addr_req[31:4], 4'b0}) : {tag_req, index_req, 4'b0});
          rw_addr = (uncached_req ? (device_req ? {addr_req[31:0]} : {addr_req[31:4], 4'b0}) : {tag_req, index_req, 4'b0});
          state_d = REFILL;
          //$display("[dcache] LOOKUP->REFILL, addr=%h", rw_addr);
        end
      end

      /* 读取data dirty valid */
      RVALID: begin
        if (inval_count == 9'b100000000) begin
          dcache_data_ok = 1;
          state_d = IDLE;
        end
        else begin
          state_d = INVAL;
        end
      end

      /* 根据读取到的信息锁存并分析 */
      INVAL: begin
        /* 如果是valid，则需要清valid */
        if (rdata_v[inval_count[0]]) begin
        //inval_clear = 1;
          state_d = CLEAR;
          /* 如果进一步是dirty，还需要写回 */
          if (rdata_dirty[inval_count[0]]) begin
            inval_wb = 1;
            rw_wen = 1;
            rw_valid = 1;
            rw_addr = {(inval_count[0] ? rdata_tag[1] : rdata_tag[0]), {inval_count[7:1]}, 4'b0};
            rw_w_data = (inval_count[0] ? rdata_data[1] : rdata_data[0]);
          end
        end
        else begin
          state_d = RVALID;
        end
      end

      /* 向总线发出写回（按需）并清除valid（必须） */
      CLEAR: begin
      //inval_clear = 0;
        /* 如果写回信号为高 */
        if (inval_wb_r) begin
          /* 检测发向总线的请求是否返回，返回则返回inval并清除写回信号 */
          if (rw_ready_i) begin
            rw_valid = 0;
            inval_wb = 0;
            state_d = RVALID;
            //$display("[dcache] CLEAR->RVALID, inval_count = %h", inval_count);
          end
          /* 无返回则继续等待 */
          else begin
            state_d = CLEAR;
            rw_wen = 1;
            rw_valid = 1;
            rw_addr = rw_addr_r;
            rw_w_data = rw_w_data_r;
            inval_wb = 1;
          end
        end
        /* 写回信号不为高则直接返回INVAL，无其他动作 */
        else begin
          state_d = INVAL;
        end
      end

      /* 写hit，转换到IDLE时进行写入操作 */
      WRITE: begin
        //$display("[dcache] WRITE->IDLE");
        /* 写hit */
        dcache_data_ok = 1;
        write_hit_ok = 1;
        state_d = IDLE;
      end

      WBACK: begin
        // 总线写请求没ready则继续等待
        if (~rw_ready_i) begin
          state_d = WBACK;
          rw_wen = 1;
          rw_valid = 1;
          rw_addr = rw_addr_r;
          rw_w_data = rw_w_data_r;
        end
        // ready则根据uncached判断下一步
        else if (rw_ready_i) begin
          if (uncached) begin
            //$display("[dcache] WBACK->IDLE");
            rw_wen = 0;
            dcache_data_ok = 1;
          //uncached_ok = 1;
            state_d = IDLE;
          end
          else if (~uncached) begin
            rw_wen = 0;
            rw_valid = 1;
            rw_addr = {tag_miss, index_miss, 4'b0};
            //$display("[dcache] WBACK->REFILL");
            state_d = REFILL;
          end
        end
      end

      /* 等待读取的值，转换到IDLE态时执行写入操作 */
      REFILL: begin
        /* 总线读请求ready */
        if (rw_ready_i) begin
          //$display("[dcache] REFILL->IDLE");
          dcache_data_ok = 1;
          miss_ok = 1;
          state_d = IDLE;
        end
        /* 总线读请求还没ready */
        else if (~rw_ready_i) begin
          rw_valid = 1;
          rw_wen = 0;
          rw_addr = rw_addr_r;
          state_d = REFILL;
        end
      end

      /* 未知领域，误入歧途 */
      default: begin
        state_d = 3'bx;
      end
    endcase
  end

  always @(posedge clk) begin
    if (rst) begin
      state_q <= IDLE;
      rw_addr_r <= 0;
      rw_w_data_r <= 0;
      inval_wb_r <= 0;
    end
    else begin
      state_q <= state_d;
      rw_addr_r <= rw_addr;
      rw_w_data_r <= rw_w_data;
      inval_wb_r <= inval_wb;
    end
  end

  always @(posedge clk) begin
    if (rst) begin
      inval_count <= 0;
    end
    else if (IDLE_LOOKUP | RVALID_IDLE) begin
      inval_count <= 0;
    end
    else if (INVAL_RVALID | CLEAR_RVALID) begin
      inval_count <= inval_count + 1;
    end
    else begin
      inval_count <= inval_count;
    end
  end

/* =======================Replacement Policy======================= */
  always @(posedge clk) begin
    if (rst) begin
      replace_way <= 0;
    end
    else begin
      replace_way <= replace_way + 1;
    end
  end

/* =========================Request Buffer========================= */
  // 所有请求的第一步，将请求内容以及uncached情况进行锁存
  reg  [7:0] wstrb_req;

  always @(posedge clk) begin
    if (rst) begin
      op_req <= 0;
      addr_req <= 0;
      wdata_req <= 0;
      wstrb_req <= 0;
      tag_req <= 0;
      index_req <= 0;
      word_offset_req <= 0;
      uncached_req <= 0;
      device_req <= 0;
      invalidate_req <= 0;
    end
    else if (IDLE_LOOKUP) begin
      op_req <= dcache_op;
      addr_req <= dcache_addr[31:0];
      wdata_req <= dcache_wdata;
      wstrb_req <= dcache_wstrb;
      tag_req <= tag;
      index_req <= index;
      word_offset_req <= word_offset;
      uncached_req <= uncached;
      device_req <= device;
      invalidate_req <= dcache_invalidate;
    end
  end

  generate
    for (i = 0; i < 2; i = i + 1) begin : wayhit
      assign way_hit[i] = rdata_v[i] && (rdata_tag[i] == tag_req);
    end
  endgenerate

  /* Cache是否hit */
  assign cache_hit = |way_hit;
  assign cache_miss = ~cache_hit;

/* ===========================Miss Buffer========================== */
  // 读/写miss，将miss处理需要的数据进行缓存
  reg op_miss;
  reg [63:0] wdata_miss;
  reg [7:0] wstrb_miss;
//reg [2:0] byte_offset_miss;
  reg replace_way_miss;
//reg [20:0] rdata_tag_miss [0:1];
//reg [1:0] rdata_v_miss;
//reg [1:0] rdata_d_miss;
//reg [127:0] rdata_data_miss [0:1];

  always @(posedge clk) begin
    if (rst) begin
      op_miss <= 0;
      wdata_miss <= 0;
      wstrb_miss <= 0;
      tag_miss <= 0;
      index_miss <= 0;
      word_offset_miss <= 0;
    //byte_offset_miss <= 0;
      replace_way_miss <= 0;
    //rdata_tag_miss[0] <= 0;
    //rdata_tag_miss[1] <= 0;
    //rdata_v_miss <= 0;
    //rdata_d_miss <= 0;
    //rdata_data_miss[0] <= 0;
    //rdata_data_miss[1] <= 0;
    end
    else if (LOOKUP_WBACK || LOOKUP_REFILL) begin
      op_miss <= op_req;
      wdata_miss <= wdata_req;
      wstrb_miss <= wstrb_req;
      tag_miss <= tag_req;
      index_miss <= index_req;
      word_offset_miss <= word_offset_req;
      replace_way_miss <= replace_way;
    //rdata_tag_miss <= rdata_tag;
    //rdata_v_miss <= rdata_v;
    //rdata_d_miss <= rdata_dirty;
    //rdata_data_miss <= rdata_data;
    end
  end

/* ============================TAG SRAM============================ */
  // IDLE->LOOKUP时读取
  // REFILL->IDLE时写入
  // 共例化2块
  localparam TagVSRAM_DATA_WIDTH = 22;
  localparam TagVSRAM_NUM_WORDS = 128;

  wire  [1:0] req_tagv;
  wire  [1:0] we_tagv;
  wire  [6:0] addr_tagv [0:1];
  wire [21:0] wdata_tagv [0:1];
  wire [21:0] be_tagv [0:1];

  assign req_tagv[0] = {IDLE_LOOKUP} & 1
                     | {REFILL_IDLE & (~uncached_req)} & (replace_way_miss == 0)
                     | {RVALID_INVAL} & 1
                     | {INVAL_CLEAR} & ~inval_count[0];
  assign req_tagv[1] = {IDLE_LOOKUP} & 1
                     | {REFILL_IDLE & (~uncached_req)} & (replace_way_miss == 1)
                     | {RVALID_INVAL} & 1
                     | {INVAL_CLEAR} & inval_count[0];
  
  assign we_tagv[0] = {REFILL_IDLE} & (replace_way_miss == 0)
                    | {INVAL_CLEAR} & ~inval_count[0];
  assign we_tagv[1] = {REFILL_IDLE} & (replace_way_miss == 1)
                    | {INVAL_CLEAR} & inval_count[0];

  assign addr_tagv[0] = {7{IDLE_LOOKUP}} & index
                      | {7{REFILL_IDLE}} & index_miss
                      | {7{RVALID_INVAL}} & inval_count[7:1]
                      | {7{INVAL_CLEAR}} & inval_count[7:1];
  assign addr_tagv[1] = {7{IDLE_LOOKUP}} & index
                      | {7{REFILL_IDLE}} & index_miss
                      | {7{RVALID_INVAL}} & inval_count[7:1]
                      | {7{INVAL_CLEAR}} & inval_count[7:1];

  assign wdata_tagv[0] = {22{REFILL_IDLE}} & {1'b1, tag_miss}
                       | {22{INVAL_CLEAR}} & 0;
  assign wdata_tagv[1] = {22{REFILL_IDLE}} & {1'b1, tag_miss}
                       | {22{INVAL_CLEAR}} & 0;

  assign be_tagv[0] = {22{1'b1}};
  assign be_tagv[1] = {22{1'b1}};

  generate
    for (i = 0; i < 2; i = i + 1) begin : TagVSRAM
      ysyx_040163_sram #(
        .DATA_WIDTH (TagVSRAM_DATA_WIDTH),
        .NUM_WORDS  (TagVSRAM_NUM_WORDS)
      ) TagVSRAM(
        .clk   (clk),
        .rst   (rst),
        .req   (req_tagv[i]),
        .we    (we_tagv[i]),
        .addr  (addr_tagv[i]),
        .wdata (wdata_tagv[i]),
        .be    (be_tagv[i]),
        .rdata ({rdata_v[i], rdata_tag[i]})
      );
    end 
  endgenerate

/* =============================D SRAM============================= */
  // IDLE->LOOKUP时读取
  // LOOKUP->WRITE时写入1
  // REFILL->IDLE时写入(op_miss ? 1 : 0)
  // 共例化2块
  localparam DSRAM_DATA_WIDTH = 1;
  localparam DSRAM_NUM_WORDS = 128;

  //assign dirty = rdata_dirty[word_offset_req];
  assign dirty = rdata_dirty[replace_way];

  wire [1:0] req_dirty;
  wire [1:0] we_dirty;
  wire [6:0] addr_dirty [0:1];
  wire [1:0] wdata_dirty;
  wire [1:0] be_dirty;

  assign req_dirty[0] = {IDLE_LOOKUP} & 1
                      | {LOOKUP_WRITE} & way_hit[0]
                      | {REFILL_IDLE & (~uncached_req)} & (replace_way_miss == 0)
                      | {RVALID_INVAL} & 1;
  assign req_dirty[1] = {IDLE_LOOKUP} & 1
                      | {LOOKUP_WRITE} & way_hit[1]
                      | {REFILL_IDLE & (~uncached_req)} & (replace_way_miss == 1)
                      | {RVALID_INVAL} & 1;

  assign we_dirty[0] = {LOOKUP_WRITE} & way_hit[0]
                     | {REFILL_IDLE} & (replace_way_miss == 0);
  assign we_dirty[1] = {LOOKUP_WRITE} & way_hit[1]
                     | {REFILL_IDLE} & (replace_way_miss == 1);

  assign addr_dirty[0] = {7{IDLE_LOOKUP}} & index
                       | {7{LOOKUP_WRITE}} & index_req
                       | {7{REFILL_IDLE}} & index_miss
                       | {7{RVALID_INVAL}} & inval_count[7:1];
  assign addr_dirty[1] = {7{IDLE_LOOKUP}} & index
                       | {7{LOOKUP_WRITE}} & index_req
                       | {7{REFILL_IDLE}} & index_miss
                       | {7{RVALID_INVAL}} & inval_count[7:1];

  assign wdata_dirty[0] = {LOOKUP_WRITE} & 1
                        | {REFILL_IDLE} & (op_miss == 1);
  assign wdata_dirty[1] = {LOOKUP_WRITE} & 1
                        | {REFILL_IDLE} & (op_miss == 1);

  assign be_dirty[0] = 1;
  assign be_dirty[1] = 1;

  generate
    for (i = 0; i < 2; i = i + 1) begin : DSRAM
      ysyx_040163_sram #(
        .DATA_WIDTH (DSRAM_DATA_WIDTH),
        .NUM_WORDS  (DSRAM_NUM_WORDS)
      ) DSRAM(
        .clk   (clk),
        .rst   (rst),
        .req   (req_dirty[i]),
        .we    (we_dirty[i]),
        .addr  (addr_dirty[i]),
        .wdata (wdata_dirty[i]),
        .be    (be_dirty[i]),
        .rdata (rdata_dirty[i])
      );
    end
  endgenerate

/* ===========================DATA SRAM============================ */
  // IDLE->LOOKUP时读取
  // REFILL->IDLE时写入
  // LOOKUP->WRITE时写入
  // 共例化2块

  wire [1:0] req_data;
  wire [1:0] we_data;
  wire [6:0] addr_data [0:1];
  wire [127:0] wdata_data [0:1];
  wire [127:0] be_data [0:1];

  assign req_data[0] = {1{IDLE_LOOKUP}} & 1
                     | {1{REFILL_IDLE & (~uncached_req)}} & (replace_way_miss == 0)
                     | {1{LOOKUP_WRITE}} & (way_hit[0])
                     | {RVALID_INVAL} & 1;
  assign req_data[1] = {1{IDLE_LOOKUP}} & 1
                     | {1{REFILL_IDLE & (~uncached_req)}} & (replace_way_miss == 1)
                     | {1{LOOKUP_WRITE}} & (way_hit[1])
                     | {RVALID_INVAL} & 1;
  
  assign we_data[0] = {1{LOOKUP_WRITE}} & way_hit[0]
                    | {1{REFILL_IDLE}} & (replace_way_miss == 0);
  assign we_data[1] = {1{LOOKUP_WRITE}} & way_hit[1]
                    | {1{REFILL_IDLE}} & (replace_way_miss == 1);
  
  assign addr_data[0] = {7{IDLE_LOOKUP}} & index
                      | {7{LOOKUP_WRITE}} & index_req
                      | {7{REFILL_IDLE}} & index_miss
                      | {7{RVALID_INVAL}} & inval_count[7:1];
  assign addr_data[1] = {7{IDLE_LOOKUP}} & index
                      | {7{LOOKUP_WRITE}} & index_req
                      | {7{REFILL_IDLE}} & index_miss
                      | {7{RVALID_INVAL}} & inval_count[7:1];
  
  assign wdata_data[0] = {128{LOOKUP_WRITE}} & (word_offset_req ? {wdata_req, 64'b0} : {64'b0, wdata_req})
                       | {128{REFILL_IDLE}} & refill_data;
  assign wdata_data[1] = {128{LOOKUP_WRITE}} & (word_offset_req ? {wdata_req, 64'b0} : {64'b0, wdata_req})
                       | {128{REFILL_IDLE}} & refill_data;

  assign be_data[0] = {128{LOOKUP_WRITE}} & data_wstrb_write
                    | {128{REFILL_IDLE}} & {128{1'b1}};
  assign be_data[1] = {128{LOOKUP_WRITE}} & data_wstrb_write
                    | {128{REFILL_IDLE}} & {128{1'b1}};

  /* 字节掩码扩展到位掩码，注意生成高低位 */
  assign data_wstrb_miss = (op_miss == 1) ? {{8{wstrb_miss[7]}}, {8{wstrb_miss[6]}}, {8{wstrb_miss[5]}}, {8{wstrb_miss[4]}}, {8{wstrb_miss[3]}}, {8{wstrb_miss[2]}}, {8{wstrb_miss[1]}}, {8{wstrb_miss[0]}}}
                         : {64{1'b1}};
  assign data_wstrb_write = word_offset_req ? {{8{wstrb_req[7]}}, {8{wstrb_req[6]}}, {8{wstrb_req[5]}}, {8{wstrb_req[4]}}, {8{wstrb_req[3]}}, {8{wstrb_req[2]}}, {8{wstrb_req[1]}}, {8{wstrb_req[0]}}, 64'b0} : {64'b0, {8{wstrb_req[7]}}, {8{wstrb_req[6]}}, {8{wstrb_req[5]}}, {8{wstrb_req[4]}}, {8{wstrb_req[3]}}, {8{wstrb_req[2]}}, {8{wstrb_req[1]}}, {8{wstrb_req[0]}}};

  /* sram 4-5 */
  /*ysyx_040163_data_array_way DataSRAM_0(
    .clk  (clk),
    .Q    (rdata_data[0]), // 读数据
    .CEN  (~req_data[0]), // 使能信号，低电平有效
    .WEN  (~we_data[0]), // 写使能信号，低电平有效
    .BWEN (~be_data[0]), // 写掩码信号，粒度为1bit，低电平有效
    .A    (addr_data[0]), // 读写地址
    .D    (wdata_data[0])  // 写数据
  );*/

  reg select_0;
  always @(posedge clk) begin
    if (rst) begin
      select_0 <= 0;
    end
    else begin
      select_0 <= addr_data[0][6];
    end
  end
  assign rdata_data[0] = (~ select_0) ? io_sram4_rdata : io_sram5_rdata;

  assign io_sram4_addr = addr_data[0][5:0];
  assign io_sram4_cen = ((~req_data[0]) || addr_data[0][6]);
  assign io_sram4_wen = ~we_data[0];
  assign io_sram4_wmask = ~be_data[0];
  assign io_sram4_wdata = wdata_data[0];

  assign io_sram5_addr = addr_data[0][5:0];
  assign io_sram5_cen = ((~req_data[0]) || (~addr_data[0][6]));
  assign io_sram5_wen = ~we_data[0];
  assign io_sram5_wmask = ~be_data[0];
  assign io_sram5_wdata = wdata_data[0];


  /* sram 6-7 */
  /*ysyx_040163_data_array_way DataSRAM_1(
    .clk  (clk),
    .Q    (rdata_data[1]), // 读数据
    .CEN  (~req_data[1]), // 使能信号，低电平有效
    .WEN  (~we_data[1]), // 写使能信号，低电平有效
    .BWEN (~be_data[1]), // 写掩码信号，粒度为1bit，低电平有效
    .A    (addr_data[1]), // 读写地址
    .D    (wdata_data[1])  // 写数据
  );*/

  reg select_1;
  always @(posedge clk) begin
    if (rst) begin
      select_1 <= 0;
    end
    else begin
      select_1 <= addr_data[1][6];
    end
  end
  assign rdata_data[1] = (~ select_1) ? io_sram6_rdata : io_sram7_rdata;

  assign io_sram6_addr = addr_data[1][5:0];
  assign io_sram6_cen = ((~req_data[1]) || (addr_data[1][6]));
  assign io_sram6_wen = ~we_data[1];
  assign io_sram6_wmask = ~be_data[1];
  assign io_sram6_wdata = wdata_data[1];

  assign io_sram7_addr = addr_data[1][5:0];
  assign io_sram7_cen = ((~req_data[1]) || (~addr_data[1][6]));
  assign io_sram7_wen = ~we_data[1];
  assign io_sram7_wmask = ~be_data[1];
  assign io_sram7_wdata = wdata_data[1];

/* ===========================CACHE-AXI============================ */
  // Cache访存接口
	//output         rw_valid_o,  // 请求有效
	//input          rw_ready_i,  // 访存完成
  //output         rw_wen_o,    // 访存类型 0是读 1是写
  //input  [127:0] rw_r_data_i, // 读数据
  //output [127:0] rw_w_data_o, // 写数据
  //output  [31:0] rw_addr_o,   // 读/写地址
  //output  [15:0] rw_wstrb_o,  // 写字节掩码
  //output   [1:0] rw_burst_o   // 突发长度 00是1，01是2，目前只可能是这两个值

  //wire         rw_valid_o;  // 请求有效
	//wire         rw_ready_i;  // 访存完成
  //wire         rw_wen_o;    // 访存类型 0是读 1是写
  //wire [127:0] rw_r_data_i; // 读数据
  //wire [127:0] rw_w_data_o; // 写数据
  //wire  [31:0] rw_addr_o;   // 读/写地址
  //wire  [15:0] rw_wstrb_o;  // 写字节掩码
  //wire         rw_burst_o;  // 突发长度 00是1，01是2，目前只可能是这两个值

  assign rw_valid_o = rw_valid;
  assign rw_wen_o = rw_wen;
  assign rw_addr_o = rw_addr;
  assign rw_w_data_o = rw_w_data;
  assign rw_wstrb_o = uncached_req ? (device_req ? {12'b0, wstrb_req[3:0]} : (word_offset_req ? {wstrb_req, 8'b0} : {8'b0, wstrb_req})) : {16{1'b1}};
  assign rw_burst_o = {1'b0, ~device_req}; // 是device就0，不是device就1
  assign rw_size_o = device_req ? 3'd2 : 3'd3;

  assign refill_data = op_miss ? refill_data_store : refill_data_load;
  assign refill_data_store = word_offset_miss ? {rw_r_data_i[127:64] & (~data_wstrb_miss[63:0]) | (wdata_miss & data_wstrb_miss[63:0]), rw_r_data_i[63:0]} :
                                                {rw_r_data_i[127:64], rw_r_data_i[63:0] & (~data_wstrb_miss[63:0]) | (wdata_miss & data_wstrb_miss[63:0])};
  assign refill_data_load = rw_r_data_i;

/*
  dcache_test dcachetest0(
    .clk(clk),
    .rw_valid(rw_valid_o),
    .rw_ready(rw_ready_i),
    .rw_wen(rw_wen_o),
    .rw_r_data(rw_r_data_i),
    .rw_w_data(rw_w_data_o),
    .rw_addr(rw_addr_o),
    .rw_wstrb(rw_wstrb_o)
  );
*/

endmodule
module ysyx_040163_decode (
  input  wire [31:0] inst,
//input  wire [31:0] pc_id,
//input  wire [63:0] a0_data,

  output wire  [3:0] ram_store,
  output wire  [3:0] ram_load,

  output reg   [4:0] alu_opcode,
  output reg   [1:0] alu_out_type,

  output wire        reg_wen,
  output wire  [4:0] reg_waddr,

  output reg   [1:0] reg_ren,
  output wire  [4:0] reg_raddr_1,
  output wire  [4:0] reg_raddr_2,

  output wire        imm_shamt,
  output wire        rs1_word,
  output wire        rs2_word,
  output wire        rs_signed,
  output wire  [1:0] rs2_shamt,

  output wire [63:0] imm,

  output wire  [3:0] jmp_type,
  output wire [63:0] jmp_offset,

  output reg         csr_wen,
  output reg   [3:0] csr_inst_type,

  output reg dcache_invalidate
);

  parameter R_type = 3'b001;
  parameter I_type = 3'b010;
  parameter S_type = 3'b011;
  parameter B_type = 3'b100;
  parameter U_type = 3'b101;
  parameter J_type = 3'b110;

  parameter INST_CSRRW  = 4'b0001;
  parameter INST_CSRRS  = 4'b0010;
  parameter INST_CSRRC  = 4'b0011;
  parameter INST_CSRRWI = 4'b0100;
  parameter INST_CSRRSI = 4'b0101;
  parameter INST_CSRRCI = 4'b0110;
  parameter INST_ECALL  = 4'b0111;
  parameter INST_MRET   = 4'b1000;

  wire [4:0] rd, rs1, rs2;
  wire [6:0] opcode;
  reg  [2:0] inst_type;
  wire inst_jalr;

  // R-type
  wire [4:0] rd_R, rs1_R, rs2_R;
  assign rd_R  = rd;
  assign rs1_R = rs1;
  assign rs2_R = rs2;

  // I-type
  wire [4:0] rd_I, rs1_I;
  wire [63:0] imm_I;
  assign rd_I  = rd;
  assign rs1_I = rs1;
  assign imm_I = {{52{inst[31]}}, inst[31:20]};

  // S-type
  wire [4:0] rs1_S, rs2_S;
  wire [63:0] imm_S;
  assign rs1_S = rs1;
  assign rs2_S = rs2;
  assign imm_S = {{52{inst[31]}}, inst[31:25], inst[11:7]};

  // B-type
  wire [4:0] rs1_B, rs2_B;
  wire [63:0] imm_B;
  assign rs1_B = rs1;
  assign rs2_B = rs2;
  assign imm_B = {{51{inst[31]}}, inst[31], inst[7], inst[30:25], inst[11:8], 1'b0};

  // U-type
  wire [4:0] rd_U;
  wire [63:0] imm_U;
  assign rd_U  = rd;
  assign imm_U = {{32{inst[31]}}, inst[31:12], 12'b0};

  // J-type
  wire [4:0] rd_J;
  wire [63:0] imm_J;
  assign rd_J  = rd;
  assign imm_J = {{43{inst[31]}}, inst[31], inst[19:12], inst[20], inst[30:21], 1'b0};

  /* rs2作为shamt的时候有5位有6位，imm作为shamt也有5位和6位的区别
   * 对于rs2_shamt没问题
   * 对于imm_shamt，带w的，其shamt[5]=0才有效，不带w的，无所谓
   * 因此这里的判断，对于带w的是高7位，而不带w的是高6位
   */

  assign rs2_shamt[1] = ((inst[31:25] == 7'b0100000) && (inst[14:12] == 3'b101) && (inst[6:0] == 7'b0111011)) || // sraw
                        ((inst[31:25] == 7'b0000000) && (inst[14:12] == 3'b101) && (inst[6:0] == 7'b0111011)) || // srlw
                        ((inst[31:25] == 7'b0000000) && (inst[14:12] == 3'b001) && (inst[6:0] == 7'b0111011)); // sllw
  assign rs2_shamt[0] = ((inst[31:25] == 7'b0000000) && (inst[14:12] == 3'b001) && (inst[6:0] == 7'b0110011)) || // sll
                        ((inst[31:25] == 7'b0000000) && (inst[14:12] == 3'b101) && (inst[6:0] == 7'b0110011)) || // srl
                        ((inst[31:25] == 7'b0100000) && (inst[14:12] == 3'b101) && (inst[6:0] == 7'b0110011)); // sra

  assign imm_shamt = ((inst[31:26] == 6'b000000) && (inst[14:12] == 3'b001) && (inst[6:0] == 7'b0010011)) || // slli
                     ((inst[31:26] == 6'b000000) && (inst[14:12] == 3'b101) && (inst[6:0] == 7'b0010011)) || // srli
                     ((inst[31:26] == 6'b010000) && (inst[14:12] == 3'b101) && (inst[6:0] == 7'b0010011)) || // srai
                     ((inst[31:25] == 7'b0000000) && (inst[14:12] == 3'b001) && (inst[6:0] == 7'b0011011)) || // slliw
                     ((inst[31:25] == 7'b0000000) && (inst[14:12] == 3'b101) && (inst[6:0] == 7'b0011011)) || // srliw
                     ((inst[31:25] == 7'b0100000) && (inst[14:12] == 3'b101) && (inst[6:0] == 7'b0011011)); // sraiw
  
  // 寄存器需要截断32位计算的
  assign rs1_word = ((inst[31:25] == 7'b0000001) && (inst[14:12] == 3'b101) && (inst[6:0] == 7'b0111011)) || // divuw 1
                    ((inst[31:25] == 7'b0000001) && (inst[14:12] == 3'b100) && (inst[6:0] == 7'b0111011)) || // divw 1
                    ((inst[31:25] == 7'b0000001) && (inst[14:12] == 3'b111) && (inst[6:0] == 7'b0111011)) || // remuw 1
                    ((inst[31:25] == 7'b0000001) && (inst[14:12] == 3'b110) && (inst[6:0] == 7'b0111011)) || // remw 1
                    ((inst[31:25] == 7'b0000000) && (inst[14:12] == 3'b101) && (inst[6:0] == 7'b0011011)) || // srliw
                    ((inst[31:25] == 7'b0100000) && (inst[14:12] == 3'b101) && (inst[6:0] == 7'b0011011)) || // sraiw
                    ((inst[31:25] == 7'b0100000) && (inst[14:12] == 3'b101) && (inst[6:0] == 7'b0111011)) || // sraw
                    ((inst[31:25] == 7'b0000000) && (inst[14:12] == 3'b101) && (inst[6:0] == 7'b0111011)); // srlw
  
  assign rs2_word = ((inst[31:25] == 7'b0000001) && (inst[14:12] == 3'b101) && (inst[6:0] == 7'b0111011)) || // divuw
                    ((inst[31:25] == 7'b0000001) && (inst[14:12] == 3'b100) && (inst[6:0] == 7'b0111011)) || // divw
                    ((inst[31:25] == 7'b0000001) && (inst[14:12] == 3'b111) && (inst[6:0] == 7'b0111011)) || // remuw
                    ((inst[31:25] == 7'b0000001) && (inst[14:12] == 3'b110) && (inst[6:0] == 7'b0111011)); // remw
  
  // 寄存器需要截断且做算术位移的（赋能这个就必须得在截断中选一个赋能）
  assign rs_signed = ((inst[31:25] == 7'b0100000) && (inst[14:12] == 3'b101) && (inst[6:0] == 7'b0111011)) || // sraw
                     ((inst[31:25] == 7'b0100000) && (inst[14:12] == 3'b101) && (inst[6:0] == 7'b0011011)); // sraiw

  assign opcode = inst[6:0];
  assign rd     = inst[11:7];
  assign rs1    = inst[19:15];
  assign rs2    = inst[24:20];

  // csr指令相关的
  // csrrw 读csr，将x[rs1]的值写入csr，原本csr值写回x[rd]
  // csrrs 读csr和x[rs1]按位或结果再写回csr，原本csr值写回x[rd]
  // csrrc 读csr和x[rs1]按位与结果再写回csr，原本csr值写回x[rd]
  // csrrwi 同csrrw，只不过写回x[rd]的是uimm
  // csrrsi 同csrrs，只不过x[rs1]变成uimm
  // csrrci 同csrrc，只不过x[rs1]变成uimm
  // 总共需要一个csr地址，rd rs1 uimm
  // 还涉及到csr与gpr/uimm的计算类型
  // rf的写使能，写地址，读地址这些都有现成的通路用于支撑
  // 仅仅还需要csr写使能，csr地址，指令类型，其中csr地址也可以复用I型指令的imm_I
  // 进一步细分，rd rs1都有现成的，csr_addr可以通过提取imm得到，uimm就是rs1那几位
  
  assign inst_jalr = inst[6] & inst[5] & (~inst[4]) & (~inst[3]) & inst[2] & inst[1] & inst[0];
  // 这里对jalr的操作 将pc（在顶层中进行切换）和4（在这里的imm切换）送入alu计算
  // pc=(x[rs1]+sext(offset))&~1 的操作完全放入fetch中，rs1（在这里未动）imm（在这里调整为jmp_offset = imm）

  // reg_wen与reg_waddr与reg_raddr_1与reg_raddr_2与imm
  ysyx_040163_mux #(6, 3, 1) mux61_reg_wen(reg_wen, inst_type, 1'b0, {
    R_type, 1'b1,  // R_type
    I_type, 1'b1,  // I_type
    S_type, 1'b0,  // S_type
    B_type, 1'b0,  // B_type
    U_type, 1'b1,  // U_type
    J_type, 1'b1   // J_type
  }); // reg_wen
  ysyx_040163_mux #(6, 3, 5) mux61_reg_waddr(reg_waddr, inst_type, 5'b0, {
    R_type, rd_R,  // R_type
    I_type, rd_I,  // I_type
    S_type, 5'b0, // S_type
    B_type, 5'b0, // B_type
    U_type, rd_U,  // U_type
    J_type, rd_J   // J_type
  }); // reg_waddr
  ysyx_040163_mux #(6, 3, 5) mux61_reg_raddr_1(reg_raddr_1, inst_type, 5'b0, {
    R_type, rs1_R, // R_type
    I_type, rs1_I, // I_type
    S_type, rs1_S, // S_type
    B_type, rs1_B, // B_type
    U_type, 5'b0, // U_type
    J_type, 5'b0  // J_type
  }); // reg_raddr_1
  ysyx_040163_mux #(6, 3, 5) mux61_reg_raddr_2(reg_raddr_2, inst_type, 5'b0, {
    R_type, rs2_R, // R_type
    I_type, 5'b0, // I_type
    S_type, rs2_S, // S_type
    B_type, rs2_B, // B_type
    U_type, 5'b0, // U_type
    J_type, 5'b0  // J_type
  }); // reg_raddr_2
  ysyx_040163_mux #(6, 3, 64) mux61_imm(imm, inst_type, 64'b0, {
    R_type, 64'b0, // R_type
    I_type, (inst_jalr ? 64'd4: imm_I), // I_type 为jalr做特殊处理
    S_type, imm_S, // S_type
    B_type, 64'b0, // B_type
    U_type, imm_U, // U_type
    J_type, 64'd4  // J_type
  }); // imm


  // ram_store与ram_load
  // [3]使能位 [2]是0扩展还是符号扩展 [1:0]表示进行操作的尺度
  ysyx_040163_mux #(4, 10, 4) mux41_ram_store(ram_store, {inst[14:12], opcode}, 4'b0, {
    10'b000_0100011, 4'b1000, // sb
    10'b001_0100011, 4'b1001, // sh
    10'b010_0100011, 4'b1010, // sw
    10'b011_0100011, 4'b1011  // sd
  }); // ram_store
  ysyx_040163_mux #(7, 10, 4) mux71_ram_load(ram_load, {inst[14:12], opcode}, 4'b0, {
    10'b000_0000011, 4'b1000, // lb
    10'b001_0000011, 4'b1001, // lh
    10'b010_0000011, 4'b1010, // lw
    10'b011_0000011, 4'b1011, // ld
    10'b100_0000011, 4'b1100, // lbu
    10'b101_0000011, 4'b1101, // lhu
    10'b110_0000011, 4'b1110  // lwu
  }); // ram_load


  // jmp_type和pc_jmp
  // 针对jal进行特殊处理，因为jal的14:12属于imm，而不是funct3；且注意jal的行为，在imm和pc_jmp重新做了调整
  ysyx_040163_mux #(8, 10, 4) mux81(jmp_type, (opcode == 7'b1101111 ? {3'b000, opcode} : {inst[14:12], opcode}), 4'b0, {
    10'b000_1101111, 4'b0001, // jal
    10'b000_1100111, 4'b0010, // jalr
    10'b000_1100011, 4'b0011, // beq
    10'b001_1100011, 4'b0100, // bne
    10'b100_1100011, 4'b0101, // blt
    10'b101_1100011, 4'b0110, // bge
    10'b110_1100011, 4'b0111, // bltu
    10'b111_1100011, 4'b1000  // bgeu
  }); // jmp_type
  ysyx_040163_mux #(6, 3, 64) mux61_pc_jmp(jmp_offset, inst_type, 64'b0, {
    R_type, 64'b0, // R_type
    I_type, (inst_jalr ? imm_I: 64'b0), // I_type 为jalr做特殊处理
    S_type, 64'b0, // S_type
    B_type, imm_B, // B_type
    U_type, 64'b0, // U_type
    J_type, imm_J  // J_type
  }); // jmp_offset

  always @(inst) begin
    //$display("pc_id: %h, inst_id: %h", pc_id, inst);
    csr_wen = 0;
    csr_inst_type = 0;
    dcache_invalidate = 0;
    casez (inst)
      // =================================================================
      // Trap-Return

      // sret
      //
      // 32'b0001000_00010_00000_000_00000_11100_11: begin
      // end

      // mret
      // ExceptionReturn(Machine)
      32'b0011000_00010_00000_000_00000_11100_11: begin
        // $display("Valid.");
        inst_type    = R_type;
        alu_opcode   = 5'b00000;
        alu_out_type = 2'b10;
        reg_ren      = 2'b11;
        csr_inst_type = INST_MRET;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // =================================================================
      // Zifence

      // fence.i
      // Fence(Store, Fetch)
      32'b0000000_00000_00000_001_00000_00011_11: begin
        // $display("Valid.");
        inst_type    = I_type;
        alu_opcode   = 5'b00000;
        alu_out_type = 2'b10;
        reg_ren      = 2'b00;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
        dcache_invalidate = 1;
      end

      // =================================================================
      // RV32/RV64 Zicsr

      // csrrw
      // t = CSRs[csr]; CSRs[csr] = x[rs1]; x[rd] = t
      32'b???????_?????_?????_001_?????_11100_11: begin
        // $display("Valid.");
        inst_type    = I_type;
        alu_opcode   = 5'b00000;
        alu_out_type = 2'b10;
        reg_ren      = 2'b00;
        csr_wen = 1;
        csr_inst_type = INST_CSRRW;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // csrrs
      // t = CSRs[csr]; CSRs[csr] = t | x[rs1]; x[rd] = t
      32'b??????_?????_?????_010_?????_11100_11: begin
        inst_type    = I_type;
        alu_opcode   = 5'b00000;
        alu_out_type = 2'b10;
        reg_ren      = 2'b00;
        csr_wen = 1;
        csr_inst_type = INST_CSRRS;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // csrrc
      // t = CSRs[csr]; CSRs[csr] = t &~x[rs1]; x[rd] = t
      32'b??????_?????_?????_011_?????_11100_11: begin
        inst_type    = I_type;
        alu_opcode   = 5'b00000;
        alu_out_type = 2'b10;
        reg_ren      = 2'b00;
        csr_wen = 1;
        csr_inst_type = INST_CSRRC;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // csrrwi
      // x[rd] = CSRs[csr]; CSRs[csr] = zimm
      32'b??????_?????_?????_101_?????_11100_11: begin
        inst_type    = I_type;
        alu_opcode   = 5'b00000;
        alu_out_type = 2'b10;
        reg_ren      = 2'b00;
        csr_wen = 1;
        csr_inst_type = INST_CSRRWI;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // csrrsi
      // t = CSRs[csr]; CSRs[csr] = t | zimm; x[rd] = t
      32'b??????_?????_?????_110_?????_11100_11: begin
        inst_type    = I_type;
        alu_opcode   = 5'b00000;
        alu_out_type = 2'b10;
        reg_ren      = 2'b00;
        csr_wen = 1;
        csr_inst_type = INST_CSRRSI;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // csrrci
      // t = CSRs[csr]; CSRs[csr] = t &~zimm; x[rd] = t
      32'b??????_?????_?????_111_?????_11100_11: begin
        inst_type    = I_type;
        alu_opcode   = 5'b00000;
        alu_out_type = 2'b10;
        reg_ren      = 2'b00;
        csr_wen = 1;
        csr_inst_type = INST_CSRRCI;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // =================================================================
      // RV32I RV64I

      // lui
      // x[rd] = sext(immediate[31:12] << 12)
      32'b???????_?????_?????_???_?????_01101_11: begin
        // $display("Valid.");
        inst_type    = U_type;
        alu_opcode   = 5'b00000;
        alu_out_type = 2'b10;
        reg_ren      = 2'b01;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // auipc
      // x[rd] = pc + sext(immediate[31:12] << 12)
      32'b???????_?????_?????_???_?????_00101_11: begin
        // $display("Valid.");
        inst_type    = U_type;
        alu_opcode   = 5'b00000;
        alu_out_type = 2'b10;
        reg_ren      = 2'b00;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // jal
      // x[rd] = pc+4; pc += sext(offset)
      32'b???????_?????_?????_???_?????_11011_11: begin
        // $display("Valid.");
        inst_type    = J_type;
        alu_opcode   = 5'b00000;
        alu_out_type = 2'b10;
        reg_ren      = 2'b00;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // jalr
      // t = pc+4; pc=(x[rs1]+sext(offset))&~1; x[rd]=t
      32'b???????_?????_?????_000_?????_11001_11: begin
        // $display("Valid.");
        inst_type    = I_type;
        alu_opcode   = 5'b00000;
        alu_out_type = 2'b10;
        reg_ren      = 2'b00;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // beq
      // if (rs1 == rs2) pc += sext(offset)
      32'b???????_?????_?????_000_?????_11000_11: begin
        // $display("Valid.");
        inst_type    = B_type;
        alu_opcode   = 5'b00000;
        alu_out_type = 2'b10;
        reg_ren      = 2'b00;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // bne
      // if (rs1 ≠ rs2) pc += sext(offset)
      32'b???????_?????_?????_001_?????_11000_11: begin
        // $display("Valid.");
        inst_type    = B_type;
        alu_opcode   = 5'b00000;
        alu_out_type = 2'b10;
        reg_ren      = 2'b00;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // blt
      // if (rs1 <s rs2) pc += sext(offset)
      32'b???????_?????_?????_100_?????_11000_11: begin
        // $display("Valid.");
        inst_type    = B_type;
        alu_opcode   = 5'b00000;
        alu_out_type = 2'b10;
        reg_ren      = 2'b00;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // bge
      // if (rs1 ≥s rs2) pc += sext(offset)
      32'b???????_?????_?????_101_?????_11000_11: begin
        // $display("Valid.");
        inst_type    = B_type;
        alu_opcode   = 5'b00000;
        alu_out_type = 2'b10;
        reg_ren      = 2'b00;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // bltu
      // if (rs1 <u rs2) pc += sext(offset)
      32'b???????_?????_?????_110_?????_11000_11: begin
        // $display("Valid.");
        inst_type    = B_type;
        alu_opcode   = 5'b00000;
        alu_out_type = 2'b10;
        reg_ren      = 2'b00;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // bgeu
      // if (rs1 ≥u rs2) pc += sext(offset)
      32'b???????_?????_?????_111_?????_11000_11: begin
        // $display("Valid.");
        inst_type    = B_type;
        alu_opcode   = 5'b00000;
        alu_out_type = 2'b10;
        reg_ren      = 2'b00;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // lb
      // x[rd] = sext(M[x[rs1] + sext(offset)][7:0])
      // 提取1字节到指定寄存器中
      32'b???????_?????_?????_000_?????_00000_11: begin
        // $display("Valid.");
        inst_type    = I_type;
        alu_opcode   = 5'b00000;
        alu_out_type = 2'b10;
        reg_ren      = 2'b01;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // lh
      // x[rd] = sext(M[x[rs1] + sext(offset)][15:0])
      // 提取2字节到指定寄存器中
      32'b???????_?????_?????_001_?????_00000_11: begin
        // $display("Valid.");
        inst_type    = I_type;
        alu_opcode   = 5'b00000;
        alu_out_type = 2'b10;
        reg_ren      = 2'b01;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // lw
      // x[rd] = sext(M[x[rs1] + sext(offset)][31:0])
      // 提取4字节到指定寄存器中
      32'b???????_?????_?????_010_?????_00000_11: begin
        // $display("Valid.");
        inst_type    = I_type;
        alu_opcode   = 5'b00000;
        alu_out_type = 2'b10;
        reg_ren      = 2'b01;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // lbu
      // x[rd] = M[x[rs1] + sext(offset)][7:0]
      32'b???????_?????_?????_100_?????_00000_11: begin
        // $display("Valid.");
        inst_type    = I_type;
        alu_opcode   = 5'b00000;
        alu_out_type = 2'b10;
        reg_ren      = 2'b01;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // lhu
      // x[rd] = M[x[rs1] + sext(offset)][15:0]
      32'b???????_?????_?????_101_?????_00000_11: begin
        // $display("Valid.");
        inst_type    = I_type;
        alu_opcode   = 5'b00000;
        alu_out_type = 2'b10;
        reg_ren      = 2'b01;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // sb
      // M[x[rs1] + sext(offset) = x[rs2][7: 0]
      32'b???????_?????_?????_000_?????_01000_11: begin
        // $display("Valid.");
        inst_type    = S_type;
        alu_opcode   = 5'b00000;
        alu_out_type = 2'b10;
        reg_ren      = 2'b01;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // sh
      // M[x[rs1] + sext(offset)] = x[rs2][15: 0]
      32'b???????_?????_?????_001_?????_01000_11: begin
        // $display("Valid.");
        inst_type    = S_type;
        alu_opcode   = 5'b00000;
        alu_out_type = 2'b10;
        reg_ren      = 2'b01;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // sw
      // M[x[rs1] + sext(offset)] = x[rs2][31: 0]
      32'b???????_?????_?????_010_?????_01000_11: begin
        // $display("Valid.");
        inst_type    = S_type;
        alu_opcode   = 5'b00000;
        alu_out_type = 2'b10;
        reg_ren      = 2'b01;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // addi
      // x[rd] = x[rs1] + sext(immediate)
      32'b???????_?????_?????_000_?????_00100_11: begin
        // $display("Valid.");
        inst_type    = I_type;
        alu_opcode   = 5'b00000;
        alu_out_type = 2'b10;
        reg_ren      = 2'b01;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // slti
      //

      // sltiu
      // x[rd] = (x[rs1] <𝑢 sext(immediate))
      //
      32'b???????_?????_?????_011_?????_00100_11: begin
        // $display("Valid.");
        inst_type    = I_type;
        alu_opcode   = 5'b00111;
        alu_out_type = 2'b10;
        reg_ren      = 2'b01;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // xori
      // x[rd] = x[rs1] ^ sext(immediate)
      32'b???????_?????_?????_100_?????_00100_11: begin
        // $display("Valid.");
        inst_type    = I_type;
        alu_opcode   = 5'b00101;
        alu_out_type = 2'b10;
        reg_ren      = 2'b01;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // ori
      // x[rd] = x[rs1] | sext(immediate)
      32'b???????_?????_?????_110_?????_00100_11: begin
        // $display("Valid.");
        inst_type    = I_type;
        alu_opcode   = 5'b00100;
        alu_out_type = 2'b10;
        reg_ren      = 2'b01;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // andi
      // x[rd] = x[rs1] & sext(immediate)
      32'b???????_?????_?????_111_?????_00100_11: begin
        // $display("Valid.");
        inst_type    = I_type;
        alu_opcode   = 5'b00011;
        alu_out_type = 2'b10;
        reg_ren      = 2'b01;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // slli
      // x[rd] = x[rs1] ≪ shamt
      32'b000000?_?????_?????_001_?????_00100_11: begin
        // $display("Valid.");
        inst_type    = I_type;
        alu_opcode   = 5'b01010;
        alu_out_type = 2'b10;
        reg_ren      = 2'b01;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // srli
      // x[rd] = (x[rs1] ≫𝑢 shamt)
      32'b000000?_?????_?????_101_?????_00100_11: begin
        // $display("Valid.");
        inst_type    = I_type;
        alu_opcode   = 5'b01011;
        alu_out_type = 2'b10;
        reg_ren      = 2'b01;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // srai
      // x[rd] = (x[rs1] ≫𝑠 shamt)
      32'b010000?_?????_?????_101_?????_00100_11: begin
        // $display("Valid.");
        inst_type    = I_type;
        alu_opcode   = 5'b01001;
        alu_out_type = 2'b10;
        reg_ren      = 2'b01;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // add
      // x[rd] = x[rs1] + x[rs2]
      32'b0000000_?????_?????_000_?????_01100_11: begin
        // $display("Valid.");
        inst_type    = R_type;
        alu_opcode   = 5'b00000;
        alu_out_type = 2'b10;
        reg_ren      = 2'b11;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // sub
      // x[rd] = x[rs1] − x[rs2]
      //
      32'b0100000_?????_?????_000_?????_01100_11: begin
        // $display("Valid.");
        inst_type    = R_type;
        alu_opcode   = 5'b00001;
        alu_out_type = 2'b10;
        reg_ren      = 2'b11;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // sll
      // x[rd] = x[rs1] ≪ x[rs2]
      32'b0000000_?????_?????_001_?????_01100_11: begin
        // $display("Valid.");
        inst_type    = R_type;
        alu_opcode   = 5'b01010;
        alu_out_type = 2'b10;
        reg_ren      = 2'b11;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // slt
      // x[rd] = (x[rs1] <𝑠 x[rs2])
      32'b0000000_?????_?????_010_?????_01100_11: begin
        // $display("Valid.");
        inst_type    = R_type;
        alu_opcode   = 5'b00110;
        alu_out_type = 2'b10;
        reg_ren      = 2'b11;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // sltu
      // x[rd] = (x[rs1] <𝑢 x[rs2])
      32'b0000000_?????_?????_011_?????_01100_11: begin
        // $display("Valid.");
        inst_type    = R_type;
        alu_opcode   = 5'b00111;
        alu_out_type = 2'b10;
        reg_ren      = 2'b11;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // xor
      // x[rd] = x[rs1] ^ x[rs2]
      32'b0000000_?????_?????_100_?????_01100_11: begin
        // $display("Valid.");
        inst_type    = R_type;
        alu_opcode   = 5'b00101;
        alu_out_type = 2'b10;
        reg_ren      = 2'b11;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // srl
      // x[rd] = (x[rs1] ≫𝑢 x[rs2])
      32'b0000000_?????_?????_101_?????_01100_11: begin
        // $display("Valid.");
        inst_type    = R_type;
        alu_opcode   = 5'b01011;
        alu_out_type = 2'b10;
        reg_ren      = 2'b11;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // sra
      // x[rd] = (x[rs1] ≫𝑠 x[rs2])
      32'b0100000_?????_?????_101_?????_01100_11: begin
        // $display("Valid.");
        inst_type    = R_type;
        alu_opcode   = 5'b01001;
        alu_out_type = 2'b10;
        reg_ren      = 2'b11;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // or
      // x[rd] = x[rs1] | 𝑥[𝑟𝑠2]
      32'b0000000_?????_?????_110_?????_01100_11: begin
        // $display("Valid.");
        inst_type    = R_type;
        alu_opcode   = 5'b00100;
        alu_out_type = 2'b10;
        reg_ren      = 2'b11;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // and
      // x[rd] = x[rs1] & x[rs2]
      32'b0000000_?????_?????_111_?????_01100_11: begin
        // $display("Valid.");
        inst_type    = R_type;
        alu_opcode   = 5'b00011;
        alu_out_type = 2'b10;
        reg_ren      = 2'b11;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // fence
      // Fence(pred, succ)

      // ecall
      // RaiseException(EnvironmentCall)
      32'b0000000_00000_00000_000_00000_11100_11: begin
        // $display("Valid.");
        inst_type    = I_type;
        alu_opcode   = 5'b00000;
        alu_out_type = 2'b10;
        reg_ren      = 2'b11;
        csr_inst_type = INST_ECALL;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // ebreak
      /*
      32'b0000000_00001_00000_000_00000_11100_11: begin
        $display("ENCOUNT EBREAK");
        if(a0_data != 1) begin
          $display("\n\33[1;32mHIT GOOD TRAP.");
          $display("\33[0m\n");
          $finish;
        end
        else begin
          $display("\n\33[1;31mHIT BAD TRAP.");
          $display("\33[0m\n");
          $error;
        end
      end
      */

      // lwu
      // x[rd] = M[x[rs1] + sext(offset)][31:0]
      32'b???????_?????_?????_110_?????_00000_11: begin
        // $display("Valid.");
        inst_type    = I_type;
        alu_opcode   = 5'b00000;
        alu_out_type = 2'b10;
        reg_ren      = 2'b01;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // ld
      // x[rd] = M[x[rs1] + sext(offset)][63:0]
      // 读8字节到寄存器中
      32'b???????_?????_?????_011_?????_00000_11: begin
        // $display("Valid.");
        inst_type    = I_type;
        alu_opcode   = 5'b00000;
        alu_out_type = 2'b10;
        reg_ren      = 2'b01;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // sd
      // M[x[rs1]+sext(offset)]=x[rs2][63:0]
      // 存8字节到指定内存区域中
      32'b???????_?????_?????_011_?????_01000_11: begin
        // $display("Valid.");
        inst_type    = S_type;
        alu_opcode   = 5'b00000;
        alu_out_type = 2'b10;
        reg_ren      = 2'b01;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // addiw
      // x[rd] = sext((x[rs1] + sext(immediate))[31:0])
      32'b???????_?????_?????_000_?????_00110_11: begin
        // $display("Valid.");
        inst_type    = I_type;
        alu_opcode   = 5'b00000;
        alu_out_type = 2'b01;
        reg_ren      = 2'b01;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // slliw
      // x[rd] = sext((x[rs1] ≪ shamt)[31: 0])
      32'b0000000_?????_?????_001_?????_00110_11: begin
        // $display("Valid.");
        inst_type    = I_type;
        alu_opcode   = 5'b01010;
        alu_out_type = 2'b01;
        reg_ren      = 2'b01;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // srliw
      // x[rd] = sext(x[rs1][31: 0] ≫𝑢 shamt)
      32'b0000000_?????_?????_101_?????_00110_11: begin
        // $display("Valid.");
        inst_type    = I_type;
        alu_opcode   = 5'b01011;
        alu_out_type = 2'b01;
        reg_ren      = 2'b01;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // sraiw
      // x[rd] = sext(x[rs1][31: 0] ≫𝑠 shamt)
      32'b0100000_?????_?????_101_?????_00110_11: begin
        // $display("Valid.");
        inst_type    = I_type;
        alu_opcode   = 5'b01001;
        alu_out_type = 2'b01;
        reg_ren      = 2'b01;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // addw
      // x[rd] = sext((x[rs1] + x[rs2])[31:0])
      32'b0000000_?????_?????_000_?????_01110_11: begin
        // $display("Valid.");
        inst_type    = R_type;
        alu_opcode   = 5'b00000;
        alu_out_type = 2'b01;
        reg_ren      = 2'b11;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // subw
      // x[rd] = sext((x[rs1] − x[rs2])[31: 0])
      32'b0100000_?????_?????_000_?????_01110_11: begin
        // $display("Valid.");
        inst_type    = R_type;
        alu_opcode   = 5'b00001;
        alu_out_type = 2'b01;
        reg_ren      = 2'b11;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // sllw
      // x[rd] = sext((x[rs1] ≪ x[rs2][4: 0])[31: 0])
      32'b0000000_?????_?????_001_?????_01110_11: begin
        // $display("Valid.");
        inst_type    = R_type;
        alu_opcode   = 5'b01010;
        alu_out_type = 2'b01;
        reg_ren      = 2'b11;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // srlw
      // x[rd] = sext(x[rs1][31: 0] ≫𝑢 x[rs2][4: 0])
      32'b0000000_?????_?????_101_?????_01110_11: begin
        // $display("Valid.");
        inst_type    = R_type;
        alu_opcode   = 5'b01011;
        alu_out_type = 2'b01;
        reg_ren      = 2'b11;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // sraw
      // x[rd] = sext(x[rs1][31: 0] ≫𝑠 x[rs2][4: 0])
      32'b0100000_?????_?????_101_?????_01110_11: begin
        // $display("Valid.");
        inst_type    = R_type;
        alu_opcode   = 5'b01001;
        alu_out_type = 2'b01;
        reg_ren      = 2'b11;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // =================================================================
      // RV32M RV64M

      // mul
      // x[rd] = x[rs1] × x[rs2]
      32'b0000001_?????_?????_000_?????_01100_11: begin
        // $display("Valid.");
        inst_type    = R_type;
        alu_opcode   = 5'b01110;
        alu_out_type = 2'b10;
        reg_ren      = 2'b11;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // mulh
      // x[rd] = (x[rs1] 𝑠 ×𝑠 x[rs2]) ≫𝑠 XLEN
      32'b0000001_?????_?????_001_?????_01100_11: begin
        // $display("Valid.");
        inst_type    = R_type;
        alu_opcode   = 5'b10011;
        alu_out_type = 2'b10;
        reg_ren      = 2'b11;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // mulhsu
      // x[rd] = (x[rs1] 𝑠 ×𝑢 x[rs2]) ≫𝑠 XLEN
      32'b0000001_?????_?????_010_?????_01100_11: begin
        // $display("Valid.");
        inst_type    = R_type;
        alu_opcode   = 5'b10100;
        alu_out_type = 2'b10;
        reg_ren      = 2'b11;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // mulhu
      // x[rd] = (x[rs1] 𝑢 ×𝑢 x[rs2]) ≫𝑢 XLEN
      32'b0000001_?????_?????_011_?????_01100_11: begin
        // $display("Valid.");
        inst_type    = R_type;
        alu_opcode   = 5'b10101;
        alu_out_type = 2'b10;
        reg_ren      = 2'b11;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // div
      // x[rd] = x[rs1] ÷s x[rs2]
      32'b0000001_?????_?????_100_?????_01100_11: begin
        // $display("Valid.");
        inst_type    = R_type;
        alu_opcode   = 5'b01111;
        alu_out_type = 2'b10;
        reg_ren      = 2'b11;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // divu
      // x[rd] = x[rs1] ÷u x[rs2]
      32'b0000001_?????_?????_101_?????_01100_11: begin
        // $display("Valid.");
        inst_type    = R_type;
        alu_opcode   = 5'b10000;
        alu_out_type = 2'b10;
        reg_ren      = 2'b11;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // rem
      // x[rd] = x[rs1] %𝑠 x[rs2]
      32'b0000001_?????_?????_110_?????_01100_11: begin
        // $display("Valid.");
        inst_type    = R_type;
        alu_opcode   = 5'b10010;
        alu_out_type = 2'b10;
        reg_ren      = 2'b11;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // remu
      // x[rd] = x[rs1] %𝑢 x[rs2]
      32'b0000001_?????_?????_111_?????_01100_11: begin
        // $display("Valid.");
        inst_type    = R_type;
        alu_opcode   = 5'b10001;
        alu_out_type = 2'b10;
        reg_ren      = 2'b11;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // mulw
      // x[rd] = sext((x[rs1] × x[rs2])[31:0])
      32'b0000001_?????_?????_000_?????_01110_11: begin
        // $display("Valid.");
        inst_type    = R_type;
        alu_opcode   = 5'b10110;
        alu_out_type = 2'b01;
        reg_ren      = 2'b11;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // divw
      // x[rd] = sext(x[rs1][31:0] ÷s x[rs2][31:0])
      32'b0000001_?????_?????_100_?????_01110_11: begin
        // $display("Valid.");
        inst_type    = R_type;
        alu_opcode   = 5'b11000;
        alu_out_type = 2'b01;
        reg_ren      = 2'b11;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // divuw
      // x[rd] = sext(x[rs1][31:0] ÷u x[rs2][31:0])
      32'b0000001_?????_?????_101_?????_01110_11: begin
        // $display("Valid.");
        inst_type    = R_type;
        alu_opcode   = 5'b10111;
        alu_out_type = 2'b01;
        reg_ren      = 2'b11;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // remw
      // x[rd] = sext(x[rs1][31: 0] %𝑠 x[rs2][31: 0])
      32'b0000001_?????_?????_110_?????_01110_11: begin
        // $display("Valid.");
        inst_type    = R_type;
        alu_opcode   = 5'b11010;
        alu_out_type = 2'b01;
        reg_ren      = 2'b11;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end
      
      // remuw
      // x[rd] = sext(x[rs1][31: 0] %𝑢 x[rs2][31: 0])
      32'b0000001_?????_?????_111_?????_01110_11: begin
        // $display("Valid.");
        inst_type    = R_type;
        alu_opcode   = 5'b11001;
        alu_out_type = 2'b01;
        reg_ren      = 2'b11;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end

      // =================================================================

      // default
      default: begin
        // $display("NOP.");
        inst_type    = 3'b0;
        alu_opcode   = 5'b00000;
        alu_out_type = 2'b00;
        reg_ren      = 2'b00;
        `ifdef PRINT_INST_SPACE
        $display();
        `endif
      end
    endcase
  end
endmodule
module ysyx_040163_divider (
  input clk,
  input rst,
  input div_valid, /* 除法器开始信号 */
  input [4:0] div_type,
  input [63:0] dividend_i,
  input [63:0] divisor_i,

  /* 根据指令选择是商还是余数 */
  output [63:0] result_o,
  output div_ready /* 计算ok */
);

  //div   : x[rd] = x[rs1] ÷𝑠 x[rs2]
  //divu  : x[rd] = x[rs1] ÷𝑢 x[rs2]
  //divuw : x[rd] = sext(x[rs1][31:0] ÷𝑢 x[rs2][31:0])
  //divw  : x[rd] = sext(x[rs1][31:0] ÷𝑠 x[rs2][31:0])
  //remu  : x[rd] = x[rs1] %𝑢 x[rs2]
  //rem   : x[rd] = x[rs1] %𝑠 x[rs2]
  //remuw : x[rd] = sext(x[rs1][31: 0] %𝑢 x[rs2][31: 0])
  //remw  : x[rd] = sext(x[rs1][31: 0] %𝑠 x[rs2][31: 0])
  parameter DIV   = 5'b01111; // 除法 有符号
  parameter DIVU  = 5'b10000; // 除法 无符号
  parameter DIVUW = 5'b10111;
  parameter DIVW  = 5'b11000;
  parameter REMU  = 5'b10001; // 取余数 无符号
  parameter REM   = 5'b10010; // 取余数 有符号
  parameter REMUW = 5'b11001;
  parameter REMW  = 5'b11010;

//------------------------------------------------------------------------
// Pre-Processing
//------------------------------------------------------------------------
  //reg div_sign_d;
  //reg div_sign;
  //reg [63:0] dividend;
  reg [63:0] divisor, divisor_d;
  reg div_zero; // divide by zero
  reg div_of; // signed overflow

  reg [1:0] state, state_d;
  reg [6:0] cnt, cnt_d;
  reg [63:0] result, result_sp, result_d;
  reg neg_q, neg_q_d, neg_s, neg_s_d;

  wire [63:0] dividend_i_sext32, divisor_i_sext32;
  assign dividend_i_sext32 = {{32{dividend_i[31]}}, dividend_i[31:0]};
  assign divisor_i_sext32  = {{32{divisor_i[31]}}, divisor_i[31:0]};

  wire [63:0] dividend_i_twos, divisor_i_twos;
  assign dividend_i_twos = ~dividend_i + 'h1;
  assign divisor_i_twos = ~divisor_i + 'h1;

  wire [63:0] dividend_i_abs, divisor_i_abs;
  assign dividend_i_abs = dividend_i[63] ? dividend_i_twos : dividend_i;
  assign divisor_i_abs  = divisor_i[63] ? divisor_i_twos : divisor_i;

  wire [63:0] dividend_i_sext32_twos, divisor_i_sext32_twos;
  assign dividend_i_sext32_twos = ~dividend_i_sext32 +'h1;
  assign divisor_i_sext32_twos = ~divisor_i_sext32 +'h1;

  wire [63:0] dividend_i_sext32_abs, divisor_i_sext32_abs;
  assign dividend_i_sext32_abs = dividend_i_sext32[63] ? dividend_i_sext32_twos : dividend_i_sext32;
  assign divisor_i_sext32_abs = divisor_i_sext32[63] ? divisor_i_sext32_twos : divisor_i_sext32;

  // 对溢出以及除零做检测
  always @(*) begin
    result_sp = 0;
    div_zero = 0;
    div_of = 0;
      case (div_type)
        DIV: begin
          if (~|divisor_i) begin
            div_zero = 1;
            result_sp = {64{1'b1}};
          end
          else if (dividend_i == {1'b1, 63'b0} && &divisor_i) begin
            div_of = 1;
            result_sp = {1'b1, 63'b0};
          end
        end

        DIVU: begin
          if (~|divisor_i) begin
            div_zero = 1;
            result_sp = {64{1'b1}};
          end
        end

        DIVUW: begin
          if (~|(divisor_i[31:0])) begin
            div_zero = 1;
            result_sp = {64{1'b1}};
          end
        end

        DIVW: begin
          if (~|divisor_i) begin
            div_zero = 1;
            result_sp = {64{1'b1}};
          end
          else if (dividend_i[31:0] == {1'b1, 31'b0} && &(divisor_i[31:0])) begin
            div_of = 1;
            result_sp = {{32{1'b1}}, {1'b1, 31'b0}};
          end
        end

        REMU: begin
          if (~|divisor_i) begin
            div_zero = 1;
            result_sp = dividend_i;
          end
        end

        REM: begin
          if (~|divisor_i) begin
            div_zero = 1;
            result_sp = dividend_i;
          end
          else if (dividend_i == {1'b1, 63'b0} && &divisor_i) begin
            div_of = 1;
            result_sp = 0;
          end
        end

        REMUW: begin
          if (~|(divisor_i[31:0])) begin
            div_zero = 1;
            result_sp = dividend_i_sext32;
          end
        end

        REMW: begin
          if (~|(divisor_i[31:0])) begin
            div_zero = 1;
            result_sp = dividend_i_sext32;
          end
          else if (dividend_i[31:0] == {1'b1, 31'b0} && &(divisor_i[31:0])) begin
            div_of = 1;
            result_sp = 0;
          end
        end

        default:
        ;
      endcase
  end

//------------------------------------------------------------------------
// Divider
// q = z/d + s
// z: Dividend
// d: Divisor
// q: Quotient
// s: Remainder
//------------------------------------------------------------------------
  parameter IDLE = 2'b00;
  parameter DIVIDE  = 2'b01;
  parameter FINISH = 2'b10;

  assign result_o = result_d;

  assign div_ready = (state == IDLE && state_d == IDLE) | (state == FINISH);

  reg [127:0] res, res_d;
  wire [127:0] res_shifted; // {s[63:0], q[63:0]}
  wire [64:0] s_minus_di;
  assign s_minus_di = res_shifted[127:64] - divisor;
  assign res_shifted = res << 1;

  wire [63:0] q_positive, s_positive;
  assign q_positive = neg_q ? (~res[63:0] + 'h1) : res[63:0];
  assign s_positive = neg_s ? (~res[127:64] + 'h1) : res[127:64];

  always @(*) begin
    state_d = state;
    result_d = result;
    cnt_d = cnt;
    neg_q_d = neg_q;
    neg_s_d = neg_s;
    res_d = res;
    divisor_d = divisor;
	    case(state)
        IDLE: begin
          /* 如果除法允许进行 */
          if (div_valid) begin
            /* 如果是除0或溢出则IDLE态 */
            if (div_zero | div_of) begin
              result_d = result_sp;
              state_d = IDLE;
            end
            /* 进入DIVIDE态并设置初始值 */
            else begin
              state_d = DIVIDE;
              //cnt_d = ;
              //neg_q_d = ;
              //neg_s_d = ;
              //res_d = ;
              //divisor_d = ;
              case (div_type)
                DIV: begin
                  cnt_d = {1'b1, 6'b0};
                  neg_q_d = dividend_i[63] ^ divisor_i[63];
                  neg_s_d = dividend_i[63];
                  res_d[127:64] = 0;
                  res_d[63:0] = dividend_i_abs;
                  divisor_d = divisor_i_abs;
                end

                DIVU: begin
                  cnt_d = {1'b1, 6'b0};
                  neg_q_d = 0;
                  neg_s_d = 0;
                  res_d[127:64] = 0;
                  res_d[63:0] = dividend_i;
                  divisor_d = divisor_i;
                end

                DIVUW: begin
                  cnt_d = {1'b0, 1'b1, 5'b0};
                  neg_q_d = 0;
                  neg_s_d = 0;
                  res_d[127:64] = 0;
                  res_d[63:0] = {dividend_i[31:0], {32{1'b0}}};
                  divisor_d = {{32{1'b0}}, divisor_i[31:0]};
                end

                DIVW: begin
                  cnt_d = {1'b0, 1'b1, 5'b0};
                  neg_q_d = dividend_i[31] ^ divisor_i[31];
                  neg_s_d = dividend_i[31];
                  res_d[127:64] = 0;
                  res_d[63:0] = {dividend_i_sext32_abs[31:0], 32'b0};
                  divisor_d = divisor_i_sext32_abs;
                end

                REMU: begin
                  cnt_d = {1'b1, 6'b0};
                  neg_q_d = 0;
                  neg_s_d = 0;
                  res_d[127:64] = 0;
                  res_d[63:0] = dividend_i;
                  divisor_d = divisor_i;
                end

                REM: begin
                  cnt_d = {1'b1, 6'b0};
                  neg_q_d = dividend_i[63] ^ divisor_i[63];
                  neg_s_d = dividend_i[63];
                  res_d[127:64] = 0;
                  res_d[63:0] = dividend_i_abs;
                  divisor_d = divisor_i_abs;
                end

                REMUW: begin
                  cnt_d = {1'b0, 1'b1, 5'b0};
                  neg_q_d = 0;
                  neg_s_d = 0;
                  res_d[127:64] = 0;
                  res_d[63:0] = {dividend_i[31:0], {32{1'b0}}};
                  divisor_d = {{32{1'b0}}, divisor_i[31:0]};
                end

                REMW: begin
                  cnt_d = {1'b0, 1'b1, 5'b0};
                  neg_q_d = dividend_i[31] ^ divisor_i[31];
                  neg_s_d = dividend_i[31];
                  res_d[127:64] = 0;
                  res_d[63:0] = {dividend_i_sext32_abs[31:0], 32'b0};
                  divisor_d = divisor_i_sext32_abs;
                end

                default:;
              endcase
            end
          end
          /* 否则就是IDLE */
          else begin
            state_d = IDLE;
          end
        end

        DIVIDE: begin
          if (~|cnt) begin
            state_d = FINISH;
          end
          else begin
            cnt_d = cnt - 1;
            state_d = DIVIDE;
            if (s_minus_di[64]) begin
              res_d[127:64] = res_shifted[127:64];
              res_d[63:0] = {res_shifted[63:1], 1'b0};
            end
            else begin
              res_d[127:64] = s_minus_di[63:0];
              res_d[63:0] = {res_shifted[63:1], 1'b1};
            end
          end
        end

        FINISH: begin
          state_d = IDLE;
          case (div_type)
            DIV: begin
              result_d = q_positive;
            end
            DIVU: begin
              result_d = res[63:0];
            end
            DIVUW: begin
              result_d = {{32{res[31]}}, res[31:0]};
            end
            DIVW: begin
              result_d = {{32{q_positive[31]}}, q_positive[31:0]};
            end
            REMU: begin
              result_d = res[127:64];
            end
            REM: begin
              result_d = s_positive;
            end
            REMUW: begin
              result_d = {{32{res[95]}}, res[95:64]};
            end
            REMW: begin
              result_d = {{32{s_positive[31]}}, s_positive[31:0]};
            end
            default: begin
              result_d = 0;
            end
          endcase
        end

        default:;
	    endcase
  end

  always @(posedge clk) begin
    if (rst) begin
	    state <= IDLE;
      cnt <= 0;
      neg_q <= 0;
      neg_s <= 0;
      res <= 0;
      divisor <= 0;
      result <= 0;
	  end
	  else begin
	    state <= state_d;
      cnt <= cnt_d;
      neg_q <= neg_q_d;
      neg_s <= neg_s_d;
      res <= res_d;
      divisor <= divisor_d;
      result <= result_d;
	  end
  end

endmodule
module ysyx_040163_EX_MEM (
  input  wire        clk,
  input  wire        rst,

  input  wire  [3:0] ram_store_ex,
  input  wire  [3:0] ram_load_ex,
  input  wire [63:0] alu_out_ex,
  input  wire        reg_wen_ex,
  input  wire  [4:0] reg_waddr_ex,
  input  wire [63:0] reg_rdata_1_ex,
  input  wire  [4:0] reg_raddr_1_ex,
  input  wire [63:0] reg_rdata_2_ex,
  input  wire  [4:0] reg_raddr_2_ex,
  input  wire        csr_wen_ex,
  input  wire  [3:0] csr_inst_type_ex,
  input  wire [11:0] imm_ex,
  input wire dcache_invalidate_ex,
  input wire got_interrupt_ex,

  output reg  [3:0] ram_store_mem,
  output reg  [3:0] ram_load_mem,
  output reg [63:0] alu_out_mem,
  output reg        reg_wen_mem,
  output reg  [4:0] reg_waddr_mem,
  output reg [63:0] reg_rdata_1_mem,
  output reg  [4:0] reg_raddr_1_mem,
  output reg [63:0] reg_rdata_2_mem,
  output reg  [4:0] reg_raddr_2_mem,
  output reg        csr_wen_mem,
  output reg  [3:0] csr_inst_type_mem,
  output reg [11:0] imm_mem,
  output reg dcache_invalidate_mem,
  output reg got_interrupt_mem,

  /* valid */
  input  wire        valid_ex,
  output reg        valid_mem,

  /* ready */

  /* pc */
  input  wire [63:0] pc_ex,
  output reg [63:0] pc_mem,

  /* control */
  input  wire ex_mem_stall,
  input  wire ex_mem_flush,
  input  wire mem_wb_stall
);

  wire valid_ex_mem;
  //assign valid_ex_mem = (ex_mem_flush | ex_mem_stall) ? 0 : valid_ex;
  assign valid_ex_mem = (ex_mem_flush) ? 0 : valid_ex;

  wire [3:0] ram_store_ex_mem;
  wire [3:0] ram_load_ex_mem;
  wire       reg_wen_ex_mem;
  wire [4:0] reg_waddr_ex_mem;
  wire [4:0] reg_raddr_1_ex_mem;
  wire [4:0] reg_raddr_2_ex_mem;
  wire       csr_wen_ex_mem;
  wire [3:0] csr_inst_type_ex_mem;
  wire dcache_invalidate_ex_mem;
  wire got_interrupt_ex_mem;

  assign ram_store_ex_mem =  ex_mem_flush ? 0 : ram_store_ex;
  assign ram_load_ex_mem = ex_mem_flush ? 0 : ram_load_ex;
  assign reg_wen_ex_mem = ex_mem_flush ? 0 : reg_wen_ex;
  /* 说实话下面这两个信号感觉多余了 */
  assign reg_waddr_ex_mem = ex_mem_flush ? 0 : reg_waddr_ex;
  assign reg_raddr_1_ex_mem = ex_mem_flush ? 0 : reg_raddr_1_ex;
  assign reg_raddr_2_ex_mem = ex_mem_flush ? 0 : reg_raddr_2_ex;
  assign csr_wen_ex_mem = ex_mem_flush ? 0 : csr_wen_ex;
  assign csr_inst_type_ex_mem = ex_mem_flush ? 0 : csr_inst_type_ex;
  assign dcache_invalidate_ex_mem = ex_mem_flush ? 0 : dcache_invalidate_ex;
  assign got_interrupt_ex_mem = ex_mem_flush ? 0 : got_interrupt_ex;

  always @(posedge clk) begin
    if (rst) begin
      ram_store_mem <= 0;
      ram_load_mem <= 0;
      alu_out_mem <= 0;
      reg_wen_mem <= 0;
      reg_waddr_mem <= 0;
      reg_rdata_1_mem <= 0;
      reg_raddr_1_mem <= 0;
      reg_rdata_2_mem <= 0;
      reg_raddr_2_mem <= 0;
      valid_mem <= 0;
      pc_mem <= 0;
      csr_wen_mem <= 0;
      csr_inst_type_mem <= 0;
      imm_mem <= 0;
      dcache_invalidate_mem <= 0;
      got_interrupt_mem <= 0;
    end
    else if (ex_mem_stall && (~mem_wb_stall)) begin
      ram_store_mem <= 0;
      ram_load_mem <= 0;
      alu_out_mem <= 0;
      reg_wen_mem <= 0;
      reg_waddr_mem <= 0;
      reg_rdata_1_mem <= 0;
      reg_raddr_1_mem <= 0;
      reg_rdata_2_mem <= 0;
      reg_raddr_2_mem <= 0;
      valid_mem <= 0;
      pc_mem <= 0;
      csr_wen_mem <= 0;
      csr_inst_type_mem <= 0;
      imm_mem <= 0;
      dcache_invalidate_mem <= 0;
      got_interrupt_mem <= 0;
    end
    else if (~ex_mem_stall) begin
      ram_store_mem <= ram_store_ex_mem;
      ram_load_mem <= ram_load_ex_mem;
      alu_out_mem <= alu_out_ex;
      reg_wen_mem <= reg_wen_ex_mem;
      reg_waddr_mem <= reg_waddr_ex_mem;
      reg_rdata_1_mem <= reg_rdata_1_ex;
      reg_raddr_1_mem <= reg_raddr_1_ex_mem;
      reg_rdata_2_mem <= reg_rdata_2_ex;
      reg_raddr_2_mem <= reg_raddr_2_ex_mem;
      valid_mem <= valid_ex_mem;
      pc_mem <= pc_ex;
      csr_wen_mem <= csr_wen_ex_mem;
      csr_inst_type_mem <= csr_inst_type_ex_mem;
      imm_mem <= imm_ex;
      dcache_invalidate_mem <= dcache_invalidate_ex_mem;
      got_interrupt_mem <= got_interrupt_ex_mem;
    end
  end

endmodule
module ysyx_040163_fetch (
  input clk,
  input rst,

  input [63:0] reg_rdata_1_ex,
  input [63:0] reg_rdata_2_ex,

  input [3:0] jmp_type_ex,
  input [63:0] jmp_offset_ex,
  output jmp_flag_ex,

  input [63:0] pc_ex,
  input pc_stall,
  output [63:0] pc,

  output [31:0] inst,

  input csr_jmp_req,
  input [63:0] csr_jmp_addr,

  input csr_jmp_inst_ex,
  input csr_jmp_inst_mem,
  input csr_jmp_inst_wb,

  output if_stall_req,
  output icache_data_ok,

  output         rw_valid_o,   // 请求有效
	input          rw_ready_i,   // 访存完成
  output         rw_wen_o,     // 访存类型 0是读 1是写
  input  [127:0] rw_r_data_i, // 读数据
  output [127:0] rw_w_data_o, // 写数据
  output  [31:0] rw_addr_o,   // 读/写地址
  output  [15:0] rw_wstrb_o,  // 写字节掩码
  output   [1:0] rw_burst_o,
  output   [2:0] rw_size_o,

  output   [5:0] io_sram0_addr,
  output         io_sram0_cen,
  output         io_sram0_wen,
  output [127:0] io_sram0_wmask,
  output [127:0] io_sram0_wdata,
  input  [127:0] io_sram0_rdata,
  output   [5:0] io_sram1_addr,
  output         io_sram1_cen,
  output         io_sram1_wen,
  output [127:0] io_sram1_wmask,
  output [127:0] io_sram1_wdata,
  input  [127:0] io_sram1_rdata,
  output   [5:0] io_sram2_addr,
  output         io_sram2_cen,
  output         io_sram2_wen,
  output [127:0] io_sram2_wmask,
  output [127:0] io_sram2_wdata,
  input  [127:0] io_sram2_rdata,
  output   [5:0] io_sram3_addr,
  output         io_sram3_cen,
  output         io_sram3_wen,
  output [127:0] io_sram3_wmask,
  output [127:0] io_sram3_wdata,
  input  [127:0] io_sram3_rdata
);

//wire [63:0] pc_d;

  ysyx_040163_pc pc0(
    /* Input */
    .clk(clk),
    .rst(rst),

    .pc_stall(pc_stall),

    .reg_rdata_1(reg_rdata_1_ex),
    .reg_rdata_2(reg_rdata_2_ex),

    .jmp_type(jmp_type_ex),
    .jmp_offset(jmp_offset_ex),

    .pc_ex(pc_ex),

    .csr_jmp_req(csr_jmp_req),
    .csr_jmp_addr(csr_jmp_addr),

    /* Output */
    .pc(pc),
  //.pc_d(pc_d),
    .jmp_flag_ex(jmp_flag_ex)
  );
  
  wire icache_addr_ok;
  assign if_stall_req = ~(icache_addr_ok && icache_data_ok);

  wire [63:0] inst64;
  assign inst = pc[2] ? inst64[63:32] : inst64[31:0];

  reg [63:0] pc_r;
  always @(posedge clk) begin
    if (rst) begin
      pc_r <= 0;
    end
    else begin
      pc_r <= pc;
    end
  end
  wire pc_changed;
  assign pc_changed = (pc_r != pc);

  ysyx_040163_icache icache0(
    .clk(clk),
    .rst(rst),

    .icache_op({1'b0}),      /* 操作类型，1写，0读 */
    .icache_valid(1 && pc_changed && ~(csr_jmp_inst_ex | csr_jmp_inst_mem | csr_jmp_inst_wb)),   /* 请求有校 */
    .icache_addr(pc),    /* 请求地址 */
    .icache_wdata({64'b0}),   /* 写数据 */
    .icache_wstrb({8'b0}),   /* 写字节使能，1组有4个字 */
    .icache_rdata(inst64),   /* 读取的数据 */
    .icache_data_ok(icache_data_ok), /* 数据读取完成或者数据写入完成 */
    .icache_addr_ok(icache_addr_ok), /* 本次请求接收完成 */

    .rw_valid_o(rw_valid_o),   // 请求有效
	  .rw_ready_i(rw_ready_i),   // 访存完成
    .rw_wen_o(rw_wen_o),     // 访存类型 0是读 1是写
    .rw_r_data_i(rw_r_data_i), // 读数据
    .rw_w_data_o(rw_w_data_o), // 写数据
    .rw_addr_o(rw_addr_o),   // 读/写地址
    .rw_wstrb_o(rw_wstrb_o),  // 写字节掩码
    .rw_burst_o(rw_burst_o),
    .rw_size_o(rw_size_o),

    /* sram 0-3 */
    .io_sram0_addr(io_sram0_addr),
    .io_sram0_cen(io_sram0_cen),
    .io_sram0_wen(io_sram0_wen),
    .io_sram0_wmask(io_sram0_wmask),
    .io_sram0_wdata(io_sram0_wdata),
    .io_sram0_rdata(io_sram0_rdata),
    .io_sram1_addr(io_sram1_addr),
    .io_sram1_cen(io_sram1_cen),
    .io_sram1_wen(io_sram1_wen),
    .io_sram1_wmask(io_sram1_wmask),
    .io_sram1_wdata(io_sram1_wdata),
    .io_sram1_rdata(io_sram1_rdata),
    .io_sram2_addr(io_sram2_addr),
    .io_sram2_cen(io_sram2_cen),
    .io_sram2_wen(io_sram2_wen),
    .io_sram2_wmask(io_sram2_wmask),
    .io_sram2_wdata(io_sram2_wdata),
    .io_sram2_rdata(io_sram2_rdata),
    .io_sram3_addr(io_sram3_addr),
    .io_sram3_cen(io_sram3_cen),
    .io_sram3_wen(io_sram3_wen),
    .io_sram3_wmask(io_sram3_wmask),
    .io_sram3_wdata(io_sram3_wdata),
    .io_sram3_rdata(io_sram3_rdata)
  );

endmodule
module ysyx_040163_forwardingUnit (
  input  wire  [4:0] reg_raddr_1_ex,
  input  wire  [4:0] reg_raddr_2_ex,
  input  wire  [4:0] reg_waddr_mem,
  input  wire  [4:0] reg_waddr_wb,
  input  wire        reg_wen_mem,
  input  wire        reg_wen_wb,
  input  wire  [4:0] reg_raddr_2_mem,
  input  wire        ram_store_en_mem,
  input  wire        ram_load_en_wb,

  output wire  [1:0] ForwardA,
  output wire  [1:0] ForwardB,
  output wire        ForwardC
);

  /* 这里的代码已经保证了低一位和高一位不会都为1，有些极端情况下，某个代码序列它是符合多种前递情况的 */

  /* rs1 MEM前推 */
  assign ForwardA[1] = reg_wen_mem && (reg_waddr_mem != 0) && (reg_waddr_mem == reg_raddr_1_ex);
  /* rs1 WB前推 */
  assign ForwardA[0] = reg_wen_wb && (reg_waddr_wb != 0) && (!(reg_wen_mem && (reg_waddr_mem != 0) && (reg_waddr_mem == reg_raddr_1_ex))) && (reg_waddr_wb == reg_raddr_1_ex);

  /* rs2 MEM前推 */
  assign ForwardB[1] = reg_wen_mem && (reg_waddr_mem != 0) && (reg_waddr_mem == reg_raddr_2_ex);
  /* rs2 WB前推 */
  assign ForwardB[0] = reg_wen_wb && (reg_waddr_wb != 0) && (!(reg_wen_mem && (reg_waddr_mem != 0) && (reg_waddr_mem == reg_raddr_2_ex))) && (reg_waddr_wb == reg_raddr_2_ex);

  /* 专门解决load-store数据冒险
   * load取出要存入寄存器的值，而store的rs2也需要那个值，则传递
   * mem执行store && wb执行load && 写入存储器的不为0寄存器 && load到寄存器地址 == mem需要的rs2
   */
  assign ForwardC = ram_store_en_mem && ram_load_en_wb && (reg_raddr_2_mem != 0) && (reg_waddr_wb == reg_raddr_2_mem);
  
endmodule
module ysyx_040163_icache (
  input wire         clk,
  input wire         rst,

  input wire         icache_op,      /* 操作类型，1写，0读 */
  input wire         icache_valid,   /* 请求有校 */
  input wire  [63:0] icache_addr,    /* 请求地址 */
  input wire  [63:0] icache_wdata,   /* 写数据 */
  input wire   [7:0] icache_wstrb,   /* 写字节使能，1组有4个字 */
  output wire [63:0] icache_rdata,   /* 读取的数据 */
  output reg         icache_data_ok, /* 数据读取完成或者数据写入完成 */
  output wire        icache_addr_ok, /* 本次请求接收完成 */

  // Cache访存接口
	output         rw_valid_o,  // 请求有效
	input          rw_ready_i,  // 访存完成
  output         rw_wen_o,    // 访存类型 0是读 1是写
  input  [127:0] rw_r_data_i, // 读数据
  output [127:0] rw_w_data_o, // 写数据
  output  [31:0] rw_addr_o,   // 读/写地址
  output  [15:0] rw_wstrb_o,  // 写字节掩码
  output   [1:0] rw_burst_o,  // 突发长度 00是1，01是2，目前只可能是这两个值
  output   [2:0] rw_size_o,

  output   [5:0] io_sram0_addr,
  output         io_sram0_cen,
  output         io_sram0_wen,
  output [127:0] io_sram0_wmask,
  output [127:0] io_sram0_wdata,
  input  [127:0] io_sram0_rdata,
  output   [5:0] io_sram1_addr,
  output         io_sram1_cen,
  output         io_sram1_wen,
  output [127:0] io_sram1_wmask,
  output [127:0] io_sram1_wdata,
  input  [127:0] io_sram1_rdata,
  output   [5:0] io_sram2_addr,
  output         io_sram2_cen,
  output         io_sram2_wen,
  output [127:0] io_sram2_wmask,
  output [127:0] io_sram2_wdata,
  input  [127:0] io_sram2_rdata,
  output   [5:0] io_sram3_addr,
  output         io_sram3_cen,
  output         io_sram3_wen,
  output [127:0] io_sram3_wmask,
  output [127:0] io_sram3_wdata,
  input  [127:0] io_sram3_rdata
);

/* ===========================Pre-process========================== */
  /* Cache */
  localparam IDLE   = 3'b000;
  localparam LOOKUP = 3'b001;
  localparam WBACK  = 3'b010;
  localparam REFILL = 3'b011;
  localparam WRITE  = 3'b100;
//localparam ERROR  = 3'b101;

  wire [20:0] tag         = icache_addr[31:11]; /* tag */
  wire  [6:0] index       = icache_addr[10:4];  /* index */
  wire        word_offset = icache_addr[3];     /* word_offset，1个cacheline共2字 */
//wire  [2:0] byte_offset = icache_addr[2:0];   /* byte_offset，1个字共8字节 */
  
  reg [2:0] state_d, state_q; // 次态 现态
  reg read_hit_ok, write_hit_ok, miss_ok, req_ok;
//reg uncached_ok;
  reg [63:0] hit_count, miss_count, all_count;

  reg replace_way;

  reg uncached_req;

  wire [1:0] rdata_v;

  wire [20:0] rdata_tag [0:1];

  reg [6:0] index_req;
  reg [63:0] wdata_req;
  reg word_offset_req;

  wire [63:0] data_wstrb_miss;
  wire [127:0] data_wstrb_write;

  reg [20:0] tag_req;

  wire [1:0] rdata_dirty;

  reg rw_wen, rw_valid;
  reg [31:0] rw_addr, rw_addr_r;
  reg [127:0] rw_w_data, rw_w_data_r;

  reg [20:0] tag_miss;
  reg [6:0] index_miss;
  
  wire [1:0] way_hit;

  wire [63:0] load_word_way [0:1];

  reg device_req;

  reg word_offset_miss;

  wire [127:0] refill_data, refill_data_store, refill_data_load;

  reg [31:0] addr_req;

  wire dirty;

  wire cache_hit, cache_miss;

  reg op_req;

  wire [127:0] rdata_data [0:1];

  genvar i; /* 为后面的generate for准备的 */

  /* 由于是阻塞Cache，所以向前向后的阻塞是一致的 */
  //assign icache_data_ok = read_hit_ok | write_hit_ok | miss_ok | uncached_ok; /* 读命中|写命中|miss处理完|uncached结束 */
  assign icache_addr_ok = icache_data_ok;

  wire IDLE_LOOKUP   = (state_q == IDLE   && state_d == LOOKUP); // 所有请求的必经之路
  wire LOOKUP_WBACK  = (state_q == LOOKUP && state_d == WBACK); // 发出总线写请求
  wire LOOKUP_REFILL = (state_q == LOOKUP && state_d == REFILL); // 发出总线读请求
  wire LOOKUP_IDLE   = (state_q == LOOKUP && state_d == IDLE);
  wire LOOKUP_WRITE  = (state_q == LOOKUP && state_d == WRITE);
//wire WRITE_IDLE    = (state_q == WRITE  && state_d == IDLE); // 写hit回到idle
//wire WBACK_REFILL  = (state_q == WBACK  && state_d == REFILL); // 发出总线读请求
  wire REFILL_IDLE   = (state_q == REFILL && state_d == IDLE); // 将总线读响应写回cache并回到idle

  /* rdata来源为DataSRAM或者总线读取值 */
  reg [63:0] load_res, load_res_last;
  always @(*) begin
    if (LOOKUP_IDLE) begin
      load_res = {64{way_hit[0]}} & load_word_way[0]
               | {64{way_hit[1]}} & load_word_way[1];
    end
    else if (REFILL_IDLE) begin
      if (~device_req) begin
        load_res = word_offset_miss ? refill_data[127:64] : refill_data[63:0];
      end
      else begin
        load_res[31:0] = addr_req[2] ? 32'b0 : refill_data[31:0];
        load_res[63:32] = addr_req[2] ? refill_data[31:0] : 32'b0;
      end
    end
    else begin
      load_res = load_res_last;
    end
  end
  // 考虑到整个核，会有更多的stall，因此需要维稳
  always @(posedge clk) begin
    if (rst) begin
      load_res_last <= 0;
    end
    else begin
      load_res_last <= load_res;
    end
  end

  assign icache_rdata = load_res;

  assign load_word_way[0] = word_offset ? rdata_data[0][127:64] : rdata_data[0][63:0];
  assign load_word_way[1] = word_offset ? rdata_data[1][127:64] : rdata_data[1][63:0];

  wire uncached, device;
  assign uncached = (~(icache_addr >= 64'h80000000));
  assign device = (icache_addr < 64'h80000000);

/* ==========================Cache Control========================= */
  // 性能计数
  always @(posedge clk) begin
    if (rst) begin
      hit_count <= 0;
      miss_count <= 0;
      all_count <= 0;
    end
    else begin
      // hit计数
      if (read_hit_ok || write_hit_ok) begin
        hit_count <= hit_count + 1;
      end
      else begin
        hit_count <= hit_count;
      end

      // miss计数
      if (miss_ok) begin
        miss_count <= miss_count + 1;
      end
      else begin
        miss_count <= miss_count;
      end

      // 所有请求计数
      if (req_ok) begin
        all_count <= all_count + 1;
      end
      else begin
        all_count <= all_count;
      end
    end
  end

  always @(*) begin
    state_d = state_q;
    read_hit_ok = 0;
    write_hit_ok = 0;
    miss_ok = 0;
    req_ok = 0;
  //uncached_ok = 0;
    icache_data_ok = 0;

    rw_wen = 0;
    rw_valid = 0;
    rw_addr = 0;
    rw_w_data = 0;

    case (state_q)
      /* 空闲状态，等待接受到有效请求 */
      IDLE: begin
        /* 有写/读请求，且请求有效 */
        if (icache_valid) begin
          req_ok = 1;
          state_d = LOOKUP;
        end
        /* 没有写/读请求，或请求无效 */
        else begin
          icache_data_ok = 1;
          state_d = IDLE;
        end
      end

      /* 接收到有效请求并缓存，读取tag和data */
      LOOKUP: begin
        /* cache_hit且是写请求 */
        if (cache_hit && op_req) begin
          state_d = WRITE;
        end
        /* cache_hit且是读请求 */
        else if (cache_hit && ~op_req) begin
          icache_data_ok = 1;
          read_hit_ok = 1;
          state_d = IDLE;
        end
        /* 如果(miss且dirty且valid)或(uncached且写) 则先写回 */
        else if (cache_miss && dirty && rdata_v[replace_way] || (uncached_req && op_req)) begin
          rw_wen = 1;
          rw_valid = 1;
          rw_addr = (uncached_req ? (device_req ? {addr_req[31:2], 2'b0} : {addr_req[31:4], 4'b0}) : {rdata_tag[replace_way], index_req, 4'b0});
          rw_w_data = (uncached_req ? (device_req ? {64'b0, addr_req[2] ? {32'b0, wdata_req[63:32]} : {32'b0, wdata_req[31:0]}} : (word_offset_req ? {wdata_req, 64'b0} : {64'b0, wdata_req})) : (replace_way ? rdata_data[1] : rdata_data[0]));
          state_d = WBACK;
        end
        /* 如果miss且(不dirty或不valid)或(uncached且读) 则发出读请求 */
        else if (cache_miss && (~dirty || ~rdata_v[replace_way]) || (uncached_req && ~op_req)) begin
          rw_valid = 1;
          rw_addr = (uncached_req ? (device_req ? {addr_req[31:2], 2'b0} : {addr_req[31:4], 4'b0}) : {tag_req, index_req, 4'b0});
          state_d = REFILL;
        end
      end

      /* 写hit，转换到IDLE时进行写入操作 */
      WRITE: begin
        /* 写hit */
        icache_data_ok = 1;
        write_hit_ok = 1;
        state_d = IDLE;
      end

      WBACK: begin
        // 总线写请求没ready则继续等待
        if (~rw_ready_i) begin
          state_d = WBACK;
          rw_wen = 1;
          rw_valid = 1;
          rw_addr = rw_addr_r;
          rw_w_data = rw_w_data_r;
        end
        // ready则根据uncached判断下一步
        else if (rw_ready_i) begin
          if (uncached) begin
            //$display("uncached");
            icache_data_ok = 1;
          //uncached_ok = 1;
            state_d = IDLE;
          end
          else if (~uncached) begin
            rw_valid = 1;
            rw_addr = {tag_miss, index_miss, 4'b0};
            state_d = REFILL;
          end
        end
      end

      /* 等待读取的值，转换到IDLE态时执行写入操作 */
      REFILL: begin
        /* 总线读请求ready */
        if (rw_ready_i) begin
          icache_data_ok = 1;
          miss_ok = 1;
          state_d = IDLE;
        end
        /* 总线读请求还没ready */
        else if (~rw_ready_i) begin
          rw_valid = 1;
          rw_addr = rw_addr_r;
          state_d = REFILL;
        end
      end

      /* 未知领域，误入歧途 */
      default: begin
        state_d = 3'bx;
      end
    endcase
  end

  always @(posedge clk) begin
    if (rst) begin
      state_q <= IDLE;
      rw_addr_r <= 0;
      rw_w_data_r <= 0;
    end
    else begin
      state_q <= state_d;
      rw_addr_r <= rw_addr;
      rw_w_data_r <= rw_w_data;
    end
  end

/* =======================Replacement Policy======================= */
  always @(posedge clk) begin
    if (rst) begin
      replace_way <= 0;
    end
    else begin
      replace_way <= replace_way + 1;
    end
  end

/* =========================Request Buffer========================= */
  // 所有请求的第一步，将请求内容以及uncached情况进行锁存
  reg  [7:0] wstrb_req;

  always @(posedge clk) begin
    if (rst) begin
      op_req <= 0;
      addr_req <= 0;
      wdata_req <= 0;
      wstrb_req <= 0;
      tag_req <= 0;
      index_req <= 0;
      word_offset_req <= 0;
      uncached_req <= 0;
      device_req <= 0;
    end
    else if (IDLE_LOOKUP) begin
      op_req <= icache_op;
      addr_req <= icache_addr[31:0];
      wdata_req <= icache_wdata;
      wstrb_req <= icache_wstrb;
      tag_req <= tag;
      index_req <= index;
      word_offset_req <= word_offset;
      uncached_req <= uncached;
      device_req <= device;
    end
  end

  generate
    for (i = 0; i < 2; i = i + 1) begin : wayhit
      assign way_hit[i] = rdata_v[i] && (rdata_tag[i] == tag_req);
    end
  endgenerate

  /* Cache是否hit */
  assign cache_hit = |way_hit;
  assign cache_miss = ~cache_hit;

/* ===========================Miss Buffer========================== */
  // 读/写miss，将miss处理需要的数据进行缓存
  reg op_miss;
  reg [63:0] wdata_miss;
  reg [7:0] wstrb_miss;
//reg [2:0] byte_offset_miss;
  reg replace_way_miss;
//reg [20:0] rdata_tag_miss [0:1];
//reg [1:0] rdata_v_miss;
//reg [1:0] rdata_d_miss;
//reg [127:0] rdata_data_miss [0:1];

  always @(posedge clk) begin
    if (rst) begin
      op_miss <= 0;
      wdata_miss <= 0;
      wstrb_miss <= 0;
      tag_miss <= 0;
      index_miss <= 0;
      word_offset_miss <= 0;
    //byte_offset_miss <= 0;
      replace_way_miss <= 0;
    //rdata_tag_miss[0] <= 0;
    //rdata_tag_miss[1] <= 0;
    //rdata_v_miss <= 0;
    //rdata_d_miss <= 0;
    //rdata_data_miss[0] <= 0;
    //rdata_data_miss[1] <= 0;
    end
    else if (LOOKUP_WBACK || LOOKUP_REFILL) begin
      op_miss <= op_req;
      wdata_miss <= wdata_req;
      wstrb_miss <= wstrb_req;
      tag_miss <= tag_req;
      index_miss <= index_req;
      word_offset_miss <= word_offset_req;
      replace_way_miss <= replace_way;
    //rdata_tag_miss <= rdata_tag;
    //rdata_v_miss <= rdata_v;
    //rdata_d_miss <= rdata_dirty;
    //rdata_data_miss <= rdata_data;
    end
  end

/* ============================TAG SRAM============================ */
  // IDLE->LOOKUP时读取
  // REFILL->IDLE时写入
  // 共例化2块
  localparam TagVSRAM_DATA_WIDTH = 22;
  localparam TagVSRAM_NUM_WORDS = 128;

  wire  [1:0] req_tagv;
  wire  [1:0] we_tagv;
  wire  [6:0] addr_tagv [0:1];
  wire [21:0] wdata_tagv [0:1];
  wire [21:0] be_tagv [0:1];

  assign req_tagv[0] = {IDLE_LOOKUP} & 1
                     | {REFILL_IDLE & (~uncached_req)} & (replace_way_miss == 0);
  assign req_tagv[1] = {IDLE_LOOKUP} & 1
                     | {REFILL_IDLE & (~uncached_req)} & (replace_way_miss == 1);
  
  assign we_tagv[0] = {REFILL_IDLE} & (replace_way_miss == 0);
  assign we_tagv[1] = {REFILL_IDLE} & (replace_way_miss == 1);

  assign addr_tagv[0] = {7{IDLE_LOOKUP}} & index
                      | {7{REFILL_IDLE}} & index_miss;
  assign addr_tagv[1] = {7{IDLE_LOOKUP}} & index
                      | {7{REFILL_IDLE}} & index_miss;

  assign wdata_tagv[0] = {22{REFILL_IDLE}} & {1'b1, tag_miss};
  assign wdata_tagv[1] = {22{REFILL_IDLE}} & {1'b1, tag_miss};

  assign be_tagv[0] = {22{1'b1}};
  assign be_tagv[1] = {22{1'b1}};

  generate
    for (i = 0; i < 2; i = i + 1) begin : TagVSRAM
      ysyx_040163_sram #(
        .DATA_WIDTH (TagVSRAM_DATA_WIDTH),
        .NUM_WORDS  (TagVSRAM_NUM_WORDS)
      ) TagVSRAM(
        .clk   (clk),
        .rst   (rst),
        .req   (req_tagv[i]),
        .we    (we_tagv[i]),
        .addr  (addr_tagv[i]),
        .wdata (wdata_tagv[i]),
        .be    (be_tagv[i]),
        .rdata ({rdata_v[i], rdata_tag[i]})
      );
    end 
  endgenerate

/* =============================D SRAM============================= */
  // IDLE->LOOKUP时读取
  // LOOKUP->WRITE时写入1
  // REFILL->IDLE时写入(op_miss ? 1 : 0)
  // 共例化2块
  localparam DSRAM_DATA_WIDTH = 1;
  localparam DSRAM_NUM_WORDS = 128;

  //assign dirty = rdata_dirty[word_offset_req];
  assign dirty = rdata_dirty[replace_way];

  wire [1:0] req_dirty;
  wire [1:0] we_dirty;
  wire [6:0] addr_dirty [0:1];
  wire [1:0] wdata_dirty;
  wire [1:0] be_dirty;

  assign req_dirty[0] = {IDLE_LOOKUP} & 1
                      | {LOOKUP_WRITE} & way_hit[0]
                      | {REFILL_IDLE & (~uncached_req)} & (replace_way_miss == 0);
  assign req_dirty[1] = {IDLE_LOOKUP} & 1
                      | {LOOKUP_WRITE} & way_hit[1]
                      | {REFILL_IDLE & (~uncached_req)} & (replace_way_miss == 1);

  assign we_dirty[0] = {LOOKUP_WRITE} & way_hit[0]
                     | {REFILL_IDLE} & (replace_way_miss == 0);
  assign we_dirty[1] = {LOOKUP_WRITE} & way_hit[1]
                     | {REFILL_IDLE} & (replace_way_miss == 1);

  assign addr_dirty[0] = {7{IDLE_LOOKUP}} & index
                       | {7{LOOKUP_WRITE}} & index_req
                       | {7{REFILL_IDLE}} & index_miss;
  assign addr_dirty[1] = {7{IDLE_LOOKUP}} & index
                       | {7{LOOKUP_WRITE}} & index_req
                       | {7{REFILL_IDLE}} & index_miss;

  assign wdata_dirty[0] = {LOOKUP_WRITE} & 1
                        | {REFILL_IDLE} & (op_miss == 1);
  assign wdata_dirty[1] = {LOOKUP_WRITE} & 1
                        | {REFILL_IDLE} & (op_miss == 1);

  assign be_dirty[0] = 1;
  assign be_dirty[1] = 1;

  generate
    for (i = 0; i < 2; i = i + 1) begin : DSRAM
      ysyx_040163_sram #(
        .DATA_WIDTH (DSRAM_DATA_WIDTH),
        .NUM_WORDS  (DSRAM_NUM_WORDS)
      ) DSRAM(
        .clk   (clk),
        .rst   (rst),
        .req   (req_dirty[i]),
        .we    (we_dirty[i]),
        .addr  (addr_dirty[i]),
        .wdata (wdata_dirty[i]),
        .be    (be_dirty[i]),
        .rdata (rdata_dirty[i])
      );
    end
  endgenerate

/* ===========================DATA SRAM============================ */
  // IDLE->LOOKUP时读取
  // REFILL->IDLE时写入
  // LOOKUP->WRITE时写入
  // 共例化2块

  wire [1:0] req_data;
  wire [1:0] we_data;
  wire [6:0] addr_data [0:1];
  wire [127:0] wdata_data [0:1];
  wire [127:0] be_data [0:1];

  assign req_data[0] = {1{IDLE_LOOKUP}} & 1
                     | {1{REFILL_IDLE & (~uncached_req)}} & (replace_way_miss == 0)
                     | {1{LOOKUP_WRITE}} & (way_hit[0]);
  assign req_data[1] = {1{IDLE_LOOKUP}} & 1
                     | {1{REFILL_IDLE & (~uncached_req)}} & (replace_way_miss == 1)
                     | {1{LOOKUP_WRITE}} & (way_hit[1]);
  
  assign we_data[0] = {1{LOOKUP_WRITE}} & way_hit[0]
                    | {1{REFILL_IDLE}} & (replace_way_miss == 0);
  assign we_data[1] = {1{LOOKUP_WRITE}} & way_hit[1]
                    | {1{REFILL_IDLE}} & (replace_way_miss == 1);
  
  assign addr_data[0] = {7{IDLE_LOOKUP}} & index
                      | {7{LOOKUP_WRITE}} & index_req
                      | {7{REFILL_IDLE}} & index_miss;
  assign addr_data[1] = {7{IDLE_LOOKUP}} & index
                      | {7{LOOKUP_WRITE}} & index_req
                      | {7{REFILL_IDLE}} & index_miss;
  
  assign wdata_data[0] = {128{LOOKUP_WRITE}} & (word_offset_req ? {wdata_req, 64'b0} : {64'b0, wdata_req})
                       | {128{REFILL_IDLE}} & refill_data;
  assign wdata_data[1] = {128{LOOKUP_WRITE}} & (word_offset_req ? {wdata_req, 64'b0} : {64'b0, wdata_req})
                       | {128{REFILL_IDLE}} & refill_data;

  assign be_data[0] = {128{LOOKUP_WRITE}} & data_wstrb_write
                    | {128{REFILL_IDLE}} & {128{1'b1}};
  assign be_data[1] = {128{LOOKUP_WRITE}} & data_wstrb_write
                    | {128{REFILL_IDLE}} & {128{1'b1}};

  /* 字节掩码扩展到位掩码，注意生成高低位 */
  assign data_wstrb_miss = (op_miss == 1) ? {{8{wstrb_miss[7]}}, {8{wstrb_miss[6]}}, {8{wstrb_miss[5]}}, {8{wstrb_miss[4]}}, {8{wstrb_miss[3]}}, {8{wstrb_miss[2]}}, {8{wstrb_miss[1]}}, {8{wstrb_miss[0]}}}
                         : {64{1'b1}};
  assign data_wstrb_write = word_offset_req ? {{8{wstrb_req[7]}}, {8{wstrb_req[6]}}, {8{wstrb_req[5]}}, {8{wstrb_req[4]}}, {8{wstrb_req[3]}}, {8{wstrb_req[2]}}, {8{wstrb_req[1]}}, {8{wstrb_req[0]}}, 64'b0} : {64'b0, {8{wstrb_req[7]}}, {8{wstrb_req[6]}}, {8{wstrb_req[5]}}, {8{wstrb_req[4]}}, {8{wstrb_req[3]}}, {8{wstrb_req[2]}}, {8{wstrb_req[1]}}, {8{wstrb_req[0]}}};

  /* sram 0-1 */
  /*ysyx_040163_data_array_way DataSRAM_0(
    .clk  (clk),
    .Q    (rdata_data[0]), // 读数据
    .CEN  (~req_data[0]), // 使能信号，低电平有效
    .WEN  (~we_data[0]), // 写使能信号，低电平有效
    .BWEN (~be_data[0]), // 写掩码信号，粒度为1bit，低电平有效
    .A    (addr_data[0]), // 读写地址
    .D    (wdata_data[0])  // 写数据
  );*/

  reg select_0;
  always @(posedge clk) begin
    if (rst) begin
      select_0 <= 0;
    end
    else begin
      select_0 <= addr_data[0][6];
    end
  end
  assign rdata_data[0] = (~ select_0) ? io_sram0_rdata : io_sram1_rdata;

  assign io_sram0_addr = addr_data[0][5:0];
  assign io_sram0_cen = ((~req_data[0]) || addr_data[0][6]);
  assign io_sram0_wen = ~we_data[0];
  assign io_sram0_wmask = ~be_data[0];
  assign io_sram0_wdata = wdata_data[0];

  assign io_sram1_addr = addr_data[0][5:0];
  assign io_sram1_cen = ((~req_data[0]) || (~addr_data[0][6]));
  assign io_sram1_wen = ~we_data[0];
  assign io_sram1_wmask = ~be_data[0];
  assign io_sram1_wdata = wdata_data[0];


  /* sram 2-3 */
  /*ysyx_040163_data_array_way DataSRAM_1(
    .clk  (clk),
    .Q    (rdata_data[1]), // 读数据
    .CEN  (~req_data[1]), // 使能信号，低电平有效
    .WEN  (~we_data[1]), // 写使能信号，低电平有效
    .BWEN (~be_data[1]), // 写掩码信号，粒度为1bit，低电平有效
    .A    (addr_data[1]), // 读写地址
    .D    (wdata_data[1])  // 写数据
  );*/

  reg select_1;
  always @(posedge clk) begin
    if (rst) begin
      select_1 <= 0;
    end
    else begin
      select_1 <= addr_data[1][6];
    end
  end
  assign rdata_data[1] = (~ select_1) ? io_sram2_rdata : io_sram3_rdata;

  assign io_sram2_addr = addr_data[1][5:0];
  assign io_sram2_cen = ((~req_data[1]) || (addr_data[1][6]));
  assign io_sram2_wen = ~we_data[1];
  assign io_sram2_wmask = ~be_data[1];
  assign io_sram2_wdata = wdata_data[1];

  assign io_sram3_addr = addr_data[1][5:0];
  assign io_sram3_cen = ((~req_data[1]) || (~addr_data[1][6]));
  assign io_sram3_wen = ~we_data[1];
  assign io_sram3_wmask = ~be_data[1];
  assign io_sram3_wdata = wdata_data[1];

/* ===========================CACHE-AXI============================ */
  // Cache访存接口
	//output         rw_valid_o,  // 请求有效
	//input          rw_ready_i,  // 访存完成
  //output         rw_wen_o,    // 访存类型 0是读 1是写
  //input  [127:0] rw_r_data_i, // 读数据
  //output [127:0] rw_w_data_o, // 写数据
  //output  [31:0] rw_addr_o,   // 读/写地址
  //output  [15:0] rw_wstrb_o,  // 写字节掩码
  //output   [1:0] rw_burst_o   // 突发长度 00是1，01是2，目前只可能是这两个值

  //wire         rw_valid_o;  // 请求有效
	//wire         rw_ready_i;  // 访存完成
  //wire         rw_wen_o;    // 访存类型 0是读 1是写
  //wire [127:0] rw_r_data_i; // 读数据
  //wire [127:0] rw_w_data_o; // 写数据
  //wire  [31:0] rw_addr_o;   // 读/写地址
  //wire  [15:0] rw_wstrb_o;  // 写字节掩码
  //wire         rw_burst_o;  // 突发长度 00是1，01是2，目前只可能是这两个值

  assign rw_valid_o = rw_valid;
  assign rw_wen_o = rw_wen;
  assign rw_addr_o = rw_addr;
  assign rw_w_data_o = rw_w_data;
  assign rw_wstrb_o = uncached_req ? (device_req ? {12'b0, wstrb_req[3:0]} : (word_offset_req ? {wstrb_req, 8'b0} : {8'b0, wstrb_req})) : {16{1'b1}};
  assign rw_burst_o = {1'b0, ~device_req}; // 是device就0，不是device就1
  assign rw_size_o = device_req ? 3'd2 : 3'd3;

  assign refill_data = op_miss ? refill_data_store : refill_data_load;
  assign refill_data_store = word_offset_miss ? {rw_r_data_i[127:64] & (~data_wstrb_miss[63:0]) | (wdata_miss & data_wstrb_miss[63:0]), rw_r_data_i[63:0]} :
                                                {rw_r_data_i[127:64], rw_r_data_i[63:0] & (~data_wstrb_miss[63:0]) | (wdata_miss & data_wstrb_miss[63:0])};
  assign refill_data_load = rw_r_data_i;

/*
  icache_test icachetest0(
    .clk(clk),
    .rw_valid(rw_valid_o),
    .rw_ready(rw_ready_i),
    .rw_wen(rw_wen_o),
    .rw_r_data(rw_r_data_i),
    .rw_w_data(rw_w_data_o),
    .rw_addr(rw_addr_o),
    .rw_wstrb(rw_wstrb_o)
  );
*/

endmodule
module ysyx_040163_ID_EX (
  input  wire clk,
  input  wire rst,

  input  wire  [3:0] ram_store_id,
  input  wire  [3:0] ram_load_id,
  input  wire  [4:0] alu_opcode_id,
  input  wire  [1:0] alu_out_type_id,
  input  wire        reg_wen_id,
  input  wire  [4:0] reg_waddr_id,
  input  wire  [1:0] reg_ren_id,
  input  wire  [4:0] reg_raddr_1_id,
  input  wire  [4:0] reg_raddr_2_id,
  input  wire        imm_shamt_id,
  input  wire        rs1_word_id,
  input  wire        rs2_word_id,
  input  wire        rs_signed_id,
  input  wire  [1:0] rs2_shamt_id,
  input  wire [63:0] imm_id,
  input  wire  [3:0] jmp_type_id,
  input  wire [63:0] jmp_offset_id,
  input  wire [63:0] reg_rdata_1_id,
  input  wire [63:0] reg_rdata_2_id,
  input  wire        csr_wen_id,
  input  wire  [3:0] csr_inst_type_id,
  input wire dcache_invalidate_id,
  input wire got_interrupt_id,

  output reg  [3:0] ram_store_ex,
  output reg  [3:0] ram_load_ex,
  output reg  [4:0] alu_opcode_ex,
  output reg  [1:0] alu_out_type_ex,
  output reg        reg_wen_ex,
  output reg  [4:0] reg_waddr_ex,
  output reg  [1:0] reg_ren_ex,
  output reg  [4:0] reg_raddr_1_ex,
  output reg  [4:0] reg_raddr_2_ex,
  output reg        imm_shamt_ex,
  output reg        rs1_word_ex,
  output reg        rs2_word_ex,
  output reg        rs_signed_ex,
  output reg  [1:0] rs2_shamt_ex,
  output reg [63:0] imm_ex,
  output reg  [3:0] jmp_type_ex,
  output reg [63:0] jmp_offset_ex,
  output reg [63:0] reg_rdata_1_ex,
  output reg [63:0] reg_rdata_2_ex,
  output reg        csr_wen_ex,
  output reg  [3:0] csr_inst_type_ex,
  output reg dcache_invalidate_ex,
  output reg got_interrupt_ex,

  /* valid */
  input  wire        valid_id,
  output reg        valid_ex,
  
  /* ready */

  /* pc */
  input  wire [63:0] pc_id,
  output reg [63:0] pc_ex,

  /* control */
  input  wire id_ex_stall,
  input  wire id_ex_flush,
  input  wire ex_mem_stall
);

  wire valid_id_ex;
  //assign valid_id_ex = (id_ex_flush | id_ex_stall) ? 0 : valid_id;
  assign valid_id_ex = (id_ex_flush) ? 0 : valid_id;

  wire [3:0] ram_load_id_ex;
  wire [3:0] ram_store_id_ex;
  wire       reg_wen_id_ex;
  wire [3:0] jmp_type_id_ex;
  wire       csr_wen_id_ex;
  wire [3:0] csr_inst_type_id_ex;
  wire dcache_invalidate_id_ex;
  wire got_interrupt_id_ex;
  assign ram_load_id_ex = id_ex_flush ? 0 : ram_load_id;
  assign ram_store_id_ex = id_ex_flush ? 0 : ram_store_id;
  assign reg_wen_id_ex = id_ex_flush ? 0 : reg_wen_id;
  assign jmp_type_id_ex = id_ex_flush ? 0 : jmp_type_id;
  assign csr_wen_id_ex = id_ex_flush ? 0 : csr_wen_id;
  assign csr_inst_type_id_ex = id_ex_flush ? 0 : csr_inst_type_id;
  assign dcache_invalidate_id_ex = id_ex_flush ? 0 : dcache_invalidate_id;
  assign got_interrupt_id_ex = id_ex_flush ? 0 : got_interrupt_id;

  always @(posedge clk) begin
    if (rst) begin
      ram_store_ex <= 0;
      ram_load_ex <= 0;
      alu_opcode_ex <= 0;
      alu_out_type_ex <= 0;
      reg_wen_ex <= 0;
      reg_waddr_ex <= 0;
      reg_ren_ex <= 0;
      reg_raddr_1_ex <= 0;
      reg_raddr_2_ex <= 0;
      imm_shamt_ex <= 0;
      rs1_word_ex <= 0;
      rs2_word_ex <= 0;
      rs_signed_ex <= 0;
      rs2_shamt_ex <= 0;
      imm_ex <= 0;
      jmp_type_ex <= 0;
      jmp_offset_ex <= 0;
      reg_rdata_1_ex <= 0;
      reg_rdata_2_ex <= 0;
      valid_ex <= 0;
      pc_ex <= 0;
      csr_wen_ex <= 0;
      csr_inst_type_ex <= 0;
      dcache_invalidate_ex <= 0;
      got_interrupt_ex <= 0;
    end
    else if (id_ex_stall && (~ex_mem_stall)) begin
      ram_store_ex <= 0;
      ram_load_ex <= 0;
      alu_opcode_ex <= 0;
      alu_out_type_ex <= 0;
      reg_wen_ex <= 0;
      reg_waddr_ex <= 0;
      reg_ren_ex <= 0;
      reg_raddr_1_ex <= 0;
      reg_raddr_2_ex <= 0;
      imm_shamt_ex <= 0;
      rs1_word_ex <= 0;
      rs2_word_ex <= 0;
      rs_signed_ex <= 0;
      rs2_shamt_ex <= 0;
      imm_ex <= 0;
      jmp_type_ex <= 0;
      jmp_offset_ex <= 0;
      reg_rdata_1_ex <= 0;
      reg_rdata_2_ex <= 0;
      valid_ex <= 0;
      pc_ex <= 0;
      csr_wen_ex <= 0;
      csr_inst_type_ex <= 0;
      dcache_invalidate_ex <= 0;
      got_interrupt_ex <= 0;
    end
    else if (~id_ex_stall) begin
      ram_store_ex <= ram_store_id_ex;
      ram_load_ex <= ram_load_id_ex;
      alu_opcode_ex <= alu_opcode_id;
      alu_out_type_ex <= alu_out_type_id;
      reg_wen_ex <= reg_wen_id_ex;
      reg_waddr_ex <= reg_waddr_id;
      reg_ren_ex <= reg_ren_id;
      reg_raddr_1_ex <= reg_raddr_1_id;
      reg_raddr_2_ex <= reg_raddr_2_id;
      imm_shamt_ex <= imm_shamt_id;
      rs1_word_ex <= rs1_word_id;
      rs2_word_ex <= rs2_word_id;
      rs_signed_ex <= rs_signed_id;
      rs2_shamt_ex <= rs2_shamt_id;
      imm_ex <= imm_id;
      jmp_type_ex <= jmp_type_id_ex;
      jmp_offset_ex <= jmp_offset_id;
      reg_rdata_1_ex <= reg_rdata_1_id;
      reg_rdata_2_ex <= reg_rdata_2_id;
      valid_ex <= valid_id_ex;
      pc_ex <= pc_id;
      csr_wen_ex <= csr_wen_id_ex;
      csr_inst_type_ex <= csr_inst_type_id_ex;
      dcache_invalidate_ex <= dcache_invalidate_id_ex;
      got_interrupt_ex <= got_interrupt_id_ex;
    end
  end

endmodule
module ysyx_040163_IF_ID (
  input  wire        clk,
  input  wire        rst,
  input  wire [31:0] inst_if,
  output reg [31:0] inst_id,

  /* valid */
  input  wire        valid_if,
  output reg        valid_id,

  /* ready */

  /* pc */
  input  wire [63:0] pc_if,
  output reg [63:0] pc_id,

  /* control */
  input  wire if_id_stall,
  input  wire if_id_flush,
  input  wire id_ex_stall
);

  wire [31:0] inst_if_id;
  wire [63:0] pc_if_id;
  assign inst_if_id = if_id_flush ? 0 : inst_if;
  assign pc_if_id = if_id_flush ? 0 : pc_if;

  wire valid_if_id;
  //assign valid_if_id = (if_id_flush | if_stall | if_id_stall) ? 0 : valid_if;
  //assign valid_if_id = (if_id_flush | if_id_stall) ? 0 : valid_if;
  assign valid_if_id = (if_id_flush) ? 0 : valid_if;

  always @(posedge clk) begin
    if (rst) begin
      inst_id <= 0;
      pc_id <= 0;
      valid_id <= 0;
    end
    else if (if_id_stall && (~id_ex_stall)) begin
      inst_id <= 0;
      pc_id <= 0;
      valid_id <= 0;
    end
    else if (~if_id_stall) begin
      inst_id <= inst_if_id;
      pc_id <= pc_if_id;
      valid_id <= valid_if_id;
    end
    //else begin
    //  inst_id <= inst_id;
    //  pc_id <= pc_id;
    //  valid_id <= valid_if_id; // 这一行是特殊处理
    //end

  end

endmodule
module ysyx_040163_MEM_WB (
  input  wire        clk,
  input  wire        rst,

  input  wire  [3:0] ram_load_mem,
  input  wire [63:0] alu_out_mem,
  input  wire [63:0] ram_rdata_mem,
  input  wire        reg_wen_mem,
  input  wire  [4:0] reg_waddr_mem,
  input  wire [63:0] reg_rdata_1_mem,
  input  wire  [4:0] reg_raddr_1_mem,
  input  wire        csr_wen_mem,
  input  wire  [3:0] csr_inst_type_mem,
  input  wire [11:0] imm_mem,
  input wire got_interrupt_mem,

  output reg  [3:0] ram_load_wb,
  output reg [63:0] alu_out_wb,
  output reg [63:0] ram_rdata_wb,
  output reg        reg_wen_wb,
  output reg  [4:0] reg_waddr_wb,
  output reg [63:0] reg_rdata_1_wb,
  output reg  [4:0] reg_raddr_1_wb,
  output reg        csr_wen_wb,
  output reg  [3:0] csr_inst_type_wb,
  output reg [11:0] imm_wb,
  output reg got_interrupt_wb,

  /* valid */
  input  wire        valid_mem,
  output reg        valid_wb,

  /* ready */

  /* pc */
  input  wire [63:0] pc_mem,
  output reg [63:0] pc_wb,

  /* control */
  input  wire mem_wb_stall,
  input  wire mem_wb_flush
);

  wire valid_mem_wb;
  wire [4:0] reg_raddr_1_mem_wb;
  wire       csr_wen_mem_wb;
  wire [3:0] csr_inst_type_mem_wb;
  wire reg_wen_mem_wb;
  wire got_interrupt_mem_wb;
  assign valid_mem_wb = (mem_wb_flush) ? 0 : valid_mem;
  assign reg_raddr_1_mem_wb = mem_wb_flush ? 0 : reg_raddr_1_mem;
  assign csr_wen_mem_wb = mem_wb_flush ? 0 : csr_wen_mem;
  assign csr_inst_type_mem_wb = mem_wb_flush ? 0 : csr_inst_type_mem;
  assign reg_wen_mem_wb = mem_wb_flush ? 0 : reg_wen_mem;
  assign got_interrupt_mem_wb = mem_wb_flush ? 0 : got_interrupt_mem;

  always @(posedge clk) begin
    if (rst) begin
      ram_load_wb <= 0;
      alu_out_wb <= 0;
      ram_rdata_wb <= 0;
      reg_wen_wb <= 0;
      reg_waddr_wb <= 0;
      valid_wb <= 0;
      pc_wb <= 0;
      reg_rdata_1_wb <= 0;
      reg_raddr_1_wb <= 0;
      csr_wen_wb <= 0;
      csr_inst_type_wb <= 0;
      imm_wb <= 0;
      got_interrupt_wb <= 0;
    end
    else if (~mem_wb_stall) begin
      ram_load_wb <= ram_load_mem;
      alu_out_wb <= alu_out_mem;
      ram_rdata_wb <= ram_rdata_mem;
      reg_wen_wb <= reg_wen_mem_wb;
      reg_waddr_wb <= reg_waddr_mem;
      valid_wb <= valid_mem_wb;
      pc_wb <= pc_mem;
      reg_rdata_1_wb <= reg_rdata_1_mem;
      reg_raddr_1_wb <= reg_raddr_1_mem_wb;
      csr_wen_wb <= csr_wen_mem_wb;
      csr_inst_type_wb <= csr_inst_type_mem_wb;
      imm_wb <= imm_mem;
      got_interrupt_wb <= got_interrupt_mem_wb;
    end
  end
endmodule
module ysyx_040163_multiplier_easy (
  input clk,
  input rst,
  input mult_valid, // 乘法器是否合法输入
  input [4:0] mult_type, // 乘法类型
  input [63:0] multiplicand_i, // 被乘数
  input [63:0] multiplier_i, // 乘数
  output [63:0] mult_out,
  output mult_ready /* 计算ok */
);

  //mul    : x[rd] = (x[rs1] × x[rs2])[63:0]
  //mulh   : x[rd] = (x[rs1]𝑠 × x[rs2]𝑠)[127:64]
  //mulhu  : x[rd] = (x[rs1]𝑢 × x[rs2]𝑢)[127:64]
  //mulhsu : x[rd] = (x[rs1]𝑠 × x[rs2]𝑢)[127:64]
  //mulw   : x[rd] = sext((x[rs1] × x[rs2])[31: 0])
  parameter MUL    = 5'b01110; // 乘
  parameter MULH   = 5'b10011; // 高位乘
  parameter MULHSU = 5'b10100; // 高位有符号-无符号乘
  parameter MULHU  = 5'b10101; // 高位无符号乘
  parameter MULW   = 5'b10110; // 乘字

  // 状态机定义
  parameter IDLE   = 2'b00;
  parameter MULTI  = 2'b01;
  parameter FINISH = 2'b10;

//------------------------------------------------------------------------
// Pre-Processing
//------------------------------------------------------------------------
  reg [1:0] state, state_d;

  reg [63:0] mult_out_d, mult_out_s;
  assign mult_out = mult_out_d;

  /* 被乘数 */
  wire [129:0] multiplicand_s;
  reg [129:0] multiplicand_d;
  reg [129:0] multiplicand;

  /* 乘数 */
  wire [64:0] multiplier_s;
  reg [66:0] multiplier_d;
  reg [66:0] multiplier;

  /* 结果 */
  reg [129:0] result_d;
  reg [129:0] result;

  /* 根据指令类型生成乘数与被乘数并添加符号位 */
  assign multiplicand_s[129:64] = ((mult_type == MULHU) | (mult_type == MULW)) ? 66'b0 : {66{multiplicand_i[63]}};
  assign multiplicand_s[63:32] = (mult_type == MULW) ? 32'b0 : multiplicand_i[63:32];
  assign multiplicand_s[31:0] = multiplicand_i[31:0];

  assign multiplier_s[64] = ((mult_type == MULW) | (mult_type == MULHSU) | (mult_type == MULHU)) ? 1'b0 : multiplier_i[63];
  assign multiplier_s[63:32] = (mult_type == MULW) ? 32'b0 : multiplier_i[63:32];
  assign multiplier_s[31:0] = multiplier_i[31:0];

  /* 对multiplier做进一步扩展，最低位添0，最高位为了满足radix-4 booth则扩展符号位 */
  wire [66:0] multiplier_ext;
  assign multiplier_ext = {multiplier_s[64], multiplier_s[64:0], 1'b0};

  assign mult_ready = (state == IDLE && state_d == IDLE) | (state == FINISH);

//------------------------------------------------------------------------
// Multiplier
//------------------------------------------------------------------------
  wire [129:0] multiplicand_shifted = multiplicand << 2;
  wire [66:0] multiplier_shifted = multiplier >> 2;

  wire [130:0] partial_product;
  wire [1:0] addone;

  ysyx_040163_booth_code #(130) x_booth_code(
    .multiplicand(multiplicand),
    .code(multiplier[2:0]),
    .out(partial_product),
    .c(addone)
  );

  always @(*) begin
    result_d = result;
    state_d = state;
    mult_out_d = mult_out_s;
    multiplier_d = multiplier;
    multiplicand_d = multiplicand;
    case(state)
      IDLE: begin
        if (mult_valid) begin
          state_d = MULTI;
          multiplicand_d = multiplicand_s;
          multiplier_d = multiplier_ext;
          result_d = 0;
        end
        else begin
          state_d = IDLE;
        end
      end

      MULTI: begin
        if (~|multiplier) begin
          state_d = FINISH;
          result_d = result;
        end
        else begin
          state_d = MULTI;
          result_d = result + partial_product[129:0] + {128'b0, addone};
          multiplicand_d = multiplicand_shifted;
          multiplier_d = multiplier_shifted;
        end
      end

      FINISH: begin
        state_d = IDLE;
        case(mult_type)
          5'b01110: mult_out_d = result[63:0];
          5'b10011,
          5'b10100,
          5'b10101: mult_out_d = result[127:64];
          5'b10110: mult_out_d = {{32{result[31]}}, result[31:0]};
          default: mult_out_d = 64'b0;
        endcase
      end

      default: begin
        ;
      end
    endcase
  end

  always @(posedge clk) begin
    if (rst) begin
      state <= IDLE;
      result <= 0;
      multiplicand <= 0;
      multiplier <= 0;
      mult_out_s <= 0;
    end
    else begin
      state <= state_d;
      result <= result_d;
      multiplicand <= multiplicand_d;
      multiplier <= multiplier_d;
      mult_out_s <= mult_out_d;
    end
  end

endmodule
/* mux模板 */
module ysyx_040163_mux #(NR_KEY = 2, KEY_LEN = 1, DATA_LEN = 1) (
  output [DATA_LEN-1:0] out,
  input [KEY_LEN-1:0] key,
  input [DATA_LEN-1:0] default_out,
  input [NR_KEY*(KEY_LEN + DATA_LEN)-1:0] lut
);
  ysyx_040163_MuxKeyInternal #(NR_KEY, KEY_LEN, DATA_LEN) i0 (out, key, default_out, lut);
endmodule
module ysyx_040163_MuxKeyInternal #(NR_KEY = 2, KEY_LEN = 1, DATA_LEN = 1) (
  output reg [DATA_LEN-1:0] out,
  input [KEY_LEN-1:0] key,
  input [DATA_LEN-1:0] default_out,
  input [NR_KEY*(KEY_LEN + DATA_LEN)-1:0] lut
);

  localparam PAIR_LEN = KEY_LEN + DATA_LEN;
  wire [PAIR_LEN-1:0] pair_list [NR_KEY-1:0];
  wire [KEY_LEN-1:0] key_list [NR_KEY-1:0];
  wire [DATA_LEN-1:0] data_list [NR_KEY-1:0];

  generate
    for (genvar n = 0; n < NR_KEY; n = n + 1) begin
      assign pair_list[n] = lut[PAIR_LEN*(n+1)-1 : PAIR_LEN*n];
      assign data_list[n] = pair_list[n][DATA_LEN-1:0];
      assign key_list[n]  = pair_list[n][PAIR_LEN-1:DATA_LEN];
    end
  endgenerate

  reg [DATA_LEN-1 : 0] lut_out;
  reg hit;
  integer i;
  always @(*) begin
    lut_out = 0;
    hit = 0;
    for (i = 0; i < NR_KEY; i = i + 1) begin
      lut_out = lut_out | ({DATA_LEN{key == key_list[i]}} & data_list[i]);
      hit = hit | (key == key_list[i]);
    end
    out = (hit ? lut_out : default_out);
  end
endmodule
module ysyx_040163_pc (
  input  wire        clk,
  input  wire        rst,
  input  wire        pc_stall,
  input  wire [63:0] reg_rdata_1,
  input  wire [63:0] reg_rdata_2,
  input  wire  [3:0] jmp_type,
  input  wire [63:0] jmp_offset,
  input  wire [63:0] pc_ex,

  input  wire        csr_jmp_req,
  input  wire [63:0] csr_jmp_addr,

  output wire [63:0] pc,
//output wire [63:0] pc_d,
  output wire        jmp_flag_ex
);

//parameter DEFAULT = 4'b0000; // 0x80000000
  parameter JAL  = 4'b0001;
  parameter JALR = 4'b0010;
  parameter BEQ  = 4'b0011;
  parameter BNE  = 4'b0100;
  parameter BLT  = 4'b0101;
  parameter BGE  = 4'b0110;
  parameter BLTU = 4'b0111;
  parameter BGEU = 4'b1000;


  /* 内存起址为0x80000000 */
  reg [63:0] reg_pc, pc_target;
  wire [63:0] reg_pc_d;

  /* 计算跳转指令部分，最终结果为pc_target */
  wire [63:0] pc_alu, pc_inc, pc_jalr, pc_ex_inc;
  assign pc_inc = reg_pc + 4;
  assign pc_alu = pc_ex + jmp_offset;
  assign pc_ex_inc = pc_ex + 4;
  assign pc_jalr = (jmp_offset + reg_rdata_1) & ~1;
  always @(*) begin
    case (jmp_type) 
      JAL : pc_target = pc_alu;
      JALR: pc_target = pc_jalr;
      BEQ : pc_target = (reg_rdata_1 == reg_rdata_2) ? pc_alu : pc_ex_inc;
      BNE : pc_target = (reg_rdata_1 != reg_rdata_2) ? pc_alu : pc_ex_inc;
      BLT : pc_target = ($signed(reg_rdata_1) < $signed(reg_rdata_2))  ? pc_alu : pc_ex_inc;
      BGE : pc_target = ($signed(reg_rdata_1) >= $signed(reg_rdata_2))  ? pc_alu : pc_ex_inc;
      BLTU: pc_target = (reg_rdata_1 < reg_rdata_2) ? pc_alu : pc_ex_inc;
      BGEU: pc_target = (reg_rdata_1 >= reg_rdata_2) ? pc_alu : pc_ex_inc;
      default: pc_target = 64'h30000000;
    endcase
  end

  /* DONE:这边需要加个csr跳转的判断，且csr的跳转优先级高于所有的跳转指令 */
  assign reg_pc_d = csr_jmp_req ? csr_jmp_addr : (jmp_flag_ex ? pc_target : pc_inc);

  assign jmp_flag_ex = ((jmp_type != 4'b0) & (pc_target != (pc_ex + 64'h4)));

  /* pc寄存器值mux */
  always @(posedge clk) begin
    if (rst) begin
      reg_pc <= 64'h30000000;
    end
    else if (~pc_stall | csr_jmp_req) begin
      reg_pc <= reg_pc_d;
    end
  end

  /* 最终的pc输出 */
  assign pc = reg_pc;
//assign pc_d = reg_pc_d;
  
endmodule
module ysyx_040163_ram (
  input clk,
  input rst,

  input   [3:0] ram_store,
  input   [3:0] ram_load,
  input  [63:0] ram_raddr,
  input  [63:0] ram_waddr,
  input  [63:0] ram_wdata,
  input valid_mem,
  input csr_jmp_req,
//input mem_wb_stall,
  input [63:0] pc_mem,
  input dcache_invalidate,

  output [63:0] ram_rdata,
  output        data_ok,
  output        addr_ok,
  output        timer_irq,
  output        software_irq,

  output         rw_valid_o,  // 请求有效
	input          rw_ready_i,  // 访存完成
  output         rw_wen_o,    // 访存类型 0是读 1是写
  input  [127:0] rw_r_data_i, // 读数据
  output [127:0] rw_w_data_o, // 写数据
  output  [31:0] rw_addr_o,   // 读/写地址
  output  [15:0] rw_wstrb_o,  // 写字节掩码
  output   [1:0] rw_burst_o,  // 突发长度 00是1，01是2，目前只可能是这两个值
  output   [2:0] rw_size_o,

  output   [5:0] io_sram4_addr,
  output         io_sram4_cen,
  output         io_sram4_wen,
  output [127:0] io_sram4_wmask,
  output [127:0] io_sram4_wdata,
  input  [127:0] io_sram4_rdata,
  output   [5:0] io_sram5_addr,
  output         io_sram5_cen,
  output         io_sram5_wen,
  output [127:0] io_sram5_wmask,
  output [127:0] io_sram5_wdata,
  input  [127:0] io_sram5_rdata,
  output   [5:0] io_sram6_addr,
  output         io_sram6_cen,
  output         io_sram6_wen,
  output [127:0] io_sram6_wmask,
  output [127:0] io_sram6_wdata,
  input  [127:0] io_sram6_rdata,
  output   [5:0] io_sram7_addr,
  output         io_sram7_cen,
  output         io_sram7_wen,
  output [127:0] io_sram7_wmask,
  output [127:0] io_sram7_wdata,
  input  [127:0] io_sram7_rdata
);

//------------------------------------------------------------------------
// pc_mem
//------------------------------------------------------------------------
  reg [63:0] pc_mem_r;
  always @(posedge clk) begin
    if (rst) begin
      pc_mem_r <= 0;
    end
    else begin
      pc_mem_r <= pc_mem;
    end
  end
  wire pc_mem_changed;
  assign pc_mem_changed = (pc_mem_r != pc_mem);

//------------------------------------------------------------------------
// Selection
//------------------------------------------------------------------------
  reg dcache_sel_d, clint_sel_d;
  always @(*) begin
    dcache_sel_d = 0;
    clint_sel_d = 0;
    if (valid_mem && ~csr_jmp_req) begin
    //if (valid_mem) begin
      if ((ram_raddr >= 64'h2000000 && ram_raddr <= 64'h200BFFF) || (ram_waddr >= 64'h2000000 && ram_waddr <= 64'h200BFFF)) begin
        clint_sel_d = 1;
      end
      else begin
        dcache_sel_d = 1;
      end
    end
  end

//------------------------------------------------------------------------
// General Logic
//------------------------------------------------------------------------
  /* 该模块中例化了cache与clint，根据地址仲裁选择哪个模块访问 */
  wire dcache_valid, clint_valid;

  wire dcache_addr_ready, dcache_data_ready;

  wire [7:0] wstrb;
  wire [63:0] rdata, wdata;

  wire [63:0] clint_rdata;
  wire [63:0] dcache_rdata;

  wire clint_sel;
  wire dcache_sel;

  assign rdata = {{64{dcache_sel}} & dcache_rdata}
               | {{64{clint_sel}} & clint_rdata}
               | 64'b0;

  // 先根据指令大小赋值，再偏移
  // 栈是对齐的话，其实sd不用偏移，没啥意义了
  ysyx_040163_mux #(4, 4, 8) mux41_ram_wmask(wstrb, ram_store, 8'b0, {
    4'b1000, 8'b00000001 << (ram_waddr[3:0] % 8), // sb
    4'b1001, 8'b00000011 << (ram_waddr[3:0] % 8), // sh
    4'b1010, 8'b00001111 << (ram_waddr[3:0] % 8), // sw
    4'b1011, 8'b11111111 << (ram_waddr[3:0] % 8)  // sd
  }); // wstrb
  ysyx_040163_mux #(4, 4, 64) mux41_rdata(wdata, ram_store, 64'b0, {
    4'b1000, ram_wdata << ((ram_waddr[3:0] * 8) % 64), // sb
    4'b1001, ram_wdata << ((ram_waddr[3:0] * 8) % 64), // sh
    4'b1010, ram_wdata << ((ram_waddr[3:0] * 8) % 64), // sw
    4'b1011, ram_wdata << ((ram_waddr[3:0] * 8) % 64)  // sd
  }); // wdata
  
  wire [63:0] rdata_shifted;
  assign rdata_shifted = {rdata >> ((ram_raddr[3:0] * 8) % 64)};

  // load操作涉及到移位、掩码与符号扩展问题，因此要长一点
  ysyx_040163_mux #(7, 4, 64) mux71_ram_rdata(ram_rdata, ram_load, 64'b0, {
    4'b1000, {{56{rdata_shifted[7]}}, rdata_shifted[7:0]}, // lb
    4'b1001, {{48{rdata_shifted[15]}}, rdata_shifted[15:0]}, // lh
    4'b1010, {{32{rdata_shifted[31]}}, rdata_shifted[31:0]}, // lw
    4'b1011, rdata_shifted, // ld
    4'b1100, {56'b0, rdata_shifted[7:0]}, // lbu
    4'b1101, {48'b0, rdata_shifted[15:0]}, // lhu
    4'b1110, {32'b0, rdata_shifted[31:0]}  // lwu
  }); // ram_rdata

  /* 如果无dcache的话直接默认为1 */
  //assign data_ok = 1;
  //assign addr_ok = 1;

  /* 如果有dcache的话就是下面的，clint肯定能完成读写 */
  //assign data_ok = ((ram_store[3] | ram_load[3]) & dcache_sel) ? dcache_data_ready : 1;
  //assign addr_ok = ((ram_store[3] | ram_load[3]) & dcache_sel) ? dcache_addr_ready : 1;
  assign data_ok = dcache_valid ? 0 : dcache_data_ready;
  assign addr_ok = dcache_valid ? 0 : dcache_addr_ready;

//------------------------------------------------------------------------
// Cache
//------------------------------------------------------------------------
  wire dcache_op;
  assign dcache_op = ram_store[3];

  assign dcache_sel = dcache_sel_d;

  assign dcache_valid = (ram_store[3] | ram_load[3] | dcache_invalidate) & dcache_sel & pc_mem_changed;

  wire [63:0] dcache_addr;
  assign dcache_addr = (ram_store[3]) ? ram_waddr :
                       (ram_load[3]) ? ram_raddr : 0;

  wire [63:0] dcache_wdata;
  assign dcache_wdata = wdata;

  wire [7:0] dcache_wstrb;
  assign dcache_wstrb = wstrb;

/* verilator lint_off LATCH *//*
  always @(*) begin
    if (ram_load[3] && dcache_sel) begin
    pmem_read(dcache_addr, dcache_rdata);
    `ifdef HAS_MEM_DEBUG_V
    $display("ram.v dcache_addr:%h, dcache_rdata:%h", dcache_addr, dcache_rdata);
    `endif
    end
  end

  always @(*) begin
    if (ram_store[3] && dcache_sel) begin
    `ifdef HAS_MEM_DEBUG_V
    $display("ram.v ram_waddr:%h, ram_wdata:%h, ram_wmask:%h", dcache_waddr, dcache_wdata, dcache_wstrb);
    `endif
    pmem_write(dcache_addr, dcache_wdata, dcache_wstrb);
    end
  end*/
/* verilator lint_on LATCH */

  ysyx_040163_dcache dcache0(
    .clk(clk),
    .rst(rst),
    .dcache_op(dcache_op),
    .dcache_valid(dcache_valid),
    .dcache_addr(dcache_addr),
    .dcache_wdata(dcache_wdata),
    .dcache_wstrb(dcache_wstrb),
    .dcache_rdata(dcache_rdata),
    .dcache_data_ok(dcache_data_ready),
    .dcache_addr_ok(dcache_addr_ready),
    .dcache_invalidate(dcache_invalidate),

    .rw_valid_o(rw_valid_o),
    .rw_ready_i(rw_ready_i),
    .rw_wen_o(rw_wen_o),
    .rw_r_data_i(rw_r_data_i),
    .rw_w_data_o(rw_w_data_o),
    .rw_addr_o(rw_addr_o),
    .rw_wstrb_o(rw_wstrb_o),
    .rw_burst_o(rw_burst_o),
    .rw_size_o(rw_size_o),

    /* sram 4-7 */
    .io_sram4_addr(io_sram4_addr),
    .io_sram4_cen(io_sram4_cen),
    .io_sram4_wen(io_sram4_wen),
    .io_sram4_wmask(io_sram4_wmask),
    .io_sram4_wdata(io_sram4_wdata),
    .io_sram4_rdata(io_sram4_rdata),
    .io_sram5_addr(io_sram5_addr),
    .io_sram5_cen(io_sram5_cen),
    .io_sram5_wen(io_sram5_wen),
    .io_sram5_wmask(io_sram5_wmask),
    .io_sram5_wdata(io_sram5_wdata),
    .io_sram5_rdata(io_sram5_rdata),
    .io_sram6_addr(io_sram6_addr),
    .io_sram6_cen(io_sram6_cen),
    .io_sram6_wen(io_sram6_wen),
    .io_sram6_wmask(io_sram6_wmask),
    .io_sram6_wdata(io_sram6_wdata),
    .io_sram6_rdata(io_sram6_rdata),
    .io_sram7_addr(io_sram7_addr),
    .io_sram7_cen(io_sram7_cen),
    .io_sram7_wen(io_sram7_wen),
    .io_sram7_wmask(io_sram7_wmask),
    .io_sram7_wdata(io_sram7_wdata),
    .io_sram7_rdata(io_sram7_rdata)
  );

//------------------------------------------------------------------------
// CLINT
//------------------------------------------------------------------------
  wire clint_op;
  assign clint_op = ram_store[3];
  assign clint_sel = clint_sel_d;
  //wire clint_valid;
  assign clint_valid = (ram_store[3] | ram_load[3]) & clint_sel;
  wire [63:0] clint_addr;
  assign clint_addr = (ram_store[3]) ? ram_waddr :
                      (ram_load[3]) ? ram_raddr : 0;
  wire [63:0] clint_wdata;
  assign clint_wdata = wdata;
  wire  [7:0] clint_wstrb;
  assign clint_wstrb = wstrb;
//wire clint_data_ok;
//wire clint_addr_ok;

  ysyx_040163_clint clint0(
    .clk(clk),
    .rst(rst),
    /* input */
    .clint_op(clint_op),
    .clint_valid(clint_valid),
    .clint_addr(clint_addr),
    .clint_wdata(clint_wdata),
    .clint_wstrb(clint_wstrb),
    /* output */
    .clint_rdata(clint_rdata),
  //.clint_data_ok(clint_data_ok),
  //.clint_addr_ok(clint_addr_ok),
    .timer_irq(timer_irq),
    .soft_irq(software_irq)
  );

//`define DEBUG_DCACHE_LOG
//`define DEBUG_CLINT_LOG

`ifdef DEBUG_DCACHE_LOG
  always @(posedge clk) begin
    if (~mem_wb_stall & (ram_store[3] | ram_load[3] | dcache_invalidate) & dcache_sel) begin
      $display("=======================================");
      $display("dcache_op: %d", dcache_op);
      $display("dcache_invalidate: %d", dcache_invalidate);
      $display("dcache_addr: %x", dcache_addr);
      $display("dcache_wdata: %x", dcache_wdata);
      $display("dcache_rdata: %x", dcache_rdata);
      $display("dcache_wstrb: %x", dcache_wstrb);
      $display("ram_raddr: %x", ram_raddr);
      $display("ram_waddr: %x", ram_waddr);
      $display("=======================================");
    end
  end
`endif

`ifdef DEBUG_CLINT_LOG
  always @(posedge clk) begin
    if (~mem_wb_stall & clint_sel) begin
      $display("=======================================");
      $display("clint_op: %d", clint_op);
      $display("clint_valid: %d", clint_valid);
      $display("clint_addr: %x", clint_addr);
      $display("clint_wdata: %x", clint_wdata);
      $display("clint_wstrb: %x", clint_wstrb);
      $display("clint_rdata: %x", clint_rdata);
      $display("ram_raddr: %x", ram_raddr);
      $display("ram_waddr: %x", ram_waddr);
      $display("=======================================");
    end
  end
`endif

endmodule
module ysyx_040163_rf #(ADDR_WIDTH = 5, DATA_WIDTH = 64) (
  input  wire                  clk,
  input  wire                  rst,
  input  wire                  reg_wen,
  input  wire [ADDR_WIDTH-1:0] waddr,
  input  wire [DATA_WIDTH-1:0] wdata,
  input  wire [ADDR_WIDTH-1:0] raddr_1,
  input  wire [ADDR_WIDTH-1:0] raddr_2,
  output wire [DATA_WIDTH-1:0] rdata_1,
  output wire [DATA_WIDTH-1:0] rdata_2
//output wire           [63:0] a0_data

//input  wire                  valid_wb,
//input  wire           [63:0] pc_wb
//input  wire                  mem_wb_stall
);

  reg [DATA_WIDTH-1:0] rf [2**ADDR_WIDTH-1:0];
  wire [DATA_WIDTH-1:0] wdata_in;

  assign wdata_in = wdata;

  always @(posedge clk) begin
    if (rst) begin
      for (int i = 0; i < 32; i = i + 1)
        rf[i] <= 0;
    end
    else begin
      if (reg_wen) begin
        if (waddr == 0) rf[0] <= 0;
        else rf[waddr] <= wdata_in; // 写入
        //$display("update register %d: to %d, and now it is %d.\n", waddr, wdata_in, rf[waddr]);
      end
    end
  end

  assign rdata_1 = raddr_1 == 0 ? 0 : ((raddr_1 == waddr) & reg_wen ? wdata : rf[raddr_1]);
  assign rdata_2 = raddr_2 == 0 ? 0 : ((raddr_2 == waddr) & reg_wen ? wdata : rf[raddr_2]);

endmodule
module ysyx_040163_sram #(
  parameter DATA_WIDTH = 64,
  parameter NUM_WORDS  = 1024
) (
  input wire                         clk,   /* 时钟信号 */
  input wire                         rst,
  input wire                         req,   /* 使能位，片选 */
  input wire                         we,    /* 0为读，1为写，写使能 */
  input wire [$clog2(NUM_WORDS)-1:0] addr,  /* 读/写地址 */
  input wire        [DATA_WIDTH-1:0] wdata, /* 写数据 */
  input wire        [DATA_WIDTH-1:0] be,    /* 写位使能 */

  output wire [DATA_WIDTH-1:0] rdata
);
  localparam ADDR_WIDTH = $clog2(NUM_WORDS);

  reg [ADDR_WIDTH-1:0] raddr_d;
  reg [DATA_WIDTH-1:0] ram [NUM_WORDS-1:0];
  
  always @(posedge clk) begin
    if (rst) begin
      raddr_d <= 0;
      for (int i = 0; i < NUM_WORDS; i = i + 1)
      `ifdef VERILATOR
      /* verilator lint_off BLKSEQ */
        ram[i] = 0;
      /* verilator lint_on BLKSEQ */
      `else
        ram[i] <= 0;
      `endif
    end
    else if (req) begin
      if (!we)
        raddr_d <= addr;
      else
        for (int i = 0; i < DATA_WIDTH; i = i + 1)
          if (be[i])
            ram[addr][i] <= wdata[i];
    end
  end

  assign rdata = ram[raddr_d];

endmodule
