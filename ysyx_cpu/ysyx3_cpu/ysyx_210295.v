//ECNURVCORE
//Pipline CPU
//Created by Chesed
//2021.07.19
//Edited in 2021.08.31
`timescale 1ns / 1ps
//update in 1019

`define YSYX210295_BASE_PC			64'h0000_0000_3000_0000
`define YSYX210295_BASE_MEM			64'h0000_0000_8000_0000

`define YSYX210295_PC_MAX			64'h0000_0000_ffff_ffff

`define YSYX210295_ADDR_TIMER_MIN   64'h0000_0000_0200_0000
`define YSYX210295_ADDR_TIMER_MAX   64'h0000_0000_0200_ffff


//zero
`define YSYX210295_ZERO_WORD		32'h0000_0000
`define YSYX210295_ZERO_DOUBLE		64'h0000_0000_0000_0000

`define YSYX210295_MEM_ADDR_ZERO	64'h0000_0000_0000_0000
`define YSYX210295_REG_ADDR_ZERO	5'h00
`define YSYX210295_CSR_ADDR_ZERO	12'h000

`define YSYX210295_AXI_ID_ZERO		4'b0000
`define YSYX210295_AXI_LEN_ZERO		8'h00



//the constant
`define YSYX210295_REG_NUM			32
`define YSYX210295_DATA_WIDTH		64
`define YSYX210295_ADDR_WIDTH       32
`define YSYX210295_WR_STR_ALL		8'hff
`define YSYX210295_WR_STR_WORD		8'h0f
`define YSYX210295_WR_STR_HALF		8'h03
`define YSYX210295_WR_STR_BYTE		8'h01
`define YSYX210295_WR_STR_NONE		8'h00
`define YSYX210295_PC_STEP			64'd4
`define YSYX210295_ADDR_MAX_RAM		64'h0000_0001_0000_0000
`define YSYX210295_AXI_OVER_PAGE	8'h01


//AXI size code
`define YSYX210295_AXI_SIZE_BYTE	3'b000
`define YSYX210295_AXI_SIZE_HALF	3'b001
`define YSYX210295_AXI_SIZE_WORD	3'b010
`define YSYX210295_AXI_SIZE_DOUBLE	3'b011

//AXI burst mode
`define YSYX210295_AXI_BURST_FIX	2'b00
`define YSYX210295_AXI_BURST_INCR	2'b01
`define YSYX210295_AXI_BURST_WRAP	2'b10

//AXI ID
//master
`define YSYX210295_AXI_ID_IF			4'b0000
`define YSYX210295_AXI_ID_MEM			4'b0001
//slave
`define YSYX210295_AXI_ID_RAM			4'b0000

//`define AXI_ID_MMIO			4'b0001






//the bus width
`define YSYX210295_BUS_ADDR_REG		4:0
`define YSYX210295_BUS_ADDR_MEM		63:0
`define YSYX210295_BUS_DATA_REG		63:0
`define YSYX210295_BUS_DATA_MEM		63:0
`define YSYX210295_BUS_DATA_INSTR	31:0
`define YSYX210295_BUS_ALU_OP		2:0
`define YSYX210295_BUS_L_CODE		2:0
`define YSYX210295_BUS_S_CODE		2:0
`define YSYX210295_BUS_JMP_FLAG		2:0
`define YSYX210295_BUS_HOLD_CODE	2:0
`define YSYX210295_BUS_PRE_STATE	1:0
`define YSYX210295_BUS_CSR_IMM		11:0
`define YSYX210295_BUS_CSR_IMMEX	31:0
`define YSYX210295_BUS_EXCEPT_CAUSE	3:0
`define YSYX210295_BUS_CSR_CODE		5:0

//AXI bus
`define YSYX210295_BUS_AXI_AWID		3:0
`define YSYX210295_BUS_AXI_ARID		3:0
`define YSYX210295_BUS_AXI_BID		3:0
`define YSYX210295_BUS_AXI_RID		3:0
`define YSYX210295_BUS_AXI_STRB		7:0
`define YSYX210295_BUS_AXI_CACHE	3:0
`define YSYX210295_BUS_AXI_LEN		7:0
`define YSYX210295_BUS_AXI_SIZE		2:0
`define YSYX210295_BUS_AXI_BURST	1:0
`define YSYX210295_BUS_AXI_RESP		1:0
`define YSYX210295_BUS_AXI_ADDR		31:0



//decode the instrument
`define YSYX210295_OPERATION_CODE	6:0
`define YSYX210295_ADDR_RD			11:7
`define YSYX210295_FUNCT3			14:12
`define YSYX210295_ADDR_RS1			19:15
`define YSYX210295_ADDR_RS2			24:20
`define YSYX210295_SHAMT			24:20
`define YSYX210295_FUNCT7			31:25
`define YSYX210295_FUNCT7_W			31:26




//operation code
`define YSYX210295_OPERATION_NOP			7'b0000000
`define YSYX210295_OPERATION_R				7'b0110011
`define YSYX210295_OPERATION_RW				7'b0111011
`define YSYX210295_OPERATION_I				7'b0010011
`define YSYX210295_OPERATION_IW				7'b0011011

`define YSYX210295_OPERATION_LUI			7'b0110111
`define YSYX210295_OPERATION_LOAD			7'b0000011
`define YSYX210295_OPERATION_S				7'b0100011

`define YSYX210295_OPERATION_B				7'b1100011
`define YSYX210295_OPERATION_J				7'b1101111
`define YSYX210295_OPERATION_JR				7'b1100111
`define YSYX210295_OPERATION_FENCE			7'b0001111
`define YSYX210295_OPERATION_AUIPC			7'b0010111
`define YSYX210295_OPERATION_SYS			7'b1110011
`define YSYX210295_OPERATION_USER_DEFINED 	7'b1111011   //by ou


//funct3 code
//type R
`define YSYX210295_INSTR_ADD			3'b000
`define YSYX210295_INSTR_SL				3'b001
`define YSYX210295_INSTR_SLT			3'b010
`define YSYX210295_INSTR_SLTU			3'b011
`define YSYX210295_INSTR_XOR			3'b100
`define YSYX210295_INSTR_SR				3'b101
`define YSYX210295_INSTR_OR				3'b110
`define YSYX210295_INSTR_AND			3'b111
//type RW
`define YSYX210295_INSTR_ADDW			3'b000
`define YSYX210295_INSTR_SLW			3'b001
`define YSYX210295_INSTR_SRW			3'b101

//type B
`define YSYX210295_INSTR_BEQ			3'b000
`define YSYX210295_INSTR_BNE			3'B001
`define YSYX210295_INSTR_BLT			3'B100
`define YSYX210295_INSTR_BGE			3'B101
`define YSYX210295_INSTR_BLTU			3'B110
`define YSYX210295_INSTR_BGEU			3'B111

//type S
`define YSYX210295_INSTR_SB			3'b000
`define YSYX210295_INSTR_SH			3'b001
`define YSYX210295_INSTR_SW			3'b010
`define YSYX210295_INSTR_SD			3'b011
`define YSYX210295_STORE_NOPE		3'b111

//type I JALR
`define YSYX210295_INSTR_JALR		3'b000

//type I SYSTEM			
`define YSYX210295_INSTR_IRQ		3'b000
`define YSYX210295_INSTR_CSRRW		3'b001
`define YSYX210295_INSTR_CSRRS		3'b010
`define YSYX210295_INSTR_CSRRC		3'b011
`define YSYX210295_INSTR_CSRRWI		3'b101
`define YSYX210295_INSTR_CSRRSI		3'b110
`define YSYX210295_INSTR_CSRRCI		3'b111



//LOAD
`define YSYX210295_INSTR_LB			3'b000
`define YSYX210295_INSTR_LH			3'b001
`define YSYX210295_INSTR_LW			3'b010
`define YSYX210295_INSTR_LD			3'b011
`define YSYX210295_INSTR_LBU		3'b100
`define YSYX210295_INSTR_LHU		3'b101
`define YSYX210295_INSTR_LWU		3'b110
`define YSYX210295_LOAD_NOPE		3'b111




//irq instruction
`define YSYX210295_INSTR_EBREAK 		32'h00100073
`define YSYX210295_INSTR_ECALL 			32'h00000073

`define YSYX210295_INSTR_URET			32'h00200073
`define YSYX210295_INSTR_SRET			32'h10200073
`define YSYX210295_INSTR_MRET			32'h30200073

`define YSYX210295_INSTR_WFI			32'h10500073



//funct7 code
`define YSYX210295_FUNCT7_ADD			7'b0000000
`define YSYX210295_FUNCT7_SUB			7'b0100000
`define YSYX210295_FUNCT7_SRL			7'b0000000
`define YSYX210295_FUNCT7_SRA			7'b0100000
`define YSYX210295_FUNCT7_SRLW			7'b0000000
`define YSYX210295_FUNCT7_SRAW			7'b0100000
`define YSYX210295_FUNCT7_R_ACT			7'b0000000
`define YSYX210295_FUNCT7_W_SRL			6'b000000
`define YSYX210295_FUNCT7_W_SLL			6'b000000
`define YSYX210295_FUNCT7_W_SRA			6'b010000

//jmp flag code
`define YSYX210295_JMP_NOPE				3'b011
`define YSYX210295_JMP_J				3'b010
//the jump code of type B is funct3


//alu operation
`define YSYX210295_ALU_ADD				3'b000
`define YSYX210295_ALU_SL				3'b001
`define YSYX210295_ALU_SLT				3'b010
`define YSYX210295_ALU_SLTU				3'b011
`define YSYX210295_ALU_XOR				3'b100
`define YSYX210295_ALU_SR				3'b101
`define YSYX210295_ALU_OR				3'b110
`define YSYX210295_ALU_AND				3'b111


//enable/disable
`define YSYX210295_INSTR_RD_EN 		1'b1
`define YSYX210295_INSTR_RD_DIS		1'b0
`define YSYX210295_REG_WR_EN		1'b1
`define YSYX210295_REG_WR_DIS		1'b0
`define YSYX210295_JMP_EN			1'b1
`define YSYX210295_JMP_DIS			1'b0
`define YSYX210295_MEM_WR_EN		1'b1
`define YSYX210295_MEM_WR_DIS		1'b0
`define YSYX210295_MEM_RD_EN		1'b1
`define YSYX210295_MEM_RD_DIS		1'b0
`define YSYX210295_ALU_SUB_EN		1'b1
`define YSYX210295_ALU_ADD_EN		1'b0
`define YSYX210295_ALU_SHIFT_L		1'b0
`define YSYX210295_ALU_SHIFT_A		1'b1
`define YSYX210295_BYPASS_EN		1'b0
`define YSYX210295_BYPASS_DIS		1'b1
`define YSYX210295_LOAD_BYPASS_EN	1'b1
`define YSYX210295_LOAD_BYPASS_DIS	1'b0
`define YSYX210295_HOLD_EN			1'b0
`define YSYX210295_HOLD_DIS			1'b1
`define YSYX210295_STALL_EN			1'b1
`define YSYX210295_STALL_DIS		1'b0
`define YSYX210295_MASK_EN			1'b1
`define YSYX210295_MASK_DIS			1'b0
`define YSYX210295_JMP_ERROR		1'b1
`define YSYX210295_JMP_RIGHT		1'b0
`define YSYX210295_PC_MATCH			1'b1
`define YSYX210295_PC_MISMATCH		1'b0
`define YSYX210295_INTERCEPT_EN		1'b1
`define YSYX210295_INTERCEPT_DIS	1'b0

`define YSYX210295_EXCEPT_NOPE		1'b0
`define YSYX210295_EXCEPT_ACT		1'b1

//`define HANDSHAKE_EN		1'b1
//`define HANDSHAKE_DIS		1'b0
`define YSYX210295_AXI_READY_EN		1'b1
`define YSYX210295_AXI_READY_DIS	1'b0
`define YSYX210295_AXI_VALID_EN		1'b1
`define YSYX210295_AXI_VALID_DIS	1'b0
`define YSYX210295_AXI_BUSY			1'b1
`define YSYX210295_AXI_IDLE			1'b0
`define YSYX210295_AXI_ADDR_ALIGN	1'b1
`define YSYX210295_AXI_ADDR_UNALIGN	1'b0



//the scale of memory
//`define YSYX210295_NUM_DATA_MEM		0:255
//`define YSYX210295_NUM_INSTR_MEM		0:255


//hold code
`define YSYX210295_HOLD_CODE_NOPE	3'b000
`define YSYX210295_HOLD_CODE_PC		3'b001
`define YSYX210295_HOLD_CODE_IF		3'b010
`define YSYX210295_HOLD_CODE_ID		3'b011
`define YSYX210295_HOLD_CODE_EX		3'b100


//prediction state
`define YSYX210295_STATE_S_HOLD		2'b00
`define YSYX210295_STATE_W_HOLD		2'b01
`define YSYX210295_STATE_W_JMP		2'b10
`define YSYX210295_STATE_S_JMP		2'b11

//exception cause
`define YSYX210295_EXCEPT_NONE			4'b0000
`define YSYX210295_EXCEPT_PC_OVER		4'b0001
`define YSYX210295_EXCEPT_PC_ALIGN		4'b0000  // by ou 
`define YSYX210295_EXCEPT_ID_ILLEGAL	4'b0011
`define YSYX210295_EXCEPT_ECALL			4'b1011 //by ou
`define YSYX210295_EXCEPT_EBREAK		4'b0101
`define YSYX210295_EXCEPT_MRET			4'b0110
`define YSYX210295_EXCEPT_MEM_ALIGN		4'b0111


//CSR operation code
`define YSYX210295_CSR_CODE_NOPE		3'b000
`define YSYX210295_CSR_CODE_CSRRW		3'b001
`define YSYX210295_CSR_CODE_CSRRS		3'b010
`define YSYX210295_CSR_CODE_CSRRC		3'b011
`define YSYX210295_CSR_CODE_CSRRWI		3'b101
`define YSYX210295_CSR_CODE_CSRRSI		3'b110
`define YSYX210295_CSR_CODE_CSRRCI		3'b111

// CSR reg addr
`define YSYX210295_CSR_MSTATUS 		12'h300
`define YSYX210295_CSR_MISA 		12'h301
`define YSYX210295_CSR_MIE     		12'h304
`define YSYX210295_CSR_MTVEC   		12'h305
`define YSYX210295_CSR_MSCRATCH 	12'h340
`define YSYX210295_CSR_MEPC     	12'h341
`define YSYX210295_CSR_MCAUSE   	12'h342
`define YSYX210295_CSR_MTVAL     	12'h343
`define YSYX210295_CSR_MIP      	12'h344
`define YSYX210295_CSR_MCYCLE   	12'hb00
`define YSYX210295_CSR_MHARTID 		12'hf14
`define YSYX210295_CSR_MINSTRET		12'hb02

`define YSYX210295_WriteEnable 	1'b1
`define YSYX210295_WriteDisable 1'b0
`define YSYX210295_ReadEnable 	1'b1
`define YSYX210295_ReadDisable 	1'b0

`define YSYX210295_ISA_RV64I 64'h8000000000000100
//`define RstEnable 1'b0

//mmio peripherals reg address
// | ADDRESS    		|  NAME    | FUNCTION 							|
// | 0x0000000002004000 | MTIMECMP | TRIG IRG WHEN MTIME >= MTIMECMP	|
// | 0x000000000200BFF8 | MTIME    | TIME CONUNTER						|

`define YSYX210295_CLINT_MTIMECMP 32'h02004000
`define YSYX210295_CLINT_MTIME    32'h0200BFF8

//IRQ base addr reset value
`define YSYX210295_IRQ_ENTRY_INIT 64'h30000000

//defines from ysyx

//`timescale 1ps / 1ps

//`define PC_START   64'h00000000_80000000  
`define YSYX210295_REG_BUS    63 : 0     
//`define INST_ADD   8'h11

//`define AXI_ADDR_WIDTH      64
//`define AXI_DATA_WIDTH      64
//`define AXI_ID_WIDTH        4
//`define AXI_USER_WIDTH      1

//`define SIZE_B              2'b00
//`define SIZE_H              2'b01
//`define SIZE_W              2'b10
//`define SIZE_D              2'b11

//`define REQ_READ            1'b0
//`define REQ_WRITE           1'b1

`define YSYX210295_RISCV_PRIV_MODE_U   0
`define YSYX210295_RISCV_PRIV_MODE_S   1
`define YSYX210295_RISCV_PRIV_MODE_M   3


//ECNURVCORE
//AXI Bus master-slave
//Created by Chesed
//2021.08.12
//Edited in 2021.08.19

// update in 09.08


module ysyx_210295_axi_interconnect(
	input							clock			,
	input							reset			,
	
	output                      	axi_rbusy       ,
	
	//if
//	output		      				awready_if		,
//	input     	      				awvalid_if		,
//	input    	[`YSYX210295_BUS_AXI_AWID]		awid_if 		,
//	input     	[`YSYX210295_BUS_ADDR_MEM]		awaddr_if		,
//	input     	[`YSYX210295_BUS_AXI_LEN] 		awlen_if		,
//	input     	[`YSYX210295_BUS_AXI_SIZE] 	awsize_if		,
//	input     	[`YSYX210295_BUS_AXI_BURST]	awburst_if		,
//	input    	[`YSYX210295_BUS_AXI_CACHE]	awcache_if		,
//	input    						awprot_if		,
//	input    						awqos_if		,
//	input    						awregion_if		,
//	output 		      				wready_if		,
//	input     	      				wvalid_if		,
//	input     	[`YSYX210295_BUS_DATA_MEM]		wdata_if		,
//	input     	[`YSYX210295_BUS_AXI_STRB] 	wstrb_if		,
//	input     	      				wlast_if		,
//	output 		[`YSYX210295_BUS_AXI_BID]		bid_if			,
//	output 		[`YSYX210295_BUS_AXI_RESP]		bresp_if		,
//	output 							bvalid_if		,
//	input    						bready_if		,
	output reg	      				arready_if		,
	input     	      				arvalid_if		,
	input    	[`YSYX210295_BUS_AXI_ARID]		arid_if			,
	input     	[`YSYX210295_BUS_ADDR_MEM]		araddr_if		,
	input     	[`YSYX210295_BUS_AXI_LEN] 		arlen_if		,
	input     	[`YSYX210295_BUS_AXI_SIZE] 	arsize_if		,
	input     	[`YSYX210295_BUS_AXI_BURST]	arburst_if		,
//	input    	[`YSYX210295_BUS_AXI_CACHE]	arcache_if		,
//	input    						arprot_if		,
//	input    						arqos_if		,
//	input    						arregion_if		,
//	output reg	[`YSYX210295_BUS_AXI_RID] 		rid_if			,
	output reg	[`YSYX210295_BUS_DATA_MEM]		rdata_if		,

//	output reg	[`YSYX210295_BUS_AXI_RESP]		rresp_if		,
	output reg	      				rlast_if		,
	output reg						rvalid_if 		,
	input    						rready_if 		,
	
	//mem
	output reg	      				awready_mem		,
	input     	      				awvalid_mem		,
	input    	[`YSYX210295_BUS_AXI_AWID]		awid_mem		,
	input     	[`YSYX210295_BUS_ADDR_MEM]		awaddr_mem		,
	input     	[`YSYX210295_BUS_AXI_LEN] 		awlen_mem		,
	input     	[`YSYX210295_BUS_AXI_SIZE] 	awsize_mem		,
	input     	[`YSYX210295_BUS_AXI_BURST]	awburst_mem		,
//	input    	[`YSYX210295_BUS_AXI_CACHE]	awcache_mem		,
//	input    						awprot_mem		,
//	input    						awqos_mem		,
//	input    						awregion_mem	,
	output reg	      				wready_mem		,
	input     	      				wvalid_mem		,
	input     	[`YSYX210295_BUS_DATA_MEM]		wdata_mem		,
	input     	[`YSYX210295_BUS_AXI_STRB] 	wstrb_mem		,
	input     	      				wlast_mem		,
	//output reg	[`YSYX210295_BUS_AXI_BID]		bid_mem			,
	//output reg	[`YSYX210295_BUS_AXI_RESP]		bresp_mem		,
	output reg						bvalid_mem		,
	input    						bready_mem		,
	output reg	      				arready_mem		,
	input     	      				arvalid_mem		,
	input    	[`YSYX210295_BUS_AXI_ARID]		arid_mem		,
	input     	[`YSYX210295_BUS_ADDR_MEM]		araddr_mem		,
	input     	[`YSYX210295_BUS_AXI_LEN] 		arlen_mem		,
	input     	[`YSYX210295_BUS_AXI_SIZE] 	arsize_mem		,
	input     	[`YSYX210295_BUS_AXI_BURST]	arburst_mem		,
//	input    	[`YSYX210295_BUS_AXI_CACHE]	arcache_mem		,
//	input    						arprot_mem		,
//	input    						arqos_mem		,
//	input    						arregion_mem	,
//	output reg	[`YSYX210295_BUS_AXI_RID] 		rid_mem			,
	output reg	[`YSYX210295_BUS_DATA_MEM]		rdata_mem		,
//	output reg	[`YSYX210295_BUS_AXI_RESP]		rresp_mem		,
//	output reg	      				rlast_mem		,
	output reg						rvalid_mem 		,
	input    						rready_mem 		,





	//axi out
	input	      					awready_axi		,
	output	reg 	      			awvalid_axi		,
	output	reg	[`YSYX210295_BUS_AXI_AWID]		awid_axi 		,
	output	reg	[`YSYX210295_BUS_ADDR_MEM]		awaddr_axi		,
	output	reg	[`YSYX210295_BUS_AXI_LEN] 		awlen_axi		,
	output	reg	[`YSYX210295_BUS_AXI_SIZE] 	awsize_axi		,
	output	reg	[`YSYX210295_BUS_AXI_BURST]	awburst_axi		,
//	output	reg	[`YSYX210295_BUS_AXI_CACHE]	awcache_axi		,
//	output	reg						awprot_axi		,
//	output	reg						awqos_axi		,
//	output	reg						awregion_axi	,
	input	      					wready_axi		,
	output	reg	      				wvalid_axi		,
	output	reg	[`YSYX210295_BUS_DATA_MEM]		wdata_axi		,
	output	reg	[`YSYX210295_BUS_AXI_STRB] 	wstrb_axi		,
	output	reg	      				wlast_axi		,
//	input	[`YSYX210295_BUS_AXI_BID]			bid_axi			,
//	input	[`YSYX210295_BUS_AXI_RESP]			bresp_axi		,
	input							bvalid_axi		,
	output	reg						bready_axi		,
	input	      					arready_axi		,
	output	reg	      				arvalid_axi		,
	output	reg	[`YSYX210295_BUS_AXI_ARID]		arid_axi		,
	output	reg	[`YSYX210295_BUS_ADDR_MEM]		araddr_axi		,
	//output	wire	[`YSYX210295_BUS_ADDR_MEM]		araddr_axi		,
	output	reg	[`YSYX210295_BUS_AXI_LEN] 		arlen_axi		,
	output	reg	[`YSYX210295_BUS_AXI_SIZE] 	arsize_axi		,
	output	reg	[`YSYX210295_BUS_AXI_BURST]	arburst_axi		,
//	output	reg	[`YSYX210295_BUS_AXI_CACHE]	arcache_axi		,
//	output	reg						arprot_axi		,
//	output	reg						arqos_axi		,
//	output	reg						arregion_axi	,
//	input	[`YSYX210295_BUS_AXI_RID] 			rid_axi			,
	input	[`YSYX210295_BUS_DATA_MEM]			rdata_axi		,
//	input	[`YSYX210295_BUS_AXI_RESP]			rresp_axi		,
	input	      					rlast_axi		,
	input							rvalid_axi 		,
	output	reg						rready_axi 		,

	input	      					awready_timer	,
	output	reg 	      			awvalid_timer	,
//	output	reg	[`YSYX210295_BUS_AXI_AWID]		awid_timer 		,
	output	reg	[`YSYX210295_BUS_ADDR_MEM]		awaddr_timer	,
//	output	reg	[`YSYX210295_BUS_AXI_LEN] 		awlen_timer		,
//	output	reg	[`YSYX210295_BUS_AXI_SIZE] 	awsize_timer	,
//	output	reg	[`YSYX210295_BUS_AXI_BURST]	awburst_timer	,
//	output	reg	[`YSYX210295_BUS_AXI_CACHE]	awcache_timer	,
//	output	reg						awprot_timer	,
//	output	reg						awqos_timer		,
//	output	reg						awregion_timer	,
	input	      					wready_timer	,
	output	reg	      				wvalid_timer	,
	output	reg	[`YSYX210295_BUS_DATA_MEM]		wdata_timer		,
//	output	reg	[`YSYX210295_BUS_AXI_STRB] 	wstrb_timer		,
//	output	reg	      				wlast_timer		,
//	input	[`YSYX210295_BUS_AXI_BID]			bid_timer		,
//	input	[`YSYX210295_BUS_AXI_RESP]			bresp_timer		,
	input							bvalid_timer	,
	output	reg						bready_timer	,
	input	      					arready_timer	,
	output	reg	      				arvalid_timer	,
//	output	reg	[`YSYX210295_BUS_AXI_ARID]		arid_timer		,
	output	reg	[`YSYX210295_BUS_ADDR_MEM]		araddr_timer	,
//	output	reg	[`YSYX210295_BUS_AXI_LEN] 		arlen_timer		,
//	output	reg	[`YSYX210295_BUS_AXI_SIZE] 	arsize_timer	,
//	output	reg	[`YSYX210295_BUS_AXI_BURST]	arburst_timer	,
//	output	reg	[`YSYX210295_BUS_AXI_CACHE]	arcache_timer	,
//	output	reg						arprot_timer	,
//	output	reg						arqos_timer		,
//	output	reg						arregion_timer	,
//	input	[`YSYX210295_BUS_AXI_RID] 			rid_timer		,
	input	[`YSYX210295_BUS_DATA_MEM]			rdata_timer		,
//	input	[`YSYX210295_BUS_AXI_RESP]			rresp_timer		,
//	input	      					rlast_timer		,
	input							rvalid_timer 	,
	output	reg						rready_timer 	

);

    wire timer_cs_ar;
	wire timer_cs_aw;
	reg timer_cs_r;
	//reg timer_cs_w;
	wire timer_cs_w; //1017

	assign timer_cs_ar = (araddr_mem >= `YSYX210295_ADDR_TIMER_MIN) & (araddr_mem <= `YSYX210295_ADDR_TIMER_MAX);
	assign timer_cs_aw = (awaddr_mem >= `YSYX210295_ADDR_TIMER_MIN) & (awaddr_mem <= `YSYX210295_ADDR_TIMER_MAX);

    wire rvalid;
	assign rvalid = rvalid_timer ||  rvalid_axi; 

//	reg	[`YSYX210295_BUS_AXI_RID] 		rid_if	;
//	reg	[`YSYX210295_BUS_AXI_RESP]		rresp_if ;


// read request
    //wire rvalid_axi_pos;
	wire rvalid_axi_neg;
	reg rvalid_axi_reg;
	always @ ( posedge clock) begin
      if( reset )
        rvalid_axi_reg <= 0;
      else
        rvalid_axi_reg <= rvalid_axi ; 
	end

    //assign rvalid_axi_pos = rvalid_axi && ( ~rvalid_axi_reg );  
	assign rvalid_axi_neg = rvalid_axi_reg && ( ~rvalid_axi );  

    reg [1:0] r_state;
    parameter [1:0] R_STATE_IDLE = 2'b00,  R_STATE_READ  = 2'b10, R_STATE_END  = 2'b11;
	wire r_state_read  = r_state == R_STATE_READ, r_state_end  = r_state == R_STATE_END;
      // Read State Machine
	  /*
    always @(posedge clock) begin
        if (reset) begin
            r_state <= R_STATE_IDLE;
        end
        else begin
                case (r_state)
                    R_STATE_IDLE:                                   r_state <= R_STATE_ADDR;
                   // R_STATE_ADDR: if (arvalid_mem || arvalid_if)    r_state <= R_STATE_READ;
				    R_STATE_ADDR: if ((arvalid_mem || arvalid_if)& arready_axi)    r_state <= R_STATE_READ;  //1007
                    R_STATE_READ: if (rvalid)                   if(arlen_axi == 0) begin r_state <= R_STATE_IDLE; end
					                                                else               begin r_state <= R_STATE_END;  end
					R_STATE_END:  if (rvalid_axi_neg)               r_state <= R_STATE_IDLE;
                    default:;
                endcase
        end
    end

	assign axi_rbusy = (reset) ? 0 : r_state_read | r_state_end | r_state_idle;
*/

	reg  timer_cs_ar_reg;
	always@(posedge clock) begin
	   if(reset) begin
			   timer_cs_ar_reg <= 0;
	   end    
	   else begin
               timer_cs_ar_reg <= timer_cs_ar ;
	   end
 	end
        wire timer_cs_ar_pos;
	assign timer_cs_ar_pos = (~timer_cs_ar_reg) && ( timer_cs_ar );   //by ou 1013
	
reg [1:0] st;
always@(posedge clock) begin
	if(reset) begin
		st <= 0;
	end    
	else begin
		case(st)
			2'b00: if(timer_cs_ar_pos) begin
						if(arready_timer)  st<=2'b10;
						else	st<=2'b01;
					end
					else               st<=2'b00;
			2'b01:if(arready_timer)   st<=2'b10;
					else                st<=2'b01;
			2'b10:if(rvalid_timer)    st<=2'b00;
				else                st<=2'b10;
			default:                  st<=2'b00;
			endcase
	end
end

wire timer_valid;
assign timer_valid = (st == 2'b01)|| timer_cs_ar_pos;

    always @(posedge clock) begin  //1007
        if (reset) begin
            r_state <= R_STATE_IDLE;
        end
        else begin
                case (r_state)
				   // R_STATE_IDLE: if ((arvalid_mem || arvalid_if)& (arready_axi || arready_timer))    r_state <= R_STATE_READ; //1015
				   // R_STATE_IDLE: if ((arvalid_mem || arvalid_if)& ((arready_axi & !timer_cs_ar) | (arready_timer &timer_cs_ar)))    r_state <= R_STATE_READ; //1015
				      R_STATE_IDLE: if ((arvalid_mem || arvalid_if)& ((arready_axi & !timer_valid) | (arready_timer &timer_valid)))    r_state <= R_STATE_READ; //1015
				    //R_STATE_IDLE: if ((arvalid_mem || arvalid_if)& arready_axi)    r_state <= R_STATE_READ;  
					//R_STATE_IDLE: if ((arvalid_mem || arvalid_if))    r_state <= R_STATE_READ; 
					              else                                             r_state <= R_STATE_IDLE; 
                    R_STATE_READ: if (rvalid)             if(arlen_axi == 0) begin r_state <= R_STATE_IDLE; end
					                                      else               begin r_state <= R_STATE_END;  end
								  else                                             r_state <= R_STATE_READ;
					R_STATE_END:  if (rvalid_axi_neg)				               r_state <= R_STATE_IDLE;
					              else                                             r_state <= R_STATE_END; 
                    default:;
                endcase
        end
    end

	assign axi_rbusy = (reset) ? 0 : r_state_read | r_state_end;

    always@(posedge clock) begin
		if(reset) begin
			timer_cs_r <= 1'b0;
		end
		else begin
			if(axi_rbusy == 1'b1) begin
			//	if((awvalid_mem == `YSYX210295_AXI_VALID_EN) & (awready_axi == `YSYX210295_AXI_READY_EN)) begin
				if((arvalid_mem == `YSYX210295_AXI_VALID_EN) | (arvalid_if == `YSYX210295_AXI_READY_EN)) begin   // by ou
					timer_cs_r <= timer_cs_ar;
				end
				else begin
					timer_cs_r <= timer_cs_r;
				end
			end
			else begin
				if(axi_rbusy == 1'b0) begin
					timer_cs_r <= 1'b0;
				end
				else begin
					timer_cs_r <= timer_cs_r;
				end
			end
		end
	end


    always@(*) begin
		if(axi_rbusy == `YSYX210295_AXI_IDLE) begin
			if(arvalid_mem == `YSYX210295_AXI_VALID_EN) begin
				if(timer_cs_ar) begin
				//	arready_mem = (reset==0) ?`YSYX210295_AXI_READY_EN : `YSYX210295_AXI_READY_DIS;
					arready_mem = arready_timer;
					arready_if =  `YSYX210295_AXI_READY_DIS;

					arvalid_axi = `YSYX210295_AXI_VALID_DIS;
					arid_axi = `YSYX210295_AXI_ID_ZERO;
					araddr_axi = araddr_mem;
					//araddr_axi = araddr_mem; //1015
					arlen_axi = `YSYX210295_AXI_LEN_ZERO;
					arsize_axi = `YSYX210295_AXI_SIZE_DOUBLE;
					arburst_axi = `YSYX210295_AXI_BURST_INCR;

					arvalid_timer = arvalid_mem;
					araddr_timer = araddr_mem;
				end
				else begin
				//	arready_mem = (reset==0) ?`YSYX210295_AXI_READY_EN : `YSYX210295_AXI_READY_DIS;
					arready_mem = arready_axi;//1007
					arready_if =  `YSYX210295_AXI_READY_DIS;

					arvalid_axi = arvalid_mem;
					arid_axi = arid_mem;
					araddr_axi = araddr_mem; //1007
					//araddr_axi = (arready_axi)? araddr_mem : `YSYX210295_MEM_ADDR_ZERO;  
					arlen_axi = arlen_mem;
					arsize_axi = arsize_mem;
					//arsize_axi =(arready_axi)? arsize_mem : 3'b000; 
					arburst_axi = arburst_mem;

					arvalid_timer = `YSYX210295_AXI_VALID_DIS;
					araddr_timer = `YSYX210295_MEM_ADDR_ZERO;
				end
			end
			else begin
				if(arvalid_if == `YSYX210295_AXI_VALID_EN) begin
				//	arready_if =  (reset==0) ? `YSYX210295_AXI_READY_EN : `YSYX210295_AXI_READY_DIS;
					arready_if =  arready_axi;  //1007
				//	arready_mem = (reset==0) ?`YSYX210295_AXI_READY_EN : `YSYX210295_AXI_READY_DIS;
				//	arready_mem = arready_axi;//1007
					arready_mem =  `YSYX210295_AXI_READY_DIS;//1013
					arvalid_axi = arvalid_if;
					arid_axi = arid_if;
					//araddr_axi = araddr_if; 1007
					//araddr_axi = (arready_axi)? araddr_if : `YSYX210295_MEM_ADDR_ZERO;   
					araddr_axi = araddr_if; //1013
					arlen_axi = arlen_if;
					arsize_axi = arsize_if;
					arburst_axi = arburst_if;

					arvalid_timer = `YSYX210295_AXI_VALID_DIS;
					araddr_timer = `YSYX210295_MEM_ADDR_ZERO;
				end
				else begin
				//	arready_if =  (reset==0) ? `YSYX210295_AXI_READY_EN : `YSYX210295_AXI_READY_DIS;
					arready_if =  arready_axi;  //1007
				//	arready_mem = (reset==0) ?`YSYX210295_AXI_READY_EN : `YSYX210295_AXI_READY_DIS;
				//	arready_mem = arready_axi;//1007
					arready_mem =  `YSYX210295_AXI_READY_DIS;//1013

					arvalid_axi = `YSYX210295_AXI_VALID_DIS;
					arid_axi = `YSYX210295_AXI_ID_ZERO;
					//araddr_axi = `YSYX210295_MEM_ADDR_ZERO;//1015
					araddr_axi = araddr_if; //1015
					arlen_axi = `YSYX210295_AXI_LEN_ZERO;
					arsize_axi = `YSYX210295_AXI_SIZE_DOUBLE;
					arburst_axi = `YSYX210295_AXI_BURST_FIX;

					arvalid_timer = `YSYX210295_AXI_VALID_DIS;
					araddr_timer = `YSYX210295_MEM_ADDR_ZERO;
				end
			end
		end
		else begin
			arready_if = `YSYX210295_AXI_READY_DIS;
			arready_mem = `YSYX210295_AXI_READY_DIS;

			arvalid_axi = `YSYX210295_AXI_VALID_DIS;
			arid_axi = `YSYX210295_AXI_ID_ZERO;
			araddr_axi = araddr_if;// 1015
			arlen_axi = `YSYX210295_AXI_LEN_ZERO;
			arsize_axi = `YSYX210295_AXI_SIZE_DOUBLE;
			arburst_axi = `YSYX210295_AXI_BURST_FIX;

			arvalid_timer = `YSYX210295_AXI_VALID_DIS;
			araddr_timer = `YSYX210295_MEM_ADDR_ZERO;
		end
	end
    
	
	//assign araddr_axi = (arvalid_mem) ? araddr_mem : ((arvalid_if) ? araddr_if : `YSYX210295_MEM_ADDR_ZERO);
    
	reg [`YSYX210295_BUS_DATA_MEM] rdata_if_t;
	reg [`YSYX210295_BUS_DATA_MEM] rdata_mem_t;

	always@(posedge clock) begin
		if(reset) begin
			rdata_if_t <= `YSYX210295_ZERO_DOUBLE;
		end
		else begin
			rdata_if_t <= rdata_if;
		end
	end		
	always@(posedge clock) begin
		if(reset) begin
			rdata_mem_t <= `YSYX210295_ZERO_DOUBLE;
		end
		else begin
			rdata_mem_t <= rdata_mem;
		end
	end	

	always@(*) begin
		if(axi_rbusy == `YSYX210295_AXI_BUSY) begin
		    if(rready_mem == `YSYX210295_AXI_VALID_EN) begin	
				if(timer_cs_r) begin
				//	rid_mem = 0;
					rdata_mem = rdata_timer;
				//	rresp_mem = 0;
				//	rlast_mem = 0;
					rvalid_mem = rvalid_timer;

					//rid_if = `YSYX210295_AXI_ID_ZERO;
					rdata_if = rdata_if_t;
					//rresp_if = 2'd0;
					rlast_if = `YSYX210295_AXI_VALID_DIS;
				//	rvalid_if = `YSYX210295_AXI_VALID_EN;
				    rvalid_if = `YSYX210295_AXI_VALID_DIS;//1007

					rready_axi = `YSYX210295_AXI_READY_DIS;
					rready_timer = rready_mem;
				end
				else begin
				//	rid_mem = rid_axi;
					rdata_mem = rdata_axi;
				//	rresp_mem = rresp_axi;
				//	rlast_mem = rlast_axi;
					rvalid_mem = rvalid_axi;

				//	rid_if = `YSYX210295_AXI_ID_ZERO;
					rdata_if = rdata_if_t;
				//	rresp_if = 2'd0;
					rlast_if = `YSYX210295_AXI_VALID_DIS;

				//	rvalid_if = `YSYX210295_AXI_VALID_EN;
				    rvalid_if = `YSYX210295_AXI_VALID_DIS;//1007

					rready_axi = rready_mem;
					rready_timer = `YSYX210295_AXI_READY_DIS;
				end
			end
			else begin
				if(rready_if == `YSYX210295_AXI_VALID_EN) begin
				//	rid_mem = `YSYX210295_AXI_ID_ZERO;
					rdata_mem = `YSYX210295_ZERO_DOUBLE;
				//	rresp_mem = 2'd0;
				//	rlast_mem = `YSYX210295_AXI_VALID_DIS;
					rvalid_mem = `YSYX210295_AXI_VALID_DIS;

				//	rid_if = rid_axi;
					rdata_if = rdata_axi;
				//	rresp_if = rresp_axi;
					rlast_if = rlast_axi;
					
					rvalid_if = rvalid_axi;

					rready_axi = rready_if;
					rready_timer = `YSYX210295_AXI_READY_DIS;
				end
				
				else begin
				//	rid_mem = `YSYX210295_AXI_ID_ZERO;
					rdata_mem = `YSYX210295_ZERO_DOUBLE;
				//	rresp_mem = 2'd0;
				//	rlast_mem = `YSYX210295_AXI_VALID_DIS;
					rvalid_mem = `YSYX210295_AXI_VALID_DIS;

				//	rid_if = `YSYX210295_AXI_ID_ZERO;
				//	rdata_if = `YSYX210295_ZERO_DOUBLE;
					rdata_if = rdata_if_t; //1008
				//	rresp_if = 2'd0;
					rlast_if = `YSYX210295_AXI_VALID_DIS;

				//	rvalid_if = `YSYX210295_AXI_VALID_EN;
				    rvalid_if = `YSYX210295_AXI_VALID_DIS;//1007

					rready_axi = `YSYX210295_AXI_READY_DIS;
					rready_timer = `YSYX210295_AXI_READY_DIS;
				end
				
			end
		end
		else begin
		//	rid_mem = `YSYX210295_AXI_ID_ZERO;
			rdata_mem = rdata_mem_t;
		//	rresp_mem = 2'd0;
		//	rlast_mem = `YSYX210295_AXI_VALID_DIS;
		//	rvalid_mem = `YSYX210295_AXI_VALID_EN;
			rvalid_mem = `YSYX210295_AXI_VALID_DIS;//1013

		//	rid_if = `YSYX210295_AXI_ID_ZERO;
			rdata_if = rdata_if_t;
		//	rresp_if = 2'd0;
			rlast_if = `YSYX210295_AXI_VALID_DIS;

			//	rvalid_if = `YSYX210295_AXI_VALID_EN;
			rvalid_if = `YSYX210295_AXI_VALID_DIS;//1007

			rready_axi = `YSYX210295_AXI_READY_DIS;
			rready_timer = `YSYX210295_AXI_READY_DIS;  // add by ou
		end
	end



    reg [1:0] w_state;
	parameter [1:0] W_STATE_IDLE = 2'b00, W_STATE_ADDR = 2'b01, W_STATE_WRITE = 2'b10;
	wire w_state_idle = w_state == W_STATE_IDLE,  w_state_write = w_state == W_STATE_WRITE;

    always @(posedge clock) begin
        if (reset) begin
            w_state <= W_STATE_IDLE;
        end
        else begin
            //if (w_valid) begin
                case (w_state)
                    W_STATE_IDLE:                                        w_state <= W_STATE_ADDR;
                    W_STATE_ADDR:  if (awvalid_mem & ((awready_axi & !timer_cs_aw) | (awready_timer &timer_cs_aw)))        w_state <= W_STATE_WRITE;
                    W_STATE_WRITE: if ((bvalid_axi & ! timer_cs_w) | (bvalid_timer & timer_cs_w))                       w_state <= W_STATE_IDLE;
                   default       :;
                endcase
            end
        
    end
    
	wire axi_wbusy;
	assign axi_wbusy = (reset)? 0 : ( w_state_write || w_state_idle ) ;
	
	assign timer_cs_w = axi_wbusy & timer_cs_aw;
/*
	always@(posedge clock) begin
		if(reset) begin
			timer_cs_w <= 1'b0;
		end
		else begin
			 if (axi_wbusy == 1'b1) begin
			//	if((awvalid_mem == `YSYX210295_AXI_VALID_EN) & (awready_axi == `YSYX210295_AXI_READY_EN)) begin
					timer_cs_w <= timer_cs_aw;
				end
			else begin
				if(axi_wbusy == 1'b0) begin
					timer_cs_w <= 1'b0;
				end
				else begin
					timer_cs_w <= timer_cs_w;
				end
			end
		end
	end
*/
	reg [`YSYX210295_BUS_ADDR_MEM]    awaddr_axi_t;
	always@(posedge clock) begin
		if(reset)   awaddr_axi_t <= 0 ;
		else         awaddr_axi_t <= awaddr_axi ;
	end

	
	/*
	assign awready_if = `YSYX210295_AXI_READY_DIS;
	assign wready_if = `YSYX210295_AXI_READY_DIS;
	assign bid_if = `YSYX210295_AXI_ID_ZERO;	
	assign bresp_if = {1'b0,`YSYX210295_AXI_VALID_DIS};
	assign bvalid_if = `YSYX210295_AXI_VALID_DIS;
*/
	always@(*) begin
		if(axi_wbusy == `YSYX210295_AXI_IDLE) begin
		  if(awvalid_mem == `YSYX210295_AXI_VALID_EN) begin 
			  if(timer_cs_aw) begin
				//awready_mem =   (reset==0) ? `YSYX210295_AXI_READY_EN : `YSYX210295_AXI_READY_DIS;
                //awready_mem =  `YSYX210295_AXI_READY_DIS; //1007
				awready_mem =  awready_timer;
				awvalid_axi = `YSYX210295_AXI_VALID_DIS;
				awid_axi = `YSYX210295_AXI_ID_ZERO;
				awaddr_axi = awaddr_axi_t; //by ou
				awlen_axi = awlen_mem;
				awsize_axi = awsize_mem;
				awburst_axi = awburst_mem;

				awvalid_timer = awvalid_mem;
                awaddr_timer = awaddr_mem;
			  end
			  else begin
				//awready_mem =   (reset==0) ? `YSYX210295_AXI_READY_EN : `YSYX210295_AXI_READY_DIS;
                awready_mem = awready_axi;//1007
				awvalid_axi = awvalid_mem;
				awid_axi = awid_mem;
				awaddr_axi = awaddr_mem;
				awlen_axi = awlen_mem;
				awsize_axi = awsize_mem;
				awburst_axi = awburst_mem;

				awvalid_timer = `YSYX210295_AXI_VALID_DIS;
				awaddr_timer = `YSYX210295_MEM_ADDR_ZERO;
			  end
			end
		  else begin
            //awready_mem =   (reset==0) ? `YSYX210295_AXI_READY_EN : `YSYX210295_AXI_READY_DIS;
			awready_mem = `YSYX210295_AXI_READY_DIS;//1007
			awvalid_axi = `YSYX210295_AXI_VALID_DIS;
			awid_axi = `YSYX210295_AXI_ID_ZERO;
			awaddr_axi = awaddr_axi_t;  //by ou
			awlen_axi = awlen_mem;
			awsize_axi = awsize_mem;
			awburst_axi = awburst_mem;

			awvalid_timer = `YSYX210295_AXI_VALID_DIS;
			awaddr_timer = `YSYX210295_MEM_ADDR_ZERO;
		    end
		end
		else begin
			awready_mem = `YSYX210295_AXI_READY_DIS;//1007

			awvalid_axi = `YSYX210295_AXI_VALID_DIS;
			awid_axi = `YSYX210295_AXI_ID_ZERO;
			awaddr_axi = awaddr_axi_t; //by ou
			awlen_axi = awlen_mem;
			awsize_axi = awsize_mem;
			awburst_axi = awburst_mem;

			awvalid_timer = `YSYX210295_AXI_VALID_DIS;
			awaddr_timer = `YSYX210295_MEM_ADDR_ZERO;
		end
	end


	always@(*) begin
		if(axi_wbusy == `YSYX210295_AXI_BUSY) begin
			if(timer_cs_w) begin
				wready_mem = wready_timer;

				wvalid_timer = wvalid_mem;
				wdata_timer = wdata_mem;

				wvalid_axi = `YSYX210295_AXI_VALID_DIS;
				wdata_axi = `YSYX210295_ZERO_DOUBLE;
				wstrb_axi = `YSYX210295_WR_STR_NONE;
				wlast_axi = `YSYX210295_AXI_VALID_DIS;

			//	bid_mem = 0;
			//	bresp_mem = 0;
				bvalid_mem = bvalid_timer;
				bready_timer = bready_mem;
				bready_axi = `YSYX210295_AXI_READY_DIS;
			end
			else begin
				wready_mem = wready_axi;
				wvalid_timer = `YSYX210295_AXI_VALID_DIS;
				wdata_timer = `YSYX210295_ZERO_DOUBLE;

				wvalid_axi = wvalid_mem;
				wdata_axi = wdata_mem;
				wstrb_axi = wstrb_mem;
				wlast_axi = wlast_mem;

			//	bid_mem = bid_axi;
			//	bresp_mem = bresp_axi;
				bvalid_mem = bvalid_axi;
				bready_axi = bready_mem;
				bready_timer = `YSYX210295_AXI_READY_DIS;
			end
		end
		else begin
			wready_mem = `YSYX210295_AXI_READY_DIS;
			wvalid_timer = `YSYX210295_AXI_VALID_DIS;
			wdata_timer = `YSYX210295_ZERO_DOUBLE;

			wvalid_axi = `YSYX210295_AXI_VALID_DIS;
			wdata_axi = `YSYX210295_ZERO_DOUBLE;
			wstrb_axi = `YSYX210295_WR_STR_NONE;
			//wlast_axi = wlast_mem;
			wlast_axi = `YSYX210295_AXI_VALID_DIS; //1015

		//	bid_mem = `YSYX210295_AXI_ID_ZERO;
		//	bresp_mem = {1'b0,`YSYX210295_AXI_VALID_DIS};
			bvalid_mem = `YSYX210295_AXI_VALID_DIS;
			//bready_axi = `YSYX210295_AXI_READY_DIS;
			bready_axi = `YSYX210295_AXI_READY_EN;
			bready_timer = `YSYX210295_AXI_READY_DIS;
		end
	end


	

endmodule




//ECNURVCORE
//Pipeline CPU
//Created by Chesed
//2021.08.02
//Edited in 2021.08.04


/*
module ysyx_210295_btb_ctrl(
	input						clock				,
	input						reset				,


	input	[`YSYX210295_BUS_HOLD_CODE]	hold_code			,
	
	input	[`YSYX210295_BUS_ADDR_MEM]		pc_i				,
	input	[`YSYX210295_BUS_ADDR_MEM]		pc_jmp_i			,
	input	[`YSYX210295_BUS_ADDR_MEM]		target_pc_i			,
	input						jmp_en_i			,
	
	
	output						jmp_prediction_o	,
	output	[`YSYX210295_BUS_ADDR_MEM]		target_pc_o			,
	output						prediction_error_o
);

	reg [`YSYX210295_BUS_ADDR_MEM] pc_buffer;
	reg [`YSYX210295_BUS_ADDR_MEM] target_buffer;

	reg jmp_prediction_t;
	reg pc_match_t;
	reg [`YSYX210295_BUS_ADDR_MEM] target_prediction_t;

	reg [`YSYX210295_BUS_PRE_STATE] prediction_state;

	wire jmp_en_error;
	wire jmp_target_error;

	wire prediction_error;

	wire pc_match;

	assign pc_match =  ((pc_i == pc_buffer) && (pc_i != `YSYX210295_MEM_ADDR_ZERO)) ? `YSYX210295_PC_MATCH : `YSYX210295_PC_MISMATCH;

	assign target_pc_o = (jmp_prediction_o == `YSYX210295_JMP_EN) ? target_buffer : `YSYX210295_MEM_ADDR_ZERO;
	assign jmp_prediction_o = (pc_match == `YSYX210295_PC_MATCH) ? prediction_state[1] : `YSYX210295_JMP_DIS;

	//assign jmp_en_error = (jmp_en_i == jmp_prediction_t) ? `YSYX210295_JMP_RIGHT : `YSYX210295_JMP_ERROR;
	//assign jmp_target_error = (target_pc_i == target_prediction_t) ? `YSYX210295_JMP_RIGHT : `YSYX210295_JMP_ERROR;
	assign prediction_error = jmp_en_error | jmp_target_error;
	assign prediction_error_o = prediction_error;

	//by lee

	reg [`YSYX210295_BUS_HOLD_CODE] hold_code_t;
	reg 					jmp_en_r;
	reg	[`YSYX210295_BUS_ADDR_MEM]		target_pc_r;
	
	assign jmp_en_error = (jmp_en_r == jmp_prediction_t) ? `YSYX210295_JMP_RIGHT : `YSYX210295_JMP_ERROR;
	assign jmp_target_error = (target_pc_r == target_prediction_t) ? `YSYX210295_JMP_RIGHT : `YSYX210295_JMP_ERROR;

	
	always@(posedge clock) begin
		if(reset) begin
			jmp_en_r <= `YSYX210295_JMP_DIS;
			target_pc_r <= `YSYX210295_MEM_ADDR_ZERO;
		end
		else begin
			if(hold_code == `YSYX210295_HOLD_CODE_NOPE) begin
				jmp_en_r <= jmp_en_i;
				target_pc_r <= target_pc_i;
			end
			else begin
				jmp_en_r <= jmp_en_r;
				target_pc_r <= target_pc_r;
			end
		end
	end
	//btb fix

	always@(posedge clock) begin
		if(reset) begin
			hold_code_t <= `YSYX210295_HOLD_CODE_NOPE;
		end
		else begin
			hold_code_t <= hold_code;
		end
	end

	always@(posedge clock) begin
		if(reset) begin
			pc_buffer <= `YSYX210295_MEM_ADDR_ZERO;
			target_buffer <= `YSYX210295_MEM_ADDR_ZERO;
			prediction_state <= `YSYX210295_STATE_S_HOLD;
		end
		else begin
			if(hold_code_t == `YSYX210295_HOLD_CODE_NOPE) begin
				if(prediction_error == `YSYX210295_JMP_ERROR) begin
					pc_buffer <= (jmp_en_i == `YSYX210295_JMP_EN) ? pc_jmp_i : `YSYX210295_MEM_ADDR_ZERO;
					target_buffer <= (jmp_en_i == `YSYX210295_JMP_EN) ? target_pc_i : `YSYX210295_MEM_ADDR_ZERO;
					prediction_state <= (jmp_en_i == `YSYX210295_JMP_DIS) ? (prediction_state - 2'b01) : ((pc_match_t == `YSYX210295_PC_MATCH) ? (prediction_state + 2'b01) : `YSYX210295_STATE_W_HOLD);
				end
				else begin
					pc_buffer <= pc_buffer;
					target_buffer <= target_buffer;
					prediction_state <= (jmp_en_i == `YSYX210295_JMP_EN) ? `YSYX210295_STATE_S_JMP : ((pc_match_t == `YSYX210295_PC_MATCH) ? `YSYX210295_STATE_S_HOLD : prediction_state);
				end
			end
			else begin
					pc_buffer <= pc_buffer;
					target_buffer <= target_buffer;
					prediction_state <= prediction_state;		
			end
		end
	end


	always@(posedge clock) begin
		if(reset) begin
			jmp_prediction_t <= `YSYX210295_JMP_DIS;
			target_prediction_t <= `YSYX210295_MEM_ADDR_ZERO;
			pc_match_t <= `YSYX210295_PC_MISMATCH;
		end
		else begin
			if(hold_code == `YSYX210295_HOLD_CODE_NOPE) begin
				jmp_prediction_t <= jmp_prediction_o;
				target_prediction_t <= target_pc_o;
				pc_match_t <= pc_match;
			end
			else begin
				jmp_prediction_t <= jmp_prediction_t;
				target_prediction_t <= target_prediction_t;
				pc_match_t <= pc_match_t;
			end
		end
	end


endmodule
*/


module ysyx_210295_clint
(
	input							clock,
	input							reset,
	input             				hold_n,
	input                           jmp_en,// by ou
	
	// from if
	input							except_src_if		,
	input	[`YSYX210295_BUS_EXCEPT_CAUSE]		except_cus_if		,
	
	// from id
	input							except_src_id,
	input	[`YSYX210295_BUS_EXCEPT_CAUSE]		except_cus_id,
//	input	[`YSYX210295_BUS_DATA_INSTR]		instr_id_i,
	input	[`YSYX210295_BUS_ADDR_MEM]			addr_instr_id_i,
	
	// from ex
	input							except_src_ex,
	input	[`YSYX210295_BUS_EXCEPT_CAUSE]		except_cus_ex,
//	input							jump_flag_i,
//	input	[`InstAddrBus] 			jump_addr_i,
//	input							div_started_i,
	
	input							tmr_irq_i,
	input							ext_irq_i,
	
	// to ctrl
//	output 							wire hold_flag_o,
	output							irq_assert_o,
	output  wire				  except_async_o,
	output	reg	[`YSYX210295_BUS_ADDR_MEM]		irq_addr_o,
	
	// from/to csr_reg
	output	reg						csr_we_o,
	output	reg	[`YSYX210295_BUS_CSR_IMM]		csr_addr_o,
//	input		[`YSYX210295_BUS_DATA_REG]		csr_data_i,
	output	reg	[`YSYX210295_BUS_DATA_REG] 	csr_data_o,

	input		[`YSYX210295_BUS_DATA_REG]		csr_mstatus,
	input		[`YSYX210295_BUS_DATA_REG]		csr_mie,
	input		[`YSYX210295_BUS_DATA_REG]		csr_mtvec,  
	input		[`YSYX210295_BUS_DATA_REG]		csr_mepc
);


	localparam S_IDLE            = 5'b00001;
	localparam S_MSTATUS         = 5'b00010;
	localparam S_MEPC            = 5'b00100;
	localparam S_MSTATUS_MRET    = 5'b01000;
	localparam S_MCAUSE          = 5'b10000;

	reg		[4:0]				cur_csr_state;
	reg		[4:0]				nxt_csr_state;
	reg		[`YSYX210295_BUS_DATA_REG]	          mcause_data_reg;
	wire	[`YSYX210295_BUS_DATA_REG]	  		  mcause_data;

	wire 						except_src_assert;
	wire						mret_assert;
	wire						except_sync,except_mret;
	wire                        except_async;
	
	wire	[`YSYX210295_BUS_EXCEPT_CAUSE]	except_cus;
	wire	[`YSYX210295_BUS_EXCEPT_CAUSE]	irq_cus;

        wire 						glb_irq_en;
	wire 						tmr_irq_en;
	//wire 						sft_irq_en;
	wire 						ext_irq_en;

	reg [`YSYX210295_BUS_ADDR_MEM]		irq_addr_o_t;

	wire jmp;
	reg irq_hold;

	assign jmp = ((jmp_en & hold_n) | except_mret) & (~except_async);  // by ou
	//assign except_async_o =  except_async & ~irq_hold; //1016

	assign except_async_o =  except_async;


    reg [1:0] st_irq;
	
	always@(posedge clock) begin
		if(reset)  begin irq_hold<=0; st_irq<=2'b00; end  //by tyc
		else begin
			case(st_irq)
			2'b00:  begin
				          if(jmp) begin   irq_hold<=1; st_irq<=2'b01;  end
						  else    begin   irq_hold<=0; st_irq<=st_irq; end
			end
			2'b01:  begin
				           irq_hold<=irq_hold; 
						   st_irq<=2'b10;  
			end
			2'b10:  begin
				           irq_hold<=irq_hold; 
						   st_irq<=2'b11;  
			end
			2'b11: begin
				         if(hold_n) begin  irq_hold<=0; st_irq<=2'b00; end
						 else        begin  irq_hold<=irq_hold; st_irq<=st_irq; end
			end
			default: begin irq_hold<=irq_hold; st_irq<=st_irq; end
			endcase
		end
	end
	
	//assign irq_addr_o = csr_mtvec ;  // by ou
	assign glb_irq_en = csr_mstatus[3];
	assign tmr_irq_en = csr_mie[7];
    //  assign sft_irq_en = csr_mie[3];
      assign ext_irq_en = csr_mie[11];

	//the source of except
	assign except_src_assert = except_src_if | except_src_id | except_src_ex;
	assign mret_assert = except_cus_id == `YSYX210295_EXCEPT_MRET;
	
	assign except_sync  = except_src_assert & (~mret_assert);
	assign except_async = glb_irq_en & ((tmr_irq_i & tmr_irq_en) | (ext_irq_i & ext_irq_en));
	assign except_mret  = except_src_assert &   mret_assert ;

	assign irq_assert_o = except_sync | except_async | except_mret; // by ou
	//assign irq_assert_o = except_sync | (except_async ) | except_mret; 
	
	assign except_cus = except_src_if ? except_cus_if : (
						except_src_id ? except_cus_id : (
						except_src_ex ? except_cus_ex : 4'b0
						));
      assign irq_cus = (ext_irq_i & ext_irq_en) ?  4'd11: 
	                         (tmr_irq_i & tmr_irq_en) ?  4'd7  : 0 ;
	
	assign mcause_data = (except_async) ? {1'b1,59'b0,irq_cus} : 
	                                  (except_sync)   ? {1'b0, 59'b0, except_cus} : 0 ;



	always@(posedge clock) begin
		if(reset)
		   irq_addr_o_t <= 0;
		else
           irq_addr_o_t <= irq_addr_o ;
	end

	always @(posedge clock) begin
		if (reset)
			cur_csr_state <= S_IDLE;
		else
			cur_csr_state <= nxt_csr_state;
	end

/*
wire except_async_r;
wire except_async_pos;
ysyx_210295_gnrl_dff # (.DW(1)) diff_except_async_r(
	.clock		(clock),
	.reset		(reset),
	.wr_en		(1),
	.data_in	(except_async),
	.data_r_ini	(0),

	.data_out	(except_async_r)
);
assign except_async_pos = except_async && (~except_async_r) ;
*/
    
	always @(*) begin
		//	irq_addr_o    = `YSYX210295_ZERO_DOUBLE;
			nxt_csr_state = cur_csr_state;
			case (cur_csr_state)
				S_IDLE: begin
			//		if (except_sync | except_async) begin
					//	if ( (except_sync & hold_n) | (except_async & hold_n & ~(irq_hold)) ) begin  //hold reg
					if ( (except_sync & hold_n) | (except_async & hold_n) ) begin  //1013 for rtt
						irq_addr_o    = csr_mtvec;
						nxt_csr_state = S_MEPC;
					end 
					else if (except_mret) begin
						irq_addr_o    = csr_mepc;
						nxt_csr_state = S_MSTATUS_MRET;
					end
					else begin
						irq_addr_o    = irq_addr_o_t;
						nxt_csr_state = nxt_csr_state;
					end
				end

				S_MEPC: begin
				//	irq_addr_o    = `YSYX210295_ZERO_DOUBLE;
					irq_addr_o    = irq_addr_o_t;
					nxt_csr_state = S_MCAUSE;
				end

				S_MCAUSE: begin
				//	irq_addr_o    = `YSYX210295_ZERO_DOUBLE;
					irq_addr_o    = irq_addr_o_t;
					nxt_csr_state = S_MSTATUS;
				end

				S_MSTATUS: begin
				//	irq_addr_o    = `YSYX210295_ZERO_DOUBLE;
					irq_addr_o    = irq_addr_o_t;
					nxt_csr_state = S_IDLE;
				end

				S_MSTATUS_MRET: begin
				//	irq_addr_o    = `YSYX210295_ZERO_DOUBLE;
				 	irq_addr_o    = irq_addr_o_t;
					nxt_csr_state = S_IDLE;
				end

				default: begin
				//	irq_addr_o    = `YSYX210295_ZERO_DOUBLE;
					irq_addr_o    = irq_addr_o_t;
					nxt_csr_state = S_IDLE;
				end
				
			endcase
	end

	always @(posedge clock) begin
		if (reset) begin
			csr_we_o <= `YSYX210295_WriteDisable;
			csr_addr_o <= `YSYX210295_CSR_ADDR_ZERO;
			csr_data_o <= `YSYX210295_ZERO_DOUBLE;
			mcause_data_reg <= `YSYX210295_ZERO_DOUBLE;
		end 
		else begin
			case(nxt_csr_state)

				S_MEPC: begin
					csr_we_o   <= `YSYX210295_WriteEnable;
					csr_addr_o <= `YSYX210295_CSR_MEPC;
					csr_data_o <= addr_instr_id_i;
					mcause_data_reg <= mcause_data;
				end

				S_MCAUSE: begin
					csr_we_o   <= `YSYX210295_WriteEnable;
					csr_addr_o <= `YSYX210295_CSR_MCAUSE;
					csr_data_o <= mcause_data_reg;
				end

				S_MSTATUS: begin
					csr_we_o   <= `YSYX210295_WriteEnable;
					csr_addr_o <= `YSYX210295_CSR_MSTATUS;
//					csr_data_o <= {csr_mstatus[31:4], 1'b0, csr_mstatus[2:0]};
					csr_data_o <= { csr_mstatus[63:13],  // by ou
								   2'b11,
								   csr_mstatus[10:8], 
								   csr_mstatus[3], 
								   csr_mstatus[6:4], 
								   1'b0, 
								   csr_mstatus[2:0]};  
				end

				S_MSTATUS_MRET: begin
					csr_we_o   <= `YSYX210295_WriteEnable;
					csr_addr_o <= `YSYX210295_CSR_MSTATUS;
//					csr_data_o <= {csr_mstatus[31:4], csr_mstatus[7], csr_mstatus[2:0]};
					csr_data_o <= {csr_mstatus[63:13],
								   2'b0,
								   csr_mstatus[10:8], 
								   1'b1,
								   csr_mstatus[6:4],
								   csr_mstatus[7],
								   csr_mstatus[2:0]};
				end
				
				default: begin
					csr_we_o   <= `YSYX210295_WriteDisable;
					csr_addr_o <= `YSYX210295_CSR_ADDR_ZERO;
					csr_data_o <= `YSYX210295_ZERO_DOUBLE;
				end

			endcase
		end
	end

//	always @(posedge clock) begin
//		if (reset) begin
//			irq_assert_o <= `INT_DEASSERT;
//			irq_addr_o <= `ZeroWord;
//		end 
//		else begin
//			case(cur_csr_state)
//
//				S_MCAUSE: begin
//					irq_assert_o <= `INT_ASSERT;
//					irq_addr_o <= csr_mtvec;
//				end
//
//				S_MSTATUS_MRET: begin
//					irq_assert_o <= `INT_ASSERT;
//					irq_addr_o <= csr_mepc;
//				end
//				
//				default: begin
//					irq_assert_o <= `INT_DEASSERT;
//					irq_addr_o <= `ZeroWord;
//				end
//				
//			endcase
//		end
//	end

endmodule
//ECNURVCORE
//Pipeline CPU
//Created by Chesed
//2021.07.23
//Edited in 2021.08.13

//update in 0908



module ysyx_210295_core
(
	input						clock				,
	input						reset			,

	input						stall_if		,
	input						stall_mem		,

	input	[`YSYX210295_BUS_DATA_INSTR] 	instr_i 		,
	input	[`YSYX210295_BUS_ADDR_MEM] 	addr_instr_i 	,
	input	[`YSYX210295_BUS_DATA_MEM]		data_mem_i		,

        output  [2:0]               hold_code       ,//by ou
    
        input						tmr_irq_i		,
	input 						ext_irq_i               ,
	output						mem_wr_en_o		,
	output						mem_rd_en_o		,
	output						instr_rd_en_o	,
	output	[`YSYX210295_BUS_DATA_MEM]		data_mem_wr_o	,	
	output  [`YSYX210295_BUS_AXI_STRB]     strb_mem_wr_o   ,
	output  [`YSYX210295_BUS_AXI_SIZE]     size_mem_wr_o   ,
	output	[`YSYX210295_BUS_ADDR_MEM]		addr_mem_wr_o	,	
	output	[`YSYX210295_BUS_ADDR_MEM]		addr_mem_rd_o	,	
	output  [`YSYX210295_BUS_AXI_SIZE]     size_mem_rd_o   ,
	output 	[`YSYX210295_BUS_ADDR_MEM]		pc_o			,
	output						pc_act_o
);
	
	wire fetch_except;
	wire decode_except;
	wire mem_except;
	wire hold_n_pc_o;
	wire [`YSYX210295_BUS_EXCEPT_CAUSE] except_cause_if_o;
	wire [`YSYX210295_BUS_EXCEPT_CAUSE] except_cause_id_o;
	wire [`YSYX210295_BUS_EXCEPT_CAUSE] except_cause_ex_o ;
	
	wire jmp_en_pc_i;
	wire [`YSYX210295_BUS_ADDR_MEM] jmp_to_pc_i;

	//wire instr_mask_if_i;
	wire [`YSYX210295_BUS_ADDR_MEM] pc_if_i;
	wire [`YSYX210295_BUS_DATA_INSTR] instr_rd_if_i; 	
	wire [`YSYX210295_BUS_DATA_INSTR] instr_rd_if_o;
	wire instr_rd_en_if_o;

	wire [`YSYX210295_BUS_DATA_REG] data_rs1_id_i;
	wire [`YSYX210295_BUS_DATA_REG] data_rs2_id_i;
	wire [`YSYX210295_BUS_DATA_REG] data_bypass_id_i;
	wire [`YSYX210295_BUS_DATA_INSTR] instr_id_i;
	wire [`YSYX210295_BUS_ADDR_MEM] addr_instr_id_i;
	wire [`YSYX210295_BUS_DATA_REG] data_rs1_id_o;
	wire [`YSYX210295_BUS_DATA_REG] data_rs2_id_o;
	wire [`YSYX210295_BUS_DATA_REG] jmpb_rs1_id_o;
	wire [`YSYX210295_BUS_DATA_REG] jmpb_rs2_id_o;
	wire [`YSYX210295_BUS_ADDR_REG] addr_rs1_id_o;
	wire [`YSYX210295_BUS_ADDR_REG] addr_rs2_id_o;
	wire [`YSYX210295_BUS_ADDR_REG] addr_wr_id_o;
	//wire [`YSYX210295_BUS_ADDR_MEM] addr_instr_id_o;
	wire reg_wr_en_id_o;
	wire [`YSYX210295_BUS_L_CODE] load_code_id_o;
	wire [`YSYX210295_BUS_S_CODE] store_code_id_o;
	wire alu_add_sub_id_o;
	wire alu_shift_id_o;	
	wire word_intercept_id_o;
	wire [`YSYX210295_BUS_ALU_OP] alu_operation_id_o;
	wire [`YSYX210295_BUS_DATA_REG] alu_op_num1_id_o;
	wire [`YSYX210295_BUS_DATA_REG] alu_op_num2_id_o;
	wire [`YSYX210295_BUS_DATA_REG] jmp_op_num1_id_o;
	wire [`YSYX210295_BUS_DATA_REG] jmp_op_num2_id_o;
        wire [`YSYX210295_OPERATION_CODE] operation_code_id_o;
	wire [`YSYX210295_BUS_ALU_OP] 	 csr_instr_id_o;
	wire [`YSYX210295_BUS_CSR_IMM]	 csr_addr_id_o;

	//	wire [`YSYX210295_BUS_CSR_IMM]	 csr_addr_id;  // by ou
	wire [`YSYX210295_BUS_JMP_FLAG] jmp_flag_id_o;	
	wire load_bypass_id_o;

	//wire [`YSYX210295_BUS_ADDR_MEM] pc_ex_i;
	//wire [`YSYX210295_BUS_DATA_INSTR] instr_ex_i;
	wire [`YSYX210295_BUS_DATA_REG] data_rs1_ex_i;
	wire [`YSYX210295_BUS_DATA_REG] data_rs2_ex_i;
	wire [`YSYX210295_BUS_ALU_OP]	csr_instr_ex_i;	
	wire [`YSYX210295_BUS_CSR_IMM]	csr_addr_ex_i;	
	wire [`YSYX210295_BUS_L_CODE] load_code_ex_i;
	wire [`YSYX210295_BUS_S_CODE] store_code_ex_i;
	wire alu_add_sub_ex_i;
	wire alu_shift_ex_i;
	wire word_intercept_ex_i;
	wire [`YSYX210295_BUS_ALU_OP] alu_operation_ex_i;
	wire [`YSYX210295_BUS_DATA_REG] alu_op_num1_ex_i;
	wire [`YSYX210295_BUS_DATA_REG] alu_op_num2_ex_i;
	wire [`YSYX210295_BUS_DATA_MEM] data_mem_ex_i;
	wire [`YSYX210295_BUS_ADDR_REG] addr_wr_ex_i;
	wire reg_wr_en_ex_i;
	wire [`YSYX210295_BUS_DATA_REG] alu_result_ex_o;
	wire [`YSYX210295_BUS_DATA_MEM] data_mem_wr_ex_o;	
	wire [`YSYX210295_BUS_AXI_STRB] strb_mem_wr_ex_o;
	wire [`YSYX210295_BUS_AXI_SIZE] size_mem_wr_ex_o;

	wire [`YSYX210295_BUS_ADDR_MEM] addr_mem_wr_ex_o;	
	wire [`YSYX210295_BUS_ADDR_MEM] addr_mem_rd_ex_o;	
	wire [`YSYX210295_BUS_AXI_SIZE] size_mem_rd_ex_o;
	wire mem_wr_en_ex_o;
	wire mem_rd_en_ex_o;
	wire [`YSYX210295_BUS_ADDR_REG] addr_wr_ex_o;
	wire [`YSYX210295_BUS_DATA_REG] data_wr_ex_o;
	wire wr_en_ex_o;

	wire wr_en_reg_i;
	wire [`YSYX210295_BUS_ADDR_REG] addr_wr_reg_i;
	wire [`YSYX210295_BUS_ADDR_REG] addr_rd1_reg_i;
	wire [`YSYX210295_BUS_ADDR_REG] addr_rd2_reg_i;
	wire [`YSYX210295_BUS_DATA_REG] data_wr_reg_i;
	wire [`YSYX210295_BUS_DATA_REG] data_rd1_reg_o;
	wire [`YSYX210295_BUS_DATA_REG] data_rd2_reg_o;

	wire 				 stall_if_ctrl_i;
	wire 				 stall_mem_ctrl_i;
    wire				 irq_jmp_ctrl_i;
	wire [`YSYX210295_BUS_ADDR_MEM] irq_jmp_to_ctrl_i;

	wire [`YSYX210295_BUS_ADDR_MEM] jmp_num1_ctrl_i;
	wire [`YSYX210295_BUS_ADDR_MEM] jmp_num2_ctrl_i;
	//wire [`YSYX210295_BUS_ADDR_MEM] pc_prediction_ctrl_i;
	//wire [`YSYX210295_BUS_ADDR_MEM] pc_jmp_ctrl_i;
	wire [`YSYX210295_BUS_DATA_REG] data_rs1_ctrl_i;
	wire [`YSYX210295_BUS_DATA_REG] data_rs2_ctrl_i;
	wire [`YSYX210295_BUS_JMP_FLAG] jmp_flag_ctrl_i;
	wire load_bypass_ctrl_i;
	wire jmp_en_ctrl_o;
	wire [`YSYX210295_BUS_ADDR_MEM] jmp_to_ctrl_o;
	//wire instr_mask_ctrl_o;
	wire [`YSYX210295_BUS_HOLD_CODE] hold_code_ctrl_o;

	//wire [`YSYX210295_BUS_HOLD_CODE] hold_code;

	wire				   		irq_assert_clint_o;
	wire 	[`YSYX210295_BUS_ADDR_MEM] 	irq_addr_clint_o;
	wire						csr_we_ex_o;
	wire	[`YSYX210295_BUS_CSR_IMM]		csr_addr_ex_o;
	wire	[`YSYX210295_BUS_DATA_REG]		csr_data_id_i;
	wire	[`YSYX210295_BUS_DATA_REG]		csr_data_id_o;
	wire	[`YSYX210295_BUS_DATA_REG]		csr_data_ex_o;
	wire						csr_we_clint_o;
	wire	[`YSYX210295_BUS_CSR_IMM]		csr_addr_clint_o;
	//wire	[`YSYX210295_BUS_DATA_REG]		csr_data_clint_i;
	wire	[`YSYX210295_BUS_DATA_REG]		csr_data_clint_o;
	
	wire	[`YSYX210295_BUS_DATA_REG]		mstatus_csr_reg_o;
	wire	[`YSYX210295_BUS_DATA_REG]		mie_csr_reg_o;
	wire	[`YSYX210295_BUS_DATA_REG]		mtvec_csr_reg_o;
	wire	[`YSYX210295_BUS_DATA_REG]		mepc_csr_reg_o;

	wire						except_async_id;
/*
	reg	[`YSYX210295_BUS_DATA_REG]		mstatus_csr_r;
	reg	[`YSYX210295_BUS_DATA_REG]		mie_csr_r;
	reg	[`YSYX210295_BUS_DATA_REG]		mtvec_csr_r;
	reg	[`YSYX210295_BUS_DATA_REG]		mepc_csr_r;
*/
       	reg [32:0] cnt_inst;
	wire hold_n_pos;
	
	reg hold_n_r ;
    always@(posedge clock) begin
	   if(reset) hold_n_r <= 0;    
	   else      hold_n_r <= hold_n_pc_o ;
 	end
 	assign hold_n_pos = hold_n_pc_o && (~hold_n_r) ;
	
	always@(posedge clock) begin
	   if(reset)    cnt_inst<=0;
	   else if(hold_n_pos) cnt_inst <= cnt_inst+1;
	end
	

	assign jmp_en_pc_i = jmp_en_ctrl_o;
	assign jmp_to_pc_i = jmp_to_ctrl_o;

	assign instr_rd_if_i = instr_i;
	assign pc_if_i = pc_o;
	//assign instr_mask_if_i = instr_mask_ctrl_o;

	assign data_rs1_id_i = data_rd1_reg_o;
	assign data_rs2_id_i = data_rd2_reg_o;
	assign data_bypass_id_i = alu_result_ex_o;
	assign instr_id_i = instr_rd_if_o;
	assign addr_instr_id_i = addr_instr_i;

	assign data_rs1_ex_i = data_rs1_id_o;
	assign data_rs2_ex_i = data_rs2_id_o;
	assign csr_instr_ex_i = csr_instr_id_o;

	assign csr_addr_ex_i = csr_addr_id_o;
	assign load_code_ex_i = load_code_id_o;	
	assign store_code_ex_i = store_code_id_o;
	assign alu_add_sub_ex_i = alu_add_sub_id_o;
	assign alu_shift_ex_i = alu_shift_id_o;
	assign word_intercept_ex_i = word_intercept_id_o;
	assign alu_operation_ex_i = alu_operation_id_o;
	assign alu_op_num1_ex_i = alu_op_num1_id_o;
	assign alu_op_num2_ex_i = alu_op_num2_id_o;
	assign data_mem_wr_o = data_mem_wr_ex_o;
	assign strb_mem_wr_o = strb_mem_wr_ex_o;
	assign size_mem_wr_o = size_mem_wr_ex_o;
	assign mem_wr_en_o = mem_wr_en_ex_o;
	assign mem_rd_en_o = mem_rd_en_ex_o;
	assign addr_mem_wr_o = addr_mem_wr_ex_o;
	assign addr_mem_rd_o = addr_mem_rd_ex_o;
	assign size_mem_rd_o = size_mem_rd_ex_o;

	assign data_mem_ex_i = data_mem_i;
	assign addr_wr_ex_i = addr_wr_id_o;
	assign reg_wr_en_ex_i = reg_wr_en_id_o;

	assign wr_en_reg_i = wr_en_ex_o & (hold_code_ctrl_o < `YSYX210295_HOLD_CODE_EX);

	assign addr_wr_reg_i = addr_wr_ex_o;
	assign addr_rd1_reg_i = addr_rs1_id_o;
	assign addr_rd2_reg_i = addr_rs2_id_o;
	assign data_wr_reg_i = data_wr_ex_o;

	assign stall_if_ctrl_i = stall_if;
	assign stall_mem_ctrl_i = stall_mem;
	assign jmp_num1_ctrl_i = jmp_op_num1_id_o;
	assign jmp_num2_ctrl_i = jmp_op_num2_id_o;
	//assign pc_prediction_ctrl_i = pc_o;
	//assign pc_jmp_ctrl_i = addr_instr_i;
	assign data_rs1_ctrl_i = jmpb_rs1_id_o;
	assign data_rs2_ctrl_i = jmpb_rs2_id_o;
	assign jmp_flag_ctrl_i = jmp_flag_id_o;
	assign load_bypass_ctrl_i = load_bypass_id_o;

	assign hold_code = hold_code_ctrl_o;
	assign instr_rd_en_o = instr_rd_en_if_o;

	assign irq_jmp_ctrl_i = irq_assert_clint_o;
	assign irq_jmp_to_ctrl_i = irq_addr_clint_o;

/*
	reg instr_rd_en_t;
	always@(posedge clock) begin
		if(reset) instr_rd_en_t <= 0;
		else       instr_rd_en_t <= instr_rd_en_o;
	end
*/
        
	ysyx_210295_pc core_pc
	(
		.clock		(clock),
		.reset		(reset),
		.hold_code 	      (hold_code),
	
		.jmp_en		(jmp_en_pc_i),
		.jmp_to		(jmp_to_pc_i),
	
		.addr_instr	(pc_o),
		.pc_act		(pc_act_o),
		.hold_n		(hold_n_pc_o)
	);


	ysyx_210295_if_stage core_if
	(
		.hold_code 		(hold_code),
		.instr_rd_i 	(instr_rd_if_i),

		.reset          (reset),
		//.instr_mask_i	(instr_mask_if_i),
		.pc_i 			(pc_if_i),
		
		.fetch_except_o	(fetch_except),
		.except_cause_o	(except_cause_if_o),
		.instr_rd_o 	(instr_rd_if_o),
		.instr_rd_en_o	(instr_rd_en_if_o)
	);

 //   wire [31:0] diff_instr_id_i;
//	wire [31:0] diff_instr_id_o;
//	wire [31:0] diff_instr_ex_i; 
	//wire [31:0] diff_instr_ex_o;
    //assign diff_instr_ex_i = diff_instr_id_o ;
/*
	wire [63:0] diff_pc_id_i;
	wire [63:0] diff_pc_id_o;
	wire [63:0] diff_pc_ex_i;
	wire [63:0] diff_pc_ex_o;
	wire        diff_instr_en_id_i;
	wire        diff_instr_en_id_o;
	wire        diff_instr_en_ex_i;
	wire        diff_instr_en_ex_o;

	//assign diff_pc_id_i = pc_if_i ;
    assign diff_pc_ex_i = diff_pc_id_o ;

	assign diff_instr_en_id_i = instr_rd_en_if_o ;
	assign diff_instr_en_ex_i = diff_instr_en_id_o ;
*/
	ysyx_210295_id_stage core_id
	(
		.clock			(clock),
		.reset			(reset),

		.hold_code		(hold_code),

		.data_rs1_i		(data_rs1_id_i),
		.data_rs2_i		(data_rs2_id_i),
		.data_bypass_i 	(data_bypass_id_i),
		.instr_i		(instr_id_i),
		.addr_instr_i	(addr_instr_id_i),

	//	.diff_instr_i   (instr_id_i),

		.except_async  (except_async_id),

	//	.diff_pc_i      (addr_instr_id_i),
	//	.diff_instr_en_i(diff_instr_en_id_i),


		.data_rs1_o		(data_rs1_id_o),
		.data_rs2_o		(data_rs2_id_o),
		.jmpb_rs1_o		(jmpb_rs1_id_o),
		.jmpb_rs2_o		(jmpb_rs2_id_o),
		.addr_rs1_o		(addr_rs1_id_o),
		.addr_rs2_o		(addr_rs2_id_o),		
		.addr_wr_o		(addr_wr_id_o),
		//.addr_instr_o	(),

	//	.diff_instr_o   (diff_instr_id_o),
	//	.diff_pc_o      (diff_pc_id_o),
	//	.diff_instr_en_o(diff_instr_en_id_o),

		.reg_wr_en_o	(reg_wr_en_id_o),
		.load_code_o	(load_code_id_o),
		.store_code_o	(store_code_id_o),
                .op_code_o	(operation_code_id_o),
		.alu_add_sub_o	(alu_add_sub_id_o),
		.alu_shift_o	(alu_shift_id_o),
		.word_intercept_o(word_intercept_id_o),
		.alu_operation_o(alu_operation_id_o),
		.alu_op_num1_o	(alu_op_num1_id_o),
		.alu_op_num2_o	(alu_op_num2_id_o),
		.jmp_op_num1_o	(jmp_op_num1_id_o),
		.jmp_op_num2_o	(jmp_op_num2_id_o),	


		.csr_instr_o		(csr_instr_id_o),
		.csr_addr_o			(csr_addr_id_o),
		.csr_data_i			(csr_data_id_i),
		.csr_data_o			(csr_data_id_o),
		
		.jmp_flag_o			(jmp_flag_id_o),
		.decode_except_o	(decode_except),
		.except_cause_o		(except_cause_id_o),
		.load_bypass_o		(load_bypass_id_o)
	);


	ysyx_210295_ex_stage core_ex(
		.clock			(clock),
		.reset			(reset),
		.hold_code		(hold_code),

		.data_rs1_i		(data_rs1_ex_i),
		.data_rs2_i		(data_rs2_ex_i),
		.csr_instr_i	(csr_instr_ex_i),
		.csr_addr_i		(csr_addr_ex_i),

	//	.diff_instr_i   (diff_instr_ex_i),
	//	.diff_pc_i      (diff_pc_ex_i),
	//	.diff_instr_en_i(diff_instr_en_ex_i),

		.load_code_i	(load_code_ex_i),
		.store_code_i	(store_code_ex_i),
                .op_code_i	(operation_code_id_o),
		.alu_add_sub_i	(alu_add_sub_ex_i),
		.alu_shift_i	(alu_shift_ex_i),
		.word_intercept_i(word_intercept_ex_i),
		.alu_operation_i(alu_operation_ex_i),
		.alu_op_num1_i	(alu_op_num1_ex_i),
		.alu_op_num2_i	(alu_op_num2_ex_i),

		.data_mem_i 	(data_mem_ex_i),
		.addr_reg_wr_i	(addr_wr_ex_i),
		.reg_wr_en_i	(reg_wr_en_ex_i),

		.except_async  (except_async_id),

		.alu_result_o	(alu_result_ex_o),
		.data_mem_wr_o	(data_mem_wr_ex_o),
		.strb_mem_wr_o	(strb_mem_wr_ex_o),
		.size_mem_wr_o  (size_mem_wr_ex_o),
		.addr_mem_wr_o	(addr_mem_wr_ex_o),
		.addr_mem_rd_o	(addr_mem_rd_ex_o),
		.size_mem_rd_o  (size_mem_rd_ex_o),
		.mem_wr_en_o	(mem_wr_en_ex_o),
		.mem_rd_en_o	(mem_rd_en_ex_o),

	//	.diff_instr_o   (diff_instr_ex_o),
	//	.diff_pc_o      (diff_pc_ex_o),
	//	.diff_instr_en_o(diff_instr_en_ex_o),

		.addr_reg_wr_o	(addr_wr_ex_o),
		.data_reg_wr_o 	(data_wr_ex_o),
		.reg_wr_en_o	(wr_en_ex_o),

		.csr_we_o			(csr_we_ex_o),
        .csr_addr_o			(csr_addr_ex_o),
        .csr_data_o			(csr_data_ex_o),
        .csr_data_i			(csr_data_id_o),
		
		.mem_except_o		(mem_except),
		.except_cause_o		(except_cause_ex_o)
	);


	//wire [`YSYX210295_REG_BUS] regs[0 : 31];
	
	ysyx_210295_regs genral_regs
	(
		.clock		(clock),
		.reset		(reset),

		.wr_en		(wr_en_reg_i),
		.addr_wr	(addr_wr_reg_i),
		.addr_rd1	(addr_rd1_reg_i),
		.addr_rd2	(addr_rd2_reg_i),
		.data_wr	(data_wr_reg_i),

		.data_rd1	(data_rd1_reg_o),
		.data_rd2	(data_rd2_reg_o)
		//.regs_o     (regs)
	);
    
	//wire hold_n;
	ysyx_210295_reg_csr U_reg_csr
		(
			.clock				(clock),
			.reset				(reset),
			.hold_n             (hold_n_pc_o), // by ou
			
			.ex_we			(csr_we_ex_o),
			.ex_waddr_i			(csr_addr_ex_o),
			.ex_raddr_i			(csr_addr_id_o),
			.ex_data_i			(csr_data_ex_o),
			.ex_data_o			(csr_data_id_i),
			
			.clt_we_i			(csr_we_clint_o),
			.clt_waddr_i			(csr_addr_clint_o),
			.clt_data_i			(csr_data_clint_o),
			//.clt_data_o			(csr_data_clint_i),
			
			.csr_mstatus		(mstatus_csr_reg_o),
			.csr_mie			(mie_csr_reg_o),
			.csr_mtvec			(mtvec_csr_reg_o),
			.csr_mepc			(mepc_csr_reg_o)
		);

    wire jmp_en;// by ou
	ysyx_210295_ctrl core_ctrl
	(
		//.clock			(clock),
		//.reset			(reset),
		.stall_if		(stall_if_ctrl_i),
		.stall_mem	    (stall_mem_ctrl_i),

		.irq_jmp_i 		(irq_jmp_ctrl_i),
		.irq_jmp_to_i	(irq_jmp_to_ctrl_i),
		
		.jmp_num1_i		(jmp_num1_ctrl_i),
		.jmp_num2_i		(jmp_num2_ctrl_i),
		//.pc_pred_i		(pc_prediction_ctrl_i),
		//.pc_instr_i		(pc_jmp_ctrl_i),
		.data_rs1_i		(data_rs1_ctrl_i),
		.data_rs2_i		(data_rs2_ctrl_i),
		.jmp_flag_i		(jmp_flag_ctrl_i),
		.load_bypass_i	(load_bypass_ctrl_i),

        .jmp_en          (jmp_en),  // by ou
		.jmp_en_o		(jmp_en_ctrl_o),		
		.jmp_to_o		(jmp_to_ctrl_o),
		//.instr_mask_o	(instr_mask_ctrl_o),
		.hold_code_o	(hold_code_ctrl_o)
	);

wire except_async_clint_o;
ysyx_210295_clint core_clint
	(
		.clock				(clock),
		.reset				(reset),
		.hold_n				(hold_n_pc_o),	
		.jmp_en				(jmp_en),
	
		.except_src_if		(fetch_except),
		.except_cus_if		(except_cause_if_o),
	
		.except_src_id		(decode_except),
		.except_cus_id		(except_cause_id_o),
		//.instr_id_i			(instr_id_i),
		.addr_instr_id_i	(addr_instr_id_i),
		.except_src_ex		(mem_except & 1'b0 ),
		.except_cus_ex		(except_cause_ex_o),
		.tmr_irq_i		(tmr_irq_i),
		.ext_irq_i		(ext_irq_i),
		
		.irq_assert_o		(irq_assert_clint_o),
		.irq_addr_o		(irq_addr_clint_o),
		.except_async_o (except_async_clint_o),  // by ou
		
		.csr_we_o		(csr_we_clint_o),
		.csr_addr_o		(csr_addr_clint_o),
		//.csr_data_i		(csr_data_clint_i),
		.csr_data_o		(csr_data_clint_o),
		
		.csr_mstatus		(mstatus_csr_reg_o),
		.csr_mie		(mie_csr_reg_o),
		.csr_mtvec		(mtvec_csr_reg_o), 
		.csr_mepc		(mepc_csr_reg_o)
);


ysyx_210295_gnrl_dff # (.DW(1)) diff_except_async_r1(
	.clock		(clock),
	.reset		(reset),
	.wr_en		(hold_n_pc_o),
	.data_in	(except_async_clint_o),
	.data_r_ini	(1'b0),
	.data_out	(except_async_id)
);

reg [7:0] char_display ;
always@(posedge clock) begin
	if ( reset)            char_display <= 0;
   else if ( hold_n_pc_o)    char_display <=data_wr_reg_i[7:0];
   else                    char_display <= char_display ; 
end
/*
	always @(posedge clock) begin
		case(diff_instr_ex_o)
		32'h0000007b:    if(hold_n_pc_o) $write("%c",char_display);
    endcase
	end
	*/

// Difftest
/*
reg cmt_wen;
reg [7:0] cmt_wdest;
reg [`YSYX210295_REG_BUS] cmt_wdata;
reg [`YSYX210295_REG_BUS] cmt_pc;
reg [31:0] cmt_inst;
reg cmt_valid;
reg trap;
reg [7:0] trap_code;
reg [63:0] cycleCnt;
reg [63:0] instrCnt;
reg [`YSYX210295_REG_BUS] regs_diff [0 : 31];

wire hold_n;
assign hold_n = (hold_code < `YSYX210295_HOLD_CODE_IF) ? `YSYX210295_INSTR_RD_EN : `YSYX210295_INSTR_RD_DIS;

always@(posedge clock) begin
    if(reset) begin
	mstatus_csr_r    <=  0;
	mie_csr_r        <=  0;
	mtvec_csr_r      <=  0;
	mepc_csr_r       <=  0;
	misa_csr_r       <=  0;
	mscratch_csr_r   <=  0;
	mcause_csr_r     <=  0;
	mtval_csr_r      <=  0;
	mip_csr_r        <=  0;
	mcycle_csr_r     <=  0;
	mhartid_csr_r    <=  0;
 	minstret_csr_r   <=  0;
    end
    else if(hold_n) begin
		mstatus_csr_r    <=  mstatus_csr_reg_o;
		mie_csr_r        <=  mie_csr_reg_o;
		mtvec_csr_r      <=  mtvec_csr_reg_o;
		mepc_csr_r       <=  mepc_csr_reg_o;
		misa_csr_r       <=  misa_csr_reg_o;
		mscratch_csr_r   <=  mscratch_csr_reg_o;
		mcause_csr_r     <=  mcause_csr_reg_o;
		mtval_csr_r      <=  mtval_csr_reg_o;
		mip_csr_r        <=  mip_csr_reg_o;
		mcycle_csr_r     <=  mcycle_csr_reg_o;
		mhartid_csr_r    <=  mhartid_csr_reg_o;
        	minstret_csr_r   <=  minstret_csr_reg_o;
         end
         else begin
		mstatus_csr_r    <=  mstatus_csr_r;
		mie_csr_r        <=  mie_csr_r;
		mtvec_csr_r      <=  mtvec_csr_r;
		mepc_csr_r       <=  mepc_csr_r;
		misa_csr_r       <=  misa_csr_r;
		mscratch_csr_r   <=  mscratch_csr_r;
		mcause_csr_r     <=  mcause_csr_r;
		mtval_csr_r      <=  mtval_csr_r;
		mip_csr_r        <=  mip_csr_r;
		mcycle_csr_r     <=  mcycle_csr_r;
		mhartid_csr_r    <=  mhartid_csr_r;
           	minstret_csr_r   <=  minstret_csr_r;
         end
end

 wire inst_valid = (hold_n & (diff_instr_ex_o != 0))  ;

// test for 0x7b




wire tmr_irq_en;
wire tmr_irq;
wire hold ;
wire tmr_irq_valid;
wire glb_irq_en;
assign tmr_irq_en = mie_csr_reg_o[7];
assign glb_irq_en = mstatus_csr_reg_o[3];
assign tmr_irq_valid = tmr_irq_i & tmr_irq_en;

wire irq;
gnrl_dff # (.DW(1)) diff_tmr_irq_valid(
	.clock		(clock),
	.reset		(reset),
	.wr_en		(hold_n),
	.data_in	(except_async_clint_o),
	.data_r_ini	(0),

	.data_out	(irq)
);


assign hold = hold_n;

reg irq_r1;

reg [ 1:0] st;
always@(posedge clock) begin
	if(reset)                	  begin irq_r1<=0; 		   st<= 2'b00;  end
	else begin
		case(st)
		2'b00:  begin 
			       irq_r1<=0;
				   if(irq_pos)  st<=01;
		       end
		2'b01:  begin
			      if(  hold_n)  begin irq_r1<=irq;     st<= 2'b10; end
				  else            begin irq_r1<=0;         	   st<=st;  end
				  
		       end
		2'b10:  begin
			       if( hold_n)  begin  irq_r1<=0; st <= 2'b00; end     
				  else           begin irq_r1<=irq_r1; st<=st;  end 
		       end
		default:                begin irq_r1<=irq_r1; st<= st;  end
		endcase
	end
end


wire irq_r;
wire irq_pos;
gnrl_dff # (.DW(1)) diff_irq_2_r(
	.clock		(clock),
	.reset		(reset),
	.wr_en		(1),
	.data_in	(irq),
	.data_r_ini	(0),

	.data_out	(irq_r)
);
assign irq_pos = irq && (~irq_r) ;

wire irq_ok;
//assign tmr_irq_ok = tmr_irq_r1 & hold_n ;
assign irq_ok = irq_r1 & hold_n ;

 wire decode_except_r;
	gnrl_dff # (.DW(1)) diff_decode_except(
		.clock		(clock),
		.reset		(reset),
		.wr_en		(hold_n),
		.data_in	(decode_except),
		.data_r_ini	(0),

		.data_out	(decode_except_r)
	);
   
   wire decode_except_r2;
	gnrl_dff # (.DW(1)) diff_decode_except_r2(
		.clock		(clock),
		.reset		(reset),
		.wr_en		(hold_n),
		.data_in	(decode_except_r),
		.data_r_ini	(0),

		.data_out	(decode_except_r2)
	);

	wire decode_except_r3;
	gnrl_dff # (.DW(1)) diff_decode_except_r3(
		.clock		(clock),
		.reset		(reset),
		.wr_en		(hold_n),
		.data_in	(decode_except_r2),
		.data_r_ini	(0),
		.data_out	(decode_except_r3)
	);


	wire [`YSYX210295_BUS_EXCEPT_CAUSE] except_cause_id_o_r;
	gnrl_dff # (.DW(4)) diff_except_cause(
		.clock		(clock),
		.reset		(reset),
		.wr_en		(hold_n),
		.data_in	(except_cause_id_o),
		.data_r_ini	(0),
		.data_out	(except_cause_id_o_r)
	);

	wire [`YSYX210295_BUS_EXCEPT_CAUSE] except_cause_id_o_r2;
	gnrl_dff # (.DW(4)) diff_except_cause_2(
		.clock		(clock),
		.reset		(reset),
		.wr_en		(hold_n),
		.data_in	(except_cause_id_o_r),
		.data_r_ini	(0),
		.data_out	(except_cause_id_o_r2)
	);

	wire [`YSYX210295_BUS_EXCEPT_CAUSE] except_cause_id_o_r3;
	gnrl_dff # (.DW(4)) diff_except_cause_3(
		.clock		(clock),
		.reset		(reset),
		.wr_en		(hold_n),
		.data_in	(except_cause_id_o_r2),
		.data_r_ini	(0),
		.data_out	(except_cause_id_o_r3)
	);


	wire [ 63: 0] addr_mem_rd_ex_o_r;
	gnrl_dff # (.DW(64)) diff_addr_mem_rd_ex_o(
		.clock		(clock),
		.reset		(reset),
		.wr_en		(hold_n),
		.data_in	(addr_mem_rd_ex_o),
		.data_r_ini	(0),
		.data_out	(addr_mem_rd_ex_o_r)
	);

		wire [ 63: 0] addr_mem_wr_ex_o_r;
	gnrl_dff # (.DW(64)) diff_addr_mem_wr_ex_o(
		.clock		(clock),
		.reset		(reset),
		.wr_en		(hold_n),
		.data_in	(addr_mem_wr_ex_o),
		.data_r_ini	(0),
		.data_out	(addr_mem_wr_ex_o_r)
	);


reg cmt_skip;
reg [7:0] 	cmt_coreid;
reg [31:0] cmt_intrNO;
reg [31:0]  cmt_cause;
reg [63:0]  cmt_exceptionPC;
reg [31:0]  cmt_exceptionInst;
wire exception_vld;
assign exception_vld = (decode_except_r3==1) & (except_cause_id_o_r3!=`YSYX210295_EXCEPT_MRET);

always @(negedge clock) begin
  if (reset) begin
    {cmt_wen, cmt_wdest, cmt_wdata, cmt_pc, cmt_inst, cmt_valid, trap, trap_code, cycleCnt, instrCnt} <= 0;
	{cmt_intrNO,cmt_cause,cmt_exceptionPC,cmt_exceptionInst} <= 0;
	cmt_skip <= 0;
  end
  else if (~trap) begin
	cmt_exceptionPC <= ( ( (except_cause_id_o_r3==`YSYX210295_EXCEPT_ECALL) & hold_n)  || (irq_ok ) )? diff_pc_ex_o : 0 ;
	cmt_exceptionInst <= ( ( (except_cause_id_o_r3==`YSYX210295_EXCEPT_ECALL) & hold_n)  || (irq_ok ) )? diff_instr_ex_o : 0 ;
    	cmt_cause <= ( (except_cause_id_o_r3==`YSYX210295_EXCEPT_ECALL) & hold_n) ? { 28'd0,except_cause_id_o_r3} : 0 ;

    cmt_intrNO <=( irq_ok) ? {28'd0, 4'd7} : 0 ;//for test
    cmt_coreid <= 0;
	cmt_skip<=((diff_instr_ex_o==36'h0000007b) & (hold_n==1))? 1: 
	          ((diff_instr_ex_o==36'hb0002973) & (hold_n==1))? 1: //mcycle
			  ((diff_instr_ex_o==36'hb00024f3) & (hold_n==1))? 1: //mcycle
	                  //irq_ok? 1:
					( (addr_mem_rd_ex_o_r==64'h2004000 ||  addr_mem_rd_ex_o_r==64'h0200BFF8 )  & (hold_n))? 1: 
					( (addr_mem_wr_ex_o_r==64'h2004000 ||  addr_mem_wr_ex_o_r==64'h0200BFF8 )  & (hold_n))? 1:  0 ;// for test


    cmt_wen <= wr_en_reg_i & (addr_wr_reg_i != 0 );
    cmt_wdest <= {3'd0, addr_wr_reg_i};
    cmt_wdata <= data_wr_reg_i;

	// fetch instruction when write register 
    cmt_pc <= diff_pc_ex_o ;
    cmt_inst <= diff_instr_ex_o;
    cmt_valid <= inst_valid &(~irq_ok) ;

    regs_diff <= regs;

    trap <= diff_instr_ex_o[6:0] == 7'h6b;	
    trap_code <= regs[10][7:0];
    cycleCnt <= cycleCnt + 1;
    instrCnt <= instrCnt + inst_valid;
  end
end


DifftestArchEvent DifftestArchEvent(
	.clock        	     	  (clock),
	.coreid 			 	 (cmt_coreid),
	.intrNO        			 (cmt_intrNO),
	.cause         			( cmt_cause),   //except_cause_id_o_r2
	.exceptionPC    	 (cmt_exceptionPC),               //decode_except_r2 
	.exceptionInst  	 (cmt_exceptionInst)                   
);

DifftestInstrCommit DifftestInstrCommit(
  .clock              (clock),
  .coreid             (0),
  .index              (0),
  .valid              (cmt_valid),
  .pc                 (cmt_pc),
  .instr              (cmt_inst),
  .skip               (cmt_skip),
  .isRVC              (0),
  .scFailed           (0),
  .wen                (cmt_wen),
  .wdest              (cmt_wdest),
  .wdata              (cmt_wdata),
  .special            (0)
);

DifftestArchIntRegState DifftestArchIntRegState (
  .clock              (clock),
  .coreid             (0),
  .gpr_0              (regs_diff[0]),
  .gpr_1              (regs_diff[1]),
  .gpr_2              (regs_diff[2]),
  .gpr_3              (regs_diff[3]),
  .gpr_4              (regs_diff[4]),
  .gpr_5              (regs_diff[5]),
  .gpr_6              (regs_diff[6]),
  .gpr_7              (regs_diff[7]),
  .gpr_8              (regs_diff[8]),
  .gpr_9              (regs_diff[9]),
  .gpr_10             (regs_diff[10]),
  .gpr_11             (regs_diff[11]),
  .gpr_12             (regs_diff[12]),
  .gpr_13             (regs_diff[13]),
  .gpr_14             (regs_diff[14]),
  .gpr_15             (regs_diff[15]),
  .gpr_16             (regs_diff[16]),
  .gpr_17             (regs_diff[17]),
  .gpr_18             (regs_diff[18]),
  .gpr_19             (regs_diff[19]),
  .gpr_20             (regs_diff[20]),
  .gpr_21             (regs_diff[21]),
  .gpr_22             (regs_diff[22]),
  .gpr_23             (regs_diff[23]),
  .gpr_24             (regs_diff[24]),
  .gpr_25             (regs_diff[25]),
  .gpr_26             (regs_diff[26]),
  .gpr_27             (regs_diff[27]),
  .gpr_28             (regs_diff[28]),
  .gpr_29             (regs_diff[29]),
  .gpr_30             (regs_diff[30]),
  .gpr_31             (regs_diff[31])
);

DifftestTrapEvent DifftestTrapEvent(
  .clock              (clock),
  .coreid             (0),
  .valid              (trap),
  .code               (trap_code),
  .pc                 (cmt_pc),
  .cycleCnt           (cycleCnt),
  .instrCnt           (instrCnt)
);

DifftestCSRState DifftestCSRState(
  .clock              (clock),
  .coreid             (0),
  .priviledgeMode     (`YSYX210295_RISCV_PRIV_MODE_M),
  .mstatus            (mstatus_csr_r),
  .sstatus            (mstatus_csr_r & 64'h80000003000DE122),
  //.mepc               ({mepc_csr_r[63:1],1'b0}),
  .mepc               (mepc_csr_r),
  .sepc               (0),
  .mtval              (mtval_csr_r),
  .stval              (0),
  .mtvec              (mtvec_csr_r),
  .stvec              (0),
  .mcause             (mcause_csr_r),
  .scause             (0),
  .satp               (0),
  .mip                (mip_csr_r),
  .mie                (mie_csr_r),
  .mscratch           (mscratch_csr_r),
  .sscratch           (0),
  .mideleg            (0),
  .medeleg            (0)
);

DifftestArchFpRegState DifftestArchFpRegState(
  .clock              (clock),
  .coreid             (0),
  .fpr_0              (0),
  .fpr_1              (0),
  .fpr_2              (0),
  .fpr_3              (0),
  .fpr_4              (0),
  .fpr_5              (0),
  .fpr_6              (0),
  .fpr_7              (0),
  .fpr_8              (0),
  .fpr_9              (0),
  .fpr_10             (0),
  .fpr_11             (0),
  .fpr_12             (0),
  .fpr_13             (0),
  .fpr_14             (0),
  .fpr_15             (0),
  .fpr_16             (0),
  .fpr_17             (0),
  .fpr_18             (0),
  .fpr_19             (0),
  .fpr_20             (0),
  .fpr_21             (0),
  .fpr_22             (0),
  .fpr_23             (0),
  .fpr_24             (0),
  .fpr_25             (0),
  .fpr_26             (0),
  .fpr_27             (0),
  .fpr_28             (0),
  .fpr_29             (0),
  .fpr_30             (0),
  .fpr_31             (0)
);
*/
endmodule
//ECNURVCORE
//Pipeline CPU
//Created by Chesed
//2021.07.23
//Edited in 2021.08.22



module ysyx_210295_ctrl(
	//input					clock				,
	//input					reset			,
	input					stall_if		,
	input					stall_mem		,
	input					irq_jmp_i		,
	input [`YSYX210295_BUS_ADDR_MEM]	irq_jmp_to_i	,
	input [`YSYX210295_BUS_ADDR_MEM]	jmp_num1_i		,
	input [`YSYX210295_BUS_ADDR_MEM]	jmp_num2_i		,
	//input [`YSYX210295_BUS_ADDR_MEM]	pc_pred_i		,
	//input [`YSYX210295_BUS_ADDR_MEM]	pc_instr_i		,
	input [`YSYX210295_BUS_DATA_REG]	data_rs1_i		,
	input [`YSYX210295_BUS_DATA_REG]	data_rs2_i		,
	input [`YSYX210295_BUS_JMP_FLAG]	jmp_flag_i		,
	input					load_bypass_i	,

    output                  jmp_en,
	output					jmp_en_o		,
	output [`YSYX210295_BUS_ADDR_MEM]	jmp_to_o		,	
	//output					instr_mask_o	,	
	output [`YSYX210295_BUS_HOLD_CODE]	hold_code_o 			
);

	reg jmp_en_pre;
	//wire jmp_en;
	wire [`YSYX210295_BUS_ADDR_MEM] jmp_to;

    wire rs1_slt_rs2;
    wire rs1_sltu_rs2;
//	wire prediction_result;
//	wire prediction_result_t;
//	wire jmp_en_prediction;
//	wire [`YSYX210295_BUS_ADDR_MEM] jmp_to_prediction;
	//wire hold_n;

	assign jmp_en = (load_bypass_i==`YSYX210295_LOAD_BYPASS_EN) ? `YSYX210295_JMP_DIS : jmp_en_pre ;
	assign jmp_to = (jmp_en == `YSYX210295_JMP_EN) ? (jmp_num1_i + jmp_num2_i) : `YSYX210295_MEM_ADDR_ZERO;



	//assign rs1_slt_rs2 = (data_rs1_i[31] == data_rs2_i[31]) ? ((data_rs1_i < data_rs2_i) ? 1'b1 : 1'b0 ) : data_rs1_i[31];
	assign rs1_slt_rs2 = (data_rs1_i[63] == data_rs2_i[63]) ? ((data_rs1_i < data_rs2_i) ? 1'b1 : 1'b0 ) : data_rs1_i[63];  // by ou
	assign rs1_sltu_rs2 = (data_rs1_i < data_rs2_i) ? 1'b1 : 1'b0;

	always@(*) begin
		case(jmp_flag_i)
			`YSYX210295_INSTR_BEQ:		jmp_en_pre = (data_rs1_i == data_rs2_i) ? `YSYX210295_JMP_EN : `YSYX210295_JMP_DIS;
			`YSYX210295_INSTR_BNE:		jmp_en_pre = (data_rs1_i != data_rs2_i) ? `YSYX210295_JMP_EN : `YSYX210295_JMP_DIS;
			`YSYX210295_INSTR_BLT:		jmp_en_pre = rs1_slt_rs2 ? `YSYX210295_JMP_EN : `YSYX210295_JMP_DIS;
			`YSYX210295_INSTR_BGE:		jmp_en_pre = rs1_slt_rs2 ? `YSYX210295_JMP_DIS : `YSYX210295_JMP_EN;
			`YSYX210295_INSTR_BLTU:	jmp_en_pre = rs1_sltu_rs2 ? `YSYX210295_JMP_EN : `YSYX210295_JMP_DIS;
			`YSYX210295_INSTR_BGEU:	jmp_en_pre = rs1_sltu_rs2 ? `YSYX210295_JMP_DIS : `YSYX210295_JMP_EN;
			`YSYX210295_JMP_J: 		jmp_en_pre = `YSYX210295_JMP_EN;
		   // `YSYX210295_INSTR_ECALL: jmp_en_pre = `YSYX210295_JMP_EN;
			default:		jmp_en_pre = `YSYX210295_JMP_DIS;
		endcase
	end
//wire  irq_jmp_i_r;
//wire irq_jmp_i_r_2;
//reg irq_jmp_i_r2;
//wire irq_jmp_i_r_pos;

//assign irq_jmp_i_r_pos =(~irq_jmp_i_r2) && ( irq_jmp_i_r );  
/*
   always@(posedge clock) begin
	   if(reset) irq_jmp_i_r<=0;
	   else if( hold_n )  irq_jmp_i_r<=irq_jmp_i;
	   else               irq_jmp_i_r <= irq_jmp_i_r;
   end
*/
/*
	ysyx_210295_gnrl_dff # (.DW(1)) diff_irq_jmp_i(
		.clock		(clock),
		.reset		(reset),
		.wr_en		(hold_n),
		.data_in	(irq_jmp_i),
		.data_r_ini	(1'b0),

		.data_out	(irq_jmp_i_r)
	);
	*/
	/*
	ysyx_210295_gnrl_dff # (.DW(1)) diff_irq_jmp_i2(
		.clock		(clock),
		.reset		(reset),
		.wr_en		(hold_n),
		.data_in	(irq_jmp_i_r),
		.data_r_ini	(0),

		.data_out	(irq_jmp_i_r_2)
	);//by lee
*/
/*
    always@(posedge clock) begin
	   if(reset) irq_jmp_i_r2 <= 1'b0;
	   else irq_jmp_i_r2 <= irq_jmp_i_r;
   	end
*/
	/*
	reg [`YSYX210295_BUS_ADDR_MEM]	irq_jmp_to_i_r;

	always@(posedge clock) begin
	   if(reset) irq_jmp_to_i_r <= 64'b0;
	   else if(irq_jmp_i_r_pos) irq_jmp_to_i_r<=irq_jmp_to_i;
	   else irq_jmp_to_i_r <= irq_jmp_to_i_r;
	end
	*/
	/*
	reg [`YSYX210295_BUS_ADDR_MEM]	pc_instr_i_t;
	always @(posedge clock) begin
		if (reset)			pc_instr_i_t <= 64'b0;
		else if (hold_n)	pc_instr_i_t <= pc_instr_i; 
	end
	*/
    //assign jmp_en_o = (irq_jmp_i_r == `YSYX210295_JMP_EN) ? `YSYX210295_JMP_EN : ((prediction_result == `YSYX210295_JMP_RIGHT) ? jmp_en_prediction : `YSYX210295_JMP_EN);  //by  ou
	//assign jmp_en_o = (irq_jmp_i == `YSYX210295_JMP_EN) ? `YSYX210295_JMP_EN : ((prediction_result == `YSYX210295_JMP_RIGHT) ? jmp_en_prediction : `YSYX210295_JMP_EN);  
	assign jmp_en_o = (irq_jmp_i == `YSYX210295_JMP_EN) ? `YSYX210295_JMP_EN : jmp_en;//by lee
	assign jmp_to_o = (irq_jmp_i == `YSYX210295_JMP_EN) ? irq_jmp_to_i : jmp_to;
	/*
	assign jmp_to_o = (irq_jmp_i == `YSYX210295_JMP_EN) ? irq_jmp_to_i : (
	//assign jmp_to_o = (irq_jmp_i_r == `YSYX210295_JMP_EN) ? irq_jmp_to_i_r : (   //by  ou
					  (prediction_result == `YSYX210295_JMP_RIGHT) ? jmp_to_prediction : (
					  (jmp_en == `YSYX210295_JMP_EN) ? jmp_to : pc_instr_i_t + 64'd4))
					  //(jmp_en == `YSYX210295_JMP_EN) ? jmp_to : pc_instr_i + 64'd4));
	*/
	
	//assign instr_mask_o = prediction_result_t |  irq_jmp_i_r;
	//assign instr_mask_o = irq_jmp_i_r;
    
	assign hold_code_o = (stall_mem == `YSYX210295_STALL_EN) ? `YSYX210295_HOLD_CODE_EX : ((stall_if == `YSYX210295_STALL_EN) ? `YSYX210295_HOLD_CODE_EX : `YSYX210295_HOLD_CODE_NOPE);

	//assign hold_n = (hold_code_o == `YSYX210295_HOLD_CODE_NOPE) ? `YSYX210295_HOLD_DIS : `YSYX210295_HOLD_EN;
/*
	ysyx_210295_gnrl_dff # (.DW(1)) prediction_reg(
			.clock		(clock),
			.reset		(reset),
			.wr_en		(hold_n),
			.data_in	(prediction_result),
			.data_r_ini	(`YSYX210295_JMP_RIGHT),
			.data_out	(prediction_result_t)
		);
*/

/*
	ysyx_210295_btb_ctrl ctrl_prediction(
		.clock				(clock),
		.reset				(reset),
		.hold_code 			(hold_code_o),
		
		.pc_i				(pc_pred_i),
		.pc_jmp_i			(pc_instr_i),
		.target_pc_i		(jmp_to),
		.jmp_en_i			(jmp_en),
		//.target_pc_i		(jmp_to),
		//.jmp_en_i			(jmp_en),
		
		
		.jmp_prediction_o	(jmp_en_prediction),
		.target_pc_o		(jmp_to_prediction),
		.prediction_error_o	(prediction_result)
	);
	*/
endmodule

//ECNURVCORE
//Pipeline CPU
//Created by Chesed
//2021.07.20
//Edited in 2021.08.13

// update in 0908


module ysyx_210295_decoder
(
	input	[`YSYX210295_BUS_DATA_REG]			data_rs1_reg	,
	input	[`YSYX210295_BUS_DATA_REG]			data_rs2_reg	,
	input	[`YSYX210295_BUS_ADDR_REG]			reg_rd_addr_t	,
        input                           reg_wr_en_o     ,  //by ou

	input	[`YSYX210295_BUS_DATA_REG]			data_bypass		,
	input	[`YSYX210295_BUS_DATA_INSTR]		instr			,
	input	[`YSYX210295_BUS_ADDR_MEM]			addr_instr		,
	//input 	[`YSYX210295_BUS_L_CODE]			load_code_t		,

	output	[`YSYX210295_BUS_DATA_REG]			data_rs1		,
	output	[`YSYX210295_BUS_DATA_REG]			data_rs2		,
	output	reg [`YSYX210295_BUS_ALU_OP]		alu_operation	,
	output	reg 					alu_add_sub		,
	output	reg 					alu_shift		,
	output	reg 					word_intercept	,
	output	reg [`YSYX210295_BUS_DATA_REG]		alu_op_num1		,
	output	reg [`YSYX210295_BUS_DATA_REG]		alu_op_num2		,
	output	reg [`YSYX210295_BUS_DATA_REG]		jmp_op_num1		,
	output	reg [`YSYX210295_BUS_DATA_REG]		jmp_op_num2		,
	output	reg [`YSYX210295_BUS_JMP_FLAG]		jmp_flag		,

	output 	reg [`YSYX210295_BUS_L_CODE]		load_code		,
	output 	reg [`YSYX210295_BUS_S_CODE]		store_code		,
        output	    [`YSYX210295_OPERATION_CODE]   	operation_code	,

	output	reg [`YSYX210295_BUS_ADDR_REG]		reg_rs1_addr	,
	output	reg [`YSYX210295_BUS_ADDR_REG]		reg_rs2_addr	,
	output	reg [`YSYX210295_BUS_ADDR_REG]		reg_wr_addr		,
	output	reg 					reg_wr_en		,

	output	reg 					decode_except	,
	output	reg [`YSYX210295_BUS_EXCEPT_CAUSE]	except_cause	,
	output	reg [`YSYX210295_BUS_ALU_OP]		csr_instr		,
	output	reg [`YSYX210295_BUS_CSR_IMM]		csr_addr		,
	input		[`YSYX210295_BUS_DATA_REG]		csr_data_i		,

	output							load_bypass
);


//	wire	[6:0]	operation_code;
	wire	[4:0]	addr_rd;
	wire	[2:0]	funct3;
	wire	[4:0]	addr_rs1;
	wire	[4:0]	addr_rs2;
	wire	[6:0]	funct7;
	wire	[5:0]	funct7_w;
	wire bypass_en1;
	wire bypass_en2;
	wire bypass_act;

	assign operation_code = instr[`YSYX210295_OPERATION_CODE];
	assign addr_rd = instr[`YSYX210295_ADDR_RD];
	assign funct3 = instr[`YSYX210295_FUNCT3];
	assign addr_rs1 = instr[`YSYX210295_ADDR_RS1];		
	assign addr_rs2 = instr[`YSYX210295_ADDR_RS2];	
	assign funct7 = instr[`YSYX210295_FUNCT7];
	assign funct7_w = instr[`YSYX210295_FUNCT7_W];

    //assign bypass_en2 = (reg_rs2_addr == reg_rd_addr_t) ? `YSYX210295_BYPASS_EN : `YSYX210295_BYPASS_DIS;
    //assign bypass_en1 = (reg_rs1_addr == reg_rd_addr_t) ? `YSYX210295_BYPASS_EN : `YSYX210295_BYPASS_DIS;
	assign bypass_en1 = ((reg_rs1_addr == reg_rd_addr_t) & reg_wr_en_o )? ((reg_rs1_addr == 0)? `YSYX210295_BYPASS_DIS:`YSYX210295_BYPASS_EN) : `YSYX210295_BYPASS_DIS; //by ou
	assign bypass_en2 = ((reg_rs2_addr == reg_rd_addr_t) & reg_wr_en_o )? ((reg_rs2_addr == 0)? `YSYX210295_BYPASS_DIS:`YSYX210295_BYPASS_EN) : `YSYX210295_BYPASS_DIS; //by ou 
	assign bypass_act = bypass_en1 | bypass_en2;

	assign data_rs1 = ((bypass_en1 == `YSYX210295_BYPASS_EN)) ? data_bypass : data_rs1_reg;
	assign data_rs2 = ((bypass_en2 == `YSYX210295_BYPASS_EN)) ? data_bypass : data_rs2_reg;

	//assign load_bypass = bypass_act & (load_code_t != `YSYX210295_LOAD_NOPE);
	assign load_bypass = bypass_act & (load_code != `YSYX210295_LOAD_NOPE);  //by ou


	always@(*) begin
		case(operation_code)
                //   `YSYX210295_OPERATION_USER_DEFINED: begin   //by ou
				`YSYX210295_OPERATION_FENCE: begin   //by ou 1013
                reg_wr_en = `YSYX210295_REG_WR_DIS;
				reg_rs1_addr = `YSYX210295_REG_ADDR_ZERO;
				reg_rs2_addr = `YSYX210295_REG_ADDR_ZERO;
				reg_wr_addr = `YSYX210295_REG_ADDR_ZERO;
				
				jmp_flag = `YSYX210295_JMP_NOPE;
				load_code = `YSYX210295_LOAD_NOPE;
				store_code = `YSYX210295_STORE_NOPE;
				
				alu_add_sub = `YSYX210295_ALU_ADD_EN;
				alu_shift = `YSYX210295_ALU_SHIFT_L;
				word_intercept = `YSYX210295_INTERCEPT_EN;
				alu_operation = `YSYX210295_ALU_ADD;
				alu_op_num1	= `YSYX210295_ZERO_DOUBLE;
				alu_op_num2	= `YSYX210295_ZERO_DOUBLE;
				jmp_op_num1	= `YSYX210295_ZERO_DOUBLE;
				jmp_op_num2	= `YSYX210295_ZERO_DOUBLE;
				decode_except = `YSYX210295_EXCEPT_NOPE;
				except_cause = `YSYX210295_EXCEPT_NONE;
				csr_instr = `YSYX210295_CSR_CODE_NOPE;
				csr_addr = `YSYX210295_CSR_ADDR_ZERO;
                        end
			`YSYX210295_OPERATION_R: begin
				case(funct3)
					`YSYX210295_INSTR_ADD: begin
						case(funct7)
							`YSYX210295_FUNCT7_ADD: begin
								reg_wr_en = `YSYX210295_REG_WR_EN;
								reg_rs1_addr = addr_rs1;
								reg_rs2_addr = addr_rs2;
								reg_wr_addr = addr_rd;
								
								jmp_flag = `YSYX210295_JMP_NOPE;
								load_code = `YSYX210295_LOAD_NOPE;
								store_code = `YSYX210295_STORE_NOPE;
								
								alu_add_sub = `YSYX210295_ALU_ADD_EN;
								alu_shift = `YSYX210295_ALU_SHIFT_L;
								word_intercept = `YSYX210295_INTERCEPT_DIS;
								alu_operation = funct3;
								alu_op_num1	= data_rs1;
								alu_op_num2	= data_rs2;
								jmp_op_num1	= `YSYX210295_ZERO_DOUBLE;
								jmp_op_num2	= `YSYX210295_ZERO_DOUBLE;
								decode_except = `YSYX210295_EXCEPT_NOPE;
								except_cause = `YSYX210295_EXCEPT_NONE;
								csr_instr = `YSYX210295_CSR_CODE_NOPE;
								csr_addr = `YSYX210295_CSR_ADDR_ZERO;
							end
							`YSYX210295_FUNCT7_SUB: begin
								reg_wr_en = `YSYX210295_REG_WR_EN;
								reg_rs1_addr = addr_rs1;
								reg_rs2_addr = addr_rs2;
								reg_wr_addr = addr_rd;
								
								jmp_flag = `YSYX210295_JMP_NOPE;
								load_code = `YSYX210295_LOAD_NOPE;
								store_code = `YSYX210295_STORE_NOPE;
								
								alu_add_sub = `YSYX210295_ALU_SUB_EN;
								alu_shift = `YSYX210295_ALU_SHIFT_L;
								word_intercept = `YSYX210295_INTERCEPT_DIS;
								alu_operation = funct3;
								alu_op_num1	= data_rs1;
								alu_op_num2	= data_rs2;
								jmp_op_num1	= `YSYX210295_ZERO_DOUBLE;
								jmp_op_num2	= `YSYX210295_ZERO_DOUBLE;
								decode_except = `YSYX210295_EXCEPT_NOPE;
								except_cause = `YSYX210295_EXCEPT_NONE;
								csr_instr = `YSYX210295_CSR_CODE_NOPE;
								csr_addr = `YSYX210295_CSR_ADDR_ZERO;
							end
							default: begin
								reg_wr_en = `YSYX210295_REG_WR_DIS;
								reg_rs1_addr = `YSYX210295_REG_ADDR_ZERO;
								reg_rs2_addr = `YSYX210295_REG_ADDR_ZERO;
								reg_wr_addr = `YSYX210295_REG_ADDR_ZERO;
								
								jmp_flag = `YSYX210295_JMP_NOPE;
								load_code = `YSYX210295_LOAD_NOPE;
								store_code = `YSYX210295_STORE_NOPE;
								
								alu_add_sub = `YSYX210295_ALU_ADD_EN;
								alu_shift = `YSYX210295_ALU_SHIFT_L;
								word_intercept = `YSYX210295_INTERCEPT_EN;
								alu_operation = `YSYX210295_ALU_ADD;
								alu_op_num1	= `YSYX210295_ZERO_DOUBLE;
								alu_op_num2	= `YSYX210295_ZERO_DOUBLE;
								jmp_op_num1	= `YSYX210295_ZERO_DOUBLE;
								jmp_op_num2	= `YSYX210295_ZERO_DOUBLE;
								decode_except = `YSYX210295_EXCEPT_ACT;
								except_cause = `YSYX210295_EXCEPT_ID_ILLEGAL;
								csr_instr = `YSYX210295_CSR_CODE_NOPE;
								csr_addr = `YSYX210295_CSR_ADDR_ZERO;
							end
						endcase
					end
					`YSYX210295_INSTR_SR: begin
						case(funct7)
							`YSYX210295_FUNCT7_SRL: begin
								reg_wr_en = `YSYX210295_REG_WR_EN;
								reg_rs1_addr = addr_rs1;
								reg_rs2_addr = addr_rs2;
								reg_wr_addr = addr_rd;
						
								jmp_flag = `YSYX210295_JMP_NOPE;
								load_code = `YSYX210295_LOAD_NOPE;
								store_code = `YSYX210295_STORE_NOPE;
						
								alu_add_sub = `YSYX210295_ALU_ADD_EN;
								alu_shift = `YSYX210295_ALU_SHIFT_L;
								word_intercept = `YSYX210295_INTERCEPT_DIS;
								alu_operation = funct3;
								alu_op_num1	= data_rs1;
								alu_op_num2	= data_rs2;
								jmp_op_num1	= `YSYX210295_ZERO_DOUBLE;
								jmp_op_num2	= `YSYX210295_ZERO_DOUBLE;
								decode_except = `YSYX210295_EXCEPT_NOPE;
								except_cause = `YSYX210295_EXCEPT_NONE;
								csr_instr = `YSYX210295_CSR_CODE_NOPE;
								csr_addr = `YSYX210295_CSR_ADDR_ZERO;
							end
							`YSYX210295_FUNCT7_SRA: begin
								reg_wr_en = `YSYX210295_REG_WR_EN;
								reg_rs1_addr = addr_rs1;
								reg_rs2_addr = addr_rs2;
								reg_wr_addr = addr_rd;
						
								jmp_flag = `YSYX210295_JMP_NOPE;
								load_code = `YSYX210295_LOAD_NOPE;
								store_code = `YSYX210295_STORE_NOPE;
						
								alu_add_sub = `YSYX210295_ALU_ADD_EN;
								alu_shift = `YSYX210295_ALU_SHIFT_A;
								word_intercept = `YSYX210295_INTERCEPT_DIS;
								alu_operation = funct3;
								alu_op_num1	= data_rs1;
								alu_op_num2	= data_rs2;
								jmp_op_num1	= `YSYX210295_ZERO_DOUBLE;
								jmp_op_num2	= `YSYX210295_ZERO_DOUBLE;
								decode_except = `YSYX210295_EXCEPT_NOPE;
								except_cause = `YSYX210295_EXCEPT_NONE;
								csr_instr = `YSYX210295_CSR_CODE_NOPE;
								csr_addr = `YSYX210295_CSR_ADDR_ZERO;
							end
							default: begin
								reg_wr_en = `YSYX210295_REG_WR_DIS;
								reg_rs1_addr = `YSYX210295_REG_ADDR_ZERO;
								reg_rs2_addr = `YSYX210295_REG_ADDR_ZERO;
								reg_wr_addr = `YSYX210295_REG_ADDR_ZERO;
								
								jmp_flag = `YSYX210295_JMP_NOPE;
								load_code = `YSYX210295_LOAD_NOPE;
								store_code = `YSYX210295_STORE_NOPE;
								
								alu_add_sub = `YSYX210295_ALU_ADD_EN;
								alu_shift = `YSYX210295_ALU_SHIFT_L;
								word_intercept = `YSYX210295_INTERCEPT_EN;
								alu_operation = `YSYX210295_ALU_ADD;
								alu_op_num1	= `YSYX210295_ZERO_DOUBLE;
								alu_op_num2	= `YSYX210295_ZERO_DOUBLE;
								jmp_op_num1	= `YSYX210295_ZERO_DOUBLE;
								jmp_op_num2	= `YSYX210295_ZERO_DOUBLE;
								decode_except = `YSYX210295_EXCEPT_ACT;
								except_cause = `YSYX210295_EXCEPT_ID_ILLEGAL;
								csr_instr = `YSYX210295_CSR_CODE_NOPE;
								csr_addr = `YSYX210295_CSR_ADDR_ZERO;
							end
						endcase
					end
					`YSYX210295_INSTR_SL,`YSYX210295_INSTR_SLT,`YSYX210295_INSTR_SLTU,`YSYX210295_INSTR_XOR,`YSYX210295_INSTR_OR,`YSYX210295_INSTR_AND: begin
						case(funct7)
							`YSYX210295_FUNCT7_R_ACT: begin
								reg_wr_en = `YSYX210295_REG_WR_EN;
								reg_rs1_addr = addr_rs1;
								reg_rs2_addr = addr_rs2;
								reg_wr_addr = addr_rd;
						
								jmp_flag = `YSYX210295_JMP_NOPE;
								load_code = `YSYX210295_LOAD_NOPE;
								store_code = `YSYX210295_STORE_NOPE;
						
								alu_add_sub = `YSYX210295_ALU_ADD_EN;
								alu_shift = `YSYX210295_ALU_SHIFT_L;
								word_intercept = `YSYX210295_INTERCEPT_DIS;
								alu_operation = funct3;
								alu_op_num1	= data_rs1;
								alu_op_num2	= data_rs2;
								jmp_op_num1	= `YSYX210295_ZERO_DOUBLE;
								jmp_op_num2	= `YSYX210295_ZERO_DOUBLE;
								decode_except = `YSYX210295_EXCEPT_NOPE;
								except_cause = `YSYX210295_EXCEPT_NONE;
								csr_instr = `YSYX210295_CSR_CODE_NOPE;
								csr_addr = `YSYX210295_CSR_ADDR_ZERO;
							end
							default: begin
								reg_wr_en = `YSYX210295_REG_WR_DIS;
								reg_rs1_addr = `YSYX210295_REG_ADDR_ZERO;
								reg_rs2_addr = `YSYX210295_REG_ADDR_ZERO;
								reg_wr_addr = `YSYX210295_REG_ADDR_ZERO;
								
								jmp_flag = `YSYX210295_JMP_NOPE;
								load_code = `YSYX210295_LOAD_NOPE;
								store_code = `YSYX210295_STORE_NOPE;
								
								alu_add_sub = `YSYX210295_ALU_ADD_EN;
								alu_shift = `YSYX210295_ALU_SHIFT_L;
								word_intercept = `YSYX210295_INTERCEPT_EN;
								alu_operation = `YSYX210295_ALU_ADD;
								alu_op_num1	= `YSYX210295_ZERO_DOUBLE;
								alu_op_num2	= `YSYX210295_ZERO_DOUBLE;
								jmp_op_num1	= `YSYX210295_ZERO_DOUBLE;
								jmp_op_num2	= `YSYX210295_ZERO_DOUBLE;
								decode_except = `YSYX210295_EXCEPT_ACT;
								except_cause = `YSYX210295_EXCEPT_ID_ILLEGAL;
								csr_instr = `YSYX210295_CSR_CODE_NOPE;
								csr_addr = `YSYX210295_CSR_ADDR_ZERO;
							end
						endcase
					end
					default: begin
						reg_wr_en = `YSYX210295_REG_WR_DIS;
						reg_rs1_addr = `YSYX210295_REG_ADDR_ZERO;
						reg_rs2_addr = `YSYX210295_REG_ADDR_ZERO;
						reg_wr_addr = `YSYX210295_REG_ADDR_ZERO;
						
						jmp_flag = `YSYX210295_JMP_NOPE;
						load_code = `YSYX210295_LOAD_NOPE;
						store_code = `YSYX210295_STORE_NOPE;
						
						alu_add_sub = `YSYX210295_ALU_ADD_EN;
						alu_shift = `YSYX210295_ALU_SHIFT_L;
						word_intercept = `YSYX210295_INTERCEPT_EN;
						alu_operation = `YSYX210295_ALU_ADD;
						alu_op_num1	= `YSYX210295_ZERO_DOUBLE;
						alu_op_num2	= `YSYX210295_ZERO_DOUBLE;
						jmp_op_num1	= `YSYX210295_ZERO_DOUBLE;
						jmp_op_num2	= `YSYX210295_ZERO_DOUBLE;
						decode_except = `YSYX210295_EXCEPT_ACT;
						except_cause = `YSYX210295_EXCEPT_ID_ILLEGAL;
						csr_instr = `YSYX210295_CSR_CODE_NOPE;
						csr_addr = `YSYX210295_CSR_ADDR_ZERO;
					end
				endcase
			end
			
			`YSYX210295_OPERATION_RW: begin
				case(funct3)
					`YSYX210295_INSTR_ADDW: begin
						case(funct7)
							`YSYX210295_FUNCT7_ADD: begin
								reg_wr_en = `YSYX210295_REG_WR_EN;
								reg_rs1_addr = addr_rs1;
								reg_rs2_addr = addr_rs2;
								reg_wr_addr = addr_rd;
								
								jmp_flag = `YSYX210295_JMP_NOPE;
								load_code = `YSYX210295_LOAD_NOPE;
								store_code = `YSYX210295_STORE_NOPE;
								
								alu_add_sub = `YSYX210295_ALU_ADD_EN;
								alu_shift = `YSYX210295_ALU_SHIFT_L;
								word_intercept = `YSYX210295_INTERCEPT_EN;
								alu_operation = funct3;
								alu_op_num1	= data_rs1;
								alu_op_num2	= data_rs2;
								jmp_op_num1	= `YSYX210295_ZERO_DOUBLE;
								jmp_op_num2	= `YSYX210295_ZERO_DOUBLE;
								decode_except = `YSYX210295_EXCEPT_NOPE;
								except_cause = `YSYX210295_EXCEPT_NONE;
								csr_instr = `YSYX210295_CSR_CODE_NOPE;
								csr_addr = `YSYX210295_CSR_ADDR_ZERO;
							end
							`YSYX210295_FUNCT7_SUB: begin
								reg_wr_en = `YSYX210295_REG_WR_EN;
								reg_rs1_addr = addr_rs1;
								reg_rs2_addr = addr_rs2;
								reg_wr_addr = addr_rd;
								
								jmp_flag = `YSYX210295_JMP_NOPE;
								load_code = `YSYX210295_LOAD_NOPE;
								store_code = `YSYX210295_STORE_NOPE;
								
								alu_add_sub = `YSYX210295_ALU_SUB_EN;
								alu_shift = `YSYX210295_ALU_SHIFT_L;
								word_intercept = `YSYX210295_INTERCEPT_EN;
								alu_operation = funct3;
								alu_op_num1	= data_rs1;
								alu_op_num2	= data_rs2;
								jmp_op_num1	= `YSYX210295_ZERO_DOUBLE;
								jmp_op_num2	= `YSYX210295_ZERO_DOUBLE;
								decode_except = `YSYX210295_EXCEPT_NOPE;
								except_cause = `YSYX210295_EXCEPT_NONE;
								csr_instr = `YSYX210295_CSR_CODE_NOPE;
								csr_addr = `YSYX210295_CSR_ADDR_ZERO;
							end
							default: begin
								reg_wr_en = `YSYX210295_REG_WR_DIS;
								reg_rs1_addr = `YSYX210295_REG_ADDR_ZERO;
								reg_rs2_addr = `YSYX210295_REG_ADDR_ZERO;
								reg_wr_addr = `YSYX210295_REG_ADDR_ZERO;
								
								jmp_flag = `YSYX210295_JMP_NOPE;
								load_code = `YSYX210295_LOAD_NOPE;
								store_code = `YSYX210295_STORE_NOPE;
								
								alu_add_sub = `YSYX210295_ALU_ADD_EN;
								alu_shift = `YSYX210295_ALU_SHIFT_L;
								word_intercept = `YSYX210295_INTERCEPT_EN;
								alu_operation = `YSYX210295_ALU_ADD;
								alu_op_num1	= `YSYX210295_ZERO_DOUBLE;
								alu_op_num2	= `YSYX210295_ZERO_DOUBLE;
								jmp_op_num1	= `YSYX210295_ZERO_DOUBLE;
								jmp_op_num2	= `YSYX210295_ZERO_DOUBLE;
								decode_except = `YSYX210295_EXCEPT_ACT;
								except_cause = `YSYX210295_EXCEPT_ID_ILLEGAL;
								csr_instr = `YSYX210295_CSR_CODE_NOPE;
								csr_addr = `YSYX210295_CSR_ADDR_ZERO;
							end
						endcase
					end
					`YSYX210295_INSTR_SLW: begin
						case(funct7)
							`YSYX210295_FUNCT7_R_ACT: begin
								reg_wr_en = `YSYX210295_REG_WR_EN;
								reg_rs1_addr = addr_rs1;
								reg_rs2_addr = addr_rs2;
								reg_wr_addr = addr_rd;
								
								jmp_flag = `YSYX210295_JMP_NOPE;
								load_code = `YSYX210295_LOAD_NOPE;
								store_code = `YSYX210295_STORE_NOPE;
								
								alu_add_sub = `YSYX210295_ALU_ADD_EN;
								alu_shift = `YSYX210295_ALU_SHIFT_L;
								word_intercept = `YSYX210295_INTERCEPT_EN;
								alu_operation = funct3;
								alu_op_num1	= data_rs1;
								alu_op_num2	= data_rs2;
								jmp_op_num1	= `YSYX210295_ZERO_DOUBLE;
								jmp_op_num2	= `YSYX210295_ZERO_DOUBLE;
								decode_except = `YSYX210295_EXCEPT_NOPE;
								except_cause = `YSYX210295_EXCEPT_NONE;
								csr_instr = `YSYX210295_CSR_CODE_NOPE;
								csr_addr = `YSYX210295_CSR_ADDR_ZERO;
							end
							default: begin
								reg_wr_en = `YSYX210295_REG_WR_DIS;
								reg_rs1_addr = `YSYX210295_REG_ADDR_ZERO;
								reg_rs2_addr = `YSYX210295_REG_ADDR_ZERO;
								reg_wr_addr = `YSYX210295_REG_ADDR_ZERO;
								
								jmp_flag = `YSYX210295_JMP_NOPE;
								load_code = `YSYX210295_LOAD_NOPE;
								store_code = `YSYX210295_STORE_NOPE;
								
								alu_add_sub = `YSYX210295_ALU_ADD_EN;
								alu_shift = `YSYX210295_ALU_SHIFT_L;
								word_intercept = `YSYX210295_INTERCEPT_EN;
								alu_operation = `YSYX210295_ALU_ADD;
								alu_op_num1	= `YSYX210295_ZERO_DOUBLE;
								alu_op_num2	= `YSYX210295_ZERO_DOUBLE;
								jmp_op_num1	= `YSYX210295_ZERO_DOUBLE;
								jmp_op_num2	= `YSYX210295_ZERO_DOUBLE;
								decode_except = `YSYX210295_EXCEPT_ACT;
								except_cause = `YSYX210295_EXCEPT_ID_ILLEGAL;
								csr_instr = `YSYX210295_CSR_CODE_NOPE;
								csr_addr = `YSYX210295_CSR_ADDR_ZERO;
							end
						endcase
					end
					`YSYX210295_INSTR_SRW: begin
						case(funct7)
							`YSYX210295_FUNCT7_SRLW: begin
								reg_wr_en = `YSYX210295_REG_WR_EN;
								reg_rs1_addr = addr_rs1;
								reg_rs2_addr = addr_rs2;
								reg_wr_addr = addr_rd;
								
								jmp_flag = `YSYX210295_JMP_NOPE;
								load_code = `YSYX210295_LOAD_NOPE;
								store_code = `YSYX210295_STORE_NOPE;
								
								alu_add_sub = `YSYX210295_ALU_ADD_EN;
								alu_shift = (funct7 == `YSYX210295_FUNCT7_SRAW) ? `YSYX210295_ALU_SHIFT_A : `YSYX210295_ALU_SHIFT_L;
								word_intercept = `YSYX210295_INTERCEPT_EN;
								alu_operation = funct3;
								alu_op_num1	= data_rs1;
								alu_op_num2	= data_rs2;
								jmp_op_num1	= `YSYX210295_ZERO_DOUBLE;
								jmp_op_num2	= `YSYX210295_ZERO_DOUBLE;
								decode_except = `YSYX210295_EXCEPT_NOPE;
								except_cause = `YSYX210295_EXCEPT_NONE;
								csr_instr = `YSYX210295_CSR_CODE_NOPE;
								csr_addr = `YSYX210295_CSR_ADDR_ZERO;
							end
							`YSYX210295_FUNCT7_SRAW: begin
								reg_wr_en = `YSYX210295_REG_WR_EN;
								reg_rs1_addr = addr_rs1;
								reg_rs2_addr = addr_rs2;
								reg_wr_addr = addr_rd;
								
								jmp_flag = `YSYX210295_JMP_NOPE;
								load_code = `YSYX210295_LOAD_NOPE;
								store_code = `YSYX210295_STORE_NOPE;
								
								alu_add_sub = `YSYX210295_ALU_ADD_EN;
								alu_shift = (funct7 == `YSYX210295_FUNCT7_SRAW) ? `YSYX210295_ALU_SHIFT_A : `YSYX210295_ALU_SHIFT_L;
								word_intercept = `YSYX210295_INTERCEPT_EN;
								alu_operation = funct3;
								alu_op_num1	= data_rs1;
								alu_op_num2	= data_rs2;
								jmp_op_num1	= `YSYX210295_ZERO_DOUBLE;
								jmp_op_num2	= `YSYX210295_ZERO_DOUBLE;
								decode_except = `YSYX210295_EXCEPT_NOPE;
								except_cause = `YSYX210295_EXCEPT_NONE;
								csr_instr = `YSYX210295_CSR_CODE_NOPE;
								csr_addr = `YSYX210295_CSR_ADDR_ZERO;
							end
							default: begin
								reg_wr_en = `YSYX210295_REG_WR_DIS;
								reg_rs1_addr = `YSYX210295_REG_ADDR_ZERO;
								reg_rs2_addr = `YSYX210295_REG_ADDR_ZERO;
								reg_wr_addr = `YSYX210295_REG_ADDR_ZERO;
								
								jmp_flag = `YSYX210295_JMP_NOPE;
								load_code = `YSYX210295_LOAD_NOPE;
								store_code = `YSYX210295_STORE_NOPE;
								
								alu_add_sub = `YSYX210295_ALU_ADD_EN;
								alu_shift = `YSYX210295_ALU_SHIFT_L;
								word_intercept = `YSYX210295_INTERCEPT_EN;
								alu_operation = `YSYX210295_ALU_ADD;
								alu_op_num1	= `YSYX210295_ZERO_DOUBLE;
								alu_op_num2	= `YSYX210295_ZERO_DOUBLE;
								jmp_op_num1	= `YSYX210295_ZERO_DOUBLE;
								jmp_op_num2	= `YSYX210295_ZERO_DOUBLE;
								decode_except = `YSYX210295_EXCEPT_ACT;
								except_cause = `YSYX210295_EXCEPT_ID_ILLEGAL;
								csr_instr = `YSYX210295_CSR_CODE_NOPE;
								csr_addr = `YSYX210295_CSR_ADDR_ZERO;
							end
						endcase
					end
					default: begin
						reg_wr_en = `YSYX210295_REG_WR_DIS;
						reg_rs1_addr = `YSYX210295_REG_ADDR_ZERO;
						reg_rs2_addr = `YSYX210295_REG_ADDR_ZERO;
						reg_wr_addr = `YSYX210295_REG_ADDR_ZERO;
						
						jmp_flag = `YSYX210295_JMP_NOPE;
						load_code = `YSYX210295_LOAD_NOPE;
						store_code = `YSYX210295_STORE_NOPE;
						
						alu_add_sub = `YSYX210295_ALU_ADD_EN;
						alu_shift = `YSYX210295_ALU_SHIFT_L;
						word_intercept = `YSYX210295_INTERCEPT_EN;
						alu_operation = `YSYX210295_ALU_ADD;
						alu_op_num1	= `YSYX210295_ZERO_DOUBLE;
						alu_op_num2	= `YSYX210295_ZERO_DOUBLE;
						jmp_op_num1	= `YSYX210295_ZERO_DOUBLE;
						jmp_op_num2	= `YSYX210295_ZERO_DOUBLE;
						decode_except = `YSYX210295_EXCEPT_ACT;
						except_cause = `YSYX210295_EXCEPT_ID_ILLEGAL;
						csr_instr = `YSYX210295_CSR_CODE_NOPE;
						csr_addr = `YSYX210295_CSR_ADDR_ZERO;
					end
				endcase
			end
								
			`YSYX210295_OPERATION_I: begin
				case(funct3)
					`YSYX210295_INSTR_SR: begin
						case(funct7_w)
							`YSYX210295_FUNCT7_W_SRL: begin
								reg_wr_en = `YSYX210295_REG_WR_EN;
								reg_rs1_addr = addr_rs1;
								reg_rs2_addr = `YSYX210295_REG_ADDR_ZERO;
								reg_wr_addr = addr_rd;
								
								jmp_flag = `YSYX210295_JMP_NOPE;
								load_code = `YSYX210295_LOAD_NOPE;
								store_code = `YSYX210295_STORE_NOPE;
				
								alu_add_sub = `YSYX210295_ALU_ADD_EN;
								alu_shift = `YSYX210295_ALU_SHIFT_L;
								word_intercept = `YSYX210295_INTERCEPT_DIS;
								alu_operation = funct3;
								alu_op_num1	= data_rs1;
								alu_op_num2	= {{52{instr[31]}},instr[31:20]};
								jmp_op_num1	= `YSYX210295_ZERO_DOUBLE;
								jmp_op_num2	= `YSYX210295_ZERO_DOUBLE;
								decode_except = `YSYX210295_EXCEPT_NOPE;
								except_cause = `YSYX210295_EXCEPT_NONE;
								csr_instr = `YSYX210295_CSR_CODE_NOPE;
								csr_addr = `YSYX210295_CSR_ADDR_ZERO;
							end
							`YSYX210295_FUNCT7_W_SRA: begin
								reg_wr_en = `YSYX210295_REG_WR_EN;
								reg_rs1_addr = addr_rs1;
								reg_rs2_addr = `YSYX210295_REG_ADDR_ZERO;
								reg_wr_addr = addr_rd;
								
								jmp_flag = `YSYX210295_JMP_NOPE;
								load_code = `YSYX210295_LOAD_NOPE;
								store_code = `YSYX210295_STORE_NOPE;
				
								alu_add_sub = `YSYX210295_ALU_ADD_EN;
								alu_shift = `YSYX210295_ALU_SHIFT_A;
								word_intercept = `YSYX210295_INTERCEPT_DIS;
								alu_operation = funct3;
								alu_op_num1	= data_rs1;
								alu_op_num2	= {{52{instr[31]}},instr[31:20]};
								jmp_op_num1	= `YSYX210295_ZERO_DOUBLE;
								jmp_op_num2	= `YSYX210295_ZERO_DOUBLE;
								decode_except = `YSYX210295_EXCEPT_NOPE;
								except_cause = `YSYX210295_EXCEPT_NONE;
								csr_instr = `YSYX210295_CSR_CODE_NOPE;
								csr_addr = `YSYX210295_CSR_ADDR_ZERO;
							end
							default: begin
								reg_wr_en = `YSYX210295_REG_WR_DIS;
								reg_rs1_addr = `YSYX210295_REG_ADDR_ZERO;
								reg_rs2_addr = `YSYX210295_REG_ADDR_ZERO;
								reg_wr_addr = `YSYX210295_REG_ADDR_ZERO;
								
								jmp_flag = `YSYX210295_JMP_NOPE;
								load_code = `YSYX210295_LOAD_NOPE;
								store_code = `YSYX210295_STORE_NOPE;
								
								alu_add_sub = `YSYX210295_ALU_ADD_EN;
								alu_shift = `YSYX210295_ALU_SHIFT_L;
								word_intercept = `YSYX210295_INTERCEPT_EN;
								alu_operation = `YSYX210295_ALU_ADD;
								alu_op_num1	= `YSYX210295_ZERO_DOUBLE;
								alu_op_num2	= `YSYX210295_ZERO_DOUBLE;
								jmp_op_num1	= `YSYX210295_ZERO_DOUBLE;
								jmp_op_num2	= `YSYX210295_ZERO_DOUBLE;
								decode_except = `YSYX210295_EXCEPT_ACT;
								except_cause = `YSYX210295_EXCEPT_ID_ILLEGAL;
								csr_instr = `YSYX210295_CSR_CODE_NOPE;
								csr_addr = `YSYX210295_CSR_ADDR_ZERO;
							end
						endcase
					end
					`YSYX210295_INSTR_SL: begin
						case(funct7_w)
							`YSYX210295_FUNCT7_W_SLL: begin
								reg_wr_en = `YSYX210295_REG_WR_EN;
								reg_rs1_addr = addr_rs1;
								reg_rs2_addr = `YSYX210295_REG_ADDR_ZERO;
								reg_wr_addr = addr_rd;
								
								jmp_flag = `YSYX210295_JMP_NOPE;
								load_code = `YSYX210295_LOAD_NOPE;
								store_code = `YSYX210295_STORE_NOPE;
				
								alu_add_sub = `YSYX210295_ALU_ADD_EN;
								alu_shift = `YSYX210295_ALU_SHIFT_L;
								word_intercept = `YSYX210295_INTERCEPT_DIS;
								alu_operation = funct3;
								alu_op_num1	= data_rs1;
								alu_op_num2	= {{52{instr[31]}},instr[31:20]};
								jmp_op_num1	= `YSYX210295_ZERO_DOUBLE;
								jmp_op_num2	= `YSYX210295_ZERO_DOUBLE;
								decode_except = `YSYX210295_EXCEPT_NOPE;
								except_cause = `YSYX210295_EXCEPT_NONE;
								csr_instr = `YSYX210295_CSR_CODE_NOPE;
								csr_addr = `YSYX210295_CSR_ADDR_ZERO;
							end
							default: begin
								reg_wr_en = `YSYX210295_REG_WR_DIS;
								reg_rs1_addr = `YSYX210295_REG_ADDR_ZERO;
								reg_rs2_addr = `YSYX210295_REG_ADDR_ZERO;
								reg_wr_addr = `YSYX210295_REG_ADDR_ZERO;
								
								jmp_flag = `YSYX210295_JMP_NOPE;
								load_code = `YSYX210295_LOAD_NOPE;
								store_code = `YSYX210295_STORE_NOPE;
								
								alu_add_sub = `YSYX210295_ALU_ADD_EN;
								alu_shift = `YSYX210295_ALU_SHIFT_L;
								word_intercept = `YSYX210295_INTERCEPT_EN;
								alu_operation = `YSYX210295_ALU_ADD;
								alu_op_num1	= `YSYX210295_ZERO_DOUBLE;
								alu_op_num2	= `YSYX210295_ZERO_DOUBLE;
								jmp_op_num1	= `YSYX210295_ZERO_DOUBLE;
								jmp_op_num2	= `YSYX210295_ZERO_DOUBLE;
								decode_except = `YSYX210295_EXCEPT_ACT;
								except_cause = `YSYX210295_EXCEPT_ID_ILLEGAL;
								csr_instr = `YSYX210295_CSR_CODE_NOPE;
								csr_addr = `YSYX210295_CSR_ADDR_ZERO;
							end
						endcase
					end
					`YSYX210295_INSTR_ADD,`YSYX210295_INSTR_SLT,`YSYX210295_INSTR_SLTU,`YSYX210295_INSTR_XOR,`YSYX210295_INSTR_OR,`YSYX210295_INSTR_AND: begin
						reg_wr_en = `YSYX210295_REG_WR_EN;
						reg_rs1_addr = addr_rs1;
						reg_rs2_addr = `YSYX210295_REG_ADDR_ZERO;
						reg_wr_addr = addr_rd;
						
						jmp_flag = `YSYX210295_JMP_NOPE;
						load_code = `YSYX210295_LOAD_NOPE;
						store_code = `YSYX210295_STORE_NOPE;
		
						alu_add_sub = `YSYX210295_ALU_ADD_EN;
						alu_shift = `YSYX210295_ALU_SHIFT_L;
						word_intercept = `YSYX210295_INTERCEPT_DIS;
						alu_operation = funct3;
						alu_op_num1	= data_rs1;
						alu_op_num2	= {{52{instr[31]}},instr[31:20]};
						jmp_op_num1	= `YSYX210295_ZERO_DOUBLE;
						jmp_op_num2	= `YSYX210295_ZERO_DOUBLE;
						decode_except = `YSYX210295_EXCEPT_NOPE;
						except_cause = `YSYX210295_EXCEPT_NONE;
						csr_instr = `YSYX210295_CSR_CODE_NOPE;
						csr_addr = `YSYX210295_CSR_ADDR_ZERO;
					end
					default: begin
						reg_wr_en = `YSYX210295_REG_WR_DIS;
						reg_rs1_addr = `YSYX210295_REG_ADDR_ZERO;
						reg_rs2_addr = `YSYX210295_REG_ADDR_ZERO;
						reg_wr_addr = `YSYX210295_REG_ADDR_ZERO;
						
						jmp_flag = `YSYX210295_JMP_NOPE;
						load_code = `YSYX210295_LOAD_NOPE;
						store_code = `YSYX210295_STORE_NOPE;
						
						alu_add_sub = `YSYX210295_ALU_ADD_EN;
						alu_shift = `YSYX210295_ALU_SHIFT_L;
						word_intercept = `YSYX210295_INTERCEPT_EN;
						alu_operation = `YSYX210295_ALU_ADD;
						alu_op_num1	= `YSYX210295_ZERO_DOUBLE;
						alu_op_num2	= `YSYX210295_ZERO_DOUBLE;
						jmp_op_num1	= `YSYX210295_ZERO_DOUBLE;
						jmp_op_num2	= `YSYX210295_ZERO_DOUBLE;
						decode_except = `YSYX210295_EXCEPT_ACT;
						except_cause = `YSYX210295_EXCEPT_ID_ILLEGAL;
						csr_instr = `YSYX210295_CSR_CODE_NOPE;
						csr_addr = `YSYX210295_CSR_ADDR_ZERO;
					end
				endcase
			end
			
			`YSYX210295_OPERATION_IW: begin
				case(funct3)
					`YSYX210295_INSTR_ADDW,`YSYX210295_INSTR_SLW,`YSYX210295_INSTR_SRW: begin
						reg_wr_en = `YSYX210295_REG_WR_EN;
						reg_rs1_addr = addr_rs1;
						reg_rs2_addr = `YSYX210295_REG_ADDR_ZERO;
						reg_wr_addr = addr_rd;
						
						jmp_flag = `YSYX210295_JMP_NOPE;
						load_code = `YSYX210295_LOAD_NOPE;
						store_code = `YSYX210295_STORE_NOPE;
	
						alu_add_sub = `YSYX210295_ALU_ADD_EN;
						alu_shift = (funct7 == `YSYX210295_FUNCT7_SRA) ? `YSYX210295_ALU_SHIFT_A : `YSYX210295_ALU_SHIFT_L;
						word_intercept = `YSYX210295_INTERCEPT_EN;
						alu_operation = funct3;
						alu_op_num1	= data_rs1;
						alu_op_num2	= {{52{instr[31]}},instr[31:20]};
						jmp_op_num1	= `YSYX210295_ZERO_DOUBLE;
						jmp_op_num2	= `YSYX210295_ZERO_DOUBLE;
						decode_except = `YSYX210295_EXCEPT_NOPE;
						except_cause = `YSYX210295_EXCEPT_NONE;
						csr_instr = `YSYX210295_CSR_CODE_NOPE;
						csr_addr = `YSYX210295_CSR_ADDR_ZERO;
					end
					
					default: begin
						reg_wr_en = `YSYX210295_REG_WR_DIS;
						reg_rs1_addr = `YSYX210295_REG_ADDR_ZERO;
						reg_rs2_addr = `YSYX210295_REG_ADDR_ZERO;
						reg_wr_addr = `YSYX210295_REG_ADDR_ZERO;
						
						jmp_flag = `YSYX210295_JMP_NOPE;
						load_code = `YSYX210295_LOAD_NOPE;
						store_code = `YSYX210295_STORE_NOPE;
						
						alu_add_sub = `YSYX210295_ALU_ADD_EN;
						alu_shift = `YSYX210295_ALU_SHIFT_L;
						word_intercept = `YSYX210295_INTERCEPT_EN;
						alu_operation = `YSYX210295_ALU_ADD;
						alu_op_num1	= `YSYX210295_ZERO_DOUBLE;
						alu_op_num2	= `YSYX210295_ZERO_DOUBLE;
						jmp_op_num1	= `YSYX210295_ZERO_DOUBLE;
						jmp_op_num2	= `YSYX210295_ZERO_DOUBLE;
						decode_except = `YSYX210295_EXCEPT_ACT;
						except_cause = `YSYX210295_EXCEPT_ID_ILLEGAL;
						csr_instr = `YSYX210295_CSR_CODE_NOPE;
						csr_addr = `YSYX210295_CSR_ADDR_ZERO;
					end
				endcase
			end
								
			`YSYX210295_OPERATION_LUI: begin
				reg_wr_en = `YSYX210295_REG_WR_EN;
				reg_rs1_addr = `YSYX210295_REG_ADDR_ZERO;
				reg_rs2_addr = `YSYX210295_REG_ADDR_ZERO;
				reg_wr_addr = addr_rd;

				jmp_flag = `YSYX210295_JMP_NOPE;
				load_code = `YSYX210295_LOAD_NOPE;
				store_code = `YSYX210295_STORE_NOPE;
				
				alu_add_sub = `YSYX210295_ALU_ADD_EN;
				alu_shift = `YSYX210295_ALU_SHIFT_L;
				alu_operation = `YSYX210295_ALU_ADD;
				word_intercept = `YSYX210295_INTERCEPT_DIS;
				alu_op_num1	= {{32{instr[31]}},instr[31:12],12'h0};
				alu_op_num2	= `YSYX210295_ZERO_DOUBLE;
				jmp_op_num1	= `YSYX210295_ZERO_DOUBLE;
				jmp_op_num2	= `YSYX210295_ZERO_DOUBLE;
				decode_except = `YSYX210295_EXCEPT_NOPE;
				except_cause = `YSYX210295_EXCEPT_NONE;
				csr_instr = `YSYX210295_CSR_CODE_NOPE;
				csr_addr = `YSYX210295_CSR_ADDR_ZERO;
			end
								
			`YSYX210295_OPERATION_LOAD: begin
				case(funct3)
					`YSYX210295_INSTR_LB,`YSYX210295_INSTR_LH,`YSYX210295_INSTR_LW,`YSYX210295_INSTR_LD,`YSYX210295_INSTR_LBU,`YSYX210295_INSTR_LHU,`YSYX210295_INSTR_LWU: begin
						reg_wr_en = `YSYX210295_REG_WR_EN;
						reg_rs1_addr = addr_rs1;
						reg_rs2_addr = `YSYX210295_REG_ADDR_ZERO;
						reg_wr_addr = addr_rd;

						jmp_flag = `YSYX210295_JMP_NOPE;
						load_code = funct3;
						store_code = `YSYX210295_STORE_NOPE;
						
						alu_add_sub = `YSYX210295_ALU_ADD_EN;
						alu_shift = `YSYX210295_ALU_SHIFT_L;
						word_intercept = `YSYX210295_INTERCEPT_DIS;
						alu_operation = `YSYX210295_ALU_ADD;
						alu_op_num1	= data_rs1;
						alu_op_num2	= {{52{instr[31]}},instr[31:20]};
						jmp_op_num1	= `YSYX210295_ZERO_DOUBLE;
						jmp_op_num2	= `YSYX210295_ZERO_DOUBLE;
						decode_except = `YSYX210295_EXCEPT_NOPE;
						except_cause = `YSYX210295_EXCEPT_NONE;
						csr_instr = `YSYX210295_CSR_CODE_NOPE;
						csr_addr = `YSYX210295_CSR_ADDR_ZERO;
					end
					default: begin
						reg_wr_en = `YSYX210295_REG_WR_DIS;
						reg_rs1_addr = `YSYX210295_REG_ADDR_ZERO;
						reg_rs2_addr = `YSYX210295_REG_ADDR_ZERO;
						reg_wr_addr = `YSYX210295_REG_ADDR_ZERO;

						jmp_flag = `YSYX210295_JMP_NOPE;
						load_code = `YSYX210295_LOAD_NOPE;
						store_code = `YSYX210295_STORE_NOPE;

						alu_add_sub = `YSYX210295_ALU_ADD_EN;
						alu_shift = `YSYX210295_ALU_SHIFT_L;
						word_intercept = `YSYX210295_INTERCEPT_DIS;
						alu_operation = `YSYX210295_ALU_ADD;
						alu_op_num1	= `YSYX210295_ZERO_DOUBLE;
						alu_op_num2	= `YSYX210295_ZERO_DOUBLE;
						jmp_op_num1	= `YSYX210295_ZERO_DOUBLE;
						jmp_op_num2	= `YSYX210295_ZERO_DOUBLE;
						decode_except = `YSYX210295_EXCEPT_ACT;
						except_cause = `YSYX210295_EXCEPT_ID_ILLEGAL;
						csr_instr = `YSYX210295_CSR_CODE_NOPE;
						csr_addr = `YSYX210295_CSR_ADDR_ZERO;
					end
				endcase
			end

			`YSYX210295_OPERATION_S: begin
				case(funct3)
					`YSYX210295_INSTR_SB,`YSYX210295_INSTR_SH,`YSYX210295_INSTR_SW,`YSYX210295_INSTR_SD: begin
						reg_wr_en = `YSYX210295_REG_WR_DIS;
						reg_rs1_addr = addr_rs1;
						reg_rs2_addr = addr_rs2;
						reg_wr_addr = `YSYX210295_REG_ADDR_ZERO;

						jmp_flag = `YSYX210295_JMP_NOPE;
						load_code = `YSYX210295_LOAD_NOPE;
						store_code = funct3;
						
						alu_add_sub = `YSYX210295_ALU_ADD_EN;
						alu_shift = `YSYX210295_ALU_SHIFT_L;
						word_intercept = `YSYX210295_INTERCEPT_DIS;
						alu_operation = `YSYX210295_ALU_ADD;
						alu_op_num1	= data_rs1;
						alu_op_num2	= {{52{instr[31]}}, instr[31:25], instr[11:7]};
						jmp_op_num1	= `YSYX210295_ZERO_DOUBLE;
						jmp_op_num2	= `YSYX210295_ZERO_DOUBLE;
						decode_except = `YSYX210295_EXCEPT_NOPE;
						except_cause = `YSYX210295_EXCEPT_NONE;
						csr_instr = `YSYX210295_CSR_CODE_NOPE;
						csr_addr = `YSYX210295_CSR_ADDR_ZERO;
					end
					default: begin
						reg_wr_en = `YSYX210295_REG_WR_DIS;
						reg_rs1_addr = `YSYX210295_REG_ADDR_ZERO;
						reg_rs2_addr = `YSYX210295_REG_ADDR_ZERO;
						reg_wr_addr = `YSYX210295_REG_ADDR_ZERO;

						jmp_flag = `YSYX210295_JMP_NOPE;
						load_code = `YSYX210295_LOAD_NOPE;
						store_code = `YSYX210295_STORE_NOPE;

						alu_add_sub = `YSYX210295_ALU_ADD_EN;
						alu_shift = `YSYX210295_ALU_SHIFT_L;
						word_intercept = `YSYX210295_INTERCEPT_DIS;
						alu_operation = `YSYX210295_ALU_ADD;
						alu_op_num1	= `YSYX210295_ZERO_DOUBLE;
						alu_op_num2	= `YSYX210295_ZERO_DOUBLE;
						jmp_op_num1	= `YSYX210295_ZERO_DOUBLE;
						jmp_op_num2	= `YSYX210295_ZERO_DOUBLE;
						decode_except = `YSYX210295_EXCEPT_ACT;
						except_cause = `YSYX210295_EXCEPT_ID_ILLEGAL;
						csr_instr = `YSYX210295_CSR_CODE_NOPE;
						csr_addr = `YSYX210295_CSR_ADDR_ZERO;
					end
				endcase
			end

			`YSYX210295_OPERATION_B: begin				
				case(funct3)
					`YSYX210295_INSTR_BEQ,`YSYX210295_INSTR_BNE,`YSYX210295_INSTR_BLT,`YSYX210295_INSTR_BGE,`YSYX210295_INSTR_BLTU,`YSYX210295_INSTR_BGEU: begin
						reg_wr_en = `YSYX210295_REG_WR_DIS;
						reg_rs1_addr = addr_rs1;
						reg_rs2_addr = addr_rs2;
						reg_wr_addr = `YSYX210295_REG_ADDR_ZERO;

						jmp_flag = funct3;
						load_code = `YSYX210295_LOAD_NOPE;
						store_code = `YSYX210295_STORE_NOPE;
						
						alu_add_sub = `YSYX210295_ALU_ADD_EN;
						alu_shift = `YSYX210295_ALU_SHIFT_L;
						word_intercept = `YSYX210295_INTERCEPT_DIS;
						alu_operation = `YSYX210295_ALU_ADD;
						alu_op_num1 = data_rs1;
						alu_op_num2 = data_rs2;
						jmp_op_num1	= addr_instr;
						jmp_op_num2	= {{52{instr[31]}},instr[7],instr[30:25], instr[11:8],1'b0};
						decode_except = `YSYX210295_EXCEPT_NOPE;
						except_cause = `YSYX210295_EXCEPT_NONE;
						csr_instr = `YSYX210295_CSR_CODE_NOPE;
						csr_addr = `YSYX210295_CSR_ADDR_ZERO;
					end
					default: begin
						reg_wr_en = `YSYX210295_REG_WR_DIS;
						reg_rs1_addr = `YSYX210295_REG_ADDR_ZERO;
						reg_rs2_addr = `YSYX210295_REG_ADDR_ZERO;
						reg_wr_addr = `YSYX210295_REG_ADDR_ZERO;

						jmp_flag = `YSYX210295_JMP_NOPE;
						load_code = `YSYX210295_LOAD_NOPE;
						store_code = `YSYX210295_STORE_NOPE;

						alu_add_sub = `YSYX210295_ALU_ADD_EN;
						alu_shift = `YSYX210295_ALU_SHIFT_L;
						word_intercept = `YSYX210295_INTERCEPT_DIS;
						alu_operation = `YSYX210295_ALU_ADD;
						alu_op_num1	= `YSYX210295_ZERO_DOUBLE;
						alu_op_num2	= `YSYX210295_ZERO_DOUBLE;
						jmp_op_num1	= `YSYX210295_ZERO_DOUBLE;
						jmp_op_num2	= `YSYX210295_ZERO_DOUBLE;
						decode_except = `YSYX210295_EXCEPT_ACT;
						except_cause = `YSYX210295_EXCEPT_ID_ILLEGAL;
						csr_instr = `YSYX210295_CSR_CODE_NOPE;
						csr_addr = `YSYX210295_CSR_ADDR_ZERO;
					end
				endcase
			end

			`YSYX210295_OPERATION_J: begin
				reg_wr_en = `YSYX210295_REG_WR_EN;
				reg_rs1_addr = `YSYX210295_REG_ADDR_ZERO;
				reg_rs2_addr = `YSYX210295_REG_ADDR_ZERO;
				reg_wr_addr = addr_rd;

				jmp_flag = `YSYX210295_JMP_J;
				load_code = `YSYX210295_LOAD_NOPE;
				store_code = `YSYX210295_STORE_NOPE;
				
				alu_add_sub = `YSYX210295_ALU_ADD_EN;
				alu_shift = `YSYX210295_ALU_SHIFT_L;
				word_intercept = `YSYX210295_INTERCEPT_DIS;
				alu_operation = `YSYX210295_ALU_ADD;
				alu_op_num1 = addr_instr;
				alu_op_num2 = `YSYX210295_PC_STEP;
				jmp_op_num1	= addr_instr;
				jmp_op_num2	= {{44{instr[31]}},instr[19:12],instr[20],instr[30:21],1'b0};
				decode_except = `YSYX210295_EXCEPT_NOPE;
				except_cause = `YSYX210295_EXCEPT_NONE;
				csr_instr = `YSYX210295_CSR_CODE_NOPE;
				csr_addr = `YSYX210295_CSR_ADDR_ZERO;
			end

			`YSYX210295_OPERATION_JR: begin
				case(funct3)
					`YSYX210295_INSTR_JALR: begin
						reg_wr_en = `YSYX210295_REG_WR_EN;
						reg_rs1_addr = addr_rs1;
						reg_rs2_addr = `YSYX210295_REG_ADDR_ZERO;
						reg_wr_addr = addr_rd;
						
						alu_add_sub = `YSYX210295_ALU_ADD_EN;
						alu_shift = `YSYX210295_ALU_SHIFT_L;
						alu_operation = `YSYX210295_ALU_ADD;
						word_intercept = `YSYX210295_INTERCEPT_DIS;
						alu_op_num1 = addr_instr;
					
						alu_op_num2 = `YSYX210295_PC_STEP;
					
						jmp_op_num1	= data_rs1;
						jmp_op_num2	= {{52{instr[31]}},instr[31:20]};

						jmp_flag = `YSYX210295_JMP_J;
						load_code = `YSYX210295_LOAD_NOPE;
						store_code = `YSYX210295_STORE_NOPE;
						decode_except = `YSYX210295_EXCEPT_NOPE;
						except_cause = `YSYX210295_EXCEPT_NONE;
						csr_instr = `YSYX210295_CSR_CODE_NOPE;
						csr_addr = `YSYX210295_CSR_ADDR_ZERO;
					end
					default: begin
						reg_wr_en = `YSYX210295_REG_WR_DIS;
						reg_rs1_addr = `YSYX210295_REG_ADDR_ZERO;
						reg_rs2_addr = `YSYX210295_REG_ADDR_ZERO;
						reg_wr_addr = `YSYX210295_REG_ADDR_ZERO;

						jmp_flag = `YSYX210295_JMP_NOPE;
						load_code = `YSYX210295_LOAD_NOPE;
						store_code = `YSYX210295_STORE_NOPE;

						alu_add_sub = `YSYX210295_ALU_ADD_EN;
						alu_shift = `YSYX210295_ALU_SHIFT_L;
						word_intercept = `YSYX210295_INTERCEPT_DIS;
						alu_operation = `YSYX210295_ALU_ADD;
						alu_op_num1	= `YSYX210295_ZERO_DOUBLE;
						alu_op_num2	= `YSYX210295_ZERO_DOUBLE;
						jmp_op_num1	= `YSYX210295_ZERO_DOUBLE;
						jmp_op_num2	= `YSYX210295_ZERO_DOUBLE;
						decode_except = `YSYX210295_EXCEPT_ACT;
						except_cause = `YSYX210295_EXCEPT_ID_ILLEGAL;
						csr_instr = `YSYX210295_CSR_CODE_NOPE;
						csr_addr = `YSYX210295_CSR_ADDR_ZERO;
					end
				endcase
			end

			`YSYX210295_OPERATION_AUIPC: begin
				reg_wr_en = `YSYX210295_REG_WR_EN;
				reg_rs1_addr = `YSYX210295_REG_ADDR_ZERO;
				reg_rs2_addr = `YSYX210295_REG_ADDR_ZERO;
				reg_wr_addr = addr_rd;
				
				alu_add_sub = `YSYX210295_ALU_ADD_EN;
				alu_shift = `YSYX210295_ALU_SHIFT_L;
				alu_operation = `YSYX210295_ALU_ADD;
				word_intercept = `YSYX210295_INTERCEPT_DIS;
				alu_op_num1 = addr_instr;
				alu_op_num2 = {{32{instr[31]}},instr[31:12],12'd0};
				jmp_op_num1	= `YSYX210295_ZERO_DOUBLE;
				jmp_op_num2	= `YSYX210295_ZERO_DOUBLE;

				jmp_flag = `YSYX210295_JMP_NOPE;
				load_code = `YSYX210295_LOAD_NOPE;
				store_code = `YSYX210295_STORE_NOPE;
				decode_except = `YSYX210295_EXCEPT_NOPE;
				except_cause = `YSYX210295_EXCEPT_NONE;
				csr_instr = `YSYX210295_CSR_CODE_NOPE;
				csr_addr = `YSYX210295_CSR_ADDR_ZERO;
			end
			
			`YSYX210295_OPERATION_SYS: begin
				case(funct3)
					`YSYX210295_INSTR_IRQ: begin
						case(instr)
							`YSYX210295_INSTR_EBREAK: begin
								reg_wr_en = `YSYX210295_REG_WR_DIS;
								reg_rs1_addr = `YSYX210295_REG_ADDR_ZERO;
								reg_rs2_addr = `YSYX210295_REG_ADDR_ZERO;
								reg_wr_addr = `YSYX210295_REG_ADDR_ZERO;

								jmp_flag = `YSYX210295_JMP_NOPE;
								load_code = `YSYX210295_LOAD_NOPE;
								store_code = `YSYX210295_STORE_NOPE;

								alu_add_sub = `YSYX210295_ALU_ADD_EN;
								alu_shift = `YSYX210295_ALU_SHIFT_L;
								word_intercept = `YSYX210295_INTERCEPT_DIS;
								alu_operation = `YSYX210295_ALU_ADD;
								alu_op_num1	= `YSYX210295_ZERO_DOUBLE;
								alu_op_num2	= `YSYX210295_ZERO_DOUBLE;
								jmp_op_num1	= `YSYX210295_ZERO_DOUBLE;
								jmp_op_num2	= `YSYX210295_ZERO_DOUBLE;
								decode_except = `YSYX210295_EXCEPT_ACT;
								except_cause = `YSYX210295_EXCEPT_EBREAK;
								csr_instr = `YSYX210295_CSR_CODE_NOPE;
								csr_addr = `YSYX210295_CSR_ADDR_ZERO;
							end
							
							`YSYX210295_INSTR_ECALL: begin
								reg_wr_en = `YSYX210295_REG_WR_DIS;
								reg_rs1_addr = `YSYX210295_REG_ADDR_ZERO;
								reg_rs2_addr = `YSYX210295_REG_ADDR_ZERO;
								reg_wr_addr = `YSYX210295_REG_ADDR_ZERO;
		
								jmp_flag = `YSYX210295_JMP_NOPE;
							//    jmp_flag = `YSYX210295_JMP_J;
								load_code = `YSYX210295_LOAD_NOPE;
								store_code = `YSYX210295_STORE_NOPE;
		
								alu_add_sub = `YSYX210295_ALU_ADD_EN;
								alu_shift = `YSYX210295_ALU_SHIFT_L;
								word_intercept = `YSYX210295_INTERCEPT_DIS;
								alu_operation = `YSYX210295_ALU_ADD;
								alu_op_num1	= `YSYX210295_ZERO_DOUBLE;
								alu_op_num2	= `YSYX210295_ZERO_DOUBLE;
								jmp_op_num1	= `YSYX210295_ZERO_DOUBLE;
								jmp_op_num2	= `YSYX210295_ZERO_DOUBLE;
								decode_except = `YSYX210295_EXCEPT_ACT;
								except_cause = `YSYX210295_EXCEPT_ECALL;
								csr_instr = `YSYX210295_CSR_CODE_NOPE;
								csr_addr = `YSYX210295_CSR_ADDR_ZERO;
							end
							`YSYX210295_INSTR_MRET: begin
								reg_wr_en = `YSYX210295_REG_WR_DIS;
								reg_rs1_addr = `YSYX210295_REG_ADDR_ZERO;
								reg_rs2_addr = `YSYX210295_REG_ADDR_ZERO;
								reg_wr_addr = `YSYX210295_REG_ADDR_ZERO;

								jmp_flag = `YSYX210295_JMP_NOPE;
								load_code = `YSYX210295_LOAD_NOPE;
								store_code = `YSYX210295_STORE_NOPE;

								alu_add_sub = `YSYX210295_ALU_ADD_EN;
								alu_shift = `YSYX210295_ALU_SHIFT_L;
								word_intercept = `YSYX210295_INTERCEPT_DIS;
								alu_operation = `YSYX210295_ALU_ADD;
								alu_op_num1	= `YSYX210295_ZERO_DOUBLE;
								alu_op_num2	= `YSYX210295_ZERO_DOUBLE;
								jmp_op_num1	= `YSYX210295_ZERO_DOUBLE;
								jmp_op_num2	= `YSYX210295_ZERO_DOUBLE;
								decode_except = `YSYX210295_EXCEPT_ACT;
								//decode_except = `YSYX210295_EXCEPT_NOPE;   // by ou
								except_cause = `YSYX210295_EXCEPT_MRET;
								csr_instr = `YSYX210295_CSR_CODE_NOPE;
								csr_addr = `YSYX210295_CSR_ADDR_ZERO;
							end
							
							default: begin
								reg_wr_en = `YSYX210295_REG_WR_DIS;
								reg_rs1_addr = `YSYX210295_REG_ADDR_ZERO;
								reg_rs2_addr = `YSYX210295_REG_ADDR_ZERO;
								reg_wr_addr = `YSYX210295_REG_ADDR_ZERO;	

								jmp_flag = `YSYX210295_JMP_NOPE;
								load_code = `YSYX210295_LOAD_NOPE;
								store_code = `YSYX210295_STORE_NOPE;

								alu_add_sub = `YSYX210295_ALU_ADD_EN;
								alu_shift = `YSYX210295_ALU_SHIFT_L;
								word_intercept = `YSYX210295_INTERCEPT_DIS;
								alu_operation = `YSYX210295_ALU_ADD;
								alu_op_num1	= `YSYX210295_ZERO_DOUBLE;
								alu_op_num2	= `YSYX210295_ZERO_DOUBLE;
								jmp_op_num1	= `YSYX210295_ZERO_DOUBLE;
								jmp_op_num2	= `YSYX210295_ZERO_DOUBLE;
								decode_except = `YSYX210295_EXCEPT_ACT;
								except_cause = `YSYX210295_EXCEPT_ID_ILLEGAL;
								csr_instr = `YSYX210295_CSR_CODE_NOPE;
								csr_addr = `YSYX210295_CSR_ADDR_ZERO;
							end
						endcase
					end
					
					`YSYX210295_INSTR_CSRRW: begin
						reg_wr_en = `YSYX210295_REG_WR_EN;
						reg_rs1_addr = addr_rs1;
						reg_rs2_addr = `YSYX210295_REG_ADDR_ZERO;
						reg_wr_addr = addr_rd;
				
						jmp_flag = `YSYX210295_JMP_NOPE;
						load_code = `YSYX210295_LOAD_NOPE;
						store_code = `YSYX210295_STORE_NOPE;
						
						alu_add_sub = `YSYX210295_ALU_ADD_EN;
						alu_shift = `YSYX210295_ALU_SHIFT_L;
						word_intercept = `YSYX210295_INTERCEPT_DIS;
						alu_operation = `YSYX210295_ALU_ADD;
						alu_op_num1	= csr_data_i;
                           
						alu_op_num2	= `YSYX210295_ZERO_DOUBLE;
						jmp_op_num1	= `YSYX210295_ZERO_DOUBLE;
						jmp_op_num2	= `YSYX210295_ZERO_DOUBLE;
						decode_except = `YSYX210295_EXCEPT_NOPE;
						except_cause = `YSYX210295_EXCEPT_NONE;
						csr_instr = `YSYX210295_CSR_CODE_CSRRW;
						csr_addr = instr[31:20];
					end
					
					`YSYX210295_INSTR_CSRRS: begin
						reg_wr_en = `YSYX210295_REG_WR_EN;
						reg_rs1_addr = addr_rs1;
						reg_rs2_addr = `YSYX210295_REG_ADDR_ZERO;
						reg_wr_addr = addr_rd;
				
						jmp_flag = `YSYX210295_JMP_NOPE;
						load_code = `YSYX210295_LOAD_NOPE;
						store_code = `YSYX210295_STORE_NOPE;
						
						alu_add_sub = `YSYX210295_ALU_ADD_EN;
						alu_shift = `YSYX210295_ALU_SHIFT_L;
						word_intercept = `YSYX210295_INTERCEPT_DIS;
						alu_operation = `YSYX210295_ALU_ADD;
						alu_op_num1	= csr_data_i;
						alu_op_num2	= `YSYX210295_ZERO_DOUBLE;
						jmp_op_num1	= `YSYX210295_ZERO_DOUBLE;
						jmp_op_num2	= `YSYX210295_ZERO_DOUBLE;
						decode_except = `YSYX210295_EXCEPT_NOPE;
						except_cause = `YSYX210295_EXCEPT_NONE;
						csr_instr = `YSYX210295_CSR_CODE_CSRRS;
						csr_addr = instr[31:20];
					end
					
					`YSYX210295_INSTR_CSRRC: begin
						reg_wr_en = `YSYX210295_REG_WR_EN;
						reg_rs1_addr = addr_rs1;
						reg_rs2_addr = `YSYX210295_REG_ADDR_ZERO;
						reg_wr_addr = addr_rd;
				
						jmp_flag = `YSYX210295_JMP_NOPE;
						load_code = `YSYX210295_LOAD_NOPE;
						store_code = `YSYX210295_STORE_NOPE;
						
						alu_add_sub = `YSYX210295_ALU_ADD_EN;
						alu_shift = `YSYX210295_ALU_SHIFT_L;
						word_intercept = `YSYX210295_INTERCEPT_DIS;
						alu_operation = `YSYX210295_ALU_ADD;
						alu_op_num1	= csr_data_i;
						alu_op_num2	= `YSYX210295_ZERO_DOUBLE;
						jmp_op_num1	= `YSYX210295_ZERO_DOUBLE;
						jmp_op_num2	= `YSYX210295_ZERO_DOUBLE;
						decode_except = `YSYX210295_EXCEPT_NOPE;
						except_cause = `YSYX210295_EXCEPT_NONE;
						csr_instr = `YSYX210295_CSR_CODE_CSRRC;
						csr_addr = instr[31:20];
					end
					
					`YSYX210295_INSTR_CSRRWI: begin
						reg_wr_en = `YSYX210295_REG_WR_EN;
						reg_rs1_addr = `YSYX210295_REG_ADDR_ZERO;
						reg_rs2_addr = `YSYX210295_REG_ADDR_ZERO;
						reg_wr_addr = addr_rd;
				
						jmp_flag = `YSYX210295_JMP_NOPE;
						load_code = `YSYX210295_LOAD_NOPE;
						store_code = `YSYX210295_STORE_NOPE;
						
						alu_add_sub = `YSYX210295_ALU_ADD_EN;
						alu_shift = `YSYX210295_ALU_SHIFT_L;
						word_intercept = `YSYX210295_INTERCEPT_DIS;
						alu_operation = `YSYX210295_ALU_ADD;
						alu_op_num1	= csr_data_i;
						alu_op_num2	= {59'b0,instr[19:15]};
						jmp_op_num1	= `YSYX210295_ZERO_DOUBLE;
						jmp_op_num2	= `YSYX210295_ZERO_DOUBLE;
						decode_except = `YSYX210295_EXCEPT_NOPE;
						except_cause = `YSYX210295_EXCEPT_NONE;
						csr_instr = `YSYX210295_CSR_CODE_CSRRWI;
						csr_addr = instr[31:20];
					end
					
					`YSYX210295_INSTR_CSRRSI: begin
						reg_wr_en = `YSYX210295_REG_WR_EN;
						reg_rs1_addr = `YSYX210295_REG_ADDR_ZERO;
						reg_rs2_addr = `YSYX210295_REG_ADDR_ZERO;
						reg_wr_addr = addr_rd;
				
						jmp_flag = `YSYX210295_JMP_NOPE;
						load_code = `YSYX210295_LOAD_NOPE;
						store_code = `YSYX210295_STORE_NOPE;
						
						alu_add_sub = `YSYX210295_ALU_ADD_EN;
						alu_shift = `YSYX210295_ALU_SHIFT_L;
						word_intercept = `YSYX210295_INTERCEPT_DIS;
						alu_operation = `YSYX210295_ALU_ADD;
						alu_op_num1	= csr_data_i;
						alu_op_num2	=  {59'b0,instr[19:15]};
						jmp_op_num1	= `YSYX210295_ZERO_DOUBLE;
						jmp_op_num2	= `YSYX210295_ZERO_DOUBLE;
						decode_except = `YSYX210295_EXCEPT_NOPE;
						except_cause = `YSYX210295_EXCEPT_NONE;
						csr_instr = `YSYX210295_CSR_CODE_CSRRSI;
						csr_addr = instr[31:20];
					end
					
					`YSYX210295_INSTR_CSRRCI: begin
						reg_wr_en = `YSYX210295_REG_WR_EN;
						reg_rs1_addr = `YSYX210295_REG_ADDR_ZERO;
						reg_rs2_addr = `YSYX210295_REG_ADDR_ZERO;
						reg_wr_addr = addr_rd;
				
						jmp_flag = `YSYX210295_JMP_NOPE;
						load_code = `YSYX210295_LOAD_NOPE;
						store_code = `YSYX210295_STORE_NOPE;
						
						alu_add_sub = `YSYX210295_ALU_ADD_EN;
						alu_shift = `YSYX210295_ALU_SHIFT_L;
						word_intercept = `YSYX210295_INTERCEPT_DIS;
						alu_operation = `YSYX210295_ALU_ADD;
				        	alu_op_num1	= csr_data_i;
						alu_op_num2 =  {59'b0,instr[19:15]};
						jmp_op_num1	= `YSYX210295_ZERO_DOUBLE;
						jmp_op_num2	= `YSYX210295_ZERO_DOUBLE;
						decode_except = `YSYX210295_EXCEPT_NOPE;
						except_cause = `YSYX210295_EXCEPT_NONE;
						csr_instr = `YSYX210295_CSR_CODE_CSRRCI;
						csr_addr = instr[31:20];
					end
					
					default: begin
						reg_wr_en = `YSYX210295_REG_WR_DIS;
						reg_rs1_addr = `YSYX210295_REG_ADDR_ZERO;
						reg_rs2_addr = `YSYX210295_REG_ADDR_ZERO;
						reg_wr_addr = `YSYX210295_REG_ADDR_ZERO;

						jmp_flag = `YSYX210295_JMP_NOPE;
						load_code = `YSYX210295_LOAD_NOPE;
						store_code = `YSYX210295_STORE_NOPE;

						alu_add_sub = `YSYX210295_ALU_ADD_EN;
						alu_shift = `YSYX210295_ALU_SHIFT_L;
						word_intercept = `YSYX210295_INTERCEPT_DIS;
						alu_operation = `YSYX210295_ALU_ADD;
						alu_op_num1	= `YSYX210295_ZERO_DOUBLE;
						alu_op_num2	= `YSYX210295_ZERO_DOUBLE;
						jmp_op_num1	= `YSYX210295_ZERO_DOUBLE;
						jmp_op_num2	= `YSYX210295_ZERO_DOUBLE;
						decode_except = `YSYX210295_EXCEPT_ACT;
						except_cause = `YSYX210295_EXCEPT_ID_ILLEGAL;
						csr_instr = `YSYX210295_CSR_CODE_NOPE;
						csr_addr = `YSYX210295_CSR_ADDR_ZERO;
					end
				endcase
			end

			`YSYX210295_OPERATION_NOP: begin
				reg_wr_en = `YSYX210295_REG_WR_DIS;
				reg_rs1_addr = `YSYX210295_REG_ADDR_ZERO;
				reg_rs2_addr = `YSYX210295_REG_ADDR_ZERO;
				reg_wr_addr = `YSYX210295_REG_ADDR_ZERO;

				jmp_flag = `YSYX210295_JMP_NOPE;
				load_code = `YSYX210295_LOAD_NOPE;
				store_code = `YSYX210295_STORE_NOPE;

				alu_add_sub = `YSYX210295_ALU_ADD_EN;
				alu_shift = `YSYX210295_ALU_SHIFT_L;
				word_intercept = `YSYX210295_INTERCEPT_DIS;
				alu_operation = `YSYX210295_ALU_ADD;
				alu_op_num1	= `YSYX210295_ZERO_DOUBLE;
				alu_op_num2	= `YSYX210295_ZERO_DOUBLE;
				jmp_op_num1	= `YSYX210295_ZERO_DOUBLE;
				jmp_op_num2	= `YSYX210295_ZERO_DOUBLE;
				decode_except = `YSYX210295_EXCEPT_NOPE;
				except_cause = `YSYX210295_EXCEPT_NONE;
				csr_instr = `YSYX210295_CSR_CODE_NOPE;
				csr_addr = `YSYX210295_CSR_ADDR_ZERO;
			end

			default: begin
				reg_wr_en = `YSYX210295_REG_WR_DIS;
				reg_rs1_addr = `YSYX210295_REG_ADDR_ZERO;
				reg_rs2_addr = `YSYX210295_REG_ADDR_ZERO;
				reg_wr_addr = `YSYX210295_REG_ADDR_ZERO;

				jmp_flag = `YSYX210295_JMP_NOPE;
				load_code = `YSYX210295_LOAD_NOPE;
				store_code = `YSYX210295_STORE_NOPE;

				alu_add_sub = `YSYX210295_ALU_ADD_EN;
				alu_shift = `YSYX210295_ALU_SHIFT_L;
				word_intercept = `YSYX210295_INTERCEPT_DIS;
				alu_operation = `YSYX210295_ALU_ADD;
				alu_op_num1	= `YSYX210295_ZERO_DOUBLE;
				alu_op_num2	= `YSYX210295_ZERO_DOUBLE;
				jmp_op_num1	= `YSYX210295_ZERO_DOUBLE;
				jmp_op_num2	= `YSYX210295_ZERO_DOUBLE;
				decode_except = `YSYX210295_EXCEPT_ACT;
				except_cause = `YSYX210295_EXCEPT_ID_ILLEGAL;
				csr_instr = `YSYX210295_CSR_CODE_NOPE;
				csr_addr = `YSYX210295_CSR_ADDR_ZERO;
			end
		endcase
	end
	
endmodule

//ECNURVCORE
//Pipeline CPU
//Created by Chesed
//2021.07.21
//Edited in 2021.08.07

//update in 0908




module ysyx_210295_ex(

//	input	[`YSYX210295_BUS_DATA_REG]		data_rs1		,
	input	[`YSYX210295_BUS_DATA_REG]		data_rs2		,

	input 	[`YSYX210295_BUS_L_CODE]		load_code		,
	input 	[`YSYX210295_BUS_S_CODE]		store_code		,
	input	[`YSYX210295_OPERATION_CODE]	op_code			,

	input						alu_add_sub		,
	input						alu_shift		,
	input						word_intercept	,
	input	[`YSYX210295_BUS_ALU_OP]		alu_operation	,
	input	[`YSYX210295_BUS_DATA_REG]		alu_op_num1		,
	input	[`YSYX210295_BUS_DATA_REG]		alu_op_num2		,

	output reg 	[`YSYX210295_BUS_DATA_REG]	alu_result		,
	output reg 	[`YSYX210295_BUS_DATA_MEM]	data_mem_wr		,
	output reg  [`YSYX210295_BUS_AXI_STRB] strb_mem_wr     ,
	output reg  [`YSYX210295_BUS_AXI_SIZE] size_mem_wr     ,
	output reg 	[`YSYX210295_BUS_ADDR_MEM]	addr_mem_wr		,
	output reg 	[`YSYX210295_BUS_ADDR_MEM]	addr_mem_rd		,
	output reg  [`YSYX210295_BUS_AXI_SIZE] size_mem_rd     ,
	output reg 					mem_wr_en		,
	output reg 					mem_rd_en		,
	output reg					mem_except		,   
	output reg	[`YSYX210295_BUS_EXCEPT_CAUSE]	except_cause	
	
);
	
	wire [5:0] shamt;
	wire [`YSYX210295_BUS_DATA_REG] sra_mask;
	wire [`YSYX210295_BUS_DATA_REG] sra_sign;
	wire [`YSYX210295_BUS_DATA_REG] sraw_sign;

	//wire [`YSYX210295_BUS_DATA_REG] srl_mask;
	//wire [`YSYX210295_BUS_DATA_REG] srl_sign;
	wire [`YSYX210295_BUS_DATA_REG] srlw_sign;

	wire [`YSYX210295_BUS_DATA_REG] alu_add;
	wire [`YSYX210295_BUS_DATA_REG] alu_sub;
	wire [`YSYX210295_BUS_DATA_REG] alu_sl;
	wire [`YSYX210295_BUS_DATA_REG] alu_sllw;
	wire [`YSYX210295_BUS_DATA_REG] alu_slt;
	wire [`YSYX210295_BUS_DATA_REG] alu_sltu;
	wire [`YSYX210295_BUS_DATA_REG] alu_xor;
	wire [`YSYX210295_BUS_DATA_REG] alu_srl;
	wire [`YSYX210295_BUS_DATA_REG] alu_sra;
	wire [`YSYX210295_BUS_DATA_REG] alu_srlw;
	wire [`YSYX210295_BUS_DATA_REG] alu_sraw;
	//wire [`YSYX210295_BUS_DATA_REG] alu_sraiw;
	wire [`YSYX210295_BUS_DATA_REG] alu_or;
	wire [`YSYX210295_BUS_DATA_REG] alu_and;

	wire [`YSYX210295_BUS_DATA_REG] op_num1_word;
	wire [`YSYX210295_BUS_DATA_REG] op_num1_word_u;

	assign op_num1_word = {{32{alu_op_num1[31]}},alu_op_num1[31:0]};
	assign op_num1_word_u = {32'd0,alu_op_num1[31:0]};

    assign shamt = (word_intercept == `YSYX210295_INTERCEPT_EN) ? {1'b0,alu_op_num2[4:0]} : alu_op_num2[5:0];
	
	

	assign sra_mask = ~(64'hffffffffffffffff >> shamt);
	assign sra_sign = sra_mask & {64{alu_op_num1[63]}};
	assign sraw_sign = sra_mask & {64{alu_op_num1[31]}};

	assign srlw_sign = (shamt == 0) ? {{32{alu_op_num1[31]}},32'd0} : 64'd0 ;

	assign alu_add = alu_op_num1 + alu_op_num2;
	assign alu_sub = alu_op_num1 - alu_op_num2;
	assign alu_sl = alu_op_num1 << shamt;
	assign alu_sllw = {{32{alu_sl[31]}},alu_sl[31:0]};
	assign alu_slt = (alu_op_num1[63] == alu_op_num2[63]) ? ((alu_op_num1 < alu_op_num2) ? 64'd1 : 64'd0 ) : {63'd0,alu_op_num1[63]};
	assign alu_sltu = (alu_op_num1 < alu_op_num2) ? 64'd1 : 64'd0;
	assign alu_xor = alu_op_num1 ^ alu_op_num2;
	assign alu_srl = alu_op_num1 >> shamt;
	//assign alu_srlw = op_num1_word_u >> shamt;
	assign alu_srlw = (op_num1_word_u >> shamt) + srlw_sign;

	assign alu_sra = (alu_op_num1 >> shamt) + sra_sign;
	assign alu_sraw = (op_num1_word >> shamt) + sraw_sign;
	assign alu_or = alu_op_num1 | alu_op_num2;
	assign alu_and = alu_op_num1 & alu_op_num2;

	always@(*)begin
        if(op_code == `YSYX210295_OPERATION_SYS)
			alu_result = alu_op_num1;
		else
		case(alu_operation)
			`YSYX210295_INSTR_ADD: begin
				case(alu_add_sub)
					`YSYX210295_ALU_ADD_EN:	alu_result = (word_intercept == `YSYX210295_INTERCEPT_EN) ? {{32{alu_add[31]}},alu_add[31:0]} : alu_add;
					`YSYX210295_ALU_SUB_EN:	alu_result = (word_intercept == `YSYX210295_INTERCEPT_EN) ? {{32{alu_sub[31]}},alu_sub[31:0]} : alu_sub;
					default:		alu_result = `YSYX210295_ZERO_DOUBLE;
				endcase
			end
			`YSYX210295_INSTR_SL:		alu_result = (word_intercept == `YSYX210295_INTERCEPT_EN) ? alu_sllw : alu_sl;
			`YSYX210295_INSTR_SLT:		alu_result = alu_slt;
			`YSYX210295_INSTR_SLTU:	alu_result = alu_sltu;
			`YSYX210295_INSTR_XOR:		alu_result = alu_xor;
			`YSYX210295_INSTR_SR: begin
				case(alu_shift)
					`YSYX210295_ALU_SHIFT_L:	alu_result = (word_intercept == `YSYX210295_INTERCEPT_EN) ? alu_srlw : alu_srl;
					`YSYX210295_ALU_SHIFT_A:	alu_result = (word_intercept == `YSYX210295_INTERCEPT_EN) ? alu_sraw : alu_sra;
					default:		alu_result = `YSYX210295_ZERO_DOUBLE;
				endcase
			end
			`YSYX210295_INSTR_OR:		alu_result = alu_or;
			`YSYX210295_INSTR_AND:		alu_result = alu_and;
			default:		alu_result = `YSYX210295_ZERO_DOUBLE;
		endcase
	end

	always@(*) begin
		if (load_code !=`YSYX210295_LOAD_NOPE) begin
			case (load_code)
				`YSYX210295_INSTR_LB, `YSYX210295_INSTR_LBU,`YSYX210295_INSTR_LH, `YSYX210295_INSTR_LHU,`YSYX210295_INSTR_LW, `YSYX210295_INSTR_LWU,`YSYX210295_INSTR_LD:  begin 
					mem_except = (alu_result[2:0] == 3'b000) ? `YSYX210295_EXCEPT_NOPE : `YSYX210295_EXCEPT_ACT;
					except_cause = `YSYX210295_EXCEPT_NONE; 
				end
				default: begin mem_except=`YSYX210295_EXCEPT_NOPE; except_cause = `YSYX210295_EXCEPT_NONE; end
			endcase
		end
		else if (store_code !=`YSYX210295_STORE_NOPE) begin
			case (store_code)
				`YSYX210295_INSTR_SB,`YSYX210295_INSTR_SH,`YSYX210295_INSTR_SW,`YSYX210295_INSTR_SD:  begin 
					mem_except = (alu_result[2:0] == 3'b000) ? `YSYX210295_EXCEPT_NOPE : `YSYX210295_EXCEPT_ACT;
					except_cause = (alu_result[2:0] == 3'b000) ? `YSYX210295_EXCEPT_NONE : `YSYX210295_EXCEPT_MEM_ALIGN; 
				end
				default: begin mem_except=`YSYX210295_EXCEPT_NOPE; except_cause = `YSYX210295_EXCEPT_NONE; end
			endcase	
		end
		else begin
			mem_except = `YSYX210295_EXCEPT_NOPE;
			except_cause = `YSYX210295_EXCEPT_NONE; 
		end
	end

	always@(*) begin
		case(load_code)
			//`YSYX210295_INSTR_LB,`YSYX210295_INSTR_LH,`YSYX210295_INSTR_LW,`YSYX210295_INSTR_LD,`YSYX210295_INSTR_LBU,`YSYX210295_INSTR_LHU,`YSYX210295_INSTR_LWU: begin
			`YSYX210295_INSTR_LB, `YSYX210295_INSTR_LBU:	begin
				size_mem_rd = `YSYX210295_AXI_SIZE_BYTE;
				addr_mem_rd = alu_result;
				mem_rd_en = `YSYX210295_MEM_RD_EN;
				//mem_except = (alu_result[2:0] == 3'b000) ? `YSYX210295_EXCEPT_NOPE : `YSYX210295_EXCEPT_ACT;
				//except_cause = (alu_result[2:0] == 3'b000) ? `YSYX210295_EXCEPT_NONE : `YSYX210295_EXCEPT_MEM_ALIGN;
			end
			`YSYX210295_INSTR_LH, `YSYX210295_INSTR_LHU: begin
				size_mem_rd = `YSYX210295_AXI_SIZE_HALF;
				addr_mem_rd = alu_result;
				mem_rd_en = `YSYX210295_MEM_RD_EN;
				//mem_except = (alu_result[2:0] == 3'b000) ? `YSYX210295_EXCEPT_NOPE : `YSYX210295_EXCEPT_ACT;
				//except_cause = (alu_result[2:0] == 3'b000) ? `YSYX210295_EXCEPT_NONE : `YSYX210295_EXCEPT_MEM_ALIGN;	
			end

			`YSYX210295_INSTR_LW, `YSYX210295_INSTR_LWU: begin
				size_mem_rd = `YSYX210295_AXI_SIZE_WORD;
				addr_mem_rd = alu_result;
				mem_rd_en = `YSYX210295_MEM_RD_EN;
				//mem_except = (alu_result[2:0] == 3'b000) ? `YSYX210295_EXCEPT_NOPE : `YSYX210295_EXCEPT_ACT;
				//except_cause = (alu_result[2:0] == 3'b000) ? `YSYX210295_EXCEPT_NONE : `YSYX210295_EXCEPT_MEM_ALIGN;
			end

			`YSYX210295_INSTR_LD: begin
				size_mem_rd = `YSYX210295_AXI_SIZE_DOUBLE;
				addr_mem_rd = alu_result;
				mem_rd_en = `YSYX210295_MEM_RD_EN;
				//mem_except = (alu_result[2:0] == 3'b000) ? `YSYX210295_EXCEPT_NOPE : `YSYX210295_EXCEPT_ACT;
				//except_cause = (alu_result[2:0] == 3'b000) ? `YSYX210295_EXCEPT_NONE : `YSYX210295_EXCEPT_MEM_ALIGN;

			end
			default: begin
				size_mem_rd = `YSYX210295_AXI_SIZE_WORD;
				addr_mem_rd = `YSYX210295_MEM_ADDR_ZERO;
				mem_rd_en = `YSYX210295_MEM_RD_DIS;
				//mem_except = `YSYX210295_EXCEPT_NOPE;
				//except_cause = `YSYX210295_EXCEPT_NONE;
			end
		endcase
	end

	always@(*) begin
		case(store_code)
			`YSYX210295_INSTR_SB: begin
				data_mem_wr = {56'd0,data_rs2[7:0]};
				size_mem_wr = `YSYX210295_AXI_SIZE_BYTE;
				strb_mem_wr = `YSYX210295_WR_STR_BYTE;
				addr_mem_wr = alu_result;
				mem_wr_en = `YSYX210295_MEM_WR_EN;
                //mem_except = (alu_result[2:0] == 3'b000) ? `YSYX210295_EXCEPT_NOPE : `YSYX210295_EXCEPT_ACT;
				//except_cause = (alu_result[2:0] == 3'b000) ? `YSYX210295_EXCEPT_NONE : `YSYX210295_EXCEPT_MEM_ALIGN;
			end
			`YSYX210295_INSTR_SH: begin
				data_mem_wr = {48'd0,data_rs2[15:0]};
				size_mem_wr = `YSYX210295_AXI_SIZE_HALF;
				strb_mem_wr = `YSYX210295_WR_STR_HALF;
				addr_mem_wr = alu_result;
				mem_wr_en = `YSYX210295_MEM_WR_EN;
                //mem_except = (alu_result[2:0] == 3'b000) ? `YSYX210295_EXCEPT_NOPE : `YSYX210295_EXCEPT_ACT;
				//except_cause = (alu_result[2:0] == 3'b000) ? `YSYX210295_EXCEPT_NONE : `YSYX210295_EXCEPT_MEM_ALIGN;
			end
			`YSYX210295_INSTR_SW: begin
				data_mem_wr = {32'd0,data_rs2[31:0]};
				size_mem_wr = `YSYX210295_AXI_SIZE_WORD;
				strb_mem_wr = `YSYX210295_WR_STR_WORD;
				addr_mem_wr = alu_result;
				mem_wr_en = `YSYX210295_MEM_WR_EN;
            	//mem_except = (alu_result[2:0] == 3'b000) ? `YSYX210295_EXCEPT_NOPE : `YSYX210295_EXCEPT_ACT;
				//except_cause = (alu_result[2:0] == 3'b000) ? `YSYX210295_EXCEPT_NONE : `YSYX210295_EXCEPT_MEM_ALIGN;
			end
			`YSYX210295_INSTR_SD: begin
				data_mem_wr = data_rs2;
				size_mem_wr = `YSYX210295_AXI_SIZE_DOUBLE;
				strb_mem_wr = `YSYX210295_WR_STR_ALL;
				addr_mem_wr = alu_result;
			 	mem_wr_en = `YSYX210295_MEM_WR_EN;
                //mem_except = (alu_result[2:0] == 3'b000) ? `YSYX210295_EXCEPT_NOPE : `YSYX210295_EXCEPT_ACT;
				//except_cause = (alu_result[2:0] == 3'b000) ? `YSYX210295_EXCEPT_NONE : `YSYX210295_EXCEPT_MEM_ALIGN;
			
			end
			default: begin
				data_mem_wr = `YSYX210295_ZERO_DOUBLE;
				strb_mem_wr = `YSYX210295_WR_STR_NONE;
				size_mem_wr = `YSYX210295_AXI_SIZE_WORD;
				addr_mem_wr = `YSYX210295_MEM_ADDR_ZERO;
				mem_wr_en = `YSYX210295_MEM_WR_DIS;
                //mem_except = `YSYX210295_EXCEPT_NOPE;
				//except_cause = `YSYX210295_EXCEPT_NONE;
			end
		endcase
	end



endmodule

//ECNURVCORE
//Pipeline CPU




module ysyx_210295_ex_csr
(
//	input						clock				,
//	input						reset			,
	
//	input	[`YSYX210295_BUS_ADDR_MEM]		pc_i			,
//	input	[`YSYX210295_BUS_DATA_INSTR]	instr_i			,
	input	[`YSYX210295_OPERATION_CODE]	op_code_i		,
	input	[`YSYX210295_BUS_DATA_REG]		data_rs1_i		,
//	input	[`YSYX210295_BUS_DATA_REG]		data_rs2_i		,
//	input	[`YSYX210295_BUS_ADDR_REG]		addr_reg_wr_i	,	

	// from id
	input	[`YSYX210295_BUS_ALU_OP]		csr_instr_i		,
	input	[`YSYX210295_BUS_CSR_IMM]		csr_addr_i		,
	input	[`YSYX210295_BUS_DATA_REG]		csr_imm_i		,
	
	// from/to reg_csr
	output						csr_we_o		,
	output	[`YSYX210295_BUS_CSR_IMM]		csr_addr_o		,
	output	[`YSYX210295_BUS_DATA_REG] 	csr_data_o		,
	input	[`YSYX210295_BUS_DATA_REG]		csr_data_i			
);

	
	reg		[`YSYX210295_BUS_DATA_REG]	reg_csr_val;
	
	//assign csr_we_o   = op_code_i == `YSYX210295_OPERATION_SYS;
	assign csr_we_o   = (op_code_i == `YSYX210295_OPERATION_SYS) & (csr_instr_i != `YSYX210295_CSR_CODE_NOPE);
	assign csr_addr_o = csr_addr_i;
	assign csr_data_o = reg_csr_val;
	
	always@ (*) begin
		reg_csr_val = 64'b0;
		case (csr_instr_i & {3{csr_we_o}})
			3'b001: begin
				reg_csr_val = data_rs1_i;					//rv32i_csrrw       
			end
			3'b010: begin
				reg_csr_val = data_rs1_i | csr_data_i;		//rv32i_csrrs
			end
			3'b011: begin
				reg_csr_val = ~data_rs1_i & csr_data_i;	//rv32i_csrrc
			end
			3'b101: begin
				reg_csr_val = csr_imm_i;					//rv32i_csrrwi
			end
			3'b110: begin
				reg_csr_val = csr_imm_i | csr_data_i;  	//rv32i_csrrsi
			end
			3'b111: begin
				reg_csr_val = ~csr_imm_i & csr_data_i;		//rv32i_csrrci
			end
			default: reg_csr_val = 64'b0;
		endcase
	end


endmodule
//ECNURVCORE
//Pipeline CPU
//Created by Chesed
//2021.07.23
//Edited in 2021.08.07

//update in 0908




module ysyx_210295_ex_mem(
	input						clock				,
	input						reset			,
	input						hold_n			,

	//input   [`YSYX210295_BUS_DATA_INSTR]   diff_instr_i    ,
	//input   [`YSYX210295_BUS_ADDR_MEM]     diff_pc_i       ,
	//input                       diff_instr_en_i ,

	input	[`YSYX210295_BUS_DATA_MEM] 	data_mem_i 		,
	input	[`YSYX210295_BUS_DATA_REG] 	data_alu_i	 	,
	input	[`YSYX210295_BUS_ADDR_REG]		addr_reg_wr_i	,
	input						reg_wr_en_i		,
	input	[`YSYX210295_BUS_L_CODE]		load_code_i		,

	//output  [`YSYX210295_BUS_DATA_INSTR]   diff_instr_o    ,
	//output  [`YSYX210295_BUS_ADDR_MEM]     diff_pc_o       ,
	//output                      diff_instr_en_o ,

	output	[`YSYX210295_BUS_ADDR_REG]		addr_reg_wr_o	,
	output	[`YSYX210295_BUS_DATA_REG]		data_reg_wr_o 	,
	output	[`YSYX210295_BUS_DATA_REG]		alu_reg_wr_o	,
	output						reg_wr_en_o		
	

);
	
	reg [`YSYX210295_BUS_DATA_REG] data_reg_wr; 


	assign alu_reg_wr_o = data_reg_wr;

	always@(*) begin
		case(load_code_i)
			`YSYX210295_INSTR_LB: data_reg_wr = {{56{data_mem_i[7]}},data_mem_i[7:0]};
			`YSYX210295_INSTR_LH: data_reg_wr = {{48{data_mem_i[15]}},data_mem_i[15:0]};
			`YSYX210295_INSTR_LW: data_reg_wr = {{32{data_mem_i[31]}},data_mem_i[31:0]};
			`YSYX210295_INSTR_LD: data_reg_wr = data_mem_i;
			`YSYX210295_INSTR_LBU: data_reg_wr = {56'd0,data_mem_i[7:0]};
			`YSYX210295_INSTR_LHU: data_reg_wr = {48'd0,data_mem_i[15:0]};
			`YSYX210295_INSTR_LWU: data_reg_wr = {32'd0,data_mem_i[31:0]};
			default: data_reg_wr = data_alu_i;
		endcase
	end
/*
	ysyx_210295_gnrl_dff # (.DW(32)) diff_ex_instr_i(
		.clock		(clock),
		.reset		(reset),
		.wr_en		(hold_n),
		.data_in	(diff_instr_i),
		.data_r_ini	(32'd0),

		.data_out	(diff_instr_o)
	);
*/

	ysyx_210295_gnrl_dff # (.DW(5)) dff_addr_reg_wr(
		.clock		(clock),
		.reset		(reset),
		.wr_en		(hold_n),
		.data_in	(addr_reg_wr_i),
		.data_r_ini	(`YSYX210295_REG_ADDR_ZERO),

		.data_out	(addr_reg_wr_o)
	);

	ysyx_210295_gnrl_dff # (.DW(`YSYX210295_DATA_WIDTH)) dff_data_alu(
		.clock		(clock),
		.reset		(reset),
		.wr_en		(hold_n),
		.data_in	(data_reg_wr),
		.data_r_ini	(`YSYX210295_ZERO_DOUBLE),

		.data_out	(data_reg_wr_o)
	);

	ysyx_210295_gnrl_dff # (.DW(1)) dff_reg_wr_en(
		.clock		(clock),
		.reset		(reset),
		.wr_en		(hold_n),
		.data_in	(reg_wr_en_i),
		.data_r_ini	(`YSYX210295_REG_WR_DIS),

		.data_out	(reg_wr_en_o)
	);

endmodule
//ECNURVCORE
//Pipeline CPU
//Created by Chesed
//2021.07.26
//Edited in 2021.08.31



module ysyx_210295_ex_stage(
	input						clock				,
	input						reset			,

	input	[`YSYX210295_BUS_HOLD_CODE]	hold_code		,

//	input	[`YSYX210295_BUS_ADDR_MEM]		pc_i			,
//	input	[`YSYX210295_BUS_DATA_INSTR]	instr_i			,
	input	[`YSYX210295_BUS_DATA_REG]		data_rs1_i		,
	input	[`YSYX210295_BUS_DATA_REG]		data_rs2_i		,
	input	[`YSYX210295_BUS_ALU_OP]		csr_instr_i		,
	input	[`YSYX210295_BUS_CSR_IMM]		csr_addr_i		,
//	input   [`YSYX210295_BUS_DATA_INSTR]   diff_instr_i    ,
//	input   [`YSYX210295_BUS_ADDR_MEM]     diff_pc_i       ,
//	input                       diff_instr_en_i ,

	input 	[`YSYX210295_BUS_L_CODE]		load_code_i		,
	input 	[`YSYX210295_BUS_S_CODE]		store_code_i	,
	input	[`YSYX210295_OPERATION_CODE]	op_code_i		,

	input						alu_add_sub_i	,
	input						alu_shift_i		,
	input						word_intercept_i,
	input	[`YSYX210295_BUS_ALU_OP]		alu_operation_i	,
	input	[`YSYX210295_BUS_DATA_REG]		alu_op_num1_i	,
	input	[`YSYX210295_BUS_DATA_REG]		alu_op_num2_i	,

	input	[`YSYX210295_BUS_DATA_MEM] 	data_mem_i 		,
	input	[`YSYX210295_BUS_ADDR_REG]		addr_reg_wr_i	,
	input						reg_wr_en_i		,

	input                                    except_async,

//	output   [`YSYX210295_BUS_DATA_INSTR]  diff_instr_o    ,
//	output   [`YSYX210295_BUS_ADDR_MEM]    diff_pc_o       ,
//	output                      diff_instr_en_o ,

	output	[`YSYX210295_BUS_DATA_REG] 	alu_result_o	,
	output	[`YSYX210295_BUS_ADDR_REG]		addr_reg_wr_o	,
	output	[`YSYX210295_BUS_DATA_REG]		data_reg_wr_o 	,
	output						reg_wr_en_o		,

	output						mem_wr_en_o		,
	output						mem_rd_en_o		,
	output 	[`YSYX210295_BUS_DATA_MEM] 	data_mem_wr_o	,	
	output 	[`YSYX210295_BUS_AXI_STRB]		strb_mem_wr_o	,
	output  [`YSYX210295_BUS_AXI_SIZE]     size_mem_wr_o   ,
	output 	[`YSYX210295_BUS_ADDR_MEM] 	addr_mem_wr_o	,	
	output 	[`YSYX210295_BUS_ADDR_MEM] 	addr_mem_rd_o	,
	output  [`YSYX210295_BUS_AXI_SIZE]     size_mem_rd_o   ,
	
	output						csr_we_o		,
	output	[`YSYX210295_BUS_CSR_IMM]		csr_addr_o		,
	output	[`YSYX210295_BUS_DATA_REG] 	csr_data_o		,
	input	[`YSYX210295_BUS_DATA_REG]		csr_data_i		,
	
	output						mem_except_o	,
	output	[`YSYX210295_BUS_EXCEPT_CAUSE]	except_cause_o	

);
	wire [`YSYX210295_BUS_DATA_REG] alu_result;	
	wire hold_n;

	assign hold_n = (hold_code >= `YSYX210295_HOLD_CODE_EX) ? `YSYX210295_HOLD_EN : `YSYX210295_HOLD_DIS;

   wire mem_wr_en;
   wire mem_rd_en;
   wire reg_wr_en;
   wire csr_we;
    assign mem_rd_en_o = ( except_async ) ? 0: mem_rd_en;  // by ou
	assign mem_wr_en_o = ( except_async ) ? 0: mem_wr_en; // by ou
	assign reg_wr_en =  ( except_async ) ? 0: reg_wr_en_i;      // by ou
	assign csr_we_o =  (except_async) ? 0 : csr_we; //by ou
	
	ysyx_210295_ex ex_alu
	(
		//.data_rs1			(data_rs1_i),
		.data_rs2			(data_rs2_i),
		
		.load_code			(load_code_i),
		.store_code			(store_code_i),
		.op_code			(op_code_i),
		.alu_add_sub		(alu_add_sub_i),
		.alu_shift			(alu_shift_i),
		.word_intercept 	(word_intercept_i),
		.alu_operation		(alu_operation_i),
		.alu_op_num1		(alu_op_num1_i),
		.alu_op_num2		(alu_op_num2_i),
	
		.alu_result			(alu_result),
		.data_mem_wr		(data_mem_wr_o),
		.strb_mem_wr		(strb_mem_wr_o),
		.size_mem_wr        (size_mem_wr_o),
		.addr_mem_wr		(addr_mem_wr_o),
		.addr_mem_rd		(addr_mem_rd_o),
		.size_mem_rd        (size_mem_rd_o),
		//.mem_wr_en			(mem_wr_en_o),
		//.mem_rd_en			(mem_rd_en_o),
		.mem_wr_en			(mem_wr_en),  //by ou
		.mem_rd_en			(mem_rd_en),  //by ou
		.mem_except			(mem_except_o),
		.except_cause		(except_cause_o)
	);

	ysyx_210295_ex_mem core_pipeline_ex_mem
	(
		.clock				(clock),
		.reset				(reset),
		.hold_n				(hold_n),
		
	//	.diff_instr_i   (diff_instr_i),
	//	.diff_pc_i      (diff_pc_i),
	//	.diff_instr_en_i(diff_instr_en_i) ,

	
		.data_mem_i 		(data_mem_i),
		.data_alu_i	 		(alu_result),
		.addr_reg_wr_i		(addr_reg_wr_i),
		//.reg_wr_en_i		(reg_wr_en_i), 
		.reg_wr_en_i		(reg_wr_en),  // by ou
		.load_code_i		(load_code_i),
		
	//	.diff_instr_o   (diff_instr_o),
	//	.diff_pc_o      (diff_pc_o),
	//	.diff_instr_en_o(diff_instr_en_o) ,
	
		.alu_reg_wr_o		(alu_result_o),
		.addr_reg_wr_o		(addr_reg_wr_o),
		.data_reg_wr_o 		(data_reg_wr_o),
		.reg_wr_en_o		(reg_wr_en_o)	
	);

	ysyx_210295_ex_csr U_ex_csr
	(
	//	.clock				(clock),
	//	.reset				(reset),
			
//		.pc_i				(pc_i),
//		.instr_i			(instr_i),
		.op_code_i			(op_code_i),
		.data_rs1_i			(data_rs1_i),
	//	.addr_reg_wr_i		(addr_reg_wr_i),
			
		.csr_instr_i		(csr_instr_i),
		.csr_addr_i			(csr_addr_i),
		.csr_imm_i			(alu_op_num2_i),
	
		//.csr_we_o			(csr_we_o),  // by ou
		.csr_we_o			(csr_we),
		.csr_addr_o			(csr_addr_o),
		.csr_data_o			(csr_data_o),
		.csr_data_i			(csr_data_i)
	);


endmodule
//ECNURVCORE
//General D Filp-Flop
//Created by Chesed
//2021.07.20



module ysyx_210295_gnrl_dff # (
	parameter	DW = 32
)(
	input				clock			,
	input				reset		,
	input				wr_en		,
	input	[DW-1:0]	data_in		,
	input	[DW-1:0]	data_r_ini	,

	output	[DW-1:0]	data_out	

);

	reg [DW-1:0] data_r;
	
	assign data_out = data_r;

	always @(posedge clock) begin
		if(reset) begin
			data_r <= data_r_ini;
		end
		else begin
			if(wr_en) begin
				data_r <= data_in;
			end
			else begin
				data_r <= data_r;
			end
		end
	end

endmodule
//ECNURVCORE
//Pipeline CPU
//Created by Chesed
//2021.07.20
//Edited in 2021.08.07

//update in 0908


module ysyx_210295_id_ex(
	input						clock				,
	input						reset			,

	input	[`YSYX210295_BUS_DATA_REG]		data_rs1_i		,
	input	[`YSYX210295_BUS_DATA_REG]		data_rs2_i		,
	input	[`YSYX210295_BUS_ADDR_REG]		addr_rd_i		,
	input						reg_wr_en_i		,
	//input	[`YSYX210295_BUS_ADDR_MEM]		addr_instr_i	,

///	input   [`YSYX210295_BUS_DATA_INSTR]   diff_instr_i    ,
//	input   [`YSYX210295_BUS_ADDR_MEM]     diff_pc_i       ,
//	input                       diff_instr_en_i ,

	input 	[`YSYX210295_BUS_L_CODE]		load_code_i		,
	input 	[`YSYX210295_BUS_S_CODE]		store_code_i	,
        input	[`YSYX210295_OPERATION_CODE]	op_code_i		,
	//	input	[`YSYX210295_BUS_ALU_OP]		funct3_i		,

	input		 				alu_add_sub_i	,
	input		 				alu_shift_i		,
	input						word_intercept_i,
	input	[`YSYX210295_BUS_ALU_OP]		alu_operation_i	,
	input	[`YSYX210295_BUS_DATA_REG]		alu_op_num1_i	,
	input	[`YSYX210295_BUS_DATA_REG]		alu_op_num2_i	,
	input	[`YSYX210295_BUS_ALU_OP]		csr_instr_i		,
//	input	[`YSYX210295_BUS_CSR_IMM]		csr_addr_i		,
        input	[`YSYX210295_BUS_DATA_REG]		csr_data_i		,

	input						hold_n			,

	output	[`YSYX210295_BUS_DATA_REG]		data_rs1_o		,
	output	[`YSYX210295_BUS_DATA_REG]		data_rs2_o		,
	output	[`YSYX210295_BUS_ADDR_REG]		addr_rd_o		,
	output						reg_wr_en_o		,
	//output	[`YSYX210295_BUS_ADDR_MEM]		addr_instr_o	,

//	output  [`YSYX210295_BUS_DATA_INSTR]   diff_instr_o    ,
//	output  [`YSYX210295_BUS_ADDR_MEM]     diff_pc_o       ,
//	output                      diff_instr_en_o ,

	output 	[`YSYX210295_BUS_L_CODE]		load_code_o		,
	output 	[`YSYX210295_BUS_S_CODE]		store_code_o	,
	output	[`YSYX210295_OPERATION_CODE]	op_code_o		,
	//	output	[`YSYX210295_BUS_ALU_OP]		funct3_o		,

	output		 				alu_add_sub_o	,
	output		 				alu_shift_o		,
	output						word_intercept_o,
	output	[`YSYX210295_BUS_ALU_OP]		alu_operation_o	,
	output	[`YSYX210295_BUS_DATA_REG]		alu_op_num1_o	,
	output	[`YSYX210295_BUS_DATA_REG]		alu_op_num2_o	,
	output	[`YSYX210295_BUS_ALU_OP]		csr_instr_o		,
//	output	[`YSYX210295_BUS_CSR_IMM]		csr_addr_o		,
	output	[`YSYX210295_BUS_DATA_REG]		csr_data_o		
	
);
/*
    ysyx_210295_gnrl_dff # (.DW(32)) diff_instr(
		.clock		(clock),
		.reset		(reset),
		.wr_en		(hold_n),
		.data_in	(diff_instr_i),
		.data_r_ini	(32'h0),

		.data_out	(diff_instr_o)
	);
*/
	ysyx_210295_gnrl_dff # (.DW(`YSYX210295_DATA_WIDTH)) dff_data_rs1(
		.clock		(clock),
		.reset		(reset),
		.wr_en		(hold_n),
		.data_in	(data_rs1_i),
		.data_r_ini	(`YSYX210295_ZERO_DOUBLE),

		.data_out	(data_rs1_o)
	);

	ysyx_210295_gnrl_dff # (.DW(`YSYX210295_DATA_WIDTH)) dff_data_rs2(
		.clock		(clock),
		.reset		(reset),
		.wr_en		(hold_n),
		.data_in	(data_rs2_i),
		.data_r_ini	(`YSYX210295_ZERO_DOUBLE),

		.data_out	(data_rs2_o)
	);	

	ysyx_210295_gnrl_dff # (.DW(5)) dff_addr_rd(
		.clock		(clock),
		.reset		(reset),
		.wr_en		(hold_n),
		.data_in	(addr_rd_i),
		.data_r_ini	(`YSYX210295_REG_ADDR_ZERO),

		.data_out	(addr_rd_o)
	);	
	ysyx_210295_gnrl_dff # (.DW(1)) dff_wr_en(
		.clock		(clock),
		.reset		(reset),
		.wr_en		(hold_n),
		.data_in	(reg_wr_en_i),
		.data_r_ini	(`YSYX210295_REG_WR_DIS),

		.data_out	(reg_wr_en_o)
	);	


	ysyx_210295_gnrl_dff # (.DW(3)) dff_store_code(
		.clock		(clock),
		.reset		(reset),
		.wr_en		(hold_n),
		.data_in	(store_code_i),
		.data_r_ini	(`YSYX210295_STORE_NOPE),

		.data_out	(store_code_o)
	);	
	ysyx_210295_gnrl_dff # (.DW(3)) dff_load_code(
		.clock		(clock),
		.reset		(reset),
		.wr_en		(hold_n),
		.data_in	(load_code_i),
		.data_r_ini	(`YSYX210295_LOAD_NOPE),

		.data_out	(load_code_o)
	);	

	ysyx_210295_gnrl_dff # (.DW(1)) dff_add_sub(
		.clock		(clock),
		.reset		(reset),
		.wr_en		(hold_n),
		.data_in	(alu_add_sub_i),
		.data_r_ini	(`YSYX210295_ALU_ADD_EN),

		.data_out	(alu_add_sub_o)
	);	

	ysyx_210295_gnrl_dff # (.DW(1)) dff_shift_l_a(
		.clock		(clock),
		.reset		(reset),
		.wr_en		(hold_n),
		.data_in	(alu_shift_i),
		.data_r_ini	(`YSYX210295_ALU_SHIFT_L),

		.data_out	(alu_shift_o)
	);	
	ysyx_210295_gnrl_dff # (.DW(1)) dff_word_intercept(
		.clock		(clock),
		.reset		(reset),
		.wr_en		(hold_n),
		.data_in	(word_intercept_i),
		.data_r_ini	(`YSYX210295_INTERCEPT_DIS),

		.data_out	(word_intercept_o)
	);	
	ysyx_210295_gnrl_dff # (.DW(3)) dff_alu_opcode(
		.clock		(clock),
		.reset		(reset),
		.wr_en		(hold_n),
		.data_in	(alu_operation_i),
		.data_r_ini	(`YSYX210295_ALU_ADD),

		.data_out	(alu_operation_o)
	);

	ysyx_210295_gnrl_dff # (.DW(`YSYX210295_DATA_WIDTH)) dff_alu_num1(
		.clock		(clock),
		.reset		(reset),
		.wr_en		(hold_n),
		.data_in	(alu_op_num1_i),
		.data_r_ini	(`YSYX210295_ZERO_DOUBLE),

		.data_out	(alu_op_num1_o)
	);	

	ysyx_210295_gnrl_dff # (.DW(`YSYX210295_DATA_WIDTH)) dff_alu_num2(
		.clock		(clock),
		.reset		(reset),
		.wr_en		(hold_n),
		.data_in	(alu_op_num2_i),
		.data_r_ini	(`YSYX210295_ZERO_DOUBLE),

		.data_out	(alu_op_num2_o)
	);

	ysyx_210295_gnrl_dff # (.DW(3)) dff_csr_instr(
		.clock		(clock),
		.reset		(reset),
		.wr_en		(hold_n),
		.data_in	(csr_instr_i),
		.data_r_ini	(`YSYX210295_CSR_CODE_NOPE),

		.data_out	(csr_instr_o)
	);
/*
	ysyx_210295_gnrl_dff # (.DW(`YSYX210295_DATA_WIDTH)) dff_addr_instr(
		.clock		(clock),
		.reset		(reset),
		.wr_en		(hold_n),
		.data_in	(addr_instr_i),
		.data_r_ini	(`YSYX210295_ZERO_DOUBLE),

		.data_out	(addr_instr_o)
	);
	*/
	ysyx_210295_gnrl_dff # (.DW(`YSYX210295_DATA_WIDTH)) dff_csr_data(
		.clock		(clock),
		.reset		(reset),
		.wr_en		(hold_n),
		.data_in	(csr_data_i),
		.data_r_ini	(`YSYX210295_ZERO_DOUBLE),

		.data_out	(csr_data_o)
	);

	ysyx_210295_gnrl_dff # (.DW(7)) dff_opcode(
		.clock		(clock),
		.reset		(reset),
		.wr_en		(hold_n),
		.data_in	(op_code_i),
		.data_r_ini	({7{1'b0}}),

		.data_out	(op_code_o)
	);
	
	endmodule
//ECNURVCORE
//Pipeline CPU
//Created by Chesed
//2021.07.23
//Edited in 2021.08.07

//update in 0908


module ysyx_210295_id_stage(
	input						clock				,
	input						reset			,

	input	[`YSYX210295_BUS_HOLD_CODE]	hold_code		,

	input	[`YSYX210295_BUS_DATA_REG]		data_rs1_i		,
	input	[`YSYX210295_BUS_DATA_REG]		data_rs2_i		,
	input	[`YSYX210295_BUS_DATA_REG]		data_bypass_i	,
	input	[`YSYX210295_BUS_DATA_INSTR]	instr_i			,
	input	[`YSYX210295_BUS_ADDR_MEM]		addr_instr_i	,	

//	input   [`YSYX210295_BUS_DATA_INSTR]   diff_instr_i    ,
//	input   [`YSYX210295_BUS_ADDR_MEM]     diff_pc_i       ,
//	input                       diff_instr_en_i ,

	output	[`YSYX210295_BUS_DATA_REG]		data_rs1_o		,
	output	[`YSYX210295_BUS_DATA_REG]		data_rs2_o		,
	output	[`YSYX210295_BUS_DATA_REG]		jmpb_rs1_o		,
	output	[`YSYX210295_BUS_DATA_REG]		jmpb_rs2_o		,
	output	[`YSYX210295_BUS_ADDR_REG]		addr_rs1_o		,
	output	[`YSYX210295_BUS_ADDR_REG]		addr_rs2_o		,
	output	[`YSYX210295_BUS_ADDR_REG]		addr_wr_o		,
	//output	[`YSYX210295_BUS_ADDR_MEM]		addr_instr_o	,

//	output  [`YSYX210295_BUS_DATA_INSTR]   diff_instr_o    ,
//	output  [`YSYX210295_BUS_ADDR_MEM]     diff_pc_o       ,
//	output                      diff_instr_en_o ,

	output						reg_wr_en_o		,
	output 	[`YSYX210295_BUS_L_CODE] 		load_code_o		,
	output 	[`YSYX210295_BUS_S_CODE] 		store_code_o	,
	output	[`YSYX210295_OPERATION_CODE]	op_code_o		,
	output						alu_add_sub_o	,
	output						alu_shift_o		,
	output						word_intercept_o,
	output 	[`YSYX210295_BUS_ALU_OP] 		alu_operation_o	,
	output	[`YSYX210295_BUS_DATA_REG]		alu_op_num1_o	,
	output	[`YSYX210295_BUS_DATA_REG]		alu_op_num2_o	,
	output	[`YSYX210295_BUS_DATA_REG]		jmp_op_num1_o	,
	output	[`YSYX210295_BUS_DATA_REG]		jmp_op_num2_o	,	
	output	[`YSYX210295_BUS_JMP_FLAG] 	jmp_flag_o		,
	output						decode_except_o	,
	output	[`YSYX210295_BUS_EXCEPT_CAUSE] except_cause_o	,
	output	[`YSYX210295_BUS_ALU_OP]		csr_instr_o		,
	output	[`YSYX210295_BUS_CSR_IMM]		csr_addr_o		,
	input	[`YSYX210295_BUS_DATA_REG]		csr_data_i		,
	output	[`YSYX210295_BUS_DATA_REG]		csr_data_o		,
	output						load_bypass_o,
	
	input         except_async
//	output  [`YSYX210295_BUS_CSR_IMM] csr_addr   //by ou	
);
	wire [`YSYX210295_BUS_ALU_OP] alu_operation;
	wire [`YSYX210295_BUS_DATA_REG] alu_op_num1;
	wire [`YSYX210295_BUS_DATA_REG] alu_op_num2;
	wire [`YSYX210295_BUS_DATA_REG] jmp_op_num1;
	wire [`YSYX210295_BUS_DATA_REG] jmp_op_num2;
	wire [`YSYX210295_BUS_DATA_REG] data_rs1;
	wire [`YSYX210295_BUS_DATA_REG] data_rs2;
	wire [`YSYX210295_BUS_JMP_FLAG] jmp_flag;
	wire [`YSYX210295_BUS_L_CODE] load_code;
	wire [`YSYX210295_BUS_S_CODE] store_code;
	wire [`YSYX210295_OPERATION_CODE] operation_code;
	//	wire [`YSYX210295_BUS_ALU_OP] funct3;
	wire [`YSYX210295_BUS_ADDR_REG] reg_wr_addr;
	wire reg_wr_en;
	wire alu_add_sub;
	wire alu_shift;
	wire word_intercept;

	wire [`YSYX210295_BUS_ALU_OP] csr_instr;
	//wire [`YSYX210295_BUS_CSR_IMM] csr_addr;  //by ou	

	wire hold_n;

	assign hold_n = (hold_code >= `YSYX210295_HOLD_CODE_ID) ? `YSYX210295_HOLD_EN : `YSYX210295_HOLD_DIS;

	assign jmp_op_num1_o = jmp_op_num1;
	assign jmp_op_num2_o = jmp_op_num2;
	assign jmp_flag_o = jmp_flag;
	assign jmpb_rs1_o = data_rs1;
	assign jmpb_rs2_o = data_rs2;

    wire reg_wr_en_bypass;
	assign reg_wr_en_bypass =  ( except_async ) ? 0: reg_wr_en_o;      // by ou
    

	ysyx_210295_decoder id_decoder(
		.data_rs1_reg	(data_rs1_i),
		.data_rs2_reg	(data_rs2_i),
		.reg_rd_addr_t	(addr_wr_o),

		.data_bypass 	(data_bypass_i),
		.instr			(instr_i),
		.addr_instr		(addr_instr_i),
	//	.load_code_t	(load_code_o),
		.reg_wr_en_o    (reg_wr_en_bypass),
	
		.data_rs1		(data_rs1),
		.data_rs2		(data_rs2),
		.alu_add_sub	(alu_add_sub),
		.alu_shift		(alu_shift),
		.word_intercept	(word_intercept),
		.alu_operation	(alu_operation),
		.alu_op_num1	(alu_op_num1),
		.alu_op_num2	(alu_op_num2),
		.jmp_op_num1	(jmp_op_num1),
		.jmp_op_num2	(jmp_op_num2),
		.jmp_flag		(jmp_flag),
		//.operation_code		(operation_code),
	
		.load_code		(load_code),
		.store_code		(store_code),
			.operation_code		(operation_code),
//		.funct3				(funct3),
	
		.reg_rs1_addr	(addr_rs1_o),
		.reg_rs2_addr	(addr_rs2_o),
		.reg_wr_addr	(reg_wr_addr),
		.reg_wr_en		(reg_wr_en),
		.decode_except		(decode_except_o),
		.except_cause		(except_cause_o),
		.csr_instr			(csr_instr),
		.csr_addr			(csr_addr_o),
		.csr_data_i			(csr_data_i),
		.load_bypass		(load_bypass_o)

	);


	ysyx_210295_id_ex pipeline_id_ex(
		.clock			(clock),
		.reset			(reset),

		.data_rs1_i		(data_rs1),
		.data_rs2_i		(data_rs2),
		.addr_rd_i		(reg_wr_addr),
		.reg_wr_en_i	(reg_wr_en),
		//.addr_instr_i	(addr_instr_i),

	//	.diff_instr_i   (diff_instr_i),
	//	.diff_pc_i      (diff_pc_i),
	//	.diff_instr_en_i(diff_instr_en_i) ,

		.load_code_i	(load_code),
		.store_code_i	(store_code),
       .op_code_i	(operation_code),
	   //		.funct3_i			(funct3),
	   //		.funct3_o			(funct3_o),

		.alu_add_sub_i	(alu_add_sub),
		.alu_shift_i	(alu_shift),
		.word_intercept_i(word_intercept),
		.alu_operation_i(alu_operation),
		.alu_op_num1_i	(alu_op_num1),
		.alu_op_num2_i	(alu_op_num2),
		.csr_instr_i	(csr_instr),
//		.csr_addr_i		(csr_addr),
		.csr_data_i			(csr_data_i),

		.hold_n			(hold_n),

		.data_rs1_o		(data_rs1_o),
		.data_rs2_o		(data_rs2_o),
		.addr_rd_o		(addr_wr_o),
		.reg_wr_en_o	(reg_wr_en_o),
		//.addr_instr_o	(addr_instr_o),

	//	.diff_instr_o   (diff_instr_o),
	//	.diff_pc_o      (diff_pc_o),
	//	.diff_instr_en_o(diff_instr_en_o) ,

		.load_code_o	(load_code_o),
		.store_code_o	(store_code_o),
		.op_code_o	(op_code_o),

		.alu_add_sub_o	(alu_add_sub_o),
		.alu_shift_o	(alu_shift_o),
		.word_intercept_o(word_intercept_o),
		.alu_operation_o(alu_operation_o),
		.alu_op_num1_o	(alu_op_num1_o),
		.alu_op_num2_o	(alu_op_num2_o),
		.csr_instr_o		(csr_instr_o),
//		.csr_addr_o			(csr_addr_o),
		.csr_data_o			(csr_data_o)
	);

endmodule
//ECNURVCORE
//AXI Bus master-interconnect
//Created by Chesed
//2021.08.25

//update in 0908


//pc_act *******************************************LEE
module ysyx_210295_if_axi_interface(
	input						clock				,
	input						reset			,
	
	output						stall_if 		,	

	//with core

	input	[`YSYX210295_BUS_ADDR_MEM]		pc				,
	input						pc_act			,
	input						instr_rd_en		,
	output	[`YSYX210295_BUS_DATA_INSTR]	instr 			,
	output	reg [`YSYX210295_BUS_ADDR_MEM]	addr_instr		,
	//with bus

	//address write

	//handshake
	/*
	input	      				awready_if	,
	output 	      				awvalid_if	,

	output	[`YSYX210295_BUS_AXI_AWID]		awid_if 	,
	output 	[`YSYX210295_BUS_ADDR_MEM]		awaddr_if	,

	//burst
	output 	[`YSYX210295_BUS_AXI_LEN] 		awlen_if	,
	output 	[`YSYX210295_BUS_AXI_SIZE] 	awsize_if	,
	output 	[`YSYX210295_BUS_AXI_BURST]	awburst_if	,


	//data write

	//handshake
	input	      				wready_if	,
	output 	      				wvalid_if	,

	output 	[`YSYX210295_BUS_DATA_MEM]		wdata_if	,
	output 	[`YSYX210295_BUS_AXI_STRB] 	wstrb_if	,

	//burst
	output 	      				wlast_if	,

	//write response
	input	[`YSYX210295_BUS_AXI_BID]		bid_if		,
	input	[`YSYX210295_BUS_AXI_RESP]		bresp_if	,

	//handshake
	input						bvalid_if	,
	output						bready_if	,
			*/
	//address read

	//handshake
	input	      				arready_if	,
	output 	      				arvalid_if	,

	output	[`YSYX210295_BUS_AXI_ARID]		arid_if		,
	output 	[`YSYX210295_BUS_ADDR_MEM]		araddr_if	,

	//burst
	output 	[`YSYX210295_BUS_AXI_LEN] 		arlen_if	,
	output 	[`YSYX210295_BUS_AXI_SIZE] 	arsize_if	,
	output 	[`YSYX210295_BUS_AXI_BURST]	arburst_if	,



	//data read
	//input	[`YSYX210295_BUS_AXI_RID] 		rid_if		,
	input	[`YSYX210295_BUS_DATA_MEM]		rdata_if	,
	//input	[`YSYX210295_BUS_AXI_RESP]		rresp_if	,

	//burst
	input	      				rlast_if	,

	
	//handshake
	input						rvalid_if 	,
	output						rready_if 	

);


	parameter [1:0] R_STATE_IDLE_if = 2'b00, R_STATE_WAIT_if = 2'b01, R_STATE_READ_if  = 2'b10;

	reg [`YSYX210295_BUS_DATA_INSTR] instr_t;
	wire[`YSYX210295_BUS_DATA_MEM] rdata_act;
	reg [`YSYX210295_BUS_ADDR_MEM] pc_t;
	reg [1:0] r_state_if;
	reg rvalid_if_t;
	wire r_state_idle_if;
	wire r_state_wait_if;
	wire r_state_read_if;
    wire mem_rd_wait_if;
    reg rd_if_start ;
    reg rd_if_start_reg ;
	wire rd_if_start_neg ;
	reg [63:0] rdata_if_valid ;

//	reg [`YSYX210295_BUS_DATA_MEM] rdata_act_t;
    assign arid_if = `YSYX210295_AXI_ID_IF;
/*
    //id set
    assign awid_if = `YSYX210295_AXI_ID_IF;
    
    
    
	//burst set
	assign awlen_if = `YSYX210295_AXI_LEN_ZERO;
	assign awsize_if = `YSYX210295_AXI_SIZE_DOUBLE;
	assign awburst_if = `YSYX210295_AXI_BURST_INCR;
*/
	assign arlen_if = `YSYX210295_AXI_LEN_ZERO;
	//assign arsize_if = `YSYX210295_AXI_SIZE_DOUBLE;
	assign arsize_if = `YSYX210295_AXI_SIZE_WORD;
	assign arburst_if = `YSYX210295_AXI_BURST_INCR;


	assign r_state_idle_if = r_state_if == R_STATE_IDLE_if;
	assign r_state_wait_if  = r_state_if == R_STATE_WAIT_if;
	assign r_state_read_if  = r_state_if == R_STATE_READ_if;



	//read-only
	/*
	assign awvalid_if = `YSYX210295_AXI_VALID_DIS;

    assign wlast_if = `YSYX210295_AXI_VALID_DIS;
    assign bready_if = `YSYX210295_AXI_READY_DIS;

	assign awaddr_if = `YSYX210295_MEM_ADDR_ZERO;
	assign wdata_if = `YSYX210295_ZERO_DOUBLE;
	assign wstrb_if = `YSYX210295_WR_STR_NONE;
    assign wvalid_if = `YSYX210295_AXI_VALID_DIS;

	*/
    //assign instr = (arready_if==`YSYX210295_AXI_READY_EN) ? (addr_instr[2] ? rdata_act[63:32] : rdata_act[31:0]) : instr_t ;

	

	always@(posedge clock) begin
	   if (reset) rvalid_if_t <= 1'b0;
	   else       rvalid_if_t <= rvalid_if;	
	end

    //assign instr = (rvalid_if_t==`YSYX210295_AXI_READY_EN) ? rdata_act[31:0] : instr_t ;  //1008
    assign instr = (r_state_idle_if & rvalid_if_t==`YSYX210295_AXI_READY_EN) ? rdata_act[31:0] : instr_t ; 
	
	always@(posedge clock) begin
		if(reset) begin
			instr_t <= `YSYX210295_ZERO_WORD;
		end
		else begin
			//if(arready_if) instr_t <= instr;
			//if(arready_if_t) instr_t <= instr;
			if(rvalid_if_t&r_state_idle_if) instr_t <= instr;
			else           instr_t <= instr_t;
		end
	end	

	//instruction fetch 
	
   	always @(posedge clock) begin  //1007
        if (reset) begin
            r_state_if <= R_STATE_IDLE_if;
        end
        else begin
                case (r_state_if)
                    R_STATE_IDLE_if: if (pc_act) begin
						                if(arready_if)  			 r_state_if <= R_STATE_READ_if;
										else                         r_state_if <= R_STATE_WAIT_if;
					                 end  			 
					                 else                            r_state_if <= R_STATE_IDLE_if;
					R_STATE_WAIT_if: if (arvalid_if & arready_if)    r_state_if <= R_STATE_READ_if;
					                 else                            r_state_if <= R_STATE_WAIT_if;
                    R_STATE_READ_if: if (rvalid_if)                  r_state_if <= R_STATE_IDLE_if;    
					                 else                            r_state_if <= R_STATE_READ_if;    
                    default:;
                endcase
        end
    end

	assign mem_rd_wait_if =  r_state_wait_if | r_state_read_if | (r_state_idle_if & pc_act);
    assign arvalid_if = pc_act | r_state_wait_if ;
	//assign arvalid_if = r_state_wait_if ;//1013
	assign stall_if =  mem_rd_wait_if;
	
	//assign stall_if =  mem_rd_wait_if;

	//assign araddr_if = {pc[63:3],3'b000};  //by ou
	assign araddr_if = pc;  //1007

	assign rready_if = 1'b1;
	//assign rready_if = r_state_read_if;


    always@(posedge clock) begin
	   if(reset) begin
		       rd_if_start <= 0;
			   rd_if_start_reg <= 0;
	   end    
	   else begin
		    rd_if_start_reg <= rd_if_start;	
	   		if(arvalid_if) 	   rd_if_start<=1;
	   		else if(rvalid_if) rd_if_start <= 0;
	   		else               rd_if_start <= rd_if_start ;
	   end
 	end
    
    assign rd_if_start_neg = (~rd_if_start) && ( rd_if_start_reg );  

	always@(posedge clock) begin
		if(reset)               rdata_if_valid <= 0;
		else if(rd_if_start_neg) rdata_if_valid <= rdata_if ;
	    else                     rdata_if_valid <= rdata_if_valid ;
	end
	
    assign rdata_act = rdata_if ;  // by ou
	



	always@(posedge clock) begin
		if(reset) begin
			pc_t <= `YSYX210295_BASE_PC;
		end
		else begin
			if(instr_rd_en) begin
				pc_t <= pc;
			end
			else begin
				pc_t <= pc_t;
			end
		end
	end		

	always@(posedge clock) begin
		if(reset) begin
			addr_instr <= `YSYX210295_BASE_PC;
		end
		else begin
			if(rlast_if) begin
				//addr_instr <= pc_t;
				addr_instr <= pc; //1008
			end
			else begin
				addr_instr <= addr_instr;
			end
		end
	end	




endmodule
//ECNURVCORE
//Pipeline CPU
//Created by Chesed
//2021.08.13


module ysyx_210295_if_stage(
	input	[`YSYX210295_BUS_HOLD_CODE]	hold_code 		,
	input	[`YSYX210295_BUS_DATA_INSTR]	instr_rd_i 		,
    input                       reset           ,
	
	//input						instr_mask_i	,
	input	[`YSYX210295_BUS_ADDR_MEM]		pc_i			,
	
	output						fetch_except_o	,
	output	[`YSYX210295_BUS_EXCEPT_CAUSE]	except_cause_o	,
	output	 [`YSYX210295_BUS_DATA_INSTR]	instr_rd_o 		,
	output					     	instr_rd_en_o
);
	
	//assign fetch_except_o = ((pc_i < `YSYX210295_BASE_PC)|(pc_i > `YSYX210295_PC_MAX)|(pc_i[1:0] != 2'b00)) ? `YSYX210295_EXCEPT_ACT : `YSYX210295_EXCEPT_NOPE;
	//assign except_cause_o = ((pc_i < `YSYX210295_BASE_PC)|(pc_i > `YSYX210295_PC_MAX)) ? `YSYX210295_EXCEPT_PC_OVER : ((pc_i[1:0] != 2'b00) ? `YSYX210295_EXCEPT_PC_ALIGN : `YSYX210295_EXCEPT_NONE);

	assign fetch_except_o = (pc_i > `YSYX210295_PC_MAX) ? `YSYX210295_EXCEPT_ACT : `YSYX210295_EXCEPT_NOPE;
    assign except_cause_o = (pc_i > `YSYX210295_PC_MAX) ? `YSYX210295_EXCEPT_PC_OVER : `YSYX210295_EXCEPT_NONE;  // by ou


	assign instr_rd_en_o = reset ? 0: ((hold_code < `YSYX210295_HOLD_CODE_IF) ? `YSYX210295_INSTR_RD_EN : `YSYX210295_INSTR_RD_DIS);
	//assign instr_rd_o = reset ? 0 :(((instr_mask_i == `YSYX210295_MASK_EN)) ? `YSYX210295_ZERO_WORD : instr_rd_i);//1008
	assign instr_rd_o = reset ? `YSYX210295_ZERO_WORD : instr_rd_i;

endmodule
//ECNURVCORE
//AXI Bus master-slave
//Created by Chesed
//2021.08.12
//Edited in 2021.08.19

//update in 0908


module ysyx_210295_mem_axi_interface(
	input						clock				,
	input						reset			,
	
	output						stall_mem		,
	input                       hold_n          ,
	
	input                       axi_rbusy       ,
	

	//with core

	//store/load
	input	[`YSYX210295_BUS_ADDR_MEM]		addr_mem_wr		,	
	input	[`YSYX210295_BUS_ADDR_MEM]		addr_mem_rd		,	
	input	[`YSYX210295_BUS_DATA_MEM]		data_mem_wr		,	
	input						mem_wr_en		,	
	input						mem_rd_en		,
	input   [`YSYX210295_BUS_AXI_STRB]     strb_mem_wr     ,	
	input   [`YSYX210295_BUS_AXI_SIZE]     size_mem_wr     ,	

	input   [`YSYX210295_BUS_AXI_SIZE]     size_mem_rd     ,			
	output	[`YSYX210295_BUS_DATA_MEM]		data_mem_rd		,

//with bus

	//address write

	//handshake
	input	      				awready_mem		,
	output 	      				awvalid_mem		,

	output	[`YSYX210295_BUS_AXI_AWID]		awid_mem		,
	output 	[`YSYX210295_BUS_ADDR_MEM]		awaddr_mem		,

	//burst
	output 	[`YSYX210295_BUS_AXI_LEN] 		awlen_mem		,
	output 	[`YSYX210295_BUS_AXI_SIZE] 	awsize_mem		,
	output 	[`YSYX210295_BUS_AXI_BURST]	awburst_mem		,





	//data write

	//handshake
	input	      				wready_mem		,
	output 	      				wvalid_mem		,

	output 	[`YSYX210295_BUS_DATA_MEM]		wdata_mem		,
	output 	[`YSYX210295_BUS_AXI_STRB] 	wstrb_mem		,

	//burst
	output 	      				wlast_mem		,



	//write response
	//input	[`YSYX210295_BUS_AXI_BID]		bid_mem			,
	//input	[`YSYX210295_BUS_AXI_RESP]		bresp_mem		,

	//handshake
	input						bvalid_mem		,
	output						bready_mem		,
			


	//address read

	//handshake
	input	      				arready_mem		,
	output 	      				arvalid_mem		,

	output	[`YSYX210295_BUS_AXI_ARID]		arid_mem		,
	output 	[`YSYX210295_BUS_ADDR_MEM]		araddr_mem		,

	//burst
	output 	[`YSYX210295_BUS_AXI_LEN] 		arlen_mem		,
	output 	[`YSYX210295_BUS_AXI_SIZE] 	arsize_mem		,
	output 	[`YSYX210295_BUS_AXI_BURST]	arburst_mem		,

	//data read
	//input	[`YSYX210295_BUS_AXI_RID] 		rid_mem			,
	input	[`YSYX210295_BUS_DATA_MEM]		rdata_mem		,
	//input	[`YSYX210295_BUS_AXI_RESP]		rresp_mem		,

	//burst
	//input	      				rlast_mem		,
	
	//handshake
	input						rvalid_mem 		,
	output						rready_mem

);

	
	//reg mem_rd_wait;
	reg mem_rd_aligned;
	reg [2:0] mem_rd_addr_bias;
	
	wire mem_rd_wait;     //by ou
	wire mem_wr_wait;     //by ou
	
	//reg mem_wr_wait;
	reg mem_wr_aligned;
	reg [2:0] mem_wr_addr_bias;

	reg data_wr_valid;
	reg data_act_page;//0~first 1~second

	reg [`YSYX210295_BUS_DATA_MEM] data_wr_act_first;
//	reg [`YSYX210295_BUS_DATA_MEM] data_wr_act_second;
	reg [`YSYX210295_BUS_AXI_STRB] strb_wr_act_first;
//	reg [`YSYX210295_BUS_AXI_STRB] strb_wr_act_second;

	reg [`YSYX210295_BUS_DATA_MEM] data_rd_t;
	reg	[`YSYX210295_BUS_DATA_MEM] data_mem_rd_act;
	//reg [`YSYX210295_BUS_DATA_MEM] data_mem_rd_t;


	reg [`YSYX210295_BUS_DATA_MEM] data_wr;
	wire [`YSYX210295_BUS_DATA_MEM] rdata_act;

	wire mem_aligned_aw;
	wire mem_aligned_ar;
	
	wire mem_wr_en_pos ;

	//mem
	wire stall_mem_wr;
	wire stall_mem_rd;
	
	wire mem_rd_en_pos;
	//reg mem_rd_en_reg;

	reg rvalid_mem_reg;
	reg mem_wr_en_reg ;

	wire rvalid_mem_neg ;
	wire rvalid_mem_pos ;

	//unaligned
	assign  mem_aligned_aw = (addr_mem_wr[2:0] == 3'b000) ? `YSYX210295_AXI_ADDR_ALIGN : `YSYX210295_AXI_ADDR_UNALIGN;
	assign  mem_aligned_ar = (addr_mem_rd[2:0] == 3'b000) ? `YSYX210295_AXI_ADDR_ALIGN : `YSYX210295_AXI_ADDR_UNALIGN;
    //assign  mem_aligned_ar = (addr_mem_rd[2:0] == 3'b000) ? `YSYX210295_AXI_ADDR_ALIGN : `YSYX210295_AXI_ADDR_ALIGN; //by ou

    //id set
    assign awid_mem = `YSYX210295_AXI_ID_MEM;
    assign arid_mem = `YSYX210295_AXI_ID_MEM;
    
    
	//burst set
	//assign awlen_mem = (mem_aligned_aw == `YSYX210295_AXI_ADDR_ALIGN) ? `YSYX210295_AXI_LEN_ZERO : `YSYX210295_AXI_OVER_PAGE;  //1007
    assign awlen_mem = `YSYX210295_AXI_LEN_ZERO ; 

	//assign awlen_mem = `YSYX210295_AXI_LEN_ZERO;
	//assign awsize_mem = `YSYX210295_AXI_SIZE_DOUBLE;
	assign awsize_mem = size_mem_wr;

	//assign awsize_mem = (awaddr_mem < 64'h8000_0000) ? 3'b010: 3'b011;//1010
	assign awburst_mem = `YSYX210295_AXI_BURST_FIX;

	//assign arlen_mem = (mem_aligned_ar == `YSYX210295_AXI_ADDR_ALIGN) ? `YSYX210295_AXI_LEN_ZERO : `YSYX210295_AXI_OVER_PAGE;
	assign arlen_mem = `YSYX210295_AXI_LEN_ZERO;  //1007

	assign arsize_mem = size_mem_rd;
	//assign arsize_mem = (araddr_mem < 64'h8000_0000) ? 3'b010: 3'b011;
	assign arburst_mem = `YSYX210295_AXI_BURST_FIX;


	//type-s

	//assign awvalid_mem = mem_wr_en_pos ; //by ou
	

    //assign wlast_mem = wvalid_mem & data_act_page;

	assign wlast_mem = wvalid_mem; //1009

    assign bready_mem = `YSYX210295_AXI_READY_EN;
	//assign stall_mem = mem_wr_wait | mem_rd_wait;
    assign stall_mem = stall_mem_wr | stall_mem_rd;  //1007

	//assign awaddr_mem = {addr_mem_wr[63:3],3'b000} + `YSYX210295_BASE_MEM;
	
	//assign awaddr_mem = addr_mem_wr;  //1008


    //assign awaddr_mem = {addr_mem_wr[63:3],3'b000};  //by ou
	//assign wdata_mem = data_wr_act_first ;
	//assign wstrb_mem = strb_wr_act_first ; //1009

	assign awaddr_mem = addr_mem_wr;  //by ou
	assign wdata_mem = data_wr_act_first ;
	assign wstrb_mem = strb_wr_act_first ; //1010
	//assign wdata_mem = data_wr ;
    //assign wstrb_mem = strb_mem_wr ; 


	//assign wstrb_mem = data_act_page ? strb_wr_act_second : strb_wr_act_first ; //1009
    //assign wstrb_mem = strb_mem_wr ; 
	//assign wstrb_mem = strb_wr_act_first ; //1009

    reg [1:0] r_state;
    parameter [1:0] R_STATE_IDLE = 2'b00, R_STATE_WAIT = 2'b01, R_STATE_READ  = 2'b10, R_STATE_END  = 2'b11;
	wire  r_state_wait  = r_state == R_STATE_WAIT, r_state_read  = r_state == R_STATE_READ, r_state_end  = r_state == R_STATE_END;
      // Read State Machine
	  /*
    always @(posedge clock) begin
        if (reset) begin
            r_state <= R_STATE_IDLE;
        end
        else begin
          //  if (r_valid) begin
                case (r_stte)
                    R_STATE_IDLE:                                   r_state <= R_STATE_ADDR;
                    R_STATE_ADDR: if (arready_mem & arvalid_mem)    r_state <= R_STATE_READ;
                    R_STATE_READ: if (rvalid_mem)                   if(arlen_mem == 0) begin r_state <= R_STATE_IDLE; end
					                                                else               begin r_state <= R_STATE_END;  end
					R_STATE_END:  if (rvalid_mem_neg)               r_state <= R_STATE_IDLE;
                    default:;
                endcase
           // end
        end
    end
	wire rd_mem_valid;
	assign rd_mem_valid = r_state_read | r_state_end | r_state_idle;
	assign mem_rd_wait =  r_state_read | r_state_end | r_state_idle;
	wire stall_mem_rd;
       //assign stall_mem_rd = (arready_mem & arvalid_mem) | mem_rd_wait;
       assign stall_mem_rd = (arvalid_mem) | mem_rd_wait;
*/

        always @(posedge clock) begin  //1007
        if (reset) begin
            r_state <= R_STATE_IDLE;
        end
        else begin
                case (r_state)
				    R_STATE_IDLE: if(mem_rd_en_pos)                                          r_state <= R_STATE_WAIT;
					              else                                                       r_state <= R_STATE_IDLE;
                    R_STATE_WAIT: if (arready_mem & arvalid_mem)   							 r_state <= R_STATE_READ;
					              else                                                       r_state <= R_STATE_WAIT; 
                    R_STATE_READ: if (rvalid_mem)begin
					                                                if(arlen_mem == 0) begin r_state <= R_STATE_IDLE; end
					                                                else               begin r_state <= R_STATE_END;  end end
								  else                                                       r_state <= R_STATE_READ; 
					R_STATE_END:  if (rvalid_mem_neg)               r_state <= R_STATE_IDLE;
					              else                              r_state <= R_STATE_END; 
                    default:;
                endcase
        end
    end
//	wire rd_mem_valid;
//	assign rd_mem_valid = r_state_read | r_state_end ;
	assign mem_rd_wait =  r_state_read | r_state_end ;
	
    //assign stall_mem_rd = (arready_mem & arvalid_mem) | mem_rd_wait;
   // assign stall_mem_rd = (arvalid_mem) | mem_rd_wait;
   assign stall_mem_rd =  mem_rd_wait;  //1015

	//assign arvalid_mem = mem_rd_en & (!rd_mem_valid_t ) ; //by ou
    //assign arvalid_mem = mem_rd_en_reg & r_state_wait; //by ou 1007
	assign arvalid_mem = r_state_wait | mem_rd_en_pos; //by ou 1013
	/*
    always@(posedge clock) begin
	   if(reset) begin
			   mem_rd_en_reg <= 0;
	   end    
	   else begin
               mem_rd_en_reg <= mem_rd_en ;
	   end
 	end
*/
    wire mem_rd_en_ok;
	reg  mem_rd_en_ok_reg;
	assign mem_rd_en_ok = mem_rd_en & (~hold_n);
	always@(posedge clock) begin
	   if(reset) begin
			   mem_rd_en_ok_reg <= 0;
	   end    
	   else begin
               mem_rd_en_ok_reg <= mem_rd_en_ok ;
	   end
 	end

	assign mem_rd_en_pos = (~mem_rd_en_ok_reg) && ( mem_rd_en_ok );   //by ou 1013

	reg [1:0] w_state;
	parameter [1:0] W_STATE_IDLE = 2'b00,  W_STATE_ADDR = 2'b01, W_STATE_WAIT = 2'b10, W_STATE_WRITE = 2'b11;
	wire  w_state_addr = w_state == W_STATE_ADDR, w_state_wait = w_state == W_STATE_WAIT, w_state_write = w_state == W_STATE_WRITE;

/*
    always @(posedge clock) begin
        if (reset) begin
            w_state <= W_STATE_IDLE;
        end
        else begin
            //if (w_valid) begin
                case (w_state)
                    W_STATE_IDLE:                                        w_state <= W_STATE_ADDR;
					//W_STATE_BEGIN: if (mem_wr_en_pos)                    w_state <= W_STATE_ADDR;
                    W_STATE_ADDR:  if (awvalid_mem)                      w_state <= W_STATE_WRITE;
                    W_STATE_WRITE: if (bvalid_mem)                       w_state <= W_STATE_IDLE;
                   default       :;
                endcase
            end
        
    end
	//wire wr_mem_valid;
    //assign wr_mem_valid = w_state_write | w_state_idle;
	assign mem_wr_wait =  w_state_write | w_state_idle;
   */ 
    
	always @(posedge clock) begin //1007
        if (reset) begin
            w_state <= W_STATE_IDLE;
        end
        else begin
                case (w_state)
				    W_STATE_IDLE:  if(mem_wr_en_pos)                     w_state <= W_STATE_ADDR;
					               else                                  w_state <= W_STATE_IDLE;
                    W_STATE_ADDR:  if (awvalid_mem & awready_mem)        w_state <= W_STATE_WAIT;
					               else                                  w_state <= W_STATE_ADDR;
					W_STATE_WAIT:  if (wvalid_mem & wready_mem)          w_state <= W_STATE_WRITE;
					               else                                  w_state <= W_STATE_WAIT;
                    W_STATE_WRITE: if (bvalid_mem)                       w_state <= W_STATE_IDLE;
					               else                                  w_state <= W_STATE_WRITE;
                   default       :;
                endcase
            end
        
    end

	assign mem_wr_wait =  w_state_write | w_state_wait;
	
	assign stall_mem_wr = awvalid_mem || mem_wr_wait;
    //assign awvalid_mem = mem_wr_en_pos || (hold_n_r & mem_wr_en); //by ou 1007

	assign awvalid_mem =  w_state_addr;
   // assign wvalid_mem = wr_valid | w_state_wait;
  //  assign wvalid_mem = data_wr_valid;

   	assign wvalid_mem = mem_wr_en_reg & (w_state_addr | w_state_wait); //1009

	/*
	reg wr_valid;
	always@(posedge clock) begin
		if(reset) wr_valid <= 0;
		else      wr_valid <= awvalid_mem & awready_mem;
	end
	*/
    
  //  reg hold_n_r ;
    always@(posedge clock) begin
	   if(reset) begin
			   mem_wr_en_reg <= 0;
	//		   hold_n_r <= 0;
	   end    
	   else begin
               //mem_wr_en_reg <= mem_wr_en  ;
			   mem_wr_en_reg <= mem_wr_en; //1009
	//		   hold_n_r <= hold_n ;
	   end
 	end

	wire mem_wr_en_ok;
	wire mem_wr_en_ok_r;

    assign mem_wr_en_ok = mem_wr_en & (~hold_n);
   
	ysyx_210295_gnrl_dff # (.DW(1)) diff_wr_en_ok(
	.clock		(clock),
	.reset		(reset),
	.wr_en		(1'b1),
	.data_in	(mem_wr_en_ok),
	.data_r_ini	(1'b0),

	.data_out	(mem_wr_en_ok_r)
);


	//assign mem_wr_en_pos = (~mem_wr_en_reg) && ( mem_wr_en );  
	//assign mem_wr_en_pos = (~mem_wr_en_reg) && ( mem_wr_en);  //1009
    assign mem_wr_en_pos = (~mem_wr_en_ok_r) && ( mem_wr_en_ok);  //1009

	/*
	reg rd_mem_valid_t;
	always@(posedge clock) begin
		if(reset)   rd_mem_valid_t <= 0 ;
		else         rd_mem_valid_t <= rd_mem_valid ;
	end   
	*/
	//type-l


    reg [`YSYX210295_BUS_DATA_MEM] rdata_act_t;
	always@(posedge clock ) begin
		if(reset) begin
			rdata_act_t <= 0 ;
		end
		else begin
			rdata_act_t <= rdata_act  ;
		end
	end
	
	//assign araddr_mem = {addr_mem_rd[63:3],3'b000} + `YSYX210295_BASE_MEM;
	
	assign araddr_mem = addr_mem_rd;  //by ou
    //assign araddr_mem = {addr_mem_rd[63:3],3'b000};  //by ou



	//assign arvalid_mem = mem_rd_en & (!rd_mem_start ) ; //by ou
	//assign arvalid_mem = mem_rd_en & (!rd_mem_start_t ) ; //by ou
	//assign arvalid_mem = mem_rd_en & (!r_done_2t);   //by ou
    //assign arvalid_mem = mem_rd_en ; //by ou
	
	
	
	//assign arvalid_mem = mem_rd_en & (!rlast_neg); //by ou
	//assign arvalid_mem = mem_rd_en & (!rvalid_mem_t);  //by ou

	//assign arvalid_mem = mem_rd_en & (!rvalid_mem_use);  //by ou
    assign rready_mem = mem_rd_wait;
	//assign rready_mem = mem_rd_en_t;
	//assign rready_mem = mem_rd_en_hold_n; //by ou
	
	//assign rdata_act = (rvalid_mem == `YSYX210295_AXI_VALID_EN) ? rdata_mem : `YSYX210295_ZERO_DOUBLE;
	assign rdata_act = (rvalid_mem == `YSYX210295_AXI_VALID_EN) ? rdata_mem : rdata_act_t ;
	//assign rdata_act = rdata_mem ; //by ou
   // assign data_mem_rd = mem_rd_wait ? data_mem_rd_act : data_mem_rd_t;
   assign data_mem_rd = data_mem_rd_act;
	//assign data_mem_rd = rdata_act;

	   always@(*) begin
		//case(mem_rd_addr_bias)
		case(araddr_mem[2:0])
			3'b000:		data_mem_rd_act = rdata_act;
			3'b001:		data_mem_rd_act = {rdata_act[7:0],rdata_act[63:8]};
			3'b010:		data_mem_rd_act = {rdata_act[15:0],rdata_act[63:16]};
			3'b011:		data_mem_rd_act = {rdata_act[23:0],rdata_act[63:24]};
			3'b100:		data_mem_rd_act = {rdata_act[31:0],rdata_act[63:32]};
			3'b101:		data_mem_rd_act = {rdata_act[39:0],rdata_act[63:40]};
			3'b110:		data_mem_rd_act = {rdata_act[47:0],rdata_act[63:48]};
			3'b111:		data_mem_rd_act = {rdata_act[55:0],rdata_act[63:56]};
			default:	data_mem_rd_act = rdata_act;
		endcase	
	end
/*
   always@(*) begin
		//case(mem_rd_addr_bias)
		case(araddr_mem[2:0])
			3'b000:		data_mem_rd_act = rdata_mem;
			3'b001:		data_mem_rd_act = {rdata_mem[7:0],rdata_mem[63:8]};
			3'b010:		data_mem_rd_act = {rdata_mem[15:0],rdata_mem[63:16]};
			3'b011:		data_mem_rd_act = {rdata_mem[23:0],rdata_mem[63:24]};
			3'b100:		data_mem_rd_act = {rdata_mem[31:0],rdata_mem[63:32]};
			3'b101:		data_mem_rd_act = {rdata_mem[39:0],rdata_mem[63:40]};
			3'b110:		data_mem_rd_act = {rdata_mem[47:0],rdata_mem[63:48]};
			3'b111:		data_mem_rd_act = {rdata_mem[55:0],rdata_mem[63:56]};
			default:	data_mem_rd_act = rdata_mem;
		endcase	
	end
*/
    always@(*) begin
		//case(mem_wr_addr_bias)
		case(awaddr_mem[2:0])
			3'b000: begin	
				data_wr_act_first = data_wr;
			//	data_wr_act_second = `YSYX210295_ZERO_DOUBLE;
				strb_wr_act_first = strb_mem_wr;
			//	strb_wr_act_second = `YSYX210295_WR_STR_NONE;
			end
			3'b001: begin
				data_wr_act_first = {data_wr[55:0],8'h0};
			//	data_wr_act_second = {56'h0,data_wr[63:56]};
				strb_wr_act_first = strb_mem_wr << 1;
			//	strb_wr_act_second = {7'b0,strb_mem_wr[7]};
			end
			3'b010: begin
				data_wr_act_first = {data_wr[47:0],16'h0};
			//	data_wr_act_second = {48'h0,data_wr[63:48]};
				strb_wr_act_first = strb_mem_wr << 2;
			//	strb_wr_act_second = {6'b0,strb_mem_wr[7:6]};
			end
			3'b011: begin
				data_wr_act_first = {data_wr[39:0],24'h0};
			//	data_wr_act_second = {40'h0,data_wr[63:40]};
				strb_wr_act_first = strb_mem_wr << 3;
			//	strb_wr_act_second = {5'b0,strb_mem_wr[7:5]};
			end
			3'b100: begin
				data_wr_act_first = {data_wr[31:0],32'h0};
			//	data_wr_act_second = {32'h0,data_wr[63:32]};
				strb_wr_act_first = strb_mem_wr << 4;
			//	strb_wr_act_second = {4'b0,strb_mem_wr[7:4]};
			end
			3'b101: begin
				data_wr_act_first = {data_wr[23:0],40'h0};
			//	data_wr_act_second = {24'h0,data_wr[63:24]};
				strb_wr_act_first = strb_mem_wr << 5;
			//	strb_wr_act_second = {3'b0,strb_mem_wr[7:3]};
			end
			3'b110: begin
				data_wr_act_first = {data_wr[15:0],48'h0};
			//	data_wr_act_second = {16'h0,data_wr[63:16]};
				strb_wr_act_first = strb_mem_wr << 6;
			//	strb_wr_act_second = {2'b0,strb_mem_wr[7:2]};
			end
			3'b111: begin
				data_wr_act_first = {data_wr[7:0],56'h0};
			//	data_wr_act_second = {8'h0,data_wr[63:8]};
				strb_wr_act_first = strb_mem_wr << 7;
			//	strb_wr_act_second = {1'b0,strb_mem_wr[7:1]};
			end
			default: begin
				data_wr_act_first = data_wr;
			//	data_wr_act_second = `YSYX210295_ZERO_DOUBLE;
				strb_wr_act_first = strb_mem_wr;
			//	strb_wr_act_second = `YSYX210295_WR_STR_NONE;
			end
		endcase	
	end

	/*
	always@(posedge clock) begin
		if(reset) begin
			data_mem_rd_t <= `YSYX210295_ZERO_DOUBLE;
		end
		else begin
			data_mem_rd_t <= data_mem_rd ;
		end
	end	
	*/
    
	wire rvalid_mem_ok ;
    assign rvalid_mem_ok = rvalid_mem & axi_rbusy ;
    always@(posedge clock ) begin
	   if(reset) begin
			   rvalid_mem_reg <= 0;
	   end    
	   else begin
	   		   rvalid_mem_reg <= rvalid_mem_ok;
	   end
 	end


    assign rvalid_mem_neg = (~rvalid_mem_ok) && ( rvalid_mem_reg );  
    assign rvalid_mem_pos = (~rvalid_mem_reg) && ( rvalid_mem_ok );  




always@(posedge clock ) begin
		if(reset) begin
			//mem_rd_wait <= 1'b0;
			mem_rd_aligned <= `YSYX210295_AXI_ADDR_ALIGN;
			mem_rd_addr_bias <= 3'b000;
		end
		else begin
			if(mem_rd_wait == 1'b1) begin
				//if(arready_mem&arvalid_mem) begin
				if(arvalid_mem) begin
				  	//mem_rd_wait <= 1'b1;
					mem_rd_aligned <= mem_aligned_ar;
					mem_rd_addr_bias <= addr_mem_rd[2:0];
				end
				else begin
					//mem_rd_wait <= mem_rd_wait;
					mem_rd_aligned <= mem_rd_aligned;
					mem_rd_addr_bias <= mem_rd_addr_bias;
				end
			end	
			else begin
				//if(rlast_mem) begin 
				//if(rvalid_mem) begin // by ou
				//if(rvalid_mem_neg & (~rd_mem_start)) begin  // by ou
				//if(rvalid_mem_neg) begin  // by ou
			    //if(rvalid_mem_neg & (~arvalid_mem)) begin  // by ou
				if(mem_rd_wait == 1'b0) begin 
					//mem_rd_wait <= 1'b0;
					mem_rd_aligned <= `YSYX210295_AXI_ADDR_ALIGN;
					mem_rd_addr_bias <= 3'b000;
				end
				else begin
					//mem_rd_wait <= mem_rd_wait;
					mem_rd_aligned <= mem_rd_aligned;
					mem_rd_addr_bias <= mem_rd_addr_bias;
				end
			end
		end
	end


    always@(posedge clock ) begin
		if(reset) begin
			//mem_wr_wait <= 1'b0;
			mem_wr_aligned <= `YSYX210295_AXI_ADDR_ALIGN;
			mem_wr_addr_bias <= 3'b000;
		end
		else begin
			if(mem_wr_wait == 1'b1) begin
				//if(awvalid_mem) begin
				  	//mem_wr_wait <= 1'b1;
					mem_wr_aligned <= mem_aligned_aw;
					mem_wr_addr_bias <= addr_mem_wr[2:0];
				//end
				//else begin
					//mem_wr_wait <= mem_wr_wait;
				//	mem_wr_aligned <= mem_wr_aligned;
				//	mem_wr_addr_bias <= mem_wr_addr_bias;
				//end
			end	
			else begin
				if(mem_wr_wait == 1'b0) begin
					//mem_wr_wait <= 1'b0;
					mem_wr_aligned <= `YSYX210295_AXI_ADDR_ALIGN;
					mem_wr_addr_bias <= 3'b000;
				end
				else begin
					//mem_wr_wait <= mem_wr_wait;
					mem_wr_aligned <= mem_wr_aligned;
					mem_wr_addr_bias <= mem_wr_addr_bias;
				end
			end
		end
	end

always@(posedge clock ) begin
		if(reset) begin
			data_wr <= `YSYX210295_ZERO_DOUBLE;
		end
		else begin
			if(mem_wr_en == `YSYX210295_MEM_WR_EN) begin
				data_wr <= data_mem_wr;
			end
			else begin
				data_wr <= data_wr;
			end
		end
    end
	always@(posedge clock ) begin
		if(reset) begin
			data_rd_t <= `YSYX210295_ZERO_DOUBLE;
		end
		else begin
			//if(mem_rd_wait & rvalid_mem) begin
			if(rvalid_mem_pos) begin  //by ou
				data_rd_t <= rdata_act;
			end
			else begin
				data_rd_t <= data_rd_t;
			end
		end
    end
	always@(posedge clock ) begin
		if(reset) begin
			data_wr_valid <= `YSYX210295_AXI_VALID_DIS;
			data_act_page <= 1'b0;
		end
		else begin
			if(mem_wr_wait == 1'b0) begin
				data_wr_valid <= `YSYX210295_AXI_VALID_DIS;
				data_act_page <= 1'b0;
			end
			else begin
				if(data_wr_valid == `YSYX210295_AXI_VALID_EN) begin
					if(data_act_page==1'b0) begin
						data_act_page <= 1'b1;
						data_wr_valid <= `YSYX210295_AXI_VALID_DIS;
					end
					else begin
						data_act_page <= data_act_page;
						data_wr_valid <= `YSYX210295_AXI_VALID_DIS;
					end
				end
				else begin
					data_act_page <= data_act_page;
					data_wr_valid <= wready_mem ? `YSYX210295_AXI_VALID_EN : `YSYX210295_AXI_VALID_DIS;
					//data_wr_valid <= `YSYX210295_AXI_VALID_EN ;//1008
				end
			end
		end
	end


endmodule
//ECNURVCORE
//Pipeline CPU
//Created by Chesed
//2021.07.20
//Edited in 2021.07.26

module ysyx_210295_pc(
	input						clock			,
	input						reset		,
	input	[`YSYX210295_BUS_HOLD_CODE]	hold_code	,

	input						jmp_en		,
	input	[`YSYX210295_BUS_ADDR_MEM]		jmp_to		,

	output reg [`YSYX210295_BUS_ADDR_MEM]	addr_instr,
	output reg 					pc_act,
	output						hold_n
);

	//reg [`YSYX210295_BUS_ADDR_MEM]	addr_instr;

	assign hold_n = reset ? 0 : ((hold_code >= `YSYX210295_HOLD_CODE_PC) ? `YSYX210295_HOLD_EN : `YSYX210295_HOLD_DIS);
    /*
	ysyx_210295_gnrl_dff # (.DW(64)) diff_pc_r(
	.clock		(clock),
	.reset		(reset),
	.wr_en		(hold_n),
	.data_in	(addr_instr),
	.data_r_ini	(`YSYX210295_BASE_PC),

	.data_out	(addr_instr_pc_o)
);
	*/

    //pc_act *******************Lee
	
	always @(posedge clock)begin
		if(reset) begin
			//addr_instr <= `YSYX210295_BASE_PC;
			addr_instr <= 0;
			pc_act <= 1'b0;
		end
		else begin
			if(! hold_n) begin
				addr_instr <= addr_instr;
				pc_act <= 1'b0;
			end
			else begin
				if(addr_instr == 0) begin
					addr_instr <= `YSYX210295_BASE_PC;
					pc_act <= 1'b1;
				end
				else begin
					if(jmp_en) begin
						addr_instr <= jmp_to;
						pc_act <= 1'b1;
					end
					else begin
						addr_instr <= addr_instr + `YSYX210295_PC_STEP;
						pc_act <= 1'b1;
					end
				end
			end
		end
	end

endmodule


//ECNURVCORE
//Pipeline CPU

// WPRI: Reserved writes preserve values, reads ignore value


module ysyx_210295_reg_csr
(
	input						clock				,
	input						reset			,
	input                       hold_n,  //by ou
	
	input						ex_we 		,// by ou
	input	[`YSYX210295_BUS_CSR_IMM]		ex_waddr_i		,
	input	[`YSYX210295_BUS_CSR_IMM]		ex_raddr_i		,
//	input	[`YSYX210295_BUS_CSR_IMM]		id_raddr_i,
	input	[`YSYX210295_BUS_DATA_REG]		ex_data_i 		,
	output	[`YSYX210295_BUS_DATA_REG]		ex_data_o 		,
	
	input						clt_we_i 		,
	input	[`YSYX210295_BUS_CSR_IMM]		clt_waddr_i		,
	input	[`YSYX210295_BUS_DATA_REG]		clt_data_i 		,
	//output	[`YSYX210295_BUS_DATA_REG]		clt_data_o 		,
	
	output	[`YSYX210295_BUS_DATA_REG]		csr_mstatus		,
	output	[`YSYX210295_BUS_DATA_REG]		csr_mie			,
	output	[`YSYX210295_BUS_DATA_REG]		csr_mtvec		,		
	output	[`YSYX210295_BUS_DATA_REG]		csr_mepc          
);

	wire [`YSYX210295_BUS_DATA_REG]		csr_misa;
	wire [`YSYX210295_BUS_DATA_REG]		csr_mscratch;
	wire [`YSYX210295_BUS_DATA_REG]		csr_mcause;
	wire [`YSYX210295_BUS_DATA_REG]		csr_mtval;
	wire [`YSYX210295_BUS_DATA_REG]		csr_mip;
	wire [`YSYX210295_BUS_DATA_REG]		csr_mcycle;
	wire [`YSYX210295_BUS_DATA_REG]		csr_mhartid;
//	wire [`YSYX210295_BUS_DATA_REG]		csr_minstret;
	


    //assign clt_data_o = 0;
	wire ex_we_ok;
	assign ex_we_ok = ex_we & (~hold_n) ;
	wire	[`YSYX210295_BUS_DATA_REG]	csr_next;
	wire	[`YSYX210295_BUS_CSR_IMM]	csr_waddr,csr_raddr;

	wire ex_we_ok_r;
wire ex_we_ok_pos;
ysyx_210295_gnrl_dff # (.DW(1)) diff_ex_we_ok_r(
	.clock		(clock),
	.reset		(reset),
	.wr_en		(1'b1),
	.data_in	(ex_we_ok),
	.data_r_ini	(1'b0),

	.data_out	(ex_we_ok_r)
);
assign ex_we_ok_pos = ex_we_ok && (~ex_we_ok_r) ;

wire ex_we_i;
assign ex_we_i = ex_we_ok_pos;
	
	assign csr_next  =   ex_we_i  ? ex_data_i  : (  clt_we_i  ? clt_data_i : `YSYX210295_ZERO_DOUBLE);
	assign csr_waddr =   ex_we_i  ? ex_waddr_i : (  clt_we_i  ? clt_waddr_i : 12'b0);

	assign csr_raddr = ex_raddr_i;
	
	// ================================ minstret ================================
	/*
	wire					minstret_sel,minstret_ena;
	wire	[`YSYX210295_BUS_DATA_REG]	minstret_init;
	wire	[`YSYX210295_BUS_DATA_REG]	minstret_nxt;
	

	assign minstret_sel = csr_waddr == `YSYX210295_CSR_MINSTRET;
	assign minstret_ena = minstret_sel & (ex_we_i | clt_we_i);

	assign minstret_init = `YSYX210295_ZERO_DOUBLE;

	ysyx_210295_gnrl_dff # (.DW(`YSYX210295_DATA_WIDTH)) dff_minstret
	(
		.clock		(clock),
		.reset		(reset),
		.wr_en		(minstret_ena),
		.data_in	(csr_next),
		.data_r_ini	(minstret_init),
		.data_out	(csr_minstret)
	);
*/



	// ================================ mstatus ================================
	wire					mstatus_sel,mstatus_ena;
	wire	[`YSYX210295_BUS_DATA_REG]	mstatus_init;
	
	assign mstatus_sel = csr_waddr == `YSYX210295_CSR_MSTATUS;
	//assign mstatus_ena = mstatus_sel & clt_we_i;
	assign mstatus_ena = mstatus_sel & (ex_we_i | clt_we_i);  
	wire    [`YSYX210295_BUS_DATA_REG]    next_mstatus;
    assign next_mstatus = { ((csr_next[16:15]==2'b11) | (csr_next[14:13]==2'b11)),
									   csr_next[62:0]};  //by ou

	assign mstatus_init = {51'b0, 
						   2'b0,		    // MPP
						   3'b0,
						   1'b0,			// MPIE
						   3'b0,
						   1'b1,			// MIE
						   3'b0};
	
	ysyx_210295_gnrl_dff # (.DW(`YSYX210295_DATA_WIDTH)) dff_mstatus
	(
		.clock		(clock),
		.reset		(reset),
		.wr_en		(mstatus_ena),
		//.data_in	(csr_next),
		.data_in	(next_mstatus),
		.data_r_ini	(mstatus_init),
		.data_out	(csr_mstatus)
	);
	
	// ================================ misa ================================
	wire					misa_sel,misa_ena;
	wire	[`YSYX210295_BUS_DATA_REG]	misa_init;
	
	
	assign misa_sel = csr_waddr == `YSYX210295_CSR_MISA;
	//assign misa_ena = misa_sel & clt_we_i;
	assign misa_ena = misa_sel & (ex_we_i | clt_we_i); 

	assign misa_init = `YSYX210295_ISA_RV64I;
	
	ysyx_210295_gnrl_dff # (.DW(`YSYX210295_DATA_WIDTH)) dff_misa
	(
		.clock		(clock),
		.reset		(reset),
		.wr_en		(misa_ena),
		.data_in	(csr_next),
		.data_r_ini	(misa_init),
		.data_out	(csr_misa)
	);
	
	// ================================ mie ================================
	wire					mie_sel,mie_ena;
	wire	[`YSYX210295_BUS_DATA_REG]	mie_init;
	
	assign mie_sel = csr_waddr == `YSYX210295_CSR_MIE;
	//assign mie_ena = mie_sel & clt_we_i;
      assign mie_ena = mie_sel & (ex_we_i | clt_we_i);  

	
	assign mie_init = {52'b0,
					   1'b0,			// MEIE
					   3'b0,
					   1'b0,			// MTIE
					   3'b0,
					   1'b0,			// MSIE
					   3'b0};
	
	ysyx_210295_gnrl_dff # (.DW(`YSYX210295_DATA_WIDTH)) dff_mie
	(
		.clock		(clock),
		.reset		(reset),
		.wr_en		(mie_ena),
		.data_in	(csr_next),
		.data_r_ini	(mie_init),
		.data_out	(csr_mie)
	);

	// ================================ mtvec ================================
	wire					mtvec_sel,mtvec_ena;
	wire	[`YSYX210295_BUS_DATA_REG]	mtvec_init;
	
	assign mtvec_sel = csr_waddr == `YSYX210295_CSR_MTVEC;
	//assign mtvec_ena = mtvec_sel & clt_we_i;
      assign mtvec_ena = mtvec_sel & (ex_we_i | clt_we_i); 
	
	assign mtvec_init = `YSYX210295_IRQ_ENTRY_INIT;
	
	ysyx_210295_gnrl_dff # (.DW(`YSYX210295_DATA_WIDTH)) dff_mtvec
	(
		.clock		(clock),
		.reset		(reset),
		.wr_en		(mtvec_ena),
		.data_in	(csr_next),
		.data_r_ini	(mtvec_init),
		.data_out	(csr_mtvec)
	);
	
	// ================================ mscratch ================================
	wire					mscratch_sel,mscratch_ena;
	wire	[`YSYX210295_BUS_DATA_REG]	mscratch_init;
	
	
	assign mscratch_sel = csr_waddr == `YSYX210295_CSR_MSCRATCH;
	//assign mscratch_ena = mscratch_sel & clt_we_i;
	assign mscratch_ena = mscratch_sel & (ex_we_i | clt_we_i); 

	assign mscratch_init = `YSYX210295_ZERO_DOUBLE;
	
	ysyx_210295_gnrl_dff # (.DW(`YSYX210295_DATA_WIDTH)) dff_mscratch
	(
		.clock		(clock),
		.reset		(reset),
		.wr_en		(mscratch_ena),
		.data_in	(csr_next),
		.data_r_ini	(mscratch_init),
		.data_out	(csr_mscratch)
	);
	
	// ================================ mepc ================================
	wire					mepc_sel,mepc_ena;
	wire	[`YSYX210295_BUS_DATA_REG]	mepc_init;
	
	assign mepc_sel = csr_waddr == `YSYX210295_CSR_MEPC;
	//assign mepc_ena = mepc_sel & clt_we_i;
      assign mepc_ena = mepc_sel & (ex_we_i | clt_we_i);  

	assign mepc_init = `YSYX210295_ZERO_DOUBLE;

	ysyx_210295_gnrl_dff # (.DW(`YSYX210295_DATA_WIDTH)) dff_mepc
	(
		.clock		(clock),
		.reset		(reset),
		.wr_en		(mepc_ena),
		.data_in	(csr_next),
		.data_r_ini	(mepc_init),
		.data_out	(csr_mepc)
	);
	
	// ================================ mcause ================================
	wire					mcause_sel,mcause_ena;
	wire	[`YSYX210295_BUS_DATA_REG]	mcause_init;
	
	
	assign mcause_sel = csr_waddr == `YSYX210295_CSR_MCAUSE;
	//assign mcause_ena = mcause_sel & clt_we_i;
      assign mcause_ena = mcause_sel & (ex_we_i | clt_we_i);  
	
	assign mcause_init = `YSYX210295_ZERO_DOUBLE;
	
	ysyx_210295_gnrl_dff # (.DW(`YSYX210295_DATA_WIDTH)) dff_mcause
	(
		.clock		(clock),
		.reset		(reset),
		.wr_en		(mcause_ena),
		.data_in	(csr_next),
		.data_r_ini	(mcause_init),
		.data_out	(csr_mcause)
	);
	
	// ================================ mtval ================================
	wire					mtval_sel,mtval_ena;
	wire	[`YSYX210295_BUS_DATA_REG]	mtval_init;
	
	
	assign mtval_sel = csr_waddr == `YSYX210295_CSR_MTVAL;
	//assign mtval_ena = mtval_sel & clt_we_i;
      assign mtval_ena = mtval_sel & (ex_we_i | clt_we_i);  

	assign mtval_init = `YSYX210295_ZERO_DOUBLE;
	
	ysyx_210295_gnrl_dff # (.DW(`YSYX210295_DATA_WIDTH)) dff_mtval
	(
		.clock		(clock),
		.reset		(reset),
		.wr_en		(mtval_ena),
		.data_in	(csr_next),
		.data_r_ini	(mtval_init),
		.data_out	(csr_mtval)
	);
	
	// ================================ mip ================================
	wire					mip_sel,mip_ena;
	wire	[`YSYX210295_BUS_DATA_REG]	mip_init;
	
	
	assign mip_sel = csr_waddr == `YSYX210295_CSR_MIP;
	//assign mip_ena = mip_sel & clt_we_i;
      assign mip_ena = mip_sel & (ex_we_i | clt_we_i);  

	assign mip_init = `YSYX210295_ZERO_DOUBLE;
	
	ysyx_210295_gnrl_dff # (.DW(`YSYX210295_DATA_WIDTH)) dff_mip
	(
		.clock		(clock),
		.reset		(reset),
		.wr_en		(mip_ena),
		.data_in	(csr_next),
		.data_r_ini	(mip_init),
		.data_out	(csr_mip)
	);
	
	// ================================ mcycle ================================
	wire					mcycle_sel,mcycle_ena;
	wire	[`YSYX210295_BUS_DATA_REG]	mcycle_init;
	wire	[`YSYX210295_BUS_DATA_REG]	mcycle_nxt;
	
	
	assign mcycle_sel = csr_waddr == `YSYX210295_CSR_MCYCLE;
	//assign mcycle_ena = mcycle_sel & clt_we_i;
      assign mcycle_ena = mcycle_sel & (ex_we_i | clt_we_i); 
	
	assign mcycle_init = `YSYX210295_ZERO_DOUBLE;
	assign mcycle_nxt  = mcycle_ena ? csr_next : csr_mcycle + 64'b1;
	
	ysyx_210295_gnrl_dff # (.DW(`YSYX210295_DATA_WIDTH)) dff_mcycle
	(
		.clock		(clock),
		.reset		(reset),
		.wr_en		(1'b1),
		.data_in	(mcycle_nxt),
		.data_r_ini	(mcycle_init),
		.data_out	(csr_mcycle)
	);
	
	// ================================ mhartid ================================
	wire					mhartid_sel,mhartid_ena;
	wire	[`YSYX210295_BUS_DATA_REG]	mhartid_init;

	
	assign mhartid_sel = csr_waddr == `YSYX210295_CSR_MHARTID;
	//assign mhartid_ena = mhartid_sel & clt_we_i;
      assign mhartid_ena = mhartid_sel & (ex_we_i | clt_we_i); 

	assign mhartid_init = `YSYX210295_ZERO_DOUBLE;
	
	ysyx_210295_gnrl_dff # (.DW(`YSYX210295_DATA_WIDTH)) dff_mhartid
	(
		.clock		(clock),
		.reset		(reset),
		.wr_en		(mhartid_ena),
		.data_in	(csr_next),
		.data_r_ini	(mhartid_init),
		.data_out	(csr_mhartid)
	);
	
	
	reg		[`YSYX210295_BUS_DATA_REG]	csr_val_rd;

	assign ex_data_o = csr_val_rd;
	
	always @(*) begin
		case (csr_raddr)
	
			`YSYX210295_CSR_MSTATUS  : csr_val_rd = csr_mstatus;
			`YSYX210295_CSR_MISA     : csr_val_rd = csr_misa;
			`YSYX210295_CSR_MIE      : csr_val_rd = csr_mie;
			`YSYX210295_CSR_MTVEC    : csr_val_rd = csr_mtvec;
//			12'h306: csr_val_rd = csr_mcounteren;
//			12'hf11: csr_val_rd = csr_mvendorid;
//			12'hf12: csr_val_rd = csr_marchid;
//			12'hf13: csr_val_rd = csr_mimpid;
			`YSYX210295_CSR_MSCRATCH : csr_val_rd = csr_mscratch;
			`YSYX210295_CSR_MEPC     : csr_val_rd = csr_mepc;
			`YSYX210295_CSR_MCAUSE   : csr_val_rd = csr_mcause;
			`YSYX210295_CSR_MTVAL    : csr_val_rd = csr_mtval;
			`YSYX210295_CSR_MIP      : csr_val_rd = csr_mip;
			`YSYX210295_CSR_MCYCLE   : csr_val_rd = csr_mcycle;
			`YSYX210295_CSR_MHARTID  : csr_val_rd = csr_mhartid;
//			12'hb80: csr_val_rd = csr_mcycle_h;
//			12'hb02: csr_val_rd = csr_minstret_l;
//			12'hb82: csr_val_rd = csr_minstret_h;
//			12'h7b0: csr_val_rd = i_dcsr;
//			12'h7b1: csr_val_rd = i_dpc;
//			12'h7b2: csr_val_rd = i_dscratch;
			
			default: csr_val_rd = 64'b0;
		endcase
	end
	
	
endmodule
//ECNURVCORE
//Pipline CPU
//Created by Chesed
//2021.07.22


module ysyx_210295_regs
(
	input						clock			,
	input						reset		,

	input						wr_en		,
	input	[`YSYX210295_BUS_ADDR_REG]		addr_wr		,
	input	[`YSYX210295_BUS_ADDR_REG]		addr_rd1	,
	input	[`YSYX210295_BUS_ADDR_REG]		addr_rd2	,
	input	[`YSYX210295_BUS_DATA_REG]		data_wr		,


	output reg	[`YSYX210295_BUS_DATA_REG]	data_rd1	,
	output reg	[`YSYX210295_BUS_DATA_REG]	data_rd2    
	//output wire [`YSYX210295_REG_BUS] regs_o[0 :31]        // difftest
);

	
//	wire [`YSYX210295_REG_BUS] regs_o[0 :31];
	reg [`YSYX210295_BUS_DATA_REG] register_x[0:31]; //x0 is always 0

/*
	genvar j;
	generate
		for (j = 0; j < 32; j = j + 1) begin
			assign regs_o[j] = (wr_en & addr_wr == j & j != 0) ? data_wr : register_x[j];
		end
	endgenerate
*/
    integer i;
	always@(posedge clock) begin
		if(reset) begin
			for(i=0;i<`YSYX210295_REG_NUM;i=i+1)begin
				register_x[i] <= `YSYX210295_ZERO_DOUBLE;
			end
		end
		else begin
			if((addr_wr != `YSYX210295_REG_ADDR_ZERO) & (wr_en == `YSYX210295_REG_WR_EN)) begin
				register_x[addr_wr] <= data_wr;
			end
		end
	end

	always@(*) begin
		if(addr_rd1 == `YSYX210295_REG_ADDR_ZERO) begin
			data_rd1 =`YSYX210295_ZERO_DOUBLE;
		end
		else begin
			if((wr_en == `YSYX210295_REG_WR_EN) & (addr_rd1 == addr_wr)) begin
				if( addr_rd1 != 0 )    data_rd1 = data_wr ;
				else                   data_rd1 = 0 ;
			end
			else begin
				data_rd1 = register_x[addr_rd1];
			end
		end
	end

	always@(*) begin
		if(addr_rd2 == `YSYX210295_REG_ADDR_ZERO) begin
			data_rd2 = `YSYX210295_ZERO_DOUBLE;
		end
		else begin
			if((wr_en == `YSYX210295_REG_WR_EN) & (addr_rd2 == addr_wr)) begin
				if( addr_rd2 != 0 )    data_rd2 = data_wr ;
				else                   data_rd2 = 0 ;
			end
			else begin
				data_rd2 = register_x[addr_rd2];
			end
		end
	end

endmodule


module ysyx_210295_timer
(
    input wire clock,
    input wire reset,
	
	//write address channel
	input wire [`YSYX210295_ADDR_WIDTH-1:0] saxi_awaddr,
	input wire saxi_awvalid,
	output reg saxi_awready,
	//output wire saxi_awready,
	
	//read address channel
	input wire [`YSYX210295_ADDR_WIDTH-1:0] saxi_araddr,
	input wire saxi_arvalid,
	output reg saxi_arready,
	

	//write data channel
	input wire saxi_wvalid,
	output reg saxi_wready,
	input wire [`YSYX210295_DATA_WIDTH-1:0] saxi_wdata,
	
	//read data channel
	output reg  saxi_rvalid,
	input wire saxi_rready,
	output reg [`YSYX210295_DATA_WIDTH-1:0] saxi_rdata,
	
	//write response channel
	output reg saxi_bvalid,
	input wire saxi_bready,

    //output wire[`YSYX210295_DATA_WIDTH:0] mtime_o,
	//output wire[`YSYX210295_DATA_WIDTH:0] mtimecmp_o,

    output time_irq_o
);
//wire saxi_arready;  //by ou
reg [`YSYX210295_DATA_WIDTH-1:0] mtime;
reg [`YSYX210295_DATA_WIDTH-1:0] mtimecmp;


//AXI write address channel
//assign saxi_awready = saxi_awvalid; 

always @(posedge clock)
begin
	if (reset)
	begin
		saxi_awready <= 1'b0;
	end
	else begin
		if (saxi_awvalid) begin
			saxi_awready <= 1'b1;
		end
		else begin
			saxi_awready <= 1'b0;
		end
	end
end
reg [`YSYX210295_ADDR_WIDTH-1:0] axi_awaddr_buf; //Reg for address need to be wirtten


always @(posedge clock)
begin
	if (reset)
	begin
		axi_awaddr_buf <= 32'b0;
	end
	else begin
		if (saxi_awvalid && saxi_awready) begin
			axi_awaddr_buf <= saxi_awaddr;
		end
	end
end

reg [`YSYX210295_ADDR_WIDTH-1:0] axi_waddr; // the address need to be wirtten

always@(*)
begin
	if (saxi_wvalid && saxi_wready && saxi_awvalid && saxi_awready) begin 
		axi_waddr = saxi_awaddr;  		//the address is now available on the interface
	end 
	else begin
		axi_waddr = axi_awaddr_buf;		//the address is assigned in previous command
	end
end

//assign saxi_wready = saxi_wvalid;
//AXI write data channel

always @(posedge clock)
begin
	if (reset)
	begin
		saxi_wready <= 1'b0;
	end
	else begin
		if (saxi_awvalid & saxi_awready) begin
			saxi_wready <= 1'b1;
		end
		else begin
			 if (saxi_wvalid & saxi_wready) begin
				//if (saxi_wvalid ) saxi_wready <= 1'b0;
				//else saxi_wready <= saxi_wready;
				saxi_wready <= 1'b0;
			end 
			else begin
				saxi_wready <= saxi_wready;
			end
		end
	end
end


//Response request
reg axi_need_resp; //a write operation, need response

always @(posedge clock)
begin
	if (reset)
	begin
		axi_need_resp <= 1'b0;
	end
	else begin
		if (saxi_wvalid && saxi_wready) begin
			axi_need_resp <= 1'b1;
		end
		else begin
			axi_need_resp <= 1'b0;
		end 
	end
end

//AXI write response section
always @(posedge clock)
begin
	if (reset)
	begin
		saxi_bvalid <= 1'b0;
	end
	else begin
		if (axi_need_resp) begin
			saxi_bvalid <= 1'b1;  //when need to response
		end
		else if (saxi_bvalid && saxi_bready) begin
			saxi_bvalid <= 1'b0;  //when response was received
		end 
	end
end

//AXI read address section
//assign saxi_arready = saxi_arvalid;  // by ou

always @(posedge clock)
begin
	if (reset)
	begin
		saxi_arready <= 1'b0;
	end
	else begin
		if (saxi_arvalid) begin
			saxi_arready <= 1'b1;
		end
		else begin
			saxi_arready <= 1'b0;
		end
	end
end




reg [`YSYX210295_ADDR_WIDTH-1:0] axi_raddr; // the address need to be read
reg axi_need_read; //A read operation, need 

always @(posedge clock)
begin
	if (reset)
	begin
		axi_raddr <= {`YSYX210295_ADDR_WIDTH{1'b0}};
		axi_need_read <= 1'b0;
	end
	else begin
		if (saxi_arvalid && saxi_arready) begin  //by ou
			axi_raddr <= saxi_araddr;
			axi_need_read <= 1'b1;
		end
		else begin
			axi_need_read <= 1'b0;
		end
	end
end


//AXI read data section
reg axi_wait_for_read; //read wait mode,waiting for master ready signal
reg [`YSYX210295_DATA_WIDTH-1:0]axi_data_to_read;
always @(posedge clock)
begin
	if (reset)
	begin
		saxi_rvalid <= 1'b0;
		saxi_rdata <= {`YSYX210295_DATA_WIDTH{1'b0}};
		axi_wait_for_read <=1'b0;
	end
	else begin
		if (axi_wait_for_read && saxi_rready) begin  
			saxi_rdata <= axi_data_to_read;
			saxi_rvalid <= 1'b1;
			axi_wait_for_read <= 1'b0;					//exit wait for read mode
		end
		else if (axi_need_read && saxi_rready) begin  	//ready signal is assigned, read now 
			saxi_rdata <= axi_data_to_read;		
			saxi_rvalid <= 1'b1;
		end
		else if (axi_need_read) begin  					//wait ready signal for read
			axi_wait_for_read <= 1'b1;					//enter wait for read mode
			saxi_rvalid <= 1'b0;				
		end
		else begin
			saxi_rvalid <= 1'b0;
		end
	end
end

//AXI register read
always @(*)
begin
	case(axi_raddr)
		(`YSYX210295_CLINT_MTIME): 	axi_data_to_read = mtime;
		(`YSYX210295_CLINT_MTIMECMP): 	axi_data_to_read = mtimecmp;
	default: axi_data_to_read = {`YSYX210295_DATA_WIDTH{1'b0}};
	endcase
	
end


//AXI register write
//Timer Control
reg timer_irq;
assign time_irq_o = timer_irq;

always @(posedge clock)
begin
	if (reset)
	begin   //REG RESET VALUE
		mtime <= 64'b0;
		//mtimecmp <= 64'hFFFFFFFFFFFFFFFF;
		//mtimecmp <= 64'h00000000000FFFFF;
	    mtimecmp <= 64'h0000000000000000;
		timer_irq <= 1'b0;
	end
	else begin
		if (saxi_wvalid && saxi_wready)
		begin
			case (axi_waddr)
			(`YSYX210295_CLINT_MTIME): mtime <= saxi_wdata;
			(`YSYX210295_CLINT_MTIMECMP): mtimecmp <= saxi_wdata;
			default: begin end //do nothing
			endcase
		end
		else begin
			mtime <= mtime +1'b1;
			if (mtime < mtimecmp) timer_irq <= 1'b0;
			else  timer_irq <= 1'b1;
		end
	end
end

endmodule
//ECNURVCORE
//Pipeline CPU
//Created by Chesed
//2021.08.08

//update in 09.09


module ysyx_210295(
	input				clock				,
	input				reset			,
	input 				io_interrupt,

//with bus

	//address write

	//handshake
	input	      		io_master_awready	,
	output 	      		io_master_awvalid	,
	output	[3:0]		io_master_awid 		,
	output 	[31:0]		io_master_awaddr	,
	output 	[7:0] 		io_master_awlen		,
	output 	[2:0]	 	io_master_awsize	,
	output 	[1:0]		io_master_awburst	,
	input		      	io_master_wready	,
	output				io_master_wvalid	,
	output 	[63:0]		io_master_wdata		,
	output 	[7:0]	 	io_master_wstrb		,
	output				io_master_wlast		,
	input	[3:0]		io_master_bid     	,
	input	[1:0]		io_master_bresp		,
	input				io_master_bvalid	,
	output				io_master_bready	,
	input		      	io_master_arready	,
	output 		      	io_master_arvalid	,
	output	[3:0]		io_master_arid 		,
	output 	[31:0]		io_master_araddr	,
	output 	[7:0] 		io_master_arlen		,
	output 	[2:0] 		io_master_arsize	,
	output 	[1:0]		io_master_arburst	,
	input	[3:0] 		io_master_rid 		,
	input	[63:0]		io_master_rdata		,
	input	[1:0]		io_master_rresp		,
	input	      		io_master_rlast		,
	input				io_master_rvalid 	,
	output				io_master_rready	,

	//axi dma slave port
	output		      	io_slave_awready	,
	input     	      	io_slave_awvalid	,
	input	[31:0]		io_slave_awaddr		,
	input   [3:0]		io_slave_awid 		,
	input   [7:0] 		io_slave_awlen		,
	input   [2:0] 		io_slave_awsize		,
	input   [1:0]		io_slave_awburst	,
	output 		      	io_slave_wready		,
	input     	      	io_slave_wvalid		,
	input   [63:0]		io_slave_wdata		,
	input   [7:0] 		io_slave_wstrb		,
	input     	      	io_slave_wlast		,
	input				io_slave_bready		,
	output				io_slave_bvalid		,
	output 	[1:0]		io_slave_bresp		,
	output 	[3:0]		io_slave_bid		,
	output 		      	io_slave_arready	,
	input  		      	io_slave_arvalid	,
	input  	[31:0]		io_slave_araddr		,
	input  	[3:0]		io_slave_arid		,
	input  	[7:0] 		io_slave_arlen		,
	input  	[2:0] 		io_slave_arsize		,
	input  	[1:0]		io_slave_arburst	,
	input				io_slave_rready 	,
	output				io_slave_rvalid 	,
	output 		      	io_slave_rlast		,
	output 	[1:0]		io_slave_rresp		,
	output 	[63:0]		io_slave_rdata		,
	output 	[3:0] 		io_slave_rid		

);
/*
	wire		      			awready_if;
	wire	      				awvalid_if;
	wire	[`YSYX210295_BUS_AXI_AWID]		awid_if;
	wire	[`YSYX210295_BUS_ADDR_MEM]		awaddr_if;
	wire	[`YSYX210295_BUS_AXI_LEN] 		awlen_if;
	wire	[`YSYX210295_BUS_AXI_SIZE] 	awsize_if;
	wire	[`YSYX210295_BUS_AXI_BURST]	awburst_if;
	wire	      				wready_if;
	wire	      				wvalid_if;
	wire	[`YSYX210295_BUS_DATA_MEM]		wdata_if;
	wire	[`YSYX210295_BUS_AXI_STRB] 	wstrb_if;
	wire	      				wlast_if;
	wire	[`YSYX210295_BUS_AXI_BID]		bid_if;
	wire	[`YSYX210295_BUS_AXI_RESP]		bresp_if;
	wire						bvalid_if;
	wire						bready_if;
*/
	wire	      				arready_if;
	wire	      				arvalid_if;
	wire	[`YSYX210295_BUS_AXI_ARID]		arid_if;
	wire	[`YSYX210295_BUS_ADDR_MEM]		araddr_if;
	wire	[`YSYX210295_BUS_AXI_LEN] 		arlen_if;
	wire	[`YSYX210295_BUS_AXI_SIZE] 	arsize_if;
	wire	[`YSYX210295_BUS_AXI_BURST]	arburst_if;
	//wire	[`YSYX210295_BUS_AXI_RID] 		rid_if;
	wire	[`YSYX210295_BUS_DATA_MEM]		rdata_if;
	//wire	[`YSYX210295_BUS_AXI_RESP]		rresp_if;
	wire	      				rlast_if;
	wire						rvalid_if;
	wire						rready_if;
	wire 	[`YSYX210295_BUS_AXI_STRB]		strb_mem_wr;
	wire 	[`YSYX210295_BUS_AXI_SIZE]		size_mem_wr;
	wire 	[`YSYX210295_BUS_AXI_SIZE]		size_mem_rd;


	wire	[`YSYX210295_BUS_ADDR_MEM]		pc;
	wire 						pc_act;	
	wire						instr_rd_en;
	wire	[`YSYX210295_BUS_DATA_INSTR]	instr;
	wire	[`YSYX210295_BUS_ADDR_MEM]		addr_instr;
	wire	[`YSYX210295_BUS_ADDR_MEM]		addr_mem_wr;
	wire	[`YSYX210295_BUS_ADDR_MEM]		addr_mem_rd;
	wire	[`YSYX210295_BUS_DATA_MEM]		data_mem_wr;
	wire						mem_wr_en;
	wire						mem_rd_en;				
	wire	[`YSYX210295_BUS_DATA_MEM]		data_mem_rd;


	wire	      				awready_mem;
	wire 	      				awvalid_mem;
	wire	[`YSYX210295_BUS_AXI_AWID]		awid_mem;
	wire 	[`YSYX210295_BUS_ADDR_MEM]		awaddr_mem;
	wire 	[`YSYX210295_BUS_AXI_LEN] 		awlen_mem;
	wire 	[`YSYX210295_BUS_AXI_SIZE] 	awsize_mem;
	wire 	[`YSYX210295_BUS_AXI_BURST]	awburst_mem;
	wire	      				wready_mem;
	wire 	      				wvalid_mem;
	wire 	[`YSYX210295_BUS_DATA_MEM]		wdata_mem;
	wire 	[`YSYX210295_BUS_AXI_STRB] 	wstrb_mem;
	wire 	      				wlast_mem;
	//wire	[`YSYX210295_BUS_AXI_BID]		bid_mem;
	//wire	[`YSYX210295_BUS_AXI_RESP]		bresp_mem;
	wire						bvalid_mem;
	wire						bready_mem;
	wire	      				arready_mem;
	wire 	      				arvalid_mem;
	wire	[`YSYX210295_BUS_AXI_ARID]		arid_mem;
	wire 	[`YSYX210295_BUS_ADDR_MEM]		araddr_mem;
	wire 	[`YSYX210295_BUS_AXI_LEN] 		arlen_mem;
	wire 	[`YSYX210295_BUS_AXI_SIZE] 	arsize_mem;
	wire 	[`YSYX210295_BUS_AXI_BURST]	arburst_mem;
	//wire	[`YSYX210295_BUS_AXI_RID] 		rid_mem;
	wire	[`YSYX210295_BUS_DATA_MEM]		rdata_mem;
	//wire	[`YSYX210295_BUS_AXI_RESP]		rresp_mem;
	//wire	      				rlast_mem;
	wire						rvalid_mem;
	wire						rready_mem;

	wire 						stall_if;
	wire 						stall_mem;

	wire [`YSYX210295_BUS_ADDR_MEM] araddr;
	wire [`YSYX210295_BUS_ADDR_MEM] awaddr;
	//wire [31:0] araddr;
	//wire [31:0] awaddr;
       //Timer AXI4-lite interface
       
	wire [63:0] timer_saxi_awaddr_64;
	wire [`YSYX210295_ADDR_WIDTH-1:0] timer_saxi_awaddr;
	assign timer_saxi_awaddr=timer_saxi_awaddr_64[`YSYX210295_ADDR_WIDTH-1:0];
	
	wire timer_saxi_awvalid;
	wire timer_saxi_awready;

	wire [63:0] timer_saxi_araddr_64;
	wire [`YSYX210295_ADDR_WIDTH-1:0] timer_saxi_araddr;
	assign timer_saxi_araddr=timer_saxi_araddr_64[`YSYX210295_ADDR_WIDTH-1:0];

	wire timer_saxi_arvalid;
	wire timer_saxi_arready;

	wire timer_saxi_wvalid;
	wire timer_saxi_wready;
	wire [`YSYX210295_DATA_WIDTH-1:0] timer_saxi_wdata;

	wire timer_saxi_rvalid;
	wire timer_saxi_rready;
	wire [`YSYX210295_DATA_WIDTH-1:0] timer_saxi_rdata;

	wire timer_saxi_bvalid;
	wire timer_saxi_bready;
	
	wire time_irq_o;

	wire axi_rbusy;
	
	assign io_master_awaddr = awaddr[31:0];
	assign io_master_araddr = araddr[31:0];

    wire [2:0]                  hold_code;

	wire                        hold_n;
    assign hold_n = (hold_code >= `YSYX210295_HOLD_CODE_PC) ? `YSYX210295_HOLD_EN : `YSYX210295_HOLD_DIS;

	assign		      	io_slave_awready = 1'd0;
	assign 		      	io_slave_wready  = 1'd0;
	assign 				io_slave_bvalid	 = 1'd0;
	assign 	    		io_slave_bresp	 = 2'd0;
	assign 	 			io_slave_bid	 = 4'd0;
	assign 		      	io_slave_arready = 1'd0;
	assign 				io_slave_rvalid  = 1'd0;
	assign 		      	io_slave_rlast	 = 1'd0;
	assign 	 			io_slave_rresp	 = 2'd0;
	assign 	 			io_slave_rdata	 = 64'd0;
	assign  			io_slave_rid	 = 4'd0;

       //wire [2:0] arsize_o;
       //assign io_master_arsize = (araddr < 64'h8000_0000)? 3'b10:arsize_o; 
       //wire [1:0] arburst_o;
       //assign io_master_arburst = (araddr < 64'h8000_0000)? 2'b00:arburst_o; 
       //wire [2:0] awsize_o;
       //assign io_master_awsize = (awaddr < 64'h8000_0000)? 3'b10:awsize_o; 
       //wire [1:0] awburst_o;
       //assign io_master_awburst = (awaddr < 64'h8000_0000)? 2'b00:awburst_o; 

ysyx_210295_axi_interconnect u_interconnect(
		.clock			(clock),
		.reset			(reset),
		
		.axi_rbusy      (axi_rbusy),


		//if
		//.awready_if		(awready_if),
		//.awvalid_if		(awvalid_if),
		//.awid_if 		(awid_if),
		//.awaddr_if		(awaddr_if),
		//.awlen_if		(awlen_if),
		//.awsize_if		(awsize_if),
		//.awburst_if		(awburst_if),

		//.wready_if		(wready_if),
		//.wvalid_if		(wvalid_if),
		//.wdata_if		(wdata_if),
		//.wstrb_if		(wstrb_if),
		//.wlast_if		(wlast_if),

		//.bid_if			(bid_if),
		//.bresp_if		(bresp_if),
		//.bvalid_if		(bvalid_if),
		//.bready_if		(bready_if),

		.arready_if		(arready_if),
		.arvalid_if		(arvalid_if),
		.arid_if		(arid_if),
		.araddr_if		(araddr_if),
		.arlen_if		(arlen_if),
		.arsize_if		(arsize_if),
		.arburst_if		(arburst_if),
	//	.arcache_if		(arcache_if),
	//	.arprot_if		(arprot_if),
	//	.arqos_if		(arqos_if),
	//	.arregion_if	(arregion_if),

	//	.rid_if			(rid_if),
		.rdata_if		(rdata_if),
	//	.rresp_if		(rresp_if),
		.rlast_if		(rlast_if),
		.rvalid_if 		(rvalid_if),
		.rready_if 		(rready_if),
	
		//mem
		.awready_mem	(awready_mem),
		.awvalid_mem	(awvalid_mem),
		.awid_mem		(awid_mem),
		.awaddr_mem		(awaddr_mem),
		.awlen_mem		(awlen_mem),
		.awsize_mem		(awsize_mem),
		.awburst_mem	(awburst_mem),

		.wready_mem		(wready_mem),
		.wvalid_mem		(wvalid_mem),
		.wdata_mem		(wdata_mem),
		.wstrb_mem		(wstrb_mem),
		.wlast_mem		(wlast_mem),

		//.bid_mem		(bid_mem),
		//.bresp_mem		(bresp_mem),
		.bvalid_mem		(bvalid_mem),
		.bready_mem		(bready_mem),

		.arready_mem	(arready_mem),
		.arvalid_mem	(arvalid_mem),
		.arid_mem		(arid_mem),
		.araddr_mem		(araddr_mem),
		.arlen_mem		(arlen_mem),
		.arsize_mem		(arsize_mem),
		.arburst_mem	(arburst_mem),
	//	.arcache_mem	(arcache_mem),
	//	.arprot_mem		(arprot_mem),
	//	.arqos_mem		(arqos_mem),
	//	.arregion_mem	(arregion_mem),


	//	.rid_mem		(rid_mem),
		.rdata_mem		(rdata_mem),
	//	.rresp_mem		(rresp_mem),
	//	.rlast_mem		(rlast_mem),
		.rvalid_mem 	(rvalid_mem),
		.rready_mem 	(rready_mem),

         
         
		//axi out
		.awready_axi		(io_master_awready),
		.awvalid_axi		(io_master_awvalid),
		.awid_axi 			(io_master_awid),
		.awaddr_axi			(awaddr),
		.awlen_axi			(io_master_awlen),
		.awsize_axi			(io_master_awsize),
		.awburst_axi		(io_master_awburst),
		.wready_axi			(io_master_wready),
		.wvalid_axi			(io_master_wvalid),
		.wdata_axi			(io_master_wdata),
		.wstrb_axi			(io_master_wstrb),
		.wlast_axi			(io_master_wlast),
		//.bid_axi			(io_master_bid),
		//.bresp_axi			(io_master_bresp),
		.bvalid_axi			(io_master_bvalid),
		.bready_axi			(io_master_bready),
		.arready_axi		(io_master_arready),
		.arvalid_axi		(io_master_arvalid),
		.arid_axi			(io_master_arid),
		.araddr_axi			(araddr),
		.arlen_axi			(io_master_arlen),
		//.arsize_axi			(io_master_arsize),
		.arsize_axi			(io_master_arsize),
		.arburst_axi		(io_master_arburst),
		//.rid_axi			(io_master_rid),
		.rdata_axi			(io_master_rdata),
		//.rresp_axi			(io_master_rresp),
		.rlast_axi			(io_master_rlast),
		.rvalid_axi 		(io_master_rvalid),
		.rready_axi 		(io_master_rready),

		//timer
		
		.awready_timer		(timer_saxi_awready),
		.awvalid_timer		(timer_saxi_awvalid),
	//	.awid_timer 		(),
		.awaddr_timer		(timer_saxi_awaddr_64),
	//	.awlen_timer		(),
	//	.awsize_timer		(),
	//	.awburst_timer		(),
		.wready_timer		(timer_saxi_wready),
		.wvalid_timer		(timer_saxi_wvalid),
		.wdata_timer		(timer_saxi_wdata),
	//	.wstrb_timer		(),
	//	.wlast_timer		(),
	//	.bid_timer			(),
	//	.bresp_timer		(),
		.bvalid_timer		(timer_saxi_bvalid),
		.bready_timer		(timer_saxi_bready),
		.arready_timer		(timer_saxi_arready),
		.arvalid_timer		(timer_saxi_arvalid),
	//	.arid_timer			(),
		.araddr_timer		(timer_saxi_araddr_64),
	//	.arlen_timer		(),
	//	.arsize_timer		(),
	//	.arburst_timer		(),
	//	.rid_timer			(),
		.rdata_timer		(timer_saxi_rdata),
	//	.rresp_timer		(),
	//	.rlast_timer		(),
		.rvalid_timer 		(timer_saxi_rvalid),
		.rready_timer 		(timer_saxi_rready)

);


	ysyx_210295_core ecnurvcore(
		.clock			(clock),
		.reset			(reset),

		.stall_if		(stall_if),
		.stall_mem		(stall_mem),

		.instr_i 		(instr),
		.addr_instr_i 	(addr_instr),
		.data_mem_i		(data_mem_rd),

		.hold_code      (hold_code),
		.tmr_irq_i		(time_irq_o),
		.ext_irq_i		(io_interrupt),

		.mem_wr_en_o	(mem_wr_en),
		.mem_rd_en_o	(mem_rd_en),
		.instr_rd_en_o	(instr_rd_en),
		.data_mem_wr_o	(data_mem_wr),
		.strb_mem_wr_o  (strb_mem_wr),
		.size_mem_wr_o  (size_mem_wr),	
		.addr_mem_wr_o	(addr_mem_wr),	
		.addr_mem_rd_o	(addr_mem_rd),	
		.size_mem_rd_o  (size_mem_rd),
		.pc_o			(pc),
		.pc_act_o		(pc_act)
	);


	ysyx_210295_if_axi_interface if_interface(
		.clock			(clock),
		.reset			(reset),
	
		.stall_if 		(stall_if),


		.pc				(pc),
		.pc_act			(pc_act),
		.instr_rd_en	(instr_rd_en),
		.instr 			(instr),
		.addr_instr		(addr_instr),
/*
		.awready_if		(awready_if),
		.awvalid_if		(awvalid_if),
		.awid_if 		(awid_if),
		.awaddr_if		(awaddr_if),
		.awlen_if		(awlen_if),
		.awsize_if		(awsize_if),
		.awburst_if		(awburst_if),

		.wready_if		(wready_if),
		.wvalid_if		(wvalid_if),
		.wdata_if		(wdata_if),
		.wstrb_if		(wstrb_if),
		.wlast_if		(wlast_if),

		.bid_if			(bid_if),
		.bresp_if		(bresp_if),
		.bvalid_if		(bvalid_if),
		.bready_if		(bready_if),
*/
		.arready_if		(arready_if),
		.arvalid_if		(arvalid_if),
		.arid_if		(arid_if),
		.araddr_if		(araddr_if),
		.arlen_if		(arlen_if),
		.arsize_if		(arsize_if),
		.arburst_if		(arburst_if),
		
	//	.rid_if			(rid_if),
		.rdata_if		(rdata_if),
	//	.rresp_if		(rresp_if),
		.rlast_if		(rlast_if),
		.rvalid_if 		(rvalid_if),
		.rready_if 		(rready_if)

	);


    ysyx_210295_mem_axi_interface mem_interface(
		.clock			(clock),
		.reset			(reset),
	
		.stall_mem		(stall_mem),
		.hold_n         (hold_n),
	
		.axi_rbusy      (axi_rbusy),
	
		//with core
		//store/load
		.addr_mem_wr	(addr_mem_wr),	
		.addr_mem_rd	(addr_mem_rd),	
		.data_mem_wr	(data_mem_wr),	
		.strb_mem_wr    (strb_mem_wr),
		.size_mem_wr    (size_mem_wr),
		.mem_wr_en		(mem_wr_en),
		.mem_rd_en		(mem_rd_en),				
		.data_mem_rd	(data_mem_rd),
		.size_mem_rd    (size_mem_rd),


		.awready_mem	(awready_mem),
		.awvalid_mem	(awvalid_mem),
		.awid_mem		(awid_mem),
		.awaddr_mem		(awaddr_mem),
		.awlen_mem		(awlen_mem),
		.awsize_mem		(awsize_mem),
		.awburst_mem	(awburst_mem),

		.wready_mem		(wready_mem),
		.wvalid_mem		(wvalid_mem),
		.wdata_mem		(wdata_mem),
		.wstrb_mem		(wstrb_mem),
		.wlast_mem		(wlast_mem),

		//.bid_mem		(bid_mem),
		//.bresp_mem		(bresp_mem),
		.bvalid_mem		(bvalid_mem),
		.bready_mem		(bready_mem),

		.arready_mem	(arready_mem),
		.arvalid_mem	(arvalid_mem),
		.arid_mem		(arid_mem),
		.araddr_mem		(araddr_mem),
		.arlen_mem		(arlen_mem),
		.arsize_mem		(arsize_mem),
		.arburst_mem	(arburst_mem),

	//	.rid_mem		(rid_mem),
		.rdata_mem		(rdata_mem),
	//	.rresp_mem		(rresp_mem),
	//	.rlast_mem		(rlast_mem),
		.rvalid_mem 	(rvalid_mem),
		.rready_mem 	(rready_mem)

	);

    ysyx_210295_timer u_timer(
		.clock			(clock),
		.reset			(reset),
		.saxi_awaddr  (timer_saxi_awaddr  ),
		.saxi_awvalid (timer_saxi_awvalid ),
		.saxi_awready (timer_saxi_awready ),
		.saxi_araddr  (timer_saxi_araddr  ),
		.saxi_arvalid (timer_saxi_arvalid ),
		.saxi_arready (timer_saxi_arready ),
		.saxi_wvalid  (timer_saxi_wvalid  ),
		.saxi_wready  (timer_saxi_wready  ),
		.saxi_wdata   (timer_saxi_wdata   ),
		.saxi_rvalid  (timer_saxi_rvalid  ),
		.saxi_rready  (timer_saxi_rready  ),
		.saxi_rdata   (timer_saxi_rdata   ),
		.saxi_bvalid  (timer_saxi_bvalid  ),
		.saxi_bready  (timer_saxi_bready  ),
		.time_irq_o   (time_irq_o   )
	);


	

endmodule
