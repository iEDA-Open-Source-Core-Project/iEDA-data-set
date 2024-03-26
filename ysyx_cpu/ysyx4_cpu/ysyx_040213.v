module ysyx_040213(
  input clock,	
  input reset,
  input io_interrupt,
  input io_master_arready,
  output io_master_arvalid,

  output [31:0] io_master_araddr,
  output [3:0]  io_master_arid,
  output [7:0]  io_master_arlen,
  output [2:0]  io_master_arsize,
  output [1:0]  io_master_arburst,

  output io_master_rready,
  input io_master_rvalid,
  input io_master_rlast,
  input [1:0]  io_master_rresp,
  input [63:0] io_master_rdata,
  input [3:0]  io_master_rid,
  
  input io_master_awready,

  output io_master_awvalid,
  output [31:0] io_master_awaddr,
  output [3:0]  io_master_awid,
  output [7:0]  io_master_awlen,
  output [2:0]  io_master_awsize,
  output [1:0]  io_master_awburst,

  input io_master_wready,
  output io_master_wvalid,
  output [63:0] io_master_wdata,
  output [7:0]  io_master_wstrb,
  output  io_master_wlast,

  output io_master_bready,

  input io_master_bvalid,
  input [1:0] io_master_bresp,
  input [3:0] io_master_bid,

  output io_slave_arready,
  input io_slave_arvalid,

  input [31:0] io_slave_araddr,
  input [3:0]  io_slave_arid,
  input [7:0]  io_slave_arlen,
  input [2:0]  io_slave_arsize,
  input [1:0]  io_slave_arburst,
  
  input io_slave_rready,

  output io_slave_rvalid,
  output io_slave_rlast,
  output [1:0]  io_slave_rresp,
  output [63:0] io_slave_rdata,
  output [3:0]  io_slave_rid,
  
  output io_slave_awready,

  input io_slave_awvalid,
  input [31:0] io_slave_awaddr,
  input [3:0]  io_slave_awid,
  input [7:0]  io_slave_awlen,
  input [2:0]  io_slave_awsize,
  input [1:0]  io_slave_awburst,

  output io_slave_wready,

  input io_slave_wvalid,
  input [63:0] io_slave_wdata,
  input [7:0]  io_slave_wstrb,
  input  io_slave_wlast,

  input io_slave_bready,

  output io_slave_bvalid,
  output [1:0] io_slave_bresp,
  output [3:0] io_slave_bid,

  output [5:0] io_sram0_addr,
  output io_sram0_cen,
  output io_sram0_wen,
  output [127:0] io_sram0_wmask,
  output [127:0] io_sram0_wdata,
  input [127:0] io_sram0_rdata,

  output [5:0] io_sram1_addr,
  output io_sram1_cen,
  output io_sram1_wen,
  output [127:0] io_sram1_wmask,
  output [127:0] io_sram1_wdata,
  input [127:0] io_sram1_rdata,

  output [5:0] io_sram2_addr,
  output io_sram2_cen,
  output io_sram2_wen,
  output [127:0] io_sram2_wmask,
  output [127:0] io_sram2_wdata,
  input [127:0] io_sram2_rdata,

  output [5:0] io_sram3_addr,
  output io_sram3_cen,
  output io_sram3_wen,
  output [127:0] io_sram3_wmask,
  output [127:0] io_sram3_wdata,
  input [127:0] io_sram3_rdata,

  output [5:0] io_sram4_addr,
  output io_sram4_cen,
  output io_sram4_wen,
  output [127:0] io_sram4_wmask,
  output [127:0] io_sram4_wdata,
  input [127:0] io_sram4_rdata,

  output [5:0] io_sram5_addr,
  output io_sram5_cen,
  output io_sram5_wen,
  output [127:0] io_sram5_wmask,
  output [127:0] io_sram5_wdata,
  input [127:0] io_sram5_rdata,

  output [5:0] io_sram6_addr,
  output io_sram6_cen,
  output io_sram6_wen,
  output [127:0] io_sram6_wmask,
  output [127:0] io_sram6_wdata,
  input [127:0] io_sram6_rdata,

  output [5:0] io_sram7_addr,
  output io_sram7_cen,
  output io_sram7_wen,
  output [127:0] io_sram7_wmask,
  output [127:0] io_sram7_wdata,
  input [127:0] io_sram7_rdata
);
    assign io_slave_awready = 1'd0  ;
    assign io_slave_wready  = 1'd0  ;
    assign io_slave_bvalid  = 1'd0  ;
    assign io_slave_bresp   = 2'd0  ;
    assign io_slave_bid     = 4'd0  ;
    assign io_slave_arready = 1'd0  ;
    assign io_slave_rvalid  = 1'd0  ;
    assign io_slave_rresp   = 2'd0  ;
    assign io_slave_rdata   = 64'd0 ;
    assign io_slave_rlast   = 1'd0  ;
    assign io_slave_rid     = 4'd0  ;

wire clk = clock;
wire rst = reset;
wire [63:0] pc;
wire valid_in = 1'b1;
wire [63:0] dnpc;


wire o_icache_addr_ok;
wire o_icache_data_ok;
wire [63:0] o_icache_rdata;


wire o_icache_rd_req;
wire [2:0] o_icache_rd_type;
wire [63:0] o_icache_rd_addr;
wire o_icache_wr_req;
wire [2:0] o_icache_wr_type;
wire [63:0] o_icache_wr_addr;
wire [7:0] o_icache_wr_wstrb;
wire [63:0] o_icache_wr_data;
wire o_icache_fencei_ok;

wire [63:0] o_id_pc_link;
wire [63:0] o_id_inst_sram;
wire [63:0] o_if_pc;

wire o_bub_ID_ready_go;// = 1'b1;

wire ID_allow_in;
wire ID_to_EXE_valid;
wire if_inst_valid;


wire o_dcache_addr_ok;
wire o_dcache_data_ok;
wire [63:0] o_dcache_rdata;

wire o_dcache_rd_req;
wire [2:0] o_dcache_rd_type;
wire [63:0] o_dcache_rd_addr;
wire o_dcache_wr_req;
wire [2:0] o_dcache_wr_type;
wire [63:0] o_dcache_wr_addr;
wire [7:0] o_dcache_wr_wstrb;
wire [63:0] o_dcache_wr_data;
wire o_dcache_fencei_ok;

wire [63:0] adata;
wire [63:0] adatain;
wire [63:0] data1;
wire [63:0] data2;
wire alu_busy;

wire [63:0] mrdata_axi;
wire o_data_wr;
wire o_data_req;
wire [2:0] o_data_size;
wire [63:0] o_data_addr;
wire [7:0] o_data_wstrb;
wire [63:0] o_data_wdata;
wire mem_req;

wire clint_hit;
wire clint_wen;
wire clint_ren;
wire clint_addr;
wire [63:0] clint_wdata;


wire pc_stall;
wire exe_flush;
wire id_flush;
wire [4:0] rs1;
wire [4:0] rs2;

wire [63:0] src1;
wire [63:0] src2;

wire [63:0] o_bub_src1;
wire [63:0] o_bub_src2;



wire [4:0] rd;
wire [2:0] funct3;
wire [6:0] funct7;
wire [63:0] ext_imm;
wire [6:0] opcode;
wire [63:0] shamt;

wire [5:0] nextpc_en;
wire [3:0] RegisterWritedata_en;
wire [3:0] AluData1_en;
wire [6:0] AluData2_en;
wire [16:0] alu_op;

wire op_jalr;
wire jumpb_en; //branch_if enable
wire pc_en; //data1 sel enable
wire w_en;
wire jumpb; //output
wire lm_en;
wire sm_en;
wire sub_en;//beneath may need to shrink?
wire word_en;
wire rv64m_en;
wire arith_en;
wire lui_en;

wire srai;
wire mret;
wire ecall;
wire csrrc;
wire csrrci;
wire csrrs;
wire csrrsi;
wire csrrw;
wire csrrwi;
wire rem;
wire remu;
wire remuw;
wire remw;
wire div;
wire divu;
wire divuw;
wire divw;
wire mul;
wire mulw;
wire [11:0] csr_rs1;
wire fencei;


wire o_if_req;
wire [63:0] o_if_addr;

wire to_fs_valid;

wire REG_allow_in;
wire [63:0] csr_src1;
wire [5:0] csr_wen;
wire [11:0] csr_waddr;
wire [63:0] mepc;
wire [63:0] mtvec;
wire [63:0] clint_rdata;
wire clint_trap_go;

wire EXE_ready_go;
wire EXE_allow_in;
wire EXE_to_MEM_valid;

wire [3:0] o_exe_AluData1_en;
wire [6:0] o_exe_AluData2_en;
wire [63:0] o_exe_src1;
wire [63:0] o_exe_src2;
wire [63:0] o_exe_ext_imm;
wire [63:0] o_exe_pc_link;
wire [63:0] o_exe_shamt;
wire [16:0] o_exe_alu_op;
wire [2:0] o_exe_funct3;
wire [4:0] o_exe_rd;
wire o_exe_w_en;
wire o_exe_word_en;
wire o_exe_sm_en;
wire o_exe_lm_en;
wire [3:0] o_exe_RegWrite_en;
wire [63:0] o_exe_csr_src1;
wire o_exe_reg_w_en;

wire MEM_ready_go;
wire MEM_allow_in;
wire MEM_to_WB_valid;


wire [63:0] o_mem_adata;
wire [2:0] o_mem_funct3;
wire o_mem_sm_en;
wire o_mem_lm_en;
wire [4:0] o_mem_rd;
wire o_mem_w_en;
wire [63:0] o_mem_pc_link;
wire [3:0] o_mem_RegWrite_en;
wire [63:0] o_mem_csr_src1;
wire o_mem_clint_hit;

wire [63:0] wdata;


  wire i_axi_master_arready = io_master_arready;
 
  wire o_axi_master_arvalid; 
  assign io_master_arvalid = o_axi_master_arvalid;

  wire [63:0] o_axi_master_araddr;
  assign io_master_araddr = o_axi_master_araddr[31:0];
  wire [3:0]  o_axi_master_arid;
  assign io_master_arid = o_axi_master_arid;
  wire [7:0]  o_axi_master_arlen;
  assign io_master_arlen = o_axi_master_arlen;
  wire [2:0]  o_axi_master_arsize;
  assign io_master_arsize = o_axi_master_arsize;
  wire [1:0]  o_axi_master_arburst;
  assign io_master_arburst = o_axi_master_arburst;
  
  wire o_axi_master_rready;
  assign io_master_rready = o_axi_master_rready;

  wire i_axi_master_rvalid = io_master_rvalid;
  wire i_axi_master_rlast = io_master_rlast;
  wire [1:0]  i_axi_master_rresp = io_master_rresp;
  wire [63:0] i_axi_master_rdata = io_master_rdata;
  wire [3:0]  i_axi_master_rid = io_master_rid;
  
  wire i_axi_master_awready = io_master_awready;

  wire o_axi_master_awvalid;
  assign io_master_awvalid = o_axi_master_awvalid;
  wire [63:0] o_axi_master_awaddr;
  assign io_master_awaddr = o_axi_master_awaddr[31:0];
  wire [3:0]  o_axi_master_awid;
  assign io_master_awid = o_axi_master_awid;
  wire [7:0]  o_axi_master_awlen;
  assign io_master_awlen = o_axi_master_awlen;
  wire [2:0]  o_axi_master_awsize;
  assign io_master_awsize = o_axi_master_awsize;
  wire [1:0]  o_axi_master_awburst;
  assign io_master_awburst = o_axi_master_awburst;

  wire i_axi_master_wready = io_master_wready;

  wire o_axi_master_wvalid;
  assign io_master_wvalid = o_axi_master_wvalid;
  wire [63:0] o_axi_master_wdata;
  assign io_master_wdata = o_axi_master_wdata;
  wire [7:0]  o_axi_master_wstrb;
  assign io_master_wstrb = o_axi_master_wstrb;
  wire  o_axi_master_wlast;
  assign io_master_wlast = o_axi_master_wlast;

  wire o_axi_master_bready;
  assign io_master_bready = o_axi_master_bready;

  wire i_axi_master_bvalid = io_master_bvalid;
  wire [1:0] i_axi_master_bresp = io_master_bresp;
  wire [3:0] i_axi_master_bid = io_master_bid;
  
  wire i_icache_rd_rdy;
  wire i_icache_ret_valid;
  wire i_icache_ret_last;
  wire [63:0] i_icache_ret_data;
  wire i_icache_wr_rdy;
  wire i_dcache_rd_rdy;
  wire i_dcache_ret_valid;
  wire i_dcache_ret_last;
  wire [63:0] i_dcache_ret_data;
  wire i_dcache_wr_rdy;

wire WB_ready_go = 1'b1;
wire WB_allow_in;
wire WB_to_REG_valid;

wire [4:0] o_wb_rd;
wire o_wb_w_en;
wire [63:0] o_wb_wdata;

wire out_allow = 1'b1;

wire IF_allow_in;
wire IF_to_ID_valid;
wire IF_ready_go = (o_icache_data_ok || if_inst_valid) ;

reg IF_valid;

assign mem_req = (o_mem_sm_en || o_mem_lm_en) && !o_mem_clint_hit;
assign MEM_ready_go = o_dcache_data_ok || !mem_req;
assign EXE_ready_go = (o_dcache_addr_ok || !o_data_req) && (!alu_busy);  //if req must addr_ok

ysyx_040213_pc pc1(
	.rst(rst),
	.clk(clk),

	.to_fs_valid(to_fs_valid),
	.IF_ready_go(IF_ready_go),
	.ID_allow_in(ID_allow_in),
	
	.IF_to_ID_valid(IF_to_ID_valid),
	.IF_allow_in(IF_allow_in),
	.IF_valid(IF_valid),
	.dnpc(dnpc),

	.pc(pc)
);

wire [63:0] pc_link;

ysyx_040213_pc_add pc_a(
	.pc(pc),
	.pc_link(pc_link)
);

ysyx_040213_instfetch_port if3(
	.rst(rst),
	.pc(dnpc),
	.IF_allow_in(IF_allow_in),
	.fencei(fencei),
	.fencei_ok(o_dcache_fencei_ok),

	
	.o_if_req(o_if_req),
	.o_if_addr(o_if_addr)
);

