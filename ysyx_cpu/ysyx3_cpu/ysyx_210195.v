
/* verilator lint_off WIDTH */
/* verilator lint_off UNDRIVEN */
`define	YSYX210195_PC_INST_ADDR_LEN	64
`define	YSYX210195_PC_MEM_ADDR_LEN	64
`define	YSYX210195_PC_INST_LEN		32
`define	YSYX210195_PC_REG_DATA_LEN	64
`define YSYX210195_PC_PC_START   64'h00000000_30000000
`define	YSYX210195_PC_INST_NOP	32'h0000_0013

`define	YSYX210195_PC_REQ_WRITE	1'b1
`define	YSYX210195_PC_REQ_READ	1'b0

`define YSYX210195_PC_SIZE_B		2'b00
`define	YSYX210195_PC_SIZE_H		2'b01
`define	YSYX210195_PC_SIZE_W		2'b10
`define	YSYX210195_PC_SIZE_D		2'b11

`define YSYX210195_PC_AXI_ADDR_WIDTH      64
`define YSYX210195_PC_AXI_DATA_WIDTH      64
`define YSYX210195_PC_AXI_ID_WIDTH        4
`define YSYX210195_PC_AXI_USER_WIDTH      1

//`include "defines.v"
//----------------------------------------------------------------
//Module Name : cpu_top.v
//Description of module:
// cpu + clint
//----------------------------------------------------------------
//Designer:	Tang Pengyu
//Date: 2021/10/07	  
//----------------------------------------------------------------

module ysyx_210195(
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

//wire	aw_user_o;		//自定义
//wire	[2:0]	aw_prot_o;				//access permissions
//wire	aw_lock_o;
//wire	[3:0]	aw_cache_o;			//memory types
//wire	[3:0]	aw_qos_o;			//Quality of service identifier for a write transaction
//wire	[3:0]	aw_region_o;		//多接口时用

//wire	w_user_o;
wire	b_user_i = 0;
//wire	[2:0]	ar_prot_o;
//wire	ar_user_o;
//wire	ar_lock_o;
//wire	[3:0]	ar_cache_o;
//wire	[3:0]	ar_qos_o;
//wire	[3:0]	ar_region_o;
wire	r_user_i = 0;

//wire	load_clint_en;
wire	clint_w_ena;
wire	[63:0]	load_store_addr;
wire	[63:0]	store_clint_data;
wire	load_clint_en_exe;
wire	[63:0]	load_clint_addr_exe;
	
wire	time_overstep;
wire	[63:0]	load_clint_data_exe;
//wire	[`YSYX210195_PC_REG_DATA_LEN-1:0] load_clint_data;
//wire 	[31:0]	aw_addr_h;
//wire 	[31:0]	ar_addr_h;

ysyx_210195_cpu	CPU	
(
	.clock(clock),
    .reset(reset),

//to slave
	//MASTER write addr
	.aw_ready_i(io_master_awready),			//slave -> master,ready to receive write address
	.aw_valid_o(io_master_awvalid),			//master -> slave,write address valid
	.aw_addr_o(io_master_awaddr),		//write sddress
	.aw_id_o(io_master_awid),			//write address channel ID
//	.aw_user_o(aw_user_o),		//自定义
//	.aw_prot_o(aw_prot_o),				//access permissions
	.aw_len_o(io_master_awlen),			//burst lenth = aw_len + 1
	.aw_size_o(io_master_awsize),			//本次burst中，一次transferde的字节数
	.aw_burst_o(io_master_awburst),			//burst_type
//	.aw_lock_o(aw_lock_o),
//	.aw_cache_o(aw_cache_o),			//memory types
//	.aw_qos_o(aw_qos_o),			//Quality of service identifier for a write transaction
//	.aw_region_o(aw_region_o),		//多接口时用
	
	//master write data
	.w_ready_i(io_master_wready),
	.w_valid_o(io_master_wvalid),
	.w_data_o(io_master_wdata),
	.w_strb_o(io_master_wstrb),				//标志有效位
	.w_last_o(io_master_wlast),						//标志最后一次传输
//	.w_user_o(w_user_o),
	
	//write response
	.b_ready_o(io_master_bready),
	.b_valid_i(io_master_bvalid),
	.b_resp_i(io_master_bresp),
	.b_id_i(io_master_bid),
	.b_user_i(b_user_i),
	
	//read address channel
	.ar_ready_i(io_master_arready),
	.ar_valid_o(io_master_arvalid),
	.ar_addr_o(io_master_araddr),
//	.ar_prot_o(ar_prot_o),
	.ar_id_o(io_master_arid),			//read address channel identifier
//	.ar_user_o(ar_user_o),
	.ar_len_o(io_master_arlen),
	.ar_size_o(io_master_arsize),
	.ar_burst_o(io_master_arburst),
//	.ar_lock_o(ar_lock_o),
//	.ar_cache_o(ar_cache_o),
//	.ar_qos_o(ar_qos_o),
//	.ar_region_o(ar_region_o),
	
	//read data channel
	.r_ready_o(io_master_rready),
	.r_valid_i(io_master_rvalid),
	.r_resp_i(io_master_rresp),
	.r_data_i(io_master_rdata),
	.r_last_i(io_master_rlast),
	.r_id_i(io_master_rid),
	.r_user_i(r_user_i),
	
	
	//clint
//	.load_clint_en(load_clint_en),
	.clint_w_ena(clint_w_ena),
	.load_store_addr(load_store_addr),
	.store_clint_data(store_clint_data),
	.load_clint_en_exe(load_clint_en_exe),
	.load_clint_addr_exe(load_clint_addr_exe),
	
	.time_overstep(time_overstep),
	.load_clint_data_exe(load_clint_data_exe)
//	.load_clint_data(load_clint_data)

);

ysyx_210195_clint_reg	CLINT_REG(
	.clk(clock),
	.rst(reset),
//	.load_clint_en(load_clint_en),
	.clint_w_ena(clint_w_ena),
	.load_store_addr(load_store_addr),
	.store_clint_data(store_clint_data),
	.load_clint_en_exe(load_clint_en_exe),
	.load_clint_addr_exe(load_clint_addr_exe),
	
//	.load_clint_data(load_clint_data),
	.load_clint_data_exe(load_clint_data_exe),
	.time_overstep(time_overstep)
	
	
);

endmodule

//`include "defines.v"

//----------------------------------------------------------------
//Module Name : adven_ctrl.v
//Description of module:
// 
//----------------------------------------------------------------
//Designer:	Tang Pengyu
//Date: 2021/09/29/16:28	  
//----------------------------------------------------------------
module ysyx_210195_adven_ctrl(
	input	id_load_axi_en,
	input	exe_load_axi_en,
	input	pc_sel,
	input	time_intr_r,
	
	output	ifid_ena,
	output	ifid_rst,
//	output	exmem_ena,
	output	idex_rst,
	output	exmem_rst,
	output	memwb_rst,
	output	if_addr_ctrl

);

assign	if_addr_ctrl = (id_load_axi_en | exe_load_axi_en) ? 1'b0 : 1'b1;
assign	ifid_rst = (id_load_axi_en | exe_load_axi_en | time_intr_r) ? 1'b1 : 
					(pc_sel ? 1'b1 : 1'b0);
assign	idex_rst = time_intr_r ? 1'b1 : 1'b0;
assign	exmem_rst = time_intr_r ? 1'b1 : 1'b0;
assign	memwb_rst = time_intr_r ? 1'b1 : 1'b0;
assign	ifid_ena = 1'b1;

endmodule

//`include "defines.v"
//----------------------------------------------------------------
//Module Name : axi_interconnect.v
//Description of module:
// connect the masters and slaves
//----------------------------------------------------------------
//Designer:	Tang Pengyu
//Date: 2021/09/14 
//----------------------------------------------------------------

module ysyx_210195_axi_interconnect # (
//		parameter	RW_DATA_WIDTH = 64,
//		parameter	RW_ADDR_WIDTH = 64,
		parameter	YSYX210195_PC_AXI_DATA_WIDTH = 64,
		parameter	YSYX210195_PC_AXI_ADDR_WIDTH = 64,
		parameter	YSYX210195_PC_AXI_ID_WIDTH = 4,
		parameter	YSYX210195_PC_AXI_USER_WIDTH = 1
)(
//from 	master0:	instruction fetched	
		//master0 write addr
		input	clock,
		input	reset,
		
		output reg	aw_ready_0,
		input	aw_valid_0,
		input	[YSYX210195_PC_AXI_ADDR_WIDTH-1:0] aw_addr_0,
		input	[YSYX210195_PC_AXI_ID_WIDTH-1:0]	aw_id_0,			//write address channel ID
//		input	[YSYX210195_PC_AXI_USER_WIDTH-1:0] aw_user_0,		//自定义
//		input	[2:0]	aw_prot_0,				//access permissions
		input	[7:0]	aw_len_0,			//burst lenth = aw_len + 1
		input	[2:0]	aw_size_0,			//本次burst中，一次transferde的字节数
		input	[1:0]	aw_burst_0,			//burst_type
//		input			aw_lock_0,
//		input	[3:0]	aw_cache_0,			//memory types
//		input	[3:0]	aw_qos_0,			//Quality of service identifier for a write transaction
//		input	[3:0]	aw_region_0,		//多接口时用
		
		//master0 write data
		output reg	w_ready_0,
		input	w_valid_0,
		input	[YSYX210195_PC_AXI_DATA_WIDTH-1:0]	w_data_0,
		input	[7:0]	w_strb_0,				//标志有效位
		input	w_last_0,						//标志最后一次传输
//		input	[YSYX210195_PC_AXI_USER_WIDTH-1:0]	w_user_0,
		
		//write response master0
		input	b_ready_0,
		output reg	b_valid_0,
		output reg	[1:0]	b_resp_0,
		output reg	[YSYX210195_PC_AXI_ID_WIDTH-1:0]	b_id_0,
		output reg	[YSYX210195_PC_AXI_USER_WIDTH-1:0]	b_user_0,
		
		//read address channel master0
		output reg	ar_ready_0,
		input	ar_valid_0,
		input	[YSYX210195_PC_AXI_ADDR_WIDTH-1:0]	ar_addr_0,
//		input	[2:0]	ar_prot_0,
		input	[YSYX210195_PC_AXI_ID_WIDTH-1:0]	ar_id_0,			//read address channel identifier
//		input	[YSYX210195_PC_AXI_USER_WIDTH-1:0]	ar_user_0,
		input	[7:0]	ar_len_0,
		input	[2:0]	ar_size_0,
		input	[1:0]	ar_burst_0,
//		input			ar_lock_0,
//		input	[3:0]	ar_cache_0,
//		input	[3:0]	ar_qos_0,
//		input	[3:0]	ar_region_0,
		
		//read data channel master0
		input	r_ready_0,
		output reg	r_valid_0,
		output reg	[1:0]	r_resp_0,
		output reg	[YSYX210195_PC_AXI_DATA_WIDTH-1:0]	r_data_0,
		output reg	r_last_0,
		output reg	[YSYX210195_PC_AXI_ID_WIDTH-1:0]	r_id_0,
		output reg	[YSYX210195_PC_AXI_USER_WIDTH-1:0]	r_user_0,

//from master1: read/write data		
		//master1 write addr
		output reg	aw_ready_1,
		input	aw_valid_1,
		input	[YSYX210195_PC_AXI_ADDR_WIDTH-1:0] aw_addr_1,
		input	[YSYX210195_PC_AXI_ID_WIDTH-1:0]	aw_id_1,			//write address channel ID
//		input	[YSYX210195_PC_AXI_USER_WIDTH-1:0] aw_user_1,		//自定义
//		input	[2:0]	aw_prot_1,				//access permissions
		input	[7:0]	aw_len_1,			//burst lenth = aw_len + 1
		input	[2:0]	aw_size_1,			//本次burst中，一次transferde的字节数
		input	[1:0]	aw_burst_1,			//burst_type
//		input			aw_lock_1,
//		input	[3:0]	aw_cache_1,			//memory types
//		input	[3:0]	aw_qos_1,			//Quality of service identifier for a write transaction
//		input	[3:0]	aw_region_1,		//多接口时用
		
		//master1 write data
		output reg	w_ready_1,
		input	w_valid_1,
		input	[YSYX210195_PC_AXI_DATA_WIDTH-1:0]	w_data_1,
		input	[7:0]	w_strb_1,				//标志有效位
		input	w_last_1,						//标志最后一次传输
//		input	[YSYX210195_PC_AXI_USER_WIDTH-1:0]	w_user_1,
		
		//write response master1
		input	b_ready_1,
		output reg	b_valid_1,
		output reg	[1:0]	b_resp_1,
		output reg	[YSYX210195_PC_AXI_ID_WIDTH-1:0]	b_id_1,
		output reg	[YSYX210195_PC_AXI_USER_WIDTH-1:0]	b_user_1,
		
		//read address channel master1
		output reg	ar_ready_1,
		input	ar_valid_1,
		input	[YSYX210195_PC_AXI_ADDR_WIDTH-1:0]	ar_addr_1,
//		input	[2:0]	ar_prot_1,
		input	[YSYX210195_PC_AXI_ID_WIDTH-1:0]	ar_id_1,			//read address channel identifier
//		input	[YSYX210195_PC_AXI_USER_WIDTH-1:0]	ar_user_1,
		input	[7:0]	ar_len_1,
		input	[2:0]	ar_size_1,
		input	[1:0]	ar_burst_1,
//		input			ar_lock_1,
//		input	[3:0]	ar_cache_1,
//		input	[3:0]	ar_qos_1,
//		input	[3:0]	ar_region_1,
		
		//read data channel master1
		input	r_ready_1,
		output reg	r_valid_1,
		output reg	[1:0]	r_resp_1,
		output reg	[YSYX210195_PC_AXI_DATA_WIDTH-1:0]	r_data_1,
		output reg	r_last_1,
		output reg	[YSYX210195_PC_AXI_ID_WIDTH-1:0]	r_id_1,
		output reg	[YSYX210195_PC_AXI_USER_WIDTH-1:0]	r_user_1,		


//to slave
		//MASTER write addr
		input	aw_ready_i,			//slave -> master,ready to receive write address
		output	reg aw_valid_o,			//master -> slave,write address valid
		output	reg [YSYX210195_PC_AXI_ADDR_WIDTH-1:0] aw_addr_o,		//write sddress
		output	reg [YSYX210195_PC_AXI_ID_WIDTH-1:0]	aw_id_o,			//write address channel ID
//		output	reg [YSYX210195_PC_AXI_USER_WIDTH-1:0] aw_user_o,		//自定义
//		output	reg [2:0]	aw_prot_o,				//access permissions
		output	reg [7:0]	aw_len_o,			//burst lenth = aw_len + 1
		output	reg [2:0]	aw_size_o,			//本次burst中，一次transferde的字节数
		output	reg [1:0]	aw_burst_o,			//burst_type
//		output	reg		aw_lock_o,
//		output	reg [3:0]	aw_cache_o,			//memory types
//		output	reg [3:0]	aw_qos_o,			//Quality of service identifier for a write transaction
//		output	reg [3:0]	aw_region_o,		//多接口时用
		
		//master write data
		input	w_ready_i,
		output	reg w_valid_o,
		output	reg [YSYX210195_PC_AXI_DATA_WIDTH-1:0]	w_data_o,
		output	reg [7:0]	w_strb_o,				//标志有效位
		output	reg w_last_o,						//标志最后一次传输
//		output	reg [YSYX210195_PC_AXI_USER_WIDTH-1:0]	w_user_o,
		
		//write response
		output	reg b_ready_o,
		input	b_valid_i,
		input	[1:0]	b_resp_i,
		input	[YSYX210195_PC_AXI_ID_WIDTH-1:0]	b_id_i,
		input	[YSYX210195_PC_AXI_USER_WIDTH-1:0]	b_user_i,
		
		//read address channel
		input	ar_ready_i,
		output	reg ar_valid_o,
		output	reg [YSYX210195_PC_AXI_ADDR_WIDTH-1:0]	ar_addr_o,
//		output	reg [2:0]	ar_prot_o,
		output	reg [YSYX210195_PC_AXI_ID_WIDTH-1:0]	ar_id_o,			//read address channel identifier
//		output	reg [YSYX210195_PC_AXI_USER_WIDTH-1:0]	ar_user_o,
		output	reg [7:0]	ar_len_o,
		output	reg [2:0]	ar_size_o,
		output	reg [1:0]	ar_burst_o,
//		output	reg		ar_lock_o,
//		output	reg [3:0]	ar_cache_o,
//		output	reg [3:0]	ar_qos_o,
//		output	reg [3:0]	ar_region_o,
		
		//read data channel
		output	reg r_ready_o,
		input	r_valid_i,
		input	[1:0]	r_resp_i,
		input	[YSYX210195_PC_AXI_DATA_WIDTH-1:0]	r_data_i,
		input	r_last_i,
		input	[YSYX210195_PC_AXI_ID_WIDTH-1:0]	r_id_i,
		input	[YSYX210195_PC_AXI_USER_WIDTH-1:0]	r_user_i

);

reg		master_valid_0;
reg		master_valid_1;

wire	[1:0]	valid1_valid0;
assign	valid1_valid0 = {master_valid_1,master_valid_0};

reg		r_ready_0_r;
reg		r_ready_1_r;

//将r_ready_o延迟一拍
always @(posedge clock)	begin
	if(reset)	begin
		r_ready_0_r <= 1'b0;
		r_ready_1_r <= 1'b0;
	end
	else	begin
		r_ready_0_r <= r_ready_0;
		r_ready_1_r <= r_ready_1;
	end
end

wire	valid_begin_0;			//posedge work
assign	valid_begin_0 = ar_valid_0 | aw_valid_0;
wire	valid_begin_1;
assign	valid_begin_1 = ar_valid_1 | aw_valid_1;

wire	valid_end_0;			//negedge work
assign	valid_end_0 = !(r_ready_0_r | b_ready_0);
wire	valid_end_1;
assign	valid_end_1 = !(r_ready_1_r | b_ready_1);

reg		valid_begin_0_r;
reg		valid_end_0_r;
reg		valid_begin_1_r;
reg		valid_end_1_r;
always @(posedge clock)	begin
	if(reset)	begin
		valid_begin_0_r <= 1'b0;
		valid_end_0_r <= 1'b0;
		valid_begin_1_r <= 1'b0;
		valid_end_1_r <= 1'b0;
	end
	else	begin
		valid_begin_0_r <= valid_begin_0;
		valid_end_0_r <= valid_end_0;
		valid_begin_1_r <= valid_begin_1;
		valid_end_1_r <= valid_end_1;
	
	end
end
wire	valid_begin_0_en;
wire	valid_end_0_en;
wire	valid_begin_1_en;
wire	valid_end_1_en;
assign	valid_begin_0_en = valid_begin_0 & (~valid_begin_0_r);
assign	valid_end_0_en = valid_end_0 & (~valid_end_0_r);
assign	valid_begin_1_en = valid_begin_1 & (~valid_begin_1_r);
assign	valid_end_1_en = valid_end_1 & (~valid_end_1_r);

//always @(posedge valid_begin_0 or posedge valid_end_0)	begin
always @(posedge clock)	begin
	if(reset)
		master_valid_0 <= 1'b0;
	else if(valid_begin_0_en)
		master_valid_0 <= 1'b1;
	else if(valid_end_0_en)
		master_valid_0 <= 1'b0;
end

//always @(posedge valid_begin_1 or posedge valid_end_1)	begin
always @(posedge clock)	begin
	if(reset)
		master_valid_1 <= 1'b0;
	if(valid_begin_1_en)
		master_valid_1 <= 1'b1;
	else if(valid_end_1_en)
		master_valid_1 <= 1'b0;
end

//固定优先级
always @(*)	begin
	case(valid1_valid0)
		2'b10,2'b11:	begin			//ls_valid,all valid
			//to slave
			aw_valid_o = aw_valid_1;
			aw_addr_o = aw_addr_1;
			aw_id_o = aw_id_1;
//			aw_user_o = aw_user_1;
//			aw_prot_o = aw_prot_1;
			aw_len_o = aw_len_1;
			aw_size_o = aw_size_1;
			aw_burst_o = aw_burst_1;
//			aw_lock_o = aw_lock_1;
//			aw_cache_o = aw_cache_1;
//			aw_qos_o = aw_qos_1;
//			aw_region_o = aw_region_1;
			
			w_valid_o = w_valid_1;
			w_data_o = w_data_1;
			w_strb_o = w_strb_1;
			w_last_o = w_last_1;
//			w_user_o = w_user_1;
			
			b_ready_o = b_ready_1;
			
			ar_valid_o = ar_valid_1;
			ar_addr_o = ar_addr_1;
//			ar_prot_o = ar_prot_1;
			ar_id_o = ar_id_1;
//			ar_user_o = ar_user_1;
			ar_len_o = ar_len_1;
			ar_size_o = ar_size_1;
			ar_burst_o = ar_burst_1;
