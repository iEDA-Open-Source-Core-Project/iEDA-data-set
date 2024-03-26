//@file:                define.v
//@author:              Zhong WuJie
//@note:                check the design report
//@date:                2021/10/23 14:15
`define YSYX210243_ZERO_WORD  64'h00000000_00000000
`define YSYX210243_PC_START   64'h00000000_30000000
`define YSYX210243_INST_END   64'hFF000000_00000000
`define YSYX210243_REG_BUS    63 : 0
`define YSYX210243_BUS_LEN    64     

`define YSYX210243_AXI_ADDR_WIDTH      64
`define YSYX210243_AXI_DATA_WIDTH      64
`define YSYX210243_AXI_ID_WIDTH        4
`define YSYX210243_AXI_USER_WIDTH      1

`define YSYX210243_SIZE_B              2'b00
`define YSYX210243_SIZE_H              2'b01
`define YSYX210243_SIZE_W              2'b10
`define YSYX210243_SIZE_D              2'b11

`define YSYX210243_REQ_READ            1'b0
`define YSYX210243_REQ_WRITE           1'b1

`define YSYX210243_RISCV_PRIV_MODE_U   0
`define YSYX210243_RISCV_PRIV_MODE_S   1
`define YSYX210243_RISCV_PRIV_MODE_M   3

//riscv-32i instruction opcode
`define YSYX210243_INST_LUI     9'b0000_01101
`define YSYX210243_INST_AUIPC   9'b0000_00101
`define YSYX210243_INST_JAL     9'b0000_11011
`define YSYX210243_INST_JALR    9'b0000_11001
`define YSYX210243_INST_BEQ     9'b0000_11000
`define YSYX210243_INST_BNE     9'b0001_11000
`define YSYX210243_INST_BLT     9'b0100_11000
`define YSYX210243_INST_BGE     9'b0101_11000
`define YSYX210243_INST_BLTU    9'b0110_11000
`define YSYX210243_INST_BGEU    9'b0111_11000
`define YSYX210243_INST_LB      9'b0000_00000
`define YSYX210243_INST_LH      9'b0001_00000
`define YSYX210243_INST_LW      9'b0010_00000
`define YSYX210243_INST_LBU     9'b0100_00000
`define YSYX210243_INST_LHU     9'b0101_00000
`define YSYX210243_INST_SB      9'b0000_01000
`define YSYX210243_INST_SH      9'b0001_01000
`define YSYX210243_INST_SW      9'b0010_01000
`define YSYX210243_INST_ADDI    9'b0000_00100
`define YSYX210243_INST_SLTI    9'b0010_00100
`define YSYX210243_INST_SLTIU   9'b0011_00100
`define YSYX210243_INST_XORI    9'b0100_00100
`define YSYX210243_INST_ORI     9'b0110_00100
`define YSYX210243_INST_ANDI    9'b0111_00100
`define YSYX210243_INST_ADD     9'b0000_01100
`define YSYX210243_INST_SUB     9'b1000_01100
`define YSYX210243_INST_SLL     9'b0001_01100
`define YSYX210243_INST_SLT     9'b0010_01100
`define YSYX210243_INST_SLTU    9'b0011_01100
`define YSYX210243_INST_XOR     9'b0100_01100
`define YSYX210243_INST_SRL     9'b0101_01100
`define YSYX210243_INST_SRA     9'b1101_01100
`define YSYX210243_INST_OR      9'b0110_01100
`define YSYX210243_INST_AND     9'b0111_01100

//riscv-64i instruction opcode
`define YSYX210243_INST_LWU     9'b0110_00000
`define YSYX210243_INST_LD      9'b0011_00000
`define YSYX210243_INST_SD      9'b0011_01000
`define YSYX210243_INST_SLLI    9'b0001_00100
`define YSYX210243_INST_SRLI    9'b0101_00100
`define YSYX210243_INST_SRAI    9'b1101_00100
`define YSYX210243_INST_ADDIW   9'b0000_00110
`define YSYX210243_INST_SLLIW   9'b0001_00110
`define YSYX210243_INST_SRLIW   9'b0101_00110
`define YSYX210243_INST_SRAIW   9'b1101_00110
`define YSYX210243_INST_ADDW    9'b0000_01110
`define YSYX210243_INST_SUBW    9'b1000_01110
`define YSYX210243_INST_SLLW    9'b0001_01110
`define YSYX210243_INST_SRLW    9'b0101_01110
`define YSYX210243_INST_SRAW    9'b1101_01110

//RV32/RV64 Zicsr Standard Extension
`define YSYX210243_INST_CSRRW   9'b0001_11100
`define YSYX210243_INST_CSRRS   9'b0010_11100
`define YSYX210243_INST_CSRRC   9'b0011_11100
`define YSYX210243_INST_CSRRWI  9'b0101_11100
`define YSYX210243_INST_CSRRSI  9'b0110_11100
`define YSYX210243_INST_CSRRCI  9'b0111_11100

`define YSYX210243_INST_ECALL   9'b0000_11100
`define YSYX210243_INST_MRET    9'b1000_11100

//MMIO ADDR
`define YSYX210243_MMIO_MTIME_ADDR     64'h0000_0000_0200_bff8
`define YSYX210243_MMIO_MTIMECMP_ADDR  64'h0000_0000_0200_4000

//csr definition
`define YSYX210243_CSR_REGS_NUM 16
`define YSYX210243_CSR_ID_NUM   4

`define YSYX210243_CSR_MSTATUS  12'h300
`define YSYX210243_CSR_MIE      12'h304
`define YSYX210243_CSR_MTVEC    12'h305
`define YSYX210243_CSR_MSCRATCH 12'h340
`define YSYX210243_CSR_MEPC     12'h341
`define YSYX210243_CSR_MCAUSE   12'h342
`define YSYX210243_CSR_MIP      12'h344
`define YSYX210243_CSR_MCYCLE   12'hb00
`define YSYX210243_CSR_MHARTID  12'hf14

`define YSYX210243_CSR_MSTATUS_USR  `YSYX210243_CSR_ID_NUM'b0000
`define YSYX210243_CSR_MTVEC_USR    `YSYX210243_CSR_ID_NUM'b0001
`define YSYX210243_CSR_MEPC_USR     `YSYX210243_CSR_ID_NUM'b0010
`define YSYX210243_CSR_MCAUSE_USR   `YSYX210243_CSR_ID_NUM'b0011
`define YSYX210243_CSR_MCYCLE_USR   `YSYX210243_CSR_ID_NUM'b0100
`define YSYX210243_CSR_MIE_USR      `YSYX210243_CSR_ID_NUM'b0101
`define YSYX210243_CSR_MIP_USR      `YSYX210243_CSR_ID_NUM'b0110
`define YSYX210243_CSR_MSCRATCH_USR `YSYX210243_CSR_ID_NUM'b0111
`define YSYX210243_CSR_MHARTID_USR  `YSYX210243_CSR_ID_NUM'b1000

`define YSYX210243_CSR_MSTATUS_INIT_VALUE      64'h0000_0000_0000_1800 //csrs init values
`define YSYX210243_CSR_MSTATUS_TRAP_VALUE      64'h0000_0000_0000_1800
`define YSYX210243_CSR_MSTATUS_INTERRUPT_VALUE 64'h0000_0000_0000_1880
`define YSYX210243_CSR_MSTATUS_MRET_VALUE      64'h0000_0000_0000_0088
`define YSYX210243_CSR_MTVEC_INIT_VALUE        0
`define YSYX210243_CSR_MEPC_INIT_VALUE         0
`define YSYX210243_CSR_MCAUSE_INIT_VALUE       0
`define YSYX210243_CSR_MCAUSE_INTERRUPT_VALUE  64'h8000_0000_0000_0007
`define YSYX210243_CSR_MCYCLE_INIT_VALUE       0
`define YSYX210243_CSR_MIE_INIT_VALUE          0
`define YSYX210243_CSR_MIE_INTERRUPT_VALUE     64'h0000_0000_0000_0080
`define YSYX210243_CSR_MIP_INIT_VALUE          0
`define YSYX210243_CSR_MSCRATCH_INIT_VALUE     0
`define YSYX210243_CSR_MHARTID_INIT_VALUE      0

