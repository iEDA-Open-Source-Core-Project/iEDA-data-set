`ifndef ysyx_050133_NPCDEFINE_V
`define ysyx_050133_NPCDEFINE_V

//`timescale 1ns/1ns
//`define ysyx_050133_MULTICYCLE 1
//`define ysyx_050133_NOCACHE 1
//`define ysyx_050133_BHT 1
//`define ysyx_050133_DEBUGINFO 1

`ifdef ysyx_050133_NOCACHE
	//`define ysyx_050133_FAKEAXI 1
`endif

`ifdef ysyx_050133_DEBUGINFO 
	//`define ysyx_050133_REGINFO 1
	//`define ysyx_050133_AXIINFOIFU 1
	//`define ysyx_050133_AXIINFOMEM 1
	//`define ysyx_050133_ICACHEINFO 1
	//`define ysyx_050133_MCACHEINFO 1
`endif

`define ysyx_050133_OP_LUI    7'b0110111
`define ysyx_050133_OP_AUIPC  7'b0010111
`define ysyx_050133_OP_JAL    7'b1101111
`define ysyx_050133_OP_JALR   7'b1100111
`define ysyx_050133_OP_BXX    7'b1100011
`define ysyx_050133_OP_LXX    7'b0000011
`define ysyx_050133_OP_SXX    7'b0100011
`define ysyx_050133_OP_XXI    7'b0010011
`define ysyx_050133_OP_XXIW   7'b0011011
`define ysyx_050133_OP_RXX    7'b0110011
`define ysyx_050133_OP_RWX    7'b0111011
`define ysyx_050133_OP_FXX    7'b0001111
`define ysyx_050133_OP_SYS    7'b1110011

`define ysyx_050133_F3_JALR   3'b000
`define ysyx_050133_F3_BEQ    3'b000
`define ysyx_050133_F3_BNE    3'b001
`define ysyx_050133_F3_BLT    3'b100
`define ysyx_050133_F3_BGE    3'b101
`define ysyx_050133_F3_BLTU   3'b110
`define ysyx_050133_F3_BGEU   3'b111
`define ysyx_050133_F3_LB     3'b000
`define ysyx_050133_F3_LH     3'b001
`define ysyx_050133_F3_LW     3'b010
`define ysyx_050133_F3_LBU    3'b100
`define ysyx_050133_F3_LHU    3'b101
`define ysyx_050133_F3_SB     3'b000
`define ysyx_050133_F3_SH     3'b001
`define ysyx_050133_F3_SW     3'b010
`define ysyx_050133_F3_ADDI   3'b000
`define ysyx_050133_F3_SLTI   3'b010
`define ysyx_050133_F3_SLTIU  3'b011
`define ysyx_050133_F3_XORI   3'b100
`define ysyx_050133_F3_ORI    3'b110
`define ysyx_050133_F3_ANDI   3'b111
`define ysyx_050133_F3_SLLI   3'b001
`define ysyx_050133_F3_SRLI   3'b101
`define ysyx_050133_F3_SRAI   3'b101
`define ysyx_050133_F3_ADD    3'b000
`define ysyx_050133_F3_SUB    3'b000
`define ysyx_050133_F3_SLL    3'b001
`define ysyx_050133_F3_SLT    3'b010
`define ysyx_050133_F3_SLTU   3'b011
`define ysyx_050133_F3_XOR    3'b100
`define ysyx_050133_F3_SRL    3'b101
`define ysyx_050133_F3_SRA    3'b101
`define ysyx_050133_F3_OR     3'b110
`define ysyx_050133_F3_AND    3'b111

`define ysyx_050133_F3_LWU    3'b110
`define ysyx_050133_F3_LD     3'b011
`define ysyx_050133_F3_SD     3'b011
`define ysyx_050133_F3_SLLI   3'b001
`define ysyx_050133_F3_SRLI   3'b101
`define ysyx_050133_F3_SRAI   3'b101
`define ysyx_050133_F3_ADDIW  3'b000
`define ysyx_050133_F3_SLLIW  3'b001
`define ysyx_050133_F3_SRLIW  3'b101
`define ysyx_050133_F3_SRAIW  3'b101
`define ysyx_050133_F3_ADDW   3'b000
`define ysyx_050133_F3_SUBW   3'b000
`define ysyx_050133_F3_SLLW   3'b001
`define ysyx_050133_F3_SRLW   3'b101
`define ysyx_050133_F3_SRAW   3'b101

`define ysyx_050133_F3_CSRRW  3'b001
`define ysyx_050133_F3_CSRRS  3'b010
`define ysyx_050133_F3_CSRRC  3'b011
`define ysyx_050133_F3_CSRRWI 3'b101
`define ysyx_050133_F3_CSRRSI 3'b110
`define ysyx_050133_F3_CSRRCI 3'b111

`define ysyx_050133_F3_MUL    3'b000
`define ysyx_050133_F3_MULH   3'b001
`define ysyx_050133_F3_MULHSU 3'b010
`define ysyx_050133_F3_MULHU  3'b011
`define ysyx_050133_F3_DIV    3'b100
`define ysyx_050133_F3_DIVU   3'b101
`define ysyx_050133_F3_REM    3'b110
`define ysyx_050133_F3_REMU   3'b111

`define ysyx_050133_F3_MULW   3'b000
`define ysyx_050133_F3_DIVW   3'b100
`define ysyx_050133_F3_DIVUW  3'b101
`define ysyx_050133_F3_REMW   3'b110
`define ysyx_050133_F3_REMUW  3'b111

`define ysyx_050133_F6_SLLI   6'b000000
`define ysyx_050133_F6_SRLI   6'b000000
`define ysyx_050133_F6_SRAI   6'b010000

`define ysyx_050133_F7_ADD    7'b0000000
`define ysyx_050133_F7_SUB    7'b0100000
`define ysyx_050133_F7_SLL    7'b0000000
`define ysyx_050133_F7_SLT    7'b0000000
`define ysyx_050133_F7_SLTU   7'b0000000
`define ysyx_050133_F7_XOR    7'b0000000
`define ysyx_050133_F7_SRL    7'b0000000
`define ysyx_050133_F7_SRA    7'b0100000
`define ysyx_050133_F7_OR     7'b0000000
`define ysyx_050133_F7_AND    7'b0000000

`define ysyx_050133_F7_SLLIW  7'b0000000
`define ysyx_050133_F7_SRLIW  7'b0000000
`define ysyx_050133_F7_SRAIW  7'b0100000
`define ysyx_050133_F7_ADDW   7'b0000000
`define ysyx_050133_F7_SUBW   7'b0100000
`define ysyx_050133_F7_SLLW   7'b0000000
`define ysyx_050133_F7_SRLW   7'b0000000
`define ysyx_050133_F7_SRAW   7'b0100000

`define ysyx_050133_F7_RXX1   7'b0000000
`define ysyx_050133_F7_RXX2   7'b0100000

`define ysyx_050133_F7_MUL    7'b0000001
`define ysyx_050133_F7_MULH   7'b0000001
`define ysyx_050133_F7_MULHSU 7'b0000001
`define ysyx_050133_F7_MULHU  7'b0000001
`define ysyx_050133_F7_DIV    7'b0000001
`define ysyx_050133_F7_DIVU   7'b0000001
`define ysyx_050133_F7_REM    7'b0000001
`define ysyx_050133_F7_REMU   7'b0000001

`define ysyx_050133_F7_MULW   7'b0000001
`define ysyx_050133_F7_DIVW   7'b0000001
`define ysyx_050133_F7_DIVUW  7'b0000001
`define ysyx_050133_F7_REMW   7'b0000001
`define ysyx_050133_F7_REMUW  7'b0000001

`define ysyx_050133_F7_RXX3   7'b0000001

`define ysyx_050133_F_FENCE   25'b0000_0000_0000_00000_001_00000 
`define ysyx_050133_F_PAUSE   25'b0000_0001_0000_00000_000_00000 
`define ysyx_050133_F_ECALL   25'b0000_0000_0000_00000_000_00000 
`define ysyx_050133_F_EBREAK  25'b0000_0000_0001_00000_000_00000 
`define ysyx_050133_F_MRET    25'b0011_0000_0010_00000_000_00000

`define ysyx_050133_pcSrc_snpc    0
`define ysyx_050133_pcSrc_dnpc    1
`define ysyx_050133_addSrc_pc     0
`define ysyx_050133_addSrc_rs1    1
`define ysyx_050133_ALUSrc1_pc    1
`define ysyx_050133_ALUSrc1_rs1   0
`define ysyx_050133_ALUSrc2_rs2   0
`define ysyx_050133_ALUSrc2_imm   1
`define ysyx_050133_ALUSrc2_4     2
`define ysyx_050133_wmask_b     1
`define ysyx_050133_wmask_h     3
`define ysyx_050133_wmask_w     15
`define ysyx_050133_wmask_d     255
`define ysyx_050133_rdSrc_alu     0
`define ysyx_050133_rdSrc_mem     1
`define ysyx_050133_rdSrc_imm     2
`define ysyx_050133_rdSrc_csr     3
`define ysyx_050133_rdSEXT_b     1
`define ysyx_050133_rdSEXT_h     2
`define ysyx_050133_rdSEXT_w     3
`define ysyx_050133_rdSEXT_d     4
`define ysyx_050133_rdSEXT_bu    5
`define ysyx_050133_rdSEXT_hu    6
`define ysyx_050133_rdSEXT_wu    7

`define ysyx_050133_CSRSrc_mtvec 1
`define ysyx_050133_CSRSrc_mepc  2
`define ysyx_050133_CSRSrc_imm   3
`define ysyx_050133_CSRop_ecall  1
`define ysyx_050133_CSRop_csrrw  2
`define ysyx_050133_CSRop_csrrs  3
`define ysyx_050133_CSRop_csrrc  4
`define ysyx_050133_CSRop_csrrwi 5
`define ysyx_050133_CSRop_csrrsi 6
`define ysyx_050133_CSRop_csrrci 7

`define ysyx_050133_ALUop_NOP     5'b00000
`define ysyx_050133_ALUop_BEQ     5'b00001
`define ysyx_050133_ALUop_BNE     5'b00010
`define ysyx_050133_ALUop_BLT     5'b00011
`define ysyx_050133_ALUop_BGE     5'b00100
`define ysyx_050133_ALUop_BLTU    5'b00101
`define ysyx_050133_ALUop_BGEU    5'b00110
`define ysyx_050133_ALUop_ADD     5'b00111
`define ysyx_050133_ALUop_SUB     5'b01000
`define ysyx_050133_ALUop_SLT     5'b01001
`define ysyx_050133_ALUop_SLTU    5'b01010
`define ysyx_050133_ALUop_XOR     5'b01011
`define ysyx_050133_ALUop_OR      5'b01100
`define ysyx_050133_ALUop_AND     5'b01101
`define ysyx_050133_ALUop_SLL     5'b01110
`define ysyx_050133_ALUop_SRL     5'b01111
`define ysyx_050133_ALUop_SRA     5'b00000
`define ysyx_050133_ALUop_MUL     5'b10011
`define ysyx_050133_ALUop_MULH    5'b10111
`define ysyx_050133_ALUop_MULHSU  5'b10110
`define ysyx_050133_ALUop_MULHU   5'b10100
`define ysyx_050133_ALUop_DIV     5'b11001
`define ysyx_050133_ALUop_DIVU    5'b11000
`define ysyx_050133_ALUop_REM     5'b11011
`define ysyx_050133_ALUop_REMU    5'b11010
//`define ysyx_050133_ALUop_ADDW    0
//`define ysyx_050133_ALUop_SUBW    0
//`define ysyx_050133_ALUop_SLLW    0
//`define ysyx_050133_ALUop_SRLW    0
//`define ysyx_050133_ALUop_SRAW    0
//`define ysyx_050133_ALUop_MULW    0
//`define ysyx_050133_ALUop_DIVW    0
//`define ysyx_050133_ALUop_DIVUW   0
//`define ysyx_050133_ALUop_REMW    0
//`define ysyx_050133_ALUop_REMUW   0


`define ysyx_050133_forward_src_wb  1
`define ysyx_050133_forward_src_mem 2

`define ysyx_050133_ctrl_wb_len   0
`define ysyx_050133_ctrl_mem_len  6
`define ysyx_050133_ctrl_ex_len   23

//// Burst types
`define ysyx_050133_AXI_BURST_TYPE_FIXED                 2'b00               //突发类型  FIFO
`define ysyx_050133_AXI_BURST_TYPE_INCR                  2'b01               //ram  
`define ysyx_050133_AXI_BURST_TYPE_WRAP                  2'b10
//// Access permissions
//`define AXI_PROT_UNPRIVILEGED_ACCESS                        3'b000
//`define AXI_PROT_PRIVILEGED_ACCESS                          3'b001
//`define AXI_PROT_SECURE_ACCESS                              3'b000
//`define AXI_PROT_NON_SECURE_ACCESS                          3'b010
//`define AXI_PROT_DATA_ACCESS                                3'b000
//`define AXI_PROT_INSTRUCTION_ACCESS                         3'b100
//// Memory types (AR)
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
//// Memory types (AW)
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
//突发宽度一个数据的宽度
`define ysyx_050133_AXI_SIZE_BYTES_1                      3'b000 
`define ysyx_050133_AXI_SIZE_BYTES_2                      3'b001
`define ysyx_050133_AXI_SIZE_BYTES_4                      3'b010
`define ysyx_050133_AXI_SIZE_BYTES_8                      3'b011
//`define AXI_SIZE_BYTES_16                                   3'b100
//`define AXI_SIZE_BYTES_32                                   3'b101
//`define AXI_SIZE_BYTES_64                                   3'b110
//`define AXI_SIZE_BYTES_128                                  3'b111


function automatic [63:0] SEXT;
  input[31:0] din;
  input[1:0] len;
