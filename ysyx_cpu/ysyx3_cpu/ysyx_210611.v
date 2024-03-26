
//--Sun Jiru, Nanjing University--

`timescale 1ns / 1ps

`define YSYX210611_RISCV_PRIV_MODE_U   0
`define YSYX210611_RISCV_PRIV_MODE_S   1
`define YSYX210611_RISCV_PRIV_MODE_M   3

`define YSYX210611_ZERO_WORD  64'h00000000_00000000
`define YSYX210611_PC_START   64'h00000000_80000000
`define YSYX210611_REG_BUS    63 : 0
`define YSYX210611_INST_BUS   31 : 0

`define YSYX210611_ID_TO_EX_WIDTH        341
`define YSYX210611_EX_TO_MEM_WIDTH       214
`define YSYX210611_MEM_TO_WB_WIDTH       201

`define YSYX210611_BJ_CTRL_WIDTH         66
`define YSYX210611_MEM_FORWARD_WIDTH     73
`define YSYX210611_WB_FORWARD_WIDTH      137

`define YSYX210611_EXCP_RD_WIDTH       320
`define YSYX210611_EXCP_WR_WIDTH       320

`define YSYX210611_AXI_ADDR_WIDTH      64
`define YSYX210611_AXI_DATA_WIDTH      64
`define YSYX210611_AXI_ID_WIDTH        4
`define YSYX210611_AXI_USER_WIDTH      1

`define YSYX210611_SIZE_B              2'b00
`define YSYX210611_SIZE_H              2'b01
`define YSYX210611_SIZE_W              2'b10
`define YSYX210611_SIZE_D              2'b11

`define YSYX210611_REQ_READ            1'b0
`define YSYX210611_REQ_WRITE           1'b1

`define YSYX210611_ALU_ADD    0
`define YSYX210611_ALU_SUB    1
`define YSYX210611_ALU_SLT    2
`define YSYX210611_ALU_SLTU   3
`define YSYX210611_ALU_XOR    4
`define YSYX210611_ALU_OR     5
`define YSYX210611_ALU_AND    6
`define YSYX210611_ALU_SLL    7
`define YSYX210611_ALU_SRL    8
`define YSYX210611_ALU_SRA    9
`define YSYX210611_ALU_ANDN   10
`define YSYX210611_ALU_WRI    11
`define YSYX210611_ALU_BUS    11 : 0

`define YSYX210611_BJ_BEQ  0
`define YSYX210611_BJ_BNE  1
`define YSYX210611_BJ_BLT  2
`define YSYX210611_BJ_BGE  3
`define YSYX210611_BJ_BLTU 4
`define YSYX210611_BJ_BGEU 5
`define YSYX210611_BJ_JALR 6
`define YSYX210611_BJ_JAL  7
`define YSYX210611_BJ_BUS  7 : 0

`define YSYX210611_LOAD_LB  0
`define YSYX210611_LOAD_LH  1
`define YSYX210611_LOAD_LW  2
`define YSYX210611_LOAD_LD  3
`define YSYX210611_LOAD_LBU 4
`define YSYX210611_LOAD_LHU 5
`define YSYX210611_LOAD_LWU 6
`define YSYX210611_LOAD_BUS 6 : 0

`define YSYX210611_SAVE_SB  0
`define YSYX210611_SAVE_SH  1
`define YSYX210611_SAVE_SW  2
`define YSYX210611_SAVE_SD  3
`define YSYX210611_SAVE_BUS 3 : 0

`define YSYX210611_INST_I_LOAD        0
`define YSYX210611_INST_I_FENCE       1
`define YSYX210611_INST_I_ARITH_DWORD 2
`define YSYX210611_INST_U_AUIPC       3
`define YSYX210611_INST_I_ARITH_WORD  4
`define YSYX210611_INST_S             5
`define YSYX210611_INST_R_DWORD       6
`define YSYX210611_INST_U_LUI         7
`define YSYX210611_INST_R_WORD        8
`define YSYX210611_INST_B             9
`define YSYX210611_INST_I_JALR        10
`define YSYX210611_INST_J             11
`define YSYX210611_INST_I_EXP         12
`define YSYX210611_INST_I_CSR_IMM     13
`define YSYX210611_INST_I_CSR_REG     14
`define YSYX210611_INST_PUTCH         15
`define YSYX210611_OP_BUS             15 : 0

`define YSYX210611_CSR_MISA       0
`define YSYX210611_CSR_MCYCLE     1
`define YSYX210611_CSR_MVENDORID  2
`define YSYX210611_CSR_MARCHID    3
`define YSYX210611_CSR_MIMPID     4
`define YSYX210611_CSR_MHARTID    5
`define YSYX210611_CSR_BUS        5 : 0

`define YSYX210611_EXE_TO_REG   0
`define YSYX210611_MEM_TO_REG   1
`define YSYX210611_CSR_TO_REG   2
`define YSYX210611_REG_CTRL_BUS 2 : 0

`define YSYX210611_SOFT_ITRP  3
`define YSYX210611_TIMER_ITRP 7
`define YSYX210611_EXTER_ITRP 11
`define YSYX210611_ITRP_BUS   11 : 0

`define YSYX210611_EXCP_INST_MISAL 0
`define YSYX210611_EXCP_INST_ACC   1
`define YSYX210611_EXCP_ILG_INST   2
`define YSYX210611_EXCP_BRK_PT     3
`define YSYX210611_EXCP_LOAD_MISAL 4
`define YSYX210611_EXCP_LOAD_ACC   5
`define YSYX210611_EXCP_STOR_MISAL 6
`define YSYX210611_EXCP_STOR_ACC   7
`define YSYX210611_EXCP_ECALL_M    11
`define YSYX210611_EXCP_INST_PAGE  12
`define YSYX210611_EXCP_LOAD_PAGE  13
`define YSYX210611_EXCP_STOR_PAGE  15
`define YSYX210611_EXCP_BUS        15 : 0

