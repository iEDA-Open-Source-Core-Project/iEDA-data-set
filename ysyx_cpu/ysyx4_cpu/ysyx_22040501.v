`define ysyx_22040501_IMM_NUM 5 
`define ysyx_22040501_CAL_I_OPCODE 7'b0010011
`define ysyx_22040501_CAL_R_OPCODE 7'b0110011
`define ysyx_22040501_CAL_W_R_OPCODE 7'b0111011
`define ysyx_22040501_CAL_W_I_OPCODE 7'b0011011
`define ysyx_22040501_LOAD_OPCODE	 7'b0000011
`define ysyx_22040501_B_OPCODE		 7'b1100011
`define ysyx_22040501_STORE_OPCODE 7'b0100011
`define ysyx_22040501_SYS_OPCODE 	 7'b1110011
`define ysyx_22040501_LUI_U_OPCODE 7'b0110111
`define ysyx_22040501_AUIPC_OPCODE 7'b0010111
`define ysyx_22040501_JAL_OPCODE	 7'b1101111
`define ysyx_22040501_JALR_OPCODE	 7'b1100111
`define ysyx_22040501_FENCEI_OPCODE 7'b0001111
`define ysyx_22040501_ADDI_FUNCT3 3'b000
`define ysyx_22040501_SLTI_FUNCT3	3'b010//new
`define ysyx_22040501_XORI_FUNCT3 3'b100 
`define ysyx_22040501_ORI_FUNCT3 	3'b110//new
`define ysyx_22040501_ANDI_FUNCT3 3'b111 
`define ysyx_22040501_SLTIU_FUNCT3 3'b011 
`define ysyx_22040501_SRAI_FUNCT3 3'b101 
`define ysyx_22040501_SRLI_FUNCT3 3'b101 
`define ysyx_22040501_SLLI_FUNCT3 3'b001
`define ysyx_22040501_JALR_FUNCT3	3'b000
`define ysyx_22040501_LD_FUNCT3		3'b011
`define ysyx_22040501_LW_FUNCT3		3'b010
`define ysyx_22040501_LWU_FUNCT3	3'b110//new
`define ysyx_22040501_LB_FUNCT3		3'b000//new
`define ysyx_22040501_LH_FUNCT3		3'b001
`define ysyx_22040501_LHU_FUNCT3	3'b101
`define ysyx_22040501_SD_FUNCT3   3'b011
`define ysyx_22040501_SW_FUNCT3		3'b010 
`define ysyx_22040501_SH_FUNCT3   3'b001 
`define ysyx_22040501_SB_FUNCT3   3'b000 
`define ysyx_22040501_LBU_FUNCT3	3'b100 
`define ysyx_22040501_BEQ_FUNCT3  3'b000 
`define ysyx_22040501_BNE_FUNCT3  3'b001 
`define ysyx_22040501_BGE_FUNCT3  3'b101
`define ysyx_22040501_BLT_FUNCT3  3'b100
`define ysyx_22040501_BLTU_FUNCT3  3'b110
`define ysyx_22040501_BGEU_FUNCT3  3'b111
`define ysyx_22040501_ADDW_FUNCT3 3'b000
`define ysyx_22040501_SUBW_FUNCT3 3'b000
`define ysyx_22040501_SLLW_FUNCT3 3'b001
`define ysyx_22040501_SRLW_FUNCT3 3'b101
`define ysyx_22040501_SRAW_FUNCT3 3'b101
`define ysyx_22040501_ADDIW_FUNCT3 3'b000
`define ysyx_22040501_SLLIW_FUNCT3 3'b001
`define ysyx_22040501_SRLIW_FUNCT3 3'b101
`define ysyx_22040501_SRAIW_FUNCT3 3'b101
`define ysyx_22040501_ADD_FUNCT3  3'b000
`define ysyx_22040501_SUB_FUNCT3  3'b000
`define ysyx_22040501_AND_FUNCT3	3'b111
`define ysyx_22040501_OR_FUNCT3		3'b110
`define ysyx_22040501_XOR_FUNCT3	3'b100
`define ysyx_22040501_SLL_FUNCT3  3'b001//new
`define ysyx_22040501_SRL_FUNCT3  3'b101//new
`define ysyx_22040501_SRA_FUNCT3  3'b101//new
`define ysyx_22040501_SLTU_FUNCT3 3'b011
`define ysyx_22040501_SLT_FUNCT3	3'b010
`define ysyx_22040501_MUL_FUNCT3  3'b000
`define ysyx_22040501_DIV_FUNCT3  3'b100//new
`define ysyx_22040501_REM_FUNCT3	3'b110//new
`define ysyx_22040501_DIVU_FUNCT3	3'b101
`define ysyx_22040501_REMU_FUNCT3	3'b111
`define ysyx_22040501_MULW_FUNCT3 3'b000
`define ysyx_22040501_DIVW_FUNCT3 3'b100
`define ysyx_22040501_DIVUW_FUNCT3 3'b101//new
`define ysyx_22040501_REMW_FUNCT3 3'b110
`define ysyx_22040501_REMUW_FUNCT3 3'b111
`define ysyx_22040501_CSRRW_FUNCT3 3'b001
`define ysyx_22040501_CSRRS_FUNCT3 3'b010
`define ysyx_22040501_CSRRC_FUNCT3 3'b011
`define ysyx_22040501_CSRRWI_FUNCT3 3'b101
`define ysyx_22040501_CSRRSI_FUNCT3 3'b110
`define ysyx_22040501_CSRRCI_FUNCT3 3'b111
`define ysyx_22040501_FENCEI_FUNCT3 3'b001
`define ysyx_22040501_MULH_FUNCT3 3'b001
`define ysyx_22040501_MULHU_FUNCT3 3'b011
`define ysyx_22040501_MULHSU_FUNCT3 3'b010
`define ysyx_22040501_SLLI_FUNCT6 6'b000000
`define ysyx_22040501_SRAI_FUNCT6 6'b010000
`define ysyx_22040501_SRLI_FUNCT6 6'b000000
`define ysyx_22040501_SLLIW_FUNCT7 7'b0000000
`define ysyx_22040501_SRLIW_FUNCT7 7'b0000000
`define ysyx_22040501_SRAIW_FUNCT7 7'b0100000
`define ysyx_22040501_ADD_FUNCT7  7'b0000000
`define ysyx_22040501_ADDW_FUNCT7 7'b0000000
`define ysyx_22040501_SUBW_FUNCT7 7'b0100000
`define ysyx_22040501_SLLW_FUNCT7 7'b0000000
`define ysyx_22040501_SRLW_FUNCT7 7'b0000000
`define ysyx_22040501_SRAW_FUNCT7 7'b0100000
`define ysyx_22040501_SUB_FUNCT7  7'b0100000
`define ysyx_22040501_SLL_FUNCT7  7'b0000000
`define ysyx_22040501_SRL_FUNCT7  7'b0000000
`define ysyx_22040501_SRA_FUNCT7  7'b0100000
`define ysyx_22040501_AND_FUNCT7	7'b0000000
`define ysyx_22040501_OR_FUNCT7		7'b0000000
`define ysyx_22040501_XOR_FUNCT7	7'b0000000
`define ysyx_22040501_SLTU_FUNCT7	7'b0000000
`define ysyx_22040501_SLT_FUNCT7	7'b0000000
`define ysyx_22040501_MUL_FUNCT7	7'b0000001
`define ysyx_22040501_DIV_FUNCT7	7'b0000001
`define ysyx_22040501_DIVU_FUNCT7	7'b0000001
`define ysyx_22040501_REM_FUNCT7	7'b0000001
`define ysyx_22040501_REMU_FUNCT7	7'b0000001
`define ysyx_22040501_MULW_FUNCT7 7'b0000001
`define ysyx_22040501_DIVW_FUNCT7 7'b0000001
`define ysyx_22040501_DIVUW_FUNCT7 7'b0000001
`define ysyx_22040501_REMW_FUNCT7 7'b0000001
`define ysyx_22040501_REMUW_FUNCT7 7'b0000001
`define ysyx_22040501_MULH_FUNCT7 7'b0000001
`define ysyx_22040501_MULHU_FUNCT7 7'b0000001
`define ysyx_22040501_MULHSU_FUNCT7 7'b0000001
`define ysyx_22040501_ECALL  32'h00000073
`define ysyx_22040501_MRET	 32'h30200073
`define ysyx_22040501_A_NUM 5
`define ysyx_22040501_B_NUM 4	
`define ysyx_22040501_PC_NUM 3 //have 4 choice one is defalut
`define ysyx_22040501_RESULT_NUM 2//have 4 choice one is default
`define ysyx_22040501_LOAD_NUM 7 
`define ysyx_22040501_SHAMT_NUM 2
`define ysyx_22040501_STORE_MASK_LEN	8
`define ysyx_22040501_STORE_MASK_NUM  4
`define ysyx_22040501_CSR_KEY_NUM 3
`define ysyx_22040501_WIDTH 64
`define ysyx_22040501_AWIDTH 32
`define ysyx_22040501_R_ADDR_W 5
`define ysyx_22040501_OP_NUM 16
`define ysyx_22040501_RST_PC 64'h0000000030000000
`define ysyx_22040501_ADD 16'b0000_0000_0000_0001 
`define ysyx_22040501_SLTU 16'b0000_0000_0000_0010 
`define ysyx_22040501_SLL 16'b0000_0000_0000_0100 
`define ysyx_22040501_XOR 16'b0000_0000_0000_1000 
`define ysyx_22040501_AND 16'b0000_0000_0001_0000 
`define ysyx_22040501_SRA 16'b0000_0000_0010_0000 
`define ysyx_22040501_SUB 16'b0000_0000_0100_0000 
`define ysyx_22040501_OR  16'b0000_0000_1000_0000 
`define ysyx_22040501_SRL 16'b0000_0001_0000_0000 
`define ysyx_22040501_MUL 16'b0000_0010_0000_0000 
`define ysyx_22040501_DIV 16'b0000_0100_0000_0000 
`define ysyx_22040501_REM 16'b0000_1000_0000_0000 
`define ysyx_22040501_DIVU 16'b0001_0000_0000_0000
`define ysyx_22040501_REMU 16'b0010_0000_0000_0000
`define ysyx_22040501_SLT	 16'b0100_0000_0000_0000 
`define ysyx_22040501_MULH 16'b1000_0000_0000_0000 
`define ysyx_22040501_CSRS_NUM 6
`define ysyx_22040501_MTVEC 12'h305
`define ysyx_22040501_MPC 12'h341
`define ysyx_22040501_MSTATUS 12'h300
`define ysyx_22040501_MCAUSE 12'h342
`define ysyx_22040501_MIE 12'h304
`define ysyx_22040501_MIP 12'h344
`define ysyx_22040501_AXI_SIZE_B 3'b000
`define ysyx_22040501_AXI_SIZE_H 3'b001
`define ysyx_22040501_AXI_SIZE_W 3'b010
`define ysyx_22040501_AXI_SIZE_D 3'b011_
`define ysyx_22040501_WAIT_ADDR 1'b0
`define ysyx_22040501_WAIT_DATA 1'b1
module ysyx_22040501_AXI_Lite_M_r
#(AWIDTH = 32,
	DWIDTH = 64
)
(
	input 								clk_i,
	input									rst_i,
	input									addr_r_valid_i, //this valid main the addr_r_i is valid
	input		[AWIDTH-1:0]	addr_r_i,
	output	[DWIDTH-1:0]	data_r_o,
	output								data_r_valid_o,
	input		[2:0]					axi_size_i,
	output	[AWIDTH-1:0]	araddr_o,
	output								arvalid_o,
	input									arready_i,//
	input		[DWIDTH-1:0]	rdata_i,
	input		[1:0]					rresp_i,//
	input									rvalid_i,//
	output								rready_o,
	output	[2:0]					arsize_o
);
assign arsize_o[2:0] = axi_size_i;
wire r_state_now;
wire r_state_next;
ysyx_22040501_Reg #(1,0)	r_state (clk_i,rst_i,r_state_next,r_state_now,1'b1);
ysyx_22040501_MuxKey#(2,1,1) mux_r_state_next(.out(r_state_next),.key(r_state_now),.lut({
	`ysyx_22040501_WAIT_ADDR,	arready_i & arvalid_o ? `ysyx_22040501_WAIT_DATA : `ysyx_22040501_WAIT_ADDR,
	`ysyx_22040501_WAIT_DATA, rvalid_i & rready_o ? `ysyx_22040501_WAIT_ADDR :	`ysyx_22040501_WAIT_DATA
}));
assign araddr_o[AWIDTH-1:0] = addr_r_i[AWIDTH-1:0];
assign arvalid_o = ~r_state_now & (~rst_i) &addr_r_valid_i;//&(!data_valid_o);
assign rready_o = r_state_now& (~rst_i);
wire write_data_reg_en;
assign write_data_reg_en = (r_state_now == `ysyx_22040501_WAIT_DATA)&rready_o&rvalid_i;
ysyx_22040501_Reg #(DWIDTH,0) data (clk_i,rst_i,rdata_i[DWIDTH-1:0],data_r_o[DWIDTH-1:0],write_data_reg_en);
ysyx_22040501_Reg #(1,0)	data_valid(clk_i,rst_i,write_data_reg_en,data_r_valid_o,1'b1);
endmodule
`define ysyx_22040501_IDEL 2'b00
`define ysyx_22040501_IF_R 2'b01
`define ysyx_22040501_LS_R 2'b10
module ysyx_22040501_AXI_Arbiter
#(AWIDTH = 32,
	DWIDTH = 64,
	MASKLEN = 8
)
(
	input								clk_i,
	input								rst_i,
	input	[AWIDTH-1:0]	araddr_F_i,
	input								arvalid_F_i,
	output									arready_F_o,//
	output		[DWIDTH-1:0]	rdata_F_o,
	output		[1:0]					rresp_F_o,//
	output									rvalid_F_o,//
	input								rready_F_i,
	input			[2:0]				arsize_F_i,
	input	[AWIDTH-1:0]	araddr_LS_i,
	input								arvalid_LS_i,
	output									arready_LS_o,//
	output		[DWIDTH-1:0]	rdata_LS_o,
	output		[1:0]					rresp_LS_o,//
	output									rvalid_LS_o,//
	input								rready_LS_i,
	input	[AWIDTH-1:0]	awaddr_LS_i,
	input								awvalid_LS_i,
	output									awready_LS_o,
	input	[DWIDTH-1:0]	wdata_LS_i,
	input	[MASKLEN-1:0]	wstrb_LS_i,
	input								wvalid_LS_i,
	output									wready_LS_o,
	output		[1:0]					bresp_LS_o,//not finished 
	output									bvalid_LS_o,//not...
	input								bready_LS_i,//not...
	input								 wlast_LS_i,
	input			[2:0]			 arsize_LS_i,
	input			[2:0]			 awsize_LS_i,
	output	[AWIDTH-1:0]	araddr_o,
	output								arvalid_o,
	input									arready_i,//
	input		[DWIDTH-1:0]	rdata_i,
	input		[1:0]					rresp_i,//
	input									rvalid_i,//
	output								rready_o,
	output	[AWIDTH-1:0]	awaddr_o,
	output								awvalid_o,
	input									awready_i,
	output	[DWIDTH-1:0]	wdata_o,
	output	[MASKLEN-1:0]	wstrb_o,
	output								wvalid_o,
	input									wready_i,
	input		[1:0]					bresp_i,//not finished 
	input									bvalid_i,//not...
	output								bready_o,//not..
	output								wlast_o,
	output  [2:0]					arsize_o,
	output  [2:0]					awsize_o
);
assign awaddr_o = awaddr_LS_i;
assign awvalid_o = awvalid_LS_i;
assign awready_LS_o= awready_i ;
assign wdata_o = wdata_LS_i;
assign wstrb_o = wstrb_LS_i;
assign wvalid_o = wvalid_LS_i;
assign wready_LS_o= wready_i ;
assign bresp_LS_o= bresp_i ;
assign bvalid_LS_o= bvalid_i ;
assign bready_o = bready_LS_i;
assign awsize_o = awsize_LS_i;
assign wlast_o = wlast_LS_i;
wire [1:0]	state_now;
wire [1:0]  state_next;
ysyx_22040501_Reg #(2,0) state_now_reg(clk_i,rst_i,state_next[1:0],state_now[1:0],1'b1);
ysyx_22040501_MuxKeyWithDefault #(3,2,2) state_next_mux(.out(state_next[1:0]),.key(state_now[1:0]),.default_out(2'b0),.lut({
	`ysyx_22040501_IDEL	,arvalid_F_i?`ysyx_22040501_IF_R:arvalid_LS_i?`ysyx_22040501_LS_R:`ysyx_22040501_IDEL,
	`ysyx_22040501_IF_R	,rvalid_F_o ?`ysyx_22040501_IDEL:`ysyx_22040501_IF_R,
	`ysyx_22040501_LS_R	,rvalid_LS_o ? `ysyx_22040501_IDEL:`ysyx_22040501_LS_R
}));
assign arready_F_o = (state_now[1:0] == `ysyx_22040501_IF_R) ? arready_i:0;
assign arready_LS_o = (state_now[1:0] == `ysyx_22040501_LS_R) ? arready_i:0;
assign rdata_F_o[DWIDTH-1:0] = rdata_i[DWIDTH-1:0];
assign rdata_LS_o[DWIDTH-1:0] = rdata_i[DWIDTH-1:0];
assign rresp_F_o[1:0] = rresp_i[1:0];
assign rresp_LS_o[1:0] =rresp_i[1:0];
assign rvalid_F_o	=  (state_now[1:0] == `ysyx_22040501_IF_R) ? rvalid_i:0;
assign rvalid_LS_o	=  (state_now[1:0] == `ysyx_22040501_LS_R) ? rvalid_i:0;
ysyx_22040501_MuxKeyWithDefault #(3,2,AWIDTH) araddr_mux(.out(araddr_o[AWIDTH-1:0]),.key(state_now[1:0]),.default_out({AWIDTH{1'b0}}),.lut({
	`ysyx_22040501_IDEL	,{AWIDTH{1'b0}},
	`ysyx_22040501_IF_R	,araddr_F_i[AWIDTH-1:0],
	`ysyx_22040501_LS_R	,araddr_LS_i[AWIDTH-1:0]
}));
ysyx_22040501_MuxKeyWithDefault #(3,2,1) arvalid_mux(.out(arvalid_o),.key(state_now[1:0]),.default_out(1'b0),.lut({
	`ysyx_22040501_IDEL	,1'b0,
	`ysyx_22040501_IF_R	,arvalid_F_i,
	`ysyx_22040501_LS_R	,arvalid_LS_i
}));
ysyx_22040501_MuxKeyWithDefault #(3,2,1) rready_next_mux(.out(rready_o),.key(state_now[1:0]),.default_out(1'b0),.lut({
	`ysyx_22040501_IDEL	, 1'b0,
	`ysyx_22040501_IF_R	, rready_F_i,
	`ysyx_22040501_LS_R	, rready_LS_i
}));
ysyx_22040501_MuxKeyWithDefault #(3,2,3) arsize_mux(.out(arsize_o[2:0]),.key(state_now[1:0]),.default_out(3'b0),.lut({
	`ysyx_22040501_IDEL	, 3'b0,
	`ysyx_22040501_IF_R	, arsize_F_i[2:0],
	`ysyx_22040501_LS_R	, arsize_LS_i[2:0] 
}));
endmodule
`define ysyx_22040501_WAIT_ADDR 1'b0
`define ysyx_22040501_WAIT_DATA 1'b1
module ysyx_22040501_AXI_Lite_M
#(AWIDTH = 32,
	DWIDTH = 64,
	MASKLEN = 8
)
(
	input 								clk_i,
	input									rst_i,
	input									addr_r_valid_i, //this valid main the addr_r_i is valid
	input		[AWIDTH-1:0]	addr_r_i,
	output	[DWIDTH-1:0]	data_r_o,
	output								data_r_valid_o,
	input									addr_w_valid_i, //this valid main the addr_w_i is valid
	input		[AWIDTH-1:0]	addr_w_i,
	input		[DWIDTH-1:0]	data_w_i,
	input		[MASKLEN-1:0] data_w_mask_i,
	input									data_w_valid_i,
	output								data_w_end_o,
	input		[2:0]					axi_size_i,
	output	[AWIDTH-1:0]	araddr_o,
	output								arvalid_o,
	input									arready_i,//
	input		[DWIDTH-1:0]	rdata_i,
	input		[1:0]					rresp_i,//
	input									rvalid_i,//
	output								rready_o,
	output	[AWIDTH-1:0]	awaddr_o,
	output								awvalid_o,
	input									awready_i,
	output	[DWIDTH-1:0]	wdata_o,
	output	[MASKLEN-1:0]	wstrb_o,
	output								wvalid_o,
	input									wready_i,
	input		[1:0]					bresp_i,//not finished 
	input									bvalid_i,//not...
	output								bready_o,//not...
	output								wlast_o,	
	output	[2:0]					awsize_o,
	output	[2:0]					arsize_o
);
assign bready_o = 1'b1;
assign awsize_o[2:0] = axi_size_i;
assign arsize_o[2:0] = axi_size_i;
wire r_state_now;
wire r_state_next;
ysyx_22040501_Reg #(1,0)	r_state (clk_i,rst_i,r_state_next,r_state_now,1'b1);
ysyx_22040501_MuxKey #(2,1,1) mux_r_state_next(.out(r_state_next),.key(r_state_now),.lut({
	`ysyx_22040501_WAIT_ADDR,	arready_i & arvalid_o ? `ysyx_22040501_WAIT_DATA : `ysyx_22040501_WAIT_ADDR,
	`ysyx_22040501_WAIT_DATA, rvalid_i & rready_o ? `ysyx_22040501_WAIT_ADDR :	`ysyx_22040501_WAIT_DATA
}));
assign araddr_o[AWIDTH-1:0] = addr_r_i[AWIDTH-1:0];
assign arvalid_o = ~r_state_now & (~rst_i) &addr_r_valid_i;//&(!data_valid_o);
assign rready_o = r_state_now& (~rst_i);
wire write_data_reg_en;
assign write_data_reg_en = (r_state_now == `ysyx_22040501_WAIT_DATA)&rready_o&rvalid_i;
ysyx_22040501_Reg #(DWIDTH,0) data (clk_i,rst_i,rdata_i[DWIDTH-1:0],data_r_o[DWIDTH-1:0],write_data_reg_en);
ysyx_22040501_Reg #(1,0)	data_valid(clk_i,rst_i,write_data_reg_en,data_r_valid_o,1'b1);
wire w_state_now;
wire w_state_next;
ysyx_22040501_Reg #(1,0)	w_state (clk_i,rst_i,w_state_next,w_state_now,1'b1);
ysyx_22040501_MuxKey#(2,1,1) mux_w_state_next(.out(w_state_next),.key(w_state_now),.lut({
	`ysyx_22040501_WAIT_ADDR,	awready_i & awvalid_o? `ysyx_22040501_WAIT_DATA : `ysyx_22040501_WAIT_ADDR,
	`ysyx_22040501_WAIT_DATA, wvalid_o & wready_i ? `ysyx_22040501_WAIT_ADDR :	`ysyx_22040501_WAIT_DATA
}));
assign awaddr_o[AWIDTH-1:0] = addr_w_i[AWIDTH-1:0];
assign awvalid_o = ~w_state_now & (~rst_i) &addr_w_valid_i;//&(!data_valid_o);
assign wdata_o[DWIDTH-1:0] = data_w_i[DWIDTH-1:0];
assign wstrb_o[MASKLEN-1:0] = data_w_mask_i[MASKLEN-1:0];
assign wvalid_o = w_state_now & (~rst_i)& data_w_valid_i ;
assign data_w_end_o = (w_state_now == `ysyx_22040501_WAIT_DATA) &wvalid_o & wready_i;
assign wlast_o = data_w_end_o;
endmodule
module ysyx_22040501_MuxKeyInternal #(NR_KEY = 2, KEY_LEN = 1, DATA_LEN = 1) (
  output reg [DATA_LEN-1:0] out,
  input [KEY_LEN-1:0] key,
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
    out = lut_out;
  end
endmodule
module ysyx_22040501_MuxKeyInternal_WithDefault #(NR_KEY = 2, KEY_LEN = 1, DATA_LEN = 1) (
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
module ysyx_22040501_MuxKey #(NR_KEY = 2, KEY_LEN = 1, DATA_LEN = 1) (
  output [DATA_LEN-1:0] out,
  input [KEY_LEN-1:0] key,
  input [NR_KEY*(KEY_LEN + DATA_LEN)-1:0] lut
);
ysyx_22040501_MuxKeyInternal #(NR_KEY, KEY_LEN, DATA_LEN) i0 (out, key,lut);
endmodule
module ysyx_22040501_MuxKeyWithDefault #(NR_KEY = 2, KEY_LEN = 1, DATA_LEN = 1) (
  output [DATA_LEN-1:0] out,
  input [KEY_LEN-1:0] key,
  input [DATA_LEN-1:0] default_out,
  input [NR_KEY*(KEY_LEN + DATA_LEN)-1:0] lut
);
ysyx_22040501_MuxKeyInternal_WithDefault #(NR_KEY, KEY_LEN, DATA_LEN) i0 (out, key, default_out, lut);
endmodule
module ysyx_22040501_Reg #(WIDTH = 1, RESET_VAL = 0) (
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
`define ysyx_22040501_IDELL 3'b000
`define ysyx_22040501_RHIT 3'b001
`define ysyx_22040501_RBUS 3'b010
`define ysyx_22040501_WHIT 3'b011
`define ysyx_22040501_WBUS 3'b100 //this state is not really write bus,it means store but not hit,will load date from mem to cache
`define ysyx_22040501_FENCEI 3'b101
module ysyx_22040501_DCACHE 
#(
		RAM_NUM = 4,
		BITS = 128,	//ram width
		RAM_ADDR_W = 6,//ram addr width
		LINES = 512,
		OFFSET_W = 3,
		INDEX_W = 9,
		TAG_W = 22,
		VLD_BIT = 20,
		DIR_BIT = 21,
		AWIDTH = 32
)
(
input 								clk_i,
input 								rst_i,
input	[`ysyx_22040501_WIDTH-1:0] 		addr_i,
input	[2:0]						ls_size_i,
input 								addr_r_valid_i,	
output [`ysyx_22040501_WIDTH-1:0] 	data_r_o,
output								read_end_o,
input 								addr_w_valid_i,	
input [`ysyx_22040501_WIDTH-1:0]		data_w_i,	
input	[7:0]						w_mask_i,
output								w_end_o,
input									is_fencei_i,
output								fencei_end_o,
output	[AWIDTH-1:0]	araddr_o,
output								arvalid_o,
input									arready_i,//
input		[`ysyx_22040501_WIDTH-1:0]	rdata_i,
input		[1:0]					rresp_i,//
input									rvalid_i,//
output								rready_o,
output	[AWIDTH-1:0]	awaddr_o,
output								awvalid_o,
input									awready_i,
output	[`ysyx_22040501_WIDTH-1:0]	wdata_o,
output	[7:0]					wstrb_o,
output								wvalid_o,
input									wready_i,
input		[1:0]					bresp_i,//not finished 
input									bvalid_i,//not...
output								bready_o,//not...
output								wlast_o,
output	[2:0]					awsize_o,
output	[2:0]					arsize_o,
output [RAM_ADDR_W-1:0]	sram4_addr_o,
output        					sram4_cen_o,
output        					sram4_wen_o,
output [BITS-1:0] 			sram4_wmask_o,
output [BITS-1:0] 			sram4_wdata_o,
input [BITS-1:0]  			sram4_rdata_i,
output [RAM_ADDR_W-1:0]	sram5_addr_o,
output        					sram5_cen_o,
output        					sram5_wen_o,
output [BITS-1:0] 			sram5_wmask_o,
output [BITS-1:0] 			sram5_wdata_o,
input [BITS-1:0]  			sram5_rdata_i,
output [RAM_ADDR_W-1:0]	sram6_addr_o,
output        					sram6_cen_o,
output        					sram6_wen_o,
output [BITS-1:0] 			sram6_wmask_o,
output [BITS-1:0] 			sram6_wdata_o,
input [BITS-1:0]  			sram6_rdata_i,
output [RAM_ADDR_W-1:0]	sram7_addr_o,
output        					sram7_cen_o,
output        					sram7_wen_o,
output [BITS-1:0] 			sram7_wmask_o,
output [BITS-1:0] 			sram7_wdata_o,
input [BITS-1:0]  			sram7_rdata_i
);
wire is_device;
wire is_mem;
wire is_sdram;
wire [2:0] state_now;
wire [2:0] state_next;
wire [2:0] state_next_IDEL;
wire [1:0] state_next_IDEL_key;
wire r_start;
wire r_end;
wire w_start;
wire w_end;
wire r_end_s; //end save by reg
wire w_end_s;
wire [`ysyx_22040501_WIDTH-1:0] data_w_bus;
wire [AWIDTH-1:0]	addr_w;
wire [INDEX_W-1:0] fencei_cnt;
wire			 fencei_wb_end;
assign is_mem = ((addr_i[31:0]>=32'h80000000)&(addr_i[31:0]<=32'hFBFFFFFF));
assign is_sdram = ((addr_i[31:0]>=32'hFC000000)&(addr_i[31:0]<=32'hFFFFFFFE));
assign is_device = (state_now != `ysyx_22040501_FENCEI) & (~is_mem)&(~is_sdram);
wire [`ysyx_22040501_WIDTH-1:0] data_r_o_from_cache;
wire read_end_o_from_cache;
wire w_end_o_from_cache;
wire [`ysyx_22040501_WIDTH-1:0] data_r_bus;
assign data_r_o[`ysyx_22040501_WIDTH-1:0] = is_device ? data_r_bus[`ysyx_22040501_WIDTH-1:0] :data_r_o_from_cache[`ysyx_22040501_WIDTH-1:0];
assign read_end_o  = is_device ? r_end:read_end_o_from_cache;
assign w_end_o  = is_device ? w_end:w_end_o_from_cache;
wire [INDEX_W-1:0] index;
wire [TAG_W-3:0]	tag;
wire hit;
wire read_cacheline_end;
wire read_bus_end;
wire write_cacheline_end;
wire write_bus_end;
ysyx_22040501_Reg #(3,0) state(clk_i,rst_i,state_next,state_now,1'b1);
ysyx_22040501_MuxKeyWithDefault #(6,3,3) next_state_mux(.out(state_next[2:0]),.key(state_now),.default_out(3'b0),.lut({
	`ysyx_22040501_IDELL,	is_fencei_i ? `ysyx_22040501_FENCEI : state_next_IDEL[2:0],
	`ysyx_22040501_RHIT,	read_cacheline_end ?	`ysyx_22040501_IDELL:`ysyx_22040501_RHIT,
	`ysyx_22040501_RBUS,	read_bus_end ?	`ysyx_22040501_IDELL:`ysyx_22040501_RBUS,
	`ysyx_22040501_WHIT,	write_cacheline_end ?	`ysyx_22040501_IDELL:`ysyx_22040501_WHIT,
	`ysyx_22040501_WBUS,	write_bus_end ?	`ysyx_22040501_IDELL:`ysyx_22040501_WBUS,
	`ysyx_22040501_FENCEI, fencei_end_o ? `ysyx_22040501_IDELL: `ysyx_22040501_FENCEI
}));
assign state_next_IDEL_key[0] = addr_r_valid_i&(~is_device);
assign state_next_IDEL_key[1] = addr_w_valid_i&(~is_device);
ysyx_22040501_MuxKeyWithDefault #(3,2,3) next_state_IDEL_mux(.out(state_next_IDEL[2:0]),.key(state_next_IDEL_key[1:0]),.default_out(3'b0),.lut({
	2'b00,	`ysyx_22040501_IDELL,
	2'b01,	hit ? `ysyx_22040501_RHIT: `ysyx_22040501_RBUS,
	2'b10, 	hit ? `ysyx_22040501_WHIT: `ysyx_22040501_WBUS	
}));
assign r_start = ((state_now == `ysyx_22040501_RBUS)|(state_now == `ysyx_22040501_WBUS)) & (~(r_end|r_end_s));
ysyx_22040501_AXI_Lite_M axi_lite_mm(
.clk_i								(clk_i),
.rst_i								(rst_i),
.addr_r_valid_i				(is_device ?addr_r_valid_i :r_start),
.addr_r_i							(is_device ? addr_i[AWIDTH-1:0] :{addr_i[AWIDTH-1:3],3'b0}),
.data_r_o							(data_r_bus[`ysyx_22040501_WIDTH-1:0]),
.data_r_valid_o				(r_end),
.addr_w_valid_i				(is_device ?addr_w_valid_i : w_start),
.addr_w_i							(is_device ? addr_i[AWIDTH-1:0] :{addr_w[AWIDTH-1:3],3'b0}),
.data_w_i							(is_device ? data_w_i : data_w_bus[`ysyx_22040501_WIDTH-1:0]),
.data_w_mask_i				(is_device ? w_mask_i : 8'hff),
.data_w_valid_i				(is_device ?addr_w_valid_i :w_start),
.data_w_end_o					(w_end),
.axi_size_i						(is_device ?ls_size_i[2:0]:`ysyx_22040501_AXI_SIZE_D),
.araddr_o							(araddr_o[AWIDTH-1:0]),
.arvalid_o						(arvalid_o),
.arready_i						(arready_i),
.rdata_i							(rdata_i[`ysyx_22040501_WIDTH-1:0]),
.rresp_i							(rresp_i),
.rvalid_i							(rvalid_i),
.rready_o							(rready_o),
.awaddr_o							(awaddr_o[AWIDTH-1:0]),
.awvalid_o						(awvalid_o),
.awready_i						(awready_i),
.wdata_o							(wdata_o),
.wstrb_o							(wstrb_o),
.wvalid_o							(wvalid_o),
.wready_i							(wready_i),
.bresp_i							(bresp_i),
.bvalid_i							(bvalid_i),
.bready_o							(bready_o),
.wlast_o							(wlast_o),
.awsize_o							(awsize_o[2:0]),
.arsize_o							(arsize_o[2:0])
);
wire [TAG_W-1:0] tag_r[LINES-1:0];
wire [TAG_W-1:0]	tag_new;
wire tag_w_en;
genvar j;
generate
	for(j=0;j<LINES;j++)begin
ysyx_22040501_Reg #(TAG_W,0) tags (clk_i,rst_i,tag_new[TAG_W-1:0],tag_r[j][TAG_W-1:0],(index==j)&tag_w_en);
	end
endgenerate
wire	[RAM_ADDR_W-1:0] A; 
wire [BITS-1:0] Q [RAM_NUM-1:0];
wire [BITS-1:0] Q_out;
wire w_en [RAM_NUM-1:0];
wire [BITS-1:0] bwen; 
wire [BITS-1:0] D;
assign A[RAM_ADDR_W-1:0] = index[RAM_ADDR_W:1];
assign sram4_addr_o[RAM_ADDR_W-1:0] = A[RAM_ADDR_W-1:0];
assign sram5_addr_o[RAM_ADDR_W-1:0] = A[RAM_ADDR_W-1:0];
assign sram6_addr_o[RAM_ADDR_W-1:0] = A[RAM_ADDR_W-1:0];
assign sram7_addr_o[RAM_ADDR_W-1:0] = A[RAM_ADDR_W-1:0];
assign sram4_cen_o = 1'b0;
assign sram5_cen_o = 1'b0;
assign sram6_cen_o = 1'b0;
assign sram7_cen_o = 1'b0;
assign sram4_wen_o = w_en[0];
assign sram5_wen_o = w_en[1];
assign sram6_wen_o = w_en[2];
assign sram7_wen_o = w_en[3];
assign sram4_wmask_o = bwen[BITS-1:0];
assign sram5_wmask_o = bwen[BITS-1:0];
assign sram6_wmask_o = bwen[BITS-1:0];
assign sram7_wmask_o = bwen[BITS-1:0];
assign sram4_wdata_o = D[BITS-1:0];
assign sram5_wdata_o = D[BITS-1:0];
assign sram6_wdata_o = D[BITS-1:0];
assign sram7_wdata_o = D[BITS-1:0];
assign Q[0][BITS-1:0] = sram4_rdata_i[BITS-1:0];
assign Q[1][BITS-1:0] = sram5_rdata_i[BITS-1:0];
assign Q[2][BITS-1:0] = sram6_rdata_i[BITS-1:0];
assign Q[3][BITS-1:0] = sram7_rdata_i[BITS-1:0];
ysyx_22040501_MuxKey#(4,2,BITS) mux_Q_out(.out(Q_out[BITS-1:0]),.key(index[INDEX_W-1:INDEX_W-2]),.lut({
	2'b00,	Q[0][BITS-1:0],
	2'b01,	Q[1][BITS-1:0],
	2'b10,	Q[2][BITS-1:0],
	2'b11,	Q[3][BITS-1:0]
}));
assign w_en[0] = ~((index[INDEX_W-1:INDEX_W-2]== 0)&((((state_now == `ysyx_22040501_WBUS)|(state_now == `ysyx_22040501_RBUS))&r_end)|state_now == `ysyx_22040501_WHIT));
assign w_en[1] = ~((index[INDEX_W-1:INDEX_W-2]== 1)&((((state_now == `ysyx_22040501_WBUS)|(state_now == `ysyx_22040501_RBUS))&r_end)|state_now == `ysyx_22040501_WHIT));
assign w_en[2] = ~((index[INDEX_W-1:INDEX_W-2]== 2)&((((state_now == `ysyx_22040501_WBUS)|(state_now == `ysyx_22040501_RBUS))&r_end)|state_now == `ysyx_22040501_WHIT));
assign w_en[3] = ~((index[INDEX_W-1:INDEX_W-2]== 3)&((((state_now == `ysyx_22040501_WBUS)|(state_now == `ysyx_22040501_RBUS))&r_end)|state_now == `ysyx_22040501_WHIT));
wire [`ysyx_22040501_WIDTH-1:0] mask_64b;
assign mask_64b = {{8{w_mask_i[7]}},{8{w_mask_i[6]}},{8{w_mask_i[5]}},{8{w_mask_i[4]}},{8{w_mask_i[3]}},{8{w_mask_i[2]}},{8{w_mask_i[1]}},{8{w_mask_i[0]}}};
ysyx_22040501_MuxKeyWithDefault #(3,3,BITS) mux_bwen(.out(bwen[BITS-1:0]),.key(state_now[2:0]),.default_out({BITS{1'b0}}),.lut({
	`ysyx_22040501_WBUS,	index[0] ? 128'h00000000_00000000_FFFFFFFF_FFFFFFFF:128'hFFFFFFFF_FFFFFFFF_00000000_00000000,
	`ysyx_22040501_RBUS,	index[0] ? 128'h00000000_00000000_FFFFFFFF_FFFFFFFF:128'hFFFFFFFF_FFFFFFFF_00000000_00000000,
	`ysyx_22040501_WHIT,	index[0] ? {~mask_64b,64'hFFFFFFFF_FFFFFFFF}:{64'hFFFFFFFF_FFFFFFFF,~mask_64b}
}));
wire [`ysyx_22040501_WIDTH-1:0] data_wbus;
assign data_wbus[`ysyx_22040501_WIDTH-1:0] = (data_r_bus & (~mask_64b)) | (data_w_i & mask_64b);
ysyx_22040501_MuxKeyWithDefault #(3,3,BITS) mux_D(.out(D[BITS-1:0]),.key(state_now[2:0]),.default_out({BITS{1'b0}}),.lut({
	`ysyx_22040501_WHIT,	{data_w_i[`ysyx_22040501_WIDTH-1:0],data_w_i[`ysyx_22040501_WIDTH-1:0]},
	`ysyx_22040501_RBUS,	{data_r_bus[`ysyx_22040501_WIDTH-1:0],data_r_bus[`ysyx_22040501_WIDTH-1:0]},
	`ysyx_22040501_WBUS,	{data_wbus[`ysyx_22040501_WIDTH-1:0],data_wbus[`ysyx_22040501_WIDTH-1:0]}
}));
assign index[INDEX_W-1:0] = (state_now == `ysyx_22040501_FENCEI) ? fencei_cnt[INDEX_W-1:0]:addr_i[OFFSET_W+INDEX_W-1:OFFSET_W];
assign tag[TAG_W-3:0] = addr_i[AWIDTH-1:OFFSET_W+INDEX_W];
wire [`ysyx_22040501_WIDTH-1:0] data_r_cacheline;
ysyx_22040501_MuxKey#(2,1,`ysyx_22040501_WIDTH) mux_data_r_cacheline(.out(data_r_cacheline[`ysyx_22040501_WIDTH-1:0]),.key(index[0]),.lut({
	1'b0,	Q_out[BITS/2-1:0],
	1'b1,	Q_out[BITS-1:BITS/2]
}));
ysyx_22040501_MuxKeyWithDefault #(3,3,`ysyx_22040501_WIDTH) mux_data_r(.out(data_r_o_from_cache[`ysyx_22040501_WIDTH-1:0]),.key(state_now[2:0]),.default_out({`ysyx_22040501_WIDTH{1'b0}}),.lut({
	`ysyx_22040501_IDELL,	data_r_cacheline[`ysyx_22040501_WIDTH-1:0],
	`ysyx_22040501_RHIT,	data_r_cacheline[`ysyx_22040501_WIDTH-1:0],
	`ysyx_22040501_RBUS,	data_r_bus[`ysyx_22040501_WIDTH-1:0]	
}));
wire need_wb;
wire w_start_s;
wire [AWIDTH-1:0] addr_w_s;
wire [TAG_W-1:0] tag_r_index;
assign tag_r_index = tag_r[index][TAG_W-1:0];
assign need_wb = ((state_now == `ysyx_22040501_RBUS)|(state_now == `ysyx_22040501_WBUS)|(state_now == `ysyx_22040501_FENCEI)) & tag_r_index[DIR_BIT] & tag_r_index[VLD_BIT];
assign addr_w_s[AWIDTH-1:0] = {tag_r_index[TAG_W-3:0],index[INDEX_W-1:0],3'b0};
ysyx_22040501_Reg #(AWIDTH,0) addr_w_reg (clk_i,rst_i,addr_w_s[AWIDTH-1:0],addr_w[AWIDTH-1:0],need_wb);
ysyx_22040501_Reg #(`ysyx_22040501_WIDTH,0) data_w_bus_reg (clk_i,rst_i,data_r_cacheline[`ysyx_22040501_WIDTH-1:0],data_w_bus[`ysyx_22040501_WIDTH-1:0],need_wb);
ysyx_22040501_Reg #(1,0) w_start_reg (clk_i,rst_i,need_wb,w_start_s,need_wb | ((state_now != `ysyx_22040501_RBUS)&(state_now != `ysyx_22040501_WBUS)));
assign w_start = (w_start_s) & (~w_end_s);
assign hit = (state_now==`ysyx_22040501_IDELL) & (tag_r_index[TAG_W-3:0] == tag[TAG_W-3:0]) &(tag_r_index[VLD_BIT] == 1'b1);
assign read_cacheline_end =	state_now == `ysyx_22040501_RHIT; 
ysyx_22040501_Reg #(1,0) r_end_reg(clk_i,rst_i,r_end,r_end_s,r_end|((state_now!=`ysyx_22040501_RBUS)&(state_now!= `ysyx_22040501_WBUS)));
ysyx_22040501_Reg #(1,0) w_end_reg(clk_i,rst_i,w_end,w_end_s,w_end|((state_now!=`ysyx_22040501_RBUS)&(state_now!= `ysyx_22040501_WBUS)));
assign read_bus_end = (w_start_s|need_wb)? (r_end_s)&(w_end_s):r_end_s;
ysyx_22040501_MuxKeyWithDefault #(3,3,1) mux_read_end(.out(read_end_o_from_cache),.key(state_now[2:0]),.default_out(1'b0),.lut({
	`ysyx_22040501_IDELL,	1'b0,
	`ysyx_22040501_RHIT,	read_cacheline_end,
	`ysyx_22040501_RBUS,	read_bus_end
}));
assign write_cacheline_end = state_now == `ysyx_22040501_WHIT;
assign write_bus_end = (w_start_s|need_wb) ? (r_end_s|r_end)&(w_end_s|w_end):r_end;
ysyx_22040501_MuxKeyWithDefault #(3,3,1) mux_w_end(.out(w_end_o_from_cache),.key(state_now[2:0]),.default_out(1'b0),.lut({
	`ysyx_22040501_IDELL,	1'b0,
	`ysyx_22040501_WHIT,	write_cacheline_end,
	`ysyx_22040501_WBUS, write_bus_end	
}));
ysyx_22040501_MuxKeyWithDefault #(4,3,TAG_W) mux_tag_new(.out(tag_new[TAG_W-1:0]),.key(state_now[2:0]),.default_out(22'b0),.lut({
	`ysyx_22040501_RBUS,{1'b0,1'b1,tag[TAG_W-3:0]},
	`ysyx_22040501_WBUS,{1'b1,1'b1,tag[TAG_W-3:0]},
	`ysyx_22040501_WHIT,{1'b1,1'b1,tag[TAG_W-3:0]},
	`ysyx_22040501_FENCEI,need_wb ?{1'b0,tag_r_index[TAG_W-2:0]}:{TAG_W{1'b0}}
}));
assign tag_w_en = (((state_now == `ysyx_22040501_RBUS)|(state_now == `ysyx_22040501_WBUS))&(r_end))|(state_now== `ysyx_22040501_WHIT)|((state_now == `ysyx_22040501_FENCEI)&w_end); 
assign fencei_end_o = (fencei_cnt[INDEX_W-1:0] == {INDEX_W{1'b1}}) & fencei_wb_end;
wire [INDEX_W-1:0]fencei_cnt_add1;
assign fencei_cnt_add1 = fencei_cnt + 1;
ysyx_22040501_Reg #(INDEX_W,0) fencei_cnt_reg(clk_i,rst_i,fencei_end_o?{INDEX_W{1'b0}}:fencei_cnt_add1,fencei_cnt,(state_now == `ysyx_22040501_FENCEI)&(fencei_wb_end)|fencei_end_o);
assign fencei_wb_end =tag_r_index[VLD_BIT] ? ~(tag_r_index[DIR_BIT]) ? 1:w_end :1;
endmodule
`define ysyx_22040501_IDEL 2'b00
`define ysyx_22040501_HIT	2'b10
`define ysyx_22040501_BUS 2'b11
`define ysyx_22040501_FENCE 2'b01
module ysyx_22040501_ICACHE 
#(
		RAM_NUM = 4,
		BITS = 128,	//ram width
		RAM_ADDR_W = 6,//ram addr width
		LINES = 256,
		OFFSET_W = 4,
		INDEX_W = 8,
		TAG_W = 21,
		VLD_BIT = 20,
		AWIDTH = 32
)
(
input clk_i,
input rst_i,
input	[`ysyx_22040501_WIDTH-1:0] pc_i,
input addr_valid_i,	
output [31:0] inst_o,
output	data_valid_o,
input		is_fencei_i,
output	fencei_end_o,
output	[AWIDTH-1:0]	araddr_o,
output								arvalid_o,
input									arready_i,
input		[`ysyx_22040501_WIDTH-1:0]	rdata_i,
input		[1:0]					rresp_i,
input									rvalid_i,
output								rready_o,
output	[2:0]					arsize_o,
output [RAM_ADDR_W-1:0] sram0_addr_o,
output        					sram0_cen_o,
output        					sram0_wen_o,
output [BITS-1:0] 			sram0_wmask_o,
output [BITS-1:0] 			sram0_wdata_o,
input [BITS-1:0]  			sram0_rdata_i,
output [RAM_ADDR_W-1:0] sram1_addr_o,
output        					sram1_cen_o,
output        					sram1_wen_o,
output [BITS-1:0] 			sram1_wmask_o,
output [BITS-1:0] 			sram1_wdata_o,
input [BITS-1:0]  			sram1_rdata_i,
output [RAM_ADDR_W-1:0] sram2_addr_o,
output        					sram2_cen_o,
output        					sram2_wen_o,
output [BITS-1:0] 			sram2_wmask_o,
output [BITS-1:0] 			sram2_wdata_o,
input [BITS-1:0]  			sram2_rdata_i,
output [RAM_ADDR_W-1:0] sram3_addr_o,
output        					sram3_cen_o,
output        					sram3_wen_o,
output [BITS-1:0] 			sram3_wmask_o,
output [BITS-1:0] 			sram3_wdata_o,
input [BITS-1:0]  			sram3_rdata_i
);
wire is_device;
wire addr_valid_r;
wire addr_valid;
wire read_bus_once_end;
ysyx_22040501_Reg #(1,0) addr_valid_reg(clk_i,rst_i,data_valid_o ? 1'b0:addr_valid_i,addr_valid_r,addr_valid_i|data_valid_o);
assign addr_valid = (addr_valid_i | addr_valid_r)&(~read_bus_once_end); 
wire [INDEX_W-1:0] index;
wire [TAG_W-2:0]	tag;
wire hit;
wire hit_buf;
wire read_cacheline_end;
wire if_end;
wire [1:0] state_now;
wire [1:0] state_next;
ysyx_22040501_Reg #(2,0) state(clk_i,rst_i,state_next,state_now,1'b1);
ysyx_22040501_MuxKey#(4,2,2) next_state_mux(.out(state_next),.key(state_now),.lut({
	`ysyx_22040501_IDEL,	is_fencei_i ? `ysyx_22040501_FENCE : addr_valid&(~is_device) ? hit_buf ? `ysyx_22040501_IDEL:(hit ? `ysyx_22040501_HIT:`ysyx_22040501_BUS):`ysyx_22040501_IDEL,
	`ysyx_22040501_HIT,		read_cacheline_end  ? `ysyx_22040501_IDEL:`ysyx_22040501_HIT,
	`ysyx_22040501_BUS,		if_end  ? 	`ysyx_22040501_IDEL:`ysyx_22040501_BUS,
	`ysyx_22040501_FENCE,fencei_end_o  ?  `ysyx_22040501_IDEL:`ysyx_22040501_FENCE
}));
wire [2:0]	axi_size;
wire is_mem;
wire is_sdram;
assign is_mem = ((pc_i[31:0]>=32'h80000000)&(pc_i[31:0]<=32'hFBFFFFFF));
assign is_sdram = ((pc_i[31:0]>=32'hFC000000)&(pc_i[31:0]<=32'hFFFFFFFE));
assign is_device = (~is_mem)&(~is_sdram);
assign axi_size[2:0] = is_device ? `ysyx_22040501_AXI_SIZE_W : `ysyx_22040501_AXI_SIZE_D;
wire if_start;
wire [`ysyx_22040501_WIDTH-1:0] inst_64_axi;
wire [31:0] inst_axi;
assign inst_axi[31:0] = pc_i[2] ? inst_64_axi[63:32]:inst_64_axi[31:0];
assign if_start = (state_now == `ysyx_22040501_BUS) & (~read_bus_once_end);
wire [AWIDTH-1:0]pc_bus;
wire read_bus_cnt;
ysyx_22040501_Reg #(1,0) read_bug_cnt_reg(clk_i,rst_i,read_bus_cnt+1'b1,read_bus_cnt,(state_now== `ysyx_22040501_BUS)&read_bus_once_end);
assign if_end = read_bus_cnt  & read_bus_once_end;
assign pc_bus = (read_bus_cnt ==0) ? {pc_i[AWIDTH-1:4],4'b0}:{pc_i[AWIDTH-1:4],4'b1000};
wire [`ysyx_22040501_WIDTH-1:0] cacheline_low_tmp;
ysyx_22040501_Reg #(`ysyx_22040501_WIDTH,0) cacheline_low_tmp_reg(clk_i,rst_i,inst_64_axi[`ysyx_22040501_WIDTH-1:0],cacheline_low_tmp[`ysyx_22040501_WIDTH-1:0],(~read_bus_cnt)&read_bus_once_end);
ysyx_22040501_AXI_Lite_M_r axi_lite_m_r(
.clk_i								(clk_i),
.rst_i								(rst_i),
.addr_r_valid_i				(is_device ? addr_valid : if_start),
.addr_r_i							(is_device ? pc_i[AWIDTH-1:0] : pc_bus[AWIDTH-1:0]),
.data_r_o							(inst_64_axi[`ysyx_22040501_WIDTH-1:0]),
.data_r_valid_o				(read_bus_once_end),
.axi_size_i						(axi_size[2:0]),
.araddr_o							(araddr_o[AWIDTH-1:0]),
.arvalid_o						(arvalid_o),
.arready_i						(arready_i),
.rdata_i							(rdata_i[`ysyx_22040501_WIDTH-1:0]),
.rresp_i							(rresp_i),
.rvalid_i							(rvalid_i),
.rready_o							(rready_o),
.arsize_o							(arsize_o[2:0])
);
wire [TAG_W-1:0] tag_r[LINES-1:0];
wire [TAG_W-1:0]	tag_new;
wire tag_w_en;
genvar j;
generate
	for(j=0;j<LINES;j++)begin