ysyx_040213_cache icache(
	.clk(clk),
	.rst(rst),
	
	.i_cache_req(o_if_req),
	.i_cache_wr(1'b0),
	.i_cache_addr(o_if_addr),
	.i_cache_wdata(64'b0),
	.i_cache_wstrb(8'b0),
	.i_cache_r_type(3'b010),
	.o_cache_addr_ok(o_icache_addr_ok),
	.o_cache_data_ok(o_icache_data_ok),
	.o_cache_rdata(o_icache_rdata),
	.i_cache_fencei(1'b0),
	.o_cache_fencei_ok(o_icache_fencei_ok),

	.o_cache_rd_req(o_icache_rd_req),
	.o_cache_rd_type(o_icache_rd_type),
	.o_cache_rd_addr(o_icache_rd_addr),
	.i_cache_rd_rdy(i_icache_rd_rdy),

	.i_cache_ret_valid(i_icache_ret_valid),
	.i_cache_ret_last(i_icache_ret_last),
	.i_cache_ret_data(i_icache_ret_data),

	.o_cache_wr_req(o_icache_wr_req),
	.o_cache_wr_type(o_icache_wr_type),
	.o_cache_wr_addr(o_icache_wr_addr),
	.o_cache_wr_wstrb(o_icache_wr_wstrb),
	.o_cache_wr_data(o_icache_wr_data),
	.i_cache_wr_rdy(i_icache_wr_rdy),

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

ysyx_040213_IDReg buf1_IF_ID_REG(
	.clk(clk),
	.rst(rst),
	.flush(id_flush),

	//special inst reg
	.IF_ready_go(IF_ready_go),
	.if_inst_valid(if_inst_valid),
	//end

	.IF_to_ID_valid(IF_to_ID_valid),
	//.ID_valid(ID_valid),
	//id ready_go
	.o_bub_ID_ready_go(o_bub_ID_ready_go),//when not exe_bubble and ram data_ok
	.EXE_allow_in(EXE_allow_in),

	.ID_to_EXE_valid(ID_to_EXE_valid),
	.ID_allow_in(ID_allow_in),

	//data in and data out
	.i_id_inst(o_icache_rdata),
	.pc(pc),
//	.dnpc(dnpc),
	//.pc_ready_go(to_fs_valid),
	//.o_if_dnpc(o_if_dnpc),
	.o_if_pc(o_if_pc),
	.i_id_pc_link(pc_link),
	.o_id_inst_sram(o_id_inst_sram),
	.o_id_pc_link(o_id_pc_link)//,
	//DIFFTEST
//	.i_id_diff_clint_trap(o_clint_trap_go),
//	.o_id_diff_clint_trap(o_id_diff_clint_trap)
);


//---------END ID REG----------//
//---------------ID------------//
ysyx_040213_bubble bubble1(
	.rs1(rs1),
	.rs2(rs2),
	.o_exe_rd(o_exe_rd),
	.o_mem_rd(o_mem_rd),
	.o_wb_rd(o_wb_rd),
	.AluData1_en(|AluData1_en[2:0]),
	.AluData2_en(AluData2_en[0] | AluData2_en[5] | AluData2_en[6]),
	.i_jump_en(nextpc_en),
	.i_jumpr_en(op_jalr),
	.sm_en(sm_en),
	.o_exe_w_en(o_exe_w_en),
	.o_mem_w_en(o_mem_w_en),
	.o_wb_w_en(o_wb_w_en),
	.ID_allow_in(ID_allow_in),
	.EXE_ready_go(EXE_ready_go),
	.exe_load(o_exe_lm_en),
	.exe_flush(exe_flush),
	.id_flush(id_flush),
	.MEM_to_WB_valid(MEM_to_WB_valid),
	.fencei(fencei),
	.fencei_ok(o_dcache_fencei_ok),

	.o_bub_src1(o_bub_src1),
	.o_bub_src2(o_bub_src2),
	.src1(src1),
	.src2(src2),
	.i_exe_adata(adata),
	.i_mem_wdata(wdata),
	.i_wb_wdata(o_wb_wdata),

	.ID_ready_go(o_bub_ID_ready_go),
	//.id_bubble(id_bubble),
	//.exe_bubble(exe_bubble),
	.pc_stall(pc_stall)
);
ysyx_040213_IDU idu(
	.inst(o_id_inst_sram[31:0]),
	.rs1(rs1),
	.rs2(rs2),
	.rd(rd),
	.funct3(funct3),
	.funct7(funct7),
	.opcode(opcode),
	.shamt(shamt),
	.ext_imm(ext_imm),
	.csr_rs1(csr_rs1),
	.csr_waddr(csr_waddr),
	.mret(mret),
	.ecall(ecall),
	.csrrc(csrrc),
	.csrrci(csrrci),
	.csrrs(csrrs),
	.csrrsi(csrrsi),
	.csrrw(csrrw),
	.csrrwi(csrrwi),
	.rem(rem),
	.remw(remw),
	.remu(remu),
	.remuw(remuw),
	.div(div),
	.divw(divw),
	.divu(divu),
	.divuw(divuw),
	.mul(mul),
	.mulw(mulw),
	.fencei(fencei)
);

ysyx_040213_contrl ctrl1(
	.remw(remw),
	.remuw(remuw),
	.divw(divw),
	.divuw(divuw),
	.opcode(opcode),
	.funct3(funct3),
	.funct7(funct7),
	.jumpb(jumpb),
	.csrrc(csrrc),
	.csrrci(csrrci),
	.csrrs(csrrs),
	.csrrsi(csrrsi),
	.csrrw(csrrw),
	.csrrwi(csrrwi),
	.ecall(ecall||clint_trap_go),
	.mret(mret),
	.fencei(fencei),
	.csr_wen(csr_wen),
	.w_en(w_en),
	.pc_en(pc_en),
	.jumpb_en(jumpb_en),
	.lm_en(lm_en),
	.sm_en(sm_en),
	.sub_en(sub_en),
	.word_en(word_en),
	.rv64m_en(rv64m_en),
	.arith_en(arith_en),
	.lui_en(lui_en),
	.srai(srai),
	.nextpc_en(nextpc_en),
	.op_jalr(op_jalr),
	.RegisterWritedata_en(RegisterWritedata_en),
	.AluData1_en(AluData1_en),
	.AluData2_en(AluData2_en)
);



ysyx_040213_branchif bi1(
	.jumpb_en(jumpb_en),
	.funct3(funct3),
	.data1(o_bub_src1),
	.data2(o_bub_src2),
	.jumpb(jumpb)
);

ysyx_040213_nextpc dnpc1(
	.clk(clk),
	.rst(rst),

	.exe_reg_w_en(o_exe_reg_w_en),
	.IF_allow_in(IF_allow_in),
	//handshake//
	//pre if-ready go//
	.pc_stall(pc_stall),
	.valid_in(valid_in),
//	.inst_addr_ok(o_instram_addr_ok),//SRAM LIKE
//	.inst_addr_ok(o_axi_inst_addr_ok && o_if_req),//AXI
	.inst_addr_ok(o_icache_addr_ok && o_if_req),//cache
//-----------------------//
	.to_fs_valid(to_fs_valid),
	//clint//
//	.clint_trap_go(clint_trap_go),
//	.o_clint_trap_go(o_clint_trap_go),
	//.br_bus_valid(br_bus_valid),
	//.pc_ready_go(pc_ready_go),	
	.IF_valid(IF_valid),	
	.nextpc_en(nextpc_en), //pre if addr not ok   if data_ok
//	.jumpb_en(jumpb_en & {IF_valid}),
	.src1(o_bub_src1),
	.ext_imm(ext_imm),
	.pc_add_four(o_id_pc_link),
	.mepc(mepc),
	.mtvec(mtvec),
	.pc(pc),
	.dnpc(dnpc)
);

ysyx_040213_RegisterFile #(32,64) reg1(
	.clk(clk),
	.rst(rst),
	.wdata(o_wb_wdata),
	.waddr(o_wb_rd),
	.w_en(o_wb_w_en),

	.rs1(rs1),
	.rs2(rs2),
	.src1(src1),
	.src2(src2),
	//csr//
	.ecall(ecall),
	.o_if_pc(o_if_pc),
	.csr_wen(csr_wen),
	.i_csr_waddr(csr_waddr),
	.csr_wdata(o_bub_src1),
	.csr_rs1(csr_rs1),
	.csr_src1(csr_src1),
	.mtvec(mtvec),
	.mepc(mepc),
	//clint//
	.clint_wen(clint_wen),
	.clint_ren(clint_ren),
	.clint_addr(clint_addr),
	.clint_wdata(clint_wdata),
	.clint_rdata(clint_rdata),
	.i_if_pc(pc),
	.ID_ready_go(o_bub_ID_ready_go),
	.clint_trap_go(clint_trap_go),

	//hand shake//
	.out_allow(out_allow),
	.WB_to_REG_valid(WB_to_REG_valid),

	.REG_allow_in(REG_allow_in)//,
//	.valid_out(valid_out)//,
	//for difftest//
	/*
	.i_reg_id_bubble(o_wb_id_bubble),
	.i_reg_exe_bubble(o_wb_exe_bubble),
	.i_reg_dnpc(o_wb_dnpc),
	.i_reg_inst(o_wb_inst),
	.i_reg_valid(WB_to_REG_valid),
	.i_reg_devices_access(o_wb_devices_access),

	.o_reg_id_bubble(o_reg_id_bubble),
	.o_reg_exe_bubble(o_reg_exe_bubble),
	.o_reg_dnpc(o_reg_dnpc),
	.o_reg_inst(o_reg_inst),
	.o_reg_valid(o_reg_valid),
	.o_reg_devices_access(o_reg_devices_access)
*/
);

ysyx_040213_aluop alu_op1( //alu ctrl signal
	.rem(rem),
	.remu(remu),
	.remw(remw),
	.remuw(remuw),
	.div(div),
	.divu(divu),
	.divw(divw),
	.divuw(divuw),
	.mul(mul),
	.mulw(mulw),
	.funct3(funct3),
	.sub_en(sub_en),
	.pc_en(pc_en),
	.sm_en(sm_en),
	.lm_en(lm_en),
	.word_en(word_en),
	.rv64m_en(rv64m_en),
	.arith_en(arith_en),
	.lui_en(lui_en),
	.srai(srai),
	.alu_op(alu_op)
);




//----------END--ID------------//
//----------ID-EXE-REG---------//
//wire EXE_ready_go = dataram_addr_ok;
//wire EXE_ready_go = o_axi_data_addr_ok || !o_data_req;  //if req must addr_ok
//wire o_exe_fencei;

// for difftest //
/*
wire [31:0] o_exe_inst;
wire [63:0] o_exe_dnpc;
wire o_exe_id_bubble;
wire o_exe_exe_bubble;
wire o_exe_clint_trap;
*/

ysyx_040213_EXEReg buf2_ID_EXE_REG(
	.clk(clk),
	.rst(rst),
	.flush(exe_flush),

	.ID_to_EXE_valid(ID_to_EXE_valid),
	.EXE_ready_go(EXE_ready_go),
	.MEM_allow_in(MEM_allow_in),

	.EXE_to_MEM_valid(EXE_to_MEM_valid),
	.EXE_allow_in(EXE_allow_in),

	.i_exe_AluData1_en(AluData1_en),
	.i_exe_AluData2_en(AluData2_en),
	.i_exe_src1(o_bub_src1),              
	.i_exe_src2(o_bub_src2),
	.i_exe_ext_imm(ext_imm),          
	.i_exe_pc_link(o_id_pc_link),        
	.i_exe_shamt(shamt),
	.i_exe_alu_op(alu_op),
	.i_exe_funct3(funct3),
	.i_exe_rd(rd),
	.i_exe_w_en(w_en),
	.i_exe_word_en(word_en),
 	.i_exe_lm_en(lm_en),
	.i_exe_sm_en(sm_en),
	.i_exe_RegWrite_en(RegisterWritedata_en),
	.i_exe_csr_src1(csr_src1),

	.o_exe_AluData1_en(o_exe_AluData1_en),
	.o_exe_AluData2_en(o_exe_AluData2_en),
	.o_exe_src1(o_exe_src1),              
	.o_exe_src2(o_exe_src2),
	.o_exe_ext_imm(o_exe_ext_imm),          
	.o_exe_pc_link(o_exe_pc_link),        
	.o_exe_shamt(o_exe_shamt),
	.o_exe_alu_op(o_exe_alu_op),
	.o_exe_funct3(o_exe_funct3),
	.o_exe_rd(o_exe_rd),
	.o_exe_w_en(o_exe_w_en),
	.o_exe_word_en(o_exe_word_en),
	.o_exe_lm_en(o_exe_lm_en),
	.o_exe_sm_en(o_exe_sm_en),
	.o_exe_RegWrite_en(o_exe_RegWrite_en),
	.o_exe_csr_src1(o_exe_csr_src1),
	.o_exe_reg_w_en(o_exe_reg_w_en)//,
	//for difftest//
//	.i_exe_id_bubble(id_bubble),
//	.i_exe_exe_bubble(exe_bubble),
//	.i_exe_dnpc(o_if_dnpc),
//	.i_exe_inst(o_id_inst_sram[31:0]),
//	.i_exe_clint_trap(o_id_diff_clint_trap),

//	.o_exe_id_bubble(o_exe_id_bubble),
//	.o_exe_exe_bubble(o_exe_exe_bubble),
//	.o_exe_dnpc(o_exe_dnpc),
//	.o_exe_inst(o_exe_inst),
//	.o_exe_clint_trap(o_exe_clint_trap)

);

//--------------EXE------------//
ysyx_040213_inDataSel insel1(
	.AluData1_en(o_exe_AluData1_en), //from ID
	.AluData2_en(o_exe_AluData2_en), //from ID
	.src1(o_exe_src1),              //from ID
	.src2(o_exe_src2),
	.ext_imm(o_exe_ext_imm),          //from ID
	.pc(o_exe_pc_link),                    //from IF
	.shamt(o_exe_shamt),

	.data1(data1),
	.data2(data2)

);



ysyx_040213_ALU alu1(
	.data1(data1),
	.data2(data2),
	.alu_op(o_exe_alu_op),
	.clk(clk),
	.rst(rst),
	.MEM_allow_in(MEM_allow_in),
	.alu_busy(alu_busy),
	.wdata(adatain)
);

ysyx_040213_aluout alu_out(
	.word_en(o_exe_word_en),
	.adata(adatain),
	.adataout(adata)
);


//----------END-EXE------------//
//---------EXE-MEM-REG--------//
//wire MEM_ready_go = dataram_data_ok;
//wire MEM_ready_go = o_axi_data_data_ok || !mem_req;
//for difftest//
/*
wire o_mem_id_bubble;
wire o_mem_exe_bubble;
wire [31:0] o_mem_inst;
wire [63:0] o_mem_dnpc;
wire o_mem_devices_access;
*/
ysyx_040213_MEMReg buf3_EXE_MEM_REG(
	.clk(clk),
	.rst(rst),

	.EXE_to_MEM_valid(EXE_to_MEM_valid),
	.MEM_ready_go(MEM_ready_go),
	.WB_allow_in(WB_allow_in),

	.MEM_to_WB_valid(MEM_to_WB_valid),
	.MEM_allow_in(MEM_allow_in),

//	.i_mem_src2(o_exe_src2), //from ID
	.i_mem_adata(adata), //from EXE
	.i_mem_funct3(o_exe_funct3), //from ID
	.i_mem_sm_en(o_exe_sm_en),  //from iD
	.i_mem_lm_en(o_exe_lm_en),   //from id
	.i_mem_rd(o_exe_rd),
	.i_mem_w_en(o_exe_w_en),
	.i_mem_pc_link(o_exe_pc_link),
	.i_mem_RegWrite_en(o_exe_RegWrite_en),
	.i_mem_csr_src1(o_exe_csr_src1),
	.i_mem_clint_hit(clint_hit),

//	.o_mem_src2(o_mem_src2),
	.o_mem_adata(o_mem_adata),
	.o_mem_funct3(o_mem_funct3),
	.o_mem_sm_en(o_mem_sm_en),
	.o_mem_lm_en(o_mem_lm_en),
	.o_mem_rd(o_mem_rd),
	.o_mem_w_en(o_mem_w_en),
	.o_mem_pc_link(o_mem_pc_link),
	.o_mem_RegWrite_en(o_mem_RegWrite_en),
	.o_mem_csr_src1(o_mem_csr_src1),
	.o_mem_clint_hit(o_mem_clint_hit)//,

	//for difftest//
//	.i_mem_id_bubble(o_exe_id_bubble),
//	.i_mem_exe_bubble(o_exe_exe_bubble),
//	.i_mem_dnpc(o_exe_dnpc),
//	.i_mem_inst(o_exe_inst),
//	.i_mem_devices_access(devices_access || clint_hit || o_exe_clint_trap), //from EXE 
	
//	.o_mem_id_bubble(o_mem_id_bubble),
//	.o_mem_exe_bubble(o_mem_exe_bubble),
//	.o_mem_dnpc(o_mem_dnpc),
//	.o_mem_inst(o_mem_inst),
//	.o_mem_devices_access(o_mem_devices_access)

);

//--------------MEM------------//

//wire [63:0] mwdata;
//wire [63:0] maddr;
//wire [7:0] wmask;
//wire [63:0] mrdata;


//wire [63:0] mrdata_syn;

//wire mem_mem_req = (o_mem_sm_en || o_mem_lm_en) && EXE_to_MEM_valid;
/*
ysyx_040213_memory mem1(
	.mwdata(o_mem_src2),
	.maddr(o_mem_adata), //from EXE
	.funct3(o_mem_funct3), //from ID
	.mrdata(mrdata), //to WB
	.sm_en(o_mem_sm_en),  //from iD
	.lm_en(o_mem_lm_en)   //from id
);
*/
/*
wire dataram_data_ok;
wire dataram_addr_ok;

ysyx_040213_memory_syn mem2(
	.clk(clk),
	.rst(rst),
	.EXE_to_MEM_valid(EXE_to_MEM_valid),
//	.mwdata(o_exe_src2),
	.maddr(adata), 
	.funct3(o_exe_funct3), 
	.mrdata(mrdata_syn),
	.sm_en(o_exe_sm_en),  
	.lm_en(o_exe_lm_en),
        .data_ok(dataram_data_ok),	
	.addr_ok(dataram_addr_ok)
);
*/
ysyx_040213_memory_port mem3(
	.rst(rst),
//	.EXE_to_MEM_valid(EXE_to_MEM_valid),
	.mwdata(o_exe_src2),
	.maddr(adata), 
	.exe_funct3(o_exe_funct3),
	.mem_funct3(o_mem_funct3), 
	.o_data_mrdata(mrdata_axi),
	.sm_en(o_exe_sm_en),  
	.lm_en(o_exe_lm_en),
	//clint
	.clint_wen(clint_wen),
	.clint_ren(clint_ren),
	.clint_addr(clint_addr),
	.clint_wdata(clint_wdata),
	.clint_hit(clint_hit),

//	.data_addr_ok(data_addr_ok),
//	.data_data_ok(data_data_ok),

//	.i_data_addr_ok(i_data_addr_ok),
//	.i_data_data_ok(i_data_data_ok),
	.i_data_rdata(o_dcache_rdata),
	
	.o_data_wr(o_data_wr),
	.o_data_req(o_data_req),
	.o_data_size(o_data_size),
	.o_data_addr(o_data_addr),
	.o_data_wstrb(o_data_wstrb),
	.o_data_wdata(o_data_wdata)
);

//wire i_data_addr_ok;
//wire i_data_data_ok;
ysyx_040213_cache dcache(
	.clk(clk),
	.rst(rst),
	
	.i_cache_req(o_data_req),
	.i_cache_wr(o_data_wr),
	.i_cache_addr(o_data_addr),
	.i_cache_wdata(o_data_wdata),
	.i_cache_wstrb(o_data_wstrb),
	.i_cache_r_type(o_data_size),
	.o_cache_addr_ok(o_dcache_addr_ok),
	.o_cache_data_ok(o_dcache_data_ok),
	.o_cache_rdata(o_dcache_rdata),
	.i_cache_fencei(fencei),
	.o_cache_fencei_ok(o_dcache_fencei_ok),

	.o_cache_rd_req(o_dcache_rd_req),
	.o_cache_rd_type(o_dcache_rd_type),
	.o_cache_rd_addr(o_dcache_rd_addr),
	.i_cache_rd_rdy(i_dcache_rd_rdy),

	.i_cache_ret_valid(i_dcache_ret_valid),
	.i_cache_ret_last(i_dcache_ret_last),
	.i_cache_ret_data(i_dcache_ret_data),

	.o_cache_wr_req(o_dcache_wr_req),
	.o_cache_wr_type(o_dcache_wr_type),
	.o_cache_wr_addr(o_dcache_wr_addr),
	.o_cache_wr_wstrb(o_dcache_wr_wstrb),
	.o_cache_wr_data(o_dcache_wr_data),
	.i_cache_wr_rdy(i_dcache_wr_rdy),
//	.devices_access(devices_access),

 	.io_sram0_addr(io_sram4_addr),
	.io_sram0_cen(io_sram4_cen),
    	.io_sram0_wen(io_sram4_wen),
    	.io_sram0_wmask(io_sram4_wmask),
    	.io_sram0_wdata(io_sram4_wdata),
    	.io_sram0_rdata(io_sram4_rdata),
    
	.io_sram1_addr(io_sram5_addr),
    	.io_sram1_cen(io_sram5_cen),
    	.io_sram1_wen(io_sram5_wen),
    	.io_sram1_wmask(io_sram5_wmask),
    	.io_sram1_wdata(io_sram5_wdata),
    	.io_sram1_rdata(io_sram5_rdata),
    
	.io_sram2_addr(io_sram6_addr),
    	.io_sram2_cen(io_sram6_cen),
    	.io_sram2_wen(io_sram6_wen),
    	.io_sram2_wmask(io_sram6_wmask),
    	.io_sram2_wdata(io_sram6_wdata),
    	.io_sram2_rdata(io_sram6_rdata),
    	
	.io_sram3_addr(io_sram7_addr),
    	.io_sram3_cen(io_sram7_cen),
    	.io_sram3_wen(io_sram7_wen),
    	.io_sram3_wmask(io_sram7_wmask),
    	.io_sram3_wdata(io_sram7_wdata),
    	.io_sram3_rdata(io_sram7_rdata)
 
);

/*
ysyx_040213_dataram dram(
	.clk(clk),
	.rst(rst),
	.dataram_req(o_data_req),
	.wr(o_data_wr),
	.size(o_data_size),
	.addr(o_data_addr),
	.wstrb(o_data_wstrb),
	.wdata(o_data_wdata),

	.addr_ok(i_data_addr_ok),
	.data_ok(i_data_data_ok),
	.rdata(i_data_rdata)
);
*/
  //----------inst sram like-------------//
 // wire o_axi_inst_addr_ok;
//  wire o_axi_inst_data_ok;
  //-----------data sram like-----------//
  //wire o_axi_data_addr_ok;
//  wire o_axi_data_data_ok;
//  wire [63:0] o_axi_data_rdata;
ysyx_040213_axi_interface axi1(
 .clk(clk),
 .rst(rst),
 //-------------icache-----------------//
 .i_axi_icache_rd_req(o_icache_rd_req),
 .i_axi_icache_rd_type(o_icache_rd_type),
 .i_axi_icache_rd_addr(o_icache_rd_addr),
 .o_axi_icache_rd_rdy(i_icache_rd_rdy),

 .o_axi_icache_ret_valid(i_icache_ret_valid),
 .o_axi_icache_ret_last(i_icache_ret_last),
 .o_axi_icache_ret_data(i_icache_ret_data),

// .i_axi_icache_wr_req(o_icache_wr_req),	
// .i_axi_icache_wr_type(o_icache_wr_type),
// .i_axi_icache_wr_addr(o_icache_wr_addr),
// .i_axi_icache_wr_wstrb(o_icache_wr_wstrb),
// .i_axi_icache_wr_data(o_icache_wr_data),
 .o_axi_icache_wr_rdy(i_icache_wr_rdy),
 
 //-------------dcache-----------------//
 .i_axi_dcache_rd_req(o_dcache_rd_req),
 .i_axi_dcache_rd_type(o_dcache_rd_type),
 .i_axi_dcache_rd_addr(o_dcache_rd_addr),
 .o_axi_dcache_rd_rdy(i_dcache_rd_rdy),

 .o_axi_dcache_ret_valid(i_dcache_ret_valid),
 .o_axi_dcache_ret_last(i_dcache_ret_last),
 .o_axi_dcache_ret_data(i_dcache_ret_data),

 .i_axi_dcache_wr_req(o_dcache_wr_req),	
 .i_axi_dcache_wr_type(o_dcache_wr_type),
 .i_axi_dcache_wr_addr(o_dcache_wr_addr),
 .i_axi_dcache_wr_wstrb(o_dcache_wr_wstrb),
 .i_axi_dcache_wr_data(o_dcache_wr_data),
 .o_axi_dcache_wr_rdy(i_dcache_wr_rdy),
//------------sram-like---------------//
// .i_axi_inst_req(o_icache_rd_req),
// .i_axi_inst_req(o_icache_req),
// .i_axi_inst_addr(o_icache_rd_addr),
// .i_axi_inst_addr(o_icache_addr), 
// .o_axi_inst_addr_ok(o_axi_inst_addr_ok),
// .o_axi_inst_data_ok(o_axi_inst_data_ok),
// .o_axi_inst_rdata(o_axi_inst_rdata),
/*
 .i_axi_data_wr(o_data_wr),
 .i_axi_data_req(o_data_req),
// .i_axi_data_size(o_data_size),
 .i_axi_data_addr(o_data_addr),
 .i_axi_data_wstrb(o_data_wstrb),
 .i_axi_data_wdata(o_data_wdata),
 .o_axi_data_addr_ok(o_axi_data_addr_ok),
 .o_axi_data_data_ok(o_axi_data_data_ok),
 .o_axi_data_rdata(o_axi_data_rdata),*/
  //-----------AXI----------------------//
  //-----------ar-----------------------//
 .i_axi_master_arready(i_axi_master_arready),
 .o_axi_master_arvalid(o_axi_master_arvalid),
 .o_axi_master_araddr(o_axi_master_araddr),
 .o_axi_master_arid(o_axi_master_arid),
 .o_axi_master_arlen(o_axi_master_arlen),
 .o_axi_master_arsize(o_axi_master_arsize),
 .o_axi_master_arburst(o_axi_master_arburst),
  //------------r-----------------------//
 .o_axi_master_rready(o_axi_master_rready),
 .i_axi_master_rvalid(i_axi_master_rvalid),
 .i_axi_master_rlast(i_axi_master_rlast),
 .i_axi_master_rresp(i_axi_master_rresp),
 .i_axi_master_rdata(i_axi_master_rdata),
 .i_axi_master_rid(i_axi_master_rid),
  //------------aw-----------------------//
 .i_axi_master_awready(i_axi_master_awready),
 .o_axi_master_awvalid(o_axi_master_awvalid),
 .o_axi_master_awaddr(o_axi_master_awaddr),
 .o_axi_master_awid(o_axi_master_awid),
 .o_axi_master_awlen(o_axi_master_awlen),
 .o_axi_master_awsize(o_axi_master_awsize),
 .o_axi_master_awburst(o_axi_master_awburst),
  //-------------w-----------------------//
 .i_axi_master_wready(i_axi_master_wready),
 .o_axi_master_wvalid(o_axi_master_wvalid),
 .o_axi_master_wdata(o_axi_master_wdata),
 .o_axi_master_wstrb(o_axi_master_wstrb),
 .o_axi_master_wlast(o_axi_master_wlast),
  //-------------b-----------------------//
 .o_axi_master_bready(o_axi_master_bready),
 .i_axi_master_bvalid(i_axi_master_bvalid),
 .i_axi_master_bresp(i_axi_master_bresp),
 .i_axi_master_bid(i_axi_master_bid)
);
/*
ysyx_040213_ram_axi ram1(
 .clk(clk),
 .rst(rst),
 //-----------ar-----------------------//
 .o_axi_slave_arready(i_axi_master_arready),
 .i_axi_slave_arvalid(o_axi_master_arvalid),
 .i_axi_slave_araddr(o_axi_master_araddr),
// .i_axi_slave_arid(o_axi_master_arid),
// .i_axi_slave_arlen(o_axi_master_arlen),
/ .i_axi_slave_arburst(o_axi_master_arburst),
  //------------r-----------------------//
 .i_axi_slave_rready(o_axi_master_rready),
 .o_axi_slave_rvalid(i_axi_master_rvalid),
// .o_axi_slave_rlast(o_axi_slave_rlast),
// .o_axi_slave_rresp(o_axi_slave_rresp),
 .o_axi_slave_rdata(i_axi_master_rdata),
// .o_axi_slave_rid(o_axi_slave_rid),
  //------------aw-----------------------//
 .o_axi_slave_awready(i_axi_master_awready),
 .i_axi_slave_awvalid(o_axi_master_awvalid),
 .i_axi_slave_awaddr(o_axi_master_awaddr),
// .i_axi_slave_awid(o_axi_master_awid),
// .i_axi_slave_awlen(o_axi_master_awlen),
// .i_axi_slave_awsize(o_axi_master_awsize),
// .i_axi_slave_awburst(o_axi_master_awburst),
  //-------------w-----------------------//
 .o_axi_slave_wready(i_axi_master_wready),
 .i_axi_slave_wvalid(o_axi_master_wvalid),
 .i_axi_slave_wdata(o_axi_master_wdata),
 .i_axi_slave_wstrb(o_axi_master_wstrb),
// .i_axi_slave_wlast(o_axi_master_wlast),
  //-------------b-----------------------//
 .i_axi_slave_bready(o_axi_master_bready),
 .o_axi_slave_bvalid(i_axi_master_bvalid)
// .o_axi_slave_bresp(o_axi_slave_bresp),
// .o_axi_slave_bid(i_axi_master_bid)
); 
*/
//wire need = (o_data_addr == 64'h800002b0) & o_data_wr;
/*
ysyx_040213_inst_compare com2(
	.instt(mrdata_syn & {64{RegisterWritedata_en[2] & o_dcache_data_ok}}),
	.instt_syn(mrdata_axi & {64{RegisterWritedata_en[2] & o_dcache_data_ok}})
);
*/
ysyx_040213_outDataSel sel2(
	.csr_src1(o_mem_csr_src1),
	.mrdata(mrdata_axi),
	.adata(o_mem_adata),
	.pc_link(o_mem_pc_link),
	.clint_hit(o_mem_clint_hit),
	.clint_rdata(clint_rdata),

	.wdata(wdata),

	.RegisterWritedata_en(o_mem_RegWrite_en)
);

//-----------END-MEM-----------//
//-----------WBREG-----------//
//for difftest//
/*
wire o_wb_id_bubble;
wire o_wb_exe_bubble;
wire o_wb_devices_access;
wire [31:0] o_wb_inst;
wire [63:0] o_wb_dnpc;
*/

ysyx_040213_WBReg buf4_MEM_WB_REG(
	.clk(clk),
	.rst(rst),

	.MEM_to_WB_valid(MEM_to_WB_valid),
	.WB_ready_go(WB_ready_go),
	.REG_allow_in(REG_allow_in),

	.WB_allow_in(WB_allow_in),
	.WB_to_REG_valid(WB_to_REG_valid),

	.i_wb_rd(o_mem_rd),
	.i_wb_w_en(o_mem_w_en),
	.i_wb_wdata(wdata),

	.o_wb_rd(o_wb_rd),
	.o_wb_w_en(o_wb_w_en),
	.o_wb_wdata(o_wb_wdata)//,

	//for difftest//
	/*
	.i_wb_id_bubble(o_mem_id_bubble),
	.i_wb_exe_bubble(o_mem_exe_bubble),
	.i_wb_dnpc(o_mem_dnpc),
	.i_wb_inst(o_mem_inst),
	.i_wb_devices_access(o_mem_devices_access),
		
	.o_wb_id_bubble(o_wb_id_bubble),
	.o_wb_exe_bubble(o_wb_exe_bubble),
	.o_wb_dnpc(o_wb_dnpc),
	.o_wb_inst(o_wb_inst),
	.o_wb_devices_access(o_wb_devices_access)
*/

);

//----------------WB-----------//


//----------END-WB------------//


endmodule

module ysyx_040213_WBReg(
	input clk,
	input rst,
	
	input MEM_to_WB_valid,
	input WB_ready_go,
	input REG_allow_in,
	
	output WB_allow_in,
	output WB_to_REG_valid,

	input [4:0] i_wb_rd,
	input i_wb_w_en,
	input [63:0] i_wb_wdata,
	output [4:0] o_wb_rd,
	output o_wb_w_en,
	output [63:0] o_wb_wdata//,
	//for difftest//
//	input [31:0] i_wb_inst,
//	input [63:0] i_wb_dnpc,
//	input i_wb_id_bubble,
//	input i_wb_exe_bubble,
//	input i_wb_devices_access,

//	output [31:0] o_wb_inst,
//	output [63:0] o_wb_dnpc,
//	output o_wb_id_bubble,
//	output o_wb_exe_bubble,
//	output o_wb_devices_access


);
	reg WB_valid;
	reg o_wb_w_en_i;

	assign WB_allow_in = !WB_valid || WB_ready_go && REG_allow_in; //	EXEReg_allow_in;
	assign WB_to_REG_valid = WB_valid && WB_ready_go;

	always @(posedge clk)begin
	  if(rst)begin
	    WB_valid <= 1'b0;
    	  end
	  else if(WB_allow_in)begin
	    WB_valid <= MEM_to_WB_valid;
	  end
	end

	wire w_en;
	assign w_en = MEM_to_WB_valid && WB_allow_in;

	assign o_wb_w_en = WB_valid && o_wb_w_en_i;


	ysyx_040213_Reg #(5,  5 'b0) i0 (clk, rst, i_wb_rd, o_wb_rd, w_en);
	ysyx_040213_Reg #(1,  1 'b0) i1 (clk, rst, i_wb_w_en, o_wb_w_en_i, w_en);
	ysyx_040213_Reg #(64, 64'b0) i2 (clk, rst, i_wb_wdata, o_wb_wdata, w_en);
	//for difftest//
//	ysyx_040213_Reg #(32, 32'b0)  i3 (clk, rst, i_wb_inst, o_wb_inst, w_en);
//	ysyx_040213_Reg #(64, 64'b0)  i4 (clk, rst, i_wb_dnpc, o_wb_dnpc, w_en);
//	ysyx_040213_Reg #(1,   1'b0)  i5 (clk, rst, i_wb_id_bubble, o_wb_id_bubble, w_en);
//	ysyx_040213_Reg #(1,   1'b0)  i6 (clk, rst, i_wb_exe_bubble, o_wb_exe_bubble, w_en);
//	ysyx_040213_Reg #(1,   1'b0)  i7 (clk, rst, i_wb_devices_access, o_wb_devices_access, w_en);

endmodule
module ysyx_040213_aluop(
	input [2:0] funct3,
	input pc_en,
	input lm_en,
	input sm_en,
	input sub_en,
	input word_en,
	input rv64m_en,
	input arith_en,
	input lui_en,
	input srai,
	input rem,
	input remu,
	input remuw,
	input remw,
	input div,
	input divu,
	input divuw,
	input divw,
	input mul,
	input mulw,
	output [16:0] alu_op
);
	wire last = ~pc_en && ~(lm_en || sm_en) && ~word_en && ~lui_en;
assign alu_op[0]  = pc_en || lm_en || sm_en && ~word_en || (word_en && ~rv64m_en && ~funct3[0] && ~funct3[1] && ~funct3[2] && ~sub_en) ||(last && ~rv64m_en && ~funct3[2] && ~funct3[1] && ~funct3[0] && ~sub_en); //add
assign alu_op[1]  = word_en && ~rv64m_en && ~funct3[2] && ~funct3[1] && ~funct3[0] && sub_en ||( last && ~rv64m_en && ~funct3[2] && ~funct3[1] && ~funct3[0] && sub_en);// sub
assign alu_op[2] = last && ~rv64m_en && ~funct3[2] &&  funct3[1] && ~funct3[0];//slt
assign alu_op[3] = last && ~rv64m_en && ~funct3[2] &&  funct3[1] &&  funct3[0];//sltu
assign alu_op[4] = last && ~rv64m_en &&  funct3[2] &&  funct3[1] &&  funct3[0];//and
assign alu_op[5] = 1'b0;  //NOR
assign alu_op[6] = last && ~rv64m_en &&  funct3[2] &&  funct3[1] && ~funct3[0];  //OR
assign alu_op[7] = last && ~rv64m_en &&  funct3[2] && ~funct3[1] && ~funct3[0]; //xor
assign alu_op[8]  = word_en && ~rv64m_en && ~funct3[2] && ~funct3[1] &&  funct3[0] || (last && ~funct3[2] && ~funct3[1] && funct3[0]); //sllw sll
assign alu_op[9]  = word_en && ~rv64m_en &&  funct3[2] && ~funct3[1] &&  funct3[0] && ~arith_en && ~sub_en; //srl

assign alu_op[10] = word_en && ~rv64m_en &&  funct3[2] && ~funct3[1] &&  funct3[0] && ~arith_en && sub_en 
	        || (word_en && ~rv64m_en &&  funct3[2] && ~funct3[1] &&  funct3[0] && arith_en) 
         	|| (last && ~rv64m_en &&  funct3[2] && ~funct3[1] &&  funct3[0])
		|| srai; //sraw sraiw sra

assign alu_op[11] = ~pc_en && ~(lm_en || sm_en) && ~word_en && lui_en;//lui
assign alu_op[12] = word_en &&  rv64m_en && ~funct3[2] && ~funct3[1] && ~funct3[0] || (last && rv64m_en && ~funct3[2] && ~funct3[1] && ~funct3[0]) || mul || mulw; //mul
assign alu_op[13] = word_en &&  rv64m_en &&  funct3[2] && ~funct3[1] && ~funct3[0] || (last && rv64m_en &&  funct3[2] && ~funct3[1] && ~funct3[0]) || div || divw; //div
assign alu_op[14] = word_en &&  rv64m_en &&  funct3[2] &&  funct3[1] && ~funct3[0] || (last && rv64m_en &&  funct3[2] &&  funct3[1] && ~funct3[0]) || rem || remw; //rem
assign alu_op[15] = remu || remuw;
assign alu_op[16] = divu || divuw;


endmodule
module ysyx_040213_aluout(
	input word_en,
	input [63:0] adata,
	output [63:0] adataout
);

	assign adataout = word_en ? {{32{adata[31]}},{adata[31:0]}} : adata;

endmodule
module ysyx_040213_ALU(
	input [63:0] data1,
	input [63:0] data2,
	input [16:0] alu_op,
	input clk,
	input rst,
	input MEM_allow_in,
	output alu_busy,
//	output reg [63:0] wdata
	output [63:0] wdata
);

wire signed [63:0] sdata1;
wire signed [63:0] sdata2;
assign sdata1 = data1;
assign sdata2 = data2;

reg div_doing;
wire div_valid;
wire flush = 1'b0;
wire [1:0] div_signed;
wire div_ready;
wire div_out_valid;
wire [63:0] quotient;
wire [63:0] remainder;

reg mul_doing;
wire mul_valid;
wire [1:0] mul_signed;
wire mul_ready;
wire mul_out_valid;
wire [63:0] result_hi;
wire [63:0] result_lo;

reg div_buffer_valid;
reg mul_buffer_valid;
reg [63:0] mul_buffer_result_lo;
reg [63:0] div_buffer_quotient;
reg [63:0] div_buffer_remainder;

assign alu_busy = |alu_op[16:13] && !div_out_valid && !div_buffer_valid || alu_op[12] && !mul_out_valid && !mul_buffer_valid;
assign div_valid  = |alu_op[16:13] && !div_doing && !div_out_valid;
assign div_signed  = |alu_op[14:13] ? 2'b11 : 2'b00;

assign mul_valid  =  alu_op[12]    && !mul_doing && !mul_out_valid;
assign mul_signed = 2'b00;

always @(posedge clk)begin
  if(rst)begin
    //wdata <= 64'b0;
    div_doing <= 1'b0;
    mul_doing <= 1'b0;
    div_buffer_valid <= 1'b0;
    mul_buffer_valid <= 1'b0;
    mul_buffer_result_lo <= 64'b0;
    div_buffer_quotient <= 64'b0;
    div_buffer_remainder <= 64'b0;
  end else if(mul_out_valid) begin
    mul_doing <= 1'b0;
  end else if(div_out_valid) begin
    div_doing <= 1'b0;
  end else if(div_valid && div_ready)begin
    div_doing <= 1'b1;
  end else if(mul_valid && mul_ready)begin
    mul_doing <= 1'b1;
  end
  
  if(~MEM_allow_in && mul_out_valid)begin
    mul_buffer_valid <= 1'b1;
    mul_buffer_result_lo <= result_lo;
  end else if(MEM_allow_in) begin
    mul_buffer_valid <= 1'b0;
  end
  if(~MEM_allow_in && div_out_valid)begin
    div_buffer_valid <= 1'b1;
    div_buffer_quotient <= quotient;
    div_buffer_remainder <= remainder;
  end else if(MEM_allow_in)begin
    div_buffer_valid <= 1'b0;
  end

end
	wire [63:0] o_result_lo = mul_buffer_valid ? mul_buffer_result_lo : result_lo;
	wire [63:0] o_quotient  = div_buffer_valid ? div_buffer_quotient : quotient;
	wire [63:0] o_remainder = div_buffer_valid ? div_buffer_remainder : remainder;

 	ysyx_040213_MuxKey #(17, 17, 64) i0 (wdata, alu_op, {
		17'b00000000000000001, data1+data2,
		17'b00000000000000010, data1-data2,
		17'b00000000000000100, (sdata1 < sdata2) ? 64'h00000001 : 64'h0,//slt 2	
		17'b00000000000001000, (data1  < data2 ) ? 64'h00000001 : 64'h0,//sltiu 3
		17'b00000000000010000, data1 & data2,//and 4
		17'b00000000000100000, ~(data1 | data2),//nor 5	
		17'b00000000001000000, data1 | data2,//or 6
		17'b00000000010000000, data1 ^ data2,//xor 7
		17'b00000000100000000, data1 << data2[5:0],//sll sllw differenti 8
		17'b00000001000000000, data1 >> data2[5:0],//srl 9 
		17'b00000010000000000, data1 >>> data2[5:0],//sra 10  arithmetic shift right
		17'b00000100000000000, data2,//lui 11
		17'b00001000000000000, o_result_lo,//data1 * data2,//mul 12	
		17'b00010000000000000, o_quotient,//sdata1 / sdata2,//div 13
		17'b00100000000000000, o_remainder,//sdata1 % sdata2,//rem 14
		17'b01000000000000000, o_remainder,//data1 % data2, //remu 15
		17'b10000000000000000, o_quotient//data1 / data2  //divu 16
		});

	ysyx_040213_mul mul1(
	  .clk(clk),
	  .rst(rst),
	  .mul_valid(mul_valid),
	  .flush(flush),
	  .mul_signed(mul_signed),
	  .multiplicand(data1),
	  .multiplier(data2),
	  .mul_ready(mul_ready),
	  .out_valid(mul_out_valid),
	  .result_hi(result_hi),
	  .result_lo(result_lo)
	);

	ysyx_040213_div div1(
	  .clk(clk),
	  .rst(rst),
	  .div_valid(div_valid),
	  .flush(flush),
	  .div_signed(div_signed),
	  .dividend(data1),
	  .divisor(data2),
	  .div_ready(div_ready),
	  .out_valid(div_out_valid),
	  .quotient(quotient),
	  .remainder(remainder)
	);

endmodule



module ysyx_040213_axi_interface(
  input clk,
  input rst,
  //----------icache-------------//

  input i_axi_icache_rd_req,
  input [2:0] i_axi_icache_rd_type,
  input [63:0] i_axi_icache_rd_addr,
  output o_axi_icache_rd_rdy,

  output reg o_axi_icache_ret_valid,
  output reg o_axi_icache_ret_last,
  output reg [63:0] o_axi_icache_ret_data,

//  input i_axi_icache_wr_req,
//  input [2:0] i_axi_icache_wr_type,
//  input [63:0] i_axi_icache_wr_addr,
//  input [7:0] i_axi_icache_wr_wstrb,
//  input [63:0] i_axi_icache_wr_data,
  output o_axi_icache_wr_rdy,	

  //-----------dcache-----------//
  input i_axi_dcache_rd_req,
  input [2:0] i_axi_dcache_rd_type,
  input [63:0] i_axi_dcache_rd_addr,
  output o_axi_dcache_rd_rdy,

  output reg o_axi_dcache_ret_valid,
  output reg o_axi_dcache_ret_last,
  output reg [63:0] o_axi_dcache_ret_data,

  input i_axi_dcache_wr_req,
  input [2:0] i_axi_dcache_wr_type,
  input [63:0] i_axi_dcache_wr_addr,
  input [7:0] i_axi_dcache_wr_wstrb,
  input [63:0] i_axi_dcache_wr_data,
  output o_axi_dcache_wr_rdy,	

  //----------inst sram like-------------//

  //input i_axi_inst_wr,
  //input [2:0]  i_axi_inst_size,
  //input [7:0]  i_axi_inst_wstrb,

//  input i_axi_inst_req,
//  input [63:0] i_axi_inst_addr,

//  output o_axi_inst_addr_ok,
//  output reg o_axi_inst_data_ok,
//  output [63:0] o_axi_inst_rdata,

  //-----------data sram like-----------//
/*  input i_axi_data_wr,
  input i_axi_data_req,
//  input [2:0]  i_axi_data_size,
  input [63:0] i_axi_data_addr,
  input [7:0]  i_axi_data_wstrb,
  input [63:0] i_axi_data_wdata,

  output o_axi_data_addr_ok,
  output o_axi_data_data_ok,
  output [63:0] o_axi_data_rdata,
  */
  //-----------AXI----------------------//
  //-----------ar-----------------------//
  input i_axi_master_arready,
  output reg o_axi_master_arvalid,

  output [63:0] o_axi_master_araddr,
  output [3:0]  o_axi_master_arid,
  output [7:0]  o_axi_master_arlen,
  output [2:0]  o_axi_master_arsize,
  output [1:0]  o_axi_master_arburst,
  
  //------------r-----------------------//
  output reg o_axi_master_rready,

  input i_axi_master_rvalid,
  input i_axi_master_rlast,
  input [1:0]  i_axi_master_rresp,
  input [63:0] i_axi_master_rdata,
  input [3:0]  i_axi_master_rid,
  
  //------------aw-----------------------//
  input i_axi_master_awready,

  output reg o_axi_master_awvalid,
  output [63:0] o_axi_master_awaddr,
  output [3:0]  o_axi_master_awid,
  output [7:0]  o_axi_master_awlen,
  output [2:0]  o_axi_master_awsize,
  output [1:0]  o_axi_master_awburst,

  //-------------w-----------------------//
  input i_axi_master_wready,

  output reg o_axi_master_wvalid,
  output [63:0] o_axi_master_wdata,
  output [7:0]  o_axi_master_wstrb,
  output  o_axi_master_wlast,

  //-------------b-----------------------//
  output reg o_axi_master_bready,

  input i_axi_master_bvalid,
  input [1:0] i_axi_master_bresp,
  input [3:0] i_axi_master_bid

);
/*reg[2:0] size;
//wire need = i_axi_dcache_wr_addr == 64'h830699c8 && i_axi_dcache_wr_req;
always @(*) begin
  case (i_axi_data_wstrb[7:0])
	8'b10000000,
	8'b01000000,
	8'b00100000,
	8'b00010000,
	8'b00001000,
	8'b00000100,
 	8'b00000010,
	8'b00000001: begin 
		size = 3'b000;
	end
	8'b11000000,
	8'b01100000,
	8'b00110000,
	8'b00011000,
	8'b00001100,
	8'b00000110,
	8'b00000011: begin
		size = 3'b001;
	end
	8'b11110000,
	8'b01111000,
	8'b00111100,
	8'b00011110,
	8'b00001111: begin 	
		size = 3'b010;		
	end
	8'hff:begin
		size = 3'b011;
	end
	default: begin
		size = 3'b010;
	end	
  endcase		  
end			
*/
reg [63:0] read_addr;
//reg [1:0]  read_burst;
reg [63:0] read_result;
reg [1:0] if_and_mem_read_status; //[1]: 0 inst, 1 data;[0] reading, 1 done
reg read_en;
reg [2:0] read_type;

reg [63:0] write_addr;
//reg [1:0] write_burst;
reg [63:0] write_data;
reg [7:0]  write_strb;
reg [2:0]  write_type;
reg write_done;
reg write_en;

//----------dcache-sram-line-transfer------------//
wire i_axi_data_wr = i_axi_dcache_wr_req;
wire i_axi_data_req = i_axi_dcache_rd_req  || i_axi_dcache_wr_req;
wire [63:0] i_axi_data_wdata = i_axi_dcache_wr_data;
wire [7:0] i_axi_data_wstrb = i_axi_dcache_wr_wstrb;
//reg [63:0] o_axi_data_rdata;
//reg o_axi_data_data_ok;
//reg o_axi_inst_data_ok;
//assign o_axi_dcache_ret_data = o_axi_data_rdata;
//assign o_axi_dcache_ret_valid = o_axi_data_data_ok;
//assign o_axi_dcache_ret_last = o_axi_data_data_ok;
//assign o_axi_data_addr_ok = i_axi_data_wr? !write_en : !read_en;

wire data_read_req = i_axi_data_req && i_axi_dcache_rd_req;

wire o_axi_inst_addr_ok = !read_en && !data_read_req;

//cache signal
assign o_axi_icache_rd_rdy = o_axi_inst_addr_ok;
assign o_axi_icache_wr_rdy = 1'b1;

assign o_axi_dcache_rd_rdy = !read_en;
assign o_axi_dcache_wr_rdy = !write_en;

//-----------sram like handshake---------//
always @(posedge clk) begin
  if(rst)begin
    read_en <= 1'b0;
    read_addr <= 64'b0;
    read_type <= 3'b0;
    
    write_en <= 1'b0;
    write_addr <= 64'b0;
    write_type <= 3'b0;
    write_data <= 64'b0;
    write_strb <= 8'b0;
    // o_axi_inst_data_ok <= 1'b0;
   // o_axi_data_data_ok <= 1'b0;
    o_axi_icache_ret_valid <= 1'b0;
    o_axi_icache_ret_last <= 1'b0;
    o_axi_dcache_ret_valid <= 1'b0;
    o_axi_dcache_ret_last <= 1'b0;
    o_axi_icache_ret_data <= 64'b0;
    o_axi_dcache_ret_data <= 64'b0;
    
    //read_burst <= 2'b0;
    //write_burst <= 2'b0;
  end else begin
    if(i_axi_data_req && i_axi_data_wr)begin
     // o_axi_data_data_ok <= 1'b0;
    end
    if(!write_en)begin
      if(i_axi_data_req && i_axi_data_wr)begin
        write_addr <= i_axi_dcache_wr_addr;
	write_data <= i_axi_data_wdata;
        //write_burst <= 2'b0;
	write_type <= i_axi_dcache_wr_type;
	write_strb <= i_axi_data_wstrb;
        write_en <= 1'b1;
      end else begin
        write_en <= 1'b0;
      end
    end else begin // wire_en
      if(write_done)begin
//        o_axi_data_data_ok <= 1'b1;
	write_en <= 1'b0;
      end else begin
        write_en <= 1'b1;
      end
    end

    if(!read_en)begin
     // o_axi_inst_data_ok <= 1'b0;
      o_axi_icache_ret_valid <= 1'b0;
      o_axi_icache_ret_last <= 1'b0;
      o_axi_dcache_ret_valid <= 1'b0;
      o_axi_dcache_ret_last <= 1'b0;
      if(i_axi_data_req && i_axi_dcache_rd_req)begin
        read_addr <= i_axi_dcache_rd_addr;
	read_type <= i_axi_dcache_rd_type;
//	read_burst <= i_axi_data_burst;
	if_and_mem_read_status[1] <= 1'b1; //data read
	read_en <= 1'b1;
	//o_axi_data_data_ok <= 1'b0;
        o_axi_icache_ret_valid <= 1'b0;
        o_axi_icache_ret_last <= 1'b0;
      end else if (i_axi_icache_rd_req)begin
        read_addr <= i_axi_icache_rd_addr;
	read_type<= i_axi_icache_rd_type;
//	read_burst <= i_axi_inst_burst;
	if_and_mem_read_status[1] <= 1'b0;
	read_en <= 1'b1;
//      end else if (i_axi_inst_req)begin
  //      read_addr <= i_axi_inst_addr;
////	read_burst <= i_axi_inst_burst;
//	if_and_mem_read_status[1] <= 1'b0;
//	read_en <= 1'b1;
      end else begin
        read_en <= 1'b0;
      end
    end else begin //read_en
      if(if_and_mem_read_status[1])begin
        //data read
        if(if_and_mem_read_status[0])begin
	  //read done
	  //o_axi_data_rdata <= read_result;
	  //o_axi_data_data_ok <= 1'b1;
	  o_axi_dcache_ret_valid <= 1'b1;
	  o_axi_dcache_ret_last <= 1'b1;
	  o_axi_dcache_ret_data <= read_result;
	  read_en <= 1'b0;
  	end else begin
  	  //reading
	  read_en <= 1'b1;
	  //o_axi_data_data_ok <= 1'b0;
	end
      end else begin
        //inst read
	if(if_and_mem_read_status[0])begin
	  //read done
//	  o_axi_inst_rdata <= read_result;
	 // o_axi_inst_data_ok <= 1'b1;
	  o_axi_icache_ret_valid <= 1'b1;
	  o_axi_icache_ret_last <= 1'b1;
	  o_axi_icache_ret_data <= read_result;
	  read_en <= 1'b0;
        end else begin
	  //reading
          read_en <= 1'b1;
	  //o_axi_inst_data_ok <= 1'b0;
	  o_axi_icache_ret_valid <= 1'b0;
	  o_axi_icache_ret_last <= 1'b0;

	end
      end
    end
  end
end

//axi write
reg [1:0] write_status;
assign o_axi_master_awaddr = write_addr;
assign o_axi_master_awlen  = 8'b0;
assign o_axi_master_awsize = write_addr < 64'h0000000080000000 ? write_type : 3'b011;//4 byte
assign o_axi_master_awburst = 2'b01;//incr
assign o_axi_master_awid = 4'b1; //mem

always @(posedge clk)begin
  if(rst)begin
    o_axi_master_awvalid <= 1'b0;
    o_axi_master_wvalid <= 1'b0;
    o_axi_master_bready <= 1'b0;
    write_done <= 1'b0;
  end else if(!write_en)begin
    write_status <= 2'b00;
    write_done <= 1'b0;
    o_axi_master_awvalid <= 1'b0;
    o_axi_master_wvalid <= 1'b0;
    o_axi_master_bready <= 1'b0;
  end else begin
    case(write_status)
      2'b00: begin
        //ready to handshake
        write_status <= 2'b01;
	o_axi_master_awvalid <= 1'b1;
      end
      2'b01: begin
        if(o_axi_master_awvalid && i_axi_master_awready)begin
	  // aw handshake
	  o_axi_master_awvalid <= 1'b0;
	  write_status <= 2'b10;
	  o_axi_master_wvalid <= 1'b1;
        end else begin
	  // not handshake wait still
           o_axi_master_awvalid <= 1'b1;
	  write_status <= 2'b01;
	  o_axi_master_wvalid <= 1'b0;
	end
      end
      2'b10: begin
        if(i_axi_master_wready && o_axi_master_wvalid)begin 
         //w handshake
         write_status <= 2'b11;
	 o_axi_master_wvalid <= 1'b0;
	 o_axi_master_bready <= 1'b1;
        end
      end
      2'b11: begin
        //b handshake
	if(o_axi_master_bready && i_axi_master_bvalid && ~(&i_axi_master_bresp & 1'b0) && ~(&i_axi_master_bid[3:1]) & i_axi_master_bid[0])begin
	  o_axi_master_bready <= 1'b0;
	  write_done <= 1'b1;
	end else begin
	  write_status <= 2'b11;
	end
      end
      default: begin
	write_done <= 1'b0;
	write_status <= 2'b00;
      end
    endcase
  end
end

assign o_axi_master_wdata = o_axi_master_wvalid ? write_data : 64'b0;
assign o_axi_master_wstrb = o_axi_master_wvalid ? write_strb : 8'b0;
assign o_axi_master_wlast = o_axi_master_wvalid ? 1'b1 : 1'b0;

//axi read
reg [1:0] read_status;
assign o_axi_master_araddr = read_addr;
assign o_axi_master_arlen = 8'b0; //no burst 
assign o_axi_master_arsize = read_addr < 64'h0000000080000000 ? read_type: 3'b011;
assign o_axi_master_arburst = 2'b01;
assign o_axi_master_arid = !if_and_mem_read_status[1] ? 4'b0 : 4'b1;

//wire read_diff = i_axi_master_rid != o_axi_master_arid;

always @(posedge clk)begin
  if(rst)begin
    o_axi_master_arvalid <= 1'b0;
    o_axi_master_rready <= 1'b0;
    read_result <= 64'b0; 
  end else if(!read_en)begin
    read_status <= 2'b00;
    if_and_mem_read_status[0] <= 1'b0;
    o_axi_master_arvalid <= 1'b0;
    o_axi_master_rready <= 1'b0;
  end else begin
    case(read_status)
      2'b00: begin
	 //ready to ar hand shake
        read_status <= 2'b01;
	o_axi_master_arvalid <= 1'b1;
      end
      2'b01: begin
        //ar hand shake
	if(o_axi_master_arvalid && i_axi_master_arready)begin
	  o_axi_master_arvalid <= 1'b0;
	  read_status <= 2'b10;
	  o_axi_master_rready <= 1'b1;
        end else begin
          o_axi_master_arvalid <= 1'b1;
	  read_status <= 2'b01;
	  o_axi_master_rready <= 1'b0;
	end
      end
      2'b10: begin
        //r hand shake
        if(o_axi_master_rready && i_axi_master_rvalid && i_axi_master_rlast && ~(&i_axi_master_rresp & 1'b0) && (o_axi_master_arid == i_axi_master_rid))begin
          read_result <= i_axi_master_rdata;
	  //rlast
	  if_and_mem_read_status[0] <= 1'b1;
	  o_axi_master_rready <= 1'b0;
        end
      end
      default: begin
	if_and_mem_read_status[0] <= 1'b0;
	read_status <= 2'b00;
      end
    endcase
  end
end
endmodule

































module ysyx_040213_booth(
	input  [131:0] mul_x,
	input  [2:0] mul_y,
	output [131:0] mul_res
);
  wire y_add,y,y_sub;
  wire sel_negative,sel_double_negative,sel_positive,sel_double_positive;
  wire [131:0] x_double,x_neg,x_neg_double;
  wire [3:0] res_sel;

  assign {y_add,y,y_sub} = mul_y;

  assign sel_negative =  y_add & (y & ~y_sub | ~y & y_sub);
  assign sel_positive = ~y_add & (y & ~y_sub | ~y & y_sub);
  assign sel_double_negative =  y_add & ~y & ~y_sub;
  assign sel_double_positive = ~y_add &  y &  y_sub;

  assign x_double = {{mul_x[130:0]},1'b0};
  assign x_neg = ~mul_x + 132'b1;
  assign x_neg_double = ~x_double + 132'b1;

  assign res_sel = {{sel_negative},{sel_positive},{sel_double_negative},{sel_double_positive}};

  ysyx_040213_MuxKey #(4, 4, 132) i0 (mul_res, res_sel, {
  	4'b1000, x_neg,
	4'b0100, mul_x,
	4'b0010, x_neg_double,
	4'b0001, x_double
  });

endmodule
module ysyx_040213_branchif(
	input jumpb_en,
	input [2:0] funct3,
	input [63:0] data1,
	input [63:0] data2,
	output reg jumpb
);

wire signed [63:0] sdata1;
wire signed [63:0] sdata2;
assign sdata1 = data1;
assign sdata2 = data2;

always @(*)begin
  if(jumpb_en)begin
	jumpb =1'b0;
	case(funct3)
		3'b000 : jumpb = (data1 == data2)?1'b1:1'b0;
		3'b001 : jumpb = (data1 != data2)?1'b1:1'b0;
		3'b100 : jumpb  = (sdata1 < sdata2)? 1'b1:1'b0; //blt
		3'b101 : jumpb  = (sdata1 >= sdata2)? 1'b1:1'b0; //bge
		3'b110 : jumpb  = (data1 < sdata2)? 1'b1:1'b0; //bltu
		3'b111 : jumpb  = (data1 >= sdata2)? 1'b1:1'b0; //bgeu
		default: jumpb = 1'b0;
	endcase
  end
  else jumpb = 1'b0;
end


endmodule
module ysyx_040213_bubble(
	input [4:0] rs1,
	input [4:0] rs2,
	input [4:0] o_exe_rd,
	input [4:0] o_mem_rd,
	input [4:0] o_wb_rd,
	input exe_load,
//	input ID_to_EXE_valid,
	input ID_allow_in,
//	input EXE_allow_in,
	input EXE_ready_go,
	input fencei,
	input fencei_ok,

	input [63:0] src1,
	input [63:0] src2,
	input [63:0] i_exe_adata,
	input [63:0] i_mem_wdata,
	input [63:0] i_wb_wdata,

	input AluData1_en,
	input AluData2_en,
	input [5:0] i_jump_en,
	input i_jumpr_en,
	input sm_en,
	input o_exe_w_en,
	input o_mem_w_en,
	input o_wb_w_en,
	input MEM_to_WB_valid,

	output [63:0] o_bub_src1,
	output [63:0] o_bub_src2,
	output ID_ready_go,
	output pc_stall,
	output exe_flush,
	output id_flush//,
//	output exe_bubble,
//	output id_bubble

);
//	stall ? ID_src1 id_src2 hit o_exe_rd o_mem_rd o_wb_rd
	wire ID_valid = 1'b1;
	wire rd_src1_hit_exe = o_exe_w_en && (rs1 == o_exe_rd) && (rs1 != 0) && ID_valid;
	wire rd_src1_hit_mem = o_mem_w_en && (rs1 == o_mem_rd) && (rs1 != 0) && ID_valid;
	wire rd_src1_hit_wb = o_wb_w_en && (rs1 == o_wb_rd) && (rs1 != 0) && ID_valid;

	wire rd_src2_hit_exe = o_exe_w_en && (rs2 == o_exe_rd) && (rs2 != 0) && ID_valid;
	wire rd_src2_hit_mem = o_mem_w_en && (rs2 == o_mem_rd) && (rs2 != 0) && ID_valid;
	wire rd_src2_hit_wb = o_wb_w_en && (rs2 == o_wb_rd) && (rs2 != 0) && ID_valid;

	wire [2:0] src1_forward_en;
	wire [2:0] src2_forward_en;
	//AluData1_en || i_jump_en[0] for src1 were used
	assign src1_forward_en[2] = (AluData1_en || i_jumpr_en) && rd_src1_hit_exe;
	assign src1_forward_en[1] = (AluData1_en || i_jumpr_en) && rd_src1_hit_mem;
	assign src1_forward_en[0] = (AluData1_en || i_jumpr_en) && rd_src1_hit_wb;

	//AluData2_en || sm_en for src2 were used and sm_en for save instruction
	assign src2_forward_en[2] = (AluData2_en || sm_en ) && rd_src2_hit_exe;
	assign src2_forward_en[1] = (AluData2_en || sm_en ) && rd_src2_hit_mem;
	assign src2_forward_en[0] = (AluData2_en || sm_en ) && rd_src2_hit_wb;
/*
	ysyx_040213_MuxKey #(4, 4, 64) i0 (o_bub_src1, src1_forward_en, {
		4'b1xxx, i_exe_adata,
		4'b01xx, i_mem_wdata,
		4'b001x, i_wb_wdata,
		4'b0001, 64'b1 + src1
		});

	ysyx_040213_MuxKey #(4, 4, 64) i1 (o_bub_src2, src2_forward_en, {
		4'b1xxx, i_exe_adata,
		4'b01xx, i_mem_wdata,
		4'b001x, i_wb_wdata,
		4'b0001, src2		
		});
*/
	assign o_bub_src1 = src1_forward_en[2] ? i_exe_adata : src1_forward_en[1] ? i_mem_wdata : src1_forward_en[0] ? i_wb_wdata : src1;
	assign o_bub_src2 = src2_forward_en[2] ? i_exe_adata : src2_forward_en[1] ? i_mem_wdata : src2_forward_en[0] ? i_wb_wdata : src2;
	
	wire mem_forward_not_ok = (src1_forward_en[1] | src2_forward_en[1]) & ~MEM_to_WB_valid;

	// load and branch need stall   id_hit && exe_hit	
	wire id_hit_exe = (|src1_forward_en[2]) || (|src2_forward_en[2]);
	wire exe_bubble = (id_hit_exe && exe_load) || (fencei & !fencei_ok); //valid for the inst is vaild when compare
	assign exe_flush = exe_bubble && EXE_ready_go; //flush exe reg when mem receive valid data
	assign ID_ready_go = !exe_bubble & !mem_forward_not_ok & !(fencei & !fencei_ok);//!exe_bubble;// !exe_bubble;// && !id_bubble;// && !id_bubble;// exe_ready go  = 0

	//add a bubble when jump and wait til right address when harzard and
	//when id allow in
	wire id_bubble = | i_jump_en && (!exe_bubble) && ID_allow_in; 
	assign id_flush = id_bubble;

	// load to branch need to invalid inst; exe_bubble means load inst in exe;
	assign pc_stall = (| i_jump_en && (exe_bubble | (~MEM_to_WB_valid & rd_src1_hit_mem)));//indeed pcstall
endmodule
module ysyx_040213_cache(
	input clk,
	input rst,
	
	//cache cpu interface
	input i_cache_req,
	input i_cache_wr,
	input [63:0] i_cache_addr,
	input [63:0] i_cache_wdata,
	input [7:0] i_cache_wstrb,
	input [2:0] i_cache_r_type,

	output o_cache_addr_ok,
	output o_cache_data_ok,
	output [63:0] o_cache_rdata,

	input i_cache_fencei,
	output o_cache_fencei_ok,
	//cache axi interface
	output o_cache_rd_req,
	output [2:0] o_cache_rd_type,
	output [63:0] o_cache_rd_addr,
	input i_cache_rd_rdy,

	input i_cache_ret_valid,
	input i_cache_ret_last,
	input [63:0] i_cache_ret_data,
	
	output o_cache_wr_req,
	output [2:0] o_cache_wr_type,
	output [63:0] o_cache_wr_addr,
        output [7:0] o_cache_wr_wstrb,
	output [63:0] o_cache_wr_data,
	input i_cache_wr_rdy,	
	//difftest//
//	output devices_access,

  	output [5:0] io_sram0_addr,
  	output io_sram0_cen,
  	output io_sram0_wen,
  	output [127:0] io_sram0_wmask,
  	output [127:0] io_sram0_wdata,
  	input [127:0] io_sram0_rdata,

  	output [5:0] io_sram1_addr,
  	output io_sram1_cen,
  	output io_sram1_wen,
  	output [127:0] io_sram1_wmask,
  	output [127:0] io_sram1_wdata,
  	input [127:0] io_sram1_rdata,

  	output [5:0] io_sram2_addr,
  	output io_sram2_cen,
  	output io_sram2_wen,
  	output [127:0] io_sram2_wmask,
  	output [127:0] io_sram2_wdata,
  	input [127:0] io_sram2_rdata,

  	output [5:0] io_sram3_addr,
  	output io_sram3_cen,
  	output io_sram3_wen,
  	output [127:0] io_sram3_wmask,
  	output [127:0] io_sram3_wdata,
  	input [127:0] io_sram3_rdata
);
`define YSYX_040213_IDLE         3'b000
`define YSYX_040213_LOOKUP       3'b001
`define YSYX_040213_MISS         3'b010
`define YSYX_040213_REPLACE      3'b011
`define YSYX_040213_REFILL       3'b100
`define YSYX_040213_FENCEI_IDLE  3'b101
`define YSYX_040213_FENCEI_WRITE 3'b110
`define YSYX_040213_WRITE_IDLE   1'b0
`define YSYX_040213_WRITE_WRITE  1'b1
`define YSYX_040213_SERIAL       64'ha00003f8
`define YSYX_040213_RTC          64'ha0000048
`define YSYX_040213_UART_START   64'h10000000
`define YSYX_040213_UART_STOP    64'h10000fff
`define YSYX_040213_SDRAM_START  64'hfc000000
`define YSYX_040213_SDRAM_STOP   64'hffffffff
//wire need = dataram_addr4 == 6'b000000 & !dataram_wen4 & !dataram_cen4; 
//--TAG_V D reg interface-----//
reg [20:0] cache_tagv; //52:1 tag ; 0: v
reg cache_D;

wire [51:0] cache_tag;
wire cache_v;

//Write buffer//
reg write_buffer_state;
reg write_buffer_req;
//reg [63:0] write_buffer_addr;
reg [8:0] write_buffer_index;
//reg [7:0]  write_buffer_wstrb;
reg [127:0] write_buffer_wdata;
reg [127:0] o_write_buffer_bwen;
//wire [8:0] write_buffer_index;
//assign write_buffer_index = write_buffer_addr[11:3];

//fence parameter//
reg [8:0] fencei_index;
reg fencei_ok;
reg [8:0]  fencei_buffer_index;

wire [127:0] dataram_rdata1;
wire [127:0] dataram_rdata2;
wire [127:0] dataram_rdata3;
wire [127:0] dataram_rdata4;

wire dataram_cen1;
wire dataram_cen2;
wire dataram_cen3;
wire dataram_cen4;

wire dataram_wen1;
wire dataram_wen2;
wire dataram_wen3;
wire dataram_wen4;

wire [127:0] dataram_bwen1;
wire [127:0] dataram_bwen2;
wire [127:0] dataram_bwen3;
wire [127:0] dataram_bwen4;

//wire dataram_wen1_t;
//wire dataram_wen2_t;
//wire dataram_wen3_t;
//wire dataram_wen4_t;

wire [5:0] dataram_addr1;
wire [5:0] dataram_addr2;
wire [5:0] dataram_addr3;
wire [5:0] dataram_addr4;

wire [127:0] dataram_wdata1;
wire [127:0] dataram_wdata2;
wire [127:0] dataram_wdata3;
wire [127:0] dataram_wdata4;

reg req_req;
reg req_wr;
reg [63:0] req_addr;
reg [63:0] req_wdata;
reg [7:0] req_wstrb;
reg [2:0] req_r_type;

wire [51:0] req_tag;
wire [2:0] req_offset;
wire [8:0] req_index;
wire flash_req;
wire uart_req;
wire device_req; 
wire uncache;

wire [7:0]  narrow_wstrb;
wire [63:0] narrow_wdata;
wire [2:0] narrow_type;

wire [63:0] missbuffer_rdata;
wire [51:0] missbuffer_cache_tag;
wire missbuffer_cache_D;
wire [8:0] missbuffer_index;
wire [63:0] write_buffer_bwen_half;
wire [127:0] write_data;


//------------dataram------//
wire [127:0] dataram_rdata;
wire [63:0] dataram_cacheline_sel;
//wire [31:0] dataram_rdata_4word;
wire [63:0] dataram_to_loadword;

wire [127:0] fencei_dataram_rdata;
wire [63:0] fencei_dataram_cacheline_sel;
wire [127:0] write_buffer_bwen;
wire [63:0] o_req_wstrb;

//----contrl-signal----//
wire hit_write_harzard;
wire hit_write;
wire hit;
reg [2:0] cache_state;
wire [8:0]  index;
wire dataram_wen;
reg cache_wr_req;
wire [63:0] cache_wdata;
wire [63:0] cache_wstrb;

reg [511:0] dirty_reg;
reg [20:0] tagv_reg [0:511];

wire [8:0] cache_write_index;
wire [20:0] cache_write_tagv;

wire tagv_cen; 
wire dirty_cen; 
wire dirty_wen;
wire tagv_wen;
wire dirty;



//---------------------------------//
assign cache_tag = {32'b0,{cache_tagv[20:1]}};
assign cache_v = cache_tagv[0];
assign o_cache_fencei_ok = fencei_ok;

assign dataram_rdata =     (req_index[8:7] == 2'b00)? dataram_rdata1 : 
			   (req_index[8:7] == 2'b01)? dataram_rdata2 : 
			   (req_index[8:7] == 2'b10)? dataram_rdata3 : 
			   (req_index[8:7] == 2'b11)? dataram_rdata4 : 128'b0;
assign fencei_dataram_rdata = (fencei_buffer_index[8:7] == 2'b00)? dataram_rdata1 : 
			   (fencei_buffer_index[8:7] == 2'b01)? dataram_rdata2 : 
			   (fencei_buffer_index[8:7] == 2'b10)? dataram_rdata3 : 
			   (fencei_buffer_index[8:7] == 2'b11)? dataram_rdata4 : 128'b0;


wire sel_high_cacheline = req_index[0];
//wire sel_high_word      = req_offset[2];

assign fencei_dataram_cacheline_sel = !fencei_buffer_index[0] ? fencei_dataram_rdata[63:0] : fencei_dataram_rdata[127:64];

assign dataram_cacheline_sel = !req_index[0] ? dataram_rdata[63:0] : dataram_rdata[127:64];
//assign dataram_rdata_4word = req_offset[2] ? dataram_cacheline_sel[63:32] : dataram_cacheline_sel[31:0];

ysyx_040213_MuxKey #(8, 3, 64) i6 (dataram_to_loadword, req_offset, {
	3'b000,  dataram_cacheline_sel,
	3'b001,  {{8'b0},dataram_cacheline_sel[63:8]},
	3'b010,  {{16'b0},dataram_cacheline_sel[63:16]},
	3'b011,  {{24'b0},dataram_cacheline_sel[63:24]},
	3'b100,  {{32'b0},dataram_cacheline_sel[63:32]},
	3'b101,  {{40'b0},dataram_cacheline_sel[63:40]},
	3'b110,  {{48'b0},dataram_cacheline_sel[63:48]},
	3'b111,  {{56'b0},dataram_cacheline_sel[63:56]}	
});



ysyx_040213_MuxKey #(4, 8, 64) i5 (cache_wstrb, i_cache_wstrb, {
	8'h01, 64'hff,	
	8'h03, 64'hffff,
	8'h0f, 64'hffffffff,
	8'hff, 64'hffffffffffffffff
});

assign cache_wdata = i_cache_wdata & cache_wstrb;
assign index = i_cache_addr[11:3];

assign hit_write = (cache_state == `YSYX_040213_LOOKUP) && (req_wr == 1'b1) && hit;
//assign hit_write_harzard =  ((cache_state == `YSYX_040213_LOOKUP) && (req_wr == 1'b1) && (i_cache_addr == req_addr)) 
//			 || (write_buffer_state == 1'b1 && i_cache_addr == write_buffer_addr);
//assign hit_write_harzard =  ((cache_state == `YSYX_040213_LOOKUP) && (req_wr == 1'b1) && (hit) && (i_cache_addr == req_addr) && i_cache_req && ~i_cache_wr) 
//			 || (i_cache_req && ~i_cache_wr && write_buffer_state == 1'b1 && i_cache_addr == write_buffer_addr );
assign hit_write_harzard =  ((cache_state == `YSYX_040213_LOOKUP) && (req_wr == 1'b1) && (hit) && (index[8:7] == req_index[8:7]) && i_cache_req && ~i_cache_wr) 
			 //|| (i_cache_req && ~i_cache_wr && write_buffer_state == 1'b1 && index[8:7] == write_buffer_addr[11:10] );
			 || (i_cache_req && ~i_cache_wr && write_buffer_state == 1'b1 && index[8:7] == write_buffer_index[8:7] );


assign o_cache_addr_ok = (cache_state == `YSYX_040213_IDLE && ~hit_write_harzard) 
		    || (((cache_state == `YSYX_040213_LOOKUP) && i_cache_req && hit) && ((i_cache_wr == 1'b1)||(i_cache_wr == 1'b0 && ~hit_write_harzard)));
assign o_cache_data_ok = (cache_state == `YSYX_040213_LOOKUP && ( hit || req_wr == 1'b1)) || (cache_state == `YSYX_040213_REFILL && i_cache_ret_valid);

assign o_cache_rd_req = (cache_state == `YSYX_040213_REPLACE);
assign o_cache_rd_addr = o_cache_rd_req && !(device_req) ? {{req_tag},{req_index},{3'b0}} : o_cache_rd_req && (device_req) ? req_addr : 64'b0;//cache line replace
assign o_cache_rd_type = !uncache ? 3'b011 :
			 req_r_type;


assign o_cache_wr_req   = missbuffer_cache_D || (uncache && req_wr) || (cache_state == `YSYX_040213_FENCEI_WRITE && cache_D) ? cache_wr_req : 1'b0; //D == 1 write_back
assign o_cache_wr_addr  = (cache_state == `YSYX_040213_FENCEI_WRITE) ? {{cache_tag},{fencei_buffer_index},{3'b0}} 
                        : !uncache ? {{missbuffer_cache_tag},{missbuffer_index},{3'b0}} 
			: req_addr;
assign o_cache_wr_wstrb = (cache_state == `YSYX_040213_FENCEI_WRITE) ? 8'hff 
                        : !uncache ? 8'hff 
			: narrow_wstrb;
assign o_cache_wr_type  = (cache_state == `YSYX_040213_FENCEI_WRITE) ? 3'b011 
                        : !uncache ? 3'b011 
			: narrow_type;
assign o_cache_wr_data  = (cache_state == `YSYX_040213_FENCEI_WRITE) ? fencei_dataram_cacheline_sel
			  : !uncache ? missbuffer_rdata 
                          : narrow_wdata;  

//assign devices_access = ((i_cache_addr >= `YSYX_040213_UART_START && i_cache_addr <= `YSYX_040213_UART_STOP ) || (i_cache_addr == `YSYX_040213_SERIAL) || (i_cache_addr == `YSYX_040213_RTC) || (i_cache_addr == `YSYX_040213_RTC+4)) && i_cache_req;

//--------------Request buffer-------------//
ysyx_040213_Reg #(1,  1'b0) i0 (clk, rst, i_cache_req, req_req, (cache_state == `YSYX_040213_IDLE) & (i_cache_req && ~hit_write_harzard )|| (cache_state == `YSYX_040213_LOOKUP) & (hit && i_cache_req && ~hit_write_harzard));
ysyx_040213_Reg #(1,  1'b0) i1 (clk, rst, i_cache_wr,  req_wr,  (cache_state == `YSYX_040213_IDLE) & (i_cache_req && ~hit_write_harzard )|| (cache_state == `YSYX_040213_LOOKUP) & (hit && i_cache_req && ~hit_write_harzard));
ysyx_040213_Reg #(64, 64'b0) i2 (clk, rst, i_cache_addr, req_addr, (cache_state == `YSYX_040213_IDLE) & (i_cache_req && ~hit_write_harzard )|| (cache_state == `YSYX_040213_LOOKUP) & (hit && i_cache_req && ~hit_write_harzard));
ysyx_040213_Reg #(64, 64'b0) i3 (clk, rst, cache_wdata, req_wdata, (cache_state == `YSYX_040213_IDLE) & (i_cache_req && ~hit_write_harzard )|| (cache_state == `YSYX_040213_LOOKUP) & (hit && i_cache_req && ~hit_write_harzard));
ysyx_040213_Reg #(8,  8'b0) i4  (clk, rst, i_cache_wstrb, req_wstrb, (cache_state == `YSYX_040213_IDLE) & (i_cache_req && ~hit_write_harzard )|| (cache_state == `YSYX_040213_LOOKUP) & (hit && i_cache_req && ~hit_write_harzard));
ysyx_040213_Reg #(3,  3'b0) i96 (clk, rst,i_cache_r_type, req_r_type, (cache_state == `YSYX_040213_IDLE) & (i_cache_req && ~hit_write_harzard )|| (cache_state == `YSYX_040213_LOOKUP) & (hit && i_cache_req && ~hit_write_harzard));

ysyx_040213_MuxKey #(8, 3, 64) i99 (narrow_wdata, req_offset, {
	3'b000,  req_wdata,
	3'b001,  {req_wdata[55:0],{8'b0}},
	3'b010,  {req_wdata[47:0],{16'b0}},
	3'b011,  {req_wdata[39:0],{24'b0}},
	3'b100,  {req_wdata[31:0],{32'b0}},
	3'b101,  {req_wdata[23:0],{40'b0}},
	3'b110,  {req_wdata[15:0],{48'b0}},
	3'b111,  {req_wdata[7:0],{56'b0}}	
});
ysyx_040213_MuxKey #(8, 3, 8) i98 (narrow_wstrb, req_offset, {
	3'b000,  req_wstrb,
	3'b001,  {req_wstrb[6:0],{1'b0}},
	3'b010,  {req_wstrb[5:0],{2'b0}},
	3'b011,  {req_wstrb[4:0],{3'b0}},
	3'b100,  {req_wstrb[3:0],{4'b0}},
	3'b101,  {req_wstrb[2:0],{5'b0}},
	3'b110,  {req_wstrb[1:0],{6'b0}},
	3'b111,  {req_wstrb[0],{7'b0}}	
});
ysyx_040213_MuxKey #(21, 8, 3) i97 (narrow_type, req_wstrb, {
	8'b10000000,  3'b000,
	8'b01000000,  3'b000,
	8'b00100000,  3'b000,
	8'b00010000,  3'b000,
	8'b00001000,  3'b000,
	8'b00000100,  3'b000,
 	8'b00000010,  3'b000,
	8'b00000001,  3'b000,
	8'b11000000,  3'b001,
	8'b01100000,  3'b001,
	8'b00110000,  3'b001,
	8'b00011000,  3'b001,
	8'b00001100,  3'b001,
	8'b00000110,  3'b001,
	8'b00000011,  3'b001,
	8'b11110000,  3'b010,
	8'b01111000,  3'b010,
	8'b00111100,  3'b010,
	8'b00011110,  3'b010,
	8'b00001111,  3'b010,		
	8'hff      ,  3'b011
});