module ysyx_210611(
  input                               clock,
  input                               reset,
  input                               io_interrupt,

  input                               io_master_awready,
  output                              io_master_awvalid,
  output [31:0]                       io_master_awaddr,
  output [3:0]                        io_master_awid,
  output [7:0]                        io_master_awlen,
  output [2:0]                        io_master_awsize,
  output [1:0]                        io_master_awburst,

  input                               io_master_wready,
  output                              io_master_wvalid,
  output [63:0]                       io_master_wdata,
  output [7:0]                        io_master_wstrb,
  output                              io_master_wlast,
  
  output                              io_master_bready,
  input                               io_master_bvalid,
  input  [1:0]                        io_master_bresp,
  input  [3:0]                        io_master_bid,

  input                               io_master_arready,
  output                              io_master_arvalid,
  output [31:0]                       io_master_araddr,
  output [3:0]                        io_master_arid,
  output [7:0]                        io_master_arlen,
  output [2:0]                        io_master_arsize,
  output [1:0]                        io_master_arburst,
    
  output                              io_master_rready,
  input                               io_master_rvalid,
  input  [1:0]                        io_master_rresp,
  input  [63:0]                       io_master_rdata,
  input                               io_master_rlast,
  input  [3:0]                        io_master_rid,

  output                              io_slave_awready,
  input                               io_slave_awvalid,
  input  [31:0]                       io_slave_awaddr,
  input  [3:0]                        io_slave_awid,
  input  [7:0]                        io_slave_awlen,
  input  [2:0]                        io_slave_awsize,
  input  [1:0]                        io_slave_awburst,

  output                              io_slave_wready,
  input                               io_slave_wvalid,
  input  [63:0]                       io_slave_wdata,
  input  [7:0]                        io_slave_wstrb,
  input                               io_slave_wlast,
  
  input                               io_slave_bready,
  output                              io_slave_bvalid,
  output [1:0]                        io_slave_bresp,
  output [3:0]                        io_slave_bid,

  output                              io_slave_arready,
  input                               io_slave_arvalid,
  input  [31:0]                       io_slave_araddr,
  input  [3:0]                        io_slave_arid,
  input  [7:0]                        io_slave_arlen,
  input  [2:0]                        io_slave_arsize,
  input  [1:0]                        io_slave_arburst,
    
  input                               io_slave_rready,
  output                              io_slave_rvalid,
  output [1:0]                        io_slave_rresp,
  output [63:0]                       io_slave_rdata,
  output                              io_slave_rlast,
  output [3:0]                        io_slave_rid
);
  
  // drive unused wires
  assign io_slave_awready = 1'b0;
  assign io_slave_wready  = 1'b0;
  assign io_slave_bvalid  = 1'b0;
  assign io_slave_bresp   = 2'b0;
  assign io_slave_bid     = 4'b0;

  assign io_slave_arready = 1'b0;
  assign io_slave_rvalid  = 1'b0;
  assign io_slave_rresp   = 2'b0;
  assign io_slave_rdata   = 64'b0;
  assign io_slave_rlast   = 1'b0;
  assign io_slave_rid     = 4'b0;
  
  wire                        mem_axi_aw_ready, if_axi_aw_ready, cli_aw_ready;
  wire                        mem_axi_aw_valid, if_axi_aw_valid, cli_aw_valid;
  wire [31:0]                 mem_axi_aw_addr,  if_axi_aw_addr,  cli_aw_addr;
  wire [3:0]                  mem_axi_aw_id,    if_axi_aw_id,    cli_aw_id;
  wire [7:0]                  mem_axi_aw_len,   if_axi_aw_len;
  wire [2:0]                  mem_axi_aw_size,  if_axi_aw_size,  cli_aw_size;
  wire [1:0]                  mem_axi_aw_burst, if_axi_aw_burst;
  
  wire                        mem_axi_w_ready,  if_axi_w_ready,  cli_w_ready;
  wire                        mem_axi_w_valid,  if_axi_w_valid,  cli_w_valid;
  wire [63:0]                 mem_axi_w_data,   if_axi_w_data,   cli_w_data;
  wire [7:0]                  mem_axi_w_strb,   if_axi_w_strb,   cli_w_strb;
  wire                        mem_axi_w_last,   if_axi_w_last,   cli_w_last;
  
  wire                        mem_axi_b_ready,  if_axi_b_ready,  cli_b_ready;
  wire                        mem_axi_b_valid,  if_axi_b_valid,  cli_b_valid;
  wire [1:0]                  mem_axi_b_resp,   if_axi_b_resp,   cli_b_resp;
  wire [3:0]                  mem_axi_b_id,     if_axi_b_id,     cli_b_id;
  
  wire                        mem_axi_ar_ready, if_axi_ar_ready, cli_ar_ready;
  wire                        mem_axi_ar_valid, if_axi_ar_valid, cli_ar_valid;
  wire [31:0]                 mem_axi_ar_addr,  if_axi_ar_addr,  cli_ar_addr;
  wire [3:0]                  mem_axi_ar_id,    if_axi_ar_id,    cli_ar_id;
  wire [7:0]                  mem_axi_ar_len,   if_axi_ar_len;
  wire [2:0]                  mem_axi_ar_size,  if_axi_ar_size,  cli_ar_size;
  wire [1:0]                  mem_axi_ar_burst, if_axi_ar_burst;
  
  wire                        mem_axi_r_ready,  if_axi_r_ready,  cli_r_ready;
  wire                        mem_axi_r_valid,  if_axi_r_valid,  cli_r_valid;
  wire [1:0]                  mem_axi_r_resp,   if_axi_r_resp,   cli_r_resp;
  wire [63:0]                 mem_axi_r_data,   if_axi_r_data,   cli_r_data;
  wire                        mem_axi_r_last,   if_axi_r_last,   cli_r_last;
  wire [3:0]                  mem_axi_r_id,     if_axi_r_id,     cli_r_id;
  
  wire if_rw_valid;
  wire if_rw_ready;
  wire if_rw_req = `YSYX210611_REQ_READ;
  wire [`YSYX210611_REG_BUS] if_r_data;
  wire [`YSYX210611_REG_BUS] if_w_data = 64'h0;
  wire [`YSYX210611_REG_BUS] if_rw_addr;
  wire [1:0] if_rw_size;
  wire [1:0] if_rw_resp;
  
  wire mem_rw_valid;
  wire mem_rw_ready;
  wire mem_rw_req;
  wire [`YSYX210611_REG_BUS] mem_r_data;
  wire [`YSYX210611_REG_BUS] mem_w_data;
  wire [`YSYX210611_REG_BUS] mem_rw_addr;
  wire [1:0] mem_rw_size;
  wire [1:0] mem_rw_resp;

  wire [`YSYX210611_ITRP_BUS] clint_interupt_bus;

  ysyx_210611_axi_2x2 ysyx_210611_axi_2x2(
    .clock                          (clock),
    .reset                          (reset),
    
    // MEM
    .aw_ready_o_0                   (mem_axi_aw_ready),
    .aw_valid_i_0                   (mem_axi_aw_valid),
    .aw_addr_i_0                    (mem_axi_aw_addr),
    .aw_id_i_0                      (mem_axi_aw_id),
    .aw_len_i_0                     (mem_axi_aw_len),
    .aw_size_i_0                    (mem_axi_aw_size),
    .aw_burst_i_0                   (mem_axi_aw_burst),

    .w_ready_o_0                    (mem_axi_w_ready),
    .w_valid_i_0                    (mem_axi_w_valid),
    .w_data_i_0                     (mem_axi_w_data),
    .w_strb_i_0                     (mem_axi_w_strb),
    .w_last_i_0                     (mem_axi_w_last),

    .b_ready_i_0                    (mem_axi_b_ready),
    .b_valid_o_0                    (mem_axi_b_valid),
    .b_resp_o_0                     (mem_axi_b_resp),
    .b_id_o_0                       (mem_axi_b_id),

    .ar_ready_o_0                   (mem_axi_ar_ready),
    .ar_valid_i_0                   (mem_axi_ar_valid),
    .ar_addr_i_0                    (mem_axi_ar_addr),
    .ar_id_i_0                      (mem_axi_ar_id),
    .ar_len_i_0                     (mem_axi_ar_len),
    .ar_size_i_0                    (mem_axi_ar_size),
    .ar_burst_i_0                   (mem_axi_ar_burst),

    .r_ready_i_0                    (mem_axi_r_ready),
    .r_valid_o_0                    (mem_axi_r_valid),
    .r_resp_o_0                     (mem_axi_r_resp),
    .r_data_o_0                     (mem_axi_r_data),
    .r_last_o_0                     (mem_axi_r_last),
    .r_id_o_0                       (mem_axi_r_id),

    // IF
    .aw_ready_o_1                   (if_axi_aw_ready),
    .aw_valid_i_1                   (if_axi_aw_valid),
    .aw_addr_i_1                    (if_axi_aw_addr),
    .aw_id_i_1                      (if_axi_aw_id),
    .aw_len_i_1                     (if_axi_aw_len),
    .aw_size_i_1                    (if_axi_aw_size),
    .aw_burst_i_1                   (if_axi_aw_burst),

    .w_ready_o_1                    (if_axi_w_ready),
    .w_valid_i_1                    (if_axi_w_valid),
    .w_data_i_1                     (if_axi_w_data),
    .w_strb_i_1                     (if_axi_w_strb),
    .w_last_i_1                     (if_axi_w_last),

    .b_ready_i_1                    (if_axi_b_ready),
    .b_valid_o_1                    (if_axi_b_valid),
    .b_resp_o_1                     (if_axi_b_resp),
    .b_id_o_1                       (if_axi_b_id),

    .ar_ready_o_1                   (if_axi_ar_ready),
    .ar_valid_i_1                   (if_axi_ar_valid),
    .ar_addr_i_1                    (if_axi_ar_addr),
    .ar_id_i_1                      (if_axi_ar_id),
    .ar_len_i_1                     (if_axi_ar_len),
    .ar_size_i_1                    (if_axi_ar_size),
    .ar_burst_i_1                   (if_axi_ar_burst),

    .r_ready_i_1                    (if_axi_r_ready),
    .r_valid_o_1                    (if_axi_r_valid),
    .r_resp_o_1                     (if_axi_r_resp),
    .r_data_o_1                     (if_axi_r_data),
    .r_last_o_1                     (if_axi_r_last),
    .r_id_o_1                       (if_axi_r_id),
    
    // TOP INTERFACE
    .ram_aw_ready_i                 (io_master_awready),
    .ram_aw_valid_o                 (io_master_awvalid),
    .ram_aw_addr_o                  (io_master_awaddr),
    .ram_aw_id_o                    (io_master_awid),
    .ram_aw_len_o                   (io_master_awlen),
    .ram_aw_size_o                  (io_master_awsize),
    .ram_aw_burst_o                 (io_master_awburst),

    .ram_w_ready_i                  (io_master_wready),
    .ram_w_valid_o                  (io_master_wvalid),
    .ram_w_data_o                   (io_master_wdata),
    .ram_w_strb_o                   (io_master_wstrb),
    .ram_w_last_o                   (io_master_wlast),
  
    .ram_b_ready_o                  (io_master_bready),
    .ram_b_valid_i                  (io_master_bvalid),
    .ram_b_resp_i                   (io_master_bresp),
    .ram_b_id_i                     (io_master_bid),
  
    .ram_ar_ready_i                 (io_master_arready),
    .ram_ar_valid_o                 (io_master_arvalid),
    .ram_ar_addr_o                  (io_master_araddr),
    .ram_ar_id_o                    (io_master_arid),
    .ram_ar_len_o                   (io_master_arlen),
    .ram_ar_size_o                  (io_master_arsize),
    .ram_ar_burst_o                 (io_master_arburst),
  
    .ram_r_ready_o                  (io_master_rready),
    .ram_r_valid_i                  (io_master_rvalid),
    .ram_r_resp_i                   (io_master_rresp),
    .ram_r_data_i                   (io_master_rdata),
    .ram_r_last_i                   (io_master_rlast),
    .ram_r_id_i                     (io_master_rid),

    // CLINT
    .cli_aw_ready_i                 (cli_aw_ready),
    .cli_aw_valid_o                 (cli_aw_valid),
    .cli_aw_addr_o                  (cli_aw_addr),
    .cli_aw_id_o                    (cli_aw_id),
    .cli_aw_size_o                  (cli_aw_size),

    .cli_w_ready_i                  (cli_w_ready),
    .cli_w_valid_o                  (cli_w_valid),
    .cli_w_data_o                   (cli_w_data),
    .cli_w_strb_o                   (cli_w_strb),
    .cli_w_last_o                   (cli_w_last),
  
    .cli_b_ready_o                  (cli_b_ready),
    .cli_b_valid_i                  (cli_b_valid),
    .cli_b_resp_i                   (cli_b_resp),
    .cli_b_id_i                     (cli_b_id),
  
    .cli_ar_ready_i                 (cli_ar_ready),
    .cli_ar_valid_o                 (cli_ar_valid),
    .cli_ar_addr_o                  (cli_ar_addr),
    .cli_ar_id_o                    (cli_ar_id),
    .cli_ar_size_o                  (cli_ar_size),
  
    .cli_r_ready_o                  (cli_r_ready),
    .cli_r_valid_i                  (cli_r_valid),
    .cli_r_resp_i                   (cli_r_resp),
    .cli_r_data_i                   (cli_r_data),
    .cli_r_last_i                   (cli_r_last),
    .cli_r_id_i                     (cli_r_id)
  );
  
    
  ysyx_210611_axi_rw ysyx_210611_mem_axi_rw (
    .clock                          (clock),
    .reset                          (reset),
    .device_id                      (4'b0001),
    
    .rw_valid_i                     (mem_rw_valid),
    .rw_ready_o                     (mem_rw_ready),
    .rw_req_i                       (mem_rw_req),
    .data_read_o                    (mem_r_data),
    .data_write_i                   (mem_w_data),
    .rw_addr_i                      (mem_rw_addr),
    .rw_size_i                      (mem_rw_size),
    .rw_resp_o                      (mem_rw_resp),
    
    .axi_aw_ready_i                 (mem_axi_aw_ready),
    .axi_aw_valid_o                 (mem_axi_aw_valid),
    .axi_aw_addr_o                  (mem_axi_aw_addr),
    .axi_aw_id_o                    (mem_axi_aw_id),
    .axi_aw_len_o                   (mem_axi_aw_len),
    .axi_aw_size_o                  (mem_axi_aw_size),
    .axi_aw_burst_o                 (mem_axi_aw_burst),
    
    .axi_w_ready_i                  (mem_axi_w_ready),
    .axi_w_valid_o                  (mem_axi_w_valid),
    .axi_w_data_o                   (mem_axi_w_data),
    .axi_w_strb_o                   (mem_axi_w_strb),
    .axi_w_last_o                   (mem_axi_w_last),
        
    .axi_b_ready_o                  (mem_axi_b_ready),
    .axi_b_valid_i                  (mem_axi_b_valid),
    .axi_b_resp_i                   (mem_axi_b_resp),
    .axi_b_id_i                     (mem_axi_b_id),

    .axi_ar_ready_i                 (mem_axi_ar_ready),
    .axi_ar_valid_o                 (mem_axi_ar_valid),
    .axi_ar_addr_o                  (mem_axi_ar_addr),
    .axi_ar_id_o                    (mem_axi_ar_id),
    .axi_ar_len_o                   (mem_axi_ar_len),
    .axi_ar_size_o                  (mem_axi_ar_size),
    .axi_ar_burst_o                 (mem_axi_ar_burst),
        
    .axi_r_ready_o                  (mem_axi_r_ready),
    .axi_r_valid_i                  (mem_axi_r_valid),
    .axi_r_resp_i                   (mem_axi_r_resp),
    .axi_r_data_i                   (mem_axi_r_data),
    .axi_r_last_i                   (mem_axi_r_last),
    .axi_r_id_i                     (mem_axi_r_id)
  );

  ysyx_210611_axi_rw ysyx_210611_if_axi_rw (
    .clock                          (clock),
    .reset                          (reset),
    .device_id                      (4'b0000),
    
    .rw_valid_i                     (if_rw_valid),
    .rw_ready_o                     (if_rw_ready),
    .rw_req_i                       (if_rw_req),
    .data_read_o                    (if_r_data),
    .data_write_i                   (if_w_data),
    .rw_addr_i                      (if_rw_addr),
    .rw_size_i                      (if_rw_size),
    .rw_resp_o                      (if_rw_resp),
    
    .axi_aw_ready_i                 (if_axi_aw_ready),
    .axi_aw_valid_o                 (if_axi_aw_valid),
    .axi_aw_addr_o                  (if_axi_aw_addr),
    .axi_aw_id_o                    (if_axi_aw_id),
    .axi_aw_len_o                   (if_axi_aw_len),
    .axi_aw_size_o                  (if_axi_aw_size),
    .axi_aw_burst_o                 (if_axi_aw_burst),
    
    .axi_w_ready_i                  (if_axi_w_ready),
    .axi_w_valid_o                  (if_axi_w_valid),
    .axi_w_data_o                   (if_axi_w_data),
    .axi_w_strb_o                   (if_axi_w_strb),
    .axi_w_last_o                   (if_axi_w_last),
        
    .axi_b_ready_o                  (if_axi_b_ready),
    .axi_b_valid_i                  (if_axi_b_valid),
    .axi_b_resp_i                   (if_axi_b_resp),
    .axi_b_id_i                     (if_axi_b_id),

    .axi_ar_ready_i                 (if_axi_ar_ready),
    .axi_ar_valid_o                 (if_axi_ar_valid),
    .axi_ar_addr_o                  (if_axi_ar_addr),
    .axi_ar_id_o                    (if_axi_ar_id),
    .axi_ar_len_o                   (if_axi_ar_len),
    .axi_ar_size_o                  (if_axi_ar_size),
    .axi_ar_burst_o                 (if_axi_ar_burst),
        
    .axi_r_ready_o                  (if_axi_r_ready),
    .axi_r_valid_i                  (if_axi_r_valid),
    .axi_r_resp_i                   (if_axi_r_resp),
    .axi_r_data_i                   (if_axi_r_data),
    .axi_r_last_i                   (if_axi_r_last),
    .axi_r_id_i                     (if_axi_r_id)
  );

  ysyx_210611_cpu ysyx_210611_u_cpu(
    .clock                         (clock),
    .reset                         (reset),
    
    // if stage
    .if_rw_valid                   (if_rw_valid),
    .if_rw_ready                   (if_rw_ready),
    .if_r_data                     (if_r_data),
    .if_rw_addr                    (if_rw_addr),
    .if_rw_size                    (if_rw_size),
    .if_rw_resp                    (if_rw_resp),
    
    // mem stage
    .mem_rw_valid                  (mem_rw_valid),
    .mem_rw_ready                  (mem_rw_ready),
    .mem_rw_req                    (mem_rw_req),
    .mem_r_data                    (mem_r_data),
    .mem_w_data                    (mem_w_data),
    .mem_rw_addr                   (mem_rw_addr),
    .mem_rw_size                   (mem_rw_size),
    .mem_rw_resp                   (mem_rw_resp),

    .clint_interupt_bus            (clint_interupt_bus)
  );
  
  ysyx_210611_clint ysyx_210611_Clint(
    .clk                           (clock),
    .rst                           (reset),

    .aw_ready_o                    (cli_aw_ready),
    .aw_valid_i                    (cli_aw_valid),
    .aw_addr_i                     (cli_aw_addr),
    .aw_id_i                       (cli_aw_id),
    .aw_size_i                     (cli_aw_size),
    
    .w_ready_o                     (cli_w_ready),
    .w_valid_i                     (cli_w_valid),
    .w_data_i                      (cli_w_data),
    .w_strb_i                      (cli_w_strb),
    .w_last_i                      (cli_w_last),
        
    .b_ready_i                     (cli_b_ready),
    .b_valid_o                     (cli_b_valid),
    .b_resp_o                      (cli_b_resp),
    .b_id_o                        (cli_b_id),

    .ar_ready_o                    (cli_ar_ready),
    .ar_valid_i                    (cli_ar_valid),
    .ar_addr_i                     (cli_ar_addr),
    .ar_id_i                       (cli_ar_id),
    .ar_size_i                     (cli_ar_size),
        
    .r_ready_i                     (cli_r_ready),
    .r_valid_o                     (cli_r_valid),
    .r_resp_o                      (cli_r_resp),
    .r_data_o                      (cli_r_data),
    .r_last_o                      (cli_r_last),
    .r_id_o                        (cli_r_id),

    .clint_interupt_bus            (clint_interupt_bus)
  );
endmodule

// Burst types
`define YSYX210611_AXI_BURST_TYPE_FIXED                                2'b00
`define YSYX210611_AXI_BURST_TYPE_INCR                                 2'b01
`define YSYX210611_AXI_BURST_TYPE_WRAP                                 2'b10
// Access permissions
`define YSYX210611_AXI_PROT_UNPRIVILEGED_ACCESS                        3'b000
`define YSYX210611_AXI_PROT_PRIVILEGED_ACCESS                          3'b001
`define YSYX210611_AXI_PROT_SECURE_ACCESS                              3'b000
`define YSYX210611_AXI_PROT_NON_SECURE_ACCESS                          3'b010
`define YSYX210611_AXI_PROT_DATA_ACCESS                                3'b000
`define YSYX210611_AXI_PROT_INSTRUCTION_ACCESS                         3'b100
// Memory types (AR)
`define YSYX210611_AXI_ARCACHE_DEVICE_NON_BUFFERABLE                   4'b0000
`define YSYX210611_AXI_ARCACHE_DEVICE_BUFFERABLE                       4'b0001
`define YSYX210611_AXI_ARCACHE_NORMAL_NON_CACHEABLE_NON_BUFFERABLE     4'b0010
`define YSYX210611_AXI_ARCACHE_NORMAL_NON_CACHEABLE_BUFFERABLE         4'b0011
`define YSYX210611_AXI_ARCACHE_WRITE_THROUGH_NO_ALLOCATE               4'b1010
`define YSYX210611_AXI_ARCACHE_WRITE_THROUGH_READ_ALLOCATE             4'b1110
`define YSYX210611_AXI_ARCACHE_WRITE_THROUGH_WRITE_ALLOCATE            4'b1010
`define YSYX210611_AXI_ARCACHE_WRITE_THROUGH_READ_AND_WRITE_ALLOCATE   4'b1110
`define YSYX210611_AXI_ARCACHE_WRITE_BACK_NO_ALLOCATE                  4'b1011
`define YSYX210611_AXI_ARCACHE_WRITE_BACK_READ_ALLOCATE                4'b1111
`define YSYX210611_AXI_ARCACHE_WRITE_BACK_WRITE_ALLOCATE               4'b1011
`define YSYX210611_AXI_ARCACHE_WRITE_BACK_READ_AND_WRITE_ALLOCATE      4'b1111
// Memory types (AW)
`define YSYX210611_AXI_AWCACHE_DEVICE_NON_BUFFERABLE                   4'b0000
`define YSYX210611_AXI_AWCACHE_DEVICE_BUFFERABLE                       4'b0001
`define YSYX210611_AXI_AWCACHE_NORMAL_NON_CACHEABLE_NON_BUFFERABLE     4'b0010
`define YSYX210611_AXI_AWCACHE_NORMAL_NON_CACHEABLE_BUFFERABLE         4'b0011
`define YSYX210611_AXI_AWCACHE_WRITE_THROUGH_NO_ALLOCATE               4'b0110
`define YSYX210611_AXI_AWCACHE_WRITE_THROUGH_READ_ALLOCATE             4'b0110
`define YSYX210611_AXI_AWCACHE_WRITE_THROUGH_WRITE_ALLOCATE            4'b1110
`define YSYX210611_AXI_AWCACHE_WRITE_THROUGH_READ_AND_WRITE_ALLOCATE   4'b1110
`define YSYX210611_AXI_AWCACHE_WRITE_BACK_NO_ALLOCATE                  4'b0111
`define YSYX210611_AXI_AWCACHE_WRITE_BACK_READ_ALLOCATE                4'b0111
`define YSYX210611_AXI_AWCACHE_WRITE_BACK_WRITE_ALLOCATE               4'b1111
`define YSYX210611_AXI_AWCACHE_WRITE_BACK_READ_AND_WRITE_ALLOCATE      4'b1111

`define YSYX210611_AXI_SIZE_BYTES_1                                    3'b000
`define YSYX210611_AXI_SIZE_BYTES_2                                    3'b001
`define YSYX210611_AXI_SIZE_BYTES_4                                    3'b010
`define YSYX210611_AXI_SIZE_BYTES_8                                    3'b011
`define YSYX210611_AXI_SIZE_BYTES_16                                   3'b100
`define YSYX210611_AXI_SIZE_BYTES_32                                   3'b101
`define YSYX210611_AXI_SIZE_BYTES_64                                   3'b110
`define YSYX210611_AXI_SIZE_BYTES_128                                  3'b111

module ysyx_210611_axi_2x2 # (
  parameter AXI_DATA_WIDTH    = 64,
  parameter AXI_ADDR_WIDTH    = 32,
  parameter AXI_ID_WIDTH      = 4
)(
  input  wire               clock,
  input  wire               reset,
  
  // Advanced eXtensible Interface
  // mem stage (master) -> 2x2 interconnect (slave)
  // id: 0001
  output wire                             aw_ready_o_0,
  input  wire                             aw_valid_i_0,
  input  wire [AXI_ADDR_WIDTH-1:0]        aw_addr_i_0,
  input  wire [AXI_ID_WIDTH-1:0]          aw_id_i_0,
  input  wire [7:0]                       aw_len_i_0,
  input  wire [2:0]                       aw_size_i_0,
  input  wire [1:0]                       aw_burst_i_0,
  
  output wire                             w_ready_o_0,
  input  wire                             w_valid_i_0,
  input  wire [AXI_DATA_WIDTH-1:0]        w_data_i_0,
  input  wire [AXI_DATA_WIDTH/8-1:0]      w_strb_i_0,
  input  wire                             w_last_i_0,
   
  input  wire                             b_ready_i_0,
  output wire                             b_valid_o_0,
  output wire [1:0]                       b_resp_o_0,
  output wire [AXI_ID_WIDTH-1:0]          b_id_o_0,
  
  output wire                             ar_ready_o_0,
  input  wire                             ar_valid_i_0,
  input  wire [AXI_ADDR_WIDTH-1:0]        ar_addr_i_0,
  input  wire [AXI_ID_WIDTH-1:0]          ar_id_i_0,
  input  wire [7:0]                       ar_len_i_0,
  input  wire [2:0]                       ar_size_i_0,
  input  wire [1:0]                       ar_burst_i_0,
  
  input  wire                             r_ready_i_0,
  output wire                             r_valid_o_0,
  output wire [1:0]                       r_resp_o_0,
  output wire [AXI_DATA_WIDTH-1:0]        r_data_o_0,
  output wire                             r_last_o_0,
  output wire [AXI_ID_WIDTH-1:0]          r_id_o_0,

  // Advanced eXtensible Interface
  // if stage (master) -> 2x2 interconnect (slave)
  // id: 0000
  output wire                             aw_ready_o_1,
  input  wire                             aw_valid_i_1,
  input  wire [AXI_ADDR_WIDTH-1:0]        aw_addr_i_1,
  input  wire [AXI_ID_WIDTH-1:0]          aw_id_i_1,
  input  wire [7:0]                       aw_len_i_1,
  input  wire [2:0]                       aw_size_i_1,
  input  wire [1:0]                       aw_burst_i_1,
  
  output wire                             w_ready_o_1,
  input  wire                             w_valid_i_1,
  input  wire [AXI_DATA_WIDTH-1:0]        w_data_i_1,
  input  wire [AXI_DATA_WIDTH/8-1:0]      w_strb_i_1,
  input  wire                             w_last_i_1,
  
  input  wire                             b_ready_i_1,
  output wire                             b_valid_o_1,
  output wire [1:0]                       b_resp_o_1,
  output wire [AXI_ID_WIDTH-1:0]          b_id_o_1,
  
  output wire                             ar_ready_o_1,
  input  wire                             ar_valid_i_1,
  input  wire [AXI_ADDR_WIDTH-1:0]        ar_addr_i_1,
  input  wire [AXI_ID_WIDTH-1:0]          ar_id_i_1,
  input  wire [7:0]                       ar_len_i_1,
  input  wire [2:0]                       ar_size_i_1,
  input  wire [1:0]                       ar_burst_i_1,
  
  input  wire                             r_ready_i_1,
  output wire                             r_valid_o_1,
  output wire [1:0]                       r_resp_o_1,
  output wire [AXI_DATA_WIDTH-1:0]        r_data_o_1,
  output wire                             r_last_o_1,
  output wire [AXI_ID_WIDTH-1:0]          r_id_o_1,
  
  // Advanced eXtensible Interface
  // 2x2 interconnect -> RAM
  input  wire                             ram_aw_ready_i,
  output wire                             ram_aw_valid_o,
  output wire [AXI_ADDR_WIDTH-1:0]        ram_aw_addr_o,
  output wire [AXI_ID_WIDTH-1:0]          ram_aw_id_o,
  output wire [7:0]                       ram_aw_len_o,
  output wire [2:0]                       ram_aw_size_o,
  output wire [1:0]                       ram_aw_burst_o,
  
  input  wire                             ram_w_ready_i,
  output wire                             ram_w_valid_o,
  output wire [AXI_DATA_WIDTH-1:0]        ram_w_data_o,
  output wire [AXI_DATA_WIDTH/8-1:0]      ram_w_strb_o,
  output wire                             ram_w_last_o,
  
  output wire                             ram_b_ready_o,
  input  wire                             ram_b_valid_i,
  input  wire [1:0]                       ram_b_resp_i,
  input  wire [AXI_ID_WIDTH-1:0]          ram_b_id_i,
  
  input  wire                             ram_ar_ready_i,
  output wire                             ram_ar_valid_o,
  output wire [AXI_ADDR_WIDTH-1:0]        ram_ar_addr_o,
  output wire [AXI_ID_WIDTH-1:0]          ram_ar_id_o,
  output wire [7:0]                       ram_ar_len_o,
  output wire [2:0]                       ram_ar_size_o,
  output wire [1:0]                       ram_ar_burst_o,
  
  output wire                             ram_r_ready_o,
  input  wire                             ram_r_valid_i,
  input  wire [1:0]                       ram_r_resp_i,
  input  wire [AXI_DATA_WIDTH-1:0]        ram_r_data_i,
  input  wire                             ram_r_last_i,
  input  wire [AXI_ID_WIDTH-1:0]          ram_r_id_i,
  
  // 2x2 interconnect -> CLINT
  input  wire                             cli_aw_ready_i,
  output wire                             cli_aw_valid_o,
  output wire [AXI_ADDR_WIDTH-1:0]        cli_aw_addr_o,
  output wire [AXI_ID_WIDTH-1:0]          cli_aw_id_o,
  output wire [2:0]                       cli_aw_size_o,
  
  input  wire                             cli_w_ready_i,
  output wire                             cli_w_valid_o,
  output wire [AXI_DATA_WIDTH-1:0]        cli_w_data_o,
  output wire [AXI_DATA_WIDTH/8-1:0]      cli_w_strb_o,
  output wire                             cli_w_last_o,
  
  output wire                             cli_b_ready_o,
  input  wire                             cli_b_valid_i,
  input  wire [1:0]                       cli_b_resp_i,
  input  wire [AXI_ID_WIDTH-1:0]          cli_b_id_i,
  
  input  wire                             cli_ar_ready_i,
  output wire                             cli_ar_valid_o,
  output wire [AXI_ADDR_WIDTH-1:0]        cli_ar_addr_o,
  output wire [AXI_ID_WIDTH-1:0]          cli_ar_id_o,
  output wire [2:0]                       cli_ar_size_o,
  
  output wire                             cli_r_ready_o,
  input  wire                             cli_r_valid_i,
  input  wire [1:0]                       cli_r_resp_i,
  input  wire [AXI_DATA_WIDTH-1:0]        cli_r_data_i,
  input  wire                             cli_r_last_i,
  input  wire [AXI_ID_WIDTH-1:0]          cli_r_id_i
);

  // bridge between master and slave
  wire                             mid_aw_ready;
  wire                             mid_aw_valid;
  wire [AXI_ADDR_WIDTH-1:0]        mid_aw_addr;
  wire [AXI_ID_WIDTH-1:0]          mid_aw_id;
  wire [7:0]                       mid_aw_len;
  wire [2:0]                       mid_aw_size;
  wire [1:0]                       mid_aw_burst;
  
  wire                             mid_w_ready;
  wire                             mid_w_valid;
  wire [AXI_DATA_WIDTH-1:0]        mid_w_data;
  wire [AXI_DATA_WIDTH/8-1:0]      mid_w_strb;
  wire                             mid_w_last;
  
  wire                             mid_b_ready;
  wire                             mid_b_valid;
  wire [1:0]                       mid_b_resp;
  wire [AXI_ID_WIDTH-1:0]          mid_b_id;
  
  wire                             mid_ar_ready;
  wire                             mid_ar_valid;
  wire [AXI_ADDR_WIDTH-1:0]        mid_ar_addr;
  wire [AXI_ID_WIDTH-1:0]          mid_ar_id;
  wire [7:0]                       mid_ar_len;
  wire [2:0]                       mid_ar_size;
  wire [1:0]                       mid_ar_burst;
  
  wire                             mid_r_ready;
  wire                             mid_r_valid;
  wire [1:0]                       mid_r_resp;
  wire [AXI_DATA_WIDTH-1:0]        mid_r_data;
  wire                             mid_r_last;
  wire [AXI_ID_WIDTH-1:0]          mid_r_id;

  wire r_finish_0;
  wire r_finish_1;
  wire r_finish_cli;
  wire r_finish_ram;
  wire w_finish_0;
  wire w_finish_1;
  wire w_finish_cli;
  wire w_finish_ram;

  // ------------------State Machine------------------
  wire [1:0] STATE_IDLE  = 2'b00;
  // master state
  wire [1:0] STATE_0 = 2'b01, STATE_1 = 2'b10;
  // slave state
  wire [1:0] STATE_CLINT = 2'b01, STATE_RAM = 2'b10;
  
  // Write State Machine
  // Master
  reg [1:0] master_w_state, slave_w_state;
  reg [1:0] master_w_next_state, slave_w_next_state;
  wire w_0_to_ram = aw_addr_i_0[31:16] != 16'h0200;
  wire w_1_to_ram = aw_addr_i_1[31:16] != 16'h0200;
  wire w_state_0 = (master_w_state == STATE_0);
  wire w_state_1 = (master_w_state == STATE_1);
  wire w_state_cli = (slave_w_state == STATE_CLINT);
  wire w_state_ram = (slave_w_state == STATE_RAM);

  // Current Stage
  always @(posedge clock) begin
    if (reset) begin
      master_w_state <= STATE_IDLE;
      slave_w_state <= STATE_IDLE;
    end
    else begin
      master_w_state <= master_w_next_state;
      slave_w_state <= slave_w_next_state;
    end
  end
  
  // Next Stage
  always @(*) begin
    begin
      // master side
      case (master_w_state)
        STATE_IDLE: begin
          if (aw_valid_i_0) begin
            master_w_next_state = STATE_0;
          end
          else if (aw_valid_i_1) begin
            master_w_next_state = STATE_1;
          end
          else begin
            master_w_next_state = STATE_IDLE;
          end
        end
        STATE_0: begin
          if (w_finish_0) begin
            master_w_next_state = STATE_IDLE;
          end
          else begin
            master_w_next_state = STATE_0;
          end
        end
        STATE_1: begin
          if (w_finish_1) begin
            master_w_next_state = STATE_IDLE;
          end
          else begin
            master_w_next_state = STATE_1;
          end
        end
        default: begin
          master_w_next_state = STATE_IDLE;
        end
      endcase
      // slave side
      case (slave_w_state)
        STATE_IDLE: begin
          if ((master_w_next_state == STATE_0) && aw_valid_i_0) begin
            slave_w_next_state = w_0_to_ram ? STATE_RAM : STATE_CLINT;
          end
          else if ((master_w_next_state == STATE_1) && aw_valid_i_1) begin
            slave_w_next_state = w_1_to_ram ? STATE_RAM : STATE_CLINT;
          end
          else begin
            slave_w_next_state = STATE_IDLE;
          end
        end
        STATE_CLINT: begin
          if (w_finish_cli) begin
            slave_w_next_state = STATE_IDLE;
          end
          else begin
            slave_w_next_state = STATE_CLINT;
          end
        end
        STATE_RAM: begin
          if (w_finish_ram) begin
            slave_w_next_state = STATE_IDLE;
          end
          else begin
            slave_w_next_state = STATE_RAM;
          end
        end
        default: begin
          slave_w_next_state = STATE_IDLE;
        end
      endcase
    end
  end
  
  // Read State Machine
  reg [1:0] master_r_state, slave_r_state;
  reg [1:0] master_r_next_state, slave_r_next_state;
  wire r_0_to_ram = ar_addr_i_0[31:16] != 16'h0200;
  wire r_1_to_ram = ar_addr_i_1[31:16] != 16'h0200;
  wire r_state_0 = (master_r_state == STATE_0);
  wire r_state_1 = (master_r_state == STATE_1);
  wire r_state_cli = (slave_r_state == STATE_CLINT);
  wire r_state_ram = (slave_r_state == STATE_RAM);

  // Current Stage
  always @(posedge clock) begin
    if (reset) begin
      master_r_state <= STATE_IDLE;
      slave_r_state <= STATE_IDLE;
    end
    else begin
      master_r_state <= master_r_next_state;
      slave_r_state <= slave_r_next_state;
    end
  end
  
  // Next Stage
  always @(*) begin
    begin
      // master side
      case (master_r_state)
        STATE_IDLE: begin
          if (ar_valid_i_0) begin
            master_r_next_state = STATE_0;
          end
          else if (ar_valid_i_1) begin
            master_r_next_state = STATE_1;
          end
          else begin
            master_r_next_state = STATE_IDLE;
          end
        end
        STATE_0: begin
          if (r_finish_0) begin
            master_r_next_state = STATE_IDLE;
          end
          else begin
            master_r_next_state = STATE_0;
          end
        end
        STATE_1: begin
          if (r_finish_1) begin
            master_r_next_state = STATE_IDLE;
          end
          else begin
            master_r_next_state = STATE_1;
          end
        end
        default: begin
          master_r_next_state = STATE_IDLE;
        end
      endcase

      // slave side
      case (slave_r_state)
        STATE_IDLE: begin
          if ((master_r_next_state == STATE_0) && ar_valid_i_0) begin
            slave_r_next_state = r_0_to_ram ? STATE_RAM : STATE_CLINT;
          end
          else if ((master_r_next_state == STATE_1) && ar_valid_i_1) begin
            slave_r_next_state = r_1_to_ram ? STATE_RAM : STATE_CLINT;
          end
          else begin
            slave_r_next_state = STATE_IDLE;
          end
        end
        STATE_CLINT: begin
          if (r_finish_cli) begin
            slave_r_next_state = STATE_IDLE;
          end
          else begin
            slave_r_next_state = STATE_CLINT;
          end
        end
        STATE_RAM: begin
          if (r_finish_ram) begin
            slave_r_next_state = STATE_IDLE;
          end
          else begin
            slave_r_next_state = STATE_RAM;
          end
        end
        default: begin
          slave_r_next_state = STATE_IDLE;
        end
      endcase
    end
  end
  
  assign r_finish_0 = mid_r_valid && r_ready_i_0 && mid_r_last && r_state_0;
  assign r_finish_1 = mid_r_valid && r_ready_i_1 && mid_r_last && r_state_1;
  assign r_finish_cli = mid_r_ready && cli_r_valid_i && cli_r_last_i && r_state_cli;
  assign r_finish_ram = mid_r_ready && ram_r_valid_i && ram_r_last_i && r_state_ram;
  assign w_finish_0 = b_valid_o_0 && b_ready_i_0 && w_state_0;
  assign w_finish_1 = b_valid_o_1 && b_ready_i_1 && w_state_1;
  assign w_finish_cli = cli_b_ready_o && cli_b_valid_i && w_state_cli;
  assign w_finish_ram = ram_b_ready_o && ram_b_valid_i && w_state_ram;

  // Write Output
  
  // master side
  // to MEM
  assign aw_ready_o_0  = w_state_0                   & mid_aw_ready;
  assign w_ready_o_0   = w_state_0                   & mid_w_ready;
  assign b_valid_o_0   = w_state_0                   & mid_b_valid;
  assign b_resp_o_0    = {2{w_state_0}}              & mid_b_resp;
  assign b_id_o_0      = {AXI_ID_WIDTH{w_state_0}}   & mid_b_id;
  
  // to IF
  assign aw_ready_o_1  = w_state_1                   & mid_aw_ready;
  assign w_ready_o_1   = w_state_1                   & mid_w_ready;
  assign b_valid_o_1   = w_state_1                   & mid_b_valid;
  assign b_resp_o_1    = {2{w_state_1}}              & mid_b_resp;
  assign b_id_o_1      = {AXI_ID_WIDTH{w_state_1}}   & mid_b_id;

  // bridge side
  assign mid_aw_ready = (
      (w_state_cli & cli_aw_ready_i)
    | (w_state_ram & ram_aw_ready_i)
  );
  assign mid_aw_valid = (
      (w_state_0 & aw_valid_i_0) 
    | (w_state_1 & aw_valid_i_1)
  );
  assign mid_aw_addr = (
      ({AXI_ADDR_WIDTH{w_state_0}} & aw_addr_i_0) 
    | ({AXI_ADDR_WIDTH{w_state_1}} & aw_addr_i_1)
  );
  assign mid_aw_id = (
      ({AXI_ID_WIDTH{w_state_0}} & aw_id_i_0) 
    | ({AXI_ID_WIDTH{w_state_1}} & aw_id_i_1)
  );
  assign mid_aw_len = (
      ({8{w_state_0}} & aw_len_i_0) 
    | ({8{w_state_1}} & aw_len_i_1)
  );
  assign mid_aw_size = (
      ({3{w_state_0}} & aw_size_i_0) 
    | ({3{w_state_1}} & aw_size_i_1)
  );
  assign mid_aw_burst = (
      ({2{w_state_0}} & aw_burst_i_0) 
    | ({2{w_state_1}} & aw_burst_i_1)
  );
  
  assign mid_w_ready = (
      (w_state_cli & cli_w_ready_i)
    | (w_state_ram & ram_w_ready_i)
  );
  assign mid_w_valid = (
      (w_state_0 & w_valid_i_0) 
    | (w_state_1 & w_valid_i_1)
  );
  assign mid_w_data =(
      ({AXI_DATA_WIDTH{w_state_0}} & w_data_i_0) 
    | ({AXI_DATA_WIDTH{w_state_1}} & w_data_i_1)
  );
  assign mid_w_strb = (
      ({8{w_state_0}} & w_strb_i_0) 
    | ({8{w_state_1}} & w_strb_i_1)
  );
  assign mid_w_last = (
      (w_state_0 & w_last_i_0) 
    | (w_state_1 & w_last_i_1)
  );
  
  assign mid_b_ready = (
      (w_state_0 & b_ready_i_0) 
    | (w_state_1 & b_ready_i_1)
  );
  assign mid_b_valid = (
      (w_state_cli & cli_b_valid_i)
    | (w_state_ram & ram_b_valid_i)
  );
  assign mid_b_resp = (
      ({2{w_state_cli}} & cli_b_resp_i)
    | ({2{w_state_ram}} & ram_b_resp_i)
  );
  assign mid_b_id = (
      ({AXI_ID_WIDTH{w_state_cli}} & cli_b_id_i)
    | ({AXI_ID_WIDTH{w_state_ram}} & ram_b_id_i)
  );
  
  // slave side
  assign ram_aw_valid_o = w_state_ram & mid_aw_valid;
  assign ram_aw_addr_o = {AXI_ADDR_WIDTH{w_state_ram}} & mid_aw_addr;
  assign ram_aw_id_o = {AXI_ID_WIDTH{w_state_ram}} & mid_aw_id;
  assign ram_aw_len_o = {8{w_state_ram}} & mid_aw_len;
  assign ram_aw_size_o = {3{w_state_ram}} & mid_aw_size;
  assign ram_aw_burst_o = {2{w_state_ram}} & mid_aw_burst;
  
  assign ram_w_valid_o = w_state_ram & mid_w_valid;
  assign ram_w_data_o = {AXI_DATA_WIDTH{w_state_ram}} & mid_w_data;
  assign ram_w_strb_o = {AXI_DATA_WIDTH/8{w_state_ram}} & mid_w_strb;
  assign ram_w_last_o = w_state_ram & mid_w_last;
  
  assign ram_b_ready_o = w_state_ram & mid_b_ready;

  assign cli_aw_valid_o = w_state_cli & mid_aw_valid;
  assign cli_aw_addr_o = {AXI_ADDR_WIDTH{w_state_cli}} & mid_aw_addr;
  assign cli_aw_id_o = {AXI_ID_WIDTH{w_state_cli}} & mid_aw_id;
  assign cli_aw_size_o = {3{w_state_cli}} & mid_aw_size;
  
  assign cli_w_valid_o = w_state_cli & mid_w_valid;
  assign cli_w_data_o = {AXI_DATA_WIDTH{w_state_cli}} & mid_w_data;
  assign cli_w_strb_o = {AXI_DATA_WIDTH/8{w_state_cli}} & mid_w_strb;
  assign cli_w_last_o = w_state_cli & mid_w_last;
  
  assign cli_b_ready_o = w_state_cli & mid_b_ready;

  // Read Output
  
  // master side
  // to MEM
  assign ar_ready_o_0  = r_state_0                    & mid_ar_ready;
  assign r_valid_o_0   = r_state_0                    & mid_r_valid;
  assign r_resp_o_0    = {2{r_state_0}}               & mid_r_resp;
  assign r_data_o_0    = {AXI_DATA_WIDTH{r_state_0}}  & mid_r_data;
  assign r_last_o_0    = r_state_0                    & mid_r_last;
  assign r_id_o_0      = {AXI_ID_WIDTH{r_state_0}}    & mid_r_id;
  
  // to IF
  assign ar_ready_o_1  = r_state_1                    & mid_ar_ready;
  assign r_valid_o_1   = r_state_1                    & mid_r_valid;
  assign r_resp_o_1    = {2{r_state_1}}               & mid_r_resp;
  assign r_data_o_1    = {AXI_DATA_WIDTH{r_state_1}}  & mid_r_data;
  assign r_last_o_1    = r_state_1                    & mid_r_last;
  assign r_id_o_1      = {AXI_ID_WIDTH{r_state_1}}    & mid_r_id;
  
  // bridge side
  assign mid_ar_ready = (
      (r_state_cli & cli_ar_ready_i)
    | (r_state_ram & ram_ar_ready_i)
  );
  assign mid_ar_valid = (
      (r_state_0 & ar_valid_i_0) 
    | (r_state_1 & ar_valid_i_1)
  );
  assign mid_ar_addr = (
      ({AXI_ADDR_WIDTH{r_state_0}} & ar_addr_i_0) 
    | ({AXI_ADDR_WIDTH{r_state_1}} & ar_addr_i_1)
  );
  assign mid_ar_id = (
      ({AXI_ID_WIDTH{r_state_0}} & ar_id_i_0) 
    | ({AXI_ID_WIDTH{r_state_1}} & ar_id_i_1)
  );
  assign mid_ar_len = (
      ({8{r_state_0}} & ar_len_i_0) 
    | ({8{r_state_1}} & ar_len_i_1)
  );
  assign mid_ar_size = (
      ({3{r_state_0}} & ar_size_i_0) 
    | ({3{r_state_1}} & ar_size_i_1)
  );
  assign mid_ar_burst = (
      ({2{r_state_0}} & ar_burst_i_0) 
    | ({2{r_state_1}} & ar_burst_i_1)
  );
    
  assign mid_r_ready = (
      (r_state_0 & r_ready_i_0) 
    | (r_state_1 & r_ready_i_1)
  );
  assign mid_r_valid = (
      (r_state_cli & cli_r_valid_i)
    | (r_state_ram & ram_r_valid_i)
  );
  assign mid_r_resp = (
      ({2{r_state_cli}} & cli_r_resp_i)
    | ({2{r_state_ram}} & ram_r_resp_i)
  );
  assign mid_r_data = (
      ({AXI_DATA_WIDTH{r_state_cli}} & cli_r_data_i)
    | ({AXI_DATA_WIDTH{r_state_ram}} & ram_r_data_i)
  );
  assign mid_r_last = (
      (r_state_cli & cli_r_last_i)
    | (r_state_ram & ram_r_last_i)
  );
  assign mid_r_id = (
      ({AXI_ID_WIDTH{r_state_cli}} & cli_r_id_i)
    | ({AXI_ID_WIDTH{r_state_ram}} & ram_r_id_i)
  );
  
  // slave side
  assign ram_ar_valid_o = r_state_ram & mid_ar_valid;
  assign ram_ar_addr_o = {AXI_ADDR_WIDTH{r_state_ram}} & mid_ar_addr;
  assign ram_ar_id_o = {AXI_ID_WIDTH{r_state_ram}} & mid_ar_id;
  assign ram_ar_len_o = {8{r_state_ram}} & mid_ar_len;
  assign ram_ar_size_o = {3{r_state_ram}} & mid_ar_size;
  assign ram_ar_burst_o = {2{r_state_ram}} & mid_ar_burst;
  
  assign ram_r_ready_o = r_state_ram & mid_r_ready;

  assign cli_ar_valid_o = r_state_cli & mid_ar_valid;
  assign cli_ar_addr_o = {AXI_ADDR_WIDTH{r_state_cli}} & mid_ar_addr;
  assign cli_ar_id_o = {AXI_ID_WIDTH{r_state_cli}} & mid_ar_id;
  assign cli_ar_size_o = {3{r_state_cli}} & mid_ar_size;
  
  assign cli_r_ready_o = r_state_cli & mid_r_ready;
endmodule

// Burst types
`define YSYX210611_AXI_BURST_TYPE_FIXED                                2'b00
`define YSYX210611_AXI_BURST_TYPE_INCR                                 2'b01
`define YSYX210611_AXI_BURST_TYPE_WRAP                                 2'b10
// Access permissions
`define YSYX210611_AXI_PROT_UNPRIVILEGED_ACCESS                        3'b000
`define YSYX210611_AXI_PROT_PRIVILEGED_ACCESS                          3'b001
`define YSYX210611_AXI_PROT_SECURE_ACCESS                              3'b000
`define YSYX210611_AXI_PROT_NON_SECURE_ACCESS                          3'b010
`define YSYX210611_AXI_PROT_DATA_ACCESS                                3'b000
`define YSYX210611_AXI_PROT_INSTRUCTION_ACCESS                         3'b100
// Memory types (AR)
`define YSYX210611_AXI_ARCACHE_DEVICE_NON_BUFFERABLE                   4'b0000
`define YSYX210611_AXI_ARCACHE_DEVICE_BUFFERABLE                       4'b0001
`define YSYX210611_AXI_ARCACHE_NORMAL_NON_CACHEABLE_NON_BUFFERABLE     4'b0010
`define YSYX210611_AXI_ARCACHE_NORMAL_NON_CACHEABLE_BUFFERABLE         4'b0011
`define YSYX210611_AXI_ARCACHE_WRITE_THROUGH_NO_ALLOCATE               4'b1010
`define YSYX210611_AXI_ARCACHE_WRITE_THROUGH_READ_ALLOCATE             4'b1110
`define YSYX210611_AXI_ARCACHE_WRITE_THROUGH_WRITE_ALLOCATE            4'b1010
`define YSYX210611_AXI_ARCACHE_WRITE_THROUGH_READ_AND_WRITE_ALLOCATE   4'b1110
`define YSYX210611_AXI_ARCACHE_WRITE_BACK_NO_ALLOCATE                  4'b1011
`define YSYX210611_AXI_ARCACHE_WRITE_BACK_READ_ALLOCATE                4'b1111
`define YSYX210611_AXI_ARCACHE_WRITE_BACK_WRITE_ALLOCATE               4'b1011
`define YSYX210611_AXI_ARCACHE_WRITE_BACK_READ_AND_WRITE_ALLOCATE      4'b1111
// Memory types (AW)
`define YSYX210611_AXI_AWCACHE_DEVICE_NON_BUFFERABLE                   4'b0000
`define YSYX210611_AXI_AWCACHE_DEVICE_BUFFERABLE                       4'b0001
`define YSYX210611_AXI_AWCACHE_NORMAL_NON_CACHEABLE_NON_BUFFERABLE     4'b0010
`define YSYX210611_AXI_AWCACHE_NORMAL_NON_CACHEABLE_BUFFERABLE         4'b0011
`define YSYX210611_AXI_AWCACHE_WRITE_THROUGH_NO_ALLOCATE               4'b0110
`define YSYX210611_AXI_AWCACHE_WRITE_THROUGH_READ_ALLOCATE             4'b0110
`define YSYX210611_AXI_AWCACHE_WRITE_THROUGH_WRITE_ALLOCATE            4'b1110
`define YSYX210611_AXI_AWCACHE_WRITE_THROUGH_READ_AND_WRITE_ALLOCATE   4'b1110
`define YSYX210611_AXI_AWCACHE_WRITE_BACK_NO_ALLOCATE                  4'b0111
`define YSYX210611_AXI_AWCACHE_WRITE_BACK_READ_ALLOCATE                4'b0111
`define YSYX210611_AXI_AWCACHE_WRITE_BACK_WRITE_ALLOCATE               4'b1111
`define YSYX210611_AXI_AWCACHE_WRITE_BACK_READ_AND_WRITE_ALLOCATE      4'b1111

`define YSYX210611_AXI_SIZE_BYTES_1                                    3'b000
`define YSYX210611_AXI_SIZE_BYTES_2                                    3'b001
`define YSYX210611_AXI_SIZE_BYTES_4                                    3'b010
`define YSYX210611_AXI_SIZE_BYTES_8                                    3'b011
`define YSYX210611_AXI_SIZE_BYTES_16                                   3'b100
`define YSYX210611_AXI_SIZE_BYTES_32                                   3'b101
`define YSYX210611_AXI_SIZE_BYTES_64                                   3'b110
`define YSYX210611_AXI_SIZE_BYTES_128                                  3'b111


module ysyx_210611_axi_rw # (
  parameter RW_DATA_WIDTH     = 64,
  parameter AXI_DATA_WIDTH    = 64,
  parameter AXI_ADDR_WIDTH    = 32,
  parameter AXI_ID_WIDTH      = 4
)(
  input  wire                              clock,
  input  wire                              reset,
  input  wire [AXI_ID_WIDTH-1:0]           device_id,
  
  input  wire                              rw_valid_i,
  output wire                              rw_ready_o,
  input  wire                              rw_req_i,
  output reg [RW_DATA_WIDTH-1:0]           data_read_o,
  input  wire [RW_DATA_WIDTH-1:0]          data_write_i,
  input  wire [AXI_DATA_WIDTH-1:0]         rw_addr_i,
  input  wire [1:0]                        rw_size_i,
  output wire [1:0]                        rw_resp_o,
  
  // Advanced eXtensible Interface
  input  wire                              axi_aw_ready_i,
  output wire                              axi_aw_valid_o,
  output wire [AXI_ADDR_WIDTH-1:0]         axi_aw_addr_o,
  output wire [AXI_ID_WIDTH-1:0]           axi_aw_id_o,
  output wire [7:0]                        axi_aw_len_o,
  output wire [2:0]                        axi_aw_size_o,
  output wire [1:0]                        axi_aw_burst_o,
  
  input  wire                              axi_w_ready_i,
  output wire                              axi_w_valid_o,
  output reg [AXI_DATA_WIDTH-1:0]          axi_w_data_o,
  output reg [AXI_DATA_WIDTH/8-1:0]        axi_w_strb_o,
  output wire                              axi_w_last_o,
  
  output wire                              axi_b_ready_o,
  input  wire                              axi_b_valid_i,
  input  wire [1:0]                        axi_b_resp_i,
  input  wire [AXI_ID_WIDTH-1:0]           axi_b_id_i,
  
  input  wire                              axi_ar_ready_i,
  output wire                              axi_ar_valid_o,
  output wire [AXI_ADDR_WIDTH-1:0]         axi_ar_addr_o,
  output wire [AXI_ID_WIDTH-1:0]           axi_ar_id_o,
  output wire [7:0]                        axi_ar_len_o,
  output wire [2:0]                        axi_ar_size_o,
  output wire [1:0]                        axi_ar_burst_o,
  
  output wire                              axi_r_ready_o,
  input  wire                              axi_r_valid_i,
  input  wire [1:0]                        axi_r_resp_i,
  input  wire [AXI_DATA_WIDTH-1:0]         axi_r_data_i,
  input  wire                              axi_r_last_i,
  input  wire [AXI_ID_WIDTH-1:0]           axi_r_id_i
);
  
  wire w_trans    = rw_req_i == `YSYX210611_REQ_WRITE;
  wire r_trans    = rw_req_i == `YSYX210611_REQ_READ;
  wire w_valid    = rw_valid_i & w_trans;
  wire r_valid    = rw_valid_i & r_trans;
  
  // handshake
  wire aw_hs      = axi_aw_ready_i & axi_aw_valid_o;
  wire w_hs       = axi_w_ready_i  & axi_w_valid_o;
  wire b_hs       = axi_b_ready_o  & axi_b_valid_i;
  wire ar_hs      = axi_ar_ready_i & axi_ar_valid_o;
  wire r_hs       = axi_r_ready_o  & axi_r_valid_i;
  
  wire w_done     = w_hs & axi_w_last_o;
  wire r_done     = r_hs & axi_r_last_i;
  wire trans_done = w_trans ? b_hs : r_done;
  
  
  // ------------------State Machine------------------
  wire [2:0] W_STATE_IDLE = 3'b000, W_STATE_ADDR = 3'b001, W_STATE_WRITE = 3'b010, W_STATE_RESP = 3'b011, W_STATE_RETN = 3'b100;
  wire [2:0] R_STATE_IDLE = 3'b000, R_STATE_ADDR = 3'b001, R_STATE_READ  = 3'b010, R_STATE_RETN = 3'b011;
  reg [2:0] w_state, r_state;
  wire w_state_idle = w_state == W_STATE_IDLE, w_state_addr = w_state == W_STATE_ADDR, w_state_write = w_state == W_STATE_WRITE, w_state_resp = w_state == W_STATE_RESP;
  wire r_state_idle = r_state == R_STATE_IDLE, r_state_addr = r_state == R_STATE_ADDR, r_state_read  = r_state == R_STATE_READ;
  
  // Wirte State Machine
  always @(posedge clock) begin
    if (reset) begin
      w_state <= R_STATE_IDLE;
    end
    else begin
      if (w_valid) begin
        case (w_state)
          W_STATE_IDLE:               w_state <= W_STATE_ADDR;
          W_STATE_ADDR:  if (aw_hs)   w_state <= W_STATE_WRITE;
          W_STATE_WRITE: if (w_done)  w_state <= W_STATE_RESP;
          W_STATE_RESP:  if (b_hs)    w_state <= W_STATE_RETN;
          W_STATE_RETN:               w_state <= W_STATE_IDLE;
          default:                    w_state <= W_STATE_IDLE;
        endcase
       end
    end
  end
  
  // Read State Machine
  always @(posedge clock) begin
    if (reset) begin
      r_state <= R_STATE_IDLE;
    end
    else begin
      if (r_valid) begin
        case (r_state)
          R_STATE_IDLE:               r_state <= R_STATE_ADDR;
          R_STATE_ADDR: if (ar_hs)    r_state <= R_STATE_READ;
          R_STATE_READ: if (r_done)   r_state <= R_STATE_RETN;
          R_STATE_RETN:               r_state <= R_STATE_IDLE;
          default:                    r_state <= R_STATE_IDLE;
        endcase
      end
    end
  end

  // ------------------Process Data------------------
  
  wire aligned            = rw_addr_i[3-1:0] == 0;
  wire size_b             = rw_size_i == `YSYX210611_SIZE_B;
  wire size_h             = rw_size_i == `YSYX210611_SIZE_H;
  wire size_w             = rw_size_i == `YSYX210611_SIZE_W;
  wire size_d             = rw_size_i == `YSYX210611_SIZE_D;
  wire [3:0] addr_op1     = {{1{1'b0}}, rw_addr_i[2:0]};
  wire [3:0] addr_op2     = ({4{size_b}} & {4'b0})
                          | ({4{size_h}} & {4'b1})
                          | ({4{size_w}} & {4'b11})
                          | ({4{size_d}} & {4'b111})
                            ;
  wire [3:0] addr_end     = addr_op1 + addr_op2;
  wire overstep           = addr_end[3] != 0;
  
  wire [7:0] axi_len      = aligned ? 0 : {{7{1'b0}}, overstep};
  wire [2:0] axi_size     = {1'b0, rw_size_i};
  wire [AXI_ADDR_WIDTH-1:0] axi_addr          = rw_addr_i[31:0];
  wire [5:0] aligned_offset_l    = {{3{1'b0}}, {rw_addr_i[2:0]}} << 3;
  wire [5:0] aligned_offset_h    = -aligned_offset_l;
  wire [127:0] mask                          = (({128{size_b}} & {{128-8{1'b0}}, 8'hff})
                                              | ({128{size_h}} & {{128-16{1'b0}}, 16'hffff})
                                              | ({128{size_w}} & {{128-32{1'b0}}, 32'hffffffff})
                                              | ({128{size_d}} & {{128-64{1'b0}}, 64'hffffffff_ffffffff})
                                                ) << aligned_offset_l;
  wire [AXI_DATA_WIDTH-1:0] mask_l      = mask[AXI_DATA_WIDTH-1:0];
  wire [AXI_DATA_WIDTH-1:0] mask_h      = mask[127:AXI_DATA_WIDTH];
  
  wire [AXI_ID_WIDTH-1:0] axi_id        = device_id;
  
  // ------------------Number of transmission------------------
  reg [7:0] len;
  wire len_reset      = reset | (w_trans & w_state_idle) | (r_trans & r_state_idle);
  wire len_incr_en    = (len != axi_len) & (w_hs | r_hs);
  always @(posedge clock) begin
    if (len_reset) begin
      len <= 0;
    end
    else if (len_incr_en) begin
      len <= len + 1;
    end
  end

  reg rw_ready;
  wire rw_ready_nxt = trans_done;
  wire rw_ready_en      = trans_done | rw_ready;
  always @(posedge clock) begin
    if (reset) begin
      rw_ready <= 0;
    end
    else if (rw_ready_en) begin
      rw_ready <= rw_ready_nxt;
    end
  end
  assign rw_ready_o     = rw_ready;
  
  reg [1:0] rw_resp;
  wire [1:0] rw_resp_nxt = w_trans ? axi_b_resp_i : axi_r_resp_i;
  wire resp_en = trans_done;
  always @(posedge clock) begin
    if (reset) begin
      rw_resp <= 0;
    end
    else if (resp_en) begin
      rw_resp <= rw_resp_nxt;
    end
  end
  assign rw_resp_o      = rw_resp;
  
  
  // ------------------Write Transaction------------------
  
  // Write address channel signals
  assign axi_aw_valid_o   = w_state_addr;
  assign axi_aw_addr_o    = axi_addr;
  assign axi_aw_id_o      = {AXI_ID_WIDTH{w_state_addr}} & axi_id;
  assign axi_aw_len_o     = {8{w_state_addr}} & axi_len;
  assign axi_aw_size_o    = {3{w_state_addr}} & axi_size;
  assign axi_aw_burst_o   = `YSYX210611_AXI_BURST_TYPE_INCR;
  
  // Write data channel signals
  assign axi_w_valid_o    = w_state_write;
  always @(posedge clock) begin
    if (reset) begin
      axi_w_data_o <= `YSYX210611_ZERO_WORD;
      axi_w_strb_o <= 8'b0;
    end
    else if (aw_hs) begin
      axi_w_data_o <= (
          ({64{size_b}} & {8{data_write_i[7 :0]}})
        | ({64{size_h}} & {4{data_write_i[15:0]}})
        | ({64{size_w}} & {2{data_write_i[31:0]}})
        | ({64{size_d}} & {1{data_write_i[63:0]}})
      );
      axi_w_strb_o <= (
          ({8{size_b}} & 8'b00000001)
        | ({8{size_h}} & 8'b00000011)
        | ({8{size_w}} & 8'b00001111)
        | ({8{size_d}} & 8'b11111111)
      ) << rw_addr_i[2:0];
    end
  end
  assign axi_w_last_o     = axi_w_valid_o;
  
  // Write response channel signals
  assign axi_b_ready_o    = w_state_resp;
  
  // ------------------Read Transaction------------------
  
  // Read address channel signals
  assign axi_ar_valid_o   = r_state_addr;
  //assign axi_ar_addr_o    = {AXI_DATA_WIDTH{r_state_addr}} & axi_addr;
  assign axi_ar_addr_o    = axi_addr;
  assign axi_ar_id_o      = {AXI_ID_WIDTH{r_state_addr}} & axi_id;
  assign axi_ar_len_o     = {8{r_state_addr}} & axi_len;
  assign axi_ar_size_o    = {3{r_state_addr}} & axi_size;
  assign axi_ar_burst_o   = `YSYX210611_AXI_BURST_TYPE_INCR;
  
  // Read data channel signals
  assign axi_r_ready_o    = r_state_read;
  
  wire [AXI_DATA_WIDTH-1:0] axi_r_data_l  = (axi_r_data_i & mask_l) >> aligned_offset_l;
  wire [AXI_DATA_WIDTH-1:0] axi_r_data_h  = (axi_r_data_i & mask_h) << aligned_offset_h;
  
  genvar i;
  generate
    for (i = 0; i < 1; i = i + 1) begin:gen
      always @(posedge clock) begin
        if (reset) begin
          data_read_o[i*AXI_DATA_WIDTH+:AXI_DATA_WIDTH] <= 0;
        end
        else if (r_hs) begin
          if (~aligned & overstep) begin
            if (len[0]) begin
              data_read_o[AXI_DATA_WIDTH-1:0] <= data_read_o[AXI_DATA_WIDTH-1:0] | axi_r_data_h;
            end
            else begin
              data_read_o[AXI_DATA_WIDTH-1:0] <= axi_r_data_l;
            end
          end
          else if (len == i) begin
            data_read_o[i*AXI_DATA_WIDTH+:AXI_DATA_WIDTH] <= axi_r_data_l;
          end
        end
      end
    end
  endgenerate
  
endmodule

module ysyx_210611_clint # (
  parameter AXI_ID_WIDTH      = 4
)(
  input  wire                             clk,
  input  wire                             rst,

  // AXI bus
  output wire                             aw_ready_o,
  input  wire                             aw_valid_i,
  input  wire [31:0]                      aw_addr_i,
  input  wire [3:0]                       aw_id_i,
  input  wire [2:0]                       aw_size_i,
  
  output wire                             w_ready_o,
  input  wire                             w_valid_i,
  input  wire [63:0]                      w_data_i,
  input  wire [7:0]                       w_strb_i,
  input  wire                             w_last_i,
   
  input  wire                             b_ready_i,
  output wire                             b_valid_o,
  output wire [1:0]                       b_resp_o,
  output wire [3:0]                       b_id_o,
  
  output wire                             ar_ready_o,
  input  wire                             ar_valid_i,
  input  wire [31:0]                      ar_addr_i,
  input  wire [3:0]                       ar_id_i,
  input  wire [2:0]                       ar_size_i,
  
  input  wire                             r_ready_i,
  output wire                             r_valid_o,
  output wire [1:0]                       r_resp_o,
  output wire [63:0]                      r_data_o,
  output wire                             r_last_o,
  output wire [3:0]                       r_id_o,

  // interupt bus to core
  output wire [`YSYX210611_ITRP_BUS]      clint_interupt_bus
);

  // CLINT CSRs
  reg [31 : 0]   csr_msip;
  reg [`YSYX210611_REG_BUS] csr_mtime, csr_mtimecmp;

  wire ar_hs  = ar_valid_i && ar_ready_o;
  wire r_hs   = r_valid_o  && r_ready_i;
  wire aw_hs  = aw_valid_i && aw_ready_o;
  wire w_hs   = w_valid_i  && w_ready_o;
  wire b_hs   = b_valid_o  && b_ready_i;
  
  /* ------Read Bus------ */

  // Read State Machine
  wire R_STATE_IDLE = 1'b0, R_STATE_READ = 1'b1;
  reg r_state;
  wire r_state_idle = r_state == R_STATE_IDLE;
  wire r_state_read = r_state == R_STATE_READ;

  always @(posedge clk) begin
    if (rst) begin
      r_state <= R_STATE_IDLE;
    end
    else begin
      case (r_state)
        R_STATE_IDLE: if (ar_hs) r_state <= R_STATE_READ;
        R_STATE_READ: if (r_hs)  r_state <= R_STATE_IDLE;
      endcase
    end
  end
  
  // ar bus
  assign ar_ready_o = r_state_idle && ar_valid_i;
  reg [31:0] rd_addr_reg;
  reg [3:0]  rd_id_reg;
  reg [2:0]  rd_size_reg;
  always @(posedge clk) begin
    if (rst) begin
      rd_addr_reg <= 32'b0; 
      rd_id_reg   <= 4'b0;
      rd_size_reg <= 3'b0;
    end
    else if (ar_hs) begin
      rd_addr_reg <= ar_addr_i;
      rd_id_reg   <= ar_id_i;
      rd_size_reg <= ar_size_i;
    end
    else if (r_hs) begin
      rd_addr_reg <= 0;
    end
  end
  
  wire rd_size_b = rd_size_reg == 3'b000;
  wire rd_size_h = rd_size_reg == 3'b001;
  wire rd_size_w = rd_size_reg == 3'b010;
  wire rd_size_d = rd_size_reg == 3'b011;

  // r bus
  assign r_valid_o = r_state_read;
  assign r_resp_o  = 2'b0;

  wire msip_rd_ena      = (rd_addr_reg == 32'h02000000);
  wire mtimecmp_rd_ena  = (rd_addr_reg == 32'h02004000);
  wire mtime_rd_ena     = (rd_addr_reg == 32'h0200BFF8);
  wire [63:0] clint_rd_val = (
      ({64{msip_rd_ena}}     & {{32{csr_msip[31]}}, csr_msip})
    | ({64{mtimecmp_rd_ena}} & csr_mtimecmp)
    | ({64{mtime_rd_ena}}    & csr_mtime)
  ) >> rd_addr_reg[2:0];
  assign r_data_o  = (
      ({64{rd_size_b}} & {8{clint_rd_val[7:0]}})
    | ({64{rd_size_h}} & {4{clint_rd_val[15:0]}})
    | ({64{rd_size_w}} & {2{clint_rd_val[31:0]}})
    | ({64{rd_size_d}} & {1{clint_rd_val[63:0]}})
  );

  assign r_last_o  = R_STATE_READ;
  assign r_id_o    = rd_id_reg;
  
  /* ------Write Bus------ */

  // Write State Machine
  wire [1:0] W_STATE_IDLE = 2'b00, W_STATE_WRITE = 2'b01, W_STATE_RESP = 2'b10;
  reg [1 : 0] w_state;
  wire w_state_idle  = w_state == W_STATE_IDLE;
  wire w_state_write = w_state == W_STATE_WRITE;
  wire w_state_resp  = w_state == W_STATE_RESP;
  
  always @(posedge clk) begin
    if (rst) begin
      w_state <= W_STATE_IDLE;
    end
    else begin
      case (w_state)
        W_STATE_IDLE:
          if (aw_hs) 
            w_state <= W_STATE_WRITE;
        W_STATE_WRITE:
          if (w_hs && w_last_i)
            w_state <= W_STATE_RESP;
        W_STATE_RESP:
          if (b_hs)
            w_state <= W_STATE_IDLE;
        default:
          w_state <= W_STATE_IDLE;
      endcase
    end
  end

  // aw bus
  assign aw_ready_o = w_state_idle && aw_valid_i;
  reg [31:0]               wr_addr_reg;
  reg [AXI_ID_WIDTH-1:0]   wr_id_reg;
  reg [2:0]                wr_size_reg;
  always @(posedge clk) begin
    if (rst) begin
      wr_addr_reg <= 32'b0;
      wr_id_reg   <= 4'b0;
      wr_size_reg <= 3'b0;
    end
    else if (aw_hs) begin
      wr_addr_reg <= aw_addr_i;
      wr_id_reg   <= aw_id_i;
      wr_size_reg <= aw_size_i;
    end
    else if (w_hs) begin
      wr_addr_reg <= 0;
    end
  end
  
  wire wr_size_b = wr_size_reg == 3'b000;
  wire wr_size_h = wr_size_reg == 3'b001;
  wire wr_size_w = wr_size_reg == 3'b010;
  wire wr_size_d = wr_size_reg == 3'b011;

  // w bus
  assign w_ready_o = w_state_write && w_valid_i;
  wire [7:0] mask_size  = (
      ({8{wr_size_b}} & 8'b00000001)
    | ({8{wr_size_h}} & 8'b00000011)
    | ({8{wr_size_w}} & 8'b00001111)
    | ({8{wr_size_d}} & 8'b11111111)
  ) << wr_addr_reg[2:0];
  wire [7:0] mask_8bits = w_strb_i & mask_size;
  wire [`YSYX210611_REG_BUS] wr_mask = {
    {8{mask_8bits[7]}},
    {8{mask_8bits[6]}},
    {8{mask_8bits[5]}},
    {8{mask_8bits[4]}},
    {8{mask_8bits[3]}},
    {8{mask_8bits[2]}},
    {8{mask_8bits[1]}},
    {8{mask_8bits[0]}}
  };
  wire msip_wr_ena     = (wr_addr_reg == 32'h02000000);
  wire mtimecmp_wr_ena = (wr_addr_reg == 32'h02004000);
  wire mtime_wr_ena    = (wr_addr_reg == 32'h0200BFF8);
  // msip
  always @(posedge clk) begin
    if (rst) begin
      csr_msip <= 32'b0;
    end
    else if (w_hs && msip_wr_ena) begin
      csr_msip <= (~wr_mask[31:0] & csr_msip) | (wr_mask[31:0] & w_data_i[31:0]);
    end
  end
  
  // mtimecmp
  always @(posedge clk) begin
    if (rst) begin
      csr_mtimecmp <= 64'b0;
    end
    else if (w_hs && mtimecmp_wr_ena) begin
        csr_mtimecmp <= (~wr_mask & csr_mtimecmp) | (wr_mask & w_data_i);
    end
  end

  // mtime
  always @(posedge clk) begin
    if (rst) begin
      csr_mtime <= 64'b0;
    end
    else if (w_hs && mtime_wr_ena) begin
      csr_mtime <= (~wr_mask & csr_mtime) | (wr_mask & w_data_i);
    end 
    else begin
      csr_mtime <= csr_mtime + 1;
    end
  end
  
  // b bus
  assign b_valid_o = w_state_resp; 
  assign b_resp_o  = 2'b0;
  assign b_id_o    = wr_id_reg;
  
  /* ------Generate CLINT------ */
  assign clint_interupt_bus = {
    4'b0,                      // 11:8
    csr_mtime >= csr_mtimecmp, // 7:7
    7'b0                       // 6:0
  };
  //assign clint_interupt_bus [`TIMER_ITRP] = csr_mtime >= csr_mtimecmp;
endmodule

module ysyx_210611_cpu(
  input wire                            clock,
  input wire                            reset,
  
  // Custom interface

  // if stage
  output wire                           if_rw_valid,
  input wire                            if_rw_ready,
  input wire [`YSYX210611_REG_BUS]      if_r_data,
  output wire [`YSYX210611_REG_BUS]     if_rw_addr,
  output wire [1 : 0]                   if_rw_size,
  input wire [1 : 0]                    if_rw_resp,
  
  // mem stage
  output wire                           mem_rw_valid,
  input wire                            mem_rw_ready,
  output wire                           mem_rw_req,
  input wire [`YSYX210611_REG_BUS]      mem_r_data,
  output wire [`YSYX210611_REG_BUS]     mem_w_data,
  output wire [`YSYX210611_REG_BUS]     mem_rw_addr,
  output wire [1 : 0]                   mem_rw_size,
  input wire [1 : 0]                    mem_rw_resp,

  input wire [`YSYX210611_ITRP_BUS]     clint_interupt_bus
);

  // pipeline control
  wire if_to_id_valid, id_to_ex_valid, ex_to_mem_valid, mem_to_wb_valid;
  wire id_allowin, ex_allowin, mem_allowin, wb_allowin;
  wire ex_to_mem_handshake;
  wire [`YSYX210611_REG_BUS]                if_to_id_pc, id_to_ex_pc;
  wire [`YSYX210611_INST_BUS]               if_to_id_inst, id_to_ex_inst;
  wire [`YSYX210611_ID_TO_EX_WIDTH-1:0]     id_to_ex_bus;
  wire [`YSYX210611_EX_TO_MEM_WIDTH-1:0]    ex_to_mem_bus;
  wire [`YSYX210611_MEM_TO_WB_WIDTH-1:0]    mem_to_wb_bus;
  
  // branch and jump bus
  wire [`YSYX210611_BJ_CTRL_WIDTH-1:0]      bj_ctrl_bus;

  // pipeline forward control bus
  wire [`YSYX210611_MEM_FORWARD_WIDTH-1:0]  mem_forward_bus;
  wire [`YSYX210611_WB_FORWARD_WIDTH-1:0]   wb_forward_bus;
  
  wire if_bj_ready;

  // ex_stage <-> regfile
  wire rs1_r_ena;
  wire [4 : 0]rs1_r_addr;
  wire [`YSYX210611_REG_BUS] r_data1;
  wire rs2_r_ena;
  wire [4 : 0]rs2_r_addr;
  wire [`YSYX210611_REG_BUS] r_data2;
  // wb_stage <-> regfile
  wire reg_wr_ena;
  wire [4 : 0] reg_wr_addr;
  wire [`YSYX210611_REG_BUS] reg_wr_data;

  // id stage <-> csrfile
  wire            csr_rd_ena;
  wire [11 : 0]   csr_rd_addr;
  wire [`YSYX210611_REG_BUS] csr_rd_data;
  // ex stage <=> csrfile
  wire            csr_wr_ena;
  wire [11 : 0]   csr_wr_addr;
  wire [`YSYX210611_REG_BUS] csr_wr_data;
  // excption control
  wire                      excp_enter, excp_exit;
  wire [`YSYX210611_EXCP_RD_WIDTH-1:0] csr_excp_rd_bus;
  wire [`YSYX210611_EXCP_WR_WIDTH-1:0] csr_excp_wr_bus;

  // IF stage
  ysyx_210611_if_stage ysyx_210611_If_stage(
    .clk                       (clock),
    .rst                       (reset),
    
    // pipeline control
    .if_to_id_valid            (if_to_id_valid),
    .if_to_id_pc               (if_to_id_pc),
    .if_to_id_inst             (if_to_id_inst),
    .id_allowin                (id_allowin),
    
    // branch and jump control
    .if_bj_ready               (if_bj_ready),
    .bj_ctrl_bus               (bj_ctrl_bus),
    //.excp_jmp_ena(excp_jmp_ena),
    //.excp_pc(excp_pc),
    
    // Custom Interface
    .if_axi_valid              (if_rw_valid),
    .if_axi_ready              (if_rw_ready),
    .if_axi_data_read          (if_r_data),
    .if_axi_addr               (if_rw_addr),
    .if_axi_size               (if_rw_size),
    .if_axi_resp               (if_rw_resp)
  );

  // ID stage
  ysyx_210611_id_stage ysyx_210611_Id_stage(
    .clk                       (clock),
    .rst                       (reset),
  
    // pipeline control
    .if_to_id_valid            (if_to_id_valid),
    .if_to_id_pc               (if_to_id_pc),
    .if_to_id_inst             (if_to_id_inst),
    .id_allowin                (id_allowin),

    .id_to_ex_valid            (id_to_ex_valid),
    .id_to_ex_pc               (id_to_ex_pc),
    .id_to_ex_inst             (id_to_ex_inst),
    .id_to_ex_bus              (id_to_ex_bus),
    .ex_allowin                (ex_allowin),

    .csr_data                  (csr_rd_data),
    
    // control csr
    .csr_rd_ena                (csr_rd_ena),
    .csr_rd_addr               (csr_rd_addr),

    .bj_ctrl_bus               (bj_ctrl_bus)
  );
  
  ysyx_210611_ex_stage ysyx_210611_Ex_stage(
    .clk(clock),
    .rst(reset),
    
    // pipeline control
    .id_to_ex_valid            (id_to_ex_valid),
    .id_to_ex_pc               (id_to_ex_pc),
    .id_to_ex_inst             (id_to_ex_inst),
    .id_to_ex_bus              (id_to_ex_bus),
    .ex_allowin                (ex_allowin),

    .ex_to_mem_valid           (ex_to_mem_valid),
    .ex_to_mem_bus             (ex_to_mem_bus),
    .mem_allowin               (mem_allowin),
    
    // pipeline forward control
    .mem_forward_bus           (mem_forward_bus),
    .wb_forward_bus            (wb_forward_bus),
    
    // branch and jump control
    .if_bj_ready               (if_bj_ready),
    .bj_ctrl_bus               (bj_ctrl_bus),
    
    // csr control
    .csr_wr_clk                (ex_to_mem_handshake),
    .csr_wr_ena                (csr_wr_ena),
    .csr_wr_addr               (csr_wr_addr),
    .csr_wr_data               (csr_wr_data),
    
    // exception
    .excp_enter                (excp_enter),
    .excp_exit                 (excp_exit),
    .csr_excp_rd_bus           (csr_excp_rd_bus),
    .csr_excp_wr_bus           (csr_excp_wr_bus),
    .clint_interupt_bus        (clint_interupt_bus),

    .ex_rs1_r_ena              (rs1_r_ena),
    .ex_rs1_addr               (rs1_r_addr),
    .ex_rs2_r_ena              (rs2_r_ena),
    .ex_rs2_addr               (rs2_r_addr),
    .rs1_data                  (r_data1),
    .rs2_data                  (r_data2)
  );

  // CSRs
  ysyx_210611_csrfile ysyx_210611_CSRfile(
    .clk                       (clock),
    .rst                       (reset),
    
    .csr_wr_clk                (ex_to_mem_handshake),

    // read: id stage
    .csr_rd_ena                (csr_rd_ena),
    .csr_rd_addr               (csr_rd_addr),
    .csr_rd_data               (csr_rd_data),
    
    // write: ex stages
    .csr_wr_ena                (csr_wr_ena),
    .csr_wr_addr               (csr_wr_addr),
    .csr_wr_data               (csr_wr_data),
    
    // exception
    .csr_excp_rd_bus           (csr_excp_rd_bus),
    .csr_excp_wr_bus           (csr_excp_wr_bus),

    .excp_enter                (excp_enter),
    .excp_exit                 (excp_exit)
  );
  
  // MEM_STAGE
  ysyx_210611_mem_stage ysyx_210611_Mem_stage(
    .clk                       (clock),
    .rst                       (reset),
  
    // pipeline control
    .ex_to_mem_valid           (ex_to_mem_valid),
    .ex_to_mem_bus             (ex_to_mem_bus),
    .mem_allowin               (mem_allowin),
    .ex_to_mem_handshake       (ex_to_mem_handshake),

    .mem_to_wb_valid           (mem_to_wb_valid),
    .mem_to_wb_bus             (mem_to_wb_bus),
    .wb_allowin                (wb_allowin),
    
    // pipeline forward control
    .mem_forward_bus           (mem_forward_bus),

    // Custom interface
    .mem_rw_valid              (mem_rw_valid),
    .mem_rw_ready              (mem_rw_ready),
    .mem_rw_req                (mem_rw_req),
    .mem_r_data                (mem_r_data),
    .mem_w_data                (mem_w_data),
    .mem_rw_addr               (mem_rw_addr),
    .mem_rw_size               (mem_rw_size),
    .mem_rw_resp               (mem_rw_resp)
  );
  
  // WB_STAGE
  ysyx_210611_wb_stage ysyx_210611_Wb_stage(
    .clk                       (clock),
    .rst                       (reset),
    
    // pipeline control
    .mem_to_wb_valid           (mem_to_wb_valid),
    .mem_to_wb_bus             (mem_to_wb_bus),
    .wb_allowin                (wb_allowin),

    .wb_forward_bus            (wb_forward_bus),

    // regfile control
    .reg_wr_ena                (reg_wr_ena),
    .reg_wr_addr               (reg_wr_addr),
    .reg_wr_data               (reg_wr_data)
  );
  
  // General Purpose Registers

  ysyx_210611_regfile ysyx_210611_Regfile(
    .clk                       (clock),
    .rst                       (reset),
    .w_addr                    (reg_wr_addr),
    .w_data                    (reg_wr_data),
    .w_ena                     (reg_wr_ena),
  
    .r_addr1                   (rs1_r_addr),
    .r_data1                   (r_data1),
    .r_ena1                    (rs1_r_ena),
    .r_addr2                   (rs2_r_addr),
    .r_data2                   (r_data2),
    .r_ena2                    (rs2_r_ena)
  );
endmodule

module ysyx_210611_csrfile(
  input wire                                         clk,
  input wire                                         rst,
  
  input wire                                         csr_wr_clk,
  
  // id stage
  input wire                                         csr_rd_ena,
  input wire [11 : 0]                                csr_rd_addr,
  output wire [`YSYX210611_REG_BUS]                  csr_rd_data,
  
  // wb stage
  input wire                                         csr_wr_ena,
  input wire [11 : 0]                                csr_wr_addr,
  input wire [`YSYX210611_REG_BUS]                   csr_wr_data,
  
  // exception
  output wire [`YSYX210611_EXCP_RD_WIDTH-1:0]        csr_excp_rd_bus,
  input wire [`YSYX210611_EXCP_WR_WIDTH-1:0]         csr_excp_wr_bus,
  
  // exception read and write
  input wire                                         excp_enter,
  input wire                                         excp_exit
  );
  
  wire [`YSYX210611_REG_BUS] mip_wr_data, mstatus_wr_data, mepc_wr_data,
                             mcause_wr_data, mtval_wr_data;
  
  wire excp_enter_wr = excp_enter && csr_wr_clk;
  wire excp_exit_wr  = excp_exit  && csr_wr_clk;
  wire excp_wr = excp_enter_wr || excp_exit_wr;

  // 0x300 Machine Status Register
  wire sel_rd_mstatus = (csr_rd_addr == 12'h300);
  wire sel_wr_mstatus = (csr_wr_addr == 12'h300);
  wire mstatus_rd_ena = sel_rd_mstatus && csr_rd_ena;
  wire mstatus_wr_ena = sel_wr_mstatus && csr_wr_ena && csr_wr_clk;
  wire [`YSYX210611_REG_BUS] mstatus_wr_data_full = {
    (mstatus_wr_data[14:13] == 2'b11) || (mstatus_wr_data[16:15] == 2'b11),
    mstatus_wr_data[62:0]
  };
  wire [`YSYX210611_REG_BUS] csr_wr_data_full = {
    (csr_wr_data[14:13] == 2'b11) || (csr_wr_data[16:15] == 2'b11),
    csr_wr_data[62:0]
  };

  reg [`YSYX210611_REG_BUS] csr_mstatus;

  always @(posedge clk) begin
    if (rst) begin
      csr_mstatus <= 64'h1880;
    end
    else if (excp_wr) begin
      csr_mstatus <= 64'h80000000_0001F888 & mstatus_wr_data_full;
    end
    else if (mstatus_wr_ena) begin
      csr_mstatus <= 64'h80000000_0001F888 & csr_wr_data_full;
    end
  end

  wire [`YSYX210611_REG_BUS] mstatus_rd_data = (
    excp_wr        ? mstatus_wr_data_full :
    mstatus_wr_ena ? csr_wr_data_full :
                     csr_mstatus
  );
  
  // 0x301 Machine ISA Register
  wire sel_misa = (csr_rd_addr == 12'h301);
  wire misa_rd_ena = sel_misa & csr_rd_ena;
  wire [`YSYX210611_REG_BUS] csr_misa = {
     32'b0
    ,2'b10
    ,4'b0 //WIRI
    ,1'b0 //              25 Z Reserved
    ,1'b0 //              24 Y Reserved
    ,1'b0 //              23 X Non-standard extensions present
    ,1'b0 //              22 W Reserved
    ,1'b0 //              21 V Tentatively reserved for Vector extension 20 U User mode implemented
    ,1'b0 //              20 U User mode implemented
    ,1'b0 //              19 T Tentatively reserved for Transactional Memory extension
    ,1'b0 //              18 S Supervisor mode implemented
    ,1'b0 //              17 R Reserved
    ,1'b0 //              16 Q Quad-precision floating-point extension
    ,1'b0 //              15 P Tentatively reserved for Packed-SIMD extension
    ,1'b0 //              14 O Reserved
    ,1'b0 //              13 N User-level interrupts supported
    ,1'b0 //              12 M Integer Multiply/Divide extension
    ,1'b0 //              11 L Tentatively reserved for Decimal Floating-Point extension
    ,1'b0 //              10 K Reserved
    ,1'b0 //              9 J Reserved
    ,1'b1 //              8 I RV32I/64I/128I base ISA
    ,1'b0 //              7 H Hypervisor mode implemented
    ,1'b0 //              6 G Additional standard extensions present
    ,1'b0 //              5 F Single-precision floating-point extension
    ,1'b0 //              4 E RV32E base ISA
    ,1'b0 //              3 D Double-precision floating-point extension
    ,1'b0 //              2 C Compressed extension
    ,1'b0 //              1 B Tentatively reserved for Bit operations extension
    ,1'b0 //              0 A Atomic extension
  };

  wire [`YSYX210611_REG_BUS] misa_rd_data = csr_misa;

  // 0x304 Machine Interrupt Enable Register
  wire sel_rd_mie = csr_rd_addr == 12'h304;
  wire sel_wr_mie = csr_wr_addr == 12'h304;
  wire mie_rd_ena = csr_rd_ena && sel_rd_mie;
  wire mie_wr_ena = csr_wr_ena && sel_wr_mie && csr_wr_clk;
  reg [`YSYX210611_REG_BUS] csr_mie;

  always @(posedge clk) begin
    if (rst) begin
      csr_mie <= 64'h888;  // only for machine mode
    end
    else if (mie_wr_ena) begin
      csr_mie <= csr_wr_data;
    end
  end

  wire [`YSYX210611_REG_BUS] mie_rd_data = mie_wr_ena ? csr_wr_data : csr_mie;

  // 0x305 Machine Trap-Vector Base-Address Register
  wire sel_rd_mtvec = (csr_rd_addr == 12'h305);
  wire sel_wr_mtvec = (csr_wr_addr == 12'h305);
  wire mtvec_rd_ena = csr_rd_ena && sel_rd_mtvec;
  wire mtvec_wr_ena = csr_wr_ena && sel_wr_mtvec && csr_wr_clk;
  reg [`YSYX210611_REG_BUS] csr_mtvec;

  always @(posedge clk) begin
    if (rst) begin
      csr_mtvec <= `YSYX210611_ZERO_WORD;
    end
    else if (mtvec_wr_ena) begin
      csr_mtvec <= csr_wr_data;
    end
  end

  wire [`YSYX210611_REG_BUS] mtvec_rd_data = mtvec_wr_ena ? csr_wr_data : csr_mtvec;
  
  // 0x340 Machine Scratch Register
  wire sel_rd_mscratch = (csr_rd_addr == 12'h340);
  wire sel_wr_mscratch = (csr_wr_addr == 12'h340);
  wire mscratch_rd_ena = csr_rd_ena && sel_rd_mscratch;
  wire mscratch_wr_ena = csr_wr_ena && sel_wr_mscratch && csr_wr_clk;
  reg [`YSYX210611_REG_BUS] csr_mscratch;

  always @(posedge clk) begin
    if (rst) begin
      csr_mscratch <= `YSYX210611_ZERO_WORD;
    end
    else if (mscratch_wr_ena) begin
      csr_mscratch <= csr_wr_data;
    end
  end

  wire [`YSYX210611_REG_BUS] mscratch_rd_data = mscratch_wr_ena ? csr_wr_data : csr_mscratch;

  // 0x341 Machine Exception Program Counter
  wire sel_rd_mepc = (csr_rd_addr == 12'h341);
  wire sel_wr_mepc = (csr_wr_addr == 12'h341);
  wire mepc_rd_ena = csr_rd_ena && sel_rd_mepc;
  wire mepc_wr_ena = csr_wr_ena && sel_wr_mepc && csr_wr_clk;
  reg [`YSYX210611_REG_BUS] csr_mepc;

  always @(posedge clk) begin
    if (rst) begin
      csr_mepc <= `YSYX210611_ZERO_WORD;
    end
    else if (excp_enter_wr) begin
      csr_mepc <=  mepc_wr_data;
    end
    else if (mepc_wr_ena) begin
      csr_mepc <= csr_wr_data;
    end
  end
  
  wire [`YSYX210611_REG_BUS] mepc_rd_data = (
    excp_enter  ? mepc_wr_data :
    mepc_wr_ena ? csr_wr_data :
                  csr_mepc
  );

  // 0x342 Machine Cause Register
  wire sel_rd_mcause = (csr_rd_addr == 12'h342);
  wire sel_wr_mcause = (csr_wr_addr == 12'h342);
  wire mcause_rd_ena = csr_rd_ena && sel_rd_mcause;
  wire mcause_wr_ena = csr_wr_ena && sel_wr_mcause && csr_wr_clk;
  reg [`YSYX210611_REG_BUS] csr_mcause;

  always @(posedge clk) begin
    if (rst) begin
      csr_mcause <= `YSYX210611_ZERO_WORD;
    end
    else if (excp_enter_wr) begin
      csr_mcause <=  mcause_wr_data;
    end
    else if (mcause_wr_ena) begin
      csr_mcause <= csr_wr_data;
    end
  end
  
  wire [`YSYX210611_REG_BUS] mcause_rd_data = (
    excp_enter    ? mcause_wr_data :
    mcause_wr_ena ? csr_wr_data :
                    csr_mcause
  );
  
  // 0x343 Machine Trap Value Register
  wire sel_rd_mtval = (csr_rd_addr == 12'h343);
  wire sel_wr_mtval = (csr_wr_addr == 12'h343);
  wire mtval_rd_ena = csr_rd_ena && sel_rd_mtval;
  wire mtval_wr_ena = csr_wr_ena && sel_wr_mtval && csr_wr_clk;
  reg [`YSYX210611_REG_BUS] csr_mtval;
  
  always @(posedge clk) begin
    if (rst) begin
      csr_mtval <= 64'b0;
    end
    else if (excp_enter_wr) begin
      csr_mtval <= mtval_wr_data;
    end
    else if (mtval_wr_ena) begin
      csr_mtval <= csr_wr_data;
    end
  end

  wire [`YSYX210611_REG_BUS] mtval_rd_data = (
    excp_enter   ? mtval_wr_data :
    mtval_wr_ena ? csr_wr_data :
                   csr_mtval
  );

  // 0x344 Machine Interrupt Pending Register
  wire sel_rd_mip = (csr_rd_addr == 12'h344);
  wire mip_rd_ena = csr_rd_ena && sel_rd_mip;
  reg [`YSYX210611_REG_BUS] csr_mip;
  always @(posedge clk) begin
    if (rst) begin
      csr_mip <= 64'h80;
    end
    else begin
      csr_mip <= mip_wr_data;
    end
  end

  wire [`YSYX210611_REG_BUS] mip_rd_data = mip_wr_data;

  // 0xB00 Cycle Counter
  wire sel_rd_mcycle = (csr_rd_addr == 12'hb00);
  wire sel_wr_mcycle = (csr_wr_addr == 12'hb00);
  wire mcycle_rd_ena = csr_rd_ena && sel_rd_mcycle;
  wire mcycle_wr_ena = csr_wr_ena && sel_wr_mcycle && csr_wr_clk;
  reg [`YSYX210611_REG_BUS] csr_mcycle;

  always @(posedge clk) begin
    if (rst) begin
      csr_mcycle <= `YSYX210611_ZERO_WORD;
    end
    else if (mcycle_wr_ena) begin
      csr_mcycle <= csr_wr_data;
    end
    else begin
      csr_mcycle <= csr_mcycle + 64'b1;
    end
  end

  wire [`YSYX210611_REG_BUS] mcycle_rd_data = mcycle_wr_ena ? csr_wr_data : (csr_mcycle + 64'b1);

  // 0xF11 Machine Vendor ID Register
  wire sel_mvendorid = (csr_rd_addr == 12'hf11);
  wire mvendorid_rd_ena = (csr_rd_ena & sel_mvendorid);
  wire [`YSYX210611_REG_BUS] csr_mvendorid = `YSYX210611_ZERO_WORD;
  wire [`YSYX210611_REG_BUS] mvendorid_rd_data = csr_mvendorid;
  
  // 0xF12 Machine Architecture ID Register
  wire sel_marchid= (csr_rd_addr == 12'hf12);
  wire marchid_rd_ena = (csr_rd_ena & sel_marchid);
  wire [`YSYX210611_REG_BUS] csr_marchid = `YSYX210611_ZERO_WORD;
  wire [`YSYX210611_REG_BUS] marchid_rd_data = csr_marchid;
  
  // 0xF13 Machine Implementation ID Register
  wire sel_mimpid= (csr_rd_addr == 12'hf13);
  wire mimpid_rd_ena = (csr_rd_ena & sel_mimpid);
  wire [`YSYX210611_REG_BUS] csr_mimpid = `YSYX210611_ZERO_WORD;
  wire [`YSYX210611_REG_BUS] mimpid_rd_data = csr_mimpid;

  // 0xF14 Hart ID Register
  wire sel_mhartid= (csr_rd_addr == 12'hf14);
  wire mhartid_rd_ena = (csr_rd_ena & sel_mhartid);
  wire [`YSYX210611_REG_BUS] csr_mhartid = `YSYX210611_ZERO_WORD;
  wire [`YSYX210611_REG_BUS] mhartid_rd_data = csr_mhartid;

  assign csr_rd_data = (
      ({64{mstatus_rd_ena}}   & mstatus_rd_data)
    | ({64{misa_rd_ena}}      & misa_rd_data)
    | ({64{mie_rd_ena}}       & mie_rd_data)
    | ({64{mtvec_rd_ena}}     & mtvec_rd_data)
    | ({64{mscratch_rd_ena}}  & mscratch_rd_data)
    | ({64{mepc_rd_ena}}      & mepc_rd_data)
    | ({64{mcause_rd_ena}}    & mcause_rd_data)
    | ({64{mtval_rd_ena}}     & mtval_rd_data)
    | ({64{mip_rd_ena}}       & mip_rd_data)
    | ({64{mcycle_rd_ena}}    & mcycle_rd_data)
    | ({64{mvendorid_rd_ena}} & mvendorid_rd_data)
    | ({64{marchid_rd_ena}}   & marchid_rd_data)
    | ({64{mimpid_rd_ena}}    & mimpid_rd_data)
    | ({64{mhartid_rd_ena}}   & mhartid_rd_data)
  );
  
  assign {
    mip_wr_data,
    mcause_wr_data,
    mepc_wr_data,
    mtval_wr_data,
    mstatus_wr_data
  } = csr_excp_wr_bus;

  assign csr_excp_rd_bus = {
    csr_mstatus,
    csr_mtvec,
    csr_mepc,
    csr_mip,
    csr_mie
  };

endmodule

module ysyx_210611_ex_stage_alu(
  input wire [`YSYX210611_REG_BUS] op1,
  input wire [`YSYX210611_REG_BUS] op2,
  input wire [`YSYX210611_ALU_BUS] alu_info,
  input wire is_word_opt,

  output wire [`YSYX210611_REG_BUS] alu_output,
  output wire [`YSYX210611_BJ_BUS] bj_data
  );
  
  wire op_add  = alu_info[`YSYX210611_ALU_ADD];
  wire op_sub  = alu_info[`YSYX210611_ALU_SUB];
  wire op_slt  = alu_info[`YSYX210611_ALU_SLT];
  wire op_sltu = alu_info[`YSYX210611_ALU_SLTU];
  wire op_xor  = alu_info[`YSYX210611_ALU_XOR];
  wire op_or   = alu_info[`YSYX210611_ALU_OR];
  wire op_and  = alu_info[`YSYX210611_ALU_AND];
  wire op_sll  = alu_info[`YSYX210611_ALU_SLL];
  wire op_srl  = alu_info[`YSYX210611_ALU_SRL];
  wire op_sra  = alu_info[`YSYX210611_ALU_SRA];
  wire op_andn = alu_info[`YSYX210611_ALU_ANDN];
  wire op_wri  = alu_info[`YSYX210611_ALU_WRI];

  // left-shifter and right-shifter
  wire op_shift = op_sll | op_srl | op_sra;
  wire [`YSYX210611_REG_BUS] shifter_op1 = op1;
  wire [`YSYX210611_REG_BUS] shifter_in1 = {64{op_shift}} &
          //   In order to save area and just use one left-shifter, we
          //   convert the right-shift op into left-shift operation
          (
               (op_srl || op_sra) ? 
                 {
    op1[00], op1[01], op1[02], op1[03],
    op1[04], op1[05], op1[06], op1[07],
    op1[08], op1[09], op1[10], op1[11],
    op1[12], op1[13], op1[14], op1[15],
    op1[16], op1[17], op1[18], op1[19],
    op1[20], op1[21], op1[22], op1[23],
    op1[24], op1[25], op1[26], op1[27],
    op1[28], op1[29], op1[30], op1[31],
    op1[32], op1[33], op1[34], op1[35],
    op1[36], op1[37], op1[38], op1[39],
    op1[40], op1[41], op1[42], op1[43],
    op1[44], op1[45], op1[46], op1[47],
    op1[48], op1[49], op1[50], op1[51],
    op1[52], op1[53], op1[54], op1[55],
    op1[56], op1[57], op1[58], op1[59],
    op1[60], op1[61], op1[62],shifter_op1[63]
                 } : shifter_op1
          );
  wire [5 : 0] shifter_in2 = {6{op_shift}} & (is_word_opt ? {1'b0, op2[4 : 0]} : op2[5 : 0]);

  wire [`YSYX210611_REG_BUS] shifter_res = (shifter_in1 << shifter_in2);

  wire [`YSYX210611_REG_BUS] sll_res = shifter_res;
  wire [`YSYX210611_REG_BUS] srl_res =  
                 {
    shifter_res[00],shifter_res[01],shifter_res[02],shifter_res[03],
    shifter_res[04],shifter_res[05],shifter_res[06],shifter_res[07],
    shifter_res[08],shifter_res[09],shifter_res[10],shifter_res[11],
    shifter_res[12],shifter_res[13],shifter_res[14],shifter_res[15],
    shifter_res[16],shifter_res[17],shifter_res[18],shifter_res[19],
    shifter_res[20],shifter_res[21],shifter_res[22],shifter_res[23],
    shifter_res[24],shifter_res[25],shifter_res[26],shifter_res[27],
    shifter_res[28],shifter_res[29],shifter_res[30],shifter_res[31],
    shifter_res[32],shifter_res[33],shifter_res[34],shifter_res[35],
    shifter_res[36],shifter_res[37],shifter_res[38],shifter_res[39],
    shifter_res[40],shifter_res[41],shifter_res[42],shifter_res[43],
    shifter_res[44],shifter_res[45],shifter_res[46],shifter_res[47],
    shifter_res[48],shifter_res[49],shifter_res[50],shifter_res[51],
    shifter_res[52],shifter_res[53],shifter_res[54],shifter_res[55],
    shifter_res[56],shifter_res[57],shifter_res[58],shifter_res[59],
    shifter_res[60],shifter_res[61],shifter_res[62],shifter_res[63]
                 };
  wire [`YSYX210611_REG_BUS] eff_mask = (is_word_opt ? 64'hffffffff : ~(64'b0)) >> shifter_in2;
  wire [`YSYX210611_REG_BUS] sra_res = (srl_res & eff_mask) | (
    ((is_word_opt ? {32'b0, {32{op1[31]}}} : {64{op1[63]}}) & (~eff_mask))
  );

  // add & sub operation
  wire temp_add = op_add;
  wire temp_sub = op_sub | op_slt | op_sltu;
  wire op_addsub = temp_add | temp_sub;
  wire op_unsigned = op_sltu;
  wire [64 : 0] adder_op1 = {~op_unsigned & op1[63], op1};
  wire [64 : 0] adder_op2 = {~op_unsigned & op2[63], op2};
  wire [64 : 0] adder_in1 = {65{op_addsub}} & adder_op1;
  wire [64 : 0] adder_in2 = {65{op_addsub}} & (temp_sub ? (~adder_op2) : (adder_op2));
  wire [64 : 0] adder_cin = temp_sub ? 65'b1 : 65'b0;
  wire [64 : 0] add_res   = adder_in1 + adder_in2 + adder_cin;
  wire [`YSYX210611_REG_BUS] slt_res   = {{63{1'b0}}, (op_slt | op_sltu) & add_res[64]};
  wire [`YSYX210611_REG_BUS] sltu_res  = slt_res;

  // logic operation
  wire [`YSYX210611_REG_BUS] xor_res = op1 ^ op2;
  wire [`YSYX210611_REG_BUS] or_res  = op1 | op2;
  wire [`YSYX210611_REG_BUS] and_res = op1 & op2;
  wire [`YSYX210611_REG_BUS] andn_res = ~op1 & op2;
  wire [`YSYX210611_REG_BUS] wri_res = op1;

  wire [`YSYX210611_REG_BUS] temp_output = ( 
                                 ({64{op_sll}}    & sll_res)
                               | ({64{op_srl}}    & srl_res)
                               | ({64{op_sra}}    & sra_res)
                               | ({64{op_slt}}    & slt_res)
                               | ({64{op_sltu}}   & sltu_res)
                               | ({64{op_add | op_sub}} & add_res[63 : 0])
                               | ({64{op_xor}}    & xor_res)
                               | ({64{op_or}}     & or_res)
                               | ({64{op_and}}    & and_res)
                               | ({64{op_andn}}  & andn_res)
                               | ({64{op_wri}}   & wri_res)
                                 );
  assign alu_output = {is_word_opt ? {32{temp_output[31]}} : temp_output[63 : 32], temp_output[31 : 0]};
  
  wire eq_res = ~(|xor_res);
  assign bj_data[`YSYX210611_BJ_BEQ]  = eq_res;
  assign bj_data[`YSYX210611_BJ_BNE]  = ~eq_res;
  assign bj_data[`YSYX210611_BJ_BLT]  = slt_res[0];
  assign bj_data[`YSYX210611_BJ_BGE]  = ~slt_res[0];
  assign bj_data[`YSYX210611_BJ_BLTU] = sltu_res[0];
  assign bj_data[`YSYX210611_BJ_BGEU] = ~sltu_res[0];
  assign bj_data[`YSYX210611_BJ_JALR] = 1'b1;
  assign bj_data[`YSYX210611_BJ_JAL]  = 1'b1;
endmodule

module ysyx_210611_ex_stage_bj (
  input wire ex_valid,
  input wire [`YSYX210611_BJ_BUS] bj_info,
  input wire [`YSYX210611_BJ_BUS] bj_data,
  input wire [`YSYX210611_REG_BUS] jmp_imm,
  input wire [`YSYX210611_REG_BUS] rs1_data,
  input wire [`YSYX210611_REG_BUS] ex_pc,
  
  output wire bj_ena,
  output wire [`YSYX210611_REG_BUS] new_pc
  );
  
  assign new_pc = jmp_imm + (bj_info[`YSYX210611_BJ_JALR] ? rs1_data : ex_pc);
  assign bj_ena = ex_valid & (|(bj_info & bj_data));
endmodule

module ysyx_210611_ex_stage(
  input wire                                         clk,
  input wire                                         rst,
  
  // pipeline control
  input wire                                         id_to_ex_valid,
  input wire [`YSYX210611_REG_BUS]                   id_to_ex_pc,
  input wire [`YSYX210611_INST_BUS]                  id_to_ex_inst,
  input wire [`YSYX210611_ID_TO_EX_WIDTH-1:0]        id_to_ex_bus,
  output wire                                        ex_allowin,

  output wire                                        ex_to_mem_valid,
  output wire [`YSYX210611_EX_TO_MEM_WIDTH-1:0]      ex_to_mem_bus,
  input wire                                         mem_allowin,
  
  input wire [`YSYX210611_MEM_FORWARD_WIDTH-1:0]     mem_forward_bus,
  input wire [`YSYX210611_WB_FORWARD_WIDTH-1:0]      wb_forward_bus,
  
  input wire                                         if_bj_ready,
  output wire [`YSYX210611_BJ_CTRL_WIDTH-1:0]        bj_ctrl_bus,

  // csr control
  input wire                                         csr_wr_clk,
  output wire                                        csr_wr_ena,
  output wire [11 : 0]                               csr_wr_addr,
  output wire [`YSYX210611_REG_BUS]                  csr_wr_data,

  // exception
  output wire                                        excp_enter,
  output wire                                        excp_exit,
  input wire [`YSYX210611_EXCP_RD_WIDTH-1:0]         csr_excp_rd_bus,
  output wire [`YSYX210611_EXCP_WR_WIDTH-1:0]        csr_excp_wr_bus,
  input wire [`YSYX210611_ITRP_BUS]                  clint_interupt_bus,

  output wire                                        ex_rs1_r_ena,
  output wire [4 : 0]                                ex_rs1_addr,
  output wire                                        ex_rs2_r_ena,
  output wire [4 : 0]                                ex_rs2_addr,
  input wire [`YSYX210611_REG_BUS]                   rs1_data,
  input wire [`YSYX210611_REG_BUS]                   rs2_data
  );
  
  reg itrp_valid;
  wire ex_done;
  wire bj_handshake;
  wire hazard;

  wire [`YSYX210611_INST_BUS]       ex_inst;
  wire [`YSYX210611_REG_BUS]        ex_pc;
  wire [`YSYX210611_REG_BUS]        ex_op1, ex_op2;
  wire                              ex_use_rs1, ex_use_rs2;
  wire                              ex_is_word_opt;
  wire [`YSYX210611_ALU_BUS]        ex_alu_info;
  wire [`YSYX210611_BJ_BUS]         ex_bj_info;
  wire [`YSYX210611_REG_BUS]        ex_jmp_imm;

  wire [`YSYX210611_LOAD_BUS]       ex_load_info;
  wire [`YSYX210611_SAVE_BUS]       ex_save_info;
  wire                              ex_ram_rd_ena, ex_ram_wr_ena;
  
  wire [`YSYX210611_REG_CTRL_BUS]   ex_reg_wr_ctrl;
  wire                              ex_reg_wr_ena, ex_csr_wr_ena;
  wire [4 : 0]                      ex_reg_wr_addr;
  wire [11: 0]                      ex_csr_wr_addr;
  wire [`YSYX210611_REG_BUS]        ex_csr_rd_data;
  
  wire [`YSYX210611_EXCP_BUS]       ex_excp_bus;
  wire                              itrp_allowin;
  wire                              ex_excp_exit, ex_excp_enter;

  wire [`YSYX210611_REG_BUS]        rs1_forward, rs2_forward, true_op1, true_op2;

  wire [`YSYX210611_REG_BUS]        ex_bj_pc, excp_jmp_pc;
  wire                              ex_bj_ena, excp_jmp_ena;
  wire                              ex_bj_valid; // 1: not finish the computation of branch
  
  wire [`YSYX210611_REG_BUS]        ex_ram_wr_src;
  wire [`YSYX210611_REG_BUS]        ex_data;

  // read GPRs
  assign ex_rs1_r_ena = 1'b1;
  assign ex_rs2_r_ena = 1'b1;
  
  // pipeline control
  reg ex_valid;
  wire ex_ready_go;

  reg [`YSYX210611_REG_BUS] id_to_ex_pc_r;
  reg [`YSYX210611_INST_BUS] id_to_ex_inst_r;
  reg [`YSYX210611_ID_TO_EX_WIDTH-1:0] id_to_ex_bus_r;
  
  assign ex_done = ~hazard;
  assign bj_handshake = ex_bj_valid && if_bj_ready;
  assign ex_ready_go = ((~(|ex_bj_info) && ~excp_jmp_ena)|| bj_handshake) && ex_done;
  assign ex_allowin = !ex_valid || ex_ready_go && mem_allowin;
  //assign ex_to_mem_valid = ex_valid && ex_ready_go && ~ex_flush;
  assign ex_to_mem_valid = (ex_valid || itrp_valid) && ex_ready_go;
  
  always @(posedge clk) begin
    if (rst) begin
      ex_valid <= 1'b0;
      id_to_ex_pc_r <= 0;
      id_to_ex_inst_r <= 0;
      id_to_ex_bus_r <= 0;
    end
    else if (ex_allowin) begin
      ex_valid <= id_to_ex_valid;
    end

    if (id_to_ex_valid && ex_allowin) begin
      id_to_ex_pc_r <= id_to_ex_pc;
      id_to_ex_inst_r <= id_to_ex_inst;
      id_to_ex_bus_r <= id_to_ex_bus;
    end
  end
  
  always @(posedge clk) begin
    if (rst) begin
      itrp_valid <= 1'b0;
    end
    else begin
      if (itrp_valid && csr_wr_clk) begin
        itrp_valid <= 1'b0;
      end
      else if (id_to_ex_valid && ex_allowin) begin
        itrp_valid <= itrp_allowin;
      end
    end
  end

  assign ex_pc = id_to_ex_pc_r;
  assign ex_inst = id_to_ex_inst_r;
  assign {
    // exception
    ex_excp_exit,   // 468:468
    ex_excp_bus,    // 467:452

    // -> ex
    ex_rs1_addr,    // 451:447
    ex_rs2_addr,    // 446:442
    ex_op1,         // 441:378
    ex_op2,         // 377:314
    ex_use_rs1,     // 313:313
    ex_use_rs2,     // 312:312
    ex_is_word_opt, // 183:183
    ex_alu_info,    // 182:171
    ex_bj_info,     // 170:163
    ex_jmp_imm,     // 162:99
    
    // -> mem
    ex_load_info,   // 98 :92
    ex_save_info,   // 91 :88
    ex_ram_rd_ena,  // 87 :87
    ex_ram_wr_ena,  // 86 :86
    
    // -> reg
    ex_reg_wr_ctrl, // 85: 83
    ex_reg_wr_ena,  // 82: 82
    ex_reg_wr_addr, // 81 :77

    // -> csr
    ex_csr_wr_ena,  // 76 :76
    ex_csr_wr_addr, // 75 :64
    ex_csr_rd_data  // 63 :0
  } = id_to_ex_bus_r & {`YSYX210611_ID_TO_EX_WIDTH{ex_valid & ~itrp_valid}};
  
  ysyx_210611_forward ysyx_210611_Forward(
    .ex_rs1_addr         (ex_rs1_addr),
    .ex_rs2_addr         (ex_rs2_addr),
    .ex_rs1_data         (rs1_data),
    .ex_rs2_data         (rs2_data),

    .mem_forward_bus     (mem_forward_bus),
    .wb_forward_bus      (wb_forward_bus),

    .rs1_forward         (rs1_forward),
    .rs2_forward         (rs2_forward),

    .hazard              (hazard)
  );
  
  assign                 excp_exit = ex_excp_exit;
  assign                 excp_enter = ex_excp_enter;
  
  ysyx_210611_excp_handler ysyx_210611_Excp_handler(
    .excp_info           (ex_excp_bus),
    .itrp_info           (clint_interupt_bus),
    .now_pc              (ex_pc),
    .now_inst            (ex_inst),
    .mem_addr            (ex_data),
    .excp_exit           (ex_excp_exit),
    .excp_enter          (ex_excp_enter),
    .itrp_allowin        (itrp_allowin),
    
    // to CSRs
    .csr_excp_rd_bus     (csr_excp_rd_bus),
    .csr_excp_wr_bus     (csr_excp_wr_bus),
    
    // to if stage
    .excp_jmp_ena        (excp_jmp_ena),
    .excp_jmp_pc         (excp_jmp_pc),
    
    // to ex stage
    .itrp_valid          (itrp_valid)
  );
  
  assign true_op1 = ex_use_rs1 ? rs1_forward : ex_op1;
  assign true_op2 = ex_use_rs2 ? rs2_forward : ex_op2;
  wire [`YSYX210611_REG_BUS] op1 = {{32{~ex_is_word_opt}} & true_op1[63 : 32], true_op1[31 : 0]};
  wire [`YSYX210611_REG_BUS] op2 = {{32{~ex_is_word_opt}} & true_op2[63 : 32], true_op2[31 : 0]};
  
  // alu -> bj
  wire [`YSYX210611_BJ_BUS] ex_bj_data;
  
  ysyx_210611_ex_stage_alu ysyx_210611_Exe_stage_alu(
    .op1                 (op1),
    .op2                 (op2),
    .alu_info            (ex_alu_info),
    .is_word_opt         (ex_is_word_opt),
    
    .alu_output          (ex_data),
    .bj_data             (ex_bj_data)
  );
  
  ysyx_210611_ex_stage_bj ysyx_210611_Exe_stage_bj(
    .ex_valid            (ex_valid),
    .bj_info             (ex_bj_info),
    .bj_data             (ex_bj_data),
    .jmp_imm             (ex_jmp_imm),
    .rs1_data            (rs1_forward),
    .ex_pc               (ex_pc),
    
    .bj_ena              (ex_bj_ena),
    .new_pc              (ex_bj_pc)
  );
  
  assign ex_ram_wr_src = rs2_forward;
  
  assign ex_to_mem_bus = {
    // mem
    ex_load_info,   // 214:208
    ex_save_info,   // 207:204
    ex_ram_wr_src,  // 203:140
    ex_data,        // 139:76
    ex_csr_rd_data, // 75 :12
    ex_ram_rd_ena,  // 11 :11
    ex_ram_wr_ena,  // 10 :10
    
    // wb
    ex_reg_wr_ctrl, // 9  :7
    ex_reg_wr_addr, // 6  :2
    ex_reg_wr_ena   // 1  :1
  };
  
  assign ex_bj_valid = ~(|ex_bj_info) || ex_done;
  assign bj_ctrl_bus = {
    excp_jmp_ena ? excp_jmp_pc : ex_bj_pc,
    ex_bj_ena | excp_jmp_ena,
    ex_bj_valid
  };
  
  assign csr_wr_ena  = ex_csr_wr_ena;
  assign csr_wr_addr = ex_csr_wr_addr;
  assign csr_wr_data = ex_data;

endmodule

module ysyx_210611_excp_handler (
  input wire [`YSYX210611_EXCP_BUS]             excp_info,
  input wire [`YSYX210611_ITRP_BUS]             itrp_info,
  input wire [`YSYX210611_REG_BUS]              now_pc,
  input wire [31 : 0]                           now_inst,
  input wire [`YSYX210611_REG_BUS]              mem_addr,
  input wire                                    excp_exit,
  output wire                                   excp_enter,
  output wire                                   itrp_allowin,
  
  // to CSRs
  input wire [`YSYX210611_EXCP_RD_WIDTH-1:0]    csr_excp_rd_bus,
  output wire [`YSYX210611_EXCP_WR_WIDTH-1:0]   csr_excp_wr_bus,
  
  // to if_stage
  output wire                                   excp_jmp_ena,
  output wire [`YSYX210611_REG_BUS]             excp_jmp_pc,

  // to ex_stage
  input wire                                    itrp_valid
  );
  
  // to CSRs
  wire [`YSYX210611_REG_BUS] mip_wr_data, mcause_wr_data, mepc_wr_data,
                  mtval_wr_data, mstatus_wr_data;
  assign csr_excp_wr_bus = {
    mip_wr_data,      // 319:256
    mcause_wr_data,   // 255:192
    mepc_wr_data,     // 191:128
    mtval_wr_data,    // 127:64
    mstatus_wr_data   // 63 :0
  };

  // from CSRs
  wire [`YSYX210611_REG_BUS] mstatus_rd_data, mtvec_rd_data, mepc_rd_data, mie_rd_data, mip_rd_data;
  assign {
    mstatus_rd_data,
    mtvec_rd_data,
    mepc_rd_data,
    mip_rd_data,
    mie_rd_data
  } = csr_excp_rd_bus;

  // generate excp_ena
  wire sp_excp_ena = |excp_info;
  wire sp_itrp_ena = itrp_valid;
  
  wire msie_allowin = mstatus_rd_data[3] && mie_rd_data[3]  && mip_rd_data[3];
  wire mtie_allowin = mstatus_rd_data[3] && mie_rd_data[7]  && mip_rd_data[7];
  wire meie_allowin = mstatus_rd_data[3] && mie_rd_data[11] && mip_rd_data[11];
  assign itrp_allowin = meie_allowin || mtie_allowin || msie_allowin;
  
  assign excp_enter = sp_excp_ena | sp_itrp_ena;
  
  /* ----------- Decode ----------- */
  // decode machine interruption
  wire soft_itrp  = msie_allowin && itrp_valid;
  wire timer_itrp = mtie_allowin && itrp_valid;
  wire exter_itrp = meie_allowin && itrp_valid;
  wire [62 : 0] itrp_idx = (
      ({63{soft_itrp}}       & 63'd3)
    | ({63{timer_itrp}}      & 63'd7)
    | ({63{exter_itrp}}      & 63'd11)
  );
  // decode exception
  wire excp_inst_misal = excp_info[`YSYX210611_EXCP_INST_MISAL];
  wire excp_inst_acc = excp_info[`YSYX210611_EXCP_INST_ACC];
  wire excp_ilg_inst = excp_info[`YSYX210611_EXCP_ILG_INST];
  wire excp_brk_pt = excp_info[`YSYX210611_EXCP_BRK_PT];
  wire excp_load_misal = excp_info[`YSYX210611_EXCP_LOAD_MISAL];
  wire excp_load_acc = excp_info[`YSYX210611_EXCP_LOAD_ACC];
  wire excp_stor_misal = excp_info[`YSYX210611_EXCP_STOR_MISAL];
  wire excp_stor_acc = excp_info[`YSYX210611_EXCP_STOR_ACC];
  wire excp_ecall_m = excp_info[`YSYX210611_EXCP_ECALL_M];
  wire excp_inst_page = excp_info[`YSYX210611_EXCP_INST_PAGE];
  wire excp_load_page = excp_info[`YSYX210611_EXCP_LOAD_PAGE];
  wire excp_stor_page = excp_info[`YSYX210611_EXCP_STOR_PAGE];
  wire [62 : 0] excp_idx = (
      ({63{excp_inst_misal}} & 63'd0)
    | ({63{excp_inst_acc}}   & 63'd1)
    | ({63{excp_ilg_inst}}   & 63'd2)
    | ({63{excp_brk_pt}}     & 63'd3)
    | ({63{excp_load_misal}} & 63'd4)
    | ({63{excp_load_acc}}   & 63'd5)
    | ({63{excp_stor_misal}} & 63'd6)
    | ({63{excp_stor_acc}}   & 63'd7)
    | ({63{excp_ecall_m}}    & 63'd11)
    | ({63{excp_inst_page}}  & 63'd12)
    | ({63{excp_load_page}}  & 63'd13)
    | ({63{excp_stor_page}}  & 63'd15)
  );
  wire inst_acc_fault = excp_inst_misal | excp_inst_acc | excp_inst_page ;
  wire mem_acc_fault = excp_load_misal | excp_load_acc | excp_stor_misal 
                     | excp_stor_acc | excp_load_page | excp_stor_page;
  
  assign mip_wr_data = {64{itrp_info[`YSYX210611_TIMER_ITRP]}} & 64'h80;

  /* -----------Write CSRs----------- */
  // write mcause
  assign mcause_wr_data = { sp_itrp_ena ? 1'b1 : 1'b0,
    sp_itrp_ena ? itrp_idx : excp_idx
  };
  
  // write mepc
  assign mepc_wr_data = now_pc;
  
  // write mtval
  assign mtval_wr_data = (
      ({64{inst_acc_fault}} & now_pc)
    | ({64{excp_ilg_inst}}  & {32'b0, now_inst})
    | ({64{mem_acc_fault}}  & mem_addr)
  );
  
  // write mstatus
  wire [63 : 8] mstatus_p1 = mstatus_rd_data[63 : 8];
  wire mstatus_mpie = mstatus_rd_data[7];  // MPIE
  wire [6 : 4] mstatus_p2 = mstatus_rd_data[6 : 4];
  wire mstatus_mie = mstatus_rd_data[3];   // MIE
  wire [2 : 0] mstatus_p3 = mstatus_rd_data[2 : 0];
  wire [`YSYX210611_REG_BUS] mstatus_excp_enter = {mstatus_p1, mstatus_mie, mstatus_p2, 1'b0, mstatus_p3};
  wire [`YSYX210611_REG_BUS] mstatus_excp_exit = {mstatus_p1, 1'b1, mstatus_p2, mstatus_mpie, mstatus_p3};
  assign mstatus_wr_data = (
      ({64{excp_enter}} & mstatus_excp_enter)
    | ({64{excp_exit}} & mstatus_excp_exit)
  );

  /* -----------Jump control----------- */
  // load mtvec
  wire [1  : 0] mtvec_mode = mtvec_rd_data[1  : 0];
  wire mtvec_mode0 = (mtvec_mode == 2'b0);
  wire mtvec_mode1 = (mtvec_mode == 2'b1);
  wire [61 : 0] mtvec_base = mtvec_rd_data[63 : 2];
  wire [`YSYX210611_REG_BUS] mode0_addr = {mtvec_base, 2'b0};
  wire [`YSYX210611_REG_BUS] mode1_excp_addr = {mtvec_base, 2'b0};
  wire [`YSYX210611_REG_BUS] mode1_itrp_addr = {mtvec_base + itrp_idx[61:0], 2'b0};
  wire [`YSYX210611_REG_BUS] mode1_addr = (
           ({64{sp_excp_ena}} & mode1_excp_addr) // when exception, jump to base
         | ({64{sp_itrp_ena}} & mode1_itrp_addr) // when interruption, jump to base + code
  );
  wire [`YSYX210611_REG_BUS] excp_enter_pc = 
      ({64{mtvec_mode0}} & mode0_addr) // mode0, jump to base
    | ({64{mtvec_mode1}} & mode1_addr); // mode 1
  wire [`YSYX210611_REG_BUS] excp_exit_pc = mepc_rd_data;
  assign excp_jmp_ena = excp_enter | excp_exit;
  assign excp_jmp_pc = ({64{excp_enter}} & excp_enter_pc) | ({64{excp_exit}} & excp_exit_pc);
endmodule

module ysyx_210611_forward (
  // forward control
  input wire [4 : 0]                             ex_rs1_addr,
  input wire [4 : 0]                             ex_rs2_addr,
  //input wire [12: 0] csr_addr,
  input wire [`YSYX210611_REG_BUS]               ex_rs1_data,
  input wire [`YSYX210611_REG_BUS]               ex_rs2_data,

  input wire [`YSYX210611_MEM_FORWARD_WIDTH-1:0] mem_forward_bus,
  input wire [`YSYX210611_WB_FORWARD_WIDTH-1:0]  wb_forward_bus,

  output wire [`YSYX210611_REG_BUS]              rs1_forward,
  output wire [`YSYX210611_REG_BUS]              rs2_forward,

  output wire                                    hazard
);
  
  wire [4:0] mem_reg_wr_addr, wb_reg_wr_addr;
  wire mem_reg_wr_ena, wb_reg_wr_ena;
  wire [`YSYX210611_REG_BUS] mem_ex_data, wb_ex_data, wb_mem_data;
  wire [`YSYX210611_REG_CTRL_BUS] mem_reg_wr_ctrl, wb_reg_wr_ctrl;

  assign {
    mem_reg_wr_addr, // 72 :68
    mem_reg_wr_ena,  // 67 :67
    mem_ex_data,     // 66 :3
    mem_reg_wr_ctrl  // 2  :0
  } = mem_forward_bus;
  
  assign {
    wb_reg_wr_addr, // 136:132
    wb_reg_wr_ena,  // 131:131
    wb_ex_data,     // 130:67
    wb_mem_data,    // 66 :3
    wb_reg_wr_ctrl  // 2  :0
  } = wb_forward_bus;
  
  wire mem_op1_src_ex = (ex_rs1_addr == mem_reg_wr_addr) 
                        && mem_reg_wr_ena 
                        && (|ex_rs1_addr)
                        && mem_reg_wr_ctrl[`YSYX210611_EXE_TO_REG];
  wire wb_op1_src_ex = (ex_rs1_addr == wb_reg_wr_addr) 
                        && wb_reg_wr_ena 
                        && (|ex_rs1_addr)
                        && wb_reg_wr_ctrl[`YSYX210611_EXE_TO_REG];
  wire mem_op1_src_mem = (ex_rs1_addr == mem_reg_wr_addr) 
                        && mem_reg_wr_ena 
                        && (|ex_rs1_addr)
                        && mem_reg_wr_ctrl[`YSYX210611_MEM_TO_REG];
  wire wb_op1_src_mem = (ex_rs1_addr == wb_reg_wr_addr) 
                        && wb_reg_wr_ena 
                        && (|ex_rs1_addr)
                        && wb_reg_wr_ctrl[`YSYX210611_MEM_TO_REG];
  assign rs1_forward = (mem_op1_src_ex) ? mem_ex_data :
                       (wb_op1_src_ex)  ? wb_ex_data  :
                       (wb_op1_src_mem) ? wb_mem_data :
                       ex_rs1_data;

  wire mem_op2_src_ex = (ex_rs2_addr == mem_reg_wr_addr) 
                        && mem_reg_wr_ena 
                        && (|ex_rs2_addr)
                        && mem_reg_wr_ctrl[`YSYX210611_EXE_TO_REG];
  wire wb_op2_src_ex = (ex_rs2_addr == wb_reg_wr_addr) 
                        && wb_reg_wr_ena 
                        && (|ex_rs2_addr)
                        && wb_reg_wr_ctrl[`YSYX210611_EXE_TO_REG];
  wire mem_op2_src_mem = (ex_rs2_addr == mem_reg_wr_addr) 
                        && mem_reg_wr_ena 
                        && (|ex_rs2_addr)
                        && mem_reg_wr_ctrl[`YSYX210611_MEM_TO_REG];
  wire wb_op2_src_mem = (ex_rs2_addr == wb_reg_wr_addr) 
                        && wb_reg_wr_ena 
                        && (|ex_rs2_addr)
                        && wb_reg_wr_ctrl[`YSYX210611_MEM_TO_REG];
  assign rs2_forward = (mem_op2_src_ex) ? mem_ex_data :
                       (wb_op2_src_ex)  ? wb_ex_data  :
                       (wb_op2_src_mem) ? wb_mem_data :
                       ex_rs2_data;
  
  assign hazard = mem_op1_src_mem || mem_op2_src_mem;
endmodule

module ysyx_210611_id_stage(
  input wire                                        rst,
  input wire                                        clk,

  // pipeline control
  input wire                                        if_to_id_valid,
  input wire [`YSYX210611_REG_BUS]                  if_to_id_pc,
  input wire [`YSYX210611_INST_BUS]                 if_to_id_inst,
  output wire                                       id_allowin,

  output wire                                       id_to_ex_valid,
  output wire [`YSYX210611_REG_BUS]                 id_to_ex_pc,
  output wire [`YSYX210611_INST_BUS]                id_to_ex_inst,
  output wire [`YSYX210611_ID_TO_EX_WIDTH-1:0]      id_to_ex_bus,
  input wire                                        ex_allowin,

  // data from regfile and CSRs
  input wire [`YSYX210611_REG_BUS]                  csr_data,
  
  // control csr
  output wire                                       csr_rd_ena,
  output wire [11: 0]                               csr_rd_addr,

  input wire [`YSYX210611_BJ_CTRL_WIDTH-1:0]        bj_ctrl_bus
);
  
  reg id_valid;
  wire id_ready_go;
  wire id_flush;
  reg [`YSYX210611_REG_BUS] if_to_id_pc_r;
  reg [`YSYX210611_INST_BUS] if_to_id_inst_r;
  
  wire [`YSYX210611_REG_BUS]  id_pc;
  wire [`YSYX210611_INST_BUS] id_inst;

  wire            rs1_r_ena;
  wire [4 : 0]    rs1_addr;
  wire            rs2_r_ena;
  wire [4 : 0]    rs2_addr;
  wire [11 : 0]   id_csr_addr;
  wire [4  : 0]   rd_addr;

  wire            bj_ena, bj_valid;

  assign {
    bj_ena,   // 1 :1
    bj_valid  // 0 :0
  } = bj_ctrl_bus[1:0];

  // pipeline control
  assign id_flush = bj_ena && bj_valid;

  assign id_ready_go = 1'b1;
  assign id_allowin = !id_valid || id_ready_go && ex_allowin;
  assign id_to_ex_valid = id_valid && id_ready_go && ~id_flush;

  always @(posedge clk) begin
    if (rst) begin
      id_valid <= 1'b0;
      if_to_id_pc_r <= 0;
      if_to_id_inst_r <= 0;
    end
    else if (id_allowin) begin
      id_valid <= if_to_id_valid;
    end
    else if (id_flush) begin // not allowin, and flush happen
      id_valid <= 1'b0;
    end
    
    if (if_to_id_valid && id_allowin) begin
      if_to_id_pc_r <= if_to_id_pc;
      if_to_id_inst_r <= if_to_id_inst;
    end
  end
  
  assign id_pc = if_to_id_pc_r;
  assign id_inst = if_to_id_inst_r;
  
  // decode
  wire [6  : 0] opcode = id_inst[6 : 0];
  wire [2  : 0] func3  = id_inst[14 : 12];
  wire [5  : 0] func6  = id_inst[31 : 26];
  wire [6  : 0] func7  = id_inst[31 : 25];
  wire [4  : 0] zimm   = id_inst[19 : 15];
  
  assign rs1_addr = {5{rs1_r_ena}} & id_inst[19 : 15];
  assign rs2_addr = {5{rs2_r_ena}} & id_inst[24 : 20];
  assign id_csr_addr = id_inst[31 : 20];
  assign csr_rd_addr = id_csr_addr;
  assign rd_addr = id_inst[11 : 7];
  
  wire [11 : 0] immI = id_csr_addr;
  wire [11 : 0] immS = {func7, id_inst[11 :  7]};
  wire [12 : 0] immB = {id_inst[31], id_inst[7], id_inst[30 : 25], id_inst[11 : 8], 1'b0};
  wire [19 : 0] immU = id_inst[31 : 12];
  wire [20 : 0] immJ = {id_inst[31], id_inst[19 : 12], id_inst[20], id_inst[30 : 21], 1'b0};
  
  // decode func3
  wire func3_0 = (func3 == 3'h0);
  wire func3_1 = (func3 == 3'h1);
  wire func3_2 = (func3 == 3'h2);
  wire func3_3 = (func3 == 3'h3);
  wire func3_4 = (func3 == 3'h4);
  wire func3_5 = (func3 == 3'h5);
  wire func3_6 = (func3 == 3'h6);
  wire func3_7 = (func3 == 3'h7);
  
  // decode func6
  wire func6_00 = (func6 == 6'h00);
  wire func6_10 = (func6 == 6'h10);
  
  // decode func7
  wire func7_00 = (func7 == 7'h00);
  wire func7_20 = (func7 == 7'h20);
  
  // decode imm12
  wire imm12_000 = (immI == 12'h000);
  wire imm12_001 = (immI == 12'h001);
  wire imm12_302 = (immI == 12'h302);
  
  // decode type
  wire inst_i_load        = (opcode == 7'h03);
  wire inst_i_fence       = (opcode == 7'h0f);
  wire inst_i_arith_dword = (opcode == 7'h13);
  wire inst_u_auipc       = (opcode == 7'h17);
  wire inst_i_arith_word  = (opcode == 7'h1b);
  wire inst_s             = (opcode == 7'h23);
  wire inst_r_dword       = (opcode == 7'h33);
  wire inst_u_lui         = (opcode == 7'h37);
  wire inst_r_word        = (opcode == 7'h3b);
  wire inst_b             = (opcode == 7'h63);
  wire inst_i_jalr        = (opcode == 7'h67);
  wire inst_j             = (opcode == 7'h6f);
  wire inst_i_sys         = (opcode == 7'h73);
  wire inst_i_excp        = inst_i_sys & func3_0;
  wire inst_i_csr_imm     = inst_i_sys & (func3[2] == 1) & ~func3_0;
  wire inst_i_csr_reg     = inst_i_sys & (func3[2] == 0) & ~func3_0;

  wire is_word_opt = inst_r_word | inst_i_arith_word;

  // decode arithmetic
  // load
  wire inst_lb      = inst_i_load & func3_0;
  wire inst_lh      = inst_i_load & func3_1;
  wire inst_lw      = inst_i_load & func3_2;
  wire inst_ld      = inst_i_load & func3_3;
  wire inst_lbu     = inst_i_load & func3_4;
  wire inst_lhu     = inst_i_load & func3_5;
  wire inst_lwu     = inst_i_load & func3_6;
  wire load_vld     = inst_lb | inst_lh | inst_lw | inst_ld 
                    | inst_lbu | inst_lhu | inst_lwu;
  
  // fence
  wire inst_fence   = inst_i_fence & func3_0;
  wire inst_fence_i = inst_i_fence & func3_1;
  wire fence_vld    = inst_fence | inst_fence_i;
  
  // arith-i-dword
  wire inst_addi    = inst_i_arith_dword & func3_0;
  wire inst_slli    = inst_i_arith_dword & func3_1 & func6_00;
  wire inst_slti    = inst_i_arith_dword & func3_2;
  wire inst_sltiu   = inst_i_arith_dword & func3_3;
  wire inst_xori    = inst_i_arith_dword & func3_4;
  wire inst_srli    = inst_i_arith_dword & func3_5 & func6_00;
  wire inst_srai    = inst_i_arith_dword & func3_5 & func6_10;
  wire inst_ori     = inst_i_arith_dword & func3_6;
  wire inst_andi    = inst_i_arith_dword & func3_7;
  wire arith_id_vld = inst_addi | inst_slli | inst_slti | inst_sltiu 
                    | inst_xori | inst_srli | inst_srai | inst_ori
                    | inst_andi;
  
  // auipc
  wire inst_auipc   = inst_u_auipc;
  wire auipc_vld    = inst_auipc;
  
  // arith-i-word
  wire inst_addiw   = inst_i_arith_word & func3_0;
  wire inst_slliw   = inst_i_arith_word & func3_1;
  wire inst_srliw   = inst_i_arith_word & func3_5 & func6_00;
  wire inst_sraiw   = inst_i_arith_word & func3_5 & func6_10;
  wire arith_iw_vld = inst_addiw | inst_slliw | inst_srliw | inst_sraiw;
  
  // store
  wire inst_sb      = inst_s & func3_0;
  wire inst_sh      = inst_s & func3_1;
  wire inst_sw      = inst_s & func3_2;
  wire inst_sd      = inst_s & func3_3;
  wire store_vld    = inst_sb | inst_sh | inst_sw | inst_sd;
  
  // arith-r-dword
  wire inst_add     = inst_r_dword & func3_0 & func7_00;
  wire inst_sub     = inst_r_dword & func3_0 & func7_20;
  wire inst_sll     = inst_r_dword & func3_1;
  wire inst_slt     = inst_r_dword & func3_2;
  wire inst_sltu    = inst_r_dword & func3_3;
  wire inst_xor     = inst_r_dword & func3_4;
  wire inst_srl     = inst_r_dword & func3_5 & func7_00;
  wire inst_sra     = inst_r_dword & func3_5 & func7_20;
  wire inst_or      = inst_r_dword & func3_6;
  wire inst_and     = inst_r_dword & func3_7;
  wire arith_rd_vld = inst_add  | inst_sub | inst_sll | inst_slt 
                    | inst_sltu | inst_xor | inst_srl | inst_sra
                    | inst_or   | inst_and;
  
  // lui
  wire inst_lui     = inst_u_lui;
  wire lui_vld      = inst_lui;
  
  // arith-r-word
  wire inst_addw    = inst_r_word & func3_0 & func7_00;
  wire inst_subw    = inst_r_word & func3_0 & func7_20;
  wire inst_sllw    = inst_r_word & func3_1;
  wire inst_srlw    = inst_r_word & func3_5 & func7_00;
  wire inst_sraw    = inst_r_word & func3_5 & func7_20;
  wire arith_rw_vld = inst_addw | inst_subw | inst_sllw 
                    | inst_srlw | inst_sraw;

  // branch
  wire inst_beq     = inst_b & func3_0;
  wire inst_bne     = inst_b & func3_1;
  wire inst_blt     = inst_b & func3_4;
  wire inst_bge     = inst_b & func3_5;
  wire inst_bltu    = inst_b & func3_6;
  wire inst_bgeu    = inst_b & func3_7;
  wire branch_vld   = inst_beq | inst_bne  | inst_blt 
                    | inst_bge | inst_bltu | inst_bgeu;
  
  // jump
  wire inst_jalr    = inst_i_jalr;
  wire inst_jal     = inst_j;
  wire jump_vld     = inst_jalr | inst_jal;
  
  // exception
  wire inst_ecall   = inst_i_excp    & imm12_000;
  wire inst_ebreak  = inst_i_excp    & imm12_001;
  wire inst_mret    = inst_i_excp    & imm12_302;
  wire excp_vld     = inst_ecall | inst_ebreak | inst_mret;
  
  // csr
  wire inst_csrrw   = inst_i_csr_reg & func3_1;
  wire inst_csrrs   = inst_i_csr_reg & func3_2;
  wire inst_csrrc   = inst_i_csr_reg & func3_3;
  wire inst_csrrwi  = inst_i_csr_imm & func3_5;
  wire inst_csrrsi  = inst_i_csr_imm & func3_6;
  wire inst_csrrci  = inst_i_csr_imm & func3_7;
  wire csr_vld      = inst_csrrw  | inst_csrrs  | inst_csrrc
                    | inst_csrrwi | inst_csrrsi | inst_csrrci;
  
  wire inst_vld     = load_vld | fence_vld | arith_id_vld | auipc_vld
                    | arith_iw_vld | store_vld | arith_rd_vld | lui_vld
                    | arith_rw_vld | branch_vld | jump_vld | excp_vld
                    | csr_vld;

  wire [`YSYX210611_ALU_BUS] id_alu_info;
  assign id_alu_info[`YSYX210611_ALU_ADD]  = inst_add   | inst_addi   | inst_addw  | inst_addiw 
                             | inst_auipc | inst_lui    | inst_i_load | inst_s 
                             | inst_jal   | inst_jalr;
  assign id_alu_info[`YSYX210611_ALU_SUB]  = inst_sub   | inst_subw   | inst_b;
  assign id_alu_info[`YSYX210611_ALU_SLT]  = inst_slt   | inst_slti   | inst_blt   | inst_bge;
  assign id_alu_info[`YSYX210611_ALU_SLTU] = inst_sltu  | inst_sltiu  | inst_bltu  | inst_bgeu;
  assign id_alu_info[`YSYX210611_ALU_XOR]  = inst_xor   | inst_xori   | inst_beq   | inst_bne;
  assign id_alu_info[`YSYX210611_ALU_OR]   = inst_or    | inst_ori    | inst_csrrs | inst_csrrsi;
  assign id_alu_info[`YSYX210611_ALU_AND]  = inst_and   | inst_andi;
  assign id_alu_info[`YSYX210611_ALU_SLL]  = inst_sll   | inst_slli   | inst_sllw  | inst_slliw;
  assign id_alu_info[`YSYX210611_ALU_SRL]  = inst_srl   | inst_srli   | inst_srlw  | inst_srliw;
  assign id_alu_info[`YSYX210611_ALU_SRA]  = inst_sra   | inst_srai   | inst_sraw  | inst_sraiw;
  assign id_alu_info[`YSYX210611_ALU_ANDN] = inst_csrrc | inst_csrrci;
  assign id_alu_info[`YSYX210611_ALU_WRI]  = inst_csrrw | inst_csrrwi;
  
  wire [`YSYX210611_BJ_BUS] id_bj_info;
  assign id_bj_info[`YSYX210611_BJ_BEQ]  = inst_beq;
  assign id_bj_info[`YSYX210611_BJ_BNE]  = inst_bne;
  assign id_bj_info[`YSYX210611_BJ_BLT]  = inst_blt;
  assign id_bj_info[`YSYX210611_BJ_BGE]  = inst_bge;
  assign id_bj_info[`YSYX210611_BJ_BLTU] = inst_bltu;
  assign id_bj_info[`YSYX210611_BJ_BGEU] = inst_bgeu;
  assign id_bj_info[`YSYX210611_BJ_JALR] = inst_jalr;
  assign id_bj_info[`YSYX210611_BJ_JAL]  = inst_jal;
  
  wire [`YSYX210611_LOAD_BUS] id_load_info = {
    inst_lwu, inst_lhu, inst_lbu, inst_ld, inst_lw, inst_lh, inst_lb
  };
  
  wire [`YSYX210611_SAVE_BUS] id_save_info = {
    inst_sd, inst_sw, inst_sh, inst_sb
  };
  
  assign rs1_r_ena  = (inst_i_load | inst_i_fence | inst_i_arith_dword 
                            | inst_i_arith_word | inst_s | inst_r_dword 
                            | inst_r_word | inst_b | inst_i_jalr | inst_i_csr_reg);
  assign rs2_r_ena  = (inst_r_dword | inst_r_word | inst_s | inst_b);
  assign csr_rd_ena = csr_vld;
  
  wire [4 : 0] reg_wr_addr;
  
  wire mem_wr_ena = inst_s;
  wire mem_rd_ena = inst_i_load;
  
  wire [`YSYX210611_REG_BUS] id_op1 = (
                  ({64{inst_u_auipc}}       & id_pc)
                | ({64{inst_u_lui}}         & 64'b0)
                | ({64{inst_i_jalr}}        & id_pc)
                | ({64{inst_jal}}           & id_pc)
                | ({64{inst_i_csr_imm}}     & {59'b0, zimm})
               );
  wire id_use_rs1 = inst_i_load | inst_i_fence | inst_i_arith_dword
                  | inst_i_arith_word | inst_s | inst_r_dword
                  | inst_r_word | inst_b | inst_i_csr_reg;
  
  wire [`YSYX210611_REG_BUS] id_op2 = (
                  ({64{inst_i_load}}        & {{52{immI[11]}}, immI})
                | ({64{inst_i_fence}}       & {{52{immI[11]}}, immI})
                | ({64{inst_i_arith_dword}} & {{52{immI[11]}}, immI})
                | ({64{inst_u_auipc}}       & {{32{immU[19]}}, immU, 12'b0})
                | ({64{inst_i_arith_word}}  & {{52{immI[11]}}, immI})
                | ({64{inst_s}}             & {{52{immS[11]}}, immS})
                | ({64{inst_u_lui}}         & {{32{immU[19]}}, immU, 12'b0})
                | ({64{inst_i_jalr}}        & 64'h4)
                | ({64{inst_jal}}           & 64'h4)
                | ({64{inst_i_csr_imm}}     & csr_data)
                | ({64{inst_i_csr_reg}}     & csr_data)
               );
  wire id_use_rs2 = inst_r_dword | inst_r_word | inst_b;
  
  wire [`YSYX210611_REG_BUS] id_jmp_imm = ({64{inst_b}}      & {{51{immB[12]}}, immB})
                 | ({64{inst_j}}       & {{43{immJ[20]}}, immJ})
                 | ({64{inst_i_jalr}}  & {{52{immI[11]}}, immI});
  
  // data to wb_stage
  wire csr_to_reg = (inst_i_csr_imm | inst_i_csr_reg);
  wire mem_to_reg = inst_i_load;
  wire exe_to_reg = (
      inst_i_fence | inst_i_arith_dword | inst_u_auipc 
    | inst_i_arith_word | inst_r_dword | inst_u_lui
    | inst_r_word | inst_jal | inst_i_jalr
  );
  wire [`YSYX210611_REG_CTRL_BUS] reg_wr_ctrl = {
    csr_to_reg,
    mem_to_reg,
    exe_to_reg
  };
  
  wire reg_wr_ena  = (
      inst_i_load | inst_i_fence | inst_i_arith_dword
    | inst_u_auipc | inst_i_arith_word | inst_r_dword
    | inst_u_lui | inst_r_word | inst_i_jalr | inst_j
    | inst_i_csr_imm | inst_i_csr_reg
  );
  assign reg_wr_addr = (reg_wr_ena == 1'b1) ? rd_addr : 0;

  wire csr_wr_ena  = (inst_i_csr_imm | inst_i_csr_reg);
  wire [11: 0] csr_wr_addr = id_inst[31 : 20];
  
  wire [`YSYX210611_EXCP_BUS] id_excp_bus;
  wire id_excp_exit = inst_mret;
  assign id_excp_bus = {
    4'b0,        // 15:12
    inst_ecall,  // 11:11
    7'b0,        // 10:4
    inst_ebreak, // 3 :3
    ~inst_vld,   // 2: 2
    2'b0         // 1 :0
  } & {16{id_valid}};
  //assign id_excp_bus[`EXCP_BRK_PT]  = inst_ebreak;
  //assign id_excp_bus[`EXCP_ECALL_M] = inst_ecall;
 
  assign id_to_ex_pc = id_pc;
  assign id_to_ex_inst = id_inst;
  assign id_to_ex_bus = {
    
    // exception
    id_excp_exit,      // 566:566
    id_excp_bus,       // 565:550

    // -> ex
    rs1_addr,          // 451:447
    rs2_addr,          // 446:442
    id_op1,            // 441:378
    id_op2,            // 377:314
    id_use_rs1,        // 313:313
    id_use_rs2,        // 312:312
    is_word_opt,       // 183:183
    id_alu_info,       // 182:171
    id_bj_info,        // 170:163
    id_jmp_imm,        // 162:99
    
    // -> mem
    id_load_info,      // 98 :92
    id_save_info,      // 91 :88
    mem_rd_ena,        // 87 :87
    mem_wr_ena,        // 86 :86
    
    // -> wb
    reg_wr_ctrl,       // 85: 83
    reg_wr_ena,        // 82: 82
    reg_wr_addr,       // 81 :77
    csr_wr_ena,        // 76 :76
    csr_wr_addr,       // 75 :64
    csr_data           // 64 :0
  };
endmodule

module ysyx_210611_if_stage(
  input wire                                     clk,
  input wire                                     rst,
  
  // pipeline control
  output wire                                    if_to_id_valid,
  output wire [`YSYX210611_REG_BUS]              if_to_id_pc,
  output wire [`YSYX210611_INST_BUS]             if_to_id_inst,
  input wire                                     id_allowin,
  
  // branch and jump control
  output wire                                    if_bj_ready,
  input wire [`YSYX210611_BJ_CTRL_WIDTH-1:0]     bj_ctrl_bus,

  // AXI4
  output wire                                    if_axi_valid, // master is valid
  input wire                                     if_axi_ready, // slave is ready
  input wire [`YSYX210611_REG_BUS]               if_axi_data_read,
  output reg [`YSYX210611_REG_BUS]               if_axi_addr,
  output wire [1:0]                              if_axi_size,
  input wire [1:0]                               if_axi_resp
  );
  
  wire [`YSYX210611_REG_BUS] bj_pc;
  wire            bj_ena, bj_valid;
  assign {
    bj_pc,    // 65:2
    bj_ena,   // 1 :1
    bj_valid  // 0 :0
  } = bj_ctrl_bus;
  
  wire if_handshake, bj_handshake;
  wire pre_valid;
  wire pre_ready_go;
  wire pre_to_if_valid;
  wire [`YSYX210611_REG_BUS] next_pc;

  reg [`YSYX210611_REG_BUS] if_pc;
  reg [31 : 0]   if_inst;

  reg if_valid;
  wire if_ready_go;
  wire if_flush = bj_ena;
  wire if_allowin;
  
  // pre-IF stage

  // State Machine
  parameter IDLE = 2'b00, ADDR = 2'b01, RETN = 2'b10;
  reg [1:0] if_state;
  reg [1:0] if_next_state;

  always @(posedge clk) begin
    if (rst) begin
      if_state <= IDLE;
    end
    else begin
      if_state <= if_next_state;
    end
  end
  
  always @(*) begin
    case (if_state)
      IDLE:
        if_next_state = bj_handshake ? ADDR : IDLE;
      ADDR:
        if_next_state = if_handshake ? RETN : ADDR;
      RETN:
        if_next_state = (pre_to_if_valid && if_allowin) ? IDLE : RETN;
      default:
        if_next_state = IDLE;
    endcase
  end
  
  always @(posedge clk) begin
    if (rst) begin
      if_axi_addr <= 64'b0;
    end
    else if (if_state == IDLE) begin
      if_axi_addr <= next_pc;
    end
  end

  assign pre_valid = 1'b1;
  assign pre_ready_go = if_state == RETN;
  assign pre_to_if_valid = pre_valid && pre_ready_go;
  assign next_pc = /*excp_jmp_ena ? excp_pc :*/
                            bj_ena       ? bj_pc   :
                            (if_pc + 4);
  
  // fetch an instruction
  assign if_axi_valid = if_state == ADDR;
  assign if_handshake = if_axi_valid && if_axi_ready;
  
  assign if_axi_size = `YSYX210611_SIZE_W;
  assign if_bj_ready = if_state == IDLE;
  assign bj_handshake = if_bj_ready && bj_valid;
  
  // IF stage
  
  // pipeline control
  assign if_ready_go    = 1'b1;
  assign if_allowin     = !if_valid || if_ready_go && id_allowin;
  assign if_to_id_valid = if_valid && if_ready_go && ~if_flush;
  
  always @(posedge clk) begin
    if (rst) begin
      if_valid <= 1'b0;
    end
    else if (if_allowin) begin
      if_valid <= pre_to_if_valid;
    end
    else if (if_flush) begin
      if_valid <= 1'b0;
    end
  end
  
  always @(posedge clk) begin
    if (rst) begin
      if_pc <= 64'h2ffffffc;
      if_inst <= 32'b0;
    end
    else if (pre_to_if_valid && if_allowin) begin
      if_pc <= if_axi_addr;
      if_inst <= if_axi_data_read[31 : 0]; // this inst
    end
  end

  assign if_to_id_pc = if_pc;
  assign if_to_id_inst = if_inst;
endmodule

module ysyx_210611_mem_stage(
  input  wire                                         clk,
  input  wire                                         rst,
  
  // pipeline control
  input wire                                          ex_to_mem_valid,
  input wire [`YSYX210611_EX_TO_MEM_WIDTH-1:0]        ex_to_mem_bus,
  output wire                                         mem_allowin,
  output wire                                         ex_to_mem_handshake,

  output wire                                         mem_to_wb_valid,
  output wire [`YSYX210611_MEM_TO_WB_WIDTH-1:0]       mem_to_wb_bus,
  input wire                                          wb_allowin,
  
  // pipeline forward control
  output wire [`YSYX210611_MEM_FORWARD_WIDTH-1:0]     mem_forward_bus,

  // custom interface
  output wire                                         mem_rw_valid,
  input  wire                                         mem_rw_ready,
  output wire                                         mem_rw_req,
  input  wire [`YSYX210611_REG_BUS]                   mem_r_data,
  output wire [`YSYX210611_REG_BUS]                   mem_w_data,
  output wire [`YSYX210611_REG_BUS]                   mem_rw_addr,
  output wire [1 : 0]                                 mem_rw_size,
  input  wire [1 : 0]                                 mem_rw_resp
  );

  // pipeline control
  reg mem_valid;
  wire mem_ready_go;
  reg [`YSYX210611_EX_TO_MEM_WIDTH-1:0] ex_to_mem_bus_r;
  
  // ram control
  wire [`YSYX210611_LOAD_BUS] mem_load_info;
  wire [`YSYX210611_SAVE_BUS] mem_save_info;
  wire [`YSYX210611_REG_BUS]  mem_ram_wr_src;
  wire [`YSYX210611_REG_BUS]  mem_addr, mem_csr_rd_data;
  wire                        mem_ram_rd_ena;
  wire                        mem_ram_wr_ena;
  
  // wb stage
  wire [2  : 0]    mem_reg_wr_ctrl;
  wire [4  : 0]    mem_reg_wr_addr;
  wire             mem_reg_wr_ena;

  wire mem_finish;
  wire [`YSYX210611_REG_BUS] mem_ex_data;

  assign mem_ready_go = mem_finish || (~mem_ram_rd_ena && ~mem_ram_wr_ena);
  assign mem_allowin = !mem_valid || mem_ready_go && wb_allowin;
  assign mem_to_wb_valid = mem_valid && mem_ready_go;
  assign ex_to_mem_handshake = ex_to_mem_valid && mem_allowin;

  always @(posedge clk) begin
    if (rst) begin
      mem_valid <= 1'b0;
      ex_to_mem_bus_r <= 0;
    end
    else if (mem_allowin) begin
      mem_valid <= ex_to_mem_valid;
    end

    if (ex_to_mem_valid && mem_allowin) begin
      ex_to_mem_bus_r <= ex_to_mem_bus;
    end
  end
  
  assign {
    // mem
    mem_load_info,   // 214:208
    mem_save_info,   // 207:204
    mem_ram_wr_src,  // 203:140
    mem_addr,        // 139:76
    mem_csr_rd_data,    // 75 :12
    mem_ram_rd_ena,  // 11 :11
    mem_ram_wr_ena,  // 10 :10
    
    // wb
    mem_reg_wr_ctrl, // 9  :7
    mem_reg_wr_addr, // 6  :2
    mem_reg_wr_ena   // 1  :1
  } = ex_to_mem_bus_r & {`YSYX210611_EX_TO_MEM_WIDTH{mem_valid}};
  wire ex_ram_rd_ena = ex_to_mem_bus[10];
  wire ex_ram_wr_ena = ex_to_mem_bus[9];
  wire refresh = ex_to_mem_valid && mem_allowin;
  wire mem_handshake = mem_rw_valid && mem_rw_ready;

  wire op_sb = mem_save_info[`YSYX210611_SAVE_SB];
  wire op_sh = mem_save_info[`YSYX210611_SAVE_SH];
  wire op_sw = mem_save_info[`YSYX210611_SAVE_SW];
  wire op_sd = mem_save_info[`YSYX210611_SAVE_SD];

  wire op_lb  = mem_load_info[`YSYX210611_LOAD_LB];
  wire op_lh  = mem_load_info[`YSYX210611_LOAD_LH];
  wire op_lw  = mem_load_info[`YSYX210611_LOAD_LW];
  wire op_ld  = mem_load_info[`YSYX210611_LOAD_LD];
  wire op_lbu = mem_load_info[`YSYX210611_LOAD_LBU];
  wire op_lhu = mem_load_info[`YSYX210611_LOAD_LHU];
  wire op_lwu = mem_load_info[`YSYX210611_LOAD_LWU];
  
  wire [1:0] IDLE = 2'b00, ADDR = 2'b01, RETN = 2'b10;
  reg [1:0] mem_state;
  reg [1:0] mem_next_state;
  
  always @(posedge clk) begin
    if (rst) begin
      mem_state <= IDLE;
    end
    else begin
      mem_state <= mem_next_state;
    end
  end

  always @(*) begin
    case (mem_state)
      IDLE: begin
        if (refresh && (ex_ram_rd_ena || ex_ram_wr_ena)) begin
          mem_next_state = ADDR;
        end
        else begin
          mem_next_state = mem_state;
        end
      end
      ADDR: begin
        if (mem_handshake) begin
          mem_next_state = RETN;
        end
        else begin
          mem_next_state = mem_state;
        end
      end
      RETN: begin
        if (refresh) begin
          if (ex_ram_rd_ena || ex_ram_wr_ena) begin
            mem_next_state = ADDR;
          end
          else begin
            mem_next_state = IDLE;
          end
        end
        else begin
          mem_next_state = RETN;
        end
      end
      default: begin
        mem_next_state = IDLE;
      end
    endcase
  end

  assign mem_rw_valid = mem_state == ADDR;
  assign mem_rw_req = mem_ram_wr_ena;
  assign mem_w_data = mem_ram_wr_src & (
      ({64{op_sb}} & 64'hff)
    | ({64{op_sh}} & 64'hffff)
    | ({64{op_sw}} & 64'hffffffff)
    | ({64{op_sd}} & 64'hffffffffffffffff)
  );
  assign mem_rw_addr = mem_addr;
  assign mem_rw_size = (
      ({2{op_sb || op_lb || op_lbu}} & `YSYX210611_SIZE_B)
    | ({2{op_sh || op_lh || op_lhu}} & `YSYX210611_SIZE_H)
    | ({2{op_sw || op_lw || op_lwu}} & `YSYX210611_SIZE_W)
    | ({2{op_sd || op_ld          }} & `YSYX210611_SIZE_D)
  );
  

  reg[`YSYX210611_REG_BUS] mem_data;
  always @(posedge clk) begin
    if (rst) begin
      mem_data <= 64'b0;
    end
    else if (mem_handshake) begin
      mem_data <= (
          ({64{op_lb}} & {{56{mem_r_data[7 ]}}, mem_r_data[7  : 0]})
        | ({64{op_lh}} & {{48{mem_r_data[15]}}, mem_r_data[15 : 0]})
        | ({64{op_lw}} & {{32{mem_r_data[31]}}, mem_r_data[31 : 0]})
        | ({64{op_ld}} & mem_r_data)
        | ({64{op_lbu}} & {56'b0, mem_r_data[7  : 0]})
        | ({64{op_lhu}} & {48'b0, mem_r_data[15 : 0]})
        | ({64{op_lwu}} & {32'b0, mem_r_data[31 : 0]})
      );
    end
  end
  
  assign mem_finish = mem_state == RETN;
  assign mem_ex_data = mem_addr;

  assign mem_to_wb_bus = {
    // wb stage
    mem_reg_wr_ena,  // 200:200
    mem_reg_wr_addr, // 199:195
    mem_reg_wr_ctrl, // 194:192
    mem_ex_data,     // 191:0
    mem_data,        // 127:0
    mem_csr_rd_data  // 63 :0
  };

  assign mem_forward_bus = {
    mem_reg_wr_addr, // 72 :68
    mem_reg_wr_ena,  // 67 :67
    mem_ex_data,     // 66 :3
    mem_reg_wr_ctrl  // 2  :0
  };
endmodule

module ysyx_210611_regfile(
  input  wire clk,
  input  wire rst,
	
	input  wire [4  : 0] w_addr,
	input  wire [`YSYX210611_REG_BUS] w_data,
  input  wire w_ena,
	
	input  wire [4  : 0] r_addr1,
	output wire [`YSYX210611_REG_BUS] r_data1,
	input  wire r_ena1,
	
	input  wire [4  : 0] r_addr2,
	output wire [`YSYX210611_REG_BUS] r_data2,
	input  wire r_ena2
  );

    // 32 registers
	reg [`YSYX210611_REG_BUS] 	regs[0 : 31];

	always @(posedge clk) 
	begin
		if (rst) begin
			regs[ 0] <= `YSYX210611_ZERO_WORD;
			regs[ 1] <= `YSYX210611_ZERO_WORD;
			regs[ 2] <= `YSYX210611_ZERO_WORD;
			regs[ 3] <= `YSYX210611_ZERO_WORD;
			regs[ 4] <= `YSYX210611_ZERO_WORD;
			regs[ 5] <= `YSYX210611_ZERO_WORD;
			regs[ 6] <= `YSYX210611_ZERO_WORD;
			regs[ 7] <= `YSYX210611_ZERO_WORD;
			regs[ 8] <= `YSYX210611_ZERO_WORD;
			regs[ 9] <= `YSYX210611_ZERO_WORD;
			regs[10] <= `YSYX210611_ZERO_WORD;
			regs[11] <= `YSYX210611_ZERO_WORD;
			regs[12] <= `YSYX210611_ZERO_WORD;
			regs[13] <= `YSYX210611_ZERO_WORD;
			regs[14] <= `YSYX210611_ZERO_WORD;
			regs[15] <= `YSYX210611_ZERO_WORD;
			regs[16] <= `YSYX210611_ZERO_WORD;
			regs[17] <= `YSYX210611_ZERO_WORD;
			regs[18] <= `YSYX210611_ZERO_WORD;
			regs[19] <= `YSYX210611_ZERO_WORD;
			regs[20] <= `YSYX210611_ZERO_WORD;
			regs[21] <= `YSYX210611_ZERO_WORD;
			regs[22] <= `YSYX210611_ZERO_WORD;
			regs[23] <= `YSYX210611_ZERO_WORD;
			regs[24] <= `YSYX210611_ZERO_WORD;
			regs[25] <= `YSYX210611_ZERO_WORD;
			regs[26] <= `YSYX210611_ZERO_WORD;
			regs[27] <= `YSYX210611_ZERO_WORD;
			regs[28] <= `YSYX210611_ZERO_WORD;
			regs[29] <= `YSYX210611_ZERO_WORD;
			regs[30] <= `YSYX210611_ZERO_WORD;
			regs[31] <= `YSYX210611_ZERO_WORD;
		end
		else begin
			if ((w_ena == 1'b1) && (w_addr != 5'h00))	
				regs[w_addr] <= w_data;
		end
	end
	
	assign r_data1 = {64{r_ena1}} & (
    (r_addr1 == w_addr && (|r_addr1)) ? w_data : regs[r_addr1]
	);
	assign r_data2 = {64{r_ena2}} & (
    (r_addr2 == w_addr && (|r_addr2)) ? w_data : regs[r_addr2]
	);
endmodule

module ysyx_210611_wb_stage (
  input wire                              clk,
  input wire                              rst,
  
  // pipeline control
  input wire                              mem_to_wb_valid,
  input wire [`YSYX210611_MEM_TO_WB_WIDTH-1:0]       mem_to_wb_bus,
  output wire                             wb_allowin,
  
  output wire [`YSYX210611_WB_FORWARD_WIDTH-1:0]     wb_forward_bus,
  
  // regfile control
  output wire                             reg_wr_ena,
  output wire [4 : 0]                     reg_wr_addr,
  output wire [`YSYX210611_REG_BUS]                  reg_wr_data
  );
  
  // pipeline control
  reg wb_valid;
  reg [`YSYX210611_MEM_TO_WB_WIDTH-1:0] mem_to_wb_bus_r;
  assign wb_allowin = 1'b1;
  
  always @(posedge clk) begin
    if (rst) begin
      wb_valid <= 1'b0;
      mem_to_wb_bus_r <= 0;
    end
    else if (wb_allowin) begin
      wb_valid <= mem_to_wb_valid;
    end

    if (mem_to_wb_valid && wb_allowin) begin
      mem_to_wb_bus_r <= mem_to_wb_bus;
    end
  end
  
  // write in
  wire            wb_wen;
  wire [4  : 0]   wb_wdest;
  assign reg_wr_ena = wb_wen && wb_valid;
  assign reg_wr_addr = wb_wdest;
  wire [`YSYX210611_REG_CTRL_BUS] wb_reg_wr_ctrl;
  wire [`YSYX210611_REG_BUS] wb_ex_data, wb_mem_rd_data, wb_csr_rd_data;

  assign {
    wb_wen,         // 200:200
    wb_wdest,       // 199:195
    wb_reg_wr_ctrl, // 194:192
    wb_ex_data,     // 191:0
    wb_mem_rd_data,    // 127:0
    wb_csr_rd_data     // 63 :0
  } = mem_to_wb_bus_r & {`YSYX210611_MEM_TO_WB_WIDTH{wb_valid}};
  
  wire mem_to_reg = wb_reg_wr_ctrl[`YSYX210611_MEM_TO_REG];
  wire ex_to_reg  = wb_reg_wr_ctrl[`YSYX210611_EXE_TO_REG];
  wire csr_to_reg = wb_reg_wr_ctrl[`YSYX210611_CSR_TO_REG];
  
  assign reg_wr_data = (
      ({64{mem_to_reg}} & wb_mem_rd_data)
    | ({64{ex_to_reg}}  & wb_ex_data)
    | ({64{csr_to_reg}} & wb_csr_rd_data)
  );

  assign wb_forward_bus = {
    reg_wr_addr,       // 136:132
    reg_wr_ena,        // 131:131
    wb_ex_data,        // 130:67
    wb_mem_rd_data,    // 66 :3
    wb_reg_wr_ctrl     // 2  :0
  };
endmodule