ysyx_22040501_Reg #(TAG_W,0) tags (clk_i,rst_i,tag_new[TAG_W-1:0],tag_r[j][TAG_W-1:0],(index==j)&tag_w_en);
	end
endgenerate
wire	[RAM_ADDR_W-1:0] A; 
wire [BITS-1:0] Q [RAM_NUM-1:0];
wire [BITS-1:0] Q_out;
wire w_en [RAM_NUM-1:0];
wire [BITS-1:0] bwen; 
wire [BITS-1:0] D;
assign A[RAM_ADDR_W-1:0] = index[RAM_ADDR_W-1:0];
assign sram0_addr_o[RAM_ADDR_W-1:0] = A[RAM_ADDR_W-1:0];
assign sram1_addr_o[RAM_ADDR_W-1:0] = A[RAM_ADDR_W-1:0];
assign sram2_addr_o[RAM_ADDR_W-1:0] = A[RAM_ADDR_W-1:0];
assign sram3_addr_o[RAM_ADDR_W-1:0] = A[RAM_ADDR_W-1:0];
assign sram0_cen_o = 1'b0;
assign sram1_cen_o = 1'b0;
assign sram2_cen_o = 1'b0;
assign sram3_cen_o = 1'b0;
assign sram0_wen_o = w_en[0];
assign sram1_wen_o = w_en[1];
assign sram2_wen_o = w_en[2];
assign sram3_wen_o = w_en[3];
assign sram0_wmask_o = bwen[BITS-1:0];
assign sram1_wmask_o = bwen[BITS-1:0];
assign sram2_wmask_o = bwen[BITS-1:0];
assign sram3_wmask_o = bwen[BITS-1:0];
assign sram0_wdata_o = D[BITS-1:0];
assign sram1_wdata_o = D[BITS-1:0];
assign sram2_wdata_o = D[BITS-1:0];
assign sram3_wdata_o = D[BITS-1:0];
assign Q[0][BITS-1:0] = sram0_rdata_i[BITS-1:0];
assign Q[1][BITS-1:0] = sram1_rdata_i[BITS-1:0];
assign Q[2][BITS-1:0] = sram2_rdata_i[BITS-1:0];
assign Q[3][BITS-1:0] = sram3_rdata_i[BITS-1:0];
ysyx_22040501_MuxKey#(4,2,BITS) mux_Q_out(.out(Q_out[BITS-1:0]),.key(index[INDEX_W-1:INDEX_W-2]),.lut({
	2'b00,	Q[0][BITS-1:0],
	2'b01,	Q[1][BITS-1:0],
	2'b10,	Q[2][BITS-1:0],
	2'b11,	Q[3][BITS-1:0]
}));
assign w_en[0] = ~((index[INDEX_W-1:INDEX_W-2]== 0)&(state_now == `ysyx_22040501_BUS)&(if_end));
assign w_en[1] = ~((index[INDEX_W-1:INDEX_W-2]== 1)&(state_now == `ysyx_22040501_BUS)&(if_end));
assign w_en[2] = ~((index[INDEX_W-1:INDEX_W-2]== 2)&(state_now == `ysyx_22040501_BUS)&(if_end));
assign w_en[3] = ~((index[INDEX_W-1:INDEX_W-2]== 3)&(state_now == `ysyx_22040501_BUS)&(if_end));
assign bwen = {BITS{1'b0}};
assign D = {inst_64_axi[`ysyx_22040501_WIDTH-1:0],cacheline_low_tmp[`ysyx_22040501_WIDTH-1:0]};
wire [TAG_W-1:0]tag_r_index;
wire [BITS-1:0] cacheline_buf;
wire [TAG_W-1:0] tag_buf;
wire [INDEX_W-1:0] index_buf;
ysyx_22040501_Reg #(BITS,0) cacheline_buf_reg(clk_i,rst_i,Q_out[BITS-1:0],cacheline_buf[BITS-1:0],(state_now == `ysyx_22040501_HIT));
ysyx_22040501_Reg #(TAG_W,0) tag_buf_reg(clk_i,rst_i,fencei_end_o ? {TAG_W{1'b0}} : tag_r_index[TAG_W-1:0],tag_buf[TAG_W-1:0],fencei_end_o|(state_now == `ysyx_22040501_HIT));
ysyx_22040501_Reg #(INDEX_W,0) index_buf_reg(clk_i,rst_i,index[INDEX_W-1:0],index_buf[INDEX_W-1:0],(state_now == `ysyx_22040501_HIT));
wire [INDEX_W-1:0] fencei_cnt;
assign index[INDEX_W-1:0] = (state_now == `ysyx_22040501_FENCE) ? fencei_cnt[INDEX_W-1:0] : pc_i[OFFSET_W+INDEX_W-1:OFFSET_W];
assign tag[TAG_W-2:0] = pc_i[AWIDTH-1:OFFSET_W+INDEX_W];
wire [31:0] inst_in_cache;
ysyx_22040501_MuxKey#(4,2,32) mux_inst(.out(inst_in_cache[31:0]),.key(pc_i[3:2]),.lut({
	2'b00,hit_buf ? cacheline_buf[BITS/4-1:0] :	Q_out[BITS/4-1:0],
	2'b01,hit_buf ? cacheline_buf[BITS/2-1:BITS/4] :	Q_out[BITS/2-1:BITS/4],
	2'b10,hit_buf ? cacheline_buf[BITS-BITS/4-1:BITS/2] :	Q_out[BITS-BITS/4-1:BITS/2],
	2'b11,hit_buf ? cacheline_buf[BITS-1:BITS-BITS/4] :	Q_out[BITS-1:BITS-BITS/4]
}));
wire [31:0]	inst_r_from_cache;
wire [31:0] inst_read_bus;
ysyx_22040501_MuxKey #(4,2,32) mux_inst_read_bus(.out(inst_read_bus[31:0]),.key(pc_i[3:2]),.lut({
2'b00, cacheline_low_tmp[31:0],
2'b01, cacheline_low_tmp[63:32],
2'b10, inst_64_axi[31:0],
2'b11, inst_64_axi[63:32]
}));
ysyx_22040501_MuxKeyWithDefault #(3,2,32) mux_inst_out(.out(inst_r_from_cache[31:0]),.key(state_now[1:0]),.default_out(32'b0),.lut({
	`ysyx_22040501_IDEL,	inst_in_cache[31:0],
	`ysyx_22040501_HIT,		inst_in_cache[31:0],
	`ysyx_22040501_BUS,	 inst_read_bus[31:0]	
}));
assign inst_o[31:0] = is_device ? inst_axi[31:0]: inst_r_from_cache[31:0];
assign tag_r_index = tag_r[index][TAG_W-1:0];
assign hit = addr_valid&(state_now==`ysyx_22040501_IDEL) & (tag_r_index[TAG_W-2:0] == tag[TAG_W-2:0]) &(tag_r_index[VLD_BIT] == 1'b1);
assign hit_buf = addr_valid&(state_now == `ysyx_22040501_IDEL) &(tag_buf[TAG_W-2:0] == tag[TAG_W-2:0])&(index_buf[INDEX_W-1:0] == index[INDEX_W-1:0]) &(tag_buf[VLD_BIT] == 1'b1);
assign read_cacheline_end =	state_now == `ysyx_22040501_HIT; 
wire read_end_from_cache;
ysyx_22040501_MuxKeyWithDefault #(3,2,1) mux_data_valid_out(.out(read_end_from_cache),.key(state_now[1:0]),.default_out(1'b0),.lut({
	`ysyx_22040501_IDEL,	hit_buf,
	`ysyx_22040501_HIT,		read_cacheline_end,
	`ysyx_22040501_BUS,		if_end	
}));
assign data_valid_o = is_device ? read_bus_once_end : read_end_from_cache;
assign tag_new[TAG_W-1:0] =(state_now == `ysyx_22040501_FENCE) ? {1'b0,tag[TAG_W-2:0]}:{1'b1,tag[TAG_W-2:0]}; 
assign tag_w_en = ((state_now == `ysyx_22040501_BUS)&(read_bus_once_end)&(~read_bus_cnt))|(state_now == `ysyx_22040501_FENCE); 
assign fencei_end_o = (fencei_cnt[INDEX_W-1:0] == {INDEX_W{1'b1}});
wire [INDEX_W-1:0]fencei_cnt_add1;
assign fencei_cnt_add1 = fencei_cnt + 1;
ysyx_22040501_Reg #(INDEX_W,0) fencei_cnt_reg(clk_i,rst_i,fencei_end_o? {INDEX_W{1'b0}}:fencei_cnt_add1,fencei_cnt,(state_now == `ysyx_22040501_FENCE)|fencei_end_o);
endmodule
`define ysyx_22040501_MTIMECMP 64'h0000_0000_0200_4000
`define ysyx_22040501_MTIME 64'h0000_0000_0200_BFF8
`define ysyx_22040501_MSIP 64'h0000_0000_0200_0000
module ysyx_22040501_CLINT (
input                    clk_i,
input                    rst_i,
input   [`ysyx_22040501_WIDTH-1:0] 		 clint_addr_i,
input                    clint_ren_i,
output  [`ysyx_22040501_WIDTH-1:0] 		 clint_rdata_o,
input                    clint_wen_i,
input   [`ysyx_22040501_WIDTH-1:0] 		 clint_wdata_i,
input		[7:0]						 clint_wmask_i,
output									 clint_rend_o,
output									 clint_wend_o,
output                   mtip_o,
output									 msip_o,
input										 is_clint_i
);
wire [`ysyx_22040501_WIDTH-1:0] clint_rdata;
wire clint_wend;
wire clint_rend;
ysyx_22040501_Reg #(1,0) wend_delay_o(clk_i,rst_i,clint_wend,clint_wend_o,1'b1);
ysyx_22040501_Reg #(1,0) rend_delay_o(clk_i,rst_i,clint_rend,clint_rend_o,1'b1);
ysyx_22040501_Reg #(`ysyx_22040501_WIDTH,0) clint_rdata_o_reg(clk_i,rst_i,clint_rdata[`ysyx_22040501_WIDTH-1:0],clint_rdata_o[`ysyx_22040501_WIDTH-1:0],1'b1);
assign clint_wend = is_clint_i?clint_wen_i:0;
assign clint_rend = is_clint_i?clint_ren_i:0;
wire [`ysyx_22040501_WIDTH-1:0] wmask;
assign wmask[`ysyx_22040501_WIDTH-1:0] = {{8{clint_wmask_i[7]}},{8{clint_wmask_i[6]}},{8{clint_wmask_i[5]}},{8{clint_wmask_i[4]}},{8{clint_wmask_i[3]}},{8{clint_wmask_i[2]}},{8{clint_wmask_i[1]}},{8{clint_wmask_i[0]}}};
wire [`ysyx_22040501_WIDTH-1:0] mtime, mtimecmp; 
wire msip;
wire ren_mtimecmp, ren_mtime,ren_msip;
assign ren_mtimecmp = clint_ren_i & ({clint_addr_i[`ysyx_22040501_WIDTH-1:3],3'b0} == `ysyx_22040501_MTIMECMP);
assign ren_mtime    = clint_ren_i & ({clint_addr_i[`ysyx_22040501_WIDTH-1:3],3'b0} == `ysyx_22040501_MTIME);
assign ren_msip    = clint_ren_i & (clint_addr_i[`ysyx_22040501_WIDTH-1:0] == `ysyx_22040501_MSIP);
ysyx_22040501_MuxKeyWithDefault #(3,3,`ysyx_22040501_WIDTH) clint_data_mux(clint_rdata[`ysyx_22040501_WIDTH-1:0],{ren_mtimecmp,ren_mtime,ren_msip},{`ysyx_22040501_WIDTH{1'b0}},{
	3'b001,{{`ysyx_22040501_WIDTH-1{1'b0}},msip},
	3'b010,mtime[`ysyx_22040501_WIDTH-1:0],
	3'b100,mtimecmp[`ysyx_22040501_WIDTH-1:0]
});
wire  wen_mtimecmp, wen_mtime , wen_msip;
wire [`ysyx_22040501_WIDTH-1:0] wdata_mtimecmp, wdata_mtime;
wire wmsip;
assign wen_mtimecmp   = clint_wen_i & ({clint_addr_i[`ysyx_22040501_WIDTH-1:3],3'b0} == `ysyx_22040501_MTIMECMP);
assign wen_mtime 		  = clint_wen_i & ({clint_addr_i[`ysyx_22040501_WIDTH-1:3],3'b0} == `ysyx_22040501_MTIME   );
assign wen_msip				= clint_wen_i & (clint_addr_i[`ysyx_22040501_WIDTH-1:0] == `ysyx_22040501_MSIP);
assign wdata_mtimecmp = (clint_wdata_i & wmask) |(mtimecmp &(~wmask)) ;
assign wdata_mtime    = wen_mtime ? (clint_wdata_i&wmask)|(mtime &(~wmask)) : (mtime + 1);
assign wmsip 					= clint_wdata_i[0];
ysyx_22040501_Reg #(`ysyx_22040501_WIDTH,0) mtime_reg(clk_i,rst_i,wdata_mtime[`ysyx_22040501_WIDTH-1:0],mtime[`ysyx_22040501_WIDTH-1:0],1'b1);
ysyx_22040501_Reg #(`ysyx_22040501_WIDTH,0) mtimecmp_reg(clk_i,rst_i,wdata_mtimecmp[`ysyx_22040501_WIDTH-1:0],mtimecmp[`ysyx_22040501_WIDTH-1:0],wen_mtimecmp);
ysyx_22040501_Reg #(1,0) msip_reg(clk_i,rst_i,wmsip,msip,wen_msip);
assign mtip_o = (mtime >= mtimecmp);
assign msip_o = msip;
endmodule
module ysyx_22040501(
input					 					clock,
input					 					reset,
input					 					io_interrupt,
input         					io_master_awready,
output        					io_master_awvalid,
output [3:0]   					io_master_awid,
output [31:0]  					io_master_awaddr,
output [7:0]   					io_master_awlen,
output [2:0]   					io_master_awsize,
output [1:0]   					io_master_awburst,
input         					io_master_wready,
output        					io_master_wvalid,
output [63:0]  					io_master_wdata,
output [7:0]   					io_master_wstrb,
output        					io_master_wlast,
output        					io_master_bready,
input         					io_master_bvalid,
input [3:0]    					io_master_bid,
input [1:0]    					io_master_bresp,
input         					io_master_arready,
output        					io_master_arvalid,
output [3:0]   					io_master_arid,
output [31:0]  					io_master_araddr,
output [7:0]   					io_master_arlen,
output [2:0]   					io_master_arsize,
output [1:0]   					io_master_arburst,
output        					io_master_rready,
input         					io_master_rvalid,
input [3:0]    					io_master_rid,
input [1:0]    					io_master_rresp,
input [63:0]   					io_master_rdata,
input         					io_master_rlast,
output        					io_slave_awready,
input         					io_slave_awvalid,
input [3:0]    					io_slave_awid,
input [31:0]   					io_slave_awaddr,
input [7:0]    					io_slave_awlen,
input [2:0]    					io_slave_awsize,
input [1:0]    					io_slave_awburst,
output        					io_slave_wready,
input         					io_slave_wvalid,
input [63:0]   					io_slave_wdata,
input [7:0]    					io_slave_wstrb,
input         					io_slave_wlast,
input         					io_slave_bready,
output        					io_slave_bvalid,
output [3:0]   					io_slave_bid,
output [1:0]   					io_slave_bresp,
output        					io_slave_arready,
input         					io_slave_arvalid,
input [3:0]    					io_slave_arid,
input [31:0]   					io_slave_araddr,
input [7:0]    					io_slave_arlen,
input [2:0]    					io_slave_arsize,
input [1:0]    					io_slave_arburst,
input         					io_slave_rready,
output        					io_slave_rvalid,
output [3:0]   					io_slave_rid,
output [1:0]   					io_slave_rresp,
output [63:0]  					io_slave_rdata,
output        					io_slave_rlast,
output [5:0]   					io_sram0_addr,
output        					io_sram0_cen,
output        					io_sram0_wen,
output [127:0] 					io_sram0_wmask,
output [127:0] 					io_sram0_wdata,
input [127:0]  					io_sram0_rdata,
output [5:0]   					io_sram1_addr,
output        					io_sram1_cen,
output        					io_sram1_wen,
output [127:0] 					io_sram1_wmask,
output [127:0] 					io_sram1_wdata,
input [127:0]  					io_sram1_rdata,
output [5:0]   					io_sram2_addr,
output        					io_sram2_cen,
output        					io_sram2_wen,
output [127:0] 					io_sram2_wmask,
output [127:0] 					io_sram2_wdata,
input [127:0]  					io_sram2_rdata,
output [5:0]   					io_sram3_addr,
output        					io_sram3_cen,
output        					io_sram3_wen,
output [127:0] 					io_sram3_wmask,
output [127:0] 					io_sram3_wdata,
input [127:0]  					io_sram3_rdata,
output [5:0]   					io_sram4_addr,
output        					io_sram4_cen,
output        					io_sram4_wen,
output [127:0] 					io_sram4_wmask,
output [127:0] 					io_sram4_wdata,
input [127:0]  					io_sram4_rdata,
output [5:0]   					io_sram5_addr,
output        					io_sram5_cen,
output        					io_sram5_wen,
output [127:0] 					io_sram5_wmask,
output [127:0] 					io_sram5_wdata,
input [127:0]  					io_sram5_rdata,
output [5:0]   					io_sram6_addr,
output        					io_sram6_cen,
output        					io_sram6_wen,
output [127:0] 					io_sram6_wmask,
output [127:0] 					io_sram6_wdata,
input [127:0]  					io_sram6_rdata,
output [5:0]   					io_sram7_addr,
output        					io_sram7_cen,
output        					io_sram7_wen,
output [127:0] 					io_sram7_wmask,
output [127:0] 					io_sram7_wdata,
input [127:0]  					io_sram7_rdata
);
wire 	[`ysyx_22040501_WIDTH-1:0]			data_src1_R_DEp;
wire 	[`ysyx_22040501_WIDTH-1:0]			data_src2_R_DEp;
wire	[`ysyx_22040501_WIDTH-1:0] 			pc_R_F_FDp;
wire  [`ysyx_22040501_WIDTH-1:0]			data_csr_w_E_CSR;
wire  [`ysyx_22040501_WIDTH-1:0]  		data_dst_w__R;
wire  [`ysyx_22040501_WIDTH-1:0]			data_csr_r_CSR_E;
wire										interrupt_CSR_C_DEp;
wire  [`ysyx_22040501_WIDTH-1:0]			mtvec_r_CSR_R;
wire										if_end_F_FDp;
wire	[31:0]						inst_F_FDp;
wire	[`ysyx_22040501_WIDTH-1:0]			pc_F_IC;
wire										addr_valid_F_IC;
wire										if_start_FDp_F;
wire							  		write_pr_en_FDp_DEp;
wire										npc_valid_FDp_R;
wire	 									id_start_FDp_D;
wire										pc_recover_FDp_C;
wire [31:0]							inst_FDp_D_DEp;
wire [`ysyx_22040501_WIDTH-1:0]				pc_FDp_DEp;
wire  [11:0]						addr_csr_D_DEp;
wire	[`ysyx_22040501_R_ADDR_W-1:0]		addr_src1_D_R_DEp;
wire	[`ysyx_22040501_R_ADDR_W-1:0]		addr_src2_D_R_DEp;
wire 										id_ready_D_FDp;
wire										id_valid_D_DEp;
wire		[3:0]						inst_key_D_DEp;
wire	[`ysyx_22040501_R_ADDR_W-1:0]		addr_dst_D_DEp;
wire										wen_D_DEp;
wire 										wen_csr_D_DEp;
wire										is_ecall_D_DEp;
wire										is_mret_D_DEp;
wire										is_load_D_DEp;
wire 	[`ysyx_22040501_WIDTH-1:0]			imm_D_DEp;
wire	[`ysyx_22040501_OP_NUM-1:0]			alu_key_D_DEp;
wire	[`ysyx_22040501_A_NUM-1:0]			alu_A_key_D_DEp;
wire	[`ysyx_22040501_B_NUM-1:0]			alu_B_key_D_DEp;
wire  [`ysyx_22040501_SHAMT_NUM-1:0]	shamt_key_D_DEp;
wire 										alu_result_key_D_DEp;
wire	[`ysyx_22040501_RESULT_NUM-1:0]	result_key_D_DEp;
wire	[`ysyx_22040501_CSR_KEY_NUM-1:0]data_csr_key_D_DEp;
wire 	[`ysyx_22040501_LOAD_NUM-1:0]		load_data_key_D_DEp;
wire 	[7:0]							store_mask_D_DEp;
wire										read_en_D_DEp;
wire										write_en_D_DEp;
wire										is_fencei_D_DEp_FDp;
wire	[1:0]							mul_sign_key_D_DEp;
wire	[2:0]							ls_size_D_DEp;
wire										csr_i_or_r_key_D_DEp;
wire										DEp_ready_DEp_D;
wire										write_pr_en_DEP_ELSp_FWU;
wire										wen_csr_DEp_CSR;
wire										exe_start_DEp_E;
wire	[31:0]						inst_DEp_BJ;
wire	[`ysyx_22040501_WIDTH-1:0]			pc_DEp_E_ELSp_CSR;
wire	[`ysyx_22040501_WIDTH-1:0]			data_src1_DEp_;
wire	[`ysyx_22040501_WIDTH-1:0]			data_src2_DEp_;
wire	[`ysyx_22040501_WIDTH-1:0]			imm_DEp_E;
wire	[`ysyx_22040501_OP_NUM-1:0]			alu_key_DEp_E;
wire	[`ysyx_22040501_A_NUM-1:0]			alu_A_key_DEp_E;
wire	[`ysyx_22040501_B_NUM-1:0]			alu_B_key_DEp_E;
wire	[`ysyx_22040501_SHAMT_NUM-1:0]	shamt_key_DEp_E;
wire										alu_result_key_DEp_E;
wire	[`ysyx_22040501_RESULT_NUM-1:0]	result_key_DEp_E;
wire	[`ysyx_22040501_CSR_KEY_NUM-1:0]data_csr_key_DEp_E;
wire	[`ysyx_22040501_LOAD_NUM-1:0]		load_data_key_DEp_ELSp;
wire	[7:0]							store_mask_DEp_ELSp;
wire										read_en_DEp_ELSp;
wire										write_en_DEp_ELSp;
wire										wen_DEp_ELSp;
wire										is_ecall_DEp_CSR;
wire										is_mret_DEp_CSR;
wire										is_load_DEp_ELSp;
wire	[`ysyx_22040501_R_ADDR_W-1:0]		addr_dst_DEp_ELSp_FWU;
wire	[11:0]						addr_csr_DEp_CSR;
wire	[3:0]							inst_key_DEp_FWU;
wire 	[`ysyx_22040501_R_ADDR_W-1:0]		addr_src1_DEp_FWU;
wire	[`ysyx_22040501_R_ADDR_W-1:0]		addr_src2_DEp_FWU;
wire										is_fencei_DEp_ELSp;
wire	[1:0]							mul_sign_key_DEp_E;
wire										write_pr_en_DEp_C;
wire 	[2:0]							ls_size_DEp_ELSp;
wire										csr_i_or_r_key_DEp_E;
wire 										exe_ready_E_DEp;
wire 										exe_end_E_ELSp;
wire  [`ysyx_22040501_WIDTH-1:0] 			data_dst_E_ELSp;
wire	[`ysyx_22040501_WIDTH-1:0]			npc_E_R;
wire [`ysyx_22040501_WIDTH-1:0]				address_E_ELSp;
wire [`ysyx_22040501_WIDTH-1:0] 			src1__E;
wire [`ysyx_22040501_WIDTH-1:0]				src2__E;
wire 										ELSp_ready_ELSp_E;
wire										write_pr_en_ELSp_LSRp_FWU;
wire										ls_start_ELSp_LS;
wire	[`ysyx_22040501_LOAD_NUM-1:0]		load_data_key_ELSp_LS;
wire	[7:0]							store_mask_ELSp_LS;
wire										read_en_ELSp_LS;
wire										write_en_ELSp_LS;
wire	[`ysyx_22040501_WIDTH-1:0]			address_ELSp_LS;
wire	[`ysyx_22040501_WIDTH-1:0]			store_data_ELSp_LS;
wire										wen_ELSp_LSRp;
wire										is_load_ELSp_LSRp;
wire	[`ysyx_22040501_R_ADDR_W-1:0]		addr_dst_ELSp_LSRp;
wire	[`ysyx_22040501_WIDTH-1:0]			data_dst_ELSp_LSRp_FWU;
wire	[`ysyx_22040501_WIDTH-1:0]			pc_ELSp_LSRp;
wire [`ysyx_22040501_WIDTH-1:0] 			store_data__ELSp;
wire										is_fencei_ELSp_LS;
wire	[2:0]							ls_size_ELSp_LS;
wire  									is_fencei_ELSp_IC;
wire										lsu_ready_LS_ELSp;
wire 										ls_end_LS_LSRp;
wire  [`ysyx_22040501_WIDTH-1:0]			load_data_LS_LSRp;
wire										fencei_end_LS_FDp_ELSp;
wire  [`ysyx_22040501_WIDTH-1:0]			address_LS_DC_CL;
wire										addr_r_valid_LS_DC;
wire										addr_w_valid_LS_DC;
wire	[`ysyx_22040501_WIDTH-1:0]			store_data_LS_DC_CL;
wire	[7:0]							store_mask_LS_DC_CL;
wire										is_fencei_LS_DC;
wire										is_clint_LS_CL;
wire										clint_r_en_LS_CL;
wire										clint_w_en_LS_CL;
wire	[2:0]							ls_size_LS_DC;
wire	[`ysyx_22040501_R_ADDR_W-1:0]		addr_dst_LSRp_R;
wire										wen_LSRp_R;
wire 										LSRp_ready_LSRp_LS;
wire										write_pr_en_LSRp_FWU;
wire										is_load_LSRp_;
wire	[`ysyx_22040501_WIDTH-1:0]			data_dst_LSRp_R_FWU;
wire	[`ysyx_22040501_WIDTH-1:0]			load_data_LSRp_R_FWU;
wire [`ysyx_22040501_WIDTH-1:0] 			src1__BJ;
wire [`ysyx_22040501_WIDTH-1:0]				src2__BJ;
wire										pc_jump_BJ_C;
wire  [`ysyx_22040501_PC_NUM-1:0] 		pc_key_BJ_E;
wire										add_nouse_inst_FWU_BJ;
wire										src1_key_FWU_;
wire										src2_key_FWU_;
wire	[`ysyx_22040501_WIDTH-1:0]			src1_forward_FWU_;
wire	[`ysyx_22040501_WIDTH-1:0]			src2_forward_FWU_;
wire	[31:0]						inst_IC_F;
wire										inst_valid_IC_F;
wire										fencei_end_IC_ELSp;
wire	[`ysyx_22040501_WIDTH-1:0]			load_data_DC_LS;
wire										read_end_DC_LS;
wire										write_end_DC_LS;
wire										fencei_end_DC_LS;
wire										clint_r_end_CL_LS;
wire										clint_w_end_CL_LS;
wire [`ysyx_22040501_WIDTH-1:0]				clint_rdata_CL_LS;
wire										mtip_CL_CSR;
wire										msip_CL_CSR;
wire [`ysyx_22040501_AWIDTH-1:0]			araddr_IC_A;
wire										arvalid_IC_A;
wire										arready_IC_A;
wire [`ysyx_22040501_WIDTH-1:0]				rdata_IC_A;
wire [1:0]							rresp_IC_A;
wire										rvalid_IC_A;
wire										rready_IC_A;
wire	[2:0]							arsize_IC_A;
wire	[`ysyx_22040501_AWIDTH-1:0]			araddr_DC_A;
wire										arvalid_DC_A;
wire										arready_DC_A;
wire		[`ysyx_22040501_WIDTH-1:0]		rdata_DC_A;
wire		[1:0]						rresp_DC_A;
wire										rvalid_DC_A;
wire										rready_DC_A;
wire	[`ysyx_22040501_AWIDTH-1:0]			awaddr_DC_A;
wire										awvalid_DC_A;
wire										awready_DC_A;
wire	[`ysyx_22040501_WIDTH-1:0]			wdata_DC_A;
wire	[7:0]							wstrb_DC_A;
wire										wvalid_DC_A;
wire										wready_DC_A;
wire		[1:0]						bresp_DC_A;
wire										bvalid_DC_A;
wire										bready_DC_A;
wire										wlast_DC_A;
wire 		[2:0]						arsize_DC_A;
wire 		[2:0]						awsize_DC_A;
assign 	io_master_awid[3:0] = 4'b0;
assign 	io_master_awlen[7:0] = 8'h00;
assign 	io_master_awburst[1:0] =2'b01;
assign 	io_master_arid[3:0] = 4'b0;
assign 	io_master_arlen[7:0] =8'h00;
assign 	io_master_arburst[1:0] =2'b01;
assign 	io_slave_awready = 0;
assign 	io_slave_wready = 0;
assign 	io_slave_bvalid = 0;
assign 	io_slave_bid = 0;
assign 	io_slave_bresp = 0;
assign 	io_slave_arready = 0;
assign 	io_slave_rvalid = 0;
assign 	io_slave_rid = 0;
assign 	io_slave_rresp = 0;
assign 	io_slave_rdata = 0;
assign 	io_slave_rlast = 0;
wire 										jump_stop_C_;
wire										wash_C_;
wire								intr_stop_C;
wire								mti_happen_C_CSR;
assign 	jump_stop_C_ = pc_jump_BJ_C&(npc_E_R[`ysyx_22040501_WIDTH-1:0]!=pc_DEp_E_ELSp_CSR[`ysyx_22040501_WIDTH-1:0]+4)|intr_stop_C;
wire 										if_ready;
wire 										if_not_ready;
wire										if_start_r;
ysyx_22040501_Reg #(1,0)  if_start_reg (clock,reset,if_start_FDp_F&(~if_end_F_FDp)? 1'b1: 1'b0,if_start_r,if_end_F_FDp|(if_start_FDp_F&(~if_end_F_FDp)));
assign if_not_ready = (if_start_r | (if_start_FDp_F&(~if_end_F_FDp)) )& (~if_end_F_FDp);
assign if_ready = ~if_not_ready;
assign 		wash_C_ = jump_stop_C_ & if_ready & id_ready_D_FDp &exe_ready_E_DEp;
wire										add_nouse_inst_ready;
wire 										add_nouse_inst_C_;
assign  add_nouse_inst_ready = add_nouse_inst_C_& if_ready &id_ready_D_FDp&exe_ready_E_DEp&lsu_ready_LS_ELSp;
wire										add_nouse_inst_r;
ysyx_22040501_Reg #(1,0)  add_nouse_inst_reg(clock,reset,add_nouse_inst_ready? 1'b0:1'b1,add_nouse_inst_r,add_nouse_inst_FWU_BJ|add_nouse_inst_ready);
assign add_nouse_inst_C_ = (add_nouse_inst_FWU_BJ|add_nouse_inst_r);
wire		add_start_r;
wire		add_start_C;
wire		add_start0_C;
ysyx_22040501_Reg #(1,0) add_start_reg(clock,reset,add_nouse_inst_ready,add_start_r,1'b1);
assign add_start0_C = add_nouse_inst_ready & (~add_start_r);
ysyx_22040501_Reg #(1,0) add_start_delay_reg(clock,reset,add_start0_C,add_start_C,1'b1);
wire							  pc_recover_C_R;
assign pc_recover_C_R = pc_recover_FDp_C;//pc_recover_DEp_C|pc_recover_FDp_C;
ysyx_22040501_Reg #(1,0) intr_stop_reg(clock,reset,wash_C_?1'b0:write_pr_en_DEp_C,intr_stop_C,(write_pr_en_DEp_C&interrupt_CSR_C_DEp)|wash_C_);
assign	mti_happen_C_CSR = intr_stop_C & wash_C_;
ysyx_22040501_LS_REGS ls_reg_r(
	.clk_i								(clock),
	.rst_i								(reset),
	.LSRp_ready_o					(LSRp_ready_LSRp_LS),
	.ls_valid_i						(ls_end_LS_LSRp),
	.last_write_pr_en_i		(write_pr_en_ELSp_LSRp_FWU),
	.write_pr_en_o				(write_pr_en_LSRp_FWU),
	.wenR_i								(wen_ELSp_LSRp),
	.is_load_i						(is_load_ELSp_LSRp),
	.addr_dst_i						(addr_dst_ELSp_LSRp[`ysyx_22040501_R_ADDR_W-1:0]),
	.data_dst_i						(data_dst_ELSp_LSRp_FWU[`ysyx_22040501_WIDTH-1:0]),
	.load_data_i					(load_data_LS_LSRp[`ysyx_22040501_WIDTH-1:0]),
	.wenR_o								(wen_LSRp_R),
	.is_load_o						(is_load_LSRp_),
	.addr_dst_o						(addr_dst_LSRp_R[`ysyx_22040501_R_ADDR_W-1:0]),
	.data_dst_o						(data_dst_LSRp_R_FWU[`ysyx_22040501_WIDTH-1:0]),
	.load_data_o					(load_data_LSRp_R_FWU[`ysyx_22040501_WIDTH-1:0])
);
assign data_dst_w__R[`ysyx_22040501_WIDTH-1:0] = is_load_LSRp_ ? load_data_LSRp_R_FWU[`ysyx_22040501_WIDTH-1:0]: data_dst_LSRp_R_FWU[`ysyx_22040501_WIDTH-1:0];
ysyx_22040501_REGS regs(
	.clk_i								(clock),
  .rst_i								(reset),
  .data_dst_w_i					(data_dst_w__R),
	.npc_i								(mti_happen_C_CSR ? mtvec_r_CSR_R:npc_E_R[`ysyx_22040501_WIDTH-1:0]),
	.pc_jump_i						(wash_C_),
  .addr_dst_w_i					(addr_dst_LSRp_R[`ysyx_22040501_R_ADDR_W-1:0]),
  .wen_i								(wen_LSRp_R),
  .addr_src1_r_i				(addr_src1_D_R_DEp[`ysyx_22040501_R_ADDR_W-1:0]),
  .addr_src2_r_i				(addr_src2_D_R_DEp[`ysyx_22040501_R_ADDR_W-1:0]),
  .data_src1_r_o				(data_src1_R_DEp[`ysyx_22040501_WIDTH-1:0]),
  .data_src2_r_o				(data_src2_R_DEp[`ysyx_22040501_WIDTH-1:0]),
  .pc_o									(pc_R_F_FDp[`ysyx_22040501_WIDTH-1:0]),
	.npc_valid_i					(npc_valid_FDp_R),
	.pc_recover_i					(pc_recover_C_R)
);
ysyx_22040501_CSRS csrs(
.clk_i									(clock),
.rst_i									(reset),
.wen_csr_i							(wen_csr_DEp_CSR),
.addr_csr_r_i						(addr_csr_DEp_CSR[11:0]),
.addr_csr_w_i						(addr_csr_DEp_CSR[11:0]),
.data_csr_w_i						(data_csr_w_E_CSR[`ysyx_22040501_WIDTH-1:0]),
.is_ecall_i							(is_ecall_DEp_CSR & wash_C_),
.is_mret_i							(is_mret_DEp_CSR & wash_C_),
.ecall_pc_i							(pc_DEp_E_ELSp_CSR[`ysyx_22040501_WIDTH-1:0]),
.data_csr_r_o						(data_csr_r_CSR_E),
.mtvec_r_o							(mtvec_r_CSR_R),
.mtip_i									(mtip_CL_CSR),
.meip_i									(io_interrupt),
.msip_i									(msip_CL_CSR),
.interrupt_o						(interrupt_CSR_C_DEp),
.mintr_happen_i						(mti_happen_C_CSR)
);
ysyx_22040501_IFU ifu(
	.clk_i								(clock),
	.rst_i								(reset),
	.if_end_o							(if_end_F_FDp),
	.if_start_i						(if_start_FDp_F),
	.pc_i									(pc_R_F_FDp[`ysyx_22040501_WIDTH-1:0]), 
	.inst_to_IDU_o				(inst_F_FDp[31:0]),
	.pc_o									(pc_F_IC[`ysyx_22040501_WIDTH-1:0]),
	.addr_valid_o					(addr_valid_F_IC),
	.inst_i								(inst_IC_F[31:0]),
	.inst_valid_i					(inst_valid_IC_F)	
 );
ysyx_22040501_ICACHE icache(
	.clk_i								(clock),
	.rst_i								(reset),
	.pc_i									(pc_F_IC[`ysyx_22040501_WIDTH-1:0]),
	.addr_valid_i					(addr_valid_F_IC),	
	.inst_o								(inst_IC_F[31:0]),
	.data_valid_o					(inst_valid_IC_F),
	.is_fencei_i					(is_fencei_ELSp_IC),
	.fencei_end_o					(fencei_end_IC_ELSp),
	.araddr_o							(araddr_IC_A),
	.arvalid_o						(arvalid_IC_A),
	.arready_i						(arready_IC_A),
	.rdata_i							(rdata_IC_A),
	.rresp_i							(rresp_IC_A),
	.rvalid_i							(rvalid_IC_A),
	.rready_o							(rready_IC_A),
	.arsize_o							(arsize_IC_A),
	.sram0_addr_o					(io_sram0_addr),
	.sram0_cen_o					(io_sram0_cen),
	.sram0_wen_o					(io_sram0_wen),
	.sram0_wmask_o				(io_sram0_wmask),
	.sram0_wdata_o				(io_sram0_wdata),
	.sram0_rdata_i				(io_sram0_rdata),
	.sram1_addr_o					(io_sram1_addr),
	.sram1_cen_o					(io_sram1_cen),
	.sram1_wen_o					(io_sram1_wen),
	.sram1_wmask_o				(io_sram1_wmask),
	.sram1_wdata_o				(io_sram1_wdata),
	.sram1_rdata_i				(io_sram1_rdata),
	.sram2_addr_o					(io_sram2_addr),
	.sram2_cen_o					(io_sram2_cen),
	.sram2_wen_o					(io_sram2_wen),
	.sram2_wmask_o				(io_sram2_wmask),
	.sram2_wdata_o				(io_sram2_wdata),
	.sram2_rdata_i				(io_sram2_rdata),
	.sram3_addr_o					(io_sram3_addr),
	.sram3_cen_o					(io_sram3_cen),
	.sram3_wen_o					(io_sram3_wen),
	.sram3_wmask_o				(io_sram3_wmask),
	.sram3_wdata_o				(io_sram3_wdata),
	.sram3_rdata_i				(io_sram3_rdata)
);
ysyx_22040501_IF_ID if_id_r(
	.clk_i								(clock),
	.rst_i								(reset),
	.if_valid_i						(if_end_F_FDp),
	.id_ready_i						(id_ready_D_FDp),
	.write_pr_en_o				(write_pr_en_FDp_DEp),
	.pc_change_start_o		(npc_valid_FDp_R),
	.id_start_o						(id_start_FDp_D),
	.if_start_o						(if_start_FDp_F),
	.stop_i								(jump_stop_C_),
	.wash_i								(wash_C_),
	.add_nouse_inst_i			(add_nouse_inst_C_),
	.add_start_i					(add_start_C),
	.pc_recover_o					(pc_recover_FDp_C),
	.is_fencei_i					(is_fencei_D_DEp_FDp),
	.fencei_end_add_start_i(fencei_end_LS_FDp_ELSp),
	.inst_i								(inst_F_FDp[31:0]),
	.pc_i									(pc_R_F_FDp[`ysyx_22040501_WIDTH-1:0]),
	.inst_o								(inst_FDp_D_DEp[31:0]),
	.pc_o									(pc_FDp_DEp[`ysyx_22040501_WIDTH-1:0]),
	.pc_IDR_i							(pc_DEp_E_ELSp_CSR)
);
ysyx_22040501_IDU idu(
	.id_start_i						(id_start_FDp_D),
	.id_ready_o						(id_ready_D_FDp),
	.id_valid_o						(id_valid_D_DEp),
	.DEp_ready_i					(DEp_ready_DEp_D),
	.inst_key_o						(inst_key_D_DEp[3:0]),
	.inst_i								(inst_FDp_D_DEp[31:0]),
	.addr_src1_o					(addr_src1_D_R_DEp[`ysyx_22040501_R_ADDR_W-1:0]),
	.addr_src2_o					(addr_src2_D_R_DEp[`ysyx_22040501_R_ADDR_W-1:0]),
	.addr_dst_o						(addr_dst_D_DEp[`ysyx_22040501_R_ADDR_W-1:0]),
	.addr_csr_o						(addr_csr_D_DEp[11:0]),
	.wen_o								(wen_D_DEp),
	.wen_csr_o						(wen_csr_D_DEp),
	.is_ecall_o						(is_ecall_D_DEp),
	.is_mret_o						(is_mret_D_DEp),
	.is_fencei_o					(is_fencei_D_DEp_FDp),
	.is_load_o						(is_load_D_DEp),
	.imm_o								(imm_D_DEp[`ysyx_22040501_WIDTH-1:0]),
	.alu_key_o						(alu_key_D_DEp[`ysyx_22040501_OP_NUM-1:0]),
	.mul_sign_key_o				(mul_sign_key_D_DEp[1:0]),
	.alu_A_key_o					(alu_A_key_D_DEp[`ysyx_22040501_A_NUM-1:0]),
	.alu_B_key_o					(alu_B_key_D_DEp[`ysyx_22040501_B_NUM-1:0]),
	.shamt_key_o					(shamt_key_D_DEp[`ysyx_22040501_SHAMT_NUM-1:0]),
	.alu_result_key_o			(alu_result_key_D_DEp),
	.result_key_o					(result_key_D_DEp[`ysyx_22040501_RESULT_NUM-1:0]),
	.data_csr_key_o				(data_csr_key_D_DEp[`ysyx_22040501_CSR_KEY_NUM-1:0]),
	.csr_i_or_r_key_o			(csr_i_or_r_key_D_DEp),
	.load_data_key_o			(load_data_key_D_DEp[`ysyx_22040501_LOAD_NUM-1:0]),
	.ls_size_o						(ls_size_D_DEp[2:0]),
	.store_mask_o					(store_mask_D_DEp[7:0]),
	.read_en_o						(read_en_D_DEp),
	.write_en_o						(write_en_D_DEp)
);
ysyx_22040501_ID_EX	id_ex_r(
	.clk_i								(clock),
	.rst_i								(reset),
	.id_valid_i						(id_valid_D_DEp),
	.last_write_pr_en_i		(write_pr_en_FDp_DEp),
	.write_pr_en_o				(write_pr_en_DEP_ELSp_FWU),
	.DEp_ready_o					(DEp_ready_DEp_D),
	.exe_ready_i					(exe_ready_E_DEp),
	.exe_start_o					(exe_start_DEp_E),
	.stop_i								(jump_stop_C_),
	.intr_stop_i					(interrupt_CSR_C_DEp),
	.wash_i								(wash_C_),
	.add_nouse_inst_i			(add_nouse_inst_C_),
	.add_start_i					(add_start_C),
	.write_pr_en1_o				(write_pr_en_DEp_C),
	.inst_i								(inst_FDp_D_DEp[31:0]),
	.pc_i									(pc_FDp_DEp),
	.src1_i								(data_src1_R_DEp[`ysyx_22040501_WIDTH-1:0]),
	.src2_i								(data_src2_R_DEp[`ysyx_22040501_WIDTH-1:0]),
	.imm_i								(imm_D_DEp[`ysyx_22040501_WIDTH-1:0]),
	.alu_key_i						(alu_key_D_DEp[`ysyx_22040501_OP_NUM-1:0]),
	.mul_sign_key_i				(mul_sign_key_D_DEp[1:0]),
	.alu_A_key_i					(alu_A_key_D_DEp[`ysyx_22040501_A_NUM-1:0]),
	.alu_B_key_i					(alu_B_key_D_DEp[`ysyx_22040501_B_NUM-1:0]),
	.shamt_key_i					(shamt_key_D_DEp[`ysyx_22040501_SHAMT_NUM-1:0]),
	.alu_result_key_i			(alu_result_key_D_DEp),
	.result_key_i					(result_key_D_DEp[`ysyx_22040501_RESULT_NUM-1:0]),
	.data_csr_key_i				(data_csr_key_D_DEp[`ysyx_22040501_CSR_KEY_NUM-1:0]),
	.csr_i_or_r_key_i			(csr_i_or_r_key_D_DEp),
	.load_data_key_i			(load_data_key_D_DEp[`ysyx_22040501_LOAD_NUM-1:0]),
	.store_mask_i					(store_mask_D_DEp[7:0]),
	.read_en_i						(read_en_D_DEp),
	.write_en_i						(write_en_D_DEp),
	.wenR_i								(wen_D_DEp),
	.wen_csr_i						(wen_csr_D_DEp),
	.is_ecall_i						(is_ecall_D_DEp),
	.is_mret_i						(is_mret_D_DEp),
	.is_load_i						(is_load_D_DEp),
	.addr_dst_i						(addr_dst_D_DEp[`ysyx_22040501_R_ADDR_W-1:0]),
	.addr_csr_i						(addr_csr_D_DEp[11:0]),
	.inst_key_i						(inst_key_D_DEp[3:0]),
  .addr_src1_r_i				(addr_src1_D_R_DEp[`ysyx_22040501_R_ADDR_W-1:0]),
  .addr_src2_r_i				(addr_src2_D_R_DEp[`ysyx_22040501_R_ADDR_W-1:0]),
	.is_fencei_i					(is_fencei_D_DEp_FDp),
	.ls_size_i						(ls_size_D_DEp[2:0]),
	.inst_o								(inst_DEp_BJ[31:0]),
	.pc_o									(pc_DEp_E_ELSp_CSR[`ysyx_22040501_WIDTH-1:0]),
	.src1_o								(data_src1_DEp_[`ysyx_22040501_WIDTH-1:0]),
	.src2_o								(data_src2_DEp_[`ysyx_22040501_WIDTH-1:0]),
	.imm_o								(imm_DEp_E[`ysyx_22040501_WIDTH-1:0]),
	.alu_key_o						(alu_key_DEp_E[`ysyx_22040501_OP_NUM-1:0]),
	.mul_sign_key_o				(mul_sign_key_DEp_E[1:0]),
	.alu_A_key_o					(alu_A_key_DEp_E[`ysyx_22040501_A_NUM-1:0]),
	.alu_B_key_o					(alu_B_key_DEp_E[`ysyx_22040501_B_NUM-1:0]),
	.shamt_key_o					(shamt_key_DEp_E[`ysyx_22040501_SHAMT_NUM-1:0]),
	.alu_result_key_o			(alu_result_key_DEp_E),
	.result_key_o					(result_key_DEp_E[`ysyx_22040501_RESULT_NUM-1:0]),
	.data_csr_key_o				(data_csr_key_DEp_E[`ysyx_22040501_CSR_KEY_NUM-1:0]),
	.csr_i_or_r_key_o			(csr_i_or_r_key_DEp_E),
	.load_data_key_o			(load_data_key_DEp_ELSp[`ysyx_22040501_LOAD_NUM-1:0]),
	.store_mask_o					(store_mask_DEp_ELSp[7:0]),
	.read_en_o						(read_en_DEp_ELSp),
	.write_en_o						(write_en_DEp_ELSp),
	.wenR_o								(wen_DEp_ELSp),
	.wen_csr_o						(wen_csr_DEp_CSR),
	.is_ecall_o						(is_ecall_DEp_CSR),
	.is_mret_o						(is_mret_DEp_CSR),
	.is_load_o						(is_load_DEp_ELSp),
	.addr_dst_o						(addr_dst_DEp_ELSp_FWU[`ysyx_22040501_R_ADDR_W-1:0]),
	.addr_csr_o						(addr_csr_DEp_CSR[11:0]),
	.inst_key_o						(inst_key_DEp_FWU[3:0]),
  .addr_src1_r_o				(addr_src1_DEp_FWU[`ysyx_22040501_R_ADDR_W-1:0]),
  .addr_src2_r_o				(addr_src2_DEp_FWU[`ysyx_22040501_R_ADDR_W-1:0]),
	.is_fencei_o					(is_fencei_DEp_ELSp),
	.ls_size_o						(ls_size_DEp_ELSp[2:0])
);
assign src1__BJ[`ysyx_22040501_WIDTH-1:0] =src1_key_FWU_ ?src1_forward_FWU_[`ysyx_22040501_WIDTH-1:0] :data_src1_DEp_[`ysyx_22040501_WIDTH-1:0];
assign src2__BJ[`ysyx_22040501_WIDTH-1:0] =src2_key_FWU_ ?src2_forward_FWU_[`ysyx_22040501_WIDTH-1:0] :data_src2_DEp_[`ysyx_22040501_WIDTH-1:0];
ysyx_22040501_B_Judge bjudge(
	.clk_i								(clock),
	.rst_i								(reset),
	.add_nouse_inst_i			(add_nouse_inst_FWU_BJ),
	.add_start_i					(add_start_C),
	.inst_i								(inst_DEp_BJ[31:0]),
	.src1_i								(src1__BJ[`ysyx_22040501_WIDTH-1:0]),
	.src2_i								(src2__BJ[`ysyx_22040501_WIDTH-1:0]),
	.pc_jump_o						(pc_jump_BJ_C),
	.pc_key_o							(pc_key_BJ_E[`ysyx_22040501_PC_NUM-1:0])
);
assign src1__E[`ysyx_22040501_WIDTH-1:0] =src1_key_FWU_ ? src1_forward_FWU_[`ysyx_22040501_WIDTH-1:0] :data_src1_DEp_[`ysyx_22040501_WIDTH-1:0];
assign src2__E[`ysyx_22040501_WIDTH-1:0] =src2_key_FWU_ ?src2_forward_FWU_[`ysyx_22040501_WIDTH-1:0] :data_src2_DEp_[`ysyx_22040501_WIDTH-1:0];
ysyx_22040501_EXU exu(
	.clk_i								(clock),
	.rst_i								(reset),
	.ELSp_ready_i					(ELSp_ready_ELSp_E),
	.exe_ready_o					(exe_ready_E_DEp),
	.exe_end_o						(exe_end_E_ELSp),
	.exe_start_i					(exe_start_DEp_E),
	.src1_i								(src1__E[`ysyx_22040501_WIDTH-1:0]),
	.src2_i								(src2__E[`ysyx_22040501_WIDTH-1:0]),
	.csr_i								(data_csr_r_CSR_E[`ysyx_22040501_WIDTH-1:0]),
	.pc_i									(pc_DEp_E_ELSp_CSR[`ysyx_22040501_WIDTH-1:0]),
	.data_dst_o						(data_dst_E_ELSp[`ysyx_22040501_WIDTH-1:0]),
	.data_csr_o						(data_csr_w_E_CSR[`ysyx_22040501_WIDTH-1:0]),
	.npc_o								(npc_E_R[`ysyx_22040501_WIDTH-1:0]),
	.imm_i								(imm_DEp_E),
	.alu_key_i						(alu_key_DEp_E[`ysyx_22040501_OP_NUM-1:0]),
	.mul_sign_key_i				(mul_sign_key_DEp_E[1:0]),
	.alu_A_key_i					(alu_A_key_DEp_E[`ysyx_22040501_A_NUM-1:0]),
	.alu_B_key_i					(alu_B_key_DEp_E[`ysyx_22040501_B_NUM-1:0]),
	.shamt_key_i					(shamt_key_DEp_E[`ysyx_22040501_SHAMT_NUM-1:0]),
	.pc_key_i							(pc_key_BJ_E[`ysyx_22040501_PC_NUM-1:0]),
	.alu_result_key_i			(alu_result_key_DEp_E),
	.result_key_i					(result_key_DEp_E[`ysyx_22040501_RESULT_NUM-1:0]),
	.data_csr_key_i				(data_csr_key_DEp_E[`ysyx_22040501_CSR_KEY_NUM-1:0]),
	.csr_i_or_r_key_i			(csr_i_or_r_key_DEp_E),
	.address_o						(address_E_ELSp[`ysyx_22040501_WIDTH-1:0])
);
assign store_data__ELSp[`ysyx_22040501_WIDTH-1:0] = src2_key_FWU_? src2_forward_FWU_[`ysyx_22040501_WIDTH-1:0] : data_src2_DEp_[`ysyx_22040501_WIDTH-1:0];
ysyx_22040501_EX_LS ex_ls_r(
	.clk_i								(clock),
	.rst_i								(reset),
	.exe_valid_i					(exe_end_E_ELSp),
	.lsu_ready_i					(lsu_ready_LS_ELSp),
	.ELSp_ready_o					(ELSp_ready_ELSp_E),
	.last_write_pr_en_i		(write_pr_en_DEP_ELSp_FWU|add_start0_C),
	.write_pr_en_o				(write_pr_en_ELSp_LSRp_FWU),
	.ls_start_o						(ls_start_ELSp_LS),
	.fencei_end_d_i				(fencei_end_LS_FDp_ELSp),
	.fencei_end_i_i				(fencei_end_IC_ELSp),
	.load_data_key_i			(load_data_key_DEp_ELSp[`ysyx_22040501_LOAD_NUM-1:0]),
	.store_mask_i					(store_mask_DEp_ELSp[7:0]),
	.read_en_i						(read_en_DEp_ELSp),
	.write_en_i						(write_en_DEp_ELSp),
	.address_i						(address_E_ELSp[`ysyx_22040501_WIDTH-1:0]),
	.store_data_i					(store_data__ELSp),
	.wenR_i								(wen_DEp_ELSp),
	.is_load_i						(is_load_DEp_ELSp),
	.addr_dst_i						(addr_dst_DEp_ELSp_FWU[`ysyx_22040501_R_ADDR_W-1:0]),
	.data_dst_i						(data_dst_E_ELSp[`ysyx_22040501_WIDTH-1:0]),
	.pc_i									(pc_DEp_E_ELSp_CSR[`ysyx_22040501_WIDTH-1:0]),
	.is_fencei_i					(is_fencei_DEp_ELSp),
	.ls_size_i						(ls_size_DEp_ELSp[2:0]),
	.load_data_key_o			(load_data_key_ELSp_LS[`ysyx_22040501_LOAD_NUM-1:0]),
	.store_mask_o					(store_mask_ELSp_LS[7:0]),
	.read_en_o						(read_en_ELSp_LS),
	.write_en_o						(write_en_ELSp_LS),
	.address_o						(address_ELSp_LS[`ysyx_22040501_WIDTH-1:0]),
	.store_data_o					(store_data_ELSp_LS[`ysyx_22040501_WIDTH-1:0]),
	.wenR_o								(wen_ELSp_LSRp),
	.is_load_o						(is_load_ELSp_LSRp),
	.addr_dst_o						(addr_dst_ELSp_LSRp[`ysyx_22040501_R_ADDR_W-1:0]),
	.data_dst_o						(data_dst_ELSp_LSRp_FWU[`ysyx_22040501_WIDTH-1:0]),
	.pc_o									(pc_ELSp_LSRp[`ysyx_22040501_WIDTH-1:0]),
	.is_fencei_d_o				(is_fencei_ELSp_LS),
	.is_fencei_i_o				(is_fencei_ELSp_IC),
	.ls_size_o						(ls_size_ELSp_LS[2:0])
);
ysyx_22040501_LSU lsu(
.clk_i									(clock),
.rst_i									(reset),
.lsu_ready_o						(lsu_ready_LS_ELSp),
.ls_end_o								(ls_end_LS_LSRp),
.LSRp_ready_i						(LSRp_ready_LSRp_LS),
.is_fencei_i						(is_fencei_ELSp_LS),
.fencei_end_o						(fencei_end_LS_FDp_ELSp),
.store_data_i						(store_data_ELSp_LS[`ysyx_22040501_WIDTH-1:0]),
.load_data_o						(load_data_LS_LSRp[`ysyx_22040501_WIDTH-1:0]),
.read_en_i							(read_en_ELSp_LS),
.write_en_i							(write_en_ELSp_LS),
.store_mask_i						(store_mask_ELSp_LS[7:0]),
.load_data_key_i				(load_data_key_ELSp_LS[`ysyx_22040501_LOAD_NUM-1:0]),
.ls_size_i							(ls_size_ELSp_LS[2:0]),
.address_i							(address_ELSp_LS[`ysyx_22040501_WIDTH-1:0]),
.ls_start_i							(ls_start_ELSp_LS),
.address_o							(address_LS_DC_CL[`ysyx_22040501_WIDTH-1:0]),
.addr_r_valid_o					(addr_r_valid_LS_DC),
.load_data_i						(load_data_DC_LS[`ysyx_22040501_WIDTH-1:0]),
.read_end_i							(read_end_DC_LS|clint_r_end_CL_LS),
.addr_w_valid_o					(addr_w_valid_LS_DC),
.store_data_o						(store_data_LS_DC_CL[`ysyx_22040501_WIDTH-1:0]),
.store_mask_o						(store_mask_LS_DC_CL[7:0]),
.write_end_i						(write_end_DC_LS|clint_w_end_CL_LS),
.is_fencei_o						(is_fencei_LS_DC),
.fencei_end_i						(fencei_end_DC_LS),
.ls_size_o							(ls_size_LS_DC[2:0]),
.is_clint_o							(is_clint_LS_CL),
.clint_data_i						(clint_rdata_CL_LS[`ysyx_22040501_WIDTH-1:0]),
.clint_w_en_o						(clint_w_en_LS_CL),
.clint_r_en_o						(clint_r_en_LS_CL)
);
ysyx_22040501_CLINT clint(
.clk_i									(clock),
.rst_i									(reset),
.clint_addr_i						(address_LS_DC_CL[`ysyx_22040501_WIDTH-1:0]),
.clint_ren_i						(clint_r_en_LS_CL),
.clint_rdata_o					(clint_rdata_CL_LS[`ysyx_22040501_WIDTH-1:0]),
.clint_wen_i						(clint_w_en_LS_CL),
.clint_wdata_i					(store_data_LS_DC_CL[`ysyx_22040501_WIDTH-1:0]),
.clint_wmask_i					(store_mask_LS_DC_CL[7:0]),
.is_clint_i							(is_clint_LS_CL),
.clint_rend_o						(clint_r_end_CL_LS),
.clint_wend_o						(clint_w_end_CL_LS),
.mtip_o									(mtip_CL_CSR),
.msip_o									(msip_CL_CSR)
);
ysyx_22040501_DCACHE dcache(
.clk_i									(clock),
.rst_i									(reset),
.addr_i									(address_LS_DC_CL[`ysyx_22040501_WIDTH-1:0]),
.addr_r_valid_i					(addr_r_valid_LS_DC),	
.data_r_o								(load_data_DC_LS[`ysyx_22040501_WIDTH-1:0]),
.read_end_o							(read_end_DC_LS),
.addr_w_valid_i					(addr_w_valid_LS_DC),
.data_w_i								(store_data_LS_DC_CL[`ysyx_22040501_WIDTH-1:0]),
.w_mask_i								(store_mask_LS_DC_CL[7:0]),
.w_end_o								(write_end_DC_LS),
.is_fencei_i						(is_fencei_LS_DC),
.fencei_end_o						(fencei_end_DC_LS),
.ls_size_i							(ls_size_LS_DC[2:0]),
.araddr_o								(araddr_DC_A),
.arvalid_o							(arvalid_DC_A),
.arready_i							(arready_DC_A),
.rdata_i								(rdata_DC_A),
.rresp_i								(rresp_DC_A),
.rvalid_i								(rvalid_DC_A),
.rready_o								(rready_DC_A),
.awaddr_o								(awaddr_DC_A),
.awvalid_o							(awvalid_DC_A),
.awready_i							(awready_DC_A),
.wdata_o								(wdata_DC_A),
.wstrb_o								(wstrb_DC_A),
.wvalid_o								(wvalid_DC_A),
.wready_i								(wready_DC_A),
.bresp_i								(bresp_DC_A),
.bvalid_i								(bvalid_DC_A),
.bready_o								(bready_DC_A),
.wlast_o								(wlast_DC_A),
.arsize_o								(arsize_DC_A),
.awsize_o								(awsize_DC_A),
.sram4_addr_o						(io_sram4_addr),
.sram4_cen_o						(io_sram4_cen),
.sram4_wen_o						(io_sram4_wen),
.sram4_wmask_o					(io_sram4_wmask),
.sram4_wdata_o					(io_sram4_wdata),
.sram4_rdata_i					(io_sram4_rdata),
.sram5_addr_o						(io_sram5_addr),
.sram5_cen_o						(io_sram5_cen),
.sram5_wen_o						(io_sram5_wen),
.sram5_wmask_o					(io_sram5_wmask),
.sram5_wdata_o					(io_sram5_wdata),
.sram5_rdata_i					(io_sram5_rdata),
.sram6_addr_o						(io_sram6_addr),
.sram6_cen_o						(io_sram6_cen),
.sram6_wen_o						(io_sram6_wen),
.sram6_wmask_o					(io_sram6_wmask),
.sram6_wdata_o					(io_sram6_wdata),
.sram6_rdata_i					(io_sram6_rdata),
.sram7_addr_o						(io_sram7_addr),
.sram7_cen_o						(io_sram7_cen),
.sram7_wen_o						(io_sram7_wen),
.sram7_wmask_o					(io_sram7_wmask),
.sram7_wdata_o					(io_sram7_wdata),
.sram7_rdata_i					(io_sram7_rdata)
);
ysyx_22040501_AXI_Arbiter axi_arbiter(
.clk_i									(clock),
.rst_i									(reset),
.araddr_F_i							(araddr_IC_A),
.arvalid_F_i						(arvalid_IC_A),
.arready_F_o						(arready_IC_A),
.rdata_F_o							(rdata_IC_A),
.rresp_F_o							(rresp_IC_A),
.rvalid_F_o							(rvalid_IC_A),
.rready_F_i							(rready_IC_A),
.arsize_F_i							(arsize_IC_A),
.araddr_LS_i						(araddr_DC_A),
.arvalid_LS_i						(arvalid_DC_A),
.arready_LS_o						(arready_DC_A),
.rdata_LS_o							(rdata_DC_A),
.rresp_LS_o							(rresp_DC_A),
.rvalid_LS_o						(rvalid_DC_A),
.rready_LS_i						(rready_DC_A),
.awaddr_LS_i						(awaddr_DC_A),
.awvalid_LS_i						(awvalid_DC_A),
.awready_LS_o						(awready_DC_A),
.wdata_LS_i							(wdata_DC_A),
.wstrb_LS_i							(wstrb_DC_A),
.wvalid_LS_i						(wvalid_DC_A),
.wready_LS_o						(wready_DC_A),
.bresp_LS_o							(bresp_DC_A),
.bvalid_LS_o						(bvalid_DC_A),
.bready_LS_i						(bready_DC_A),
.wlast_LS_i							(wlast_DC_A),
.arsize_LS_i						(arsize_DC_A),
.awsize_LS_i						(awsize_DC_A),
.araddr_o								(io_master_araddr),
.arvalid_o							(io_master_arvalid),
.arready_i							(io_master_arready),
.rdata_i								(io_master_rdata),
.rresp_i								(io_master_rresp),
.rvalid_i								(io_master_rvalid),
.rready_o								(io_master_rready),
.awaddr_o								(io_master_awaddr),
.awvalid_o							(io_master_awvalid),
.awready_i							(io_master_awready),
.wdata_o								(io_master_wdata),
.wstrb_o								(io_master_wstrb),
.wvalid_o								(io_master_wvalid),
.wready_i								(io_master_wready),
.bresp_i								(io_master_bresp),
.bvalid_i								(io_master_bvalid),
.bready_o								(io_master_bready),
.wlast_o								(io_master_wlast),
.arsize_o								(io_master_arsize),
.awsize_o								(io_master_awsize)
);
ysyx_22040501_Forward_Unit forwarding_uint (
.clk_i									(clock),
.rst_i									(reset),
.add_start_i						(add_start0_C),
.IDR_wen_i							(write_pr_en_DEP_ELSp_FWU),
.EXR_wen_i							(write_pr_en_ELSp_LSRp_FWU),
.LSR_wen_i							(write_pr_en_LSRp_FWU),
.inst_key_IDR_i					(inst_key_DEp_FWU[3:0]),
.addr_src1_IDR_i				(addr_src1_DEp_FWU[`ysyx_22040501_R_ADDR_W-1:0]),
.addr_src2_IDR_i				(addr_src2_DEp_FWU[`ysyx_22040501_R_ADDR_W-1:0]),
.addr_dst_IDR_i					(addr_dst_DEp_ELSp_FWU[`ysyx_22040501_R_ADDR_W-1:0]),
.wash_i									(wash_C_),
.intr_happen_i					(mti_happen_C_CSR),
.pc_IDR_i								(pc_DEp_E_ELSp_CSR[`ysyx_22040501_WIDTH-1:0]),
.pc_EXR_i								(pc_ELSp_LSRp[`ysyx_22040501_WIDTH-1:0]),
.data_dst_EXR_i					(data_dst_ELSp_LSRp_FWU[`ysyx_22040501_WIDTH-1:0]),
.data_dst_LSR_i					(data_dst_LSRp_R_FWU[`ysyx_22040501_WIDTH-1:0]),
.load_data_LSR_i				(load_data_LSRp_R_FWU[`ysyx_22040501_WIDTH-1:0]),	
.data_r_i								(data_dst_w__R),
.add_nouse_inst_o				(add_nouse_inst_FWU_BJ),
.src1_key_o							(src1_key_FWU_),
.src2_key_o							(src2_key_FWU_),
.src1_forward_o					(src1_forward_FWU_),
.src2_forward_o					(src2_forward_FWU_)
);
endmodule
`define ysyx_22040501_MSTATUS_MIE 3
`define ysyx_22040501_MSTATUS_MPIE 7
`define ysyx_22040501_MIP_MTIP 7
`define ysyx_22040501_MIE_MTIE 7
`define ysyx_22040501_MIP_MEIP 11
`define ysyx_22040501_MIE_MEIE 11
`define ysyx_22040501_MIP_MSIP 3
`define ysyx_22040501_MIE_MSIE 3
`define ysyx_22040501_MCAUSE_ECALL 64'h0000_0000_0000_000b
`define ysyx_22040501_MCAUSE_MTI 64'h8000_0000_0000_0007
`define ysyx_22040501_MCAUSE_MEI 64'h8000_0000_0000_000b
`define ysyx_22040501_MCAUSE_MSI 64'h8000_0000_0000_0003
module ysyx_22040501_CSRS(
	input 							clk_i,
	input 							rst_i,
	input 							wen_csr_i,
	input 	[11:0] 			addr_csr_r_i,
	input 	[11:0] 			addr_csr_w_i,
	input 	[`ysyx_22040501_WIDTH-1:0] data_csr_w_i,
	input								is_ecall_i,
	input								is_mret_i,
	input 	[`ysyx_22040501_WIDTH-1:0]ecall_pc_i,
	output 	[`ysyx_22040501_WIDTH-1:0]data_csr_r_o,
	output 	[`ysyx_22040501_WIDTH-1:0]mtvec_r_o,
	input								mtip_i,
	input								meip_i,
	input								msip_i,
	input								mintr_happen_i,
	output							interrupt_o
);
wire is_mti;
wire is_mei;
wire is_msi;
wire 	[`ysyx_22040501_WIDTH-1:0]		mtvec_r;
wire 	[`ysyx_22040501_WIDTH-1:0]		mpc_r;
wire	[`ysyx_22040501_WIDTH-1:0]		mcause_r;
wire	[`ysyx_22040501_WIDTH-1:0]		mstatus_r;
wire	[`ysyx_22040501_WIDTH-1:0]		mip_r;
wire	[`ysyx_22040501_WIDTH-1:0]		mie_r;
wire 	[`ysyx_22040501_WIDTH-1:0]		mtvec_w;
wire 	[`ysyx_22040501_WIDTH-1:0]		mpc_w;
wire	[`ysyx_22040501_WIDTH-1:0]		mcause_w;
wire	[`ysyx_22040501_WIDTH-1:0]		mstatus_w;
wire	[`ysyx_22040501_WIDTH-1:0]		mip_w;
wire	[`ysyx_22040501_WIDTH-1:0]		mie_w;
assign is_mti = (mip_r[`ysyx_22040501_MIP_MTIP]&mie_r[`ysyx_22040501_MIE_MTIE]);
assign is_mei = (mip_r[`ysyx_22040501_MIP_MEIP] & mie_r[`ysyx_22040501_MIE_MEIE]);
assign is_msi = (mip_r[`ysyx_22040501_MIP_MSIP] & mie_r[`ysyx_22040501_MIE_MSIE]);
assign interrupt_o =  mstatus_r[`ysyx_22040501_MSTATUS_MIE] &(is_mti|is_mei|is_msi);
assign mtvec_r_o[`ysyx_22040501_WIDTH-1:0] = mtvec_r[`ysyx_22040501_WIDTH-1:0];
assign mtvec_w[`ysyx_22040501_WIDTH-1:0] = data_csr_w_i[`ysyx_22040501_WIDTH-1:0];
assign mcause_w[`ysyx_22040501_WIDTH-1:0] = is_ecall_i ? `ysyx_22040501_MCAUSE_ECALL: (mintr_happen_i&is_mei)? `ysyx_22040501_MCAUSE_MEI :(mintr_happen_i&is_msi) ? `ysyx_22040501_MCAUSE_MSI :  (mintr_happen_i&is_mti) ? `ysyx_22040501_MCAUSE_MTI:data_csr_w_i[`ysyx_22040501_WIDTH-1:0];
assign mie_w[`ysyx_22040501_WIDTH-1:0] = data_csr_w_i[`ysyx_22040501_WIDTH-1:0];
assign mpc_w[`ysyx_22040501_WIDTH-1:0] = is_ecall_i|mintr_happen_i ? ecall_pc_i[`ysyx_22040501_WIDTH-1:0]:data_csr_w_i[`ysyx_22040501_WIDTH-1:0];
assign mip_w = (mtip_i|meip_i|msip_i) ? {mip_r[`ysyx_22040501_WIDTH-1:`ysyx_22040501_MIP_MEIP+1],meip_i,mip_r[`ysyx_22040501_MIP_MEIP-1:`ysyx_22040501_MIP_MTIP+1],mtip_i,mip_r[`ysyx_22040501_MIP_MTIP-1:`ysyx_22040501_MIP_MSIP+1],msip_i,mip_r[`ysyx_22040501_MIP_MSIP-1:0]}:0;
wire [1:0] mstatus_w_key;
assign mstatus_w_key[1:0] = {is_mret_i,is_ecall_i|mintr_happen_i};
ysyx_22040501_MuxKeyWithDefault #(2,2,`ysyx_22040501_WIDTH) mstatus_w_mux(mstatus_w[`ysyx_22040501_WIDTH-1:0],mstatus_w_key[1:0],data_csr_w_i[`ysyx_22040501_WIDTH-1:0],{
	2'b01, {mstatus_r[`ysyx_22040501_WIDTH-1:`ysyx_22040501_MSTATUS_MPIE+1],mstatus_r[`ysyx_22040501_MSTATUS_MIE],mstatus_r[`ysyx_22040501_MSTATUS_MPIE-1:`ysyx_22040501_MSTATUS_MIE+1],1'b0,mstatus_r[`ysyx_22040501_MSTATUS_MIE-1:0]},
	2'b10, {mstatus_r[`ysyx_22040501_WIDTH-1:`ysyx_22040501_MSTATUS_MPIE+1],1'b1,mstatus_r[`ysyx_22040501_MSTATUS_MPIE-1:`ysyx_22040501_MSTATUS_MIE+1],mstatus_r[`ysyx_22040501_MSTATUS_MPIE],mstatus_r[`ysyx_22040501_MSTATUS_MIE-1:0]}
});
wire 									mtvec_wen;
wire 									mpc_wen;
wire									mcause_wen;
wire									mstatus_wen;
wire									mip_wen;
wire									mie_wen;
assign	mtvec_wen = wen_csr_i&(addr_csr_w_i == `ysyx_22040501_MTVEC);
assign	mpc_wen =(wen_csr_i&(addr_csr_w_i == `ysyx_22040501_MPC))|is_ecall_i|mintr_happen_i;
assign	mcause_wen = (wen_csr_i&(addr_csr_w_i == `ysyx_22040501_MCAUSE))|is_ecall_i|mintr_happen_i;
assign	mstatus_wen = wen_csr_i&(addr_csr_w_i == `ysyx_22040501_MSTATUS)|is_ecall_i|is_mret_i|mintr_happen_i;
assign	mie_wen = wen_csr_i&(addr_csr_w_i == `ysyx_22040501_MIE);
assign  mip_wen = 1'b1;
ysyx_22040501_Reg #(`ysyx_22040501_WIDTH,0) mtvec (clk_i,rst_i,mtvec_w[`ysyx_22040501_WIDTH-1:0],mtvec_r[`ysyx_22040501_WIDTH-1:0],mtvec_wen);
ysyx_22040501_Reg #(`ysyx_22040501_WIDTH,0) mpc (clk_i,rst_i,mpc_w[`ysyx_22040501_WIDTH-1:0],mpc_r[`ysyx_22040501_WIDTH-1:0],mpc_wen);
ysyx_22040501_Reg #(`ysyx_22040501_WIDTH,0) mcause (clk_i,rst_i,mcause_w[`ysyx_22040501_WIDTH-1:0],mcause_r[`ysyx_22040501_WIDTH-1:0],mcause_wen);
ysyx_22040501_Reg #(`ysyx_22040501_WIDTH,64'h0000000a00001800) mstatus (clk_i,rst_i,mstatus_w[`ysyx_22040501_WIDTH-1:0],mstatus_r[`ysyx_22040501_WIDTH-1:0],mstatus_wen);
ysyx_22040501_Reg #(`ysyx_22040501_WIDTH,0) mip(clk_i,rst_i,mip_w[`ysyx_22040501_WIDTH-1:0],mip_r[`ysyx_22040501_WIDTH-1:0],mip_wen);
ysyx_22040501_Reg #(`ysyx_22040501_WIDTH,0) mie(clk_i,rst_i,mie_w[`ysyx_22040501_WIDTH-1:0],mie_r[`ysyx_22040501_WIDTH-1:0],mie_wen);
ysyx_22040501_MuxKey #(`ysyx_22040501_CSRS_NUM,12,`ysyx_22040501_WIDTH) mux_crc_r(data_csr_r_o[`ysyx_22040501_WIDTH-1:0],addr_csr_r_i[11:0],{
	`ysyx_22040501_MTVEC,mtvec_r[`ysyx_22040501_WIDTH-1:0],	
	`ysyx_22040501_MPC, mpc_r[`ysyx_22040501_WIDTH-1:0],	
	`ysyx_22040501_MSTATUS, mstatus_r[`ysyx_22040501_WIDTH-1:0],	
	`ysyx_22040501_MCAUSE, mcause_r[`ysyx_22040501_WIDTH-1:0],
	`ysyx_22040501_MIP,	mip_r[`ysyx_22040501_WIDTH-1:0],
	`ysyx_22040501_MIE,	mie_r[`ysyx_22040501_WIDTH-1:0]
});
endmodule
module ysyx_22040501_REGS(
	input 							clk_i,
	input 							rst_i,
	input 	[`ysyx_22040501_WIDTH-1:0]	data_dst_w_i,
	input		[`ysyx_22040501_WIDTH-1:0]	npc_i,
	input									pc_jump_i,
	input 	[4:0] 			addr_dst_w_i,
	input								wen_i,
	input 	[4:0]				addr_src1_r_i,
	input		[4:0]				addr_src2_r_i,
	output 	[`ysyx_22040501_WIDTH-1:0]	data_src1_r_o,
	output 	[`ysyx_22040501_WIDTH-1:0]	data_src2_r_o,
	output 	[`ysyx_22040501_WIDTH-1:0] pc_o,
	input 						npc_valid_i,
	input							pc_recover_i
);
wire 	[`ysyx_22040501_WIDTH-1:0]		zeros;//zeros reg
wire  [`ysyx_22040501_WIDTH-1:0]		out[33];//out of 32 regs
assign zeros[`ysyx_22040501_WIDTH-1:0] = 0;
assign out[0] = zeros[`ysyx_22040501_WIDTH-1:0];
genvar i;
generate
	for(i=1;i<32;i++) begin
ysyx_22040501_Reg #(`ysyx_22040501_WIDTH,0) r (clk_i,rst_i,data_dst_w_i[`ysyx_22040501_WIDTH-1:0],out[i][`ysyx_22040501_WIDTH-1:0],wen_i&(addr_dst_w_i == i));
	end
endgenerate
ysyx_22040501_MuxKey #(32,5,`ysyx_22040501_WIDTH) mux_src1_r(data_src1_r_o[`ysyx_22040501_WIDTH-1:0],addr_src1_r_i[4:0],{
	5'd0,	out[0][`ysyx_22040501_WIDTH-1:0],				
	5'd1,	out[1][`ysyx_22040501_WIDTH-1:0],				
	5'd2,	out[2][`ysyx_22040501_WIDTH-1:0],				
	5'd3,	out[3][`ysyx_22040501_WIDTH-1:0],				
	5'd4,	out[4][`ysyx_22040501_WIDTH-1:0],				
	5'd5,	out[5][`ysyx_22040501_WIDTH-1:0],				
	5'd6,	out[6][`ysyx_22040501_WIDTH-1:0],				
	5'd7,	out[7][`ysyx_22040501_WIDTH-1:0],				
	5'd8,	out[8][`ysyx_22040501_WIDTH-1:0],				
	5'd9,	out[9][`ysyx_22040501_WIDTH-1:0],				
	5'd10,	out[10][`ysyx_22040501_WIDTH-1:0],				
	5'd11,	out[11][`ysyx_22040501_WIDTH-1:0],				
	5'd12,	out[12][`ysyx_22040501_WIDTH-1:0],				
	5'd13,	out[13][`ysyx_22040501_WIDTH-1:0],				
	5'd14,	out[14][`ysyx_22040501_WIDTH-1:0],				
	5'd15,	out[15][`ysyx_22040501_WIDTH-1:0],				
	5'd16,	out[16][`ysyx_22040501_WIDTH-1:0],				
	5'd17,	out[17][`ysyx_22040501_WIDTH-1:0],				
	5'd18,	out[18][`ysyx_22040501_WIDTH-1:0],				
	5'd19,	out[19][`ysyx_22040501_WIDTH-1:0],				
	5'd20,	out[20][`ysyx_22040501_WIDTH-1:0],				
	5'd21,	out[21][`ysyx_22040501_WIDTH-1:0],				
	5'd22,	out[22][`ysyx_22040501_WIDTH-1:0],				
	5'd23,	out[23][`ysyx_22040501_WIDTH-1:0],				
	5'd24,	out[24][`ysyx_22040501_WIDTH-1:0],				
	5'd25,	out[25][`ysyx_22040501_WIDTH-1:0],				
	5'd26,	out[26][`ysyx_22040501_WIDTH-1:0],				
	5'd27,	out[27][`ysyx_22040501_WIDTH-1:0],				
	5'd28,	out[28][`ysyx_22040501_WIDTH-1:0],				
	5'd29,	out[29][`ysyx_22040501_WIDTH-1:0],				
	5'd30,	out[30][`ysyx_22040501_WIDTH-1:0],				
	5'd31,	out[31][`ysyx_22040501_WIDTH-1:0]				
});
ysyx_22040501_MuxKey #(32,5,`ysyx_22040501_WIDTH) mux_src2_r(data_src2_r_o[`ysyx_22040501_WIDTH-1:0],addr_src2_r_i[4:0],{
	5'd0,	out[0][`ysyx_22040501_WIDTH-1:0],				
	5'd1,	out[1][`ysyx_22040501_WIDTH-1:0],				
	5'd2,	out[2][`ysyx_22040501_WIDTH-1:0],				
	5'd3,	out[3][`ysyx_22040501_WIDTH-1:0],				
	5'd4,	out[4][`ysyx_22040501_WIDTH-1:0],				
	5'd5,	out[5][`ysyx_22040501_WIDTH-1:0],				
	5'd6,	out[6][`ysyx_22040501_WIDTH-1:0],				
	5'd7,	out[7][`ysyx_22040501_WIDTH-1:0],				
	5'd8,	out[8][`ysyx_22040501_WIDTH-1:0],				
	5'd9,	out[9][`ysyx_22040501_WIDTH-1:0],				
	5'd10,	out[10][`ysyx_22040501_WIDTH-1:0],				
	5'd11,	out[11][`ysyx_22040501_WIDTH-1:0],				
	5'd12,	out[12][`ysyx_22040501_WIDTH-1:0],				
	5'd13,	out[13][`ysyx_22040501_WIDTH-1:0],				
	5'd14,	out[14][`ysyx_22040501_WIDTH-1:0],				
	5'd15,	out[15][`ysyx_22040501_WIDTH-1:0],				
	5'd16,	out[16][`ysyx_22040501_WIDTH-1:0],				
	5'd17,	out[17][`ysyx_22040501_WIDTH-1:0],				
	5'd18,	out[18][`ysyx_22040501_WIDTH-1:0],				
	5'd19,	out[19][`ysyx_22040501_WIDTH-1:0],				
	5'd20,	out[20][`ysyx_22040501_WIDTH-1:0],				
	5'd21,	out[21][`ysyx_22040501_WIDTH-1:0],				
	5'd22,	out[22][`ysyx_22040501_WIDTH-1:0],				
	5'd23,	out[23][`ysyx_22040501_WIDTH-1:0],				
	5'd24,	out[24][`ysyx_22040501_WIDTH-1:0],				
	5'd25,	out[25][`ysyx_22040501_WIDTH-1:0],				
	5'd26,	out[26][`ysyx_22040501_WIDTH-1:0],				
	5'd27,	out[27][`ysyx_22040501_WIDTH-1:0],				
	5'd28,	out[28][`ysyx_22040501_WIDTH-1:0],				
	5'd29,	out[29][`ysyx_22040501_WIDTH-1:0],				
	5'd30,	out[30][`ysyx_22040501_WIDTH-1:0],				
	5'd31,	out[31][`ysyx_22040501_WIDTH-1:0]				
});
wire [`ysyx_22040501_WIDTH-1:0] pc_save;
ysyx_22040501_Reg #(`ysyx_22040501_WIDTH,`ysyx_22040501_RST_PC) pc_save_reg(clk_i,rst_i,pc_o,pc_save,npc_valid_i);
ysyx_22040501_Reg #(`ysyx_22040501_WIDTH,`ysyx_22040501_RST_PC) pc_reg (clk_i,rst_i,pc_jump_i ? npc_i[`ysyx_22040501_WIDTH-1:0]:(pc_recover_i ? pc_save:pc_o+4),pc_o[`ysyx_22040501_WIDTH-1:0],npc_valid_i|pc_recover_i);
endmodule
module ysyx_22040501_IDU (
	input									id_start_i,
	output								id_ready_o,
	output								id_valid_o,
	input									DEp_ready_i,
	output	[3:0]					inst_key_o,
	input 	[31:0]				inst_i,
	output	[4:0]					addr_src1_o,
	output	[4:0]					addr_src2_o,
	output  [4:0]					addr_dst_o,
	output	[11:0]				addr_csr_o,
	output 								wen_o, 
	output								wen_csr_o,
	output								is_ecall_o,//pass to reg to write some regs
	output								is_mret_o,
	output								is_fencei_o,
	output								is_load_o,
	output	[`ysyx_22040501_WIDTH-1:0]		imm_o,//all imm is expend to 64bit in IDU
	output	[`ysyx_22040501_OP_NUM-1:0]	alu_key_o,//choose which cal
	output	[1:0]					mul_sign_key_o,
	output	[`ysyx_22040501_A_NUM-1:0]	alu_A_key_o,
	output	[`ysyx_22040501_B_NUM-1:0]	alu_B_key_o,//choose src is imm or regs
	output 	[`ysyx_22040501_SHAMT_NUM-1:0]shamt_key_o,
	output  							alu_result_key_o,
	output	[`ysyx_22040501_RESULT_NUM-1:0]result_key_o,//choose what to write regs
	output	[`ysyx_22040501_CSR_KEY_NUM-1:0]data_csr_key_o,//choose what to write csrcs
	output									csr_i_or_r_key_o,
	output	[`ysyx_22040501_LOAD_NUM-1:0]load_data_key_o,
	output	[2:0]					ls_size_o,
	output 	[7:0]					store_mask_o,	
	output  							read_en_o,
	output								write_en_o
);
assign id_ready_o = 1'b1 & DEp_ready_i;
assign id_valid_o = id_start_i;
wire is_inst;
wire is_I_type;
wire is_U_type;
wire is_J_type;
wire is_B_type;
wire is_R_type;
wire is_S_type;
wire is_cal_I;
wire is_cal_R;
wire is_cal_w_R;
wire is_cal_w_I;
wire is_load_I;//include all load inst like lw, lb lh....
wire is_store_S;
wire is_b_B;
wire is_lui_U;
wire is_auipc_U;
wire is_jal_J;
wire is_jalr_I;
wire is_sys_I;
assign is_I_type = is_cal_I |is_cal_w_I|is_jalr_I|is_load_I|is_sys_I|0;
assign is_U_type = is_lui_U|is_auipc_U|0;
assign is_J_type = is_jal_J|0;
assign is_B_type = is_b_B;
assign is_R_type = is_cal_w_R|is_cal_R;
assign is_S_type = is_store_S;
assign is_cal_I= (inst_i[6:0]==`ysyx_22040501_CAL_I_OPCODE);
assign is_cal_R = (inst_i[6:0] == `ysyx_22040501_CAL_R_OPCODE);
assign is_cal_w_I = (inst_i[6:0] == `ysyx_22040501_CAL_W_I_OPCODE);
assign is_load_I = (inst_i[6:0] == `ysyx_22040501_LOAD_OPCODE);
assign is_store_S = (inst_i[6:0] == `ysyx_22040501_STORE_OPCODE);
assign is_b_B = (inst_i[6:0] == `ysyx_22040501_B_OPCODE);
assign is_lui_U = (inst_i[6:0]==`ysyx_22040501_LUI_U_OPCODE);
assign is_auipc_U = (inst_i[6:0] == `ysyx_22040501_AUIPC_OPCODE);
assign is_jal_J = (inst_i[6:0] == `ysyx_22040501_JAL_OPCODE);
assign is_jalr_I = (inst_i[6:0] == `ysyx_22040501_JALR_OPCODE)&(inst_i[14:12] == `ysyx_22040501_JALR_FUNCT3);
assign is_cal_w_R = (inst_i[6:0] == `ysyx_22040501_CAL_W_R_OPCODE);
assign is_sys_I = inst_i[6:0]==`ysyx_22040501_SYS_OPCODE;
assign is_ecall_o = inst_i[31:0] == `ysyx_22040501_ECALL;
assign is_mret_o = inst_i[31:0] == `ysyx_22040501_MRET;
assign is_fencei_o = (inst_i[6:0] == `ysyx_22040501_FENCEI_OPCODE) & (inst_i[14:12] == `ysyx_22040501_FENCEI_FUNCT3);
assign is_inst = is_I_type|is_U_type|is_J_type|is_B_type|is_R_type|is_S_type|is_ecall_o|is_mret_o|is_fencei_o;
wire is_csr;
wire is_csr_i;
assign is_csr = (is_sys_I&(inst_i[14:12]==`ysyx_22040501_CSRRW_FUNCT3))|(is_sys_I&(inst_i[14:12] == `ysyx_22040501_CSRRS_FUNCT3))|(is_sys_I&(inst_i[14:12] == `ysyx_22040501_CSRRC_FUNCT3))|(is_sys_I&(inst_i[14:12] == `ysyx_22040501_CSRRWI_FUNCT3))|(is_sys_I&(inst_i[14:12] == `ysyx_22040501_CSRRSI_FUNCT3))|(is_sys_I&(inst_i[14:12] == `ysyx_22040501_CSRRCI_FUNCT3));
assign is_csr_i = (is_sys_I&(inst_i[14:12] == `ysyx_22040501_CSRRWI_FUNCT3))|(is_sys_I&(inst_i[14:12] == `ysyx_22040501_CSRRSI_FUNCT3))|(is_sys_I&(inst_i[14:12] == `ysyx_22040501_CSRRCI_FUNCT3));
assign wen_o = (~is_B_type)&(~is_S_type)&(~is_mret_o)&(~is_ecall_o)&(~is_fencei_o)&is_inst;
assign wen_csr_o = is_csr;
assign addr_src1_o[4:0] = inst_i[19:15];
assign addr_src2_o[4:0] = inst_i[24:20];
assign addr_dst_o[4:0] = inst_i[11:7];
wire [1:0]	addr_csr_o_key;//key for choose addr_csr_o_key,01 for MPC,10 for MTVEC,default for csr
assign addr_csr_o_key[0] = is_mret_o;
assign addr_csr_o_key[1] = is_ecall_o;
ysyx_22040501_MuxKeyWithDefault #(2,2,12) addr_csr_o_mux (addr_csr_o[11:0],addr_csr_o_key[1:0],inst_i[31:20],{
	2'b01,	`ysyx_22040501_MPC,
	2'b10,	`ysyx_22040501_MTVEC
});
assign alu_result_key_o = is_cal_w_R|is_cal_w_I;
assign result_key_o[0] = is_J_type|is_jalr_I|0;
assign result_key_o[1] = wen_csr_o;
assign is_load_o = is_load_I|0; 
assign data_csr_key_o[0] = (is_sys_I&(inst_i[14:12] == `ysyx_22040501_CSRRW_FUNCT3))|(is_sys_I&(inst_i[14:12] == `ysyx_22040501_CSRRWI_FUNCT3));
assign data_csr_key_o[1] = (is_sys_I&(inst_i[14:12] == `ysyx_22040501_CSRRS_FUNCT3))|(is_sys_I&(inst_i[14:12] == `ysyx_22040501_CSRRSI_FUNCT3));
assign data_csr_key_o[2] = (is_sys_I&(inst_i[14:12] == `ysyx_22040501_CSRRC_FUNCT3))|(is_sys_I&(inst_i[14:12] == `ysyx_22040501_CSRRCI_FUNCT3));
assign csr_i_or_r_key_o = is_csr_i;
assign alu_key_o[0] = (is_cal_I & (inst_i[14:12]==`ysyx_22040501_ADDI_FUNCT3))|(is_cal_w_R &(inst_i[14:12] == `ysyx_22040501_ADDW_FUNCT3)&(inst_i[31:25] == `ysyx_22040501_ADDW_FUNCT7))|(is_cal_w_I&(inst_i[14:12]==`ysyx_22040501_ADDIW_FUNCT3)) |(is_cal_R&(inst_i[14:12]==`ysyx_22040501_ADD_FUNCT3)&(inst_i[31:25] == `ysyx_22040501_ADD_FUNCT7))|is_jalr_I|is_B_type| is_U_type|is_S_type| is_J_type|is_load_I|0; 
assign alu_key_o[1] = is_cal_I & (inst_i[14:12]==`ysyx_22040501_SLTIU_FUNCT3)|(is_cal_R&(inst_i[14:12] == `ysyx_22040501_SLTU_FUNCT3)&(inst_i[31:25] == `ysyx_22040501_SLTU_FUNCT7));//usigned  A_i <B_i ?1 :0;
assign alu_key_o[2] = is_cal_w_R & (inst_i[14:12] == `ysyx_22040501_SLLW_FUNCT3)&(inst_i[31:25] == `ysyx_22040501_SLLW_FUNCT7)|(is_cal_I&(inst_i[14:12] == `ysyx_22040501_SLLI_FUNCT3)&(inst_i[31:26]== `ysyx_22040501_SLLI_FUNCT6))|(is_cal_w_I&(inst_i[14:12]== `ysyx_22040501_SLLIW_FUNCT3)&(inst_i[31:25]==`ysyx_22040501_SLLIW_FUNCT7))|(is_cal_R &(inst_i[14:12] ==`ysyx_22040501_SLL_FUNCT3)&(inst_i[31:25] == `ysyx_22040501_SLL_FUNCT7));//sll shift left logic
assign alu_key_o[3] = (is_cal_I &(inst_i[14:12] == `ysyx_22040501_XORI_FUNCT3))|(is_cal_R&(inst_i[14:12]==`ysyx_22040501_XOR_FUNCT3)&(inst_i[31:25]==`ysyx_22040501_XOR_FUNCT7));//xor
assign alu_key_o[4] = (is_cal_I &(inst_i[14:12] == `ysyx_22040501_ANDI_FUNCT3))|(is_cal_R&(inst_i[14:12] == `ysyx_22040501_AND_FUNCT3)&(inst_i[31:25]==`ysyx_22040501_AND_FUNCT7));//and
assign alu_key_o[5] = (is_cal_I &(inst_i[14:12]==`ysyx_22040501_SRAI_FUNCT3)&(inst_i[31:26] == `ysyx_22040501_SRAI_FUNCT6))|(is_cal_w_I&(inst_i[14:12]==`ysyx_22040501_SRAIW_FUNCT3)&(inst_i[31:25]==`ysyx_22040501_SRAIW_FUNCT7))|(is_cal_w_R&(inst_i[14:12]==`ysyx_22040501_SRAW_FUNCT3)&(inst_i[31:25]==`ysyx_22040501_SRAW_FUNCT7))|(is_cal_R&(inst_i[14:12]==`ysyx_22040501_SRA_FUNCT3)&(inst_i[31:25]==`ysyx_22040501_SRA_FUNCT7));//sra shift right a
assign alu_key_o[6] = (is_cal_R &(inst_i[14:12]==`ysyx_22040501_SUB_FUNCT3)&(inst_i[31:25] == `ysyx_22040501_SUB_FUNCT7))|(is_cal_w_R&(inst_i[14:12]==`ysyx_22040501_SUBW_FUNCT3)&(inst_i[31:25] == `ysyx_22040501_SUBW_FUNCT7));//save_for_sub
assign alu_key_o[7] = (is_cal_R &(inst_i[14:12] == `ysyx_22040501_OR_FUNCT3)&(inst_i[31:25] == `ysyx_22040501_OR_FUNCT7))|(is_cal_I&(inst_i[14:12]==`ysyx_22040501_ORI_FUNCT3));
assign alu_key_o[8] = (is_cal_I &(inst_i[14:12]==`ysyx_22040501_SRLI_FUNCT3)&(inst_i[31:26] == `ysyx_22040501_SRLI_FUNCT6))|(is_cal_w_I&(inst_i[14:12]==`ysyx_22040501_SRLIW_FUNCT3)&(inst_i[31:25]==`ysyx_22040501_SRLIW_FUNCT7))|(is_cal_w_R&(inst_i[14:12]==`ysyx_22040501_SRLW_FUNCT3)&(inst_i[31:25]==`ysyx_22040501_SRLW_FUNCT7))|(is_cal_R&(inst_i[14:12] == `ysyx_22040501_SRL_FUNCT3)&(inst_i[31:25] == `ysyx_22040501_SRL_FUNCT7));//sra shift right logic
assign alu_key_o[9] = (is_cal_w_R &(inst_i[14:12] == `ysyx_22040501_MULW_FUNCT3)&(inst_i[31:25] == `ysyx_22040501_MULW_FUNCT7))|(is_cal_R&(inst_i[14:12]==`ysyx_22040501_MUL_FUNCT3)&(inst_i[31:25]==`ysyx_22040501_MUL_FUNCT7));//MUL
assign alu_key_o[10] = (is_cal_w_R &(inst_i[14:12] == `ysyx_22040501_DIVW_FUNCT3)&(inst_i[31:25] == `ysyx_22040501_DIVW_FUNCT7))|(is_cal_R &(inst_i[14:12]==`ysyx_22040501_DIV_FUNCT3)&(inst_i[31:25] == `ysyx_22040501_DIV_FUNCT7));//DIV
assign alu_key_o[11] = (is_cal_w_R &(inst_i[14:12] == `ysyx_22040501_REMW_FUNCT3)&(inst_i[31:25] == `ysyx_22040501_REMW_FUNCT7))|(is_cal_R&(inst_i[14:12] == `ysyx_22040501_REM_FUNCT3)&(inst_i[31:25] == `ysyx_22040501_REM_FUNCT7));//REM
assign alu_key_o[12] = (is_cal_R &(inst_i[14:12] == `ysyx_22040501_DIVU_FUNCT3)&(inst_i[31:25] == `ysyx_22040501_DIVU_FUNCT7))|(is_cal_w_R&(inst_i[14:12] == `ysyx_22040501_DIVUW_FUNCT3)&(inst_i[31:25] == `ysyx_22040501_DIVUW_FUNCT7));//DIVU
assign alu_key_o[13] = (is_cal_R &(inst_i[14:12] == `ysyx_22040501_REMU_FUNCT3)&(inst_i[31:25] == `ysyx_22040501_REMU_FUNCT7))|(is_cal_w_R&(inst_i[14:12]==`ysyx_22040501_REMUW_FUNCT3)&(inst_i[31:25]==`ysyx_22040501_REMUW_FUNCT7));//REMU
assign alu_key_o[14] = (is_cal_R &(inst_i[14:12]==`ysyx_22040501_SLT_FUNCT3)&(inst_i[31:25]==`ysyx_22040501_SLT_FUNCT7))|(is_cal_I&(inst_i[14:12]==`ysyx_22040501_SLTI_FUNCT3));//signed  A_i <B_i ?1 :0;
wire is_mulh;
wire is_mulhu;
wire is_mulhsu;
assign alu_key_o[15] = is_mulh|is_mulhu|is_mulhsu;//MUL_H
assign is_mulh = (is_cal_R &(inst_i[14:12] == `ysyx_22040501_MULH_FUNCT3)&(inst_i[31:25] == `ysyx_22040501_MULH_FUNCT7));
assign is_mulhu = (is_cal_R&(inst_i[14:12]==`ysyx_22040501_MULHU_FUNCT3)&(inst_i[31:25]==`ysyx_22040501_MULHU_FUNCT7));
assign is_mulhsu = (is_cal_R&(inst_i[14:12]==`ysyx_22040501_MULHSU_FUNCT3)&(inst_i[31:25]==`ysyx_22040501_MULHSU_FUNCT7));
assign mul_sign_key_o[0] = alu_key_o[9]|is_mulh|is_mulhsu;
assign mul_sign_key_o[1] = alu_key_o[9]|is_mulh;
wire is_unsign_w;
wire is_unsign_w_I;
wire is_unsign_w_R;
assign is_unsign_w_I = (is_cal_w_I&(inst_i[14:12]==`ysyx_22040501_SRLIW_FUNCT3)&(inst_i[31:25]==`ysyx_22040501_SRLIW_FUNCT7));
assign is_unsign_w_R = (is_cal_w_R&(inst_i[14:12]==`ysyx_22040501_SRLW_FUNCT3)&(inst_i[31:25]==`ysyx_22040501_SRLW_FUNCT7))|(is_cal_w_R&(inst_i[14:12]==`ysyx_22040501_DIVUW_FUNCT3)&(inst_i[31:25]==`ysyx_22040501_DIVUW_FUNCT7))|(is_cal_w_R&(inst_i[14:12]==`ysyx_22040501_REMUW_FUNCT3)&(inst_i[31:25]==`ysyx_22040501_REMUW_FUNCT7));
assign is_unsign_w = is_unsign_w_I|is_unsign_w_R;
assign alu_A_key_o[0] =(is_I_type &(~is_unsign_w_I))|(is_R_type&(~is_cal_w_R))|is_S_type;
assign alu_A_key_o[1] = is_auipc_U|is_J_type|is_B_type|0;
assign alu_A_key_o[2] = is_lui_U;
assign alu_A_key_o[3] = is_unsign_w;
assign alu_A_key_o[4] = is_cal_w_R&(~is_unsign_w_R);
assign alu_B_key_o[0]= is_I_type|is_U_type|is_J_type|is_B_type|is_S_type;
assign alu_B_key_o[1]= is_R_type&(~is_cal_w_R);
assign alu_B_key_o[2] = is_cal_w_R & (~is_unsign_w_R); 
assign alu_B_key_o[3] = is_unsign_w_R;
assign shamt_key_o[0] = is_cal_w_R & (inst_i[14:12] == `ysyx_22040501_SLLW_FUNCT3)&(inst_i[31:25] == `ysyx_22040501_SLLW_FUNCT7)|(is_cal_w_I&(inst_i[14:12]== `ysyx_22040501_SLLIW_FUNCT3)&(inst_i[31:25]==`ysyx_22040501_SLLIW_FUNCT7))|(is_cal_w_I&(inst_i[14:12]==`ysyx_22040501_SRAIW_FUNCT3)&(inst_i[31:25]==`ysyx_22040501_SRAIW_FUNCT7))|(is_cal_w_I&(inst_i[14:12]==`ysyx_22040501_SRLIW_FUNCT3)&(inst_i[31:25]==`ysyx_22040501_SRLIW_FUNCT7))|(is_cal_w_R&(inst_i[14:12]==`ysyx_22040501_SRAW_FUNCT3)&(inst_i[31:25]==`ysyx_22040501_SRAW_FUNCT7))|(is_cal_w_R&(inst_i[14:12]==`ysyx_22040501_SRLW_FUNCT3)&(inst_i[31:25]==`ysyx_22040501_SRLW_FUNCT7));
assign shamt_key_o[1] = (is_cal_I &(inst_i[14:12]==`ysyx_22040501_SRAI_FUNCT3)&(inst_i[31:26] == `ysyx_22040501_SRAI_FUNCT6))| (is_cal_I &(inst_i[14:12]==`ysyx_22040501_SRLI_FUNCT3)&(inst_i[31:26] == `ysyx_22040501_SRLI_FUNCT6))|(is_cal_I&(inst_i[14:12] == `ysyx_22040501_SLLI_FUNCT3)&(inst_i[31:26]== `ysyx_22040501_SLLI_FUNCT6))|(is_cal_R &(inst_i[14:12] ==`ysyx_22040501_SLL_FUNCT3)&(inst_i[31:25] == `ysyx_22040501_SLL_FUNCT7))|(is_cal_R&(inst_i[14:12] == `ysyx_22040501_SRL_FUNCT3)&(inst_i[31:25] == `ysyx_22040501_SRL_FUNCT7))|(is_cal_R&(inst_i[14:12]==`ysyx_22040501_SRA_FUNCT3)&(inst_i[31:25]==`ysyx_22040501_SRA_FUNCT7));
wire [`ysyx_22040501_IMM_NUM-1:0] imm_key;
assign imm_key[0] = is_I_type;
assign imm_key[1] = is_U_type;
assign imm_key[2] = is_J_type;
assign imm_key[3] = is_B_type;
assign imm_key[4] = is_S_type;
wire [`ysyx_22040501_WIDTH-1:0]	imm_I;
wire [`ysyx_22040501_WIDTH-1:0] imm_U;
wire [`ysyx_22040501_WIDTH-1:0]	imm_J;
wire [`ysyx_22040501_WIDTH-1:0]	imm_B;
wire [`ysyx_22040501_WIDTH-1:0]	imm_S;
assign imm_I[`ysyx_22040501_WIDTH-1:0] = {{(`ysyx_22040501_WIDTH-12){inst_i[31]}},inst_i[31:20]}; 
assign imm_U[`ysyx_22040501_WIDTH-1:0] = {{(`ysyx_22040501_WIDTH-32){inst_i[31]}},inst_i[31:12],{12{1'b0}}}; 
assign imm_J[`ysyx_22040501_WIDTH-1:0] = {{(`ysyx_22040501_WIDTH-20){inst_i[31]}},inst_i[19:12],inst_i[20],inst_i[30:21],1'b0};
assign imm_B[`ysyx_22040501_WIDTH-1:0] = {{(`ysyx_22040501_WIDTH-12){inst_i[31]}},inst_i[7],inst_i[30:25],inst_i[11:8],1'b0};
assign imm_S[`ysyx_22040501_WIDTH-1:0] = {{(`ysyx_22040501_WIDTH-12){inst_i[31]}},inst_i[31:25],inst_i[11:7]};
wire [`ysyx_22040501_WIDTH-1:0] imm_csr;
assign imm_csr[`ysyx_22040501_WIDTH-1:0] = {59'b0,inst_i[19:15]};
ysyx_22040501_MuxKeyWithDefault #(`ysyx_22040501_IMM_NUM,`ysyx_22040501_IMM_NUM,`ysyx_22040501_WIDTH) imm_mux (imm_o[`ysyx_22040501_WIDTH-1:0],imm_key[`ysyx_22040501_IMM_NUM-1:0],{`ysyx_22040501_WIDTH{1'b0}},{
	5'b00001,is_csr_i ? imm_csr[`ysyx_22040501_WIDTH-1:0] : imm_I[`ysyx_22040501_WIDTH-1:0],
	5'b00010,imm_U[`ysyx_22040501_WIDTH-1:0],
	5'b00100,imm_J[`ysyx_22040501_WIDTH-1:0],
	5'b01000,imm_B[`ysyx_22040501_WIDTH-1:0],
	5'b10000,imm_S[`ysyx_22040501_WIDTH-1:0]
});
assign load_data_key_o[0] = is_load_I&(inst_i[14:12]==`ysyx_22040501_LW_FUNCT3);//is lw
assign load_data_key_o[1] = is_load_I&(inst_i[14:12]==`ysyx_22040501_LD_FUNCT3);
assign load_data_key_o[2] = is_load_I&(inst_i[14:12]==`ysyx_22040501_LBU_FUNCT3);
assign load_data_key_o[3] = is_load_I&(inst_i[14:12]==`ysyx_22040501_LH_FUNCT3);
assign load_data_key_o[4] = is_load_I&(inst_i[14:12]==`ysyx_22040501_LHU_FUNCT3);
assign load_data_key_o[5] = is_load_I&(inst_i[14:12]==`ysyx_22040501_LB_FUNCT3);
assign load_data_key_o[6] = is_load_I&(inst_i[14:12]==`ysyx_22040501_LWU_FUNCT3);
wire	[`ysyx_22040501_STORE_MASK_NUM-1:0]	store_mux_key;
assign store_mux_key[0] = is_S_type&(inst_i[14:12] == `ysyx_22040501_SD_FUNCT3);
assign store_mux_key[1] = is_S_type&(inst_i[14:12] == `ysyx_22040501_SW_FUNCT3);
assign store_mux_key[2] = is_S_type&(inst_i[14:12] == `ysyx_22040501_SH_FUNCT3);
assign store_mux_key[3] = is_S_type&(inst_i[14:12] == `ysyx_22040501_SB_FUNCT3);
wire	[`ysyx_22040501_STORE_MASK_LEN-1:0]	store_mask_d;
wire	[`ysyx_22040501_STORE_MASK_LEN-1:0]	store_mask_w;
wire	[`ysyx_22040501_STORE_MASK_LEN-1:0]	store_mask_h;
wire	[`ysyx_22040501_STORE_MASK_LEN-1:0]	store_mask_b;
assign store_mask_d[`ysyx_22040501_STORE_MASK_LEN-1:0] = 8'hff;
assign store_mask_w[`ysyx_22040501_STORE_MASK_LEN-1:0] = 8'h0f;
assign store_mask_h[`ysyx_22040501_STORE_MASK_LEN-1:0] = 8'h03;
assign store_mask_b[`ysyx_22040501_STORE_MASK_LEN-1:0] = 8'h01;
ysyx_22040501_MuxKeyWithDefault #(`ysyx_22040501_STORE_MASK_NUM,`ysyx_22040501_STORE_MASK_NUM,`ysyx_22040501_STORE_MASK_LEN) store_mask_mux(store_mask_o[`ysyx_22040501_STORE_MASK_LEN-1:0],store_mux_key[`ysyx_22040501_STORE_MASK_NUM-1:0],{`ysyx_22040501_STORE_MASK_LEN{1'b0}},{
	4'b0001,	store_mask_d[`ysyx_22040501_STORE_MASK_LEN-1:0],
	4'b0010,	store_mask_w[`ysyx_22040501_STORE_MASK_LEN-1:0],
	4'b0100,  store_mask_h[`ysyx_22040501_STORE_MASK_LEN-1:0],
	4'b1000,  store_mask_b[`ysyx_22040501_STORE_MASK_LEN-1:0]
});
assign store_mask_d = 8'hff;
wire [2:0] axi_load_size;
wire [2:0] axi_store_size;
ysyx_22040501_MuxKeyWithDefault #(`ysyx_22040501_STORE_MASK_NUM,`ysyx_22040501_STORE_MASK_NUM,3) axi_store_size_mux(axi_store_size[2:0],store_mux_key[`ysyx_22040501_STORE_MASK_NUM-1:0],3'b0,{
	4'b0001,	`ysyx_22040501_AXI_SIZE_D,
	4'b0010,	`ysyx_22040501_AXI_SIZE_W,
	4'b0100,  `ysyx_22040501_AXI_SIZE_H,
	4'b1000,  `ysyx_22040501_AXI_SIZE_B
});
ysyx_22040501_MuxKeyWithDefault #(`ysyx_22040501_LOAD_NUM,`ysyx_22040501_LOAD_NUM,3) axi_load_size_mux(axi_load_size[2:0],load_data_key_o[`ysyx_22040501_LOAD_NUM-1:0],3'b0,{
7'b000_0001, `ysyx_22040501_AXI_SIZE_W,
7'b000_0010, `ysyx_22040501_AXI_SIZE_D,
7'b000_0100, `ysyx_22040501_AXI_SIZE_B,
7'b000_1000, `ysyx_22040501_AXI_SIZE_H,
7'b001_0000, `ysyx_22040501_AXI_SIZE_H,
7'b010_0000, `ysyx_22040501_AXI_SIZE_B,
7'b100_0000, `ysyx_22040501_AXI_SIZE_W
});
assign ls_size_o[2:0] = is_load_I ? axi_load_size[2:0]:is_store_S?axi_store_size[2:0]:3'b0;
assign read_en_o = is_load_I;
assign write_en_o = is_store_S;
assign inst_key_o[3] = is_load_I;
assign inst_key_o[2] = wen_o;
assign inst_key_o[1] = is_R_type | (is_I_type&(~is_csr_i)) | is_S_type | is_B_type;
assign inst_key_o[0] = is_R_type | is_S_type | is_B_type;
endmodule
`define ysyx_22040501_LOAD_BIT 3
`define ysyx_22040501_DST_BIT 2
`define ysyx_22040501_SRC1_BIT 1
`define ysyx_22040501_SRC2_BIT 0
`define ysyx_22040501_IDR_BIT 0
`define ysyx_22040501_EXR_BIT 1
`define ysyx_22040501_LSR_BIT 2
`define ysyx_22040501_REG_BIT 3
module ysyx_22040501_Forward_Unit (
	input														clk_i,
	input														rst_i,
	input														add_start_i,
	input														IDR_wen_i,
	input														EXR_wen_i,
	input														LSR_wen_i,
	input	 	[3:0]										inst_key_IDR_i,
	input		[`ysyx_22040501_R_ADDR_W-1:0]					addr_src1_IDR_i,
	input		[`ysyx_22040501_R_ADDR_W-1:0]					addr_src2_IDR_i,
	input		[`ysyx_22040501_R_ADDR_W-1:0]					addr_dst_IDR_i,
	input														wash_i,
	input														intr_happen_i,
	input	 [`ysyx_22040501_WIDTH-1:0]													pc_IDR_i,
	input							[`ysyx_22040501_WIDTH-1:0]							pc_EXR_i,
	input		[`ysyx_22040501_WIDTH-1:0]						data_dst_EXR_i,
	input		[`ysyx_22040501_WIDTH-1:0]						data_dst_LSR_i,
	input		[`ysyx_22040501_WIDTH-1:0]						load_data_LSR_i,	
	input		[`ysyx_22040501_WIDTH-1:0] 						data_r_i,
	output													add_nouse_inst_o,
 	output													src1_key_o,
	output													src2_key_o,
	output [`ysyx_22040501_WIDTH-1:0]							src1_forward_o,
	output [`ysyx_22040501_WIDTH-1:0]							src2_forward_o
);
wire	inst_in_IDR;
wire	inst_in_EXR;
wire 	inst_in_LSR;
wire	inst_in_IDR_last;
wire	inst_in_EXR_last;
wire	inst_in_LSR_last;
wire	inst_in_IDR_last1;
wire	inst_in_EXR_last1;
wire	inst_in_LSR_last1;
wire  [`ysyx_22040501_WIDTH-1:0] data_save1;
wire	[`ysyx_22040501_WIDTH-1:0] data_save2;
wire  [`ysyx_22040501_WIDTH-1:0] data_save3;
wire	[`ysyx_22040501_WIDTH-1:0] data_save4;
wire  data_save_wen;
ysyx_22040501_Reg #(1,0) data_save_wen_reg (clk_i,rst_i,LSR_wen_i,data_save_wen,1'b1);
ysyx_22040501_Reg #(`ysyx_22040501_WIDTH,0) data_save1_reg(clk_i,rst_i,data_r_i,data_save1,data_save_wen);
ysyx_22040501_Reg #(`ysyx_22040501_WIDTH,0) data_save2_reg(clk_i,rst_i,data_save1,data_save2,data_save_wen);
ysyx_22040501_Reg #(`ysyx_22040501_WIDTH,0) data_save3_reg(clk_i,rst_i,data_save2,data_save3,data_save_wen);
ysyx_22040501_Reg #(`ysyx_22040501_WIDTH,0) data_save4_reg(clk_i,rst_i,data_save3,data_save4,data_save_wen);
wire[`ysyx_22040501_R_ADDR_W-1:0] addr_dst_wash_save;
wire [3:0]inst_key_wash_save;
ysyx_22040501_Reg #(`ysyx_22040501_R_ADDR_W,0) addr_dst_wash_save_reg(clk_i,rst_i,addr_dst_IDR_i,addr_dst_wash_save,wash_i&(~intr_happen_i));
ysyx_22040501_Reg #(4,0) inst_key_wash_save_reg(clk_i,rst_i,inst_key_IDR_i,inst_key_wash_save,wash_i&(~intr_happen_i));
wire choose_addr_dst_wash_save;
wire wash_happened;
ysyx_22040501_Reg #(1,0) wash_happened_reg(clk_i,rst_i,wash_i? 1'b1 : 1'b0,wash_happened , wash_i|IDR_wen_i);
wire [`ysyx_22040501_WIDTH-1:0]pc_wash_save;
ysyx_22040501_Reg #(`ysyx_22040501_WIDTH,0) pc_wash_save_reg(clk_i,rst_i,pc_IDR_i,pc_wash_save,wash_i &(~intr_happen_i));
assign choose_addr_dst_wash_save= wash_happened & (pc_wash_save == pc_EXR_i); 
ysyx_22040501_Reg #(1,0) inst_in_IDR_reg (clk_i,rst_i,IDR_wen_i|add_start_i,inst_in_IDR,IDR_wen_i|add_start_i);
ysyx_22040501_Reg #(1,0) inst_in_EXR_reg (clk_i,rst_i,IDR_wen_i|add_start_i? 1'b0:((inst_in_IDR&inst_in_EXR_last&inst_in_EXR_last1)|(~inst_in_IDR_last)|(~inst_in_IDR_last1))? 1'b1:inst_in_EXR,inst_in_EXR,IDR_wen_i|add_start_i|EXR_wen_i);
ysyx_22040501_Reg #(1,0) inst_in_LSR_reg (clk_i,rst_i,IDR_wen_i|add_start_i? 1'b0:((inst_in_EXR&inst_in_LSR_last&inst_in_LSR_last1)|(~inst_in_IDR_last)|(~inst_in_IDR_last1))? 1'b1:inst_in_LSR,inst_in_LSR,IDR_wen_i|add_start_i|LSR_wen_i);
ysyx_22040501_Reg #(1,0) inst_in_IDR_last_reg (clk_i,rst_i,inst_in_IDR,inst_in_IDR_last,IDR_wen_i|add_start_i);
ysyx_22040501_Reg #(1,0) inst_in_EXR_last_reg (clk_i,rst_i,IDR_wen_i|add_start_i? inst_in_EXR|((~inst_in_EXR) &EXR_wen_i):(inst_in_IDR_last&inst_in_EXR_last1)? 1'b1:inst_in_EXR_last,inst_in_EXR_last,EXR_wen_i|IDR_wen_i|add_start_i);
ysyx_22040501_Reg #(1,0) inst_in_LSR_last_reg (clk_i,rst_i,IDR_wen_i|add_start_i? inst_in_LSR|(inst_in_EXR&(~inst_in_LSR) &LSR_wen_i):(inst_in_EXR_last&inst_in_LSR_last1)? 1'b1:inst_in_LSR_last,inst_in_LSR_last,LSR_wen_i|IDR_wen_i|add_start_i);
ysyx_22040501_Reg #(1,0) inst_in_IDR_last1_reg (clk_i,rst_i,inst_in_IDR_last,inst_in_IDR_last1,IDR_wen_i|add_start_i);
ysyx_22040501_Reg #(1,0) inst_in_EXR_last1_reg (clk_i,rst_i,IDR_wen_i|add_start_i?inst_in_EXR_last|((~inst_in_EXR_last)&EXR_wen_i):(inst_in_IDR_last1)? 1'b1:inst_in_EXR_last1,inst_in_EXR_last1,EXR_wen_i|IDR_wen_i|add_start_i);
ysyx_22040501_Reg #(1,0) inst_in_LSR_last1_reg (clk_i,rst_i,IDR_wen_i|add_start_i?inst_in_LSR_last|(inst_in_EXR_last&(~inst_in_LSR_last)&LSR_wen_i):(inst_in_EXR_last1)? 1'b1:inst_in_LSR_last1,inst_in_LSR_last1,LSR_wen_i|IDR_wen_i|add_start_i);
wire	 	[3:0]										inst_key_now;
wire		[`ysyx_22040501_R_ADDR_W-1:0]					addr_src1_now;
wire		[`ysyx_22040501_R_ADDR_W-1:0]					addr_src2_now;
wire		[`ysyx_22040501_R_ADDR_W-1:0]					addr_dst_now;
wire	 	[3:0]										inst_key_last;
wire		[`ysyx_22040501_R_ADDR_W-1:0]					addr_dst_last;
wire	 	[3:0]										inst_key_last1;
wire		[`ysyx_22040501_R_ADDR_W-1:0]					addr_dst_last1;
wire [`ysyx_22040501_R_ADDR_W-1:0]						addr_dst_last2;
wire	[3:0]											inst_key_last2;
wire [`ysyx_22040501_R_ADDR_W-1:0]						addr_dst_last3;
wire												inst_key_last3_dst_bit;
assign inst_key_now = choose_addr_dst_wash_save ? inst_key_wash_save:inst_key_IDR_i;
assign addr_src1_now = addr_src1_IDR_i;
assign addr_src2_now = addr_src2_IDR_i;
assign addr_dst_now = choose_addr_dst_wash_save ? addr_dst_wash_save:addr_dst_IDR_i;
ysyx_22040501_Reg #(4,0) reg_inst_key_last(clk_i,rst_i,add_start_i ? 4'b0:inst_key_now,inst_key_last,IDR_wen_i|add_start_i);
ysyx_22040501_Reg #(`ysyx_22040501_R_ADDR_W,0) reg_addr_dst_last(clk_i,rst_i,addr_dst_now,addr_dst_last,IDR_wen_i|add_start_i);
ysyx_22040501_Reg #(4,0) reg_inst_key_last1(clk_i,rst_i,inst_key_last,inst_key_last1,IDR_wen_i|add_start_i);
ysyx_22040501_Reg #(`ysyx_22040501_R_ADDR_W,0) reg_addr_dst_last1(clk_i,rst_i,addr_dst_last,addr_dst_last1,IDR_wen_i|add_start_i);
ysyx_22040501_Reg #(`ysyx_22040501_R_ADDR_W,0)	addr_dst_last2_reg(clk_i,rst_i,addr_dst_last1,addr_dst_last2,IDR_wen_i|add_start_i);
ysyx_22040501_Reg #(4,0)	inst_key_last2_reg(clk_i,rst_i,inst_key_last1,inst_key_last2,IDR_wen_i|add_start_i);
ysyx_22040501_Reg #(`ysyx_22040501_R_ADDR_W,0)	addr_dst_last3_reg(clk_i,rst_i,addr_dst_last2,addr_dst_last3,IDR_wen_i|add_start_i);
ysyx_22040501_Reg #(1,0)	inst_key_last3_reg(clk_i,rst_i,inst_key_last2[`ysyx_22040501_DST_BIT],inst_key_last3_dst_bit,IDR_wen_i|add_start_i);
wire IDR_wen_delay;
wire [`ysyx_22040501_WIDTH-1:0]	src1_forward;
wire [`ysyx_22040501_WIDTH-1:0]	src2_forward;
wire [`ysyx_22040501_WIDTH-1:0]	src1_forward_t;
wire [`ysyx_22040501_WIDTH-1:0]	src2_forward_t;
wire [`ysyx_22040501_WIDTH-1:0] src1_forward_s;
wire [`ysyx_22040501_WIDTH-1:0] src2_forward_s;
ysyx_22040501_Reg #(1,0) IDR_wen_delay_reg(clk_i,rst_i,IDR_wen_i|add_start_i,IDR_wen_delay,1'b1);
ysyx_22040501_Reg #(`ysyx_22040501_WIDTH,0) src1_forward_reg(clk_i,rst_i,src1_forward_t,src1_forward_s,IDR_wen_delay);
assign src1_forward_o = IDR_wen_delay ? src1_forward_t : src1_forward_s;
ysyx_22040501_Reg #(`ysyx_22040501_WIDTH,0) src2_forward_reg(clk_i,rst_i,src2_forward_t,src2_forward_s,IDR_wen_delay);
assign src2_forward_o = IDR_wen_delay ? src2_forward_t : src2_forward_s;
wire src1_hazard_with_last_dst;
wire src1_hazard_with_last1_dst;
wire src2_hazard_with_last_dst;
wire src2_hazard_with_last1_dst;
assign src1_hazard_with_last_dst = inst_key_now[`ysyx_22040501_SRC1_BIT] & inst_key_last[`ysyx_22040501_DST_BIT] & (addr_src1_now == addr_dst_last) &(addr_src1_now != 0);
assign src1_hazard_with_last1_dst = inst_key_now[`ysyx_22040501_SRC1_BIT] & inst_key_last1[`ysyx_22040501_DST_BIT] & (addr_src1_now == addr_dst_last1)&(addr_src1_now != 0);
assign src2_hazard_with_last_dst = inst_key_now[`ysyx_22040501_SRC2_BIT] & inst_key_last[`ysyx_22040501_DST_BIT] & (addr_src2_now == addr_dst_last)&(addr_src2_now != 0);
assign src2_hazard_with_last1_dst = inst_key_now[`ysyx_22040501_SRC2_BIT] & inst_key_last1[`ysyx_22040501_DST_BIT] & (addr_src2_now == addr_dst_last1)&(addr_src2_now != 0);
wire [1:0] key_src1_forward;
wire [1:0] key_src2_forward;
assign key_src1_forward = {src1_hazard_with_last1_dst,src1_hazard_with_last_dst}; 
assign key_src2_forward = {src2_hazard_with_last1_dst,src2_hazard_with_last_dst}; 
wire last_has_wb;
wire last1_has_wb;
ysyx_22040501_Reg #(1,0) last_has_wb_reg (clk_i,rst_i,inst_in_LSR,last_has_wb,IDR_wen_i|add_start_i);
ysyx_22040501_Reg #(1,0) last1_has_wb_reg (clk_i,rst_i,inst_in_LSR_last,last1_has_wb,IDR_wen_i|add_start_i);
ysyx_22040501_MuxKey #(4,2,`ysyx_22040501_WIDTH) src1_forward_mux(.out(src1_forward[`ysyx_22040501_WIDTH-1:0]),.key(key_src1_forward[1:0]),.lut({
	2'b00	,	64'b0,
	2'b01	,	inst_in_LSR_last ? (inst_key_last[`ysyx_22040501_LOAD_BIT]? load_data_LSR_i:data_dst_LSR_i):data_dst_EXR_i,
	2'b10 , (~inst_in_LSR_last) ? (inst_key_last1[`ysyx_22040501_LOAD_BIT]? load_data_LSR_i:data_dst_LSR_i):last_has_wb?data_save2 :data_save1,
	2'b11	,	inst_in_LSR_last? (inst_key_last[`ysyx_22040501_LOAD_BIT]? load_data_LSR_i:data_dst_LSR_i):data_dst_EXR_i
}));
ysyx_22040501_MuxKey#(4,2,`ysyx_22040501_WIDTH) src2_forward_mux(.out(src2_forward[`ysyx_22040501_WIDTH-1:0]),.key(key_src2_forward[1:0]),.lut({
	2'b00	,	64'b0,
	2'b01	,inst_in_LSR_last? (inst_key_last[`ysyx_22040501_LOAD_BIT]? load_data_LSR_i:data_dst_LSR_i):data_dst_EXR_i,
	2'b10 , (~inst_in_LSR_last) ? (inst_key_last1[`ysyx_22040501_LOAD_BIT]? load_data_LSR_i:data_dst_LSR_i):last_has_wb?data_save2 :data_save1,
	2'b11	,inst_in_LSR_last? (inst_key_last[`ysyx_22040501_LOAD_BIT]? load_data_LSR_i:data_dst_LSR_i):data_dst_EXR_i
}));
assign add_nouse_inst_o	=(src1_hazard_with_last_dst|src2_hazard_with_last_dst) & inst_key_last[`ysyx_22040501_LOAD_BIT] & (~inst_in_LSR_last);
wire src1_hazzard_with_last2_dst;
wire src2_hazzard_with_last2_dst;
assign src1_hazzard_with_last2_dst = (~src1_hazard_with_last1_dst)&(~src1_hazard_with_last_dst) &inst_key_now[`ysyx_22040501_SRC1_BIT] & inst_key_last2[`ysyx_22040501_DST_BIT] & (addr_src1_now == addr_dst_last2)&(addr_src1_now !=0);
assign src2_hazzard_with_last2_dst = (~src2_hazard_with_last1_dst)&(~src2_hazard_with_last_dst) &inst_key_now[`ysyx_22040501_SRC2_BIT] & inst_key_last2[`ysyx_22040501_DST_BIT] & (addr_src2_now == addr_dst_last2)&(addr_src2_now !=0);
wire src1_hazzard_with_last3_dst;
wire src2_hazzard_with_last3_dst;
assign src1_hazzard_with_last3_dst = (~src1_hazard_with_last1_dst)&(~src1_hazard_with_last_dst) &(~src1_hazzard_with_last2_dst)&inst_key_now[`ysyx_22040501_SRC1_BIT] & inst_key_last3_dst_bit & (addr_src1_now == addr_dst_last3)&(addr_src1_now !=0);
assign src2_hazzard_with_last3_dst = (~src2_hazard_with_last1_dst)&(~src2_hazard_with_last_dst) &(~src2_hazzard_with_last2_dst)&inst_key_now[`ysyx_22040501_SRC2_BIT] & inst_key_last3_dst_bit & (addr_src2_now == addr_dst_last3)&(addr_src2_now !=0);
assign src1_key_o = src1_hazard_with_last_dst|src1_hazard_with_last1_dst|src1_hazzard_with_last2_dst | src1_hazzard_with_last3_dst ;
assign src2_key_o = src2_hazard_with_last_dst|src2_hazard_with_last1_dst|src2_hazzard_with_last2_dst| src2_hazzard_with_last3_dst ;
wire [`ysyx_22040501_WIDTH-1:0] data_hazzard_with_last2;
wire [`ysyx_22040501_WIDTH-1:0] data_hazzard_with_last3;
assign data_hazzard_with_last2 = (~inst_in_LSR_last) ? ((~last1_has_wb) ? data_save1:data_save2):last_has_wb?data_save3 :data_save2;
assign data_hazzard_with_last3 =  (~inst_in_LSR_last) ?((~last1_has_wb) ? data_save2:data_save3):last_has_wb?data_save4 :data_save3;
assign src1_forward_t = src1_hazzard_with_last3_dst ? data_hazzard_with_last3 :src1_hazzard_with_last2_dst ?  data_hazzard_with_last2: src1_forward;
assign src2_forward_t = src2_hazzard_with_last3_dst ? data_hazzard_with_last3 :src2_hazzard_with_last2_dst ?  data_hazzard_with_last2: src2_forward;
endmodule
module ysyx_22040501_EX_LS (
input         								clk_i,
input         								rst_i,
input													exe_valid_i,
input													lsu_ready_i,
output												ELSp_ready_o,
input													last_write_pr_en_i,
output												write_pr_en_o,
output												ls_start_o,
input													fencei_end_d_i,
input													fencei_end_i_i,
input   [`ysyx_22040501_LOAD_NUM-1:0]      	load_data_key_i,
input   [7:0]					      	store_mask_i,
input     							    	read_en_i,
input         								write_en_i,
input   [`ysyx_22040501_WIDTH-1:0] 		     	address_i,
input		[`ysyx_22040501_WIDTH-1:0]					store_data_i,
input   							      	wenR_i,
input         								is_load_i,
input   [4:0] 					    	addr_dst_i,
input   [`ysyx_22040501_WIDTH-1:0] 		     	data_dst_i,
input		[`ysyx_22040501_WIDTH-1:0]					pc_i,
input													is_fencei_i,
input		[2:0]									ls_size_i,
output  [`ysyx_22040501_LOAD_NUM-1:0]      	load_data_key_o,
output  [7:0]					      	store_mask_o,
output    							    	read_en_o,
output        								write_en_o,
output  [`ysyx_22040501_WIDTH-1:0] 		     	address_o,
output	[`ysyx_22040501_WIDTH-1:0]					store_data_o,
output  							      	wenR_o,
output        								is_load_o,
output  [4:0] 					    	addr_dst_o,
output  [`ysyx_22040501_WIDTH-1:0] 		     	data_dst_o,
output	[`ysyx_22040501_WIDTH-1:0]					pc_o,
output												is_fencei_d_o,
output												is_fencei_i_o,
output		[2:0]									ls_size_o
);
wire write_regs_en;
wire exe_valid_r;
ysyx_22040501_Reg #(1,0)exe_valid_reg(clk_i,rst_i,lsu_ready_i? 1'b0:exe_valid_i,exe_valid_r,exe_valid_i|lsu_ready_i);
assign write_regs_en = (exe_valid_r|exe_valid_i) & lsu_ready_i;
ysyx_22040501_Reg #(1,0) ls_start_o_reg(clk_i,rst_i,write_regs_en,ls_start_o,1'b1);
wire ELSp_ready;
wire ELSp_ready_r;
assign ELSp_ready = (exe_valid_r|exe_valid_i) & lsu_ready_i;
ysyx_22040501_Reg #(1,1) ELSp_ready_o_reg(clk_i,rst_i, last_write_pr_en_i? 1'b0:ELSp_ready,ELSp_ready_r,ELSp_ready|last_write_pr_en_i);
assign ELSp_ready_o = ELSp_ready | ELSp_ready_r;
assign write_pr_en_o = write_regs_en;
ysyx_22040501_Reg #(`ysyx_22040501_LOAD_NUM,0)	reg_load_data_key_o(clk_i,rst_i,load_data_key_i,load_data_key_o,write_regs_en);
ysyx_22040501_Reg #(8,0)	reg_store_mask_o(clk_i,rst_i,store_mask_i,store_mask_o,write_regs_en);
ysyx_22040501_Reg #(1,0)	reg_read_en_o(clk_i,rst_i,read_en_i,read_en_o,write_regs_en);
ysyx_22040501_Reg #(1,0)	reg_write_en_o(clk_i,rst_i,write_en_i,write_en_o,write_regs_en);
ysyx_22040501_Reg #(`ysyx_22040501_WIDTH,0)	reg_address_o(clk_i,rst_i,address_i,address_o,write_regs_en);
ysyx_22040501_Reg #(`ysyx_22040501_WIDTH,0)	reg_store_data_o(clk_i,rst_i,store_data_i,store_data_o,write_regs_en);
ysyx_22040501_Reg #(1,0)	reg_wenR_o(clk_i,rst_i,wenR_i,wenR_o,write_regs_en);
ysyx_22040501_Reg #(1,0)	reg_is_load_o(clk_i,rst_i,is_load_i,is_load_o,write_regs_en);
ysyx_22040501_Reg #(5,0)	reg_addr_dst_o(clk_i,rst_i,addr_dst_i,addr_dst_o,write_regs_en);
ysyx_22040501_Reg #(`ysyx_22040501_WIDTH,0)	reg_data_dst_o(clk_i,rst_i,data_dst_i,data_dst_o,write_regs_en);
ysyx_22040501_Reg #(`ysyx_22040501_WIDTH,0)	reg_pc_o(clk_i,rst_i,pc_i,pc_o,write_regs_en);
ysyx_22040501_Reg #(1,0)	reg_is_fencei_d_o(clk_i,rst_i,fencei_end_d_i?1'b0:is_fencei_i,is_fencei_d_o,write_regs_en|fencei_end_d_i);
ysyx_22040501_Reg #(1,0)	reg_is_fencei_i_o(clk_i,rst_i,fencei_end_i_i?1'b0:is_fencei_i,is_fencei_i_o,write_regs_en|fencei_end_i_i);
ysyx_22040501_Reg#(3,0) reg_ls_size_o(clk_i,rst_i,ls_size_i,ls_size_o,write_regs_en);
endmodule
module ysyx_22040501_LS_REGS(
	input								clk_i,
	input								rst_i,
	output							LSRp_ready_o,
	input								ls_valid_i,
	input								last_write_pr_en_i,
	output							write_pr_en_o,
	input								wenR_i,
	input								is_load_i,
	input	[4:0]					addr_dst_i,
	input	[`ysyx_22040501_WIDTH-1:0]	data_dst_i,
	input [`ysyx_22040501_WIDTH-1:0]	load_data_i,
	output								wenR_o,
	output								is_load_o,
	output	[4:0]					addr_dst_o,
	output	[`ysyx_22040501_WIDTH-1:0]	data_dst_o,
	output [`ysyx_22040501_WIDTH-1:0]	load_data_o
);
wire write_regs_en;
assign write_regs_en =ls_valid_i ;
assign write_pr_en_o = write_regs_en;
wire LSRp_ready_r;
wire LSRp_ready;
assign LSRp_ready = ls_valid_i;
ysyx_22040501_Reg #(1,1) LSRp_ready_o_reg(clk_i,rst_i, last_write_pr_en_i? 1'b0:LSRp_ready,LSRp_ready_r,LSRp_ready|last_write_pr_en_i);
assign LSRp_ready_o = LSRp_ready | LSRp_ready_r;
ysyx_22040501_Reg #(1,0) reg_wenR_o(clk_i,rst_i,wenR_i,wenR_o,write_regs_en);
ysyx_22040501_Reg #(1,0) reg_is_load_o(clk_i,rst_i,is_load_i,is_load_o,write_regs_en);
ysyx_22040501_Reg #(5,0) reg_addr_dst_o(clk_i,rst_i,addr_dst_i,addr_dst_o,write_regs_en);
ysyx_22040501_Reg #(`ysyx_22040501_WIDTH,0) reg_data_dst_o(clk_i,rst_i,data_dst_i,data_dst_o,write_regs_en);
ysyx_22040501_Reg #(`ysyx_22040501_WIDTH,0) reg_load_data_o(clk_i,rst_i,load_data_i,load_data_o,write_regs_en);
endmodule
module ysyx_22040501_ID_EX	(
input  											clk_i,							
input  											rst_i,							
input												id_valid_i,
input												exe_ready_i,
input												last_write_pr_en_i,
output											write_pr_en_o,
output											DEp_ready_o,
output											exe_start_o,
input												stop_i,
input												intr_stop_i,
input												wash_i,
input												add_nouse_inst_i,
input												add_start_i,
output											write_pr_en1_o,
input		[31:0]							inst_i,
input  	[`ysyx_22040501_WIDTH-1:0]					pc_i,							
input  	[`ysyx_22040501_WIDTH-1:0]					src1_i,					
input  	[`ysyx_22040501_WIDTH-1:0]					src2_i,					
input  	[`ysyx_22040501_WIDTH-1:0]					imm_i,						
input  	[`ysyx_22040501_OP_NUM-1:0]				alu_key_i,				
input		[1:0]								mul_sign_key_i,
input  	[`ysyx_22040501_A_NUM-1:0]				alu_A_key_i,			
input  	[`ysyx_22040501_B_NUM-1:0]				alu_B_key_i,			
input  	[`ysyx_22040501_SHAMT_NUM-1:0]		shamt_key_i,			
input  											alu_result_key_i,
input  	[`ysyx_22040501_RESULT_NUM-1:0]		result_key_i,	
input  	[`ysyx_22040501_CSR_KEY_NUM-1:0]	data_csr_key_i,	
input												csr_i_or_r_key_i,
input  	[`ysyx_22040501_LOAD_NUM-1:0]		  load_data_key_i,	
input  	[7:0]								store_mask_i,			
input  											read_en_i,					
input  											write_en_i,				
input  											wenR_i,						
input  											wen_csr_i,					
input  											is_ecall_i,				
input  											is_mret_i,				
input  											is_load_i,					
input  	[4:0]								addr_dst_i,				
input  	[11:0]							addr_csr_i,				
input		[3:0]								inst_key_i,
input		[`ysyx_22040501_R_ADDR_W-1:0]			  addr_src1_r_i,
input		[`ysyx_22040501_R_ADDR_W-1:0]				addr_src2_r_i,
input												is_fencei_i,
input		[2:0]								ls_size_i,
output	[31:0]							inst_o,
output 	[`ysyx_22040501_WIDTH-1:0]					pc_o,							
output 	[`ysyx_22040501_WIDTH-1:0]					src1_o,					
output 	[`ysyx_22040501_WIDTH-1:0]					src2_o,					
output 	[`ysyx_22040501_WIDTH-1:0]					imm_o,						
output 	[`ysyx_22040501_OP_NUM-1:0]				alu_key_o,				
output	[1:0]								mul_sign_key_o,
output 	[`ysyx_22040501_A_NUM-1:0]				alu_A_key_o,			
output 	[`ysyx_22040501_B_NUM-1:0]				alu_B_key_o,			
output 	[`ysyx_22040501_SHAMT_NUM-1:0]		shamt_key_o,			
output 											alu_result_key_o,	
output 	[`ysyx_22040501_RESULT_NUM-1:0]		result_key_o,		
output 	[`ysyx_22040501_CSR_KEY_NUM-1:0]	data_csr_key_o,	
output											csr_i_or_r_key_o,
output 	[`ysyx_22040501_LOAD_NUM-1:0]		  load_data_key_o,
output 	[7:0]								store_mask_o,			
output 											read_en_o,					
output 											write_en_o,				
output 											wenR_o,						
output 											wen_csr_o,					
output 											is_ecall_o,				
output 											is_mret_o,				
output 											is_load_o,					
output 	[4:0]								addr_dst_o,				
output 	[11:0]							addr_csr_o,				
output		[3:0]								inst_key_o,
output		[`ysyx_22040501_R_ADDR_W-1:0]			  addr_src1_r_o,
output		[`ysyx_22040501_R_ADDR_W-1:0]				addr_src2_r_o,
output												is_fencei_o,
output		[2:0]								ls_size_o
);
wire write_regs_en;
assign write_pr_en1_o = write_regs_en;
wire id_valid_r;
ysyx_22040501_Reg #(1,0) id_valid_reg(clk_i,rst_i,exe_ready_i?1'b0:id_valid_i,id_valid_r,id_valid_i|exe_ready_i);
assign write_regs_en =(id_valid_i|id_valid_r) & exe_ready_i&(~stop_i)&(~add_nouse_inst_i);
wire catch_new_inst;
ysyx_22040501_Reg #(1,0) catch_new_inst_r(clk_i,rst_i,wash_i ? 1'b0:write_regs_en&intr_stop_i,catch_new_inst,wash_i|(write_regs_en&intr_stop_i));
wire exe_start_normal;
ysyx_22040501_Reg #(1,0) exe_start_normal_reg(clk_i,rst_i,write_regs_en,exe_start_normal,1'b1);
assign exe_start_o = (exe_start_normal | add_start_i)&(~catch_new_inst);
wire DEp_ready;
wire DEp_ready_r;
assign DEp_ready = (id_valid_i|id_valid_r) & exe_ready_i;
ysyx_22040501_Reg #(1,1) DEp_ready_o_reg(clk_i,rst_i, last_write_pr_en_i? 1'b0:DEp_ready,DEp_ready_r,DEp_ready|last_write_pr_en_i);
assign DEp_ready_o = (DEp_ready | DEp_ready_r);
assign write_pr_en_o = write_regs_en&(~intr_stop_i);
wire  											read_en_r;					
wire  											write_en_r;				
wire  											wenR_r;						
wire  											wen_csr_r;					
wire  											is_ecall_r;				
wire  											is_mret_r;				
assign read_en_o = add_nouse_inst_i ?0:read_en_r;					
assign write_en_o = add_nouse_inst_i ?0:write_en_r;				
assign wenR_o = add_nouse_inst_i ?0:wenR_r;						
assign wen_csr_o = add_nouse_inst_i ?0:(wen_csr_r &(~catch_new_inst));	//当正在执行写CSR寄存器指令时发生中断，要保证这条指令不执行，需要将wen_csr_o拉低，但是中断发生时又需要写mstate寄存器，这个使能信号在CSRS中是或上中断发生标志信号的，不会收到wen_csr_o的影响，wen_csr_o只影响指令写CSRS，不会影响中断或异常引起的写CSRS				
assign is_ecall_o = add_nouse_inst_i ?0:is_ecall_r;				
assign is_mret_o = add_nouse_inst_i ?0:is_mret_r;				
ysyx_22040501_Reg#(32,0) reg_inst_o(clk_i,rst_i,wash_i?32'b0:inst_i,inst_o,write_regs_en|wash_i);
ysyx_22040501_Reg#(`ysyx_22040501_WIDTH,`ysyx_22040501_RST_PC) reg_pc_o(clk_i,rst_i,wash_i?{`ysyx_22040501_WIDTH{1'b0}}:pc_i,pc_o,write_regs_en|wash_i);
ysyx_22040501_Reg#(`ysyx_22040501_WIDTH,0) reg_src1_o(clk_i,rst_i,wash_i?{`ysyx_22040501_WIDTH{1'b0}}:src1_i,src1_o,write_regs_en|wash_i);
ysyx_22040501_Reg#(`ysyx_22040501_WIDTH,0) reg_src2_o(clk_i,rst_i,wash_i?{`ysyx_22040501_WIDTH{1'b0}}:src2_i,src2_o,write_regs_en|wash_i);
ysyx_22040501_Reg#(`ysyx_22040501_WIDTH,0) reg_imm_o(clk_i,rst_i,wash_i?{`ysyx_22040501_WIDTH{1'b0}}:imm_i,imm_o,write_regs_en|wash_i);
ysyx_22040501_Reg#(`ysyx_22040501_OP_NUM,0) reg_alu_key_o(clk_i,rst_i,wash_i?{`ysyx_22040501_OP_NUM{1'b0}}:alu_key_i,alu_key_o,write_regs_en|wash_i);
ysyx_22040501_Reg#(2,0) reg_mul_sign_key_o(clk_i,rst_i,wash_i?2'b0:mul_sign_key_i,mul_sign_key_o,write_regs_en|wash_i);
ysyx_22040501_Reg#(`ysyx_22040501_A_NUM,0) reg_alu_A_key_o(clk_i,rst_i,wash_i?{`ysyx_22040501_A_NUM{1'b0}}:alu_A_key_i,alu_A_key_o,write_regs_en|wash_i);
ysyx_22040501_Reg#(`ysyx_22040501_B_NUM,0) reg_alu_B_key_o(clk_i,rst_i,wash_i?{`ysyx_22040501_B_NUM{1'b0}}:alu_B_key_i,alu_B_key_o,write_regs_en|wash_i);
ysyx_22040501_Reg#(`ysyx_22040501_SHAMT_NUM,0) reg_shamt_key_o(clk_i,rst_i,wash_i?{`ysyx_22040501_SHAMT_NUM{1'b0}}:shamt_key_i,shamt_key_o,write_regs_en|wash_i);
ysyx_22040501_Reg#(1,0) reg_alu_result_key_o(clk_i,rst_i,wash_i?1'b0:alu_result_key_i,alu_result_key_o,write_regs_en|wash_i);
ysyx_22040501_Reg#(`ysyx_22040501_RESULT_NUM,0) reg_result_key_o(clk_i,rst_i,wash_i?{`ysyx_22040501_RESULT_NUM{1'b0}}:result_key_i,result_key_o,write_regs_en|wash_i);
ysyx_22040501_Reg#(`ysyx_22040501_CSR_KEY_NUM,0) reg_data_csr_key_o(clk_i,rst_i,wash_i?{`ysyx_22040501_CSR_KEY_NUM{1'b0}}:data_csr_key_i,data_csr_key_o,write_regs_en|wash_i);
ysyx_22040501_Reg#(1,0) reg_csr_i_or_r_key_o(clk_i,rst_i,wash_i?1'b0:csr_i_or_r_key_i,csr_i_or_r_key_o,write_regs_en|wash_i);
ysyx_22040501_Reg#(`ysyx_22040501_LOAD_NUM,0) reg_load_data_key_o(clk_i,rst_i,wash_i?{`ysyx_22040501_LOAD_NUM{1'b0}}:load_data_key_i,load_data_key_o,write_regs_en|wash_i);
ysyx_22040501_Reg#(8,0) reg_store_mask_o(clk_i,rst_i,wash_i?8'b0:store_mask_i,store_mask_o,write_regs_en|wash_i);
ysyx_22040501_Reg#(1,0) reg_read_en_o(clk_i,rst_i,wash_i?1'b0:read_en_i,read_en_r,write_regs_en|wash_i);
ysyx_22040501_Reg#(1,0) reg_write_en_o(clk_i,rst_i,wash_i?1'b0:write_en_i,write_en_r,write_regs_en|wash_i);
ysyx_22040501_Reg#(1,0) reg_wenR_o(clk_i,rst_i,wash_i?1'b0:wenR_i,wenR_r,write_regs_en|wash_i);
ysyx_22040501_Reg#(1,0) reg_wen_csr_o(clk_i,rst_i,wash_i?1'b0:wen_csr_i,wen_csr_r,write_regs_en|wash_i);
ysyx_22040501_Reg#(1,0) reg_is_ecall_o(clk_i,rst_i,wash_i?1'b0:is_ecall_i,is_ecall_r,write_regs_en|wash_i);
ysyx_22040501_Reg#(1,0) reg_is_mret_o(clk_i,rst_i,wash_i?1'b0:is_mret_i,is_mret_r,write_regs_en|wash_i);
ysyx_22040501_Reg#(1,0) reg_is_load_o(clk_i,rst_i,wash_i?1'b0:is_load_i,is_load_o,write_regs_en|wash_i);
ysyx_22040501_Reg#(5,0) reg_addr_dst_o(clk_i,rst_i,wash_i?5'b0:addr_dst_i,addr_dst_o,write_regs_en|wash_i);
ysyx_22040501_Reg#(12,0) reg_addr_csr_o(clk_i,rst_i,wash_i?12'b0:addr_csr_i,addr_csr_o,write_regs_en|wash_i);
ysyx_22040501_Reg#(4,0) reg_inst_key_o(clk_i,rst_i,wash_i ? 4'b0:inst_key_i,inst_key_o,write_regs_en|wash_i);
ysyx_22040501_Reg#(`ysyx_22040501_R_ADDR_W,0) reg_addr_src1_r_o(clk_i,rst_i,wash_i?{`ysyx_22040501_R_ADDR_W{1'b0}}:addr_src1_r_i,addr_src1_r_o,write_regs_en|wash_i);
ysyx_22040501_Reg#(`ysyx_22040501_R_ADDR_W,0) reg_addr_src2_r_o(clk_i,rst_i,wash_i?{`ysyx_22040501_R_ADDR_W{1'b0}}:addr_src2_r_i,addr_src2_r_o,write_regs_en|wash_i);
ysyx_22040501_Reg#(1,0) reg_is_fencei_o(clk_i,rst_i,wash_i?1'b0:is_fencei_i,is_fencei_o,write_regs_en|wash_i);
ysyx_22040501_Reg#(3,0) reg_ls_size_o(clk_i,rst_i,wash_i?3'b0:ls_size_i,ls_size_o,write_regs_en|wash_i);
endmodule
module ysyx_22040501_B_Judge (
	input							clk_i,
	input							rst_i,
	input							add_nouse_inst_i,
	input							add_start_i,
	input	[31:0]			inst_i,
	input	[`ysyx_22040501_WIDTH-1:0]	src1_i,
	input	[`ysyx_22040501_WIDTH-1:0]	src2_i,
	output							pc_jump_o,
	output 	[`ysyx_22040501_PC_NUM-1:0] pc_key_o
);
wire  ignore_jump_o;
wire is_B_type;
wire is_J_type;
wire is_mret;
wire is_ecall;
wire is_jal_J;
wire is_jalr_I;
wire pc_key_beq;
wire pc_key_bne;
wire pc_key_bge;
wire pc_key_blt;
wire pc_key_bltu;
wire pc_key_bgeu;
wire [`ysyx_22040501_WIDTH-1:0]sub_result;
assign is_B_type = (inst_i[6:0] == `ysyx_22040501_B_OPCODE);
assign is_J_type = is_jal_J|0;
assign is_jal_J = (inst_i[6:0] == `ysyx_22040501_JAL_OPCODE);
assign is_jalr_I = (inst_i[6:0] == `ysyx_22040501_JALR_OPCODE)&(inst_i[14:12] == `ysyx_22040501_JALR_FUNCT3);
assign is_ecall = inst_i[31:0] == `ysyx_22040501_ECALL;
assign is_mret = inst_i[31:0] == `ysyx_22040501_MRET;
assign sub_result[`ysyx_22040501_WIDTH-1:0] = src1_i[`ysyx_22040501_WIDTH-1:0] - src2_i[`ysyx_22040501_WIDTH-1:0];
assign pc_key_beq = is_B_type & (inst_i[14:12] == `ysyx_22040501_BEQ_FUNCT3) &( sub_result[`ysyx_22040501_WIDTH-1:0] == 0);
assign pc_key_bne = is_B_type & (inst_i[14:12] == `ysyx_22040501_BNE_FUNCT3) &( sub_result[`ysyx_22040501_WIDTH-1:0]!=0);
assign pc_key_bge = is_B_type & (inst_i[14:12] == `ysyx_22040501_BGE_FUNCT3) &(sub_result[`ysyx_22040501_WIDTH-1] ==1'b0);
assign pc_key_blt = is_B_type & (inst_i[14:12] == `ysyx_22040501_BLT_FUNCT3) &(sub_result[`ysyx_22040501_WIDTH-1] ==1'b1);
assign pc_key_bltu = is_B_type & (inst_i[14:12] == `ysyx_22040501_BLTU_FUNCT3) &(src1_i[`ysyx_22040501_WIDTH-1:0] < src2_i[`ysyx_22040501_WIDTH-1:0] );
assign pc_key_bgeu= is_B_type & (inst_i[14:12] == `ysyx_22040501_BGEU_FUNCT3) &(src1_i[`ysyx_22040501_WIDTH-1:0]>=src2_i[`ysyx_22040501_WIDTH-1:0]);
wire pc_key_0_o;
wire pc_key_0;
assign pc_key_0=(pc_key_beq|pc_key_bne|pc_key_bge|pc_key_blt|pc_key_bltu|pc_key_bgeu);
assign pc_key_0_o = (pc_key_0)&(~ignore_jump_o);
wire pc_jump_1;
wire add_nouse_inst_r;
ysyx_22040501_Reg #(1,0) add_nouse_inst_reg(clk_i,rst_i,add_start_i?1'b0:add_nouse_inst_i,add_nouse_inst_r,add_start_i|add_nouse_inst_i);
assign pc_jump_1 = pc_key_0_o;
assign ignore_jump_o = (add_nouse_inst_i|add_nouse_inst_r);//&(~add_start_i); 
assign pc_key_o[0] = is_J_type|pc_key_0_o;//|pc_key_beq|pc_key_bne|pc_key_bge|pc_key_blt|pc_key_bltu|pc_key_bgeu|0;
assign pc_key_o[1] = is_jalr_I| 0;//not finished yet jalr
assign pc_key_o[2] = is_mret|is_ecall;
assign pc_jump_o = ((is_J_type | is_jalr_I|is_mret|is_ecall)&(~ignore_jump_o))|pc_jump_1;
endmodule
module ysyx_22040501_IF_ID( 
	input									clk_i	,	
	input									rst_i	,	
	input									if_valid_i,
	input									id_ready_i,
	output								write_pr_en_o,
	output								pc_change_start_o,
	output								if_start_o,
	output								id_start_o,
	input									stop_i,
	input									wash_i,
	input									add_nouse_inst_i,
	input									add_start_i,
	output								pc_recover_o,
	input									is_fencei_i,
	input									fencei_end_add_start_i,
	input		[31:0]				inst_i,	
	input		[`ysyx_22040501_WIDTH-1:0]		pc_i	,	
	output		[31:0]				inst_o,	
	output		[`ysyx_22040501_WIDTH-1:0]		pc_o,	
	input	 [`ysyx_22040501_WIDTH-1:0]			pc_IDR_i
);
wire if_valid;
ysyx_22040501_Reg #(1,0) if_valid_reg(clk_i,rst_i,id_ready_i ? 1'b0:if_valid_i,if_valid,if_valid_i|id_ready_i);
wire write_regs_en;
assign write_regs_en = (if_valid|if_valid_i)&id_ready_i&(~stop_i)&(~add_nouse_inst_i)&(~is_fencei_i);
assign write_pr_en_o = write_regs_en;
wire id_start_r;
ysyx_22040501_Reg #(1,0) id_start_o_reg(clk_i,rst_i,write_regs_en,id_start_r,1'b1);
assign id_start_o = id_start_r;
assign pc_change_start_o = (write_regs_en|((pc_o == pc_IDR_i) & add_start_i))&(~is_fencei_i)|
														((pc_i == pc_o) &fencei_end_add_start_i)|
														wash_i;
wire if_start_first;
wire rst_delay_r;
wire rst_delay_r1;
wire if_start;
ysyx_22040501_Reg #(1,0) rst_delay_reg(clk_i,rst_i,~rst_i,rst_delay_r,1'b1);
ysyx_22040501_Reg #(1,0) rst_dealy_reg1(clk_i,rst_i,rst_delay_r,rst_delay_r1,1'b1);
assign if_start_first = rst_delay_r &(~rst_delay_r1);
ysyx_22040501_Reg #(1,0) if_start_reg (clk_i,rst_i,pc_change_start_o| wash_i,if_start,1'b1);
wire fencei_end_add_start_delay;
ysyx_22040501_Reg #(1,0) fencei_end_add_start_delay_reg(clk_i,rst_i,fencei_end_add_start_i&(pc_i != pc_o),fencei_end_add_start_delay,1'b1);
assign if_start_o = if_start|if_start_first| ((pc_o != pc_IDR_i) & add_start_i)| fencei_end_add_start_delay; //((pc_i != pc_o) & fencei_end_add_start_delay);
assign pc_recover_o = (if_valid|if_valid_i)&id_ready_i&(~stop_i)&add_nouse_inst_i;
ysyx_22040501_Reg#(32,0) reg_inst_o(clk_i,rst_i,wash_i|fencei_end_add_start_i ?32'b0:inst_i,inst_o,write_regs_en|wash_i|fencei_end_add_start_i);	
ysyx_22040501_Reg#(`ysyx_22040501_WIDTH,`ysyx_22040501_RST_PC) reg_pc_o(clk_i,rst_i,wash_i?{`ysyx_22040501_WIDTH{1'b0}}:pc_i,pc_o,write_regs_en|wash_i);		
endmodule
module ysyx_22040501_EXU(
	input									clk_i,
	input									rst_i,
	input									ELSp_ready_i,
	output								exe_ready_o,
	input									exe_start_i,
	output								exe_end_o,
	input		[`ysyx_22040501_WIDTH-1:0]	src1_i,
	input		[`ysyx_22040501_WIDTH-1:0]	src2_i,
	input		[`ysyx_22040501_WIDTH-1:0]	csr_i,
	input		[`ysyx_22040501_WIDTH-1:0]	pc_i,
	output 	[`ysyx_22040501_WIDTH-1:0]	data_dst_o,//data to write in the regs
	output	[`ysyx_22040501_WIDTH-1:0]  data_csr_o,//data write to csrs
	output	[`ysyx_22040501_WIDTH-1:0]	npc_o,
	input		[`ysyx_22040501_WIDTH-1:0]	imm_i,
	input		[`ysyx_22040501_OP_NUM-1:0]	alu_key_i,
	input		[1:0]					mul_sign_key_i,
	input		[`ysyx_22040501_A_NUM-1:0]	alu_A_key_i,
	input		[`ysyx_22040501_B_NUM-1:0]	alu_B_key_i,
	input		[`ysyx_22040501_SHAMT_NUM-1:0]shamt_key_i,
	input		[`ysyx_22040501_PC_NUM-1:0]	pc_key_i,
	input									alu_result_key_i,
	input 	[`ysyx_22040501_RESULT_NUM-1:0]result_key_i,
	input  	[`ysyx_22040501_CSR_KEY_NUM-1:0]data_csr_key_i,	
	input									csr_i_or_r_key_i,
	output	[`ysyx_22040501_WIDTH-1:0]	address_o
);
assign exe_ready_o = ELSp_ready_i;
wire [`ysyx_22040501_WIDTH-1:0] 			A;
wire [`ysyx_22040501_WIDTH-1:0] 			B;
wire [`ysyx_22040501_WIDTH-1:0]				Result;
wire [`ysyx_22040501_WIDTH-1:0]				alu_64bit_result;
ysyx_22040501_MuxKeyWithDefault #(`ysyx_22040501_A_NUM,`ysyx_22040501_A_NUM,`ysyx_22040501_WIDTH) A_mux (A[`ysyx_22040501_WIDTH-1:0],alu_A_key_i[`ysyx_22040501_A_NUM-1:0],{`ysyx_22040501_WIDTH{1'b0}},{
	5'b00001, src1_i[`ysyx_22040501_WIDTH-1:0],
	5'b00010,	pc_i[`ysyx_22040501_WIDTH-1:0],//pc
	5'b00100,{`ysyx_22040501_WIDTH{1'b0}},	//0
	5'b01000,{{`ysyx_22040501_WIDTH-32{1'b0}},{src1_i[31:0]}},	
	5'b10000,{{`ysyx_22040501_WIDTH-32{src1_i[31]}},{src1_i[31:0]}}	
});
wire [`ysyx_22040501_WIDTH-1:0]				B_before_shamt_mux;
ysyx_22040501_MuxKeyWithDefault #(`ysyx_22040501_B_NUM,`ysyx_22040501_B_NUM,`ysyx_22040501_WIDTH) B_before_cut_mux (B_before_shamt_mux[`ysyx_22040501_WIDTH-1:0],alu_B_key_i[`ysyx_22040501_B_NUM-1:0],{`ysyx_22040501_WIDTH{1'b0}},{
	4'b0001, imm_i[`ysyx_22040501_WIDTH-1:0],
	4'b0010, src2_i[`ysyx_22040501_WIDTH-1:0],
	4'b0100, {{`ysyx_22040501_WIDTH-32{src2_i[31]}},{src2_i[31:0]}},
	4'b1000, {{`ysyx_22040501_WIDTH-32{1'b0}},{src2_i[31:0]}}
});
ysyx_22040501_MuxKeyWithDefault #(`ysyx_22040501_SHAMT_NUM,`ysyx_22040501_SHAMT_NUM,`ysyx_22040501_WIDTH) B_mux (B[`ysyx_22040501_WIDTH-1:0],shamt_key_i[`ysyx_22040501_SHAMT_NUM-1:0],B_before_shamt_mux[`ysyx_22040501_WIDTH-1:0],{
	2'b01, {{`ysyx_22040501_WIDTH-5{1'b0}},B_before_shamt_mux[4:0]}, 
	2'b10, {{`ysyx_22040501_WIDTH-6{1'b0}},B_before_shamt_mux[5:0]}	
});
ysyx_22040501_ALU alu (
.clk_i									(clk_i),
.rst_i									(rst_i),
.valid_i								(exe_start_i),
.A_i										(A),
.B_i										(B),
.key_i									(alu_key_i),
.mul_sign_key_i					(mul_sign_key_i[1:0]),
.Result_o								(alu_64bit_result),
.result_valid_o					(exe_end_o)
);
assign Result[`ysyx_22040501_WIDTH-1:0] = alu_result_key_i ? {{32{alu_64bit_result[31]}},alu_64bit_result[31:0]}:alu_64bit_result[`ysyx_22040501_WIDTH-1:0];
assign address_o[`ysyx_22040501_WIDTH-1:0] = Result[`ysyx_22040501_WIDTH-1:0];
ysyx_22040501_MuxKeyWithDefault #(`ysyx_22040501_RESULT_NUM,`ysyx_22040501_RESULT_NUM,`ysyx_22040501_WIDTH) data_dst_o_mux(data_dst_o[`ysyx_22040501_WIDTH-1:0],result_key_i[`ysyx_22040501_RESULT_NUM-1:0],Result[`ysyx_22040501_WIDTH-1:0],{
	2'b01,	pc_i[`ysyx_22040501_WIDTH-1:0]+4,
	2'b10, csr_i[`ysyx_22040501_WIDTH-1:0]
});
ysyx_22040501_MuxKeyWithDefault #(`ysyx_22040501_CSR_KEY_NUM,`ysyx_22040501_CSR_KEY_NUM,`ysyx_22040501_WIDTH) csr_data_mux (data_csr_o[`ysyx_22040501_WIDTH-1:0],data_csr_key_i[`ysyx_22040501_CSR_KEY_NUM-1:0],{`ysyx_22040501_WIDTH{1'b0}},{
	3'b001, csr_i_or_r_key_i ? imm_i[`ysyx_22040501_WIDTH-1:0] : src1_i[`ysyx_22040501_WIDTH-1:0], 
	3'b010, csr_i[`ysyx_22040501_WIDTH-1:0] | (csr_i_or_r_key_i ? imm_i[`ysyx_22040501_WIDTH-1:0] : src1_i[`ysyx_22040501_WIDTH-1:0]),
	3'b100, csr_i[`ysyx_22040501_WIDTH-1:0] & (~(csr_i_or_r_key_i ? imm_i[`ysyx_22040501_WIDTH-1:0] : src1_i[`ysyx_22040501_WIDTH-1:0]))
});
ysyx_22040501_MuxKeyWithDefault #(`ysyx_22040501_PC_NUM,`ysyx_22040501_PC_NUM,`ysyx_22040501_WIDTH) npc_mux (npc_o[`ysyx_22040501_WIDTH-1:0],pc_key_i[`ysyx_22040501_PC_NUM-1:0],pc_i[`ysyx_22040501_WIDTH-1:0]+4,{
	3'b001, Result[`ysyx_22040501_WIDTH-1:0], 
	3'b010, {Result[`ysyx_22040501_WIDTH-1:1],1'b0},
	3'b100, csr_i[`ysyx_22040501_WIDTH-1:0]
});
endmodule
module ysyx_22040501_DIV #(
	WIDTH = 64	
)(
	input								clk_i,
	input								rst_i,
	input	[WIDTH-1:0]		dividend_i,//被除数
	input	[WIDTH-1:0]		divisor_i,//除数
	input								div_valid_i,
	input								div_signed_i,
	output	[WIDTH-1:0]	quotient_o,
	output	[WIDTH-1:0]	remainder_o,
	output							result_valid_o
);	
wire [WIDTH-1:0]subresult;
wire [WIDTH-1:0]	dividend_abs;
wire [WIDTH-1:0]	divisor_abs;
assign dividend_abs[WIDTH-1:0] = div_signed_i & dividend_i[WIDTH-1] ? (~dividend_i[WIDTH-1:0] + 1):dividend_i[WIDTH-1:0];
assign divisor_abs[WIDTH-1:0] = div_signed_i & divisor_i[WIDTH-1] ? (~divisor_i[WIDTH-1:0] + 1):divisor_i[WIDTH-1:0];
wire [WIDTH-1:0]	divisor_ro;
ysyx_22040501_Reg #(WIDTH,0)	divisor_reg (clk_i,rst_i,divisor_abs[WIDTH-1:0],divisor_ro[WIDTH-1:0],div_valid_i);
wire 						dividend_postive_ro;
wire						divisor_postive_ro;
ysyx_22040501_Reg	#(1,0) dividend_positive_r(clk_i,rst_i,((~dividend_i[WIDTH-1])&div_signed_i)|(~div_signed_i),dividend_postive_ro,div_valid_i);
ysyx_22040501_Reg	#(1,0) divisor_positive_r(clk_i,rst_i,((~divisor_i[WIDTH-1])&div_signed_i)|(~div_signed_i),divisor_postive_ro,div_valid_i);
wire [WIDTH:0]	valid;
ysyx_22040501_Reg #(1,0) valid_1_r(clk_i,rst_i,div_valid_i,valid[0],1'b1);
genvar i;
generate
	for(i =1;i<WIDTH+1;i++)begin