assign flash_req = (req_addr >= 64'h0000000030000000 && req_addr <= 64'h000000003fffffff);
assign uart_req = (req_addr >= `YSYX_040213_UART_START && req_addr <= `YSYX_040213_UART_STOP);
assign device_req = flash_req || uart_req || (req_addr == `YSYX_040213_SERIAL) || (req_addr == `YSYX_040213_RTC) || (req_addr == `YSYX_040213_RTC+4) || (req_addr >= `YSYX_040213_UART_START && req_addr <= `YSYX_040213_UART_STOP) || (req_addr < 64'h0000000080000000);// || (req_addr >= `YSYX_040213_SDRAM_START && req_addr <= `YSYX_040213_SDRAM_STOP);

assign uncache = device_req;

assign req_index  = req_addr[11:3];
assign req_tag    = req_addr[63:12];
assign req_offset = req_addr[2:0];

//-------Tag compare-------------//
//ignore uncache
assign hit = (cache_state == `YSYX_040213_LOOKUP) && cache_v && (req_tag == cache_tag) && !uncache;

//--------Data select------------//
wire [63:0] axi_ret_data;
wire [63:0] o_cache_ret_data;

assign axi_ret_data = req_wr ? i_cache_ret_data & narrow_wdata                                          
	                     : o_cache_ret_data; 