begin
  if(len==2'b00)SEXT={{56{din[7]}},din[7:0]};
  else if(len==2'b01)SEXT={{48{din[15]}},din[15:0]};
  else SEXT={{32{din[31]}},din[31:0]};
end
endfunction

function automatic [2:0] CSRi;
  input[11:0] csr;
begin
	case(csr)
		12'h300:CSRi=0;
		12'h305:CSRi=1;
		12'h341:CSRi=2;
		12'h342:CSRi=3;
		12'h304:CSRi=4;
		12'h344:CSRi=5;
		12'hF14:CSRi=6;
	  default:CSRi=7;
	endcase
end
endfunction

`ifdef ysyx_050133_DEBUGINFO 
import "DPI-C" function void IPC_profiling(
    input byte inst,input byte alu,input byte mem,input byte pop,input byte flush,input byte jump
);
import "DPI-C" function void div_inst_profiling();
import "DPI-C" function void div_cycle_profiling();
import "DPI-C" function void mul_inst_profiling();
import "DPI-C" function void mul_cycle_profiling();

import "DPI-C" function void stopsim();
import "DPI-C" function void set_gpr_ptr(input logic [63:0] a []);
import "DPI-C" function void set_pc(
    input longint pc, input longint npc,input int inst
);
import "DPI-C" function void cache_profiling(
    input int inst,input int we,input int hit,input int dirty
);
import "DPI-C" function void cache_rw(
    input longint addr, input longint data, input byte size,input byte we,input byte waynum,input byte index
);
import "DPI-C" function void vmem_read(
    input longint raddr, output longint rdata
);
import "DPI-C" function void inst_read(
    input longint raddr, output longint rdata
);
import "DPI-C" function void vmem_write(
    input longint waddr, input longint wdata, input byte wmask
);
import "DPI-C" function void reg_info(
    input logic[4:0] rs1,input longint rs1d,
    input logic[4:0] rs2,input longint rs2d,
    input logic[4:0] rd,input longint rdd
);
import "DPI-C" function void npc_etrace(
    input longint pc,input longint NO
);
`endif 
`endif 
//`include "npcvsrc/npcdefine.v"
module ysyx_050133(
  input           clock             ,  
  input           reset             ,
  input           io_interrupt      ,
  input           io_master_awready ,    
  output          io_master_awvalid ,    
  output [3:0]    io_master_awid    ,  
  output [31:0]   io_master_awaddr  ,    
  output [7:0]    io_master_awlen   ,  
  output [2:0]    io_master_awsize  ,    
  output [1:0]    io_master_awburst ,    
  input           io_master_wready  ,    
  output          io_master_wvalid  ,    
  output [63:0]   io_master_wdata   ,  
  output [7:0]    io_master_wstrb   ,  
  output          io_master_wlast   ,  
  output          io_master_bready  ,    
  input           io_master_bvalid  ,    
  input [3:0]     io_master_bid     ,
  input [1:0]     io_master_bresp   ,  
  input           io_master_arready ,    
  output          io_master_arvalid ,    
  output [3:0]    io_master_arid    ,  
  output [31:0]   io_master_araddr  ,    
  output [7:0]    io_master_arlen   ,  
  output [2:0]    io_master_arsize  ,    
  output [1:0]    io_master_arburst ,    
  output          io_master_rready  ,    
  input           io_master_rvalid  ,    
  input [3:0]     io_master_rid     ,
  input [1:0]     io_master_rresp   ,  
  input [63:0]    io_master_rdata   ,  
  input           io_master_rlast   ,  
  output          io_slave_awready  ,    
  input           io_slave_awvalid  ,    
  input [3:0]     io_slave_awid     ,
  input [31:0]    io_slave_awaddr   ,  
  input [7:0]     io_slave_awlen    ,  
  input [2:0]     io_slave_awsize   ,  
  input [1:0]     io_slave_awburst  ,    
  output          io_slave_wready   ,  
  input           io_slave_wvalid   ,  
  input [63:0]    io_slave_wdata    ,  
  input [7:0]     io_slave_wstrb    ,  
  input           io_slave_wlast    ,  
  input           io_slave_bready   ,  
  output          io_slave_bvalid   ,  
  output [3:0]    io_slave_bid      ,
  output [1:0]    io_slave_bresp    ,  
  output          io_slave_arready  ,    
  input           io_slave_arvalid  ,    
  input [3:0]     io_slave_arid     ,
  input [31:0]    io_slave_araddr   ,  
  input [7:0]     io_slave_arlen    ,  
  input [2:0]     io_slave_arsize   ,  
  input [1:0]     io_slave_arburst  ,    
  input           io_slave_rready   ,  
  output          io_slave_rvalid   ,  
  output [3:0]    io_slave_rid      ,
  output [1:0]    io_slave_rresp    ,  
  output [63:0]   io_slave_rdata    ,  
  output          io_slave_rlast    ,  
  output [5:0]    io_sram0_addr     ,
  output          io_sram0_cen      ,
  output          io_sram0_wen      ,
  output [127:0]  io_sram0_wmask    ,  
  output [127:0]  io_sram0_wdata    ,  
  input  [127:0]  io_sram0_rdata    ,  
  output [5:0]    io_sram1_addr     ,
  output          io_sram1_cen      ,
  output          io_sram1_wen      ,
  output [127:0]  io_sram1_wmask    ,  
  output [127:0]  io_sram1_wdata    ,  
  input  [127:0]  io_sram1_rdata    ,  
  output [5:0]    io_sram2_addr     ,
  output          io_sram2_cen      ,
  output          io_sram2_wen      ,
  output [127:0]  io_sram2_wmask    ,  
  output [127:0]  io_sram2_wdata    ,  
  input  [127:0]  io_sram2_rdata    ,  
  output [5:0]    io_sram3_addr     ,
  output          io_sram3_cen      ,
  output          io_sram3_wen      ,
  output [127:0]  io_sram3_wmask    ,  
  output [127:0]  io_sram3_wdata    ,  
  input  [127:0]  io_sram3_rdata    ,  
  output [5:0]    io_sram4_addr     ,
  output          io_sram4_cen      ,
  output          io_sram4_wen      ,
  output [127:0]  io_sram4_wmask    ,  
  output [127:0]  io_sram4_wdata    ,  
  input  [127:0]  io_sram4_rdata    ,  
  output [5:0]    io_sram5_addr     ,
  output          io_sram5_cen      ,
  output          io_sram5_wen      ,
  output [127:0]  io_sram5_wmask    ,  
  output [127:0]  io_sram5_wdata    ,  
  input  [127:0]  io_sram5_rdata    ,  
  output [5:0]    io_sram6_addr     ,
  output          io_sram6_cen      ,
  output          io_sram6_wen      ,
  output [127:0]  io_sram6_wmask    ,  
  output [127:0]  io_sram6_wdata    ,  
  input  [127:0]  io_sram6_rdata    ,  
  output [5:0]    io_sram7_addr     ,
  output          io_sram7_cen      ,
  output          io_sram7_wen      ,
  output [127:0]  io_sram7_wmask    ,  
  output [127:0]  io_sram7_wdata    ,  
  input  [127:0]  io_sram7_rdata     
  );

parameter RW_DATA_WIDTH     = 64;
parameter RW_ADDR_WIDTH     = 32;
parameter AXI_DATA_WIDTH    = 64;
parameter AXI_ADDR_WIDTH    = 32;
//parameter AXI_ID_WIDTH      = 4;

assign  io_slave_awready =0;    
assign  io_slave_wready  =0;  
assign  io_slave_bvalid  =0;  
assign  io_slave_bid     =0;
assign  io_slave_bresp   =0;  
assign  io_slave_arready =0;    
assign  io_slave_rvalid  =0;  
assign  io_slave_rid     =0;
assign  io_slave_rresp   =0;  
assign  io_slave_rdata   =0;  
assign  io_slave_rlast   =0;  

wire clk=clock;
wire rst=reset;


`ifdef ysyx_050133_DEBUGINFO
always @(*)begin
  set_pc({32'd0,IDREG_pc},{32'd0,dnpc},IDREG_inst);
end

always@(posedge clk)begin
  if(~rst)IPC_profiling({7'd0,ifu_rw_block_o},{7'd0,block_EXU},{7'd0,mem_rw_block_o},{7'd0,pop&(~block)},{7'd0,flush&(~block)},{7'd0,(EXREG_ctrl_ex[17]|EXREG_ctrl_ex[16])&(MEMREG_en)});
end
`endif

wire[31:0] pc;
wire[31:0] npc;
wire pcSrc;
wire [31:0] inst;

reg[31:0] IDREG_pc  ;
reg[31:0] IDREG_inst;
reg       IDREG_Jpred;
reg       IDREG_clkint;
reg       clkint_reg;
wire      mieo;
wire ifu_rw_block_o;

wire  [`ysyx_050133_ctrl_wb_len :0]   ctrl_wb ;
wire  [`ysyx_050133_ctrl_mem_len:0]   ctrl_mem;
wire  [`ysyx_050133_ctrl_ex_len :0]   ctrl_ex ;
wire  [4:0]   rs1   ;
wire  [4:0]   rs2   ;
wire  [63:0]  rs1data ;
wire  [63:0]  rs2data ;
wire  [63:0]  imm     ;
wire  [4:0]   rdout   ;

reg[`ysyx_050133_ctrl_wb_len :0] EXREG_ctrl_wb  ;
reg[`ysyx_050133_ctrl_mem_len:0] EXREG_ctrl_mem ;
reg[`ysyx_050133_ctrl_ex_len :0] EXREG_ctrl_ex  ;
reg[31:0] EXREG_pc       ;
reg       EXREG_Jpred;
reg       EXREG_clkint;
reg[4:0]  EXREG_rs1      ;
//reg[4:0]  EXREG_rs2      ;
reg[63:0] EXREG_rs1data  ;
reg[63:0] EXREG_rs2data  ;
reg[63:0] EXREG_imm      ;
reg[4:0]  EXREG_rd       ;
wire Jresult;
wire block_EXU;
wire mem_rw_block_o;

wire  [31:0]   dnpc;
wire  [31:0]   dnpc_EXU;
//wire  [31:0]   dnpc_pred;
wire  [63:0]   result;
wire  [63:0]   wdata;
wire  [63:0]  csrdata ;
//wire  [1:0]    forward_ALUSrc1;
//wire  [1:0]    forward_ALUSrc2;
//wire  [1:0]    forward_wdataSrc;

reg[`ysyx_050133_ctrl_wb_len:0]  MEMREG_ctrl_wb  ;
reg[`ysyx_050133_ctrl_mem_len:0] MEMREG_ctrl_mem ;
reg[63:0] MEMREG_result    ;
reg[63:0] MEMREG_csrdata    ;
reg[63:0] MEMREG_imm    ;
reg[4:0]  MEMREG_rd     ;

reg [`ysyx_050133_ctrl_wb_len:0]WBREG_ctrl_wb;
reg [63:0]WBREG_rddata ;
reg [4:0] WBREG_rd    ;
wire[63:0]rddata      ;

wire mtip;
reg fix_mem_block;
`ifdef ysyx_050133_MULTICYCLE 
wire flush=0;
wire pop=0;
wire has_hazard=0;
wire block=ifu_rw_block_o|mem_rw_block_o|block_EXU;
reg  raw_pcREG_en  ;
reg  raw_pc1REG_en  ;
reg  raw_IDREG_en  ;
reg  raw_EXREG_en  ;
reg  raw_MEMREG_en ;
reg  raw_WBREG_en  ;
wire pcREG_en  =raw_pcREG_en ;
wire pc1REG_en  =raw_pc1REG_en&(~ifu_rw_block_o) ;
wire IDREG_en  =raw_IDREG_en ;
wire EXREG_en  =raw_EXREG_en ;
wire MEMREG_en =raw_MEMREG_en&(~block_EXU)&(~mem_rw_block_o);
wire WBREG_en  =raw_WBREG_en ;
`else
//wire flush=pcSrc&(~block);
//hazard:
//ld a0 addr
//add a0 a1 
//assign forward_ALUSrc1= EXREG_rs1==0 ? 0
                       //:MEMREG_ctrl_wb[0]&(MEMREG_rd==EXREG_rs1) ? 
                         //`ysyx_050133_forward_src_mem
                       //:WBREG_ctrl_wb[0]&(WBREG_rd==EXREG_rs1) ? 
                         //`ysyx_050133_forward_src_wb
                       //:0;
//assign forward_ALUSrc2= EXREG_rs2==0 ? 0
                       //:MEMREG_ctrl_wb[0]&(MEMREG_rd==EXREG_rs2) ? 
                         //`ysyx_050133_forward_src_mem
                       //:WBREG_ctrl_wb[0]&(WBREG_rd==EXREG_rs2) ? 
                         //`ysyx_050133_forward_src_wb
                       //:0;
//assign forward_wdataSrc= EXREG_rs2==0 ? 0
    //:EXREG_ctrl_ex[21]&MEMREG_ctrl_wb[0]&(MEMREG_rd==EXREG_rs2) ? 
      //`ysyx_050133_forward_src_mem
    //:EXREG_ctrl_ex[21]&WBREG_ctrl_wb[0]&(WBREG_rd==EXREG_rs2) ? 
      //`ysyx_050133_forward_src_wb
    //:0;
wire fix_hazard1= rs1==0 ? 0
											 :EXREG_ctrl_wb[0]&(EXREG_rd==rs1) ? 
												 1
											 :MEMREG_ctrl_wb[0]&(MEMREG_rd==rs1)&~pcSrc ? 
												 1
											 :0;
wire fix_hazard2= rs2==0 ? 0
											 :EXREG_ctrl_wb[0]&(EXREG_rd==rs2)&~EXREG_ctrl_ex[17] ? 
												 1
											 :MEMREG_ctrl_wb[0]&(MEMREG_rd==rs2)&~pcSrc ? 
												 1
											 :0;
wire fix_ctrl_ex21    =  IDREG_inst[6:0]==`ysyx_050133_OP_SXX   ; 
wire fix_hazard3= rs2==0 ? 0
		:fix_ctrl_ex21&EXREG_ctrl_wb[0]&(EXREG_rd==rs2) ? 
			1
		:fix_ctrl_ex21&MEMREG_ctrl_wb[0]&(MEMREG_rd==rs2)&~pcSrc ? 
			1
		:0;
wire ori_has_hazard=EXREG_ctrl_ex[22]&((EXREG_rd==rs1)|(EXREG_rd==rs2));
wire fix_hazard=fix_hazard1|fix_hazard2|fix_hazard3|ori_has_hazard;

wire has_hazard=fix_hazard;
//wire has_hazard=EXREG_ctrl_ex[22]&((EXREG_rd==rs1)|(EXREG_rd==rs2));
//wire has_hazard=0;
wire pop=has_hazard;
wire block=ifu_rw_block_o|mem_rw_block_o|block_EXU|fix_mem_block;
wire pcREG_en  =~(block|pop);
wire IDREG_en  =~(block|pop);
wire EXREG_en  =~block;
wire MEMREG_en =~block;
wire WBREG_en  =~block;
wire flush=(Jresult^EXREG_Jpred)&(~block);
`endif

`ifdef ysyx_050133_MULTICYCLE 
always@(posedge clk)
begin
  if(rst)begin
    raw_pcREG_en<=0;
    raw_pc1REG_en<=1;
    raw_IDREG_en<=0;
    raw_EXREG_en<=0;
    raw_MEMREG_en<=0;
    raw_WBREG_en<=0;
  end
  else if((pcREG_en==1))begin
    raw_pcREG_en<=0;
    raw_pc1REG_en<=1;
  end
  else if((pc1REG_en==1))begin
    raw_pc1REG_en<=0;
    raw_IDREG_en<=1;
  end
  else if(IDREG_en==1)begin
    raw_IDREG_en<=0;
    raw_EXREG_en<=1;
  end
  else if(EXREG_en==1)begin
    raw_EXREG_en<=0;
    raw_MEMREG_en<=1;
  end
  else if(MEMREG_en==1)begin
    raw_MEMREG_en<=0;
    raw_WBREG_en<=1;
  end
  else if(WBREG_en==1)begin
    raw_WBREG_en<=0;
    raw_pcREG_en<=1;
  end
end
wire Jpred=0;
assign dnpc=dnpc_EXU;
assign pcSrc=Jresult;
`else
  `ifdef ysyx_050133_BHT
parameter BHT_WIDTH=12;
parameter BHT_LENTH=4096;
//parameter BHT_LENTH=$pow(2,BHT_WIDTH);
reg [BHT_LENTH-1:0] BHT[1:0];
wire [BHT_WIDTH-1:0]BHTwi=EXREG_pc[BHT_WIDTH+2:3];
wire [BHT_WIDTH-1:0]BHTri=pc[BHT_WIDTH+2:3];
always@(posedge clk)begin
  if(rst)begin
    BHT[0]<=~(4096'd0);
    BHT[1]<=~(4096'd0);
    //BHT[2]<=~(4096'd0);
    //BHT[3]<=~(4096'd0);
  end
  else begin
    if(flush)begin
      if(BHT[0][BHTwi]^Jresult)BHT[0][BHTwi]<=Jresult;
      else if(BHT[1][BHTwi]^Jresult)BHT[1][BHTwi]<=Jresult;
      //else if(BHT[2][BHTwi]^Jresult)BHT[2][BHTwi]<=Jresult;
      //else if(BHT[3][BHTwi]^Jresult)BHT[3][BHTwi]<=Jresult;
    end
  end
end
wire Jpred=((inst[6:0]==`ysyx_050133_OP_JAL)
           ||(inst[6:0]==`ysyx_050133_OP_BXX))? BHT[1][BHTri]:0;
  `else
wire Jpred=0;
//wire Jpred=((inst[6:0]==`ysyx_050133_OP_JAL)
           //||(inst[6:0]==`ysyx_050133_OP_BXX))? 1:0;
  `endif
//assign dnpc_pred=inst[3] ? pc+{{11{inst[31]}},inst[31],inst[19:12],inst[20],inst[30:21],1'd0}
  //:pc+{{19{inst[31]}},inst[31],inst[7],inst[30:25],inst[11:8],1'b0};
//assign dnpc=(Jresult^EXREG_Jpred) ? dnpc_EXU:dnpc_pred;
//assign pcSrc=Jpred|(Jresult^EXREG_Jpred);
//
assign dnpc=dnpc_EXU;
assign pcSrc=Jresult;
`endif


wire                              ifu_rw_addr_valid_i;         
//wire                              ifu_rw_addr_ready_o;     
wire [RW_ADDR_WIDTH-1:0]          ifu_rw_addr_i      ;
wire                              ifu_rw_we_i        ;
wire [7:0]                        ifu_rw_len_i       ;
wire [2:0]                        ifu_rw_size_i      ;
wire [1:0]                        ifu_rw_burst_i     ;
wire                              ifu_rw_if_i        ;
wire                              ifu_w_data_valid_i ;   
//wire                              ifu_w_data_ready_o ;   
wire [RW_DATA_WIDTH-1:0]          ifu_w_data_i       ;
//wire                              ifu_r_data_valid_o ;   
wire                              ifu_r_data_ready_i ;   
wire [RW_DATA_WIDTH-1:0]          ifu_r_data_o       ;
//wire                              ifu_rw_block_o     ;   
wire                              ifu_rw_block_i     ;   
wire                              ifu_fence_i        ;   
wire                              ifu_fence_o        ;   

ysyx_050133_IFU ysyx_050133_IFU_dut(
  .clk(clk),
  .rst(rst),
  .pcREG_en(pcREG_en),
  .dnpc(dnpc),
  .pcSrc(pcSrc),
  .instin(ifu_r_data_o[31:0]),
  .pc_valid_o(ifu_rw_addr_valid_i),
  .pc(pc),
  .npc(npc),
  .inst(inst)
  );
wire                              mem_fence_o        ;   
//assign ifu_rw_addr_valid_i =ifu_rw_addr_valid_i;           
//assign ifu_rw_addr_ready_o =ifu_rw_addr_ready_o;       
assign ifu_rw_addr_i       =npc ;  
//assign ifu_rw_addr_i       =Jpred ? dnpc_pred:pc ;  
assign ifu_rw_we_i         =0                  ;  
assign ifu_rw_len_i        =0                  ;  
assign ifu_rw_size_i       =`ysyx_050133_AXI_SIZE_BYTES_4;
assign ifu_rw_burst_i      =`ysyx_050133_AXI_BURST_TYPE_FIXED;
assign ifu_rw_if_i         =1                  ;  
assign ifu_w_data_valid_i  =0                  ;     
//assign ifu_w_data_ready_o  =ifu_w_data_ready_o ;     
assign ifu_w_data_i        =0                  ;  
//assign ifu_r_data_valid_o  =ifu_r_data_valid_o ;     
assign ifu_r_data_ready_i  =1                  ;     
//assign ifu_r_data_o        =ifu_r_data_o       ;  
assign ifu_rw_block_i       = block                ;
assign ifu_fence_i          = mem_fence_o          ;

// Advanced eXtensible Interface
wire                               ifu_axi_aw_ready_i;             
wire                               ifu_axi_aw_valid_o;
//wire [AXI_ID_WIDTH-1:0]            ifu_axi_aw_id_o;
wire [AXI_ADDR_WIDTH-1:0]          ifu_axi_aw_addr_o;
wire [7:0]                         ifu_axi_aw_len_o;
wire [2:0]                         ifu_axi_aw_size_o;
wire [1:0]                         ifu_axi_aw_burst_o;
wire                               ifu_axi_w_ready_i;              
wire                               ifu_axi_w_valid_o;
wire [AXI_DATA_WIDTH-1:0]          ifu_axi_w_data_o;
wire [AXI_DATA_WIDTH/8-1:0]        ifu_axi_w_strb_o;
wire                               ifu_axi_w_last_o;
wire                               ifu_axi_b_ready_o;          
wire                               ifu_axi_b_valid_i;
//wire [AXI_ID_WIDTH-1:0]            ifu_axi_b_id_i;
//wire [1:0]                         ifu_axi_b_resp_i;             
wire                               ifu_axi_ar_ready_i;             
wire                               ifu_axi_ar_valid_o;
//wire [AXI_ID_WIDTH-1:0]            ifu_axi_ar_id_o;
wire [AXI_ADDR_WIDTH-1:0]          ifu_axi_ar_addr_o;
wire [7:0]                         ifu_axi_ar_len_o;
wire [2:0]                         ifu_axi_ar_size_o;
wire [1:0]                         ifu_axi_ar_burst_o;
wire                               ifu_axi_r_ready_o;          
wire                               ifu_axi_r_valid_i;             
//wire [AXI_ID_WIDTH-1:0]            ifu_axi_r_id_i;
//wire [1:0]                         ifu_axi_r_resp_i;
wire [AXI_DATA_WIDTH-1:0]          ifu_axi_r_data_i;
//wire                               ifu_axi_r_last_i;

ysyx_050133_crossbar ysyx_050133_crossbar_ifu(
    .clk              (clk),
    .rst              (rst),

    .rw_addr_valid_i  (ifu_rw_addr_valid_i&~fix_mem_block),
    //.rw_addr_ready_o  (ifu_rw_addr_ready_o),
    .rw_addr_i        (ifu_rw_addr_i      ),
    .rw_we_i          (ifu_rw_we_i        ),
    .rw_len_i         (ifu_rw_len_i       ),
    .rw_size_i        (ifu_rw_size_i      ),
    .rw_burst_i       (ifu_rw_burst_i     ),
    .rw_if_i          (ifu_rw_if_i        ),
    .w_data_valid_i   (ifu_w_data_valid_i ),
    //.w_data_ready_o   (ifu_w_data_ready_o ),
    .w_data_i         (ifu_w_data_i       ),
    //.r_data_valid_o   (ifu_r_data_valid_o ),
    .r_data_ready_i   (ifu_r_data_ready_i ),
    .r_data_o         (ifu_r_data_o       ),
    .rw_block_o       (ifu_rw_block_o     ),
    .rw_block_i       (ifu_rw_block_i     ),
    .fence_i          (ifu_fence_i        ),
    .fence_o          (ifu_fence_o        ),
    .io_sram0_addr     (io_sram0_addr     ),
    .io_sram0_cen      (io_sram0_cen      ),
    .io_sram0_wen      (io_sram0_wen      ),
    .io_sram0_wmask    (io_sram0_wmask    ),  
    .io_sram0_wdata    (io_sram0_wdata    ),  
    .io_sram0_rdata    (io_sram0_rdata    ),  
    .io_sram1_addr     (io_sram1_addr     ),
    .io_sram1_cen      (io_sram1_cen      ),
    .io_sram1_wen      (io_sram1_wen      ),
    .io_sram1_wmask    (io_sram1_wmask    ),  
    .io_sram1_wdata    (io_sram1_wdata    ),  
    .io_sram1_rdata    (io_sram1_rdata    ),  
    .io_sram2_addr     (io_sram2_addr     ),
    .io_sram2_cen      (io_sram2_cen      ),
    .io_sram2_wen      (io_sram2_wen      ),
    .io_sram2_wmask    (io_sram2_wmask    ),  
    .io_sram2_wdata    (io_sram2_wdata    ),  
    .io_sram2_rdata    (io_sram2_rdata    ),  
    .io_sram3_addr     (io_sram3_addr     ),
    .io_sram3_cen      (io_sram3_cen      ),
    .io_sram3_wen      (io_sram3_wen      ),
    .io_sram3_wmask    (io_sram3_wmask    ),  
    .io_sram3_wdata    (io_sram3_wdata    ),  
    .io_sram3_rdata    (io_sram3_rdata    ),  
    // Advanced eXtensible Intenterface
    .axi_aw_ready_i   (ifu_axi_aw_ready_i),               
    .axi_aw_valid_o   (ifu_axi_aw_valid_o),
		//.axi_aw_id_o      (ifu_axi_aw_id_o),
    .axi_aw_addr_o    (ifu_axi_aw_addr_o),
    .axi_aw_len_o     (ifu_axi_aw_len_o),
    .axi_aw_size_o    (ifu_axi_aw_size_o),
    .axi_aw_burst_o   (ifu_axi_aw_burst_o),
    .axi_w_ready_i    (ifu_axi_w_ready_i),                
    .axi_w_valid_o    (ifu_axi_w_valid_o),
    .axi_w_data_o     (ifu_axi_w_data_o),
    .axi_w_strb_o     (ifu_axi_w_strb_o),
    .axi_w_last_o     (ifu_axi_w_last_o),
    .axi_b_ready_o    (ifu_axi_b_ready_o),            
    .axi_b_valid_i    (ifu_axi_b_valid_i),
		//.axi_b_id_i       (ifu_axi_b_id_i),
    //.axi_b_resp_i     (ifu_axi_b_resp_i),                 
    .axi_ar_ready_i   (ifu_axi_ar_ready_i),               
    .axi_ar_valid_o   (ifu_axi_ar_valid_o),
    //.axi_ar_id_o      (ifu_axi_ar_id_o),
    .axi_ar_addr_o    (ifu_axi_ar_addr_o),
    .axi_ar_len_o     (ifu_axi_ar_len_o),
    .axi_ar_size_o    (ifu_axi_ar_size_o),
    .axi_ar_burst_o   (ifu_axi_ar_burst_o),
    .axi_r_ready_o    (ifu_axi_r_ready_o),            
    .axi_r_valid_i    (ifu_axi_r_valid_i),                
		//.axi_r_id_i       (ifu_axi_r_id_i),
    //.axi_r_resp_i     (ifu_axi_r_resp_i),
    .axi_r_data_i     (ifu_axi_r_data_i)
    //.axi_r_last_i     (ifu_axi_r_last_i)
);

wire int_state=mtip&mieo;
reg  int_state_last;
always@(posedge clk)
begin
  if(rst)begin
    clkint_reg<=0;
    int_state_last<=0;
  end
  else begin
		int_state_last<=int_state;
		if((IDREG_en&~flush)&clkint_reg)begin
			clkint_reg<=0;
		end
		else if(~int_state_last&int_state)begin
			clkint_reg<=1;
		end
  end
end

always@(posedge clk)
begin
  if(rst|flush)begin
    IDREG_pc<=0;
    IDREG_inst<=0;
    IDREG_Jpred<=0;
		IDREG_clkint<=0;
  end
  else if(IDREG_en)begin
    IDREG_pc<=pc;
    IDREG_inst<=clkint_reg ? 32'h00000073:inst;
    IDREG_Jpred<=clkint_reg ? 0:Jpred;
		IDREG_clkint<=clkint_reg;
  end
end


ysyx_050133_IDU ysyx_050133_IDU_dut(
  .clk      (clk),
  .rst      (rst),
  .inst     (IDREG_inst     ),
  .rdwen    (WBREG_ctrl_wb[0]  ),
  .rdin     (WBREG_rd     ),
  .rddata   (WBREG_rddata   ),
  .has_hazard(has_hazard),
  .ctrl_wb_out  (ctrl_wb  ),
  .ctrl_mem_out (ctrl_mem ),
  .ctrl_ex_out  (ctrl_ex  ),
  .rs1      (rs1),
  .rs2      (rs2),
  .rs1data  (rs1data  ),
  .rs2data  (rs2data  ),
  .imm      (imm      ),
  .rdout    (rdout    )
);

reg EXU_valid_i;
reg  mem_rw_addr_valid_i_reg;         
wire EXU_valid_o;
assign block_EXU=~(~EXU_valid_i&EXU_valid_o);
assign Jresult=EXREG_ctrl_ex[17]|(EXREG_ctrl_ex[16]&result[0]);

always@(posedge clk)
begin
  if(rst|flush)begin
    EXREG_ctrl_wb <=0;
    EXREG_ctrl_mem<=0;
    EXREG_ctrl_ex <=0;
    EXREG_pc      <=0;
    EXREG_Jpred   <=0;
    EXREG_clkint  <=0;
    EXREG_rs1     <=0;
    //EXREG_rs2     <=0;
    EXREG_rs1data <=0;
    EXREG_rs2data <=0;
    EXREG_imm     <=0;
    EXREG_rd      <=0;
    EXU_valid_i   <=0;
    mem_rw_addr_valid_i_reg<=0;
  end
  else if(EXREG_en)begin
    EXREG_ctrl_wb <=ctrl_wb ;
    EXREG_ctrl_mem<=ctrl_mem;
    EXREG_ctrl_ex <=ctrl_ex ;
    EXREG_pc      <=IDREG_pc ;
    EXREG_rs1     <=rs1     ;
    //EXREG_rs2     <=rs2     ;
    EXREG_rs1data <=rs1data ;
    EXREG_rs2data <=rs2data ;
    EXREG_imm     <=imm     ;
    EXREG_rd      <=rdout   ;
    EXREG_clkint  <=IDREG_clkint;
    if(pop)EXREG_Jpred<=0;
    else EXREG_Jpred   <=IDREG_Jpred;
    if(ctrl_ex[4])EXU_valid_i<=1;
    else EXU_valid_i<=0;
    if(ctrl_ex[22]|ctrl_ex[21])mem_rw_addr_valid_i_reg<=1;
    else mem_rw_addr_valid_i_reg<=0;
  end
  else begin
    //if(mem_rw_addr_ready_o)mem_rw_addr_valid_i_reg<=0;
		mem_rw_addr_valid_i_reg<=0;
    if(EXU_valid_o)EXU_valid_i<=0;
  end
end


ysyx_050133_EXU ysyx_050133_EXU_dut(
  .clk    (clk    ) ,
  .rst    (rst    ) ,
  .ctrl_ex(EXREG_ctrl_ex[15:0]) ,
  .pc   (EXREG_pc) ,
  .block   (block) ,
  .Jpred  (EXREG_Jpred) ,
  .mtip   (mtip) ,
  .clkint (EXREG_clkint) ,
  .mieo   (mieo) ,
  .fence  (EXREG_ctrl_ex[23]) ,
  .rs1    (EXREG_rs1) ,
  .rs1data(EXREG_rs1data) ,
  .rs2data(EXREG_rs2data) ,
  .imm    (EXREG_imm    ) ,
  //.forward_ALUSrc1(forward_ALUSrc1),
  //.forward_ALUSrc2(forward_ALUSrc2),
  //.forward_wdataSrc(forward_wdataSrc),
  //.forward_data_mem(rddata),
  //.forward_data_wb(WBREG_rddata),
  .src_valid_i  (EXU_valid_i) ,
  .result_valid_o  (EXU_valid_o) ,
  .dnpc_EXU   (dnpc_EXU   ) ,
  .result (result ) ,
  .csrdata(csrdata) ,
  .wdata (wdata ) 
);

`ifdef ysyx_050133_MULTICYCLE 
assign forward_ALUSrc1=0;
assign forward_ALUSrc2=0;
assign forward_wdataSrc=0;
`else
//assign forward_ALUSrc1= EXREG_rs1==0 ? 0
											 //:MEMREG_ctrl_wb[0]&(MEMREG_rd==EXREG_rs1) ? 
												 //`ysyx_050133_forward_src_mem
											 //:WBREG_ctrl_wb[0]&(WBREG_rd==EXREG_rs1) ? 
												 //`ysyx_050133_forward_src_wb
											 //:0;
//assign forward_ALUSrc2= EXREG_rs2==0 ? 0
											 //:MEMREG_ctrl_wb[0]&(MEMREG_rd==EXREG_rs2) ? 
												 //`ysyx_050133_forward_src_mem
											 //:WBREG_ctrl_wb[0]&(WBREG_rd==EXREG_rs2) ? 
												 //`ysyx_050133_forward_src_wb
											 //:0;
//assign forward_wdataSrc= EXREG_rs2==0 ? 0
		//:EXREG_ctrl_ex[21]&MEMREG_ctrl_wb[0]&(MEMREG_rd==EXREG_rs2) ? 
			//`ysyx_050133_forward_src_mem
		//:EXREG_ctrl_ex[21]&WBREG_ctrl_wb[0]&(WBREG_rd==EXREG_rs2) ? 
			//`ysyx_050133_forward_src_wb
		//:0;
//assign forward_ALUSrc1= 0;
//assign forward_ALUSrc2= 0;
//assign forward_wdataSrc= 0;
`endif

always@(posedge clk)
begin
  if(rst)begin
    MEMREG_ctrl_wb <=0;
    MEMREG_ctrl_mem <=0;
    MEMREG_result  <=0;
    MEMREG_csrdata    <=0;
    MEMREG_imm    <=0;
    MEMREG_rd      <=0;
  end 
  else if(MEMREG_en)begin
    MEMREG_ctrl_wb <= EXREG_ctrl_wb ;
    MEMREG_ctrl_mem <= EXREG_ctrl_mem ;
    MEMREG_result  <= result;
    MEMREG_csrdata    <= csrdata;
    MEMREG_imm     <= EXREG_imm;
    MEMREG_rd      <= EXREG_rd;
  end
end

wire                              mem_rw_addr_valid_i;         
//wire                              mem_rw_addr_ready_o;     
wire [RW_ADDR_WIDTH-1:0]          mem_rw_addr_i      ;
wire                              mem_rw_we_i        ;
wire [7:0]                        mem_rw_len_i       ;
wire [2:0]                        mem_rw_size_i      ;
wire [1:0]                        mem_rw_burst_i     ;
wire                              mem_rw_if_i        ;
wire                              mem_w_data_valid_i ;   
//wire                              mem_w_data_ready_o ;   
wire [RW_DATA_WIDTH-1:0]          mem_w_data_i       ;
//wire                              mem_r_data_valid_o ;   
wire                              mem_r_data_ready_i ;   
wire [RW_DATA_WIDTH-1:0]          mem_r_data_o       ;
//wire                              mem_rw_block_o     ;   
wire                              mem_rw_block_i     ;   
wire                              mem_fence_i        ;   

wire       ori_mem_rw_addr_valid_i;         
wire[31:0] ori_mem_rw_addr_i      ;
wire       ori_mem_rw_we_i        ;
wire[7:0]  ori_mem_rw_len_i       ;
wire[2:0]  ori_mem_rw_size_i      ;
wire[1:0]  ori_mem_rw_burst_i     ;
wire       ori_mem_rw_if_i        ;
wire       ori_mem_w_data_valid_i ;
wire[63:0] ori_mem_w_data_i       ;
wire       ori_mem_r_data_ready_i ;
wire       ori_mem_rw_block_i     ;
wire       ori_mem_fence_i        ;

reg       reg_mem_rw_addr_valid_i;         
reg[31:0] reg_mem_rw_addr_i      ;
reg       reg_mem_rw_we_i        ;
reg[7:0]  reg_mem_rw_len_i       ;
reg[2:0]  reg_mem_rw_size_i      ;
reg[1:0]  reg_mem_rw_burst_i     ;
reg       reg_mem_rw_if_i        ;
reg       reg_mem_w_data_valid_i ;
reg[63:0] reg_mem_w_data_i       ;
reg       reg_mem_r_data_ready_i ;
reg       reg_mem_rw_block_i     ;
reg       reg_mem_fence_i        ;


always@(posedge clk)
begin
	if(rst)begin
		fix_mem_block	<=0;
	end 
	else if(fix_mem_block==1)begin
		fix_mem_block<=0;
		//$display("block=%d",fix_mem_block);
	end
	else if((EXREG_ctrl_ex[21]|EXREG_ctrl_ex[22])&&MEMREG_en)begin
		fix_mem_block<=1;
	end
end
always@(posedge clk)
begin
	if(rst)begin
    reg_mem_rw_addr_valid_i<=0;
    reg_mem_rw_addr_i      <=0;
    reg_mem_rw_we_i        <=0;
    reg_mem_rw_len_i       <=0;
    reg_mem_rw_size_i      <=0;
    reg_mem_rw_burst_i     <=0;
    reg_mem_rw_if_i        <=0;
    reg_mem_w_data_valid_i <=0;
    reg_mem_w_data_i       <=0; 
    reg_mem_r_data_ready_i <=0;
    reg_mem_rw_block_i     <=0;
    reg_mem_fence_i        <=0;
  end 
	else if(~block)begin
    reg_mem_rw_addr_valid_i<=ori_mem_rw_addr_valid_i;
    reg_mem_rw_addr_i      <=ori_mem_rw_addr_i      ;
    reg_mem_rw_we_i        <=ori_mem_rw_we_i        ;
    reg_mem_rw_len_i       <=ori_mem_rw_len_i       ;
    reg_mem_rw_size_i      <=ori_mem_rw_size_i      ;
    reg_mem_rw_burst_i     <=ori_mem_rw_burst_i     ;
    reg_mem_rw_if_i        <=ori_mem_rw_if_i        ;
    reg_mem_w_data_valid_i <=ori_mem_w_data_valid_i ;
    reg_mem_w_data_i       <=ori_mem_w_data_i       ; 
    reg_mem_r_data_ready_i <=ori_mem_r_data_ready_i ;
    reg_mem_rw_block_i     <=ori_mem_rw_block_i     ;
    reg_mem_fence_i        <=ori_mem_fence_i        ;
  end
end
//wire fix_mem_rw_block_i=ifu_rw_block_o|mem_rw_block_o|block_EXU;

assign mem_rw_addr_valid_i = fix_mem_block;
//assign mem_rw_addr_ready_o regem_rw_addr_ready_o;    
assign mem_rw_addr_i       = reg_mem_rw_addr_i      ;
assign mem_rw_we_i         = reg_mem_rw_we_i        ;
assign mem_rw_len_i        = reg_mem_rw_len_i       ; 
assign mem_rw_size_i       = reg_mem_rw_size_i      ;
assign mem_rw_burst_i      = reg_mem_rw_burst_i     ;
assign mem_rw_if_i         = reg_mem_rw_if_i        ;
//assign mem_w_data_valid_i  = reg_mem_w_data_valid_i ;
assign mem_w_data_valid_i  = mem_rw_addr_valid_i&mem_rw_we_i;
//assign mem_w_data_ready_o  reg_n mem_w_data_ready ;
assign mem_w_data_i        = reg_mem_w_data_i       ;
//assign mem_r_data_valid_o  reg_n mem_r_data_valid ;
assign mem_r_data_ready_i  = reg_mem_r_data_ready_i ;
//assign mem_r_data_o        reg_n mem_r_data_o     ;
assign mem_rw_block_i      = ifu_rw_block_o|mem_rw_block_o|block_EXU;
assign mem_fence_i         = reg_mem_fence_i        ;

//assign mem_rw_addr_valid_i = mem_rw_addr_valid_i_reg;
////assign mem_rw_addr_ready_o regem_rw_addr_ready_o;    
//assign mem_rw_addr_i       = ori_mem_rw_addr_i      ;
//assign mem_rw_we_i         = ori_mem_rw_we_i        ;
//assign mem_rw_len_i        = ori_mem_rw_len_i       ; 
//assign mem_rw_size_i       = ori_mem_rw_size_i      ;
//assign mem_rw_burst_i      = ori_mem_rw_burst_i     ;
//assign mem_rw_if_i         = ori_mem_rw_if_i        ;
//assign mem_w_data_valid_i  = ori_mem_w_data_valid_i ;
////assign mem_w_data_ready_o  ori_n mem_w_data_ready ;
//assign mem_w_data_i        = ori_mem_w_data_i       ;
////assign mem_r_data_valid_o  ori_n mem_r_data_valid ;
//assign mem_r_data_ready_i  = ori_mem_r_data_ready_i ;
////assign mem_r_data_o        ori_n mem_r_data_o     ;
//assign mem_rw_block_i      = block;
//assign mem_fence_i         = ori_mem_fence_i        ;

assign ori_mem_rw_addr_valid_i = mem_rw_addr_valid_i_reg;        
//assign mem_rw_addr_ready_o = mem_rw_addr_ready_o;    
assign ori_mem_rw_addr_i       = result[31:0];
assign ori_mem_rw_we_i         = EXREG_ctrl_ex[21] ;
assign ori_mem_rw_len_i        = 0                  ;
assign ori_mem_rw_size_i       = EXREG_ctrl_ex[20:18];
assign ori_mem_rw_burst_i      = `ysyx_050133_AXI_BURST_TYPE_FIXED;
assign ori_mem_rw_if_i         = 0                  ;
assign ori_mem_w_data_valid_i  = mem_rw_addr_valid_i_reg&ori_mem_rw_we_i;  
//assign mem_w_data_ready_o  = mem_w_data_ready_o ;  
assign ori_mem_w_data_i        = wdata       ;
//assign mem_r_data_valid_o  = mem_r_data_valid_o ;  
assign ori_mem_r_data_ready_i  = EXREG_ctrl_ex[21]|EXREG_ctrl_ex[22];  
//assign mem_r_data_o        = din                ;
assign ori_mem_rw_block_i       = block                ;
assign ori_mem_fence_i        = EXREG_ctrl_ex[23]&~ifu_rw_block_o    ;
//
////assign mem_rw_addr_valid_i = mem_rw_addr_valid_i_reg;        
////assign mem_rw_addr_ready_o = mem_rw_addr_ready_o;    
//assign mem_rw_addr_i       = result[31:0];
//assign mem_rw_we_i         = EXREG_ctrl_ex[21] ;
//assign mem_rw_len_i        = 0                  ;
//assign mem_rw_size_i       = EXREG_ctrl_ex[20:18];
//assign mem_rw_burst_i      = `ysyx_050133_AXI_BURST_TYPE_FIXED;
//assign mem_rw_if_i         = 0                  ;
//assign mem_w_data_valid_i  = mem_rw_addr_valid_i&mem_rw_we_i;  
////assign mem_w_data_ready_o  = mem_w_data_ready_o ;  
//assign mem_w_data_i        = wdata       ;
////assign mem_r_data_valid_o  = mem_r_data_valid_o ;  
//assign mem_r_data_ready_i  = EXREG_ctrl_ex[21]|EXREG_ctrl_ex[22];  
////assign mem_r_data_o        = din                ;
//assign mem_rw_block_i       = block                ;
//assign mem_fence_i        = EXREG_ctrl_ex[23]&~ifu_rw_block_o    ;

// Advanced eXtensible Interface

wire                               mem_axio_aw_ready_i;            
wire                               mem_axio_aw_valid_o;
//wire [AXI_ID_WIDTH-1:0]            mem_axio_aw_id_o;
wire [AXI_ADDR_WIDTH-1:0]          mem_axio_aw_addr_o;
wire [7:0]                         mem_axio_aw_len_o;
wire [2:0]                         mem_axio_aw_size_o;
wire [1:0]                         mem_axio_aw_burst_o;
wire                               mem_axio_w_ready_i;             
wire                               mem_axio_w_valid_o;
wire [AXI_DATA_WIDTH-1:0]          mem_axio_w_data_o;
wire [AXI_DATA_WIDTH/8-1:0]        mem_axio_w_strb_o;
wire                               mem_axio_w_last_o;
wire                               mem_axio_b_ready_o;          
wire                               mem_axio_b_valid_i;
//wire [AXI_ID_WIDTH-1:0]            mem_axio_b_id_i;
//wire [1:0]                         mem_axio_b_resp_i;              
wire                               mem_axio_ar_ready_i;            
wire                               mem_axio_ar_valid_o;
//wire [AXI_ID_WIDTH-1:0]            mem_axio_ar_id_o;
wire [AXI_ADDR_WIDTH-1:0]          mem_axio_ar_addr_o;
wire [7:0]                         mem_axio_ar_len_o;
wire [2:0]                         mem_axio_ar_size_o;
wire [1:0]                         mem_axio_ar_burst_o;
wire                               mem_axio_r_ready_o;          
wire                               mem_axio_r_valid_i;             
//wire [AXI_ID_WIDTH-1:0]            mem_axio_r_id_i;
//wire [1:0]                         mem_axio_r_resp_i;
wire [AXI_DATA_WIDTH-1:0]          mem_axio_r_data_i;
//wire                               mem_axio_r_last_i;

ysyx_050133_crossbar ysyx_050133_crossbar_mem(
    .clk              (clk),
    .rst              (rst),

    .rw_addr_valid_i  (mem_rw_addr_valid_i),
    //.rw_addr_ready_o  (mem_rw_addr_ready_o),
    .rw_addr_i        (mem_rw_addr_i      ),
    .rw_we_i          (mem_rw_we_i        ),
    .rw_len_i         (mem_rw_len_i       ),
    .rw_size_i        (mem_rw_size_i      ),
    .rw_burst_i       (mem_rw_burst_i     ),
    .rw_if_i          (mem_rw_if_i        ),
    .w_data_valid_i   (mem_w_data_valid_i ),
    //.w_data_ready_o   (mem_w_data_ready_o ),
    .w_data_i         (mem_w_data_i       ),
    //.r_data_valid_o   (mem_r_data_valid_o ),
    .r_data_ready_i   (mem_r_data_ready_i ),
    .r_data_o         (mem_r_data_o       ),
    .rw_block_o       (mem_rw_block_o     ),
    .rw_block_i       (mem_rw_block_i     ),
    .fence_i          (mem_fence_i        ),
    .fence_o          (mem_fence_o        ),
    .io_sram0_addr     (io_sram4_addr     ),
    .io_sram0_cen      (io_sram4_cen      ),
    .io_sram0_wen      (io_sram4_wen      ),
    .io_sram0_wmask    (io_sram4_wmask    ),  
    .io_sram0_wdata    (io_sram4_wdata    ),  
    .io_sram0_rdata    (io_sram4_rdata    ),  
    .io_sram1_addr     (io_sram5_addr     ),
    .io_sram1_cen      (io_sram5_cen      ),
    .io_sram1_wen      (io_sram5_wen      ),
    .io_sram1_wmask    (io_sram5_wmask    ),  
    .io_sram1_wdata    (io_sram5_wdata    ),  
    .io_sram1_rdata    (io_sram5_rdata    ),  
    .io_sram2_addr     (io_sram6_addr     ),
    .io_sram2_cen      (io_sram6_cen      ),
    .io_sram2_wen      (io_sram6_wen      ),
    .io_sram2_wmask    (io_sram6_wmask    ),  
    .io_sram2_wdata    (io_sram6_wdata    ),  
    .io_sram2_rdata    (io_sram6_rdata    ),  
    .io_sram3_addr     (io_sram7_addr     ),
    .io_sram3_cen      (io_sram7_cen      ),
    .io_sram3_wen      (io_sram7_wen      ),
    .io_sram3_wmask    (io_sram7_wmask    ),  
    .io_sram3_wdata    (io_sram7_wdata    ),  
    .io_sram3_rdata    (io_sram7_rdata    ),  
    // Advanced eXtensible Intenterface
    .axi_aw_ready_i   (mem_axio_aw_ready_i),               
    .axi_aw_valid_o   (mem_axio_aw_valid_o),
		//.axi_aw_id_o      (mem_axio_aw_id_o),
    .axi_aw_addr_o    (mem_axio_aw_addr_o),
    .axi_aw_len_o     (mem_axio_aw_len_o),
    .axi_aw_size_o    (mem_axio_aw_size_o),
    .axi_aw_burst_o   (mem_axio_aw_burst_o),
    .axi_w_ready_i    (mem_axio_w_ready_i),                
    .axi_w_valid_o    (mem_axio_w_valid_o),
    .axi_w_data_o     (mem_axio_w_data_o),
    .axi_w_strb_o     (mem_axio_w_strb_o),
    .axi_w_last_o     (mem_axio_w_last_o),
    .axi_b_ready_o    (mem_axio_b_ready_o),            
    .axi_b_valid_i    (mem_axio_b_valid_i),
		//.axi_b_id_i       (mem_axio_b_id_i),
    //.axi_b_resp_i     (mem_axio_b_resp_i),                 
    .axi_ar_ready_i   (mem_axio_ar_ready_i),               
    .axi_ar_valid_o   (mem_axio_ar_valid_o),
    //.axi_ar_id_o      (mem_axio_ar_id_o),
    .axi_ar_addr_o    (mem_axio_ar_addr_o),
    .axi_ar_len_o     (mem_axio_ar_len_o),
    .axi_ar_size_o    (mem_axio_ar_size_o),
    .axi_ar_burst_o   (mem_axio_ar_burst_o),
    .axi_r_ready_o    (mem_axio_r_ready_o),            
    .axi_r_valid_i    (mem_axio_r_valid_i),                
		//.axi_r_id_i       (mem_axio_r_id_i),
    //.axi_r_resp_i     (mem_axio_r_resp_i),
    .axi_r_data_i     (mem_axio_r_data_i)
    //.axi_r_last_i     (mem_axio_r_last_i)
);



always@(posedge clk)
begin
`ifdef ysyx_050133_DEBUGINFO
  if(WBREG_ctrl_wb[1])stopsim();
`endif
  if(rst)begin
    WBREG_ctrl_wb <=0 ;
    WBREG_rddata<=0;
    WBREG_rd<=0;
  end
  else if(WBREG_en)begin
    WBREG_ctrl_wb <=MEMREG_ctrl_wb ;
    WBREG_rddata<=rddata;
    WBREG_rd<=MEMREG_rd;
  end
end

reg mem_r_data_store;
reg [63:0]mem_r_data_stored;
always@(posedge clk)
begin
  if(rst)begin
    mem_r_data_store<=0;
    mem_r_data_stored<=0;
  end
  else if(WBREG_en)begin
    mem_r_data_store<=0;
    mem_r_data_stored<=0;
  end
  else if(mem_r_data_store==0)begin
    mem_r_data_store<=0;
    mem_r_data_stored<=mem_r_data_o;
  end
end
`ifdef ysyx_050133_MULTICYCLE
wire[63:0] mem_r_data=mem_r_data_o;
`else
wire[63:0] mem_r_data=mem_r_data_store ? mem_r_data_stored : mem_r_data_o;
`endif
wire[63:0] rddata_raw=
   MEMREG_ctrl_mem[6:5]==`ysyx_050133_rdSrc_alu ? MEMREG_result
  :MEMREG_ctrl_mem[6:5]==`ysyx_050133_rdSrc_mem ? mem_r_data  
  :MEMREG_ctrl_mem[6:5]==`ysyx_050133_rdSrc_imm ? MEMREG_imm
  :MEMREG_ctrl_mem[6:5]==`ysyx_050133_rdSrc_csr ? MEMREG_csrdata
  :0;
assign rddata=
     MEMREG_ctrl_mem[4:0]==`ysyx_050133_rdSEXT_b ? SEXT(rddata_raw[31:0],0)
    :MEMREG_ctrl_mem[4:0]==`ysyx_050133_rdSEXT_bu ? {{56'd0},rddata_raw[7:0]}
    :MEMREG_ctrl_mem[4:0]==`ysyx_050133_rdSEXT_h ? SEXT(rddata_raw[31:0],1)
    :MEMREG_ctrl_mem[4:0]==`ysyx_050133_rdSEXT_hu ? {{48'd0},rddata_raw[15:0]}
    :MEMREG_ctrl_mem[4:0]==`ysyx_050133_rdSEXT_w ? SEXT(rddata_raw[31:0],2)
    :MEMREG_ctrl_mem[4:0]==`ysyx_050133_rdSEXT_wu ? {{32'd0},rddata_raw[31:0]}
    :MEMREG_ctrl_mem[4:0]==`ysyx_050133_rdSEXT_d ? rddata_raw
    :0;

wire                        clint_axi_aw_ready_i ;               
wire                        clint_axi_aw_valid_o ;  
//wire [AXI_ID_WIDTH-1:0]     clint_axi_aw_id_o    ;  
wire [AXI_ADDR_WIDTH-1:0]   clint_axi_aw_addr_o  ;  
//wire [7:0]                  clint_axi_aw_len_o   ;  
//wire [2:0]                  clint_axi_aw_size_o  ;  
//wire [1:0]                  clint_axi_aw_burst_o ;  
wire                        clint_axi_w_ready_i  ;               
wire                        clint_axi_w_valid_o  ;  
wire [AXI_DATA_WIDTH-1:0]   clint_axi_w_data_o   ;  
wire [AXI_DATA_WIDTH/8-1:0] clint_axi_w_strb_o   ;  
//wire                        clint_axi_w_last_o   ;  
wire                        clint_axi_b_ready_o  ;           
wire                        clint_axi_b_valid_i  ;  
//wire [AXI_ID_WIDTH-1:0]     clint_axi_b_id_i     ;  
//wire [1:0]                  clint_axi_b_resp_i   ;               
wire                        clint_axi_ar_ready_i ;               
wire                        clint_axi_ar_valid_o ;  
//wire [AXI_ID_WIDTH-1:0]     clint_axi_ar_id_o    ;  
wire [AXI_ADDR_WIDTH-1:0]   clint_axi_ar_addr_o  ;  
//wire [7:0]                  clint_axi_ar_len_o   ;  
//wire [2:0]                  clint_axi_ar_size_o  ;  
//wire [1:0]                  clint_axi_ar_burst_o ;  
wire                        clint_axi_r_ready_o  ;           
wire                        clint_axi_r_valid_i  ;              
//wire [AXI_ID_WIDTH-1:0]     clint_axi_r_id_i     ;  
//wire [1:0]                  clint_axi_r_resp_i   ;  
wire [AXI_DATA_WIDTH-1:0]   clint_axi_r_data_i   ;  
//wire                        clint_axi_r_last_i   ;  

//assign clint_axi_aw_ready_i =0;               
//assign clint_axi_aw_valid_o =0;  
//assign clint_axi_aw_id_o    =0;  
//assign clint_axi_aw_addr_o  =0;  
//assign clint_axi_aw_len_o   =0;  
//assign clint_axi_aw_size_o  =0;  
//assign clint_axi_aw_burst_o =0;  
//assign clint_axi_w_ready_i  =0;               
//assign clint_axi_w_valid_o  =0;  
//assign clint_axi_w_data_o   =0;  
//assign clint_axi_w_strb_o   =0;  
//assign clint_axi_w_last_o   =0;  
//assign clint_axi_b_ready_o  =0;           
//assign clint_axi_b_valid_i  =0;  
//assign clint_axi_b_id_i     =0;  
//assign clint_axi_b_resp_i   =0;               
//assign clint_axi_ar_ready_i =0;               
//assign clint_axi_ar_valid_o =0;  
//assign clint_axi_ar_id_o    =0;  
//assign clint_axi_ar_addr_o  =0;  
//assign clint_axi_ar_len_o   =0;  
//assign clint_axi_ar_size_o  =0;  
//assign clint_axi_ar_burst_o =0;  
//assign clint_axi_r_ready_o  =0;           
//assign clint_axi_r_valid_i  =0;              
//assign clint_axi_r_id_i     =0;  
//assign clint_axi_r_resp_i   =0;  
//assign clint_axi_r_data_i   =0;  
//assign clint_axi_r_last_i   =1;  

wire                        mem_axi_aw_ready_i ;               
wire                        mem_axi_aw_valid_o ;  
//wire [AXI_ID_WIDTH-1:0]     mem_axi_aw_id_o    ;  
wire [AXI_ADDR_WIDTH-1:0]   mem_axi_aw_addr_o  ;  
wire [7:0]                  mem_axi_aw_len_o   ;  
wire [2:0]                  mem_axi_aw_size_o  ;  
wire [1:0]                  mem_axi_aw_burst_o ;  
wire                        mem_axi_w_ready_i  ;               
wire                        mem_axi_w_valid_o  ;  
wire [AXI_DATA_WIDTH-1:0]   mem_axi_w_data_o   ;  
wire [AXI_DATA_WIDTH/8-1:0] mem_axi_w_strb_o   ;  
wire                        mem_axi_w_last_o   ;  
wire                        mem_axi_b_ready_o  ;           
wire                        mem_axi_b_valid_i  ;  
//wire [AXI_ID_WIDTH-1:0]     mem_axi_b_id_i     ;  
//wire [1:0]                  mem_axi_b_resp_i   ;               
wire                        mem_axi_ar_ready_i ;               
wire                        mem_axi_ar_valid_o ;  
//wire [AXI_ID_WIDTH-1:0]     mem_axi_ar_id_o    ;  
wire [AXI_ADDR_WIDTH-1:0]   mem_axi_ar_addr_o  ;  
wire [7:0]                  mem_axi_ar_len_o   ;  
wire [2:0]                  mem_axi_ar_size_o  ;  
wire [1:0]                  mem_axi_ar_burst_o ;  
wire                        mem_axi_r_ready_o  ;           
wire                        mem_axi_r_valid_i  ;              
//wire [AXI_ID_WIDTH-1:0]     mem_axi_r_id_i     ;  
//wire [1:0]                  mem_axi_r_resp_i   ;  
wire [AXI_DATA_WIDTH-1:0]   mem_axi_r_data_i   ;  
//wire                        mem_axi_r_last_i   ;  

//wire clint=(EXREG_ctrl_ex[22]|EXREG_ctrl_ex[21])&&(mem_rw_addr_i>32'h1ffffff&&mem_rw_addr_i<32'h2010000);
wire clint=(mem_r_data_ready_i)&&(mem_rw_addr_i>32'h1ffffff&&mem_rw_addr_i<32'h2010000);
//wire clint=(EXREG_ctrl_ex[22]|EXREG_ctrl_ex[21])&&(mem_rw_addr_i<32'h10000000);

assign mem_axio_aw_ready_i = clint ? clint_axi_aw_ready_i:mem_axi_aw_ready_i;  
//assign mem_axio_aw_valid_o = clint ? clint_axi_aw_valid_o:mem_axi_aw_valid_o;
//assign mem_axio_aw_id_o    = clint ? clint_axi_aw_id_o   :mem_axi_aw_id_o;   
//assign mem_axio_aw_addr_o  = clint ? clint_axi_aw_addr_o :mem_axi_aw_addr_o; 
//assign mem_axio_aw_len_o   = clint ? clint_axi_aw_len_o  :mem_axi_aw_len_o;  
//assign mem_axio_aw_size_o  = clint ? clint_axi_aw_size_o :mem_axi_aw_size_o; 
//assign mem_axio_aw_burst_o = clint ? clint_axi_aw_burst_o:mem_axi_aw_burst_o;
assign mem_axio_w_ready_i  = clint ? clint_axi_w_ready_i :mem_axi_w_ready_i;          
//assign mem_axio_w_valid_o  = clint ? clint_axi_w_valid_o :mem_axi_w_valid_o; 
//assign mem_axio_w_data_o   = clint ? clint_axi_w_data_o  :mem_axi_w_data_o;  
//assign mem_axio_w_strb_o   = clint ? clint_axi_w_strb_o  :mem_axi_w_strb_o;  
//assign mem_axio_w_last_o   = clint ? clint_axi_w_last_o  :mem_axi_w_last_o;  
//assign mem_axio_b_ready_o  = clint ? clint_axi_b_ready_o :mem_axi_b_ready_o;          
assign mem_axio_b_valid_i  = clint ? clint_axi_b_valid_i :mem_axi_b_valid_i;   
//assign mem_axio_b_id_i     = clint ? clint_axi_b_id_i    :mem_axi_b_id_i;      
//assign mem_axio_b_resp_i   = clint ? clint_axi_b_resp_i  :mem_axi_b_resp_i;               
assign mem_axio_ar_ready_i = clint ? clint_axi_ar_ready_i:mem_axi_ar_ready_i;         
//assign mem_axio_ar_valid_o = clint ? clint_axi_ar_valid_o:mem_axi_ar_valid_o;
//assign mem_axio_ar_id_o    = clint ? clint_axi_ar_id_o   :mem_axi_ar_id_o;   
//assign mem_axio_ar_addr_o  = clint ? clint_axi_ar_addr_o :mem_axi_ar_addr_o; 
//assign mem_axio_ar_len_o   = clint ? clint_axi_ar_len_o  :mem_axi_ar_len_o;  
//assign mem_axio_ar_size_o  = clint ? clint_axi_ar_size_o :mem_axi_ar_size_o; 
//assign mem_axio_ar_burst_o = clint ? clint_axi_ar_burst_o:mem_axi_ar_burst_o;
//assign mem_axio_r_ready_o  = clint ? clint_axi_r_ready_o :mem_axi_r_ready_o;          
assign mem_axio_r_valid_i  = clint ? clint_axi_r_valid_i :mem_axi_r_valid_i;             
//assign mem_axio_r_id_i     = clint ? clint_axi_r_id_i    :mem_axi_r_id_i;      
//assign mem_axio_r_resp_i   = clint ? clint_axi_r_resp_i  :mem_axi_r_resp_i;    
assign mem_axio_r_data_i   = clint ? clint_axi_r_data_i  :mem_axi_r_data_i;    
//assign mem_axio_r_last_i   = clint ? clint_axi_r_last_i  :mem_axi_r_last_i;    


//assign mem_axi_aw_ready_i = clint ? 0 : mem_axio_aw_ready_i ;        
assign mem_axi_aw_valid_o = clint ? 0 : mem_axio_aw_valid_o ;  
//assign mem_axi_aw_id_o    = clint ? 0 : mem_axio_aw_id_o    ;  
assign mem_axi_aw_addr_o  = clint ? 0 : mem_axio_aw_addr_o  ;  
assign mem_axi_aw_len_o   = clint ? 0 : mem_axio_aw_len_o   ;  
assign mem_axi_aw_size_o  = clint ? 0 : mem_axio_aw_size_o  ;  
assign mem_axi_aw_burst_o = clint ? 0 : mem_axio_aw_burst_o ;  
//assign mem_axi_w_ready_i  = clint ? 0 : mem_axio_w_ready_i  ;        
assign mem_axi_w_valid_o  = clint ? 0 : mem_axio_w_valid_o  ;  
assign mem_axi_w_data_o   = clint ? 0 : mem_axio_w_data_o   ;  
assign mem_axi_w_strb_o   = clint ? 0 : mem_axio_w_strb_o   ;  
assign mem_axi_w_last_o   = clint ? 0 : mem_axio_w_last_o   ;  
assign mem_axi_b_ready_o  = clint ? 0 : mem_axio_b_ready_o  ;           
//assign mem_axi_b_valid_i  = clint ? 0 : mem_axio_b_valid_i  ;  
//assign mem_axi_b_id_i     = clint ? 0 : mem_axio_b_id_i     ;  
//assign mem_axi_b_resp_i   = clint ? 0 : mem_axio_b_resp_i   ;       
//assign mem_axi_ar_ready_i = clint ? 0 : mem_axio_ar_ready_i ;       
assign mem_axi_ar_valid_o = clint ? 0 : mem_axio_ar_valid_o ;  
//assign mem_axi_ar_id_o    = clint ? 0 : mem_axio_ar_id_o    ;  
assign mem_axi_ar_addr_o  = clint ? 0 : mem_axio_ar_addr_o  ;  
assign mem_axi_ar_len_o   = clint ? 0 : mem_axio_ar_len_o   ;  
assign mem_axi_ar_size_o  = clint ? 0 : mem_axio_ar_size_o  ;  
assign mem_axi_ar_burst_o = clint ? 0 : mem_axio_ar_burst_o ;  
assign mem_axi_r_ready_o  = clint ? 0 : mem_axio_r_ready_o  ;           
//assign mem_axi_r_valid_i  = clint ? 0 : mem_axio_r_valid_i  ;         
//assign mem_axi_r_id_i     = clint ? 0 : mem_axio_r_id_i     ;  
//assign mem_axi_r_resp_i   = clint ? 0 : mem_axio_r_resp_i   ;  
//assign mem_axi_r_data_i   = clint ? 0 : mem_axio_r_data_i   ;  
//assign mem_axi_r_last_i   = clint ? 0 : mem_axio_r_last_i   ;  

//assign clint_axi_aw_ready_i = clint ?mem_axio_aw_ready_i  :0;    
assign clint_axi_aw_valid_o = clint ?mem_axio_aw_valid_o  :0;  
//assign clint_axi_aw_id_o    = clint ?mem_axio_aw_id_o     :0;  
assign clint_axi_aw_addr_o  = clint ?mem_axio_aw_addr_o   :0;  
//assign clint_axi_aw_len_o   = clint ?mem_axio_aw_len_o    :0;  
//assign clint_axi_aw_size_o  = clint ?mem_axio_aw_size_o   :0;  
//assign clint_axi_aw_burst_o = clint ?mem_axio_aw_burst_o  :0;  
//assign clint_axi_w_ready_i  = clint ?mem_axio_w_ready_i   :0; 
assign clint_axi_w_valid_o  = clint ?mem_axio_w_valid_o   :0;  
assign clint_axi_w_data_o   = clint ?mem_axio_w_data_o    :0;  
assign clint_axi_w_strb_o   = clint ?mem_axio_w_strb_o    :0;  
//assign clint_axi_w_last_o   = clint ?mem_axio_w_last_o    :0;
assign clint_axi_b_ready_o  = clint ?mem_axio_b_ready_o   :0;      
//assign clint_axi_b_valid_i  = clint ?mem_axio_b_valid_i   :0;  
//assign clint_axi_b_id_i     = clint ?mem_axio_b_id_i      :0;  
//assign clint_axi_b_resp_i   = clint ?mem_axio_b_resp_i    :0;    
//assign clint_axi_ar_ready_i = clint ?mem_axio_ar_ready_i  :0;    
assign clint_axi_ar_valid_o = clint ?mem_axio_ar_valid_o  :0;  
//assign clint_axi_ar_id_o    = clint ?mem_axio_ar_id_o     :0;  
assign clint_axi_ar_addr_o  = clint ?mem_axio_ar_addr_o   :0;  
//assign clint_axi_ar_len_o   = clint ?mem_axio_ar_len_o    :0;  
//assign clint_axi_ar_size_o  = clint ?mem_axio_ar_size_o   :0;  
//assign clint_axi_ar_burst_o = clint ?mem_axio_ar_burst_o  :0;  
assign clint_axi_r_ready_o  = clint ?mem_axio_r_ready_o   :0;      
//assign clint_axi_r_valid_i  = clint ?mem_axio_r_valid_i   :0;     
//assign clint_axi_r_id_i     = clint ?mem_axio_r_id_i      :0;  
//assign clint_axi_r_resp_i   = clint ?mem_axio_r_resp_i    :0;  
//assign clint_axi_r_data_i   = clint ?mem_axio_r_data_i    :0;  
//assign clint_axi_r_last_i   = clint ?mem_axio_r_last_i    :0;  
//
ysyx_050133_axi_arbiter ysyx_050133_axi_arbiter_dut(
    .clk               (clk),               
    .rst               (rst),
    .s1_axi_aw_ready_o    (ifu_axi_aw_ready_i),                
    .s1_axi_aw_valid_i    (ifu_axi_aw_valid_o),
		//.s1_axi_aw_id_i       (ifu_axi_aw_id_o),
    .s1_axi_aw_addr_i     (ifu_axi_aw_addr_o),
    .s1_axi_aw_len_i      (ifu_axi_aw_len_o),
    .s1_axi_aw_size_i     (ifu_axi_aw_size_o),
    .s1_axi_aw_burst_i    (ifu_axi_aw_burst_o),
    .s1_axi_w_ready_o     (ifu_axi_w_ready_i),                  
    .s1_axi_w_valid_i     (ifu_axi_w_valid_o),
    .s1_axi_w_data_i      (ifu_axi_w_data_o),
    .s1_axi_w_strb_i      (ifu_axi_w_strb_o),
    .s1_axi_w_last_i      (ifu_axi_w_last_o),
    .s1_axi_b_ready_i     (ifu_axi_b_ready_o),                  
    .s1_axi_b_valid_o     (ifu_axi_b_valid_i),
		//.s1_axi_b_id_o        (ifu_axi_b_id_i),
    //.s1_axi_b_resp_o      (ifu_axi_b_resp_i),                   
    .s1_axi_ar_ready_o    (ifu_axi_ar_ready_i),                  
    .s1_axi_ar_valid_i    (ifu_axi_ar_valid_o),
		//.s1_axi_ar_id_i       (ifu_axi_ar_id_o),
    .s1_axi_ar_addr_i     (ifu_axi_ar_addr_o),
    .s1_axi_ar_len_i      (ifu_axi_ar_len_o),
    .s1_axi_ar_size_i     (ifu_axi_ar_size_o),
    .s1_axi_ar_burst_i    (ifu_axi_ar_burst_o),
    .s1_axi_r_ready_i     (ifu_axi_r_ready_o),                   
    .s1_axi_r_valid_o     (ifu_axi_r_valid_i),                  
		//.s1_axi_r_id_o        (ifu_axi_r_id_i),
    //.s1_axi_r_resp_o      (ifu_axi_r_resp_i),
    .s1_axi_r_data_o      (ifu_axi_r_data_i),
    //.s1_axi_r_last_o      (ifu_axi_r_last_i),

    .s2_axi_aw_ready_o    (mem_axi_aw_ready_i),                
    .s2_axi_aw_valid_i    (mem_axi_aw_valid_o),
		//.s2_axi_aw_id_i       (mem_axi_aw_id_o),
    .s2_axi_aw_addr_i     (mem_axi_aw_addr_o),
    .s2_axi_aw_len_i      (mem_axi_aw_len_o),
    .s2_axi_aw_size_i     (mem_axi_aw_size_o),
    .s2_axi_aw_burst_i    (mem_axi_aw_burst_o),
    .s2_axi_w_ready_o     (mem_axi_w_ready_i),                  
    .s2_axi_w_valid_i     (mem_axi_w_valid_o),
    .s2_axi_w_data_i      (mem_axi_w_data_o),
    .s2_axi_w_strb_i      (mem_axi_w_strb_o),
    .s2_axi_w_last_i      (mem_axi_w_last_o),
    .s2_axi_b_ready_i     (mem_axi_b_ready_o),                  
    .s2_axi_b_valid_o     (mem_axi_b_valid_i),
		//.s2_axi_b_id_o        (mem_axi_b_id_i),
    //.s2_axi_b_resp_o      (mem_axi_b_resp_i),                   
    .s2_axi_ar_ready_o    (mem_axi_ar_ready_i),                  
    .s2_axi_ar_valid_i    (mem_axi_ar_valid_o),
		//.s2_axi_ar_id_i       (mem_axi_ar_id_o),
    .s2_axi_ar_addr_i     (mem_axi_ar_addr_o),
    .s2_axi_ar_len_i      (mem_axi_ar_len_o),
    .s2_axi_ar_size_i     (mem_axi_ar_size_o),
    .s2_axi_ar_burst_i    (mem_axi_ar_burst_o),
    .s2_axi_r_ready_i     (mem_axi_r_ready_o),                   
    .s2_axi_r_valid_o     (mem_axi_r_valid_i),                  
		//.s2_axi_r_id_o        (mem_axi_r_id_i),
    //.s2_axi_r_resp_o      (mem_axi_r_resp_i),
    .s2_axi_r_data_o      (mem_axi_r_data_i),
    //.s2_axi_r_last_o      (mem_axi_r_last_i),
    //
    .axi_aw_ready_i       (io_master_awready ),   
    .axi_aw_valid_o       (io_master_awvalid ),   
	  .axi_aw_id_o          (io_master_awid    ),  
    .axi_aw_addr_o        (io_master_awaddr  ),   
    .axi_aw_len_o         (io_master_awlen   ),  
    .axi_aw_size_o        (io_master_awsize  ),   
    .axi_aw_burst_o       (io_master_awburst ),   
    .axi_w_ready_i        (io_master_wready  ),   
    .axi_w_valid_o        (io_master_wvalid  ),   
    .axi_w_data_o         (io_master_wdata   ),  
    .axi_w_strb_o         (io_master_wstrb   ),  
    .axi_w_last_o         (io_master_wlast   ),  
    .axi_b_ready_o        (io_master_bready  ),   
    .axi_b_valid_i        (io_master_bvalid  ),   
		.axi_b_id_i           (io_master_bid     ),
    .axi_b_resp_i         (io_master_bresp   ),  
    .axi_ar_ready_i       (io_master_arready ),   
    .axi_ar_valid_o       (io_master_arvalid ),   
  	.axi_ar_id_o          (io_master_arid    ),  
    .axi_ar_addr_o        (io_master_araddr  ),   
    .axi_ar_len_o         (io_master_arlen   ),  
    .axi_ar_size_o        (io_master_arsize  ),   
    .axi_ar_burst_o       (io_master_arburst ),   
    .axi_r_ready_o        (io_master_rready  ),   
    .axi_r_valid_i        (io_master_rvalid  ),   
	  .axi_r_id_i           (io_master_rid     ),
    .axi_r_resp_i         (io_master_rresp   ),  
    .axi_r_data_i         (io_master_rdata   ),  
    .axi_r_last_i         (io_master_rlast   )  
);
ysyx_050133_CLINT ysyx_050133_CLINT_dut(
    .clk               (clk),               
    .rst               (rst),
    .mtip              (mtip),
    .axi_aw_ready_o    (clint_axi_aw_ready_i ),                   
    .axi_aw_valid_i    (clint_axi_aw_valid_o ),  
		//.axi_aw_id_i       (clint_axi_aw_id_o    ),  
    .axi_aw_addr_i     (clint_axi_aw_addr_o  ),  
    //.axi_aw_len_i      (clint_axi_aw_len_o   ),  
    //.axi_aw_size_i     (clint_axi_aw_size_o  ),  
    //.axi_aw_burst_i    (clint_axi_aw_burst_o ),  
    .axi_w_ready_o     (clint_axi_w_ready_i  ),                    
    .axi_w_valid_i     (clint_axi_w_valid_o  ),  
    .axi_w_data_i      (clint_axi_w_data_o   ),  
    .axi_w_strb_i      (clint_axi_w_strb_o   ),  
    //.axi_w_last_i      (clint_axi_w_last_o   ),  
    .axi_b_ready_i     (clint_axi_b_ready_o  ),                    
    .axi_b_valid_o     (clint_axi_b_valid_i  ),  
		//.axi_b_id_o        (clint_axi_b_id_i     ),  
    //.axi_b_resp_o      (clint_axi_b_resp_i   ),                  
    .axi_ar_ready_o    (clint_axi_ar_ready_i ),                    
    .axi_ar_valid_i    (clint_axi_ar_valid_o ),  
		//.axi_ar_id_i       (clint_axi_ar_id_o    ),  
    .axi_ar_addr_i     (clint_axi_ar_addr_o  ),  
    //.axi_ar_len_i      (clint_axi_ar_len_o   ),  
    //.axi_ar_size_i     (clint_axi_ar_size_o  ),  
    //.axi_ar_burst_i    (clint_axi_ar_burst_o ),  
    .axi_r_ready_i     (clint_axi_r_ready_o  ),                    
    .axi_r_valid_o     (clint_axi_r_valid_i  ),                    
		//.axi_r_id_o        (clint_axi_r_id_i     ),  
    //.axi_r_resp_o      (clint_axi_r_resp_i   ),  
    .axi_r_data_o      (clint_axi_r_data_i   )
    //.axi_r_last_o      (clint_axi_r_last_i   )  
);

`ifdef ysyx_050133_REGINFO
always@(posedge clk)
  begin
  $display("\
    pc=%h,inst=%h,npc=%h,inst64=%h\
IDREG_en  =%h,     IDREG_pc  =%h,     IDREG_inst=%h,     \
    block_axi_ifu=%d,  block_axi_mem=%d,  block=%d,  \
EXREG_en  =%h,     EXREG_ctrl_wb =%h, EXREG_ctrl_mem=%h, \
    EXREG_ctrl_ex =%h, has_hazard=%d,     EXREG_pc     =%h,  \
    EXREG_rs1    =%d,  EXREG_rs2    =%d,  \
    EXREG_rs1data=%h,  EXREG_rs2data=%h,  \
    EXREG_imm    =%h,  \
    EXREG_rd     =%d,  EXREG_npcSrc =%d,  EXREG_addSrc =%d,  \
    EXREG_ALUSrc1=%d,  EXREG_ALUSrc2=%d,  EXREG_ALUW   =%d,  \
    EXREG_ALUop  =%d,  result       =%h,  dnpc_EXU     =%h,  \
    forward_ALUSrc1=%h,forward_ALUSrc2=%h,forward_wdataSrc=%h,\
    EXREG_pcSrcJ=%d,   EXREG_pcSrcB=%d,  pcSrc        =%d,  \
    EXREG_CSRop  =%d,  EXREG_CSRsrc =%d,  mem_w_data  =%h \
    mem_read=%d,    mem_write=%d,   mem_rw_size=%h,  \
MEMREG_en  =%h,    MEMREG_ctrl_wb =%h,\
    MEMREG_result=%h,  mem_data_o =%h,  \
    MEMREG_csrdata =%h,  \
    MEMREG_imm   =%h,   MEMREG_rd    =%d,  \
    WBREG_rdSrc    =%d,WBREG_rdSEXT   =%d,rddata      =%h \
WBREG_en  =%h,     WBREG_ctrl_wb=%h,  WBREG_rddata =%h,   \
    WBREG_rd  =%d,     WBREG_ebreak =%d,  WBREG_rdWen    =%d,\
"
         ,pc,inst,npc,ifu_r_data_o
         ,IDREG_en  ,IDREG_pc  ,IDREG_inst
         ,ifu_rw_block_o,mem_rw_block_o,block

         ,EXREG_en  ,EXREG_ctrl_wb ,EXREG_ctrl_mem
         ,EXREG_ctrl_ex ,has_hazard
         ,EXREG_pc     ,EXREG_rs1,EXREG_rs2
         ,EXREG_rs1data,EXREG_rs2data
         ,EXREG_imm    
         ,EXREG_rd     ,EXREG_ctrl_ex[10],EXREG_ctrl_ex[9]
         ,EXREG_ctrl_ex[8],EXREG_ctrl_ex[7:6],EXREG_ctrl_ex[5]
         ,EXREG_ctrl_ex[4:0],result,dnpc_EXU
         ,forward_ALUSrc1,forward_ALUSrc2,forward_wdataSrc
         ,EXREG_ctrl_ex[17],EXREG_ctrl_ex[16],pcSrc
         ,EXREG_ctrl_ex[15:13],EXREG_ctrl_ex[12:11],wdata
         ,EXREG_ctrl_ex[22],EXREG_ctrl_ex[21],EXREG_ctrl_ex[20:18]

         ,MEMREG_en  ,MEMREG_ctrl_wb 
         ,MEMREG_result,mem_r_data 
         ,MEMREG_csrdata 
         ,MEMREG_imm   ,MEMREG_rd    
         ,MEMREG_ctrl_mem[6:5],MEMREG_ctrl_mem[4:0],rddata

         ,WBREG_en  ,WBREG_ctrl_wb,WBREG_rddata 
         ,WBREG_rd    ,WBREG_ctrl_wb[1],WBREG_ctrl_wb[0]
         );
end
`endif
`ifdef ysyx_050133_AXIINFOIFU
always@(posedge clk)
  begin
  $display("\
ifu_rw_addr_valid_i=%d,  rw_addr_i=%h,\
    w_data_valid_i =%d,  w_data_i =%h,\
    r_data_o =%h,\
    rw_size_i=%h,\
    \
    aw_ready_i=%d, aw_valid_o=%d, aw_addr_o=%h\
    w_ready_i =%d, w_valid_o =%d,  w_data_o=%h,  w_strb=%h\
    b_ready_o =%d, b_valid_i =%d,  \
    ar_ready_i=%d, ar_valid_o=%d, ar_addr_o=%h\
    r_ready_o =%d, r_valid_i =%d,   r_data_i=%h\
    "   
         ,ifu_rw_addr_valid_i,ifu_rw_addr_i
         ,ifu_w_data_valid_i,ifu_w_data_i
         ,ifu_r_data_o
         ,ifu_rw_size_i
         ,ifu_axi_aw_ready_i,ifu_axi_aw_valid_o,ifu_axi_aw_addr_o
         ,ifu_axi_w_ready_i, ifu_axi_w_valid_o, ifu_axi_w_data_o, ifu_axi_w_strb_o
         ,ifu_axi_b_ready_o, ifu_axi_b_valid_i 
         ,ifu_axi_ar_ready_i,ifu_axi_ar_valid_o,ifu_axi_ar_addr_o
         ,ifu_axi_r_ready_o, ifu_axi_r_valid_i,ifu_axi_r_data_i
               );
end
`endif
`ifdef ysyx_050133_AXIINFOMEM
always@(posedge clk)begin
  $display("\
mem_rw_addr_valid_i=%d,  rw_addr_i=%h,\
    rw_we_i =%d,w_data_valid_i =%d,  w_data_i =%h,\
    r_data_o =%h,\
    rw_size_i=%h,\
    \
    aw_ready_i=%d, aw_valid_o=%d, aw_addr_o=%h\
    w_ready_i =%d, w_valid_o =%d,  w_data_o=%h,  w_strb=%h\
    b_ready_o =%d, b_valid_i =%d,  \
    ar_ready_i=%d, ar_valid_o=%d, ar_addr_o=%h\
    r_ready_o =%d, r_valid_i =%d,   r_data_i=%h\
    "   
         ,mem_rw_addr_valid_i,mem_rw_addr_i
         ,mem_rw_we_i,mem_w_data_valid_i,mem_w_data_i
         ,mem_r_data_o
         ,mem_rw_size_i
         ,mem_axi_aw_ready_i,mem_axi_aw_valid_o,mem_axi_aw_addr_o
         ,mem_axi_w_ready_i, mem_axi_w_valid_o, mem_axi_w_data_o, mem_axi_w_strb_o
         ,mem_axi_b_ready_o, mem_axi_b_valid_i 
         ,mem_axi_ar_ready_i,mem_axi_ar_valid_o,mem_axi_ar_addr_o
         ,mem_axi_r_ready_o, mem_axi_r_valid_i,mem_axi_r_data_i
               );
end
`endif

endmodule
module ysyx_050133_axi_arbiter # (
    parameter AXI_DATA_WIDTH    = 64,
    parameter AXI_ADDR_WIDTH    = 32,
    parameter AXI_ID_WIDTH      = 4
)(//IF&MEM输入信号
    input                               clk,
    input                               rst,

    // Advanced eXtensible Interface Slave1
    output                              s1_axi_aw_ready_o,       
    input                               s1_axi_aw_valid_i,
		//input [AXI_ID_WIDTH-1:0]            s1_axi_aw_id_i,
    input [AXI_ADDR_WIDTH-1:0]          s1_axi_aw_addr_i,
    input [7:0]                         s1_axi_aw_len_i,
    input [2:0]                         s1_axi_aw_size_i,
    input [1:0]                         s1_axi_aw_burst_i,

    output                              s1_axi_w_ready_o,        
    input                               s1_axi_w_valid_i,
    input [AXI_DATA_WIDTH-1:0]          s1_axi_w_data_i,
    input [AXI_DATA_WIDTH/8-1:0]        s1_axi_w_strb_i,
    input                               s1_axi_w_last_i,
    
    input                               s1_axi_b_ready_i,      
    output                              s1_axi_b_valid_o,
		//output      [AXI_ID_WIDTH-1:0]      s1_axi_b_id_o,
    //output      [1:0]                   s1_axi_b_resp_o,          

    output                              s1_axi_ar_ready_o,       
    input                               s1_axi_ar_valid_i,
		//input [AXI_ID_WIDTH-1:0]            s1_axi_ar_id_i,
    input [AXI_ADDR_WIDTH-1:0]          s1_axi_ar_addr_i,
    input [7:0]                         s1_axi_ar_len_i,
    input [2:0]                         s1_axi_ar_size_i,
    input [1:0]                         s1_axi_ar_burst_i,
    
    input                               s1_axi_r_ready_i,          
    output                              s1_axi_r_valid_o,        
    //output      [AXI_ID_WIDTH-1:0]      s1_axi_r_id_o,
    //output      [1:0]                   s1_axi_r_resp_o,
    output      [AXI_DATA_WIDTH-1:0]    s1_axi_r_data_o,
    //output                              s1_axi_r_last_o,
    // Advanced eXtensible Interface Slave2
    output                              s2_axi_aw_ready_o,       
    input                               s2_axi_aw_valid_i,
		//input [AXI_ID_WIDTH-1:0]            s2_axi_aw_id_i,
    input [AXI_ADDR_WIDTH-1:0]          s2_axi_aw_addr_i,
    input [7:0]                         s2_axi_aw_len_i,
    input [2:0]                         s2_axi_aw_size_i,
    input [1:0]                         s2_axi_aw_burst_i,

    output                              s2_axi_w_ready_o,        
    input                               s2_axi_w_valid_i,
    input [AXI_DATA_WIDTH-1:0]          s2_axi_w_data_i,
    input [AXI_DATA_WIDTH/8-1:0]        s2_axi_w_strb_i,
    input                               s2_axi_w_last_i,
    
    input                               s2_axi_b_ready_i,      
    output                              s2_axi_b_valid_o,
		//output      [AXI_ID_WIDTH-1:0]      s2_axi_b_id_o,
    //output      [1:0]                   s2_axi_b_resp_o,          

    output                              s2_axi_ar_ready_o,       
    input                               s2_axi_ar_valid_i,
		//input [AXI_ID_WIDTH-1:0]            s2_axi_ar_id_i,
    input [AXI_ADDR_WIDTH-1:0]          s2_axi_ar_addr_i,
    input [7:0]                         s2_axi_ar_len_i,
    input [2:0]                         s2_axi_ar_size_i,
    input [1:0]                         s2_axi_ar_burst_i,
    
    input                               s2_axi_r_ready_i,          
    output                              s2_axi_r_valid_o,        
    //output      [AXI_ID_WIDTH-1:0]      s2_axi_r_id_o,
    //output      [1:0]                   s2_axi_r_resp_o,
    output      [AXI_DATA_WIDTH-1:0]    s2_axi_r_data_o,
    //output                              s2_axi_r_last_o,
    // Advanced eXtensible Interface  Master
    input                               axi_aw_ready_i,             
    output                              axi_aw_valid_o,
    output     [AXI_ID_WIDTH-1:0]       axi_aw_id_o,
    output     [AXI_ADDR_WIDTH-1:0]     axi_aw_addr_o,
    output     [7:0]                    axi_aw_len_o,
    output     [2:0]                    axi_aw_size_o,
    output     [1:0]                    axi_aw_burst_o,

    input                               axi_w_ready_i,              
    output                              axi_w_valid_o,
    output     [AXI_DATA_WIDTH-1:0]     axi_w_data_o,
    output     [AXI_DATA_WIDTH/8-1:0]   axi_w_strb_o,
    output                              axi_w_last_o,
    
    output                              axi_b_ready_o,          
    input                               axi_b_valid_i,
    input  [AXI_ID_WIDTH-1:0]           axi_b_id_i,
    input  [1:0]                        axi_b_resp_i,               

    input                               axi_ar_ready_i,             
    output                              axi_ar_valid_o,
    output     [AXI_ID_WIDTH-1:0]       axi_ar_id_o,
    output     [AXI_ADDR_WIDTH-1:0]     axi_ar_addr_o,
    output     [7:0]                    axi_ar_len_o,
    output     [2:0]                    axi_ar_size_o,
    output     [1:0]                    axi_ar_burst_o,
    
    output                              axi_r_ready_o,          
    input                               axi_r_valid_i,             
    input  [AXI_ID_WIDTH-1:0]           axi_r_id_i,
    input  [1:0]                        axi_r_resp_i,
    input  [AXI_DATA_WIDTH-1:0]         axi_r_data_i,
    input                               axi_r_last_i
);

reg r_channel;
reg w_channel;

assign s2_axi_aw_ready_o=w_channel ? axi_aw_ready_i:0;
assign s1_axi_aw_ready_o=~w_channel ? axi_aw_ready_i:0;
//assign axi_aw_ready_i=w_channel ?   s2_axi_aw_ready_o  :s1_axi_aw_ready_o;   
assign axi_aw_valid_o=w_channel ?   s2_axi_aw_valid_i  :s1_axi_aw_valid_i;
assign axi_aw_id_o=0;
assign axi_aw_addr_o=w_channel ?    s2_axi_aw_addr_i   :s1_axi_aw_addr_i;
assign axi_aw_len_o=w_channel ?     s2_axi_aw_len_i    :s1_axi_aw_len_i;
assign axi_aw_size_o=w_channel ?    s2_axi_aw_size_i   :s1_axi_aw_size_i;
assign axi_aw_burst_o=w_channel ?   s2_axi_aw_burst_i  :s1_axi_aw_burst_i;

assign s2_axi_w_ready_o=w_channel ? axi_w_ready_i:0;
assign s1_axi_w_ready_o=~w_channel ? axi_w_ready_i:0;
//assign axi_w_ready_i=w_channel ?    s2_axi_w_ready_o   :s1_axi_w_ready_o;    
assign axi_w_valid_o=w_channel ?    s2_axi_w_valid_i   :s1_axi_w_valid_i;
assign axi_w_data_o=w_channel ?     s2_axi_w_data_i    :s1_axi_w_data_i;
assign axi_w_strb_o=w_channel ?     s2_axi_w_strb_i    :s1_axi_w_strb_i;
assign axi_w_last_o=w_channel ?     s2_axi_w_last_i    :s1_axi_w_last_i;

assign axi_b_ready_o=w_channel ?    s2_axi_b_ready_i   :s1_axi_b_ready_i;    
//assign axi_b_valid_i=w_channel ?    s2_axi_b_valid_o   :s1_axi_b_valid_o;
//assign axi_b_id_i=w_channel ?       s2_axi_b_id_o      :s1_axi_b_id_o;
//assign axi_b_resp_i=w_channel ?     s2_axi_b_resp_o    :s1_axi_b_resp_o;     
assign s2_axi_b_valid_o=w_channel ? axi_b_valid_i:0;
//assign s2_axi_b_id_o=w_channel ? axi_b_id_i:0;
//assign s2_axi_b_resp_o=w_channel ? axi_b_resp_i:0;

assign s1_axi_b_valid_o=~w_channel ? axi_b_valid_i:0;
//assign s1_axi_b_id_o=~w_channel ? axi_b_id_i:0;
//assign s1_axi_b_resp_o=~w_channel ? axi_b_resp_i:0;

assign s2_axi_ar_ready_o=r_channel ? axi_ar_ready_i:0;
assign s1_axi_ar_ready_o=~r_channel ? axi_ar_ready_i:0;
//assign axi_ar_ready_i=r_channel ?   s2_axi_ar_ready_o  :s1_axi_ar_ready_o;   
assign axi_ar_valid_o=r_channel ?   s2_axi_ar_valid_i  :s1_axi_ar_valid_i;
assign axi_ar_id_o=0;
assign axi_ar_addr_o=r_channel ?    s2_axi_ar_addr_i   :s1_axi_ar_addr_i;
assign axi_ar_len_o=r_channel ?     s2_axi_ar_len_i    :s1_axi_ar_len_i;
assign axi_ar_size_o=r_channel ?    s2_axi_ar_size_i   :s1_axi_ar_size_i;
assign axi_ar_burst_o=r_channel ?   s2_axi_ar_burst_i  :s1_axi_ar_burst_i;

assign axi_r_ready_o=r_channel ?    s2_axi_r_ready_i   :s1_axi_r_ready_i;    
//assign axi_r_valid_i=r_channel ?    s2_axi_r_valid_o   :s1_axi_r_valid_o;    
//assign axi_r_id_i=r_channel ?       s2_axi_r_id_o      :s1_axi_r_id_o;
//assign axi_r_resp_i=r_channel ?     s2_axi_r_resp_o    :s1_axi_r_resp_o;
//assign axi_r_data_i=r_channel ?     s2_axi_r_data_o    :s1_axi_r_data_o
//assign axi_r_last_i=r_channel ?     s2_axi_r_last_o    :s1_axi_r_last_o;
assign s2_axi_r_valid_o=r_channel ? axi_r_valid_i:0;
//assign s2_axi_r_id_o=r_channel ? axi_r_id_i:0;
//assign s2_axi_r_resp_o=r_channel ? axi_r_resp_i:0;
assign s2_axi_r_data_o=r_channel ? axi_r_data_i:0;
//assign s2_axi_r_last_o=r_channel ? axi_r_last_i:0;

assign s1_axi_r_valid_o=~r_channel ? axi_r_valid_i:0;
//assign s1_axi_r_id_o=~r_channel ? axi_r_id_i:0;
//assign s1_axi_r_resp_o=~r_channel ? axi_r_resp_i:0;
assign s1_axi_r_data_o=~r_channel ? axi_r_data_i:0;
//assign s1_axi_r_last_o=~r_channel ? axi_r_last_i:0;

localparam RS_IDLE = 1;
localparam RS_S1 = 2;
localparam RS_S2 = 3;
localparam WS_IDLE = 1;
localparam WS_S1 = 2;
localparam WS_S2 = 3;


reg[2:0] rstate;
reg[2:0] next_rstate;

reg[2:0] wstate;
reg[2:0] next_wstate;

    //// ------------------State Machine------------------TODO
    //// 写通道状态切换

always@(posedge clk)begin
  if(rst)wstate<=WS_IDLE;
  else wstate<=next_wstate;
end

always@(*) begin
  if(rst)next_wstate=WS_IDLE;
  else case(wstate)
		WS_IDLE:if(s2_axi_aw_valid_i)next_wstate=WS_S2;
	  else if(s1_axi_aw_valid_i)next_wstate=WS_S1;
    else next_wstate=RS_IDLE;
    WS_S2:if(s2_axi_b_ready_i&axi_b_valid_i)next_wstate=WS_IDLE;
    else next_wstate=WS_S2;
    WS_S1:if(s1_axi_b_ready_i&axi_b_valid_i)next_wstate=WS_IDLE;
    else next_wstate=WS_S1;
    default:next_wstate=WS_IDLE;
  endcase
end
always@(posedge clk)begin
  if(rst)begin
        w_channel<=1;
  end
  else begin
    case(wstate)
      WS_IDLE:if(next_wstate==WS_S1)begin
        w_channel<=0;
      end
      else begin
        w_channel<=1;
      end
      WS_S1:if(next_wstate==WS_IDLE)begin
        w_channel<=1;
      end
      WS_S2:if(next_wstate==WS_IDLE)begin
        w_channel<=1;
      end
    default:begin
    end
    endcase
  end
end
    
    //// 读通道状态切换
always@(posedge clk)begin
`ifdef ysyx_050133_AXIINFOIFU
	$display("rchannel=%d",r_channel);	
	$display("wchannel=%d",w_channel);	
`endif
  if(rst)rstate<=RS_IDLE;
  else rstate<=next_rstate;
end

always@(*) begin
  if(rst)next_rstate=RS_IDLE;
  else case(rstate)
    RS_IDLE:if(s1_axi_ar_valid_i)next_rstate=RS_S1;
		  else if(s2_axi_ar_valid_i)next_rstate=RS_S2;
      else next_rstate=RS_IDLE;
		RS_S1:if(s1_axi_r_ready_i&axi_r_last_i)next_rstate=RS_IDLE;
	    else next_rstate=RS_S1;
		RS_S2:if(s2_axi_r_ready_i&axi_r_last_i)next_rstate=RS_IDLE;
    else next_rstate=RS_S2;
    default:next_rstate=RS_IDLE;
  endcase
end
always@(posedge clk)begin
  if(rst)begin
        r_channel<=0;
  end
  else begin
    case(rstate)
      RS_IDLE:
      if(next_rstate==RS_S2)begin
        r_channel<=1;
      end
      else begin
        r_channel<=0;
      end
      RS_S1:if(next_rstate==RS_IDLE)begin
        r_channel<=0;
      end
      RS_S2:if(next_rstate==RS_IDLE)begin
        r_channel<=0;
      end
      default:begin
      end
    endcase
  end
end
endmodule
module ysyx_050133_axi_master # (
    parameter RW_DATA_WIDTH     = 64,
    parameter RW_ADDR_WIDTH     = 32,
    parameter AXI_DATA_WIDTH    = 64,
    parameter AXI_ADDR_WIDTH    = 32
    //parameter AXI_ID_WIDTH      = 4
)(
    input                               clk,
    input                               rst,

    input                               rw_addr_valid_i,         
    output                              rw_addr_ready_o,     
    input  [RW_ADDR_WIDTH-1:0]          rw_addr_i,    
    input                               rw_we_i,    
    input  [7:0]                        rw_len_i,    
    input  [2:0]                        rw_size_i,    
    input  [1:0]                        rw_burst_i,    
    //input                               rw_if_i,         
    input                               w_data_valid_i,     
    output reg                          w_data_ready_o,     
    input  [RW_DATA_WIDTH-1:0]          w_data_i,  
    output reg                          r_data_valid_o,     
    input                               r_data_ready_i,     
    output [RW_DATA_WIDTH-1:0]          r_data_o,  
    //input                               rw_block_i,
    output                              rw_block_o,

    // Advanced eXtensible Interface
    input                               axi_aw_ready_i,             
    output reg                          axi_aw_valid_o,
    //output     [AXI_ID_WIDTH-1:0]       axi_aw_id_o,
    output reg [AXI_ADDR_WIDTH-1:0]     axi_aw_addr_o,
    output reg [7:0]                    axi_aw_len_o,
    output reg [2:0]                    axi_aw_size_o,
    output reg [1:0]                    axi_aw_burst_o,

    input                               axi_w_ready_i,              
    output reg                          axi_w_valid_o,
    output reg [AXI_DATA_WIDTH-1:0]     axi_w_data_o,
    output reg [AXI_DATA_WIDTH/8-1:0]   axi_w_strb_o,
    output reg                          axi_w_last_o,
    
    output reg                          axi_b_ready_o,          
    input                               axi_b_valid_i,
		//input  [AXI_ID_WIDTH-1:0]           axi_b_id_i,
		//input  [1:0]                        axi_b_resp_i,               

    input                               axi_ar_ready_i,             
    output reg                          axi_ar_valid_o,
    //output     [AXI_ID_WIDTH-1:0]       axi_ar_id_o,
    output reg [AXI_ADDR_WIDTH-1:0]     axi_ar_addr_o,
    output reg [7:0]                    axi_ar_len_o,
    output reg [2:0]                    axi_ar_size_o,
    output reg [1:0]                    axi_ar_burst_o,
    
    output reg                          axi_r_ready_o,          
    input                               axi_r_valid_i,             
    //input  [AXI_ID_WIDTH-1:0]           axi_r_id_i,
    //input  [1:0]                        axi_r_resp_i,
    input  [AXI_DATA_WIDTH-1:0]         axi_r_data_i
    //input                               axi_r_last_i
);
//assign axi_aw_id_o     =0;
//assign axi_ar_id_o     =0;
//assign axi_ar_id_o     =0;

assign rw_block_o=~(~rw_addr_valid_i&rw_addr_ready_o);
//assign rw_block_o=rw_addr_valid_i&~rw_addr_ready_o;
wire [7:0]mask=rw_size_i== `ysyx_050133_AXI_SIZE_BYTES_1 ? 8'h01
              :rw_size_i== `ysyx_050133_AXI_SIZE_BYTES_2 ? 8'h03
              :rw_size_i== `ysyx_050133_AXI_SIZE_BYTES_4 ? 8'h0f
              :rw_size_i== `ysyx_050133_AXI_SIZE_BYTES_8 ? 8'hff
              :8'h00;
wire [63:0]maskb=
  rw_size_i==`ysyx_050133_AXI_SIZE_BYTES_1 ?  64'h00000000000000ff
  :rw_size_i==`ysyx_050133_AXI_SIZE_BYTES_2 ? 64'h000000000000ffff
  :rw_size_i==`ysyx_050133_AXI_SIZE_BYTES_4 ? 64'h00000000ffffffff
  :rw_size_i==`ysyx_050133_AXI_SIZE_BYTES_8 ? 64'hffffffffffffffff
  :64'h0000000000000000;

`ifdef ysyx_050133_FAKEAXI
wire[RW_ADDR_WIDTH-1:0]rw_addr_in=rw_addr_i;
wire[RW_DATA_WIDTH-1:0]r_data=rw_if_i?inst64:din;
wire[RW_DATA_WIDTH-1:0]inst64;
wire[RW_DATA_WIDTH-1:0]din;

wire [5:0]r_shift={rw_addr_i[2:0],3'd0};
wire [RW_DATA_WIDTH-1:0]r_data_i_shift=(r_data>>r_shift)&maskb;

assign    rw_addr_ready_o=1;
always@(*)begin
    w_data_ready_o=1;
    r_data_valid_o=1;
    //$display("if=%d,addr=%h,shift=%d,mask=%h,data=%h",rw_if_i,rw_addr_i,r_shift,maskb,r_data);
end
reg [RW_DATA_WIDTH-1:0]      r_data_o_reg;  
assign r_data_o=r_data_o_reg;

always@(posedge clk)begin
    if(rw_addr_valid_i==1)r_data_o_reg<=r_data_i_shift;
end
wire [RW_ADDR_WIDTH-1:0]instaddr=(rw_addr_valid_i&rw_if_i) ? rw_addr_in:0;
wire [RW_ADDR_WIDTH-1:0]raddr=(rw_addr_valid_i&(~rw_if_i)&(rw_we_i==0)) ? rw_addr_in:0;
wire [RW_ADDR_WIDTH-1:0]waddr=(rw_addr_valid_i&(~rw_if_i)&rw_we_i) ? rw_addr_in:0;

always@(*)begin
          inst_read({32'd0,instaddr},inst64);
end
always@(*)begin
          vmem_read({32'd0,raddr},din);
end
always@(*)begin
        vmem_write({32'd0,waddr},w_data_i,mask);
end
`else

localparam AWS_IDLE = 1;
localparam AWS_AWHS = 2;
localparam AWS_BHS = 3;

localparam WS_IDLE = 1;
localparam WS_WHS = 2;
localparam WS_DHS = 3;
localparam WS_BHS = 4;

localparam RS_IDLE = 1;
localparam RS_ARHS = 2;//address handshake
localparam RS_RHS = 3;//address handshake
localparam RS_DHS = 4;//address handshake


reg r_addr_ready_o;
reg w_addr_ready_o;
assign rw_addr_ready_o=r_addr_ready_o&w_addr_ready_o;
//assign rw_ready_o=r_ready_o;

reg[3:0] rstate;
reg[3:0] next_rstate;

reg[3:0] awstate;
reg[3:0] next_awstate;

reg[3:0] wstate;
reg[3:0] next_wstate;

    //// ------------------State Machine------------------TODO
    //// 写通道状态切换

always@(posedge clk)begin
  if(rst)awstate<=AWS_IDLE;
  else awstate<=next_awstate;
	//$display("rstate=%d wstate=%d awstate=%d",rstate,wstate,awstate);
	//$display("r_addr_ready_o=%d\n",r_addr_ready_o);
end

always@(*) begin
  if(rst)next_awstate=AWS_IDLE;
  else case(awstate)
    AWS_IDLE:if(rw_addr_ready_o&rw_addr_valid_i&rw_we_i)next_awstate=AWS_AWHS;
    else next_awstate=AWS_IDLE;
    AWS_AWHS:if(axi_aw_valid_o&axi_aw_ready_i)next_awstate=AWS_BHS;
    else next_awstate=AWS_AWHS;
    AWS_BHS:if(axi_b_ready_o&axi_b_valid_i)next_awstate=AWS_IDLE;
    else next_awstate=AWS_BHS;
    default:next_awstate=AWS_IDLE;
  endcase
end

always@(posedge clk)begin
  if(rst)begin
          w_addr_ready_o<=1;
          axi_aw_valid_o<=0;
          axi_aw_addr_o<=0;
          axi_aw_len_o<=0;
          axi_aw_size_o<=0;
          axi_aw_burst_o<=0;
  end
  else begin
    case(awstate)
      AWS_IDLE:
        if(next_awstate==AWS_AWHS)begin
          w_addr_ready_o<=0;
          axi_aw_valid_o<=1;
          axi_aw_addr_o<=rw_addr_i;
          axi_aw_len_o<=rw_len_i;
          axi_aw_size_o<=rw_size_i;
          axi_aw_burst_o<=rw_burst_i;
        end
        else begin
          w_addr_ready_o<=1;
        end
      AWS_AWHS:if(next_awstate==AWS_BHS)begin
          axi_aw_valid_o<=0;
      end
      AWS_BHS:if(next_awstate==AWS_IDLE)begin
        w_addr_ready_o<=1;
      end
      default:begin
      end
    endcase
  end
end
    
wire [7:0]strb=mask<<rw_addr_i[2:0];
wire [5:0]w_shift={rw_addr_i[2:0],3'd0};
wire [63:0]w_data_i_shift=w_data_i<<w_shift;
reg [7:0] w_len_cnt;

always@(posedge clk)begin
  if(rst)wstate<=WS_IDLE;
  else wstate<=next_wstate;
end

always@(*) begin
  if(rst)next_wstate=WS_IDLE;
  else case(wstate)
    WS_IDLE:if(w_data_ready_o&w_data_valid_i)next_wstate=WS_WHS;
    else next_wstate=WS_IDLE;
    WS_WHS:if(axi_w_valid_o&axi_w_ready_i)
            if(w_len_cnt==0)next_wstate=WS_BHS;
            else next_wstate=WS_DHS;
    else next_wstate=WS_WHS;
    WS_DHS:if(w_data_ready_o&w_data_valid_i)next_wstate=WS_WHS;
    else next_wstate=WS_BHS;
    WS_BHS:if(axi_b_ready_o&axi_b_valid_i)next_wstate=WS_IDLE;
    else next_wstate=WS_BHS;
    default:next_wstate=WS_IDLE;
  endcase
end
always@(posedge clk)begin
  if(rst)begin
          w_len_cnt<=0;
          w_data_ready_o<=1;
          axi_w_valid_o<=0;
          axi_w_data_o<=0;
          axi_w_strb_o<=0;
          axi_w_last_o<=0;
          axi_b_ready_o<=0;
  end
  else begin
    case(wstate)
      WS_IDLE:if(next_wstate==WS_WHS)begin
          w_len_cnt<=rw_len_i;
          w_data_ready_o<=0;
          axi_w_valid_o<=1;
          axi_w_data_o<=w_data_i_shift;
          axi_w_strb_o<=strb;
          if(rw_len_i==0)axi_w_last_o<=1;
          else axi_w_last_o<=0;
      end
      else begin
          w_data_ready_o<=1;
      end
      WS_WHS:begin
        if(next_wstate==WS_DHS)begin
          axi_w_valid_o<=0;
          w_data_ready_o<=1;
          w_len_cnt<=w_len_cnt-1;
        end
        else if(next_wstate==WS_BHS)begin
          axi_w_valid_o<=0;
          axi_b_ready_o<=1;
        end
      end
      WS_DHS:begin
        if(next_wstate==WS_WHS)begin
          w_data_ready_o<=0;
          axi_w_valid_o<=1;
          axi_w_data_o<=w_data_i_shift;
          axi_w_strb_o<=strb;
          if(rw_len_i==0)axi_w_last_o<=1;
          else axi_w_last_o<=0;
        end
      end
      WS_BHS:if(next_wstate==WS_IDLE)begin
          axi_b_ready_o<=0;
          axi_w_last_o<=0;
      end
    default:begin
    end
    endcase
  end
end
    

    //// 读通道状态切换
reg  [RW_ADDR_WIDTH-1:0] r_addr;        
reg  [7:0]               r_len;        
wire [5:0]r_shift={r_addr[2:0],3'd0};
wire [63:0]axi_r_data_i_shift=(axi_r_data_i>>r_shift)&maskb;

always@(posedge clk)begin
  if(rst)rstate<=RS_IDLE;
  else rstate<=next_rstate;
end

always@(*) begin
  if(rst)next_rstate=RS_IDLE;
  else case(rstate)
    RS_IDLE:if(rw_addr_ready_o&rw_addr_valid_i&(rw_we_i==0))next_rstate=RS_ARHS;
      else next_rstate=RS_IDLE;
    RS_ARHS:if(axi_ar_valid_o&axi_ar_ready_i)next_rstate=RS_RHS;
    else next_rstate=RS_ARHS;
    RS_RHS:if(axi_r_ready_o&axi_r_valid_i)next_rstate=RS_DHS;
    else next_rstate=RS_RHS;
    RS_DHS:if(r_data_valid_o&r_data_ready_i)
             if(r_len==0)next_rstate=RS_IDLE;
             else next_rstate=RS_RHS;
    else next_rstate=RS_DHS;
    default:next_rstate=RS_IDLE;
  endcase
end
reg [RW_DATA_WIDTH-1:0]      r_data_o_reg;  
assign r_data_o=r_data_o_reg;
always@(posedge clk)begin
  if(rst)begin
        r_addr<=0;
        r_len<=0;
        r_addr_ready_o<=1;
        r_data_valid_o<=0;
        r_data_o_reg<=0;
        axi_ar_valid_o<=0;
        axi_ar_addr_o<=0;
        axi_ar_len_o<=0;
        axi_ar_size_o<=0;
        axi_ar_burst_o<=0;
        axi_r_ready_o<=0;
  end
  else begin
    case(rstate)
      RS_IDLE:
      if(next_rstate==RS_ARHS)begin
        r_addr<=rw_addr_i;
        r_len<=rw_len_i;
        r_addr_ready_o<=0;
        axi_ar_valid_o<=1;
        axi_ar_addr_o<=rw_addr_i;
        axi_ar_len_o<=rw_len_i;
        axi_ar_size_o<=rw_size_i;
        axi_ar_burst_o<=rw_burst_i;
      end
      else begin
        r_addr_ready_o<=1;
      end
      RS_ARHS:if(next_rstate==RS_RHS)begin
        axi_ar_valid_o<=0;
        axi_r_ready_o<=1;
      end
      RS_RHS:if(next_rstate==RS_DHS)begin
          axi_r_ready_o<=0;
          r_data_valid_o<=1;
          if(r_len==0)r_addr_ready_o<=1;
          r_data_o_reg<=axi_r_data_i_shift;
      end
      RS_DHS:if(next_rstate==RS_RHS)begin
          r_data_valid_o<=0;
          axi_r_ready_o<=1;
          r_addr<=r_addr+8;
          r_len<=r_len-1;
      end
      else if(next_rstate==RS_IDLE)begin
          r_data_valid_o<=0;
          axi_r_ready_o<=0;
          r_addr_ready_o<=1;
      end
      default:begin
      end
    endcase
  end
end
`endif
endmodule
module ysyx_050133_cache#(
  parameter RW_DATA_WIDTH     = 64,
  parameter RW_ADDR_WIDTH     = 32,
  parameter ADDR_WIDTH=32,
  parameter TAG_WIDTH=21,
  parameter INDEX_WIDTH=5,
  parameter INDEX_DEPTH=32,//$pow(2,INDEX_WIDTH),
  parameter OFFSET_WIDTH=6,
  parameter BURST_LEN=7,//$pow(2,OFFSET_WIDTH)/8-1,
  parameter WAY_DEPTH=2,
  parameter WAY_WIDTH=1,//$clog2(WAY_DEPTH)
  parameter RAM_WIDTH=INDEX_WIDTH+OFFSET_WIDTH-10,
  parameter RAM_DEPTH=2//$pow(2,RAM_WIDTH);
)(
  input clk,
  input rst,

  input                               rw_addr_valid_i,         
  //output reg                          rw_addr_ready_o,     
  input  [RW_ADDR_WIDTH-1:0]          rw_addr_i,    
  input                               rw_we_i,    
  //input  [7:0]                        rw_len_i,    
  input  [2:0]                        rw_size_i,    
  //input  [1:0]                        rw_burst_i,    
  input                               rw_if_i,         
  //input                               w_data_valid_i,     
  //output                              w_data_ready_o,     
  input  [RW_DATA_WIDTH-1:0]          w_data_i,  
  //output reg                          r_data_valid_o,     
  input                               r_data_ready_i,     
  output [RW_DATA_WIDTH-1:0]          r_data_o,         
  input                               rw_block_i,
  output                              rw_block_o,
	input                               fence_i,
	output                              fence_o,

  output[5:0]    io_sram0_addr     ,
  output         io_sram0_cen      ,
  output         io_sram0_wen      ,
  output[127:0]  io_sram0_wmask    ,  
  output[127:0]  io_sram0_wdata    ,  
  input[127:0]   io_sram0_rdata    ,  
  output[5:0]    io_sram1_addr     ,
  output         io_sram1_cen      ,
  output         io_sram1_wen      ,
  output[127:0]  io_sram1_wmask    ,  
  output[127:0]  io_sram1_wdata    ,  
  input[127:0]   io_sram1_rdata    ,  
  output[5:0]    io_sram2_addr     ,
  output         io_sram2_cen      ,
  output         io_sram2_wen      ,
  output[127:0]  io_sram2_wmask    ,  
  output[127:0]  io_sram2_wdata    ,  
  input[127:0]   io_sram2_rdata    ,  
  output[5:0]    io_sram3_addr     ,
  output         io_sram3_cen      ,
  output         io_sram3_wen      ,
  output[127:0]  io_sram3_wmask    ,  
  output[127:0]  io_sram3_wdata    ,  
  input[127:0]   io_sram3_rdata    ,  

  output  reg                         axi_rw_addr_valid_o,       
  input                               axi_rw_addr_ready_i,     
  output  reg[RW_ADDR_WIDTH-1:0]      axi_rw_addr_o,    
  output  reg                         axi_rw_we_o,    
  output  reg[7:0]                    axi_rw_len_o,    
  output  reg[2:0]                    axi_rw_size_o,    
  output  reg[1:0]                    axi_rw_burst_o,    
  //output  reg                         axi_rw_if_o,         
  output  reg                         axi_w_data_valid_o,     
  input                               axi_w_data_ready_i,     
  output     [RW_DATA_WIDTH-1:0]      axi_w_data_o,  
  input                               axi_r_data_valid_i,     
  output  reg                         axi_r_data_ready_o,     
  input  [RW_DATA_WIDTH-1:0]          axi_r_data_i
  //output                              axi_rw_block_o,
  //input                               axi_rw_block_i
);
localparam TAGL=ADDR_WIDTH-1;
localparam TAGR=ADDR_WIDTH-TAG_WIDTH;
localparam INDEXL=TAGR-1;
localparam INDEXR=TAGR-INDEX_WIDTH;
localparam RAML=INDEX_WIDTH+OFFSET_WIDTH-1;
localparam RAMR=10;


localparam S_IDLE =1;
localparam S_FENCE  =2;
localparam S_AW   =3;
localparam S_W    =4;
localparam S_AR   =5;
localparam S_R    =6;
localparam S_R_IDLE    =7;

reg[3:0] state;
reg[3:0] next_state;
`ifdef ysyx_050133_DEBUGINFO
wire [7-INDEX_WIDTH:0]pro_index_0=0;
wire [7-WAY_WIDTH:0]pro_way_0=0;
`endif

//assign w_data_ready_o=1;

reg [RW_ADDR_WIDTH-1:0] addr;
reg [RW_ADDR_WIDTH-1:0] addr0;
reg [2:0] size;
reg [RW_DATA_WIDTH-1:0] w_data;
reg [RW_DATA_WIDTH-1:0] w_data0;
reg [INDEX_WIDTH-1:0]index;
reg [WAY_WIDTH-1:0]waynum;
reg [WAY_WIDTH-1:0]random;

reg [TAG_WIDTH-1:0] tag[WAY_DEPTH-1:0][INDEX_DEPTH-1:0];
reg valid[WAY_DEPTH-1:0][INDEX_DEPTH-1:0];
reg dirty[WAY_DEPTH-1:0][INDEX_DEPTH-1:0];

reg fence;
reg [INDEX_WIDTH+1:0]fence_cnt;

wire[TAG_WIDTH-1:0] tag_in=rw_addr_i[TAGL:TAGR];
wire[INDEX_WIDTH-1:0] index_in=rw_addr_i[INDEXL:INDEXR];
wire[OFFSET_WIDTH-1:0] OFFSET0=0;
wire[WAY_DEPTH-1:0]hit_wayflag;
wire[WAY_WIDTH-1:0]hit_waynum_in=hit_wayflag==2'b01 ? 0
                          :hit_wayflag==2'b10 ? 1
                          :0;
always@(posedge clk)begin
  if(rst)random<=0;
  else random<=random+1;
end

wire hit_flag=state==S_IDLE;
wire [127:0]RAM_Q[WAY_DEPTH-1:0][RAM_DEPTH-1:0];
wire RAM_CEN=0;
reg RAM_WEN_REG[WAY_DEPTH-1:0][RAM_DEPTH-1:0];
wire RAM_WEN[WAY_DEPTH-1:0][RAM_DEPTH-1:0];
wire [RW_DATA_WIDTH-1:0]maskb=
  ~hit_flag ? 64'hffffffffffffffff
  :size==`ysyx_050133_AXI_SIZE_BYTES_1 ? 64'h00000000000000ff
  :size==`ysyx_050133_AXI_SIZE_BYTES_2 ? 64'h000000000000ffff
  :size==`ysyx_050133_AXI_SIZE_BYTES_4 ? 64'h00000000ffffffff
  :size==`ysyx_050133_AXI_SIZE_BYTES_8 ? 64'hffffffffffffffff
  :64'h0000000000000000;
wire [RW_DATA_WIDTH-1:0]maskb_i=
  ~hit_flag ? 64'hffffffffffffffff
  :rw_size_i==`ysyx_050133_AXI_SIZE_BYTES_1 ? 64'h00000000000000ff
  :rw_size_i==`ysyx_050133_AXI_SIZE_BYTES_2 ? 64'h000000000000ffff
  :rw_size_i==`ysyx_050133_AXI_SIZE_BYTES_4 ? 64'h00000000ffffffff
  :rw_size_i==`ysyx_050133_AXI_SIZE_BYTES_8 ? 64'hffffffffffffffff
  :64'h0000000000000000;
wire [6:0]shift={addr[3:0],3'd0};
wire [6:0]shift_i={rw_addr_i[3:0],3'd0};
wire [127:0]RAM_BWEN=hit_flag? ~({64'd0,maskb_i}<<shift_i):~({64'd0,maskb}<<shift);
wire [5:0] RAM_A=hit_flag ? rw_addr_i[9:4]:addr[9:4];
wire [127:0]RAM_D=hit_flag ? {64'd0,w_data_i}<<shift_i:{64'd0,w_data}<<shift;
wire [RAM_WIDTH-1:0]RAM_N_in=rw_addr_i[RAML:RAMR];
wire [RAM_WIDTH-1:0]RAM_N=addr[RAML:RAMR];


generate
  genvar i;
  genvar j;
  for(i=0;i<WAY_DEPTH;i=i+1)begin
  assign hit_wayflag[i]=((tag[i][index_in]==tag_in)&&valid[i][index_in]);
    for(j=0;j<RAM_DEPTH;j=j+1)begin
      assign RAM_WEN[i][j]=|hit_wayflag ? ~((hit_waynum_in==i)&&(RAM_N_in==j)&&(rw_we_i)):RAM_WEN_REG[i][j];
    end
  end
endgenerate

assign io_sram0_addr    =RAM_A ;
assign io_sram0_cen     =RAM_CEN;
assign io_sram0_wen     =RAM_WEN[0][0];
assign io_sram0_wmask   =RAM_BWEN ;  
assign io_sram0_wdata   =RAM_D ;  
assign RAM_Q[0][0]      =io_sram0_rdata;  
assign io_sram1_addr    =RAM_A ;
assign io_sram1_cen     =RAM_CEN;
assign io_sram1_wen     =RAM_WEN[0][1];
assign io_sram1_wmask   =RAM_BWEN ;  
assign io_sram1_wdata   =RAM_D ;  
assign RAM_Q[0][1]      =io_sram1_rdata;  
assign io_sram2_addr    =RAM_A ;
assign io_sram2_cen     =RAM_CEN;
assign io_sram2_wen     =RAM_WEN[1][0];
assign io_sram2_wmask   =RAM_BWEN ;  
assign io_sram2_wdata   =RAM_D ;  
assign RAM_Q[1][0]      =io_sram2_rdata;  
assign io_sram3_addr    =RAM_A ;
assign io_sram3_cen     =RAM_CEN;
assign io_sram3_wen     =RAM_WEN[1][1];
assign io_sram3_wmask   =RAM_BWEN ;  
assign io_sram3_wdata   =RAM_D ;  
assign RAM_Q[1][1]      =io_sram3_rdata;  

wire[127:0]data_o=RAM_Q[waynum][RAM_N]>>shift;
assign r_data_o=data_o[RW_DATA_WIDTH-1:0]&maskb;
assign axi_w_data_o=data_o[RW_DATA_WIDTH-1:0]&maskb;



always@(posedge clk)begin
  if(rst)state<=S_IDLE;
  else state<=next_state;
end

assign rw_block_o=(r_data_ready_i&~(|hit_wayflag))|fence;
//assign axi_rw_block_o=0;
assign fence_o=fence;


always@(*) begin
  if(rst)next_state=S_IDLE;
  else case(state)
		S_IDLE:if(fence_i)begin
				if(rw_if_i)next_state=S_IDLE;
				else next_state=S_FENCE;
			  end
				//else if(rw_addr_valid_i&rw_addr_ready_o)begin
	      else if(rw_addr_valid_i)begin
            if(|hit_wayflag)next_state=S_IDLE;
            else if(dirty[random][index_in])next_state=S_AW;
            else next_state=S_AR;
          end
        else next_state=S_IDLE;
    S_AW:if(axi_rw_addr_valid_o&axi_rw_addr_ready_i)next_state=S_W;
      else next_state=S_AW;
			S_W:if(axi_w_data_ready_i&axi_w_data_valid_o&(axi_rw_len_o==0))begin
				if(fence)next_state=S_FENCE;
				else next_state=S_AR;
			end
      else next_state=S_W;
    S_AR:if(axi_rw_addr_valid_o&axi_rw_addr_ready_i)next_state=S_R;
      else next_state=S_AR;
			S_R:if(axi_r_data_ready_o==0&(axi_rw_len_o==0))begin
				if(rw_if_i)next_state=S_IDLE;
				else next_state=S_R_IDLE;
			end
      else next_state=S_R;
		S_R_IDLE:next_state=S_IDLE;
		S_FENCE:if(dirty[fence_cnt[5]][fence_cnt[4:0]])next_state=S_AW;
			else if(fence_cnt[6])next_state=S_IDLE;
			else next_state=S_FENCE;
    default:next_state=S_IDLE;
  endcase
end
  integer m;
  integer n;
  integer p;
  integer fencea;
  integer fenceb;
always@(posedge clk)begin
  if(rst)begin
    //rw_addr_ready_o<=1;
    //r_data_valid_o<=0;
    axi_rw_addr_valid_o<=0;
    axi_rw_addr_o<=0;
    axi_rw_we_o<=0;
    axi_rw_len_o<=0;
    axi_rw_size_o<=0;
    axi_rw_burst_o<=0;
    //axi_rw_if_o<=0;
    axi_w_data_valid_o<=0;
    axi_r_data_ready_o<=0;
    waynum<=0;
    index<=0;
    addr<=0;
    addr0<=0;
    size<=0;
    w_data<=0;
    w_data0<=0;
		fence<=0;
		fence_cnt<=0;
  for(m=0;m<WAY_DEPTH;m=m+1)begin
    for(n=0;n<RAM_DEPTH;n=n+1)begin
        RAM_WEN_REG[m][n]<=1;
    end
    for(p=0;p<INDEX_DEPTH;p=p+1)begin
        tag[m][p]<=0;
        dirty[m][p]<=0;
        valid[m][p]<=0;
    end
  end
  end
  else begin
    case(state)
      S_IDLE:
				if(fence_i)begin
					if(rw_if_i)begin
						for(fencea=0;fencea<WAY_DEPTH;fencea=fencea+1)begin
							for(fenceb=0;fenceb<INDEX_DEPTH;fenceb=fenceb+1)begin
									valid[fencea][fenceb]<=0;
							end
						end
					end
					else begin
					fence<=1;
					fence_cnt<=0;
				  end
        end
        else if(|hit_wayflag)begin
				if(~rw_if_i|~rw_block_i)begin
				//if(~rw_block_i)begin
        //begin
          waynum<=hit_waynum_in;
          addr<=rw_addr_i;
          size<=rw_size_i;
          if(rw_we_i)dirty[hit_waynum_in][index_in]<=1;
          `ifdef ysyx_050133_DEBUGINFO
          `ifdef ysyx_050133_MULTICYCLE
            //if(addr!=rw_addr_i)begin
            begin
              cache_profiling({31'd0,rw_if_i},{31'd0,rw_we_i},32'd1,32'd0);
								if(rw_if_i==0)begin
									if(rw_we_i)cache_rw({32'd0,rw_addr_i},w_data_i,{5'd0,rw_size_i},{7'd0,rw_we_i},{pro_way_0,hit_waynum_in},{pro_index_0,index_in});
									else if(r_data_ready_i)cache_rw({32'd0,rw_addr_i},r_data_o,{5'd0,rw_size_i},{7'd0,rw_we_i},{pro_way_0,hit_waynum_in},{pro_index_0,index_in});
								end
            end
          `else
            begin
							cache_profiling({31'd0,rw_if_i},{31'd0,rw_we_i},32'd1,32'd0);
								if(rw_if_i==0)begin
									if(rw_we_i)cache_rw({32'd0,rw_addr_i},w_data_i,{5'd0,rw_size_i},{7'd0,rw_we_i},{pro_way_0,hit_waynum_in},{pro_index_0,index_in});
									else if(r_data_ready_i)cache_rw({32'd0,rw_addr_i},r_data_o,{5'd0,rw_size_i},{7'd0,rw_we_i},{pro_way_0,hit_waynum_in},{pro_index_0,index_in});
								end
				   end
          `endif
          `endif
        end
				end
        else if(next_state==S_AW)begin
          //rw_addr_ready_o<=0;
          waynum<=random;
          index<=index_in;
          addr<={tag[random][index_in],index_in,OFFSET0};
          addr0<=rw_addr_i;
          size<=rw_size_i;
          w_data<=w_data_i;
          w_data0<=w_data_i;

          axi_rw_addr_valid_o<=1;
          axi_rw_addr_o<={tag[random][index_in],index_in,OFFSET0};
          axi_rw_we_o<=1;
          axi_rw_len_o<=BURST_LEN;
          axi_rw_size_o<=`ysyx_050133_AXI_SIZE_BYTES_8;
          axi_rw_burst_o<=`ysyx_050133_AXI_BURST_TYPE_INCR;
          //axi_rw_if_o<=rw_if_i;
          `ifdef ysyx_050133_DEBUGINFO
					cache_profiling({31'd0,rw_if_i},{31'd0,rw_we_i},32'd0,32'd1);
          if(rw_if_i==0)cache_rw({32'd0,{tag[random][index_in],index_in,OFFSET0}},64'd0,8'd5,8'd1,{pro_way_0,random},{pro_index_0,index_in});
          `endif
        end
        else if(next_state==S_AR)begin
          //rw_addr_ready_o<=0;
          waynum<=random;
          index<=index_in;
          addr<={rw_addr_i[TAGL:INDEXR],OFFSET0};
          addr0<=rw_addr_i;
          size<=rw_size_i;
          w_data<=w_data_i;
          w_data0<=w_data_i;
          valid[random][index_in]<=0;
          tag[random][index_in]<=rw_addr_i[TAGL:TAGR];

          axi_rw_addr_valid_o<=1;
          axi_rw_addr_o<={rw_addr_i[TAGL:INDEXR],OFFSET0};
          axi_rw_we_o<=0;
          axi_rw_len_o<=BURST_LEN;
          axi_rw_size_o<=`ysyx_050133_AXI_SIZE_BYTES_8;
          axi_rw_burst_o<=`ysyx_050133_AXI_BURST_TYPE_INCR;
          //axi_rw_if_o<=rw_if_i;
          `ifdef ysyx_050133_DEBUGINFO
					cache_profiling({31'd0,rw_if_i},{31'd0,rw_we_i},32'd0,32'd0);
          if(rw_if_i==0)cache_rw({32'd0,{rw_addr_i[TAGL:INDEXR],OFFSET0}},64'd0,8'd5,8'd0,{pro_way_0,random},{pro_index_0,index_in});
          `endif
        end
        else begin
          //rw_addr_ready_o<=1;
          //r_data_valid_o<=0;
          axi_rw_addr_valid_o<=0;
          axi_w_data_valid_o<=0;
          axi_r_data_ready_o<=0;
        end
      S_AW:if(next_state==S_W)begin
          axi_rw_addr_valid_o<=0;
          axi_w_data_valid_o<=1;
        end
      S_W:begin
        if(axi_w_data_valid_o&axi_w_data_ready_i)begin
          if(axi_rw_len_o==0)begin
						if(fence)begin
              dirty[waynum][index]<=0;
						  fence_cnt<=fence_cnt+1;
              axi_rw_addr_valid_o<=0;
              axi_rw_we_o<=0;
              axi_w_data_valid_o<=0;
						end
						else begin
            dirty[waynum][index]<=0;
            valid[waynum][index]<=0;
            tag[waynum][index]<=addr0[TAGL:TAGR];
            addr<={addr0[TAGL:INDEXR],OFFSET0};
            axi_rw_addr_valid_o<=1;
            axi_rw_addr_o<={addr0[TAGL:INDEXR],OFFSET0};
            axi_rw_we_o<=0;
            axi_rw_len_o<=BURST_LEN;
            axi_rw_size_o<=`ysyx_050133_AXI_SIZE_BYTES_8;
            axi_rw_burst_o<=`ysyx_050133_AXI_BURST_TYPE_INCR;
            //axi_rw_if_o<=rw_if_i;
            axi_w_data_valid_o<=0;
            axi_r_data_ready_o<=1;
          `ifdef ysyx_050133_DEBUGINFO
            if(rw_if_i==0)cache_rw({32'd0,{addr0[TAGL:INDEXR],OFFSET0}},64'd0,8'd5,8'd0,{pro_way_0,waynum},{pro_index_0,index});
          `endif
				    end
          end
          else begin
            addr<=addr+8;
            axi_w_data_valid_o<=0;
            axi_rw_len_o<=axi_rw_len_o-1;
          end
        end
        else begin
          //axi_rw_addr_o<=axi_rw_addr_o+8;
          axi_w_data_valid_o<=1;
        end
      end
      S_AR:if(next_state==S_R)begin
            axi_rw_addr_valid_o<=0;
            axi_r_data_ready_o<=1;
          end
      S_R:if(axi_r_data_valid_i&axi_r_data_ready_o)begin
              RAM_WEN_REG[waynum][RAM_N]<=0;
              w_data<=axi_r_data_i;
              axi_r_data_ready_o<=0;
          end
          else if(next_state==S_R_IDLE)begin
              //rw_addr_ready_o<=1;
              //valid[waynum][index]<=1;
              RAM_WEN_REG[waynum][RAM_N]<=1;
              w_data<=w_data0;
              addr<=addr0;
              //r_data_valid_o<=0;
            end
          else if(next_state==S_IDLE)begin
              //rw_addr_ready_o<=1;
							valid[waynum][index]<=1;
              RAM_WEN_REG[waynum][RAM_N]<=1;
              w_data<=w_data0;
              addr<=addr0;
              //r_data_valid_o<=0;
            end
          else if(axi_r_data_ready_o==0)begin
            axi_rw_len_o<=axi_rw_len_o-1;
            RAM_WEN_REG[waynum][RAM_N]<=1;
            addr<=addr+8;
            axi_r_data_ready_o<=1;
          end
			S_R_IDLE:begin
              valid[waynum][index]<=1;
			end
			S_FENCE:if(next_state==S_AW)begin
          waynum<=fence_cnt[5];
          index<=fence_cnt[4:0];
          addr<={tag[fence_cnt[5]][fence_cnt[4:0]],fence_cnt[4:0],OFFSET0};
          axi_rw_addr_valid_o<=1;
          axi_rw_addr_o<={tag[fence_cnt[5]][fence_cnt[4:0]],fence_cnt[4:0],OFFSET0};
          axi_rw_we_o<=1;
          axi_rw_len_o<=BURST_LEN;
          axi_rw_size_o<=`ysyx_050133_AXI_SIZE_BYTES_8;
          axi_rw_burst_o<=`ysyx_050133_AXI_BURST_TYPE_INCR;
          //axi_rw_if_o<=rw_if_i;
					end
					else if(next_state==S_IDLE)begin
						fence<=0;
					end
					else begin
						fence_cnt<=fence_cnt+1;
					end
      default:begin
      end
    endcase
  end
end

`ifdef ysyx_050133_ICACHEINFO
always@(posedge clk)begin
  if(rw_if_i)begin
  //if(~rw_if_i&&(rw_addr_i>=32'h81ce8080)&&(rw_addr_i<32'h81ce8082))begin
  $display("ICACHE:  state=%d fencei=%d fenceo=%d\
  addr_in   = %h , addr  = %h ,addr0    = %h, \
  w_data_in = %h ,w_data = %h , w_data0 = %h ,\
  tag_in    = %h , tag   = %h, hit_wayflag=%d,\
  index_in  = %d , index = %d, hit_waynum_in=%d,waynum=%d,\
  RAM_N_in  =%d    ,RAM_N= %d\
  RAM_A=%d,\
  RAM_Q=%h,\
  RAM_Q_last=%h,\
  RAM_D=%h,\
  RAM_BWEN=%h,RAM_WEN=%d\
a_rw_addr_valid_o=%d, rw_addr_ready_i=%d ,rw_addr_o=%h,\
  rw_we_o=%d,rw_len_o=%d,rw_size_o=%d,rw_burst_o=%d,\
  w_data_valid_o=%d,w_data_ready_i=%d,w_data_o=%h\
  r_data_valid_i=%d,r_data_ready_o=%d,r_data_i=%h\
"
	,state,fence_i,fence_o,
  ,rw_addr_i,addr,addr0,
    w_data_i,w_data,w_data0,
    tag_in,tag[hit_waynum_in][index_in],hit_wayflag,
    index_in,index,hit_waynum_in,waynum,
		RAM_N_in,RAM_N,
    RAM_A,RAM_Q[hit_waynum_in][RAM_N_in],RAM_Q[waynum][RAM_N],RAM_D,
    RAM_BWEN,RAM_WEN[hit_waynum_in][RAM_N_in],
    axi_rw_addr_valid_o,axi_rw_addr_ready_i,axi_rw_addr_o,
    axi_rw_we_o,axi_rw_len_o,axi_rw_size_o,axi_rw_burst_o,
    axi_w_data_valid_o,axi_w_data_ready_i,axi_w_data_o,
    axi_r_data_valid_i,axi_r_data_ready_o,axi_r_data_i
  );
  end
end
`endif
`ifdef ysyx_050133_MCACHEINFO
always@(posedge clk)begin
  //if(~rw_if_i&&(rw_addr_i>=32'h81ce8080)&&(rw_addr_i<32'h81ce8082))begin
	//if(~rw_if_i)begin
  //$display("MCACHE:  state=%d fencei=%d fenceo=%d\
  //addr_in   = %h , addr  = %h ,addr0    = %h, \
  //w_data_in = %h ,w_data = %h , w_data0 = %h ,\
  //tag_in    = %h , tag   = %h, hit_wayflag=%d,\
  //index_in  = %d , index = %d, hit_waynum_in=%d,waynum=%d,\
  //RAM_N_in  =%d    ,RAM_N= %d\
  //RAM_A=%d,\
  //RAM_Q=%h,\
  //RAM_Q_last=%h,\
  //RAM_D=%h,\
  //RAM_BWEN=%h,RAM_WEN=%d\
//a_rw_addr_valid_o=%d, rw_addr_ready_i=%d ,rw_addr_o=%h,\
  //rw_we_o=%d,rw_len_o=%d,rw_size_o=%d,rw_burst_o=%d,\
  //w_data_valid_o=%d,w_data_ready_i=%d,w_data_o=%h\
  //r_data_valid_i=%d,r_data_ready_o=%d,r_data_i=%h\
//"
	//,state,fence_i,fence_o,
  //,rw_addr_i,addr,addr0,
    //w_data_i,w_data,w_data0,
    //tag_in,tag[hit_waynum_in][index_in],hit_wayflag,
    //index_in,index,hit_waynum_in,waynum,
		//RAM_N_in,RAM_N,
    //RAM_A,RAM_Q[hit_waynum_in][RAM_N_in],RAM_Q[waynum][RAM_N],RAM_D,
    //RAM_BWEN,RAM_WEN[hit_waynum_in][RAM_N_in],
    //axi_rw_addr_valid_o,axi_rw_addr_ready_i,axi_rw_addr_o,
    //axi_rw_we_o,axi_rw_len_o,axi_rw_size_o,axi_rw_burst_o,
    //axi_w_data_valid_o,axi_w_data_ready_i,axi_w_data_o,
    //axi_r_data_valid_i,axi_r_data_ready_o,axi_r_data_i
  //);
  //end
	if(rw_if_i)begin
  $display("ICACHE:  state=%h fencei=%h fenceo=%h",state,fence_i,fence_o,);
  $display("\
  addr_in   = %h , addr  = %h ,addr0    = %h, "
  ,rw_addr_i,addr,addr0,
  );
  $display("\
a_rw_addr_valid_o=%d, rw_addr_ready_i=%d ,rw_addr_o=%h,\
  rw_we_o=%d,rw_len_o=%d,rw_size_o=%d,rw_burst_o=%d,\
  w_data_valid_o=%d,w_data_ready_i=%d,w_data_o=%h\
  r_data_valid_i=%d,r_data_ready_o=%d,r_data_i=%h\
",
    axi_rw_addr_valid_o,axi_rw_addr_ready_i,axi_rw_addr_o,
    axi_rw_we_o,axi_rw_len_o,axi_rw_size_o,axi_rw_burst_o,
    axi_w_data_valid_o,axi_w_data_ready_i,axi_w_data_o,
    axi_r_data_valid_i,axi_r_data_ready_o,axi_r_data_i
  );
  end
	if(~rw_if_i)begin
  $display("MCACHE:  state=%h fencei=%h fenceo=%h",state,fence_i,fence_o,);
  $display("\
  addr_in   = %h , addr  = %h ,addr0    = %h, "
  ,rw_addr_i,addr,addr0,
  );
  $display("\
a_rw_addr_valid_o=%d, rw_addr_ready_i=%d ,rw_addr_o=%h,\
  rw_we_o=%d,rw_len_o=%d,rw_size_o=%d,rw_burst_o=%d,\
  w_data_valid_o=%d,w_data_ready_i=%d,w_data_o=%h\
  r_data_valid_i=%d,r_data_ready_o=%d,r_data_i=%h\
",
    axi_rw_addr_valid_o,axi_rw_addr_ready_i,axi_rw_addr_o,
    axi_rw_we_o,axi_rw_len_o,axi_rw_size_o,axi_rw_burst_o,
    axi_w_data_valid_o,axi_w_data_ready_i,axi_w_data_o,
    axi_r_data_valid_i,axi_r_data_ready_o,axi_r_data_i
  );
  end
end
`endif
endmodule
module ysyx_050133_crossbar # (
    parameter RW_DATA_WIDTH     = 64,
    parameter RW_ADDR_WIDTH     = 32,
    parameter AXI_DATA_WIDTH    = 64,
    parameter AXI_ADDR_WIDTH    = 32
    //parameter AXI_ID_WIDTH      = 4
)(
    input                               clk,
    input                               rst,

    input                               rw_addr_valid_i,         
    //output                              rw_addr_ready_o,     
    input  [RW_ADDR_WIDTH-1:0]          rw_addr_i      ,
    input                               rw_we_i        ,
    input  [7:0]                        rw_len_i       ,
    input  [2:0]                        rw_size_i      ,
    input  [1:0]                        rw_burst_i     ,
    input                               rw_if_i        ,
    input                               w_data_valid_i ,    
    //output                              w_data_ready_o ,    
    input  [RW_DATA_WIDTH-1:0]          w_data_i       ,
    //output                              r_data_valid_o ,    
    input                               r_data_ready_i ,    
    output [RW_DATA_WIDTH-1:0]          r_data_o       ,
		input                               rw_block_i     ,
		output                              rw_block_o     ,
		input                               fence_i        ,
	  output                              fence_o        ,
    output[5:0]    io_sram0_addr     ,
    output         io_sram0_cen      ,
    output         io_sram0_wen      ,
    output[127:0]  io_sram0_wmask    ,  
    output[127:0]  io_sram0_wdata    ,  
    input[127:0]   io_sram0_rdata    ,  
    output[5:0]    io_sram1_addr     ,
    output         io_sram1_cen      ,
    output         io_sram1_wen      ,
    output[127:0]  io_sram1_wmask    ,  
    output[127:0]  io_sram1_wdata    ,  
    input[127:0]   io_sram1_rdata    ,  
    output[5:0]    io_sram2_addr     ,
    output         io_sram2_cen      ,
    output         io_sram2_wen      ,
    output[127:0]  io_sram2_wmask    ,  
    output[127:0]  io_sram2_wdata    ,  
    input[127:0]   io_sram2_rdata    ,  
    output[5:0]    io_sram3_addr     ,
    output         io_sram3_cen      ,
    output         io_sram3_wen      ,
    output[127:0]  io_sram3_wmask    ,  
    output[127:0]  io_sram3_wdata    ,  
    input[127:0]   io_sram3_rdata    ,  

    // Advanced eXtensible Interface
    input                               axi_aw_ready_i,             
    output                              axi_aw_valid_o,
		//output     [AXI_ID_WIDTH-1:0]       axi_aw_id_o,
    output     [AXI_ADDR_WIDTH-1:0]     axi_aw_addr_o,
    output     [7:0]                    axi_aw_len_o,
    output     [2:0]                    axi_aw_size_o,
    output     [1:0]                    axi_aw_burst_o,

    input                               axi_w_ready_i,              
    output                              axi_w_valid_o,
    output     [AXI_DATA_WIDTH-1:0]     axi_w_data_o,
    output     [AXI_DATA_WIDTH/8-1:0]   axi_w_strb_o,
    output                              axi_w_last_o,
    
    output                              axi_b_ready_o,          
    input                               axi_b_valid_i,
		//input  [AXI_ID_WIDTH-1:0]           axi_b_id_i,
    //input  [1:0]                        axi_b_resp_i,               

    input                               axi_ar_ready_i,             
    output                              axi_ar_valid_o,
		//output     [AXI_ID_WIDTH-1:0]       axi_ar_id_o,
    output     [AXI_ADDR_WIDTH-1:0]     axi_ar_addr_o,
    output     [7:0]                    axi_ar_len_o,
    output     [2:0]                    axi_ar_size_o,
    output     [1:0]                    axi_ar_burst_o,
    
    output                              axi_r_ready_o,          
    input                               axi_r_valid_i,             
		//input  [AXI_ID_WIDTH-1:0]           axi_r_id_i,
    //input  [1:0]                        axi_r_resp_i,
    input  [AXI_DATA_WIDTH-1:0]         axi_r_data_i
    //input                               axi_r_last_i
);
`ifdef ysyx_050133_NOCACHE
	wire uncache=1;
`else
wire uncache=fence_o ? 0:((rw_addr_i<32'h80000000)) ?  1:0;
//wire uncache=0;
`endif
reg uncache_reg;
always@(posedge clk)begin
	if(rst)uncache_reg<=0;
	else uncache_reg<=uncache;
end

wire                     cachei_rw_addr_valid_i;       
//wire                     cachei_rw_addr_ready_o;        
wire [RW_ADDR_WIDTH-1:0] cachei_rw_addr_i      ;       
wire                     cachei_rw_we_i        ;       
//wire [7:0]               cachei_rw_len_i       ;       
wire [2:0]               cachei_rw_size_i      ;       
//wire [1:0]               cachei_rw_burst_i     ;       
wire                     cachei_rw_if_i        ;        
//wire                     cachei_w_data_valid_i ;        
//wire                     cachei_w_data_ready_o ;        
wire [RW_DATA_WIDTH-1:0] cachei_w_data_i       ;       
//wire                     cachei_r_data_valid_o;        
wire                     cachei_r_data_ready_i ;        
wire [RW_DATA_WIDTH-1:0] cachei_r_data_o       ;       
wire                     cachei_rw_block_i     ;       
wire                     cachei_rw_block_o     ;       

wire                     cacheo_rw_addr_valid_o;      
wire                     cacheo_rw_addr_ready_i;    
wire [RW_ADDR_WIDTH-1:0] cacheo_rw_addr_o      ;
wire                     cacheo_rw_we_o        ;
wire [7:0]               cacheo_rw_len_o       ;
wire [2:0]               cacheo_rw_size_o      ;
wire [1:0]               cacheo_rw_burst_o     ;
//wire                     cacheo_rw_if_o        ;
wire                     cacheo_w_data_valid_o ;  
wire                     cacheo_w_data_ready_i ;   
wire [RW_DATA_WIDTH-1:0] cacheo_w_data_o       ;
wire                     cacheo_r_data_valid_i ;   
wire                     cacheo_r_data_ready_o ;   
wire [RW_DATA_WIDTH-1:0] cacheo_r_data_i       ;
//wire                     cacheo_rw_block_i     ;       
//wire                     cacheo_rw_block_o     ;       

wire                     axii_rw_addr_valid_i;       
wire                     axii_rw_addr_ready_o;        
wire [RW_ADDR_WIDTH-1:0] axii_rw_addr_i      ;       
wire                     axii_rw_we_i        ;       
wire [7:0]               axii_rw_len_i       ;       
wire [2:0]               axii_rw_size_i      ;       
wire [1:0]               axii_rw_burst_i     ;       
//wire                     axii_rw_if_i        ;        
wire                     axii_w_data_valid_i ;        
wire                     axii_w_data_ready_o ;        
wire [RW_DATA_WIDTH-1:0] axii_w_data_i       ;       
wire                     axii_r_data_valid_o;        
wire                     axii_r_data_ready_i ;        
wire [RW_DATA_WIDTH-1:0] axii_r_data_o       ;       
//wire                     axii_rw_block_i     ;       
wire                     axii_rw_block_o     ;       

//assign                      rw_addr_valid_i =uncache ? axii_rw_addr_valid_i:cachei_rw_addr_valid_i;         
//assign                      rw_addr_ready_o =uncache ? axii_rw_addr_ready_o:cachei_rw_addr_ready_o;     
//assign [RW_ADDR_WIDTH-1:0]  rw_addr_i       =uncache ? axii_rw_addr_i      :cachei_rw_addr_i      ;
//assign                      rw_we_i         =uncache ? axii_rw_we_i        :cachei_rw_we_i        ;
//assign [7:0]                rw_len_i        =uncache ? axii_rw_len_i       :cachei_rw_len_i       ;
//assign [2:0]                rw_size_i       =uncache ? axii_rw_size_i      :cachei_rw_size_i      ;
//assign [1:0]                rw_burst_i      =uncache ? axii_rw_burst_i     :cachei_rw_burst_i     ;
//assign                      rw_if_i         =uncache ? axii_rw_if_i        :cachei_rw_if_i        ; 
//assign                      w_data_valid_i  =uncache ? axii_w_data_valid_i :cachei_w_data_valid_i ;    
//assign                      w_data_ready_o  =uncache ? axii_w_data_ready_o :cachei_w_data_ready_o ;    
//assign [RW_DATA_WIDTH-1:0]  w_data_i        =uncache ? axii_w_data_i       :cachei_w_data_i       ;
//assign                      r_data_valid_o  =uncache ? axii_r_data_valid_o:cachei_r_data_valid_o;    
//assign                      r_data_ready_i  =uncache ? axii_r_data_ready_i :cachei_r_data_ready_i ;    
assign                      r_data_o        =uncache_reg ? axii_r_data_o       :cachei_r_data_o       ;
assign                      rw_block_o      =uncache ? axii_rw_block_o     :cachei_rw_block_o     ;


assign                     cachei_rw_addr_valid_i=uncache ? 0:rw_addr_valid_i   ;       
//assign                     cachei_rw_addr_ready_o=uncache ? 0:rw_addr_ready_o   ;        
assign                     cachei_rw_addr_i      =uncache ? 0:rw_addr_i         ;       
assign                     cachei_rw_we_i        =uncache ? 0:rw_we_i           ;       
//assign                     cachei_rw_len_i       =uncache ? 0:rw_len_i          ;       
assign                     cachei_rw_size_i      =uncache ? 0:rw_size_i         ;       
//assign                     cachei_rw_burst_i     =uncache ? 0:rw_burst_i        ;       
//assign                     cachei_rw_if_i        =uncache ? 0:rw_if_i           ;        
assign                     cachei_rw_if_i        =rw_if_i           ;        
//assign                     cachei_w_data_valid_i =uncache ? 0:w_data_valid_i    ;        
//assign                     cachei_w_data_ready_o =uncache ? 0:w_data_ready_o    ;        
assign                     cachei_w_data_i       =uncache ? 0:w_data_i          ;       
//assign                     cachei_r_data_valid_o=uncache ? 0:r_data_valid_o   ;        
assign                     cachei_r_data_ready_i =uncache ? 0:r_data_ready_i    ;        
//assign [RW_DATA_WIDTH-1:0] cachei_r_data_o       =uncache ? 0:r_data_o          ;       
assign                     cachei_rw_block_i     =uncache ? 0:rw_block_i        ;       


//assign                     cacheo_rw_addr_valid_o =uncache ? 0:axii_rw_addr_valid_i;       
assign                     cacheo_rw_addr_ready_i =uncache ? 0:axii_rw_addr_ready_o;     
//assign [RW_ADDR_WIDTH-1:0] cacheo_rw_addr_o       =uncache ? 0:axii_rw_addr_i      ;
//assign                     cacheo_rw_we_o         =uncache ? 0:axii_rw_we_i        ;
//assign [7:0]               cacheo_rw_len_o        =uncache ? 0:axii_rw_len_i       ;
//assign [2:0]               cacheo_rw_size_o       =uncache ? 0:axii_rw_size_i      ;
//assign [1:0]               cacheo_rw_burst_o      =uncache ? 0:axii_rw_burst_i     ;
//assign                     cacheo_rw_if_o         =uncache ? 0:axii_rw_if_i        ; 
//assign                     cacheo_w_data_valid_o  =uncache ? 0:axii_w_data_valid_i ;    
assign                     cacheo_w_data_ready_i  =uncache ? 0:axii_w_data_ready_o ;    
//assign [RW_DATA_WIDTH-1:0] cacheo_w_data_o        =uncache ? 0:axii_w_data_i       ;
assign                     cacheo_r_data_valid_i  =uncache ? 0:axii_r_data_valid_o;    
//assign                     cacheo_r_data_ready_o  =uncache ? 0:axii_r_data_ready_i ;    
assign                     cacheo_r_data_i        =uncache ? 0:axii_r_data_o       ;
//assign                     cacheo_rw_block_i      =uncache ? 0:axii_rw_block_o     ;

assign                     axii_rw_addr_valid_i  =uncache ? rw_addr_valid_i :cacheo_rw_addr_valid_o;
//assign                     axii_rw_addr_ready_o =uncache ? rw_addr_ready_o :cacheo_rw_addr_ready_i;     
assign                     axii_rw_addr_i        =uncache ? rw_addr_i       :cacheo_rw_addr_o      ;
assign                     axii_rw_we_i          =uncache ? rw_we_i         :cacheo_rw_we_o        ;
assign                     axii_rw_len_i         =uncache ? rw_len_i        :cacheo_rw_len_o       ;
assign                     axii_rw_size_i        =uncache ? rw_size_i       :cacheo_rw_size_o      ;
assign                     axii_rw_burst_i       =uncache ? rw_burst_i      :cacheo_rw_burst_o     ;
//assign                     axii_rw_if_i          =uncache ? rw_if_i         :cacheo_rw_if_o        ; 
assign                     axii_w_data_valid_i   =uncache ? w_data_valid_i  :cacheo_w_data_valid_o ;    
//assign                     axii_w_data_ready_o   =uncache ? w_data_ready_o  :cacheo_w_data_ready_i ;    
assign                     axii_w_data_i         =uncache ? w_data_i        :cacheo_w_data_o       ;
//assign                     axii_r_data_valid_o   =uncache ? r_data_valid_o :cacheo_r_data_valid_i ;    
assign                     axii_r_data_ready_i   =uncache ? r_data_ready_i  :cacheo_r_data_ready_o ;    
//assign [RW_DATA_WIDTH-1:0] axii_r_data_o         =uncache ? r_data_o        :cacheo_r_data_i       ;
//assign                     axii_rw_block_i       =uncache ? rw_block_i      :cacheo_rw_block_o     ;
//
`ifndef ysyx_050133_NOCACHE
ysyx_050133_cache ysyx_050133_cache_dut
(
  .clk                    (clk                   ), 
  .rst                    (rst                   ), 
  .rw_addr_valid_i        (cachei_rw_addr_valid_i ), 
  //.rw_addr_ready_o        (cachei_rw_addr_ready_o ), 
  .rw_addr_i              (cachei_rw_addr_i       ), 
  .rw_we_i                (cachei_rw_we_i         ), 
  //.rw_len_i               (cachei_rw_len_i        ), 
  .rw_size_i              (cachei_rw_size_i       ), 
  //.rw_burst_i             (cachei_rw_burst_i      ), 
  .rw_if_i                (cachei_rw_if_i         ), 
  //.w_data_valid_i         (cachei_w_data_valid_i  ),  
  //.w_data_ready_o         (cachei_w_data_ready_o  ),  
  .w_data_i               (cachei_w_data_i        ), 
  //.r_data_valid_o         (cachei_r_data_valid_o  ), 
  .r_data_ready_i         (cachei_r_data_ready_i  ), 
  .r_data_o               (cachei_r_data_o        ), 
  .rw_block_i             (cachei_rw_block_i      ), 
  .rw_block_o             (cachei_rw_block_o      ), 
  .fence_i                (fence_i                ), 
  .fence_o                (fence_o                ), 
  .io_sram0_addr     (io_sram0_addr     ),
  .io_sram0_cen      (io_sram0_cen      ),
  .io_sram0_wen      (io_sram0_wen      ),
  .io_sram0_wmask    (io_sram0_wmask    ),  
  .io_sram0_wdata    (io_sram0_wdata    ),  
  .io_sram0_rdata    (io_sram0_rdata    ),  
  .io_sram1_addr     (io_sram1_addr     ),
  .io_sram1_cen      (io_sram1_cen      ),
  .io_sram1_wen      (io_sram1_wen      ),
  .io_sram1_wmask    (io_sram1_wmask    ),  
  .io_sram1_wdata    (io_sram1_wdata    ),  
  .io_sram1_rdata    (io_sram1_rdata    ),  
  .io_sram2_addr     (io_sram2_addr     ),
  .io_sram2_cen      (io_sram2_cen      ),
  .io_sram2_wen      (io_sram2_wen      ),
  .io_sram2_wmask    (io_sram2_wmask    ),  
  .io_sram2_wdata    (io_sram2_wdata    ),  
  .io_sram2_rdata    (io_sram2_rdata    ),  
  .io_sram3_addr     (io_sram3_addr     ),
  .io_sram3_cen      (io_sram3_cen      ),
  .io_sram3_wen      (io_sram3_wen      ),
  .io_sram3_wmask    (io_sram3_wmask    ),  
  .io_sram3_wdata    (io_sram3_wdata    ),  
  .io_sram3_rdata    (io_sram3_rdata    ),  
  .axi_rw_addr_valid_o    (cacheo_rw_addr_valid_o ),     
  .axi_rw_addr_ready_i    (cacheo_rw_addr_ready_i ),   
  .axi_rw_addr_o          (cacheo_rw_addr_o       ), 
  .axi_rw_we_o            (cacheo_rw_we_o         ), 
  .axi_rw_len_o           (cacheo_rw_len_o        ), 
  .axi_rw_size_o          (cacheo_rw_size_o       ), 
  .axi_rw_burst_o         (cacheo_rw_burst_o      ), 
  //.axi_rw_if_o            (cacheo_rw_if_o         ), 
  .axi_w_data_valid_o     (cacheo_w_data_valid_o  ),  
  .axi_w_data_ready_i     (cacheo_w_data_ready_i  ),  
  .axi_w_data_o           (cacheo_w_data_o        ), 
  .axi_r_data_valid_i     (cacheo_r_data_valid_i  ),  
  .axi_r_data_ready_o     (cacheo_r_data_ready_o  ),  
  .axi_r_data_i           (cacheo_r_data_i        )
  //.axi_rw_block_o         (cacheo_rw_block_o      ),
  //.axi_rw_block_i         (cacheo_rw_block_i      )
);
`endif

ysyx_050133_axi_master ysyx_050133_axi_master_dut
(
  .clk                    (clk                   ), 
  .rst                    (rst                   ), 
  .rw_addr_valid_i         (axii_rw_addr_valid_i      ),      
  .rw_addr_ready_o         (axii_rw_addr_ready_o      ),     
  .rw_addr_i               (axii_rw_addr_i            ),
  .rw_we_i                 (axii_rw_we_i              ),
  .rw_len_i                (axii_rw_len_i             ),
  .rw_size_i               (axii_rw_size_i            ),
  .rw_burst_i              (axii_rw_burst_i           ),
  //.rw_if_i                 (axii_rw_if_i              ), 
  .w_data_valid_i          (axii_w_data_valid_i       ),    
  .w_data_ready_o          (axii_w_data_ready_o       ),    
  .w_data_i                (axii_w_data_i             ),
  .r_data_valid_o          (axii_r_data_valid_o       ),    
  .r_data_ready_i          (axii_r_data_ready_i       ),    
  .r_data_o                (axii_r_data_o             ),
  //.rw_block_i              (axii_rw_block_i           ),
  .rw_block_o              (axii_rw_block_o           ),
  // Advanced eXtensible Interface
  .axi_aw_ready_i   (axi_aw_ready_i),               
  .axi_aw_valid_o   (axi_aw_valid_o),
	//.axi_aw_id_o      (axi_aw_id_o),
  .axi_aw_addr_o    (axi_aw_addr_o),
	.axi_aw_len_o     (axi_aw_len_o),
	.axi_aw_size_o    (axi_aw_size_o),
	.axi_aw_burst_o   (axi_aw_burst_o),
                                         
  .axi_w_ready_i    (axi_w_ready_i),                
  .axi_w_valid_o    (axi_w_valid_o),
  .axi_w_data_o     (axi_w_data_o),
  .axi_w_strb_o     (axi_w_strb_o),
	.axi_w_last_o     (axi_w_last_o),
                                         
  .axi_b_ready_o    (axi_b_ready_o),            
  .axi_b_valid_i    (axi_b_valid_i),
	//.axi_b_id_i       (axi_b_id_i),
  //.axi_b_resp_i     (axi_b_resp_i),                 
                                         
  .axi_ar_ready_i   (axi_ar_ready_i),               
  .axi_ar_valid_o   (axi_ar_valid_o),
	//.axi_ar_id_o      (axi_ar_id_o),
  .axi_ar_addr_o    (axi_ar_addr_o),
	.axi_ar_len_o     (axi_ar_len_o),
	.axi_ar_size_o    (axi_ar_size_o),
	.axi_ar_burst_o   (axi_ar_burst_o),
                                         
  .axi_r_ready_o    (axi_r_ready_o),            
  .axi_r_valid_i    (axi_r_valid_i),                
	//.axi_r_id_i       (axi_r_id_i),
  //.axi_r_resp_i     (axi_r_resp_i),
  .axi_r_data_i     (axi_r_data_i)
	//.axi_r_last_i     (axi_r_last_i)
);

endmodule
// Create Date: 2023/01/30 15:38:32
`define ysyx_050133_DIV_RADIX2
//`define DIV_CYCLE 0
module ysyx_050133_Divider(
    input             clk        ,  //时钟信号
    input             rst        ,  //复位信号（高有效）
    input             flush      ,  //为高表示要取消除法（修改一下除法器状态就行）
    input             div_valid  ,  //为高表示输入的数据有效，如果没有新的除法输入，在除法被接受的下一个周期要置低
    input             divw       ,  //为高表示输入的是 32 位除法
    input             div_signed ,  //表示是不是有符号除法，为高表示是有符号除法
    input      [63:0] dividend   ,  //xlen 被除数（ xlen 表示要实现的位数，ysyx 中是 64）
    input      [63:0] divisor    ,  //xlen 除数
    output reg        div_ready  ,  //为高表示除法器空闲，可以输入数据
    //output reg        out_valid  ,  //为高表示除法器输出了有效结果
    output reg [63:0] quotient   ,  //xlen 商
    output reg [63:0] remainder     //xlen 余数
    );
`ifdef ysyx_050133_DIV_RADIX2
  wire [63:0]dividend_abs=(div_signed&dividend[63])?~dividend+1:dividend;
  wire [63:0]divisor_abs=(div_signed&divisor[63])?~divisor+1:divisor;

  wire [127:0] dividend_ext=divw?{96'd0,dividend_abs[31:0]}:{64'd0,dividend_abs};
  wire [63:0] divisor_ext=divw?{32'd0,divisor_abs[31:0]}:divisor_abs;
  /*
  A B S R
  + + + +
  + - - +
  - + - -
  - - + -
  */

  reg [127:0]A;
  reg [63:0]B,S,R;
  reg S_signal;
  reg R_signal;
  reg [7:0]clk_cnt;

  wire[63:0]S_out=S_signal?~S+1:S;
  wire[63:0]R_out=R_signal?~R+1:R;

  wire [64:0]AmB=A[127:63]-{1'b0,B};
  wire S_set=~AmB[64];
  localparam S_IDLE = 0;
  localparam S_DIV = 1;

  reg [3:0] state,next_state;

  always@(posedge clk)begin
    if(rst)state<=S_IDLE;
    else state<=next_state;
  end

  always@(*)begin
    if(rst|flush)next_state=S_IDLE;
    else case(state)
      S_IDLE:if(div_valid&div_ready)next_state=S_DIV;
            else next_state=S_IDLE;
      S_DIV:if(clk_cnt==8'hff)next_state=S_IDLE;
            else next_state=S_DIV;
      default:next_state=S_IDLE;
    endcase
  end

  always@(posedge clk)begin
    if(rst)begin
      A<=0;
      B<=0;
      S<=0;
      R<=0;
      S_signal<=0;
      R_signal<=0;
      clk_cnt<=0;
      div_ready<=0;
      //out_valid<=0;
      quotient<=0;
      remainder<=0;
    end
    else case(state)
      S_IDLE:if(next_state==S_DIV)begin
        `ifdef ysyx_050133_DEBUGINFO
            div_inst_profiling();
            div_cycle_profiling();
        `endif
        div_ready<=0;
        //out_valid<=0;
        B<=divisor_ext;
        S<=0;
        R<=0;
        if(div_signed)begin
          if(divw)begin
            clk_cnt<=8'd31;
            A<=dividend_ext<<32;
            S_signal<=dividend[31]^divisor[31];
            R_signal<=dividend[31];
          end
          else begin
            clk_cnt<=8'd63;
            A<=dividend_ext;
            S_signal<=dividend[63]^divisor[63];
            R_signal<=dividend[63];
          end
        end
        else begin
          if(divw)begin
            clk_cnt<=8'd31;
            A<=dividend_ext<<32;
          end
          else begin
          clk_cnt<=8'd63;
          A<=dividend_ext;
          end
          S_signal<=0;
          R_signal<=0;
        end
      end
      else begin
        div_ready<=1;
      end
      S_DIV:begin
        `ifdef ysyx_050133_DEBUGINFO
            div_cycle_profiling();
        `endif
        if(next_state==S_IDLE)begin
        quotient<=S_out;
        //quotient<=0;
        remainder<=R_out;
        //remainder<=0;
        div_ready<=1;
        //out_valid<=1;
        clk_cnt<=0;
        end
        else begin
          clk_cnt<=clk_cnt-1;
          if(S_set)begin
            S[clk_cnt[5:0]]<=1;
            A<={AmB[63:0],A[62:0],1'b0};
            R<=AmB[63:0];
          end
          else begin
            S[clk_cnt[5:0]]<=0;
            A<=A<<1;
            R<=A[126:63];
          end
        end
      end
      default:begin
      end
    endcase
  end
`else
  wire signed[64:0] dividend_sext=div_signed?
                                divw?{{33{dividend[31]}},dividend[31:0]}
                                :{dividend[63],dividend}
                                :divw?{33'd0,dividend[31:0]}
                                :{1'd0,dividend};
  wire signed[64:0] divisor_sext=div_signed?
                                divw?{{33{divisor[31]}},divisor[31:0]}
                                :{divisor[63],divisor}
                                :divw?{33'd0,divisor[31:0]}
                                :{1'd0,divisor};

  wire signed[64:0] result_quotient=dividend_sext/divisor_sext;
  wire signed[64:0] result_remainder=dividend_sext%divisor_sext;

  reg[8:0] clk_cnt;
  localparam S_IDLE = 0;
  localparam S_DIV = 1;

  reg [3:0] state,next_state;
  always@(posedge clk)begin
    if(rst)state<=S_IDLE;
    else state<=next_state;
  end

  always@(*)begin
    if(rst|flush)next_state=S_IDLE;
    else case(state)
      S_IDLE:if(div_valid&div_ready)next_state=S_DIV;
              else next_state=S_IDLE;
      S_DIV:if(clk_cnt==`DIV_CYCLE)next_state=S_IDLE;
            else next_state=S_DIV;
      default:begin
      end
    endcase
  end

  always@(posedge clk)begin
    if(rst)begin
      clk_cnt<=0;
      div_ready<=0;
      //out_valid<=0;
      quotient<=0;
      remainder<=0;
    end
    else case(state)
      S_IDLE:if(next_state==S_DIV)begin
        `ifdef ysyx_050133_DEBUGINFO
            div_inst_profiling();
            div_cycle_profiling();
        `endif
        div_ready<=0;
        //out_valid<=0;
        clk_cnt<=0;
      end
      else begin
        div_ready<=1;
        clk_cnt<=0;
      end
      S_DIV:begin
        `ifdef ysyx_050133_DEBUGINFO
            div_cycle_profiling();
        `endif
        if(next_state==S_IDLE)begin
        clk_cnt<=0;
        //out_valid<=1;
        quotient<=result_quotient[63:0];
        remainder<=result_remainder[63:0];
        end
        else clk_cnt<=clk_cnt+1;
      end
      default:begin
      end
    endcase
  end
`endif
endmodule

module ysyx_050133_EXU(
  input            clk        ,
  input            rst        ,
  input   [15:0]    ctrl_ex  ,
  input   [31:0]   pc      ,
	input            block   ,
  input            Jpred   ,
  input            fence   ,
  input            mtip    ,
  input            clkint  ,
  output           mieo    ,
  input   [4:0]    rs1     ,
  input   [63:0]   rs1data ,
  input   [63:0]   rs2data ,
  input   [63:0]   imm     ,
  //input   [1:0]    forward_ALUSrc1,
  //input   [1:0]    forward_ALUSrc2,
  //input   [1:0]    forward_wdataSrc,
  //input   [63:0]   forward_data_mem,
  //input   [63:0]   forward_data_wb,
  input            src_valid_i,
  output           result_valid_o,
  output  [31:0]   dnpc_EXU,
  output  [63:0]   result,
  output  [63:0]   csrdata ,
  output  [63:0]   wdata
);
wire[63:0] rs1data_forward=rs1data;
  
//wire[63:0] rs2data_forward=rs2data;
wire[63:0] ALUdata1=ctrl_ex[8] ? {32'd0,pc}:rs1data;
wire[63:0] ALUdata2=ctrl_ex[7] ? 4
                    :ctrl_ex[6] ? imm
                    :rs2data;

assign wdata=rs2data;
//wire[63:0] rs1data_forward=forward_ALUSrc1==0 ? rs1data
//:forward_ALUSrc1==`ysyx_050133_forward_src_wb ? forward_data_wb
//:forward_ALUSrc1==`ysyx_050133_forward_src_mem ? forward_data_mem
//:0;
  
//wire[63:0] rs2data_forward=forward_ALUSrc2==0 ? rs2data
//:forward_ALUSrc2==`ysyx_050133_forward_src_wb ? forward_data_wb
//:forward_ALUSrc2==`ysyx_050133_forward_src_mem ? forward_data_mem
//:0;
//wire[63:0] ALUdata1=ctrl_ex[8] ? {32'd0,pc}:rs1data_forward;
//wire[63:0] ALUdata2=ctrl_ex[7] ? 4
                    //:ctrl_ex[6] ? imm
                    //:rs2data_forward;

//assign wdata=forward_wdataSrc==0 ? rs2data
//:forward_wdataSrc==`ysyx_050133_forward_src_wb ? forward_data_wb
//:forward_wdataSrc==`ysyx_050133_forward_src_mem ? forward_data_mem
//:0;
wire ctrl_mul=ctrl_ex[4]&(~ctrl_ex[3]);//5'b10xxx
wire ctrl_div=ctrl_ex[4]&ctrl_ex[3];//5'b11xxx
wire       mul_ready ;
wire       div_ready ;
assign result_valid_o=ctrl_mul ? mul_ready
                      :ctrl_div ? div_ready
                      :1;

wire       mul_valid   =ctrl_mul&src_valid_i;
wire       mulw        =ctrl_ex[5];
wire[1:0]  mul_signed  =ctrl_ex[1:0];
wire[63:0] multiplicand=ALUdata1;
wire[63:0] multiplier  =ALUdata2;
//wire       mul_out_valid ;
wire[63:0] result_hi ;
wire[63:0] result_lo ;
ysyx_050133_Multipler ysyx_050133_Multipler_dut(
    .clk         (clk         ),   //时钟信号
    .rst         (rst         ),   //复位信号（高有效）
    .flush       (1'b0       ),   //为高表示取消乘法
    .mul_valid   (mul_valid   ),   //为高表示输入的数据有效，如果没有新的乘法输入，在乘法被接受的下一个周期要置低
    .mulw        (mulw        ),   //为高表示是 32 位乘法
    .mul_signed  (mul_signed  ),   //2’b11（signed x signed）；2’b10（signed x unsigned）；2’b00（unsigned x unsigned）；
    .multiplicand(multiplicand),   //被乘数，xlen 表示乘法器位数
    .multiplier  (multiplier  ),   //乘数
    .mul_ready   (mul_ready   ),   //为高表示乘法器准备好，表示可以输入数据
    //.out_valid   (mul_out_valid),   //为高表示乘法器输出的结果有效
    .result_hi   (result_hi   ),   //高 xlen bits 结果
    .result_lo   (result_lo   )    //低 xlen bits 结果
    );

wire       div_valid   =ctrl_div&src_valid_i;
wire       divw        =ctrl_ex[5];
wire       div_signed  =ctrl_ex[0];
wire[63:0] dividend=ALUdata1;
wire[63:0] divisor  =ALUdata2;
//wire       div_out_valid ;
wire[63:0] quotient ;
wire[63:0] remainder ;
ysyx_050133_Divider ysyx_050133_Divider_dut(
    .clk         (clk         ),   //时钟信号
    .rst         (rst         ),   //复位信号（高有效）
    .flush       (1'b0       ),   //为高表示取消乘法
    .div_valid   (div_valid   ),   //为高表示输入的数据有效，如果没有新的乘法输入，在乘法被接受的下一个周期要置低
    .divw        (divw        ),   //为高表示是 32 位乘法
    .div_signed  (div_signed  ),   //2’b11（signed x signed）；2’b10（signed x unsigned）；2’b00（unsigned x unsigned）；
    .dividend    (dividend    ),   //被乘数，xlen 表示乘法器位数
    .divisor     (divisor     ),   //乘数
    .div_ready   (div_ready   ),   //为高表示乘法器准备好，表示可以输入数据
    //.out_valid   (div_out_valid),   //为高表示乘法器输出的结果有效
    .quotient    (quotient    ),   //高 xlen bits 结果
    .remainder   (remainder   )    //低 xlen bits 结果
    );

wire[63:0] ALUdata2n=~ALUdata2;
wire[63:0] Radd  =  ALUdata1+ALUdata2;
wire[64:0] Rsub65=  ALUdata1+ALUdata2n+1;
wire[63:0] Rsub  =  Rsub65[63:0];
wire       Rsubc =  Rsub65[64];
wire       Rsubo =  (ALUdata1[63]==ALUdata2n[63])&&(Rsub[63]^ALUdata1[63]);
wire[63:0] Rbeq  =  ALUdata1==ALUdata2 ? 1:0;
wire[63:0] Rbne  =  ALUdata1!=ALUdata2 ? 1:0;
wire[63:0] Rblt  =	{63'd0,Rsub[63]^Rsubo};
wire[63:0] Rbge  =	{63'd0,!Rblt[0]};
wire[63:0] Rbltu =  {63'd0,!Rsubc};
wire[63:0] Rbgeu =	{63'd0,Rsubc};

wire[63:0] Rslt  =  Rblt;
wire[63:0] Rsltu =  Rbltu;
wire[63:0] Rxor  =  ALUdata1^ALUdata2;
wire[63:0] Ror   =  ALUdata1|ALUdata2;
wire[63:0] Rand  =  ALUdata1&ALUdata2;
wire[63:0] Rsll  =  ALUdata1<<ALUdata2[5:0];
wire[63:0] Rsrl  =  ALUdata1>>ALUdata2[5:0];
wire[63:0] Rsra  =  signed'(ALUdata1)>>>ALUdata2[5:0]; 
//always@(*)begin
  //$display("Rsltu=%d %d %d %d",Rsltu,Rbltu, Rsubc, Rsub65);
//end
wire[63:0] Raddw  =  SEXT(Radd[31:0],3);
wire[63:0] Rsubw  =  SEXT(Rsub[31:0],3);
wire[63:0] Rsllw  =  SEXT(ALUdata1[31:0]<<ALUdata2[4:0],3);
wire[63:0] Rsrlw  =  SEXT({ALUdata1[31:0]>>ALUdata2[4:0]},3);
wire[63:0] Rsraw  =  SEXT({signed'(ALUdata1[31:0])>>>ALUdata2[4:0]},3);

wire[63:0] Rmul   =  result_lo;
//wire[63:0] Rmul   =  0;
wire[63:0] Rmulh  =  result_hi;
wire[63:0] Rmulhsu=  result_hi;
wire[63:0] Rmulhu =  result_hi;
wire[63:0] Rdiv   =  quotient;
wire[63:0] Rdivu  =  quotient;
wire[63:0] Rrem   =  remainder;
wire[63:0] Rremu  =  remainder;

wire[63:0] Rmulw  =  SEXT(Rmul[31:0],3);
wire[63:0] Rdivw  =  quotient;
wire[63:0] Rdivuw =  quotient;
wire[63:0] Rremw  =  remainder;
wire[63:0] Rremuw =  remainder;
//wire[63:0] Rdiv   =  signed'(ALUdata1)/signed'(ALUdata2);
//wire[63:0] Rdivu  =  ALUdata1/ALUdata2;
//wire[63:0] Rrem   =  signed'(ALUdata1)%signed'(ALUdata2);
//wire[63:0] Rremu  =  ALUdata1%ALUdata2;

//wire[63:0] Rmulw  =  SEXT(Rmul,3);
//wire[63:0] Rdivw  =  SEXT({32'd0,signed'(ALUdata1[31:0])/signed'(ALUdata2[31:0])},3);
//wire[63:0] Rdivuw =  SEXT({32'd0,ALUdata1[31:0]/ALUdata2[31:0]},3);
//wire[63:0] Rremw  =  SEXT({32'd0,signed'(ALUdata1[31:0])%signed'(ALUdata2[31:0])},3);
//wire[63:0] Rremuw =  SEXT({32'd0,ALUdata1[31:0]%ALUdata2[31:0]},3);



assign dnpc_EXU=ctrl_ex[10] ? csrdata[31:0]
	          :Jpred|fence ? pc+4
	          :imm[31:0]+(ctrl_ex[9] ? rs1data_forward[31:0]:pc);
assign result=  ctrl_ex[5] ? 
                  ctrl_ex[4:0]==`ysyx_050133_ALUop_ADD ? Raddw
                  :ctrl_ex[4:0]==`ysyx_050133_ALUop_SUB ? Rsubw
                  :ctrl_ex[4:0]==`ysyx_050133_ALUop_SLL ? Rsllw
                  :ctrl_ex[4:0]==`ysyx_050133_ALUop_SRL ? Rsrlw
                  :ctrl_ex[4:0]==`ysyx_050133_ALUop_SRA ? Rsraw
                  :ctrl_ex[4:0]==`ysyx_050133_ALUop_MUL ? Rmulw
                  :ctrl_ex[4:0]==`ysyx_050133_ALUop_DIV ? Rdivw
                  :ctrl_ex[4:0]==`ysyx_050133_ALUop_DIVU ? Rdivuw
                  :ctrl_ex[4:0]==`ysyx_050133_ALUop_REM ? Rremw
                  :ctrl_ex[4:0]==`ysyx_050133_ALUop_REMU ? Rremuw
                  :0
                :ctrl_ex[4:0]==`ysyx_050133_ALUop_ADD  ? Radd
                :ctrl_ex[4:0]==`ysyx_050133_ALUop_SUB  ? Rsub
                :ctrl_ex[4:0]==`ysyx_050133_ALUop_BEQ  ? Rbeq 
                :ctrl_ex[4:0]==`ysyx_050133_ALUop_BNE  ? Rbne 
                :ctrl_ex[4:0]==`ysyx_050133_ALUop_BLT  ? Rblt 
                :ctrl_ex[4:0]==`ysyx_050133_ALUop_BGE  ? Rbge 
                :ctrl_ex[4:0]==`ysyx_050133_ALUop_BLTU ? Rbltu
                :ctrl_ex[4:0]==`ysyx_050133_ALUop_BGEU ? Rbgeu
                :ctrl_ex[4:0]==`ysyx_050133_ALUop_SLT  ? Rslt 
                :ctrl_ex[4:0]==`ysyx_050133_ALUop_SLTU ? Rsltu
                :ctrl_ex[4:0]==`ysyx_050133_ALUop_XOR  ? Rxor 
                :ctrl_ex[4:0]==`ysyx_050133_ALUop_OR   ? Ror  
                :ctrl_ex[4:0]==`ysyx_050133_ALUop_AND  ? Rand 
                :ctrl_ex[4:0]==`ysyx_050133_ALUop_SLL  ? Rsll 
                :ctrl_ex[4:0]==`ysyx_050133_ALUop_SRL  ? Rsrl 
                :ctrl_ex[4:0]==`ysyx_050133_ALUop_SRA  ? Rsra 
                :ctrl_ex[4:0]==`ysyx_050133_ALUop_MUL ? Rmul
                :ctrl_ex[4:0]==`ysyx_050133_ALUop_MULH ? Rmulh
                :ctrl_ex[4:0]==`ysyx_050133_ALUop_MULHSU ? Rmulhsu
                :ctrl_ex[4:0]==`ysyx_050133_ALUop_MULHU ? Rmulhu
                :ctrl_ex[4:0]==`ysyx_050133_ALUop_DIV ? Rdiv
                :ctrl_ex[4:0]==`ysyx_050133_ALUop_DIVU ? Rdivu
                :ctrl_ex[4:0]==`ysyx_050133_ALUop_REM ? Rrem
                :ctrl_ex[4:0]==`ysyx_050133_ALUop_REMU ? Rremu
                :0;
 
reg[63:0] csr[6:0];
assign mieo = csr[0][3]&csr[4][7];
//reg[63:0] 0:mstatus,1:mtvec,2:mepc,3:mcause;4:mie 5:mip
assign csrdata=
  ctrl_ex[12:11]==`ysyx_050133_CSRSrc_mtvec ? csr[1]
  :ctrl_ex[12:11]==`ysyx_050133_CSRSrc_mepc ? csr[2]
  :ctrl_ex[12:11]==`ysyx_050133_CSRSrc_imm ? 
		CSRi(imm[11:0])==5? {csr[5][63:8],mtip,csr[5][6:0]}
		:CSRi(imm[11:0])==7? 0:csr[CSRi(imm[11:0])]
  :0;

always@(posedge clk)begin
	if(rst)begin
		csr[0]<=64'ha00001800;
		csr[1]<=0;
		csr[2]<=0;
		csr[3]<=0;
		csr[4]<=0;
		csr[5]<=0;
		csr[6]<=0;
	end
	else if(~block)begin
		if(ctrl_ex[15:13]==`ysyx_050133_CSRop_ecall)begin
				////$monitor("hello\n");
	`ifdef ysyx_050133_DEBUGINFO
				npc_etrace({32'd0,pc},64'hb);
	`endif
				csr[2]<={32'd0,pc};
				if(clkint)begin
					csr[0][7]<=csr[0][3];
					csr[0][3]<=0;
					csr[5][7]<=1;
					csr[3]<=64'h8000000000000007;
				end
				else begin
					csr[3]<=64'hb;
				end
		end
		else if(ctrl_ex[12:11]==`ysyx_050133_CSRSrc_mepc)begin
					csr[0][3]<=csr[0][7];
					csr[0][7]<=1;
					csr[5][7]<=0;
		end
		else if(ctrl_ex[15:13]==`ysyx_050133_CSRop_csrrw)begin
			csr[CSRi(imm[11:0])]<=rs1data_forward;
		end
		else if(ctrl_ex[15:13]==`ysyx_050133_CSRop_csrrs)begin
			csr[CSRi(imm[11:0])]<=csr[CSRi(imm[11:0])]|rs1data_forward;
		end
		else if(ctrl_ex[15:13]==`ysyx_050133_CSRop_csrrc)begin
			csr[CSRi(imm[11:0])]<=csr[CSRi(imm[11:0])]&~rs1data_forward;
		end
		else if(ctrl_ex[15:13]==`ysyx_050133_CSRop_csrrwi)begin
			csr[CSRi(imm[11:0])]<={59'd0,rs1};
		end
		else if(ctrl_ex[15:13]==`ysyx_050133_CSRop_csrrsi)begin
			csr[CSRi(imm[11:0])]<=csr[CSRi(imm[11:0])]|{59'd0,rs1};
		end
		else if(ctrl_ex[15:13]==`ysyx_050133_CSRop_csrrci)begin
			csr[CSRi(imm[11:0])]<=csr[CSRi(imm[11:0])]&~{59'd0,rs1};
		end
  end
end

endmodule
module ysyx_050133_IDU(
  input             clk    ,
  input             rst    ,
  input     [31:0]  inst     ,
  input             rdwen,
  input     [4:0]   rdin,
  input     [63:0]  rddata,
  input             has_hazard,
  output    [`ysyx_050133_ctrl_wb_len :0]   ctrl_wb_out,
  output    [`ysyx_050133_ctrl_mem_len:0]   ctrl_mem_out,
  output    [`ysyx_050133_ctrl_ex_len :0]   ctrl_ex_out,
  output    [4:0]   rs1,
  output    [4:0]   rs2,
  output    [63:0]  rs1data  ,
  output    [63:0]  rs2data  ,
  output    [63:0]  imm   ,
  output    [4:0]   rdout
);
wire [`ysyx_050133_ctrl_wb_len :0]   ctrl_wb;
wire [`ysyx_050133_ctrl_mem_len:0]   ctrl_mem;
wire [`ysyx_050133_ctrl_ex_len :0]   ctrl_ex;

wire[6:0] funct7=inst[31:25];
wire[2:0] funct3=inst[14:12];
wire[6:0] opcode=inst[6:0];

wire OPLUI    =  opcode==`ysyx_050133_OP_LUI   ; 
wire OPAUIPC  =  opcode==`ysyx_050133_OP_AUIPC ; 
wire OPJAL    =  opcode==`ysyx_050133_OP_JAL   ; 
wire OPJALR   =  opcode==`ysyx_050133_OP_JALR  ; 
wire OPBXX    =  opcode==`ysyx_050133_OP_BXX   ; 
wire OPLXX    =  opcode==`ysyx_050133_OP_LXX   ; 
wire OPSXX    =  opcode==`ysyx_050133_OP_SXX   ; 
wire OPXXI    =  opcode==`ysyx_050133_OP_XXI   ; 
wire OPXXIW   =  opcode==`ysyx_050133_OP_XXIW  ; 
wire OPRXX    =  opcode==`ysyx_050133_OP_RXX   ; 
wire OPRWX    =  opcode==`ysyx_050133_OP_RWX   ; 
wire OPFXX    =  opcode==`ysyx_050133_OP_FXX   ; 
wire OPSYS    =  opcode==`ysyx_050133_OP_SYS   ; 

//wire F3JALR    =  funct3==`ysyx_050133_F3_JALR     ; 
wire F3BEQ     =  funct3==`ysyx_050133_F3_BEQ      ; 
wire F3BNE     =  funct3==`ysyx_050133_F3_BNE      ; 
wire F3BLT     =  funct3==`ysyx_050133_F3_BLT      ; 
wire F3BGE     =  funct3==`ysyx_050133_F3_BGE      ; 
wire F3BLTU    =  funct3==`ysyx_050133_F3_BLTU     ; 
wire F3BGEU    =  funct3==`ysyx_050133_F3_BGEU     ; 
wire F3LB      =  funct3==`ysyx_050133_F3_LB       ; 
wire F3LH      =  funct3==`ysyx_050133_F3_LH       ; 
wire F3LW      =  funct3==`ysyx_050133_F3_LW       ; 
wire F3LBU     =  funct3==`ysyx_050133_F3_LBU      ; 
wire F3LHU     =  funct3==`ysyx_050133_F3_LHU      ; 
wire F3SB      =  funct3==`ysyx_050133_F3_SB       ; 
wire F3SH      =  funct3==`ysyx_050133_F3_SH       ; 
wire F3SW      =  funct3==`ysyx_050133_F3_SW       ; 
wire F3ADDI    =  funct3==`ysyx_050133_F3_ADDI     ; 
wire F3SLTI    =  funct3==`ysyx_050133_F3_SLTI     ; 
wire F3SLTIU   =  funct3==`ysyx_050133_F3_SLTIU    ; 
wire F3XORI    =  funct3==`ysyx_050133_F3_XORI     ; 
wire F3ORI     =  funct3==`ysyx_050133_F3_ORI      ; 
wire F3ANDI    =  funct3==`ysyx_050133_F3_ANDI     ; 
wire F3SLLI    =  funct3==`ysyx_050133_F3_SLLI     ; 
wire F3SRLI    =  funct3==`ysyx_050133_F3_SRLI     ; 
//wire F3SRAI    =  funct3==`ysyx_050133_F3_SRAI     ; 
wire F3ADD     =  funct3==`ysyx_050133_F3_ADD      ; 
//wire F3SUB     =  funct3==`ysyx_050133_F3_SUB      ; 
wire F3SLL     =  funct3==`ysyx_050133_F3_SLL      ; 
wire F3SLT     =  funct3==`ysyx_050133_F3_SLT      ; 
wire F3SLTU    =  funct3==`ysyx_050133_F3_SLTU     ; 
wire F3XOR     =  funct3==`ysyx_050133_F3_XOR      ; 
wire F3SRL     =  funct3==`ysyx_050133_F3_SRL      ; 
//wire F3SRA     =  funct3==`ysyx_050133_F3_SRA      ; 
wire F3OR      =  funct3==`ysyx_050133_F3_OR       ; 
wire F3AND     =  funct3==`ysyx_050133_F3_AND      ; 

wire F3LWU     =  funct3==`ysyx_050133_F3_LWU      ; 
wire F3LD      =  funct3==`ysyx_050133_F3_LD       ; 
wire F3SD      =  funct3==`ysyx_050133_F3_SD       ; 
//wire F3SLLI    =  funct3==`ysyx_050133_F3_SLLI     ; 
//wire F3SRLI    =  funct3==`ysyx_050133_F3_SRLI     ; 
//wire F3SRAI    =  funct3==`ysyx_050133_F3_SRAI     ; 
//wire F3ADDIW   =  funct3==`ysyx_050133_F3_ADDIW    ; 
//wire F3SLLIW   =  funct3==`ysyx_050133_F3_SLLIW    ; 
//wire F3SRLIW   =  funct3==`ysyx_050133_F3_SRLIW    ; 
//wire F3SRAIW   =  funct3==`ysyx_050133_F3_SRAIW    ; 
//wire F3ADDW    =  funct3==`ysyx_050133_F3_ADDW     ; 
//wire F3SUBW    =  funct3==`ysyx_050133_F3_SUBW     ; 
//wire F3SLLW    =  funct3==`ysyx_050133_F3_SLLW     ; 
//wire F3SRLW    =  funct3==`ysyx_050133_F3_SRLW     ; 
//wire F3SRAW    =  funct3==`ysyx_050133_F3_SRAW     ; 

wire F3CSRRW   =  funct3==`ysyx_050133_F3_CSRRW    ; 
wire F3CSRRS   =  funct3==`ysyx_050133_F3_CSRRS    ; 
wire F3CSRRC   =  funct3==`ysyx_050133_F3_CSRRC    ; 
wire F3CSRRWI  =  funct3==`ysyx_050133_F3_CSRRWI   ; 
wire F3CSRRSI  =  funct3==`ysyx_050133_F3_CSRRSI   ; 
wire F3CSRRCI  =  funct3==`ysyx_050133_F3_CSRRCI   ; 

wire F3MUL     =  funct3==`ysyx_050133_F3_MUL      ; 
wire F3MULH    =  funct3==`ysyx_050133_F3_MULH     ; 
wire F3MULHSU  =  funct3==`ysyx_050133_F3_MULHSU   ; 
wire F3MULHU   =  funct3==`ysyx_050133_F3_MULHU    ; 
wire F3DIV     =  funct3==`ysyx_050133_F3_DIV      ; 
wire F3DIVU    =  funct3==`ysyx_050133_F3_DIVU     ; 
wire F3REM     =  funct3==`ysyx_050133_F3_REM      ; 
wire F3REMU    =  funct3==`ysyx_050133_F3_REMU     ; 

//wire F3MULW    =  funct3==`ysyx_050133_F3_MULW     ; 
//wire F3DIVW    =  funct3==`ysyx_050133_F3_DIVW     ; 
//wire F3DIVUW   =  funct3==`ysyx_050133_F3_DIVUW    ; 
//wire F3REMW    =  funct3==`ysyx_050133_F3_REMW     ; 
//wire F3REMUW   =  funct3==`ysyx_050133_F3_REMUW    ; 

//wire F6SLLI    =  funct7[6:1]==`ysyx_050133_F6_SLLI    ; 
wire F6SRLI    =  funct7[6:1]==`ysyx_050133_F6_SRLI    ; 
//wire F6SRAI    =  funct7[6:1]==`ysyx_050133_F6_SRAI    ; 

wire F7ADD     =  funct7==`ysyx_050133_F7_ADD     ; 
//wire F7SUB     =  funct7==`ysyx_050133_F7_SUB     ; 
//wire F7SLL     =  funct7==`ysyx_050133_F7_SLL     ; 
//wire F7SLT     =  funct7==`ysyx_050133_F7_SLT     ; 
//wire F7SLTU    =  funct7==`ysyx_050133_F7_SLTU    ; 
//wire F7XOR     =  funct7==`ysyx_050133_F7_XOR     ; 
wire F7SRL     =  funct7==`ysyx_050133_F7_SRL     ; 
//wire F7SRA     =  funct7==`ysyx_050133_F7_SRA     ; 
//wire F7OR      =  funct7==`ysyx_050133_F7_OR      ; 
//wire F7AND     =  funct7==`ysyx_050133_F7_AND     ; 

//wire F7SLLIW   =  funct7==`ysyx_050133_F7_SLLIW   ; 
//wire F7SRLIW   =  funct7==`ysyx_050133_F7_SRLIW   ; 
//wire F7SRAIW   =  funct7==`ysyx_050133_F7_SRAIW   ; 
//wire F7ADDW    =  funct7==`ysyx_050133_F7_ADDW    ; 
//wire F7SUBW    =  funct7==`ysyx_050133_F7_SUBW    ; 
//wire F7SLLW    =  funct7==`ysyx_050133_F7_SLLW    ; 
//wire F7SRLW    =  funct7==`ysyx_050133_F7_SRLW    ; 
//wire F7SRAW    =  funct7==`ysyx_050133_F7_SRAW    ; 

//wire F7RXX1    =  funct7==`ysyx_050133_F7_RXX1    ; 
//wire F7RXX2    =  funct7==`ysyx_050133_F7_RXX2    ; 

wire F7MUL     =  funct7==`ysyx_050133_F7_MUL     ; 
//wire F7MULH    =  funct7==`ysyx_050133_F7_MULH    ; 
//wire F7MULHSU  =  funct7==`ysyx_050133_F7_MULHSU  ; 
//wire F7MULHU   =  funct7==`ysyx_050133_F7_MULHU   ; 
//wire F7DIV     =  funct7==`ysyx_050133_F7_DIV     ; 
//wire F7DIVU    =  funct7==`ysyx_050133_F7_DIVU    ; 
//wire F7REM     =  funct7==`ysyx_050133_F7_REM     ; 
//wire F7REMU    =  funct7==`ysyx_050133_F7_REMU    ; 

//wire F7MULW    =  funct7==`ysyx_050133_F7_MULW    ; 
//wire F7DIVW    =  funct7==`ysyx_050133_F7_DIVW    ; 
//wire F7DIVUW   =  funct7==`ysyx_050133_F7_DIVUW   ; 
//wire F7REMW    =  funct7==`ysyx_050133_F7_REMW    ; 
//wire F7REMUW   =  funct7==`ysyx_050133_F7_REMUW   ; 

//wire F7RXX3    =  funct7==`ysyx_050133_F7_RXX3    ; 

wire FFENCE  =  inst[31:7]==`ysyx_050133_F_FENCE;
//wire FPAUSE  =  inst[31:7]==`ysyx_050133_F_PAUSE;
wire FECALL  =  inst[31:7]==`ysyx_050133_F_ECALL; 
//wire FEBREAK =  inst[31:7]==`ysyx_050133_F_EBREAK;
wire FMRET   =  inst[31:7]==`ysyx_050133_F_MRET; 

assign rs1=(OPLUI|OPAUIPC|OPJAL)?0:inst[19:15];
assign rs2=(OPBXX|OPSXX|OPRXX|OPRWX)?inst[24:20]:0;
assign rdout=(OPBXX|OPSXX)?0:inst[11:7];


wire[63:0]  immI={{52{inst[31]}},inst[31:20]};
wire[63:0]  immS={{52{inst[31]}},inst[31:25],inst[11:7]};
wire[63:0]  immB={{51{inst[31]}},inst[31],inst[7],inst[30:25],inst[11:8],1'b0};
wire[63:0]  immU={{32{inst[31]}},inst[31:12],12'd0};
wire[63:0]  immJ={{43{inst[31]}},inst[31],inst[19:12],inst[20],inst[30:21],1'd0};


assign imm=
  (OPJALR|OPLXX|OPXXI|OPXXIW|(OPSYS))?immI
  :(OPSXX)?immS
  :(OPBXX)?immB
  :(OPLUI|OPAUIPC)?immU
  :(OPJAL)?immJ:0;



assign ctrl_wb_out=has_hazard ? 0:ctrl_wb;
assign ctrl_mem_out=has_hazard ? 0:ctrl_mem;
assign ctrl_ex_out=has_hazard ? 0:ctrl_ex;


assign ctrl_ex[23]=OPFXX&FFENCE;
assign ctrl_ex[22]=OPLXX ? 1:0;
assign ctrl_ex[21]=OPSXX ? 1:0;
assign ctrl_ex[20:18]=OPSXX ?
                      F3SB ? `ysyx_050133_AXI_SIZE_BYTES_1
                      :F3SH ? `ysyx_050133_AXI_SIZE_BYTES_2
                      :F3SW ? `ysyx_050133_AXI_SIZE_BYTES_4
                      :F3SD ? `ysyx_050133_AXI_SIZE_BYTES_8
                      :0
                    :OPLXX ?
                      F3LB|F3LBU ? `ysyx_050133_AXI_SIZE_BYTES_1
                      :F3LH|F3LHU ? `ysyx_050133_AXI_SIZE_BYTES_2
                      :F3LW|F3LWU ? `ysyx_050133_AXI_SIZE_BYTES_4
                      :F3LD ? `ysyx_050133_AXI_SIZE_BYTES_8
                      :0
                    :0;
assign ctrl_ex[17]=(OPJAL|OPJALR|(OPSYS&(FECALL|FMRET))|(OPFXX&FFENCE)) ? 1:0;
assign ctrl_ex[16]=OPBXX ? 1:0;
assign ctrl_ex[15:13]=OPSYS ?
                       FECALL ?`ysyx_050133_CSRop_ecall
                       :F3CSRRW ?`ysyx_050133_CSRop_csrrw
                       :F3CSRRS ?`ysyx_050133_CSRop_csrrs
                       :F3CSRRC ?`ysyx_050133_CSRop_csrrc
                       :F3CSRRWI ?`ysyx_050133_CSRop_csrrwi
                       :F3CSRRSI ?`ysyx_050133_CSRop_csrrsi
                       :F3CSRRCI ?`ysyx_050133_CSRop_csrrci
                       :0
                      :0;
assign ctrl_ex[12:11]=OPSYS ?
                       FECALL ?`ysyx_050133_CSRSrc_mtvec
                       :FMRET ?`ysyx_050133_CSRSrc_mepc
                       :`ysyx_050133_CSRSrc_imm
                      :0;
assign ctrl_ex[10]=(OPSYS&(FECALL|FMRET)) ? 1:0;
assign ctrl_ex[9]=OPJALR ? 1:0;
assign ctrl_ex[8]=(OPAUIPC|OPJAL|OPJALR) ? 1:0;
assign ctrl_ex[7:6]=(OPAUIPC|OPLXX|OPSXX|OPXXI|OPXXIW) ? 1
                    :(OPJAL|OPJALR) ? 2
                    :0;
assign ctrl_ex[5]=(OPRWX|OPXXIW) ? 1:0;
assign ctrl_ex[4:0]=OPBXX ?
                      F3BEQ ? `ysyx_050133_ALUop_BEQ
                      :F3BNE ? `ysyx_050133_ALUop_BNE
                      :F3BLT ? `ysyx_050133_ALUop_BLT
                      :F3BGE ? `ysyx_050133_ALUop_BGE
                      :F3BLTU ? `ysyx_050133_ALUop_BLTU
                      :F3BGEU ? `ysyx_050133_ALUop_BGEU
                      :`ysyx_050133_ALUop_NOP
                    :(OPXXI|OPXXIW)?
                      F3ADDI ? `ysyx_050133_ALUop_ADD
                      :F3SLTI ? `ysyx_050133_ALUop_SLT
                      :F3SLTIU ? `ysyx_050133_ALUop_SLTU
                      :F3XORI ? `ysyx_050133_ALUop_XOR
                      :F3ORI  ? `ysyx_050133_ALUop_OR
                      :F3ANDI ? `ysyx_050133_ALUop_AND
                      :F3SLLI ? `ysyx_050133_ALUop_SLL
                      :F3SRLI ? 
                        F6SRLI ? `ysyx_050133_ALUop_SRL
                                :`ysyx_050133_ALUop_SRA
                      :`ysyx_050133_ALUop_NOP
                    :(OPRXX|OPRWX)?
                      F7MUL ? 
                        F3MUL ? `ysyx_050133_ALUop_MUL
                        :F3MULH ? `ysyx_050133_ALUop_MULH
                        :F3MULHSU ? `ysyx_050133_ALUop_MULHSU
                        :F3MULHU ? `ysyx_050133_ALUop_MULHU
                        :F3DIV ? `ysyx_050133_ALUop_DIV
                        :F3DIVU ? `ysyx_050133_ALUop_DIVU
                        :F3REM ? `ysyx_050133_ALUop_REM
                        :F3REMU ? `ysyx_050133_ALUop_REMU
                        :`ysyx_050133_ALUop_NOP
                      :F3ADD ?
                        F7ADD ? `ysyx_050133_ALUop_ADD
                                :`ysyx_050133_ALUop_SUB
                      :F3SLL ? `ysyx_050133_ALUop_SLL
                      :F3SLT ? `ysyx_050133_ALUop_SLT
                      :F3SLTU ? `ysyx_050133_ALUop_SLTU
                      :F3XOR ? `ysyx_050133_ALUop_XOR
                      :F3SRL ? 
                        F7SRL ? `ysyx_050133_ALUop_SRL
                                :`ysyx_050133_ALUop_SRA
                      :F3OR ? `ysyx_050133_ALUop_OR
                      :F3AND ? `ysyx_050133_ALUop_AND
                      :`ysyx_050133_ALUop_NOP
                    :(OPAUIPC|OPJAL|OPJALR|OPLXX|OPSXX)?`ysyx_050133_ALUop_ADD
                    :`ysyx_050133_ALUop_NOP;
assign ctrl_mem[6:5]=OPLUI ? `ysyx_050133_rdSrc_imm
                    :OPLXX ? `ysyx_050133_rdSrc_mem
                    :(OPAUIPC|OPJAL|OPJALR|OPXXI|OPXXIW|OPRXX|OPRWX)?`ysyx_050133_rdSrc_alu
                    :OPSYS ? `ysyx_050133_rdSrc_csr
                    :0;
assign ctrl_mem[4:0]=OPLXX ?
                      F3LB ? `ysyx_050133_rdSEXT_b
                      :F3LH ? `ysyx_050133_rdSEXT_h
                      :F3LW ? `ysyx_050133_rdSEXT_w
                      :F3LBU ? `ysyx_050133_rdSEXT_bu
                      :F3LHU ? `ysyx_050133_rdSEXT_hu
                      :F3LWU ? `ysyx_050133_rdSEXT_wu
                      : `ysyx_050133_rdSEXT_d
                    :(OPXXIW|OPRWX)? `ysyx_050133_rdSEXT_w
                    :`ysyx_050133_rdSEXT_d;

//assign ctrl_wb[1]=OPSYS&FEBREAK;

assign ctrl_wb[0]=(OPJAL|OPJALR|OPLUI|OPAUIPC|OPLXX|OPXXI|OPXXIW|OPRXX|OPRWX|OPSYS)? 1:0;


ysyx_050133_RegisterFile ysyx_050133_RegisterFile_dut(
  .clk    (clk    ),
  .rst    (rst    ),
  .rddata (rddata ),
  .rd     (rdin   ),
  .wen    (rdwen  ),
  .rs1    (rs1    ),
  .rs1data(rs1data),
  .rs2    (rs2    ),
  .rs2data(rs2data)
);

endmodule
module ysyx_050133_IFU(
  input clk          ,
  input rst          ,
  input pcREG_en          ,
  input     [31:0] dnpc,
  input            pcSrc,
  input     [31:0] instin,
  output reg pc_valid_o,
  output reg[31:0] pc,
  output [31:0] npc,
  output [31:0] inst
);

`ifdef ysyx_050133_MULTICYCLE
assign npc=pc;
always@(posedge clk)
begin
  if(rst)begin
    pc<=32'h80000000;
    pc_valid_o<=1;
  end
  else if(pcREG_en)begin
    pc<=pcSrc?dnpc:pc+4;
    pc_valid_o<=1;
  end
  else begin
    pc_valid_o<=0;
  end
end
assign inst=pc==32'h2ffffffc ? 0 : instin[31:0];

`else

assign npc=pcSrc ? dnpc:pc+4;
reg inst_store;
reg[31:0]inst_stored;
always@(posedge clk)
begin
	//$display("pcvalid=%d/n",pc_valid_o);
  if(rst)begin
    pc<=32'h2ffffffc;
    pc_valid_o<=1;
    inst_store<=0;
    inst_stored<=0;
  end
  else if(pcREG_en)begin
    pc<=npc;
    pc_valid_o<=1;
    inst_store<=0;
    inst_stored<=0;
  end
  else if(inst_store==0)begin
    inst_store<=1;
    inst_stored<=instin[31:0];
  end
	else begin
    pc_valid_o<=0;
	end
end
assign inst=pc==32'h2ffffffc ? 0:inst_store ? inst_stored:instin[31:0];
`endif
endmodule
// Create Date: 2023/01/29 16:32:12
`define ysyx_050133_MUL_BOOTH
//`define ysyx_050133_MUL_WALLACE
`ifdef ysyx_050133_MUL_WALLACE
  `define ysyx_050133_SEGMENTATION
`endif
//`define ysyx_050133_MUL_CYCLE 0
//
module ysyx_050133_Multipler(
    input              clk         ,   //时钟信号
    input              rst         ,   //复位信号（高有效）
    input              flush       ,   //为高表示取消乘法
    input              mul_valid   ,   //为高表示输入的数据有效，如果没有新的乘法输入，在乘法被接受的下一个周期要置低
    input              mulw        ,   //为高表示是 32 位乘法
    input   [1:0]      mul_signed  ,   //2’b11（signed x signed）；2’b10（signed x unsigned）；2’b00（unsigned x unsigned）；
    input   [63:0]     multiplicand,   //被乘数，xlen 表示乘法器位数
    input   [63:0]     multiplier  ,   //乘数
    output  reg        mul_ready   ,   //为高表示乘法器准备好，表示可以输入数据
    //output  reg        out_valid   ,   //为高表示乘法器输出的结果有效
    output  reg [63:0] result_hi   ,   //高 xlen bits 结果
    output  reg [63:0] result_lo       //低 xlen bits 结果
    );


wire [131:0] multiplicand_sext=mul_signed[1]?
                              mulw?{{100{multiplicand[31]}},multiplicand[31:0]}
                              :{{68{multiplicand[63]}},multiplicand}
                              :mulw?{100'd0,multiplicand[31:0]}
                              :{68'd0,multiplicand};
wire [65:0] multiplier_sext=mul_signed[0]?
                              mulw?{{34{multiplier[31]}},multiplier[31:0]}
                              :{{2{multiplier[63]}},multiplier}
                              :mulw?{34'd0,multiplier[31:0]}
                              :{2'd0,multiplier};
`ifdef ysyx_050133_MUL_BOOTH
  reg[131:0] x;
  reg[66:0] y;
  wire[131:0] p;
  wire c;
  reg[131:0] result;
  // assign sel_negative =  y_add & (y & ~y_sub | ~y & y_sub);
  // assign sel_positive = ~y_add & (y & ~y_sub | ~y & y_sub);
  // assign sel_double_negative =  y_add & ~y & ~y_sub;
  // assign sel_double_positive = ~y_add &  y &  y_sub;

  ysyx_050133_BoothRadixGen ysyx_050133_BoothRadixGen_dut(
    .x(x),
    .src(y[2:0]),
    .p(p),
    .c(c)
  );

  localparam S_IDLE = 0;
  localparam S_MUL = 1;

  reg [3:0] state,next_state;
  always@(posedge clk)begin
    if(rst)state<=S_IDLE;
    else state<=next_state;
  end

  always@(*)begin
    if(rst|flush)next_state=S_IDLE;
    else case(state)
      S_IDLE:if(mul_valid&mul_ready)next_state=S_MUL;
		else next_state=S_IDLE;
      S_MUL:if((|y==0)||(|x==0))next_state=S_IDLE;
		else next_state=S_MUL;
      default:begin
        next_state=S_IDLE;
      end
    endcase
  end

  always@(posedge clk)begin
    if(rst)begin
      x<=0;
      y<=0;
			result<=0;
      mul_ready<=0;
      //out_valid<=0;
      result_hi<=0;
      result_lo<=0;
    end
    else case(state)
      S_IDLE:if(next_state==S_MUL)begin
        x<=multiplicand_sext;
        y<={multiplier_sext,1'd0};
        mul_ready<=0;
        //out_valid<=0;
        result<=0;
        `ifdef ysyx_050133_DEBUGINFO
            mul_inst_profiling();
            mul_cycle_profiling();
        `endif
      end
      else begin
        mul_ready<=1;
      end
      S_MUL:begin
        `ifdef ysyx_050133_DEBUGINFO
            mul_cycle_profiling();
        `endif
        if(next_state==S_IDLE)begin
        result_hi<=result[127:64];
        result_lo<=result[63:0];
        //out_valid<=1;
        mul_ready<=1;
      end
      else begin
        if(c)result<=result+p+1;
        else result<=result+p;
        x<=x<<2;
        y<=y>>2;
      end
    end
      default:begin
      end
    endcase
  end
`endif

`ifdef ysyx_050133_MUL_WALLACE
  reg[7:0] clk_cnt;
  reg[131:0] x;
  reg[66:0] y;
  wire[131:0] p[32:0];
  wire[32:0] c;
  wire[32:0] wallace_in[131:0];
  wire[29:0] wallace_cin[132:0];
  wire [132:0] wallace_cout;
  wire [131:0] wallace_sout;
  wire [131:0] result;
  assign wallace_cin[0]=c[29:0];
  assign wallace_cout[0]=c[30];
  assign result=wallace_cout[131:0]+wallace_sout+{131'd0,c[31]};
  generate
    genvar a;
    genvar b;
    for(a=0;a<33;a=a+1)begin
      ysyx_050133_BoothRadixGen ysyx_050133_BoothRadixGen_dut(
      .x(x<<a*2),
      .src(y[2+a*2:a*2]),
      .p(p[a]),
      .c(c[a])
      );
      for(b=0;b<132;b=b+1)begin
        assign wallace_in[b][a]=p[a][b];
      end
    end
    genvar d;
    for(d=0;d<132;d=d+1)begin
      wallace_33bits wallace_33bits_dut(
        .clk(clk),
        .src_in(wallace_in[d]),
        .cin(wallace_cin[d]),
        .cout_group(wallace_cin[d+1]),
        .cout(wallace_cout[d+1]),
        .s(wallace_sout[d])
        );
    end
  endgenerate

  localparam S_IDLE = 0;
  localparam S_MUL = 1;

  reg [3:0] state,next_state;
  always@(posedge clk)begin
    if(rst)state<=S_IDLE;
    else state<=next_state;
  end

  always@(*)begin
    if(rst|flush)next_state=S_IDLE;
    else case(state)
      S_IDLE:if(mul_valid&mul_ready)next_state=S_MUL;
              else next_state=S_IDLE;
  `ifdef ysyx_050133_SEGMENTATION
      S_MUL:if(clk_cnt==4)next_state=S_IDLE;
            else next_state=S_MUL;
  `else
      S_MUL:next_state=S_IDLE;
  `endif
      default:begin
      next_state=S_IDLE;
      end
    endcase
  end

  always@(posedge clk)begin
    if(rst)begin
      clk_cnt<=0;
      x<=0;
      y<=0;
      mul_ready<=0;
      //out_valid<=0;
      result_hi<=0;
      result_lo<=0;
    end
    else case(state)
      S_IDLE:if(next_state==S_MUL)begin
        x<=multiplicand_sext;
        y<={multiplier_sext,1'd0};
        mul_ready<=0;
        //out_valid<=0;
        clk_cnt<=0;
        `ifdef ysyx_050133_DEBUGINFO
            mul_inst_profiling();
            mul_cycle_profiling();
        `endif
      end
      else begin
        mul_ready<=1;
        clk_cnt<=0;
      end
      S_MUL:begin
        `ifdef ysyx_050133_DEBUGINFO
            mul_cycle_profiling();
        `endif
        if(next_state==S_IDLE)begin
        clk_cnt<=0;
        //out_valid<=1;
        result_hi<=result[127:64];
        result_lo<=result[63:0];
        end
          else clk_cnt<=clk_cnt+1;
      end
      default:begin
      end
    endcase
  end
`endif
`ifdef ysyx_050133_MUL_CYCLE
  wire [131:0] result=$signed(multiplicand_sext)*$signed({{66{multiplier_sext[65]}},multiplier_sext});
  reg[8:0] clk_cnt;
  localparam S_IDLE = 0;
  localparam S_MUL = 1;

  reg [3:0] state,next_state;
  always@(posedge clk)begin
    if(rst)state<=S_IDLE;
    else state<=next_state;
  end

  always@(*)begin
    if(rst|flush)next_state=S_IDLE;
    else case(state)
      S_IDLE:if(mul_valid&mul_ready)next_state=S_MUL;
              else next_state=S_IDLE;
      S_MUL:if(clk_cnt== `ysyx_050133_MUL_CYCLE)next_state=S_IDLE;
            else next_state=S_MUL;
      default:begin
      next_state=S_IDLE;
      end
    endcase
  end

  always@(posedge clk)begin
    if(rst)begin
      clk_cnt<=0;
      mul_ready<=0;
      //out_valid<=0;
      result_hi<=0;
      result_lo<=0;
    end
    else case(state)
      S_IDLE:if(next_state==S_MUL)begin
        mul_ready<=0;
        //out_valid<=0;
        clk_cnt<=0;
        `ifdef ysyx_050133_DEBUGINFO
            mul_inst_profiling();
            mul_cycle_profiling();
        `endif
      end
      else begin
        mul_ready<=1;
        clk_cnt<=0;
      end
      S_MUL:begin
        `ifdef ysyx_050133_DEBUGINFO
            mul_cycle_profiling();
        `endif
        if(next_state==S_IDLE)begin
        clk_cnt<=0;
        //out_valid<=1;
        result_hi<=result[127:64];
        result_lo<=result[63:0];
        end
        else clk_cnt<=clk_cnt+1;
      end
      default:begin
      end
    endcase
  end
`endif
endmodule
///y+1,y,y-1///
//(ysub+y-2yadd)*2^2i//
/*
000 +0
001 +x
010 +x
011 +2x
100 -2x
101 -x
110 -x
111 +0

pi = -x? ~xi
     -2x? ~xi-1
     +x? xi
     +2x? xi-1
     0? 0
*/
module ysyx_050133_BoothRadixGen(
  input [131:0] x,
  input [2:0] src,
  output [131:0] p,
  output c
);
// wire y_add,y,y_sub;
wire y_add = src[2];
wire y = src[1];
wire y_sub = src[0];
// wire sel_negative,sel_double_negative,sel_positive,sel_double_positive;
// assign p[0] = ~(~(sel_negative & ~x[0]) & ~(sel_double_negative & ~0) 
//            & ~(sel_positive & x[0] ) & ~(sel_double_positive &  0));
// generate
//   genvar i;
//   for(i=1;i<132;i=i+1)begin
// assign p[i] = ~(~(sel_negative & ~x[i]) & ~(sel_double_negative & ~x[i-1]) 
//            & ~(sel_positive & x[i] ) & ~(sel_double_positive &  x[i-1]));
//     end
// endgenerate
wire sel_negative =  y_add & (y & ~y_sub | ~y & y_sub);
wire sel_positive = ~y_add & (y & ~y_sub | ~y & y_sub);
wire sel_double_negative =  y_add & ~y & ~y_sub;
wire sel_double_positive = ~y_add &  y &  y_sub;
assign c =  y_add&~(y&y_sub);
assign p=sel_negative?~x
      :sel_positive?x
      :sel_double_negative?~(x<<1)
      :sel_double_positive?x<<1
      :0;


endmodule

//CSA
module csa(
  input [2:0] in,
  output cout,s
);
wire a,b,cin;
assign a=in[2];
assign b=in[1];
assign cin=in[0];
assign s = a ^ b ^ cin;
assign cout = (a & b)|(b & cin)|(a & cin);
endmodule

module wallace_33bits(
    input clk,
    input [32:0] src_in,
    input [29:0]  cin,
    output [29:0] cout_group,
    output      cout,s
);

`ifdef ysyx_050133_SEGMENTATION
  wire [29:0] c;
  reg [32:0] src_in_reg;
  always@(posedge clk)begin
    src_in_reg<=src_in;
  end
  reg [29:0] cin_reg;
  ///////////////first////////////////
  wire [10:0] first_s;
  reg [10:0] first_s_reg;
  csa csa0  (.in (src_in_reg[ 2: 0]), .cout (c[ 0]), .s (first_s[ 0]) );
  csa csa1  (.in (src_in_reg[ 5: 3]), .cout (c[ 1]), .s (first_s[ 1]) );
  csa csa2  (.in (src_in_reg[ 8: 6]), .cout (c[ 2]), .s (first_s[ 2]) );
  csa csa3  (.in (src_in_reg[11: 9]), .cout (c[ 3]), .s (first_s[ 3]) );
  csa csa4  (.in (src_in_reg[14:12]), .cout (c[ 4]), .s (first_s[ 4]) );
  csa csa5  (.in (src_in_reg[17:15]), .cout (c[ 5]), .s (first_s[ 5]) );
  csa csa6  (.in (src_in_reg[20:18]), .cout (c[ 6]), .s (first_s[ 6]) );
  csa csa7  (.in (src_in_reg[23:21]), .cout (c[ 7]), .s (first_s[ 7]) );
  csa csa8  (.in (src_in_reg[26:24]), .cout (c[ 8]), .s (first_s[ 8]) );
  csa csa9  (.in (src_in_reg[29:27]), .cout (c[ 9]), .s (first_s[ 9]) );
  csa csa10 (.in (src_in_reg[32:30]), .cout (c[10]), .s (first_s[10]) );
  always@(posedge clk)begin
    first_s_reg<=first_s;
    cin_reg[10:0]<=cin[10:0];
  end
  ///////////////second//////////////
  wire [6:0] second_s;
  reg [6:0] second_s_reg;
  csa csa11 (.in ({first_s[2:0]}             ), .cout (c[11]), .s (second_s[0]));
  csa csa12 (.in ({first_s[5:3]}             ), .cout (c[12]), .s (second_s[1]));
  csa csa13 (.in ({first_s[8:6]}             ), .cout (c[13]), .s (second_s[2]));
  csa csa14 (.in ({first_s[10:9],cin[0]}     ), .cout (c[14]), .s (second_s[3]));
  csa csa15 (.in ({cin[3:1]}                 ), .cout (c[15]), .s (second_s[4]));
  csa csa16 (.in ({cin[6:4]}                 ), .cout (c[16]), .s (second_s[5]));
  csa csa17 (.in ({cin[9:7]}                 ), .cout (c[17]), .s (second_s[6]));
  always@(posedge clk)begin
    second_s_reg<=second_s;
    cin_reg[17:10]<=cin[17:10];
  end

  //////////////thrid////////////////
  wire [4:0] third_s;
  reg [4:0] third_s_reg;
  csa csa18 (.in ( second_s_reg[2:0]              ), .cout (c[18]), .s (third_s[0]));
  csa csa19 (.in ( second_s_reg[5:3]              ), .cout (c[19]), .s (third_s[1]));
  csa csa20 (.in ({second_s_reg[6],cin_reg[11:10]}), .cout (c[20]), .s (third_s[2]));
  csa csa21 (.in (cin_reg[14:12]                  ), .cout (c[21]), .s (third_s[3]));
  csa csa22 (.in (cin_reg[17:15]                  ), .cout (c[22]), .s (third_s[4]));
  always@(posedge clk)begin
    third_s_reg<=third_s;
    cin_reg[22:18]<=cin[22:18];
  end
  //////////////fourth////////////////
  wire [2:0] fourth_s;
  reg [2:0] fourth_s_reg;
  csa csa23 (.in ({third_s[2:0]}         ), .cout (c[23]), .s (fourth_s[0]));
  csa csa24 (.in ({third_s[4:3],cin[18]} ), .cout (c[24]), .s (fourth_s[1]));
  csa csa25 (.in ({cin[21:19]}           ), .cout (c[25]), .s (fourth_s[2]));
  always@(posedge clk)begin
    fourth_s_reg<=fourth_s;
    cin_reg[25:23]<=cin[25:23];
  end
  //////////////fifth/////////////////
  wire [1:0]fifth_s;
  reg [1:0]fifth_s_reg;
  csa csa26 (.in ({fourth_s_reg[2:0]}         ), .cout (c[26]), .s (fifth_s[0]));
  csa csa27 (.in ({cin_reg[24:22]}            ), .cout (c[27]), .s (fifth_s[1]));
  always@(posedge clk)begin
    fifth_s_reg<=fifth_s;
    cin_reg[27:26]<=cin[27:26];
  end
  ///////////////sixth///////////////
  wire sixth_s;
  reg sixth_s_reg;
  csa csa28 (.in ({fifth_s[1:0],cin[25]}  ), .cout (c[28]), .s (sixth_s));
  always@(posedge clk)begin
    sixth_s_reg<=sixth_s;
    cin_reg[28]<=cin[28];
  end
  ///////////////seventh///////////////
  wire seventh_s;
  reg seventh_s_reg;
  csa csa30 (.in ({sixth_s_reg,cin_reg[27:26]}  ), .cout (c[29]), .s (seventh_s));
  always@(posedge clk)begin
    seventh_s_reg<=seventh_s;
    cin_reg[29]<=cin[29];
  end
  ///////////////eighth///////////////
  csa csa31 (.in ({seventh_s,cin[29:28]}  ), .cout (cout), .s (s));

  ///////////////output///////////////
  assign cout_group = c;
`else
  wire [29:0] c;
  ///////////////first////////////////
  wire [10:0] first_s;
  csa csa0  (.in (src_in[ 2: 0]), .cout (c[ 0]), .s (first_s[ 0]) );
  csa csa1  (.in (src_in[ 5: 3]), .cout (c[ 1]), .s (first_s[ 1]) );
  csa csa2  (.in (src_in[ 8: 6]), .cout (c[ 2]), .s (first_s[ 2]) );
  csa csa3  (.in (src_in[11: 9]), .cout (c[ 3]), .s (first_s[ 3]) );
  csa csa4  (.in (src_in[14:12]), .cout (c[ 4]), .s (first_s[ 4]) );
  csa csa5  (.in (src_in[17:15]), .cout (c[ 5]), .s (first_s[ 5]) );
  csa csa6  (.in (src_in[20:18]), .cout (c[ 6]), .s (first_s[ 6]) );
  csa csa7  (.in (src_in[23:21]), .cout (c[ 7]), .s (first_s[ 7]) );
  csa csa8  (.in (src_in[26:24]), .cout (c[ 8]), .s (first_s[ 8]) );
  csa csa9  (.in (src_in[29:27]), .cout (c[ 9]), .s (first_s[ 9]) );
  csa csa10 (.in (src_in[32:30]), .cout (c[10]), .s (first_s[10]) );

  ///////////////second//////////////
  wire [6:0] second_s;
  csa csa11 (.in ({first_s[2:0]}             ), .cout (c[11]), .s (second_s[0]));
  csa csa12 (.in ({first_s[5:3]}             ), .cout (c[12]), .s (second_s[1]));
  csa csa13 (.in ({first_s[8:6]}             ), .cout (c[13]), .s (second_s[2]));
  csa csa14 (.in ({first_s[10:9],cin[0]}     ), .cout (c[14]), .s (second_s[3]));
  csa csa15 (.in ({cin[3:1]}                 ), .cout (c[15]), .s (second_s[4]));
  csa csa16 (.in ({cin[6:4]}                 ), .cout (c[16]), .s (second_s[5]));
  csa csa17 (.in ({cin[9:7]}                 ), .cout (c[17]), .s (second_s[6]));
  //////////////thrid////////////////
  wire [4:0] third_s;
  csa csa18 (.in (second_s[2:0]           ), .cout (c[18]), .s (third_s[0]));
  csa csa19 (.in (second_s[5:3]           ), .cout (c[19]), .s (third_s[1]));
  csa csa20 (.in ({second_s[6],cin[11:10]}), .cout (c[20]), .s (third_s[2]));
  csa csa21 (.in (cin[14:12]              ), .cout (c[21]), .s (third_s[3]));
  csa csa22 (.in (cin[17:15]              ), .cout (c[22]), .s (third_s[4]));

  //////////////fourth////////////////
  wire [2:0] fourth_s;

  csa csa23 (.in ({third_s[2:0]}         ), .cout (c[23]), .s (fourth_s[0]));
  csa csa24 (.in ({third_s[4:3],cin[18]} ), .cout (c[24]), .s (fourth_s[1]));
  csa csa25 (.in ({cin[21:19]}           ), .cout (c[25]), .s (fourth_s[2]));
  //////////////fifth/////////////////
  wire [1:0]fifth_s;

  csa csa26 (.in ({fourth_s[2:0]}         ), .cout (c[26]), .s (fifth_s[0]));
  csa csa27 (.in ({cin[24:22]}            ), .cout (c[27]), .s (fifth_s[1]));

  ///////////////sixth///////////////
  wire sixth_s;
  csa csa28 (.in ({fifth_s[1:0],cin[25]}  ), .cout (c[28]), .s (sixth_s));
  ///////////////seventh///////////////
  wire seventh_s;
  csa csa30 (.in ({sixth_s,cin[27:26]}  ), .cout (c[29]), .s (seventh_s));
  ///////////////eighth///////////////
  csa csa31 (.in ({seventh_s,cin[29:28]}  ), .cout (cout), .s (s));

  ///////////////output///////////////
  assign cout_group = c;
`endif
endmodule
module ysyx_050133_RegisterFile #(ADDR_WIDTH = 32, DATA_WIDTH = 64) (
  input clk,
  input rst,
  input [DATA_WIDTH-1:0] rddata,
  input [4:0] rd,
  input wen,
  input [4:0] rs1,
  output [DATA_WIDTH-1:0] rs1data,
  input [4:0] rs2,
  output [DATA_WIDTH-1:0] rs2data
);
`ifdef ysyx_050133_DEBUGINFO
always@(*)set_gpr_ptr(rf);
`endif

integer i;
reg [DATA_WIDTH-1:0] rf [ADDR_WIDTH-1:0];
assign rs1data = rs1==0 ? 0
                      :(rd==rs1&wen==1)?rddata
                      :rf[rs1];
assign rs2data = rs2==0 ? 0
                      :(rd==rs2&wen==1)?rddata
                      :rf[rs2];
always @(posedge clk) begin
	if(rst)begin
    for(i=0;i<ADDR_WIDTH;i=i+1)begin
			rf[i]<=0;
		end
	end
  else if (wen) rf[rd] <= rddata;
end
endmodule

module ysyx_050133_CLINT # (
    parameter AXI_DATA_WIDTH    = 64,
    parameter AXI_ADDR_WIDTH    = 32
)(//IF&MEM输入信号
    input                               clk,
    input                               rst,
		output                              mtip,

    // Advanced eXtensible Interface
    output reg                          axi_aw_ready_o,       
    input                               axi_aw_valid_i,
		//input [AXI_ID_WIDTH-1:0]            axi_aw_id_i,
    input [AXI_ADDR_WIDTH-1:0]          axi_aw_addr_i,
    //input [7:0]                         axi_aw_len_i,
    //input [2:0]                         axi_aw_size_i,
    //input [1:0]                         axi_aw_burst_i,

    output reg                          axi_w_ready_o,        
    input                               axi_w_valid_i,
    input [AXI_DATA_WIDTH-1:0]          axi_w_data_i,
		input [AXI_DATA_WIDTH/8-1:0]        axi_w_strb_i,
    //input                               axi_w_last_i,
    
    input                               axi_b_ready_i,      
    output reg                          axi_b_valid_o,
		//output      [AXI_ID_WIDTH-1:0]      axi_b_id_o,
    //output reg  [1:0]                   axi_b_resp_o,          

    output reg                          axi_ar_ready_o,       
    input                               axi_ar_valid_i,
		//input [AXI_ID_WIDTH-1:0]            axi_ar_id_i,
    input [AXI_ADDR_WIDTH-1:0]          axi_ar_addr_i,
    //input [7:0]                         axi_ar_len_i,
    //input [2:0]                         axi_ar_size_i,
    //input [1:0]                         axi_ar_burst_i,
    
    input                               axi_r_ready_i,            
    output reg                          axi_r_valid_o,        
		//output      [AXI_ID_WIDTH-1:0]      axi_r_id_o,
    //output reg  [1:0]                   axi_r_resp_o,
    output reg  [AXI_DATA_WIDTH-1:0]    axi_r_data_o
    //output reg                          axi_r_last_o
);

localparam RS_IDLE = 1;
localparam RS_RHS = 2;

localparam WS_IDLE = 1;
localparam WS_WHS = 2;
localparam WS_BHS = 3;

//assign axi_b_id_o=0;
//assign axi_r_id_o=0;
//reg  [AXI_ADDR_WIDTH-1:0] ar_pc;          
//reg  [AXI_ADDR_WIDTH-1:0] ar_addr;        
//reg  [7:0]                ar_len;         
//reg  [2:0]                ar_size;        
//reg  [1:0]                ar_burst;       
//
reg  [AXI_ADDR_WIDTH-1:0] aw_addr;        
//reg  [7:0]                aw_len;         
//reg  [2:0]                aw_size;        
//reg  [1:0]                aw_burst;       

reg[1:0] rstate;
reg[1:0] next_rstate;
reg[1:0] wstate;
reg[1:0] next_wstate;

//reg[31:0] misp;
reg[63:0] mtimecmp;
reg[63:0] mtime;
//reg[1:0] tick_count;
assign mtip=mtime>=mtimecmp?1 : 0;
wire [63:0]wmask={{8{axi_w_strb_i[7]}},{8{axi_w_strb_i[6]}},{8{axi_w_strb_i[5]}},{8{axi_w_strb_i[4]}},{8{axi_w_strb_i[3]}},{8{axi_w_strb_i[2]}},{8{axi_w_strb_i[1]}},{8{axi_w_strb_i[0]}}};

//always@(posedge clk)begin
	//if(rst)begin
		//tick_count<=0;
	//end
	//else begin
		//tick_count<=tick_count+1;
		////if(tick_count==0)mtime<=mtime+1;
	//end
//end
    //// ------------------State Machine------------------TODO
    
    //// 写通道状态切换
    
always@(posedge clk)begin
  if(rst)wstate<=WS_IDLE;
  else wstate<=next_wstate;
end

always@(*) begin
  if(rst)next_wstate=WS_IDLE;
  else case(wstate)
    WS_IDLE:if(axi_aw_ready_o&axi_aw_valid_i)next_wstate=WS_WHS;
      else next_wstate=WS_IDLE;
    WS_WHS:if(axi_w_ready_o&axi_w_valid_i)next_wstate=WS_BHS;
      else next_wstate=WS_WHS;
    WS_BHS:if(axi_b_valid_o&axi_b_ready_i)next_wstate=WS_IDLE;
      else next_wstate=WS_BHS;
    default:next_wstate=RS_IDLE;
  endcase
end

always@(posedge clk)begin
  if(rst)begin
    axi_aw_ready_o<=1;
    aw_addr<=0;
    //aw_len<=0;
    //aw_size<=0;
    //aw_burst<=0;
    axi_w_ready_o<=0;
    axi_b_valid_o<=0;
    //axi_b_resp_o<=0;
		mtimecmp<=0;
		mtime<=0;
  end
  else begin
    case(wstate)
      WS_IDLE:
      if(next_wstate==WS_WHS)begin
        axi_aw_ready_o<=0;
        aw_addr<=axi_aw_addr_i;
        //aw_len<=axi_aw_len_i;
        axi_w_ready_o<=1;
		    mtime<=mtime+1;
      end
      else begin
        axi_aw_ready_o<=1;
        axi_w_ready_o<=0;
        axi_b_valid_o<=0;
		    mtime<=mtime+1;
      end
      WS_WHS:if(axi_w_ready_o&axi_w_valid_i)begin
				if(aw_addr==32'h2004000)begin
					mtimecmp<=(axi_w_data_i&wmask)|(mtimecmp&(~wmask));
				end
				else if(aw_addr==32'h200bff8)begin
		      mtime<=(axi_w_data_i&wmask)|(mtime&(~wmask));
				end
          axi_w_ready_o<=0;
          axi_b_valid_o<=1;
      end
      WS_BHS:if(next_wstate==WS_IDLE)begin
        axi_aw_ready_o<=1;
        axi_b_valid_o<=0;
      end
      default:begin
      end
    endcase
  end
end

    //// 读通道状态切换

always@(posedge clk)begin
  if(rst)rstate<=RS_IDLE;
  else rstate<=next_rstate;
end

always@(*) begin
  if(rst)next_rstate=RS_IDLE;
  else case(rstate)
    RS_IDLE:if(axi_ar_ready_o&axi_ar_valid_i)next_rstate=RS_RHS;
      else next_rstate=RS_IDLE;
    RS_RHS:if(axi_r_ready_i&axi_r_valid_o)next_rstate=RS_IDLE;
    else next_rstate=RS_RHS;
    default:next_rstate=RS_IDLE;
  endcase
end


always@(posedge clk)begin
  if(rst)begin
    axi_ar_ready_o<=1;
    axi_r_valid_o<=0;
    //axi_r_resp_o<=0;
    axi_r_data_o<=0;
  end
  else begin
    case(rstate)
      RS_IDLE:
      if(next_rstate==RS_RHS)begin
        axi_ar_ready_o<=0;
        axi_r_valid_o<=1;
				if(axi_ar_addr_i==32'h200BFF8)begin
          axi_r_data_o<=mtime;
        end
      end
      else begin
        axi_ar_ready_o<=1;
        axi_r_valid_o<=0;
      end
      RS_RHS:if(axi_r_valid_o&axi_r_ready_i)begin
        axi_ar_ready_o<=1;
        axi_r_valid_o<=0;
      end
      default:begin
      end
    endcase
  end
end
endmodule