ysyx_22040501_Reg#(1,0) valid_r(clk_i,rst_i,valid[i-1],valid[i],1'b1);
	end
endgenerate
ysyx_22040501_Reg #(1,0) valid_o_r(clk_i,rst_i,valid[WIDTH],result_valid_o,1'b1);
wire doing_div = div_valid_i | (|valid[WIDTH:0]);
wire [2*WIDTH-1:0] dividend_next;
wire [2*WIDTH-1:0] dividend_ro;
wire [2*WIDTH-1:0] dividend_next_final_cycle;
wire [2*WIDTH-1:0] dividend_next_normal;
assign dividend_next_normal[2*WIDTH-1:0] = ~subresult[WIDTH-1] ?	{subresult[WIDTH-2:0],dividend_ro[WIDTH-1:0],1'b0}: {dividend_ro[2*WIDTH-2:0],1'b0};
assign dividend_next_final_cycle[2*WIDTH-1:0] = ~subresult[WIDTH-1] ?	{subresult[WIDTH-1:0],dividend_ro[WIDTH-1:0]}: {dividend_ro[2*WIDTH-1:0]};
assign dividend_next = div_valid_i ? {{WIDTH{1'b0}},dividend_abs[WIDTH-1:0]} : 
				valid[WIDTH] ? dividend_next_final_cycle: dividend_next_normal;
ysyx_22040501_Reg #(2*WIDTH,0) dividend_reg(clk_i,rst_i,dividend_next[2*WIDTH-1:0],dividend_ro[2*WIDTH-1:0],doing_div);
wire	[WIDTH-1:0] quotient_next;
wire	[WIDTH-1:0] quotient_abs;
wire	quotient_new_bit;
assign subresult[WIDTH-1:0] = dividend_ro[2*WIDTH-1:WIDTH] - divisor_ro[WIDTH-1:0];
assign quotient_new_bit = ~subresult[WIDTH-1];
assign quotient_next[WIDTH-1:0] =div_valid_i? 0:{quotient_abs[WIDTH-2:0],quotient_new_bit};
ysyx_22040501_Reg #(WIDTH,0)	quotient_reg(clk_i,rst_i,quotient_next[WIDTH-1:0],quotient_abs[WIDTH-1:0],doing_div);
wire	[WIDTH-1:0] remainder_abs;
assign remainder_abs[WIDTH-1:0] =dividend_ro[2*WIDTH-1:WIDTH];
wire [1:0] key = {dividend_postive_ro,divisor_postive_ro};
ysyx_22040501_MuxKey #(4,2,WIDTH) quotient_o_mux(.out(quotient_o[WIDTH-1:0]),.key(key[1:0]),.lut({
	2'b00, quotient_abs[WIDTH-1:0],	
	2'b01, ~quotient_abs[WIDTH-1:0]+1,
	2'b10, ~quotient_abs[WIDTH-1:0]+1,
	2'b11, quotient_abs[WIDTH-1:0]	
}));
ysyx_22040501_MuxKey #(4,2,WIDTH) remainder_o_mux(.out(remainder_o[WIDTH-1:0]),.key(key[1:0]),.lut({
	2'b00,~remainder_abs[WIDTH-1:0]+1,
	2'b01,~remainder_abs[WIDTH-1:0]+1,
	2'b10,remainder_abs[WIDTH-1:0],
	2'b11,remainder_abs[WIDTH-1:0]
}));
endmodule
module ysyx_22040501_ALU(
input								clk_i,
input								rst_i,
input								valid_i,
input [`ysyx_22040501_WIDTH-1:0] 	A_i,
input [`ysyx_22040501_WIDTH-1:0] 	B_i,
input [`ysyx_22040501_OP_NUM-1:0] key_i,
input	[1:0]					mul_sign_key_i,
output [`ysyx_22040501_WIDTH-1:0] Result_o,
output							result_valid_o
);
wire [`ysyx_22040501_WIDTH-1:0] add_result;
wire [`ysyx_22040501_WIDTH-1:0] and_result;
wire [`ysyx_22040501_WIDTH-1:0] or_result;
wire [`ysyx_22040501_WIDTH-1:0] xor_result;
wire [`ysyx_22040501_WIDTH-1:0] sltu_result;
wire [`ysyx_22040501_WIDTH-1:0] sll_result;
wire [`ysyx_22040501_WIDTH-1:0] sra_result;
wire [`ysyx_22040501_WIDTH-1:0] srl_result;
wire [`ysyx_22040501_WIDTH-1:0] mul_result;
wire [`ysyx_22040501_WIDTH-1:0] div_result;
wire [`ysyx_22040501_WIDTH-1:0] rem_result;
wire [`ysyx_22040501_WIDTH-1:0] slt_result;
wire [`ysyx_22040501_WIDTH-1:0] mulh_result;
wire [`ysyx_22040501_WIDTH-1:0] t_add_Cin;
wire C_in; //if C_in == 1 is sub
assign C_in = (key_i == `ysyx_22040501_SUB)|(key_i == `ysyx_22040501_SLT)|0 ;
assign t_add_Cin = ({`ysyx_22040501_WIDTH{C_in}}^B_i) + {{(`ysyx_22040501_WIDTH-1){1'b0}},C_in};
assign add_result = A_i + t_add_Cin;
assign and_result = A_i&B_i;
assign or_result = A_i|B_i;
assign xor_result = A_i^B_i;
assign sltu_result = (A_i<B_i) ? 1:0;//use sub result to compare 
assign slt_result = add_result[`ysyx_22040501_WIDTH-1]==1'b1 ? 1:0;//use sub result to compare 
assign sll_result = A_i << B_i;
assign sra_result = $signed(A_i) >>> B_i;
assign srl_result = A_i >> B_i;
ysyx_22040501_MuxKeyWithDefault #(`ysyx_22040501_OP_NUM,`ysyx_22040501_OP_NUM,`ysyx_22040501_WIDTH) alu_mux (Result_o[`ysyx_22040501_WIDTH-1:0],key_i[`ysyx_22040501_OP_NUM-1:0],{`ysyx_22040501_WIDTH{1'b0}},{
	`ysyx_22040501_ADD	,	add_result[`ysyx_22040501_WIDTH-1:0],
	`ysyx_22040501_SLTU,	sltu_result[`ysyx_22040501_WIDTH-1:0],
	`ysyx_22040501_SLL	,	sll_result[`ysyx_22040501_WIDTH-1:0],
	`ysyx_22040501_XOR	,	xor_result[`ysyx_22040501_WIDTH-1:0],
	`ysyx_22040501_AND	,	and_result[`ysyx_22040501_WIDTH-1:0],
	`ysyx_22040501_SRA	,	sra_result[`ysyx_22040501_WIDTH-1:0],
	`ysyx_22040501_SUB	,	add_result[`ysyx_22040501_WIDTH-1:0],
	`ysyx_22040501_OR		,	or_result[`ysyx_22040501_WIDTH-1:0],
	`ysyx_22040501_SRL	,	srl_result[`ysyx_22040501_WIDTH-1:0],
	`ysyx_22040501_MUL	,	mul_result[`ysyx_22040501_WIDTH-1:0],
	`ysyx_22040501_DIV	,	div_result[`ysyx_22040501_WIDTH-1:0],
	`ysyx_22040501_REM	,	rem_result[`ysyx_22040501_WIDTH-1:0],
	`ysyx_22040501_DIVU ,	div_result[`ysyx_22040501_WIDTH-1:0],
	`ysyx_22040501_REMU	,	rem_result[`ysyx_22040501_WIDTH-1:0],
	`ysyx_22040501_SLT	,	slt_result[`ysyx_22040501_WIDTH-1:0],
	`ysyx_22040501_MULH ,	mulh_result[`ysyx_22040501_WIDTH-1:0]
});
wire							is_mul;
wire							mul_valid;
wire							mul_valid_r;
wire							mul_valid_i;
wire							mul_result_valid;
assign is_mul = (key_i[`ysyx_22040501_OP_NUM-1:0] == `ysyx_22040501_MUL);
assign mul_valid = valid_i & is_mul;
ysyx_22040501_Reg #(1,0) mul_valid_reg(clk_i,rst_i,mul_valid,mul_valid_r,1'b1);
assign mul_valid_i = mul_valid &(~mul_valid_r); //only one cycle
ysyx_22040501_MULT mult(
	.clk_i							(clk_i),
	.rst_i							(rst_i),	
	.mul_valid_i				(mul_valid_i),
	.mul_signed_i				(mul_sign_key_i[1:0]), //low bit 1 mean multiplicand_i should be seem as signed
  .multiplicand_i			(A_i[`ysyx_22040501_WIDTH-1:0]),
  .multiplier_i				(B_i[`ysyx_22040501_WIDTH-1:0]),
  .result_h_o					(mulh_result[`ysyx_22040501_WIDTH-1:0]),
  .result_l_o 				(mul_result[`ysyx_22040501_WIDTH-1:0]),
	.result_valid_o			(mul_result_valid)
);
wire							is_div;
wire							div_valid;
wire							div_valid_r;
wire							div_valid_i;
wire							div_result_valid;
wire							div_signed_i;
assign is_div = (key_i[`ysyx_22040501_OP_NUM-1:0] == `ysyx_22040501_DIV)|(key_i[`ysyx_22040501_OP_NUM-1:0] == `ysyx_22040501_DIVU)|(key_i[`ysyx_22040501_OP_NUM-1:0] == `ysyx_22040501_REM)|(key_i[`ysyx_22040501_OP_NUM-1:0] == `ysyx_22040501_REMU);
assign div_valid = valid_i & is_div;
ysyx_22040501_Reg #(1,0) div_valid_reg(clk_i,rst_i,div_valid,div_valid_r,1'b1);
assign div_valid_i = div_valid &(~div_valid_r); //only one cycle
assign div_signed_i =(key_i[`ysyx_22040501_OP_NUM-1:0] == `ysyx_22040501_DIV)| (key_i[`ysyx_22040501_OP_NUM-1:0] == `ysyx_22040501_REM);
ysyx_22040501_DIV div(
	.clk_i							(clk_i),
	.rst_i							(rst_i),
	.dividend_i					(A_i[`ysyx_22040501_WIDTH-1:0]),
	.divisor_i					(B_i[`ysyx_22040501_WIDTH-1:0]),
	.div_valid_i				(div_valid_i),
	.div_signed_i				(div_signed_i),
	.quotient_o					(div_result[`ysyx_22040501_WIDTH-1:0]),
	.remainder_o				(rem_result[`ysyx_22040501_WIDTH-1:0]),
	.result_valid_o			(div_result_valid)
);	
wire [1:0] result_valid_key;
assign result_valid_key = {is_div,is_mul};
ysyx_22040501_MuxKeyWithDefault #(3,2,1) result_valid_o_mux(result_valid_o,result_valid_key[1:0],1'b0,{
	2'b00,	valid_i,
	2'b01,	mul_result_valid,
	2'b10,	div_result_valid	
});
endmodule 
module ysyx_22040501_MULT #(
  WIDTH = 64,
	TOTAL_W = WIDTH + 2,
	PNUM = TOTAL_W/2
)(
	input								clk_i,
	input								rst_i,
	input								mul_valid_i,
	input		[1:0]				mul_signed_i, //low bit 1 mean multiplicand_i should be seem as signed
  input 	[WIDTH-1:0]	multiplicand_i,
  input 	[WIDTH-1:0]	multiplier_i,
  output 	[WIDTH-1:0] result_h_o,
  output 	[WIDTH-1:0]	result_l_o,
	output							result_valid_o
);
  wire	[TOTAL_W-1:0]   x  ;
  wire	[TOTAL_W-1:0]   y  ;
  wire  [2*TOTAL_W-1:0] result;
  assign x = {mul_signed_i[0] ? {2{multiplicand_i[WIDTH-1]}} : 2'b0, multiplicand_i[WIDTH-1:0]};
  assign y = {mul_signed_i[1] ? {2{multiplier_i[WIDTH-1]}} : 2'b0, multiplier_i[WIDTH-1:0]};
  wire  [TOTAL_W:0] p[PNUM-1:0];
  wire  c [PNUM-1:0];
ysyx_22040501_booth #(.WIDTH (TOTAL_W)) B_0(.x (x),.s ({y[1:0], 1'b0}),.p (p[0]),.c (c[0]));
	genvar i;
	generate
  	for(i=1; i<PNUM; i++)begin
ysyx_22040501_booth #(.WIDTH (TOTAL_W)) B_(.x (x),.s (y[2*i+1 : 2*i-1]),.p (p[i]),.c (c[i]));
  	end
	endgenerate
  wire [2*TOTAL_W-1:0] tree_in [PNUM-1:0];
  assign tree_in[0] = {{(TOTAL_W-1){c[0]}} , p[0]	};
	generate
  	for(i=1; i<PNUM; i=i+1)begin
    	assign tree_in[i] = {{(TOTAL_W-1-2*i){p[i][TOTAL_W-1]}}, p[i], 1'b0, c[i-1], {(2*i-2){1'b0}}};
  	end
	endgenerate
ysyx_22040501_wallace_tree #(2*TOTAL_W) my_wallace_tree (
		.clk_i					(clk_i),
		.rst_i					(rst_i),
		.valid_i				(mul_valid_i),
		.in							(tree_in),
		.result_o				(result),
		.result_valid_o	(result_valid_o)
	);
  assign {result_h_o[WIDTH-1:0], result_l_o[WIDTH-1:0]} = result[2*WIDTH-1:0];
endmodule
module ysyx_22040501_booth #(parameter WIDTH=64) (
  input [WIDTH-1:0] x,
  input [2:0] s,
  output wire [WIDTH:0] p,
  output wire c
);
  wire y_add,y,y_sub; // y+1,y,y-1
  wire sel_negative,sel_double_negative,sel_positive,sel_double_positive;
  assign {y_add,y,y_sub} = s;
  assign sel_negative =  y_add & (y & ~y_sub | ~y & y_sub);
  assign sel_positive = ~y_add & (y & ~y_sub | ~y & y_sub);
  assign sel_double_negative =  y_add & ~y & ~y_sub;
  assign sel_double_positive = ~y_add &  y &  y_sub;
  assign p = sel_double_negative ? ~{x, 1'b0} : 
            (sel_double_positive ? {x, 1'b0} :
            (sel_negative ? ~{1'b0,x}:
            (sel_positive ?  {1'b0,x} : {(WIDTH+1){1'b0}})));
  assign c = sel_double_negative | sel_negative ? 1'b1 : 1'b0;
endmodule
module ysyx_22040501_wallace_tree#(
  parameter WIDTH=132
) (
	input	 						 clk_i,
	input							 rst_i,
	input							 valid_i,
  input  [WIDTH-1:0] in [32:0],
  output [WIDTH-1:0] result_o,
	output						 result_valid_o
);
  wire  [WIDTH-1:0] s_row1[11:0];
  wire  [WIDTH-1:0] c_row1[11:0];
  wire  [WIDTH-1:0] c_row1_shift[11:0];
  wire  [WIDTH-1:0] s_row2[6:0];
  wire  [WIDTH-1:0] c_row2[6:0];
  wire  [WIDTH-1:0] c_row2_shift[6:0];
  wire  [WIDTH-1:0] s_row3[4:0];
  wire  [WIDTH-1:0] c_row3[4:0];
  wire  [WIDTH-1:0] c_row3_shift[4:0];
  wire  [WIDTH-1:0] s_row3_r[4:0];
  wire  [WIDTH-1:0] c_row3_shift_r[4:0];
	wire							valid3_r;
  wire  [WIDTH-1:0] s_row4[2:0];
  wire  [WIDTH-1:0] c_row4[2:0];
  wire  [WIDTH-1:0] c_row4_shift[2:0];
  wire  [WIDTH-1:0] s_row5[1:0];
  wire  [WIDTH-1:0] c_row5[1:0];
  wire  [WIDTH-1:0] c_row5_shift[1:0];
  wire  [WIDTH-1:0] s_row6, c_row6, c_row6_shift;
  wire  [WIDTH-1:0] s_row7_r,c_row6_shift_r,c_row7_shift_r;
  wire  [WIDTH-1:0] s_row7, c_row7, c_row7_shift;
  wire  [WIDTH-1:0] s_row8, c_row8, c_row8_shift;
	wire valid7_r;
  wire [WIDTH-1:0] out;
genvar i;
generate
	for(i=0; i<11; i=i+1)begin
ysyx_22040501_csa_n#(.N(WIDTH)) csa_row1  (in[3*i] , in[3*i+1] , in[3*i+2] , s_row1[i], c_row1[i]);
  	assign c_row1_shift[i] = {c_row1[i][WIDTH-2:0], 1'b0};
	end
endgenerate
ysyx_22040501_csa_n #(.N(WIDTH)) csa_row2_0  (s_row1[0]      , c_row1_shift[0],  s_row1[1]      ,  s_row2[0], c_row2[0]);
ysyx_22040501_csa_n #(.N(WIDTH)) csa_row2_1  (c_row1_shift[1], s_row1[2]      ,  c_row1_shift[2],  s_row2[1], c_row2[1]);
ysyx_22040501_csa_n #(.N(WIDTH)) csa_row2_2  (s_row1[3]      , c_row1_shift[3],  s_row1[4]      ,  s_row2[2], c_row2[2]);
ysyx_22040501_csa_n #(.N(WIDTH)) csa_row2_3  (c_row1_shift[4], s_row1[5]      ,  c_row1_shift[5],  s_row2[3], c_row2[3]);
ysyx_22040501_csa_n #(.N(WIDTH)) csa_row2_4  (s_row1[6]      , c_row1_shift[6],  s_row1[7]      ,  s_row2[4], c_row2[4]);
ysyx_22040501_csa_n #(.N(WIDTH)) csa_row2_5  (c_row1_shift[7], s_row1[8]      ,  c_row1_shift[8],  s_row2[5], c_row2[5]);
ysyx_22040501_csa_n #(.N(WIDTH)) csa_row2_6  (s_row1[9]      , c_row1_shift[9],  s_row1[10]     ,  s_row2[6], c_row2[6]);
generate
	for(i=0; i<7; i=i+1)begin
  	assign c_row2_shift[i] = {c_row2[i][WIDTH-2:0], 1'b0};
	end
endgenerate
ysyx_22040501_csa_n #(.N(WIDTH)) csa_row3_0  (c_row1_shift[10], s_row2[0]      , c_row2_shift[0], s_row3[0], c_row3[0]);
ysyx_22040501_csa_n #(.N(WIDTH)) csa_row3_1  (s_row2[1]       , c_row2_shift[1], s_row2[2]      , s_row3[1], c_row3[1]);
ysyx_22040501_csa_n #(.N(WIDTH)) csa_row3_2  (c_row2_shift[2] , s_row2[3]      , c_row2_shift[3], s_row3[2], c_row3[2]);
ysyx_22040501_csa_n #(.N(WIDTH)) csa_row3_3  (s_row2[4]       , c_row2_shift[4], s_row2[5]      , s_row3[3], c_row3[3]);
ysyx_22040501_csa_n #(.N(WIDTH)) csa_row3_4  (c_row2_shift[5] , s_row2[6]      , c_row2_shift[6], s_row3[4], c_row3[4]);
generate
	for(i=0; i<5; i=i+1)begin
  	assign c_row3_shift[i] = {c_row3[i][WIDTH-2:0], 1'b0};
	end
endgenerate
generate
	for(i=0;i<5; i++) begin
ysyx_22040501_Reg #(132,0) pipline_s_row3(clk_i,rst_i,s_row3[i],s_row3_r[i],valid_i);
ysyx_22040501_Reg #(132,0) pipline_c_row3_shift(clk_i,rst_i,c_row3_shift[i],c_row3_shift_r[i],valid_i);
	end
endgenerate
ysyx_22040501_Reg#(1,0) pipline_valid3(clk_i,rst_i,valid_i,valid3_r,1'b1);
ysyx_22040501_csa_n #(.N(WIDTH)) csa_row4_0  (s_row3_r[0]       , c_row3_shift_r[0], s_row3_r[1]      , s_row4[0], c_row4[0]);
ysyx_22040501_csa_n #(.N(WIDTH)) csa_row4_1  (c_row3_shift_r[1] , s_row3_r[2]      , c_row3_shift_r[2], s_row4[1], c_row4[1]);
ysyx_22040501_csa_n #(.N(WIDTH)) csa_row4_2  (s_row3_r[3]       , c_row3_shift_r[3], s_row3_r[4]      , s_row4[2], c_row4[2]);
generate
	for(i=0; i<3; i=i+1)begin
  	assign c_row4_shift[i] = {c_row4[i][WIDTH-2:0], 1'b0};
	end
endgenerate
ysyx_22040501_csa_n #(.N(WIDTH)) csa_row5_0  (c_row3_shift_r[4], s_row4[0]      , c_row4_shift[0], s_row5[0], c_row5[0]);
ysyx_22040501_csa_n #(.N(WIDTH)) csa_row5_1  (s_row4[1]      , c_row4_shift[1], s_row4[2]      , s_row5[1], c_row5[1]);
generate
  for(i=0; i<2; i=i+1)begin: csa_row5_shift
  	assign c_row5_shift[i] = {c_row5[i][WIDTH-2:0], 1'b0};
	end
endgenerate
ysyx_22040501_csa_n #(.N(WIDTH)) csa_row6    (c_row4_shift[2], s_row5[0], c_row5_shift[0], s_row6, c_row6);
assign c_row6_shift = {c_row6[WIDTH-2:0], 1'b0};
ysyx_22040501_csa_n #(.N(WIDTH)) csa_row7    (s_row5[1], c_row5_shift[1], s_row6, s_row7, c_row7);
assign c_row7_shift = {c_row7[WIDTH-2:0], 1'b0};
ysyx_22040501_Reg#(1,0) pipline_valid7(clk_i,rst_i,valid3_r,valid7_r,1'b1);
ysyx_22040501_Reg #(132,0) pipline_s_row7(clk_i,rst_i,s_row7,s_row7_r,valid3_r);
ysyx_22040501_Reg #(132,0) pipline_c_row7_shift(clk_i,rst_i,c_row7_shift,c_row7_shift_r,valid3_r);
ysyx_22040501_Reg #(132,0) pipline_c_row6_shift(clk_i,rst_i,c_row6_shift,c_row6_shift_r,valid3_r);
ysyx_22040501_csa_n #(.N(WIDTH)) csa_row8    (c_row6_shift_r, s_row7_r, c_row7_shift_r, s_row8, c_row8);
assign c_row8_shift = {c_row8[WIDTH-2:0], 1'b0};
assign out=c_row8_shift + s_row8; 
assign result_o = out;
assign result_valid_o = valid7_r;
endmodule
module ysyx_22040501_csa_n#(
  parameter N = 64
)(
  input  [N-1:0] a_i, 
  input  [N-1:0] b_i, 
  input  [N-1:0] c_i, 
  output [N-1:0] s_o, 
  output [N-1:0] c_o
);
  genvar i;
  generate
    for(i=0; i<N; i=i+1)begin:csa
      assign s_o[i] = a_i[i] ^ b_i[i] ^ c_i[i];
      assign c_o[i] = (a_i[i] & b_i[i])|(a_i[i] & c_i[i])|(b_i[i] & c_i[i]);
    end
  endgenerate
endmodule
module ysyx_22040501_LSU(
	input			clk_i,
	input			rst_i,
	output		lsu_ready_o,
	input			LSRp_ready_i,
	input			is_fencei_i,
	output		fencei_end_o,
	input	 [`ysyx_22040501_WIDTH-1:0]	store_data_i,
	output [`ysyx_22040501_WIDTH-1:0] load_data_o,
	input								read_en_i,
	input								write_en_i,
	input	 [7:0]				store_mask_i,
	input	 [`ysyx_22040501_LOAD_NUM-1:0]load_data_key_i,
	input	 [2:0]				ls_size_i,
	input  [`ysyx_22040501_WIDTH-1:0]	address_i,
	input								ls_start_i,
	output							ls_end_o,
	output	[`ysyx_22040501_WIDTH-1:0]	address_o,
	output								addr_r_valid_o,
	input		[`ysyx_22040501_WIDTH-1:0]	load_data_i,
	input									read_end_i,
	output								addr_w_valid_o,
	output	[`ysyx_22040501_WIDTH-1:0]	store_data_o,
	output	[7:0]					store_mask_o,
	input									write_end_i,
	output								is_fencei_o,
	input									fencei_end_i,
	output								is_clint_o,
	output	[2:0]					ls_size_o,
	input	 [`ysyx_22040501_WIDTH-1:0]		clint_data_i,
	output								clint_w_en_o,
	output								clint_r_en_o
);
wire is_clint ;
assign ls_size_o[2:0] = ls_size_i[2:0];
assign is_clint_o = is_clint;
assign is_clint = (address_i[`ysyx_22040501_WIDTH-1:0] <=64'h00000000_0200BFFF) &(address_i >=64'h00000000_02000000);
assign lsu_ready_o = LSRp_ready_i;
wire ls_start_r;
ysyx_22040501_Reg #(1,0) ls_start_reg(clk_i,rst_i,ls_end_o ? 1'b0:ls_start_i,ls_start_r,ls_start_i|ls_end_o);
assign addr_r_valid_o= read_en_i & (ls_start_r|ls_start_i)&(~ls_end_o)&(~is_clint);
assign addr_w_valid_o= write_en_i& (ls_start_r|ls_start_i)&(~is_clint);
assign clint_r_en_o= read_en_i & (ls_start_r|ls_start_i)&(~ls_end_o);
assign clint_w_en_o= write_en_i& (ls_start_r|ls_start_i);
wire ls_end_r_or_w;
assign ls_end_r_or_w = (read_en_i | write_en_i) ? ((read_end_i)|(write_end_i))&ls_start_r : is_fencei_i ? 0 : (ls_start_i|ls_start_r); 
assign ls_end_o = ls_end_r_or_w | fencei_end_i;
assign address_o[`ysyx_22040501_WIDTH-1:0] = address_i[`ysyx_22040501_WIDTH-1:0];
ysyx_22040501_MuxKey #(8,3,`ysyx_22040501_WIDTH) store_data_axi_mux(store_data_o[`ysyx_22040501_WIDTH-1:0],address_i[2:0],{
	3'b000, store_data_i[`ysyx_22040501_WIDTH-1:0],
	3'b001, {store_data_i[`ysyx_22040501_WIDTH-9:0],8'b0},
	3'b010, {store_data_i[`ysyx_22040501_WIDTH-17:0],16'b0},
	3'b011, {store_data_i[`ysyx_22040501_WIDTH-25:0],24'b0}, 
	3'b100, {store_data_i[`ysyx_22040501_WIDTH-33:0],32'b0}, 
	3'b101, {store_data_i[`ysyx_22040501_WIDTH-41:0],40'b0}, 
	3'b110, {store_data_i[`ysyx_22040501_WIDTH-49:0],48'b0}, 
	3'b111, {store_data_i[`ysyx_22040501_WIDTH-57:0],56'b0} 
});
ysyx_22040501_MuxKey #(8,3,8) store_mask_axi_mux(store_mask_o[7:0],address_i[2:0],{
	3'b000, store_mask_i[7:0],
	3'b001,{store_mask_i[6:0],1'b0},
	3'b010,{store_mask_i[5:0],2'b0},
	3'b011,{store_mask_i[4:0],3'b0},
	3'b100,{store_mask_i[3:0],4'b0},
	3'b101,{store_mask_i[2:0],5'b0},
	3'b110,{store_mask_i[1:0],6'b0},
	3'b111,{store_mask_i[0],7'b0}
});
assign fencei_end_o = fencei_end_i;
assign is_fencei_o = is_fencei_i;
wire [`ysyx_22040501_WIDTH-1:0]			load_data;
wire [`ysyx_22040501_WIDTH-1:0]	load_data_before_shift;
assign load_data_before_shift[`ysyx_22040501_WIDTH-1:0] = is_clint ? clint_data_i[`ysyx_22040501_WIDTH-1:0] : load_data_i[`ysyx_22040501_WIDTH-1:0];
ysyx_22040501_MuxKey #(8,3,`ysyx_22040501_WIDTH) load_data_mux(.out(load_data[`ysyx_22040501_WIDTH-1:0]),.key(address_i[2:0]),.lut({
	3'b000, load_data_before_shift[`ysyx_22040501_WIDTH-1:0],
	3'b001, {8'b0,load_data_before_shift[`ysyx_22040501_WIDTH-1:8]},
	3'b010, {16'b0,load_data_before_shift[`ysyx_22040501_WIDTH-1:16]},
	3'b011, {24'b0,load_data_before_shift[`ysyx_22040501_WIDTH-1:24]},
	3'b100, {32'b0,load_data_before_shift[`ysyx_22040501_WIDTH-1:32]},
	3'b101, {40'b0,load_data_before_shift[`ysyx_22040501_WIDTH-1:40]},
	3'b110, {48'b0,load_data_before_shift[`ysyx_22040501_WIDTH-1:48]},
	3'b111, {56'b0,load_data_before_shift[`ysyx_22040501_WIDTH-1:56]}
}));
wire [`ysyx_22040501_WIDTH-1:0]     load_d_data;
wire [`ysyx_22040501_WIDTH-1:0]     load_w_data;
wire [`ysyx_22040501_WIDTH-1:0]     load_h_data;
wire [`ysyx_22040501_WIDTH-1:0]     load_hu_data;
wire [`ysyx_22040501_WIDTH-1:0]     load_bu_data;
wire [`ysyx_22040501_WIDTH-1:0]     load_b_data;
wire [`ysyx_22040501_WIDTH-1:0]     load_wu_data;
assign load_d_data[`ysyx_22040501_WIDTH-1:0] = load_data[`ysyx_22040501_WIDTH-1:0];
assign load_w_data[`ysyx_22040501_WIDTH-1:0] = {{`ysyx_22040501_WIDTH-32{load_data[31]}},load_data[31:0]};
assign load_h_data[`ysyx_22040501_WIDTH-1:0] = {{`ysyx_22040501_WIDTH-16{load_data[15]}},load_data[15:0]};
assign load_hu_data[`ysyx_22040501_WIDTH-1:0] = {{`ysyx_22040501_WIDTH-16{1'b0}},load_data[15:0]};
assign load_bu_data[`ysyx_22040501_WIDTH-1:0] = {{`ysyx_22040501_WIDTH-8{1'b0}},load_data[7:0]};
assign load_b_data[`ysyx_22040501_WIDTH-1:0] = {{`ysyx_22040501_WIDTH-8{load_data[7]}},load_data[7:0]};
assign load_wu_data[`ysyx_22040501_WIDTH-1:0] = {{`ysyx_22040501_WIDTH-32{1'b0}},load_data[31:0]};
ysyx_22040501_MuxKeyWithDefault #(`ysyx_22040501_LOAD_NUM,`ysyx_22040501_LOAD_NUM,`ysyx_22040501_WIDTH) load_data_o_mux (load_data_o[`ysyx_22040501_WIDTH-1:0],load_data_key_i[`ysyx_22040501_LOAD_NUM-1:0],{`ysyx_22040501_WIDTH{1'b0}},{
7'b000_0001, load_w_data[`ysyx_22040501_WIDTH-1:0],
7'b000_0010, load_d_data[`ysyx_22040501_WIDTH-1:0],
7'b000_0100, load_bu_data[`ysyx_22040501_WIDTH-1:0],
7'b000_1000, load_h_data[`ysyx_22040501_WIDTH-1:0],
7'b001_0000, load_hu_data[`ysyx_22040501_WIDTH-1:0],
7'b010_0000, load_b_data[`ysyx_22040501_WIDTH-1:0],
7'b100_0000, load_wu_data[`ysyx_22040501_WIDTH-1:0]
 });
endmodule
`define ysyx_22040501_WAIT_ADDR 1'b0
`define ysyx_22040501_WAIT_DATA 1'b1
module ysyx_22040501_IFU(
	input 								clk_i,
	input									rst_i,
	output								if_end_o,
	input									if_start_i,
	input		[`ysyx_22040501_WIDTH-1:0] 	pc_i,	
	output 	[31:0]				inst_to_IDU_o,
	output 	[`ysyx_22040501_WIDTH-1:0]	pc_o,
	output								addr_valid_o,	
	input		[31:0]				inst_i,
	input									inst_valid_i
);
wire [31:0] inst1;
ysyx_22040501_Reg #(32,0) inst_r (clk_i,rst_i,inst_i[31:0],inst1[31:0],inst_valid_i);
assign inst_to_IDU_o = inst_valid_i ? inst_i[31:0]:inst1[31:0];
assign if_end_o = inst_valid_i;
assign pc_o[`ysyx_22040501_WIDTH-1:0] = pc_i[`ysyx_22040501_WIDTH-1:0];
assign addr_valid_o = if_start_i ;//| if_start_r;// &(~if_end_o));
endmodule