ysyx_040213_MuxKey #(8, 3, 64) i15 (o_cache_ret_data, req_offset, {
	3'b000,  i_cache_ret_data,
	3'b001,  {{8'b0},i_cache_ret_data[63:8]},
	3'b010,  {{16'b0},i_cache_ret_data[63:16]},
	3'b011,  {{24'b0},i_cache_ret_data[63:24]},
	3'b100,  {{32'b0},i_cache_ret_data[63:32]},
	3'b101,  {{40'b0},i_cache_ret_data[63:40]},
	3'b110,  {{48'b0},i_cache_ret_data[63:48]},
	3'b111,  {{56'b0},i_cache_ret_data[63:56]}	

});

wire [63:0] load_word = {64{hit}} & {dataram_to_loadword} | {64{~hit && i_cache_ret_valid && i_cache_ret_last}} & {axi_ret_data} & {64{!device_req}} | {64{device_req}} & {64{~hit && i_cache_ret_valid && i_cache_ret_last}} & {o_cache_ret_data}; 

/*
wire [63:0] load_word_test = {64{hit}} & {{32'b0},{dataram_rdata_4word}} | {64{~hit && i_cache_ret_valid && i_cache_ret_last}} & {{32{1'b0}},axi_ret_data};
wire diff_load = (load_word[31:0] != load_word_test[31:0]) && o_cache_data_ok;
*/

