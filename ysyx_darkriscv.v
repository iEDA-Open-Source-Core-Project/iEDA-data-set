`timescale 1ns / 1ps
//notice :  dcache write_valid must be ahead of the dcache read_valid 
/* 
- 内核配置：含pre-decode id/ex wb 3 级流水线处理器核; ICACHE+DCACHE指令与数据高速缓存;
  AXI4-Full总线连接核与SoC支持RISCV-32 I指令集
- 仓库位置：https://github.com/iEDA-Open-Source-Core-Project/darkriscv
- 分支： freeze
- 贡献者 ： 郭栋良 、尚杰
*/




//*****************************darksocv define**********************
/*
 * Copyright (c) 2018, Marcelo Samsoniuk
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * * Redistributions of source code must retain the above copyright notice, this
 *   list of conditions and the following disclaimer.
 *
 * * Redistributions in binary form must reproduce the above copyright notice,
 *   this list of conditions and the following disclaimer in the documentation
 *   and/or other materials provided with the distribution.
 *
 * * Neither the name of the copyright holder nor the names of its
 *   contributors may be used to endorse or promote products derived from
 *   this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

//`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// darkriscv configuration
////////////////////////////////////////////////////////////////////////////////

// pipeline stages:
//
// 2-stage version: core and memory in different clock edges result in less
// clock performance, but less losses when the program counter changes
// (pipeline flush = 1 clock).  Works like a 4-stage pipeline and remember
// the 68040 clock scheme, with instruction per clock = 1.  alternatively,
// it is possible work w/ 1 wait-state and 1 clock edge, but with a penalty
// in performance (instruction per clock = 0.5).
//
// 3-stage version: core and memory in the same clock edge require one extra
// stage in the pipeline, but keep a good performance most of time
// (instruction per clock = 1).  of course, read operations require 1
// wait-state, which means sometimes the read performance is reduced.
`define __3STAGE__

// RV32I vs RV32E:
//
// The difference between the RV32I and RV32E regarding the logic space is
// minimal in typical applications with modern 5 or 6 input LUT based FPGAs,
// but the RV32E is better with old 4 input LUT based FPGAs.
// `define __RV32E__

// muti-threading support:
//
// Decreases clock performance by 20% (80MHz), but enables two or more
// contexts (threads) in the core. The threads work in symmetrical way,
// which means that they will start with the same exactly core parameters
// (same initial PC, same initial SP, etc). The boot.s code is designed
// to handle this difference and set each thread to different
// applications.
// Notes:
// a) threading is currently supported only in the 3-stage pipeline version.
// b) the old experimental "interrupt mode" was removed, which means that
//    the multi-thread mode does not make anything "visible" other than
//    increment the gpio register.
// c) the threading in the non-interrupt mode switches when the program flow
//    changes, i.e. every jal instruction. When the core is idle, it is
//    probably in a jal loop.
// The number of threads must be 2**n (i.e. THREADS = 3 means 8 threads)
//`define __THREADS__ 3
//
// mac instruction:
//
// The mac instruction is similar to other register to register
// instructions, but with a different opcode 7'h1111111.  the format is mac
// rd,r1,r2, but is not currently possible encode in asm, by this way it is
// available in licb as int mac(int rd, short r1, short r2).  Although it
// can be used to accelerate the mul/div operations, the mac operation is
// designed for DSP applications.  with some effort (low level machine
// code), it is possible peak 100MMAC/s @100MHz.
//`define __MAC16X16__

// flexbuzz interface (experimental):
//
// A new data bus interface similar to a well known c*ldfire bus interface, in
// a way that part of the bus routing is moved to the core, in a way that
// is possible support different bus widths (8, 16 or 32 bit) and endians more
// easily (the new interface is natively big-endian, but the endian can be adjusted
// in the bus interface dinamically). Similarly to the standard 32-bit interface,
// the external logic must detect the RD/WR operation quick enough and assert HLT
// in order to insert wait-states and perform the required multiplexing to fit
// the DLEN operand size in the data bus width available.
//`define __FLEXBUZZ__

// interrupt support
//
// The interrupt support in the core uses the machine registers mtvec and
// mepc, which means support the control special register instruction csrrw,
// in a way that is possible read/write the mtvec and mepc.
// the interrupt itself works like the thread switch, with the difference
// that:
// a) the PC will be saved in the mepc register
// b)the PC will receive the mtvec value
// c) single interrupt, which means that the mtvec offset is always zero
// The interrupt support cannot be used with threading (because makes no
// much sense?)... also, it requires the 3 stage pipeline (again, makes no
// much sense use it with the 2-stage pipeline).
`define __INTERRUPT__

// initial PC and SP
//
// it is possible program the initial PC and SP.  Typically, the PC is set
// to address 0, representing the start of ROM memory and the SP is set to
// the final of RAM memory.  In the linker, the start of ROM memory matches
// with the .text area, which is defined in the boot.c code and the start of
// RAM memory matches with the .data and other volatile data, in a way that
// the stack can be positioned in the top of RAM and does not match with the
// .data.
`define __RESETPC__ 32'h30000000
`define __RESETSP__ 32'd0

////////////////////////////////////////////////////////////////////////////////
// darksocv configuration:
////////////////////////////////////////////////////////////////////////////////

// interactive simulation:
//
// When enabled, will trick the simulator in order to enable interactive
// access via the stdin, in a way that is possible type interactive commands,
// which will make your simulator crazy! unfortunately, it works only with
// iverilog... at least, Xilinx ISIM does not liket the $fgetc()
//`define __INTERACTIVE__

// performance measurement:
//
// The performance measurement can be done in the simulation level by
// eabling the __PERFMETER__ define, in order to check how the clock cycles
// are used in the core. The report is displayed when the FINISH_REQ signal
// is actived by the UART.
`define __PERFMETER__

// icarus register debug:
//
// As most people observed, the icarus verilog does not dump the register
// bank because icarus does not dump arrays by default. However, it is possible
// activate this special option in order to dump the register bank. This
// makes no effect in other simulators, but it appears as a warning.
//`define __REGDUMP__

// full harvard architecture:
//
// When defined, enforses that the instruction and data buses are connected
// to fully separate memory banks.  Although the darkriscv always use
// harvard architecture in the core, with separate instruction and data
// buses, the logic levels outside the core can use different architectures
// and concepts, including von neumann, wich a single bus shared by
// instruction and data access, as well a mix between harvard and von
// neumann, which is possible in the case of dual-port blockrams, where is
// possible connect two separate buses in a single memory bank.  the main
// advantage of a single memory bank is that the .text and .data areas can
// be better allocated, but in this case is not possible protect the .text
// area as in the case of separate memory banks.
// WARNING: this setup must match with the src/darksocv.ld.src file!
//`define __HARVARD__

// memory size:
//
// The current test firmware requires 8KB of memory, but it depends of the
// memory layout: whenthe I-bus and D-bus are both attached in the same BRAM,
// it is possible assume that 8MB is enough, but when the I-bus and D-bus are
// attached to separate memories, the I-BRAM requires around 5KB and the
// D-BRAM requires about 1.5KB. A safe solution is just simply and set the
// size as the same.
// The size is defined as 2**MLEN, i.e. the address bits used in the memory.
// WARNING: this setup must match with the src/darksocv.ld.src file!
`ifdef __HARVARD__
    `define MLEN 13 // MEM[12:0] ->  8KBytes LENGTH = 0x2000
`else
    `define MLEN 12 // MEM[12:0] -> 4KBytes LENGTH = 0x1000
`endif

// read-modify-write cycle:
//
// Generate RMW cycles when writing in the memory. This option basically
// makes the read and write cycle symmetric and may work better in the cases
// when the 32-bit memory does not support separate write enables for
// separate 16-bit and 8-bit words. Typically, the RMW cycle results in a
// decrease of 5% in the performance (not the clock, but the instruction
// pipeline eficiency) due to memory wait-states.
//`define __RMW_CYCLE__

// instruction wait-states:
//
// option to add wait-states in order to use the 2-stage pipeline AND a
// single phase clock... decrease the IPC, but increases the clock from 50 to 80MHz!
// maybe, in the future, can use associated to a large 64 or 128 bit burst based
// bus in order to get a quick 2-stage pipeline w/ an efficient instruction bus.
// do not forget to see the cache options below!
//`define __WAITSTATES__

// instruction and data caches:
//
// the option for instruction and data caches were developed for 2-stage
// version and, of course, is part of the original effort to make the core
// more efficient when the wait-states are enabled.
`define __ICACHE__ // not working, must debug it! :(
`define __DCACHE__ // not working, must debug it! :(

// UART speed is set in bits per second, typically 115200 bps:
//`define __UARTSPEED__ 115200

// UART queue:
//
// Optional RX/TX queue for communication oriented applications. The concept
// foreseen 256 bytes for TX and RX, in a way that frames up to 128 bytes can
// be easily exchanged via UART.
//`define __UARTQUEUE__

////////////////////////////////////////////////////////////////////////////////
// board definition:
////////////////////////////////////////////////////////////////////////////////

// The board is automatically defined in the xst/xise files via Makefile or
// ISE. Case it is not the case, please define you board name here:
//`define AVNET_MICROBOARD_LX9
//`define XILINX_AC701_A200
//`define QMTECH_SDRAM_LX16

// the following defines are automatically defined:

`ifdef __ICARUS__
    `define SIMULATION 1
`endif

`ifdef XILINX_ISIM
    `define SIMULATION 2
`endif

`ifdef MODEL_TECH
    `define SIMULATION 3
`endif

`ifdef XILINX_SIMULATOR
    `define SIMULATION 4
`endif

`ifdef AVNET_MICROBOARD_LX9
    `define BOARD_ID 1
    //`define BOARD_CK 100000000
    //`define BOARD_CK 66666666
    //`define BOARD_CK 40000000
    // example of DCM logic:
    `define BOARD_CK_REF 100000000
    `define BOARD_CK_MUL 2
    `ifdef __3STAGE__
        `define BOARD_CK_DIV 2 // 3-stage, 0-ws, 100MHz
    `elsif __WAITSTATES__
        `define BOARD_CK_DIV 2 // 2-stage, 1-ws, 100MHz
    `else
        `define BOARD_CK_DIV 4 // 2-stage, 0-ws, 50MHz
    `endif
`endif

`ifdef XILINX_AC701_A200
    `define BOARD_ID 2
    //`define BOARD_CK 90000000
    `define BOARD_CK_REF 90000000
    `define BOARD_CK_MUL 4
    `define BOARD_CK_DIV 2
`endif

`ifdef QMTECH_SDRAM_LX16
    `define BOARD_ID 3
    `define BOARD_CK_REF 50000000
    `define BOARD_CK_MUL 4
    `define BOARD_CK_DIV 2
    `define INVRES 1
`endif

`ifdef QMTECH_SPARTAN7_S15
    `define BOARD_ID 4
    `define BOARD_CK_REF 50000000
    `define BOARD_CK_MUL 20
    `define BOARD_CK_DIV 10
    `define XILINX7clock 1
    `define VIVADO 1
    `define INVRES 1
`endif

`ifdef LATTICE_BREVIA2_XP2
    `define BOARD_ID 5
    `define BOARD_CK 50000000
    `define INVRES 1
`endif

`ifdef LATTICE_ECP5_COLORLIGHTI9
    `define LATTICE_ECP5_PLL_REF25MHZ 1
    `define BOARD_ID 14
    `define BOARD_CK 125_000_000 // cause we use a pll with 25MHz ref clocks
    `define INVRES 1
`endif

`ifdef LATTICE_ECP5_COLORLIGHTI5
    `define LATTICE_ECP5_PLL_REF25MHZ 1
    `define BOARD_ID 15
    `define BOARD_CK 125_000_000 // cause we use a pll with 25MHz ref clocks
    `define INVRES 1
`endif

`ifdef LATTICE_ECP5_ULX3S
    `define LATTICE_ECP5_PLL_REF25MHZ 1
    `define BOARD_ID 16
    `define BOARD_CK 125_000_000 // cause we use a pll with 25MHz ref clocks
    `define INVRES 1
`endif

`ifdef LATTICE_ICE40_BREAKOUT_HX8K
    `define BOARD_ID 17
    `define BOARD_CK 65_000_000 // cause we use a pll with 25MHz ref clocks
    `define INVRES 1
`endif


`ifdef PISWORDS_RS485_LX9
    `define BOARD_ID 6
    `define BOARD_CK_REF 50000000
    `define BOARD_CK_MUL 4
    `define BOARD_CK_DIV 2
    `define INVRES 1
`endif

`ifdef DIGILENT_SPARTAN3_S200
    `define BOARD_ID 7
    `define BOARD_CK 50000000
    `define __RMW_CYCLE__
`endif

`ifdef ALIEXPRESS_HPC40GBE_K420
    `define BOARD_ID 8
    //`define BOARD_CK 200000000
    `define BOARD_CK_REF 100000000
    `define BOARD_CK_MUL 12
    `define BOARD_CK_DIV 5
    `define XILINX7clock 1
    `define INVRES 1
`endif

`ifdef QMTECH_ARTIX7_A35
    `define BOARD_ID 9
    `define BOARD_CK_REF 50000000
    `define BOARD_CK_MUL 20
    `define BOARD_CK_DIV 10
    `define XILINX7clock 1
    `define VIVADO 1
    `define INVRES 1
`endif

`ifdef ALIEXPRESS_HPC40GBE_XKCU040
    `define BOARD_ID 10
    //`define BOARD_CK 200000000
    `define BOARD_CK_REF 100000000
    `define BOARD_CK_MUL 8  // x8/2 = 400MHZ (overclock!)
    `define BOARD_CK_DIV 2  // vivado reco. = 250MHz
    `define XILINX7clock 1
    `define INVRES 1
`endif

`ifdef PAPILIO_DUO_LOGICSTART
    `define BOARD_ID 11
    `define BOARD_CK_REF 32000000
    `define BOARD_CK_MUL 2
    `define BOARD_CK_DIV 2
`endif

`ifdef QMTECH_KINTEX7_K325
    `define BOARD_ID 12
    `define BOARD_CK_REF 50000000
    `define BOARD_CK_MUL 20
    `define BOARD_CK_DIV 4
    `define XILINX7clock 1
    `define INVRES 1
`endif

`ifdef SCARAB_MINISPARTAN6_PLUS_LX9
    `define BOARD_ID 13
    `define BOARD_CK_REF 50000000
    `define BOARD_CK_MUL 4
    `define BOARD_CK_DIV 2
    // `define INVRES 0
`endif

`ifndef BOARD_ID
    `define BOARD_ID 0
    `define BOARD_CK 100000000
`endif

`ifdef BOARD_CK_REF
    `define BOARD_CK (`BOARD_CK_REF * `BOARD_CK_MUL / `BOARD_CK_DIV)
`endif

// darkuart baudrate automtically calculated according to board clock:

`ifndef __UARTSPEED__
  `define __UARTSPEED__ 115200
`endif

