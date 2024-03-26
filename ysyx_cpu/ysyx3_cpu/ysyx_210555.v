
`timescale 1ns / 1ps

`define	YSYX210555_ZERO_WORD	64'h00000000_00000000
`define	YSYX210555_PC_START		64'h00000000_30000000  
`define	YSYX210555_RAM_START	64'h00000000_80000000   
`define	YSYX210555_REG_BUS		63: 0


`define YSYX210555_AXI_ADDR_WIDTH      32
`define YSYX210555_AXI_DATA_WIDTH      64
`define YSYX210555_AXI_ID_WIDTH        4
//`define YSYX210555_AXI_USER_WIDTH      1

`define YSYX210555_SIZE_B              2'b00
`define YSYX210555_SIZE_H              2'b01
`define YSYX210555_SIZE_W              2'b10
`define YSYX210555_SIZE_D              2'b11

`define YSYX210555_REQ_READ            1'b0
`define YSYX210555_REQ_WRITE           1'b1


`define	YSYX210555_EX_OP_ADD	8'b00000001
`define	YSYX210555_EX_OP_SUB	8'b00000010
`define	YSYX210555_EX_OP_SLTU	8'b00000101
`define	YSYX210555_EX_OP_SLT 	8'b00000100
`define	YSYX210555_EX_OP_OR 	8'b00001000
`define	YSYX210555_EX_OP_XOR	8'b00001010
`define	YSYX210555_EX_OP_AND	8'b00010000
`define	YSYX210555_EX_OP_SLL	8'b00100000
`define	YSYX210555_EX_OP_SLLW	8'b00110000
`define	YSYX210555_EX_OP_SRL	8'b01000000
`define	YSYX210555_EX_OP_SRLW	8'b01001000
`define	YSYX210555_EX_OP_SRA	8'b10000000
`define	YSYX210555_EX_OP_SRAW   8'b10010000


`define YSYX210555_CTRL_BUS				 38: 0
`define YSYX210555_CTRL_INST_CSR_TYPE	  6: 4
`define YSYX210555_CTRL_INST_BRANCH		 24:20
`define YSYX210555_CTRL_INST_MEM_TYPE	 33:28

`define YSYX210555_CTRL_RS1_RD_ENA			0
`define YSYX210555_CTRL_RS2_RD_ENA			1
`define YSYX210555_CTRL_CSR_RD_ENA			2
`define YSYX210555_CTRL_CSR_WR_ENA			3
`define YSYX210555_CTRL_INST_CSR_RW		 	4
`define YSYX210555_CTRL_INST_CSR_RS		 	5
`define YSYX210555_CTRL_INST_CSR_RC		 	6
`define YSYX210555_CTRL_INST_CSR_IMM		7
`define YSYX210555_CTRL_INST_ECALL			8
`define YSYX210555_CTRL_INST_MRET			9
`define YSYX210555_CTRL_ALU_OP2_IMM		 	10
`define YSYX210555_CTRL_INST_OP_WORD		11
`define YSYX210555_CTRL_ALU_OP				19:12
`define YSYX210555_CTRL_INST_BRANCH_BEQ	 	20
`define YSYX210555_CTRL_INST_BRANCH_BNE	 	21
`define YSYX210555_CTRL_INST_BRANCH_BLT	 	22
`define YSYX210555_CTRL_INST_BRANCH_BGE	 	23
`define YSYX210555_CTRL_INST_BRANCH_UNSIGED 24
`define YSYX210555_CTRL_INST_JUMP			25
`define YSYX210555_CTRL_INST_JUMP_JAL		26
`define YSYX210555_CTRL_INST_JUMP_JALR		27
`define YSYX210555_CTRL_MEM_RD_ENA			28
`define YSYX210555_CTRL_MEM_WR_ENA			29
`define YSYX210555_CTRL_INST_MEM_UNSIGED	30
`define YSYX210555_CTRL_INST_MEM_BYTE		31
`define YSYX210555_CTRL_INST_MEM_HALF		32
`define YSYX210555_CTRL_INST_MEM_WORD		33
`define YSYX210555_CTRL_RD_WR_ENA			34
`define YSYX210555_CTRL_MEM_TO_REGS			35
`define YSYX210555_CTRL_INST_LUI			36
`define YSYX210555_CTRL_PC_IMM_TO_REGS		37
`define YSYX210555_CTRL_CSR_TO_REGS		 	38


//					WIDTH_UNSIGED_TYPE
`define YSYX210555_BRANCH_BEQ		5'b0_0001
`define YSYX210555_BRANCH_BNE		5'b0_0010
`define YSYX210555_BRANCH_BLT		5'b0_0100
`define YSYX210555_BRANCH_BGE		5'b0_1000
`define YSYX210555_BRANCH_BLTU		5'b1_0100
`define YSYX210555_BRANCH_BGEU		5'b1_1000


//					WIDTH_UNSIGED_STORE/LOAD
`define YSYX210555_MEM_OP_SB		6'b001_0_10
`define YSYX210555_MEM_OP_SH		6'b010_0_10
`define YSYX210555_MEM_OP_SW		6'b100_0_10
`define YSYX210555_MEM_OP_SD		6'b000_0_10
`define YSYX210555_MEM_OP_LB		6'b001_0_01
`define YSYX210555_MEM_OP_LH		6'b010_0_01
`define YSYX210555_MEM_OP_LW		6'b100_0_01
`define YSYX210555_MEM_OP_LD		6'b000_0_01
`define YSYX210555_MEM_OP_LBU		6'b001_1_01
`define YSYX210555_MEM_OP_LHU		6'b010_1_01
`define YSYX210555_MEM_OP_LWU		6'b100_1_01


`define YSYX210555_CSR_ADDR_SSTATUS		12'h100
`define YSYX210555_CSR_ADDR_MSTATUS		12'h300
`define YSYX210555_CSR_ADDR_MIE			12'h304
`define YSYX210555_CSR_ADDR_MTVEC		12'h305
`define YSYX210555_CSR_ADDR_MSCRATCH	12'h340
`define YSYX210555_CSR_ADDR_MEPC		12'h341
`define YSYX210555_CSR_ADDR_MCAUSE		12'h342
`define YSYX210555_CSR_ADDR_MIP			12'h344
`define YSYX210555_CSR_ADDR_MCYCLE		12'hB00

`define YSYX210555_EXCEPTION_EXCEPTION_ILGL_INST	3'b100
`define YSYX210555_EXCEPTION_EXCEPTION_ECALL	    3'b001
`define YSYX210555_EXCEPTION_INTERRUPT_TIMER	    3'b010


module ysyx_210555(
    input                               clock,
    input                               reset,
	input								io_interrupt,

    input                               io_master_awready,
    output                              io_master_awvalid,
    output [31:0]        				io_master_awaddr,
    output [3:0]         			 	io_master_awid,
    output [7:0]                        io_master_awlen,
    output [2:0]                        io_master_awsize,
    output [1:0]                        io_master_awburst,
    
    input                               io_master_wready,
    output                              io_master_wvalid,
    output [63:0]        				io_master_wdata,
    output [7:0]      					io_master_wstrb,
    output                              io_master_wlast,
    
    output                              io_master_bready,
    input                               io_master_bvalid,
    input  [1:0]                        io_master_bresp,
    input  [3:0]          				io_master_bid,

    input                               io_master_arready,
    output                              io_master_arvalid,
    output [31:0]       			    io_master_araddr,
    output [3:0]          				io_master_arid,
    output [7:0]                        io_master_arlen,
    output [2:0]                        io_master_arsize,
    output [1:0]                        io_master_arburst,
    
    output                              io_master_rready,
    input                               io_master_rvalid,
    input  [1:0]                        io_master_rresp,
    input  [63:0]        				io_master_rdata,
    input                               io_master_rlast,
    input  [3:0]          				io_master_rid,
	
	output								io_slave_awready,
	input								io_slave_awvalid,
	input	[31:0]						io_slave_awaddr ,
	input	[3:0]						io_slave_awid   ,
	input	[7:0]						io_slave_awlen  ,
	input	[2:0]						io_slave_awsize ,
	input	[1:0]						io_slave_awburst,
	
	output								io_slave_wready ,
	input								io_slave_wvalid ,
	input	[63:0]						io_slave_wdata  ,
	input	[7:0]						io_slave_wstrb  ,
	input								io_slave_wlast  ,
	
	input								io_slave_bready ,
	output								io_slave_bvalid ,
	output	[1:0]						io_slave_bresp  ,
	output	[3:0]						io_slave_bid    ,
	
	output								io_slave_arready,
	input								io_slave_arvalid,
	input	[31:0]						io_slave_araddr ,
	input	[3:0]						io_slave_arid   ,
	input	[7:0]						io_slave_arlen  ,
	input	[2:0]						io_slave_arsize ,
	input	[1:0]						io_slave_arburst,
	
	input								io_slave_rready ,
	output								io_slave_rvalid ,
	output	[1:0]						io_slave_rresp  ,
	output	[63:0]						io_slave_rdata  ,
	output								io_slave_rlast  ,
	output	[3:0]						io_slave_rid
);

    wire aw_ready;
    wire aw_valid;
    wire [`YSYX210555_AXI_ADDR_WIDTH-1:0] aw_addr;
//  wire [2:0] aw_prot;
    wire [`YSYX210555_AXI_ID_WIDTH-1:0] aw_id;
//  wire [`YSYX210555_AXI_USER_WIDTH-1:0] aw_user;
    wire [7:0] aw_len;
    wire [2:0] aw_size;
    wire [1:0] aw_burst;
//  wire aw_lock;
//  wire [3:0] aw_cache;
//  wire [3:0] aw_qos;
//  wire [3:0] aw_region;

    wire w_ready;
    wire w_valid;
    wire [`YSYX210555_AXI_DATA_WIDTH-1:0] w_data;
    wire [`YSYX210555_AXI_DATA_WIDTH/8-1:0] w_strb;
    wire w_last;
//  wire [`YSYX210555_AXI_USER_WIDTH-1:0] w_user;
    
    wire b_ready;
    wire b_valid;
    wire [1:0] b_resp;
    wire [`YSYX210555_AXI_ID_WIDTH-1:0] b_id;
//  wire [`YSYX210555_AXI_USER_WIDTH-1:0] b_user;

    wire ar_ready;
    wire ar_valid;
    wire [`YSYX210555_AXI_ADDR_WIDTH-1:0] ar_addr;
//  wire [2:0] ar_prot;
    wire [`YSYX210555_AXI_ID_WIDTH-1:0] ar_id;
//  wire [`YSYX210555_AXI_USER_WIDTH-1:0] ar_user;
    wire [7:0] ar_len;
    wire [2:0] ar_size;
    wire [1:0] ar_burst;
//  wire ar_lock;
//  wire [3:0] ar_cache;
//  wire [3:0] ar_qos;
//  wire [3:0] ar_region;
    
    wire r_ready;
    wire r_valid;
    wire [1:0] r_resp;
    wire [`YSYX210555_AXI_DATA_WIDTH-1:0] r_data;
    wire r_last;
    wire [`YSYX210555_AXI_ID_WIDTH-1:0] r_id;
//  wire [`YSYX210555_AXI_USER_WIDTH-1:0] r_user;
	
	assign aw_ready              = io_master_awready;
	assign io_master_awvalid     = aw_valid;
	assign io_master_awaddr      = aw_addr;
	assign io_master_awid        = aw_id;
	assign io_master_awlen       = aw_len;
	assign io_master_awsize      = aw_size;
	assign io_master_awburst     = aw_burst;
	
	assign w_ready               = io_master_wready;
	assign io_master_wvalid      = w_valid;
	assign io_master_wdata       = w_data;
	assign io_master_wstrb       = w_strb;
	assign io_master_wlast       = w_last;

    assign io_master_bready      = b_ready;
	assign b_valid               = io_master_bvalid;
	assign b_resp                = io_master_bresp;
	assign b_id                  = io_master_bid;
	
	assign ar_ready              = io_master_arready;
    assign io_master_arvalid     = ar_valid;
    assign io_master_araddr      = ar_addr;
    assign io_master_arid        = ar_id;
    assign io_master_arlen       = ar_len;
    assign io_master_arsize      = ar_size;
    assign io_master_arburst     = ar_burst;
    
    assign io_master_rready      = r_ready;
    assign r_valid               = io_master_rvalid;
    assign r_resp                = io_master_rresp;
    assign r_data                = io_master_rdata;
    assign r_last                = io_master_rlast;
    assign r_id                  = io_master_rid;
	 
	assign io_slave_awready      = 1'b0;
	assign io_slave_wready       = 1'b0;
	assign io_slave_bvalid       = 1'b0;
	assign io_slave_bresp        = 2'd0;
	assign io_slave_bid          = 4'd0;
	assign io_slave_arready      = 1'b0;
	assign io_slave_rvalid       = 1'b0;
	assign io_slave_rresp        = 2'd0;
	assign io_slave_rdata        = 64'd0;
	assign io_slave_rlast        = 1'b0;
	assign io_slave_rid          = 4'd0;
	
wire handshake_done;
wire axirw_ready;
wire [1:0] axirw_resp;
wire [`YSYX210555_REG_BUS] axirw_rdata;
wire axirw_req;
wire axirw_valid;
wire [1:0] axirw_size;
wire [`YSYX210555_REG_BUS] axirw_addr;
wire [`YSYX210555_REG_BUS] axirw_wdata;

wire if_valid;
//wire if_ready;
wire if_req;
wire [63:0] if_data_read;
wire [63:0] if_addr;
wire [1:0] if_size;
wire [1:0] if_resp;
//wire mem_ready;
wire [1:0] mem_resp;
wire [`YSYX210555_REG_BUS] mem_rdata;
wire mem_req;
wire mem_valid;
wire [1:0] mem_size;
wire [`YSYX210555_REG_BUS] mem_addr;
wire [`YSYX210555_REG_BUS] mem_wdata;

wire [`YSYX210555_REG_BUS] clint_addr;
wire [`YSYX210555_REG_BUS] clint_wr_data;
wire interrupt_timer;
wire clint_req;
wire clint_valid;
wire [1:0] clint_size;
wire clint_ready;
wire [1:0] clint_resp;
wire [`YSYX210555_REG_BUS] clint_rd_data;

ysyx_210555_axi_rw uut_axi_rw (
    .i_clk                          (clock),
    .i_rst                          (reset),

    .i_rw_valid                     (axirw_valid),
    .i_rw_req                       (axirw_req),
    .i_w_data                       (axirw_wdata),
    .i_rw_addr                      (axirw_addr),
    .i_rw_size                      (axirw_size),
    .o_rw_ready                     (axirw_ready),
    .o_rw_resp                      (axirw_resp),
    .o_r_data                       (axirw_rdata),

    .i_axi_aw_ready                 (aw_ready),
    .o_axi_aw_valid                 (aw_valid),
    .o_axi_aw_addr                  (aw_addr),
//  .o_axi_aw_prot                  (aw_prot),
    .o_axi_aw_id                    (aw_id),
//  .o_axi_aw_user                  (aw_user),
    .o_axi_aw_len                   (aw_len),
    .o_axi_aw_size                  (aw_size),
    .o_axi_aw_burst                 (aw_burst),
//  .o_axi_aw_lock                  (aw_lock),
//  .o_axi_aw_cache                 (aw_cache),
//  .o_axi_aw_qos                   (aw_qos),
//  .o_axi_aw_region                (aw_region),

    .i_axi_w_ready                  (w_ready),
    .o_axi_w_valid                  (w_valid),
    .o_axi_w_data                   (w_data),
    .o_axi_w_strb                   (w_strb),
    .o_axi_w_last                   (w_last),
//  .o_axi_w_user                   (w_user),
    
    .o_axi_b_ready                  (b_ready),
    .i_axi_b_valid                  (b_valid),
    .i_axi_b_resp                   (b_resp),
    .i_axi_b_id                     (b_id),
//  .i_axi_b_user                   (1'b0),

    .i_axi_ar_ready                 (ar_ready),
    .o_axi_ar_valid                 (ar_valid),
    .o_axi_ar_addr                  (ar_addr),
//  .o_axi_ar_prot                  (ar_prot),
    .o_axi_ar_id                    (ar_id),
//  .o_axi_ar_user                  (ar_user),
    .o_axi_ar_len                   (ar_len),
    .o_axi_ar_size                  (ar_size),
    .o_axi_ar_burst                 (ar_burst),
//  .o_axi_ar_lock                  (ar_lock),
//  .o_axi_ar_cache                 (ar_cache),
//  .o_axi_ar_qos                   (ar_qos),
//  .o_axi_ar_region                (ar_region),
    
    .o_axi_r_ready                  (r_ready),
    .i_axi_r_valid                  (r_valid),
    .i_axi_r_resp                   (r_resp),
    .i_axi_r_data                   (r_data),
    .i_axi_r_last                   (r_last),
    .i_axi_r_id                     (r_id)
//  .i_axi_r_user                   (1'b0)
);


ysyx_210555_arbiter	uut_arbiter(
	.i_clk							(clock),
	.i_rst							(reset),
	
	.o_handshake_done				(handshake_done),
	
//	.o_if_ready						(if_ready),
	.o_if_resp						(if_resp),
	.o_if_inst						(if_data_read),
	.i_if_req						(if_req),
	.i_if_valid						(if_valid),
	.i_if_size						(if_size),
	.i_if_inst_addr					(if_addr),
	
//	.o_mem_ready					(mem_ready),
	.o_mem_resp						(mem_resp),
	.o_mem_rdata					(mem_rdata),
	.i_mem_req						(mem_req),
	.i_mem_valid					(mem_valid),
	.i_mem_size						(mem_size),
	.i_mem_addr						(mem_addr),
	.i_mem_wdata					(mem_wdata),

	.i_clint_ready					(clint_ready),
	.i_clint_resp					(clint_resp),
	.i_clint_rdata					(clint_rd_data),
	.o_clint_req					(clint_req),
	.o_clint_valid					(clint_valid),
	.o_clint_size					(clint_size),
	.o_clint_addr					(clint_addr),
	.o_clint_wdata					(clint_wr_data),
	
	.i_axirw_ready					(axirw_ready),
	.i_axirw_resp					(axirw_resp),
	.i_axirw_rdata					(axirw_rdata),
	.o_axirw_req					(axirw_req),
	.o_axirw_valid					(axirw_valid),
	.o_axirw_size					(axirw_size),
	.o_axirw_addr					(axirw_addr),
	.o_axirw_wdata					(axirw_wdata)
);


ysyx_210555_cpu_diff	uut_cpu_diff(
	.clock                          (clock),
    .reset                          (reset),
	.i_interrupt_timer				(interrupt_timer),
	.i_handshake_done				(handshake_done),
	
//	.i_if_ready                     (if_ready),
	.i_if_resp                      (if_resp),
	.i_if_inst						(if_data_read),
	.o_if_req						(if_req),
	.o_if_valid                     (if_valid),
	.o_if_size                      (if_size),
	.o_if_inst_addr					(if_addr),
	
//	.i_mem_ready					(mem_ready),
	.i_mem_resp						(mem_resp),
	.i_mem_rdata					(mem_rdata),
	.o_mem_req						(mem_req),
	.o_mem_valid					(mem_valid),
	.o_mem_size						(mem_size),
	.o_mem_addr						(mem_addr),
	.o_mem_wdata					(mem_wdata)
);


ysyx_210555_clint	uut_clint(
	.i_clk							(clock),
	.i_rst							(reset),
	
	.i_clint_addr					(clint_addr),
	.i_clint_wr_data				(clint_wr_data),
	
	.o_interrupt_timer				(interrupt_timer),
	
	.i_clint_req					(clint_req),
	.i_clint_valid					(clint_valid),
	.i_clint_size					(clint_size),
	.o_clint_ready					(clint_ready),
	.o_clint_resp					(clint_resp),
	.o_clint_rd_data				(clint_rd_data)
);

endmodule
 
 

module ysyx_210555_cpu_diff(
	input clock,
	input reset,
	input i_interrupt_timer,
	input i_handshake_done,
	
//	input i_if_ready,
	input [1:0] i_if_resp,
	input [`YSYX210555_REG_BUS] i_if_inst,
	output o_if_req,
	output o_if_valid,
	output [1:0] o_if_size,
	output [`YSYX210555_REG_BUS] o_if_inst_addr,
	
//	input i_mem_ready,
	input [1:0] i_mem_resp,
	input [`YSYX210555_REG_BUS] i_mem_rdata,
	output o_mem_req,
	output o_mem_valid,
	output [1:0] o_mem_size,
	output [`YSYX210555_REG_BUS] o_mem_addr,
	output [`YSYX210555_REG_BUS] o_mem_wdata
);

