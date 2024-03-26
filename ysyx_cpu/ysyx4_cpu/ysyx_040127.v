/* verilator lint_off DECLFILENAME */

`timescale 1ps/1ps
`define YSYX040127_IF_TO_ID_WIDTH  64
`define YSYX040127_ID_TO_EX_WIDTH  272
`define YSYX040127_EX_TO_MEM_WIDTH 194
`define YSYX040127_MEM_TO_WB_WIDTH 193
`define YSYX040127_CACHE_DATA_SIZE 128

`define YSYX040127_CLINT_MTIMECMP 64'h2004000
`define YSYX040127_CLINT_MTIME    64'h200bff8

//wotlk hype wotlk hype 
module ysyx_040127(
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
  input  [3:0]  io_master_bid,
  input  [1:0]  io_master_bresp,
  input         io_master_arready,
  output        io_master_arvalid,
  output [3:0]  io_master_arid,
  output [31:0] io_master_araddr,
  output [7:0]  io_master_arlen,
  output [2:0]  io_master_arsize,
  output [1:0]  io_master_arburst,
  output        io_master_rready,
  input         io_master_rvalid,
  input  [3:0]  io_master_rid,
  input  [1:0]  io_master_rresp,
  input  [63:0] io_master_rdata,
  input         io_master_rlast,
  output        io_slave_awready,
  input         io_slave_awvalid,
  input  [3:0]  io_slave_awid,
  input  [31:0] io_slave_awaddr,
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
  output [3:0]  io_slave_bid,
  output [1:0]  io_slave_bresp,
  output        io_slave_arready,
  input         io_slave_arvalid,
  input  [3:0]  io_slave_arid,
  input  [31:0] io_slave_araddr,
  input  [7:0]  io_slave_arlen,
  input  [2:0]  io_slave_arsize,
  input  [1:0]  io_slave_arburst,
  input         io_slave_rready,
  output        io_slave_rvalid,
  output [3:0]  io_slave_rid,
  output [1:0]  io_slave_rresp,
  output [63:0] io_slave_rdata,
  output        io_slave_rlast,
  output [5:0]  io_sram0_addr,
  output        io_sram0_cen,
  output        io_sram0_wen,
  output [127:0] io_sram0_wmask,
  output [127:0] io_sram0_wdata,
  input [127:0]  io_sram0_rdata,
  output [5:0]  io_sram1_addr,
  output        io_sram1_cen,
  output        io_sram1_wen,
  output [127:0] io_sram1_wmask,
  output [127:0] io_sram1_wdata,
  input  [127:0] io_sram1_rdata,
  output [5:0]  io_sram2_addr,
  output        io_sram2_cen,
  output        io_sram2_wen,
  output [127:0] io_sram2_wmask,
  output [127:0] io_sram2_wdata,
  input  [127:0] io_sram2_rdata,
  output [5:0]  io_sram3_addr,
  output        io_sram3_cen,
  output        io_sram3_wen,
  output [127:0] io_sram3_wmask,
  output [127:0] io_sram3_wdata,
  input  [127:0] io_sram3_rdata,
  output [5:0]  io_sram4_addr,
  output        io_sram4_cen,
  output        io_sram4_wen,
  output [127:0] io_sram4_wmask,
  output [127:0] io_sram4_wdata,
  input  [127:0] io_sram4_rdata,
  output [5:0]  io_sram5_addr,
  output        io_sram5_cen,
  output        io_sram5_wen,
  output [127:0] io_sram5_wmask,
  output [127:0] io_sram5_wdata,
  input  [127:0] io_sram5_rdata,
  output [5:0]  io_sram6_addr,
  output        io_sram6_cen,
  output        io_sram6_wen,
  output [127:0] io_sram6_wmask,
  output [127:0] io_sram6_wdata,
  input  [127:0] io_sram6_rdata,
  output [5:0]  io_sram7_addr,
  output        io_sram7_cen,
  output        io_sram7_wen,
  output [127:0] io_sram7_wmask,
  output [127:0] io_sram7_wdata,
  input  [127:0] io_sram7_rdata
);
  assign io_slave_awready = 0;
  assign io_slave_wready = 0;
  assign io_slave_bvalid = 0;
  assign io_slave_bresp = 0;
  assign io_slave_bid = 0;
  assign io_slave_arready = 0;

  assign io_slave_rvalid = 0;
  assign io_slave_rresp  = 0;
  assign io_slave_rdata  = 0;
  assign io_slave_rlast  = 0;
  assign io_slave_rid    = 0;



  wire       timer_int;
  wire[31:0] mepc_low;
  wire[31:0] mtvec_low;
  wire       mstatus;//[3]
  wire       mie;


  wire[31:0] if_instruction;
  wire       if_flush;
  reg [31:0] if_pc;
  reg        if_valid;
  reg        if_timer_int_tmp;
  wire       if_timer_int;
  wire       if_ready_go;
  wire       if_allowin;
  wire       if_to_id_valid;

  wire[31:0] id_branch_result;
  wire       id_branch_taken;
  wire[4:0]  id_rs1;
  wire[4:0]  id_rs2;
  wire       id_flush;
  wire       id_allowin;
  wire[63:0] id_regdata1;
  wire[63:0] id_regdata2;
  wire       id_to_ex_valid;

  wire[31:0]  ex_pc;
  wire        ex_ecall;
  wire[1:0]   ex_memop_low;
  wire[7:0]   ex_wmask;
  wire        ex_flush;
  wire        ex_allowin;
  wire        ex_ready_go;
  wire        ex_fencei;
  wire        ex_to_mem_valid;
  wire        ex_excptions;
  wire        ex_csr_we;
  wire        ex_mret;

  wire        dcache_pipelinehit;
  wire        mem_allowin;
  wire        mem_to_wb_valid;
  wire        mem_flush;
  wire[63:0]  mem_alu_output;
  wire        mem_memread;
  wire[63:0]  mem_doubly_aligned_data;
  wire        mem_ecall;
  wire        mem_csr_we;
  // wire        mmio_reg;
  // wire        wb_flush;

  wire[`YSYX040127_IF_TO_ID_WIDTH - 1:0]  if_to_id_bus;
  wire[`YSYX040127_ID_TO_EX_WIDTH - 1:0]  id_to_ex_bus;
  wire[`YSYX040127_EX_TO_MEM_WIDTH - 1:0] ex_to_mem_bus;//width TBD
  wire[`YSYX040127_MEM_TO_WB_WIDTH - 1:0] mem_to_wb_bus;//width TBD
  wire[`YSYX040127_CACHE_DATA_SIZE - 1:0] d_req_data;
  wire[`YSYX040127_CACHE_DATA_SIZE - 1:0] d_mrdata;
  wire[`YSYX040127_CACHE_DATA_SIZE-1:0]   i_mrdata;

  wire[31:0]d_req_addr;
  wire[7:0] d_req_strb;
  wire d_req_wen;
  wire d_req_valid;
  wire d_res_valid;

  wire[31:0]i_req_addr;
  wire i_req_valid;
  wire i_res_valid;


  wire       wb_allowin;//ready_go is distributed in every module.
  wire[63:0] wb_reg_wdata;
  wire       wb_mret;
  wire[4:0]  wb_rd;
  wire       wb_reg_wen;
  //wire       wb_rmcycle;
  wire       wb_ecall;
  wire       wb_csr_we;
  wire       wb_timer_int;
  wire[31:0] next_pc;
  reg[31:0]  next_pc_reg;

  //bus to be added.
  //PRE_IF

  wire       icache_pipieline_hit;
  wire[31:0] icache_addr;
  wire       icache_valid;
  reg        preif_valid;
  reg        preif_ready_go_reg;
  wire       preif_ready_go;
  wire       preif_allowin;
  wire       preif_timer_int;
  //reg        timerint_on;
  //reg[31:0]  timerint_pc;
  reg        timer_blocked;
  reg        if_timer_blocked;
  //wire       timer_cancel;
  wire[63:0] icache_data;
  wire       load_branch;

  wire[5:0]  d_io_sram_addr;
  wire       d_io_sram_cs;
  reg        d_io_sram_cs_reg;
  wire[127:0]dcache_wdata;
  wire[127:0]dcache_strb;
  wire       d_io_sram_cen_way0;
  wire       d_io_sram_cen_way1;
  wire       d_io_sram_wen_way0;
  wire       d_io_sram_wen_way1;
  wire[5:0]  i_io_sram_addr;
  wire       i_io_sram_cs;
  reg        i_io_sram_cs_reg;
  wire[127:0]icache_wdata;
  wire[127:0]icache_strb;
  wire       i_io_sram_cen_way0;
  wire       i_io_sram_cen_way1;
  wire       i_io_sram_wen_way0;
  wire       i_io_sram_wen_way1;
  wire       ecallmret_on;
  wire[63:0] ex_mem_wdata;
  wire       ex_memwrite;
  wire[2:0]  ex_memop;

  reg[31:0] if_instruction_reg;
  reg       if_instruction_blocked;
  reg[63:0] cyclecnt;

  assign mem_ecall  = mem_to_wb_bus[108:108];
  assign mem_csr_we = mem_to_wb_bus[110:110];
  assign ex_csr_we  = ex_to_mem_bus[111:111];
  assign io_sram0_wdata = icache_wdata;
  assign io_sram1_wdata = icache_wdata;
  assign io_sram2_wdata = icache_wdata;
  assign io_sram3_wdata = icache_wdata;
  assign io_sram4_wdata = dcache_wdata;
  assign io_sram5_wdata = dcache_wdata;
  assign io_sram6_wdata = dcache_wdata;
  assign io_sram7_wdata = dcache_wdata;

  
  assign io_sram0_wmask = ~icache_strb;
  assign io_sram1_wmask = ~icache_strb;
  assign io_sram2_wmask = ~icache_strb;
  assign io_sram3_wmask = ~icache_strb;
  assign io_sram4_wmask = ~dcache_strb;
  assign io_sram5_wmask = ~dcache_strb;
  assign io_sram6_wmask = ~dcache_strb;
  assign io_sram7_wmask = ~dcache_strb;

  assign io_sram0_addr  = i_io_sram_addr;
  assign io_sram1_addr  = i_io_sram_addr;
  assign io_sram2_addr  = i_io_sram_addr;
  assign io_sram3_addr  = i_io_sram_addr;
  assign io_sram4_addr  = d_io_sram_addr;
  assign io_sram5_addr  = d_io_sram_addr;
  assign io_sram6_addr  = d_io_sram_addr;
  assign io_sram7_addr  = d_io_sram_addr;


  assign io_sram0_cen   = ~(!i_io_sram_cs & i_io_sram_cen_way0);
  assign io_sram1_cen   = ~(i_io_sram_cs & i_io_sram_cen_way0);
  assign io_sram2_cen   = ~(!i_io_sram_cs & i_io_sram_cen_way1);
  assign io_sram3_cen   = ~(i_io_sram_cs & i_io_sram_cen_way1);
  assign io_sram4_cen   = ~(!d_io_sram_cs & d_io_sram_cen_way0);
  assign io_sram5_cen   = ~(d_io_sram_cs & d_io_sram_cen_way0);
  assign io_sram6_cen   = ~(!d_io_sram_cs & d_io_sram_cen_way1);
  assign io_sram7_cen   = ~(d_io_sram_cs & d_io_sram_cen_way1);

  assign io_sram0_wen   = ~(!i_io_sram_cs & i_io_sram_wen_way0);
  assign io_sram1_wen   = ~(i_io_sram_cs & i_io_sram_wen_way0);
  assign io_sram2_wen   = ~(!i_io_sram_cs & i_io_sram_wen_way1);
  assign io_sram3_wen   = ~(i_io_sram_cs & i_io_sram_wen_way1);
  assign io_sram4_wen   = ~(!d_io_sram_cs & d_io_sram_wen_way0);
  assign io_sram5_wen   = ~(d_io_sram_cs & d_io_sram_wen_way0);
  assign io_sram6_wen   = ~(!d_io_sram_cs & d_io_sram_wen_way1);
  assign io_sram7_wen   = ~(d_io_sram_cs & d_io_sram_wen_way1);

  always @(posedge clock) begin
    if(reset) begin
      preif_valid <= 1'b0;
    end else if(preif_allowin)begin
      preif_valid <= 1'b1;
    end

    if(reset)begin
      d_io_sram_cs_reg <= 0;
      i_io_sram_cs_reg <= 0;
    end else begin
      d_io_sram_cs_reg <= d_io_sram_cs;
      i_io_sram_cs_reg <= i_io_sram_cs;
    end
    if(reset)begin
      timer_blocked <= 1'b0;
    end else if(wb_timer_int & timer_int & i_req_valid) begin
      //$display("!! at %0d\n",cyclecnt);
      timer_blocked <= 1'b1;
    end else if(preif_ready_go)begin//?
      timer_blocked <= 1'b0;
    end

  end
  //assign     io_master_buser = 1'b0;
  //assign     io_master_ruser = 1'b0;
  //assign     timer_cancel  = timerint_on & !timer_int;// & cmt_intrno != 64'h7;
  assign     preif_allowin = !preif_valid || preif_ready_go && if_allowin;
  assign     next_pc =
    //(timer_cancel) ? timerint_pc :
    (wb_mret) ? mepc_low[31:0] :
    (wb_ecall | (wb_timer_int & timer_int) | timer_blocked) ? mtvec_low[31:0] ://todo:sort,cancel the pipeline effect   | timer_blocked (6)
    (id_branch_taken & id_allowin & !if_timer_blocked) ? id_branch_result ://& !id_timer_int
    (id_branch_taken & id_allowin & if_timer_blocked) ? mtvec_low[31:0] ://& !id_timer_int
    (preif_valid & preif_ready_go_reg) ? if_pc + 4 :
    next_pc_reg;
    //if_pc;
  assign     icache_addr  = next_pc;//icache request
  assign     icache_valid = preif_valid & if_allowin & !if_instruction_blocked;// & (!timer_int | wb_timer_int)

  //reg     preif_valid = !reset;
  assign     preif_ready_go = preif_valid & icache_pipieline_hit;//preif_valid?
  assign     preif_timer_int = timer_int & !(wb_timer_int & timer_int);

  ysyx_040127_axi_rw axi(
    .clk(clock),
    .rst(reset),
    .d_req_addr(d_req_addr),
    .d_req_strb(d_req_strb),
    .d_req_data(d_req_data),
    .d_req_wen(d_req_wen),
    .d_req_valid(d_req_valid),
    .d_res_valid(d_res_valid),
    .d_mrdata(d_mrdata),
    .i_req_addr(i_req_addr),
    .i_req_valid(i_req_valid),
    .i_res_valid(i_res_valid),
    .i_mrdata(i_mrdata),
    // Advanced eXtensible Interface
    .axi_aw_ready_i(io_master_awready),
    .axi_aw_valid_o(io_master_awvalid),
    .axi_aw_addr_o(io_master_awaddr),
    //.axi_aw_prot_o(io_master_awprot),
    .axi_aw_id_o(io_master_awid),
    //.axi_aw_user_o(io_master_awuser),
    .axi_aw_len_o(io_master_awlen),
    .axi_aw_size_o(io_master_awsize),
    .axi_aw_burst_o(io_master_awburst),
    //lock cache qos region is useless
    //.axi_aw_lock_o(io_master_awlock),
    //.axi_aw_cache_o(io_master_awcache),
    //.axi_aw_qos_o(io_master_awqos),
    //.axi_aw_region_o(io_master_awregion),

    .axi_w_ready_i(io_master_wready),
    .axi_w_valid_o(io_master_wvalid),
    .axi_w_data_o(io_master_wdata),
    .axi_w_strb_o(io_master_wstrb),
    .axi_w_last_o(io_master_wlast),
    //.axi_w_user_o(io_master_wuser),//ok
    .axi_b_ready_o(io_master_bready),
    .axi_b_valid_i(io_master_bvalid),
    //.axi_b_resp_i(io_master_bresp),//abandon
    //.axi_b_id_i(io_master_bid),
    //.axi_b_user_i(io_master_buser),

    .axi_ar_ready_i(io_master_arready),
    .axi_ar_valid_o(io_master_arvalid),
    .axi_ar_addr_o(io_master_araddr),
    //.axi_ar_prot_o(io_master_arprot),
    .axi_ar_id_o(io_master_arid),
    //.axi_ar_user_o(io_master_aruser),
    .axi_ar_len_o(io_master_arlen),
    .axi_ar_size_o(io_master_arsize),
    .axi_ar_burst_o(io_master_arburst),
    //.axi_ar_lock_o(io_master_arlock),
    //.axi_ar_cache_o(io_master_arcache),
    //.axi_ar_qos_o(io_master_arqos),
    //.axi_ar_region_o(io_master_arregion),

    .axi_r_ready_o(io_master_rready),
    .axi_r_valid_i(io_master_rvalid),
    //.axi_r_resp_i(io_master_rresp),//abandon
    .axi_r_data_i(io_master_rdata),
    .axi_r_last_i(io_master_rlast)
    //.axi_r_id_i(io_master_rid)
    //.axi_r_user_i(io_master_ruser)
  );

  ysyx_040127_icache icache(
    .clk(clock),
    .rst(reset),
    .input_addr(icache_addr),
    .input_memread(1'b1),
    .input_valid(icache_valid),
    .load_branch(load_branch),
    .id_allowin(id_allowin),
    .output_data(icache_data),
    .cache_pipelinehit(icache_pipieline_hit),
    .axi_req_addr(i_req_addr),
    .axi_req_valid(i_req_valid),
    .axi_res_valid(i_res_valid),
    .axi_mrdata(i_mrdata),

    .io_sram_addr(i_io_sram_addr),
    .io_sram_cs(i_io_sram_cs),
    .io_sram_cen_way0(i_io_sram_cen_way0),
    .io_sram_cen_way1(i_io_sram_cen_way1),
    .io_sram_wen_way0(i_io_sram_wen_way0),
    .io_sram_wen_way1(i_io_sram_wen_way1),
    .cache_strb(icache_strb),
    .cache_wdata(icache_wdata),
    .cache_rdata_way0(i_io_sram_cs_reg ? io_sram1_rdata : io_sram0_rdata),//cs=0/1
    .cache_rdata_way1(i_io_sram_cs_reg ? io_sram3_rdata : io_sram2_rdata) //cs=0/1
  );

  ysyx_040127_dcache dcache(
    .clk(clock),
    .rst(reset),
    .input_addr(ex_to_mem_bus[63:0]),//ex_alu_output
    .input_wdata(ex_mem_wdata),//ex_wdata(temporary)
    .input_memwrite(ex_memwrite & !ex_excptions),
    .input_memread(ex_to_mem_bus[69:69] & !ex_excptions),//ex_memread
    //ex_to_mem_valid &
    .input_valid((ex_to_mem_bus[69:69] | ex_memwrite) & !ex_excptions),//is this right?(2 places, execute is another)
    .input_size(ex_memop_low),
    .input_strb(ex_wmask),//bitmask
    .csr_mie(mie),
    .mstatus(mstatus),
    .output_data(mem_doubly_aligned_data),
    .cache_pipelinehit(dcache_pipelinehit),
    //.mmio_reg(mmio_reg),
    .timer_int(timer_int),
    .fencei(ex_fencei),

    .ex_ecall(ex_ecall),
    .ex_csr_we(ex_csr_we),
    .mem_ecall(mem_ecall),
    .mem_csr_we(mem_csr_we),
    .wb_ecall(wb_ecall),
    .wb_csr_we(wb_csr_we),

    .axi_req_addr(d_req_addr),
    .axi_req_strb(d_req_strb),
    .axi_req_data(d_req_data),
    .axi_req_wen(d_req_wen),
    .axi_req_valid(d_req_valid),
    .axi_res_valid(d_res_valid),
    .axi_mrdata(d_mrdata),

    .io_sram_addr(d_io_sram_addr),
    .io_sram_cs(d_io_sram_cs),
    .io_sram_cen_way0(d_io_sram_cen_way0),
    .io_sram_cen_way1(d_io_sram_cen_way1),
    .io_sram_wen_way0(d_io_sram_wen_way0),
    .io_sram_wen_way1(d_io_sram_wen_way1),
    .cache_strb(dcache_strb),
    .cache_wdata(dcache_wdata),
    .cache_rdata_way0(d_io_sram_cs_reg ? io_sram5_rdata : io_sram4_rdata),//cs=0/1
    .cache_rdata_way1(d_io_sram_cs_reg ? io_sram7_rdata : io_sram6_rdata),//cs=0/1
    .ecallmret_on(ecallmret_on)
  );


  //import "DPI-C" function void set_simtime();//terminate
  assign if_flush  = wb_mret | wb_ecall;//assign!! don't question

  assign if_ready_go    = 1'b1;
  assign if_allowin     = !if_valid || if_ready_go && id_allowin;
  //once reset = 0, if_allowin is set to 1
  assign if_to_id_valid = if_valid && if_ready_go;//always ready to go
  assign if_to_id_bus   = {id_branch_taken & !if_timer_blocked
  | wb_mret | wb_ecall | if_timer_int ? // ecall???
  32'b0 : if_instruction, if_pc};
  assign if_timer_int = if_timer_int_tmp | timer_int;

  assign    if_instruction = //id_allowin ? if_instruction_reg :
  (if_pc[2]?icache_data[63:32]:icache_data[31:0]);
  always @(posedge clock) begin
    if(reset)begin//or preif?
      if_instruction_reg     <= 32'b0;
      if_instruction_blocked <= 1'b0;
    end else if(preif_ready_go_reg & !if_allowin)begin//cannot id_branch_taken?
      if_instruction_reg     <= if_instruction;
      if_instruction_blocked <= 1'b1;
    end else if(if_to_id_valid & id_allowin)
      if_instruction_blocked   <= 1'b0;

    if(!reset)next_pc_reg <= next_pc;
    else next_pc_reg    <= 32'h30000000;

    if(reset)preif_ready_go_reg <= 1'b0;
    else preif_ready_go_reg <= preif_ready_go;
  end

  always @(posedge clock) begin
    if(reset) begin
      if_valid <= 1'b0;
    end else if(if_allowin)begin
      if_valid <= preif_ready_go;//add more?
    end

    if(reset == 1'b1)begin
      if_pc <= 32'h30000000;
      if_timer_int_tmp <= 1'b0;
      if_timer_blocked <= 1'b0;
    end else if(preif_ready_go & if_allowin)begin
      if_pc <= next_pc;
      if_timer_int_tmp <= preif_timer_int;//unuse
      if_timer_blocked <= timer_blocked;
    end
    /*
    else if(id_branch_taken && if_allowin) if_pc <= id_branch_result;//id_inst_type == TYPE_B -> id_branch_taken
    else if(wb_mret)if_pc <= mepc_low[31:0];
    else if(if_allowin)if_pc <= if_pc + 4;
    */
  end

  ysyx_040127_decode dec(
    .clk(clock),
    .rst(reset),
    .if_to_id_valid(if_to_id_valid),
    .if_to_id_bus(if_to_id_bus),
    .if_timer_int(if_timer_int),
    .id_allowin(id_allowin),
    .id_to_ex_valid(id_to_ex_valid),
    .id_to_ex_bus(id_to_ex_bus),
    .id_rs1(id_rs1),
    .id_rs2(id_rs2),
    .id_regdata1_tmp(id_regdata1),
    .id_regdata2_tmp(id_regdata2),
    .timer_int(timer_int),
    .id_branch_result(id_branch_result),
    .id_branch_taken(id_branch_taken),
    .id_flush(id_flush),
    .ex_allowin(ex_allowin),
    .ex_rd(ex_to_mem_bus[68:64]),
    .ex_alu_output(ex_to_mem_bus[63:0]),
    .ex_memread(ex_to_mem_bus[69:69]),
    .ex_reg_wen(ex_to_mem_bus[70:70]),
    .ex_csr_we(ex_to_mem_bus[111:111]),
    .ex_pc(ex_pc),
    .ex_mret(ex_mret),
    .ex_ecall(ex_ecall),
    .mem_rd(mem_to_wb_bus[68:64]),
    .mem_alu_output(mem_alu_output),
    .mem_memread(mem_memread),
    .mem_reg_wen(mem_to_wb_bus[69:69]),
    .mem_mret(mem_to_wb_bus[109:109]),
    .mem_ecall(mem_to_wb_bus[108:108]),
    .mem_csr_we(mem_to_wb_bus[110:110]),
    .wb_reg_wen(wb_reg_wen),
    .wb_rd(wb_rd),
    .wb_reg_wdata(wb_reg_wdata),
    .wb_mret(wb_mret),
    .wb_ecall(wb_ecall),
    .if_flush(if_flush),
    .if_instruction_reg(if_instruction_reg),
    .if_instruction_blocked(if_instruction_blocked),
    .load_branch(load_branch),
    .ecallmret_on(ecallmret_on),
    .mepc_low(mepc_low)
  );
  ysyx_040127_execute exe(
    .clk(clock),
    .rst(reset),
    .ex_allowin(ex_allowin),
    .mem_allowin(mem_allowin),
    .id_to_ex_valid(id_to_ex_valid),
    .ex_to_mem_valid(ex_to_mem_valid),
    .id_to_ex_bus(id_to_ex_bus),
    .ex_to_mem_bus(ex_to_mem_bus),
    .mem_mret(mem_to_wb_bus[109:109]),
    .mem_ecall(mem_to_wb_bus[108:108]),
    //.mem_timer_int(mem_to_wb_bus[192:192]),
    .id_flush(id_flush),
    .cache_pipelinehit(dcache_pipelinehit),
    .ex_excptions(ex_excptions),
    .ex_flush(ex_flush),//can combine
    .ex_pc(ex_pc),
    .ex_ready_go(ex_ready_go),
    .ex_fencei(ex_fencei),
    .ex_mret(ex_mret),
    .ex_ecall(ex_ecall),
    .ex_mem_wdata(ex_mem_wdata),
    .ex_memwrite(ex_memwrite),
    .ex_memop(ex_memop)
  );
  ysyx_040127_memory mem(
    .clk(clock),
    .rst(reset),
    .mem_allowin(mem_allowin),     //for last stage
    .wb_allowin(wb_allowin),       //from next stage
    .ex_to_mem_valid(ex_to_mem_valid),//from last stage
    .mem_to_wb_valid(mem_to_wb_valid),//for next stage
    .ex_to_mem_bus(ex_to_mem_bus),
    .mem_to_wb_bus(mem_to_wb_bus),
    .mem_alu_output(mem_alu_output),
    .mem_memread(mem_memread),
    .ex_flush(ex_flush),
    .ex_ready_go(ex_ready_go),
    .ex_memop(ex_memop),
    .ex_memop_low(ex_memop_low),
    .ex_wmask(ex_wmask),
    .mem_flush(mem_flush),
    .mem_doubly_aligned_data_tmp(mem_doubly_aligned_data)
  );
  ysyx_040127_RegisterFile wb(
    .clk(clock),
    .rst(reset),
    .wb_allowin(wb_allowin),           //for last stage
    .mem_to_wb_valid(mem_to_wb_valid), //from last stage
    .mem_to_wb_bus(mem_to_wb_bus),
    .mem_timer_int(mem_to_wb_bus[192:192]),
    .raddr1(id_rs1),
    .raddr2(id_rs2),
    .rdata1(id_regdata1),
    .rdata2(id_regdata2),
    .timer_int(timer_int),
    .wb_rd(wb_rd),
    .wb_reg_wdata(wb_reg_wdata),
    .wb_reg_wen(wb_reg_wen),
    .wb_mret(wb_mret),
    .wb_timer_int(wb_timer_int),
    .wb_csr_we(wb_csr_we),
    .mepc_low(mepc_low),
    .mtvec_low(mtvec_low),
    .mstatus(mstatus),
    .mie(mie),
    .csr_mcycle(cyclecnt),
    .wb_ecall(wb_ecall),
    .mem_flush(mem_flush)
  );//wb
 
  always @(posedge clock)begin
    if(reset)begin
      cyclecnt  <= 0;
    end else begin
      cyclecnt        <= cyclecnt + 1;
      //if(cyclecnt % 100000 == 0)$display("at %0d\n",cyclecnt);
    end

  end
 
endmodule

// Burst types
`define YSYX040127_AXI_BURST_TYPE_FIXED                                2'b00
//突发类型  FIFO
`define YSYX040127_AXI_BURST_TYPE_INCR                                 2'b01
//ram
`define YSYX040127_AXI_BURST_TYPE_WRAP                                 2'b10
// Access permissions
`define YSYX040127_AXI_PROT_UNPRIVILEGED_ACCESS                        3'b000
`define YSYX040127_AXI_PROT_PRIVILEGED_ACCESS                          3'b001
`define YSYX040127_AXI_PROT_SECURE_ACCESS                              3'b000
`define YSYX040127_AXI_PROT_NON_SECURE_ACCESS                          3'b010
`define YSYX040127_AXI_PROT_DATA_ACCESS                                3'b000
`define YSYX040127_AXI_PROT_INSTRUCTION_ACCESS                         3'b100
// Memory types (AR)
`define YSYX040127_AXI_ARCACHE_DEVICE_NON_BUFFERABLE                   4'b0000
`define YSYX040127_AXI_ARCACHE_DEVICE_BUFFERABLE                       4'b0001
`define YSYX040127_AXI_ARCACHE_NORMAL_NON_CACHEABLE_NON_BUFFERABLE     4'b0010
`define YSYX040127_AXI_ARCACHE_NORMAL_NON_CACHEABLE_BUFFERABLE         4'b0011
`define YSYX040127_AXI_ARCACHE_WRITE_THROUGH_NO_ALLOCATE               4'b1010
`define YSYX040127_AXI_ARCACHE_WRITE_THROUGH_READ_ALLOCATE             4'b1110
`define YSYX040127_AXI_ARCACHE_WRITE_THROUGH_WRITE_ALLOCATE            4'b1010
`define YSYX040127_AXI_ARCACHE_WRITE_THROUGH_READ_AND_WRITE_ALLOCATE   4'b1110
`define YSYX040127_AXI_ARCACHE_WRITE_BACK_NO_ALLOCATE                  4'b1011
`define YSYX040127_AXI_ARCACHE_WRITE_BACK_READ_ALLOCATE                4'b1111
`define YSYX040127_AXI_ARCACHE_WRITE_BACK_WRITE_ALLOCATE               4'b1011
`define YSYX040127_AXI_ARCACHE_WRITE_BACK_READ_AND_WRITE_ALLOCATE      4'b1111
// Memory types (AW)
`define YSYX040127_AXI_AWCACHE_DEVICE_NON_BUFFERABLE                   4'b0000
`define YSYX040127_AXI_AWCACHE_DEVICE_BUFFERABLE                       4'b0001
`define YSYX040127_AXI_AWCACHE_NORMAL_NON_CACHEABLE_NON_BUFFERABLE     4'b0010
`define YSYX040127_AXI_AWCACHE_NORMAL_NON_CACHEABLE_BUFFERABLE         4'b0011
`define YSYX040127_AXI_AWCACHE_WRITE_THROUGH_NO_ALLOCATE               4'b0110
`define YSYX040127_AXI_AWCACHE_WRITE_THROUGH_READ_ALLOCATE             4'b0110
`define YSYX040127_AXI_AWCACHE_WRITE_THROUGH_WRITE_ALLOCATE            4'b1110
`define YSYX040127_AXI_AWCACHE_WRITE_THROUGH_READ_AND_WRITE_ALLOCATE   4'b1110
`define YSYX040127_AXI_AWCACHE_WRITE_BACK_NO_ALLOCATE                  4'b0111
`define YSYX040127_AXI_AWCACHE_WRITE_BACK_READ_ALLOCATE                4'b0111
`define YSYX040127_AXI_AWCACHE_WRITE_BACK_WRITE_ALLOCATE               4'b1111
`define YSYX040127_AXI_AWCACHE_WRITE_BACK_READ_AND_WRITE_ALLOCATE      4'b1111

`define YSYX040127_AXI_SIZE_BYTES_1                                    3'b000
//突发宽度一个数据的宽度
`define YSYX040127_AXI_SIZE_BYTES_2                                    3'b001
`define YSYX040127_AXI_SIZE_BYTES_4                                    3'b010
`define YSYX040127_AXI_SIZE_BYTES_8                                    3'b011
`define YSYX040127_AXI_SIZE_BYTES_16                                   3'b100
`define YSYX040127_AXI_SIZE_BYTES_32                                   3'b101
`define YSYX040127_AXI_SIZE_BYTES_64                                   3'b110
`define YSYX040127_AXI_SIZE_BYTES_128                                  3'b111

module ysyx_040127_axi_rw # (
    parameter AXI_DATA_WIDTH    = 64,
    parameter AXI_ADDR_WIDTH    = 32,
    parameter AXI_ID_WIDTH      = 4
    //parameter AXI_STRB_WIDTH    = AXI_DATA_WIDTH/8,
    //parameter AXI_USER_WIDTH    = 1
)(
    input                               clk,
    input                               rst,

    input [AXI_ADDR_WIDTH-1:0]          d_req_addr,
    input [7:0]                         d_req_strb,
    input [`YSYX040127_CACHE_DATA_SIZE - 1:0]      d_req_data,
    input                               d_req_wen,
    input                               d_req_valid,
    output                              d_res_valid,
    output reg[`YSYX040127_CACHE_DATA_SIZE - 1:0]  d_mrdata,

    input [AXI_ADDR_WIDTH-1:0]          i_req_addr,
    input                               i_req_valid,
    output                              i_res_valid,
    output reg[`YSYX040127_CACHE_DATA_SIZE-1:0]    i_mrdata,

    // Advanced eXtensible Interface
    input                               axi_aw_ready_i,
    output                              axi_aw_valid_o,
    output [31:0]                       axi_aw_addr_o,
    output [AXI_ID_WIDTH-1:0]           axi_aw_id_o,
    output [7:0]                        axi_aw_len_o,
    output [2:0]                        axi_aw_size_o,
    output [1:0]                        axi_aw_burst_o,

    input                               axi_w_ready_i,
    output                              axi_w_valid_o,
    output [AXI_DATA_WIDTH-1:0]         axi_w_data_o,
    output [AXI_DATA_WIDTH/8-1:0]       axi_w_strb_o,
    output                              axi_w_last_o,

    output                              axi_b_ready_o,
    input                               axi_b_valid_i,

    //slave->master
    input                               axi_ar_ready_i,
    //master->slave
    output                              axi_ar_valid_o,
    output [AXI_ADDR_WIDTH-1:0]         axi_ar_addr_o,
    output [AXI_ID_WIDTH-1:0]           axi_ar_id_o,
    output [7:0]                        axi_ar_len_o,
    output [2:0]                        axi_ar_size_o,
    output [1:0]                        axi_ar_burst_o,

    output                              axi_r_ready_o,
    input                               axi_r_valid_i,
    input  [AXI_DATA_WIDTH-1:0]         axi_r_data_i,
    input                               axi_r_last_i
);

    localparam [2:0] W_IDLE  = 3'b000;
    localparam [2:0] W_ADDR  = 3'b001;
    localparam [2:0] W_WRITE = 3'b010;
    localparam [2:0] W_WRITE_WAIT = 3'b101;
    localparam [2:0] W_RESP  = 3'b011;
    localparam [2:0] W_DONE  = 3'b100;

    localparam [2:0] R_IDLE  = 3'b000;
    localparam [2:0] R_INST_ADDR = 3'b001;
    localparam [2:0] R_INST_READ = 3'b010;
    localparam [2:0] R_DATA_ADDR = 3'b011;
    localparam [2:0] R_DATA_READ = 3'b100;
    localparam [2:0] R_INST_DONE = 3'b101;
    localparam [2:0] R_DATA_DONE = 3'b110;
    //wire r_trans = 1'b1;//!d_req_wen | i_req_valid ?
    reg[1:0] flash_rcnt;
    reg      flash_rdone;
    reg      uart_rdone;
    reg      uart_wdone;
    reg      ps2vga_rdone;
    reg      ps2vga_wdone;

    reg[2:0] w_state;
    reg[2:0] r_state;
    wire w_valid = d_req_wen & d_req_valid;
    wire r_valid = i_req_valid | d_req_valid;
    wire data_read = d_req_valid & !d_req_wen;
    wire inst_read = i_req_valid;

    wire aw_hs = axi_aw_ready_i & axi_aw_valid_o;
    wire ar_hs = axi_ar_ready_i & axi_ar_valid_o;
    wire w_hs  = axi_w_ready_i  & axi_w_valid_o;
    wire b_hs  = axi_b_ready_o  & axi_b_valid_i;
    wire r_hs  = axi_r_ready_o  & axi_r_valid_i;

    wire is_flash_i = i_req_addr[31:28] == 4'h3 && i_req_valid; 
    wire is_flash_d = d_req_addr[31:28] == 4'h3 && d_req_valid;//&& d_req_valid
    wire is_uart   = (d_req_addr[31:28] == 4'h1 && (d_req_addr[15:12] == 4'h0 || d_req_addr[15:12] == 4'h1)) && d_req_valid;
    wire is_ps2vga = (d_req_addr[31:28] == 4'h1 
    && (d_req_addr[15:12] == 4'h2 || d_req_addr[15:12] == 4'h3 || d_req_addr[27:24] >= 4'hc)
    || d_req_addr[31:28] == 4'h2) && d_req_valid;

    wire w_done_first = w_hs;
    wire w_done_last  = w_hs & axi_w_last_o;
    wire r_done = r_hs & axi_r_last_i;
    //wire trans_done = d_req_wen ? b_hs : r_done;//?
    wire [AXI_ADDR_WIDTH-1:0] r_addr = //use burst
    r_state == R_INST_ADDR ? (is_flash_i ? ((i_req_addr[31:0] & 32'hfffffff0) + {28'b0,{2'b0,flash_rcnt} << 2})
    : i_req_addr[31:0] & 32'hfffffff0):
    r_state == R_DATA_ADDR ? (is_flash_d ? ((d_req_addr[31:0] & 32'hfffffff0) + {28'b0,{2'b0,flash_rcnt} << 2})
    : is_uart | is_ps2vga ? d_req_addr[31:0] : d_req_addr[31:0] & 32'hfffffff0):
    0;

    //once wvalid is 1 until it is over always 1

    // ------------------State Machine------------------TODO

    //reg      r_done_reg;
    wire w_state_addr  = (w_state == W_ADDR);
    wire w_state_resp  = 1'b1;
    wire w_state_write = (w_state == W_WRITE | w_state == W_WRITE_WAIT);

    wire r_state_addr  = (r_state == R_INST_ADDR | r_state == R_DATA_ADDR);
    wire r_state_read  = (r_state == R_INST_READ | r_state == R_DATA_READ);

    //assign axi_ar_region_o = 4'b0;
    assign i_res_valid = (r_state == R_INST_DONE & !is_flash_i) |
    (r_state == R_INST_DONE & flash_rdone & is_flash_i);
    assign d_res_valid = (r_state == R_DATA_DONE & !is_flash_d & !is_uart & !is_ps2vga)
    | (r_state == R_DATA_DONE & flash_rdone & is_flash_d)
    | (r_state == R_DATA_DONE & uart_rdone  & is_uart)
    | (r_state == R_DATA_DONE & ps2vga_rdone & is_ps2vga)
    ? 1'b1 : (w_state == W_DONE & !is_flash_d & !is_uart & !is_ps2vga)
    | (w_state == W_DONE & (is_uart & uart_wdone) | (is_ps2vga & ps2vga_wdone))
    ? w_valid : 1'b0;// TODO_uart_done
    
    //when i,d both read/ only d read/ only d write
    // write state machine
    always @(posedge clk)begin
        //r_done_reg  <= r_done;

        if(rst)begin
            w_state <= W_IDLE;
            uart_wdone   <= 1'b0;
            ps2vga_wdone <= 1'b0;
        end else begin
            if(w_valid | b_hs | w_state == W_DONE)begin
                case(w_state)
                    W_IDLE:begin
                      w_state <= W_ADDR;
                      uart_wdone <= 1'b0;
                      ps2vga_wdone <= 1'b0;
                    end
                    W_ADDR: if(aw_hs) w_state <= W_WRITE;
                    W_WRITE:if(w_done_first)w_state  <= is_uart | is_ps2vga ? W_RESP : W_WRITE_WAIT;//010
                    W_WRITE_WAIT:if(w_done_last)w_state <= W_RESP;//burst is over       //101
                    W_RESP:begin
                      if(b_hs)begin
                        w_state <= W_DONE;
                        if(is_uart)begin
                          uart_wdone <= 1'b1;
                        end
                        if(is_ps2vga)begin
                          ps2vga_wdone <= 1'b1;
                        end
                      end
                    end
                    W_DONE:begin
                      w_state <= W_IDLE;
                    end
                    default:          w_state <= W_IDLE;
                endcase
            end
        end
    end

    // read state machine
    always @(posedge clk)begin
        if(rst)begin
            r_state <= R_IDLE;
            flash_rdone <= 0;
            flash_rcnt  <= 0;
            uart_rdone   <= 1'b0;
            ps2vga_rdone <= 1'b0;
        end else begin
            if(r_valid)begin
                case(r_state)
                    R_IDLE: begin
                        uart_rdone   <= 1'b0;
                        ps2vga_rdone <= 1'b0;
                        if(inst_read)        r_state <= R_INST_ADDR;//if first
                        else if(data_read)   r_state <= R_DATA_ADDR;
                    end
                    R_INST_ADDR: if(ar_hs)   r_state <= R_INST_READ;
                    R_INST_READ:
                      if(r_done)begin
                        r_state <= R_INST_DONE;
                        if(is_flash_i)begin
                          i_mrdata[flash_rcnt*32+:32] <= axi_r_data_i[31:0];
                          flash_rcnt <= flash_rcnt + 1'b1;
                          if(flash_rcnt == 2'b11)flash_rdone <= 1'b1;
                          else flash_rdone <= 1'b0;
                        end else i_mrdata[127:64] <= axi_r_data_i;
                      end else if(r_hs)i_mrdata[63:0] <= axi_r_data_i;
                    R_DATA_ADDR: if(ar_hs)   r_state <= R_DATA_READ;
                    R_DATA_READ:
                      if(r_done)begin
                        r_state <= R_DATA_DONE;
                        if(is_flash_d)begin
                          d_mrdata[flash_rcnt*32+:32] <= axi_r_data_i[31:0];
                          flash_rcnt <= flash_rcnt + 1'b1;
                          if(flash_rcnt == 2'b11)flash_rdone <= 1'b1;
                          else flash_rdone <= 1'b0;
                        end else if(is_uart | is_ps2vga)begin
                          d_mrdata[63:0]   <= axi_r_data_i;
                          if(is_uart)uart_rdone <= 1'b1;
                          else ps2vga_rdone <= 1'b1;
                        end else d_mrdata[127:64] <= axi_r_data_i;
                      end else if(r_hs)d_mrdata[63:0] <= axi_r_data_i;
                    R_INST_DONE: begin
                        //if(data_read)r_state <= R_DATA_READ;
                        r_state <= R_IDLE;
                    end
                    R_DATA_DONE: begin
                        r_state <= R_IDLE;
                    end
                    default:     r_state <= R_IDLE;
                endcase

            end
        end
    end
    //delete:mask,mask_l,mask_h,aligned_offset_l,aligned_offset_h
    // ------------------Write Transaction------------------
    localparam AXI_SIZE      = $clog2(AXI_DATA_WIDTH / 8);
    localparam FLASH_SIZE    = $clog2(AXI_ADDR_WIDTH / 8);
    localparam UART_SIZE     = 3'b0;
    localparam PS2VGA_SIZE   = FLASH_SIZE;
    wire [AXI_ID_WIDTH-1:0] axi_id              = {AXI_ID_WIDTH{1'b0}};
    //wire [AXI_USER_WIDTH-1:0] axi_user          = {AXI_USER_WIDTH{1'b0}};
    wire [7:0] axi_wlen     = 8'b1;//w_valid ? 8'b1 : 8'b0;
    wire [7:0] axi_rlen     = 8'b1;//inst_read | data_read ? 8'b1 : 8'b0;
    wire [2:0] axi_size     = AXI_SIZE[2:0];
    wire [2:0] flash_size   = FLASH_SIZE[2:0];
    wire [2:0] uart_size    = UART_SIZE[2:0];
    wire [2:0] ps2vga_size  = PS2VGA_SIZE[2:0];

    // 写地址通道  以下没有备注初始化信号的都可能是你需要产生和用到的
    assign axi_aw_valid_o   = w_state_addr;
    assign axi_aw_addr_o    = d_req_addr[31:0];
    assign axi_aw_id_o      = axi_id;//初始化信号即可
    assign axi_aw_len_o     = (is_uart | is_ps2vga) & d_req_wen ? 0 : axi_wlen;
    assign axi_aw_size_o    = {3{is_uart & d_req_wen}} & uart_size |
    {3{is_ps2vga & d_req_wen}} & ps2vga_size |
    {3{(!is_ps2vga & !is_uart)}} & axi_size;
    assign axi_aw_burst_o   = `YSYX040127_AXI_BURST_TYPE_INCR;
    //assign axi_aw_lock_o    = 1'b0;                                                                             //初始化信号即可
    //assign axi_aw_cache_o   = `YSYX040127_AXI_ARCACHE_NORMAL_NON_CACHEABLE_NON_BUFFERABLE;                                  //初始化信号即可
    //assign axi_aw_qos_o     = 4'h0;                                                                             //初始化信号即可
    //assign axi_aw_region_o  = 4'h0;                                                                             //初始化信号即可
    //ok

    // 写数据通道
    assign axi_w_valid_o    = w_state_write;//ok
    assign axi_w_data_o     = w_state == W_WRITE ? d_req_data[63:0]: d_req_data[127:64];
    assign axi_w_strb_o     = d_req_strb;
    assign axi_w_last_o     = (w_state == W_WRITE_WAIT | 
    (is_uart | is_ps2vga & d_req_wen & w_state == W_WRITE)) ? 1'b1 : 1'b0;
    //assign axi_w_user_o     = axi_user;                                                                         //初始化信号即可

    // 写应答通道
    assign axi_b_ready_o    = w_state_resp;

    // ------------------Read Transaction------------------

    // Read address channel signals
    // no last in ar
    assign axi_ar_valid_o   = r_state_addr;
    assign axi_ar_addr_o    = r_addr[31:0];
    //assign axi_ar_prot_o    = 3'b000;//`YSYX040127_AXI_PROT_UNPRIVILEGED_ACCESS | `YSYX040127_AXI_PROT_SECURE_ACCESS | `YSYX040127_AXI_PROT_DATA_ACCESS;  //初始化信号即可
    assign axi_ar_id_o      = axi_id;        //ok                                                                   //初始化信号即可
    //assign axi_ar_user_o    = axi_user;                                                                         //初始化信号即可
    assign axi_ar_len_o     = (is_flash_i & r_state == R_INST_ADDR) | (is_flash_d & r_state == R_DATA_ADDR)
    | (is_uart | is_ps2vga) & !d_req_wen & !i_req_valid ? 0 : axi_rlen;//prob(flash)
    assign axi_ar_size_o    = is_flash_i | is_flash_d ? flash_size :
    is_uart   & !d_req_wen & !i_req_valid ? uart_size :
    is_ps2vga & !d_req_wen & !i_req_valid ? ps2vga_size :
    axi_size;//prob(flash)
    assign axi_ar_burst_o   = `YSYX040127_AXI_BURST_TYPE_INCR;
    //assign axi_ar_lock_o    = 1'b0;                                                                             //初始化信号即可
    //assign axi_ar_cache_o   = `YSYX040127_AXI_ARCACHE_NORMAL_NON_CACHEABLE_NON_BUFFERABLE;                                 //初始化信号即可
    //assign axi_ar_qos_o     = 4'h0;                                                                             //初始化信号即可

    // Read data channel signals
    assign axi_r_ready_o    = r_state_read;

endmodule

//4-way set-associative
module ysyx_040127_dcache(
    input clk,
    input rst,

    //inputs:from cpu to cache
    input [63:0] input_addr,
    input [63:0] input_wdata,
    input        input_memwrite,
    input        input_memread,
    input        input_valid,//ex_to_mem_valid
    input [1:0]  input_size,
    input [7:0]  input_strb,//bitmask
    input        csr_mie,
    input        mstatus,
    output [63:0] output_data,//hazard TBD
    output        cache_pipelinehit,
    //output reg    mmio_reg,//in mem stage(mmio read or write)
    output        timer_int,
    input         fencei,
    input         ex_ecall,
    input         ex_csr_we,
    input         mem_ecall,
    input         mem_csr_we,
    input         wb_ecall,
    input         wb_csr_we,
 

    //sram<->axi
    output reg   [31:0]axi_req_addr,//last 4 digit always is 0
    output reg   [7:0] axi_req_strb,
    output reg   [`YSYX040127_CACHE_DATA_SIZE - 1:0] axi_req_data,
    output reg   axi_req_wen,
    output reg   axi_req_valid,
    input axi_res_valid,
    input [`YSYX040127_CACHE_DATA_SIZE - 1:0] axi_mrdata,

    output[5:0] io_sram_addr,
    output      io_sram_cs,
    output      io_sram_cen_way0,
    output      io_sram_cen_way1,
    output      io_sram_wen_way0,
    output      io_sram_wen_way1,
    output      [`YSYX040127_CACHE_DATA_SIZE - 1:0] cache_strb,
    output      [`YSYX040127_CACHE_DATA_SIZE - 1:0] cache_wdata,
    input [`YSYX040127_CACHE_DATA_SIZE - 1:0] cache_rdata_way0,//cs=0/1
    input [`YSYX040127_CACHE_DATA_SIZE - 1:0] cache_rdata_way1,//cs=0/1
    input       ecallmret_on
);

    wire mmio_mtimecmp;
    wire mmio_mtime;
    wire mmio_write;
    wire mmio_uart;
    wire[63:0]mmio_rdata;
    reg    mmio_reg;
    reg[63:0]mtimecmp;
    reg[63:0]mtime;
    reg[2:0]cache_state;

    reg input_offset_reg_high;
    reg cache_way0hit_reg;


    localparam IDLE = 3'b000, LOOKUP = 3'b001, MISS = 3'b010,
    REFILL = 3'b100, MISS_STALL = 3'b101, REFILL_STALL = 3'b110, FENCEI = 3'b011, FENCEI_STALL = 3'b111;
    localparam SETS = 128;

    reg          cache_way0D[SETS - 1:0];
    reg          cache_way1D[SETS - 1:0];

    reg          cache_way0V[SETS - 1:0];
    reg          cache_way1V[SETS - 1:0];

    reg  [20:0]  cache_way0tags[SETS - 1:0];
    reg  [20:0]  cache_way1tags[SETS - 1:0];

    wire [20:0]  input_tag    = input_addr[31:11]; //high
    wire [6:0]   input_index  = input_addr[10:4];  //mid(8-2=6:[5:0])
    wire input_offset_3 = input_addr[3];   //low

    reg  [6:0]   cache_index_reg;
    reg          cache_offset_reg_3;

    wire          cache_wen_way0;
    wire          cache_wen_way1;
    wire          cache_miss;


    reg          cache_wen_way0_reg;
    reg          cache_wen_way1_reg;
    reg          clk_shadow;
    reg          mmio_uart_ok;
    reg          mmio_uart_mem;
    reg [63:0]   uart_rdata;
    //reg          mmio_vgaps2_ok;
    //reg          mmio_vgaps2_mem;
    //reg [63:0]   vgaps2_rdata;

    wire [63:0]  ex_cache_strb;  //to be initialized,strb for one bank

    //strb
    wire[63:0] ex_cache_wdata;
    wire cache_raw_way0;
    wire cache_raw_way1;
    wire cache_raw;
    //wire mmio_flash;
    reg[6:0]  fencei_cnt;
    reg       fencei_ok;
    wire cache_way0hit;
    wire cache_way1hit;
    wire cache_way0dirty;
    wire cache_way0valid;
    wire cache_way1dirty;
    wire cache_way1valid;

    assign cache_way0hit = ((cache_way0tags[input_index] == input_tag & cache_way0V[input_index])
    && input_valid && !mmio_uart) && !fencei
    || mmio_uart_ok && mmio_uart || fencei_ok && fencei;
    assign cache_way1hit = ((cache_way1tags[input_index] == input_tag & cache_way1V[input_index])
    && input_valid && !mmio_uart) && !fencei
    || mmio_uart_ok && mmio_uart || fencei_ok && fencei;
    assign cache_way0dirty  = cache_way0D[input_index] & input_valid;
    assign cache_way0valid  = cache_way0V[input_index] & input_valid;
    assign cache_way1dirty  = cache_way1D[input_index] & input_valid;
    assign cache_way1valid  = cache_way1V[input_index] & input_valid;
    //*do not accept request if cache is empty!
    //*cache_state == IDLE?

    //choose bank(always follow the sram output)
    wire[63:0] output_data_way0 = input_offset_reg_high ? cache_rdata_way0[127:64] : cache_rdata_way0[63:0];
    wire[63:0] output_data_way1 = input_offset_reg_high ? cache_rdata_way1[127:64] : cache_rdata_way1[63:0];


    always @(posedge clk) begin
        if(rst)begin
            cache_way0hit_reg <= 0;
            input_offset_reg_high  <= 0;
        end else begin
            cache_way0hit_reg <= cache_way0hit;
            input_offset_reg_high  <= input_offset_3;
        end
    end

    assign mmio_mtime = (input_addr == `YSYX040127_CLINT_MTIME);
    assign mmio_mtimecmp = (input_addr == `YSYX040127_CLINT_MTIMECMP);
    assign mmio_uart = ((input_addr[31:28] == 4'h1 && (input_addr[15:12] == 4'h0 || input_addr[15:12] == 4'h1
    || input_addr[15:12] == 4'h2 || input_addr[15:12] == 4'h3 || input_addr[27:24] >= 4'hc))
    || input_addr[31:28] == 4'h2)
    && input_valid;
    //assign mmio_flash = input_addr[31:28] == 4'h3 && input_valid;
    assign mmio_rdata = mmio_reg ? mtime : mtimecmp;
    assign mmio_write = mmio_mtimecmp & input_memwrite;//mtime cannot be written
    assign timer_int = mtime >= mtimecmp & mstatus & csr_mie & !(ex_ecall | mem_ecall | wb_ecall
    | ex_csr_we | mem_csr_we | wb_csr_we | ecallmret_on);
    assign io_sram_addr = fencei & !fencei_ok ? fencei_cnt[5:0] : input_index[5:0];
    assign io_sram_cs   = fencei & !fencei_ok ? fencei_cnt[6] : input_index[6];
    assign io_sram_cen_way0 = (input_memread | cache_miss | cache_wen_way0 | fencei & !fencei_ok);
    assign io_sram_cen_way1 = (input_memread | cache_miss | cache_wen_way1 | fencei & !fencei_ok);
    assign io_sram_wen_way0 = (cache_wen_way0);
    assign io_sram_wen_way1 = (cache_wen_way1);
    
    always @(posedge clk) begin
      if(rst)begin
          mtimecmp <= 0;
      end else if(mmio_write)begin
          mtimecmp <= input_wdata;
      end

      if(rst)begin
          clk_shadow <= 1'b0;
      end else begin
          clk_shadow <= !clk_shadow;
      end

      if(rst)begin
          mtime    <= 64'b0;
      end else if(clk_shadow)begin
          mtime    <= mtime + 1;
      end
    end

    assign cache_wdata[127:64] = ({64{cache_state == IDLE & input_addr[3] == 1'b1
    | cache_state == LOOKUP & input_addr[3] == 1'b1}} & ex_cache_wdata) |
    ({64{cache_state == REFILL & input_memwrite & input_addr[3]}} & ex_cache_wdata) |
    ({64{cache_state == REFILL & input_memwrite & !input_addr[3]}} & axi_mrdata[127:64]) |
    ({64{cache_state == REFILL & !input_memwrite}} & axi_mrdata[127:64]);
    assign cache_wdata[63:0] = ({64{cache_state == IDLE & input_addr[3] == 1'b0
    | cache_state == LOOKUP & input_addr[3] == 1'b0}} & ex_cache_wdata) |
    ({64{cache_state == REFILL & input_memwrite & input_addr[3]}} & axi_mrdata[63:0]) |
    ({64{cache_state == REFILL & input_memwrite & !input_addr[3]}} & ex_cache_wdata) |
    ({64{cache_state == REFILL & !input_memwrite}} & axi_mrdata[63:0]);


    assign cache_wen_way0 = (cache_way0hit & input_memwrite & cache_state == IDLE |
    (!cache_raw_way0 & cache_state == LOOKUP & cache_way0hit & input_memwrite) |
    (axi_res_valid & cache_state == REFILL & !(cache_way0dirty & cache_way0valid))) & !mmio_uart;

    assign cache_wen_way1 = (cache_way1hit & input_memwrite & cache_state == IDLE |
    (!cache_raw_way1 & cache_state == LOOKUP & cache_way1hit & input_memwrite) |
    (axi_res_valid & cache_state == REFILL & !(cache_way1dirty & cache_way1valid) &
                     (cache_way0dirty & cache_way0valid))) & !mmio_uart;//refill:mem->cache
    //hit && memread -> wen = 0


    assign cache_strb[127:64] = ({64{input_addr[3] == 1'b1 & (cache_way0hit | cache_way1hit)
    & (cache_state == IDLE | cache_state == LOOKUP)}} & ex_cache_strb)//&!raw
    | {64{axi_res_valid & cache_state == REFILL}};

    assign cache_strb[63:0] = ({64{input_addr[3] == 1'b0 & (cache_way0hit | cache_way1hit)
    & (cache_state == IDLE | cache_state == LOOKUP)}} & ex_cache_strb)//&!raw
    | {64{axi_res_valid & cache_state == REFILL}};

    assign cache_pipelinehit = (cache_state == IDLE & (fencei_ok | cache_way0hit | cache_way1hit | mmio_mtime | mmio_mtimecmp))
     || (cache_state == LOOKUP & (!cache_raw & (cache_way0hit | cache_way1hit)));
    //supposed to be inputs:

    assign cache_raw_way0 = cache_way0hit & cache_wen_way0_reg
                & input_memread & input_index == cache_index_reg
                & input_addr[3] == cache_offset_reg_3 & (cache_state == LOOKUP);
    assign cache_raw_way1 = cache_way1hit & cache_wen_way1_reg
                & input_memread & input_index == cache_index_reg
                & input_addr[3] == cache_offset_reg_3 & (cache_state == LOOKUP);
    assign cache_raw = cache_raw_way0 | cache_raw_way1;

    assign cache_miss = cache_way1dirty & cache_way0valid & cache_way0dirty & cache_way1valid
    & (cache_state == IDLE   & !(cache_way0hit | cache_way1hit) |
      (cache_state == LOOKUP & (cache_raw & !cache_way0hit
      & !cache_way1hit | !cache_way0hit & !cache_way1hit)) );


    assign output_data = mmio_reg ? mmio_rdata : mmio_uart_mem ? uart_rdata[63:0] :
    cache_way0hit_reg ? output_data_way0: output_data_way1;

    assign ex_cache_strb[63:0] = {{8{input_strb[7]}},{8{input_strb[6]}},
    {8{input_strb[5]}}, {8{input_strb[4]}},{8{input_strb[3]}},
    {8{input_strb[2]}}, {8{input_strb[1]}}, {8{input_strb[0]}}};


    assign ex_cache_wdata = (input_size == 2'b00) ?
    ({64{input_addr[3:0] == 4'b1000}} & {axi_mrdata[63+64:8+64], input_wdata[7:0]} |
    {64{input_addr[3:0] == 4'b1001}} & {axi_mrdata[63+64:16+64], input_wdata[7:0], axi_mrdata[7+64:0+64]} |
    {64{input_addr[3:0] == 4'b1010}} & {axi_mrdata[63+64:24+64], input_wdata[7:0], axi_mrdata[15+64:0+64]} |
    {64{input_addr[3:0] == 4'b1011}} & {axi_mrdata[63+64:32+64], input_wdata[7:0], axi_mrdata[23+64:0+64]} |
    {64{input_addr[3:0] == 4'b1100}} & {axi_mrdata[63+64:40+64], input_wdata[7:0], axi_mrdata[31+64:0+64]} |
    {64{input_addr[3:0] == 4'b1101}} & {axi_mrdata[63+64:48+64], input_wdata[7:0], axi_mrdata[39+64:0+64]} |
    {64{input_addr[3:0] == 4'b1110}} & {axi_mrdata[63+64:56+64], input_wdata[7:0], axi_mrdata[47+64:0+64]} |
    {64{input_addr[3:0] == 4'b1111}} & {input_wdata[7:0], axi_mrdata[55+64:0+64]}) |

    ({64{input_addr[3:0] == 4'b0000}} & {axi_mrdata[63:8], input_wdata[7:0]}  |
    {64{input_addr[3:0] == 4'b0001}} & {axi_mrdata[63:16], input_wdata[7:0], axi_mrdata[7:0]} |
    {64{input_addr[3:0] == 4'b0010}} & {axi_mrdata[63:24], input_wdata[7:0], axi_mrdata[15:0]} |
    {64{input_addr[3:0] == 4'b0011}} & {axi_mrdata[63:32], input_wdata[7:0], axi_mrdata[23:0]} |
    {64{input_addr[3:0] == 4'b0100}} & {axi_mrdata[63:40], input_wdata[7:0], axi_mrdata[31:0]} |
    {64{input_addr[3:0] == 4'b0101}} & {axi_mrdata[63:48], input_wdata[7:0], axi_mrdata[39:0]} |
    {64{input_addr[3:0] == 4'b0110}} & {axi_mrdata[63:56], input_wdata[7:0], axi_mrdata[47:0]} |
    {64{input_addr[3:0] == 4'b0111}} & {input_wdata[7:0], axi_mrdata[55:0]}) :
    (input_size == 2'b01) ?
    ({64{input_addr[3:1] == 3'b100}} & {axi_mrdata[63+64:16+64], input_wdata[15:0]} |
    {64{input_addr[3:1] == 3'b101}} & {axi_mrdata[63+64:32+64], input_wdata[15:0], axi_mrdata[15+64:0+64]} |
    {64{input_addr[3:1] == 3'b110}} & {axi_mrdata[63+64:48+64], input_wdata[15:0], axi_mrdata[31+64:0+64]} |
    {64{input_addr[3:1] == 3'b111}} & {input_wdata[15:0], axi_mrdata[47+64:0+64]})  |

    ({64{input_addr[3:1] == 3'b000}} & {axi_mrdata[63:16], input_wdata[15:0]} |
    {64{input_addr[3:1] == 3'b001}} & {axi_mrdata[63:32], input_wdata[15:0], axi_mrdata[15:0]} |
    {64{input_addr[3:1] == 3'b010}} & {axi_mrdata[63:48], input_wdata[15:0], axi_mrdata[31:0]} |
    {64{input_addr[3:1] == 3'b011}} & {input_wdata[15:0], axi_mrdata[47:0]}) :
    (input_size == 2'b10) ?
    (input_addr[3:2] == 2'b10 ? {axi_mrdata[63+64:32+64], input_wdata[31:0]}
    :input_addr[3:2] == 2'b11 ?{input_wdata[31:0], axi_mrdata[31+64:0+64]}
    :input_addr[3:2] == 2'b00 ? {axi_mrdata[63:32], input_wdata[31:0]}
    :{input_wdata[31:0], axi_mrdata[31:0]})
    : input_wdata;

    wire cache_way0fencev = cache_way0V[fencei_cnt];
    wire cache_way0fenced = cache_way0D[fencei_cnt];
    wire cache_way1fencev = cache_way1V[fencei_cnt];
    wire cache_way1fenced = cache_way1D[fencei_cnt];

    //reg cache_way0hitbuf;
    //reg cache_way1hitbuf;
    reg cnt;
    always @(posedge clk)begin
        if(rst)begin
            mmio_reg      <= 1'b0;
            cache_state   <= IDLE;
            axi_req_addr  <= 0;
            axi_req_strb  <= 0;
            axi_req_data  <= 0;
            axi_req_wen   <= 0;
            axi_req_valid <= 0;
            cnt           <= 0;
            cache_wen_way0_reg <= 0;
            cache_wen_way1_reg <= 0;
            cache_index_reg    <= 0;
            cache_offset_reg_3   <= 0;
            mmio_uart_ok         <= 0;
            mmio_uart_mem        <= 0;
            uart_rdata           <= 0;
            fencei_cnt <= 0;
            //way_cnt    <= 0;

            for(int i = 0; i < SETS/4; i = i + 1)begin
                cache_way0D[i*4] <= 0;
                cache_way0D[i*4+1] <= 0;
                cache_way0D[i*4+2] <= 0;
                cache_way0D[i*4+3] <= 0;

                cache_way0V[i*4] <= 0;
                cache_way0V[i*4+1] <= 0;
                cache_way0V[i*4+2] <= 0;
                cache_way0V[i*4+3] <= 0;
                
                cache_way1D[i*4] <= 0;
                cache_way1V[i*4] <= 0;   
                cache_way0tags[i*4] <= 0;
                cache_way1tags[i*4] <= 0; 

                cache_way1D[i*4+1] <= 0;
                cache_way1V[i*4+1] <= 0;   
                cache_way0tags[i*4+1] <= 0;
                cache_way1tags[i*4+1] <= 0; 

                cache_way1D[i*4+2] <= 0;
                cache_way1V[i*4+2] <= 0;   
                cache_way0tags[i*4+2] <= 0;
                cache_way1tags[i*4+2] <= 0; 

                cache_way1D[i*4+3] <= 0;
                cache_way1V[i*4+3] <= 0;   
                cache_way0tags[i*4+3] <= 0;
                cache_way1tags[i*4+3] <= 0; 
            end
        end else begin
          uart_rdata    <= axi_mrdata[63:0];
          mmio_uart_mem <= mmio_uart_ok & mmio_uart;
          case(cache_state)
              IDLE:
              begin
                  mmio_uart_ok <= 0;
                  if(!fencei)fencei_ok <= 0;
                  if(fencei & !fencei_ok)begin
                      mmio_reg    <= 1'b0;
                      cache_state <= FENCEI;
                  end else if(mmio_mtime || mmio_mtimecmp)begin
                      mmio_reg    <= 1'b1;
                      cache_state <= IDLE;
                  end else if(mmio_uart & mmio_uart_ok)cache_state <= IDLE;
                  else if(cache_way0hit | cache_way1hit)begin
                      mmio_reg    <= 1'b0;

                      cache_offset_reg_3 <= input_offset_3;
                      if(input_memwrite) cache_index_reg <= input_index;

                      if(cache_way0hit)begin
                          cache_wen_way0_reg <= input_memwrite;
                          cache_way0V[input_index] <= 1'b1;
                          if(!cache_way0D[input_index])cache_way0D[input_index] <= input_memwrite;
                      end else begin
                          cache_wen_way1_reg <= input_memwrite;
                          cache_way1V[input_index] <= 1'b1;
                          if(!cache_way1D[input_index])cache_way1D[input_index] <= input_memwrite;
                      end
                      //write op
                      cache_state <= LOOKUP;
                      //both way0 and way1 should be replaced, randomly choose one
                  end else if(mmio_uart & !mmio_uart_ok)begin
                      cache_wen_way0_reg <= 1'b0;
                      cache_wen_way1_reg <= 1'b0;
                      cache_state <= REFILL;
                  end else if(cache_way1dirty & cache_way0valid & cache_way0dirty & cache_way1valid) begin
                      //block2(tillend)(eviction)
                      mmio_reg    <= 1'b0;
                      cache_wen_way0_reg <= 1'b0;
                      cache_wen_way1_reg <= 1'b0;
                      cnt <= cnt + 1;
                      cache_state <= MISS;
                  end else if(!input_valid)begin
                      mmio_reg    <= 1'b0;
                      cache_wen_way0_reg <= 1'b0;
                      cache_wen_way1_reg <= 1'b0;
                      cache_state <= IDLE;
                  end else begin
                      mmio_reg    <= 1'b0;
                      cache_wen_way0_reg <= 1'b0;
                      cache_wen_way1_reg <= 1'b0;
                      cache_state <= REFILL;
                  end
              end
              LOOKUP://answer to previous clock cycle(pipelined)
              begin
                  mmio_uart_ok <= 0;
                  if(!fencei)fencei_ok <= 0;
                  if(fencei & !fencei_ok)begin
                      mmio_reg    <= 1'b0;
                      cache_state <= FENCEI;
                  end else if(mmio_uart & mmio_uart_ok)cache_state <= IDLE;
                  else if(!cache_raw & (cache_way0hit | cache_way1hit))begin//why raw?
                      cache_offset_reg_3 <= input_offset_3;
                      if(input_memwrite) cache_index_reg <= input_index;
                      if(cache_way0hit)begin
                          cache_wen_way0_reg <= input_memwrite;
                          cache_way0V[input_index] <= 1'b1;
                          if(!cache_way0D[input_index])cache_way0D[input_index] <= input_memwrite;
                      end
                      else begin
                          cache_wen_way1_reg <= input_memwrite;
                          cache_way1V[input_index] <= 1'b1;
                          if(!cache_way1D[input_index])cache_way1D[input_index] <= input_memwrite;
                      end
                      cache_state <= LOOKUP;
                  end else if(cache_way0hit | cache_way1hit)begin //raw
                      cache_state    <= IDLE;
                  end else if(mmio_uart & !mmio_uart_ok)begin
                      cache_wen_way0_reg <= 1'b0;
                      cache_wen_way1_reg <= 1'b0;
                      cache_state <= REFILL;
                  end else if(cache_way1dirty & cache_way0valid & cache_way0dirty & cache_way1valid) begin
                      //block2(tillend)(eviction)
                      cache_wen_way0_reg <= 1'b0;
                      cache_wen_way1_reg <= 1'b0;
                      cnt <= cnt + 1;
                      cache_state <= MISS;
                  end else if(!input_valid)begin
                      cache_wen_way0_reg <= 1'b0;
                      cache_wen_way1_reg <= 1'b0;
                      cache_state <= IDLE;
                  end else begin
                      cache_wen_way0_reg <= 1'b0;
                      cache_wen_way1_reg <= 1'b0;
                      cache_state <= REFILL;
                  end

              end
              MISS://010
              begin

                  if(!cnt && !axi_req_valid)begin//write back(random eviction)
                      axi_req_addr  <= {cache_way0tags[input_index], input_index, 4'b0};

                      axi_req_data  <= cache_rdata_way0;
                      axi_req_valid <= 1'b1;
                  end else if(!axi_req_valid) begin
                      axi_req_addr  <= {cache_way1tags[input_index], input_index, 4'b0};
                      axi_req_data  <= cache_rdata_way1;
                      axi_req_valid <= 1'b1;
                  end
                  
                  if(!axi_res_valid)begin
                      axi_req_strb  <= 8'b11111111;
                      axi_req_wen   <= 1'b1;
                      cache_state <= MISS;
                  end else if(axi_res_valid)begin
                      axi_req_valid <= 1'b0;
                      axi_req_wen   <= 1'b0;
                      cache_state <= MISS_STALL;
                  end
              end
              MISS_STALL:
              begin
                  cache_state <= REFILL;
                  if(!cnt)begin//write back(random eviction)
                      cache_way0D[input_index] <= 1'b0;
                      cache_way0V[input_index] <= 1'b0;
                  end else begin
                      cache_way1D[input_index] <= 1'b0;
                      cache_way1V[input_index] <= 1'b0;
                  end
              end
              FENCEI://3'b011
              begin
                  
                  if(!(cache_way0fencev & cache_way0fenced)
                   & !(cache_way1fencev & cache_way1fenced) & !axi_req_valid)begin
                      fencei_cnt <= fencei_cnt + 1;
                      if(fencei_cnt == 7'h7f)begin
                          fencei_ok   <= 1'b1;
                          cache_state <= IDLE;
                      end else cache_state <= FENCEI_STALL;
                  end else if(cache_way0fencev & cache_way0fenced & !axi_req_valid)begin//write back(random eviction)
                      axi_req_addr  <= {cache_way0tags[fencei_cnt], fencei_cnt, 4'b0};
                      axi_req_data  <= cache_rdata_way0;
                      axi_req_valid <= 1'b1;
                  end else if(!axi_req_valid) begin
                      axi_req_addr  <= {cache_way1tags[fencei_cnt], fencei_cnt, 4'b0};
                      axi_req_data  <= cache_rdata_way1;
                      axi_req_valid <= 1'b1;
                  end
                  
                  if(!axi_res_valid)begin
                      axi_req_strb  <= 8'b11111111;
                      axi_req_wen   <= 1'b1;
                  end else if(axi_res_valid)begin
                      axi_req_valid <= 1'b0;
                      axi_req_wen   <= 1'b0;
                      if(cache_way0fencev & cache_way0fenced)begin
                          cache_way0D[fencei_cnt] <= 1'b0;
                          cache_way0V[fencei_cnt] <= 1'b0;
                      end else if(cache_way1fencev & cache_way1fenced) begin
                          cache_way1D[fencei_cnt] <= 1'b0;
                          cache_way1V[fencei_cnt] <= 1'b0;
                      end
                  end

              end
              FENCEI_STALL:begin
                  cache_state <= FENCEI;
              end
              REFILL://3'b100
              begin
                  if(axi_res_valid) begin

                      if(!mmio_uart)begin
                        if(cache_wen_way0)cache_way0tags[input_index] <= input_tag;
                        else if(cache_wen_way1)cache_way1tags[input_index] <= input_tag; //?
                        if(cache_wen_way0)cache_way0D[input_index] <= cache_wen_way0 & input_memwrite;
                        if(cache_wen_way1)cache_way1D[input_index] <= cache_wen_way1 & input_memwrite;
                        cache_way0V[input_index] <= cache_way0V[input_index] | cache_wen_way0;
                        cache_way1V[input_index] <= cache_way1V[input_index] | cache_wen_way1;
                      end else begin
                        mmio_uart_ok <= 1'b1;
                      end
                      axi_req_valid <= 1'b0;
                      //axi_res_valid <= 1'b0;
                      cache_state <= REFILL_STALL;
                  end else begin

                      cache_state <= REFILL;
                      if(!mmio_uart)axi_req_addr  <= input_addr[31:0] & 32'hfffffff0;//&
                      else axi_req_addr <= input_addr[31:0];
                      axi_req_valid <= 1'b1;
                      if(mmio_uart & input_memwrite)begin
                        axi_req_data  <= {64'b0, {8{input_wdata[7:0]}}};
                        axi_req_strb  <= 8'b11111111;
                      end
                      axi_req_wen   <= mmio_uart & input_memwrite;

                  end
              end

              REFILL_STALL://write allocate(read miss)110
              begin
                  cache_wen_way0_reg <= 1'b0;
                  cache_wen_way1_reg <= 1'b0;
                  cache_state <= IDLE;
              end

              default:;
          endcase
        end

    end

endmodule


//4-way set-associative
module ysyx_040127_icache(
    input clk,
    input rst,

    //inputs:from cpu to cache
    input [31:0] input_addr,
    input        input_memread,
    input        input_valid,
    input        load_branch,
    input        id_allowin,
    //input        preif_timer_int,
    output [63:0] output_data,
    output        cache_pipelinehit,

    //sram&axi
    output reg[31:0] axi_req_addr,
    output reg       axi_req_valid,
    input            axi_res_valid,
    input [`YSYX040127_CACHE_DATA_SIZE-1:0] axi_mrdata,

    output[5:0] io_sram_addr,
    output      io_sram_cs,
    output      io_sram_cen_way0,
    output      io_sram_cen_way1,
    output      io_sram_wen_way0,
    output      io_sram_wen_way1,
    output      [`YSYX040127_CACHE_DATA_SIZE - 1:0] cache_strb,
    output      [`YSYX040127_CACHE_DATA_SIZE - 1:0] cache_wdata,
    input [`YSYX040127_CACHE_DATA_SIZE - 1:0] cache_rdata_way0,//cs=0/1
    input [`YSYX040127_CACHE_DATA_SIZE - 1:0] cache_rdata_way1 //cs=0/1
);

    reg      input_offset_reg_high;
    reg[2:0] cache_state;
    reg cache_way0hit_reg;
    wire input_offset_3 = input_addr[3];   //low

    //reg[7:0]   axi_req_strb;
    //reg   [`YSYX040127_CACHE_DATA_SIZE - 1:0] axi_mrdata;

    localparam IDLE = 3'b000,  MISS = 3'b010,
    REFILL = 3'b100, MISS_STALL = 3'b101, REFILL_STALL = 3'b110;
    localparam SETS = 128;

    reg          cache_way0V[SETS - 1:0];
    reg          cache_way1V[SETS - 1:0];

    reg  [20:0]  cache_way0tags[SETS - 1:0];
    reg  [20:0]  cache_way1tags[SETS - 1:0];
    reg  cnt;

    wire [20:0]  input_tag    = input_addr[31:11]; //high
    wire [6:0]   input_index  = input_addr[10:4];  //mid(8-2=6:[5:0])

    //reg          invalidate_write;

    wire          cache_wen_way0;
    wire          cache_wen_way1;


    wire cache_way0hit = (cache_way0tags[input_index] == input_tag & cache_way0V[input_index]) && input_valid;
    wire cache_way1hit = (cache_way1tags[input_index] == input_tag & cache_way1V[input_index]) && input_valid;
    wire cache_way0valid = cache_way0V[input_index] & input_valid;
    wire cache_way1valid = cache_way1V[input_index] & input_valid;
    //*do not accept request if cache is empty!
    //*cache_state == IDLE?

    //choose bank(always follow the sram output)
    wire[63:0] output_data_way0 = input_offset_reg_high ? cache_rdata_way0[127:64] : cache_rdata_way0[63:0];
    wire[63:0] output_data_way1 = input_offset_reg_high ? cache_rdata_way1[127:64] : cache_rdata_way1[63:0];


    always @(posedge clk) begin
        if(rst)begin
            cache_way0hit_reg <= 0;
            input_offset_reg_high  <= 0;
        end else begin
            cache_way0hit_reg <= cache_way0hit;//?
            input_offset_reg_high  <= input_offset_3;
        end
    end
    assign io_sram_addr = input_index[5:0];
    assign io_sram_cs   = input_index[6];
    assign io_sram_cen_way0 = (input_memread | cache_wen_way0);
    assign io_sram_cen_way1 = (input_memread | cache_wen_way1);
    assign io_sram_wen_way0 = (cache_wen_way0);
    assign io_sram_wen_way1 = (cache_wen_way1);

    //strb
    assign cache_wdata[127:64] = ({64{cache_state == REFILL}} & axi_mrdata[127:64]);
    assign cache_wdata[63:0] = ({64{cache_state == REFILL}} & axi_mrdata[63:0]);

    assign cache_wen_way0 = (axi_res_valid & cache_state == REFILL
    & !cache_way0valid);// & !invalidate_write & !preif_timer_int);//(4)
    assign cache_wen_way1 = (axi_res_valid & cache_state == REFILL
    & !cache_way1valid & cache_way0valid);// & !invalidate_write & !preif_timer_int);//(5)
    //refill:mem->cache
    //hit && memread -> wen = 0

    assign cache_strb[127:64] = {64{axi_res_valid & cache_state == REFILL}};//hits are all read hits.
    assign cache_strb[63:0] = {64{axi_res_valid & cache_state == REFILL}};

    assign  cache_pipelinehit = (cache_state == IDLE & (cache_way0hit | cache_way1hit));
    //pre value of diff_output_ready
    //supposed to be inputs:

    assign output_data = cache_way0hit_reg ? output_data_way0: output_data_way1;

    always @(posedge clk)begin
        if(rst)begin//?

            cache_state   <= IDLE;
            axi_req_addr  <= 0;
            axi_req_valid <= 0;
            cnt           <= 0;

            for(int i = 0; i < SETS/4; i = i + 1)begin
                cache_way0tags[i*4] <= 0;
                cache_way1tags[i*4] <= 0;
                cache_way0V[i*4] <= 0;
                cache_way1V[i*4] <= 0;

                cache_way0tags[i*4+1] <= 0;
                cache_way1tags[i*4+1] <= 0;
                cache_way0V[i*4+1] <= 0;
                cache_way1V[i*4+1] <= 0;

                cache_way0tags[i*4+2] <= 0;
                cache_way1tags[i*4+2] <= 0;
                cache_way0V[i*4+2] <= 0;
                cache_way1V[i*4+2] <= 0;

                cache_way0tags[i*4+3] <= 0;
                cache_way1tags[i*4+3] <= 0;
                cache_way0V[i*4+3] <= 0;
                cache_way1V[i*4+3] <= 0;
            end
        end else begin
          case(cache_state)
              IDLE:
              begin
                  if(cache_way0hit | cache_way1hit)begin

                      if(cache_way0hit)begin
                          cache_way0V[input_index] <= 1'b1;
                      end else begin
                          cache_way1V[input_index] <= 1'b1;
                      end
                      cache_state <= IDLE;
                      //both way0 and way1 should be replaced, randomly choose one
                  end else if(cache_way0valid & cache_way1valid) begin
                      //block2(tillend)(eviction)
                      cnt <= cnt + 1;
                      cache_state <= MISS;
                  end else if(!input_valid)begin
                      cache_state <= IDLE;
                  end else begin
                      cache_state <= REFILL;
                  end
              end
              MISS://010
              begin
                  if(!load_branch)begin
                    cache_state <= MISS_STALL;
                  end
              end
              MISS_STALL://101
              begin
                  if(!load_branch)begin
                    cache_state <= REFILL;
                    if(!cnt)begin//write back(random eviction)
                        cache_way0V[input_index] <= 1'b0;
                    end else begin
                        cache_way1V[input_index] <= 1'b0;
                    end
                  end
              end

              REFILL://3'b100
              begin
                  //if(preif_timer_int & axi_req_valid)begin//late
                  //    invalidate_write <= 1'b1;(1)
                  if(axi_res_valid) begin

                      if(cache_wen_way0)cache_way0tags[input_index] <= input_tag;
                      else if(cache_wen_way1)cache_way1tags[input_index] <= input_tag; //?

                      cache_way0V[input_index] <= (cache_way0V[input_index] | cache_wen_way0);// & !invalidate_write;(2)
                      cache_way1V[input_index] <= (cache_way1V[input_index] | cache_wen_way1);// & !invalidate_write;(3)
                      axi_req_valid <= 1'b0;
                      //axi_res_valid <= 1'b0;
                      cache_state <= REFILL_STALL;
                  end else if(!load_branch & id_allowin) begin
                      cache_state <= REFILL;
                      axi_req_addr  <= input_addr[31:0] & 32'hfffffff0;
                      axi_req_valid <= 1'b1;
                  end
              end

              REFILL_STALL://write allocate(read miss)110
              begin
                  cache_state <= IDLE;
              end

              default:;
          endcase
        end

    end

endmodule

module ysyx_040127_decode(
  input        clk,
  input        rst,
  input        if_to_id_valid,//from last stage
  input [`YSYX040127_IF_TO_ID_WIDTH - 1:0]if_to_id_bus,
  input        if_timer_int,
  output       id_allowin,    //for last stage
  output       id_to_ex_valid,//for next stage
  output[`YSYX040127_ID_TO_EX_WIDTH - 1:0]id_to_ex_bus,
  output[4:0]  id_rs1,
  output[4:0]  id_rs2,
  input [63:0] id_regdata1_tmp,//regdata before hazard proceccing
  input [63:0] id_regdata2_tmp,
  input        timer_int,
  output[31:0] id_branch_result,
  output       id_branch_taken,
  output reg   id_flush,
  input        ex_allowin,    //from next stage
  input[4:0]   ex_rd,
  input[63:0]  ex_alu_output,
  input        ex_memread,
  input        ex_reg_wen,
  input        ex_csr_we,
  input[31:0]  ex_pc,
  input        ex_mret,
  input        ex_ecall,
  input[4:0]   mem_rd,
  input[63:0]  mem_alu_output,
  input        mem_memread,
  input        mem_reg_wen,
  input        mem_mret,
  input        mem_ecall,
  input        mem_csr_we,
  input        wb_reg_wen,
  input[4:0]   wb_rd,
  input[63:0]  wb_reg_wdata,
  input        wb_mret,
  input        wb_ecall,
  input        if_flush,
  input[31:0]  if_instruction_reg,
  input  reg   if_instruction_blocked,
  output       load_branch,
  output reg   ecallmret_on,
  input[31:0]  mepc_low
);
  localparam TYPE_I = 3'b000, TYPE_U = 3'b001, TYPE_S = 3'b010,
   TYPE_J = 3'b011, TYPE_R = 3'b100, TYPE_B = 3'b101, TYPE_N = 3'b110;
  wire       beq;
  wire       bne;
  wire       blt;
  wire       bltu;
  wire       bge;
  wire       bgeu;
  wire       btype_taken;
  wire       imm_src1;//whether src1 is imm?
  wire       imm_src2;//whether src2 is imm?

  //outputs
  wire[5:0]id_aluop;
  wire[2:0]id_memop;
  wire[4:0]id_rd;
  wire id_reg_wen;
  wire id_memwrite;
  wire id_memread;
  wire[2:0]   id_inst_type;

  reg[63:0]  id_imm;
  reg        id_timer_int_tmp;
  wire       id_timer_int;
  wire       id_jalr;
  wire[63:0] id_alu_input1;
  wire[63:0] id_alu_input2;
  wire[63:0] id_regdata1_final;
  wire[63:0] id_regdata2_final;
  wire[63:0] id_mem_wdata;

  //hazard
  wire   exid_raw_hazard1;
  wire   exid_raw_hazard2;
  wire   memid_raw_hazard1;
  wire   memid_raw_hazard2;
  wire   wbid_raw_hazard1;
  wire   wbid_raw_hazard2;
  wire   load_use_hazard1;
  wire   load_use_hazard2;

  wire   mem_load_use_hazard1;
  wire   mem_load_use_hazard2;

  wire   wb_load_use_hazard1;
  wire   wb_load_use_hazard2;

  reg    mem_load_use_hazard1_tmp;
  reg    mem_load_use_hazard2_tmp;
  reg    wb_load_use_hazard1_tmp;
  reg    wb_load_use_hazard2_tmp;
  //for pipeline
  wire       id_ready_go;
  reg        id_valid;
  reg[`YSYX040127_IF_TO_ID_WIDTH - 1:0]  if_to_id_bus_reg;

  wire[31:0] id_pc;
  wire[31:0] id_instruction;
  wire[31:0] id_instruction_tmp;

  wire       id_mret;
  wire       id_ecall;
  wire       id_csrrw;
  wire       id_csrrs;
  wire       id_csrrc;
  wire       id_csrrwi;
  wire       id_csrrsi;
  wire       id_csrrci;
  wire       id_fencei;

  assign exid_raw_hazard1 = (|ex_rd) && (ex_rd == id_rs1) && ex_reg_wen;//wb
  assign exid_raw_hazard2 = (|ex_rd) && (ex_rd == id_rs2) && ex_reg_wen;
  assign memid_raw_hazard1 = (|mem_rd) && (mem_rd == id_rs1) && mem_reg_wen;
  assign memid_raw_hazard2 = (|mem_rd) && (mem_rd == id_rs2) && mem_reg_wen;
  assign wbid_raw_hazard1 = (|wb_rd) && (wb_rd == id_rs1) && wb_reg_wen;
  assign wbid_raw_hazard2 = (|wb_rd) && (wb_rd == id_rs2) && wb_reg_wen;
  assign load_use_hazard1 = exid_raw_hazard1 && ex_memread && ex_pc != id_pc;
  assign load_use_hazard2 = exid_raw_hazard2 && ex_memread && ex_pc != id_pc;
  assign mem_load_use_hazard1 =  mem_load_use_hazard1_tmp | (memid_raw_hazard1 && mem_memread);
  assign mem_load_use_hazard2 =  mem_load_use_hazard2_tmp | (memid_raw_hazard2 && mem_memread);
  assign wb_load_use_hazard1 = wb_load_use_hazard1_tmp;
  assign wb_load_use_hazard2 = wb_load_use_hazard2_tmp;
  assign load_branch = (load_use_hazard1 | load_use_hazard2 | mem_load_use_hazard1 | mem_load_use_hazard2)
  & (id_inst_type == TYPE_B || id_jalr || id_inst_type == TYPE_J);


  assign {
  id_instruction_tmp,//[63:32]
  id_pc          //[31:0]
  } = if_to_id_bus_reg;//data from if delayed a cycle
  assign id_instruction = (ex_mret | mem_mret | wb_mret | ex_ecall | mem_ecall | wb_ecall) ? 32'b0 : id_instruction_tmp;

  assign id_mret  = (id_instruction[31:7] == 25'b0011000000100000000000000) && (id_inst_type == TYPE_N);
  assign id_ecall = !(|id_instruction[31:7]) && (id_inst_type == TYPE_N);
  assign id_csrrw = id_instruction[14:12] == 3'b001 && (id_inst_type == TYPE_N);
  assign id_csrrs = id_instruction[14:12] == 3'b010 && (id_inst_type == TYPE_N);
  assign id_csrrc = id_instruction[14:12] == 3'b011 && (id_inst_type == TYPE_N);
  assign id_csrrwi = id_instruction[14:12] == 3'b101 && (id_inst_type == TYPE_N);
  assign id_csrrsi = id_instruction[14:12] == 3'b110 && (id_inst_type == TYPE_N);
  assign id_csrrci = id_instruction[14:12] == 3'b111 && (id_inst_type == TYPE_N);
  assign id_timer_int = id_timer_int_tmp | timer_int;
  assign id_fencei = !(|id_instruction[31:15]) && id_instruction[14:7] == 8'b00100000 && (id_inst_type == TYPE_I);
  assign id_to_ex_bus
  = {id_fencei,      //271:271
     id_timer_int,   //270:270
     //id_instruction, 
     id_imm[11:0],   //269:258
     id_mret,        //257:257
     id_ecall,       //256:256
     id_csrrw,       //255:255
     id_csrrs,       //254:254
     id_csrrc,       //253:253
     id_csrrwi,      //252:252
     id_csrrsi,      //251:251
     id_csrrci,      //250:250
     id_pc,          //249:218
     id_aluop,       //217:212
     id_memop,       //211:209
     id_reg_wen,     //208:208
     id_memwrite,    //207:207
     id_memread,     //206:206
     id_rd,          //205:201
     id_rs1,         //200:196
     //id_rs2,       //200:196
     id_inst_type,   //195:193
     id_jalr,        //192:192
     id_alu_input1,  //191:128
     id_alu_input2,  //127:64
     id_mem_wdata    //63:0
    };

  assign id_memop = id_instruction[14:12];
  assign id_aluop = {id_instruction[30], id_instruction[25], id_instruction[6:5], id_instruction[4:3]};
  assign id_memwrite = (id_inst_type == TYPE_S);//for mem

  assign beq  = !(|id_instruction[14:12]);//in id only
  assign bne  = !(|id_instruction[14:13]) & id_instruction[12];
  assign blt  = id_instruction[14:12] == 3'b100;
  assign bltu = id_instruction[14:12] == 3'b110;
  assign bge  = id_instruction[14:12] == 3'b101;
  assign bgeu = id_instruction[14:12] == 3'b111;

  assign id_rd  = id_instruction[11:7];
  assign id_rs1 = id_instruction[19:15];
  assign id_rs2 = id_instruction[24:20];

  assign imm_src1 = (id_inst_type == TYPE_U || id_inst_type == TYPE_J);//type_u,type_j
  assign imm_src2 = (id_inst_type == TYPE_I || id_inst_type == TYPE_S);//type_i
  assign id_alu_input1 = imm_src1 ? id_imm : id_regdata1_final;
  assign id_alu_input2 = imm_src2 ? id_imm : id_regdata2_final;

  assign id_regdata1_final = exid_raw_hazard1 ? ex_alu_output :
  wb_load_use_hazard1 ? wb_reg_wdata :
  memid_raw_hazard1 ? mem_alu_output :
  wbid_raw_hazard1 ? wb_reg_wdata : id_regdata1_tmp;
  assign id_regdata2_final = exid_raw_hazard2 ? ex_alu_output :
  wb_load_use_hazard2 ? wb_reg_wdata :
  memid_raw_hazard2 ? mem_alu_output :
  wbid_raw_hazard2 ? wb_reg_wdata : id_regdata2_tmp;
  assign id_mem_wdata = id_regdata2_final;
  assign id_jalr = id_inst_type == 3'b000 && id_instruction[6:0] == 7'b1100111 && id_instruction[14:12] == 3'b000;
  assign id_branch_result = {32{btype_taken}} & (id_pc + id_imm[31:0]) |
  {32{id_jalr}} & ((id_regdata1_final[31:0] + {{20{id_instruction[31]}}, id_instruction[31:20]}) & (~1))|
  {32{id_inst_type == TYPE_J}} & (id_pc + id_alu_input1[31:0]);//jal
  assign id_branch_taken = (btype_taken || id_jalr || (id_inst_type == TYPE_J));//Btaken, jal, jalr
  assign btype_taken  = id_inst_type == TYPE_B && (beq && id_regdata1_final == id_regdata2_final//101
  || bne  && (id_regdata1_final != id_regdata2_final)//for B_TYPE only
  || blt  && ($signed(id_regdata1_final) <  $signed(id_regdata2_final))
  || bltu && id_regdata1_final < id_regdata2_final
  || bge  && ($signed(id_regdata1_final) >= $signed(id_regdata2_final))
  || bgeu && id_regdata1_final >= id_regdata2_final);

  assign id_reg_wen = !(|id_inst_type) || id_inst_type == TYPE_U || id_inst_type == TYPE_J
  || id_inst_type == TYPE_R || id_inst_type == TYPE_N;
  assign id_memread = id_instruction[0] & id_instruction[1] & !id_instruction[2]
  & !id_instruction[3] & !id_instruction[4] & !id_instruction[5] & !id_instruction[6];

  //pipeline
  assign id_ready_go = !(load_use_hazard1 || load_use_hazard2
  || mem_load_use_hazard1 || mem_load_use_hazard2 || ex_csr_we
  && (|ex_rd)  && (ex_rd == id_rs1  || ex_rd == id_rs2)
  || mem_csr_we && (|mem_rd) && (mem_rd == id_rs1 || mem_rd == id_rs2));//right?
  assign id_allowin  = !id_valid || id_ready_go && ex_allowin;//!id_valid is for the begining
  assign id_to_ex_valid = id_ready_go && id_valid;//all about id. Has nothing to do with ex


  always @(posedge clk) begin
    if(rst) begin
      id_valid <= 1'b0;
    end else if(id_allowin)begin//the valid from last stage
      id_valid <= if_to_id_valid & (!id_branch_taken);
    end

    if(rst) begin
      mem_load_use_hazard1_tmp <= 0;
      mem_load_use_hazard2_tmp <= 0;
      wb_load_use_hazard1_tmp <= 0;
      wb_load_use_hazard2_tmp <= 0;
    end else begin
      mem_load_use_hazard1_tmp <= load_use_hazard1;
      mem_load_use_hazard2_tmp <= load_use_hazard2;
      wb_load_use_hazard1_tmp <= mem_load_use_hazard1;
      wb_load_use_hazard2_tmp <= mem_load_use_hazard2;
    end

    if(rst)begin
      ecallmret_on <= 0;
    end else if(wb_mret)begin
      ecallmret_on <= 1;
    end else if(id_pc[31:0] == mepc_low)begin
      ecallmret_on <= 0;
    end

    if(rst)begin
      if_to_id_bus_reg <= 0;
      id_flush <= 0;//otherwise stall
      id_timer_int_tmp <= 0;
    end else if(if_to_id_valid && id_allowin) begin
      if(!if_instruction_blocked)
        if_to_id_bus_reg <= if_to_id_bus;
      else begin
        if_to_id_bus_reg[31:0]  <= if_to_id_bus[31:0];
        if_to_id_bus_reg[63:32] <= id_branch_taken ? 32'b0 : if_instruction_reg;
        //if_to_id_bus_reg[64]    <= if_to_id_bus[64];

      end
      id_flush <= mem_ecall | mem_mret | if_flush;//otherwise stall
      id_timer_int_tmp <= if_timer_int;
    end
  end

  //typei,typeu writes register
  always @(*)begin
    case(id_inst_type)
      3'b001:id_imm = {{32{id_instruction[31]}}, id_instruction[31:12], 12'b0};
      3'b000:id_imm = {{52{id_instruction[31]}}, id_instruction[31:20]};
      3'b011:id_imm = {{43{id_instruction[31]}}, id_instruction[31],
      id_instruction[19:12], id_instruction[20], id_instruction[30:21], 1'b0};
      3'b110:id_imm = {{52{id_instruction[31]}}, id_instruction[31:20]};
      3'b010:id_imm = {{52{id_instruction[31]}}, id_instruction[31:25],
      id_instruction[11:7]};//might be wrong
      3'b101:id_imm = {{51{id_instruction[31]}}, id_instruction[31], id_instruction[7], id_instruction[30:25], id_instruction[11:8], 1'b0};
      default:id_imm = 64'b0;
    endcase
  end
  //number of keys,width of key/data (output input

  ysyx_040127_MuxKeyWithDefault #(13, 7, 3) inst_mux (id_inst_type, id_instruction[6:0], TYPE_I,{
    7'b0010111,TYPE_U,//auipc
    7'b0110111,TYPE_U,//lui

    7'b0011011,TYPE_I,//addiw,sraiw,srliw,slliw
    7'b0010011,TYPE_I,//addi,andi,ori,xori,sltiu,srai,srli,slli(new)
    7'b0000011,TYPE_I,//lb,lh,lw,ld,lbu,lhu,lwu(src1+src2)
    7'b1100111,TYPE_I,//jalr
    7'b0001111,TYPE_I,//fencei

    7'b1101111,TYPE_J,//jal
    7'b0111011,TYPE_R,//addw subw mulw sllw srlw sraw divw divuw remw remuw
    7'b0110011,TYPE_R,//add mul mulh mulhu mulhsu sub sll slt sltu xor or and div divu rem remu
    7'b1110011,TYPE_N,//ebreak
    7'b0100011,TYPE_S,//sb sh sw sd
    7'b1100011,TYPE_B //beq bne
    //49
  });

endmodule

module ysyx_040127_div (
  input clk,
  input rst,
  input [63:0] x,
  input [63:0] y,
  input s,//w or y is signed
  input is_div,
  input div_stuck,
  output reg ready,
  output reg[1:0] state,
  output [63:0] quo,
  output [63:0] rem
);
  localparam IDLE = 2'b00, DIV_ON = 2'b01, DIV_END = 2'b10;

  reg[6:0]  cnt;
  reg[128:0]dividend; //cdividend
  reg[63:0] divisor;//c

  wire[64:0]subres;
  assign subres = {dividend[128:64]} - {1'b0, divisor};//unsigned substract
  assign rem = dividend[128:65];
  assign quo = dividend[63:0];
  always @(posedge clk) begin
    if(rst)begin
      ready  <= 0;
      cnt    <= 7'b0;
      state  <= IDLE;
      dividend <= 0;
      divisor  <= 0;
    end else begin 
      case(state)
        IDLE:begin
          if(is_div & !div_stuck)begin
            state  <= DIV_ON;
            cnt    <= 7'b0;
            ready  <= 0;
            if(x[63] & s)dividend <= {64'b0, ~x + 1, 1'b0};//(1)
            else dividend <= {64'b0, x, 1'b0};//(1)
            if(y[63] & s)divisor <= ~y + 1;
            else divisor <= y;
          end else if(!div_stuck)begin
            ready <= 0;
          end
        end
        DIV_ON:begin
          if(cnt != 7'b1000000)begin
            if(subres[64] == 1'b1)begin
              dividend <= {dividend[127:0], 1'b0};//shift left(2)
            end else begin
              dividend <= {subres[63:0], dividend[63:0], 1'b1};//zhe ge qiao miao(3)
            end
            cnt <= cnt + 1;
          end else begin
            if(s & (x[63] ^ y[63]))begin
              dividend[63:0] <= ~dividend[63:0] + 1;
            end
            if(s & x[63])begin
              dividend[128:65] <= ~dividend[128:65] + 1;
            end

            state <= DIV_END;
            cnt   <= 7'b0;
          end
        end
        DIV_END:begin

          ready <= 1'b1;
          state <= IDLE;
        end
        default:state <= IDLE;
      endcase
    end
  end

endmodule

module ysyx_040127_execute(
  input  clk,
  input  rst,
  output ex_allowin,     //for last stage
  input  mem_allowin,    //from next stage
  input  id_to_ex_valid, //from last stage
  output ex_to_mem_valid,//for next stage
  input [`YSYX040127_ID_TO_EX_WIDTH  - 1:0]id_to_ex_bus,
  output[`YSYX040127_EX_TO_MEM_WIDTH - 1:0]ex_to_mem_bus,
  input  mem_mret,
  input  mem_ecall,
  input  id_flush,
  input  cache_pipelinehit,// cache_state == IDLE & (cache_way0hit | cache_way1hit)
  //input[2:0]  cache_state,
  output      ex_excptions,
  output reg  ex_flush,
  output[31:0]ex_pc,
  output      ex_ready_go,
  output      ex_fencei,
  output      ex_mret,
  output      ex_ecall,
  output[63:0]ex_mem_wdata,
  output      ex_memwrite,
  output[2:0] ex_memop
);

  wire[63:0]rtype_calc_result;
  wire[63:0]itype_calc_result;
  wire[63:0]rtype_alu_op;
  wire[31:0]itype_alu_op;
  //wire[63:0]sub;

  wire[31:0]addw_result;
  wire[31:0]subw_result;
  wire[31:0]mulw_result;
  wire[31:0]divw_result;
  wire[31:0]divuw_result;
  wire[31:0]remw_result;
  wire[31:0]remuw_result;

  wire[63:0]sext_addw_result;
  wire[63:0]sext_subw_result;
  wire[63:0]sext_mulw_result;
  wire[63:0]sext_divw_result;
  wire[63:0]sext_divuw_result;
  wire[63:0]sext_remw_result;
  wire[63:0]sext_remuw_result;

  wire[31:0]src1_sllw;
  wire[31:0]src1_srlw;
  wire[5:0] sft_input2;
  wire[63:0]sra_mask_64;
  wire[63:0]sraw_mask_32;
  wire[63:0]sext_src1_sraw;
  wire[63:0]sext_src1_sllw;
  wire[63:0]sext_src1_srlw;


  //for pipeline
  wire[5:0]  ex_aluop;
  wire       ex_memread;
  wire[4:0]  ex_rd;
  wire[2:0]  ex_inst_type;
  wire       ex_jalr;
  wire[63:0] ex_alu_input1;
  wire[63:0] ex_alu_input2;
  wire[4:0]  ex_rs1;
  wire       ex_reg_wen;
  wire       ex_timer_int;

  wire mul_type;//ex1
  wire div_type;
  wire div_sign;
  wire mul_ok;  //ex3
  wire sign1;
  wire sign2;
  wire[63:0]mul_res_high;
  wire[63:0]mul_res_low;

  reg        ex_valid;
  reg[`YSYX040127_ID_TO_EX_WIDTH - 1:0]  id_to_ex_bus_reg;


  //outputs
  reg [63:0]  ex_alu_output;
  //wire[63:0]  ex_mem_waddr;
  //wire[63:0]  ex_mem_raddr;
  wire       div_ready;
  wire[1:0]  div_state;
  wire[63:0] quo;
  wire[63:0] rem;

  wire       ex_csrrw;
  wire       ex_csrrs;
  wire       ex_csrrc;
  wire       ex_csrrwi;
  wire       ex_csrrsi;
  wire       ex_csrrci;
  wire       ex_csr_we;
  wire[11:0] ex_des_csr;
  //wire[31:0] ex_instruction;

  assign ex_csr_we = (ex_csrrs | ex_csrrw | ex_csrrc | ex_csrrwi | ex_csrrsi | ex_csrrci);
  assign ex_excptions = ex_ecall | ex_mret | ex_timer_int;
  // | ex_mret | ex_ecall);//id_to_ex_valid_reg

  wire cache_readygo = (!ex_memwrite & !ex_memread & !ex_fencei) | cache_pipelinehit | ex_excptions;// | ex_flush

  wire mul_stuck = mul_ok & !id_to_ex_valid;
  wire div_stuck = div_ready & !id_to_ex_valid;

  assign ex_ready_go = ((!mul_type && !(div_type || (div_state[0] ^ div_state[1])))
  || mul_ok || div_ready) && cache_readygo;
  assign ex_allowin  = !ex_valid || ex_ready_go && mem_allowin;
  assign ex_to_mem_valid = ex_ready_go && ex_valid;
  assign
  { ex_fencei,
    ex_timer_int,
    ex_des_csr,
    ex_mret,
    ex_ecall,
    ex_csrrw,
    ex_csrrs,
    ex_csrrc,
    ex_csrrwi,
    ex_csrrsi,
    ex_csrrci,
    ex_pc,
    ex_aluop,
    ex_memop,
    ex_reg_wen,
    ex_memwrite,
    ex_memread,
    ex_rd,
    ex_rs1,
    ex_inst_type,
    ex_jalr,
    ex_alu_input1,
    ex_alu_input2,
    ex_mem_wdata
  } = id_to_ex_bus_reg;

  assign ex_to_mem_bus =
  { ex_timer_int, //262:262 ->193:193
    ex_des_csr,   //261:250 ->192:181
    ex_alu_input1,//249:186 ->180:117
    ex_rs1,       //185:181 ->116:112
    ex_csr_we,    //180:180 ->111:111
    ex_mret,      //179:179 ->110:110
    ex_ecall,     //178:178 ->109:109
    ex_csrrw,     //177:177 ->108:108
    ex_csrrs,     //176:176 ->107:107
    ex_csrrc,     //175:175 ->106:106
    ex_csrrwi,    //174:174 ->105:105
    ex_csrrsi,    //173:173 ->104:104
    ex_csrrci,    //172:172 ->103:103
    //ex_jalr,    //171:171 
    ex_pc,        //170:139 ->102:71
    //ex_memop,   //138:136
    ex_reg_wen,   //135:135 ->70:70
    //ex_memwrite,//134:134
    ex_memread,   //133:133 ->69:69
    ex_rd,        //132:128 ->68:64
    ex_alu_output //127:64  ->63:0
    //ex_mem_wdata  //63:0
  };
  always @(posedge clk) begin

    if(rst) begin
      ex_valid <= 1'b0;
    end else if(ex_allowin)begin
      ex_valid <= id_to_ex_valid;
    end
    if(rst)begin
      id_to_ex_bus_reg <= `YSYX040127_ID_TO_EX_WIDTH'b0;
      ex_flush <= 0;
    end else if(id_to_ex_valid && ex_allowin) begin
      id_to_ex_bus_reg <= id_to_ex_bus;
      ex_flush <= id_flush | mem_mret | mem_ecall;
    end else if(!mul_type & !div_type
    & cache_readygo)begin
      //critical: we need not flush the ex stage write signals when stalled by muls and cache
      id_to_ex_bus_reg[205:201] <= 5'b0;//ex_rd
      id_to_ex_bus_reg[206:206] <= 1'b0;//ex_memread
      id_to_ex_bus_reg[207:207] <= 1'b0;//ex_memwrite
      id_to_ex_bus_reg[208:208] <= 1'b0;//ex_reg_wen
    end

  end

  //assign ex_mem_waddr = ex_alu_output;
  //assign ex_mem_raddr = ex_alu_output;
  //30(aluop[5]), 25(aluop[4]), 14:12(ex_memop), 6:5(aluop[3:2]), 4:3(aluop[1:0])
  //138000ef ->010001
  ysyx_040127_decoder_6_64 dec_rtype(.in({ex_aluop[5], ex_aluop[4], ex_memop,
  ex_aluop[0]}),.out(rtype_alu_op));
  ysyx_040127_decoder_5_32 dec_itype(.in({ex_aluop[1:0], ex_memop}),.out(itype_alu_op));

  localparam
  op_add    = 6'b000000, op_mul   = 6'b010000, op_sub  = 6'b100000,
  op_addw   = 6'b000001, op_or    = 6'b001100, op_xor  = 6'b001000,
  op_sll    = 6'b000010, op_slt   = 6'b000100, op_sltu = 6'b000110,
  op_and    = 6'b001110, op_div   = 6'b011000, op_divu = 6'b011010,
  op_remu   = 6'b011110, op_rem   = 6'b011100, op_subw = 6'b100001,
  op_mulw   = 6'b010001, op_sllw  = 6'b000011, op_srl  = 6'b001010,
  op_sra    = 6'b101010, op_divw  = 6'b011001, op_srlw = 6'b001011,
  op_sraw   = 6'b101011, op_divuw = 6'b011011, op_remw = 6'b011101,
  op_remuw  = 6'b011111, op_mulhu = 6'b010110, op_mulh = 6'b010010,
  op_mulhsu = 6'b010100;
  localparam
  op_addi  = 5'b10000,op_andi  = 5'b10111,op_ori  = 5'b10110,
  op_xori  = 5'b10100,op_sltiu = 5'b10011,op_sri  = 5'b10101,
  op_slli = 5'b10001, op_addiw = 5'b11000,op_slliw= 5'b11001,
  op_sriw = 5'b11101, op_slti  = 5'b10010;

  assign addw_result = ex_alu_input1[31:0] + ex_alu_input2[31:0];
  assign subw_result = ex_alu_input1[31:0] - ex_alu_input2[31:0];
  assign mulw_result = mul_res_low[31:0];

  assign divw_result  = quo[31:0];//$signed(ex_alu_input1[31:0]) / $signed(ex_alu_input2[31:0]);//to be deleted
  assign divuw_result = quo[31:0];//ex_alu_input1[31:0] / ex_alu_input2[31:0];//to be deleted
  assign remw_result  = rem[31:0];//$signed(ex_alu_input1[31:0]) % $signed(ex_alu_input2[31:0]);//to be deleted
  assign remuw_result = rem[31:0];//ex_alu_input1[31:0] % ex_alu_input2[31:0];//to be deleted

  assign sra_mask_64    = {~(64'hffffffffffffffff >> sft_input2)};
  assign sraw_mask_32   = {32'hffffffff, ~(32'hffffffff >> sft_input2[4:0])};
  assign sft_input2  = ex_alu_input2[5:0];
  assign src1_srlw   = ex_alu_input1[31:0] >> sft_input2[4:0];
  assign src1_sllw   = ex_alu_input1[31:0] << sft_input2[4:0];

  assign sext_src1_sraw    = ({64{ex_alu_input1[31]}} & sraw_mask_32) | {32'h0, src1_srlw};//{{32{src1_sraw[31]}}, src1_sraw[31:0]};
  assign sext_src1_sllw    = {{32{src1_sllw[31]}}, src1_sllw[31:0]};
  assign sext_src1_srlw    = {{32{src1_srlw[31]}}, src1_srlw[31:0]};

  wire[63:0]res_sra,res_srl,res_sll;
  assign res_sra = ({64{ex_alu_input1[63]}} & sra_mask_64) | res_srl;//to be tested
  assign res_srl = ex_alu_input1 >> sft_input2;
  assign res_sll = ex_alu_input1 << sft_input2;

  assign sext_addw_result  = {{32{addw_result[31]}}, addw_result};
  assign sext_subw_result  = {{32{subw_result[31]}}, subw_result};
  assign sext_mulw_result  = {{32{mulw_result[31]}}, mulw_result};

  assign sext_divw_result  = {{32{divw_result[31]}}, divw_result};
  assign sext_divuw_result = {{32{divuw_result[31]}}, divuw_result};
  assign sext_remw_result  = {{32{remw_result[31]}} , remw_result};
  assign sext_remuw_result = {{32{remuw_result[31]}}, remuw_result};

  /*
  wire[127:0]ans;
  wire[63:0]ans_high;
  wire[63:0]ans_low;
  //wire[63:0]ans_low2;
  assign ans = {{64{ex_alu_input1[63]}}, ex_alu_input1} * {{64{ex_alu_input2[63]}}, ex_alu_input2};
  assign ans_high = ans[127:64];
  assign ans_low  = ans[63:0];
  */
  assign sign1    = !(ex_memop[0] & ex_memop[1]);
  assign sign2    = !ex_memop[1];
  assign mul_type = !(mul_ok) & (ex_inst_type == 3'b100)
   & (rtype_alu_op[op_mul] | rtype_alu_op[op_mulw]
   | rtype_alu_op[op_mulh] | rtype_alu_op[op_mulhsu] | rtype_alu_op[op_mulhu]);//to be added(2/5)
  assign div_type = !(div_ready) & (ex_inst_type == 3'b100) & (rtype_alu_op[op_rem] | rtype_alu_op[op_remu] |
  rtype_alu_op[op_div]  | rtype_alu_op[op_remw]  | rtype_alu_op[op_remuw] |
  rtype_alu_op[op_divu] | rtype_alu_op[op_divuw] | rtype_alu_op[op_divw]);
  assign div_sign = rtype_alu_op[op_div] | rtype_alu_op[op_divw] |
  rtype_alu_op[op_rem] | rtype_alu_op[op_remw];

  ysyx_040127_mul mul(
    clk,
    rst,
    ex_alu_input1,
    ex_alu_input2,
    sign1,
    sign2,
    mul_res_high,
    mul_res_low,
    mul_type,
    mul_stuck,
    mul_ok
  );
  ysyx_040127_div div(
    clk,
    rst,
    (rtype_alu_op[op_divw] | rtype_alu_op[op_divuw] | rtype_alu_op[op_remw] | rtype_alu_op[op_remuw])
     ? {{32{ex_alu_input1[31] & (rtype_alu_op[op_divw] | rtype_alu_op[op_remw])}}, ex_alu_input1[31:0]}
     : ex_alu_input1,
    (rtype_alu_op[op_divw] | rtype_alu_op[op_divuw] | rtype_alu_op[op_remw] | rtype_alu_op[op_remuw])
     ? {{32{ex_alu_input2[31] & (rtype_alu_op[op_divw] | rtype_alu_op[op_remw])}}, ex_alu_input2[31:0]}
     : ex_alu_input2,
    div_sign,//input s,//w or y is signed
    div_type,//input is_div,
    div_stuck,
    div_ready,
    div_state,
    quo,
    rem
  );
  assign rtype_calc_result =
  {64{rtype_alu_op[op_add]}}  & (ex_alu_input1 + ex_alu_input2) |
  {64{rtype_alu_op[op_mul]}}  & (mul_res_low) | //(ex_alu_input1 * ex_alu_input2) |
  {64{rtype_alu_op[op_mulh]}}   & (mul_res_high) |
  {64{rtype_alu_op[op_mulhu]}}  & (mul_res_high) |
  {64{rtype_alu_op[op_mulhsu]}} & (mul_res_high) |
  {64{rtype_alu_op[op_sub]}}  & (ex_alu_input1 - ex_alu_input2) |
  {64{rtype_alu_op[op_sll]}}  & (res_sll) |        //to be tested
  {64{rtype_alu_op[op_slt]}}  & ($signed(ex_alu_input1) < $signed(ex_alu_input2) ? 1 : 0) |
  {64{rtype_alu_op[op_sltu]}} & (ex_alu_input1 < ex_alu_input2 ? 1 : 0) |
  {64{rtype_alu_op[op_and]}}  & (ex_alu_input1 & ex_alu_input2) |
  {64{rtype_alu_op[op_xor]}}  & (ex_alu_input1 ^ ex_alu_input2) |
  {64{rtype_alu_op[op_or]}}   & (ex_alu_input1 | ex_alu_input2) |
  {64{rtype_alu_op[op_div]}}  & quo  |
  {64{rtype_alu_op[op_divu]}} & quo  |
  {64{rtype_alu_op[op_remu]}} & rem  |
  {64{rtype_alu_op[op_rem]}}  & rem  |
  {64{rtype_alu_op[op_addw]}} & sext_addw_result |
  {64{rtype_alu_op[op_subw]}} & sext_subw_result |
  {64{rtype_alu_op[op_mulw]}} & sext_mulw_result |
  {64{rtype_alu_op[op_srl]}}  & res_srl          | //to be tested
  {64{rtype_alu_op[op_sllw]}} & sext_src1_sllw   |
  {64{rtype_alu_op[op_srlw]}} & sext_src1_srlw   |
  {64{rtype_alu_op[op_sra]}}  & res_sra          | //to be tested
  {64{rtype_alu_op[op_sraw]}} & sext_src1_sraw   |

  {64{rtype_alu_op[op_divw]}}  & sext_divw_result   |
  {64{rtype_alu_op[op_divuw]}} & sext_divuw_result  |
  {64{rtype_alu_op[op_remw]}}  & sext_remw_result   |
  {64{rtype_alu_op[op_remuw]}} & sext_remuw_result;


  assign itype_calc_result = {64{ex_memread | (&ex_aluop[3:2])}} & (ex_alu_input1 + ex_alu_input2) |//loads, jalr
  {64{itype_alu_op[op_addi]}} & (ex_alu_input1 + ex_alu_input2)  | //addi
  {64{itype_alu_op[op_andi]}} & (ex_alu_input1 & ex_alu_input2 ) | //andi
  {64{itype_alu_op[op_ori]}}  & (ex_alu_input1 | ex_alu_input2 ) | //ori
  {64{itype_alu_op[op_xori]}} & (ex_alu_input1 ^ ex_alu_input2 ) | //xori
  {64{itype_alu_op[op_slti]}} & ($signed(ex_alu_input1) < $signed(ex_alu_input2) ? 64'b1 : 64'b0)|//sltiu
  {64{itype_alu_op[op_sltiu]}}& (ex_alu_input1 < ex_alu_input2 ? 64'b1 : 64'b0)|//sltiu
  {64{itype_alu_op[op_sri] & ex_aluop[5] }} & (res_sra) |//srai
  {64{itype_alu_op[op_sri] & !ex_aluop[5]}} & (res_srl) |//srli
  {64{itype_alu_op[op_slli]}} & (res_sll) | //slli

  {64{itype_alu_op[op_addiw]}}  & sext_addw_result  | //addiw
  {64{itype_alu_op[op_slliw]}}  & sext_src1_sllw    | //slliw
  {64{itype_alu_op[op_sriw] & ex_aluop[5]  }} & sext_src1_sraw | //sraiw
  {64{itype_alu_op[op_sriw] & !ex_aluop[5] }} & sext_src1_srlw;  //srliw

  localparam TYPE_I = 3'b000, TYPE_U = 3'b001, TYPE_S = 3'b010,
  TYPE_J = 3'b011, TYPE_R = 3'b100;
  //assign sub = ex_alu_input1 - ex_alu_input2;
  //num,out,in
  always @(*) begin
    case(ex_inst_type)
      TYPE_I : ex_alu_output = ex_jalr ? ({32'b0, ex_pc + 4}) : itype_calc_result;//I_type
      TYPE_S : ex_alu_output = ex_alu_input1 + ex_alu_input2;
      TYPE_U : ex_alu_output = ex_aluop[2] ? ex_alu_input1 : ex_alu_input1 + {32'b0,ex_pc}; //auipc:lui
      TYPE_R : ex_alu_output = rtype_calc_result;
      TYPE_J : ex_alu_output = {32'b0, ex_pc + 4};

      default: ex_alu_output = 0;
    endcase
  end
endmodule




module ysyx_040127_memory(
  input      clk,
  input      rst,
  output     mem_allowin,     //for last stage
  input      wb_allowin,      //from next stage
  input      ex_to_mem_valid, //from last stage
  output     mem_to_wb_valid, //for next stage
  input [`YSYX040127_EX_TO_MEM_WIDTH - 1:0] ex_to_mem_bus,
  output[`YSYX040127_MEM_TO_WB_WIDTH - 1:0] mem_to_wb_bus,
  output[63:0] mem_alu_output,
  output       mem_memread,
  input        ex_flush,
  input        ex_ready_go,
  input [2:0]  ex_memop,
  output [1:0] ex_memop_low,//input from id
  output [7:0] ex_wmask,
  output reg   mem_flush,
  input [63:0] mem_doubly_aligned_data_tmp
);
  wire[63:0]mem_doubly_aligned_data_final;
  //wire       mem_memwrite;
  //wire[2:0]  mem_memop;   //input from id
  //wire       mem_jalr;
  //wire[63:0] mem_wdata_tmp;
  reg[63:0]mem_reg_wdata;
  reg      lb;
  reg      lh;
  reg      lw;
  reg      ld;
  reg      lbu;
  reg      lhu;
  reg      lwu;
  //for pipeline

  wire       mem_ready_go;//self_willing
  wire       mem_reg_wen;
  wire[4:0]  mem_rs1;
  wire[63:0] mem_alu_input1;
  wire[11:0] mem_des_csr;
  wire[4:0]  mem_rd;
  wire[31:0] mem_pc;
  wire[63:0] mem_final_rdata;
  reg        mem_valid;
  


  wire       mem_mret;
  wire       mem_ecall;
  wire       mem_csrrw;
  wire       mem_csrrs;
  wire       mem_csrrc;
  wire       mem_csrrwi;
  wire       mem_csrrsi;
  wire       mem_csrrci;
  wire       mem_csr_we;

  wire ex_lb  = (ex_memop == 3'b000);
  wire ex_lh  = (ex_memop == 3'b001);
  wire ex_lw  = (ex_memop == 3'b010);
  wire ex_ld  = (ex_memop == 3'b011);
  wire ex_lbu = (ex_memop == 3'b100);
  wire ex_lhu = (ex_memop == 3'b101);
  wire ex_lwu = (ex_memop == 3'b110);
  //wire ex_sb  = (ex_memop[1:0] == 2'b00);
  wire ex_sh  = (ex_memop[1:0] == 2'b01);
  wire ex_sw  = (ex_memop[1:0] == 2'b10);
  wire ex_sd  = (ex_memop[1:0] == 2'b11);
  assign ex_memop_low = ex_memop[1:0];

  assign mem_ready_go = 1'b1;
  //this is actually ex_ready_go

  //stuck in ex stage so input won't change
  assign mem_allowin  = !mem_valid || mem_ready_go && wb_allowin;
  assign mem_to_wb_valid = mem_ready_go && mem_valid;
  reg[`YSYX040127_EX_TO_MEM_WIDTH - 1:0]  ex_to_mem_bus_reg;

  wire       mem_timer_int;
  assign
  { mem_timer_int, 
    mem_des_csr,   
    mem_alu_input1,
    mem_rs1,       
    mem_csr_we,    
    mem_mret,      
    mem_ecall,     
    mem_csrrw,     
    mem_csrrs,     
    mem_csrrc,
    mem_csrrwi,
    mem_csrrsi,
    mem_csrrci,
    //mem_jalr,    
    mem_pc,        
    //mem_memop,   
    mem_reg_wen,   
    //mem_memwrite,
    mem_memread,   
    mem_rd,        
    mem_alu_output
    //mem_wdata_tmp
  } = ex_to_mem_bus_reg;

  assign mem_to_wb_bus =
  { mem_timer_int,  //192:192
    mem_des_csr,   //191:180
    mem_alu_input1,//179:116
    mem_rs1,       //115:111
    mem_csr_we,    //110:110
    mem_mret,      //109:109
    mem_ecall,     //108:108
    mem_csrrw,     //107:107
    mem_csrrs,     //106:106
    mem_csrrc,     //105:105
    mem_csrrwi,    //104:104
    mem_csrrsi,    //103:103
    mem_csrrci,    //102:102
    mem_pc,        //101:70
    mem_reg_wen,   //69:69
    mem_rd,        //68:64
    mem_reg_wdata  //63:0
  };

  always @(*) begin
    //if(mem_jalr) mem_reg_wdata = {32'b0, mem_pc + 4};//id(the jalr need break down)
    if(mem_memread) mem_reg_wdata = mem_final_rdata;
    else mem_reg_wdata = mem_alu_output;
  end
  assign mem_doubly_aligned_data_final = mem_doubly_aligned_data_tmp;//dcache_blocked ? mem_doubly_aligned_data_tmp : mem_doubly_aligned_data_tmp;
  
  always @(posedge clk) begin

    if(rst) begin
      mem_valid <= 1'b0;
    end else if(mem_allowin)begin
      mem_valid <= ex_to_mem_valid;
    end

    if(rst)begin
      ex_to_mem_bus_reg <= `YSYX040127_EX_TO_MEM_WIDTH'b0;
      mem_flush <= 0;
    end else if(ex_to_mem_valid && mem_allowin) begin
      ex_to_mem_bus_reg <= ex_to_mem_bus;
      mem_flush <= mem_mret | mem_ecall | ex_flush;
    end else if(ex_ready_go) begin

      ex_to_mem_bus_reg[110:110] <= 1'b0;
      ex_to_mem_bus_reg[70:64] <= 7'b0;
    end
  end

  wire[63:0]rawdata;//after mask
  wire[7:0]ex_addr_lowmask;

  reg[7:0]mem_addr_lowmask;

  always @(posedge clk) begin
    if(rst)begin
      lb <= 0;
      lh <= 0;
      lw <= 0;
      ld <= 0;

      lbu <= 0;
      lhu <= 0;
      lwu <= 0;

      mem_addr_lowmask <= 0;
    end else begin
      lb <= ex_lb;
      lh <= ex_lh;
      lw <= ex_lw;
      ld <= ex_ld;

      lbu <= ex_lbu;
      lhu <= ex_lhu;
      lwu <= ex_lwu;

      mem_addr_lowmask <= ex_addr_lowmask;
    end
  end
  ysyx_040127_decoder_3_8 dec(.in(ex_to_mem_bus[2:0]),.out(ex_addr_lowmask));//in:mem_raddr

  assign mem_final_rdata[7:0]  = rawdata[7:0];//alu_output
  assign mem_final_rdata[15:8] = {8{lb}} & {8{rawdata[7]}} |
  {8{lh | lhu}} & rawdata[15:8]| {8{lw | lwu | ld}}  & rawdata[15:8];
  assign mem_final_rdata[31:16] = {16{lb}} & {16{rawdata[7]}} |
  {16{lh}} & {16{rawdata[15]}} | {16{lw | lwu | ld}} & rawdata[31:16];
  assign mem_final_rdata[63:32] = {32{lb}} & {32{rawdata[7]}} |
  {32{lh}} & {32{rawdata[15]}} | {32{lw}} & {32{rawdata[31]}} |
  {32{ld}} & rawdata[63:32];
  //always @(posedge clk)begin
  assign rawdata = ld ? mem_doubly_aligned_data_final :
    (mem_addr_lowmask[3'b000] & (lw | lwu)) ? {32'b0, mem_doubly_aligned_data_final[31:0]} :
    (mem_addr_lowmask[3'b100] & (lw | lwu)) ? {32'b0, mem_doubly_aligned_data_final[63:32]}:

    (mem_addr_lowmask[3'b000] & (lh | lhu)) ? {48'b0, mem_doubly_aligned_data_final[15:0]} :
    (mem_addr_lowmask[3'b010] & (lh | lhu)) ? {48'b0, mem_doubly_aligned_data_final[31:16]}:
    (mem_addr_lowmask[3'b100] & (lh | lhu)) ? {48'b0, mem_doubly_aligned_data_final[47:32]}:
    (mem_addr_lowmask[3'b110] & (lh | lhu)) ? {48'b0, mem_doubly_aligned_data_final[63:48]}:

    (mem_addr_lowmask[3'b000] & (lb | lbu)) ? {56'b0, mem_doubly_aligned_data_final[7:0]}:
    (mem_addr_lowmask[3'b001] & (lb | lbu)) ? {56'b0, mem_doubly_aligned_data_final[15:8]}:
    (mem_addr_lowmask[3'b010] & (lb | lbu)) ? {56'b0, mem_doubly_aligned_data_final[23:16]}:
    (mem_addr_lowmask[3'b011] & (lb | lbu)) ? {56'b0, mem_doubly_aligned_data_final[31:24]}:
    (mem_addr_lowmask[3'b100] & (lb | lbu)) ? {56'b0, mem_doubly_aligned_data_final[39:32]}:
    (mem_addr_lowmask[3'b101] & (lb | lbu)) ? {56'b0, mem_doubly_aligned_data_final[47:40]}:
    (mem_addr_lowmask[3'b110] & (lb | lbu)) ? {56'b0, mem_doubly_aligned_data_final[55:48]}:
    (mem_addr_lowmask[3'b111] & (lb | lbu)) ? {56'b0, mem_doubly_aligned_data_final[63:56]}
    : 64'b0;

  assign ex_wmask[0] = ex_addr_lowmask[3'b000] | ex_sd;
  assign ex_wmask[1] = ex_addr_lowmask[3'b001] | ex_addr_lowmask[3'b000] & (ex_sh|ex_sw) | ex_sd;
  assign ex_wmask[2] = ex_addr_lowmask[3'b010] | ex_addr_lowmask[3'b000] & ex_sw | ex_sd;
  assign ex_wmask[3] = ex_addr_lowmask[3'b011] | ex_addr_lowmask[3'b010] & ex_sh |
  ex_addr_lowmask[3'b000] & ex_sw | ex_sd;
  assign ex_wmask[4] = ex_addr_lowmask[3'b100] | ex_sd;
  assign ex_wmask[5] = ex_addr_lowmask[3'b101] | ex_addr_lowmask[3'b100] & (ex_sh|ex_sw) | ex_sd;
  assign ex_wmask[6] = ex_addr_lowmask[3'b110] | ex_addr_lowmask[3'b100] & ex_sw | ex_sd;
  assign ex_wmask[7] = ex_addr_lowmask[3'b111] | ex_addr_lowmask[3'b110] & ex_sh |
  ex_addr_lowmask[3'b100] & ex_sw | ex_sd;


endmodule

module ysyx_040127_mul (
  input clk,
  input rst,
  input [63:0] x,
  input [63:0] y,
  input xs,//w or y is signed
  input ys,
  output [63:0] high,
  output [63:0] low,
  input  mul_type,
  input  mul_stuck,//stuck by instruction fetch
  output reg ready
);
  wire[64:0] x_ext;
  wire[66:0] y_ext;//for booth:++
  reg[127:0] res;
  reg[4:0]   cnt;
  reg[127:0]  multiplier;
  reg[66:0]   multiplied;
  reg[1:0] mul_state;

  localparam IDLE = 2'b00, MUL_ON = 2'b01, MUL_OK = 2'b11;
  //16c[1] left

  wire[127:0] x_comp;

  assign x_ext = {(xs ? x[63] : 1'b0), x};
  assign y_ext = {(ys ? {2{y[63]}} : 2'b0), y, 1'b0};
  assign     x_comp = (~multiplier) + 1;
  
  wire[127:0] z = {128{multiplied[2:0] == 3'b000 || multiplied[2:0] == 3'b111}} & 128'b0 |
    {128{multiplied[2:0] == 3'b001 || multiplied[2:0] == 3'b010}} & multiplier           |
    {128{multiplied[2:0] == 3'b101 || multiplied[2:0] == 3'b110}} & x_comp      |
    {128{multiplied[2:0] == 3'b011}} & {multiplier[126:0], 1'b0}                |
    {128{multiplied[2:0] == 3'b100}} & {x_comp[126:0], 1'b0};

  always @(posedge clk) begin
    if(rst)begin
      cnt   <= 0;
      ready <= 0;
      res   <= 0;
      mul_state  <= 0;
      multiplier <= 0;
      multiplied <= 0;
    end else begin 
      case(mul_state)
        IDLE:begin
          if(mul_type & !mul_stuck)begin
            mul_state <= MUL_ON;
            cnt <= 5'b0;
            ready <= 1'b0;
            res   <= 128'b0;
            multiplier <= {{63{x_ext[64]}}, x_ext};
            multiplied <= y_ext;
          end else if(!mul_stuck)begin
            ready <= 1'b0;
          end
        end
        MUL_ON:begin
          cnt <= cnt + 1;
          res <= res + z;
          multiplied <= multiplied >> 2;
          multiplier <= multiplier << 2;
          if(cnt == 5'b11111)mul_state <= MUL_OK;
        end
        MUL_OK:begin
          ready <= 1'b1;
          mul_state <= IDLE;
        end
        default: mul_state <= IDLE;
      endcase
    end
  end

  assign high = res[127:64];
  assign low  = res[63:0];

endmodule


module ysyx_040127_MuxKeyInternal #(NR_KEY = 2, KEY_LEN = 1, DATA_LEN = 1, HAS_DEFAULT = 0) (
  output reg [DATA_LEN-1:0] out,
  input [KEY_LEN-1:0] key,
  input [DATA_LEN-1:0] default_out,
  input [NR_KEY*(KEY_LEN + DATA_LEN)-1:0] lut
);

  localparam PAIR_LEN = KEY_LEN + DATA_LEN;
  //width and length
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

  //<key,data> pair
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
    if (!HAS_DEFAULT) out = lut_out;
    else out = (hit ? lut_out : default_out);
  end
endmodule

// 不带默认值的选择器模板
module ysyx_040127_MuxKey #(NR_KEY = 2, KEY_LEN = 1, DATA_LEN = 1) (
  output [DATA_LEN-1:0] out,
  input [KEY_LEN-1:0] key,
  input [NR_KEY*(KEY_LEN + DATA_LEN)-1:0] lut
);
  ysyx_040127_MuxKeyInternal #(NR_KEY, KEY_LEN, DATA_LEN, 0) i0 (out, key, {DATA_LEN{1'b0}}, lut);
endmodule

// 带默认值的选择器模板
module ysyx_040127_MuxKeyWithDefault #(NR_KEY = 2, KEY_LEN = 1, DATA_LEN = 1) (
  output [DATA_LEN-1:0] out,
  input [KEY_LEN-1:0] key,
  input [DATA_LEN-1:0] default_out,
  input [NR_KEY*(KEY_LEN + DATA_LEN)-1:0] lut
);
  ysyx_040127_MuxKeyInternal #(NR_KEY, KEY_LEN, DATA_LEN, 1) i0 (out, key, default_out, lut);
endmodule

module ysyx_040127_mux21(a,b,s,y);
  input[63:0] a,b;
  input s;
  output[63:0] y;

  // 通过MuxKey实现如下always代码
  // always @(*) begin
  //  case (s)
  //    1'b0: y = a;
  //    1'b1: y = b;
  //  endcase
  // end
  ysyx_040127_MuxKey #(2, 1, 64) i0 (y, s, {
    1'b0, a,//y = a
    1'b1, b //y = b
  });
endmodule

module ysyx_040127_decoder_2_4
(
  input [1:0]     in,
  output[3:0]   out
);

genvar i;
generate
for(i=0;i<4;i=i+1)
begin
  assign out[i] = (in == i);
end
endgenerate
endmodule

module ysyx_040127_decoder_3_8
(
  input [2:0]     in,
  output[7:0]     out
);

genvar i;
generate
for(i=0;i<8;i=i+1)
begin
  assign out[i] = (in == i);
end
endgenerate
endmodule


module ysyx_040127_decoder_5_32
(
  input [4:0]     in,
  output[31:0]   out
);

  genvar i;
  generate
    for(i=0;i<32;i=i+1)
    begin
      assign out[i] = (in == i);
    end
  endgenerate
endmodule


module ysyx_040127_decoder_6_64
(
  input [5:0]     in,
  output[63:0]   out
);
  genvar i;
  generate
    for(i=0;i<64;i=i+1)
    begin
      assign out[i] = (in == i);
    end
  endgenerate
endmodule


module ysyx_040127_RegisterFile (
  input clk,
  input rst,
  output       wb_allowin,    //for last stage
  input        mem_to_wb_valid, //from last stage
  input [`YSYX040127_MEM_TO_WB_WIDTH-1:0] mem_to_wb_bus,
  input        mem_timer_int,
  input [4:0]  raddr1,
  input [4:0]  raddr2,
  output[63:0] rdata1,
  output[63:0] rdata2,
  input        timer_int,
  output[4:0]  wb_rd,
  output[63:0] wb_reg_wdata,
  output           wb_reg_wen,
  output           wb_mret,
  output           wb_timer_int,
  output           wb_csr_we,
  output [31:0]    mepc_low,
  output [31:0]    mtvec_low,
  output           mstatus,
  output           mie,
  input     [63:0] csr_mcycle,
  output           wb_ecall,
  input            mem_flush
);

  localparam MTVEC    = 12'h305;
  localparam MCAUSE   = 12'h342;
  localparam MSTATUS  = 12'h300;
  localparam MEPC     = 12'h341;
  localparam MIE      = 12'h304;
  localparam MIP      = 12'h344;
  localparam MSCRATCH = 12'h340;
  localparam MHARTID  = 12'hF14;
  localparam MCYCLE   = 12'hB00;

  wire[11:0] wb_des_csr;
  wire[63:0] wb_reg_wdata_tmp;


  reg [63:0] rf[31:0];
  reg [63:0] csr_mtvec;
  reg [63:0] csr_mepc;
  reg [63:0] csr_mcause;
  reg [63:0] csr_mip;
  reg [63:0] csr_mie;
  reg [63:0] csr_mscratch;
  reg [63:0] csr_mhartid;
  wire[63:0] csr_mstatus;
  reg [49:0] mstatus_high;
  reg [1:0]  mstatus_mpp;
  reg        mstatus_mpie;
  reg        mstatus_mie;
  reg        wb_flush;
  reg        wb_valid;
  wire[4:0]  wb_rs1;
  wire       wb_csrrw;
  wire       wb_csrrs;
  wire       wb_csrrc;
  wire       wb_csrrwi;
  wire       wb_csrrsi;
  wire       wb_csrrci;
  wire[63:0] wb_csrwdata;
  wire[63:0] wb_csrrdata;
  //test
  wire[63:0] wb_alu_input1;
  wire[31:0] wb_pc;

  assign mstatus     = csr_mstatus[3];
  assign mie         = csr_mie[7];
  assign mtvec_low   = csr_mtvec[31:0];
  assign mepc_low    = csr_mepc[31:0];
  //assign wb_rmcycle  = (wb_des_csr == MCYCLE) & wb_csrrs;
  assign wb_csrrdata = {64{wb_des_csr == MTVEC}} & csr_mtvec |
  {64{wb_des_csr == MCYCLE}} & csr_mcycle |
  {64{wb_des_csr == MCAUSE}} & csr_mcause | {64{wb_des_csr == MSTATUS}} & csr_mstatus |
  {64{wb_des_csr == MEPC}}   & csr_mepc   | {64{wb_des_csr == MIE}} & csr_mie |
  {64{wb_des_csr == MIP}} & csr_mip | {64{wb_des_csr == MSCRATCH}} & csr_mscratch |
  {64{wb_des_csr == MHARTID}} & csr_mhartid;

  assign wb_csrwdata = {64{wb_csrrc}} & wb_csrrdata & (~wb_alu_input1) |
  {64{wb_csrrci}}  & wb_csrrdata & (~{59'b0,wb_rs1}) | {64{wb_csrrs}} & (wb_csrrdata  | wb_alu_input1) |
  {64{wb_csrrsi}}  & (wb_csrrdata | {59'b0,wb_rs1})  | {64{wb_csrrw}} & wb_alu_input1 |
  {64{wb_csrrwi}}  & {59'b0,wb_rs1};

  assign csr_mstatus[63]    = (mstatus_high[3:2] == 2'b11 || mstatus_high[1:0] == 2'b11);//FS=2'b11 || VS=2'b11 || XS = 2'b11
  assign csr_mstatus[62:13] = mstatus_high;//why
  assign csr_mstatus[12:11] = mstatus_mpp;
  assign csr_mstatus[10:8]  = 3'b0;
  assign csr_mstatus[7] = mstatus_mpie;
  assign csr_mstatus[6:4] = 3'b0;
  assign csr_mstatus[3] = mstatus_mie;
  assign csr_mstatus[2:0] = 3'b0;

  //hard wired value:
  //1:MPP(12:11) (TBC)
  //0:uie(0),sie(1),WPRI(2),upie(4),spie(5),WPRI(6),SPP(8),WPRI(10:9),(31:17)
  //XSL[1](35 TBC) UXL[1](33 TBC) XS(16:15 TBC) FS(14:13 TBC)

  always @(posedge clk) begin
    if(rst)begin
      mstatus_high <= 50'b0;
    end else if(wb_csr_we && wb_des_csr == MSTATUS) begin
      mstatus_high <= wb_csrwdata[62:13];
    end
    if(rst)mstatus_mpp <= 2'b11;//write on 6
    else if(wb_ecall & wb_valid | wb_timer_int & timer_int)mstatus_mpp <= 2'b11;//?
    else if(wb_mret & wb_valid) mstatus_mpp <= 2'b00;//why
    else if(wb_csr_we && wb_des_csr == MSTATUS) mstatus_mpp <= wb_csrwdata[12:11];

    if(rst)mstatus_mpie <= 1'b0;
    else if(wb_ecall & wb_valid | wb_timer_int & timer_int)mstatus_mpie <= mstatus_mie;
    else if(wb_mret & wb_valid) mstatus_mpie <= 1'b1;
    else if(wb_csr_we && wb_des_csr == MSTATUS) mstatus_mpie <= wb_csrwdata[7];

    if(rst)mstatus_mie <= 1'b0;
    else if(wb_ecall & wb_valid | wb_timer_int & timer_int) mstatus_mie <= 1'b0;
    else if(wb_mret & wb_valid) mstatus_mie <= mstatus_mpie;//1'b1;
    else if(wb_csr_we && wb_des_csr == MSTATUS) mstatus_mie <= wb_csrwdata[3];

    if(rst)begin
      csr_mepc   <= 64'b0;
      csr_mcause <= 64'b0;
    end else if(wb_ecall)begin
      csr_mepc   <= {32'b0,wb_pc};//?
      csr_mcause <= 11;
    end else if(wb_timer_int & timer_int)begin
      csr_mepc   <= {32'b0,wb_pc};//?
      csr_mcause <= 64'h8000000000000007;
    end else if(wb_csr_we && wb_des_csr == MEPC)csr_mepc <= wb_csrwdata;
    else if(wb_csr_we && wb_des_csr == MCAUSE)csr_mcause <= wb_csrwdata;

    if(rst)begin
      csr_mtvec    <= 64'b0;
      csr_mie      <= 64'b0;
      csr_mip      <= 64'b0;
      csr_mscratch <= 64'b0;
      csr_mhartid  <= 64'b0;
    end else if(wb_csr_we && wb_des_csr == MTVEC)csr_mtvec <= wb_csrwdata;
    else if(wb_csr_we && wb_des_csr == MIE)csr_mie <= wb_csrwdata;
    else if(wb_csr_we && wb_des_csr == MIP)csr_mip <= wb_csrwdata;
    else if(wb_csr_we && wb_des_csr == MSCRATCH)csr_mscratch <= wb_csrwdata;
    else if(wb_csr_we && wb_des_csr == MHARTID)csr_mhartid <= wb_csrwdata;
  end

  reg [`YSYX040127_MEM_TO_WB_WIDTH-1:0] mem_to_wb_bus_reg;
  assign rdata1 = rf[raddr1];
  assign rdata2 = rf[raddr2];
  //import "DPI-C" function void set_gpr_ptr(input logic [63:0] a []);
  //initial set_gpr_ptr(rf);

  wire wb_ready_go;
  wire wb_reg_wen_tmp;
  wire wb_csr_we_tmp;
  assign wb_ready_go = 1'b1;
  assign wb_allowin  = !wb_valid || wb_ready_go;
  assign wb_reg_wen = wb_reg_wen_tmp && !wb_flush && !wb_timer_int;
  assign wb_csr_we  = wb_csr_we_tmp & wb_valid;
  assign
  { wb_timer_int,
    wb_des_csr,
    wb_alu_input1,
    wb_rs1,
    wb_csr_we_tmp,
    wb_mret,
    wb_ecall,
    wb_csrrw,
    wb_csrrs,
    wb_csrrc,
    wb_csrrwi,
    wb_csrrsi,
    wb_csrrci,
    wb_pc,
    wb_reg_wen_tmp,
    wb_rd,
    wb_reg_wdata_tmp
  } = mem_to_wb_bus_reg;

  always @(posedge clk) begin
    if(rst) begin
      wb_valid <= 1'b0;
    end else if(wb_allowin)begin
      wb_valid <= mem_to_wb_valid && !mem_flush && !mem_timer_int;
    end
    if(rst)begin
      mem_to_wb_bus_reg <= `YSYX040127_MEM_TO_WB_WIDTH'b0;
    end else if(mem_to_wb_valid && wb_allowin) begin
      mem_to_wb_bus_reg <= mem_to_wb_bus;
      wb_flush  <= mem_flush;
    end else begin
      mem_to_wb_bus_reg[69:64] <= 6'b0;
    end//else mem_to_wb_bus_reg[69:0] <= 70'b0;
  end
  assign wb_reg_wdata = wb_csr_we ? wb_csrrdata : wb_reg_wdata_tmp;
  always @(posedge clk) begin

    if(rst)begin
       rf[0] <= 64'b0;
       rf[1] <= 64'b0;
       rf[2] <= 64'b0;
       rf[3] <= 64'b0;
       rf[4] <= 64'b0;
       rf[5] <= 64'b0;
       rf[6] <= 64'b0;
       rf[7] <= 64'b0;
       rf[8] <= 64'b0;
       rf[9] <= 64'b0;
       rf[10] <= 64'b0;
       rf[11] <= 64'b0;
       rf[12] <= 64'b0;
       rf[13] <= 64'b0;
       rf[14] <= 64'b0;
       rf[15] <= 64'b0;
       rf[16] <= 64'b0;
       rf[17] <= 64'b0;
       rf[18] <= 64'b0;
       rf[19] <= 64'b0;
       rf[20] <= 64'b0;
       rf[21] <= 64'b0;
       rf[22] <= 64'b0;
       rf[23] <= 64'b0;
       rf[24] <= 64'b0;
       rf[25] <= 64'b0;
       rf[26] <= 64'b0;
       rf[27] <= 64'b0;
       rf[28] <= 64'b0;
       rf[29] <= 64'b0;
       rf[30] <= 64'b0;
       rf[31] <= 64'b0;
    end else if (wb_reg_wen && (|wb_rd))begin
       rf[wb_rd] <= wb_reg_wdata;
    end
  end
endmodule
