// Burst types
`define YSYX210133_AXI_BURST_TYPE_INCR                                 2'b01
// Access permissions
`define YSYX210133_AXI_PROT_UNPRIVILEGED_ACCESS                        3'b000
`define YSYX210133_AXI_PROT_SECURE_ACCESS                              3'b000
`define YSYX210133_AXI_PROT_DATA_ACCESS                                3'b000
// Memory types (AR)
`define YSYX210133_AXI_ARCACHE_NORMAL_NON_CACHEABLE_NON_BUFFERABLE     4'b0010

`define YSYX210133_ZERO_WORD  64'h00000000_00000000   
`define YSYX210133_PC_START   64'h00000000_30000000 
  
`define YSYX210133_INST_ADD    12'b1000_0000_0000  
`define YSYX210133_INST_SUB    12'b0100_0000_0000  
`define YSYX210133_INST_SLT    12'b0010_0000_0000   
`define YSYX210133_INST_SLTU   12'b0001_0000_0000 
`define YSYX210133_INST_XOR    12'b0000_1000_0000 
`define YSYX210133_INST_OR     12'b0000_0100_0000 
`define YSYX210133_INST_AND    12'b0000_0010_0000 
`define YSYX210133_INST_SLL    12'b0000_0001_0000 
`define YSYX210133_INST_SRL    12'b0000_0000_1000 
`define YSYX210133_INST_SRA    12'b0000_0000_0100 
`define YSYX210133_INST_LUI    12'b0000_0000_0010 
`define YSYX210133_INST_JAL    12'b0000_0000_0001

`define YSYX210133_INST_BEQ    6'b10_0000
`define YSYX210133_INST_BNE    6'b01_0000
`define YSYX210133_INST_BLT    6'b00_1000
`define YSYX210133_INST_BGE    6'b00_0100
`define YSYX210133_INST_BLTU   6'b00_0010
`define YSYX210133_INST_BGEU   6'b00_0001

`define YSYX210133_SIZE_B              2'b00
`define YSYX210133_SIZE_H              2'b01
`define YSYX210133_SIZE_W              2'b10
`define YSYX210133_SIZE_D              2'b11

`define YSYX210133_REQ_READ            1'b0
`define YSYX210133_REQ_WRITE           1'b1

module ysyx_210133(
  input clock,
  input reset,
// no used
  input io_interrupt,

// master
  input                               io_master_awready,
  output                              io_master_awvalid,
  output [31:0]         io_master_awaddr,
  output [3:0]           io_master_awid,
  output [7:0]                        io_master_awlen,
  output [2:0]                        io_master_awsize,
  output [1:0]                        io_master_awburst,

  input                               io_master_wready,
  output                              io_master_wvalid,
  output [63:0]         io_master_wdata,
  output [7:0]       io_master_wstrb,
  output                              io_master_wlast,
  
  output                              io_master_bready,
  input                               io_master_bvalid,
  input  [1:0]                        io_master_bresp,
  input  [3:0]           io_master_bid,

  input                               io_master_arready,
  output                              io_master_arvalid,
  output [31:0]         io_master_araddr,
  output [3:0]           io_master_arid,
  output [7:0]                        io_master_arlen,
  output [2:0]                        io_master_arsize,
  output [1:0]                        io_master_arburst,

  output                              io_master_rready,
  input                               io_master_rvalid,
  input  [1:0]                        io_master_rresp,
  input  [63:0]         io_master_rdata,
  input                               io_master_rlast,
  input  [3:0]           io_master_rid,

// slave
  output                              io_slave_awready,
  input                               io_slave_awvalid,
  input [31:0]          io_slave_awaddr,
  input [3:0]            io_slave_awid,
  input [7:0]                         io_slave_awlen,
  input [2:0]                         io_slave_awsize,
  input [1:0]                         io_slave_awburst,

  output                              io_slave_wready,
  input                               io_slave_wvalid,
  input [63:0]          io_slave_wdata,
  input [7:0]        io_slave_wstrb,
  input                               io_slave_wlast,
  
  input                               io_slave_bready,
  output                              io_slave_bvalid,
  output  [1:0]                       io_slave_bresp,
  output  [3:0]          io_slave_bid,

  output                              io_slave_arready,
  input                               io_slave_arvalid,
  input [31:0]          io_slave_araddr,
  input [3:0]            io_slave_arid,
  input [7:0]                         io_slave_arlen,
  input [2:0]                         io_slave_arsize,
  input [1:0]                         io_slave_arburst,

  input                               io_slave_rready,
  output                              io_slave_rvalid,
  output  [1:0]                       io_slave_rresp,
  output  [63:0]        io_slave_rdata,
  output                              io_slave_rlast,
  output  [3:0]          io_slave_rid
);

localparam AXI_DATA_WIDTH    = 64;
localparam AXI_ADDR_WIDTH    = 32;
localparam AXI_ID_WIDTH      = 4;
localparam AXI_USER_WIDTH    = 1;

wire io_master_awuser, io_master_aruser;
wire io_master_buser = 0;
wire io_master_ruser = 0;
wire [3:0]io_master_wid;

wire [2:0]                        io_master_awprot;
wire                              io_master_awlock;
wire [3:0]                        io_master_awcache;
wire [3:0]                        io_master_awqos;
wire [2:0]                        io_master_arprot;
wire                              io_master_arlock;
wire [3:0]                        io_master_arcache;
wire [3:0]                        io_master_arqos;

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

// /* debug */
// reg main;
// always @(posedge clock) begin
//   if(wb_vld & (wb_pc[31:0]==32'h30004ccc))
//     main <= 1;
// end
// always @(posedge clock) begin
//   if(wb_vld & main)
//     $write("PC: %x, If_addr: %x, Inst: %x\n",wb_pc, If_stage.if_addr,wb_inst);
// end

// wire [63:0]  pc;
// wire [31:0]inst;
// id_stage
// id_stage -> regfile
wire rs1_r_ena;
wire [4 : 0]rs1_r_addr;
wire rs2_r_ena;
wire [4 : 0]rs2_r_addr;
// wire rd_w_ena;
// wire [4 : 0]rd_w_addr;

// wire [63:0]dec_op1;
// wire [63:0]dec_op2;
// wire [63:0]rs2_data;

wire [63:0] r_data1;
wire [63:0] r_data2;

// wire [63:0]alu_res_exe;

// wire [63:0]alu_res_mem;
// wire [63:0]dtcm_data;


// wire [63:0]rd_data;

// wire [63:0] rv_imm;
// wire [7:0] dec_ctr_info;
// wire [11:0] dec_alu_info;
// wire [6:0] dec_bxx_info;
// wire dec_mem_add_info;
// wire [3:0] dec_store_info;
// wire [6:0] dec_load_info;
// wire [1:0] dec_length_info;
wire exe_bxx_res;

wire [63:0]exe_alu_res;
wire [63:0]exe_mem_addr;
wire [63:0]mem_rd_data;

// wire [3:0] dec_store_info;
// wire [6:0] dec_load_info;
wire [63:0]wb_data;
wire [63:0] pc_new;

wire mem_stall;
//wire mem_hs;

// wire [4:0] csr_info;
// wire [11:0] csr_idx;
// wire [63:0] csr_wdata;
// wire [63:0] csr_rdata;
// wire [63:0] csr_op1;
// wire [63:0] csr_op2;

//////////////////////////////////////
// cpu -> AXI signal
//////////////////////////////////////
//if
  wire if_valid;
  wire if_ready;
  //wire raddr_valid;
  wire cpu_vld;
  wire [63:0] if_data_read;
  wire [63:0] if_addr;
  wire [1:0] if_size;
  wire [1:0] if_resp;
//mem  
  wire dtcm_rvalid;
  wire dtcm_rready;
  wire dtcm_wvalid;
  wire dtcm_wready;
  wire [63:0]dtcm_data_rd;
  wire [63:0]dtcm_data_wr; 
  //wire dtcm_rd, dtcm_wr;
  wire [63:0]dtcm_addr;
  wire [7:0] wmask;
///////////////////////////////////////////
  //wire dec_exp_ecall;
  //wire dec_mret;

  wire [63:0] csr_mepc;
  wire [63:0] csr_mtvec;

//wire [63:0] regs[0 : 31];
wire clint_timr_intr;
wire glb_intr_en;
wire timr_intr_en;
wire clint_timr_csr_en;

wire id_vld, exe_vld, mem_vld, wb_vld;
wire exe_exp_ecall,mem_exp_ecall,wb_exp_ecall;
wire exe_mret,mem_mret,wb_mret;

/* if signal */
wire [63:0] if_pc;
wire [31:0] if_inst;
wire if_jump;
//wire fetched;
wire [7:0] exe_ctr_info;

ysyx_210133_if_stage If_stage(
  .clk(clock),
  .rst(reset),
  
  .pc(if_pc),
  .inst_reg(if_inst),

  .pc_new(pc_new),
  .dec_ctr_info(exe_ctr_info),//for branch, which happens in exe-stage
  .exe_bxx_res(exe_bxx_res),

  .if_valid           (if_valid),
  .if_ready           (if_ready),
  .if_data_read       (if_data_read),
  .if_addr            (if_addr),
  .if_size            (if_size),
  .if_resp            (if_resp),

  //.fetched            (fetched),
  //.raddr_valid            (raddr_valid),
  .cpu_vld_reg(cpu_vld),
  //.rdata(rdata)
  .mem_stall(mem_stall),
  //.mem_hs(mem_hs),

  .dec_exp_ecall(wb_exp_ecall),
  .dec_mret(wb_mret),

  .clint_timr_intr(clint_timr_intr),

  .csr_mepc(csr_mepc),
  .csr_mtvec(csr_mtvec),

  .glb_intr_en(glb_intr_en),
  .timr_intr_en(timr_intr_en),

  .clint_timr_csr_en(clint_timr_csr_en),

  .jump(if_jump),
  .exe_vld(exe_vld)
);

wire [96:0] if_in = {cpu_vld, if_pc, if_inst};
wire [96:0] if_out;

ysyx_210133_pipe_dff#(
    .DW    ( 97 )
)if2id_dff(
    .clk   ( clock   ),
    .rst   ( reset   ),
    .flush ( if_jump | clint_timr_csr_en ),
    .stall ( mem_stall ),
    .dnxt  ( if_in  ),
    .qout  ( if_out  )
);

wire [63:0]id_pc;
wire [31:0]id_inst;
assign {id_vld,id_pc,id_inst} = if_out;

/* id signal */
wire [4 : 0]id_rd_w_addr;
wire [63:0]id_op1;
wire [63:0]id_op2;
wire [7:0] id_ctr_info;
wire [11:0] id_alu_info;
wire [6:0] id_bxx_info;
wire id_mem_add_info;
wire [3:0] id_store_info;
wire [6:0] id_load_info;
wire [1:0]id_length_info;
wire id_exp_ecall;
wire id_mret;
wire [63:0] id_rv_imm;
wire [4:0] id_csr_info, exe_csr_info, wb_csr_info;
wire [63:0] id_csr_op1;
wire [63:0] id_csr_op2;
wire [11:0] id_csr_idx,wb_csr_idx;
wire [63:0] id_rs2_data;
wire id_rd_w_ena;
wire [63:0] id_csr_rdata,wb_csr_rdata;

wire [31:0] exe_inst, mem_inst, wb_inst;
wire [63:0] exe_pc, mem_pc, wb_pc;

ysyx_210133_id_stage Id_stage(
  .inst(id_inst),
  .rs1_data(r_data1),
  .rs2_data(r_data2),
  .pc(id_pc),
  
  .rs1_r_ena(rs1_r_ena),
  .rs1_r_addr(rs1_r_addr),
  .rs2_r_ena(rs2_r_ena),
  .rs2_r_addr(rs2_r_addr),
  .rd_w_ena(id_rd_w_ena),
  .rd_w_addr(id_rd_w_addr),
  
  .dec_op1(id_op1),
  .dec_op2(id_op2),
  
  .dec_ctr_info(id_ctr_info),
  .dec_alu_info(id_alu_info),
  .dec_bxx_info(id_bxx_info),
  .dec_mem_add_info(id_mem_add_info),
  .dec_store_info(id_store_info),
  .dec_load_info(id_load_info),
  .dec_length_info(id_length_info),

  .dec_exp_ecall(id_exp_ecall),
  .dec_mret(id_mret),

  .rv_imm(id_rv_imm),

  .csr_info(id_csr_info),
  .csr_op1(id_csr_op1),
  .csr_op2(id_csr_op2),
  .csr_idx(id_csr_idx),
  .csr_rdata(id_csr_rdata),

  .rs2_data_o(id_rs2_data)

);

wire [80:0] id_csr_in = {id_csr_info,id_csr_idx,id_csr_rdata};
wire [80:0] id_csr_out;

wire [534:0] id_in = {id_vld,id_rd_w_ena,id_rd_w_addr,id_op1,id_op2,id_ctr_info,id_alu_info,id_bxx_info,id_mem_add_info,id_store_info,
                      id_load_info,id_length_info,id_exp_ecall,id_mret,id_rv_imm,id_csr_info,id_csr_op1,id_csr_op2,
                      id_rs2_data,id_pc,id_inst};

wire [534:0] id_out;

ysyx_210133_pipe_dff#(
    .DW    ( 535+81 )
)id2ex_dff(
    .clk   ( clock   ),
    .rst   ( reset   ),
    .flush ( if_jump | clint_timr_csr_en ),
    .stall ( mem_stall ),
    .dnxt  ( {id_in,id_csr_in}  ),
    .qout  ( {id_out,id_csr_out}  )
);

/* exe signal */
wire exe_rd_w_ena;
wire [4:0]exe_rd_w_addr;
wire [63:0]exe_op1;
wire [63:0]exe_op2;
wire [11:0] exe_alu_info;
wire [6:0] exe_bxx_info;
wire exe_mem_add_info;
wire [3:0] exe_store_info;
wire [6:0] exe_load_info;
wire [1:0]exe_length_info;
wire [63:0] exe_rv_imm;
wire [63:0] exe_csr_op1;
wire [63:0] exe_csr_op2;
wire [63:0] exe_rs2_data;
//wire [63:0] exe_pc;
wire [63:0] exe_csr_wdata,wb_csr_wdata;

assign {exe_vld,exe_rd_w_ena,exe_rd_w_addr,exe_op1,exe_op2,exe_ctr_info,exe_alu_info,exe_bxx_info,exe_mem_add_info,exe_store_info,
        exe_load_info,exe_length_info,exe_exp_ecall,exe_mret,exe_rv_imm,exe_csr_info,exe_csr_op1,exe_csr_op2,
        exe_rs2_data,exe_pc,exe_inst} = id_out;

wire [144:0] exe_csr_in = {id_csr_out,exe_csr_wdata};
wire [144:0] exe_csr_out;

ysyx_210133_exe_stage Exe_stage(
  .pc(exe_pc),

  //.dec_ctr_info(exe_ctr_info),
  .dec_alu_info(exe_alu_info),
  .dec_bxx_info(exe_bxx_info),
  .dec_mem_add_info(exe_mem_add_info),
  .dec_length_info(exe_length_info),

  .dec_op1(exe_op1),
  .dec_op2(exe_op2),
  .rv_imm(exe_rv_imm),

  .exe_alu_res(exe_alu_res),
  .exe_mem_addr(exe_mem_addr),
  .exe_bxx_res(exe_bxx_res),

  .pc_new(pc_new),

  .csr_info(exe_csr_info),
  .csr_op1(exe_csr_op1),
  .csr_op2(exe_csr_op2),
  .csr_wdata(exe_csr_wdata)
);

wire [313:0] exe_in = {exe_vld,exe_pc,exe_inst,exe_rd_w_ena,exe_rd_w_addr,exe_ctr_info,exe_alu_res,exe_rs2_data,exe_mem_addr,exe_store_info,exe_load_info};
wire [313:0] exe_out;

ysyx_210133_pipe_dff#(
    .DW    ( 314+147 )
)ex2mem_dff(
    .clk   ( clock   ),
    .rst   ( reset   ),
    .flush ( clint_timr_csr_en ),
    .stall ( mem_stall ),
    .dnxt  ( {exe_in,exe_csr_in,exe_exp_ecall,exe_mret}  ),
    .qout  ( {exe_out,exe_csr_out,mem_exp_ecall,mem_mret}  )
);
/* mem signal */
wire [7:0] mem_ctr_info;
wire [63:0]mem_rs2_data;
wire [63:0]mem_mem_addr;
wire [3:0] mem_store_info;
wire [6:0] mem_load_info;
wire [63:0] mem_alu_res;
wire mem_rd_w_ena;
wire [4:0]mem_rd_w_addr;

assign {mem_vld,mem_pc,mem_inst,mem_rd_w_ena,mem_rd_w_addr,mem_ctr_info,mem_alu_res,mem_rs2_data,mem_mem_addr,mem_store_info,mem_load_info} = exe_out;

wire [144:0] mem_csr_in = exe_csr_out;
wire [144:0] mem_csr_out;
wire [1:0]mem_size;

ysyx_210133_mem_stage Mem_stage(  
  .dec_ctr_info(mem_ctr_info),
  //.exe_alu_res(mem_alu_res),

  .rs2_data(mem_rs2_data),
  .exe_mem_addr(mem_mem_addr),

  .dec_store_info(mem_store_info),
  .dec_load_info(mem_load_info),

  .mem_rd_data(mem_rd_data),
  
  .dtcm_rvalid(dtcm_rvalid),
  .dtcm_rready(dtcm_rready),
  .dtcm_wvalid(dtcm_wvalid),
  .dtcm_wready(dtcm_wready),

  .dtcm_data_rd(dtcm_data_rd),
  .dtcm_data_wr(dtcm_data_wr),
  // .dtcm_rd(dtcm_rd),
  // .dtcm_wr(dtcm_wr),
  .dtcm_addr(dtcm_addr),
  .wmask(wmask),
  
  .mem_stall(mem_stall),
  //.mem_hs(mem_hs),
  .mem_size(mem_size)
);

wire [238:0] mem_in = {mem_vld,mem_pc,mem_inst,mem_rd_w_ena,mem_rd_w_addr,mem_ctr_info,mem_alu_res,mem_rd_data};
wire [238:0] mem_out;

ysyx_210133_pipe_dff#(
    .DW    ( 239+147 )
)mem2wb_dff(
    .clk   ( clock   ),
    .rst   ( reset   ),
    .flush ( 1'b0 ),
    .stall ( mem_stall ),
    .dnxt  ( {mem_in,mem_csr_in,mem_exp_ecall,mem_mret}  ),
    .qout  ( {mem_out,mem_csr_out,wb_exp_ecall,wb_mret}  )
);

wire wb_rd_w_ena;
wire [4:0]wb_rd_w_addr;
wire [7:0] wb_ctr_info;
wire [63:0]wb_alu_res;
wire [63:0]wb_rd_data;

assign {wb_vld,wb_pc,wb_inst,wb_rd_w_ena,wb_rd_w_addr,wb_ctr_info,wb_alu_res,wb_rd_data} = mem_out;
assign {wb_csr_info,wb_csr_idx,wb_csr_rdata,wb_csr_wdata} = mem_csr_out;

ysyx_210133_wb_stage Wb_stage(
  .dec_ctr_info(wb_ctr_info),
  .exe_alu_res(wb_alu_res),
  .mem_rd_data(wb_rd_data),

  .wb_data(wb_data),

  .csr_rdata(wb_csr_rdata)
);

ysyx_210133_regfile Regfile(
  .clk(clock),
  .rst(reset),
  .w_addr(wb_rd_w_addr),
  .w_data(wb_data),
  .w_ena(wb_rd_w_ena),
  
  .r_addr1(rs1_r_addr),
  .r_data1(r_data1),
  .r_ena1(rs1_r_ena),
  .r_addr2(rs2_r_addr),
  .r_data2(r_data2),
  .r_ena2(rs2_r_ena)

  // .regs_o             (regs)
);

ysyx_210133_csr_regfile CSR_Regfile(
  .clk(clock),
  .rst(reset),
  .csr_info({wb_csr_info[4:1],id_csr_info[0]}),
  .csr_wr_idx(wb_csr_idx),
  .csr_rd_idx(id_csr_idx),
  .csr_wdata(wb_csr_wdata),
  .csr_rdata(id_csr_rdata),

  .dec_exp_ecall(wb_exp_ecall),
  .dec_mret(wb_mret),

  .clint_timr_csr_en(clint_timr_csr_en),

  .pc_wb(wb_pc),
  .pc_exe(exe_pc),

  .csr_mepc(csr_mepc),
  .csr_mtvec(csr_mtvec),

  .glb_intr_en(glb_intr_en),
  .timr_intr_en(timr_intr_en)
);

////////////////////////////////////////////////
// Native port --> AXI 
////////////////////////////////////////////////
wire                               axi_aw_ready;
wire                              axi_aw_valid;
wire [AXI_ADDR_WIDTH-1:0]         axi_aw_addr;
    wire [2:0]                        axi_aw_prot;
    wire [AXI_ID_WIDTH-1:0]           axi_aw_id;
    wire [AXI_USER_WIDTH-1:0]         axi_aw_user;
    wire [7:0]                        axi_aw_len;
    wire [2:0]                        axi_aw_size;
    wire [1:0]                        axi_aw_burst;
    wire                              axi_aw_lock;
    wire [3:0]                        axi_aw_cache;
    wire [3:0]                        axi_aw_qos;
    wire                               axi_w_ready;
    wire                              axi_w_valid;
    wire [AXI_DATA_WIDTH-1:0]         axi_w_data;
    wire [AXI_DATA_WIDTH/8-1:0]       axi_w_strb;
    wire                              axi_w_last;
    wire [AXI_ID_WIDTH-1:0]           axi_w_id;
    wire                              axi_b_ready;
    wire                               axi_b_valid;
    wire  [1:0]                        axi_b_resp;
    wire  [AXI_ID_WIDTH-1:0]           axi_b_id;
    wire  [AXI_USER_WIDTH-1:0]         axi_b_user;
    wire                               axi_ar_ready;
    wire                              axi_ar_valid;
    wire [AXI_ADDR_WIDTH-1:0]         axi_ar_addr;
    wire [2:0]                        axi_ar_prot;
    wire [AXI_ID_WIDTH-1:0]           axi_ar_id;
    wire [AXI_USER_WIDTH-1:0]         axi_ar_user;
    wire [7:0]                        axi_ar_len;
    wire [2:0]                        axi_ar_size;
    wire [1:0]                        axi_ar_burst;
    wire                              axi_ar_lock;
    wire [3:0]                        axi_ar_cache;
    wire [3:0]                        axi_ar_qos;
    wire                              axi_r_ready;
    wire                               axi_r_valid;
    wire  [1:0]                        axi_r_resp;
    wire  [AXI_DATA_WIDTH-1:0]         axi_r_data;
    wire                               axi_r_last;
    wire  [AXI_ID_WIDTH-1:0]           axi_r_id;
    wire  [AXI_USER_WIDTH-1:0]         axi_r_user;

    wire                              clint_aw_ready;
    wire                              clint_aw_valid;
    wire [15:0]                        clint_aw_addr;
    wire [2:0]                        clint_aw_prot;
    wire                              clint_w_ready;
    wire                              clint_w_valid;
    wire [AXI_DATA_WIDTH-1:0]         clint_w_data;
    wire [AXI_DATA_WIDTH/8-1:0]       clint_w_strb;
    wire                              clint_b_ready;
    wire                               clint_b_valid;
    wire  [1:0]                        clint_b_resp;
    wire                               clint_ar_ready;
    wire                              clint_ar_valid;
    wire [15:0]                       clint_ar_addr;
    wire [2:0]                        clint_ar_prot;
    wire                              clint_r_ready;
    wire                               clint_r_valid;
    wire  [1:0]                        clint_r_resp;
    wire  [AXI_DATA_WIDTH-1:0]         clint_r_data;

    ysyx_210133_biu BIU (
        .clk                          (clock),
        .rst                          (reset),

        .if_valid                     (if_valid),
        .if_ready                     (if_ready),
        .if_data_read                 (if_data_read),
        .if_addr                      (if_addr),
        .if_size                      (if_size),
        .if_resp                      (if_resp),
        //.raddr_valid                  (raddr_valid),

        .dtcm_rvalid(dtcm_rvalid),
        .dtcm_rready(dtcm_rready),
        .dtcm_wvalid(dtcm_wvalid),
        .dtcm_wready(dtcm_wready),
        
        .dtcm_data_rd(dtcm_data_rd),
        .dtcm_data_wr(dtcm_data_wr),
        .dtcm_addr(dtcm_addr),
        .wmask(wmask),
        .mem_size(mem_size),

        .axi_aw_ready_i                 (axi_aw_ready),
        .axi_aw_valid_o                 (axi_aw_valid),
        .axi_aw_addr_o                  (axi_aw_addr),
        .axi_aw_prot_o                  (axi_aw_prot),
        .axi_aw_id_o                    (axi_aw_id),
        .axi_aw_user_o                  (axi_aw_user),
        .axi_aw_len_o                   (axi_aw_len),
        .axi_aw_size_o                  (axi_aw_size),
        .axi_aw_burst_o                 (axi_aw_burst),
        .axi_aw_lock_o                  (axi_aw_lock),
        .axi_aw_cache_o                 (axi_aw_cache),
        .axi_aw_qos_o                   (axi_aw_qos),

        .axi_w_ready_i                  (axi_w_ready),
        .axi_w_valid_o                  (axi_w_valid),
        .axi_w_data_o                   (axi_w_data),
        .axi_w_strb_o                   (axi_w_strb),
        .axi_w_last_o                   (axi_w_last),
        .axi_w_id_o                     (axi_w_id),
        
        .axi_b_ready_o                  (axi_b_ready),
        .axi_b_valid_i                  (axi_b_valid),
        .axi_b_resp_i                   (axi_b_resp),
        .axi_b_id_i                     (axi_b_id),
        .axi_b_user_i                   (axi_b_user),

        .axi_ar_ready_i                 (axi_ar_ready),
        .axi_ar_valid_o                 (axi_ar_valid),
        .axi_ar_addr_o                  (axi_ar_addr),
        .axi_ar_prot_o                  (axi_ar_prot),
        .axi_ar_id_o                    (axi_ar_id),
        .axi_ar_user_o                  (axi_ar_user),
        .axi_ar_len_o                   (axi_ar_len),
        .axi_ar_size_o                  (axi_ar_size),
        .axi_ar_burst_o                 (axi_ar_burst),
        .axi_ar_lock_o                  (axi_ar_lock),
        .axi_ar_cache_o                 (axi_ar_cache),
        .axi_ar_qos_o                   (axi_ar_qos),
        
        .axi_r_ready_o                  (axi_r_ready),
        .axi_r_valid_i                  (axi_r_valid),
        .axi_r_resp_i                   (axi_r_resp),
        .axi_r_data_i                   (axi_r_data),
        .axi_r_last_i                   (axi_r_last),
        .axi_r_id_i                     (axi_r_id),
        .axi_r_user_i                   (axi_r_user)
    );

////////////////////////////////////////////////
// 1 -> 2
////////////////////////////////////////////////
ysyx_210133_axi_split#(
    // .RW_DATA_WIDTH     ( 64 ),
    // .RW_ADDR_WIDTH     ( 64 ),
    .AXI_DATA_WIDTH    ( 64 ),
    .AXI_ADDR_WIDTH    ( 32 ),
    .AXI_ID_WIDTH      ( 4 ),
    .AXI_USER_WIDTH    ( 1 )
)u_axi_split(
    .clk               ( clock               ),
    .rst               ( reset               ),
    //slave port
    .axi_aw_ready_s_o  ( axi_aw_ready  ),
    .axi_aw_valid_s_i  ( axi_aw_valid  ),
    .axi_aw_addr_s_i   ( axi_aw_addr    ),
    .axi_aw_prot_s_i   ( axi_aw_prot    ),
    .axi_aw_id_s_i     ( axi_aw_id      ),
    .axi_aw_user_s_i   ( axi_aw_user    ),
    .axi_aw_len_s_i    ( axi_aw_len     ),
    .axi_aw_size_s_i   ( axi_aw_size    ),
    .axi_aw_burst_s_i  ( axi_aw_burst   ),
    .axi_aw_lock_s_i   ( axi_aw_lock    ),
    .axi_aw_cache_s_i  ( axi_aw_cache   ),
    .axi_aw_qos_s_i    ( axi_aw_qos     ),
    .axi_w_ready_s_o   ( axi_w_ready   ),
    .axi_w_valid_s_i   ( axi_w_valid   ),
    .axi_w_data_s_i    ( axi_w_data    ),
    .axi_w_strb_s_i    ( axi_w_strb    ),
    .axi_w_last_s_i    ( axi_w_last    ),
    .axi_w_id_s_i      ( axi_w_id      ),
    .axi_b_ready_s_i   ( axi_b_ready   ),
    .axi_b_valid_s_o   ( axi_b_valid   ),
    .axi_b_resp_s_o    ( axi_b_resp    ),
    .axi_b_id_s_o      ( axi_b_id      ),
    .axi_b_user_s_o    ( axi_b_user    ),
    .axi_ar_ready_s_o  ( axi_ar_ready  ),
    .axi_ar_valid_s_i  ( axi_ar_valid  ),
    .axi_ar_addr_s_i   ( axi_ar_addr   ),
    .axi_ar_prot_s_i   ( axi_ar_prot   ),
    .axi_ar_id_s_i     ( axi_ar_id     ),
    .axi_ar_user_s_i   ( axi_ar_user   ),
    .axi_ar_len_s_i    ( axi_ar_len    ),
    .axi_ar_size_s_i   ( axi_ar_size   ),
    .axi_ar_burst_s_i  ( axi_ar_burst  ),
    .axi_ar_lock_s_i   ( axi_ar_lock   ),
    .axi_ar_cache_s_i  ( axi_ar_cache  ),
    .axi_ar_qos_s_i    ( axi_ar_qos    ),
    .axi_r_ready_s_i   ( axi_r_ready   ),
    .axi_r_valid_s_o   ( axi_r_valid   ),
    .axi_r_resp_s_o    ( axi_r_resp    ),
    .axi_r_data_s_o    ( axi_r_data    ),
    .axi_r_last_s_o    ( axi_r_last    ),
    .axi_r_id_s_o      ( axi_r_id      ),
    .axi_r_user_s_o    ( axi_r_user    ),
//master 1, output
    .axi_aw_ready_m1_i ( io_master_awready ),
    .axi_aw_valid_m1_o ( io_master_awvalid ),
    .axi_aw_addr_m1_o  ( io_master_awaddr  ),
    .axi_aw_prot_m1_o  ( io_master_awprot  ),
    .axi_aw_id_m1_o    ( io_master_awid    ),
    .axi_aw_user_m1_o  ( io_master_awuser  ),
    .axi_aw_len_m1_o   ( io_master_awlen   ),
    .axi_aw_size_m1_o  ( io_master_awsize  ),
    .axi_aw_burst_m1_o ( io_master_awburst ),
    .axi_aw_lock_m1_o  ( io_master_awlock  ),
    .axi_aw_cache_m1_o ( io_master_awcache ),
    .axi_aw_qos_m1_o   ( io_master_awqos   ),
    .axi_w_ready_m1_i  ( io_master_wready  ),
    .axi_w_valid_m1_o  ( io_master_wvalid  ),
    .axi_w_data_m1_o   ( io_master_wdata   ),
    .axi_w_strb_m1_o   ( io_master_wstrb   ),
    .axi_w_last_m1_o   ( io_master_wlast   ),
    .axi_w_id_m1_o     ( io_master_wid     ),
    .axi_b_ready_m1_o  ( io_master_bready  ),
    .axi_b_valid_m1_i  ( io_master_bvalid  ),
    .axi_b_resp_m1_i   ( io_master_bresp   ),
    .axi_b_id_m1_i     ( io_master_bid     ),
    .axi_b_user_m1_i   ( io_master_buser   ),
    .axi_ar_ready_m1_i ( io_master_arready ),
    .axi_ar_valid_m1_o ( io_master_arvalid ),
    .axi_ar_addr_m1_o  ( io_master_araddr  ),
    .axi_ar_prot_m1_o  ( io_master_arprot  ),
    .axi_ar_id_m1_o    ( io_master_arid    ),
    .axi_ar_user_m1_o  ( io_master_aruser  ),
    .axi_ar_len_m1_o   ( io_master_arlen   ),
    .axi_ar_size_m1_o  ( io_master_arsize  ),
    .axi_ar_burst_m1_o ( io_master_arburst ),
    .axi_ar_lock_m1_o  ( io_master_arlock  ),
    .axi_ar_cache_m1_o ( io_master_arcache ),
    .axi_ar_qos_m1_o   ( io_master_arqos   ),
    .axi_r_ready_m1_o  ( io_master_rready  ),
    .axi_r_valid_m1_i  ( io_master_rvalid  ),
    .axi_r_resp_m1_i   ( io_master_rresp   ),
    .axi_r_data_m1_i   ( io_master_rdata   ),
    .axi_r_last_m1_i   ( io_master_rlast   ),
    .axi_r_id_m1_i     ( io_master_rid     ),
    .axi_r_user_m1_i   ( io_master_ruser   ),
//master 2, to clint
    .axi_aw_ready_m2_i ( clint_aw_ready ),
    .axi_aw_valid_m2_o ( clint_aw_valid ),
    .axi_aw_addr_m2_o  ( clint_aw_addr  ),
    .axi_aw_prot_m2_o  ( clint_aw_prot  ),
    .axi_w_ready_m2_i  ( clint_w_ready  ),
    .axi_w_valid_m2_o  ( clint_w_valid  ),
    .axi_w_data_m2_o   ( clint_w_data   ),
    .axi_w_strb_m2_o   ( clint_w_strb   ),
    .axi_b_ready_m2_o  ( clint_b_ready  ),
    .axi_b_valid_m2_i  ( clint_b_valid  ),
    .axi_b_resp_m2_i   ( clint_b_resp   ),
    .axi_ar_ready_m2_i ( clint_ar_ready ),
    .axi_ar_valid_m2_o ( clint_ar_valid ),
    .axi_ar_addr_m2_o  ( clint_ar_addr  ),
    .axi_ar_prot_m2_o  ( clint_ar_prot  ),
    .axi_r_ready_m2_o  ( clint_r_ready  ),
    .axi_r_valid_m2_i  ( clint_r_valid  ),
    .axi_r_resp_m2_i   ( clint_r_resp   ),
    .axi_r_data_m2_i   ( clint_r_data   )
);

////////////////////////////////////////////////
// clint 
////////////////////////////////////////////////
	ysyx_210133_clint_bus clint (
    .timr_irq(clint_timr_intr),
		.S_AXI_ACLK(clock),
		.S_AXI_ARESET(reset),

		.S_AXI_AWADDR(clint_aw_addr),
		.S_AXI_AWPROT(clint_aw_prot),
		.S_AXI_AWVALID(clint_aw_valid),
		.S_AXI_AWREADY(clint_aw_ready),

		.S_AXI_WDATA(clint_w_data),
		.S_AXI_WSTRB(clint_w_strb),
		.S_AXI_WVALID(clint_w_valid),
		.S_AXI_WREADY(clint_w_ready),

		.S_AXI_BRESP(clint_b_resp),
		.S_AXI_BVALID(clint_b_valid),
		.S_AXI_BREADY(clint_b_ready),

		.S_AXI_ARADDR(clint_ar_addr),
		.S_AXI_ARPROT(clint_ar_prot),
		.S_AXI_ARVALID(clint_ar_valid),
		.S_AXI_ARREADY(clint_ar_ready),

		.S_AXI_RDATA(clint_r_data),
		.S_AXI_RRESP(clint_r_resp),
		.S_AXI_RVALID(clint_r_valid),
		.S_AXI_RREADY(clint_r_ready)
	);

endmodule


module ysyx_210133_axi_rw # (
    parameter RW_DATA_WIDTH     = 64,
    parameter AXI_DATA_WIDTH    = 64,
    parameter AXI_ADDR_WIDTH    = 32,
    parameter AXI_ID_WIDTH      = 4,
    parameter AXI_USER_WIDTH    = 1
)(
    input                               clock,
    input                               reset,

	//input waddr_valid_i,
    //input raddr_valid_i,
    input                               rw_valid_i,
	output                              rw_ready_o,
    input                               rw_req_i,
    output reg [RW_DATA_WIDTH-1:0]      data_read_o,
    input  [RW_DATA_WIDTH-1:0]          data_write_i,
    input  [RW_DATA_WIDTH/8-1:0]        data_mask_i,
    input  [63:0]         rw_addr_i,
    input  [1:0]                        rw_size_i,
    //output [1:0]                        rw_resp_o,

    // Advanced eXtensible Interface
    input                               axi_aw_ready_i,
    output                              axi_aw_valid_o,
    output [AXI_ADDR_WIDTH-1:0]         axi_aw_addr_o,
    output [2:0]                        axi_aw_prot_o,
    output [AXI_ID_WIDTH-1:0]           axi_aw_id_o,
    output [AXI_USER_WIDTH-1:0]         axi_aw_user_o,
    output [7:0]                        axi_aw_len_o,
    output [2:0]                        axi_aw_size_o,
    output [1:0]                        axi_aw_burst_o,
    output                              axi_aw_lock_o,
    output [3:0]                        axi_aw_cache_o,
    output [3:0]                        axi_aw_qos_o,

    input                               axi_w_ready_i,
    output                              axi_w_valid_o,
    output [AXI_DATA_WIDTH-1:0]         axi_w_data_o,
    output [AXI_DATA_WIDTH/8-1:0]       axi_w_strb_o,
    output                              axi_w_last_o,
    output [AXI_ID_WIDTH-1:0]           axi_w_id_o,
    
    output                              axi_b_ready_o,
    input                               axi_b_valid_i,
    input  [1:0]                        axi_b_resp_i,
    input  [AXI_ID_WIDTH-1:0]           axi_b_id_i,
    input  [AXI_USER_WIDTH-1:0]         axi_b_user_i,

    input                               axi_ar_ready_i,
    output                              axi_ar_valid_o,
    output [AXI_ADDR_WIDTH-1:0]         axi_ar_addr_o,
    output [2:0]                        axi_ar_prot_o,
    output [AXI_ID_WIDTH-1:0]           axi_ar_id_o,
    output [AXI_USER_WIDTH-1:0]         axi_ar_user_o,
    output [7:0]                        axi_ar_len_o,
    output [2:0]                        axi_ar_size_o,
    output [1:0]                        axi_ar_burst_o,
    output                              axi_ar_lock_o,
    output [3:0]                        axi_ar_cache_o,
    output [3:0]                        axi_ar_qos_o,
    
    output                              axi_r_ready_o,
    input                               axi_r_valid_i,
    input  [1:0]                        axi_r_resp_i,
    input  [AXI_DATA_WIDTH-1:0]         axi_r_data_i,
    input                               axi_r_last_i,
    input  [AXI_ID_WIDTH-1:0]           axi_r_id_i,
    input  [AXI_USER_WIDTH-1:0]         axi_r_user_i
);

    wire w_trans    = rw_req_i == `YSYX210133_REQ_WRITE;
    wire r_trans    = rw_req_i == `YSYX210133_REQ_READ;
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

    reg rw_ready, trans_done_r;

    localparam ALIGNED_WIDTH = $clog2(AXI_DATA_WIDTH / 8);
    localparam OFFSET_WIDTH  = $clog2(AXI_DATA_WIDTH);
    //parameter AXI_SIZE      = $clog2(AXI_DATA_WIDTH / 8);
    localparam MASK_WIDTH    = AXI_DATA_WIDTH * 2;
    localparam TRANS_LEN     = RW_DATA_WIDTH / AXI_DATA_WIDTH;

    wire aligned            = TRANS_LEN != 1 | rw_addr_i[ALIGNED_WIDTH-1:0] == 0;
    wire size_b             = rw_size_i == `YSYX210133_SIZE_B;
    wire size_h             = rw_size_i == `YSYX210133_SIZE_H;
    wire size_w             = rw_size_i == `YSYX210133_SIZE_W;
    wire size_d             = rw_size_i == `YSYX210133_SIZE_D;
    wire [3:0] addr_op1     = {{4-ALIGNED_WIDTH{1'b0}}, rw_addr_i[ALIGNED_WIDTH-1:0]};
    wire [3:0] addr_op2     = ({4{size_b}} & {4'b0})
                                | ({4{size_h}} & {4'b1})
                                | ({4{size_w}} & {4'b11})
                                | ({4{size_d}} & {4'b111})
                                ;
    wire [3:0] addr_end     = addr_op1 + addr_op2;
    wire overstep           = addr_end[3:ALIGNED_WIDTH] != 0;

    wire [7:0] axi_len      = aligned ? TRANS_LEN - 1 : {{7{1'b0}}, overstep};
    
    // ------------------State Machine------------------
    localparam [1:0] W_STATE_IDLE = 2'b00, W_STATE_ADDR = 2'b01, W_STATE_WRITE = 2'b10, W_STATE_RESP = 2'b11;
    localparam [1:0] R_STATE_IDLE = 2'b00, R_STATE_ADDR = 2'b01, R_STATE_READ  = 2'b10;

    reg [1:0] w_state, r_state;
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
                    W_STATE_RESP:  if (trans_done_r)    w_state <= W_STATE_IDLE;
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
                    // only happen when if tries to fetch instruction
                    // address only valid at certain time
                    // R_STATE_IDLE: if (raddr_valid_i)  r_state <= R_STATE_ADDR;
                    R_STATE_IDLE: r_state <= R_STATE_ADDR;
                    R_STATE_ADDR: if (ar_hs)    r_state <= R_STATE_READ;
                    R_STATE_READ: if (trans_done_r)   r_state <= R_STATE_IDLE;
                    default:;
                endcase
            end
            else// when mem_stall==1, r_valid = 0
                case (r_state)
                    R_STATE_ADDR: if (ar_hs)    r_state <= R_STATE_READ;
                    R_STATE_READ: if (trans_done_r)   r_state <= R_STATE_IDLE;
                    default:;
                endcase
        end
    end


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


    // ------------------Process Data------------------
    //wire [2:0] axi_size     = AXI_SIZE[2:0];
       wire [2:0] axi_size     = 3'b000 & {3{size_b}}
                            | 3'b001 & {3{size_h}}
                            | 3'b010 & {3{size_w}}
                            | 3'b011 & {3{size_d}};
    //wire [AXI_ADDR_WIDTH-1:0] axi_addr    = {rw_addr_i[AXI_ADDR_WIDTH-1:ALIGNED_WIDTH], {ALIGNED_WIDTH{1'b0}}};
    wire [OFFSET_WIDTH-1:0] aligned_offset_l    = {{OFFSET_WIDTH-ALIGNED_WIDTH{1'b0}}, {rw_addr_i[ALIGNED_WIDTH-1:0]}} << 3;
    wire [31:0] aligned_offset_h_tmp    = AXI_DATA_WIDTH - {25'b0,aligned_offset_l};
    wire [OFFSET_WIDTH-1:0] aligned_offset_h = aligned_offset_h_tmp[OFFSET_WIDTH-1:0];
    wire [MASK_WIDTH-1:0] mask                  = (({MASK_WIDTH{size_b}} & {{MASK_WIDTH-8{1'b0}}, 8'hff})
                                                    | ({MASK_WIDTH{size_h}} & {{MASK_WIDTH-16{1'b0}}, 16'hffff})
                                                    | ({MASK_WIDTH{size_w}} & {{MASK_WIDTH-32{1'b0}}, 32'hffffffff})
                                                    | ({MASK_WIDTH{size_d}} & {{MASK_WIDTH-64{1'b0}}, 64'hffffffff_ffffffff})
                                                    ) << aligned_offset_l;
    wire [AXI_DATA_WIDTH-1:0] mask_l      = mask[AXI_DATA_WIDTH-1:0];
    wire [AXI_DATA_WIDTH-1:0] mask_h      = mask[MASK_WIDTH-1:AXI_DATA_WIDTH];

    wire [AXI_ID_WIDTH-1:0] axi_id        = {AXI_ID_WIDTH{1'b0}};
    wire [AXI_USER_WIDTH-1:0] axi_user    = {AXI_USER_WIDTH{1'b0}};

    wire rw_ready_nxt = trans_done;
    wire rw_ready_en      = trans_done | rw_ready;
    always @(posedge clock) begin
        if (reset) begin
            rw_ready <= 0;
            trans_done_r <= 0;
        end
        else if (rw_ready_en) begin
            rw_ready <= rw_ready_nxt;
            trans_done_r <= trans_done;
        end
    end
    assign rw_ready_o     = rw_ready;

    // Transaction implement
    // in this case, TRANS_LEN===1
    // ------------------Write Transaction------------------
    assign axi_aw_valid_o   = w_state_addr;
    assign axi_aw_addr_o    = rw_addr_i[31:0];//axi_addr;
    assign axi_aw_prot_o    = `YSYX210133_AXI_PROT_UNPRIVILEGED_ACCESS | `YSYX210133_AXI_PROT_SECURE_ACCESS | `YSYX210133_AXI_PROT_DATA_ACCESS;
    assign axi_aw_id_o      = axi_id;
    assign axi_aw_user_o    = axi_user;
    assign axi_aw_len_o     = axi_len;
    assign axi_aw_size_o    = axi_size;
    assign axi_aw_burst_o   = `YSYX210133_AXI_BURST_TYPE_INCR;
    assign axi_aw_lock_o    = 1'b0;
    assign axi_aw_cache_o   = `YSYX210133_AXI_ARCACHE_NORMAL_NON_CACHEABLE_NON_BUFFERABLE;
    assign axi_aw_qos_o     = 4'h0;

    assign axi_w_valid_o    = w_state_write;
    assign axi_w_data_o     = data_write_i;
    assign axi_w_strb_o     = data_mask_i;
    assign axi_w_last_o     = (len == 8'b0) & axi_w_ready_i;//write burst always 1
    assign axi_w_id_o       = 4'h0;

    assign axi_b_ready_o = w_state_resp;

    
    // ------------------Read Transaction------------------

    // Read address channel signals
    assign axi_ar_valid_o   = r_state_addr;
    assign axi_ar_addr_o    = rw_addr_i[31:0];//axi_addr;
    assign axi_ar_prot_o    = `YSYX210133_AXI_PROT_UNPRIVILEGED_ACCESS | `YSYX210133_AXI_PROT_SECURE_ACCESS | `YSYX210133_AXI_PROT_DATA_ACCESS;
    assign axi_ar_id_o      = axi_id;
    assign axi_ar_user_o    = axi_user;
    assign axi_ar_len_o     = axi_len;
    assign axi_ar_size_o    = axi_size;
    assign axi_ar_burst_o   = `YSYX210133_AXI_BURST_TYPE_INCR;
    assign axi_ar_lock_o    = 1'b0;
    assign axi_ar_cache_o   = `YSYX210133_AXI_ARCACHE_NORMAL_NON_CACHEABLE_NON_BUFFERABLE;
    assign axi_ar_qos_o     = 4'h0;

    // Read data channel signals
    assign axi_r_ready_o    = r_state_read;

    wire [AXI_DATA_WIDTH-1:0] axi_r_data_l  = (axi_r_data_i & mask_l) >> aligned_offset_l;
    wire [AXI_DATA_WIDTH-1:0] axi_r_data_h  = (axi_r_data_i & mask_h) << aligned_offset_h;


    always @(posedge clock) begin
        if (reset) begin
            data_read_o[0+:AXI_DATA_WIDTH] <= 0;
        end
        else if (axi_r_ready_o & axi_r_valid_i) begin
            if (~aligned & overstep) begin
                if (len[0]) begin
                    data_read_o[AXI_DATA_WIDTH-1:0] <= data_read_o[AXI_DATA_WIDTH-1:0] | axi_r_data_h;
                end
                else begin
                    data_read_o[AXI_DATA_WIDTH-1:0] <= axi_r_data_l;
                end
            end
            else if (len == 0) begin
                data_read_o[0+:AXI_DATA_WIDTH] <= axi_r_data_l;
            end
        end
    end

endmodule

module ysyx_210133_axi_ro # (
    parameter RW_DATA_WIDTH     = 64,
    parameter AXI_DATA_WIDTH    = 64,
    parameter AXI_ADDR_WIDTH    = 32,
    parameter AXI_ID_WIDTH      = 4,
    parameter AXI_USER_WIDTH    = 1
)(
    input                               clock,
    input                               reset,

	//input waddr_valid_i,
    input rw_valid_i,
	output                              rw_ready_o,
    input                               rw_req_i,
    output reg [RW_DATA_WIDTH-1:0]      data_read_o,
    input  [AXI_DATA_WIDTH-1:0]         rw_addr_i,
    input  [1:0]                        rw_size_i,
    output [1:0]                        rw_resp_o,

    // Advanced eXtensible Interface
    input                               axi_ar_ready_i,
    output                              axi_ar_valid_o,
    output [AXI_ADDR_WIDTH-1:0]         axi_ar_addr_o,
    output [2:0]                        axi_ar_prot_o,
    output [AXI_ID_WIDTH-1:0]           axi_ar_id_o,
    output [AXI_USER_WIDTH-1:0]         axi_ar_user_o,
    output [7:0]                        axi_ar_len_o,
    output [2:0]                        axi_ar_size_o,
    output [1:0]                        axi_ar_burst_o,
    output                              axi_ar_lock_o,
    output [3:0]                        axi_ar_cache_o,
    output [3:0]                        axi_ar_qos_o,
    
    output                              axi_r_ready_o,
    input                               axi_r_valid_i,
    input  [1:0]                        axi_r_resp_i,
    input  [AXI_DATA_WIDTH-1:0]         axi_r_data_i,
    input                               axi_r_last_i,
    input  [AXI_ID_WIDTH-1:0]           axi_r_id_i,
    input  [AXI_USER_WIDTH-1:0]         axi_r_user_i
);

    wire r_trans    = rw_req_i == `YSYX210133_REQ_READ;
    wire r_valid    = rw_valid_i & r_trans;

    // handshake
    wire ar_hs      = axi_ar_ready_i & axi_ar_valid_o;
    wire r_hs       = axi_r_ready_o  & axi_r_valid_i;

    wire r_done     = r_hs & axi_r_last_i;
    wire trans_done = r_done;

    
    reg rw_ready, trans_done_r;
    localparam ALIGNED_WIDTH = $clog2(AXI_DATA_WIDTH / 8)-1;
    localparam OFFSET_WIDTH  = $clog2(AXI_DATA_WIDTH);
    //parameter AXI_SIZE      = $clog2(AXI_DATA_WIDTH / 8);
    localparam MASK_WIDTH    = AXI_DATA_WIDTH * 2;
    localparam TRANS_LEN     = RW_DATA_WIDTH / AXI_DATA_WIDTH;

    wire aligned            = TRANS_LEN != 1 | rw_addr_i[ALIGNED_WIDTH-1:0] == 0;
    wire size_b             = rw_size_i == `YSYX210133_SIZE_B;
    wire size_h             = rw_size_i == `YSYX210133_SIZE_H;
    wire size_w             = rw_size_i == `YSYX210133_SIZE_W;
    wire size_d             = rw_size_i == `YSYX210133_SIZE_D;
    wire [3:0] addr_op1     = {{4-ALIGNED_WIDTH{1'b0}}, rw_addr_i[ALIGNED_WIDTH-1:0]};
    wire [3:0] addr_op2     = ({4{size_b}} & {4'b0})
                                | ({4{size_h}} & {4'b1})
                                | ({4{size_w}} & {4'b11})
                                | ({4{size_d}} & {4'b111})
                                ;
    wire [3:0] addr_end     = addr_op1 + addr_op2;
    wire overstep           = addr_end[3:ALIGNED_WIDTH] != 0;

    wire [7:0] axi_len      = aligned ? TRANS_LEN - 1 : {{7{1'b0}}, overstep};
    // ------------------State Machine------------------
    localparam [1:0] R_STATE_IDLE = 2'b00, R_STATE_ADDR = 2'b01, R_STATE_READ  = 2'b10;

    reg [1:0] r_state;wire r_state_idle = r_state == R_STATE_IDLE, r_state_addr = r_state == R_STATE_ADDR, r_state_read  = r_state == R_STATE_READ;

    // Read State Machine
    always @(posedge clock) begin
        if (reset) begin
            r_state <= R_STATE_IDLE;
        end
        else begin
            if (r_valid) begin
                case (r_state)
                    // only happen when if tries to fetch instruction
                    // address only valid at certain time
                    // R_STATE_IDLE: if (raddr_valid_i)  r_state <= R_STATE_ADDR;
                    R_STATE_IDLE: r_state <= R_STATE_ADDR;
                    R_STATE_ADDR: if (ar_hs)    r_state <= R_STATE_READ;
                    R_STATE_READ: if (trans_done_r)   r_state <= R_STATE_IDLE;
                    default:;
                endcase
            end
            else// when mem_stall==1, r_valid = 0
                case (r_state)
                    R_STATE_ADDR: if (ar_hs)    r_state <= R_STATE_READ;
                    R_STATE_READ: if (trans_done_r)   r_state <= R_STATE_IDLE;
                    default:;
                endcase
        end
    end


    // ------------------Number of transmission------------------
    reg [7:0] len;
    wire len_reset      = reset | (r_trans & r_state_idle);
    wire len_incr_en    = (len != axi_len) & (r_hs);
    always @(posedge clock) begin
        if (len_reset) begin
            len <= 0;
        end
        else if (len_incr_en) begin
            len <= len + 1;
        end
    end


    // ------------------Process Data------------------
    //wire [2:0] axi_size     = AXI_SIZE[2:0];
    //wire [AXI_ADDR_WIDTH-1:0] axi_addr    = {rw_addr_i[AXI_ADDR_WIDTH-1:ALIGNED_WIDTH], {ALIGNED_WIDTH{1'b0}}};
    wire [OFFSET_WIDTH-1:0] aligned_offset_l    = {{OFFSET_WIDTH-ALIGNED_WIDTH{1'b0}}, {rw_addr_i[ALIGNED_WIDTH-1:0]}} << 3;
    wire [31:0] aligned_offset_h_tmp    = AXI_DATA_WIDTH - {25'b0,aligned_offset_l};
    wire [OFFSET_WIDTH-1:0] aligned_offset_h = aligned_offset_h_tmp[OFFSET_WIDTH-1:0];
    wire [MASK_WIDTH-1:0] mask                  = (({MASK_WIDTH{size_b}} & {{MASK_WIDTH-8{1'b0}}, 8'hff})
                                                    | ({MASK_WIDTH{size_h}} & {{MASK_WIDTH-16{1'b0}}, 16'hffff})
                                                    | ({MASK_WIDTH{size_w}} & {{MASK_WIDTH-32{1'b0}}, 32'hffffffff})
                                                    | ({MASK_WIDTH{size_d}} & {{MASK_WIDTH-64{1'b0}}, 64'hffffffff_ffffffff})
                                                    ) << aligned_offset_l;
    wire [AXI_DATA_WIDTH-1:0] mask_l      = mask[AXI_DATA_WIDTH-1:0];
    wire [AXI_DATA_WIDTH-1:0] mask_h      = mask[MASK_WIDTH-1:AXI_DATA_WIDTH];

    wire [AXI_ID_WIDTH-1:0] axi_id        = {AXI_ID_WIDTH{1'b0}};
    wire [AXI_USER_WIDTH-1:0] axi_user    = {AXI_USER_WIDTH{1'b0}};

    wire rw_ready_nxt = trans_done;
    wire rw_ready_en      = trans_done | rw_ready;
    always @(posedge clock) begin
        if (reset) begin
            rw_ready <= 0;
            trans_done_r <= 0;
        end
        else if (rw_ready_en) begin
            rw_ready <= rw_ready_nxt;
            trans_done_r <= trans_done;
        end
    end
    assign rw_ready_o     = rw_ready;

    reg [1:0] rw_resp;
    wire [1:0] rw_resp_nxt = axi_r_resp_i;
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
    
    // ------------------Read Transaction------------------

    // Read address channel signals
    assign axi_ar_valid_o   = r_state_addr;
    assign axi_ar_addr_o    = rw_addr_i[31:0];//axi_addr;
    assign axi_ar_prot_o    = `YSYX210133_AXI_PROT_UNPRIVILEGED_ACCESS | `YSYX210133_AXI_PROT_SECURE_ACCESS | `YSYX210133_AXI_PROT_DATA_ACCESS;
    assign axi_ar_id_o      = axi_id;
    assign axi_ar_user_o    = axi_user;
    assign axi_ar_len_o     = axi_len;
    assign axi_ar_size_o    = 3'b10;
    assign axi_ar_burst_o   = `YSYX210133_AXI_BURST_TYPE_INCR;
    assign axi_ar_lock_o    = 1'b0;
    assign axi_ar_cache_o   = `YSYX210133_AXI_ARCACHE_NORMAL_NON_CACHEABLE_NON_BUFFERABLE;
    assign axi_ar_qos_o     = 4'h0;

    // Read data channel signals
    assign axi_r_ready_o    = r_state_read;

    wire [AXI_DATA_WIDTH-1:0] axi_r_data_l  = (axi_r_data_i & mask_l) >> aligned_offset_l;
    wire [AXI_DATA_WIDTH-1:0] axi_r_data_h  = (axi_r_data_i & mask_h) << aligned_offset_h;


    always @(posedge clock) begin
        if (reset) begin
            data_read_o[0+:AXI_DATA_WIDTH] <= 0;
        end
        else if (axi_r_ready_o & axi_r_valid_i) begin
            if (~aligned & overstep) begin
                if (len[0]) begin
                    data_read_o[AXI_DATA_WIDTH-1:0] <= data_read_o[AXI_DATA_WIDTH-1:0] | axi_r_data_h;
                end
                else begin
                    data_read_o[AXI_DATA_WIDTH-1:0] <= axi_r_data_l;
                end
            end
            else if (len == 0) begin
                data_read_o[0+:AXI_DATA_WIDTH] <= axi_r_data_l;
            end
        end
    end

endmodule

module ysyx_210133_axi_split # (
    parameter AXI_DATA_WIDTH    = 64,
    parameter AXI_ADDR_WIDTH    = 32,
    parameter AXI_ID_WIDTH      = 4,
    parameter AXI_USER_WIDTH    = 1
)(
    input                               clk,
    input                               rst,

    // AXI-full Slave
    output                               axi_aw_ready_s_o,
    input                              axi_aw_valid_s_i,
    input [AXI_ADDR_WIDTH-1:0]         axi_aw_addr_s_i,
    input [2:0]                        axi_aw_prot_s_i,
    input [AXI_ID_WIDTH-1:0]           axi_aw_id_s_i,
    input [AXI_USER_WIDTH-1:0]         axi_aw_user_s_i,
    input [7:0]                        axi_aw_len_s_i,
    input [2:0]                        axi_aw_size_s_i,
    input [1:0]                        axi_aw_burst_s_i,
    input                              axi_aw_lock_s_i,
    input [3:0]                        axi_aw_cache_s_i,
    input [3:0]                        axi_aw_qos_s_i,

    output                               axi_w_ready_s_o,
    input                              axi_w_valid_s_i,
    input [AXI_DATA_WIDTH-1:0]         axi_w_data_s_i,
    input [AXI_DATA_WIDTH/8-1:0]       axi_w_strb_s_i,
    input                              axi_w_last_s_i,
    input [AXI_ID_WIDTH-1:0]           axi_w_id_s_i,
    
    input                              axi_b_ready_s_i,
    output                               axi_b_valid_s_o,
    output  [1:0]                        axi_b_resp_s_o,
    output  [AXI_ID_WIDTH-1:0]           axi_b_id_s_o,
    output  [AXI_USER_WIDTH-1:0]         axi_b_user_s_o,

    output                               axi_ar_ready_s_o,
    input                              axi_ar_valid_s_i,
    input [AXI_ADDR_WIDTH-1:0]         axi_ar_addr_s_i,
    input [2:0]                        axi_ar_prot_s_i,
    input [AXI_ID_WIDTH-1:0]           axi_ar_id_s_i,
    input [AXI_USER_WIDTH-1:0]         axi_ar_user_s_i,
    input [7:0]                        axi_ar_len_s_i,
    input [2:0]                        axi_ar_size_s_i,
    input [1:0]                        axi_ar_burst_s_i,
    input                              axi_ar_lock_s_i,
    input [3:0]                        axi_ar_cache_s_i,
    input [3:0]                        axi_ar_qos_s_i,
    
    input                              axi_r_ready_s_i,
    output                               axi_r_valid_s_o,
    output  [1:0]                        axi_r_resp_s_o,
    output  [AXI_DATA_WIDTH-1:0]         axi_r_data_s_o,
    output                               axi_r_last_s_o,
    output  [AXI_ID_WIDTH-1:0]           axi_r_id_s_o,
    output  [AXI_USER_WIDTH-1:0]         axi_r_user_s_o,

    // AXI-full Master1
    input                               axi_aw_ready_m1_i,
    output                              axi_aw_valid_m1_o,
    output [AXI_ADDR_WIDTH-1:0]         axi_aw_addr_m1_o,
    output [2:0]                        axi_aw_prot_m1_o,
    output [AXI_ID_WIDTH-1:0]           axi_aw_id_m1_o,
    output [AXI_USER_WIDTH-1:0]         axi_aw_user_m1_o,
    output [7:0]                        axi_aw_len_m1_o,
    output [2:0]                        axi_aw_size_m1_o,
    output [1:0]                        axi_aw_burst_m1_o,
    output                              axi_aw_lock_m1_o,
    output [3:0]                        axi_aw_cache_m1_o,
    output [3:0]                        axi_aw_qos_m1_o,

    input                               axi_w_ready_m1_i,
    output                              axi_w_valid_m1_o,
    output [AXI_DATA_WIDTH-1:0]         axi_w_data_m1_o,
    output [AXI_DATA_WIDTH/8-1:0]       axi_w_strb_m1_o,
    output                              axi_w_last_m1_o,
    output [AXI_ID_WIDTH-1:0]           axi_w_id_m1_o,
    
    output                              axi_b_ready_m1_o,
    input                               axi_b_valid_m1_i,
    input  [1:0]                        axi_b_resp_m1_i,
    input  [AXI_ID_WIDTH-1:0]           axi_b_id_m1_i,
    input  [AXI_USER_WIDTH-1:0]         axi_b_user_m1_i,

    input                               axi_ar_ready_m1_i,
    output                              axi_ar_valid_m1_o,
    output [AXI_ADDR_WIDTH-1:0]         axi_ar_addr_m1_o,
    output [2:0]                        axi_ar_prot_m1_o,
    output [AXI_ID_WIDTH-1:0]           axi_ar_id_m1_o,
    output [AXI_USER_WIDTH-1:0]         axi_ar_user_m1_o,
    output [7:0]                        axi_ar_len_m1_o,
    output [2:0]                        axi_ar_size_m1_o,
    output [1:0]                        axi_ar_burst_m1_o,
    output                              axi_ar_lock_m1_o,
    output [3:0]                        axi_ar_cache_m1_o,
    output [3:0]                        axi_ar_qos_m1_o,
    
    output                              axi_r_ready_m1_o,
    input                               axi_r_valid_m1_i,
    input  [1:0]                        axi_r_resp_m1_i,
    input  [AXI_DATA_WIDTH-1:0]         axi_r_data_m1_i,
    input                               axi_r_last_m1_i,
    input  [AXI_ID_WIDTH-1:0]           axi_r_id_m1_i,
    input  [AXI_USER_WIDTH-1:0]         axi_r_user_m1_i,
    
    // AXI-lite Master2
    input                               axi_aw_ready_m2_i,
    output                              axi_aw_valid_m2_o,
    output [15:0]         axi_aw_addr_m2_o,
    output [2:0]                        axi_aw_prot_m2_o,

    input                               axi_w_ready_m2_i,
    output                              axi_w_valid_m2_o,
    output [AXI_DATA_WIDTH-1:0]         axi_w_data_m2_o,
    output [AXI_DATA_WIDTH/8-1:0]       axi_w_strb_m2_o,
    
    output                              axi_b_ready_m2_o,
    input                               axi_b_valid_m2_i,
    input  [1:0]                        axi_b_resp_m2_i,

    input                               axi_ar_ready_m2_i,
    output                              axi_ar_valid_m2_o,
    output [15:0]         axi_ar_addr_m2_o,
    output [2:0]                        axi_ar_prot_m2_o,
    
    output                              axi_r_ready_m2_o,
    input                               axi_r_valid_m2_i,
    input  [1:0]                        axi_r_resp_m2_i,
    input  [AXI_DATA_WIDTH-1:0]         axi_r_data_m2_i
    );

    wire [1:0] axi_split_rd_sel_tmp;
    assign axi_split_rd_sel_tmp[1] = axi_ar_addr_s_i[31:16] != 16'h0200;
    assign axi_split_rd_sel_tmp[0] = axi_ar_addr_s_i[31:16] == 16'h0200;

    wire [1:0] axi_split_wr_sel_tmp;
    assign axi_split_wr_sel_tmp[1] = axi_aw_addr_s_i[31:16] != 16'h0200;
    assign axi_split_wr_sel_tmp[0] = axi_aw_addr_s_i[31:16] == 16'h0200;

    reg [1:0] axi_split_wr_sel_reg, axi_split_rd_sel_reg;
    always @(posedge clk) begin
        if(rst == 1)
            axi_split_wr_sel_reg <= 0;
        else if(axi_aw_valid_s_i)
            axi_split_wr_sel_reg <= axi_split_wr_sel_tmp;
        else if(axi_b_ready_s_i & axi_b_valid_s_o)
            axi_split_wr_sel_reg <= 0;
    end

    always @(posedge clk) begin
        if(rst == 1)
            axi_split_rd_sel_reg <= 0;
        else if(axi_ar_valid_s_i)
            axi_split_rd_sel_reg <= axi_split_rd_sel_tmp;
        else if(axi_r_ready_s_i & axi_r_valid_s_o)
            axi_split_rd_sel_reg <= 0;
    end

    wire [1:0]axi_split_wr_sel = axi_aw_valid_s_i? axi_split_wr_sel_tmp : axi_split_wr_sel_reg;
    wire [1:0]axi_split_rd_sel = axi_ar_valid_s_i? axi_split_rd_sel_tmp : axi_split_rd_sel_reg;

    // wire [1:0] axi_split_rd_sel;
    // assign axi_split_rd_sel[1] = axi_aw_addr_s_i[63:16] != 48'h0000_0000_0200;
    // assign axi_split_rd_sel[0] = axi_ar_addr_s_i[63:16] == 48'h0000_0000_0200;

    // wire [1:0] axi_split_wr_sel;
    // assign axi_split_wr_sel[1] = axi_aw_addr_s_i[63:16] != 48'h0000_0000_0200;
    // assign axi_split_wr_sel[0] = axi_aw_addr_s_i[63:16] == 48'h0000_0000_0200;

// axi-lite output
    assign axi_aw_valid_m2_o    = axi_aw_valid_s_i          & axi_split_wr_sel[0];
    //assign axi_aw_addr_m2_o     = axi_aw_addr_s_i[15:0]     & {16{axi_split_wr_sel[0]}};
    assign axi_aw_addr_m2_o     = axi_aw_addr_s_i[15:0];
    assign axi_aw_prot_m2_o     = axi_aw_prot_s_i           & {3{axi_split_wr_sel[0]}};

    assign axi_w_valid_m2_o     = axi_w_valid_s_i           & axi_split_wr_sel[0];
    assign axi_w_data_m2_o      = axi_w_data_s_i            & {64{axi_split_wr_sel[0]}};
    assign axi_w_strb_m2_o      = axi_w_strb_s_i            & {8{axi_split_wr_sel[0]}};
    
    assign axi_b_ready_m2_o     = axi_b_ready_s_i           & axi_split_wr_sel[0];

    assign axi_ar_valid_m2_o    = axi_ar_valid_s_i          & axi_split_rd_sel[0];
    //assign axi_ar_addr_m2_o     = axi_ar_addr_s_i[15:0]     & {16{axi_split_rd_sel[0]}};
    assign axi_ar_addr_m2_o     = axi_ar_addr_s_i[15:0];
    assign axi_ar_prot_m2_o     = axi_ar_prot_s_i           & {3{axi_split_rd_sel[0]}};
    
    assign axi_r_ready_m2_o     = axi_r_ready_s_i           & axi_split_rd_sel[0];

// axi-full output
    assign axi_aw_valid_m1_o    = axi_aw_valid_s_i    & axi_split_wr_sel[1];
    //assign axi_aw_addr_m1_o     = axi_aw_addr_s_i     & {64{axi_split_wr_sel[1]}};
    assign axi_aw_addr_m1_o     = axi_aw_addr_s_i;
    assign axi_aw_prot_m1_o     = axi_aw_prot_s_i     & {3{axi_split_wr_sel[1]}};
    assign axi_aw_id_m1_o       = axi_aw_id_s_i;
    assign axi_aw_user_m1_o     = axi_aw_user_s_i;
    assign axi_aw_len_m1_o      = axi_aw_len_s_i;
    assign axi_aw_size_m1_o     = axi_aw_size_s_i;
    assign axi_aw_burst_m1_o    = axi_aw_burst_s_i;
    assign axi_aw_lock_m1_o     = axi_aw_lock_s_i;
    assign axi_aw_cache_m1_o    = axi_aw_cache_s_i;
    assign axi_aw_qos_m1_o      = axi_aw_qos_s_i;

    assign axi_w_valid_m1_o     = axi_w_valid_s_i           & axi_split_wr_sel[1];
    assign axi_w_data_m1_o      = axi_w_data_s_i            & {64{axi_split_wr_sel[1]}};
    assign axi_w_strb_m1_o      = axi_w_strb_s_i            & {8{axi_split_wr_sel[1]}};
    assign axi_w_last_m1_o      = axi_w_last_s_i;
    assign axi_w_id_m1_o        = axi_w_id_s_i;
    
    assign axi_b_ready_m1_o     = axi_b_ready_s_i           & axi_split_wr_sel[1];

    assign axi_ar_valid_m1_o    = axi_ar_valid_s_i    & axi_split_rd_sel[1];
    //assign axi_ar_addr_m1_o     = axi_ar_addr_s_i     & {64{axi_split_rd_sel[1]}};
    assign axi_ar_addr_m1_o     = axi_ar_addr_s_i;
    assign axi_ar_prot_m1_o     = axi_ar_prot_s_i     & {3{axi_split_rd_sel[1]}};
    assign axi_ar_id_m1_o       = axi_ar_id_s_i;
    assign axi_ar_user_m1_o     = axi_ar_user_s_i;
    assign axi_ar_len_m1_o      = axi_ar_len_s_i;
    assign axi_ar_size_m1_o     = axi_ar_size_s_i;
    assign axi_ar_burst_m1_o    = axi_ar_burst_s_i;
    assign axi_ar_lock_m1_o     = axi_ar_lock_s_i;
    assign axi_ar_cache_m1_o    = axi_ar_cache_s_i;
    assign axi_ar_qos_m1_o      = axi_ar_qos_s_i;
    
    assign axi_r_ready_m1_o     = axi_r_ready_s_i           & axi_split_rd_sel[1];

// input

    assign axi_aw_ready_s_o = (axi_aw_ready_m1_i & axi_split_wr_sel[1])
                            | (axi_aw_ready_m2_i & axi_split_wr_sel[0]);

    assign axi_w_ready_s_o  = (axi_w_ready_m1_i & axi_split_wr_sel[1])
                            | (axi_w_ready_m2_i & axi_split_wr_sel[0]);
    
    assign axi_b_valid_s_o  = (axi_b_valid_m1_i & axi_split_wr_sel[1])
                            | (axi_b_valid_m2_i & axi_split_wr_sel[0]);

    assign axi_b_resp_s_o   = (axi_b_resp_m1_i & {2{axi_split_wr_sel[1]}})
                            | (axi_b_resp_m2_i & {2{axi_split_wr_sel[0]}});
    assign axi_b_id_s_o     = (axi_b_id_m1_i & {4{axi_split_wr_sel[1]}});

    assign axi_b_user_s_o   = (axi_b_user_m1_i & {1{axi_split_wr_sel[1]}});

    assign axi_ar_ready_s_o = (axi_ar_ready_m1_i & axi_split_rd_sel[1])
                            | (axi_ar_ready_m2_i & axi_split_rd_sel[0]);

    assign axi_r_valid_s_o  = (axi_r_valid_m1_i & axi_split_rd_sel[1])
                            | (axi_r_valid_m2_i & axi_split_rd_sel[0]);

    assign axi_r_resp_s_o   = (axi_r_resp_m1_i & {2{axi_split_rd_sel[1]}})
                            | (axi_r_resp_m2_i & {2{axi_split_rd_sel[0]}});
                            
    assign axi_r_data_s_o   = (axi_r_data_m1_i & {64{axi_split_rd_sel[1]}})
                            | (axi_r_data_m2_i & {64{axi_split_rd_sel[0]}});

    assign axi_r_last_s_o   = (axi_r_last_m1_i & axi_split_rd_sel[1])
                            | axi_split_rd_sel[0];

    assign axi_r_id_s_o     = (axi_r_id_m1_i & {4{axi_split_rd_sel[1]}});
    assign axi_r_user_s_o   = (axi_r_user_m1_i & {1{axi_split_rd_sel[1]}});

endmodule

module ysyx_210133_biu# (
    parameter AXI_DATA_WIDTH    = 64,
    parameter AXI_ADDR_WIDTH    = 32,
    parameter AXI_ID_WIDTH      = 4,
    parameter AXI_USER_WIDTH    = 1
)(
    input clk,
    input rst,

//Instruction fetch input
    input if_valid,
	output  if_ready,
    output  [63:0] if_data_read,
    input [63:0] if_addr,
    input [1:0] if_size,
    output  [1:0] if_resp,
    //input raddr_valid,
//Data memory l/s input
    input wire dtcm_rvalid,
    output wire dtcm_rready,
    input wire dtcm_wvalid,
    output wire dtcm_wready,
    output wire [63:0]dtcm_data_rd,
    input wire [63:0]dtcm_data_wr, 
    //input wire dtcm_rd, 
    //input wire dtcm_wr,
    input wire [63:0]dtcm_addr,
    input wire [7:0] wmask,
    input wire [1:0] mem_size,


//AXI output
    input                               axi_aw_ready_i,
    output                              axi_aw_valid_o,
    output [AXI_ADDR_WIDTH-1:0]         axi_aw_addr_o,
    output [2:0]                        axi_aw_prot_o,
    output [AXI_ID_WIDTH-1:0]           axi_aw_id_o,
    output [AXI_USER_WIDTH-1:0]         axi_aw_user_o,
    output [7:0]                        axi_aw_len_o,
    output [2:0]                        axi_aw_size_o,
    output [1:0]                        axi_aw_burst_o,
    output                              axi_aw_lock_o,
    output [3:0]                        axi_aw_cache_o,
    output [3:0]                        axi_aw_qos_o,

    input                               axi_w_ready_i,
    output                              axi_w_valid_o,
    output [AXI_DATA_WIDTH-1:0]         axi_w_data_o,
    output [AXI_DATA_WIDTH/8-1:0]       axi_w_strb_o,
    output                              axi_w_last_o,
    output [AXI_ID_WIDTH-1:0]           axi_w_id_o,
    
    output                              axi_b_ready_o,
    input                               axi_b_valid_i,
    input  [1:0]                        axi_b_resp_i,
    input  [AXI_ID_WIDTH-1:0]           axi_b_id_i,
    input  [AXI_USER_WIDTH-1:0]         axi_b_user_i,

    input                               axi_ar_ready_i,
    output                              axi_ar_valid_o,
    output [AXI_ADDR_WIDTH-1:0]         axi_ar_addr_o,
    output [2:0]                        axi_ar_prot_o,
    output [AXI_ID_WIDTH-1:0]           axi_ar_id_o,
    output [AXI_USER_WIDTH-1:0]         axi_ar_user_o,
    output [7:0]                        axi_ar_len_o,
    output [2:0]                        axi_ar_size_o,
    output [1:0]                        axi_ar_burst_o,
    output                              axi_ar_lock_o,
    output [3:0]                        axi_ar_cache_o,
    output [3:0]                        axi_ar_qos_o,
    
    output                              axi_r_ready_o,
    input                               axi_r_valid_i,
    input  [1:0]                        axi_r_resp_i,
    input  [AXI_DATA_WIDTH-1:0]         axi_r_data_i,
    input                               axi_r_last_i,
    input  [AXI_ID_WIDTH-1:0]           axi_r_id_i,
    input  [AXI_USER_WIDTH-1:0]         axi_r_user_i
);

// LSB has higher priority
    wire [1:0]axi_ar_ready;
    wire [1:0]axi_ar_valid;
    wire [AXI_ADDR_WIDTH-1:0] axi_ar_addr[0:1];
    wire [2:0] axi_ar_prot [0:1];
    wire [AXI_ID_WIDTH-1:0] axi_ar_id[0:1];
    wire [AXI_USER_WIDTH-1:0] axi_ar_user[0:1];
    wire [7:0] axi_ar_len[0:1];
    wire [2:0] axi_ar_size[0:1];
    wire [1:0] axi_ar_burst[0:1];
    wire [1:0] axi_ar_lock;
    wire [3:0] axi_ar_cache[0:1];
    wire [3:0] axi_ar_qos[0:1];
    
    wire [1:0]axi_r_ready;
    wire [1:0]axi_r_valid;
    wire [1:0]axi_r_resp[0:1];
    wire [AXI_DATA_WIDTH-1:0] axi_r_data[0:1];
    wire [1:0]axi_r_last;
    wire [AXI_ID_WIDTH-1:0] axi_r_id[0:1];
    wire [AXI_USER_WIDTH-1:0] axi_r_user[0:1];

    // reg raddr_valid_r;
    // always @(posedge clk) begin
    //     if(rst)
    //         raddr_valid_r <= 0;
    //     else
    //         raddr_valid_r <= raddr_valid;
    // end

//-------------------------------if-------------------------------------------//

    ysyx_210133_axi_ro if_axi (
        .clock                          (clk),
        .reset                          (rst),

        .rw_valid_i                     (if_valid),
        .rw_ready_o                     (if_ready),
        .rw_req_i                       (`YSYX210133_REQ_READ),// read/write?
        .data_read_o                    (if_data_read),
        .rw_addr_i                      (if_addr),
        .rw_size_i                      (if_size),
        .rw_resp_o                      (if_resp),

        .axi_ar_ready_i                 (axi_ar_ready[1]),
        .axi_ar_valid_o                 (axi_ar_valid[1]),
        .axi_ar_addr_o                  (axi_ar_addr[1]),
        .axi_ar_prot_o                  (axi_ar_prot[1]),
        .axi_ar_id_o                    (axi_ar_id[1]),
        .axi_ar_user_o                  (axi_ar_user[1]),
        .axi_ar_len_o                   (axi_ar_len[1]),
        .axi_ar_size_o                  (axi_ar_size[1]),
        .axi_ar_burst_o                 (axi_ar_burst[1]),
        .axi_ar_lock_o                  (axi_ar_lock[1]),
        .axi_ar_cache_o                 (axi_ar_cache[1]),
        .axi_ar_qos_o                   (axi_ar_qos[1]),
        
        .axi_r_ready_o                  (axi_r_ready[1]),
        .axi_r_valid_i                  (axi_r_valid[1]),
        .axi_r_resp_i                   (axi_r_resp[1]),
        .axi_r_data_i                   (axi_r_data[1]),
        .axi_r_last_i                   (axi_r_last[1]),
        .axi_r_id_i                     (axi_r_id[1]),
        .axi_r_user_i                   (axi_r_user[1])
    );

//----------------------memory------------------------------------//
    wire rw_ready_2;
    wire rw_req_2 = (`YSYX210133_REQ_READ & dtcm_rvalid)
                  | (`YSYX210133_REQ_WRITE & dtcm_wvalid);
    assign dtcm_wready = rw_ready_2 & dtcm_wvalid;
    assign dtcm_rready = rw_ready_2 & dtcm_rvalid; 

    ysyx_210133_axi_rw mem_axi (
        .clock                          (clk),
        .reset                          (rst),

        //.raddr_valid_i                  (dtcm_rvalid),
        .rw_valid_i                     (dtcm_rvalid | dtcm_wvalid),
        .rw_ready_o                     (rw_ready_2),
        .rw_req_i                       (rw_req_2),// read/write?
        .data_read_o                    (dtcm_data_rd),
        .data_write_i                   (dtcm_data_wr),
        .data_mask_i                    (wmask),
        .rw_addr_i                      (dtcm_addr),
        .rw_size_i                      (mem_size),
        //.rw_resp_o                      (),

        .axi_aw_ready_i                 (axi_aw_ready_i),
        .axi_aw_valid_o                 (axi_aw_valid_o),
        .axi_aw_addr_o                  (axi_aw_addr_o),
        .axi_aw_prot_o                  (axi_aw_prot_o),
        .axi_aw_id_o                    (axi_aw_id_o),
        .axi_aw_user_o                  (axi_aw_user_o),
        .axi_aw_len_o                   (axi_aw_len_o),
        .axi_aw_size_o                  (axi_aw_size_o),
        .axi_aw_burst_o                 (axi_aw_burst_o),
        .axi_aw_lock_o                  (axi_aw_lock_o),
        .axi_aw_cache_o                 (axi_aw_cache_o),
        .axi_aw_qos_o                   (axi_aw_qos_o),

        .axi_w_ready_i                  (axi_w_ready_i),
        .axi_w_valid_o                  (axi_w_valid_o),
        .axi_w_data_o                   (axi_w_data_o),
        .axi_w_strb_o                   (axi_w_strb_o),
        .axi_w_last_o                   (axi_w_last_o),
        .axi_w_id_o                     (axi_w_id_o),
        
        .axi_b_ready_o                  (axi_b_ready_o),
        .axi_b_valid_i                  (axi_b_valid_i),
        .axi_b_resp_i                   (axi_b_resp_i),
        .axi_b_id_i                     (axi_b_id_i),
        .axi_b_user_i                   (axi_b_user_i),

        .axi_ar_ready_i                 (axi_ar_ready[0]),
        .axi_ar_valid_o                 (axi_ar_valid[0]),
        .axi_ar_addr_o                  (axi_ar_addr[0]),
        .axi_ar_prot_o                  (axi_ar_prot[0]),
        .axi_ar_id_o                    (axi_ar_id[0]),
        .axi_ar_user_o                  (axi_ar_user[0]),
        .axi_ar_len_o                   (axi_ar_len[0]),
        .axi_ar_size_o                  (axi_ar_size[0]),
        .axi_ar_burst_o                 (axi_ar_burst[0]),
        .axi_ar_lock_o                  (axi_ar_lock[0]),
        .axi_ar_cache_o                 (axi_ar_cache[0]),
        .axi_ar_qos_o                   (axi_ar_qos[0]),
        
        .axi_r_ready_o                  (axi_r_ready[0]),
        .axi_r_valid_i                  (axi_r_valid[0]),
        .axi_r_resp_i                   (axi_r_resp[0]),
        .axi_r_data_i                   (axi_r_data[0]),
        .axi_r_last_i                   (axi_r_last[0]),
        .axi_r_id_i                     (axi_r_id[0]),
        .axi_r_user_i                   (axi_r_user[0])
    );

//--------------------------RR--Arbitary---------------------------//
// wire [1:0] axi_ar_grt_vec;
// assign axi_ar_grt_vec[1] = ~axi_ar_valid[0];
// assign axi_ar_grt_vec[0] = 1'b1;
localparam   IDLE        = 2'd0,
            INST_AXI    = 2'd1,
            MEM_AXI     = 2'd2;

reg [1:0] axi_ar_grt_vec;
reg [1:0] arbt_state;

always @(posedge clk) begin
    if(rst) begin
        axi_ar_grt_vec <= 0;
        arbt_state  <= 0;
    end
    else
        case(arbt_state)
            IDLE: begin
                if(axi_ar_valid[0]) begin
                    arbt_state  <= MEM_AXI;
                    axi_ar_grt_vec <= 2'b01;
                end
                else if(axi_ar_valid[1])begin
                    arbt_state  <= INST_AXI;
                    axi_ar_grt_vec <= 2'b10;
                end
            end
            INST_AXI: begin
                if(axi_r_valid_i & axi_r_ready_o)
                    // if(axi_ar_valid[0])begin
                    //     arbt_state  <= MEM_AXI;
                    //     axi_ar_grt_vec <= 2'b01;
                    // end
                    begin
                        arbt_state  <= IDLE;
                        axi_ar_grt_vec <= 2'b00;
                    end
            end
            MEM_AXI: begin
                if(axi_r_valid_i & axi_r_ready_o)
                    // if(axi_ar_valid[1])begin
                    //     arbt_state  <= INST_AXI;
                    //     axi_ar_grt_vec <= 2'b10;
                    // end
                    begin
                        arbt_state  <= IDLE;
                        axi_ar_grt_vec <= 2'b00;
                    end
            end
            default: ;
        endcase
end

wire [1:0] axi_ar_sel_vec = axi_ar_grt_vec;// & axi_ar_valid;

assign axi_ar_valid_o   = |(axi_ar_valid&axi_ar_sel_vec);
assign axi_ar_addr_o    = ({32{axi_ar_sel_vec[1]}} & axi_ar_addr[1]) | ({32{axi_ar_sel_vec[0]}} & axi_ar_addr[0]);
assign axi_ar_size_o    = ({3{axi_ar_sel_vec[1]}} & axi_ar_size[1]) | ({3{axi_ar_sel_vec[0]}} & axi_ar_size[0]);//axi_ar_size[1];//
assign axi_ar_len_o     = ({8{axi_ar_sel_vec[1]}} & axi_ar_len [1]) | ({8{axi_ar_sel_vec[0]}} & axi_ar_len[0]);//axi_ar_len[1];
assign axi_ar_user_o    = 1'b0;
assign axi_ar_id_o      = 4'b0;
assign axi_ar_lock_o    = 1'b0;
assign axi_ar_prot_o    = `YSYX210133_AXI_PROT_UNPRIVILEGED_ACCESS | `YSYX210133_AXI_PROT_SECURE_ACCESS | `YSYX210133_AXI_PROT_DATA_ACCESS;
assign axi_ar_burst_o   = `YSYX210133_AXI_BURST_TYPE_INCR;
assign axi_ar_cache_o   = `YSYX210133_AXI_ARCACHE_NORMAL_NON_CACHEABLE_NON_BUFFERABLE;
assign axi_ar_qos_o     = 4'b0;

assign axi_ar_ready     = {2{axi_ar_ready_i}} & axi_ar_sel_vec;

reg [1:0] axi_arbt_id;
always @(posedge clk) begin
    if(axi_ar_ready_i & axi_ar_valid_o)
        axi_arbt_id <= axi_ar_grt_vec;
end

genvar i;
generate
    for(i=0;i<2;i=i+1)begin:axi_arbt
        assign axi_r_id[i]      = {4{axi_arbt_id[i]}} & axi_r_id_i;
        assign axi_r_last[i]    = {1{axi_arbt_id[i]}} & axi_r_last_i;
        assign axi_r_user[i]    = {1{axi_arbt_id[i]}} & axi_r_user_i;
        assign axi_r_data[i]    = {64{axi_arbt_id[i]}} & axi_r_data_i;
        assign axi_r_resp[i]    = {2{axi_arbt_id[i]}} & axi_r_resp_i;
        assign axi_r_valid[i]   = {1{axi_arbt_id[i]}} & axi_r_valid_i;
    end
endgenerate

assign axi_r_ready_o = |axi_r_ready;

endmodule

module ysyx_210133_clint_bus #(
		// Width of S_AXI data bus
		parameter integer C_S_AXI_DATA_WIDTH	= 64,
		// Width of S_AXI address bus
		parameter integer C_S_AXI_ADDR_WIDTH	= 16
	)
	(	// Users to add ports here
		output timr_irq,
		// User ports ends
		// Do not modify the ports beyond this line

		// Global Clock Signal
		input wire  S_AXI_ACLK,
		input wire  S_AXI_ARESET,
		input wire [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_AWADDR,
		input wire [2 : 0] S_AXI_AWPROT,
		input wire  S_AXI_AWVALID,
		output wire  S_AXI_AWREADY,
		input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA,
		input wire [(C_S_AXI_DATA_WIDTH/8)-1 : 0] S_AXI_WSTRB,
		input wire  S_AXI_WVALID,
		output wire  S_AXI_WREADY,
		output wire [1 : 0] S_AXI_BRESP,
		output wire  S_AXI_BVALID,
		input wire  S_AXI_BREADY,
		input wire [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_ARADDR,
		input wire [2 : 0] S_AXI_ARPROT,
		input wire  S_AXI_ARVALID,
		output wire  S_AXI_ARREADY,
		output wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA,
		output wire [1 : 0] S_AXI_RRESP,
		output wire  S_AXI_RVALID,
		input wire  S_AXI_RREADY
	);

	// AXI4LITE signals
	reg [C_S_AXI_ADDR_WIDTH-1 : 0] 	axi_awaddr;
	reg  	axi_awready;
	reg  	axi_wready;
	reg [1 : 0] 	axi_bresp;
	reg  	axi_bvalid;
	reg [C_S_AXI_ADDR_WIDTH-1 : 0] 	axi_araddr;
	reg  	axi_arready;
	wire [C_S_AXI_DATA_WIDTH-1 : 0] 	axi_rdata;
	reg [1 : 0] 	axi_rresp;
	reg  	axi_rvalid;



	// I/O Connections assignments

	assign S_AXI_AWREADY	= axi_awready;
	assign S_AXI_WREADY	= axi_wready;
	assign S_AXI_BRESP	= axi_bresp;
	assign S_AXI_BVALID	= axi_bvalid;
	assign S_AXI_ARREADY	= axi_arready;
	assign S_AXI_RDATA	= axi_rdata;
	assign S_AXI_RRESP	= axi_rresp;
	assign S_AXI_RVALID	= axi_rvalid;
//aw
	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESET == 1'b1 )
	    begin
	      axi_awready <= 1'b0;
	    end 
	  else
	    begin    
	      if (~axi_awready && S_AXI_AWVALID)
	        begin
	          axi_awready <= 1'b1;
	        end
	      else           
	        begin
	          axi_awready <= 1'b0;
	        end
	    end 
	end       

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESET == 1'b1 )
	    begin
	      axi_awaddr <= 0;
	    end 
	  else
	    begin    
	      if (~axi_awready && S_AXI_AWVALID )
	        begin
	          // Write Address latching 
	          axi_awaddr <= S_AXI_AWADDR;
	        end
	    end 
	end       
//w
	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESET == 1'b1 )
	    begin
	      axi_wready <= 1'b0;
	    end 
	  else
	    begin    
	      if (~axi_wready && S_AXI_WVALID)
	        begin
	          axi_wready <= 1'b1;
	        end
	      else
	        begin
	          axi_wready <= 1'b0;
	        end
	    end 
	end       

	
//resp
	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESET == 1'b1 )
	    begin
	      axi_bvalid  <= 0;
	      axi_bresp   <= 2'b0;
	    end 
	  else
	    begin    
	      if (~axi_bvalid && axi_wready && S_AXI_WVALID)
	        begin
	          // indicates a valid write response is available
	          axi_bvalid <= 1'b1;
	          axi_bresp  <= 2'b0; // 'OKAY' response 
	        end                   // work error responses in future
	      else
	        begin
	          if (S_AXI_BREADY && axi_bvalid)  
	            begin
	              axi_bvalid <= 1'b0; 
	            end  
	        end
	    end
	end   
//ar
	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESET == 1'b1 )
	    begin
	      axi_arready <= 1'b0;
	      axi_araddr  <= 16'b0;
	    end 
	  else
	    begin    
	      if (~axi_arready && S_AXI_ARVALID)
	        begin
	          // indicates that the slave has acceped the valid read address
	          axi_arready <= 1'b1;
	          // Read address latching
	          axi_araddr  <= S_AXI_ARADDR;
	        end
	      else
	        begin
	          axi_arready <= 1'b0;
	        end
	    end 
	end       
//r
	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESET == 1'b1 )
	    begin
	      axi_rvalid <= 0;
	      axi_rresp  <= 0;
	    end 
	  else
	    begin    
	      if (axi_arready && S_AXI_ARVALID && ~axi_rvalid)
	        begin
	          // Valid read data is available at the read data bus
	          axi_rvalid <= 1'b1;
	          axi_rresp  <= 2'b0; // 'OKAY' response
	        end   
	      else if (axi_rvalid && S_AXI_RREADY)
	        begin
	          // Read data is accepted by the master
	          axi_rvalid <= 1'b0;
	        end                
	    end
	end    

	wire	 slv_reg_rden_tmp;
	wire	 slv_reg_wren_tmp;

	assign slv_reg_wren_tmp = axi_awready && S_AXI_AWVALID; 
	assign slv_reg_rden_tmp = axi_arready & S_AXI_ARVALID & ~axi_rvalid;

	reg	 slv_reg_rden;
	reg	 slv_reg_wren;
	always @(posedge S_AXI_ACLK) begin
		if(S_AXI_ARESET)	begin
		  slv_reg_rden <= 0;
		  slv_reg_wren <= 0;
		end
		else begin
		  slv_reg_rden <= slv_reg_rden_tmp;
		  slv_reg_wren <= slv_reg_wren_tmp;
		end
	end

    wire wr_mtimecmp = (axi_awaddr==16'h4000) & slv_reg_wren;
    wire rd_mtimecmp = (axi_araddr==16'h4000) & slv_reg_rden;
    wire rd_mtime    = (axi_araddr==16'hbff8) & slv_reg_rden;
    wire wr_mtime    = (axi_awaddr==16'hbff8) & slv_reg_wren;

    wire en_mtime       = 1;
    wire en_mtimecmp    = wr_mtimecmp;

    wire [63:0] mtime_r, mtimecmp_r;

    wire [63:0]mtime_nxt    = wr_mtime ? S_AXI_WDATA : (mtime_r + 1);
    wire [63:0]mtimecmp_nxt = S_AXI_WDATA;

	wire [C_S_AXI_DATA_WIDTH-1:0] reg_data_out = mtimecmp_r & {64{rd_mtimecmp}}
                                               | mtime_r & {64{rd_mtime}};


	assign axi_rdata = reg_data_out;

    ysyx_210133_axi_dff mtime       (S_AXI_ACLK,S_AXI_ARESET,8'hff,en_mtime,mtime_nxt,mtime_r);
    ysyx_210133_axi_dff mtimecmp    (S_AXI_ACLK,S_AXI_ARESET,S_AXI_WSTRB,en_mtimecmp,mtimecmp_nxt,mtimecmp_r);

    assign timr_irq = mtime_r > mtimecmp_r;

endmodule


module ysyx_210133_csr_regfile(
    input clk,
    input rst,

  input [4:0] csr_info,  
  input [11:0] csr_rd_idx,
  input [11:0] csr_wr_idx,

  input [63:0] csr_wdata,
  output [63:0] csr_rdata,

  input dec_exp_ecall,
  input dec_mret,
  input clint_timr_csr_en,//pluse
  input [63:0]pc_wb,
  input [63:0]pc_exe,

  output [63:0] csr_mepc,
  output [63:0] csr_mtvec,
  output glb_intr_en,
  output timr_intr_en
);

// timer interrupt 
//wire clint_timr_csr_en = clint_timr_intr & glb_intr_en & timr_intr_en;

wire [63:0] mcycle_r;
wire [63:0] mstatus_r;
wire [63:0] mtvec_r;
wire [63:0] mepc_r;
wire [63:0] mcause_r;
wire [63:0] mie_r;
wire [63:0] mip_r;
wire [63:0] mhartid_r;
wire [63:0] mscratch_r;

// sel
wire sel_rd_mcycle   = csr_rd_idx == 12'hb00;
wire sel_rd_mstatus  = csr_rd_idx == 12'h300;
wire sel_rd_mtvec    = csr_rd_idx == 12'h305;
wire sel_rd_mepc     = csr_rd_idx == 12'h341;
wire sel_rd_mcause   = csr_rd_idx == 12'h342;
wire sel_rd_mie      = csr_rd_idx == 12'h304;
wire sel_rd_mip      = csr_rd_idx == 12'h344;
wire sel_rd_mhartid  = csr_rd_idx == 12'hf14;
wire sel_rd_mscratch = csr_rd_idx == 12'h340;

wire sel_wr_mcycle   = csr_wr_idx == 12'hb00;
wire sel_wr_mstatus  = csr_wr_idx == 12'h300;
wire sel_wr_mtvec    = csr_wr_idx == 12'h305;
wire sel_wr_mepc     = csr_wr_idx == 12'h341;
wire sel_wr_mcause   = csr_wr_idx == 12'h342;
wire sel_wr_mie      = csr_wr_idx == 12'h304;
wire sel_wr_mip      = csr_wr_idx == 12'h344;
//wire sel_wr_mhartid  = csr_wr_idx == 12'hf14;
wire sel_wr_mscratch = csr_wr_idx == 12'h340;

// wr
wire wr_csr       = csr_info[1]; 
wire wr_mcycle    = wr_csr    & sel_wr_mcycle;
wire wr_mstatus   = wr_csr    & sel_wr_mstatus;
wire wr_mtvec     = wr_csr    & sel_wr_mtvec;
wire wr_mepc      = wr_csr    & sel_wr_mepc;
wire wr_mcause    = wr_csr    & sel_wr_mcause;
wire wr_mie       = wr_csr    & sel_wr_mie;
wire wr_mip       = wr_csr    & sel_wr_mip;
//wire wr_mhartid   = 0;
wire wr_mscratch  = wr_csr    & sel_wr_mscratch; 

// rd
wire rd_csr       = csr_info[0];
wire rd_mcycle    = rd_csr    & sel_rd_mcycle;
wire rd_mstatus   = rd_csr    & sel_rd_mstatus;
wire rd_mtvec     = rd_csr    & sel_rd_mtvec;
wire rd_mepc      = rd_csr    & sel_rd_mepc;
wire rd_mcause    = rd_csr    & sel_rd_mcause;
wire rd_mie       = rd_csr    & sel_rd_mie;
wire rd_mip       = rd_csr    & sel_rd_mip;
wire rd_mhartid   = rd_csr    & sel_rd_mhartid;
wire rd_mscratch  = rd_csr    & sel_rd_mscratch;

// update csr en
wire en_mcycle    = 1;
wire en_mstatus   = wr_mstatus  | dec_exp_ecall   | dec_mret  | clint_timr_csr_en;
wire en_mtvec     = wr_mtvec;
wire en_mepc      = wr_mepc     | dec_exp_ecall   | clint_timr_csr_en;
wire en_mcause    = wr_mcause   | dec_exp_ecall   | clint_timr_csr_en;
wire en_mie       = wr_mie;
wire en_mip       = wr_mip      | clint_timr_csr_en | dec_mret;
wire en_mhartid   = 0;
wire en_mscratch  = wr_mscratch;

// update csr_data
wire [63:0] mcycle_nxt  = wr_mcycle  ? csr_wdata : (mcycle_r+1);

// To compate with NEMU(with User mode), here pretend this cpu has user mode 
wire [63:0] mstatus_nxt = wr_mstatus ? {(csr_wdata[16:15]==2'b11||csr_wdata[14:13]==2'b11),csr_wdata[62:0]} 
                                     : ({64{dec_exp_ecall}} & {mstatus_r[63:8]|56'h00000000_000018,mstatus_r[3],mstatus_r[6:4],1'b0,mstatus_r[2:0]})
                                     | ({64{dec_mret}} & {mstatus_r[63:8]&56'hffffffff_ffffe7,1'b1,mstatus_r[6:4],mstatus_r[7],mstatus_r[2:0]})
                                     | ({64{clint_timr_csr_en}} & {mstatus_r[63:8]|56'h00000000_000018,mstatus_r[3],mstatus_r[6:4],1'b0,mstatus_r[2:0]});
// In this project, priv is always machine
// wire [63:0] mstatus_nxt = wr_mstatus ? csr_wdata : ({64{dec_exp_ecall}} & {mstatus_r[63:8],mstatus_r[3],mstatus_r[6:4],1'b0,mstatus_r[2:0]})
//                                                  | ({64{dec_mret}} & {mstatus_r[63:8],1'b1,mstatus_r[6:4],mstatus_r[7],mstatus_r[2:0]});

wire [63:0] mtvec_nxt   = wr_mtvec   ? csr_wdata : mtvec_r;
wire [63:0] mepc_nxt    = wr_mepc    ? csr_wdata : {64{dec_exp_ecall}} & pc_wb
                                                 | {64{clint_timr_csr_en}} & (pc_exe);//self-defined

wire [63:0] mcause_nxt  = wr_mcause  ? csr_wdata : {64{dec_exp_ecall}}    & 64'd11
                                                 | {64{clint_timr_csr_en}}  & 64'h80000000_00000007;
wire [63:0] mie_nxt     = wr_mie     ? csr_wdata : mie_r;
wire [63:0] mip_nxt     = wr_mip     ? csr_wdata : {mip_r[63:8] , clint_timr_csr_en | ~dec_mret , mip_r[6:0]};

wire [63:0] mscratch_nxt  = wr_mscratch ? csr_wdata : mscratch_r;


// Reg
ysyx_210133_csr_dff mcycle  (clk,rst,64'b0,en_mcycle,mcycle_nxt,mcycle_r);
ysyx_210133_csr_dff mstatus (clk,rst,64'h00000000_00001800,en_mstatus,mstatus_nxt,mstatus_r);
ysyx_210133_csr_dff mtvec   (clk,rst,64'b0,en_mtvec,mtvec_nxt,mtvec_r);
ysyx_210133_csr_dff mepc    (clk,rst,64'b0,en_mepc,mepc_nxt,mepc_r);
ysyx_210133_csr_dff mcause  (clk,rst,64'b0,en_mcause,mcause_nxt,mcause_r);

ysyx_210133_csr_dff mie     (clk,rst,64'b0,en_mie,mie_nxt,mie_r);
ysyx_210133_csr_dff mip     (clk,rst,64'b0,en_mip,mip_nxt,mip_r);
ysyx_210133_csr_dff mhartid (clk,rst,64'b0,en_mhartid,64'b0,mhartid_r);

ysyx_210133_csr_dff mscratch (clk,rst,64'b0,en_mscratch,mscratch_nxt,mscratch_r);

// output
assign csr_rdata    = {64{rd_mcycle}}     & mcycle_r
                    | {64{rd_mstatus}}    & mstatus_r
                    | {64{rd_mtvec}}      & mtvec_r
                    | {64{rd_mepc}}       & mepc_r
                    | {64{rd_mcause}}     & mcause_r
                    | {64{rd_mhartid}}    & mhartid_r
                    | {64{rd_mscratch}}   & mscratch_r
                    | {64{rd_mie}}        & mie_r
                    | {64{rd_mip}}        & mip_r;

assign csr_mepc     = mepc_r;
assign csr_mtvec    = mtvec_r;
assign glb_intr_en  = mstatus_r[3];
assign timr_intr_en = mie_r[7];

endmodule

module ysyx_210133_exe_stage(
  input wire [63:0] pc,
  // decode information
  //input wire [7:0] dec_ctr_info,
  input wire [11:0] dec_alu_info,
  input wire [6:0] dec_bxx_info,
  input wire dec_mem_add_info,
  input wire [1:0]dec_length_info,//[1]:word, [0]:signed

  input wire [63:0]dec_op1,
  input wire [63:0]dec_op2,
  input wire [63:0]rv_imm,//for branch
  
  output wire [63:0]exe_alu_res,
  output wire [63:0]exe_mem_addr,
  output reg  exe_bxx_res,
  output [63:0] pc_new,

  // CSR
  input [4:0] csr_info,
  input [63:0] csr_op1,
  input [63:0] csr_op2,
  output reg[63:0] csr_wdata
);

assign pc_new   = rv_imm + ({64{dec_bxx_info[6]}} & dec_op1) + ({64{~dec_bxx_info[6]}} & pc);

reg [63:0]exe_alu_res_tmp;
assign exe_alu_res = dec_length_info[1] ? {{32{exe_alu_res_tmp[31]}},exe_alu_res_tmp[31:0]} : exe_alu_res_tmp;

wire [63:0] dec_op2_word = {dec_op2[63:6], dec_op2[5] & ~dec_length_info[1], dec_op2[4:0]};

// alu 
always@( * )
begin
    case( dec_alu_info )
	  `YSYX210133_INST_ADD  : begin exe_alu_res_tmp = dec_op1 +  dec_op2;  end
    `YSYX210133_INST_SUB  : begin exe_alu_res_tmp = dec_op1 -  dec_op2;  end
    `YSYX210133_INST_SLL  : begin exe_alu_res_tmp = dec_op1 << dec_op2_word[5:0];  end
    `YSYX210133_INST_SLT  : begin exe_alu_res_tmp = {63'b0,($signed(dec_op1) <  $signed(dec_op2))};  end
	  `YSYX210133_INST_SLTU : begin exe_alu_res_tmp = {63'b0,(dec_op1 <  dec_op2)};  end
    `YSYX210133_INST_XOR  : begin exe_alu_res_tmp = dec_op1 ^  dec_op2;  end
    `YSYX210133_INST_SRL  : begin exe_alu_res_tmp = ({{32{~dec_length_info[1]}},32'hffff_ffff} & dec_op1) >>  dec_op2_word[5:0];  end// to compatiable with srliw
    `YSYX210133_INST_SRA  : begin exe_alu_res_tmp = $signed(dec_length_info[1] ? {{32{dec_op1[31]}},dec_op1[31:0]} : dec_op1) >>>  dec_op2_word[5:0];  end
    `YSYX210133_INST_OR   : begin exe_alu_res_tmp = dec_op1 |  dec_op2;  end
    `YSYX210133_INST_AND  : begin exe_alu_res_tmp = dec_op1 &  dec_op2;  end
    `YSYX210133_INST_LUI  : begin exe_alu_res_tmp = dec_op2; end
    `YSYX210133_INST_JAL  : begin exe_alu_res_tmp = pc+4; end
	  default    : begin exe_alu_res_tmp = `YSYX210133_ZERO_WORD; end
	endcase
end

// csr
always@( * )
begin
    case( csr_info[4:2] )
	  3'b100  : begin csr_wdata = csr_op2;  end
    3'b010  : begin csr_wdata = csr_op1 |  csr_op2;  end
    3'b001  : begin csr_wdata = csr_op1 &  (~csr_op2);  end
	  default : begin csr_wdata = `YSYX210133_ZERO_WORD; end
	endcase
end

// memory addr
assign exe_mem_addr = (dec_op1 + dec_op2) & {64{dec_mem_add_info}};

// branch
always@( * )
begin
    case( dec_bxx_info[5:0] )
	  `YSYX210133_INST_BEQ  : exe_bxx_res = dec_op1 == dec_op2;
	  `YSYX210133_INST_BNE  : exe_bxx_res = dec_op1 != dec_op2;
	  `YSYX210133_INST_BLT  : exe_bxx_res = $signed(dec_op1) < $signed(dec_op2);
	  `YSYX210133_INST_BGE  : exe_bxx_res = $signed(dec_op1) >= $signed(dec_op2);
	  `YSYX210133_INST_BLTU : exe_bxx_res = dec_op1 < dec_op2;
	  `YSYX210133_INST_BGEU : exe_bxx_res = dec_op1 >= dec_op2;
	  default    : exe_bxx_res = 1'b0;
	endcase
end


endmodule


module ysyx_210133_id_stage(
  input wire [31 : 0]inst,
  input wire [63:0]rs1_data,
  input wire [63:0]rs2_data, 
  input wire [63:0] pc, 
  
  output wire rs1_r_ena,
  output wire [4 : 0]rs1_r_addr,
  output wire rs2_r_ena,
  output wire [4 : 0]rs2_r_addr,
  output wire rd_w_ena,
  output wire [4 : 0]rd_w_addr,

  output [63:0]dec_op1,
  output [63:0]dec_op2,

  // decode info
  output [7:0] dec_ctr_info,
  output [11:0] dec_alu_info,
  output [6:0] dec_bxx_info,// including jalr
  output dec_mem_add_info,
  output [3:0] dec_store_info,
  output [6:0] dec_load_info,
  output [1:0]dec_length_info,// [1]:1-> word, 0-> double word, [0]: signed

  output dec_exp_ecall,
  output dec_mret,

  output [63:0] rv_imm,

  // CSR
  output [4:0] csr_info,
  output [63:0] csr_op1,
  output [63:0] csr_op2,
  output [11:0] csr_idx,
  input [63:0] csr_rdata,

  // store vector
  output [63:0]rs2_data_o
);

/////////////////////////////////////////////////
// INSTRUCTION DECODE
/////////////////////////////////////////////////

// fixed field
wire [6:0] opcode = inst[6:0];
wire [2:0] func3  = inst[14:12];
wire [6:0] func7  = {inst[31:26],1'b0};
wire [4:0] rs1    = inst[19:15];
wire [4:0] rs2    = inst[24:20];
wire [5:0] shamt  = inst[25:20];
wire [4:0] rd     = inst[11:7];
wire [4:0] zimm   = inst[19:15];

assign csr_idx  = inst[31:20];

// feasible field
wire [63:0] rv_imm_u = {{32{inst[31]}},inst[31:12],12'b0};
wire [63:0] rv_imm_i = {{52{inst[31]}},inst[31:20]};
wire [63:0] rv_imm_b = {{51{inst[31]}},inst[31],inst[7],inst[30:25],inst[11:8],1'b0}; 
wire [63:0] rv_imm_j = {{43{inst[31]}},inst[31],inst[19:12],inst[20],inst[30:21],1'b0};
wire [63:0] rv_imm_s = {{52{inst[31]}},inst[31:25],inst[11:7]};

// func3 decode
wire func3_000 = func3 == 3'b000;
wire func3_001 = func3 == 3'b001;
wire func3_010 = func3 == 3'b010;
wire func3_011 = func3 == 3'b011;
wire func3_100 = func3 == 3'b100;
wire func3_101 = func3 == 3'b101;
wire func3_110 = func3 == 3'b110;
wire func3_111 = func3 == 3'b111;

// func7 decode
wire func7_0    = func7 == 7'b0000000;
wire func7_1    = func7 == 7'b0100000; 
wire func7_mret = func7 == 7'b0011000;

// U-type instruction
wire rv_lui   = opcode == 7'b0110111;
wire rv_auipc = opcode == 7'b0010111;

// J-type instruction
wire rv_jal  = opcode == 7'b1101111;

// branch instruction
wire rv_branch  = opcode == 7'b1100011;
/* Real one */
wire rv_beq     = rv_branch && func3_000;
wire rv_bne     = rv_branch && func3_001;
wire rv_blt     = rv_branch && func3_100;
wire rv_bge     = rv_branch && func3_101;
wire rv_bltu    = rv_branch && func3_110;
wire rv_bgeu    = rv_branch && func3_111;

// store instruction
wire rv_store = opcode == 7'b0100011;
/* Real one */
wire rv_sb    = rv_store && func3_000;
wire rv_sh    = rv_store && func3_001;
wire rv_sw    = rv_store && func3_010;
wire rv_sd    = rv_store && func3_011;

// I-type instruction
wire rv_jalr    = opcode == 7'b1100111;
wire rv_load    = opcode == 7'b0000011;
wire rv_imm_op  = opcode == 7'b0010011;
/* Real one */
wire rv_lb      = rv_load && func3_000;
wire rv_lh      = rv_load && func3_001;
wire rv_lw      = rv_load && func3_010;
wire rv_lbu     = rv_load && func3_100;
wire rv_lhu     = rv_load && func3_101;
wire rv_lwu     = rv_load && func3_110;
wire rv_ld      = rv_load && func3_011;

wire rv_addi    = rv_imm_op && func3_000;
wire rv_slti    = rv_imm_op && func3_010;
wire rv_sltiu   = rv_imm_op && func3_011;
wire rv_xori    = rv_imm_op && func3_100;
wire rv_ori     = rv_imm_op && func3_110;
wire rv_andi    = rv_imm_op && func3_111;
wire rv_slli    = rv_imm_op && func3_001;
wire rv_srli    = rv_imm_op && func3_101 && func7_0;
wire rv_srai    = rv_imm_op && func3_101 && func7_1;

// R-type instruction
wire rv_op = opcode == 7'b0110011;
/* Real one */
wire rv_add   = rv_op && func3_000 && func7_0;
wire rv_sub   = rv_op && func3_000 && func7_1;
wire rv_sll   = rv_op && func3_001;
wire rv_slt   = rv_op && func3_010;
wire rv_sltu  = rv_op && func3_011;
wire rv_xor   = rv_op && func3_100;
wire rv_srl   = rv_op && func3_101 && func7_0;
wire rv_sra   = rv_op && func3_101 && func7_1;
wire rv_or    = rv_op && func3_110;
wire rv_and   = rv_op && func3_111;

// Some word operation
wire rv_word_op       = opcode == 7'b0111011;
wire rv_word_imm_op   = opcode == 7'b0011011;

wire rv_addw  = rv_word_op && func3_000 && func7_0;
wire rv_subw  = rv_word_op && func3_000 && func7_1;
wire rv_sllw  = rv_word_op && func3_001;
wire rv_srlw  = rv_word_op && func3_101 && func7_0;
wire rv_sraw  = rv_word_op && func3_101 && func7_1;

wire rv_addiw = rv_word_imm_op && func3_000;
wire rv_slliw = rv_word_imm_op && func3_001;
wire rv_srliw = rv_word_imm_op && func3_101 && func7_0;
wire rv_sraiw = rv_word_imm_op && func3_101 && func7_1;

// Imm decode
wire rv_imm_sel_i   = rv_imm_op | rv_load | rv_jalr | rv_word_imm_op;
wire rv_imm_sel_u   = rv_auipc  | rv_lui;
wire rv_imm_sel_s   = rv_store;
wire rv_imm_sel_b   = rv_branch;
wire rv_imm_sel_j   = rv_jal;
assign rv_imm  = (rv_imm_i & {64{rv_imm_sel_i}})
                    | (rv_imm_u & {64{rv_imm_sel_u}}) 
                    | (rv_imm_s & {64{rv_imm_sel_s}}) 
                    | (rv_imm_b & {64{rv_imm_sel_b}}) 
                    | (rv_imm_j & {64{rv_imm_sel_j}});

///////////////////////////////////////////////////////////////
// CSR & System
///////////////////////////////////////////////////////////////
wire rv_system   = opcode == 7'b1110011;
wire rv_csrrw    = rv_system && func3_001; 
wire rv_csrrs    = rv_system && func3_010; 
wire rv_csrrc    = rv_system && func3_011; 
wire rv_csrrwi   = rv_system && func3_101; 
wire rv_csrrsi   = rv_system && func3_110; 
wire rv_csrrci   = rv_system && func3_111;

wire rv_csr      = rv_csrrw | rv_csrrwi
                 | rv_csrrs | rv_csrrsi
                 | rv_csrrc | rv_csrrci;

wire rv_mret     = rv_system && func3_000 && func7_mret;
wire rv_ecall    = rv_system && func3_000 && func7_0;

wire csr_eq   = rv_csrrw  | rv_csrrwi;
wire csr_or   = rv_csrrs  | rv_csrrsi;
wire csr_and  = rv_csrrc  | rv_csrrci;
wire csr_rd   = rv_csr;
wire csr_wr   = rv_csr;

assign csr_info   = {csr_eq,csr_or,csr_and,csr_wr,csr_rd};
assign csr_op1    = csr_rdata;
assign csr_op2    = ({64{rv_csrrw  | rv_csrrs  | rv_csrrc }} & rs1_data)
                  | ({64{rv_csrrwi | rv_csrrsi | rv_csrrci}} & {59'b0,zimm});

assign dec_exp_ecall    = rv_ecall;
assign dec_mret         = rv_mret;
///////////////////////////////////////////////////////////////
// Control info Generation
///////////////////////////////////////////////////////////////
// Control generation
wire csr_sel      = rv_csr;// for write back stage
wire branch       = rv_branch;
wire jump         = rv_jal      | rv_jalr;
wire reg_wr       = rv_op       | rv_imm_op  | rv_jalr | rv_load//R/I
                  | rv_jal      | rv_auipc   | rv_lui //J/U
                  | rv_word_op  | rv_word_imm_op//word operation
                  | rv_csr;
wire alu_src      = rv_op       | rv_branch | rv_word_op; // 1:op2=rs2, 0:op2=imm
wire mem_rd       = rv_load;
wire mem_wr       = rv_store;
wire mem_to_reg   = rv_load;

// in case cpu stalls
// do not clear mem signal
//wire stall = ~cpu_vld;
assign dec_ctr_info = {csr_sel,branch,jump,reg_wr,alu_src,mem_rd,mem_wr,mem_to_reg};

///////////////////////////////////////////////////////////////
// ALU info Generation
///////////////////////////////////////////////////////////////
wire alu_add    = rv_add  | rv_addi | rv_auipc  | rv_addw | rv_addiw;
wire alu_sub    = rv_sub  | rv_subw;
wire alu_slt    = rv_slt  | rv_slti;
wire alu_sltu   = rv_sltu | rv_sltiu;
wire alu_xor    = rv_xor  | rv_xori;
wire alu_or     = rv_or   | rv_ori;
wire alu_and    = rv_and  | rv_andi;
wire alu_sll    = rv_sll  | rv_slli | rv_slliw  | rv_sllw;
wire alu_srl    = rv_srl  | rv_srli | rv_srliw  | rv_srlw;
wire alu_sra    = rv_sra  | rv_srai | rv_sraiw  | rv_sraw;
wire alu_lui    = rv_lui;//do nothing,but need writing back
wire alu_jal    = rv_jal  | rv_jalr;

assign dec_alu_info = {alu_add, alu_sub, alu_slt, alu_sltu, alu_xor, alu_or, alu_and, alu_sll, alu_srl, alu_sra, alu_lui, alu_jal};

///////////////////////////////////////////////////////////////
// Branch info Generation
///////////////////////////////////////////////////////////////
wire bxx_eq   = rv_beq;
wire bxx_ne   = rv_bne;
wire bxx_lt   = rv_blt;
wire bxx_ge   = rv_bge;
wire bxx_ltu  = rv_bltu;
wire bxx_geu  = rv_bgeu;

assign dec_bxx_info  = {rv_jalr, bxx_eq, bxx_ne, bxx_lt, bxx_ge, bxx_ltu, bxx_geu};

///////////////////////////////////////////////////////////////
// Memory info Generation
///////////////////////////////////////////////////////////////
assign dec_mem_add_info      = rv_load | rv_store;
assign dec_store_info   = {rv_sb, rv_sh, rv_sw, rv_sd};
assign dec_load_info    = {rv_lb, rv_lh, rv_lw, rv_lbu, rv_lhu, rv_lwu, rv_ld};


assign dec_length_info[1] = rv_word_imm_op | rv_word_op;
assign dec_length_info[0] = !(rv_srliw | rv_srlw);//this instruction has unsigned ext

///////////////////////////////////////////////////////////////
// Operand decode
///////////////////////////////////////////////////////////////
wire shamt_op = rv_slli | rv_srli | rv_srai | rv_sraiw | rv_srliw | rv_slliw;

assign rs1_r_ena  = 1;
assign rs1_r_addr = rs1;
assign rs2_r_ena  = 1;
assign rs2_r_addr = rs2;

assign rd_w_ena   = dec_ctr_info[4];// & cpu_vld;
assign rd_w_addr  = rd;

assign rs2_data_o = rs2_data;

assign dec_op1 = rv_auipc ? pc : rs1_data;
//assign dec_op2 = alu_src  ? rs2_data : rv_imm;
assign dec_op2 = shamt_op ? {58'b0,shamt} : (alu_src  ? rs2_data : rv_imm);


endmodule


// Note: External interrupt occurs
//         Current instruction will finish and then jump to exception
//
module ysyx_210133_if_stage(
  input wire clk,
  input wire rst,
  
  output reg [63 : 0] pc,
  output reg [31 : 0] inst_reg,

  input wire [63 : 0] pc_new,
  input wire [7:0] dec_ctr_info,
  input wire exe_bxx_res,

  // memory interface -- difftest RAM helper
  //input [63:0] rdata
  output if_valid,
	input  if_ready,
  input  [63:0] if_data_read,
  output reg [63:0] if_addr,
  output [1:0] if_size,
  input  [1:0] if_resp,

  //output reg fetched,
  //output reg raddr_valid,
  output reg cpu_vld_reg,
  input mem_stall,
  //input mem_hs,

// interrupt signal
  input dec_exp_ecall,
  input dec_mret,
  input clint_timr_intr,//level

// CSR info
  input [63:0] csr_mepc,
  input [63:0] csr_mtvec,

  input glb_intr_en,
  input timr_intr_en,

  output clint_timr_csr_en,
  output jump,

  input exe_vld
);

reg fetched;

wire exp_jump       = dec_exp_ecall | dec_mret;
wire intr_jump      = glb_intr_en   & timr_intr_en    & clint_timr_intr;//timer, level

wire jump_normal = (dec_ctr_info[6] & exe_bxx_res) | dec_ctr_info[5];
assign jump = jump_normal | exp_jump;

wire if_handshake = if_valid & if_ready;
assign if_valid = ~mem_stall;
assign if_size = `YSYX210133_SIZE_W; 

localparam NORMAL          = 3'd0;
localparam INTR_WAIT       = 3'd2;
localparam INTR_EXE        = 3'd3;
localparam JUMP            = 3'd4;  

reg [2:0] cs, ns;

always @(posedge clk) begin
  if( rst == 1'b1 )
    cs <= 0;
  else 
    cs <= ns;
end

always @(*) begin
  ns = cs;
  case(cs)
    NORMAL: begin
      if(intr_jump)
        if(exe_vld)
          ns =  JUMP;
        else ns = INTR_WAIT;
        //ns = INTR_MEM_DEAL;
        //ns = JUMP;
      else if(jump)
        ns = JUMP;
      else ns = cs;
    end
    JUMP: begin
      if(fetched)
        ns = NORMAL;
      else ns = cs;
    end
    INTR_WAIT: begin
      if(exe_vld)
        //ns = INTR_EXE;
        ns = JUMP;
      else ns = cs;
    end
    INTR_EXE: begin
      if(dec_mret)
        ns = NORMAL;
      else ns = cs;
    end
    default: ;
  endcase
end

reg [63:0] pc_new_reg;
wire cur_normal = (cs==NORMAL) | (cs==INTR_WAIT);
//wire cur_intr   = (cs==INTR_WAIT) | ((cs==INTR_MEM_DEAL)&(fetched)&(~mem_stall));// | ((cs==INTR_MEM_DEAL)&(fetched)&(~mem_stall)&mem_hs);
//wire cur_mem    = (cs==INTR_MEM_DEAL) & fetched & mem_stall;
wire cur_jump   = (cs==JUMP);

wire cpu_vld  = (fetched & cur_normal);// | (mem_hs);
//reg cpu_vld_reg;

//assign clint_timr_csr_en = (cs==INTR_WAIT & fetched) | ((cs==INTR_MEM_DEAL)&(fetched)&(~mem_stall));
assign clint_timr_csr_en = (cs==INTR_WAIT | cs==NORMAL) & ns==JUMP & intr_jump;

reg jump_flag;
always @(posedge clk) begin
  if(rst)
    jump_flag <= 0;
  else if(jump | clint_timr_csr_en)
    jump_flag <= 1;
  else if(if_handshake)
    jump_flag <= 0;
end

// fetch an instruction
// fetched: next instruction ready
// cpu_vld: current instruction finished
//   __    __    __    __    __
// _|  |__|  |__|  |__|  |__|  |_
//  |     |      \
// hs   fetched   raddr_valid(axi can read new addr)
//    pc/inst upd         next instruction addr upd 
//      cpu_vld(if not l/s)
always@( posedge clk )
begin
  if( rst == 1'b1 )
  begin
    pc <= `YSYX210133_PC_START;
    fetched <= 0;
  end
  else if(cur_normal) begin
    if(if_ready) begin
      fetched <= 1;
      pc <= if_addr;
    end
    else if (fetched)
    begin
      if(cpu_vld)begin
        fetched <= 0;  
      end
    end
    else begin
      fetched <= 0;
    end
  end
  else if(cur_jump) begin
    if(if_handshake) begin// after handshake, cpu execute fetched instr
      fetched <= 1;
      //if(~jump_flag) begin
        pc <= if_addr;
    end
    else begin
      fetched <= 0;
    end
  end
end

always @(posedge clk) begin 
  if(rst) begin
    cpu_vld_reg <= 0;
    inst_reg <= 0;
  end
  else if(if_ready & ~jump_flag) begin
    cpu_vld_reg <= 1;
    inst_reg <= if_data_read[31:0];
  end
  else if(cpu_vld_reg)
    if(!mem_stall) begin
      cpu_vld_reg <= 0;
      inst_reg <= 0;      
    end
end

// always@( posedge clk )
// begin
//   if( rst == 1'b1 )
//   begin
//     raddr_valid <= 1;
//   end
//   else begin
//     raddr_valid <= fetched;
//   end
// end

always@( posedge clk )
begin
  if( rst == 1'b1 )
  begin
    pc_new_reg <= 0;
  end
  else if(jump | clint_timr_csr_en)begin
    pc_new_reg <= (pc_new    & {64{jump_normal&(~clint_timr_csr_en)}})
                |  (csr_mepc  & {64{dec_mret}})//exit cxp
                |  (csr_mtvec & {64{dec_exp_ecall}})//enter exp
                |  (csr_mtvec & {64{clint_timr_csr_en}});//interrupt
  end
end

// only when instruction is valid, new pc is correct
always@( posedge clk )
begin
  if( rst == 1'b1 )
  begin
    if_addr <= `YSYX210133_PC_START;
  end
  else if(cur_jump) begin
    if(fetched) if_addr <= pc_new_reg;
  end
  else if(cur_normal) begin
    if(fetched & cpu_vld) begin
      if (jump | exp_jump | intr_jump)
        if_addr <= (pc_new    & {64{jump}})
                |  (csr_mepc  & {64{dec_mret}})//exit cxp
                |  (csr_mtvec & {64{dec_exp_ecall}})//enter exp
                |  (csr_mtvec & {64{intr_jump}});
      else
        if_addr <= if_addr + 4;
    end
   end
end

endmodule

 module ysyx_210133_mem_stage(
    input wire [7:0] dec_ctr_info,
    //input wire [63:0]exe_alu_res,

    input wire [63:0]rs2_data,
    input wire [63:0]exe_mem_addr,
    input wire [3:0] dec_store_info,
    input wire [6:0] dec_load_info,

    output wire [63:0]mem_rd_data,

    // memory interface -- difftest RAM helper
    output wire dtcm_rvalid,
    input wire dtcm_rready,
    output wire dtcm_wvalid,
    input wire dtcm_wready,

    input wire [63:0]dtcm_data_rd,
    output wire [63:0]dtcm_data_wr, 
    //output wire dtcm_rd, dtcm_wr,
    output wire [63:0]dtcm_addr,
    output wire [7:0] wmask,

    output mem_stall,
    //output mem_hs,

    output [1:0] mem_size

 );

// memory interface
wire dtcm_rd, dtcm_wr;

wire r_handshake = dtcm_rvalid & dtcm_rready;
wire w_handshake = dtcm_wvalid & dtcm_wready;

assign dtcm_rvalid = dtcm_rd;
assign dtcm_wvalid = dtcm_wr;

assign mem_stall  = (~r_handshake & dtcm_rd) | (~w_handshake & dtcm_wr);
//assign mem_hs     = r_handshake | w_handshake;

assign dtcm_rd      = dec_ctr_info[2];
assign dtcm_wr      = dec_ctr_info[1];
assign dtcm_addr    = exe_mem_addr;
//assign dtcm_data    = dtcm_data_rd;

// store vector
// mask
wire [7:0] b_mask   = ({8{(dtcm_addr[2:0] == 3'b000)}} & 8'b0000_0001)
                    | ({8{(dtcm_addr[2:0] == 3'b001)}} & 8'b0000_0010)
                    | ({8{(dtcm_addr[2:0] == 3'b010)}} & 8'b0000_0100)
                    | ({8{(dtcm_addr[2:0] == 3'b011)}} & 8'b0000_1000)
                    | ({8{(dtcm_addr[2:0] == 3'b100)}} & 8'b0001_0000)
                    | ({8{(dtcm_addr[2:0] == 3'b101)}} & 8'b0010_0000)
                    | ({8{(dtcm_addr[2:0] == 3'b110)}} & 8'b0100_0000)
                    | ({8{(dtcm_addr[2:0] == 3'b111)}} & 8'b1000_0000);

wire [7:0] h_mask   = ({8{(dtcm_addr[2:1] == 2'b00)}} & 8'b0000_0011)
                    | ({8{(dtcm_addr[2:1] == 2'b01)}} & 8'b0000_1100)
                    | ({8{(dtcm_addr[2:1] == 2'b10)}} & 8'b0011_0000)
                    | ({8{(dtcm_addr[2:1] == 2'b11)}} & 8'b1100_0000);

wire [7:0] w_mask   = ({8{(dtcm_addr[2] == 1'b0)}} & 8'b0000_1111)
                    | ({8{(dtcm_addr[2] == 1'b1)}} & 8'b1111_0000);

wire [7:0] d_mask  = 8'b1111_1111;

// wire [7:0] b_mask   = (8'b0000_0001);

// wire [7:0] h_mask   = (8'b0000_0011);

//wire [7:0] w_mask   = (8'b0000_1111);

// wire [7:0] d_mask  = 8'b1111_1111;

assign wmask   = ({8{dec_store_info[3]}} & b_mask)
               | ({8{dec_store_info[2]}} & h_mask)
               | ({8{dec_store_info[1]}} & w_mask)
               | ({8{dec_store_info[0]}} & d_mask);

// data
wire [63:0] b_data  = ({64{(dtcm_addr[2:0] == 3'b000)}} & {56'b0,rs2_data[7:0]})
                    | ({64{(dtcm_addr[2:0] == 3'b001)}} & {48'b0,rs2_data[7:0],8'b0})
                    | ({64{(dtcm_addr[2:0] == 3'b010)}} & {40'b0,rs2_data[7:0],16'b0})
                    | ({64{(dtcm_addr[2:0] == 3'b011)}} & {32'b0,rs2_data[7:0],24'b0})
                    | ({64{(dtcm_addr[2:0] == 3'b100)}} & {24'b0,rs2_data[7:0],32'b0})
                    | ({64{(dtcm_addr[2:0] == 3'b101)}} & {16'b0,rs2_data[7:0],40'b0})
                    | ({64{(dtcm_addr[2:0] == 3'b110)}} & {8'b0,rs2_data[7:0],48'b0})
                    | ({64{(dtcm_addr[2:0] == 3'b111)}} & {rs2_data[7:0],56'b0});

wire [63:0] h_data  = ({64{(dtcm_addr[2:1] == 2'b00)}} & {48'b0,rs2_data[15:0]})
                    | ({64{(dtcm_addr[2:1] == 2'b01)}} & {32'b0,rs2_data[15:0],16'b0})
                    | ({64{(dtcm_addr[2:1] == 2'b10)}} & {16'b0,rs2_data[15:0],32'b0})
                    | ({64{(dtcm_addr[2:1] == 2'b11)}} & {rs2_data[15:0],48'b0});

 wire [63:0] w_data  = ({64{(dtcm_addr[2] == 1'b0)}} & {32'b0,rs2_data[31:0]})
                     | ({64{(dtcm_addr[2] == 1'b1)}} & {rs2_data[31:0],32'b0});

// wire [63:0] b_data  = ({56'b0,rs2_data[7:0]});

// wire [63:0] h_data  = ({48'b0,rs2_data[15:0]});

//wire [63:0] w_data  = ({32'b0,rs2_data[31:0]});

wire [63:0] d_data  = rs2_data;

assign dtcm_data_wr = ({64{dec_store_info[3]}} & b_data)
                    | ({64{dec_store_info[2]}} & h_data)
                    | ({64{dec_store_info[1]}} & w_data)
                    | ({64{dec_store_info[0]}} & d_data);

// // load vector 
// wire [63:0] rv_lb_data  = ({64{(dtcm_addr[2:0] == 3'b000)}} & {{56{dtcm_data_rd[7]}}, dtcm_data_rd[7:0]})
//                         | ({64{(dtcm_addr[2:0] == 3'b001)}} & {{56{dtcm_data_rd[15]}}, dtcm_data_rd[15:8]})
//                         | ({64{(dtcm_addr[2:0] == 3'b010)}} & {{56{dtcm_data_rd[23]}}, dtcm_data_rd[23:16]})
//                         | ({64{(dtcm_addr[2:0] == 3'b011)}} & {{56{dtcm_data_rd[31]}}, dtcm_data_rd[31:24]})
//                         | ({64{(dtcm_addr[2:0] == 3'b100)}} & {{56{dtcm_data_rd[39]}}, dtcm_data_rd[39:32]})
//                         | ({64{(dtcm_addr[2:0] == 3'b101)}} & {{56{dtcm_data_rd[47]}}, dtcm_data_rd[47:40]})
//                         | ({64{(dtcm_addr[2:0] == 3'b110)}} & {{56{dtcm_data_rd[55]}}, dtcm_data_rd[55:48]})
//                         | ({64{(dtcm_addr[2:0] == 3'b111)}} & {{56{dtcm_data_rd[63]}}, dtcm_data_rd[63:56]});

// wire [63:0] rv_lh_data  = ({64{(dtcm_addr[2:1] == 2'b00)}} & {{48{dtcm_data_rd[15]}}, dtcm_data_rd[15:0]})
//                         | ({64{(dtcm_addr[2:1] == 2'b01)}} & {{48{dtcm_data_rd[31]}}, dtcm_data_rd[31:16]})
//                         | ({64{(dtcm_addr[2:1] == 2'b10)}} & {{48{dtcm_data_rd[47]}}, dtcm_data_rd[47:32]})
//                         | ({64{(dtcm_addr[2:1] == 2'b11)}} & {{48{dtcm_data_rd[63]}}, dtcm_data_rd[63:48]});

// wire [63:0] rv_lw_data  = ({64{(dtcm_addr[2] == 1'b0)}} & {{32{dtcm_data_rd[31]}}, dtcm_data_rd[31:0]})
//                         | ({64{(dtcm_addr[2] == 1'b1)}} & {{32{dtcm_data_rd[63]}}, dtcm_data_rd[63:32]});


wire [63:0] rv_lb_data  = {{56{dtcm_data_rd[7]}}, dtcm_data_rd[7:0]};

wire [63:0] rv_lh_data  = {{48{dtcm_data_rd[15]}}, dtcm_data_rd[15:0]};

wire [63:0] rv_lw_data  = {{32{dtcm_data_rd[31]}}, dtcm_data_rd[31:0]};

wire [63:0] rv_ld_data   = dtcm_data_rd;
wire [63:0] rv_lbu_data  = rv_lb_data & 64'h0000_0000_0000_00ff;
wire [63:0] rv_lhu_data  = rv_lh_data & 64'h0000_0000_0000_ffff;
wire [63:0] rv_lwu_data  = rv_lw_data & 64'h0000_0000_ffff_ffff;

wire[63:0] mem_rd_data_t = ({64{dec_load_info[6]}} & rv_lb_data)
                   | ({64{dec_load_info[5]}} & rv_lh_data)
                   | ({64{dec_load_info[4]}} & rv_lw_data)
                   | ({64{dec_load_info[3]}} & rv_lbu_data)
                   | ({64{dec_load_info[2]}} & rv_lhu_data)
                   | ({64{dec_load_info[1]}} & rv_lwu_data)
                   | ({64{dec_load_info[0]}} & rv_ld_data);

assign mem_rd_data = {64{r_handshake}} & mem_rd_data_t;

assign mem_size = ({2{dec_store_info[3]}} & `YSYX210133_SIZE_B)
                | ({2{dec_store_info[2]}} & `YSYX210133_SIZE_H)
                | ({2{dec_store_info[1]}} & `YSYX210133_SIZE_W)
                | ({2{dec_store_info[0]}} & `YSYX210133_SIZE_D)

                | ({2{dec_load_info[6]}} & `YSYX210133_SIZE_B)
                | ({2{dec_load_info[5]}} & `YSYX210133_SIZE_H)
                | ({2{dec_load_info[4]}} & `YSYX210133_SIZE_W)
                | ({2{dec_load_info[3]}} & `YSYX210133_SIZE_B)
                | ({2{dec_load_info[2]}} & `YSYX210133_SIZE_H)
                | ({2{dec_load_info[1]}} & `YSYX210133_SIZE_W)
                | ({2{dec_load_info[0]}} & `YSYX210133_SIZE_D);
endmodule

module ysyx_210133_regfile(
    input  wire clk,
	input  wire rst,
	
	input  wire  [4  : 0] w_addr,
	input  wire  [63:0] w_data,
	input  wire 		  w_ena,
	
	input  wire  [4  : 0] r_addr1,
	output reg   [63:0] r_data1,
	input  wire 		  r_ena1,
	
	input  wire  [4  : 0] r_addr2,
	output reg   [63:0] r_data2,
	input  wire 		  r_ena2

	//output wire [63:0] regs_o[0 : 31]        // difftest
    );

    // 32 registers
	reg [63:0] 	regs[0 : 31];
	
	always @(negedge clk) // to solve data hazards
	begin
		if ( rst == 1'b1 ) 
		begin
			regs[ 0] <= `YSYX210133_ZERO_WORD;
			regs[ 1] <= `YSYX210133_ZERO_WORD;
			regs[ 2] <= `YSYX210133_ZERO_WORD;
			regs[ 3] <= `YSYX210133_ZERO_WORD;
			regs[ 4] <= `YSYX210133_ZERO_WORD;
			regs[ 5] <= `YSYX210133_ZERO_WORD;
			regs[ 6] <= `YSYX210133_ZERO_WORD;
			regs[ 7] <= `YSYX210133_ZERO_WORD;
			regs[ 8] <= `YSYX210133_ZERO_WORD;
			regs[ 9] <= `YSYX210133_ZERO_WORD;
			regs[10] <= `YSYX210133_ZERO_WORD;
			regs[11] <= `YSYX210133_ZERO_WORD;
			regs[12] <= `YSYX210133_ZERO_WORD;
			regs[13] <= `YSYX210133_ZERO_WORD;
			regs[14] <= `YSYX210133_ZERO_WORD;
			regs[15] <= `YSYX210133_ZERO_WORD;
			regs[16] <= `YSYX210133_ZERO_WORD;
			regs[17] <= `YSYX210133_ZERO_WORD;
			regs[18] <= `YSYX210133_ZERO_WORD;
			regs[19] <= `YSYX210133_ZERO_WORD;
			regs[20] <= `YSYX210133_ZERO_WORD;
			regs[21] <= `YSYX210133_ZERO_WORD;
			regs[22] <= `YSYX210133_ZERO_WORD;
			regs[23] <= `YSYX210133_ZERO_WORD;
			regs[24] <= `YSYX210133_ZERO_WORD;
			regs[25] <= `YSYX210133_ZERO_WORD;
			regs[26] <= `YSYX210133_ZERO_WORD;
			regs[27] <= `YSYX210133_ZERO_WORD;
			regs[28] <= `YSYX210133_ZERO_WORD;
			regs[29] <= `YSYX210133_ZERO_WORD;
			regs[30] <= `YSYX210133_ZERO_WORD;
			regs[31] <= `YSYX210133_ZERO_WORD;
		end
		else 
		begin
			if ((w_ena == 1'b1) && (w_addr != 5'h00))	
				regs[w_addr] <= w_data;
		end
	end
	
	always @(*) begin
		if (rst == 1'b1)
			r_data1 = `YSYX210133_ZERO_WORD;
		else if (r_ena1 == 1'b1)
			r_data1 = regs[r_addr1];
		else
			r_data1 = `YSYX210133_ZERO_WORD;
	end
	
	always @(*) begin
		if (rst == 1'b1)
			r_data2 = `YSYX210133_ZERO_WORD;
		else if (r_ena2 == 1'b1)
			r_data2 = regs[r_addr2];
		else
			r_data2 = `YSYX210133_ZERO_WORD;
	end

endmodule


module ysyx_210133_wb_stage(
      input wire [7:0] dec_ctr_info,
      input wire [63:0]exe_alu_res,
      input wire [63:0]mem_rd_data,
      output wire [63:0]wb_data,

      // CSR
  input [63:0] csr_rdata
  );
  
wire [63:0] wb_alu_data = dec_ctr_info[0] ? mem_rd_data : exe_alu_res;
wire [63:0] wb_csr_data = csr_rdata;

assign wb_data = dec_ctr_info[7]? wb_csr_data : wb_alu_data;

endmodule

module ysyx_210133_axi_dff(
  input               clk,
  input               rst,

  input       [7:0] strb,
  input               wr_en, 
  input      [63:0] dnxt,
  output     [63:0] qout
);

reg [63:0] qout_r;
integer  byte_index;

always @(posedge clk)
begin
  if (rst)
    qout_r <= 0;
  else if (wr_en)
    for ( byte_index = 0; byte_index < 8; byte_index = byte_index+1 )
      if ( strb[byte_index] == 1 ) begin
        qout_r[(byte_index*8) +: 8] <= dnxt[(byte_index*8) +: 8];//
      end  
end

assign qout = qout_r;

endmodule

module ysyx_210133_csr_dff(
  input               clk,
  input               rst,

  input       [63:0] d_init,
  input               wr_en, 
  input      [63:0] dnxt,
  output     [63:0] qout
);

reg [63:0] qout_r;

always @(posedge clk)
begin
  if (rst)
    qout_r <= d_init;
  else if (wr_en)
    qout_r <= dnxt;
end

assign qout = qout_r;

endmodule


module ysyx_210133_pipe_dff #(
  parameter DW = 64
)(
  input               clk,
  input               rst,

  input               flush, 
  input               stall,
  input      [DW-1:0] dnxt,
  output     [DW-1:0] qout
);

reg [DW-1:0] qout_r;

always @(posedge clk)
begin
  if (rst)
    qout_r <= {DW{1'b0}};
  else if (flush)
    qout_r <= {DW{1'b0}};
  else if (stall)
    qout_r <= qout_r;
  else
    qout_r <= dnxt;
end

assign qout = qout_r;

endmodule