wire i_clk = clock;
wire i_rst = reset;

ysyx_210555_rvcpu	uut_rvcpu(
	.i_clk					(i_clk),
	.i_rst					(i_rst),
	.i_interrupt_timer		(i_interrupt_timer),
	.i_handshake_done		(i_handshake_done),
	
//	.i_if_ready				(i_if_ready),
	.i_if_resp				(i_if_resp),
	.i_if_inst				(i_if_inst),
	.o_if_req				(o_if_req),
	.o_if_valid				(o_if_valid),
	.o_if_size				(o_if_size),
	.o_if_inst_addr			(o_if_inst_addr),

//	.i_mem_ready			(i_mem_ready),
	.i_mem_resp				(i_mem_resp),
	.i_mem_rdata			(i_mem_rdata),
	.o_mem_req				(o_mem_req),
	.o_mem_valid			(o_mem_valid),
	.o_mem_size				(o_mem_size),
	.o_mem_addr				(o_mem_addr),
	.o_mem_wdata			(o_mem_wdata)
);



endmodule


 

// Burst types
`define AXI_BURST_TYPE_FIXED                                2'b00
`define AXI_BURST_TYPE_INCR                                 2'b01
`define AXI_BURST_TYPE_WRAP                                 2'b10
// Access permissions
//`define AXI_PROT_UNPRIVILEGED_ACCESS                        3'b000
//`define AXI_PROT_PRIVILEGED_ACCESS                          3'b001
//`define AXI_PROT_SECURE_ACCESS                              3'b000
//`define AXI_PROT_NON_SECURE_ACCESS                          3'b010
//`define AXI_PROT_DATA_ACCESS                                3'b000
//`define AXI_PROT_INSTRUCTION_ACCESS                         3'b100
// Memory types (AR)
//`define AXI_ARCACHE_DEVICE_NON_BUFFERABLE                   4'b0000
//`define AXI_ARCACHE_DEVICE_BUFFERABLE                       4'b0001
//`define AXI_ARCACHE_NORMAL_NON_CACHEABLE_NON_BUFFERABLE     4'b0010
//`define AXI_ARCACHE_NORMAL_NON_CACHEABLE_BUFFERABLE         4'b0011
//`define AXI_ARCACHE_WRITE_THROUGH_NO_ALLOCATE               4'b1010
//`define AXI_ARCACHE_WRITE_THROUGH_READ_ALLOCATE             4'b1110
//`define AXI_ARCACHE_WRITE_THROUGH_WRITE_ALLOCATE            4'b1010
//`define AXI_ARCACHE_WRITE_THROUGH_READ_AND_WRITE_ALLOCATE   4'b1110
//`define AXI_ARCACHE_WRITE_BACK_NO_ALLOCATE                  4'b1011
//`define AXI_ARCACHE_WRITE_BACK_READ_ALLOCATE                4'b1111
//`define AXI_ARCACHE_WRITE_BACK_WRITE_ALLOCATE               4'b1011
//`define AXI_ARCACHE_WRITE_BACK_READ_AND_WRITE_ALLOCATE      4'b1111
// Memory types (AW)
//`define AXI_AWCACHE_DEVICE_NON_BUFFERABLE                   4'b0000
//`define AXI_AWCACHE_DEVICE_BUFFERABLE                       4'b0001
//`define AXI_AWCACHE_NORMAL_NON_CACHEABLE_NON_BUFFERABLE     4'b0010
//`define AXI_AWCACHE_NORMAL_NON_CACHEABLE_BUFFERABLE         4'b0011
//`define AXI_AWCACHE_WRITE_THROUGH_NO_ALLOCATE               4'b0110
//`define AXI_AWCACHE_WRITE_THROUGH_READ_ALLOCATE             4'b0110
//`define AXI_AWCACHE_WRITE_THROUGH_WRITE_ALLOCATE            4'b1110
//`define AXI_AWCACHE_WRITE_THROUGH_READ_AND_WRITE_ALLOCATE   4'b1110
//`define AXI_AWCACHE_WRITE_BACK_NO_ALLOCATE                  4'b0111
//`define AXI_AWCACHE_WRITE_BACK_READ_ALLOCATE                4'b0111
//`define AXI_AWCACHE_WRITE_BACK_WRITE_ALLOCATE               4'b1111
//`define AXI_AWCACHE_WRITE_BACK_READ_AND_WRITE_ALLOCATE      4'b1111
// 
`define AXI_SIZE_BYTES_1                                    3'b000
`define AXI_SIZE_BYTES_2                                    3'b001
`define AXI_SIZE_BYTES_4                                    3'b010
`define AXI_SIZE_BYTES_8                                    3'b011
`define AXI_SIZE_BYTES_16                                   3'b100
`define AXI_SIZE_BYTES_32                                   3'b101
`define AXI_SIZE_BYTES_64                                   3'b110
`define AXI_SIZE_BYTES_128                                  3'b111


module ysyx_210555_axi_rw # (
    parameter YSYX210555_RW_DATA_WIDTH  = 64,
    parameter YSYX210555_RW_ADDR_WIDTH  = 64,
    parameter YSYX210555_AXI_DATA_WIDTH = 64,
    parameter YSYX210555_AXI_ADDR_WIDTH = 32,
    parameter YSYX210555_AXI_ID_WIDTH   = 4
//  parameter YSYX210555_AXI_USER_WIDTH = 1
)(
    input                               i_clk,
    input                               i_rst,

	input                               i_rw_valid,
    input                               i_rw_req,
    input  [YSYX210555_RW_DATA_WIDTH-1:0]          i_w_data,
    input  [YSYX210555_RW_ADDR_WIDTH-1:0]          i_rw_addr,
    input  [1:0]                        i_rw_size,
	output                              o_rw_ready,
    output [1:0]                        o_rw_resp,
	output reg [YSYX210555_RW_DATA_WIDTH-1:0]      o_r_data,

    // Advanced Extensible Interface
    input                               i_axi_aw_ready,
    output                              o_axi_aw_valid,
    output [YSYX210555_AXI_ADDR_WIDTH-1:0]         o_axi_aw_addr,
//  output [2:0]                        o_axi_aw_prot,
    output [YSYX210555_AXI_ID_WIDTH-1:0]           o_axi_aw_id,
//  output [YSYX210555_AXI_USER_WIDTH-1:0]         o_axi_aw_user,
    output [7:0]                        o_axi_aw_len,
    output [2:0]                        o_axi_aw_size,
    output [1:0]                        o_axi_aw_burst,
//  output                              o_axi_aw_lock,
//  output [3:0]                        o_axi_aw_cache,
//  output [3:0]                        o_axi_aw_qos,
//  output [3:0]                        o_axi_aw_region,

    input                               i_axi_w_ready,
    output                              o_axi_w_valid,
    output [YSYX210555_AXI_DATA_WIDTH-1:0]         o_axi_w_data,
    output [YSYX210555_AXI_DATA_WIDTH/8-1:0]       o_axi_w_strb,
    output                              o_axi_w_last,
//  output [YSYX210555_AXI_USER_WIDTH-1:0]         o_axi_w_user,
    
    output                              o_axi_b_ready,
    input                               i_axi_b_valid,
    input  [1:0]                        i_axi_b_resp,
    input  [YSYX210555_AXI_ID_WIDTH-1:0]           i_axi_b_id,
//  input  [YSYX210555_AXI_USER_WIDTH-1:0]         i_axi_b_user,

    input                               i_axi_ar_ready,
    output                              o_axi_ar_valid,
    output [YSYX210555_AXI_ADDR_WIDTH-1:0]         o_axi_ar_addr,
//  output [2:0]                        o_axi_ar_prot,
    output [YSYX210555_AXI_ID_WIDTH-1:0]           o_axi_ar_id,
//  output [YSYX210555_AXI_USER_WIDTH-1:0]         o_axi_ar_user,
    output [7:0]                        o_axi_ar_len,
    output [2:0]                        o_axi_ar_size,
    output [1:0]                        o_axi_ar_burst,
//  output                              o_axi_ar_lock,
//  output [3:0]                        o_axi_ar_cache,
//  output [3:0]                        o_axi_ar_qos,
//  output [3:0]                        o_axi_ar_region,
    
    output                              o_axi_r_ready,
    input                               i_axi_r_valid,
    input  [1:0]                        i_axi_r_resp,
    input  [YSYX210555_AXI_DATA_WIDTH-1:0]         i_axi_r_data,
    input                               i_axi_r_last,
    input  [YSYX210555_AXI_ID_WIDTH-1:0]           i_axi_r_id
//  input  [YSYX210555_AXI_USER_WIDTH-1:0]         i_axi_r_user
);

//assign o_axi_aw_region = 4'd0;
//assign o_axi_ar_region = 4'd0;

wire w_trans = i_rw_req == `YSYX210555_REQ_WRITE;
wire r_trans = i_rw_req == `YSYX210555_REQ_READ;
wire w_valid = i_rw_valid & w_trans;
wire r_valid = i_rw_valid & r_trans;

// handshake
wire aw_handshake = i_axi_aw_ready & o_axi_aw_valid;
wire w_handshake  = i_axi_w_ready  & o_axi_w_valid;
wire b_handshake  = o_axi_b_ready  & i_axi_b_valid;
wire ar_handshake = i_axi_ar_ready & o_axi_ar_valid;
wire r_handshake  = o_axi_r_ready  & i_axi_r_valid;

wire w_done     = w_handshake & o_axi_w_last;
wire r_done     = r_handshake & i_axi_r_last;
wire trans_done = w_trans ? b_handshake : r_done;


// ------------------State Machine------------------
localparam [1:0] YSYX210555_W_YSYX210555_STATE_IDLE = 2'b00, YSYX210555_W_STATE_ADDR = 2'b01, YSYX210555_W_STATE_WRITE = 2'b10, YSYX210555_W_STATE_RESP = 2'b11;
localparam [1:0] YSYX210555_R_YSYX210555_STATE_IDLE = 2'b00, YSYX210555_R_STATE_ADDR = 2'b01, YSYX210555_R_STATE_READ  = 2'b10;

reg [1:0] w_state, r_state, w_nstate, r_nstate;
wire w_state_idle = w_state == YSYX210555_W_YSYX210555_STATE_IDLE, w_state_addr = w_state == YSYX210555_W_STATE_ADDR, w_state_write = w_state == YSYX210555_W_STATE_WRITE, w_state_resp = w_state == YSYX210555_W_STATE_RESP;
wire r_state_idle = r_state == YSYX210555_R_YSYX210555_STATE_IDLE, r_state_addr = r_state == YSYX210555_R_STATE_ADDR, r_state_read  = r_state == YSYX210555_R_STATE_READ;

// Wirte State Machine
always @(posedge i_clk) begin
    if(i_rst) w_state <= YSYX210555_W_YSYX210555_STATE_IDLE;
	else w_state <= w_nstate;
end
	
always @(*) begin
    case (w_state)
        YSYX210555_W_YSYX210555_STATE_IDLE:  begin
			if(w_valid)
				 w_nstate = YSYX210555_W_STATE_ADDR;
			else w_nstate = YSYX210555_W_YSYX210555_STATE_IDLE;
		end
        YSYX210555_W_STATE_ADDR:  begin
			if(w_valid & aw_handshake)
				 w_nstate = YSYX210555_W_STATE_WRITE;
			else w_nstate = YSYX210555_W_STATE_ADDR;
		end
        YSYX210555_W_STATE_WRITE: begin
			if(w_valid & w_done)
				 w_nstate = YSYX210555_W_STATE_RESP;
			else w_nstate = YSYX210555_W_STATE_WRITE;
		end
        YSYX210555_W_STATE_RESP:  begin
			if(w_valid & b_handshake)
				 w_nstate = YSYX210555_W_YSYX210555_STATE_IDLE;
			else w_nstate = YSYX210555_W_STATE_RESP;
		end
		default: ;
    endcase
end

// Read State Machine
always @(posedge i_clk) begin
    if (i_rst) r_state <= YSYX210555_R_YSYX210555_STATE_IDLE;
	else r_state <= r_nstate;
end

always @(*) begin
    case (r_state)
		YSYX210555_R_YSYX210555_STATE_IDLE: begin
			if(r_valid)
				 r_nstate = YSYX210555_R_STATE_ADDR;
			else r_nstate = YSYX210555_R_YSYX210555_STATE_IDLE;
		end
		YSYX210555_R_STATE_ADDR: begin
			if(r_valid & ar_handshake)
				 r_nstate = YSYX210555_R_STATE_READ;
			else r_nstate = YSYX210555_R_STATE_ADDR;
		end
		YSYX210555_R_STATE_READ: begin
			if(r_valid & r_done)
				 r_nstate = YSYX210555_R_YSYX210555_STATE_IDLE;
			else r_nstate = YSYX210555_R_STATE_READ;
		end
		default: r_nstate = 2'b00;
    endcase
end


// ------------------Number of transmission------------------
reg [7:0] len;
wire [7:0] axi_len;
wire len_reset   = i_rst | (w_trans & w_state_idle) | (r_trans & r_state_idle);
wire len_incr_en = (len != axi_len) & (w_handshake | r_handshake);	//对齐时axi_len=0, len不自增
always @(posedge i_clk) begin
    if(len_reset)
		len <= 8'd0;
    else if(len_incr_en)
		len <= len +1;
end


// ------------------Process Data------------------
localparam YSYX210555_ALIGNED_WIDTH = $clog2(YSYX210555_AXI_DATA_WIDTH / 8);	//=3
localparam YSYX210555_OFFSET_WIDTH  = $clog2(YSYX210555_AXI_DATA_WIDTH);		//=6
//localparam YSYX210555_AXI_SIZE      = $clog2(YSYX210555_AXI_DATA_WIDTH / 8);	//=3
localparam YSYX210555_MASK_WIDTH    = YSYX210555_AXI_DATA_WIDTH * 2;
localparam YSYX210555_TRANS_LEN     = YSYX210555_RW_DATA_WIDTH / YSYX210555_AXI_DATA_WIDTH; //=1
localparam YSYX210555_BLOCK_TRANS   = YSYX210555_TRANS_LEN > 1 ? 1'b1 : 1'b0;