// Burst types
`define YSYX210243_AXI_BURST_TYPE_FIXED                                2'b00
`define YSYX210243_AXI_BURST_TYPE_INCR                                 2'b01
`define YSYX210243_AXI_BURST_TYPE_WRAP                                 2'b10
// Access permissions
`define YSYX210243_AXI_PROT_UNPRIVILEGED_ACCESS                        3'b000
`define YSYX210243_AXI_PROT_PRIVILEGED_ACCESS                          3'b001
`define YSYX210243_AXI_PROT_SECURE_ACCESS                              3'b000
`define YSYX210243_AXI_PROT_NON_SECURE_ACCESS                          3'b010
`define YSYX210243_AXI_PROT_DATA_ACCESS                                3'b000
`define YSYX210243_AXI_PROT_INSTRUCTION_ACCESS                         3'b100
// Memory types (AR)
`define YSYX210243_AXI_ARCACHE_DEVICE_NON_BUFFERABLE                   4'b0000
`define YSYX210243_AXI_ARCACHE_DEVICE_BUFFERABLE                       4'b0001
`define YSYX210243_AXI_ARCACHE_NORMAL_NON_CACHEABLE_NON_BUFFERABLE     4'b0010
`define YSYX210243_AXI_ARCACHE_NORMAL_NON_CACHEABLE_BUFFERABLE         4'b0011
`define YSYX210243_AXI_ARCACHE_WRITE_THROUGH_NO_ALLOCATE               4'b1010
`define YSYX210243_AXI_ARCACHE_WRITE_THROUGH_READ_ALLOCATE             4'b1110
`define YSYX210243_AXI_ARCACHE_WRITE_THROUGH_WRITE_ALLOCATE            4'b1010
`define YSYX210243_AXI_ARCACHE_WRITE_THROUGH_READ_AND_WRITE_ALLOCATE   4'b1110
`define YSYX210243_AXI_ARCACHE_WRITE_BACK_NO_ALLOCATE                  4'b1011
`define YSYX210243_AXI_ARCACHE_WRITE_BACK_READ_ALLOCATE                4'b1111
`define YSYX210243_AXI_ARCACHE_WRITE_BACK_WRITE_ALLOCATE               4'b1011
`define YSYX210243_AXI_ARCACHE_WRITE_BACK_READ_AND_WRITE_ALLOCATE      4'b1111
// Memory types (AW)
`define YSYX210243_AXI_AWCACHE_DEVICE_NON_BUFFERABLE                   4'b0000
`define YSYX210243_AXI_AWCACHE_DEVICE_BUFFERABLE                       4'b0001
`define YSYX210243_AXI_AWCACHE_NORMAL_NON_CACHEABLE_NON_BUFFERABLE     4'b0010
`define YSYX210243_AXI_AWCACHE_NORMAL_NON_CACHEABLE_BUFFERABLE         4'b0011
`define YSYX210243_AXI_AWCACHE_WRITE_THROUGH_NO_ALLOCATE               4'b0110
`define YSYX210243_AXI_AWCACHE_WRITE_THROUGH_READ_ALLOCATE             4'b0110
`define YSYX210243_AXI_AWCACHE_WRITE_THROUGH_WRITE_ALLOCATE            4'b1110
`define YSYX210243_AXI_AWCACHE_WRITE_THROUGH_READ_AND_WRITE_ALLOCATE   4'b1110
`define YSYX210243_AXI_AWCACHE_WRITE_BACK_NO_ALLOCATE                  4'b0111
`define YSYX210243_AXI_AWCACHE_WRITE_BACK_READ_ALLOCATE                4'b0111
`define YSYX210243_AXI_AWCACHE_WRITE_BACK_WRITE_ALLOCATE               4'b1111
`define YSYX210243_AXI_AWCACHE_WRITE_BACK_READ_AND_WRITE_ALLOCATE      4'b1111

`define YSYX210243_AXI_SIZE_BYTES_1                                    3'b000
`define YSYX210243_AXI_SIZE_BYTES_2                                    3'b001
`define YSYX210243_AXI_SIZE_BYTES_4                                    3'b010
`define YSYX210243_AXI_SIZE_BYTES_8                                    3'b011
`define YSYX210243_AXI_SIZE_BYTES_16                                   3'b100
`define YSYX210243_AXI_SIZE_BYTES_32                                   3'b101
`define YSYX210243_AXI_SIZE_BYTES_64                                   3'b110
`define YSYX210243_AXI_SIZE_BYTES_128                                  3'b111

module ysyx_210243(
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
    //undriven signals
    assign  io_slave_awready     = 0;
    assign  io_slave_wready      = 0;
    assign  io_slave_bvalid      = 0;
    assign  io_slave_bresp       = 0;
    assign  io_slave_bid         = 0;
    assign  io_slave_arready     = 0;
    assign  io_slave_rvalid      = 0;
    assign  io_slave_rresp       = 0;
    assign  io_slave_rdata       = 0;
    assign  io_slave_rlast       = 0;
    assign  io_slave_rid         = 0;

    wire rw_transaction_done_usr;
    wire rw_valid = 1'b1;

    wire aw_ready;
    wire aw_valid;
    wire [31:0] aw_addr;
    wire [`YSYX210243_AXI_ID_WIDTH-1:0] aw_id;
    wire [7:0] aw_len;
    wire [2:0] aw_size;
    wire [1:0] aw_burst;

    wire w_ready;
    wire w_valid;
    wire [`YSYX210243_AXI_DATA_WIDTH-1:0] w_data;
    wire [`YSYX210243_AXI_DATA_WIDTH/8-1:0] w_strb; // not use
    wire [`YSYX210243_AXI_DATA_WIDTH/8-1:0] rw_strb;
    wire w_last;
    
    wire b_ready;
    wire b_valid;
    wire [1:0] b_resp;

    wire ar_ready;
    wire ar_valid;
    wire [31:0] ar_addr;
    wire [`YSYX210243_AXI_ID_WIDTH-1:0] ar_id;
    wire [7:0] ar_len;
    wire [2:0] ar_size;
    wire [1:0] ar_burst;
    
    wire r_ready;
    wire r_valid;
    wire [1:0] r_resp;
    wire [`YSYX210243_AXI_DATA_WIDTH-1:0] r_data;
    wire r_last; //the last bit in the burst
    assign ar_ready                                 = io_master_arready;
    assign io_master_arvalid                        = ar_valid;
    assign io_master_araddr                         = ar_addr;
    assign io_master_arid                           = ar_id;
    assign io_master_arlen                          = ar_len;
    assign io_master_arsize                         = ar_size;
    assign io_master_arburst                        = ar_burst;
    
    assign io_master_rready                         = r_ready;
    assign r_valid                                  = io_master_rvalid;
    assign r_resp                                   = io_master_rresp;
    assign r_data                                   = io_master_rdata;
    assign r_last                                   = io_master_rlast;

    assign aw_ready                                 = io_master_awready;
    assign io_master_awvalid                        = aw_valid;
    assign io_master_awaddr                         = aw_addr;
    assign io_master_awid                           = aw_id;
    assign io_master_awlen                          = aw_len;
    assign io_master_awsize                         = aw_size;
    assign io_master_awburst                        = aw_burst;

    assign w_ready                                  = io_master_wready;
    assign io_master_wvalid                         = w_valid;
    assign io_master_wdata                          = w_data;
    assign io_master_wlast                          = w_last;
    assign io_master_wstrb                          = w_strb;

    assign io_master_bready                         = b_ready;
    assign b_valid                                  = io_master_bvalid;
    assign b_resp                                   = io_master_bresp;

    wire req_top;
    wire [63:0] rw_data_read;
    wire [63:0] rw_data_write;
    wire [63:0] rw_addr;
    wire [1:0] rw_size;

    ysyx_210243_axi_rw u_axi_rw (
        .clock                          (clock),
        .reset                          (reset),

        .rw_valid_i                     (rw_valid),
        .rw_req_i                       (req_top),
        .data_read_o                    (rw_data_read),
        .data_write_i                   (rw_data_write),
        .rw_addr_i                      (rw_addr),
        .rw_size_i                      (rw_size),
        .rw_strb_i                      (rw_strb),
        .rw_transaction_done_usr        (rw_transaction_done_usr),

        .axi_aw_ready_i                 (aw_ready),
        .axi_aw_valid_o                 (aw_valid),
        .axi_aw_addr_o                  (aw_addr),
        .axi_aw_id_o                    (aw_id),
        .axi_aw_len_o                   (aw_len),
        .axi_aw_size_o                  (aw_size),
        .axi_aw_burst_o                 (aw_burst),

        .axi_w_ready_i                  (w_ready),
        .axi_w_valid_o                  (w_valid),
        .axi_w_data_o                   (w_data),
        .axi_w_strb_o                   (w_strb),
        .axi_w_last_o                   (w_last),
        
        .axi_b_ready_o                  (b_ready),
        .axi_b_valid_i                  (b_valid),
        .axi_b_resp_i                   (b_resp),

        .axi_ar_ready_i                 (ar_ready),
        .axi_ar_valid_o                 (ar_valid),
        .axi_ar_addr_o                  (ar_addr),
        .axi_ar_id_o                    (ar_id),
        .axi_ar_len_o                   (ar_len),
        .axi_ar_size_o                  (ar_size),
        .axi_ar_burst_o                 (ar_burst),
        
        .axi_r_ready_o                  (r_ready),
        .axi_r_valid_i                  (r_valid),
        .axi_r_resp_i                   (r_resp),
        .axi_r_data_i                   (r_data),
        .axi_r_last_i                   (r_last)
    );

    //handshake
    wire if_hs;
    wire mem_hs;
    
    //data
    wire [63:0] if_data_read;
    wire [63:0] mem_data_read;

    wire [63:0] mem_data_write;

    //address
    wire [63:0] if_addr;
    wire [63:0] mem_addr;

    //size
    wire [1:0] if_size;
    wire [1:0] mem_size;

    //other signals
    wire [7:0] mem_strb;
    wire [1:0] mem_op;

    ysyx_210243_axi_interconnect u_axi_interconnect(
        .clock                          (clock),
        .reset                          (reset),

        //input
        .if_size                        (if_size),
        .mem_size                       (mem_size),
        .if_addr                        (if_addr),
        .mem_addr                       (mem_addr),
        .rw_data_read                   (rw_data_read),
        .mem_data_write                 (mem_data_write),
        .mem_op                         (mem_op),
        .mem_strb                       (mem_strb),
        .rw_transaction_done_usr        (rw_transaction_done_usr),

        //output
        .if_hs                          (if_hs),
        .mem_hs                         (mem_hs),
        .rw_size                        (rw_size),  
        .rw_addr                        (rw_addr),
        .rw_strb                        (rw_strb),
        .req                            (req_top),
        .rw_data_write                  (rw_data_write),
        .if_data_read                   (if_data_read),
        .mem_data_read                  (mem_data_read)
    );

    ysyx_210243_cpu u_cpu(
        .clock                          (clock),
        .reset                          (reset),

        //input
        .if_hs                          (if_hs),
        .mem_hs                         (mem_hs), 
        .if_data_read                   (if_data_read),
        .mem_data_read                  (mem_data_read),

        //output
        .if_addr_o                      (if_addr),
        .if_size                        (if_size),
        .mem_data_write                 (mem_data_write),
        .mem_addr                       (mem_addr),
        .mem_size                       (mem_size),
        .mem_strb                       (mem_strb),
        .mem_mem_op                     (mem_op)
    );
    
endmodule


//@file:                axi_rw.v
//@author               Zhong WuJie
module ysyx_210243_axi_rw # (
    parameter RW_DATA_WIDTH     = 64,
    parameter YSYX210243_AXI_DATA_WIDTH    = 7'd64,
    parameter YSYX210243_AXI_ADDR_WIDTH    = 64,
    parameter YSYX210243_AXI_ID_WIDTH      = 4
)(
    input                               clock,
    input                               reset,

	  input                               rw_valid_i,
    input                               rw_req_i,
    output reg [RW_DATA_WIDTH-1:0]      data_read_o,
    input  [RW_DATA_WIDTH-1:0]          data_write_i,
    input  [YSYX210243_AXI_DATA_WIDTH-1:0]         rw_addr_i,
    input  [1:0]                        rw_size_i,
    input  [YSYX210243_AXI_DATA_WIDTH/8-1:0]       rw_strb_i,
    output wire                         rw_transaction_done_usr,

    // Advanced eXtensible Interface
    input                               axi_aw_ready_i,
    output                              axi_aw_valid_o,
    output [31:0]                       axi_aw_addr_o,
    output [YSYX210243_AXI_ID_WIDTH-1:0]           axi_aw_id_o,
    output [7:0]                        axi_aw_len_o,
    output [2:0]                        axi_aw_size_o,
    output [1:0]                        axi_aw_burst_o,

    input                               axi_w_ready_i,
    output                              axi_w_valid_o,
    output [YSYX210243_AXI_DATA_WIDTH-1:0]         axi_w_data_o,
    output [YSYX210243_AXI_DATA_WIDTH/8-1:0]       axi_w_strb_o,
    output reg                          axi_w_last_o,
    
    output                              axi_b_ready_o,
    input                               axi_b_valid_i,
    input  [1:0]                        axi_b_resp_i,

    input                               axi_ar_ready_i,
    output                              axi_ar_valid_o,
    output [31:0]                       axi_ar_addr_o,
    output [YSYX210243_AXI_ID_WIDTH-1:0]           axi_ar_id_o,
    output [7:0]                        axi_ar_len_o,
    output [2:0]                        axi_ar_size_o,
    output [1:0]                        axi_ar_burst_o,
    
    output                              axi_r_ready_o,
    input                               axi_r_valid_i,
    input  [1:0]                        axi_r_resp_i,
    input  [YSYX210243_AXI_DATA_WIDTH-1:0]         axi_r_data_i,
    input                               axi_r_last_i
);

    wire w_trans    = rw_req_i == `YSYX210243_REQ_WRITE;
    wire r_trans    = rw_req_i == `YSYX210243_REQ_READ;
    wire w_valid    = rw_valid_i & w_trans;
    wire r_valid    = rw_valid_i & r_trans;

    // handshake
    wire aw_hs      = axi_aw_ready_i & axi_aw_valid_o;
    wire w_hs       = axi_w_ready_i  & axi_w_valid_o;
    wire b_hs       = axi_b_ready_o  & axi_b_valid_i;
    wire ar_hs      = axi_ar_ready_i & axi_ar_valid_o;
    wire r_hs       = axi_r_ready_o  & axi_r_valid_i;
    wire r_hs_usr   = axi_r_ready_o  & axi_r_valid_i;

    wire r_done     = r_hs & axi_r_last_i;
    wire r_done_usr = r_hs_usr & axi_r_last_i;
    wire trans_done = w_trans ? b_hs : r_done;
    wire trans_done_usr = w_trans ? b_hs : r_done_usr;
    assign rw_transaction_done_usr = trans_done_usr;

    // ------------------State Machine------------------
    localparam [1:0] W_STATE_IDLE = 2'b00, W_STATE_ADDR = 2'b01, W_STATE_WRITE = 2'b10, W_STATE_RESP = 2'b11;
    localparam [1:0] R_STATE_IDLE = 2'b00, R_STATE_ADDR = 2'b01, R_STATE_READ  = 2'b10;

    reg [1:0] w_state, r_state;
    wire w_state_idle = w_state == W_STATE_IDLE, w_state_addr = w_state == W_STATE_ADDR, w_state_write = w_state == W_STATE_WRITE, w_state_resp = w_state == W_STATE_RESP;
    wire r_state_idle = r_state == R_STATE_IDLE, r_state_addr = r_state == R_STATE_ADDR, r_state_read  = r_state == R_STATE_READ;

    // Wirte State Machine
    always @(posedge clock) begin
        if (reset) begin
            w_state <= W_STATE_IDLE;
        end
        else begin
            if (w_valid) begin 
                case (w_state)
                    W_STATE_IDLE:               w_state <= W_STATE_ADDR;
                    W_STATE_ADDR:  if (aw_hs)   w_state <= W_STATE_WRITE;
                    W_STATE_WRITE: begin if (w_hs)  w_state <= W_STATE_RESP; end
                    W_STATE_RESP:  if (b_hs)    begin w_state <= W_STATE_IDLE;end
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
                    R_STATE_IDLE:               r_state <= R_STATE_ADDR;
                    R_STATE_ADDR: if (ar_hs)    r_state <= R_STATE_READ;
                    R_STATE_READ: if (r_done)   r_state <= R_STATE_IDLE;
                    default:;
                endcase
            end
        end
    end

    // ------------------Process Data------------------
    localparam ALIGNED_WIDTH = $clog2(YSYX210243_AXI_DATA_WIDTH / 8); //3
    localparam OFFSET_WIDTH  = $clog2(YSYX210243_AXI_DATA_WIDTH); //6
    // parameter AXI_SIZE      = 3'b010;//$clog2(YSYX210243_AXI_DATA_WIDTH / 8); //3
    localparam MASK_WIDTH    = YSYX210243_AXI_DATA_WIDTH;
    localparam TRANS_LEN     = RW_DATA_WIDTH / YSYX210243_AXI_DATA_WIDTH;
    localparam BLOCK_TRANS   = TRANS_LEN > 1 ? 1'b1 : 1'b0;

    wire aligned            = BLOCK_TRANS | rw_addr_i[ALIGNED_WIDTH-1:0] == 0;
    wire size_b             = rw_size_i == `YSYX210243_SIZE_B;
    wire size_h             = rw_size_i == `YSYX210243_SIZE_H;
    wire size_w             = rw_size_i == `YSYX210243_SIZE_W;
    wire size_d             = rw_size_i == `YSYX210243_SIZE_D;
    wire [3:0] addr_op1     = {{4-ALIGNED_WIDTH{1'b0}}, rw_addr_i[ALIGNED_WIDTH-1:0]};
    wire [3:0] addr_op2     = ({4{size_b}} & {4'b0})
                                | ({4{size_h}} & {4'b1})
                                | ({4{size_w}} & {4'b11})
                                | ({4{size_d}} & {4'b111})
                                ;
    wire [3:0] addr_end     = addr_op1 + addr_op2;
    wire overstep           = addr_end[3:ALIGNED_WIDTH] != 0;

    wire [7:0] axi_len      = aligned ? TRANS_LEN - 1 : {{7{1'b0}}, overstep};
    wire [2:0] axi_size     = {1'b0,rw_size_i}; //AXI_SIZE[2:0];
    
    wire [YSYX210243_AXI_ADDR_WIDTH-1:0] axi_addr          = rw_addr_i; //{rw_addr_i[YSYX210243_AXI_ADDR_WIDTH-1:ALIGNED_WIDTH], {ALIGNED_WIDTH{1'b0}}}; //set the last three bits "0", for the address is
    wire [OFFSET_WIDTH-1:0] aligned_offset_l    = {{OFFSET_WIDTH-ALIGNED_WIDTH{1'b0}}, {rw_addr_i[ALIGNED_WIDTH-1:0]}} << 3; //only one byte
    // wire [OFFSET_WIDTH-1:0] aligned_offset_h    = {(YSYX210243_AXI_DATA_WIDTH - aligned_offset_l)}[OFFSET_WIDTH-1:0];
    wire [MASK_WIDTH-1:0] mask                  = (({MASK_WIDTH{size_b}} & {{MASK_WIDTH-8{1'b0}}, 8'hff})
                                                    | ({MASK_WIDTH{size_h}} & {{MASK_WIDTH-16{1'b0}}, 16'hffff})
                                                    | ({MASK_WIDTH{size_w}} & {{MASK_WIDTH-32{1'b0}}, 32'hffffffff})
                                                    | ({MASK_WIDTH{size_d}} & 64'hffffffff_ffffffff)
                                                    ) << aligned_offset_l;
    wire [YSYX210243_AXI_DATA_WIDTH-1:0] mask_l            = mask[YSYX210243_AXI_DATA_WIDTH-1:0];
    // wire [YSYX210243_AXI_DATA_WIDTH-1:0] mask_h            = mask[MASK_WIDTH-1:YSYX210243_AXI_DATA_WIDTH];

    wire [YSYX210243_AXI_ID_WIDTH-1:0] axi_id              = {YSYX210243_AXI_ID_WIDTH{1'b0}};

        // ------------------Number of transmission------------------
    reg [7:0] len; // burst
    wire len_reset      = reset | (w_trans & w_state_idle) | (r_trans & r_state_idle);
    wire len_incr_en    = (len != axi_len) & (w_hs | r_hs); // burst? there seems to be something wrong.
    always @(posedge clock) begin
        if (len_reset) begin
            len <= 0;
        end
        else if (len_incr_en) begin
            len <= len + 1;
        end
    end

    reg rw_ready;
    wire rw_ready_nxt = trans_done;
    wire rw_ready_en      = trans_done | rw_ready;
    always @(posedge clock) begin
        if (reset) begin
            rw_ready <= 0;
        end
        else if (rw_ready_en) begin
            rw_ready <= rw_ready_nxt;
        end
    end

    // reg [1:0] rw_resp;
    // wire[1:0] rw_resp_nxt = w_trans ? axi_b_resp_i : axi_r_resp_i; //read response signal is not used in this axi protocol
    // wire resp_en = trans_done;
    // always @(posedge clock) begin
    //     if (reset) begin
    //         rw_resp <= 0;
    //     end
    //     else if (resp_en) begin
    //         rw_resp <= rw_resp_nxt;
    //     end
    // end


    // ------------------Write Transaction------------------

    // Write address channel signals
    assign axi_aw_valid_o   = w_state_addr;
    assign axi_aw_addr_o    = axi_addr[31:0];
    assign axi_aw_id_o      = axi_id;
    assign axi_aw_len_o     = axi_len;
    assign axi_aw_size_o    = axi_size;
    assign axi_aw_burst_o   = `YSYX210243_AXI_BURST_TYPE_FIXED;//`YSYX210243_AXI_BURST_TYPE_INCR;

    //Write data channel signals 
    assign axi_w_valid_o    = w_state_write;
    assign axi_w_strb_o     = rw_strb_i;
    assign axi_w_data_o     = data_write_i;
    always @(posedge clock) begin
        if(reset) begin
            axi_w_last_o <= 0;
        end
        else begin 
          if(axi_aw_valid_o & axi_aw_ready_i) axi_w_last_o <= 1'b1;
          if(b_hs) axi_w_last_o <= 1'b0;
        end
    end

    //Write response channel signals
    assign axi_b_ready_o    = w_state_resp;

    // ------------------Read Transaction------------------

    // Read address channel signals
    assign axi_ar_valid_o   = r_state_addr;
    assign axi_ar_addr_o    = axi_addr[31:0];
    assign axi_ar_id_o      = axi_id;
    assign axi_ar_len_o     = axi_len;
    assign axi_ar_size_o    = axi_size;
    assign axi_ar_burst_o   = `YSYX210243_AXI_BURST_TYPE_FIXED; //`YSYX210243_AXI_BURST_TYPE_INCR;

    // Read data channel signals
    assign axi_r_ready_o    = r_state_read;


    wire [YSYX210243_AXI_DATA_WIDTH-1:0] axi_r_data_l  = (axi_r_data_i & mask_l) >> aligned_offset_l;

    always @(posedge clock) begin
      if (reset) begin
        data_read_o <= 0;
      end
      else if (axi_r_ready_o & axi_r_valid_i) begin
        data_read_o <= axi_r_data_l;
      end
    end  

endmodule

//@file:                axi_interconnect.v
//@author               Zhong WuJie

module ysyx_210243_axi_interconnect (
    input                               clock,
    input                               reset,

    input[1:0]                          if_size,
    input[1:0]                          mem_size,
    input[`YSYX210243_AXI_ADDR_WIDTH-1:0]          if_addr,
    input[`YSYX210243_AXI_ADDR_WIDTH-1:0]          mem_addr,
    input[`YSYX210243_AXI_DATA_WIDTH-1:0]          rw_data_read,
    input[`YSYX210243_AXI_DATA_WIDTH-1:0]          mem_data_write,
    input[1:0]                          mem_op, // 00: Nop; 01: Read; 10: Write
    input[7:0]                          mem_strb,
    input wire                          rw_transaction_done_usr,

    output                              req, // write or read
    output reg                          if_hs,
    output reg                          mem_hs,
    output[1:0]                         rw_size,
    output[7:0]                         rw_strb,
    output[`YSYX210243_AXI_ADDR_WIDTH-1:0]         rw_addr,
    output[`YSYX210243_AXI_DATA_WIDTH-1:0]         rw_data_write,
    output[`YSYX210243_AXI_DATA_WIDTH-1:0]         if_data_read,
    output reg[`YSYX210243_AXI_DATA_WIDTH-1:0]     mem_data_read
);  
    localparam AXI_IDLE = 2'b00, AXI_READ_INST = 2'b01, AXI_READ_MEM = 2'b10, AXI_WRITE_MEM = 2'b11;
    reg[1:0] axi_state;
    reg mem_if_bit; //convert read_mem to read_if
    //assign赋值出了问题, 所以不得不在always块中赋值 
    always @(posedge clock) begin
        if(reset)begin
            axi_state     <= AXI_IDLE;
            mem_if_bit    <= 1'b0;
            mem_data_read <= 0;
            if_hs         <= 0;
            mem_hs        <= 0;
        end
        else begin
            case(axi_state)
                AXI_IDLE:    axi_state <= AXI_READ_INST;
                AXI_READ_INST: begin 
                    mem_hs <= 0;
                    if(mem_if_bit == 1'b0) begin 
                        if_hs <= ( mem_op == 2'b00 ) ? rw_transaction_done_usr : 0;
                        axi_state <= ( rw_transaction_done_usr == 1'b0 ) ? AXI_READ_INST :
                            (( mem_op == 2'b00 ) ? AXI_READ_INST :
                            (( mem_op == 2'b01) ? AXI_READ_MEM : AXI_WRITE_MEM ));
                    end
                    else begin if_hs <= rw_transaction_done_usr; 
                            mem_if_bit <= !rw_transaction_done_usr;
                            axi_state <= AXI_READ_INST;
                        end
                end
                AXI_READ_MEM:  begin axi_state <= ( rw_transaction_done_usr == 1'b0 ) ? AXI_READ_MEM : AXI_READ_INST;
                    mem_hs <= rw_transaction_done_usr;
                    if_hs  <= 1'b0;
                    mem_if_bit <= 1'b1;
                    mem_data_read <= rw_data_read;
                end
                AXI_WRITE_MEM: begin axi_state <= ( rw_transaction_done_usr == 1'b0 ) ? AXI_WRITE_MEM : AXI_READ_INST;
                    mem_hs <= rw_transaction_done_usr;
                    if_hs  <= 1'b0; 
                    mem_if_bit <= 1'b1;
                end
               default: ;
            endcase
        end
    end

    assign  { rw_size, rw_addr, req, rw_data_write } =
            ( axi_state == AXI_READ_INST ) ? (( mem_op == 2'b01 && mem_if_bit == 1'b0 ) ? 
            { mem_size, mem_addr, `YSYX210243_REQ_READ, `YSYX210243_ZERO_WORD } : { if_size, if_addr, `YSYX210243_REQ_READ, mem_data_write }): //在写的时候让数据多保持一段时间
            (( axi_state == AXI_READ_MEM ) ? { mem_size, mem_addr, `YSYX210243_REQ_READ, `YSYX210243_ZERO_WORD } :
            (( axi_state == AXI_WRITE_MEM ) ? { mem_size, mem_addr, `YSYX210243_REQ_WRITE, mem_data_write } : 0 ));

    assign rw_strb = mem_strb;
    assign if_data_read = ( axi_state == AXI_READ_INST ) ? rw_data_read : 0;
    // assign mem_data_read = ( axi_state == AXI_READ_MEM ) ? rw_data_read : 0;

endmodule


//@file:                cpu.v
//@author               Zhong WuJie

module ysyx_210243_cpu(
    input                               clock,
    input                               reset,

    input                               if_hs,
    input                               mem_hs,
    input  [63:0]                       if_data_read,
    input  [63:0]                       mem_data_read,

    output [63:0]                       if_addr_o,
    output [1:0]                        if_size,
    output [63:0]                       mem_data_write,
    output [63:0]                       mem_addr,
    output [1:0]                        mem_size,
    output [7:0]                        mem_strb,
    output [1:0]                        mem_mem_op
);

// if_stage
wire [63 : 0]   if_pc;
wire [31 : 0]   if_inst;

// id_stage
// id_stage -> if_stage
// id registers
wire [31 : 0]   id_inst;                        //instruction
wire [63 : 0]   id_pc;
wire [8 : 0]    id_inst_opcode;

wire            id_rs1_r_ena;                   //rs1,rs2,rd
wire [4 : 0]    id_rs1_r_addr;
wire            id_rs2_r_ena;
wire [4 : 0]    id_rs2_r_addr;
wire            id_rd_w_ena;
wire [4 : 0]    id_rd_w_addr;

wire [`YSYX210243_REG_BUS] id_op1;
wire [`YSYX210243_REG_BUS] id_op2;

wire [1 : 0]    id_wb_sel;                      //control signals
wire [1 : 0]    id_mem_op;
wire            id_fence_i_bit;

wire [`YSYX210243_CSR_ID_NUM-1 : 0]id_csr_id;              //csrs
wire            id_csr_wb_ena;

// regfile
// regfile -> id_stage
wire [`YSYX210243_REG_BUS] r_data1;
wire [`YSYX210243_REG_BUS] r_data2;
// regfile -> wb_stage
wire [`YSYX210243_REG_BUS] mtime;
// regfile -> difftest
wire [64*`YSYX210243_CSR_REGS_NUM - 1 : 0] csr_regs;
wire            clint;
                 
// exe_stage
// registers
wire [`YSYX210243_REG_BUS] exe_alu_data;                   //alu data

wire [31 : 0]   exe_inst;                       //instruction
wire [`YSYX210243_REG_BUS] exe_pc;
wire [8 : 0]    exe_inst_opcode;

wire            exe_rs2_r_ena;
wire [`YSYX210243_REG_BUS] exe_r_data2;
wire            exe_rd_w_ena;
wire [4 : 0]    exe_rd_w_addr;

wire [1 : 0]    exe_mem_op;                     //control signals
wire [1 : 0]    exe_wb_sel;

wire            exe_branch_hazard_bit;          //1: adventure; 0: no adventure

wire [`YSYX210243_REG_BUS] exe_csr_wb_data;                //csrs
wire [`YSYX210243_CSR_ID_NUM-1 : 0]exe_csr_id;
wire            exe_csr_wb_ena;

// mem_stage
// mem_stage -> wb_stage
wire [`YSYX210243_REG_BUS] mem_data_out;
// mem_stage -> regfile
wire[`YSYX210243_REG_BUS]  wb_rd_data;

// registers
wire [31 : 0]   mem_inst;                       //instructions
wire [`YSYX210243_REG_BUS] mem_pc;
wire [8 : 0]    mem_inst_opcode;

wire [`YSYX210243_REG_BUS] mem_r_data2;
wire            mem_rd_w_ena;
wire [4 : 0]    mem_rd_w_addr;

wire [`YSYX210243_REG_BUS] mem_alu_data;                   //alu data

wire [1 : 0]    mem_wb_sel;                     //control signals          

wire [`YSYX210243_REG_BUS] mem_csr_wb_data;                //csrs
wire [`YSYX210243_CSR_ID_NUM-1 : 0]mem_csr_id;
wire            mem_csr_wb_ena;

// wb_stage
// registers

wire [`YSYX210243_REG_BUS] wb_pc;                          //instructions
wire [8 : 0]    wb_inst_opcode;

wire [`YSYX210243_REG_BUS] wb_mem_addr;      

wire            wb_ena;                         //wb_stage is valid
wire            wb_next_ena;                    //next wb_stage is valid

wire [`YSYX210243_REG_BUS] wb_r_data2;
wire            wb_rd_w_ena;
wire [4 : 0]    wb_rd_w_addr;

wire [`YSYX210243_REG_BUS] wb_csr_wb_data;                 //csrs
wire [`YSYX210243_CSR_ID_NUM-1 : 0]wb_csr_id;
wire            wb_csr_wb_ena;
          
//adventure control
wire [1 : 0]    forward1;                       //for op1, 00: 没有旁路; 01: exe旁路; 10: mem旁路; 11: wb旁路; 
wire [1 : 0]    forward2;                       //for op2
wire [3 : 0]    hazard_op;                      //1xxx: condition hazard; 0001: data hazard; 0000: no hazard
                                                //1001: update if_reg, clear id_reg; 1010: update if_reg, clear id_reg, exe_reg; 1011: update if_reg, clear id_reg, exe_reg, mem_reg 
ysyx_210243_if_stage If_stage(
  .clk                (clock),
  .rst                (reset),

  //input
  .if_data_read       (if_data_read),
  .if_hs              (if_hs),
  
  .hazard_op          (hazard_op),

  .alu_data           (exe_alu_data),           
  .clint              (clint),                  //interrupt
  .csr_regs_i         (csr_regs),
  

  //output
  .if_pc              (if_pc),
  .if_inst            (if_inst),
  .if_addr_o          (if_addr_o),
  .if_size            (if_size)
);

ysyx_210243_id_stage Id_stage(
  .clk                (clock),
  .rst                (reset),

  //----------input---------------
  .if_hs              (if_hs),                  //cpu.v
 
  .if_inst            (if_inst),                //instruction
  .if_pc              (if_pc), 
 
  .rs1_data           (r_data1),                //rs1, rs2
  .rs2_data           (r_data2),
  
  .hazard_op          (hazard_op),
  .clint              (clint),
  //----------output---------------
  .id_inst            (id_inst),                //instruction
  .id_pc              (id_pc),
  .id_inst_opcode     (id_inst_opcode),

  .id_op1             (id_op1),                 //operations to exe
  .id_op2             (id_op2),
  
  .id_mem_op          (id_mem_op),              //control signals
  .id_wb_sel          (id_wb_sel),
  .id_fence_i_bit     (id_fence_i_bit),

  .csr_wb_ena         (id_csr_wb_ena),          //csrs
  .csr_id             (id_csr_id),

  .id_rs1_r_ena       (id_rs1_r_ena),           //rs1,rs2,rd
  .id_rs1_r_addr      (id_rs1_r_addr),
  .id_rs2_r_ena       (id_rs2_r_ena),
  .id_rs2_r_addr      (id_rs2_r_addr),
  .id_rd_w_ena        (id_rd_w_ena),
  .id_rd_w_addr       (id_rd_w_addr)
  
);

ysyx_210243_exe_stage Exe_stage(
  .clk                (clock),
  .rst                (reset),

  //--------------input---------------
  .if_hs              (if_hs),                  //cpu.v
  .id_inst            (id_inst),                //instruction
  .id_pc              (id_pc),
  .id_inst_opcode     (id_inst_opcode),
  .mem_inst_opcode    (mem_inst_opcode),

  .id_op1             (id_op1),
  .id_op2             (id_op2),

  .mem_data_out       (mem_data_out),
  .mem_alu_data       (mem_alu_data),
  .wb_rd_data         (wb_rd_data),

  .id_mem_op          (id_mem_op),              //control signals
  .id_wb_sel          (id_wb_sel),
  .hazard_op          (hazard_op),
  .clint              (clint),
  .id_fence_i_bit     (id_fence_i_bit),

  .forward1           (forward1),
  .forward2           (forward2),

  //rs1,rs2,rd
  .id_rs2_r_ena       (id_rs2_r_ena),
  .id_r_data1         (r_data1),
  .id_r_data2         (r_data2),
  .id_rd_w_ena        (id_rd_w_ena),
  .id_rd_w_addr       (id_rd_w_addr),
  
  .csr_regs_i         (csr_regs),               //csrs
  .id_csr_id          (id_csr_id),
  .id_csr_wb_ena      (id_csr_wb_ena),

  //---------------output----------------  
  .exe_inst           (exe_inst),               //instruction
  .exe_pc             (exe_pc),
  .exe_inst_opcode    (exe_inst_opcode),

  .exe_mem_op         (exe_mem_op),             //control signals
  .exe_wb_sel         (exe_wb_sel),
  .exe_branch_hazard_bit  (exe_branch_hazard_bit),

  .exe_alu_data       (exe_alu_data),

  .exe_rs2_r_ena      (exe_rs2_r_ena),
  .exe_r_data2        (exe_r_data2),
  .exe_rd_w_ena       (exe_rd_w_ena),
  .exe_rd_w_addr      (exe_rd_w_addr),

  .exe_csr_wb_data    (exe_csr_wb_data),        //csrs
  .exe_csr_id         (exe_csr_id),
  .exe_csr_wb_ena     (exe_csr_wb_ena)
);

ysyx_210243_mem_stage Mem_Stage(
  .clk                (clock),
  .rst                (reset),

  //-------------input------------
  //instruction
  .exe_inst           (exe_inst),
  .exe_pc             (exe_pc),
  .exe_inst_opcode    (exe_inst_opcode),
  //alu data
  .exe_alu_data       (exe_alu_data),
  
  //control signals
  .exe_mem_op         (exe_mem_op),
  .exe_wb_sel         (exe_wb_sel),
  .clint              (clint),

  //rs1,rs2,rd
  .exe_rs2_r_ena      (exe_rs2_r_ena),
  .exe_r_data2        (exe_r_data2),
  .exe_rd_w_ena       (exe_rd_w_ena),
  .exe_rd_w_addr      (exe_rd_w_addr),

  .exe_csr_wb_data    (exe_csr_wb_data),        //csrs
  .exe_csr_id         (exe_csr_id),
  .exe_csr_wb_ena     (exe_csr_wb_ena),

  //cpu.v
  .mem_hs             (mem_hs),
  .if_hs              (if_hs),
  .mem_data_read      (mem_data_read),

  //-----------output--------------
  //instruction
  .mem_inst           (mem_inst),
  .mem_pc             (mem_pc),
  .mem_inst_opcode    (mem_inst_opcode),

  .mem_mem_op         (mem_mem_op),             //conrol signals
  .mem_wb_sel         (mem_wb_sel),

  .mem_data_out       (mem_data_out),
  .mem_data_write     (mem_data_write),
  //cpu.v
  .mem_strb           (mem_strb),
  .mem_addr           (mem_addr),
  .mem_size           (mem_size),

  //alu data
  .mem_alu_data       (mem_alu_data),

  //rs1,rs2,rd
  .mem_r_data2        (mem_r_data2),
  .mem_rd_w_ena       (mem_rd_w_ena),
  .mem_rd_w_addr      (mem_rd_w_addr),

  .mem_csr_wb_data    (mem_csr_wb_data),        //csrs
  .mem_csr_id         (mem_csr_id),
  .mem_csr_wb_ena     (mem_csr_wb_ena)
);

ysyx_210243_wb_stage Wb_Stage (
  .clk                (clock),
  .rst                (reset),

  //----------input-------------
  .mem_inst           (mem_inst),
  .mem_inst_opcode    (mem_inst_opcode),
  .mem_pc             (mem_pc),                 //instruction

  .mem_alu_data       (mem_alu_data),           //alu data

  .mem_wb_sel         (mem_wb_sel),             //control signals
  .mem_data_out       (mem_data_out),
  .clint              (clint),
  
  .mem_addr           (mem_addr),               //cpu.v
  .if_hs              (if_hs),
  
  .mtime              (mtime),                  //csrs

  .mem_r_data2        (mem_r_data2),
  .mem_rd_w_ena       (mem_rd_w_ena),
  .mem_rd_w_addr      (mem_rd_w_addr),

  .mem_csr_wb_data    (mem_csr_wb_data),        //csrs
  .mem_csr_id         (mem_csr_id),
  .mem_csr_wb_ena     (mem_csr_wb_ena),
  
  //---------output------------
  .wb_pc              (wb_pc),
  .wb_inst_opcode     (wb_inst_opcode),

  .wb_r_data2         (wb_r_data2),
  .wb_rd_w_ena        (wb_rd_w_ena),
  .wb_rd_w_addr       (wb_rd_w_addr),

  .wb_csr_wb_data     (wb_csr_wb_data),         //csrs
  .wb_csr_id          (wb_csr_id),
  .wb_csr_wb_ena      (wb_csr_wb_ena),

  .wb_mem_addr        (wb_mem_addr),

  .wb_ena             (wb_ena),
  .wb_next_ena        (wb_next_ena),

  .wb_rd_data         (wb_rd_data)
);

ysyx_210243_regfile Regfile(
  .clk                (clock),
  .rst                (reset),

  //-----------input------------
  .wb_pc              (wb_pc),                  //instructions
  .wb_inst_opcode     (wb_inst_opcode),
   
  .wb_ena             (wb_ena),                 //control signals
  .wb_next_ena        (wb_next_ena),

  .if_hs              (if_hs),                  //cpu.v

  .wb_mem_addr        (wb_mem_addr),

  .csr_wb_data        (wb_csr_wb_data),         //csrs
  .csr_id             (wb_csr_id),
  .csr_wb_ena         (wb_csr_wb_ena),

  .r_addr1            (id_rs1_r_addr),          //rs1,rs2,rd
  .r_ena1             (id_rs1_r_ena),
  .r_addr2            (id_rs2_r_addr),
  .r_ena2             (id_rs2_r_ena),
  .w_addr             (wb_rd_w_addr),
  .w_data             (wb_rd_data),
  .w_ena              (wb_rd_w_ena),
  .wb_r_data2         (wb_r_data2),
  
  //-----------output------------
  .r_data1            (r_data1),
  .r_data2            (r_data2),   

  .clint              (clint),                  //interrupt
  .mtime              (mtime),                  //csrs
  .csr_regs_o         (csr_regs)
);

ysyx_210243_adventure_control Adventure_Control(
  .rst                (reset),

  .id_rs1_r_addr      (id_rs1_r_addr),
  .id_rs2_r_addr      (id_rs2_r_addr),
  .mem_rd_w_addr      (mem_rd_w_addr),
  .mem_rd_w_ena       (mem_rd_w_ena),
  .exe_rd_w_addr      (exe_rd_w_addr),
  .exe_rd_w_ena       (exe_rd_w_ena),
  .wb_rd_w_addr       (wb_rd_w_addr),
  .wb_rd_w_ena        (wb_rd_w_ena),
  .exe_inst_opcode    (exe_inst_opcode),
  .id_inst_opcode     (id_inst_opcode),
  .exe_branch_hazard_bit  (exe_branch_hazard_bit),

  .forward1           (forward1),
  .forward2           (forward2),
  .hazard_op          (hazard_op)
);

endmodule


//@file:                adventure_control.v
//@author:              Zhong WuJie
//@note:                handled data hazard and branch hazard
module ysyx_210243_adventure_control (
    input wire          rst,
    input wire [4 : 0]  id_rs1_r_addr,
    input wire [4 : 0]  id_rs2_r_addr,
    input wire [4 : 0]  mem_rd_w_addr,
    input wire          mem_rd_w_ena,
    input wire [4 : 0]  exe_rd_w_addr,
    input wire          exe_rd_w_ena,
    input wire [4 : 0]  wb_rd_w_addr,
    input wire          wb_rd_w_ena,
    input wire [8 : 0]  id_inst_opcode,
    input wire [8 : 0]  exe_inst_opcode,
    input wire          exe_branch_hazard_bit,

    output wire[1 : 0]  forward1,
    output wire[1 : 0]  forward2,
    output wire[3 : 0]  hazard_op    
);
    wire exe_inst_load_bit  =   exe_inst_opcode == `YSYX210243_INST_LB || exe_inst_opcode == `YSYX210243_INST_LH || exe_inst_opcode == `YSYX210243_INST_LW ||
                                exe_inst_opcode == `YSYX210243_INST_LBU || exe_inst_opcode == `YSYX210243_INST_LHU || exe_inst_opcode == `YSYX210243_INST_LWU || exe_inst_opcode == `YSYX210243_INST_LD;
    
    wire id_inst_sr_bit = id_inst_opcode == `YSYX210243_INST_SLLI || id_inst_opcode == `YSYX210243_INST_SRLI || id_inst_opcode == `YSYX210243_INST_SRAI ||
                          id_inst_opcode == `YSYX210243_INST_SLLIW || id_inst_opcode == `YSYX210243_INST_SRLIW || id_inst_opcode == `YSYX210243_INST_SRAIW ; 
    //forwarding unit   
    assign forward1 =   (rst == 1'b1) ? 2'b00 :
                        (( !exe_inst_load_bit && exe_rd_w_ena && (exe_rd_w_addr != 0) && (exe_rd_w_addr == id_rs1_r_addr))  ? 2'b01 : //exe旁路,load指令不存在exe的旁路
                        (( mem_rd_w_ena && (mem_rd_w_addr != 0) && (mem_rd_w_addr == id_rs1_r_addr) &&
                        !(exe_rd_w_ena && (exe_rd_w_addr != 0) && (exe_rd_w_addr == id_rs1_r_addr))) ? 2'b10 :                        //mem旁路
                        (( wb_rd_w_ena && (wb_rd_w_addr != 0) && (wb_rd_w_addr == id_rs1_r_addr)  &&
                        !(mem_rd_w_ena && (mem_rd_w_addr != 0) && (mem_rd_w_addr == id_rs1_r_addr)) &&
                        !(exe_rd_w_ena && (exe_rd_w_addr != 0) && (exe_rd_w_addr == id_rs1_r_addr))) ? 2'b11 : 2'b00 )));             //wb旁路

    assign forward2 =   (rst == 1'b1 || id_inst_sr_bit == 1'b1) ? 2'b00 :                                                         //移位的r型指令不需要s2的旁路
                    (( !exe_inst_load_bit && exe_rd_w_ena && (exe_rd_w_addr != 0) && (exe_rd_w_addr == id_rs2_r_addr))  ? 2'b01 : //exe旁路
                    (( mem_rd_w_ena && (mem_rd_w_addr != 0) && (mem_rd_w_addr == id_rs2_r_addr) &&
                    !(exe_rd_w_ena && (exe_rd_w_addr != 0) && (exe_rd_w_addr == id_rs2_r_addr))) ? 2'b10 :                        //mem旁路
                    (( wb_rd_w_ena && (wb_rd_w_addr != 0) && (wb_rd_w_addr == id_rs2_r_addr)  &&
                    !(mem_rd_w_ena && (mem_rd_w_addr != 0) && (mem_rd_w_addr == id_rs2_r_addr)) &&
                    !(exe_rd_w_ena && (exe_rd_w_addr != 0) && (exe_rd_w_addr == id_rs2_r_addr))) ? 2'b11 : 2'b00 )));             //wb旁路
    
    //harzard detection
    assign hazard_op=   (rst == 1'b1) ? 4'b0000 :
                        (( exe_inst_load_bit && exe_rd_w_ena && (exe_rd_w_addr != 0) &&  (exe_rd_w_addr == id_rs2_r_addr || exe_rd_w_addr == id_rs1_r_addr)) ? 4'b0001  :  //取数,使用冒险
                        ((( exe_branch_hazard_bit == 1'b1 )) ? 4'b1010 : 4'b0000));                                                                                        //分支冒险                 

endmodule


//@file:                if_stage.v
//@author:              Zhong WuJie
module ysyx_210243_if_stage(
  input wire clk,
  input wire rst,
  
  //input
  input  [63:0] if_data_read,
  input  if_hs,
  input  wire [3 : 0] hazard_op,
  input  [63:0] alu_data,
  input  wire [64*`YSYX210243_CSR_REGS_NUM - 1 : 0] csr_regs_i,
  input  clint,

  //output
  output reg [63:0] if_pc,
  output reg [31:0] if_inst,
  output wire[63:0] if_addr_o,
  output [1:0] if_size
);
//csrs
wire [`YSYX210243_REG_BUS] csr_regs[0 : `YSYX210243_CSR_REGS_NUM-1];
genvar i;
generate
  for (i = 0; i < `YSYX210243_CSR_REGS_NUM; i = i + 1) begin : generate_block_if 
    assign csr_regs[i] = csr_regs_i[(i+1)*64-1:i*64];
  end
endgenerate

reg [63:0] if_addr;

// fetch an instruction
always @( posedge clk ) begin
  if (rst) begin
    if_pc <= `YSYX210243_PC_START;
    if_inst <= 0;
    if_addr <= `YSYX210243_PC_START;
  end
  else if (if_hs == 1'b1) begin
    if (hazard_op == 4'b0001 && clint == 1'b0);     //中断优先级比hazard更高
    else begin
      if_inst <= if_data_read[31:0]; //to deal with interruption
      if_pc <= if_addr;
      if_addr <= if_addr + 4;
    end
  end
  else begin
    if( clint == 1'b1 && csr_regs[`YSYX210243_CSR_MIE_USR] == `YSYX210243_CSR_MIE_INTERRUPT_VALUE) begin if_addr <= csr_regs[`YSYX210243_CSR_MTVEC_USR];end
    else begin if( hazard_op >= 4'b1000 ) if_addr <= alu_data; end
  end
end

assign if_addr_o = ( clint == 1'b1 && csr_regs[`YSYX210243_CSR_MIE_USR] == `YSYX210243_CSR_MIE_INTERRUPT_VALUE) ? csr_regs[`YSYX210243_CSR_MTVEC_USR] :
                   (( hazard_op >= 4'b1000 ) ? alu_data : if_addr);
assign if_size = `YSYX210243_SIZE_W;

endmodule

//@file:                id_stage.v
//@author:              Zhong WuJie
module ysyx_210243_id_stage(
  input wire            clk,
  input wire            rst,
  
  input wire            if_hs,

  input wire [31 : 0]   if_inst,
  input wire [`YSYX210243_REG_BUS] if_pc,

  input wire [`YSYX210243_REG_BUS] rs1_data,
  input wire [`YSYX210243_REG_BUS] rs2_data,

  input wire [3 : 0]    hazard_op,
  input wire            clint,

  output reg  [31 : 0]  id_inst,
  output reg  [`YSYX210243_REG_BUS]id_pc,
  output wire [8 : 0]   id_inst_opcode,

  output wire [`YSYX210243_REG_BUS]id_op1,
  output wire [`YSYX210243_REG_BUS]id_op2,

  output wire [1 : 0]   id_mem_op,    //00: 不操作, 01: 读操作, 10: 写操作
  output wire [1 : 0]   id_wb_sel,    //2'b00: wb_data = 0; 2'b01: wb_data = alu; 
                                      //2'b10: wb_data = pc + 4; 2'b11: wb_data = mem;

  output wire           id_fence_i_bit,

  output wire           csr_wb_ena,   //csrs
  output wire [`YSYX210243_CSR_ID_NUM-1 : 0]csr_id,

  output wire           id_rs1_r_ena, //rs1,rs2,rd
  output wire [4 : 0]   id_rs1_r_addr,
  output wire           id_rs2_r_ena,
  output wire [4 : 0]   id_rs2_r_addr,
  output wire           id_rd_w_ena,
  output wire [4 : 0]   id_rd_w_addr
  
);
//change registers
always @(posedge clk) begin
  if (rst) begin
      id_inst <= 0;
      id_pc   <= 0;
  end
  else begin
    if (if_hs) begin
      if(hazard_op == 4'b0001 && clint != 1'b1);
      else if (hazard_op >= 4'b1001 || clint == 1'b1) begin
        id_inst <= 0;
        id_pc   <= 0;
      end
      else begin
        id_inst <= if_inst;
        id_pc   <= if_pc;
      end
    end
  end
end

//regs definition
wire [6 : 0]opcode;
wire [4 : 0]rd;
wire [2 : 0]func3;
wire        func7_2; //func7取第2位
wire [4 : 0]rs1;
wire [4 : 0]rs2;

//imms definition
wire [4  : 0]imm5;
wire [11 : 0]imm12;
wire [19 : 0]imm20;
wire [`YSYX210243_REG_BUS]imm;

wire [11:0] csr_type;

wire [5:0]shamt;

assign opcode   =   id_inst[6:0];
assign func7_2  =   id_inst[30];
assign shamt    =   id_inst[25:20];
assign id_fence_i_bit = id_inst == 32'h0000100f;
//--------------id_inst_type and csr_type------------------- 


//r: 000001, i: 000010, s: 000100, b: 001000, u: 010000, j: 100000
//注意: 要防止i型和r型指令发生冲突
wire inst_r = ( ~opcode[2] & opcode[4] & opcode[5] & ~opcode[6] ) ||                        //0110011,0111011
( func3[0] & ~func3[1] & ~opcode[2] & ~opcode[3] & opcode[4] & ~opcode[5] & ~opcode[6] ) || //01 0010011
( func3[0] & ~func3[1] & ~opcode[2] & opcode[3] & opcode[4] & ~opcode[5] & ~opcode[6] );    //01 0011011

wire inst_i = ( ~inst_r & ~opcode[2] & ~opcode[3] & ~opcode[5] & ~opcode[6]) ||             //00x0011, exclude 01 0010011
              ( ~func3[0] & ~func3[1] & ~func3[2]  & ~opcode[2] 
               &opcode[3] & opcode[4] & ~opcode[5] & ~opcode[6] ) ||                        //000 0011011
              ( opcode[2] & ~opcode[3] & ~opcode[4] & opcode[5] & opcode[6] );              //1100111

wire inst_s = ~opcode[2] & ~opcode[3] & ~opcode[4] & opcode[5] & ~opcode[6];                //0100011
wire inst_b = ~opcode[2] & ~opcode[3] & ~opcode[4] & opcode[5] & opcode[6];                 //1100011
wire inst_u = opcode[2] & ~opcode[3] & opcode[4] & ~opcode[6];                              //0x10111
wire inst_j = opcode[2] & opcode[3] & ~opcode[4] & opcode[5] & opcode[6];                   //1101111
wire inst_p = ( ~opcode[2] & ~opcode[3] & opcode[4] & opcode[5] & opcode[6] &               //1110011, 不包括ecall,mret
              (func3[0] || func3[1] || func3[2]));         

wire inst_pr = id_inst_opcode == `YSYX210243_INST_CSRRW || id_inst_opcode == `YSYX210243_INST_CSRRS || id_inst_opcode == `YSYX210243_INST_CSRRC;
wire inst_pi = id_inst_opcode == `YSYX210243_INST_CSRRWI || id_inst_opcode == `YSYX210243_INST_CSRRSI || id_inst_opcode == `YSYX210243_INST_CSRRCI;

//id_inst_opcode = func7/0 + func3/000 + opcode[6:2]
assign id_inst_opcode[8] = ( rst == 1'b1 ) ? 0 : (( inst_r == 1'b1 ) ? func7_2 : 
                        (( id_inst == 32'b0011000_00010_00000_000_00000_1110011 ) ? 1 : 0));
assign id_inst_opcode[7:5] = ( rst == 1'b1 || inst_u  ==  1'b1 || inst_j  ==  1'b1 ) ? 0 : func3;
assign id_inst_opcode[4:0] = ( rst == 1'b1 ) ? 0 : opcode[6:2];

assign csr_type = ( rst == 1'b1 ) ? 0 : id_inst[31 : 20];

//-----------------------------------------------------------------------

//---------------- regs and enable or select bit ------------------------
assign rd = ( inst_r == 1'b1 || inst_i == 1'b1 || inst_u == 1'b1 || inst_j == 1'b1 || inst_p == 1'b1 ) ? id_inst[11:7] : 0; //r,i,u,j,p类型
assign func3 = ( inst_u == 1'b0 && inst_j == 1'b0 ) ? id_inst[14:12] : 0; //r,i,s,b,p类型
assign rs1 = ( inst_r == 1'b1 || inst_i == 1'b1 || inst_s == 1'b1 || inst_b == 1'b1 || inst_pr == 1'b1) ? id_inst[19:15] : 0; //r,i,s,b类型,以及CSRR命令
assign rs2 = ( inst_r == 1'b1 || inst_s == 1'b1 || inst_b == 1'b1 ) ? id_inst[24:20] : 0; //r,s,b类型

//处理imm
assign imm5 = ( inst_pi == 1'b1 ) ? id_inst[19:15] : 0;
assign imm12 = (  inst_i == 1'b1 ) ? id_inst[31:20] :                                             //imm考虑了i,u,b,s,j类型
               (( inst_b == 1'b1 ) ? {id_inst[31],id_inst[7],id_inst[30:25],id_inst[11:8]} : 
               (( inst_s == 1'b1 ) ? {id_inst[31:25],id_inst[11:7]} : 0)); 
assign imm20 = (  inst_u == 1'b1 ) ? id_inst[31:12] : 
               (( inst_j == 1'b1 ) ? {id_inst[31],id_inst[19:12],id_inst[20],id_inst[30:21]} : 0);
assign imm = (  inst_u == 1'b1 ) ? {{32{imm20[19]}},imm20,{12{1'b0}}} :                           //auipc, lui
             (( inst_j == 1'b1 ) ? {{43{imm20[19]}},imm20,1'b0} :                                 //jal
             (( inst_i == 1'b1 || inst_s == 1'b1) ? {{52{imm12[11]}},imm12} : 
             (( inst_b == 1'b1 ) ? {{51{imm12[11]}},imm12,1'b0} :                                 //addi,jalr
             (( inst_pi == 1'b1 ) ? {{59{1'b0}},imm5} : 0))));                                    //csrri, csrrwi, csrrci

assign id_rs1_r_ena  = ( rst == 1'b1 ) ? 0 : ( inst_r == 1'b1 || inst_i == 1'b1 || inst_s == 1'b1 || inst_b == 1'b1 || inst_pr == 1'b1 ); //inst属于{r,i,s,b} or csrr ,rs1使能
assign id_rs1_r_addr = ( rst == 1'b1 ) ? 0 : ( id_rs1_r_ena == 1'b1 ? rs1 : 0 );
assign id_rs2_r_ena  = ( rst == 1'b1 ) ? 0 : ( inst_r == 1'b1 || inst_s == 1'b1 || inst_b == 1'b1 ); //inst属于{r,s,b},rs2使能
assign id_rs2_r_addr = ( rst == 1'b1 ) ? 0 : ( id_rs2_r_ena == 1'b1 ? rs2 : 0 );

assign id_rd_w_ena   = ( rst == 1'b1 ) ? 0 : ( inst_r == 1'b1 || inst_i == 1'b1 || inst_u == 1'b1 || inst_j == 1'b1 || inst_p == 1'b1 ); //inst属于{r,i,u,j,p},rd使能
assign id_rd_w_addr  = ( rst == 1'b1 ) ? 0 : ( id_rd_w_ena == 1'b1 ? rd : 0 );

assign csr_wb_ena = ( rst == 1'b1 ) ? 0 : (( inst_p == 1'b1 ) ? 1'b1 : 0 );
assign csr_id = (  csr_type == `YSYX210243_CSR_MSTATUS ) ? `YSYX210243_CSR_MSTATUS_USR :
								(( csr_type == `YSYX210243_CSR_MTVEC ) ? `YSYX210243_CSR_MTVEC_USR :
								(( csr_type == `YSYX210243_CSR_MEPC ) ? `YSYX210243_CSR_MEPC_USR :
								(( csr_type == `YSYX210243_CSR_MCAUSE ) ? `YSYX210243_CSR_MCAUSE_USR :
								(( csr_type == `YSYX210243_CSR_MCYCLE ) ? `YSYX210243_CSR_MCYCLE_USR : 
                (( csr_type == `YSYX210243_CSR_MIE ) ? `YSYX210243_CSR_MIE_USR :
                (( csr_type == `YSYX210243_CSR_MIP ) ? `YSYX210243_CSR_MIP_USR :
                (( csr_type == `YSYX210243_CSR_MSCRATCH ) ? `YSYX210243_CSR_MSCRATCH_USR :
                (( csr_type == `YSYX210243_CSR_MHARTID ) ? `YSYX210243_CSR_MHARTID_USR : 0))))))));

//----------------------------------------------------------------------

//---------------control bits-------------------------------------------
assign id_wb_sel = ( rst == 1'b1 ) ? 2'b0 : 
                  (( id_inst_opcode == `YSYX210243_INST_JAL || id_inst_opcode == `YSYX210243_INST_JALR) ? 2'b10 : //跳转指令
                  (( opcode == 7'b0000011 || id_inst_opcode == `YSYX210243_INST_LWU || id_inst_opcode == `YSYX210243_INST_LD) ? 2'b11 : //load相关指令
                  (( inst_s == 1'b1 ) ? 2'b00 : 2'b01))); //save相关指令
assign id_mem_op = ( rst == 1'b1 ) ? 2'b0 :
                  (( opcode == 7'b0000011 || id_inst_opcode == `YSYX210243_INST_LWU || id_inst_opcode == `YSYX210243_INST_LD) ? 2'b01 : //处理load相关指令
                  (( inst_s == 1'b1) ? 2'b10 : 2'b00)); //处理save相关指令
//----------------------------------------------------------------------

//---------------------------operations---------------------------------
//大部分指令选择rs1_data
assign id_op1 = ( rst == 1'b1 )? 0 : (( id_inst_opcode == `YSYX210243_INST_AUIPC || id_inst_opcode == `YSYX210243_INST_JAL || inst_b == 1'b1)? id_pc : //跳转指令
                                      (( id_inst_opcode == `YSYX210243_INST_LUI ) ? 0 : rs1_data)); 