//wire [63:0] replace_data = load_word; //no other ways
assign o_cache_rdata = load_word;

wire [127:0] axidata_to_dataram = req_wr ? {{i_cache_ret_data},{i_cache_ret_data}} & ~write_buffer_bwen | write_data & write_buffer_bwen
			                 : {{i_cache_ret_data},{i_cache_ret_data}};
//Miss buffer//
assign missbuffer_cache_tag = cache_tag;
assign missbuffer_rdata = dataram_cacheline_sel;
assign missbuffer_cache_D = cache_D;


//ysyx_040213_Reg #(64,  64'b0) i10 (clk, rst, dataram_cacheline_sel, missbuffer_rdata, (cache_state == `YSYX_040213_MISS) & i_cache_wr_rdy);
//ysyx_040213_Reg #(52,  52'b0) i11 (clk, rst, cache_tag, missbuffer_cache_tag , (cache_state == `YSYX_040213_MISS) & i_cache_wr_rdy);
//ysyx_040213_Reg #(1,    1'b0) i12 (clk, rst, cache_D, missbuffer_cache_D , (cache_state == `YSYX_040213_MISS) & i_cache_wr_rdy);
ysyx_040213_Reg #(9,    9'b0) i13 (clk, rst, req_index, missbuffer_index , (cache_state == `YSYX_040213_MISS) & i_cache_wr_rdy);