//			ar_lock_o = ar_lock_1;
//			ar_cache_o = ar_cache_1;
//			ar_qos_o = ar_qos_1;
//			ar_region_o = ar_region_1;
			
			r_ready_o = r_ready_1;
			
			//to master0
			aw_ready_0 = 1'b0;
			
			w_ready_0 = 1'b0;
			
			b_valid_0 = 1'b0;
			b_resp_0 = 2'b00;
			b_id_0 = {YSYX210195_PC_AXI_ID_WIDTH{1'b0}};
			b_user_0 = {YSYX210195_PC_AXI_USER_WIDTH{1'b0}};
			
			ar_ready_0 = 1'b0;
			
			r_valid_0 = 1'b0;
			r_resp_0 = 2'b00;
			r_data_0 = {YSYX210195_PC_AXI_DATA_WIDTH{1'b0}};
			r_last_0 = 1'b0;
			r_id_0 = {YSYX210195_PC_AXI_ID_WIDTH{1'b0}};
			r_user_0 = {YSYX210195_PC_AXI_USER_WIDTH{1'b0}};
			
			//to master1
			aw_ready_1 = aw_ready_i;
			
			w_ready_1 = w_ready_i;
			
			b_valid_1 = b_valid_i;
			b_resp_1 = b_resp_i;
			b_id_1 = b_id_i;
			b_user_1 = b_user_i;
			
			ar_ready_1 = ar_ready_i;
			
			r_valid_1 = r_valid_i;
			r_resp_1 = r_resp_i;
			r_data_1 = r_data_i;
			r_last_1 = r_last_i;
			r_id_1 = r_id_i;
			r_user_1 = r_user_i;
			
		end
			
		2'b01:		begin					//if valid
		//to slave
			aw_valid_o = aw_valid_0;
			aw_addr_o = aw_addr_0;
			aw_id_o = aw_id_0;
//			aw_user_o = aw_user_0;
//			aw_prot_o = aw_prot_0;
			aw_len_o = aw_len_0;
			aw_size_o = aw_size_0;
			aw_burst_o = aw_burst_0;
//			aw_lock_o = aw_lock_0;
//			aw_cache_o = aw_cache_0;
//			aw_qos_o = aw_qos_0;
//			aw_region_o = aw_region_0;
			
			w_valid_o = w_valid_0;
			w_data_o = w_data_0;
			w_strb_o = w_strb_0;
			w_last_o = w_last_0;
//			w_user_o = w_user_0;
			
			b_ready_o = b_ready_0;
			
			ar_valid_o = ar_valid_0;
			ar_addr_o = ar_addr_0;
//			ar_prot_o = ar_prot_0;
			ar_id_o = ar_id_0;
//			ar_user_o = ar_user_0;
			ar_len_o = ar_len_0;
			ar_size_o = ar_size_0;
			ar_burst_o = ar_burst_0;
//			ar_lock_o = ar_lock_0;
//			ar_cache_o = ar_cache_0;
//			ar_qos_o = ar_qos_0;
//			ar_region_o = ar_region_0;
			
			r_ready_o = r_ready_0;
			
		//to master0
			aw_ready_0 = aw_ready_i;
			
			w_ready_0 = w_ready_i;
			
			b_valid_0 = b_valid_i;
			b_resp_0 = b_resp_i;
			b_id_0 = b_id_i;
			b_user_0 = b_user_i;
			
			ar_ready_0 = ar_ready_i;
			
			r_valid_0 = r_valid_i;
			r_resp_0 = r_resp_i;
			r_data_0 = r_data_i;
			r_last_0 = r_last_i;
			r_id_0 = r_id_i;
			r_user_0 = r_user_i;
			
		//to master1
			aw_ready_1 = 1'b0;
			
			w_ready_1 = 1'b0;
			
			b_valid_1 = 1'b0;
			b_resp_1 = 2'b00;
			b_id_1 = {YSYX210195_PC_AXI_ID_WIDTH{1'b0}};
			b_user_1 = {YSYX210195_PC_AXI_USER_WIDTH{1'b0}};
			
			ar_ready_1 = 1'b0;
			
			r_valid_1 = 1'b0;
			r_resp_1 = 2'b00;
			r_data_1 = {YSYX210195_PC_AXI_DATA_WIDTH{1'b0}};
			r_last_1 = 1'b0;
			r_id_1 = {YSYX210195_PC_AXI_ID_WIDTH{1'b0}};
			r_user_1 = {YSYX210195_PC_AXI_USER_WIDTH{1'b0}};
			
		end
		2'b00:		begin
		//to slave
			aw_valid_o = 1'b0;
			aw_addr_o = {YSYX210195_PC_AXI_ADDR_WIDTH{1'b1}};
			aw_id_o = {YSYX210195_PC_AXI_ID_WIDTH{1'b1}};
//			aw_user_o = {YSYX210195_PC_AXI_USER_WIDTH{1'b1}};
//			aw_prot_o = 3'b000;
			aw_len_o = 8'h00;
			aw_size_o = 3'b000;
			aw_burst_o = 2'b01;
//			aw_lock_o = 1'b0;
//			aw_cache_o = 4'h0;
//			aw_qos_o = 4'h0;
//			aw_region_o = 4'h0;
			
			w_valid_o = 1'b0;
			w_data_o = {YSYX210195_PC_AXI_DATA_WIDTH{1'b0}};
			w_strb_o = 8'h00;
			w_last_o = 1'b0;
//			w_user_o = {YSYX210195_PC_AXI_USER_WIDTH{1'b0}};
			
			b_ready_o = 1'b0;
			
			ar_valid_o = 1'b0;
			ar_addr_o = {YSYX210195_PC_AXI_ADDR_WIDTH{1'b0}};
//			ar_prot_o = 3'b000;
			ar_id_o = {YSYX210195_PC_AXI_ID_WIDTH{1'b0}};
//			ar_user_o = {YSYX210195_PC_AXI_USER_WIDTH{1'b0}};
			ar_len_o = 8'h00;
			ar_size_o = 3'b000;
			ar_burst_o = 2'b00;
//			ar_lock_o = 1'b0;
//			ar_cache_o = 4'h0;
//			ar_qos_o = 4'h0;
//			ar_region_o = 4'h0;
			
			r_ready_o = 1'b0;
			
			
			//to master0
			aw_ready_0 = 1'b0;
			
			w_ready_0 = 1'b0;
			
			b_valid_0 = 1'b0;
			b_resp_0 = 2'b00;
			b_id_0 = {YSYX210195_PC_AXI_ID_WIDTH{1'b0}};
			b_user_0 = {YSYX210195_PC_AXI_USER_WIDTH{1'b0}};
			
			ar_ready_0 = 1'b0;
			
			r_valid_0 = 1'b0;
			r_resp_0 = 2'b00;
			r_data_0 = {YSYX210195_PC_AXI_DATA_WIDTH{1'b0}};
			r_last_0 = 1'b0;
			r_id_0 = {YSYX210195_PC_AXI_ID_WIDTH{1'b0}};
			r_user_0 = {YSYX210195_PC_AXI_USER_WIDTH{1'b0}};
			
		//to master1
			aw_ready_1 = 1'b0;
			
			w_ready_1 = 1'b0;
			
			b_valid_1 = 1'b0;
			b_resp_1 = 2'b00;
			b_id_1 = {YSYX210195_PC_AXI_ID_WIDTH{1'b0}};
			b_user_1 = {YSYX210195_PC_AXI_USER_WIDTH{1'b0}};
			
			ar_ready_1 = 1'b0;
			
			r_valid_1 = 1'b0;
			r_resp_1 = 2'b00;
			r_data_1 = {YSYX210195_PC_AXI_DATA_WIDTH{1'b0}};
			r_last_1 = 1'b0;
			r_id_1 = {YSYX210195_PC_AXI_ID_WIDTH{1'b0}};
			r_user_1 = {YSYX210195_PC_AXI_USER_WIDTH{1'b0}};
			
		end	
		
		






	endcase
end

endmodule


//`include "defines.v"
//----------------------------------------------------------------
//Module Name : axi_rw.v
//Description of module:
// use axi4 to read or write data from ram/rom
//----------------------------------------------------------------
//Designer:	Tang Pengyu
//Date: 2021/09/08  
//----------------------------------------------------------------

// Burst types
`define YSYX210195_PC_AXI_BURST_TYPE_FIXED                                2'b00
`define YSYX210195_PC_AXI_BURST_TYPE_INCR                                 2'b01
`define YSYX210195_PC_AXI_BURST_TYPE_WRAP                                 2'b10
// Access permissions  for prot
`define YSYX210195_PC_AXI_PROT_UNPRIVILEGED_ACCESS                        3'b000
`define YSYX210195_PC_AXI_PROT_PRIVILEGED_ACCESS                          3'b001
`define YSYX210195_PC_AXI_PROT_SECURE_ACCESS                              3'b000
`define YSYX210195_PC_AXI_PROT_NON_SECURE_ACCESS                          3'b010
`define YSYX210195_PC_AXI_PROT_DATA_ACCESS                                3'b000
`define YSYX210195_PC_AXI_PROT_INSTRUCTION_ACCESS                         3'b100
// Memory types (AR)
`define YSYX210195_PC_AXI_ARCACHE_DEVICE_NON_BUFFERABLE                   4'b0000
`define YSYX210195_PC_AXI_ARCACHE_DEVICE_BUFFERABLE                       4'b0001
`define YSYX210195_PC_AXI_ARCACHE_NORMAL_NON_CACHEABLE_NON_BUFFERABLE     4'b0010
`define YSYX210195_PC_AXI_ARCACHE_NORMAL_NON_CACHEABLE_BUFFERABLE         4'b0011
`define YSYX210195_PC_AXI_ARCACHE_WRITE_THROUGH_NO_ALLOCATE               4'b1010
`define YSYX210195_PC_AXI_ARCACHE_WRITE_THROUGH_READ_ALLOCATE             4'b1110
`define YSYX210195_PC_AXI_ARCACHE_WRITE_THROUGH_WRITE_ALLOCATE            4'b1010
`define YSYX210195_PC_AXI_ARCACHE_WRITE_THROUGH_READ_AND_WRITE_ALLOCATE   4'b1110
`define YSYX210195_PC_AXI_ARCACHE_WRITE_BACK_NO_ALLOCATE                  4'b1011
`define YSYX210195_PC_AXI_ARCACHE_WRITE_BACK_READ_ALLOCATE                4'b1111
`define YSYX210195_PC_AXI_ARCACHE_WRITE_BACK_WRITE_ALLOCATE               4'b1011
`define YSYX210195_PC_AXI_ARCACHE_WRITE_BACK_READ_AND_WRITE_ALLOCATE      4'b1111
// Memory types (AW)
`define YSYX210195_PC_AXI_AWCACHE_DEVICE_NON_BUFFERABLE                   4'b0000
`define YSYX210195_PC_AXI_AWCACHE_DEVICE_BUFFERABLE                       4'b0001
`define YSYX210195_PC_AXI_AWCACHE_NORMAL_NON_CACHEABLE_NON_BUFFERABLE     4'b0010
`define YSYX210195_PC_AXI_AWCACHE_NORMAL_NON_CACHEABLE_BUFFERABLE         4'b0011
`define YSYX210195_PC_AXI_AWCACHE_WRITE_THROUGH_NO_ALLOCATE               4'b0110
`define YSYX210195_PC_AXI_AWCACHE_WRITE_THROUGH_READ_ALLOCATE             4'b0110
`define YSYX210195_PC_AXI_AWCACHE_WRITE_THROUGH_WRITE_ALLOCATE            4'b1110
`define YSYX210195_PC_AXI_AWCACHE_WRITE_THROUGH_READ_AND_WRITE_ALLOCATE   4'b1110
`define YSYX210195_PC_AXI_AWCACHE_WRITE_BACK_NO_ALLOCATE                  4'b0111
`define YSYX210195_PC_AXI_AWCACHE_WRITE_BACK_READ_ALLOCATE                4'b0111
`define YSYX210195_PC_AXI_AWCACHE_WRITE_BACK_WRITE_ALLOCATE               4'b1111
`define YSYX210195_PC_AXI_AWCACHE_WRITE_BACK_READ_AND_WRITE_ALLOCATE      4'b1111

`define YSYX210195_PC_AXI_YSYX210195_PC_SIZE_BYTES_1                                    3'b000
`define YSYX210195_PC_AXI_YSYX210195_PC_SIZE_BYTES_2                                    3'b001
`define YSYX210195_PC_AXI_YSYX210195_PC_SIZE_BYTES_4                                    3'b010
`define YSYX210195_PC_AXI_YSYX210195_PC_SIZE_BYTES_8                                    3'b011
`define YSYX210195_PC_AXI_YSYX210195_PC_SIZE_BYTES_16                                   3'b100
`define YSYX210195_PC_AXI_YSYX210195_PC_SIZE_BYTES_32                                   3'b101
`define YSYX210195_PC_AXI_YSYX210195_PC_SIZE_BYTES_64                                   3'b110
`define YSYX210195_PC_AXI_YSYX210195_PC_SIZE_BYTES_128                                  3'b111









module	ysyx_210195_axi_rw(
		//global
		input	clock,
		input	reset,
		
		//user	input/output
		input	rw_valid_i,
		output	rw_ready_o,
		input	rw_req_i,				//require read/write
		output	reg	[63:0] data_read_o,
		input	[63:0] data_write_i,
		input	[63:0] rw_addr_i,
		input	[1:0]	rw_size_i,			//传输的字节数
		output	[1:0]	rw_resp_o,
		
		//MASTER write addr
		input	aw_ready_i,			//slave -> master,ready to receive write address
		output	aw_valid_o,			//master -> slave,write address valid
		output	[63:0] aw_addr_o,		//write sddress
		output	[3:0]	aw_id_o,			//write address channel ID
//		output	aw_user_o,		//自定义
//		output	[2:0]	aw_prot_o,				//access permissions
		output	[7:0]	aw_len_o,			//burst lenth = aw_len + 1
		output	[2:0]	aw_size_o,			//本次burst中，一次transferde的字节数
		output	[1:0]	aw_burst_o,			//burst_type
//		output			aw_lock_o,
//		output	[3:0]	aw_cache_o,			//memory types
//		output	[3:0]	aw_qos_o,			//Quality of service identifier for a write transaction
//		output	[3:0]	aw_region_o,		//多接口时用

		//master write data
		input	w_ready_i,
		output	w_valid_o,
		output	reg [63:0]	w_data_o,
		output	reg [7:0]	w_strb_o,				//标志有效位
		output	w_last_o,						//标志最后一次传输
//		output	w_user_o,
		
		//write response
		output	b_ready_o,
		input	b_valid_i,
		input	[1:0]	b_resp_i,
		input	[3:0]	b_id_i,
		input	b_user_i,

		//read address channel
		input	ar_ready_i,
		output	ar_valid_o,
		output	[63:0]	ar_addr_o,
//		output	[2:0]	ar_prot_o,
		output	[3:0]	ar_id_o,			//read address channel identifier
//		output	ar_user_o,
		output	[7:0]	ar_len_o,
		output	[2:0]	ar_size_o,
		output	[1:0]	ar_burst_o,
//		output			ar_lock_o,
//		output	[3:0]	ar_cache_o,
//		output	[3:0]	ar_qos_o,
//		output	[3:0]	ar_region_o,		

		//read data channel
		output	r_ready_o,
		input	r_valid_i,
		input	[1:0]	r_resp_i,
		input	[63:0]	r_data_i,
		input	r_last_i,
		input	[3:0]	r_id_i,
		input	r_user_i

);

	wire	w_trans;
	wire	r_trans;
	assign	w_trans = (rw_req_i == `YSYX210195_PC_REQ_WRITE);
	assign	r_trans = (rw_req_i == `YSYX210195_PC_REQ_READ);
//write or read en
	wire	w_valid;
	wire	r_valid;
	assign	w_valid = rw_valid_i & w_trans;
	assign	r_valid = rw_valid_i & r_trans;
//handshake signal
	wire	aw_hs = aw_valid_o & aw_ready_i;
	wire	w_hs = w_valid_o & w_ready_i;
	wire	b_hs = b_valid_i & b_ready_o;
	
	wire	ar_hs = ar_valid_o & ar_ready_i;
	wire	r_hs = r_valid_i & r_ready_o;
	
	wire	w_done = w_hs & w_last_o;
	wire	r_done = r_hs & r_last_i;
	wire	trans_done = w_trans ? b_hs : r_done;
	
	
//write machine
	parameter	[1:0]	W_STATE_IDLE = 2'b00,
						W_STATE_ADDR = 2'b01,
						W_STATE_WRITE = 2'b10,
						W_STATE_RESP = 2'b11;
	reg	[1:0]	w_state;
	reg	[1:0]	w_state_next;
	reg		rw_ready;
	always @(posedge clock)	begin
		if(reset)
			w_state <= W_STATE_IDLE;
		else
			w_state <= (w_valid & rw_ready == 1'b0) ? w_state_next : w_state;	
	
	end
	
	always @(*)	begin
		case(w_state)
			W_STATE_IDLE:	w_state_next = W_STATE_ADDR;
			W_STATE_ADDR:	w_state_next = aw_hs ? W_STATE_WRITE : W_STATE_ADDR;
			W_STATE_WRITE:	w_state_next = w_done ? W_STATE_RESP : W_STATE_WRITE;
			W_STATE_RESP:	w_state_next = b_hs ? W_STATE_IDLE : W_STATE_RESP;
			default:		w_state_next = W_STATE_IDLE;
		endcase
		
	end
	
	
//read state machine
	parameter	[1:0]	R_STATE_IDLE = 2'b00,
						R_STATE_ADDR = 2'b01,
						R_STATE_READ = 2'b10;
	reg	[1:0]	r_state;
	reg	[1:0]	r_state_next;
	
	always @(posedge clock)	begin
		if(reset)
			r_state <= R_STATE_IDLE;
		else
			r_state <= (r_valid & rw_ready == 1'b0) ? r_state_next : r_state;
	
	end
	always @(*)	begin
		case(r_state)
			R_STATE_IDLE:	r_state_next = R_STATE_ADDR;
			R_STATE_ADDR:	r_state_next = ar_hs ? R_STATE_READ : R_STATE_ADDR;
			R_STATE_READ:	r_state_next = r_done ? R_STATE_IDLE : R_STATE_READ;
			default:		r_state_next = R_STATE_IDLE;
		endcase
	
	end
	wire	bits32_sel;
	assign	bits32_sel = (rw_addr_i < 64'h0000_0000_8000_0000) ? 1'b1 : 1'b0;	
//	assign	bits32_sel = 1'b0;





	
//process data
	wire	aligned;		//对齐传输1'b1
	assign	aligned = bits32_sel ? (rw_addr_i[1:0] == 2'b00) : (rw_addr_i[2:0] == 3'b000);
	wire	YSYX210195_PC_SIZE_B;
	wire	YSYX210195_PC_SIZE_H;
	wire	YSYX210195_PC_SIZE_W;
	wire	YSYX210195_PC_SIZE_D;
	assign	YSYX210195_PC_SIZE_B = (rw_size_i == `YSYX210195_PC_SIZE_B);
	assign	YSYX210195_PC_SIZE_H = (rw_size_i == `YSYX210195_PC_SIZE_H);
	assign	YSYX210195_PC_SIZE_W = (rw_size_i == `YSYX210195_PC_SIZE_W);
	assign	YSYX210195_PC_SIZE_D = (rw_size_i == `YSYX210195_PC_SIZE_D);
	wire	[3:0]	addr_op1;				//取起始后几位地址
	wire	[3:0]	addr_op2;				//地址增量
	wire	[3:0]	addr_end;				//结束地址后四位
	assign	addr_op1 = bits32_sel ? {2'b00,rw_addr_i[1:0]} : {1'b0,rw_addr_i[2:0]};
	assign	addr_op2 = ({4{YSYX210195_PC_SIZE_B}} & {4'b0000})		
					| ({4{YSYX210195_PC_SIZE_H}} & {4'b0001})
					| ({4{YSYX210195_PC_SIZE_W}} & {4'b0011})
					| ({4{YSYX210195_PC_SIZE_D}} & {4'b0111});
	assign	addr_end = addr_op1 + addr_op2;
	wire	overstep;
	assign	overstep = ~(bits32_sel ? (addr_end[3:2] == 2'b00) : (addr_end[3] == 1'b0));
	wire	[2:0]	axi_size;
	wire	[7:0]	axi_len;
	assign	axi_size = bits32_sel ? 3'b010 : 3'b011;
	assign	axi_len = {7'd0,overstep};
	
	wire	[63:0]	axi_addr;
	assign	axi_addr = bits32_sel ? {rw_addr_i[63:2],2'b00} : {rw_addr_i[63:3],3'b000};
	
	wire	[3:0]	axi_id = 3'b000;
//	wire	axi_user = 1'b0;
//标志有效位	
	reg 	[63:0]	mask_l;
	reg 	[63:0]	mask_h;
	wire	[7:0]	aligned_offset_l;		//第一个相对于对齐地址的偏移，向右偏
	wire	[7:0]	aligned_offset_h;		//第二个相对于对其地址的偏移，向左偏
	assign	aligned_offset_l = bits32_sel ? ({6'd0,rw_addr_i[1:0]} << 3) :
											({5'd0,rw_addr_i[2:0]} << 3);
	assign	aligned_offset_h = bits32_sel ? (32 - aligned_offset_l) : 
											(64 - aligned_offset_l);
	always @(*)	begin
		case(bits32_sel)
			1'b0:	begin		//64bit
				case(rw_addr_i[2:0])
					3'b000:	begin
						mask_l = YSYX210195_PC_SIZE_B ? 64'h0000_0000_0000_00ff : 
								YSYX210195_PC_SIZE_H ? 64'h0000_0000_0000_ffff :
								YSYX210195_PC_SIZE_W ? 64'h0000_0000_ffff_ffff :
								YSYX210195_PC_SIZE_D ? 64'hffff_ffff_ffff_ffff : 64'd0;
						mask_h = 64'd0;
					end
					3'b001:	begin
						mask_l = YSYX210195_PC_SIZE_B ? 64'h0000_0000_0000_ff00 :
								YSYX210195_PC_SIZE_H ? 64'h0000_0000_00ff_ff00 :
								YSYX210195_PC_SIZE_W ? 64'h0000_00ff_ffff_ff00 :
								YSYX210195_PC_SIZE_D ? 64'hffff_ffff_ffff_ff00 : 64'd0;
						mask_h = YSYX210195_PC_SIZE_D ? 64'h0000_0000_0000_00ff : 64'd0;
					
					end
					3'b010:	begin
						mask_l = YSYX210195_PC_SIZE_B ? 64'h0000_0000_00ff_0000 : 
								YSYX210195_PC_SIZE_H ? 64'h0000_0000_ffff_0000 : 
								YSYX210195_PC_SIZE_W ? 64'h0000_ffff_ffff_0000 :
								YSYX210195_PC_SIZE_D ? 64'hffff_ffff_ffff_0000 : 64'd0;
						mask_h = YSYX210195_PC_SIZE_D ? 64'h0000_0000_0000_ffff : 64'd0;
					
					end
					3'b011:	begin
						mask_l = YSYX210195_PC_SIZE_B ? 64'h0000_0000_ff00_0000 :
								YSYX210195_PC_SIZE_H ? 64'h0000_00ff_ff00_0000 :
								YSYX210195_PC_SIZE_W ? 64'h00ff_ffff_ff00_0000 :
								YSYX210195_PC_SIZE_D ? 64'hffff_ffff_ff00_0000 : 64'd0;
						mask_h = YSYX210195_PC_SIZE_D ? 64'h0000_0000_00ff_ffff : 64'd0;					
					end
					3'b100:	begin
						mask_l = YSYX210195_PC_SIZE_B ? 64'h0000_00ff_0000_0000 :
								YSYX210195_PC_SIZE_H ? 64'h0000_ffff_0000_0000 :
								YSYX210195_PC_SIZE_W ? 64'hffff_ffff_0000_0000 : 
								YSYX210195_PC_SIZE_D ? 64'hffff_ffff_0000_0000 : 64'd0;
						mask_h = YSYX210195_PC_SIZE_D ? 64'h0000_0000_ffff_ffff : 64'd0;
					end
					3'b101:	begin
						mask_l = YSYX210195_PC_SIZE_B ? 64'h0000_ff00_0000_0000 :
								YSYX210195_PC_SIZE_H ? 64'h00ff_ff00_0000_0000 :
								YSYX210195_PC_SIZE_W ? 64'hffff_ff00_0000_0000 :
								YSYX210195_PC_SIZE_D ? 64'hffff_ff00_0000_0000 : 64'd0;
						mask_h = YSYX210195_PC_SIZE_W ? 64'h0000_0000_0000_00ff :
								YSYX210195_PC_SIZE_D ? 64'h0000_00ff_ffff_ffff : 64'd0;					
					end
					3'b110:	begin
						mask_l = YSYX210195_PC_SIZE_B ? 64'h00ff_0000_0000_0000 :
								YSYX210195_PC_SIZE_H ? 64'hffff_0000_0000_0000 :
								YSYX210195_PC_SIZE_W ? 64'hffff_0000_0000_0000 :
								YSYX210195_PC_SIZE_D ? 64'hffff_0000_0000_0000 : 64'd0;
						mask_h = YSYX210195_PC_SIZE_W ? 64'h0000_0000_0000_ffff :
								YSYX210195_PC_SIZE_D ? 64'h0000_ffff_ffff_ffff : 64'd0;
					
					end
					3'b111:	begin
						mask_l = YSYX210195_PC_SIZE_B ? 64'hff00_0000_0000_0000 :
								YSYX210195_PC_SIZE_H ? 64'hff00_0000_0000_0000 :
								YSYX210195_PC_SIZE_W ? 64'hff00_0000_0000_0000 :
								YSYX210195_PC_SIZE_D ? 64'hff00_0000_0000_0000 : 64'd0;
						mask_h = YSYX210195_PC_SIZE_H ? 64'h0000_0000_0000_00ff :
								YSYX210195_PC_SIZE_W ? 64'h0000_0000_00ff_ffff :
								YSYX210195_PC_SIZE_D ? 64'h00ff_ffff_ffff_ffff : 64'd0;
					end
				endcase
			end
			1'b1:	begin		//32bit
				case(rw_addr_i[1:0])
					2'b00:	begin
						mask_l = YSYX210195_PC_SIZE_B ? 64'h0000_0000_0000_00ff :
								YSYX210195_PC_SIZE_H ? 64'h0000_0000_0000_ffff :
								YSYX210195_PC_SIZE_W ? 64'h0000_0000_ffff_ffff : 64'd0;
						mask_h = 64'd0;
					end
					2'b01:	begin
						mask_l = YSYX210195_PC_SIZE_B ? 64'h0000_0000_0000_ff00 :
								YSYX210195_PC_SIZE_H ? 64'h0000_0000_00ff_ff00 :
								YSYX210195_PC_SIZE_W ? 64'h0000_0000_ffff_ff00 : 64'd0;
						mask_h = YSYX210195_PC_SIZE_W ? 64'h0000_0000_0000_00ff : 64'd0;
					
					end
					2'b10:	begin
						mask_l = YSYX210195_PC_SIZE_B ? 64'h0000_0000_00ff_0000 :
								YSYX210195_PC_SIZE_H ? 64'h0000_0000_ffff_0000 :
								YSYX210195_PC_SIZE_W ? 64'h0000_0000_ffff_0000 : 64'd0;
						mask_h = YSYX210195_PC_SIZE_W ? 64'h0000_0000_0000_ffff : 64'd0;
					end
					2'b11:	begin
						mask_l = YSYX210195_PC_SIZE_B ? 64'h0000_0000_ff00_0000 :
								YSYX210195_PC_SIZE_H ? 64'h0000_0000_ff00_0000 :
								YSYX210195_PC_SIZE_W ? 64'h0000_0000_ff00_0000 : 64'd0;
						mask_h = YSYX210195_PC_SIZE_H ? 64'h0000_0000_0000_00ff :	
								YSYX210195_PC_SIZE_W ? 64'h0000_0000_00ff_ffff : 64'd0;
					end
					
				endcase
			end
		endcase
	
	end
	
	reg	[7:0]	len;
	wire	len_reset = reset | (w_trans & (w_state == W_STATE_IDLE)) | (r_trans & (r_state == R_STATE_IDLE));
	wire	len_incr_en = (len != axi_len) & (w_hs | r_hs);	
	always @(posedge clock)
	  begin
		if(len_reset)
			len <= 8'h00;
		else if(len_incr_en)
			len <= len + 1'b1;	  
	  end
	
	wire	uart_addr;
	assign	uart_addr = (rw_addr_i > 64'h0000_0000_0fff_ffff) && (rw_addr_i < 64'h0000_0000_1000_1000);
	  
//write address channel signal
	assign	aw_valid_o = (w_state == W_STATE_ADDR);
	assign	aw_addr_o = uart_addr ? rw_addr_i : axi_addr;
	assign	aw_id_o = axi_id;
//	assign	aw_user_o = axi_user;
//	assign	aw_prot_o = `YSYX210195_PC_AXI_PROT_UNPRIVILEGED_ACCESS | `YSYX210195_PC_AXI_PROT_SECURE_ACCESS | `YSYX210195_PC_AXI_PROT_DATA_ACCESS;
	assign	aw_len_o = axi_len;
	assign	aw_size_o = axi_size;
	assign	aw_burst_o = `YSYX210195_PC_AXI_BURST_TYPE_INCR;
//	assign	aw_lock_o = 1'b0;
//	assign	aw_cache_o = `YSYX210195_PC_AXI_ARCACHE_NORMAL_NON_CACHEABLE_NON_BUFFERABLE;
//	assign	aw_qos_o = 4'h0;
	
	
//write data channel
	assign	w_valid_o = (w_state == W_STATE_WRITE);
	wire	[63:0]	axi_w_data_l;
	wire	[63:0]	axi_w_data_h;
	assign	w_last_o = w_hs & (len == axi_len);
	assign	axi_w_data_l = data_write_i << aligned_offset_l;
	assign	axi_w_data_h = data_write_i >> aligned_offset_h;
	wire	[63:0]	w_data_nuart;
	assign	w_data_nuart = (len[0] == 1'b0) ? axi_w_data_l : axi_w_data_h;
	wire	[7:0]	w_strb_nuart;
	assign	w_strb_nuart = (len[0] == 1'b0) ? {mask_l[56],mask_l[48],mask_l[40],mask_l[32],mask_l[24],mask_l[16],mask_l[8],mask_l[0]}
												: {mask_h[56],mask_h[48],mask_h[40],mask_h[32],mask_h[24],mask_h[16],mask_h[8],mask_h[0]};
//	wire	[7:0]	w_strb_uart;
//	assign	w_strb_uart = ({8{YSYX210195_PC_SIZE_B}} & {8'b0000_0001})		
//					| ({8{YSYX210195_PC_SIZE_H}} & {8'b0000_0011})
//					| ({8{YSYX210195_PC_SIZE_W}} & {8'b0000_1111})
//					| ({8{YSYX210195_PC_SIZE_D}} & {8'b1111_1111});

		always @(negedge clock) begin
			if(reset)	begin
				w_data_o <= 64'd0;
				w_strb_o <= 8'h00;
			end
			else if(w_ready_i & w_valid_o)	begin
				if(~aligned & overstep)	begin
					w_data_o <= w_data_nuart;
					w_strb_o <= w_strb_nuart;
				end
				else if(axi_len == 8'h00)	begin
					w_data_o <= axi_w_data_l;
					w_strb_o <= {mask_l[56],mask_l[48],mask_l[40],mask_l[32],mask_l[24],mask_l[16],mask_l[8],mask_l[0]};
				
				end
			end
		end


//write response channel
	assign	b_ready_o = (w_state == W_STATE_RESP);
	
//read address channel 
	assign	ar_valid_o = (r_state == R_STATE_ADDR);
	assign	ar_addr_o = uart_addr ? rw_addr_i : axi_addr;
//	assign	ar_prot_o = `YSYX210195_PC_AXI_PROT_UNPRIVILEGED_ACCESS | `YSYX210195_PC_AXI_PROT_SECURE_ACCESS | `YSYX210195_PC_AXI_PROT_DATA_ACCESS;
	assign	ar_id_o = axi_id;
//	assign	ar_user_o = axi_user;
	assign	ar_len_o = axi_len;
	assign	ar_size_o = axi_size;
	assign	ar_burst_o = `YSYX210195_PC_AXI_BURST_TYPE_INCR;
//	assign	ar_lock_o = 1'b0;
//	assign	ar_cache_o = `YSYX210195_PC_AXI_ARCACHE_NORMAL_NON_CACHEABLE_NON_BUFFERABLE;	
	
//read data channel
	assign	r_ready_o = (r_state == R_STATE_READ);
	wire	[63:0]	axi_r_data_l;
	wire	[63:0]	axi_r_data_h;
	assign	axi_r_data_l = (r_data_i & mask_l) >> aligned_offset_l;
	assign	axi_r_data_h  = (r_data_i & mask_h) << aligned_offset_h;
//	wire	[63:0]	data_read_nuart;
//	assign	data_read_nuart = (len[0] == 1'b0) ? axi_r_data_l : 
//													(data_read_o[63:0] | axi_r_data_h);

		always @(posedge clock)	begin
			if(reset)	begin
				data_read_o[63:0] <= 0;
			end
			else if(r_ready_o & r_valid_i)	begin
				if(~aligned & overstep)	begin
					data_read_o <= (len[0] == 1'b0) ? axi_r_data_l : 
													(data_read_o[63:0] | axi_r_data_h);
				end
				else if(axi_len == 8'h00)	begin
					data_read_o <= axi_r_data_l;
				
				end
			end
		end


//rw_ready_o;rw_resp_o

	assign	rw_ready_o = rw_ready;
always @(posedge clock)
  begin
	if(reset)	begin
		rw_ready <= 1'b0;
	end
	else if(trans_done | rw_ready)	begin
		rw_ready <= trans_done;
	end
  end
  
	reg		[1:0]	rw_resp;
	assign	rw_resp_o = rw_resp;
always @(posedge clock)
  begin
	if(reset)	begin
		rw_resp <= 2'b00;
	end
	else if(trans_done)	begin
		rw_resp <= w_trans ? b_resp_i : r_resp_i;
	end
  
  end

endmodule
	



















//`include "defines.v"
//----------------------------------------------------------------
//Module Name : branch_comp.v
//Description of module:
//compare branch 
//----------------------------------------------------------------
//Designer:	Tang Pengyu
//Date: 2021/08/04	  
//----------------------------------------------------------------
module ysyx_210195_branch_comp(
	input	branch_en,							//分支比较使能
	input	[`YSYX210195_PC_REG_DATA_LEN-1:0]	op1,			
	input	[`YSYX210195_PC_REG_DATA_LEN-1:0]	op2,
	output	eq,				//equal
	output	ne,				//not equal
	output	lt,				//less than
	output	ge,				//greater than or equal
	output	ltu,			//无符号，less than
	output	geu				//无符号，greater than or equal
	);
wire [63:0] sub_res;
assign	sub_res = op1 - op2;	
assign	eq = branch_en ? (sub_res == 64'd0) : 1'b0;
assign	ne = branch_en ? (sub_res != 64'd0) : 1'b0;
assign	ltu = branch_en ? ((op1 < op2) ? 1'b1 : 1'b0) : 1'b0;
assign	geu = branch_en ? (((op1 > op2) | (op1 == op2)) ? 1'b1 : 1'b0) : 1'b0;
assign	ge = branch_en ? (sub_res[63] == 1'b0) : 1'b0;
assign	lt = branch_en ? (sub_res[63] == 1'b1) : 1'b0;



/*
always @(*)
begin
  if(branch_en)
  begin
		if((op1[`YSYX210195_PC_REG_DATA_LEN-1] == 1'b1) && (op2[`YSYX210195_PC_REG_DATA_LEN-1] == 1'b0))
			lt = 1'b1;
		else if((op1[`YSYX210195_PC_REG_DATA_LEN-1] == 1'b0) && (op2[`YSYX210195_PC_REG_DATA_LEN-1] == 1'b1))
			lt = 1'b0;
		else if((op1[`YSYX210195_PC_REG_DATA_LEN-1] == 1'b0) && (op2[`YSYX210195_PC_REG_DATA_LEN-1] == 1'b0))
			lt = (op1 < op2) ? 1'b1 : 1'b0;
		else
			lt = (op1 > op2) ? 1'b1 : 1'b0;
  end
  else
	lt = 1'b0;
end
always @(*)
begin
  if(branch_en)
  begin
		if((op1[`YSYX210195_PC_REG_DATA_LEN-1] == 1'b1) && (op2[`YSYX210195_PC_REG_DATA_LEN-1] == 1'b0))
			ge = 1'b0;
		else if((op1[`YSYX210195_PC_REG_DATA_LEN-1] == 1'b0) && (op2[`YSYX210195_PC_REG_DATA_LEN-1] == 1'b1))
			ge = 1'b1;
		else if((op1[`YSYX210195_PC_REG_DATA_LEN-1] == 1'b0) && (op2[`YSYX210195_PC_REG_DATA_LEN-1] == 1'b0))
			ge = ((op1 > op2) | (op1 == op2)) ? 1'b1 : 1'b0;
		else
			ge = ((op1 < op2) | (op1 == op2)) ? 1'b1 : 1'b0;
  end
  else
		ge = 1'b0;
end
*/
endmodule

//`include "defines.v"

//----------------------------------------------------------------
//Module Name : clint_reg.v
//Description of module:
// 
//----------------------------------------------------------------
//Designer:	Tang Pengyu
//Date: 2021/09/22	  
//----------------------------------------------------------------

module ysyx_210195_clint_reg(
	input	clk,
	input	rst,
//	input	load_clint_en,
	input	clint_w_ena,
	input	[63:0]	load_store_addr,
	input	[63:0]	store_clint_data,
	input	load_clint_en_exe,
	input	[63:0]	load_clint_addr_exe,
	
//	output	[63:0]	load_clint_data,
	output	[63:0]	load_clint_data_exe,
	output	time_overstep
	
	
);

reg		[63:0]	mtime;
wire	mtime_sel;
wire	mtime_w_ena;
//wire	mtime_r_ena;
assign	mtime_sel = (load_store_addr == 64'h0000_0000_0200_bff8);
assign	mtime_w_ena = mtime_sel & clint_w_ena;
//assign	mtime_r_ena = mtime_sel & load_clint_en;
always @(posedge clk)	begin
	if(rst)
		mtime <= 64'd0;
	else if(mtime_w_ena)
		mtime <= store_clint_data;
	else	
		mtime <= mtime + 1'b1;

end

reg		[63:0]	mtimecmp;
wire	mtimecmp_sel;
wire	mtimecmp_w_ena;
//wire	mtimecmp_r_ena;
assign	mtimecmp_sel = (load_store_addr == 64'h0000_0000_0200_4000);
assign	mtimecmp_w_ena = mtimecmp_sel & clint_w_ena;
//assign	mtimecmp_r_ena = mtimecmp_sel & load_clint_en;
always @(posedge clk)	begin
	if(rst)
		mtimecmp <= 64'd0;
	else if(mtimecmp_w_ena)
		mtimecmp <= store_clint_data;
//		mtimecmp <= mtimecmp + 64'h0000_0000_000F_F000;

end

//assign	load_clint_data = ({64{mtime_r_ena}} & mtime) | 
//						({64{mtimecmp_r_ena}} & mtimecmp);
						
assign	time_overstep = ((mtime == mtimecmp) | (mtime > mtimecmp)) ? 1'b1 : 1'b0;

wire	mtimecmp_sel_exe;
wire	mtimecmp_r_ena_exe;
assign	mtimecmp_sel_exe = (load_clint_addr_exe == 64'h0000_0000_0200_4000);
assign	mtimecmp_r_ena_exe = mtimecmp_sel_exe & load_clint_en_exe;

wire	mtime_sel_exe;
wire	mtime_r_ena_exe;
assign	mtime_sel_exe = (load_clint_addr_exe == 64'h0000_0000_0200_bff8);
assign	mtime_r_ena_exe = mtime_sel_exe & load_clint_en_exe;
assign	load_clint_data_exe = ({64{mtime_r_ena_exe}} & mtime) | 
						({64{mtimecmp_r_ena_exe}} & mtimecmp);


endmodule

//`include "defines.v"
//----------------------------------------------------------------
//Module Name : cpu.v
//Description of module:
// 
//----------------------------------------------------------------
//Designer:	Tang Pengyu
//Date: 2021/07/22	  
//----------------------------------------------------------------
/* verilator lint_off UNOPTFLAT */
module ysyx_210195_cpu #(
		parameter	YSYX210195_PC_AXI_DATA_WIDTH = 64,
		parameter	YSYX210195_PC_AXI_ADDR_WIDTH = 64,
		parameter	YSYX210195_PC_AXI_ID_WIDTH = 4,
		parameter	YSYX210195_PC_AXI_USER_WIDTH = 1
)
(
	input         clock,
    input         reset,

//to slave
	//MASTER write addr
	input	aw_ready_i,			//slave -> master,ready to receive write address
	output	aw_valid_o,			//master -> slave,write address valid
	output	[31:0] aw_addr_o,		//write sddress
	output  [YSYX210195_PC_AXI_ID_WIDTH-1:0]	aw_id_o,			//write address channel ID
//	output	[YSYX210195_PC_AXI_USER_WIDTH-1:0] aw_user_o,		//自定义
//	output	[2:0]	aw_prot_o,				//access permissions
	output	[7:0]	aw_len_o,			//burst lenth = aw_len + 1
	output	[2:0]	aw_size_o,			//本次burst中，一次transferde的字节数
	output	[1:0]	aw_burst_o,			//burst_type
//	output			aw_lock_o,
//	output	[3:0]	aw_cache_o,			//memory types
//	output	[3:0]	aw_qos_o,			//Quality of service identifier for a write transaction
//	output	[3:0]	aw_region_o,		//多接口时用
	
	//master write data
	input	w_ready_i,
	output	w_valid_o,
	output	[YSYX210195_PC_AXI_DATA_WIDTH-1:0]	w_data_o,
	output	[7:0]	w_strb_o,				//标志有效位
	output	w_last_o,						//标志最后一次传输
//	output	[YSYX210195_PC_AXI_USER_WIDTH-1:0]	w_user_o,
	
	//write response
	output	b_ready_o,
	input	b_valid_i,
	input	[1:0]	b_resp_i,
	input	[YSYX210195_PC_AXI_ID_WIDTH-1:0]	b_id_i,
	input	[YSYX210195_PC_AXI_USER_WIDTH-1:0]	b_user_i,
	
	//read address channel
	input	ar_ready_i,
	output	ar_valid_o,
	output	[31:0]	ar_addr_o,
//	output	[2:0]	ar_prot_o,
	output	[YSYX210195_PC_AXI_ID_WIDTH-1:0]	ar_id_o,			//read address channel identifier
//	output	[YSYX210195_PC_AXI_USER_WIDTH-1:0]	ar_user_o,
	output	[7:0]	ar_len_o,
	output	[2:0]	ar_size_o,
	output	[1:0]	ar_burst_o,
//	output		ar_lock_o,
//	output	[3:0]	ar_cache_o,
//	output	[3:0]	ar_qos_o,
//	output	[3:0]	ar_region_o,
	
	//read data channel
	output	r_ready_o,
	input	r_valid_i,
	input	[1:0]	r_resp_i,
	input	[YSYX210195_PC_AXI_DATA_WIDTH-1:0]	r_data_i,
	input	r_last_i,
	input	[YSYX210195_PC_AXI_ID_WIDTH-1:0]	r_id_i,
	input	[YSYX210195_PC_AXI_USER_WIDTH-1:0]	r_user_i,
	
	
	//clint
//	output	load_clint_en,
	output	clint_w_ena,
	output	[63:0]	load_store_addr,
	output	[63:0]	store_clint_data,
	output	load_clint_en_exe,
	output	[63:0]	load_clint_addr_exe,
	
	input	time_overstep,
	input	[63:0]	load_clint_data_exe
//	input	[`YSYX210195_PC_REG_DATA_LEN-1:0] load_clint_data

);

wire [63:0]	i_if_pc_out;
wire [31:0] i_if_inst;
//wire [`YSYX210195_PC_REG_DATA_LEN-1:0] mem_ld_data;
//wire [`YSYX210195_PC_INST_ADDR_LEN-1:0] pc_out;
//wire i_if_inst_ena;
//wire load_mem_en;
//wire store_mem_en;
//wire [63:0] store_mask;
wire [63:0] i_exe_data;
wire [63:0] i_id_op2;
wire [63:0]	jump_addr;
wire	pc_sel;									//control MODULE output,control the pc choose
//wire	[`YSYX210195_PC_INST_ADDR_LEN-1:0] pc_add;			//result of pc+4
wire	i_if_fetched;
wire	if_valid;
wire	if_ready;
wire	if_req;
wire	[63:0]	inst_data_read;
wire	[63:0]	i_if_addr;
wire	[1:0]	if_size;
wire	[1:0]	if_resp;

wire	[63:0]	mtvec_r;
wire	[63:0]	mepc_r;
//wire	ecall_en;
//wire	mret_en;

wire	if_addr_ctrl;
wire	MTIP;			//csr_reg -> if_stage
wire	time_intr_r;
//wire	handshake_done;
wire	i_ctrlid_ecall_en;
wire	i_ctrlid_mret_en;
ysyx_210195_if_stage	ysyx_210195_IF(
	.clk(clock),
	.rst(reset),							//high work
	.exe_data(jump_addr),	//use when jalr,branch
	
	.ecall_en(i_ctrlid_ecall_en),								
	.mret_en(i_ctrlid_mret_en),
	.mtvec(mtvec_r),
	.mepc(mepc_r),
	
//	.MTIP(MTIP),
	.time_intr_r(time_intr_r),			//中断响应
	
	.if_addr_ctrl(if_addr_ctrl),
	
	.pc_sel(pc_sel),
	.if_addr(i_if_addr),
	.pc_out(i_if_pc_out),		//指令寄存器地址
//	.pc_add(pc_add),
//	.inst_ena(i_if_inst_ena),
	.inst(i_if_inst),

	.if_valid(if_valid),
	.if_ready(if_ready),
	.inst_data_read(inst_data_read),
	.if_size(if_size),
	.if_resp(if_resp),
	.if_req(if_req),
//	.handshake_done(handshake_done),
	
	.fetched(i_if_fetched)	
		);
wire	id_load_axi_en;
wire	exe_load_axi_en;
wire	ifid_ena;
wire	ifid_rst;
wire	idex_rst;
wire	exmem_rst;
wire	memwb_rst;
		
ysyx_210195_adven_ctrl	ysyx_210195_ADVEN(
	.id_load_axi_en(id_load_axi_en),
	.exe_load_axi_en(exe_load_axi_en),
	.pc_sel(pc_sel),
	.time_intr_r(time_intr_r),
	
	.ifid_ena(ifid_ena),
	.ifid_rst(ifid_rst),
//	output	exmem_ena,
//	output	exmem_rst,
	.idex_rst(idex_rst),
	.exmem_rst(exmem_rst),
	.memwb_rst(memwb_rst),
	.if_addr_ctrl(if_addr_ctrl)

);

ysyx_210195_intr_pro	ysyx_210195_INTR(
	.clk(clock),
	.reset(reset),
	.if_fetched(i_if_fetched),
	.if_addr_ctrl(if_addr_ctrl),
	.MTIP(MTIP),
	.time_intr_r(time_intr_r)
);

//wire	o_if_time_intr_r;
//wire	o_if_inst_ena;
wire	[`YSYX210195_PC_INST_LEN-1:0] o_if_inst;
wire	[`YSYX210195_PC_INST_ADDR_LEN-1:0] o_if_pc_out;
//wire	o_if_fetched;
//wire	[`YSYX210195_PC_INST_ADDR_LEN-1:0] o_if_addr;
//wire	ifid_rst_i;
//assign	ifid_rst_i = ifid_rst | reset;
ysyx_210195_IFID_reg	ysyx_210195_IFID(
	.clk(clock),
	.reset(reset),
	.ifid_rst(ifid_rst),
	.handshake_done(i_if_fetched),
	.ifid_ena(ifid_ena),
	
//	.i_if_time_intr_r(i_if_time_intr_r),
//	.i_if_inst_ena(i_if_inst_ena),
	.i_if_inst(i_if_inst),
	.i_if_pc_out(i_if_pc_out),
//	.i_if_fetched(i_if_fetched),
//	.i_if_addr(i_if_addr),
	
//	.o_if_time_intr_r(o_if_time_intr_r),
//	.o_if_inst_ena(o_if_inst_ena),
	.o_if_inst(o_if_inst),
	.o_if_pc_out(o_if_pc_out)
//	.o_if_fetched(o_if_fetched)
//	.o_if_addr(o_if_addr)
	
	);

wire	[`YSYX210195_PC_REG_DATA_LEN-1:0]	rs1_data;				//output data from reg to id_stage	
wire	[`YSYX210195_PC_REG_DATA_LEN-1:0]	rs2_data;	
wire	i_id_rs1_r_ena;					//output of id to reg
wire	i_id_rs2_r_ena;
wire	[4:0]	i_id_rs1_r_addr;
wire	[4:0]	i_id_rs2_r_addr;
wire	i_id_rd_w_ena;
wire	[4:0]	i_id_rd_w_addr;
//wire	[5:0]	i_id_inst_type;
wire	[7:0]	i_id_inst_opcode;
wire	[`YSYX210195_PC_REG_DATA_LEN-1:0]	i_id_op1;		//operation 1
//wire	[`YSYX210195_PC_REG_DATA_LEN-1:0]	op2;
wire	[`YSYX210195_PC_REG_DATA_LEN-1:0] i_id_extend_imm;
wire	[6:0]	i_id_funct7;
wire	i_id_csr_imm_ena;
wire	[`YSYX210195_PC_REG_DATA_LEN-1:0]	i_id_csr_imm;
ysyx_210195_id_stage	ysyx_210195_ID(
	.rst(reset),
	.inst(o_if_inst),					//32 bit inst code
	.rs1_data(rs1_data),			//op1 in rs1////////////////////////////////////////////////////
	.rs2_data(rs2_data),			//op2 in rs2//////////////////////////////////////////////////////
  
  
	.rs1_r_ena(i_id_rs1_r_ena),					//rs1 read enable
	.rs1_r_addr(i_id_rs1_r_addr),			//rs1 read addr
	.rs2_r_ena(i_id_rs2_r_ena),					//rs2 read enable
	.rs2_r_addr(i_id_rs2_r_addr),			//rs2 read addr
	.rd_w_ena(i_id_rd_w_ena),					//rd write enable
	.rd_w_addr(i_id_rd_w_addr),			//rd write addr
	
	.csr_imm_ena(i_id_csr_imm_ena),
	.csr_imm(i_id_csr_imm),
  
//	.inst_type(i_id_inst_type),			//6 inst type--one hot code			
	.inst_opcode(i_id_inst_opcode),		//自定义8位操作码，{func3[2:0],opcode[6:2]}
	.op1(i_id_op1),			//64bit op1 data
	.op2(i_id_op2),				//64bit op2 data
	.extend_imm(i_id_extend_imm),				//立即数符号扩展
	.funct7(i_id_funct7)
);

wire	branch_eq;
wire	branch_ne;
wire	branch_lt;
wire	branch_ge;
wire	branch_ltu;
wire	branch_geu;

//wire	jalr_en;
//wire	jal_en;
wire	branch_en;
wire	[63:0]	conflict_op1;
wire	[63:0]	conflict_op2;
ysyx_210195_branch_comp	ysyx_210195_BRANCH(
	.branch_en(branch_en),							//分支比较使能
	.op1(conflict_op1),			
	.op2(conflict_op2),
	.eq(branch_eq),				//equal
	.ne(branch_ne),				//not equal
	.lt(branch_lt),				//less than
	.ge(branch_ge),				//greater than or equal
	.ltu(branch_ltu),			//无符号，less than
	.geu(branch_geu)				//无符号，greater than or equal
	);
wire	[1:0]	i_ctrlid_wb_sel;

//wire	ifif_fetched;

wire	id_load_mem_en;
		
//wire	id_load_axi_en;
//wire	id_load_clint_en;
//wire	id_store_axi_en;
//wire 	id_store_clint_en;
//wire	id_store_mem_en;
	
ysyx_210195_cpu_ctrl_id	ysyx_210195_CTRL_ID(
//		.clock(clock),
		.inst_opcode(i_id_inst_opcode),
		.branch_eq(branch_eq),
		.branch_ne(branch_ne),
		.branch_lt(branch_lt),
		.branch_ge(branch_ge),
		.branch_ltu(branch_ltu),
		.branch_geu(branch_geu),
//		input	[63:0] ram_addr,
		.time_intr_r(time_intr_r),			//中断响应
//		input	[63:0] load_store_addr,			//exe_data
		
		.funct7(i_id_funct7),
		.inst(o_if_inst),
		
//		input	if_fetched,	

//		.jalr_en(jalr_en),
//		.jal_en(jal_en),		
		.wb_sel(i_ctrlid_wb_sel),
		.pc_sel(pc_sel),
		.branch_en(branch_en),
		.ecall_en(i_ctrlid_ecall_en),
		.mret_en(i_ctrlid_mret_en),
		
		.op1(conflict_op1),
		.op2(conflict_op2),
		.extend_imm(i_id_extend_imm),
//		.if_fetched(i_if_fetched),
		.pc_out(o_if_pc_out),
		.jump_addr(jump_addr),
		.load_mem_en(id_load_mem_en),
		
		.load_axi_en(id_load_axi_en)
//		.load_clint_en(id_load_clint_en),
//		.store_axi_en(id_store_axi_en),
//		.store_clint_en(id_store_clint_en),
//		.store_mem_en(id_store_mem_en)

);
wire	o_id_rd_w_ena;
wire	[4:0]	o_id_rd_w_addr;
wire	[1:0]	o_ctrlid_wb_sel;
wire	[`YSYX210195_PC_INST_ADDR_LEN-1:0] o_ifif_pc_out;
wire	i_ctrlexe_load_clint_en;
wire	i_csrunit_csr_r_ena;
wire	[`YSYX210195_PC_INST_ADDR_LEN-1:0]	o_ififif_pc_out;
wire	o_idid_rd_w_ena;				//--csr_reg,regfile
wire	[4:0]	o_idid_rd_w_addr;		//--csr_reg,regfile
wire	[1:0]	o_ctrlidctrlid_wb_sel;
wire	[`YSYX210195_PC_REG_DATA_LEN-1:0]	o_exe_data;
wire	o_csrunit_csr_r_ena;
wire	[63:0]	o_csrunit_csr_r_data;
wire	o_ctrlexe_load_clint_en;
wire	[63:0]	o_clint_load_data;

wire	[`YSYX210195_PC_INST_ADDR_LEN-1:0]	o_ifififif_pc_out;
wire	o_ididid_rd_w_ena;				//--csr_reg,regfile
wire	[4:0]	o_ididid_rd_w_addr;		//--csr_reg,regfile
wire	[1:0]	o_ctrlidctrlidctrlid_wb_sel;			//regfile
wire	[`YSYX210195_PC_REG_DATA_LEN-1:0]	o_exeexe_data;		//--WB
wire	o_csrunitcsrunit_csr_r_ena;			//wb
wire	[63:0]	o_csrunitcsrunit_csr_r_data;
wire	o_ctrlexectrlexe_load_clint_en;		//regfile
wire	[63:0]	o_lspro_axi_ld_data;
wire	[63:0]	o_clintclint_load_data;
wire	[`YSYX210195_PC_REG_DATA_LEN-1:0]	csr_r_data_unit;
ysyx_210195_data_conf	ysyx_210195_CONFLICT(
//本级
	.i_id_rs1_r_ena(i_id_rs1_r_ena),				//本级rs1_ena源操作数1
	.i_id_rs1_r_addr(i_id_rs1_r_addr),	//本级rs1_addr源操作数1
	.i_id_op1(i_id_op1),
	.i_id_rs2_r_ena(i_id_rs2_r_ena),				//本级rs2_ena源操作数2
	.i_id_rs2_r_addr(i_id_rs2_r_addr),	//本级rs2_addr源操作数2
	.i_id_op2(i_id_op2),
//上一级
	.o_id_rd_w_ena(o_id_rd_w_ena),				//上一级rd_ena
	.o_id_rd_w_addr(o_id_rd_w_addr),		//上一级rd_w_addr
	.i_exe_data(i_exe_data),			//上一级执行结果
	.o_ctrlid_wb_sel(o_ctrlid_wb_sel),	//上一级wb_sel
	.o_ifif_pc_out(o_ifif_pc_out),		//上一级pc_out
	.i_csrunit_csr_r_ena(i_csrunit_csr_r_ena),
	.csr_r_data_unit(csr_r_data_unit),
	.i_ctrlexe_load_clint_en(i_ctrlexe_load_clint_en),
	.load_clint_data_exe(load_clint_data_exe),

//上两级
	.o_idid_rd_w_ena(o_idid_rd_w_ena),			//上两级rd_w_ena
	.o_idid_rd_w_addr(o_idid_rd_w_addr),	//上两级rd_w_addr
	.i_exeexe_data(o_exe_data),		//上两级执行结果
	.o_ctrlidctrlid_wb_sel(o_ctrlidctrlid_wb_sel),	//上两级wb_sel
	.o_ififif_pc_out(o_ififif_pc_out),		//上两级pc_out
	.o_csrunit_csr_r_ena(o_csrunit_csr_r_ena),
	.o_csrunit_csr_r_data(o_csrunit_csr_r_data),
	.o_ctrlexe_load_clint_en(o_ctrlexe_load_clint_en),
	.o_clint_load_data(o_clint_load_data),
	
//上三级
	.o_ididid_rd_w_ena(o_ididid_rd_w_ena),			//上三级rd_w_ena
	.o_ididid_rd_w_addr(o_ididid_rd_w_addr),
	.o_exeexe_data(o_exeexe_data),
	.o_ctrlidctrlidctrlid_wb_sel(o_ctrlidctrlidctrlid_wb_sel),
	.o_ifififif_pc_out(o_ifififif_pc_out),
	.o_lspro_axi_ld_data(o_lspro_axi_ld_data),
	.o_csrunitcsrunit_csr_r_ena(o_csrunitcsrunit_csr_r_ena),
	.o_csrunitcsrunit_csr_r_data(o_csrunitcsrunit_csr_r_data),
	.o_ctrlexectrlexe_load_clint_en(o_ctrlexectrlexe_load_clint_en),
	.o_clintclint_load_data(o_clintclint_load_data),
	
//输出判断后的源操作数
	.conflict_op1(conflict_op1),
	.conflict_op2(conflict_op2)
);

wire	o_id_rs1_r_ena;
wire	[4:0]	o_id_rs1_r_addr;
//wire	o_id_rs2_r_ena;
//wire	[4:0]	o_id_rs2_r_addr;

wire	o_id_csr_imm_ena;
wire	[`YSYX210195_PC_REG_DATA_LEN-1:0]	o_id_csr_imm;
//wire	[5:0]	o_id_inst_type;
wire	[7:0]	o_id_inst_opcode;
wire	[`YSYX210195_PC_REG_DATA_LEN-1:0]	o_id_op1;
wire	[`YSYX210195_PC_REG_DATA_LEN-1:0]	o_id_op2;
wire	[`YSYX210195_PC_REG_DATA_LEN-1:0]	o_id_extend_imm;
wire	[6:0]	o_id_funct7;


wire	o_ctrlid_ecall_en;
wire	o_ctrlid_mret_en;
	
//wire	o_ifif_fetched;
//wire	o_ifif_time_intr_r;

//wire 	[`YSYX210195_PC_INST_ADDR_LEN-1:0] o_ifif_addr;
wire 	o_ctrlid_load_mem_en;
//wire	idex_rst_i;
//assign	idex_rst_i = reset | idex_rst;
ysyx_210195_IDEX_reg	ysyx_210195_IDEX(
	.clk(clock),
	.reset(reset),
	.handshake_done(i_if_fetched),
	.idex_rst(idex_rst),
	.idex_ena(1'b1),
	
	.i_id_rs1_r_ena(i_id_rs1_r_ena),
	.i_id_rs1_r_addr(i_id_rs1_r_addr),
//	.i_id_rs2_r_ena(i_id_rs2_r_ena),
//	.i_id_rs2_r_addr(i_id_rs2_r_addr),
	.i_id_rd_w_ena(i_id_rd_w_ena),
	.i_id_rd_w_addr(i_id_rd_w_addr),
	.i_id_csr_imm_ena(i_id_csr_imm_ena),
	.i_id_csr_imm(i_id_csr_imm),
//	.i_id_inst_type(i_id_inst_type),
	.i_id_inst_opcode(i_id_inst_opcode),
	.i_id_op1(conflict_op1),
	.i_id_op2(conflict_op2),
	.i_id_extend_imm(i_id_extend_imm),
	.i_id_funct7(i_id_funct7),
//from ctrlid	
	.i_ctrlid_wb_sel(i_ctrlid_wb_sel),			//regfile
	.i_ctrlid_ecall_en(i_ctrlid_ecall_en),
	.i_ctrlid_mret_en(i_ctrlid_mret_en),
	.i_ctrlid_load_mem_en(id_load_mem_en),
//from	if	
//	.i_ifif_fetched(o_if_fetched),
//	.i_ifif_time_intr_r(o_if_time_intr_r),
	.i_ifif_pc_out(o_if_pc_out),
//	.i_ifif_addr(o_if_addr),
	
	.o_id_rs1_r_ena(o_id_rs1_r_ena),
	.o_id_rs1_r_addr(o_id_rs1_r_addr),
//	.o_id_rs2_r_ena(o_id_rs2_r_ena),
//	.o_id_rs2_r_addr(o_id_rs2_r_addr),
	.o_id_rd_w_ena(o_id_rd_w_ena),
	.o_id_rd_w_addr(o_id_rd_w_addr),
	.o_id_csr_imm_ena(o_id_csr_imm_ena),
	.o_id_csr_imm(o_id_csr_imm),
//	.o_id_inst_type(o_id_inst_type),
	.o_id_inst_opcode(o_id_inst_opcode),
	.o_id_op1(o_id_op1),
	.o_id_op2(o_id_op2),
	.o_id_extend_imm(o_id_extend_imm),
	.o_id_funct7(o_id_funct7),
	
	.o_ctrlid_wb_sel(o_ctrlid_wb_sel),
	.o_ctrlid_ecall_en(o_ctrlid_ecall_en),
	.o_ctrlid_mret_en(o_ctrlid_mret_en),
	.o_ctrlid_load_mem_en(o_ctrlid_load_mem_en),
	
//	.o_ifif_fetched(o_ifif_fetched),
//	.o_ifif_time_intr_r(o_ifif_time_intr_r),
	.o_ifif_pc_out(o_ifif_pc_out)
//	.o_ifif_addr(o_ifif_addr)
);


/*
wire	branch_eq;
wire	branch_ne;
wire	branch_lt;
wire	branch_ge;
wire	branch_ltu;
wire	branch_geu;

//wire	load_mem_en;
wire	jalr_en;
wire	jal_en;
wire	[1:0] wb_sel;
//wire	store_mem_en;
wire	branch_en;
//wire	mret_en;
wire	load_axi_en;
wire	store_axi_en;
wire	store_clint_en;
cpu_ctrl	CTRL(
		.inst_opcode(inst_opcode),
		.branch_eq(branch_eq),
		.branch_ne(branch_ne),
		.branch_lt(branch_lt),
		.branch_ge(branch_ge),
		.branch_ltu(branch_ltu),
		.branch_geu(branch_geu),
		.ram_addr(exe_data),
		.time_intr_r(time_intr_r),
		.load_store_addr(exe_data),
		
		.funct7(funct7),
		.if_fetched(fetched),
		.load_mem_en(load_mem_en),
		
		.load_axi_en(load_axi_en),
		.load_clint_en(load_clint_en),
		.store_axi_en(store_axi_en),
		.store_clint_en(store_clint_en),		
		
		
		.jalr_en(jalr_en),
		.jal_en(jal_en),
		.wb_sel(wb_sel),
		.pc_sel(pc_sel),
		.store_mem_en(store_mem_en),
		.branch_en(branch_en),
		.store_mask(store_mask),
		.ecall_en(ecall_en),
		.mret_en(mret_en)
//		.pc_from_mepc(pc_from_mepc)
		);
*/
//assign	clint_w_ena = store_clint_en & fetched & (~time_intr_r);
//wire	[5:0] inst_type_o;
//wire	[`YSYX210195_PC_REG_DATA_LEN-1:0] exe_data	

wire	[`YSYX210195_PC_REG_DATA_LEN-1:0]	csr_r_data;	
ysyx_210195_exe_stage	ysyx_210195_EXE(
  .rst(reset),
//  .inst_type_i(o_id_inst_type),
  .inst_opcode(o_id_inst_opcode),
  .op1(o_id_op1),
  .op2(o_id_op2),
  .extend_imm(o_id_extend_imm),
  .funct7(o_id_funct7),
  .pc(o_ifif_pc_out),
  .csr_r_data(csr_r_data),
  
//  .inst_type_o(inst_type_o),
  .exe_data(i_exe_data)
);
//wire	load_mem_en;
//wire	store_mem_en;
wire	i_ctrlexe_load_axi_en;

wire	i_ctrlexe_store_axi_en;
wire	i_ctrlexe_store_clint_en;
ysyx_210195_cpu_ctrl_exe	ysyx_210195_CTRL_EXE(
		.inst_opcode(o_id_inst_opcode),
//		input	branch_eq,
//		input	branch_ne,
//		input	branch_lt,
//		input	branch_ge,
//		input	branch_ltu,
//		input	branch_geu,
//		.ram_addr(i_exe_data),
//		input	time_intr_r,			//中断响应
		.load_store_addr(i_exe_data),			//exe_data
		
//		input	[6:0]	funct7,
		
//		.if_fetched(o_ifif_fetched),	
		
		.load_mem_en(o_ctrlid_load_mem_en),
		
		.load_axi_en(i_ctrlexe_load_axi_en),
		.load_clint_en(i_ctrlexe_load_clint_en),
		.store_axi_en(i_ctrlexe_store_axi_en),
		.store_clint_en(i_ctrlexe_store_clint_en)
//		.store_mem_en(store_mem_en)
//		output	[1:0] wb_sel
//		output	reg [63:0] store_mask
);
assign  exe_load_axi_en = i_ctrlexe_load_axi_en;
wire	[11:0]	i_csrunit_csr_addr;
wire	i_csrunit_csr_w_ena;
wire	[`YSYX210195_PC_REG_DATA_LEN-1:0]	i_csrunit_csr_w_data;




ysyx_210195_csr_unit	ysyx_210195_CSRUNIT(
		.inst_opcode(o_id_inst_opcode),
		.extend_imm(o_id_extend_imm[11:0]),				//其中包含了CSR地址
		.rs1_r_ena(o_id_rs1_r_ena),
		.rs1_r_addr(o_id_rs1_r_addr),
		.op1(o_id_op1),
		.rd_w_ena(o_id_rd_w_ena),
		.rd_w_addr(o_id_rd_w_addr),
		.csr_r_data(csr_r_data_unit),
		.csr_imm_ena(o_id_csr_imm_ena),							//csr立即数使能
		.csr_imm(o_id_csr_imm),						//csr立即数
		
		.csr_addr(i_csrunit_csr_addr),
		.csr_w_ena(i_csrunit_csr_w_ena),
		.csr_w_data(i_csrunit_csr_w_data),
		.csr_r_ena(i_csrunit_csr_r_ena)
		);
		
assign	load_clint_en_exe = i_ctrlexe_load_clint_en;
assign	load_clint_addr_exe = i_exe_data;



//wire	o_ififif_fetched;
//wire	o_ififif_time_intr_r;
//wire	[`YSYX210195_PC_INST_ADDR_LEN-1:0] o_ififif_addr;
	
//wire	o_idid_rs1_r_ena;				//--csr_reg,regfile
//wire	[4:0]	o_idid_rs1_r_addr;	//--csr_reg,regfile
//wire	o_idid_rs2_r_ena;				//--regfile
//wire	[4:0]	o_idid_rs2_r_addr;	//--regfile

wire	[`YSYX210195_PC_REG_DATA_LEN-1:0] o_idid_op2;	
wire	[7:0]	o_idid_inst_opcode;
	

wire	o_ctrlidctrlid_ecall_en;
wire	o_ctrlidctrlid_mret_en;
	

	
wire	[11:0]	o_csrunit_csr_addr;
wire	o_csrunit_csr_w_ena;
wire	[`YSYX210195_PC_REG_DATA_LEN-1:0]	o_csrunit_csr_w_data;

	
wire	o_ctrlexe_load_axi_en;

wire	o_ctrlexe_store_axi_en;
wire	o_ctrlexe_store_clint_en;
//wire	exmem_rst_i;
//assign	exmem_rst_i = exmem_rst | reset;


ysyx_210195_EXMEM_reg	ysyx_210195_EXMEM(
	.clk(clock),
	.reset(reset),
	.handshake_done(i_if_fetched),
	.exmem_rst(exmem_rst),
	.exmem_ena(1'b1),
//from if
	.i_ififif_pc_out(o_ifif_pc_out),		//regfile
//	.i_ififif_fetched(o_ifif_fetched),								//regfile
//	.i_ififif_time_intr_r(o_ifif_time_intr_r),					//wb
//	.i_ififif_addr(o_ifif_addr),
	
//from id
//	.i_idid_rs1_r_ena(o_id_rs1_r_ena),				//--csr_reg,regfile
//	.i_idid_rs1_r_addr(o_id_rs1_r_addr),	//--csr_reg,regfile
//	.i_idid_rs2_r_ena(o_id_rs2_r_ena),				//--regfile
//	.i_idid_rs2_r_addr(o_id_rs2_r_addr),	//--regfile
	.i_idid_rd_w_ena(o_id_rd_w_ena),				//--csr_reg,regfile
	.i_idid_rd_w_addr(o_id_rd_w_addr),		//--csr_reg,regfile
	.i_idid_op2(o_id_op2),	
	.i_idid_inst_opcode(o_id_inst_opcode),
//from	ctrlid
	.i_ctrlidctrlid_wb_sel(o_ctrlid_wb_sel),			//regfile
	.i_ctrlidctrlid_ecall_en(o_ctrlid_ecall_en),					//wb
	.i_ctrlidctrlid_mret_en(o_ctrlid_mret_en),					//wb

//from exe
	.i_exe_data(i_exe_data),		//--WB
//from CSR_UNIT
	.i_csrunit_csr_addr(i_csrunit_csr_addr),		//wb
	.i_csrunit_csr_w_ena(i_csrunit_csr_w_ena),			//wb
	.i_csrunit_csr_w_data(i_csrunit_csr_w_data),		//wb
	.i_csrunit_csr_r_ena(i_csrunit_csr_r_ena),			//wb
	.i_csrunit_csr_r_data(csr_r_data_unit),
//from ctrlexe
	.i_ctrlexe_load_axi_en(i_ctrlexe_load_axi_en),			//regfile
	.i_ctrlexe_load_clint_en(i_ctrlexe_load_clint_en),		//regfile
	.i_ctrlexe_store_axi_en(i_ctrlexe_store_axi_en),		//regfile	
	.i_ctrlexe_store_clint_en(i_ctrlexe_store_clint_en),		//regfile

//	input	i_ctrlexe_wb_sel,				//regfile

	.i_clint_load_data(load_clint_data_exe),
	
	.o_ififif_pc_out(o_ififif_pc_out),
//	.o_ififif_fetched(o_ififif_fetched),
//	.o_ififif_time_intr_r(o_ififif_time_intr_r),
//	.o_ififif_addr(o_ififif_addr),
	
//	.o_idid_rs1_r_ena(o_idid_rs1_r_ena),				//--csr_reg,regfile
//	.o_idid_rs1_r_addr(o_idid_rs1_r_addr),	//--csr_reg,regfile
//	.o_idid_rs2_r_ena(o_idid_rs2_r_ena),				//--regfile
//	.o_idid_rs2_r_addr(o_idid_rs2_r_addr),	//--regfile
	.o_idid_rd_w_ena(o_idid_rd_w_ena),				//--csr_reg,regfile
	.o_idid_rd_w_addr(o_idid_rd_w_addr),		//--csr_reg,regfile
	.o_idid_op2(o_idid_op2),
	.o_idid_inst_opcode(o_idid_inst_opcode),	
	
	.o_ctrlidctrlid_wb_sel(o_ctrlidctrlid_wb_sel),
	.o_ctrlidctrlid_ecall_en(o_ctrlidctrlid_ecall_en),
	.o_ctrlidctrlid_mret_en(o_ctrlidctrlid_mret_en),
	
	.o_exe_data(o_exe_data),
	
	.o_csrunit_csr_addr(o_csrunit_csr_addr),
	.o_csrunit_csr_w_ena(o_csrunit_csr_w_ena),
	.o_csrunit_csr_w_data(o_csrunit_csr_w_data),
	.o_csrunit_csr_r_ena(o_csrunit_csr_r_ena),
	.o_csrunit_csr_r_data(o_csrunit_csr_r_data),
	
	.o_ctrlexe_load_axi_en(o_ctrlexe_load_axi_en),
	.o_ctrlexe_load_clint_en(o_ctrlexe_load_clint_en),
	.o_ctrlexe_store_axi_en(o_ctrlexe_store_axi_en),
	.o_ctrlexe_store_clint_en(o_ctrlexe_store_clint_en),
//	output	reg o_ctrlexe_wb_sel
	.o_clint_load_data(o_clint_load_data)
	
);

wire	ls_ready_i;
wire	[63:0]	load_data_i;
wire	[1:0]	ls_resp;
wire	ls_valid_o;
wire	ls_req_o;
wire	[1:0]	ls_size_o;
wire	[`YSYX210195_PC_REG_DATA_LEN-1:0]	i_lspro_axi_ld_data;		//load_axi_data
//wire	i_lspro_fetched;		//load_fetched
ysyx_210195_ls_pro	ysyx_210195_LSPRO(
//from axi_arbi	
	.clk(clock),
	.reset(reset),
	.ls_ready_i(ls_ready_i),
	.load_data_i(load_data_i),	
	.ls_resp(ls_resp),
	
	.if_hs(i_if_fetched),
	
	.load_axi_en(o_ctrlexe_load_axi_en),
	.store_axi_en(o_ctrlexe_store_axi_en),
	.inst_opcode(o_idid_inst_opcode),
	
//to arbi	
	.ls_valid_o(ls_valid_o),
	.ls_req_o(ls_req_o),
//	output 	[63:0]	ls_addr_o,
//	output	[63:0]	store_data_o,
	.ls_size_o(ls_size_o),
//to reg
	.mem_ld_data(i_lspro_axi_ld_data)			//->reg
//	.load_fetched(i_lspro_fetched)	
	);
	

//wire	o_ifififif_fetched;
//wire	o_ifififif_time_intr_r;
//wire	[`YSYX210195_PC_INST_ADDR_LEN-1:0]	o_ifififif_addr;

//wire	o_ididid_rs1_r_ena;				//--csr_reg,regfile
//wire	[4:0]	o_ididid_rs1_r_addr;	//--csr_reg,regfile
//wire	o_ididid_rs2_r_ena;				//--regfile
//wire	[4:0]	o_ididid_rs2_r_addr;	//--regfile
wire	[`YSYX210195_PC_REG_DATA_LEN-1:0] o_ididid_op2;	
wire	o_ctrlidctrlidctrlid_ecall_en;					//wb
wire	o_ctrlidctrlidctrlid_mret_en;					//wb
	
	
wire	[11:0]	o_csrunitcsrunit_csr_addr;		//wb
wire	o_csrunitcsrunit_csr_w_ena;			//wb
wire	[`YSYX210195_PC_REG_DATA_LEN-1:0]	o_csrunitcsrunit_csr_w_data;		//wb
	
wire	o_ctrlexectrlexe_load_axi_en;			//regfile

wire	o_ctrlexectrlexe_store_clint_en;
//wire	o_lspro_fetched;
//wire	memwb_rst_i;
//assign	memwb_rst_i = memwb_rst | reset;

ysyx_210195_MEMWB_reg	ysyx_210195_MEMWB(
	.clk(clock),
	.reset(reset),
	.handshake_done(i_if_fetched),
	.memwb_rst(memwb_rst),
	.memwb_ena(1'b1),
//from if
	.i_ifififif_pc_out(o_ififif_pc_out),
//	.i_ifififif_fetched(o_ififif_fetched),
//	.i_ifififif_time_intr_r(o_ififif_time_intr_r),
//	.i_ifififif_addr(o_ififif_addr),
	
//from id
//	.i_ididid_rs1_r_ena(o_idid_rs1_r_ena),				//--csr_reg,regfile
//	.i_ididid_rs1_r_addr(o_idid_rs1_r_addr),	//--csr_reg,regfile
//	.i_ididid_rs2_r_ena(o_idid_rs2_r_ena),				//--regfile
//	.i_ididid_rs2_r_addr(o_idid_rs2_r_addr),	//--regfile
	.i_ididid_rd_w_ena(o_idid_rd_w_ena),				//--csr_reg,regfile
	.i_ididid_rd_w_addr(o_idid_rd_w_addr),		//--csr_reg,regfile
	.i_ididid_op2(o_idid_op2),	//rge
//from ctrlid
	.i_ctrlidctrlidctrlid_wb_sel(o_ctrlidctrlid_wb_sel),			//regfile
	.i_ctrlidctrlidctrlid_ecall_en(o_ctrlidctrlid_ecall_en),					//wb
	.i_ctrlidctrlidctrlid_mret_en(o_ctrlidctrlid_mret_en),					//wb
//from exe
	.i_exeexe_data(o_exe_data),		//--WB
//from CSR_UNIT
	.i_csrunitcsrunit_csr_addr(o_csrunit_csr_addr),		//wb
	.i_csrunitcsrunit_csr_w_ena(o_csrunit_csr_w_ena),			//wb
	.i_csrunitcsrunit_csr_w_data(o_csrunit_csr_w_data),		//wb
	.i_csrunitcsrunit_csr_r_ena(o_csrunit_csr_r_ena),			//wb
	.i_csrunitcsrunit_csr_r_data(o_csrunit_csr_r_data),	
//from ctrlexe
	.i_ctrlexectrlexe_load_axi_en(o_ctrlexe_load_axi_en),			//regfile
	.i_ctrlexectrlexe_load_clint_en(o_ctrlexe_load_clint_en),		//regfile
	.i_ctrlexectrlexe_store_clint_en(o_ctrlexe_store_clint_en),

//from	ls_pro
	.i_lspro_axi_ld_data(i_lspro_axi_ld_data),
//	.i_lspro_fetched(i_lspro_fetched),
	
	.i_clintclint_load_data(o_clint_load_data),

	.o_ifififif_pc_out(o_ifififif_pc_out),
//	.o_ifififif_fetched(o_ifififif_fetched),
//	.o_ifififif_time_intr_r(o_ifififif_time_intr_r),
//	.o_ifififif_addr(o_ifififif_addr),

//	.o_ididid_rs1_r_ena(o_ididid_rs1_r_ena),				//--csr_reg,regfile
//	.o_ididid_rs1_r_addr(o_ididid_rs1_r_addr),	//--csr_reg,regfile
//	.o_ididid_rs2_r_ena(o_ididid_rs2_r_ena),				//--regfile
//	.o_ididid_rs2_r_addr(o_ididid_rs2_r_addr),	//--regfile
	.o_ididid_rd_w_ena(o_ididid_rd_w_ena),				//--csr_reg,regfile
	.o_ididid_rd_w_addr(o_ididid_rd_w_addr),		//--csr_reg,regfile
	.o_ididid_op2(o_ididid_op2),	
	
	.o_ctrlidctrlidctrlid_wb_sel(o_ctrlidctrlidctrlid_wb_sel),			//regfile
	.o_ctrlidctrlidctrlid_ecall_en(o_ctrlidctrlidctrlid_ecall_en),					//wb
	.o_ctrlidctrlidctrlid_mret_en(o_ctrlidctrlidctrlid_mret_en),					//wb
	
	.o_exeexe_data(o_exeexe_data),		//--WB
	
	.o_csrunitcsrunit_csr_addr(o_csrunitcsrunit_csr_addr),		//wb
	.o_csrunitcsrunit_csr_w_ena(o_csrunitcsrunit_csr_w_ena),			//wb
	.o_csrunitcsrunit_csr_w_data(o_csrunitcsrunit_csr_w_data),		//wb
	.o_csrunitcsrunit_csr_r_ena(o_csrunitcsrunit_csr_r_ena),			//wb
	.o_csrunitcsrunit_csr_r_data(o_csrunitcsrunit_csr_r_data),
	
	.o_ctrlexectrlexe_load_axi_en(o_ctrlexectrlexe_load_axi_en),			//regfile
	.o_ctrlexectrlexe_load_clint_en(o_ctrlexectrlexe_load_clint_en),		//regfile
	.o_ctrlexectrlexe_store_clint_en(o_ctrlexectrlexe_store_clint_en),
	
	.o_lspro_axi_ld_data(o_lspro_axi_ld_data),
//	.o_lspro_fetched(o_lspro_fetched),
	.o_clintclint_load_data(o_clintclint_load_data)

);

reg		w_ctrl;
always @(posedge clock)	begin
	if(reset)
		w_ctrl <= 1'b0;
	else
		w_ctrl <= i_if_fetched;
end	
wire	ecall_w_en;
assign	ecall_w_en = o_ctrlidctrlidctrlid_ecall_en & (w_ctrl & (~time_intr_r));
wire	mret_w_en;
assign	mret_w_en = o_ctrlidctrlidctrlid_mret_en & (w_ctrl & (~time_intr_r));
wire	csr_write_ena;
assign	csr_write_ena = (w_ctrl & (~time_intr_r)) & o_csrunitcsrunit_csr_w_ena;

//wire	csr_reg_r_ena;
//assign	csr_reg_r_ena = o_csrunitcsrunit_csr_r_ena | i_csrunit_csr_r_ena;
wire	[63:0]	csr_mepc_pc;
assign	csr_mepc_pc = (o_ififif_pc_out != 0) ? o_ififif_pc_out :
						(o_ifif_pc_out != 0) ? o_ifif_pc_out :
						(o_if_pc_out != 0) ? o_if_pc_out : i_if_pc_out;
//o_ctrlidctrlidctrlid_mret_en ? o_ifif_pc_out : o_ififif_pc_out;
ysyx_210195_csr_reg	ysyx_210195_CSRREG(
		.clk(clock),
		.rst(reset),
		//csr_unit -> csr_reg
		.csr_addr(o_csrunitcsrunit_csr_addr),				//csr索引地址
		.csr_w_ena(csr_write_ena),
		.csr_r_ena(o_csrunitcsrunit_csr_r_ena),
		.csr_w_data(o_csrunitcsrunit_csr_w_data),
		
		.csr_r_ena_unit(i_csrunit_csr_r_ena),
		.csr_addr_unit(i_csrunit_csr_addr),
		
		.ecall_w_en(ecall_w_en),
		.mret_w_en(mret_w_en),
		.pc(o_ifififif_pc_out),
		
		.if_addr(csr_mepc_pc),
		
		.time_overstep(time_overstep),
		.time_intr_r(time_intr_r),
		
		.csr_r_data(csr_r_data),
		.csr_r_data_unit(csr_r_data_unit),
		
		.mtvec_o(mtvec_r),
		.mepc_o(mepc_r),
		.MTIP_o(MTIP)
		);

//wire [`YSYX210195_PC_REG_DATA_LEN-1:0] regs [0:31];

wire	w_ena;
/*
assign	w_ena = o_ctrlexectrlexe_load_axi_en ? 
		(o_ididid_rd_w_ena & o_lspro_fetched & (~o_ifififif_time_intr_r)) : 
		(o_ididid_rd_w_ena & i_if_fetched & (~o_ifififif_time_intr_r));
*/
assign	w_ena = o_ididid_rd_w_ena & w_ctrl & (~time_intr_r);
ysyx_210195_regfile	ysyx_210195_REG(
    .clk(clock),
	.rst(reset),
	
	.w_addr(o_ididid_rd_w_addr),
	.exe_data(o_exeexe_data),
	.csr_r_data(o_csrunitcsrunit_csr_r_data),
	.csr_r_ena(o_csrunitcsrunit_csr_r_ena),
//	.mem_ld_data(mem_ld_data),
	.load_axi_data(o_lspro_axi_ld_data),
	.load_clint_data(o_clintclint_load_data),
	.load_axi_en(o_ctrlexectrlexe_load_axi_en),
	.load_clint_en(o_ctrlexectrlexe_load_clint_en),	

	.pc(o_ifififif_pc_out),
	.wb_sel(o_ctrlidctrlidctrlid_wb_sel),			//10:load_mem,01:pc+4,else exe_data
	.w_ena(w_ena),
	
	.r_addr1(i_id_rs1_r_addr),
	.r_data1(rs1_data),
	.r_ena1(i_id_rs1_r_ena),
	
	.r_addr2(i_id_rs2_r_addr),
	.r_data2(rs2_data),
	.r_ena2(i_id_rs2_r_ena)
//	.regs_o(regs)
    );
assign	load_store_addr = o_exeexe_data;
assign	store_clint_data = o_ididid_op2;
assign	clint_w_ena = o_ctrlexectrlexe_store_clint_en & 
						w_ctrl & 
						(~time_intr_r);	
//assign	load_clint_en = o_ctrlexectrlexe_load_clint_en;

	
/*	
axi_arbi	AXI_ARBI(
//if request
	.if_valid_i(if_valid),
	.if_ready_o(if_ready),				//->if_stage
	.if_req_i(if_req),
	.if_data_o(inst_data_read),
	.if_addr_i(if_addr),
	.if_size_i(if_size),
	.if_resp_o(if_resp),

//data request
	.ls_valid_i(ls_valid_o),
	.ls_ready_o(ls_ready_i),
	.ls_req_i(ls_req_o),
	.load_data_o(load_data_i),
	.ls_addr_i(exe_data),			//exe_data
//	input	[1:0]	store_data_i,		//op2
	.ls_size_i(ls_size_o),
	.ls_resp_o(ls_resp),
	
//to axi_rw
	.rw_valid_o(rw_valid_o),
	.rw_ready_i(rw_ready_i),
	.rw_req_o(rw_req_o),
	.data_read_i(data_read_i),
//	output	[63:0]	data_write_o,		//op2
	.rw_addr_o(rw_addr_o),
	.rw_size_o(rw_size_o),
	.rw_resp_i(rw_resp_i)
	);
*/
//assign	data_write_o = op2;
//wire	[63:0]	data_write_0;
//master0 write addr
wire	aw_ready_0;
wire	aw_valid_0;
wire	[YSYX210195_PC_AXI_ADDR_WIDTH-1:0] aw_addr_0;
wire	[YSYX210195_PC_AXI_ID_WIDTH-1:0]	aw_id_0;		//write address channel ID
//wire	[YSYX210195_PC_AXI_USER_WIDTH-1:0] aw_user_0;		//自定义
//wire	[2:0]	aw_prot_0;				//access permissions
wire	[7:0]	aw_len_0;			//burst lenth = aw_len + 1
wire	[2:0]	aw_size_0;			//本次burst中，一次transferde的字节数
wire	[1:0]	aw_burst_0;			//burst_type
//wire			aw_lock_0;
//wire	[3:0]	aw_cache_0;			//memory types
//wire	[3:0]	aw_qos_0;			//Quality of service identifier for a write transaction
//wire	[3:0]	aw_region_0;		//多接口时用
		
		//master0 write data
wire	w_ready_0;
wire	w_valid_0;
wire	[YSYX210195_PC_AXI_DATA_WIDTH-1:0]	w_data_0;
wire	[7:0]	w_strb_0;				//标志有效位
wire	w_last_0;					//标志最后一次传输
//wire	[YSYX210195_PC_AXI_USER_WIDTH-1:0]	w_user_0;
		
		//write response master0
wire	b_ready_0;
wire	b_valid_0;
wire	[1:0]	b_resp_0;
wire	[YSYX210195_PC_AXI_ID_WIDTH-1:0]	b_id_0;
wire	[YSYX210195_PC_AXI_USER_WIDTH-1:0]	b_user_0;
		
		//read address channel master0
wire	ar_ready_0;
wire	ar_valid_0;
wire	[YSYX210195_PC_AXI_ADDR_WIDTH-1:0]	ar_addr_0;
//wire	[2:0]	ar_prot_0;
wire	[YSYX210195_PC_AXI_ID_WIDTH-1:0]	ar_id_0;			//read address channel identifier
//wire	[YSYX210195_PC_AXI_USER_WIDTH-1:0]	ar_user_0;
wire	[7:0]	ar_len_0;
wire	[2:0]	ar_size_0;
wire	[1:0]	ar_burst_0;
//wire			ar_lock_0;
//wire	[3:0]	ar_cache_0;
//wire	[3:0]	ar_qos_0;
//wire	[3:0]	ar_region_0;
		
		//read data channel master0
wire	r_ready_0;
wire	r_valid_0;
wire	[1:0]	r_resp_0;
wire	[YSYX210195_PC_AXI_DATA_WIDTH-1:0]	r_data_0;
wire	r_last_0;
wire	[YSYX210195_PC_AXI_ID_WIDTH-1:0]	r_id_0;
wire	[YSYX210195_PC_AXI_USER_WIDTH-1:0]	r_user_0;
//master 0
ysyx_210195_axi_rw ysyx_210195_AXI0(
		//glabal
		.clock(clock),
		.reset(reset),					//high work
		
		//user input/output
		.rw_valid_i(if_valid),
		.rw_ready_o(if_ready),
		.rw_req_i(if_req),				//require read/write
		.data_read_o(inst_data_read),
		.data_write_i(64'd0),
		.rw_addr_i(i_if_addr),
		.rw_size_i(if_size),			//传输的字节数
		.rw_resp_o(if_resp),
		
		//MASTER write addr
		.aw_ready_i(aw_ready_0),			//slave -> master,ready to receive write address
		.aw_valid_o(aw_valid_0),			//master -> slave,write address valid
		.aw_addr_o(aw_addr_0),		//write sddress
		.aw_id_o(aw_id_0),			//write address channel ID
//		.aw_user_o(aw_user_0),		//自定义
//		.aw_prot_o(aw_prot_0),				//access permissions
		.aw_len_o(aw_len_0),			//burst lenth = aw_len + 1
		.aw_size_o(aw_size_0),			//本次burst中，一次transferde的字节数
		.aw_burst_o(aw_burst_0),			//burst_type
//		.aw_lock_o(aw_lock_0),
//		.aw_cache_o(aw_cache_0),			//memory types
//		.aw_qos_o(aw_qos_0),			//Quality of service identifier for a write transaction
//		.aw_region_o(aw_region_0),		//多接口时用
		
		//master write data
		.w_ready_i(w_ready_0),
		.w_valid_o(w_valid_0),
		.w_data_o(w_data_0),
		.w_strb_o(w_strb_0),				//标志有效位
		.w_last_o(w_last_0),						//标志最后一次传输
//		.w_user_o(w_user_0),
		
		//write response
		.b_ready_o(b_ready_0),
		.b_valid_i(b_valid_0),
		.b_resp_i(b_resp_0),
		.b_id_i(b_id_0),
		.b_user_i(b_user_0),
		
		//read address channel
		.ar_ready_i(ar_ready_0),
		.ar_valid_o(ar_valid_0),
		.ar_addr_o(ar_addr_0),
//		.ar_prot_o(ar_prot_0),
		.ar_id_o(ar_id_0),			//read address channel identifier
//		.ar_user_o(ar_user_0),
		.ar_len_o(ar_len_0),
		.ar_size_o(ar_size_0),
		.ar_burst_o(ar_burst_0),
//		.ar_lock_o(ar_lock_0),
//		.ar_cache_o(ar_cache_0),
//		.ar_qos_o(ar_qos_0),
//		.ar_region_o(ar_region_0),
		
		//read data channel
		.r_ready_o(r_ready_0),
		.r_valid_i(r_valid_0),
		.r_resp_i(r_resp_0),
		.r_data_i(r_data_0),
		.r_last_i(r_last_0),
		.r_id_i(r_id_0),
		.r_user_i(r_user_0)	
		
	);
	
	
//master1 write addr
wire	aw_ready_1;
wire	aw_valid_1;
wire	[YSYX210195_PC_AXI_ADDR_WIDTH-1:0] aw_addr_1;
wire	[YSYX210195_PC_AXI_ID_WIDTH-1:0]	aw_id_1;			//write address channel ID
//wire	[YSYX210195_PC_AXI_USER_WIDTH-1:0] aw_user_1;	//自定义
//wire	[2:0]	aw_prot_1;				//access permissions
wire	[7:0]	aw_len_1;			//burst lenth = aw_len + 1
wire	[2:0]	aw_size_1;			//本次burst中，一次transferde的字节数
wire	[1:0]	aw_burst_1;			//burst_type
//wire			aw_lock_1;
//wire	[3:0]	aw_cache_1;			//memory types
//wire	[3:0]	aw_qos_1;			//Quality of service identifier for a write transaction
//wire	[3:0]	aw_region_1;		//多接口时用
		
		//master1 write data
wire	w_ready_1;
wire	w_valid_1;
wire	[YSYX210195_PC_AXI_DATA_WIDTH-1:0]	w_data_1;
wire	[7:0]	w_strb_1;				//标志有效位
wire	w_last_1;						//标志最后一次传输
//wire	[YSYX210195_PC_AXI_USER_WIDTH-1:0]	w_user_1;
		
		//write response master1
wire	b_ready_1;
wire	b_valid_1;
wire	[1:0]	b_resp_1;
wire	[YSYX210195_PC_AXI_ID_WIDTH-1:0]	b_id_1;
wire	[YSYX210195_PC_AXI_USER_WIDTH-1:0]	b_user_1;
		
		//read address channel master1
wire	ar_ready_1;
wire	ar_valid_1;
wire	[YSYX210195_PC_AXI_ADDR_WIDTH-1:0]	ar_addr_1;
//wire	[2:0]	ar_prot_1;
wire	[YSYX210195_PC_AXI_ID_WIDTH-1:0]	ar_id_1;			//read address channel identifier
//wire	[YSYX210195_PC_AXI_USER_WIDTH-1:0]	ar_user_1;
wire	[7:0]	ar_len_1;
wire	[2:0]	ar_size_1;
wire	[1:0]	ar_burst_1;
//wire			ar_lock_1;
//wire	[3:0]	ar_cache_1;
//wire	[3:0]	ar_qos_1;
//wire	[3:0]	ar_region_1;
		
		//read data channel master1
wire	r_ready_1;
wire	r_valid_1;
wire	[1:0]	r_resp_1;
wire	[YSYX210195_PC_AXI_DATA_WIDTH-1:0]	r_data_1;
wire	r_last_1;
wire	[YSYX210195_PC_AXI_ID_WIDTH-1:0]	r_id_1;
wire	[YSYX210195_PC_AXI_USER_WIDTH-1:0]	r_user_1;

wire	[63:0]	data_write_o;
assign	data_write_o = o_idid_op2;
//master 1
ysyx_210195_axi_rw ysyx_210195_AXI1(
		//glabal
		.clock(clock),
		.reset(reset),					//high work
		
		//user input/output
		.rw_valid_i(ls_valid_o),
		.rw_ready_o(ls_ready_i),
		.rw_req_i(ls_req_o),				//require read/write
		.data_read_o(load_data_i),
		.data_write_i(data_write_o),
		.rw_addr_i(o_exe_data),
		.rw_size_i(ls_size_o),			//传输的字节数
		.rw_resp_o(ls_resp),
		
		//MASTER write addr
		.aw_ready_i(aw_ready_1),			//slave -> master,ready to receive write address
		.aw_valid_o(aw_valid_1),			//master -> slave,write address valid
		.aw_addr_o(aw_addr_1),		//write sddress
		.aw_id_o(aw_id_1),			//write address channel ID
//		.aw_user_o(aw_user_1),		//自定义
//		.aw_prot_o(aw_prot_1),				//access permissions
		.aw_len_o(aw_len_1),			//burst lenth = aw_len + 1
		.aw_size_o(aw_size_1),			//本次burst中，一次transferde的字节数
		.aw_burst_o(aw_burst_1),			//burst_type
//		.aw_lock_o(aw_lock_1),
//		.aw_cache_o(aw_cache_1),			//memory types
//		.aw_qos_o(aw_qos_1),			//Quality of service identifier for a write transaction
//		.aw_region_o(aw_region_1),		//多接口时用
		
		//master write data
		.w_ready_i(w_ready_1),
		.w_valid_o(w_valid_1),
		.w_data_o(w_data_1),
		.w_strb_o(w_strb_1),				//标志有效位
		.w_last_o(w_last_1),						//标志最后一次传输
//		.w_user_o(w_user_1),
		
		//write response
		.b_ready_o(b_ready_1),
		.b_valid_i(b_valid_1),
		.b_resp_i(b_resp_1),
		.b_id_i(b_id_1),
		.b_user_i(b_user_1),
		
		//read address channel
		.ar_ready_i(ar_ready_1),
		.ar_valid_o(ar_valid_1),
		.ar_addr_o(ar_addr_1),
//		.ar_prot_o(ar_prot_1),
		.ar_id_o(ar_id_1),			//read address channel identifier
//		.ar_user_o(ar_user_1),
		.ar_len_o(ar_len_1),
		.ar_size_o(ar_size_1),
		.ar_burst_o(ar_burst_1),
//		.ar_lock_o(ar_lock_1),
//		.ar_cache_o(ar_cache_1),
//		.ar_qos_o(ar_qos_1),
//		.ar_region_o(ar_region_1),
		
		//read data channel
		.r_ready_o(r_ready_1),
		.r_valid_i(r_valid_1),
		.r_resp_i(r_resp_1),
		.r_data_i(r_data_1),
		.r_last_i(r_last_1),
		.r_id_i(r_id_1),
		.r_user_i(r_user_1)	
		
	);
wire	[63:0]	aw_addr_o_64;
assign	aw_addr_o = aw_addr_o_64[31:0];	
wire	[63:0]	ar_addr_o_64;
assign	ar_addr_o = ar_addr_o_64[31:0];
	
ysyx_210195_axi_interconnect ysyx_210195_INTERCONNECT(
//from 	master0:	instruction fetched	
		//master0 write addr
		.clock(clock),
		.reset(reset),
		
		.aw_ready_0(aw_ready_0),
		.aw_valid_0(aw_valid_0),
		.aw_addr_0(aw_addr_0),
		.aw_id_0(aw_id_0),			//write address channel ID
//		.aw_user_0(aw_user_0),		//自定义
//		.aw_prot_0(aw_prot_0),				//access permissions
		.aw_len_0(aw_len_0),			//burst lenth = aw_len + 1
		.aw_size_0(aw_size_0),			//本次burst中，一次transferde的字节数
		.aw_burst_0(aw_burst_0),			//burst_type
//		.aw_lock_0(aw_lock_0),
//		.aw_cache_0(aw_cache_0),			//memory types
//		.aw_qos_0(aw_qos_0),			//Quality of service identifier for a write transaction
//		.aw_region_0(aw_region_0),		//多接口时用
		
		//master0 write data
		.w_ready_0(w_ready_0),
		.w_valid_0(w_valid_0),
		.w_data_0(w_data_0),
		.w_strb_0(w_strb_0),				//标志有效位
		.w_last_0(w_last_0),						//标志最后一次传输
//		.w_user_0(w_user_0),
		
		//write response master0
		.b_ready_0(b_ready_0),
		.b_valid_0(b_valid_0),
		.b_resp_0(b_resp_0),
		.b_id_0(b_id_0),
		.b_user_0(b_user_0),
		
		//read address channel master0
		.ar_ready_0(ar_ready_0),
		.ar_valid_0(ar_valid_0),
		.ar_addr_0(ar_addr_0),
//		.ar_prot_0(ar_prot_0),
		.ar_id_0(ar_id_0),			//read address channel identifier
//		.ar_user_0(ar_user_0),
		.ar_len_0(ar_len_0),
		.ar_size_0(ar_size_0),
		.ar_burst_0(ar_burst_0),
//		.ar_lock_0(ar_lock_0),
//		.ar_cache_0(ar_cache_0),
//		.ar_qos_0(ar_qos_0),
//		.ar_region_0(ar_region_0),
		
		//read data channel master0
		.r_ready_0(r_ready_0),
		.r_valid_0(r_valid_0),
		.r_resp_0(r_resp_0),
		.r_data_0(r_data_0),
		.r_last_0(r_last_0),
		.r_id_0(r_id_0),
		.r_user_0(r_user_0),

//from master1: read/write data		
		//master1 write addr
		.aw_ready_1(aw_ready_1),
		.aw_valid_1(aw_valid_1),
		.aw_addr_1(aw_addr_1),
		.aw_id_1(aw_id_1),			//write address channel ID
//		.aw_user_1(aw_user_1),		//自定义
//		.aw_prot_1(aw_prot_1),				//access permissions
		.aw_len_1(aw_len_1),			//burst lenth = aw_len + 1
		.aw_size_1(aw_size_1),			//本次burst中，一次transferde的字节数
		.aw_burst_1(aw_burst_1),			//burst_type
//		.aw_lock_1(aw_lock_1),
//		.aw_cache_1(aw_cache_1),			//memory types
//		.aw_qos_1(aw_qos_1),			//Quality of service identifier for a write transaction
//		.aw_region_1(aw_region_1),		//多接口时用
		
		//master1 write data
		.w_ready_1(w_ready_1),
		.w_valid_1(w_valid_1),
		.w_data_1(w_data_1),
		.w_strb_1(w_strb_1),				//标志有效位
		.w_last_1(w_last_1),						//标志最后一次传输
//		.w_user_1(w_user_1),
		
		//write response master1
		.b_ready_1(b_ready_1),
		.b_valid_1(b_valid_1),
		.b_resp_1(b_resp_1),
		.b_id_1(b_id_1),
		.b_user_1(b_user_1),
		
		//read address channel master1
		.ar_ready_1(ar_ready_1),
		.ar_valid_1(ar_valid_1),
		.ar_addr_1(ar_addr_1),
//		.ar_prot_1(ar_prot_1),
		.ar_id_1(ar_id_1),			//read address channel identifier
//		.ar_user_1(ar_user_1),
		.ar_len_1(ar_len_1),
		.ar_size_1(ar_size_1),
		.ar_burst_1(ar_burst_1),
//		.ar_lock_1(ar_lock_1),
//		.ar_cache_1(ar_cache_1),
//		.ar_qos_1(ar_qos_1),
//		.ar_region_1(ar_region_1),
		
		//read data channel master1
		.r_ready_1(r_ready_1),
		.r_valid_1(r_valid_1),
		.r_resp_1(r_resp_1),
		.r_data_1(r_data_1),
		.r_last_1(r_last_1),
		.r_id_1(r_id_1),
		.r_user_1(r_user_1),		


//to slave
		//MASTER write addr
		.aw_ready_i(aw_ready_i),			//slave -> master,ready to receive write address
		.aw_valid_o(aw_valid_o),			//master -> slave,write address valid
		.aw_addr_o(aw_addr_o_64),		//write sddress
		.aw_id_o(aw_id_o),			//write address channel ID
//		.aw_user_o(aw_user_o),		//自定义
//		.aw_prot_o(aw_prot_o),				//access permissions
		.aw_len_o(aw_len_o),			//burst lenth = aw_len + 1
		.aw_size_o(aw_size_o),			//本次burst中，一次transferde的字节数
		.aw_burst_o(aw_burst_o),			//burst_type
//		.aw_lock_o(aw_lock_o),
//		.aw_cache_o(aw_cache_o),			//memory types
//		.aw_qos_o(aw_qos_o),			//Quality of service identifier for a write transaction
//		.aw_region_o(aw_region_o),		//多接口时用
		
		//master write data
		.w_ready_i(w_ready_i),
		.w_valid_o(w_valid_o),
		.w_data_o(w_data_o),
		.w_strb_o(w_strb_o),				//标志有效位
		.w_last_o(w_last_o),						//标志最后一次传输
//		.w_user_o(w_user_o),
		
		//write response
		.b_ready_o(b_ready_o),
		.b_valid_i(b_valid_i),
		.b_resp_i(b_resp_i),
		.b_id_i(b_id_i),
		.b_user_i(b_user_i),
		
		//read address channel
		.ar_ready_i(ar_ready_i),
		.ar_valid_o(ar_valid_o),
		.ar_addr_o(ar_addr_o_64),
//		.ar_prot_o(ar_prot_o),
		.ar_id_o(ar_id_o),			//read address channel identifier
//		.ar_user_o(ar_user_o),
		.ar_len_o(ar_len_o),
		.ar_size_o(ar_size_o),
		.ar_burst_o(ar_burst_o),
//		.ar_lock_o(ar_lock_o),
//		.ar_cache_o(ar_cache_o),
//		.ar_qos_o(ar_qos_o),
//		.ar_region_o(ar_region_o),
		
		//read data channel
		.r_ready_o(r_ready_o),
		.r_valid_i(r_valid_i),
		.r_resp_i(r_resp_i),
		.r_data_i(r_data_i),
		.r_last_i(r_last_i),
		.r_id_i(r_id_i),
		.r_user_i(r_user_i)

);	
	



endmodule	
		
		
		
//`include "defines.v"
/* verilator lint_off LATCH */
//----------------------------------------------------------------
//Module Name : cpu_ctrl_id.v
//Description of module:
//control signal genaration 
//----------------------------------------------------------------
//Designer:	Tang Pengyu
//Date: 2021/07/22	  
//----------------------------------------------------------------

module ysyx_210195_cpu_ctrl_exe(
		input	[7:0]	inst_opcode,
//		input	branch_eq,
//		input	branch_ne,
//		input	branch_lt,
//		input	branch_ge,
//		input	branch_ltu,
//		input	branch_geu,
//		input	[63:0] ram_addr,
//		input	time_intr_r,			//中断响应
		input	[63:0] load_store_addr,			//exe_data
		
//		input	[6:0]	funct7,
		
//		input	if_fetched,	
		
		input	load_mem_en,
		
		output	load_axi_en,
		output	load_clint_en,
		output	store_axi_en,
		output	store_clint_en
//		output	store_mem_en
//		output	[1:0] wb_sel
//		output	reg [63:0] store_mask
);

//inst_lb,inst_lbu	,inst_lh,inst_lhu,inst_lw,inst_lwu,inst_ld
wire	store_mem_en;
assign	load_axi_en = load_mem_en & (~load_clint_en);
assign	store_axi_en = store_mem_en & (~store_clint_en);
assign	load_clint_en = load_mem_en & 
			((load_store_addr == 64'h0000_0000_0200_bff8) | (load_store_addr == 64'h0000_0000_0200_4000));
assign	store_clint_en = store_mem_en &
			((load_store_addr == 64'h0000_0000_0200_bff8) | (load_store_addr == 64'h0000_0000_0200_4000));			
//load_clint_en,store_clint_en
/*
wire	clint_lock;
assign	clint_lock = if_fetched;
always @(*)	begin
	if(clint_lock == 1'b1)	begin
		load_clint_en = load_mem_en & 
			((load_store_addr == 64'h0000_0000_0200_bff8) | (load_store_addr == 64'h0000_0000_0200_4000));
		store_clint_en = store_mem_en &
			((load_store_addr == 64'h0000_0000_0200_bff8) | (load_store_addr == 64'h0000_0000_0200_4000));

	end
end
*/	
/*
always @(*)
  begin
	case(inst_opcode)
		8'b000_01000:	store_mask = (ram_addr[2:0] == 3'b000) ? 64'h0000_0000_0000_00ff :
									(ram_addr[2:0] == 3'b001) ? 64'h0000_0000_0000_ff00 :
									(ram_addr[2:0] == 3'b010) ? 64'h0000_0000_00ff_0000 :
									(ram_addr[2:0] == 3'b011) ? 64'h0000_0000_ff00_0000 :
									(ram_addr[2:0] == 3'b100) ? 64'h0000_00ff_0000_0000 :
									(ram_addr[2:0] == 3'b101) ? 64'h0000_ff00_0000_0000 :
									(ram_addr[2:0] == 3'b110) ? 64'h00ff_0000_0000_0000 :
									(ram_addr[2:0] == 3'b111) ? 64'hff00_0000_0000_0000 : 64'd0;			//sb
		8'b001_01000:	store_mask = (ram_addr[2:0] == 3'b000) ? 64'h0000_0000_0000_ffff :
									(ram_addr[2:0] == 3'b001) ? 64'h0000_0000_00ff_ff00 :
									(ram_addr[2:0] == 3'b010) ? 64'h0000_0000_ffff_0000 :
									(ram_addr[2:0] == 3'b011) ? 64'h0000_00ff_ff00_0000 :
									(ram_addr[2:0] == 3'b100) ? 64'h0000_ffff_0000_0000 :
									(ram_addr[2:0] == 3'b101) ? 64'h00ff_ff00_0000_0000 :
									(ram_addr[2:0] == 3'b110) ? 64'hffff_0000_0000_0000 : 64'd0;			//sh
		8'b010_01000:	store_mask = (ram_addr[2:0] == 3'b000) ? 64'h0000_0000_ffff_ffff :
									(ram_addr[2:0] == 3'b001) ? 64'h0000_00ff_ffff_ff00 :
									(ram_addr[2:0] == 3'b010) ? 64'h0000_ffff_ffff_0000 :
									(ram_addr[2:0] == 3'b011) ? 64'h00ff_ffff_ff00_0000 :
									(ram_addr[2:0] == 3'b100) ? 64'hffff_ffff_0000_0000 : 64'd0;			//sw
		8'b011_01000:	store_mask = 64'hffff_ffff_ffff_ffff;			//sd
		default:		store_mask = 64'h0000_0000_0000_0000;
	endcase
  end
*/

assign store_mem_en = (inst_opcode == 8'b000_01000) | (inst_opcode == 8'b001_01000)
					| (inst_opcode == 8'b010_01000) | (inst_opcode == 8'b011_01000);			//sb,sh,sw,sd	


endmodule	

//`include "defines.v"
/* verilator lint_off LATCH */
//----------------------------------------------------------------
//Module Name : cpu_ctrl_id.v
//Description of module:
//control signal genaration 
//----------------------------------------------------------------
//Designer:	Tang Pengyu
//Date: 2021/07/22	  
//----------------------------------------------------------------

module ysyx_210195_cpu_ctrl_id(
//		input	clock,
		input	[7:0]	inst_opcode,
		input	branch_eq,
		input	branch_ne,
		input	branch_lt,
		input	branch_ge,
		input	branch_ltu,
		input	branch_geu,
//		input	[63:0] ram_addr,
		input	time_intr_r,			//中断响应
//		input	[63:0] load_store_addr,			//exe_data
		
		input	[6:0]	funct7,
		input	[31:0]	inst,
		
//		input	if_fetched,	


		
		output	[1:0] wb_sel,
		output	pc_sel,
		output	branch_en,
		output	ecall_en,
		output	mret_en,
		
		input	[63:0]	op1,
		input	[63:0]	op2,
		input	[63:0]	extend_imm,
//		input	if_fetched,
		input	[63:0]	pc_out,
		output	[63:0]	jump_addr,
		output	load_mem_en,
		
		output	load_axi_en


);
wire	jalr_en;
wire	jal_en;
wire	load_clint_en;
//wire	store_axi_en;
//wire	store_clint_en;
//wire	store_mem_en;
assign jalr_en = (inst_opcode == 8'b000_11001);
assign jal_en = (inst_opcode[4:0] == 5'b11011);
wire	jal_jalr_en;
assign jal_jalr_en = jal_en | jalr_en;
//wire	load_mem_en;
assign load_mem_en = ((inst_opcode == 8'b000_00000) & (inst != 32'd0)) | (inst_opcode == 8'b100_00000)
					| (inst_opcode == 8'b001_00000) | (inst_opcode == 8'b101_00000)
					| (inst_opcode == 8'b010_00000) | (inst_opcode == 8'b110_00000)
					| (inst_opcode == 8'b011_00000);
assign wb_sel = {load_mem_en,jal_jalr_en};

wire	[63:0]	adder;
assign	adder = op1 + op2;
//assign store_mem_en = (inst_opcode == 8'b000_01000) | (inst_opcode == 8'b001_01000)
//					| (inst_opcode == 8'b010_01000) | (inst_opcode == 8'b011_01000);			//sb,sh,sw,sd	

//always @(*)	begin
//	if(if_fetched == 1'b1)	begin
assign		load_clint_en = load_mem_en & 
			((adder == 64'h0000_0000_0200_bff8) | (adder == 64'h0000_0000_0200_4000));
//assign		store_clint_en = store_mem_en &
//			(((op1 + extend_imm) == 64'h0000_0000_0200_bff8) | ((op1 + extend_imm) == 64'h0000_0000_0200_4000));

//	end
//end	
assign	load_axi_en = load_mem_en & (~load_clint_en);
//assign	store_axi_en = store_mem_en & (~store_clint_en);				
//pc_sel_t
reg		pc_sel_t;
always @(*)
  begin
	case(inst_opcode)
		8'b000_11001:	pc_sel_t = 1'b1;			//inst_jalr
		8'b000_11011,8'b001_11011,8'b010_11011,8'b011_11011,8'b100_11011,8'b101_11011,8'b110_11011,8'b111_11011:	
						pc_sel_t = 1'b1;			//inst_jal
		8'b000_11000:	pc_sel_t = branch_eq ? 1'b1 : 1'b0;			//beq
		8'b001_11000:	pc_sel_t = branch_ne ? 1'b1 : 1'b0;			//bne
		8'b100_11000:	pc_sel_t = branch_lt ? 1'b1 : 1'b0;			//blt
		8'b101_11000:	pc_sel_t = branch_ge ? 1'b1 : 1'b0;			//bge
		8'b110_11000:	pc_sel_t = branch_ltu ? 1'b1 : 1'b0;			//bltu
		8'b111_11000:	pc_sel_t = branch_geu ? 1'b1 : 1'b0;			//bgeu
		
		8'b000_11100:	pc_sel_t = 1'b1;					//ecall
		default:		pc_sel_t = 1'b0;
  
	endcase
  end
//wire	pc_sel_p;  
assign	pc_sel= time_intr_r ? 1'b1 : pc_sel_t;		//产生中断时一定跳转

assign	jump_addr = jalr_en ? adder :
					(pc_out + extend_imm);
					//beq bne blt bge bltu bgeu
assign	branch_en = (inst_opcode == 8'b000_11000) | (inst_opcode == 8'b001_11000)
					| (inst_opcode == 8'b100_11000) | (inst_opcode == 8'b101_11000)
					| (inst_opcode == 8'b110_11000) | (inst_opcode == 8'b111_11000);
					
//ecall_en
assign	ecall_en = (inst_opcode == 8'b000_11100) ? 
					((funct7 == 7'b0000000) ? 1'b1 : 1'b0) : 1'b0;
					
//mret_en
assign	mret_en = (inst_opcode == 8'b000_11100) ?
					((funct7 == 7'b0011000) ? 1'b1 : 1'b0) : 1'b0;

endmodule

//`include "defines.v"

//----------------------------------------------------------------
//Module Name : csr_reg.v
//Description of module:
// 
//----------------------------------------------------------------
//Designer:	Tang Pengyu
//Date: 2021/08/31  
//----------------------------------------------------------------


module ysyx_210195_csr_reg(
		input	clk,
		input	rst,
		//csr_unit -> csr_reg
		input	[11:0]	csr_addr,				//csr索引地址
		input	csr_w_ena,
		input	csr_r_ena,
		
		input	csr_r_ena_unit,
		input	[11:0]	csr_addr_unit,
		
		input	[`YSYX210195_PC_REG_DATA_LEN-1:0] csr_w_data,
		input	ecall_w_en,
		input	mret_w_en,
		input	[`YSYX210195_PC_INST_ADDR_LEN-1:0]	pc,
		
		input	[`YSYX210195_PC_INST_ADDR_LEN-1:0]	if_addr,
		
		input	time_overstep,				//mtime ≥ mtimecmp,mip的MTIP位置1
		input	time_intr_r,				//中断响应
		
		output	[`YSYX210195_PC_REG_DATA_LEN-1:0]	csr_r_data,
		
		output	[`YSYX210195_PC_REG_DATA_LEN-1:0]	csr_r_data_unit,
		output	[63:0] mtvec_o,
		output	[63:0] mepc_o,
		output	MTIP_o
		);
		
reg		time_intr_r_r;
always @(posedge clk)	begin
	if(rst)
		time_intr_r_r <= 1'b0;
	else
		time_intr_r_r <= time_intr_r;
end	
	
wire	time_intr_en;
assign	time_intr_en = time_intr_r & (~time_intr_r_r);			//后期需要去掉time_intr_diff，直接在时钟上升沿检测time_intr_en
//wire	time_intr_diff;
//assign	time_intr_diff = time_intr_en & clk;

///////////////////////////////////////mcycle-write//////////////////////////////////////////
reg		[63:0]	mcycle;
wire	mcycle_sel;
wire	mcycle_w_ena;				//mcycle 寄存器写使能,可读可写
wire	mcycle_r_ena;
assign	mcycle_sel = (csr_addr == 12'hb00);						
assign	mcycle_w_ena = mcycle_sel && csr_w_ena;	
assign	mcycle_r_ena = mcycle_sel && csr_r_ena;

wire	mcycle_sel_unit;
assign	mcycle_sel_unit = (csr_addr_unit == 12'hb00);
wire	mcycle_r_ena_unit;
assign	mcycle_r_ena_unit = mcycle_sel_unit && csr_r_ena_unit;

always @(posedge clk)	begin
	if(rst)
		mcycle <= 64'd0;
	else if(mcycle_w_ena)
		mcycle <= csr_w_data;
	else
		mcycle <= mcycle + 1'b1;
end
/////////////////////////////////////////////////////////////////////////////////////////////////////  

//////////////////////////////////////mtvec-write/////////////////////////////////////////////////
reg		[63:0]	mtvec;		//存了异常入口地址，可读可写
wire	mtvec_sel;
wire	mtvec_w_ena;
wire	mtvec_r_ena;
assign	mtvec_sel = (csr_addr == 12'h305);
assign	mtvec_w_ena = mtvec_sel && csr_w_ena;
assign	mtvec_r_ena = mtvec_sel && csr_r_ena;

wire	mtvec_sel_unit;
assign	mtvec_sel_unit = (csr_addr_unit == 12'h305);
wire	mtvec_r_ena_unit;
assign	mtvec_r_ena_unit = mtvec_sel_unit && csr_r_ena_unit;

always @(posedge clk)	begin
	if(rst)
		mtvec <= 64'd0;
	else if(mtvec_w_ena)
		mtvec[63:2] <= csr_w_data[63:2];

end
assign	mtvec_o = mtvec;

///////////////////////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////mepc-write////////////////////////////////////////////////////////
reg		[63:0]	mepc;				//存储中断或异常时的指令地址，可读可写
wire	mepc_sel;
wire	mepc_w_ena;
wire	mepc_r_ena;
assign	mepc_sel = (csr_addr == 12'h341);
assign	mepc_w_ena = mepc_sel && csr_w_ena;
assign	mepc_r_ena = mepc_sel && csr_r_ena;

wire	mepc_sel_unit;
assign	mepc_sel_unit = (csr_addr_unit == 12'h341);
wire	mepc_r_ena_unit;
assign	mepc_r_ena_unit = mepc_sel_unit && csr_r_ena_unit;
//always @(posedge clk or posedge time_intr_diff)	begin
always @(posedge clk)	begin
	if(rst)
		mepc <= 64'd0;
	else if(mepc_w_ena)
		mepc <= csr_w_data;
	else if(ecall_w_en)			//异常
		mepc <= pc;
	else if(time_intr_en)				//中断
		mepc <= if_addr;
end
assign	mepc_o = mepc;

//////////////////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////mcause-write////////////////////////////////////////////////////////
reg		[63:0]	mcause;				//跟踪并控制处理器的当前运行状态
wire	mcause_sel;
wire	mcause_w_ena;
wire	mcause_r_ena;
assign	mcause_sel = (csr_addr == 12'h342);
assign	mcause_w_ena = mcause_sel && csr_w_ena;
assign	mcause_r_ena = mcause_sel && csr_r_ena;

wire	mcause_sel_unit;
assign	mcause_sel_unit = (csr_addr_unit == 12'h342);
wire	mcause_r_ena_unit;
assign	mcause_r_ena_unit = mcause_sel_unit && csr_r_ena_unit;
always @(posedge clk)	begin
	if(rst)
		mcause <= 64'd0;
	else if(mcause_w_ena)
		mcause <= csr_w_data;
	else if(ecall_w_en)				
		mcause <= 64'd11;		//环境调用异常
	else if(time_intr_en)
		mcause <= 64'h8000_0000_0000_0007;			//计时器中断
end

/////////////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////mstatus-write//////////////////////////////////////////////
reg		[62:0]	mstatus_w;
wire	mstatus_sel;
wire	mstatus_w_ena;
wire	mstatus_r_ena;
assign	mstatus_sel = (csr_addr == 12'h300);
assign	mstatus_w_ena = mstatus_sel && csr_w_ena;
assign	mstatus_r_ena = mstatus_sel && csr_r_ena;

wire	mstatus_sel_unit;
assign	mstatus_sel_unit = (csr_addr_unit == 12'h300);
wire	mstatus_r_ena_unit;
assign	mstatus_r_ena_unit = mstatus_sel_unit && csr_r_ena_unit;
always @(posedge clk)	begin
	if(rst)
		mstatus_w <= 63'h0000_0000_0000_1808;
	else if(mstatus_w_ena)	begin
//		mstatus_w[7] <= csr_w_data[7];
//		mstatus_w[3] <= csr_w_data[3];
		mstatus_w <= csr_w_data[62:0];
	end
	else if(ecall_w_en)	begin
		mstatus_w[7] <= mstatus_w[3];
		mstatus_w[3] <= 1'b0;
//		mstatus_w[12:11] <= 2'b11;
	end
	else if(mret_w_en)	begin
		mstatus_w[3] <= mstatus_w[7];
		mstatus_w[7] <= 1'b1;
//		mstatus_w[12:11] <= 2'b00;
	end
	else if(time_intr_en)	begin
		mstatus_w[7] <= mstatus_w[3];
		mstatus_w[3] <= 1'b0;
//		mstatus_w[12:11] <= 2'b11;
	end

end

wire	mstatus_SD;
assign	mstatus_SD = (mstatus_w[14] & mstatus_w[13]) | (mstatus_w[16] & mstatus_w[15]);
wire	[63:0] mstatus = {mstatus_SD,mstatus_w};

///////////////////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////mip-write////////////////////////////////////////////////////
reg		[63:0]	mip;		//包含等待中断的信息
reg		[63:0]	mie;
wire	mip_sel;
wire	mip_w_ena;
wire	mip_r_ena;
assign	mip_sel = (csr_addr == 12'h344);
assign	mip_w_ena = mip_sel && csr_w_ena;
assign	mip_r_ena = mip_sel && csr_r_ena;

wire	mip_sel_unit;
assign	mip_sel_unit = (csr_addr_unit == 12'h344);
wire	mip_r_ena_unit;
assign	mip_r_ena_unit = mip_sel_unit && csr_r_ena_unit;
always @(posedge clk)	begin
	if(rst)
		mip <= 64'd0;
	else if(mip_w_ena)
		mip <= csr_w_data;
	else
		mip[7] <= (time_overstep & mstatus[3] & mie[7]) ? 1'b1 : 1'b0;	
end
assign	MTIP_o = mip[7];

///////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////mie-write////////////////////////////////////////////////////////

wire	mie_sel;
wire	mie_w_ena;
wire	mie_r_ena;
assign	mie_sel = (csr_addr == 12'h304);
assign	mie_w_ena = mie_sel && csr_w_ena;
assign	mie_r_ena = mie_sel && csr_r_ena;

wire	mie_sel_unit;
assign	mie_sel_unit = (csr_addr_unit == 12'h304);
wire	mie_r_ena_unit;
assign	mie_r_ena_unit = mie_sel_unit && csr_r_ena_unit;
always @(posedge clk)	begin
	if(rst)
		mie <= 64'd0;
	else if(mie_w_ena)
		mie <= csr_w_data;

end
////////////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////mscratch-write//////////////////////////////////////////////
reg		[63:0]	mscratch;
wire	mscratch_sel;
wire	mscratch_w_ena;
wire	mscratch_r_ena;
assign	mscratch_sel = (csr_addr == 12'h340);
assign	mscratch_w_ena = mscratch_sel && csr_w_ena;
assign	mscratch_r_ena = mscratch_sel && csr_r_ena;

wire	mscratch_sel_unit;
assign	mscratch_sel_unit = (csr_addr_unit == 12'h340);
wire	mscratch_r_ena_unit;
assign	mscratch_r_ena_unit = mscratch_sel_unit && csr_r_ena_unit;
always @(posedge clk)	begin
	if(rst)
		mscratch <= 64'd0;
	else if(mscratch_w_ena)
		mscratch <= csr_w_data;
end
///////////////////////////////////////////////////////////////////////////////////////////////////



assign	csr_r_data = ({64{mcycle_r_ena}} & mcycle)
					| ({64{mtvec_r_ena}} & mtvec)
					| ({64{mepc_r_ena}} & mepc)
					| ({64{mcause_r_ena}} & mcause)
					| ({64{mstatus_r_ena}} & mstatus)
					| ({64{mip_r_ena}} & mip)
					| ({64{mie_r_ena}} & mie)
					| ({64{mscratch_r_ena}} & mscratch);
assign	csr_r_data_unit = ({64{mcycle_r_ena_unit}} & mcycle)
					| ({64{mtvec_r_ena_unit}} & mtvec)
					| ({64{mepc_r_ena_unit}} & mepc)
					| ({64{mcause_r_ena_unit}} & mcause)
					| ({64{mstatus_r_ena_unit}} & mstatus)
					| ({64{mip_r_ena_unit}} & mip)
					| ({64{mie_r_ena_unit}} & mie)
					| ({64{mscratch_r_ena_unit}} & mscratch);					

endmodule









//`include "defines.v"

//----------------------------------------------------------------
//Module Name : csr_unit.v
//Description of module:
// 
//----------------------------------------------------------------
//Designer:	Tang Pengyu
//Date: 2021/08/31	  
//----------------------------------------------------------------

module ysyx_210195_csr_unit(
		input	[7:0]	inst_opcode,
		input	[11:0]	extend_imm,				//其中包含了CSR地址
		input	rs1_r_ena,
		input	[4:0] 	rs1_r_addr,
		input	[`YSYX210195_PC_REG_DATA_LEN-1:0]	op1,
		input	rd_w_ena,
		input	[4:0]	rd_w_addr,
		input	[`YSYX210195_PC_REG_DATA_LEN-1:0]	csr_r_data,
		input	csr_imm_ena,							//csr立即数使能
		input	[`YSYX210195_PC_REG_DATA_LEN-1:0]	csr_imm,						//csr立即数
		
		output	[11:0] csr_addr,
		output	reg csr_w_ena,
		output	reg [`YSYX210195_PC_REG_DATA_LEN-1:0]	csr_w_data,
		output	reg csr_r_ena
		);

assign	csr_addr = extend_imm[11:0];

wire	[1:0]	csr_rw;			//csr地址[11：10],标志是否可读写
assign	csr_rw = extend_imm[11:10];
//wire	[1:0]	csr_pri;		//csr最低权限
//assign	csr_pri = extend_imm[9:8];
		
always @(*)
  begin
	case(inst_opcode)
		8'b001_11100:						//inst_csrrw
			begin
				csr_r_ena = (rd_w_ena == 1'b0) ? 1'b0 :
							(rd_w_addr == 5'h00) ? 1'b0 : 1'b1;
				csr_w_ena = (!(csr_rw[0] & csr_rw[1]));
				csr_w_data = op1;
			
			end
		8'b010_11100:						//inst_csrrs
			begin
				csr_r_ena = 1'b1;
				csr_w_ena = ((rs1_r_ena == 1'b0) ? 1'b0 :
							(rs1_r_addr == 5'h00) ? 1'b0 : 1'b1)
							& (!(csr_rw[0] & csr_rw[1]));
				csr_w_data = op1 | csr_r_data;
			
			end
		8'b011_11100:						//inst_csrrc
			begin
				csr_r_ena = 1'b1;
				csr_w_ena = ((rs1_r_ena == 1'b0) ? 1'b0 :
							(rs1_r_addr == 5'h00) ? 1'b0 : 1'b1)
							& (!(csr_rw[0] & csr_rw[1]));
				csr_w_data = (~op1) & csr_r_data;
			end
		8'b101_11100:						//inst_csrrwi
			begin
				csr_r_ena = (rd_w_ena == 1'b0) ? 1'b0 :
							(rd_w_addr == 5'h00) ? 1'b0 : 1'b1;
				csr_w_ena = (!(csr_rw[0] & csr_rw[1]));
				csr_w_data = csr_imm;
			end
		8'b110_11100:						//inst_csrrsi
			begin
				csr_r_ena = 1'b1;
				csr_w_ena = ((csr_imm_ena == 1'b0) ? 1'b0 :
							(csr_imm[4:0] == 5'h00) ? 1'b0 : 1'b1)
							& (!(csr_rw[0] & csr_rw[1]));
				csr_w_data = csr_imm | csr_r_data;
			end
		8'b111_11100:						//inst_csrrci
			begin
				csr_r_ena = 1'b1;
				csr_w_ena = ((csr_imm_ena == 1'b0) ? 1'b0 :
							(csr_imm[4:0] == 5'h00) ? 1'b0 : 1'b1)
							& (!(csr_rw[0] & csr_rw[1]));
				csr_w_data = (~csr_imm) & csr_r_data;
			end
		default:
			begin
				csr_r_ena = 1'b0;
				csr_w_ena = 1'b0;
				csr_w_data = 64'd0;
			
			end
    endcase
  end
  
  
endmodule

//`include "defines.v"

//----------------------------------------------------------------
//Module Name : data_conf.v
//Description of module:
//instration fetch 
//----------------------------------------------------------------
//Designer:	Tang Pengyu
//Date: 2021/09/29/16:28	  
//----------------------------------------------------------------
module ysyx_210195_data_conf(
//本级
	input	i_id_rs1_r_ena,				//本级rs1_ena源操作数1
	input	[4:0]	i_id_rs1_r_addr,	//本级rs1_addr源操作数1
	input	[63:0]	i_id_op1,
	input	i_id_rs2_r_ena,				//本级rs2_ena源操作数2
	input	[4:0]	i_id_rs2_r_addr,	//本级rs2_addr源操作数2
	input	[63:0]	i_id_op2,
//上一级
	input	o_id_rd_w_ena,				//上一级rd_ena
	input	[4:0]	o_id_rd_w_addr,		//上一级rd_w_addr
	input	[63:0]	i_exe_data,			//上一级执行结果
	input	[1:0]	o_ctrlid_wb_sel,	//上一级wb_sel
	input	[63:0]	o_ifif_pc_out,		//上一级pc_out
	input	i_csrunit_csr_r_ena,
	input	[63:0]	csr_r_data_unit,
	input	i_ctrlexe_load_clint_en,
	input	[63:0]	load_clint_data_exe,

//上两级
	input	o_idid_rd_w_ena,			//上两级rd_w_ena
	input	[4:0]	o_idid_rd_w_addr,	//上两级rd_w_addr
	input	[63:0]	i_exeexe_data,		//上两级执行结果
	input	[1:0]	o_ctrlidctrlid_wb_sel,	//上两级wb_sel
	input	[63:0]	o_ififif_pc_out,		//上两级pc_out
	input	o_csrunit_csr_r_ena,
	input	[63:0]	o_csrunit_csr_r_data,
	input	o_ctrlexe_load_clint_en,
	input	[63:0]	o_clint_load_data,
	
//上三级
	input	o_ididid_rd_w_ena,			//上三级rd_w_ena
	input	[4:0]	o_ididid_rd_w_addr,
	input	[63:0]	o_exeexe_data,
	input	[1:0]	o_ctrlidctrlidctrlid_wb_sel,
	input	[63:0]	o_ifififif_pc_out,
	input	[63:0]	o_lspro_axi_ld_data,
	input	o_csrunitcsrunit_csr_r_ena,
	input	[63:0]	o_csrunitcsrunit_csr_r_data,
	input	o_ctrlexectrlexe_load_clint_en,
	input	[63:0]	o_clintclint_load_data,
	
//输出判断后的源操作数
	output	[63:0]	conflict_op1,
	output	[63:0]	conflict_op2
);
wire	[63:0]	data_back1;
assign	data_back1 = (o_ctrlid_wb_sel == 2'b00) ? 
				(i_csrunit_csr_r_ena ? csr_r_data_unit : i_exe_data) : 
				 (o_ctrlid_wb_sel == 2'b01) ? (o_ifif_pc_out + 4) : 
				 (o_ctrlid_wb_sel == 2'b10) ? 
				 ((i_ctrlexe_load_clint_en == 1'b1) ? load_clint_data_exe :  64'd0) :
				 64'd0;
wire	[63:0]	data_back2;
assign	data_back2 = (o_ctrlidctrlid_wb_sel == 2'b00) ? 
				(o_csrunit_csr_r_ena ? o_csrunit_csr_r_data : i_exeexe_data) : 
				 (o_ctrlidctrlid_wb_sel == 2'b01) ? (o_ififif_pc_out + 4) : 
				 (o_ctrlidctrlid_wb_sel == 2'b10) ? 
				 ((o_ctrlexe_load_clint_en == 1'b1) ? o_clint_load_data : 64'd0):
				 64'd0;
wire	[63:0]	data_back3;
assign	data_back3 = (o_ctrlidctrlidctrlid_wb_sel == 2'b00) ? 
				(o_csrunitcsrunit_csr_r_ena ? o_csrunitcsrunit_csr_r_data : o_exeexe_data) : 
				 (o_ctrlidctrlidctrlid_wb_sel == 2'b01) ? (o_ifififif_pc_out + 4) : 
				 (o_ctrlidctrlidctrlid_wb_sel == 2'b10) ? 
				 ((o_ctrlexectrlexe_load_clint_en == 1'b1) ? o_clintclint_load_data :o_lspro_axi_ld_data) :
				 64'd0;

wire	[4:0]	rs1_sel;
assign	rs1_sel = ({5{i_id_rs1_r_ena}} & i_id_rs1_r_addr);
wire	[4:0]	rs2_sel;				 
assign	rs2_sel = ({5{i_id_rs2_r_ena}} & i_id_rs2_r_addr);

wire	[4:0]	back1_rd_sel;
assign	back1_rd_sel = ({5{o_id_rd_w_ena}} & o_id_rd_w_addr);
wire	[4:0]	back2_rd_sel;
assign	back2_rd_sel = ({5{o_idid_rd_w_ena}} & o_idid_rd_w_addr);
wire	[4:0]	back3_rd_sel;
assign	back3_rd_sel = ({5{o_ididid_rd_w_ena}} & o_ididid_rd_w_addr);

wire	rs1_back1;
assign	rs1_back1 = (rs1_sel == 5'b00000) ? 1'b0 :
					(rs1_sel == back1_rd_sel) ? 1'b1 : 1'b0;
wire	rs1_back2;
assign	rs1_back2 = (rs1_sel == 5'b00000) ? 1'b0 :
					(rs1_sel == back2_rd_sel) ? 1'b1 : 1'b0;
wire	rs2_back1;
assign	rs2_back1 = (rs2_sel == 5'b00000) ? 1'b0 :
					(rs2_sel == back1_rd_sel) ? 1'b1 : 1'b0;
wire	rs2_back2;
assign	rs2_back2 = (rs2_sel == 5'b00000) ? 1'b0 :
					(rs2_sel == back2_rd_sel) ? 1'b1 : 1'b0;

wire	rs1_back3;
assign	rs1_back3 = (rs1_sel == 5'b00000) ? 1'b0 :
					(rs1_sel == back3_rd_sel) ? 1'b1 : 1'b0;
wire	rs2_back3;
assign	rs2_back3 = (rs2_sel == 5'b00000) ? 1'b0 :
					(rs2_sel == back3_rd_sel) ? 1'b1 : 1'b0;					

assign	conflict_op1 = rs1_back1 ? data_back1 :
						rs1_back2 ? data_back2 : 
						rs1_back3 ? data_back3 : i_id_op1;
assign	conflict_op2 = rs2_back1 ? data_back1 :
						rs2_back2 ? data_back2 : 
						rs2_back3 ? data_back3 : i_id_op2;
						
endmodule

//`include "defines.v"

//----------------------------------------------------------------
//Module Name : exe_stage.v
//Description of module:
//exe 
//----------------------------------------------------------------
//Designer:	Tang Pengyu
//Date: 2021/07/15	  
//----------------------------------------------------------------


module ysyx_210195_exe_stage(
  input	rst,
//  input	[5:0] inst_type_i,
  input	[7:0] inst_opcode,
  input	[`YSYX210195_PC_REG_DATA_LEN-1:0] op1,
  input	[`YSYX210195_PC_REG_DATA_LEN-1:0] op2,
  input	[`YSYX210195_PC_REG_DATA_LEN-1:0]	extend_imm,
  input	[6:0] funct7,
  input	[`YSYX210195_PC_INST_ADDR_LEN-1:0] pc,
  input	[`YSYX210195_PC_REG_DATA_LEN-1:0] csr_r_data,
  
//  output	[5:0] inst_type_o,
  output	reg [`YSYX210195_PC_REG_DATA_LEN-1:0] exe_data
);

//assign	inst_type_o = inst_type_i;
wire	[63:0] adder;
wire	[63:0] suber;
wire	[63:0] sller;			//<<
wire	[63:0] srler;			//逻辑右移
wire	[63:0] sraer;			//算术右移
wire	[31:0] sllwer;
wire	[31:0] srlwer;			//逻辑右移字
wire	[31:0] srawer;			//算术右移字
assign	adder = op1 + op2;
assign	suber = op1 - op2;
assign	sller = op1 << (op2[5:0]);
assign	srler = op1 >> (op2[5:0]);
assign	sraer = (({`YSYX210195_PC_REG_DATA_LEN{op1[`YSYX210195_PC_REG_DATA_LEN-1]}} << (~op2[5:0])) | (op1 >> op2[5:0]));
assign	sllwer = (op1[31:0]) << (op2[4:0]);
assign	srlwer = (op1[31:0]) >> (op2[4:0]);
assign	srawer = $signed(op1[31:0]) >>> (op2[4:0]);

always @(*)
  begin
	if(rst)
		exe_data = 64'd0;
	else
		case(inst_opcode)
		8'b000_00100:	exe_data = adder;			//addi
		8'b110_00100:	exe_data = op1 | op2;			//ori
		8'b111_00100:	exe_data = op1 & op2;			//andi
		8'b001_00100:	exe_data = sller;	//slli
/*		8'b010_00100,8'b010_01100:			//slti,slt
					begin
						if((op1[`YSYX210195_PC_REG_DATA_LEN-1] == 1'b1) && (op2[`YSYX210195_PC_REG_DATA_LEN-1] == 1'b0))
							exe_data = 1'b1;
						else if((op1[`YSYX210195_PC_REG_DATA_LEN-1] == 1'b0) && (op2[`YSYX210195_PC_REG_DATA_LEN-1] == 1'b1))
							exe_data = 1'b0;
						else if((op1[`YSYX210195_PC_REG_DATA_LEN-1] == 1'b0) && (op2[`YSYX210195_PC_REG_DATA_LEN-1] == 1'b0))
							exe_data = (op1 < op2) ? 1'b1 : 1'b0;
						else
							exe_data = (op1 > op2) ? 1'b1 : 1'b0;
					end	*/
		8'b010_00100,8'b010_01100:	exe_data = (suber[63] == 1'b1) ? 64'd1 : 64'd0;	//slti,slt
		8'b011_00100,8'b011_01100:	exe_data = (op1 < op2) ? 64'd1 : 64'd0;	//stliu,sltu
//		8'b101_00100:	exe_data = ({`YSYX210195_PC_REG_DATA_LEN{op1[`YSYX210195_PC_REG_DATA_LEN-1]}} << (~op2[5:0])) | (op1 >> op2[5:0]);	//srai
		8'b101_00100:	exe_data = (funct7[5]) ? sraer : srler;	//srai_srli
		8'b100_00100:	exe_data = op1 ^ op2;				//xori
		8'b000_00000:	exe_data = adder;				//lb
		8'b100_00000:	exe_data = adder;				//lbu
		8'b001_00000:	exe_data = adder;				//lh
		8'b101_00000:	exe_data = adder;				//lhu
		8'b010_00000:	exe_data = adder;				//lw
		8'b110_00000:	exe_data = adder;				//lwu
		8'b000_11001:	exe_data = adder;				//jalr
		8'b011_00000:	exe_data = adder;				//ld
		8'b000_01100:	exe_data = (funct7[5]) ? suber : adder;				//add_sub
		8'b111_01100:	exe_data = op1 & op2;				//and
		8'b110_01100:	exe_data = op1 | op2;				//or
		8'b100_01100:	exe_data = op1 ^ op2;				//xor
//		8'b101_01100:	exe_data = (op1 >> op2[5:0]);		//srl
		8'b001_01100:	exe_data = sller;		//sll
		8'b000_00110:	exe_data = {{32{adder[31]}},adder[31:0]};	//addiw
		8'b001_00110:	exe_data = {{32{sllwer[31]}},sllwer[31:0]};		//slliw
		8'b101_00110:	exe_data = (funct7[5]) ? {{32{srawer[31]}},srawer[31:0]} : {{32{srlwer[31]}},srlwer[31:0]};			//srliw_sraiw
//csr
		8'b001_11100,8'b010_11100,8'b011_11100,8'b101_11100,8'b110_11100,8'b111_11100:	exe_data = csr_r_data;				

		8'b000_01110:	exe_data = (funct7[5]) ? ({{32{suber[31]}},suber[31:0]}) : {{32{adder[31]}},adder[31:0]};		//addw,subw
		8'b001_01110:	exe_data = {{32{sllwer[31]}},sllwer[31:0]};		//sllw
		8'b101_01110:	exe_data = (funct7[5]) ? {{32{srawer[31]}},srawer[31:0]} : {{32{srlwer[31]}},srlwer[31:0]};		//sraw_srlw
//		8'b010_01100:										//slt
//		8'b101_01100:	exe_data = ({`YSYX210195_PC_REG_DATA_LEN{op1[`YSYX210195_PC_REG_DATA_LEN-1]}} << (~op2[5:0])) | (op1 >> op2[5:0]);		//sra
		8'b101_01100:	exe_data = (funct7[5]) ? sraer : srler;			//srl_sra
		8'b000_01000,8'b001_01000,8'b010_01000,8'b011_01000:	exe_data = op1 + extend_imm;		//sb,sh,sw,sd
		8'b000_11000,8'b001_11000,8'b100_11000,8'b101_11000,8'b110_11000,8'b111_11000:	exe_data = pc + extend_imm;			//beq,bne,blt,bge,bltu,bgeu
		8'b000_01101,8'b001_01101,8'b010_01101,8'b011_01101,8'b100_01101,8'b101_01101,8'b110_01101,8'b111_01101:	
						exe_data = extend_imm;			//lui
		8'b000_00101,8'b001_00101,8'b010_00101,8'b011_00101,8'b100_00101,8'b101_00101,8'b110_00101,8'b111_00101:	
						exe_data = pc + extend_imm;		//auipc
		8'b000_11011,8'b001_11011,8'b010_11011,8'b011_11011,8'b100_11011,8'b101_11011,8'b110_11011,8'b111_11011:	
						exe_data = pc + extend_imm;				//jal
		default:	exe_data = {`YSYX210195_PC_REG_DATA_LEN{1'b0}};
	
		endcase
  end
  
endmodule

//`include "defines.v"

//----------------------------------------------------------------
//Module Name : EXMEM_reg.v
//Description of module:
//
//----------------------------------------------------------------
//Designer:	Tang Pengyu
//Date: 2021/9/28/08:43  
//----------------------------------------------------------------
module ysyx_210195_EXMEM_reg(
	input	clk,
	input	reset,
	input	handshake_done,
	input	exmem_rst,
	input	exmem_ena,
//from if
	input	[`YSYX210195_PC_INST_ADDR_LEN-1:0]	i_ififif_pc_out,		//regfile
//	input	i_ififif_fetched,								//regfile
//	input	i_ififif_time_intr_r,					//wb
//	input	[`YSYX210195_PC_INST_ADDR_LEN-1:0] i_ififif_addr,
	
//from id
//	input	i_idid_rs1_r_ena,				//--csr_reg,regfile
//	input	[4:0]	i_idid_rs1_r_addr,	//--csr_reg,regfile
//	input	i_idid_rs2_r_ena,				//--regfile
//	input	[4:0]	i_idid_rs2_r_addr,	//--regfile
	input	i_idid_rd_w_ena,				//--csr_reg,regfile
	input	[4:0]	i_idid_rd_w_addr,		//--csr_reg,regfile
	input	[`YSYX210195_PC_REG_DATA_LEN-1:0] i_idid_op2,	//reg	
	input	[7:0]	i_idid_inst_opcode,
//from	ctrlid
	input	[1:0]	i_ctrlidctrlid_wb_sel,			//regfile
	input	i_ctrlidctrlid_ecall_en,					//wb
	input	i_ctrlidctrlid_mret_en,					//wb
	
//from exe
	input	[`YSYX210195_PC_REG_DATA_LEN-1:0]	i_exe_data,		//--WB
//from CSR_UNIT
	input	[11:0]	i_csrunit_csr_addr,		//wb
	input	i_csrunit_csr_w_ena,			//wb
	input	[`YSYX210195_PC_REG_DATA_LEN-1:0]	i_csrunit_csr_w_data,		//wb
	input	i_csrunit_csr_r_ena,			//wb
	input	[63:0]	i_csrunit_csr_r_data,
//from ctrlexe
	input	i_ctrlexe_load_axi_en,			//regfile
	input	i_ctrlexe_load_clint_en,		//regfile
	input	i_ctrlexe_store_axi_en,		
	input	i_ctrlexe_store_clint_en,
//	input	i_ctrlexe_wb_sel,				//regfile
//from clint
	input	[63:0]	i_clint_load_data,
	
	output	reg [`YSYX210195_PC_INST_ADDR_LEN-1:0]	o_ififif_pc_out,
//	output	reg o_ififif_fetched,
//	output	reg o_ififif_time_intr_r,
//	output	reg [`YSYX210195_PC_INST_ADDR_LEN-1:0] o_ififif_addr,
	
//	output	reg o_idid_rs1_r_ena,				//--csr_reg,regfile
//	output	reg [4:0]	o_idid_rs1_r_addr,	//--csr_reg,regfile
//	output	reg o_idid_rs2_r_ena,				//--regfile
//	output	reg [4:0]	o_idid_rs2_r_addr,	//--regfile
	output	reg o_idid_rd_w_ena,				//--csr_reg,regfile
	output	reg [4:0]	o_idid_rd_w_addr,		//--csr_reg,regfile	
	output	reg	[`YSYX210195_PC_REG_DATA_LEN-1:0] o_idid_op2,
	output	reg [7:0]	o_idid_inst_opcode,
	
	output	reg	[1:0]	o_ctrlidctrlid_wb_sel,
	output	reg o_ctrlidctrlid_ecall_en,
	output	reg o_ctrlidctrlid_mret_en,
	
	output	reg [`YSYX210195_PC_REG_DATA_LEN-1:0]	o_exe_data,
	
	output	reg [11:0]	o_csrunit_csr_addr,
	output	reg o_csrunit_csr_w_ena,
	output	reg [`YSYX210195_PC_REG_DATA_LEN-1:0]	o_csrunit_csr_w_data,
	output	reg o_csrunit_csr_r_ena,
	output	reg	[63:0]	o_csrunit_csr_r_data,
	
	output	reg o_ctrlexe_load_axi_en,
	output	reg o_ctrlexe_load_clint_en,
	output	reg o_ctrlexe_store_axi_en,
	output	reg o_ctrlexe_store_clint_en,
//	output	reg o_ctrlexe_wb_sel

	output	reg [63:0]	o_clint_load_data
	
);

always @(posedge clk)	begin
	if(reset)	begin
		o_ififif_pc_out <= {`YSYX210195_PC_INST_ADDR_LEN{1'b0}};
//		o_ififif_fetched <= 1'b0;
//		o_ififif_time_intr_r <= 1'b0;
//		o_ififif_addr <= {`YSYX210195_PC_INST_ADDR_LEN{1'b0}};

//		o_idid_rs1_r_ena <= 1'b0;
//		o_idid_rs1_r_addr <= 5'd0;
//		o_idid_rs2_r_ena <= 1'b0;
//		o_idid_rs2_r_addr <= 5'd0;
		o_idid_rd_w_ena <= 1'b0;
		o_idid_rd_w_addr <= 5'd0;
		o_idid_op2 <= {`YSYX210195_PC_REG_DATA_LEN{1'b0}};
		o_idid_inst_opcode <= 8'b000_00100;
	
		o_ctrlidctrlid_wb_sel <= 2'b00;
		o_ctrlidctrlid_ecall_en <= 1'b0;
		o_ctrlidctrlid_mret_en <= 1'b0;
	
		o_exe_data <= {`YSYX210195_PC_REG_DATA_LEN{1'b0}};
	
		o_csrunit_csr_addr <= 12'd0;
		o_csrunit_csr_w_ena <= 1'b0;
		o_csrunit_csr_w_data <= {`YSYX210195_PC_REG_DATA_LEN{1'b0}};
		o_csrunit_csr_r_ena <= 1'b0;
		o_csrunit_csr_r_data <= 64'd0;
	
		o_ctrlexe_load_axi_en <= 1'b0;
		o_ctrlexe_load_clint_en <= 1'b0;
		o_ctrlexe_store_axi_en <= 1'b0;
		o_ctrlexe_store_clint_en <= 1'b0;
		
		o_clint_load_data <= 64'd0;	
	
	end
	else if(handshake_done)	begin
		if(exmem_rst)	begin
			o_ififif_pc_out <= {`YSYX210195_PC_INST_ADDR_LEN{1'b0}};
//			o_ififif_fetched <= 1'b0;
//			o_ififif_time_intr_r <= 1'b0;
//			o_ififif_addr <= {`YSYX210195_PC_INST_ADDR_LEN{1'b0}};

//			o_idid_rs1_r_ena <= 1'b0;
//			o_idid_rs1_r_addr <= 5'd0;
//			o_idid_rs2_r_ena <= 1'b0;
//			o_idid_rs2_r_addr <= 5'd0;
			o_idid_rd_w_ena <= 1'b0;
			o_idid_rd_w_addr <= 5'd0;
			o_idid_op2 <= {`YSYX210195_PC_REG_DATA_LEN{1'b0}};
			o_idid_inst_opcode <= 8'b000_00100;
	
			o_ctrlidctrlid_wb_sel <= 2'b00;
			o_ctrlidctrlid_ecall_en <= 1'b0;
			o_ctrlidctrlid_mret_en <= 1'b0;
	
			o_exe_data <= {`YSYX210195_PC_REG_DATA_LEN{1'b0}};
	
			o_csrunit_csr_addr <= 12'd0;
			o_csrunit_csr_w_ena <= 1'b0;
			o_csrunit_csr_w_data <= {`YSYX210195_PC_REG_DATA_LEN{1'b0}};
			o_csrunit_csr_r_ena <= 1'b0;
			o_csrunit_csr_r_data <= 64'd0;
	
			o_ctrlexe_load_axi_en <= 1'b0;
			o_ctrlexe_load_clint_en <= 1'b0;
			o_ctrlexe_store_axi_en <= 1'b0;
			o_ctrlexe_store_clint_en <= 1'b0;
		
			o_clint_load_data <= 64'd0;
		end
		else if(exmem_ena)	begin
			o_ififif_pc_out <= i_ififif_pc_out;
//			o_ififif_fetched <= i_ififif_fetched;
//			o_ififif_time_intr_r <= i_ififif_time_intr_r;
//			o_ififif_addr <= i_ififif_addr;

//			o_idid_rs1_r_ena <= i_idid_rs1_r_ena;
//			o_idid_rs1_r_addr <= i_idid_rs1_r_addr;
//			o_idid_rs2_r_ena <= i_idid_rs2_r_ena;
//			o_idid_rs2_r_addr <= i_idid_rs2_r_addr;
			o_idid_rd_w_ena <= i_idid_rd_w_ena;
			o_idid_rd_w_addr <= i_idid_rd_w_addr;
			o_idid_op2 <= i_idid_op2;
			o_idid_inst_opcode <= i_idid_inst_opcode;
	
			o_ctrlidctrlid_wb_sel <= i_ctrlidctrlid_wb_sel;
			o_ctrlidctrlid_ecall_en <= i_ctrlidctrlid_ecall_en;
			o_ctrlidctrlid_mret_en <= i_ctrlidctrlid_mret_en;
	
			o_exe_data <= i_exe_data;
	
			o_csrunit_csr_addr <= i_csrunit_csr_addr;
			o_csrunit_csr_w_ena <= i_csrunit_csr_w_ena;
			o_csrunit_csr_w_data <= i_csrunit_csr_w_data;
			o_csrunit_csr_r_ena <= i_csrunit_csr_r_ena;
			o_csrunit_csr_r_data <= i_csrunit_csr_r_data;
	
			o_ctrlexe_load_axi_en <= i_ctrlexe_load_axi_en;
			o_ctrlexe_load_clint_en <= i_ctrlexe_load_clint_en;
			o_ctrlexe_store_axi_en <= i_ctrlexe_store_axi_en;
			o_ctrlexe_store_clint_en <= i_ctrlexe_store_clint_en;	
		
			o_clint_load_data <= i_clint_load_data;
	
	
		end
	end

end

endmodule

//`include "defines.v"

//----------------------------------------------------------------
//Module Name : id_stage.v
//Description of module:
//instration decode 
//----------------------------------------------------------------
//Designer:	Tang Pengyu
//Date: 2021/07/14	  
//----------------------------------------------------------------

/* verilator lint_off UNUSED */
/* verilator lint_off UNDRIVEN */
module ysyx_210195_id_stage(
  input		rst,
  input	[`YSYX210195_PC_INST_LEN-1:0]	inst,					//32 bit inst code
  input	[`YSYX210195_PC_REG_DATA_LEN-1:0]	rs1_data,			//op1 in rs1
  input	[`YSYX210195_PC_REG_DATA_LEN-1:0]	rs2_data,			//op2 in rs2
//  input	fetched,
  
//  input	[`YSYX210195_PC_REG_DATA_LEN-1:0] csr_read_data,		//从CSR中读出的数据，写入rd，应该放在执行阶段
  
  output	reg rs1_r_ena,					//rs1 read enable
  output	[4:0]	rs1_r_addr,			//rs1 read addr
  output	reg rs2_r_ena,					//rs2 read enable
  output	[4:0]	rs2_r_addr,			//rs2 read addr
  output	reg rd_w_ena,					//rd write enable
  output	[4:0]	rd_w_addr,			//rd write addr
  
  output	csr_imm_ena,							//csr立即数使能
  output	[`YSYX210195_PC_REG_DATA_LEN-1:0]	csr_imm,						//csr立即数
  
//  output	[5:0]	inst_type,			//6 inst type--one hot code			
  output	[7:0]	inst_opcode,		//自定义8位操作码，{func3[2:0],opcode[6:2]}
  output	reg [`YSYX210195_PC_REG_DATA_LEN-1:0]	op1,			//64bit op1 data
  output	reg [`YSYX210195_PC_REG_DATA_LEN-1:0]	op2,				//64bit op2 data
  output	reg	[`YSYX210195_PC_REG_DATA_LEN-1:0]	extend_imm,				//立即数符号扩展
  output	[6:0]	funct7
);

/*----------------------distribute the 32-bit inst code-----------------------*/
wire	[6:0]	opcode;
wire	[4:0]	rd_or_imm;
wire	[2:0]	func_or_imm;
wire	[4:0]	rs1_or_imm;
wire	[4:0]	rs2_or_imm;
wire	[6:0]	imm;

assign	opcode = inst[6:0];
assign	rd_or_imm = inst[11:7];
assign	func_or_imm = inst[14:12];
assign	rs1_or_imm = inst[19:15];
assign	rs2_or_imm = inst[24:20];
assign	imm = inst[31:25];
assign	funct7 = imm;

/*------------------obtain inst_opcode and identify the inst-------------------*/
assign	inst_opcode = {func_or_imm , opcode[6:2]};
//I-type
wire	inst_addi;
wire	inst_ori;
wire	inst_andi;
wire	inst_slli;		//立即数逻辑左移
wire	inst_slti;		//小于立即数则置位有符号比较
wire	inst_sltiu;		//小于立即数则置位，无符号数
wire	inst_srai_srli;		//立即数算术右移
wire	inst_xori;		//立即数异或
wire	inst_lb;		//字节加载
wire	inst_lbu;		//无符号字节加载
wire	inst_lh;		//半字加载
wire	inst_lhu;		//无符号半字加载
wire	inst_lw;		//字加载
wire	inst_lwu;		//无符号字加载
wire	inst_ld;		//双字加载
wire	inst_jalr;		//寄存器链接跳转
wire	inst_addiw;		//加立即数字
wire	inst_slliw;		//立即数逻辑左移字
wire	inst_srliw_sraiw;	//立即数逻辑右移字，立即数算术右移字
//CSR
wire	inst_csrrw;		//原子性交换CSR
wire	inst_csrrs;		//atomic read and set bits
wire	inst_csrrc;		//atomic read and clear bits
wire	inst_csrrwi;
wire	inst_csrrsi;
wire	inst_csrrci;

assign	inst_addi = (inst_opcode == 8'b000_00100) ? 1'b1 : 1'b0;
assign	inst_ori = (inst_opcode == 8'b110_00100) ? 1'b1 : 1'b0;
assign	inst_andi = (inst_opcode == 8'b111_00100) ? 1'b1 : 1'b0;
assign	inst_slli = (inst_opcode == 8'b001_00100) ? 1'b1 : 1'b0;
assign	inst_slti = (inst_opcode == 8'b010_00100) ? 1'b1 : 1'b0;
assign	inst_sltiu = (inst_opcode == 8'b011_00100) ? 1'b1 : 1'b0;
assign	inst_srai_srli = (inst_opcode == 8'b101_00100) ? 1'b1 : 1'b0;
assign	inst_xori = (inst_opcode == 8'b100_00100) ? 1'b1 : 1'b0;
assign	inst_lb = ((inst_opcode == 8'b000_00000) & (inst != 32'd0)) ? 1'b1 : 1'b0;
assign	inst_lbu = (inst_opcode == 8'b100_00000) ? 1'b1 : 1'b0;
assign	inst_lh = (inst_opcode == 8'b001_00000) ? 1'b1 : 1'b0;
assign	inst_lhu = (inst_opcode == 8'b101_00000) ? 1'b1 : 1'b0;
assign	inst_lw = (inst_opcode == 8'b010_00000) ? 1'b1 : 1'b0;
assign	inst_lwu = (inst_opcode == 8'b110_00000) ? 1'b1 : 1'b0;
assign	inst_jalr = (inst_opcode == 8'b000_11001) ? 1'b1 :1'b0;
assign	inst_ld = (inst_opcode == 8'b011_00000) ? 1'b1 : 1'b0;
assign	inst_addiw = (inst_opcode == 8'b000_00110) ? 1'b1 : 1'b0;
assign	inst_slliw = (inst_opcode == 8'b001_00110) ? 1'b1 : 1'b0;
assign	inst_srliw_sraiw = (inst_opcode == 8'b101_00110) ? 1'b1 : 1'b0;
assign	inst_csrrw = (inst_opcode == 8'b001_11100) ? 1'b1 : 1'b0;
assign	inst_csrrs = (inst_opcode == 8'b010_11100) ? 1'b1 : 1'b0;
assign	inst_csrrc = (inst_opcode == 8'b011_11100) ? 1'b1 : 1'b0;
assign	inst_csrrwi = (inst_opcode == 8'b101_11100) ? 1'b1 : 1'b0;
assign	inst_csrrsi = (inst_opcode == 8'b110_11100) ? 1'b1 : 1'b0;
assign	inst_csrrci = (inst_opcode == 8'b111_11100) ? 1'b1 : 1'b0;
//R-type
wire	inst_add_sub;
wire	inst_and;
wire	inst_or;
wire	inst_xor;
wire	inst_srl_sra;		//逻辑右移
wire	inst_sll;		//逻辑左移
wire	inst_slt;		//小于则置位
wire	inst_sltu;		//无符号小于则置位
wire	inst_addw_subw;		//加字
wire	inst_sllw;		//逻辑左移字
wire	inst_sraw_srlw;		//逻辑右移字
//wire	inst_sra;		//算术右移
//wire	inst_sub;

assign	inst_add_sub = (inst_opcode == 8'b000_01100) ? 1'b1 : 1'b0;
assign	inst_and = (inst_opcode == 8'b111_01100) ? 1'b1 : 1'b0;
assign	inst_or = (inst_opcode == 8'b110_01100) ? 1'b1 : 1'b0;
assign	inst_xor = (inst_opcode == 8'b100_01100) ? 1'b1 : 1'b0;
assign	inst_srl_sra = (inst_opcode == 8'b101_01100) ? 1'b1 : 1'b0;
assign	inst_sll = (inst_opcode == 8'b001_01100) ? 1'b1 : 1'b0;
assign	inst_slt = (inst_opcode == 8'b010_01100) ? 1'b1 : 1'b0;
assign	inst_sltu = (inst_opcode == 8'b011_01100) ? 1'b1 : 1'b0;
assign	inst_addw_subw = (inst_opcode == 8'b000_01110) ? 1'b1 : 1'b0;
assign	inst_sllw = (inst_opcode == 8'b001_01110) ? 1'b1 : 1'b0;
assign	inst_sraw_srlw = (inst_opcode == 8'b101_01110) ? 1'b1 : 1'b0;
//assign	inst_sra = (inst_opcode == 8'b101_01100) ? 1'b1 : 1'b0;

//S-type
wire	inst_sb;		//字节存储
wire	inst_sh;		//半字存储
wire	inst_sw;		//字存储
wire	inst_sd;		//双字存储
assign	inst_sb = (inst_opcode == 8'b000_01000) ? 1'b1 : 1'b0;
assign	inst_sh = (inst_opcode == 8'b001_01000) ? 1'b1 : 1'b0;
assign	inst_sw = (inst_opcode == 8'b010_01000) ? 1'b1 : 1'b0;
assign	inst_sd = (inst_opcode == 8'b011_01000) ? 1'b1 : 1'b0;

//B-type
wire	inst_beq;		//branch if equal
wire	inst_bne;		//branch if not equal
wire	inst_blt;		//branch if lower than
wire	inst_bge;		//branch if greater and equal
wire	inst_bltu;		//无符号，branch if lower than
wire	inst_bgeu;		//无符号,branch if greater and equal
assign	inst_beq = (inst_opcode == 8'b000_11000) ? 1'b1 : 1'b0;
assign	inst_bne = (inst_opcode == 8'b001_11000) ? 1'b1 : 1'b0;
assign	inst_blt = (inst_opcode == 8'b100_11000) ? 1'b1 : 1'b0;
assign	inst_bge = (inst_opcode == 8'b101_11000) ? 1'b1 : 1'b0;
assign	inst_bltu = (inst_opcode == 8'b110_11000) ? 1'b1 : 1'b0;
assign	inst_bgeu = (inst_opcode == 8'b111_11000) ? 1'b1 : 1'b0;


//U-type
wire	inst_lui;		//高位立即数加载
wire	inst_auipc;		//x[rd] = pc + (imm<<12)
assign	inst_lui = (opcode[6:2] == 5'b01101) ? 1'b1 : 1'b0;
assign	inst_auipc = (opcode[6:2] == 5'b00101) ? 1'b1 : 1'b0;

//J-type
wire	inst_jal;		//jump and link
assign	inst_jal = (opcode[6:2] == 5'b11011) ? 1'b1 : 1'b0;


//ecall
wire	inst_ecall;
assign	inst_ecall = (inst_opcode == 8'b000_11100) ? 
					((funct7 == 7'b0000000) ? 1'b1 : 1'b0) : 1'b0;
wire	inst_mret;
assign	inst_mret = (inst_opcode == 8'b000_11100) ?
					((funct7 == 7'b0011000) ? 1'b1 : 1'b0) : 1'b0;
wire	[5:0]	inst_type;
/*-------------------------------obtain the inst_type-----------------------------*/
//R-type = 00_0001; I-type = 00_0010; S-type = 00_0100;
//B-type = 00_1000; U-type = 01_0000; J-type = 10_0000;
assign inst_type[0] = (rst == 1'b1) ? 1'b0 : (inst_add_sub | inst_and | inst_or | inst_xor
											| inst_srl_sra | inst_sll | inst_slt | inst_sltu
											| inst_addw_subw | inst_sllw | inst_sraw_srlw);
assign inst_type[1] = (rst == 1'b1) ? 1'b0 : (inst_addi | inst_ori | inst_andi | inst_slli 
											| inst_slti | inst_sltiu | inst_srai_srli | inst_xori
											| inst_lb | inst_lbu | inst_lh | inst_lhu
											| inst_lw | inst_lwu | inst_jalr | inst_ld
											| inst_addiw | inst_slliw | inst_srliw_sraiw
											| inst_csrrw | inst_csrrs | inst_csrrc 
											| inst_csrrwi | inst_csrrsi | inst_csrrci);
assign inst_type[2] = (rst == 1'b1) ? 1'b0 : (inst_sb | inst_sh | inst_sw | inst_sd);
assign inst_type[3] = (rst == 1'b1) ? 1'b0 : (inst_beq | inst_bne | inst_blt | inst_bge | inst_bltu | inst_bgeu);
assign inst_type[4] = (rst == 1'b1) ? 1'b0 : (inst_lui | inst_auipc);
assign inst_type[5] = (rst == 1'b1) ? 1'b0 : inst_jal;


//wire	csr_imm_ena;							//csr立即数
//wire	[`YSYX210195_PC_REG_DATA_LEN-1:0]	csr_imm;
assign	csr_imm_ena = inst_csrrwi | inst_csrrsi | inst_csrrci; 
assign	csr_imm = csr_imm_ena ? {{(`YSYX210195_PC_REG_DATA_LEN-5){1'b0}},rs1_or_imm} : 64'd0;

/*-----------define the reg enable signal and addr,obtain the operands---------------*/
always @(*)
  begin
    case(inst_type)
      6'b000001:      //R-type
        begin
			rs2_r_ena = (rst == 1'b1) ? 1'b0 : 1'b1;
			rs1_r_ena = (rst == 1'b1) ? 1'b0 : 1'b1;
			rd_w_ena = (rst == 1'b1) ? 1'b0 : 1'b1;
			
			op2 = (rst == 1'b1) ? {`YSYX210195_PC_REG_DATA_LEN{1'b0}} : rs2_data;
			op1 = (rst == 1'b1) ? {`YSYX210195_PC_REG_DATA_LEN{1'b0}} : rs1_data;
			extend_imm = {`YSYX210195_PC_REG_DATA_LEN{1'b0}};

        end
      6'b000010:      //I-type
        begin
			rs2_r_ena = 1'b0;
			rs1_r_ena = (rst == 1'b1) ? 1'b0 : (inst_addi | inst_ori | inst_andi | inst_slli 
											| inst_slti | inst_sltiu | inst_srai_srli | inst_xori
											| inst_lb | inst_lbu | inst_lh | inst_lhu
											| inst_lw | inst_lwu | inst_jalr | inst_ld
											| inst_addiw | inst_slliw | inst_srliw_sraiw
											| inst_csrrw | inst_csrrs | inst_csrrc);
			rd_w_ena = (rst == 1'b1) ? 1'b0 : 1'b1;
			
			op2 = (rst == 1'b1) ? {`YSYX210195_PC_REG_DATA_LEN{1'b0}} : {{(`YSYX210195_PC_REG_DATA_LEN-12){imm[6]}} , imm[6:0] , rs2_or_imm[4:0]};
			op1 = (rst == 1'b1) ? {`YSYX210195_PC_REG_DATA_LEN{1'b0}} : rs1_data;
			extend_imm = (rst == 1'b1) ? {`YSYX210195_PC_REG_DATA_LEN{1'b0}} : {{(`YSYX210195_PC_REG_DATA_LEN-12){imm[6]}} , imm[6:0] , rs2_or_imm[4:0]};

        end
      6'b000100: 		//S-type
        begin
			rs2_r_ena = (rst == 1'b1) ? 1'b0 : 1'b1;
			rs1_r_ena = (rst == 1'b1) ? 1'b0 : 1'b1;
			rd_w_ena = 1'b0;
			
			op2 = (rst == 1'b1) ? {`YSYX210195_PC_REG_DATA_LEN{1'b0}} : rs2_data;
			op1 = (rst == 1'b1) ? {`YSYX210195_PC_REG_DATA_LEN{1'b0}} : rs1_data;
			extend_imm = (rst == 1'b1) ? {`YSYX210195_PC_REG_DATA_LEN{1'b0}} : {{(`YSYX210195_PC_REG_DATA_LEN-12){imm[6]}},imm[6:0],rd_or_imm[4:0]};

        end
      6'b001000: 		//B-type
        begin
			rs2_r_ena = (rst == 1'b1) ? 1'b0 : 1'b1;
			rs1_r_ena = (rst == 1'b1) ? 1'b0 : 1'b1;
			rd_w_ena = 1'b0;
			
			op2 = (rst == 1'b1) ? {`YSYX210195_PC_REG_DATA_LEN{1'b0}} : rs2_data;
			op1 = (rst == 1'b1) ? {`YSYX210195_PC_REG_DATA_LEN{1'b0}} : rs1_data;
			extend_imm = (rst == 1'b1) ? {`YSYX210195_PC_REG_DATA_LEN{1'b0}} : {{(`YSYX210195_PC_REG_DATA_LEN-13){imm[6]}},imm[6],rd_or_imm[0],imm[5:0],rd_or_imm[4:1],1'b0};
        end
      6'b010000: 		//U-type
        begin
			rs2_r_ena = 1'b0;
			rs1_r_ena = 1'b0;
			rd_w_ena = (rst == 1'b1) ? 1'b0 : 1'b1;
			
			op2 = {`YSYX210195_PC_REG_DATA_LEN{1'b0}};
			op1 = {`YSYX210195_PC_REG_DATA_LEN{1'b0}};
			extend_imm = {{(`YSYX210195_PC_REG_DATA_LEN-32){imm[6]}},imm[6:0],rs2_or_imm[4:0],rs1_or_imm[4:0],func_or_imm[2:0],12'd0};
        end
      6'b100000:		//J-type
        begin
			rs2_r_ena = 1'b0;
			rs1_r_ena = 1'b0;
			rd_w_ena = (rst == 1'b1) ? 1'b0 : 1'b1; 
			
			op2 = {`YSYX210195_PC_REG_DATA_LEN{1'b0}};
			op1 = {`YSYX210195_PC_REG_DATA_LEN{1'b0}};
			extend_imm = {{(`YSYX210195_PC_REG_DATA_LEN-21){imm[6]}},imm[6],rs1_or_imm[4:0],func_or_imm[2:0],rs2_or_imm[0],imm[5:0],rs2_or_imm[4:1],1'b0};
        end		
      default:
		begin
			rs2_r_ena = 1'b0;
			rs1_r_ena = 1'b0;
			rd_w_ena = 1'b0;
			
			op2 = {`YSYX210195_PC_REG_DATA_LEN{1'b0}};
			op1 = {`YSYX210195_PC_REG_DATA_LEN{1'b0}};
			extend_imm = {`YSYX210195_PC_REG_DATA_LEN{1'b0}};

		end
	endcase
  end

/*-----------------------------define the reg enable signal and addr-----------------------*/
//assign rs2_r_ena = (rst == 1'b1) ? 1'b0 : ~(inst_type[1] | inst_type[4] | inst_type[5]);
//assign rs1_r_ena = (rst == 1'b1) ? 1'b0 : ~(inst_type[4] | inst_type[5]);
//assign rd_w_ena = (rst == 1'b1) ? 1'b0 : ~(inst_type[2] | inst_type[3]);


assign rs2_r_addr = (rs2_r_ena == 1'b1) ? rs2_or_imm : 5'd0;
assign rs1_r_addr = (rs1_r_ena == 1'b1) ? rs1_or_imm : 5'd0;
assign rd_w_addr = (rd_w_ena == 1'b1) ? rd_or_imm : 5'd0;

/*----------------------------obtain the operands------------------------------*/
//assign op2 = (inst_type[1]) ? {{52{imm[6]}} , imm[6:0] , rs2_or_imm[4:0]} : 0;
//assign op1 = (inst_type[1]) ? rs1_data : 0;


endmodule


//`include "defines.v"

//----------------------------------------------------------------
//Module Name : IDEX_reg.v
//Description of module:
//
//----------------------------------------------------------------
//Designer:	Tang Pengyu
//Date: 2021/9/27/20:13  
//----------------------------------------------------------------

module ysyx_210195_IDEX_reg(
	input	clk,
	input	reset,
	input	handshake_done,
	input	idex_rst,
	input	idex_ena,
	
	input	i_id_rs1_r_ena,				//--csr_reg,regfile
	input	[4:0]	i_id_rs1_r_addr,	//--csr_reg,regfile
//	input	i_id_rs2_r_ena,				//--regfile
//	input	[4:0]	i_id_rs2_r_addr,	//--regfile
	input	i_id_rd_w_ena,				//--csr_reg,regfile
	input	[4:0]	i_id_rd_w_addr,		//--csr_reg,regfile
	input	i_id_csr_imm_ena,			
	input	[`YSYX210195_PC_REG_DATA_LEN-1:0]	i_id_csr_imm,		//--ls_pro
//	input	[5:0]	i_id_inst_type,
	input	[7:0]	i_id_inst_opcode,
	input	[`YSYX210195_PC_REG_DATA_LEN-1:0]	i_id_op1,
	input	[`YSYX210195_PC_REG_DATA_LEN-1:0]	i_id_op2,			//--mem
	input	[`YSYX210195_PC_REG_DATA_LEN-1:0]	i_id_extend_imm,
	input	[6:0]	i_id_funct7,
//from ctrlid
	input	[1:0]	i_ctrlid_wb_sel,			//regfile
	input	i_ctrlid_ecall_en,					//wb
	input	i_ctrlid_mret_en,					//wb
	input	i_ctrlid_load_mem_en,
//from	if	
//	input	i_ifif_fetched,
//	input	i_ifif_time_intr_r,
	input	[`YSYX210195_PC_INST_ADDR_LEN-1:0] i_ifif_pc_out,
//	input	[`YSYX210195_PC_INST_ADDR_LEN-1:0] i_ifif_addr,	
	
	output	reg o_id_rs1_r_ena,
	output	reg [4:0]	o_id_rs1_r_addr,
//	output	reg o_id_rs2_r_ena,
//	output	reg [4:0]	o_id_rs2_r_addr,
	output	reg o_id_rd_w_ena,
	output	reg [4:0]	o_id_rd_w_addr,
	output	reg o_id_csr_imm_ena,
	output	reg [`YSYX210195_PC_REG_DATA_LEN-1:0]	o_id_csr_imm,
//	output	reg [5:0]	o_id_inst_type,
	output	reg [7:0]	o_id_inst_opcode,
	output	reg [`YSYX210195_PC_REG_DATA_LEN-1:0]	o_id_op1,
	output	reg [`YSYX210195_PC_REG_DATA_LEN-1:0]	o_id_op2,
	output	reg [`YSYX210195_PC_REG_DATA_LEN-1:0]	o_id_extend_imm,
	output	reg [6:0]	o_id_funct7,
	
	output	reg	[1:0]	o_ctrlid_wb_sel,
	output	reg o_ctrlid_ecall_en,
	output	reg o_ctrlid_mret_en,
	output	reg o_ctrlid_load_mem_en,
	
//	output	reg o_ifif_fetched,
//	output	reg o_ifif_time_intr_r,
	output	reg [`YSYX210195_PC_INST_ADDR_LEN-1:0] o_ifif_pc_out
//	output	reg [`YSYX210195_PC_INST_ADDR_LEN-1:0] o_ifif_addr
);

always @(posedge clk)	begin
	if(reset)	begin
		o_id_rs1_r_ena <= 1'b0;
		o_id_rs1_r_addr <= 5'd0;
//		o_id_rs2_r_ena <= 1'b0;
//		o_id_rs2_r_addr <= 5'd0;
		o_id_rd_w_ena <= 1'b0;
		o_id_rd_w_addr <= 5'd0;
		o_id_csr_imm_ena <= 1'b0;
		o_id_csr_imm <= {`YSYX210195_PC_REG_DATA_LEN{1'b0}};
//		o_id_inst_type <= 6'd0;
		o_id_inst_opcode <= 8'b000_00100;
		o_id_op1 <= {`YSYX210195_PC_REG_DATA_LEN{1'b0}};
		o_id_op2 <= {`YSYX210195_PC_REG_DATA_LEN{1'b0}};
		o_id_extend_imm <= {`YSYX210195_PC_REG_DATA_LEN{1'b0}};
		o_id_funct7 <= 7'd0;
		
		o_ctrlid_wb_sel <= 2'b00;
		o_ctrlid_ecall_en <= 1'b0;
		o_ctrlid_mret_en <= 1'b0;
		o_ctrlid_load_mem_en <= 1'b0;
		
//		o_ifif_fetched <= 1'b0;
//		o_ifif_time_intr_r <= 1'b0;
		o_ifif_pc_out <= {`YSYX210195_PC_INST_ADDR_LEN{1'b0}};
//		o_ifif_addr <= {`YSYX210195_PC_INST_ADDR_LEN{1'b0}};
	
	end
	else if(handshake_done)	begin
		if(idex_rst)	begin
			o_id_rs1_r_ena <= 1'b0;
			o_id_rs1_r_addr <= 5'd0;
//			o_id_rs2_r_ena <= 1'b0;
//			o_id_rs2_r_addr <= 5'd0;
			o_id_rd_w_ena <= 1'b0;
			o_id_rd_w_addr <= 5'd0;
			o_id_csr_imm_ena <= 1'b0;
			o_id_csr_imm <= {`YSYX210195_PC_REG_DATA_LEN{1'b0}};
//			o_id_inst_type <= 6'd0;
			o_id_inst_opcode <= 8'b000_00100;
			o_id_op1 <= {`YSYX210195_PC_REG_DATA_LEN{1'b0}};
			o_id_op2 <= {`YSYX210195_PC_REG_DATA_LEN{1'b0}};
			o_id_extend_imm <= {`YSYX210195_PC_REG_DATA_LEN{1'b0}};
			o_id_funct7 <= 7'd0;
		
			o_ctrlid_wb_sel <= 2'b00;
			o_ctrlid_ecall_en <= 1'b0;
			o_ctrlid_mret_en <= 1'b0;
			o_ctrlid_load_mem_en <= 1'b0;
		
//			o_ifif_fetched <= 1'b0;
//			o_ifif_time_intr_r <= 1'b0;
			o_ifif_pc_out <= {`YSYX210195_PC_INST_ADDR_LEN{1'b0}};
//			o_ifif_addr <= {`YSYX210195_PC_INST_ADDR_LEN{1'b0}};
		end
		else if(idex_ena)	begin
			o_id_rs1_r_ena <= i_id_rs1_r_ena;
			o_id_rs1_r_addr <= i_id_rs1_r_addr;
//			o_id_rs2_r_ena <= i_id_rs2_r_ena;
//			o_id_rs2_r_addr <= i_id_rs2_r_addr;
			o_id_rd_w_ena <= i_id_rd_w_ena;
			o_id_rd_w_addr <= i_id_rd_w_addr;
			o_id_csr_imm_ena <= i_id_csr_imm_ena;
			o_id_csr_imm <= i_id_csr_imm;
//			o_id_inst_type <= i_id_inst_type;
			o_id_inst_opcode <= i_id_inst_opcode;
			o_id_op1 <= i_id_op1;
			o_id_op2 <= i_id_op2;
			o_id_extend_imm <= i_id_extend_imm;
			o_id_funct7 <= i_id_funct7;
		
			o_ctrlid_wb_sel <= i_ctrlid_wb_sel;
			o_ctrlid_ecall_en <= i_ctrlid_ecall_en;
			o_ctrlid_mret_en <= i_ctrlid_mret_en;
			o_ctrlid_load_mem_en <= i_ctrlid_load_mem_en;
		
//			o_ifif_fetched <= i_ifif_fetched;
//			o_ifif_time_intr_r <= i_ifif_time_intr_r;
			o_ifif_pc_out <= i_ifif_pc_out;
//			o_ifif_addr <= i_ifif_addr;
		end
	end
end


endmodule

//`include "defines.v"

//----------------------------------------------------------------
//Module Name : if_stage.v
//Description of module:
//instration fetch 
//----------------------------------------------------------------
//Designer:	Tang Pengyu
//Date: 2021/07/13/20:41	  
//----------------------------------------------------------------

module ysyx_210195_if_stage(
	input	clk,
	input	rst,							//high work
	input	[`YSYX210195_PC_REG_DATA_LEN-1:0] exe_data,	//use when jalr,branch
//when ecall	
	input	ecall_en,
	input	mret_en,
	input	[63:0]	mtvec,
	input	[63:0]	mepc,
	
	input	if_addr_ctrl,
	
//	input	MTIP,			//计时器中断
//	output	time_intr_r,		//高相应中断
	input	time_intr_r,
	
	input	pc_sel,
  
	output	reg [`YSYX210195_PC_INST_ADDR_LEN-1:0] if_addr,		//指令寄存器地址
//	output	reg [`YSYX210195_PC_INST_ADDR_LEN-1:0] pc_add,
//	output	inst_ena,
	output	reg	[`YSYX210195_PC_INST_LEN-1:0]	inst,
	
	output	reg [`YSYX210195_PC_INST_ADDR_LEN-1:0] pc_out,

	output	if_valid,
	input	if_ready,
	input	[63:0]	inst_data_read,
	output	[1:0]	if_size,
	input	[1:0]	if_resp,
	output	if_req,
//	output	handshake_done,
	
	output	reg	fetched
		);
		
//reg	[`YSYX210195_PC_INST_ADDR_LEN-1 : 0]	pc;
wire	handshake_done;
assign	handshake_done = if_valid & if_ready;

reg [`YSYX210195_PC_INST_ADDR_LEN-1:0] pc_add;

always @(posedge clk)			//同步复位
  begin
	if(rst)
		pc_add <= 0;
	else
		pc_add <= if_addr + 4;
  end
wire	[`YSYX210195_PC_INST_ADDR_LEN-1:0]	pc_next;

assign	pc_next = (pc_sel == 1'b0) ? pc_add : 
					(ecall_en | time_intr_r) ? {mtvec[63:2],2'b00} :			//异常、中断时跳转到入口地址
					mret_en ? {mepc[63:2],2'b00} :
					{exe_data[`YSYX210195_PC_INST_ADDR_LEN-1:2],2'b00} ;
/*
assign	pc_next = (pc_sel == 1'b0) ? pc_add : 
					(ecall_en | time_intr_r) ? mtvec :			//异常、中断时跳转到入口地址
					mret_en ? mepc :
					exe_data ;					
*/
/*
reg		[`YSYX210195_PC_INST_ADDR_LEN-1:0]	pc_next_r1;
reg		[`YSYX210195_PC_INST_ADDR_LEN-1:0]	pc_next_r2;
always @(posedge clk)	begin
	pc_next_r1 <= pc_next;
	pc_next_r2 <= pc_next_r1;

end
*/					
wire		inst_useful;		//用于处理中断的指令作废信号，低 指令作废
assign	inst_useful = ~time_intr_r;

always @(posedge clk)
  begin
	if(rst)	begin
//		if_addr <= `YSYX210195_PC_PC_START;
		pc_out <= `YSYX210195_PC_PC_START;
		fetched <= 1'b0;
		inst <= `YSYX210195_PC_INST_NOP;
	end
	else if(handshake_done)	begin
//		if_addr <= pc_next;
		pc_out <= inst_useful ? if_addr : 64'd0;
		fetched <= 1'b1;
		inst <= inst_useful ? inst_data_read[31:0] : `YSYX210195_PC_INST_NOP;
	end
	else	begin
		fetched <= 1'b0;
	end
  end
  
//if_addr
always @(posedge clk)
  begin
	if(rst)
		if_addr <= `YSYX210195_PC_PC_START;
	else if(fetched)
		if_addr <= if_addr_ctrl ? pc_next : if_addr;
	else
		if_addr <= if_addr;
  
  end
  
  
//inst_useful

//always @(posedge handshake_done)	begin
//	inst_useful = MTIP ? 1'b0 : 1'b1;
//end

//assign	inst_ena = (rst == 1'b1) ? 1'b0 : 1'b1;
assign	if_valid = (rst == 1'b1) ? 1'b0 : 
					(fetched == 1'b1) ? 1'b0 : 1'b1;
assign	if_size = `YSYX210195_PC_SIZE_W;
assign	if_req = `YSYX210195_PC_REQ_READ;

endmodule

//`include "defines.v"

//----------------------------------------------------------------
//Module Name : IFID_reg.v
//Description of module:
//
//----------------------------------------------------------------
//Designer:	Tang Pengyu
//Date: 2021/9/27/17:14	  
//----------------------------------------------------------------

module ysyx_210195_IFID_reg(
	input	clk,
	input	reset,
	input	ifid_rst,
	input	handshake_done,
	input	ifid_ena,
	
//	input	i_if_time_intr_r,
//	input	i_if_inst_ena,
	input	[`YSYX210195_PC_INST_LEN-1:0]	i_if_inst,
	input	[`YSYX210195_PC_INST_ADDR_LEN-1:0] i_if_pc_out,
//	input	i_if_fetched,
//	input	[`YSYX210195_PC_INST_ADDR_LEN-1:0] i_if_addr,
	
//	output	reg	o_if_time_intr_r,
//	output	reg	o_if_inst_ena,
	output	reg	[`YSYX210195_PC_INST_LEN-1:0] o_if_inst,
	output	reg	[`YSYX210195_PC_INST_ADDR_LEN-1:0] o_if_pc_out
//	output	reg	o_if_fetched,
//	output	reg	[`YSYX210195_PC_INST_ADDR_LEN-1:0] o_if_addr
	);
	
always @(posedge clk)	begin
	if(reset)	begin
		o_if_inst <= `YSYX210195_PC_INST_NOP;
		o_if_pc_out <= {`YSYX210195_PC_INST_ADDR_LEN{1'b0}};
	
	end
	else if(handshake_done)	begin
		if(ifid_rst)	begin
//		o_if_time_intr_r <= 1'b0;
//		o_if_inst_ena <= 1'b0;
			o_if_inst <= `YSYX210195_PC_INST_NOP;
			o_if_pc_out <= {`YSYX210195_PC_INST_ADDR_LEN{1'b0}};
//		o_if_fetched <= 1'b0;
//		o_if_addr <= {`YSYX210195_PC_INST_ADDR_LEN{1'b0}};
		end
	
		else if(ifid_ena)	begin
//		o_if_time_intr_r <= i_if_time_intr_r;
//		o_if_inst_ena <= i_if_inst_ena;
			o_if_inst <= i_if_inst;
			o_if_pc_out <= i_if_pc_out;
//		o_if_fetched <= i_if_fetched;
//		o_if_addr <= i_if_addr;
	
		end
	end
end


endmodule

//`include "defines.v"

//----------------------------------------------------------------
//Module Name : intr_pro.v
//Description of module:
//
//----------------------------------------------------------------
//Designer:	Tang Pengyu
//Date: 2021/10/03/09:23 
//----------------------------------------------------------------

module ysyx_210195_intr_pro(
	input	clk,
	input	reset,
	input	if_fetched,
	input	if_addr_ctrl,
	input	MTIP,
	output	reg time_intr_r
);
reg		if_fetched_r1;
reg		if_fetched_r2;
//reg		if_fetched_r3;
always @(posedge clk)	begin
	if(reset)	begin
		if_fetched_r1 <= 1'b0;
		if_fetched_r2 <= 1'b0;
//		if_fetched_r3 <= 1'b0;
	end
	else	begin
		if_fetched_r1 <= if_fetched;
		if_fetched_r2 <= if_fetched_r1;
//		if_fetched_r3 <= if_fetched_r2;
	end
end
always @(posedge clk)	begin
	if(reset)
		time_intr_r <= 1'b0;
	else if(if_fetched_r2 && if_addr_ctrl)
		time_intr_r <= MTIP ? 1'b1 : 1'b0;
end

endmodule

//`include "defines.v"

//----------------------------------------------------------------
//Module Name : ls_pro
//Description of module:
//process the load and store inst 
//----------------------------------------------------------------
//Designer:	Tang Pengyu
//Date: 2021/09/13	  
//----------------------------------------------------------------

module ysyx_210195_ls_pro(
//from axi_arbi	
	input	clk,
	input	reset,
	input	ls_ready_i,
	input	[63:0]	load_data_i,	
	input	[1:0]	ls_resp,
	
	input	if_hs,
	
	input	load_axi_en,
	input	store_axi_en,
	input	[7:0]	inst_opcode,
	
//to axi4	
	output	ls_valid_o,
	output	ls_req_o,
//	output 	[63:0]	ls_addr_o,
//	output	[63:0]	store_data_o,
	output	reg [1:0]	ls_size_o,
//to reg
	output	reg [63:0]	mem_ld_data			//->reg
//	output	reg	load_fetched	
	);

wire	ls_hs;
assign	ls_hs = ls_valid_o & ls_ready_i;
reg		ls_valid_en;
//reg		ls_fetched;
/*
always @(posedge if_fetched or posedge ls_fetched)
  begin
	else if(ls_fetched)
		ls_valid_en <= 1'b0;
	else
		ls_valid_en <= 1'b1;
  end
*/
always @(posedge clk)	begin
	if(reset)
		ls_valid_en <= 1'b0;
	else if(ls_hs)
		ls_valid_en <= 1'b0;
	else if(if_hs)
		ls_valid_en <= 1'b1;
	else
		ls_valid_en <= ls_valid_en;

end  
assign	ls_valid_o = ls_valid_en ? (load_axi_en | store_axi_en) : 1'b0;
assign	ls_req_o = store_axi_en ? `YSYX210195_PC_REQ_WRITE : `YSYX210195_PC_REQ_READ;			//默认情况下read


always @(*)
  begin
	case(inst_opcode)
		8'b000_01000,8'b000_00000,8'b100_00000:		//sb,lb,lbu
			ls_size_o = `YSYX210195_PC_SIZE_B;
		8'b001_01000,8'b001_00000,8'b101_00000:		//sh,lh,lhu
			ls_size_o = `YSYX210195_PC_SIZE_H;
		8'b010_01000,8'b010_00000,8'b110_00000:		//sw,lw,lwu
			ls_size_o = `YSYX210195_PC_SIZE_W;
		8'b011_01000,8'b011_00000:		//sd,ld
			ls_size_o = `YSYX210195_PC_SIZE_D;
		default:
			ls_size_o = 2'b00;
	endcase
  end

always @(posedge clk)
  begin
	if(reset)	begin
//		load_fetched <= 1'b0;
//		ls_fetched <= 1'b0;
		mem_ld_data <= 64'd0;
	end
	else if(ls_hs)	begin
//		load_fetched <= load_axi_en ? 1'b1 : 1'b0;
//		ls_fetched <= 1'b1;
		mem_ld_data <= (inst_opcode == 8'b000_00000) ? {{56{load_data_i[7]}},load_data_i[7:0]} : 	//lb
					(inst_opcode == 8'b100_00000) ? {{56{1'b0}},load_data_i[7:0]} :			//lbu
					(inst_opcode == 8'b001_00000) ? {{48{load_data_i[15]}},load_data_i[15:0]} : 	//lh
					(inst_opcode == 8'b101_00000) ? {{48{1'b0}},load_data_i[15:0]} : 		//lhu
					(inst_opcode == 8'b010_00000) ? {{32{load_data_i[31]}},load_data_i[31:0]} : 	//lw
					(inst_opcode == 8'b110_00000) ? {{32{1'b0}},load_data_i[31:0]} :		//lwu
					(inst_opcode == 8'b011_00000) ? load_data_i : 64'd0;					//ld
	end
//	else	begin
//		load_fetched <= 1'b0;
//		ls_fetched <= 1'b0;
		
//	end
  end


endmodule

//`include "defines.v"

//----------------------------------------------------------------
//Module Name : MEMWB_reg.v
//Description of module:
//
//----------------------------------------------------------------
//Designer:	Tang Pengyu
//Date: 2021/9/28/15:16  
//----------------------------------------------------------------
module ysyx_210195_MEMWB_reg(
	input	clk,
	input	reset,
	input	handshake_done,
	input	memwb_rst,
	input	memwb_ena,
//from if
	input	[`YSYX210195_PC_INST_ADDR_LEN-1:0]	i_ifififif_pc_out,
//	input	i_ifififif_fetched,
//	input	i_ifififif_time_intr_r,
//	input	[`YSYX210195_PC_INST_ADDR_LEN-1:0]	i_ifififif_addr,
	
//from id
//	input	i_ididid_rs1_r_ena,				//--csr_reg,regfile
//	input	[4:0]	i_ididid_rs1_r_addr,	//--csr_reg,regfile
//	input	i_ididid_rs2_r_ena,				//--regfile
//	input	[4:0]	i_ididid_rs2_r_addr,	//--regfile
	input	i_ididid_rd_w_ena,				//--csr_reg,regfile
	input	[4:0]	i_ididid_rd_w_addr,		//--csr_reg,regfile
	input	[`YSYX210195_PC_REG_DATA_LEN-1:0] i_ididid_op2,	//rge
//from ctrlid
	input	[1:0]	i_ctrlidctrlidctrlid_wb_sel,			//regfile
	input	i_ctrlidctrlidctrlid_ecall_en,					//wb
	input	i_ctrlidctrlidctrlid_mret_en,					//wb
//from exe
	input	[`YSYX210195_PC_REG_DATA_LEN-1:0]	i_exeexe_data,		//--WB
//from CSR_UNIT
	input	[11:0]	i_csrunitcsrunit_csr_addr,		//wb
	input	i_csrunitcsrunit_csr_w_ena,			//wb
	input	[`YSYX210195_PC_REG_DATA_LEN-1:0]	i_csrunitcsrunit_csr_w_data,		//wb
	input	i_csrunitcsrunit_csr_r_ena,			//wb
	input	[63:0]	i_csrunitcsrunit_csr_r_data,
//from ctrlexe
	input	i_ctrlexectrlexe_load_axi_en,			//regfile
	input	i_ctrlexectrlexe_load_clint_en,		//regfile
	input	i_ctrlexectrlexe_store_clint_en,

//from	ls_pro
	input	[63:0]	i_lspro_axi_ld_data,
//	input	i_lspro_fetched,
	
//from clint
	input	[63:0]	i_clintclint_load_data,

	output	reg [`YSYX210195_PC_INST_ADDR_LEN-1:0]	o_ifififif_pc_out,
//	output	reg o_ifififif_fetched,
//	output	reg o_ifififif_time_intr_r,
//	output	reg	[`YSYX210195_PC_INST_ADDR_LEN-1:0]	o_ifififif_addr,

//	output	reg o_ididid_rs1_r_ena,				//--csr_reg,regfile
//	output	reg [4:0]	o_ididid_rs1_r_addr,	//--csr_reg,regfile
//	output	reg o_ididid_rs2_r_ena,				//--regfile
//	output	reg [4:0]	o_ididid_rs2_r_addr,	//--regfile
	output	reg o_ididid_rd_w_ena,				//--csr_reg,regfile
	output	reg [4:0]	o_ididid_rd_w_addr,		//--csr_reg,regfile
	output	reg [`YSYX210195_PC_REG_DATA_LEN-1:0] o_ididid_op2,	
	
	output	reg [1:0]	o_ctrlidctrlidctrlid_wb_sel,			//regfile
	output	reg o_ctrlidctrlidctrlid_ecall_en,					//wb
	output	reg o_ctrlidctrlidctrlid_mret_en,					//wb
	
	output	reg [`YSYX210195_PC_REG_DATA_LEN-1:0]	o_exeexe_data,		//--WB
	
	output	reg [11:0]	o_csrunitcsrunit_csr_addr,		//wb
	output	reg o_csrunitcsrunit_csr_w_ena,			//wb
	output	reg [`YSYX210195_PC_REG_DATA_LEN-1:0]	o_csrunitcsrunit_csr_w_data,		//wb
	output	reg o_csrunitcsrunit_csr_r_ena,			//wb
	output	reg [63:0]	o_csrunitcsrunit_csr_r_data,
	
	output	reg o_ctrlexectrlexe_load_axi_en,			//regfile
	output	reg o_ctrlexectrlexe_load_clint_en,		//regfile
	output	reg o_ctrlexectrlexe_store_clint_en,
	
	output	reg [63:0]	o_lspro_axi_ld_data,
//	output	reg o_lspro_fetched,
	
	output	reg [63:0]	o_clintclint_load_data

);
always @(posedge clk)	begin
	if(reset)	begin
		o_ifififif_pc_out <= {`YSYX210195_PC_INST_ADDR_LEN{1'b0}};
//		o_ifififif_fetched <= 1'b0;
//		o_ifififif_time_intr_r <= 1'b0;
//		o_ifififif_addr <= {`YSYX210195_PC_INST_ADDR_LEN{1'b0}};
		
//		o_ididid_rs1_r_ena <= 1'b0;
//		o_ididid_rs1_r_addr <= 5'd0;
//		o_ididid_rs2_r_ena <= 1'b0;
//		o_ididid_rs2_r_addr <= 5'd0;
		o_ididid_rd_w_ena <= 1'b0;
		o_ididid_rd_w_addr <= 5'd0;
		o_ididid_op2 <= {`YSYX210195_PC_REG_DATA_LEN{1'b0}};
		
		o_ctrlidctrlidctrlid_wb_sel <= 2'b00;
		o_ctrlidctrlidctrlid_ecall_en <= 1'b0;
		o_ctrlidctrlidctrlid_mret_en <= 1'b0;
		
		o_exeexe_data <= {`YSYX210195_PC_REG_DATA_LEN{1'b0}};
		
		o_csrunitcsrunit_csr_addr <= 12'd0;
		o_csrunitcsrunit_csr_w_ena <= 1'b0;
		o_csrunitcsrunit_csr_w_data <= {`YSYX210195_PC_REG_DATA_LEN{1'b0}};
		o_csrunitcsrunit_csr_r_ena <= 1'b0;
		o_csrunitcsrunit_csr_r_data <= 64'd0;
		
		o_ctrlexectrlexe_load_axi_en <= 1'b0;
		o_ctrlexectrlexe_load_clint_en <= 1'b0;
		o_ctrlexectrlexe_store_clint_en <= 1'b0;
		
		o_lspro_axi_ld_data <= 64'd0;
//		o_lspro_fetched <= 1'b0;
		
		o_clintclint_load_data <= 64'd0;
	
	end
	else if(handshake_done)	begin
		if(memwb_rst)	begin
			o_ifififif_pc_out <= {`YSYX210195_PC_INST_ADDR_LEN{1'b0}};
//			o_ifififif_fetched <= 1'b0;
//			o_ifififif_time_intr_r <= 1'b0;
//			o_ifififif_addr <= {`YSYX210195_PC_INST_ADDR_LEN{1'b0}};
		
//			o_ididid_rs1_r_ena <= 1'b0;
//			o_ididid_rs1_r_addr <= 5'd0;
//			o_ididid_rs2_r_ena <= 1'b0;
//			o_ididid_rs2_r_addr <= 5'd0;
			o_ididid_rd_w_ena <= 1'b0;
			o_ididid_rd_w_addr <= 5'd0;
			o_ididid_op2 <= {`YSYX210195_PC_REG_DATA_LEN{1'b0}};
		
			o_ctrlidctrlidctrlid_wb_sel <= 2'b00;
			o_ctrlidctrlidctrlid_ecall_en <= 1'b0;
			o_ctrlidctrlidctrlid_mret_en <= 1'b0;
		
			o_exeexe_data <= {`YSYX210195_PC_REG_DATA_LEN{1'b0}};
		
			o_csrunitcsrunit_csr_addr <= 12'd0;
			o_csrunitcsrunit_csr_w_ena <= 1'b0;
			o_csrunitcsrunit_csr_w_data <= {`YSYX210195_PC_REG_DATA_LEN{1'b0}};
			o_csrunitcsrunit_csr_r_ena <= 1'b0;
			o_csrunitcsrunit_csr_r_data <= 64'd0;
		
			o_ctrlexectrlexe_load_axi_en <= 1'b0;
			o_ctrlexectrlexe_load_clint_en <= 1'b0;
			o_ctrlexectrlexe_store_clint_en <= 1'b0;
		
			o_lspro_axi_ld_data <= 64'd0;
//			o_lspro_fetched <= 1'b0;
		
			o_clintclint_load_data <= 64'd0;
	
		end
		else if(memwb_ena)	begin
			o_ifififif_pc_out <= i_ifififif_pc_out;
//			o_ifififif_fetched <= i_ifififif_fetched;
//			o_ifififif_time_intr_r <= i_ifififif_time_intr_r;
//			o_ifififif_addr <= i_ifififif_addr;
		
//			o_ididid_rs1_r_ena <= i_ididid_rs1_r_ena;
//			o_ididid_rs1_r_addr <= i_ididid_rs1_r_addr;
//			o_ididid_rs2_r_ena <= i_ididid_rs2_r_ena;
//			o_ididid_rs2_r_addr <= i_ididid_rs2_r_addr;
			o_ididid_rd_w_ena <= i_ididid_rd_w_ena;
			o_ididid_rd_w_addr <= i_ididid_rd_w_addr;
			o_ididid_op2 <= i_ididid_op2;
		
			o_ctrlidctrlidctrlid_wb_sel <= i_ctrlidctrlidctrlid_wb_sel;
			o_ctrlidctrlidctrlid_ecall_en <= i_ctrlidctrlidctrlid_ecall_en;
			o_ctrlidctrlidctrlid_mret_en <= i_ctrlidctrlidctrlid_mret_en;
		
			o_exeexe_data <= i_exeexe_data;
		
			o_csrunitcsrunit_csr_addr <= i_csrunitcsrunit_csr_addr;
			o_csrunitcsrunit_csr_w_ena <= i_csrunitcsrunit_csr_w_ena;
			o_csrunitcsrunit_csr_w_data <= i_csrunitcsrunit_csr_w_data;
			o_csrunitcsrunit_csr_r_ena <= i_csrunitcsrunit_csr_r_ena;
			o_csrunitcsrunit_csr_r_data <= i_csrunitcsrunit_csr_r_data;
		
			o_ctrlexectrlexe_load_axi_en <= i_ctrlexectrlexe_load_axi_en;
			o_ctrlexectrlexe_load_clint_en <= i_ctrlexectrlexe_load_clint_en;
			o_ctrlexectrlexe_store_clint_en <= i_ctrlexectrlexe_store_clint_en;
		
			o_lspro_axi_ld_data <= i_lspro_axi_ld_data;
//			o_lspro_fetched <= i_lspro_fetched;
		
			o_clintclint_load_data <= i_clintclint_load_data;

		end
	end
end

endmodule

//`include "defines.v"

//----------------------------------------------------------------
//Module Name : regfile.v
//Description of module:
//write_back 
//----------------------------------------------------------------
//Designer:	Tang Pengyu
//Date: 2021/07/15	  
//----------------------------------------------------------------

module ysyx_210195_regfile(
    input	clk,
	input	rst,
	
	input	[4:0]	w_addr,
	input	[`YSYX210195_PC_REG_DATA_LEN-1:0]	exe_data,
	
	input	[`YSYX210195_PC_REG_DATA_LEN-1:0]	csr_r_data,
	input	csr_r_ena,
//	input	[`YSYX210195_PC_REG_DATA_LEN-1:0] mem_ld_data,
	input	[`YSYX210195_PC_REG_DATA_LEN-1:0] load_axi_data,
	input	[`YSYX210195_PC_REG_DATA_LEN-1:0] load_clint_data,
	input	load_axi_en,
	input	load_clint_en,

	input	[`YSYX210195_PC_INST_ADDR_LEN-1:0] pc,
	input	[1:0]	wb_sel,			//10:load_mem,01:pc+4,else exe_data
	input	w_ena,
	
	input	[4:0]	r_addr1,
	output	[`YSYX210195_PC_REG_DATA_LEN-1:0] r_data1,
	input	r_ena1,
	
	input	[4:0]	r_addr2,
	output	[`YSYX210195_PC_REG_DATA_LEN-1:0]	r_data2,
	input	r_ena2
	
//	output	wire [`YSYX210195_PC_REG_DATA_LEN-1:0] regs_o [0:31]
    );
//32 register	
reg	[`YSYX210195_PC_REG_DATA_LEN-1:0] regs [0:31];
wire	[`YSYX210195_PC_REG_DATA_LEN-1:0]	w_data;	
wire	[`YSYX210195_PC_REG_DATA_LEN-1:0] mem_ld_data;
assign	mem_ld_data = ({`YSYX210195_PC_REG_DATA_LEN{load_axi_en}} & load_axi_data) |
					({`YSYX210195_PC_REG_DATA_LEN{load_clint_en}} & load_clint_data);
assign	w_data = (wb_sel == 2'b00) ? (csr_r_ena ? csr_r_data : exe_data) : 
				 ((wb_sel == 2'b01) ? (pc + 4) : 
				 ((wb_sel == 2'b10) ? mem_ld_data : 64'hxxxx_xxxx_xxxx_xxxx));

/*
always @(*)
  begin
	case(wb_sel)
		00:		w_data = exe_data;
		10:		w_data = mem_ld_data;
		01:		w_data = pc + 4;
		default:	w_data = 64'd0;
	endcase
  end
  */
//assign	w_data = wbsel ? mem_ld_data : exe_data;
//at posedge write data
	always @(posedge clk)
  begin
	if(rst)
	  begin
		regs[0] <= 64'd0;
		regs[1] <= 64'd0;
		regs[2] <= 64'd0;
		regs[3] <= 64'd0;
		regs[4] <= 64'd0;
		regs[5] <= 64'd0;
		regs[6] <= 64'd0;
		regs[7] <= 64'd0;
		regs[8] <= 64'd0;
		regs[9] <= 64'd0;
		regs[10] <= 64'd0;
		regs[11] <= 64'd0;
		regs[12] <= 64'd0;
		regs[13] <= 64'd0;
		regs[14] <= 64'd0;
		regs[15] <= 64'd0;
		regs[16] <= 64'd0;
		regs[17] <= 64'd0;
		regs[18] <= 64'd0;
		regs[19] <= 64'd0;
		regs[20] <= 64'd0;
		regs[21] <= 64'd0;
		regs[22] <= 64'd0;
		regs[23] <= 64'd0;
		regs[24] <= 64'd0;
		regs[25] <= 64'd0;
		regs[26] <= 64'd0;
		regs[27] <= 64'd0;
		regs[28] <= 64'd0;
		regs[29] <= 64'd0;
		regs[30] <= 64'd0;
		regs[31] <= 64'd0;
	  end
	else
	  begin
		if((w_ena == 1'b1) && (w_addr != 5'h00))
			regs[w_addr] <= w_data;
	  end
  end
//read data
assign r_data1 = (r_ena1 == 1'b1) ? regs[r_addr1] : 64'd0;
assign r_data2 = (r_ena2 == 1'b1) ? regs[r_addr2] : 64'd0;

/*
genvar i;
	generate
		for (i = 0; i < 32; i = i + 1) begin
			assign regs_o[i] = (w_ena & w_addr == i & i != 0) ? w_data : regs[i];
		end
	endgenerate
*/
endmodule