assign id_op2 = ( rst == 1'b1 )? 0 : (( inst_i == 1'b1 || inst_u == 1'b1 || inst_j == 1'b1 || inst_b == 1'b1 || inst_s == 1'b1 || inst_pi == 1'b1) ? imm : 
                                      (( id_inst_opcode == `YSYX210243_INST_SLLI || id_inst_opcode == `YSYX210243_INST_SRLI || id_inst_opcode == `YSYX210243_INST_SRAI || //移位相关指令
                                         id_inst_opcode == `YSYX210243_INST_SLLIW || id_inst_opcode == `YSYX210243_INST_SRLIW || id_inst_opcode == `YSYX210243_INST_SRAIW) ? 
                                         {58'b0,shamt} : rs2_data ));

endmodule


//@file:                exe_stage.v
//@author:              Zhong WuJie
module ysyx_210243_exe_stage(
  input wire                  clk,
  input wire                  rst,

  input wire                  if_hs,
  input wire [31 : 0]         id_inst,
  input wire [`YSYX210243_REG_BUS]       id_pc,
  input wire [8 : 0]          id_inst_opcode,
  input wire [8 : 0]          mem_inst_opcode,

  input wire signed [`YSYX210243_REG_BUS]id_op1,
  input wire [`YSYX210243_REG_BUS]       id_op2,

  input wire [`YSYX210243_REG_BUS]       mem_data_out,
  input wire [`YSYX210243_REG_BUS]       mem_alu_data,
  input wire [`YSYX210243_REG_BUS]       wb_rd_data,

  input wire [1 : 0]          id_mem_op,
  input wire [1 : 0]          id_wb_sel,
  input wire [3 : 0]          hazard_op,
  input wire                  clint,
  input wire                  id_fence_i_bit,

  input wire [1 : 0]          forward1,
  input wire [1 : 0]          forward2,

  input wire                  id_rs2_r_ena,
  input wire [`YSYX210243_REG_BUS]       id_r_data1,
  input wire [`YSYX210243_REG_BUS]       id_r_data2,
  input wire                  id_rd_w_ena,
  input wire [4 : 0]          id_rd_w_addr,

  input  wire [64*`YSYX210243_CSR_REGS_NUM - 1 : 0] csr_regs_i,
  input wire [`YSYX210243_CSR_ID_NUM-1:0]  id_csr_id,
  input wire                  id_csr_wb_ena,
  
  output reg [31 : 0]         exe_inst,
  output reg [`YSYX210243_REG_BUS]       exe_pc,
  output reg [8 : 0]          exe_inst_opcode,

  output reg [1 : 0]          exe_mem_op,
  output reg [1 : 0]          exe_wb_sel,
  output reg                  exe_branch_hazard_bit,

  output reg [`YSYX210243_REG_BUS]       exe_alu_data,

  output reg                  exe_rs2_r_ena,
  output reg [`YSYX210243_REG_BUS]       exe_r_data2,
  output reg                  exe_rd_w_ena,
  output reg [4 : 0]          exe_rd_w_addr,

  output wire [`YSYX210243_REG_BUS]      exe_csr_wb_data,
  output reg [`YSYX210243_CSR_ID_NUM-1:0]  exe_csr_id,
  output reg                  exe_csr_wb_ena
);
//csrs
wire [`YSYX210243_REG_BUS] csr_regs[0 : `YSYX210243_CSR_REGS_NUM-1];
genvar i;
generate
  for (i = 0; i < `YSYX210243_CSR_REGS_NUM; i = i + 1) begin : generate_block_exe
    assign csr_regs[i] = csr_regs_i[(i+1)*64-1:i*64];
  end
endgenerate

reg [`YSYX210243_REG_BUS]       exe_r_data1;
//判断id_inst是否是load类型
wire mem_inst_load_bit = mem_inst_opcode == `YSYX210243_INST_LB || mem_inst_opcode == `YSYX210243_INST_LH || mem_inst_opcode == `YSYX210243_INST_LW ||
                         mem_inst_opcode == `YSYX210243_INST_LBU || mem_inst_opcode == `YSYX210243_INST_LHU || mem_inst_opcode == `YSYX210243_INST_LWU || mem_inst_opcode == `YSYX210243_INST_LD;
//判断id_inst是否是rs1和rs2的比较类指令                         
wire id_inst_c_bit     = id_inst_opcode == `YSYX210243_INST_BEQ || id_inst_opcode == `YSYX210243_INST_BNE || id_inst_opcode == `YSYX210243_INST_BLT || id_inst_opcode == `YSYX210243_INST_BLTU ||
                         id_inst_opcode == `YSYX210243_INST_BGE || id_inst_opcode == `YSYX210243_INST_BGEU || id_inst_opcode == `YSYX210243_INST_SLT || id_inst_opcode == `YSYX210243_INST_SLTU;
//判断id_inst是否是save类型指令
wire id_inst_s_bit     = id_inst_opcode == `YSYX210243_INST_SB || id_inst_opcode == `YSYX210243_INST_SH || id_inst_opcode == `YSYX210243_INST_SW || id_inst_opcode == `YSYX210243_INST_SD;

//判断id_inst是否是csrr类型
wire id_inst_csr_bit   = id_inst_opcode == `YSYX210243_INST_CSRRW || id_inst_opcode == `YSYX210243_INST_CSRRS || id_inst_opcode == `YSYX210243_INST_CSRRC || id_inst_opcode == `YSYX210243_INST_CSRRWI ||
                         id_inst_opcode == `YSYX210243_INST_CSRRSI || id_inst_opcode == `YSYX210243_INST_CSRRCI ;

wire [1:0] cmp_out_ss;                        //两个寄存器间比较的结果
wire [1:0] cmp_out_si;                        //寄存器和立即数之间比较
reg signed [`YSYX210243_REG_BUS]   exe_op1;
reg        [`YSYX210243_REG_BUS]   exe_op2;
wire       [`YSYX210243_REG_BUS]   csr_wb_data;
wire [11:0] csr_type = ( rst == 1'b1 ) ? 0 : exe_inst[31 : 20];
//change registers
always @(posedge clk) begin
    if (rst) begin
      exe_inst        <= 0;
      exe_pc          <= 0;
      exe_inst_opcode <= 0;
      exe_mem_op      <= 0;
      exe_wb_sel      <= 0;
      exe_rs2_r_ena   <= 0;
      exe_r_data1     <= 0;
      exe_r_data2     <= 0;
      exe_rd_w_ena    <= 0;
      exe_rd_w_addr   <= 0;
      exe_op1         <= 0;
      exe_op2         <= 0;
      exe_csr_id      <= 0;
      exe_csr_wb_ena  <= 0;
  end
  else begin
    if (if_hs) begin
      if(hazard_op == 4'b0001 || hazard_op >= 4'b1010 || clint == 1'b1 || id_fence_i_bit == 1'b1) begin
        exe_inst        <= 0;
        exe_pc          <= 0;
        exe_inst_opcode <= 0;
        exe_mem_op      <= 0;
        exe_wb_sel      <= 0;
        exe_rs2_r_ena   <= 0;
        exe_r_data1     <= 0;
        exe_r_data2     <= 0;
        exe_rd_w_ena    <= 0;
        exe_rd_w_addr   <= 0;
        exe_op1         <= 0;
        exe_op2         <= 0;
        exe_csr_id      <= 0;
        exe_csr_wb_ena  <= 0;        
      end
      else begin
        exe_inst        <= id_inst;
        exe_pc          <= id_pc;
        exe_inst_opcode <= id_inst_opcode;
        exe_mem_op      <= id_mem_op;
        exe_wb_sel      <= id_wb_sel;
        exe_rs2_r_ena   <= id_rs2_r_ena;
        exe_r_data1     <= (id_inst_c_bit == 1'b0 && id_inst_csr_bit == 1'b0) ?  id_r_data1 :
                          ((forward1 == 2'b00)  ? id_r_data1 :
                          ((forward1 == 2'b01) ? exe_alu_data :
                          ((forward1 == 2'b10) ? ((mem_inst_load_bit == 1'b1) ? mem_data_out: mem_alu_data) : 
                          ((forward1 == 2'b11) ? wb_rd_data : 0))));

        exe_r_data2     <= (id_inst_c_bit == 1'b0 && id_inst_s_bit == 1'b0) ?  id_r_data2 :
                          ((forward2 == 2'b00)  ? id_r_data2 :
                          ((forward2 == 2'b01) ? exe_alu_data :
                          ((forward2 == 2'b10) ? ((mem_inst_load_bit == 1'b1) ? mem_data_out: mem_alu_data) : 
                          ((forward2 == 2'b11) ? wb_rd_data : 0))));

        exe_rd_w_ena    <= id_rd_w_ena;
        exe_rd_w_addr   <= id_rd_w_addr;
        exe_op1         <= (id_inst_c_bit == 1'b1 || id_inst_csr_bit == 1'b1) ?  id_op1 :
                          ((forward1 == 2'b00)  ? id_op1 :
                          ((forward1 == 2'b01) ? exe_alu_data :
                          ((forward1 == 2'b10) ? ((mem_inst_load_bit == 1'b1) ? mem_data_out: mem_alu_data) : 
                          ((forward1 == 2'b11) ? wb_rd_data : 0))));

        exe_op2         <= (id_inst_c_bit == 1'b1 || id_inst_s_bit == 1'b1) ?  id_op2 :
                          ((forward2 == 2'b00)  ? id_op2 :
                          ((forward2 == 2'b01) ? exe_alu_data :
                          ((forward2 == 2'b10) ? ((mem_inst_load_bit == 1'b1) ? mem_data_out: mem_alu_data) : 
                          ((forward2 == 2'b11) ? wb_rd_data : 0))));

        exe_csr_id      <= id_csr_id;
        exe_csr_wb_ena  <= id_csr_wb_ena;        
      end
    end
  end
end

assign  csr_wb_data = ( exe_csr_wb_ena == 1'b0 ) ? 0 :
                     (( exe_inst_opcode == `YSYX210243_INST_CSRRW ) ? exe_r_data1 :
                     (( exe_inst_opcode == `YSYX210243_INST_CSRRS ) ? (csr_regs[exe_csr_id] | exe_r_data1) :
                     (( exe_inst_opcode == `YSYX210243_INST_CSRRC ) ? (csr_regs[exe_csr_id] & ~exe_r_data1) :
                     (( exe_inst_opcode == `YSYX210243_INST_CSRRWI ) ? exe_op2 :
                     (( exe_inst_opcode == `YSYX210243_INST_CSRRSI ) ? (csr_regs[exe_csr_id] | exe_op2) :
                     (( exe_inst_opcode == `YSYX210243_INST_CSRRCI ) ? (csr_regs[exe_csr_id] & ~exe_op2) : 0 ))))));

assign exe_csr_wb_data = ( exe_csr_wb_ena == 1'b0 ) ? 0 :
                       ((  csr_type == `YSYX210243_CSR_MSTATUS ) ? {{csr_wb_data[16:15]==2'b11 || csr_wb_data[14:13]==2'b11},csr_wb_data[62:0]} : csr_wb_data);

ysyx_210243_scmp SCMP_SS( .in_a(exe_r_data1) , .in_b(exe_r_data2), .cmp_out(cmp_out_ss));
ysyx_210243_scmp SCMP_SI( .in_a(exe_op1) , .in_b(exe_op2), .cmp_out(cmp_out_si));

//update exe_branch_hazard_bit
always@( * )
begin
  if ( rst == 1'b1 )
  begin
    exe_branch_hazard_bit = 0;
  end
  else begin
    case( exe_inst_opcode )
      `YSYX210243_INST_JALR,`YSYX210243_INST_JAL:  begin exe_branch_hazard_bit  = 1'b1; end //最低位置为零
      `YSYX210243_INST_BEQ:   begin exe_branch_hazard_bit  = exe_r_data1 == exe_r_data2 ; end
      `YSYX210243_INST_BNE:   begin exe_branch_hazard_bit  = exe_r_data1 != exe_r_data2 ; end
      `YSYX210243_INST_BLT:   begin exe_branch_hazard_bit  = cmp_out_ss == 2'b10 ; end
      `YSYX210243_INST_BGE:   begin exe_branch_hazard_bit  = cmp_out_ss == 2'b00 || cmp_out_ss == 2'b01 ; end
      `YSYX210243_INST_BLTU:  begin exe_branch_hazard_bit  = exe_r_data1 < exe_r_data2 ; end
      `YSYX210243_INST_BGEU:  begin exe_branch_hazard_bit  = exe_r_data1 >= exe_r_data2 ; end
      `YSYX210243_INST_ECALL,`YSYX210243_INST_MRET: begin exe_branch_hazard_bit = 1'b1; end
    default:       begin exe_branch_hazard_bit = 0; end
    endcase
  end
end

//median
wire [31 : 0] median_exe_op1= exe_op1[31 : 0];
wire [4  : 0] median_exe_op2= exe_op2[4  : 0];
wire [63 : 0] median_addw   = exe_op1 + exe_op2 ;
wire [63 : 0] median_slliw  = exe_op1 << exe_op2;
wire [31 : 0] median_srliw  = median_exe_op1 >> exe_op2;
wire [63 : 0] median_subw   = exe_op1 - exe_op2;
wire [63 : 0] median_sllw   = exe_op1 << median_exe_op2;
wire [31 : 0] median_srlw   = median_exe_op1 >> median_exe_op2;
wire [31 : 0] median_sraw   = $signed(median_exe_op1) >>> median_exe_op2;

//update exe_alu_data
always@( * )
begin
  if( rst == 1'b1 )
  begin
    exe_alu_data = `YSYX210243_ZERO_WORD;
  end
  else
  begin
    case( exe_inst_opcode )
    `YSYX210243_INST_LUI, `YSYX210243_INST_AUIPC, `YSYX210243_INST_ADDI, `YSYX210243_INST_JAL, `YSYX210243_INST_LB, `YSYX210243_INST_LH, `YSYX210243_INST_LW, `YSYX210243_INST_LBU,
    `YSYX210243_INST_LHU, `YSYX210243_INST_SB, `YSYX210243_INST_SH, `YSYX210243_INST_SW, `YSYX210243_INST_LWU, `YSYX210243_INST_LD, `YSYX210243_INST_SD:
                 begin exe_alu_data = exe_op1 + exe_op2;  end
    `YSYX210243_INST_JALR:  begin exe_alu_data = ( exe_op1 + exe_op2 )&64'hffffffff_fffffffe; end //最低位置为零
    `YSYX210243_INST_BEQ:   begin exe_alu_data = ( exe_r_data1 == exe_r_data2 ) ? exe_op1 + exe_op2 : exe_op1 + 64'd4; end
    `YSYX210243_INST_BNE:   begin exe_alu_data = ( exe_r_data1 != exe_r_data2 ) ? exe_op1 + exe_op2 : exe_op1 + 64'd4; end
    `YSYX210243_INST_BLT:   begin exe_alu_data = ( cmp_out_ss == 2'b10 ) ? exe_op1 + exe_op2 : exe_op1 + 64'd4; end
    `YSYX210243_INST_BGE:   begin exe_alu_data = ( cmp_out_ss == 2'b00 || cmp_out_ss == 2'b01 ) ? exe_op1 + exe_op2 : exe_op1 + 64'd4; end
    `YSYX210243_INST_BLTU:  begin exe_alu_data = ( exe_r_data1 < exe_r_data2 ) ? exe_op1 + exe_op2 : exe_op1 + 64'd4; end
    `YSYX210243_INST_BGEU:  begin exe_alu_data = ( exe_r_data1 >= exe_r_data2 ) ? exe_op1 + exe_op2 : exe_op1 + 64'd4; end
    `YSYX210243_INST_SLTI:  begin exe_alu_data = ( cmp_out_si == 2'b10 ) ? 64'b1 : 64'b0; end
    `YSYX210243_INST_SLTIU: begin exe_alu_data = ( exe_op1 < exe_op2 ) ? 64'b1 : 64'b0; end
    `YSYX210243_INST_XORI:  begin exe_alu_data = exe_op1 ^ exe_op2; end
    `YSYX210243_INST_ORI:   begin exe_alu_data = exe_op1 | exe_op2; end
    `YSYX210243_INST_ANDI:  begin exe_alu_data = exe_op1 & exe_op2; end
    `YSYX210243_INST_SLLI:  begin exe_alu_data = exe_op1 << exe_op2; end
    `YSYX210243_INST_SRLI:  begin exe_alu_data = exe_op1 >> exe_op2; end
    `YSYX210243_INST_SRAI:  begin exe_alu_data = exe_op1 >>> exe_op2; end
    `YSYX210243_INST_ADD:   begin exe_alu_data = exe_op1 + exe_op2; end
    `YSYX210243_INST_SUB:   begin exe_alu_data = exe_op1 - exe_op2; end
    `YSYX210243_INST_SLL:   begin exe_alu_data = exe_op1 << exe_op2[5:0]; end
    `YSYX210243_INST_SLT:   begin exe_alu_data = ( cmp_out_ss == 2'b10 ) ? 64'b1 : 64'b0; end
    `YSYX210243_INST_SLTU:  begin exe_alu_data = ( exe_r_data1 < exe_r_data2 ) ? 64'b1 : 64'b0; end 
    `YSYX210243_INST_XOR:   begin exe_alu_data = exe_op1 ^ exe_op2; end
    `YSYX210243_INST_SRL:   begin exe_alu_data = exe_op1 >> exe_op2[5:0]; end
    `YSYX210243_INST_SRA:   begin exe_alu_data = exe_op1 >>> exe_op2[5:0]; end
    `YSYX210243_INST_OR:    begin exe_alu_data = exe_op1 | exe_op2; end
    `YSYX210243_INST_AND:   begin exe_alu_data = exe_op1 & exe_op2; end
    `YSYX210243_INST_ADDIW, `YSYX210243_INST_ADDW: begin exe_alu_data = { {32{median_addw[31]}} , median_addw[31 : 0] }; end
	  `YSYX210243_INST_SLLIW: begin exe_alu_data = { {32{median_slliw[31]}} , median_slliw[31 : 0]}; end
    `YSYX210243_INST_SRLIW: begin exe_alu_data = { {32{median_srliw[31]}} , median_srliw}; end
    `YSYX210243_INST_SRAIW: begin exe_alu_data = { {32{ exe_op1[31] }}    , {$signed(exe_op1 [31:0]) >>> exe_op2}}; end
    `YSYX210243_INST_SUBW:  begin exe_alu_data = { {32{median_subw[31]}}  , median_subw[31 : 0] }; end 
    `YSYX210243_INST_SLLW:  begin exe_alu_data = { {32{median_sllw[31] }} , median_sllw[31 : 0]}; end 
    `YSYX210243_INST_SRLW:  begin exe_alu_data = { {32{median_srlw[31] }} , median_srlw[31 : 0]}; end 
    `YSYX210243_INST_SRAW:  begin exe_alu_data = { {32{median_sraw[31] }} , median_sraw[31 : 0]}; end

    `YSYX210243_INST_CSRRW: begin exe_alu_data = csr_regs[exe_csr_id]; end
    `YSYX210243_INST_CSRRS: begin exe_alu_data = csr_regs[exe_csr_id]; end 
    `YSYX210243_INST_CSRRC: begin exe_alu_data = csr_regs[exe_csr_id]; end 
    `YSYX210243_INST_CSRRWI: begin exe_alu_data = csr_regs[exe_csr_id]; end
    `YSYX210243_INST_CSRRSI: begin exe_alu_data = csr_regs[exe_csr_id]; end  
    `YSYX210243_INST_CSRRCI: begin exe_alu_data = csr_regs[exe_csr_id]; end
    `YSYX210243_INST_ECALL:  begin exe_alu_data = csr_regs[`YSYX210243_CSR_MTVEC_USR]; end
    `YSYX210243_INST_MRET:   begin exe_alu_data = csr_regs[`YSYX210243_CSR_MEPC_USR]; end
    default:     begin exe_alu_data = `YSYX210243_ZERO_WORD; end
	endcase
  end
end
endmodule

//@module: 有符号数的比较
//@input:  64位的两个输入
//@output: 输出结果,00:相等; 01: a>b; 10: a<b
module ysyx_210243_scmp(
  input wire[`YSYX210243_REG_BUS] in_a,
  input wire[`YSYX210243_REG_BUS] in_b,
  output reg[1:0] cmp_out //always块中不能给wire赋值
);
  always @(*) begin
    if( in_a == in_b ) cmp_out = 2'b00; //a,b相等
    else begin  //a,b不等
      if( in_a[`YSYX210243_BUS_LEN - 1] == 1'b0 && in_b[`YSYX210243_BUS_LEN - 1] == 1'b0 )begin         //a,b均为正数
        cmp_out = ( in_a > in_b) ? 2'b01 : 2'b10;
      end
      else if( in_a[`YSYX210243_BUS_LEN - 1] == 1'b1 && in_b[`YSYX210243_BUS_LEN - 1] == 1'b1 )begin    //a,b均为负数
        cmp_out = ( in_a > in_b) ? 2'b01 : 2'b10;
      end
      else if ( in_a[`YSYX210243_BUS_LEN - 1] == 1'b0 && in_b[`YSYX210243_BUS_LEN - 1] == 1'b1 ) begin  //a正b负
        cmp_out = 2'b01;
      end
      else if ( in_a[`YSYX210243_BUS_LEN - 1] == 1'b1 && in_b[`YSYX210243_BUS_LEN - 1] == 1'b0 ) begin  //a负b正
        cmp_out = 2'b10;
      end
      else cmp_out = 2'b11; //异常情况
    end
  end
endmodule



//@file:                mem_stage.v
//@author:              Zhong WuJie
module ysyx_210243_mem_stage (
    input wire clk,
    input wire rst,

    input wire [31 : 0]         exe_inst,
    input wire [`YSYX210243_REG_BUS]       exe_pc,
    input wire [8 : 0]          exe_inst_opcode,
    
    input wire [`YSYX210243_REG_BUS]       exe_alu_data,       //alu data

    input wire [1 : 0]          exe_mem_op,
    input wire [1 : 0]          exe_wb_sel,
    input wire                  clint,

    input wire                  exe_rs2_r_ena,
    input wire [`YSYX210243_REG_BUS]       exe_r_data2,
    input wire                  exe_rd_w_ena,
    input wire [4 : 0]          exe_rd_w_addr,

    input wire [`YSYX210243_REG_BUS]       exe_csr_wb_data,
    input wire [`YSYX210243_CSR_ID_NUM-1:0]exe_csr_id,
    input wire                  exe_csr_wb_ena,

    input wire                  mem_hs,
    input wire                  if_hs,
    input wire [`YSYX210243_REG_BUS]       mem_data_read,

    output reg [31 : 0]         mem_inst,
    output reg [`YSYX210243_REG_BUS]       mem_pc,
    output reg [8 : 0]          mem_inst_opcode,

    output reg [1 : 0]          mem_mem_op,         //control signals
    output reg [1 : 0]          mem_wb_sel,

    output reg  [`YSYX210243_REG_BUS]      mem_data_out,
    output wire [`YSYX210243_REG_BUS]      mem_data_write,     //如果没有使能, reg等待
    
    output wire [`YSYX210243_REG_BUS]      mem_addr,
    output wire [7:0]           mem_strb,
    output wire [1:0]           mem_size,

    output reg [`YSYX210243_REG_BUS]       mem_alu_data,

    output reg [`YSYX210243_REG_BUS]       mem_r_data2,
    output reg                  mem_rd_w_ena,
    output reg [4 : 0]          mem_rd_w_addr,

    output reg [`YSYX210243_REG_BUS]       mem_csr_wb_data,
    output reg[`YSYX210243_CSR_ID_NUM-1:0] mem_csr_id,
    output reg                  mem_csr_wb_ena
);
reg                  mem_rs2_r_ena;
reg                  mem_mtime_mtimecmp_bit;
wire exe_mtime_mtimecmp_bit = (exe_inst_opcode == `YSYX210243_INST_SD || exe_inst_opcode == `YSYX210243_INST_LD) && (exe_alu_data == `YSYX210243_MMIO_MTIME_ADDR || exe_alu_data == `YSYX210243_MMIO_MTIMECMP_ADDR);
//update registers
always @(posedge clk) begin
    if (rst) begin
        mem_inst        <= 0;
        mem_pc          <= 0;
        mem_inst_opcode <= 0;
        mem_mem_op      <= 0;
        mem_wb_sel      <= 0;
        mem_alu_data    <= 0;
        mem_rs2_r_ena   <= 0;
        mem_r_data2     <= 0;
        mem_rd_w_ena    <= 0;
        mem_rd_w_addr   <= 0;
        mem_csr_wb_data <= 0;
        mem_csr_id      <= 0;
        mem_csr_wb_ena  <= 0;
        mem_mtime_mtimecmp_bit <= 0;
  end
  else begin
    if (if_hs) begin
        if(clint)begin
            mem_inst        <= 0;
            mem_pc          <= 0;
            mem_inst_opcode <= 0;
            mem_mem_op      <= 0;
            mem_wb_sel      <= 0;
            mem_alu_data    <= 0;
            mem_rs2_r_ena   <= 0;
            mem_r_data2     <= 0;
            mem_rd_w_ena    <= 0;
            mem_rd_w_addr   <= 0;
            mem_csr_wb_data <= 0;
            mem_csr_id      <= 0;
            mem_csr_wb_ena  <= 0;
            mem_mtime_mtimecmp_bit <= 0;
        end
        else begin
            mem_inst        <= exe_inst;
            mem_pc          <= exe_pc;
            mem_inst_opcode <= exe_inst_opcode;
            mem_mem_op      <= (exe_mtime_mtimecmp_bit == 1'b1) ? 0 : exe_mem_op;
            mem_wb_sel      <= exe_wb_sel;
            mem_alu_data    <= exe_alu_data;
            mem_rs2_r_ena   <= exe_rs2_r_ena;
            mem_r_data2     <= exe_r_data2;
            mem_rd_w_ena    <= exe_rd_w_ena;
            mem_rd_w_addr   <= exe_rd_w_addr;
            mem_csr_wb_data <= exe_csr_wb_data;
            mem_csr_id      <= exe_csr_id;
            mem_csr_wb_ena  <= exe_csr_wb_ena;
            mem_mtime_mtimecmp_bit <= exe_mtime_mtimecmp_bit;
        end
    end
  end
end

reg mem_data_en_inst;

assign mem_addr = ( rst == 1'b1 ) ? 0 :
                  (( mem_mtime_mtimecmp_bit == 1'b1 ) ? mem_alu_data :
                  (( mem_mem_op == 2'b01 || mem_mem_op == 2'b10 ) ? mem_alu_data : 0 ));

assign mem_data_write = ( rst == 1'b1 ) ? 0 : //mem_r_data2;
                        (( mem_rs2_r_ena == 1'b1 && mem_mem_op == 2'b10 ) ? mem_r_data2 << (64'd8*mem_addr[2:0]) : 0 );

assign mem_size = ( rst == 1'b1 ) ? 0 :
                  (( mem_inst_opcode == `YSYX210243_INST_LB || mem_inst_opcode == `YSYX210243_INST_LBU || mem_inst_opcode == `YSYX210243_INST_SB ) ? `YSYX210243_SIZE_B : 
                  (( mem_inst_opcode == `YSYX210243_INST_LH || mem_inst_opcode == `YSYX210243_INST_LHU || mem_inst_opcode == `YSYX210243_INST_SH ) ? `YSYX210243_SIZE_H :
                  (( mem_inst_opcode == `YSYX210243_INST_LW || mem_inst_opcode == `YSYX210243_INST_LWU || mem_inst_opcode == `YSYX210243_INST_SW ) ? `YSYX210243_SIZE_W :
                  (( mem_inst_opcode == `YSYX210243_INST_LD || mem_inst_opcode == `YSYX210243_INST_SD ) ? `YSYX210243_SIZE_D : 0 ))));

assign mem_strb = ( rst == 1'b1 ) ? 0 :
                  (( mem_inst_opcode == `YSYX210243_INST_SB ) ? (8'b0000_0001) << mem_addr[2:0] :
                  (( mem_inst_opcode == `YSYX210243_INST_SH ) ? (8'b0000_0011) << mem_addr[2:0] :
                  (( mem_inst_opcode == `YSYX210243_INST_SW ) ? (8'b0000_1111) << mem_addr[2:0] :
                  (( mem_inst_opcode == `YSYX210243_INST_SD ) ? 8'b1111_1111 : 0 ))));

//read mem
always @(*) begin
    if( rst == 1'b1) begin
        mem_data_out = 64'b0;
    end
    else begin
        if(mem_data_en_inst)
            case (mem_inst_opcode)
                `YSYX210243_INST_LB:  begin mem_data_out = {{56{mem_data_read[7]}},mem_data_read[7:0]}; end
                `YSYX210243_INST_LH:  begin mem_data_out = {{48{mem_data_read[15]}},mem_data_read[15:0]}; end
                `YSYX210243_INST_LW:  begin mem_data_out = {{32{mem_data_read[31]}},mem_data_read[31:0]}; end
                `YSYX210243_INST_LBU: begin mem_data_out = {{56{1'b0}},mem_data_read[7:0]}; end
                `YSYX210243_INST_LHU: begin mem_data_out = {{48{1'b0}},mem_data_read[15:0]}; end
                `YSYX210243_INST_LWU: begin mem_data_out = {32'b0, mem_data_read[31:0]}; end
                `YSYX210243_INST_LD:  begin mem_data_out = mem_data_read;end
                default: begin mem_data_out = 64'b0; end
            endcase
        else begin
            mem_data_out = 64'b0;
        end
    end
end

always @(posedge clk) begin
    if(rst) begin
        mem_data_en_inst <= 1'b0;
    end
    else begin
        if(mem_hs) mem_data_en_inst <= 1'b1;
        if(if_hs) mem_data_en_inst <= 1'b0;
    end
end

endmodule

//@file:                wb_stage.v
//@author:              Zhong WuJie
module ysyx_210243_wb_stage (
    input wire clk,
    input wire rst,

    input wire  [31 : 0]        mem_inst,
    input wire  [`YSYX210243_REG_BUS]      mem_pc,
    input wire  [8 : 0]         mem_inst_opcode,
    
    input wire  [`YSYX210243_REG_BUS]      mem_alu_data,

    input wire  [1:0]           mem_wb_sel,
    input wire                  clint,
    input wire  [`YSYX210243_REG_BUS]      mem_data_out,

    input wire  [`YSYX210243_REG_BUS]      mem_addr,
    input wire                  if_hs,

    input wire  [`YSYX210243_REG_BUS]      mtime,

    input wire  [`YSYX210243_REG_BUS]      mem_r_data2,
    input wire                  mem_rd_w_ena,
    input wire  [4 : 0]         mem_rd_w_addr,

    input wire  [`YSYX210243_REG_BUS]      mem_csr_wb_data,
    input wire  [`YSYX210243_CSR_ID_NUM-1:0] mem_csr_id,
    input wire                  mem_csr_wb_ena,

    output reg  [`YSYX210243_REG_BUS]      wb_pc,
    output reg  [8 : 0]         wb_inst_opcode,

    output reg  [`YSYX210243_REG_BUS]      wb_r_data2,
    output reg                  wb_rd_w_ena,
    output reg  [4 : 0]         wb_rd_w_addr,

    output reg  [`YSYX210243_REG_BUS]      wb_csr_wb_data,
    output reg  [`YSYX210243_CSR_ID_NUM-1:0] wb_csr_id,
    output reg                  wb_csr_wb_ena,

    output reg  [`YSYX210243_REG_BUS]      wb_mem_addr,

    output wire                 wb_ena,
    output wire                 wb_next_ena,

    output reg[`YSYX210243_REG_BUS]        wb_rd_data         //wire类型不能在always块中赋值
);
reg  [1:0]           wb_wb_sel;
reg  [`YSYX210243_REG_BUS]     wb_alu_data;
reg  [`YSYX210243_REG_BUS]     wb_mem_data_out;
reg  [31 : 0]       wb_inst;
assign wb_ena = (wb_pc != 0) && (wb_inst != 0);                      //wb阶段有数据
assign wb_next_ena  = (mem_pc != 0) && (mem_inst != 0);              //下一个wb阶段有数据

//update registers
always @(posedge clk) begin
    if (rst) begin
      wb_inst           <= 0;
      wb_pc             <= 0;
      wb_inst_opcode    <= 0;
      wb_r_data2        <= 0;
      wb_rd_w_ena       <= 0;
      wb_rd_w_addr      <= 0;
      wb_csr_wb_data    <= 0;
      wb_csr_id         <= 0;
      wb_csr_wb_ena     <= 0;
      wb_mem_addr       <= 0;
      wb_wb_sel         <= 0;
      wb_alu_data       <= 0;
      wb_mem_data_out   <= 0;
  end
  else begin
    if (if_hs) begin
      if(clint)begin
        wb_inst           <= 0;
        wb_pc             <= 0;
        wb_inst_opcode    <= 0;
        wb_r_data2        <= 0;
        wb_rd_w_ena       <= 0;
        wb_rd_w_addr      <= 0;
        wb_csr_wb_data    <= 0;
        wb_csr_id         <= 0;
        wb_csr_wb_ena     <= 0;
        wb_mem_addr       <= 0;
        wb_wb_sel         <= 0;
        wb_alu_data       <= 0;
        wb_mem_data_out   <= 0;
      end
      else begin
        wb_inst           <= mem_inst;
        wb_pc             <= mem_pc;
        wb_inst_opcode    <= mem_inst_opcode;
        wb_r_data2        <= mem_r_data2;
        wb_rd_w_ena       <= mem_rd_w_ena;
        wb_rd_w_addr      <= mem_rd_w_addr;
        wb_csr_wb_data    <= mem_csr_wb_data;
        wb_csr_id         <= mem_csr_id;
        wb_csr_wb_ena     <= mem_csr_wb_ena;
        wb_mem_addr       <= mem_addr;
        wb_wb_sel         <= mem_wb_sel;
        wb_alu_data       <= mem_alu_data;
        wb_mem_data_out   <= mem_data_out;
      end
    end
  end
end

always@(*)begin
    if(rst == 1'b1)begin
        wb_rd_data = `YSYX210243_ZERO_WORD;
    end
    else begin
       case(wb_wb_sel)
            2'b01:   wb_rd_data = wb_alu_data;
            2'b10:   wb_rd_data = wb_pc + 4;
            2'b11:   wb_rd_data = ( wb_inst_opcode == `YSYX210243_INST_LD && wb_mem_addr == `YSYX210243_MMIO_MTIME_ADDR ) ? mtime : wb_mem_data_out;
            default: wb_rd_data = `YSYX210243_ZERO_WORD;
        endcase
    end
end

endmodule

//@file:                regfile.v
//@author:              Zhong WuJie
module ysyx_210243_regfile(
    input  wire 					clk,
	input  wire 					rst,

	input  wire [`YSYX210243_REG_BUS] 			wb_pc,
	input  wire [8 : 0]				wb_inst_opcode,
	
	input  wire						wb_ena,					
	input  wire   					wb_next_ena,

	input  wire  					if_hs,

	input  wire [`YSYX210243_REG_BUS] 			wb_mem_addr,

	input  wire [`YSYX210243_REG_BUS]			csr_wb_data,
	input  wire [`YSYX210243_CSR_ID_NUM-1 : 0]	csr_id,
	input  wire 					csr_wb_ena,
	
	input  wire  [4  : 0] 			r_addr1,
	output reg   [`YSYX210243_REG_BUS] 		r_data1,
	input  wire 		  			r_ena1,
	input  wire  [4  : 0] 			r_addr2,
	output reg   [`YSYX210243_REG_BUS] 		r_data2,
	input  wire 		  			r_ena2,
	input  wire  [4  : 0] 			w_addr,							//rs1,rs2,rd
	input  wire  [`YSYX210243_REG_BUS] 		w_data,
	input  wire 		  			w_ena,	
	input  wire  [`YSYX210243_REG_BUS] 		wb_r_data2,

	output wire 					clint, 
	output reg   [`YSYX210243_REG_BUS] 			mtime,	
	output wire  [64*`YSYX210243_CSR_REGS_NUM - 1 : 0] csr_regs_o
);
  //csr regs
  reg 	[`YSYX210243_REG_BUS] 			csr_regs[0 : `YSYX210243_CSR_REGS_NUM-1];
  genvar i;
  generate
    for (i = 0; i < `YSYX210243_CSR_REGS_NUM; i = i + 1) begin : generate_block_regfile
      assign csr_regs_o[(i+1)*64-1:i*64] = csr_regs[i];
    end
	endgenerate
	// the special handle of mstatus
	reg				mstatus_bit;
	wire [`YSYX210243_REG_BUS] mstatus 		= csr_regs[`YSYX210243_CSR_MSTATUS_USR];
	wire 			mstatus_mie 	= mstatus[3];
	wire 			mstatus_mpie	= mstatus[7];
	wire [1:0]		mstatus_fs		= mstatus[14:13];
	wire [1:0]		mstatus_xs		= mstatus[16:15];
	wire			mstatus_sd		= mstatus_fs == 2'b11 || mstatus_xs == 2'b11;

	reg 	clint_begin;
	reg 	clint_end;
	assign 	clint = clint_begin > clint_end;

  // 32 registers
	reg [`YSYX210243_REG_BUS] 	regs[0 : 31];
	reg [`YSYX210243_REG_BUS] 	mtimecmp;

	always @(posedge clk) 
	begin
		if ( rst == 1'b1 ) 
		begin
			regs[ 0] <= `YSYX210243_ZERO_WORD;
			regs[ 1] <= `YSYX210243_ZERO_WORD;
			regs[ 2] <= `YSYX210243_ZERO_WORD;
			regs[ 3] <= `YSYX210243_ZERO_WORD;
			regs[ 4] <= `YSYX210243_ZERO_WORD;
			regs[ 5] <= `YSYX210243_ZERO_WORD;
			regs[ 6] <= `YSYX210243_ZERO_WORD;
			regs[ 7] <= `YSYX210243_ZERO_WORD;
			regs[ 8] <= `YSYX210243_ZERO_WORD;
			regs[ 9] <= `YSYX210243_ZERO_WORD;
			regs[10] <= `YSYX210243_ZERO_WORD;
			regs[11] <= `YSYX210243_ZERO_WORD;
			regs[12] <= `YSYX210243_ZERO_WORD;
			regs[13] <= `YSYX210243_ZERO_WORD;
			regs[14] <= `YSYX210243_ZERO_WORD;
			regs[15] <= `YSYX210243_ZERO_WORD;
			regs[16] <= `YSYX210243_ZERO_WORD;
			regs[17] <= `YSYX210243_ZERO_WORD;
			regs[18] <= `YSYX210243_ZERO_WORD;
			regs[19] <= `YSYX210243_ZERO_WORD;
			regs[20] <= `YSYX210243_ZERO_WORD;
			regs[21] <= `YSYX210243_ZERO_WORD;
			regs[22] <= `YSYX210243_ZERO_WORD;
			regs[23] <= `YSYX210243_ZERO_WORD;
			regs[24] <= `YSYX210243_ZERO_WORD;
			regs[25] <= `YSYX210243_ZERO_WORD;
			regs[26] <= `YSYX210243_ZERO_WORD;
			regs[27] <= `YSYX210243_ZERO_WORD;
			regs[28] <= `YSYX210243_ZERO_WORD;
			regs[29] <= `YSYX210243_ZERO_WORD;
			regs[30] <= `YSYX210243_ZERO_WORD;
			regs[31] <= `YSYX210243_ZERO_WORD;
		end
		else 
		begin
			if ((w_ena == 1'b1) && (w_addr != 5'h00))	begin
				if(if_hs == 1'b1 & clint != 1'b1 & wb_ena) regs[w_addr] <= w_data;
			end
				
			// if (inst == 32'h7b && if_hs == 1'b1) $write("%c",regs[10]);
		end
	end
	
	always @(*) begin
		if (rst == 1'b1)
			r_data1 = `YSYX210243_ZERO_WORD;
		else if (r_ena1 == 1'b1)
			r_data1 = regs[r_addr1];
		else
			r_data1 = `YSYX210243_ZERO_WORD;
	end
	
	always @(*) begin
		if (rst == 1'b1)
			r_data2 = `YSYX210243_ZERO_WORD;
		else if (r_ena2 == 1'b1)
			r_data2 = regs[r_addr2];
		else
			r_data2 = `YSYX210243_ZERO_WORD;
	end

	//update csrs
	always@( posedge clk )
	begin
		if( rst == 1'b1 )
		begin
			csr_regs[`YSYX210243_CSR_MSTATUS_USR]	<= `YSYX210243_CSR_MSTATUS_INIT_VALUE;
			csr_regs[`YSYX210243_CSR_MTVEC_USR]	<= `YSYX210243_CSR_MTVEC_INIT_VALUE;
			csr_regs[`YSYX210243_CSR_MEPC_USR]		<= `YSYX210243_CSR_MEPC_INIT_VALUE;
			csr_regs[`YSYX210243_CSR_MCAUSE_USR]	<= `YSYX210243_CSR_MCAUSE_INIT_VALUE;
			csr_regs[`YSYX210243_CSR_MCYCLE_USR]	<= `YSYX210243_CSR_MCYCLE_INIT_VALUE;
			csr_regs[`YSYX210243_CSR_MIE_USR] 		<= `YSYX210243_CSR_MIE_INIT_VALUE;
			csr_regs[`YSYX210243_CSR_MIP_USR] 		<= `YSYX210243_CSR_MIP_INIT_VALUE;
			csr_regs[`YSYX210243_CSR_MSCRATCH_USR] <= `YSYX210243_CSR_MSCRATCH_INIT_VALUE;
			csr_regs[`YSYX210243_CSR_MHARTID_USR]  <= `YSYX210243_CSR_MHARTID_INIT_VALUE;	
			mstatus_bit <= 1'b0;		
		end
		else
		begin
			if (csr_wb_ena == 1'b1 && if_hs == 1'b1 && clint != 1'b1 && csr_id == `YSYX210243_CSR_MCYCLE_USR)
			begin csr_regs[csr_id] <= csr_wb_data; end
			else begin csr_regs[`YSYX210243_CSR_MCYCLE_USR] <= csr_regs[`YSYX210243_CSR_MCYCLE_USR] + 64'b1; end		//只要不给mcycle赋值, mcycle就自动+1
			if (csr_wb_ena == 1'b1 && if_hs == 1'b1 && clint != 1'b1 && csr_id != `YSYX210243_CSR_MCYCLE_USR) csr_regs[csr_id] <= csr_wb_data;
			if (if_hs) mstatus_bit <= 1'b0;
			case (wb_inst_opcode)
				`YSYX210243_INST_ECALL: 	
							begin 	
								if(mstatus_bit == 1'b0)begin
									csr_regs[`YSYX210243_CSR_MEPC_USR] <= wb_pc;
									csr_regs[`YSYX210243_CSR_MCAUSE_USR] <= 64'd11;
									csr_regs[`YSYX210243_CSR_MSTATUS_USR] <= { mstatus_sd,mstatus[62:13],2'b11,mstatus[10:8],mstatus_mie,mstatus[6:4],1'b0,mstatus[2:0] }; //set MIE 0
									mstatus_bit <= 1'b1;
								end
							end 
				`YSYX210243_INST_MRET:		
							begin 	
								if(mstatus_bit == 1'b0)begin
									csr_regs[`YSYX210243_CSR_MSTATUS_USR] <= { mstatus_sd,mstatus[62:13],2'b00,mstatus[10:8],1'b1,mstatus[6:4],mstatus_mpie,mstatus[2:0] }; //for interrupt																		
									mstatus_bit <= 1'b1;
								end
							end 	
				default:; 
			endcase
			if( clint == 1'b1  && mstatus_bit == 1'b0) begin
					csr_regs[`YSYX210243_CSR_MEPC_USR] <= wb_pc;
					csr_regs[`YSYX210243_CSR_MCAUSE_USR] <= `YSYX210243_CSR_MCAUSE_INTERRUPT_VALUE;
					csr_regs[`YSYX210243_CSR_MSTATUS_USR] <= { mstatus_sd,mstatus[62:13],2'b11,mstatus[10:8],mstatus_mie,mstatus[6:4],1'b0,mstatus[2:0] }; //for interrupt
					mstatus_bit <= 1'b1;
				end
		end			
	end
	
	//clint
	always @(posedge clk)begin
		if( rst == 1'b1 )begin
			mtime <= 0;
			mtimecmp <= 200000;
      clint_end <= 0;
			clint_begin <= 0;	
		end
		else begin
			mtime <= mtime + 64'd1;
			if(mtime > mtimecmp && csr_regs[`YSYX210243_CSR_MIE_USR] == `YSYX210243_CSR_MIE_INTERRUPT_VALUE && mstatus_mie == 1'b1 && wb_next_ena == 1'b1) begin 
				if(if_hs) clint_begin <= 1'b1;
			end
      if(clint_begin && if_hs) clint_end <= 1'b1;
      if(wb_inst_opcode == `YSYX210243_INST_MRET)  begin
        clint_end <= 1'b0;
        clint_begin <= 1'b0;
      end
			if( wb_inst_opcode == `YSYX210243_INST_SD && wb_mem_addr == `YSYX210243_MMIO_MTIMECMP_ADDR )begin
					mtimecmp <= wb_r_data2;
			end
		end
	end

endmodule