// cache finite state machine//
always @(posedge clk)begin
  if(rst)begin
    cache_state <= `YSYX_040213_IDLE;
    cache_wr_req <= 1'b0;
    fencei_index <= 9'b0;
    fencei_ok <= 1'b0;
    fencei_buffer_index <= 9'b0;
  
  end else begin
    if(i_cache_wr_rdy)begin
      cache_wr_req <= 1'b0;
    end
    case(cache_state)
      `YSYX_040213_IDLE: begin
	fencei_ok <= 1'b0;
	fencei_index <= 9'b0;
	if(i_cache_req && ~hit_write_harzard)begin
	  cache_state <= `YSYX_040213_LOOKUP;
	end else if(i_cache_fencei)begin
	  cache_state <= `YSYX_040213_FENCEI_IDLE;
	end		
      end
      `YSYX_040213_LOOKUP: begin
        if((hit && ~i_cache_req) || (hit & hit_write_harzard && i_cache_req))begin
	  cache_state <= `YSYX_040213_IDLE;
	end else if(hit && i_cache_req && ~hit_write_harzard)begin
	  cache_state <= `YSYX_040213_LOOKUP;
  	end else if(~hit) begin
  	  cache_state <= `YSYX_040213_MISS;
  	end else begin
        end
      end
      `YSYX_040213_MISS: begin
      	if(i_cache_wr_rdy)begin
	  cache_state <= `YSYX_040213_REPLACE;
	  cache_wr_req <= 1'b1;
        end
      end
      `YSYX_040213_REPLACE: begin
        if(i_cache_rd_rdy)begin
	  cache_state <= `YSYX_040213_REFILL;
	end else begin
	end
      end
      `YSYX_040213_REFILL: begin
        if(i_cache_ret_valid && i_cache_ret_last)begin
	  cache_state <= `YSYX_040213_IDLE;
	end else begin
	end
      end
      `YSYX_040213_FENCEI_IDLE: begin
       if(i_cache_wr_rdy)begin
	  cache_state <= `YSYX_040213_FENCEI_WRITE;
	  cache_wr_req <= 1'b1;
	  fencei_index <= fencei_index + 1;
	  fencei_buffer_index <= fencei_index;
  	end else begin
	  cache_state <= `YSYX_040213_FENCEI_IDLE;
	end
      end
      `YSYX_040213_FENCEI_WRITE: begin  
        if(fencei_buffer_index == 9'b111111111)begin
	  cache_state <= `YSYX_040213_IDLE;
	  fencei_ok <= 1'b1;
        end else begin
	  cache_state <= `YSYX_040213_FENCEI_IDLE;
	end
      end
      default: begin
        cache_state <= `YSYX_040213_IDLE;
      end
    endcase
  end
end
//write buffer infinite machine// //syn with req buffer//
// = (req_wstrb == 8'hff) ? 64'hffffffffffffffff : sel_high_word ? 64'hffffffff00000000 : 64'h00000000ffffffff;

ysyx_040213_MuxKey #(8, 3, 64) i9 (write_buffer_bwen_half, req_offset, {
	3'b000, o_req_wstrb,
	3'b001, {{o_req_wstrb[55:0]},{8'b0}},
	3'b010, {{o_req_wstrb[47:0]},{16'b0}},
	3'b011, {{o_req_wstrb[39:0]},{24'b0}},
	3'b100, {{o_req_wstrb[31:0]},{32'b0}},
	3'b101, {{o_req_wstrb[23:0]},{40'b0}},
	3'b110, {{o_req_wstrb[15:0]},{48'b0}},
	3'b111, {{o_req_wstrb[7:0]}, {56'b0}}
});


assign write_buffer_bwen = sel_high_cacheline ? {{write_buffer_bwen_half},{64'h0}} : {{64'h0},{write_buffer_bwen_half}};
//wire [63:0] writedata_to_dataram = (req_wstrb == 8'hff) ? req_wdata :  {{req_wdata[31:0]},{req_wdata[31:0]}};

ysyx_040213_MuxKey #(4, 8, 64) i7 (o_req_wstrb, req_wstrb, {
	8'h01, 64'hff,	
	8'h03, 64'hffff,
	8'h0f, 64'hffffffff,
	8'hff, 64'hffffffffffffffff
});
wire [63:0] writedata_to_dataram;
wire [63:0] writedata_to_dataram_buffer;
assign writedata_to_dataram_buffer = req_wdata & o_req_wstrb;
ysyx_040213_MuxKey #(8, 3, 64) i8 (writedata_to_dataram, req_offset, {
	3'b000, writedata_to_dataram_buffer,
	3'b001, {{writedata_to_dataram_buffer[55:0]},{8'b0}},
	3'b010, {{writedata_to_dataram_buffer[47:0]},{16'b0}},
	3'b011, {{writedata_to_dataram_buffer[39:0]},{24'b0}},
	3'b100, {{writedata_to_dataram_buffer[31:0]},{32'b0}},
	3'b101, {{writedata_to_dataram_buffer[23:0]},{40'b0}},
	3'b110, {{writedata_to_dataram_buffer[15:0]},{48'b0}},
	3'b111, {{writedata_to_dataram_buffer[7:0]}, {56'b0}}
});
//wire [127:0] dataram_rdata_i = write_buffer_state & (write_buffer_index[6:1] == req_index[6:1]) & hit_write ? write_buffer_wdata : dataram_rdata;

assign write_data = write_buffer_bwen & {{writedata_to_dataram},{writedata_to_dataram}} ;//| ~write_buffer_bwen & {dataram_rdata_i};

always @(posedge clk)begin
  if(rst)begin
    write_buffer_state <= `YSYX_040213_WRITE_IDLE;
    //write_buffer_addr <= 64'b0;
//    write_buffer_wstrb <= 8'b0;
    write_buffer_index <= 9'b0;
    write_buffer_wdata <= 128'b0;
    write_buffer_req <= 1'b0;
    o_write_buffer_bwen <= 128'b0; 
  end else begin
    case(write_buffer_state)
      `YSYX_040213_WRITE_IDLE: begin
        if(~hit_write)begin
	  write_buffer_state <= `YSYX_040213_WRITE_IDLE;
	end else if (hit_write) begin
	  write_buffer_state <= `YSYX_040213_WRITE_WRITE;
	  //write_buffer_addr <= req_addr;
	  //write_buffer_wstrb <= req_wstrb;
	  write_buffer_index <= req_index;
	  write_buffer_wdata <= write_data;
	  write_buffer_req   <= req_req;
	  o_write_buffer_bwen <= write_buffer_bwen;
  	end else begin
  	end
      end
      `YSYX_040213_WRITE_WRITE: begin
         if(~hit_write)begin
	  write_buffer_state <= `YSYX_040213_WRITE_IDLE;
	  write_buffer_req <= 1'b0;
	end else if (hit_write) begin
	  write_buffer_state <= `YSYX_040213_WRITE_WRITE;
  	  //write_buffer_addr <= req_addr;
	  //write_buffer_wstrb <= req_wstrb;
	  write_buffer_index <= req_index;
	  write_buffer_wdata <= write_data;
	  write_buffer_req   <= req_req;
	  o_write_buffer_bwen <= write_buffer_bwen;
	end else begin
  	end
      end
    endcase 
  end
end



//cache line size 8 Byte - cache line number 2^9 512 
assign dataram_wen = ((cache_state == `YSYX_040213_REFILL) && (i_cache_ret_valid && i_cache_ret_last)) || write_buffer_req;

assign tagv_cen = (cache_state == `YSYX_040213_IDLE) && i_cache_req || (cache_state == `YSYX_040213_LOOKUP) ||(cache_state == `YSYX_040213_REFILL && !uncache) || (cache_state == `YSYX_040213_MISS) & i_cache_wr_rdy & !uncache || (cache_state == `YSYX_040213_FENCEI_WRITE ) || (cache_state == `YSYX_040213_FENCEI_IDLE);
assign tagv_wen = (i_cache_ret_valid && i_cache_ret_last && !uncache) || (cache_state == `YSYX_040213_FENCEI_WRITE); 

assign dirty_cen = (write_buffer_state == `YSYX_040213_WRITE_WRITE) || (cache_state == `YSYX_040213_REFILL && !uncache) || (cache_state == `YSYX_040213_MISS) & i_cache_wr_rdy & !uncache || (cache_state == `YSYX_040213_FENCEI_WRITE ) || (cache_state == `YSYX_040213_FENCEI_IDLE);
assign dirty_wen = write_buffer_state == `YSYX_040213_WRITE_WRITE || (cache_state == `YSYX_040213_REFILL && !uncache) || (cache_state == `YSYX_040213_FENCEI_WRITE);

assign cache_write_index =  (cache_state == `YSYX_040213_FENCEI_IDLE) ? fencei_index :
			   write_buffer_req ? write_buffer_index : req_index;
assign cache_write_tagv =  (cache_state == `YSYX_040213_FENCEI_WRITE) ? 21'b0 :{{req_tag[19:0]},{1'b1}};
assign dirty =  (cache_state == `YSYX_040213_FENCEI_WRITE) ? 1'b0 :(write_buffer_state == `YSYX_040213_WRITE_WRITE) | req_wr ? 1'b1 : 1'b0;

wire [8:0] tagv_r_index = (cache_state == `YSYX_040213_FENCEI_IDLE) ? fencei_index  :(cache_state == `YSYX_040213_MISS & i_cache_wr_rdy) ? req_index : index;
wire [8:0] dirty_r_index = (cache_state == `YSYX_040213_FENCEI_IDLE) ? fencei_index : req_index;
always @(posedge clk)begin
  if(rst)begin
    for(int i = 0; i < 512/4; i = i + 1)begin
      dirty_reg[i*4] <= 1'b0;

      dirty_reg[i*4+1] <= 1'b0;

      dirty_reg[i*4+2] <= 1'b0;

      dirty_reg[i*4+3] <= 1'b0;
    end
  end else if(dirty_wen && dirty_cen)begin
    dirty_reg[cache_write_index] <= dirty;
  end
  if(rst) begin
    for(int i = 0; i < 512/4; i = i + 1)begin
      tagv_reg[i*4] <= 21'b0;

      tagv_reg[i*4+1] <= 21'b0;

      tagv_reg[i*4+2] <= 21'b0;

      tagv_reg[i*4+3] <= 21'b0;
    end
  end else if(tagv_wen && tagv_cen)begin
    tagv_reg[cache_write_index] <= cache_write_tagv;
  end
  if(rst)begin
     cache_tagv <= 21'b0;
    cache_D <= 1'b0; 
  end else begin
    cache_tagv <= tagv_cen  ? tagv_reg[tagv_r_index]  : 21'b0;
    cache_D    <= dirty_cen ? dirty_reg[dirty_r_index] : 1'b0;
  end
end

assign dataram_cen1 = !(((index[8:7] == 2'b00) && i_cache_req) || !dataram_wen1 || ((cache_state == `YSYX_040213_MISS) & i_cache_wr_rdy) || (cache_state == `YSYX_040213_FENCEI_IDLE && fencei_index[8:7] == 2'b00)); 
assign dataram_cen2 = !(((index[8:7] == 2'b01) && i_cache_req) || !dataram_wen2 || ((cache_state == `YSYX_040213_MISS) & i_cache_wr_rdy) || (cache_state == `YSYX_040213_FENCEI_IDLE && fencei_index[8:7] == 2'b01)); 
assign dataram_cen3 = !(((index[8:7] == 2'b10) && i_cache_req) || !dataram_wen3 || ((cache_state == `YSYX_040213_MISS) & i_cache_wr_rdy) || (cache_state == `YSYX_040213_FENCEI_IDLE && fencei_index[8:7] == 2'b10)); 
assign dataram_cen4 = !(((index[8:7] == 2'b11) && i_cache_req) || !dataram_wen4 || ((cache_state == `YSYX_040213_MISS) & i_cache_wr_rdy) || (cache_state == `YSYX_040213_FENCEI_IDLE && fencei_index[8:7] == 2'b11)); 
/*
assign dataram_wen1 = !(((req_index[8:7] == 2'b00 && (req_wr || (i_cache_ret_valid && i_cache_ret_last) )) || (write_buffer_index[8:7] == 2'b00 && write_buffer_req)) && dataram_wen);
assign dataram_wen2 = !(((req_index[8:7] == 2'b01 && (req_wr || (i_cache_ret_valid && i_cache_ret_last) )) || (write_buffer_index[8:7] == 2'b01 && write_buffer_req)) && dataram_wen);
assign dataram_wen3 = !(((req_index[8:7] == 2'b10 && (req_wr || (i_cache_ret_valid && i_cache_ret_last) )) || (write_buffer_index[8:7] == 2'b10 && write_buffer_req)) && dataram_wen);
assign dataram_wen4 = !(((req_index[8:7] == 2'b11 && (req_wr || (i_cache_ret_valid && i_cache_ret_last) )) || (write_buffer_index[8:7] == 2'b11 && write_buffer_req)) && dataram_wen);
*/

assign dataram_wen1 = !(((req_index[8:7] == 2'b00 && ((i_cache_ret_valid && i_cache_ret_last && !uncache) )) || (write_buffer_index[8:7] == 2'b00 && write_buffer_req)) && dataram_wen);
assign dataram_wen2 = !(((req_index[8:7] == 2'b01 && ((i_cache_ret_valid && i_cache_ret_last && !uncache) )) || (write_buffer_index[8:7] == 2'b01 && write_buffer_req)) && dataram_wen);
assign dataram_wen3 = !(((req_index[8:7] == 2'b10 && ((i_cache_ret_valid && i_cache_ret_last && !uncache) )) || (write_buffer_index[8:7] == 2'b10 && write_buffer_req)) && dataram_wen);
assign dataram_wen4 = !(((req_index[8:7] == 2'b11 && ((i_cache_ret_valid && i_cache_ret_last && !uncache) )) || (write_buffer_index[8:7] == 2'b11 && write_buffer_req)) && dataram_wen);


/*
assign dataram_wen1 = !((req_index[8:7] == 2'b00) && dataram_wen);
assign dataram_wen2 = !((req_index[8:7] == 2'b01) && dataram_wen);
assign dataram_wen3 = !((req_index[8:7] == 2'b10) && dataram_wen);
assign dataram_wen4 = !((req_index[8:7] == 2'b11) && dataram_wen);


wire diff1 = dataram_wen1_t != dataram_wen1 && !dataram_cen1;
wire diff2 = dataram_wen2_t != dataram_wen2 && !dataram_cen2;
wire diff3 = dataram_wen3_t != dataram_wen3 && !dataram_cen3;
wire diff4 = dataram_wen4_t != dataram_wen4 && !dataram_cen4;
*/
assign dataram_bwen1 = write_buffer_req ? ~o_write_buffer_bwen : !req_index[0] ?  128'hffffffffffffffff0000000000000000 : 
				                                                  128'h0000000000000000ffffffffffffffff; 
assign dataram_bwen2 = write_buffer_req ? ~o_write_buffer_bwen : !req_index[0] ?  128'hffffffffffffffff0000000000000000 : 
				                                                  128'h0000000000000000ffffffffffffffff; 
assign dataram_bwen3 = write_buffer_req ? ~o_write_buffer_bwen : !req_index[0] ?  128'hffffffffffffffff0000000000000000 : 
				                                                  128'h0000000000000000ffffffffffffffff; 
assign dataram_bwen4 = write_buffer_req ? ~o_write_buffer_bwen : !req_index[0] ?  128'hffffffffffffffff0000000000000000 : 
				                                                  128'h0000000000000000ffffffffffffffff; 
wire [3:0] dataram_addr1_sel;
assign dataram_addr1_sel[0] = dataram_wen1;
assign dataram_addr1_sel[1] = ~dataram_wen1 & ~write_buffer_req | ((cache_state == `YSYX_040213_MISS) & i_cache_wr_rdy & req_index[8:7] == 2'b00);
assign dataram_addr1_sel[2] = ~dataram_wen1 & write_buffer_req & write_buffer_index[8:7] == 2'b00;
assign dataram_addr1_sel[3] = (cache_state == `YSYX_040213_FENCEI_IDLE && fencei_index[8:7] == 2'b00);

wire [3:0] dataram_addr2_sel;
assign dataram_addr2_sel[0] = dataram_wen2;
assign dataram_addr2_sel[1] = ~dataram_wen2 & ~write_buffer_req | ((cache_state == `YSYX_040213_MISS) & i_cache_wr_rdy & req_index[8:7] == 2'b01);
assign dataram_addr2_sel[2] = ~dataram_wen2 & write_buffer_req & write_buffer_index[8:7] == 2'b01;
assign dataram_addr2_sel[3] = (cache_state == `YSYX_040213_FENCEI_IDLE && fencei_index[8:7] == 2'b01);

wire [3:0] dataram_addr3_sel;
assign dataram_addr3_sel[0] = dataram_wen3;
assign dataram_addr3_sel[1] = ~dataram_wen3 & ~write_buffer_req | ((cache_state == `YSYX_040213_MISS) & i_cache_wr_rdy & req_index[8:7] == 2'b10);
assign dataram_addr3_sel[2] = ~dataram_wen3 & write_buffer_req & write_buffer_index[8:7] == 2'b10;
assign dataram_addr3_sel[3] = (cache_state == `YSYX_040213_FENCEI_IDLE && fencei_index[8:7] == 2'b10);

wire [3:0] dataram_addr4_sel;
assign dataram_addr4_sel[0] = dataram_wen4;
assign dataram_addr4_sel[1] = ~dataram_wen4 & ~write_buffer_req | ((cache_state == `YSYX_040213_MISS) & i_cache_wr_rdy & req_index[8:7] == 2'b11);
assign dataram_addr4_sel[2] = ~dataram_wen4 & write_buffer_req & write_buffer_index[8:7] == 2'b11;
assign dataram_addr4_sel[3] = (cache_state == `YSYX_040213_FENCEI_IDLE && fencei_index[8:7] == 2'b11);

ysyx_040213_MuxKey #(5, 4, 6) i14 (dataram_addr1, dataram_addr1_sel, {
	4'b0001, index[6:1],	
	4'b0010, req_index[6:1],
	4'b0011, req_index[6:1],
	4'b0100, write_buffer_index[6:1],
	4'b1001, fencei_index[6:1]
});
ysyx_040213_MuxKey #(5, 4, 6) i16 (dataram_addr2, dataram_addr2_sel, {
	4'b0001, index[6:1],	
	4'b0010, req_index[6:1],
	4'b0011, req_index[6:1],
	4'b0100, write_buffer_index[6:1],
	4'b1001, fencei_index[6:1]

});
ysyx_040213_MuxKey #(5, 4, 6) i17 (dataram_addr3, dataram_addr3_sel, {
	4'b0001, index[6:1],	
	4'b0010, req_index[6:1],
	4'b0011, req_index[6:1],
	4'b0100, write_buffer_index[6:1],
	4'b1001, fencei_index[6:1]

});
ysyx_040213_MuxKey #(5, 4, 6) i18 (dataram_addr4, dataram_addr4_sel, {
	4'b0001, index[6:1],	
	4'b0010, req_index[6:1],
	4'b0011, req_index[6:1],
	4'b0100, write_buffer_index[6:1],
	4'b1001, fencei_index[6:1]

});
/*
assign dataram_addr1 = (index[6:1] & {6{dataram_wen1}}) | (req_index[6:1] & {6{~dataram_wen1 & ~write_buffer_req}}) | (write_buffer_index[6:1] & {6{~dataram_wen1 & write_buffer_req}}); 
assign dataram_addr2 = (index[6:1] & {6{dataram_wen2}}) | (req_index[6:1] & {6{~dataram_wen2 & ~write_buffer_req}}) | (write_buffer_index[6:1] & {6{~dataram_wen2 & write_buffer_req}}); 
assign dataram_addr3 = (index[6:1] & {6{dataram_wen3}}) | (req_index[6:1] & {6{~dataram_wen3 & ~write_buffer_req}}) | (write_buffer_index[6:1] & {6{~dataram_wen3 & write_buffer_req}}); 
assign dataram_addr4 = (index[6:1] & {6{dataram_wen4}}) | (req_index[6:1] & {6{~dataram_wen4 & ~write_buffer_req}}) | (write_buffer_index[6:1] & {6{~dataram_wen4 & write_buffer_req}}); 

wire diff1 = dataram_addr1_test != dataram_addr1;
wire diff2 = dataram_addr2_test != dataram_addr2;
wire diff3 = dataram_addr3_test != dataram_addr3;
wire diff4 = dataram_addr4_test != dataram_addr4;
*/
/*
assign dataram_addr1 = dataram_addr;
assign dataram_addr2 = dataram_addr;
assign dataram_addr3 = dataram_addr;
assign dataram_addr4 = dataram_addr;
*/

assign dataram_wdata1 = {axidata_to_dataram} & {128{~write_buffer_req}} 
			| {write_buffer_wdata} & {128{write_buffer_req}};
assign dataram_wdata2 = {axidata_to_dataram} & {128{~write_buffer_req}} 
		 	| {write_buffer_wdata} & {128{write_buffer_req}};
assign dataram_wdata3 = {axidata_to_dataram} & {128{~write_buffer_req}} 
			| {write_buffer_wdata} & {128{write_buffer_req}};
assign dataram_wdata4 = {axidata_to_dataram} & {128{~write_buffer_req}} 
			| {write_buffer_wdata} & {128{write_buffer_req}};

assign io_sram0_addr = dataram_addr1;
assign io_sram0_cen = dataram_cen1;
assign io_sram0_wen = dataram_wen1;
assign io_sram0_wmask = dataram_bwen1;
assign io_sram0_wdata = dataram_wdata1;
assign dataram_rdata1 =  io_sram0_rdata;

assign io_sram1_addr = dataram_addr2;
assign io_sram1_cen = dataram_cen2;
assign io_sram1_wen = dataram_wen2;
assign io_sram1_wmask = dataram_bwen2;
assign io_sram1_wdata = dataram_wdata2;
assign dataram_rdata2 =  io_sram1_rdata;

assign io_sram2_addr = dataram_addr3;
assign io_sram2_cen = dataram_cen3;
assign io_sram2_wen = dataram_wen3;
assign io_sram2_wmask = dataram_bwen3;
assign io_sram2_wdata = dataram_wdata3;
assign dataram_rdata3 =  io_sram2_rdata;

assign io_sram3_addr = dataram_addr4;
assign io_sram3_cen = dataram_cen4;
assign io_sram3_wen = dataram_wen4;
assign io_sram3_wmask = dataram_bwen4;
assign io_sram3_wdata = dataram_wdata4;
assign dataram_rdata4 =  io_sram3_rdata;

/*
S011HD1P_X32Y2D128_BW dataram1(
	.Q(dataram_rdata1),
	.CLK(clk),
	.CEN(dataram_cen1),
	.WEN(dataram_wen1),
	.BWEN(dataram_bwen1),
	.A(dataram_addr1),
	.D(dataram_wdata1)
);
S011HD1P_X32Y2D128_BW dataram2(
	.Q(dataram_rdata2),
	.CLK(clk),
	.CEN(dataram_cen2),
	.WEN(dataram_wen2),
	.BWEN(dataram_bwen2),
	.A(dataram_addr2),
	.D(dataram_wdata2)
);
S011HD1P_X32Y2D128_BW dataram3(
	.Q(dataram_rdata3),
	.CLK(clk),
	.CEN(dataram_cen3),
	.WEN(dataram_wen3),
	.BWEN(dataram_bwen3),
	.A(dataram_addr3),
	.D(dataram_wdata3)
);
S011HD1P_X32Y2D128_BW dataram4(
	.Q(dataram_rdata4),
	.CLK(clk),
	.CEN(dataram_cen4),
	.WEN(dataram_wen4),
	.BWEN(dataram_bwen4),
	.A(dataram_addr4),
	.D(dataram_wdata4)
);
*/
endmodule
//syn ram
/*
wire [63:0] cache_data;
reg [63:0] instt;

assign cache_data[63:0] = instt[63:0];

always @(posedge clk)begin
	if(rst)begin
	  instt <= 0;
	end
	if(i_cache_req)begin
	  instt <= o_ram_inst;
  	end
end
import "DPI-C" function void mpmem_read(input longint raddr, output longint rdata);
reg [63:0] o_ram_inst;

always @(*) begin
	if(rst)begin
	  o_ram_inst =  0;
	end
	else begin
    	  mpmem_read(i_cache_addr, o_ram_inst);
  end
end
*/
//----------------------------------//


module ysyx_040213_contrl (
	input [6:0] opcode,
	input [2:0] funct3,
	input [6:0] funct7,
	input divw,
	input divuw,
	input remw,
	input remuw,

	input jumpb,
	input csrrc,
	input csrrci,
	input csrrw,
	input csrrwi,
	input csrrs,
	input csrrsi,
	input ecall,
	input mret,
	input fencei,
	output w_en,
	output pc_en,
	output op_jalr,
	output jumpb_en,
	output lm_en,
	output sm_en,
	output sub_en,
	output word_en,
	output rv64m_en,
	output arith_en,
	output lui_en,
	output srai,
	output [5:0] csr_wen,
	output [5:0] nextpc_en,
	output [3:0] RegisterWritedata_en,
	output [3:0] AluData1_en,
	output [6:0] AluData2_en
);
	
	wire jump_en;
	wire shiftimm_en;
	wire imm_en;
	
	wire sraw  = sub_en && ~arith_en &&  funct3[2] && ~funct3[1] &&  funct3[0];
//	wire sraiw = arith_en &&  funct3[2] && ~funct3[1] &&  funct3[0];
	wire srliw = word_en &&  funct3[2] && ~funct3[1] &&  funct3[0] && ~arith_en && ~sub_en;
	assign srai = (opcode == 7'b0010011) && (funct3 == 3'b101) && (funct7[6:1] == 6'b010000);	


	assign w_en = (csrrwi || csrrsi || csrrci || csrrc || csrrs || csrrw || opcode == 7'b0110111 || opcode == 7'b0011011 || opcode == 7'b0111011 || opcode == 7'b0110011 || opcode == 7'b0000011 || opcode == 7'b0010011 || opcode == 7'b0010111 || opcode == 7'b1100111 || opcode == 7'b1101111 )?1'b1:1'b0;
	assign imm_en = (opcode == 7'b0110111 || opcode == 7'b0000011 || opcode == 7'b0011011 || opcode == 7'b0010111 || opcode == 7'b0010011 || opcode == 7'b0100011)?1'b1:1'b0;
	assign pc_en = ~opcode[6] && ~opcode[5] && opcode[4] && ~opcode[3] && opcode[2] && opcode[1] && opcode[0] || jump_en || op_jalr; 
		//(opcode == 7'b0010111 || opcode == 7'b1101111 || opcode == 7'b1100111)?1'b1:1'b0;//auipc jal jalr
	assign jump_en = opcode[6] && opcode[5] && ~opcode[4] && opcode[3] && opcode[2] && opcode[1] && opcode[0]; 
		//(opcode == 7'b1101111 )?1'b1:1'b0; //jal
	assign op_jalr =  opcode[6] && opcode[5] && ~opcode[4] && ~opcode[3] && opcode[2] && opcode[1] && opcode[0]; 
		//(opcode == 7'b1100111)?1'b1:1'b0; //jalr
	assign sm_en = (opcode == 7'b0100011)?1'b1:1'b0;
	assign lm_en = (opcode == 7'b0000011)?1'b1:1'b0;
	assign shiftimm_en = (opcode == 7'b0010011 || opcode == 7'b0011011)?((funct3 == 3'b101 || funct3 == 3'b001)?1'b1:1'b0):1'b0;
//	assign shiftreg_en = (opcode == 7'b0111011)?1'b1:1'b0;
	assign jumpb_en = (opcode == 7'b1100011)?1'b1:1'b0;
	assign sub_en = ((opcode == 7'b0111011 || opcode == 7'b0110011) && funct7 == 7'b0100000)?1'b1:1'b0;
	assign word_en = (opcode == 7'b0111011 || opcode == 7'b0011011)?1'b1:1'b0;
	assign rv64m_en = ((opcode == 7'b0110011 || opcode == 7'b0111011) && funct7 == 7'b0000001)?1'b1:1'b0;
	assign arith_en = (opcode == 7'b0011011 && funct7 == 7'b0100000)?1'b1:1'b0;
	assign lui_en = (opcode == 7'b0110111)?1'b1:1'b0;


	assign nextpc_en[5] = fencei;
	assign nextpc_en[4] = mret;
	assign nextpc_en[3] = ecall;
	assign nextpc_en[2] = jump_en;
	assign nextpc_en[1] = jumpb;
	assign nextpc_en[0] = op_jalr;

	assign RegisterWritedata_en[3] = csrrwi || csrrsi || csrrci || csrrc || csrrs || csrrw; //register write t
	assign RegisterWritedata_en[2] = w_en && lm_en;
	assign RegisterWritedata_en[1] = op_jalr || jump_en;
	assign RegisterWritedata_en[0] = ~(w_en && lm_en) & ~(op_jalr || jump_en);

	assign AluData1_en[3] = pc_en;
	assign AluData1_en[2] = sraw || divw || remw;
	assign AluData1_en[1] = srliw || divuw || remuw;
	assign AluData1_en[0] = ~pc_en && ~sraw && ~srliw && ~(divw || remw || divuw || remuw);

	assign AluData2_en[6] = remuw || divuw;
	assign AluData2_en[5] = divw || remw;
	assign AluData2_en[4] = jump_en || op_jalr;
	assign AluData2_en[3] = imm_en && shiftimm_en;
	assign AluData2_en[2] = imm_en && ~shiftimm_en;
	assign AluData2_en[1] = ~imm_en && shiftimm_en;
	assign AluData2_en[0] = ~imm_en && ~shiftimm_en && ~(divw || remw || divuw || remuw);
	
	assign csr_wen[0] = csrrw;
	assign csr_wen[1] = csrrs;
	assign csr_wen[2] = csrrc;
	assign csr_wen[3] = csrrwi;
	assign csr_wen[4] = csrrsi;
	assign csr_wen[5] = csrrci;
endmodule
module ysyx_040213_div(
	input clk,
	input rst,
	input div_valid,
	input flush,
//	input divw,
	input [1:0] div_signed,
	input [63:0] dividend,
	input [63:0] divisor,
	output div_ready,
	output reg out_valid,
	output reg [63:0] quotient,
	output reg [63:0] remainder

);
`define YSYX_040213_XLEN 64
`define YSYX_040213_XXLEN 128
`define YSYX_040213_DIV_IDLE    2'b00
`define YSYX_040213_DIV_DIVING  2'b01
`define YSYX_040213_DIV_END     2'b10

reg [127:0] div_dend;
reg [63:0]  div_sor;
reg [63:0]  div_quo;
wire [64:0]  div_rem;
reg [64:0] rem;
reg [5:0] div_times;
reg [1:0] div_state;
wire quo_neg;
wire rem_neg;
wire [63:0] dividend_abs;
wire [63:0] divisor_abs;


//wire signed [63:0] s_dend = dividend;
//wire signed [63:0] s_sor = divisor;
//wire [63:0] diff_quo = div_signed == 2'b11 ? s_dend / s_sor : dividend / divisor;
//wire [63:0] diff_rem = div_signed == 2'b11 ? s_dend % s_sor : dividend % divisor;

assign div_ready = div_state == `YSYX_040213_DIV_IDLE;
assign div_rem = (div_dend[127:63] - {{1'b0},{div_sor}}); 
assign quo_neg = &div_signed & ~(dividend[63] & divisor[63]) & (dividend[63] || divisor[63]);
assign rem_neg = &div_signed & dividend[63];
assign dividend_abs = ~dividend + `YSYX_040213_XLEN'b1;
assign divisor_abs  = ~divisor  + `YSYX_040213_XLEN'b1;


//wire [64:0] dend = div_dend[127:63];
//wire [64:0] sor  = {{1'b0},{div_sor}};

always @(posedge clk)begin
  if(rst || flush)begin
    div_dend <= 128'b0;
    div_sor <= 64'b0;
    div_quo <= 64'b0;
    div_times <= 6'b111111;
    div_state <= `YSYX_040213_DIV_IDLE;
    rem <= 65'b0;
  end else begin
    case(div_state)
      `YSYX_040213_DIV_IDLE: begin
        if(div_valid)begin
	  div_state <= `YSYX_040213_DIV_DIVING;
	  out_valid <= 1'b0;
//	  div_dend <= {{64'b0},{dividend}};
//	  div_sor <= divisor;
	  div_dend <= &div_signed & dividend[`YSYX_040213_XLEN - 1] ? {`YSYX_040213_XLEN'b0, dividend_abs} : {`YSYX_040213_XLEN'b0, dividend};
          div_sor  <= &div_signed & divisor[`YSYX_040213_XLEN - 1]  ? divisor_abs : divisor;
	  div_times <= 6'b111111;
	end else begin
	  div_state <= `YSYX_040213_DIV_IDLE;
	  out_valid <= 1'b0;
	end
      end
      `YSYX_040213_DIV_DIVING: begin
	if(div_times != 0)begin
	  div_times <= div_times - 1;
	  div_quo[div_times] <= div_rem[64] ? 1'b0 : 1'b1;
	  div_dend <=  div_rem[64] ? {div_dend[126:0],{1'b0}} : {{div_rem[63:0]},{div_dend[62:0]},{1'b0}}; 
        end else begin
	  div_quo[div_times] <= div_rem[64] ? 1'b0 : 1'b1;
	  rem <= div_rem[64] ? div_rem + {{1'b0},{div_sor}} : div_rem;
	  div_state <= `YSYX_040213_DIV_END;
	end
      end
      `YSYX_040213_DIV_END: begin
	remainder <= (rem[64] & ~rem_neg) || (~rem[64] & rem_neg) ? ~rem[63:0] + 1 : rem[63:0];
	quotient  <= (div_quo[63] & ~quo_neg) || (~div_quo[63] & quo_neg) ? ~div_quo[63:0] + 1 : div_quo;
	out_valid <= 1'b1;
	div_state <= `YSYX_040213_DIV_IDLE;
	div_dend <= 128'b0;
	div_sor <= 64'b0;
	div_quo <= 64'b0;
	rem <= 65'b0;
      end
      default: div_state <= `YSYX_040213_DIV_IDLE;
    endcase
  end
end

endmodule
module ysyx_040213_EXEReg(
	input clk,
	input rst,
	input flush,

	input ID_to_EXE_valid,
	input EXE_ready_go,
	input MEM_allow_in,

	output EXE_allow_in,
	output EXE_to_MEM_valid,


	input [3:0] i_exe_AluData1_en,
	input [6:0] i_exe_AluData2_en,
	input [63:0] i_exe_src1,
	input [63:0] i_exe_src2,
	input [63:0] i_exe_ext_imm,
	input [63:0] i_exe_pc_link,
	input [63:0] i_exe_shamt,
	input [16:0] i_exe_alu_op,
	input [2:0] i_exe_funct3,
	input [4:0] i_exe_rd,
	input i_exe_w_en,
	input i_exe_word_en,
	input i_exe_sm_en,
	input i_exe_lm_en,
	input [3:0] i_exe_RegWrite_en,
	input [63:0] i_exe_csr_src1,

	output [3:0] o_exe_AluData1_en,
	output [6:0] o_exe_AluData2_en,
	output [63:0] o_exe_src1,
	output [63:0] o_exe_src2,
	output [63:0] o_exe_ext_imm,
	output [63:0] o_exe_pc_link,
	output [63:0] o_exe_shamt,
	output [16:0] o_exe_alu_op,
	output [2:0] o_exe_funct3,
	output [4:0] o_exe_rd,
	output o_exe_w_en,
	output o_exe_word_en,
	output o_exe_lm_en,
	output o_exe_sm_en,
	output [3:0] o_exe_RegWrite_en,
	output [63:0] o_exe_csr_src1,
	output o_exe_reg_w_en
);
	reg EXE_valid;
	reg o_exe_lm_en_i;
	reg o_exe_sm_en_i;
	reg o_exe_w_en_i;
	reg [16:0] o_exe_alu_op_i;

	assign EXE_allow_in = !EXE_valid || EXE_ready_go && MEM_allow_in; 
	assign EXE_to_MEM_valid = EXE_valid && EXE_ready_go;

	always @(posedge clk)begin
	  if(rst)begin
	    EXE_valid <= 1'b0;
	  end
	  else if(EXE_allow_in)begin
	    EXE_valid <= ID_to_EXE_valid;
	  end
	end

	wire reg_w_en;
	assign o_exe_reg_w_en = reg_w_en;
	assign reg_w_en = ID_to_EXE_valid && EXE_allow_in;



	assign o_exe_lm_en = EXE_valid && o_exe_lm_en_i;

	assign o_exe_sm_en = EXE_valid && o_exe_sm_en_i;

	assign o_exe_w_en = EXE_valid && o_exe_w_en_i;



	assign o_exe_alu_op = {17{EXE_valid}} & o_exe_alu_op_i;	

	ysyx_040213_Reg #(4,  4'b0001)  i0  (clk, rst || flush, i_exe_AluData1_en, o_exe_AluData1_en, reg_w_en); 
	ysyx_040213_Reg #(7,  7'b00100)  i1  (clk, rst || flush, i_exe_AluData2_en, o_exe_AluData2_en, reg_w_en);
	ysyx_040213_Reg #(64, 64'b0) i2  (clk, rst || flush, i_exe_src1, o_exe_src1, reg_w_en);
	ysyx_040213_Reg #(64, 64'b0) i3  (clk, rst || flush, i_exe_src2, o_exe_src2, reg_w_en);
	ysyx_040213_Reg #(64, 64'b0) i4  (clk, rst || flush, i_exe_ext_imm, o_exe_ext_imm, reg_w_en);
	ysyx_040213_Reg #(64, 64'b0) i5  (clk, rst || flush, i_exe_pc_link, o_exe_pc_link, reg_w_en);
	ysyx_040213_Reg #(64, 64'b0) i6  (clk, rst || flush, i_exe_shamt, o_exe_shamt, reg_w_en);
	ysyx_040213_Reg #(17, 17'b1) i7  (clk, rst || flush, i_exe_alu_op, o_exe_alu_op_i, reg_w_en);
	ysyx_040213_Reg #(1,  1'b0)  i8  (clk, rst || flush, i_exe_word_en, o_exe_word_en, reg_w_en);
	ysyx_040213_Reg #(3,  3'b0)  i9  (clk, rst || flush, i_exe_funct3, o_exe_funct3, reg_w_en);
	ysyx_040213_Reg #(5,  5'b0)  i10 (clk, rst || flush, i_exe_rd, o_exe_rd, reg_w_en);
	ysyx_040213_Reg #(1,  1'b0)  i11 (clk, (rst || flush), i_exe_w_en, o_exe_w_en_i, reg_w_en);
	ysyx_040213_Reg #(1,  1'b0)  i12 (clk, (rst || flush), i_exe_lm_en, o_exe_lm_en_i, reg_w_en);
	ysyx_040213_Reg #(1,  1'b0)  i13 (clk, (rst || flush), i_exe_sm_en, o_exe_sm_en_i, reg_w_en);
	ysyx_040213_Reg #(4,  4'b0)  i14 (clk, (rst || flush), i_exe_RegWrite_en, o_exe_RegWrite_en, reg_w_en);
	ysyx_040213_Reg #(64, 64'b0) i19 (clk, (rst || flush), i_exe_csr_src1, o_exe_csr_src1, reg_w_en);
	
endmodule
module ysyx_040213_IDReg(
	input clk,
	input rst,
	input flush,
	
	//special inst reg
	input IF_ready_go,
	output reg if_inst_valid,

	//end
	input IF_to_ID_valid,
	input o_bub_ID_ready_go,
	input EXE_allow_in,
	
	output ID_allow_in,
	output ID_to_EXE_valid,
//	output reg ID_valid,

//	input [63:0] dnpc,
	input [63:0] pc,
//	input pc_ready_go,
	input [63:0] i_id_inst,
	input [63:0] i_id_pc_link,
//	output reg [63:0] o_if_dnpc,
	output reg [63:0] o_if_pc,
	output reg [63:0] o_id_inst_sram,
	output reg [63:0] o_id_pc_link//,
 	//DIFFTEST 
//	input i_id_diff_clint_trap,
//	output reg o_id_diff_clint_trap
);
	reg ID_valid;
	wire ID_ready_go = o_bub_ID_ready_go;
	reg [63:0] if_inst;// = 64'h13;
	
	assign ID_allow_in = !ID_valid || ID_ready_go && EXE_allow_in;
	assign ID_to_EXE_valid = ID_valid && ID_ready_go;

	always @(posedge clk)begin
	  if(rst)begin
	    ID_valid <= 1'b0;
	  end
	  else if(ID_allow_in)begin
	    ID_valid <= IF_to_ID_valid;
	  end
	  
	  if(rst)begin
	    if_inst_valid <= 1'b0;
	  end
	  else if (IF_ready_go && !ID_allow_in)begin //instram data valid
	    if_inst_valid <= IF_to_ID_valid;
	  end else begin
	    if_inst_valid <= 1'b0;
	  end
//	  if(if_inst_valid)begin
//	    o_id_inst_dram <= if_inst;
//	  end else begin
//	    o_id_inst_dram <= o_id_inst_sram;
//	  end
	end

	wire w_en;
	assign w_en = IF_to_ID_valid && ID_allow_in;

	//AXI
		
	ysyx_040213_Reg #(64, 64'h13) i0 (clk, rst || (flush && w_en), i_id_inst, if_inst, IF_to_ID_valid && ~if_inst_valid);
	
	ysyx_040213_Reg #(64, 64'b0 ) i1 (clk, rst || (flush && w_en), i_id_pc_link, o_id_pc_link, w_en);
	
	ysyx_040213_Reg #(64, 64'h0 ) i5  (clk, rst , pc, o_if_pc, w_en);

//	ysyx_040213_Reg #(1, 1'b0 ) i6  (clk, rst , i_id_diff_clint_trap, o_id_diff_clint_trap, w_en);

	wire [63:0] o_id_inst_ram = if_inst_valid ? if_inst : o_id_inst_sram;

	//ysyx_040213_Reg #(64, 64'h0 ) i3  (clk, rst , dnpc, o_if_dnpc, w_en);

	// do not consider axi
//	reg[63:0] test_inst;
//	ysyx_040213_Reg #(64, 64'h13 ) i2 (clk, rst || (flush && w_en), i_id_inst , test_inst, w_en);
	ysyx_040213_Reg #(64, 64'h13 ) i4 (clk, rst || (flush && w_en), {64{~if_inst_valid}} & i_id_inst |{64{if_inst_valid}} & o_id_inst_ram, o_id_inst_sram, w_en);  //the real output
//	wire diff;
//	assign diff = ~(test_inst == o_id_inst_sram);	
endmodule
module ysyx_040213_IDU(
	input [31:0] inst,
	output [4:0] rs1,
	output [4:0] rs2,
	output [4:0] rd,
	output [2:0] funct3,
	output [6:0] funct7,
	output [6:0] opcode,
	output [63:0] shamt,
	output [11:0] csr_rs1,
	output [11:0] csr_waddr,
	output mret,
	output ecall,
	output csrrw,
	output csrrwi,
	output csrrs,
	output csrrsi,
	output csrrc,
	output csrrci,
	output rem,
	output remu,
	output remuw,
	output remw,
	output div,
	output divu,
	output divuw,
	output divw,
	output mul,
	output mulw,
	output fencei,
	output reg [63:0] ext_imm
);
wire [11:0] imm;
wire [11:0] immS;
wire [19:0] immU;
wire [12:0] immB;
wire [20:0] jumpoffset;

	assign opcode = inst[6:0];
	assign rd = inst[11:7];
	assign funct3 = inst[14:12];
	assign funct7 = inst[31:25];
	assign rs1 = inst[19:15];
	assign rs2 = inst[24:20];
	assign imm = inst[31:20];
	assign immU = inst[31:12];
	assign immS = {inst[31:25],inst[11:7]};
	assign jumpoffset = {inst[31],inst[19:12],inst[20], inst[30:21], {1'b0}};
	assign shamt = {{58'b0},inst[25:20]};
	assign immB =  {inst[31],inst[7],inst[30:25], inst[11:8], {1'b0}};
//	import "DPI-C" function void NPCTRAP ();
//	import "DPI-C" function void ftrace ();

	assign ecall = (opcode == 7'b1110011) && (imm == 12'b0) && (funct3 == 3'b0);
	assign mret  = (inst == 32'b00110000001000000000000001110011);
	
	assign csrrw  = (opcode == 7'b1110011) && (funct3 == 3'b001);
	assign csrrwi = (opcode == 7'b1110011) && (funct3 == 3'b101);
	assign csrrc  = (opcode == 7'b1110011) && (funct3 == 3'b011);
	assign csrrci = (opcode == 7'b1110011) && (funct3 == 3'b111);
	assign csrrs  = (opcode == 7'b1110011) && (funct3 == 3'b010);
	assign csrrsi = (opcode == 7'b1110011) && (funct3 == 3'b110);
	
	assign rem   = (funct7 == 7'b0000001) && (opcode == 7'b0110011) && (funct3 == 3'b110);
	assign remu  = (funct7 == 7'b0000001) && (opcode == 7'b0110011) && (funct3 == 3'b111);
	assign remuw = (funct7 == 7'b0000001) && (opcode == 7'b0111011) && (funct3 == 3'b111);
	assign remw  = (funct7 == 7'b0000001) && (opcode == 7'b0111011) && (funct3 == 3'b110);

	assign div   = (funct7 == 7'b0000001) && (opcode == 7'b0110011) && (funct3 == 3'b100); 
	assign divu  = (funct7 == 7'b0000001) && (opcode == 7'b0110011) && (funct3 == 3'b101); 
	assign divw  = (funct7 == 7'b0000001) && (opcode == 7'b0111011) && (funct3 == 3'b100); 
	assign divuw = (funct7 == 7'b0000001) && (opcode == 7'b0111011) && (funct3 == 3'b101); 
	
	assign mul   = (funct7 == 7'b0000001) && (opcode == 7'b0110011) && (funct3 == 3'b000); 
	assign mulw  = (funct7 == 7'b0000001) && (opcode == 7'b0111011) && (funct3 == 3'b000); 

	assign csr_rs1 =  csrrw || csrrs || csrrw || csrrwi || csrrsi || csrrci ? imm : 12'b0;
	assign csr_waddr = ecall ? 12'h305 : csrrw || csrrs || csrrw || csrrwi || csrrsi || csrrci ? imm : 12'b0;
	assign fencei  = (inst == 32'b00000000000000000001000000001111);
always @(*)begin
	ext_imm = 64'b0;
	case (opcode)
		7'b0010011 ://I-type
		begin
			ext_imm = {{52{imm[11]}},imm};
		end
		7'b0011011 ://I-type word addiw
		begin
			ext_imm = {{52{imm[11]}},imm};
		end
		7'b0010111 : //U-type
		begin
			ext_imm = {{32{immU[19]}},immU,{12'b0}};
		end
		7'b0110111 : //U-type lui
		begin
			ext_imm = {{32{immU[19]}},immU,{12'b0}};
		end
		7'b1101111 : //jal
		begin
			ext_imm =  {{43{jumpoffset[20]}},jumpoffset}; 
			//ftrace();
		end
		7'b1100111 : //jalr ret
		begin
			ext_imm = {{52{imm[11]}},imm};
//			ftrace();
		end
		7'b0100011 : //S-type
		begin
			ext_imm = {{52{immS[11]}},immS};
		end
		7'b0000011 : //lbu
		begin
			ext_imm = {{52{imm[11]}},imm};
		end
		7'b1100011 : //B-type
		begin
			ext_imm = {{51{immB[12]}},immB};
		end
		7'b0110011 : //R-type
		begin

		end
		7'b1110011 : 
		begin  
		  if(imm == 12'b1)begin //ebreak
//		    NPCTRAP;
		  end else if(imm == 12'b0)begin//ecall
//		    NPCTRAP;
		  end else begin
		  end
		end
		  default : ext_imm = 64'b0;
	endcase
end

endmodule


module ysyx_040213_inDataSel(
	input [3:0] AluData1_en,
	input [6:0] AluData2_en,
	input [63:0] src1,
	input [63:0] src2,
	input [63:0] ext_imm,
	input [63:0] pc,
	input [63:0] shamt,
	output [63:0 ]data1,
	output [63:0] data2
);
	wire [63:0] pc_sub_4;
	assign pc_sub_4 = pc - 4;
	ysyx_040213_MuxKey #(4, 4, 64) i0 (data1, AluData1_en, {
		4'b1000, pc_sub_4,
		4'b0100, {{32{src1[31]}},{src1[31:0]}}, 
		4'b0010, {{32{1'b0}},{src1[31:0]}}, 
		4'b0001, src1
		});

	ysyx_040213_MuxKey #(7, 7, 64) i1 (data2, AluData2_en, {
		7'b1000000, {{32{1'b0}},{src2[31:0]}},
		7'b0100000, {{32{src2[31]}},{src2[31:0]}},
		7'b0010000, 64'b0100,
		7'b0001000, shamt,
		7'b0000100, ext_imm,
		7'b0000010, shamt, 
		7'b0000001, src2
		});

endmodule
module ysyx_040213_instfetch_port (
	  input rst,
	  input [63:0] pc, 
	  input IF_allow_in, 
	  input fencei,
	  input fencei_ok,

	  output o_if_req,
	  output [63:0] o_if_addr

);
	assign o_if_req   = rst ? 1'b0  : IF_allow_in && !(fencei && !fencei_ok);
	assign o_if_addr  = rst ? 64'h0000000030000000-4 : pc;
endmodule
module ysyx_040213_memory_port (
	  input rst,
	  input [63:0] maddr,
	  input lm_en,
	  input sm_en,
	  input  [2:0] exe_funct3,
	  input  [2:0] mem_funct3,
	  input  [63:0] mwdata,
	  output reg [63:0] o_data_mrdata,
	  output clint_wen,
	  output clint_ren,
	  output clint_addr,
	  output [63:0] clint_wdata,
	  output clint_hit,
	  output reg o_data_wr,
	  output reg o_data_req,
	  output reg [2:0] o_data_size,
	  output reg [63:0] o_data_addr,
	  output reg [7:0] o_data_wstrb,
	  output reg [63:0] o_data_wdata,
	  input [63:0] i_data_rdata
);
`define YSYX_040213_CLINT_START 64'h02000000
`define YSYX_040213_CLINT_MTIMECMP (`YSYX_040213_CLINT_START + 64'h4000)
`define YSYX_040213_CLINT_MTIME    (`YSYX_040213_CLINT_START + 64'hbff8)
	assign clint_hit = (maddr == `YSYX_040213_CLINT_MTIMECMP) || (maddr == `YSYX_040213_CLINT_MTIME);
	assign clint_wen = sm_en && clint_hit;
	assign clint_ren = lm_en && clint_hit;
	assign clint_addr = (maddr == `YSYX_040213_CLINT_MTIMECMP) ? 1'b0 : 1'b1;
	assign clint_wdata = mwdata;
	//port//
	wire [2:0] data_size;
	wire [7:0] data_wstrb;
	reg [63:0] mrdata;
	ysyx_040213_MuxKey #(7, 3, 3) i0 (data_size, exe_funct3, {
		3'b000, 3'b000,	
		3'b001, 3'b001,
		3'b010, 3'b010,
		3'b011, 3'b011,
		3'b100, 3'b000,
		3'b101, 3'b001,
		3'b110, 3'b010
		});

	ysyx_040213_MuxKey #(4, 3, 8) i1 (data_wstrb, exe_funct3, {
		3'b000, 8'h01,	
		3'b001, 8'h03,
		3'b010, 8'h0f,
		3'b011, 8'hff
		});

	always @(*)begin
	  if(rst)begin
	    o_data_wr = 1'b0;
	    o_data_req = 1'b0;
	    o_data_size = 3'b0;
	    o_data_addr = 64'h0000000080000000;
	    o_data_wstrb = 8'b0;
	    o_data_wdata = 64'b0;
//	    o_data_size  =3'b0;
	    o_data_wstrb = 8'b0;
//	    data_addr_ok = 1'b0;
//	    data_data_ok = 1'b0;
	    mrdata = 64'b0;
	  end
	  else begin
	    o_data_wr = sm_en ? 1'b1 : 1'b0;
	    o_data_req = (sm_en || lm_en) && !clint_hit; 
	    o_data_wdata = mwdata;
	    o_data_addr = maddr;
	    o_data_size = data_size;
	    o_data_wstrb = data_wstrb;
	    mrdata = i_data_rdata;
//	    data_addr_ok = i_data_addr_ok;
//	    data_data_ok = i_data_data_ok;
	  end
	end
	ysyx_040213_MuxKey #(7, 3, 64) i2 (o_data_mrdata, mem_funct3, {
		3'b000, {{56{mrdata[7]}},mrdata[7:0]},	
		3'b001, {{48{mrdata[15]}},mrdata[15:0]},	
		3'b010, {{32{mrdata[31]}},mrdata[31:0]},
		3'b011, mrdata,
		3'b100, {{56{1'b0}},mrdata[7:0]},
		3'b101, {{48{1'b0}},mrdata[15:0]},
		3'b110, {{32{1'b0}},mrdata[31:0]}
		});
endmodule
module ysyx_040213_MEMReg(
	input clk,
	input rst,
	
	input EXE_to_MEM_valid,
	input MEM_ready_go,
	input WB_allow_in,
	
	output MEM_allow_in,
	output MEM_to_WB_valid,
	
	input [63:0] i_mem_adata,
	input [2:0 ] i_mem_funct3,
	input i_mem_sm_en,
	input i_mem_lm_en,

	input [63:0] i_mem_pc_link,
	input [4:0] i_mem_rd,
	input i_mem_w_en,
	input [3:0] i_mem_RegWrite_en,
	input [63:0] i_mem_csr_src1,
	input i_mem_clint_hit,

	output [63:0] o_mem_adata,
	output [2:0 ] o_mem_funct3,
	output o_mem_sm_en,
	output o_mem_lm_en,

	output [63:0] o_mem_pc_link,
	output [4:0] o_mem_rd,
	output o_mem_w_en,
	output [3:0] o_mem_RegWrite_en,
	output [63:0] o_mem_csr_src1,
	output o_mem_clint_hit

);
	reg MEM_valid;
	reg o_mem_w_en_i;

	assign MEM_allow_in = !MEM_valid || MEM_ready_go && WB_allow_in; 
	assign MEM_to_WB_valid = MEM_valid && MEM_ready_go;

	always @(posedge clk)begin
	  if(rst)begin
	    MEM_valid <= 1'b0;
	  end
	  else if(MEM_allow_in)begin
	    MEM_valid <= EXE_to_MEM_valid;
	  end
	end

	wire w_en;
	assign w_en = EXE_to_MEM_valid && MEM_allow_in;

	assign o_mem_w_en = MEM_valid && o_mem_w_en_i;


//	ysyx_040213_Reg #(64, 64'b0) i0 (clk, rst, i_mem_src2, o_mem_src2, w_en);
	ysyx_040213_Reg #(64, 64'b0) i1 (clk, rst, i_mem_adata, o_mem_adata, w_en);
	ysyx_040213_Reg #(3,  3 'b0) i2 (clk, rst, i_mem_funct3, o_mem_funct3, w_en);
	ysyx_040213_Reg #(1,  1 'b0) i3 (clk, rst, i_mem_sm_en, o_mem_sm_en, w_en);
	ysyx_040213_Reg #(1,  1 'b0) i4 (clk, rst, i_mem_lm_en, o_mem_lm_en, w_en);
	ysyx_040213_Reg #(5,  5 'b0) i5 (clk, rst, i_mem_rd, o_mem_rd, w_en);
	ysyx_040213_Reg #(1,  1 'b0) i6 (clk, rst, i_mem_w_en, o_mem_w_en_i, w_en);
	ysyx_040213_Reg #(64, 64'b0) i7 (clk, rst, i_mem_pc_link, o_mem_pc_link, w_en);
	ysyx_040213_Reg #(4,  4'b0 ) i8 (clk, rst, i_mem_RegWrite_en, o_mem_RegWrite_en, w_en);
	ysyx_040213_Reg #(1,  1'b0 ) i15 (clk, rst, i_mem_clint_hit, o_mem_clint_hit, w_en);
	ysyx_040213_Reg #(64, 64'b0)  i13 (clk, rst, i_mem_csr_src1, o_mem_csr_src1, w_en);

	//for difftest//
	/*
	ysyx_040213_Reg #(32, 32'b0)  i9 (clk, rst, i_mem_inst, o_mem_inst, w_en);
	ysyx_040213_Reg #(64, 64'b0)  i10 (clk, rst, i_mem_dnpc, o_mem_dnpc, w_en);
	ysyx_040213_Reg #(1,   1'b0)  i11 (clk, rst, i_mem_id_bubble, o_mem_id_bubble, w_en);
	ysyx_040213_Reg #(1,   1'b0)  i12 (clk, rst, i_mem_exe_bubble, o_mem_exe_bubble, w_en);
	ysyx_040213_Reg #(1,   1'b0)  i14 (clk, rst, i_mem_devices_access, o_mem_devices_access, w_en);
*/
endmodule
module ysyx_040213_mul(
	input clk,
	input rst,
	input mul_valid,
	input flush,
//	input mulw,
	input [1:0] mul_signed,
	input [63:0] multiplicand,
	input [63:0] multiplier,
	output mul_ready,
	output reg out_valid,
	output reg [63:0] result_hi,
	output reg [63:0] result_lo
);
`define YSYX_040213_MUL_IDLE    2'b00
`define YSYX_040213_MUL_MULTING 2'b01
`define YSYX_040213_MUL_END     2'b10

//wire signed [63:0] s_plicand = multiplicand;
//wire signed [63:0] s_plier = multiplier;
reg [131:0]mul_x;
reg [66:0]mul_y;

reg [131:0] mul_result;
wire [131:0] mul_res;
reg [1:0] mul_state;

//wire[127:0] test_mul_result = mul_signed == 2'b11 ? s_plicand * s_plier : multiplicand * multiplier;
assign mul_ready = mul_state == `YSYX_040213_MUL_IDLE;


always @(posedge clk)begin
  if(rst || flush)begin
   result_hi <= 64'b0;
   result_lo <= 64'b0;
   mul_result <= 132'b0;
   mul_state <= `YSYX_040213_MUL_IDLE;
   out_valid <= 1'b0;
   end else begin
    case(mul_state)
      `YSYX_040213_MUL_IDLE: begin
        if(mul_valid)begin
          mul_x <=  mul_signed[1] ? {{66'b0},{2{multiplicand[63]}},{multiplicand}} : {{68'b0},{multiplicand}};
          mul_y <= mul_signed[0] ? {{2{multiplier[63]}},{multiplier},{1'b0}} : {2'b0,{multiplier},{1'b0}};
	  mul_state <= `YSYX_040213_MUL_MULTING;
	  out_valid <= 1'b0;
	end else begin
	  mul_state <= `YSYX_040213_MUL_IDLE;
	  out_valid <= 1'b0;
	end
      end
      `YSYX_040213_MUL_MULTING: begin
        mul_x <= {mul_x[129:0],2'b0};
        mul_y <= {2'b0,{mul_y[66:2]}};
        mul_result <= mul_result + mul_res;
	if(mul_y == 67'b0)begin
	  mul_state <= `YSYX_040213_MUL_END;
	end
      end
      `YSYX_040213_MUL_END: begin
        result_hi <= mul_result[127:64];
	result_lo <= mul_result[63:0];
	out_valid <= 1'b1;
	mul_state <= `YSYX_040213_MUL_IDLE;
	mul_x <= 132'b0;
	mul_y <= 67'b0;
	mul_result <= 132'b0;
      end
      default: mul_state <= `YSYX_040213_MUL_IDLE;
    endcase
  end
end
ysyx_040213_booth b1(
  .mul_x(mul_x),
  .mul_y(mul_y[2:0]),
  .mul_res(mul_res)
);
endmodule
module ysyx_040213_nextpc(
	input clk,
	input rst,

	input exe_reg_w_en,
	input IF_allow_in,

	input [63:0] src1,
	input [63:0] ext_imm,
	input [63:0] pc_add_four,
	input [63:0] mtvec,
	input [63:0] mepc,
	input IF_valid,
	input [5:0] nextpc_en,
	input [63:0] pc,
	output [63:0]dnpc,
	
	input inst_addr_ok,
	input pc_stall,
	input valid_in,

	output to_fs_valid
		
);
//-----------------------pre-if-----------------// 
	wire pc_ready_go;
	assign pc_ready_go = !pc_stall && valid_in && inst_addr_ok;
	wire [63:0] dnpc_i;
	wire i_jump_en = |nextpc_en;
		
	assign to_fs_valid = pc_ready_go;
	
	reg br_bus_valid;
	reg [63:0] br_bus_reg;
	reg [5:0] nextpc_en_reg;
	reg bd_done;
//	reg clint_trap_reg;

	ysyx_040213_MuxKey #(7, 6, 64) i0 (dnpc_i, nextpc_en, {
		6'b000000, pc+4,
		6'b000001, (ext_imm + src1) & ~64'b1,
		6'b000010, pc_add_four + ext_imm - 4,
		6'b000100, pc_add_four + ext_imm - 4,
		6'b001000, mtvec,
		6'b010000, mepc,
		6'b100000, pc+4
		});

	assign dnpc = (~IF_valid && ((|nextpc_en_reg & br_bus_valid) || (|nextpc_en))) && ~bd_done? pc+4 : ((|nextpc_en_reg & br_bus_valid) ) ? br_bus_reg : dnpc_i;
	
//	assign o_clint_trap_go = (~IF_valid && ((|nextpc_en_reg & br_bus_valid) || (|nextpc_en))) && ~bd_done? 1'b0 : ((|nextpc_en_reg & br_bus_valid) ) ? clint_trap_reg : clint_trap_go;


	always @(posedge clk)begin
	  if(rst)begin
	    br_bus_reg <= 64'b0;
	    br_bus_valid <= 1'b0;
	    nextpc_en_reg <= 6'b0;
	    bd_done <= 1'b0;
          end else if( ~((~IF_valid && ((|nextpc_en_reg & br_bus_valid) || (|nextpc_en))) && ~bd_done) && ((|nextpc_en_reg & br_bus_valid) || (|nextpc_en)) && pc_ready_go && IF_allow_in) begin
	    br_bus_valid <= 1'b0;
	    br_bus_reg <= dnpc_i;
	    nextpc_en_reg <= nextpc_en;
	    //clint_trap_reg <= clint_trap_go;
         end else if(exe_reg_w_en && i_jump_en && !pc_stall)begin
	    br_bus_reg <= dnpc_i;
	    nextpc_en_reg <= nextpc_en;
	    br_bus_valid <= 1'b1;
	    bd_done <= 1'b0;
	    //clint_trap_reg <= clint_trap_go;
    	  end else if ((|nextpc_en_reg & br_bus_valid) && IF_valid)begin
	    bd_done <= 1'b1;
	  end else if(~br_bus_valid)begin
	    bd_done <= 1'b0;
    	  end else begin
	  end
	end
endmodule
module ysyx_040213_outDataSel( 
	input clint_hit,
	input [3:0] RegisterWritedata_en,
	input [63:0] clint_rdata,
	input [63:0] csr_src1,
	input [63:0] mrdata,
	input [63:0] adata, 
	input [63:0] pc_link, 
	output [63:0] wdata
);
	wire [4:0] RW_en;
	assign RW_en[3:0] = RegisterWritedata_en;
	assign RW_en[4]   = RegisterWritedata_en[2] && clint_hit;
	ysyx_040213_MuxKey #(5, 5, 64) i0 (wdata, RW_en, {
		5'b01001, csr_src1,
		5'b00100, mrdata,
		5'b00010, pc_link,
		5'b00001, adata,
		5'b10100, clint_rdata
		});

endmodule
module ysyx_040213_pc_add(
	input [63:0] pc,
	output [63:0]pc_link
);
	assign pc_link = pc + 4;  
endmodule
module ysyx_040213_pc(
	input clk,
	input rst,

	input to_fs_valid,
	input ID_allow_in,
	input IF_ready_go,

	output IF_allow_in,
	output IF_to_ID_valid,

	input [63:0] dnpc,
	output reg IF_valid,
	output[63:0] pc	
);
	wire cancel = 1'b0;
	reg cancel_next_inst;

	assign IF_allow_in = !IF_valid || (IF_ready_go & ~cancel_next_inst) && ID_allow_in;
	assign IF_to_ID_valid = IF_valid && (IF_ready_go & ~cancel_next_inst);
	
	always @(posedge clk)begin
	  if(rst)begin
	    IF_valid <= 1'b0;
          end else if(IF_allow_in)begin
	    IF_valid <= to_fs_valid;
    	  end else if(cancel && ~IF_allow_in && IF_ready_go)begin
    	    IF_valid <= 1'b0;
    	  end else begin
	  end

	  if(rst)begin
	    cancel_next_inst <= 1'b0;
	  end else if(to_fs_valid && cancel)begin
	    cancel_next_inst <= 1'b1;
	  end else if(cancel && ~IF_allow_in && ~IF_ready_go)begin
	    cancel_next_inst <= 1'b1;
    	  end else if(cancel && ~IF_allow_in && IF_ready_go)begin
	    cancel_next_inst <= 1'b0;
    	  end else begin
    	    cancel_next_inst <= 1'b0;
	  end
	end
	
	wire pc_w_en;	
	assign pc_w_en =  to_fs_valid && IF_allow_in;	
	ysyx_040213_Reg #(64, 64'h0000000030000000-4) i0 (clk, rst, dnpc, pc, pc_w_en);
endmodule
module ysyx_040213_RegisterFile #(ADDR_WIDTH = 1, DATA_WIDTH = 1) (
	  input clk,
	  input rst,
	  input [DATA_WIDTH-1:0] wdata,
	  input [4:0] waddr,
	  input w_en,
	  input [4:0] rs1,
	  input [4:0] rs2,
	  output [DATA_WIDTH-1:0] src1,
	  output [DATA_WIDTH-1:0] src2,
	  input ecall,
	  input [63:0] o_if_pc,
	  input [5:0]  csr_wen,
	  input [11:0] csr_rs1,
	  input [11:0] i_csr_waddr,
	  input [DATA_WIDTH-1:0] csr_wdata,
	  output [DATA_WIDTH-1:0] csr_src1,
	  output [DATA_WIDTH-1:0] mtvec,	
	  output [DATA_WIDTH-1:0] mepc,
	  input out_allow,
	  input WB_to_REG_valid,
	  output REG_allow_in,
	  input clint_wen,
	  input clint_ren,
	  input clint_addr,
	  input [63:0] clint_wdata,
	  output reg [63:0] clint_rdata,
	  input [63:0] i_if_pc,
	  input ID_ready_go,
	  output clint_trap_go

  );

	reg [DATA_WIDTH-1:0] rf [ADDR_WIDTH-1:0];
	reg [DATA_WIDTH-1:0] rf_csr [31:0];
	wire [4:0] csr_waddr;
	wire [4:0] csr_rs1_o;
	reg [63:0] rf_clint [1:0]; //00 cmp 01 mtime 
	reg clint_trap;
	assign clint_trap_go = ID_ready_go && clint_trap;

	ysyx_040213_MuxKey #(19, 12, 5) i7 (csr_waddr, i_csr_waddr, {
		12'h305, 5'b00000, //mtvec
		12'h341, 5'b00001, //mepc
		12'h300, 5'b00010, //mstatus
		12'h342, 5'b00011, //mcause
		12'h304, 5'b00100, //mie
		12'h344, 5'b00101, //mip
		12'hF11, 5'b00110, //MVENORID
		12'hF12, 5'b00111, //MARCHID
		12'hF13, 5'b01000, //MIMPID
		12'hF14, 5'b01001, //MHARTID
		12'h301, 5'b01010, //MISA
		12'h306, 5'b01011, //MCOUNTEREN
		12'h320, 5'b01100, //MCOUNTINHIBIT
		12'h340, 5'b01101, //MSCRATCH
		12'h343, 5'b01110, //MTVAL
		12'hc00, 5'b01111, //CYCLE
		12'hc80, 5'b10000, //CYCLEH
		12'hb00, 5'b10001, //MCYCYLE
		12'hb80, 5'b10010  //MCYCYLEH
		});
	ysyx_040213_MuxKey #(19, 12, 5) i8 (csr_rs1_o, csr_rs1, {
		12'h305, 5'b00000, //mtvec
		12'h341, 5'b00001, //mepc
		12'h300, 5'b00010, //mstatus
		12'h342, 5'b00011, //mcause
		12'h304, 5'b00100, //mie
		12'h344, 5'b00101, //mip
		12'hF11, 5'b00110, //MVENORID
		12'hF12, 5'b00111, //MARCHID
		12'hF13, 5'b01000, //MIMPID
		12'hF14, 5'b01001, //MHARTID
		12'h301, 5'b01010, //MISA
		12'h306, 5'b01011, //MCOUNTEREN
		12'h320, 5'b01100, //MCOUNTINHIBIT
		12'h340, 5'b01101, //MSCRATCH
		12'h343, 5'b01110, //MTVAL
		12'hc00, 5'b01111, //CYCLE
		12'hc80, 5'b10000, //CYCLEH
		12'hb00, 5'b10001, //MCYCYLE
		12'hb80, 5'b10010  //MCYCYLEH

		});