`define  __BAUD__ ((`BOARD_CK/`__UARTSPEED__))

// register number depends of CPU type RV32[EI] and number of threads

`ifdef __THREADS__
    `undef __INTERRUPT__

    `ifdef __RV32E__
        `define RLEN 16*(2**`__THREADS__)
    `else
        `define RLEN 32*(2**`__THREADS__)
    `endif
`else
    `ifdef __RV32E__
        `define RLEN 16
    `else
        `define RLEN 32
    `endif
`endif
//******************************************************************


//****************************core define**************************
// implemented opcodes:

`define LUI     7'b01101_11      // lui   rd,imm[31:12]
`define AUIPC   7'b00101_11      // auipc rd,imm[31:12]
`define JAL     7'b11011_11      // jal   rd,imm[xxxxx]
`define JALR    7'b11001_11      // jalr  rd,rs1,imm[11:0]
`define BCC     7'b11000_11      // bcc   rs1,rs2,imm[12:1]
`define LCC     7'b00000_11      // lxx   rd,rs1,imm[11:0]
`define SCC     7'b01000_11      // sxx   rs1,rs2,imm[11:0]
`define MCC     7'b00100_11      // xxxi  rd,rs1,imm[11:0]
`define RCC     7'b01100_11      // xxx   rd,rs1,rs2
`define CCC     7'b11100_11      // exx, csrxx, mret

// proprietary extension (custom-0)
`define CUS     7'b00010_11      // cus   rd,rs1,rs2,fc3,fct5

// not implemented opcodes:
//`define FCC     7'b00011_11      // fencex
//***************************************************************

//***************************dark_uart****************************
`define UART_STATE_IDLE  6
`define UART_STATE_START 7
`define UART_STATE_DATA0 8
`define UART_STATE_DATA1 9
`define UART_STATE_DATA2 10
`define UART_STATE_DATA3 11
`define UART_STATE_DATA4 12
`define UART_STATE_DATA5 13
`define UART_STATE_DATA6 14
`define UART_STATE_DATA7 15
`define UART_STATE_STOP  0
`define UART_STATE_ACK   1

// UART registers
// 
// 0: status register ro, 1 = xmit busy, 2 = recv bfusy
// 1: buffer register rw, w = xmit fifo, r = recv fifo
// 2: baud rate msb   rw (not used)
// 3: baud rate lsb   rw (not used)

//****************************************************************

//*********************axi define********************************
`define REQ_READ            1'b0
`define REQ_WRITE           1'b1
`define SIZE_B              2'b00
`define SIZE_H              2'b01
`define SIZE_W              2'b10
`define SIZE_D              2'b11
`define AXI_RW_DATA_WIDTH                                   128
`define AXI_BURST_TYPE_INCR                                 2'b01      
`define AXI_ARCACHE_NORMAL_NON_CACHEABLE_NON_BUFFERABLE     4'b0010
// Access permissions
`define AXI_PROT_UNPRIVILEGED_ACCESS                        3'b000
`define AXI_PROT_SECURE_ACCESS                              3'b000
`define AXI_PROT_DATA_ACCESS                                3'b000

`define RW_DATA_WIDTH       32
`define RW_ADDR_WIDTH       32
`define AXI_DATA_WIDTH      64
`define AXI_ADDR_WIDTH      32
`define AXI_ID_WIDTH        4
`define AXI_USER_WIDTH      1

`define N                   4

//*********************************************************************

module ysyx_darkriscv (
    input clock,
    input reset,
    input io_interrupt,

    output        io_slave_awready,
    input         io_slave_awvalid,
    input  [31:0] io_slave_awaddr,
    input  [ 3:0] io_slave_awid,
    input  [ 7:0] io_slave_awlen,
    input  [ 2:0] io_slave_awsize,
    input  [ 1:0] io_slave_awburst,

    output        io_slave_wready,
    input         io_slave_wvalid,
    input  [63:0] io_slave_wdata,
    input  [ 7:0] io_slave_wstrb,
    input         io_slave_wlast,

    input        io_slave_bready,
    output       io_slave_bvalid,
    output [1:0] io_slave_bresp,
    output [3:0] io_slave_bid,

    output        io_slave_arready,
    input         io_slave_arvalid,
    input  [31:0] io_slave_araddr,
    input  [ 3:0] io_slave_arid,
    input  [ 7:0] io_slave_arlen,
    input  [ 2:0] io_slave_arsize,
    input  [ 1:0] io_slave_arburst,

    input         io_slave_rready,
    output        io_slave_rvalid,
    output [ 1:0] io_slave_rresp,
    output [63:0] io_slave_rdata,
    output        io_slave_rlast,
    output [ 3:0] io_slave_rid,

    input         io_master_awready,
    output        io_master_awvalid,
    output [31:0] io_master_awaddr,
    output [ 3:0] io_master_awid,
    output [ 7:0] io_master_awlen,
    output [ 2:0] io_master_awsize,
    output [ 1:0] io_master_awburst,


    input         io_master_wready,
    output        io_master_wvalid,
    output [63:0] io_master_wdata,
    output [ 7:0] io_master_wstrb,
    output        io_master_wlast,

    output       io_master_bready,
    input        io_master_bvalid,
    input  [1:0] io_master_bresp,
    input  [3:0] io_master_bid,

    input         io_master_arready,
    output        io_master_arvalid,
    output [31:0] io_master_araddr,
    output [ 3:0] io_master_arid,
    output [ 7:0] io_master_arlen,
    output [ 2:0] io_master_arsize,
    output [ 1:0] io_master_arburst,

    output        io_master_rready,
    input         io_master_rvalid,
    input  [ 1:0] io_master_rresp,
    input  [63:0] io_master_rdata,
    input         io_master_rlast,
    input  [ 3:0] io_master_rid,

    output [  5:0] io_sram0_addr,
    output         io_sram0_cen,
    output         io_sram0_wen,
    output [127:0] io_sram0_wmask,
    output [127:0] io_sram0_wdata,
    input  [127:0] io_sram0_rdata,

    output [  5:0] io_sram1_addr,
    output         io_sram1_cen,
    output         io_sram1_wen,
    output [127:0] io_sram1_wmask,
    output [127:0] io_sram1_wdata,
    input  [127:0] io_sram1_rdata,

    output [  5:0] io_sram2_addr,
    output         io_sram2_cen,
    output         io_sram2_wen,
    output [127:0] io_sram2_wmask,
    output [127:0] io_sram2_wdata,
    input  [127:0] io_sram2_rdata,
    output [  5:0] io_sram3_addr,
    output         io_sram3_cen,
    output         io_sram3_wen,
    output [127:0] io_sram3_wmask,
    output [127:0] io_sram3_wdata,
    input  [127:0] io_sram3_rdata,
    output [  5:0] io_sram4_addr,
    output         io_sram4_cen,
    output         io_sram4_wen,
    output [127:0] io_sram4_wmask,
    output [127:0] io_sram4_wdata,
    input  [127:0] io_sram4_rdata,
    output [  5:0] io_sram5_addr,
    output         io_sram5_cen,
    output         io_sram5_wen,
    output [127:0] io_sram5_wmask,
    output [127:0] io_sram5_wdata,
    input  [127:0] io_sram5_rdata,
    output [  5:0] io_sram6_addr,
    output         io_sram6_cen,
    output         io_sram6_wen,
    output [127:0] io_sram6_wmask,
    output [127:0] io_sram6_wdata,
    input  [127:0] io_sram6_rdata,
    output [  5:0] io_sram7_addr,
    output         io_sram7_cen,
    output         io_sram7_wen,
    output [127:0] io_sram7_wmask,
    output [127:0] io_sram7_wdata,
    input  [127:0] io_sram7_rdata
);

    wire            uart_rx;
    wire            uart_tx;

    wire [3:0]      led;
    wire [3:0]      debug;
    

    darksocv cpu(
    .clock                   (clock               ),      
    .reset                   (reset             ),      
                                               
    .UART_RXD               (uart_rx           ),   
    .UART_TXD               (uart_tx           ),  
                                               
    .LED                    (led               ),       
    .DEBUG                  (debug             ),      
                                               
    .io_master_awready      (io_master_awready ),
    .io_master_awvalid      (io_master_awvalid ),
    .io_master_awaddr       (io_master_awaddr  ),
    .io_master_awid         (io_master_awid    ),
    .io_master_awlen        (io_master_awlen   ),
    .io_master_awsize       (io_master_awsize  ),
    .io_master_awburst      (io_master_awburst ),
                                               
    .io_master_wready       (io_master_wready  ),
    .io_master_wvalid       (io_master_wvalid  ),
    .io_master_wdata        (io_master_wdata   ),
    .io_master_wstrb        (io_master_wstrb   ),
    .io_master_wlast        (io_master_wlast   ),
                                               
    .io_master_bready       (io_master_bready  ),
    .io_master_bvalid       (io_master_bvalid  ),
    .io_master_bresp        (io_master_bresp   ),
    .io_master_bid          (io_master_bid     ),
                                               
    .io_master_arready      (io_master_arready ),
    .io_master_arvalid      (io_master_arvalid ),
    .io_master_araddr       (io_master_araddr  ),
    .io_master_arid         (io_master_arid    ),
    .io_master_arlen        (io_master_arlen   ),
    .io_master_arsize       (io_master_arsize  ),
    .io_master_arburst      (io_master_arburst ),                  
    .io_master_rready       (io_master_rready  ),
    .io_master_rvalid       (io_master_rvalid  ),
    .io_master_rresp        (io_master_rresp   ),
    .io_master_rdata        (io_master_rdata   ),
    .io_master_rlast        (io_master_rlast   ),
    .io_master_rid          (io_master_rid     ) 
    );



endmodule

module darksocv
(
    input        clock,      // external clock
    input        reset,      // external reset

    input        io_interrupt,
    
    input        UART_RXD,  // UART receive line
    output       UART_TXD,  // UART transmit line

    output [3:0] LED,       // on-board leds
    output [3:0] DEBUG ,     // osciloscope

    input        io_master_awready,
    output       io_master_awvalid,
    output [31:0]io_master_awaddr,
    output [3:0] io_master_awid,
    output [7:0] io_master_awlen,
    output [2:0] io_master_awsize,
    output [1:0] io_master_awburst,
   
 
    input        io_master_wready,
    output       io_master_wvalid,
    output [63:0]io_master_wdata,
    output [7:0] io_master_wstrb,
    output       io_master_wlast,
 
    output       io_master_bready,
    input        io_master_bvalid,
    input  [1:0] io_master_bresp,
    input  [3:0] io_master_bid,

    input        io_master_arready,
    output       io_master_arvalid,
    output [31:0]io_master_araddr,
    output [3:0] io_master_arid,
    output [7:0] io_master_arlen,
    output [2:0] io_master_arsize,
    output [1:0] io_master_arburst,
    
    output       io_master_rready,
    input        io_master_rvalid,
    input  [1:0] io_master_rresp,
    input  [63:0]io_master_rdata,
    input        io_master_rlast,
    input  [3:0] io_master_rid,
    
    
    
    output        io_slave_awready,
    input         io_slave_awvalid,
    input  [31:0] io_slave_awaddr,
    input  [ 3:0] io_slave_awid,
    input  [ 7:0] io_slave_awlen,
    input  [ 2:0] io_slave_awsize,
    input  [ 1:0] io_slave_awburst,

    output        io_slave_wready,
    input         io_slave_wvalid,
    input  [63:0] io_slave_wdata,
    input  [ 7:0] io_slave_wstrb,
    input         io_slave_wlast,

    input        io_slave_bready,
    output       io_slave_bvalid,
    output [1:0] io_slave_bresp,
    output [3:0] io_slave_bid,

    output        io_slave_arready,
    input         io_slave_arvalid,
    input  [31:0] io_slave_araddr,
    input  [ 3:0] io_slave_arid,
    input  [ 7:0] io_slave_arlen,
    input  [ 2:0] io_slave_arsize,
    input  [ 1:0] io_slave_arburst,

    input         io_slave_rready,
    output        io_slave_rvalid,
    output [ 1:0] io_slave_rresp,
    output [63:0] io_slave_rdata,
    output        io_slave_rlast,
    output [ 3:0] io_slave_rid,
    
    
     output [  5:0] io_sram0_addr,
    output         io_sram0_cen,
    output         io_sram0_wen,
    output [127:0] io_sram0_wmask,
    output [127:0] io_sram0_wdata,
    input  [127:0] io_sram0_rdata,

    output [  5:0] io_sram1_addr,
    output         io_sram1_cen,
    output         io_sram1_wen,
    output [127:0] io_sram1_wmask,
    output [127:0] io_sram1_wdata,
    input  [127:0] io_sram1_rdata,

    output [  5:0] io_sram2_addr,
    output         io_sram2_cen,
    output         io_sram2_wen,
    output [127:0] io_sram2_wmask,
    output [127:0] io_sram2_wdata,
    input  [127:0] io_sram2_rdata,
    output [  5:0] io_sram3_addr,
    output         io_sram3_cen,
    output         io_sram3_wen,
    output [127:0] io_sram3_wmask,
    output [127:0] io_sram3_wdata,
    input  [127:0] io_sram3_rdata,
    output [  5:0] io_sram4_addr,
    output         io_sram4_cen,
    output         io_sram4_wen,
    output [127:0] io_sram4_wmask,
    output [127:0] io_sram4_wdata,
    input  [127:0] io_sram4_rdata,
    output [  5:0] io_sram5_addr,
    output         io_sram5_cen,
    output         io_sram5_wen,
    output [127:0] io_sram5_wmask,
    output [127:0] io_sram5_wdata,
    input  [127:0] io_sram5_rdata,
    output [  5:0] io_sram6_addr,
    output         io_sram6_cen,
    output         io_sram6_wen,
    output [127:0] io_sram6_wmask,
    output [127:0] io_sram6_wdata,
    input  [127:0] io_sram6_rdata,
    output [  5:0] io_sram7_addr,
    output         io_sram7_cen,
    output         io_sram7_wen,
    output [127:0] io_sram7_wmask,
    output [127:0] io_sram7_wdata,
    input  [127:0] io_sram7_rdata

);


	wire RES = reset;
    // ro/rw memories

`ifdef __HARVARD__

    reg [31:0] ROM [0:2**`MLEN/4-1]; // ro memory
    reg [31:0] RAM [0:2**`MLEN/4-1]; // rw memory

    // memory initialization

    integer i;
    initial
    begin
        for(i=0;i!=2**`MLEN/4;i=i+1)
        begin
            ROM[i] = 32'd0;
            RAM[i] = 32'd0;
        end

        // workaround for vivado: no path in simulation and .mem extension

`ifdef XILINX_SIMULATOR
        $readmemh("darksocv.rom.mem",ROM);
        $readmemh("darksocv.ram.mem",RAM);
`else
        $readmemh("../src/darksocv.rom.mem",ROM);
        $readmemh("../src/darksocv.ram.mem",RAM);
`endif
    end

`else

    reg [31:0] MEM [0:2**`MLEN/4-1]; // ro memory

    // memory initialization

    integer i;
    initial
    begin
/*        for(i=0;i!=2**`MLEN/4;i=i+1)
        begin
            MEM[i] = 32'd0;
        end*/

        // workaround for vivado: no path in simulation and .mem extension

    end

`endif

    // darkriscv bus interface

    wire [31:0] IADDR;
    wire [31:0] DADDR;
    wire [31:0] IDATA;
    wire [31:0] DATAO;
    wire [31:0] DATAI;
    wire        WR,RD;
    wire [3:0]  BE;

    wire [31:0] DATAO_mux;
    wire [31:0] DATAI_mux;
    wire        WR_mux,RD_mux;
    wire [3:0]  BE_mux;

`ifdef __FLEXBUZZ__
    wire [31:0] XATAO;
    wire [31:0] XATAI;
    wire [ 2:0] DLEN;
    wire        RW;


`endif

    wire [31:0] IOMUX [0:4];

    reg  [15:0] GPIOFF = 0;
    reg  [15:0] LEDFF  = 0;

    wire HLT;

`ifdef __ICACHE__

    // instruction cache

    reg  [55:0] ICACHE [0:63]; // instruction cache
    reg  [63:0] ITAG = 0;      // instruction cache tag

    wire [5:0]  IPTR    = IADDR[7:2];
    wire [55:0] ICACHEO = ICACHE[IPTR];
    wire [31:0] ICACHED = ICACHEO[31: 0]; // data
    wire [31:8] ICACHEA = ICACHEO[55:32]; // address

    wire IHIT = ITAG[IPTR] && ICACHEA==IADDR[31:8];

    reg [31:0] ROMFF;
    wire [31:0] icache_addr_o = IADDR;
    wire icache_read_ready_o = !IHIT;
    wire icache_valid_i;
    wire [31:0] icache_data_i;

    always@(posedge clock)
    begin
    `ifdef __HARVARD__
        ROMFF <= ROM[IADDR[`MLEN-1:2]];
    `else
        ROMFF <= MEM[IADDR[`MLEN-1:2]];
    `endif
        
        if(!IHIT)
        begin
            if(icache_valid_i) begin
                ICACHE[IPTR] <= { IADDR[31:8], icache_data_i };
                ITAG[IPTR]    <= 1;
            end
        end
    end

    reg [31:0] idata_reg;
    always @(posedge clock) begin
    	if(RES) begin
    		idata_reg <= 32'd0;
    	end
    	else if(~HLT) begin
    		idata_reg <= ICACHED;
    	end
    end

    assign IDATA = idata_reg;

`else

    reg [31:0] ROMFF;

`ifdef __WAITSTATES__

    reg [1:0] IHITACK = 0;

    wire IHIT = !(IHITACK!=1);

    always@(posedge clock) // stage #1.0
    begin
        IHITACK <= RES ? 1 : IHITACK ? IHITACK-1 : 1; // wait-states
    end
`else

    wire IHIT = 1;

`endif


`ifdef __3STAGE__

    reg [31:0] ROMFF2 = 0;
    reg        HLT2   = 0;

    always@(posedge clock) // stage #0.5
    begin
        if(HLT^HLT2)
        begin
            ROMFF2 <= ROMFF;
        end

        HLT2 <= HLT;
    end

    assign IDATA = HLT2 ? ROMFF2 : ROMFF;
