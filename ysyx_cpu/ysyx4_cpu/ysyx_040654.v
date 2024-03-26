`define ysyx_040654_Zero_Word 64'h0000_0000_0000_0000
`define ysyx_040654_Zero_HalfWord 32'h0000_0000
`define ysyx_040654_INST_NOP 32'h0000_0013
`define ysyx_040654_INST_FENCEI 32'h0000_100f

`define ysyx_040654_AXI_IDLE_STATE 2'b00
`define ysyx_040654_AXI_IF_BUSY_STATE 2'b01
`define ysyx_040654_AXI_MEM_BUSY_STATE 2'b10

`define ysyx_040654_PC_RESET 32'h3000_0000

`define ysyx_040654_MEM_START 32'h8000_0000
`define ysyx_040654_MEM_END 32'hFBFF_FFFF

`define ysyx_040654_CLINT_MTIMECMP 32'h0200_4000
`define ysyx_040654_CLINT_MTIME 32'h0200_BFF8
`define ysyx_040654_CLINT_START 32'h0200_0000
`define ysyx_040654_CLINT_END 32'h0200_FFFF

//`define UART_START 32'h1000_0000
//`define UART_END 32'h1000_0fff

// `define SPI_START 32'h1000_1000
// `define SPI_END 32'h1000_1fff

// `define VGA_START 32'h1000_2000
// `define VGA_END 32'h1000_2FFF

// `define PS2_START 32'h1000_3000
// `define PS2_END 32'h1000_3FFF

// `define ETHERNET_START 32'h1000_4000
// `define ETHERNET_END 32'h1000_4FFF

// `define FLASH_START 32'h3000_0000
// `define FLASH_END 32'h3FFF_FFFF

// `define CHIPLINK_START 32'h4000_0000
// `define CHIPLINK_END 32'h7FFF_FFFF

`define ysyx_040654_SDRAM_START 32'hFC00_0000
`define ysyx_040654_SDRAM_END 32'hFFFF_FFFF

`define ysyx_040654_MemAddrBus 31:0
`define ysyx_040654_InstBus 31:0
`define ysyx_040654_DataBus 63:0
`define ysyx_040654_HalfDataBus 31:0
`define ysyx_040654_RegAddrBus 4:0
`define ysyx_040654_RegBus 63:0
`define ysyx_040654_RegNum 32
`define ysyx_040654_RegZero 5'h0
`define ysyx_040654_CsrBus 63:0
`define ysyx_040654_CsrNum 6
`define ysyx_040654_CsrAddrBus 11:0 
`define ysyx_040654_CacheAddrBus 5:0
`define ysyx_040654_CacheBus 127:0

`define ysyx_040654_Inst_t 6
`define ysyx_040654_Shamt 6
`define ysyx_040654_Opcode 7
`define ysyx_040654_Fun3 3
`define ysyx_040654_Fun7 7
`define ysyx_040654_ALU_OP 5
`define ysyx_040654_BJU_OP 4
`define ysyx_040654_LSU_OP 4
`define ysyx_040654_CSR_OP 4

`define ysyx_040654_ALU_NOP 5'd0
`define ysyx_040654_ALU_ADD 5'd1
`define ysyx_040654_ALU_SUB 5'd2
`define ysyx_040654_ALU_SLL 5'd3
`define ysyx_040654_ALU_SRL 5'd4
`define ysyx_040654_ALU_SRA 5'd5
`define ysyx_040654_ALU_XOR 5'd6
`define ysyx_040654_ALU_AND 5'd7
`define ysyx_040654_ALU_OR  5'd8
`define ysyx_040654_ALU_SLT 5'd9
`define ysyx_040654_ALU_MUL 5'd10
`define ysyx_040654_ALU_DIV 5'd11
`define ysyx_040654_ALU_REM 5'd12 
`define ysyx_040654_ALU_SLTU 5'd13
`define ysyx_040654_ALU_ADDW 5'd14
`define ysyx_040654_ALU_SLLW 5'd15
`define ysyx_040654_ALU_SRAW 5'd16
`define ysyx_040654_ALU_SRLW 5'd17
`define ysyx_040654_ALU_SUBW 5'd18
`define ysyx_040654_ALU_MULW 5'd19
`define ysyx_040654_ALU_DIVW 5'd20
`define ysyx_040654_ALU_REMW 5'd21
`define ysyx_040654_ALU_MULH 5'd22
`define ysyx_040654_ALU_MULHSU 5'd23
`define ysyx_040654_ALU_MULHU 5'd24
`define ysyx_040654_ALU_DIVU 5'd25
`define ysyx_040654_ALU_DIVUW 5'd26
`define ysyx_040654_ALU_REMUW 5'd27
`define ysyx_040654_ALU_REMU 5'd28

`define ysyx_040654_BJU_NOP 4'h0
`define ysyx_040654_BJU_JAL 4'h1
`define ysyx_040654_BJU_JALR 4'h2
`define ysyx_040654_BJU_BEQ 4'h3
`define ysyx_040654_BJU_BNE 4'h4
`define ysyx_040654_BJU_BLT 4'h5
`define ysyx_040654_BJU_BGE 4'h6
`define ysyx_040654_BJU_BLTU 4'h7
`define ysyx_040654_BJU_BGEU 4'h8

`define ysyx_040654_LSU_NOP 4'h0
`define ysyx_040654_LSU_LD 4'h1
`define ysyx_040654_LSU_LW 4'h2
`define ysyx_040654_LSU_LH 4'h3
`define ysyx_040654_LSU_LB 4'h4
`define ysyx_040654_LSU_LBU 4'h5
`define ysyx_040654_LSU_LHU 4'h6
`define ysyx_040654_LSU_SD 4'h7
`define ysyx_040654_LSU_SB 4'h8
`define ysyx_040654_LSU_SW 4'h9
`define ysyx_040654_LSU_SH 4'ha 
`define ysyx_040654_LSU_LWU 4'hb



//INST_EXCEPTION
`define ysyx_040654_INST_TYPE_E   7'b1110011
`define ysyx_040654_INST_ECALL_MRET_F3 3'b000
`define ysyx_040654_INST_ECALL_F7 7'b0000000
`define ysyx_040654_INST_MRET_F7  7'b0011000
`define ysyx_040654_INST_CSRRW_F3 3'b001
`define ysyx_040654_INST_CSRRS_F3 3'b010
`define ysyx_040654_INST_CSRRC_F3 3'b011
`define ysyx_040654_INST_CSRRSI_F3 3'b110
`define ysyx_040654_INST_CSRRCI_F3 3'b111
`define ysyx_040654_INST_CSRRWI_F3 3'b101


`define ysyx_040654_CSR_NOP 4'd0
`define ysyx_040654_CSR_ECALL 4'd1
`define ysyx_040654_CSR_MRET 4'd2
`define ysyx_040654_CSR_CSRRW 4'd3
`define ysyx_040654_CSR_CSRRS 4'd4
`define ysyx_040654_CSR_CSRRSI 4'd5
`define ysyx_040654_CSR_CSRRCI 4'd6
`define ysyx_040654_CSR_CSRRC 4'd7
`define ysyx_040654_CSR_CSRRWI 4'd8

//CSR_ADDR
`define ysyx_040654_MSTATUS_ADDR 12'h300
`define ysyx_040654_MTVEC_ADDR 12'h305
`define ysyx_040654_MEPC_ADDR 12'h341
`define ysyx_040654_MCAUSE_ADDR 12'h342
`define ysyx_040654_MIE_ADDR 12'h304
`define ysyx_040654_MIP_ADDR 12'h344

//CSR_NAME
`define ysyx_040654_MSTATUS 3'd0
`define ysyx_040654_MTVEC   3'd1
`define ysyx_040654_MEPC    3'd2
`define ysyx_040654_MCAUSE  3'd3
`define ysyx_040654_MIE     3'd4
`define ysyx_040654_MIP     3'd5

//INST_I
`define ysyx_040654_INST_TYPE_I 7'b0010011
`define ysyx_040654_INST_ADDI 3'b000
`define ysyx_040654_INST_ANDI 3'b111
`define ysyx_040654_INST_SLTIU 3'b011
`define ysyx_040654_INST_SRAI_SRLI 3'b101  
//fun7[5]
`define ysyx_040654_INST_SRAI 1'b1
`define ysyx_040654_INST_SRLI 1'b0

`define ysyx_040654_INST_ORI 3'b110
`define ysyx_040654_INST_XORI 3'b100
`define ysyx_040654_INST_SLLI 3'b001
`define ysyx_040654_INST_SLTI 3'b010 

`define ysyx_040654_INST_TYPE_I_L 7'b0000011
`define ysyx_040654_INST_LD 3'b011
`define ysyx_040654_INST_LW 3'b010
`define ysyx_040654_INST_LH 3'b001
`define ysyx_040654_INST_LHU 3'b101
`define ysyx_040654_INST_LB 3'b000
`define ysyx_040654_INST_LBU 3'b100
`define ysyx_040654_INST_LWU 3'b110


`define ysyx_040654_INST_TYPE_I_JALR 7'b1100111

`define ysyx_040654_INST_TYPE_I_W 7'b0011011
`define ysyx_040654_INST_ADDIW 3'b000
`define ysyx_040654_INST_SLLIW 3'b001
`define ysyx_040654_INST_SRAIW_SRLIW 3'b101 
//fun7[5]
`define ysyx_040654_INST_SRAIW 1'b1
`define ysyx_040654_INST_SRLIW 1'b0


//INST_R
`define ysyx_040654_INST_TYPE_R 7'b0110011
`define ysyx_040654_INST_SUB_MUL 3'b000
//fun7
`define ysyx_040654_INST_SUB 2'b10
`define ysyx_040654_INST_ADD 2'b00
`define ysyx_040654_INST_MUL 2'b01


`define ysyx_040654_INST_SLL_MULH  3'b001
`define ysyx_040654_INST_SLL 1'b0
`define ysyx_040654_INST_MULH 1'b1

`define ysyx_040654_INST_SLT_MULHSU 3'b010
`define ysyx_040654_INST_SLT 1'b0
`define ysyx_040654_INST_MULHSU 1'b1


`define ysyx_040654_INST_SLTU_MULHU 3'b011
`define ysyx_040654_INST_SLTU 1'b0
`define ysyx_040654_INST_MULHU 1'b1

`define ysyx_040654_INST_XOR_DIV 3'b100
`define ysyx_040654_INST_XOR 1'b0
`define ysyx_040654_INST_DIV 1'b1


`define ysyx_040654_INST_SRL_SRA_DIVU 3'b101
//{fun7[5],fun7[0]}
`define ysyx_040654_INST_SRL 2'b00
`define ysyx_040654_INST_SRA 2'b10
`define ysyx_040654_INST_DIVU 2'b01


`define ysyx_040654_INST_OR_REM 3'b110
`define ysyx_040654_INST_OR 1'b0
`define ysyx_040654_INST_REM 1'b1


`define ysyx_040654_INST_AND_REMU 3'b111
`define ysyx_040654_INST_AND 1'b0
`define ysyx_040654_INST_REMU 1'b1


`define ysyx_040654_INST_TYPE_R_W 7'b0111011
`define ysyx_040654_INST_ADDW_SUBW_MULW 3'b000
//fun7
`define ysyx_040654_INST_SUBW 2'b10
`define ysyx_040654_INST_ADDW 2'b00
`define ysyx_040654_INST_MULW 2'b01

`define ysyx_040654_INST_SLLW 3'b001
`define ysyx_040654_INST_DIVW 3'b100
`define ysyx_040654_INST_REMW 3'b110
`define ysyx_040654_INST_REMUW 3'b111
//fun7
`define ysyx_040654_INST_SRW_DIVUW 3'b101
`define ysyx_040654_INST_SRAW 2'b10
`define ysyx_040654_INST_SRLW 2'b00
`define ysyx_040654_INST_DIVUW 2'b01

//INST_S
`define ysyx_040654_INST_TYPE_S 7'b0100011
`define ysyx_040654_INST_SD 3'b011
`define ysyx_040654_INST_SB 3'b000
`define ysyx_040654_INST_SW 3'b010
`define ysyx_040654_INST_SH 3'b001


//INST_B
`define ysyx_040654_INST_TYPE_B 7'b1100011
`define ysyx_040654_INST_BEQ 3'b000
`define ysyx_040654_INST_BNE 3'b001
`define ysyx_040654_INST_BGE 3'b101
`define ysyx_040654_INST_BLT 3'b100
`define ysyx_040654_INST_BLTU 3'b110
`define ysyx_040654_INST_BGEU 3'b111
//INST_J
`define ysyx_040654_INST_JAL 7'b1101111    //(JAL)

//INST_U
`define ysyx_040654_INST_AUIPC 7'b0010111
`define ysyx_040654_INST_LUI 7'b0110111

`define ysyx_040654_INST_EBREAK 7'b1110011

// Burst types
`define ysyx_040654_AXI_BURST_TYPE_FIXED                                2'b00               //突发类型  FIFO
`define ysyx_040654_AXI_BURST_TYPE_INCR                                 2'b01               //ram  
`define ysyx_040654_AXI_BURST_TYPE_WRAP                                 2'b10
// Access permissions
`define ysyx_040654_AXI_PROT_UNPRIVILEGED_ACCESS                        3'b000
`define ysyx_040654_AXI_PROT_PRIVILEGED_ACCESS                          3'b001
`define ysyx_040654_AXI_PROT_SECURE_ACCESS                              3'b000
`define ysyx_040654_AXI_PROT_NON_SECURE_ACCESS                          3'b010
`define ysyx_040654_AXI_PROT_DATA_ACCESS                                3'b000
`define ysyx_040654_AXI_PROT_INSTRUCTION_ACCESS                         3'b100
// Memory types (AR)
`define ysyx_040654_AXI_ARCACHE_DEVICE_NON_BUFFERABLE                   4'b0000
`define ysyx_040654_AXI_ARCACHE_DEVICE_BUFFERABLE                       4'b0001
`define ysyx_040654_AXI_ARCACHE_NORMAL_NON_CACHEABLE_NON_BUFFERABLE     4'b0010
`define ysyx_040654_AXI_ARCACHE_NORMAL_NON_CACHEABLE_BUFFERABLE         4'b0011
`define ysyx_040654_AXI_ARCACHE_WRITE_THROUGH_NO_ALLOCATE               4'b1010
`define ysyx_040654_AXI_ARCACHE_WRITE_THROUGH_READ_ALLOCATE             4'b1110
`define ysyx_040654_AXI_ARCACHE_WRITE_THROUGH_WRITE_ALLOCATE            4'b1010
`define ysyx_040654_AXI_ARCACHE_WRITE_THROUGH_READ_AND_WRITE_ALLOCATE   4'b1110
`define ysyx_040654_AXI_ARCACHE_WRITE_BACK_NO_ALLOCATE                  4'b1011
`define ysyx_040654_AXI_ARCACHE_WRITE_BACK_READ_ALLOCATE                4'b1111
`define ysyx_040654_AXI_ARCACHE_WRITE_BACK_WRITE_ALLOCATE               4'b1011
`define ysyx_040654_AXI_ARCACHE_WRITE_BACK_READ_AND_WRITE_ALLOCATE      4'b1111
// Memory types (AW)
`define ysyx_040654_AXI_AWCACHE_DEVICE_NON_BUFFERABLE                   4'b0000
`define ysyx_040654_AXI_AWCACHE_DEVICE_BUFFERABLE                       4'b0001
`define ysyx_040654_AXI_AWCACHE_NORMAL_NON_CACHEABLE_NON_BUFFERABLE     4'b0010
`define ysyx_040654_AXI_AWCACHE_NORMAL_NON_CACHEABLE_BUFFERABLE         4'b0011
`define ysyx_040654_AXI_AWCACHE_WRITE_THROUGH_NO_ALLOCATE               4'b0110
`define ysyx_040654_AXI_AWCACHE_WRITE_THROUGH_READ_ALLOCATE             4'b0110
`define ysyx_040654_AXI_AWCACHE_WRITE_THROUGH_WRITE_ALLOCATE            4'b1110
`define ysyx_040654_AXI_AWCACHE_WRITE_THROUGH_READ_AND_WRITE_ALLOCATE   4'b1110
`define ysyx_040654_AXI_AWCACHE_WRITE_BACK_NO_ALLOCATE                  4'b0111
`define ysyx_040654_AXI_AWCACHE_WRITE_BACK_READ_ALLOCATE                4'b0111
`define ysyx_040654_AXI_AWCACHE_WRITE_BACK_WRITE_ALLOCATE               4'b1111
`define ysyx_040654_AXI_AWCACHE_WRITE_BACK_READ_AND_WRITE_ALLOCATE      4'b1111

`define ysyx_040654_AXI_SIZE_BYTES_1                                    3'b000                //突发宽度一个数据的宽度
`define ysyx_040654_AXI_SIZE_BYTES_2                                    3'b001
`define ysyx_040654_AXI_SIZE_BYTES_4                                    3'b010
`define ysyx_040654_AXI_SIZE_BYTES_8                                    3'b011
`define ysyx_040654_AXI_SIZE_BYTES_16                                   3'b100
`define ysyx_040654_AXI_SIZE_BYTES_32                                   3'b101
`define ysyx_040654_AXI_SIZE_BYTES_64                                   3'b110
`define ysyx_040654_AXI_SIZE_BYTES_128                                  3'b111


module ysyx_040654 (
    input                               clock,
    input                               reset,
    input                               io_interrupt,
    
    input                               io_master_awready,              
    output                              io_master_awvalid,
    output [3:0]                        io_master_awid,
    output [31:0]                       io_master_awaddr,
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
    input  [3:0]                        io_master_bid,
    input  [1:0]                        io_master_bresp,

    input                               io_master_arready,                
    output                              io_master_arvalid,
    output [3:0]                        io_master_arid,
    output [31:0]                       io_master_araddr,
    output [7:0]                        io_master_arlen,
    output [2:0]                        io_master_arsize,
    output [1:0]                        io_master_arburst,
    
    output                              io_master_rready,                 
    input                               io_master_rvalid,
    input  [3:0]                        io_master_rid,                
    input  [1:0]                        io_master_rresp,
    input  [63:0]                       io_master_rdata,
    input                               io_master_rlast,

    output                              io_slave_awready,
    input                               io_slave_awvalid,
    input   [3:0]                       io_slave_awid,
    input   [31:0]                      io_slave_awaddr,
    input   [7:0]                       io_slave_awlen,
    input   [2:0]                       io_slave_awsize,
    input   [1:0]                       io_slave_awburst,
    output                              io_slave_wready,
    input                               io_slave_wvalid,
    input   [63:0]                      io_slave_wdata,
    input   [7:0]                       io_slave_wstrb,
    input                               io_slave_wlast,
    input                               io_slave_bready,
    output                              io_slave_bvalid,
    output  [3:0]                       io_slave_bid,
    output  [1:0]                       io_slave_bresp,
    output                              io_slave_arready,
    input                               io_slave_arvalid,
    input   [3:0]                       io_slave_arid,
    input   [31:0]                      io_slave_araddr,
    input   [7:0]                       io_slave_arlen,
    input   [2:0]                       io_slave_arsize,
    input   [1:0]                       io_slave_arburst,
    input                               io_slave_rready,
    output                              io_slave_rvalid,
    output  [3:0]                       io_slave_rid,
    output  [1:0]                       io_slave_rresp,
    output  [63:0]                      io_slave_rdata,
    output                              io_slave_rlast,

    output  [5:0]                       io_sram0_addr,
    output                              io_sram0_cen,
    output                              io_sram0_wen,
    output  [127:0]                     io_sram0_wmask,
    output  [127:0]                     io_sram0_wdata,
    input   [127:0]                     io_sram0_rdata,

    output  [5:0]                       io_sram1_addr,
    output                              io_sram1_cen,
    output                              io_sram1_wen,
    output  [127:0]                     io_sram1_wmask,
    output  [127:0]                     io_sram1_wdata,
    input   [127:0]                     io_sram1_rdata,
    
    output  [5:0]                       io_sram2_addr,
    output                              io_sram2_cen,
    output                              io_sram2_wen,
    output  [127:0]                     io_sram2_wmask,
    output  [127:0]                     io_sram2_wdata,
    input   [127:0]                     io_sram2_rdata,

    output  [5:0]                       io_sram3_addr,
    output                              io_sram3_cen,
    output                              io_sram3_wen,
    output  [127:0]                     io_sram3_wmask,
    output  [127:0]                     io_sram3_wdata,
    input   [127:0]                     io_sram3_rdata,

    output  [5:0]                       io_sram4_addr,
    output                              io_sram4_cen,
    output                              io_sram4_wen,
    output  [127:0]                     io_sram4_wmask,
    output  [127:0]                     io_sram4_wdata,
    input   [127:0]                     io_sram4_rdata,

    output  [5:0]                       io_sram5_addr,
    output                              io_sram5_cen,
    output                              io_sram5_wen,
    output  [127:0]                     io_sram5_wmask,
    output  [127:0]                     io_sram5_wdata,
    input   [127:0]                     io_sram5_rdata,
    
    output  [5:0]                       io_sram6_addr,
    output                              io_sram6_cen,
    output                              io_sram6_wen,
    output  [127:0]                     io_sram6_wmask,
    output  [127:0]                     io_sram6_wdata,
    input   [127:0]                     io_sram6_rdata,

    output  [5:0]                       io_sram7_addr,
    output                              io_sram7_cen,
    output                              io_sram7_wen,
    output  [127:0]                     io_sram7_wmask,
    output  [127:0]                     io_sram7_wdata,
    input   [127:0]                     io_sram7_rdata
);  
    wire                            clk;
    wire                            rstn;
//--------------------- IF_STAGE -----------------------//
    wire    [`ysyx_040654_MemAddrBus]           if_pc;
    wire                            if_read_valid;
    wire                            if_imem_axi_read_valid; 
    wire                            if_imem_axi_read_ready; 
    wire    [`ysyx_040654_DataBus]              if_imem_axi_read_data;
    wire    [`ysyx_040654_MemAddrBus]           if_imem_axi_read_addr;
    wire                            if_imem_axi_read_last;
    wire                            if_device_axi_read_valid;
    wire                            if_device_axi_read_ready;
    wire    [`ysyx_040654_MemAddrBus]           if_device_axi_read_addr;
    wire    [`ysyx_040654_DataBus]              if_device_axi_read_data;
    wire                            if_icache_cen;
    wire                            if_icache_wen;
    wire    [`ysyx_040654_CacheBus]             if_icache_bwen;
    wire    [`ysyx_040654_CacheAddrBus]         if_icache_addr;
    wire    [`ysyx_040654_CacheBus]             if_icache_wdata;
    wire    [3:0]                   if_icache_sel;                   
    wire    [`ysyx_040654_CacheBus]             if_icache_rdata;
    wire    [`ysyx_040654_InstBus]              if_inst;
    wire                            if_busy_flag;

//--------------------- ID_STAGE -----------------------//
    wire    [`ysyx_040654_InstBus]              id_inst;
    wire    [`ysyx_040654_MemAddrBus]           id_pc;
    wire    [`ysyx_040654_DataBus]              id_reg_rdata1;
    wire    [`ysyx_040654_DataBus]              id_reg_rdata2;
    wire    [`ysyx_040654_RegAddrBus]           id_reg_raddr1;
    wire    [`ysyx_040654_RegAddrBus]           id_reg_raddr2;
    wire                            id_reg_ren1;
    wire                            id_reg_ren2;
    wire    [`ysyx_040654_DataBus]              id_src1;
    wire    [`ysyx_040654_DataBus]              id_src2;  
    wire    [`ysyx_040654_ALU_OP-1:0]           id_alu_op;
    wire    [`ysyx_040654_LSU_OP-1:0]           id_lsu_op;
    wire                            id_mem_wen;
    wire    [`ysyx_040654_DataBus]              id_mem_wdata;
    wire                            id_mem_ren;
    wire                            id_reg_wen;
    wire    [1:0]                   id_reg_wsel;
    wire    [`ysyx_040654_RegAddrBus]           id_reg_waddr;
    wire    [`ysyx_040654_CSR_OP-1:0]           id_csr_op;
    wire    [`ysyx_040654_CsrAddrBus]           id_csr_rwaddr;
    wire    [`ysyx_040654_DataBus]              id_csr_wdata;
    wire                            id_branch_flag;
    wire    [`ysyx_040654_MemAddrBus]           id_branch_pc;
    wire    [`ysyx_040654_DataBus]              id_bju_result;
    wire    [`ysyx_040654_BJU_OP-1:0]           id_bju_op;
    wire    [`ysyx_040654_MemAddrBus]           id_next_pc;
    wire                            id_dcache_flush_flag;  

//--------------------- EX_STAGE -----------------------//
    wire    [`ysyx_040654_MemAddrBus]           ex_pc;
    wire    [`ysyx_040654_InstBus]              ex_inst;
    wire    [`ysyx_040654_DataBus]              ex_src1;
    wire    [`ysyx_040654_DataBus]              ex_src2;
    wire    [`ysyx_040654_ALU_OP-1:0]           ex_alu_op;
    wire                            ex_mem_wen;
    wire    [`ysyx_040654_DataBus]              ex_mem_wdata;
    wire                            ex_mem_ren;
    wire    [`ysyx_040654_LSU_OP-1:0]           ex_lsu_op;
    wire                            ex_reg_wen;
    wire    [1:0]                   ex_reg_wsel;
    wire    [`ysyx_040654_RegAddrBus]           ex_reg_waddr;
    wire    [`ysyx_040654_CSR_OP-1:0]           ex_csr_op;
    wire    [`ysyx_040654_CsrAddrBus]           ex_csr_rwaddr;
    wire    [`ysyx_040654_DataBus]              ex_csr_wdata;
    wire    [`ysyx_040654_DataBus]              ex_bju_result;
    wire                            ex_busy_flag;
    wire    [`ysyx_040654_DataBus]              ex_alu_result;
    wire    [`ysyx_040654_MemAddrBus]           ex_next_pc;
    wire                            ex_dcache_flush_flag;


//--------------------- MEM_STAGE -----------------------//
    wire    [`ysyx_040654_MemAddrBus]           mem_pc;
    wire    [`ysyx_040654_MemAddrBus]           mem_next_pc;
    wire    [`ysyx_040654_InstBus]              mem_inst;
    wire                            mem_mem_wen;
    wire    [`ysyx_040654_DataBus]              mem_mem_wdata;
    wire                            mem_mem_ren;
    wire    [`ysyx_040654_LSU_OP-1:0]           mem_lsu_op;
    wire                            mem_reg_wen;
    wire    [1:0]                   mem_reg_wsel;
    wire    [`ysyx_040654_RegAddrBus]           mem_reg_waddr;
    wire    [`ysyx_040654_CSR_OP-1:0]           mem_csr_op;
    wire    [`ysyx_040654_CsrAddrBus]           mem_csr_rwaddr;
    wire    [`ysyx_040654_DataBus]              mem_csr_wdata;
    wire    [`ysyx_040654_DataBus]              mem_bju_result;
    wire    [`ysyx_040654_DataBus]              mem_alu_result;
    wire    [`ysyx_040654_MemAddrBus]           mem_mem_rwaddr;
    wire    [`ysyx_040654_DataBus]              mem_mem_rdata;
    wire                            mem_mem_read_valid;
    wire                            mem_mem_write_valid;
    wire                            mem_busy_flag;        
    wire                            mem_dmem_axi_read_valid;
    wire                            mem_dmem_axi_read_ready;
    wire                            mem_dmem_axi_write_valid;
    wire                            mem_dmem_axi_write_ready;     
    wire    [`ysyx_040654_DataBus]              mem_dmem_axi_read_data;
    wire    [`ysyx_040654_MemAddrBus]           mem_dmem_axi_read_addr;
    wire                            mem_dmem_axi_read_last;
    wire    [`ysyx_040654_MemAddrBus]           mem_dmem_axi_write_addr;
    wire    [`ysyx_040654_DataBus]              mem_dmem_axi_write_data;
    wire    [7:0]                   mem_dmem_axi_write_mask;
    wire                            mem_dmem_axi_write_last; 
    wire                            mem_dmem_axi_write_resp;
    wire                            mem_dcache_flush_flag;
    wire                            mem_fencei_flag;  
    

    
    wire                            mem_device_axi_read_valid;
    wire                            mem_device_axi_read_ready;
    wire    [`ysyx_040654_MemAddrBus]           mem_device_axi_read_addr;
    wire    [`ysyx_040654_DataBus]              mem_device_axi_read_data;
    wire                            mem_device_axi_write_valid;
    wire                            mem_device_axi_write_ready;
    wire    [`ysyx_040654_DataBus]              mem_device_axi_write_data;
    wire    [`ysyx_040654_MemAddrBus]           mem_device_axi_write_addr;
    wire    [7:0]                   mem_device_axi_write_mask;
    wire                            mem_dcache_cen;
    wire                            mem_dcache_wen;
    wire    [127:0]                 mem_dcache_bwen;
    wire    [5:0]                   mem_dcache_addr;
    wire    [127:0]                 mem_dcache_wdata;
    wire    [3:0]                   mem_dcache_sel;
    wire    [127:0]                 mem_dcache_rdata;
    wire    [`ysyx_040654_DataBus]              mem_csr_rdata;
    wire    [`ysyx_040654_MemAddrBus]           mem_excp_pc;
    wire                            mem_excp_flag;
    wire                            mem_timer_intr;


    wire                            mem_device_axi_ar_ready;
    wire                            mem_device_axi_ar_valid;
    wire                            mem_device_axi_r_ready;
    wire                            mem_device_axi_r_valid;
    wire    [1:0]                   mem_device_axi_r_resp;
    wire    [`ysyx_040654_DataBus]              mem_device_axi_r_data;
    wire                            mem_device_axi_r_last;
    wire    [3:0]                   mem_device_axi_r_id;
    wire                            mem_device_axi_aw_ready;
    wire                            mem_device_axi_aw_valid;
    wire                            mem_device_axi_w_ready;
    wire                            mem_device_axi_w_valid;
    wire                            mem_device_axi_b_ready;
    wire                            mem_device_axi_b_valid;
    wire    [1:0]                   mem_device_axi_b_resp;
    wire    [3:0]                   mem_device_axi_b_id;
    

    wire                            mem_clint_axi_ar_ready;
    wire                            mem_clint_axi_ar_valid;
    wire                            mem_clint_axi_r_ready;
    wire                            mem_clint_axi_r_valid;
    wire    [1:0]                   mem_clint_axi_r_resp;
    wire    [`ysyx_040654_DataBus]              mem_clint_axi_r_data;
    wire                            mem_clint_axi_r_last;
    wire    [3:0]                   mem_clint_axi_r_id;
    wire                            clint_timer_intr;
    wire    [`ysyx_040654_MemAddrBus]           axi_ar_addr;
    wire    [3:0]                   axi_ar_id;
    wire    [7:0]                   axi_ar_len;
    wire    [2:0]                   axi_ar_size;
    wire    [1:0]                   axi_ar_burst;
    wire                            mem_clint_axi_aw_valid;
    wire                            mem_clint_axi_aw_ready;
    wire    [`ysyx_040654_MemAddrBus]           axi_aw_addr;
    wire    [3:0]                   axi_aw_id;
    wire    [7:0]                   axi_aw_len;
    wire    [2:0]                   axi_aw_size;
    wire    [1:0]                   axi_aw_burst;
    wire                            mem_clint_axi_w_valid;
    wire    [`ysyx_040654_DataBus]              axi_w_data;
    wire    [7:0]                   axi_w_strb;
    wire                            axi_w_last;
    wire                            mem_clint_axi_w_ready; 
    wire                            mem_clint_axi_b_valid;
    wire    [1:0]                   mem_clint_axi_b_resp;
    wire    [3:0]                   mem_clint_axi_b_id;
    wire                            mem_clint_axi_b_ready;


//--------------------- WB_STAGE -----------------------//
    wire                            wb_reg_wen;      
    wire    [1:0]                   wb_reg_wsel;
    wire    [`ysyx_040654_RegAddrBus]           wb_reg_waddr;
    wire    [`ysyx_040654_DataBus]              wb_alu_result;
    wire    [`ysyx_040654_DataBus]              wb_bju_result;
    wire    [`ysyx_040654_DataBus]              wb_mem_rdata;
    wire    [`ysyx_040654_DataBus]              wb_csr_rdata;
    wire    [`ysyx_040654_DataBus]              wb_reg_wdata;


    wire    [3:0]                   hazard_stall_flag;  
    wire    [3:0]                   hazard_flush_flag;
    wire                            if_stall_flag;
    wire                            if_flush_flag; 
    wire                            id_flush_flag;
    wire                            ex_stall_flag;
    wire                            ex_flush_flag;
    wire                            mem_flush_flag;
    wire                            hazard_branch_flag;
    wire    [`ysyx_040654_MemAddrBus]           hazard_branch_pc;  
    wire                            hazard_excp_flag;
    wire    [`ysyx_040654_MemAddrBus]           hazard_excp_pc;
    wire                            hazard_fencei_flag;
    wire    [`ysyx_040654_MemAddrBus]           hazard_fencei_pc;  

    ysyx_040654_if_stage if_stage(
        .clk                        (clk                ),
        .rstn                       (rstn               ),
        .if_stall_flag_i            (if_stall_flag      ),
        .if_branch_flag_i           (hazard_branch_flag ),
        .if_excp_flag_i             (hazard_excp_flag   ),
        .if_branch_pc_i             (hazard_branch_pc   ),
        .if_excp_pc_i               (hazard_excp_pc     ),
        .if_fencei_flag_i           (hazard_fencei_flag ),
        .if_fencei_pc_i             (hazard_fencei_pc   ),
        .if_pc_o                    (if_pc              ),
        .if_inst_o                  (if_inst            ),
        .if_read_valid_i            (if_read_valid      ),
        .if_imem_axi_read_valid_o   (if_imem_axi_read_valid),
        .if_imem_axi_read_ready_i   (if_imem_axi_read_ready),
        .if_imem_axi_read_data_i    (if_imem_axi_read_data ),
        .if_imem_axi_read_addr_o    (if_imem_axi_read_addr ),
        .if_imem_axi_read_last_i    (if_imem_axi_read_last ),
        .if_device_axi_read_valid_o (if_device_axi_read_valid),
        .if_device_axi_read_ready_i (if_device_axi_read_ready),
        .if_device_axi_read_addr_o  (if_device_axi_read_addr ),
        .if_device_axi_read_data_i  (if_device_axi_read_data ),
        .if_icache_cen_o            (if_icache_cen      ),
        .if_icache_wen_o            (if_icache_wen      ),
        .if_icache_bwen_o           (if_icache_bwen     ),
        .if_icache_addr_o           (if_icache_addr     ),
        .if_icache_wdata_o          (if_icache_wdata    ),
        .if_icache_sel_o            (if_icache_sel      ),
        .if_icache_rdata_i          (if_icache_rdata    ),
        .if_busy_flag_o             (if_busy_flag       )
    );

    
    
    ysyx_040654_if_reg if_reg(
    	.clk             (clk               ),
        .rstn            (rstn              ),
        .if_flush_flag_i (if_flush_flag     ),
        .if_stall_flag_i (hazard_stall_flag ),
        .if_pc_i         (if_pc             ),
        .id_pc_o         (id_pc             ),
        .if_inst_i       (if_inst           ),
        .id_inst_o       (id_inst           )
    );

    ysyx_040654_id_stage id_stage(
        .id_inst_i              (id_inst            ),
        .id_reg_rdata1_i        (id_reg_rdata1      ),
        .id_reg_rdata2_i        (id_reg_rdata2      ),
        .id_reg_raddr1_o        (id_reg_raddr1      ),
        .id_reg_raddr2_o        (id_reg_raddr2      ),
        .id_reg_ren1_o          (id_reg_ren1        ),
        .id_reg_ren2_o          (id_reg_ren2        ),
        .id_pc_i                (id_pc              ),
        .id_src1_o              (id_src1            ),
        .id_src2_o              (id_src2            ),
        .id_alu_op_o            (id_alu_op          ),
        .id_mem_wen_o           (id_mem_wen         ),
        .id_mem_wdata_o         (id_mem_wdata       ),
        .id_mem_ren_o           (id_mem_ren         ),
        .id_lsu_op_o            (id_lsu_op          ),
        .id_reg_wen_o           (id_reg_wen         ),
        .id_reg_wsel_o          (id_reg_wsel        ),
        .id_reg_waddr_o         (id_reg_waddr       ),
        .id_csr_op_o            (id_csr_op          ),
        .id_csr_rwaddr_o        (id_csr_rwaddr      ),
        .id_csr_wdata_o         (id_csr_wdata       ),
        .id_branch_flag_o       (id_branch_flag     ),
        .id_branch_addr_o       (id_branch_pc       ),
        .id_bju_result_o        (id_bju_result      ),
        .id_bju_op_o            (id_bju_op          ),
        .id_next_pc_o           (id_next_pc         ),
        .id_cache_flush_flag_o  (id_dcache_flush_flag)
    );
    
    ysyx_040654_regfile regfile(
    	.clk              (clk                  ),
        .rstn             (rstn                 ),
        .reg_raddr1_i     (id_reg_raddr1        ),
        .reg_raddr2_i     (id_reg_raddr2        ),
        .reg_ren1_i       (id_reg_ren1          ),
        .reg_ren2_i       (id_reg_ren2          ),
        .reg_rdata1_o     (id_reg_rdata1        ),
        .reg_rdata2_o     (id_reg_rdata2        ),
        .reg_waddr_i      (wb_reg_waddr         ),
        .reg_wen_i        (wb_reg_wen           ),
        .reg_wdata_i      (wb_reg_wdata         )
    );
    
    ysyx_040654_id_reg id_reg(
    	.clk                    (clk               ),
        .rstn                   (rstn              ),
        .id_flush_flag_i        (id_flush_flag     ),
        .id_stall_flag_i        (hazard_stall_flag ),
        .id_inst_i              (id_inst           ),
        .ex_inst_o              (ex_inst           ),
        .id_pc_i                (id_pc             ),
        .id_src1_i              (id_src1           ),
        .id_src2_i              (id_src2           ),
        .id_alu_op_i            (id_alu_op         ),
        .id_mem_wen_i           (id_mem_wen        ),
        .id_mem_wdata_i         (id_mem_wdata      ),
        .id_mem_ren_i           (id_mem_ren        ),
        .id_lsu_op_i            (id_lsu_op         ),
        .id_reg_wen_i           (id_reg_wen        ),
        .id_reg_wsel_i          (id_reg_wsel       ),
        .id_reg_waddr_i         (id_reg_waddr      ),
        .id_csr_op_i            (id_csr_op         ),
        .id_csr_rwaddr_i        (id_csr_rwaddr     ),
        .id_csr_wdata_i         (id_csr_wdata      ),
        .id_bju_result_i        (id_bju_result     ),
        .id_next_pc_i           (id_next_pc        ),
        .id_cache_flush_flag_i  (id_dcache_flush_flag),
        .ex_pc_o                (ex_pc             ),
        .ex_src1_o              (ex_src1           ),
        .ex_src2_o              (ex_src2           ),
        .ex_alu_op_o            (ex_alu_op         ),
        .ex_mem_wen_o           (ex_mem_wen        ),
        .ex_mem_wdata_o         (ex_mem_wdata      ),
        .ex_mem_ren_o           (ex_mem_ren        ),
        .ex_lsu_op_o            (ex_lsu_op         ),
        .ex_reg_wen_o           (ex_reg_wen        ),
        .ex_reg_wsel_o          (ex_reg_wsel       ),
        .ex_reg_waddr_o         (ex_reg_waddr      ),
        .ex_csr_op_o            (ex_csr_op         ),
        .ex_csr_rwaddr_o        (ex_csr_rwaddr     ),
        .ex_csr_wdata_o         (ex_csr_wdata      ),
        .ex_bju_result_o        (ex_bju_result     ),
        .ex_next_pc_o           (ex_next_pc        ),
        .ex_cache_flush_flag_o  (ex_dcache_flush_flag)
    );
    
    ysyx_040654_ex_stage ex_stage(
        .clk                (clk                ),
        .rstn               (rstn               ),
        .ex_stall_flag_i    (ex_stall_flag      ),
        .ex_alu_op_i        (ex_alu_op          ),
        .ex_src1_i          (ex_src1            ),
        .ex_src2_i          (ex_src2            ),
        .ex_alu_busy_flag_o (ex_busy_flag       ),
        .ex_alu_result_o    (ex_alu_result      )
    );
    
    ysyx_040654_ex_reg ex_reg(
    	.clk                    (clk                  ),
        .rstn                   (rstn                 ),
        .ex_stall_flag_i        (hazard_stall_flag    ),
        .ex_flush_flag_i        (ex_flush_flag        ),
        .ex_pc_i                (ex_pc                ),
        .ex_inst_i              (ex_inst              ),
        .ex_mem_wen_i           (ex_mem_wen           ),
        .ex_mem_wdata_i         (ex_mem_wdata         ),
        .ex_mem_ren_i           (ex_mem_ren           ),
        .ex_lsu_op_i            (ex_lsu_op            ),
        .ex_reg_wen_i           (ex_reg_wen           ),
        .ex_reg_wsel_i          (ex_reg_wsel          ),
        .ex_reg_waddr_i         (ex_reg_waddr         ),
        .ex_csr_op_i            (ex_csr_op            ),
        .ex_csr_rwaddr_i        (ex_csr_rwaddr        ),
        .ex_csr_wdata_i         (ex_csr_wdata         ),
        .ex_bju_result_i        (ex_bju_result        ),
        .ex_alu_result_i        (ex_alu_result        ),
        .ex_next_pc_i           (ex_next_pc           ),
        .ex_cache_flush_flag_i  (ex_dcache_flush_flag ),
        .mem_pc_o               (mem_pc               ),
        .mem_inst_o             (mem_inst             ),
        .mem_mem_wen_o          (mem_mem_wen          ),
        .mem_mem_wdata_o        (mem_mem_wdata        ),
        .mem_mem_ren_o          (mem_mem_ren          ),
        .mem_lsu_op_o           (mem_lsu_op           ),
        .mem_reg_wen_o          (mem_reg_wen          ),
        .mem_reg_wsel_o         (mem_reg_wsel         ),
        .mem_reg_waddr_o        (mem_reg_waddr        ),
        .mem_csr_op_o           (mem_csr_op           ),
        .mem_csr_rwaddr_o       (mem_csr_rwaddr       ),
        .mem_csr_wdata_o        (mem_csr_wdata        ),
        .mem_bju_result_o       (mem_bju_result       ),
        .mem_alu_result_o       (mem_alu_result       ),
        .mem_mem_rwaddr_o       (mem_mem_rwaddr       ),
        .mem_next_pc_o          (mem_next_pc          ),
        .mem_cache_flush_flag_o (mem_dcache_flush_flag)
    );
    
    ysyx_040654_mem_stage mem_stage(
    	.clk                              (clk                              ),
        .rstn                             (rstn                             ),
        .mem_lsu_op_i                     (mem_lsu_op                       ),
        .mem_rwaddr_i                     (mem_mem_rwaddr                   ),
        .mem_rdata_o                      (mem_mem_rdata                    ),
        .mem_wdata_i                      (mem_mem_wdata                    ),
        .mem_read_valid_i                 (mem_mem_read_valid               ),
        .mem_write_valid_i                (mem_mem_write_valid              ),
        .mem_dmem_axi_read_valid_o        (mem_dmem_axi_read_valid          ),
        .mem_dmem_axi_read_ready_i        (mem_dmem_axi_read_ready          ),
        .mem_dmem_axi_read_data_i         (mem_dmem_axi_read_data           ),
        .mem_dmem_axi_read_addr_o         (mem_dmem_axi_read_addr           ),
        .mem_dmem_axi_read_last_i         (mem_dmem_axi_read_last           ),
        .mem_dmem_axi_write_valid_o       (mem_dmem_axi_write_valid         ),
        .mem_dmem_axi_write_ready_i       (mem_dmem_axi_write_ready         ),
        .mem_dmem_axi_write_addr_o        (mem_dmem_axi_write_addr          ),
        .mem_dmem_axi_write_data_o        (mem_dmem_axi_write_data          ),
        .mem_dmem_axi_write_mask_o        (mem_dmem_axi_write_mask          ),
        .mem_dmem_axi_write_last_i        (mem_dmem_axi_write_last          ),
        .mem_dmem_axi_write_resp_i        (mem_dmem_axi_write_resp          ),
        .mem_device_axi_read_valid_o      (mem_device_axi_read_valid        ),
        .mem_device_axi_read_ready_i      (mem_device_axi_read_ready        ),
        .mem_device_axi_read_addr_o       (mem_device_axi_read_addr         ),
        .mem_device_axi_read_data_i       (mem_device_axi_read_data         ),
        .mem_device_axi_write_data_o      (mem_device_axi_write_data        ),
        .mem_device_axi_write_addr_o      (mem_device_axi_write_addr        ),
        .mem_device_axi_write_mask_o      (mem_device_axi_write_mask        ),
        .mem_device_axi_write_valid_o     (mem_device_axi_write_valid       ),
        .mem_device_axi_write_ready_i     (mem_device_axi_write_ready       ),
        .mem_dcache_cen_o                 (mem_dcache_cen                   ),
        .mem_dcache_wen_o                 (mem_dcache_wen                   ),
        .mem_dcache_bwen_o                (mem_dcache_bwen                  ),
        .mem_dcache_addr_o                (mem_dcache_addr                  ),
        .mem_dcache_wdata_o               (mem_dcache_wdata                 ),
        .mem_dcache_sel_o                 (mem_dcache_sel                   ),
        .mem_dcache_rdata_i               (mem_dcache_rdata                 ),
        .mem_busy_flag_o                  (mem_busy_flag                    ),
        .mem_dcache_flush_flag_i          (mem_dcache_flush_flag            ),
        .mem_fencei_flag_o                (mem_fencei_flag                  )
    );

    ysyx_040654_csr csr(
    	.clk                (clk              ),
        .rstn               (rstn             ),
        .pc_next_i          (mem_next_pc      ),
        .mem_inst_i         (mem_inst         ),
        .mem_busy_flag_i    (mem_busy_flag    ),
        .timer_intr_i       (clint_timer_intr ),
        .csr_op_i           (mem_csr_op       ),
        .pc_i               (mem_pc           ),
        .csr_addr_i         (mem_csr_rwaddr   ),
        .csr_src_i          (mem_csr_wdata    ),
        .csr_rdata_o        (mem_csr_rdata    ),
        .excp_pc_o          (mem_excp_pc      ),
        .excp_flag_o        (mem_excp_flag    )
    );
    


    ysyx_040654_biu axi_biu(
    	.aclk                     (clk                       ),
        .resetn                   (rstn                      ),
        .if_cache_read_valid_i    (if_imem_axi_read_valid    ),
        .if_cache_read_ready_o    (if_imem_axi_read_ready    ),
        .if_cache_read_addr_i     (if_imem_axi_read_addr     ),
        .if_cache_read_data_o     (if_imem_axi_read_data     ),
        .if_cache_read_last_o     (if_imem_axi_read_last     ),
        .if_device_read_valid_i   (if_device_axi_read_valid  ),
        .if_device_read_ready_o   (if_device_axi_read_ready  ),
        .if_device_read_addr_i    (if_device_axi_read_addr   ),
        .if_device_read_data_o    (if_device_axi_read_data   ),
        .mem_lsu_op_i             (mem_lsu_op                ),
        .mem_cache_read_valid_i   (mem_dmem_axi_read_valid   ),
        .mem_cache_read_ready_o   (mem_dmem_axi_read_ready   ),
        .mem_cache_read_addr_i    (mem_dmem_axi_read_addr    ),
        .mem_cache_read_data_o    (mem_dmem_axi_read_data    ),
        .mem_cache_read_last_o    (mem_dmem_axi_read_last    ),
        .mem_cache_write_valid_i  (mem_dmem_axi_write_valid  ),
        .mem_cache_write_ready_o  (mem_dmem_axi_write_ready  ),
        .mem_cache_write_data_i   (mem_dmem_axi_write_data   ),
        .mem_cache_write_addr_i   (mem_dmem_axi_write_addr   ),
        .mem_cache_write_mask_i   (mem_dmem_axi_write_mask   ),
        .mem_cache_write_last_o   (mem_dmem_axi_write_last   ),
        .mem_cache_write_resp_o   (mem_dmem_axi_write_resp   ),
        .mem_device_read_valid_i  (mem_device_axi_read_valid  ),
        .mem_device_read_ready_o  (mem_device_axi_read_ready  ),
        .mem_device_read_addr_i   (mem_device_axi_read_addr   ),
        .mem_device_read_data_o   (mem_device_axi_read_data   ),
        .mem_device_write_valid_i (mem_device_axi_write_valid ),
        .mem_device_write_ready_o (mem_device_axi_write_ready ),
        .mem_device_write_data_i  (mem_device_axi_write_data  ),
        .mem_device_write_addr_i  (mem_device_axi_write_addr  ),
        .mem_device_write_mask_i  (mem_device_axi_write_mask  ),
        .clint_axi_ar_ready_i     (mem_clint_axi_ar_ready     ),
        .clint_axi_ar_valid_o     (mem_clint_axi_ar_valid     ),
        .device_axi_ar_ready_i    (mem_device_axi_ar_ready    ),
        .device_axi_ar_valid_o    (mem_device_axi_ar_valid    ),
        .axi_ar_addr_o            (axi_ar_addr                ),
        .axi_ar_id_o              (axi_ar_id                  ),
        .axi_ar_len_o             (axi_ar_len                 ),
        .axi_ar_size_o            (axi_ar_size                ),
        .axi_ar_burst_o           (axi_ar_burst               ),
        .clint_axi_r_ready_o      (mem_clint_axi_r_ready      ),
        .clint_axi_r_valid_i      (mem_clint_axi_r_valid      ),
        .device_axi_r_ready_o     (mem_device_axi_r_ready     ),
        .device_axi_r_valid_i     (mem_device_axi_r_valid     ),
        .clint_axi_r_resp_i       (mem_clint_axi_r_resp       ),
        .clint_axi_r_data_i       (mem_clint_axi_r_data       ),
        .clint_axi_r_last_i       (mem_clint_axi_r_last       ),
        .clint_axi_r_id_i         (mem_clint_axi_r_id         ),
        .device_axi_r_resp_i      (mem_device_axi_r_resp      ),
        .device_axi_r_data_i      (mem_device_axi_r_data      ),
        .device_axi_r_last_i      (mem_device_axi_r_last      ),
        .device_axi_r_id_i        (mem_device_axi_r_id        ),
        .clint_axi_aw_ready_i     (mem_clint_axi_aw_ready     ),
        .clint_axi_aw_valid_o     (mem_clint_axi_aw_valid     ),
        .device_axi_aw_ready_i    (mem_device_axi_aw_ready    ),
        .device_axi_aw_valid_o    (mem_device_axi_aw_valid    ),
        .axi_aw_addr_o            (axi_aw_addr                ),
        .axi_aw_id_o              (axi_aw_id                  ),
        .axi_aw_len_o             (axi_aw_len                 ),
        .axi_aw_size_o            (axi_aw_size                ),
        .axi_aw_burst_o           (axi_aw_burst               ),
        .clint_axi_w_ready_i      (mem_clint_axi_w_ready      ),
        .clint_axi_w_valid_o      (mem_clint_axi_w_valid      ),
        .device_axi_w_ready_i     (mem_device_axi_w_ready     ),
        .device_axi_w_valid_o     (mem_device_axi_w_valid     ),
        .axi_w_data_o             (axi_w_data                 ),
        .axi_w_strb_o             (axi_w_strb                 ),
        .axi_w_last_o             (axi_w_last                 ),
        .clint_axi_b_ready_o      (mem_clint_axi_b_ready      ),
        .clint_axi_b_valid_i      (mem_clint_axi_b_valid      ),
        .device_axi_b_ready_o     (mem_device_axi_b_ready     ),
        .device_axi_b_valid_i     (mem_device_axi_b_valid     ),
        .clint_axi_b_resp_i       (mem_clint_axi_b_resp       ),
        .clint_axi_b_id_i         (mem_clint_axi_b_id         ),
        .device_axi_b_resp_i      (mem_device_axi_b_resp      ),
        .device_axi_b_id_i        (mem_device_axi_b_id        )
    );
    
    
    ysyx_040654_clint clint(
    	.aclk            (clk                     ),
        .resetn          (rstn                    ),
        .axi_aw_valid_i  (mem_clint_axi_aw_valid  ),
        .axi_aw_ready_o  (mem_clint_axi_aw_ready  ),
        .axi_aw_addr_i   (axi_aw_addr             ),
        .axi_aw_id_i     (axi_aw_id               ),
        .axi_aw_len_i    (axi_aw_len              ),
        .axi_aw_size_i   (axi_aw_size             ),
        .axi_aw_burst_i  (axi_aw_burst            ),
        .axi_w_valid_i   (mem_clint_axi_w_valid   ),
        .axi_w_data_i    (axi_w_data              ),
        .axi_w_strb_i    (axi_w_strb              ),
        .axi_w_last_i    (axi_w_last              ),
        .axi_w_ready_o   (mem_clint_axi_w_ready   ),
        .axi_b_valid_o   (mem_clint_axi_b_valid   ),
        .axi_b_resp_o    (mem_clint_axi_b_resp    ),
        .axi_b_id_o      (mem_clint_axi_b_id      ),
        .axi_b_ready_i   (mem_clint_axi_b_ready   ),
        .axi_ar_valid_i  (mem_clint_axi_ar_valid  ),
        .axi_ar_ready_o  (mem_clint_axi_ar_ready  ),
        .axi_ar_addr_i   (axi_ar_addr             ),
        .axi_ar_id_i     (axi_ar_id               ),
        .axi_ar_len_i    (axi_ar_len              ),
        .axi_ar_size_i   (axi_ar_size             ),
        .axi_ar_burst_i  (axi_ar_burst            ),
        .axi_r_ready_i   (mem_clint_axi_r_ready   ),
        .axi_r_valid_o   (mem_clint_axi_r_valid   ),
        .axi_r_resp_o    (mem_clint_axi_r_resp    ),
        .axi_r_data_o    (mem_clint_axi_r_data    ),
        .axi_r_last_o    (mem_clint_axi_r_last    ),
        .axi_r_id_o      (mem_clint_axi_r_id      ),
        .timer_intr_o    (mem_timer_intr          )
    );
    

    ysyx_040654_mem_reg mem_reg(
    	.clk              (clk                  ),
        .rstn             (rstn                 ),
        .mem_stall_flag_i (hazard_stall_flag    ),
        .mem_flush_flag_i (mem_flush_flag       ),
        .mem_reg_wen_i    (mem_reg_wen          ),
        .mem_reg_wsel_i   (mem_reg_wsel         ),
        .mem_reg_waddr_i  (mem_reg_waddr        ),
        .mem_alu_result_i (mem_alu_result       ),
        .mem_bju_result_i (mem_bju_result       ),
        .mem_mem_rdata_i  (mem_mem_rdata        ),
        .mem_csr_rdata_i  (mem_csr_rdata        ),
        .wb_reg_wen_o     (wb_reg_wen           ),
        .wb_reg_wsel_o    (wb_reg_wsel          ),
        .wb_reg_waddr_o   (wb_reg_waddr         ),
        .wb_alu_result_o  (wb_alu_result        ),
        .wb_bju_result_o  (wb_bju_result        ),
        .wb_mem_rdata_o   (wb_mem_rdata         ),
        .wb_csr_rdata_o   (wb_csr_rdata         )
    );
    

    ysyx_040654_wb_stage wb_stage(
    	.wb_reg_wsel_i   (wb_reg_wsel       ),
        .wb_alu_result_i (wb_alu_result     ),
        .wb_bju_result_i (wb_bju_result     ),
        .wb_mem_rdata_i  (wb_mem_rdata      ),
        .wb_csr_rdata_i  (wb_csr_rdata      ),
        .wb_reg_wdata_o  (wb_reg_wdata      )
    );
    
    ysyx_040654_piple_ctrl piple_ctrl(
        .clk                   (clk                   ),
        .rstn                  (rstn                  ),
        .if_busy_flag_i        (if_busy_flag          ),
        .ex_busy_flag_i        (ex_busy_flag          ),
        .mem_busy_flag_i       (mem_busy_flag         ),
        .id_bju_op_i           (id_bju_op             ),
        .id_branch_pc_i        (id_branch_pc          ),
        .id_branch_flag_i      (id_branch_flag        ),
        .mem_excp_flag_i       (mem_excp_flag         ),
        .mem_excp_pc_i         (mem_excp_pc           ),
        .hazard_stall_flag_o   (hazard_stall_flag     ),
        .hazard_flush_flag_o   (hazard_flush_flag     ),
        .id_reg_raddr1_i       (id_reg_raddr1         ),
        .id_reg_raddr2_i       (id_reg_raddr2         ),
        .ex_reg_wen_i          (ex_reg_wen            ),
        .ex_reg_waddr_i        (ex_reg_waddr          ),
        .mem_reg_wen_i         (mem_reg_wen           ),
        .mem_reg_waddr_i       (mem_reg_waddr         ),
        .wb_reg_wen_i          (wb_reg_wen            ),
        .wb_reg_waddr_i        (wb_reg_waddr          ),
        .hazard_branch_flag_o  (hazard_branch_flag    ),
        .hazard_branch_pc_o    (hazard_branch_pc      ),
        .hazard_excp_pc_o      (hazard_excp_pc        ),
        .hazard_excp_flag_o    (hazard_excp_flag      ),
        .mem_fencei_flag_i     (mem_fencei_flag       ),
        .mem_next_pc_i         (mem_next_pc           ),
        .hazard_fencei_flag_o  (hazard_fencei_flag    ),
        .hazard_fencei_pc_o    (hazard_fencei_pc      )
    );
    
    assign clk = clock;
    assign rstn = !reset;

    assign mem_mem_read_valid = mem_mem_ren;
    assign mem_mem_write_valid = mem_mem_wen;
    assign if_read_valid = 1'b1;

    
    assign clint_timer_intr = mem_timer_intr;

    // AXI_SIGNALS
    assign mem_device_axi_ar_ready = io_master_arready;
    assign io_master_arvalid = mem_device_axi_ar_valid;
    assign io_master_araddr = axi_ar_addr;
    assign io_master_arid = axi_ar_id;
    assign io_master_arlen = axi_ar_len;
    assign io_master_arsize = axi_ar_size;
    assign io_master_arburst = axi_ar_burst;
    
    assign io_master_rready = mem_device_axi_r_ready;
    assign mem_device_axi_r_valid = io_master_rvalid;
    assign mem_device_axi_r_resp = io_master_rresp;
    assign mem_device_axi_r_data = io_master_rdata;
    assign mem_device_axi_r_last = io_master_rlast;
    assign mem_device_axi_r_id = io_master_rid;

    assign mem_device_axi_aw_ready = io_master_awready;
    assign io_master_awvalid = mem_device_axi_aw_valid;
    assign io_master_awaddr = axi_aw_addr;
    assign io_master_awid = axi_aw_id;
    assign io_master_awlen = axi_aw_len;
    assign io_master_awsize = axi_aw_size;
    assign io_master_awburst = axi_aw_burst;

    assign mem_device_axi_w_ready = io_master_wready;
    assign io_master_wvalid = mem_device_axi_w_valid;
    assign io_master_wdata = axi_w_data;
    assign io_master_wstrb = axi_w_strb;
    assign io_master_wlast = axi_w_last;

    assign io_master_bready = mem_device_axi_b_ready;
    assign mem_device_axi_b_valid = io_master_bvalid;
    assign mem_device_axi_b_resp = io_master_bresp;
    assign mem_device_axi_b_id = io_master_bid;

    assign if_stall_flag = hazard_stall_flag[0];
    assign if_flush_flag = hazard_flush_flag[0];
    assign id_flush_flag = hazard_flush_flag[1];
    assign ex_stall_flag = hazard_stall_flag[2];
    assign ex_flush_flag = hazard_flush_flag[2];
    assign mem_flush_flag = hazard_flush_flag[3];

    assign io_slave_awready = 1'b0;
    assign io_slave_wready = 1'b0;
    assign io_slave_bvalid = 1'b0;
    assign io_slave_bid = 4'b0000;
    assign io_slave_bresp = 2'b00;
    assign io_slave_arready = 1'b0;
    assign io_slave_rvalid = 1'b0;
    assign io_slave_rid = 4'b0000;
    assign io_slave_rresp = 2'b00;
    assign io_slave_rdata = 64'b0;
    assign io_slave_rlast = 1'b0;

    assign io_sram0_addr = if_icache_addr;
    assign io_sram1_addr = if_icache_addr;
    assign io_sram2_addr = if_icache_addr;
    assign io_sram3_addr = if_icache_addr;

    assign io_sram0_cen = if_icache_sel[0] ? if_icache_cen : 1'b1;
    assign io_sram1_cen = if_icache_sel[1] ? if_icache_cen : 1'b1;
    assign io_sram2_cen = if_icache_sel[2] ? if_icache_cen : 1'b1;
    assign io_sram3_cen = if_icache_sel[3] ? if_icache_cen : 1'b1;

    assign io_sram0_wen = if_icache_sel[0] ? if_icache_wen : 1'b1;
    assign io_sram1_wen = if_icache_sel[1] ? if_icache_wen : 1'b1;
    assign io_sram2_wen = if_icache_sel[2] ? if_icache_wen : 1'b1;
    assign io_sram3_wen = if_icache_sel[3] ? if_icache_wen : 1'b1;

    assign io_sram0_wmask = if_icache_sel[0] ? if_icache_bwen : {128{1'b1}};
    assign io_sram1_wmask = if_icache_sel[1] ? if_icache_bwen : {128{1'b1}};
    assign io_sram2_wmask = if_icache_sel[2] ? if_icache_bwen : {128{1'b1}};
    assign io_sram3_wmask = if_icache_sel[3] ? if_icache_bwen : {128{1'b1}};

    assign io_sram0_wdata = if_icache_wdata;
    assign io_sram1_wdata = if_icache_wdata;
    assign io_sram2_wdata = if_icache_wdata;
    assign io_sram3_wdata = if_icache_wdata;

    assign if_icache_rdata = if_icache_sel[0] ? io_sram0_rdata :
                            if_icache_sel[1] ? io_sram1_rdata :
                            if_icache_sel[2] ? io_sram2_rdata :
                            if_icache_sel[3] ? io_sram3_rdata :
                            128'b0;

    assign io_sram4_addr = mem_dcache_addr;
    assign io_sram5_addr = mem_dcache_addr;
    assign io_sram6_addr = mem_dcache_addr;
    assign io_sram7_addr = mem_dcache_addr;

    assign io_sram4_cen = mem_dcache_sel[0] ? mem_dcache_cen : 1'b1;
    assign io_sram5_cen = mem_dcache_sel[1] ? mem_dcache_cen : 1'b1;
    assign io_sram6_cen = mem_dcache_sel[2] ? mem_dcache_cen : 1'b1;
    assign io_sram7_cen = mem_dcache_sel[3] ? mem_dcache_cen : 1'b1;
    
    assign io_sram4_wen = mem_dcache_sel[0] ? mem_dcache_wen : 1'b1;
    assign io_sram5_wen = mem_dcache_sel[1] ? mem_dcache_wen : 1'b1;
    assign io_sram6_wen = mem_dcache_sel[2] ? mem_dcache_wen : 1'b1;
    assign io_sram7_wen = mem_dcache_sel[3] ? mem_dcache_wen : 1'b1;

    assign io_sram4_wmask = mem_dcache_sel[0] ? mem_dcache_bwen : {128{1'b1}};
    assign io_sram5_wmask = mem_dcache_sel[1] ? mem_dcache_bwen : {128{1'b1}};
    assign io_sram6_wmask = mem_dcache_sel[2] ? mem_dcache_bwen : {128{1'b1}};
    assign io_sram7_wmask = mem_dcache_sel[3] ? mem_dcache_bwen : {128{1'b1}};

    assign io_sram4_wdata = mem_dcache_wdata;
    assign io_sram5_wdata = mem_dcache_wdata;
    assign io_sram6_wdata = mem_dcache_wdata;
    assign io_sram7_wdata = mem_dcache_wdata;

    assign mem_dcache_rdata = mem_dcache_sel[0] ? io_sram4_rdata :
                            mem_dcache_sel[1] ? io_sram5_rdata :
                            mem_dcache_sel[2] ? io_sram6_rdata :
                            mem_dcache_sel[3] ? io_sram7_rdata :
                            128'b0;

    
endmodule



module ysyx_040654_alu(
    input clk,
    input rstn,
    input [`ysyx_040654_DataBus] alu_src1_i,
    input [`ysyx_040654_DataBus] alu_src2_i,
    input [`ysyx_040654_ALU_OP-1:0] alu_op_i,
    output alu_busy_flag_o,
    output [`ysyx_040654_DataBus] alu_result_o
);
    wire [`ysyx_040654_DataBus] alu_src1;
    wire [`ysyx_040654_DataBus] alu_src2;
    wire [`ysyx_040654_DataBus] alu_cin;
    reg [`ysyx_040654_DataBus] alu_result;
    wire [`ysyx_040654_HalfDataBus] alu_src1_w;
    wire [`ysyx_040654_HalfDataBus] alu_src2_w;
    wire [`ysyx_040654_HalfDataBus] alu_cin_w;
    reg [`ysyx_040654_HalfDataBus] alu_result_w;
    reg alu_cout;
    wire [`ysyx_040654_DataBus] sltu_result;
    wire [`ysyx_040654_DataBus] slt_result;
    
    
    always @(*) begin
        case(alu_op_i)
            `ysyx_040654_ALU_SLL, `ysyx_040654_ALU_SLLW: begin
                alu_result = alu_src1 << alu_src2[5:0];
                alu_result_w = alu_src1_w << alu_src2_w[4:0];
                alu_cout = 1'b0;
            end

            `ysyx_040654_ALU_SRL, `ysyx_040654_ALU_SRLW: begin
                alu_result = alu_src1 >> alu_src2[5:0];
                alu_result_w = alu_src1_w >> alu_src2_w[4:0];
                alu_cout = 1'b0;
            end
            
            `ysyx_040654_ALU_SRA, `ysyx_040654_ALU_SRAW: begin
                alu_result = (alu_src1 >> alu_src2[5:0]) | ({64{alu_src1[63]}} << (7'd64 - {1'b0,alu_src2[5:0]})) ;
                alu_result_w = (alu_src1_w >> alu_src2_w[4:0]) | ({32{alu_src1_w[31]}} << (6'd32 - {1'b0,alu_src2_w[4:0]}));
                alu_cout = 1'b0;
            end
            
            `ysyx_040654_ALU_XOR: begin
                alu_result = alu_src1 ^ alu_src2;
                alu_result_w = `ysyx_040654_Zero_HalfWord;
                alu_cout = 1'b0;
            end

            `ysyx_040654_ALU_AND: begin
                alu_result = alu_src1 & alu_src2;
                alu_result_w = `ysyx_040654_Zero_HalfWord;
                alu_cout = 1'b0;
            end

            `ysyx_040654_ALU_OR: begin
                alu_result = alu_src1 | alu_src2;
                alu_result_w = `ysyx_040654_Zero_HalfWord;
                alu_cout = 1'b0;
            end

            `ysyx_040654_ALU_ADD, `ysyx_040654_ALU_ADDW, `ysyx_040654_ALU_SUB, `ysyx_040654_ALU_SUBW, `ysyx_040654_ALU_SLTU, `ysyx_040654_ALU_SLT: begin
                {alu_cout, alu_result} = alu_src1 + alu_src2 + alu_cin;
                alu_result_w = alu_src1_w + alu_src2_w + alu_cin_w;
            end

            default: begin
                alu_result_w = `ysyx_040654_Zero_HalfWord;
                alu_result = `ysyx_040654_Zero_Word;
                alu_cout = 1'b0;
            end
        endcase
    end


    assign alu_src1 = alu_src1_i;
    assign alu_src2 = (alu_op_i == `ysyx_040654_ALU_SUB || alu_op_i == `ysyx_040654_ALU_SLTU || alu_op_i == `ysyx_040654_ALU_SLT) ? (~alu_src2_i) : alu_src2_i;
    assign alu_cin = (alu_op_i == `ysyx_040654_ALU_SUB || alu_op_i == `ysyx_040654_ALU_SLTU || alu_op_i == `ysyx_040654_ALU_SLT) ? 64'b1 : 64'b0;

    assign alu_src1_w = alu_src1_i[31:0];
    assign alu_src2_w = (alu_op_i == `ysyx_040654_ALU_SUBW) ? (~alu_src2_i[31:0]) : alu_src2_i[31:0];
    assign alu_cin_w = (alu_op_i == `ysyx_040654_ALU_SUBW) ? 32'b1 : 32'b0;


    assign sltu_result = (alu_cout == 1'b0 && alu_result != 64'b0) ? 64'b1 : 64'b0;
    assign slt_result = ((alu_src1_i[63] && ~alu_src2_i[63]) || (~(alu_src1_i[63] ^ alu_src2_i[63]) && alu_result[63])) ? 64'b1 : 64'b0;


    // // MUL
    localparam mul_idle_state = 2'b00, mul_calc_state = 2'b01, mul_end_state = 2'b10;
    reg [1:0] mul_curr_state, mul_next_state;

    reg [66-1:0] multiplier;    //add two signed bit
    reg [132-1:0] multiplicand;
    reg [132-1:0] mul_result;
    reg [5:0] mul_clock;
    wire mul_flag = (alu_op_i == `ysyx_040654_ALU_MUL || alu_op_i == `ysyx_040654_ALU_MULW || alu_op_i == `ysyx_040654_ALU_MULH || alu_op_i == `ysyx_040654_ALU_MULHU || alu_op_i == `ysyx_040654_ALU_MULHSU);
    
    always @(posedge clk) begin
        if(!rstn) begin
            mul_curr_state <= mul_idle_state;
        end else begin
            mul_curr_state <= mul_next_state;
        end
    end


    always @(*) begin
        case(mul_curr_state)
            mul_idle_state: begin
                if(mul_flag && alu_src1_i != 64'b0 && alu_src2 != 64'b0) begin
                    mul_next_state = mul_calc_state;
                end else begin
                    mul_next_state = mul_idle_state;
                end
            end
    
            mul_calc_state: begin
                if(multiplier == 66'b0 || mul_clock == 6'd31) begin
                    mul_next_state = mul_end_state;
                end else begin
                    mul_next_state = mul_calc_state;
                end
            end
            
            default: begin
                mul_next_state = mul_idle_state;
            end
        endcase
    end

    always @(posedge clk) begin
        if(!rstn) begin
            mul_result <= 132'b0;
            multiplier <= 66'b0;
            multiplicand <= 132'b0;
            mul_clock <= 6'b0;
        end else begin
            if(mul_curr_state == mul_idle_state) begin
                if(mul_flag && alu_src1_i != 64'b0 && alu_src2 != 64'b0) begin
                    if(alu_op_i == `ysyx_040654_ALU_MUL || alu_op_i == `ysyx_040654_ALU_MULW || alu_op_i == `ysyx_040654_ALU_MULH || alu_op_i == `ysyx_040654_ALU_MULHSU) begin
                        multiplier <= {{2{alu_src1_i[63]}}, alu_src1_i};
                    end else if(alu_op_i == `ysyx_040654_ALU_MULHU) begin
                        multiplier <= {2'b0, alu_src1_i};
                    end
                    if(alu_op_i == `ysyx_040654_ALU_MUL || alu_op_i == `ysyx_040654_ALU_MULW || alu_op_i == `ysyx_040654_ALU_MULH) begin
                        multiplicand <= {{68{alu_src2_i[63]}}, alu_src2_i};
                    end else if(alu_op_i == `ysyx_040654_ALU_MULHU || alu_op_i == `ysyx_040654_ALU_MULHSU) begin
                        multiplicand <= {68'b0, alu_src2_i};
                    end
                end 
            end else if(mul_curr_state == mul_calc_state) begin
                mul_clock <= mul_clock + 1;
                multiplicand <= {multiplicand[129:0], 2'b0};
                if(mul_clock == 6'b0) begin
                    multiplier <= {1'b0,multiplier[65:1]};
                    case(multiplier[1:0]) 
                        2'b00: begin
                            mul_result <= mul_result;
                        end
                        2'b01: begin
                            mul_result <= mul_result + multiplicand;
                        end
                        2'b10: begin
                            mul_result <= mul_result + ~({multiplicand[130:0],1'b0}) + 132'b1;
                        end
                        2'b11: begin
                            mul_result <= mul_result + ~(multiplicand) + 132'b1;
                        end
                        default: begin
                            mul_result <= mul_result;
                        end
                    endcase
                end else begin
                    multiplier <= {2'b0,multiplier[65:2]};
                    case(multiplier[2:0]) 
                        3'b000, 3'b111: begin
                            mul_result <= mul_result;
                        end
                        3'b001, 3'b010: begin
                            mul_result <= mul_result + multiplicand;
                        end
                        3'b011: begin
                            mul_result <= mul_result + ({multiplicand[130:0],1'b0});
                        end
                        3'b100: begin
                            mul_result <= mul_result + ~({multiplicand[130:0],1'b0}) + 132'b1;
                        end
                        3'b101, 3'b110: begin
                            mul_result <= mul_result + ~(multiplicand) + 132'b1;
                        end
                        default: begin
                            mul_result <= mul_result;
                        end
                    endcase
                end
            end else if(mul_curr_state == mul_end_state) begin
                mul_clock <= 6'b0;
                multiplier <= 66'b0;
                multiplicand <= 132'b0;
                mul_result <= 132'b0;
            end
        end
    end
    


    // DIV
    localparam div_idle_state = 2'b00, div_calc_state = 2'b01, div_calc_w_state = 2'b10, div_end_state = 2'b11;
    reg [1:0] div_curr_state, div_next_state;
    reg [127:0] dividend;
    reg [64:0] divisor;         //多一位为符号位
    wire [64:0] div_sub_res;    //每周期对应被除数与除数试商结果
    reg [127:0] divisor_r;      //每个周期对应权重不同的除数
    reg [63:0] dividend_w;
    reg [32:0] divisor_w;       //多一位为符号位
    wire [32:0] div_sub_res_w;  //每周期对应被除数与除数试商结果
    reg [63:0] divisor_w_r;     //每个周期对应权重不同的除数
    reg [63:0] quotient;
    reg [127:0] remainder;
    reg [31:0] quotient_w;
    reg [63:0] remainder_w;
    reg [6:0] div_clock;
    reg [63:0] div_result;      
    reg [31:0] div_result_w;
    
    wire div_flag = (alu_op_i == `ysyx_040654_ALU_DIV || alu_op_i == `ysyx_040654_ALU_DIVU || alu_op_i == `ysyx_040654_ALU_DIVUW || alu_op_i == `ysyx_040654_ALU_DIVW);
    wire rem_flag = (alu_op_i == `ysyx_040654_ALU_REM || alu_op_i == `ysyx_040654_ALU_REMU || alu_op_i == `ysyx_040654_ALU_REMUW || alu_op_i == `ysyx_040654_ALU_REMW);

    always @(posedge clk) begin
        if(!rstn) begin
            div_curr_state <= div_idle_state;
        end else begin
            div_curr_state <= div_next_state;
        end
    end

    always @(*) begin
        case(div_curr_state) 
            div_idle_state: begin
                if(div_flag || rem_flag) begin
                    if((alu_op_i == `ysyx_040654_ALU_DIVUW || alu_op_i == `ysyx_040654_ALU_DIVW 
                    || alu_op_i == `ysyx_040654_ALU_REMUW || alu_op_i == `ysyx_040654_ALU_REMW) 
                    && alu_src1_i[31:0] != 32'b0 && alu_src2_i[31:0] != 32'b0) begin
                        div_next_state = div_calc_w_state;
                    end else if(alu_src1_i != 64'b0 && alu_src2_i != 64'b0) begin
                        div_next_state = div_calc_state;
                    end else begin
                        div_next_state = div_idle_state;
                    end
                end else begin
                    div_next_state = div_idle_state;
                end
            end
            div_calc_state: begin
                if(div_clock == 7'd63) begin
                    div_next_state = div_end_state;
                end else begin
                    div_next_state = div_calc_state;
                end
            end
            div_calc_w_state: begin
                if(div_clock == 7'd31) begin
                    div_next_state = div_end_state;
                end else begin
                    div_next_state = div_calc_w_state;
                end
            end
            default: begin
                div_next_state = div_idle_state;
            end
        endcase
    end


    always @(posedge clk) begin
        if(!rstn) begin
            dividend <= 128'b0;
            divisor <= 65'b0;
            quotient <= 64'b0;
            remainder <= 128'b0;
            div_clock <= 7'b0;
            dividend_w <= 64'b0;
            divisor_w <= 33'b0;
            quotient_w <= 32'b0;
            remainder_w <= 64'b0;
            divisor_r <= 128'b0;
            divisor_w_r <= 64'b0;
        end else begin
            if(div_curr_state == div_idle_state) begin
                if(div_flag || rem_flag) begin
                    if((alu_op_i == `ysyx_040654_ALU_DIVW || alu_op_i == `ysyx_040654_ALU_REMW) 
                    && alu_src1_i[31:0] != 32'b0 && alu_src2_i[31:0] != 32'b0) begin
                        if(alu_src1_i[31]) begin
                            dividend_w <= {32'b0, ~alu_src1_i[31:0] + 32'b1};
                            remainder_w <= {32'b0, ~alu_src1_i[31:0] + 32'b1};
                        end else begin
                            dividend_w <= {32'b0, alu_src1_i[31:0]};
                            remainder_w <= {32'b0, alu_src1_i[31:0]};
                        end
                        if(alu_src2_i[31]) begin
                            divisor_w <= {1'b0, ~alu_src2_i[31:0] + 32'b1};
                            divisor_w_r <= {1'b0, ~alu_src2_i[31:0] + 32'b1, 31'b0};
                        end else begin
                            divisor_w <= {1'b0, alu_src2_i[31:0]};
                            divisor_w_r <= {1'b0, alu_src2_i[31:0], 31'b0};
                        end
                    end else if((alu_op_i == `ysyx_040654_ALU_DIVUW || alu_op_i == `ysyx_040654_ALU_REMUW) 
                    && alu_src1_i[31:0] != 32'b0 && alu_src2_i[31:0] != 32'b0) begin
                        dividend_w <= {32'b0, alu_src1_i[31:0]};
                        divisor_w <= {1'b0, alu_src2_i[31:0]};
                        remainder_w <= {32'b0, alu_src1_i[31:0]};
                        divisor_w_r <= {1'b0, alu_src2_i[31:0], 31'b0};
                    end else if((alu_op_i == `ysyx_040654_ALU_DIV || alu_op_i == `ysyx_040654_ALU_REM) 
                    && alu_src1_i != 64'b0 && alu_src2_i != 64'b0) begin
                        if(alu_src1_i[63]) begin
                            dividend <= {64'b0, ~alu_src1_i + 64'b1};
                            remainder <= {64'b0, ~alu_src1_i + 64'b1};
                        end else begin
                            dividend <= {64'b0, alu_src1_i};
                            remainder <= {64'b0, alu_src1_i};
                        end
                        if(alu_src2_i[63]) begin
                            divisor <= {1'b0, ~alu_src2_i + 64'b1};
                            divisor_r <= {1'b0, ~alu_src2_i + 64'b1, 63'b0};
                        end else begin
                            divisor <= {1'b0, alu_src2_i};
                            divisor_r <= {1'b0, alu_src2_i, 63'b0};
                        end
                    end else if((alu_op_i == `ysyx_040654_ALU_DIVU || alu_op_i == `ysyx_040654_ALU_REMU) 
                    && alu_src1_i != 64'b0 && alu_src2_i != 64'b0) begin
                        dividend <= {64'b0, alu_src1_i};
                        divisor <= {1'b0, alu_src2_i};
                        remainder <= {64'b0, alu_src1_i};
                        divisor_r <= {1'b0, alu_src2_i, 63'b0};
                    end
                end
            end else if(div_curr_state == div_calc_state) begin
                div_clock <= div_clock + 1;
                divisor_r <= {1'b0, divisor_r[127:1]};
                if(div_sub_res[64]) begin
                    quotient <= {quotient[62:0],1'b0};
                    dividend <= {dividend[126:0],1'b0};
                end else begin
                    quotient <= {quotient[62:0],1'b1};
                    remainder <= remainder + ~divisor_r + 128'b1;
                    dividend <= {div_sub_res, dividend[62:0]} << 1;
                end
            end else if(div_curr_state == div_calc_w_state) begin
                div_clock <= div_clock + 1;
                divisor_w_r <= {1'b0, divisor_w_r[63:1]};
                if(div_sub_res_w[32]) begin
                    quotient_w <= {quotient_w[30:0],1'b0};
                    dividend_w <= {dividend_w[62:0],1'b0};
                end else begin
                    quotient_w <= {quotient_w[30:0],1'b1};
                    remainder_w <= remainder_w + ~divisor_w_r + 64'b1;
                    dividend_w <= {div_sub_res_w, dividend_w[30:0]} << 1;
                end
            end else begin
                dividend <= 128'b0;
                divisor <= 65'b0;
                quotient <= 64'b0;
                remainder <= 128'b0;
                div_clock <= 7'b0;
                dividend_w <= 64'b0;
                divisor_w <= 33'b0;
                quotient_w <= 32'b0;
                remainder_w <= 64'b0;
                divisor_r <= 128'b0;
                divisor_w_r <= 64'b0;
            end
        end
    end
    
    always @(*) begin
        if(div_curr_state == div_end_state && alu_op_i == `ysyx_040654_ALU_DIV) begin
            div_result_w = 32'b0;
            case ({alu_src1_i[63],alu_src2_i[63]})
                2'b00: begin
                    div_result = quotient;
                end
                2'b01: begin
                    div_result = ~quotient + 64'b1;
                end
                2'b10: begin
                    div_result = ~quotient + 64'b1;
                end
                default: begin
                    div_result = quotient;
                end 
            endcase
        end else if(div_curr_state == div_end_state && alu_op_i == `ysyx_040654_ALU_DIVU) begin
            div_result_w = 32'b0;
            div_result = quotient;
        end else if(div_curr_state == div_end_state && alu_op_i == `ysyx_040654_ALU_DIVUW) begin
            div_result_w = quotient_w;
            div_result = 64'b0;
        end else if(div_curr_state == div_end_state && alu_op_i == `ysyx_040654_ALU_DIVW) begin
            div_result = 64'b0;
            case ({alu_src1_i[31],alu_src2_i[31]})
                2'b00: begin
                    div_result_w = quotient_w;
                end
                2'b01: begin
                    div_result_w = ~quotient_w + 32'b1;
                end
                2'b10: begin
                    div_result_w = ~quotient_w + 32'b1;
                end
                default: begin
                    div_result_w = quotient_w;
                end 
            endcase
        end else if(div_curr_state == div_end_state && alu_op_i == `ysyx_040654_ALU_REM) begin
            div_result_w = 32'b0;
            case ({alu_src1_i[63],alu_src2_i[63]})
                2'b00: begin
                    div_result = remainder[63:0];
                end
                2'b01: begin
                    div_result = remainder[63:0];
                end
                2'b10: begin
                    div_result = ~remainder[63:0] + 64'b1;
                end
                default: begin
                    div_result = ~remainder[63:0] + 64'b1;
                end 
            endcase
        end else if(div_curr_state == div_end_state && alu_op_i == `ysyx_040654_ALU_REMU) begin
            div_result_w = 32'b0;
            div_result = remainder[63:0];
        end else if(div_curr_state == div_end_state && alu_op_i == `ysyx_040654_ALU_REMUW) begin
            div_result = 64'b0;
            div_result_w = remainder_w[31:0];
        end else if(div_curr_state == div_end_state && alu_op_i == `ysyx_040654_ALU_REMW) begin
            div_result = 64'b0;
            case ({alu_src1_i[31],alu_src2_i[31]})
                2'b00: begin
                    div_result_w = remainder_w[31:0];
                end
                2'b01: begin
                    div_result_w = remainder_w[31:0];
                end
                2'b10: begin
                    div_result_w = ~remainder_w[31:0] + 32'b1;
                end
                default: begin
                    div_result_w = ~remainder_w[31:0] + 32'b1;
                end 
            endcase
        end else begin
            div_result = 64'b0;
            div_result_w = 32'b0;
        end
    end

    assign div_sub_res = dividend[127:63] + ~divisor + 65'b1;
    assign div_sub_res_w = dividend_w[63:31] + ~divisor_w + 33'b1;
    

    assign alu_busy_flag_o = ((mul_curr_state == mul_idle_state && mul_flag && alu_src1_i != 64'b0 && alu_src2 != 64'b0)
                                || (div_curr_state == div_idle_state && (div_flag || rem_flag) && alu_src1_i != 64'b0 && alu_src2 != 64'b0)
                                || (div_curr_state == div_idle_state && (alu_op_i == `ysyx_040654_ALU_DIVUW || alu_op_i == `ysyx_040654_ALU_DIVW || alu_op_i == `ysyx_040654_ALU_REMUW || alu_op_i == `ysyx_040654_ALU_REMW) && alu_src1_i[31:0] != 32'b0 && alu_src2_i[31:0] != 32'b0)
                                || mul_curr_state == mul_calc_state || div_curr_state == div_calc_state || div_curr_state == div_calc_w_state) ? 1'b1 : 1'b0;

    assign alu_result_o =   (alu_op_i == `ysyx_040654_ALU_ADDW || alu_op_i == `ysyx_040654_ALU_SLLW || alu_op_i == `ysyx_040654_ALU_SRAW 
                            || alu_op_i == `ysyx_040654_ALU_SRLW || alu_op_i == `ysyx_040654_ALU_SUBW ) ? {{32{alu_result_w[31]}}, alu_result_w} 
                            : alu_op_i == `ysyx_040654_ALU_SLTU ? sltu_result
                            : alu_op_i == `ysyx_040654_ALU_SLT ? slt_result 
                            : (alu_op_i == `ysyx_040654_ALU_MULH || alu_op_i == `ysyx_040654_ALU_MULHSU || alu_op_i == `ysyx_040654_ALU_MULHU) ? mul_result[127:64]
                            : alu_op_i == `ysyx_040654_ALU_MUL ? mul_result[63:0] 
                            : alu_op_i == `ysyx_040654_ALU_MULW ? {{32{mul_result[31]}}, mul_result[31:0]}
                            : (alu_op_i == `ysyx_040654_ALU_REMUW || alu_op_i == `ysyx_040654_ALU_REMW || alu_op_i == `ysyx_040654_ALU_DIVUW || alu_op_i == `ysyx_040654_ALU_DIVW) ? {{32{div_result_w[31]}}, div_result_w}
                            : (alu_op_i == `ysyx_040654_ALU_REMU || alu_op_i == `ysyx_040654_ALU_REM || alu_op_i == `ysyx_040654_ALU_DIVU || alu_op_i == `ysyx_040654_ALU_DIV) ? div_result
                            : alu_result;
endmodule



module ysyx_040654_biu #(
    parameter RW_DATA_WIDTH     = 64,
    parameter RW_ADDR_WIDTH     = 32,
    parameter AXI_DATA_WIDTH    = 64,
    parameter AXI_ADDR_WIDTH    = 32,
    parameter AXI_ID_WIDTH      = 4,
    parameter AXI_STRB_WIDTH    = AXI_DATA_WIDTH/8
)(
    input                               aclk,
    input                               resetn,

    //---------------- CPU Interface Signals ----------------//

    // signals from if stage 
	input                               if_cache_read_valid_i,    // read_valid_i == read_en     
	output                              if_cache_read_ready_o,    // finish read after read_ready become high to stop blocking one clock
    input  [RW_ADDR_WIDTH-1:0]          if_cache_read_addr_i,
    output [RW_DATA_WIDTH-1:0]          if_cache_read_data_o,
    output                              if_cache_read_last_o,

    input                               if_device_read_valid_i,    // read_valid_i == read_en     
	output                              if_device_read_ready_o,    // finish read after read_ready become high to stop blocking one clock
    input  [RW_ADDR_WIDTH-1:0]          if_device_read_addr_i,
    output [RW_DATA_WIDTH-1:0]          if_device_read_data_o,

//--------------- signals from mem stage ----------------//
    input [`ysyx_040654_LSU_OP-1:0]                 mem_lsu_op_i,
    // Cache Interface(If addr map memory, read data from cache)
    input                               mem_cache_read_valid_i,    // read_valid_i == read_en     
	output                              mem_cache_read_ready_o,    // finish read after read_ready become high to stop blocking one clock
    input  [RW_ADDR_WIDTH-1:0]          mem_cache_read_addr_i,
    output [RW_DATA_WIDTH-1:0]          mem_cache_read_data_o,
    output                              mem_cache_read_last_o,

    input                               mem_cache_write_valid_i,   // write_valid_i == write_en      
	output                              mem_cache_write_ready_o,   // finish write after write_ready become high to stop blocking one clock   
    input  [RW_DATA_WIDTH-1:0]          mem_cache_write_data_i,        
    input  [RW_ADDR_WIDTH-1:0]          mem_cache_write_addr_i,          
    input  [7:0]                        mem_cache_write_mask_i,
    output                              mem_cache_write_last_o,
    output                              mem_cache_write_resp_o,


    // Device Interface(If addr map device, read data from device by axi bus)
    input                               mem_device_read_valid_i,    // read_valid_i == read_en     
	output                              mem_device_read_ready_o,    // finish read after read_ready become high to stop blocking one clock
    input  [RW_ADDR_WIDTH-1:0]          mem_device_read_addr_i,
    output [RW_DATA_WIDTH-1:0]          mem_device_read_data_o,

    input                               mem_device_write_valid_i,   // write_valid_i == write_en      
	output                              mem_device_write_ready_o,   // finish write after write_ready become high to stop blocking one clock   
    input  [RW_DATA_WIDTH-1:0]          mem_device_write_data_i,        
    input  [RW_ADDR_WIDTH-1:0]          mem_device_write_addr_i,          
    input  [7:0]                        mem_device_write_mask_i,


//------------ Advanced eXtensible Interface ----------//

    input                               clint_axi_ar_ready_i,                
    output                              clint_axi_ar_valid_o,
    input                               device_axi_ar_ready_i,                
    output                              device_axi_ar_valid_o,
    output [AXI_ADDR_WIDTH-1:0]         axi_ar_addr_o,
    output [AXI_ID_WIDTH-1:0]           axi_ar_id_o,
    output [7:0]                        axi_ar_len_o,
    output [2:0]                        axi_ar_size_o,
    output [1:0]                        axi_ar_burst_o,
    
    // read data channel
    output                              clint_axi_r_ready_o,                 
    input                               clint_axi_r_valid_i,
    output                              device_axi_r_ready_o,                 
    input                               device_axi_r_valid_i,                 
    input  [1:0]                        clint_axi_r_resp_i,
    input  [AXI_DATA_WIDTH-1:0]         clint_axi_r_data_i,
    input                               clint_axi_r_last_i,
    input  [AXI_ID_WIDTH-1:0]           clint_axi_r_id_i,
    input  [1:0]                        device_axi_r_resp_i,
    input  [AXI_DATA_WIDTH-1:0]         device_axi_r_data_i,
    input                               device_axi_r_last_i,
    input  [AXI_ID_WIDTH-1:0]           device_axi_r_id_i,

    // write address channel
    input                               clint_axi_aw_ready_i,              
    output                              clint_axi_aw_valid_o,
    input                               device_axi_aw_ready_i,              
    output                              device_axi_aw_valid_o,
    output [AXI_ADDR_WIDTH-1:0]         axi_aw_addr_o,
    output [AXI_ID_WIDTH-1:0]           axi_aw_id_o,
    output [7:0]                        axi_aw_len_o,
    output [2:0]                        axi_aw_size_o,
    output [1:0]                        axi_aw_burst_o,

    // write data channel
    input                               clint_axi_w_ready_i,                
    output                              clint_axi_w_valid_o,
    input                               device_axi_w_ready_i,                
    output                              device_axi_w_valid_o,
    output [AXI_DATA_WIDTH-1:0]         axi_w_data_o,
    output [AXI_DATA_WIDTH/8-1:0]       axi_w_strb_o,
    output                              axi_w_last_o,
    
    // write respond channel
    output                              clint_axi_b_ready_o,                
    input                               clint_axi_b_valid_i,
    output                              device_axi_b_ready_o,                
    input                               device_axi_b_valid_i,
    input  [1:0]                        clint_axi_b_resp_i,                 
    input  [AXI_ID_WIDTH-1:0]           clint_axi_b_id_i,
    input  [1:0]                        device_axi_b_resp_i,                 
    input  [AXI_ID_WIDTH-1:0]           device_axi_b_id_i
    
    
);
    wire                              axi_ar_ready;                
    wire                              axi_ar_valid;
    wire [AXI_ADDR_WIDTH-1:0]         axi_ar_addr;
    wire [AXI_ID_WIDTH-1:0]           axi_ar_id;
    wire [7:0]                        axi_ar_len;
    wire [2:0]                        axi_ar_size;
    wire [1:0]                        axi_ar_burst;
    
    // read data channel
    wire                               axi_r_ready;                 
    wire                               axi_r_valid;                
    wire  [1:0]                        axi_r_resp;
    wire  [AXI_DATA_WIDTH-1:0]         axi_r_data;
    wire                               axi_r_last;

    // write address channel
    wire                              axi_aw_ready;              
    wire                              axi_aw_valid;
    wire [AXI_ADDR_WIDTH-1:0]         axi_aw_addr;
    wire [AXI_ID_WIDTH-1:0]           axi_aw_id;
    wire [7:0]                        axi_aw_len;
    wire [2:0]                        axi_aw_size;
    wire [1:0]                        axi_aw_burst;

    // write data channel
    wire                              axi_w_ready;                
    wire                              axi_w_valid;
    wire [AXI_DATA_WIDTH-1:0]         axi_w_data;
    wire [AXI_DATA_WIDTH/8-1:0]       axi_w_strb;
    wire                              axi_w_last;
    
    // write respond channel
    wire                               axi_b_ready;                
    wire                               axi_b_valid;
    wire  [1:0]                        axi_b_resp;

    wire                            read_valid;    //read_valid_i == read_en     
	wire                            read_ready;    // finish read after read_ready become high to stop blocking one clock
    wire    [RW_ADDR_WIDTH-1:0]     read_addr;
    reg     [RW_DATA_WIDTH-1:0]     read_data;
    
    wire                            write_valid;   // write_valid_i == write_en      
	wire                            write_ready;   // finish write after write_ready become high to stop blocking one clock   
    wire    [RW_DATA_WIDTH-1:0]     write_data;        
    wire    [RW_ADDR_WIDTH-1:0]     write_addr;          
    wire    [7:0] write_mask; 

    reg [1:0] axi_read_busy_flag, axi_write_busy_flag;

    //--------------------- READ PARRMETER ---------------------//
    localparam r_idle_state = 2'b00, r_addr_state = 2'b01, r_data_state = 2'b10, r_end_state = 2'b11;
    reg [1:0] r_curr_state, r_next_state;

    reg ar_valid, r_ready;
    reg [AXI_ADDR_WIDTH-1:0] ar_addr;

    //--------------------- WRITE PARRMETER ---------------------//
    localparam w_idle_state = 3'b000, w_wait_state = 3'b001, w_addr_state = 3'b010, w_data_state = 3'b011, w_write_state = 3'b100, w_resp_state = 3'b101;
    reg [2:0] w_curr_state, w_next_state;

    reg aw_valid, w_valid, b_ready;
    reg [AXI_ADDR_WIDTH-1:0] aw_addr;
    reg [AXI_DATA_WIDTH-1:0] w_data;
    reg [7:0] write_len;
    reg [AXI_DATA_WIDTH/8-1:0] w_strb;


    always @(posedge aclk) begin
        if(!resetn) begin
            axi_read_busy_flag <= `ysyx_040654_AXI_IDLE_STATE;
            axi_write_busy_flag <= `ysyx_040654_AXI_IDLE_STATE;
        end else begin
            if(axi_read_busy_flag == `ysyx_040654_AXI_IDLE_STATE) begin
                if(mem_cache_read_valid_i || mem_device_read_valid_i) begin
                    axi_read_busy_flag <= `ysyx_040654_AXI_MEM_BUSY_STATE;
                end else if(if_cache_read_valid_i || if_device_read_valid_i) begin
                    axi_read_busy_flag <= `ysyx_040654_AXI_IF_BUSY_STATE;
                end
            end else begin
                if(r_next_state == r_idle_state) begin
                    axi_read_busy_flag <= `ysyx_040654_AXI_IDLE_STATE;
                end  
            end
            if(axi_write_busy_flag == `ysyx_040654_AXI_IDLE_STATE) begin
                if(mem_cache_write_valid_i || mem_device_write_valid_i) begin
                    axi_write_busy_flag <= `ysyx_040654_AXI_MEM_BUSY_STATE;
                end
            end else begin
                if(w_next_state == w_idle_state) begin
                    axi_write_busy_flag <= `ysyx_040654_AXI_IDLE_STATE;
                end  
            end
        end
    end


    assign read_valid = ((axi_read_busy_flag == `ysyx_040654_AXI_IDLE_STATE && (mem_cache_read_valid_i || mem_device_read_valid_i || if_cache_read_valid_i || if_device_read_valid_i))
                        || axi_read_busy_flag == `ysyx_040654_AXI_MEM_BUSY_STATE || axi_read_busy_flag == `ysyx_040654_AXI_IF_BUSY_STATE) ? 1'b1 :
                        1'b0;
    assign read_addr =  ((axi_read_busy_flag == `ysyx_040654_AXI_IDLE_STATE || axi_read_busy_flag == `ysyx_040654_AXI_MEM_BUSY_STATE) && mem_cache_read_valid_i) ? mem_cache_read_addr_i :
                        ((axi_read_busy_flag == `ysyx_040654_AXI_IDLE_STATE || axi_read_busy_flag == `ysyx_040654_AXI_MEM_BUSY_STATE) && mem_device_read_valid_i) ? mem_device_read_addr_i :
                        (axi_read_busy_flag == `ysyx_040654_AXI_IDLE_STATE && if_cache_read_valid_i && !mem_cache_read_valid_i && !mem_device_read_valid_i) ? if_cache_read_addr_i :
                        (axi_read_busy_flag == `ysyx_040654_AXI_IDLE_STATE && if_device_read_valid_i && !mem_cache_read_valid_i && !mem_device_read_valid_i) ? if_device_read_addr_i :
                        (axi_read_busy_flag == `ysyx_040654_AXI_IF_BUSY_STATE && if_cache_read_valid_i) ? if_cache_read_addr_i :
                        (axi_read_busy_flag == `ysyx_040654_AXI_IF_BUSY_STATE && if_device_read_valid_i) ? if_device_read_addr_i :
                        32'b0;
    
    assign write_valid = (axi_write_busy_flag == `ysyx_040654_AXI_IDLE_STATE && (mem_cache_write_valid_i || mem_device_write_valid_i)) ? 1'b1 :
                        (axi_write_busy_flag == `ysyx_040654_AXI_MEM_BUSY_STATE && (mem_cache_write_valid_i || mem_device_write_valid_i)) ? 1'b1 :
                        1'b0;
    assign write_data = ((axi_write_busy_flag == `ysyx_040654_AXI_IDLE_STATE || axi_write_busy_flag == `ysyx_040654_AXI_MEM_BUSY_STATE) && mem_cache_write_valid_i) ? mem_cache_write_data_i :
                        ((axi_write_busy_flag == `ysyx_040654_AXI_IDLE_STATE || axi_write_busy_flag == `ysyx_040654_AXI_MEM_BUSY_STATE) && mem_device_write_valid_i) ? mem_device_write_data_i :
                        64'b0;
    assign write_addr = ((axi_write_busy_flag == `ysyx_040654_AXI_IDLE_STATE || axi_write_busy_flag == `ysyx_040654_AXI_MEM_BUSY_STATE) && mem_cache_write_valid_i) ? mem_cache_write_addr_i :
                        ((axi_write_busy_flag == `ysyx_040654_AXI_IDLE_STATE || axi_write_busy_flag == `ysyx_040654_AXI_MEM_BUSY_STATE) && mem_device_write_valid_i) ? mem_device_write_addr_i :
                        32'b0;
    assign write_mask = ((axi_write_busy_flag == `ysyx_040654_AXI_IDLE_STATE || axi_write_busy_flag == `ysyx_040654_AXI_MEM_BUSY_STATE) && mem_cache_write_valid_i) ? mem_cache_write_mask_i :
                        ((axi_write_busy_flag == `ysyx_040654_AXI_IDLE_STATE || axi_write_busy_flag == `ysyx_040654_AXI_MEM_BUSY_STATE) && mem_device_write_valid_i) ? mem_device_write_mask_i :
                        8'b0;             
    
    
    //----------- init ----------------
    wire [AXI_ID_WIDTH-1:0] axi_id = {AXI_ID_WIDTH{1'b0}};

    assign axi_aw_id  = axi_id;
    
    assign axi_ar_id  = axi_id;                        
    


    //----------- read transaction -----------
    
    assign axi_ar_valid = ar_valid;
    assign axi_r_ready = r_ready;
    assign axi_ar_addr = ar_addr;

    wire ar_handshake = axi_ar_ready && axi_ar_valid;
    wire r_handshake = axi_r_ready && axi_r_valid;
    wire r_finish = r_handshake && axi_r_last;
    wire r_success = r_finish && axi_r_resp == 2'b00;

    always @(posedge aclk) begin
        if(!resetn) begin
            r_curr_state <= r_idle_state;
        end else begin
            r_curr_state <= r_next_state;
        end
    end

    always @(*) begin
        case(r_curr_state)
            r_idle_state: begin
                if(read_valid) begin
                    r_next_state = r_addr_state;
                end 
                else begin
                    r_next_state = r_idle_state;    
                end
            end
            r_addr_state: begin
                if(ar_handshake) begin
                    r_next_state = r_data_state;
                end
                else begin
                    r_next_state = r_addr_state;
                end
            end
            r_data_state: begin
                if(r_success) begin
                    r_next_state = r_end_state;
                end
                else begin
                    r_next_state = r_data_state;
                end
            end
            default: begin
                r_next_state = r_idle_state;
            end
        endcase
    end
    
    always @(posedge aclk) begin
        if(!resetn) begin
            ar_valid <= 1'b0;
            r_ready <= 1'b0;
            ar_addr <= {RW_ADDR_WIDTH{1'b0}};
            read_data <= {RW_DATA_WIDTH{1'b0}};
        end else begin
            if(r_curr_state == r_idle_state) begin
                if(read_valid) begin
                    ar_valid <= 1'b1;
                    ar_addr <= read_addr;
                end
            end
            
            else if(r_curr_state == r_addr_state) begin
                if(ar_handshake) begin
                    ar_valid <= 1'b0;
                    ar_addr <= {RW_ADDR_WIDTH{1'b0}};
                    r_ready <= 1'b1;
                end
            end

            else if(r_curr_state == r_data_state) begin
                if(r_finish) begin
                    r_ready <= 1'b0;
                end
                if(r_handshake) begin
                    read_data <= axi_r_data;
                end
            end

            else if(r_curr_state == r_end_state) begin
                read_data <= {RW_DATA_WIDTH{1'b0}};
            end
        end
    end
    
    assign axi_ar_len =     ((axi_read_busy_flag == `ysyx_040654_AXI_IDLE_STATE || axi_read_busy_flag == `ysyx_040654_AXI_MEM_BUSY_STATE) && mem_cache_read_valid_i) ? 8'b1 :
                            (axi_read_busy_flag == `ysyx_040654_AXI_IDLE_STATE && if_cache_read_valid_i && !mem_cache_read_valid_i && !mem_device_read_valid_i) ? 8'b1 :
                            (axi_read_busy_flag == `ysyx_040654_AXI_IF_BUSY_STATE && if_cache_read_valid_i) ? 8'b1 :
                            8'b0;

    assign axi_ar_size =    ((axi_read_busy_flag == `ysyx_040654_AXI_IDLE_STATE || axi_read_busy_flag == `ysyx_040654_AXI_MEM_BUSY_STATE) && mem_cache_read_valid_i) ? 3'b011 :
                            ((axi_read_busy_flag == `ysyx_040654_AXI_IDLE_STATE || axi_read_busy_flag == `ysyx_040654_AXI_MEM_BUSY_STATE) && mem_device_read_valid_i && mem_lsu_op_i == `ysyx_040654_LSU_LD) ? 3'b011 :
                            ((axi_read_busy_flag == `ysyx_040654_AXI_IDLE_STATE || axi_read_busy_flag == `ysyx_040654_AXI_MEM_BUSY_STATE) && mem_device_read_valid_i && (mem_lsu_op_i == `ysyx_040654_LSU_LW || mem_lsu_op_i == `ysyx_040654_LSU_LWU)) ? 3'b010 :
                            ((axi_read_busy_flag == `ysyx_040654_AXI_IDLE_STATE || axi_read_busy_flag == `ysyx_040654_AXI_MEM_BUSY_STATE) && mem_device_read_valid_i && (mem_lsu_op_i == `ysyx_040654_LSU_LH || mem_lsu_op_i == `ysyx_040654_LSU_LHU)) ? 3'b001 :
                            (axi_read_busy_flag == `ysyx_040654_AXI_IDLE_STATE && if_cache_read_valid_i && !mem_cache_read_valid_i && !mem_device_read_valid_i) ? 3'b011 :
                            (axi_read_busy_flag == `ysyx_040654_AXI_IF_BUSY_STATE && if_cache_read_valid_i) ? 3'b011 :
                            (axi_read_busy_flag == `ysyx_040654_AXI_IDLE_STATE && if_device_read_valid_i && !mem_cache_read_valid_i && !mem_device_read_valid_i) ? 3'b010 :
                            (axi_read_busy_flag == `ysyx_040654_AXI_IF_BUSY_STATE && if_device_read_valid_i) ? 3'b010 :
                            3'b000;

    assign axi_ar_burst = `ysyx_040654_AXI_BURST_TYPE_INCR;
    assign read_ready = (r_next_state == r_idle_state && r_curr_state != r_idle_state);
    
    //----------- write transaction -----------
    

    assign axi_aw_valid = aw_valid;
    assign axi_w_valid = w_valid;
    assign axi_aw_addr = aw_addr;
    assign axi_w_data = w_data;
    assign axi_b_ready = b_ready;
    assign axi_w_strb = w_strb;

    assign axi_w_last = (write_len == 8'b1) ? 1'b1 : 1'b0;

    wire aw_handshake = axi_aw_ready && axi_aw_valid;
    wire w_handshake = axi_w_ready && axi_w_valid;
    wire w_finish = w_handshake && axi_w_last;
    wire b_handshake = axi_b_ready && axi_b_valid;
    wire b_success = b_handshake && (axi_b_resp == 2'b00);


    always @(posedge aclk) begin
        if(!resetn) begin
            w_curr_state <= w_idle_state;
        end else begin
            w_curr_state <= w_next_state;
        end
    end

    always @(*) begin
        case (w_curr_state)
            w_idle_state: begin
                if(write_valid) begin
                    w_next_state = w_wait_state;
                end else begin
                    w_next_state = w_idle_state;
                end
            end 
            w_wait_state: begin
                if(aw_handshake && w_handshake) begin
                    if(write_len != 8'b1) begin
                        w_next_state = w_write_state;
                    end else begin
                        w_next_state = w_resp_state;
                    end
                end else if(aw_handshake) begin
                    w_next_state = w_addr_state;
                end else if(w_handshake) begin
                    w_next_state = w_data_state;
                end else begin
                    w_next_state = w_wait_state;
                end
            end
            w_addr_state: begin
                if(w_handshake) begin
                    if(write_len != 8'b1) begin
                        w_next_state = w_write_state;
                    end else begin
                        w_next_state = w_resp_state;
                    end
                end else begin
                    w_next_state = w_addr_state;
                end
            end
            w_data_state: begin
                if(aw_handshake) begin
                    if(write_len != 8'b1) begin
                        w_next_state = w_write_state;
                    end else begin
                        w_next_state = w_resp_state;
                    end
                end else begin
                    w_next_state = w_data_state;
                end
            end
            w_write_state: begin
                if(w_finish) begin
                    w_next_state = w_resp_state;
                end else begin
                    w_next_state = w_write_state;
                end
            end
            w_resp_state: begin
                if(b_handshake) begin
                    w_next_state = w_idle_state;
                end else begin
                    w_next_state = w_resp_state;
                end
            end
            default: begin
                w_next_state = w_idle_state;
            end
        endcase
    end


    always @(posedge aclk) begin
        if(!resetn) begin
            aw_valid <= 1'b0;
            w_valid <= 1'b0;
            b_ready <= 1'b0;
            aw_addr <= {RW_ADDR_WIDTH{1'b0}};
            w_data <= {RW_DATA_WIDTH{1'b0}};
            write_len <= 8'b0;
            w_strb <= 8'b0;
        end else begin
            if(w_curr_state == w_idle_state) begin
                if(write_valid) begin
                    aw_valid <= 1'b1;
                    aw_addr <= write_addr;
                    w_valid <= 1'b1;
                    w_data <= write_data;
                    write_len <= axi_aw_len + 1;
                    w_strb <= write_mask;
                end
            end
            if(w_curr_state == w_wait_state) begin
                if(aw_handshake && w_handshake) begin
                    aw_valid <= 1'b0;
                    aw_addr <= {RW_ADDR_WIDTH{1'b0}};
                    w_data <= write_data;
                    w_strb <= write_mask;
                    write_len <= write_len - 1;
                    if(write_len == 8'b1) begin
                        w_valid <= 1'b0;
                        b_ready <= 1'b1;
                    end
                end else if(aw_handshake) begin
                    aw_valid <= 1'b0;
                    aw_addr <= {RW_ADDR_WIDTH{1'b0}};
                end
            end
            else if(w_curr_state == w_addr_state) begin
                if(w_handshake) begin
                    w_data <= write_data;
                    w_strb <= write_mask;
                    write_len <= write_len - 1;
                    if(write_len == 8'b1) begin
                        w_valid <= 1'b0;
                        b_ready <= 1'b1;
                    end
                end
            end
            else if(w_curr_state == w_data_state) begin
                if(aw_handshake) begin
                    aw_valid <= 1'b0;
                    aw_addr <= {RW_ADDR_WIDTH{1'b0}};
                    w_data <= write_data;
                    w_strb <= write_mask;
                    write_len <= write_len - 1;
                    if(write_len == 8'b1) begin
                        w_valid <= 1'b0;
                        b_ready <= 1'b1;
                    end
                end
            end
            else if(w_curr_state == w_write_state) begin
                if(w_handshake) begin
                    w_data <= write_data;
                    w_strb <= write_mask;
                    write_len <= write_len - 1;
                    if(write_len == 8'b1) begin
                        w_valid <= 1'b0;
                        b_ready <= 1'b1;
                    end
                end
            end
            else if(w_curr_state == w_resp_state) begin
                w_data <= {RW_DATA_WIDTH{1'b0}};
                w_strb <= {AXI_STRB_WIDTH{1'b0}};
                if(b_success) begin
                    b_ready <= 1'b0;
                end
            end
        end
    end

    assign axi_aw_len =     (axi_write_busy_flag == `ysyx_040654_AXI_IDLE_STATE && mem_cache_write_valid_i) ? 8'b1 : 
                            (axi_write_busy_flag == `ysyx_040654_AXI_MEM_BUSY_STATE && mem_cache_write_valid_i) ? 8'b1 :
                            8'b0;
    assign axi_aw_size =    ((axi_write_busy_flag == `ysyx_040654_AXI_IDLE_STATE || axi_write_busy_flag == `ysyx_040654_AXI_MEM_BUSY_STATE) && mem_cache_write_valid_i) ? 3'b011 :
                            ((axi_write_busy_flag == `ysyx_040654_AXI_IDLE_STATE || axi_write_busy_flag == `ysyx_040654_AXI_MEM_BUSY_STATE) && mem_device_write_valid_i && mem_lsu_op_i == `ysyx_040654_LSU_SD) ? 3'b011 :
                            ((axi_write_busy_flag == `ysyx_040654_AXI_IDLE_STATE || axi_write_busy_flag == `ysyx_040654_AXI_MEM_BUSY_STATE) && mem_device_write_valid_i && mem_lsu_op_i == `ysyx_040654_LSU_SW) ? 3'b010 :
                            ((axi_write_busy_flag == `ysyx_040654_AXI_IDLE_STATE || axi_write_busy_flag == `ysyx_040654_AXI_MEM_BUSY_STATE) && mem_device_write_valid_i && mem_lsu_op_i == `ysyx_040654_LSU_SH) ? 3'b001 :
                            3'b000;
    assign axi_aw_burst = `ysyx_040654_AXI_BURST_TYPE_INCR;
    assign write_ready = (w_next_state == w_idle_state && w_curr_state != w_idle_state);

    assign if_cache_read_data_o = (if_cache_read_valid_i && axi_read_busy_flag == `ysyx_040654_AXI_IF_BUSY_STATE) ? read_data : 64'b0;
    assign if_cache_read_ready_o = (if_cache_read_valid_i && axi_read_busy_flag == `ysyx_040654_AXI_IF_BUSY_STATE) ? r_ready : 1'b0;
    assign if_cache_read_last_o = (if_cache_read_valid_i && axi_read_busy_flag == `ysyx_040654_AXI_IF_BUSY_STATE) ? axi_r_last : 1'b0; 

    assign if_device_read_data_o = (if_device_read_valid_i && axi_read_busy_flag == `ysyx_040654_AXI_IF_BUSY_STATE) ? read_data : 64'b0;
    assign if_device_read_ready_o = (if_device_read_valid_i && axi_read_busy_flag == `ysyx_040654_AXI_IF_BUSY_STATE) ? read_ready : 1'b0;
    
    assign mem_cache_read_data_o = (mem_cache_read_valid_i && axi_read_busy_flag == `ysyx_040654_AXI_MEM_BUSY_STATE) ? read_data : 64'b0; 
    assign mem_cache_read_ready_o = (mem_cache_read_valid_i && axi_read_busy_flag == `ysyx_040654_AXI_MEM_BUSY_STATE) ? r_ready : 1'b0;
    assign mem_cache_read_last_o = (mem_cache_read_valid_i && axi_read_busy_flag == `ysyx_040654_AXI_MEM_BUSY_STATE) ? axi_r_last : 1'b0;
    
    assign mem_cache_write_ready_o = (mem_cache_write_valid_i && axi_write_busy_flag == `ysyx_040654_AXI_MEM_BUSY_STATE) ? axi_w_ready : 1'b0;
    assign mem_cache_write_last_o =  (mem_cache_write_valid_i && axi_write_busy_flag == `ysyx_040654_AXI_MEM_BUSY_STATE) ? (w_next_state == w_write_state) : 1'b0;
    assign mem_cache_write_resp_o = (mem_cache_write_valid_i && axi_write_busy_flag == `ysyx_040654_AXI_MEM_BUSY_STATE) ? b_handshake : 1'b0;

    assign mem_device_read_data_o = (mem_device_read_valid_i && axi_read_busy_flag == `ysyx_040654_AXI_MEM_BUSY_STATE) ? read_data : 64'b0; 
    assign mem_device_read_ready_o = (mem_device_read_valid_i && axi_read_busy_flag == `ysyx_040654_AXI_MEM_BUSY_STATE) ? read_ready : 1'b0;
    assign mem_device_write_ready_o = (mem_device_write_valid_i && axi_write_busy_flag == `ysyx_040654_AXI_MEM_BUSY_STATE) ? write_ready : 1'b0;
    
    
    assign axi_aw_id_o = axi_aw_id;
    
    assign axi_ar_id_o = axi_ar_id;

    assign clint_axi_ar_valid_o =   ((axi_read_busy_flag == `ysyx_040654_AXI_IDLE_STATE || axi_read_busy_flag == `ysyx_040654_AXI_MEM_BUSY_STATE) && mem_device_read_valid_i && mem_device_read_addr_i >= `ysyx_040654_CLINT_START && mem_device_read_addr_i <= `ysyx_040654_CLINT_END) ? axi_ar_valid : 
                                    (axi_read_busy_flag == `ysyx_040654_AXI_IDLE_STATE && if_device_read_valid_i && !mem_cache_read_valid_i && !mem_device_read_valid_i && if_device_read_addr_i >= `ysyx_040654_CLINT_START && if_device_read_addr_i <= `ysyx_040654_CLINT_END) ? axi_ar_valid :
                                    (axi_read_busy_flag == `ysyx_040654_AXI_IF_BUSY_STATE && if_device_read_valid_i && if_device_read_addr_i >= `ysyx_040654_CLINT_START && if_device_read_addr_i <= `ysyx_040654_CLINT_END) ? axi_ar_valid : 
                                    1'b0;
    assign device_axi_ar_valid_o =  ((axi_read_busy_flag == `ysyx_040654_AXI_IDLE_STATE || axi_read_busy_flag == `ysyx_040654_AXI_MEM_BUSY_STATE) && mem_device_read_valid_i && (mem_device_read_addr_i < `ysyx_040654_CLINT_START || mem_device_read_addr_i > `ysyx_040654_CLINT_END)) ? axi_ar_valid : 
                                    ((axi_read_busy_flag == `ysyx_040654_AXI_IDLE_STATE || axi_read_busy_flag == `ysyx_040654_AXI_MEM_BUSY_STATE) && mem_cache_read_valid_i) ? axi_ar_valid :
                                    ((axi_read_busy_flag == `ysyx_040654_AXI_IDLE_STATE && if_cache_read_valid_i && !mem_cache_read_valid_i && !mem_device_read_valid_i)) ? axi_ar_valid :
                                    (axi_read_busy_flag == `ysyx_040654_AXI_IF_BUSY_STATE && if_cache_read_valid_i) ? axi_ar_valid : 
                                    ((axi_read_busy_flag == `ysyx_040654_AXI_IDLE_STATE && if_device_read_valid_i && !mem_cache_read_valid_i && !mem_device_read_valid_i) && (if_device_read_addr_i < `ysyx_040654_CLINT_START || if_device_read_addr_i > `ysyx_040654_CLINT_END)) ? axi_ar_valid :
                                    (axi_read_busy_flag == `ysyx_040654_AXI_IF_BUSY_STATE && if_device_read_valid_i && (if_device_read_addr_i < `ysyx_040654_CLINT_START || if_device_read_addr_i > `ysyx_040654_CLINT_END)) ? axi_ar_valid : 
                                    1'b0;
    assign axi_ar_ready =   ((axi_read_busy_flag == `ysyx_040654_AXI_IDLE_STATE || axi_read_busy_flag == `ysyx_040654_AXI_MEM_BUSY_STATE) && mem_device_read_valid_i && mem_device_read_addr_i >= `ysyx_040654_CLINT_START && mem_device_read_addr_i <= `ysyx_040654_CLINT_END) ? clint_axi_ar_ready_i :
                            ((axi_read_busy_flag == `ysyx_040654_AXI_IDLE_STATE || axi_read_busy_flag == `ysyx_040654_AXI_MEM_BUSY_STATE) && (mem_cache_read_valid_i || (mem_device_read_valid_i && (mem_device_read_addr_i < `ysyx_040654_CLINT_START || mem_device_read_addr_i > `ysyx_040654_CLINT_END)))) ? device_axi_ar_ready_i :
                            (axi_read_busy_flag == `ysyx_040654_AXI_IDLE_STATE && if_cache_read_valid_i && !mem_cache_read_valid_i && !mem_device_read_valid_i) ? device_axi_ar_ready_i :
                            (axi_read_busy_flag == `ysyx_040654_AXI_IF_BUSY_STATE && if_cache_read_valid_i) ? device_axi_ar_ready_i :  
                            (axi_read_busy_flag == `ysyx_040654_AXI_IDLE_STATE && if_device_read_valid_i && !mem_cache_read_valid_i && !mem_device_read_valid_i && (if_device_read_addr_i < `ysyx_040654_CLINT_START || if_device_read_addr_i > `ysyx_040654_CLINT_END)) ? device_axi_ar_ready_i :
                            (axi_read_busy_flag == `ysyx_040654_AXI_IF_BUSY_STATE && if_device_read_valid_i && (if_device_read_addr_i < `ysyx_040654_CLINT_START || if_device_read_addr_i > `ysyx_040654_CLINT_END)) ? device_axi_ar_ready_i :
                            (axi_read_busy_flag == `ysyx_040654_AXI_IDLE_STATE && if_device_read_valid_i && !mem_cache_read_valid_i && !mem_device_read_valid_i && (if_device_read_addr_i >= `ysyx_040654_CLINT_START && if_device_read_addr_i <= `ysyx_040654_CLINT_END)) ? clint_axi_ar_ready_i :
                            (axi_read_busy_flag == `ysyx_040654_AXI_IF_BUSY_STATE && if_device_read_valid_i && (if_device_read_addr_i >= `ysyx_040654_CLINT_START && if_device_read_addr_i <= `ysyx_040654_CLINT_END)) ? device_axi_ar_ready_i :
                            1'b0;
                            
    assign axi_ar_addr_o = axi_ar_addr;
    assign axi_ar_len_o = axi_ar_len;
    assign axi_ar_size_o = axi_ar_size;
    assign axi_ar_burst_o = axi_ar_burst;
    
    
    assign clint_axi_r_ready_o = ((axi_read_busy_flag == `ysyx_040654_AXI_IDLE_STATE || axi_read_busy_flag == `ysyx_040654_AXI_MEM_BUSY_STATE) && mem_device_read_valid_i && mem_device_read_addr_i >= `ysyx_040654_CLINT_START && mem_device_read_addr_i <= `ysyx_040654_CLINT_END) ? axi_r_ready : 
                                (axi_read_busy_flag == `ysyx_040654_AXI_IDLE_STATE && if_device_read_valid_i && !mem_cache_read_valid_i && !mem_device_read_valid_i && if_device_read_addr_i >= `ysyx_040654_CLINT_START && if_device_read_addr_i <= `ysyx_040654_CLINT_END) ? axi_r_ready :
                                (axi_read_busy_flag == `ysyx_040654_AXI_IF_BUSY_STATE && if_device_read_valid_i && if_device_read_addr_i >= `ysyx_040654_CLINT_START && if_device_read_addr_i <= `ysyx_040654_CLINT_END) ? axi_r_ready : 
                                1'b0;
    assign device_axi_r_ready_o =   ((axi_read_busy_flag == `ysyx_040654_AXI_IDLE_STATE || axi_read_busy_flag == `ysyx_040654_AXI_MEM_BUSY_STATE) && (mem_device_read_valid_i && (mem_device_read_addr_i < `ysyx_040654_CLINT_START || mem_device_read_addr_i > `ysyx_040654_CLINT_END))) ? axi_r_ready : 
                                    ((axi_read_busy_flag == `ysyx_040654_AXI_IDLE_STATE || axi_read_busy_flag == `ysyx_040654_AXI_MEM_BUSY_STATE) && mem_cache_read_valid_i) ? axi_r_ready :
                                    (axi_read_busy_flag == `ysyx_040654_AXI_IDLE_STATE && if_cache_read_valid_i && !mem_cache_read_valid_i && !mem_device_read_valid_i) ? axi_r_ready :
                                    (axi_read_busy_flag == `ysyx_040654_AXI_IF_BUSY_STATE && if_cache_read_valid_i) ? axi_r_ready :
                                    ((axi_read_busy_flag == `ysyx_040654_AXI_IDLE_STATE && if_device_read_valid_i && !mem_cache_read_valid_i && !mem_device_read_valid_i) && (if_device_read_addr_i < `ysyx_040654_CLINT_START || if_device_read_addr_i > `ysyx_040654_CLINT_END)) ? axi_r_ready :
                                    (axi_read_busy_flag == `ysyx_040654_AXI_IF_BUSY_STATE && if_device_read_valid_i && (if_device_read_addr_i < `ysyx_040654_CLINT_START || if_device_read_addr_i > `ysyx_040654_CLINT_END)) ? axi_r_ready : 
                                    1'b0;
    assign axi_r_valid = ((axi_read_busy_flag == `ysyx_040654_AXI_IDLE_STATE || axi_read_busy_flag == `ysyx_040654_AXI_MEM_BUSY_STATE) && mem_device_read_valid_i && mem_device_read_addr_i >= `ysyx_040654_CLINT_START && mem_device_read_addr_i <= `ysyx_040654_CLINT_END) ? clint_axi_r_valid_i :
                        ((axi_read_busy_flag == `ysyx_040654_AXI_IDLE_STATE || axi_read_busy_flag == `ysyx_040654_AXI_MEM_BUSY_STATE) && (mem_cache_read_valid_i || (mem_device_read_valid_i && (mem_device_read_addr_i < `ysyx_040654_CLINT_START || mem_device_read_addr_i > `ysyx_040654_CLINT_END)))) ? device_axi_r_valid_i : 
                        (axi_read_busy_flag == `ysyx_040654_AXI_IDLE_STATE && if_cache_read_valid_i && !mem_cache_read_valid_i && !mem_device_read_valid_i) ? device_axi_r_valid_i :
                        (axi_read_busy_flag ==`ysyx_040654_AXI_IF_BUSY_STATE && if_cache_read_valid_i) ? device_axi_r_valid_i : 
                        (axi_read_busy_flag == `ysyx_040654_AXI_IDLE_STATE && if_device_read_valid_i && !mem_cache_read_valid_i && !mem_device_read_valid_i && (if_device_read_addr_i < `ysyx_040654_CLINT_START || if_device_read_addr_i > `ysyx_040654_CLINT_END)) ? device_axi_r_valid_i :
                        (axi_read_busy_flag == `ysyx_040654_AXI_IF_BUSY_STATE && if_device_read_valid_i && (if_device_read_addr_i < `ysyx_040654_CLINT_START || if_device_read_addr_i > `ysyx_040654_CLINT_END)) ? device_axi_r_valid_i :
                        (axi_read_busy_flag == `ysyx_040654_AXI_IDLE_STATE && if_device_read_valid_i && !mem_cache_read_valid_i && !mem_device_read_valid_i && (if_device_read_addr_i >= `ysyx_040654_CLINT_START && if_device_read_addr_i <= `ysyx_040654_CLINT_END)) ? clint_axi_r_valid_i :
                        (axi_read_busy_flag == `ysyx_040654_AXI_IF_BUSY_STATE && if_device_read_valid_i && (if_device_read_addr_i >= `ysyx_040654_CLINT_START && if_device_read_addr_i <= `ysyx_040654_CLINT_END)) ? clint_axi_r_valid_i :
                        1'b0;
    assign axi_r_resp = ((axi_read_busy_flag == `ysyx_040654_AXI_IDLE_STATE || axi_read_busy_flag == `ysyx_040654_AXI_MEM_BUSY_STATE) && mem_device_read_valid_i && mem_device_read_addr_i >= `ysyx_040654_CLINT_START && mem_device_read_addr_i <= `ysyx_040654_CLINT_END) ? clint_axi_r_resp_i :
                        ((axi_read_busy_flag == `ysyx_040654_AXI_IDLE_STATE || axi_read_busy_flag == `ysyx_040654_AXI_MEM_BUSY_STATE) && (mem_cache_read_valid_i || (mem_device_read_valid_i && (mem_device_read_addr_i < `ysyx_040654_CLINT_START || mem_device_read_addr_i > `ysyx_040654_CLINT_END)))) ? device_axi_r_resp_i : 
                        (axi_read_busy_flag == `ysyx_040654_AXI_IDLE_STATE && if_cache_read_valid_i && !mem_cache_read_valid_i &&  !mem_device_read_valid_i ) ? device_axi_r_resp_i :
                        (axi_read_busy_flag ==`ysyx_040654_AXI_IF_BUSY_STATE && if_cache_read_valid_i) ? device_axi_r_resp_i : 
                        (axi_read_busy_flag == `ysyx_040654_AXI_IDLE_STATE && if_device_read_valid_i && !mem_cache_read_valid_i  && !mem_device_read_valid_i && (if_device_read_addr_i < `ysyx_040654_CLINT_START || if_device_read_addr_i > `ysyx_040654_CLINT_END)) ? device_axi_r_resp_i :
                        (axi_read_busy_flag == `ysyx_040654_AXI_IF_BUSY_STATE && if_device_read_valid_i && (if_device_read_addr_i < `ysyx_040654_CLINT_START || if_device_read_addr_i > `ysyx_040654_CLINT_END)) ? device_axi_r_resp_i :
                        (axi_read_busy_flag == `ysyx_040654_AXI_IDLE_STATE && if_device_read_valid_i && !mem_cache_read_valid_i && !mem_device_read_valid_i && (if_device_read_addr_i >= `ysyx_040654_CLINT_START && if_device_read_addr_i <= `ysyx_040654_CLINT_END)) ? clint_axi_r_resp_i :
                        (axi_read_busy_flag == `ysyx_040654_AXI_IF_BUSY_STATE && if_device_read_valid_i && (if_device_read_addr_i >= `ysyx_040654_CLINT_START && if_device_read_addr_i <= `ysyx_040654_CLINT_END)) ? clint_axi_r_resp_i :
                        2'b0;
    assign axi_r_data = ((axi_read_busy_flag == `ysyx_040654_AXI_IDLE_STATE || axi_read_busy_flag == `ysyx_040654_AXI_MEM_BUSY_STATE) && mem_device_read_valid_i && mem_device_read_addr_i >= `ysyx_040654_CLINT_START && mem_device_read_addr_i <= `ysyx_040654_CLINT_END) ? clint_axi_r_data_i :
                        ((axi_read_busy_flag == `ysyx_040654_AXI_IDLE_STATE || axi_read_busy_flag == `ysyx_040654_AXI_MEM_BUSY_STATE) && (mem_cache_read_valid_i || (mem_device_read_valid_i && (mem_device_read_addr_i < `ysyx_040654_CLINT_START || mem_device_read_addr_i > `ysyx_040654_CLINT_END)))) ? device_axi_r_data_i : 
                        (axi_read_busy_flag == `ysyx_040654_AXI_IDLE_STATE && if_cache_read_valid_i && !mem_cache_read_valid_i && !mem_device_read_valid_i) ? device_axi_r_data_i :
                        (axi_read_busy_flag ==`ysyx_040654_AXI_IF_BUSY_STATE && if_cache_read_valid_i) ? device_axi_r_data_i : 
                        (axi_read_busy_flag == `ysyx_040654_AXI_IDLE_STATE && if_device_read_valid_i && !mem_cache_read_valid_i && !mem_device_read_valid_i  && (if_device_read_addr_i < `ysyx_040654_CLINT_START || if_device_read_addr_i > `ysyx_040654_CLINT_END)) ? device_axi_r_data_i :
                        (axi_read_busy_flag == `ysyx_040654_AXI_IF_BUSY_STATE && if_device_read_valid_i && (if_device_read_addr_i < `ysyx_040654_CLINT_START || if_device_read_addr_i > `ysyx_040654_CLINT_END)) ? device_axi_r_data_i :
                        (axi_read_busy_flag == `ysyx_040654_AXI_IDLE_STATE && if_device_read_valid_i && !mem_cache_read_valid_i && !mem_device_read_valid_i  && (if_device_read_addr_i >= `ysyx_040654_CLINT_START && if_device_read_addr_i <= `ysyx_040654_CLINT_END)) ? clint_axi_r_data_i :
                        (axi_read_busy_flag == `ysyx_040654_AXI_IF_BUSY_STATE && if_device_read_valid_i && (if_device_read_addr_i >= `ysyx_040654_CLINT_START && if_device_read_addr_i <= `ysyx_040654_CLINT_END)) ? clint_axi_r_data_i :
                        64'b0;
    assign axi_r_last = ((axi_read_busy_flag == `ysyx_040654_AXI_IDLE_STATE || axi_read_busy_flag == `ysyx_040654_AXI_MEM_BUSY_STATE) && mem_device_read_valid_i && mem_device_read_addr_i >= `ysyx_040654_CLINT_START && mem_device_read_addr_i <= `ysyx_040654_CLINT_END) ? clint_axi_r_last_i :
                        ((axi_read_busy_flag == `ysyx_040654_AXI_IDLE_STATE || axi_read_busy_flag == `ysyx_040654_AXI_MEM_BUSY_STATE) && (mem_cache_read_valid_i || (mem_device_read_valid_i && (mem_device_read_addr_i < `ysyx_040654_CLINT_START || mem_device_read_addr_i > `ysyx_040654_CLINT_END)))) ? device_axi_r_last_i : 
                        (axi_read_busy_flag == `ysyx_040654_AXI_IDLE_STATE && if_cache_read_valid_i && !mem_cache_read_valid_i && !mem_device_read_valid_i) ? device_axi_r_last_i :
                        (axi_read_busy_flag ==`ysyx_040654_AXI_IF_BUSY_STATE && if_cache_read_valid_i) ? device_axi_r_last_i : 
                        (axi_read_busy_flag == `ysyx_040654_AXI_IDLE_STATE && if_device_read_valid_i && !mem_cache_read_valid_i && !mem_device_read_valid_i && (if_device_read_addr_i < `ysyx_040654_CLINT_START || if_device_read_addr_i > `ysyx_040654_CLINT_END)) ? device_axi_r_last_i :
                        (axi_read_busy_flag == `ysyx_040654_AXI_IF_BUSY_STATE && if_device_read_valid_i && (if_device_read_addr_i < `ysyx_040654_CLINT_START || if_device_read_addr_i > `ysyx_040654_CLINT_END)) ? device_axi_r_last_i :
                        (axi_read_busy_flag == `ysyx_040654_AXI_IDLE_STATE && if_device_read_valid_i && !mem_cache_read_valid_i && !mem_device_read_valid_i && (if_device_read_addr_i >= `ysyx_040654_CLINT_START && if_device_read_addr_i <= `ysyx_040654_CLINT_END)) ? clint_axi_r_last_i :
                        (axi_read_busy_flag == `ysyx_040654_AXI_IF_BUSY_STATE && if_device_read_valid_i && (if_device_read_addr_i >= `ysyx_040654_CLINT_START && if_device_read_addr_i <= `ysyx_040654_CLINT_END)) ? clint_axi_r_last_i :
                        1'b0;
    
    assign clint_axi_aw_valid_o = ((axi_write_busy_flag == `ysyx_040654_AXI_IDLE_STATE || axi_write_busy_flag == `ysyx_040654_AXI_MEM_BUSY_STATE) && mem_device_write_valid_i && (mem_device_write_addr_i >= `ysyx_040654_CLINT_START && mem_device_write_addr_i < `ysyx_040654_CLINT_END)) ? axi_aw_valid : 1'b0;
    assign device_axi_aw_valid_o = ((axi_write_busy_flag == `ysyx_040654_AXI_IDLE_STATE || axi_write_busy_flag == `ysyx_040654_AXI_MEM_BUSY_STATE) && (mem_cache_write_valid_i || (mem_device_write_valid_i && (mem_device_write_addr_i < `ysyx_040654_CLINT_START || mem_device_write_addr_i > `ysyx_040654_CLINT_END)))) ? axi_aw_valid : 1'b0;
    assign axi_aw_ready =   ((axi_write_busy_flag == `ysyx_040654_AXI_IDLE_STATE || axi_write_busy_flag == `ysyx_040654_AXI_MEM_BUSY_STATE) && mem_device_write_valid_i && (mem_device_write_addr_i >= `ysyx_040654_CLINT_START && mem_device_write_addr_i < `ysyx_040654_CLINT_END)) ? clint_axi_aw_ready_i :
                            ((axi_write_busy_flag == `ysyx_040654_AXI_IDLE_STATE || axi_write_busy_flag == `ysyx_040654_AXI_MEM_BUSY_STATE) && (mem_cache_write_valid_i || (mem_device_write_valid_i && (mem_device_write_addr_i < `ysyx_040654_CLINT_START || mem_device_write_addr_i > `ysyx_040654_CLINT_END)))) ? device_axi_aw_ready_i : 1'b0;
    
    assign axi_aw_addr_o = axi_aw_addr;
    assign axi_aw_len_o = axi_aw_len;
    assign axi_aw_size_o = axi_aw_size;
    assign axi_aw_burst_o = axi_aw_burst;

    assign axi_w_ready =    ((axi_write_busy_flag == `ysyx_040654_AXI_IDLE_STATE || axi_write_busy_flag == `ysyx_040654_AXI_MEM_BUSY_STATE) && mem_device_write_valid_i && (mem_device_write_addr_i >= `ysyx_040654_CLINT_START && mem_device_write_addr_i < `ysyx_040654_CLINT_END)) ? clint_axi_w_ready_i :
                            ((axi_write_busy_flag == `ysyx_040654_AXI_IDLE_STATE || axi_write_busy_flag == `ysyx_040654_AXI_MEM_BUSY_STATE) && (mem_cache_write_valid_i || (mem_device_write_valid_i && (mem_device_write_addr_i < `ysyx_040654_CLINT_START || mem_device_write_addr_i > `ysyx_040654_CLINT_END)))) ? device_axi_w_ready_i : 1'b0;
    assign clint_axi_w_valid_o = ((axi_write_busy_flag == `ysyx_040654_AXI_IDLE_STATE || axi_write_busy_flag == `ysyx_040654_AXI_MEM_BUSY_STATE) && mem_device_write_valid_i && (mem_device_write_addr_i >= `ysyx_040654_CLINT_START && mem_device_write_addr_i < `ysyx_040654_CLINT_END)) ? axi_w_valid : 1'b0;
    assign device_axi_w_valid_o = ((axi_write_busy_flag == `ysyx_040654_AXI_IDLE_STATE || axi_write_busy_flag == `ysyx_040654_AXI_MEM_BUSY_STATE) && (mem_cache_write_valid_i || (mem_device_write_valid_i && (mem_device_write_addr_i < `ysyx_040654_CLINT_START || mem_device_write_addr_i > `ysyx_040654_CLINT_END)))) ? axi_w_valid : 1'b0;
    
    assign axi_w_data_o = axi_w_data;
    assign axi_w_strb_o = axi_w_strb;
    assign axi_w_last_o = axi_w_last;

    assign clint_axi_b_ready_o = ((axi_write_busy_flag == `ysyx_040654_AXI_IDLE_STATE || axi_write_busy_flag == `ysyx_040654_AXI_MEM_BUSY_STATE) && mem_device_write_valid_i && (mem_device_write_addr_i >= `ysyx_040654_CLINT_START && mem_device_write_addr_i < `ysyx_040654_CLINT_END)) ? axi_b_ready : 1'b0;
    assign device_axi_b_ready_o = ((axi_write_busy_flag == `ysyx_040654_AXI_IDLE_STATE || axi_write_busy_flag == `ysyx_040654_AXI_MEM_BUSY_STATE) && (mem_cache_write_valid_i || (mem_device_write_valid_i && (mem_device_write_addr_i < `ysyx_040654_CLINT_START || mem_device_write_addr_i > `ysyx_040654_CLINT_END)))) ? axi_b_ready : 1'b0;
    assign axi_b_valid = ((axi_write_busy_flag == `ysyx_040654_AXI_IDLE_STATE || axi_write_busy_flag == `ysyx_040654_AXI_MEM_BUSY_STATE) && mem_device_write_valid_i && (mem_device_write_addr_i >= `ysyx_040654_CLINT_START && mem_device_write_addr_i < `ysyx_040654_CLINT_END)) ? clint_axi_b_valid_i :
                        ((axi_write_busy_flag == `ysyx_040654_AXI_IDLE_STATE || axi_write_busy_flag == `ysyx_040654_AXI_MEM_BUSY_STATE) && (mem_cache_write_valid_i || (mem_device_write_valid_i && (mem_device_write_addr_i < `ysyx_040654_CLINT_START || mem_device_write_addr_i > `ysyx_040654_CLINT_END)))) ? device_axi_b_valid_i : 1'b0;
    assign axi_b_resp = ((axi_write_busy_flag == `ysyx_040654_AXI_IDLE_STATE || axi_write_busy_flag == `ysyx_040654_AXI_MEM_BUSY_STATE) && mem_device_write_valid_i && (mem_device_write_addr_i >= `ysyx_040654_CLINT_START && mem_device_write_addr_i < `ysyx_040654_CLINT_END)) ? clint_axi_b_resp_i :
                        ((axi_write_busy_flag == `ysyx_040654_AXI_IDLE_STATE || axi_write_busy_flag == `ysyx_040654_AXI_MEM_BUSY_STATE) && (mem_cache_write_valid_i || (mem_device_write_valid_i && (mem_device_write_addr_i < `ysyx_040654_CLINT_START || mem_device_write_addr_i > `ysyx_040654_CLINT_END)))) ? device_axi_b_resp_i : 2'b0;

endmodule


module ysyx_040654_bju(
    // from decoder
    input [`ysyx_040654_BJU_OP-1:0] bju_op_i,
    input [`ysyx_040654_MemAddrBus] bju_pc_base_i,
    input [`ysyx_040654_MemAddrBus] bju_pc_offset_i,
    input [`ysyx_040654_MemAddrBus] bju_pc_i,
    input [`ysyx_040654_DataBus] bju_src1_i,
    input [`ysyx_040654_DataBus] bju_src2_i,
    
    // to pc
    output reg [`ysyx_040654_MemAddrBus] branch_addr_o,
    output reg branch_flag_o,

    // to reg 
    output [`ysyx_040654_RegBus] bju_result_o

);
    wire [`ysyx_040654_DataBus] bju_src1;
    wire [`ysyx_040654_DataBus] bju_src2;
    wire [`ysyx_040654_DataBus] bju_cin;
    wire [`ysyx_040654_DataBus] bju_result;
    wire bju_cout;
    wire bju_eq;
    


    always @(*) begin
        case(bju_op_i)
            `ysyx_040654_BJU_JAL, `ysyx_040654_BJU_JALR: begin
                branch_flag_o = 1'b1;
            end
            `ysyx_040654_BJU_BEQ: begin
                branch_flag_o = (bju_eq) ? 1'b1 : 1'b0;
            end
            `ysyx_040654_BJU_BNE: begin
                branch_flag_o = (!bju_eq) ? 1'b1 : 1'b0;
            end
            `ysyx_040654_BJU_BLTU: begin
                branch_flag_o = (~bju_cout && ~bju_eq) ? 1'b1 : 1'b0;
            end
            `ysyx_040654_BJU_BLT: begin
                branch_flag_o = ((bju_src1_i[63] && ~bju_src2_i[63]) || 
                                (~(bju_src1_i[63] ^ bju_src2_i[63])) && bju_result[63]) ? 1'b1 : 1'b0;
            end
            `ysyx_040654_BJU_BGEU: begin
                branch_flag_o = (bju_cout | bju_eq) ? 1'b1 : 1'b0;
            end
            `ysyx_040654_BJU_BGE: begin
                branch_flag_o = !((bju_src1_i[63] && ~bju_src2_i[63]) || 
                                (~(bju_src1_i[63] ^ bju_src2_i[63])) && bju_result[63]) ? 1'b1 : 1'b0;
            end
            default: begin
                branch_flag_o = 1'b0;
            end
        endcase
    end

    assign bju_src1 = bju_src1_i;
    assign bju_src2 = ~bju_src2_i;
    assign bju_cin = 64'b1;
    assign {bju_cout,bju_result} = bju_src1 + bju_src2 + bju_cin;
    assign bju_eq = (bju_result == 64'b0) ? 1'b1 : 1'b0; 

    assign branch_addr_o = branch_flag_o ? bju_pc_base_i + bju_pc_offset_i : `ysyx_040654_Zero_HalfWord;
    assign bju_result_o = (bju_op_i == `ysyx_040654_BJU_JAL || bju_op_i == `ysyx_040654_BJU_JALR) ? {32'b0, bju_pc_i} + 4  : `ysyx_040654_Zero_Word; 

endmodule



// 2-ways set associative cache
// if cache miss will allocation a cache by  LRU(least recently used)
// if write cache hit will use write back 
module ysyx_040654_cache_ctrl (
    input                           clk,
    input                           rstn,
    input                           cache_flush_valid_i,
    output                          cache_flush_ready_o,
    //------------------ cpu interface -------------------//
    input   [`ysyx_040654_LSU_OP-1:0]           lsu_op_i,
    input                           read_valid_i,                         // cpu read mem req
    output                          read_ready_o,                        // if cache hit, cache resp
    input   [31:0]                  read_addr_i,  
    output  [63:0]                  read_data_o,

    input                           write_valid_i,                        // cpu write mem req
    output                          write_ready_o,                       // if cache hit, cache resp
    input   [31:0]                  write_addr_i,   
    input   [63:0]                  write_data_i,
    input   [7:0]                   write_mask_i,

    //------------------ axi interface -------------------//
    output                          axi_read_valid_o,                          // if cache miss, request data from mem by axi bus
    input                           axi_read_ready_i,                           // response from mem by axi bus
    input   [63:0]                  axi_read_data_i,
    output  [31:0]                  axi_read_addr_o,
    input                           axi_read_last_i,
    
    
    output                          axi_write_valid_o,                         // if cache miss, request data from mem by axi bus
    input                           axi_write_ready_i,                          // response from mem by axi bus
    output [31:0]                   axi_write_addr_o,
    output [63:0]                   axi_write_data_o,
    output [7:0]                    axi_write_mask_o,
    input                           axi_write_last_i,
    input                           axi_write_resp_i,

    //------------------ cache(sram) interface -------------------//
    output                          cache_cen_o,                         // cache使能信号, 低电平有效
    output                          cache_wen_o,                         // cache写使能信号, 低电平有效
    output [`ysyx_040654_CacheBus]              cache_bwen_o,            // 写掩码信号, 掩码粒度为1bit, 低电平有效
    output [`ysyx_040654_CacheAddrBus]          cache_addr_o,        // cache读写地址
    output [`ysyx_040654_CacheBus]              cache_wdata_o,           // cache写数据
    output [3:0]                    cache_sel_o,                   
    input [`ysyx_040654_CacheBus]               cache_rdata_i
);
    
    
    // addr = 32 bit , offset = 4 bit , index = 6 bit , 64 cache set, 1 set = 4 way
    reg [3:0] valid_bit [63:0];
    reg [3:0] dirty_bit [63:0];
    reg [87:0] tag [63:0];      
    reg [7:0] used_rank [63:0];
    reg [1:0] cache_clock;
    wire cache_hit;
    wire [3:0] cache_offset;
    wire [5:0] cache_index;
    wire [21:0] cache_tag;
    integer i;
    
    //------------------------ READ PARAMETER ------------------------//
    localparam r_idle_state = 2'b00, r_compare_tag_state = 2'b01, r_write_back_state = 2'b10, r_allocate_state = 2'b11;
    reg [1:0] r_curr_state, r_next_state;
    wire axi_read_handshake = axi_read_valid_o && axi_read_ready_i;
    reg axi_read_handshake_r;
    reg axi_read_last_r;
    reg [63:0] axi_read_data_r;
    

    //------------------------ WRITE PARAMETER ------------------------//
    localparam w_idle_state = 2'b00, w_compare_tag_state = 2'b01, w_write_back_state = 2'b10, w_allocate_state = 2'b11;
    reg [1:0] w_curr_state, w_next_state;
    reg axi_read_finish, axi_write_finish;
    reg [127:0] cache_read_data_buf, cache_write_data_buf;
    reg axi_read_handshake_r0, axi_read_last_r0;
    reg [63:0] write_data;


    //------------------------ FLUSH PARAMETER ------------------------//
    localparam  flush_idle_state = 2'b00, flush_isdirty_state = 2'b01, flush_read_state = 2'b10, flush_write_state = 2'b11;
    reg [7:0]   cnt;
    reg [1:0]   flush_curr_state, flush_next_state;
    wire [5:0]  flush_index;

    assign cache_offset = read_valid_i ? read_addr_i[3:0] :
                            write_valid_i ? write_addr_i[3:0] : 4'b0;

    assign cache_index = read_valid_i ? read_addr_i[9:4] :
                            write_valid_i ? write_addr_i[9:4] : 6'b0;

    assign cache_tag = read_valid_i ? read_addr_i[31:10] :
                            write_valid_i ? write_addr_i[31:10] : 22'b0;

    assign cache_hit =  (valid_bit[cache_index][0] && cache_tag == tag[cache_index][21:0]) 
                        || (valid_bit[cache_index][0] && cache_tag == tag[cache_index][43:22])
                        || (valid_bit[cache_index][0] && cache_tag == tag[cache_index][65:44])
                        || (valid_bit[cache_index][0] && cache_tag == tag[cache_index][87:66]);
    
    always @(posedge clk) begin
        if(!rstn) begin
            for(i = 0; i < 64; i = i+1) begin
                valid_bit[i] <= 4'b0;
                dirty_bit[i] <= 4'b0;
                tag[i] <= 88'b0;
                used_rank[i] <= {8{1'b1}};  
            end
            cache_clock <= 2'b0;
            axi_read_finish <= 1'b0;
            axi_write_finish <= 1'b0;
            cache_read_data_buf <= 128'b0;
            cache_write_data_buf <= 128'b0;
        end else begin
            if(r_curr_state == r_idle_state && w_curr_state == w_idle_state && flush_curr_state == flush_idle_state) begin
                cache_clock <= 2'b0;
                axi_read_finish <= 1'b0;
                axi_write_finish <= 1'b0;
                cache_read_data_buf <= 128'b0;
                cache_write_data_buf <= 128'b0;
            end else if(flush_curr_state == flush_read_state) begin
                cache_write_data_buf <= cache_rdata_i;
            end else if(flush_curr_state == flush_write_state && axi_write_resp_i) begin
                cache_write_data_buf <= 128'b0;
                case(cnt[7:6]) 
                    2'b00: begin
                        dirty_bit[flush_index][0] <= 1'b0;
                    end
                    2'b01: begin
                        dirty_bit[flush_index][1] <= 1'b0;
                    end
                    2'b10: begin
                        dirty_bit[flush_index][2] <= 1'b0;
                    end
                    default: begin
                        dirty_bit[flush_index][3] <= 1'b0;
                    end
                endcase
            end else if(r_curr_state == r_compare_tag_state && cache_hit) begin
                if(cache_clock == 2'b00) begin
                    cache_clock <= cache_clock + 1;
                    if(tag[cache_index][21:0] == cache_tag) begin   // hit cache change used_rank(命中的set rank变为0，其他set中比原命中set rank小的+1)
                        used_rank[cache_index][1:0] <= 2'b00;
                        if(valid_bit[cache_index][1] && used_rank[cache_index][3:2] < used_rank[cache_index][1:0]) begin
                            used_rank[cache_index][3:2] <= used_rank[cache_index][3:2] + 1;
                        end
                        if(valid_bit[cache_index][2] && used_rank[cache_index][5:4] < used_rank[cache_index][1:0]) begin
                            used_rank[cache_index][5:4] <= used_rank[cache_index][5:4] + 1;
                        end 
                        if(valid_bit[cache_index][3] && used_rank[cache_index][7:6] < used_rank[cache_index][1:0]) begin
                            used_rank[cache_index][7:6] <= used_rank[cache_index][7:6] + 1;
                        end
                    end else if(tag[cache_index][43:22] == cache_tag)begin
                        used_rank[cache_index][3:2] <= 2'b00;
                        if(valid_bit[cache_index][0] && used_rank[cache_index][1:0] < used_rank[cache_index][3:2]) begin
                            used_rank[cache_index][1:0] <= used_rank[cache_index][1:0] + 1;
                        end
                        if(valid_bit[cache_index][2] && used_rank[cache_index][5:4] < used_rank[cache_index][3:2]) begin
                            used_rank[cache_index][5:4] <= used_rank[cache_index][5:4] + 1;
                        end 
                        if(valid_bit[cache_index][3] && used_rank[cache_index][7:6] < used_rank[cache_index][3:2]) begin
                            used_rank[cache_index][7:6] <= used_rank[cache_index][7:6] + 1;
                        end
                    end else if(tag[cache_index][65:44] == cache_tag)begin
                        used_rank[cache_index][5:4] <= 2'b00;
                        if(valid_bit[cache_index][0] && used_rank[cache_index][1:0] < used_rank[cache_index][5:4]) begin
                            used_rank[cache_index][1:0] <= used_rank[cache_index][1:0] + 1;
                        end
                        if(valid_bit[cache_index][1] && used_rank[cache_index][3:2] < used_rank[cache_index][5:4]) begin
                            used_rank[cache_index][3:2] <= used_rank[cache_index][3:2] + 1;
                        end 
                        if(valid_bit[cache_index][3] && used_rank[cache_index][7:6] < used_rank[cache_index][5:4]) begin
                            used_rank[cache_index][7:6] <= used_rank[cache_index][7:6] + 1;
                        end
                    end else if(tag[cache_index][87:66] == cache_tag)begin
                        used_rank[cache_index][7:6] <= 2'b00;
                        if(valid_bit[cache_index][0] && used_rank[cache_index][1:0] < used_rank[cache_index][7:6]) begin
                            used_rank[cache_index][1:0] <= used_rank[cache_index][1:0] + 1;
                        end
                        if(valid_bit[cache_index][1] && used_rank[cache_index][3:2] < used_rank[cache_index][7:6]) begin
                            used_rank[cache_index][3:2] <= used_rank[cache_index][3:2] + 1;
                        end 
                        if(valid_bit[cache_index][2] && used_rank[cache_index][5:4] < used_rank[cache_index][7:6]) begin
                            used_rank[cache_index][5:4] <= used_rank[cache_index][5:4] + 1;
                        end
                    end
                end else begin
                    cache_clock <= 2'b00;
                end
            end else if(r_curr_state == r_allocate_state) begin
                if(cache_clock == 2'b01) begin
                    cache_clock <= 2'b00;
                end
                if(axi_read_handshake_r && axi_read_last_r) begin
                    cache_clock <= 2'b01;
                    case(valid_bit[cache_index])
                        4'b0000: begin
                            valid_bit[cache_index] <= 4'b0001;
                            tag[cache_index][21:0] <= cache_tag;
                            used_rank[cache_index][1:0] <= 2'b00;
                        end
                        4'b0001: begin
                            valid_bit[cache_index] <= 4'b0011;
                            tag[cache_index][43:22] <= cache_tag;
                            used_rank[cache_index][3:2] <= 2'b00;
                            used_rank[cache_index][1:0] <= used_rank[cache_index][1:0] + 1;
                        end
                        4'b0011: begin
                            valid_bit[cache_index] <= 4'b0111;
                            tag[cache_index][65:44] <= cache_tag;
                            used_rank[cache_index][5:4] <= 2'b00;
                            used_rank[cache_index][1:0] <= used_rank[cache_index][1:0] + 1;
                            used_rank[cache_index][3:2] <= used_rank[cache_index][3:2] + 1;
                        end
                        4'b0111: begin
                            valid_bit[cache_index] <= 4'b1111;
                            tag[cache_index][87:66] <= cache_tag;
                            used_rank[cache_index][7:6] <= 2'b00;
                            used_rank[cache_index][1:0] <= used_rank[cache_index][1:0] + 1;
                            used_rank[cache_index][3:2] <= used_rank[cache_index][3:2] + 1;
                            used_rank[cache_index][5:4] <= used_rank[cache_index][5:4] + 1;
                        end
                        4'b1111: begin
                            used_rank[cache_index][1:0] <= used_rank[cache_index][1:0] + 1;
                            used_rank[cache_index][3:2] <= used_rank[cache_index][3:2] + 1;
                            used_rank[cache_index][5:4] <= used_rank[cache_index][5:4] + 1;
                            used_rank[cache_index][7:6] <= used_rank[cache_index][7:6] + 1;
                            case(2'b11) 
                                used_rank[cache_index][1:0]: begin
                                    tag[cache_index][21:0] <= cache_tag;
                                    dirty_bit[cache_index][0] <= 1'b0;
                                end
                                used_rank[cache_index][3:2]: begin
                                    tag[cache_index][43:22] <= cache_tag;
                                    dirty_bit[cache_index][1] <= 1'b0;
                                end
                                used_rank[cache_index][5:4]: begin
                                    tag[cache_index][65:44] <= cache_tag;
                                    dirty_bit[cache_index][2] <= 1'b0;
                                end
                                default: begin
                                    tag[cache_index][87:66] <= cache_tag;
                                    dirty_bit[cache_index][3] <= 1'b0;
                                end
                            endcase
                        end
                        default: begin
                            valid_bit[cache_index] <= valid_bit[cache_index];
                            used_rank[cache_index] <= used_rank[cache_index];
                            tag[cache_index] <= tag[cache_index];
                            dirty_bit[cache_index] <= dirty_bit[cache_index];
                        end
                    endcase
                end
            end else if(r_curr_state == r_write_back_state) begin
                if(cache_clock == 2'b00) begin
                    cache_write_data_buf <= cache_rdata_i;
                    cache_clock <= 2'b01;
                end else if(cache_clock == 2'b01) begin
                    if(axi_read_handshake_r && !axi_read_last_r) begin
                        cache_read_data_buf[63:0] <= axi_read_data_i;
                    end else if(axi_read_handshake_r && axi_read_last_r) begin
                        cache_read_data_buf[127:64] <= axi_read_data_i;
                        axi_read_finish <= 1'b1;
                    end
                    if(axi_write_resp_i) begin
                        axi_write_finish <= 1'b1;
                    end
                    if((axi_read_handshake_r && axi_read_last_r && axi_write_resp_i) ||
                        (axi_read_handshake_r && axi_read_last_r && axi_write_finish) ||
                        (axi_read_finish && axi_write_resp_i)) begin
                            cache_clock <= 2'b10;
                            axi_read_finish <= 1'b0;
                            axi_write_finish <= 1'b0;
                            cache_write_data_buf <= 128'b0;
                    end
                end else if(cache_clock == 2'b10) begin
                    cache_clock <= 2'b00;
                    cache_read_data_buf <= 128'b0;
                    used_rank[cache_index][1:0] <= used_rank[cache_index][1:0] + 1;
                    used_rank[cache_index][3:2] <= used_rank[cache_index][3:2] + 1;
                    used_rank[cache_index][5:4] <= used_rank[cache_index][5:4] + 1;
                    used_rank[cache_index][7:6] <= used_rank[cache_index][7:6] + 1;
                    case(2'b11)
                        used_rank[cache_index][1:0]: begin
                            tag[cache_index][21:0] <= cache_tag;
                            dirty_bit[cache_index][0] <= 1'b0;
                        end
                        used_rank[cache_index][3:2]: begin
                            tag[cache_index][43:22] <= cache_tag;
                            dirty_bit[cache_index][1] <= 1'b0;
                        end
                        used_rank[cache_index][5:4]: begin
                            tag[cache_index][65:44] <= cache_tag;
                            dirty_bit[cache_index][2] <= 1'b0;
                        end
                        default: begin
                            tag[cache_index][87:66] <= cache_tag;
                            dirty_bit[cache_index][3] <= 1'b0;
                        end
                    endcase
                end
            end else if(w_curr_state == w_compare_tag_state && cache_hit) begin
                if(tag[cache_index][21:0] == cache_tag) begin
                    dirty_bit[cache_index][0] <= 1'b1;
                    used_rank[cache_index][1:0] <= 2'b00;
                    if(valid_bit[cache_index][1] && used_rank[cache_index][3:2] < used_rank[cache_index][1:0]) begin
                        used_rank[cache_index][3:2] <= used_rank[cache_index][3:2] + 1;
                    end
                    if(valid_bit[cache_index][2] && used_rank[cache_index][5:4] < used_rank[cache_index][1:0]) begin
                        used_rank[cache_index][5:4] <= used_rank[cache_index][5:4] + 1;
                    end 
                    if(valid_bit[cache_index][3] && used_rank[cache_index][7:6] < used_rank[cache_index][1:0]) begin
                        used_rank[cache_index][7:6] <= used_rank[cache_index][7:6] + 1;
                    end
                end else if(tag[cache_index][43:22] == cache_tag) begin
                    dirty_bit[cache_index][1] <= 1'b1;
                    used_rank[cache_index][3:2] <= 2'b00;
                    if(valid_bit[cache_index][0] && used_rank[cache_index][1:0] < used_rank[cache_index][3:2]) begin
                        used_rank[cache_index][1:0] <= used_rank[cache_index][1:0] + 1;
                    end
                    if(valid_bit[cache_index][2] && used_rank[cache_index][5:4] < used_rank[cache_index][3:2]) begin
                        used_rank[cache_index][5:4] <= used_rank[cache_index][5:4] + 1;
                    end 
                    if(valid_bit[cache_index][3] && used_rank[cache_index][7:6] < used_rank[cache_index][3:2]) begin
                        used_rank[cache_index][7:6] <= used_rank[cache_index][7:6] + 1;
                    end
                end else if(tag[cache_index][65:44] == cache_tag) begin
                    dirty_bit[cache_index][2] <= 1'b1;
                    used_rank[cache_index][5:4] <= 2'b00;
                    if(valid_bit[cache_index][0] && used_rank[cache_index][1:0] < used_rank[cache_index][5:4]) begin
                        used_rank[cache_index][1:0] <= used_rank[cache_index][1:0] + 1;
                    end
                    if(valid_bit[cache_index][1] && used_rank[cache_index][3:2] < used_rank[cache_index][5:4]) begin
                        used_rank[cache_index][3:2] <= used_rank[cache_index][3:2] + 1;
                    end 
                    if(valid_bit[cache_index][3] && used_rank[cache_index][7:6] < used_rank[cache_index][5:4]) begin
                        used_rank[cache_index][7:6] <= used_rank[cache_index][7:6] + 1;
                    end
                end else begin
                    dirty_bit[cache_index][3] <= 1'b1;
                    used_rank[cache_index][7:6] <= 2'b00;
                    if(valid_bit[cache_index][0] && used_rank[cache_index][1:0] < used_rank[cache_index][7:6]) begin
                        used_rank[cache_index][1:0] <= used_rank[cache_index][1:0] + 1;
                    end
                    if(valid_bit[cache_index][1] && used_rank[cache_index][3:2] < used_rank[cache_index][7:6]) begin
                        used_rank[cache_index][3:2] <= used_rank[cache_index][3:2] + 1;
                    end 
                    if(valid_bit[cache_index][2] && used_rank[cache_index][5:4] < used_rank[cache_index][7:6]) begin
                        used_rank[cache_index][5:4] <= used_rank[cache_index][5:4] + 1;
                    end
                end
            end else if(w_curr_state == w_write_back_state) begin
                if(cache_clock == 2'b00) begin                      // get data from cache(Dirty)
                    cache_write_data_buf <= cache_rdata_i;
                    cache_clock <= 2'b01;
                end else if(cache_clock == 2'b01) begin             // read and write data to/from memory
                    if(axi_read_handshake_r0 && !axi_read_last_r0) begin
                        cache_read_data_buf[63:0] <= axi_read_data_i;
                    end else if(axi_read_handshake_r0 && axi_read_last_r0) begin
                        cache_read_data_buf[127:64] <= axi_read_data_i;
                        axi_read_finish <= 1'b1;
                    end
                    if(axi_write_resp_i) begin
                        axi_write_finish <= 1'b1;
                    end
                    if((axi_read_handshake_r0 && axi_read_last_r0 && axi_write_resp_i) ||
                        (axi_read_handshake_r0 && axi_read_last_r0 && axi_write_finish) ||
                        (axi_read_finish && axi_write_resp_i)) begin
                            cache_clock <= 2'b10;
                            axi_read_finish <= 1'b0;
                            axi_write_finish <= 1'b0;
                            cache_write_data_buf <= 128'b0;
                    end
                end else if(cache_clock == 2'b10) begin
                    cache_clock <= 2'b00;
                    cache_read_data_buf <= 128'b0;
                    used_rank[cache_index][1:0] <= used_rank[cache_index][1:0] + 1;
                    used_rank[cache_index][3:2] <= used_rank[cache_index][3:2] + 1;
                    used_rank[cache_index][5:4] <= used_rank[cache_index][5:4] + 1;
                    used_rank[cache_index][7:6] <= used_rank[cache_index][7:6] + 1;
                    case(2'b11)
                        used_rank[cache_index][1:0]: begin
                            tag[cache_index][21:0] <= cache_tag;
                            dirty_bit[cache_index][0] <= 1'b1;
                        end
                        used_rank[cache_index][3:2]: begin
                            tag[cache_index][43:22] <= cache_tag;
                            dirty_bit[cache_index][1] <= 1'b1;
                        end
                        used_rank[cache_index][5:4]: begin
                            tag[cache_index][65:44] <= cache_tag;
                            dirty_bit[cache_index][2] <= 1'b1;
                        end
                        default: begin
                            tag[cache_index][87:66] <= cache_tag;
                            dirty_bit[cache_index][3] <= 1'b1;
                        end
                    endcase
                end
            end else if(w_curr_state == w_allocate_state) begin
                if(cache_clock == 2'b01) begin
                    cache_clock <= 2'b00;
                end
                if(axi_read_handshake_r0 && axi_read_last_r0) begin
                    cache_clock <= 2'b01;
                    case(valid_bit[cache_index])
                        4'b0000: begin
                            valid_bit[cache_index] <= 4'b0001;
                            used_rank[cache_index][1:0] <= 2'b00; 
                            tag[cache_index][21:0] <= cache_tag;
                            dirty_bit[cache_index][0] <= 1'b1;
                        end
                        4'b0001: begin
                            valid_bit[cache_index] <= 4'b0011;
                            used_rank[cache_index][3:2] <= 2'b00;
                            used_rank[cache_index][1:0] <= used_rank[cache_index][1:0] + 1;
                            tag[cache_index][43:22] <= cache_tag;
                            dirty_bit[cache_index][1] <= 1'b1;
                        end
                        4'b0011: begin
                            valid_bit[cache_index] <= 4'b0111;
                            used_rank[cache_index][5:4] <= 2'b00;
                            used_rank[cache_index][1:0] <= used_rank[cache_index][1:0] + 1;
                            used_rank[cache_index][3:2] <= used_rank[cache_index][3:2] + 1;
                            tag[cache_index][65:44] <= cache_tag;
                            dirty_bit[cache_index][2] <= 1'b1;
                        end
                        4'b0111: begin
                            valid_bit[cache_index] <= 4'b1111;
                            used_rank[cache_index][7:6] <= 2'b00;
                            used_rank[cache_index][1:0] <= used_rank[cache_index][1:0] + 1;
                            used_rank[cache_index][3:2] <= used_rank[cache_index][3:2] + 1;
                            used_rank[cache_index][5:4] <= used_rank[cache_index][5:4] + 1;
                            tag[cache_index][87:66] <= cache_tag;
                            dirty_bit[cache_index][3] <= 1'b1;
                        end
                        
                        4'b1111: begin
                            used_rank[cache_index][1:0] <= used_rank[cache_index][1:0] + 1;
                            used_rank[cache_index][3:2] <= used_rank[cache_index][3:2] + 1;
                            used_rank[cache_index][5:4] <= used_rank[cache_index][5:4] + 1;
                            used_rank[cache_index][7:6] <= used_rank[cache_index][7:6] + 1;
                            case(2'b11)
                                used_rank[cache_index][1:0]: begin
                                    tag[cache_index][21:0] <= cache_tag;
                                    dirty_bit[cache_index][0] <= 1'b1;
                                end
                                used_rank[cache_index][3:2]: begin
                                    tag[cache_index][43:22] <= cache_tag;
                                    dirty_bit[cache_index][1] <= 1'b1;
                                end
                                used_rank[cache_index][5:4]: begin
                                    tag[cache_index][65:44] <= cache_tag;
                                    dirty_bit[cache_index][2] <= 1'b1;
                                end
                                default: begin
                                    tag[cache_index][87:66] <= cache_tag;
                                    dirty_bit[cache_index][3] <= 1'b1;
                                end
                            endcase
                        end
                        default: begin
                            valid_bit[cache_index] <= valid_bit[cache_index];
                            used_rank[cache_index] <= used_rank[cache_index];
                            tag[cache_index] <= tag[cache_index];
                            dirty_bit[cache_index] <= dirty_bit[cache_index];
                        end
                    endcase
                end
            end

        end
    end
    
    //---------------- FLUSH MACHINE -----------------// 
    
    assign flush_index = cnt[5:0];

    always @(posedge clk) begin
        if(!rstn) begin
            flush_curr_state <= flush_idle_state;
        end else begin
            flush_curr_state <= flush_next_state;
        end
    end

    always @(*) begin
        case(flush_curr_state)
            flush_idle_state: begin
                if(cache_flush_valid_i) begin
                    flush_next_state = flush_isdirty_state;
                end else begin
                    flush_next_state = flush_idle_state;
                end
            end
            flush_isdirty_state: begin
                if(cnt[7:6] == 2'b00) begin
                    if(dirty_bit[flush_index][0]) begin
                        flush_next_state = flush_read_state;
                    end else begin
                        flush_next_state = flush_isdirty_state;
                    end
                end else if(cnt[7:6] == 2'b01) begin
                    if(dirty_bit[flush_index][1]) begin
                        flush_next_state = flush_read_state;
                    end else begin
                        flush_next_state = flush_isdirty_state;
                    end
                end else if(cnt[7:6] == 2'b10) begin
                    if(dirty_bit[flush_index][2]) begin
                        flush_next_state = flush_read_state;
                    end else begin
                        flush_next_state = flush_isdirty_state;
                    end
                end else begin
                    if(dirty_bit[flush_index][3]) begin
                        flush_next_state = flush_read_state;
                    end else begin
                        if(cnt != 8'hff) begin
                            flush_next_state = flush_isdirty_state;
                        end else begin
                            flush_next_state = flush_idle_state;
                        end
                    end
                end
            end
            flush_read_state: begin
                flush_next_state = flush_write_state;
            end
            flush_write_state: begin
                if(axi_write_resp_i) begin
                    if(cnt != 8'hff) begin
                        flush_next_state = flush_isdirty_state;
                    end else begin
                        flush_next_state = flush_idle_state;
                    end
                end else begin
                    flush_next_state = flush_write_state;
                end
            end
            default: begin
                flush_next_state = flush_idle_state;
            end
        endcase
    end

    always @(posedge clk) begin
        if(!rstn) begin
            cnt <= 8'b0;
        end else begin
            if(flush_curr_state == flush_idle_state) begin
                cnt <= 8'b0;
            end else if(flush_curr_state == flush_isdirty_state) begin
                if(cnt[7:6] == 2'b00) begin
                    if(!dirty_bit[flush_index][0]) begin
                        cnt <= cnt + 1;
                    end 
                end else if(cnt[7:6] == 2'b01) begin
                    if(!dirty_bit[flush_index][1]) begin
                        cnt <= cnt + 1;
                    end 
                end else if(cnt[7:6] == 2'b10) begin
                    if(!dirty_bit[flush_index][2]) begin
                        cnt <= cnt + 1;
                    end
                end else if(cnt[7:6] == 2'b11) begin
                    if(!dirty_bit[flush_index][3]) begin
                        cnt <= cnt + 1;
                    end
                end
            end else if(flush_curr_state == flush_write_state) begin
                if(axi_write_resp_i) begin
                    cnt <= cnt + 1;
                end
            end
        end
    end
    assign cache_flush_ready_o = (flush_curr_state != flush_idle_state && flush_next_state == flush_idle_state);

    //---------------- READ MACHINE -----------------// 
    always @(posedge clk) begin
        if(!rstn) begin
            r_curr_state <= r_idle_state;
        end else begin
            r_curr_state <= r_next_state;
        end
    end

    always @(*) begin
        case (r_curr_state)
            r_idle_state: begin
                if(read_valid_i) begin
                    r_next_state = r_compare_tag_state;
                end else begin
                    r_next_state = r_idle_state;
                end
                
            end
            r_compare_tag_state: begin
                if(cache_hit) begin
                    if(read_valid_i && read_ready_o) begin
                        r_next_state = r_idle_state;
                    end else begin
                        r_next_state = r_compare_tag_state;
                    end
                end else begin
                    case (valid_bit[cache_index])
                        4'b0000, 4'b0001, 4'b0011, 4'b0111: begin
                            r_next_state = r_allocate_state;
                        end
                        4'b1111: begin
                            if(used_rank[cache_index][1:0] == 2'b11) begin
                                if(dirty_bit[cache_index][0] == 1'b1) begin
                                    r_next_state = r_write_back_state;
                                end else begin
                                    r_next_state = r_allocate_state;
                                end
                            end else if(used_rank[cache_index][3:2] == 2'b11) begin
                                if(dirty_bit[cache_index][1] == 1'b1) begin
                                    r_next_state = r_write_back_state;
                                end else begin
                                    r_next_state = r_allocate_state;
                                end
                            end else if(used_rank[cache_index][5:4] == 2'b11) begin
                                if(dirty_bit[cache_index][2] == 1'b1) begin
                                    r_next_state = r_write_back_state;
                                end else begin
                                    r_next_state = r_allocate_state;
                                end
                            end else begin
                                if(dirty_bit[cache_index][3] == 1'b1) begin
                                    r_next_state = r_write_back_state;
                                end else begin
                                    r_next_state = r_allocate_state;
                                end
                            end
                        end 
                        default: begin
                            r_next_state = r_compare_tag_state;
                        end
                    endcase
                end
            end
            r_allocate_state: begin
                if(read_valid_i && read_ready_o) begin
                    r_next_state = r_idle_state;
                end else begin
                    r_next_state = r_allocate_state;
                end
            end
            r_write_back_state: begin
                if(read_valid_i && read_ready_o) begin
                    r_next_state = r_idle_state;
                end else begin
                    r_next_state = r_write_back_state;
                end
            end
            default: begin
                r_next_state = r_idle_state;
            end
        endcase
    end

    always @(posedge clk) begin
        if(!rstn) begin
            axi_read_handshake_r <= 1'b0;
            axi_read_last_r <= 1'b0;
            axi_read_data_r <= 64'b0;
        end else begin
            if(r_curr_state == r_idle_state) begin
                axi_read_handshake_r <= 1'b0;
                axi_read_last_r <= 1'b0;
                axi_read_data_r <= 64'b0;
            end else if(r_curr_state == r_allocate_state) begin
                axi_read_handshake_r <= axi_read_handshake;         // 同步来自总线的数据
                axi_read_last_r <= axi_read_last_i;                 // 同步来自总线的数据
                
                if(cache_clock == 2'b01) begin
                    axi_read_data_r <= 64'b0;
                end
                if((axi_read_handshake_r && !axi_read_last_r && !cache_offset[3]) || (axi_read_handshake_r && axi_read_last_r && cache_offset[3])) begin
                    axi_read_data_r <= axi_read_data_i;
                end 
                
            end else if(r_curr_state == r_write_back_state) begin
                axi_read_handshake_r <= axi_read_handshake;         
                axi_read_last_r <= axi_read_last_i;
                
            end
        end
    end
    assign read_data_o =    (r_curr_state == r_compare_tag_state && cache_clock == 2'b01 && cache_offset[3]) ?  cache_rdata_i[127:64] :
                            (r_curr_state == r_compare_tag_state && cache_clock == 2'b01  && !cache_offset[3]) ? cache_rdata_i [63:0] :                        
                            (r_curr_state == r_allocate_state && cache_clock == 2'b01) ? axi_read_data_r :
                            (r_curr_state == r_write_back_state && cache_clock == 2'b10 && cache_offset[3]) ? cache_read_data_buf[127:64] :
                            (r_curr_state == r_write_back_state && cache_clock == 2'b10 && !cache_offset[3]) ? cache_read_data_buf[63:0] :
                            64'b0;
    assign axi_read_valid_o =   (r_curr_state == r_compare_tag_state && !cache_hit && r_next_state == r_allocate_state) ? 1'b1 :
                                (r_curr_state == r_allocate_state && cache_clock == 2'b00) ? 1'b1 : 
                                (r_curr_state == r_write_back_state && (cache_clock == 2'b00 || cache_clock == 2'b01) && !axi_read_finish) ? 1'b1:
                                (w_curr_state == w_compare_tag_state && !cache_hit) ? 1'b1 :
                                (w_curr_state == w_write_back_state && (cache_clock == 2'b00 || cache_clock == 2'b01) && !axi_read_finish) ? 1'b1 :
                                (w_curr_state == w_allocate_state && cache_clock == 2'b00) ? 1'b1 :
                                1'b0;
    assign axi_read_addr_o =    (r_curr_state == r_compare_tag_state && !cache_hit && r_next_state == r_allocate_state) ? {read_addr_i[31:4], 4'b0} :
                                (r_curr_state == r_allocate_state && cache_clock == 2'b00) ? {read_addr_i[31:4], 4'b0} :
                                (r_curr_state == r_write_back_state && (cache_clock == 2'b00 || cache_clock == 2'b01)) ? {read_addr_i[31:4], 4'b0} :
                                (w_curr_state == w_compare_tag_state && !cache_hit) ? {write_addr_i[31:4],4'b0} :
                                (w_curr_state == w_write_back_state && (cache_clock == 2'b00 || cache_clock == 2'b01)) ? {write_addr_i[31:4],4'b0} :
                                (w_curr_state == w_allocate_state && cache_clock == 2'b00) ? {write_addr_i[31:4], 4'b0} :
                                32'b0;
    
    assign read_ready_o =   (r_curr_state == r_compare_tag_state && cache_clock == 2'b01) ? 1'b1 : 
                            (r_curr_state == r_allocate_state && cache_clock == 2'b01) ? 1'b1 :
                            (r_curr_state == r_write_back_state && cache_clock == 2'b10) ? 1'b1 :
                            1'b0;
    
    //---------------- WRITE MACHINE -----------------//
    
    

    always @(posedge clk) begin
        if(!rstn) begin
            w_curr_state <= w_idle_state;
        end else begin
            w_curr_state <= w_next_state;
        end
    end

    always @(*) begin
        case(w_curr_state)
            w_idle_state: begin
                if(write_valid_i) begin
                    w_next_state = w_compare_tag_state;
                end else begin
                    w_next_state = w_idle_state;
                end
            end
            w_compare_tag_state: begin
                if(cache_hit) begin
                    if(write_ready_o && write_valid_i) begin
                        w_next_state = w_idle_state;
                    end else begin
                        w_next_state = w_compare_tag_state;
                    end
                end else begin
                    case(valid_bit[cache_index])
                        4'b0000, 4'b0001, 4'b0011, 4'b0111: begin
                            w_next_state = w_allocate_state;
                        end
                        4'b1111: begin
                            if(used_rank[cache_index][1:0] == 2'b11) begin
                                if(dirty_bit[cache_index][0] == 1'b1) begin
                                    w_next_state = w_write_back_state;
                                end else begin
                                    w_next_state = w_allocate_state;
                                end
                            end else if(used_rank[cache_index][3:2] == 2'b11) begin
                                if(dirty_bit[cache_index][1] == 1'b1) begin
                                    w_next_state = w_write_back_state;
                                end else begin
                                    w_next_state = w_allocate_state;
                                end
                            end else if(used_rank[cache_index][5:4] == 2'b11) begin
                                if(dirty_bit[cache_index][2] == 1'b1) begin
                                    w_next_state = w_write_back_state;
                                end else begin
                                    w_next_state = w_allocate_state;
                                end
                            end else begin
                                if(dirty_bit[cache_index][3] == 1'b1) begin
                                    w_next_state = w_write_back_state;
                                end else begin
                                    w_next_state = w_allocate_state;
                                end
                            end
                        end 
                        default: begin
                            w_next_state = w_compare_tag_state;
                        end
                    endcase
                end
            end
            w_write_back_state: begin
                if(write_ready_o && write_valid_i) begin
                    w_next_state = w_idle_state;
                end else begin
                    w_next_state = w_write_back_state;
                end
            end
            w_allocate_state: begin
                if(write_ready_o && write_valid_i) begin
                    w_next_state = w_idle_state;
                end else begin
                    w_next_state = w_allocate_state;
                end
            end
            default: begin
                w_next_state = w_idle_state;
            end
        endcase
    end

    always @(posedge clk) begin
        if(!rstn) begin
            axi_read_handshake_r0 <= 1'b0;
            axi_read_last_r0 <= 1'b0;
        end else begin
            if(w_curr_state == w_idle_state) begin
                axi_read_handshake_r0 <= 1'b0;
                axi_read_last_r0 <= 1'b0;
            end else if(w_curr_state == w_write_back_state) begin
                axi_read_handshake_r0 <= axi_read_handshake;         // 同步来自总线的数据
                axi_read_last_r0 <= axi_read_last_i;  
                
            end else if(w_curr_state == w_allocate_state)begin
                axi_read_handshake_r0 <= axi_read_handshake;         // 同步来自总线的数据
                axi_read_last_r0 <= axi_read_last_i; 

            end
        end
    end
    
    always @(*) begin
        if(w_curr_state == w_write_back_state && cache_clock == 2'b10) begin
            if(lsu_op_i == `ysyx_040654_LSU_SD) begin
                write_data = write_data_i;
            end else if(lsu_op_i == `ysyx_040654_LSU_SW) begin
                if(!write_addr_i[3]) begin
                    if(!write_addr_i[2]) begin
                        write_data = {cache_read_data_buf[63:32], write_data_i[31:0]};
                    end else begin
                        write_data = {write_data_i[63:32], cache_read_data_buf[31:0]};
                    end
                end else begin
                    if(!write_addr_i[2]) begin
                        write_data = {cache_read_data_buf[127:96], write_data_i[31:0]};
                    end else begin
                        write_data = {write_data_i[63:32], cache_read_data_buf[95:64]};
                    end
                end
                
            end else if(lsu_op_i == `ysyx_040654_LSU_SH) begin
                if(!write_addr_i[3]) begin
                    case(write_addr_i[2:1]) 
                        2'b00: begin
                            write_data = {cache_read_data_buf[63:16], write_data_i[15:0]};
                        end
                        2'b01: begin
                            write_data = {cache_read_data_buf[63:32], write_data_i[31:16], cache_read_data_buf[15:0]};
                        end
                        2'b10: begin
                            write_data = {cache_read_data_buf[63:48], write_data_i[47:32], cache_read_data_buf[31:0]};
                        end
                        default: begin
                            write_data = {write_data_i[63:48], cache_read_data_buf[47:0]};
                        end
                    endcase
                end else begin
                    case(write_addr_i[2:1]) 
                        2'b00: begin
                            write_data = {cache_read_data_buf[127:80], write_data_i[15:0]};
                        end
                        2'b01: begin
                            write_data = {cache_read_data_buf[127:96], write_data_i[31:16], cache_read_data_buf[79:64]};
                        end
                        2'b10: begin
                            write_data = {cache_read_data_buf[127:112], write_data_i[47:32], cache_read_data_buf[95:64]};
                        end
                        default: begin
                            write_data = {write_data_i[63:48], cache_read_data_buf[111:64]};
                        end
                    endcase
                end
                
            end else if(lsu_op_i == `ysyx_040654_LSU_SB) begin
                if(!write_addr_i[3]) begin
                    case(write_addr_i[2:0])
                        3'b000: begin
                            write_data = {cache_read_data_buf[63:8], write_data_i[7:0]};
                        end
                        3'b001: begin
                            write_data = {cache_read_data_buf[63:16], write_data_i[15:8], cache_read_data_buf[7:0]};
                        end
                        3'b010: begin
                            write_data = {cache_read_data_buf[63:24], write_data_i[23:16], cache_read_data_buf[15:0]};
                        end
                        3'b011: begin
                            write_data = {cache_read_data_buf[63:32], write_data_i[31:24], cache_read_data_buf[23:0]};
                        end
                        3'b100: begin
                            write_data = {cache_read_data_buf[63:40], write_data_i[39:32], cache_read_data_buf[31:0]};
                        end
                        3'b101: begin
                            write_data = {cache_read_data_buf[63:48], write_data_i[47:40], cache_read_data_buf[39:0]};
                        end
                        3'b110: begin
                            write_data = {cache_read_data_buf[63:56], write_data_i[55:48], cache_read_data_buf[47:0]};
                        end
                        default: begin
                            write_data = {write_data_i[63:56], cache_read_data_buf[55:0]};
                        end
                    endcase
                end else begin
                    case(write_addr_i[2:0])
                        3'b000: begin
                            write_data = {cache_read_data_buf[127:72], write_data_i[7:0]};
                        end
                        3'b001: begin
                            write_data = {cache_read_data_buf[127:80], write_data_i[15:8], cache_read_data_buf[71:64]};
                        end
                        3'b010: begin
                            write_data = {cache_read_data_buf[127:88], write_data_i[23:16], cache_read_data_buf[79:64]};
                        end
                        3'b011: begin
                            write_data = {cache_read_data_buf[127:96], write_data_i[31:24], cache_read_data_buf[87:64]};
                        end
                        3'b100: begin
                            write_data = {cache_read_data_buf[127:104], write_data_i[39:32], cache_read_data_buf[95:64]};
                        end
                        3'b101: begin
                            write_data = {cache_read_data_buf[127:112], write_data_i[47:40], cache_read_data_buf[103:64]};
                        end
                        3'b110: begin
                            write_data = {cache_read_data_buf[127:120], write_data_i[55:48], cache_read_data_buf[111:64]};
                        end
                        default: begin
                            write_data = {write_data_i[63:56], cache_read_data_buf[119:64]};
                        end
                    endcase
                end
            end else begin
                write_data = 64'b0;
            end
        end else if(w_curr_state == w_allocate_state && axi_read_handshake_r0) begin
            if(lsu_op_i == `ysyx_040654_LSU_SD) begin
                write_data = write_data_i;
            end else if(lsu_op_i == `ysyx_040654_LSU_SW) begin
                if(!write_addr_i[2]) begin
                    write_data = {axi_read_data_i[63:32], write_data_i[31:0]};
                end else begin
                    write_data = {write_data_i[63:32], axi_read_data_i[31:0]};
                end

            end else if(lsu_op_i == `ysyx_040654_LSU_SH) begin
                case(write_addr_i[2:1]) 
                    2'b00: begin
                        write_data = {axi_read_data_i[63:16], write_data_i[15:0]};
                    end
                    2'b01: begin
                        write_data = {axi_read_data_i[63:32], write_data_i[31:16], axi_read_data_i[15:0]};
                    end
                    2'b10: begin
                        write_data = {axi_read_data_i[63:48], write_data_i[47:32], axi_read_data_i[31:0]};
                    end
                    default: begin
                        write_data = {write_data_i[63:48], axi_read_data_i[47:0]};
                    end
                endcase
            end else if(lsu_op_i == `ysyx_040654_LSU_SB) begin
                case(write_addr_i[2:0])
                        3'b000: begin
                            write_data = {axi_read_data_i[63:8], write_data_i[7:0]};
                        end
                        3'b001: begin
                            write_data = {axi_read_data_i[63:16], write_data_i[15:8], axi_read_data_i[7:0]};
                        end
                        3'b010: begin
                            write_data = {axi_read_data_i[63:24], write_data_i[23:16], axi_read_data_i[15:0]};
                        end
                        3'b011: begin
                            write_data = {axi_read_data_i[63:32], write_data_i[31:24], axi_read_data_i[23:0]};
                        end
                        3'b100: begin
                            write_data = {axi_read_data_i[63:40], write_data_i[39:32], axi_read_data_i[31:0]};
                        end
                        3'b101: begin
                            write_data = {axi_read_data_i[63:48], write_data_i[47:40], axi_read_data_i[39:0]};
                        end
                        3'b110: begin
                            write_data = {axi_read_data_i[63:56], write_data_i[55:48], axi_read_data_i[47:0]};
                        end
                        default: begin
                            write_data = {write_data_i[63:56], axi_read_data_i[55:0]};
                        end
                    endcase
            end else begin
                write_data = 64'b0;
            end
        end else begin
            write_data = 64'b0;
        end 
    end

    assign axi_write_valid_o =  (w_curr_state == w_write_back_state && (cache_clock == 2'b01) && !axi_write_finish) ? 1'b1 :
                                (r_curr_state == r_write_back_state && (cache_clock == 2'b01) && !axi_write_finish) ? 1'b1 : 
                                (flush_curr_state == flush_write_state) ? 1'b1 :
                                1'b0;
    assign axi_write_addr_o =   (r_curr_state == r_write_back_state && used_rank[cache_index][1:0] == 2'b11 && (cache_clock == 2'b01)) ? {tag[cache_index][21:0], cache_index, 4'b0} :
                                (r_curr_state == r_write_back_state && used_rank[cache_index][3:2] == 2'b11 && (cache_clock == 2'b01)) ? {tag[cache_index][43:22], cache_index, 4'b0} :
                                (r_curr_state == r_write_back_state && used_rank[cache_index][5:4] == 2'b11 && (cache_clock == 2'b01)) ? {tag[cache_index][65:44], cache_index, 4'b0} :
                                (r_curr_state == r_write_back_state && used_rank[cache_index][7:6] == 2'b11 && (cache_clock == 2'b01)) ? {tag[cache_index][87:66], cache_index, 4'b0} :
                                (w_curr_state == w_write_back_state && used_rank[cache_index][1:0] == 2'b11 && (cache_clock == 2'b01)) ? {tag[cache_index][21:0], cache_index, 4'b0} :
                                (w_curr_state == w_write_back_state && used_rank[cache_index][3:2] == 2'b11 && (cache_clock == 2'b01)) ? {tag[cache_index][43:22], cache_index, 4'b0} :
                                (w_curr_state == w_write_back_state && used_rank[cache_index][5:4] == 2'b11 && (cache_clock == 2'b01)) ? {tag[cache_index][65:44], cache_index, 4'b0} :
                                (w_curr_state == w_write_back_state && used_rank[cache_index][7:6] == 2'b11 && (cache_clock == 2'b01)) ? {tag[cache_index][87:66], cache_index, 4'b0} :
                                (flush_curr_state == flush_write_state && cnt[7:6] == 2'b00) ? {tag[flush_index][21:0], flush_index, 4'b0} :
                                (flush_curr_state == flush_write_state && cnt[7:6] == 2'b01) ? {tag[flush_index][43:22], flush_index, 4'b0} :
                                (flush_curr_state == flush_write_state && cnt[7:6] == 2'b10) ? {tag[flush_index][65:44], flush_index, 4'b0} :
                                (flush_curr_state == flush_write_state && cnt[7:6] == 2'b11) ? {tag[flush_index][87:66], flush_index, 4'b0} :
                                32'b0;
    assign axi_write_data_o =   (r_curr_state == r_write_back_state && cache_clock == 2'b01 && !axi_write_last_i) ? cache_write_data_buf[63:0] :
                                (r_curr_state == r_write_back_state && cache_clock == 2'b01 && axi_write_last_i) ? cache_write_data_buf[127:64] :
                                (w_curr_state == w_write_back_state && cache_clock == 2'b01 && !axi_write_last_i) ? cache_write_data_buf[63:0] :
                                (w_curr_state == w_write_back_state && cache_clock == 2'b01 && axi_write_last_i) ? cache_write_data_buf[127:64] :
                                (flush_curr_state == flush_write_state && !axi_write_last_i) ? cache_write_data_buf[63:0] :
                                (flush_curr_state == flush_write_state && axi_write_last_i) ? cache_write_data_buf[127:64] :
                                64'b0;
    assign axi_write_mask_o =   (w_curr_state == w_write_back_state && (cache_clock == 2'b01)) ? {8{1'b1}} : 
                                (r_curr_state == r_write_back_state && (cache_clock == 2'b01)) ? {8{1'b1}} :
                                (flush_curr_state == flush_write_state) ? {8{1'b1}} :
                                8'b0;
    

    assign write_ready_o =  (w_curr_state == w_compare_tag_state && cache_hit) ? 1'b1 : 
                            (w_curr_state == w_write_back_state && cache_clock == 2'b10) ? 1'b1 :
                            (w_curr_state == w_allocate_state && cache_clock == 2'b01) ? 1'b1 :
                            1'b0;



    assign cache_cen_o =    (r_curr_state == r_compare_tag_state && cache_hit && cache_clock == 2'b00) ? 1'b0 : 
                            (r_curr_state == r_allocate_state && axi_read_handshake_r) ? 1'b0 :
                            (r_curr_state == r_compare_tag_state && !cache_hit && valid_bit[cache_index] == 4'b1111 && used_rank[cache_index][1:0] == 2'b11 && dirty_bit[cache_index][0]) ? 1'b0 :
                            (r_curr_state == r_compare_tag_state && !cache_hit && valid_bit[cache_index] == 4'b1111 && used_rank[cache_index][3:2] == 2'b11 && dirty_bit[cache_index][1]) ? 1'b0 :
                            (r_curr_state == r_compare_tag_state && !cache_hit && valid_bit[cache_index] == 4'b1111 && used_rank[cache_index][5:4] == 2'b11 && dirty_bit[cache_index][2]) ? 1'b0 :
                            (r_curr_state == r_compare_tag_state && !cache_hit && valid_bit[cache_index] == 4'b1111 && used_rank[cache_index][7:6] == 2'b11 && dirty_bit[cache_index][3]) ? 1'b0 :
                            (r_curr_state == r_write_back_state && cache_clock == 2'b10) ? 1'b0 :
                            (w_curr_state == w_compare_tag_state && cache_hit) ? 1'b0 : 
                            (w_curr_state == w_compare_tag_state && !cache_hit && valid_bit[cache_index] == 4'b1111 && used_rank[cache_index][1:0] == 2'b11 && dirty_bit[cache_index][0]) ? 1'b0 :
                            (w_curr_state == w_compare_tag_state && !cache_hit && valid_bit[cache_index] == 4'b1111 && used_rank[cache_index][3:2] == 2'b11 && dirty_bit[cache_index][1]) ? 1'b0 :
                            (w_curr_state == w_compare_tag_state && !cache_hit && valid_bit[cache_index] == 4'b1111 && used_rank[cache_index][5:4] == 2'b11 && dirty_bit[cache_index][2]) ? 1'b0 :
                            (w_curr_state == w_compare_tag_state && !cache_hit && valid_bit[cache_index] == 4'b1111 && used_rank[cache_index][7:6] == 2'b11 && dirty_bit[cache_index][3]) ? 1'b0 :
                            (w_curr_state == w_write_back_state && cache_clock == 2'b10) ? 1'b0 : 
                            (w_curr_state == w_allocate_state && axi_read_handshake_r0) ? 1'b0 : 
                            (flush_curr_state == flush_isdirty_state && cnt[7:6] == 2'b00 && dirty_bit[flush_index][0]) ? 1'b0 :
                            (flush_curr_state == flush_isdirty_state && cnt[7:6] == 2'b01 && dirty_bit[flush_index][1]) ? 1'b0 :
                            (flush_curr_state == flush_isdirty_state && cnt[7:6] == 2'b10 && dirty_bit[flush_index][2]) ? 1'b0 :
                            (flush_curr_state == flush_isdirty_state && cnt[7:6] == 2'b11 && dirty_bit[flush_index][3]) ? 1'b0 :
                            1'b1;
    assign cache_wen_o =    (r_curr_state == r_allocate_state && axi_read_handshake_r) ? 1'b0 :
                            (r_curr_state == r_write_back_state && cache_clock == 2'b10) ? 1'b0 :
                            (w_curr_state == w_compare_tag_state && cache_hit) ? 1'b0 : 
                            (w_curr_state == w_write_back_state && cache_clock == 2'b10) ? 1'b0 :
                            (w_curr_state == w_allocate_state && axi_read_handshake_r0) ? 1'b0 :
                            1'b1;
    assign cache_bwen_o =   (r_curr_state == r_allocate_state && axi_read_handshake_r && !axi_read_last_r) ? {{64{1'b1}}, 64'b0} :
                            (r_curr_state == r_allocate_state && axi_read_handshake_r && axi_read_last_r) ? {64'b0, {64{1'b1}}} :
                            (r_curr_state == r_write_back_state && cache_clock == 2'b10) ? {128{1'b0}} :
                            (w_curr_state == w_compare_tag_state && cache_hit && !cache_offset[3]) ? {{64{1'b1}}, ~{8{write_mask_i[7]}}, ~{8{write_mask_i[6]}}, ~{8{write_mask_i[5]}}, ~{8{write_mask_i[4]}},
                                                                                                ~{8{write_mask_i[3]}}, ~{8{write_mask_i[2]}}, ~{8{write_mask_i[1]}}, ~{8{write_mask_i[0]}}} :
                            (w_curr_state == w_compare_tag_state && cache_hit && cache_offset[3]) ? {~{8{write_mask_i[7]}}, ~{8{write_mask_i[6]}}, ~{8{write_mask_i[5]}}, ~{8{write_mask_i[4]}},
                                                                                                ~{8{write_mask_i[3]}}, ~{8{write_mask_i[2]}}, ~{8{write_mask_i[1]}}, ~{8{write_mask_i[0]}}, {64{1'b1}}} :                
                            (w_curr_state == w_write_back_state && cache_clock == 2'b10) ? {128{1'b0}} :
                            (w_curr_state == w_allocate_state && axi_read_handshake_r0 && !axi_read_last_r0) ? {{64{1'b1}}, 64'b0} :
                            (w_curr_state == w_allocate_state && axi_read_handshake_r0 && axi_read_last_r0) ? {64'b0, {64{1'b1}}} :
                            {128{1'b1}};
    assign cache_addr_o =   (r_curr_state == r_compare_tag_state && cache_hit) ?  cache_index:
                            (r_curr_state == r_allocate_state && axi_read_handshake_r) ? cache_index:
                            (r_curr_state == r_compare_tag_state && !cache_hit && valid_bit[cache_index] == 4'b1111 && used_rank[cache_index][1:0] == 2'b11 && dirty_bit[cache_index][0]) ? cache_index :
                            (r_curr_state == r_compare_tag_state && !cache_hit && valid_bit[cache_index] == 4'b1111 && used_rank[cache_index][3:2] == 2'b11 && dirty_bit[cache_index][1]) ? cache_index :
                            (r_curr_state == r_compare_tag_state && !cache_hit && valid_bit[cache_index] == 4'b1111 && used_rank[cache_index][5:4] == 2'b11 && dirty_bit[cache_index][2]) ? cache_index :
                            (r_curr_state == r_compare_tag_state && !cache_hit && valid_bit[cache_index] == 4'b1111 && used_rank[cache_index][7:6] == 2'b11 && dirty_bit[cache_index][3]) ? cache_index :
                            (r_curr_state == r_write_back_state && cache_clock == 2'b10) ? cache_index :
                            (w_curr_state == w_compare_tag_state && cache_hit) ? cache_index :
                            (w_curr_state == w_compare_tag_state && !cache_hit && valid_bit[cache_index] == 4'b1111 && used_rank[cache_index][1:0] == 2'b11 && dirty_bit[cache_index][0]) ? cache_index :
                            (w_curr_state == w_compare_tag_state && !cache_hit && valid_bit[cache_index] == 4'b1111 && used_rank[cache_index][3:2] == 2'b11 && dirty_bit[cache_index][1]) ? cache_index :
                            (w_curr_state == w_compare_tag_state && !cache_hit && valid_bit[cache_index] == 4'b1111 && used_rank[cache_index][5:4] == 2'b11 && dirty_bit[cache_index][2]) ? cache_index :
                            (w_curr_state == w_compare_tag_state && !cache_hit && valid_bit[cache_index] == 4'b1111 && used_rank[cache_index][7:6] == 2'b11 && dirty_bit[cache_index][3]) ? cache_index :
                            (w_curr_state == w_write_back_state && cache_clock == 2'b10) ? cache_index :
                            (w_curr_state == w_allocate_state && axi_read_handshake_r0) ? cache_index :
                            (flush_curr_state == flush_isdirty_state && cnt[7:6] == 2'b00 && dirty_bit[flush_index][0]) ? flush_index :
                            (flush_curr_state == flush_isdirty_state && cnt[7:6] == 2'b01 && dirty_bit[flush_index][1]) ? flush_index :
                            (flush_curr_state == flush_isdirty_state && cnt[7:6] == 2'b10 && dirty_bit[flush_index][2]) ? flush_index :
                            (flush_curr_state == flush_isdirty_state && cnt[7:6] == 2'b11 && dirty_bit[flush_index][3]) ? flush_index :
                            6'b0;
    assign cache_wdata_o =  (r_curr_state == r_allocate_state && axi_read_handshake_r && !axi_read_last_r) ? {{64{1'b0}}, axi_read_data_i} :
                            (r_curr_state == r_allocate_state && axi_read_handshake_r && axi_read_last_r) ? {axi_read_data_i, {64{1'b0}}} :
                            (r_curr_state == r_write_back_state && cache_clock == 2'b10) ? cache_read_data_buf : 
                            (w_curr_state == w_compare_tag_state && cache_hit && !cache_offset[3]) ? {64'b0, write_data_i} :
                            (w_curr_state == w_compare_tag_state && cache_hit && cache_offset[3]) ? {write_data_i, 64'b0} :
                            (w_curr_state == w_write_back_state && cache_clock == 2'b10 && !write_addr_i[3]) ? {cache_read_data_buf[127:64], write_data} :
                            (w_curr_state == w_write_back_state && cache_clock == 2'b10 && write_addr_i[3]) ? {write_data, cache_read_data_buf[63:0]} :
                            (w_curr_state == w_allocate_state && axi_read_handshake_r0 && !axi_read_last_r0 && !write_addr_i[3]) ? {64'b0, write_data} :
                            (w_curr_state == w_allocate_state && axi_read_handshake_r0 && axi_read_last_r0 && !write_addr_i[3]) ? {axi_read_data_i, 64'b0} :
                            (w_curr_state == w_allocate_state && axi_read_handshake_r0 && !axi_read_last_r0 && write_addr_i[3]) ? {64'b0, axi_read_data_i} :
                            (w_curr_state == w_allocate_state && axi_read_handshake_r0 && axi_read_last_r0 && write_addr_i[3]) ? {write_data, 64'b0} :
                            {128{1'b0}};

    assign cache_sel_o =    (r_curr_state == r_compare_tag_state && cache_hit && cache_tag == tag[cache_index][21:0]) ? 4'b0001 :
                            (r_curr_state == r_compare_tag_state && cache_hit && cache_tag == tag[cache_index][43:22]) ? 4'b0010 :
                            (r_curr_state == r_compare_tag_state && cache_hit && cache_tag == tag[cache_index][65:44]) ? 4'b0100 :
                            (r_curr_state == r_compare_tag_state && cache_hit && cache_tag == tag[cache_index][87:66]) ? 4'b1000 :
                            (r_curr_state == r_allocate_state && valid_bit[cache_index] == 4'b0000) ? 4'b0001 :
                            (r_curr_state == r_allocate_state && valid_bit[cache_index] == 4'b0001) ? 4'b0010 :
                            (r_curr_state == r_allocate_state && valid_bit[cache_index] == 4'b0011) ? 4'b0100 :
                            (r_curr_state == r_allocate_state && valid_bit[cache_index] == 4'b0111) ? 4'b1000 :
                            (r_curr_state == r_allocate_state && valid_bit[cache_index] == 4'b1111 && used_rank[cache_index][1:0] == 2'b11) ? 4'b0001 :
                            (r_curr_state == r_allocate_state && valid_bit[cache_index] == 4'b1111 && used_rank[cache_index][3:2] == 2'b11) ? 4'b0010 :
                            (r_curr_state == r_allocate_state && valid_bit[cache_index] == 4'b1111 && used_rank[cache_index][5:4] == 2'b11) ? 4'b0100 :
                            (r_curr_state == r_allocate_state && valid_bit[cache_index] == 4'b1111 && used_rank[cache_index][7:6] == 2'b11) ? 4'b1000 :
                            (r_curr_state == r_compare_tag_state && !cache_hit && valid_bit[cache_index] == 4'b1111 && used_rank[cache_index][1:0] == 2'b11 && dirty_bit[cache_index][0]) ? 4'b0001 :
                            (r_curr_state == r_compare_tag_state && !cache_hit && valid_bit[cache_index] == 4'b1111 && used_rank[cache_index][3:2] == 2'b11 && dirty_bit[cache_index][1]) ? 4'b0010 :
                            (r_curr_state == r_compare_tag_state && !cache_hit && valid_bit[cache_index] == 4'b1111 && used_rank[cache_index][5:4] == 2'b11 && dirty_bit[cache_index][2]) ? 4'b0100 :
                            (r_curr_state == r_compare_tag_state && !cache_hit && valid_bit[cache_index] == 4'b1111 && used_rank[cache_index][7:6] == 2'b11 && dirty_bit[cache_index][3]) ? 4'b1000 :
                            (r_curr_state == r_write_back_state && (cache_clock == 2'b00 || cache_clock == 2'b10) && used_rank[cache_index][1:0] == 2'b11) ? 4'b0001 :
                            (r_curr_state == r_write_back_state && (cache_clock == 2'b00 || cache_clock == 2'b10) && used_rank[cache_index][3:2] == 2'b11) ? 4'b0010 :
                            (r_curr_state == r_write_back_state && (cache_clock == 2'b00 || cache_clock == 2'b10) && used_rank[cache_index][5:4] == 2'b11) ? 4'b0100 :
                            (r_curr_state == r_write_back_state && (cache_clock == 2'b00 || cache_clock == 2'b10) && used_rank[cache_index][7:6] == 2'b11) ? 4'b1000 :
                            (w_curr_state == w_compare_tag_state && cache_hit && cache_tag == tag[cache_index][21:0]) ? 4'b0001 :
                            (w_curr_state == w_compare_tag_state && cache_hit && cache_tag == tag[cache_index][43:22]) ? 4'b0010 :
                            (w_curr_state == w_compare_tag_state && cache_hit && cache_tag == tag[cache_index][65:44]) ? 4'b0100 :
                            (w_curr_state == w_compare_tag_state && cache_hit && cache_tag == tag[cache_index][87:66]) ? 4'b1000 :
                            (w_curr_state == w_compare_tag_state && !cache_hit && valid_bit[cache_index] == 4'b1111 && used_rank[cache_index][1:0] == 2'b11 && dirty_bit[cache_index][0]) ? 4'b0001 :
                            (w_curr_state == w_compare_tag_state && !cache_hit && valid_bit[cache_index] == 4'b1111 && used_rank[cache_index][3:2] == 2'b11 && dirty_bit[cache_index][1]) ? 4'b0010 :
                            (w_curr_state == w_compare_tag_state && !cache_hit && valid_bit[cache_index] == 4'b1111 && used_rank[cache_index][5:4] == 2'b11 && dirty_bit[cache_index][2]) ? 4'b0100 :
                            (w_curr_state == w_compare_tag_state && !cache_hit && valid_bit[cache_index] == 4'b1111 && used_rank[cache_index][7:6] == 2'b11 && dirty_bit[cache_index][3]) ? 4'b1000 :
                            (w_curr_state == w_write_back_state && (cache_clock == 2'b00 || cache_clock == 2'b10) && used_rank[cache_index][1:0] == 2'b11) ? 4'b0001 :
                            (w_curr_state == w_write_back_state && (cache_clock == 2'b00 || cache_clock == 2'b10) && used_rank[cache_index][3:2] == 2'b11) ? 4'b0010 :
                            (w_curr_state == w_write_back_state && (cache_clock == 2'b00 || cache_clock == 2'b10) && used_rank[cache_index][5:4] == 2'b11) ? 4'b0100 :
                            (w_curr_state == w_write_back_state && (cache_clock == 2'b00 || cache_clock == 2'b10) && used_rank[cache_index][7:6] == 2'b11) ? 4'b1000 :
                            (w_curr_state == w_allocate_state && axi_read_handshake_r0 && valid_bit[cache_index] == 4'b0000) ? 4'b0001 :
                            (w_curr_state == w_allocate_state && axi_read_handshake_r0 && valid_bit[cache_index] == 4'b0001) ? 4'b0010 :
                            (w_curr_state == w_allocate_state && axi_read_handshake_r0 && valid_bit[cache_index] == 4'b0011) ? 4'b0100 :
                            (w_curr_state == w_allocate_state && axi_read_handshake_r0 && valid_bit[cache_index] == 4'b0111) ? 4'b1000 :
                            (w_curr_state == w_allocate_state && axi_read_handshake_r0 && valid_bit[cache_index] == 4'b1111 && used_rank[cache_index][1:0] == 2'b11) ? 4'b0001 :
                            (w_curr_state == w_allocate_state && axi_read_handshake_r0 && valid_bit[cache_index] == 4'b1111 && used_rank[cache_index][3:2] == 2'b11) ? 4'b0010 :
                            (w_curr_state == w_allocate_state && axi_read_handshake_r0 && valid_bit[cache_index] == 4'b1111 && used_rank[cache_index][5:4] == 2'b11) ? 4'b0100 :
                            (w_curr_state == w_allocate_state && axi_read_handshake_r0 && valid_bit[cache_index] == 4'b1111 && used_rank[cache_index][7:6] == 2'b11) ? 4'b1000 :
                            ((flush_curr_state == flush_isdirty_state  || flush_curr_state == flush_read_state || flush_curr_state == flush_write_state) && cnt[7:6] == 2'b00 && dirty_bit[flush_index][0]) ? 4'b0001 :
                            ((flush_curr_state == flush_isdirty_state  || flush_curr_state == flush_read_state || flush_curr_state == flush_write_state) && cnt[7:6] == 2'b01 && dirty_bit[flush_index][1]) ? 4'b0010 :
                            ((flush_curr_state == flush_isdirty_state  || flush_curr_state == flush_read_state || flush_curr_state == flush_write_state) && cnt[7:6] == 2'b10 && dirty_bit[flush_index][2]) ? 4'b0100 :
                            ((flush_curr_state == flush_isdirty_state  || flush_curr_state == flush_read_state || flush_curr_state == flush_write_state) && cnt[7:6] == 2'b11 && dirty_bit[flush_index][3]) ? 4'b1000 :
                            4'b0000;
endmodule


module ysyx_040654_clint #(
    parameter AXI_DATA_WIDTH    = 64,
    parameter AXI_ADDR_WIDTH    = 32,
    parameter AXI_ID_WIDTH      = 4,
    parameter AXI_STRB_WIDTH    = AXI_DATA_WIDTH/8
)(
    input                               aclk,
    input                               resetn,

    // write addr channel 
    input                               axi_aw_valid_i,
    input [AXI_ADDR_WIDTH-1:0]          axi_aw_addr_i,
    input [AXI_ID_WIDTH-1:0]            axi_aw_id_i,
    input [7:0]                         axi_aw_len_i,
    input [2:0]                         axi_aw_size_i,
    input [1:0]                         axi_aw_burst_i,
    output                              axi_aw_ready_o, 

    // write data channel                
    input                               axi_w_valid_i,
    input  [AXI_DATA_WIDTH-1:0]         axi_w_data_i,
    input  [AXI_STRB_WIDTH-1:0]         axi_w_strb_i,
    input                               axi_w_last_i,
    output                              axi_w_ready_o,
    
    //write respond channel
    output                              axi_b_valid_o,
    output  [1:0]                       axi_b_resp_o,                 
    output  [AXI_ID_WIDTH-1:0]          axi_b_id_o,
    input                               axi_b_ready_i,  

    // read address channel
    input                               axi_ar_valid_i,
    input  [AXI_ADDR_WIDTH-1:0]         axi_ar_addr_i,
    input  [AXI_ID_WIDTH-1:0]           axi_ar_id_i,
    input  [7:0]                        axi_ar_len_i,
    input  [2:0]                        axi_ar_size_i,
    input  [1:0]                        axi_ar_burst_i,
    output                              axi_ar_ready_o, 
    
    // read data channel
    input                               axi_r_ready_i,                 
    output                              axi_r_valid_o,                
    output [1:0]                        axi_r_resp_o,
    output [AXI_DATA_WIDTH-1:0]         axi_r_data_o,
    output                              axi_r_last_o,
    output [AXI_ID_WIDTH-1:0]           axi_r_id_o,

    output                              timer_intr_o
);
    wire [AXI_ID_WIDTH-1:0] axi_id  = {AXI_ID_WIDTH{1'b0}};
    
    

//------------ CLINT REG ----------------//
    reg [`ysyx_040654_CsrBus] mtime;
    reg [`ysyx_040654_CsrBus] mtimecmp;
    
//-------------------- READ TRANSACTION -----------------//

    //------------ STATE MACHINE --------------// 
    localparam r_idle_state = 2'b00, r_addr_state = 2'b01, r_data_state = 2'b10, r_end_state = 2'b11;
    reg [1:0] r_curr_state, r_next_state;

    //------------ HANDSHAKE SIGNAL -----------//
    reg ar_ready, r_valid;
    reg [1:0] r_resp;
    
    reg [AXI_ADDR_WIDTH-1:0] read_addr;
    reg [2:0] read_size;
    reg [AXI_DATA_WIDTH-1:0] read_data;

    assign axi_ar_ready_o = ar_ready;
    assign axi_r_valid_o = r_valid;
    assign axi_r_resp_o = r_resp;
    

    wire ar_handshake = axi_ar_ready_o && axi_ar_valid_i;
    wire r_handshake = axi_r_ready_i && axi_r_valid_o;
    wire r_finish = r_handshake && axi_r_last_o;

    always @(posedge aclk) begin
        if(!resetn) begin
            r_curr_state <= r_idle_state; 
        end else begin
            r_curr_state <= r_next_state;
        end 
    end

    always @(*) begin
        case(r_curr_state)
            r_idle_state: begin
                if(axi_ar_valid_i) begin
                    r_next_state = r_addr_state;
                end else begin
                    r_next_state = r_idle_state;
                end
            end

            r_addr_state: begin
                if(ar_handshake) begin
                    r_next_state = r_data_state;
                end else begin
                    r_next_state = r_addr_state;
                end
            end

            r_data_state: begin
                if(r_finish) begin
                    r_next_state = r_end_state;
                end else begin
                    r_next_state = r_data_state;
                end
            end

            default: begin
                r_next_state = r_idle_state;
            end

        endcase
    end

    always @(posedge aclk) begin
        if(!resetn) begin
            ar_ready <= 1'b0; 
            r_valid <= 1'b0;
            r_resp <= 2'b0;
            read_addr <= {AXI_ADDR_WIDTH{1'b0}};
            read_size <= 3'b0; 
        end else begin
            if(r_curr_state == r_idle_state) begin
                if(axi_ar_valid_i) begin
                    ar_ready <= 1'b1;
                end
            end

            else if(r_curr_state == r_addr_state) begin
                if(ar_handshake) begin
                    ar_ready <= 1'b0;
                    read_addr <= axi_ar_addr_i;
                    read_size <= axi_ar_size_i;
                    r_valid <= 1'b1;
                end
            end 

            else if(r_curr_state == r_data_state) begin
                if(r_handshake) begin
                    r_valid <= 1'b0;
                    read_addr <= {AXI_ADDR_WIDTH{1'b0}};
                    read_size <= 3'b0;
                    if(read_addr == `ysyx_040654_CLINT_MTIME || read_addr == `ysyx_040654_CLINT_MTIMECMP) begin
                        r_resp <= 2'b00;
                    end else begin
                        r_resp <= 2'b11;
                    end
                end
            end 

            else if(r_curr_state == r_end_state) begin
                r_resp <= 2'b00;
            end

        end
    end

    always @(*) begin
        if(read_addr >= `ysyx_040654_CLINT_MTIME && read_addr < `ysyx_040654_CLINT_MTIME + 8) begin
            case(read_size)
                3'b000: begin       // 1 byte
                    case(read_addr[2:0])
                        3'b000: begin
                            read_data = {56'b0, mtime[7:0]};
                        end
                        3'b001: begin
                            read_data = {48'b0, mtime[15:8], 8'b0};
                        end
                        3'b010: begin
                            read_data = {40'b0, mtime[23:16], 16'b0};
                        end
                        3'b011: begin
                            read_data = {32'b0, mtime[31:24], 24'b0};
                        end
                        3'b100: begin
                            read_data = {24'b0, mtime[39:32], 32'b0};
                        end
                        3'b101: begin
                            read_data = {16'b0, mtime[47:40], 40'b0};
                        end
                        3'b110: begin
                            read_data = {8'b0, mtime[55:48], 48'b0};
                        end
                        default:begin
                            read_data = {mtime[63:56], 56'b0};
                        end
                    endcase
                end
                3'b001: begin       // 2 bytes
                    case (read_addr[1:0])
                        2'b00: begin
                            read_data = {48'b0, mtime[15:0]};
                        end
                        2'b01: begin
                            read_data = {32'b0, mtime[31:16], 16'b0};
                        end
                        2'b10: begin
                            read_data = {16'b0, mtime[47:32], 32'b0};
                        end
                        default: begin
                            read_data = {mtime[63:48], 48'b0};
                        end
                    endcase
                end
                3'b010: begin       // 4 bytes
                    case (read_addr[0])
                        1'b0: begin
                            read_data = {32'b0, mtime[31:0]};
                        end
                        default: begin
                            read_data = {mtime[63:32], 32'b0};
                        end
                    endcase
                end
                default: begin      // 8 bytes
                    read_data = mtime;
                end
            endcase
        end else if(read_addr >= `ysyx_040654_CLINT_MTIMECMP && read_addr < `ysyx_040654_CLINT_MTIMECMP + 8)begin
            case(read_size)
                3'b000: begin       // 1 byte
                    case(read_addr[2:0])
                        3'b000: begin
                            read_data = {56'b0, mtimecmp[7:0]};
                        end
                        3'b001: begin
                            read_data = {48'b0, mtimecmp[15:8], 8'b0};
                        end
                        3'b010: begin
                            read_data = {40'b0, mtimecmp[23:16], 16'b0};
                        end
                        3'b011: begin
                            read_data = {32'b0, mtimecmp[31:24], 24'b0};
                        end
                        3'b100: begin
                            read_data = {24'b0, mtimecmp[39:32], 32'b0};
                        end
                        3'b101: begin
                            read_data = {16'b0, mtimecmp[47:40], 40'b0};
                        end
                        3'b110: begin
                            read_data = {8'b0, mtimecmp[55:48], 48'b0};
                        end
                        default:begin
                            read_data = {mtimecmp[63:56], 56'b0};
                        end
                    endcase
                end
                3'b001: begin       // 2 bytes
                    case (read_addr[2:1])
                        2'b00: begin
                            read_data = {48'b0, mtimecmp[15:0]};
                        end
                        2'b01: begin
                            read_data = {32'b0, mtimecmp[31:16], 16'b0};
                        end
                        2'b10: begin
                            read_data = {16'b0, mtimecmp[47:32], 32'b0};
                        end
                        default: begin
                            read_data = {mtimecmp[63:48], 48'b0};
                        end
                    endcase
                end
                3'b010: begin       // 4 bytes
                    case (read_addr[2])
                        1'b0: begin
                            read_data = {32'b0, mtimecmp[31:0]};
                        end
                        default: begin
                            read_data = {mtimecmp[63:32], 32'b0};
                        end
                    endcase
                end
                default: begin      // 8 bytes
                    read_data = mtimecmp;
                end
            endcase
        end else begin
            read_data = 64'b0;
        end
    end

    assign axi_r_id_o = axi_id;
    assign axi_r_last_o = (r_curr_state == r_data_state || r_curr_state == r_addr_state) ? 1'b1 : 1'b0;
    assign axi_r_data_o = (r_curr_state == r_data_state && ((read_addr >= `ysyx_040654_CLINT_MTIME && read_addr < `ysyx_040654_CLINT_MTIME + 8) || (read_addr >= `ysyx_040654_CLINT_MTIMECMP && read_addr < `ysyx_040654_CLINT_MTIMECMP + 8))) ? read_data :  64'b0;
//-------------------- WRITE TRANSACTION -----------------//

    //--------------- STATE MACHINE ------------------//
    localparam w_idle_state = 2'b00, w_addr_state = 2'b01, w_data_state = 2'b10, w_resp_state = 2'b11;
    reg [1:0] w_curr_state, w_next_state;

    //--------------- HANDSHAKE SIGNAL ---------------//
    reg aw_ready,  w_ready, b_valid;
    reg [1:0] b_resp;
    reg [AXI_ADDR_WIDTH-1:0] write_addr;
    reg [AXI_DATA_WIDTH-1:0] write_data;
    reg [2:0] write_size;
    reg mtime_wen, mtimecmp_wen;
    reg [`ysyx_040654_CsrBus] mtime_next_val, mtimecmp_next_val;
    

    assign axi_aw_ready_o = aw_ready;
    assign axi_w_ready_o = w_ready;
    assign axi_b_valid_o = b_valid;
    assign axi_b_resp_o = b_resp;
    

    always @(*) begin
        if(mtime_wen) begin
            case (write_size)
                3'b000: begin
                    case (1'b1)
                        axi_w_strb_i[0]: begin
                            mtime_next_val = {mtime[63:8],write_data[7:0]};
                        end
                        axi_w_strb_i[1]: begin
                            mtime_next_val = {mtime[63:16],write_data[15:8], mtime[7:0]};
                        end
                        axi_w_strb_i[2]: begin
                            mtime_next_val = {mtime[63:24],write_data[23:16],mtime[15:0]};
                        end
                        axi_w_strb_i[3]: begin
                            mtime_next_val = {mtime[63:32],write_data[31:24],mtime[23:0]};
                        end
                        axi_w_strb_i[4]: begin
                            mtime_next_val = {mtime[63:40],write_data[39:32],mtime[31:0]};
                        end
                        axi_w_strb_i[5]: begin
                            mtime_next_val = {mtime[63:48],write_data[47:40],mtime[39:0]};
                        end
                        axi_w_strb_i[6]: begin
                            mtime_next_val = {mtime[63:56],write_data[55:48],mtime[47:0]};
                        end
                        axi_w_strb_i[7]: begin
                            mtime_next_val = {write_data[63:56],mtime[55:0]};
                        end
                        default: begin
                            mtime_next_val = mtime;
                        end
                    endcase 
                end
                3'b001: begin
                    case(2'b11)
                        axi_w_strb_i[1:0]: begin
                            mtime_next_val = {mtime[63:16], write_data[15:0]};
                        end
                        axi_w_strb_i[3:2]: begin
                            mtime_next_val = {mtime[63:32], write_data[31:16], mtime[15:0]};
                        end
                        axi_w_strb_i[5:4]: begin
                            mtime_next_val = {mtime[63:48], write_data[47:32], mtime[31:0]};
                        end
                        axi_w_strb_i[7:6]: begin
                            mtime_next_val = {write_data[63:48], mtime[47:0]};
                        end
                        default: begin
                            mtime_next_val = mtime;
                        end
                    endcase
                end
                3'b010: begin
                    case(4'b1111)
                        axi_w_strb_i[3:0]: begin
                            mtime_next_val = {mtime[63:32], write_data[31:0]};
                        end
                        axi_w_strb_i[7:4]: begin
                            mtime_next_val = {write_data[63:32], mtime[31:0]};
                        end
                        default: begin
                            mtime_next_val = mtime;
                        end
                    endcase
                end
                default: begin
                    mtime_next_val = write_data;
                end
            endcase
        end else begin
            mtime_next_val = mtime + 1;
        end
        if(mtimecmp_wen) begin
            case (write_size)
                3'b000: begin
                    case (1'b1)
                        axi_w_strb_i[0]: begin
                            mtimecmp_next_val = {mtimecmp[63:8],write_data[7:0]};
                        end
                        axi_w_strb_i[1]: begin
                            mtimecmp_next_val = {mtimecmp[63:16],write_data[15:8], mtimecmp[7:0]};
                        end
                        axi_w_strb_i[2]: begin
                            mtimecmp_next_val = {mtimecmp[63:24],write_data[23:16],mtimecmp[15:0]};
                        end
                        axi_w_strb_i[3]: begin
                            mtimecmp_next_val = {mtimecmp[63:32],write_data[31:24],mtimecmp[23:0]};
                        end
                        axi_w_strb_i[4]: begin
                            mtimecmp_next_val = {mtimecmp[63:40],write_data[39:32],mtimecmp[31:0]};
                        end
                        axi_w_strb_i[5]: begin
                            mtimecmp_next_val = {mtimecmp[63:48],write_data[47:40],mtimecmp[39:0]};
                        end
                        axi_w_strb_i[6]: begin
                            mtimecmp_next_val = {mtimecmp[63:56],write_data[55:48],mtimecmp[47:0]};
                        end
                        axi_w_strb_i[7]: begin
                            mtimecmp_next_val = {write_data[63:56],mtimecmp[55:0]};
                        end
                        default: begin
                            mtimecmp_next_val = mtimecmp;
                        end
                    endcase 
                end
                3'b001: begin
                    case(2'b11)
                        axi_w_strb_i[1:0]: begin
                            mtimecmp_next_val = {mtimecmp[63:16], write_data[15:0]};
                        end
                        axi_w_strb_i[3:2]: begin
                            mtimecmp_next_val = {mtimecmp[63:32], write_data[31:16], mtimecmp[15:0]};
                        end
                        axi_w_strb_i[5:4]: begin
                            mtimecmp_next_val = {mtimecmp[63:48], write_data[47:32], mtimecmp[31:0]};
                        end
                        axi_w_strb_i[7:6]: begin
                            mtimecmp_next_val = {write_data[63:48], mtimecmp[47:0]};
                        end
                        default: begin
                            mtimecmp_next_val = mtimecmp;
                        end
                    endcase
                end
                3'b010: begin
                    case(4'b1111)
                        axi_w_strb_i[3:0]: begin
                            mtimecmp_next_val = {mtimecmp[63:32], write_data[31:0]};
                        end
                        axi_w_strb_i[7:4]: begin
                            mtimecmp_next_val = {write_data[63:32], mtimecmp[31:0]};
                        end
                        default: begin
                            mtimecmp_next_val = mtimecmp;
                        end
                    endcase
                end
                default: begin
                    mtimecmp_next_val = write_data;
                end
            endcase
        end else begin
            mtimecmp_next_val = mtimecmp;
        end
    end

    wire aw_handshake = axi_aw_ready_o && axi_aw_valid_i;
    wire w_handshake = axi_w_ready_o && axi_w_valid_i;
    wire w_finish = w_handshake && axi_w_last_i;
    wire b_handshake = axi_b_ready_i && axi_b_valid_o;

    always @(posedge aclk) begin
        if(!resetn) begin
            w_curr_state <= w_idle_state;
        end else begin
            w_curr_state <= w_next_state;
        end
    end



    always @(*) begin
        case(w_curr_state) 
            w_idle_state: begin
                if(axi_aw_valid_i) begin
                    w_next_state = w_addr_state;
                end else begin
                    w_next_state = w_idle_state;
                end
            end

            w_addr_state: begin
                if(aw_handshake) begin
                    w_next_state = w_data_state;
                end else begin
                    w_next_state = w_addr_state;
                end
            end

            w_data_state: begin
                if(w_finish) begin
                    w_next_state = w_resp_state;
                end else begin
                    w_next_state = w_data_state;
                end
            end

            w_resp_state: begin
                if(b_handshake) begin
                    w_next_state = w_idle_state;
                end else begin
                    w_next_state = w_resp_state;
                end
            end

            default: begin
                w_next_state = w_idle_state;
            end
        endcase
    end

    always @(posedge aclk) begin
        if(!resetn) begin
            aw_ready <= 1'b0;
            w_ready <= 1'b0;
            b_valid <= 1'b0;
            b_resp <= 2'b0;
            write_addr <= {AXI_ADDR_WIDTH{1'b0}};
            write_data <= {AXI_DATA_WIDTH{1'b0}};
            write_size <= 3'b0;
        end else begin
            if(w_curr_state == w_idle_state) begin
                if(axi_aw_valid_i) begin
                    aw_ready <= 1'b1;
                end
            end
            
            else if(w_curr_state == w_addr_state) begin
                if(aw_handshake) begin
                    write_addr <= axi_aw_addr_i;
                    write_size <= axi_aw_size_i;
                    aw_ready <= 1'b0;
                    w_ready <= 1'b1;
                end
            end
            
            else if(w_curr_state == w_data_state) begin
                if(w_finish) begin
                    w_ready <= 1'b0;
                    b_valid <= 1'b1;
                    write_addr <= {AXI_ADDR_WIDTH{1'b0}};
                    write_data <= axi_w_data_i;
                    if(write_addr >= `ysyx_040654_CLINT_MTIME && write_addr < `ysyx_040654_CLINT_MTIME + 8) begin
                        mtime_wen <= 1'b1;
                        b_resp <= 2'b00;
                    end else if(write_addr >= `ysyx_040654_CLINT_MTIMECMP && write_addr < `ysyx_040654_CLINT_MTIMECMP + 8) begin
                        mtimecmp_wen <= 1'b1;
                        b_resp <= 2'b00;
                    end else begin
                        b_resp <= 2'b11;
                    end
                end
            end

            else if(w_curr_state == w_resp_state) begin
                if(b_handshake) begin
                    b_valid <= 1'b0;
                    write_data <= {AXI_DATA_WIDTH{1'b0}};
                    b_resp <= 2'b00;
                    write_size <= 3'b0;
                    mtime_wen <= 1'b0;
                    mtimecmp_wen <= 1'b0; 
                end
            end
        end
    end
    assign axi_b_id_o = axi_id;

    always @(posedge aclk) begin
        if(!resetn) begin
            mtime <= {AXI_DATA_WIDTH{1'b0}};
            mtimecmp <= {AXI_DATA_WIDTH{1'b0}};
        end else begin
            mtime <= mtime_next_val;
            mtimecmp <= mtimecmp_next_val;
        end
    end

    assign timer_intr_o = (mtime >= mtimecmp);

endmodule



module ysyx_040654_csr (
    input                   clk,
    input                   rstn,
    input   [`ysyx_040654_InstBus]      mem_inst_i,
    input   [3:0]           csr_op_i,
    input                   timer_intr_i,
    input                   mem_busy_flag_i,
    input   [`ysyx_040654_MemAddrBus]   pc_i,
    input   [`ysyx_040654_MemAddrBus]   pc_next_i,
    input   [`ysyx_040654_CsrAddrBus]   csr_addr_i,
    input   [`ysyx_040654_RegBus]       csr_src_i,
    output  [`ysyx_040654_RegBus]       csr_rdata_o,
    output  [`ysyx_040654_MemAddrBus]   excp_pc_o,
    output                  excp_flag_o
);
    reg         excp_flag_r;
    reg [`ysyx_040654_CsrBus] csrs[`ysyx_040654_CsrNum-1:0];
    wire [`ysyx_040654_CsrBus] temp;
    wire timer_intr_flag;
    
    always @(posedge clk) begin
        if(!rstn) begin
            excp_flag_r <= 1'b0;
        end else begin
            if(csr_op_i == `ysyx_040654_CSR_ECALL && timer_intr_flag) begin
                excp_flag_r <= 1'b1;
            end else if(excp_flag_r && csr_op_i == `ysyx_040654_CSR_MRET) begin
                excp_flag_r <= 1'b0;
            end
        end
    end
    
    always @(posedge clk) begin
        if(!rstn) begin
            csrs[`ysyx_040654_MSTATUS] <= `ysyx_040654_Zero_Word;
            csrs[`ysyx_040654_MTVEC]   <= `ysyx_040654_Zero_Word;
            csrs[`ysyx_040654_MEPC]    <= `ysyx_040654_Zero_Word;
            csrs[`ysyx_040654_MCAUSE]  <= `ysyx_040654_Zero_Word;
            csrs[`ysyx_040654_MIE]     <= `ysyx_040654_Zero_Word;
            csrs[`ysyx_040654_MIP]     <= `ysyx_040654_Zero_Word;
        end else begin
            if(csr_op_i == `ysyx_040654_CSR_CSRRS || csr_op_i == `ysyx_040654_CSR_CSRRSI) begin
                case (csr_addr_i)
                    `ysyx_040654_MSTATUS_ADDR: csrs[`ysyx_040654_MSTATUS]  <= csr_src_i | temp;
                    `ysyx_040654_MTVEC_ADDR:   csrs[`ysyx_040654_MTVEC]    <= csr_src_i | temp;
                    `ysyx_040654_MEPC_ADDR:    csrs[`ysyx_040654_MEPC]     <= csr_src_i | temp;
                    `ysyx_040654_MCAUSE_ADDR:  csrs[`ysyx_040654_MCAUSE]   <= csr_src_i | temp;
                    `ysyx_040654_MIE_ADDR:     csrs[`ysyx_040654_MIE]      <= csr_src_i | temp;
                    `ysyx_040654_MIP_ADDR:     csrs[`ysyx_040654_MIP]      <= csr_src_i | temp;
                    default: ;
                endcase
            end else if(csr_op_i == `ysyx_040654_CSR_CSRRW || csr_op_i == `ysyx_040654_CSR_CSRRWI) begin
                case (csr_addr_i)
                    `ysyx_040654_MSTATUS_ADDR: csrs[`ysyx_040654_MSTATUS]  <= csr_src_i;
                    `ysyx_040654_MTVEC_ADDR:   csrs[`ysyx_040654_MTVEC]    <= csr_src_i;
                    `ysyx_040654_MEPC_ADDR:    csrs[`ysyx_040654_MEPC]     <= csr_src_i;
                    `ysyx_040654_MCAUSE_ADDR:  csrs[`ysyx_040654_MCAUSE]   <= csr_src_i;
                    `ysyx_040654_MIE_ADDR:     csrs[`ysyx_040654_MIE]      <= csr_src_i;
                    `ysyx_040654_MIP_ADDR:     csrs[`ysyx_040654_MIP]      <= csr_src_i;
                    default: ;
                endcase
            end else if(csr_op_i == `ysyx_040654_CSR_CSRRC || csr_op_i == `ysyx_040654_CSR_CSRRCI) begin
                case (csr_addr_i)
                    `ysyx_040654_MSTATUS_ADDR: csrs[`ysyx_040654_MSTATUS]  <= ~csr_src_i & temp;
                    `ysyx_040654_MTVEC_ADDR:   csrs[`ysyx_040654_MTVEC]    <= ~csr_src_i & temp;
                    `ysyx_040654_MEPC_ADDR:    csrs[`ysyx_040654_MEPC]     <= ~csr_src_i & temp;
                    `ysyx_040654_MCAUSE_ADDR:  csrs[`ysyx_040654_MCAUSE]   <= ~csr_src_i & temp;
                    `ysyx_040654_MIE_ADDR:     csrs[`ysyx_040654_MIE]      <= ~csr_src_i & temp;
                    `ysyx_040654_MIP_ADDR:     csrs[`ysyx_040654_MIP]      <= ~csr_src_i & temp;
                    default: ;
                endcase
            end else if(csr_op_i == `ysyx_040654_CSR_ECALL) begin
                csrs[`ysyx_040654_MEPC] <= {32'b0, pc_i};
                csrs[`ysyx_040654_MCAUSE] <= 64'hB;     
                csrs[`ysyx_040654_MSTATUS] <= {csrs[`ysyx_040654_MSTATUS][63:36], {2{2'b10}}, csrs[`ysyx_040654_MSTATUS][31:13], 2'b11, csrs[`ysyx_040654_MSTATUS][10:8], csrs[`ysyx_040654_MSTATUS][3], csrs[`ysyx_040654_MSTATUS][6:4], 1'b0, csrs[`ysyx_040654_MSTATUS][2:0]};
            end else if(csr_op_i == `ysyx_040654_CSR_MRET) begin
                csrs[`ysyx_040654_MSTATUS] <= {csrs[`ysyx_040654_MSTATUS][63:36], {2{2'b10}}, csrs[`ysyx_040654_MSTATUS][31:13], 2'b11, csrs[`ysyx_040654_MSTATUS][10:8], 1'b1, csrs[`ysyx_040654_MSTATUS][6:4], csrs[`ysyx_040654_MSTATUS][7], csrs[`ysyx_040654_MSTATUS][2:0]};
            end 
            if(timer_intr_flag) begin
                csrs[`ysyx_040654_MEPC] <= {32'b0, pc_next_i};
                csrs[`ysyx_040654_MCAUSE] <= 64'h8000000000000007;
                csrs[`ysyx_040654_MSTATUS] <= {csrs[`ysyx_040654_MSTATUS][63:36], {2{2'b10}}, csrs[`ysyx_040654_MSTATUS][31:13], 2'b11, csrs[`ysyx_040654_MSTATUS][10:8], csrs[`ysyx_040654_MSTATUS][3], csrs[`ysyx_040654_MSTATUS][6:4], 1'b0, csrs[`ysyx_040654_MSTATUS][2:0]};
            end
        end
    end


    assign temp =   csr_addr_i == `ysyx_040654_MSTATUS_ADDR ? csrs[`ysyx_040654_MSTATUS] :
                    csr_addr_i == `ysyx_040654_MTVEC_ADDR   ? csrs[`ysyx_040654_MTVEC]   :
                    csr_addr_i == `ysyx_040654_MEPC_ADDR    ? csrs[`ysyx_040654_MEPC]    :
                    csr_addr_i == `ysyx_040654_MCAUSE_ADDR  ? csrs[`ysyx_040654_MCAUSE]  :
                    csr_addr_i == `ysyx_040654_MIE_ADDR     ? csrs[`ysyx_040654_MIE]     :
                    `ysyx_040654_Zero_Word;


    assign csr_rdata_o = temp;
    assign excp_pc_o = (csr_op_i == `ysyx_040654_CSR_ECALL || (timer_intr_flag)) ? csrs[`ysyx_040654_MTVEC][31:0] : csrs[`ysyx_040654_MEPC][31:0];
    assign excp_flag_o = (csr_op_i == `ysyx_040654_CSR_ECALL || csr_op_i == `ysyx_040654_CSR_MRET || timer_intr_flag) ? 1'b1 : 1'b0;
    assign timer_intr_flag = (csrs[`ysyx_040654_MSTATUS][3] == 1'b1 && csrs[`ysyx_040654_MIE][7] == 1'b1 && timer_intr_i && !excp_flag_r && (!mem_busy_flag_i && csr_op_i != `ysyx_040654_CSR_ECALL && csr_op_i != `ysyx_040654_CSR_MRET && mem_inst_i != `ysyx_040654_Zero_HalfWord && mem_inst_i != `ysyx_040654_INST_NOP));

endmodule


module ysyx_040654_decoder (
    input [`ysyx_040654_InstBus] inst_i,
    input [`ysyx_040654_MemAddrBus] pc_i,
    input [`ysyx_040654_RegBus] reg_rdata1_i,
    input [`ysyx_040654_RegBus] reg_rdata2_i,

    //to regfile
    output reg [`ysyx_040654_RegAddrBus] reg_raddr1_o,
    output reg [`ysyx_040654_RegAddrBus] reg_raddr2_o,
    output reg reg_ren1_o,
    output reg reg_ren2_o,
    
    // to alu
    output reg [`ysyx_040654_DataBus] src1_o,
    output reg [`ysyx_040654_DataBus] src2_o,
    output reg [`ysyx_040654_ALU_OP-1:0] alu_op_o,
	
	// to bju 
    output reg [`ysyx_040654_BJU_OP-1:0] bju_op_o,
    output reg [`ysyx_040654_MemAddrBus] bju_pc_base_o,
    output reg [`ysyx_040654_MemAddrBus] bju_pc_offset_o,

	//to mem
    output reg mem_wen_o,
	output reg [`ysyx_040654_DataBus] mem_wdata_o,
	output reg mem_ren_o,

	// to lsu
    output reg [`ysyx_040654_LSU_OP-1:0] lsu_op_o,
    
    // to wb
    output reg reg_wen_o,
    output [1:0] reg_wsel_o,
    output reg [`ysyx_040654_RegAddrBus] reg_waddr_o,   // to wb and lsu
    
    //to csr
    output reg [`ysyx_040654_CSR_OP-1:0] csr_op_o,
    output reg [`ysyx_040654_CsrAddrBus] csr_rwaddr_o,
    output reg [`ysyx_040654_CsrBus] csr_wdata_o,

    output              cache_flush_flag_o
);
    wire [`ysyx_040654_RegAddrBus] rs1;
    wire [`ysyx_040654_RegAddrBus] rs2;
    wire [`ysyx_040654_Opcode-1:0] opcode;
    wire [`ysyx_040654_Fun3-1:0] fun3;
    wire [`ysyx_040654_Fun7-1:0] fun7;
    wire [`ysyx_040654_RegAddrBus] rd;
    wire [`ysyx_040654_DataBus] imm_i;
    wire [`ysyx_040654_DataBus] imm_u;
    wire [`ysyx_040654_DataBus] imm_s;
    wire [`ysyx_040654_DataBus] imm_j;
    wire [`ysyx_040654_DataBus] imm_b;
    wire [`ysyx_040654_DataBus] imm_z;

    always @(*) begin
        case(opcode)
            `ysyx_040654_INST_TYPE_E:begin                          //exception
                src1_o = `ysyx_040654_Zero_Word;
                src2_o = `ysyx_040654_Zero_Word;
                alu_op_o = `ysyx_040654_ALU_NOP;
                lsu_op_o = `ysyx_040654_LSU_NOP;
                reg_ren2_o = 1'b0;
                reg_raddr2_o = `ysyx_040654_RegZero;
                bju_pc_base_o = `ysyx_040654_Zero_HalfWord;
                mem_wen_o = 1'b0;
                mem_ren_o = 1'b0;
                mem_wdata_o = `ysyx_040654_Zero_Word;
                bju_op_o = `ysyx_040654_BJU_NOP;
                bju_pc_offset_o = `ysyx_040654_Zero_HalfWord;
                case(fun3)
                    `ysyx_040654_INST_ECALL_MRET_F3: begin
                        reg_wen_o = 1'b0;
                        reg_waddr_o = `ysyx_040654_RegZero;
                        csr_wdata_o = `ysyx_040654_Zero_Word;
                        reg_ren1_o = 1'b0;
                        reg_raddr1_o = `ysyx_040654_RegZero;
                        case (fun7)
                            `ysyx_040654_INST_ECALL_F7: begin
                                csr_op_o = `ysyx_040654_CSR_ECALL;
                            end
                            `ysyx_040654_INST_MRET_F7:  begin
                                csr_op_o = `ysyx_040654_CSR_MRET;
                            end
                            default: begin 
                                csr_op_o = `ysyx_040654_CSR_NOP;
                            end
                        endcase
                    end
                    `ysyx_040654_INST_CSRRW_F3: begin
                        reg_ren1_o = 1'b1;
                        reg_raddr1_o = rs1;
                        reg_wen_o = 1'b1;
                        reg_waddr_o = rd;
                        csr_op_o = `ysyx_040654_CSR_CSRRW;
                        csr_wdata_o = reg_rdata1_i;
                    end
                    `ysyx_040654_INST_CSRRS_F3: begin
                        reg_ren1_o = 1'b1;
                        reg_raddr1_o = rs1;
                        reg_wen_o = 1'b1;
                        reg_waddr_o = rd;
                        csr_op_o = `ysyx_040654_CSR_CSRRS;
                        csr_wdata_o = reg_rdata1_i; 
                    end
                    `ysyx_040654_INST_CSRRC_F3: begin
                        reg_ren1_o = 1'b1;
                        reg_raddr1_o = rs1;
                        reg_wen_o = 1'b1;
                        reg_waddr_o = rd;
                        csr_op_o = `ysyx_040654_CSR_CSRRC;
                        csr_wdata_o = reg_rdata1_i;
                    end
                    `ysyx_040654_INST_CSRRWI_F3: begin
                        reg_ren1_o = 1'b0;
                        reg_raddr1_o = `ysyx_040654_RegZero;
                        reg_wen_o = 1'b1;
                        reg_waddr_o = rd;
                        csr_op_o = `ysyx_040654_CSR_CSRRWI;
                        csr_wdata_o = imm_z;
                    end
                    `ysyx_040654_INST_CSRRSI_F3: begin
                        reg_ren1_o = 1'b0;
                        reg_raddr1_o = `ysyx_040654_RegZero;
                        reg_wen_o = 1'b1;
                        reg_waddr_o = rd;
                        csr_op_o = `ysyx_040654_CSR_CSRRSI;
                        csr_wdata_o = imm_z;
                    end
                    `ysyx_040654_INST_CSRRCI_F3: begin
                        reg_ren1_o = 1'b0;
                        reg_raddr1_o = `ysyx_040654_RegZero;
                        reg_wen_o = 1'b1;
                        reg_waddr_o = rd;
                        csr_op_o = `ysyx_040654_CSR_CSRRCI;
                        csr_wdata_o = imm_z;
                    end
                    default: begin
                        reg_ren1_o = 1'b0;
                        reg_raddr1_o = `ysyx_040654_RegZero;
                        reg_wen_o = 1'b1;
                        reg_waddr_o = `ysyx_040654_RegZero;
                        csr_op_o = `ysyx_040654_CSR_NOP;
                        csr_wdata_o = `ysyx_040654_Zero_Word;
                    end
                endcase
            end
            `ysyx_040654_INST_TYPE_I:begin
                src1_o = reg_rdata1_i;
                src2_o = imm_i;
                reg_ren1_o = 1'b1;
                reg_raddr1_o = rs1;
                reg_wen_o = 1'b1;
                reg_ren2_o = 1'b0;
                reg_waddr_o = rd;
                lsu_op_o = `ysyx_040654_LSU_NOP;
                reg_raddr2_o = `ysyx_040654_RegZero;
                bju_pc_base_o = `ysyx_040654_Zero_HalfWord;
                mem_wen_o = 1'b0;
                mem_ren_o = 1'b0;
                mem_wdata_o = `ysyx_040654_Zero_Word;
                bju_op_o = `ysyx_040654_BJU_NOP;
                bju_pc_offset_o = `ysyx_040654_Zero_HalfWord;
                csr_op_o = `ysyx_040654_CSR_NOP;
                csr_wdata_o = `ysyx_040654_Zero_Word;
                case(fun3)
                    `ysyx_040654_INST_ADDI:begin
                        alu_op_o = `ysyx_040654_ALU_ADD;
                    end
                    `ysyx_040654_INST_ANDI:begin
                        alu_op_o = `ysyx_040654_ALU_AND;
                    end
                    `ysyx_040654_INST_SLTIU:begin
                        alu_op_o = `ysyx_040654_ALU_SLTU;
                    end
                    `ysyx_040654_INST_SRAI_SRLI:begin
                        case (fun7[5])
                            `ysyx_040654_INST_SRAI: begin
                                alu_op_o = `ysyx_040654_ALU_SRA;
                            end
                            default: alu_op_o = `ysyx_040654_ALU_SRL;
                        endcase
                    end
                    `ysyx_040654_INST_ORI:begin
                        alu_op_o = `ysyx_040654_ALU_OR;
                    end
                    `ysyx_040654_INST_XORI:begin
                        alu_op_o = `ysyx_040654_ALU_XOR;
                    end
                    `ysyx_040654_INST_SLLI:begin
                        alu_op_o = `ysyx_040654_ALU_SLL;
                    end
                    `ysyx_040654_INST_SLTI:begin
                        alu_op_o = `ysyx_040654_ALU_SLT;
                    end
                    default:begin
                        alu_op_o = `ysyx_040654_ALU_NOP;
                    end
                endcase
            end

            `ysyx_040654_INST_TYPE_I_L:begin
                reg_ren2_o = 1'b0;
                reg_raddr2_o = `ysyx_040654_RegZero;
                bju_pc_base_o = `ysyx_040654_Zero_HalfWord;
                mem_wen_o = 1'b0;
                mem_wdata_o = `ysyx_040654_Zero_Word;
                bju_op_o = `ysyx_040654_BJU_NOP;
                bju_pc_offset_o = `ysyx_040654_Zero_HalfWord;
                src1_o = reg_rdata1_i;
                src2_o = imm_i;
                reg_ren1_o = 1'b1;
                reg_raddr1_o = rs1;
                reg_wen_o = 1'b1;
                reg_waddr_o = rd;
                mem_ren_o = 1'b1;
                alu_op_o = `ysyx_040654_ALU_ADD;
                csr_op_o = `ysyx_040654_CSR_NOP;
                csr_wdata_o = `ysyx_040654_Zero_Word;
                case(fun3)
                    `ysyx_040654_INST_LD:begin
                        lsu_op_o = `ysyx_040654_LSU_LD;
                    end
                    `ysyx_040654_INST_LW:begin
                        lsu_op_o = `ysyx_040654_LSU_LW;
                    end
                    `ysyx_040654_INST_LWU:begin
                        lsu_op_o = `ysyx_040654_LSU_LWU;
                    end
                    `ysyx_040654_INST_LH:begin
                        lsu_op_o = `ysyx_040654_LSU_LH;
                    end
                    `ysyx_040654_INST_LB:begin
                        lsu_op_o = `ysyx_040654_LSU_LB;
                    end
                    `ysyx_040654_INST_LBU:begin
                        lsu_op_o = `ysyx_040654_LSU_LBU;
                    end
                    `ysyx_040654_INST_LHU:begin
                        lsu_op_o = `ysyx_040654_LSU_LHU;
                    end
                    default:begin
                        lsu_op_o = `ysyx_040654_LSU_NOP;
                    end
                endcase
            end
            `ysyx_040654_INST_TYPE_I_JALR:begin
                alu_op_o = `ysyx_040654_ALU_NOP;
                lsu_op_o = `ysyx_040654_LSU_NOP;
                reg_ren2_o = 1'b0;
                reg_raddr2_o = `ysyx_040654_RegZero;
                mem_wen_o = 1'b0;
                mem_ren_o = 1'b0;
                mem_wdata_o = `ysyx_040654_Zero_Word;
                src1_o = `ysyx_040654_Zero_Word;
                src2_o = `ysyx_040654_Zero_Word;
                reg_ren1_o = 1'b1;
                reg_raddr1_o = rs1;
                reg_wen_o = 1'b1;
                reg_waddr_o = rd;
                bju_op_o = `ysyx_040654_BJU_JALR;
                bju_pc_base_o = reg_rdata1_i[31:0];
                bju_pc_offset_o = {imm_i[31:1],1'b0};
                csr_op_o = `ysyx_040654_CSR_NOP;
                csr_wdata_o = `ysyx_040654_Zero_Word;
            end

            `ysyx_040654_INST_TYPE_I_W:begin
                lsu_op_o = `ysyx_040654_LSU_NOP;
                reg_ren2_o = 1'b0;
                reg_raddr2_o = `ysyx_040654_RegZero;
                bju_pc_base_o = `ysyx_040654_Zero_HalfWord;
                mem_wen_o = 1'b0;
                mem_ren_o = 1'b0;
                mem_wdata_o = `ysyx_040654_Zero_Word;
                bju_op_o = `ysyx_040654_BJU_NOP;
                bju_pc_offset_o = `ysyx_040654_Zero_HalfWord;
                src1_o = reg_rdata1_i;
                src2_o = imm_i;
                reg_ren1_o = 1'b1;
                reg_raddr1_o = rs1;
                reg_wen_o = 1'b1;
                reg_waddr_o = rd;
                csr_op_o = `ysyx_040654_CSR_NOP;
                csr_wdata_o = `ysyx_040654_Zero_Word;
                case(fun3)
                    `ysyx_040654_INST_ADDIW: begin
                        alu_op_o = `ysyx_040654_ALU_ADDW;
                    end
                    `ysyx_040654_INST_SLLIW: begin
                        alu_op_o = `ysyx_040654_ALU_SLLW;
                    end
                    `ysyx_040654_INST_SRAIW_SRLIW: begin
                        case (fun7[5])
                            `ysyx_040654_INST_SRAIW: begin
                                alu_op_o = `ysyx_040654_ALU_SRAW;
                            end
                            default: begin
                                alu_op_o = `ysyx_040654_ALU_SRLW;
                            end
                        endcase
                    end
                    default: begin
                        alu_op_o = `ysyx_040654_ALU_NOP;
                    end
                endcase
            end

            `ysyx_040654_INST_TYPE_R: begin
                lsu_op_o = `ysyx_040654_LSU_NOP;
                bju_pc_base_o = `ysyx_040654_Zero_HalfWord;
                mem_wen_o = 1'b0;
                mem_ren_o = 1'b0;
                mem_wdata_o = `ysyx_040654_Zero_Word;
                bju_op_o = `ysyx_040654_BJU_NOP;
                bju_pc_offset_o = `ysyx_040654_Zero_HalfWord;
                src1_o = reg_rdata1_i;
                src2_o = reg_rdata2_i;
                reg_ren1_o = 1'b1;
                reg_ren2_o = 1'b1;
                reg_wen_o = 1'b1;
                reg_raddr1_o = rs1;
                reg_raddr2_o = rs2;
                reg_waddr_o = rd;
                csr_op_o = `ysyx_040654_CSR_NOP;
                csr_wdata_o = `ysyx_040654_Zero_Word;
                case(fun3)
                    `ysyx_040654_INST_SUB_MUL: begin
                        case({fun7[5],fun7[0]})
                            `ysyx_040654_INST_SUB: begin
                                alu_op_o = `ysyx_040654_ALU_SUB;
                            end
                            `ysyx_040654_INST_ADD: begin
                                alu_op_o = `ysyx_040654_ALU_ADD;
                            end
                            `ysyx_040654_INST_MUL: begin
                                alu_op_o = `ysyx_040654_ALU_MUL;
                            end
                            default: begin
                                alu_op_o = `ysyx_040654_ALU_NOP;
                            end
                        endcase
                    end
                    `ysyx_040654_INST_AND_REMU: begin
                        case (fun7[0])
                            `ysyx_040654_INST_AND: alu_op_o = `ysyx_040654_ALU_AND; 
                            default: alu_op_o = `ysyx_040654_ALU_REMU;
                        endcase
                    end
                    `ysyx_040654_INST_OR_REM: begin
                        case(fun7[0])
                            `ysyx_040654_INST_OR: alu_op_o = `ysyx_040654_ALU_OR;
                            default: alu_op_o = `ysyx_040654_ALU_REM;
                        endcase
                    end
                    `ysyx_040654_INST_SLT_MULHSU: begin
                        case(fun7[0])
                            `ysyx_040654_INST_SLT: alu_op_o = `ysyx_040654_ALU_SLT;
                            default: alu_op_o = `ysyx_040654_ALU_MULHSU;
                        endcase
                    end
                    `ysyx_040654_INST_SLTU_MULHU: begin
                        case(fun7[0])
                            `ysyx_040654_INST_SLTU: alu_op_o = `ysyx_040654_ALU_SLTU;
                            default: alu_op_o = `ysyx_040654_ALU_MULHU;
                        endcase
                    end
                    `ysyx_040654_INST_SLL_MULH: begin
                        case(fun7[0])
                            `ysyx_040654_INST_SLL: alu_op_o = `ysyx_040654_ALU_SLL;
                            default: alu_op_o = `ysyx_040654_ALU_MULH;
                        endcase
                    end
                    `ysyx_040654_INST_SRL_SRA_DIVU: begin
                        case({fun7[5],fun7[0]})
                            `ysyx_040654_INST_SRL: alu_op_o = `ysyx_040654_ALU_SRL;
                            `ysyx_040654_INST_SRA: alu_op_o = `ysyx_040654_ALU_SRA;
                            `ysyx_040654_INST_DIVU: alu_op_o = `ysyx_040654_ALU_DIVU;
                            default: alu_op_o = `ysyx_040654_ALU_NOP;
                        endcase
                    end
                    `ysyx_040654_INST_XOR_DIV: begin
                        case(fun7[0])
                            `ysyx_040654_INST_XOR: alu_op_o = `ysyx_040654_ALU_XOR;
                            default: alu_op_o = `ysyx_040654_ALU_DIV;
                        endcase
                    end
                    default: begin
                        alu_op_o = `ysyx_040654_ALU_NOP;
                    end
                endcase
            end 
            `ysyx_040654_INST_TYPE_R_W: begin
                lsu_op_o = `ysyx_040654_LSU_NOP;
                bju_pc_base_o = `ysyx_040654_Zero_HalfWord;
                mem_wen_o = 1'b0;
                mem_ren_o = 1'b0;
                mem_wdata_o = `ysyx_040654_Zero_Word;
                bju_op_o = `ysyx_040654_BJU_NOP;
                bju_pc_offset_o = `ysyx_040654_Zero_HalfWord;
                src1_o = reg_rdata1_i;
                src2_o = reg_rdata2_i;
                reg_ren1_o = 1'b1;
                reg_ren2_o = 1'b1;
                reg_wen_o = 1'b1;
                reg_raddr1_o = rs1;
                reg_raddr2_o = rs2;
                reg_waddr_o = rd;
                csr_op_o = `ysyx_040654_CSR_NOP;
                csr_wdata_o = `ysyx_040654_Zero_Word;
                case(fun3)
                    `ysyx_040654_INST_ADDW_SUBW_MULW:begin
                        case({fun7[5],fun7[0]})
                            `ysyx_040654_INST_SUBW: begin
                                alu_op_o = `ysyx_040654_ALU_SUBW;
                            end
                            `ysyx_040654_INST_ADDW: begin
                                alu_op_o = `ysyx_040654_ALU_ADDW;
                            end
                            `ysyx_040654_INST_MULW: begin
                                alu_op_o = `ysyx_040654_ALU_MULW;
                            end
                            default: begin
                                alu_op_o = `ysyx_040654_ALU_NOP;
                            end
                        endcase
                    end
                    `ysyx_040654_INST_SLLW: begin
                        alu_op_o = `ysyx_040654_ALU_SLLW;
                    end
                    `ysyx_040654_INST_DIVW: begin
                        alu_op_o = `ysyx_040654_ALU_DIVW;
                    end
                    `ysyx_040654_INST_REMW: begin
                        alu_op_o = `ysyx_040654_ALU_REMW;
                    end
                    `ysyx_040654_INST_SRW_DIVUW: begin
                        case ({fun7[5],fun7[0]})
                            `ysyx_040654_INST_SRAW: alu_op_o = `ysyx_040654_ALU_SRAW;
                            `ysyx_040654_INST_SRLW: alu_op_o = `ysyx_040654_ALU_SRLW;
                            `ysyx_040654_INST_DIVUW: alu_op_o = `ysyx_040654_ALU_DIVUW;
                            default: alu_op_o = `ysyx_040654_ALU_NOP;
                        endcase
                    end
                    `ysyx_040654_INST_REMUW: begin
                        alu_op_o = `ysyx_040654_ALU_REMUW;
                    end
                    default: begin
                        alu_op_o = `ysyx_040654_ALU_NOP;
                    end
                endcase
            end 
            `ysyx_040654_INST_TYPE_S: begin
                reg_wen_o = 1'b0;
                reg_waddr_o = `ysyx_040654_RegZero;
                bju_pc_base_o = `ysyx_040654_Zero_HalfWord;
                bju_op_o = `ysyx_040654_BJU_NOP;
                bju_pc_offset_o = `ysyx_040654_Zero_HalfWord;
                src1_o = reg_rdata1_i;
                src2_o = imm_s;
                reg_ren1_o = 1'b1;
                reg_ren2_o = 1'b1;
                mem_wen_o = 1'b1;
                mem_ren_o = 1'b0; 
                mem_wdata_o = reg_rdata2_i;
                reg_raddr1_o = rs1;
                reg_raddr2_o = rs2;
                alu_op_o = `ysyx_040654_ALU_ADD;
                csr_op_o = `ysyx_040654_CSR_NOP;
                csr_wdata_o = `ysyx_040654_Zero_Word;
                case (fun3)
                    `ysyx_040654_INST_SD: begin
                        lsu_op_o = `ysyx_040654_LSU_SD;
                    end
                    `ysyx_040654_INST_SB: begin
                        lsu_op_o = `ysyx_040654_LSU_SB;
                    end
                    `ysyx_040654_INST_SW: begin
                        lsu_op_o = `ysyx_040654_LSU_SW;
                    end
                    `ysyx_040654_INST_SH: begin
                        lsu_op_o = `ysyx_040654_LSU_SH;
                    end
                    default: begin
                        lsu_op_o = `ysyx_040654_LSU_NOP;
                    end
                endcase
            end
            `ysyx_040654_INST_TYPE_B: begin
                alu_op_o = `ysyx_040654_ALU_NOP;
                lsu_op_o = `ysyx_040654_LSU_NOP;
                reg_wen_o = 1'b0;
                reg_waddr_o = `ysyx_040654_RegZero;
                mem_wen_o = 1'b0;
                mem_ren_o = 1'b0;
                mem_wdata_o = `ysyx_040654_Zero_Word;
                src1_o = reg_rdata1_i;
                src2_o = reg_rdata2_i;
                reg_ren1_o = 1'b1;
                reg_ren2_o = 1'b1;
                reg_raddr1_o = rs1;
                reg_raddr2_o = rs2;
                bju_pc_base_o = pc_i;
                bju_pc_offset_o = imm_b[31:0];
                csr_op_o = `ysyx_040654_CSR_NOP;
                csr_wdata_o = `ysyx_040654_Zero_Word;
                case(fun3)
                    `ysyx_040654_INST_BEQ: begin
                        bju_op_o = `ysyx_040654_BJU_BEQ;
                    end
                    `ysyx_040654_INST_BNE: begin
                        bju_op_o = `ysyx_040654_BJU_BNE;
                    end
                    `ysyx_040654_INST_BGE: begin
                        bju_op_o = `ysyx_040654_BJU_BGE;
                    end
                    `ysyx_040654_INST_BLT: begin
                        bju_op_o = `ysyx_040654_BJU_BLT;
                    end
                    `ysyx_040654_INST_BLTU: begin
                        bju_op_o = `ysyx_040654_BJU_BLTU;
                    end
                    `ysyx_040654_INST_BGEU: begin
                        bju_op_o = `ysyx_040654_BJU_BGEU;
                    end
                    default: begin
                        bju_op_o = `ysyx_040654_BJU_NOP;
                    end
                endcase
            end
            `ysyx_040654_INST_JAL: begin
                alu_op_o = `ysyx_040654_ALU_NOP;
                lsu_op_o = `ysyx_040654_LSU_NOP;
                reg_ren1_o = 1'b0;
                reg_ren2_o = 1'b0;
                reg_raddr1_o = `ysyx_040654_RegZero;
                reg_raddr2_o = `ysyx_040654_RegZero;
                mem_wen_o = 1'b0;
                mem_ren_o = 1'b0;
                mem_wdata_o = `ysyx_040654_Zero_Word;
                src1_o = `ysyx_040654_Zero_Word;
                src2_o = `ysyx_040654_Zero_Word;
                bju_op_o = `ysyx_040654_BJU_JAL;
                reg_wen_o = 1'b1;
                reg_waddr_o = rd;
                bju_pc_base_o = pc_i;
                bju_pc_offset_o = imm_j[31:0]; 
                csr_op_o = `ysyx_040654_CSR_NOP;
                csr_wdata_o = `ysyx_040654_Zero_Word;
            end
            `ysyx_040654_INST_AUIPC: begin
                lsu_op_o = `ysyx_040654_LSU_NOP;
                reg_ren1_o = 1'b0;
                reg_ren2_o = 1'b0;
                reg_raddr1_o = `ysyx_040654_RegZero;
                reg_raddr2_o = `ysyx_040654_RegZero;
                bju_pc_base_o = `ysyx_040654_Zero_HalfWord;
                mem_wen_o = 1'b0;
                mem_ren_o = 1'b0;
                mem_wdata_o = `ysyx_040654_Zero_Word;
                bju_op_o = `ysyx_040654_BJU_NOP;
                bju_pc_offset_o = `ysyx_040654_Zero_HalfWord;
                src1_o = {32'b0, pc_i};
                src2_o = imm_u;
                alu_op_o = `ysyx_040654_ALU_ADD;
                reg_wen_o = 1'b1;
                reg_waddr_o = rd;
                csr_op_o = `ysyx_040654_CSR_NOP;
                csr_wdata_o = `ysyx_040654_Zero_Word;
            end

            `ysyx_040654_INST_LUI: begin
                lsu_op_o = `ysyx_040654_LSU_NOP;
                reg_ren1_o = 1'b0;
                reg_ren2_o = 1'b0;
                reg_raddr1_o = `ysyx_040654_RegZero;
                reg_raddr2_o = `ysyx_040654_RegZero;
                bju_pc_base_o = `ysyx_040654_Zero_HalfWord;
                mem_wen_o = 1'b0;
                mem_ren_o = 1'b0;
                mem_wdata_o = `ysyx_040654_Zero_Word;
                bju_op_o = `ysyx_040654_BJU_NOP;
                bju_pc_offset_o = `ysyx_040654_Zero_HalfWord;
                src1_o = `ysyx_040654_Zero_Word;
                src2_o = imm_u;
                alu_op_o = `ysyx_040654_ALU_ADD;
                reg_wen_o = 1'b1;
                reg_waddr_o = rd;
                csr_op_o = `ysyx_040654_CSR_NOP;
                csr_wdata_o = `ysyx_040654_Zero_Word;
            end
            default:begin
                src1_o = `ysyx_040654_Zero_Word;
                src2_o = `ysyx_040654_Zero_Word;
                alu_op_o = `ysyx_040654_ALU_NOP;
                bju_op_o = `ysyx_040654_BJU_NOP;
                reg_ren1_o = 1'b0;
                reg_ren2_o = 1'b0;
                mem_wen_o = 1'b0;
                reg_wen_o = 1'b0;
                reg_raddr1_o = `ysyx_040654_RegZero;
                reg_raddr2_o = `ysyx_040654_RegZero;
                reg_waddr_o = `ysyx_040654_RegZero;
                bju_pc_base_o = `ysyx_040654_Zero_HalfWord;
                lsu_op_o = `ysyx_040654_LSU_NOP;
                mem_ren_o = 1'b0;
                mem_wdata_o = `ysyx_040654_Zero_Word;
                bju_pc_offset_o = `ysyx_040654_Zero_HalfWord;
                csr_op_o = `ysyx_040654_CSR_NOP;
                csr_wdata_o = `ysyx_040654_Zero_Word;
            end
        endcase
	end   

    
    
    assign opcode = inst_i[6:0];
    assign rd = inst_i[11:7];
    assign fun3 = inst_i[14:12];
    assign fun7 = inst_i[31:25];
    assign rs1 = inst_i[19:15];
    assign rs2 = inst_i[24:20];

    assign reg_wsel_o =    (csr_op_o != `ysyx_040654_CSR_NOP && csr_op_o != `ysyx_040654_CSR_ECALL && csr_op_o != `ysyx_040654_CSR_MRET) ? 2'b11 :
                            lsu_op_o != `ysyx_040654_LSU_NOP ? 2'b10 :
                            bju_op_o != `ysyx_040654_BJU_NOP ? 2'b01 :
                            2'b00;

    assign imm_i = {{52{inst_i[31]}}, inst_i[31:20]};
    assign imm_u = {{32{inst_i[31]}}, inst_i[31:12], {12{1'b0}}};
    assign imm_s = {{52{inst_i[31]}}, inst_i[31:25], inst_i[11:7]};
    assign imm_j = {{43{inst_i[31]}}, inst_i[31], inst_i[19:12], inst_i[20], inst_i[30:21], 1'b0};
    assign imm_b = {{51{inst_i[31]}}, inst_i[31], inst_i[7], inst_i[30:25], inst_i[11:8], 1'b0};
    assign imm_z = {{59{1'b0}},inst_i[19:15]};

    assign csr_rwaddr_o = (csr_op_o == `ysyx_040654_CSR_CSRRW || csr_op_o == `ysyx_040654_CSR_CSRRS || csr_op_o == `ysyx_040654_CSR_CSRRC || csr_op_o == `ysyx_040654_CSR_CSRRCI || csr_op_o == `ysyx_040654_CSR_CSRRSI || csr_op_o == `ysyx_040654_CSR_CSRRWI) ? inst_i[31:20] : 12'b0;
    assign cache_flush_flag_o = (inst_i == `ysyx_040654_INST_FENCEI);
endmodule


module ysyx_040654_ex_reg (
    input                           clk,
    input                           rstn,
    input   [3:0]                   ex_stall_flag_i,
    input                           ex_flush_flag_i,

    input   [`ysyx_040654_MemAddrBus]           ex_pc_i,
    input   [`ysyx_040654_InstBus]              ex_inst_i,
    input                           ex_mem_wen_i,
    input   [`ysyx_040654_DataBus]              ex_mem_wdata_i,
    input                           ex_mem_ren_i,
    input   [`ysyx_040654_LSU_OP-1:0]           ex_lsu_op_i,
    input                           ex_reg_wen_i,
    input   [1:0]                   ex_reg_wsel_i,
    input   [`ysyx_040654_RegAddrBus]           ex_reg_waddr_i,
    input   [`ysyx_040654_CSR_OP-1:0]           ex_csr_op_i,
    input   [`ysyx_040654_CsrAddrBus]           ex_csr_rwaddr_i,
    input   [`ysyx_040654_DataBus]              ex_csr_wdata_i,
    input   [`ysyx_040654_DataBus]              ex_bju_result_i,
    input   [`ysyx_040654_DataBus]              ex_alu_result_i,
    input   [`ysyx_040654_MemAddrBus]           ex_next_pc_i,
    input                           ex_cache_flush_flag_i,

    output   [`ysyx_040654_MemAddrBus]          mem_pc_o,
    output   [`ysyx_040654_InstBus]             mem_inst_o,
    output                          mem_mem_wen_o,
    output   [`ysyx_040654_DataBus]             mem_mem_wdata_o,
    output                          mem_mem_ren_o,
    output   [`ysyx_040654_MemAddrBus]          mem_mem_rwaddr_o,
    output   [`ysyx_040654_LSU_OP-1:0]          mem_lsu_op_o,
    output                          mem_reg_wen_o,
    output   [1:0]                  mem_reg_wsel_o,
    output   [`ysyx_040654_RegAddrBus]          mem_reg_waddr_o,
    output   [`ysyx_040654_CSR_OP-1:0]          mem_csr_op_o,
    output   [`ysyx_040654_CsrAddrBus]          mem_csr_rwaddr_o,
    output   [`ysyx_040654_DataBus]             mem_csr_wdata_o,
    output   [`ysyx_040654_DataBus]             mem_bju_result_o,
    output   [`ysyx_040654_DataBus]             mem_alu_result_o,
    output   [`ysyx_040654_MemAddrBus]          mem_next_pc_o,
    output                          mem_cache_flush_flag_o
);
    reg   [`ysyx_040654_MemAddrBus]          pc_r;
    reg   [`ysyx_040654_InstBus]             inst_r;
    reg                          mem_wen_r;
    reg   [`ysyx_040654_DataBus]             mem_wdata_r;
    reg                          mem_ren_r;
    reg   [`ysyx_040654_LSU_OP-1:0]          lsu_op_r;
    reg                          reg_wen_r;
    reg   [1:0]                  reg_wsel_r;
    reg   [`ysyx_040654_RegAddrBus]          reg_waddr_r;
    reg   [`ysyx_040654_CSR_OP-1:0]          csr_op_r;
    reg   [`ysyx_040654_CsrAddrBus]          csr_rwaddr_r;
    reg   [`ysyx_040654_DataBus]             csr_wdata_r;
    reg   [`ysyx_040654_DataBus]             bju_result_r;
    reg   [`ysyx_040654_DataBus]             alu_result_r;
    reg   [`ysyx_040654_MemAddrBus]          mem_rwaddr_r;
    reg   [`ysyx_040654_MemAddrBus]          next_pc_r;
    reg                          cache_flush_flag_r;
    always @(posedge clk) begin
        if(!rstn) begin
            pc_r <= `ysyx_040654_Zero_HalfWord;
            inst_r <= `ysyx_040654_INST_NOP;
            mem_wen_r <= 1'b0;
            mem_wdata_r <= `ysyx_040654_Zero_Word;
            mem_ren_r <= 1'b0;
            lsu_op_r <= `ysyx_040654_LSU_NOP;
            reg_wen_r <= 1'b0;
            reg_wsel_r <= 2'b0;
            reg_waddr_r <= `ysyx_040654_RegZero;
            csr_op_r <= `ysyx_040654_CSR_NOP;
            csr_rwaddr_r <= 12'b0;
            csr_wdata_r <= `ysyx_040654_Zero_Word;
            bju_result_r <= `ysyx_040654_Zero_Word;
            alu_result_r <= `ysyx_040654_Zero_Word;
            mem_rwaddr_r <= `ysyx_040654_Zero_HalfWord;
            next_pc_r <= `ysyx_040654_MEM_START;
            cache_flush_flag_r <= 1'b0;
        end else begin
            if(ex_flush_flag_i) begin
                pc_r <= `ysyx_040654_Zero_HalfWord;
                inst_r <= `ysyx_040654_INST_NOP;
                mem_wen_r <= 1'b0;
                mem_wdata_r <= `ysyx_040654_Zero_Word;
                mem_ren_r <= 1'b0;
                lsu_op_r <= `ysyx_040654_LSU_NOP;
                reg_wen_r <= 1'b1;
                reg_wsel_r <= 2'b0;
                reg_waddr_r <= `ysyx_040654_RegZero;
                csr_op_r <= `ysyx_040654_CSR_NOP;
                csr_rwaddr_r <= 12'b0;
                csr_wdata_r <= `ysyx_040654_Zero_Word;
                bju_result_r <= `ysyx_040654_Zero_Word;
                alu_result_r <= `ysyx_040654_Zero_Word;
                mem_rwaddr_r <= `ysyx_040654_Zero_HalfWord;
                next_pc_r <= `ysyx_040654_Zero_HalfWord;
                cache_flush_flag_r <= 1'b0;
            end else if(!ex_stall_flag_i[2]) begin
                pc_r <= ex_pc_i;
                inst_r <= ex_inst_i;
                mem_wen_r <= ex_mem_wen_i;
                mem_wdata_r <= ex_mem_wdata_i;
                mem_ren_r <= ex_mem_ren_i;
                lsu_op_r <= ex_lsu_op_i;
                reg_wen_r <= ex_reg_wen_i;
                reg_wsel_r <= ex_reg_wsel_i;
                reg_waddr_r <= ex_reg_waddr_i;
                csr_op_r <= ex_csr_op_i;
                csr_rwaddr_r <= ex_csr_rwaddr_i;
                csr_wdata_r <= ex_csr_wdata_i;
                bju_result_r <= ex_bju_result_i;
                alu_result_r <= ex_alu_result_i;
                mem_rwaddr_r <= ex_alu_result_i[31:0];
                next_pc_r <= ex_next_pc_i;
                cache_flush_flag_r <= ex_cache_flush_flag_i;
            end else if(ex_stall_flag_i[2] && ex_stall_flag_i == 4'b0111) begin
                pc_r <= `ysyx_040654_Zero_HalfWord;
                inst_r <= `ysyx_040654_INST_NOP;
                mem_wen_r <= 1'b0;
                mem_wdata_r <= `ysyx_040654_Zero_Word;
                mem_ren_r <= 1'b0;
                lsu_op_r <= `ysyx_040654_LSU_NOP;
                reg_wen_r <= 1'b0;
                reg_wsel_r <= 2'b0;
                reg_waddr_r <= `ysyx_040654_RegZero;
                csr_op_r <= `ysyx_040654_CSR_NOP;
                csr_rwaddr_r <= 12'b0;
                csr_wdata_r <= `ysyx_040654_Zero_Word;
                bju_result_r <= `ysyx_040654_Zero_Word;
                alu_result_r <= `ysyx_040654_Zero_Word;
                mem_rwaddr_r <= `ysyx_040654_MEM_START;
                next_pc_r <= `ysyx_040654_Zero_HalfWord;
                cache_flush_flag_r <= 1'b0;
            end
        end
    end
    
    assign mem_pc_o = pc_r;
    assign mem_inst_o = inst_r;
    assign mem_mem_wen_o = mem_wen_r;
    assign mem_mem_wdata_o = mem_wdata_r;
    assign mem_mem_ren_o = mem_ren_r;
    assign mem_lsu_op_o = lsu_op_r;
    assign mem_reg_wen_o = reg_wen_r;
    assign mem_reg_wsel_o = reg_wsel_r;
    assign mem_reg_waddr_o = reg_waddr_r;
    assign mem_csr_op_o = csr_op_r;
    assign mem_csr_rwaddr_o = csr_rwaddr_r;
    assign mem_csr_wdata_o = csr_wdata_r;
    assign mem_bju_result_o = bju_result_r;
    assign mem_alu_result_o = alu_result_r;
    assign mem_mem_rwaddr_o = mem_rwaddr_r;
    assign mem_next_pc_o = next_pc_r;
    assign mem_cache_flush_flag_o = cache_flush_flag_r;
endmodule



module ysyx_040654_ex_stage (
    input                     clk,
    input                     rstn,
    input                     ex_stall_flag_i,
    input   [`ysyx_040654_ALU_OP-1:0]     ex_alu_op_i,
    input   [`ysyx_040654_DataBus]        ex_src1_i,
    input   [`ysyx_040654_DataBus]        ex_src2_i,
    output                    ex_alu_busy_flag_o,
    output  [`ysyx_040654_DataBus]        ex_alu_result_o
);
    reg     [`ysyx_040654_DataBus]          ex_alu_result_r;
    reg                         ex_finsih_r;
    wire    [`ysyx_040654_ALU_OP-1:0]       ex_alu_op;
    wire                        ex_alu_mul_div;
    wire    [`ysyx_040654_DataBus]          ex_alu_result;
    
    ysyx_040654_alu ex_alu(
        .clk             (clk                   ),
        .rstn            (rstn                  ),
        .alu_src1_i      (ex_src1_i             ),
        .alu_src2_i      (ex_src2_i             ),
        .alu_op_i        (ex_alu_op             ),
        .alu_busy_flag_o (ex_alu_busy_flag_o    ),
        .alu_result_o    (ex_alu_result         )
    );

    always @(posedge clk) begin
        if(!rstn) begin
            ex_finsih_r <= 1'b0;
            ex_alu_result_r <= 64'b0;
        end else begin
            if(ex_alu_mul_div && !ex_alu_busy_flag_o && ex_stall_flag_i) begin
                ex_finsih_r <= 1'b1;
                ex_alu_result_r <= ex_alu_result;
            end else if(!ex_stall_flag_i)begin
                ex_finsih_r <= 1'b0;
                ex_alu_result_r <= 64'b0;
            end
        end
    end
    assign ex_alu_mul_div = (ex_alu_op_i == `ysyx_040654_ALU_MUL || ex_alu_op_i == `ysyx_040654_ALU_MULW || ex_alu_op_i == `ysyx_040654_ALU_MULH || ex_alu_op_i == `ysyx_040654_ALU_MULHU ||ex_alu_op_i == `ysyx_040654_ALU_MULHSU ||
                            ex_alu_op_i == `ysyx_040654_ALU_DIV || ex_alu_op_i == `ysyx_040654_ALU_DIVU || ex_alu_op_i == `ysyx_040654_ALU_DIVUW || ex_alu_op_i == `ysyx_040654_ALU_DIVW ||
                            ex_alu_op_i == `ysyx_040654_ALU_REM || ex_alu_op_i == `ysyx_040654_ALU_REMU || ex_alu_op_i == `ysyx_040654_ALU_REMUW || ex_alu_op_i == `ysyx_040654_ALU_REMW );
    assign ex_alu_op = (ex_alu_mul_div && ex_finsih_r) ? `ysyx_040654_ALU_ADD : ex_alu_op_i;
    assign ex_alu_result_o =    (ex_finsih_r && ex_stall_flag_i) ? ex_alu_result_r :
                                ex_alu_result;

endmodule



module ysyx_040654_id_reg (
    input                       clk,
    input                       rstn,
    input                       id_flush_flag_i,
    input   [3:0]               id_stall_flag_i,

    input   [`ysyx_040654_MemAddrBus]       id_pc_i,
    input   [`ysyx_040654_InstBus]          id_inst_i,
    input   [`ysyx_040654_DataBus]          id_src1_i,
    input   [`ysyx_040654_DataBus]          id_src2_i,
    input   [`ysyx_040654_ALU_OP-1:0]       id_alu_op_i,
    input                       id_mem_wen_i,
    input   [`ysyx_040654_DataBus]          id_mem_wdata_i,
    input                       id_mem_ren_i,
    input   [`ysyx_040654_LSU_OP-1:0]       id_lsu_op_i,
    input                       id_reg_wen_i,
    input   [1:0]               id_reg_wsel_i,
    input   [`ysyx_040654_RegAddrBus]       id_reg_waddr_i,
    input   [`ysyx_040654_CSR_OP-1:0]       id_csr_op_i,
    input   [`ysyx_040654_CsrAddrBus]       id_csr_rwaddr_i,
    input   [`ysyx_040654_DataBus]          id_csr_wdata_i,
    input   [`ysyx_040654_DataBus]          id_bju_result_i,
    input   [`ysyx_040654_MemAddrBus]       id_next_pc_i,
    input                       id_cache_flush_flag_i,

    output  [`ysyx_040654_MemAddrBus]       ex_pc_o,
    output  [`ysyx_040654_InstBus]          ex_inst_o,
    output  [`ysyx_040654_DataBus]          ex_src1_o,
    output  [`ysyx_040654_DataBus]          ex_src2_o,
    output  [`ysyx_040654_ALU_OP-1:0]       ex_alu_op_o,
    output                      ex_mem_wen_o,
    output  [`ysyx_040654_DataBus]          ex_mem_wdata_o,
    output                      ex_mem_ren_o,
    output  [`ysyx_040654_LSU_OP-1:0]       ex_lsu_op_o,
    output                      ex_reg_wen_o,
    output  [1:0]               ex_reg_wsel_o,
    output  [`ysyx_040654_RegAddrBus]       ex_reg_waddr_o,
    output  [`ysyx_040654_CSR_OP-1:0]       ex_csr_op_o,
    output  [`ysyx_040654_CsrAddrBus]       ex_csr_rwaddr_o,
    output  [`ysyx_040654_DataBus]          ex_csr_wdata_o,
    output  [`ysyx_040654_DataBus]          ex_bju_result_o,
    output  [`ysyx_040654_MemAddrBus]       ex_next_pc_o,
    output                      ex_cache_flush_flag_o
);
    reg [`ysyx_040654_DataBus]      src1_r, src2_r;
    reg [`ysyx_040654_ALU_OP-1:0]   alu_op_r;
    reg                 mem_wen_r, mem_ren_r;
    reg [`ysyx_040654_DataBus]      mem_wdata_r;
    reg [`ysyx_040654_LSU_OP-1:0]   lsu_op_r;
    reg                 reg_wen_r;
    reg [1:0]           reg_wsel_r;
    reg [`ysyx_040654_RegAddrBus]   reg_waddr_r;
    reg [`ysyx_040654_MemAddrBus]   pc_r;
    reg [`ysyx_040654_InstBus]      inst_r;
    reg [`ysyx_040654_CSR_OP-1:0]   csr_op_r;
    reg [`ysyx_040654_CsrAddrBus]   csr_rwaddr_r;
    reg [`ysyx_040654_DataBus]      csr_wdata_r;
    reg [`ysyx_040654_DataBus]      bju_result_r;
    reg [`ysyx_040654_MemAddrBus]   next_pc_r;
    reg                 cache_flush_flag_r;      

    always @(posedge clk) begin
        if(!rstn) begin
            src1_r <= `ysyx_040654_Zero_Word;
            src2_r <= `ysyx_040654_Zero_Word;
            alu_op_r <= `ysyx_040654_ALU_NOP;
            lsu_op_r <= `ysyx_040654_LSU_NOP;
            mem_wen_r <= 1'b0;
            mem_ren_r <= 1'b0;
            mem_wdata_r <= `ysyx_040654_Zero_Word;
            reg_wen_r <= 1'b0;
            reg_wsel_r <= 2'b0;
            reg_waddr_r <= `ysyx_040654_RegZero;
            pc_r <= `ysyx_040654_Zero_HalfWord;
            inst_r <= `ysyx_040654_INST_NOP;
            csr_op_r <= `ysyx_040654_CSR_NOP;
            csr_rwaddr_r <= 12'b0;
            csr_wdata_r <= `ysyx_040654_Zero_Word;
            bju_result_r <= `ysyx_040654_Zero_Word;
            next_pc_r <= `ysyx_040654_MEM_START;
            cache_flush_flag_r <= 1'b0;
        end else begin
            if(id_flush_flag_i) begin
                src1_r <= `ysyx_040654_Zero_Word;
                src2_r <= `ysyx_040654_Zero_Word;
                alu_op_r <= `ysyx_040654_ALU_NOP;
                lsu_op_r <= `ysyx_040654_LSU_NOP;
                mem_wen_r <= 1'b0;
                mem_ren_r <= 1'b0;
                mem_wdata_r <= `ysyx_040654_Zero_Word;
                reg_wen_r <= 1'b0;
                reg_wsel_r <= 2'b0;
                reg_waddr_r <= `ysyx_040654_RegZero;
                pc_r <= `ysyx_040654_Zero_HalfWord;
                inst_r <= `ysyx_040654_INST_NOP;
                csr_op_r <= `ysyx_040654_CSR_NOP;
                csr_rwaddr_r <= 12'b0;
                csr_wdata_r <= `ysyx_040654_Zero_Word;
                bju_result_r <= `ysyx_040654_Zero_Word;
                next_pc_r <= `ysyx_040654_Zero_HalfWord;
                cache_flush_flag_r <= 1'b0;
            end else if(!id_stall_flag_i[1]) begin
                src1_r <= id_src1_i;
                src2_r <= id_src2_i;
                alu_op_r <= id_alu_op_i;
                lsu_op_r <= id_lsu_op_i;
                mem_wen_r <= id_mem_wen_i;
                mem_ren_r <= id_mem_ren_i;
                mem_wdata_r <= id_mem_wdata_i;
                reg_wen_r <= id_reg_wen_i;
                reg_wsel_r <= id_reg_wsel_i;
                reg_waddr_r <= id_reg_waddr_i;
                pc_r <= id_pc_i;
                inst_r <= id_inst_i;
                csr_op_r <= id_csr_op_i;
                csr_rwaddr_r <= id_csr_rwaddr_i;
                csr_wdata_r <= id_csr_wdata_i;
                bju_result_r <= id_bju_result_i;
                next_pc_r <= id_next_pc_i;
                cache_flush_flag_r <= id_cache_flush_flag_i;
            end else if(id_stall_flag_i[1] && id_stall_flag_i == 4'b0011) begin
                src1_r <= `ysyx_040654_Zero_Word;
                src2_r <= `ysyx_040654_Zero_Word;
                alu_op_r <= `ysyx_040654_ALU_NOP;
                lsu_op_r <= `ysyx_040654_LSU_NOP;
                mem_wen_r <= 1'b0;
                mem_ren_r <= 1'b0;
                mem_wdata_r <= `ysyx_040654_Zero_Word;
                reg_wen_r <= 1'b0;
                reg_wsel_r <= 2'b0;
                reg_waddr_r <= `ysyx_040654_RegZero;
                pc_r <= `ysyx_040654_Zero_HalfWord;
                inst_r <= `ysyx_040654_INST_NOP;
                csr_op_r <= `ysyx_040654_CSR_NOP;
                csr_rwaddr_r <= 12'b0;
                csr_wdata_r <= `ysyx_040654_Zero_Word;
                bju_result_r <= `ysyx_040654_Zero_Word;
                next_pc_r <= `ysyx_040654_Zero_HalfWord;
                cache_flush_flag_r <= 1'b0;
            end
        end
    end

    assign ex_pc_o = pc_r;
    assign ex_inst_o = inst_r;
    assign ex_src1_o = src1_r;
    assign ex_src2_o = src2_r;
    assign ex_alu_op_o = alu_op_r;
    assign ex_mem_wen_o = mem_wen_r;
    assign ex_mem_wdata_o = mem_wdata_r;
    assign ex_mem_ren_o = mem_ren_r;
    assign ex_lsu_op_o = lsu_op_r;
    assign ex_reg_wen_o = reg_wen_r;
    assign ex_reg_wsel_o = reg_wsel_r;
    assign ex_reg_waddr_o = reg_waddr_r;
    assign ex_csr_op_o = csr_op_r;
    assign ex_csr_rwaddr_o = csr_rwaddr_r;
    assign ex_csr_wdata_o = csr_wdata_r;
    assign ex_bju_result_o = bju_result_r;
    assign ex_next_pc_o = next_pc_r;
    assign ex_cache_flush_flag_o = cache_flush_flag_r;
endmodule



module ysyx_040654_id_stage (
    input   [`ysyx_040654_MemAddrBus]           id_pc_i,
    input   [`ysyx_040654_InstBus]              id_inst_i,
    input   [`ysyx_040654_DataBus]              id_reg_rdata1_i, 
    input   [`ysyx_040654_DataBus]              id_reg_rdata2_i,
    output  [`ysyx_040654_RegAddrBus]           id_reg_raddr1_o, 
    output  [`ysyx_040654_RegAddrBus]           id_reg_raddr2_o,
    output                          id_reg_ren1_o, 
    output                          id_reg_ren2_o,

    output  [`ysyx_040654_DataBus]              id_src1_o,
    output  [`ysyx_040654_DataBus]              id_src2_o,
    output  [`ysyx_040654_ALU_OP-1:0]           id_alu_op_o,
    output                          id_mem_wen_o,
    output  [`ysyx_040654_DataBus]              id_mem_wdata_o,
    output                          id_mem_ren_o,
    output  [`ysyx_040654_LSU_OP-1:0]           id_lsu_op_o,
    output                          id_reg_wen_o,
    output  [1:0]                   id_reg_wsel_o,
    output  [`ysyx_040654_RegAddrBus]           id_reg_waddr_o, 
    output  [`ysyx_040654_CSR_OP-1:0]           id_csr_op_o,
    output  [`ysyx_040654_CsrAddrBus]           id_csr_rwaddr_o,
    output  [`ysyx_040654_DataBus]              id_csr_wdata_o,
    output                          id_branch_flag_o,
    output  [`ysyx_040654_MemAddrBus]           id_branch_addr_o,
    output  [`ysyx_040654_DataBus]              id_bju_result_o,
    output  [`ysyx_040654_BJU_OP-1:0]           id_bju_op_o,
    output  [`ysyx_040654_MemAddrBus]           id_next_pc_o,
    output                          id_cache_flush_flag_o
);  
    
    wire  [`ysyx_040654_MemAddrBus]           id_bju_pc_base;
    wire  [`ysyx_040654_MemAddrBus]           id_bju_pc_offset;
    wire  [`ysyx_040654_DataBus]              id_bju_src1, id_bju_src2;
    
    ysyx_040654_decoder id_decoder (
        .inst_i             (id_inst_i              ),
        .pc_i               (id_pc_i                ),
        .reg_rdata1_i       (id_reg_rdata1_i        ),
        .reg_rdata2_i       (id_reg_rdata2_i        ),
        .reg_raddr1_o       (id_reg_raddr1_o        ),
        .reg_raddr2_o       (id_reg_raddr2_o        ),
        .reg_ren1_o         (id_reg_ren1_o          ),
        .reg_ren2_o         (id_reg_ren2_o          ),
        .src1_o             (id_src1_o              ),
        .src2_o             (id_src2_o              ),
        .alu_op_o           (id_alu_op_o            ),
        .bju_op_o           (id_bju_op_o            ),
        .bju_pc_base_o      (id_bju_pc_base         ),
        .bju_pc_offset_o    (id_bju_pc_offset       ),
        .mem_wen_o          (id_mem_wen_o           ),
        .mem_wdata_o        (id_mem_wdata_o         ),
        .mem_ren_o          (id_mem_ren_o           ),
        .lsu_op_o           (id_lsu_op_o            ),
        .reg_wen_o          (id_reg_wen_o           ),
        .reg_wsel_o         (id_reg_wsel_o          ),
        .reg_waddr_o        (id_reg_waddr_o         ),
        .csr_op_o           (id_csr_op_o            ),
        .csr_rwaddr_o       (id_csr_rwaddr_o        ),
        .csr_wdata_o        (id_csr_wdata_o         ),
        .cache_flush_flag_o (id_cache_flush_flag_o  )
    );

    ysyx_040654_bju id_bju(
    	.bju_op_i        (id_bju_op_o        ),
        .bju_pc_base_i   (id_bju_pc_base     ),
        .bju_pc_offset_i (id_bju_pc_offset   ),
        .bju_pc_i        (id_pc_i            ),
        .bju_src1_i      (id_bju_src1        ),
        .bju_src2_i      (id_bju_src2        ),
        .branch_addr_o   (id_branch_addr_o   ),
        .branch_flag_o   (id_branch_flag_o   ),
        .bju_result_o    (id_bju_result_o    )
    );
    
    assign id_bju_src1 = (id_bju_op_o != `ysyx_040654_BJU_NOP) ? id_src1_o : 64'b0;
    assign id_bju_src2 = (id_bju_op_o != `ysyx_040654_BJU_NOP) ? id_src2_o : 64'b0;
    assign id_next_pc_o = (id_bju_op_o != `ysyx_040654_BJU_NOP && id_branch_flag_o) ? id_branch_addr_o : id_pc_i + 4;
endmodule



module ysyx_040654_if_reg (
    input                       clk,
    input                       rstn,
    input                       if_flush_flag_i,
    input   [3:0]               if_stall_flag_i,
    input   [`ysyx_040654_MemAddrBus]       if_pc_i,
    output  [`ysyx_040654_MemAddrBus]       id_pc_o,
    input   [`ysyx_040654_InstBus]          if_inst_i,
    output  [`ysyx_040654_InstBus]          id_inst_o    
);
    reg [`ysyx_040654_MemAddrBus]   pc_r;
    reg [`ysyx_040654_InstBus]      inst_r;
    always @(posedge clk) begin
        if(!rstn) begin
            pc_r <=  `ysyx_040654_Zero_HalfWord;
            inst_r <= `ysyx_040654_INST_NOP;
        end else begin
            if(if_flush_flag_i) begin
                pc_r <=  `ysyx_040654_Zero_HalfWord;
                inst_r <= `ysyx_040654_INST_NOP;
            end else if(!if_stall_flag_i[0]) begin
                pc_r <= if_pc_i;
                inst_r <= if_inst_i;
            end else if(if_stall_flag_i[0] && if_stall_flag_i == 4'b0001) begin
                pc_r <= `ysyx_040654_Zero_HalfWord;
                inst_r <= `ysyx_040654_INST_NOP;
            end
        end
    end
    assign id_pc_o = pc_r;
    assign id_inst_o = inst_r;
endmodule



module ysyx_040654_if_stage (
    input                    clk,
    input                    rstn,
    input                    if_branch_flag_i,
    input                    if_excp_flag_i,
    input                    if_stall_flag_i,
    input   [`ysyx_040654_MemAddrBus]    if_branch_pc_i,
    input   [`ysyx_040654_MemAddrBus]    if_excp_pc_i,
    output  [`ysyx_040654_MemAddrBus]    if_pc_o,
    output  [`ysyx_040654_InstBus]       if_inst_o,
    input                    if_read_valid_i,

    output                   if_imem_axi_read_valid_o,
    input                    if_imem_axi_read_ready_i,
    input   [`ysyx_040654_DataBus]       if_imem_axi_read_data_i,
    output  [`ysyx_040654_MemAddrBus]    if_imem_axi_read_addr_o,
    input                    if_imem_axi_read_last_i,

    output                   if_device_axi_read_valid_o,
    input                    if_device_axi_read_ready_i,
    output  [`ysyx_040654_MemAddrBus]    if_device_axi_read_addr_o,
    input   [`ysyx_040654_DataBus]       if_device_axi_read_data_i,

    output                   if_icache_cen_o,
    output                   if_icache_wen_o,
    output  [`ysyx_040654_CacheBus]      if_icache_bwen_o,
    output  [`ysyx_040654_CacheAddrBus]  if_icache_addr_o,
    output  [`ysyx_040654_CacheBus]      if_icache_wdata_o,
    output  [3:0]            if_icache_sel_o,                   
    input   [`ysyx_040654_CacheBus]      if_icache_rdata_i,
    output                   if_busy_flag_o,
    input                    if_fencei_flag_i,
    input   [`ysyx_040654_MemAddrBus]    if_fencei_pc_i
);
    wire    [`ysyx_040654_MemAddrBus]    if_imem_raddr;
    wire                     if_icache_read_valid;
    wire                     if_icache_read_ready;
    wire    [`ysyx_040654_DataBus]       if_icache_read_data;
    wire                     if_read_valid;
    wire                     if_read_ready;
    wire    [`ysyx_040654_DataBus]       if_read_data;
    reg                      if_finsih_r;
    reg     [`ysyx_040654_InstBus]       if_inst_r;
    wire                     if_write_ready;
    wire                     if_axi_write_valid;
    wire    [`ysyx_040654_MemAddrBus]    if_axi_write_addr;
    wire    [`ysyx_040654_DataBus]       if_axi_write_data;
    wire    [7:0]            if_axi_write_mask;
    wire                     if_icache_flush_ready;
    ysyx_040654_pc if_pc(
        .clk           (clk              ),
        .rstn          (rstn             ),
        .branch_flag_i (if_branch_flag_i ),
        .excp_flag_i   (if_excp_flag_i   ),
        .fencei_flag_i (if_fencei_flag_i ),
        .stall_flag_i  (if_stall_flag_i  ),
        .branch_pc_i   (if_branch_pc_i   ),
        .excp_pc_i     (if_excp_pc_i     ),
        .fencei_pc_i   (if_fencei_pc_i   ),
        .pc_o          (if_pc_o          )
    );
    
    ysyx_040654_cache_ctrl if_icache_ctrl(
    	.clk                     (clk                     ),
        .rstn                    (rstn                    ),
        .lsu_op_i                (`ysyx_040654_LSU_NOP                ),
        .read_valid_i            (if_icache_read_valid    ),
        .read_ready_o            (if_icache_read_ready    ),
        .read_addr_i             (if_imem_raddr           ),
        .read_data_o             (if_icache_read_data     ),
        .write_valid_i           (1'b0                    ),
        .write_ready_o           (if_write_ready          ),
        .write_addr_i            (32'b0                   ),
        .write_data_i            (64'b0                   ),
        .write_mask_i            (8'b0                    ),
        .axi_read_valid_o        (if_imem_axi_read_valid_o     ),
        .axi_read_ready_i        (if_imem_axi_read_ready_i     ),
        .axi_read_data_i         (if_imem_axi_read_data_i      ),
        .axi_read_addr_o         (if_imem_axi_read_addr_o      ),
        .axi_read_last_i         (if_imem_axi_read_last_i      ),
        .axi_write_valid_o       (if_axi_write_valid      ),
        .axi_write_ready_i       (1'b0                    ),
        .axi_write_addr_o        (if_axi_write_addr       ),
        .axi_write_data_o        (if_axi_write_data       ),
        .axi_write_mask_o        (if_axi_write_mask       ),
        .axi_write_last_i        (1'b0                    ),
        .axi_write_resp_i        (1'b0                    ),
        .cache_cen_o             (if_icache_cen_o         ),
        .cache_wen_o             (if_icache_wen_o         ),
        .cache_bwen_o            (if_icache_bwen_o        ),
        .cache_addr_o            (if_icache_addr_o        ),
        .cache_wdata_o           (if_icache_wdata_o       ),
        .cache_sel_o             (if_icache_sel_o         ),
        .cache_rdata_i           (if_icache_rdata_i       ),
        .cache_flush_valid_i     (1'b0                    ),
        .cache_flush_ready_o     (if_icache_flush_ready   )
    );
    

    always @(posedge clk) begin
        if(!rstn) begin
            if_finsih_r <= 1'b0;
            if_inst_r <= 32'b0;
        end else begin
            if(if_read_valid && if_read_ready && if_stall_flag_i) begin
                if_finsih_r <= 1'b1;
                if_inst_r <= if_imem_raddr[2] ? if_read_data[63:32] : if_read_data[31:0];
            end else if(!if_stall_flag_i) begin
                if_finsih_r <= 1'b0;
                if_inst_r <= 32'b0;
            end
        end
    end

    assign if_imem_raddr = if_pc_o;
    assign if_inst_o =  if_finsih_r ? if_inst_r : 
                        if_pc_o[2] ?  if_read_data[63:32] : 
                        if_read_data[31:0];
    
    assign if_read_data =   (if_icache_read_valid) ? if_icache_read_data :
                            (if_device_axi_read_valid_o) ? if_device_axi_read_data_i :
                            64'b0;
    assign if_read_valid = if_finsih_r ? 1'b0 : if_read_valid_i;
    assign if_read_ready = if_icache_read_valid ? if_icache_read_ready :
                            if_device_axi_read_valid_o ? if_device_axi_read_ready_i :
                            1'b0;
    assign if_icache_read_valid = if_read_valid && ((if_imem_raddr >= `ysyx_040654_MEM_START && if_imem_raddr <= `ysyx_040654_MEM_END) || (if_imem_raddr >= `ysyx_040654_SDRAM_START && if_imem_raddr < `ysyx_040654_SDRAM_END));
    assign if_device_axi_read_valid_o = if_read_valid && if_imem_raddr < `ysyx_040654_MEM_START;
    assign if_device_axi_read_addr_o = if_imem_raddr;

    assign if_busy_flag_o = (if_read_valid && !if_read_ready);
endmodule



module ysyx_040654_lsu (
    // from decodr
    input [`ysyx_040654_LSU_OP-1:0] lsu_op_i,
    // INST_L
    input [`ysyx_040654_MemAddrBus] mem_raddr_i,            // from alu
    input [`ysyx_040654_DataBus] mem_rdata_i,               // from mem (mem_read_data)
    output reg [`ysyx_040654_RegBus] mem_rdata_o,           // write_addr(rd)     
    // INST_S

    input [`ysyx_040654_MemAddrBus] mem_waddr_i,            // from alu
    input [`ysyx_040654_DataBus] mem_wdata_i,
    output reg [`ysyx_040654_DataBus] mem_wdata_o,
    output reg [7:0] mem_wmask_o
);
    wire [2:0] mem_read_addr_index;
    wire [2:0] mem_write_addr_index;
    
    always @(*) begin
        case(lsu_op_i)
            `ysyx_040654_LSU_LD: begin
                mem_rdata_o = mem_rdata_i;
                mem_wmask_o = 8'b00000000;
                mem_wdata_o = `ysyx_040654_Zero_Word;
            end
            `ysyx_040654_LSU_LW: begin
                mem_wmask_o = 8'b00000000;
                mem_wdata_o = `ysyx_040654_Zero_Word;
                case(mem_read_addr_index[2])
                    1'b1: begin
                        mem_rdata_o = {{32{mem_rdata_i[63]}}, mem_rdata_i[63:32]};
                    end
                    default: begin
                        mem_rdata_o = {{32{mem_rdata_i[31]}}, mem_rdata_i[31:0]};
                    end
                endcase
            end
            `ysyx_040654_LSU_LWU: begin
                mem_wmask_o = 8'b00000000;
                mem_wdata_o = `ysyx_040654_Zero_Word;
                case(mem_read_addr_index[2])
                    1'b1: begin
                        mem_rdata_o = {{32{1'b0}}, mem_rdata_i[63:32]};
                    end
                    default: begin
                        mem_rdata_o = {{32{1'b0}}, mem_rdata_i[31:0]};
                    end
                endcase
            end
            `ysyx_040654_LSU_LH: begin
                mem_wmask_o = 8'b00000000;
                mem_wdata_o = `ysyx_040654_Zero_Word;
                case(mem_read_addr_index[2:1])
                    2'b11: begin
                        mem_rdata_o = {{48{mem_rdata_i[63]}}, mem_rdata_i[63:48]};
                    end
                    2'b10: begin
                        mem_rdata_o = {{48{mem_rdata_i[47]}}, mem_rdata_i[47:32]};
                    end
                    2'b01: begin
                        mem_rdata_o = {{48{mem_rdata_i[31]}}, mem_rdata_i[31:16]};
                    end
                    default: begin
                        mem_rdata_o = {{48{mem_rdata_i[15]}}, mem_rdata_i[15:0]};
                    end
                endcase
            end
            `ysyx_040654_LSU_LHU: begin
                mem_wmask_o = 8'b00000000;
                mem_wdata_o = `ysyx_040654_Zero_Word;
                case(mem_read_addr_index[2:1])
                    2'b11: begin
                        mem_rdata_o = {{48{1'b0}}, mem_rdata_i[63:48]};
                    end
                    2'b10: begin
                        mem_rdata_o = {{48{1'b0}}, mem_rdata_i[47:32]};
                    end
                    2'b01: begin
                        mem_rdata_o = {{48{1'b0}}, mem_rdata_i[31:16]};
                    end
                    default: begin
                        mem_rdata_o = {{48{1'b0}}, mem_rdata_i[15:0]};
                    end
                endcase
            end
            `ysyx_040654_LSU_LB: begin
                mem_wmask_o = 8'b00000000;
                mem_wdata_o = `ysyx_040654_Zero_Word;
                case(mem_read_addr_index)
                    3'b111: begin
                        mem_rdata_o = {{56{mem_rdata_i[63]}}, mem_rdata_i[63:56]};
                    end
                    3'b110: begin
                        mem_rdata_o = {{56{mem_rdata_i[55]}}, mem_rdata_i[55:48]};
                    end
                    3'b101: begin
                        mem_rdata_o = {{56{mem_rdata_i[47]}}, mem_rdata_i[47:40]};
                    end
                    3'b100: begin
                        mem_rdata_o = {{56{mem_rdata_i[39]}}, mem_rdata_i[39:32]};
                    end
                    3'b011: begin
                        mem_rdata_o = {{56{mem_rdata_i[31]}}, mem_rdata_i[31:24]};
                    end
                    3'b010: begin
                        mem_rdata_o = {{56{mem_rdata_i[23]}}, mem_rdata_i[23:16]};
                    end
                    3'b001: begin
                        mem_rdata_o = {{56{mem_rdata_i[15]}}, mem_rdata_i[15:8]};
                    end
                    default: begin
                        mem_rdata_o = {{56{mem_rdata_i[7]}}, mem_rdata_i[7:0]};
                    end
                endcase
            end
            `ysyx_040654_LSU_LBU: begin
                mem_wmask_o = 8'b00000000;
                mem_wdata_o = `ysyx_040654_Zero_Word;
                case(mem_read_addr_index)
                    3'b111: begin
                        mem_rdata_o = {{56{1'b0}}, mem_rdata_i[63:56]};
                    end
                    3'b110: begin
                        mem_rdata_o = {{56{1'b0}}, mem_rdata_i[55:48]};
                    end
                    3'b101: begin
                        mem_rdata_o = {{56{1'b0}}, mem_rdata_i[47:40]};
                    end
                    3'b100: begin
                        mem_rdata_o = {{56{1'b0}}, mem_rdata_i[39:32]};
                    end
                    3'b011: begin
                        mem_rdata_o = {{56{1'b0}}, mem_rdata_i[31:24]};
                    end
                    3'b010: begin
                        mem_rdata_o = {{56{1'b0}}, mem_rdata_i[23:16]};
                    end
                    3'b001: begin
                        mem_rdata_o = {{56{1'b0}}, mem_rdata_i[15:8]};
                    end
                    default: begin
                        mem_rdata_o = {{56{1'b0}}, mem_rdata_i[7:0]};
                    end
                endcase
            end
            
            `ysyx_040654_LSU_SD: begin
                mem_rdata_o = `ysyx_040654_Zero_Word;
                mem_wdata_o = mem_wdata_i;
                mem_wmask_o = 8'b11111111;
            end
            `ysyx_040654_LSU_SB: begin
                mem_rdata_o = `ysyx_040654_Zero_Word;
                case(mem_write_addr_index)
                    3'b111: begin
                        mem_wmask_o = 8'b10000000;
                        mem_wdata_o = {mem_wdata_i[7:0], 56'b0};
                    end
                    3'b110: begin
                        mem_wmask_o = 8'b01000000;
                        mem_wdata_o = {8'b0, mem_wdata_i[7:0], 48'b0};
                    end
                    3'b101: begin
                        mem_wmask_o = 8'b00100000;
                        mem_wdata_o = {16'b0, mem_wdata_i[7:0], 40'b0};
                    end
                    3'b100: begin
                        mem_wmask_o = 8'b00010000;
                        mem_wdata_o = {24'b0, mem_wdata_i[7:0], 32'b0};
                    end
                    3'b011: begin
                        mem_wmask_o = 8'b00001000;
                        mem_wdata_o = {32'b0, mem_wdata_i[7:0], 24'b0};
                    end
                    3'b010: begin
                        mem_wmask_o = 8'b00000100;
                        mem_wdata_o = {40'b0, mem_wdata_i[7:0], 16'b0};
                    end
                    3'b001: begin
                        mem_wmask_o = 8'b00000010;
                        mem_wdata_o = {48'b0, mem_wdata_i[7:0], 8'b0};
                    end
                    default: begin
                        mem_wmask_o = 8'b00000001;
                        mem_wdata_o = {56'b0, mem_wdata_i[7:0]};
                    end
                endcase
            end
            `ysyx_040654_LSU_SW: begin
                mem_rdata_o = `ysyx_040654_Zero_Word;
                case(mem_write_addr_index[2])
                    1'b1: begin
                        mem_wmask_o = 8'b11110000;
                        mem_wdata_o = {mem_wdata_i[31:0], 32'b0};
                    end
                    default: begin
                        mem_wmask_o = 8'b00001111;
                        mem_wdata_o = {32'b0, mem_wdata_i[31:0]};
                    end
                endcase
            end
            `ysyx_040654_LSU_SH: begin
                mem_rdata_o = `ysyx_040654_Zero_Word;
                case(mem_write_addr_index[2:1])
                    2'b11: begin
                        mem_wmask_o = 8'b11000000;
                        mem_wdata_o = {mem_wdata_i[15:0], 48'b0};
                    end
                    2'b10: begin
                        mem_wmask_o = 8'b00110000;
                        mem_wdata_o = {16'b0, mem_wdata_i[15:0], 32'b0};
                    end
                    2'b01: begin
                        mem_wmask_o = 8'b00001100;
                        mem_wdata_o = {32'b0, mem_wdata_i[15:0], 16'b0};
                    end
                    default: begin
                        mem_wmask_o = 8'b00000011;
                        mem_wdata_o = {48'b0, mem_wdata_i[15:0]};
                    end
                endcase
            end
            default: begin
                mem_rdata_o = `ysyx_040654_Zero_Word;
                mem_wmask_o = 8'b00000000;
                mem_wdata_o = `ysyx_040654_Zero_Word;
            end
        endcase
    end
    assign mem_read_addr_index = mem_raddr_i[2:0];
    assign mem_write_addr_index = mem_waddr_i[2:0];
endmodule



module ysyx_040654_mem_reg (
    input                       clk,
    input                       rstn,
    input   [3:0]               mem_stall_flag_i,
    input                       mem_flush_flag_i,

    input                       mem_reg_wen_i,
    input   [1:0]               mem_reg_wsel_i,
    input   [`ysyx_040654_RegAddrBus]       mem_reg_waddr_i,
    input   [`ysyx_040654_DataBus]          mem_alu_result_i,
    input   [`ysyx_040654_DataBus]          mem_bju_result_i,
    input   [`ysyx_040654_DataBus]          mem_mem_rdata_i,
    input   [`ysyx_040654_DataBus]          mem_csr_rdata_i,

    output                          wb_reg_wen_o,
    output      [1:0]               wb_reg_wsel_o,
    output      [`ysyx_040654_RegAddrBus]       wb_reg_waddr_o,
    output      [`ysyx_040654_DataBus]          wb_alu_result_o,
    output      [`ysyx_040654_DataBus]          wb_bju_result_o,
    output      [`ysyx_040654_DataBus]          wb_mem_rdata_o,
    output      [`ysyx_040654_DataBus]          wb_csr_rdata_o
);

    reg                     reg_wen_r;
    reg     [1:0]           reg_wsel_r;
    reg     [`ysyx_040654_RegAddrBus]   reg_waddr_r;
    reg     [`ysyx_040654_DataBus]      alu_result_r, bju_result_r, mem_rdata_r, csr_rdata_r;


    always @(posedge clk) begin
        if(!rstn) begin
            reg_wen_r <= 1'b0;
            reg_wsel_r <= 2'b0;
            reg_waddr_r <= 5'b0;
            alu_result_r <= `ysyx_040654_Zero_Word;
            bju_result_r <= `ysyx_040654_Zero_Word;
            mem_rdata_r <= `ysyx_040654_Zero_Word;
            csr_rdata_r <= `ysyx_040654_Zero_Word;
        end else begin
            if(mem_flush_flag_i) begin
                reg_wen_r <= 1'b1;
                reg_wsel_r <= 2'b0;
                reg_waddr_r <= 5'b0;
                alu_result_r <= `ysyx_040654_Zero_Word;
                bju_result_r <= `ysyx_040654_Zero_Word;
                mem_rdata_r <= `ysyx_040654_Zero_Word;
                csr_rdata_r <= `ysyx_040654_Zero_Word;
            end else if(!mem_stall_flag_i[3]) begin
                reg_wen_r <= mem_reg_wen_i;
                reg_wsel_r <= mem_reg_wsel_i;
                reg_waddr_r <= mem_reg_waddr_i;
                alu_result_r <= mem_alu_result_i;
                bju_result_r <= mem_bju_result_i;
                mem_rdata_r <= mem_mem_rdata_i;
                csr_rdata_r <= mem_csr_rdata_i;
            end else if(mem_stall_flag_i[3] && mem_stall_flag_i == 4'b1111) begin
                reg_wen_r <= 1'b0;
                reg_wsel_r <= 2'b0;
                reg_waddr_r <= 5'b0;
                alu_result_r <= `ysyx_040654_Zero_Word;
                bju_result_r <= `ysyx_040654_Zero_Word;
                mem_rdata_r <= `ysyx_040654_Zero_Word;
                csr_rdata_r <= `ysyx_040654_Zero_Word;
            end
        end
    end


    assign wb_reg_wen_o = reg_wen_r;
    assign wb_reg_wsel_o = reg_wsel_r;
    assign wb_reg_waddr_o = reg_waddr_r;
    assign wb_alu_result_o = alu_result_r;
    assign wb_bju_result_o = bju_result_r;
    assign wb_mem_rdata_o = mem_rdata_r;
    assign wb_csr_rdata_o = csr_rdata_r;
endmodule



module ysyx_040654_mem_stage (
    input                               clk,
    input                               rstn,   
    input   [`ysyx_040654_LSU_OP-1:0]               mem_lsu_op_i,
    input   [`ysyx_040654_MemAddrBus]               mem_rwaddr_i,
    output  [`ysyx_040654_DataBus]                  mem_rdata_o,
    input   [`ysyx_040654_DataBus]                  mem_wdata_i,
    input                               mem_read_valid_i,
    input                               mem_write_valid_i,
    input                               mem_dcache_flush_flag_i,
    output                              mem_dmem_axi_read_valid_o,
    input                               mem_dmem_axi_read_ready_i,
    input   [`ysyx_040654_DataBus]                  mem_dmem_axi_read_data_i,
    output  [`ysyx_040654_MemAddrBus]               mem_dmem_axi_read_addr_o,
    input                               mem_dmem_axi_read_last_i,
    output                              mem_dmem_axi_write_valid_o,
    input                               mem_dmem_axi_write_ready_i,
    output  [`ysyx_040654_MemAddrBus]               mem_dmem_axi_write_addr_o,
    output  [`ysyx_040654_DataBus]                  mem_dmem_axi_write_data_o,
    output  [7:0]                       mem_dmem_axi_write_mask_o,
    input                               mem_dmem_axi_write_last_i,
    input                               mem_dmem_axi_write_resp_i,
    output                              mem_device_axi_read_valid_o,
    input                               mem_device_axi_read_ready_i,
    output  [`ysyx_040654_MemAddrBus]               mem_device_axi_read_addr_o,
    input   [`ysyx_040654_DataBus]                  mem_device_axi_read_data_i,
    output                              mem_device_axi_write_valid_o,
    input                               mem_device_axi_write_ready_i,
    output  [`ysyx_040654_DataBus]                  mem_device_axi_write_data_o,        
    output  [`ysyx_040654_MemAddrBus]               mem_device_axi_write_addr_o,          
    output  [7:0]                       mem_device_axi_write_mask_o,
    output                              mem_dcache_cen_o,
    output                              mem_dcache_wen_o,
    output  [`ysyx_040654_CacheBus]                 mem_dcache_bwen_o,            
    output  [`ysyx_040654_CacheAddrBus]             mem_dcache_addr_o,        
    output  [`ysyx_040654_CacheBus]                 mem_dcache_wdata_o,           
    output  [3:0]                       mem_dcache_sel_o,                   
    input   [`ysyx_040654_CacheBus]                 mem_dcache_rdata_i,
    output                              mem_fencei_flag_o,
    output                              mem_busy_flag_o           
);
    
    wire    [`ysyx_040654_DataBus]         mem_rdata;
    wire    [`ysyx_040654_DataBus]         mem_wdata;
    wire    [7:0]              mem_wmask;
    wire                       mem_dcache_read_valid;
    wire                       mem_dcache_read_ready;              
    wire                       mem_dcache_write_valid;
    wire                       mem_dcache_write_ready; 
    wire    [`ysyx_040654_DataBus]         mem_dcache_read_data;

    wire                       mem_read_ready;
    wire                       mem_write_ready;
    wire                       mem_dcache_flush_valid;
    wire                       mem_dcache_flush_ready;

    ysyx_040654_lsu mem_lsu(
        .lsu_op_i    (mem_lsu_op_i  ),
        .mem_raddr_i (mem_rwaddr_i  ),
        .mem_rdata_i (mem_rdata     ),
        .mem_rdata_o (mem_rdata_o   ),
        .mem_waddr_i (mem_rwaddr_i  ),
        .mem_wdata_i (mem_wdata_i   ),
        .mem_wdata_o (mem_wdata     ),
        .mem_wmask_o (mem_wmask     )
    );
    
    ysyx_040654_cache_ctrl mem_dcache_ctrl(
    	.clk                     (clk                               ),
        .rstn                    (rstn                              ),
        .lsu_op_i                (mem_lsu_op_i                      ),
        .read_valid_i            (mem_dcache_read_valid             ),
        .read_ready_o            (mem_dcache_read_ready             ),
        .read_addr_i             (mem_rwaddr_i                      ),
        .read_data_o             (mem_dcache_read_data              ),
        .write_valid_i           (mem_dcache_write_valid            ),
        .write_ready_o           (mem_dcache_write_ready            ),
        .write_addr_i            (mem_rwaddr_i                      ),
        .write_data_i            (mem_wdata                         ),
        .write_mask_i            (mem_wmask                         ),
        .axi_read_valid_o        (mem_dmem_axi_read_valid_o         ),
        .axi_read_ready_i        (mem_dmem_axi_read_ready_i         ),
        .axi_read_data_i         (mem_dmem_axi_read_data_i          ),
        .axi_read_addr_o         (mem_dmem_axi_read_addr_o          ),
        .axi_read_last_i         (mem_dmem_axi_read_last_i          ),
        .axi_write_valid_o       (mem_dmem_axi_write_valid_o        ),
        .axi_write_ready_i       (mem_dmem_axi_write_ready_i        ),
        .axi_write_addr_o        (mem_dmem_axi_write_addr_o         ),
        .axi_write_data_o        (mem_dmem_axi_write_data_o         ),
        .axi_write_mask_o        (mem_dmem_axi_write_mask_o         ),
        .axi_write_last_i        (mem_dmem_axi_write_last_i         ),
        .axi_write_resp_i        (mem_dmem_axi_write_resp_i         ),
        .cache_cen_o             (mem_dcache_cen_o                  ),
        .cache_wen_o             (mem_dcache_wen_o                  ),
        .cache_bwen_o            (mem_dcache_bwen_o                 ),
        .cache_addr_o            (mem_dcache_addr_o                 ),
        .cache_wdata_o           (mem_dcache_wdata_o                ),
        .cache_sel_o             (mem_dcache_sel_o                  ),
        .cache_rdata_i           (mem_dcache_rdata_i                ),
        .cache_flush_valid_i     (mem_dcache_flush_valid            ),
        .cache_flush_ready_o     (mem_dcache_flush_ready            )
    );
    
    assign mem_dcache_flush_valid = mem_dcache_flush_flag_i;
    
    assign mem_rdata = (mem_dcache_read_valid) ? mem_dcache_read_data :
                        (mem_device_axi_read_valid_o) ? mem_device_axi_read_data_i :
                        64'b0;

    assign mem_dcache_read_valid = (mem_read_valid_i && ((mem_rwaddr_i >= `ysyx_040654_MEM_START && mem_rwaddr_i <= `ysyx_040654_MEM_END) || (mem_rwaddr_i >= `ysyx_040654_SDRAM_START && mem_rwaddr_i < `ysyx_040654_SDRAM_END)));
    assign mem_dcache_write_valid = (mem_write_valid_i && ((mem_rwaddr_i >= `ysyx_040654_MEM_START && mem_rwaddr_i <= `ysyx_040654_MEM_END) || (mem_rwaddr_i >= `ysyx_040654_SDRAM_START && mem_rwaddr_i < `ysyx_040654_SDRAM_END)));

    assign mem_device_axi_read_valid_o = (mem_read_valid_i && (mem_rwaddr_i < `ysyx_040654_MEM_START));
    assign mem_device_axi_write_valid_o = (mem_write_valid_i && (mem_rwaddr_i < `ysyx_040654_MEM_START));
    
    assign mem_read_ready =     (mem_dcache_read_valid) ? mem_dcache_read_ready :
                                (mem_device_axi_read_valid_o) ? mem_device_axi_read_ready_i :
                                1'b0;
    assign mem_write_ready =    (mem_dcache_write_valid) ? mem_dcache_write_ready :
                                (mem_device_axi_write_valid_o) ? mem_device_axi_write_ready_i :
                                1'b0;

    assign mem_device_axi_read_addr_o = mem_rwaddr_i;
    assign mem_device_axi_write_data_o = mem_wdata;
    assign mem_device_axi_write_addr_o = mem_rwaddr_i;
    assign mem_device_axi_write_mask_o = mem_wmask;
    assign mem_busy_flag_o = (mem_write_valid_i && !mem_write_ready) || (mem_read_valid_i && !mem_read_ready) || (mem_dcache_flush_valid && !mem_dcache_flush_ready);
    assign mem_fencei_flag_o = (!mem_busy_flag_o && mem_dcache_flush_flag_i);
endmodule



module ysyx_040654_pc(
    input clk,
    input rstn,
    input branch_flag_i,                    // B型指令和J型指令信号
    input excp_flag_i,                      // 异常处理信号
    input fencei_flag_i,
    input stall_flag_i,                     
    input [`ysyx_040654_MemAddrBus] branch_pc_i,        // B型指令和J型指令跳转地址
    input [`ysyx_040654_MemAddrBus] excp_pc_i,          // 异常处理和返回跳转地址
    input [`ysyx_040654_MemAddrBus] fencei_pc_i,
    output reg [`ysyx_040654_MemAddrBus] pc_o
);
    wire [`ysyx_040654_MemAddrBus] pc_next;
    
    always @(posedge clk) begin
        if(!rstn) begin
            pc_o <= `ysyx_040654_PC_RESET; 
        end else begin
            if(!stall_flag_i) begin
                pc_o <= pc_next;
            end
        end
    end


    
    assign pc_next =    (excp_flag_i) ? {excp_pc_i[31:2], 2'b0} :
                        (fencei_flag_i) ? {fencei_pc_i[31:2], 2'b0} :
                        (branch_flag_i) ? {branch_pc_i[31:2], 2'b0} : 
                        {pc_o[31:2], 2'b0} + 4;
    

endmodule



module ysyx_040654_piple_ctrl (
    // contral  hazardss
    input                           clk,
    input                           rstn,
    input       [`ysyx_040654_BJU_OP-1:0]       id_bju_op_i,
    input                           id_branch_flag_i,
    input       [`ysyx_040654_MemAddrBus]       id_branch_pc_i,
    input                           mem_excp_flag_i,
    input       [`ysyx_040654_MemAddrBus]       mem_excp_pc_i,
    input                           mem_fencei_flag_i,
    input       [`ysyx_040654_MemAddrBus]       mem_next_pc_i,
    input                           if_busy_flag_i,
    input                           ex_busy_flag_i,
    input                           mem_busy_flag_i,
    output      [3:0]               hazard_stall_flag_o,
    output      [3:0]               hazard_flush_flag_o,
    output                          hazard_branch_flag_o,
    output      [`ysyx_040654_MemAddrBus]       hazard_branch_pc_o,
    output      [`ysyx_040654_MemAddrBus]       hazard_excp_pc_o,
    output                          hazard_excp_flag_o,
    output                          hazard_fencei_flag_o,
    output      [`ysyx_040654_MemAddrBus]       hazard_fencei_pc_o,

    // datat hazard       
    input       [`ysyx_040654_RegAddrBus]       id_reg_raddr1_i,
    input       [`ysyx_040654_RegAddrBus]       id_reg_raddr2_i,

    input                           ex_reg_wen_i,
    input       [`ysyx_040654_RegAddrBus]       ex_reg_waddr_i,

    input                           mem_reg_wen_i,
    input       [`ysyx_040654_RegAddrBus]       mem_reg_waddr_i,

    input                           wb_reg_wen_i,
    input       [`ysyx_040654_RegAddrBus]       wb_reg_waddr_i
);
    reg                     hazard_branch_flag_r;
    reg     [`ysyx_040654_MemAddrBus]   hazard_branch_pc_r;
    reg     [3:0]           hazard_flush_flag_r;
    reg                     hazard_excp_flag_r;
    reg     [`ysyx_040654_MemAddrBus]   hazard_excp_pc_r;
    reg                     hazard_fencei_flag_r;
    reg     [`ysyx_040654_MemAddrBus]   hazard_fencei_pc_r;

    
    
    always @(posedge clk) begin
        if(!rstn) begin
            hazard_branch_flag_r <= 1'b0;
            hazard_branch_pc_r <= 32'b0;
            hazard_flush_flag_r <= 4'b0;
            hazard_excp_flag_r <= 1'b0;
            hazard_excp_pc_r <= 32'b0;
            hazard_fencei_flag_r <= 1'b0;
            hazard_fencei_pc_r <= 32'b0;
        end else begin
            if(mem_excp_flag_i) begin
                if(ex_busy_flag_i || if_busy_flag_i) begin
                    hazard_excp_flag_r <= 1'b1;
                    hazard_excp_pc_r <= mem_excp_pc_i;
                end
            end else if(hazard_excp_flag_r) begin
                if(!ex_busy_flag_i && !if_busy_flag_i) begin
                    hazard_branch_flag_r <= 1'b0;
                    hazard_branch_pc_r <= 32'b0;
                    hazard_flush_flag_r <= 4'b0;
                    hazard_excp_flag_r <= 1'b0;
                    hazard_excp_pc_r <= 32'b0;
                    hazard_fencei_flag_r <= 1'b0;
                    hazard_fencei_pc_r <= 32'b0;
                end
            end else if(mem_fencei_flag_i) begin
                if(ex_busy_flag_i || if_busy_flag_i) begin
                    hazard_fencei_flag_r <= 1'b1;
                    hazard_fencei_pc_r <= mem_next_pc_i;
                end
            end else if(hazard_fencei_flag_r) begin
                if(!ex_busy_flag_i && !if_busy_flag_i) begin
                    hazard_branch_flag_r <= 1'b0;
                    hazard_branch_pc_r <= 32'b0;
                    hazard_flush_flag_r <= 4'b0;
                    hazard_fencei_flag_r <= 1'b0;
                    hazard_fencei_pc_r <= 32'b0;
                end
            end else begin
                if(hazard_stall_flag_o != 4'b0 && id_bju_op_i != `ysyx_040654_BJU_NOP) begin
                    hazard_branch_flag_r <= id_branch_flag_i;
                    hazard_branch_pc_r <= id_branch_pc_i;
                    if(id_branch_flag_i) begin
                        hazard_flush_flag_r <= 4'b0001;
                    end else begin
                        hazard_flush_flag_r <= 4'b0000;
                    end
                end else if(hazard_stall_flag_o == 4'b0) begin
                    hazard_branch_pc_r <= 32'b0;
                    hazard_branch_flag_r <= 1'b0;
                    hazard_flush_flag_r <= 4'b0000;
                end
            end
        end
    end

    assign hazard_excp_flag_o = ((mem_excp_flag_i || hazard_excp_flag_r) && !ex_busy_flag_i && !if_busy_flag_i) ? 1'b1 : 1'b0;
    assign hazard_excp_pc_o =   (mem_excp_flag_i && !ex_busy_flag_i && !if_busy_flag_i) ? mem_excp_pc_i :
                                (hazard_excp_flag_r && !ex_busy_flag_i && !if_busy_flag_i) ? hazard_excp_pc_r :
                                32'b0;
    assign hazard_fencei_flag_o = ((mem_fencei_flag_i || hazard_fencei_flag_r) && !ex_busy_flag_i && !if_busy_flag_i) ? 1'b1 : 1'b0;
    assign hazard_fencei_pc_o =  (mem_fencei_flag_i && !ex_busy_flag_i && !if_busy_flag_i) ? mem_next_pc_i :
                                (hazard_fencei_flag_r && !ex_busy_flag_i && !if_busy_flag_i) ? hazard_fencei_pc_r :
                                32'b0;

    assign hazard_stall_flag_o =    mem_busy_flag_i ? 4'b1111 :
                                    ((mem_excp_flag_i || hazard_excp_flag_r) && (ex_busy_flag_i || if_busy_flag_i)) ? 4'b0111 :
                                    ((mem_excp_flag_i || hazard_excp_flag_r) && !ex_busy_flag_i && !if_busy_flag_i) ? 4'b0000 :
                                    ((mem_fencei_flag_i || hazard_fencei_flag_r) && (ex_busy_flag_i || if_busy_flag_i)) ? 4'b0111 :
                                    ((mem_fencei_flag_i || hazard_fencei_flag_r) && (!ex_busy_flag_i && !if_busy_flag_i)) ? 4'b0000 :
                                    ex_busy_flag_i ? 4'b0111 : 
                                    (ex_reg_wen_i && ex_reg_waddr_i == id_reg_raddr1_i && id_reg_raddr1_i != 5'b0) || (mem_reg_wen_i && mem_reg_waddr_i == id_reg_raddr1_i && id_reg_raddr1_i != 5'b0) || (wb_reg_wen_i && wb_reg_waddr_i == id_reg_raddr1_i && id_reg_raddr1_i != 5'b0) ? 4'b0011 :
                                    (ex_reg_wen_i && ex_reg_waddr_i == id_reg_raddr2_i && id_reg_raddr2_i != 5'b0) || (mem_reg_wen_i && mem_reg_waddr_i == id_reg_raddr2_i && id_reg_raddr2_i != 5'b0) || (wb_reg_wen_i && wb_reg_waddr_i == id_reg_raddr2_i && id_reg_raddr2_i != 5'b0) ? 4'b0011 :
                                    if_busy_flag_i ? 4'b0001 :
                                    4'b0000;


    assign hazard_flush_flag_o =    ((mem_excp_flag_i || hazard_excp_flag_r) && !ex_busy_flag_i && !if_busy_flag_i) ? 4'b0111 :
                                    ((mem_fencei_flag_i || hazard_fencei_flag_r) && !ex_busy_flag_i && !if_busy_flag_i) ? 4'b0111 :
                                    (hazard_stall_flag_o == 4'b0 && id_branch_flag_i && id_bju_op_i != `ysyx_040654_BJU_NOP) ? 4'b0001 :
                                    (hazard_stall_flag_o == 4'b0 && !id_branch_flag_i && id_bju_op_i != `ysyx_040654_BJU_NOP) ? 4'b0000 :
                                    (hazard_stall_flag_o == 4'b0) ? hazard_flush_flag_r : 
                                    4'b0000;

    
    assign hazard_branch_flag_o =   (hazard_stall_flag_o == 4'b0 && id_branch_flag_i && id_bju_op_i != `ysyx_040654_BJU_NOP) ? 1'b1 :
                                    (hazard_stall_flag_o == 4'b0 && !id_branch_flag_i && id_bju_op_i != `ysyx_040654_BJU_NOP) ? 1'b0 :
                                    (hazard_stall_flag_o == 4'b0) ? hazard_branch_flag_r : 
                                    1'b0;

    assign hazard_branch_pc_o =     (hazard_stall_flag_o == 4'b0 && id_branch_flag_i && id_bju_op_i != `ysyx_040654_BJU_NOP) ? id_branch_pc_i :
                                    (hazard_stall_flag_o == 4'b0 && !id_branch_flag_i && id_bju_op_i != `ysyx_040654_BJU_NOP) ? 32'b0 :
                                    (hazard_stall_flag_o == 4'b0) ? hazard_branch_pc_r : 
                                    32'b0;
    
endmodule   



module ysyx_040654_regfile (
    input wire clk,
    input wire rstn,
    input [`ysyx_040654_RegAddrBus] reg_raddr1_i,
    input [`ysyx_040654_RegAddrBus] reg_raddr2_i,
    input reg_ren1_i,
    input reg_ren2_i,
    output [`ysyx_040654_RegBus] reg_rdata1_o,
    output [`ysyx_040654_RegBus] reg_rdata2_o,
    input [`ysyx_040654_RegAddrBus] reg_waddr_i,
    input reg_wen_i,
    input [`ysyx_040654_RegBus] reg_wdata_i
    
    
);
    reg [`ysyx_040654_RegBus] regs [`ysyx_040654_RegNum-1:0];
    
    integer i ;
    always @(posedge clk) begin
        if(!rstn) begin
            for(i = 0; i < `ysyx_040654_RegNum; i = i+1) begin
                regs[i] <= `ysyx_040654_Zero_Word;
            end
        end else begin
            if(reg_wen_i == 1'b1 && reg_waddr_i !=  `ysyx_040654_RegZero) begin
                regs[reg_waddr_i] <= reg_wdata_i;
            end
        end
    end

    assign reg_rdata1_o = (reg_ren1_i && reg_raddr1_i != 5'b0) ? regs[reg_raddr1_i] : `ysyx_040654_Zero_Word;
    assign reg_rdata2_o = (reg_ren2_i && reg_raddr2_i != 5'b0) ? regs[reg_raddr2_i] : `ysyx_040654_Zero_Word;
    


    
endmodule




module ysyx_040654_wb_stage (
    input   [1:0]           wb_reg_wsel_i,
    input   [`ysyx_040654_DataBus]      wb_alu_result_i,
    input   [`ysyx_040654_DataBus]      wb_bju_result_i,
    input   [`ysyx_040654_DataBus]      wb_mem_rdata_i,
    input   [`ysyx_040654_DataBus]      wb_csr_rdata_i,
    output  [`ysyx_040654_DataBus]      wb_reg_wdata_o
);
    assign wb_reg_wdata_o = (wb_reg_wsel_i == 2'b11) ? wb_csr_rdata_i :
                            (wb_reg_wsel_i == 2'b10) ? wb_mem_rdata_i :
                            (wb_reg_wsel_i == 2'b01) ? wb_bju_result_i :
                            wb_alu_result_i;


endmodule