//	import "DPI-C" function void set_gpr_ptr(input logic [63:0] a []);
//	initial set_gpr_ptr(rf);

	always @(posedge clk) begin    
	  if (w_en) rf[waddr] <= (waddr != 0) ? wdata : 0;
	  //csr//
	  if (csr_wen[0]) rf_csr[csr_waddr] <= csr_wdata;	
	  if (csr_wen[1]) rf_csr[csr_waddr] <= rf_csr[csr_waddr] | csr_wdata;
	  if (csr_wen[2]) rf_csr[csr_waddr] <= rf_csr[csr_waddr] & ~csr_wdata;
	  if (csr_wen[3]) rf_csr[csr_waddr] <= {{59'b0},{rs1}};
	  if (csr_wen[4]) rf_csr[csr_waddr] <= rf_csr[csr_waddr] | {{59'b0},{rs1}};
	  if (csr_wen[5]) rf_csr[csr_waddr] <= rf_csr[csr_waddr] & ~{{59'b0},{rs1}};
	  if (ecall) begin 
	    rf_csr[1] <= o_if_pc;
	    rf_csr[3] <= 64'd11;
    	  end else if(clint_trap_go)begin
	    rf_csr[1] <= i_if_pc;
	    rf_csr[3] <= 64'h8000000000000007;
    	  end 
	  //clint//
	  if (clint_wen) rf_clint[clint_addr] <= clint_wdata;
	  if (clint_ren) clint_rdata <= rf_clint[clint_addr];
	  if(rst)begin
	    rf_clint[1] <= 64'b0;
	    rf_clint[0] <= 64'b0;
	    clint_trap <= 1'b0;
	  end else if(rf_csr[2][3] == 1'b1 &&  rf_csr[4][7] == 1'b1) begin
	    rf_clint[1] <= rf_clint[1] +1;
          end
	  if(rf_csr[2][3] == 1'b1 &&  rf_csr[4][7] == 1'b1 && rf_clint[1] == rf_clint[0])begin
	     clint_trap <= 1'b1;
    	  end else if(ID_ready_go)begin
    	     clint_trap <= 1'b0;
	  end
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
		
		rf_csr[0] <= 64'b0;
       		rf_csr[1] <= 64'b0;
       		rf_csr[2] <= 64'b0;
       		rf_csr[3] <= 64'b0;
       		rf_csr[4] <= 64'b0;
       		rf_csr[5] <= 64'b0;
       		rf_csr[6] <= 64'b0;
       		rf_csr[7] <= 64'b0;
       		rf_csr[8] <= 64'b0;
       		rf_csr[9] <= 64'b0;
       		rf_csr[10] <= 64'b0;
       		rf_csr[11] <= 64'b0;
       		rf_csr[12] <= 64'b0;
       		rf_csr[13] <= 64'b0;
       		rf_csr[14] <= 64'b0;
       		rf_csr[15] <= 64'b0;
       		rf_csr[16] <= 64'b0;
       		rf_csr[17] <= 64'b0;
       		rf_csr[18] <= 64'b0;
       		rf_csr[19] <= 64'b0;
       		rf_csr[20] <= 64'b0;
       		rf_csr[21] <= 64'b0;
       		rf_csr[22] <= 64'b0;
       		rf_csr[23] <= 64'b0;
       		rf_csr[24] <= 64'b0;
       		rf_csr[25] <= 64'b0;
       		rf_csr[26] <= 64'b0;
       		rf_csr[27] <= 64'b0;
       		rf_csr[28] <= 64'b0;
       		rf_csr[29] <= 64'b0;
       		rf_csr[30] <= 64'b0;
       		rf_csr[31] <= 64'b0;
	       
	       	clint_rdata <= 64'b0;	
	   end
  	end
	  
	  assign src1 = (rs1 != 0)? rf[rs1]:0;
	  assign src2 = (rs2 != 0)? rf[rs2]:0;

	  assign csr_src1 = rf_csr[csr_rs1_o];
	  assign mtvec    = rf_csr[0];
	  assign mepc     = rf_csr[1];
  
        //handshake//
	reg REG_valid;
	wire REG_ready_go = 1'b1;

	assign REG_allow_in = !REG_valid || REG_ready_go && out_allow; 
//	assign valid_out = REG_valid;

	always @(posedge clk)begin
	  if(rst)begin
	    REG_valid <= 1'b0;
	  end
	  else if(REG_allow_in)begin
	    REG_valid <= WB_to_REG_valid;
	  end
	end

//	wire reg_w_en;
//	assign reg_w_en = WB_to_REG_valid && REG_allow_in;


	//for difftest//
	/*
	ysyx_040213_Reg #(32, 32'b0)  i0 (clk, rst, i_reg_inst, o_reg_inst, 1'b1);
	//ysyx_040213_Reg #(64, 64'h80000004)  i1 (clk, rst, i_reg_dnpc, delay_dnpc, 1'b1);
	ysyx_040213_Reg #(1,   1'b0)  i2 (clk, rst, i_reg_id_bubble, o_reg_id_bubble, 1'b1);
//	ysyx_040213_Reg #(1,   1'b0)  i3 (clk, rst, i_reg_exe_bubble, delay_exe_bubble, 1'b1);
	ysyx_040213_Reg #(1,   1'b0)  i5 (clk, rst, i_reg_valid, o_reg_valid, 1'b1);

	ysyx_040213_Reg #(64, 64'h80000004)  i4 (clk, rst, i_reg_dnpc, o_reg_dnpc, 1'b1);
	ysyx_040213_Reg #(1,   1'b0)  i6 (clk, rst, i_reg_exe_bubble, o_reg_exe_bubble, 1'b1);
	ysyx_040213_Reg #(1,   1'b0)  i9 (clk, rst, i_reg_devices_access, o_reg_devices_access, 1'b1);
//	assign o_reg_devices_access = i_reg_devices_access;
*/
//	wire delay_exe_bubble;	
//	wire [63:0] delay_dnpc;
//	ysyx_040213_Reg #(64, 64'h80000004)  i4 (clk, rst, delay_dnpc, o_reg_dnpc, 1'b1);
//	ysyx_040213_Reg #(1,  1'b0)  i6(clk, rst, delay_exe_bubble, o_reg_exe_bubble, 1'b1);
endmodule
module ysyx_040213_inst_compare (
	input [63:0] instt,
	input [63:0] instt_syn
);
/* verilator lint_off  UNUSED*/
wire inst_diff;
assign inst_diff = (instt == instt_syn) ? 1'b0 : 1'b1;

endmodule
module ysyx_040213_Reg #(WIDTH = 1, RESET_VAL = 0) (
	  input clk,
	    input rst,
	      input [WIDTH-1:0] din,
	        output reg [WIDTH-1:0] dout,
		  input wen
	  );
	    always @(posedge clk) begin
		        if (rst) dout <= RESET_VAL;
			    else if (wen) dout <= din;
			      end
endmodule
module ysyx_040213_MuxKey #(NR_KEY = 2, KEY_LEN = 1, DATA_LEN = 1) (
	  output [DATA_LEN-1:0] out,
	    input [KEY_LEN-1:0] key,
	      input [NR_KEY*(KEY_LEN + DATA_LEN)-1:0] lut
      );
        ysyx_040213_MuxKeyInternal #(NR_KEY, KEY_LEN, DATA_LEN, 0) i0 (out, key, {DATA_LEN{1'b0}}, lut);
endmodule
module ysyx_040213_MuxKeyWithDefault #(NR_KEY = 2, KEY_LEN = 1, DATA_LEN = 1) (
	  output [DATA_LEN-1:0] out,
	    input [KEY_LEN-1:0] key,
	      input [DATA_LEN-1:0] default_out,
	        input [NR_KEY*(KEY_LEN + DATA_LEN)-1:0] lut
	);
	  ysyx_040213_MuxKeyInternal #(NR_KEY, KEY_LEN, DATA_LEN, 1) i0 (out, key, default_out, lut);
endmodule

module ysyx_040213_MuxKeyInternal #(NR_KEY = 2, KEY_LEN = 1, DATA_LEN = 1, HAS_DEFAULT = 0) (
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
														      if (!HAS_DEFAULT) out = lut_out;
														          else out = (hit ? lut_out : default_out);
															    end
														    endmodule



module ysyx_040213_csa(
    input [`YSYX_040213_XLEN:0] src1,
    input [`YSYX_040213_XLEN:0] src2,
    input cin,
    output cout,
    output [`YSYX_040213_XLEN - 1:0] result
);
assign {cout, result} = src1 + src2 + {`YSYX_040213_XLEN'b0,cin};
endmodule