`else
    assign IDATA = ROMFF;
`endif

    always@(posedge clock) // stage #0.5
    begin
`ifdef __HARVARD__
        ROMFF <= ROM[IADDR[`MLEN-1:2]];
`else
        ROMFF <= MEM[IADDR[`MLEN-1:2]];
`endif
    end

    //assign IDATA = ROM[IADDR[`MLEN-1:2]];

//    always@(posedge clock)
//    begin
//        // weird bug appears to be related to the "sw ra,12(sp)" instruction.
//        if(WR==0&&DADDR[12]==0)
//        begin
//            ROMBUG <= IADDR;
//        end
//    end

//    assign IDATA = ROMFF;

`endif

`ifdef __DCACHE__

    // data cache

    reg  [55:0] DCACHE [0:63]; // data cache
    reg  [63:0] DTAG ;      // data cache tag
    reg  [63:0] WTAG ;

    wire [5:0]  DPTR    = DADDR[7:2];
    wire [55:0] DCACHEO = DCACHE[DPTR];
    wire [31:0] DCACHED = DCACHEO[31: 0]; // data
    wire [31:8] DCACHEA = DCACHEO[55:32]; // address

    wire DHIT = RD/*&&DADDR[`MLEN-1]*/ ? DTAG[DPTR] && DCACHEA==DADDR[31:8] : 1;
    wire WHIT = WR/*&&DADDR[`MLEN-1]*/ ? DTAG[DPTR] && DCACHEA==DADDR[31:8] : 1;

    reg [31:0] RAMFF;


    wire        dcache_read_valid_i;
    wire        dcache_write_valid_i;
    wire [31:0] dcache_data_i;
    wire [31:0] dcache_data_o = DCACHED;
    wire [31:0] dcache_addr_read_o = {DADDR[31:2],2'd0};
    wire [31:0] dcache_addr_write_o = {DCACHEA,DPTR,2'd0};

    reg dcache_read_ready_o;
    reg dcache_write_ready_o;
    reg dcache_write_ready_whit_o;
    reg dcache_read_ready_whit_o;

    reg [1:0] cache_state;
    always @(posedge clock) begin
        if(RES) begin
            cache_state <= 2'd0;  //free state
            dcache_write_ready_whit_o <= 1'd0;
            dcache_read_ready_whit_o <= 1'd0;
        end
        else if(((!WHIT && cache_state == 2'd0) || (!DHIT && cache_state == 2'd0) ) && WTAG[DPTR]  ) begin
            cache_state <= 2'd1;  //wait state
            dcache_write_ready_whit_o <= 1'd1;
            dcache_read_ready_whit_o <= 1'd1;
        end
        else if(((!WHIT && cache_state == 2'd0) || (!DHIT && cache_state == 2'd0) ) && ~WTAG[DPTR] ) begin
            cache_state <= 2'd3;  //wait state
            dcache_write_ready_whit_o <= 1'd0;
            dcache_read_ready_whit_o <= 1'd1;
        end
        else if(cache_state == 2'd1) begin
            if(dcache_read_valid_i) begin
                dcache_read_ready_whit_o <= 1'd0;
            end
            if(dcache_write_valid_i) begin
                dcache_write_ready_whit_o <= 1'd0;
            end
            if(!dcache_read_ready_whit_o && !dcache_write_ready_whit_o) begin
                cache_state <= 2'd0;
            end
        end
        else if(cache_state == 2'd3) begin
            if(dcache_read_valid_i) begin
                dcache_read_ready_whit_o <= 1'd0;
            end
            if(!dcache_read_ready_whit_o ) begin
                cache_state <= 2'd0;
            end
        end
    end


    always@(posedge clock)
    begin
    `ifdef __HARVARD__
        RAMFF <= RAM[DADDR[`MLEN-1:2]];
    `else
        RAMFF <= MEM[DADDR[`MLEN-1:2]];
    `endif

        if(reset)
        begin
            for(int i=0;i<64;i++) begin
                DCACHE[i] <= 0;
            end
            DTAG <= 64'd0;
            WTAG <= 64'd0;
        end
        else if(WHIT && WR) begin
            DCACHE[DPTR][0 * 8 + 7: 0 * 8] <= BE[0] ? DATAO[0 * 8 + 7: 0 * 8] : DCACHE[DPTR][0 * 8 + 7: 0 * 8];
            DCACHE[DPTR][1 * 8 + 7: 1 * 8] <= BE[1] ? DATAO[1 * 8 + 7: 1 * 8] : DCACHE[DPTR][1 * 8 + 7: 1 * 8];
            DCACHE[DPTR][2 * 8 + 7: 2 * 8] <= BE[2] ? DATAO[2 * 8 + 7: 2 * 8] : DCACHE[DPTR][2 * 8 + 7: 2 * 8];
            DCACHE[DPTR][3 * 8 + 7: 3 * 8] <= BE[3] ? DATAO[3 * 8 + 7: 3 * 8] : DCACHE[DPTR][3 * 8 + 7: 3 * 8];
            WTAG[DPTR] <= 1'd1;
        end
        if(!WHIT)
        begin
            //individual byte/word/long selection, thanks to HYF!
            if(dcache_read_valid_i) begin
                DCACHE[DPTR][0 * 8 + 7: 0 * 8] <= BE[0] ? DATAO[0 * 8 + 7: 0 * 8] : dcache_data_i[0 * 8 + 7: 0 * 8];
                DCACHE[DPTR][1 * 8 + 7: 1 * 8] <= BE[1] ? DATAO[1 * 8 + 7: 1 * 8] : dcache_data_i[1 * 8 + 7: 1 * 8];
                DCACHE[DPTR][2 * 8 + 7: 2 * 8] <= BE[2] ? DATAO[2 * 8 + 7: 2 * 8] : dcache_data_i[2 * 8 + 7: 2 * 8];
                DCACHE[DPTR][3 * 8 + 7: 3 * 8] <= BE[3] ? DATAO[3 * 8 + 7: 3 * 8] : dcache_data_i[3 * 8 + 7: 3 * 8];

                DCACHE[DPTR][55:32] <= DADDR[31:8];
                WTAG[DPTR] <= 1'd1;
                DTAG[DPTR]   <= 1; // cached!

            end
        end
        else
        if(!DHIT)
        begin
            if(dcache_read_valid_i) begin
                DCACHE[DPTR] <= { DADDR[31:8], dcache_data_i };
                DTAG[DPTR]   <= 1; // cached!
                WTAG[DPTR]   <= 1'd0;
            end
        end
    end

    assign DATAI =  DCACHED;

`else

    // no cache!

    `ifdef __FLEXBUZZ__

    // must work just exactly as the default interface, since we have no
    // flexbuzz devices available yet (i.e., all devices are 32-bit now)

    assign XATAI = DLEN[0] ? ( DADDR[1:0]==3 ? DATAI[31:24] :
                               DADDR[1:0]==2 ? DATAI[23:16] :
                               DADDR[1:0]==1 ? DATAI[15: 8] :
                                               DATAI[ 7: 0] ):
                   DLEN[1] ? ( DADDR[1]==1   ? DATAI[31:16] :
                                               DATAI[15: 0] ):
                                               DATAI;

    assign DATAO = DLEN[0] ? ( DADDR[1:0]==3 ? {        XATAO[ 7: 0], 24'hx } :
                               DADDR[1:0]==2 ? {  8'hx, XATAO[ 7: 0], 16'hx } :
                               DADDR[1:0]==1 ? { 16'hx, XATAO[ 7: 0],  8'hx } :
                                               { 24'hx, XATAO[ 7: 0]        } ):
                   DLEN[1] ? ( DADDR[1]==1   ? { XATAO[15: 0], 16'hx } :
                                               { 16'hx, XATAO[15: 0] } ):
                                                 XATAO;

    assign RD = DLEN&&RW==1;
    assign WR = DLEN&&RW==0;

    assign BE =    DLEN[0] ? ( DADDR[1:0]==3 ? 4'b1000 : // 8-bit
                               DADDR[1:0]==2 ? 4'b0100 :
                               DADDR[1:0]==1 ? 4'b0010 :
                                               4'b0001 ) :
                   DLEN[1] ? ( DADDR[1]==1   ? 4'b1100 : // 16-bit
                                               4'b0011 ) :
                                               4'b1111;  // 32-bit

    `endif

    reg [31:0] RAMFF;
`ifdef __WAITSTATES__

    reg [1:0] DACK = 0;

    wire WHIT = 1;
    wire DHIT = !((WR||RD) && DACK!=1);

    always@(posedge clock) // stage #1.0
    begin
        DACK <= RES ? 0 : DACK ? DACK-1 : (RD||WR) ? 1 : 0; // wait-states
    end

`elsif __3STAGE__

    // for single phase clock: 1 wait state in read op always required!

    reg [1:0] DACK = 0;

    wire WHIT = 1;
    wire DHIT = !((RD
            `ifdef __RMW_CYCLE__
                    ||WR		// worst code ever! but it is 3:12am...
            `endif
                    ) && DACK!=1); // the WR operatio does not need ws. in this config.

    always@(posedge clock) // stage #1.0
    begin
        DACK <= RES ? 0 : DACK ? DACK-1 : (RD
            `ifdef __RMW_CYCLE__
                    ||WR		// 2nd worst code ever!
            `endif
                    ) ? 1 : 0; // wait-states
    end

`else

    // for dual phase clock: 0 wait state

    wire WHIT = 1;
    wire DHIT = 1;

`endif

    always@(posedge clock) // stage #1.5
    begin
`ifdef __HARVARD__
        RAMFF <= RAM[DADDR[`MLEN-1:2]];
`else
        RAMFF <= MEM[DADDR[`MLEN-1:2]];
`endif
    end

    //assign DATAI = DADDR[31] ? IOMUX  : RAM[DADDR[`MLEN-1:2]];

    reg [31:0] IOMUXFF = 0;
    reg [31:0] XADDR   = 0;

    //individual byte/word/long selection, thanks to HYF!

    always@(posedge clock)
    begin