wire aligned            = YSYX210555_BLOCK_TRANS | i_rw_addr[YSYX210555_ALIGNED_WIDTH-1:0] == 0;
wire size_b             = i_rw_size == `YSYX210555_SIZE_B;
wire size_h             = i_rw_size == `YSYX210555_SIZE_H;
wire size_w             = i_rw_size == `YSYX210555_SIZE_W;
wire size_d             = i_rw_size == `YSYX210555_SIZE_D;
wire [3:0] addr_op1     = {{4-YSYX210555_ALIGNED_WIDTH{1'b0}}, i_rw_addr[YSYX210555_ALIGNED_WIDTH-1:0]};	//={1'b0,i_rw_addr[2:0]}
wire [3:0] addr_op2     = ({4{size_b}} & {4'b0})	//0000，传1Byte，无论起始地址为多少都不会超；
                        | ({4{size_h}} & {4'b1})	//0001，传1Halfword，起始地址为7则超；
                        | ({4{size_w}} & {4'b11})	//0011，传1Word，起始地址为5以上则超；
                        | ({4{size_d}} & {4'b111})	//0111，传1Doubleword，起始地址为1以上则超；
                        ;
wire [3:0] addr_end     = addr_op1 + addr_op2;	//地址最高位=起始地址+（数据字节宽-1）
wire overstep           = addr_end[3:YSYX210555_ALIGNED_WIDTH] != 0;

assign axi_len      = aligned ? YSYX210555_TRANS_LEN - 1 : {{7{1'b0}}, overstep};	//对齐为0，不对齐则为overstep
wire [2:0] axi_size     = (i_rw_addr < 64'h00000000_80000000)? 3'b010 : 3'b011;

wire [YSYX210555_AXI_ADDR_WIDTH-1:0] axi_addr       = (i_rw_addr < 64'h00000000_80000000)?
											 i_rw_addr[YSYX210555_AXI_ADDR_WIDTH-1:0]						  :
											{i_rw_addr[YSYX210555_AXI_ADDR_WIDTH-1:YSYX210555_ALIGNED_WIDTH], {YSYX210555_ALIGNED_WIDTH{1'b0}}}; //每次取32位，低三位和高32位舍弃
wire [YSYX210555_OFFSET_WIDTH-1:0] aligned_offset_l = {{YSYX210555_OFFSET_WIDTH-YSYX210555_ALIGNED_WIDTH{1'b0}}, {i_rw_addr[YSYX210555_ALIGNED_WIDTH-1:0]}} << 3; //{i_rw_addr[2:0]},000}
wire [YSYX210555_OFFSET_WIDTH  :0] aligned_offset_h = 7'd64 - {1'b0, aligned_offset_l}; //64-i_rw_addr[2:0]}*8
wire [YSYX210555_MASK_WIDTH-1:0] mask               = (({YSYX210555_MASK_WIDTH{size_b}} & {{YSYX210555_MASK_WIDTH-8{1'b0}}, 8'hff})
                                          | ({YSYX210555_MASK_WIDTH{size_h}} & {{YSYX210555_MASK_WIDTH-16{1'b0}}, 16'hffff})
                                          | ({YSYX210555_MASK_WIDTH{size_w}} & {{YSYX210555_MASK_WIDTH-32{1'b0}}, 32'hffffffff})
                                          | ({YSYX210555_MASK_WIDTH{size_d}} & {{YSYX210555_MASK_WIDTH-64{1'b0}}, 64'hffffffff_ffffffff})
                                           ) << aligned_offset_l;
wire [YSYX210555_AXI_DATA_WIDTH-1:0] mask_l         = mask[YSYX210555_AXI_DATA_WIDTH-1:0];
wire [YSYX210555_AXI_DATA_WIDTH-1:0] mask_h         = mask[YSYX210555_MASK_WIDTH-1:YSYX210555_AXI_DATA_WIDTH];
										 
wire [YSYX210555_AXI_ID_WIDTH-1:0] axi_id           = {YSYX210555_AXI_ID_WIDTH{1'b0}};
//wire [YSYX210555_AXI_USER_WIDTH-1:0] axi_user       = {YSYX210555_AXI_USER_WIDTH{1'b0}};

reg rw_ready;
wire rw_ready_nxt = trans_done;
wire rw_ready_en  = trans_done | rw_ready;
always @(posedge i_clk) begin
    if (i_rst) begin
        rw_ready <= 0;
    end
    else if (rw_ready_en) begin
        rw_ready <= rw_ready_nxt;
    end
end
//assign o_rw_ready     = rw_ready;
assign o_rw_ready     = rw_ready_nxt;

//reg [1:0] rw_resp;
wire [1:0] rw_resp_nxt = w_trans ? i_axi_b_resp : i_axi_r_resp;
//wire resp_en = trans_done;
/*always @(posedge i_clk) begin
    if (i_rst) begin
        rw_resp <= 0;
    end
    else if (resp_en) begin
        rw_resp <= rw_resp_nxt;
    end
end*/
//assign o_rw_resp      = rw_resp;
assign o_rw_resp      = rw_resp_nxt;


// ------------------Write Transaction------------------

// Write address channel signals
assign o_axi_aw_valid   = w_state_addr;
assign o_axi_aw_addr    = axi_addr;
//assign o_axi_aw_prot    = `AXI_PROT_UNPRIVILEGED_ACCESS | `AXI_PROT_SECURE_ACCESS | `AXI_PROT_DATA_ACCESS;
assign o_axi_aw_id      = axi_id;
//assign o_axi_aw_user    = axi_user;
assign o_axi_aw_len     = axi_len;
assign o_axi_aw_size    = axi_size;
assign o_axi_aw_burst   = `AXI_BURST_TYPE_INCR;
//assign o_axi_aw_lock    = 1'b0;
//assign o_axi_aw_cache   = `AXI_ARCACHE_NORMAL_NON_CACHEABLE_NON_BUFFERABLE;
//assign o_axi_aw_qos     = 4'h0;

// Write data channel signals
reg [YSYX210555_AXI_DATA_WIDTH-1:0]   axi_w_data;
reg [YSYX210555_AXI_DATA_WIDTH/8-1:0] axi_w_strb;
reg                        axi_w_last;

assign o_axi_w_valid    = w_state_write;
assign o_axi_w_data     = axi_w_data;
assign o_axi_w_strb     = axi_w_strb;
assign o_axi_w_last     = axi_w_last;
//assign o_axi_w_user     = axi_user;

wire [YSYX210555_AXI_DATA_WIDTH-1:0] axi_w_data_l = (i_w_data << aligned_offset_l) & mask_l;
wire [YSYX210555_AXI_DATA_WIDTH-1:0] axi_w_data_h = (i_w_data >> aligned_offset_h) & mask_h;

        always @(*) begin
            if (i_rst) begin
                axi_w_data = 64'd0;
				axi_w_strb = 8'd0;
				axi_w_last = 1'b0;
            end
            else if (i_axi_w_ready & o_axi_w_valid) begin
                if (~aligned & overstep) begin
                    if (len[0]) begin
                        axi_w_data = axi_w_data_h;
						axi_w_strb = {mask_h[56], mask_h[48], mask_h[40], mask_h[32], mask_h[24], mask_h[16], mask_h[8], mask_h[0]};
						axi_w_last = 1'b1;
                    end
                    else begin
                        axi_w_data = axi_w_data_l;
						axi_w_strb = {mask_l[56], mask_l[48], mask_l[40], mask_l[32], mask_l[24], mask_l[16], mask_l[8], mask_l[0]};
						axi_w_last = 1'b0;
                    end
                end
                else begin
                    axi_w_data = axi_w_data_l;
					axi_w_strb = {mask_l[56], mask_l[48], mask_l[40], mask_l[32], mask_l[24], mask_l[16], mask_l[8], mask_l[0]};
					axi_w_last = 1'b1;
                end
            end
            else begin
                axi_w_data = 64'd0;
				axi_w_strb = 8'd0;
				axi_w_last = 1'b0;
            end
        end

// Write response channel signals
assign o_axi_b_ready    = w_state_resp;

// ------------------Read Transaction------------------

// Read address channel signals
assign o_axi_ar_valid   = r_state_addr;
assign o_axi_ar_addr    = axi_addr;
//assign o_axi_ar_prot    = `AXI_PROT_UNPRIVILEGED_ACCESS | `AXI_PROT_SECURE_ACCESS | `AXI_PROT_DATA_ACCESS;
assign o_axi_ar_id      = axi_id;
//assign o_axi_ar_user    = axi_user;
assign o_axi_ar_len     = axi_len;
assign o_axi_ar_size    = axi_size;
assign o_axi_ar_burst   = `AXI_BURST_TYPE_INCR;
//assign o_axi_ar_lock    = 1'b0;
//assign o_axi_ar_cache   = `AXI_ARCACHE_NORMAL_NON_CACHEABLE_NON_BUFFERABLE;
//assign o_axi_ar_qos     = 4'h0;

// Read data channel signals
assign o_axi_r_ready    = r_state_read;

wire [YSYX210555_AXI_DATA_WIDTH-1:0] axi_r_data_l  = (i_axi_r_data & mask_l) >> aligned_offset_l;
wire [YSYX210555_AXI_DATA_WIDTH-1:0] axi_r_data_h  = (i_axi_r_data & mask_h) << aligned_offset_h;
reg [YSYX210555_AXI_DATA_WIDTH-1:0] axi_r_data_l_last;

        always @(*) begin
            if(i_rst) begin
                o_r_data[YSYX210555_AXI_DATA_WIDTH-1:0] = 64'd0;
            end
            else if(o_axi_r_ready & i_axi_r_valid) begin
                if(~aligned & overstep) begin
                    if(len[0]) begin
                        o_r_data[YSYX210555_AXI_DATA_WIDTH-1:0] = axi_r_data_l_last | axi_r_data_h;
                    end
                    else begin
                        o_r_data[YSYX210555_AXI_DATA_WIDTH-1:0] = axi_r_data_l;
                    end
                end
                else begin
                    o_r_data[YSYX210555_AXI_DATA_WIDTH-1:0] = axi_r_data_l;
                end
            end
			else begin
				o_r_data[YSYX210555_AXI_DATA_WIDTH-1:0] = axi_r_data_l;
			end
        end

always @(posedge i_clk) begin
	if(i_rst) 
		axi_r_data_l_last <= 64'd0;
	if(o_axi_r_ready & i_axi_r_valid & ~aligned & overstep)
		axi_r_data_l_last <= axi_r_data_l;
	else ;
end

endmodule
 
 

module ysyx_210555_arbiter(
	input i_clk,
	input i_rst,
	
	output o_handshake_done,
	
//	output reg o_if_ready,
	output reg [1:0] o_if_resp,
	output reg [`YSYX210555_REG_BUS] o_if_inst,
	input i_if_req,
	input i_if_valid,
	input [1:0] i_if_size,
	input [`YSYX210555_REG_BUS] i_if_inst_addr,
	
//	output reg o_mem_ready,
	output reg [1:0] o_mem_resp,
	output reg [`YSYX210555_REG_BUS] o_mem_rdata,
	input i_mem_req,
	input i_mem_valid,
	input [1:0] i_mem_size,
	input [`YSYX210555_REG_BUS] i_mem_addr,
	input [`YSYX210555_REG_BUS] i_mem_wdata,

	input i_clint_ready,
	input [1:0] i_clint_resp,
	input [`YSYX210555_REG_BUS] i_clint_rdata,
	output reg o_clint_req,
	output reg o_clint_valid,
	output reg [1:0] o_clint_size,
	output reg [`YSYX210555_REG_BUS] o_clint_addr,
	output reg [`YSYX210555_REG_BUS] o_clint_wdata,
	
	input i_axirw_ready,
	input [1:0] i_axirw_resp,
	input [`YSYX210555_REG_BUS] i_axirw_rdata,
	output reg o_axirw_req,
	output reg o_axirw_valid,
	output reg [1:0] o_axirw_size,
	output reg [`YSYX210555_REG_BUS] o_axirw_addr,
	output reg [`YSYX210555_REG_BUS] o_axirw_wdata
);

reg o_if_ready;
reg o_mem_ready;

parameter [1:0] YSYX210555_STATE_IDLE = 2'b00, YSYX210555_STATE_IF = 2'b01, YSYX210555_STATE_MEM  = 2'b10;
reg [1:0] r_state, r_nstate;
reg r_if_ready;
reg [1:0] r_if_resp;
reg [`YSYX210555_REG_BUS] r_if_inst;
//reg r_mem_ready;
//reg [1:0] r_mem_resp;
//reg [`YSYX210555_REG_BUS] r_mem_rdata;

always @(posedge i_clk) begin
    if (i_rst) 
		r_state <= YSYX210555_STATE_IDLE;
	else 
		r_state <= r_nstate;
end

always @(*) begin
    case (r_state)
		YSYX210555_STATE_IDLE: begin
			if(i_if_valid)
				r_nstate = YSYX210555_STATE_IF;
			else 
				r_nstate = YSYX210555_STATE_IDLE;
		end
		YSYX210555_STATE_IF: begin
			if((i_if_valid & o_if_ready) & i_mem_valid) begin
				r_nstate = YSYX210555_STATE_MEM;
			//	o_handshake_done = 1'b0;
			end
			else if((i_if_valid & o_if_ready) & ~i_mem_valid) begin
				r_nstate = YSYX210555_STATE_IDLE;
			//	o_handshake_done = 1'b1;
			end
			else
				r_nstate = YSYX210555_STATE_IF;
		end
		YSYX210555_STATE_MEM: begin
			if(i_mem_valid & o_mem_ready) begin
				r_nstate = YSYX210555_STATE_IDLE;
			//	o_handshake_done = 1'b1;
			end
			else 
				r_nstate = YSYX210555_STATE_MEM;
		end
		default: r_nstate = 2'b00;
    endcase
end

always @(*) begin
	case(r_state)
		YSYX210555_STATE_IDLE: begin
		//	o_handshake_done = 1'b0;
			
			o_if_ready = 1'b0;
			o_if_resp  = 2'b00;
			o_if_inst  = 64'd0;
			
			o_mem_ready = 1'b0;
			o_mem_resp  = 2'b00;
			o_mem_rdata = 64'd0;
			
			o_clint_req   = 1'b0;
			o_clint_valid = 1'b0;
			o_clint_size  = 2'b00;
			o_clint_addr  = 64'd0;
			o_clint_wdata = 64'd0;
			
			o_axirw_req   = 1'b0; 
			o_axirw_valid = 1'b0; 
			o_axirw_size  = 2'b00;
			o_axirw_addr  = 64'd0;
			o_axirw_wdata = 64'd0;
		end
		YSYX210555_STATE_IF: begin
			o_if_ready = i_axirw_ready;
			o_if_resp  = i_axirw_resp;
			o_if_inst  = i_axirw_rdata;
			
			o_mem_ready = 1'b0;
			o_mem_resp  = 2'b00;
			o_mem_rdata = 64'd0;
			
			o_clint_req   = 1'b0;
			o_clint_valid = 1'b0;
			o_clint_size  = 2'b00;
			o_clint_addr  = 64'd0;
			o_clint_wdata = 64'd0;
			
			o_axirw_req   = i_if_req;
			o_axirw_valid = i_if_valid;
			o_axirw_size  = i_if_size;
			o_axirw_addr  = i_if_inst_addr;
			o_axirw_wdata = 64'd0;
		end
		YSYX210555_STATE_MEM: begin
			o_if_ready = r_if_ready;
			o_if_resp  = r_if_resp;
			o_if_inst  = r_if_inst;
			
			if(i_mem_addr < 64'h0000_0000_0201_0000) begin
				o_mem_ready = i_clint_ready;
				o_mem_resp  = i_clint_resp;
				o_mem_rdata = i_clint_rdata;
				
				o_clint_req   = i_mem_req;
				o_clint_valid = i_mem_valid;
				o_clint_size  = i_mem_size;
				o_clint_addr  = i_mem_addr;
				o_clint_wdata = i_mem_wdata;
				
				o_axirw_req   = 1'b0; 
				o_axirw_valid = 1'b0; 
				o_axirw_size  = 2'b00;
				o_axirw_addr  = 64'd0;
				o_axirw_wdata = 64'd0;
			end
			else begin
				o_mem_ready = i_axirw_ready;
				o_mem_resp  = i_axirw_resp;
				o_mem_rdata = i_axirw_rdata;
				
				o_clint_req   = 1'b0;
				o_clint_valid = 1'b0;
				o_clint_size  = 2'b00;
				o_clint_addr  = 64'd0;
				o_clint_wdata = 64'd0;
				
				o_axirw_req   = i_mem_req;
				o_axirw_valid = i_mem_valid;
				o_axirw_size  = i_mem_size;
				o_axirw_addr  = i_mem_addr;
				o_axirw_wdata = i_mem_wdata;
			end
		end
		default: begin
			o_if_ready = 1'b0;
			o_if_resp  = 2'b00;
			o_if_inst  = 64'd0;
			
			o_mem_ready = 1'b0;
			o_mem_resp  = 2'b00;
			o_mem_rdata = 64'd0;
			
			o_clint_req   = 1'b0;
			o_clint_valid = 1'b0;
			o_clint_size  = 2'b00;
			o_clint_addr  = 64'd0;
			o_clint_wdata = 64'd0;
			
			o_axirw_req   = 1'b0; 
			o_axirw_valid = 1'b0; 
			o_axirw_size  = 2'b00;
			o_axirw_addr  = 64'd0;
			o_axirw_wdata = 64'd0;
		end
	endcase
end

assign o_handshake_done = ((r_state == YSYX210555_STATE_IF) & (i_if_valid & o_if_ready) & ~i_mem_valid)
						| ((r_state == YSYX210555_STATE_MEM) & i_mem_valid & o_mem_ready);


always @(posedge i_clk) begin
	if (i_rst) begin
		r_if_ready <= 1'b0;
		r_if_resp  <= 2'b00;
		r_if_inst  <= 64'd0;
	end	
	else if((r_state == YSYX210555_STATE_IF) & i_if_valid & o_if_ready) begin
		r_if_ready <= i_axirw_ready;
		r_if_resp  <= i_axirw_resp;
		r_if_inst  <= i_axirw_rdata;
	end
	else ;
end

endmodule


 

module ysyx_210555_clint(
	input i_clk,
	input i_rst,
	
	input [`YSYX210555_REG_BUS] i_clint_addr,
	input [`YSYX210555_REG_BUS] i_clint_wr_data,
	
	output o_interrupt_timer,
	
	input i_clint_req,
	input i_clint_valid,
	input [1:0] i_clint_size,
	output o_clint_ready,
	output [1:0] o_clint_resp,
	output [`YSYX210555_REG_BUS] o_clint_rd_data
);

reg [63:0] mtime;
reg [63:0] mtimecmp;

wire [63:0] mtime_nxt;
wire [63:0] mtimecmp_nxt;

wire w_clint_valid = i_clint_valid & (i_clint_size == `YSYX210555_SIZE_D);

wire w_sel_rd_mtime    = w_clint_valid & (i_clint_req == `YSYX210555_REQ_READ) & (i_clint_addr == 64'h00000000_0200BFF8);
wire w_sel_rd_mtimecmp = w_clint_valid & (i_clint_req == `YSYX210555_REQ_READ) & (i_clint_addr == 64'h00000000_02004000);

wire w_sel_wr_mtime    = w_clint_valid & (i_clint_req == `YSYX210555_REQ_WRITE) & (i_clint_addr == 64'h00000000_0200BFF8);
wire w_sel_wr_mtimecmp = w_clint_valid & (i_clint_req == `YSYX210555_REQ_WRITE) & (i_clint_addr == 64'h00000000_02004000);

assign mtime_nxt = (w_sel_wr_mtime)? i_clint_wr_data : (mtime +1);
assign mtimecmp_nxt = (w_sel_wr_mtimecmp)? i_clint_wr_data : mtimecmp;

always @(posedge i_clk) begin
	if(i_rst) begin
		mtime    <= `YSYX210555_ZERO_WORD;
		mtimecmp <= 64'd500_000;
	end
	else begin
		mtime    <= mtime_nxt;
		mtimecmp <= mtimecmp_nxt;
	end
end

assign o_interrupt_timer = (i_rst)? 1'b0 : (mtime >= mtimecmp);

wire [63:0] w_clint_rd_data = (mtime    & {64{w_sel_rd_mtime   }})
							| (mtimecmp & {64{w_sel_rd_mtimecmp}})
							| `YSYX210555_ZERO_WORD;

assign o_clint_rd_data = (i_rst)? 		   	         `YSYX210555_ZERO_WORD 	 : 
						 (i_clint_req == `YSYX210555_REQ_READ)? w_clint_rd_data : 
										             `YSYX210555_ZERO_WORD	     ; 

assign o_clint_ready = 1'b1;
assign o_clint_resp = 2'b00;

endmodule

 
 

module ysyx_210555_rvcpu(
	input i_clk,
	input i_rst,
	input i_interrupt_timer,
	input i_handshake_done,
	
//	input i_if_ready,
	input [1:0] i_if_resp,
	input [`YSYX210555_REG_BUS] i_if_inst,
	output o_if_req,
	output o_if_valid,
	output [1:0] o_if_size,
	output [`YSYX210555_REG_BUS] o_if_inst_addr,
	
//	input i_mem_ready,
	input [1:0] i_mem_resp,
	input [`YSYX210555_REG_BUS] i_mem_rdata,
	output o_mem_req,
	output o_mem_valid,
	output [1:0] o_mem_size,
	output [`YSYX210555_REG_BUS] o_mem_addr,
	output [`YSYX210555_REG_BUS] o_mem_wdata
);

wire if_inst_ena;
wire [31:0] if_inst;
wire [`YSYX210555_REG_BUS] if_pc;
wire [`YSYX210555_REG_BUS] if_pc_transf;
//wire if_handshake_done;

wire [`YSYX210555_REG_BUS] id_pc;
wire [31:0] id_inst;
//wire id_Rd_wr_ena = ~w_interrupt_timer_vld & id_ctrls[`YSYX210555_CTRL_RD_WR_ENA];
wire id_ilgl_inst;
//wire id_putch_vld;
wire id_csr_pc_vld;
wire [`YSYX210555_REG_BUS] id_csr_pc;
wire [ 4:0] id_Rs1_rd_addr;
wire [ 4:0] id_Rs2_rd_addr; 	
wire [ 4:0] id_Rd_wr_addr;
wire [11:0] id_csr_addr;
wire [`YSYX210555_CTRL_BUS] id_ctrls;
wire [`YSYX210555_REG_BUS] id_imm_rv64;
wire [`YSYX210555_REG_BUS] id_Rs1_rd_data;
wire [`YSYX210555_REG_BUS] id_Rs2_rd_data;
wire [`YSYX210555_REG_BUS] id_Rs1_rd_data_uncertain;
wire [`YSYX210555_REG_BUS] id_Rs2_rd_data_uncertain;
wire [`YSYX210555_REG_BUS] id_csr_rd_data;
wire id_equ_less;
wire id_pc_ctrf_vld;
wire [`YSYX210555_REG_BUS] id_Rd_auipc;
wire [`YSYX210555_REG_BUS] id_pc_add4;
wire [`YSYX210555_REG_BUS] id_pc_adder_a;
wire [`YSYX210555_REG_BUS] id_pc_ctrl_trsf;
wire [`YSYX210555_REG_BUS] id_Rd_data_JUtype;
wire [2:0] id_forward_Rs1;
wire [2:0] id_forward_Rs2;
//wire [2:0] id_forward_csr;
wire id_stall_n;
wire id_flush_id_ex;
wire id_flush_if_id;
wire id_interrupt_timer_vld;
wire [`YSYX210555_REG_BUS] id_Rs1_or_imm;
wire [`YSYX210555_REG_BUS] id_csr_wr_data;

wire [`YSYX210555_CTRL_BUS] ex_ctrls;
wire [`YSYX210555_REG_BUS] ex_Rd_data_JUtype;
wire [`YSYX210555_REG_BUS] ex_Rs1_rd_data;
wire [`YSYX210555_REG_BUS] ex_Rs2_rd_data;
wire [`YSYX210555_REG_BUS] ex_imm_rv64;
wire [4:0] ex_Rd_wr_addr;
//wire [11:0] ex_csr_addr;
wire [`YSYX210555_REG_BUS] ex_csr_rd_data;
wire [`YSYX210555_REG_BUS] ex_op2;				
wire [`YSYX210555_REG_BUS] ex_alu_result;
//wire [`YSYX210555_REG_BUS] ex_csr_wr_data;
wire [`YSYX210555_REG_BUS] ex_forward_Rd_wr_data;
			
wire [`YSYX210555_CTRL_BUS] me_ctrls;		
wire [`YSYX210555_REG_BUS] me_Rd_data_JUtype;
wire [`YSYX210555_REG_BUS] me_alu_result;	
wire [`YSYX210555_REG_BUS] me_Rs2_rd_data;
wire [4:0] me_Rd_wr_addr;
//wire [11:0] me_csr_addr;
wire [`YSYX210555_REG_BUS] me_csr_rd_data;
//wire [`YSYX210555_REG_BUS] me_csr_wr_data;
wire [`YSYX210555_REG_BUS] me_mem_rd_data;
wire [`YSYX210555_REG_BUS] me_forward_Rd_wr_data;

wire [`YSYX210555_REG_BUS] me_mem2reg_data = me_mem_rd_data;			
wire [`YSYX210555_CTRL_BUS] wb_ctrls;		
wire [`YSYX210555_REG_BUS]  wb_Rd_data_JUtype;
wire [`YSYX210555_REG_BUS]  wb_alu_result;	
wire [`YSYX210555_REG_BUS]  wb_mem2reg_data;
wire [4:0]       wb_Rd_wr_addr;
//wire [11:0]      wb_csr_addr;
wire [`YSYX210555_REG_BUS]  wb_csr_rd_data;
//wire [`YSYX210555_REG_BUS]  wb_csr_wr_data;
wire [`YSYX210555_REG_BUS]  wb_Rd_wr_data;


////////////////////////////////////////////////////////////	
// IF_stage
ysyx_210555_mux_2to1 pc_transf_mux(
	.i_rst					(i_rst),
	.i_sel					(id_csr_pc_vld),
	.i_in0					(id_pc_ctrl_trsf),
	.i_in1					(id_csr_pc),
	
	.o_out					(if_pc_transf)
);

ysyx_210555_inst_fetch uut_inst_fetch(
	.i_clk					(i_clk),
	.i_rst					(i_rst),
	.i_ena					(id_stall_n & i_handshake_done),
	.i_pc_ctrf_vld			(id_pc_ctrf_vld),
	.i_pc_ctrl_trsf			(if_pc_transf),
	
	.o_inst_ena				(if_inst_ena),
	.o_inst_addr    		(if_pc)
);

ysyx_210555_if_axi	uut_if_axi(
	//.i_clk,
	//.i_rst,

	.i_inst_ena				(if_inst_ena),
	.i_inst_addr			(if_pc),
	//.o_inst_fetch,
	//.o_handshake_done		(i_handshake_done),
	.o_inst					(if_inst),
	
//	.i_if_ready				(i_if_ready),
	.i_if_resp				(i_if_resp),
	.i_if_inst_data			(i_if_inst),
	.o_if_req				(o_if_req),
	.o_if_valid				(o_if_valid),
	.o_if_size				(o_if_size),
	.o_if_inst_addr			(o_if_inst_addr)
);

///////////////////////////////////////////
ysyx_210555_if_id	uut_if_id(
	.i_clk					(i_clk),
	.i_rst					(i_rst | (id_flush_if_id & i_handshake_done)),
	.i_ena					(id_stall_n & i_handshake_done),
	
	.i_if_inst				(if_inst),
	.i_if_pc				(if_pc),
	
	.o_id_inst				(id_inst),
	.o_id_pc				(id_pc)
);


////////////////////////////////////////////////////////////	
// ID_stage
ysyx_210555_inst_decoder uut_inst_decoder(
	.i_rst					(i_rst),
	.i_inst					(id_inst),
	
//	.o_putch_vld			(id_putch_vld),
	
	.o_ilgl_inst			(id_ilgl_inst),
	.o_Rs1_rd_addr			(id_Rs1_rd_addr),
	.o_Rs2_rd_addr			(id_Rs2_rd_addr),
	.o_Rd_wr_addr			(id_Rd_wr_addr),
	.o_csr_addr				(id_csr_addr),
	.o_ctrls				(id_ctrls),
	.o_imm_rv64				(id_imm_rv64)
);

ysyx_210555_regfile	uut_regfile(
    .i_clk					(i_clk),
	.i_rst					(i_rst),
	
	//.i_putch_vld			(id_putch_vld),
	.i_Rs1_rd_ena			(id_ctrls[`YSYX210555_CTRL_RS1_RD_ENA]),
	.i_Rs2_rd_ena			(id_ctrls[`YSYX210555_CTRL_RS2_RD_ENA]),
	.i_Rs1_rd_addr			(id_Rs1_rd_addr),
	.i_Rs2_rd_addr			(id_Rs2_rd_addr),
	.i_Rd_wr_ena			(wb_ctrls[`YSYX210555_CTRL_RD_WR_ENA]),
	.i_Rd_wr_addr			(wb_Rd_wr_addr),
	.i_Rd_wr_data			(wb_Rd_wr_data),
	
	.o_Rs1_rd_data			(id_Rs1_rd_data_uncertain),
	.o_Rs2_rd_data			(id_Rs2_rd_data_uncertain)
);

ysyx_210555_mux_4to1 Rs1_forward_mux(
	.i_rst					(i_rst),
	.i_sel					(id_forward_Rs1),
	.i_in0					(id_Rs1_rd_data_uncertain),
	.i_in1					(ex_forward_Rd_wr_data),
	.i_in2					(me_forward_Rd_wr_data),
	.i_in3					(wb_Rd_wr_data),
	
	.o_out					(id_Rs1_rd_data)
);

ysyx_210555_mux_4to1 Rs2_forward_mux(
	.i_rst					(i_rst),
	.i_sel					(id_forward_Rs2),
	.i_in0					(id_Rs2_rd_data_uncertain),
	.i_in1					(ex_forward_Rd_wr_data),
	.i_in2					(me_forward_Rd_wr_data),
	.i_in3					(wb_Rd_wr_data),
	
	.o_out					(id_Rs2_rd_data)
);

ysyx_210555_mux_2to1 pc_adder_a_mux(
	.i_rst					(i_rst),
	.i_sel					(id_ctrls[`YSYX210555_CTRL_INST_JUMP_JALR]),
	.i_in0					(id_pc),
	.i_in1					(id_Rs1_rd_data),
	
	.o_out					(id_pc_adder_a)
);

ysyx_210555_adder pc_adder(
	.i_rst					(i_rst),
	.i_a					(id_pc_adder_a),
	.i_b					(id_imm_rv64),
	
	.o_sum					(id_pc_ctrl_trsf)
);

assign id_Rd_auipc = id_pc_ctrl_trsf;

ysyx_210555_adder pc_add4_adder(
	.i_rst					(i_rst),
	.i_a					(id_pc),
	.i_b					(64'd4),
	
	.o_sum					(id_pc_add4)
);

ysyx_210555_mux_3to1 Rd_data_JU_mux(
	.i_rst					(i_rst),
	.i_sel					({id_ctrls[`YSYX210555_CTRL_INST_JUMP], id_ctrls[`YSYX210555_CTRL_INST_LUI]}),
	.i_in0					(id_Rd_auipc),
	.i_in1					(id_imm_rv64),
	.i_in2					(id_pc_add4),
	
	.o_out					(id_Rd_data_JUtype)
);

ysyx_210555_branch_comp	uut_branch_comp(
	.i_rst					(i_rst),
	.i_inst_branch			(id_ctrls[`YSYX210555_CTRL_INST_BRANCH]),
	.i_Rs1					(id_Rs1_rd_data),
	.i_Rs2					(id_Rs2_rd_data),

	.o_equ_less				(id_equ_less)
);

ysyx_210555_pc_ctrl_transfer	uut_pc_ctrl_transfer(
	.i_rst					(i_rst),
	.i_equ_less				(id_equ_less),
	.i_inst_jump			(id_ctrls[`YSYX210555_CTRL_INST_JUMP]),
	.i_csr_pc_vld			(id_csr_pc_vld),
	.i_inst_branch			(id_ctrls[`YSYX210555_CTRL_INST_BRANCH]),

	.o_pc_ctrf_vld			(id_pc_ctrf_vld)
);

ysyx_210555_csr	uut_csr(
	.i_clk					(i_clk),
	.i_rst					(i_rst),
	.i_stall_n				(id_stall_n),
	
	.i_mret					(id_ctrls[`YSYX210555_CTRL_INST_MRET]),
	.i_csr_rd_addr			(id_csr_addr),
	.i_csr_rd_ena			(id_ctrls[`YSYX210555_CTRL_CSR_RD_ENA]),
	.i_handshake_done		(i_handshake_done),
	.i_csr_wr_ena			(id_ctrls[`YSYX210555_CTRL_CSR_WR_ENA] & i_handshake_done),
	.i_csr_wr_addr			(id_csr_addr),
	.i_csr_wr_data			(id_csr_wr_data),
	.i_exception			({id_ilgl_inst, i_interrupt_timer, id_ctrls[`YSYX210555_CTRL_INST_ECALL]}),
	.i_if_inst_pc			(if_pc),
	.i_id_inst_pc			(id_pc),
	
	.o_interrupt_timer_vld	(id_interrupt_timer_vld),

	.o_csr_pc_vld			(id_csr_pc_vld),
	.o_csr_pc				(id_csr_pc),
	.o_csr_rd_data			(id_csr_rd_data)
);

ysyx_210555_mux_2to1 csr_Rs1_imm_mux(
	.i_rst					(i_rst),
	.i_sel					(id_ctrls[`YSYX210555_CTRL_INST_CSR_IMM]),
	.i_in0					(id_Rs1_rd_data),
	.i_in1					(id_imm_rv64),
	
	.o_out					(id_Rs1_or_imm)
);

ysyx_210555_csr_op	uut_csr_op(
	.i_rst					(i_rst),
	.i_inst_csr				(id_ctrls[`YSYX210555_CTRL_INST_CSR_TYPE]),
	.i_Rs1_or_imm			(id_Rs1_or_imm),
	.i_csr_rd_data			(id_csr_rd_data),
	
	.o_csr_wr_data			(id_csr_wr_data)
);

ysyx_210555_forwarding	uut_forwarding(
	.i_rst					(i_rst),
	
	.i_id_Rs1				(id_Rs1_rd_addr),
	.i_id_Rs2				(id_Rs2_rd_addr),
	.i_ex_Rd				(ex_Rd_wr_addr),
	.i_me_Rd				(me_Rd_wr_addr),
	.i_wb_Rd				(wb_Rd_wr_addr),
	.i_id_Rs1_rd_ena		(id_ctrls[`YSYX210555_CTRL_RS1_RD_ENA]),
	.i_id_Rs2_rd_ena		(id_ctrls[`YSYX210555_CTRL_RS2_RD_ENA]),
	.i_ex_Rd_wr_ena			(ex_ctrls[`YSYX210555_CTRL_RD_WR_ENA]),
	.i_me_Rd_wr_ena			(me_ctrls[`YSYX210555_CTRL_RD_WR_ENA]),
	.i_wb_Rd_wr_ena			(wb_ctrls[`YSYX210555_CTRL_RD_WR_ENA]),
/*	.i_id_csr				(id_csr_addr),
	.i_ex_csr				(ex_csr_addr),
	.i_me_csr				(me_csr_addr),
	.i_wb_csr				(wb_csr_addr),
	.i_id_csr_rd_ena		(id_ctrls[`YSYX210555_CTRL_CSR_RD_ENA]),
	.i_ex_csr_wr_ena		(ex_ctrls[`YSYX210555_CTRL_CSR_WR_ENA]),
	.i_me_csr_wr_ena		(me_ctrls[`YSYX210555_CTRL_CSR_WR_ENA]),
	.i_wb_csr_wr_ena		(wb_ctrls[`YSYX210555_CTRL_CSR_WR_ENA]),*/
	
	.o_forward_Rs1			(id_forward_Rs1),
	.o_forward_Rs2			(id_forward_Rs2)
//	.o_forward_csr			(id_forward_csr)
);

ysyx_210555_hazard_detect	uut_hazard_detect(
	.i_rst					(i_rst),
	
	.i_id_Rs1				(id_Rs1_rd_addr),
	.i_id_Rs2				(id_Rs2_rd_addr),
	.i_ex_Rd				(ex_Rd_wr_addr),
	.i_ex_mem_rd_ena		(ex_ctrls[`YSYX210555_CTRL_MEM_RD_ENA]),
	.i_id_Rs1_rd_ena		(id_ctrls[`YSYX210555_CTRL_RS1_RD_ENA] & ~id_interrupt_timer_vld),
	.i_id_Rs2_rd_ena		(id_ctrls[`YSYX210555_CTRL_RS2_RD_ENA] & ~id_interrupt_timer_vld),
	.i_id_pc_ctrf_vld		(id_pc_ctrf_vld),
	
	.o_stall_n				(id_stall_n),
	.o_flush_id_ex			(id_flush_id_ex),
	.o_flush_if_id			(id_flush_if_id)
);

///////////////////////////////////////////

ysyx_210555_id_ex	uut_id_ex(
	.i_clk					(i_clk),
	.i_rst					(i_rst | (id_flush_id_ex & i_handshake_done)),
	.i_ena					(i_handshake_done),
	
	.i_id_ctrls				(id_ctrls & {39{~id_interrupt_timer_vld}}),
	.i_id_Rd_data_JUtype	(id_Rd_data_JUtype),
	.i_id_Rs1_rd_data		(id_Rs1_rd_data),
	.i_id_Rs2_rd_data		(id_Rs2_rd_data),
	.i_id_imm_rv64			(id_imm_rv64),
	.i_id_Rd_wr_addr		(id_Rd_wr_addr),
//	.i_id_csr_addr			(id_csr_addr),
	.i_id_csr_rd_data		(id_csr_rd_data),
	
	.o_ex_ctrls				(ex_ctrls),
	.o_ex_Rd_data_JUtype	(ex_Rd_data_JUtype),
	.o_ex_Rs1_rd_data		(ex_Rs1_rd_data),
	.o_ex_Rs2_rd_data		(ex_Rs2_rd_data),
	.o_ex_imm_rv64			(ex_imm_rv64),
	.o_ex_Rd_wr_addr		(ex_Rd_wr_addr),
//	.o_ex_csr_addr			(ex_csr_addr),
	.o_ex_csr_rd_data		(ex_csr_rd_data)
);



////////////////////////////////////////////////////////////	
// EX_stage

ysyx_210555_mux_2to1 op2_mux(
	.i_rst					(i_rst),
	.i_sel					(ex_ctrls[`YSYX210555_CTRL_ALU_OP2_IMM]),
	.i_in0					(ex_Rs2_rd_data),
	.i_in1					(ex_imm_rv64),
	
	.o_out					(ex_op2)
);

ysyx_210555_alu uut_alu(
	.i_rst					(i_rst),
	.i_inst_op_word			(ex_ctrls[`YSYX210555_CTRL_INST_OP_WORD]),
	.i_alu_op				(ex_ctrls[`YSYX210555_CTRL_ALU_OP]),
	.i_op1					(ex_Rs1_rd_data),
	.i_op2					(ex_op2),
	
	.o_alu_result			(ex_alu_result)
);

ysyx_210555_mux_3to1 ex_forward_mux(
	.i_rst					(i_rst),
	.i_sel					({ex_ctrls[`YSYX210555_CTRL_CSR_TO_REGS], ex_ctrls[`YSYX210555_CTRL_PC_IMM_TO_REGS]}),
	.i_in0					(ex_alu_result),
	.i_in1					(ex_Rd_data_JUtype),
	.i_in2					(ex_csr_rd_data),
			
	.o_out					(ex_forward_Rd_wr_data)
);
/*
ysyx_210555_putch	uut_putch(
    .i_clk					(i_clk),
	.i_rst					(i_rst),
	
	.i_id_putch_vld			(id_putch_vld & i_handshake_done),
	.i_ex_alu_result		(ex_alu_result)
);*/

///////////////////////////////////////////

ysyx_210555_ex_me	uut_ex_me(
	.i_clk					(i_clk),
	.i_rst					(i_rst),
	.i_ena					(i_handshake_done),
			
	.i_ex_ctrls				(ex_ctrls),		
	.i_ex_Rd_data_JUtype	(ex_Rd_data_JUtype),
	.i_ex_alu_result		(ex_alu_result),	
	.i_ex_Rs2_rd_data		(ex_Rs2_rd_data),
	.i_ex_Rd_wr_addr		(ex_Rd_wr_addr),
//	.i_ex_csr_addr			(ex_csr_addr),
	.i_ex_csr_rd_data		(ex_csr_rd_data),
//	.i_ex_csr_wr_data		(ex_csr_wr_data),
			
	.o_me_ctrls				(me_ctrls),		
	.o_me_Rd_data_JUtype	(me_Rd_data_JUtype),
	.o_me_alu_result		(me_alu_result),	
	.o_me_Rs2_rd_data		(me_Rs2_rd_data),
	.o_me_Rd_wr_addr		(me_Rd_wr_addr),
//	.o_me_csr_addr			(me_csr_addr),
	.o_me_csr_rd_data		(me_csr_rd_data)
//	.o_me_csr_wr_data		(me_csr_wr_data)
);

////////////////////////////////////////////////////////////	
// MEM_stage

ysyx_210555_mem_axi	uut_mem_axi(
	.i_rst					(i_rst),

	.i_mem_rd_ena			(me_ctrls[`YSYX210555_CTRL_MEM_RD_ENA]),
	.i_mem_wr_ena			(me_ctrls[`YSYX210555_CTRL_MEM_WR_ENA]),
	.i_mem_op				(me_ctrls[`YSYX210555_CTRL_INST_MEM_TYPE]),
	.i_mem_addr				(me_alu_result),
	.i_Rs2_data				(me_Rs2_rd_data),
	.o_mem_rd_data			(me_mem_rd_data),
	
//	.i_mem_ready			(i_mem_ready),
	.i_mem_resp				(i_mem_resp),
	.i_mem_rdata			(i_mem_rdata),
	.o_mem_req				(o_mem_req),
	.o_mem_valid			(o_mem_valid),
	.o_mem_size				(o_mem_size),
	.o_mem_addr				(o_mem_addr),
	.o_mem_wdata			(o_mem_wdata)
);

ysyx_210555_mux_4to1 me_forward_mux(
	.i_rst			(i_rst),
	.i_sel			({me_ctrls[`YSYX210555_CTRL_CSR_TO_REGS], me_ctrls[`YSYX210555_CTRL_PC_IMM_TO_REGS], me_ctrls[`YSYX210555_CTRL_MEM_TO_REGS]}),
	.i_in0			(me_alu_result),
	.i_in1			(me_mem2reg_data),
	.i_in2			(me_Rd_data_JUtype),
	.i_in3			(me_csr_rd_data),
	
	.o_out			(me_forward_Rd_wr_data)
);

///////////////////////////////////////////

ysyx_210555_me_wb	uut_me_wb(
	.i_clk					(i_clk),
	.i_rst					(i_rst),
	.i_ena					(i_handshake_done),
		
	.i_me_ctrls				(me_ctrls),		
	.i_me_Rd_data_JUtype	(me_Rd_data_JUtype),
	.i_me_alu_result		(me_alu_result),	
	.i_me_mem2reg_data		(me_mem2reg_data),
	.i_me_Rd_wr_addr		(me_Rd_wr_addr),
//	.i_me_csr_addr			(me_csr_addr),
	.i_me_csr_rd_data		(me_csr_rd_data),
//	.i_me_csr_wr_data		(me_csr_wr_data),
			
	.o_wb_ctrls				(wb_ctrls),		
	.o_wb_Rd_data_JUtype	(wb_Rd_data_JUtype),
	.o_wb_alu_result		(wb_alu_result),	
	.o_wb_mem2reg_data		(wb_mem2reg_data),
	.o_wb_Rd_wr_addr		(wb_Rd_wr_addr),
//	.o_wb_csr_addr			(wb_csr_addr),
	.o_wb_csr_rd_data		(wb_csr_rd_data)
//	.o_wb_csr_wr_data		(wb_csr_wr_data)

);


////////////////////////////////////////////////////////////	
// WB_stage

ysyx_210555_mux_4to1 wb_mux(
	.i_rst			(i_rst),
	.i_sel			({wb_ctrls[`YSYX210555_CTRL_CSR_TO_REGS], wb_ctrls[`YSYX210555_CTRL_PC_IMM_TO_REGS], wb_ctrls[`YSYX210555_CTRL_MEM_TO_REGS]}),
	.i_in0			(wb_alu_result),
	.i_in1			(wb_mem2reg_data),
	.i_in2			(wb_Rd_data_JUtype),
	.i_in3			(wb_csr_rd_data),
	
	.o_out			(wb_Rd_wr_data)
);


endmodule


 

module ysyx_210555_inst_fetch(
	input i_clk,
	input i_rst,
	input i_ena,
	input i_pc_ctrf_vld,
	input [`YSYX210555_REG_BUS] i_pc_ctrl_trsf,
	
	output o_inst_ena,
	output [`YSYX210555_REG_BUS] o_inst_addr
);

reg [`YSYX210555_REG_BUS] r_pc;
wire [`YSYX210555_REG_BUS] w_pc_next;
wire [`YSYX210555_REG_BUS] w_pc_add4;

// fetch an instruction
always @(posedge i_clk) begin
	if(i_rst)
		r_pc <= `YSYX210555_PC_START;
	else if(i_ena)
		r_pc <= w_pc_next;
	else ;
end

assign w_pc_add4 = r_pc + 64'd4;

assign w_pc_next = (i_rst)? 		`YSYX210555_PC_START 	   : 
				   (i_pc_ctrf_vld)? i_pc_ctrl_trsf : 
									w_pc_add4	   ;

assign o_inst_ena  = (i_rst)? 1'b0: 1'b1;
assign o_inst_addr = r_pc;


endmodule


 

module ysyx_210555_if_axi(
	//input i_clk,
	//input i_rst,

	input i_inst_ena,
	input [`YSYX210555_REG_BUS] i_inst_addr,
	//output o_inst_fetch,
	//output o_handshake_done,
	output [31:0] o_inst,
	
//	input i_if_ready,
	input [1:0] i_if_resp,
	input [`YSYX210555_REG_BUS] i_if_inst_data,
	output o_if_req,
	output o_if_valid,
	output [1:0] o_if_size,
	output [`YSYX210555_REG_BUS] o_if_inst_addr
);

//assign o_handshake_done = o_if_valid & i_if_ready;
assign o_inst           = i_if_inst_data[31:0];
assign o_if_req         = `YSYX210555_REQ_READ;
assign o_if_valid       = i_inst_ena;
assign o_if_size        = `YSYX210555_SIZE_W;
assign o_if_inst_addr   = i_inst_addr;


endmodule


 

module ysyx_210555_if_id(
	input i_clk,
	input i_rst,
	input i_ena,
	input [31:0] i_if_inst,
	input [`YSYX210555_REG_BUS] i_if_pc,
	
	output reg [31:0] o_id_inst,
	output reg [`YSYX210555_REG_BUS] o_id_pc
);

always @(posedge i_clk) begin
	if(i_rst) begin
		o_id_inst     <= 32'h0;
		o_id_pc       <= `YSYX210555_PC_START;
	end
	else if(i_ena) begin
		o_id_inst     <= i_if_inst;
		o_id_pc       <= i_if_pc;
	end
	else ;
end 

endmodule

 

module ysyx_210555_inst_decoder(
	input i_rst,
	input [31:0] i_inst,
	
//	output o_putch_vld,

	output o_ilgl_inst,
	output [4:0] o_Rs1_rd_addr,
	output [4:0] o_Rs2_rd_addr,
	output [4:0] o_Rd_wr_addr,
	output [11:0] o_csr_addr,
	output [`YSYX210555_CTRL_BUS] o_ctrls,
	output [`YSYX210555_REG_BUS] o_imm_rv64
);

assign o_ilgl_inst = 1'b0;

wire [6:0] opcode   = i_inst[ 6: 0];
wire [2:0] funct3   = i_inst[14:12];
wire [6:0] funct7   = i_inst[31:25];
wire [4:0] Rd_addr  = i_inst[11: 7];
wire [4:0] Rs1_addr = i_inst[19:15];
wire [4:0] Rs2_addr = i_inst[24:20];
wire [11:0] csr_addr = i_inst[31:20];

//wire opcode_1_0_00  = (opcode[1:0] == 2'b00);
//wire opcode_1_0_01  = (opcode[1:0] == 2'b01);
//wire opcode_1_0_10  = (opcode[1:0] == 2'b10);
wire opcode_1_0_11  = (opcode[1:0] == 2'b11);
wire opcode_4_2_000 = (opcode[4:2] == 3'b000);
wire opcode_4_2_001 = (opcode[4:2] == 3'b001);
//wire opcode_4_2_010 = (opcode[4:2] == 3'b010);
wire opcode_4_2_011 = (opcode[4:2] == 3'b011);
wire opcode_4_2_100 = (opcode[4:2] == 3'b100);
wire opcode_4_2_101 = (opcode[4:2] == 3'b101);
wire opcode_4_2_110 = (opcode[4:2] == 3'b110);
//wire opcode_4_2_111 = (opcode[4:2] == 3'b111);
wire opcode_6_5_00  = (opcode[6:5] == 2'b00);
wire opcode_6_5_01  = (opcode[6:5] == 2'b01);
//wire opcode_6_5_10  = (opcode[6:5] == 2'b10);
wire opcode_6_5_11  = (opcode[6:5] == 2'b11);

wire funct3_000 = (funct3 == 3'b000);
wire funct3_001 = (funct3 == 3'b001);
wire funct3_010 = (funct3 == 3'b010);
wire funct3_011 = (funct3 == 3'b011);
wire funct3_100 = (funct3 == 3'b100);
wire funct3_101 = (funct3 == 3'b101);
wire funct3_110 = (funct3 == 3'b110);
wire funct3_111 = (funct3 == 3'b111);

wire funct7_0000000 = (funct7 == 7'b0000000);
wire funct7_0100000 = (funct7 == 7'b0100000);
wire funct7_0011000 = (funct7 == 7'b0011000);

wire Rs1_x0 = (Rs1_addr == 5'b00000);
//wire Rs2_x0 = (Rs2_addr == 5'b00000);
wire Rd_x0  = (Rd_addr  == 5'b00000);

wire [11: 0] I_imm = i_inst[31:20];
wire [11: 0] S_imm = {i_inst[31:25], i_inst[11:7]};
wire [12: 1] B_imm = {i_inst[31], i_inst[7], i_inst[30:25], i_inst[11:8]};
wire [31:12] U_imm = i_inst[31:12];
wire [20: 1] J_imm = {i_inst[31], i_inst[19:12], i_inst[20], i_inst[30:21]};
wire [ 4: 0] csr_shamt = i_inst[19:15];

// Inst_type
wire inst_type_load      = opcode_6_5_00 & opcode_4_2_000 & opcode_1_0_11;
wire inst_type_misc_mem  = opcode_6_5_00 & opcode_4_2_011 & opcode_1_0_11;
wire inst_type_op_imm    = opcode_6_5_00 & opcode_4_2_100 & opcode_1_0_11;
wire inst_type_auipc     = opcode_6_5_00 & opcode_4_2_101 & opcode_1_0_11; 
wire inst_type_op_imm_32 = opcode_6_5_00 & opcode_4_2_110 & opcode_1_0_11;
 
wire inst_type_store     = opcode_6_5_01 & opcode_4_2_000 & opcode_1_0_11;
wire inst_type_op        = opcode_6_5_01 & opcode_4_2_100 & opcode_1_0_11;
wire inst_type_lui       = opcode_6_5_01 & opcode_4_2_101 & opcode_1_0_11;
wire inst_type_op_32     = opcode_6_5_01 & opcode_4_2_110 & opcode_1_0_11;

wire inst_type_branch    = opcode_6_5_11 & opcode_4_2_000 & opcode_1_0_11;
wire inst_type_jalr      = opcode_6_5_11 & opcode_4_2_001 & opcode_1_0_11;
wire inst_type_jal       = opcode_6_5_11 & opcode_4_2_011 & opcode_1_0_11;
wire inst_type_system    = opcode_6_5_11 & opcode_4_2_100 & opcode_1_0_11;

//wire inst_R_type = inst_type_op | inst_type_op_32;							// R-type
wire inst_I_type = inst_type_load | inst_type_op_imm 						// I-type
				 | inst_type_jalr | inst_type_op_imm_32;	
wire inst_S_type = inst_type_store;											// S-type
wire inst_B_type = inst_type_branch;										// B-type
wire inst_U_type = inst_type_lui | inst_type_auipc;							// U-type
wire inst_J_type = inst_type_jal;											// J-type


// Branch Insts
wire inst_beq  = inst_type_branch & funct3_000;
wire inst_bne  = inst_type_branch & funct3_001;
wire inst_blt  = inst_type_branch & funct3_100;
wire inst_bge  = inst_type_branch & funct3_101;
wire inst_bltu = inst_type_branch & funct3_110;
wire inst_bgeu = inst_type_branch & funct3_111;

// JUMP Insts
wire inst_jal   = inst_type_jal;
wire inst_jalr  = inst_type_jalr & funct3_000;

// System Insts
wire inst_ecall  = inst_type_system & funct3_000 
				 & Rd_x0 & Rs1_x0 & (I_imm == 12'b0000_0000_0000);
//wire inst_ebreak = inst_type_system & funct3_000 
//				 & Rd_x0 & Rs1_x0 & (I_imm == 12'b0000_0000_0001);

wire inst_mret   = inst_type_system & funct3_000 & funct7_0011000 
				 & Rd_x0 & Rs1_x0 & (Rs2_addr == 5'b00010);

wire inst_csrrw  = inst_type_system & funct3_001;
wire inst_csrrs  = inst_type_system & funct3_010;
wire inst_csrrc  = inst_type_system & funct3_011;
wire inst_csrrwi = inst_type_system & funct3_101;
wire inst_csrrsi = inst_type_system & funct3_110;
wire inst_csrrci = inst_type_system & funct3_111;

// ALU OP Insts
wire inst_add  = inst_type_op & funct3_000 & funct7_0000000;
wire inst_sub  = inst_type_op & funct3_000 & funct7_0100000;
wire inst_sll  = inst_type_op & funct3_001 & funct7_0000000;
wire inst_slt  = inst_type_op & funct3_010 & funct7_0000000;
wire inst_sltu = inst_type_op & funct3_011 & funct7_0000000;
wire inst_xor  = inst_type_op & funct3_100 & funct7_0000000;
wire inst_srl  = inst_type_op & funct3_101 & funct7_0000000;
wire inst_sra  = inst_type_op & funct3_101 & funct7_0100000;
wire inst_or   = inst_type_op & funct3_110 & funct7_0000000;
wire inst_and  = inst_type_op & funct3_111 & funct7_0000000;

wire inst_addw = inst_type_op_32 & funct3_000 & funct7_0000000;
wire inst_subw = inst_type_op_32 & funct3_000 & funct7_0100000;
wire inst_sllw = inst_type_op_32 & funct3_001 & funct7_0000000;
wire inst_srlw = inst_type_op_32 & funct3_101 & funct7_0000000;
wire inst_sraw = inst_type_op_32 & funct3_101 & funct7_0100000;

wire inst_addi  = inst_type_op_imm & funct3_000;
wire inst_slti  = inst_type_op_imm & funct3_010;
wire inst_sltiu = inst_type_op_imm & funct3_011;
wire inst_xori  = inst_type_op_imm & funct3_100;
wire inst_ori   = inst_type_op_imm & funct3_110;
wire inst_andi  = inst_type_op_imm & funct3_111;

//wire inst_slli_rv32 = inst_type_op_imm & funct3_001 & funct7_0000000;
//wire inst_srli_rv32 = inst_type_op_imm & funct3_101 & funct7_0000000;
//wire inst_srai_rv32 = inst_type_op_imm & funct3_101 & funct7_0100000;
wire inst_slli = inst_type_op_imm & funct3_001 & (i_inst[31:26] == 6'b000000);
wire inst_srli = inst_type_op_imm & funct3_101 & (i_inst[31:26] == 6'b000000);
wire inst_srai = inst_type_op_imm & funct3_101 & (i_inst[31:26] == 6'b010000);

wire inst_addiw = inst_type_op_imm_32 & funct3_000;
wire inst_slliw = inst_type_op_imm_32 & funct3_001 & funct7_0000000;
wire inst_srliw = inst_type_op_imm_32 & funct3_101 & funct7_0000000;
wire inst_sraiw = inst_type_op_imm_32 & funct3_101 & funct7_0100000;

// Load/Store Insts
wire inst_lb  = inst_type_load & funct3_000;
wire inst_lh  = inst_type_load & funct3_001;
wire inst_lw  = inst_type_load & funct3_010;
//wire inst_ld  = inst_type_load & funct3_011;
wire inst_lbu = inst_type_load & funct3_100;
wire inst_lhu = inst_type_load & funct3_101;
wire inst_lwu = inst_type_load & funct3_110;

wire inst_sb = inst_type_store & funct3_000;
wire inst_sh = inst_type_store & funct3_001;
wire inst_sw = inst_type_store & funct3_010;
//wire inst_sd = inst_type_store & funct3_011;

// MISC-MEM Insts
wire inst_fence   = inst_type_misc_mem & funct3_000 & Rd_x0 & Rs1_x0;
wire inst_fence_i = inst_type_misc_mem & funct3_001 & Rd_x0 & Rs1_x0;

// Other
wire inst_lui   = inst_type_lui;
wire inst_auipc = inst_type_auipc;



////////////////////////////////////////////////////////////	
//Imm_Gen

wire [`YSYX210555_REG_BUS] S_imm_rv64i = {{52{S_imm[11]}}, S_imm};
wire [`YSYX210555_REG_BUS] B_imm_rv64i = {{51{B_imm[12]}}, B_imm, 1'b0};
wire [`YSYX210555_REG_BUS] U_imm_rv64i = {{32{U_imm[31]}}, U_imm, 12'h000};
wire [`YSYX210555_REG_BUS] J_imm_rv64i = {{43{J_imm[20]}}, J_imm, 1'b0};
wire [`YSYX210555_REG_BUS] I_imm_rv64i = {{52{I_imm[11]}}, I_imm};
wire [`YSYX210555_REG_BUS] csr_uimm_rv64 = {59'd0, csr_shamt};

wire inst_csr_imm = inst_csrrwi | inst_csrrsi | inst_csrrci;

assign o_imm_rv64 = (i_rst)? `YSYX210555_ZERO_WORD : ((S_imm_rv64i & {64{inst_S_type}})
										 | (B_imm_rv64i & {64{inst_B_type}})
										 | (U_imm_rv64i & {64{inst_U_type}})
										 | (J_imm_rv64i & {64{inst_J_type}})
										 | (I_imm_rv64i & {64{inst_I_type}})
										 | (csr_uimm_rv64 & {64{inst_csr_imm}}));



////////////////////////////////////////////////////////////	
//Main_Dec (controller)

//byte_halfword_word or unsiged insts
wire inst_op_word = (inst_addw | inst_addiw | inst_subw 
				   | inst_sllw | inst_srlw | inst_sraw
				   | inst_slliw | inst_srliw | inst_sraiw);
				  
wire inst_mem_word = inst_sw | inst_lw | inst_lwu;			// word
wire inst_mem_half = inst_sh | inst_lh | inst_lhu;			// halfword
wire inst_mem_byte = inst_sb | inst_lb | inst_lbu;			// byte
wire inst_mem_unsiged  = inst_lbu | inst_lhu | inst_lwu;	// unsiged

// pc_branch_jump control
wire inst_branch_beq = inst_beq;
wire inst_branch_bne = inst_bne;
wire inst_branch_blt = inst_blt | inst_bltu;
wire inst_branch_bge = inst_bge | inst_bgeu;
wire inst_branch_unsiged = inst_bltu | inst_bgeu;

wire inst_jump      = inst_jal | inst_jalr;
wire inst_jump_jal  = inst_jal;
wire inst_jump_jalr = inst_jalr;

// U_type lui auipc
wire pc_imm_to_regs = inst_jal | inst_jalr 
					| inst_auipc 
					| inst_lui;

// memory control
wire mem_rd_ena = inst_type_load;
wire mem_wr_ena = inst_type_store;

// MemorALU_mux control
wire mem_to_regs = inst_type_load;

// csr control
wire csr_rd_ena = (((inst_csrrw | inst_csrrwi) & ~Rd_x0)
				   | inst_csrrs | inst_csrrsi 
				   | inst_csrrc | inst_csrrci
				   );

wire csr_wr_ena = (  inst_csrrw | inst_csrrwi | 
				   ((inst_csrrs | inst_csrrsi | 
					 inst_csrrc | inst_csrrci) & ~Rs1_x0)
				   );

wire csr_to_regs = (inst_csrrw | inst_csrrwi
				  | inst_csrrs | inst_csrrsi 
				  | inst_csrrc | inst_csrrci);

wire inst_csr_rw = inst_csrrw | inst_csrrwi;
wire inst_csr_rs = inst_csrrs | inst_csrrsi;
wire inst_csr_rc = inst_csrrc | inst_csrrci;

wire inst_csr = csr_to_regs;

assign o_csr_addr = (i_rst)? 12'd0 : csr_addr;

// alu_op2_mux control
wire alu_op2_imm = (inst_type_store | inst_type_load 
				  | inst_type_op_imm | inst_type_op_imm_32);

// regfile control
/*wire Rd_wr_ena  = (~inst_S_type & ~inst_B_type
				 & ~inst_ecall & ~inst_ebreak & ~inst_mret);*/
wire Rd_wr_ena  = (inst_type_op | inst_type_op_32
				 | inst_type_lui | inst_type_auipc
				 | inst_type_jal 
				 | inst_type_jalr 
				 | inst_type_load 
				 | inst_type_op_imm | inst_type_op_imm_32 
				 | inst_csr);

/*wire Rs1_rd_ena = (~inst_U_type & ~inst_J_type 
				 & ~inst_ecall & ~inst_ebreak & ~inst_mret
				 & ~inst_csrrci & ~inst_csrrsi & ~inst_csrrwi);*/
wire Rs1_rd_ena = (inst_type_op | inst_type_op_32
				 | inst_type_store 
				 | inst_type_branch 
				 | inst_type_jalr 
				 | inst_type_load 
				 | inst_type_op_imm | inst_type_op_imm_32 
				 | inst_csrrw | inst_csrrs | inst_csrrc);

wire Rs2_rd_ena = (inst_type_op | inst_type_op_32 
				 | inst_type_store 
				 | inst_type_branch);

assign o_Rd_wr_addr  = (i_rst)? 5'd0 : Rd_addr; 
assign o_Rs1_rd_addr = (i_rst)? 5'd0 : Rs1_addr;
assign o_Rs2_rd_addr = (i_rst)? 5'd0 : Rs2_addr;

// alu control
wire [7:0] alu_op;

assign alu_op[0] = ((inst_add | inst_addw | inst_addi | inst_addiw)
				  | (inst_type_load | inst_type_store)
				  | (inst_sltu | inst_sltiu));

assign alu_op[1] = ((inst_sub | inst_subw) 
				  | (inst_xor | inst_xori));

assign alu_op[2] = ((inst_slt | inst_slti)
				  | (inst_sltu | inst_sltiu));

assign alu_op[3] = ((inst_or | inst_ori)
				  | (inst_xor | inst_xori)
				  | (inst_srlw | inst_srliw));

assign alu_op[4] = ((inst_and | inst_andi)
				  | (inst_sllw | inst_slliw)
				  | (inst_sraw | inst_sraiw));

assign alu_op[5] = ((inst_sll | inst_slli) 
				  | (inst_sllw | inst_slliw));

assign alu_op[6] = ((inst_srl | inst_srli) 
				  | (inst_srlw | inst_srliw));

assign alu_op[7] = ((inst_sra | inst_srai) 
				  | (inst_sraw | inst_sraiw));

				  
assign o_ctrls = (i_rst | inst_fence | inst_fence_i)? 39'd0 : 
								{csr_to_regs,
								 pc_imm_to_regs, 
								 inst_lui, 
								 mem_to_regs, 
								 Rd_wr_ena, 
								 inst_mem_word, 
								 inst_mem_half, 
								 inst_mem_byte, 
                                 inst_mem_unsiged, 
                                 mem_wr_ena, 
								 mem_rd_ena, 
                                 inst_jump_jalr, 
								 inst_jump_jal, 
								 inst_jump,
								 inst_branch_unsiged,
                                 inst_branch_bge, 
								 inst_branch_blt, 
								 inst_branch_bne, 
								 inst_branch_beq, 
								 alu_op, 
								 inst_op_word, 
								 alu_op2_imm, 
								 inst_mret,
								 inst_ecall,
								 inst_csr_imm,
								 inst_csr_rc,
								 inst_csr_rs,
								 inst_csr_rw,
								 csr_wr_ena,
								 csr_rd_ena,
								 Rs2_rd_ena, 
								 Rs1_rd_ena
								 };

// putch
//assign o_putch_vld = (i_inst == 32'h0000_007b);

endmodule


 

module ysyx_210555_regfile(
    input i_clk,
	input i_rst,
	
	//input i_putch_vld,
	input i_Rd_wr_ena,
	input i_Rs1_rd_ena,
	input i_Rs2_rd_ena,
	input [4:0] i_Rd_wr_addr,
	input [4:0] i_Rs1_rd_addr,
	input [4:0] i_Rs2_rd_addr,
	input [`YSYX210555_REG_BUS] i_Rd_wr_data,
	
	output reg  [`YSYX210555_REG_BUS] o_Rs1_rd_data,
	output reg  [`YSYX210555_REG_BUS] o_Rs2_rd_data
);

// 32 registers
reg [`YSYX210555_REG_BUS] regs [0:31];

always @(posedge i_clk) begin
	if(i_rst) begin
		regs[ 0] <= `YSYX210555_ZERO_WORD;
		regs[ 1] <= `YSYX210555_ZERO_WORD;
		regs[ 2] <= `YSYX210555_ZERO_WORD;
		regs[ 3] <= `YSYX210555_ZERO_WORD;
		regs[ 4] <= `YSYX210555_ZERO_WORD;
		regs[ 5] <= `YSYX210555_ZERO_WORD;
		regs[ 6] <= `YSYX210555_ZERO_WORD;
		regs[ 7] <= `YSYX210555_ZERO_WORD;
		regs[ 8] <= `YSYX210555_ZERO_WORD;
		regs[ 9] <= `YSYX210555_ZERO_WORD;
		regs[10] <= `YSYX210555_ZERO_WORD;
		regs[11] <= `YSYX210555_ZERO_WORD;
		regs[12] <= `YSYX210555_ZERO_WORD;
		regs[13] <= `YSYX210555_ZERO_WORD;
		regs[14] <= `YSYX210555_ZERO_WORD;
		regs[15] <= `YSYX210555_ZERO_WORD;
		regs[16] <= `YSYX210555_ZERO_WORD;
		regs[17] <= `YSYX210555_ZERO_WORD;
		regs[18] <= `YSYX210555_ZERO_WORD;
		regs[19] <= `YSYX210555_ZERO_WORD;
		regs[20] <= `YSYX210555_ZERO_WORD;
		regs[21] <= `YSYX210555_ZERO_WORD;
		regs[22] <= `YSYX210555_ZERO_WORD;
		regs[23] <= `YSYX210555_ZERO_WORD;
		regs[24] <= `YSYX210555_ZERO_WORD;
		regs[25] <= `YSYX210555_ZERO_WORD;
		regs[26] <= `YSYX210555_ZERO_WORD;
		regs[27] <= `YSYX210555_ZERO_WORD;
		regs[28] <= `YSYX210555_ZERO_WORD;
		regs[29] <= `YSYX210555_ZERO_WORD;
		regs[30] <= `YSYX210555_ZERO_WORD;
		regs[31] <= `YSYX210555_ZERO_WORD;
	end
	else if((i_Rd_wr_ena) && (i_Rd_wr_addr != 5'b00000)) begin	
			regs[i_Rd_wr_addr] <= i_Rd_wr_data;
	end
	else ;
end

always @(*) begin
	if(i_rst)
		o_Rs1_rd_data = `YSYX210555_ZERO_WORD;
	else if(i_Rs1_rd_ena)
		o_Rs1_rd_data = regs[i_Rs1_rd_addr];
	else
		o_Rs1_rd_data = `YSYX210555_ZERO_WORD;
end

always @(*) begin
	if(i_rst)
		o_Rs2_rd_data = `YSYX210555_ZERO_WORD;
	else if(i_Rs2_rd_ena)
		o_Rs2_rd_data = regs[i_Rs2_rd_addr];
	else
		o_Rs2_rd_data = `YSYX210555_ZERO_WORD;
end

/*always @(posedge i_clk) begin
	if(i_putch_vld) $write("%c", regs[10]);
	else ;
end*/


endmodule
 
 

module ysyx_210555_adder(
	input i_rst,
	input [`YSYX210555_REG_BUS] i_a,
	input [`YSYX210555_REG_BUS] i_b,
	output [`YSYX210555_REG_BUS] o_sum
);

assign o_sum = (i_rst)? `YSYX210555_ZERO_WORD : (i_a + i_b);

endmodule


 

module ysyx_210555_branch_comp(
	input i_rst,
	input [4:0] i_inst_branch,
	input [`YSYX210555_REG_BUS] i_Rs1,
	input [`YSYX210555_REG_BUS] i_Rs2,

	output o_equ_less
);

reg r_result;

wire [2:0] w_branch_type;

assign w_branch_type[0] = (i_inst_branch == `YSYX210555_BRANCH_BEQ) 
						| (i_inst_branch == `YSYX210555_BRANCH_BNE);
assign w_branch_type[1] = (i_inst_branch == `YSYX210555_BRANCH_BLT) 
						| (i_inst_branch == `YSYX210555_BRANCH_BGE);
assign w_branch_type[2] = (i_inst_branch == `YSYX210555_BRANCH_BLTU) 
						| (i_inst_branch == `YSYX210555_BRANCH_BGEU);

always @(*) begin
	if(i_rst)
		r_result = 1'b0;
	else begin
		case(w_branch_type)
			3'b001: r_result = (i_Rs1 == i_Rs2);
			3'b010: r_result = ( ({i_Rs1[63], i_Rs2[63]} == 2'b10)
								   |( ( ({i_Rs1[63], i_Rs2[63]} == 2'b00) 
									   |({i_Rs1[63], i_Rs2[63]} == 2'b11)) 
								     &(i_Rs1[62:0] < i_Rs2[62:0])));
			3'b100: r_result = (i_Rs1 < i_Rs2);				 
			default: r_result = 1'b0;
		endcase
	end
end

assign o_equ_less = (r_result == 1'b1);

endmodule


 

module ysyx_210555_pc_ctrl_transfer(
	input i_rst,
	input i_equ_less,
	input i_inst_jump,
	input i_csr_pc_vld,
	input [4:0] i_inst_branch,

	output o_pc_ctrf_vld
);


assign o_pc_ctrf_vld = (i_rst)? 1'b0 : (   i_inst_jump
										|  i_csr_pc_vld
										| (i_inst_branch[0] &  i_equ_less)		// inst_branch[0]=beq
										| (i_inst_branch[1] & ~i_equ_less)		// inst_branch[1]=bne
										| (i_inst_branch[2] &  i_equ_less)		// inst_branch[2]=blt/bltu
										| (i_inst_branch[3] & ~i_equ_less));	// inst_branch[3]=bge/bgeu

endmodule


 

module ysyx_210555_csr(
	input i_clk,
	input i_rst,
	input i_stall_n,
	
	input i_mret,
	input i_csr_rd_ena,
	input [11:0] i_csr_rd_addr,
	input i_csr_wr_ena,
	input i_handshake_done,
	input [11:0] i_csr_wr_addr,
	input [`YSYX210555_REG_BUS] i_csr_wr_data,
	input [2:0] i_exception,
	input [`YSYX210555_REG_BUS] i_if_inst_pc,
	input [`YSYX210555_REG_BUS] i_id_inst_pc,
	
	output o_interrupt_timer_vld,
	output o_csr_pc_vld,
	output [`YSYX210555_REG_BUS] o_csr_pc,
	output [`YSYX210555_REG_BUS] o_csr_rd_data
);

reg [`YSYX210555_REG_BUS] csr_sstatus;
reg [`YSYX210555_REG_BUS] csr_mstatus;
reg [`YSYX210555_REG_BUS] csr_mie;
reg [`YSYX210555_REG_BUS] csr_mtvec;
reg [`YSYX210555_REG_BUS] csr_mscratch;
reg [`YSYX210555_REG_BUS] csr_mepc;
reg [`YSYX210555_REG_BUS] csr_mcause;
reg [`YSYX210555_REG_BUS] csr_mip;
reg [`YSYX210555_REG_BUS] csr_mcycle;

wire [`YSYX210555_REG_BUS] sstatus_next;
wire [`YSYX210555_REG_BUS] mstatus_next;
wire [`YSYX210555_REG_BUS] mie_next;
wire [`YSYX210555_REG_BUS] mtvec_next;
wire [`YSYX210555_REG_BUS] mscratch_next;
wire [`YSYX210555_REG_BUS] mepc_next;
wire [`YSYX210555_REG_BUS] mcause_next;
wire [`YSYX210555_REG_BUS] mip_next;
wire [`YSYX210555_REG_BUS] mcycle_next;

wire mstatus_mie = csr_mstatus[3];	//全局中断启用位
wire mie_mtie = csr_mie[7];			//计时器中断启用位

wire w_exception_ilgl_inst = i_exception[2];//(i_exception == `YSYX210555_EXCEPTION_EXCEPTION_ILGL_INST);
wire w_exception_ecall = i_exception[0];//(i_exception == `YSYX210555_EXCEPTION_EXCEPTION_ECALL);
wire w_interrupt_timer = i_exception[1] & mstatus_mie & mie_mtie; //(i_exception == `YSYX210555_EXCEPTION_INTERRUPT_TIMER)

wire [`YSYX210555_REG_BUS] w_csr_rd_data;

wire w_sel_rd_sstatus  = i_csr_rd_ena & (i_csr_rd_addr == `YSYX210555_CSR_ADDR_SSTATUS );
wire w_sel_rd_mstatus  = i_csr_rd_ena & (i_csr_rd_addr == `YSYX210555_CSR_ADDR_MSTATUS );
wire w_sel_rd_mie      = i_csr_rd_ena & (i_csr_rd_addr == `YSYX210555_CSR_ADDR_MIE     );
wire w_sel_rd_mtvec    = i_csr_rd_ena & (i_csr_rd_addr == `YSYX210555_CSR_ADDR_MTVEC   );
wire w_sel_rd_mscratch = i_csr_rd_ena & (i_csr_rd_addr == `YSYX210555_CSR_ADDR_MSCRATCH);
wire w_sel_rd_mepc     = i_csr_rd_ena & (i_csr_rd_addr == `YSYX210555_CSR_ADDR_MEPC    );
wire w_sel_rd_mcause   = i_csr_rd_ena & (i_csr_rd_addr == `YSYX210555_CSR_ADDR_MCAUSE  );
wire w_sel_rd_mip      = i_csr_rd_ena & (i_csr_rd_addr == `YSYX210555_CSR_ADDR_MIP     );
wire w_sel_rd_mcycle   = i_csr_rd_ena & (i_csr_rd_addr == `YSYX210555_CSR_ADDR_MCYCLE  );

//wire w_sel_wr_sstatus  = i_csr_wr_ena & (i_csr_wr_addr == `YSYX210555_CSR_ADDR_SSTATUS ) & i_stall_n;	//mem类数据冒险时，csr不可写，需stall一拍等前递数据
wire w_sel_wr_mstatus  = i_csr_wr_ena & (i_csr_wr_addr == `YSYX210555_CSR_ADDR_MSTATUS ) & i_stall_n;
wire w_sel_wr_mie      = i_csr_wr_ena & (i_csr_wr_addr == `YSYX210555_CSR_ADDR_MIE     ) & i_stall_n;
wire w_sel_wr_mtvec    = i_csr_wr_ena & (i_csr_wr_addr == `YSYX210555_CSR_ADDR_MTVEC   ) & i_stall_n;
wire w_sel_wr_mscratch = i_csr_wr_ena & (i_csr_wr_addr == `YSYX210555_CSR_ADDR_MSCRATCH) & i_stall_n;
wire w_sel_wr_mepc     = i_csr_wr_ena & (i_csr_wr_addr == `YSYX210555_CSR_ADDR_MEPC    ) & i_stall_n;
wire w_sel_wr_mcause   = i_csr_wr_ena & (i_csr_wr_addr == `YSYX210555_CSR_ADDR_MCAUSE  ) & i_stall_n;
//wire w_sel_wr_mip      = i_csr_wr_ena & (i_csr_wr_addr == `YSYX210555_CSR_ADDR_MIP     ) & i_stall_n;
wire w_sel_wr_mcycle   = i_csr_wr_ena & (i_csr_wr_addr == `YSYX210555_CSR_ADDR_MCYCLE  ) & i_stall_n;

wire w_general_exception = w_exception_ilgl_inst | w_exception_ecall | w_interrupt_timer;
wire w_mret = i_mret;

wire [1:0] mstatus_xs = (w_sel_wr_mstatus)? 	i_csr_wr_data[16:15] : 
									csr_mstatus[16:15]   ;
wire [1:0] mstatus_fs =  (w_sel_wr_mstatus)? 	i_csr_wr_data[14:13] : 
									csr_mstatus[14:13]   ;
wire mstatus_sd = (mstatus_fs == 2'b11) | (mstatus_xs == 2'b11);

// 0x100 sstatus
assign sstatus_next[63] = mstatus_sd;	// SD
assign sstatus_next[62:34] = 29'd0;
assign sstatus_next[33:32] = 2'b00;
assign sstatus_next[31:20] = 12'd0;
assign sstatus_next[19] = 1'b0;
assign sstatus_next[18] = 1'b0;
assign sstatus_next[17] = 1'b0;
assign sstatus_next[16:15] = mstatus_xs;	// XS
assign sstatus_next[14:13] = mstatus_fs;	// FS
assign sstatus_next[12:9] = 4'b0000;
assign sstatus_next[8] = 1'b0;
assign sstatus_next[7:6] = 2'b00;
assign sstatus_next[5] = 1'b0;
assign sstatus_next[4] = 1'b0;
assign sstatus_next[3:2] = 2'b00;
assign sstatus_next[1] = 1'b0;
assign sstatus_next[0] = 1'b0;

// 0x300 mstatus
assign mstatus_next[63] = mstatus_sd;	// SD
assign mstatus_next[62:36] = 27'd0;
assign mstatus_next[35:34] = 2'b00;
assign mstatus_next[33:32] = 2'b00;
assign mstatus_next[31:23] = 9'd0;
assign mstatus_next[22] = 1'b0;
assign mstatus_next[21] = 1'b0;
assign mstatus_next[20] = 1'b0;
assign mstatus_next[19] = 1'b0;
assign mstatus_next[18] = 1'b0;
assign mstatus_next[17] = 1'b0;
assign mstatus_next[16:15] = mstatus_xs;	// XS
assign mstatus_next[14:13] = mstatus_fs;	// FS
assign mstatus_next[12:11] = (w_general_exception)? 2'b11   			 : 
							 (w_mret)? 				2'b00 			     :
							 (w_sel_wr_mstatus)? 	i_csr_wr_data[12:11] : 
													csr_mstatus[12:11]   ;	// MPP

assign mstatus_next[10:9] = 2'b00;
assign mstatus_next[8] = 1'b0;
assign mstatus_next[7] = (w_general_exception)? csr_mstatus[3]   : 
						 (w_mret)? 				1'b1 			 :
						 (w_sel_wr_mstatus)? 	i_csr_wr_data[7] : 
												csr_mstatus[7]   ;	// MPIE

assign mstatus_next[6] = 1'b0;
assign mstatus_next[5] = 1'b0;
assign mstatus_next[4] = 1'b0;
assign mstatus_next[3] = (w_general_exception)? 1'b0 			 : 
						 (w_mret)? 				csr_mstatus[7]   :
						 (w_sel_wr_mstatus)? 	i_csr_wr_data[3] : 
												csr_mstatus[3]   ;	// MIE

assign mstatus_next[2] = 1'b0;
assign mstatus_next[1] = 1'b0;
assign mstatus_next[0] = 1'b0;

// 0x304 mie
assign mie_next[63:12] = 52'd0;
assign mie_next[11] = (w_sel_wr_mie)? i_csr_wr_data[11] : csr_mie[11];	//MEIE
assign mie_next[10] = 1'b0;
assign mie_next[9]  = 1'b0;	//SEIE
assign mie_next[8]  = 1'b0;	//UEIE
assign mie_next[7]  = (w_sel_wr_mie)? i_csr_wr_data[7] : csr_mie[7];	//MTIE
assign mie_next[6]  = 1'b0;
assign mie_next[5]  = 1'b0;	//STIE
assign mie_next[4]  = 1'b0;	//UTIE
assign mie_next[3]  = (w_sel_wr_mie)? i_csr_wr_data[3] : csr_mie[3];	//MSIE
assign mie_next[2]  = 1'b0;
assign mie_next[1]  = 1'b0;	//SSIE
assign mie_next[0]  = 1'b0;	//USIE

// 0x305 mtvec
assign mtvec_next[63:2] = (w_sel_wr_mtvec)? i_csr_wr_data[63:2] : csr_mtvec[63:2];
assign mtvec_next[1:0]  = (w_sel_wr_mtvec)? i_csr_wr_data[1:0] : csr_mtvec[1:0];

// 0x340 mscratch
assign mscratch_next = (w_sel_wr_mscratch)? i_csr_wr_data : csr_mscratch;

// 0x341 mepc
assign mepc_next = (w_interrupt_timer & (i_id_inst_pc != `YSYX210555_PC_START))? i_id_inst_pc 	: 
				   (w_interrupt_timer & (i_id_inst_pc == `YSYX210555_PC_START))? i_if_inst_pc 	: 
				   (w_exception_ilgl_inst)? i_id_inst_pc	:
				   (w_exception_ecall)? i_id_inst_pc 			  : 
				   (w_sel_wr_mepc)? 	  i_csr_wr_data : 
										  csr_mepc      ;

// 0x342 mcause
assign mcause_next[63]   = (w_interrupt_timer)? 1'b1 			  : 
						   (w_exception_ilgl_inst)? 1'b0	:
						   (w_exception_ecall)? 1'b0 			  : 
						   (w_sel_wr_mcause)? 	i_csr_wr_data[63] : 
												csr_mcause[63]	  ;
assign mcause_next[62:0] = (w_interrupt_timer)? 63'd7 				: 
						   (w_exception_ilgl_inst)? 63'd2	:
						   (w_exception_ecall)? 63'd11 				: 
						   (w_sel_wr_mcause)? 	i_csr_wr_data[62:0] : 
												csr_mcause[62:0]	;

// 0x343 mtval
// 0x344 mip
assign mip_next[63:12] = 52'd0;
assign mip_next[11] = 1'b0;	//MEIP
assign mip_next[10] = 1'b0;
assign mip_next[9]  = 1'b0;	//SEIP
assign mip_next[8]  = 1'b0;	//UEIP
assign mip_next[7]  = 1'b0;	//MTIP
assign mip_next[6]  = 1'b0;
assign mip_next[5]  = 1'b0;	//STIP
assign mip_next[4]  = 1'b0;	//UTIP
assign mip_next[3]  = 1'b0;	//MSIP
assign mip_next[2]  = 1'b0;
assign mip_next[1]  = 1'b0;	//SSIP
assign mip_next[0]  = 1'b0;	//USIP

// 0xB00 mcycle
assign mcycle_next = (w_sel_wr_mcycle)? i_csr_wr_data : (csr_mcycle +1);

// 0xB02 minstret

// 0xF14 mhartid


always @(posedge i_clk) begin
	if(i_rst) begin
		csr_sstatus  <= `YSYX210555_ZERO_WORD;
		csr_mstatus  <= `YSYX210555_ZERO_WORD;
		csr_mie      <= `YSYX210555_ZERO_WORD;
		csr_mtvec    <= `YSYX210555_ZERO_WORD;
		csr_mscratch <= `YSYX210555_ZERO_WORD;
		csr_mepc     <= `YSYX210555_ZERO_WORD;
		csr_mcause   <= `YSYX210555_ZERO_WORD;
		csr_mip      <= `YSYX210555_ZERO_WORD;
		csr_mcycle   <= `YSYX210555_ZERO_WORD;
	end
	else if(i_handshake_done) begin
		csr_sstatus  <= sstatus_next;
		csr_mstatus  <= mstatus_next;
		csr_mie      <= mie_next;
		csr_mtvec    <= mtvec_next;
		csr_mscratch <= mscratch_next;
		csr_mepc     <= mepc_next;
		csr_mcause   <= mcause_next;
		csr_mip      <= mip_next;
		csr_mcycle   <= mcycle_next;
	end
end

// CSR Read Port
assign w_csr_rd_data = (csr_sstatus  & {64{w_sel_rd_sstatus }})
					 | (csr_mstatus  & {64{w_sel_rd_mstatus }})
					 | (csr_mie      & {64{w_sel_rd_mie     }})
					 | (csr_mtvec    & {64{w_sel_rd_mtvec   }})
					 | (csr_mscratch & {64{w_sel_rd_mscratch}})
					 | (csr_mepc     & {64{w_sel_rd_mepc    }})
					 | (csr_mcause   & {64{w_sel_rd_mcause  }})
					 | (csr_mip      & {64{w_sel_rd_mip     }})
					 | (csr_mcycle   & {64{w_sel_rd_mcycle  }})
					 | `YSYX210555_ZERO_WORD;

assign o_csr_rd_data = (i_rst)? 	   `YSYX210555_ZERO_WORD 	 : 
					   (i_csr_rd_ena)? w_csr_rd_data : 
									   `YSYX210555_ZERO_WORD	 ;

wire [63:0] w_exception_pc = (csr_mtvec[0] & w_interrupt_timer)? ({csr_mtvec[63:2],2'b00} +64'd28) : 
																  {csr_mtvec[63:2],2'b00}		   ;
																  
wire [63:0] w_csr_pc = (w_mret)? 			  csr_mepc 		 : 
					   (w_general_exception)? w_exception_pc :
											  `YSYX210555_ZERO_WORD	 ;

assign o_csr_pc = (i_rst)? `YSYX210555_ZERO_WORD : w_csr_pc;
assign o_csr_pc_vld = (i_rst)? 1'b0 : (w_mret | w_general_exception);

assign o_interrupt_timer_vld = w_interrupt_timer;

endmodule


 

module ysyx_210555_csr_op(
	input i_rst,
	input [2:0] i_inst_csr,
	input [`YSYX210555_REG_BUS] i_Rs1_or_imm,
	input [`YSYX210555_REG_BUS] i_csr_rd_data,
	
	output [`YSYX210555_REG_BUS] o_csr_wr_data
);

// i_inst_csr[0]=csrrw, i_inst_csr[1]=csrrs, i_inst_csr[2]=csrrc,
assign o_csr_wr_data = (i_rst)?									 `YSYX210555_ZERO_WORD : 
					   (i_inst_csr == 3'b001)? 				   i_Rs1_or_imm : 
					   (i_inst_csr == 3'b010)? i_csr_rd_data |  i_Rs1_or_imm : 
					   (i_inst_csr == 3'b100)? i_csr_rd_data & ~i_Rs1_or_imm : 
																 `YSYX210555_ZERO_WORD ;

endmodule


 

module ysyx_210555_forwarding(
	input i_rst,
	
	input [4:0] i_id_Rs1,
	input [4:0] i_id_Rs2,
	input [4:0] i_ex_Rd,
	input [4:0] i_me_Rd,
	input [4:0] i_wb_Rd,
	input i_id_Rs1_rd_ena,
	input i_id_Rs2_rd_ena,
	input i_ex_Rd_wr_ena,
	input i_me_Rd_wr_ena,
	input i_wb_Rd_wr_ena,
/*	input [11:0] i_id_csr,
	input [11:0] i_ex_csr,
	input [11:0] i_me_csr,
	input [11:0] i_wb_csr,
	input i_id_csr_rd_ena,
	input i_ex_csr_wr_ena,
	input i_me_csr_wr_ena,
	input i_wb_csr_wr_ena,*/
	
	output reg [2:0] o_forward_Rs1,
	output reg [2:0] o_forward_Rs2
//	output reg [2:0] o_forward_csr
);

wire w_Rs1_from_ex_Rd = i_id_Rs1_rd_ena & (i_id_Rs1 == i_ex_Rd);
wire w_Rs1_from_me_Rd = i_id_Rs1_rd_ena & (i_id_Rs1 == i_me_Rd);
wire w_Rs1_from_wb_Rd = i_id_Rs1_rd_ena & (i_id_Rs1 == i_wb_Rd);

wire w_Rs2_from_ex_Rd = i_id_Rs2_rd_ena & (i_id_Rs2 == i_ex_Rd);
wire w_Rs2_from_me_Rd = i_id_Rs2_rd_ena & (i_id_Rs2 == i_me_Rd);
wire w_Rs2_from_wb_Rd = i_id_Rs2_rd_ena & (i_id_Rs2 == i_wb_Rd);
/*
wire w_csr_from_ex_csr = i_id_csr_rd_ena & (i_id_csr == i_ex_csr);
wire w_csr_from_me_csr = i_id_csr_rd_ena & (i_id_csr == i_me_csr);
wire w_csr_from_wb_csr = i_id_csr_rd_ena & (i_id_csr == i_wb_csr);
*/
always @(*) begin
	if(i_rst) begin
		o_forward_Rs1 = 3'b000;
	end
	else if(i_ex_Rd_wr_ena & (i_ex_Rd != 5'd0) & (i_id_Rs1 == i_ex_Rd)) begin
		o_forward_Rs1 = {1'b0, 1'b0, w_Rs1_from_ex_Rd};
	end
	else if(i_me_Rd_wr_ena & (i_me_Rd != 5'd0) & (i_id_Rs1 == i_me_Rd)) begin
		o_forward_Rs1 = {1'b0, w_Rs1_from_me_Rd, 1'b0};
	end
	else if(i_wb_Rd_wr_ena & (i_wb_Rd != 5'd0) & (i_id_Rs1 == i_wb_Rd)) begin
		o_forward_Rs1 = {w_Rs1_from_wb_Rd, 1'b0, 1'b0};
	end
	else begin
		o_forward_Rs1 = 3'b000;
	end
end

always @(*) begin
	if(i_rst) begin
		o_forward_Rs2 = 3'b000;
	end
	else if(i_ex_Rd_wr_ena & (i_ex_Rd != 5'd0) & (i_id_Rs2 == i_ex_Rd)) begin
		o_forward_Rs2 = {1'b0, 1'b0, w_Rs2_from_ex_Rd};
	end
	else if(i_me_Rd_wr_ena & (i_me_Rd != 5'd0) & (i_id_Rs2 == i_me_Rd)) begin
		o_forward_Rs2 = {1'b0, w_Rs2_from_me_Rd, 1'b0};
	end
	else if(i_wb_Rd_wr_ena & (i_wb_Rd != 5'd0) & (i_id_Rs2 == i_wb_Rd)) begin
		o_forward_Rs2 = {w_Rs2_from_wb_Rd, 1'b0, 1'b0};
	end
	else begin
		o_forward_Rs2 = 3'b000;
	end
end
/*
always @(*) begin
	if(i_rst) begin
		o_forward_csr = 3'b000;
	end
	else if(i_ex_csr_wr_ena & (i_id_csr == i_ex_csr)) begin
		o_forward_csr = {1'b0, 1'b0, w_csr_from_ex_csr};
	end
	else if(i_me_csr_wr_ena & (i_id_csr == i_me_csr)) begin
		o_forward_csr = {1'b0, w_csr_from_me_csr, 1'b0};
	end
	else if(i_wb_csr_wr_ena & (i_id_csr == i_wb_csr)) begin
		o_forward_csr = {w_csr_from_wb_csr, 1'b0, 1'b0};
	end
	else begin
		o_forward_csr = 3'b000;
	end
end*/

endmodule

 

module ysyx_210555_hazard_detect(
	input i_rst,
	
	input [4:0] i_id_Rs1,
	input [4:0] i_id_Rs2,
	input [4:0] i_ex_Rd,
	input i_ex_mem_rd_ena,
	input i_id_Rs1_rd_ena,
	input i_id_Rs2_rd_ena,
	input i_id_pc_ctrf_vld,
	
	output o_stall_n,
	output o_flush_id_ex,
	output o_flush_if_id
);

assign o_flush_if_id = (i_rst)? 1'b0 : (i_id_pc_ctrf_vld & o_stall_n);	//stall时不可插入气泡，否则可能导致等待mem数据的分支指令消失
assign o_flush_id_ex = (i_rst)? 1'b0 : (i_ex_mem_rd_ena & (((i_id_Rs1 == i_ex_Rd) & i_id_Rs1_rd_ena) 
														 | ((i_id_Rs2 == i_ex_Rd) & i_id_Rs2_rd_ena)));
assign o_stall_n = (i_rst)? 1'b1 : ~(i_ex_mem_rd_ena & (((i_id_Rs1 == i_ex_Rd) & i_id_Rs1_rd_ena) 
													  | ((i_id_Rs2 == i_ex_Rd) & i_id_Rs2_rd_ena)));

endmodule

 

module ysyx_210555_id_ex(
	input i_clk,
	input i_rst,
	input i_ena,
	
	input [`YSYX210555_CTRL_BUS] i_id_ctrls,
	input [`YSYX210555_REG_BUS] i_id_Rd_data_JUtype,
	input [`YSYX210555_REG_BUS] i_id_Rs1_rd_data,
	input [`YSYX210555_REG_BUS] i_id_Rs2_rd_data,
	input [`YSYX210555_REG_BUS] i_id_imm_rv64,
	input [4:0] i_id_Rd_wr_addr,
	//input [11:0] i_id_csr_addr,
	input [`YSYX210555_REG_BUS] i_id_csr_rd_data,
	
	output reg [`YSYX210555_CTRL_BUS] o_ex_ctrls,
	output reg [`YSYX210555_REG_BUS] o_ex_Rd_data_JUtype,
	output reg [`YSYX210555_REG_BUS] o_ex_Rs1_rd_data,
	output reg [`YSYX210555_REG_BUS] o_ex_Rs2_rd_data,
	output reg [`YSYX210555_REG_BUS] o_ex_imm_rv64,
	output reg [4:0] o_ex_Rd_wr_addr,
	//output reg [11:0] o_ex_csr_addr,
	output reg [`YSYX210555_REG_BUS] o_ex_csr_rd_data
);

always @(posedge i_clk) begin
	if(i_rst) begin
		o_ex_ctrls          <= 39'd0;
		o_ex_Rd_data_JUtype <= `YSYX210555_ZERO_WORD;
		o_ex_Rs1_rd_data    <= `YSYX210555_ZERO_WORD;
		o_ex_Rs2_rd_data    <= `YSYX210555_ZERO_WORD;
		o_ex_imm_rv64       <= `YSYX210555_ZERO_WORD;
		o_ex_Rd_wr_addr     <= 5'd0;
		//o_ex_csr_addr       <= 12'd0;
		o_ex_csr_rd_data    <= `YSYX210555_ZERO_WORD;
	end
	else if(i_ena) begin
		o_ex_ctrls          <= i_id_ctrls;
		o_ex_Rd_data_JUtype <= i_id_Rd_data_JUtype;
		o_ex_Rs1_rd_data    <= i_id_Rs1_rd_data;
		o_ex_Rs2_rd_data    <= i_id_Rs2_rd_data;
		o_ex_imm_rv64       <= i_id_imm_rv64;
		o_ex_Rd_wr_addr     <= i_id_Rd_wr_addr;
		//o_ex_csr_addr       <= i_id_csr_addr;
		o_ex_csr_rd_data    <= i_id_csr_rd_data;
	end
	else ;
end 


endmodule

 

module ysyx_210555_alu(
	input i_rst,
	input i_inst_op_word,
	input [7:0] i_alu_op,
	input [`YSYX210555_REG_BUS] i_op1,
	input [`YSYX210555_REG_BUS] i_op2,

	output [`YSYX210555_REG_BUS] o_alu_result
);

reg [`YSYX210555_REG_BUS] result;

always @(*) begin
	if(i_rst) begin
		result = `YSYX210555_ZERO_WORD;
	end
	else begin
		case(i_alu_op)
			`YSYX210555_EX_OP_ADD : result = i_op1 + i_op2;
			`YSYX210555_EX_OP_SUB : result = i_op1 - i_op2;
			`YSYX210555_EX_OP_AND : result = i_op1 & i_op2;
			`YSYX210555_EX_OP_OR  : result = i_op1 | i_op2;
			`YSYX210555_EX_OP_XOR : result = i_op1 ^ i_op2;

			`YSYX210555_EX_OP_SLT : result = {63'd0, 
								  (  ({i_op1[63], i_op2[63]} == 2'b10)
								   ||( (  ({i_op1[63], i_op2[63]} == 2'b00) 
									    ||({i_op1[63], i_op2[63]} == 2'b11)) 
								      &&(i_op1[62:0] < i_op2[62:0])))};
			`YSYX210555_EX_OP_SLTU: result = {63'd0, i_op1 < i_op2};
			
			`YSYX210555_EX_OP_SLL : result = i_op1 << i_op2[5:0];
			`YSYX210555_EX_OP_SRL : result = i_op1 >> i_op2[5:0];
			`YSYX210555_EX_OP_SRA : result = (  ({{63{i_op1[63]}},1'b0} << (~i_op2[5:0]))
								   | (i_op1 >> i_op2[5:0])
								  );
								 
			`YSYX210555_EX_OP_SLLW: result = i_op1 << i_op2[4:0];
			`YSYX210555_EX_OP_SRLW: result = {32'd0, i_op1[31:0]} >> i_op2[4:0];
			`YSYX210555_EX_OP_SRAW: result = (({{63{i_op1[31]}},1'b0} << (~i_op2[4:0]))
								 | ({32'd0, i_op1[31:0]} >> i_op2[4:0]));
								 
			default: 	 result = `YSYX210555_ZERO_WORD;
		endcase
	end
end

assign o_alu_result = (i_inst_op_word)? ({{32{result[31]}}, result[31:0]}) : result;

endmodule


 
/*
module ysyx_210555_putch(
    input i_clk,
	input i_rst,
	
	input i_id_putch_vld,
	input [`YSYX210555_REG_BUS] i_ex_alu_result
);


always @(posedge i_clk) begin
	if(i_rst) ;
	else if(i_id_putch_vld) 
		$write("%c", i_ex_alu_result[7:0]);	//直接打印0000007b前的mv指令的rd（即a0）的数据（即ex_alu_result）
	else ;
end


endmodule
*/
 

module ysyx_210555_ex_me(
	input i_clk,
	input i_rst,
	input i_ena,
			
	input [`YSYX210555_CTRL_BUS] i_ex_ctrls,		
	input [`YSYX210555_REG_BUS] i_ex_Rd_data_JUtype,
	input [`YSYX210555_REG_BUS] i_ex_alu_result,	
	input [`YSYX210555_REG_BUS] i_ex_Rs2_rd_data,
	input [4:0] i_ex_Rd_wr_addr,
	//input [11:0] i_ex_csr_addr,
	input [`YSYX210555_REG_BUS] i_ex_csr_rd_data,
	//input [`YSYX210555_REG_BUS] i_ex_csr_wr_data,
				
	output reg [`YSYX210555_CTRL_BUS] o_me_ctrls,		
	output reg [`YSYX210555_REG_BUS] o_me_Rd_data_JUtype,
	output reg [`YSYX210555_REG_BUS] o_me_alu_result,	
	output reg [`YSYX210555_REG_BUS] o_me_Rs2_rd_data,
	output reg [4:0] o_me_Rd_wr_addr,
	//output reg [11:0] o_me_csr_addr,
	output reg [`YSYX210555_REG_BUS] o_me_csr_rd_data
	//output reg [`YSYX210555_REG_BUS] o_me_csr_wr_data
);

always @(posedge i_clk) begin
	if(i_rst) begin
		o_me_ctrls          <= 39'd0;
		o_me_Rd_data_JUtype <= `YSYX210555_ZERO_WORD;
		o_me_alu_result     <= `YSYX210555_ZERO_WORD;
		o_me_Rs2_rd_data    <= `YSYX210555_ZERO_WORD;
		o_me_Rd_wr_addr     <= 5'd0;
		//o_me_csr_addr       <= 12'd0;
		o_me_csr_rd_data    <= `YSYX210555_ZERO_WORD;
		//o_me_csr_wr_data    <= `YSYX210555_ZERO_WORD;
	end
	else if(i_ena) begin                    
		o_me_ctrls          <= i_ex_ctrls;         
		o_me_Rd_data_JUtype <= i_ex_Rd_data_JUtype;
		o_me_alu_result     <= i_ex_alu_result;    
		o_me_Rs2_rd_data    <= i_ex_Rs2_rd_data;   
		o_me_Rd_wr_addr     <= i_ex_Rd_wr_addr;    
		//o_me_csr_addr       <= i_ex_csr_addr;      
		o_me_csr_rd_data    <= i_ex_csr_rd_data;   
		//o_me_csr_wr_data    <= i_ex_csr_wr_data;
	end
	else ;
end 

endmodule

 

module ysyx_210555_mem_axi(
	input i_rst,

	input i_mem_rd_ena,
	input i_mem_wr_ena,
	input [5:0] i_mem_op,
	input [`YSYX210555_REG_BUS] i_mem_addr,
	input [`YSYX210555_REG_BUS] i_Rs2_data,
	output reg [`YSYX210555_REG_BUS] o_mem_rd_data,
	
//	input i_mem_ready,
	input [1:0] i_mem_resp,
	input [`YSYX210555_REG_BUS] i_mem_rdata,
	
	output reg o_mem_req,
	output reg o_mem_valid,
	output reg [1:0] o_mem_size,
	output reg [`YSYX210555_REG_BUS] o_mem_addr,
	output reg [`YSYX210555_REG_BUS] o_mem_wdata
);

always @(*) begin
	if(i_rst) begin
		o_mem_req   = 1'b0;
		o_mem_valid = 1'b0;
		o_mem_size  = 2'b00;
		o_mem_addr  = `YSYX210555_ZERO_WORD;
		o_mem_wdata = `YSYX210555_ZERO_WORD;
		o_mem_rd_data = `YSYX210555_ZERO_WORD;
	end
	else begin
		o_mem_valid = i_mem_rd_ena | i_mem_wr_ena;
		o_mem_addr  = i_mem_addr;
		case(i_mem_op)
			`YSYX210555_MEM_OP_SB : begin 
				o_mem_req   = `YSYX210555_REQ_WRITE;
				o_mem_size  = `YSYX210555_SIZE_B;
				o_mem_wdata = {8{i_Rs2_data[7:0]}};
				o_mem_rd_data = `YSYX210555_ZERO_WORD;
			end
			`YSYX210555_MEM_OP_SH : begin 
				o_mem_req   = `YSYX210555_REQ_WRITE;
				o_mem_size  = `YSYX210555_SIZE_H;
				o_mem_wdata = {4{i_Rs2_data[15:0]}};
				o_mem_rd_data = `YSYX210555_ZERO_WORD;
			end
			`YSYX210555_MEM_OP_SW : begin 
				o_mem_req   = `YSYX210555_REQ_WRITE;
				o_mem_size  = `YSYX210555_SIZE_W;
				o_mem_wdata = {2{i_Rs2_data[31:0]}};
				o_mem_rd_data = `YSYX210555_ZERO_WORD;
			end
			`YSYX210555_MEM_OP_SD : begin 
				o_mem_req   = `YSYX210555_REQ_WRITE;
				o_mem_size  = `YSYX210555_SIZE_D;
				o_mem_wdata = i_Rs2_data;
				o_mem_rd_data = `YSYX210555_ZERO_WORD;
			end
			`YSYX210555_MEM_OP_LB : begin 
				o_mem_req   = `YSYX210555_REQ_READ;
				o_mem_size  = `YSYX210555_SIZE_B;
				o_mem_wdata = `YSYX210555_ZERO_WORD;
				o_mem_rd_data = {{56{i_mem_rdata[ 7]}},i_mem_rdata[ 7: 0]};
			end
			`YSYX210555_MEM_OP_LH : begin 
				o_mem_req   = `YSYX210555_REQ_READ;
				o_mem_size  = `YSYX210555_SIZE_H;
				o_mem_wdata = `YSYX210555_ZERO_WORD;
				o_mem_rd_data = {{48{i_mem_rdata[15]}},i_mem_rdata[15: 0]};
			end
			`YSYX210555_MEM_OP_LW : begin 
				o_mem_req   = `YSYX210555_REQ_READ;
				o_mem_size  = `YSYX210555_SIZE_W;
				o_mem_wdata = `YSYX210555_ZERO_WORD;
				o_mem_rd_data = {{32{i_mem_rdata[31]}},i_mem_rdata[31: 0]};
			end
			`YSYX210555_MEM_OP_LD : begin 
				o_mem_req   = `YSYX210555_REQ_READ;
				o_mem_size  = `YSYX210555_SIZE_D;
				o_mem_wdata = `YSYX210555_ZERO_WORD;
				o_mem_rd_data = i_mem_rdata;
			end
			`YSYX210555_MEM_OP_LBU: begin 
				o_mem_req   = `YSYX210555_REQ_READ;
				o_mem_size  = `YSYX210555_SIZE_B;
				o_mem_wdata = `YSYX210555_ZERO_WORD;
				o_mem_rd_data = {56'd0,i_mem_rdata[ 7: 0]};
			end
			`YSYX210555_MEM_OP_LHU: begin 
				o_mem_req   = `YSYX210555_REQ_READ;
				o_mem_size  = `YSYX210555_SIZE_H;
				o_mem_wdata = `YSYX210555_ZERO_WORD;
				o_mem_rd_data = {48'd0,i_mem_rdata[15: 0]};
			end
			`YSYX210555_MEM_OP_LWU: begin 
				o_mem_req   = `YSYX210555_REQ_READ;
				o_mem_size  = `YSYX210555_SIZE_W;
				o_mem_wdata = `YSYX210555_ZERO_WORD;
				o_mem_rd_data = {32'd0,i_mem_rdata[31: 0]};
			end
			default: begin
				o_mem_req   = 1'b0;
				o_mem_size  = 2'b00;
				o_mem_wdata = `YSYX210555_ZERO_WORD;
				o_mem_rd_data = `YSYX210555_ZERO_WORD;
			end
		endcase	
	end
end

endmodule




 

module ysyx_210555_me_wb(
	input i_clk,
	input i_rst,
	input i_ena,
			
	input [`YSYX210555_CTRL_BUS] i_me_ctrls,		
	input [`YSYX210555_REG_BUS]  i_me_Rd_data_JUtype,
	input [`YSYX210555_REG_BUS]  i_me_alu_result,	
	input [`YSYX210555_REG_BUS]  i_me_mem2reg_data,
	input [4:0]       i_me_Rd_wr_addr,
	//input [11:0]      i_me_csr_addr,
	input [`YSYX210555_REG_BUS]  i_me_csr_rd_data,
	//input [`YSYX210555_REG_BUS]  i_me_csr_wr_data,
			
	output reg [`YSYX210555_CTRL_BUS] o_wb_ctrls,		
	output reg [`YSYX210555_REG_BUS]  o_wb_Rd_data_JUtype,
	output reg [`YSYX210555_REG_BUS]  o_wb_alu_result,	
	output reg [`YSYX210555_REG_BUS]  o_wb_mem2reg_data,
	output reg [4:0]       o_wb_Rd_wr_addr,
	//output reg [11:0]      o_wb_csr_addr,
	output reg [`YSYX210555_REG_BUS]  o_wb_csr_rd_data
	//output reg [`YSYX210555_REG_BUS]  o_wb_csr_wr_data
);

always @(posedge i_clk) begin
	if(i_rst) begin
		o_wb_ctrls          <= 39'd0;
		o_wb_Rd_data_JUtype <= `YSYX210555_ZERO_WORD;
		o_wb_alu_result	    <= `YSYX210555_ZERO_WORD;
		o_wb_mem2reg_data   <= `YSYX210555_ZERO_WORD;
		o_wb_Rd_wr_addr     <= 5'd0;
		//o_wb_csr_addr       <= 12'd0;
		o_wb_csr_rd_data    <= `YSYX210555_ZERO_WORD;
		//o_wb_csr_wr_data    <= `YSYX210555_ZERO_WORD;
	end
	else if(i_ena) begin		
		o_wb_ctrls          <= i_me_ctrls;		
		o_wb_Rd_data_JUtype <= i_me_Rd_data_JUtype;
		o_wb_alu_result	    <= i_me_alu_result;	
		o_wb_mem2reg_data   <= i_me_mem2reg_data;
		o_wb_Rd_wr_addr     <= i_me_Rd_wr_addr;
		//o_wb_csr_addr       <= i_me_csr_addr;
		o_wb_csr_rd_data    <= i_me_csr_rd_data;
		//o_wb_csr_wr_data    <= i_me_csr_wr_data;
	end
	else ;
end

endmodule

 

module ysyx_210555_mux_2to1(
	input i_rst,
	input i_sel,
	input [`YSYX210555_REG_BUS] i_in0, i_in1,
	
	output [`YSYX210555_REG_BUS] o_out
);
/*
always @(*) begin
	if(i_rst) 
		o_out = `YSYX210555_ZERO_WORD;
	else if(i_sel) 
		o_out = i_in1;
	else 
		o_out = i_in0;
end*/

assign o_out = (i_rst)? `YSYX210555_ZERO_WORD : 
			   (i_sel)? i_in1 	   : 
						i_in0	   ;

endmodule


 

module ysyx_210555_mux_3to1(
	input i_rst,
	input [1:0] i_sel,
	input [`YSYX210555_REG_BUS] i_in0, i_in1, i_in2,
	
	output [`YSYX210555_REG_BUS] o_out
);
/*
always @(*) begin
	if(i_rst) 
		o_out = `YSYX210555_ZERO_WORD;
	else if(i_sel == 2'b01) 
		o_out = i_in1;
	else if(i_sel == 2'b10) 
		o_out = i_in2;
	else 
		o_out = i_in0;
end*/

assign o_out = (i_rst)? 	`YSYX210555_ZERO_WORD : 
			   (i_sel == 2'b01)? i_in1 : 
			   (i_sel == 2'b10)? i_in2 :
								 i_in0 ;

endmodule


 

module ysyx_210555_mux_4to1(
	input i_rst,
	input [2:0] i_sel,
	input [`YSYX210555_REG_BUS] i_in0, i_in1, i_in2, i_in3,
	
	output [`YSYX210555_REG_BUS] o_out
);
/*
always @(*) begin
	if(i_rst) 
		o_out = `YSYX210555_ZERO_WORD;
	else if(i_sel == 2'b01) 
		o_out = i_in1;
	else if(i_sel == 2'b10) 
		o_out = i_in2;
	else 
		o_out = i_in0;
end*/

assign o_out = (i_rst)? 	 `YSYX210555_ZERO_WORD : 
			   (i_sel == 3'b001)? i_in1 : 
			   (i_sel == 3'b010)? i_in2 :
			   (i_sel == 3'b100)? i_in3 :
								  i_in0 ;

endmodule