`ifdef __RMW_CYCLE__

        // read-modify-write operation w/ 1 wait-state:

        if(!HLT&&WR==0/*&&DADDR[`MLEN-1]==1*/)
        begin
    `ifdef __HARVARD__
            RAM[DADDR[`MLEN-1:2]] <=
    `else
            MEM[DADDR[`MLEN-1:2]] <=
    `endif
                                {
                                    BE[3] ? DATAO[3 * 8 + 7: 3 * 8] : RAMFF[3 * 8 + 7: 3 * 8],
                                    BE[2] ? DATAO[2 * 8 + 7: 2 * 8] : RAMFF[2 * 8 + 7: 2 * 8],
                                    BE[1] ? DATAO[1 * 8 + 7: 1 * 8] : RAMFF[1 * 8 + 7: 1 * 8],
                                    BE[0] ? DATAO[0 * 8 + 7: 0 * 8] : RAMFF[0 * 8 + 7: 0 * 8]
                                };
        end

`else
        // write-only operation w/ 0 wait-states:
    `ifdef __HARVARD__
        if(!HLT&&WR==0&&/*DADDR[`MLEN-1]==1&&*/BE[3]) RAM[DADDR[`MLEN-1:2]][3 * 8 + 7: 3 * 8] <= DATAO[3 * 8 + 7: 3 * 8];
        if(!HLT&&WR==0&&/*DADDR[`MLEN-1]==1&&*/BE[2]) RAM[DADDR[`MLEN-1:2]][2 * 8 + 7: 2 * 8] <= DATAO[2 * 8 + 7: 2 * 8];
        if(!HLT&&WR==0&&/*DADDR[`MLEN-1]==1&&*/BE[1]) RAM[DADDR[`MLEN-1:2]][1 * 8 + 7: 1 * 8] <= DATAO[1 * 8 + 7: 1 * 8];
        if(!HLT&&WR==0&&/*DADDR[`MLEN-1]==1&&*/BE[0]) RAM[DADDR[`MLEN-1:2]][0 * 8 + 7: 0 * 8] <= DATAO[0 * 8 + 7: 0 * 8];
    `else
        if(!HLT&&WR==0&&/*DADDR[`MLEN-1]==1&&*/BE[3]) MEM[DADDR[`MLEN-1:2]][3 * 8 + 7: 3 * 8] <= DATAO[3 * 8 + 7: 3 * 8];
        if(!HLT&&WR==0&&/*DADDR[`MLEN-1]==1&&*/BE[2]) MEM[DADDR[`MLEN-1:2]][2 * 8 + 7: 2 * 8] <= DATAO[2 * 8 + 7: 2 * 8];
        if(!HLT&&WR==0&&/*DADDR[`MLEN-1]==1&&*/BE[1]) MEM[DADDR[`MLEN-1:2]][1 * 8 + 7: 1 * 8] <= DATAO[1 * 8 + 7: 1 * 8];
        if(!HLT&&WR==0&&/*DADDR[`MLEN-1]==1&&*/BE[0]) MEM[DADDR[`MLEN-1:2]][0 * 8 + 7: 0 * 8] <= DATAO[0 * 8 + 7: 0 * 8];
    `endif
`endif

        XADDR <= DADDR; // 1 clock delayed
        IOMUXFF <= IOMUX[DADDR[4:2]==3'b100 ? 3'b100 : DADDR[3:2]]; // read w/ 2 wait-states
    end

    //assign DATAI = DADDR[31] ? IOMUX[DADDR[3:2]]  : RAMFF;
    //assign DATAI = DADDR[31] ? IOMUXFF : RAMFF;
    assign DATAI = XADDR[31] ? IOMUX[XADDR[4:2]==3'b100 ? 3'b100 : XADDR[3:2]] : RAMFF;

`endif

    // time interrupt


    reg [31:0] TIMERFF = 0;
    reg [31:0] TIMER = 0;
    reg [63:0] MTIME = 0;
    reg [63:0] MTIMECMP = 0;

`ifdef __THREADS__
    wire [`__THREADS__-1:0] TPTR;
    wire   [7:0] CORE_ID = TPTR;                    // core id
`else
    wire   [7:0] CORE_ID = 0;                       // core id
`endif


    wire mtime_low_en = DADDR == 32'h200bff8;
    wire mtime_high_en = DADDR == 32'h200bffc;
    wire mtimecmp_low_en  =  DADDR == 32'h2004000;
    wire mtimecmp_high_en =  DADDR == 32'h2004004;
    wire mtimecmp_en      =  mtimecmp_low_en | mtimecmp_high_en;
    wire mtime_en  	   =  mtime_low_en    | mtime_high_en;
    
    
    reg XTIMER = 0;

    always@(posedge clock)
    begin
        if(RES) begin
            MTIME <= 64'd0;
            TIMERFF <= 3; // (`BOARD_CK/1000000)-1; // timer set to 1MHz by default
            MTIMECMP <= 64'd0;
        end
        else if(mtime_low_en && WR_mux)
        begin
            if(BE_mux[0]) MTIME[0 * 8 + 7: 0 * 8] <= DATAO[0 * 8 + 7: 0 * 8];
            if(BE_mux[1]) MTIME[1 * 8 + 7: 1 * 8] <= DATAO[1 * 8 + 7: 1 * 8];
            if(BE_mux[2]) MTIME[2 * 8 + 7: 2 * 8] <= DATAO[2 * 8 + 7: 2 * 8];
            if(BE_mux[3]) MTIME[3 * 8 + 7: 3 * 8] <= DATAO[3 * 8 + 7: 3 * 8];
        end 
       else if(mtime_high_en && WR_mux)
        begin
            if(BE_mux[0]) MTIME[4 * 8 + 7: 4 * 8] <= DATAO[0 * 8 + 7: 0 * 8];
            if(BE_mux[1]) MTIME[5 * 8 + 7: 5 * 8] <= DATAO[1 * 8 + 7: 1 * 8];
            if(BE_mux[2]) MTIME[6 * 8 + 7: 6 * 8] <= DATAO[2 * 8 + 7: 2 * 8];
            if(BE_mux[3]) MTIME[7 * 8 + 7: 7 * 8] <= DATAO[3 * 8 + 7: 3 * 8];
        end 
        else if(mtimecmp_low_en && WR_mux)
        begin
            if(BE_mux[0]) MTIMECMP[0 * 8 + 7: 0 * 8] <= DATAO[0 * 8 + 7: 0 * 8];
            if(BE_mux[1]) MTIMECMP[1 * 8 + 7: 1 * 8] <= DATAO[1 * 8 + 7: 1 * 8];
            if(BE_mux[2]) MTIMECMP[2 * 8 + 7: 2 * 8] <= DATAO[2 * 8 + 7: 2 * 8];
            if(BE_mux[3]) MTIMECMP[3 * 8 + 7: 3 * 8] <= DATAO[3 * 8 + 7: 3 * 8];
        end
        else if(mtimecmp_high_en && WR_mux)
        begin
            if(BE_mux[0]) MTIMECMP[4 * 8 + 7: 4 * 8] <= DATAO[0 * 8 + 7: 0 * 8];
            if(BE_mux[1]) MTIMECMP[5 * 8 + 7: 5 * 8] <= DATAO[1 * 8 + 7: 1 * 8];
            if(BE_mux[2]) MTIMECMP[6 * 8 + 7: 6 * 8] <= DATAO[2 * 8 + 7: 2 * 8];
            if(BE_mux[3]) MTIMECMP[7 * 8 + 7: 7 * 8] <= DATAO[3 * 8 + 7: 3 * 8];        
        end
        if(TIMERFF)
        begin
            MTIME <= MTIME+1;
        end

        if(RES) begin
            TIMER <= 64'd0;
        end
        else if(TIMER == TIMERFF) begin
            TIMER <= 64'd0;
        end
        else 
            TIMER <= TIMER +64'd1;
    end

    assign BOARD_IRQ = (MTIME >= MTIMECMP) && MTIMECMP != 0;

    reg [31:0] uart_buffer;
    reg uart_received;

    always @(posedge clock) begin
        if(RES) begin
            uart_buffer <= 32'd0;
            uart_received <= 1'd0;
        end
        else if(uart_valid) begin
            uart_buffer[31:24] <= BE_mux[3] ? uart_data_i[31:24] :8'd0;
            uart_buffer[23:16] <= BE_mux[2] ? uart_data_i[23:16] :8'd0;
            uart_buffer[15:8] <= BE_mux[1] ? uart_data_i[15:8] :8'd0;
            uart_buffer[7:0] <= BE_mux[0] ? uart_data_i[7:0] :8'd0;

            uart_received <= 1'd1;
        end
        else if(~HLT) begin
            uart_received <= 1'd0;
        end
    end

    // darkuart

    wire [3:0] UDEBUG;

    wire FINISH_REQ;

    wire uart_en = DADDR >= 32'h1000_0000  && DADDR <= 32'h1000_0fff  && (WR_mux||RD_mux)  ;
    wire [3:0] uart_be = uart_en ? BE_mux : 4'd0; //high valid
    wire uart_wen = uart_en ? WR_mux : 1'd0;;
    wire uart_ready = uart_en && ~uart_received;
    wire [31:0]uart_addr = uart_en ? DADDR : 32'd0;
    wire [31:0] uart_data_o;
    wire uart_valid;
    wire [31:0] uart_data_i;

    assign uart_data_o = DATAO;

    assign HLT = !IHIT||!DHIT||!WHIT || uart_ready  || cache_state != 0;


    assign DATAI_mux =  mtime_low_en && ~WR_mux ? MTIME[31:0] :
    			    mtime_high_en && ~WR_mux ? MTIME[63:32] :
                        mtimecmp_low_en && ~WR_mux ? MTIMECMP[31:0] :
                        mtimecmp_high_en && ~WR_mux ? MTIMECMP[63:32] :
                        uart_en && ~WR_mux ? uart_buffer :
                        DATAI;
    assign WR = uart_en | mtime_en | mtimecmp_en ? 1'd0: WR_mux;
    assign RD = uart_en | mtime_en | mtimecmp_en ? 1'd0: RD_mux;
    assign BE = uart_en | mtime_en | mtimecmp_en ? 4'd0: BE_mux;

     
    // darkriscv

    wire [3:0] KDEBUG;

    wire IDLE;

    darkriscv
//    #(
//        .RESET_PC(32'h00000000),
//        .RESET_SP(32'h00002000)
//    )
    core0
    (
`ifdef __3STAGE__
        .clock(clock),
`elsif  __WAITSTATES__
        .clock(clock),
`else
        .clock(!clock),
`endif
        .RES(RES),
        .HLT(HLT),
`ifdef __THREADS__
        .TPTR(TPTR),
`endif
`ifdef __INTERRUPT__
        .INT(|BOARD_IRQ),
`endif
        .IDATA(IDATA),
        .IADDR(IADDR),
        .DADDR(DADDR),

`ifdef __FLEXBUZZ__
        .DATAI(XATAI),
        .DATAO(XATAO),
        .DLEN(DLEN),
        .RW(RW),
`else
        .DATAI(DATAI_mux),
        .DATAO(DATAO),
        .BE(BE_mux),
        .WR(WR_mux),
        .RD(RD_mux),
`endif

        .IDLE(IDLE),

        .DEBUG(KDEBUG)
    );

    assign LED   = LEDFF[3:0];

    assign DEBUG = { XTIMER, KDEBUG[2:0] }; // UDEBUG;

`ifdef SIMULATION

    `ifdef __PERFMETER__

        integer clocks=0, running=0, load=0, store=0, flush=0, halt=0;

    `ifdef __THREADS__
        integer thread[0:(2**`__THREADS__)-1],curtptr=0,cnttptr=0;
        integer j;

        initial for(j=0;j!=(2**`__THREADS__);j=j+1) thread[j] = 0;
    `endif

        always@(posedge clock)
        begin
            if(!RES)
            begin
                clocks = clocks+1;

                if(HLT)
                begin
                         if(WR)	store = store+1;
                    else if(RD)	load  = load +1;
                    else 		halt  = halt +1;
                end
                else
                if(IDLE)
                begin
                    flush=flush+1;
                end
                else
                begin

        `ifdef __THREADS__
                    for(j=0;j!=(2**`__THREADS__);j=j+1)
                            thread[j] = thread[j]+(j==TPTR?1:0);

                    if(TPTR!=curtptr)
                    begin
                        curtptr = TPTR;
                        cnttptr = cnttptr+1;
                    end
        `endif
                    running = running +1;
                end

                if(FINISH_REQ)
                begin
                    $display("****************************************************************************");
                    $display("DarkRISCV Pipeline Report (%0d clocks):",clocks);

                    $display("core0: %0d%% run, %0d%% wait (%0d%% i-bus, %0d%% d-bus/rd, %0d%% d-bus/wr), %0d%% idle",
                        100.0*running/clocks,
                        100.0*(load+store+halt)/clocks,
                        100.0*halt/clocks,
                        100.0*load/clocks,
                        100.0*store/clocks,
                        100.0*flush/clocks);

         `ifdef __THREADS__
                    for(j=0;j!=(2**`__THREADS__);j=j+1) $display("  thread%0d: %0d%% running",j,100.0*thread[j]/clocks);

                    $display("%0d thread switches, %0d clocks/threads",cnttptr,clocks/cnttptr);
         `endif
                    $display("****************************************************************************");
                    $finish();
                end
            end
        end
    `else
        always@(posedge clock) if(FINISH_REQ) $finish();
    `endif

`endif


    axi_top u_axi_top
    (
    .clock              (clock),
    .reset              (reset),
    //darksocv
    //icache-read
    .icache_ready_i     (icache_read_ready_o),
    .icache_addr_i      (icache_addr_o ),
    .icache_valid_o     (icache_valid_i),
    .icache_data_o      (icache_data_i ),
    //dcache-read
    .dcache_r_ready_i   (dcache_read_ready_whit_o),
    .dcache_r_addr_i     (dcache_addr_read_o  ),
    .dcache_r_valid_o   (dcache_read_valid_i ),
    .dcache_data_o      (dcache_data_i   ),
    //dcache-write
    .dcache_w_ready_i   (dcache_write_ready_whit_o ),
    .dcache_w_addr_i    (dcache_addr_write_o  ),
    .dcache_w_valid_o   (dcache_write_valid_i ),
    .dcache_data_i      (dcache_data_o    ),
    //memio
    .uart_data_i        (uart_data_o),
    .be                 (uart_be         ),
    .wen                (uart_wen        ),
    .valid              (uart_ready      ),
    .ready              (uart_valid      ),
    .addr               (uart_addr       ),
    .uart_data_o        (uart_data_i),

    .axi_aw_ready_i     (io_master_awready),
    .axi_aw_valid_o     (io_master_awvalid ),
    .axi_aw_addr_o      (io_master_awaddr  ),
    .axi_aw_id_o        (io_master_awid    ),
    .axi_aw_len_o       (io_master_awlen   ),
    .axi_aw_size_o      (io_master_awsize  ),
    .axi_aw_burst_o     (io_master_awburst ),

    .axi_w_ready_i      (io_master_wready),
    .axi_w_valid_o      (io_master_wvalid  ),
    .axi_w_data_o       (io_master_wdata   ),
    .axi_w_strb_o       (io_master_wstrb   ),
    .axi_w_last_o       (io_master_wlast   ),
    
    .axi_b_ready_o      (io_master_bready  ),
    .axi_b_valid_i      (io_master_bvalid  ),
    .axi_b_resp_i       (io_master_bresp),
    .axi_b_id_i         (io_master_bid     ),

    .axi_ar_ready_i     (io_master_arready),
    .axi_ar_valid_o     (io_master_arvalid ),
    .axi_ar_addr_o      (io_master_araddr  ),
    .axi_ar_id_o        (io_master_arid    ),
    .axi_ar_len_o       (io_master_arlen   ),
    .axi_ar_size_o      (io_master_arsize  ),
    .axi_ar_burst_o     (io_master_arburst ),
    
    .axi_r_ready_o      (io_master_rready  ),
    .axi_r_valid_i      (io_master_rvalid  ),
    .axi_r_resp_i       (io_master_rresp),
    .axi_r_data_i       (io_master_rdata   ),
    .axi_r_last_i       (io_master_rlast   ),
    .axi_r_id_i         (io_master_rid     )
    );




endmodule


module darkriscv
//#(
//    parameter [31:0] RESET_PC = 0,
//    parameter [31:0] RESET_SP = 4096
//)
(
    input             clock,   // clock
    input             RES,   // reset
    input             HLT,   // halt

`ifdef __THREADS__
    output [`__THREADS__-1:0] TPTR,  // thread pointer
`endif

`ifdef __INTERRUPT__
    input             INT,   // interrupt request
`endif

    input      [31:0] IDATA, // instruction data bus
    output     [31:0] IADDR, // instruction addr bus

    input      [31:0] DATAI, // data bus (input)
    output     [31:0] DATAO, // data bus (output)
    output     [31:0] DADDR, // addr bus

`ifdef __FLEXBUZZ__
    output     [ 2:0] DLEN, // data length
    output            RW,   // data read/write
`else
    output     [ 3:0] BE,   // byte enable
    output            WR,    // write enable
    output            RD,    // read enable
`endif

    output            IDLE,   // idle output

    output [3:0]  DEBUG       // old-school osciloscope based debug! :)
);

    // dummy 32-bit words w/ all-0s and all-1s:
    wire CLK = clock;
    wire [31:0] ALL0  = 0;
    wire [31:0] ALL1  = -1;

`ifdef __THREADS__
    reg [`__THREADS__-1:0] XMODE = 0;     // thread ptr

    assign TPTR = XMODE;
`endif

    // pre-decode: IDATA is break apart as described in the RV32I specification

    reg [31:0] XIDATA;

    reg XLUI, XAUIPC, XJAL, XJALR, XBCC, XLCC, XSCC, XMCC, XRCC, XCUS, XRES=1, XCCC; //, XFCC, XCCC;

    reg [31:0] XSIMM;
    reg [31:0] XUIMM;




    always@(posedge CLK)
    begin
        XIDATA <= XRES ? 0 : HLT ? XIDATA : IDATA;

        XLUI   <= XRES ? 0 : HLT ? XLUI   : IDATA[6:0]==`LUI;
        XAUIPC <= XRES ? 0 : HLT ? XAUIPC : IDATA[6:0]==`AUIPC;
        XJAL   <= XRES ? 0 : HLT ? XJAL   : IDATA[6:0]==`JAL;
        XJALR  <= XRES ? 0 : HLT ? XJALR  : IDATA[6:0]==`JALR;

        XBCC   <= XRES ? 0 : HLT ? XBCC   : IDATA[6:0]==`BCC;
        XLCC   <= XRES ? 0 : HLT ? XLCC   : IDATA[6:0]==`LCC;
        XSCC   <= XRES ? 0 : HLT ? XSCC   : IDATA[6:0]==`SCC;
        XMCC   <= XRES ? 0 : HLT ? XMCC   : IDATA[6:0]==`MCC;

        XRCC   <= XRES ? 0 : HLT ? XRCC   : IDATA[6:0]==`RCC;
        XCUS   <= XRES ? 0 : HLT ? XRCC   : IDATA[6:0]==`CUS;
        //XFCC   <= XRES ? 0 : HLT ? XFCC   : IDATA[6:0]==`FCC;
        XCCC   <= XRES ? 0 : HLT ? XCCC   : IDATA[6:0]==`CCC;
        
        // signal extended immediate, according to the instruction type:

        XSIMM  <= XRES ? 0 : HLT ? XSIMM :
                 IDATA[6:0]==`SCC ? { IDATA[31] ? ALL1[31:12]:ALL0[31:12], IDATA[31:25],IDATA[11:7] } : // s-type
                 IDATA[6:0]==`BCC ? { IDATA[31] ? ALL1[31:13]:ALL0[31:13], IDATA[31],IDATA[7],IDATA[30:25],IDATA[11:8],ALL0[0] } : // b-type
                 IDATA[6:0]==`JAL ? { IDATA[31] ? ALL1[31:21]:ALL0[31:21], IDATA[31], IDATA[19:12], IDATA[20], IDATA[30:21], ALL0[0] } : // j-type
                 IDATA[6:0]==`LUI||
                 IDATA[6:0]==`AUIPC ? { IDATA[31:12], ALL0[11:0] } : // u-type
                                      { IDATA[31] ? ALL1[31:12]:ALL0[31:12], IDATA[31:20] }; // i-type
        // non-signal extended immediate, according to the instruction type:

        XUIMM  <= XRES ? 0: HLT ? XUIMM :
                 IDATA[6:0]==`SCC ? { ALL0[31:12], IDATA[31:25],IDATA[11:7] } : // s-type
                 IDATA[6:0]==`BCC ? { ALL0[31:13], IDATA[31],IDATA[7],IDATA[30:25],IDATA[11:8],ALL0[0] } : // b-type
                 IDATA[6:0]==`JAL ? { ALL0[31:21], IDATA[31], IDATA[19:12], IDATA[20], IDATA[30:21], ALL0[0] } : // j-type
                 IDATA[6:0]==`LUI||
                 IDATA[6:0]==`AUIPC ? { IDATA[31:12], ALL0[11:0] } : // u-type
                                      { ALL0[31:12], IDATA[31:20] }; // i-type
    end

    // decode: after XIDATA
`ifdef __3STAGE__
    reg [1:0] FLUSH = -1;  // flush instruction pipeline
`else
    reg FLUSH = -1;  // flush instruction pipeline
`endif

`ifdef __THREADS__
    `ifdef __RV32E__

        reg [`__THREADS__+3:0] RESMODE = -1;

        wire [`__THREADS__+3:0] DPTR   = XRES ? RESMODE : { XMODE, XIDATA[10: 7] }; // set SP_RESET when RES==1
        wire [`__THREADS__+3:0] S1PTR  = { XMODE, XIDATA[18:15] };
        wire [`__THREADS__+3:0] S2PTR  = { XMODE, XIDATA[23:20] };
    `else
        reg [`__THREADS__+4:0] RESMODE = -1;

        wire [`__THREADS__+4:0] DPTR   = XRES ? RESMODE : { XMODE, XIDATA[11: 7] }; // set SP_RESET when RES==1
        wire [`__THREADS__+4:0] S1PTR  = { XMODE, XIDATA[19:15] };
        wire [`__THREADS__+4:0] S2PTR  = { XMODE, XIDATA[24:20] };
    `endif
`else
    `ifdef __RV32E__

        reg [3:0] RESMODE = -1;

        wire [3:0] DPTR   = XRES ? RESMODE : XIDATA[10: 7]; // set SP_RESET when RES==1
        wire [3:0] S1PTR  = XIDATA[18:15];
        wire [3:0] S2PTR  = XIDATA[23:20];
    `else
        reg [4:0] RESMODE = -1;

        wire [4:0] DPTR   = XRES ? RESMODE : XIDATA[11: 7]; // set SP_RESET when RES==1
        wire [4:0] S1PTR  = XIDATA[19:15];
        wire [4:0] S2PTR  = XIDATA[24:20];
    `endif
`endif

    wire [6:0] OPCODE = FLUSH ? 0 : XIDATA[6:0];
    wire [2:0] FCT3   = XIDATA[14:12];
    wire [6:0] FCT7   = XIDATA[31:25];

    wire [31:0] SIMM  = XSIMM;
    wire [31:0] UIMM  = XUIMM;

    // main opcode decoder:

    wire    LUI = FLUSH|raise_hard_intr ? 0 : XLUI;   // OPCODE==7'b0110111;
    wire  AUIPC = FLUSH|raise_hard_intr ? 0 : XAUIPC; // OPCODE==7'b0010111;
    wire    JAL = FLUSH|raise_hard_intr ? 0 : XJAL;   // OPCODE==7'b1101111;
    wire   JALR = FLUSH|raise_hard_intr ? 0 : XJALR;  // OPCODE==7'b1100111;

    wire    BCC = FLUSH|raise_hard_intr ? 0 : XBCC; // OPCODE==7'b1100011; //FCT3
    wire    LCC = FLUSH|raise_hard_intr ? 0 : XLCC; // OPCODE==7'b0000011; //FCT3
    wire    SCC = FLUSH|raise_hard_intr ? 0 : XSCC; // OPCODE==7'b0100011; //FCT3
    wire    MCC = FLUSH|raise_hard_intr ? 0 : XMCC; // OPCODE==7'b0010011; //FCT3

    wire    RCC = FLUSH|raise_hard_intr ? 0 : XRCC; // OPCODE==7'b0110011; //FCT3
    wire    CUS = FLUSH|raise_hard_intr ? 0 : XCUS; // OPCODE==7'b0110011; //FCT3
    //wire    FCC = FLUSH ? 0 : XFCC; // OPCODE==7'b0001111; //FCT3
    wire    CCC = FLUSH|raise_hard_intr ? 0 : XCCC; // OPCODE==7'b1110011; //FCT3

    wire op_csrrw      =   FLUSH|raise_hard_intr ? 0 :  OPCODE == 7'b11100_11 && FCT3 == 3'b001;                              //32'bxxxxxxx_xxxxx_xxxxx_001_xxxxx_11100_11;
    wire op_csrrs      =   FLUSH|raise_hard_intr ? 0 :  OPCODE == 7'b11100_11 && FCT3 == 3'b010;                              //32'bxxxxxxx_xxxxx_xxxxx_010_xxxxx_11100_11;
    wire op_csrrc      =   FLUSH|raise_hard_intr ? 0 :  OPCODE == 7'b11100_11 && FCT3 == 3'b011;                              //32'bxxxxxxx_xxxxx_xxxxx_011_xxxxx_11100_11;
    wire op_csrrwi     =   FLUSH|raise_hard_intr ? 0 :  OPCODE == 7'b11100_11 && FCT3 == 3'b101;                              //32'bxxxxxxx_xxxxx_xxxxx_101_xxxxx_11100_11;
    wire op_csrrsi     =   FLUSH|raise_hard_intr ? 0 :  OPCODE == 7'b11100_11 && FCT3 == 3'b110;                              //32'bxxxxxxx_xxxxx_xxxxx_110_xxxxx_11100_11;
    wire op_csrrci     =   FLUSH|raise_hard_intr ? 0 :  OPCODE == 7'b11100_11 && FCT3 == 3'b111;                              //32'bxxxxxxx_xxxxx_xxxxx_111_xxxxx_11100_11;
    wire op_mert       =   FLUSH|raise_hard_intr ? 0 :  XIDATA == 32'b0011000_00010_00000_000_00000_11100_11;
    wire op_ecall      =   FLUSH|raise_hard_intr ? 0 :  XIDATA == 32'b00000000000000000000000001110011;



  wire [11:0] csr_reg_addr_i;
  wire csr_reg_read_i;
  wire csr_reg_write_i;
  wire csr_reg_set_i;
  wire csr_reg_clear_i;
  wire [31:0] csr_reg_wdata_i;
  wire [31:0] csr_reg_rdata_o;
  wire csr_reg_raise_intr_i;
  wire mtip_clear;
  wire msip_i;
  wire msip_valid_i;
  wire msip_o;
  wire tim_intr;
  wire csr_reg_op_mret_i;
  wire csr_mie_rdata_o;
  wire [31:0] csr_reg_mepc_rdata_o;
  wire csr_reg_mepc_write_i;
  wire [31:0] csr_reg_mepc_wdata_i;
  wire  csr_reg_mcause_write_i;
  wire [31:0] csr_reg_mcause_wdata_i;
  wire  [31:0] csr_reg_mtvec_rdata_o;

    CSRsFile inst_CSRsFile(
    .clk              (CLK),
    .rst              (RES),
    .csr_addr         (csr_reg_addr_i),
    .csr_read         (csr_reg_read_i),
    .csr_write        (csr_reg_write_i),
    .csr_set          (csr_reg_set_i),
    .csr_clear        (csr_reg_clear_i),
    .csr_wdata        (csr_reg_wdata_i),
    .csr_rdata        (csr_reg_rdata_o),
    .raise_intr       (csr_reg_raise_intr_i),
    .tim_int_req      (INT),
    .mtip_clear       (mtip_clear),
    .msip_i           (msip_i),
    .msip_valid_i     (msip_valid_i),
    .msip_o           (msip_o),
    .mtip             (tim_intr),
    .op_mret          (csr_reg_op_mret_i),
    .csr_mie_rdata    (csr_mie_rdata_o),
    .csr_mepc_rdata   (csr_reg_mepc_rdata_o),
    .csr_mepc_write   (csr_reg_mepc_write_i),
    .csr_mepc_wdata   (csr_reg_mepc_wdata_i),
    .csr_mcause_write (csr_reg_mcause_write_i),
    .csr_mcause_wdata (csr_reg_mcause_wdata_i),
    .csr_mtvec_rdata  (csr_reg_mtvec_rdata_o)
  );

wire [31:0] csr_pc;
wire [31:0] csr_result;


csr_unit csr_unit(

    .op( {op_csrrw,op_csrrs,op_csrrc,op_csrrwi,op_csrrsi,op_csrrci,op_mert,op_ecall}),
    .src1(U1REG),
    .src2(U2REG),
    .imm({{20{XIDATA[31]}},XIDATA[31:20]}),
    .pc_i(PC),

    .dest(DPTR),
    .rs1(S1PTR),

    .unsupport_op(1'b0),
    .ex_intr(tim_intr),
    .csr_mie_rdata(csr_mie_rdata_o),
//normal csr r/w port
    .csr_addr(csr_reg_addr_i),
    .csr_read(csr_reg_read_i),
    .csr_write(csr_reg_write_i),
    .csr_set(csr_reg_set_i),
    .csr_clear(csr_reg_clear_i),
    .csr_wdata(csr_reg_wdata_i),
    .csr_rdata(csr_reg_rdata_o),
//specific csr r/w port
    .raise_intr(csr_reg_raise_intr_i),
    .raise_hard_intr(raise_hard_intr),
    .op_mret(csr_reg_op_mret_i),
//CSR mepc
    .csr_mepc_rdata(csr_reg_mepc_rdata_o),
    .csr_mepc_write(csr_reg_mepc_write_i),
    .csr_mepc_wdata(csr_reg_mepc_wdata_i),
//CSR mcause
    .csr_mcause_write(csr_reg_mcause_write_i),
    .csr_mcause_wdata(csr_reg_mcause_wdata_i),
//CSR mtvec
    .csr_mtvec_rdata(csr_reg_mtvec_rdata_o),

    .pc_o(csr_pc),
    .pc_valid_o(csr_pc_valid),

    .res(csr_result),
    .valid_o(csr_valid_o)
);



`ifdef __THREADS__
    `ifdef __3STAGE__
        reg [31:0] NXPC2 [0:(2**`__THREADS__)-1];       // 32-bit program counter t+2
    `endif

    `ifdef __RV32E__
        reg [31:0] REGS [0:16*(2**`__THREADS__)-1];	// general-purpose 16x32-bit registers (s1)
    `else
        reg [31:0] REGS [0:32*(2**`__THREADS__)-1];	// general-purpose 32x32-bit registers (s1)
    `endif
`else
    `ifdef __3STAGE__
        reg [31:0] NXPC2;       // 32-bit program counter t+2
    `endif

    `ifdef __RV32E__
        reg [31:0] REGS [0:15];	// general-purpose 16x32-bit registers (s1)
    `else
        reg [31:0] REGS [0:31];	// general-purpose 32x32-bit registers (s1)
    `endif
`endif

    reg [31:0] NXPC;        // 32-bit program counter t+1
    reg [31:0] PC;		    // 32-bit program counter t+0

    // source-1 and source-1 register selection

    wire          [31:0] U1REG = REGS[S1PTR];
    wire          [31:0] U2REG = REGS[S2PTR];

    wire signed   [31:0] S1REG = U1REG;
    wire signed   [31:0] S2REG = U2REG;


    // L-group of instructions (OPCODE==7'b0000011)

`ifdef __FLEXBUZZ__

    wire [31:0] LDATA = FCT3[1:0]==0 ? { FCT3[2]==0&&DATAI[ 7] ? ALL1[31: 8]:ALL0[31: 8] , DATAI[ 7: 0] } :
                        FCT3[1:0]==1 ? { FCT3[2]==0&&DATAI[15] ? ALL1[31:16]:ALL0[31:16] , DATAI[15: 0] } :
                                        DATAI;
`else
    wire [31:0] LDATA = FCT3==0||FCT3==4 ? ( DADDR[1:0]==3 ? { FCT3==0&&DATAI[31] ? ALL1[31: 8]:ALL0[31: 8] , DATAI[31:24] } :
                                             DADDR[1:0]==2 ? { FCT3==0&&DATAI[23] ? ALL1[31: 8]:ALL0[31: 8] , DATAI[23:16] } :
                                             DADDR[1:0]==1 ? { FCT3==0&&DATAI[15] ? ALL1[31: 8]:ALL0[31: 8] , DATAI[15: 8] } :
                                                             { FCT3==0&&DATAI[ 7] ? ALL1[31: 8]:ALL0[31: 8] , DATAI[ 7: 0] } ):
                        FCT3==1||FCT3==5 ? ( DADDR[1]==1   ? { FCT3==1&&DATAI[31] ? ALL1[31:16]:ALL0[31:16] , DATAI[31:16] } :
                                                             { FCT3==1&&DATAI[15] ? ALL1[31:16]:ALL0[31:16] , DATAI[15: 0] } ) :
                                             DATAI;
`endif

    // S-group of instructions (OPCODE==7'b0100011)

`ifdef __FLEXBUZZ__

    wire [31:0] SDATA = U2REG; /* FCT3==0 ? { ALL0 [31: 8], U2REG[ 7:0] } :
                        FCT3==1 ? { ALL0 [31:16], U2REG[15:0] } :
                                    U2REG;*/
`else
    wire [31:0] SDATA = FCT3==0 ? ( DADDR[1:0]==3 ? { U2REG[ 7: 0], ALL0 [23:0] } :
                                    DADDR[1:0]==2 ? { ALL0 [31:24], U2REG[ 7:0], ALL0[15:0] } :
                                    DADDR[1:0]==1 ? { ALL0 [31:16], U2REG[ 7:0], ALL0[7:0] } :
                                                    { ALL0 [31: 8], U2REG[ 7:0] } ) :
                        FCT3==1 ? ( DADDR[1]==1   ? { U2REG[15: 0], ALL0 [15:0] } :
                                                    { ALL0 [31:16], U2REG[15:0] } ) :
                                    U2REG;
`endif

    // C-group: CSRRW

`ifdef __INTERRUPT__

    // reg [31:0] MSTATUS = 0;
    // reg [31:0] MCAUSE= 0;
    // reg [31:0] MEPC  = 0;
    // reg [31:0] MTVEC = 0;
    // reg        MIE   = 0;
    // reg        MIP   = 0;

    // wire [31:0] CDATA = XIDATA[31:20]==12'h344 ? MIP  : // machine interrupt pending
    //                     XIDATA[31:20]==12'h304 ? MIE   : // machine interrupt enable
    //                     XIDATA[31:20]==12'h341 ? MEPC  : // machine exception PC
    //                     XIDATA[31:20]==12'h305 ? MTVEC : // machine vector table
    //                     XIDATA[31:20]==12'h342 ? MCAUSE:
    //                     XIDATA[31:20]==12'h300 ? MSTATUS:
    //                                              0;	 // unknown

    // wire MRET = CCC && FCT3==0 && S2PTR==2;
    // wire CSRW = CCC && FCT3==1;
    // wire CSRR = CCC && FCT3==2;
`endif
    wire EBRK = CCC && FCT3==0 && S2PTR==1;
    wire ECALL = CCC && FCT3==0 && S2PTR==0;
    
    // RM-group of instructions (OPCODEs==7'b0010011/7'b0110011), merged! src=immediate(M)/register(R)

    wire signed [31:0] S2REGX = XMCC ? SIMM : S2REG;
    wire        [31:0] U2REGX = XMCC ? UIMM : U2REG;

    wire [31:0] RMDATA = FCT3==7 ? U1REG&S2REGX :
                         FCT3==6 ? U1REG|S2REGX :
                         FCT3==4 ? U1REG^S2REGX :
                         FCT3==3 ? U1REG<U2REGX?1:0 : // unsigned
                         FCT3==2 ? S1REG<S2REGX?1:0 : // signed
                         FCT3==0 ? (XRCC&&FCT7[5] ? U1REG-U2REGX : U1REG+S2REGX) :
                         FCT3==1 ? U1REG<<U2REGX[4:0] :
                         //FCT3==5 ?
                         !FCT7[5] ? U1REG>>U2REGX[4:0] :
`ifdef MODEL_TECH
                         FCT7[5] ? -((-U1REG)>>U2REGX[4:0]; // workaround for modelsim
`else
                                   $signed(S1REG>>>U2REGX[4:0]);  // (FCT7[5] ? U1REG>>>U2REG[4:0] :
`endif

`ifdef __MAC16X16__

    // MAC instruction rd += s1*s2 (OPCODE==7'b1111111)
    //
    // 0000000 01100 01011 100 01100 0110011 xor a2,a1,a2
    // 0000000 01010 01100 000 01010 0110011 add a0,a2,a0
    // 0000000 01100 01011 000 01010 0001011 mac a0,a1,a2
    //
    // 0000 0000 1100 0101 1000 0101 0000 1011 = 00c5850b

    wire MAC = CUS && FCT3==0;

    wire signed [15:0] K1TMP = S1REG[15:0];
    wire signed [15:0] K2TMP = S2REG[15:0];
    wire signed [31:0] KDATA = K1TMP*K2TMP;

`endif

    // J/B-group of instructions (OPCODE==7'b1100011)

    wire BMUX       = BCC==1 && (
                          FCT3==4 ? S1REG< S2REGX : // blt
                          FCT3==5 ? S1REG>=S2REG : // bge
                          FCT3==6 ? U1REG< U2REGX : // bltu
                          FCT3==7 ? U1REG>=U2REG : // bgeu
                          FCT3==0 ? !(U1REG^S2REGX) : //U1REG==U2REG : // beq
                          /*FCT3==1 ? */ U1REG^S2REGX); //U1REG!=U2REG); // bne
                                    //0);

    wire [31:0] PCSIMM = PC+SIMM;
    wire        JREQ = (JAL||JALR||BMUX);
    wire [31:0] JVAL = JALR ? DADDR : PCSIMM; // SIMM + (JALR ? U1REG : PC);



    always@(posedge CLK)
    begin
        RESMODE <= RES ? -1 : RESMODE ? RESMODE-1 : 0;

        XRES <= |RESMODE;

`ifdef __3STAGE__
	    FLUSH <= XRES ? 2 : HLT ? FLUSH :        // reset and halt
	                       FLUSH ? FLUSH-1 :
    `ifdef __INTERRUPT__
                            csr_pc_valid ? 2 :
    `endif
	                       JREQ ? 2 : 0;  // flush the pipeline!
`else
        FLUSH <= XRES ? 1 : HLT ? FLUSH :        // reset and halt
                       JREQ;  // flush the pipeline!
`endif
`ifdef __INTERRUPT__
        // if(XRES)
        // begin
        //     MTVEC <= 0;
        //     MEPC  <= 0;
        //     MIP   <= 0;
        //     MIE   <= 0;
        // end
        // else
        // if(MIP&&MIE&&JREQ)
        // begin
        //     MEPC <= JVAL;
        //     MIP  <= 1;
        //     MIE  <= 0;
        // end
        // else
        // if(CSRW)
        // begin
        //     case(XIDATA[31:20])
        //         12'h305: MTVEC <= S1REG;
        //         12'h341: MEPC  <= S1REG;
        //         12'h304: MIE   <= S1REG;
        //     endcase
        // end
        // else
        // if(MRET)
        // begin
        //     MIP <= 0;
        //     MIE <= 1;
        // end
        // else
        // if(INT==1&&MIE==1)
        // begin
        //     MIP <= 1;
        // end
`endif
`ifdef __RV32E__
        REGS[DPTR] <=   XRES ? (RESMODE[3:0]==2 ? `__RESETSP__ : 0)  :        // reset sp
`else
        REGS[DPTR] <=   XRES ? (RESMODE[4:0]==2 ? `__RESETSP__ : 0)  :        // reset sp
`endif
                       HLT ? REGS[DPTR] :        // halt
                     !DPTR ? 0 :                // x0 = 0, always!
                     AUIPC ? PCSIMM :
                      JAL||
                      JALR ? NXPC :
                       LUI ? SIMM :
                       LCC ? LDATA :
                  MCC||RCC ? RMDATA:
`ifdef __MAC16X16__
                       MAC ? REGS[DPTR]+KDATA :
`endif
`ifdef __INTERRUPT__
                       csr_valid_o ? csr_result:
`endif
                             REGS[DPTR];

`ifdef __3STAGE__

    `ifdef __THREADS__

        NXPC <= /*XRES ? `__RESETPC__ :*/ HLT ? NXPC : NXPC2[XMODE];

        NXPC2[XRES ? RESMODE[`__THREADS__-1:0] : XMODE] <=  XRES ? `__RESETPC__ : HLT ? NXPC2[XMODE] :   // reset and halt
                                      JREQ ? JVAL :                            // jmp/bra
	                                         NXPC2[XMODE]+4;                   // normal flow

        XMODE <= XRES ? 0 : HLT ? XMODE :        // reset and halt
                            JAL ? XMODE+1 : XMODE;
	             //XMODE==0/*&& IREQ*/&&JREQ ? 1 :         // wait pipeflush to switch to irq
                 //XMODE==1/*&&!IREQ*/&&JREQ ? 0 : XMODE;  // wait pipeflush to return from irq

    `else
        NXPC <= /*XRES ? `__RESETPC__ :*/ HLT ? NXPC : NXPC2;

	    NXPC2 <=  XRES ? `__RESETPC__ : HLT ? NXPC2 :   // reset and halt
        `ifdef __INTERRUPT__
                    csr_pc_valid ? csr_pc:
                    //  MRET ? MEPC :
                    // MIE&&MIP&&JREQ ? MTVEC : // pending interrupt + pipeline flush
        `endif
	                 JREQ ? JVAL :                    // jmp/bra
	                        NXPC2+4;                   // normal flow

    `endif

`else
        NXPC <= XRES ? `__RESETPC__ : HLT ? NXPC :   // reset and halt
              JREQ ? JVAL :                   // jmp/bra
                     NXPC+4;                   // normal flow
`endif
        PC   <= /*XRES ? `__RESETPC__ :*/ HLT ? PC : NXPC; // current program counter

        if(EBRK)
        begin
`ifndef __YOSYS__
            $display("breakpoint at %x",PC);
            $stop();
`endif
        end
    end

    // IO and memory interface

    assign DATAO = SDATA; // SCC ? SDATA : 0;
    assign DADDR = U1REG + SIMM; // (SCC||LCC) ? U1REG + SIMM : 0;

    // based in the Scc and Lcc

`ifdef __FLEXBUZZ__
    assign RW      = !SCC;
    assign DLEN[0] = (SCC||LCC)&&FCT3[1:0]==0;
    assign DLEN[1] = (SCC||LCC)&&FCT3[1:0]==1;
    assign DLEN[2] = (SCC||LCC)&&FCT3[1:0]==2;
`else
    assign RD = LCC;
    assign WR = SCC;
    assign BE = FCT3==0||FCT3==4 ? ( DADDR[1:0]==3 ? 4'b1000 : // sb/lb
                                     DADDR[1:0]==2 ? 4'b0100 :
                                     DADDR[1:0]==1 ? 4'b0010 :
                                                     4'b0001 ) :
                FCT3==1||FCT3==5 ? ( DADDR[1]==1   ? 4'b1100 : // sh/lh
                                                     4'b0011 ) :
                                                     4'b1111; // sw/lw
`endif

`ifdef __3STAGE__
    `ifdef __THREADS__
        assign IADDR = NXPC2[XMODE];
    `else
        assign IADDR = NXPC2;
    `endif
`else
    assign IADDR = NXPC;
`endif

    assign IDLE = |FLUSH;
`ifdef __INTERRUPT__
    //assign DEBUG = { INT, MIP, MIE, MRET };
`else
    assign DEBUG = { XRES, IDLE, SCC, LCC };
`endif

endmodule

module darkuart
//#(
// parameter [15:0] BAUD = 0
//) 
(
    input           clock,            // clock
    input           RES,            // reset
        
    input           RD,             // bus read
    input           WR,             // bus write
    input  [ 3:0]   BE,             // byte enable
    input  [31:0]   DATAI,          // data input
    output [31:0]   DATAO,          // data output
    output          IRQ,            // interrupt req

    input           RXD,            // UART recv line
    output          TXD,            // UART xmit line

`ifdef SIMULATION
    output reg	    FINISH_REQ = 0,
`endif
    
    output [3:0]    DEBUG           // osc debug
);

    reg [15:0]  UART_TIMER = `__BAUD__;  // baud rate from config.vh
    reg         UART_IREQ  = 0;     // UART interrupt req
    reg         UART_IACK  = 0;     // UART interrupt ack

`ifdef __UARTQUEUE__
    reg [ 7:0]  UART_XFIFO [0:255]; // UART TX FIFO
    wire [7:0]  UART_XTMP;          // UART TX FIFO
    reg [ 8:0]  UART_XREQ  = 0;     // xmit request (core side)
    reg [ 8:0]  UART_XACK  = 0;     // xmit ack (uart side)
`else
    reg [ 7:0]  UART_XFIFO = 0;     // UART TX FIFO
    reg         UART_XREQ  = 0;     // xmit request (core side)
    reg         UART_XACK  = 0;     // xmit ack (uart side)
`endif
    reg [15:0]  UART_XBAUD = 0;     // baud rate counter
    reg [ 3:0]  UART_XSTATE= 0;     // idle state

`ifdef __UARTQUEUE__
    reg [ 7:0]  UART_RFIFO [0:255]; // UART RX FIFO
    reg [ 7:0]  UART_RTMP  = 0;     // UART RX FIFO
    reg [ 8:0]  UART_RREQ  = 0;     // request (uart side)
    reg [ 8:0]  UART_RACK  = 0;     // ack (core side)
`else
    reg [ 7:0]  UART_RFIFO = 0;     // UART RX FIFO
    reg         UART_RREQ  = 0;     // request (uart side)
    reg         UART_RACK  = 0;     // ack (core side)
`endif
    reg [15:0]  UART_RBAUD = 0;     // baud rate counter
    reg [ 3:0]  UART_RSTATE= 0;     // idle state

    reg [2:0]   UART_RXDFF = -1;

`ifdef __UARTQUEUE__
    wire [7:0]  UART_STATE = { 6'd0, UART_RREQ!=UART_RACK, UART_XREQ==(UART_XACK^9'h100) };

    integer i;
    
    initial
    for(i=0;i!=256;i=i+1)
    begin
        UART_RFIFO[i] = 0;
        UART_XFIFO[i] = 0;
    end
`else
    wire [7:0]  UART_STATE = { 6'd0, UART_RREQ!=UART_RACK, UART_XREQ!=UART_XACK };    
`endif
    reg [7:0]   UART_STATEFF = 0;

    // bus interface

    reg [31:0] DATAOFF = 0;

    reg [1:0] IOREQ = 0;
    reg [1:0] IOACK = 0;

    always@(posedge clock)
    begin
        if(WR)
        begin
            if(BE[1])
            begin

`ifdef SIMULATION
                // print the UART output to console! :)
                if(DATAI[15:8]!=13) // remove the '\r'
                begin
                    UART_XFIFO <= DATAI[15:8];
                    $write("%c",DATAI[15:8]);
                    
                    if(IOREQ==1&&DATAI[15:8]==" ")
                    begin
                        $fflush(32'h8000_0001);
                        IOREQ <= 2;
                    end
                    else
                        IOREQ <= 0;
                end
                
                //if(DATAI[15:8]=="#") // break point
                //begin
                //    $display("[checkpoint #]");
                //    $stop();
                //end
                
                if(DATAI[15:8]==">") // prompt '>'
                begin
                
    `ifndef __INTERACTIVE__
                    $display(" the __INTERACTIVE__ option is disabled, ending simulation...");
                    FINISH_REQ <= 1;
    `endif                    
                    if(IOACK==0) IOREQ <= 1;
                end
`else
    `ifdef __UARTQUEUE__
                if(UART_XREQ!=(UART_XACK^9'h100))
                begin
                    UART_XFIFO[UART_XREQ[7:0]] <= DATAI[15:8];
                    UART_XREQ <= UART_XREQ+1;
                end
    `else            
                UART_XFIFO <= DATAI[15:8];
                UART_XREQ <= !UART_XACK;    // activate UART!
    `endif
`endif
            end
            //if(BE[2]) UART_TIMER[ 7:0] <= DATAI[23:16];
            //if(BE[3]) UART_TIMER[15:8] <= DATAI[31:24];           
        end
    
        if(RES)
        begin
            UART_RACK <= UART_RREQ;
            UART_STATEFF <= UART_STATE;
        end
        else
        if(RD)
        begin
`ifdef __UARTQUEUE__
            if(BE[1]) UART_RACK     <= UART_RACK!=UART_RREQ?UART_RACK+1:UART_RACK; // fifo ready
`else
            if(BE[1]) UART_RACK     <= UART_RREQ; // fifo ready
`endif
            if(BE[0]) UART_STATEFF <= UART_STATE; // state update, clear irq
        end
    end
    
    assign IRQ   = |(UART_STATE^UART_STATEFF);
`ifdef __UARTQUEUE__
    assign DATAO = { UART_TIMER, UART_RFIFO[UART_RACK[7:0]], UART_STATE };
`else
    assign DATAO = { UART_TIMER, UART_RFIFO, UART_STATE };
`endif

    // xmit path: 6(IDLE), 7(START), 8, 9, 10, 11, 12, 13, 14, 15, 0(STOP), 1(ACK)
    
    always@(posedge clock)
    begin    
        UART_XBAUD <= UART_XSTATE==`UART_STATE_IDLE ? UART_TIMER :      // xbaud=timer
                      UART_XBAUD ? UART_XBAUD-1 : UART_TIMER;           // while() { while(xbaud--); xbaud=timer }

        UART_XSTATE <= RES||UART_XSTATE==`UART_STATE_ACK  ? `UART_STATE_IDLE :
                            UART_XSTATE==`UART_STATE_IDLE ? UART_XSTATE+(UART_XREQ!=UART_XACK) :
                                                            UART_XSTATE+(UART_XBAUD==0);
`ifdef __UARTQUEUE__
        UART_XACK   <= RES ? UART_XREQ : UART_XSTATE==`UART_STATE_ACK && UART_XACK!=UART_XREQ  ? UART_XACK+1 : UART_XACK;
`else                                                           
        UART_XACK   <= RES||UART_XSTATE==`UART_STATE_ACK  ? UART_XREQ : UART_XACK;
`endif        
    end

`ifdef __UARTQUEUE__
    assign UART_XTMP = UART_XFIFO[UART_XACK[7:0]];
    
    assign TXD = UART_XSTATE[3] ? UART_XTMP[UART_XSTATE[2:0]] : UART_XSTATE==`UART_STATE_START ? 0 : 1;
`else
    assign TXD = UART_XSTATE[3] ? UART_XFIFO[UART_XSTATE[2:0]] : UART_XSTATE==`UART_STATE_START ? 0 : 1;
`endif

    // recv path: 6(IDLE), 7(START), 8, 9, 10, 11, 12, 13, 14, 15, 0(STOP), 1(ACK)

    always@(posedge clock)
    begin
        UART_RXDFF <= (UART_RXDFF<<1)|RXD;

        UART_RBAUD <= UART_RSTATE==`UART_STATE_IDLE ? { 1'b0, UART_TIMER[15:1] } :    // rbaud=timer/2
                      UART_RBAUD ? UART_RBAUD-1 : UART_TIMER;               // while() { while(rbaud--); rbaud=timer }

        UART_RSTATE <= RES||UART_RSTATE==`UART_STATE_ACK  ? `UART_STATE_IDLE :
                            UART_RSTATE==`UART_STATE_IDLE ? UART_RSTATE+(UART_RXDFF[2:1]==2'b10) : // start bit detection
                                                            UART_RSTATE+(UART_RBAUD==0);
                                                            
`ifdef __UARTQUEUE__
        if(UART_RSTATE==`UART_STATE_ACK&&(UART_RREQ!=(UART_RACK^9'h100)))
        begin
            UART_RREQ <= UART_RREQ+1;
            UART_RFIFO[UART_RREQ[7:0]] <= UART_RTMP;
        end
`else
        UART_RREQ <= (IOACK==2 || UART_RSTATE==`UART_STATE_ACK) ? !UART_RACK : UART_RREQ;
`endif
        if(UART_RSTATE[3]) 
        begin
`ifdef __UARTQUEUE__  
            UART_RTMP[UART_RSTATE[2:0]] <= UART_RXDFF[2];
`else
            UART_RFIFO[UART_RSTATE[2:0]] <= UART_RXDFF[2];
`endif
        end
`ifdef SIMULATION
        else
        if(IOACK==1)
        begin
            UART_RFIFO <= $fgetc(32'h8000_0000);
            IOACK <= 2;
        end
        else
        if(IOACK==2)
        begin
            IOACK <= UART_RREQ^UART_RACK ? 3 : 2;
        end
        else
        if(IOACK==3)
        begin
            IOACK <= UART_RREQ^UART_RACK ? 3 : (UART_RFIFO=="\n" ? 0 : 1);
        end
        else
        if(IOREQ==2)
        begin
            IOACK <= 1;
        end
`endif        
    end

    //debug
    
    assign DEBUG = { RXD, TXD, UART_XSTATE!=`UART_STATE_IDLE, UART_RSTATE!=`UART_STATE_IDLE };
    
endmodule





module axi_top(
    input                               clock,
    input                               reset,
    //************darksocv*************
    //icache-read
    input                   icache_ready_i,
    input   [31:0]          icache_addr_i,
    output                  icache_valid_o,
    output  [31:0]          icache_data_o,
    //dcache-read
    input                   dcache_r_ready_i,
    input   [31:0]          dcache_r_addr_i,
    output                  dcache_r_valid_o,
    output  [31:0]          dcache_data_o,
    //dcache-write
    input                   dcache_w_ready_i,
    input   [31:0]          dcache_w_addr_i,
    output                  dcache_w_valid_o,
    input   [31:0]          dcache_data_i,
    //memio
    input   [31:0]          uart_data_i,
    input   [3:0]           be,
    input                   wen,
    input                   valid,
    input   [31:0]          addr,
    output  [31:0]          uart_data_o,
    output                  ready,

    //*****************axi******************
    //axi_aw
    input                               axi_aw_ready_i,
    output                              axi_aw_valid_o,
    output [`AXI_ADDR_WIDTH-1:0]        axi_aw_addr_o,
    output [`AXI_ID_WIDTH-1:0]          axi_aw_id_o,
    output [7:0]                        axi_aw_len_o,
    output [2:0]                        axi_aw_size_o,
    output [1:0]                        axi_aw_burst_o,
    //axi_w
    input                               axi_w_ready_i,
    output                              axi_w_valid_o,
    output [`AXI_DATA_WIDTH-1:0]        axi_w_data_o,
    output [`AXI_DATA_WIDTH/8-1:0]      axi_w_strb_o,
    output                              axi_w_last_o,
    //axi_b
    output                              axi_b_ready_o,
    input                               axi_b_valid_i,
    input  [1:0]                        axi_b_resp_i,
    input  [`AXI_ID_WIDTH-1:0]          axi_b_id_i,
    //axi_ar
    input                               axi_ar_ready_i,
    output                              axi_ar_valid_o,
    output [`AXI_ADDR_WIDTH-1:0]        axi_ar_addr_o,
    output [`AXI_ID_WIDTH-1:0]          axi_ar_id_o,
    output [7:0]                        axi_ar_len_o,
    output [2:0]                        axi_ar_size_o,
    output [1:0]                        axi_ar_burst_o,
    //axi_r
    output                              axi_r_ready_o,
    input                               axi_r_valid_i,
    input  [1:0]                        axi_r_resp_i,
    input  [`AXI_DATA_WIDTH-1:0]        axi_r_data_i,
    input                               axi_r_last_i,
    input  [`AXI_ID_WIDTH-1:0]          axi_r_id_i

);

   wire                         axi_valid_o ;  
   wire                         axi_ready_i ; 
   wire [1:0]                   axi_done_i   ;
   wire                         axi_rw_req_o ;
   wire [`RW_DATA_WIDTH-1:0]    axi_rdata_i  ;
   wire [`RW_DATA_WIDTH-1:0]    axi_wdata_o  ;
   wire [`RW_ADDR_WIDTH-1:0]    axi_addr_o   ;
   wire [1:0]                   axi_size_o   ;
   wire [1:0]                   axi_resp_i   ;
   wire [`AXI_ID_WIDTH-1:0]     axi_id_o     ;
   wire [`AXI_ID_WIDTH-1:0]     axi_id_i     ;
   wire [3:0]                   axi_wmask_o  ;
    
    
    axi_rw u_axi_rw(
    .clock            (clock),
    .rst_n          (reset),

    .rw_valid_i     (axi_valid_o),     
    .rw_ready_o     (axi_ready_i),     
    .rw_done_o       (axi_done_i),       
    .rw_req_i       (axi_rw_req_o),       
    .r_data_o       (axi_rdata_i),    
    .w_data_i       (axi_wdata_o),   
    .rw_addr_i      (axi_addr_o),      
    .rw_size_i      (axi_size_o),      
    .rw_resp_o      (axi_resp_i),      
    .rw_id_i        (axi_id_o),        
    .rw_id_o        (axi_id_i),        
    .w_mask_i       (axi_wmask_o),       
    
    .axi_aw_ready_i (axi_aw_ready_i ),
    .axi_aw_valid_o (axi_aw_valid_o ),
    .axi_aw_addr_o  (axi_aw_addr_o  ),
    .axi_aw_id_o    (axi_aw_id_o    ),
    .axi_aw_len_o   (axi_aw_len_o   ),
    .axi_aw_size_o  (axi_aw_size_o  ),
    .axi_aw_burst_o (axi_aw_burst_o ),

    .axi_w_ready_i  (axi_w_ready_i),
    .axi_w_valid_o  (axi_w_valid_o),
    .axi_w_data_o   (axi_w_data_o ),
    .axi_w_strb_o   (axi_w_strb_o ),
    .axi_w_last_o   (axi_w_last_o ),
    
    .axi_b_ready_o  (axi_b_ready_o),
    .axi_b_valid_i  (axi_b_valid_i),
    .axi_b_resp_i   (axi_b_resp_i ),
    .axi_b_id_i     (axi_b_id_i   ),

    .axi_ar_ready_i (axi_ar_ready_i ),
    .axi_ar_valid_o (axi_ar_valid_o ),
    .axi_ar_addr_o  (axi_ar_addr_o  ),
    .axi_ar_id_o    (axi_ar_id_o    ),
    .axi_ar_len_o   (axi_ar_len_o   ),
    .axi_ar_size_o  (axi_ar_size_o  ),
    .axi_ar_burst_o (axi_ar_burst_o ),
    
    .axi_r_ready_o  (axi_r_ready_o  ),
    .axi_r_valid_i  (axi_r_valid_i  ),
    .axi_r_resp_i   (axi_r_resp_i   ),
    .axi_r_data_i   (axi_r_data_i   ),
    .axi_r_last_i   (axi_r_last_i   ),
    .axi_r_id_i     (axi_r_id_i     )
    );

    core2axi u_core_axi(

    .clock                (clock),
    .rst_n              (reset),
    //darksocv
    //icache-read
    .icache_ready_i     (icache_ready_i),
    .icache_addr_i      (icache_addr_i ),
    .icache_valid_o     (icache_valid_o),
    .icache_data_o      (icache_data_o ),
    //dcache-read
    .dcache_r_ready_i   (dcache_r_ready_i),
    .dcache_r_addr_i     (dcache_r_addr_i  ),
    .dcache_r_valid_o   (dcache_r_valid_o ),
    .dcache_data_o      (dcache_data_o   ),
    //dcache-write
    .dcache_w_ready_i   (dcache_w_ready_i ),
    .dcache_w_addr_i    (dcache_w_addr_i  ),
    .dcache_data_i      (dcache_data_i    ),
    .dcache_w_valid_o   (dcache_w_valid_o ),    
    //memio
    .uart_data_i        (uart_data_i),
    .be                 (be         ),
    .wen                (wen        ),
    .valid              (valid      ),
    .addr               (addr       ),
    .uart_data_o        (uart_data_o),
    .ready              (ready),
    
    //axi
	.axi_valid_o        (axi_valid_o ),     
	.axi_ready_i        (axi_ready_i ),
    .axi_done_i         (axi_done_i  ),
    .axi_rw_req_o       (axi_rw_req_o),
    .axi_rdata_i        (axi_rdata_i ), 
    .axi_wdata_o        (axi_wdata_o ), 
    .axi_addr_o         (axi_addr_o  ),
    .axi_size_o         (axi_size_o  ),  
    .axi_resp_i         (axi_resp_i  ), 
    .axi_id_o           (axi_id_o    ),  
    .axi_id_i           (axi_id_i    ),  
    .axi_wmask_o        (axi_wmask_o )      
    );





endmodule


module axi_rw(
    input                               clock,
    input                               rst_n,

	input                               rw_valid_i, // cpu req
	output                              rw_ready_o, // axi rw over
    output [1:0]                        rw_done_o,  // 10 w_done 01 r_done
    input                               rw_req_i,   // 0-read 1-write
    output [31:0]                       r_data_o,   // read data
    input  [31:0]                       w_data_i,   // write data
    input  [31:0]                       rw_addr_i,  // rw address
    input  [1:0]                        rw_size_i,  // rw size
    output [1:0]                        rw_resp_o,  // rw state
    input  [3:0]                        rw_id_i,    // from which cache
    output [3:0]                        rw_id_o,    // to which cache
    input  [3:0]                        w_mask_i,   // write mask     

    // Advanced eXtensible Interface
    input                               axi_aw_ready_i,
    output                              axi_aw_valid_o,
    output [`AXI_ADDR_WIDTH-1:0]        axi_aw_addr_o,
    output [`AXI_ID_WIDTH-1:0]          axi_aw_id_o,
    output [7:0]                        axi_aw_len_o,
    output [2:0]                        axi_aw_size_o,
    output [1:0]                        axi_aw_burst_o,

    input                               axi_w_ready_i,
    output                              axi_w_valid_o,
    output [`AXI_DATA_WIDTH-1:0]        axi_w_data_o,
    output [`AXI_DATA_WIDTH/8-1:0]      axi_w_strb_o,
    output                              axi_w_last_o,
    
    output                              axi_b_ready_o,
    input                               axi_b_valid_i,
    input  [1:0]                        axi_b_resp_i,
    input  [`AXI_ID_WIDTH-1:0]          axi_b_id_i,

    input                               axi_ar_ready_i,
    output                              axi_ar_valid_o,
    output [`AXI_ADDR_WIDTH-1:0]        axi_ar_addr_o,
    output [`AXI_ID_WIDTH-1:0]          axi_ar_id_o,
    output [7:0]                        axi_ar_len_o,
    output [2:0]                        axi_ar_size_o,
    output [1:0]                        axi_ar_burst_o,
    
    output                              axi_r_ready_o,
    input                               axi_r_valid_i,
    input  [1:0]                        axi_r_resp_i,
    input  [`AXI_DATA_WIDTH-1:0]        axi_r_data_i,
    input                               axi_r_last_i,
    input  [`AXI_ID_WIDTH-1:0]          axi_r_id_i
);

    //状态机定义
    parameter [1:0] W_IDLE = 2'b00, W_ADDR = 2'b01, W_DATA = 2'b10, W_RESP = 2'b11;
    parameter [1:0] R_IDLE = 2'b00, R_ADDR = 2'b01, R_DATA  = 2'b10;

    reg [1:0] w_state, r_state;

    wire w_idle = w_state == W_IDLE;
    wire w_addr = w_state == W_ADDR;
    wire w_data = w_state == W_DATA;
    wire w_resp = w_state == W_RESP;

    wire r_idle = r_state == R_IDLE;
    wire r_addr = r_state == R_ADDR;
    wire r_data  = r_state == R_DATA;

    //握手成功标志    
    wire wr_hs      = rw_valid_i     & rw_ready_o;      //cpu2axi handshark
    wire aw_hs      = axi_aw_ready_i & axi_aw_valid_o;  // aw ch handshark
    wire w_hs       = axi_w_ready_i  & axi_w_valid_o;   // w  ch handshark
    wire b_hs       = axi_b_ready_o  & axi_b_valid_i;   // b  ch handshark
    wire ar_hs      = axi_ar_ready_i & axi_ar_valid_o;  // ar ch handshark
    wire r_hs       = axi_r_ready_o  & axi_r_valid_i;   // r  ch handshark
    //读写传输标志
    wire w_trans    = rw_req_i == `REQ_WRITE;       // write req
    wire r_trans    = rw_req_i == `REQ_READ;        // read req
    wire w_valid    = wr_hs & w_trans;         // write req valid
    wire r_valid    = wr_hs & r_trans;         // read req valid
    //读写完成标志
    wire w_done     = w_hs & axi_w_last_o;          // write over sign
    wire r_done     = r_hs & axi_r_last_i;          // read over sign
    wire trans_done = w_trans ? b_hs : r_done;      // trans over sign

    //*******************非对齐传输处理，需使用burst传输***************** 
    wire size_b     = rw_size_i == `SIZE_B;
    wire size_h     = rw_size_i == `SIZE_H;
    wire size_w     = rw_size_i == `SIZE_W;
    wire size_d     = rw_size_i == `SIZE_D;
    wire unaligned  = (size_h && rw_addr_i[0]   != 0) | 
                      (size_w && rw_addr_i[1:0] != 0) | 
                      (size_d && rw_addr_i[3:0] != 0);  //非对齐标志  


    //读写次数计数器
    reg cnt;

    always @(posedge clock)begin
        if(rst_n)
            cnt <= 1'b0;
        else if(unaligned && cnt && (w_done | r_done))
            cnt <= 1'b0;
        else if(unaligned && (r_data | w_data))
            cnt <= 1'b1;
    end


    //非对齐两次写数据处理
    wire [15:0] unaligned_wdata_h1 = w_mask_i[0] ? {w_data_i[7:0],8'b0} :
                                    w_mask_i[1] ? {w_data_i[15:8],8'b0} :
                                    w_mask_i[2] ? {w_data_i[23:16],8'b0} : 16'b0;
    wire [15:0] unaligned_wdata_h2 = w_mask_i[0] ? {8'b0,w_data_i[15:8]} :
                                    w_mask_i[1] ? {8'b0,w_data_i[23:16]} :
                                    w_mask_i[2] ? {8'b0,w_data_i[31:24]} : 16'b0;
    wire [31:0] unaligned_wdata_w1 = (rw_addr_i[1:0] == 2'b01) ? {w_data_i[23:0],8'b0} :
                                    (rw_addr_i[1:0] == 2'b10) ? {w_data_i[15:0],16'b0} :
                                    (rw_addr_i[1:0] == 2'b11) ? {w_data_i[7:0],24'b0} : 32'b0;
    wire [31:0] unaligned_wdata_w2 = (rw_addr_i[1:0] == 2'b01) ? {24'b0,w_data_i[31:24]} :
                                    (rw_addr_i[1:0] == 2'b10) ? {16'b0,w_data_i[31:16]} :
                                    (rw_addr_i[1:0] == 2'b11) ? {8'b0,w_data_i[31:8]} : 32'b0;

    wire [1:0]  unaligned_wmask_h1 = 2'b10;
    wire [1:0]  unaligned_wmask_h2 = 2'b01;
    wire [3:0]  unaligned_wmask_w1 = (rw_addr_i[1:0] == 2'b01) ? 4'b1110 :
                                    (rw_addr_i[1:0] == 2'b10) ? 4'b1100 :
                                    (rw_addr_i[1:0] == 2'b11) ? 4'b1000 : 4'b0;
    wire [3:0]  unaligned_wmask_w2 = (rw_addr_i[1:0] == 2'b01) ? 4'b0001 :
                                    (rw_addr_i[1:0] == 2'b10) ? 4'b0011 :
                                    (rw_addr_i[1:0] == 2'b11) ? 4'b0111 : 4'b0;

    //每次输出的strb，wdata选择
    wire [31:0] aligned_wdata = size_b ? 
                                        w_mask_i[0] ? {24'b0,w_data_i[7:0]} :
                                        w_mask_i[1] ? {24'b0,w_data_i[15:8]} :
                                        w_mask_i[2] ? {24'b0,w_data_i[23:16]} :
                                        {24'b0,w_data_i[31:24]} :
                                size_h ?
                                        w_mask_i[0] ? {16'b0,w_data_i[15:0]} :
                                        w_mask_i[1] ? {16'b0,w_data_i[23:8]} :
                                        w_mask_i[2] ? {16'b0,w_data_i[31:16]} :
                                        {16'b0,w_data_i[7:0],w_data_i[31:24]} :
                                w_data_i; //对齐时数据处理

    wire [7:0] wmask = rw_addr_i[2] ? {w_mask_i,4'd0} : {4'd0,w_mask_i};
    wire [63:0] wdata = rw_addr_i[2] ? {w_data_i,32'd0} : {32'd0,w_data_i};

    //非对齐两次读数据处理
    wire [31:0] unaligned_rdata = axi_r_data_i ;

    //*********************状态机跳转******************
    //写状态机
    always @(posedge clock) begin
        if (rst_n) begin
            w_state <= W_IDLE;
        end
        else begin
            case (w_state)
                W_IDLE:
                if(w_valid) w_state <= W_ADDR;
                W_ADDR:
                if(aw_hs)   w_state <= W_DATA;
                W_DATA:
                if(w_done)  w_state <= W_RESP;
                W_RESP:
                if(b_hs)    w_state <= W_IDLE;
                default:;
            endcase
        end
    end    
    
    //读状态机
    always @(posedge clock) begin
        if (rst_n) begin
            r_state <= R_IDLE;
        end
        else begin
            case (r_state)
                R_IDLE: 
                if (r_valid)  r_state <= R_ADDR;
                R_ADDR:
                if (ar_hs)    r_state <= R_DATA;
                R_DATA: 
                if (r_done)   r_state <= R_IDLE;
                default:;
            endcase
        end
    end
    
    
    //*******************写传输*********************    

    //写地址通道
    assign axi_aw_valid_o   = w_addr; 
    assign axi_aw_addr_o    = rw_addr_i;
    assign axi_aw_id_o      = rw_id_i; 
    assign axi_aw_len_o     = 8'b0;
    assign axi_aw_size_o    = rw_size_i;
    assign axi_aw_burst_o   = 2'b1;  //  INCR
    //写数据通道
    assign axi_w_valid_o    = w_data;    
    assign axi_w_strb_o     = w_data ?  wmask : 8'b0;
    assign axi_w_last_o     = w_data ? unaligned ? cnt : 1'b1 : 1'b0; 
    assign axi_w_data_o     = w_hs ? wdata : {`AXI_DATA_WIDTH{1'b0}};
    //写响应通道
    assign axi_b_ready_o    = w_resp;

    //*******************读传输*********************    
    //读地址通道
    assign axi_ar_valid_o   = r_addr;
    assign axi_ar_addr_o    = rw_addr_i;
    assign axi_ar_id_o      = rw_id_i;    
    assign axi_ar_len_o     = 8'b0;
    assign axi_ar_size_o    = rw_size_i;
    assign axi_ar_burst_o   = 2'b1; // INCR

    //读数据通道
    assign axi_r_ready_o    = r_data;

    //*****************处理器接口*********************

    reg  rw_ready;
    reg  [1:0] rw_r_w;
    reg  [1:0] rw_resp;
    reg  [3:0] rw_id;
    reg  [31:0]rdata;
    wire [3:0] rw_id_nxt   = w_trans  ? axi_b_id_i   : axi_r_id_i;
    wire [1:0] rw_resp_nxt = w_trans ? axi_b_resp_i : axi_r_resp_i;
    

    always @(posedge clock) begin
        if (rst_n) begin
            rw_ready <= 1'b1;
        end
        else if (trans_done) begin
            rw_ready <= 1'b1;
        end
        else if(wr_hs)begin
            rw_ready <= 1'b0;
        end
    end

    always @(posedge clock) begin
        if (rst_n) begin
            rw_r_w   <= 2'b0;
        end
        else if (trans_done) begin
            rw_r_w   <= {b_hs, r_done};
        end
        else begin
            rw_r_w   <= 2'b0;
        end
    end


    always @(posedge clock) begin
        if (rst_n) begin
            rw_resp <= 0;
            rw_id <= 4'b0;
        end
        else if (trans_done) begin
            rw_resp <= rw_resp_nxt;
            rw_id <= rw_id_nxt;
        end
        else begin
            rw_resp <= 0;
            rw_id <= 4'b0;
        end
    end

    always @(posedge clock)begin
        if(rst_n)
            rdata <= 32'b0;
        else if(r_hs)
            rdata <= unaligned ? (cnt ? unaligned_rdata:32'b0):axi_r_data_i[31:0];
        else 
            rdata <= 32'b0;
    end

    assign rw_ready_o = rw_ready;
    assign rw_done_o = rw_r_w;
    assign rw_resp_o = rw_resp;
    assign rw_id_o = rw_id;
    
    assign r_data_o = rdata;
endmodule





module core2axi(

    input                   clock,
    input                   rst_n,
    //darksocv
    //icache-read
    input                   icache_ready_i,
    input   [31:0]          icache_addr_i,
    output                  icache_valid_o,
    output  [31:0]          icache_data_o,
    //dcache-read
    input                   dcache_r_ready_i,
    input   [31:0]          dcache_r_addr_i,
    output                  dcache_r_valid_o,
    output  [31:0]          dcache_data_o,
    //dcache-write
    input                   dcache_w_ready_i,
    input   [31:0]          dcache_w_addr_i,
    output                  dcache_w_valid_o,
    input   [31:0]          dcache_data_i,
    //memio
    input   [31:0]          uart_data_i,
    input   [3:0]           be,
    input                   wen,
    input                   valid,
    input   [31:0]          addr,
    output  [31:0]          uart_data_o,
    output                  ready,
    
    //axi
	output                  axi_valid_o,     // cpu rw req
	input                   axi_ready_i,     // axi rw over
    input   [1:0]           axi_done_i,       // 10 w_done 01 r_done
    output                  axi_rw_req_o,       // id 0-read 1-write
    input   [31:0]          axi_rdata_i,    // 128 bit read data
    output  [31:0]          axi_wdata_o,   // 128 bit write data
    output  [31:0]          axi_addr_o,      // rw address
    output  [1:0]           axi_size_o,      // rw size
    input   [1:0]           axi_resp_i,      // rw state
    output  [3:0]           axi_id_o,        // from which
    input   [3:0]           axi_id_i,        // send to which cache
    output  [3:0]           axi_wmask_o       // write mask     
);
    
    wire	[`N-1:0]	request;	//各个设备的读写请求信号
    wire	[`N-1:0]	grant;		//总线占用权
    wire			    dcache;
    wire			    icache;
    wire			    memio;
    reg                 lock;

    
    assign request = {valid,dcache_r_ready_i,dcache_w_ready_i,icache_ready_i};
    assign icache = grant[0];
    assign dcache_w = grant[1];    
    assign dcache_r = grant[2];
    assign memio = grant[3];   
    
    //轮询优先级选择器
   	arb u_arb(
        .clock		(clock),
        .rst_n		(rst_n),
        .lock       (lock),
        .request	(request),
        .grant		(grant)
	);

    always @(posedge clock)begin
        if(rst_n) lock <= 1'b0;
        else if(axi_valid_o && axi_ready_i) lock <= 1'b1;
        else if(axi_ready_i) lock <= 1'b0;
    end

    //assign lock = |grant && !axi_ready_i; //总线占用时将总裁器状态锁存起来
    assign axi_valid_o = (axi_done_i == 0) && (|grant) && axi_ready_i; //总线使用权响应
    assign axi_rw_req_o = lock ? axi_rw_req_o : (dcache_w | (memio & wen)) ? 1'b1 : 1'b0; //读写响应标志
    assign axi_wdata_o = lock ? axi_wdata_o : dcache_w ? dcache_data_i :
                            (memio & wen) ? uart_data_i : 32'b0;
    assign axi_addr_o = lock ? axi_addr_o : icache ? icache_addr_i : 
                        dcache_w ? dcache_w_addr_i :
                        dcache_r ? dcache_r_addr_i :
                        memio ? addr : 32'b0;
    assign axi_size_o = lock ? axi_size_o : memio ? 2'b0: 2'b10;
    assign axi_id_o = lock ? axi_id_o : grant;
    assign axi_wmask_o = lock ? axi_wmask_o : memio ? be : 4'b1111;
    
    assign icache_valid_o = (axi_id_i == 4'b0001) && (axi_resp_i == 2'b0);
    assign icache_data_o = icache_valid_o ? axi_rdata_i : 32'b0;
    

    assign dcache_w_valid_o = (axi_id_i == 4'b0010) && (axi_resp_i == 2'b0);
    assign dcache_r_valid_o = (axi_id_i == 4'b0100) && (axi_resp_i == 2'b0);
    assign dcache_data_o = dcache_r_valid_o ? axi_rdata_i : 32'b0;
    
    assign uart_data_o = ((axi_id_i == 4'b1000) && (axi_resp_i == 2'b0)) ? axi_rdata_i : 32'b0;
    assign ready =  axi_id_i == 4'b1000 && axi_resp_i == 2'b0;


endmodule




module arb(
    input   clock         ,
    input   rst_n       ,
    input   lock        ,
    
    input  [`N-1:0] request,
    output [`N-1:0] grant
);

    // 存储移位后上一次仲裁结果
    reg  [`N-1:0] last_state;
    always@(posedge clock or negedge rst_n) begin
        if(rst_n)
            last_state <= {{`N-1{1'b0}},1'b1};     // 默认值，表示最低位的优先级最高
        else if(lock)
            last_state <= last_state;
        else if(|request)
            last_state <= {grant[`N-2:0],grant[`N-1]}; // 有仲裁请求，根据上一次的仲裁结果，左移1bit后用于控制新的优先级
        else
            last_state <= last_state;  // 无仲裁请求时，pre_state不更新
    end

    // 如果最左侧几个高优先级主机都为发起仲裁请求，需要从最低位开始轮询。
    // 此处通过两个request拼接，将右侧低位拼接到左侧，即可实现对低位的判断。
    wire [2*`N-1:0] grant_ext;
    assign grant_ext = {request,request} & ~({request,request} - last_state);

    // 得到的grant_ext必定为一个独热码，但是置高位可能在代表低位的高4bit中，因此进行求或运算
    assign grant = (grant_ext[`N-1:0] | grant_ext[2*`N-1:`N]);

endmodule


module csr_unit(
  input [7:0] op,
  input [31:0] src1,
  input [31:0] src2,
  input [31:0] imm,
  input [31:0] pc_i,

  input [4:0] dest,
  input [4:0] rs1,

  input unsupport_op,
  input ex_intr,
  input csr_mie_rdata,
//normal csr r/w port
  output [11:0] csr_addr,
  output csr_read,
  output csr_write,
  output csr_set,
  output csr_clear,
  output [31:0] csr_wdata,
  input [31:0] csr_rdata,
//specific csr r/w port
  output raise_intr,
  output raise_hard_intr,
  output op_mret,
//CSR mepc
  input [31:0] csr_mepc_rdata,
  output csr_mepc_write,
  output [31:0] csr_mepc_wdata,
//CSR mcause
  output csr_mcause_write,
  output [31:0] csr_mcause_wdata,
//CSR mtvec
  input [31:0] csr_mtvec_rdata,

  output [31:0] pc_o,
  output pc_valid_o,

  output [31:0] res,
  output valid_o
);
  assign {op_csrrw,op_csrrs,op_csrrc,op_csrrwi,op_csrrsi,op_csrrci,op_mert,op_ecall} = op;
  
  assign op_mret = op_mert; /*an oolong event*/

  wire zicsr = {op_csrrw|op_csrrs|op_csrrc|op_csrrwi|op_csrrsi|op_csrrci};

  assign csr_addr = {12{zicsr}}&imm[11:0];

  assign csr_read = zicsr&!((op_csrrw|op_csrrwi)&dest==5'b0);
  assign csr_write = op_csrrw|op_csrrwi;
  assign csr_set = op_csrrs|(op_csrrsi&rs1!=5'b0);
  assign csr_clear = op_csrrc|(op_csrrci&rs1!=5'b0);

  assign csr_wdata = {32{op_csrrw|op_csrrs|op_csrrc}}&src1 | { 27'b0,{{5{op_csrrwi|op_csrrsi|op_csrrci}}&rs1}};

  assign res = csr_rdata;
  assign valid_o = csr_read;

  IRQ inst_IRQ
  (
    .ecall          (op_ecall),
    .mret           (op_mret),
    .pc_i           (pc_i),
    .unsupport_op   (unsupport_op),
    .ex_intr        (ex_intr&~(|op)),/* Make sure all csr operations will success affect intrrupt. */
    .mie_i          (csr_mie_rdata),
    .mtvec_i        (csr_mtvec_rdata),
    .mepc_i         (csr_mepc_rdata),
    .raise_intr     (raise_intr),
    .raise_hard_intr(raise_hard_intr),
    .mepc_o         (csr_mepc_wdata),
    .mepc_valid_o   (csr_mepc_write),
    .mcause_o       (csr_mcause_wdata),
    .mcause_valid_o (csr_mcause_write),
    .pc_o           (pc_o),
    .pc_valid_o     (pc_valid_o)
  );

endmodule

module IRQ (


  input ecall,
  input mret,
  input [31:0] pc_i,

  input unsupport_op,
  input ex_intr,
  input mie_i,

  input [31:0] mtvec_i,
  input [31:0] mepc_i,

  output raise_intr,
  output raise_hard_intr,

  output [31:0] mepc_o,
  output mepc_valid_o,
  output [31:0] mcause_o,
  output mcause_valid_o,
  output [31:0] pc_o,
  output pc_valid_o

);
  localparam MCAUSE_INTR = {1'b1,31'b0};
  localparam MCAUSE_ECALL_M  = 32'd11|MCAUSE_INTR;
  localparam MCAUSE_EX_INT_M = 32'd7|MCAUSE_INTR;
  localparam MCAUSE_ILLEGAL_INSTRUCTION = 32'd2;


  wire soft_intr = ecall|unsupport_op;
  wire hard_intr = mie_i & (ex_intr);
   
  wire [31:0] hard_intr_cause = {32{ex_intr}}&MCAUSE_EX_INT_M;
  wire [31:0] sort_intr_cause = {32{ecall}}&{MCAUSE_ECALL_M}|{32{unsupport_op}}&MCAUSE_ILLEGAL_INSTRUCTION;
  assign raise_intr = (soft_intr | hard_intr)&~mret;

  assign mepc_o = soft_intr ? pc_i +32'd4 : pc_i;
  assign mepc_valid_o = raise_intr;
  assign mcause_o = {32{soft_intr}}&sort_intr_cause | {32{(~soft_intr)&hard_intr}}&hard_intr_cause;
  assign mcause_valid_o = raise_intr;
  assign pc_o = {32{raise_intr}}&mtvec_i | {32{mret}}&mepc_i;
  assign pc_valid_o = (raise_intr|mret);
  
  assign raise_hard_intr = (hard_intr&~(soft_intr|mret));
endmodule

module CSRsFile (
  input clk,
  input rst,

//normal csr r/w port
  input [11:0] csr_addr,
  input csr_read,
  input csr_write,
  input csr_set,
  input csr_clear,
  input [31:0] csr_wdata,
  output reg [31:0] csr_rdata,
//specific csr r/w port

  input raise_intr,
  input op_mret,


  input tim_int_req,

  input mtip_clear,
  input msip_i,
  input msip_valid_i,
  output msip_o,

  output mtip,

  output reg csr_mie_rdata,
//CSR mepc
  output reg [31:0] csr_mepc_rdata,
  input csr_mepc_write,
  input [31:0] csr_mepc_wdata,
//CSR mcause
  input csr_mcause_write,
  input [31:0] csr_mcause_wdata,
//CSR mtvec
  output reg [31:0] csr_mtvec_rdata

);
  localparam MSTATUS_ADDR = 12'h300;
  localparam MTVEC_ADDR = 12'h305;
  localparam MEPC_ADDR = 12'h341;
  localparam MCAUSE_ADDR = 12'h342;
  localparam MIE_ADDR = 12'h304;
  localparam MIP_ADDR = 12'h344;

  localparam MSTATUS_MIE = 3;
  localparam MSTATUS_MPIE = 7;
  localparam MIE_MTIE = 7;
  localparam MIP_MTIP = 7;
  localparam MIP_MSIP = 3;
  reg [31:0] mepc,mcause,mtvec,mstatus,mip,mie;

  assign mtip = mip[MIP_MTIP];
  assign msip_o = mip[MIP_MSIP];
  //csr read
  always @(*) begin
    csr_rdata = 32'b0;
    csr_mepc_rdata = mepc;
    csr_mtvec_rdata = mtvec;
    csr_mie_rdata = mstatus[MSTATUS_MIE];
    if(csr_read)
      case(csr_addr)
      MSTATUS_ADDR: csr_rdata = mstatus;
      MTVEC_ADDR: csr_rdata = mtvec;
      MEPC_ADDR: csr_rdata = mepc;
      MCAUSE_ADDR: csr_rdata = mcause;
      MIP_ADDR: csr_rdata = mip;
      MIE_ADDR: csr_rdata = mie;
      default: csr_rdata = 32'b0;
      endcase
  end
  //csr write
  always @(posedge clk) begin
    if(rst) begin
      mepc <= 32'b0;
      mcause <= 32'b0;
      mtvec <= 32'b0;
      mstatus <= 32'ha0001800;
    end else begin
      if(tim_int_req & mstatus[MSTATUS_MIE] & mie[MIE_MTIE]) mip[MIP_MTIP] <= 1'b1;
      if(mtip_clear) mip[MIP_MTIP] <= 1'b0;
      if(msip_valid_i) mip[MIP_MSIP] <= msip_i;
      if(csr_write) begin
        case(csr_addr)
        MSTATUS_ADDR:     mstatus <= csr_wdata;
        MTVEC_ADDR:       mtvec   <= csr_wdata;
        MEPC_ADDR:        mepc    <= csr_wdata;
        MCAUSE_ADDR:      mcause  <= csr_wdata;
        MIP_ADDR:         mip     <= csr_wdata;
        MIE_ADDR:         mie     <= csr_wdata;
        default: ;
        endcase
      end else if(csr_set) begin
        case(csr_addr)
        MSTATUS_ADDR:     mstatus <= mstatus | csr_wdata;
        MTVEC_ADDR:       mtvec   <= mtvec   | csr_wdata;
        MEPC_ADDR:        mepc    <= mepc    | csr_wdata;
        MCAUSE_ADDR:      mcause  <= mcause  | csr_wdata;
        MIP_ADDR:         mip     <= mip     | csr_wdata;
        MIE_ADDR:         mie     <= mie     | csr_wdata;
        default: ;
        endcase
      end else if(csr_clear) begin
        case(csr_addr)
        MSTATUS_ADDR:     mstatus <= mstatus &(~csr_wdata);
        MTVEC_ADDR:       mtvec   <= mtvec   &(~csr_wdata);
        MEPC_ADDR:        mepc    <= mepc    &(~csr_wdata);
        MCAUSE_ADDR:      mcause  <= mcause  &(~csr_wdata);
        MIP_ADDR:         mip     <= mip     &(~csr_wdata);
        MIE_ADDR:         mie     <= mie     &(~csr_wdata);
        default: ;
        endcase
      end
      if(csr_mepc_write) mepc <= csr_mepc_wdata;
      if(csr_mcause_write) mcause <= csr_mcause_wdata;
      if(raise_intr) begin 
        mstatus[MSTATUS_MPIE] <= mstatus[MSTATUS_MIE];
        mstatus[MSTATUS_MIE] <= 1'b0;
      end
      if(op_mret) begin
        mstatus[MSTATUS_MIE] <= mstatus[MSTATUS_MPIE];
        mstatus[MSTATUS_MPIE] <= 1'b1;
      end
    end
    
  end

endmodule

